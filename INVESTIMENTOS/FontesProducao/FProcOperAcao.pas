//******************************************************************************
// Rotina     : bbtnConfirmarClick
// SOL        : 122157
// Kintana    : 595758
// Data       : 21/07/2009
// Responsável: William M. Santos
// Descrição  : Foi implementado ajuste para que não truncasse e nem tirasse 0,0049 dos
//              investimentos provionados para perda.
//******************************************************************************
// Data      : 20/09/2007
// Código    : AL_17
// Pendencia : 26386
// SOL       :
// Motivo    : Ajuste na mensagem de "No User Transaction in Process"
//******************************************************************************
// Data      : 19/09/2006
// Código    : AL_16
// Pendencia : 26389
// SOL       :
// Desc      : Implementacao de Depuracao do Regra Passo a Passo
//******************************************************************************
// Data      : 26/12/2006
// Código    : AL_15
// Pendencia : 24046
// SOL       :
// Desc      : Acerto na truncagem de valores
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_14
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 26/07/2006
// Código    : AL_13
// Pendencia : 22960
// SOL       :
// Desc      : Implementação da Segregação por Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_12
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_10
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_8
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento
//******************************************************************************
//Data	    : 23/05/2005
//Código    : Al_7
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
//Data	    : 23/03/2005
//Código    : Al_6
//Motivo(S) : Implementada na rotina a função ExcluiBoleta e a função de rollback
//******************************************************************************
//Data	    : 22/03/2005
//Código    : Al_5
//Motivo(S) : Passa a não atualizar os saldos após incluir registro de Lucro. Deixa
//            para ser feito na FFechaBoleta
//******************************************************************************
//Data	     : 02/03/2005
//Código    : Al_4
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//******************************************************************************
//Data      : 23/12/2004
//Código    : AL_3
//Motivo    : Delimita para excluir apenas trinta dias antes do ultimo fechamento
//*******************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Data	    :17/05/2004
// Função   :Botão OK
// LINHA(S) :351
// Motivo(S): Exibe o Nome da Corretora na Mensagem de Investimento não cadastrado
//            Incluido o Nome da corretora na query qryBuscaOrdem
//******************************************************************************
unit FProcOperAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, UOperacaoInvest,
  UOperComum, dOperComum, MontaSelect, URegra, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, uCtrlInvContab, uCtrlRendaVariavel, uCtrlPadroes,
  FOkCancelarInv, faMensagem, fcLabel;

type
  TFrmProcOperAcao = class(TfrmOkCancelarInv)
    Label2: TLabel;
    qryBuscaOperacoes: TwwQuery;
    QryBuscaBoletas: TwwQuery;
    QryBuscaBoletasNUMDOCUMENTO: TStringField;
    QryBuscaBoletasDATAOPERACAO: TDateTimeField;
    Regra: TRegra;
    QryBuscaTipoOper: TwwQuery;
    qryBuscaOperacoesIDOPERACAOINVEST: TFloatField;
    qryBuscaOperacoesIDCUSTODIANTE: TFloatField;
    qryBuscaOperacoesIDCORRETVALORES: TFloatField;
    qryBuscaOperacoesMOECODIGO: TFloatField;
    qryBuscaOperacoesIDMODULO: TFloatField;
    qryBuscaOperacoesEMPRESAPROP: TFloatField;
    qryBuscaOperacoesIDINVESTDEST: TFloatField;
    qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperacoesIDINVESTIMENTO: TFloatField;
    qryBuscaOperacoesIDTIPOINVEST: TFloatField;
    qryBuscaOperacoesIDTIPOOPERACAO: TFloatField;
    qryBuscaOperacoesIDINSTFIN: TFloatField;
    qryBuscaOperacoesDATAOPERACAO: TDateTimeField;
    qryBuscaOperacoesNUMDOCUMENTO: TStringField;
    qryBuscaOperacoesQTDEOPERACAO: TFloatField;
    qryBuscaOperacoesPRECOUNITOPERACAO: TFloatField;
    qryBuscaOperacoesVLROPERACAO: TFloatField;
    qryBuscaOperacoesDATAVENCOPER: TDateTimeField;
    qryBuscaOperacoesVLROPERACAOOM: TFloatField;
    qryBuscaOperacoesIDFORCLI: TFloatField;
    qryBuscaOperacoesIDCARTORIDEST: TFloatField;
    qryBuscaOperacoesIDLOTE: TStringField;
    qryBuscaOperacoesINVORIGEM: TFloatField;
    qryBuscaOperacoesIDCUSTORIG: TFloatField;
    qryBuscaOperacoesIDCUSTDEST: TFloatField;
    qryBuscaOperacoesFLGSTATUSFECHBOL: TStringField;
    qryBuscaOperacoesFLGSTATUSORDMOV: TStringField;
    qryBuscaOperacoesIDTERCEIRO: TFloatField;
    qryBuscaOperacoesDATALIQOPER: TDateTimeField;
    qryBuscaOperacoesVLRIR: TFloatField;
    qryBuscaOperacoesIDEMISSOR: TFloatField;
    QryAux: TwwQuery;
    UpdBuscaOperacoes: TUpdateSQL;
    qryBuscaOperacoesDESCINVESTIMENTO: TStringField;
    QryRegra: TwwQuery;
    QryDespesasOperacao: TwwQuery;
    QryBoleta: TwwQuery;
    QryBoletaIDBOLETA: TStringField;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoEMPRESAPROP: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoFLGCALCDIARIO: TFloatField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    qryBuscaOperacoesFLGCARTPROP: TFloatField;
    qryBuscaOperacoesIDBOLSAVALORES: TFloatField;
    qryBuscaOperacoesSGLBOLSAVALORES: TStringField;
    qryBuscaOperacoesQTDELOTE: TFloatField;
    updBuscaOrdem: TUpdateSQL;
    QryVerOrdAutorizadas: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TProgressBar;
    QryBuscaOrdem: TwwQuery;
    QryBuscaOrdemIDCORRETVALORES: TFloatField;
    QryBuscaOrdemIDINVESTIMENTO: TFloatField;
    QryBuscaOrdemPUORDMOVINV: TFloatField;
    QryBuscaOrdemQTDEORDMOVINV: TFloatField;
    QryBuscaOrdemQTDEORDENADA: TFloatField;
    QryBuscaOrdemNUMDOCMOVINV: TStringField;
    QryBuscaOrdemSTATMOVINV: TStringField;
    QryBuscaOrdemIDTIPOINVEST: TFloatField;
    QryBuscaOrdemIDTIPOOPERACAO: TFloatField;
    QryBuscaOrdemIDCARTEIRAINVEST: TFloatField;
    QryBuscaOrdemIDLOTE: TStringField;
    QryBuscaOrdemIDBOLSAVALORES: TFloatField;
    QryBuscaOrdemIDCUSTODIANTE: TFloatField;
    QryBuscaOrdemDESCINVESTIMENTO: TStringField;
    QryUpdOrdmovinv: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField3: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField4: TStringField;
    QryBuscaCarteira: TwwQuery;
    QryBuscaTipoOperIDTIPOINVEST: TFloatField;
    QryBuscaTipoOperIDTIPOOPERACAO: TFloatField;
    QryBuscaTipoOperIDMERCADO: TFloatField;
    QryBuscaTipoOperDESCTIPOOPERACAO: TStringField;
    QryBuscaTipoOperTIPOCUSTODIA: TStringField;
    QryBuscaTipoOperVENCIMENTO: TFloatField;
    QryBuscaTipoOperTIPCREDOR: TStringField;
    QryBuscaTipoOperNATUREZAOPERACAO: TStringField;
    QryBuscaTipoOperFLGTRANSF: TStringField;
    QryBuscaTipoOperFLGCORRET: TStringField;
    QryBuscaTipoOperFLGORDMOVINV: TStringField;
    QryBuscaTipoOperFLGTRATAIR: TStringField;
    QryBuscaTipoOperRECPAG: TStringField;
    Panel3: TPanel;
    DkBtCancelaRubrica: TPanel;
    BtCancelaRubrica: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    QryInsOperacaoInvest: TwwQuery;
    QryBuscaOrdemIDCARTEIRAGERENC: TFloatField;
    qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField;
    QryVerOrdEspecificadas: TwwQuery;
    QryBuscaOrdemIDPLANPREVCTBPATR: TFloatField;
    qryVerOrdensPendentes: TwwQuery;
    qryVerOrdensPendentesIDBOLETA: TStringField;
    qryVerOrdensPendentesSTATUS: TStringField;
    QryBuscaCartTerc: TwwQuery;
    qryAuxiliar: TwwQuery;
    QryBuscaOrdemSGLBOLSAVALORES: TStringField;
    QryBuscaTipoOperFLGCONTAINVEST: TFloatField;
    Panel6: TPanel;
    edDataRef: TCMDateTimePicker;
    Label1: TLabel;
    qryBuscaOperacoesIDPLANPREVCTBPATR: TFloatField;
    cbxPassoPasso: TCheckBox;
    function  DivValorZero(Valor1, Valor2: Extended): Extended;
    function  VerificaOrdensAutorizadas : Boolean;
    function  VerificaOrdensEspecificadas : Boolean;

    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure cbxPassoPassoClick(Sender: TObject);
  private
    { Private declarations }

    //AL_13
    CtrlRendaVariavel: TCtrlRendaVariavel;

    //AL_6
    function  VerificaOrdensPendentes(sBoleta : String) : Boolean;
    function  BuscaForCliLocal(iTipoOper, iCorretValores, iEmissor: Integer;
                               sTipoCredor: String = 'N') : Integer;
  public
    { Public declarations }
    wPlano, wPlanilha, wDocumento  : integer;
  end;

var
  FrmProcOperAcao: TFrmProcOperAcao;
  wQtdCotaIni, wMoeda,iIdHistCartInv    : Integer;
  wValorRegra : Double;
  fVlrRendimento : Double;
  //AL_16
  bPassoPasso : boolean;

implementation

{$R *.DFM}

Uses UDataBase, UBibliotecaInvest, DBaseDados, UMensErro, UDiasUteisInv,
     USistema, UImpostos, UDocumento,FPrincipal, UCotaComum, UProvisaoComum,
     UOpcoes, dOpcoes, URendaVariavel;

procedure TFrmProcOperAcao.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := pRPI.DATAMOVTORV;
  CtrlRendaVariavel := TCtrlRendaVariavel.Create;
  CtrlRendaVariavel.InitializeAs(Padroes)
end;

procedure TFrmProcOperAcao.bbtnConfirmarClick(Sender: TObject);
var
   wIdCarteiraXEvento, wIdNovaOperacao, wIdForCli, wIdOperCust,I : Integer;
   QryLocalAux, QryInterna:TwwQuery;
   wSQL:String;
   wDec:Char;
   wSaldoAntVlr, wSaldoAntQtd, wSaldoVlr, wVlrTotCorretor, wVlrTotBolsa,
   wSaldoInutil, wVlrOperacao, wSaldoQtd, wSaldoAqui, wSaldoIRApu, wVlrIRProv, wVlrIR, wVlrHistCartInv  :Double;
   wSaldoQtdCustod,fVlrATransf, fSaldoQtdCPMF : Double;
   wDtMov, wDataVenc  : TDateTime;
   sFlgCustodia       : string;
   iIdHistCartInvDest : Integer;
   wSaldoQtd3C: Double;
begin
   wIdForCli := 0;

   // AL_8
   if RendaVariavel.VerEmAbertura then
      Exit;

   If (trim(edDataRef.Text) = '') Then
   Begin
      //AL_13
      MsgDlg('Preencha a Data de Referência.','Mensagem do Sistema',mtWarning,[mbOK],0);
      edDataRef.SetFocus;
      Exit;
   End;

   // AL_7
   //AL_12
   if not CtrlInvContab.TestaPeriodo(edDataRef.Text, iTipoInvestUsu) then
   begin
      //AL_13
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      edDataRef.SetFocus;
      Exit;
   end;

   If Not VerificaOrdensEspecificadas Then
      Exit;

   QryBuscaCartTerc.Close;
   QryBuscaCartTerc.ParamByName('STRDATA').AsString               := edDataRef.Text;
   if pRPI.FLGPLANPREVCTBPAT = 'S' then
      QryBuscaCartTerc.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro
   else
      QryBuscaCartTerc.ParamByName('IDPLANPREVCTBPATR').Clear;
   QryBuscaCartTerc.Open;

   If QryBuscaCartTerc.IsEmpty Then
   begin
      If Not OperComum.VerificaFechamento(edDataRef.Date) Then //Verifica se o dia anterior teve fechamento diário
         Exit;
   end;

   If Not VerificaOrdensAutorizadas Then
      Exit;

   inherited;

   try // Finally
      try

         // Cria Objetos Locais
         QryLocalAux:= TwwQuery.Create(Self);
         QryLocalAux.DatabaseName:='BaseDados';
         QryInterna := TwwQuery.Create(Self);
         QryInterna.DatabaseName :='BaseDados';

         // Testa se existem Ordens autorizadas para gerar Operação
         with qryBuscaOrdem do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('STRDATA').AsString               := edDataRef.Text;
            Open;
         end;

         Label1.Caption := 'Processando Ordens - Aguarde ...';
         Label1.Visible := True;
         Label1.Repaint;

         if not qryBuscaOrdem.isEmpty then
         begin
            ProgressBar1.Min  := 0;
            ProgressBar1.Max  := qryBuscaOrdem.RecordCount;
            ProgressBar1.Step := 1;

            // Inicia Transação
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            While Not qryBuscaOrdem.EOF Do
            Begin
               If qryBuscaOrdem.FieldByName('STATMOVINV').AsString = 'L' Then
               begin
                  qryBuscaOrdem.Next;
                  Continue;
               end;
               If (Trim(Panel3.Caption) <>
                   Trim(qryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString)) Then
               Begin
                  Panel3.Caption := 'Boleta : '+qryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString+' - Operação';
                  Panel3.Repaint;
               End;

               If (Trim(Panel4.Caption) <>
                  Trim(qryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString)) Then
               Begin
                  Panel4.Caption := 'Investimento : '+qryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString;
                  Panel4.Repaint;
               End;

               ProgressBar1.Stepit;

               //AL_6
               if not VerificaOrdensPendentes(qryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString) then
                  Raise Exception.Create('Não foi possível excluir a boleta ' + qryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString);

               with QryBuscaTipoOper do
               begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('TIPOOPERACAO').asInteger := QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger;
                  Open;
               end;

               // Dados do Investimento
               If Not FazQuery(QryLocalAux,
                  ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
                  '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AXB.QTDELOTE '+
                  ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
                  ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsString)+') AND '+
                  '       (AXB.IDBOLSAVALORES = '+QuotedStr(QryBuscaOrdem.FieldByName('IDBOLSAVALORES').AsString)+') AND '+
                  '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
                  '       (INV.IDINVESTIMENTO = AXB.IDACAO) ') Then
                  Raise Exception.Create('Investimento não Cadastrado na Bolsa ');

               // Testa Saldo na Custodia Caso Baixe o Investimento
               If (QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
                  (QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'X') Then
               Begin
                  // Busca Saldos na Carteira
                  wSaldoQtdCustod:=0;
                  // BuscaSaldos em 3 camadas
                  CtrlRendaVariavel.BuscaSaldoRV.Executa(edDataRef.DateTime,
                                                         QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                         QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                         9999999,
                                                         QryBuscaOrdem.FieldByName('IDCUSTODIANTE').AsInteger,
                                                         QryBuscaOrdem.FieldByName('IDLOTE').AsString);

                  // Novo para testar e comparar com o antigo
                  if QryBuscaTipoOper.FieldByName('FLGCONTAINVEST').AsInteger = 1 then
                     wSaldoQtd := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCCI
                  else
                     wSaldoQtd := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdCC;

                  wSaldoVlr := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
                  wSaldoAqui := CtrlRendaVariavel.BuscaSaldoRV.SaldoCusto;
                  wSaldoQtdCustod := CtrlRendaVariavel.BuscaSaldoRV.SldQtdLibCustodia;

                  // Testa Saldo
                  if (QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat > wSaldoQtd) then
                     Raise Exception.Create('O Saldo da CARTEIRA é insuficiente para essa Operação.');

                  // Testa Saldos na Custódia
                  if QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat > CtrlRendaVariavel.BuscaSaldoRV.SldQtdLibCustodia then
                    Raise Exception.Create('O Saldo na CUSTÓDIA é insuficiente para essa Operação.');
               End;

               // Gera Novo Id de Operacao
               wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

               // Verifica o Fornecedor
               If QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CO' Then
                  wIdForCli := QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger
               Else
                  wIdForCli := QryLocalAux.FieldByName('IDEMISSOR').AsInteger;

               // Inicia outros Dados
               wVlrOperacao := DivValorZero(QryBuscaOrdem.FieldByName('QTDEORDENADA').AsFloat,
                                            QryLocalAux.FieldByName('QTDELOTE').AsInteger)*
                                            QryBuscaOrdem.FieldByName('PUORDMOVINV').AsFloat;


               //William M. Santos   KINTANA 595758 SOL 122157  21/07/2009  - INI

               if not (Copy(QryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString,1,1) = '*') then
               begin
               //AL_15
               // Somente trunca valores não inteiros
                 if (wVlrOperacao <> 0) and (Frac(wVlrOperacao) <> 0) then
                    //AL_14 - Grava valores com duas casas decimais
                    wVlrOperacao := OperComum.Trunca(wVlrOperacao - 0.0049, 2);
               end;
               
               //William M. Santos   KINTANA 595758 SOL 122157  21/07/2009  - FIM


               I:=1;
               wDataVenc:=StrToDate(edDataRef.Text);
               // VERIFICAR ESTE CALCULO
               While I<= QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
               Begin
                  wDataVenc := wDataVenc+1;
                  While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
                    wDataVenc := wDataVenc+1;   // Achar o próximo dia útil
                  I:=I+1;
               End;

               wVlrIR     := 0;
               wVlrIRProv := 0;

               If  (QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger <> 0) And
                   (QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'D') And
                   ((QryBuscaTipoOper.FieldByName('FLGTRATAIR').AsString ='G')  or    // F.Gerador -> Ganho Capital
                    (QryBuscaTipoOper.FieldByName('FLGTRATAIR').AsString ='V')) Then  // F.Gerador -> Valor da Operação
               Begin
                  fVlrRendimento := 0;
                  wVlrIR := Impostos.CalculaIr(2,QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger,
                                      0{CARTEIRAGERENC},
                                      QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      QryBuscaTipoOper.FieldByName('IDMERCADO').AsInteger,
                                      QryBuscaOrdem.FieldByName('IDLOTE').AsString,
                                      StrToDate(edDataRef.Text), StrToDate(edDataRef.Text),
                                     (QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat* DivValorZero(wSaldoAqui,wSaldoQtd)),
                                      wVlrOperacao, 0, 'S',
                                      QryBuscaTipoOper.FieldByName('FLGTRATAIR').AsString,
                                      fVlrRendimento);
                  // Verifica se existe provisionamento de IR
                  If Impostos.BuscaProvisaoIR(2,QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger) then
                     wVlrIRProv := (DivValorZero(wSaldoIRApu,wSaldoQtd)* QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat )* -1;
               End;

               // Muda o Separador Decimal
               wDec:=DecimalSeparator;
               DecimalSeparator :='.';

               // Inclui Dados na Tabela de Operacao, OPERACAOINVEST
               OperComum.LimpaParametros(QryInsOperacaoInvest);
               QryInsOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
               QryInsOperacaoInvest.ParamByName('IDCORRETVALORES').AsInteger  := QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger;
               QryInsOperacaoInvest.ParamByName('MOECODIGO').AsInteger        := QryLocalAux.FieldByName('MOECODIGO').AsInteger;
               QryInsOperacaoInvest.ParamByName('IDMODULO').AsInteger         := Sistema.IdModulo;
               QryInsOperacaoInvest.ParamByName('EMPRESAPROP').AsInteger      := Sistema.IdEmpresa;
               QryInsOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   := QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger;
               If QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger <> 0 Then
                  QryInsOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger;

               If QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
                  QryInsOperacaoInvest.ParamByName('IDCARTEIRAGERENC').AsInteger := QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger;

               QryInsOperacaoInvest.ParamByName('IDTIPOINVEST').AsInteger     := 2;
               QryInsOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger   := QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger;
               QryInsOperacaoInvest.ParamByName('DATAOPERACAO').AsDateTime    := edDataRef.Date;
               QryInsOperacaoInvest.ParamByName('NUMDOCUMENTO').AsString      := QryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString;
               QryInsOperacaoInvest.ParamByName('QTDEOPERACAO').AsFloat       := QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat;
               QryInsOperacaoInvest.ParamByName('PRECOUNITOPERACAO').AsFloat  := QryBuscaOrdem.FieldByName('PUORDMOVINV').AsFloat;
               QryInsOperacaoInvest.ParamByName('VLROPERACAO').AsFloat        := wVlrOperacao;
               QryInsOperacaoInvest.ParamByName('DATAVENCOPER').AsDateTime    := wDataVenc;
               QryInsOperacaoInvest.ParamByName('IDFORCLI').AsInteger         := wIdForCli;
               QryInsOperacaoInvest.ParamByName('IDLOTE').AsString            := QryBuscaOrdem.FieldByName('IDLOTE').AsString;
               QryInsOperacaoInvest.ParamByName('IDCUSTODIANTE').AsInteger    := QryBuscaOrdem.FieldByName('IDCUSTODIANTE').AsInteger;
               If QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger <> 0 Then
                  QryInsOperacaoInvest.ParamByName('IDPLANPREVCTBPATR').AsInteger:= QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               QryInsOperacaoInvest.ParamByName('VLRIR').AsFloat              := wVlrIR;
               QryInsOperacaoInvest.ParamByName('FLGSTATUSFECHBOL').AsString  := 'L';
               QryInsOperacaoInvest.ParamByName('FLGSTATUSORDMOV').AsString   := 'L';
               QryInsOperacaoInvest.ExecSQL;
               QryInsOperacaoInvest.Close;

               // Volta Decimal Separator
               DecimalSeparator :=wDec;

               // Inclui Dados na Tabela de SubTipo, OPRACAO
               ExecutaQuery(QryInterna,'INSERT INTO OPRACAO                                     '+
                                       '  (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR) '+
                                       'VALUES                                                  '+
                                       '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
                                           QuotedStr(QryBuscaOrdem.FieldByName('IDBOLSAVALORES').AsString)+', '+
                                           QuotedStr(QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsString)+', '+
                                           QuotedStr(QryLocalAux.FieldByName('IDEMISSOR').AsString)+')');
               QryBuscaCarteira.Close;
               QryBuscaCarteira.ParamByName('pIDCARTEIRAINVEST').AsInteger := QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger;
               QryBuscaCarteira.Open;

               // Grava o IR Litígio
               if (QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'D') And
                  (wVlrIR > 0) then
               begin
                  if not Impostos.GravaIrLitigio(2,StrToDate(edDataRef.Text), wIdNovaOperacao,
                                  QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                  QryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString+'/ '+
                                  QryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString,
                                  QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger,
                                  iPlanoPrevContab,
                                  iPatrocinadora,
                                  wVlrIR,
                                  fVlrRendimento) then
                  Abort;
               end;
               QryBuscaCarteira.Close;
               wVlrHistCartInv := 0;
               wVlrHistCartInv := wVlrOperacao;

               // Transferência Automática Para a Carteira de Opções
               // Quando a operação for Venda de Opções de Compra -> Testa se tem saldo
               if (QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger = pRPI.IDCARTOPC) and // Carteira de Opções e
                  (QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger = -75) then //  Venda de Opções de Compra
               begin
                  Opcoes.BuscaSaldosOpcoes(StrToDate(edDataRef.Text),
                                           QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger,
                                           pRPI.IDCARTOPC,
                                           QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           QryBuscaOrdem.FieldByName('IDLOTE').AsString);
                  if DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat > 0 then // A Posição está Comprada
                  begin
                     fVlrATransf := (QryBuscaOrdem.FieldByName('QTDEORDENADA').AsFloat -
                                     DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat);
                     if fVlrATransf > 0 then
                     begin
                        OperComum.LimpaParametros(dtmOperComum.qryInvestBase);
                        dtmOperComum.qryInvestBase.ParamByName('IDINVESTIMENTO').AsInteger := QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger;
                        dtmOperComum.qryInvestBase.Open;
                        //AL_12 - BuscaSaldos em 3 camadas
                        CtrlRendaVariavel.BuscaSaldoRV.Executa(edDataRef.DateTime,
                                                               QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                               dtmOperComum.qryInvestBase.FieldByName('IDINVESTBASE').AsInteger,
                                                               pRPI.IDCARTAVISTA, -1, 9999999,
                                                               QryBuscaOrdem.FieldByName('IDCUSTODIANTE').AsInteger);
                        wSaldoQtd  := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;

                        if not OperComum.TransfEntreCarteiras(
                           QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger,
                           pRPI.IDCARTAVISTA,
                           pRPI.IDCARTOPC,
                           dtmOperComum.qryInvestBase.FieldByName('IDINVESTBASE').AsInteger,
                           QryBuscaOrdem.FieldByName('IDCUSTODIANTE').AsInteger,
                           QryBuscaOrdem.FieldByName('IDCUSTODIANTE').AsInteger,
                           -1,pRPI.IDMOTBLOQOPC,1,3,
                           QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger,
                           wSaldoQtd,
                           ABS(fVlrATransf),
                           StrToDate(edDataRef.Text),
                           False,
                           '',
                           QryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString,
                           iIdHistCartInvDest) then
                           Raise Exception.Create('Não foi possível fazer a Transferência para'+#13+
                                                  'a Carteira de Opções.');

                        // Update com o Lote na Posição Transferida
                        With dtmOperComum.qryLocal Do
                        begin
                           Close;
                           Sql.Clear;
                           Sql.Add('UPDATE HISTCARTINV SET ');
                           Sql.Add('IDLOTE = '+ QuotedStr(QryBuscaOrdem.FieldByName('IDLOTE').AsString) +' ');
                           Sql.Add('WHERE (IDHISTCARTINV = ' + IntToStr(iIdHistCartInvDest) +')');
                           ExecSql;
                           Close;
                        end;
                        dtmOperComum.qryInvestBase.Close;
                     end;
                  end;
               end;

               // Inclusão de registro de Lucro incluido antes do registro do HistCartInv

               // Acerta Historico da Carteira
               If QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsString <> '' Then
               Begin
                  If QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
                  Begin
                     If OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                                   wIdNovaOperacao, -1,
                                                   QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                   QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                   -1, -1, -1, -1, -1,StrToDate(edDataRef.Text),0,
                                                   QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat,
                                                   wQtdCotaini, 0 {Juros}, 0,0, 0, 0, 0, 0, 0, 0,
                                                   'L' {Movimento},
                                                   QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Operacao},
                                                   '' {Lote},
                                                   'LUCRO/PREJUIZO NA VENDA'+' - '+
                                                     QryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString,
                                                   'LUC', '', '', True,
                                                   QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger,
                                                   QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                   iIdHistCartInv) Then
                     Begin
                        //AL_5 Ini
                     End
                     Else
                        Raise Exception.Create('Erro ao Alimentar Carteira, os dados desta operação serão perdidos');
                  End;
               end;

               if QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 then
                  sFlgCustodia := ''
               else
                  sFlgCustodia := '1';

               If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                                 QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 2, wIdNovaOperacao, -1,
                                                 QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                 QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 StrToDate(edDataRef.Text),
                                                 wVlrHistCartInv, QryBuscaOrdem.FieldByName('QTDEORDMOVINV').AsFloat,
                                                 wQtdCotaini, 0 {Variacao}, 0{Juros}, wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
                                                 QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                                 QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                                 QryBuscaOrdem.FieldByName('IDLOTE').AsString,
                                                 QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                                 QryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString,'OPE',
                                                 sFlgCustodia,
                                                 '', True,
                                                 QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger,
                                                 QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                 iIdHistCartInv) then
                  Raise Exception.Create('Erro ao Alimentar Carteira, os dados desta operação serão perdidos');

               if not OperComum.AtualizaSaldos(wQtdCotaini,-1) then
                  Raise Exception.Create('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                                         'esta Operação não poderá ser confirmada');

               // Atualizar Custodia
               if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString  <> 'N' then
                  wIdOperCust := wIdNovaOperacao
               else
                  wIdOperCust := -1;

               If QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
               Begin
                  if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
                     Raise Exception.Create('Não foi possível atualizar a Custodia, os dados desta operação serão perdidos. ');

                  If wIdOperCust <> -1 Then
                     ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                                          ' FlgCustodia         = NULL '+
                                          ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));
               End;

               if edDataRef.Date < pRPI.DATAULTFECH then
               begin
                  //AL_14
                  RendaVariavel.MarcarFlagReproc(QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger, -1,
                                                 QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger, edDataRef.Date);
                  //Exclui o histórico de cotas da carteira gerencial para ser reprocessada ...
                  // HistCota
                  wDtMov    := edDataRef.Date;
                  //AL_4
                  //AL_3
                  if wDtMov <= (pRPI.DATAULTFECH-60) then
                     wDtMov := (pRPI.DATAULTFECH-60)+1;
                  //AL_3 - Fim
                  //AL_4 - Fim
                  qryAuxiliar.Close;
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Text := 'DELETE FROM HISTCOTA WHERE ' +
                                          '(DATAHISTCOTA >= TO_DATE('''+
                                           DateToStr(wDtMov)+''',''DD/MM/YYYY'')) ';
                  qryAuxiliar.ExecSQL;
                  qryAuxiliar.Close;
               end;

               qryBuscaOrdem.Next;
            End;
         End
         Else
            Raise Exception.Create('Não há Operações para essa Data ou o Processo já foi executado.');

         // Update na tabela de ordem como operação lançada
         With QryUpdOrdmovinv do
         Begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('STRDATA').asString := edDataRef.Text;
            ExecSQL;
            Close;
         end;
         Panel3.Caption   := '';
         Panel3.Repaint;
         Panel4.Caption   := '';
         Panel4.Repaint;

         // Testa se existem Operações com Status de Boleta não Fechada no Período
         with qryBuscaBoletas do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('DATAREF').asDateTime := StrToDate(edDataRef.Text);
            Open;
         end;

         //AL_14
         Label1.Caption := 'Processando Boletas - Aguarde ...';
         Label1.Repaint;

         ProgressBar1.Min  := 0;
         ProgressBar1.Max  := 0;
         ProgressBar1.Step := 0;
         ProgressBar1.Stepit;

         if not qryBuscaBoletas.isEmpty then
         begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
            begin
               MsgDlg('Erro no Controle de Transações do Banco.','Mensagem do Sistema',mtWarning,[MbOk],0);
               dtmBaseDados.dbBaseDados.StartTransaction;
            end;

            While Not qryBuscaBoletas.EOF Do
            Begin
               If (Trim(Panel4.Caption) <>
                   Trim(qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString)) Then
               Begin
                  Panel3.Caption   := 'Boleta : '+qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString+' - Despesas';
                  Panel3.Repaint;
               End;
               with QryBuscaOperacoes do
               begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('BOLETA').asString := qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString;
                  Open;
               end;
               ProgressBar1.Min  := 0;
               ProgressBar1.Max  := QryBuscaOperacoes.RecordCount;
               ProgressBar1.Step := 1;

               While Not QryBuscaOperacoes.EOF Do
               Begin
                  If (Trim(Panel4.Caption) <>
                       Trim(QryBuscaOperacoes.FieldByName('DESCINVESTIMENTO').AsString)) Then
                  Begin
                     Panel4.Caption := 'Investimento : '+QryBuscaOperacoes.FieldByName('DESCINVESTIMENTO').AsString;
                     Panel4.Repaint;
                  End;
                  ProgressBar1.Stepit;
                  QryBuscaOperacoes.Edit;

                  //AL_12
                  wIdForCli := BuscaForCliLocal(QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                QryBuscaOperacoes.FieldByName('IDCORRETVALORES').AsInteger
                                                QryBuscaOperacoes.FieldByName('IDEMISSOR').AsInteger);
                  QryBuscaOperacoes.FieldByName('IDFORCLI').AsInteger := wIdForCli;

                  wSaldoAntVlr :=0;
                  wSaldoAntQtd :=0;

                  //AL_12 - BuscaSaldos em 3 camadas
                  CtrlRendaVariavel.BuscaSaldoRV.Executa(QryBuscaOperacoes.FieldByName('DATAOPERACAO').AsDateTime,
                                                         QryBuscaOperacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                         QryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         QryBuscaOperacoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         QryBuscaOperacoes.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                         9999999, -1, QryBuscaOperacoes.FieldByName('IDLOTE').AsString);

                  wSaldoAntQtd     := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
                  wSaldoAntVlr     := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;


                  FazQuery(QryAux,'SELECT DT.IDTIPOINVEST,    DT.IDTIPOOPERACAO,  DT.IDTIPODESPINVEST, '+
                                  '       DT.IDREGRACALCDESP, DT.IDREGRADATAVENC, DT.FLGCALCDIARIO,'+
                                  '       TI.TIPCREDOR,       FXD.EMPRESAPROP,    FXD.IDFORCLI, '+
                                  '       TI.DESCTIPODESPINV                                    '+
                                  'FROM DESPESASXTIPOOPER DT, TIPODESPINVEST TI, FORCLIXDESPINVEST FXD '+
                                  'WHERE (DT.IDTIPOOPERACAO =  '''+
                                    QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsString  +''') AND '+
                                  '      (DT.IDTIPODESPINVEST >= 0)  AND '+
                                  '      (DT.IDTIPODESPINVEST= TI.IDTIPODESPINVEST)  AND '+
                                  '      (TI.IDTIPODESPINVEST= FXD.IDTIPODESPINVEST(+)) AND'+
                                  '      (FXD.EMPRESAPROP(+)    = '''+IntToStr(Sistema.IdEmpresa)+''')');

                  // Abre Qry de Despesas
                  QryDespesasOperacao.Open;

                  // Transfere Dados das Despesas Calculando Valores

                  While Not QryAux.EOF Do
                  Begin
                     QryDespesasOperacao.Insert;
                     QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger  := LeUltRegistro(Nil,'DESPOPERINVEST');
                     QryDespesasOperacao.FieldByName('VLRDESPOPER').AsFloat         := 0;
                     QryDespesasOperacao.FieldByName('DATAVENCDESPOPER').AsDateTime := QryBuscaOperacoes.FieldByName('DATAVENCOPER').AsDateTime;
                     QryDespesasOperacao.FieldByName('DATAOPERACAO').AsDateTime     := QryBuscaOperacoes.FieldByName('DATAOPERACAO').AsDateTime;
                     QryDespesasOperacao.FieldByName('IDOPERACAOINVEST').AsInteger  := QryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger;
                     QryDespesasOperacao.FieldByName('IDTIPOINVEST').AsInteger      := 2;
                     QryDespesasOperacao.FieldByName('IDTIPOOPERACAO').AsInteger    := QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger;
                     QryDespesasOperacao.FieldByName('IDTIPODESPINVEST').AsInteger  := QryAux.FieldByName('IDTIPODESPINVEST').AsInteger;
                     QryDespesasOperacao.FieldByName('IDREGRACALCUSADA').AsString   := QryAux.FieldByName('IDREGRACALCDESP').AsString;
                     QryDespesasOperacao.FieldByName('IDREGRAVENCUSADA').AsString   := QryAux.FieldByName('IDREGRADATAVENC').AsString;
                     QryDespesasOperacao.FieldByName('FLGCALCDIARIO').AsInteger     := QryAux.FieldByName('FLGCALCDIARIO').AsInteger;


                     // Atualiza Empresa Propria
                     QryDespesasOperacao.FieldByName('EMPRESAPROP').AsInteger := Sistema.IdEmpresa;
                     // Atualiza o Credor
                     QryDespesasOperacao.FieldByName('IDFORCLI').AsInteger := BuscaForCliLocal(0,
                                                                                               QryBuscaOperacoes.FieldByName('IDCORRETVALORES').AsInteger,
                                                                                               QryBuscaOperacoes.FieldByName('IDEMISSOR').AsInteger,
                                                                                               QryAux.FieldByName('TIPCREDOR').AsString);
                     if QryDespesasOperacao.FieldByName('IDFORCLI').AsInteger = 0 then
                        QryDespesasOperacao.FieldByName('IDFORCLI').AsString := QryAux.FieldByName('IDFORCLI').AsString;

                     // Grava as Despesas
                     Try
                        QryDespesasOperacao.Post;
                     Except
                        Raise Exception.Create('Erro ao Transferir Rubricas .....');
                     End;
                     // Proximo Registro
                     QryAux.Next;
                  End;
                  QryAux.Close;

                  QryBuscaOperacoes.FieldByName('FLGSTATUSFECHBOL').AsString := 'P';

                  QryBuscaOperacoes.Post;
                  QryBuscaOperacoes.ApplyUpdates;
                  QryBuscaOperacoes.CommitUpdates;
                  QryDespesasOperacao.Close;

                  QryBuscaOperacoes.Next;
               End;
               ProgressBar1.Step := 1;
               QryBuscaOperacoes.Close;

               QryBoleta.Close;
               QryBoleta.ParamByName('IDBOLETA').AsString := qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString;
               QryBoleta.Open;
               //AL_14
               QryAux.Close;

               // Caso não tenha, cria um registro
               If QryBoleta.IsEmpty Then
                  ExecutaQuery(QryAux,'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, STATUS, IDFORCLI, TIPMOVBOLETA) VALUES ('+
                                      QuotedStr(qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString)+', TO_DATE('+
                                      QuotedStr(DateToStr(qryBuscaBoletas.FieldByName('DATAOPERACAO').AsDateTime))+',''DD/MM/YYYY''), '+
                                      ' ''P'','+
                                      QuotedStr(IntToStr(wIdForCli))+', ''OPE'' )')
               else
                  ExecutaQuery(QryAux, 'UPDATE BOLETA SET STATUS = ''P'' WHERE (IDBOLETA = '+
                                        QuotedStr(qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString)+' )');

               QryBoleta.Close;
               QryAux.Close;

               // Calcula Despesas
               CalcDespesasDoc(qryBuscaBoletas.FieldByName('DATAOPERACAO').AsDateTime,
                                qryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString, '',
                                //AL_16
                                '',
                                bPassoPasso);

               qryBuscaBoletas.Next;
            End;
         End
         Else
            Raise Exception.Create('Não há Operações para essa Data ou o Processo já foi executado');

         QryBuscaBoletas.Close;

         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Processamento concluído com sucesso. ', 'Mensagem do Sistema', MtConfirmation, [mbOk],0);

      except
         on E: Exception Do
         begin
            //AL_17 - Ajuste para não exibir a mensagem de "Não há transação em progresso"
            if dtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.RollBack;
            MsgDlg(E.Message + #13 + 'Processamento não efetivado !!! ','Mensagem do Sistema', mtWarning,[MbOk],0);
         end;
      end;
   finally
      bbtnConfirmar.Enabled:= False;
      FreeAndNil(QryLocalAux);
      FreeAndNil(QryInterna);
      Panel3.Caption  :='';
      Panel3.Repaint;
      Panel4.Caption  :=' ';
      Panel4.Repaint;
      Label1.Visible  := False;
      ProgressBar1.Position:= 0;
      Application.ProcessMessages;
   end;
end;

procedure TFrmProcOperAcao.FormShow(Sender: TObject);
begin
  inherited;
// Pega data de Acordo com o Tipo de Menu
  If FPrincipal.TipoMenuInvest = 'A' Then Begin
    MsgDlg('Sistema utilizado para Ambos os Tipos de Investimento.'+#13+
           'Escolha apenas um dos Tipos.','Mensagem do Sistema', MtError, [MbOk],0);
    Close;
    Exit;
  end;
  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');
  wQtdCotaIni:= QryAux.FieldByName('VLRCOTAINICART').AsInteger;
  wMoeda     := QryAux.FieldByName('MOECODIGO').AsInteger;
  QryAux.Close;
  //AL_16
  cbxPassoPasso.Checked := False;
  cbxPassoPassoClick(self);
end;

Function TfrmProcOperAcao.DivValorZero(Valor1, Valor2: Extended): Extended;
Begin
   If Valor2 <> 0 Then
      Result :=Valor1/Valor2
   Else
      Result := 0;
End;

function  TfrmProcOperAcao.VerificaOrdensAutorizadas : Boolean;
begin
   Result := True;
   With QryVerOrdAutorizadas Do
   Begin
      Close;
      ParamByName('STRDATA').AsString := edDataRef.Text;
      Open;
      If FieldByName('Count').AsInteger = 1 Then
      Begin
         If MsgDlg('Há uma Ordem de Movimentação não autorizada para esse dia.'+#13+
              'Continua o processo?', 'Mensagem do Sistema ',
            mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
            Result := False;
      End
      Else If FieldByName('Count').AsInteger > 1 Then
      Begin
         If MsgDlg('Há '+FieldByName('Count').AsString+
              ' Ordens de Movimentação não autorizadas para esse dia.'+#13+
              'Continua o processo?', 'Mensagem do Sistema ',
            mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
            Result := False;
      End;
   End;
end;

procedure TFrmProcOperAcao.bbtnCancelarClick(Sender: TObject);
begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
  inherited;
end;

procedure TFrmProcOperAcao.bbtnSairClick(Sender: TObject);
begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
  inherited;
end;

function  TFrmProcOperAcao.VerificaOrdensEspecificadas : Boolean;
begin
   Result := True;
   With QryVerOrdEspecificadas Do
   Begin
      Close;
      ParamByName('STRDATA').AsString := edDataRef.Text;
      Open;
      If FieldByName('Count').AsInteger = 1 Then
      Begin
         MsgDlg('Há uma Ordem de Movimentação não especificada para esse dia.',
                'Mensagem do Sistema ',mtInformation,[MbOk],0);
         Result := False;
      End
      Else If FieldByName('Count').AsInteger > 1 Then
      Begin
         MsgDlg('Existem '+FieldByName('Count').AsString+
                ' Ordens de Movimentação não especificadas para esse dia.',
                'Mensagem do Sistema ',mtInformation,[MbOk],0);
         Result := False;
      End;
   End;
end;

//AL_6
function  TfrmProcOperAcao.VerificaOrdensPendentes(sBoleta : String) : Boolean;
begin
   Result := True;
   OperComum.LimpaParametros(qryVerOrdensPendentes);
   With qryVerOrdensPendentes Do
   Begin
      Close;
      ParamByName('IDBOLETA').AsString := sBoleta;
      Open;
      if Not IsEmpty then
      begin
         Try

            if not RendaVariavel.ExcluiBoleta(sBoleta, true) then
               Raise Exception.Create('Não é possível fazer a Exclusão dessa Boleta.');

         Except
            on E: Exception do
            begin
               Result := False;
            end;
         End;
      end;
   end;
end;
//AL_6 - Fim

function TFrmProcOperAcao.BuscaForCliLocal(iTipoOper, iCorretValores, iEmissor: Integer;
                                           sTipoCredor: String = 'N') : Integer;
var wTipoCredor: String;
begin
   try
      Result := 0;

      OperComum.LimpaParametros(QryBuscaTipoOper, True);
      QryBuscaTipoOper.ParamByName('TIPOOPERACAO').asInteger := iTipoOper;
      QryBuscaTipoOper.Open;

      if sTipoCredor = 'N' then
         wTipoCredor := QryBuscaTipoOperTIPCREDOR.AsString
      else
         wTipoCredor := sTipoCredor;

      // Busca Credor da Despesa pelo Tipo de Credor
      if wTipoCredor <> '' then
      begin
         // Atualiza de acordo Emissor/Corretor
         if wTipoCredor = 'CO' then
         begin
            // Transforma Corretor em Fornecedor
            try
               if sTipoCredor = 'N' then
               begin
                  if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                     // Cliente
                     Documento.ForCli.Inserir(iCorretValores, Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                              '','','','','C',False)
                  else
                  if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                     // Fornecedor
                     Documento.ForCli.Inserir(iCorretValores, Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                              '','','','','F',False);
               end
               else
                  // Despesa
                  Documento.ForCli.Inserir(iCorretValores, Sistema.IdEmpresa, 0,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                           '','','','','F',False);
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado

            if iCorretValores <> 0 then
               Result := iCorretValores;
         end
         else
         begin
            // Transforma Emissor em Fornecedor
            Try
               if sTipoCredor = 'N' then
               begin
                  if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
                     // Cliente
                     Documento.ForCli.Inserir(iEmissor, Sistema.IdEmpresa,0,0,pRPI.IDTIPOCLIENTEEMI,Sistema.IdEmpresa,
                                              '','','','','C',False)
                  else
                  if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
                     // Fornecedor
                     Documento.ForCli.Inserir(iEmissor, Sistema.IdEmpresa,0,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                              '','','','','F',False);
               end
               else
                  // Despesas
                  Documento.ForCli.Inserir(iEmissor, Sistema.IdEmpresa, 0,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                           '','','','','F',False);
            Except  // Função gerava um Abort quando o Fornecedor
            End;    // já estava cadastrado

            Result := iEmissor;
         end;
      // Caso Credor
      end
      else
      begin
         // Para Despesas, retorna 0(zero)
         if sTipoCredor = 'N' then
         begin
            // Busca o Credor no Sub........
            if FazQuery(QryAux,'SELECT IDFORCLI FROM FORCLIXTIPOPER '+
                               ' WHERE (IDTIPOINVEST  = '+QryBuscaOperacoes.FieldByName('IDTIPOINVEST').AsString+') AND '+
                               '       (IDTIPOOPERACAO= '+IntToStr(iTipoOper)+') AND '+
                               '       (EMPRESAPROP   = '+IntToStr(Sistema.IdEmpresa)+')') then
            begin
               Result := QryAux.FieldByName('IDFORCLI').AsInteger;
               // Caso não encontre o Fornecedor ABORTA todo o processo
               if Result = 0 then
                  Raise Exception.Create('O Credor deste Tipo de Operação não foi Informado !')
            end;
            QryAux.Close;
         end;
      end;
   finally
      QryBuscaTipoOper.Close;
   end;
end;

procedure TFrmProcOperAcao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   FreeAndNil(CtrlRendaVariavel);
   inherited;
end;

procedure TFrmProcOperAcao.FormResize(Sender: TObject);
begin
  inherited;
  Invalidate;
end;

//AL_16
procedure TFrmProcOperAcao.cbxPassoPassoClick(Sender: TObject);
begin
  inherited;
   if cbxPassoPasso.Checked then
      bPassoPasso := True
   else
      bPassoPasso := False;
end;

end.


