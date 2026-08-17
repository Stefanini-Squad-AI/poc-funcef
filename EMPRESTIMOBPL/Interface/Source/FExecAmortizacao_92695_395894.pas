unit FExecAmortizacao_92695_395894;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA
//    20071    FUSESC


{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : ValidaNumParcela
Data      : 06/12/2007
Autor     : Marchetti
Pendencia : 27040
Descrição : Não permite aumento de prazo
--------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 30/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula
            passada pela CentralAP.
--------------------------------------------------------------------------------
Rotina    :
Data      : 12/03/2007
Autor     : Marchetti
Pendência : 23083
Descrição : Ajuste no numero da parcela correspondente para a FUNCEF.
--------------------------------------------------------------------------------
Rotina    :
Data      : 05/01/2007
Autor     : Marchetti
Pendência : Pendencia 21596
Descrição : Executar sempre o cálculo da margem consignável.
--------------------------------------------------------------------------------
Rotina    : - EXCEPCIONAL
Data      : 20/12/2005
Autor     : André Pontes
Pendência :
Descrição : A pedido de Luciana, excepcional retira críticas de data e itens em
            aberto Gravação de log com o Excepcional.
--------------------------------------------------------------------------------
Rotina    : EnviaAmortizacaoCAPCAR
Data      : 25/11/2005
Autor     : Marchetti
Pendência : 20824
Descrição : Acerto na query para o Envio para não levar em consideração
            amortização já enviada.
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : btnContinuaSelecaoClick e btnContinuaEncerraClick
Data      : 19/05/2005
Autor     : André Pontes
Pendencia : 19284
Descrição : Ajustes na busca da taxa de juros (estava considerando a taxa
            original do contrato)
--------------------------------------------------------------------------------
Rotina    : ContabilizaAmortizacao
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '
--------------------------------------------------------------------------------
Rotina    : ContabilizaAmortizacao
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '   AND H.HMESEQCOBRANCA         = 1 '
--------------------------------------------------------------------------------
Rotina    : btnContinuaSelecaoClick
Data      : 25/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem obrigatória pela regra de Margem, se for FUNCEF
--------------------------------------------------------------------------------
Rotina    : btnConfirmarClick (EnviaAmortizacaoCAPCAR)
Data      : 11/08/2004
Pendência :
Autor     : André Pontes
Descrição : Envio no ato regulado por parâmetro do sistema (análogo à concessão)
--------------------------------------------------------------------------------
Rotina    : EnviaAmortizacaoCAPCAR
Data      : 03/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem do campo "MATRICULA"
--------------------------------------------------------------------------------
Rotina    : CalculaItensAmortizacao
Data      : 08/01/2003
Autor     : André Pontes
Pendência :
Descrição : Passagem do valor total dos itens de seguro e seguro complementar
            (fVlrSeguroAnt e fVlrSeguroComplAnt, respectivament)
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 08/01/2003
Autor     : André Pontes
Pendência :
Descrição : Passagem do valor total dos itens de seguro e seguro complementar
            (fVlrSeguroAnt e fVlrSeguroComplAnt, respectivament)
--------------------------------------------------------------------------------
Rotina    : -
Data      : 17/07/2003
Autor     : Marchetti
Pendencia : 21496 (3S)
Descrição : Chamada da rotina de estorno de provisão de perdas.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Deve existir cálculo de atualização diária quando trabalhar com
            atualização diária de saldo devedor.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Mostra o total (em valores) de itens em aberto.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Número de parcelas restantes leva em consideração a ultima posição
            do histórico conforme o saldo devedor.
--------------------------------------------------------------------------------
Rotina    : btnConfirmarClick
Data      : 29/11/2002
Autor     : Marchetti
Descrição : Não trata o erro quando não existe item a ser enviado, pois pode ter
            como resultado item que não é enviado.
--------------------------------------------------------------------------------
Rotina    : PreencheTabelaVirtual
Data      : 29/11/2002
Autor     : Marchetti
Descrição : Deixa visivel a forma de envio caso exista algum item de envio.
--------------------------------------------------------------------------------
Rotina    : qryAmortizacaoAnteriorEmAberto
Data      : 27/11/2002
Autor     : Marchetti
Descrição : Colocado o filtro por hmecentraliza = 1 ou hmedestacado = 1
--------------------------------------------------------------------------------
Rotina    : btnContinuaEncerraClick
Data      : 27/11/2002
Autor     : Marchetti
Descrição : Se somente for aumento de prazo, coloca a forma de envio como folha.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados
            seguem sem valor, pois os mesmos somente serão utilizados na
            alteração de valores da concessão.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas.
--------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 23/10/2002
Autor     : Marchetti
Descrição : Limpa o resulta da consulta efetuada anteriormente.
--------------------------------------------------------------------------------
Rotina    : RepeteConsulta
Data      : 16/10/2002
Autor     : Marchetti
Descrição : ???
--------------------------------------------------------------------------------
Rotina    : EnviaCAPCAR
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Colocado o filtro de hmedestacado = 1
--------------------------------------------------------------------------------
Rotina    : -
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Colocado botao para alterar margem consignavel.
--------------------------------------------------------------------------------
Rotina    : CalculaParcela
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Colocada critica se valor da parcela está superior a margem
            consignável.
--------------------------------------------------------------------------------
Rotina    : Simulacao
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Colocada opção de visualizaçào de simulaçào de prazos permitidos.
--------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Atribui o valor do saldo devedor atual ao objeto edtSaldoDevedor.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Carrega variáveis de país, estado e cidade antes de executar os
            cálculos de itens de amortização e itens calculados.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, fcLabel, wwdblook, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
   ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls, fcButton,
   fcImgBtn, fcShapeBtn, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
   TREdit, wwdbedit, Wwdbspin, uTypesEmptmo, UAutorizacao,
   uCtrlContab, uCtrlPadroes, DBGrids;

type
   TfrmExecAmortizacao_92695_395894 = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      lblDataAmortizacao: TLabel;
      Bevel2: TBevel;
      Bevel3: TBevel;
      btnContinuaSelecao: TfcShapeBtn;
      btnBuscaContrato: TBitBtn;
      edtDataVencto: TCMDateTimePicker;
      DBgrdHistMov: TwwDBGrid;
      btnCancelaEncerra: TfcShapeBtn;
      btnContinuaEncerra: TfcShapeBtn;
      Panel4: TPanel;
      Bevel1: TBevel;
      Panel9: TPanel;
      btnCancelaAltera: TfcShapeBtn;
      btnConfirmar: TfcShapeBtn;
      DBgrdHistMovVirtual: TwwDBGrid;
      lblTitulo: TfcLabel;
      dts: TwwDataSource;
      qryHistMov: TwwQuery;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovANOMES: TStringField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      dtsHistMov: TwwDataSource;
      updHistMovVirtual: TUpdateSQL;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      Bevel4: TBevel;
      Bevel5: TBevel;
      lblVlrAmortizado: TLabel;
      edtVlrAmortizacao: TRealEdit;
      Label5: TLabel;
      DBspnParcelas: TwwDBSpinEdit;
      Label6: TLabel;
      edtValorParcela2: TRealEdit;
      lblSaldoDevedor: TLabel;
      edtSaldoDevedor: TRealEdit;
      Label2: TLabel;
      edtParcRestantes: TRealEdit;
      qryAtualizacoesPosteriores: TwwQuery;
      qryAtualizacoesPosterioresHMEDATAATUALIZA: TDateTimeField;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      DBrdgDebito: TRadioGroup;
      Bevel6: TBevel;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      Label7: TLabel;
      Label22: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label11: TLabel;
      Label10: TLabel;
      DBedtNumContrato: TDBEdit;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      grpTitular: TGroupBox;
      Label13: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      DBEdit4: TDBEdit;
      Label51: TLabel;
      Label14: TLabel;
      btnAlteraMargem: TBitBtn;
      edtMargem: TRealEdit;
      bbtnSimula: TBitBtn;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoIDREGRAJURCONC: TFloatField;
      qryTipoContratoIDREGRAELEG: TFloatField;
      qryTipoContratoIDREGRALIMITES: TFloatField;
      qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContratoIDREGRAMARGEM: TFloatField;
      qryTipoContratoIDREGRARESERVA: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryTipoContratoTEPMAXCONTRATO: TFloatField;
      qryTipoContratoFLGOBRIGBENEF: TFloatField;
      qryTipoContratoIDREGRASALBAS: TFloatField;
      qryTipoContratoMOECODIGO: TFloatField;
      qryTipoContratoFLGCONCESSAOZERO: TFloatField;
      qryTipoContratoTCEMINRENOVA: TFloatField;
      qryTipoContratoIDREGRADATACRED: TFloatField;
      Label15: TLabel;
      edtValorParcela: TRealEdit;
      Label19: TLabel;
      edtVlrAberto: TRealEdit;
      dtsTotalizaAberto: TwwDataSource;
      qryTotalizaAberto: TwwQuery;
      qryTotalizaAbertoQUANT_ABERTO: TFloatField;
      qryTotalizaAbertoVALOR_TOTAL_ABERTO: TFloatField;
      chkNAOContabiliza: TCheckBox;
      qryParcelasRestantes: TwwQuery;
      edtTxJuros: TRealEdit;
      chkRepactuacao: TCheckBox;
      qryHistMovEVENTO: TStringField;
      Bevel7: TBevel;
      Bevel8: TBevel;
      qryTipoContratoFLGNAOREFINANCIA: TFloatField;
      qryHistMovVirtualHMEPARCELAALT: TFloatField;
      qryHistMovVirtualHMENUMPARCELAS: TFloatField;
      chkExcepcional: TCheckBox;
      qryParcelasRestantesHMENUMPARCELAS: TFloatField;
    DBContaDeb: TDBGrid;
    dsBancoDeb: TDataSource;
    qryNumeroParcela: TwwQuery;
    qryParcelasPosteriores: TwwQuery;

      procedure FormCreate(Sender: TObject);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnContinuaEncerraClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure btnCancelaEncerraClick(Sender: TObject);
      procedure edtDataVenctoExit(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnAlteraMargemClick(Sender: TObject);
      procedure edtMargemExit(Sender: TObject);
      procedure bbtnSimulaClick(Sender: TObject);


   private  // Private declarations

      Contab                           : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      sMes, sAno                       : String;

      iPais                            : Integer;
      sEstado                          : String;
      iCidade                          : Integer;

      dDataLimite                      : TDateTime;

      sCentroCusto                     : String;
      iPrograma                        : Integer;
      iMoedaCorrente                   : Integer;


      bHabilitado                      : Boolean;

      rContrato                        : TDadosContrato;
      rConcessao                       : TDadosConcessao;
      vLista, vItensParc               : TListaItem;

      bLimites                         : boolean;
      rSaldosAntPos                    : TSaldosAntPos;

      fMargem, fReserva                : Currency;
      fSldDevAposAmort, fSaldoaQuitar  : Currency;
      fSalParticipacao, fSalMantido    : Currency;
      fSalBenef, fSalAuxDoenca         : Currency;

      fVlrSeguroAnt                    : Currency;
      fVlrSeguroComplAnt               : Currency;

      dDataFinalBeneficio              : TDateTime;
      sFiltro                          : String;
      bRepeteConsulta                  : Boolean;

      vDividasAnteriores   : array of Extended;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure Sel(i: Extended);

      function VerificaPreenchimento: Boolean;
      function VerificaPreenchimentoAmortizacao: Boolean;

      function VerificaAtualizacaoPosterior: Boolean;

      procedure PreencheTabelaVirtual;
      function VerificaBaixa: Boolean;
      function CalculaParcela: Boolean;
      function ValidaNumParcela: Boolean;

      function ContabilizaAmortizacao(const iContrato        : Extended;
                                      var   iPlanilhaResult  : Integer;
                                      var   sResult          : TStringList;
                                      var   sErro            : TStringList
                                     ): Integer;

      function EnviaAmortizacaoCAPCAR(var iPlanilha: Integer; var sResult, sErro: TStringList): Integer;
      function Simulacao: Boolean;

      function VerificaNumeroParcela : Integer;


   public   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula : String;
      // Fim Marchetti - Pendencia 22042
   end;



var
  frmExecAmortizacao_92695_395894: TfrmExecAmortizacao_92695_395894;



implementation
{$R *.DFM}
uses
   uMensErro, uFuncoesEmptmo, dEmptmo, FProgresso, DLookEmptmo, uSistema,
   dBaseDados, uIntegraEmptmo, uVerificaPreenchimento, UCalcEmptmo,
   uDataBase, FExecBuscaContrato, uDiasUteis, uLancContab,
   uDocumento, dMS, DDividaEP, RSimula, dAtualizacaoDiaria,  FExecSelecionaContrato, uIntegraModulo;



procedure TfrmExecAmortizacao_92695_395894.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404

   ntbPrincipal.PageIndex           := 0;

   edtDataVencto.ButtonWidth        := 21;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
   sFiltro                          := dtmMS.MS_ContratoEmptmo.Filtro.Text;
   bRepeteConsulta                  := dtmMS.MS_ContratoEmptmo.RepeteConsulta;

   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO NOT IN (''C'',''Q'')');

   vDividasAnteriores := nil;
   
end;



procedure TfrmExecAmortizacao_92695_395894.HabilitaBotoes;
begin
   btnContinuaEncerra.Enabled := True;
   btnCancelaEncerra.Enabled  := True;
   btnCancelaAltera.Enabled   := True;

   btnConfirmar.Enabled       := bHabilitado;

   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;



procedure TfrmExecAmortizacao_92695_395894.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinuaEncerra.Enabled := False;
   btnCancelaEncerra.Enabled  := False;
   btnCancelaAltera.Enabled   := False;

   bHabilitado := btnConfirmar.Enabled;

   btnConfirmar.Enabled       := False;

   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;



procedure TfrmExecAmortizacao_92695_395894.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;


   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := 'AND CON.FLGSITUACAO  NOT IN (''C'', ''K'', ''Q'') ' + #13;
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         //  abre a query principal com o participante escolhido 
         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));

         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];

         frmExecBuscaContrato.Free;

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);
         LimpaRegistroConcessao(rConcessao);

         Screen.Cursor := crDefault;
      end;
   end
   else
   begin
      dtmMS.MS_ContratoEmptmo.Executar;

      // Redesenha o form na volta do MontaSelect
      Repaint;

      if dtmMS.MS_ContratoEmptmo.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         //  abre a query principal com o participante escolhido 
         Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);
         LimpaRegistroConcessao(rConcessao);

         Screen.Cursor := crDefault;
      end; //  if dtmMS.MS_ContratoEmptmo.RetornouValor
   end;

   //Pendência 20133 - 20/01/2007 - Alberto
   dsBancoDeb.DataSet.Close;
   (dsBancoDeb.DataSet as TQuery).ParamByName('PIDPESSOA').AsInteger := rContrato.IDBenef;
   dsBancoDeb.DataSet.Open;
   with dsBancoDeb.DataSet do
     while not Eof do begin
       if FieldByName('IDCBANCARIA').AsInteger = rContrato.IDCBancariaDeb then
         break;
       Next;
     end;
   //Fim Pendência 20133

   //  Verifica se o Participante já recebeu o Crédito do Empréstimo 
   if VerificaBaixa then
   begin
      btnContinuaSelecao.Enabled := True;
   end
   else
   begin
      btnContinuaSelecao.Enabled := False;

      MsgDlg('Não é possível Amortizar um Empréstimo cujo crédito ainda não foi confirmado.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmExecAmortizacao_92695_395894.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



function TfrmExecAmortizacao_92695_395894.VerificaBaixa: Boolean;
var
   sSql              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSql :=
   'SELECT '                                                                              + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '                                                      + #13 +
   'FROM '                                                                                + #13 +
   '  HISTMOVEMPTMO '                                                                     + #13 +
   'WHERE '                                                                               + #13 +
   '  ( IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) AND '  + #13 +
   '  ( HMETIPOMOV       = 0 ) AND '                                                      + #13 +
   '  ( HMECENTRALIZA    = 1 )';

   qryAux.SQL.Text := sSql;

   try
      qryAux.Open;

      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then
      begin
         //  Participante já recebeu o Crédito do EP, logo pode quitar o EP 
         Result := True;
      end
      else
      begin
         //  Participante NÃO recebeu o Crédito do EP 
         Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                     '',  //  Data do Saldo - Saldo Atual 
                                     'P', //  RecPag 
                                     fSaldo, fSaldoOutraMoeda);

         if fSaldo = 0 then
         begin
            //  Crédito já pago pelo contas a Pagar, logo o participante pode quitar o EP
            Result := True
         end
         else
         begin
            //  Crédito ainda NÃO foi pago pelo contas a Pagar, logo o participante não poderá quitar o EP 
            Result := False;
         end;

      end;

   finally
      qryAux.Free;
   end;
end;



procedure TfrmExecAmortizacao_92695_395894.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   edtMargem.Value               := 0;
   edtValorParcela.Value         := 0;
   edtVlrAmortizacao.Value       := 0;

   DBrdgDebito.Visible           := False;
   Label30.Visible               := False;
   DBcboFormaRecebimento.Visible := False;

   if not(VerificaPreenchimento) then Exit;

   // ----------------------------------------------------------------------------------------------
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                                    edtDataVencto.Date,
                                                    True,
                                                   );

      edtSaldoDevedor.Value  := rSaldosAntPos.fSaldoDevPos;
      edtParcRestantes.Value := rSaldosAntPos.iParcRestaPos;
      DBspnParcelas.MinValue := 1;
      DBspnParcelas.Value     := edtParcRestantes.Value;
      edtMargem.Value         := 0;
      edtValorParcela.Value   := 0;
      edtVlrAmortizacao.Value := 0;
   end
   else
   begin
      rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                                    edtDataVencto.Date,
                                                    True,
                                                   );

      edtSaldoDevedor.Value  := rSaldosAntPos.fSaldoDevPos;

      edtParcRestantes.Value := rSaldosAntPos.iParcRestaPos;

      DBspnParcelas.MinValue := 1;
      DBspnParcelas.Value     := edtParcRestantes.Value;
      edtMargem.Value         := 0;
      edtValorParcela.Value   := 0;
      edtVlrAmortizacao.Value := 0;
   end;
   // ----------------------------------------------------------------------------------------------

   // abre a query HistMov com os parâmetros passados
   with qryHistMov do
   begin
      LimpaParametros(qryHistMov);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

      // considera em aberto apenas prestações não suspensas, para FUNCEF
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         ParamByName('PFLGSUSPENSAO').AsInteger := 1;
      end;

      ParamByName('IDEMPRESA').AsInteger := Sistema.TipoCliente;

      if Sistema.TipoCliente = 20071 then
         ParamByName('PDATAVENCTO').AsDateTime := edtDataVencto.Date;

      Open;
   end;

   with qryTotalizaAberto do
   begin
      LimpaParametros(qryTotalizaAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

      ParamByName('IDEMPRESA').AsInteger := Sistema.TipoCliente;

      if Sistema.TipoCliente = 20071 then
         ParamByName('PDATAVENCTO').AsDateTime := edtDataVencto.Date;

      Open;
   end;

   edtVlrAberto.Value := qryTotalizaAbertoVALOR_TOTAL_ABERTO.AsCurrency;

   fMargem := edtMargem.Value;

   // Marchetti - Pendencia 21596

   if edtMargem.Value = 0 then
   begin
      fMargem := CalcEmptmo.BuscaMargem(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                        dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                        dtmEmptmo.qryDadosContratoIDREGRAMARGEM.AsInteger,
                                        dtmEmptmo.qryDadosContratoVLRSALBASE.AsCurrency,
                                        0, 0,
                                        fSalParticipacao,
                                        fSalMantido,
                                        fSalAuxDoenca,
                                        fSalBenef,
                                        True,
                                        Date,
                                        trunc(edtParcRestantes.Value),
                                        vDividasAnteriores
                                       );
      edtMargem.Value := fMargem;
   end;
   // Fim Marchetti - Pendencia 21596

   // André Pontes - 19/05/2005 - pendência 19284
   edtTxJuros.Value := rSaldosAntPos.fTxJurosAnt;

   // Marchetti - Pendencia 26023
   if edtTxJuros.Value = 0 then
   begin
      LimpaParametros(qryParcelasPosteriores);
      qryParcelasPosteriores.ParamByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
      qryParcelasPosteriores.Open;
      if qryParcelasPosteriores.FieldByName('TOTAL').AsInteger = 0 then
         edtTxJuros.Value := dtmEmptmo.qryDadosContratoTXJUROS.AsFloat;
   end;
   // Fim Marchetti - Pendencia 26023
   // FIM André Pontes - 19/05/2005 - pendência 19284

   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecAmortizacao_92695_395894.btnContinuaEncerraClick(Sender: TObject);
var
   sMsg     : String;
   sForma   : String;
begin
   inherited;

   LimpaParametros(qryTipoContrato);
   qryTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
   qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
   qryTipoContrato.Open;

   qryHistMovVirtual.Close;

   DBrdgDebito.Visible           := False;
   Label30.Visible               := False;
   DBcboFormaRecebimento.Visible := False;

   //  Verificações ---------------------------------------------------------------------------------

   if not(ValidaNumParcela) then
   begin
      if DBspnParcelas.Canfocus then DBspnParcelas.Setfocus;
      Exit;
   end
   else
   begin
      rContrato.NumParcelas := Trunc(DBspnParcelas.Value);
   end;

   if not(VerificaPreenchimentoAmortizacao) then Exit;

   if chkRepactuacao.Checked then
   begin
      // André Pontes - 19/05/2005 - pendência 19284
      edtTxJuros.Value := CalcEmptmo.BuscaTxJuros(rContrato,
                                                  qryTipoContratoIDREGRAJURCONC.AsInteger,
                                                  rSaldosAntPos.iParcelaAnt,
                                                  edtDataVencto.Date,
                                                  edtTxJuros.Value,
                                                  rSaldosAntPos.fSaldoDevAnt,
                                                  False,
                                                  rContrato.Indexador,
                                                  2,
                                                  2
                                                 );
      // FIM André Pontes - 19/05/2005 - pendência 19284
   end;

   if (trim(edtVlrAmortizacao.Text) = '') or (edtVlrAmortizacao.Value = 0) then
   begin
      sMsg  := 'O Valor informado para Amortização está zerado. ' + #13 +
               'Dessa forma, o saldo devedor será apenas REFINANCIADO.' + #13 + #13 +
               'Deseja prosseguir?';

      if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         if edtVlrAmortizacao.CanFocus then edtVlrAmortizacao.SetFocus;
         Exit;
      end;
   end;

   //  ----------------------------------------------------------------------------------------------

   try

      DesabilitaBotoes;

      sMes := FormatDateTime('MM', edtDataVencto.Date);
      sAno := FormatDateTime('YYYY', edtDataVencto.Date);

      //  Serão utilizados os Parâmetros definidos no Sistema

         if (DBspnParcelas.Value > edtParcRestantes.Value) and (edtVlrAmortizacao.Value = 0) then
         begin
            DBrdgDebito.ItemIndex := 1;
         end
         else
         begin
            DBrdgDebito.ItemIndex := 0;
            DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;
         end;

         //  Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
         //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
         //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox
         AtualizaConjunto(True, pnlCAR);


      //  Configurando o Form com a Barra de Progresso que será usado na funçãoCalculaItensAtualiza
      with frmProgresso do
      begin
         BotaoVisivel    := True;
         BotaoHabilitado := False;
      end; //  frmProgresso

      case DBrdgDebito.ItemIndex of
         0: sForma := 'C';
         1: sForma := 'F';
      end;

      fVlrSeguroAnt        := CalcEmptmo.PegaSeguroAnt(rContrato.IDContratoEmptmo);
      fVlrSeguroComplAnt   := CalcEmptmo.PegaSeguroComplAnt(rContrato.IDContratoEmptmo);

      // André Pontes - 05/10/2005
      // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
      dtmEmptmo.Regra.IDCalculo  := 0;
      // FIM André Pontes - 05/10/2005

      if not(CalcEmptmo.CalculaItensAmortizacao(rContrato,
                                                2, // Origem
                                                iPais,
                                                sEstado,
                                                iCidade,
                                                sForma,
                                                edtVlrAmortizacao.Value,
                                                edtDataVencto.Date,
                                                vLista,
                                                True,
                                                False,
                                                fVlrSeguroAnt,
                                                fVlrSeguroComplAnt,
                                                chkRepactuacao.Checked
                                               )) then
      begin
         //  Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
         //   por Cancelamento do Usuário, logo o procedimento será abortado
         Exit;
      end;

      PreencheTabelaVirtual;

      if CalculaParcela then ntbPrincipal.PageIndex := 2;

   finally
      HabilitaBotoes;
   end;
end;



procedure TfrmExecAmortizacao_92695_395894.PreencheTabelaVirtual;
var
   i        : Integer;
   iParcela : Integer;
begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   // Marchetti - Pendencia 23083
   iParcela := VerificaNumeroParcela;
   // Fim Marchetti - Pendencia 23083

   //  Laço que varre o vetor Lista inserindo na tabela virtual TODOS os
   //   itens calculados
   for i := 0 to High(vLista) do
   begin

      // Marchetti - Pendencia 23083
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then vLista[i].Parcela := iParcela;
      // Fim Marchetti - Pendencia 23083

      if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then
      begin
         DBrdgDebito.Visible           := True;
         Label30.Visible               := True;
         DBcboFormaRecebimento.Visible := True;
      end;

      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMes + '/' + sAno;
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
        0: qryHistMovVirtualEVENTO.AsString := 'Concessão';
         1: qryHistMovVirtualEVENTO.AsString := 'Prestação';
        2: qryHistMovVirtualEVENTO.AsString := 'Amortização/Refin.';
        3: qryHistMovVirtualEVENTO.AsString := 'Quitação';
        4: qryHistMovVirtualEVENTO.AsString := 'Atualização Débito';
      end;//  case 

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;

      if edtTxJuros.Value > 0 then vLista[i].TxJuros := edtTxJuros.Value;

      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELAALT.AsInteger     := vLista[i].ParcelaAlt;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

      fSldDevAposAmort                             := vLista[i].SaldoDevedor;

      qryHistMovVirtual.Post;
   end;  // for i := 0 to High(vLista)
end;



procedure TfrmExecAmortizacao_92695_395894.btnConfirmarClick(Sender: TObject);
var
   bErro                : Boolean;
   sMensErro            : String;
   sFormaEnvio          : String;
   iParcela             : Integer;
   i, iResult           : Integer;
   iPlanilhaResult      : Integer;
   fVlrAmortizacao      : Currency;
   sResult, sErro       : TStringList;
   iIdHistMovEmptmo     : Extended;
   rLogTotalPrev        : TLogTotalPrev;
   MemResult, MemErro   : TMemo;
   dDataAtuDia          : TDateTime;
   //Pendência 20133 - 20/01/2007 - Alberto
   iIdCBancaria         : Integer;
   //Fim Pendência 20133
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   bErro       := False;
   sMensErro   := '';
   sResult     := TStringList.Create;
   sErro       := TStringList.Create;

   //  verifica o preenchimento do PortadorForma se o destino for CaR 
   if ( (DBrdgDebito.ItemIndex = 0) and (DBcboFormaRecebimento.LookupValue = '') ) then
   begin
      sMensErro := 'É necessário indicar a Conta de Caixa x Forma Recebimento!';
      MsgDlg(sMensErro, 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   DesabilitaBotoes;

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   try

     // ******************************************************************************
     //               HISTÓRICO  DO  EMPRÉSTIMO  A SER QUITADO
     //
     // função que varre a lista de itens de um contrato e se for o caso,
     //  chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO.
     //  A saída será True se a operação foi bem sucedida e False caso negativo
     // ******************************************************************************

      case DBrdgDebito.ItemIndex of
         0: sFormaEnvio := 'C';
         1: sFormaEnvio := 'F';
      end;

      for i := 0 to High(vLista) do
      begin
         // Alteração do nº da prestação
         if edtParcRestantes.Value <> DBspnParcelas.Value then vLista[i].ParcelaAlt := 0;

         if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then
         begin
            if vLista[i].Valor = 0 then
            begin
               vLista[i].ValorEfetivo := 0;
               vLista[i].DataEfetiva  := edtDataVencto.Date;
               vLista[i].FlgBaixado   := -1;
               vLista[i].FlgEnvio     := -1;
               vLista[i].FormaCobranca := '';
            end;
         end;
      end;

      //Pendência 20133 - 20/01/2007 - Alberto
      // grava a conta bancária independentemente da forma de pagamento
      if (not dsBancoDeb.DataSet.IsEmpty) and
         (dsBancoDeb.DataSet.FieldByName('IDCBANCARIA').AsInteger <> rContrato.IDCBancariaDeb) and
         (DBContaDeb.Enabled) then
         iIdCBancaria := dsBancoDeb.DataSet.FieldByName('IDCBANCARIA').AsInteger
      else
         iIdCBancaria := -1;
      //Fim Pendência 20133

      if not(CalcEmptmo.GravaMovEmptmo(rContrato,
                                       vLista,
                                       2,                                              //  Evento 2 - Amortização
                                       qryHistMovVirtualHMEPARCELA.AsInteger,          //  Parcela
                                       qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger,   //  Ano Competência - Ano do Item
                                       qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger,   //  Mês Competência - Mês do Item
                                       StrToInt(sAno),                                 //  Ano Cobrança - Ano da Data de Quitação
                                       StrToInt(sMes),                                 //  Mês Cobranca - Mês da Data de Quitação
                                       trunc(DBspnParcelas.Value),                     //  Parcelas Remanescentes
                                       edtDataVencto.Date,                             //  DataPrevista -> Data de Amortização
                                                                                       //  dDataUltAtualiza -> Data de Amortização
                                       rSaldosAntPos.dDataAtuPos,
                                       sFormaEnvio,
                                       '',
                                       True                                            //  Mostra o Form de Progresso
                                       //Pendência 20133 - 20/01/2007 - Alberto
                                       ,iIdCBancaria                                   // Conta Bancaria
                                       //Fim Pendência 20133
                                      )) then
      begin
         //  Gravação do Histórido com Erro
         bErro       := True;
         sMensErro   := '[ Gravação do Histórido dos Itens de Contrato ]';
         Exit;
      end;//  if GravaMovEmptmo 


      // -------------------------------------------------------------------------------------------
      //    Contabilização
      // -------------------------------------------------------------------------------------------
      if not(chkNAOContabiliza.Checked) then
      begin
         if (dtmemptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
            (dtmEmptmo.qryParamEmptmoFLGINTEGRAQUITA.AsInteger = 0)  then
         begin
            iResult := ContabilizaAmortizacao(rContrato.IDContratoEmptmo, iPlanilhaResult, sResult, sErro);

            if iResult <> 0 then
            begin
               //  Contabilização com Erro
               bErro := True;

               case iResult of
                  -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a contabilizar ]';
                  -2 : sMensErro := '[ Query não retornou itens a contabilizar ]';
                  -3 : sMensErro := '[ ERRO ao tentar criar tabela para agrupamento ]';
                  -4 : sMensErro := '[ ERRO ao buscar Parâmetros de Integração ]';
                  -5 : sMensErro := '[ ERRO ao fazer o Lançamento Contábil ]';
                  -6 : sMensErro := '[ ERRO no Período Contábil ]';
                  -7 : sMensErro := '[ Processo interrompido pelo usuário sem contabilização ]';
               end;//  case 

               sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count -1];

               Exit;
            end;  // if iResult <> 0
         end;  // if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1)
      end;  // if not(chkNAOContabiliza.Checked)
      // -------------------------------------------------------------------------------------------
      //    FIM Contabilização
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      //    Envio
      // -------------------------------------------------------------------------------------------
      //  laço para vrificar o valor "líquido" (a enviar) de Amortização 
      for i := 0 to High(vLista) do
      begin
         if ( (vLista[i].iEvento = 2) and (vLista[i].FlgCentraliza = 1) ) then
         begin
            fVlrAmortizacao := vLista[i].Valor;
         end;
      end;

      //  só envia se houver valor líquido a enviar
      if fVlrAmortizacao > 0 then
      begin
         if DBrdgDebito.ItemIndex = 0 then
         begin
            // o Débito é pelo Contas a Receber
            iPlanilhaResult := 0;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 11/08/2004
         if dtmEmptmo.qryParamEmptmoFLGENVIAAMORTIZA.AsInteger = 1 then
         begin
            iResult  := 0;
         end
         else
         begin
            iResult  := EnviaAmortizacaoCAPCAR(iPlanilhaResult,
                                               sResult,
                                               sErro
                                              );
         end;
         // FIM André Pontes - 11/08/2004
         // ----------------------------------------------------------------------------------------




            if (iResult <> 0) and (iResult <> -2) then
            begin
               //  Envio CAP com Erro 
               bErro := True;

               case iResult of
               //  Códigos de retorno (controle de erro):
               //    0 : Envio(s) realizados com sucesso 
                  -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a enviar ao CAP/CAR ]';
                  -3 : sMensErro := '[ ERRO ao inserir Documento no CAP/CAR ]';
                  -4 : sMensErro := '[ ERRO no Rateio do Documento no CAP/CAR ]';
                  -5 : sMensErro := '[ ERRO ao Lançar Documento no CAP/CAR ]';
                  -6 : sMensErro := '[ ERRO ao inserir Mensagens no Documento ]';
                  -7 : sMensErro := '[ ERRO ao Atualizar Histórico com o Documento no CAP/CAR ]';
                  -8 : sMensErro := '[ Processo interrompido pelo usuário sem envio ao CAP/CAR ]';
               end;//  case

               sMensErro := sMensErro + #13 +
                            sErro.Strings[sErro.Count -1];

               Exit;
            end; //  if Result CAP
         end
         else
         begin
            //  o Débito é pela Folha: NADA é feito na Quitação.
            // A Quitação será enviado para TMPDESC pela rotina do ENVIO 
         end; //  if FlgFormaPag 

      end; //  if fVlrAmortizacao > 0 
      // -------------------------------------------------------------------------------------------
      //    FIM Envio
      // -------------------------------------------------------------------------------------------

      //  Atualiza a Situação do Contrato
      CalcEmptmo.AcertaSituacaoContratual(rContrato.IDContratoEmptmo);

      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Amortização do Contrato ' +
                                       FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ref: ' +
                                       FormatDateTime('dd/mm/yyyy', edtDataVencto.Date))) then
      begin
         bErro := True;
         sMensErro := '[ Falha na gravação do Log da operação ]' + #13 + sMensErro;
      end;
      // -------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := 2;

      rLogTotalPrev.Operacao   := 'Amortização: ' + FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);

      // André Pontes - 20/12/2005
      if chkExcepcional.Checked then rLogTotalPrev.Operacao   := rLogTotalPrev.Operacao + 'EXCEPCIONAL';

      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // Marchetti - Pendencia 22042
      IntegraModulo.iEvento         := 4;
      IntegraModulo.iContratoEmptmo := rContrato.IDContratoEmptmo;
      // Fim Marchetti - Pendencia 22042

      // -------------------------------------------------------------------------------------------

   finally

      if bErro then
      begin
         // Houve erro
         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

         MsgDlg('Erro na Amortização do Contrato' + #13 + sMensErro, 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end
      else
      begin
         if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
         begin
            dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(rContrato.IDContratoEmptmo, -1);

            dtmAtualizacaoDiaria.ExecutaAtuDia(rContrato.IDContratoEmptmo, // Contrato
                                               Sistema.IDModulo, 
                                               -1,                         // Tipo Contr
                                               -1,                         // Tipo Emptmo
                                               -1,                         // Patro
                                               -1,                         // Plano
                                               1,                          // Estorno
                                               0,                          // Prov Perda
                                               1,                          // Atu Saldo
                                               -1,                         // In Arquivo
                                               -1,                         // Not In Arquivo
                                               edtDataVencto.Date,         // Data Ini
                                               dDataAtuDia,                // Data Fim
                                               edtDataVencto.Date - 1      // Data Considera
                                              );
            // -------------------------------------------------------------------------------------
         end;

         // Não houve erro
         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         //  fecha a qry
         LimpaParametros(dtmEmptmo.qryDadosContrato);

         //  volta para primeira página
         ntbPrincipal.PageIndex  := 0;

         MsgDlg('Amortização realizada com Sucesso.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

         // Marchetti - Pendencia 22042
         if Sistema.IdModulo = 19 then bbtnSairClick(Self);
         // Fim Marchetti - Pendencia 22042

      end; // if bErro

      HabilitaBotoes;

      sResult.Free;
      sErro.Free;
   end;  // try..finally
end;



procedure TfrmExecAmortizacao_92695_395894.FormShow(Sender: TObject);
var
   iDias : Integer;
begin
   inherited;

   ParametrosSistema;

   chkExcepcional.Visible := False;
   if ( (Sistema.TipoCliente = 19981) or (Sistema.TipoCliente = 19991) ) then chkExcepcional.Visible := True;

   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
   sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

   dDataLimite := Sysdate;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      iDias := 3;
      if Time > StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString) then inc(iDias);

      dDataLimite := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                             Sysdate,
                                             iDias,
                                             True,
                                             True,
                                             False
                                            );


   end;

   edtDataVencto.Date   := dDataLimite;

   grpTitular.Visible   := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   iPrograma            := dtmEmptmo.qryParamEmptmoIDPROGRAMA.AsInteger;
   sCentroCusto         := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;

   with dtmEmptmo.qryParamGlobal do
   begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
   end;

   Autorizacao.AutorizarForm(self, afNormal);

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 19 then
   begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);
         LimpaRegistroConcessao(rConcessao);

         Screen.Cursor := crDefault;
         
         //Pendência 20133 - 20/01/2007 - Alberto
         dsBancoDeb.DataSet.Close;
         (dsBancoDeb.DataSet as TQuery).ParamByName('PIDPESSOA').AsInteger := rContrato.IDBenef;
         dsBancoDeb.DataSet.Open;
         with dsBancoDeb.DataSet do
            while not Eof do begin
               if FieldByName('IDCBANCARIA').AsInteger = rContrato.IDCBancariaDeb then
                  break;
               Next;
            end;
         //Fim Pendência 20133

         //  Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
         begin
            btnContinuaSelecao.Enabled := True;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;
            MsgDlg('Não é possível Amortizar um Empréstimo cujo crédito ainda não foi confirmado.', 'Empréstimo', mtInformation, [mbOk], 0);
            Repaint;
         end;
      end;
      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;



procedure TfrmExecAmortizacao_92695_395894.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 1;
end;



procedure TfrmExecAmortizacao_92695_395894.btnCancelaEncerraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



function TfrmExecAmortizacao_92695_395894.ContabilizaAmortizacao(const iContrato        : Extended;
                                                    var   iPlanilhaResult  : Integer;
                                                    var   sResult          : TStringList;
                                                    var   sErro            : TStringList
                                                   ): Integer;
var
   sSql     : String;
   sMensagem: String;
begin
   //Pendência 23254 - 01/02/2007 - Alberto
   sSql :=
   'SELECT '                                                                          + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                  + #13 +
   '  ITE.ITEDESCRICAO, HME.HMEFORMACOBRANCA, HME.HMEVLRPREVISTO, '                   + #13 +
   '  HME.HMEVLRPREVISTO, C.IDTIPOCONTREMPTMO, HME.IDPATROANT AS IDPATRO, '           + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOORIGEM, HME.IDPLANOCONTANT AS IDPLANOPREV, '       + #13 +
   '  ITC.TIPCODIGO '                                                                 + #13 +
   'FROM '                                                                            + #13 +
   '  CONTRATOEMPTMO  C, '                                                            + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                          + #13 +
   '  ITEMEMPTMO      ITE, '                                                          + #13 +
   '  TIPOCONTREMPTMO TC, '                                                           + #13 +
   '  TIPOEMPTMO      TE, '                                                           + #13 +
   '  ( '                                                                             + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                 + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                            + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                        + #13 +
   '                                   FROM   MIGRACONTRATOEP '                       + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO ' + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '        + #13 +
   '      AND    H.IDCONTRATOEMPTMO = ' + FormatFloat('#0', iContrato) + ' '          + #13 +
   '      AND    H.HMEDATAPREVISTA  = TO_DATE(' + QuotedStr(edtDataVencto.Text) + ') '+ #13 +
   '      AND    H.HMETIPOMOV            = 2 '                                        + #13 +
   '      AND    NVL(H.FLGESTORNADO, 0)  = 0 '                                        + #13 +
   '      AND    H.HMESEQCOBRANCA        = 1 '                                        + #13 +
   '      AND    H.HMEVLRPREVISTO        <> 0 '                                       + #13 +
   '      AND    H.FLGBAIXADO            = 0 '                                        + #13 +
   '      AND    (H.HMECENTRALIZA        = 0 OR H.HMECENTRALIZA IS NULL) '            + #13 +
   '      AND    (H.FLGQUITADO           = 0 OR H.FLGQUITADO IS NULL) '               + #13 +
   '      AND    (H.FLGABONADO           = 0 OR H.FLGABONADO IS NULL ) '              + #13 +
   '      UNION   ALL '                                                               + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                           + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '         + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                  + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                            + #13 +
   '      AND    NOT EXISTS( SELECT * '                                               + #13 +
   '                         FROM   MIGRACONTRATOEP '                                 + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '           + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                  + #13 +
   '      AND    H.IDCONTRATOEMPTMO = ' + FormatFloat('#0', iContrato) + ' '          + #13 +
   '      AND    H.HMEDATAPREVISTA  = TO_DATE(' + QuotedStr(edtDataVencto.Text) + ') '+ #13 +
   '      AND    H.HMETIPOMOV            = 2 '                                        + #13 +
   '      AND    NVL(H.FLGESTORNADO, 0)  = 0 '                                        + #13 +
   '      AND    H.HMESEQCOBRANCA        = 1 '                                        + #13 +
   '      AND    H.HMEVLRPREVISTO        <> 0 '                                       + #13 +
   '      AND    H.FLGBAIXADO            = 0 '                                        + #13 +
   '      AND    (H.HMECENTRALIZA        = 0 OR H.HMECENTRALIZA IS NULL) '            + #13 +
   '      AND    (H.FLGQUITADO           = 0 OR H.FLGQUITADO IS NULL) '               + #13 +
   '      AND    (H.FLGABONADO           = 0 OR H.FLGABONADO IS NULL) '               + #13 +
   '  ) HME '                                                                         + #13 +
   'WHERE '                                                                           + #13 +
   '      TE.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa) + ' '            + #13 +
   '  AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '                                              + #13 +
   '  AND HME.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO '                             + #13 +
   '  AND C.IDTIPOCONTREMPTMO      = TC.IDTIPOCONTREMPTMO '                           + #13 +
   '  AND TC.IDTIPOEMPTMO          = TE.IDTIPOEMPTMO '                                + #13 +
   '  AND C.IDTIPOCONTREMPTMO      = ITC.IDTIPOCONTREMPTMO '                          + #13 +
   '  AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                               + #13 +
   '  AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '                               + #13 +
   '  AND ITE.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '                               + #13 +
   '  AND ITC.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                           + #13;
   //Fim Pendência 23254

   sMensagem := 'EMPRÉSTIMOS DE PARTICIPANTES - Amortização - Contrato nº ' + FormatFloat('#0', iContrato);

   // ----------------------------------------------------------------------------------------------

   Result := IntegraEmptmo.ContabilizaItens('C',
                                            'N',
                                            sSql,
                                            sMensagem,	            //  Histórico
                                            edtDataVencto.Date, //  Data do Lançamento
                                            sResult,                 //  Acertos
                                            sErro,                   //  Erros
                                            iPlanilhaResult          //  Planilha
                                           );

   // ----------------------------------------------------------------------------------------------
end;



function TfrmExecAmortizacao_92695_395894.EnviaAmortizacaoCAPCAR(var iPlanilha: Integer;
                                                    var sResult,sErro: TStringList): Integer;
var
	sSql: String;
begin
   sSql :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                      + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +
   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOPREV, '                                                   + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOORIGEM, '                                                 + #13 +
   '  HME.IDPATROANT AS IDPATRO, '                                                           + #13 +
   '  CNT.IDBENEF, CNT.IDPESSOA, '                                                           + #13 +
   '  ''               '' AS MATRICULA,  '                                                   + #13 +
   '  CNT.CODFORMAPAG, CNT.PORTFORMAPAG, CNT.IDTIPOSUSPEMPTMO, '                             + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, '                                             + #13 +
   '  DECODE(HME.IDCBANCARIA,NULL,CNT.IDCBANCARIADEB,HME.IDCBANCARIA) AS IDCBANCARIADEB, '   + #13 +
   '  CNT.IDCBANCARIA, '                                                                     + #13 +
    DBcboFormaRecebimento.LookupValue + ' AS PORTFORMAREC '                                  + #13 +
   'FROM '                                                                                   + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  H.IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' '+ #13 +
   '      AND    M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '      AND    H.FLGBAIXADO       = 0 '                                                    + #13 +
   '      AND    H.HMETIPOMOV       = 2 '                                                    + #13 +
   '      AND    H.FLGENVIO         = 0 '                                                    + #13 +
   '      AND    (H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1) '                             + #13 +
   '      AND    (H.FLGESTORNADO    IS NULL OR H.FLGESTORNADO = 0) '                         + #13 +
   '      UNION   ALL '                                                                      + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  H.IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' '+ #13 +
   '      AND    C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13 +
   '      AND    H.FLGBAIXADO       = 0 '                                                    + #13 +
   '      AND    H.HMETIPOMOV       = 2 '                                                    + #13 +
   '      AND    H.FLGENVIO         = 0 '                                                    + #13 +
   '      AND    (H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1) '                             + #13 +
   '      AND    (H.FLGESTORNADO    IS NULL OR H.FLGESTORNADO = 0) '                         + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '  TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.IdEmpresa) + ' AND '                      + #13 +
   '  HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  AND '                                    + #13 +
   '  CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO AND '                                    + #13 +
   '  TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO AND '                                         + #13 +
   '  CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO AND '                                    + #13 +
   '  ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO AND '                                         + #13 +
   '  ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ';
   //Fim Pendência 23254

   Result := IntegraEmptmo.EnviaCAPCAR(sSql,
                                       'Amortizacao - ',
                                       SysDate,
                                       -1,
                                       iMoedaCorrente,
                                       sCentroCusto,
                                       iPrograma,
                                       iPlanilha,
                                       sResult,
                                       sErro
                                      );

   // ----------------------------------------------------------------------------------------------
end;



function TfrmExecAmortizacao_92695_395894.ValidaNumParcela: boolean;
begin
   if DBspnParcelas.Text = '' then
   begin
      MsgDlg('O prazo não pode ser branco.', 'Empréstimo', mtWarning,[mbOk],0);
      Repaint;
      DBspnParcelas.Value  := StrToFloat(FormatFloat('#,##0', edtParcRestantes.Value));
      Result               := False;
   end
   else if DBspnParcelas.Text = '0' then
   begin
      MsgDlg('O prazo não pode ser zero.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      DBspnParcelas.Value  := StrToFloat(FormatFloat('#,##0', edtParcRestantes.Value));
      Result               := False;
   end
   // Somente para a FUSESC, pois não é permitido aumento de prazo do contrato
   // Marchetti - Pendencia 27040
   else if (Sistema.TipoCliente = 20071) and (Trunc(DBspnParcelas.Value) > StrToInt(edtParcRestantes.Text)) then
   begin
      MsgDlg('O prazo não pode ser superior ao número de parcelas restantes.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      DBspnParcelas.Value  := StrToFloat(FormatFloat('#,##0', edtParcRestantes.Value));
      Result               := False;
   end
   // Fim Marchetti - Pendencia 27040   
   else
   begin
      Result := True;
   end;
end;



function TfrmExecAmortizacao_92695_395894.CalculaParcela: Boolean;
var
   i           : Integer;
   bBloqueio   : Boolean;
begin
   Result := True;

   //  Procedure que Calcula o Valor da parcela, verificando também se é atendida
   //   a Regra de Limites e calculando o valor Líquido do Empréstimo 

   //  Se o usuário ainda não preencheu o Valor solicitado, o procedimento é abortado
   if ((edtVlrAmortizacao.Text = '' ) or (edtVlrAmortizacao.Text = '0')) then Exit;

   if CalcEmptmo.CalculaItens(rContrato,
                              rConcessao,
                              1, // Evento = Parcela
                              2, // Origem = Geração de Parcelas
                              iPais, sEstado, iCidade,
                              rSaldosAntPos.iParcelaPos,
                              dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                              rContrato.FlgFormaRec,
                              rSaldosAntPos.fTxJurosPos,
                              fSldDevAposAmort,
                              0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                              //  VlrSolic, SaldoQuit, Margem, Reserva, SalPart,
                              //  SalMantido, SalDoenca, SalBenef, VlrMaxPermit
                              0, 0, 0,
                              edtDataVencto.Date,
                              rSaldosAntPos.dDataAtuPos,
                              ' ',
                              True,
                              False,
                              False,
                              vItensParc,
                              0,
                              fVlrSeguroAnt,
                              fVlrSeguroComplAnt
                             ) then

   for i := 0 to High(vItensParc) do
   begin
      //  é a Parcela 
      if ( (vItensParc[i].iEvento = 1) and (vItensParc[i].FlgCentraliza = 1) ) then
      begin
         if vItensParc[i].Valor > 0 then
         begin
            edtValorParcela2.Value  := vItensParc[i].Valor;
            edtValorParcela.Value   := vItensParc[i].Valor;
         end
         else
         begin
            edtValorParcela.Value   := 0;
            edtValorParcela2.Value  := 0;
         end;

      end;
   end;

   fMargem := edtMargem.Value;

   // Marchetti - Pendencia 21596

   if edtMargem.Value = 0 then
   begin
      fMargem := CalcEmptmo.BuscaMargem(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                        dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                        dtmEmptmo.qryDadosContratoIDREGRAMARGEM.AsInteger,
                                        dtmEmptmo.qryDadosContratoVLRSALBASE.AsCurrency,
                                        0, 0,
                                        fSalParticipacao,
                                        fSalMantido,
                                        fSalAuxDoenca,
                                        fSalBenef,
                                        True,
                                        Date,
                                        trunc(edtParcRestantes.Value),
                                        vDividasAnteriores
                                       );
      edtMargem.Value := fMargem;

   end;
   // Fim Marchetti - Pendencia 21596

   // ----------------------------------------------------------------------------------------------
   bBloqueio := False;
   if (edtValorParcela2.Value > fMargem) then
   begin
      bBloqueio := True;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         bBloqueio := False;

      end
      else
      begin
         MsgDlg('O valor resultante da prestação: ' + FormatFloat('#,##0.00', edtValorParcela2.Value) +
                ' não pode ser superior à margem consignável!', 'Empréstimo', mtWarning, [mbOk], 0);

         bBloqueio := True;
      end;

      Repaint;

      if bBloqueio then
      begin
         bbtnSimula.Enabled   := True;
         Result               := False;
         Exit;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then
   begin
      //  função da unit UCalcEmptmo que busca a Reserva de Poupança do participante ou
      //   do beneficiário, no caso do pensionista
      fReserva := CalcEmptmo.BuscaReserva(dtmEmptmo.qryDadosContratoIDBENEF.AsInteger, dtmEmptmo.qryDadosContratoIDPATRO.AsInteger,
                                          dtmEmptmo.qryDadosContratoIDPLANOPREV.AsInteger, dtmEmptmo.qryDadosContratoIDREGRARESERVA.AsInteger,
                                          dtmEmptmo.qryDadosContratoDATAASSINATURA.AsDateTime, True);

      //  função da unit UCalcEmptmo que verifica se o participante atende Limites
      //   de concessão e limites de Quantidade e Prazos do Contrato/Empréstimo.
      //   O Atributo Flimites(PRIVATE) armazena o resultado da Regra de Limites
      bLimites := CalcEmptmo.BuscaLimites(rContrato,
                                          2,    // origem = Amortização
                                          dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                                          dtmEmptmo.qryDadosContratoIDREGRALIMITES.AsInteger,
                                          dDataFinalBeneficio,
                                          fMargem,
                                          fReserva,
                                          0,
                                          0,
                                          fSaldoaQuitar,
                                          dtmEmptmo.qryDadosContratoDATAASSINATURA.AsDateTime,
                                          0,
                                          True  // Mostra
                                         );
      if not(bLimites) then
      begin
         Result := False;

         MsgDlg('Empréstimo não passou na Regra de Limites.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;//  if not bLimites
   end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1
end;



procedure TfrmExecAmortizacao_92695_395894.edtDataVenctoExit(Sender: TObject);
begin
   inherited;

   PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

   rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                                 edtDataVencto.Date
                                                );
                                                
   edtSaldoDevedor.Value   := rSaldosAntPos.fSaldoDevPos;
   edtParcRestantes.Value  := rSaldosAntPos.iParcRestaPos;


   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
   end
   else
   begin
      edtParcRestantes.Value  := rSaldosAntPos.iParcRestaPos;
   end;

   DBspnParcelas.MinValue  := 1;
   DBspnParcelas.Value     := edtParcRestantes.Value;
end;



function TfrmExecAmortizacao_92695_395894.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Amortização!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if not(chkExcepcional.Checked) then // André Pontes - 20/12/2005
         // Marchetti - Pendencia 25812
         if (dtmEmptmo.qryParamEmptmoFLGAMORTRETROATIV.AsInteger = 0) and (edtDataVencto.Date < trunc(Sysdate)) then
         // Fim Marchetti - Pendencia 25812
            raise EValidacao.CreateVal('A Data da Amortização não pode ser anterior a hoje!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if not(chkExcepcional.Checked) then // André Pontes - 20/12/2005
         // Marchetti - Pendencia 25812
         if (dtmEmptmo.qryParamEmptmoFLGAMORTRETROATIV.AsInteger = 0) and (edtDataVencto.Date < trunc(dDataLimite)) then
         // Fim Marchetti - Pendencia 25812
            raise EValidacao.CreateVal('A Data da Amortização não pode ser anterior a ' +
                                       FormatDateTime('dd/mm/yyyy', dDataLimite) + '!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if edtDataVencto.Date <= rContrato.DataCredito then
         raise EValidacao.CreateVal('A Data da Amortização precisa ser posterior à Data de Crédito do Empréstimo!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if CalcEmptmo.ExisteQuitacao(rContrato.IDContratoEmptmo) then
         raise EValidacao.CreateVal('Já existe uma quitação lançada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      //  verifica se já houve amortização na própria data: THERE CAN BE ONLY ONE !!!
      if dtmDividaEP.ExisteAmortizacaoMesmaData(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Já houve uma Amortização na data indicada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if dtmDividaEP.ExisteAmortizacaoPosterior(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Já existe uma Amortização posterior à data indicada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if dtmDividaEP.ExisteAmortizacaoAnteriorEmAberto(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Existe uma Amortização anterior em aberto!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if not(chkExcepcional.Checked) then // André Pontes - 20/12/2005
         if dtmEmptmo.qryParamEmptmoFLGAMTPRESTAB.AsInteger = 1 then
            if CalcEmptmo.ExisteParcelaAtrasadaEmAberto(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
               raise EValidacao.CreateVal('Existe(m) parcela(s) anterior(es) em aberto!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      //  se a amortização for antes da data de última atualização, verifica quantas atualizações
      //   posteriores à data de amortizção existem: THERE CAN BE ONLY ONE !!!
      if edtDataVencto.Date <= dtmEmptmo.qryDadosContratoDATAULTATUALIZA.AsDateTime then
         if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger <> 1 then
            if not(VerificaAtualizacaoPosterior) then
               raise EValidacao.CreateVal('Há mais de uma atualização do Saldo Devedor posterior à data de Amortização!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      //  Se trabalha com atualização diária, deve existir cálculo da mesma para a data da amortização
      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
        if not(CalcEmptmo.PossuiAtualizacaoDiaria(rContrato.IDContratoEmptmo, edtDataVencto.Date)) then
            raise EValidacao.CreateVal('Não existe Atualização Diária para a Data da Amortização!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataVencto);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataVencto);
         end;
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



function TfrmExecAmortizacao_92695_395894.VerificaPreenchimentoAmortizacao: Boolean;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if edtVlrAmortizacao.Value >= edtSaldoDevedor.Value then
         raise EValidacao.CreateVal('O Valor informado para Amortização está maior ou igual ao saldo ' +
                                    'devedor. ' + #13 + 'Se desejar quitar o Empréstimo, favor proceder ' +
                                    'a uma Quitação.', edtVlrAmortizacao);

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      // Verifica se o Tipo de contrato bloqueia Refinanciamento / Repactuação
      if qryTipoContratoFLGNAOREFINANCIA.AsInteger = 1 then
      begin
         if chkRepactuacao.Checked then
            raise EValidacao.CreateVal('Esse Tipo de Contrato não permite Repactuação!', chkRepactuacao);

         if trunc(DBspnParcelas.Value) <> trunc(edtParcRestantes.Value) then
            raise EValidacao.CreateVal('Esse Tipo de Contrato não permite Refinanciamento!', chkRepactuacao);
      end;

      // -------------------------------------------------------------------------------------------

      if not(chkExcepcional.Checked) then // André Pontes - 20/12/2005
         if (dtmEmptmo.qryParamEmptmoFLGAMTPRESTAB.AsInteger = 1) and
            // Marchetti - Pendencia 21925
            (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 0) then
            // Fim Marchetti - Pendencia 21925
            if (qryTotalizaAbertoQUANT_ABERTO.AsInteger > 0) or (qryTotalizaAbertoVALOR_TOTAL_ABERTO.AsCurrency > 0) then
               raise EValidacao.CreateVal('Existe(m) parcela(s) anterior(es) em aberto!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if Sistema.TipoCliente = 19991 then
         if edtParcRestantes.Value <> DBspnParcelas.Value then
            if dtmDividaEP.ExisteItemPosterior(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
               raise EValidacao.CreateVal('Já existe item gerado posterior à data selecionada! ' + #13 +
                                          'Não é permitido refinanciamento, apenas amortização (sem alteração de prazo).',
                                          edtDataVencto
                                         );

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



function TfrmExecAmortizacao_92695_395894.VerificaAtualizacaoPosterior: Boolean;
begin
   Result := True;

   try
      with qryAtualizacoesPosteriores do
      begin
         LimpaParametros(qryAtualizacoesPosteriores);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := edtDataVencto.Date;
         Open;

         if ( not(IsEmpty) and (RecordCount > 1) ) then Result := False;
      end;

   finally
      qryAtualizacoesPosteriores.Close;
   end
end;



procedure TfrmExecAmortizacao_92695_395894.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   //  faz com que as linhas do grid tenham cores alternadas 
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         //  linhas ímpares = amarelo, linhas pares = branco 
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; //  amarelo bebê 
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAmortizacao_92695_395894.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   //  faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         //  linhas ímpares = amarelo, linhas pares = branco 
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; //  amarelo bebê 
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAmortizacao_92695_395894.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   //  acerta as cores quando muda a linha da grid 
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAmortizacao_92695_395894.DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
begin
   inherited;
   //  acerta as cores quando muda a linha da grid 
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAmortizacao_92695_395894.DBrdgDebitoClick(Sender: TObject);
begin
  if DBrdgDebito.ItemIndex = 0 then
  begin
      AtualizaConjunto(True, pnlCAR);
      DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString;

      //Pendência 20133 - 22/01/~2007 - Alberto
      DBContaDeb.Enabled := true;
      dsBancoDeb.DataSet.Close;
      (dsBancoDeb.DataSet as TQuery).ParamByName('PIDPESSOA').AsInteger := rContrato.IDBenef;
      dsBancoDeb.DataSet.Open;
      with dsBancoDeb.DataSet do
        while not Eof do begin
          if FieldByName('IDCBANCARIA').AsInteger = rContrato.IDCBancariaDeb then
            break;
          Next;
        end;
      //Fim Pendência 20133
   end
   else
   begin
      AtualizaConjunto(False, pnlCAR);
      //Pendência 20133 - 22/01/~2007 - Alberto
      DBContaDeb.Enabled := false;
      dsBancoDeb.DataSet.Close;
      //Fim Pendência 20133
   end;
end;



procedure TfrmExecAmortizacao_92695_395894.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmEmptmo.qryDadosContrato.Close;
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sFiltro;
   dtmMS.MS_ContratoEmptmo.RepeteConsulta := bRepeteConsulta;

   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404

   inherited;
end;



procedure TfrmExecAmortizacao_92695_395894.btnAlteraMargemClick(Sender: TObject);
begin
  inherited;
   EdtMargem.Enabled  := True;
   EdtMargem.ReadOnly := False;
   EdtMargem.Color    := clWindow;
   EdtMargem.SetFocus;

end;

procedure TfrmExecAmortizacao_92695_395894.edtMargemExit(Sender: TObject);
begin
  inherited;
   EdtMargem.ReadOnly := True;
   EdtMargem.Color    := clBtnFace;
end;

procedure TfrmExecAmortizacao_92695_395894.bbtnSimulaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelSimula, FrmRelSimula);

  if Simulacao then
  begin
     FrmRelSimula.ShowModal;
     FrmRelSimula.Release;
  end
  else
  begin
     FrmRelSimula.Free;
  end;
  bbtnSimula.Enabled := False;

end;


function TfrmExecAmortizacao_92695_395894.Simulacao : Boolean;
var
   sAnoMesCompet        : String;
   sSql, sSqlExec       : String;
   vSQL                 : array of String;
   i, j, iPMin, iPMax   : Integer;
   vListaSimulacao      : TListaItem;
begin
   Result := True;

   LimpaParametros(qryTipoContrato);
   qryTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
   qryTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := dtmEmptmo.qryDadosContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   qryTipoContrato.Open;

   //  Número mínimo de Parcelas em relação ao tipo de contrato escolhido pelo participante 
   iPMin := 1;

   //  Número máximo de Parcelas em relação ao tipo de contrato escolhido pelo participante 
   iPMax := Round(edtParcRestantes.Value);

   sSql  := '';

   //  Vetor que armazenará uma linha de SQL para cada parcela a ser mostrada no Grid 
   vSQL  := nil;
   //  Vetor que armazenará uma linha de itens de concessão e seus respectivos valores
   //   para cada item levando em consideração o Número de Parcelas 
   vListaSimulacao := nil;

   //  Configurando o Form com a Barra de Progresso 

   try
      for i := 0 to (iPMax - iPMin) do
      begin
         if qryTipoContratoIDREGRAPRAZOSCONC.AsString <> '' then
         begin
            //  Verifica se a Parcela pode ser concedida ou não usando a
            //   VerificaPrazoConcessao que é uma função da unit UCalcEmptmo,
            //   caso negativo interrompe o procedimento indo para o próximo item
            //   do laço(for) 
            if not CalcEmptmo.VerificaPrazoConcessao(dtmEmptmo.qryDadosContratoIDPESSOA.AsInteger,
                                                     dtmEmptmo.qryDadosContratoIDBENEF.AsInteger,
                                                     iPMin + i, // Nº Parcela
                                                     qryTipoContratoIDREGRAPRAZOSCONC.AsInteger
                                                    ) then
            begin
               Continue;
            end;
         end;//  if Regra Prazo de Cocessão 

         //  Montagem de uma linha do SQL referente a uma parcela que será passado
         //   para a query do frmSimulacao 
         sSql := 'SELECT ' + ' ' + IntToStr(iPMin + i) + ' as "Prazo", ';

         sAnoMesCompet  := FormatDateTime('YYYYMM', edtDataVencto.Date);

         //  Utiliza a função CalculaItens da unit UCalcEmptmo para pegar a parcela e
         //   os itens de concessão com seus respectivos valores, em relação ao número de
         //   parcelas escolhida pelo participante 
         CalcEmptmo.CalculaItens(rContrato,
                                 rConcessao,
                                 1, // Evento = Parcela
                                 2, // Origem = Geração de Parcelas
                                 iPais,
                                 sEstado,
                                 iCidade,
                                 rSaldosAntPos.iParcelaPos,
                                 dtmEmptmo.qryDadosContratoIDSITPART.AsInteger,
                                 rContrato.FlgFormaRec,
                                 rSaldosAntPos.fTxJurosPos,
                                 fSldDevAposAmort,
                                 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                 //  VlrSolic, SaldoQuit, Margem, Reserva, SalPart,
                                 // SalMantido, SalDoenca, SalBenef, VlrMaxPermit
                                 0, 0, 0,
                                 edtDataVencto.Date,
                                 rSaldosAntPos.dDataAtuPos,
                                 ' ',
                                 True,
                                 False,
                                 False,
                                 vListaSimulacao
                                );

         //  A declaração do array não aloca memoria.
         //   Uso a procedure SetLength para criar o array em memória, determinando
         //   ou alterando seu tamanho dinâmicamente conforme necessário
         SetLength(vSQL, i + 1);

         //  Laço que varre o vetor Lista adicionando ao SQL TODOS os itens de
         //   concessão e o valor da parcela referente a aquela parcela
         for j := 0 to High(vListaSimulacao) do
         begin
            //  passagem para o SQL do valor do item de PARCELA/CONCESSÃO e seu respectivo nome
            sSql := sSql + ' ' + OraNumero(FloatToStr(vListaSimulacao[j].Valor))
                         + ' as "'+  vListaSimulacao[j].Nome + '",';
         end;//  for j

         //  Armazena no Vetor a Linha de SQL montada para uma determinada parcela
         vSQL[i] := Copy(sSql, 0, Length(sSql) - 1) + ' FROM DUAL';

      end;//  for

      //  Laço que varre o vetor vSQL buscando TODAS as linha do SQL referente a
      //   TODAS as parcela e montando o SQL completo que será passado para a query
      //   do frmSimulacao que mostrará TODAS as parcelas e seus respectivos valores
      for j := 0 to High(vSQL) do
      begin
         if j <= 0 then
         begin
            sSqlExec := vSQL[j];
         end
         else
         begin
            //  Verifica se o SQL da Parcela está vazio caso positivo não adiciona
            //   o UNION e o sql vazio ao SQL completo
            if vSQL[j] <> '' then sSqlExec := sSqlExec + ' UNION ' + vSQL[j];
         end;//  if j <= 1
      end;//  for j

      //  Atribuição do SQL completo para a propridade SQL do frmSimulacao que tem
      //   como objetivo receber o SQL que será usado na Query do Grid
      FrmRelSimula.bbtnConfirmar.Visible  := False;
      FrmRelSimula.btnImprimir.Visible    := False;
      FrmRelSimula.SQL                    := sSqlExec;
   finally
      Repaint;
   end;
end;



function TfrmExecAmortizacao_92695_395894.VerificaNumeroParcela: Integer;
var
   iAnoAtu, iMesAtu, iDiaAtu : word;
   iAnoAnt, iMesAnt, iDiaAnt : word;
   sAnoAtu, sMesAtu          : String;
   sAnoAnt, sMesAnt          : String;

begin

   DecodeDate(edtDataVencto.Date, iAnoAtu, iMesAtu, iDiaAtu);

   LimpaParametros(qryNumeroParcela);
   qryNumeroParcela.paramByName('PIDCONTRATOEMPTMO').AsFloat := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
   qryNumeroParcela.Open;

   DecodeDate(edtDataVencto.Date, iAnoAtu, iMesAtu, iDiaAtu);
   DecodeDate(qryNumeroParcela.FieldByName('HMEDATAVENCTO').AsDateTime, iAnoAnt, iMesAnt, iDiaAnt);

   sAnoAtu := IntToStr(iAnoAtu);
   sMesAtu := IntToStr(iMesAtu);
   sAnoAnt := IntToStr(iAnoAnt);
   sMesAnt := IntToStr(iMesAnt);

   if Length(sMesAtu) = 1 then sMesAtu := '0' + sMesAtu;
   if Length(sMesAnt) = 1 then sMesAnt := '0' + sMesAnt;

   Result := qryNumeroParcela.FieldByName('HMEPARCELA').AsInteger + 1;

   if (sAnoAnt + sMesAnt) >= (sAnoAtu + sMesAtu) then
   begin
      if   qryNumeroParcela.FieldByName('FLGENVIO').IsNull then Result := qryNumeroParcela.FieldByName('HMEPARCELA').AsInteger + 1
      else                                                      Result := qryNumeroParcela.FieldByName('HMEPARCELA').AsInteger;
   end;
end;



end.
