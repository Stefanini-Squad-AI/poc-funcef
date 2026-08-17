//******************************************************************************
// Data     : 03/04/2007
// Código   : AL_28
// Pendencia: 24774
// SOL      : 55877
// Desc     : Acerto na passagem do IdOperacaoInvest na Lancaoperrfrv
//******************************************************************************
// Data     : 29/03/2007
// Código   : AL_27
// Desc     : Acerto na montagem das variaveis de custo e variacao
//******************************************************************************
// Data     : 28/10/2006
// Código   : AL_26
// Pendencia: 23872
// Desc     : Ajuste na gravação de Tipo de operação na OperCustodia
//******************************************************************************
// Data     : 27/10/2006
// Código   : AL_25
// Pendencia: 22987
// Desc     : Segregação de Planos
//******************************************************************************
// Data      : 16/10/2006
// Código    : AL_24
// Desc      : Acerto para ajuste somente na carteira
//******************************************************************************
// Data      : 07/07/2006
// Código    : AL_23
// Desc      : Ajuste no Lote da BuscaSaldos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_22
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_21
// Desc     : Retirada da transferência CC -> CCI, mantendo as melhorias da tela
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_20
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_19
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 26/04/2006
// Código   : AL_18
// Desc     : Implementação de Saldo CC/CCI na Histcustodia (de verdade)
//            Alteração do layout da tela (DFM)
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_17
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	    : 29/05/2006
//Código    : Al_16
//Pendencia : 20979
//SOL       : 33215
//Motivo(S) : Melhoria nas críticas de preenchimento das informações da tela
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_15
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//********************************************************************************************************
//Data	    :  05/01/2006
//          :  AL_14
//Função    :  Acerton para trocar o TipoOperacao -124 e -125 para Ajuste de Aumento e Baixa de Quantidade sem
//             ajuste dos Saldos somente se Aumentar ou Diminuir na Carteir
//********************************************************************************************************
//Data	    :  05/10/2005
//          :  AL_13
//Função    :  Implementação do TipoOperacao -124 e -125 para Ajuste de Aumento e Baixa de Quantidade sem
//             ajuste dos Saldos
//********************************************************************************************************
//Data	    :  03/10/2005
//          :  AL_12
//Função    :  Implementação do campo de observação
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_11
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 24/03/2005
// Código   : AL_10
// Motivo   : Alterado para poder zerar as quantidades de custódia.
//******************************************************************************
// Data     : 16/12/2004
// Código   : AL_9
// Motivo   : Criados mais dois tipos de operação para não afetar a carteira
//            Ajustes gerais
//******************************************************************************
// Data     : 17/11/2004
// Código   : AL_8
// Motivo   : Ajuste no motivo de bloqueio, onde esse so será identificado qdo
//            escolhido na combo.
//******************************************************************************
// Código   : AL_7
// Motivo   : Implementação para não deixar o saldo liberado negativo qdo for para
//            atualizar na carteira
//******************************************************************************
// Data     : 21/10/2004
// Código   : AL_6
// Motivo   : Ajuste para testa apenas se o saldo é suficiente qdo for diminuição
//******************************************************************************
// Data     : 05/10/2004
// Código   : AL_5
// Motivo   : Acerto na qryInvestimento para trazer somente IdTipoInvest=2
//******************************************************************************
// Data     : 05/10/2004
// Código   : AL_4
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 20/07/2004
// Código   : AL_3
// Motivo   : Incluida a Opção de não alterar a custódia
//******************************************************************************
// Data	    : 28/06/2004
// Origem   : FUNCEF
// Função   : bbtnConfirmarClick
// LINHA(S) : AL_2
// Motivo(S): TRATAMENTO PARA AS CARTEIRAS GERENCIAIS
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
//Data	         :29/04/2004
//Origem	 :FUNCEF
//Função	 :bbtnConfirmar
//LINHA(S)       :556
//Motivo(S)      :Implementada a rotina que trata o reprocessamento do
//                investimento de RendaVariavel.MarcarFlagReproc
//******************************************************************************
// Data	    :15/04/2004
// Origem   :FUNCEF
// Função   : bbtnConfirmarClick e LkcCarteiraChange
// LINHA(S) :
// Motivo(S):Implementação da Carteira Gerencial.
//******************************************************************************

unit FAcertaCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, TREdit, Db, Wwdatsrc,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  FOkCancelarInv, fcLabel, uCtrlInvContab, URendaVariavel,
  //AL_25
  uCtrlRendaVariavel, uCtrlPadroes, Provider, DBClient, uCMClientDataSet;

type
  //AL_9
  TfrmAcertaCustodia = class(TfrmOkCancelarInv)
    Label2: TLabel;
    LkcCarteira: TwwDBLookupCombo;
    QryCarteira: TwwQuery;
    Label1: TLabel;
    LkcInvestimento: TwwDBLookupCombo;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    Label3: TLabel;
    DbLkcLote: TwwDBLookupCombo;
    DsInvestimento: TwwDataSource;
    QryLote: TwwQuery;
    QryLoteIDLOTE: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    qryCustodiante: TwwQuery;
    Label6: TLabel;
    edData: TCMDateTimePicker;
    Label7: TLabel;
    EdQuantidade: TRealEdit;
    Label8: TLabel;
    qryCustodia: TwwQuery;
    qryCustodiaSALDOBLOQUEADO: TFloatField;
    qryCustodiaSALDOLIBERADO: TFloatField;
    qryCustodiaIDCUSTODIA: TFloatField;
    rdgCustodia: TRadioGroup;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    LkcCustodiante: TwwDBLookupCombo;
    Label11: TLabel;
    Label12: TLabel;
    DbLkcMotBlq: TwwDBLookupCombo;
    qryMotBlq: TwwQuery;
    qryMotBlqSIGLAMOTBLOQ: TStringField;
    qryMotBlqDESCMOTBLOQ: TStringField;
    qryMotBlqIDMOTIVOBLOQUEIO: TFloatField;
    rdgCarteira: TRadioGroup;
    QryInvestimentoSIGLAEMISSOR: TStringField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryInsOperacaoInvest: TwwQuery;
    QryCarteiraID: TFloatField;
    QryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryAuxiliar: TwwQuery;
    Label9: TLabel;
    mObservacao: TMemo;
    rdgSaldosCarteira: TRadioGroup;
    grpSaldos: TGroupBox;
    Label22: TLabel;
    PnlSldLibCusCC: TPanel;
    Label10: TLabel;
    PnlSldBloCusCC: TPanel;
    pnlSaldosCustodia: TPanel;
    pnlSaldosCarteira: TPanel;
    Label17: TLabel;
    PnlSldLibCarCC: TPanel;
    qryCustodiaSALDOQTDECPMF: TFloatField;
    //AL_25
    QryPlanoPatro: TwwQuery;
    QryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    QryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    QryPlanoPatroIDPLANOPREV: TFloatField;
    QryPlanoPatroIDPATRO: TFloatField;
    LkcPlanPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    qryCustodiaIDPLANPREVCTBPATR: TFloatField;
    procedure LkcCarteiraEnter(Sender: TObject);
    procedure LkcInvestimentoEnter(Sender: TObject);
    procedure LkcCustodianteEnter(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryLoteAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure rdgCustodiaClick(Sender: TObject);
    procedure rdgCarteiraClick(Sender: TObject);
    procedure rdgCarteiraExit(Sender: TObject);
    procedure LkcCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure LkcInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure LkcCustodianteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcLoteEnter(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure edDataCloseUp(Sender: TObject);
    procedure LkcCarteiraExit(Sender: TObject);
    procedure LkcInvestimentoExit(Sender: TObject);
    procedure DbLkcLoteExit(Sender: TObject);
    procedure LkcCustodianteExit(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    //AL_25
    procedure LkcPlanPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure LkcPlanPatroEnter(Sender: TObject);
    procedure LkcPlanPatroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    //AL_25
    CtrlRV: TCtrlRendaVariavel;
    Rv : TCustodia; //URendaVariavel

    procedure MostraSaldos;

    function MostraSaldosXX(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                          iInvestimento, iCustodiante: Integer;
                                          sLote, sData: String) : boolean;
    //AL_25
    function AjustaCarteira(iCarteira, iInvestimento, iForCli, iCustodiante, iAcao, iPlanoPatro: Integer;
                            sLote, sBoleta: String;
                            fQuantidade: Double;
                            dDataRef: TDateTime): boolean;
  public
    { Public declarations }
    procedure MontaQrySaldoCustodia;
  end;

const
  clCereja = $007373F9;  // Cereja claro

var
  frmAcertaCustodia: TfrmAcertaCustodia;
  SLiberado, SBloqueado: Double;
  SLiberadoCC, SBloqueadoCC, SLiberadoCCI, SBloqueadoCCI : Double;
  iIdHistCustodiaOrig, iIdHistCustodiaDest : Integer;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DBaseDados, uDataBase, UBibliotecaInvest, UOperacaoInvest,
     UOperComum, dOperComum, dRendaVariavel, UDiasUteisInv;

procedure TfrmAcertaCustodia.LkcCarteiraEnter(Sender: TObject);
begin
  inherited;
  LkcCarteira.Tag := 0;
end;

procedure TfrmAcertaCustodia.LkcInvestimentoEnter(Sender: TObject);
begin
  inherited;
  LkcInvestimento.Tag := 0;
end;

procedure TfrmAcertaCustodia.LkcCustodianteEnter(Sender: TObject);
begin
  inherited;
  LkcCustodiante.Tag := 0;
end;

procedure TfrmAcertaCustodia.DbLkcLoteEnter(Sender: TObject);
begin
  inherited;
  DbLkcLote.Tag := 0;
end;

procedure TfrmAcertaCustodia.edDataEnter(Sender: TObject);
begin
  inherited;
  edData.Tag := 0;
end;

procedure TfrmAcertaCustodia.bbtnConfirmarClick(Sender: TObject);
var
   Tipo, TipoBD, sNatureza, sBoleta, sTipoOperacao, sInvestimento,
   wMensErro, wTipoRecDesBol     : String;

   TipoBloqueio, TipoBloqueioBD, idOperCustodia, iTipoOperacao, idOperacaoInvest,
   iIdHistCartInv                : Integer;

   iPlano, iPlanilha, iDocumento : Integer;

   wPlanilha, wDocumento, wPlano :Integer;

   fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fSaldoQtd, fSaldoVlr,
   fSaldoInutil, fSaldoAqui, fSaldoRend, fSaldoVariacao, fSaldoIrApu,fValorOper : Double;

   bCriaLancto                   : Boolean;

   wDtMov                        : TDateTime;
   //AL_17
   iTipoConta : integer;
begin

   // AL_15
   if RendaVariavel.VerEmAbertura then
      Exit;

   inherited;

   // Confirma Campos
   // AL_16 - Ini
   if (EdData.Text = '') then
   begin
     MsgDlg('Seleciona uma Data.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if edData.CanFocus then
        edData.SetFocus;
     Exit;
   end;
   if (LkcCarteira.Text = '') then
   begin
     MsgDlg('Seleciona uma Carteira.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if LkcCarteira.CanFocus then
        LkcCarteira.SetFocus;
     Exit;
   end;
   if (LkcInvestimento.Text = '') then
   begin
     MsgDlg('Seleciona um Investimento.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if LkcInvestimento.CanFocus then
        LkcInvestimento.SetFocus;
     Exit;
   end;
   if (LkcCustodiante.Text = '') and (rdgCustodia.ItemIndex < 6) then
   begin
     MsgDlg('Seleciona um Investimento.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if LkcCustodiante.CanFocus then
        LkcCustodiante.SetFocus;
     Exit;
   end;
   if (EdQuantidade.Value = 0) then
   begin
     MsgDlg('Falta preencher a quantidade.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if EdQuantidade.CanFocus then
        EdQuantidade.SetFocus;
     Exit;
   end;
   if (EdQuantidade.Value < 0) Then
   begin
      MsgDlg('Quantidade inválida (Negativa) !','Mensagem do Sistema',mtWarning,[mbOK],0);
      Exit;
   end;
   //AL_25
   if (LkcPlanPatro.Text = '') then
   begin
     MsgDlg('Seleciona um Plano.','Mensagem do Sistema', MtWarning, [MbOk],0);
     if LkcPlanPatro.CanFocus then
        LkcPlanPatro.SetFocus;
     Exit;
   end;

   If QryCarteiraIDCARTEIRAGERENC.AsInteger = 0 Then
   begin
      if (rdgCustodia.Itemindex in [0,1,4,5] ) and (DbLkcMotBlq.Text = '') then
      begin
         MsgDlg('Motivo de Bloqueio/DesBloqueio deve ser informado. ','Mensagem do Sistema', MtWarning, [mbOK],0);
         DbLkcMotBlq.SetFocus;
         exit;
      End;
   End;

   // AL_3 - 20/07/2004
   if (rdgCustodia.ItemIndex = 6) and (rdgCarteira.ItemIndex = 2) then
   begin
      MsgDlg('Escolha uma Atualização, Custódia ou Carteira!','Mensagem do Sistema',mtWarning,[mbOK],0);
      Exit;
   end;
   // AL_16 - Fim

   // Confirma Acerto
   If (MsgDlg('Confirma Acerto ?',
              'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then Begin
     Exit;
   End;


   //AL_8
   wDtMov         := edData.Date;
   wPlano         := -1;
   TipoBloqueio   := -1;
   //AL_24
   iTipoOperacao  := 0;

   //AL_17
   //AL_21
   iTipoConta := 0;

   // Variáveis usadas para segunda movimentação de Bloqueio / Desbloqueio
   TipoBD         := '';
   TipoBloqueioBD := -1;

   //AL_21 - inicio
   //AL_24
   If (rdgCustodia.Enabled) and (rdgCustodia.ItemIndex < 6) Then
   begin
      if rdgCustodia.ItemIndex = -1 Then
      begin
         // Diminui Saldo
         Tipo              := 'V';
         TipoBloqueio      := -1;
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -116, -94);
         sNatureza         := 'D';
      end
      else if rdgCustodia.ItemIndex = 0 Then
      begin
         // Bloqueia - Diminui Saldo Liberado, Aumenta Saldo Bloqueado
         SLiberado         := SLiberado - EdQuantidade.Value;
         Tipo              := 'V';
         TipoBloqueio      := -1;
         SBloqueado        := SBloqueado + EdQuantidade.Value;
         TipoBD            := 'Y';
         //AL_8
         if Trim(DbLkcMotBlq.LookupValue) <> '' then
            TipoBloqueioBD := StrToInt(DbLkcMotBlq.LookupValue);
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -116, -94)
         else                   // CCI
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -10116, -10094);
         sNatureza         := 'D';
      end
      else if rdgCustodia.ItemIndex = 1 Then
      begin
         // Desbloqueia - Diminui Saldo Bloqueado, Aumenta Saldo Liberado
         SBloqueado        := SBloqueado - EdQuantidade.Value;
         Tipo              := 'Z';
         //AL_8
         If Trim(DbLkcMotBlq.LookupValue) <> '' Then
            TipoBloqueio   := StrToInt(DbLkcMotBlq.LookupValue);
         SLiberado         := SLiberado   + EdQuantidade.Value;
         TipoBD            := 'C';
         TipoBloqueioBD    := -1;
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -115, -93)
         else                   // CCI
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -10115, -10093);
         sNatureza         := 'D';
      end
      else if (rdgCustodia.ItemIndex = 2) or (rdgCarteira.ItemIndex = 0)  Then
      begin
         // Aumenta Saldo Liberado
         SLiberado         := SLiberado + EdQuantidade.Value;
         Tipo              := 'C';
         TipoBloqueio      := -1;
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -115, -93)
         else                   // CCI
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -10115, -10093);
         sNatureza         := 'A';
      //AL_7
      end
      else if (rdgCustodia.ItemIndex = 3) or ((rdgCarteira.ItemIndex = 1) and
                  (SLiberado > 0)) Then
      begin
         // Diminui Saldo Liberado
         SLiberado         := SLiberado - EdQuantidade.Value;
         Tipo              := 'V';
         TipoBloqueio      := -1;
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -116, -94)
         else                   // CCI
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -10116, -10094);
         sNatureza         := 'D';
      end
      else if rdgCustodia.ItemIndex = 4 Then
      begin
         // Aumenta Saldo Bloqueado
         SBloqueado        := SBloqueado + EdQuantidade.Value;
         Tipo              := 'Y';
         //AL_8
         If Trim(DbLkcMotBlq.LookupValue) <> '' Then
            TipoBloqueio   := StrToInt(DbLkcMotBlq.LookupValue);
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -115, -93)
         else                   // CCI
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -10115, -10093);
         sNatureza         := 'A';
      end
      else if rdgCustodia.ItemIndex = 5 Then
      begin
         // Diminui Saldo Bloqueado
         SBloqueado        := SBloqueado - EdQuantidade.Value;
         Tipo              := 'Z';
         //AL_8
         If Trim(DbLkcMotBlq.LookupValue) <> '' Then
            TipoBloqueio   := StrToInt(DbLkcMotBlq.LookupValue);
         //AL_9
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -116, -94)
         else                   // CCI
            iTipoOperacao     := OperComum.IIF(rdgCarteira.ItemIndex = 2, -10116, -10094);
         sNatureza         := 'D';
      end;
   end
   else
   begin
      //AL_2 -> 28/06/2004 TRATAMENTO PARA AS CARTEIRAS GERENCIAIS
      if rdgCarteira.ItemIndex = 1 Then begin // Diminui Saldo
         Tipo              := 'V';
         TipoBloqueio      := -1;
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := -94
         else                   // CCI
            iTipoOperacao     := -10094;
         sNatureza         := 'D';
      end else if rdgCarteira.ItemIndex = 0 Then begin // Aumenta Saldo Liberado
         SLiberado         := SLiberado + EdQuantidade.Value;
         Tipo              := 'C';
         TipoBloqueio      := -1;
         // AL_18
         if iTipoConta = 0 then // CC
            iTipoOperacao     := -93
         else                   // CCI
            iTipoOperacao     := -10093;
         sNatureza         := 'A';
      end;
   end;

   //AL_10

   //---Renan Cristiano KT 662265 SOL 126539 início.
   if ((rdgCustodia.ItemIndex in [3,2]) and (SLiberado >= 0)) or
      ((rdgCustodia.ItemIndex in [5,4]) and (SBloqueado >= 0)) or
      ((rdgCustodia.ItemIndex in [0,1,6]) and ((SLiberado >= 0) or (SBloqueado >= 0))) then begin
   //---Renan Cristiano KT 662265 SOL 126539 Fim.

      try
         // Inicia Transacao
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         sBoleta := 'RV-' + Copy(edData.Text,9,2) + '/' +
                            FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                            Copy(edData.Text,9,2)));

         with dmRendaVariavel.qryInsBoleta  do
         begin
            OperComum.LimpaParametros(dmRendaVariavel.qryInsBoleta, True);
            ParamByName('IDBOLETA').AsString     := sBoleta;
            ParamByName('STATUS').AsString       := 'P';
            ParamByName('DATABOLETA').AsDateTime := edData.Date;
            ParamByName('TIPMOVBOLETA').AsString := 'AJQ';
            ExecSQL;
         end;

         // Inicia a OperacaoInvest
         // Gera Novo Id de Operacao
         idOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');
         //AL_1
         //AL_4
         //AL_17
         //AL_19
          CtrlRV.BuscaSaldoRV.Executa(edData.Date,
                                      QryPlanoPatroIDPLANPREVCTBPATR.AsInteger,
                                      QryInvestimentoIDINVESTIMENTO.AsInteger,
                                      QryCarteiraIDCARTEIRAINVEST.AsInteger,
                                      QryCarteiraIDCARTEIRAGERENC.AsInteger,
                                      High(Integer),
                                      qryCustodianteIDCUSTODIANTE.AsInteger,
                                      OperComum.IIF(Trim(DbLkcLote.Text)='','', QryLoteIDLOTE.AsString));

          fSaldoQtd       := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;

         //AL_6
         // Verifica se possui saldo para Ajustar.
         if (fSaldoQtd < EdQuantidade.Value) And (rdgCarteira.ItemIndex = 1 ) then
            Raise Exception.Create('Quantidade Superior ao Saldo do Investimento.');

         // AL_13 Ini
         // AL_14
         if ((rdgSaldosCarteira.ItemIndex = 1) and  (rdgCarteira.ItemIndex <> 2) and
             ((sNatureza = 'A') or (sNatureza = 'D'))) then // Ajuste de Qtd sem Ajuste nos Saldos
         begin
            if sNatureza = 'A' then
               iTipoOperacao     := -124
            else if sNatureza = 'D' then
               iTipoOperacao     := -125;
            //AL_27
            fSaldoAquiPro     := OperComum.Round(CtrlRV.BuscaSaldoRV.SaldoCusto,2);
            //AL_27
            fSaldoVariacaoPro := OperComum.Round(CtrlRV.BuscaSaldoRV.SaldoVariacao,2);
            //AL_27
            fSaldoIrApuPro    := OperComum.Round(CtrlRV.BuscaSaldoRV.SaldoIRApurado,2);

            fValorOper :=  0;
         end
         else
         begin
            //AL_27
            fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoCusto,fSaldoQtd),9);
            fSaldoAquiPro     := OperComum.Round(fPU * EdQuantidade.Value,2);
            //AL_27
            fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVariacao,fSaldoQtd),9);
            fSaldoVariacaoPro := OperComum.Round(fPU * EdQuantidade.Value,2);
            //AL_27
            fPU               := OperComum.Round(OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoIRApurado,fSaldoQtd),9);
            fSaldoIrApuPro    := OperComum.Round(fPU * EdQuantidade.Value,2);

            //AL_27
            fValorOper :=  OperComum.Round(OperComum.DivValorZero((EdQuantidade.Value * CtrlRV.BuscaSaldoRV.SaldoVlrTotal),fSaldoQtd),2);
         end;
         //AL_13 Fim

         // Inclui Dados na Tabela de Operacao, OPERACAOINVEST.
         with QryInsOperacaoInvest do
         begin
            OperComum.LimpaParametros(QryInsOperacaoInvest);
            ParamByName('IDOPERACAOINVEST').AsInteger := idOperacaoInvest;
            ParamByName('IDCORRETVALORES').Clear;
            ParamByName('MOECODIGO').AsInteger        := pRPI.MOECODIGO;
            ParamByName('IDMODULO').AsInteger         := Sistema.IdModulo;
            ParamByName('EMPRESAPROP').AsInteger      := Sistema.IdEmpresa;
            ParamByName('IDINVESTIMENTO').AsInteger   := QryInvestimentoIDINVESTIMENTO.AsInteger;
            ParamByName('IDCARTEIRAINVEST').AsInteger := QryCarteiraIDCARTEIRAINVEST.AsInteger;
            ParamByName('IDCARTEIRAGERENC').AsInteger := QryCarteiraIDCARTEIRAGERENC.AsInteger;
            If QryCarteiraIDCARTEIRAGERENC.AsInteger = 0 Then
               ParamByName('IDCARTEIRAGERENC').Clear;
            ParamByName('IDTIPOINVEST').AsInteger     := 2;
            ParamByName('IDTIPOOPERACAO').AsInteger   := iTipoOperacao;
            ParamByName('DATAOPERACAO').AsString      := edData.Text;
            ParamByName('NUMDOCUMENTO').AsString      := sBoleta;
            ParamByName('QTDEOPERACAO').AsFloat       := EdQuantidade.Value;
            ParamByName('PRECOUNITOPERACAO').AsFloat  := 0;
            ParamByName('VLROPERACAO').AsFloat        := fValorOper;
            ParamByName('DATAVENCOPER').AsString      := edData.Text;
            ParamByName('IDFORCLI').Clear;
            ParamByName('IDLOTE').AsString            := DbLkcLote.Text;
            ParamByName('IDCUSTODIANTE').AsInteger    := QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
            ParamByName('VLRIR').AsFloat              := 0;
            ParamByName('FLGSTATUSFECHBOL').AsString  := 'F';
            ParamByName('FLGSTATUSORDMOV').AsString   := 'L';
            //AL_25
            ParamByName('IDPLANPREVCTBPATR').AsInteger:= QryPlanoPatroIDPLANPREVCTBPATR.AsInteger;
            //Al_12
            ParamByName('OBSERVACAO').AsString        := Trim(mObservacao.Text);
            ExecSQL;
         end;

         // AL_3 - 20/07/2004
         // Se faz atualização na Custódia
         if rdgCustodia.ItemIndex < 6 then
         begin
            iIdHistCustodiaOrig := -1;
            iIdHistCustodiaDest := -1;

            If QryCarteiraIDCARTEIRAGERENC.AsInteger = 0 Then
            begin
               // Atualiza Histórico de Custõdia
               //AL_17
               //AL_25
               OperacaoInvest.InsereCustodia(QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                             QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger, TipoBloqueio,
                                             idOperacaoInvest, -1,
                                             DbLkcLote.Text,  Tipo, edData.Date, edQuantidade.Value,iIdHistCustodiaOrig,
                                             QryPlanoPatroIDPLANPREVCTBPATR.AsInteger);

               //AL_17
               //AL_25
               if TipoBD <> '' then
                  OperacaoInvest.InsereCustodia(QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                                QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger, TipoBloqueioBD,
                                                idOperacaoInvest, -1,
                                                DbLkcLote.Text,  TipoBD, edData.Date, edQuantidade.Value,iIdHistCustodiaDest,
                                                QryPlanoPatroIDPLANPREVCTBPATR.AsInteger);

               // Insere OperCustodia
               idOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');
               //AL_25
               //AL_26
               if not OperacaoInvest.AlimentaOperCustodia(idOperCustodia,
                                                          iIdHistCustodiaOrig,
                                                          iIdHistCustodiaDest,
                                                          -1,-1,
                                                          QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                          QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                          QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                                          QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                                          QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                                          TipoBloqueio,
                                                          TipoBloqueioBD,
                                                          edQuantidade.Value,
                                                          edData.Date,
                                                          DbLkcLote.Text,
                                                          sBoleta,
                                                          QryPlanoPatroIDPLANPREVCTBPATR.AsInteger,
                                                          iTipoOperacao) then
                  Raise Exception.Create('Não Foi Possivel Gravar a Operação na Custódia');

                  With dtmOperComum.QryLocal Do
                  begin
                    Close;
                    Sql.Clear;
                    Sql.Add('UPDATE OPERACAOINVEST ');
                    Sql.Add('SET IDOPERCUSTODIA = ' + IntToStr(idOperCustodia) + ' ');
                    Sql.Add('WHERE IDOPERACAOINVEST = '+ IntToStr(idOperacaoInvest));
                    ExecSQL;
                  end;

               OperacaoInvest.AtualizaSaldosCustodia;
            end;
         end;

         // Ajusta a Carteira
         if rdgCarteira.ItemIndex < 2 then
         begin

            With dtmOperComum.QryLocal Do
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO ');
              Sql.Add('WHERE (IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
              Open;
              sTipoOperacao := FieldByName('DESCTIPOOPERACAO').AsString;
              Close;
            end;

            With dtmOperComum.QryLocal Do
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO ');
              Sql.Add('WHERE (IDINVESTIMENTO = '+ QryInvestimentoIDINVESTIMENTO.AsString+')');
              Open;
              sInvestimento := FieldByName('DESCINVESTIMENTO').AsString;
              Close;
            end;

            // Variáveis para Contabilização
            bCriaLancto := False;
            iPlanilha := -1;
            iPlano    := -1;
            iDocumento:= -1;

            //AL_25
            //Credito na Carteira
            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                              QryInvestimentoIDINVESTIMENTO.AsInteger,
                                              2, idOperacaoInvest, -1,
                                              iTipoOperacao,
                                              QryCarteiraIDCARTEIRAINVEST.AsInteger,
                                              QryCarteiraIDCARTEIRAGERENC.AsInteger,
                                              -1,-1,iPlanilha,iDocumento, iPlano, edData.DateTime,
                                              fValorOper, EdQuantidade.Value,
                                              1,0,0,0,0,0,0,0,0,0,
                                              sNatureza {NaturMov},sNatureza {NaturOpe},DbLkcLote.Text,
                                              sTipoOperacao +' : '+ sInvestimento,
                                              'OPE', '', '', True,-1 {iCorretValores},
                                              QryPlanoPatroIDPLANPREVCTBPATR.AsInteger,
                                              iIdHistCartInv) Then
               Raise Exception.Create('Não Foi Possivel Atualizar a Carteira');

            ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                               ' VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                               ' VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                               ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));


            // Verificar - Só se o tipo de operação exigir
            ExecutaQuery(dtmOperComum.QryLocal,'UPDATE OPERCUSTODIA ' +
                                               'SET IDHISTCARTINVORIG = '+ IntToStr(iIdHistCartInv)+ ' ' +
                                               'WHERE IDOPERCUSTODIA = '+IntToStr(idOperCustodia));


            If Not OperComum.AtualizaSaldos(1,-1) Then
               Raise Exception.Create('Não Foi Possivel Atualizar os Saldos');


            If QryCarteiraIDCARTEIRAGERENC.AsInteger = 0 Then
            begin
               // AL_11
               if not CtrlInvContab.TestaPeriodo(edData.Text,
                                                 //AL_22
                                                 2) then
                  Raise Exception.Create(CtrlInvContab.MessageInfo);

               OperComum.BuscaFlgContab(iTipoOperacao);
               // Custo
               wTipoRecDesBol := '';
               //AL_25
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                       QryInvestimentoIDINVESTIMENTO.AsInteger,
                                       iTipoOperacao,
                                       //AL_28
                                       idOperacaoInvest,
                                       QryInvestimentoIDEMISSOR.AsInteger,
                                       QryCarteiraIDCARTEIRAINVEST.AsInteger,
                                       pRPI.MOECODIGO, '','','','','',
                                       wTipoRecDesBol, bCriaLancto,
                                       //AL_28
                                       fValorOper
                                       fValorOper,
                                       edData.DateTime,edData.DateTime,
                                       iPlano, iPlanilha, iDocumento, wMensErro,
                                       '',
                                       //AL_28
                                       False,
                                       True, 0, True, QryPlanoPatroIDPLANPREVCTBPATR.AsInteger);
               if Trim(wMensErro) <> '' then
                  Raise Exception.Create('Ocorreu um erro ao Contabilizar o Valor da Operação');

               // Grava Planilha e Documento na Boleta
               if (iPlanilha > 0) or (iDocumento > 0) then
               begin
                  OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                  DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
                  //AL_28
                  DMRendaVariavel.qryUpdBoleta.ParamByName('STATUS').AsString := 'P';

                  if iPlanilha > 0 then
                  begin
                     DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger    := iPlano;
                     //AL_28
                     DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
                  end;

                  if iDocumento > 0 then
                     DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;

                  DMRendaVariavel.qryUpdBoleta.ExecSQL;
               end;
            end;

            // Só marca o papel se for alterada a carteira
            If wDtMov <= pRPI.DATAULTFECH Then
               RendaVariavel.MarcarFlagReproc(QryInvestimentoIDINVESTIMENTO.AsInteger,
                                              -1, -1, edData.DateTime);
         end;


         // Comita Transacao
         DtmBaseDados.dbBaseDados.Commit;

      except
         //AL_22
         on E: Exception do
         begin
            MsgDlg('Operação não efetivada..' + #13 +
                   E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
            DtmBaseDados.dbBaseDados.RollBack;
            Exit;
         end;
      end;

      EdQuantidade.Value := 0;
      Label12.Visible      := ((rdgCustodia.Itemindex <> 2) and (rdgCustodia.Itemindex <> 3));
      DbLkcMotBlq.Visible  := ((rdgCustodia.Itemindex <> 2) and (rdgCustodia.Itemindex <> 3));

      // para fazer o refresh dos panels
      //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
      MostraSaldos;

      //AL_28
      MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema', MtConfirmation, [MbOk],0);
   end
   else
   begin
       MessageBox(Handle,'Acerto não realizado. Saldo não pode se tornar negativo.','Custódia', MB_OK or
                  MB_APPLMODAL or MB_ICONEXCLAMATION);
      //---Renan Cristiano KT 662265 SOL 126539 início.
       SLiberado := 0;
       SBloqueado := 0;
       //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
       MostraSaldos;
      //---Renan Cristiano KT 662265 SOL 126539 Fim.
   end;
end;

procedure TfrmAcertaCustodia.FormShow(Sender: TObject);
begin
  inherited;
// Abre Tabelas
  If pRPI.FLGCARTGERENC = 'S' Then
  Begin
     With QryCarteira Do
     Begin
        Close;
        Sql.Clear;
        //AL_20
        Sql.Add('SELECT (IDCARTEIRAINVEST+IDCARTEIRAGERENC+100) AS ID,');
        Sql.Add('IDCARTEIRAINVEST, IDCARTEIRAGERENC,');
        Sql.Add('DESCCARTGERENC AS DESCCARTINVEST FROM     ');
        Sql.Add('CARTEIRAGERENC ');
        Sql.Add('UNION                                     ');
        Sql.Add('SELECT (IDCARTEIRAINVEST) AS ID,');
        Sql.Add('IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC,');
        Sql.Add('DESCCARTINVEST FROM  CARTEIRAINVEST WHERE');
        Sql.Add('IDTIPOINVEST = 2');
        Sql.Add('ORDER BY DESCCARTINVEST');
     End;
  End;
  //AL_25
  QryPlanoPatro.Open;
  QryCarteira.Open;
  QryInvestimento.Open;
  QryLote.Open;
  QryCustodiante.Open;
  QryMotBlq.Open;
  // AL_18 - Ini
  //AL_21
  QryCustodia.Close;
  // AL_16
  edData.Date          := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);
  EdQuantidade.Value   := 0;
  Label12.Visible      := True;
  DbLkcMotBlq.Visible  := True;
  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
  MostraSaldos;
end;

procedure TfrmAcertaCustodia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCarteira.Close;
  QryInvestimento.Close;
  QryLote.Close;
  QryCustodiante.Close;
  QryMotBlq.Close;
  QryCustodia.Close;
end;

procedure TfrmAcertaCustodia.QryLoteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If QryLote.IsEmpty Then
    DbLkcLote.Text:='';
end;

procedure TfrmAcertaCustodia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edData.Date        := Date;
  EdQuantidade.Value := 0;
end;

procedure TfrmAcertaCustodia.rdgCustodiaClick(Sender: TObject);
begin
  inherited;
  // AL_3 - 20/07/2004
  Label12.Visible      := ((rdgCustodia.Itemindex <> 2) and (rdgCustodia.Itemindex <> 3) and (rdgCustodia.Itemindex <> 6));
  DbLkcMotBlq.Visible  := ((rdgCustodia.Itemindex <> 2) and (rdgCustodia.Itemindex <> 3) and (rdgCustodia.Itemindex <> 6));

  // AL_9 - Bloquear ou desbloquear papeis não afeta a carteira
  if rdgCustodia.Itemindex < 2 then
     rdgCarteira.ItemIndex := 2;

  // para fazer o refresh dos panels
  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
  MostraSaldos;
end;

procedure TFrmAcertaCustodia.MontaQrySaldoCustodia;
begin
   //AL_25
   qryCustodia.ParamByName('IDPLANPREVCTBPATR').AsInteger := QryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
   qryCustodia.ParamByName('IdInvestimento').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
   qryCustodia.ParamByName('IdCarteira').AsInteger := QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
   if Trim(DbLkcLote.Text) = '' then
      qryCustodia.ParamByName('IdLote').Clear
   else
      qryCustodia.ParamByName('IdLote').AsString := DbLkcLote.Text;
   qryCustodia.ParamByName('DataMov').AsDateTime := edData.Date;
   qryCustodia.ParamByName('IDCUSTODIANTE').AsInteger := QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
   qryCustodia.ParamByName('IdCustodia').AsInteger := 9999999;
end;

//AL_25
function TFrmAcertaCustodia.AjustaCarteira(iCarteira,
                                           iInvestimento,
                                           iForCli,
                                           iCustodiante,
                                           iAcao, iPlanoPatro : Integer;
                                           sLote, sBoleta: String;
                                           fQuantidade : Double;
                                           dDataRef : TDateTime):boolean;
Var
   iIdHistCartInv, wIdNovaOperacao: Integer;
   fPU, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro,
   fSaldoQtd, fSaldoVlr, fSaldoInutil, fSaldoAqui, fSaldoRend,
   fSaldoVariacao, fSaldoIrApu, fValorOper: Double;
   bCriaLancto: Boolean;
   sTipoOperacao, sInvestimento, wMensErro, sNatureza, wTipoRecDesBol: String;
   iPlano, iPlanilha, iDocumento, iTipoOperacao: Integer;
   wPlanilha, wDocumento, wPlano :Integer;

begin
   Result := True;
   wPlano := -1;

   // Não Ajusta Carteira
   if iAcao = 2 then Exit;
   //AL_1
   //AL_4
   //AL_17
   //AL_19
   //AL_25
   CtrlRV.BuscaSaldoRV.Executa(edData.Date,
                               iPlanoPatro,
                               iInvestimento,
                               iCarteira,
                               0,
                               High(Integer),
                               iCustodiante,
                               sLote);

   fSaldoQtd       := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
   fSaldoVlr       := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
   wSaldoAqui      := CtrlRV.BuscaSaldoRV.SaldoCusto;
   wSaldoIRApu     := CtrlRV.BuscaSaldoRV.SaldoIRApurado;
   fSaldoVariacao  := CtrlRV.BuscaSaldoRV.SaldoVariacao;

   // Verifica se possui saldo para transferir.
   if fSaldoQtd < fQuantidade then
   begin
      MsgDlg('Quantidade superior ao saldo do Investimento.','Mensagem do Sistema',mtError,[mbOK],0);
      Result := False;
      Exit;
   end;

   // Inicia o Processo
   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      // AL_13 Ini
      if rdgSaldosCarteira.ItemIndex = 1 then // Ajuste de Qtd sem Ajuste nos Saldos
      begin
         iTipoOperacao     := -124;
         fSaldoAquiPro     := OperComum.Round(fSaldoAqui,2);

         fSaldoVariacaoPro := OperComum.Round(fSaldoVariacao,2);

         fSaldoIrApuPro    := OperComum.Round(fSaldoIrApu,2);

         fValorOper :=  0;
      end
      else
      begin
         fPU               := OperComum.Round(OperComum.DivValorZero(fSaldoAqui,fSaldoQtd),9);
         fSaldoAquiPro     := OperComum.Round(fPU * fQuantidade,2);

         fPU               := OperComum.Round(OperComum.DivValorZero(fSaldoVariacao,fSaldoQtd),9);
         fSaldoVariacaoPro := OperComum.Round(fPU * fQuantidade,2);

         fPU               := OperComum.Round(OperComum.DivValorZero(fSaldoIrApu,fSaldoQtd),9);
         fSaldoIrApuPro    := OperComum.Round(fPU * fQuantidade,2);

         fValorOper :=  OperComum.Round(OperComum.DivValorZero((fQuantidade * fSaldoVlr),fSaldoQtd),2);
      end;
      // AL_13 Fim

      if iAcao = 0 then
      begin
         // Aumenta
         iTipoOperacao := -93;
         sNatureza := 'A';
      end else begin
         // Diminui
         iTipoOperacao := -94;
         sNatureza := 'D';
      end;

      With dtmOperComum.QryLocal Do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO ');
        Sql.Add('WHERE (IDTIPOOPERACAO = '+ IntToStr(iTipoOperacao)+')');
        Open;
        sTipoOperacao := FieldByName('DESCTIPOOPERACAO').AsString;
        Close;
      end;

      With dtmOperComum.QryLocal Do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO ');
        Sql.Add('WHERE (IDINVESTIMENTO = '+ IntToStr(iInvestimento)+')');
        Open;
        sInvestimento := FieldByName('DESCINVESTIMENTO').AsString;
        Close;
      end;

      // Variáveis para Contabilização
      bCriaLancto := False;
      iPlanilha := -1;
      iPlano    := -1;
      iDocumento:= -1;

      // Gera Novo Id de Operacao
      wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

      // Inclui Dados na Tabela de Operacao, OPERACAOINVEST
      OperComum.LimpaParametros(QryInsOperacaoInvest);
      QryInsOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
      QryInsOperacaoInvest.ParamByName('IDCORRETVALORES').Clear;
      QryInsOperacaoInvest.ParamByName('MOECODIGO').AsInteger        := pRPI.MOECODIGO;
      QryInsOperacaoInvest.ParamByName('IDMODULO').AsInteger         := Sistema.IdModulo;
      QryInsOperacaoInvest.ParamByName('EMPRESAPROP').AsInteger      := Sistema.IdEmpresa;
      QryInsOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
      QryInsOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
      QryInsOperacaoInvest.ParamByName('IDCARTEIRAGERENC').Clear;
      QryInsOperacaoInvest.ParamByName('IDTIPOINVEST').AsInteger     := 2;
      QryInsOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger   := iTipoOperacao;
      QryInsOperacaoInvest.ParamByName('DATAOPERACAO').AsDateTime    := dDataRef;
      QryInsOperacaoInvest.ParamByName('NUMDOCUMENTO').AsString      := sBoleta;
      QryInsOperacaoInvest.ParamByName('QTDEOPERACAO').AsFloat       := fQuantidade;
      QryInsOperacaoInvest.ParamByName('PRECOUNITOPERACAO').AsFloat  := 0;
      QryInsOperacaoInvest.ParamByName('VLROPERACAO').AsFloat        := fValorOper;
      QryInsOperacaoInvest.ParamByName('DATAVENCOPER').AsDateTime    := dDataRef;
      QryInsOperacaoInvest.ParamByName('IDFORCLI').Clear;
      QryInsOperacaoInvest.ParamByName('IDLOTE').AsString            := slote;
      QryInsOperacaoInvest.ParamByName('IDCUSTODIANTE').AsInteger    := QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
      QryInsOperacaoInvest.ParamByName('VLRIR').AsFloat              := 0;
      QryInsOperacaoInvest.ParamByName('FLGSTATUSFECHBOL').AsString  := 'F';
      QryInsOperacaoInvest.ParamByName('FLGSTATUSORDMOV').AsString   := 'L';
      //AL_25
      QryInsOperacaoInvest.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanoPatro;
      QryInsOperacaoInvest.ExecSQL;

      //AL_25
      //Credito na Carteira
      If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                        iInvestimento,
                                        2,-1,-1,
                                        iTipoOperacao,
                                        iCarteira,0,
                                        -1,-1,iPlanilha,iDocumento, iPlano, dDataRef,
                                        fValorOper, fQuantidade,
                                        1,0,0,0,0,0,0,0,0,0,
                                        sNatureza {NaturMov},sNatureza {NaturOpe},slote,
                                        sTipoOperacao +' : '+ sInvestimento,
                                        'OPE', '', '', True,-1 {iCorretValores},
                                        iPlanoPatro,
                                        iIdHistCartInv) Then
      Begin
         MsgDlg('Erro ao Alimentar as Carteiras ','Mensagem do Sistema ',MtError,[MbOk],0);
         Result := False;
         Exit;
      End;

      ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                           ' VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                           ' VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                           ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

      If Not OperComum.AtualizaSaldos(1,-1) Then
      begin
         Result := False;
         Exit;
      end;

      // AL_11
      if not CtrlInvContab.TestaPeriodo(DateToStr(dDataRef),
                                                  //AL_22
                                                  2) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);

      OperComum.BuscaFlgContab(iTipoOperacao);
      // Custo
      wTipoRecDesBol := '';
      //AL_25
      OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                              iInvestimento,iTipoOperacao,
                              //AL_28
                              wIdNovaOperacao,
                              iForCli,iCarteira,pRPI.MOECODIGO, '','','','','',
                              wTipoRecDesBol, bCriaLancto, 0,
                              fValorOper,
                              dDataRef,dDataRef,
                              iPlano, iPlanilha, iDocumento, wMensErro,
                              '', True, True, 0, True, iPlanoPatro);
      if Trim(wMensErro) <> '' then
      begin
         MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                'Mensagem do Sistema', MtWarning, [MbOk], 0);
         Result := False;
         Exit;
      end;

      iPlano := wPlano;
      // Variacao
      wTipoRecDesBol := '';
      //AL_25
      OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                              iInvestimento,iTipoOperacao,
                              //AL_28
                              wIdNovaOperacao,
                              iForCli,iCarteira,pRPI.MOECODIGO, '','','','','',
                              wTipoRecDesBol,bCriaLancto, 0,
                              fSaldoVariacaoPro,
                              dDataRef,dDataRef,
                              iPlano, iPlanilha, iDocumento, wMensErro,
                              '', True, True, 0, True, iPlanoPatro);
      if Trim(wMensErro) <> '' then
      begin
         MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                'Mensagem do Sistema', MtWarning, [MbOk], 0);
         Result := False;
         Exit;
      end;

      // Grava Planilha e Documento na Boleta
      if (iPlanilha > 0) or (iDocumento > 0) then
      begin
         OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
         DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := sBoleta;

         if iPlanilha > 0 then
         begin
            DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := iPlano;
            DMRendaVariavel.qryUpdBoleta.ParamByName('PLANILHA').AsInteger := iPlanilha;
         end;

         if iDocumento > 0 then
            DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;

         DMRendaVariavel.qryUpdBoleta.ExecSQL;
      end;

   Except
      MsgDlg('Não foi possível Atualizar a Carteira.',
             'Mensagem do Sistema',mtWarning,[mbOK],0);
      Result := False;
      Exit;
   End;
end;


procedure TfrmAcertaCustodia.rdgCarteiraClick(Sender: TObject);
begin
   inherited;
   // Bloquear ou desbloquear papeis não afeta a carteira
   if rdgCustodia.Itemindex in [0, 1] then
   begin
      if rdgCarteira.ItemIndex < 2 then
      begin
         MsgDlg('Bloqueio ou desbloqueio não afetam a carteira.','Mensagem do Sistema',mtWarning,[mbOK],0);
         rdgCarteira.ItemIndex := 2;
      end;
   end;
   //AL_21
   if rdgCarteira.ItemIndex = 2 then
   begin
      rdgSaldosCarteira.Enabled := False;
      rdgSaldosCarteira.ItemIndex := 1;
   end
   else
      rdgSaldosCarteira.Enabled := True;
end;

procedure TfrmAcertaCustodia.rdgCarteiraExit(Sender: TObject);
begin
   //AL_21
   inherited;
   if rdgCarteira.ItemIndex = 2 then
   begin
      rdgSaldosCarteira.Enabled := False;
      rdgSaldosCarteira.ItemIndex := 1;
   end
   else
      rdgSaldosCarteira.Enabled := True;
end;

function TfrmAcertaCustodia.MostraSaldosXX(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                         iInvestimento, iCustodiante: Integer;
                                         sLote, sData: String) : boolean;
var
  QryLocal              :TwwQuery;
  fSaldoQtd, fSaldoCPMF, fSaldoInutil : Double;
  //AL_25
  //iPlanoPatro, iCarteira, iCarteiraGerenc, iInvestimento, iCustodiante: Integer;
  //sLote: String;
begin

   rdgCustodia.Enabled   := True;
   DbLkcMotBlq.Enabled   := True;

   //AL_18 - Inicio
   iCarteira := -1;
   iCarteiraGerenc := -1;
   iInvestimento := -1;
   iCustodiante := -1;
   sLote := '';

   SLiberado     := 0;
   SLiberadoCC   := 0;
   SBloqueado    := 0;
   SBloqueadoCC  := 0;

   //AL_25
   //AL_26
   if (Trim(LkcPlanPatro.Text) <> '') and (Trim(LkcCarteira.Text) <> '') and
      (Trim(LkcInvestimento.Text) <> '') and (Trim(edData.Text) <> '') Then
   begin
      if Trim(LkcCarteira.Text) <> '' then
      begin
         iCarteira := QryCarteiraIDCARTEIRAINVEST.AsInteger;
         iCarteiraGerenc := QryCarteiraIDCARTEIRAGERENC.AsInteger;
      end;
      if Trim(LkcInvestimento.Text) <> '' then
         iInvestimento := QryInvestimentoIDINVESTIMENTO.AsInteger;
      if Trim(LkcCustodiante.Text) <> '' then
         iCustodiante := qryCustodianteIDCUSTODIANTE.AsInteger;
      if Trim(DbLkcLote.Text) <> '' then
         sLote := QryLoteIDLOTE.AsString;
       //AL_25
      if Trim(LkcPlanPatro.Text) <> '' then
         iPlanoPatro := QryPlanoPatroIDPLANPREVCTBPATR.AsInteger;


      //AL_19

   if (iPlanoPatro > 0) and (iCarteira > 0) and
      (iInvestimento > 0) and (sData <> '') Then
   begin

       CtrlRV.BuscaSaldoRV.Executa(edData.Date,
                                   iPlanoPatro,
                                   iInvestimento,
                                   iCarteira, iCarteiraGerenc,
                                   High(Integer),
                                   iCustodiante, sLote);

       fSaldoQtd       := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;


      //AL_21
      PnlSldLibCarCC.Caption  := FormatFloat('###,###,###,##0', fSaldoQtd) + ' ';

      If QryCarteiraIDCARTEIRAGERENC.AsInteger = 0 Then
      begin
          // Busca Saldo Liberado do Custodiante
          OperComum.LimpaParametros(qryCustodia);
          MontaQrySaldoCustodia;
          qryCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := -1;
          qryCustodia.Open;

          if not qryCustodia.IsEmpty then
          begin
             PnlSldLibCusCC.Caption  := FormatFloat('###,###,###,##0',
                                                   QryCustodia.FieldByName('SALDOLIBERADO').AsFloat)+' ';
             SLiberado :=    QryCustodia.FieldByName('SALDOLIBERADO').AsFloat;
             SLiberadoCC :=  QryCustodia.FieldByName('SALDOQTDECPMF').AsFloat;
          end
          else
          begin
             PnlSldLibCusCC.Caption  := '';
             SLiberado :=    0;
             SLiberadoCC :=  0;
          end;

          // Se a Operaçao tiver Motivo Bloqueio, busca Saldo Bloqueado relacionado ao Motivo,
          // Senao, Busca Mostra Total do Saldo Bloqueado

          try
             QryLocal              := TwwQuery.Create(Application);
             QryLocal.DatabaseName := 'BaseDados';
             SBloqueado := 0;

             if (DbLkcMotBlq.Visible) and (DbLkcMotBlq.Text <> '') then
                FazQuery(QryLocal,'SELECT IDMOTIVOBLOQUEIO '+
                                  'FROM MOTIVOBLOQUEIO '+
                                  'WHERE  IDMOTIVOBLOQUEIO = ' + QryMotBlq.FieldByName('IDMOTIVOBLOQUEIO').AsString)
             else
                FazQuery(QryLocal,'SELECT IDMOTIVOBLOQUEIO '+
                                  'FROM MOTIVOBLOQUEIO '+
                                  'WHERE  IDMOTIVOBLOQUEIO <> -1');

             While Not QryLocal.Eof Do
             Begin
                OperComum.LimpaParametros(qryCustodia);
                MontaQrySaldoCustodia;
                qryCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger :=
                   QryLocal.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
                qryCustodia.Open;

                SBloqueado    := SBloqueado    + qryCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;
                SBloqueadoCC  := SBloqueadoCC  + qryCustodia.FieldByName('SALDOQTDECPMF').AsFloat;
                QryLocal.Next;
             End;

             if SBloqueado <> 0 then
             begin
                PnlSldBloCusCC.Caption  := FormatFloat('###,###,###,##0', SBloqueado)+' ';
             end
             else
             begin
                PnlSldBloCusCC.Caption  := '';
             end;
             // AL_21
             if (fSaldoQtd > 0) and ((SBloqueado + SLiberado) > 0) then
             begin
                if fSaldoQtd <> (SBloqueado + SLiberado) then
                begin
                   pnlSaldosCustodia.Color := clCereja;
                   pnlSaldosCarteira.Color := clCereja;
                end
                else
                begin
                   pnlSaldosCustodia.Color := clNavy;
                   pnlSaldosCarteira.Color := clNavy;
                end;
             end;
          finally
             QryLocal.Close;
             FreeAndNil(QryLocal);
          end;
      End
      Else
      begin
          rdgCustodia.ItemIndex := -1;
          rdgCustodia.Enabled   := False;
          DbLkcMotBlq.Text      := '';
          DbLkcMotBlq.Enabled   := False;
      end;
   end;
end;
end;

procedure TfrmAcertaCustodia.LkcCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
     LkcCarteira.Tag := 1;
  end;
end;

procedure TfrmAcertaCustodia.DbLkcLoteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
     DbLkcLote.Tag := 1;
  end;
end;

procedure TfrmAcertaCustodia.LkcInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
     LkcInvestimento.Tag := 1;
  end;
end;

procedure TfrmAcertaCustodia.LkcCustodianteCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
     LkcCustodiante.Tag := 1;
  end;
end;

procedure TfrmAcertaCustodia.edDataCloseUp(Sender: TObject);
begin
  inherited;
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
  MostraSaldos;
  edData.Tag := 1;

end;

procedure TfrmAcertaCustodia.LkcCarteiraExit(Sender: TObject);
begin
  inherited;
  if LkcCarteira.Tag = 0 then
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
end;

procedure TfrmAcertaCustodia.LkcInvestimentoExit(Sender: TObject);
begin
  inherited;
  if LkcInvestimento.Tag = 0 then
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
end;

procedure TfrmAcertaCustodia.DbLkcLoteExit(Sender: TObject);
begin
  inherited;
  if DbLkcLote.Tag = 0 then
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
end;

procedure TfrmAcertaCustodia.LkcCustodianteExit(Sender: TObject);
begin
  inherited;
  if LkcCustodiante.Tag = 0 then
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
end;

procedure TfrmAcertaCustodia.edDataExit(Sender: TObject);
begin
  inherited;
  if edData.Tag = 0 then
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
end;

//AL_25
procedure TfrmAcertaCustodia.LkcPlanPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
     LkcPlanPatro.Tag := 1;
  end;
end;

//AL_25
procedure TfrmAcertaCustodia.LkcPlanPatroEnter(Sender: TObject);
begin
  inherited;
  LkcPlanPatro.Tag := 0;
end;

//AL_25
procedure TfrmAcertaCustodia.LkcPlanPatroExit(Sender: TObject);
begin
  inherited;
  if LkcPlanPatro.Tag = 0 then
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     MostraSaldos;
end;

//AL_25
procedure TfrmAcertaCustodia.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
   TCustodia.Create;
   Rv := TCustodia.Create;
end;

//AL_25
procedure TfrmAcertaCustodia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRV);
   FreeAndNil(Rv);
end;

Procedure TfrmAcertaCustodia.MostraSaldos;
var
  fSaldoQtd: Double;
begin
  rdgCustodia.Enabled   := True;
  DbLkcMotBlq.Enabled   := True;

  Rv.ConciliaCustodia(QryPlanoPatroIDPLANPREVCTBPATR.AsInteger, QryCarteiraIDCARTEIRAINVEST.AsInteger,
                 QryCarteiraIDCARTEIRAGERENC.AsInteger, QryInvestimentoIDINVESTIMENTO.AsInteger,
                 QryCustodianteIDCUSTODIANTE.AsInteger, QryLoteIDLOTE.AsString, edData.Date);


  if QryCarteiraIDCARTEIRAGERENC.AsInteger = 0 then begin

    fSaldoQtd  := Rv.FSaldoQtdCustodia;
    SLiberado  := Rv.FSldLibCustodia;
    SBloqueado := Rv.FSaldoBloqueado;

    if (fSaldoQtd >= 0) and ((SBloqueado + SLiberado) >= 0) then
    begin
      if fSaldoQtd <> (SBloqueado + SLiberado) then
      begin
        pnlSaldosCustodia.Color := clCereja;
        pnlSaldosCarteira.Color := clCereja;
      end
      else
      begin
        pnlSaldosCustodia.Color := clNavy;
        pnlSaldosCarteira.Color := clNavy;
      end;
    end;

    PnlSldLibCarCC.Caption := FormatFloat('###,###,###,##0',fSaldoQtd) + ' ';
    PnlSldLibCusCC.Caption := FormatFloat('###,###,###,##0',SLiberado) + ' ';
    PnlSldBloCusCC.Caption := FormatFloat('###,###,###,##0',SBloqueado) + ' ';

  end else begin

    rdgCustodia.ItemIndex := -1;
    rdgCustodia.Enabled   := False;
    DbLkcMotBlq.Text      := '';
    DbLkcMotBlq.Enabled   := False;

  end;
end;

end.


