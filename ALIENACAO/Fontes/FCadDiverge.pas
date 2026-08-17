{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------


	   Gera Parcela de Cobrança de Divergências

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  10/12/2001
	Data de Término   :


--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Retirados os parâmetros em desuso na chamada da função
              'UltimoFechamento'...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadDiverge;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  Mask, DBCtrls, DBCtrls2, wwdblook, Db, DBTables, Wwquery, CMDBLookupCombo,
  UFuncoesImob, UComunsImobiliarioDB, uCtrlPadroes,
  uCtrlParamIntegra, {uCtrlDocumento, uCtrlLancamento} uCtrlImobDocumento, uCtrlImobLancamento,
  uCtrlPadrLancImovel, uCtrlOperImob;


type
   TDiverge = Record              // Valores a serem usados pelo Cadastro de Divergencia
      sNumContrato  : String;
      sComprador    : String;
      iComprador    : Integer;
      iIdContrato   : Integer;
      sCodTipImovel : String;
      iCondPag      : Integer;
      iTipoParc     : Integer;
      iVlrSaldoDoc  : Extended;
      iVlrCorrecao  : Extended;
      iVlrMulta     : Extended;
      iVlrJuros     : Extended;
      qryDiverge    : TwwQuery;
      dDataAtualiza : TDateTime;
   end;


  TfrmCadDiverge = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gbMensagem: TGroupBox;
    Label26: TLabel;
    edDataVencto: TCMDateTimePicker;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaDESCRICAO: TStringField;
    edVlrTotal: TRealEdit;
    edComprador: TEdit;
    dbcboPortadorForma: TCMDBLookupCombo;
    qryLookPortadorFormaCODFORMA: TFloatField;
    qryAux: TwwQuery;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtln9: TEdit;
    edtln8: TEdit;
    edtln7: TEdit;
    edtln6: TEdit;
    edtln5: TEdit;
    edtln4: TEdit;
    edtln3: TEdit;
    edtln2: TEdit;
    edtln1: TEdit;
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
    qryDadosCliente: TwwQuery;
    qryDadosClienteIDPAIS: TFloatField;
    qryDadosClienteIDCIDADES: TFloatField;
    qryDadosClienteCODESTADO: TStringField;
    qryTipoContrato: TwwQuery;
    qryTipoContratoFLGTIPOCONTRATO: TStringField;
    edtDataConcilia: TCMDateTimePicker;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    ParamContabeis : TParamContabeisMT;
    iCodTipoDoc    : Integer;

    ComunsImobiliarioDB : TComunsImobiliarioDB;

    //CtrlDocumento      : TCtrlDocumento;
    //CtrlLancamento     : TCtrlLancamento;
    CtrlDocumento      : TCtrlImobDocumento;
    CtrlLancamento     : TCtrlImobLancamento;
    CtrlPadrLancImovel : TCtrlPadrLancImovel;
    CtrlOperImob       : TCtrlOperImob;

    liRetFuncao,liEmpresa,liExercicio,liPeriodo : LongInt;
    iPlanilha : Integer;

    iAltJuros,iAltMulta,iAltCorr : Integer;
    sAltJuros,sAltMulta,sAltCorr : String;

    procedure AbreTabelas;
    function  InicializaParam(const iTipoLanc:Integer): Boolean;  // Busca dados da parametrização contabil
    function  BuscaAlterador(const iCodAlt : Integer; var sConta,sSubConta,sCCusto : String) : Boolean;
    function  ExcluiAlterador(const iCodDocumento: Integer): Boolean;
    function  LancaAlterador(const fSaldoDoc:Extended): Boolean;
    procedure Processa;
    function  LancCar: Int64;
    function  LancContab(iDocumento: Int64): Integer;
    procedure ProcessaMensagem(iDocumento: Int64);
    function  GravaIntegra(iCodDocumento:Int64; iPlnCodigo:Integer): Boolean;
  public
    { Public declarations }
    Diverge : TDiverge;
  end;

var
  frmCadDiverge: TfrmCadDiverge;

implementation

uses uDataBase, dBaseDados, uSistema, uMensErro,
     DFinanciamento, uIntegraBack, dLookImobiliario, uModuloAlienacao,
     uFuncaoGeral, uCalcDocumento, UFuncAlienacao, uModuloImobiliario,
     dImobiliario, dLancImovel;

{$R *.DFM}

procedure TfrmCadDiverge.AbreTabelas;
begin
  with qryLookPortadorForma do begin
     LimpaParametros(qryLookPortadorForma);
     Params[0].asInteger := Sistema.idEmpresa;
     Open;
  end;

  LimpaParametros(dtmFinanciamento.qryParc);
  dtmFinanciamento.qryParc.Open;
end;

procedure TfrmCadDiverge.FormShow(Sender: TObject);
begin
   inherited;
   edComprador.Text  := Diverge.sComprador;
   edVlrTotal.Value  := Diverge.iVlrSaldoDoc +
                        Diverge.iVlrCorrecao +
                        Diverge.iVlrJuros    +
                        Diverge.iVlrMulta;
   edDataVencto.Date := Diverge.dDataAtualiza;
   dbcboPortadorForma.SetFocus;
   AbreTabelas;
end;

procedure TfrmCadDiverge.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if edDataVencto.Date < Date then begin
      if MsgDlg('Confirma o lançamento de um documento já vencido ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
         edDataVencto.SetFocus;
         Exit;
      end;
   end;

   if MsgDlg('Confirma o lançamento no Contas a Receber ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      edDataVencto.SetFocus;
      Exit;
   end;
   Processa;
end;

procedure TfrmCadDiverge.Processa;
var sMens         : String;
    iCodDocumento : Int64;
begin

    // Testa pelo período se é possivel contabilizar
    liEmpresa   := Sistema.IdEmpresa;

    // Busca os parametros da Contabilização
    if not InicializaParam( Diverge.iTipoParc ) then begin
       Exit;
    end;

    try
       StartTransacao;
       iCodDocumento := LancCar;
       // Processa Mensagens para o Boleto
       ProcessaMensagem(iCodDocumento);
       // Grava o Registro em PARCFINANCIMOV
       if not GravaIntegra(iCodDocumento,0 ) then begin
          RollBackTransacao;
          Abort;
       end else begin
          CommitTransacao;
       end;
    except
       RollBackTransacao;
       raise;
    end;
end;

function TfrmCadDiverge.InicializaParam (const iTipoLanc:Integer) : Boolean;
var
   TipoRec   : Integer;
   iTipoParc : Integer;
   iCodErro  : Integer;
   sTipo     : String;
begin
   LimpaParametros(qryTipoContrato);
   qryTipoContrato.ParamByName('PIDCONTRATOIMOVEL').AsInteger := Diverge.iIdContrato;
   qryTipoContrato.Open;

   Result := True;

   if qryTipoContratoFLGTIPOCONTRATO.AsString = 'C' then
   begin
      Case iTipoLanc of
         1 : TipoRec := 0;                                              // Saldo Inicial
         2 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecSinal;      // Sinal
         3 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortiz;    // Parcela Gerada
         4 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecProjecao;   // Projecao de parcelas
         5 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortExtra; // Amortização Extra
         6 : TipoRec := 0;                                              // Pagamentos Extras - Divergências
         7 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAVista;     // Venda a Vista
         8 : TipoRec := 0;                                              // Caução
         9 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortiz;    // Parcela Antecipada
        10 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJuros;      // Provisionamento de Juros das parcelas
        11 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecCorrecao;   // Correção das parcelas
      end;
   end
   else
   begin
      Case iTipoLanc of
         1 : TipoRec := 0;                                              // Saldo Inicial
         2 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Sinal
         3 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Parcela Gerada
         4 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Projecao de parcelas
         5 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Amortização Extra
         6 : TipoRec := 0;                                              // Pagamentos Extras - Divergências
         7 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Venda a Vista
         8 : TipoRec := 0;                                              // Caução
         9 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecAmortAC;    // Parcela Antecipada
        10 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecJurosAC;    // Provisionamento de Juros das parcelas
        11 : TipoRec := ModuloImobiliario.Alienacao.iTipoRecCorrecaoAC; // Correção das parcelas
      end;
   end;

   iTipoParc := Diverge.iTipoParc;

   // Carrega o tipo ParamContabeis com os parametros
   if TipoRec = 0 then begin
      case iTipoLanc of
         1  : sTipo := 'Saldo Inicial';
         2  : sTipo := 'Sinal';
         3  : sTipo := 'Amortização de Parcelamento';
         4  : sTipo := 'Projeção de Parcelamento';
         5  : sTipo := 'Amortização Extra';
         6  : sTipo := 'Divergencias';
         7  : sTipo := 'Venda a Vista';
         8  : sTipo := 'Caução';
         9  : sTipo := 'Amortização de Parcelamento';
         10 : sTipo := 'Provisionamento de Juros de Parcelamento';
         11 : sTipo := 'Correção Monetária de Parcelamento';
      end;
      MsgDlg('Nenhuma Parametrização Definida para : ' + sTipo,'Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   // Carrega o tipo de documento padrão para o tipo de receita
   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := TipoRec;
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   iCodTipoDoc := dtmLookImobiliario.qryLookTipoRecDesCODTIPDOC.AsInteger;

   if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabeis,
                                                   iCodErro,
                                                   'R',
                                                   False,
                                                   Sistema.idEmpresa,
                                                   Sistema.idModulo,
                                                   TipoRec,
                                                   Diverge.sCodTipImovel,
                                                   -1,
                                                   Diverge.iIdContrato) then
   begin
      Result := False;
   end;


   // trata erro
   if iCodErro < 0 then begin
      with dtmLookImobiliario do begin
         LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
         qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := Diverge.sCodTipImovel;
         qryLookTipoImovel.Open;

         if iCodErro = -4 then begin
            MsgDlg('Parametrização Duplicada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end;
         if iCodErro = -5 then begin
            MsgDlg('Parametrização Não Encontrada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end;
         if iCodErro = -6 then begin
            MsgDlg('Tipo de Recebimento Inativo para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end;
      end;
      Result := False;
      Exit;
   end;
end;


function TfrmCadDiverge.LancCar: Int64;
var
   iCodDoc, iNumLancto : Int64;
   sOperacao,sHist     : String;
   iSubContaDebCred    : Integer;
   iValor              : Double;
   dEmissao            : TDateTime;
   dDataLimite         : TDateTime;
   sDataProgramada     : String;
begin
   iCodDoc := CtrlDocumento.GetSequenceDocumento;

   sOperacao := '2 ';

   if ( (ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0) or
        (ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0) or
        (ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0) ) then begin
      iPlanilha := -1;
   end else begin
      iPlanilha := LancContab(iCodDoc);
      if iPlanilha <= 0 then begin
         Result := -1;
         Abort;
      end;
   end;

   if iCodDoc <= 0 then begin
      Result := -1;
      Abort;
   end else begin
      Result := iCodDoc;
   end;

   // tenta converter a subcontadebcred se não conseguir atribui -1
   if ParamContabeis.sSubContaDebCred = '' then
        iSubContaDebCred := -1
   else iSubContaDebCred := strtoint(ParamContabeis.sSubContaDebCred);

   // Define o Historico do CAR
   if Diverge.iVlrSaldoDoc > 0 then sHist := 'Saldo/';
   if Diverge.iVlrMulta > 0    then sHist := sHist + 'Multa/';
   if Diverge.iVlrJuros > 0    then sHist := sHist + 'Juros/';
   if Diverge.iVlrCorrecao > 0 then sHist := sHist + 'Correção';

   ParamContabeis.sHistoricoCapCar := sHist + ' do Contrato ' + Diverge.sNumContrato +
                                      ' - ' + modulo.sPlanoPatro;;

   // Divide o histórico em sub-históricos se exceder a quantidade de caracteres

   // Define Data de Emissão do documento
   if edDataVencto.Date < Date then
        dEmissao := edDataVencto.Date
   else dEmissao := Date;


   // Marchetti - Pendencia 20478
   LimpaParametros(qryDadosCliente);
   with qryDadosCliente do
   begin
      ParamByName('IDPESSOA').AsInteger := Diverge.iComprador;
      Open;
   end;

   LimpaParametros(dtmLancImovel.qryLancImovel);

   dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger         := Sistema.IdEmpresa;
   dtmLancImovel.qryLancImovel.ParamByName('PIDMODULO').AsInteger         := Sistema.IdModulo;
   dtmLancImovel.qryLancImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := Diverge.iIdContrato;
   dtmLancImovel.qryLancImovel.Open;

   // Verifica o parametro para a data programada do documento
   dDataLimite  := ComunsImobiliarioDB.DataLimite(edDataVencto.Date,
                                            qryDadosClienteIDCIDADES.AsInteger,
                                            qryDadosClienteIDPAIS.AsInteger,
                                            dtmLancImovel.qryLancImovelCONDIASTOLERANCIA.AsInteger,
                                            dtmLancImovel.qryLancImovelCONDIASREPASSE.AsInteger,
                                            qryDadosClienteCODESTADO.AsString,
                                            dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                            dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                            True, False, False);


   if ModuloImobiliario.Alienacao.FLGTIPODATAPROG = 'V' then
      sDataProgramada := FormatDateTime('dd/mm/yyyy',edDataVencto.Date)
   else
      sDataProgramada := FormatDateTime('dd/mm/yyyy', dDataLimite);

   // Parâmetros do CtrlDocumento
   CtrlDocumento.OpenTransaction := False;
   //CtrlDocumento.Prepare( OpDocumento, odlEfetivo, sdocAberto );
   CtrlDocumento.Prepare( OpDocumentoImob, odlEfetivoImob, sdocAbertoImob );
   CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
   CtrlDocumento.IdUsuario     := Sistema.idUsuario;
   CtrlDocumento.IdEspAcesso   := Sistema.idEspAcesso;
   CtrlDocumento.IdModulo      := Sistema.idModulo;

   // Seta valores para Documento
   CtrlDocumento.SetValues(iCodDoc,
                           iCodDoc, '', '',
                           'R',
                           sOperacao,'','',
                           ParamContabeis.sContaDebCred,
                           ParamContabeis.sCentroCustoDebCred,
                           '','','','','','',
                           '',
                           '',
                           edDataVencto.Date,
                           dEmissao,
                           StrToDate(sDataProgramada),
                           0,
                           0,0,0,0,0,0,0,
                           iCodTipoDoc,
                           Sistema.idEmpresa,
                           Sistema.idModulo,
                           Diverge.iComprador,
                           0,
                           -1,
                           ParamContabeis.iUnidNegoc,
                           IntegraBack.Plano,
                           0, 0, Modulo.iMoedaCorrente, 1, 0,
                           Sistema.idUsuario, Sistema.idEmpresa, 0, 0,
                           iSubContaDebCred,
                           qryLookPortadorFormaCODPORTFORMA.AsInteger,
                           0,0, qryLookPortadorFormaCODFORMA.AsInteger,
                           ParamContabeis.iIdSegregaCriter,
                           ParamContabeis.sContaContabilAntecipa ); // Daniel Simões - 17/03/2006

   CtrlDocumento.Lanctodocum.SetValues(dEmissao,
                                       iCodDoc, 0,
                                       edVlrTotal.Value,
                                       0,
                                       edVlrTotal.Value,
                                       ParamContabeis.iUnidNegoc,
                                       ParamContabeis.iPlanilha,
                                       0,
                                       Sistema.idUsuario,
                                       Sistema.idEmpresa, 0,0,
                                       iCodTipoDoc,0,0,
                                       sOperacao, '','','',
                                       ParamContabeis.sHistoricoCapCar,
                                       '','','','D',
                                       Sistema.idModulo,
                                       IntegraBack.Plano,
                                       Sistema.UsaPlanoPatro, False, -1);

   CtrlDocumento.Rateiodocum.SetValues(edVlrTotal.value,
                                       0,
                                       0,
                                       0,
                                       Sistema.IdEmpresa,
                                       iCodDoc,
                                       ParamContabeis.iUnidNegoc,
                                       0,Sistema.idUsuario,
                                       -1,
                                       IntegraBack.Plano,
                                       IntegraBack.PlanoPrevGlobal,
                                       IntegraBack.PatroGlobal,
                                       ModuloImobiliario.Alienacao.iPrograma,
                                       0,
                                       Sistema.IdEmpresa,
                                       ParamContabeis.sCodTipRecDes,
                                       'R',
                                       ParamContabeis.sCodCentroRespon,
                                       ModuloImobiliario.Alienacao.sCentroCusto, // André Pontes - 09/06/2005 - pendência 19283
                                       ''
                                      );

   if not CtrlDocumento.Insert then
      Result := -1;

end;

function TfrmCadDiverge.LancContab(iDocumento: Int64): Integer;
Var
  iPlnCodigo : Integer;
  iCodDoc    : Int64;
  sMens      : String;
  sContaAlt,sSubContaAlt,sCCustoAlt : String;

  iSubContaCredito : Double;
  iSubContaDebito  : Double;

begin
   Result     := 0;
   iCodDoc    := iDocumento;
   iPlnCodigo := 0;

   iSubContaCredito := -1;
   iSubContaDebito  := -1;

   if ParamContabeis.sSubContaDebito  <> '' then iSubContaCredito := StrToFloat(ParamContabeis.sSubContaDebito);
   if ParamContabeis.sSubContaCredito <> '' then iSubContaDebito  := StrToFloat(ParamContabeis.sSubContaCredito);


   // Busca os códigos de Alteradores por Tipo de Imóvel
   if not FuncAlienacao.BuscaAlteradores(Diverge.iIdContrato,-1,
                                         iAltMulta,iAltJuros,iAltCorr,
                                         sAltMulta,sAltJuros,sAltCorr) then begin
      MsgDlg('Nenhuma Alterador de Juros Multa e Correção Definido para o Tipo de Imóvel','Aviso',mtWarning,[mbOk],0);
      Abort;
   end;

   // Executa Lançamento do Saldo do Documento - Amortização do Principal
   if (Diverge.iVlrSaldoDoc > 0) and (ParamContabeis.bFlgIntegraContab) then begin

      // Define o Historico contábil para Amortização
      ParamContabeis.sHistoricoCtb := 'AMORTIZAÇÃO do Contrato ' + Diverge.sNumContrato +
                                   ' - ' + Diverge.sComprador;

      if CtrlLancamento.InsereLancaContab ('2',
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           Sistema.idUsuario,
                                           IntegraBack.Plano,
                                           ParamContabeis.iUnidNegoc,
                                           iSubContaDebito,
                                           iSubContaCredito,
                                           IntegraBack.PlanoPrevGlobal,
                                           IntegraBack.PatroGlobal,
                                           ParamContabeis.iPlanilha, 0,
                                           DateToStr(Date),
                                           FormatFloat('#0', iCodDoc),
                                           ParamContabeis.sHistoricoCtb, '', '', '', '',
                                           '03',
                                           ParamContabeis.sCentroCustoDebito, ParamContabeis.sContaContabilDebito,
                                           ParamContabeis.sCentroCustoCredito,
                                           ParamContabeis.sContaContabilCredito, '',
                                           Diverge.iVlrSaldoDoc, False,
                                           Sistema.UsaPlanoPatro,
                                           ParamContabeis.iIdSegregaCriter) then
      begin

         if CtrlLancamento.RetornoPlnCodigo > 0 then
             ParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      end;

      iPlnCodigo := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));

   end;

   // Executa Lançamento de Multa
   if Diverge.iVlrMulta > 0 then begin

      // Busca conta Contabil do Alterador para Multa
      if not BuscaAlterador(iAltMulta,sContaAlt,sSubContaAlt,sCCustoAlt) then begin
         MsgDlg('Nenhuma Parametrização Definida o Alterador de MULTA','Aviso',mtWarning,[mbOk],0);
         Abort;
      end;

      // Define o Historico contábil para Multa
      ParamContabeis.sHistoricoCtb := 'MULTA do Contrato ' + Diverge.sNumContrato +
                                      ' - ' + Diverge.sComprador;

      if CtrlLancamento.InsereLancaContab ('2',
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           Sistema.idUsuario,
                                           IntegraBack.Plano,
                                           ParamContabeis.iUnidNegoc,
                                           iSubContaDebito,
                                           iSubContaCredito,
                                           IntegraBack.PlanoPrevGlobal,
                                           IntegraBack.PatroGlobal,
                                           ParamContabeis.iPlanilha, 0,
                                           DateToStr(Date),
                                           FormatFloat('#0', iCodDoc),
                                           ParamContabeis.sHistoricoCtb, '', '', '', '',
                                           '03',
                                           ParamContabeis.sCentroCustoDebito, ParamContabeis.sContaContabilDebito,
                                           sCCustoAlt,
                                           sContaAlt, '',
                                           Diverge.iVlrMulta, False,
                                           Sistema.UsaPlanoPatro,
                                           ParamContabeis.iIdSegregaCriter) then
      begin

         if CtrlLancamento.RetornoPlnCodigo > 0 then
             ParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      end;

      iPlnCodigo := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));


   end;

   // Executa Lançamento de Juros
   if Diverge.iVlrJuros > 0 then begin

      // Busca conta Contabil do Alterador para Juros
      if not BuscaAlterador(iAltJuros,sContaAlt,sSubContaAlt,sCCustoAlt) then begin
         MsgDlg('Nenhuma Parametrização Definida o Alterador de JUROS','Aviso',mtWarning,[mbOk],0);
         Abort;
      end;

      // Define o Historico contábil para Juros
      ParamContabeis.sHistoricoCtb := 'JUROS do Contrato ' + Diverge.sNumContrato +
                                      ' - ' + Diverge.sComprador;

      if CtrlLancamento.InsereLancaContab ('2',
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           Sistema.idUsuario,
                                           IntegraBack.Plano,
                                           ParamContabeis.iUnidNegoc,
                                           iSubContaDebito,
                                           iSubContaCredito,
                                           IntegraBack.PlanoPrevGlobal,
                                           IntegraBack.PatroGlobal,
                                           ParamContabeis.iPlanilha, 0,
                                           DateToStr(Date),
                                           FormatFloat('#0', iCodDoc),
                                           ParamContabeis.sHistoricoCtb, '', '', '', '',
                                           '03',
                                           ParamContabeis.sCentroCustoDebito, ParamContabeis.sContaContabilDebito,
                                           sCCustoAlt,
                                           sContaAlt, '',
                                           Diverge.iVlrJuros, False,
                                           Sistema.UsaPlanoPatro,
                                           ParamContabeis.iIdSegregaCriter) then
      begin

         if CtrlLancamento.RetornoPlnCodigo > 0 then
             ParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      end;

      iPlnCodigo := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));

   end;

   // Executa Lançamento de Correção
   if Diverge.iVlrCorrecao > 0 then begin

      // Busca conta Contabil do Alterador para Correção
      if not BuscaAlterador(iAltCorr,sContaAlt,sSubContaAlt,sCCustoAlt) then begin
         MsgDlg('Nenhuma Parametrização Definida o Alterador de CORREÇÃO','Aviso',mtWarning,[mbOk],0);
         Abort;
      end;

      // Define o Historico contábil para Correção
      ParamContabeis.sHistoricoCtb := 'CORREÇÃO MONETÁRIA do Contrato ' + Diverge.sNumContrato +
                                      ' - ' + Diverge.sComprador;

      if CtrlLancamento.InsereLancaContab ('2',
                                           Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           Sistema.idUsuario,
                                           IntegraBack.Plano,
                                           ParamContabeis.iUnidNegoc,
                                           iSubContaDebito,
                                           iSubContaCredito,
                                           IntegraBack.PlanoPrevGlobal,
                                           IntegraBack.PatroGlobal,
                                           ParamContabeis.iPlanilha, 0,
                                           DateToStr(Date),
                                           FormatFloat('#0', iCodDoc),
                                           ParamContabeis.sHistoricoCtb, '', '', '', '',
                                           '03',
                                           ParamContabeis.sCentroCustoDebito, ParamContabeis.sContaContabilDebito,
                                           sCCustoAlt,
                                           sContaAlt, '',
                                           Diverge.iVlrCorrecao, False,
                                           Sistema.UsaPlanoPatro,
                                           ParamContabeis.iIdSegregaCriter) then
      begin

         if CtrlLancamento.RetornoPlnCodigo > 0 then
             ParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      end;

      iPlnCodigo := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));

   end;
   Result := iPlnCodigo;
end;



function TfrmCadDiverge.BuscaAlterador(const iCodAlt: Integer; var sConta,
                                       sSubConta, sCCusto: String): Boolean;
var sSql : String;
begin
   Result := True;
   sSql := 'SELECT PLACONTA, CODSUBCONTA, CODCENTROCUSTO ' +
           '  FROM TIPOALTERADOR ' +
           ' WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +
           '   AND CODALTERADOR = ' + IntToStr(iCodAlt);

   if not FazQuery(dtmFinanciamento.qryAux, sSql) then begin
      Result := False;
   end else begin
      with dtmFinanciamento.qryAux do begin
         if RecordCount <> 1 then begin
            Result := False;
         end else begin
            sConta    := FieldByName('PLACONTA').AsString;
            sSubConta := FieldByName('CODSUBCONTA').AsString;
            sCCusto   := FieldByName('CODCENTROCUSTO').AsString;
         end;
      end;
   end;
end;


procedure TfrmCadDiverge.ProcessaMensagem(iDocumento: Int64);
var vMensagem : array[0..8] of string;
    i : Integer;
begin
   for i := 0 to 8 do vMensagem[i] := TEdit(FindComponent('edtln'+inttostr(i+1))).Text;
   FuncAlienacao.InsereMsgBoleto(iDocumento, vMensagem);
end;

function TfrmCadDiverge.GravaIntegra(iCodDocumento:Int64; iPlnCodigo:Integer): Boolean;
var sSql, sDataLancto : String;
    fVlrSaldoDoc, fVlrSaldoDocOM : Real;
    iNumLancto : Int64;

begin
   Result := True;
   sDataLancto := FormatDateTime('DD/MM/YYYY',edDataVencto.Date);

   // grava o registro da parcela de divergência
   with dtmFinanciamento do begin
      qryParc.insert;
      qryParcIDPARCFINANCIMOV.AsFloat   := LeUltRegistro(nil,'PARCFINANCIMOV');
      qryParcIDCONDPAGIMOVEL.AsFloat    := Diverge.iCondPag;
      if iCodDocumento > 0 then
           qryParcCODDOCUMENTO.AsFloat  := iCodDocumento
      else qryParcCODDOCUMENTO.Clear;
      if iPlnCodigo > 0 then
           qryParcPLNCODIGO.AsFloat     := iPlnCodigo
      else qryParcPLNCODIGO.Clear;
      qryParcVLRPRESTACAO.AsFloat       := edVlrTotal.Value;
      qryParcDATAVENCIMENTO.AsDateTime  := edDataVencto.DateTime;
      qryParcDATALANCINTEGRA.AsDateTime := edDataVencto.DateTime;
      qryParcNUMPARCELA.AsInteger       := 0;
      qryParcFLGTIPOLANC.AsInteger      := 6;
      qryParcFLGLANCINTEGRA.AsInteger   := 2;
      qryParc.Post;
      qryParc.ApplyUpdates;
      qryParc.CommitUpdates;
   end;

   // Grava o motivo de conciliação para parcelas
   with Diverge.qryDiverge do begin
      DisableControls;
      First;
      while not eof do begin
         if FieldByName('CHKBOLETO').AsInteger = 1 then begin
            try
               iNumLancto := 0;
               // Se o documento foi integrado, baixa o mesmo antes de ter o saldo transferido
               // para o novo documento
               if not Diverge.qryDiverge.FieldByName('CODDOCUMENTO').IsNull then begin

                  // Exclui os alteradores anteriores existentes no documento
                  if ( (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) or
                       (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
                       (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) ) then
                     ExcluiAlterador(Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger);

                  CtrlDocumento.Saldo.CalculaSaldo(Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger);
                  fVlrSaldoDoc   := CtrlDocumento.Saldo.Valor;
                  fVlrSaldoDocOM := CtrlDocumento.Saldo.ValorOM;


                  // Pago a menor (Parcial), Gera o Lançamento de baixa do tipo 5 baixando
                  // o documento total que terá o saldo transferido para o novo documento.
                  if fVlrSaldoDoc > 0 then begin
                     CtrlDocumento.OpenTransaction := False;
                     //CtrlDocumento.Prepare( OpLanctoDocum, odlBaixa );
                     CtrlDocumento.Prepare( OpLanctoDocumImob, odlBaixaImob );
                     CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
                     CtrlDocumento.CodDocumento  := Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger;
                     CtrlDocumento.IdUsuario     := Sistema.idUsuario;
                     CtrlDocumento.IdEspAcesso   := Sistema.idEspAcesso;
                     CtrlDocumento.IdModulo      := Sistema.idModulo;

                     CtrlDocumento.Lanctodocum.SetValues(StrToDate(sDataLancto),
                                                         Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger, 0,
                                                         fVlrSaldoDoc,
                                                         0,
                                                         fVlrSaldoDoc,
                                                         ParamContabeis.iUnidNegoc,
                                                         iPlnCodigo,
                                                         0,
                                                         Sistema.idUsuario,
                                                         Sistema.idEmpresa, 0,0,
                                                         iCodTipoDoc,0,0,
                                                         '5', '','','',
                                                         'Geração de nova cobrança pelo Doc. ' + IntToStr(iCodDocumento),
                                                         '','','','C',
                                                         Sistema.idModulo,
                                                         IntegraBack.Plano,
                                                         Sistema.UsaPlanoPatro, False, -1);

                     if not CtrlDocumento.Insert then
                        Result := False;
                  end;

                  // Pago a maior, Ajusta os alteradores no documento original,
                  // na sequencia: multa, juros, correção
                  if ( (ModuloImobiliario.Alienacao.iTipoOperAtualMulta <= 0) or
                       (ModuloImobiliario.Alienacao.iTipoOperAtualJuros <= 0) or
                       (ModuloImobiliario.Alienacao.iTipoOperAtualCM <= 0) ) then begin
                     if fVlrSaldoDoc < 0 then begin
                        LancaAlterador(fVlrSaldoDoc * -1);
                     end;
                  end;

                  // Verifica baixa e Marca Liquidado no Documento

//------------ VER COM VINICIUS 07/03/2006
//                  Documento.baixa_documento(dtmFinanciamento.qryAux, Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger);

               end;

               // Atualiza o Flag de conciliado na parcela
               sSql := 'UPDATE PARCFINANCIMOV ' +
                       '   SET FLGCONCILIADO = ' + QuotedStr('C') +
                       ' WHERE IDPARCFINANCIMOV = ' + IntToStr(Diverge.qryDiverge.FieldByName('IDPARCFINANCIMOV').AsInteger);
               ExecutarQuery(dtmFinanciamento.qryAux,sSql);

               // Apaga o motivo anterior para limpar sujeiras ( caso o documento original tenha mudado no CAR )
               CalcDocumento.ApagarMotivoConciliacao(-1, Diverge.qryDiverge.FieldByName('IDPARCFINANCIMOV').AsInteger, 'A');
// Marchetti - Pendencia 21692
               CalcDocumento.GravarMotivoConciliacao(Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger,
                                                     Diverge.qryDiverge.FieldByName('IDPARCFINANCIMOV').AsInteger,
                                                     Sistema.IdUsuario, iCodDocumento, iNumLancto,
                                                     Diverge.qryDiverge.FieldByName('DIASDIF').AsFloat,
                                                     Diverge.qryDiverge.FieldByName('VLRCORRIG').AsFloat,
                                                     'Geração de Cobrança Doc. ' + IntToStr(iCodDocumento),
                                                     'A', edtDataConcilia.DateTime);
// Fim Marchetti - Pendencia 21692
            except
               Result := False;
            end;
         end;
         Next;
      end;
      First;
      EnableControls;
   end;
end;


procedure TfrmCadDiverge.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmFinanciamento.qryParc.Close;
end;

function TfrmCadDiverge.ExcluiAlterador(const iCodDocumento: Integer): Boolean;
var iAltMulta,iAltJuros,iAltCorr: Integer;
    sAltMulta,sAltJuros,sAltCorr: String;
begin
   Result := True;
   try
      // Busca os Alteradores por Tipo de Imóvel
      if not FuncAlienacao.BuscaAlteradores(Diverge.qryDiverge.FieldByName('IDCONTRATOIMOVEL').AsInteger,-1,
                                            iAltMulta,iAltJuros,iAltCorr,
                                            sAltMulta,sAltJuros,sAltCorr) then begin
         raise Exception.Create('Nenhuma Parametrização Definida para o Tipo de Imóvel');
      end;

      LimpaParametros(qryAlteradoresLanc);
      qryAlteradoresLanc.ParamByName('PCODDOCUMENTO').AsInteger := iCodDocumento;
      qryAlteradoresLanc.Open;
      // Exclui apenas os alteradores de Multa, Juros e Correção
      while not qryAlteradoresLanc.Eof do begin
         if qryAlteradoresLancCODALTERADOR.AsInteger in[iAltMulta, iAltJuros, iAltCorr] then begin
            // Some com o LancToDocum e desfaz a contabilização se houver
            //CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
            CtrlDocumento.Prepare( OpLanctoDocumImob, odlBaixaImob );
            CtrlDocumento.OpenTransaction       := False;
            CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
            CtrlDocumento.CodDocumento          := qryAlteradoresLancCODDOCUMENTO.asInteger;
            CtrlDocumento.Lanctodocum.NumLancto := qryAlteradoresLancNUMLANCTO.asInteger;
            CtrlDocumento.Delete;

            CtrlLancamento.OpenTransaction := False;
            CtrlLancamento.ExcluiLancaContab( Sistema.idUsuario,
                                              qryAlteradoresLancPLNCODIGO.asInteger,
                                              Sistema.idModulo, 0,
                                              Sistema.UsaPlanoPatro, True);
         end;
         qryAlteradoresLanc.Next;
      end;
   except
      Result := False;
   end;
end;

function TfrmCadDiverge.LancaAlterador(const fSaldoDoc: Extended): Boolean;
var fVlrAlt, fSaldo : Extended;
    sDataLancamento: string;
    iDocumento, iNumLancto, iPlanilha: integer;
    iAltMulta,iAltJuros,iAltCorr: Integer;
    sAltMulta,sAltJuros,sAltCorr: String;
begin
   Result := True;
   try
      // Busca os Alteradores por Tipo de Imóvel
      if not FuncAlienacao.BuscaAlteradores(Diverge.qryDiverge.FieldByName('IDCONTRATOIMOVEL').AsInteger,-1,
                                            iAltMulta,iAltJuros,iAltCorr,
                                            sAltMulta,sAltJuros,sAltCorr) then begin
         raise Exception.Create('Nenhuma Parametrização Definida para o Tipo de Imóvel');
      end;

      fSaldo          := fSaldoDoc;
      sDataLancamento := DateToStr(edDataVencto.DateTime);
      iDocumento      := Diverge.qryDiverge.FieldByName('CODDOCUMENTO').AsInteger;

      // Calcula o Valor da Multa
      if fSaldo > 0 then begin
         fVlrAlt := 0;
         fVlrAlt := Diverge.qryDiverge.FieldByName('VLRMULTAATRASO').AsFloat;
         if fVlrAlt > fSaldo then fVlrAlt := fSaldo;
         fSaldo := fSaldo - fVlrAlt;

         // Lança o Alterador de Multa
         if fVlrAlt > 0 then begin
            iPlanilha  := 0;
            //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.Prepare( OpLanctoDocumImob, odlBaixaImob );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                                 iDocumento,
                                                 0,
                                                 fVlrAlt,
                                                 0,
                                                 fVlrAlt,
                                                 0,
                                                 iPlanilha, 0,
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
                                                 True);
            CtrlDocumento.Insert;

         end;
      end;

      // Calcula o Valor do Juros
      if fSaldo > 0 then begin
         fVlrAlt := 0;
         fVlrAlt := Diverge.qryDiverge.FieldByName('VLRMORAATRASO').AsFloat;
         if fVlrAlt > fSaldo then fVlrAlt := fSaldo;
         fSaldo := fSaldo - fVlrAlt;

         // Lança o Alterador de Juros
         if fVlrAlt > 0 then begin
            iPlanilha  := 0;

            //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                                 iDocumento,
                                                 0,
                                                 fVlrAlt,
                                                 0,
                                                 fVlrAlt,
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
                                                 True);
            CtrlDocumento.Insert;

         end;
      end;

      // Calcula o Valor da Correção Monetária
      if fSaldo > 0 then begin
         fVlrAlt := 0;
         fVlrAlt := Diverge.qryDiverge.FieldByName('VLRCMATRASO').AsFloat;
         if fVlrAlt > fSaldo then fVlrAlt := fSaldo;
         fSaldo := fSaldo - fVlrAlt;

         // Lança o Alterador de Correção Monetária
         if fVlrAlt > 0 then begin
            iPlanilha  := 0;

            //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( StrToDate(sDataLancamento),
                                                 iDocumento,
                                                 0,
                                                 fVlrAlt,
                                                 0,
                                                 fVlrAlt,
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
                                                 True);
            CtrlDocumento.Insert;

         end;
      end;
   except
      on e:exception do begin
         Result := False;
         MsgDlg(e.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;

procedure TfrmCadDiverge.FormCreate(Sender: TObject);
begin
  inherited;
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.InitializeAs(Padroes);

  //CtrlDocumento      := TCtrlDocumento.Create;
  //CtrlLancamento     := TCtrlLancamento.Create;
  CtrlDocumento      := TCtrlImobDocumento.Create;
  CtrlLancamento     := TCtrlImobLancamento.Create;
  CtrlPadrLancImovel := TCtrlPadrLancImovel.Create(Sistema.IDEmpresa, Sistema.IDModulo);
  CtrlOperImob       := TCtrlOperImob.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal, Sistema.UsaPlanoPatro );

  CtrlDocumento.InitializeAs(Padroes);
  CtrlLancamento.InitializeAs(Padroes);
  CtrlPadrLancImovel.InitializeAs(Padroes);
  CtrlOperImob.InitializeAs(Padroes);

   edtDataConcilia.ReadOnly := False;
   edtDataConcilia.Enabled  := True;
   edtDataConcilia.Date     := Date;
   if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta +
       ModuloImobiliario.Alienacao.iTipoOperAtualJuros +
       ModuloImobiliario.Alienacao.iTipoOperAtualCM) > 0 then
   begin
      edtDataConcilia.Date := CtrlOperImob.UltimoFechamento; // Daniel - 22056
      edtDataConcilia.ReadOnly := True;
      edtDataConcilia.Enabled  := False;
   end;
end;



procedure TfrmCadDiverge.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ComunsImobiliarioDB);
  FreeAndNil(CtrlDocumento);
  FreeAndNil(CtrlLancamento);
  FreeAndNil(CtrlPadrLancImovel);
  FreeAndNil(CtrlOperImob);
  inherited;
end;

end.
