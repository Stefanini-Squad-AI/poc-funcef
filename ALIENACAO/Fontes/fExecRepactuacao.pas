unit fExecRepactuacao;

// -----------------------------------------------------------------------------
//Rotina..........: EliminaParcelas
//Solicitação.....: WO 15334
//Data............: 05/11/2024
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Alteração da rergra de eliminação de parcelas repactuadas, para evitar exclusão
//                  de parcelas integradas.
//------------------------------------------------------------------------------------------------
//Solicitação.....: WO 7669
//Data............: 09/05/2024
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Criação de Nova Forma de Cálculo.
//------------------------------------------------------------------------------------------------
//Rotina..........: btnContinua3Click, ContabDesconto
//N. SIG..........: 97015
//Data............: 27/04/2020
//Responsável.....: Eedilaine
//Descrição.......: Ajuste para contabilizaçao quando repactuação é anterior a data da parcela
//------------------------------------------------------------------------------------------------
//Rotina..........: TemParcIntegrada
//N. Sol..........: 231549
//N. Kintana......:
//Data............: 07/05/2014
//Responsável.....: Fernando Xavier
//Descrição.......: Correção na validação da Repactuação Contratual.
//------------------------------------------------------------------------------------------------
//
//	   Lançamento e Calculo de Repactuação Contratual
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  11/03/2002
//	Data de Término   :  12/04/2002
//
// -----------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 172902/8221
//Nº KINTANA..: 1577344
//Data........: 20/03/2012
//Responsável.: Helen V. Bianchi
//Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
//------------------------------------------------------------------------------
//Rotina..........: FormCreate
//N. Sol..........: 142074
//N. Kintana......: 902858
//Data............: 16/08/2010
//Responsável.....: Cássio Camargo
//Descrição.......: Correção na criação de objeto utilizado na Repactuação
//                  Contratual.
//------------------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Mask, wwdbedit, Wwdbspin,
  wwdblook, CMDBLookupCombo, mProposta, TREdit, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, DBCtrls, wwdbdatetimepicker, uCtrlParamIntegra,
  CMDateTimePicker, DBTables, Db, Wwdatsrc, Wwquery, UFuncAlienacao, uFuncoesImob, uCtrlImobDocumento,//uCtrlDocumento,
  Wwdotdot, Wwdbcomb, mTipoOperacao, uCtrlImobLancamento{uCtrlLancamento},
  uCtrlPadrLancImovel, uCtrlPadroes, dbClient, uComunsImobiliarioDB, uCMClientDataSet,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;
type
  TfrmExecRepactuacao = class(TfrmWizard)
    nbRepactua: TNotebook;
    gbContrato: TGroupBox;
    Label3: TLabel;
    molProposta1: TmolProposta;
    edtComprador: TEdit;
    gbInicio: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    dbgParc: TwwDBGrid;
    Label9: TLabel;
    edTotSaldoDev: TDBRealEdit;
    Label8: TLabel;
    edTotAtraso: TDBRealEdit;
    Label7: TLabel;
    edNovoSaldo: TDBRealEdit;
    Panel1: TPanel;
    btnContinua1: TfcShapeBtn;
    btnContinua2: TfcShapeBtn;
    btnContinua3: TfcShapeBtn;
    btnCancela2: TfcShapeBtn;
    btnCancela3: TfcShapeBtn;
    qryParc: TwwQuery;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcNUMPARCELA: TStringField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcDATAPAGAMENTO: TDateTimeField;
    qryParcVLRPAGO: TFloatField;
    qryParcVLRDEVIDO: TFloatField;
    qryParcCAL_TIPO: TStringField;
    qryParcVLRJUROS: TFloatField;
    qryParcVLRRESIDUOATUALI: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    dsParc: TwwDataSource;
    updParc: TUpdateSQL;
    qryMoeda: TwwQuery;
    qryMoedaMOESIGLA: TStringField;
    qryMoedaFLGPERCVALOR: TStringField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOECODIGO: TFloatField;
    qryCondPag: TwwQuery;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryAlteradores: TwwQuery;
    qryAlteradoresDESCRICAO: TStringField;
    qryAlteradoresHISTORICOCOMPL: TStringField;
    qryAlteradoresVALOR: TFloatField;
    qryAlteradoresDATALANCTO: TDateTimeField;
    qryAlteradoresCODDOCUMENTO: TFloatField;
    qryAlteradoresNUMLANCTO: TFloatField;
    qryAlteradoresCODALTERADOR: TFloatField;
    qryAlteradoresPLNCODIGO: TFloatField;
    qryAlteradoresVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresDEBCRE: TStringField;
    qryAlteradoresOPERACAO: TStringField;
    qryUpdParc: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField2: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    edSaldoDev: TDBRealEdit;
    Label11: TLabel;
    dblcbIndCorr: TCMDBLookupCombo;
    dblcbIndProj: TCMDBLookupCombo;
    Label12: TLabel;
    cmDtVencto: TCMDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    dbedtParc: TDBRealEdit;
    Label16: TLabel;
    dbEdtJuros: TDBRealEdit;
    qryInsCondRepactua: TwwQuery;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryParcVLRPRESTCORRIG: TFloatField;
    qryParcVLRMULTACORRIG: TFloatField;
    qryParcVLRJUROSCORRIG: TFloatField;
    qryParcCHKREPACTUA: TFloatField;
    Label17: TLabel;
    edTotRepac: TDBRealEdit;
    qryParcCODTIPIMOVEL: TStringField;
    GroupBox2: TGroupBox;
    dbgCondPag: TwwDBGrid;
    dsCondPag: TwwDataSource;
    qryCondPagCHKREPACTUA: TFloatField;
    updCondPag: TUpdateSQL;
    qryCondPagIDREPACTUA: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagCONDATAASSINATURA: TDateTimeField;
    qryCondPagCAL_INTERVALO: TStringField;
    qryCondPagCAL_PERTAXA: TStringField;
    qryCondPagDSCINDCORR: TStringField;
    qryCondPagDATAVENCTOINICIAL: TDateTimeField;
    qryInsRepactua: TwwQuery;
    GroupBox3: TGroupBox;
    DBSpnQtde: TwwDBSpinEdit;
    Label4: TLabel;
    Panel4: TPanel;
    bbAplicar: TBitBtn;
    bbExcluir: TBitBtn;
    DBgrdAlteradoresLanc: TwwDBGrid;
    qryCondResult: TwwQuery;
    dsCondResult: TwwDataSource;
    updCondResult: TUpdateSQL;
    qryCondResultVLRFINANC: TFloatField;
    qryCondResultDATAVENCIMENTO: TDateTimeField;
    qryCondResultNUMPARCELAS: TFloatField;
    qryCondResultINTERVALO: TFloatField;
    qryCondResultPERPARC: TStringField;
    qryCondResultINDCORR: TFloatField;
    qryCondResultINDPROJ: TFloatField;
    qryCondResultJUROS: TFloatField;
    qryCondResultPERJUROS: TStringField;
    qryCondResultIDCONDRESULT: TFloatField;
    qryCondResultIDCONTRATOIMOVEL: TFloatField;
    qryCondResultDSCINDCORR: TStringField;
    qryCondResultDSCINDPROJ: TStringField;
    rgTipoRepactua: TRadioGroup;
    Label46: TLabel;
    dbedtMesRefReajuste: TwwDBSpinEdit;
    Label47: TLabel;
    qryCondPagMESREFREAJUSTE: TFloatField;
    qryCondResultMESREFREAJUSTE: TFloatField;
    lblPerProj: TLabel;
    edtPerProj: TDBRealEdit;
    lblPerProj2: TLabel;
    lblPeriod: TLabel;
    dbcbPerJur: TwwDBComboBox;
    gbIntervalo: TGroupBox;
    dbspnPeriodo: TwwDBSpinEdit;
    dbcbPerParc: TwwDBComboBox;
    GroupBox4: TGroupBox;
    dbcbFormaCalculo: TwwDBComboBox;
    qryCondResultFORMACALCULO: TFloatField;
    qryCondResultPERPROJ: TFloatField;
    qryCondResultDSCFORMACALCULO: TStringField;
    dbcbJurosCarencia: TDBCheckBox;
    lblJurCarencia: TLabel;
    qryCondPagFLGJURCARENCIA: TStringField;
    qryCondResultFLGJURCARENCIA: TStringField;
    Label2: TLabel;
    cmdtAmortiz: TCMDateTimePicker;
    qryCondResultDATAINIAMORTIZ: TDateTimeField;
    qryCondPagDATAINIAMORTIZ: TDateTimeField;
    cbContabiliza: TCheckBox;
    Label15: TLabel;
    Panel3: TPanel;
    molTipoOperacao: TmolTipoOperacao;
    Panel5: TPanel;
    btnAplicaOperacao: TBitBtn;
    btnExcluiOperacao: TBitBtn;
    edtValorOperacao: TDBRealEdit;
    Label18: TLabel;
    wwDBGrid1: TwwDBGrid;
    edTotDesc: TDBRealEdit;
    Label1: TLabel;
    edtTotAcres: TDBRealEdit;
    Label19: TLabel;
    fcShapeBtn1: TfcShapeBtn;
    btnContinua4: TfcShapeBtn;
    qryRepCondImovxOper: TwwQuery;
    dsRepCondImovXOper: TDataSource;
    updRepCondImovXOper: TUpdateSQL;
    edtNovoSaldoOper: TDBRealEdit;
    Label20: TLabel;
    qryRepCondImovxOperIDREPACTUA: TFloatField;
    qryRepCondImovxOperIDTIPOCUSTORECIMO: TFloatField;
    qryRepCondImovxOperFLGTIPOOPER: TStringField;
    qryRepCondImovxOperVLROPERACAO: TFloatField;
    qryRepCondImovxOperOBSERVACAO: TStringField;
    Label21: TLabel;
    memObservacao: TMemo;
    qryRepCondImovxOperDESC_TIPOOPER: TStringField;
    qryRepCondImovxOperLANCNUMLAN: TFloatField;
    edtSaldoAnterior: TDBRealEdit;
    Label22: TLabel;
    qryImoveis: TwwQuery;
    qryImoveisIMOCODIGO: TStringField;
    GroupBox5: TGroupBox;
    edDataRepactua: TCMDateTimePicker;
    chkNovaCondPag: TCheckBox;
    qryParcVLRAMORTIZACAO: TFloatField;
    GroupBox6: TGroupBox;
    DBcboAlterador: TwwDBLookupCombo;
    qryCondPagCODTIPIMOVEL: TStringField;
    btnInverteSelecao: TBitBtn;
    btnMarcaTodasParcelas: TBitBtn;
    qryParcFLGTIPOCONTRATO: TStringField;
    qryCondResultDATAINI: TDateTimeField;
    Label23: TLabel;
    cmDataIni: TCMDateTimePicker;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nbRepactuaPageChanged(Sender: TObject);
    procedure btnContinua1Click(Sender: TObject);
    procedure btnCancela2Click(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure btnContinua2Click(Sender: TObject);
    procedure btnContinua3Click(Sender: TObject);
    procedure dbgParcDblClick(Sender: TObject);
    procedure dbgParcTopRowChanged(Sender: TObject);
    procedure dbgParcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgCondPagDblClick(Sender: TObject);
    procedure qryCondPagCalcFields(DataSet: TDataSet);
    procedure bbAplicarClick(Sender: TObject);
    procedure bbExcluirClick(Sender: TObject);
    procedure btnContinua4Click(Sender: TObject);
    procedure btnAplicaOperacaoClick(Sender: TObject);
    procedure molTipoOperacao1btnBuscaTipoOperClick(Sender: TObject);
    procedure btnExcluiOperacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboMesChange(Sender: TObject);
    procedure btnMarcaTodasParcelasClick(Sender: TObject);
    procedure btnInverteSelecaoClick(Sender: TObject);
  private
    { Private declarations }
    ParamContabeis : TParamContabeisMT;
    liRetFuncao,liEmpresa,liExercicio,liPeriodo : LongInt;
    bMesclaCondPag : Boolean;
    iAltJuros,iAltMulta,iAltCorr : Integer;
    sAltJuros,sAltMulta,sAltCorr : String;

    //CtrlLancamento : TCtrlLancamento;
    CtrlLancamento : TCtrlImobLancamento;
    CtrlPadrLancImovel  : TCtrlPadrLancImovel;
    //CtrlDocumento       : TCtrlDocumento;
    CtrlDocumento       : TCtrlImobDocumento;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    sFiltro : String;

    procedure AbreCondPag(const iContrato: Integer);
    function  AbreParcelasEmAtraso : Boolean;
    procedure AbreCondPagDefault(const iCond: Integer);
    procedure CarregaCondPag(var CondPag: TCondPag) ;
    function  VerificaPreenchimentoSelecao : Boolean;
    function  VerificaPreenchimentoCondicao: Boolean;
    function  VerificaTotalCondicoes: Boolean;
    function  VerificaCondPag   : Boolean;
    function  InicializaParam   (const sCodTipImovel, sTipoOperacao: String; const iTipoRec:Integer): Boolean;  // Busca dados da parametrização contabil
    function  GeraNovaCondPag   : Boolean;
    function  AtualizaDataFim   (const iIdRepactua: Integer): Boolean;
    function  EliminaParcelas   : Boolean;
    function  RecalculaParcelas : Boolean;
    function  QtdeMinimaParcelas(const iIdCondInicial: Integer): Double;
    function  RepactuaParcelas  (var iPlnCodigo: Double; var fTotIncorp: Extended): Boolean;
    function  ContabDesconto    (var iPlnCodigo:Double; const fTotDesconto:Extended; const iIdContratoImovel: Integer) : Boolean;
    function  GeraRepactuacao   (const iPlnCodigo: Double; const fTotIncorp,fTotDesconto:Extended; var iIdRepactua:Integer) : Boolean;
    function  ExcluiAlteradores (const iDocumento: Integer): Boolean;
    function  LancaAlteradores  (const iDocumento: Integer; var fVlrMulta,fVlrJuros,fVlrCorr: Extended): Boolean;
    function  IncorporaSaldo    (const iCodDoc: Integer; const fVlrRepac:Extended; const iIdContratoImovel: integer; var iPlnCodigo:double) : Boolean;

    procedure CalculaOperacoes;

  public
    { Public declarations }
  end;

var
  frmExecRepactuacao: TfrmExecRepactuacao;

implementation

uses uDataBase, uComunsImobiliario, uVerificaPreenchimento, DFinanciamento, uMensErro,
     uIntegraBack, uSistema, dImobiliario, uFuncaoGeral, uCalcDocumento, dLookImobiliario,
     uDiasInUteis, uModuloImobiliario, fAguarde, dMS;


{$R *.DFM}

procedure TfrmExecRepactuacao.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   // Busca um contrato e abre as condições de pagamento disponiveis
   molProposta1.btnBuscaPropClick(2,True,Sender);
   if molProposta1.iProposta > 0 then begin
      edtComprador.Text := molProposta1.sComprador;
      AbreCondPag(molProposta1.iProposta);
      
      qryRepCondImovxOper.open;

   end else begin
      edtComprador.Clear;
      AbreCondPag(-1);
   end;
end;


procedure TfrmExecRepactuacao.molProposta1btnLimpaPropClick(Sender: TObject);
begin
   molProposta1.btnLimpaPropClick(Sender);
   if molProposta1.iProposta > 0 then begin
      edtComprador.Text := molProposta1.sComprador;
      AbreCondPag(molProposta1.iProposta);
   end else begin
      edtComprador.Clear;
      AbreCondPag(-1);
   end;
end;


procedure TfrmExecRepactuacao.AbreCondPag(const iContrato: Integer);
begin
   // Abre codições de pagamento disponíveis para repactuação
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsInteger := iContrato;
   qryCondPag.Open;
end;


procedure TfrmExecRepactuacao.FormShow(Sender: TObject);
begin
   inherited;
   cboMes.ItemIndex     := DiasUteis.ExtraiMes(Date) -1;
   DBSpnAno.Value       := DiasUteis.ExtraiAno(Date);
   DBSpnQtde.Value      := 1;
   edDataRepactua.Date  := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   nbRepactua.PageIndex := 0;
   qryMoeda.Open;
   AbreCondPag(-1);
end;

procedure TfrmExecRepactuacao.nbRepactuaPageChanged(Sender: TObject);
begin
   inherited;
   case nbRepactua.PageIndex of
      0 : lblTitulo.Caption := 'Repactuação Contratual [ Seleção ]';
      1 : lblTitulo.Caption := 'Repactuação Contratual [ Parcelas ]';
      2 : lblTitulo.Caption := 'Repactuação Contratual [ Condição ]';
   end;
end;

procedure TfrmExecRepactuacao.btnContinua1Click(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoSelecao then begin
      if AbreParcelasEmAtraso then begin

         // Abre Tabela virtual de condições resultantes
         qryCondResult.Close;
         qryCondResult.Open;

         // Abre alteradores para quitação de documentos
         with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
            LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
            ParamByName('PCODTIPIMOVEL').AsString     := qryParcCODTIPIMOVEL.AsString;
            ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
            ParamByName('PRECPAG').AsString           := 'R';
            ParamByName('PACRESDECRES').AsString      := 'C';
            Open;
         end;

         nbRepactua.PageIndex := nbRepactua.PageIndex + 1;
      end;
   end;
end;



// -----------------------------------------------------------------------------
// Verifica o preenchimento da tela de seleção
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.VerificaPreenchimentoSelecao: Boolean;
var dIniRepactua : TDateTime;
    iDia, iMes, iAno : Word;
begin
   Result := False;
   try
      if molProposta1.iProposta <= 0 then
         raise EValidacao.CreateVal('Selecione um Contrato',molProposta1.btnBuscaProp);

      if (cbomes.ItemIndex = -1) or (DBspnAno.Value < 1000) then
         raise EValidacao.CreateVal('Selecione um Período Válido',cbomes);

      if (edDataRepactua.Text = '')  then
         raise EValidacao.CreateVal('Informe a data da Repactuação',edDataRepactua);

      if (DBSpnQtde.Value < 1) then
         raise EValidacao.CreateVal('Pelo menos uma Condição Resultante deverá ser Criada',DBSpnQtde);

      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataRepactua.Text) then
        raise EValidacao.CreateVal('Período contábil bloqueado para data de Repactuação.',edDataRepactua);
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim


      if not VerificaCondPag then
         raise EValidacao.CreateVal('',dbgCondPag);
   except
      on ev : EValidacao do begin
         if (ev.Show) and (ev.message <> '')
            then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



// -----------------------------------------------------------------------------
// Verifica e abre todas as parcelas em atraso das condições selecionadas com
// base na data da repactuação
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.AbreParcelasEmAtraso : Boolean;
var rTotAtraso,rSaldoDev,rTotResiduo : Extended;
    dDataIni   : TDateTime;
    sSql,sCond, sDtAtualiza : String;
    bOperacional : Boolean;
begin
   Result      := True;
   rTotAtraso  := 0;
   rTotResiduo := 0;
   rSaldoDev   := 0;

   sDtAtualiza := ' TO_DATE( ' + QuotedStr(FormatDateTime('DD/MM/YYYY',edDataRepactua.Date)) + ',''DD/MM/YYYY'') ';

   // Inicializa a Clausula IN
   sCond := 'AND PF.IDCONDPAGIMOVEL IN(';

   qryCondPag.First;
   while not qryCondPag.eof do begin
      if qryCondPagCHKREPACTUA.AsInteger = 1 then begin

         // Corrige parcelas em atraso até a data da Repactuação apenas se não houver atualização diária.
         if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) or
            (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
            (ModuloImobiliario.Alienacao.iTipoOperAtualCM    <= 0) then begin
            bOperacional := False;
            if not FuncAlienacao.CorrigeParcelas(molProposta1.iProposta, -1, -1, -1,
                                                 qryCondPagIDCONDINICIAL.AsInteger,
                                                 edDataRepactua.Date) then begin
               MsgDlg('Erro ao atualizar as parcelas em atraso','Erro ',mtError,[mbOK],0);
               Result := False;
               Exit;
            end;
         end else begin
            bOperacional := True;
         end;

         // Busca Saldo Devedor na Data da Repactuação
         rSaldoDev := rSaldoDev + FuncAlienacao.CalcSaldoDevedor(qryCondPagIDCONTRATOIMOVEL.AsInteger,
                                                                 qryCondPagIDCONDINICIAL.AsInteger,
                                                                 edDataRepactua.Date);

         // Monta a clausula IN para cada condição selecionada
         sCond := sCond + FormatFloat('#0',qryCondPagIDCONDINICIAL.asFloat) + ',';
      end;
      qryCondPag.Next;
   end;
   qryCondPag.First;

   // Finaliza a clausula IN
   sCond := Copy(sCond,1,Length(sCond)-1) + ')';

   // Abre tabela com as parcelas em atraso
   LimpaParametros(qryParc);
   with qryParc.SQL do begin
      Clear;
      if not bOperacional then begin

          Add('SELECT');
          Add('     (0) AS CHKREPACTUA,');
          Add('     PF.IDPARCFINANCIMOV,');
          Add('     PF.IDCONDPAGIMOVEL,');
          Add('     CP.IDCONTRATOIMOVEL,');
          Add('     CI.FLGTIPOCONTRATO,');
          Add('     IM.CODTIPIMOVEL,');
          Add('     PF.CODDOCUMENTO,');
          Add('     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ' + QuotedStr('/') + ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,');
          Add('     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO,');
          Add('     DECODE(NVL(PF.FLGRESIDUOINCORP,''N''),' + QuotedStr('N') + ',PF.VLRRESIDUOATUALI,0) AS VLRRESIDUOATUALI,');

          Add('     DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO) AS VLRPRESTACAO,');
          Add('     PF.VLRAMORTIZACAO,');
          Add('     PF.VLRJUROS,');
          Add('     PF.FLGTIPOLANC,');
          Add('     PF.FLGLANCINTEGRA,');
          Add('     PF.DATAPAGAMENTO,');
          Add('     PF.VLRPAGO,');
          Add('     PF.VLRPRESTCORRIG,');
          Add('     PF.VLRMULTACORRIG,');
          Add('     PF.VLRJUROSCORRIG,');
          Add('     ROUND( ( NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0) + NVL(PF.VLRJUROSCORRIG,0) ), 2) AS VLRDEVIDO ');

          Add('FROM');
          Add('     PARCFINANCIMOV PF,');
          Add('     CONDPAGIMOVEL  CP,');
          Add('     CONTRATOIMOVEL CI,');

          Add('     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,');
          Add('              I.CODTIPIMOVEL AS CODTIPIMOVEL');
          Add('       FROM');
          Add('              CONTRATOXIMOVEL CXI,');
          Add('              IMOVEL I,');
          Add('              IMOVEL M');
          Add('       WHERE');
          Add('              CXI.IDIMOVEL = I.IDIMOVEL AND');
          Add('              I.IDIMOVELMESTRE = M.IDIMOVEL');
          Add('       GROUP BY CXI.IDCONTRATOIMOVEL, I.CODTIPIMOVEL ) IM,');

          Add('     ( SELECT A.IDCONDINICIAL,');
          Add('              A.NUMPARCELAS,');
          Add('              A.DATAINI,');
          Add('              A.IDCONDPAGIMOVEL');
          Add('       FROM   CONDPAGIMOVEL A,');
          Add('              (SELECT   IDCONDINICIAL,');
          Add('                        MAX(DATAINI) AS DATAINI');
          Add('               FROM     CONDPAGIMOVEL');
          Add('               GROUP BY IDCONDINICIAL) B');
          Add('       WHERE   B.IDCONDINICIAL = A.IDCONDINICIAL');
          Add('         AND   B.DATAINI       = A.DATAINI ) CPFINAL');

          Add('WHERE');
          Add('         (PF.FLGTIPOLANC IN (2,3,5,6,7,8,9))');
          Add('     AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO IN( ' + QuotedStr('N') + ','+ QuotedStr('P') + ') )');
          Add('     AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)');
          Add('     AND (CP.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+))');
          Add('     AND (CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL)');
          Add('     AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)');
          Add('     AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO <= TO_DATE(:pDTFIM,' + QuotedStr('DD/MM/YYYY') +')) )');
          Add(sCond);
          Add('ORDER BY PF.DATAVENCIMENTO');

      end else begin
          sSql := 'SELECT (0) AS CHKREPACTUA, '+#13+
                  '    PF.IDPARCFINANCIMOV, '+#13+
                  '    PF.IDCONDPAGIMOVEL,  '+#13+
                  '    CI.IDCONTRATOIMOVEL, '+#13+
                  '    CI.FLGTIPOCONTRATO, '+#13+
                  '    IM.CODTIPIMOVEL,     '+#13+
                  '    PF.CODDOCUMENTO,     '+#13+
                  '    DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ''/'' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '+#13+
                  '    DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
                  '    DECODE(NVL(PF.FLGRESIDUOINCORP,''N''),' + QuotedStr('N') + ',(NVL(PF.VLRRESIDUO,0) + NVL(AR.VLRRESIDUOCORRIG,0)),0) as VLRRESIDUOATUALI, '+#13+
                  '    ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '+#13+
                  '    PF.VLRAMORTIZACAO, '+#13+
                  '    PF.VLRJUROS,       '+#13+
                  '    PF.FLGTIPOLANC,    '+#13+
                  '    PF.FLGLANCINTEGRA, '+#13+
                  '    PP.DATAPAGAMENTO,  '+#13+
                  '    ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '+#13+
                  '    PF.VLRPRESTCORRIG, '+#13+
                  '    PF.VLRMULTACORRIG, '+#13+
                  '    PF.VLRJUROSCORRIG, '+#13+
                  '    DECODE(CD.IDDOCDIVERGE, NULL, '+#13+
                  '       DECODE(NVL(CD2.CONCILIADOC, ''N''), ''S'', 0, ''C'', 0, '+#13+
                  '              NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORRECAO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) - NVL(ABONO.TOT_ABONO,0)), NULL) AS VLRDEVIDO '+#13+
                  ' FROM  '+#13+
                  '    PARCFINANCIMOV PF, '+#13+
                  '    CONDPAGIMOVEL  CP, '+#13+
                  '    CONTRATOIMOVEL CI, '+#13+
                  '    PESSOA P,          '+#13+
                  '    ( '+#13+
                  '      SELECT /*+ INDEX(LD) INDEX(RP)*/ '+#13+
                  '             IDPARCFINANCIMOV,         '+#13+
                  '             DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '+#13+
                  '             DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM(LD.VALOR) ) AS VLRPAGO '+#13+
                  '        FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP '+#13+
                  '       WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '+#13+
                  '         AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '+#13+
                  '         AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '+#13+
                  '         AND ( (P.CODDOCUMENTO IS NULL) OR        '+#13+
                  '               (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA IS NOT NULL OR LD.CODALTERADOR = 215) ) ) '+#13+
                  '         AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <=  ' + sDtAtualiza + '  ) OR '+#13+
                  '              (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPERACAO) = ''5'' OR LD.CODALTERADOR = 215 ) '+#13+
                  '                                          AND LD.ESTORNO IS NULL '+#13+
                  '                                          AND LD.DATALANCTO <= ' + sDtAtualiza + ' ) ) '+#13+
                  '       GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO '+#13+
                  '    ) PP, '+#13+
                  '    ( SELECT DISTINCT          '+#13+
                  '             IDPARCFINANCIMOV, '+#13+
                  '             DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVERGE '+#13+
                  '        FROM CONCILIADOC       '+#13+
                  '       WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
                  '         AND DATA <= ' + sDtAtualiza +#13+
                  '         AND (IDDOCDIVERGE IS NOT NULL OR '+#13+
                  '              IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPARCFINANCIMOV '+#13+
                  '                                          FROM CONCILIADOC '+#13+
                  '                                         WHERE IDPARCFINANCIMOV IS NOT NULL '+#13+
                  '                                           AND DATA <= ' + sDtAtualiza       +#13+
                  '                                           AND IDDOCDIVERGE IS NOT NULL ) ) '+#13+
                  '    ) CD, '+#13+
                  '   (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO, '+#13+
                  '             DECODE(FLGTIPO,''M'', DECODE(QTDE,3,''S'',''P''), '+#13+
                  '                            ''J'', DECODE(QTDE,3,''S'',''P''), '+#13+
                  '                            ''C'', DECODE(QTDE,3,''S'',''P''), '+#13+
                  '                            CONCILIADOC ) AS CONCILIADOC '+#13+
                  '        FROM '+#13+
                  '             ( SELECT C.IDPARCFINANCIMOV, '+#13+
                  '                      DECODE(C.FLGTIPO, NULL, NULL, '+#13+
                  '                             ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
                  '                             ''A'', ''C'', P.FLGCONCILIADO ) AS CONCILIADOC, '+#13+
                  '                      MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS FLGTIPO, COUNT(*) AS QTDE '+#13+
                  '                 FROM CONCILIADOC C, PARCFINANCIMOV P '+#13+
                  '                WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV '+#13+
                  '                  AND C.FLGTIPO IN(''R'',''T'', ''A'',''M'',''J'',''C'') '+#13+
                  '                  AND C.DATA <= '+ sDtAtualiza +#13+
                  '                  AND ( C.FLGTIPO = ''T'' OR '+#13+
                  '                        NOT EXISTS ( SELECT 1 FROM CONCILIADOC '+#13+
                  '                                      WHERE FLGTIPO = ''T'' '+#13+
                  '                                        AND IDPARCFINANCIMOV = C.IDPARCFINANCIMOV ) ) '+#13+
                  '                GROUP BY C.IDPARCFINANCIMOV, '+#13+
                  '                         DECODE(C.FLGTIPO, NULL, NULL, '+#13+
                  '                             ''R'', ''S'', ''T'', ''S'', ''M'',''P'',''J'',''P'',''C'',''P'', '+#13+
                  '                             ''A'', ''C'', P.FLGCONCILIADO ) ) ) CD2, '+#13+
                  '   ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '+#13+
                  '            A.NUMPARCELAS    AS NUMPARCELAS,   '+#13+
                  '            A.DATAINI,         '+#13+
                  '            A.IDCONDPAGIMOVEL, '+#13+
                  '            A.INDCORRECAO,     '+#13+
                  '            A.MESREFREAJUSTE,  '+#13+
                  '            DECODE(A.TIPOCONDPAG, ''V'', ''A Vista'', '+#13+
                  '                                  ''S'', ''Sinal'',   '+#13+
                  '                                  ''C'', ''Caução'',  '+#13+
                  '                                  ''P'', ''Parcelamento'' ) AS TIPOCONDPAG '+#13+
                  '     FROM   CONDPAGIMOVEL A,                  '+#13+
                  '            (SELECT   IDCONDINICIAL,          '+#13+
                  '                      MAX(DATAINI) AS DATAINI '+#13+
                  '             FROM     CONDPAGIMOVEL           '+#13+
                  '             GROUP BY IDCONDINICIAL) B        '+#13+
                  '     WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '+#13+
                  '       AND B.DATAINI = A.DATAINI ) CPFINAL,   '+#13+
                  '   ( SELECT DISTINCT                          '+#13+
                  '            CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '+#13+
                  '            M.IMONOME            AS NOMEMESTRE,       '+#13+
                  '            M.IDIMOVEL           AS IDIMOVEL,         '+#13+
                  '            I.CODTIPIMOVEL       AS CODTIPIMOVEL      '+#13+
                  '       FROM CONTRATOXIMOVEL CXI, '+#13+
                  '            IMOVEL I, '+#13+
                  '            IMOVEL M  '+#13+
                  '      WHERE CXI.IDIMOVEL = I.IDIMOVEL           '+#13+
                  '        AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '+#13+
                  '   ( SELECT /*+ INDEX(D) INDEX(LD)*/            '+#13+
                  '            LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '+#13+
                  '            SUM( DECODE(LD.DEBCRE,''D'', LD.VALOR, (LD.VALOR * -1)) ) AS TOT_ALTERADOR '+#13+
                  '       FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,          '+#13+
                  '            PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,        '+#13+
                  '            ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOVEL     '+#13+
                  '                FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I '+#13+
                  '               WHERE CXI.IDIMOVEL = I.IDIMOVEL                       '+#13+
                  '                 AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL       '+#13+
                  '                 AND C.FLGTIPOCONTRATO = ''C'' ) TC '+#13+
                  '      WHERE RTRIM(LD.OPERACAO) = ''4'' '+#13+
                  '              AND LD.CODALTERADOR <> PA.CODALTERADORCPMF      '+#13 +
                  '         AND (LD.CODALTERADOR <> PA.CODALTERADORADRES OR ' + #13 +
                  '              LD.CODALTERADOR = PA.CODALTERADORADRES AND EXISTS (SELECT 1 ' + #13 +
                  '                                                                 FROM CONCILIADOC ' + #13 +
                  '                                                                 WHERE IDDOCUMENTO = LD.CODDOCUMENTO ' + #13 +
                  '                                                                 AND   NUMLANCTO   = LD.NUMLANCTO ' + #13 +
                  '                                                                 AND   DATA        <= ' + sDtAtualiza + ')) ' + #13 +
                  '        AND PA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '        AND LD.CODDOCUMENTO    = D.CODDOCUMENTO      '+#13+
                  '        AND D.CODDOCUMENTO     = P.CODDOCUMENTO      '+#13+
                  '        AND P.IDCONDPAGIMOVEL  = C.IDCONDPAGIMOVEL   '+#13+
                  '        AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL '+#13+
                  '        AND TC.CODTIPIMOVEL    = T.CODTIPIMOVEL      '+#13+
                  '        AND LD.DATALANCTO <= ' + sDtAtualiza  +#13+
                  '        AND ( PA.IDOPERATUALCM IS NULL OR           '+#13+
                  '              ( LD.CODALTERADOR <> T.CODALTCMAL AND '+#13+
                  '                LD.CODALTERADOR <> T.CODALTJRAL AND '+#13+
                  '                LD.CODALTERADOR <> T.CODALTMTAL ) ) '+#13+
                  '        AND D.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13+
                  '      GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '+#13+
                  '   ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOCORRIG '+#13+
                  '       FROM ( SELECT /*+ INDEX (L) */ '+#13+
                  '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS VLRRESIDUOCORRIG '+#13+
                  '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
                  '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'+#13+
                  '                 AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '                 AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo) +#13+
                  '                 AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+
                  '                 AND ( L.IDOPERACAO = P.IDOPERATUALRES )     '+#13+
                  '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
                  '            ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, MAX(L2.DATAOPER) AS DTAPUR '+#13+
                  '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
                  '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'+#13+
                  '                 AND P2.IDPESSOA =  ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '                 AND L2.IDMODULO =  ' + IntToStr(Sistema.IdModulo)  +#13+
                  '                 AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+
                  '                 AND ( L2.IDOPERACAO = P2.IDOPERATUALRES ) '+#13+
                  '                 AND ( DATAOPER <= ' + sDtAtualiza + '  )  '+#13+
                  '               GROUP BY L2.IDPARCFINANCIMOV ) D2           '+#13+
                  '      WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV      '+#13+
                  '        AND D1.DATAOPER = D2.DTAPUR '+#13+
                  '    ) AR,                           '+#13+
                  '   ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '+#13+
                  '       FROM PARCEXTRAIMOV           '+#13+
                  '      WHERE FLGTIPOCOBRANCA = ''R'' '+#13+
                  '    ) CR, '+#13+
                  '   ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO '+#13+
                  '       FROM ( SELECT /*+ INDEX (L) */ '+#13+
                  '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13+
                  '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
                  '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
                  '                 AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13+
                  '                 AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '                 AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+
                  '                 AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR  '+#13+
                  '                       L.IDOPERACAO = P.IDOPERATUALJUROS OR  '+#13+
                  '                       L.IDOPERACAO = P.IDOPERATUALCM )      '+#13+
                  '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
                  '            ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
                  '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
                  '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
                  '                 AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '                 AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13+
                  '                 AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+
                  '                 AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR '+#13+
                  '                       L2.IDOPERACAO = P2.IDOPERATUALJUROS OR '+#13+
                  '                       L2.IDOPERACAO = P2.IDOPERATUALCM )     '+#13+
                  '                 AND ( DATAOPER <= ' + sDtAtualiza + '  )     '+#13+
                  '               GROUP BY L2.IDPARCFINANCIMOV ) D2      '+#13+
                  '      WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
                  '        AND D1.DATAOPER = D2.DTAPUR '+#13+
                  '    ) CO2, '+#13+
                  '( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '+#13+
                  'FROM ( SELECT /*+ INDEX (L) */ '+#13+
                  '           L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM) AS TOT_ABONO '+#13+
                  '       FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '+#13+
                  '       WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
                  '       AND L.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13+
                  '       AND P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '       AND L.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+
                  '       AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '+#13+
                  '             L.IDOPERACAO = P.IDOPERABONOJUROS OR '+#13+
                  '             L.IDOPERACAO = P.IDOPERABONOCM ) '+#13+
                  '       GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '+#13+
                  '     ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2.DATAOPER) AS DTAPUR '+#13+
                  '       FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '+#13+
                  '       WHERE (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
                  '       AND L2.IDMODULO = ' + IntToStr(Sistema.IdModulo)  +#13+
                  '       AND P2.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                  '       AND L2.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+
                  '       AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '+#13+
                  '             L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '+#13+
                  '             L2.IDOPERACAO = P2.IDOPERABONOCM ) '+#13+
                  '       AND ( DATAOPER <= ' + sDtAtualiza + '  )     '+#13+
                  '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '+#13+
                  'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '+#13+
                  'AND D1.DATAOPER = D2.DTAPUR '+#13+
                  ') ABONO '+#13+
                  'WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9,10,12))     '+#13+
                  '  AND (NVL(PF.FLGCONCILIADO,''N'') <> ''S'')          '+#13+
                  '  AND (PF.IDREPACTUA IS NULL )                        '+#13+
                  '  AND (PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL)      '+#13+
                  '  AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)     '+#13+
                  '  AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)   '+#13+
                  '  AND (P.IDPESSOA(+)       = CI.IDLOCATARIO)          '+#13+
                  '  AND (PP.IDPARCFINANCIMOV(+)  = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (CO2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (ABONO.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (AR.IDPARCFINANCIMOV(+)  = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (CR.IDPARCCOBRADA(+)     = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (CD.IDPARCFINANCIMOV(+)  = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '+#13+
                  '  AND (IM.IDCONTRATOIMOVEL(+)  = CI.IDCONTRATOIMOVEL) '+#13+
                  '  AND (ALT.CODDOCUMENTO(+)     = PF.CODDOCUMENTO)     '+#13+
                  '  AND CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) +#13+ sCond +#13+
                  '  AND ((PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <= ' + sDtAtualiza + '  ) ) '+#13+
                  'ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLGTIPOLANC, NUMPARCELA ';

         qryParc.Sql.Text := sSql;

         qryParc.SQL.SaveToFile(Sistema.TempDir + 'REPACTUA.TXT');
      end;
   end;

   // Data de Início da Repactuação
   dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   if not bOperacional then begin
      qryParc.Params[0].AsString := DateToStr(dDataIni);
      qryParc.Open;
   end else begin
      frmAguarde.Mostra('Aguarde, Recuperando valores atualizados...');
      qryParc.Open;
      frmAguarde.Apaga;      
   end;

   // Totaliza Valores em Atraso
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.Eof do begin
      rTotAtraso  := rTotAtraso  + qryParcVLRDEVIDO.AsFloat;
      rTotResiduo := rTotResiduo + qryParcVLRRESIDUOATUALI.AsFloat;
      qryParc.Next;
   end;
   qryParc.First;

   edTotRepac.Value    := 0;
   edTotAtraso.Value   := rTotAtraso + rTotResiduo;
   edTotSaldoDev.Value := rSaldoDev;
   edNovoSaldo.Value   := rSaldoDev;
   qryParc.EnableControls;
end;


procedure TfrmExecRepactuacao.btnCancela2Click(Sender: TObject);
begin
   inherited;
   nbRepactua.PageIndex := nbRepactua.PageIndex - 1;
end;

procedure TfrmExecRepactuacao.qryParcCalcFields(DataSet: TDataSet);
begin
   inherited;
   // Carrega o Tipo de Parcela
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger,
                                                         qryParcFLGLANCINTEGRA.AsInteger);
end;


procedure TfrmExecRepactuacao.dbgParcDblClick(Sender: TObject);
var fTotRepac : Extended;
begin
   inherited;
   // Marca ou Desmarca as parcelas para REPACTUAÇÃO
   if not qryParc.IsEmpty then begin

      qryParc.Edit;
      qryParcCHKREPACTUA.AsInteger := (qryParcCHKREPACTUA.AsInteger Xor 1);
      qryParc.Post;

      // Calcula o Total Devido
      // SE NÃO contabilizou/gerou documento e ainda não venceu, repactua apenas o valor da amortização
      if (qryParcCODDOCUMENTO.IsNull) and (qryParcDATAVENCIMENTO.AsDateTime >= edDataRepactua.Date) then begin
         fTotRepac := qryParcVLRAMORTIZACAO.AsFloat;
      end else begin
         fTotRepac := qryParcVLRDEVIDO.AsFloat + qryParcVLRRESIDUOATUALI.AsFloat;
      end;
      if qryParcCHKREPACTUA.AsInteger = 1 then begin
         edTotRepac.Value  := edTotRepac.Value  + fTotRepac;
         edTotAtraso.Value := edTotAtraso.Value - fTotRepac;
      end else begin
         edTotRepac.Value  := edTotRepac.Value  - fTotRepac;
         edTotAtraso.Value := edTotAtraso.Value + fTotRepac;
      end;
      edNovoSaldo.Value := edTotSaldoDev.Value + edTotRepac.Value;
   end;
end;


procedure TfrmExecRepactuacao.btnContinua2Click(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;

   // Caso seja selecionada mais de uma cond. de pagamento, ou a repactuação resultar em
   // mais de uma Condição, TODOS os valores em atrasos deverão ser repactuados, pois as
   // condições selecionadas serão encerradas e será criada uma nova condição de pagamento,
   // começando da parcela 1.
   if Sistema.TipoCliente <> 20041 then begin
      if ( ((bMesclaCondPag) and (Arredonda(edTotAtraso.Value,0) > 0)) or
           ((DBSpnQtde.Value > 1) and (Arredonda(edTotAtraso.Value,0) > 0)) ) then begin
         MsgDlg('Para Repactuar efetuando a fusão de várias condições de pagamento, ' + #13#10 +
                'ou criando várias condições resultantes, TODO Saldo Devedor de ' + #13#10 +
                'todas as condições selecionadas deverão ser incorporadas à nova ' + #13#10 +
                'condição de pagamento que será criada.','Aviso',mtWarning,[mbOK],0);
         Exit;
      end;
   end;

   // se for só uma condição de pagamento, sem desmembramento, busca os valores default
   if (not bMesclaCondPag) and (DBSpnQtde.Value = 1) then begin
      qryCondPag.First;
      while not qryCondPag.eof do begin
         if qryCondPagCHKREPACTUA.AsInteger = 1 then begin
            AbreCondPagDefault(qryCondPagIDCONDINICIAL.AsInteger);
            Break;
         end;
         qryCondPag.Next;
      end;
   end;

   // Obriga a indicação de um alterador para liquidar documentos inadimplentes
   qryParc.First;
   while not qryParc.eof do begin
      if qryParcCHKREPACTUA.AsInteger = 1 then begin
         bResult := not (DBcboAlterador.Text = '');
         Break;
      end;
      qryParc.Next;
   end;

   if bResult then begin
      edtSaldoAnterior.Value := edNovoSaldo.Value;
      edtNovoSaldoOper.Value := edNovoSaldo.Value;
      nbRepactua.PageIndex := nbRepactua.PageIndex + 1;
   end else begin
      MsgDlg('Selecione um Alterador para liquidar os documentos em aberto','Aviso',mtInformation,[mbok],0);
   end;
end;



// -----------------------------------------------------------------------------
// Se for uma repactuação simples, procura a condição de pagamento atual e
// carrega como default
// -----------------------------------------------------------------------------
procedure TfrmExecRepactuacao.AbreCondPagDefault(const iCond: Integer);
var ano,mes,dia : word;
    TpCondPag   : TCondPag;
    dDataIni    : TDateTime;
begin
   // Procura a Condição atual na data da repactuação para servir como default
   dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   DecodeDate(dDataIni, ano, mes, dia);
   if FuncAlienacao.BuscaCondPag(iCond, mes, ano, False, TpCondPag) then begin
   
      // Marchetti - Pendencia 25486
      cmDataIni.Date     := edDataRepactua.Date;
      // Fim Marchetti - Pendencia 25486

      cmDtVencto.Date    := TpCondPag.dDataVencimento;
      cmdtAmortiz.Date   := TpCondPag.dDataIniAmortiz;
      dbEdtParc.Value    := TpCondPag.iNumParcelas;
      dbspnPeriodo.Value := TpCondPag.iPeriodo;
      dbcbPerParc.Value  := TpCondPag.sPrazo;
      dblcbIndCorr.LookupValue  := IntToStr(TpCondPag.iIDIndCorr);
      dblcbIndProj.LookupValue  := IntToStr(TpCondPag.iIDIndProj);
      edtPerProj.Value          := TpCondPag.fCorrecaoProj;
      dbEdtJuros.Value          := TpCondPag.fTaxaJuros;
      dbEdtMesRefReajuste.Value := TpCondPag.iMesRefReajuste;
      dbcbPerJur.Value          := TpCondPag.sPeriodoTaxa;
      dbcbFormaCalculo.Value    := IntToStr(TpCondPag.iFormaCalculo);
      dbcbJurosCarencia.Checked := TpCondPag.bJurosCarencia;
   end else begin
      MsgDlg('Nenhuma parcela encontrada na data de início da Repactuação','Aviso',mtWarning,[mbOK],0);
   end;
end;



// -----------------------------------------------------------------------------
// Efetua a Repactuação
// -----------------------------------------------------------------------------
procedure TfrmExecRepactuacao.btnContinua3Click(Sender: TObject);
var bResult : Boolean;
    CondPag : TCondPag;
    iIdRepactua : Integer;
    iPlnCodigo : Double;
    fTotIncorp, fTotDesc : Extended;
begin
   inherited;
   if MsgDlg('Confirma a Repactuação Contratual?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      Exit;
   end;
   if VerificaTotalCondicoes then begin
      iPlnCodigo  := 0;
      iIdRepactua := 0;
      fTotIncorp  := 0;
      fTotDesc    := Arredonda(edTotDesc.Value,2);

      try
         try
            StartTransacao;
            CarregaCondPag(CondPag);
            bResult := GeraNovaCondPag;

            if edTotRepac.Value > 0 then
               if bResult then bResult := RepactuaParcelas(iPlnCodigo, fTotIncorp);

            if (not qryRepCondImovxOper.IsEmpty) and (cbContabiliza.Checked) then
               //if bResult then bResult := ContabDesconto(iPlnCodigo, fTotDesc, qryParcIDCONTRATOIMOVEL.AsInteger);       //edilaine SIG97015
               if bResult then bResult := ContabDesconto(iPlnCodigo, fTotDesc, qryCondPagIDCONTRATOIMOVEL.AsInteger);      //edilaine SIG97015

            if bResult then bResult := GeraRepactuacao(iPlnCodigo, fTotIncorp, fTotDesc, iIdRepactua);
            if bResult then bResult := AtualizaDataFim(iIdRepactua);
            if bResult then bResult := EliminaParcelas;
            if bResult then bResult := RecalculaParcelas;
            if bResult then begin
               CommitTransacao;
               MsgDlg('Repactuação Realizada com Sucesso','Aviso',mtWarning,[mbOk],0);
               nbRepactua.PageIndex := 0;
               qryRepCondImovxOper.Close;
            end else begin
               RollBackTransacao;
               MsgDlg('Ocorreram ERROS durante a Repactuação','Erro',mtError,[mbOk],0);
            end;

         except
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS durante a Repactuação','Erro',mtError,[mbOk],0);
         end;
      finally
         EscondeProgresso(ProgressBar, lblProgress, lblContador);
      end;
   end;
end;


// -----------------------------------------------------------------------------
// Verifica o Valor total das condições com o Saldo devedor no processo anterior
// calculado pelo sistema.
//------------------------------------------------------------------------------
function TfrmExecRepactuacao.VerificaTotalCondicoes: Boolean;
var fTotal : Extended;
    bZero  : Boolean;
    iQtde  : Integer;
begin
   Result := True;
   bZero  := False;
   fTotal := 0;
   iQtde  := 0;
   qryCondResult.DisableControls;
   qryCondResult.First;
   while not qryCondResult.eof do begin
      Inc(iQtde);
      if qryCondResultVLRFINANC.AsFloat = 0 then bZero := True;
      fTotal := fTotal + qryCondResultVLRFINANC.AsFloat;
      qryCondResult.Next;
   end;
   qryCondResult.EnableControls;
   if iQtde <> DBSpnQtde.Value then begin
      MsgDlg('Número de Condições cadastradas diferente do total Informado','Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   if (iQtde > 1) and (bZero) then begin
      MsgDlg('Existem condições sem valor de financiamento','Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   if Sistema.TipoCliente <> 20041 then begin
      if ( (Arredonda(fTotal,2) <> Arredonda(edtNovoSaldoOper.Value,2)) and (DBSpnQtde.Value > 1) ) then begin
         MsgDlg('Saldo Total informado diferente do Saldo Calculado no passo anterior','Aviso',mtWarning,[mbOk],0);
         Result := False;
         Exit;
      end;
   end;   
end;


// ------------------------------------------------------------------------------------
// Verifica o Nr. mínimo de parcelas para repactuação com base nas parcelas já pagas,
// pois o Nr. de Parcelas se refere a qtde TOTAL das parcelas da condição de pagamento
// ------------------------------------------------------------------------------------
function TfrmExecRepactuacao.QtdeMinimaParcelas(const iIdCondInicial: Integer): Double;
begin
   Result := 1;
   with dtmFinanciamento.qryAux do begin
      Sql.Clear;
      Sql.Add('SELECT MAX(NUMPARCELA) AS PARCELA ');
      Sql.Add('  FROM PARCFINANCIMOV ');
      Sql.Add(' WHERE FLGLANCINTEGRA > 0 ');
      Sql.Add('   AND IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL' );
      Params[0].AsInteger := iIdCondInicial;
      Open;
      if FieldByName('PARCELA').AsFloat > 0 then begin
         Result := FieldByName('PARCELA').AsFloat;
      end;
   end;
end;



// ------------------------------
// EM DESUSO, VERIFICAR.....
// ------------------------------
procedure TfrmExecRepactuacao.CarregaCondPag(var CondPag: TCondPag);
begin

   // Busca a condição de pagamento inicial, se estiver mesclando (fusão),
   // será uma nova condição de pagamento, onde a inicial será ela mesma.
   if bMesclaCondPag then begin
      CondPag.fIDCondInicial := -1;
   end else begin
      qryCondPag.First;
      while not qryCondPag.Eof do begin
         if qryCondPagCHKREPACTUA.AsInteger = 1 then begin
            CondPag.fIDCondInicial := qryCondPagIDCONDINICIAL.AsInteger;
            Break;
         end;
         qryCondPag.Next;
      end;
   end;

   CondPag.fIDContratoImovel := molProposta1.iProposta;
   CondPag.fSaldoDev         := edSaldoDev.Value;
   CondPag.fTaxaJuros        := dbEdtJuros.Value;
   CondPag.bJurosCarencia    := dbcbJurosCarencia.Checked;
   CondPag.dDataVencimento   := cmDtVencto.Date;
   CondPag.dDataIniAmortiz   := cmdtAmortiz.Date;
   CondPag.dDataIni          := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );

   if dblcbIndCorr.LookupValue <> '' then
        CondPag.iIDIndCorr := StrToInt(dblcbIndCorr.LookupValue)
   else CondPag.iIDIndCorr := -1;

   if dblcbIndProj.LookupValue <> '' then
        CondPag.iIDIndProj := StrToInt(dblcbIndProj.LookupValue)
   else CondPag.iIDIndProj := -1;

   if dbEdtParc.Value < 1 then
        CondPag.iNumParcelas := 1
   else CondPag.iNumParcelas := StrToInt(FormatFloat('###',dbEdtParc.Value));
   if dbspnPeriodo.Value < 1 then
        CondPag.iPeriodo := 1
   else CondPag.iPeriodo := StrToInt(FormatFloat('###',dbspnPeriodo.Value));
   CondPag.fCorrecaoProj := edtPerProj.Value;
   CondPag.sPrazo        := dbcbPerParc.Value;
   CondPag.sPeriodoTaxa  := dbcbPerJur.Value;
   CondPag.iFormaCalculo := StrToInt(dbcbFormaCalculo.Value);
end;



// -----------------------------------------------------------------------------
// Grava as condições de Pagamento Resultantes
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.GeraNovaCondPag: Boolean;
var iIdCondInicial, iIdCondRepactua : Integer;
begin
   Result := True;

   // Busca a condição de pagamento inicial, se estiver mesclando (fusão), ou Desmembrando,
   // será uma nova condição de pagamento, onde a inicial será ela mesma.
   if (bMesclaCondPag) or (DBSpnQtde.Value > 1) or (chkNovaCondPag.Checked = True) then begin
      iIdCondInicial := -1;
   end else begin
      qryCondPag.First;
      while not qryCondPag.Eof do begin
         if qryCondPagCHKREPACTUA.AsInteger = 1 then begin
            iIdCondInicial := qryCondPagIDCONDINICIAL.AsInteger;
            Break;
         end;
         qryCondPag.Next;
      end;
   end;

   // Grava Cada condição resultante da repactuação
   try
      qryCondResult.First;
      while not qryCondResult.Eof do begin
         with qryInsCondRepactua do begin
            LimpaParametros(qryInsCondRepactua);
            iIdCondRepactua := LeUltRegistro(nil,'CONDPAGIMOVEL');
            ParamByName('PIDCONDPAGIMOVEL').AsInteger  := iIdCondRepactua;
            ParamByName('PIDCONTRATOIMOVEL').AsFloat   := molProposta1.iProposta;
            ParamByName('PVLRFINANC').AsFloat          := qryCondResultVLRFINANC.AsFloat;
            ParamByName('PDATAINI').AsDateTime         := qryCondResultDATAINI.AsDateTime;
            ParamByName('PPRAZO').AsString             := qryCondResultPERPARC.AsString;
            ParamByName('PPERIODO').AsInteger          := qryCondResultINTERVALO.AsInteger;
            ParamByName('PTAXAJUROS').AsFloat          := qryCondResultJUROS.AsFloat;
            ParamByName('PPERIODOTAXA').AsString       := qryCondResultPERJUROS.AsString;
            ParamByName('PNUMPARCELAS').AsInteger      := qryCondResultNUMPARCELAS.AsInteger;
            ParamByName('PPERINDPROJ').AsFloat         := qryCondResultPERPROJ.AsFloat;
            ParamByName('PFORMACALCULO').AsInteger     := qryCondResultFORMACALCULO.AsInteger;
            ParamByName('PDATAVENCIMENTO').AsDateTime  := qryCondResultDATAVENCIMENTO.AsDateTime;
            ParamByName('PMESREFREAJUSTE').AsInteger   := qryCondResultMESREFREAJUSTE.AsInteger;

            if qryCondResultINDCORR.AsInteger > 0 then
               ParamByName('PINDCORRECAO').AsInteger   := qryCondResultINDCORR.AsInteger;
            if qryCondResultINDPROJ.AsInteger > 0 then
               ParamByName('PIDINDCORRPROJ').AsInteger := qryCondResultINDPROJ.AsInteger;
            ParamByName('PTIPOCONDPAG').AsString       := 'R';

            if (bMesclaCondPag) or (DBSpnQtde.Value > 1) or (chkNovaCondPag.Checked = True) then
                 ParamByName('PIDCONDINICIAL').AsFloat := iIdCondRepactua
            else ParamByName('PIDCONDINICIAL').AsFloat := iIdCondInicial;

            if qryCondResultFORMACALCULO.AsInteger = 12 then begin
               ParamByName('PFLGJURCARENCIA').AsString   := qryCondResultFLGJURCARENCIA.AsString;
               ParamByName('PDATAINIAMORTIZ').AsDateTime := qryCondResultDATAINIAMORTIZ.AsDateTime;
            end else begin
               ParamByName('PFLGJURCARENCIA').AsString   := 'N';
               ParamByName('PDATAINIAMORTIZ').AsDateTime := qryCondResultDATAVENCIMENTO.AsDateTime;
            end;

            ExecSQL;

            // Grava o ID da condição gerada na tabela virtual
            qryCondResult.Edit;
            qryCondResultIDCONDRESULT.AsInteger := iIdCondRepactua;
            qryCondResult.Post;

         end;
         qryCondResult.Next;
      end;
   except
      Result := False;
   end;
end;



// ---------------------------------------------------------------------------------
// Grava o Registro da Repactuação e registra o ID em CondPagImovel e ParcFinancImov
// ---------------------------------------------------------------------------------
function TfrmExecRepactuacao.GeraRepactuacao(const iPlnCodigo: Double;
                                             const fTotIncorp, fTotDesconto: Extended;
                                             var   iIdRepactua: Integer): Boolean;
var sCond, sCondRes, sSql : String;
begin
   Result      := True;
   iIdRepactua := 0;
   try
      // Grava a Repactuação
      with qryInsRepactua do begin
         LimpaParametros(qryInsRepactua);
         iIdRepactua := LeUltRegistro(nil,'REPCONDPAGIMOV');
         if iIdRepactua < 1 then iIdRepactua := LeUltRegistro(nil,'REPCONDPAGIMOV');
         ParamByName('PIDREPACTUA').AsInteger      := iIdRepactua;
         ParamByName('PDATAREPACTUA').AsDateTime   := edDataRepactua.Date;
         // Desabilitada a gravação pois agora se grava os registros de operaçòes

         if edSaldoDev.Value > 0 then
            ParamByName('PVLRSALDOANT').AsFloat    := edSaldoDev.Value;

         if fTotIncorp > 0 then
            ParamByName('PVLRINCORPORADO').AsFloat := fTotIncorp;
         if iPlnCodigo > 0 then
            ParamByName('PPLNCODIGO').AsFloat    := iPlnCodigo;
         if rgTipoRepactua.ItemIndex = 0 then
              ParamByName('PTIPOREPACTUA').AsString  := 'C'
         else ParamByName('PTIPOREPACTUA').AsString  := 'F';
         ExecSQL;
      end;

      // Grava as condições resultantes da repactuação
      qryCondResult.First;
      while not qryCondResult.eof do begin
         sSql := 'INSERT INTO REPCONDRESULTIMOV ' +
                 '        ( IDREPACTUA, IDCONDPAGIMOVEL ) '  +
                 ' VALUES ( ' + IntToStr(iIdRepactua) + ', ' +
                 IntToStr(qryCondResultIDCONDRESULT.AsInteger) + ' )';
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);

         qryCondResult.Next;
      end;


      // Atualiza o ID da Repactuação nas Condíções de Pagamento Repactuadas

      // Monta a Clausula IN para as condições selecionadas
      sCond := ' AND IDCONDINICIAL IN(';
      qryCondPag.First;
      while not qryCondPag.Eof do begin
         if qryCondPagCHKREPACTUA.AsInteger = 1 then
            sCond := sCond + FormatFloat('#0',qryCondPagIDCONDINICIAL.asFloat)+',';
         qryCondPag.Next;
      end;
      sCond := Copy(sCond,1,Length(sCond)-1) + ')';

      // Monta a Clausula IN para as condições resultantes
      sCondRes := ' AND IDCONDPAGIMOVEL NOT IN(';
      qryCondResult.First;
      while not qryCondResult.Eof do begin
         sCondRes := sCondRes + FormatFloat('#0',qryCondResultIDCONDRESULT.asFloat)+',';
         qryCondResult.Next;
      end;
      sCondRes := Copy(sCondRes,1,Length(sCondRes)-1) + ')';


      sSql := 'UPDATE CONDPAGIMOVEL ' +
              '   SET IDREPACTUA = ' + IntToStr(iIdRepactua) +
              ' WHERE IDREPACTUA IS NULL ' +
              sCond + sCondRes;
      ExecutarQuery(dtmFinanciamento.qryAux,sSql);


      // Atualiza o Status da Parcela e o ID da Repactuação
      qryParc.First;
      while not qryParc.Eof do begin
         if qryParcCHKREPACTUA.AsInteger = 1 then begin
            LimpaParametros(qryUpdParc);
            qryUpdParc.ParamByName('PIDPARCFINANCIMOV').AsInteger := qryParcIDPARCFINANCIMOV.AsInteger;
            qryUpdParc.ParamByName('PIDREPACTUA').AsInteger       := iIdRepactua;
            qryUpdParc.ParamByName('PFLGCONCILIADO').AsString     := 'S';
            if qryParcDATAPAGAMENTO.IsNull then
                 qryUpdParc.ParamByName('PFLGLANCINTEGRA').AsInteger := 5    // Repac. Total
            else qryUpdParc.ParamByName('PFLGLANCINTEGRA').AsInteger := 6;   // Repac. Parcial

            qryUpdParc.ExecSQL;
         end;
         qryParc.Next;
      end;

      qryRepCondImovxOper.First;
      while not qryRepCondImovxOper.Eof do
      begin
         qryRepCondImovxOper.Edit;
         qryRepCondImovxOper.FieldByName('IDREPACTUA').AsInteger := iIdRepactua;
         qryRepCondImovxOper.Post;
         qryRepCondImovxOper.Next;
      end;
      qryRepCondImovxOper.First;
      qryRepCondImovxOper.ApplyUpdates;
      qryRepCondImovxOper.CommitUpdates;

   except
      Result := False;
   end;
end;



// ------------------------------------------------------------------------------------
// Atualiza as Datas finais de TODAS as Condições de Pagamento referentes a repactuação
// ------------------------------------------------------------------------------------
function TfrmExecRepactuacao.AtualizaDataFim(const iIdRepactua: Integer): Boolean;
var dDtFim : TDateTime;
begin
   Result := True;
   try
      // Calcula a data final após a repactuação, de cada condição resultante,
      // atualizando as datas finais das condições anteriores
      qryCondResult.First;
      while not qryCondResult.Eof do begin

         FuncAlienacao.CalcFimCondPag(iIdRepactua, -1,
                                      qryCondResultNUMPARCELAS.AsInteger,
                                      qryCondResultINTERVALO.AsInteger,
                                      qryCondResultPERPARC.AsString,
                                      StrToDate(('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)))),
                                      qryCondResultDATAVENCIMENTO.AsDateTime,
                                      dDtFim, True);

         // Atualiza a data final após a repactuação
         with dtmFinanciamento.qryUpdCondPag do begin
            ParamByName('pIDCONDPAGIMOVEL').AsFloat := qryCondResultIDCONDRESULT.AsFloat;
            ParamByName('pDATAFIM').AsString        := DateToStr(dDtFim);
            ExecSQL;
         end;
         qryCondResult.Next;
      end;
   except
      Result := False;
   end;
end;



// -----------------------------------------------------------------------------------
// Apaga as parcelas de Numeração superior a qtde de parcelas definidas na Repactuação
// -----------------------------------------------------------------------------------
function TfrmExecRepactuacao.EliminaParcelas: Boolean;
var sSql, sCond, dDataIni : String;
begin
   Result := True;

   // Se estiver mesclando condições (fusão), ou Desmembrando, apaga todas as parcelas
   // com vencimento superior a repactuação de todas as condições selecionadas.
   try
      if (bMesclaCondPag) or (DBSpnQtde.Value > 1) or (chkNovaCondPag.Checked = True) then begin

         //Cássio -  WO 15334 - Início
         // Data de Início da Repactuação
         //dDataIni := '01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value));
         dDataIni := DateToStr(edDataRepactua.Date);
         //Cássio -  WO 15334 - Início

         // Monta a Clausula IN
         sCond := 'AND IDCONDPAGIMOVEL IN(';
         qryCondPag.First;
         while not qryCondPag.eof do begin
            if qryCondPagCHKREPACTUA.AsInteger = 1 then begin
               sCond := sCond + FormatFloat('#0',qryCondPagIDCONDINICIAL.asFloat)+',';
            end;
            qryCondPag.Next;
         end;
         sCond := Copy(sCond,1,Length(sCond)-1) + ')';

         sSql := 'DELETE FROM PARCFINANCIMOV '   +
                 ' WHERE CODDOCUMENTO IS NULL ' + //Cássio Rovaroto - WO 15334
                 '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(dDataIni) + ',' +
                                                      QuotedStr('DD/MM/YYYY') + ' ) ' + sCond;
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);

      end else begin

         // Posiciona na condição repactuada
         qryCondPag.First;
         while not qryCondPag.Eof do begin
            if qryCondPagCHKREPACTUA.AsInteger = 1 then Break;
            qryCondPag.Next;
         end;

         sSql := 'DELETE FROM PARCFINANCIMOV '   +
                 ' WHERE FLGTIPOLANC IN(2,3,4) ' +
                 '   AND IDCONDPAGIMOVEL = ' + IntToStr(qryCondPagIDCONDINICIAL.AsInteger) +
                 '   AND NUMPARCELA > ' + IntToStr(qryCondResultNUMPARCELAS.AsInteger);
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);
      end;
   except
      Result := False;
   end;
end;


// -----------------------------------------------------------------------------
// Efetua baixa das parcelas em atraso com um lançamento do tipo 5, retornando
// o valor devido ao saldo devedor
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.RepactuaParcelas(var iPlnCodigo: Double; var fTotIncorp:Extended): Boolean;
var bResult : Boolean;
    fVlrMulta,fVlrJuros,fVlrCorr,fTotRepac : Extended;
    iAtual,iQuant : Integer;
    fSaldoDoc, fSaldoOut: Real;
begin
   Result  := True;
   bResult := True;

   iAtual := 1;
   iQuant := qryParc.RecordCount;
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Processando as Repactuações...');


   if qryParcFLGTIPOCONTRATO.AsString = 'C' then
   begin
      // Inicializa Parametros para contabilização
      if not InicializaParam(qryParcCODTIPIMOVEL.AsString,'R',
                             ModuloImobiliario.Alienacao.iTipoRecAmortiz) then begin
         Result := False;
         Exit;
      end;
   end
   else
   begin
      // Inicializa Parametros para contabilização
      if not InicializaParam(qryParcCODTIPIMOVEL.AsString,'R',
                             ModuloImobiliario.Alienacao.iTipoRecAmortAC) then begin
         Result := False;
         Exit;
      end;
   end;

   // Busca Alteradores por Tipo de Imóvel
   if not FuncAlienacao.BuscaAlteradores(qryParcIDCONTRATOIMOVEL.AsInteger,-1,
                                         iAltMulta,iAltJuros,iAltCorr,
                                         sAltMulta,sAltJuros,sAltCorr) then begin
      Result := False;
      Exit;
   end;

   try
      qryParc.First;
      while not qryParc.Eof do begin

         fVlrMulta := 0;
         fVlrJuros := 0;
         fVlrCorr  := 0;
         fTotRepac := 0;

         // Lança Alteradores no documento com os valores de Juros, Multa e CM
         if qryParcCHKREPACTUA.AsInteger = 1 then begin
            if (qryParcCODDOCUMENTO.IsNull) then begin
               if (qryParcDATAVENCIMENTO.AsDateTime >= edDataRepactua.Date) then
                  fTotRepac  := qryParcVLRAMORTIZACAO.AsFloat
               else
                  fTotRepac  := ComunsImobiliario.Arredonda(qryParcVLRDEVIDO.AsFloat + qryParcVLRRESIDUOATUALI.AsFloat,2);

               fTotIncorp := fTotIncorp + fTotRepac;
               fVlrMulta := 0;
               fVlrJuros := 0;
               fVlrCorr  := 0;
            end else begin
               if ( (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) or
                    (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
                    (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) ) then begin

                  CtrlDocumento.Saldo.CalculaSaldo(qryParcCODDOCUMENTO.AsInteger);
                  fSaldoDoc   := CtrlDocumento.Saldo.Valor;
                  fSaldoOut   := CtrlDocumento.Saldo.ValorOM;

                  fTotRepac  := fSaldoDoc;
                  fTotIncorp := fTotIncorp + fTotRepac;

               end else begin
                  if not qryParcCODDOCUMENTO.IsNull then begin
                     bResult := ExcluiAlteradores(qryParcCODDOCUMENTO.AsInteger);
                     if bResult then bResult := LancaAlteradores(qryParcCODDOCUMENTO.AsInteger, fVlrMulta,fVlrJuros,fVlrCorr);
                  end else begin
                     fVlrMulta := qryParcVLRMULTACORRIG.AsFloat;
                     fVlrJuros := qryParcVLRJUROSCORRIG.AsFloat;
                     fVlrCorr  := (qryParcVLRPRESTCORRIG.AsFloat - (qryParcVLRPRESTACAO.AsFloat - qryParcVLRPAGO.AsFloat)) + qryParcVLRRESIDUOATUALI.AsFloat;
                  end;

                  //Define o valor total repactuado
                  if qryParcDATAPAGAMENTO.IsNull then
                       fTotRepac := qryParcVLRPRESTACAO.AsFloat + fVlrMulta + fVlrJuros + fVlrCorr
                  else fTotRepac := fVlrMulta + fVlrJuros + fVlrCorr;
                  fTotIncorp := fTotIncorp + fTotRepac;
               end;
            end;

            if (bResult) and (cbContabiliza.Checked) and (fTotRepac <> 0) then
               bResult := IncorporaSaldo(qryParcCODDOCUMENTO.AsInteger, fTotRepac,
                                         qryParcIDCONTRATOIMOVEL.AsInteger, iPlnCodigo);

            // Cria Registro em CONCILIADOC
            if bResult then begin
               // Apaga o motivo anterior para limpar sujeiras ( caso o documento original tenha mudado no CAR )
               CalcDocumento.ApagarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger, 'R');
               // Grava o motivo de conciliação
               CalcDocumento.GravarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger, Sistema.IdUsuario, -1, -1,
                                                     null, (fVlrMulta + fVlrJuros + fVlrCorr),
                                                     'Repactuação Contratual', 'R', edDataRepactua.Date);
            end;
         end;
         if not bResult then begin
            Result := False;
            Exit;
         end;

         qryParc.Next;

         if not qryParc.Eof then begin
            iAtual := iAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);
         end;
      end;
   except
      Result := False;
   end;
end;



// -----------------------------------------------------------------------------
// Exclui os alteradores existentes no documento, antes de lançar os definitivos
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.ExcluiAlteradores(const iDocumento: Integer): Boolean;
var iNumeroLancto, iPlanilhaAEstornar : Integer;
begin
   Result := True;
   try
     // Abre Tabela de Alteradores
     LimpaParametros(qryAlteradores);
     qryAlteradores.ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
     qryAlteradores.Open;
     if not qryAlteradores.IsEmpty then begin
        while not qryAlteradores.Eof do begin
           iNumeroLancto        := qryAlteradoresNUMLANCTO.asInteger;
           iPlanilhaAEstornar   := qryAlteradoresPLNCODIGO.asInteger;

            // Some com o LancToDocum e desfaz a contabilização se houver
            //CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
            CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
            CtrlDocumento.OpenTransaction       := False;
            CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
            CtrlDocumento.CodDocumento          := iDocumento;
            CtrlDocumento.Lanctodocum.NumLancto := iNumeroLancto;
            CtrlDocumento.Delete;

            CtrlLancamento.OpenTransaction := False;
            CtrlLancamento.ExcluiLancaContab( Sistema.idUsuario,
                                              iPlanilhaAEstornar,
                                              Sistema.idModulo, 0,
                                              Sistema.UsaPlanoPatro, True);

           qryAlteradores.Next;
        end;
     end;
   except
      Result := False;
   end;
end;



// -----------------------------------------------------------------------------
// Lança os Alteradores de Multa, Juros e Correção, para atualizar a parcela
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.LancaAlteradores(const iDocumento: Integer;
                                              var fVlrMulta,fVlrJuros,fVlrCorr: Extended) : Boolean;
var sDataLancamento: string;
    iNumLancto, iPlanilha: integer;
    fSaldoDoc, fSaldoOut: Real;
begin
   Result    := True;
   fVlrMulta := 0;
   fVlrJuros := 0;
   fVlrCorr  := 0;
   fSaldoDoc := 0;
   fSaldoOut := 0;
   try
      sDataLancamento := ('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );

      CtrlDocumento.Saldo.CalculaSaldo(qryParcCODDOCUMENTO.AsInteger);
      fSaldoDoc   := CtrlDocumento.Saldo.Valor;
      fSaldoOut   := CtrlDocumento.Saldo.ValorOM;


      // Multa -------------------------------------------------------------------------------
      if (qryParcVLRMULTACORRIG.AsFloat > 0) then begin
         fVlrMulta   := qryParcVLRMULTACORRIG.AsFloat;
         iPlanilha   := 0;

         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                              iDocumento,
                                              0,
                                              fVlrMulta,
                                              0,
                                              fVlrMulta,
                                              0, iPlanilha, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAltMulta,
                                              '4', '', '', '', 'Multa',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              cbContabiliza.Checked);
         if not CtrlDocumento.Insert then
            raise Exception.Create(CtrlDocumento.MessageInfo);
      end;

      // Juros (Mora) ------------------------------------------------------------------------
      if (qryParcVLRJUROSCORRIG.AsFloat > 0) then begin
         fVlrJuros   := qryParcVLRJUROSCORRIG.AsFloat;
         iPlanilha   := 0;

         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                              iDocumento,
                                              0,
                                              fVlrJuros,
                                              0,
                                              fVlrJuros,
                                              0, iPlanilha, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAltJuros,
                                              '4', '', '', '', 'Juros',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              cbContabiliza.Checked);
         if not CtrlDocumento.Insert then
            raise Exception.Create(CtrlDocumento.MessageInfo);
      end;

      // Correção Monetária ------------------------------------------------------------------
      // PRESTCORRIG = Saldo a Pagar corrigido
      // Lança a Diferenca do Saldo do Documento e PRESTCORRIG + o Resíduo atualizado
      fVlrCorr := (qryParcVLRPRESTCORRIG.AsFloat - fSaldoDoc) + qryParcVLRRESIDUOATUALI.AsFloat;
      if (fVlrCorr > 0) then begin
         iPlanilha   := 0;

         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                              iDocumento,
                                              0,
                                              fVlrCorr,
                                              0,
                                              fVlrCorr,
                                              0, iPlanilha, 0,
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              iAltCorr,
                                              '4', '', '', '', 'Correção Monetária',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              cbContabiliza.Checked);
         if not CtrlDocumento.Insert then
            raise Exception.Create(CtrlDocumento.MessageInfo);

      end else begin
         fVlrCorr := 0;
      end;
   except
      Result := False;
      MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.' +#13+
             CtrlDocumento.MessageInfo , 'Erro', mtError, [mbOk], 0);
   end;
end;



// -----------------------------------------------------------------------------
// Efetua baixa do tipo 5 no Contas a Receber e contabiliza NA CONTA INVERTIDA
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.IncorporaSaldo(const iCodDoc: Integer; const fVlrRepac:Extended; const iIdContratoImovel: integer; var iPlnCodigo:double): Boolean;
var iNumLancto : Integer;
    sMens,sDtLancto, sHist1, sHist2, sHist3, sHist4, sHist5 : String;
    iPlanilha : Integer;
    _cdsIntegra : TCMClientDataSet;
    dValor, dValorTotal : Double;
begin
   Result      := True;
   sDtLancto   := DateToStr(edDataRepactua.Date);
   dValor      := 0;
   dValorTotal := 0;
   _cdsIntegra := TCMClientDataSet.Create(nil);
   try
     // Testa pelo período se é possivel contabilizar
     liEmpresa   := Sistema.IdEmpresa;
     try
        // Contabiliza o Valor Incorporado
        // As contas de DÉBITO E CREDITO FORAM INVERTIDAS
        //    para retornar ( devolver ) o Valor para o Saldo Devedor.

        if ParamContabeis.bFlgIntegraContab then
        begin
          _cdsIntegra.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(iIdContratoImovel);
          while not _cdsIntegra.eof do
          begin
           if _cdsIntegra.RecNo = _cdsIntegra.RecordCount then
              dValor := fVlrRepac - dValorTotal
           else
            dValor := (fVlrRepac * _cdsIntegra.FieldByName('PERCENTRATEIO').asFloat)/100;

           dValorTotal := dValorTotal + dValor;

           if not CtrlLancamento.InsereLancaContab ( '2',
                                                     Sistema.idEmpresa,
                                                     Sistema.idModulo,
                                                     Sistema.idUsuario,
                                                     IntegraBack.Plano,
                                                     ParamContabeis.iUnidNegoc, 0, 0,
                                                     //IntegraBack.PlanoPrevGlobal,
                                                     _cdsIntegra.FieldByName('IDPLANOPREV').asInteger,
                                                     //IntegraBack.PatroGlobal,
                                                     _cdsIntegra.FieldByName('IDPATRO').asInteger,
                                                     iPlnCodigo, 0,
                                                     sDtLancto,
                                                     IntToStr(iCodDoc),
                                                     ParamContabeis.sHistoricoCtb + ' Parcela: ' + qryParcNUMPARCELA.AsString,
                                                     '',
                                                     '',
                                                     '',
                                                     '',
                                                     '03',
                                                     ParamContabeis.sCentroCustoCredito,
                                                     ParamContabeis.sContaContabilCredito,
                                                     ParamContabeis.sCentroCustoDebito,
                                                     ParamContabeis.sContaContabilDebito,
                                                     '',
                                                     dValor,
                                                     False,
                                                     Sistema.UsaPlanoPatro,
                                                     -1,
                                                     Date, -1, -1,
                                                     True, -1, False, fVlrRepac) then
              raise Exception.Create ( CtrlLancamento.MessageInfo );

           if iPlnCodigo = 0 then
              iPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
           _cdsIntegra.Next;
          end;
        end;
        // Lança a baixa do tipo 5 no CAR
        // Gera o Nr. do Lançamento

        if iCodDoc > 0 then
        begin

           // Grava o alterador escolhido para liquidar o documento
           CtrlDocumento.OpenTransaction := False;
           //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
           CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
           CtrlDocumento.OpenTransaction := False;
           CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
           CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
           CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
           CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
           CtrlDocumento.IdModulo        := Sistema.idModulo;
           CtrlDocumento.CodDocumento    := iCodDoc;

           CtrlDocumento.Lanctodocum.SetValues(StrToDate(sDtLancto),
                                               iCodDoc, 0,
                                               fVlrRepac,
                                               0,
                                               fVlrRepac,
                                               0,
                                               Trunc(iPlnCodigo),
                                               0,
                                               Sistema.idUsuario,
                                               Sistema.idEmpresa, 0,0,
                                               0,0,
                                               dtmLookImobiliario.qryLookAlteradorXTipoImoCODALTERADOR.AsInteger,
                                               '4', '','','',
                                               'Repactuação de Parcela',
                                               '','','','C',
                                               Sistema.idModulo,
                                               IntegraBack.Plano,
                                               Sistema.UsaPlanoPatro, False, -1);

           if not CtrlDocumento.Insert then
              raise Exception.Create(CtrlDocumento.MessageInfo);

  //------------ VER COM VINICIUS 07/03/2006
        // Verifica baixa e Marca Liquidado no Documento
       end;
     except
        Result := False;
        MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.' +#13+
               CtrlDocumento.MessageInfo , 'Erro', mtError, [mbOk], 0);
     end;
  finally
    FreeandNil(_cdsIntegra);
  end;
end;


// -----------------------------------------------------------------------------
// Contabiliza o desconto na conta de perdas na alienação
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.ContabDesconto(var iPlnCodigo: Double; const fTotDesconto: Extended; const iIdContratoImovel: Integer): Boolean;
var iAtual,iQuant : Integer;
    sMens,sDtLancto : String;
    _cdsIntegra : TClientDataSet;
    dValor, dValorTotal : Double;
begin
   Result    := True;
   sDtLancto := DateToStr(edDataRepactua.Date);
   // Testa pelo período se é possivel contabilizar
   liEmpresa   := Sistema.IdEmpresa;
   iAtual := 1;
   dValor      := 0;
   dValorTotal := 0;
   iQuant := qryRepCondImovxOper.RecordCount;
   
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Contabilizando o Desconto...');
   _cdsIntegra := TClientDataSet.Create(nil);
   try
     try
        qryRepCondImovxOper.First;
        while not qryRepCondImovxOper.Eof do
        begin

           if not InicializaParam( qryCondPagCODTIPIMOVEL.AsString,'O',
                                  qryRepCondImovxOper.FieldByName('IDTIPOCUSTORECIMO').AsInteger) then begin
              raise Exception.Create ( 'Não foi possível encontrar a parametrização do acréscimo / desconto para segmento: '+ #13+
                                       qryCondPagCODTIPIMOVEL.AsString  );
           end;

           _cdsIntegra.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(iIdContratoImovel);
           while not _cdsIntegra.Eof do
           begin
            if _cdsIntegra.RecNo = _cdsIntegra.RecordCount then
              dValor := qryRepCondImovxOper.FieldByName('VLROPERACAO').AsFloat - dValorTotal
            else
              dValor := (qryRepCondImovxOper.FieldByName('VLROPERACAO').AsFloat *
                         _cdsIntegra.FieldByName('PERCENTRATEIO').asFloat) / 100;
            dValorTotal := dValorTotal + dValor;

            if not CtrlLancamento.InsereLancaContab ('2',
                                                      Sistema.idEmpresa,
                                                      Sistema.idModulo,
                                                      Sistema.idUsuario,
                                                      IntegraBack.Plano,
                                                      ParamContabeis.iUnidNegoc, 0, 0,
                                                      //IntegraBack.PlanoPrevGlobal,
                                                      _cdsIntegra.FieldByName('IDPLANOPREV').asInteger,
                                                      //IntegraBack.PatroGlobal,
                                                      _cdsIntegra.FieldByName('IDPATRO').asInteger,
                                                      iPlnCodigo, 0,
                                                      sDtLancto,
                                                      '',
                                                      ParamContabeis.sHistoricoCtb,
                                                      '',
                                                      '',
                                                      '',
                                                      '',
                                                      '03',
                                                      ParamContabeis.sCentroCustoDebito,
                                                      ParamContabeis.sContaContabilDebito,
                                                      ParamContabeis.sCentroCustoCredito,
                                                      ParamContabeis.sContaContabilCredito,
                                                      '',
                                                      dValor,
                                                      False,
                                                      Sistema.UsaPlanoPatro,
                                                      -1,
                                                      Date, -1, -1, True, -1, False,
                                                      qryRepCondImovxOper.FieldByName('VLROPERACAO').AsFloat) then
              raise Exception.Create ( CtrlLancamento.MessageInfo )
            else

            //edilaine SIG97015 : inicio
              if iPlnCodigo = 0 then
                 iPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
            //edilaine SIG97015 : fim

              _cdsIntegra.Next;
           end;

           //if iPlnCodigo = 0 then                                                //edilaine SIG97015
           //   iPlnCodigo := CtrlLancamento.RetornoPlnCodigo;                     //edilaine SIG97015

           qryRepCondImovxOper.Edit;
           qryRepCondImovxOper.FieldByName('LANCNUMLAN').AsInteger := CtrlLancamento.NumLancamento;
           qryRepCondImovxOper.Next;
        end;
     except
        on E : Exception do begin
           Result := False;
           MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
        end;
     end;
   finally
    FreeAndNil(_cdsIntegra);
   end;
end;


// -----------------------------------------------------------------------------
// Carrega parâmetros para contabilização da baixa do tipo 5 ou Desconto
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.InicializaParam(const sCodTipImovel, sTipoOperacao :String; const iTipoRec:Integer) : Boolean;
var iCodErro : Integer;
    bImovel : Boolean;
begin
   Result := True;

   if qryParcFLGTIPOCONTRATO.AsString = 'C' then
   begin
      // Carrega o tipo ParamContabeis com os parametros para cada tipo de parcela
      if ModuloImobiliario.Alienacao.iTipoRecAmortiz <= 0 then begin
         MsgDlg('Nenhuma Parametrização Definida para Amortização de Parcelas','Aviso',mtWarning,[mbOk],0);
         Result := False;
         Exit;
      end;
   end
   else
   begin
      // Carrega o tipo ParamContabeis com os parametros para cada tipo de parcela
      if ModuloImobiliario.Alienacao.iTipoRecAmortAC <= 0 then begin
         MsgDlg('Nenhuma Parametrização Definida para Amortização de Parcelas de Acordo','Aviso',mtWarning,[mbOk],0);
         Result := False;
         Exit;
      end;
   end;


   // zera parametros contabeis
   CtrlPadrLancImovel.ZeraPadrLancContabil( ParamContabeis );

   // definir parâmetros contábeis
   if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabeis, iCodErro, sTipoOperacao, False,
                                                   Sistema.idEmpresa, Sistema.idModulo,
                                                   iTipoRec,
                                                   sCodTipImovel) then
      Result := False;

   with dtmLookImobiliario do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      qryLookTipoRecDes.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoRec;
      qryLookTipoRecDes.Open;
   end;


   // trata erro
   if iCodErro < 0 then begin
      with dtmLookImobiliario do begin
         LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
         qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := sCodTipImovel;
         qryLookTipoImovel.Open;

         if iCodErro = -4 then begin
            MsgDlg('Parametrização Duplicada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end else begin
            MsgDlg('Parametrização Não Encontrada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end;
      end;

      Result := False;
      Exit;
   end;

   // Define Historico contábil
   ParamContabeis.sHistoricoCtb := 'Repactuação do Contrato nº ' + molProposta1.sNumContrato + ' - ' +
                                   dtmLookImobiliario.qryLookTipoRecDesDESCCUSTORECIMO.AsString;

   // Adiciona o Nr. do imóvel
   LimpaParametros( qryImoveis );
   qryImoveis.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molProposta1.iProposta;
   qryImoveis.Open;

   bImovel := False;
   while not qryImoveis.Eof do begin
      if not qryImoveisIMOCODIGO.IsNull then begin
         if bImovel = False then begin
            ParamContabeis.sHistoricoCtb := ParamContabeis.sHistoricoCtb + ', Imóvel ';
            bImovel := True;
         end;
         ParamContabeis.sHistoricoCtb := ParamContabeis.sHistoricoCtb + qryImoveisIMOCODIGO.AsString + ' ';
      end;
      qryImoveis.Next;
   end;

end;



procedure TfrmExecRepactuacao.dbgParcTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecRepactuacao.dbgParcCalcCellColors(Sender: TObject;
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



// -----------------------------------------------------------------------------
// Seleciona condição de pagamento para repactuação
// -----------------------------------------------------------------------------
procedure TfrmExecRepactuacao.dbgCondPagDblClick(Sender: TObject);
begin
   inherited;
   if not qryCondPag.IsEmpty then begin
      qryCondPag.Edit;
      qryCondPagCHKREPACTUA.AsInteger := (qryCondPagCHKREPACTUA.AsInteger Xor 1);
      qryCondPag.Post;
   end;
end;



// -----------------------------------------------------------------------------
// Gera as parcelas para as condições de pagamento resultantes
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.RecalculaParcelas: Boolean;
begin
   Result := True;
   // Se estiver mesclando ou desmembrando, calcula todas as parcelas das
   // condições Resultantes, caso contrário, calcula a partir da condíção inicial
   try
      if (bMesclaCondPag) or (DBSpnQtde.Value > 1) or (chkNovaCondPag.Checked = True) then begin
         qryCondResult.First;
         while not qryCondResult.Eof do begin
            Result := FuncAlienacao.RecalculaParcela(qryCondResultIDCONDRESULT.AsInteger,
                                                     qryCondResultDATAVENCIMENTO.AsDateTime);
            if not Result then break;
            qryCondResult.Next;
         end;
      end else begin

            // Posiciona na condição repactuada
            qryCondPag.First;
            while not qryCondPag.Eof do begin
               if qryCondPagCHKREPACTUA.AsInteger = 1 then Break;
               qryCondPag.Next;
            end;
            Result := FuncAlienacao.RecalculaParcela(qryCondPagIDCONDINICIAL.AsInteger,
                                                     qryCondPagDATAVENCTOINICIAL.AsDateTime);
      end;

   except
      Result := False;
   end;
end;



// -----------------------------------------------------------------------------
// Verifica as condições de pagamento selecionadas, se existe algum lançamento
// superior a data da repactuação
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.VerificaCondPag: Boolean;
var iQtde    : Integer;
    dDataIni : TDateTime;
begin
   Result   := False;
   bMesclaCondPag := False;
   dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   with qryCondPag do begin
      DisableControls;
      First;
      while not eof do begin
         if qryCondPagCHKREPACTUA.AsInteger = 1 then begin

            // Verifica se mais de uma cond. de pagamento será repactuada
            if Result = True then bMesclaCondPag := True;

            Result := True;

            // Verifica data inicial da condição de Pagamento
            if dDataIni < qryCondPagCONDATAASSINATURA.AsDateTime then begin
               MsgDlg('Início da Repactuação não pode ser inferior a data de assinatura do Contrato','Aviso',mtWarning,[mbOK],0);
               Result := False;
               Break;
            end;

            if FuncAlienacao.TemRepacSuperior(qryCondPagIDCONDINICIAL.AsInteger, -1, dDataIni) then begin
               MsgDlg('Já existe outra Repactuação com início superior ao informado','Aviso',mtWarning,[mbOK],0);
               Result := False;
               Break;
            end;

            if FuncAlienacao.TemParcIntegrada(qryCondPagIDCONDINICIAL.AsInteger, strtodate(edDataRepactua.text), iQtde) then begin // SOL 231549
               if iQtde = 1 then
                    MsgDlg('Existe '  + FormatFloat('##0',iQtde) + ' parcela integrada após esta data. Não é possível efetuar a Repactuação neste período.','Aviso',mtWarning,[mbOK],0)
               else MsgDlg('Existem ' + FormatFloat('##0',iQtde) + ' parcelas integradas após esta data. Não é possível efetuar a Repactuação neste período.','Aviso',mtWarning,[mbOK],0);
               Result := False;
               Break;
            end;
         end;
         Next;
      end;
      First;
      EnableControls;
   end;
end;



procedure TfrmExecRepactuacao.qryCondPagCalcFields(DataSet: TDataSet);
begin
   inherited;
   if qryCondPagPERIODOTAXA.AsString = 'M' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.000000', qryCondPagTAXAJUROS.AsFloat) +  '% Mês'
   else qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.000000', qryCondPagTAXAJUROS.AsFloat) +  '% Ano';

   if qryCondPagPERIODO.AsFloat = 1 then begin
      if qryCondPagPRAZO.AsString = 'M' then
           qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Mês'
      else qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Ano';
   end else begin
      if qryCondPagPRAZO.AsString = 'M' then
           qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Meses'
      else qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Anos';
   end;
end;



// -----------------------------------------------------------------------------
// Transfere os dados da condição resultante, para a qry virtual
// -----------------------------------------------------------------------------
procedure TfrmExecRepactuacao.bbAplicarClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoCondicao then begin
      qryCondResult.Insert;
      qryCondResultVLRFINANC.AsFloat         := edSaldoDev.Value;
      qryCondResultDATAINI.AsDateTime        := cmDataIni.Date;
      qryCondResultDATAVENCIMENTO.AsDateTime := cmDtVencto.Date;
      qryCondResultDATAINIAMORTIZ.AsDateTime := cmdtAmortiz.Date;
      qryCondResultNUMPARCELAS.AsFloat       := dbedtParc.Value;
      qryCondResultINTERVALO.AsFloat         := dbspnPeriodo.Value;
      qryCondResultPERPARC.AsString          := dbcbPerParc.Value;
      qryCondResultFORMACALCULO.AsInteger    := StrToInt(dbcbFormaCalculo.Value);
      qryCondResultDSCFORMACALCULO.AsString  := dbcbFormaCalculo.Text;

      // Marchetti - Pendencia 25979
      if qryCondResultFORMACALCULO.AsInteger <> 9 then
      begin
         qryCondResultJUROS.AsFloat             := dbedtJuros.Value;
         qryCondResultPERJUROS.AsString         := dbcbPerJur.Value;

         if dblcbIndCorr.Text <> '' then begin
              qryCondResultINDCORR.AsInteger    := StrToInt(dblcbIndCorr.LookupValue);
              qryCondResultDSCINDCORR.AsString  := dblcbIndCorr.Text;
         end;

         if dblcbIndProj.Text <> '' then begin
              qryCondResultINDPROJ.AsInteger    := StrToInt(dblcbIndProj.LookupValue);
              qryCondResultDSCINDPROJ.AsString  := dblcbIndProj.Text;
         end;
         qryCondResultPERPROJ.AsFloat           := edtPerProj.Value;
         qryCondResultMESREFREAJUSTE.AsFloat    := dbedtMesRefReajuste.Value;

         if dbcbJurosCarencia.Checked then
              qryCondResultFLGJURCARENCIA.AsString := 'S'
         else qryCondResultFLGJURCARENCIA.AsString := 'N';

      end;

      if qryCondResultFORMACALCULO.AsInteger <> 9 then
         qryCondResultFLGJURCARENCIA.AsString := 'N';
      // Fim Marchetti - Pendencia 25979

      qryCondResult.Post;
   end;
end;

procedure TfrmExecRepactuacao.bbExcluirClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma a Exclusão da Condição?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      qryCondResult.Delete;
   end;
end;



// -----------------------------------------------------------------------------
// Verifica o preenchimento da tela de condição de pagamento resultante
// -----------------------------------------------------------------------------
function TfrmExecRepactuacao.VerificaPreenchimentoCondicao: Boolean;
var dDataIni : TDateTime;
    iQtde    : Double;
begin
   Result   := False;
   dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   try

      if cmDataIni.Text = '' then
         raise EValidacao.CreateVal('Data de início da condição não foi preenchida',cmDataIni);

      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,cmDataIni.Text) then
        raise EValidacao.CreateVal('Período contábil bloqueado - Data de início da condição.',cmDataIni);
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

      if cmDataIni.Date > cmDtVencto.date then
         raise EValidacao.CreateVal('Data de início da condição não pode ser posterior a data de vencimento ',cmDataIni);

      if cmDataIni.Date < molProposta1.dDataAssinatura then
         raise EValidacao.CreateVal('Data de início da condição não pode ser anterior a data de assinatura do contrato ',cmDataIni);

      if cmDtVencto.Text = '' then
         raise EValidacao.CreateVal('Data do próximo vencimento não foi preenchida',cmDtVencto);
      if cmDtVencto.Date < dDataIni then
         raise EValidacao.CreateVal('Data do próximo vencimento não pode ser inferior ao início da Repactuação',cmDtVencto);

      if dbEdtParc.Value <= 0 then
         raise EValidacao.CreateVal('Nr. de Parcelas deve ser preenchido',dbEdtParc);

      if dbspnPeriodo.Value <= 0 then
         raise EValidacao.CreateVal('Intervalo entre as Parcelas deve ser preenchido',dbSpnPeriodo);

      if dbcbPerParc.ItemIndex < 0 then
         raise EValidacao.CreateVal('Periodicidade das Parcelas deve ser preenchida',dbcbPerParc);

      if dbcbFormaCalculo.ItemIndex < 0 then
         raise EValidacao.CreateVal('Forma de Calculo deve ser preenchida',dbcbFormaCalculo);

      if (DBSpnQtde.Value = 1) and (not chkNovaCondPag.Checked) then begin
         iQtde := QtdeMinimaParcelas(qryCondPagIDCONDINICIAL.AsInteger);
         if dbEdtParc.Value < iQtde then
            raise EValidacao.CreateVal('Nr. Mínimo de parcelas na Repactuação = ' + FormatFloat('##0',iQtde) +
                                       ', pois as mesmas já foram integradas.',dbEdtParc);
      end;
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


// Marchetti
procedure TfrmExecRepactuacao.btnContinua4Click(Sender: TObject);
var sSql : String;
    sMesR,sAnoR,sMesC,sAnoC : Word;
begin
   inherited;

   // Se estiver repactuando uma condição de pagamento que ainda não teve nenhuma
   // parcela vencida, ou seja, antes de começar a cobrança, e que não tenha sido
   // atribuido desconto no passo anterior, transferir o saldo devedor
   // inicial para a condição de repactuação, pois esta passará a ser a efetiva.
   if edtNovoSaldoOper.Value = edtSaldoAnterior.Value then begin
      sSql := 'SELECT DATAVENCIMENTO, VLRFINANC ' +
              '  FROM CONDPAGIMOVEL ' +
              ' WHERE IDCONDPAGIMOVEL = ' + IntToStr(qryCondPagIDCONDINICIAL.AsInteger);
      FazQuery(dtmFinanciamento.qryAux, sSql);
      with dtmFinanciamento do begin
         if qryAux.RecordCount = 1 then begin
            sMesC := DiasInUteis.ExtraiMes(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime);
            sAnoC := DiasInUteis.ExtraiAno(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime);

            if (sMesC = (cboMes.ItemIndex + 1)) and (sAnoC = DBspnAno.Value) then begin
               edSaldoDev.Value := Arredonda(qryAux.FieldByName('VLRFINANC').AsFloat,2);
            end;
         end;
      end;
   end;

   // Transfere o Total Devido Apurado para a Repactução
   if (Int(edtNovoSaldoOper.Value) <> 0) or (Int(edTotDesc.Value) > 0) or (Int(edtTotAcres.Value) > 0)then
        edSaldoDev.Value := Arredonda(edtNovoSaldoOper.Value,2)
   else edSaldoDev.Value := 0;

   // Se existir desmembramento de condições, liberar a edição do Saldo
   if DBSpnQtde.Value > 1 then
        edSaldoDev.Enabled := True
   else edSaldoDev.Enabled := False;

   nbRepactua.PageIndex := nbRepactua.PageIndex + 1;
end;



procedure TfrmExecRepactuacao.molTipoOperacao1btnBuscaTipoOperClick(
  Sender: TObject);
begin
   inherited;
   molTipoOperacao.btnBuscaTipoOperClick(Sender);
end;



procedure TfrmExecRepactuacao.btnAplicaOperacaoClick(Sender: TObject);
begin
   inherited;
   { Faz o Insert na query }

   if Trim(molTipoOperacao.sNomeOper) = '' then
   begin
      MsgDlg('Obrigatório informar o Tipo de Operação', 'Aviso', mtError, [mbOk], 0);
      Exit;
   end;

   if edtValorOperacao.Value = 0 then
   begin
      MsgDlg('Obrigatório informar o Valor da Operação', 'Aviso', mtError, [mbOk], 0);
      Exit;
   end;

   if memObservacao.Text = '' then
   begin
      MsgDlg('Obrigatório informar a Observação da Operação', 'Aviso', mtError, [mbOk], 0);
      Exit;
   end;

   qryRepCondImovxOper.Append;
   qryRepCondImovxOper.FieldByName('IDREPACTUA').AsInteger        := -1;
   qryRepCondImovxOper.FieldByName('IDTIPOCUSTORECIMO').AsInteger := molTipoOperacao.iTipoOper;
   qryRepCondImovxOper.FieldByName('FLGTIPOOPER').AsString        := molTipoOperacao.sTipoOper;
   qryRepCondImovxOper.FieldByName('DESC_TIPOOPER').AsString      := molTipoOperacao.sNomeOper;
   qryRepCondImovxOper.FieldByName('VLROPERACAO').AsFloat         := edtValorOperacao.Value;
   qryRepCondImovxOper.FieldByName('OBSERVACAO').AsString         := memObservacao.Text;
   qryRepCondImovxOper.Post;

   edtValorOperacao.Clear;
   CalculaOperacoes;
end;



procedure TfrmExecRepactuacao.btnExcluiOperacaoClick(Sender: TObject);
begin
  inherited;
   if MsgDlg('Confirma a Exclusão da Operação Selecionada?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      qryRepCondImovxOper.Delete;
      CalculaOperacoes;
   end;

end;



procedure TfrmExecRepactuacao.CalculaOperacoes;
begin
   { Varre a query para efetuar o somatorio de acréscimos e descontos e novo saldo }

   edtTotAcres.Value := 0;
   edTotDesc.Value   := 0;

   qryRepCondImovxOper.DisableControls;
   qryRepCondImovxOper.First;
   while not qryRepCondImovxOper.eof do
   begin
     if qryRepCondImovxOper.FieldByName('FLGTIPOOPER').AsString = 'A' then
        edtTotAcres.Value := edtTotAcres.Value + qryRepCondImovxOper.FieldByName('VLROPERACAO').AsFloat;

     if qryRepCondImovxOper.FieldByName('FLGTIPOOPER').AsString = 'D' then
        edTotDesc.Value := edTotDesc.Value + qryRepCondImovxOper.FieldByName('VLROPERACAO').AsFloat;

     qryRepCondImovxOper.Next;
   end;
   qryRepCondImovxOper.First;
   qryRepCondImovxOper.EnableControls;

   edtNovoSaldoOper.Value := edNovoSaldo.Value + edtTotAcres.Value - edTotDesc.Value;
end;



procedure TfrmExecRepactuacao.FormCreate(Sender: TObject);
begin
  inherited;
  sFiltro := dtmMS.MS_TipoOperacao.Filtro.Text;
  dtmMS.MS_TipoOperacao.Filtro.Add('IDMODULO = ' + IntToStr(Sistema.IdModulo));
  dtmMS.MS_TipoOperacao.Filtro.Add('RECCUSTO = ''O''');


  //CtrlLancamento := TCtrlLancamento.Create;
  CtrlLancamento := TCtrlImobLancamento.Create;
  CtrlLancamento.InitializeAs(Padroes);
  CtrlPadrLancImovel  := TCtrlPadrLancIMovel.Create(Sistema.IdEmpresa, Sistema.IdModulo);
  CtrlPadrLancImovel.InitializeAs( Padroes );

  //CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento := TCtrlImobDocumento.Create;
  CtrlDocumento.InitializeAs(Padroes);
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                                     Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro);
  //Cássio - SOL Nº 142074  KINTANA Nº 902858 - Início
  ComunsImobiliarioDB.InitializeAs( Padroes );
  //Cássio - SOL Nº 142074 KINTANA Nº 902858 - Fim
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);

end;



procedure TfrmExecRepactuacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmMS.MS_TipoOperacao.Filtro.Text := sFiltro;
   FreeAndNil( CtrlLancamento );
   FreeAndNil( CtrlPadrLancImovel );
   FreeAndNil( CtrlDocumento );
   //Cássio - SOL Nº 142074  KINTANA Nº 902858 - Início
   FreeAndNil( ComunsImobiliarioDB );
   //Cássio - SOL Nº 142074  KINTANA Nº 902858 - Fim
   FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344

   inherited;
end;



procedure TfrmExecRepactuacao.cboMesChange(Sender: TObject);
begin
   inherited;
   // Data de Início da Repactuação
   edDataRepactua.Date := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
end;

procedure TfrmExecRepactuacao.btnMarcaTodasParcelasClick(Sender: TObject);
var fTotRepac : Extended;
begin
   inherited;
   qryParc.First;
   while not qryParc.eof do
   begin

       qryParc.Edit;
       qryParcCHKREPACTUA.AsInteger := (qryParcCHKREPACTUA.AsInteger Xor 1);
       qryParc.Post;

       // Calcula o Total Devido
       // SE NÃO contabilizou/gerou documento e ainda não venceu, repactua apenas o valor da amortização
       if (qryParcCODDOCUMENTO.IsNull) and (qryParcDATAVENCIMENTO.AsDateTime >= edDataRepactua.Date) then begin
          fTotRepac := qryParcVLRAMORTIZACAO.AsFloat;
       end else begin
          fTotRepac := qryParcVLRDEVIDO.AsFloat + qryParcVLRRESIDUOATUALI.AsFloat;
       end;
       if qryParcCHKREPACTUA.AsInteger = 1 then begin
          edTotRepac.Value  := edTotRepac.Value  + fTotRepac;
          edTotAtraso.Value := edTotAtraso.Value - fTotRepac;
       end else begin
          edTotRepac.Value  := edTotRepac.Value  - fTotRepac;
          edTotAtraso.Value := edTotAtraso.Value + fTotRepac;
       end;
       edNovoSaldo.Value := edTotSaldoDev.Value + edTotRepac.Value;

       qryParc.Next;
   end;
   qryParc.First;

end;

procedure TfrmExecRepactuacao.btnInverteSelecaoClick(Sender: TObject);
var fTotRepac : Extended;
begin
   inherited;
   qryParc.First;
   while not qryParc.eof do
   begin
       qryParc.Edit;
       if qryParcCHKREPACTUA.AsInteger = 1 then qryParcCHKREPACTUA.AsInteger := 0
       else                                     qryParcCHKREPACTUA.AsInteger := 1;
       qryParc.Post;

       // Calcula o Total Devido
       // SE NÃO contabilizou/gerou documento e ainda não venceu, repactua apenas o valor da amortização
       if (qryParcCODDOCUMENTO.IsNull) and (qryParcDATAVENCIMENTO.AsDateTime >= edDataRepactua.Date) then begin
          fTotRepac := qryParcVLRAMORTIZACAO.AsFloat;
       end else begin
          fTotRepac := qryParcVLRDEVIDO.AsFloat + qryParcVLRRESIDUOATUALI.AsFloat;
       end;
       if qryParcCHKREPACTUA.AsInteger = 1 then begin
          edTotRepac.Value  := edTotRepac.Value  + fTotRepac;
          edTotAtraso.Value := edTotAtraso.Value - fTotRepac;
       end else begin
          edTotRepac.Value  := edTotRepac.Value  - fTotRepac;
          edTotAtraso.Value := edTotAtraso.Value + fTotRepac;
       end;
       edNovoSaldo.Value := edTotSaldoDev.Value + edTotRepac.Value;

       qryParc.Next;
   end;
   qryParc.First;
end;

end.
