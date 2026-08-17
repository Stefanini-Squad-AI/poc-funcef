//******************************************************************************
// Data      : 11/06/2007
// Código    : AL_15
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de despesa conforme especificação para as operações
//             de aplicação, resgate, amortização e integralização
//******************************************************************************
// Data      : 20/11/2006
// Código    : AL_14
// Pendencia : 23349/23787
// SOL       : 43633
// Motivo    : Implementação da transferência entre Tipos de Fundo.
//******************************************************************************
// Data      : 22/08/2006
// Código    : AL_13
// Pendencia : 22781
// SOL       :
// Motivo    : Implementação do total da transf. de entrada e saida
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_12
// Pendencia : 23122
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação(QryCotaIntegrFundo)
//******************************************************************************
// Data      : 03/07/2006
// Código    : Al_11
// Pendencia : 22781
// Motivo    : Implementação para mostrar o IOF nas operações de Transferência entre Planos (Acréscimo).
//             O valor do IOF sendo deduzido do valor bruto, na coluna de totalização da Aplicação
//******************************************************************************
// Data      : 23/06/2006
// Código    : Al_10
// Pendencia : 22781
// Motivo    : Ajuste na busca da operação de transf. por plano
//******************************************************************************
// Data      : 21/02/2005
// Código    : Al_9
// Pendencia : 22446
// Motivo    : Ajuste no layout da tela. E implementação do fechamento das query´s
//******************************************************************************
// Data     : 16/11/2005
// Linha(s) : Al_8
// Motivo   : Ajuste no controle de abertura de query´s de movimentação.
//            Implementação do botão de Ok para abertura da query de movimentação.
//******************************************************************************
// Data     : 21/10/2005
// Linha(s) : Al_7
// Motivo   : Implementação a coluna Amortização a Receber
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : Al_6
// Motivo   : Retirada as query´s QryTotalMovResg e QryTotalMovApl
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : Al_5
// Motivo   : Implementação do totalizador das oper. de Susbcrição, Integralização e Amortização
//******************************************************************************
// Data     : 17/08/2005
// Linha(s) : Al_4
// Motivo   : Implementação de tratamento de data final qdo menor q data inicial
//******************************************************************************
// Data     : 17/08/2005
// Linha(s) : QryTotalMovResg, QryTotalMovApl
// Motivo   : MELHORA DE PERFOMARCE DAS QUERY´S
//******************************************************************************
// Data     : 12/07/2005
// Código   : AL_3
// Motivo   : Acerto na Busca de Operações de Amortização e melhorias de execução
//******************************************************************************
// Data     : 08/06/2005
// Código   : AL_2
// Motivo   : Melhoria de crítica de datas
//******************************************************************************
// Data     : 10/01/2005
// Código   : AL_1
// Motivo   : Inclusão do Totalisador Outros, na tela e no relatório.
//******************************************************************************
// Data     : 12/07/2004
// Motivo   : Acerto nas query QryFundoInvest. Devido a maximização da hora da datavigencia
//******************************************************************************
unit FConsMovFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, wwdblook,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, DBGrids, TREdit, Db, DBTables, Wwquery, Wwdatsrc, Wwdbigrd,
  Wwdbgrid, uBibliotecaInvest, FPreview, fcLabel;

type
  TfrmConsMovFundos = class(TfrmOkCancelar)
    bt_Imprime: TBitBtn;
    pnlCabecario: TPanel;
    QryFundoInvest: TwwQuery;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestTRGUSERINCLUSAO: TStringField;
    QryFundoInvestMOECODIGO: TFloatField;
    QryFundoInvestIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestCNPJFUNDO: TStringField;
    QryFundoInvestSTAEXCLUSIVO: TStringField;
    QryFundoInvestPZOCARENCIA: TFloatField;
    QryFundoInvestPZOANIVERSARIO: TFloatField;
    QryFundoInvestPZOLIQAPLIC: TFloatField;
    QryFundoInvestPZOLIQRESG: TFloatField;
    QryFundoInvestQTDDECQTD: TFloatField;
    QryFundoInvestQTDDECVALOR: TFloatField;
    QryFundoInvestSTAFUNDO: TStringField;
    QryFundoInvestPZOAMORTIZACAO: TFloatField;
    QryFundoInvestPERCTXPERFORM: TFloatField;
    QryFundoInvestPERCTXADM: TFloatField;
    QryFundoInvestCODFUNCETIP: TStringField;
    QryFundoInvestSTAPROVISIONAIR: TStringField;
    QryFundoInvestSTAPROVISIONAIOF: TStringField;
    QryFundoInvestCONTRCETIP: TStringField;
    dsFundoInvest: TwwDataSource;
    Label1: TLabel;
    DbLkcFundos: TwwDBLookupCombo;
    CbxPlano: TCheckBox;
    DbGMovFdoNormal: TwwDBGrid;
    DbGMovFdoEmol: TwwDBGrid;
    //Al_8
    ToolbarSep972: TToolbarSep97;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Label2: TLabel;
    dtDtaInicio: TCMDateTimePicker;
    Label3: TLabel;
    dtDtaFim: TCMDateTimePicker;
    pnlTotal: TPanel;
    pnlTotResg: TPanel;
    lbResg: TLabel;
    dbQtdResgate: TDBRealEdit;
    dbValorResgate: TDBRealEdit;
    dbValorIr: TDBRealEdit;
    dbValorIOF: TDBRealEdit;
    dbValorLiquido: TDBRealEdit;
    PnlTotSub: TPanel;
    lbSub: TLabel;
    dbQtdSub: TDBRealEdit;
    dbValorSub: TDBRealEdit;
    PnlTotIntegr: TPanel;
    lbintegr: TLabel;
    dbQtdIntegr: TDBRealEdit;
    dbValorIntegr: TDBRealEdit;
    Panel2: TPanel;
    Label4: TLabel;
    dbValorAmortRec: TDBRealEdit;
    PnlTotAmort: TPanel;
    lbAmort: TLabel;
    dbValorAmort: TDBRealEdit;
    PnlTotOutros: TPanel;
    lbOut: TLabel;
    dbOutroIRRF: TDBRealEdit;
    dbOutroIOF: TDBRealEdit;
    dbQtdOutros: TDBRealEdit;
    dbVlrOutros: TDBRealEdit;
    dbVlrLiqOutros: TDBRealEdit;    
    //AL_12   
    dblTipoFundo: TwwDBLookupCombo;
    lblTipoFundo: TLabel;
    dblTipoCota: TwwDBLookupCombo;
    lblTipoCota: TLabel;
    QryTipoFundo: TwwQuery;
    QryTipoCota: TwwQuery;
    //AL_12   
    pnlTotApl: TPanel;
    lbApl: TLabel;
    dbQtdAplicada: TDBRealEdit;
    dbValorAplicado: TDBRealEdit;
    dbValorIrApl: TDBRealEdit;
    dbValorIOFApl: TDBRealEdit;
    dbValorLiqApl: TDBRealEdit;
    Panel1: TPanel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    pnlTotTransfEnt: TPanel;
    LblTransfEnt: TLabel;
    dbQtdEntr: TDBRealEdit;
    dbValorTransfEntr: TDBRealEdit;
    dbVlrfEntrIrrf: TDBRealEdit;
    dbVlrEntrIof: TDBRealEdit;
    dbVlrEntrLiq: TDBRealEdit;
    pnlTotTransfSai: TPanel;
    LblTransfSai: TLabel;
    dbQtdSaida: TDBRealEdit;
    dbValorTransfSai: TDBRealEdit;
    dbVlrfSaiIrrf: TDBRealEdit;
    dbVlrSaiIof: TDBRealEdit;
    dbVlrSaiLiq: TDBRealEdit;
    //AL_15
    dbValorTxIntegr: TDBRealEdit;
    dbValorTxAmort: TDBRealEdit;
    Label6: TLabel;
    dbValorTxApl: TDBRealEdit;
    dbValorTxResg: TDBRealEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_ImprimeClick(Sender: TObject);    
    procedure CbxPlanoClick(Sender: TObject);
    procedure dtDtaInicioEnter(Sender: TObject);    
    procedure FormActivate(Sender: TObject);    
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dtDtaFimExit(Sender: TObject);
    //Al_9
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //AL_12   
    procedure dblTipoFundoExit(Sender: TObject);
    //Al_8 - Fim
  private
    { Private declarations }
    procedure SetaConsulta;
    //Al_9
    procedure FechaQry;
  public
    { Public declarations }
     sFilter : String;
     iTipo   : Integer;
     sDataIni: String;
     sDataFim: String;
     function AbreQry : Boolean;
  end;

var
  frmConsMovFundos: TfrmConsMovFundos;

implementation

uses UmensErro, FCadLancamentoFundo, UDiasUteisInv, FDmRelFundosConsMov, FCadLancFundosEmol,
     FTelaAut, FConsVerificaResgate, FDmRelFundosEmol, UOperComum,  FCadOperFundosDirCred,
  FPrincipal;

{$R *.DFM}

procedure TfrmConsMovFundos.FormShow(Sender: TObject);
Var
   wDia, wMes, wAno : Word;   
begin
   inherited;
   //Al_9
   FechaQry;

   Application.ProcessMessages;

   if ExisteForm(frmCadLancamentoFundo) then
   begin
      iTipo := 0;
      dtDtaInicio.Date := StrToDate(frmCadLancamentoFundo.DtEdDataReferenciaGeral.Text);
      sFilter := '';
   end else
   if ExisteForm(FrmCadLancFundosEmol) then
   begin
      iTipo := 1;
      dtDtaInicio.Date := StrToDate(FrmCadLancFundosEmol.DtEdDataReferenciaGeral.Text);
      sFilter := '(IDTIPOOPERACAO = -56) OR (IDTIPOOPERACAO = -55)';
   end else
   if ExisteForm(frmConsVerificaResgates) then
   begin
      iTipo := 0;
      dtDtaInicio.Date := StrToDate(frmConsVerificaResgates.DtEdDataReferenciaGeral.Text);
      sFilter := '';
   end Else
   if ExisteForm(FrmCadOperFundosDirCred) then
   begin
      iTipo := 0;
      dtDtaInicio.Date := StrToDate(FrmCadOperFundosDirCred.DtEdDataReferenciaGeral.Text);
      sFilter := '';
   end Else
   begin
      iTipo := 0;
      dtDtaInicio.Date := pRPI.DATAULTFECHFDO;
      sFilter := '';
   end;

   //AL_12   
   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

   if QryTipoFundo.RecordCount = 1 then
      dblTipoFundo.Text := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;

   dblTipoFundo.PerformSearch;

   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString  := dtDtaInicio.Text;
   //AL_12   
   if QryTipoFundo.RecordCount = 1 then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   QryFundoInvest.Open;

   //AL_12   
   QryTipoCota.Open;

   if iTipoInvestUsu in [9,10] then
   begin
      lblTipoCota.Visible  := True;
      dblTipoCota.Visible  := True;
   end;

   SetaConsulta;

   dtDtaFim.Date := dtDtaInicio.Date;

   //AL_3
   AbreQry;

end;

procedure TfrmConsMovFundos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   QryTipoCota.Close;
   QryTipoFundo.Close;
   QryFundoInvest.Close;

   //Al_9
   FechaQry;

   if ExisteForm(frmCadLancamentoFundo) then
      frmCadLancamentoFundo.sbtnMovimento.Down   := False
   else
   if ExisteForm(FrmCadLancFundosEmol) then
      FrmCadLancFundosEmol.sbtnMovimento.Down    := False
   else
   if ExisteForm(frmConsVerificaResgates) then
      frmConsVerificaResgates.sbtnMovimento.Down := False
   else
   if ExisteForm(FrmCadOperFundosDirCred) then
      FrmCadOperFundosDirCred.sbtnMovimento.Down := False;
end;

procedure TfrmConsMovFundos.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   if iTipo = 0 then
   begin
      with DmRelFundosConsMov do              
      begin
         //Al_9
         if QryConsMovFundos.IsEmpty then
            exit;

         ppPeriodo.Caption := 'Período de '+DateToStr(dtDtaInicio.Date)+' até '+DateToStr(dtDtaFim.Date);

         if not CbxPlano.Checked then
         begin 
            ghbPlano.Visible    := False;
            LblPlanoMov.Visible := True;
            LblPlanoMov.Caption := 'Plano: ' + sPlanPrevCtbPatro;
         end
         else
         begin
            ghbPlano.Visible    := True;
            LblPlanoMov.Visible := True;
            LblPlanoMov.Caption := 'Todos os Planos';
         end;

         QryConsMovFundos.DisableControls;
         TfrmPreview.CreateModalPreview(Application,
                                        RpConsMovFundos,
                                        RpConsMovFundos.PrinterSetup.DocumentName);
         QryConsMovFundos.EnableControls
      end;
   end
   else
   begin
      with DmRelFundosEmol do
      begin
         //Al_9
         if QryConsFundoEmol.IsEmpty then
            exit;

         ppPeriodoEmol.Caption   := 'Período de '+DateToStr(dtDtaInicio.Date)+' até '+DateToStr(dtDtaFim.Date);
         LblPlanoMovEmol.Caption := sPlanPrevCtbPatro;

         QryConsFundoEmol.DisableControls;
         TfrmPreview.CreateModalPreview(Application,
                                        RpConsFundoEmol,
                                        RpConsFundoEmol.PrinterSetup.DocumentName);
         QryConsFundoEmol.EnableControls;
      end;
   end;
end;

function TfrmConsMovFundos.AbreQry : Boolean;
begin
   Result := True;
   //AL_2 Ini
   //Al_9
   FechaQry;

   If Trim(dtDtaInicio.Text) = '' Then
   Begin
     MsgDlg('Preencha a Data Inicial, está em branco!','Mensagem do Sistema',MtWarning,[MbOk],0);
     if dtDtaInicio.CanFocus then
        dtDtaInicio.SetFocus;
     Result := False;
     Exit;
   End
   else If Trim(dtDtaFim.Text) = '' Then
   Begin
     MsgDlg('Preencha a Data Final, está em branco!','Mensagem do Sistema', MtWarning,[MbOk],0);
     if dtDtaFim.CanFocus then
        dtDtaFim.SetFocus;
     Result := False;
     Exit;
   End
   else if dtDtaFim.Date < dtDtaInicio.Date Then
   Begin
     MsgDlg('A Data Final não pode ser menor que a Data Incicial !','Mensagem do Sistema',MtWarning,[MbOk],0);
     dtDtaFim.Text := dtDtaInicio.Text;
     if dtDtaFim.CanFocus then
        dtDtaFim.SetFocus;
     Result := False;
     Exit;
   End;
   //AL_2 Fim

   //AL_12   
   If iTipo = 0 Then
   Begin
      With DmRelFundosConsMov Do
      Begin
         QryConsMovFundos.Filtered := False;
         QryConsMovFundos.Filter   := '';
         OperComum.LimpaParametros(QryConsMovFundos);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryConsMovFundos.ParamByName('IDFUNDOINVEST').AsInteger  :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryConsMovFundos.ParamByName('DATAMOVFUNDOINICIO').AsString := dtDtaInicio.Text;
         QryConsMovFundos.ParamByName('DATAMOVFUNDOFIM').AsString    := dtDtaFim.Text;
         QryConsMovFundos.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryConsMovFundos.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryConsMovFundos.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryConsMovFundos.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryConsMovFundos.Open;
         QryConsMovFundos.Filter   := sFilter;
         QryConsMovFundos.Filtered := True;

         If CbxPlano.Checked then
            QryConsMovFundosPLANPRVCONTABPATRO.Visible := True
         else
            QryConsMovFundosPLANPRVCONTABPATRO.Visible := False;

         if iTipoInvestUsu in [9,10] then
            QryConsMovFundosDESCTIPOCOTA.Visible := True
         else
            QryConsMovFundosDESCTIPOCOTA.Visible := False;

         qryObservacoes.Filtered := False;
         qryObservacoes.Filter   := '';
         OperComum.LimpaParametros(qryObservacoes);
         If Trim(DbLkcFundos.Text) <> '' Then
            qryObservacoes.ParamByName('IDFUNDOINVEST').AsInteger    :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         qryObservacoes.ParamByName('DATAMOVFUNDOINICIO').AsString := dtDtaInicio.Text;
         qryObservacoes.ParamByName('DATAMOVFUNDOFIM').AsString    := dtDtaFim.Text;
         qryObservacoes.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

         If not CbxPlano.Checked then
            qryObservacoes.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            qryObservacoes.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            qryObservacoes.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         qryObservacoes.Open;
         qryObservacoes.Filter   := sFilter;
         qryObservacoes.Filtered := True;

         // AL_1
         OperComum.LimpaParametros(QryTotalMovOutro);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotalMovOutro.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotalMovOutro.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotalMovOutro.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotalMovOutro.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryTotalMovOutro.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotalMovOutro.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotalMovOutro.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryTotalMovOutro.Open;

         OperComum.LimpaParametros(QryTotSub);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotSub.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotSub.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotSub.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotSub.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryTotSub.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         
         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotSub.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotSub.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryTotSub.Open;

         OperComum.LimpaParametros(QryTotIntegr);
         //AL_14
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotIntegr.ParamByName('IDFUNDOINVEST').AsInteger     := QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotIntegr.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotIntegr.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotIntegr.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryTotIntegr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotIntegr.ParamByName('IDTIPOCOTA').AsInteger        := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotIntegr.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);

         QryTotIntegr.Open;

         OperComum.LimpaParametros(QryTotApl);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotApl.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotApl.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotApl.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotApl.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If Not CbxPlano.Checked then
            QryTotApl.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotApl.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotApl.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryTotApl.Open;

         OperComum.LimpaParametros(QryTotResg);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotResg.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotResg.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotResg.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotResg.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryTotResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotResg.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotResg.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryTotResg.Open;

         OperComum.LimpaParametros(QryTotAmort);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotAmort.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotAmort.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotAmort.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotAmort.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryTotAmort.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotAmort.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotAmort.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryTotAmort.Open;

         OperComum.LimpaParametros(QryTotAmortRec);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotAmortRec.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotAmortRec.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotAmortRec.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotAmortRec.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         If not CbxPlano.Checked then
            QryTotAmortRec.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotAmortRec.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryTotAmortRec.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);

         QryTotAmortRec.Open;

         //Al_13
         OperComum.LimpaParametros(QryTotTransfEntr);
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotTransfEntr.ParamByName('IDFUNDOINVEST').AsInteger   :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger
         Else
            QryTotTransfEntr.ParamByName('IDFUNDOINVEST').Clear;

         QryTotTransfEntr.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotTransfEntr.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotTransfEntr.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         //AL_14
         If not CbxPlano.Checked then
            QryTotTransfEntr.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         //AL_14
         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotTransfEntr.ParamByName('IDTIPOCOTA').AsInteger        := StrToInt(dblTipoCota.LookupValue);

         //AL_14
         If (dblTipoFundo.Text <> '') then
            QryTotTransfEntr.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);

         QryTotTransfEntr.Open;

         OperComum.LimpaParametros(QryTotTransfSaida);
         //AL_14
         If Trim(DbLkcFundos.Text) <> '' Then
            QryTotTransfSaida.ParamByName('IDFUNDOINVEST').AsInteger   := QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryTotTransfSaida.ParamByName('DATAMOVFUNDOINICIO').AsString    := dtDtaInicio.Text;
         QryTotTransfSaida.ParamByName('DATAMOVFUNDOFIM').AsString       := dtDtaFim.Text;
         QryTotTransfSaida.ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;

         //AL_14
         If not CbxPlano.Checked then
            QryTotTransfSaida.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         //AL_14
         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryTotTransfSaida.ParamByName('IDTIPOCOTA').AsInteger        := StrToInt(dblTipoCota.LookupValue);

         //AL_14
         If (dblTipoFundo.Text <> '') then
            QryTotTransfSaida.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);

         QryTotTransfSaida.Open;
      End;
   End
   Else
   Begin
      With DmRelFundosEmol Do
      Begin
         DbGMovFdoEmol.DataSource := DmRelFundosEmol.DsConsFundoEmol;
         QryConsFundoEmol.Filter   := '';
         QryConsFundoEmol.Filtered := False;
         OperComum.LimpaParametros(QryConsFundoEmol);
         If Trim(DbLkcFundos.Text) <> '' Then                
            QryConsFundoEmol.ParamByName('IDFUNDOINVEST').AsInteger    :=
                                           QryFundoInvestIDFUNDOINVEST.AsInteger;

         QryConsFundoEmol.ParamByName('DATAMOVFUNDOINICIO').AsDateTime := dtDtaInicio.Date;
         QryConsFundoEmol.ParamByName('DATAMOVFUNDOFIM').AsDateTime    := dtDtaFim.Date;
         QryConsFundoEmol.ParamByName('IDTIPOINVEST').AsInteger        := iTipoInvestUsu;

         If not CbxPlano.Checked then
         QryConsFundoEmol.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;

         If ((dblTipoCota.Visible) and (dblTipoCota.Text <> '')) then
            QryConsFundoEmol.ParamByName('IDTIPOCOTA').AsInteger   := StrToInt(dblTipoCota.LookupValue);

         If (dblTipoFundo.Text <> '') then
            QryConsFundoEmol.ParamByName('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(dblTipoFundo.LookupValue);            

         QryConsFundoEmol.Open;
         QryConsFundoEmol.Filter   := sFilter;
         QryConsFundoEmol.Filtered := True;

         If CbxPlano.Checked then
            QryConsFundoEmolPLANPRVCONTABPATRO.Visible := True
         Else
            QryConsFundoEmolPLANPRVCONTABPATRO.Visible := False;
      End;
   End;
   //AL_12 - FIM  
end;

//Al_8

procedure TfrmConsMovFundos.CbxPlanoClick(Sender: TObject);
begin
   inherited;
   AbreQry;
end;

procedure TfrmConsMovFundos.dtDtaInicioEnter(Sender: TObject);
begin
   inherited;
   sDataIni := Trim(dtDtaInicio.Text);
end;

//Al_8

procedure TfrmConsMovFundos.SetaConsulta;
begin
   if iTipo = 0 then
   begin
      DbGMovFdoNormal.Visible   := True;
      DbGMovFdoEmol.Visible     := False;
      DbGMovFdoEmol.SendToBack;
      pnlTotApl.Visible         := True;
      pnlTotResg.Visible        := True;
   end
   else
   begin
      DbGMovFdoEmol.Visible     := True;
      DbGMovFdoNormal.Visible   := False;
      DbGMovFdoNormal.SendToBack;
      pnlTotApl.Visible         := False;
      pnlTotResg.Visible        := False;
   end;
end;

//Al_8

procedure TfrmConsMovFundos.FormActivate(Sender: TObject);
begin
  inherited;
   if ExisteForm(frmCadLancamentoFundo)        then
   else if ExisteForm(FrmCadLancFundosEmol)    then
   else if ExisteForm(frmConsVerificaResgates) then
   else if ExisteForm(FrmCadOperFundosDirCred) then
   else
      PnlFundo.Enabled := True;
end;

//Al_8
procedure TfrmConsMovFundos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   AbreQry;
end;

procedure TfrmConsMovFundos.dtDtaFimExit(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(QryFundoInvest);
  QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
  if Trim(dtDtaFim.Text) <> '' then
     QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString := dtDtaFim.Text
  else if Trim(dtDtaInicio.Text) <> '' then
     QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString := dtDtaInicio.Text
  else
     QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString := DateToStr(Date);
  QryFundoInvest.Open;
end;

//Al_9
procedure TfrmConsMovFundos.FechaQry;
begin

   OperComum.LimpaParametros(DmRelFundosEmol.QryConsFundoEmol);

   with DmRelFundosConsMov do
   begin
      OperComum.LimpaParametros(QryConsMovFundos);
      OperComum.LimpaParametros(QryObservacoes);
      OperComum.LimpaParametros(QryTotalMovOutro);
      OperComum.LimpaParametros(QryTotSub);
      OperComum.LimpaParametros(QryTotIntegr);
      OperComum.LimpaParametros(QryTotApl);
      OperComum.LimpaParametros(QryTotAmort);
      OperComum.LimpaParametros(QryTotResg);
      OperComum.LimpaParametros(QryTotAmortRec);
      //Al_13
      OperComum.LimpaParametros(QryTotTransfEntr);
      OperComum.LimpaParametros(QryTotTransfSaida);
   end;

   dbQtdAplicada.Clear;
   dbValorAplicado.Clear;
   dbQtdResgate.Clear;
   dbValorResgate.Clear;
   dbValorIr.Clear;
   dbValorIOF.Clear;
   dbValorLiquido.Clear;
   dbQtdOutros.Clear;
   dbVlrOutros.Clear;
   dbOutroIRRF.Clear;
   dbOutroIOF.Clear;
   dbVlrLiqOutros.Clear;

   dbQtdSub.Clear;
   dbValorSub.Clear;
   dbQtdIntegr.Clear;
   dbValorIntegr.Clear;
   dbValorAmort.Clear;
   //Al_7
   dbValorAmortRec.Clear;

   //AL_13
   dbValorLiqApl.Clear;
   dbQtdEntr.Clear;
   dbValorTransfEntr.Clear;
   dbVlrfEntrIrrf.Clear;
   dbVlrEntrIof.Clear;
   dbVlrEntrLiq.Clear;
   dbQtdSaida.Clear;
   dbValorTransfSai.Clear;
   dbVlrfSaiIrrf.Clear;
   dbVlrSaiIof.Clear;
   dbVlrSaiLiq.Clear;
end;   

//Al_9
procedure TfrmConsMovFundos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  
   FechaQry;

   If iTipo = 0 Then
   begin
      with DmRelFundosConsMov do
      begin
         QryConsMovFundos.Open;
         If CbxPlano.Checked then
            QryConsMovFundosPLANPRVCONTABPATRO.Visible := True
         else
            QryConsMovFundosPLANPRVCONTABPATRO.Visible := False;
      end;      
   end
   else
      DmRelFundosEmol.QryConsFundoEmol.Open;
end;

//Al_9 
procedure TfrmConsMovFundos.FormCreate(Sender: TObject);
begin
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

  inherited;
 
end;

//AL_12   
procedure TfrmConsMovFundos.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString  := dtDtaInicio.Text;
   if (Trim(dblTipoFundo.Text) <> '') then
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoInvest.Open;
end;

end.
