//******************************************************************************
// SOL        : 122886
// Kintana    : 609813
// Data       : 05/10/2009
// Responsável: Thiago Passos
// Descrição  : Filtro de Emissor no Reprocessamento e VerificadeLiquidação de Fluxo
//******************************************************************************
// SOL        : 39918
// Kintana    : 523459
// Data       : 10/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção de Indices em dias Uteis
//********************************************************************************************************
// Data	     : 01/07/2009
// Kintana   : 586352
// SOL       : 121543
// Responsável: Thiago Passos
// Função    : Ajuste na rotina de fluxo  recebimento de juros
//             Tanto no processamento quanto no reprocessamento
//             o sistema verificará o recebimento de juros baseados nos filtros
//             de Classe e/ou Investimento.
//********************************************************************************************************
// Data	     : 30/05/2008
// Codigo    : AL_37
// Pendência :
// SOL       :
// Função    : Ajuste na marcação do tempo de processamento decorrido
//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_36
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//********************************************************************************************************
// Data	     : 24/08/2007
// Codigo    : AL_35
// Pendência : 26084
// Função    : Alteração na ordenação da query qryHistRenFix
//********************************************************************************************************
//Data	     : 04/07/2007
//Codigo     : AL_34
//Pendência  : 24717
//SOL        : 55534
//Desc       : -- Out of Memory --
//             Desabilitação dos paineis de dados durante o processamento
//             Melhora na utilização dos arrays de campos e valores do sql de entrada do regra
//********************************************************************************************************
//Data	     : 04/06/2007
//Codigo     : AL_33
//Pendência  : 25765
//SOL        : 63337
//Desc       : Acerto no reprocessamento de Poupança após TRC (aplicaçaõ original)
//********************************************************************************************************
//Data	     : 04/06/2007
//Codigo     : AL_32
//Pendência  : 25309
//SOL        : 58642
//Desc       : Implementação de Flag para atualizar o Título no dia da Emissão.
//             Será desenvolvida a atualização no dia da compra - Verificar depois se compra decorrida tb.
//******************************************************************************
// Data      : 16/05/2007
// Código    : AL_31
// Pendencia : 25336
// SOL       : 60074
// Desc      : Acerto na Busca de Saldos de Operações de Renda Fixa para trazer
//              os diversos Planos / Patrocinadoras
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_30
// Pendencia : 24773
// SOL       : 55877
// Desc      : Troca do FLGCONTABILIZA para o Especifico de Renda Fixa FLGINTCONTABRF
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_29
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_28
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************
// Data      : 24/10/2006
// Código    : AL_27
// Pendencia : 23603
// SOL       : 47415
// Desc      : Ajuste no reprocessamento de TRC
//******************************************************************************
// Data      : 09/10/2006
// Código    : AL_26
// Desc      : Acerto na atualização de Poupança que nâo estava gerando o Saldo
//             Anterior corretamente.              
//******************************************************************************
// Data      : 14/09/2006
// Código    : AL_25
// Desc      : Segregação de Planos:
//              Ajuste na atualização após a transferência de Poupança (Destino)
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_24
// Pendencia : 23008
// Desc      : Implementação de TRC Planos antes do registro de ATU
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_23
// Pendencia : 22658
// SOL       : 44185
// Desc      : qryExisteOperacoes transferida para o DMRendaFixa
//******************************************************************************
// Data      : 29/06/2006
// Código    : AL_22
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_21
//Pendência  : 22480
//SOL        : 43633
//Função     : Alterações na Funcionalidade de Transferencia entre planos
//********************************************************************************************************
//Data	   : 18/05/2006
//Codigo   : AL_20
//Pendencia: 22383
//Descrição: Não excluir os históricos no dia de vencimento de títulos pois pode haver fluxos e resgates
//           que precisem ser relançados
//********************************************************************************************************
//Data	   :  13/03/2006
//Codigo   :  AL_19
//Função   :  Nova forma de movimentação do ProgressBar, através de Notificação de evento
//********************************************************************************************************
//Data	  :  03/10/2005
//Codigo  :  AL_18
//Função  :  Ajuste na rotina de verificação de títulos repactuados durante o processamento
//********************************************************************************************************
//Data	  :  09/09/2005
//Codigo  :  AL_17
//Função  :  Não verifica repactuação se for depuração
//********************************************************************************************************
//Data	  :  02/09/2005
//Codigo  :  AL_16
//Função  :  Implementação da trava de reprocessamento para títulos repactuados
//********************************************************************************************************
//Data	  :  22/08/2005
//Codigo  :  AL_15
//Função  :  Implementação de Repactuação de Titulo (Prorrogação de Vencimento)
//********************************************************************************************************
//Data	  :  20/05/2005
//Codigo  :  AL_14
//Função  :  Novo teste de Periodo contábil em 3 camadas
//********************************************************************************************************
//Data	  :  12/04/2005
//Codigo  :  AL_13
//Função  :  Melhoria na qryMarcadoReproc para trazer somente registro menores ou igual ao
//           último fechamento de RF (AND (DATAHISTRENFIX <= :DATAULTFECHRF))
//********************************************************************************************************
//Data	  :  12/04/2005
//Codigo  :  AL_12
//Função  :  Melhoria na qryMarcadoReproc para trazer somente registro menores ou igual ao
//           último fechamento de RF (AND (DATAHISTRENFIX <= :DATAULTFECHRF))
//********************************************************************************************************
//Data	  :  11/04/2005
//Codigo  :  AL_11
//Função  :  Não passa progressbar nas rotinas CalculaItens e ExcluiHist -
//           melhorar o consumo de memória
//********************************************************************************************************
//Data	         :  21/03/2005
//               :  AL_10
//Função	 :  Fechamento da qryOperXFluxo na função VerificaLiquidacaoFluxos
//                  Fechamento da DMRendaFixa.qryBuscaSaldosHistPoup,
//                    DMRendaFixa.qryBuscaSaldosItemsPoup, DMRendaFixa.qryBuscaSaldosOperPoup
//                    e DMRendaFixa.qryBuscaSaldosItemsOperPoup na função bbtnConfirmarClick
//********************************************************************************************************
//Data	         :  23/02/2005
//               :  AL_9
//Função	 :  Colocado parametro 'ATU' na BuscaTotResgPoup para acertar o somatório de resgates
//                  conforme o momento do processamento (Atualização (<) ou Operação (<=)
//********************************************************************************************************
//Data	         :  17/11/2004
//Código         :  AL_8
//Função         :  Só marca que está em fechamento se não for debug
//********************************************************************************************************
//Data	 	 :  29/09/2004
//Código         :  AL_7
//Função	 :  Encerra o processo quando debugando para evitar loop eterno
//                  caso existam papeis marcados em data posterior a data final
//********************************************************************************************************
// Data          : 28/09/2004
// Código        : AL_6
// Motivo        : Implementacao do paramentro FlgContaInvest (CPMF) qryExisteOperacoes
//                 e RefazOperacoes
//********************************************************************************************************
//Data	 	 :  27/08/2004
//Linha          :  AL_5
//Função	 :  Poupança não tem vencimento
//********************************************************************************************************
//Data	 	 :  12/08/2004
//Linha          :  AL_4
//Função	 :  Ajuste no controle de Fluxos
//********************************************************************************************************
//Data	 	 :  04/08/2004
//Linha          :  AL_3
//Função	 :  Controle do processo de abertura
//*******************************************************************************
//Data	 	 :  06/07/2004
//Linha          :  AL_2
//Função	 :  Não atualiza Títulos vencidos ( nem sequer grava o histrenfix )
//********************************************************************************************************
//Data	 	 :  01/06/2004
//Linha          :  AL_1
//Função	 :  Desmarca Investimentos no Reprocessamento de Titulos Zerados
//********************************************************************************************************
//Data	 	 :  07/05/2004
//Função	 :  Passa a mostrar o Plano do Fluxo sem liquidação
//*******************************************************************************
//Data	 	 :  04/05/2004
//Função	 :  O Reprocessamento não volta a data do sistema.
//             Criação do controle de títulos calculados e a calcular,
//             para que em caso de interrupção do processamento, este recomeçe
//             no mesmo ponto que foi interrompido.
//*******************************************************************************
//Data	 	 :  28/04/2004
//Função	 :  Reprocessar Investimentos Marcados para reprocessamento
//              antes de processar o que foi pedido no form.
//*******************************************************************************
//Função	 :  Incluido o Timer de contagem de tempo de processamento
//*******************************************************************************
unit FFechtoRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid,URegra,UOperacaoInvest, wwdblook, uCtrlInvContab,
  //AL_28
  uCtrlInvestimento, uCtrlPadroes, 
  //AL_36
  uCtrlParamInvest;

type
  TfrmFechtoRenFix = class(TfrmOkCancelarInv)
    qryRegra: TwwQuery;
    dsDMRqryBuscaSaldosItemsXCurvas: TwwDataSource;
    dsDMRqryBuscaSaldosItems: TwwDataSource;
    qryTipoOperacao: TwwQuery;
    qryProcuraAtualizacoes: TwwQuery;
    bbtnCommita: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pnlDatas: TPanel;
    dtInicio: TCMDateTimePicker;
    Label4: TLabel;
    Label1: TLabel;
    dtFinal: TCMDateTimePicker;
    pnlBarras: TPanel;
    qryBuscaFluxos: TwwQuery;
    qryOperAplic: TwwQuery;
    qryOperXFluxo: TwwQuery;
    qryInvestimento: TwwQuery;
    pgcProcesso: TPageControl;
    tbsProcesso: TTabSheet;
    tbsDepurar: TTabSheet;
    lblInvestimento: TLabel;
    Label2: TLabel;
    prbDatas: TProgressBar;
    Label3: TLabel;
    prbHistorico: TProgressBar;
    cbxDepurar: TCheckBox;
    pnlDepurarDados: TPanel;
    cbxPassoPasso: TCheckBox;
    pnlDepurarGrid: TPanel;
    qryEmissor: TwwQuery;
    dsHistRenFix: TwwDataSource;
    qryHistRenfix: TwwQuery;
    lblInvProc: TLabel;
    lblDia: TLabel;
    lblEmissor: TLabel;
    dblkEmissor: TwwDBLookupCombo;
    Label5: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    prbAguarde: TProgressBar;
    lblClasse: TLabel;
    dblkClasseTit: TwwDBLookupCombo;
    qryClasseTit: TwwQuery;
    Timer: TTimer;
    lblTempo: TStaticText;
    lblMensagem: TLabel;
    dbGrd: TwwDBGrid;
    lblPlanoPatro: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCommitaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxDepurarClick(Sender: TObject);
    procedure dblkEmissorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cbxPassoPassoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dtInicioExit(Sender: TObject);
    procedure dblkClasseTitCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    //AL_36
    FEmProcesso: Boolean;

    //AL_37
    hHoraIni: TDateTime;
    //AL_28
    CtrlInvestimento     : TCtrlInvestimento;

    //AL_36
    procedure SetEmProcesso(const Value: Boolean);
    property EmProcesso: Boolean read FEmProcesso write SetEmProcesso;

    procedure StatusNormal;
    //AL_34
    procedure StatusProc;
    function FormatSecsToHMS(Secs: Integer): string;
    //AL_36
    function VerificaLiquidacaoFluxos(dDataProc: TDateTime; iClasse: Integer = -1; iInv: Integer = -1;iEmissor:integer=-1):boolean;
    function AbreInv: Boolean;
  public
    { Public declarations }
  end;

  // AL_19
  procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);

var
  frmFechtoRenFix: TfrmFechtoRenFix;
  dDataProc, dDataFim, dDataProcAnt: TDateTime;
  iIdHistRenFix: Integer;
  fPUAcuItem, fPUItem, fPUCotRenFix: Double;
  bPassoPasso, bReprocessa: boolean;

implementation

//AL_36
uses dBaseDados, UMensErro, USistema, UDataBase, UDiasUteisInv, URendaFixa,
     dRendaFixa, ULancContab, UOperComum;


{$R *.DFM}

procedure TfrmFechtoRenFix.FormShow(Sender: TObject);
{var dDataIni: TDateTime;
begin
   inherited;
   qryTipoOperacao.Open;
   qryEmissor.Open;
   qryClasseTit.Open;
   AbreInv;

   //AL_36
   dtInicio.Text := DateToStr(CtrlPInv.DataUltFechRF + 1);
   dtFinal.Text  := DateToStr(CtrlPInv.DataUltFechRF + 1);

   pgcProcesso.ActivePage := tbsProcesso;
   cbxDepurar.Checked := False;
   cbxDepurarClick(Self);
   cbxPassoPasso.Checked := False;
   cbxPassoPassoClick(self);
 }
  Var dDataIni: TDateTime;
Begin
   Inherited;
   qryTipoOperacao.Open;
   qryEmissor.Open;
   qryClasseTit.Open;
   AbreInv;

   //AL_36
   dtInicio.Text := DateToStr(CtrlPInv.DataUltFechRF + 1);
   dtFinal.Text := DateToStr(CtrlPInv.DataUltFechRF + 1);

    If Not DiasUteisInv.DiaUtil(dtInicio.Date, -1, 1, '', True, False, False) Then
       dtInicio.Text := DateToStr(DiasUteisInv.PrimeiroDiaUtilPosterior(dtInicio.Date, -1, 1, '', True, False, False));

    dtFinal.Text := dtInicio.Text;

   pgcProcesso.ActivePage := tbsProcesso;
   cbxDepurar.Checked := False;
   cbxDepurarClick(Self);
   cbxPassoPasso.Checked := False;
   cbxPassoPassoClick(self);
end;

//AL_36
procedure TfrmFechtoRenFix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMRendaFixa.qryExisteOperacoes.Close;
   qryBuscaFluxos.Close;
   qryOperAplic.Close;
   qryTipoOperacao.Close;
   qryEmissor.Close;
   qryInvestimento.Close;
   qryHistRenfix.Close;
   //AL_22
   qryClasseTit.Close;
   //AL_28
   FreeAndNil(CtrlInvestimento);

   if DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   inherited;
end;

procedure TfrmFechtoRenFix.bbtnConfirmarClick(Sender: TObject);
var
   //AL_14
   //AL_22
   //AL_25
   //AL_27
   //AL_28
   //AL_29
   //AL_34
   //AL_36
   sHistorico, sErro : string;

   iNumdias, iPlanilha, iDocumento, iTipoProc, pTipoProc, dtProc,
      iInvestimento,iOperacaoAplic, iClasseTit, idForCli,
      iClasseTitCtb, iClasseInvest,
      iIdHisRenfix, iI : Integer;

   dDataAniv, dDataTR, dtIni, dtFim: TDateTime;

   fTotResgPoup, fTotQtdPoup, fTotVlrTRCPoup, fTotQtdTRCPoup, fSaldoFinal,
      fQtdOperacao, SldVlrTrcDia, SldQtdTrcDia : Double;

   bErro, bPrimeiro: Boolean;

   qryPlano: TwwQuery;
   iEmissor:integer; //Thiago Passos SOL 122886 Kintana 609813
   //Thiago Passos SOL 39918 Kintana 523459
   QryDiasNaoUteis: TwwQuery;
   dDataFinal:TDateTime;

   bOperacaoDiasNaoUteis:Boolean;
begin
   inherited;

   // AL_3 - Controle do processo de abertura
   // Não faz se outro usuário já estiver fazendo
   if RendaFixa.VerEmAbertura then Exit;

   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   dDataAniv := StrToDate(dtInicio.Text);

   if (Trim(dtInicio.Text) = '') or (Trim(dtFinal.Text) = '') then
   begin
      MsgDlg('As Datas de Início e Fim devem ser Preenchidas !',
             'Mensagem do Sistema ', mtWarning,[MbOk],0);
      if dtFinal.CanFocus then
         dtFinal.SetFocus;
      exit;
   end;

   if not cbxDepurar.Checked then
   begin
      if Trim(dblkInvestimento.Text) <> '' then
      begin
         //AL_36
         if dtFinal.DateTime > CtrlPInv.DataUltFechRF then
         begin
            MsgDlg('Não é Possível Fechar Dia Novo para um Investimento Somente !',
                   'Mensagem do Sistema ', mtWarning,[MbOk],0);
            Exit;
         end;
         //AL_36
         if dtFinal.DateTime < CtrlPInv.DataUltFechRF then
         begin
            MsgDlg('Só é Possível Reprocessar um Investimento Finalizando na Data do Último Fechamento !',
                   'Mensagem do Sistema ', mtWarning,[MbOk],0);
            Exit;
         end;
         if (MsgDlg('Será efetuado o fechamento somente de:' + #13 +
                     qryInvestimento.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                     'Continua?',
                     'Mensagem do Sistema', mtConfirmation ,[MbYes, MbNo],0) = MrNo) Then
            Exit;
      end
      else if Trim(dblkClasseTit.Text) <> '' then
      begin
         //AL_36
         if dtFinal.DateTime > CtrlPInv.DataUltFechRF then
         begin
            MsgDlg('Não é Possível Fechar Dia Novo para uma Classe Somente !',
                   'Mensagem do Sistema ', mtWarning,[MbOk],0);
            Exit;
         end;
         //AL_36
         if dtFinal.DateTime < CtrlPInv.DataUltFechRF then
         begin
            MsgDlg('Só é Possível Reprocessar uma Classe Finalizando na Data do Último Fechamento !',
                   'Mensagem do Sistema ', mtWarning,[MbOk],0);
            Exit;
         end;
         if (MsgDlg('Será efetuado o fechamento somente de:' + #13 +
                     qryClasseTit.FieldByName('DESCCLASSETIT').AsString + #13 +
                     'Continua?',
                     'Mensagem do Sistema', mtConfirmation ,[MbYes, MbNo],0) = MrNo) Then
            Exit;
      end else

      if Trim(dblkEmissor.Text) <> '' then
      begin
         //AL_36
         if dtFinal.DateTime > CtrlPInv.DataUltFechRF then
         begin
            MsgDlg('Não é Possível Fechar Dia Novo para um Emissor Somente !',
                   'Mensagem do Sistema ', mtWarning,[MbOk],0);
            Exit;
         end;
         //AL_36
         if dtFinal.DateTime < CtrlPInv.DataUltFechRF then
         begin
            MsgDlg('Só é Possível Reprocessar um Emissor Finalizando na Data do Último Fechamento !',
                   'Mensagem do Sistema ', mtWarning,[MbOk],0);
            Exit;
         end;
      end;
   end;

   //AL_36
   if dtInicio.DateTime < (CtrlPInv.DataUltFechRF + 1) then
      bReprocessa := True
   else
      bReprocessa := False;

   //AL_34
   StatusProc;

   //AL_36
   iNumdias := DiasUteisInv.IntervaloDias(dtInicio.DateTime, dtFinal.DateTime);
   prbDatas.Max := iNumdias + 1;
   prbDatas.Position := 0;

   // Prepara marcador de Tempo de Processamento
   lblTempo.Caption := 'Tempo de processamento: ' + FormatSecsToHMS(0);
   lblTempo.Visible := True;
   //AL_37
   hHoraIni := Now;
   Timer.Enabled := True;

   // Prepara Variáveis de Trabalho
   //Thiago Passos SOL 39918 Kintana 523459
     if not DiasUteisInv.DiaUtil(StrToDate(dtInicio.Text),-1,1,'',True,False,False) then
       dDataProc :=DiasUteisInv.PrimeiroDiaUtilPosterior(StrToDate(dtInicio.Text),-1,1,'',True,False,False)
     else dDataProc := StrToDate(dtInicio.Text);

    if not DiasUteisInv.DiaUtil(StrToDate(dtFinal.Text),-1,1,'',True,False,False) then
       dDataFinal :=DiasUteisInv.UltDiaUtilAnterior(StrToDate(dtFinal.Text),-1,1,'',True,False,False)
      else
       dDataFinal :=StrToDate(dtFinal.Text);

   dDataFim  := StrToDate(dtFinal.Text);
   iClasseTit := -1;
   iInvestimento := -1;
   iOperacaoAplic := -1;
   iEmissor := -1;  //Thiago Passos

   if Trim(dblkEmissor.Text) <> '' then  //Thiago Passos
      iEmissor := qryEmissor.fieldbyname('idemissor').asinteger; //Thiago Passos

   if Trim(dblkClasseTit.Text) <> '' then
      iClasseTit := qryClasseTit.FieldByName('IDCLASSETIT').AsInteger;

   if Trim(dblkInvestimento.Text) <> '' then
   begin
      iInvestimento  := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      iOperacaoAplic := qryInvestimento.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
   end
   else
   begin
      if (cbxDepurar.Checked = True)  then
      begin
         MsgDlg('Para depurar, deve ser informado o Investimenbto.','Mensagem do Sistema',mtWarning,[MbOk],0);
         Exit;
      end;
   end;

   try // Finally

      //AL_36
      EmProcesso := True;

      //AL_27
      qryPlano := TwwQuery.Create(Self);
      qryPlano.DatabaseName := 'BaseDados';
      qryPlano.SQL.Add('SELECT VWP.PLANPRVCONTABPATRO, VWP.IDPLANPREVCTBPATR FROM VWPLANPREVCTBPATR VWP');
      qryPlano.Open;

      //AL_36
      // AL_3 - Controle do processo de abertura
      // Grava o parametro de EmAbertura
      if cbxDepurar.Checked = False then
         RendaFixa.GravaEmAbertura('S');

      //AL_28
      if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc),1,-1) then
      Begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         StatusNormal;
         Exit;
      end;
      if not CtrlInvestimento.IntegraPenhoraJuridico(dtInicio.Date, dtFinal.Date, 0, 1) then
      begin
         MsgDlg('Ocorreu um problema na Importação de Penhoras do Jurídico.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         bbtnCancelar.Click; // Faz RollBack
         exit;
      end;
      //AL_28
      RendaFixa.IncPriHistVenc(-1, 0);

      // Verifica se existem Investimentos a serem Reprocessados
      //AL_36
      OperComum.LimpaParametros(DMRendaFixa.qryMarcadoReproc);
      //AL_13
      //AL_36
      DMRendaFixa.qryMarcadoReproc.ParamByName('DATAULTFECHRF').AsString := DateToStr(CtrlPInv.DataUltFechRF);
      DMRendaFixa.qryMarcadoReproc.Open;
      DMRendaFixa.qryMarcadoReproc.First;
      bPrimeiro := True;

      //AL_16 - Ini
      //AL_17
      // Verifica se existem investimento a ser reprocessado que já foi repactuado
      if ((bReprocessa) or (not DMRendaFixa.qryMarcadoReproc.IsEmpty)) and (not cbxDepurar.Checked) then
      begin
         // Se há Títulos marcados para reprocessamento - Verifica Repactuação
         while not DMRendaFixa.qryMarcadoReproc.Eof do
         begin
            if RendaFixa.Repactuou(DMRendaFixa.qryMarcadoReproc.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                   DMRendaFixa.qryMarcadoReproc.FieldByName('DATAHISTRENFIX').AsDateTime) then
            begin
               MsgDlg('O título ' + DMRendaFixa.qryMarcadoReproc.FieldByName('DESCINVESTIMENTO').AsString + ' já foi repactuado.' + #13 +
                      'Não é possível reprocessá-lo.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
               bbtnCancelar.Click; // Faz RollBack
               exit;
            end;
            DMRendaFixa.qryMarcadoReproc.Next;
         end;
         DMRendaFixa.qryMarcadoReproc.First;

         // Se foi selecionado somente um Títulos para reprocessamento - Verifica Repactuação
         if iInvestimento <> -1 then
         begin
            if RendaFixa.Repactuou(iOperacaoAplic, dDataProc) then
            begin
               sErro := frmFechtoRenFix.qryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
               MsgDlg('O título ' + sErro + ' já foi repactuado.' + #13 +
                      'Não é possível reprocessá-lo.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
               bbtnCancelar.Click; // Faz RollBack
               exit;
            end;
         end;

         // Se vai reprocessar todos os títulos - Verifica Repactuação pelo cadastro
         if (bReprocessa) and (iInvestimento = -1) then
         begin
            //AL_36
            DMRendaFixa.qryAux.Close;
            DMRendaFixa.qryAux.SQL.Clear;
            DMRendaFixa.qryAux.SQL.Add('SELECT INVESTIMENTO.IDINVESTIMENTO ');
            DMRendaFixa.qryAux.SQL.Add('FROM INVESTIMENTO ');
            DMRendaFixa.qryAux.SQL.Add('WHERE INVESTIMENTO.IDTIPOINVEST = 1 ');
            // AL_18
            if iClasseTit <> -1 then
               DMRendaFixa.qryAux.SQL.Add('  AND INVESTIMENTO.IDCLASSETIT = ' + IntToStr(iClasseTit));
            if iEmissor <> -1 then //Thiago Passos
               DMRendaFixa.qryAux.SQL.Add('  AND INVESTIMENTO.IDEMISSOR = ' + IntToStr(iEmissor)); //Thiago Passos
            DMRendaFixa.qryAux.SQL.Add('  AND INVESTIMENTO.FLGREPACTUA = ''S''');
            DMRendaFixa.qryAux.Open;

            dtIni := dtInicio.DateTime;
            dtFim := dtFinal.DateTime;

            // Para cada data, do Inicio do Reprocessamento até o Fim
            for dtProc := Trunc(dtIni) to Trunc(dtFim) do
            begin
               DMRendaFixa.qryAux.First;
               // Para cada Investimento que permite Repactuação
               while not DMRendaFixa.qryAux.Eof do
               begin
                  // Verifica se tem saldo
                  //AL_29
                  RendaFixa.BuscaSaldos(dtProc-1, -1, DMRendaFixa.qryAux.FieldByName('IDINVESTIMENTO').AsInteger, -1, -1, 1);
                  while not DMRendaFixa.qryBuscaSaldosHist.Eof do
                  begin
                     // Se tem saldo, verifica se já teve repactuação
                     if RendaFixa.Repactuou(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, dtProc) then
                     begin
                        MsgDlg('O título ' + DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString + ' já foi repactuado.' + #13 +
                               'Não é possível reprocessá-lo.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                        bbtnCancelar.Click; // Faz RollBack
                        exit;
                     end;
                     DMRendaFixa.qryBuscaSaldosHist.Next
                  end;
                  DMRendaFixa.qryAux.Next;
               end;
            end;
            //AL_36
            DMRendaFixa.qryAux.Close;
         end;
      end;
      //AL_16 - Fim

      // Faz pelo menos uma vez, atualizando normalmente o que o usuário pediu,
      // depois faz todos os papeis marcados para reprocessamento
      repeat

         // Verifica se existem Investimentos a serem Reprocessados
         if not bPrimeiro then
         begin
            iInvestimento  := -1;
            iOperacaoAplic := -1;
            iClasseTit     := -1;
            iEmissor := -1;
            OperComum.LimpaParametros(DMRendaFixa.qryMarcadoReproc);
            //AL_13
            //AL_36
            DMRendaFixa.qryMarcadoReproc.ParamByName('DATAULTFECHRF').AsString := DateToStr(CtrlPInv.DataUltFechRF);
            DMRendaFixa.qryMarcadoReproc.Open;
            DMRendaFixa.qryMarcadoReproc.First;

            //AL_36
            if not DMRendaFixa.qryMarcadoReproc.IsEmpty then
            begin
               iInvestimento  := DMRendaFixa.qryMarcadoReproc.FieldByName('IDINVESTIMENTO').AsInteger;
               iOperacaoAplic := DMRendaFixa.qryMarcadoReproc.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
               dDataProc      := DMRendaFixa.qryMarcadoReproc.FieldByName('DATAHISTRENFIX').AsDateTime;
               // Revalidar os ponteiros das barras de tarefa e mensagens
               iNumdias := DiasUteisInv.IntervaloDias(dDataProc, dtFinal.DateTime);
               prbDatas.Max := iNumdias + 1;
               prbDatas.Position := 0;
            end;
         end;
         //Thiago Passos SOL 39918 Kintana 523459
         //Exclui Dias nao uteis(Limpeza)
         //BLOCO EM PL/SQL  - PERFORMANCE NA EXCLUSAO
         QryDiasNaoUteis := TwwQuery.Create(self);
         QryDiasNaoUteis.DatabaseName := 'basedados';
         QryDiasNaoUteis.close;
         QryDiasNaoUteis.SQL.Clear;

         QryDiasNaoUteis.SQL.Add(' DECLARE ');
         QryDiasNaoUteis.SQL.Add('  BEGIN  ');
         QryDiasNaoUteis.SQL.Add(' FOR X IN  (  ');
         QryDiasNaoUteis.SQL.Add(' SELECT h.idhistrenfix,h.datahistrenfix     ');
         QryDiasNaoUteis.SQL.Add(' FROM cm.histrenfix h, cm.investimento i ,cm.operrenfix op   ');
         QryDiasNaoUteis.SQL.Add('    WHERE h.datahistrenfix BETWEEN TO_DATE('+QuotedStr(dtInicio.text)+' ,''dd/mm/yyyy'') and to_date('+QuotedStr(dtFinal.text)+' ,''dd/mm/yyyy'') ');
         if   trim(dblkInvestimento.Text) <> '' then
               QryDiasNaoUteis.SQL.Add('    AND   i.idinvestimento='+ qryInvestimento.fieldbyname('idinvestimento').asstring );

         if trim(dblkClasseTit.Text) <> '' then
            QryDiasNaoUteis.SQL.Add('    AND   i.idclassetit ='+qryClasseTit.fieldbyname('idclassetit').asstring );

         QryDiasNaoUteis.SQL.Add('   AND   OP.IDOPERRENFIX = H.IDOPERRENFIXAPLIC ');

         QryDiasNaoUteis.SQL.Add('   AND   i.idinvestimento = h.idinvestimento AND h.tipmovhisrenfix =''ATU''  ');
         QryDiasNaoUteis.SQL.Add('   AND  CM.PKG_INV_DATAS.FDIAUTIL(h.datahistrenfix ,NULL, NULL,'''',1,0,0,1 )=0 ');
         QryDiasNaoUteis.SQL.Add('   AND  (SELECT COUNT(1)FROM operrenfix op1 WHERE op1.IDINVESTIMENTO = H.IDINVESTIMENTO AND op1.DATAOPERACAO = H.DATAHISTRENFIX) = 0)LOOP ');

         QryDiasNaoUteis.SQL.Add('   DELETE cm.histrenfixxitens where idhistrenfix = X.idhistrenfix; ');
         QryDiasNaoUteis.SQL.Add('   DELETE cm.histrenfix where idhistrenfix = X.idhistrenfix; ');
         QryDiasNaoUteis.SQL.Add('  END LOOP; END ; ');
         QryDiasNaoUteis.EXECSQL;

         // Processa da Data Inicial até a Data Final
         while dDataProc <= StrToDate(dtFinal.Text) Do
         begin
            // AL_4
            //AL_36
            if not VerificaLiquidacaoFluxos(DiasUteisInv.UltDiaUtilAnterior(dDataProc,-1,1,'',True,False,False), iClasseTit, iInvestimento,iEmissor) then
            begin
               bbtnCancelar.Click; // Faz RollBack
               exit;
            end;

            iPlanilha := -1;
            iDocumento := -1;

            try
               // Verifica se é um reprocessamento do dia
               //AL_36
               if (dDataProc <= CtrlPInv.DataUltFechRF) and
                  (CtrlPInv.FlgImplantaRF = 'N') then
               begin
                  // Testa se Periodo Contabil esta Fechado para exclusao
                  //AL_30
                  //AL_36
                  if CtrlPInv.IntFinContabRF <> 'N' then
                  begin
                     //AL_22 Ini
                     //AL_14 -  Novo metodo 3 camadas
                     iClasseTitCtb := -1;
                     if iClasseTit <> -1 then
                        iClasseTitCtb := iClasseTit;
                     if iInvestimento <> -1 then
                     begin
                        //AL_36
                        DMRendaFixa.qryAux.Close;
                        DMRendaFixa.qryAux.SQL.Clear;
                        DMRendaFixa.qryAux.SQL.Add('SELECT INVESTIMENTO.IDCLASSETIT ');
                        DMRendaFixa.qryAux.SQL.Add('FROM INVESTIMENTO');
                        DMRendaFixa.qryAux.SQL.Add('WHERE INVESTIMENTO.IDINVESTIMENTO = ' + IntToStr(iInvestimento));
                        DMRendaFixa.qryAux.Open;
                        iClasseTitCtb := DMRendaFixa.qryAux.FieldByName('IDCLASSETIT').AsInteger;
                        //AL_36
                        DMRendaFixa.qryAux.Close;
                     end;
                     if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc),1,-1,
                                                       iClasseTitCtb) then
                        Raise Exception.Create(CtrlInvContab.MessageInfo);
                     //AL_22 Fim
                  end;
               end;

               // COMEÇA AQUI O PROCESSAMENTO DUPLICADO PARA FAZER ATUALIZAÇÃO DAS OPERAÇÕES
               // DE COTAÇÃO DE RENDA FIXA NO DIA ANTERIOR E TRANSFERÊNCIAS ENTRE PLANOS

               // Criado parametro TIPOPROC na BuscaSaldo para quando for:
               //    0: Traz somente as operações do dia anterior de Títulos com
               //       Cotação de Renda Fixa durante PROCESSAMENTO NORMAL
               //    1: Traz os saldos normalmente
               //    2: Traz somente as operações do dia anterior de Títulos com
               //       Cotação de Renda Fixa durante REPROCESSAMENTO
               //
               // AL_24 - Novo Processamento
               // 1ª Passagem - Processa as Operações de Títulos com Cotações de Renda Fixa
               // 2ª Passagem - Processa todos os Investimentos
               //               SKipa os Títulos que tiverem TRC
               // 3ª Passagem - Processa as Atualizações dos Títulos que tiveram TRC

               //AL_24
               for iTipoProc := 0 to 2 do
               begin
                  pTipoProc := iTipoProc;
                  //AL_24 Ini
                  if iTipoProc = 2 then
                     pTipoProc := 3
                  else if (bReprocessa) and (iTipoProc = 0) then
                     pTipoProc := 2;

                  //AL_29
                  // Capta os saldos de acordo com as variáveis setadas anteriormente
                  if iTipoProc <> 2 then
                     RendaFixa.BuscaSaldos(dDataProc-1, -1, iInvestimento, iOperacaoAplic, iClasseTit, pTipoProc,false,iEmissor)
                  else // Para as TRC, pega os registro do próprio dia
                     RendaFixa.BuscaSaldos(dDataProc,   -1 ,iInvestimento, iOperacaoAplic, iClasseTit, pTipoProc,false,iEmissor);
                  //AL_24 Fim

                  dDataProcAnt := dDataProc;
                  //Ricardo Cristiano - 08/04/2011 - N. Sol 156208 -  N. Kintana 1224516
                  if ((iTipoProc = 0) and (DMRendaFixa.qryBuscaSaldosHist.FieldByName('DATAHISTRENFIX').AsDateTime > 0)) then
                     dDataProc := DMRendaFixa.qryBuscaSaldosHist.FieldByName('DATAHISTRENFIX').AsDateTime;

                  // Não troca as mensagens se a tabela de saldos do dia anterior não tiver dados
                  if (not DMRendaFixa.qryBuscaSaldosHist.IsEmpty) or
                     (iTipoProc = 1) then
                  begin
                     prbHistorico.Max := DMRendaFixa.qryBuscaSaldosHist.RecordCount;
                     prbHistorico.Position := 0;
                     lblDia.Caption := DateToStr(dDataProc);
                     //AL_36
                     //AL_37
                     frmFechtoRenFix.Update;
                  end;

                  while not DMRendaFixa.qryBuscaSaldosHist.EOF do
                  begin
                     // INICIO DA VERIFICAÇÃO E CRÍTICAS
                     // Se o Investimento é atualizado por Cotação de Renda Fixa
                     if (RendaFixa.CotaRenfix(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger)) then
                     begin
                        // Se Não for Dia Útil, passa para o próximo Investimento
                        if not DiasUteisInv.DiaUtil(dDataProc, -1, 1, '', True, False, False) then
                        begin
                           // Verificar se Há Pagamento de Juros na Data.
                           if not RendaFixa.VerificaFluxo(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                          DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                          dDataProc) then
                           begin
                              // Se o Investimento está marcado para reprocessamento DESMARCAR
                              RendaFixa.MarcaInvRep(dDataProc, //Thiago Passos SOL 39918 Kintana 523459
                                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                    -1,-1,'N');

                              DMRendaFixa.qryBuscaSaldosHist.Next;
                              prbHistorico.Position := prbHistorico.Position + 1;
                              //AL_36
                              //AL_37
                              frmFechtoRenFix.Update;
                              Continue;
                           end;
                        end
                        else
                        begin
                           //// Verifica se existe cotação para o Investimento, se não existir, ABORTA
                           //if not RendaFixa.ExisteCotacaoRF(DMRendaFixa.qryBuscaSaldosHistIDINVESTIMENTO.AsInteger,
                           //                          dDataProc,
                           //                          DMRendaFixa.qryBuscaSaldosOperVENCOPERACAO.AsDateTime,
                           //                          fPUCotRenFix) then
                           // Alteração a pedido da Funcef para deixar processar investimento
                           //   de cotação de renda fixa mesmo sem a cotação cadastrada.
                           // Também não emite aviso de qualquer espécie - 14/11/2003

                           // Verifica se existe cotação para o Investimento
                           if RendaFixa.ExisteCotacaoRF(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        dDataProc,
                                                        DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime,
                                                        fPUCotRenFix) then
                           begin
                              if (bReprocessa)and (iTipoProc = 1) then
                              begin
                                 //AL_32 - Ajuste para captar o Investimento e a Operação pelo SQL de saldo
                                 //AL_36
                                 sErro := RendaFixa.ExcluiATUeOPECotRenFix(DateToStr(dDataProc),
                                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                           DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                                 if Trim(sErro) <> '' then
                                    Raise Exception.Create('Não foi possível excluir algumas Operações de Títulos atualizados por Cotação.');
                              end;
                           end;
                        end;
                     end
                     else
                     begin
                        //AL_32 - Se o Título não atualiza na emissão ou, se atualiza e a DataProc não for a data de emissão
                        //AL_36
                        if not ((RendaFixa.AtuEmiss(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger)) and
                                   (DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime = dDataProc)) then
                        begin
                           if iTipoProc = 0 then
                           begin
                              DMRendaFixa.qryBuscaSaldosHist.Next;
                              prbHistorico.Position := prbHistorico.Position + 1;
                              //AL_36
                              //AL_37
                              frmFechtoRenFix.Update;
                              Continue;
                           end;
                        end;
                     end;

                     // Se o Investimento está vencido não atualiza mais
                     // AL_2 - 06/07/2004
                     // AL_5 - 27/08/2004 -  Poupança não tem vencimento
                     if (DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime < dDataProc) and
                        (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').IsNull) then
                     begin
                        //Deletar Históricos e Cadastro de Operações
                        //  Pode ter sido repactuado
                        //AL_15
                        //AL_20 - Não pode excluir o próprio dia do vencimento (Pode ter fluxo no dia)
                        //AL_29
                        //AL_36
                        if not RendaFixa.ExcluiHistRenFix((DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime),
                                                          False, -1,
                                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                          False,False, nil,False) then
                           Raise Exception.Create('Não foi possível excluir Movimentação Posterior');
                        // AL_15 - Fim
                        RendaFixa.MarcaInvRep(dDataProc, //Thiago Passos SOL 39918 Kintana 523459
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              -1,-1,'N');
                        DMRendaFixa.qryBuscaSaldosHist.Next;
                        prbHistorico.Position := prbHistorico.Position + 1;
                        //AL_36
                        //AL_37
                        frmFechtoRenFix.Update;
                        Continue;
                     end;
                     // AL_2 - Fim

                     //AL_24 Ini
                     // Skipa as atualizações dos títulos que tiverem TRC no dia para ser feita na 3ª Passagem
                     if (iTipoProc = 1) and
                        (RendaFixa.ExisteTRCnoDia(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                  DateToStr(dDataProc))) then
                     begin
                        // Deletar Históricos e Cadastro de Operações  -----------------------
                        //AL_29
                        //AL_36
                        if not RendaFixa.ExcluiHistRenFix(dDataProc,
                                                          True,
                                                          -1,
                                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                          False,False, nil,False) then
                           Raise Exception.Create('Não foi possível excluir movimentações posteriores de ' + #13 +
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                        RendaFixa.MarcaInvRep(dDataProc,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              -1,-1,'N');

                        DMRendaFixa.qryBuscaSaldosHist.Next;
                        prbHistorico.Position := prbHistorico.Position + 1;
                        //AL_36
                        //AL_37
                        frmFechtoRenFix.Update;
                        Continue;
                     end;
                     //AL_24 Fim

                     // Inicia a Transacao (por Investimento)
                     if not DtmBaseDados.dbBaseDados.InTransaction Then
                        DtmBaseDados.dbBaseDados.StartTransaction;

                        // Abre a query Temporária
                     DMRendaFixa.qryTempHistCalc.Open;
                     DMRendaFixa.qryTempItensCalc.Open;

                     //AL_36
                     lblInvestimento.Caption := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SIGLAEMISSOR').AsString + ' - ' +
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString + ' - ' +
                                                DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsString;
                     //AL_27
                     //AL_36
                     lblPlanoPatro.Caption := qryPlano.Lookup('IDPLANPREVCTBPATR', DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger, 'PLANPRVCONTABPATRO');

                     //AL_36
                     //AL_37
                     frmFechtoRenFix.Update;

                     //AL_36
                     sHistorico := RendaFixa.MontaHistorico(qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                                            qryTipoOperacao.FieldByName('SIGLATIPOOPER').AsString,
                                                            qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString,
                                                            DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                        // Verifica se o Investimento Já está Calculado
                     //AL_36
                     RendaFixa.BuscaSaldosAux(dDataProc,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              iTipoProc,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDHISTRENFIX').AsInteger);

                     // Executa Reprocessamento do Investimento
                     if not DMRendaFixa.qryBuscaSaldosHistAux.IsEmpty then
                     begin
                        //AL_36
                        if not DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('PLNCODIGO').IsNull then
                           iPlanilha := DMRendaFixa.qryBuscaSaldosHistAux.FieldByName('PLNCODIGO').AsInteger
                        else
                           iPlanilha := -1;

                        iIdHistRenFix := 0;

                        //AL_28
                        //AL_36
                        if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDTIPOOPERACAO').AsInteger = -166) or    // Bloqueio de Penhora
                           (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDTIPOOPERACAO').AsInteger = -167) then  // Desbloqueio de Penhora
                           fQtdOperacao := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat
                        else
                           fQtdOperacao := DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat;

                        // Grava Histórico na base temporária
                        //AL_36
                        if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIX').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         qryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                         iPlanilha {-1},
                                                         -1,
                                                         dDataProc,
                                                         //AL_28
                                                         fQtdOperacao,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                                         0,
                                                         0,
                                                         'ATU',
                                                         qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                                         sHistorico,
                                                         True,
                                                         DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger,
                                                         //AL_21
                                                         '',
                                                         DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger) then
                           Raise Exception.Create('Não foi possível gravar registros temporários de Histórico de' + #13 +
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                        // Verifica se o Investimento é Poupança
                        //AL_36
                        if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger <> CtrlPInv.IdClassePoup) and
                           (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger <> CtrlPInv.IdClassPoupBloq) then
                        begin
                           // Calcula Itens de Investimento que NÂO seja Poupança
                           // Busca o Último Aniversário
                           //AL_36
                           dDataAniv := RendaFixa.BuscaUltimoAniv(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime,
                                                                  dDataProc,
                                                                  DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATALEILAO').AsDateTime);

                           idForCli := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger;

                           //AL_19 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
                           uRendaFixa.AtualizaProcFech := AtualizaProg;

                           // Gravar os Itens na base temporária
                           //AL_11
                           //AL_19
                           //AL_34
                           //AL_36
                           if not RendaFixa.CalculaItensAtu(iIdHistRenFix,
                                                            qryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger,
                                                            qryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger,
                                                            DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                                            qryTipoOperacao.FieldByName('CODTIPDOC').AsInteger,
                                                            dDataProc,
                                                            DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime,
                                                            dDataAniv,
                                                            'N',
                                                            qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString,
                                                            sHistorico,
                                                            iPlanilha,iDocumento,
                                                            True,
                                                            bPassoPasso) then
                              Raise Exception.Create('Não foi possível gravar registros temporários de Itens de Histórico de' + #13 +
                                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                           // AL_19 - Limpa o evento AtualizaProcFech da unit RendaVariavel
                           uRendaFixa.AtualizaProcFech := nil;
                        end
                        else
                        // Calcula Itens de Investimento de Poupança
                        begin
                           // Busca o Saldo do Último Aniversário desta Aplicação em Poupança
                           //AL_36
                           dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                                          dDataProc);

                           dDataTR := RendaFixa.BuscaUltimoTRPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                                      dDataProc);

                           // Busca Saldos da Poupança na data do último Aniversário
                           //AL_31 - Se a dDataAniv for anterior a data da TRC, traz a data da TRC
                           //AL_36
                           if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
                              (dDataAniv < DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
                           begin
                              //AL_36
                              //AL_31
                              RendaFixa.BuscaSaldosPoup(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq,
                                              pTipoProc);
                           end
                           else
                           begin
                              //AL_31
                              //AL_33
                              //AL_36
                              //A aplicação original deve buscar a data de aniversário
                              RendaFixa.BuscaSaldosPoup(dDataAniv, DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                        CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq);
                           end;

                           // Buscar o total dos resgates no período
                           //AL_9
                           //AL_25
                           //AL_31 - Se a dDataAniv for anterior a data da TRC, traz a data da TRC
                           //AL_36
                           if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
                              (dDataAniv < DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
                           begin
                              RendaFixa.BuscaTotResgPoup(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime, dDataProc,
                                                         fTotResgPoup, fTotQtdPoup, fTotVlrTRCPoup, fTotQtdTRCPoup,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        'ATU',
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           end
                           else
                           begin
                              RendaFixa.BuscaTotResgPoup(dDataAniv, dDataProc,
                                                         fTotResgPoup, fTotQtdPoup, fTotVlrTRCPoup, fTotQtdTRCPoup,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         'ATU',
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           end;

                           //AL_36
                           idForCli := DMRendaFixa.qryBuscaSaldosOperPoup.FieldByName('IDFORCLI').AsInteger;

                           //AL_19 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
                           uRendaFixa.AtualizaProcFech := AtualizaProg;

                           //Gravar os Itens na base temporária
                           //AL_11
                           //AL_26 Ini
                           //AL_36
                           if (CtrlPInv.FlgPoupaPropDia = 'N') then // Atualização no Aniversário
                              fSaldoFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat
                           else
                           begin
                              //AL_25 - O saldo a ser atualizado na ponta de destino e  o valor transferido
                              if DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXORIG').IsNull then
                                 fSaldoFinal := (DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat - fTotResgPoup)
                              else
                                 fSaldoFinal := fTotVlrTRCPoup - fTotResgPoup;
                           end;
                           //AL_26 Fim

                           //AL_34
                           //AL_36
                           if not RendaFixa.CalculaItensAtuPoup(iIdHistRenFix,
                                                                qryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger,
                                                                qryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger,
                                                                DMRendaFixa.qryBuscaSaldosOperPoup.FieldByName('IDFORCLI').AsInteger,
                                                                qryTipoOperacao.FieldByName('CODTIPDOC').AsInteger,
                                                                fSaldoFinal,
                                                                dDataProc,
                                                                dDataProc,
                                                                dDataAniv,
                                                                dDataTR,
                                                                'N',
                                                                qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString,
                                                                sHistorico,
                                                                iPlanilha,iDocumento,
                                                                True,
                                                                bPassoPasso) then
                              Raise Exception.Create('Não foi possível gravar registros temporários de Histórico de ' + #13 +
                                                     DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('DESCINVESTIMENTO').AsString);

                           // AL_19 - Limpa o evento AtualizaProcFech da unit RendaVariavel
                           uRendaFixa.AtualizaProcFech := nil;
                        end;

                        // AL_19 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
                        uRendaFixa.AtualizaProcFech := AtualizaProg;

                        // Compara Valores da Base Temporária com os Registros Existentes e:
                        //         Despresa ou Exclui, Grava e Contabiliza quando necessário
                        //AL_36
                        sErro := RendaFixa.AtualizaRecalculo(dDataProc, iPlanilha, iDocumento, iIdHistRenFix); //, prbAguarde);
                        if Trim(sErro) <> '' then
                           Raise Exception.Create('Não foi possível atualizar o recálculo dos itens de ' + #13 +
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                        // Na AtualizaRecalculo desmarca o dia anterior deste investimento
                        //   e marca o atual provisoriamente até que finalize o processo,
                        //   afim de continuar o reprocessamento em caso de problemas que
                        //   abortem o processo no meio

                        // AL_19 - Limpa o evento AtualizaProcFech da unit RendaVariavel
                        uRendaFixa.AtualizaProcFech := nil;

                        // Término do Reprocessamento do Investimento
                     end
                     else
                     begin
                        // Investimento não Calculado - Processamento Normal

                        // Exclui as Operaçõe marcadas com FLGREPROC = 'S'
                        //AL_36
                        RendaFixa.ExcluiOpeAntecipada(dDataProc,
                                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      -1);

                        iIdHistRenFix  := LeUltRegistro(nil, 'HISTRENFIX');
                        //AL_21
                        //AL_36
                        if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIX').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         qryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                         -1,
                                                         -1,
                                                         dDataProc,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                                         0,
                                                         0,
                                                         'ATU',
                                                         qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                                         sHistorico,
                                                         False,
                                                         -1,-1,'',
                                                         DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger) then
                           Raise Exception.Create('Não foi possível gravar o Histórico de' + #13 +
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                        // Verifica se o Investimento é de Poupança
                        //AL_36
                        if (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger <> CtrlPInv.IdClassePoup) and
                           (DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCLASSETIT').AsInteger <> CtrlPInv.IdClassPoupBloq) then
                        begin
                           // Calcula Itens de Investimento que NÂO sejam Poupança
                           // Busca o Último Aniversário
                           //AL_36
                           dDataAniv := RendaFixa.BuscaUltimoAniv(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                                  dDataProc,
                                                                  DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATALEILAO').AsDateTime);

                           idForCli := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger;

                           //AL_19 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
                           uRendaFixa.AtualizaProcFech := AtualizaProg;

                           // Gravar os Itens na Base Definitiva
                           //AL_11
                           //AL_19
                           //AL_34
                           //AL_36
                           if not RendaFixa.CalculaItensAtu(iIdHistRenFix,
                                                            qryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger,
                                                            qryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger,
                                                            DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger,
                                                            qryTipoOperacao.FieldByName('CODTIPDOC').AsInteger,
                                                            dDataProc,
                                                            DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime,
                                                            dDataAniv,
                                                            'N',
                                                            qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString,
                                                            sHistorico,
                                                            iPlanilha,iDocumento,
                                                            False,
                                                            bPassoPasso) then
                              Raise Exception.Create('Não foi possível calcular os Itens de ' + #13 +
                                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                           // AL_19 - Limpa o evento AtualizaProcFech da unit RendaVariavel
                           uRendaFixa.AtualizaProcFech := nil;
                        end
                        else
                        // Calcula Itens de Investimento de Poupança
                        begin
                           // Busca a data do Último Aniversário desta Aplicação em Poupança
                           // Para TRC buscar o Aniversario da Aplicação Origem
                           //AL_36
                           dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                                          dDataProc);

                           dDataTR := RendaFixa.BuscaUltimoTRPoupanca(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                                      DMRendaFixa.qryBuscaSaldosHist.FieldByName('CARENCIA').AsInteger,
                                                                      dDataProc);

                           // Busca Saldos da Poupança na data do último Aniversário
                           //AL_31 - Se a dDataAniv for anterior a data da TRC, traz a data da TRC
                           //AL_36
                           if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
                              (dDataAniv < DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
                           begin
                              //AL_36
                              //AL_31
                              RendaFixa.BuscaSaldosPoup(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime,
                                                        DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                        CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq,
                                                        pTipoProc);
                           end
                           else
                           begin
                              //AL_31
                              //AL_33
                              //AL_36
                              //A aplicação original deve buscar a data de aniversário
                              RendaFixa.BuscaSaldosPoup(dDataAniv, DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                        CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq);
                           end;

                           //AL_9
                           //AL_25
                           //AL_31
                           //AL_36
                           // Buscar o total dos resgates no período
                           // Para TRC buscar também as TRC
                           if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
                              (dDataAniv < DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime) then
                           begin
                              RendaFixa.BuscaTotResgPoup(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAO').AsDateTime, dDataProc,
                                                         fTotResgPoup, fTotQtdPoup, fTotVlrTRCPoup, fTotQtdTRCPoup,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         'ATU',
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           end
                           else
                           begin
                              RendaFixa.BuscaTotResgPoup(dDataAniv, dDataProc,
                                                         fTotResgPoup, fTotQtdPoup, fTotVlrTRCPoup, fTotQtdTRCPoup,
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         'ATU',
                                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           end;

                           //AL_36
                           idForCli := DMRendaFixa.qryBuscaSaldosOperPoup.FieldByName('IDFORCLI').AsInteger;

                           // AL_19 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
                           uRendaFixa.AtualizaProcFech := AtualizaProg;

                           // Gravar os Itens na Base Definitiva
                           // AL_11
                           //AL_25 - O saldo a ser atualizado na ponta de destino e  o valor transferido
                           //AL_26 Ini
                           //AL_36
                           if (CtrlPInv.FlgPoupaPropDia = 'N') then // Atualização no Aniversário
                              fSaldoFinal := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat // Nâo preciso ver o que teve de resgate(Testar Isto)
                           else
                           begin
                              //AL_25 - O saldo a ser atualizado na ponta de destino e  o valor transferido
                              //AL_36
                              if DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXORIG').IsNull then
                                 fSaldoFinal := (DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat - fTotResgPoup)
                              else
                                 fSaldoFinal := fTotVlrTRCPoup - fTotResgPoup;
                           end;
                           //AL_26 Fim

                           //AL_34
                           //AL_36
                           if not RendaFixa.CalculaItensAtuPoup(iIdHistRenFix,
                                                                qryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger,
                                                                qryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger,
                                                                DMRendaFixa.qryBuscaSaldosOperPoup.FieldByName('IDFORCLI').AsInteger,
                                                                qryTipoOperacao.FieldByName('CODTIPDOC').AsInteger,
                                                                fSaldoFinal,
                                                                dDataProc,
                                                                dDataProc,
                                                                dDataAniv,
                                                                dDataTR,
                                                                'N',
                                                                qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString,
                                                                sHistorico,
                                                                iPlanilha,iDocumento,
                                                                False,
                                                                bPassoPasso) then
                              Raise Exception.Create('Não foi possível calcular os Itens de ' + #13 +
                                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

                           // AL_19 - Limpa o evento AtualizaProcFech da unit RendaVariavel
                           uRendaFixa.AtualizaProcFech := nil;
                        end;

                        // Desmarca o dia anterior e marca o dia atual para Reprocessamento
                        if dDataProc <> StrToDate(dtInicio.Text) then
                        begin
                           // Não desmarca dia anterior ao primeiro dia
                           //AL_36
                           RendaFixa.MarcaInvRep(dDataProc, //Thiago Passos SOL 39918 Kintana 523459
                                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                 -1,-1,'N');
                        end;
                           //AL_36
                         {  RendaFixa.MarcaInvRep(dDataProc,
                                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                          }
                        // Término do Processamento do Investimento
                     end;

                     // Caso seja a data final de Processamento, desmarca o
                     //   flag de reprocessamento
                     if dDataProc = dDataFinal then //Thiago Passos SOL 39918 Kintana 523459
                     begin
                        //AL_36
                        RendaFixa.MarcaInvRep(dDataProc,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                              -1,-1,'N');
                     end;

                     // AL_19 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
                     uRendaFixa.AtualizaProcFech := AtualizaProg;

                     // Nova Rotina de Contabilização
                     //AL_36
                     RendaFixa.ContabilizaAtu(dDataProc,
                                              sHistorico,
                                              iIdHistRenFix,
                                              qryTipoOperacao.FieldByName('FLGGERACONTAB').AsInteger,
                                              qryTipoOperacao.FieldByName('FLGGERACAPCAR').AsInteger,
                                              idForCli, iPlanilha, iDocumento);

                     // AL_19 - Limpa o evento AtualizaProcFech da unit RendaVariavel
                     uRendaFixa.AtualizaProcFech := nil;

                     //AL_30
                     //AL_36
                     if CtrlPInv.IntFinContabRF = 'S' then
                     begin
                        //AL_36
                        if iPlanilha = -1 then
                           Raise Exception.Create('Nenhuma contabilização foi efetuada para ' + #13 +
                                                  DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);
                     end;

                     // Reinicializa as variáveis para contabilização em planilhas separados por Investimento
                     //AL_30
                     //AL_36
                     if CtrlPInv.IntFinContabRF = 'S' then
                     begin
                        iPlanilha := -1;
                        iDocumento := -1;
                     end;

                     // Caso não seja Depuração, comita o Investimento
                     if cbxDepurar.Checked = False then
                        if DtmBaseDados.dbBaseDados.InTransaction Then
                           DtmBaseDados.dbBaseDados.Commit;

                     // Próximo Investimento
                     //AL_36
                     DMRendaFixa.qryBuscaSaldosHist.Next;

                     // Move Barra de Progresso de Investimentos
                     prbHistorico.Position := prbHistorico.Position + 1;
                     //AL_36
                     prbHistorico.Repaint;
                     //AL_37
                     frmFechtoRenFix.Update;

                     //AL_36
                     if not EmProcesso then
                        Raise Exception.Create('Processo interrompido pelo usuário');

                  end;

//                  try //Except
                     // Inicia a Transacao do Relançamento de Operações
                     if not DtmBaseDados.dbBaseDados.InTransaction Then
                        DtmBaseDados.dbBaseDados.StartTransaction;

                     // Testa de existem Operações para refazer o Histórico das Operações do dia
                     OperComum.LimpaParametros(DMRendaFixa.qryExisteOperacoes);
                     DMRendaFixa.qryExisteOperacoes.ParamByName('dDataProc').AsString := DateToStr(dDataProc);
                     if Trim(dblkInvestimento.Text) <> '' then
                     begin
                        DMRendaFixa.qryExisteOperacoes.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
                        DMRendaFixa.qryExisteOperacoes.ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperacaoAplic;
                     end;
                     // Passa a refazer sempre - 27/08/2003
                     // Refaz também operações de Fluxo (Amortização, juros...)
                     // AL_36 - Retirado o parâmetro
                     // DMRendaFixa.qryExisteOperacoes.ParamByName('REPROCESSO').AsInteger := 1;
                     DMRendaFixa.qryExisteOperacoes.Open;
                     bErro := False;

                     // AL_19 - Usa o Progressbar
                     prbAguarde.Max := DMRendaFixa.qryExisteOperacoes.RecordCount;
                     prbAguarde.Position := 0;

                     while not DMRendaFixa.qryExisteOperacoes.Eof do
                     begin
                        // AL_27 - Ini
                        // Se houver TRC, na 2ª passagem só regera operações de TRC, as outras são geradas na 3ª passagem
                        if ((RendaFixa.ExisteTRCnoDia(DMRendaFixa.qryExisteOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      DMRendaFixa.qryExisteOperacoes.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                      DateToStr(dDataProc)) and
                            (iTipoProc = 1) and
                            (DMRendaFixa.qryExisteOperacoes.FieldByName('TIPOMOVTO').AsString <> 'TRC')))then
                        begin
                           DMRendaFixa.qryExisteOperacoes.Next;
                           prbAguarde.StepIt;
                           Continue;
                        end;
                        //AL_27 - Fim

                        // AL_19
                        lblMensagem.Caption := 'Relançando Operações ';
                        //AL_36
                        sErro := RendaFixa.RefazOperacoes(DMRendaFixa.qryExisteOperacoes.FieldByName('FLGGERACONTAB').AsInteger,
                                                DMRendaFixa.qryExisteOperacoes.FieldByName('IDOPERRENFIX').AsInteger,
                                                dDataAniv, 0, 0,
                                                iPlanilha, iDocumento,
                                                DMRendaFixa.qryExisteOperacoes.FieldByName('FLGCONTAINVEST').AsInteger);
                        if Trim(sErro) <> '' then
                           Raise Exception.Create('Não foi possível relançar uma operação de' + #13 +
                                                  DMRendaFixa.qryExisteOperacoes.FieldByName('DESCTIPOOPERACAO').AsString + #13 +
                                                  'de ' + #13 +
                                                  DMRendaFixa.qryExisteOperacoes.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                                  'Mensagem: ' + sErro);

                        // AL_1 - 01/06/2004 - Desmarca o Investimento caso seja Último Dia.
                        if dDataProc = dDataFinal Then //Thiago Passos SOL 39918 Kintana 523459
                        begin
                           //AL_24
                           //AL_36
                           // Se teve TRC no dia nâo desmarca o reproc para refazer a atu após a TRC
                           if not ((iTipoProc = 1) and
                                   (RendaFixa.ExisteTRCnoDia(DMRendaFixa.qryExisteOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                                             DMRendaFixa.qryExisteOperacoes.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                             DateToStr(dDataProc)))) then
                              RendaFixa.MarcaInvRep(dDataProc,
                                                    DMRendaFixa.qryExisteOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    DMRendaFixa.qryExisteOperacoes.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                    -1,-1,'N');
                        end;
                        // AL_1 - Fim
                        DMRendaFixa.qryExisteOperacoes.Next;
                        // AL_19
                        prbAguarde.StepIt;
                        //AL_36
                        prbAguarde.Repaint;
                        //AL_37
                        tbsProcesso.UpDate;
                        frmFechtoRenFix.Invalidate;

                        if not EmProcesso then
                           Raise Exception.Create('Processo Interrompido pelo usuário');

                     end;
                     DMRendaFixa.qryExisteOperacoes.Close;

                     // AL_19 - Zera o ProgressBar
                     prbAguarde.Max := 100;
                     prbAguarde.Position := 0;

                     //AL_36
                     // Commit do relançamento das operações
                     if cbxDepurar.Checked = False then
                     begin
                        if DtmBaseDados.dbBaseDados.InTransaction Then
                           DtmBaseDados.dbBaseDados.Commit;
                     end;
//                  except
//                     bErro := True;
//                     Raise;
//                  end;

                  // 1ª Passagem - Processa as Operações de Inv. com Cotações de Renda Fixa
                  // 2ª Passagem - Processa todos os investimentos
                  if iTipoProc = 0 then
                     dDataProc := dDataProcAnt;
               end;

               // Se Não é Depuração e Não houve erro na inclusão automática de operações
               if (cbxDepurar.Checked = False) and (not bErro) then
               begin
                  // Atualizar a tabela de parametros e o pRPI
                  //AL_36
                  if dDataProc > CtrlPInv.DataUltFechRF then
                        RendaFixa.AlteraDataFechRF(dDataProc);
               end
               else
               begin
                  OperComum.LimpaParametros(qryHistRenfix);
                  qryHistRenfix.ParamByName('IDHISTRENFIX').AsInteger := iIdHistRenFix;
                  qryHistRenfix.Open;
                  bbtnCommita.Enabled := False;
                  bbtnCancelar.Enabled := False;
                  bbtnConfirmar.Enabled := True;
               end;

               // Incrementa data de processamento
               dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc,-1,1,'',True,False,False); //Thiago Passos SOL 39918 Kintana 523459
               prbDatas.Position := prbDatas.Position + 1;
               //AL_36
               prbDatas.Repaint;
               //AL_37
               frmFechtoRenFix.Update;

               //AL_36
               if not EmProcesso then
                  Raise Exception.Create('Processo Interrompido pelo usuário');

            except
               on E: Exception do
               begin
                  MsgDlg('Ocorreu problema ao Atualizar os Investimentos.' + #13 +
                         E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);

                  //AL_36
                  if DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Rollback;
                  StatusNormal;
                  RendaFixa.GravaEmAbertura('N');
                  Timer.Enabled := False;
                  //AL_37
                  uRendaFixa.AtualizaProcFech := nil;

                  // Remarca os Investimentos que por ventura estivessem marcados
                  //  antes do erro ocorrer
                  if not DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.StartTransaction;

                  //AL_36
                  //Thiago Passos SOL 39918 Kintana 523459
                  {DMRendaFixa.qryMarcadoReproc.First;
                  while not DMRendaFixa.qryMarcadoReproc.Eof do
                  begin
                     RendaFixa.MarcaInvRep(DMRendaFixa.qryMarcadoReproc.FieldByName('DATAHISTRENFIX').AsDateTime,
                                           DMRendaFixa.qryMarcadoReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                           DMRendaFixa.qryMarcadoReproc.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                     DMRendaFixa.qryMarcadoReproc.Next;
                  end;
                  }
                  if DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Commit;

                  Exit;
               end;
            end;
         end;
         // AL_7 -  29/09/2004 - Evita Loop Eterno
         if cbxDepurar.Checked then
            Break;
         //AL_36
         if bPrimeiro then
            bPrimeiro := False
         else
            DMRendaFixa.qryMarcadoReproc.Next;
         //AL_24 Ini // A TRC Destino fica marcada para reprocessar após a abertura da qryMarcadoReproc
         //AL_36
         if  DMRendaFixa.qryMarcadoReproc.Eof then  // Reabre para pegar o que as TRC marcadas durante o processo
         begin
            DMRendaFixa.qryMarcadoReproc.Close;
            DMRendaFixa.qryMarcadoReproc.Open;
         end;
         //AL_24 Ini

         //AL_36
         if not EmProcesso then
         begin
            MsgDlg('Processo Interrompido pelo usuário.', 'Mensagem do Sistema ', mtInformation,[mbOK],0);
            Break;
         end;

      until DMRendaFixa.qryMarcadoReproc.Eof;

      Timer.Enabled := False;
      //AL_37
      lblTempo.Caption := 'Tempo de processamento: ' + TimeToStr(Now - hHoraIni);
      lblTempo.Repaint;
      frmFechtoRenFix.Update;

      if cbxDepurar.Checked = False then
      begin
         // AL_3 - Controle do processo de abertura
         // Desgrava o parametro de EmAbertura
         // AL_8
         RendaFixa.GravaEmAbertura('N');
         MsgDlg('Processo concluído com sucesso.', 'Mensagem do Sistema ',
                mtConfirmation,[mbOK],0);
         bbtnCommita.Click;
      end;
      //AL_37
   finally
      //AL_3 - Controle do processo de abertura
      //AL_4 - 12/08/2004
      //AL_8
      //AL_27
      //AL_34
      //AL_36
      //AL_37
      EmProcesso := False;

      // Desgrava o parametro de EmAbertura
      if cbxDepurar.Checked = False then
         RendaFixa.GravaEmAbertura('N');

      // Para o Contador
      Timer.Enabled := False;
      lblTempo.Repaint;
      frmFechtoRenFix.Update;

      // Fecha as queries utilizadas no processamento, inclusive as do BuscaSaldos
      DMRendaFixa.qryMarcadoReproc.Close;
      DMRendaFixa.qryExisteOperacoes.Close;

      //Fehca as queries abertas pelos processos de busca de saldos e operação
      RendaFixa.FechaBuscaSaldos;
      RendaFixa.FechaBuscaSaldosAux;
      RendaFixa.FechaBuscaSaldosPoup;
      RendaFixa.FechaBuscaOperacao;

      DMRendaFixa.qryAux.Close;
      qryPlano.Close;
      FreeAndNil(qryPlano);
   end;
end;

procedure TfrmFechtoRenFix.bbtnCommitaClick(Sender: TObject);
begin
   inherited;
   if DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Commit;
   bbtnCommita.Enabled := False;
   //AL_36
   dtInicio.Text := DateToStr(CtrlPInv.DataUltFechRF + 1);
   dtFinal.Text  := dtInicio.Text;
   StatusNormal;
   // AL_8
   RendaFixa.GravaEmAbertura('N');
end;

procedure TfrmFechtoRenFix.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   StatusNormal;
   // AL_8
   RendaFixa.GravaEmAbertura('N');
end;

procedure TfrmFechtoRenFix.StatusNormal;
begin
   bbtnCommita.Enabled := False;   // Ok
   bbtnCancelar.Enabled := False;  // Cancela
   bbtnConfirmar.Enabled := True;  // Processa

   //AL_34
   pnlDatas.Enabled := True;
   tbsProcesso.Enabled := True;

   lblDia.Caption := '';
   lblInvestimento.Caption := '';
   //AL_27
   lblPlanoPatro.Caption := '';

   prbDatas.Position := 0;
   prbHistorico.Position := 0;

   //AL_36
   prbaguarde.Position := 0;
   lblMensagem.Caption := '';
end;

//AL_34
procedure TfrmFechtoRenFix.StatusProc;
begin
   bbtnCommita.Enabled := False;    // Ok
   bbtnCancelar.Enabled := False;   // Cancela
   bbtnConfirmar.Enabled := False;  // Processa

   pnlDatas.Enabled := False;
   tbsProcesso.Enabled := False;
end;

//AL_36
function TfrmFechtoRenFix.VerificaLiquidacaoFluxos(dDataProc: TDateTime; iClasse: Integer = -1; iInv: Integer = -1;iEmissor:integer=-1):boolean;
begin
   Result := True;
   if not cbxDepurar.Checked then // Somente Verifica se não estiver em Depurando
   begin
      //AL_36
      try
         // Busca os fluxos existentes para a data de referência
         //AL_36
         if iInv = -1 then
            if Trim(dblkInvestimento.Text) <> '' then
               iInv := StrToInt(dblkInvestimento.LookupValue);
         if iClasse = -1 then
            if Trim(dblkClasseTit.Text) <> '' then
               iClasse := StrToInt(dblkClasseTit.LookupValue);
         OperComum.LimpaParametros(qryBuscaFluxos);
         //AL_36
         if iInv <> -1 then    //Thiago Passos 01/07/2009
            qryBuscaFluxos.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
         if iClasse <> -1 then   //Thiago Passos 01/07/2009
            qryBuscaFluxos.ParamByName('IDCLASSETIT').AsInteger := iClasse;
         if iEmissor <> -1 then
            qryBuscaFluxos.ParamByName('IDEMISSOR').AsInteger := iEmissor;
         qryBuscaFluxos.ParamByName('dDataRef').AsString := DateToStr(dDataProc);
         qryBuscaFluxos.Open;
         while not qryBuscaFluxos.Eof do
         begin
            // Busco as aplicações do investimento
            OperComum.LimpaParametros(qryOperAplic);
            qryOperAplic.ParamByName('IDINVESTIMENTO').AsInteger := qryBuscaFluxos.FieldByName('IDINVESTIMENTO').AsInteger;
            qryOperAplic.ParamByName('dDataRef').AsString := DateToStr(dDataProc);
            qryOperAplic.Open;
            while not qryOperAplic.Eof do
            begin
               OperComum.LimpaParametros(qryOperXFluxo);
               with qryOperXFluxo do
               begin
                  qryOperXFluxo.ParamByName('dDataRef').AsString := DateToStr(dDataProc);
                  qryOperXFluxo.ParamByName('IDINVESTIMENTO').AsInteger := qryBuscaFluxos.FieldByName('IDINVESTIMENTO').AsInteger;
                  //AL_36 - Ini
                  if qryBuscaFluxos.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperPagtoJuros then
                     qryOperXFluxo.ParamByName('IDTIPOOPERACAO').AsInteger := -17
                  else if qryBuscaFluxos.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperaMortPrinc then
                     qryOperXFluxo.ParamByName('IDTIPOOPERACAO').AsInteger := -18
                  else if qryBuscaFluxos.FieldByName('IDITEMRENFIX').AsInteger = CtrlPInv.IdOperIncJuros then
                     qryOperXFluxo.ParamByName('IDTIPOOPERACAO').AsInteger := -19;
                  //AL_36 - Fim
                  qryOperXFluxo.ParamByName('IDOPERRENFIXAPLIC').AsInteger := qryOperAplic.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
                  Open;
                  if IsEmpty then
                  begin
                     // AL_4 - 12/08/2004
                     //Thiago Passos SOL 39918 Kintana 523459
                     MsgDlg('Falta executar a baixa do Fluxo de '+ qryBuscaFluxos.FieldByName('DESCITEMRENFIX').AsString +#13+
                            'Investimento : ' + qryBuscaFluxos.FieldByName('DESCINVESTIMENTO').AsString +
                            ' ' + qryOperAplic.FieldByName('DATAOPERACAO').AsString + #13+
                            'em '+ qryBuscaFluxos.fieldbyname('DataFluxoOriginal').asstring + #13 +
                            qryOperAplic.FieldByName('PLANPRVCONTABPATRO').AsString + '.' ,
                            'Mensagem do Sistema ',mtWarning,[mbOK],0);
                     Result := False;
                     Exit;
                  end;
               end;
               qryOperAplic.Next;
            end;
            qryBuscaFluxos.Next;
         end;
      finally
         qryOperAplic.Close;
         qryBuscaFluxos.Close;
         //AL_10
         qryOperXFluxo.Close;
      end;
   end;
end;

procedure TfrmFechtoRenFix.cbxDepurarClick(Sender: TObject);
begin
  inherited;
   if cbxDepurar.Checked then
   begin
      tbsDepurar.TabVisible := True;
      pgcProcesso.ActivePage := tbsDepurar;
      dtFinal.Text := dtInicio.Text;
      dtFinal.Enabled := False;
   end
   else
   begin
      tbsDepurar.TabVisible := False;
      dtFinal.Enabled := True;
   end;
end;

procedure TfrmFechtoRenFix.dblkEmissorCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     AbreInv;
end;

procedure TfrmFechtoRenFix.cbxPassoPassoClick(Sender: TObject);
begin
  inherited;
   if cbxPassoPasso.Checked then
      bPassoPasso := True
   else
      bPassoPasso := False;
end;

procedure TfrmFechtoRenFix.FormCreate(Sender: TObject);
begin
   inherited;
   // Reforçando o Padrão pois não estava carregando
   Icon := Application.Icon;
   //AL_28
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
end;

procedure TfrmFechtoRenFix.bbtnSairClick(Sender: TObject);
begin
   if not EmProcesso then
   begin
      inherited;
      if DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Rollback;
      // AL_8
      RendaFixa.GravaEmAbertura('N');
   end
   else
      EmProcesso := False;
end;

procedure TfrmFechtoRenFix.dtInicioExit(Sender: TObject);
begin
  inherited;
  //AL_36
  if dtInicio.DateTime < (CtrlPInv.DataUltFechRF + 1) then
  begin
     //AL_36
     dtFinal.DateTime := CtrlPInv.DataUltFechRF;
     dtFinal.Enabled := False;
  end
  else
     dtFinal.Enabled := True;
  AbreInv;
end;

procedure TfrmFechtoRenFix.dblkClasseTitCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     AbreInv;
end;

procedure TfrmFechtoRenFix.TimerTimer(Sender: TObject);
begin
   inherited;
   //AL_x
   lblTempo.Caption := 'Tempo de processamento: ' + TimeToStr(Now - hHoraIni);
   //AL_36
   //AL_x
   lblTempo.Repaint;
   frmFechtoRenFix.Update;
end;

function TfrmFechtoRenFix.FormatSecsToHMS(Secs: LongInt): string;
var Hrs, Min: Word;
begin
   Hrs := Secs div 3600;
   Secs := Secs mod 3600;
   Min := Secs div 60;
   Secs := Secs mod 60;

   if Hrs > 0 then
      Result := FormatFloat('#0',(Hrs/1)) + ':' + FormatFloat('00',(Min/1)) + ':' + FormatFloat('00',(Secs/1))
   else if Min > 0 then
      Result := FormatFloat('#0',(Min/1)) + ':' + FormatFloat('00',(Secs/1))
   else if Secs > 0 then
      Result := '0:' + FormatFloat('00',(Secs/1))
   else
      Result := '0';


end;

function TfrmFechtoRenFix.AbreInv: Boolean;
begin
   try
      OperComum.LimpaParametros(qryInvestimento);
      if Trim(dblkEmissor.Text) <> '' then
         qryInvestimento.ParamByName('IDEMISSOR').AsInteger := StrToInt(dblkEmissor.LookupValue);
      if Trim(dblkClasseTit.Text) <> '' then
         qryInvestimento.ParamByName('IDCLASSETIT').AsInteger := StrToInt(dblkClasseTit.LookupValue);
      if Trim(dtInicio.Text) <> '' then
         qryInvestimento.ParamByName('DATAINI').AsString := dtInicio.Text;
      qryInvestimento.Open;
      Result := True;
   except
      Result := False;
   end;
end;

// AL_19
procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
begin
   //AL_36
   if iMax = -2 then
   begin
      frmFechtoRenFix.lblMensagem.Visible := False;
      frmFechtoRenFix.prbAguarde.Visible := False;
   end
   else
   begin
      frmFechtoRenFix.lblMensagem.Visible := True;
      frmFechtoRenFix.prbAguarde.Visible := True;
   end;

   if sMsg <> '' then
      frmFechtoRenFix.lblMensagem.Caption := sMsg;

   if iMax > 0 then
   begin
      frmFechtoRenFix.prbAguarde.Max := iMax;
      frmFechtoRenFix.prbAguarde.Min := 0;
      frmFechtoRenFix.prbAguarde.Position := 0;
   end
   else
   if iMax = -1 then
      frmFechtoRenFix.prbAguarde.StepIt;

   frmFechtoRenFix.lblMensagem.Repaint;
   frmFechtoRenFix.prbAguarde.Repaint;
   frmFechtoRenFix.Update;
end;


procedure TfrmFechtoRenFix.SetEmProcesso(const Value: Boolean);
begin
  FEmProcesso := Value;
end;

end.



