unit FExecQuitacao;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//Nº SOL.............: 224034/17909
//Nº PPM.............: 1165556
//Data da Alteração..: 11/02/2016
//Alteração Form.....: Inclusão de envento atualizando
//Responsável........: Darivaldo Alencar
//Descrição..........: atualização de desbloqueio de contrato por acordo judicial
--------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 197911 Kintana 1896919
Responsável : William Moreira da Silva
Data        : 04/01/2013
Descrição   : O sistema não esta contando o dia atual
--------------------------------------------------------------------------------
Pendência   : SOL 199273 \ Kintana 1919001
Responsável : Higor Nayde Ferreira
Data        : 23/01/2012
Descrição   : Criação do Campo Tipo de Recurso e Origem de Recurso.
--------------------------------------------------------------------------------
Pendência   : SOL 100478 \ Kintana 445454
Responsável : Renato Visoni
Data        : 20/11/2008
Descrição   : Criação do Campo Tipo de Recurso e Origem de Recurso.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : rdgTipoQuitacaoClick
Data      : 03/05/2007
Autor     : Marchetti
Pendencia : 22752
Descrição : habilita a data de falecimento caso seja selecionada Quitação por
            falecimento.
--------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 30/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula
            passada pela CentralAP.
--------------------------------------------------------------------------------
Rotina    : - EXCEPCIONAL
Data      : 20/12/2005
Autor     : André Pontes
Pendência :
Descrição : A pedido de Luciana, excepcional retira críticas de data.
            Gravação de log com o Excepcional.
--------------------------------------------------------------------------------
Rotina    : EnviaQuitacaoCAPCAR
Data      : 06/07/2005
Autor     : André Pontes
Pendência : 19639
Descrição : Correção da query de envio da quitação para CaR.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 05/07/2005
Autor     : André Pontes
Pendência : 19625
Descrição : Retirada da trava de datas para FCRT (fazem retroativo)
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : btnConfirmarClick
Data      : 18/05/2005
Autor     : André Pontes
Pendencia : 19236
Descrição : Se o tipo de quitação for por morte, estorna também itens enviados.
--------------------------------------------------------------------------------
Rotina    : ContabilizaQuitacao
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '
--------------------------------------------------------------------------------
Rotina    : ContabilizaQuitacao
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '   AND HME.HMESEQCOBRANCA         = 1 '
--------------------------------------------------------------------------------
Rotina    : btnConfirmarClick (EnviaQuitacaoCAPCAR)
Data      : 11/08/2004
Pendência :
Autor     : André Pontes
Descrição : Envio no ato regulado por parâmetro do sistema (análogo à concessão)
--------------------------------------------------------------------------------
Rotina    : EnviaQuitacaoCAPCAR
Data      : 03/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem do campo "MATRICULA"
--------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 14/06/2004 a
Autor     : André Pontes
Pendencia : 16984
Descrição : Passagem da data de falecimento.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 17/07/2003
Autor     : Marchetti
Pendencia : 21496 (3S)
Descrição : Chamada da rotina de estorno de provisão de perdas.
--------------------------------------------------------------------------------
Rotina    : ContabilizaQuitacao
Data      : 18/01/2002
Autor     : Andre Pontes
Descrição : Contabilização condicional da quitação, de acordo com parrâmetro do
            sistema.
--------------------------------------------------------------------------------
Rotina    : EnviaCAPCAR
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Colocado o filtro de hmedestacado = 1
--------------------------------------------------------------------------------
Rotina    : ContabilizaQuitacao
Data      : 07/10/2002
Autor     : Marchetti
Descrição : Colocado mensagem para contabilização conforme o tipo.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, uTypesEmptmo, UAutorizacao,
   uCtrlContab, uCtrlPadroes, DBGrids, UFuncoesEmptmo;

type
   TfrmExecQuitacao = class(TfrmSairAjudaImob)
    ntbPrincipal: TNotebook;
      btnContinuaSelecao: TfcShapeBtn;
      DBgrdHistMov: TwwDBGrid;
      btnCancelaEncerra: TfcShapeBtn;
      btnContinuaEncerra: TfcShapeBtn;
      Panel4: TPanel;
      Panel9: TPanel;
      btnCancelaAltera: TfcShapeBtn;
      btnConfirmar: TfcShapeBtn;
      btnBuscaContrato: TBitBtn;
      dts: TwwDataSource;
      dtsHistMov: TwwDataSource;
      qryHistMov: TwwQuery;
      qryHistMovANOMES: TStringField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      DBrdgDebito: TRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      qryHistMovVirtual: TwwQuery;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualEVENTO: TStringField;
      DBgrdHistMovVirtual: TwwDBGrid;
      updHistMovVirtual: TUpdateSQL;
      lblTitulo: TfcLabel;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      Label2: TLabel;
      edtDataVencto: TCMDateTimePicker;
      Bevel2: TBevel;
      Bevel3: TBevel;
      Bevel1: TBevel;
      rdgTipoQuitacao: TRadioGroup;
      qryUpdateSitFormaFolha: TwwQuery;
      qryUpdateSitFormaCaR: TwwQuery;
      qryUpdateSitFormaPatro: TwwQuery;
      qryAtualizacoesPosteriores: TwwQuery;
      qryAtualizacoesPosterioresHMEDATAATUALIZA: TDateTimeField;
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
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
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
      Label9: TLabel;
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
      Label51: TLabel;
      DBEdit4: TDBEdit;
      qryAtualizaDebito: TwwQuery;
      qryAtualizaDebitoHMEANOCOMPETENCIA: TFloatField;
      qryAtualizaDebitoHMEMESCOMPETENCIA: TFloatField;
      qryAtualizaDebitoHMESEQCOBRANCA: TFloatField;
      qryAtualizaDebitoHMETIPOMOV: TFloatField;
      qryAtualizaDebitoIDCONTRATOEMPTMO: TFloatField;
      qryAtualizaDebitoIDITEMEMPTMO: TFloatField;
      qryAtualizaDebitoHMEDATAPREVISTA: TDateTimeField;
      qryAtualizaDebitoHMEVLRPREVISTO: TFloatField;
      qryAtualizaDebitoHMESALDODEV: TFloatField;
      qryAtualizaDebitoHMEDATAVENCTO: TDateTimeField;
      qryAtualizaDebitoHMETXJUROS: TFloatField;
      qryAtualizaDebitoHMEPARCELA: TFloatField;
      qryAtualizaDebitoHMEFORMACOBRANCA: TStringField;
      qryAtualizaDebitoHMEPRIORIDADE: TFloatField;
      qryAtualizaDebitoIDHISTMOVEMPTMO: TFloatField;
      qryAtualizaDebitoHMEANOCOBRANCA: TFloatField;
      qryAtualizaDebitoHMEMESCOBRANCA: TFloatField;
      qryAtualizaDebitoIDREGRA: TFloatField;
      qryAtualizaDebitoIDRUBRICA: TFloatField;
      qryAtualizaDebitoHMEORIGEM: TFloatField;
      qryAtualizaDebitoHMECENTRALIZA: TFloatField;
      qryAtualizaDebitoHMEDESTACADO: TFloatField;
      qryAtualizaDebitoHMEDATAATUALIZA: TDateTimeField;
      qryAtualizaDebitoHMENUMPARCELAS: TFloatField;
      qryAtualizaDebitoHMERECPAG: TStringField;
      qryAtualizaDebitoFLGTIPODIVERG: TFloatField;
      qryAtualizaDebitoHMEDATAEFETIVA: TDateTimeField;
      qryAtualizaDebitoHMEVLREFETIVO: TFloatField;
      qryAtualizaDebitoIDITEMCENTRALIZA: TFloatField;
      qryAtualizaDebitoCODDOCUMENTO: TFloatField;
      qryAtualizaDebitoCOMPETENCIA: TStringField;
      qryAtualizaDebitoCOBRANCA: TStringField;
      qryAtualizaDebitoIDPATRO: TFloatField;
      qryAtualizaDebitoIDPLANOPREV: TFloatField;
      qryAtualizaDebitoDATAASSINATURA: TDateTimeField;
      qryAtualizaDebitoNOME: TStringField;
      qryAtualizaDebitoITEDESCRICAO: TStringField;
      qryAtualizaDebitoTSEDESCRICAO: TStringField;
      qryHistMovEVENTO: TStringField;
      Label5: TLabel;
      edtDataFalecimento: TCMDateTimePicker;
      qryHistMovVirtualHMEPARCELAALT: TFloatField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      rdgMetodo: TRadioGroup;
      chkExcepcional: TCheckBox;
      dsBancoDeb: TDataSource;
      DBContaDeb: TDBGrid;
      Bevel6: TBevel;
      Bevel4: TBevel;
      Label23: TLabel;
      cboTipoRecurso: TwwDBLookupCombo;
      EdOrigemRecurso: TEdit;
      Label20: TLabel;
      qryTipoRecurso: TwwQuery;
    QryUptdateContrato: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    qryBloq: TwwQuery;

      procedure btnContinuaSelecaoClick(Sender: TObject);
      procedure btnBuscaContratoClick(Sender: TObject);
      procedure btnContinuaEncerraClick(Sender: TObject);
      procedure btnCancelaEncerraClick(Sender: TObject);
      procedure btnCancelaAlteraClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure DBrdgDebitoClick(Sender: TObject);
      procedure DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bbtnSairClick(Sender: TObject);
      procedure rdgTipoQuitacaoClick(Sender: TObject);
      procedure cboTipoRecursoChange(Sender: TObject);


   private  // Private declarations

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      sArq                 : String;
      sMes, sAno           : String;

      dDataLimite          : TDateTime;

      sCentroCusto         : String;
      iPrograma            : Integer;
      iMoedaCorrente       : Integer;

      rContrato            : TDadosContrato;
      vLista               : TListaItem;
      rSaldosAntPos        : TSaldosAntPos;

      bHabilitado          : Boolean;
      bHabilitaConfirma    : Boolean;
      bIniciouTransacao    : Boolean;

      procedure Sel(i: Extended);

      function VerificaPreenchimento: Boolean;

      procedure AbreQueriesDebito;
      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure PreencheTabelaVirtual;

      function  ContabilizaQuitacao(const iContrato         : Extended;
                                    const iTipoMov          : Integer;
                                    var   iPlanilhaResult   : Integer;
                                    var   sResult           : TStringList;
                                    var   sErro             : TStringList
                                   ): Integer;

      function  EnviaQuitacaoCAPCAR(var iPlanilha : Integer;
                                    var sResult   : TStringList;
                                    var sErro     : TStringList
                                   ): Integer;

      function  VerificaBaixa: Boolean;
      function  VerificaAtualizacaoPosterior: Boolean;
      Procedure UpateContato(sCONTRATO : String);

   public   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula : String;
      iIdbenef   : integer; // xavier

   end;

var
  frmExecQuitacao: TfrmExecQuitacao;


implementation
{$R *.DFM}
uses
   dAtualizacaoDiaria, UMensErro, USistema, UIntegraEmptmo, dEmptmo, DLookEmptmo,
   FProgresso, UDocumento, uDataBase, DBaseDados, UCalcEmptmo, uVerificaPreenchimento, dMS,
   uLancContab, DDividaEP, FExecBuscaContrato, FExecSelecionaContrato, uIntegraModulo;


procedure TfrmExecQuitacao.FormCreate(Sender: TObject);
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

   ntbPrincipal.PageIndex  := 0;
   lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [seleção]';

   dtmEmptmo.qryDadosContrato.Close;

   // Marchetti - Pendencia 22752
   edtDataFalecimento.Enabled := False;
end;

procedure TfrmExecQuitacao.FormActivate(Sender: TObject);
begin
   inherited;

   edtDataVencto.ButtonWidth        := 21;
   DBedtDataCredito.ButtonWidth     := 21;
   DBedtDataInsc.ButtonWidth        := 21;
   DBedtDataPrimParcela.ButtonWidth := 21;
end;

procedure TfrmExecQuitacao.HabilitaBotoes;
begin
   btnContinuaEncerra.Enabled := True;
   btnCancelaEncerra.Enabled  := True;
   btnCancelaAltera.Enabled   := True;
   btnConfirmar.Enabled       := bHabilitaConfirma;
   bbtnAjuda.Enabled          := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;
   Screen.Cursor              := crDefault;
end;

procedure TfrmExecQuitacao.DesabilitaBotoes;
begin
   Screen.Cursor              := crHourGlass;
   ntbPrincipal.Enabled       := False;

   btnContinuaEncerra.Enabled := False;
   btnCancelaEncerra.Enabled  := False;
   btnCancelaAltera.Enabled   := False;
   btnConfirmar.Enabled       := False;
   bbtnAjuda.Enabled          := False;
   bbtnSair.Enabled           := False;
end;

procedure TfrmExecQuitacao.Sel(i: Extended);
begin
   // abre a query principal com os parâmetros passados
   with dtmEmptmo.qryDadosContrato do
   begin
      // Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;

      cboTipoRecurso.LookupValue := trim(FieldByname('idTipoRecurso').asstring);  //Renato Visoni SOL 100478 \ Kintana 445454
      EdOrigemRecurso.Text       := trim(FieldByname('OrigemRecurso').asstring);  //Renato Visoni SOL 100478 \ Kintana 445454
   end;
end;

function TfrmExecQuitacao.VerificaPreenchimento: Boolean;
var
   dData       : TDateTime;
   rSaldo      : TSaldoDevAnt;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;
   try
      // -------------------------------------------------------------------------------------------

      if trim(edtDataVencto.Text) = EmptyStr then
         raise EValidacao.CreateVal('É necessário indicar a Data da Quitação!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      // André Pontes - 07/05/2005 - pendência 19625
      // FCRT faz quitação "retroativa"
      if ((Sistema.TipoCliente <> 20011) and not(chkExcepcional.Checked)) then // André Pontes - 20/12/2005
         if (edtDataVencto.Date < trunc(Sysdate)) then
            raise EValidacao.CreateVal('A Data da Quitação não pode ser anterior a hoje!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      // André Pontes - 07/05/2005 - pendência 19625
      // FCRT faz quitação "retroativa"
      if (rdgTipoQuitacao.ItemIndex = 0) then
         if ((Sistema.TipoCliente <> 20011) and not(chkExcepcional.Checked) ) then // André Pontes - 20/12/2005
            if (edtDataVencto.Date < trunc(dDataLimite)) then
               raise EValidacao.CreateVal('A Data da Quitação não pode ser anterior a ' +
                   FormatDateTime('dd/mm/yyyy', dDataLimite) + '!', edtDataVencto);

      // -------------------------------------------------------------------------------------------
      //Higor Nayde Ferreira  SOL - 199273 KTN - 1919001 INICIO

      // quitação por Falecimento
      if (rdgTipoQuitacao.ItemIndex = 1) then
      begin
      edtDataFalecimento.Date := Date();
         if trim(edtDataFalecimento.Text) = EmptyStr then
            raise EValidacao.CreateVal('É necessário indicar a Data de Falecimento!', edtDataFalecimento);
      end;

      //Higor Nayde Ferreira  SOL - 199273 KTN - 1919001 FIM
      // -------------------------------------------------------------------------------------------

      if (edtDataVencto.Date <= rContrato.DataCredito) then
           raise EValidacao.CreateVal('A Data da Quitação precisa ser posterior à Data de Crédito do Empréstimo!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      // se a quitacao for antes da data de última quitacao, verifica quantas atualizações
      //   posteriores à data de quitação existem: THERE CAN BE ONLY ONE !!!
      if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger <> 1) then
         if not(VerificaAtualizacaoPosterior) then
            raise EValidacao.CreateVal('Há mais de uma atualização do Saldo Devedor posterior à data de Quitação!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
      begin
         if not(CalcEmptmo.PossuiAtualizacaoDiaria(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, edtDataVencto.Date)) then
         begin
            dData  := CalcEmptmo.UltimaDataAtualizacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat);
            rSaldo := CalcEmptmo.SaldoDevAnt(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, dData, -1, -1, False);

            if (rSaldo.fSaldoDevAnt <> 0) then
               raise EValidacao.CreateVal('Não existe Atualização Diária para a data informada!', edtDataVencto);
         end;  // if not(CalcEmptmo.PossuiAtualizacaoDiaria(...
      end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

      // -------------------------------------------------------------------------------------------

      if CalcEmptmo.ExisteQuitacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat) then
         raise EValidacao.CreateVal('Já existe uma quitação lançada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if dtmDividaEP.ExisteAmortizacaoMesmaData(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Já houve uma Amortização na data indicada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if dtmDividaEP.ExisteAmortizacaoMesmaData(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Já houve uma Amortização na data indicada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if dtmDividaEP.ExisteAmortizacaoPosterior(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Já existe uma Amortização posterior à data indicada!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      if dtmDividaEP.ExisteAmortizacaoAnteriorEmAberto(rContrato.IDContratoEmptmo, edtDataVencto.Date) then
         raise EValidacao.CreateVal('Existe uma Amortização anterior em aberto!', edtDataVencto);

      // -------------------------------------------------------------------------------------------

      // André Pontes - 03/06/2005 - pendência 19404
      if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) then
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
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

// Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR
procedure TfrmExecQuitacao.AbreQueriesDebito;
begin
   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;

procedure TfrmExecQuitacao.btnBuscaContratoClick(Sender: TObject);
var
   dDataMorte  : TDateTime;
begin
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := 'AND CON.FLGSITUACAO NOT IN (''C'', ''K'', ''Q'') ' + #13;
      frmExecBuscaContrato.ShowModal;
      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));
         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];
         iIdbenef      := StrToint(frmExecBuscaContrato.ValoresChave[4]); // xavier

         frmExecBuscaContrato.Free;

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato,true);

         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo, edtDataVencto.Date);

         // Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
         begin
            btnContinuaSelecao.Enabled := bHabilitado;

            dDataMorte := CalcEmptmo.BuscaDataMorte(rContrato.IDBenef);

            if (dDataMorte > 0) then
               begin
               edtDataFalecimento.Date    := dDataMorte;
               rdgTipoQuitacao.ItemIndex  := 1;
               edtDataVencto.Date         := Sysdate;

               MsgDlg('Mutuário Falecido. ' + #13 + #13 + 'Quitação deve ser por Falecimento!', 'Empréstimo',
                      mtInformation, [mbOk], 0);
               Repaint;
              end;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;

            MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                   'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
         end; // if

         Screen.Cursor := crDefault;
      end
      else
      begin
         frmExecBuscaContrato.Free;
      end;
   end
   else
   begin
      // Pendência 23384 - 09/10/2006 - Alberto
      if (rdgTipoQuitacao.ItemIndex = 0) then // Antecipada
         dtmMS.MS_ContratoQuitacao.Executar
      else // Por Morte
        dtmMS.MS_ContratoQuitacaoMorte.Executar;

      // redesenha o form na volta do dtmMS.MS_ContratoQuitacao
        Repaint;

      if ((rdgTipoQuitacao.ItemIndex = 0) and
          (dtmMS.MS_ContratoQuitacao.RetornouValor)) or
         ((rdgTipoQuitacao.ItemIndex = 1) and
          (dtmMS.MS_ContratoQuitacaoMorte.RetornouValor)) then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         if (rdgTipoQuitacao.ItemIndex = 0) then // Antecipada
            Sel(StrToFloat(dtmMS.MS_ContratoQuitacao.ValoresChave[0]))
         else // Por Morte
            Sel(StrToFloat(dtmMS.MS_ContratoQuitacaoMorte.ValoresChave[0]));

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato,true);

         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,edtDataVencto.Date);

         // Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
            begin
            btnContinuaSelecao.Enabled := bHabilitado;

            dDataMorte := CalcEmptmo.BuscaDataMorte(rContrato.IDBenef);

            if (dDataMorte > 0) then
               begin
               edtDataFalecimento.Date    := dDataMorte;
               rdgTipoQuitacao.ItemIndex  := 1;
               edtDataVencto.Date         := Sysdate;

               MsgDlg('Mutuário Falecido. ' + #13 + #13 + 'Quitação deve ser por Falecimento!', 'Empréstimo',
                      mtInformation, [mbOk], 0);
               Repaint;
              end;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;
            MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                   'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning, [mbOk], 0);
         end; // if

         Screen.Cursor := crDefault;

      end;  // if MontaSelect.RetornouValor
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
end;

function TfrmExecQuitacao.VerificaBaixa: Boolean;
var
   sSQL              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'SELECT '                            + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '    + #13 +
   'FROM '                              + #13 +
   '  HISTMOVEMPTMO '                   + #13 +
   'WHERE '                             + #13 +
   '      ( IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) ' + #13 +
   '  AND ( HMETIPOMOV       = 0 ) '    + #13 +
   '  AND ( HMECENTRALIZA    = 1 )';

   qryAux.SQL.Text := sSQL;

   try

      qryAux.Open;

      Result := False;

      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then
      begin
         // Participante já recebeu o Crédito do EP, logo pode quitar o EP
         Result := True;
      end
      else
      begin
         if not(qryAux.FieldByName('CODDOCUMENTO').IsNull) then
         begin
            // Participante NÃO recebeu o Crédito do EP
            Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                        '',  // Data do Saldo - Saldo Atual
                                        'P', // RecPag
                                        fSaldo, fSaldoOutraMoeda);

            if (fSaldo = 0) then
            begin
               // Crédito já pago pelo contas a Pagar, logo o participante pode quitar o EP
               Result := True;
            end
            else
            begin
               // Crédito ainda NÃO foi pago pelo contas a Pagar, logo o participante não poderá quitar o EP
               Result := False;
            end; // if fSaldo = 0
         end; // if not Documento
      end; // if not DataEfetiva
   finally
      qryAux.Free;
   end;
end;

function TfrmExecQuitacao.VerificaAtualizacaoPosterior: Boolean;
begin
   Result := True;

   try
      with qryAtualizacoesPosteriores do
      begin
         LimpaParametros(qryAtualizacoesPosteriores);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := edtDataVencto.Date;
         Open;

         if (not(IsEmpty) and (RecordCount > 1)) then
             Result := False;
      end;
   finally
      qryAtualizacoesPosteriores.Close;
   end
end;

procedure TfrmExecQuitacao.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   bIniciouTransacao := False;

   ParametrosSistema;
      // xavier
   uFuncoesEmptmo.buscaUsuarioMutuario(iIdbenef);

   if uFuncoesEmptmo.bBuscaMutuario then
      begin
      MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                        'O usuário é o próprio mutuário do '+
                        'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
      Abort;
      end;
   // xavier
   if not(VerificaPreenchimento) then
      Exit;

   // abre a query HistMov com os parâmetros passados
   with qryHistMov do
   begin
      // Procedure da unit UFuncoesEmptmo que fecha a query e limpa todos os parâmetros
      LimpaParametros(qryHistMov);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
          begin
          ParamByName('PINIBESUSP').AsInteger := 1;
         end;
      Open;
   end;

   HabilitaBotoes;

   ntbPrincipal.PageIndex  := 1;
   lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [Itens em Aberto]';
   Repaint;
end;

procedure TfrmExecQuitacao.btnContinuaEncerraClick(Sender: TObject);
var
   iTipoQuitacao : Integer;
begin
   inherited;

   //Renato Visoni SOL 100478 \ Kintana 445454
   if (trim(cboTipoRecurso.Text) = EmptyStr) and (rdgTipoQuitacao.ItemIndex = 0) then
       begin
       cboTipoRecurso.Text := 'PRÓPRIO';
   end;
   //Renato Visoni

   try
      DesabilitaBotoes;

      sMes := FormatDateTime('MM', edtDataVencto.Date);
      sAno := FormatDateTime('YYYY', edtDataVencto.Date);

      if rdgTipoQuitacao.ItemIndex = 0 then
      begin
         iTipoQuitacao := 3;  // quitação antecipada
      end
      else
      begin
         iTipoQuitacao := 8;  // quitação por morte
      end;

      // Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR
      AbreQueriesDebito;

      DBrdgDebito.ItemIndex := 0;
      DBcboFormaRecebimento.LookupValue := trim(dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString);

      // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox
      AtualizaConjunto(True, pnlCAR);

      with frmProgresso do
      begin
         BotaoVisivel    := True;
         BotaoHabilitado := False;
      end;

      // -------------------------------------------------------------------------------------------
      sArq := 'Quitacao' + IntToStr(iTipoQuitacao) + '-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '-' +
              'con' + FormatFloat('#0', rContrato.IDContratoEmptmo) + '.log';

      LogToFile('Antes PreencheDadosContrato', sArq, True, True, True);
      PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato,true);
      LogToFile('Após PreencheDadosContrato', sArq, True, True, True);

      // -------------------------------------------------------------------------------------------
      // André Pontes - 29/07/2005
      // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
      dtmEmptmo.Regra.IDCalculo  := 0;
      // FIM André Pontes - 29/07/2005

      LogToFile('IDCalculo = 0', sArq);
      // -------------------------------------------------------------------------------------------

      LogToFile(' ', sArq, True, False);
      LogBPL(sArq);
      LogToFile(' ', sArq, True, False);

      LogToFile('Logo antes de CalculaItensQuitacao', sArq, True, True, True);

      // -------------------------------------------------------------------------------------------

      if (rdgMetodo.ItemIndex = 0) then
          begin
         if not(CalcEmptmo.CalculaItensQuitacao(rContrato,
                                                iTipoQuitacao,             // Origem
                                                edtDataVencto.Date,
                                                edtDataFalecimento.Date,   // André Pontes - 14/06/2004 - pendência 16984
                                                0,
                                                vLista,
                                                True,
                                                True,
                                                False,
                                                sArq
                                               )) then
         begin
            // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            //  por Cancelamento do Usuário, logo o procedimento será abortado
            LogToFile('Erro CalculaItensQuitacao', sArq);
            Exit;
         end;
      end
      else
      begin
         if not(CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                                    iTipoQuitacao,             // Origem
                                                    edtDataVencto.Date,
                                                    edtDataFalecimento.Date,   // André Pontes - 14/06/2004 - pendência 16984
                                                    0,
                                                    vLista,
                                                    True,
                                                    True,
                                                    False,
                                                    sArq
                                                   )) then
         begin
            // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            //  por Cancelamento do Usuário, logo o procedimento será abortado
            LogToFile('Erro CalculaItensQuitacao', sArq);
            Exit;
         end;
      end;

      LogToFile('Após CalculaItensQuitacao', sArq, True, True, True);
      PreencheTabelaVirtual;
      LogToFile('Após PreencheTabelaVirtual', sArq, True, True, True);

      ntbPrincipal.PageIndex  := 2;
      lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [Valores Atualizados]';
      Repaint;

   finally
      HabilitaBotoes;
   end;
end;

procedure TfrmExecQuitacao.PreencheTabelaVirtual;
var
   i : Integer;
begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   for i := 0 to High(vLista) do
   begin
      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMes + '/' + sAno;
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
         0: qryHistMovVirtualEVENTO.AsString := 'Concessão';
         1: qryHistMovVirtualEVENTO.AsString := 'Parcela';
         2: qryHistMovVirtualEVENTO.AsString := 'Amortização';
         3: qryHistMovVirtualEVENTO.AsString := 'Quitação';
         4: qryHistMovVirtualEVENTO.AsString := 'Atualização Débito';
      end;

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELAALT.AsInteger     := vLista[i].ParcelaAlt;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

      qryHistMovVirtual.Post;

   end;// for
end;

procedure TfrmExecQuitacao.btnConfirmarClick(Sender: TObject);
var
   bErro             : Boolean;
   sMensErro         : String;
   sFormaEnvio       : String;
   iResult           : Integer;
   iPlanilhaResult   : Integer;
   sResult, sErro    : TStringList;
   iIdHistMovEmptmo  : Extended;
   i                 : Integer;
   iTipoQuitacao     : Integer;
   rLogTotalPrev     : TLogTotalPrev;

   //Pendência 20133 - 20/01/2007 - Alberto
   iIdCBancaria         : Integer;
begin
   inherited;

   if not(VerificaPreenchimento) then
      Exit;

   //Renato Visoni SOL 100478 \ Kintana 445454

   if (rdgTipoQuitacao.ItemIndex = 0) then
      begin
     if (Trim(cboTipoRecurso.Text) = EmptyStr) then
        begin
        sMensErro := 'O campo tipo de origem do recurso é de preenchimento obrigatório';
        MsgDlg(sMensErro, 'Empréstimo', mtWarning, [mbOk], 0);
        Repaint;
        Exit;
        end;

     if ((Trim(cboTipoRecurso.Text)='PRÓPRIO') and (trim(EdOrigemRecurso.Text) = EmptyStr)) then
         begin
        sMensErro := 'O campo origem do recurso é de preenchimento obrigatório';
        MsgDlg(sMensErro, 'Empréstimo', mtWarning, [mbOk], 0);
        Repaint;
        Exit;
     end;
   end;

   rContrato.TipoRecurso   := trim(cboTipoRecurso.LookupValue);
   rContrato.OrigemRecurso := trim(EdOrigemRecurso.Text);
   //Renato Visoni

   if (rdgTipoQuitacao.ItemIndex = 0) then
   begin
      iTipoQuitacao := 3; // quitação antecipada
   end
   else
   begin
      iTipoQuitacao := 8; // quitação por morte
   end;

   bErro       := False;
   sMensErro   := '';
   sResult     := TStringList.Create;
   sErro       := TStringList.Create;

   DesabilitaBotoes;

   // Inicia uma transação - só se não ouver transação iniciada
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      StartTransacao;
      bIniciouTransacao := True;

      LogToFile('Start Transaction', sArq);
   end
   else
   begin
      LogToFile('Transacao Anterior', sArq);
   end;
   try
      case DBrdgDebito.ItemIndex of
         0: sFormaEnvio := 'C';
         1: sFormaEnvio := 'F';
      end;

      if (rdgTipoQuitacao.ItemIndex = 1) then
      begin
         for i := 0 to High(vLista) do
         begin
            if ((vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1)) and(vLista[i].Valor = 0) then
            begin
               vLista[i].ValorEfetivo  := 0;
               vLista[i].DataEfetiva   := edtDataVencto.Date;
               vLista[i].FlgBaixado    := -1;
               vLista[i].FlgEnvio      := -1;
               vLista[i].FormaCobranca := '';
            end;
         end;
      end;

      // -------------------------------------------------------------------------------------------

      LogToFile('Antes GravaMovEmptmo', sArq, True, True, True);

      if (Sistema.TipoCliente = 19991) then
          rSaldosAntPos.dDataAtuPos := edtDataVencto.Date;

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
                                       3,                                              // Evento 3 - Quitação
                                       rSaldosAntPos.iParcelaPos,                      // Parcela
                                       qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger,   // Ano Competência - Ano do Item
                                       qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger,   // Mês Competência - Mês do Item
                                       StrToInt(sAno),                                 // Ano Cobrança - Ano da Data de Quitação
                                       StrToInt(sMes),                                 // Mês Cobranca - Mês da Data de Quitação
                                       0,                                              // Parcelas Remanescentes
                                       edtDataVencto.Date,                             // DataPrevista -> Data de Quitação
                                       rSaldosAntPos.dDataAtuPos,                      // dDataUltAtualiza -> Data de Quitação
                                       sFormaEnvio,
                                       '',
                                       True                                             // Mostra o Form de Progresso
                                       //Pendência 20133 - 20/01/2007 - Alberto
                                       ,iIdCBancaria                                   // Conta Bancaria
                                       //Fim Pendência 20133                                             // Mostra o Form de Progresso
                                      )) then
      begin
         // Gravação do Histórido com Erro
         bErro := True;
         sMensErro := '[ Gravação do Histórido dos Itens de Contrato ]';
         LogToFile('ERRO: GravaMovEmptmo', sArq);
         Exit;
      end; // if GravaMovEmptmo

      LogToFile('Após GravaMovEmptmo', sArq, True, True, True);

      //BRUNO AZEVEDO - 19/12/2013 - VOTO DE EMPRÉSTIMO - INÍCIO
      //if (iTipoQuitacao = 8) then // Alex --> Sol 213592
      //    UpateContato(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsString);  //Update na tabela contratoemptmo no campo FLGPERDAEFETIVA . Recebe o valor "1"
      //BRUNO AZEVEDO - 19/12/2013 - VOTO DE EMPRÉSTIMO - FIM

      // ----------------------------------------------------------------------------------------
      // Estorna os itens posteriores à data da quitação
      // ----------------------------------------------------------------------------------------
      if (dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1) then
      begin
         LogToFile('Antes estorno posterior à quitação', sArq);

         with dtmEmptmo.qryUpdateFlgEstorno do
         begin
            LimpaParametros(dtmEmptmo.qryUpdateFlgEstorno);

            ParamByName('PHMEDATAESTORNO').AsDateTime       := edtDataVencto.Date;

            ParamByName('PIDUSUARIOESTORNO').AsInteger      := Sistema.IDUsuario;
            ParamByName('PHMEOBSERVACAO').AsString          := 'Estorno de item posterior a quitacao';
            ParamByName('PIDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            // Pendência 22718 - 13/06/2007 - Alberto
            ParamByName('PFLGESTORNOPOSQUIT').AsInteger     := 1;

            if (iTipoQuitacao <> 8) then // André Pontes - 18/05/2005 - pendência 19236
               begin
               ParamByName('PNAOENVIADO').AsInteger         := 1;
               end;

            ParamByName('PFILTROPORDATAPREVISTA').AsInteger := 1;
            ParamByName('PHMEDATAPREVISTAINI').AsDateTime   := (edtDataVencto.Date + 1);
            ParamByName('PHMEDATAPREVISTAFIM').AsDateTime   := DiasUteis.SomaAnos(edtDataVencto.Date, 10);

            ExecSQL;
         end;  // with dtmEmptmo.qryUpdateFlgEstorno
         LogToFile('Após estorno posterior à quitação', sArq);
      end;  // if dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1
      // ----------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
      begin
         LogToFile('Antes Atualização Diária', sArq);

         if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
         begin
            with dtmAtualizacaoDiaria.spUpdateEstornado do
            begin
               ParamByName('IIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
               ParamByName('DDATAINI').AsDateTime        := (edtDataVencto.Date + 1);
               ParamByName('DDATAFIM').AsDateTime        := (edtDataVencto.Date + 180);
               ParamByName('IHMETIPOMOV').AsFloat        := 5;
               if not(Prepared) then Prepare;
               ExecProc;
            end;
         end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

         LogToFile('Após Atualização Diária', sArq);

         dtmAtualizacaoDiaria.ExecutaAjusteSaldo(rContrato.IDContratoEmptmo,
                                                 edtDataVencto.Date - 1,
                                                 -1 // O saldo deve ser buscado
                                                );

         LogToFile('Após Ajuste de Saldo', sArq);
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      //    Contabilização
      // -------------------------------------------------------------------------------------------
      if (dtmemptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1)  and
         (dtmEmptmo.qryParamEmptmoFLGINTEGRAQUITA.AsInteger  = 0)  then
      begin
         LogToFile('Antes contabilização', sArq);

         iResult := ContabilizaQuitacao(rContrato.IDContratoEmptmo, 3, iPlanilhaResult, sResult, sErro);

         if (iResult <> 0) then
         begin
            // Contabilização com Erro
            bErro := True;

            LogToFile('ERRO contabilização', sArq);

            case iResult of
               -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a contabilizar ]';
               -2 : sMensErro := '[ Query não retornou itens a contabilizar ]';
               -3 : sMensErro := '[ ERRO ao tentar criar tabela para agrupamento ]';
               -4 : sMensErro := '[ ERRO ao buscar Parâmetros de Integração ]';
               -5 : sMensErro := '[ ERRO ao fazer o Lançamento Contábil ]';
               -6 : sMensErro := '[ ERRO no Período Contábil ]';
               -7 : sMensErro := '[ Processo interrompido pelo usuário sem contabilização ]';
            end;// case

            sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count -1];

            Exit;
         end; // if iResult <> 0
         LogToFile('Após contabilização', sArq);
      end; // if dtmEmptmo.qryParamEmptmoFLGINTEGRAQUITA.AsInteger = 1
      // -------------------------------------------------------------------------------------------
      //    FIM Contabilização
      // -------------------------------------------------------------------------------------------
      if (DBrdgDebito.ItemIndex = 0) and (rdgTipoQuitacao.ItemIndex = 0) then
      begin
         // Contas a Receber
         iPlanilhaResult := 0;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 11/08/2004
         if (dtmEmptmo.qryParamEmptmoFLGENVIAQUITA.AsInteger = 1) then
         begin
            iResult := 0;
         end
         else
         begin
            LogToFile('Antes Envio', sArq);
            iResult := EnviaQuitacaoCAPCAR(iPlanilhaResult,   // 0
                                           sResult,
                                           sErro
                                          );
         end;
         // FIM André Pontes - 11/08/2004
         // ----------------------------------------------------------------------------------------

         if (iResult <> 0) then
         begin
            LogToFile('ERRO Envio', sArq);

            // Envio CAP com Erro
            bErro := True;

            case iResult of
            // Códigos de retorno (controle de erro):
            //  0 : Envio(s) realizados com sucesso
               -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a enviar ao CAP/CAR ]';
               -2 : sMensErro := '[ Query não retornou itens a Enviar ao CAP/CAR ]';
               -3 : sMensErro := '[ ERRO ao inserir Documento no CAP/CAR ]';
               -4 : sMensErro := '[ ERRO no Rateio do Documento no CAP/CAR ]';
               -5 : sMensErro := '[ ERRO ao Lançar Documento no CAP/CAR ]';
               -6 : sMensErro := '[ ERRO ao inserir Mensagens no Documento ]';
               -7 : sMensErro := '[ ERRO ao Atualizar Histórico com o Documento no CAP/CAR ]';
               -8 : sMensErro := '[ Processo interrompido pelo usuário sem envio ao CAP/CAR ]';
            end;// case

            if (sErro.Count > 0) then
            begin
               sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count - 1];
            end;

            Exit;
         end;// if Result CAP

         LogToFile('Após Envio', sArq);
      end
      else
      begin
         // quando o envio é para a Folha, NADA é feito na Quitação:
         // a Quitação será enviado para TMPDESC pela rotina do ENVIO
      end; // if FlgFormaPag
      // -------------------------------------------------------------------------------------------
      //    FIM Envio
      // -------------------------------------------------------------------------------------------

      LogToFile('Antes MarcaItensQuitados', sArq);
      // -------------------------------------------------------------------------------------------
      //    Marcação dos Itens "quitados"
      // -------------------------------------------------------------------------------------------
      // marca parcelas em aberto anteriores à quitação com o flgQuitado = 1
      if CalcEmptmo.MarcaItensQuitados(rContrato.IDContratoEmptmo,
                                       edtDataVencto.Date,
                                       iTipoQuitacao
                                      ) = -2 then
      begin
         LogToFile('ERRO MarcaItensQuitados', sArq);
         // Atualização da Situação do Contrato com Erro
         bErro := True;
         sMensErro := '[ Atualização dos itens quitados ]' + #13 + sMensErro;
         Exit;
      end;
      // -------------------------------------------------------------------------------------------
      //    FIM Marcação dos Itens "quitados"
      // -------------------------------------------------------------------------------------------
      LogToFile('Após MarcaItensQuitados', sArq);

      // -------------------------------------------------------------------------------------------
      //    Acerto da situação do Contrato
      // -------------------------------------------------------------------------------------------
      LogToFile('Antes AcertaSituacaoContratual', sArq);
      CalcEmptmo.AcertaSituacaoContratual(rContrato.IDContratoEmptmo);
      LogToFile('Após AcertaSituacaoContratual', sArq);


      // -------------------------------------------------------------------------------------
      //    Log de operações
      // -------------------------------------------------------------------------------------
      LogToFile('Antes GravaLogOperacoes', sArq);

      if not(Sistema.GravaLogOperacoes('Quitação do Contrato ' +
                                       FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ref: ' +
                                       FormatDateTime('dd/mm/yyyy', edtDataVencto.Date))
                                      ) then
      begin
         LogToFile('ERRO GravaLogOperacoes', sArq);
         bErro := True;
         sMensErro := '[ Falha na gravação do Log da operação ]' + #13 + sMensErro;
      end;
      LogToFile('Após GravaLogOperacoes', sArq);

      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := rContrato.IDContratoEmptmo;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := iTipoQuitacao;

      rLogTotalPrev.Operacao   := 'Quitação antecipada: ' + FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);

      // André Pontes - 20/12/2005
      if chkExcepcional.Checked then
         rLogTotalPrev.Operacao := rLogTotalPrev.Operacao + 'EXCEPCIONAL';

      rLogTotalPrev.Data        := SysDate;
      rLogTotalPrev.IDUsuario   := Sistema.IdUsuario;
      rLogTotalPrev.Versao      := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      LogToFile('Após GravaLogTotalPrev', sArq);

      //Darivaldo SOL 224034/17909 PPM.1165556 - inicio
      qryBloq.close;
      qryBloq.ParamByName('idpessoa').AsString:= (dtmEmptmo.qryDadosContratoIDPESSOA.AsString);
      qryBloq.ParamByName('SUCDATAFINAL').AsString:= FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);
      qryBloq.ExecSQL;
      //Darivaldo SOL 224034/17909 PPM.1165556 - fim

      // -------------------------------------------------------------------------------------------
   finally

      if bErro then
      begin
         // Houve erro
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            RollbackTransacao;
            LogToFile('Rollback Transaction', sArq);
         end
         else
         begin
            LogToFile('Não Rollback - Transação antrior', sArq);
         end;

         ntbPrincipal.PageIndex  := 0;
         lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [seleção]';
         Repaint;

         vLista                  := nil;

         MsgDlg('Erro na Quitação do Contrato.' + #13 + sMensErro, 'Empréstimo', mtError, [mbOk], 0);
         Repaint;

         LogToFile('Após Erro na Quitação do Contrato', sArq);
      end
      else  // if bErro
      begin
         // Não houve erro
         // Só "commita" se não houver transacao anterior

         if ((dtmBaseDados.dbBaseDados.InTransaction) and (bIniciouTransacao)) then
         begin
            CommitTransacao;
            LogToFile('Commit Transaction', sArq);
         end
         else
         begin
            LogToFile('NAO Commit - Transação anterior', sArq);
         end;

         // Marchetti - Pendencia 22042
         IntegraModulo.iEvento         := 2;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         // Fim Marchetti - Pendencia 22042

         dtmEmptmo.qryDadosContrato.Close;

         LogToFile('Após qryDadosContrato.Close', sArq);

         vLista := nil;

         MsgDlg('Quitação realizada com Sucesso.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

         LogToFile('Após Quitação realizada com Sucesso', sArq);

         // Marchetti - Pendencia 22042
         if (Sistema.IdModulo = 19) then
            bbtnSairClick(Self);
         // Fim Marchetti - Pendencia 22042

      end; // if bErro

      Sel(-1);

      // volta para primeira página
      ntbPrincipal.PageIndex  := 0;
      lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [seleção]';
      Repaint;

      HabilitaBotoes;

      bIniciouTransacao       := False;

      sResult.Free;
      sErro.Free;
   end;  // try..finally
end;

function TfrmExecQuitacao.ContabilizaQuitacao(const iContrato         : Extended;
                                              const iTipoMov          : Integer;
                                              var   iPlanilhaResult   : Integer;
                                              var   sResult           : TStringList;
                                              var   sErro             : TStringList
                                              ): Integer;
var
   sSQL, sMensagem: String;
begin
   Result := 0;

   // Pendência 23254 - 01/02/2006 - Alberto
   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, '     + #13 +
   '  HME.HMEFORMACOBRANCA , HME.HMEVLRPREVISTO  , '                                         + #13 +
   '  CON.IDTIPOCONTREMPTMO, HME.IDPATROANT AS IDPATRO, '                                    + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOORIGEM, '                                                 + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOPREV, '                                                   + #13 +
   '  ITC.TIPCODIGO '                                                                        + #13 +
   'FROM '                                                                                   + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '      AND    H.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', iContrato) + ' '                + #13 +
   '      AND    H.HMEDATAPREVISTA   = TO_DATE(' + QuotedStr(trim(edtDataVencto.Text)) + ',''DD/MM/YYYY'') '+ #13 +
   '      AND    H.HMETIPOMOV        = ' + IntToStr(iTipoMov) + ' '                          + #13 +
   '      AND    NVL(H.FLGESTORNADO, 0)  = 0 '                                               + #13 +
   '      AND    H.HMESEQCOBRANCA    = 1 '                                                   + #13 +
   '      AND    H.HMEVLRPREVISTO    <> 0 '                                                  + #13 +
   '      AND    H.FLGQUITADO        IS NULL '                                               + #13 +
   '      AND    H.FLGABONADO        IS NULL '                                               + #13 +
   '      AND    (H.HMECENTRALIZA    = 0 OR H.HMECENTRALIZA IS NULL) '                       + #13 +
   '      UNION   ALL '                                                                      + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13 +
   '      AND    H.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', iContrato) + ' '                + #13 +
   '      AND    H.HMEDATAPREVISTA   = TO_DATE(' + QuotedStr(edtDataVencto.Text) + ',''DD/MM/YYYY'') '+ #13 +
   '      AND    H.HMETIPOMOV        = ' + IntToStr(iTipoMov) + ' '                          + #13 +
   '      AND    NVL(H.FLGESTORNADO, 0)  = 0 '                                               + #13 +
   '      AND    H.HMESEQCOBRANCA    = 1 '                                                   + #13 +
   '      AND    H.HMEVLRPREVISTO    <> 0 '                                                  + #13 +
   '      AND    H.FLGQUITADO        IS NULL '                                               + #13 +
   '      AND    H.FLGABONADO        IS NULL '                                               + #13 +
   '      AND    (H.HMECENTRALIZA    = 0 OR H.HMECENTRALIZA IS NULL) '                       + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '      ( TEM.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                 + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                               + #13 +
   '  AND ( CON.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                               + #13 +
   '  AND ( TIP.IDTIPOEMPTMO       = TEM.IDTIPOEMPTMO ) '                                    + #13 +
   '  AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '  AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                    + #13 +
   '  AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                    + #13 +
   '  AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                    + #13 +
   '  AND ( NVL(ITC.FLGNAOCONTAB,0)= 0 )'                                                    + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO )';
   //Fim Pendência 23254

   if (rdgTipoQuitacao.ItemIndex = 0) then
   begin
      sMensagem := 'EMPRÉSTIMOS DE PARTICIPANTES - Quitação - Contrato nº ' + FormatFloat('#0', iContrato);
   end
   else
   begin
      sMensagem := 'EMPRÉSTIMOS DE PARTICIPANTES - Quitação por Falecimento - Contrato nº ' + FormatFloat('#0', iContrato);
   end;

   if (dtmemptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1)  and
      (dtmEmptmo.qryParamEmptmoFLGINTEGRAQUITA.AsInteger  = 0)  then
   begin
      Result := IntegraEmptmo.ContabilizaItens('C',
                                               'N',
                                               sSQL,
                                               sMensagem,	         // Histórico
                                               edtDataVencto.Date,   // Data do Lançamento
                                               sResult,              // Acertos
                                               sErro,                // Erros
                                               iPlanilhaResult       // Planilha
                                              );
   end;
end;

function TfrmExecQuitacao.EnviaQuitacaoCAPCAR(var iPlanilha : Integer;
                                              var sResult   : TStringList;
                                              var sErro     : TStringList
                                             ): Integer;
var
   sSQL        : String;
   sSeguradora : String;
begin
   sSeguradora := FormatFloat('#0', dtmEmptmo.qryParamEmptmoIDSEGURADORA.AsFloat);

   // Pendência 23254 - 01/02/2006 - Alberto
   // Ajustes na query pois o Oracle 9.0.2.4 ou superior não aceita subquery em outer join

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO     , '                  + #13 +
   '  HME.HMEFORMACOBRANCA , HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO   , '                  + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMESALDODEV, '              + #13 +
   '  HME.HMETIPOMOV, HME.HMEPARCELA, '                                                      + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || ' +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +
   '  ITC.CONTABAIXA      , ITC.TIPCODIGO        , '                                         + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOPREV, '                                                   + #13 +
   '  HME.IDPLANOCONTANT AS IDPLANOORIGEM, '                                                 + #13 +
   '  HME.IDPATROANT AS IDPATRO, '                                                           + #13 +
   '  ''               '' AS MATRICULA,  '                                                   + #13 +
   '  CON.IDTIPOSUSPEMPTMO , ITC.ITCTRATASALDODEV, '                                         + #13 +
   '  CON.CODFORMAPAG      , CON.PORTFORMAPAG    , TIP.IDTIPOCONTREMPTMO, '                  + #13 +
   '  IRC.ITEDESCRICAO, '                                                                    + #13;

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and not(dtmEmptmo.qryParamEmptmoIDSEGURADORA.isNULL) then
   begin
      sSQL := sSQL +
   '  DECODE(HME.HMEORIGEM, 8, ' + sSeguradora + ', CON.IDBENEF) AS IDBENEF, '               + #13 +
   '  DECODE(HME.HMEORIGEM, 8, ' + sSeguradora + ', CON.IDPESSOA) AS IDPESSOA, '             + #13 +
   '  DECODE(HME.HMEORIGEM, 8, NULL, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIADEB,HME.IDCBANCARIA)) AS IDCBANCARIADEB, ' + #13 +
   '  DECODE(HME.HMEORIGEM, 8, NULL, CON.IDCBANCARIA) AS IDCBANCARIA, '                      + #13;
   end
   else
   begin
      sSQL := sSQL +
   '  CON.IDBENEF, CON.IDPESSOA, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIADEB,HME.IDCBANCARIA) AS IDCBANCARIADEB, CON.IDCBANCARIA, ' + #13;
   end;

   sSQL := sSQL + trim(DBcboFormaRecebimento.LookupValue) + ' AS PORTFORMAREC '              + #13;

   sSQL := sSQL                                                                              + #13 +
   'FROM '                                                                                   + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ( '                                                                                    + #13 +
   '      SELECT M.IDPATROANT, M.IDPLANOCONTANT, H.* '                                       + #13 +
   '      FROM   HISTMOVEMPTMO H, MIGRACONTRATOEP M '                                        + #13 +
   '      WHERE  M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    M.DATAMIGRA        = (SELECT MIN(DATAMIGRA) '                               + #13 +
   '                                   FROM   MIGRACONTRATOEP '                              + #13 +
   '                                   WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '        + #13 +
   '                                   AND    DATAMIGRA > H.HMEDATAPREVISTA) '               + #13 +
   '      AND    H.IDCONTRATOEMPTMO = ' + FormatFloat('#0',rContrato.IDContratoEmptmo) + ' ' + #13 +
   '      AND    H.HMEORIGEM        = 3 '                                                    + #13 +
   '      AND    H.HMETIPOMOV       = 3 '                                                    + #13 +
   '      AND    (H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1) '                             + #13 +
   '      AND    (H.FLGESTORNADO    = 0 OR H.FLGESTORNADO IS NULL) '                         + #13 +
   '      AND    (H.FLGABONADO      = 0 OR H.FLGABONADO   IS NULL) '                         + #13 +
   '      AND    (H.FLGQUITADO      = 0 OR H.FLGQUITADO   IS NULL) '                         + #13 +
   '      UNION   ALL '                                                                      + #13 +
   '      SELECT C.IDPATRO as IDPATROANT, '                                                  + #13 +
   '             NVL(C.IDPLANOORIGEM, C.IDPLANOPREV) as IDPLANOCONTANT, H.* '                + #13 +
   '      FROM   CONTRATOEMPTMO C, HISTMOVEMPTMO H '                                         + #13 +
   '      WHERE  C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                   + #13 +
   '      AND    NOT EXISTS( SELECT * '                                                      + #13 +
   '                         FROM   MIGRACONTRATOEP '                                        + #13 +
   '                         WHERE  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                  + #13 +
   '                         AND    DATAMIGRA > H.HMEDATAPREVISTA) '                         + #13 +
   '      AND    H.IDCONTRATOEMPTMO = ' + FormatFloat('#0',rContrato.IDContratoEmptmo) + ' ' + #13 +
   '      AND    H.HMEORIGEM        = 3 '                                                    + #13 +
   '      AND    H.HMETIPOMOV       = 3 '                                                    + #13 +
   '      AND    (H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1) '                             + #13 +
   '      AND    (H.FLGESTORNADO    = 0 OR H.FLGESTORNADO IS NULL) '                         + #13 +
   '      AND    (H.FLGABONADO      = 0 OR H.FLGABONADO   IS NULL) '                         + #13 +
   '      AND    (H.FLGQUITADO      = 0 OR H.FLGQUITADO   IS NULL) '                         + #13 +
   '  ) HME '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '      ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                  + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( CON.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                     + #13;
   //Fim Pendência 23254

   // ----------------------------------------------------------------------------------------------
   Result := IntegraEmptmo.EnviaCAPCAR(sSQL,
                                       'Quitacao de EP - ',
                                       Sysdate,
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


procedure TfrmExecQuitacao.btnCancelaEncerraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex  := 0;
   lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [seleção]';
   Repaint;
end;

procedure TfrmExecQuitacao.btnCancelaAlteraClick(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 1;
   lblTitulo.Caption       := 'Quitação Antecipada / por Falecimento [Itens em Aberto]';
   Repaint;
end;

procedure TfrmExecQuitacao.DBrdgDebitoClick(Sender: TObject);
begin
   inherited;

   if (DBrdgDebito.ItemIndex = 0) then
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

procedure TfrmExecQuitacao.DBgrdVlrAtualizadosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas 
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco 
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê 
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

procedure TfrmExecQuitacao.DBgrdVlrAtualizadosTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecQuitacao.FormShow(Sender: TObject);
var
   iDias : Integer;
   dDataMorte  : TDateTime;
   dAux : TDateTime;//William Moreira da Silva SOL 197911 Kintana 1896919
begin
   inherited;

   ParametrosSistema;

   qryTipoRecurso.Close; //Renato Visoni SOL 100478 \ Kintana 445454
   qryTipoRecurso.Open;  //Renato Visoni SOL 100478 \ Kintana 445454

   chkExcepcional.Visible := False;
   if ((Sistema.TipoCliente = 19981) or (Sistema.TipoCliente = 19991)) then
        chkExcepcional.Visible := True;

   bIniciouTransacao := False;

   dDataLimite := Sysdate;

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      iDias := 3;
      if (Time > StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString)) then
          inc(iDias);

      //William Moreira da Silva SOL 197911 Kintana 1896919 - Begin
      dAux := Sysdate;
      if not DiasUteis.DiaUtil (Sistema.IdEmpresa,
                              dAux,
                              true,
                              true,
                              false) then
      begin
         dAux := DiasUteis.PrimeiroDiaUtilPosterior (Sistema.IDEmpresa, dAux, true, true, false);
      end;
      //William Moreira da Silva SOL 197911 Kintana 1896919 - End

      dDataLimite := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                             dAux,
                                             iDias,
                                             True,
                                             True,
                                             False
                                            );
                                            
      //William Moreira da Silva SOL 197911 Kintana 1896919
      {dDataLimite := DiasUteis.SomaDiasUteis(Sistema.IDEmpresa,
                                             Sysdate,
                                             iDias,
                                             True,
                                             True,
                                             False
                                            );}

   end;

   edtDataVencto.Date   := dDataLimite;

   grpTitular.Visible   := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      rdgTipoQuitacao.Enabled  := Sistema.IDModulo = 15;
      rdgTipoQuitacao.Items[1] := 'Quitação por Falecimento';
   end;

   iPrograma    := dtmEmptmo.qryParamEmptmoIDPROGRAMA.AsInteger;
   sCentroCusto := trim(dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString);

   with dtmEmptmo.qryParamGlobal do
   begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then
         iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
   end;

   Autorizacao.AutorizarForm(self, afNormal);

   bHabilitado                := btnContinuaSelecao.Enabled;
   bHabilitaConfirma          := btnConfirmar.Enabled;
   btnContinuaSelecao.Enabled := False;


   // Marchetti - Pendencia 22042
   if (Sistema.IdModulo = 19) then
   begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));
         DBEdit1.Text  := frmExecSelecionaContrato.ValoresChave[0];

         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato,true);

         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                       edtDataVencto.Date
                                                      );

         // Verifica se o Participante já recebeu o Crédito do Empréstimo
         if VerificaBaixa then
         begin
            btnContinuaSelecao.Enabled := bHabilitado;

            dDataMorte := CalcEmptmo.BuscaDataMorte(rContrato.IDBenef);

            if (dDataMorte > 0) then
            begin
               edtDataFalecimento.Date    := dDataMorte;
               rdgTipoQuitacao.ItemIndex  := 1;
               edtDataVencto.Date         := Sysdate;

               MsgDlg('Mutuário Falecido. ' + #13 + #13 + 'Quitação deve ser por Falecimento!', 'Empréstimo',
                      mtInformation, [mbOk], 0);
               Repaint;
            end;
         end
         else
         begin
            btnContinuaSelecao.Enabled := False;

            MsgDlg('Crédito do Empréstimo NÃO efetivado.' + #13 +
                   'Utilize o Cancelamento de Concessão', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
         end; // if

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
      end;
      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;

procedure TfrmExecQuitacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmEmptmo.qryDadosContrato.Close;
   UFuncoesEmptmo.bBuscaMutuario := false;
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404

   inherited;
end;

procedure TfrmExecQuitacao.bbtnSairClick(Sender: TObject);
begin
   // Desfaz a transação
   if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bIniciouTransacao) ) then
       RollBackTransacao;

   inherited;
end;

procedure TfrmExecQuitacao.rdgTipoQuitacaoClick(Sender: TObject);
begin
   inherited;
   // Marchetti - Pendencia 22752
   //Higor Nayde Ferreira  SOL - 199273 KTN - 1919001 INICIO
   if ((rdgTipoQuitacao.ItemIndex = 0)) then
       edtDataFalecimento.Clear;

   edtDataFalecimento.Enabled := (rdgTipoQuitacao.ItemIndex > 1);
   // Fim Marchetti - Pendencia 22752
end;

procedure TfrmExecQuitacao.cboTipoRecursoChange(Sender: TObject);
begin
  inherited;
  cboTipoRecurso.Text := trim(QryTipoRecurso.FieldByname('Nome').asstring); //Renato Visoni SOL 100478 \ Kintana 445454
                                              
end;

procedure TfrmExecQuitacao.UpateContato(sCONTRATO: String);
begin
QryUptdateContrato.close;
QryUptdateContrato.SQL.Clear;
QryUptdateContrato.SQL.Add(' update contratoemptmo set FLGPERDAEFETIVA = 1');
QryUptdateContrato.SQL.Add(' where idcontratoemptmo = '+trim(sCONTRATO)+ '');
QryUptdateContrato.ExecSQL;
end;
end.
