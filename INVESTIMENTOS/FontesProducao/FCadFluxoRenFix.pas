//******************************************************************************
// SOL        : 39918
// Kintana    : 523459
// Data       : 10/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção de Indices em dias Uteis
//********************************************************************************************************
// Data	     : 02/06/2008
// Codigo    : AL_31
// Pendência : 28020
// SOL       :
// Função    : Ajuste na seleção do Plano Patrocinadora na marcação do título
//               para reprocessamento.
//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_30
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory - Retirada dos TField Persistentes
//                             Substituição por FieldByName
//********************************************************************************************************
// Data	     : 27/05/2008
// Codigo    : AL_29
// Pendência : 27960
// SOL       : 85996
// Função    : Ajuste na gravação dos itens de histórico da operação
//********************************************************************************************************
// Data	     : 14/11/2007
// Codigo    : AL_28
// Pendência : 26798
// SOL       : 72466
// Função    : Ajuste para a finalização dos documentos financeiros
//             Substituição do pRPI pelo objeto CtrlPInv
//********************************************************************************************************
// Data	     : 11/10/2007
// Codigo    : AL_27
// Pendência : 26506
// Função    : Ajuste no funcionamento das críticas da tela
//********************************************************************************************************
// Data	     : 11/10/2007
// Codigo    : AL_26
// Pendência : 26506
// Função    : Ajuste no funcionamento das críticas da tela
//             Ajuste na consulta as operações efetuadas
//********************************************************************************************************
// Data	     : 10/10/2007
// Codigo    : AL_25
// Pendência : 26496
// Função    : Ajuste na contabilização em 3 camadas (Lançamento Financeiro)
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_24
// Pendencia : 24774
// SOL       : 55877
// Desc      : Troca do FLGCONTABILIZA para o Especifico de Renda Fixa FLGINTCONTABRF
//******************************************************************************
// Data      : 08/03/2007
// Código    : AL_23
// Pendencia : 24684
// SOL       : 55289
// Desc      : Alteração para pegar a Quantidade de Saldo do Historio e não da
//             aplicação original.
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_22
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
// Data      : 17/08/2006
// Código    : AL_21
// Desc      : Ajuste na query do MontaSelect de Fluxo para prever operação na
//               mesma data do fluxo (Transferência entre Planos)
//******************************************************************************
// Data      : 17/08/2006
// Código    : AL_20
// Pendencia : 23008
// Desc      : Tratamento na data da Operação Original para trata o FlgContaInvest
//             para aplicações que sofreram TRC de Plano
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_19
// Pendencia : 22658
// SOL       : 44185
// Desc      : Função para verificar a falta do Histórico quando do lançamento
//             de operações de Baixa.
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_18
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_17
//Pendência  : 22480
//SOL        : 43633
//Função     : Alterações na Funcionalidade de Transferencia entre planos
//********************************************************************************************************
//Data	     : 16/05/2006
//Codigo     : AL_16
// Pendência : 21650 e 20988
// SOL       : 40682
//Função     : Acerto no qry do Botao Procurar para trazer o campo DATALIQUIDACAO para substituicao do VENCOPERACAO
//********************************************************************************************************
//Data	     : 12/05/2006
//Codigo     : AL_15
// Pendência : 20998
// SOL       : 33803
//Função     : Alterado a descrição das data - para vencimento onde se encontra data da operação -
//             e data da liquidação onde se encontra vencimento.
//********************************************************************************************************
//Data	     : 15/03/2006
//Codigo     : AL_14
// Pendência : 21650 e 20988
// SOL       : 40682
//Função     : Implementação do Campo Data de Liquidação para substituicao do VENCOPERACAO
//********************************************************************************************************
//Data	    :  20/02/2006
//Codigo    :  AL_13
//Função    :  Acerto na Gravação do Item de Juros após o pagamento de juros
//********************************************************************************************************
//Data	    :  14/11/2005
//Codigo    :  AL_12
//Função    :  Passa a diminuir o valor do juros nos itens -5 e -6 (Vlr Bruto e Líquido)
//********************************************************************************************************
//Data	    :  10/10/2005
//Codigo    :  AL_11
//Função    :  Retirado da filtragem de IDPLANPREVCTBPATR para trazer todos os Planos/Patro independente da
//             variável Global;
//********************************************************************************************************
//Data	    :  20/05/2005
//Codigo    :  AL_10
//Função    :  Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
//Data	    :  23/04/2005
//Codigo    :  AL_9
//Função    :  Alterações para Calcular e Gravar o Vlr do Item e o Valor Acumulado do
//             Item na HISTRENFIXXITENS
//********************************************************************************************************
// Data     : 03/01/2005
// Código   : AL_8
// Motivo   : Insere valores tb nos componentes pois se o texto do componente estiver selecionado
//            o valor de qryXXXX não é alterado na volta do BuscaFluxo
//********************************************************************************************************
// Data     : 22/10/2004
// Código   : AL_7
// Motivo   : Acerto DEFINITIVO na MSBuscaFluxo.Filtros quando existem mais de 01 fluxo de
//            pagamento (Amort/Pg.Juro/Inc.Juros) de um título no memsmo dia
//********************************************************************************************************
// Data     : 28/09/2004
// Código   : AL_6
// Motivo   : Implementacao do paramentro FlgContaInvest (CPMF)
//********************************************************************************************************
// Data     : 12/08/2004
// Código   : AL_5
// Motivo   : O Recebimento de Juros Volta a abater o saldo
//********************************************************************************************************
// Data     : 10/08/2004
// Código   : AL_4
// Motivo   : Passa a gravar todos os itens do histórico
//********************************************************************************************************
// Data     : 04/08/2004
// Código   : AL_3
// Motivo   : Controle do processo de abertura
//********************************************************************************************************
//Data    : 06/07/2004
//Código  : AL_2
//Função  : MSBuscaFluxo passa a buscar fluxos multiplos na mesma data
//                       Alterado no DFM a query do componente
//********************************************************************************************************
//Data    : 15/06/2004
//Código  : AL_1
//Função  : Não volta mais a data de abertura, marca o Investimento para ser
//            reprocessado mais tarde
//*******************************************************************************
unit FCadFluxoRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, StdCtrls, wwdblook, CmEventosCadastro, ImgList, Db,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, uCMMath,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, uCtrlInvContab {$IFNDEF VER0505}, uCMTypes {$ENDIF},
  Mask, wwdbedit, ComCtrls, wwriched, DBCtrls, uCtrlParamInvest;

type
  TTipoOper = set of (Aplicacao,Exclusao);

  TfrmCadFluxoRenFix = class(TfrmCadastroCSInv)
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoSIGLATIPOOPER: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDEMISSOR: TFloatField;
    sbtnBuscaFluxo: TToolbarButton97;
    MSBuscaFluxo: TMontaSelect;
    qryAux: TwwQuery;
    qryIDOPERRENFIX: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryIDFORCLI: TFloatField;
    qryMOECODIGO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryPUOPERACAO: TFloatField;
    qryPUEMISSAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryQTDEOPERACAO: TFloatField;
    qryOBSERVACAO: TStringField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAEMISSAO: TDateTimeField;
    qryIDUSUARIO: TFloatField;
    qryIDOPERRENFIXAPLIC: TFloatField;
    pnlCombos: TPanel;
    dblkInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkTipoOperacao: TwwDBLookupCombo;
    lblOperacao: TLabel;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryBuscaFluxoLiquidado: TwwQuery;
    qryFLGCARTHIPO: TStringField;
    qryQTDCARTHIPO: TFloatField;
    pgcOper: TPageControl;
    tbsOper: TTabSheet;
    tbsObs: TTabSheet;
    pnlDados: TPanel;
    lblDtVencimento: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lblDtLiquidacao: TLabel;
    dbdDataOperacao: TCMDateTimePicker;
    dbrVlrOperacao: TDBRealEdit;
    dbePuOperacao: TDBRealEdit;
    dbdDtaLiquidacao: TCMDateTimePicker;
    pnlObs: TPanel;
    qryBOLETA: TStringField;
    qryDATALIQUIDACAO: TDateTimeField;
    Label1: TLabel;
    dblPlanoPatro: TwwDBLookupCombo;
    qryPlanPrev: TwwQuery;
    qryPlanPrevPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevIDPLANOPREV: TFloatField;
    qryPlanPrevIDPATRO: TFloatField;
    pnlBoleta: TPanel;
    pnlObsDet: TPanel;
    dbeBoleta: TwwDBEdit;
    lblBoleta: TLabel;
    dbRtObs: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sel(iChave: Integer);
    procedure bbtnConfirmarClick(Sender: TObject);

    //AL_11
    function VerificaLiquidacaoFluxo(iPlanoPatro :Integer):boolean;
    function VerificaCampos: Boolean;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnBuscaFluxoClick(Sender: TObject);
    procedure AtualizaComponentes;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbrVlrOperacaoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFluxoRenFix: TfrmCadFluxoRenFix;
  iIdOperRenFix,iIdHistRenFix,flgContaInvest : integer;
  fPUOperacao, fVlrOperacao, fVlrOriginal : Double;
  sTipoOper : TTipoOper;
  //AL_26
  sMensDiv: String;

implementation

uses UBibliotecaInvest, UMensErro, dBaseDados, URendaFixa, UDataBase, USistema,
     dRendaFixa,ULancContab, UDiasUteisInv, uOperComum;

{$R *.DFM}

procedure TfrmCadFluxoRenFix.FormShow(Sender: TObject);
begin
  inherited;
   sbtnInserir.Enabled := False;
   pgcOper.Activepage := tbsOper;
   qryTipoOperacao.Open;
   qryInvestimento.Open;
   //AL_26
   qryPlanPrev.Open;
   //AL_11
   Sel(-1);
end;

procedure TfrmCadFluxoRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryTipoOperacao.Close;
   qryInvestimento.Close;
   //AL_26
   qryPlanPrev.Close;
end;

procedure TfrmCadFluxoRenFix.Sel(iChave: Integer);
begin
   qry.Close;
   qry.ParamByName('IDOPERRENFIX').AsInteger := iChave;
   qry.Open;
end;

//AL_11
function TfrmCadFluxoRenFix.VerificaLiquidacaoFluxo(iPlanoPatro:Integer):boolean;
var
   iTipoOper : Integer;
begin
   Result := True;

   with qryBuscaFluxoLiquidado do
   begin
       //AL_11
       OperComum.LimpaParametros(qryBuscaFluxoLiquidado);
       ParamByName('dDataOper').AsString          := MSBuscaFluxo.ValoresChave[1];
       ParamByName('IDOPERRENFIX').AsInteger      := StrToInt(MSBuscaFluxo.ValoresChave[0]);
       //AL_11
       ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPatro;//iPlanPrevCtbPatro;
       // Pagamento de Juros
       //AL_28 - Ini
       if StrToInt(MSBuscaFluxo.ValoresChave[3]) = CtrlPInv.IdOperPagtoJuros then
          ParamByName('IDTIPOOPERACAO').AsInteger := -17
       // Amort. Principal
       else if StrToInt(MSBuscaFluxo.ValoresChave[3]) = CtrlPInv.IdOperaMortPrinc then
          ParamByName('IDTIPOOPERACAO').AsInteger := -18
       // Inc. de Juros
       else if StrToInt(MSBuscaFluxo.ValoresChave[3]) = CtrlPInv.IdOperIncJuros then
          ParamByName('IDTIPOOPERACAO').AsInteger := -19;
       //AL_28 - Fim
       Open;
       if not IsEmpty then
       begin
          MsgDlg('A Operação já está liquidada no Financeiro.','Mensagem do Sistema',mtWarning,[mbOk],0);
          Result := False;
       end;
   end;
end;

procedure TfrmCadFluxoRenFix.bbtnConfirmarClick(Sender: TObject);
var
   iPlanilha,iDocumento : Integer;
   fSldHistRenFix : Double;
   dDataOperProx: TDateTime;
   sMens, sHistorico: String;
   //AL_12     //AL_29
   fPuAcuitem, fPuItem : Double;
begin
  //inherited;

   // Aplicacao
   if sTipoOper = [Aplicacao] then
   begin
      iPlanilha := -1;
      iDocumento := -1;

      if not VerificaCampos then
      begin
         lbNomItem.Caption := 'Fluxo de Renda Fixa';
         Exit;
      end;

      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;

         iIdHistRenFix  := LeUltRegistro(nil, 'HISTRENFIX');

         //AL_26
         if sMensDiv <> '' then
            if qryOBSERVACAO.IsNull then
               qryOBSERVACAO.AsString := sMensDiv
            else
               qryOBSERVACAO.AsString := qryOBSERVACAO.AsString + #13 + #10 + sMensDiv;

         qry.Post;
         qry.ApplyUpdates;
         qry.CommitUpdates;

         // AL_5 - 12/08/2004
         // Passa a abater o saldo pois o novo calculo
         fSldHistRenFix := RendaFixa.DiminuiValores(DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat,
                                                    RendaFixa.BuscaFluxosNoDia(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                               DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                                               DateToStr(dbdDataOperacao.Date)));

         sHistorico := RendaFixa.MontaHistorico(qryTipoOperacaoNATUREZAOPERACAO.AsString,
                                                qryTipoOperacaoSIGLATIPOOPER.AsString,
                                                qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                                DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString);

         // Grava Histórico Aplicação
         if not RendaFixa.GravaHistRenfix(iIdHistRenFix,
                                          qryInvestimentoIDINVESTIMENTO.AsInteger,
                                          iIdOperRenFix,
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          -1,-1,
                                          dbdDataOperacao.Date,
                                          //AL_23
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat,
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat,
                                          dbrVlrOperacao.Value,
                                          fSldHistRenFix,
                                          'OPE',
                                          qryTipoOperacaoNATUREZAOPERACAO.AsString,
                                          sHistorico,
                                          //AL_17
                                          False,-1,-1,'',
                                          DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger) then
            Raise Exception.Create('Não foi Possível Incluir um Histórico para esta Operação');


         // AL_4 - 10/08/2004 - Grava todos os itens
         DMRendaFixa.qryBuscaSaldosItems.First;
         while not DMRendaFixa.qryBuscaSaldosItems.Eof do
         begin
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = StrToInt(MSBuscaFluxo.ValoresChave[3]) then
            begin
               // Grava Item da Operação
               if not RendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,
                                                       DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                       DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                       -1,
                                                       dbePuOperacao.Value,
                                                       100) then
                  Raise Exception.Create('Não foi Possível Incluir o Item de Operação de Renda Fixa');
               // Grava Item do Histórico

               //AL_9
               //AL_29 - Ajusta o VlrItem
               if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').AsInteger,
                                                      dbePuOperacao.Value,
                                                      dbePuOperacao.Value,
                                                      RoundCM(dbePuOperacao.Value * DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat,2),
                                                      RoundCM(dbePuOperacao.Value * DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat,2)) then
                  Raise Exception.Create('Não foi Possível Incluir o Item de Histórico de Renda Fixa');
            end
            else
            begin
               //AL_12 - Ini
               if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -6) or      // Vlr Bruto e Líquido
                  (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -5) then
                  fPuAcuitem := fSldHistRenFix
               //AL_13
               //AL_29 - Ini
               else if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('CODITEMRENFIX').AsString = 'PUJUROS') then  // Juros
               begin
                  fPuAcuitem := RoundCM((DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat - dbePuOperacao.Value),12);
                  fPuItem := dbePuOperacao.Value;
               end
               else
               begin
                  fPuAcuitem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
                  fPuItem := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUITEM').AsFloat;
               end;
               //AL_29 - Fim
               //AL_12 - Fim

               // Grava Item da Operação
               //AL_12
               if not RendaFixa.GravaOperRenFixXCurvas(iIdOperRenFix,
                                                       DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                       DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                       -1,
                                                       fPuAcuitem,
                                                       100) then
                  Raise Exception.Create('Não foi Possível Incluir o Item de Operação de Renda Fixa');
               // Grava Item do Histórico
               //AL_9
               //AL_12
               //AL_29 = Ajuste nos itens
               if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger,
                                                      DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDREGRA').AsInteger,
                                                      fPuItem, fPuAcuitem,
                                                      RoundCM(fPuItem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat,2),
                                                      RoundCM(fPuAcuitem * DMRendaFixa.qryBuscaSaldosHist.FieldByName('QTDHISTRENFIX').AsFloat,2)) then
                  Raise Exception.Create('Não foi Possível Incluir o Item de Histórico de Renda Fixa');
            end;
            DMRendaFixa.qryBuscaSaldosItems.Next;
         end;

         // Contabiliza e Integra Financeiro
         //AL_24
         //AL_28
         if (qryTipoOperacaoFLGGERACONTAB.AsInteger = 1) and (CtrlPInv.IntFinContabRF = 'S')then
         begin
            //AL_25
            //AL_28
            RendaFixa.IntegraContabCapCar(iIdHistRenFix,
                                          qryInvestimentoIDINVESTIMENTO.AsInteger,
                                          qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          qryInvestimentoIDCLASSETIT.AsInteger,
                                          StrToInt(MSBuscaFluxo.ValoresChave[3]),
                                          qryTipoOperacaoFLGGERACONTAB.AsInteger,
                                          qryTipoOperacaoFLGGERACAPCAR.AsInteger,
                                          qryInvestimentoIDEMISSOR.AsInteger,
                                          qryTipoOperacaoCODTIPDOC.AsInteger,
                                          DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                          DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCURVACONTABIL').AsString,
                                          qryInvestimentoDESCINVESTIMENTO.AsString,
                                          qryInvestimentoDESCINVESTIMENTO.AsString,
                                          dbrVlrOperacao.Value,
                                          0,0,
                                          dbdDataOperacao.Date,
                                          dbdDataOperacao.Date,
                                          //AL_14
                                          dbdDtaLiquidacao.Date,
                                          iPlanilha,iDocumento,
                                          -1,'',-1,
                                          flgContaInvest, True);

            // Verifica se foi gerado contabilização E Atualiza o HistRenFix
            if iPlanilha <> -1 then
            begin
               if not RendaFixa.GravaPlanDoc('OPE', iIdOperRenFix, iIdHistRenFix,
                                             iPlanilha, iDocumento, sMens, False) then
                  Raise Exception.Create(sMens);
            end
            else
               Raise Exception.Create('Ocorreu um erro na contabilização');
         end;

         // AL_1 - 15/06/2004 - Não volta data, marca o investimento
         //AL_28
         if dbdDataOperacao.DateTime < CtrlPInv.DataUltFechRF then
         begin
            if RendaFixa.MarcaInvRep(dbdDataOperacao.DateTime,
                                     qryInvestimentoIDINVESTIMENTO.AsInteger,
                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger) = -1 then
               Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.');
         end;
         // AL_1

         // Término do processamento
         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);

      except
         on E:Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('DELETE FROM HISTRENFIX ' +
                           'WHERE IDHISTRENFIX = ' + IntToStr(iIdHistRenFix));
            qryAux.Prepare;
            qryAux.ExecSQL;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('DELETE FROM HISTRENFIXXITENS ' +
                           'WHERE IDHISTRENFIX = ' + IntToStr(iIdHistRenFix));
            qryAux.Prepare;
            qryAux.ExecSQL;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('DELETE FROM OPERRENFIX ' +
                           'WHERE IDOPERRENFIX = ' + IntToStr(iIdOperRenFix));
            qryAux.Prepare;
            qryAux.ExecSQL;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('DELETE FROM OPERRENFIXXCURVAS ' +
                           'WHERE IDOPERRENFIX = ' + IntToStr(iIdOperRenFix));
            qryAux.Prepare;
            qryAux.ExecSQL;

            MsgDlg('Não foi Possível Efetuar Esta Operação de Renda Fixa. ' + #13 +
                    E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
         end;
      end;
   end;
   AtualizaComponentes;
   lbNomItem.Caption := 'Fluxo de Renda Fixa';
end;


function TfrmCadFluxoRenFix.VerificaCampos: Boolean;
begin
   Result := False;

   if Trim(dblkTipoOperacao.Text) = '' then
   begin
      MsgDlg('Tipo de Operação não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkTipoOperacao.CanFocus then
         dblkTipoOperacao.SetFocus;
      Exit;
   end;

   if Trim(dblkInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkInvestimento.CanFocus then
         dblkInvestimento.SetFocus;
      Exit;
   end;

   if Trim(dbdDataOperacao.Text) = '' then
   begin
      MsgDlg('Data da Operação não Informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;

   if Trim(dbdDtaLiquidacao.Text) = '' then
   begin
      MsgDlg('Data da Vencimento não Informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDtaLiquidacao.CanFocus then
         dbdDtaLiquidacao.SetFocus;
      Exit;
   end;

   if dbdDtaLiquidacao.Date < dbdDataOperacao.Date then
   begin
      MsgDlg('A Data de Liquidação não pode ser inferior a Data de Operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDtaLiquidacao.CanFocus then
         dbdDtaLiquidacao.SetFocus;
         //al_14
         qryDATALIQUIDACAO.AsDateTime  := StrToDate(MSBuscaFluxo.ValoresChave[1]);
         // Função que retorna o 1º dia útil posterior a uma determinada data
         qryDATALIQUIDACAO.AsDateTime  := DiasUteisInv.PrimeiroDiaUtilPosterior(qryDATALIQUIDACAO.AsDateTime,-1, 1,'',True,False,False);
      Exit;
   end;

   // Nao aceita se a data de vencimento nao for util
   if not DiasUteisInv.DiaUtil(dbdDtaLiquidacao.Date,-1,1,'',True,False,False) then
   begin
      MsgDlg('A Data de Liquidação não pode dia não útil.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDtaLiquidacao.CanFocus then
         dbdDtaLiquidacao.SetFocus;
         // Função que retorna o 1º dia útil posterior a uma determinada data
         qryDATALIQUIDACAO.AsDateTime  := DiasUteisInv.PrimeiroDiaUtilPosterior(qryDATALIQUIDACAO.AsDateTime,-1, 1,'',True,False,False);
      Exit;
   end;


   if dbePuOperacao.Value = 0 then
   begin
      MsgDlg('PU da Operação não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbePuOperacao.CanFocus then
         dbePuOperacao.SetFocus;
      Exit;
   end;

   if dbePuOperacao.Value > OperComum.Round(fPUOperacao,6) then
   begin
      // Somente testa se o valor não tiver sido alterado
      if qryVLROPERACAO.AsFloat = fVlrOriginal then
      begin
         MsgDlg('O PU da Operação não pode ser maior que o PU de Juros Apurado : '+FloatToStr(OperComum.Round(fPUOperacao,6))+' .','Mensagem do Sistema',mtWarning,[MbOk],0);
         dbePuOperacao.Value := fPUOperacao;
         if dbePuOperacao.CanFocus then
            dbePuOperacao.SetFocus;
         Exit;
      end;
   end;

   if dbrVlrOperacao.Value = 0 then
   begin
      MsgDlg('Valor da Operação não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbrVlrOperacao.CanFocus then
         dbrVlrOperacao.SetFocus;
      Exit;
   end;

   //AL_26
   sMensDiv := '';
   //AL_27
   //AL_29
   if RoundCM(dbrVlrOperacao.Value, 2) > RoundCM(fPUOperacao * qryQTDEOPERACAO.AsFloat, 2) then
   begin
      if OperComum.InvMsgBox('Valor da Operação não pode ser superior ao saldo de juros calculado pelo sistema.', mtWarning,
                             'Mensagem do Sistema',[MbYes, mbCancel], 'Continua; Cancela') = mrCancel then
      begin
         dbrVlrOperacao.Value := fVlrOperacao;
         if dbrVlrOperacao.CanFocus then
            dbrVlrOperacao.SetFocus;
         Exit;
      end
      else
         sMensDiv := 'Operação efetuada em divergência com o Juros calculado pelo Sistema';
   end;

   Result := True;
end;

procedure TfrmCadFluxoRenFix.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   qryTipoOperacao.Close;
   qryInvestimento.Close;
   sbtnInserir.Enabled := False;
end;

procedure TfrmCadFluxoRenFix.sbtnBuscaFluxoClick(Sender: TObject);
begin
   inherited;
   MSBuscaFluxo.Executar;
   if MSBuscaFluxo.RetornouValor then
   begin
      // AL_3 - Controle do processo de abertura
      // Não faz durante a abertura
      if RendaFixa.VerEmAbertura then
      begin
         sbtnBuscaFluxo.Down := False;
         Exit;
      end;

      // Verifica se já foi lançado
      //AL_11
      if not VerificaLiquidacaoFluxo(StrToInt(MSBuscaFluxo.ValoresChave[6])) then
      begin
         sbtnBuscaFluxo.Down := False;
         Exit;
      end;

      //AL_19 Ini
      if not RendaFixa.BuscaHistOperNoDia(StrToDate(MSBuscaFluxo.ValoresChave[1]),
                                          StrToInt(MSBuscaFluxo.ValoresChave[4]),
                                          StrToInt(MSBuscaFluxo.ValoresChave[7])) then
      begin
         MsgDlg('Existem Operações deste Investimento sem Histórico no dia.'+#13+
                'Execute o Reprocessamento do Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaFluxo.Down := False;
         Exit;
      end
      //AL_19 Fim
      else
      begin
        // Simula o Padrão
         pgcOper.ActivePage := tbsOper;
         CmeCadastro.Cancel(Self);
         CmeCadastro.Operacao := opInserir;
         CmeCadastro.RepetirInsert := True;
         CmeCadastro.AtualizaBotoes(Self);
         CmeCadastro.Insert(Self);
         CmeCadastro.AtualizaBotoes(Self);
         sbtnInserir.Down := True;

         sbtnInserir.Enabled := False;

         sTipoOper := [Aplicacao];

         //AL_26
         pnlCombos.Enabled := False;
         pnlDados.Enabled  := True;
         pnlObs.Enabled := True;

         // Pagamento de Juros
         //AL_28 - Ini
         if StrToInt(MSBuscaFluxo.ValoresChave[3]) = CtrlPInv.IdOperPagtoJuros then
            qryIDTIPOOPERACAO.AsInteger := -17;
         // Amort. Principal
         if StrToInt(MSBuscaFluxo.ValoresChave[3]) = CtrlPInv.IdOperaMortPrinc then
            qryIDTIPOOPERACAO.AsInteger := -18;
         // Inc. de Juros
         if StrToInt(MSBuscaFluxo.ValoresChave[3]) = CtrlPInv.IdOperIncJuros then
            qryIDTIPOOPERACAO.AsInteger := -19;
         //AL_28 - Fim

         //Traz os Saldos de: - Data, Investimento, Aplicação Selecionados
         //AL_22
         RendaFixa.BuscaSaldos(StrToDate(MSBuscaFluxo.ValoresChave[1]),
                               -1,
                               StrToInt(MSBuscaFluxo.ValoresChave[4]),
                               StrToInt(MSBuscaFluxo.ValoresChave[0]));

         RendaFixa.SelItemXOpeXInv(StrToInt(MSBuscaFluxo.ValoresChave[4]));

         // AL_6
         //AL_20 - Ini
         //AL_26 - Ini
         //AL_28
         if DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAOORIG').AsDateTime >= CtrlPInv.DtMudaCPMF  then
         begin
            flgContaInvest := 1;
            lbNomItem.Caption := 'Fluxo de Renda Fixa - CCI';
         end
         else
         begin
            lbNomItem.Caption := 'Fluxo de Renda Fixa - CC';
            flgContaInvest := 0;
         end;
         //AL_26 - Fim
         //AL_20 - Fim

         iIdOperRenFix  := LeUltRegistro(nil, 'OPERRENFIX');

         qryIDOPERRENFIX.AsInteger := iIdOperRenFix;

         dblkTipoOperacao.LookupValue := MSBuscaFluxo.ValoresChave[3];
         qryTipoOperacao.Close;
         qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := qryIDTIPOOPERACAO.AsInteger;
         qryTipoOperacao.Open;
         dblkTipoOperacao.Text := qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;

         dblkInvestimento.LookupValue := MSBuscaFluxo.ValoresChave[4];
         qryInvestimento.Close;
         qryInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(MSBuscaFluxo.ValoresChave[4]);
         qryInvestimento.Open;
         dblkInvestimento.Text := qryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;

         //AL_26
         qryPlanPrev.Locate('IDPLANPREVCTBPATR', DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger, []);
         dblPlanoPatro.Text := qryPlanPrevPLANPRVCONTABPATRO.AsString;

         qryIDINVESTIMENTO.AsInteger    := StrToInt(MSBuscaFluxo.ValoresChave[4]);
         qryDATAOPERACAO.AsDateTime     := StrToDate(MSBuscaFluxo.ValoresChave[8]); //Thiago Passos 39918 Kintana 523459
         qryIDOPERRENFIXAPLIC.AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
         qryIDCARTEIRAINVEST.AsInteger  := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger;
         qryIDPLANPREVCTBPATR.AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         qryIDCUSTODIANTE.AsInteger     := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCUSTODIANTE').AsInteger;
         qryIDFORCLI.AsInteger          := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger;
         qryPUEMISSAO.AsFloat           := DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat;
         qryMOECODIGO.AsInteger         := DMRendaFixa.qryBuscaSaldosOper.FieldByName('MOECODIGO').AsInteger;
         qryIDUSUARIO.AsInteger         := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDUSUARIO').AsInteger;
         qryDATAEMISSAO.AsDateTime      := DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime;
         qryOBSERVACAO.AsString         := qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
         qryDATAEMISSAO.AsDateTime      := StrToDate(MSBuscaFluxo.ValoresChave[1]);

         qryFLGCARTHIPO.AsString        := DMRendaFixa.qryBuscaSaldosOper.FieldByName('FLGCARTHIPO').AsString;
         qryQTDCARTHIPO.AsFloat         := DMRendaFixa.qryBuscaSaldosOper.FieldByName('QTDCARTHIPO').AsFloat;
         //AL_14
         qryDATALIQUIDACAO.AsDateTime     := StrToDate(MSBuscaFluxo.ValoresChave[1]);

         // Função que retorna o 1º dia útil posterior a uma determinada data
         //AL_14
         while not DiasUteisInv.DiaUtil(qryDATALIQUIDACAO.AsDateTime,+1,1,'',True,False,False) Do
            qryDATALIQUIDACAO.AsDateTime  := qryDATALIQUIDACAO.AsDateTime + 1;   // Achar o dia útil posterior

         // AL_8
         //AL_14
         dbdDtaLiquidacao.Text          := qryDATALIQUIDACAO.AsString;

         // Buscar o PU do Item  do Fluxo
         DMRendaFixa.qryBuscaSaldosItems.First;
         while not DMRendaFixa.qryBuscaSaldosItems.Eof do
         begin
            if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = StrToInt(MSBuscaFluxo.ValoresChave[3]) then
            begin
               qryPUOPERACAO.AsFloat := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
               fPUOperacao := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
               Break;
            end;
            DMRendaFixa.qryBuscaSaldosItems.Next;
         end;
         // AL_8
         dbePuOperacao.Value     := qryPUOPERACAO.AsFloat;

         qryQTDEOPERACAO.AsFloat := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
         qryVLROPERACAO.AsFloat  := (qryPUOPERACAO.AsFloat * qryQTDEOPERACAO.AsFloat);
         fVlrOperacao            := qryVLROPERACAO.AsFloat;
         // AL_8
         dbrVlrOperacao.Value    := qryVLROPERACAO.AsFloat;

         // Será utilizado caso seja alterado o valor do campo
         fVlrOriginal            := qryVLROPERACAO.AsFloat;
      end;
   end;
   sbtnBuscaFluxo.Down := False;
end;

procedure TfrmCadFluxoRenFix.AtualizaComponentes;
begin
   Sel(-1);
   qryTipoOperacao.Close;
   qryInvestimento.Close;
   sbtnProcurar.Enabled := True;
   pnlDados.Enabled     := False;
   sbtnApagar.Enabled   := False;
end;

procedure TfrmCadFluxoRenFix.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      //AL_26
      pnlFundo.Enabled := True;
      pnlCombos.Enabled  := False;
      pnlDados.Enabled   := False;
      pnlObs.Enabled := False;
      sbtnApagar.Enabled := True;

      qryTipoOperacao.Close;
      qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(MontaSelect.ValoresChave[8]);
      qryTipoOperacao.Open;

      qryInvestimento.Close;
      qryInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(MontaSelect.ValoresChave[9]);
      qryInvestimento.Open;

      //AL_26 - Ini
      Sel(StrToInt(MontaSelect.ValoresChave[1]));

      sTipoOper := [Exclusao];

      //AL_28
      if StrToDate(MontaSelect.ValoresChave[11]) >= CtrlPInv.DtMudaCPMF then
         lbNomItem.Caption := 'Fluxo de Renda Fixa - CCI'
      else
         lbNomItem.Caption := 'Fluxo de Renda Fixa - CC';
      //AL_26 - Fim
   end;
end;

procedure TfrmCadFluxoRenFix.sbtnApagarClick(Sender: TObject);
// AL_10
var bExclui, bVoltaData: Boolean;
begin
//   inherited;
   try  // Finally
      // AL_3 - Controle do processo de abertura
      // Não faz se estiver em Abertura
      if RendaFixa.VerEmAbertura then Exit;

      if sTipoOper = [Exclusao] then // Exclusao
      begin
         bExclui := False;
         bVoltaData := False;
         //AL_28
         if dbdDataOperacao.DateTime >= CtrlPInv.DataUltFechRF then
         begin
         if (MsgDlg('Deseja realmente excluir esta Operação?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
               bExclui := True;
         end
         else
         begin
            if (MsgDlg('O Investimento ' + qryInvestimentoDESCINVESTIMENTO.AsString + #13 +
                       'será Reprocessado a Partir do Dia ' + dbdDataOperacao.Text + #13 +
                       'na próxima Abertura ou Reprocessamento' + #13 +
                       'Deseja realmente excluir esta Operação?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
            begin
               bExclui := True;
               bVoltaData := True;
            end;
         end;

         if bExclui then
         begin
            Try
               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               // Testa se Periodo Contabil está Fechado para exclusao
               //AL_24
               //AL_28
               if CtrlPInv.IntFinContabRF <> 'N' then
               begin
                  //AL_10
                  //AL_18
                  if not CtrlInvContab.TestaPeriodo(DateToStr(dbdDataOperacao.DateTime),
                                                    1, -1, StrToInt(MontaSelect.ValoresChave[12])) then
                     Raise Exception.Create(CtrlInvContab.MessageInfo);
               end;

               // Testa se pode ser excluído do financeiro
               if not RendaFixa.TestaFinanceiro(dbdDataOperacao.DateTime,StrToInt(MontaSelect.ValoresChave[1])) then
               begin
                  DtmBaseDados.dbBaseDados.Rollback;
                  Exit;
               end;

               with DMRendaFixa.qryAux do
               begin
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM HISTRENFIXXITENS WHERE IDHISTRENFIX = ' +
                               MontaSelect.ValoresChave[0];
                  ExecSQL;

                  SQL.Clear;
                  SQL.Text := 'DELETE FROM HISTRENFIX WHERE IDHISTRENFIX = ' +
                               MontaSelect.ValoresChave[0];
                  ExecSQL;

                  SQL.Clear;
                  SQL.Text := 'DELETE FROM OPERRENFIXXCURVAS WHERE IDOPERRENFIX = ' +
                               MontaSelect.ValoresChave[1];
                  ExecSQL;

                  SQL.Clear;
                  SQL.Text := 'DELETE FROM OPERRENFIX WHERE IDOPERRENFIX = ' +
                               MontaSelect.ValoresChave[1];
                  ExecSQL;
               end;

               if not RendaFixa.ExcluiIrLitigioRenFix(StrToInt(MontaSelect.ValoresChave[1])) then
                  Raise Exception.Create('Não foi Possível a Excluir o IR Litigio.');

               if MontaSelect.ValoresChave[3]  <> '' then  // PLNCODIGO
               begin
                  if not RendaFixa.ExcluiContabilidadeRenFix(StrToInt(MontaSelect.ValoresChave[3]), False) then
                     Raise Exception.Create('Não foi Possível a Excluir os Lançamentos Contábeis.');
               end;

               if MontaSelect.ValoresChave[4] <> '' then   // CODDOCUMENTO
               begin
                  if not RendaFixa.ExcluiFinanceiroRenFix(StrToInt(MontaSelect.ValoresChave[4])) then
                     Raise Exception.Create('Não foi Possível a Excluir os Lançamentos Financeiros.');
               end;

               if bVoltaData then
               //AL_1 - 15/06/2004 - Não volta data, marca o investimento
               //AL_11
               //AL_31 - Passa a utilizar o Plano do MontaSelect
               if RendaFixa.MarcaInvRep(dbdDataOperacao.DateTime,
                                        StrToInt(MontaSelect.ValoresChave[9]),
                                        StrToInt(MontaSelect.ValoresChave[10]),
                                        StrToInt(MontaSelect.ValoresChave[13])) = -1 then
                  Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.');
               // AL_1 - 15/06/2004 - Fim

               dtmBaseDados.dbBaseDados.Commit;

               MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema ',mtInformation,[mbOK],0);

               AtualizaComponentes;

            except on E: Exception do
               begin
                  dtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu problema ao excluir a Operação:' + #13 +
                          E.Message,
                         'Mensagem do Sistema ',mtError,[mbOK],0);
               end;
            end;
         end;
      end;
   finally
      sbtnApagar.Down := False;
      DMRendaFixa.qryAux.SQL.Clear;
      //AL_26
      Sel(-1);  // Posiciona no mesmo registro
   end;
end;

procedure TfrmCadFluxoRenFix.dbrVlrOperacaoExit(Sender: TObject);
begin
  inherited;
   if qryVLROPERACAO.AsFloat <> fVlrOriginal then
      qryPUOPERACAO.AsFloat := OperComum.DivValorZero(qryVLROPERACAO.AsFloat,qryQTDEOPERACAO.AsFloat);
end;

end.
