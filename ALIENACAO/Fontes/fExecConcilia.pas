{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	   Executa a Conciliação das parcelas pagas

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  10/10/2001
	Data de Término   :

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Retirados os parâmetros em desuso na chamada da função
              'UltimoFechamento'...
--------------------------------------------------------------------------------
Pendência       :
Responsável     : Marcio Motta
Data de Início  : 13/01/2004
Data de Término : 14/01/2004
Descrição       : Modificação no cadastro de Multas e Juros para aceitar
                  períodos de Vigência diferenciados - Mestre / Detalhe.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecConcilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, mResponsavel, wwdbdatetimepicker, CMDateTimePicker,
  fcButton, fcImgBtn, fcShapeBtn, mComprador, mProposta, fcLabel, ppDB,
  ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppRegion, fPreview, fProgresso,
  mAdministradora, DBClient, uCMClientDataSet, UComunsImobiliarioDB, uCtrlContratoImovel, uModuloImobiliario,
  uCtrlOperImob, uCtrlModuloImobiliario, uCtrlParamIntegra, uCtrlPadroes,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;



type
  TfrmExecConcilia = class(TfrmSairAjudaImob)
    ntbConcilia: TNotebook;
    lblTitulo: TfcLabel;
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    btnContinua1: TfcShapeBtn;
    GroupBox1: TGroupBox;
    cbGerada: TCheckBox;
    cbSinal: TCheckBox;
    cbAmort: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    molResponsavel1: TmolResponsavel;
    GroupBox3: TGroupBox;
    edtDataProc: TCMDateTimePicker;
    Panel1: TPanel;
    btnSeleciona: TSpeedButton;
    btnLimpa: TSpeedButton;
    btnContinua2: TfcShapeBtn;
    btnCancela2: TfcShapeBtn;
    Panel4: TPanel;
    grdParc: TwwDBGrid;
    dsParc: TwwDataSource;
    qryParc: TwwQuery;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcRAZAOSOCIAL: TStringField;
    qryParcNUMCONTRATO: TStringField;
    qryParcCAL_TIPO: TStringField;
    qryParcNOMECONTRATO: TStringField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcNOMEMESTRE: TStringField;
    qryParcNUMPARCELA: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDPESSOA: TFloatField;
    qryParcPLNCODIGO: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    qryUpdConcilia: TwwQuery;
    qryUpdParc: TwwQuery;
    qryParcFLGNAOCONCILIADO: TFloatField;
    qryParcDATABAIXA: TDateTimeField;
    qryParcVALORPAGO: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    pDiverge: TPanel;
    grdDiverge: TwwDBGrid;
    Panel3: TPanel;
    sbImprime: TSpeedButton;
    btnCancelar3: TfcShapeBtn;
    qryDiverge: TwwQuery;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField6: TStringField;
    dsDiverge: TwwDataSource;
    qryParcCHKINTEGRA: TFloatField;
    qryDivergeDATABAIXA: TDateTimeField;
    qryDivergeVLRPAGO: TFloatField;
    qryDivergeVLRMULTAATRASO: TFloatField;
    qryDivergeVLRMORAATRASO: TFloatField;
    qryDivergeDIASDIF: TFloatField;
    qryDivergeVLRDIF: TFloatField;
    rpDiverge: TppReport;
    HeaderBand1: TppHeaderBand;
    lblRptTitulo: TppLabel;
    LblEmpresa: TppLabel;
    DetailBand1: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    pplDiverge: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel12: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    qryDivergeDATALIMITE: TDateTimeField;
    qryParcIDCIDADES: TFloatField;
    qryParcIDPAIS: TFloatField;
    qryParcCODESTADO: TStringField;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    qryDivergeCHKBOLETO: TFloatField;
    sbBoleto: TSpeedButton;
    qryDivergeIDPESSOA: TFloatField;
    qryDivergeRAZAOSOCIAL: TStringField;
    qryDivergeNUMCONTRATO: TStringField;
    qryDivergeIDCONDPAGIMOVEL: TFloatField;
    cbExtra: TCheckBox;
    cbVista: TCheckBox;
    sbAbona: TSpeedButton;
    qryDivergeCODDOCUMENTO: TFloatField;
    updDiverge: TUpdateSQL;
    qryDivergeFLGCONCILIADO: TStringField;
    qryDivergeVLRCORRIG: TFloatField;
    qryDivergeVLRPRESTCORRIG: TFloatField;
    qryDivergeVLRMULTACORRIG: TFloatField;
    qryDivergeVLRJUROSCORRIG: TFloatField;
    qryDivergeCODTIPIMOVEL: TStringField;
    qryDivergeFLGTIPOLANC: TFloatField;
    gbDiverg: TGroupBox;
    edtDataAtualiza: TCMDateTimePicker;
    qryDivergeIDPARCFINANCIMOV: TFloatField;
    cbAntec: TCheckBox;
    qryDivergeIDCONTRATOIMOVEL: TFloatField;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBCalc2: TppDBCalc;
    qryDivergeVLRCMCORRIG: TFloatField;
    cbRecalculo: TCheckBox;
    cbExcluiAbono: TCheckBox;
    qryParcFLGCONCILIADO: TStringField;
    qryParcIDPARCDIVERGE: TFloatField;
    qryDivergeVLRPRESTACAO: TFloatField;
    qryParcSTATUS: TFloatField;
    qryDivergeSTATUS: TFloatField;
    qryDivergeDSC_STATUS: TStringField;
    qryDivergeSALDO_DOC: TFloatField;
    qryDivergeVLRCMATRASO: TFloatField;
    molAdministradora1: TmolAdministradora;
    updParc: TUpdateSQL;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryTeste: TwwQuery;
    bbSaldo: TButton;
    cbSoPagas: TCheckBox;
    sbMarcaTudo: TSpeedButton;
    sbDesmarcaTudo: TSpeedButton;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure ntbConciliaPageChanged(Sender: TObject);
    procedure btnContinua1Click(Sender: TObject);
    procedure btnCancela2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure molResponsavel1btnBuscaRespClick(Sender: TObject);
    procedure molComprador1btnBuscaFornClick(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure btnContinua2Click(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure grdParcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdDivergeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdParcTopRowChanged(Sender: TObject);
    procedure sbImprimeClick(Sender: TObject);
    procedure rpDivergeBeforePrint(Sender: TObject);
    procedure sbBoletoClick(Sender: TObject);
    procedure grdParcDblClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure grdDivergeDblClick(Sender: TObject);
    procedure sbAbonaClick(Sender: TObject);
    procedure cbExcluiAbonoClick(Sender: TObject);
    procedure cbRecalculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbSaldoClick(Sender: TObject);
    procedure sbMarcaTudoClick(Sender: TObject);
    procedure sbDesmarcaTudoClick(Sender: TObject);

  private
//--- Início --- 13/01/2004 ---- Marcio Motta ---- Pendência: 15799 --------------------------------
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    ComunsImobiliarioDB : TComunsImobiliarioDB;
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

    // Vinicius - 14/03/2006 - Simulação de atualização de inadimplencia
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344

    procedure Sel;                                            // Abre tabela com as parcelas pagas e não coinciliadas
    procedure AbreDivergencias;                               // Abre tabela com divergencia de pagamento
    procedure ConciliaDocumentos;                             // Executa a conciliação
    function  MotivoAbono(var sMotivo: string): Boolean;      // Grava Abono
    function  ParcelaAbonada(const iParcela:Integer):Boolean; // Verifica se a parcela foi abonada
    function  PossuiItens : Boolean;                          // Verifica se algum item de divergencia
                                                              // foi selecionado para abono ou geração de boleto
    procedure Progresso (vParams: array of variant);
    procedure MontaSqlDiverg;

    procedure ApagaAbono(iParcela : Integer);
    { Private declarations }

  public
    { Public declarations }
    bSimulacao : Boolean;
    dtUltFechamento : TDateTime;   
  end;

var
  frmExecConcilia: TfrmExecConcilia;

implementation

Uses uMensErro, uSistema, fTelaAut, uComunsImobiliario, uVerificaPreenchimento,
     uDataBase, JclDateTime, fAguarde, DCalcDocumento, uCalcDocumento, dBaseDados,
     uFuncoesImob, FCadDiverge, fCadMotivoAbonoNovo, DFinanciamento, UFuncAlienacao;

{$R *.DFM}

procedure TfrmExecConcilia.FormCreate(Sender: TObject);
begin
  inherited;
// Início ------- Data: 13/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa,
                                                     Sistema.IDModulo,
                                                     Sistema.IDUsuario,
                                                     Sistema.IDEspAcesso,
                                                     Sistema.UsaPlanoPatro);
  //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela                                                     
  ComunsImobiliarioDB.InitializeAs( Padroes );

// Fim ------------------------ Marcio Motta -----------------------------------
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs( Padroes );
end;

procedure TfrmExecConcilia.FormDestroy(Sender: TObject);
begin
// Início ------- Data: 13/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
  FreeAndNil(ComunsImobiliarioDB);
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela  
  inherited;
// Fim ------------------------ Marcio Motta -----------------------------------
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344

end;

procedure TfrmExecConcilia.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,True,Sender);
end;

procedure TfrmExecConcilia.ntbConciliaPageChanged(Sender: TObject);
begin
   inherited;
   case ntbConcilia.PageIndex of
      0 : lblTitulo.Caption := '  Conciliação das Parcelas [Seleção]';
      1 : lblTitulo.Caption := '  Conciliação das Parcelas [Confirmação]';
      2 : lblTitulo.Caption := '  Parcelas com Divergências de Pagamento';
   end;
end;

procedure TfrmExecConcilia.btnContinua1Click(Sender: TObject);
begin
   inherited;
   if edDataF.Date < edDataI.Date then begin
      MsgDlg('A data final não pode ser menor que a data inicial','Aviso',mtWarning,[mbOk],0);
      EdDataF.SetFocus;
      Exit;
   end;

   if edtDataAtualiza.Text = '' then begin
      MsgDlg('Informe a data base para atualização das divergências','Aviso',mtWarning,[mbOk],0);
      edtDataAtualiza.SetFocus;
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if edDataI.text <> ''  then
   begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataI.Text) then
      begin
           MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
           EdDatai.SetFocus;
           Exit;
      end;
   end;
   if edtDataProc.text <> ''  then
   begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataProc.Text) then
      begin
           MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
           edtDataProc.SetFocus;
           Exit;
      end;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   ntbConcilia.ActivePage := 'Confirma';
   btnContinua2.Enabled   := False;
   btnCancela2.Enabled    := False;

   // seleciona parcelas pagas total(2) ou parcial(1) e não conciliadas
   Sel;
   btnCancela2.Enabled    := True;
   btnContinua2.Enabled   := True;
   grdParc.SetFocus;
end;

procedure TfrmExecConcilia.btnCancela2Click(Sender: TObject);
begin
   inherited;
   ntbConcilia.ActivePage := 'Selecao';
end;

procedure TfrmExecConcilia.Sel;
begin
   // Define Filtro do SQL e abre tabela com as parcelas pagas e não coinciliadas
   LimpaParametros(qryParc);
   if edDataI.Text <> '' then
      qryParc.ParamByName('pDATAI').AsDateTime := edDataI.Date;
   if edDataF.Text <> '' then
      qryParc.ParamByName('pDATAF').AsDateTime := edDataF.Date;
   if molproposta1.iProposta > 0 then
      qryParc.ParamByName('pIDCONTRATO').AsFloat := molproposta1.iProposta;
   if molComprador1.iComprador > 0 then
      qryParc.ParamByName('pIDPESSOA').AsFloat := molComprador1.iComprador;
   if molResponsavel1.iResponsavel > 0 then
      qryParc.ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
   if molAdministradora1.iAdministradora > 0 then
      qryParc.ParamByName('pIDADMINIMOVEL').AsFloat := molAdministradora1.iAdministradora;
   if cbSinal.Checked      then qryParc.ParamByName('pSINAL').AsString     := 'S';
   if cbGerada.Checked     then qryParc.ParamByName('pGERA').AsString      := 'S';
   if cbAmort.Checked      then qryParc.ParamByName('pAMORT').AsString     := 'S';
   if cbExtra.Checked      then qryParc.ParamByName('pEXTRA').AsString     := 'S';
   if cbVista.Checked      then qryParc.ParamByName('pVISTA').AsString     := 'S';
   if cbAntec.Checked      then qryParc.ParamByName('pANTEC').AsString     := 'S';
   if cbRecalculo.Checked  then qryParc.ParamByName('pRECALCULO').AsString := 'S';

   qryParc.ParamByName('pCPMF').AsFloat := 215;
   qryParc.Open;
end;

procedure TfrmExecConcilia.FormShow(Sender: TObject);
begin
   inherited;
   ntbConcilia.ActivePage := 'Selecao';
   edtDataAtualiza.Date := Date();
end;

procedure TfrmExecConcilia.molResponsavel1btnBuscaRespClick(
  Sender: TObject);
begin
   inherited;
   molResponsavel1.btnBuscaResponsavelClick(Sender);
end;

procedure TfrmExecConcilia.molComprador1btnBuscaFornClick(Sender: TObject);
begin
   inherited;
   molComprador1.btnBuscaFornClick(Sender);
end;

procedure TfrmExecConcilia.qryParcCalcFields(DataSet: TDataSet);
begin
   inherited;
   // Busca tipo de parcela
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger, -1);
end;

procedure TfrmExecConcilia.btnContinua2Click(Sender: TObject);
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
var  CtrlOperImob : TCtrlOperImob;
     iPer_Bloqueado : Integer; // Helen - SOL: 172902/8221 KTN: 1577344
begin
   inherited;
   bSimulacao      := False;
   dtUltFechamento := -1;

   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Inicio
   CtrlOperImob := TCtrlOperImob.Create(Sistema.IdEmpresa,
                                        Sistema.IdModulo,
                                        Sistema.IdUsuario,
                                        Sistema.IdEspAcesso,
                                        ParamIntegra.PlanoPrevGlobal,
                                        ParamIntegra.PatroGlobal,
                                        Sistema.UsaPlanoPatro);

   CtrlOperImob.InitializeAs( Padroes );
   CtrlOperImob.Progresso  := Progresso;
   CtrlOperImob.iCodDocumentoAjuste := -1;
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Fim

   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   qryParc.First;
   iPer_Bloqueado := 0;
   while not qryParc.eof do
   begin
       if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcDATAVENCIMENTO.AsString) then
       begin
           MsgDlg('Período contábil bloqueado. Data Vencimento.','Aviso',mtWarning,[mbOk],0);
           iPer_Bloqueado := 1;
           Break;
       end;
       qryParc.next;
   end;
   if iPer_Bloqueado = 1 then
   begin
       FreeAndNil(CtrlOperImob);
      exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim


   // Executa a conciliação
   if not qryParc.IsEmpty then begin
      ConciliaDocumentos;
   end;

   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) then begin
      // Atualiza valores divergentes até a data presente
      if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta,
                                           molComprador1.iComprador,
                                           molResponsavel1.iResponsavel,
                                           molAdministradora1.iAdministradora, -1,
                                           edtDataAtualiza.Date) then begin
         MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
         Exit;
      end;

   end else begin
      dtUltFechamento := CtrlOperImob.UltimoFechamento; // Daniel - 22056

      if edtDataAtualiza.Date > dtUltFechamento then begin

         if MsgDlg('O processo de atualização de inadimplências foi processado até ' + DateToStr(dtUltFechamento) + '.' +#13+
                   'Deseja processar a simulação da atualização até ' + DateToStr(edtDataAtualiza.Date) + '?','Confirmação ',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin

            // Gera Simulação pela CtrlOperImob
            try
               bSimulacao := True;
               CtrlOperImob.CreateThreadProgresso;
               frmProgresso.MostraFormProgresso('Processando Simulação...');


               if not CtrlOperImob.AtualizaDocsVencidos(CtrlOperImob.ProgressFileName,
                                                        ModuloImobiliario.Alienacao.iTipoOperAtualMulta,
                                                        ModuloImobiliario.Alienacao.iTipoOperAtualJuros,
                                                        ModuloImobiliario.Alienacao.iTipoOperAtualCM,
                                                        edtDataAtualiza.Date,
                                                        molProposta1.iProposta, True) then begin
                  MsgDlg('Erro ao gerar a simulação da atualização de inadimplência. '+#13+
                          CtrlOperImob.MessageInfo,'Erro ',mtError,[mbOK],0);
               end;
            finally
               frmProgresso.EscondeFormProgresso;
               CtrlOperImob.FreeThreadProgresso;
            end;
         end else begin
            bSimulacao := False;
         end;
      end;
   end;

   // Exibe as divergencias no periodo
   AbreDivergencias;

   // Não permite abonar ou cobrar se for simulação
   sbBoleto.Enabled := not bSimulacao;
   sbAbona.Enabled  := not bSimulacao;

   if bSimulacao then
        pDiverge.Caption    := 'Parcelas com divergências - Atualização Simulada'
   else pDiverge.Caption    := 'Parcelas com divergências';

  //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela   
  FreeAndNil(CtrlOperImob);
end;


procedure TfrmExecConcilia.ConciliaDocumentos;
var prg, iUsaMesAnterior : Integer;
    fVlrCorrige,fCM,fMulta,fJuros : Double;
    dDataLimite,dDataBaixa : TDateTime;
    bCalculaDiverge : Boolean;
    cdsTemp: TCMClientDataSet;
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    ctrlContratoImovel : TCtrlContratoImovel;
begin
   inherited;
   try
//------ Início: 13/01/2004 --- Marcio Motta ------- Pendência: 15799 ------------------------------
      // Cria um CDS temporário para receber os dados
      cdsTemp := TCMClientDataSet.Create( nil );
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

      prg         := 0;
      fCM         := 0;
      fJuros      := 0;
      fMulta      := 0;
      fVlrCorrige := 0;

      FrmAguarde.Mostra('Aguarde Conciliação...');
      FrmAguarde.Max := qryParc.RecordCount;
      Application.ProcessMessages;

      //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
      ctrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                        Sistema.IdModulo,
                                                        Sistema.IdUsuario,
                                                        Sistema.IdEspAcesso,
                                                        Sistema.UsaPlanoPatro );

      ctrlContratoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                     Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                     ComunsImobiliario.MensErroMT);

      // Inicia a conciliação de cada parcela paga
      qryParc.DisableControls;
      StartTransacao;
      qryParc.First;
      try
         while not qryParc.Eof do begin
            prg := prg + 1;
            FrmAguarde.Pos := prg;
            Application.ProcessMessages;

            // Parcelas com divergencias cobradas não poderão ser recalculadas
            if (qryParcCHKINTEGRA.AsInteger > 0) and (qryParcIDPARCDIVERGE.IsNull) then begin

               // Verifica se o abono será excluido e recalculada as divergencias
               // Divergencias já cobradas NÃO serão recalculadas
               bCalculaDiverge := True;
               if qryParcFLGCONCILIADO.AsString <> 'C' then begin
                  if ParcelaAbonada(qryParcIDPARCFINANCIMOV.AsInteger) then begin
                     if ((cbExcluiAbono.Checked = True) and (qryParcFLGLANCINTEGRA.AsInteger <> 5) and
                         (qryParcFLGLANCINTEGRA.AsInteger <> 6)) then begin

                        if (ModuloImobiliario.Alienacao.iTipoOperAbonoMulta > 0) or
                           (ModuloImobiliario.Alienacao.iTipoOperAbonoJuros > 0) or
                           (ModuloImobiliario.Alienacao.iTipoOperAbonoCM > 0) then
                        begin
                           ApagaAbono(qryParcIDPARCFINANCIMOV.AsInteger);
                        end;

                        CalcDocumento.ApagarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger,'M');
                        CalcDocumento.ApagarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger,'J');
                        CalcDocumento.ApagarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger,'C');
                        CalcDocumento.ApagarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger,'T');

                     end else begin
                        bCalculaDiverge := False;
                     end;
                  end;
               end else begin
                  bCalculaDiverge := False;
               end;
               if bCalculaDiverge then begin

                  // Busca a data de baixa da parcela
                  if qryParcDATABAIXA.IsNull then begin
                     dDataBaixa := Date();
                  end else begin
                     dDataBaixa := qryParcDATABAIXA.AsDateTime;
                  end;

//--- 13/01/2004 ------- Início - Marcio Motta ------- Pendência: 15799 ----------------------------
// Modificados os campos ref. Correção Monetária, Juros e Multa para um CDS devido a mudança
// na estrutura da tabela e QRY.

                  // CDS recebe dados ref. ao vencimento da parcela corrente - Marcio Motta - 14/01/2004

                  cdsTemp.Data := ctrlContratoImovel.BuscaParamCMJurosMulta (qryParcIDCONTRATOIMOVEL.AsFloat , qryParcDATAVENCIMENTO.AsDateTime);

                  // Calcula data limite para pagamento
                  // Troca dos campos da QRY pelos campos do CDS - Marcio Motta - 14/01/2004
                  dDataLimite := ComunsImobiliarioDB.DataLimite(qryParcDATAVENCIMENTO.AsDateTime,
                                                                qryParcIDCIDADES.AsInteger,
                                                                qryParcIDPAIS.AsInteger,
                                                                cdsTemp.FieldByName('DIASTOLERANCIA').AsInteger,
                                                                cdsTemp.FieldByName('DIASREPASSE').AsInteger,
                                                                qryParcCODESTADO.AsString,
                                                                cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString,
                                                                cdsTemp.FieldByName('FLGTIPODIAREPASS').AsString,
                                                                True, False, False);

                  // Calcula multa, juros e correção para pagamentos em atraso
                  if (dDataBaixa > dDataLimite) or
                     (ComunsImobiliario.Arredonda(qryParcVALORPAGO.AsFloat,2) <
                      ComunsImobiliario.Arredonda(qryParcVLRPRESTACAO.AsFloat,2)) then begin

                     // Define valor a ser aplicado a multa
                     if dDataBaixa <= dDataLimite then begin
                        fVlrCorrige := qryParcVLRPRESTACAO.AsFloat - qryParcVALORPAGO.AsFloat;
                     end else begin
                        fVlrCorrige := qryParcVLRPRESTACAO.AsFloat;
                     end;

                     // Determina se utiliza o indice de correção do mes anterior
                     iUsaMesAnterior := cdsTemp.FieldByName('MESREFCORRECAO').AsInteger;

                     // Troca dos campos da QRY pelos campos do CDS - Marcio Motta - 14/01/2004
                     fCM := Arredonda(
                            ComunsImobiliarioDB.CalcCM(fVlrCorrige,
                                                       cdsTemp.FieldByName('IDINDCORRECAO').AsInteger,
                                                       qryParcDATAVENCIMENTO.AsDateTime + 1,
                                                       dDataBaixa, True,
                                                       cdsTemp.FieldByName('MESREFCORRECAO').AsInteger), 2);

                     // Troca dos campos da QRY pelos campos do CDS - Marcio Motta - 14/01/2004
                     fMulta := Arredonda(
                               ComunsImobiliarioDB.CalcMulta(qryParcCODDOCUMENTO.AsInteger,
                                                             fVlrCorrige,fCM,
                                                             cdsTemp.FieldByName('VLRMULTA').AsFloat,
                                                             cdsTemp.FieldByName('PERCMULTA').AsFloat,
                                                             cdsTemp.FieldByName('MOEDAMULTA').AsInteger,
                                                             dDataBaixa,
                                                             dDataBaixa,
                                                             dDataBaixa,
                                                             qryParcIDPARCFINANCIMOV.AsInteger
                                                             ), 2);

                     // Troca dos campos da QRY pelos campos do CDS - Marcio Motta - 14/01/2004
                     fJuros := Arredonda(
                               ComunsImobiliarioDB.CalcJuros(fVlrCorrige + fCM,
                                                             cdsTemp.FieldByName('VLRJUROS').AsFloat,
                                                             cdsTemp.FieldByName('PERCJUROS').AsFloat,
                                                             cdsTemp.FieldByName('MOEDAJUROS').AsInteger,
                                                             cdsTemp.FieldByName('PERIODOJUROS').AsString,
                                                             qryParcDATAVENCIMENTO.AsDateTime + 1,
                                                             dDataBaixa,
                                                             cdsTemp.FieldByName('FLGJUROSPROPORC').AsString = 'S'), 2);


//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

                  end else begin
                     fCM    := 0;
                     fJuros := 0;
                     fMulta := 0;
                  end;

                  // Grava dados do recebimento na parcela em PARCFINANCIMOV
                  LimpaParametros(qryUpdParc);
                  qryUpdParc.ParamByName('pIDPARCFINANCIMOV').AsFloat := qryParcIDPARCFINANCIMOV.AsFloat;
                  if not qryParcDATABAIXA.IsNull then begin
                     qryUpdParc.ParamByName('pDATAPAG').AsDateTime    := qryParcDATABAIXA.AsDateTime;
                  end;
                  qryUpdParc.ParamByName('pDATALIMITE').AsDateTime    := dDataLimite;
                  qryUpdParc.ParamByName('pVLRPAGO').AsFloat          := qryParcVALORPAGO.AsFloat;
                  qryUpdParc.ParamByName('pCORRIGIDO').AsFloat        := qryParcVLRPRESTACAO.AsFloat + fCM;
                  qryUpdParc.ParamByName('pMULTA').AsFloat            := fMulta;
                  qryUpdParc.ParamByName('pMORA').AsFloat             := fJuros;

                  // Marca o Flag de conciliado
                  if ComunsImobiliario.Arredonda(( (qryParcVLRPRESTACAO.AsFloat + fCM + fMulta + fJuros) - qryParcVALORPAGO.AsFloat),2) = 0 then begin
                     qryUpdParc.ParamByName('pCONCILIA').AsString := 'S';
                  end else begin
                     qryUpdParc.ParamByName('pCONCILIA').AsString := 'N';
                  end;

                  qryUpdParc.ExecSQL;

                  // Limpa o flag de conciliação do documento
                  if not qryParcCODDOCUMENTO.IsNull then begin
                     LimpaParametros(qryUpdConcilia);
                     qryUpdConcilia.ParamByName('pCODDOCUMENTO').AsFloat := qryParcCODDOCUMENTO.AsFloat;
                     qryUpdConcilia.ExecSQL;
                  end;

               end;
            end;
            qryParc.Next;
         end;
         CommitTransacao;
      except
         RollBackTransacao;
         raise;
      end;
      qryParc.First;
      qryParc.EnableControls;
      frmAguarde.Apaga;
   finally
      FreeAndNil( cdsTemp );
      //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
      FreeAndNil( ctrlContratoImovel );
   end;
end;


procedure TfrmExecConcilia.AbreDivergencias;
begin
   // Filtra o SQL e abre a tabela com as divergencias de pagamento

   MontaSqlDiverg;

   LimpaParametros(qryDiverge);
   if edDataI.Text <> '' then
      qryDiverge.ParamByName('pDATAI').AsDateTime := edDataI.Date;
   if edDataF.Text <> '' then
      qryDiverge.ParamByName('pDATAF').AsDateTime := edDataF.Date;

   if edtDataAtualiza.Text <> '' then
      qryDiverge.ParamByName('pDATAD').AsDateTime := edtDataAtualiza.Date;

   if molproposta1.iProposta > 0 then
      qryDiverge.ParamByName('pIDCONTRATO').AsFloat := molproposta1.iProposta;
   if molComprador1.iComprador > 0 then
      qryDiverge.ParamByName('pIDPESSOA').AsFloat := molComprador1.iComprador;
   if molResponsavel1.iResponsavel > 0 then
      qryDiverge.ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
   if molAdministradora1.iAdministradora > 0 then
      qryDiverge.ParamByName('pIDADMINIMOVEL').AsFloat := molAdministradora1.iAdministradora;
   if cbSinal.Checked  then qryDiverge.ParamByName('pSINAL').AsString := 'S';
   if cbGerada.Checked then qryDiverge.ParamByName('pGERA').AsString  := 'S';
   if cbAmort.Checked  then qryDiverge.ParamByName('pAMORT').AsString := 'S';
   if cbExtra.Checked  then qryDiverge.ParamByName('pEXTRA').AsString := 'S';
   if cbVista.Checked  then qryDiverge.ParamByName('pVISTA').AsString := 'S';
   if cbAntec.Checked  then qryDiverge.ParamByName('pANTEC').AsString := 'S';

   qryDiverge.Open;
   qryDiverge.DisableControls;
   qryDiverge.First;
   while not qryDiverge.Eof do
   begin
      if qryDivergeVLRCORRIG.AsFloat = 0 then qryDiverge.Delete
      else                                    qryDiverge.Next;
   end;
   qryDiverge.First;
   qryDiverge.EnableControls;

   ntbConcilia.ActivePage := 'Diverge';
end;


procedure TfrmExecConcilia.btnCancelar3Click(Sender: TObject);
begin
  inherited;
  ntbConcilia.ActivePage := 'Confirma';
end;

procedure TfrmExecConcilia.grdParcCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmExecConcilia.grdDivergeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;

      // colorir a coluna do dia
      if (State <> [gdSelected]) and (Field.Name = 'qryDivergeDIASDIF') then begin
         ABrush.Color :=  clRed;
         AFont.Color  := clWindow;
      end;


   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmExecConcilia.grdParcTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecConcilia.sbImprimeClick(Sender: TObject);
begin
   inherited;
   // Ímprime relatório das divergencias
   qryDiverge.DisableControls;
   TfrmPreview.CreateModalPreview(Application, rpDiverge,
                                  rpDiverge.PrinterSetup.DocumentName);
   qryDiverge.EnableControls;
end;

procedure TfrmExecConcilia.rpDivergeBeforePrint(Sender: TObject);
begin
   inherited;
   // Carrega labels no relatório
   lblEmpresa.Caption   := Sistema.NomeEmpresa;
   lblSistema.Caption   := Sistema.NomeCompleto;
   if bSimulacao then
        lblRptTitulo.Caption := 'Divergências de Pagamento simulados até ' + FormatDateTime('DD/MM/YYYY',edtDataAtualiza.Date)
   else lblRptTitulo.Caption := 'Divergências de Pagamento atualizadas até ' + FormatDateTime('DD/MM/YYYY',dtUltFechamento);
end;

procedure TfrmExecConcilia.sbBoletoClick(Sender: TObject);
var bChk,bComprador,bCondPag: Boolean;
    fSaldo, fVlrAlt: Extended;
begin
   inherited;
   bChk       := False;
   bComprador := True;
   bCondPag   := True;

   // Cria form de Lancamento de Divergencias
   Application.CreateForm(TfrmCadDiverge, frmCadDiverge);

   frmCadDiverge.Diverge.qryDiverge := qryDiverge;
   frmCadDiverge.Diverge.iIdContrato := -1;

   // Verifica se existe divergencia marcada e se pertencem ao mesmo comprador
   with qryDiverge do begin
      DisableControls;
      First;
      while not eof do begin
         if qryDivergeCHKBOLETO.AsInteger = 1 then begin

            if frmCadDiverge.Diverge.iIdContrato = -1 then begin
               frmCadDiverge.Diverge.iComprador    := qryDivergeIDPESSOA.AsInteger;
               frmCadDiverge.Diverge.sComprador    := qryDivergeRAZAOSOCIAL.AsString;
               frmCadDiverge.Diverge.sNumContrato  := qryDivergeNUMCONTRATO.AsString;
               frmCadDiverge.Diverge.iIdContrato   := qryDivergeIDCONTRATOIMOVEL.AsInteger;
               frmCadDiverge.Diverge.iCondPag      := qryDivergeIDCONDPAGIMOVEL.AsInteger;
               frmCadDiverge.Diverge.iTipoParc     := qryDivergeFLGTIPOLANC.AsInteger;
               frmCadDiverge.Diverge.sCodTipImovel := qryDivergeCODTIPIMOVEL.AsString;
               frmCadDiverge.Diverge.dDataAtualiza := edtDataAtualiza.Date;
               frmCadDiverge.Diverge.iVlrCorrecao  := 0;
               frmCadDiverge.Diverge.iVlrMulta     := 0;
               frmCadDiverge.Diverge.iVlrJuros     := 0;
               frmCadDiverge.Diverge.iVlrSaldoDoc  := 0;
            end;

            if ( (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
                 (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
                 (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) ) then begin

               bChk := True;
               frmCadDiverge.Diverge.iVlrSaldoDoc  := frmCadDiverge.Diverge.iVlrSaldoDoc +
                                                      qryDivergeVLRCORRIG.AsFloat;
            end else begin

               bChk := True;
               frmCadDiverge.Diverge.iVlrSaldoDoc := frmCadDiverge.Diverge.iVlrSaldoDoc +
                                                     qryDivergeSALDO_DOC.AsFloat;

               // Verifica o valor pago a maior da prestação
               fSaldo := (qryDivergeVLRPAGO.AsFloat - qryDivergeVLRPRESTACAO.AsFloat);

               // Pago a menor, cobra o valor total calculado de multa,juros e cm
               if fSaldo <= 0 then begin
                  frmCadDiverge.Diverge.iVlrMulta    := frmCadDiverge.Diverge.iVlrMulta    +
                                                        qryDivergeVLRMULTAATRASO.AsFloat;
                  frmCadDiverge.Diverge.iVlrJuros    := frmCadDiverge.Diverge.iVlrJuros    +
                                                        qryDivergeVLRMORAATRASO.AsFloat + qryDivergeVLRJUROSCORRIG.AsFloat;
                  frmCadDiverge.Diverge.iVlrCorrecao := frmCadDiverge.Diverge.iVlrCorrecao +
                                                        qryDivergeVLRCMATRASO.AsFloat + qryDivergeVLRCMCORRIG.AsFloat;

               // Pago a maior, Ajusta os valores abatendo do saldo na seq.: multa,juros,cm
               end else begin
                  // Verifica e soma o valor da Multa
                  fVlrAlt := qryDivergeVLRMULTAATRASO.AsFloat;
                  fSaldo  := fSaldo - fVlrAlt;
                  if fSaldo < 0 then begin
                     fVlrAlt := fSaldo * -1;
                     frmCadDiverge.Diverge.iVlrMulta := frmCadDiverge.Diverge.iVlrMulta + fVlrAlt;
                     fSaldo := 0;
                  end;

                  // Verifica e soma o valor do Juros de Mora
                  fVlrAlt := qryDivergeVLRMORAATRASO.AsFloat + qryDivergeVLRJUROSCORRIG.AsFloat;
                  fSaldo  := fSaldo - fVlrAlt;
                  if fSaldo < 0 then begin
                     fVlrAlt := fSaldo * -1;
                     frmCadDiverge.Diverge.iVlrJuros := frmCadDiverge.Diverge.iVlrJuros + fVlrAlt;
                     fSaldo := 0;
                  end;

                  // Verifica e soma o valor da Correção
                  fVlrAlt := qryDivergeVLRCMATRASO.AsFloat + qryDivergeVLRCMCORRIG.AsFloat;
                  fSaldo  := fSaldo - fVlrAlt;
                  if fSaldo < 0 then begin
                     fVlrAlt := fSaldo * -1;
                     frmCadDiverge.Diverge.iVlrCorrecao := frmCadDiverge.Diverge.iVlrCorrecao + fVlrAlt;
                     fSaldo := 0;
                  end;

                  // Se pagou a maior, e depois de descontar Multa, Juros e Correção ainda sobrar dinheiro
                  // abate do SaldoDoc para abater em débitos de outras parcelas
                  if fSaldo > 0 then begin
                     frmCadDiverge.Diverge.iVlrSaldoDoc := frmCadDiverge.Diverge.iVlrSaldoDoc -
                                                           fSaldo;
                  end;
               end;
            end;
            
            if frmCadDiverge.Diverge.iComprador <> qryDivergeIDPESSOA.AsInteger        then bComprador := False;
            if frmCadDiverge.Diverge.iCondPag   <> qryDivergeIDCONDPAGIMOVEL.AsInteger then bCondPag   := False;
         end;
         Next;
      end;

      // Verifica se após agrupar todas as parcelas selecionadas possuir saldo a devolver, abater
      // do saldo na seq.: multa,juros,cm
      if frmCadDiverge.Diverge.iVlrSaldoDoc < 0 then begin
         fSaldo := frmCadDiverge.Diverge.iVlrSaldoDoc * -1;
         // Verifica e soma o valor da Multa
         fSaldo := fSaldo - frmCadDiverge.Diverge.iVlrMulta;
         if fSaldo < 0 then begin
            frmCadDiverge.Diverge.iVlrMulta := fSaldo * -1;
            fSaldo := 0;
         end else begin
            frmCadDiverge.Diverge.iVlrMulta := 0;
         end;

         // Verifica e soma o valor do Juros de Mora
         if fSaldo > 0 then begin
            fSaldo := fSaldo - frmCadDiverge.Diverge.iVlrJuros;
            if fSaldo < 0 then begin
               frmCadDiverge.Diverge.iVlrJuros := fSaldo * -1;
               fSaldo := 0;
            end else begin
               frmCadDiverge.Diverge.iVlrJuros := 0;
            end;
         end;

         // Verifica e soma o valor da Correção
         if fSaldo > 0 then begin
            fSaldo := fSaldo - frmCadDiverge.Diverge.iVlrCorrecao;
            if fSaldo < 0 then begin
               fVlrAlt := fSaldo * -1;
               frmCadDiverge.Diverge.iVlrCorrecao := fSaldo * -1;
               fSaldo := 0;
            end else begin
               frmCadDiverge.Diverge.iVlrCorrecao := 0;
            end;
         end;
         frmCadDiverge.Diverge.iVlrSaldoDoc := fSaldo * -1;
      end;

      First;
      EnableControls;
   end;

   // Checagens para liberar a impressão do boleto
   if (frmCadDiverge.Diverge.iVlrSaldoDoc + frmCadDiverge.Diverge.iVlrCorrecao +
       frmCadDiverge.Diverge.iVlrMulta    + frmCadDiverge.Diverge.iVlrJuros) <= 0 then begin
       MsgDlg('O Valor total cobrado não pode ser negativo','Erro',mtError,[mbOk],0);
       Exit;
   end;
   if not bComprador then begin
       MsgDlg('As Divergências selecionadas não pertencem do mesmo comprador','Erro',mtError,[mbOk],0);
       Exit;
   end;

   if not bChk then begin
       MsgDlg('Nenhuma Divergência foi selecionada','Erro',mtError,[mbOk],0);
       Exit;
   end;

   // Abre o form para informar os dados do novo boleto
   frmCadDiverge.ShowModal;

   // da um Refresh na tabela de divergencias
   qryDiverge.Close;
   qryDiverge.Open;
end;

procedure TfrmExecConcilia.grdParcDblClick(Sender: TObject);
begin
   inherited;
   // Marca a parcela para conciliar
   if not qryParc.IsEmpty then begin
      qryParc.Edit;
      qryParcCHKINTEGRA.AsInteger := (qryParcCHKINTEGRA.AsInteger Xor 1);
      qryParc.Post;
   end;
end;

procedure TfrmExecConcilia.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   // Marca todas as parcelas para conciliar
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      qryParc.Edit;
      qryParcCHKINTEGRA.AsInteger := 1;
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;

procedure TfrmExecConcilia.btnLimpaClick(Sender: TObject);
begin
   inherited;
   // Desmarca todas as parcelas
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      qryParc.Edit;
      qryParcCHKINTEGRA.Clear;
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;

procedure TfrmExecConcilia.grdDivergeDblClick(Sender: TObject);
begin
   inherited;
   // Marca parcelas com divergencia para abonar ou emitir boleto
   if not qryDiverge.IsEmpty then begin
      qryDiverge.Edit;
      qryDivergeCHKBOLETO.AsInteger := (qryDivergeCHKBOLETO.AsInteger Xor 1);
      qryDiverge.Post;
   end;
end;

procedure TfrmExecConcilia.sbAbonaClick(Sender: TObject);
var bPermiteTotal: Boolean;
begin
   inherited;
   // Checa se alguma parcela foi selecionada
   if not PossuiItens then begin
      MsgDlg('Nenhum item foi selecionado.','erro',mtError,[mbok],0);
      Exit;
   end;

   // Verifica se alguma baixa parcial foi selecionada
   qryDiverge.DisableControls;
   qryDiverge.First;
   bPermiteTotal := True;
   while not qryDiverge.Eof do begin
      if (qryDivergeCHKBOLETO.AsInteger = 1) and
         ( (qryDivergeDSC_STATUS.AsString = 'Parcial') or (qryDivergeDSC_STATUS.AsString = 'Manual') ) and
         (qryDivergeVLRPAGO.AsFloat < qryDivergeVLRPRESTACAO.AsFloat) then begin
         bPermiteTotal := False;
      end;
      qryDiverge.Next;
   end;
   qryDiverge.First;
   qryDiverge.EnableControls;

   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataAtualiza.Text) then
   begin
      MsgDlg('Período contábil bloqueado para data de atualização.','Erro ',mtError,[mbOK],0);
      Exit;
    end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim


   // Cria form de Lancamento de Abonos
   Application.CreateForm(TfrmCadMotivoAbonoNovo, frmCadMotivoAbonoNovo);
   frmCadMotivoAbonoNovo.qryAlienacao := qryDiverge;
   frmCadMotivoAbonoNovo.edtdataAbono.Date := edtDataAtualiza.Date;

   // Quando o documento estiver baixado parcial, não permite fazer o abono total, primeiro
   // o documento deve ser quitado no contas a receber através de alterador de desconto.
   
   // Abre o form para informar o motivo
   frmCadMotivoAbonoNovo.ShowModal;

   // da um Refresh na tabela de divergencias atualizando a correção das divergencias
   qryDiverge.Close;

   if (ModuloImobiliario.Alienacao.iTipoOperAbonoMulta <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAbonoJuros <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAbonoCM <= 0) then
   begin
      if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta,
                                           molComprador1.iComprador,
                                           molResponsavel1.iResponsavel,
                                           molAdministradora1.iAdministradora, -1,
                                           edtDataAtualiza.Date) then begin
         MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
         Exit;
      end;
   end;
   qryDiverge.Open;
end;

function TfrmExecConcilia.MotivoAbono(var sMotivo: string): Boolean;
begin
   result := InputQuery('Motivo para abono', 'Motivo',sMotivo);
end;

function TfrmExecConcilia.PossuiItens: Boolean;
begin
   Result := False;
   // Verifica se algum item de divergencia foi selecionado para abono ou geração de boleto
   with qryDiverge do begin
      DisableControls;
      First;
      while not eof do begin
         if qryDivergeCHKBOLETO.AsInteger = 1 then Result := True;
         Next;
      end;
      First;
      EnableControls;
   end;
end;

procedure TfrmExecConcilia.cbExcluiAbonoClick(Sender: TObject);
begin
  inherited;
  cbRecalculo.Checked := cbExcluiAbono.Checked;
end;

function TfrmExecConcilia.ParcelaAbonada(const iParcela: Integer): Boolean;
begin
  Result := False;
  with dtmFinanciamento.qryAux do begin
     Close;
     Sql.Clear;
     Sql.Text := 'SELECT DISTINCT IDPARCFINANCIMOV, DATA FROM CONCILIADOC ' +#13+
                 ' WHERE FLGTIPO IN (''M'',''J'',''C'', ''T'') AND IDPARCFINANCIMOV = ' + IntToStr(iParcela);
     Open;
     if not IsEmpty then Result := True;
  end;
end;

procedure TfrmExecConcilia.cbRecalculoClick(Sender: TObject);
begin
  inherited;
  if cbExcluiAbono.Checked then cbRecalculo.Checked := True;
end;


procedure TfrmExecConcilia.bbSaldoClick(Sender: TObject);
var fSaldo1, fSaldo2 : Extended;
    sMsg : String;
begin
  inherited;
  qryTeste.Open;
  while not qryTeste.Eof do begin
     fSaldo1 := 0;
     fSaldo2 := 0;
     fSaldo1 := FuncAlienacao.CalcSaldoDevedorAnt(qryTeste.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1,
                                               edtDataAtualiza.Date);

     fSaldo2 := FuncAlienacao.CalcSaldoDevedor(qryTeste.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1,
                                                 edtDataAtualiza.Date);

     sMsg := 'Id: ' + qryTeste.FieldByName('IDCONTRATOIMOVEL').AsString + ' - ' +
                      qryTeste.FieldByName('CONNUMERO').AsString +#13+
             'Saldo1 : ' + FloatToStr(fSaldo1) + #13+
             'Saldo2 : ' + FloatToStr(fSaldo2);

     MsgDlg(sMsg,'Teste',mtConfirmation,[mbOk],0);

     qryTeste.Next
  end;
end;

procedure TfrmExecConcilia.MontaSqlDiverg;
var sSQL, sDtLimite : String;
begin
   sDtLimite := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',edtDataAtualiza.Date)) + ',''DD/MM/YYYY'') ';

   sSQL :=
   'SELECT ' + #13 +
   '     MIN(0)                     AS CHKBOLETO,        ' + #13 +
   '     MIN(CI.IDCONTRATOIMOVEL)   AS IDCONTRATOIMOVEL, ' + #13 +
   '     MIN(CI.CONNUMERO)          AS NUMCONTRATO,      ' + #13 +
   '     MIN(CI.CONNOME)            AS NOMECONTRATO,     ' + #13 +
   '     MIN(IM.NOMEMESTRE)         AS NOMEMESTRE,       ' + #13 +
   '     MIN(IM.CODTIPIMOVEL)       AS CODTIPIMOVEL,     ' + #13 +
   '     PR.IDPARCFINANCIMOV, ' + #13 +
   '     PR.IDCONDPAGIMOVEL, ' + #13 +
   '     MIN(ALT.TOT_ALTERADOR)     AS TOT_ALTERADOR,   '+#13+
   '     MIN(PR.NUMPARCELA)         AS NUMPARCELA, ' + #13 +
   '     MIN(PR.CODDOCUMENTO)       AS CODDOCUMENTO, ' + #13 +
   '     MIN(PR.FLGTIPOLANC)        AS FLGTIPOLANC, ' + #13 +
   '     MIN(PR.FLGCONCILIADO)      AS FLGCONCILIADO, ' + #13 +
   '     MIN(PR.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0)) AS VLRPRESTACAO, ' + #13 +
   '     MIN(PR.DATAVENCIMENTO)     AS DATAVENCIMENTO, ' + #13 +

   '     MIN(PP.DATAPAGAMENTO)      AS DATABAIXA, ' + #13 +
   '     MIN(PP.VLRPAGO)            AS VLRPAGO, ' + #13 +

   '     MIN(PR.DATALIMITE)         AS DATALIMITE, ' + #13 +
   '     MIN(NVL(SD.SALDO_DOC,0))   AS SALDO_DOC,  ' + #13 +
   '     MIN(DECODE( PP.DATAPAGAMENTO, NULL,           ' + #13 +
   '                 TRUNC(SYSDATE - PR.DATALIMITE),   ' + #13 +
   '                 (PP.DATAPAGAMENTO - PR.DATALIMITE) ) ) AS DIASDIF, ' + #13 +
   '     MIN(CI.IDLOCATARIO)        AS IDPESSOA, ' + #13 +
   '     MIN(P.RAZAOSOCIAL)         AS RAZAOSOCIAL, ' + #13 +
   '     DECODE(MIN(PR.FLGLANCINTEGRA), 3,2, 4,2, MIN(D.STATUS) ) AS STATUS, ' + #13 +
   '     DECODE(MIN(PR.FLGLANCINTEGRA), 3,''Manual'', 4,''Importada'', DECODE(MIN(D.STATUS),2,''Total'',''Parcial'') ) AS DSC_STATUS, ' + #13;

   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) then
   begin
      sSQL := sSQL +
      '     MIN(PR.VLRCORRIGIDOATRASO - PR.VLRPRESTACAO) AS VLRCMATRASO, ' + #13 +
      '     MIN(PR.VLRMULTAATRASO)     AS VLRMULTAATRASO, ' + #13 +
      '     MIN(PR.VLRMORAATRASO)      AS VLRMORAATRASO, ' + #13 +
      '     ROUND(MIN( ((NVL(PR.VLRCORRIGIDOATRASO,0) + NVL(PR.VLRMULTAATRASO,0) + NVL(PR.VLRMORAATRASO,0)) - NVL(PR.VLRPAGO,0) + NVL(ALT.TOT_ALTERADOR,0)) ), 2) AS VLRDIF, ' + #13 +
      '     ROUND(MIN( ( NVL(PR.VLRPRESTCORRIG,0) + NVL(PR.VLRMULTACORRIG,0) + NVL(PR.VLRJUROSCORRIG,0) ) ), 2) AS VLRCORRIG, ' + #13 +
      '     ROUND(MIN( ( NVL(PR.VLRPRESTCORRIG,0) ) - ' + #13 +
      '              ( ( NVL(PR.VLRCORRIGIDOATRASO,0) + NVL(PR.VLRMULTAATRASO,0) + NVL(PR.VLRMORAATRASO,0) ) - NVL(PR.VLRPAGO,0) + NVL(ALT.TOT_ALTERADOR,0) ) ' + #13 +
      '              ), 2) AS VLRCMCORRIG, ' + #13 +
      '     MIN(NVL(PR.VLRPRESTCORRIG,0)) AS VLRPRESTCORRIG, ' + #13 +
      '     MIN(NVL(PR.VLRMULTACORRIG,0)) AS VLRMULTACORRIG, ' + #13 +
      '     MIN(NVL(PR.VLRJUROSCORRIG,0)) AS VLRJUROSCORRIG '  + #13;
   end
   else
   begin
      sSQL := sSQL +
      '     MIN(CMA.VLRCORRIGIDOATRASO) AS VLRCMATRASO, ' + #13 +
      '     MIN(MA.VLRMULTAATRASO)     AS VLRMULTAATRASO, ' + #13 +
      '     MIN(JA.VLRMORAATRASO)      AS VLRMORAATRASO, ' + #13 +

      '     ROUND(MIN(  DECODE(PR.FLGTIPOLANC,4,0,DECODE(PR.CODDOCUMENTO, NULL, NVL(PR.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ) - NVL(PP.VLRPAGO,0), '+ #13 +
      '                 ROUND( ( ( NVL(PR.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ) ) - NVL( PP.VLRPAGO, 0 ) + NVL(ALT.TOT_ALTERADOR,0) ), 2 ) )) ),2)AS VLRDIF, ' + #13 +

      '     ROUND(MIN(  DECODE(PR.FLGTIPOLANC,4,0,DECODE(PR.CODDOCUMENTO, NULL, NVL(PR.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ) - NVL(PP.VLRPAGO,0), ' + #13 +
      '                 ROUND( ( ( NVL(PR.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ) ) - NVL( PP.VLRPAGO, 0 ) ), 2 ) )) ),2)+ ' + #13 +
      '     ROUND(MIN( ( NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + NVL(JS.VLRMORASALDO,0) + NVL(ALT.TOT_ALTERADOR,0) ) ), 2) - ROUND(MIN(NVL(ABONO.TOT_ABONO,0)),2) AS VLRCORRIG, ' + #13 +

      '     MIN(NVL(CMS.VLRCORRIGIDOSALDO,0)) AS VLRPRESTCORRIG, ' + #13 +
      '     MIN(NVL(CMS.VLRCORRIGIDOSALDO,0)) AS VLRCMCORRIG, '+ #13+
      '     MIN(NVL(JS.VLRMORASALDO,0)) AS VLRJUROSCORRIG, '+ #13 +
      '     MIN(NVL(MS.VLRMULTASALDO,0)) AS VLRMULTACORRIG ' + #13;
   end;

   sSQL := sSQL +
   'FROM ' + #13 +
   '     PARCFINANCIMOV PR, ' + #13 +
   '     CONDPAGIMOVEL CP, ' + #13 +
   '     CONTRATOIMOVEL CI, ' + #13 +
   '     DOCUMENTO D, ' + #13 +
   '     PESSOA P, ' + #13 +

   '       ( SELECT LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '+#13+
   '                SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '+#13+
   '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,          '+#13+
   '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,        '+#13+
   '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
   '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
   '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
   '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+
   '                     AND C.FLGTIPOCONTRATO = ''C'' ) TC                  '+#13+
   '          WHERE RTRIM(LD.OPERACAO) = ''4''                  '+#13+
   '            AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13;

   if Sistema.TipoCliente = 19991 then sSql := sSql +

   '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR ' + #13 +
   '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS (SELECT 1 ' + #13 +
   '                                                                 FROM CONCILIADOC ' + #13 +
   '                                                                 WHERE IDDOCUMENTO = LD.CODDOCUMENTO ' + #13 +
   '                                                                 AND   NUMLANCTO   = LD.NUMLANCTO ' + #13 +
   '                                                                 AND   DATA        <=  TO_DATE(:pDATAD,''DD/MM/YYYY''))) ' + #13;

   ssQL := sSQL +
   '            AND PA.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) +#13+
   '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '+#13+
   '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '+#13+
   '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '+#13+
   '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '+#13+
   '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '+#13+
   '            AND ( PA.IDOPERATUALCM IS NULL OR               '+#13+
   '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '+#13+
   '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '+#13+
   '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '+#13+
   '            AND D.IDMODULO = 135                            '+#13+
   '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '+#13+

   '       ( '+#13+
   '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '+#13+
   '                IDPARCFINANCIMOV, '+#13+
   '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
   '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
   '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
   '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
   '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
   '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
   '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <= :pDATAD ) OR '+#13+
   '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
   '                                             AND LD.ESTORNO IS NULL            '+#13+
   '                                             AND LD.DATALANCTO <= :pDATAD ) )  '+#13+
   '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO                            '+#13+
   '       ) PP, '+#13+

   '     ( SELECT P2.IDPARCFINANCIMOV, ' + #13 +
   '              (P2.VLRPRESTACAO - P2.VLRPAGO) AS SALDO_DOC ' + #13 +
   '         FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2 ' + #13 +
   '        WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDPAGIMOVEL ' + #13 +
   '          AND P2.VLRPAGO IS NOT NULL ' + #13 +
   '          AND P2.VLRPAGO < P2.VLRPRESTACAO ' + #13 +
   '          AND ((:PIDCONTRATO IS NULL) OR (C2.IDCONTRATOIMOVEL = :PIDCONTRATO))  ) SD, ' + #13 +
   '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, ' + #13 +
   '              M.IMONOME            AS NOMEMESTRE, ' + #13 +
   '              I.CODTIPIMOVEL       AS CODTIPIMOVEL ' + #13 +
   '       FROM ' + #13 +
   '              CONTRATOXIMOVEL CXI, ' + #13 +
   '              IMOVEL I, ' + #13 +
   '              IMOVEL M ' + #13 +
   '       WHERE ' + #13 +
   '              CXI.IDIMOVEL = I.IDIMOVEL AND ' + #13 +
   '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM ' + #13;

   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) then
   begin
      sSQL := sSQL + ',' + #13 +
           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOATRASO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOATRASO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '+#13+
           '                AND L.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '+#13+
           '                AND ( DATAOPER <= :pDATAD) '+#13+
           '                AND L2.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '                AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) CMA, '+#13+

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRASO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTAATRASO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '+#13+
           '                AND L.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '+#13+
           '                AND ( DATAOPER <= :pDATAD) '+#13+
           '                AND L2.DATABAIXA IS NOT NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '         AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) MA, '+#13+

           '       ( '+#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '+#13+
           '        FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORAATRASO '+#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '+#13+
           '               AND L.DATABAIXA IS NOT NULL '+#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '+#13+
           '               AND ( DATAOPER <= :pDATAD) '+#13+
           '               AND L2.DATABAIXA IS NOT NULL '+#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '        AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) JA, '+#13+

//----------

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOSALDO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRCORRIGIDOSALDO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '+#13+
           '                AND L.DATABAIXA IS NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)  +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '+#13+
           '                AND ( DATAOPER <= :pDATAD) '+#13+
           '                AND L2.DATABAIXA IS NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '                AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) CMS, '+#13+

           '       ( '+#13+
           '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO '+#13+
           '         FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMULTASALDO '+#13+
           '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '+#13+
           '                AND L.DATABAIXA IS NULL '+#13+
           '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '+#13+
           '                AND ( DATAOPER <= :pDATAD) '+#13+
           '                AND L2.DATABAIXA IS NULL '+#13+
           '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '         AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) MS, '+#13+

           '       ( '+#13+
           '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '+#13+
           '        FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRMORASALDO '+#13+
           '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '+#13+
           '               AND L.DATABAIXA IS NULL '+#13+
           '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '               AND P2.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '+#13+
           '               AND ( DATAOPER <= :pDATAD) '+#13+
           '               AND L2.DATABAIXA IS NULL '+#13+
           '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           '        AND D1.DATAOPER = D2.DTAPUR '+#13+
           '       ) JS, '+#13 + 
//----------

           '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '+#13+
           '       FROM ( SELECT /*+ INDEX (L) */ '+#13+
           '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
           '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
           '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND L.IDMODULO = 135 '+#13+
           '                AND P.IDPESSOA =  ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '+#13+
           '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '+#13+
           '                      L.IDOPERACAO = P.IDOPERABONOCM ) '+#13+
           '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
           '           ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
           '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
           '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
           '                AND L2.IDMODULO = 135 '+#13+
           '                AND P2.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa) +#13;

           if molProposta1.iProposta > 0 then
              sSQL := sSQL +
           '                AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + #13;

           sSQL := sSQL +
           '         AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '+#13+
           '               L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '+#13+
           '               L2.IDOPERACAO = P2.IDOPERABONOCM ) '+#13+
           '         AND ( DATAOPER <= :pDATAD ) '+#13+
           '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
           'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
           'AND D1.DATAOPER = D2.DTAPUR '+#13+
           ') ABONO '+#13;
   end;

   sSQL := sSQL +
   'WHERE ' + #13 +
   '       ( ((PR.FLGCONCILIADO <> ''S'') AND (PR.FLGCONCILIADO <> ''C'')) OR (PR.FLGCONCILIADO IS NULL) ) ' + #13 +
   '   AND (PR.FLGLANCINTEGRA > 1) ' + #13;

   if cbSoPagas.Checked then sSQL := sSQL +
   '   AND (PP.DATAPAGAMENTO IS NOT NULL ) ' + #13;

   sSQL := sSQL +
   '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    ' +#13+
   '   AND (CP.IDCONDPAGIMOVEL  = PR.IDCONDPAGIMOVEL)     ' +#13+
   '   AND (CI.IDLOCATARIO      = P.IDPESSOA)             ' +#13+
   '   AND (PR.CODDOCUMENTO     = D.CODDOCUMENTO(+))      ' +#13+
   '   AND (PR.IDPARCFINANCIMOV = SD.IDPARCFINANCIMOV(+)) ' +#13+
   '   AND (PR.CODDOCUMENTO     = ALT.CODDOCUMENTO(+))    ' +#13+
   '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+)) ' +#13+
   '   AND (PR.IDPARCFINANCIMOV = PP.IDPARCFINANCIMOV(+)) ' +#13+
   '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI))    ' + #13 +
   '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF))    ' + #13 +
   '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO  = :pIDPESSOA)) ' + #13 +
   '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRESPONSAVEL)) ' + #13 +
   '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADMINIMOVEL)) ' + #13 +
   '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCONTRATO)) ' + #13 +
   '   AND (   ((:pSINAL = ''S'') AND (PR.FLGTIPOLANC = 2)) ' + #13 +
   '        OR ((:pGERA  = ''S'') AND (PR.FLGTIPOLANC = 3)) ' + #13 +
   '        OR ((:pAMORT = ''S'') AND (PR.FLGTIPOLANC = 5)) ' + #13 +
   '        OR ((:pEXTRA = ''S'') AND (PR.FLGTIPOLANC = 6)) ' + #13 +
   '        OR ((:pVISTA = ''S'') AND (PR.FLGTIPOLANC = 7)) ' + #13 +
   '        OR ((:pANTEC = ''S'') AND (PR.FLGTIPOLANC = 9)) ) ' + #13;

   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) then
   begin
      sSQL := sSQL +
      'AND PR.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+) ' + #13 +
      'AND PR.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+) ' + #13 +
      'AND PR.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+) ' + #13 +
      'AND PR.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+) ' + #13 +
      'AND PR.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+) ' + #13 +
      'AND PR.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+) ' + #13 +
      'AND PR.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+) ' + #13;
   end;

   sSQL := sSQL +
   'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV ' + #13 +
   'ORDER BY NUMCONTRATO, IDCONDPAGIMOVEL, DATAVENCIMENTO, NUMPARCELA ' + #13;


   qryDiverge.Sql.Text := sSQL;
   qryDiverge.Sql.SaveToFile(Sistema.TempDir + 'QryDiverge.txt');
end;

procedure TfrmExecConcilia.Progresso(vParams: array of variant);
begin
   if (vParams[1] = 1) and (High(vParams) = 5) then
        frmProgresso.MostraFormProgresso( vParams[5] )
   else frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
end;

procedure TfrmExecConcilia.sbMarcaTudoClick(Sender: TObject);
begin
  inherited;
   // Marca todas as parcelas para conciliar
   qryDiverge.DisableControls;
   qryDiverge.First;
   while not qryDiverge.eof do begin
      qryDiverge.Edit;
      qryDivergeCHKBOLETO.AsInteger := 1;
      qryDiverge.Post;
      qryDiverge.Next;
   end;
   qryDiverge.First;
   qryDiverge.EnableControls;
end;

procedure TfrmExecConcilia.sbDesmarcaTudoClick(Sender: TObject);
begin
  inherited;
   // Desmarca todas as parcelas
   qryDiverge.DisableControls;
   qryDiverge.First;
   while not qryDiverge.eof do begin
      qryDiverge.Edit;
      qryDivergeCHKBOLETO.Clear;
      qryDiverge.Post;
      qryDiverge.Next;
   end;
   qryDiverge.First;
   qryDiverge.EnableControls;
end;



procedure TfrmExecConcilia.ApagaAbono(iParcela : Integer);
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
var  CtrlOperImob : TCtrlOperImob;
begin
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Inicio
   CtrlOperImob := TCtrlOperImob.Create(Sistema.IdEmpresa,
                                        Sistema.IdModulo,
                                        Sistema.IdUsuario,
                                        Sistema.IdEspAcesso,
                                        ParamIntegra.PlanoPrevGlobal,
                                        ParamIntegra.PatroGlobal,
                                        Sistema.UsaPlanoPatro);

   CtrlOperImob.InitializeAs( Padroes );
   CtrlOperImob.Progresso  := Progresso;
   CtrlOperImob.iCodDocumentoAjuste := -1;
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Fim

   while not dtmFinanciamento.qryAux.Eof do
   begin

      CtrlOperImob.Reprocessamento(CtrlOperImob.ProgressFileName,
                                   [ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoCM],
                                    dtmFinanciamento.qryAux.FieldByName('DATA').AsDateTime,
                                    qryParcIDCONTRATOIMOVEL.AsInteger,
                                    False, True, True,
                                    qryParcIDPARCFINANCIMOV.AsInteger);

      CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                     [ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                      ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                      ModuloImobiliario.Alienacao.iTipoOperAbonoCM],
                                      dtmFinanciamento.qryAux.FieldByName('DATA').AsDateTime, 2, False,
                                      qryParcIDCONTRATOIMOVEL.AsInteger);

      CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                   ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                   ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                   ModuloImobiliario.Alienacao.iTipoOperAbonoCM, -1, -1,
                                   '', dtmFinanciamento.qryAux.FieldByName('DATA').AsDateTime, False);

      dtmFinanciamento.qryAux.Next;
   end;
   frmProgresso.EscondeFormProgresso;
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
   FreeAndNil(CtrlOperImob);   
end;



end.
