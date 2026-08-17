{-------------------------------------------------------------------------------

	   Executa a integração das parcelas com o CAR / Contabilidade

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  15/09/2001
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
Rotina......: -
Nº SOL......: 148062
Nº KINTANA..: 1033029
Data........: 02/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Onde estava trazendo o Valor Nominal, foi
              trocado pelo valor correto que é da Correção Monetária.
--------------------------------------------------------------------------------
Rotina..........: qryParc
N. Sol..........: 136338
N. Kintana......: 815089
Data............: 25/10/2010
Responsável.....: Brunno Mattos
Descrição.......: Inclusão de condição na query para que sejam visualizados apenas
                  as parcelas de contratos que NÃO sejam VGV. Parcelas de contratos
                  VGV não devem ser integradas.
--------------------------------------------------------------------------------
Rotina..........: LancContab
N. Sol..........: 134228
N. Kintana......: 788955
Data............: 22/09/2010
Responsável.....: Helen V Bianchi
Descrição.......: Ajuste na rotina de contabilizaçao de parcelas a integrar.
                  Estava com erro na Correção Monetária.
--------------------------------------------------------------------------------
Rotina..........: Processa , btnContinua1Click
N. Sol..........: 137529
N. Kintana......: 898731
Data............: 06/09/2010
Responsável.....: Felipe de Oliveira
Descrição.......: verifica antes de integrar se a parcela tem amortizações em aberto
--------------------------------------------------------------------------------
Rotina..........: LancContab
N. Sol..........: 130683
N. Kintana......: 735883
Data............: 10/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Ajuste na rotina de contabilizaçao de parcelas a integrar. 
--------------------------------------------------------------------------------
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Integra também as parcelas do tipo "Caução" além das outras.
--------------------------------------------------------------------------------
Pendência   : 17552
Responsável : Marchetti
Rotina      : LancCar e LancContab
Data        : 21/02/2006
Descrição   : Utilização dos métodos em 3 camadas
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}



unit fExecIntegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mComprador, mProposta, fcLabel, fcButton,
  fcImgBtn, fcShapeBtn, DBTables, Db, Wwdatsrc, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Mask,
  DBCtrls, DBCGrids, Math, mResponsavel, uFuncoesImob, mAdministradora,
  Menus, uCMClientDataSet, UComunsImobiliarioDB, uCtrlContratoImovel,
  uCtrlContab, uCtrlPadrLancImovel, {uCtrlLancamento,}
  //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
  uCtrlParamIntegra, uCtrlPadroes,
  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
  uCtrlImobLancamento, uCtrlImobSegregacao, uCtrlImobDocumento, uCMMath;//, uCtrlDocumento;
  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim


type
  TfrmExecIntegra = class(TfrmSairAjudaImob)
    ntbIntegra: TNotebook;
    lblTitulo: TfcLabel;
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    btnContinua1: TfcShapeBtn;
    Panel1: TPanel;
    btnContinua2: TfcShapeBtn;
    btnCancela2: TfcShapeBtn;
    GroupBox1: TGroupBox;
    cbGerada: TCheckBox;
    cbSinal: TCheckBox;
    cbAmort: TCheckBox;
    qryAux: TwwQuery;
    qryVerifPag: TwwQuery;
    qryVerifPagDATAPAG: TDateTimeField;
    qryParc: TwwQuery;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcNUMCONTRATO: TStringField;
    qryParcNOMECONTRATO: TStringField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcNUMPARCELA: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDPESSOA: TFloatField;
    qryParcPLNCODIGO: TFloatField;
    qryParcATRASOINDCORREC: TFloatField;
    qryParcATRASOMULTA: TFloatField;
    qryParcATRASOTXJUROS: TFloatField;
    dsParc: TwwDataSource;
    UpdParc: TUpdateSQL;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    Label1: TLabel;
    edDataF: TCMDateTimePicker;
    Panel4: TPanel;
    qryParcRAZAOSOCIAL: TStringField;
    grdParc: TwwDBGrid;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcCAL_TIPO: TStringField;
    cbProj: TCheckBox;
    btnSeleciona: TSpeedButton;
    btnLimpa: TSpeedButton;
    qryParcCODPORTFORMA: TFloatField;
    qryParcIDMSGBOLETO: TFloatField;
    qryParcNUMPARCELAS: TFloatField;
    qryParcNOMEMESTRE: TStringField;
    qryParcPRAZO: TStringField;
    qryParcPERIODO: TFloatField;
    qryParcCODFORMA: TFloatField;
    molResponsavel1: TmolResponsavel;
    GroupBox3: TGroupBox;
    edtDataProc: TCMDateTimePicker;
    qryParcDATALANCINTEGRA: TDateTimeField;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryParcCHKINTEGRA: TFloatField;
    qryParcVLRAMORTIZACAO: TFloatField;
    qryParcVLRJUROS: TFloatField;
    qryParcVLRRESIDUO: TFloatField;
    qryParcTIPOCONDPAG: TStringField;
    cbVista: TCheckBox;
    qryParcCODTIPIMOVEL: TStringField;
    cbAntec: TCheckBox;
    fcLabel1: TfcLabel;
    Panel2: TPanel;
    memErro: TMemo;
    fcShapeBtn1: TfcShapeBtn;
    molAdministradora1: TmolAdministradora;
    qryParcFORMACALCULO: TFloatField;
    qryParcVLRCORRSALDO: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcVLRNOMINAL: TFloatField;
    qryParcVLRJUROSPARC: TFloatField;
    qryImoveis: TwwQuery;
    qryImoveisIMOCODIGO: TStringField;
    QryParcelasPend: TwwQuery;
    QryParcelasPendCONNUMERO: TStringField;
    QryParcelasPendCONNOME: TStringField;
    QryParcelasPendNUMPARCELA: TFloatField;
    QryParcelasPendDATAVENCIMENTO: TDateTimeField;
    qryDadosCliente: TwwQuery;
    qryDadosClienteIDPAIS: TFloatField;
    qryDadosClienteIDCIDADES: TFloatField;
    qryDadosClienteCODESTADO: TStringField;
    GroupBox4: TGroupBox;
    cbContrato: TCheckBox;
    cbAcordo: TCheckBox;
    qryParcFLGTIPOCONTRATO: TStringField;
    cbCaucao: TCheckBox;
    grbLancamento: TGroupBox;
    edtDataLancto: TCMDateTimePicker;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure ntbIntegraPageChanged(Sender: TObject);
    procedure btnContinua1Click(Sender: TObject);
    procedure btnCancela2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdParcDblClick(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure btnContinua2Click(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure grdParcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdParcTopRowChanged(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    { Private declarations }

    //--- Início --- 21/01/2004 ---- Marcio Motta ---- Pendência: 15799 --------------------------------
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela    
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    //------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

    CtrlContab         : TCtrlContab;
    //CtrlDocumento      : TCtrlDocumento;
    //CtrlLancamento     : TCtrlLancamento;
    CtrlPadrLancImovel : TCtrlPadrLancImovel;

    //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
    CtrlImobDocumento  : TCtrlImobDocumento;
    CtrlImobLancamento : TCtrlImobLancamento;
    //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim
    
    ParamContab : TParamContabeisMT;
    CodTipoDoc  : Integer;

    liRetFuncao,liEmpresa,liExercicio,liPeriodo : LongInt;
    iPlanilha   : Integer;
    sDtLancto   : String;
    sDtEmissao  : String;
    //
    function  LancCar(Tipo : Integer) : Double;                // Lança parcela no CAR
    function  LancContab(Tipo,iDocumento : Integer) : Integer; // Lança parcela na Contabilidade
    function  GravaIntegra(Tipo : Integer): Boolean;           // Atualiza os Flags e Nr. de Documento nas Parcelas

    procedure ProcessaMensagem(iDocumento: int64);             // Processa toda a Mensagem para o Boleto de pagamento

    procedure Processa;                                        // Executa o processo de Integração
    function  InicializaParam(const iTipoLanc:Integer ): Boolean;   // Busca dados da parametrização contabil
    procedure Sel;                                             // Abre as tabelas do form
    function  DefineHistorico(const iTipo, iIdContrato, iParcela:Integer;   // Define o Historico do Lançamento Contábil
                              const sContrato, sCodTipImovel:String): String;

    // Pendência 19877 - Marcos Ventura Topini
    // Verifica se no período anterior ficaram parcelas sem serem integradas
    function VerificaParcelasPendentes: Boolean;

  public
    { Public declarations }
    // SOL 137529 KTN 898731  Felipe de Oliveira  - Inicio
    conNumero : String;
    dataVencimento : tDateTime;
    // SOL 137529 KTN 898731  Felipe de Oliveira  - Fim

    procedure ProcuraMsgContrato(var vMsg: array of string);   // Busca a Mensagem Padrão para o Boleto
    procedure TrataMsg(var vMsg: array of string);             // Substitui os curingas utilizados na mensagem
    // SOL 137529  KTN 898731  Felipe de Oliveira
    // Verifica se existe amortização para determinada parcela
    Function ParcelaComAmortizacao : boolean;

  end;

var
    frmExecIntegra: TfrmExecIntegra;


implementation

Uses uMensErro, uSistema, uModuloAlienacao, uFuncaoGeral,
     DFinanciamento,uDataBase,uIntegraBack, uDiasInUteis,
     JclDateTime, dLancImovel, dImobiliario, fAguarde, dLookImobiliario,
     UFuncAlienacao, uModuloImobiliario, FProgresso, dBaseDados, uComunsImobiliario;

{$R *.DFM}


procedure TfrmExecIntegra.FormCreate(Sender: TObject);
begin
  inherited;
// Início ------- Data: 21/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                                      Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro);
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
  ComunsImobiliarioDB.InitializeAs( Padroes );

  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
  CtrlImobDocumento   := TCtrlImobDocumento.Create;
  CtrlImobLancamento  := TCtrlImobLancamento.Create;
  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim

  CtrlContab          := TCtrlContab.Create;
  //CtrlDocumento       := TCtrlDocumento.Create;
  //CtrlLancamento      := TCtrlLancamento.Create;
  CtrlPadrLancImovel  := TCtrlPadrLancImovel.Create(Sistema.IDEmpresa, Sistema.IDModulo);

//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

  CtrlContab.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

  //CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
  //                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

  //CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
  //                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

  CtrlPadrLancImovel.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
  CtrlImobDocumento.Initialize(dtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlImobLancamento.Initialize(dtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim
end;

procedure TfrmExecIntegra.FormDestroy(Sender: TObject);
begin
//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
  FreeAndNil(ComunsImobiliarioDB);
  FreeAndNil(CtrlContab);
  //FreeAndNil(CtrlDocumento);
  //FreeAndNil(CtrlLancamento);
  FreeAndNil(CtrlPadrLancImovel);

  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
  FreeAndNil(CtrlImobDocumento);
  FreeAndNil(CtrlImobLancamento);
  //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim
  inherited;
end;


procedure TfrmExecIntegra.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,True,Sender);
end;

procedure TfrmExecIntegra.ntbIntegraPageChanged(Sender: TObject);
begin
   inherited;
   if ntbIntegra.ActivePage = 'Selecao' then begin
      lblTitulo.Caption := '  Integração das Parcelas [Seleção]';
   end else begin
      lblTitulo.Caption := '  Integração das Parcelas [Confirmação]';
   end;
end;

procedure TfrmExecIntegra.btnContinua1Click(Sender: TObject);
begin
   inherited;

   // Checa tela de seleção
   if (edDataF.Text <> '') and (edDataF.Date < edDataI.Date) then begin
      MsgDlg('A data final não pode ser menor que a data inicial','Erro',mtError,[mbOk],0);
      EdDataF.SetFocus;
      Exit;
   end;
   if edtDataProc.Text = '' then begin
      MsgDlg('A data de Emissão para os documentos de ser informada','Erro',mtError,[mbOk],0);
      EdtDataProc.SetFocus;
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,EdtDataProc.Text) then
   begin
      MsgDlg('Período contábil bloqueado.','Erro',mtError,[mbOk],0);
      EdtDataProc.SetFocus;
      Exit;
   end;
   if edtDataLancto.Text <> '' then
   begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLancto.Text) then
      begin
        MsgDlg('Período contábil bloqueado.','Erro',mtError,[mbOk],0);
        edtDataLancto.SetFocus;
        Exit;
      end;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   // Verifica se no período anterior ficaram parcelas sem serem integradas
   if not VerificaParcelasPendentes then begin
      EdtDataProc.SetFocus;
      Exit;
   end;

   ntbIntegra.ActivePage  := 'Confirma';
   btnContinua2.Enabled   := False;
   btnCancela2.Enabled    := False;

   // Abre tabela com as parcelas a integrar
   Sel;
   btnCancela2.Enabled    := True;
   if not qryParc.IsEmpty then begin
      btnContinua2.Enabled := True;
   end;
   grdParc.SetFocus;
end;

procedure TfrmExecIntegra.btnCancela2Click(Sender: TObject);
begin
   inherited;
   ntbIntegra.ActivePage := 'Selecao';
end;

procedure TfrmExecIntegra.Sel;
begin
   // Carrega filtros e Abre ParcFinancImov
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
   if cbSinal.Checked  then qryParc.ParamByName('pSINAL').AsString  := 'S';
   if cbGerada.Checked then qryParc.ParamByName('pGERA').AsString   := 'S';
   if cbProj.Checked   then qryParc.ParamByName('pPROJ').AsString   := 'S';
   if cbAmort.Checked  then qryParc.ParamByName('pAMORT').AsString  := 'S';
   if cbVista.Checked  then qryParc.ParamByName('pVISTA').AsString  := 'S';

   // Daniel - 18795
   if cbCaucao.Checked then qryParc.ParamByName('pCAUCAO').AsString := 'S';

   if cbAntec.Checked  then qryParc.ParamByName('pANTEC').AsString  := 'S';

   if cbContrato.Checked then qryParc.ParamByName('pFLGCONTRATO').AsString := 'S';
   if cbAcordo.Checked   then qryParc.ParamByName('pFLGACORDO').AsString   := 'S';

   qryParc.Open;
end;

procedure TfrmExecIntegra.FormShow(Sender: TObject);
begin
   inherited;
   ntbIntegra.ActivePage := 'Selecao';
   edtDataProc.DateTime  := Date();
   edDataI.DateTime      := Date();   
end;

procedure TfrmExecIntegra.grdParcDblClick(Sender: TObject);
begin
   inherited;
   // Marca ou Desmarca as parcelas para integração
   if not qryParc.IsEmpty then begin
      // SOL 137529 KTN 898731  Felipe de Oliveira 06/09/2010
      // verifica antes de integrar se a parcela tem amortizações em aberto
      // caso ela tiver exibe uma mensagem de erro, impedindo a integração da parcela
      if ParcelaComAmortizacao then
      begin
         MessageDlg('A parcela do contrato de nº ('+qryParcNUMCONTRATO.AsString+') e data de vencimento ('+qryParcDATAVENCIMENTO.AsString+') '+#13+#10+
                    'tem parcelas amortizadas em aberto e não pode ser integrado!', mtError, [mbOK], 0);
         Exit;
      end
      else
      begin
        qryParc.Edit;
        qryParcCHKINTEGRA.AsInteger := (qryParcCHKINTEGRA.AsInteger Xor 1);
        qryParc.Post;
      end;
   end;
end;

procedure TfrmExecIntegra.qryParcCalcFields(DataSet: TDataSet);
begin
   inherited;
   // Carrega o Tipo de Parcela
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger, -1);
end;

procedure TfrmExecIntegra.btnContinua2Click(Sender: TObject);
begin
   inherited;
   if qryParc.IsEmpty then begin
      MsgDlg('Não ha dados para Integrar','Atenção',mtWarning,[mbOk],0);
   end else begin
      Processa;
      Sel;
      ntbIntegra.ActivePage := 'Erros';
   end;
end;

function TfrmExecIntegra.GravaIntegra(Tipo: Integer): Boolean;
var  sDtIntegra, SQL : String;
     ano, mes, dia : word;
begin
   Result := True;
   DecodeDate(qryParcDATAVENCIMENTO.AsDateTime, ano, mes, dia);
   sDtIntegra := DateToStr(EncodeDate(ano, mes, 1));

   // Define o SQL para atualizar o cod. do documento
   if Tipo = 4 then begin    // Parcela Projetada
      SQL := ' UPDATE PARCFINANCIMOV SET '+
             ' CODDOCUMENTO = '+IntToStr(qryParcCODDOCUMENTO.AsInteger)+
             ' ,DATALANCINTEGRA = TO_DATE(' + QuotedStr(sDtIntegra) + ',''DD/MM/YYYY'') ' +
             ' ,FLGLANCINTEGRA = 1 ' +
             ' WHERE (IDPARCFINANCIMOV = '+IntToStr(qryParcIDPARCFINANCIMOV.AsInteger)+')';
   end else begin
      SQL := ' UPDATE PARCFINANCIMOV SET '+
             ' CODDOCUMENTO = '+IntToStr(qryParcCODDOCUMENTO.AsInteger);

      if qryParcPLNCODIGO.AsInteger > 0 then
         SQL := SQL + ' ,PLNCODIGO   = '+IntToStr(qryParcPLNCODIGO.AsInteger);

      SQL := SQL + ' ,DATALANCINTEGRA = TO_DATE(' + QuotedStr(sDtIntegra) + ',''DD/MM/YYYY'') ' +
                   ' ,FLGLANCINTEGRA = 2 ' +
                   ' WHERE (IDPARCFINANCIMOV = '+IntToStr(qryParcIDPARCFINANCIMOV.AsInteger)+')';
   end;
   if not ExecutarQuery(qryAux,SQL) then Result := False;
   Result := Result;
end;

function TfrmExecIntegra.InicializaParam( const iTipoLanc: Integer ) : Boolean;
var TipoRec, iCodErro : Integer;
    sTipo : String;
begin
   Result := True;

   if (qryParcFLGTIPOCONTRATO.AsString='C') or
      (qryParcFLGTIPOCONTRATO.AsString='P') then // Daniel - 18795
   begin
     case iTipoLanc of
        1 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecSinal;      // Saldo Inicial
        2 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecSinal;      // Sinal
        3 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortiz;    // Parcela Gerada
        4 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecProjecao;   // Projecao de parcelas
        5 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortExtra; // Amortização Extra
        6 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJuros;      // Pagamentos Extras - Divergências
        7 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAVista;     // Venda a Vista
        8 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecSinal;      // Caução
        9 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortiz;    // Parcela Antecipada
       10 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJuros;      // Provisionamento de Juros das parcelas
       11 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecCorrecao;   // Correção das parcelas
     end;
   end else begin
     case iTipoLanc of
        1 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Saldo Inicial
        2 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Sinal
        3 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Parcela Gerada
        4 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Projecao de parcelas
        5 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Amortização Extra
        6 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJurosAC;    // Pagamentos Extras - Divergências
        7 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Venda a Vista
        8 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Caução
        9 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Parcela Antecipada
       10 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJurosAC;    // Provisionamento de Juros das parcelas
       11 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecCorrecaoAC; // Correção das parcelas
     end;
   end;

   if TipoRec = 0 then begin
      case iTipoLanc of
         1  : sTipo := 'Sinal';
         2  : sTipo := 'Sinal';
         3  : sTipo := 'Amortização de Parcelamento';
         4  : sTipo := 'Projeção de Parcelamento';
         5  : sTipo := 'Amortização Extra';
         6  : sTipo := 'Juros de Parcelamento';
         7  : sTipo := 'Venda a Vista';
         8  : sTipo := 'Sinal';
         9  : sTipo := 'Amortização de Parcelamento';
         10 : sTipo := 'Provisionamento de Juros de Parcelamento';
         11 : sTipo := 'Correção Monetária de Parcelamento';
      end;
      memErro.Lines.Add('------------------------------------------------');
      memErro.Lines.Add(qryParcNUMCONTRATO.AsString + ' - ' + qryParcNOMECONTRATO.AsString + ' - Parc. ' + qryParcNUMPARCELA.AsString);
      memErro.Lines.Add('Parametrização Não Encontrada para: ' + sTipo );
      memErro.Lines.Add('------------------------------------------------');
      Result := False;
      Exit;
   end;

   // Carrega o tipo de documento padrão para cada tipo de receita
   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := TipoRec;
   dtmLookImobiliario.qryLookTipoRecDes.Open;
   CodTipoDoc := dtmLookImobiliario.qryLookTipoRecDesCODTIPDOC.AsInteger;

   if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContab,
                                                   iCodErro,
                                                   'R',
                                                   False,
                                                   Sistema.idEmpresa,
                                                   Sistema.idModulo,
                                                   TipoRec,
                                                   qryParcCODTIPIMOVEL.AsString,
                                                   -1,
                                                   qryParcIDCONTRATOIMOVEL.AsInteger) then
   begin
      Result := False;
   end;

   // trata erro
   if iCodErro < 0 then begin
      with dtmLookImobiliario do begin
         LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
         qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := qryParcCODTIPIMOVEL.AsString;
         qryLookTipoImovel.Open;

         if iCodErro = -4 then begin
            memErro.Lines.Add('------------------------------------------------');
            memErro.Lines.Add(qryParcNUMCONTRATO.AsString + ' - ' + qryParcNOMECONTRATO.AsString + ' - Parc. ' + qryParcNUMPARCELA.AsString);
            memErro.Lines.Add('Parametrização Duplicada para: '   + qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' + qryLookTipoRecDesDESCCUSTORECIMO.AsString );
            memErro.Lines.Add('------------------------------------------------');
         end;
         if iCodErro = -5 then begin
            memErro.Lines.Add('------------------------------------------------');
            memErro.Lines.Add(qryParcNUMCONTRATO.AsString + ' - ' + qryParcNOMECONTRATO.AsString + ' - Parc. ' + qryParcNUMPARCELA.AsString);
            memErro.Lines.Add('Parametrização Não Encontrada para: '   + qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' + qryLookTipoRecDesDESCCUSTORECIMO.AsString );
            memErro.Lines.Add('------------------------------------------------');
         end;
         if iCodErro = -6 then begin
            memErro.Lines.Add('------------------------------------------------');
            memErro.Lines.Add(qryParcNUMCONTRATO.AsString + ' - ' + qryParcNOMECONTRATO.AsString + ' - Parc. ' + qryParcNUMPARCELA.AsString);
            memErro.Lines.Add('Tipo de Recebimento Inativo para: '   + qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' + qryLookTipoRecDesDESCCUSTORECIMO.AsString );
            memErro.Lines.Add('------------------------------------------------');
         end;

      end;

      Result := False;
      Exit;
   end;

   // Define Historico contábil
   ParamContab.sHistoricoCtb := DefineHistorico(iTipoLanc,
                                                qryParcIDCONTRATOIMOVEL.AsInteger,
                                                qryParcNUMPARCELA.AsInteger,
                                                qryParcNUMCONTRATO.AsString,
                                                qryParcCODTIPIMOVEL.AsString);

end;



function TfrmExecIntegra.DefineHistorico(const iTipo, iIdContrato, iParcela:Integer;
                                         const sContrato, sCodTipImovel:String): String;
var sTipo : String;
    bImovel : Boolean;
begin
   Result := '';
   case iTipo of
       1 : Result := 'Saldo Inicial';
       2 : Result := 'Sinal do Contrato Nr. '  + sContrato;
       3 : Result := 'Amortização da Parcela ' + IntToStr(iParcela) + ' do Contrato Nr. ' + sContrato;
       4 : Result := 'Projeção da Parcela '    + IntToStr(iParcela) + ' do Contrato Nr. ' + sContrato;
       5 : Result := 'Amortização do Contrato Nr. '   + sContrato;
       6 : Result := 'Pagto Extras do Contrato Nr. '  + sContrato;
       7 : Result := 'Pagto a Vista do Contrato Nr. ' + sContrato;
       8 : Result := 'Caução do Contrato Nr. '        + sContrato;
       9 : Result := 'Amortização da Parcela ' + IntToStr(iParcela) + ' do Contrato Nr. ' + sContrato;
      10 : Result := 'Juros da Parcela '       + IntToStr(iParcela) + ' do Contrato Nr. ' + sContrato;
      11 : Result := 'Corr.Monet. da Parcela ' + IntToStr(iParcela) + ' do Contrato Nr. ' + sContrato;
   end;

   Result := Result + ', Segmento ' + sCodTipImovel + ' - ' + modulo.sPlanoPatro;

   // Adiciona o Nr. do imóvel
   LimpaParametros( qryImoveis );
   qryImoveis.ParamByName('PIDCONTRATOIMOVEL').AsInteger := iIdContrato;
   qryImoveis.Open;

   bImovel := False;
   while not qryImoveis.Eof do begin
      if not qryImoveisIMOCODIGO.IsNull then begin
         if bImovel = False then begin
            Result  := Result + ', Imóvel ';
            bImovel := True;
         end;
         Result := Result + qryImoveisIMOCODIGO.AsString + ', ';
      end;
      qryImoveis.Next;
   end;

end;


function TfrmExecIntegra.LancCar(Tipo: Integer): Double;
var
   iCodDoc, iNumLancto : Int64;
   sOperacao, sMens    : String;
   iSubContaDebCred    : Integer;
   ano, mes, dia       : word;
   dDataLimite         : TDateTime;
   sDataProgramada     : String;
   sNumContrato        : String;
   bSegregaOrigem      : Boolean;
   _cdsAux             : TCmClientDataSet;
   dValor, dValorTotal : Double;
begin
  bSegregaOrigem := True;
  _cdsAux := TCmClientDataSet.Create(nil);
  // Gera o Codigo do Documento
  iCodDoc := CtrlImobDocumento.GetSequenceDocumento;
  //Cássio - SOL Nº 92381 KINTANA Nº 394180
  sNumContrato := '';
  dValor := 0;
  dValorTOTAL := 0;
  try
    // A data de lançamento deve estar compreendida no mês do vencimento
    // Marchetti - 01/03/2007
    // Colocado o IF abaixo conforme determinação do Vinicius.
    // o objeto edtDataLancto possui direito de acesso pelo SAD
    DecodeDate(qryParcDATAVENCIMENTO.AsDateTime, ano, mes, dia);
    if edtDataLancto.Text = '' then
      sDtLancto  := DateToStr(EncodeDate(ano, mes, 1))
    else
      sDtLancto  := edtDataLancto.Text;
    sDtEmissao := DateToStr(edtDataProc.Date);

    // Testa pelo período se é possivel contabilizar
    if ModuloImobiliario.Alienacao.bFlgIntegraContab then
    begin
      liEmpresa   := Sistema.IdEmpresa;
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.IdEmpresa,
                                               Sistema.IdModulo, sDtLancto) then
      begin
        MsgDlg(CtrlContab.MessageInfo, 'Aviso', mtWarning, [mbOk],0);
        Result := -1;
        Exit;
      end;
    end;

    // Define o Tipo de Operação
    iPlanilha := -1;
    if qryParcFLGTIPOLANC.AsInteger = 4 then // 4 - Parcela Projetada
      sOperacao := '12'                            //     não é integrada na contabilidade
    else
      sOperacao := '2 ';

    // Contabiliza o lançamento, retornando o nr. da planilha
    if (ModuloImobiliario.Alienacao.bFlgIntegraContab) and
       (qryParcFLGTIPOLANC.AsInteger <> 4) then
    begin
      iPlanilha := LancContab(Tipo, iCodDoc);
      if iPlanilha < 0 then
      begin
        Result := -1;
        Exit;
      end;
    end;

    // finaliza processo se não foi gerado o codigo do documento
    if iCodDoc <= 0 then
    begin
      Result := -1;
      Exit;
    end
    else
      Result := iCodDoc;

    // tenta converter a SubContaDebCred se não conseguir atribui -1
    if ParamContab.sSubContaDebCred = '' then
      iSubContaDebCred := -1
    else
      iSubContaDebCred := strtoint(ParamContab.sSubContaDebCred);

    // Marchetti - Pendencia 20478
    LimpaParametros(qryDadosCliente);
    qryDadosCliente.ParamByName('IDPESSOA').AsInteger := qryParcIDPESSOA.AsInteger;
    qryDadosCliente.Open;

    LimpaParametros(dtmLancImovel.qryLancImovel);
    dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger         := Sistema.IdEmpresa;
    dtmLancImovel.qryLancImovel.ParamByName('PIDMODULO').AsInteger         := Sistema.IdModulo;
    dtmLancImovel.qryLancImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryParcIDCONTRATOIMOVEL.AsInteger;
    dtmLancImovel.qryLancImovel.Open;

    // Verifica o parametro para a data programada do documento
    dDataLimite  := ComunsImobiliarioDB.DataLimite(qryParcDATAVENCIMENTO.asDateTime,
                                                   qryDadosClienteIDCIDADES.AsInteger,
                                                   qryDadosClienteIDPAIS.AsInteger,
                                                   dtmLancImovel.qryLancImovelCONDIASTOLERANCIA.AsInteger,
                                                   dtmLancImovel.qryLancImovelCONDIASREPASSE.AsInteger,
                                                   qryDadosClienteCODESTADO.AsString,
                                                   dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                                   dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                                   True, False, False);

    if ModuloImobiliario.Alienacao.FLGTIPODATAPROG = 'V' then
      sDataProgramada := FormatDateTime('dd/mm/yyyy',qryParcDATAVENCIMENTO.asDateTime)
    else
      sDataProgramada := FormatDateTime('dd/mm/yyyy', dDataLimite);

    sNumContrato := qryParcIDCONTRATOIMOVEL.AsString;

    CtrlImobDocumento.OpenTransaction := False;
    CtrlImobDocumento.Prepare(OpDocumentoImob, odlEfetivoImob, sdocAbertoImob);
    CtrlImobDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;                    
    CtrlImobDocumento.IdUsuario     := Sistema.IdUsuario;
    CtrlImobDocumento.IdEspAcesso   := Sistema.IdEspAcesso;
    CtrlImobDocumento.IdModulo      := Sistema.IdModulo;
    // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcDATAVENCIMENTO.AsString) then
    begin
        MsgDlg('Período contábil bloqueado - Data Vencimento.', 'Erro', mtError, [mbOk], 0);
        Result := -1;
        Exit;
    end;
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,sDtEmissao) then
    begin
        MsgDlg('Período contábil bloqueado - Data Emissão.', 'Erro', mtError, [mbOk], 0);
        Result := -1;
        Exit;
    end;
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,sDataProgramada) then
    begin
        MsgDlg('Período contábil bloqueado - Data Programada.', 'Erro', mtError, [mbOk], 0);
        Result := -1;
        Exit;
    end;
    // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
    //Seta valores para Documento
    CtrlImobDocumento.SetValues(iCodDoc,
                                iCodDoc, '', '',
                                'R',
                                sOperacao,'','',
                                ParamContab.sContaDebCred,
                                ParamContab.sCentroCustoDebCred,
                                '','','','','','',
                                '',
                                '',
                                qryParcDATAVENCIMENTO.asDateTime,
                                StrToDate(sDtEmissao),
                                StrToDate(sDataProgramada),
                                0,
                                0,0,0,0,0,0,0,
                                CodTipoDoc,
                                Sistema.idEmpresa,
                                Sistema.idModulo,
                                qryParcIDPESSOA.asInteger,
                                0,
                                -1,
                                ParamContab.iUnidNegoc,
                                IntegraBack.Plano,
                                0, 0, Modulo.iMoedaCorrente, 0, 0,
                                Sistema.idUsuario, Sistema.idEmpresa, 1, 0,
                                iSubContaDebCred,
                                qryParcCODPORTFORMA.AsInteger,
                                0,0, qryParcCODFORMA.AsInteger,
                                ParamContab.iIdSegregaCriter,
                                ParamContab.sContaContabilAntecipa ); // Daniel Simões - 17/03/2006


    CtrlImobDocumento.Lanctodocum.SetValues(StrToDate(sDtLancto),
                                            iCodDoc, 0,
                                            qryParcVLRPRESTACAO.AsFloat,
                                            0,
                                            qryParcVLRPRESTACAO.AsFloat,
                                            ParamContab.iUnidNegoc,
                                            ParamContab.iPlanilha,
                                            0,
                                            Sistema.idUsuario,
                                            Sistema.idEmpresa, 0,0,
                                            CodTipoDoc,0,0,
                                            sOperacao, '','','',
                                            ParamContab.sHistoricoCtb,
                                            '','','','D',
                                            Sistema.idModulo,
                                            IntegraBack.Plano,
                                            Sistema.UsaPlanoPatro, False, -1);

    //_cdsAux.Data := ComunsImobiliarioDB.LookupPlanosxContrato(qryParcIDCONTRATOIMOVEL.AsInteger);
    _cdsAux.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(qryParcIDCONTRATOIMOVEL.AsInteger);
    while not _cdsAux.Eof do
    begin
      if _cdsAux.RecNo = _cdsAux.RecordCount then
        dValor := qryParcVLRPRESTACAO.AsFloat - dValorTotal
      else
        dValor := RoundCM((qryParcVLRPRESTACAO.AsFloat * _cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100 ,2);
      dValorTotal := dValorTotal + dValor;

      CtrlImobDocumento.Rateiodocum.SetValues(//qryParcVLRPRESTACAO.AsFloat,
                                              dValor,
                                              0,
                                              0,
                                              0,
                                              Sistema.IdEmpresa,
                                              iCodDoc,
                                              ParamContab.iUnidNegoc,
                                              0,Sistema.idUsuario,
                                              -1,
                                              IntegraBack.Plano,
                                              //IntegraBack.PlanoPrevGlobal,
                                              //IntegraBack.PatroGlobal,
                                              _cdsAux.FieldByName('IDPLANOPREV').asInteger,
                                              _cdsAux.FieldByName('IDPATRO').asInteger,
                                              ModuloImobiliario.Alienacao.iPrograma,
                                              0,
                                              Sistema.IdEmpresa,
                                              ParamContab.sCodTipRecDes,
                                              'R',
                                              ParamContab.sCodCentroRespon,
                                              ModuloImobiliario.Alienacao.sCentroCusto, // André Pontes - 09/06/2005 - pendência 19283
                                               '-1', bSegregaOrigem,0, 0, StrToInt(sNumContrato));

      _cdsAux.Next;
    end;

    try
      if not CtrlImobDocumento.Insert then
      begin
        Result := -1;
        raise Exception.Create(CtrlImobDocumento.MessageInfo);
      end;
    except
      MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.' +#13+
              CtrlImobDocumento.MessageInfo , 'Erro', mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(_cdsAux);
  end;
end;

function TfrmExecIntegra.LancContab(Tipo, iDocumento: Integer): Integer;
var
  iPlnCodigo,iCodDoc,iTpJur,CodTipoDocAnt : Integer;
  sMens  : String;
  iValor : Double;
  ParamContabAnt : TParamContabeisMT;

  iSubContaCredito : Double;
  iSubContaDebito  : Double;
  cdsTemp : TCMClientDataSet;
  bSegregaOrigem: Boolean;
  iIdPatro, iIdPlanoPrev: Integer;
  dValorTotal, dValor : double;
begin
   iCodDoc               := iDocumento;
   iPlnCodigo            := 0;
   ParamContab.iPlanilha := 0;

   iSubContaCredito := -1;
   iSubContaDebito  := -1;

   iIDPatro := 0;
   iIdPlanoPrev := 0;
   dValorTotal := 0;
   dValor := 0;

   //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
   cdsTemp := TCMClientDataSet.Create(nil);
   //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim

   try
     if ParamContab.sSubContaDebito  <> '' then
      iSubContaCredito := StrToFloat(ParamContab.sSubContaDebito);
     if ParamContab.sSubContaCredito <> '' then
      iSubContaDebito  := StrToFloat(ParamContab.sSubContaCredito);

     //cdsTemp.Data := ComunsImobiliarioDB.LookupPlanosxContrato(qryParcIDCONTRATOIMOVEL.AsInteger);
     cdsTemp.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(qryParcIDCONTRATOIMOVEL.AsInteger);

     // Verifica se contabiliza o principal
     if ParamContab.bFlgIntegraContab then
     begin
      // Define o valor a ser contabilizado
      iValor := qryParcVLRNOMINAL.AsFloat;

      if cdsTemp.RecordCount >= 1 then
      begin
       while not cdsTemp.Eof do
       begin
        iIdPatro := cdsTemp.FieldByName('IDPATRO').asInteger;
        iIdPlanoPrev := cdsTemp.FieldByName('IDPLANOPREV').asInteger;

        //Helen - SOL Nº 134228 KINTANA Nº 788955  qryParcVLRNOMINAL.AsFloat errado .
        if cdsTemp.RecNo = cdsTemp.RecordCount then
          //dValor := qryParcVLRNOMINAL.AsFloat - dValorTotal
          dValor := ivalor - dValorTotal
        else
          dValor := RoundCM((qryParcVLRNOMINAL.AsFloat * cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
        dValorTotal := dValorTotal + dValor;

        // Lança o valor de Amortização
        if CtrlImobLancamento.InsereLancaContab ('2',
                                                 Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.idUsuario,
                                                 IntegraBack.Plano,
                                                 ParamContab.iUnidNegoc,
                                                 iSubContaDebito,
                                                 iSubContaCredito,
                                                 iIdPlanoPrev,
                                                 iIdPatro,
                                                 ParamContab.iPlanilha, 0,
                                                 sDtLancto,
                                                 FormatFloat('#0', iCodDoc),
                                                 ParamContab.sHistoricoCtb, '', '', '', '',
                                                 '03',
                                                 ParamContab.sCentroCustoDebito, ParamContab.sContaContabilDebito,
                                                 ParamContab.sCentroCustoCredito,
                                                 ParamContab.sContaContabilCredito, '',
                                                 dValor, False,
                                                 Sistema.UsaPlanoPatro,
                                                 ParamContab.iIdSegregaCriter,
                                                 //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
                                                 -1, -1, -1, True, -1, False,
                                                 qryParcVLRNOMINAL.AsFloat,
                                                 qryParcIDCONTRATOIMOVEL.AsInteger) then
                                                //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim
        begin
          if CtrlImobLancamento.RetornoPlnCodigo > 0 then
            ParamContab.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
        end;
       cdsTemp.Next;
      end;
      end
      else
      begin
        // Lança o valor de Amortização
        if CtrlImobLancamento.InsereLancaContab ('2',
                                                 Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.idUsuario,
                                                 IntegraBack.Plano,
                                                 ParamContab.iUnidNegoc,
                                                 iSubContaDebito,
                                                 iSubContaCredito,
                                                 cdsTemp.FieldByName('IDPLANOPREV').asInteger,
                                                 cdsTemp.FieldByName('IDPATRO').asInteger,
                                                 ParamContab.iPlanilha, 0,
                                                 sDtLancto,
                                                 FormatFloat('#0', iCodDoc),
                                                 ParamContab.sHistoricoCtb, '', '', '', '',
                                                 '03',
                                                 ParamContab.sCentroCustoDebito, ParamContab.sContaContabilDebito,
                                                 ParamContab.sCentroCustoCredito,
                                                 ParamContab.sContaContabilCredito, '',
                                                 qryParcVLRNOMINAL.AsFloat, False,
                                                 Sistema.UsaPlanoPatro,
                                                 ParamContab.iIdSegregaCriter,
                                                 //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Início
                                                 -1, -1, -1, True, -1, False,
                                                 qryParcVLRNOMINAL.AsFloat,
                                                 qryParcIDCONTRATOIMOVEL.AsInteger) then
                                                 //Cássio - SOL Nº 92381 KINTANA Nº 394180 - Fim
        begin
          if CtrlImobLancamento.RetornoPlnCodigo > 0 then
            ParamContab.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
        end;
      end;
      //iPlnCodigo := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      iPlnCodigo := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
    end;

     // Lanca a Correção e o Provisioanamento de Juros separados para parcelamento
     if Tipo in [3,5,9] then begin
        // Guarda a parametrização do principal para retorno após o lancamento do juros e correcao
        ParamContabAnt := ParamContab;
        CodTipoDocAnt  := CodTipoDoc;

        // Contabiliza Provisionamento de Juros (saldo e parcela) somente para parcelas Geradas
        // Na antecipação não contabiliza o juros, que equivale ao desconto por antecipação
        iValor := qryParcVLRJUROS.AsFloat + qryParcVLRJUROSPARC.AsFloat;

        // Marchetti - pendencia 25476
        if ( (Tipo = 3) or ( ( Tipo = 9 ) and ( qryParcFORMACALCULO.AsInteger in [8,12,13,16,17,18] ) ) ) and (iValor <> 0) then
        begin
        // Fim Marchetti - pendencia 25476
           iTpJur := 10;

           // Busca a parametrização para provisionamento de juros
           if InicializaParam( 10 ) then
           begin
            // Verifica se contabiliza o provisionamento de juros
            if ParamContab.bFlgIntegraContab then
            begin
              dValor := 0;
              dValorTotal := 0;
              cdsTemp.First;
              if cdsTemp.RecordCount >= 1 then
              begin
                while not cdsTemp.Eof do
                begin
                  iIdPatro := cdsTemp.FieldByName('IDPATRO').asInteger;
                  iIdPlanoPrev := cdsTemp.FieldByName('IDPLANOPREV').asInteger;

                  if cdsTemp.RecNo = cdsTemp.RecordCount then
                    dValor := iValor - dValorTotal
                  else
                  dValor := RoundCM((iValor * cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  dValorTotal := dValorTotal + dValor;

                  if CtrlImobLancamento.InsereLancaContab ('2',
                                                           Sistema.IdEmpresa,
                                                           Sistema.IdModulo,
                                                           Sistema.idUsuario,
                                                           IntegraBack.Plano,
                                                           ParamContab.iUnidNegoc,
                                                           iSubContaDebito,
                                                           iSubContaCredito,
                                                           iIdPlanoPrev,
                                                           iIdPatro,
                                                           ParamContab.iPlanilha, 0,
                                                           sDtLancto,
                                                           FormatFloat('#0', iCodDoc),
                                                           ParamContab.sHistoricoCtb, '', '', '', '',
                                                           '03',
                                                           ParamContab.sCentroCustoDebito, ParamContab.sContaContabilDebito,
                                                           ParamContab.sCentroCustoCredito,
                                                           ParamContab.sContaContabilCredito, '',
                                                           dValor, False,
                                                           Sistema.UsaPlanoPatro,
                                                           ParamContab.iIdSegregaCriter,
                                                           -1, -1, -1, True, -1, False,
                                                           iValor, qryParcIDCONTRATOIMOVEL.AsInteger) then
                  begin
                    if CtrlImobLancamento.RetornoPlnCodigo > 0 then
                      ParamContab.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
                  end;
                  cdsTemp.Next;
                end;
              end
              else
              begin
                  if CtrlImobLancamento.InsereLancaContab ('2',
                                                           Sistema.IdEmpresa,
                                                           Sistema.IdModulo,
                                                           Sistema.idUsuario,
                                                           IntegraBack.Plano,
                                                           ParamContab.iUnidNegoc,
                                                           iSubContaDebito,
                                                           iSubContaCredito,
                                                           cdsTemp.FieldByName('IDPLANOPREV').asInteger,
                                                           cdsTemp.FieldByName('IDPATRO').asInteger,
                                                           ParamContab.iPlanilha, 0,
                                                           sDtLancto,
                                                           FormatFloat('#0', iCodDoc),
                                                           ParamContab.sHistoricoCtb, '', '', '', '',
                                                           '03',
                                                           ParamContab.sCentroCustoDebito, ParamContab.sContaContabilDebito,
                                                           ParamContab.sCentroCustoCredito,
                                                           ParamContab.sContaContabilCredito, '',
                                                           iValor, False,
                                                           Sistema.UsaPlanoPatro,
                                                           ParamContab.iIdSegregaCriter,
                                                           -1, -1, -1, True, -1, False,
                                                           iValor, qryParcIDCONTRATOIMOVEL.AsInteger) then
                  begin
                    if CtrlImobLancamento.RetornoPlnCodigo > 0 then
                      ParamContab.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
                  end;
                end;
                iPlnCodigo := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
              end;
           end
           else
           begin
            iPlnCodigo := -1;
           end;
        end;

        iValor := qryParcVLRCORRSALDO.AsFloat + qryParcVLRRESIDUO.AsFloat;

        // Contabiliza Correção Monetária
        if iValor <> 0 then begin
           iTpJur := 11;


           // Busca a parametrização para correção monetária
           if InicializaParam( 11 ) then
           begin
            if ParamContab.bFlgIntegraContab then
            begin
              dValor := 0;
              dValorTotal := 0;
              CdsTemp.First;
              if cdsTemp.RecordCount >= 1 then
              begin
                while not cdsTemp.Eof do
                begin
                  iIdPatro := cdsTemp.FieldByName('IDPATRO').asInteger;
                  iIdPlanoPrev := cdsTemp.FieldByName('IDPLANOPREV').asInteger;

                  //Thaise SOL 148062 - O Valor nominal está errado, pois
                  //o valor da Correção Monetária é carregado na variável iValor
                  if cdsTemp.RecNo = cdsTemp.RecordCount then
                    //dValor := qryParcVLRNOMINAL.AsFloat - dValorTotal
                    dValor:= iValor - dValorTotal
                  else
                  dValor := RoundCM((iValor * cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  dValorTotal := dValorTotal + dValor;
                  if CtrlImobLancamento.InsereLancaContab ('2',
                                                           Sistema.IdEmpresa,
                                                           Sistema.IdModulo,
                                                           Sistema.idUsuario,
                                                           IntegraBack.Plano,
                                                           ParamContab.iUnidNegoc,
                                                           iSubContaDebito,
                                                           iSubContaCredito,
                                                           iIdPlanoPrev,
                                                           iIdPatro,
                                                           ParamContab.iPlanilha, 0,
                                                           sDtLancto,
                                                           FormatFloat('#0', iCodDoc),
                                                           ParamContab.sHistoricoCtb, '', '', '', '',
                                                           '03',
                                                           ParamContab.sCentroCustoDebito, ParamContab.sContaContabilDebito,
                                                           ParamContab.sCentroCustoCredito,
                                                           ParamContab.sContaContabilCredito, '',
                                                           dValor, False,
                                                           Sistema.UsaPlanoPatro,
                                                           ParamContab.iIdSegregaCriter,
                                                           -1, -1, -1, True, -1, False,
                                                           iValor, qryParcIDCONTRATOIMOVEL.AsInteger) then
                   begin
                    if CtrlImobLancamento.RetornoPlnCodigo > 0 then
                      ParamContab.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
                   end;
                   cdsTemp.next;
                end;
              end
              else
              begin
                if CtrlImobLancamento.InsereLancaContab ('2',
                                                         Sistema.IdEmpresa,
                                                         Sistema.IdModulo,
                                                         Sistema.idUsuario,
                                                         IntegraBack.Plano,
                                                         ParamContab.iUnidNegoc,
                                                         iSubContaDebito,
                                                         iSubContaCredito,
                                                         cdsTemp.FieldByName('IDPLANOPREV').asInteger,
                                                         cdsTemp.FieldByName('IDPATRO').asInteger,
                                                         ParamContab.iPlanilha, 0,
                                                         sDtLancto,
                                                         FormatFloat('#0', iCodDoc),
                                                         ParamContab.sHistoricoCtb, '', '', '', '',
                                                         '03',
                                                         ParamContab.sCentroCustoDebito, ParamContab.sContaContabilDebito,
                                                         ParamContab.sCentroCustoCredito,
                                                         ParamContab.sContaContabilCredito, '',
                                                         iValor, False,
                                                         Sistema.UsaPlanoPatro,
                                                         ParamContab.iIdSegregaCriter,
                                                         -1, -1, -1, True, -1, False,
                                                         iValor, qryParcIDCONTRATOIMOVEL.AsInteger) then
                begin
                  if CtrlImobLancamento.RetornoPlnCodigo > 0 then
                    ParamContab.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
                end;
              end;
                iPlnCodigo := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
            end;
           end
           else
           begin
            iPlnCodigo := -1;
           end;
        end;

        // Retorna a parametrização do principal existente antes de lançar Juros e Correção
        ParamContab := ParamContabAnt;
        CodTipoDoc  := CodTipoDocAnt;
     end;
     Result := iPlnCodigo;
   finally
    FreeAndNil(cdsTemp);
   end;
end;

procedure TfrmExecIntegra.Processa;
var sMens : String;
    iCodDocumento : Double;
    bResult : Boolean;
    iAtual, iTotReg : Integer;
begin
    // Testa pelo período se é possivel contabilizar
    if ModuloImobiliario.Alienacao.bFlgIntegraContab then begin
       liEmpresa   := Sistema.IdEmpresa;

       if not CtrlContab.TestaDataBloqueadaProc(Sistema.IdEmpresa,
                                                Sistema.IdModulo, DateToStr(Date)) then begin
          MsgDlg(CtrlContab.MessageInfo, 'Aviso', mtWarning, [mbOk],0);
          Exit;
       end;
    end;
    // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
    qryParc.First;
    while not qryParc.Eof do
    begin
       if (qryParcDATAVENCIMENTO.AsString <> '') and
          (qryParcCHKINTEGRA.AsInteger > 0) then
       begin
            if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcDATAVENCIMENTO.AsString) then
            begin
              MsgDlg('Período contábil bloqueado - Data de Vencimento.','Erro',mtError,[mbOk],0);
              memErro.Lines.Add('------------------------------------------------');
              memErro.Lines.Add(qryParcDATAVENCIMENTO.AsString + ' -  Período contábil bloqueado - ' + qryParcNOMECONTRATO.AsString + ' - Parc. ' + qryParcNUMPARCELA.AsString);
              memErro.Lines.Add('------------------------------------------------');
              exit;
            end;
        end;
        qryParc.Next;
    end;
    // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

    memErro.Lines.Clear;

    // Exibe caixa de dialogo com a barra de progresso
    frmProgresso.MostraFormProgresso('Integrando Parcelas...',False,False);
    Application.ProcessMessages;

    // Integra cada parcela selecionada
    qryParc.DisableControls;
    try
       // conta quantos registro serão integrados, para mostrar no progress
       iTotReg := 0;
       iAtual  := 0;
       qryParc.First;
       while not qryParc.Eof do begin
          if qryParcCHKINTEGRA.AsInteger > 0 then iTotReg := iTotReg + 1;

          // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
          if (qryParcDATAVENCIMENTO.AsString <> '') and
             (qryParcCHKINTEGRA.AsInteger > 0) then
          begin
              if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcDATAVENCIMENTO.AsString) then
              begin
                MsgDlg('Período contábil bloqueado - Data de Vencimento.','Aviso',mtWarning,[mbOk],0);
                bResult := False;
                exit;
              end;
          end;
          // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

          qryParc.Next;
       end;

       qryParc.First;
       while not qryParc.Eof do begin
          if qryParcCHKINTEGRA.AsInteger > 0 then begin

             iAtual := iAtual + 1;
             frmProgresso.AndaFormProgresso( iAtual, iTotReg  );

             // Busca os parametros da Contabilização
             if InicializaParam( qryParcFLGTIPOLANC.AsInteger ) then begin

                try
                   StartTransacao;
                   bResult := True;

                   // Caso a projeção já tenha sido integrada, estornar o lancamento.
                   if qryParcFLGLANCINTEGRA.AsInteger > 0 then begin
                      bResult := FuncAlienacao.ExcluiIntegracao(qryParcCODDOCUMENTO.AsInteger,
                                                                qryParcPLNCODIGO.AsInteger,
                                                                qryParcIDPARCFINANCIMOV.AsInteger,
                                                                qryParcFLGTIPOLANC.AsInteger,
                                                                qryParcDATALANCINTEGRA.AsDateTime,
                                                                True,sMens);

                      if not bResult then begin
                         MsgDlg(sMens,'Erro na exclusão da integração anterior',mtError,[mbOk],0);
                      end;
                   end;

                   // Integra o Lançamento
                   if bResult then begin
                     iCodDocumento := LancCar(qryParcFLGTIPOLANC.AsInteger);
                     if iCodDocumento = -1 then bResult := False;
                   end;

                   // Grava o Nr. da planilha / documento e gera boleto
                   if bResult then begin
                     qryParc.Edit;
                     if iPlanilha > 0 then qryParcPLNCODIGO.Value := iPlanilha;
                     qryParcCODDOCUMENTO.Value := iCodDocumento;

                     // Processa Mensagens para Boleto somente se não for projeção
                     if qryParcFLGTIPOLANC.AsInteger <> 4 then begin
                        ProcessaMensagem(qryParcCODDOCUMENTO.AsInteger);
                     end;
                     qryParc.Post;

                     // Grava o Codigo do documento em PARCFINANCIMOV ou AMORTIZACAO EXTRA
                     bResult := GravaIntegra(qryParcFLGTIPOLANC.AsInteger);
                   end;

                   if bResult then
                        CommitTransacao
                   else RollBackTransacao;
                except
                   RollBackTransacao;
                   raise;
                end;
             end;
          end;
          qryParc.Next;
       end;
    finally
       frmProgresso.EscondeFormProgresso;
       qryParc.EnableControls;
    end;
end;

Function TfrmExecIntegra.ParcelaComAmortizacao : Boolean;
var
  qryAmortiza : TQuery;
begin
    qryAmortiza := Tquery.Create(nil);

    qryAmortiza.DatabaseName := 'BaseDados';

    Result := False;
    conNumero := '';
    dataVencimento:= 0;
    qryAmortiza.Close;
    qryAmortiza.SQL.Clear;
    qryAmortiza.SQL.Add('SELECT 1                                                        ');
    qryAmortiza.SQL.Add('FROM PARCFINANCIMOV P,                                          ');
    qryAmortiza.SQL.Add('CONDPAGIMOVEL C                                                 ');
    qryAmortiza.SQL.Add('WHERE C.IDCONDPAGIMOVEL  = P.IDCONDPAGIMOVEL                    ');
    qryAmortiza.SQL.Add('AND P.IDPARCFINANCIMOV = '+qryParcIDPARCFINANCIMOV.AsString);
    qryAmortiza.SQL.Add('AND ((P.FLGTIPOLANC <> 5)                                      ');
    qryAmortiza.SQL.Add('AND EXISTS                                                     ');
    qryAmortiza.SQL.Add('(SELECT 1 FROM PARCFINANCIMOV P, CONDPAGIMOVEL C               ');
    qryAmortiza.SQL.Add('WHERE C.IDCONDPAGIMOVEL = P.IDCONDPAGIMOVEL                    ');
    qryAmortiza.SQL.Add('  AND P.IDCONDPAGIMOVEL = '+ qryParcIDCONDPAGIMOVEL.AsString);
    qryAmortiza.SQL.Add('AND P.FLGTIPOLANC = 5))                                        ');
    qryAmortiza.Open;

    if not qryAmortiza.IsEmpty then
    begin
       Result := True;
       Exit;
    end;
   FreeAndNil(qryAmortiza);
end;

procedure TfrmExecIntegra.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   // Seleciona todas as parcelas

   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do
   begin
      // SOL 137529 KTN 898731  Felipe de Oliveira 06/09/2010
      // verifica antes de integrar se a parcela tem amortizações em aberto
      // caso ela tiver exibe uma mensagem de erro, impedindo a integração da parcela
      if ParcelaComAmortizacao then
      begin
         MessageDlg('A parcela do contrato de nº ('+qryParcNUMCONTRATO.AsString+') e data de vencimento ('+qryParcDATAVENCIMENTO.AsString+') '+#13+#10+
                    'tem parcelas amortizadas em aberto e não pode ser integrado!', mtError, [mbOK], 0);
         qryParc.First;
         qryParc.EnableControls;
         Exit;
      end
      else
      begin
        qryParc.Edit;
        qryParcCHKINTEGRA.AsInteger := 1;
        qryParc.Post;
        qryParc.Next;
      end;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;


procedure TfrmExecIntegra.btnLimpaClick(Sender: TObject);
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


procedure TfrmExecIntegra.ProcessaMensagem(iDocumento: int64);
var vMensagem : array of string;
begin
   SetLength(vMensagem, 9);
   ProcuraMsgContrato(vMensagem);
   TrataMsg(vMensagem);
   FuncAlienacao.InsereMsgBoleto(iDocumento, vMensagem);
end;


procedure TfrmExecIntegra.ProcuraMsgContrato(var vMsg: array of string);
begin
   try
      try
         with dtmLancImovel.qrySelectMsgLanc do begin
            LimpaParametros(dtmLancImovel.qrySelectMsgLanc);
            ParamByName('PIDMSGBOLETO').AsInteger := qryParcIDMSGBOLETO.AsInteger;
            Open;
         end;

         if not(dtmLancImovel.qrySelectMsgLanc.IsEmpty) then begin
            vMsg[0]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_1.AsString, 1, 69);
            vMsg[1]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_2.AsString, 1, 69);
            vMsg[2]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_3.AsString, 1, 69);
            vMsg[3]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_4.AsString, 1, 69);
            vMsg[4]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_5.AsString, 1, 69);
            vMsg[5]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_6.AsString, 1, 69);
            vMsg[6]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_7.AsString, 1, 69);
            vMsg[7]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_8.AsString, 1, 69);
            vMsg[8]  := copy(dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_9.AsString, 1, 69);
         end;
      except
         
      end;
   finally
      dtmLancImovel.qrySelectMsgLanc.Close;
   end;
end;

procedure TfrmExecIntegra.TrataMsg(var vMsg: array of string);
var
   vCuringa, vValor        : array of string;
   dDataVenc, dDataTolera  : TDateTime;
   fMulta                  : currency;
   fMora, fPercentMora     : currency;
   sMulta, sMora, sPeriodo : string;
   sParcela,sParcelas      : string;
   sImovel,sPerParc        : string;
   cdsTemp : TCMClientDataSet;
   //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
   ctrlContratoImovel : TctrlContratoImovel;
begin

   try
       //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Inicio
       ctrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                         Sistema.IdModulo,
                                                         Sistema.IdUsuario,
                                                         Sistema.IdEspAcesso,
                                                         Sistema.UsaPlanoPatro );

       ctrlContratoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                      ComunsImobiliario.MensErroMT);
       //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela - Fim

      // Início: 21/01/2004 --- Marcio Motta ------- Pendência: 15799 ------------------------------
      // Cria um CDS temporário para receber os dados
      cdsTemp := TCMClientDataSet.Create( nil );
      // Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

      SetLength(vCuringa, 12);
      SetLength(vValor, 12);

      // Data de vencimento
      dDataVenc   := qryParcDATAVENCIMENTO.AsDateTime;

      // Data limite para pagamento
      dDataTolera := dDataVenc;

      // Nome do Imovel Mestre
      sImovel := qryParcNOMEMESTRE.AsString;

      // Nr. da Parcela e Total de Parcelas
      sParcela  := FormatFloat('##0', qryParcNUMPARCELA.AsFloat);
      sParcelas := FormatFloat('##0', qryParcNUMPARCELAS.AsFloat);

      // Define o Tipo de Parcela
      sPerParc := '';
      if qryParcTIPOCONDPAG.AsString = 'S' then begin
         sPerParc := 'Sinal';
      end;
      if qryParcTIPOCONDPAG.AsString = 'V' then begin
         sPerParc := 'Venda a Vista';
      end;
      if qryParcTIPOCONDPAG.AsString = 'C' then begin
         sPerParc := 'Caução';
      end;
      if (qryParcTIPOCONDPAG.AsString = 'P') or
         (qryParcTIPOCONDPAG.AsString = 'R') then begin
         if qryParcPRAZO.AsString = 'M' then begin
            case qryParcPERIODO.AsInteger of
               1 : sPerParc := 'Mensal';
               2 : sPerParc := 'Bimestral';
               3 : sPerParc := 'Trimestral';
               4 : sPerParc := 'Quadrimestral';
               5 : sPerParc := 'xxxx';
               6 : sPerParc := 'Semestral';
            end;
         end else begin
            case qryParcPERIODO.AsInteger of
               1 : sPerParc := 'Anual';
               2 : sPerParc := 'Bianual';
               3 : sPerParc := 'xxxx';
               4 : sPerParc := 'xxxx';
               5 : sPerParc := 'xxxx';
               6 : sPerParc := 'xxxx';
            end;
         end;
      end;

      // Carrega o CDS com os dados necessários de vigência de Multa, Juros, CM
      cdsTemp.Data := ctrlContratoImovel.BuscaParamCMJurosMulta (qryParcIDCONTRATOIMOVEL.AsFloat , qryParcDATAVENCIMENTO.AsDateTime);

      // Multa (se valor, então valor; senão, calcula valor a partir do percentual
      if (cdsTemp.FieldByName('VLRMULTA').AsFloat > 0) then begin
         fMulta   := cdsTemp.FieldByName('VLRMULTA').AsFloat;
         sMulta   := Modulo.sMoedaCorrente + FormatFloat('#,##0.00', fMulta);
      end else begin
         fMulta   := (qryParcVLRPRESTACAO.AsCurrency * cdsTemp.FieldByName('PERCMULTA').AsFloat / 100);
         sMulta   := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', fMulta);
      end;

      // Juros (idem)
      if (cdsTemp.FieldByName('VLRJUROS').AsFloat > 0) then begin
         fMora    := cdsTemp.FieldByName('VLRJUROS').AsFloat;
         sMora    := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', fMora);
      end else begin
         fMora    := (qryParcVLRPRESTACAO.AsCurrency * cdsTemp.FieldByName('PERCJUROS').AsFloat / 100);
         { TODO -oAndre -cPhon : se for proporcional, divide por 30 *** É: tá cravado também !!! }
         if cdsTemp.FieldByName('FLGJUROSPROPORC').AsString = 'S' then begin
            if cdsTemp.FieldByName('PERIODOJUROS').AsString = 'M' then fMora := fMora / 30;
            if cdsTemp.FieldByName('PERIODOJUROS').AsString = 'A' then fMora := fMora / 365;
         end;
         sMora := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', fMora);
      end;

      // periodicidade de aplicação da mora
      if cdsTemp.FieldByName('FLGJUROSPROPORC').AsString = 'S' then begin
         sPeriodo := 'dia';
      end else begin
         if cdsTemp.FieldByName('PERIODOJUROS').AsString = 'D' then sPeriodo := 'dia';
         if cdsTemp.FieldByName('PERIODOJUROS').AsString = 'M' then sPeriodo := 'mês';
         if cdsTemp.FieldByName('PERIODOJUROS').AsString = 'A' then sPeriodo := 'ano';
      end;

      // inicializa os curingas e os valores
      vCuringa[0]    := '<parcela>';   {|}   vValor[0]   := sParcela;
      vCuringa[1]    := '<parcelas>';  {|}   vValor[1]   := sParcelas;
      vCuringa[2]    := '<vo>';        {|}   vValor[2]   := '<vo>';
      vCuringa[3]    := '<cm>';        {|}   vValor[3]   := '<cm>';
      vCuringa[6]    := '<dataval>';   {|}   vValor[6]   := '<dataval>';
      vCuringa[4]    := '<juros>';     {|}   vValor[4]   := sMora;
      vCuringa[5]    := '<multa>';     {|}   vValor[5]   := sMulta;
      vCuringa[7]    := '<imovel>';    {|}   vValor[7]   := sImovel;
      vCuringa[8]    := '<recdes>';    {|}   vValor[8]   := 'Alienação';
      vCuringa[9]    := '<tolera>';    {|}   vValor[9]   := FormatDateTime('dd/mm/yyyy', dDataTolera);
      vCuringa[10]   := '<periodo>';   {|}   vValor[10]  := sPeriodo;
      vCuringa[11]   := '<perparc>';   {|}   vValor[11]  := sPerParc;

      FuncoesImob.SubstituiCuringa(vMSG, vCuringa, vValor);
   finally
      FreeAndNil(cdsTemp);
      //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
      FreeAndNil(ctrlContratoImovel);      
   end;
end;

procedure TfrmExecIntegra.grdParcCalcCellColors(Sender: TObject;
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

procedure TfrmExecIntegra.grdParcTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmExecIntegra.fcShapeBtn1Click(Sender: TObject);
begin
  inherited;
  ntbIntegra.ActivePage := 'Confirma';
end;

function TfrmExecIntegra.VerificaParcelasPendentes: Boolean;
var
  Ano, Mes : Integer;
begin
  Result := True;
  // Competência (mês/ano)
  Ano := StrToInt(FormatDateTime('YYYY',edDataI.date));
  Mes := StrToInt(FormatDateTime('MM',edDataI.date));

  If Mes = 1 then // Janeiro
   begin // Mes e Ano anterior
    Ano := Ano - 1;
    Mes := 12
   end
  else // Mes anterior
    Mes := Mes - 1;

  QryParcelasPend.Close;
  QryParcelasPend.ParamByName('MESANO').AsString := FormatFloat('00',Mes) + IntToStr(Ano);
  QryParcelasPend.Open;

  if QryParcelasPend.RecordCount > 0 then begin
     Result := MsgDlg('Existem receitas de competência anterior pendente de cobrança! Continua ? ',
                      'Confirmação', mtConfirmation, [mbYes, MbNo], 0) = mrYes;
  end;

  QryParcelasPend.Close
end;

end.
