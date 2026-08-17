//******************************************************************************
// Data      : 16/05/2008
// Código    : AL_14
// Desc      : Implementação para identificar a boleta e gravar o histórico com a mesma.
//             Quando a operação era diferente da reversão, o histórico não era carimbado
//             com a boleta em questão.  
//******************************************************************************
// Data      : 02/10/2007
// Código    : AL_13
// Pendencia : 26386
// Desc      : Atulizando a chamada CtrlInvContab.BuscaPadrLanc.Executa
//             incluindo o Plano/Patro
//******************************************************************************
// Data      : 04/05/2007
// Código    : AL_12
// Pendencia : 24774
// SOL       : 5877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 29/01/2007
// Código    : AL_11
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//             Migrada a parte contabil com resalvas: Não existe segregação de planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_10
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_9
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_8
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_7
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_6
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_5
// Motivo   : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_4
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data	    : 29/06/2004
// LINHA(S) : AL_3
// Motivo(S): Implemnetada a reversão de opções
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_2
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 16/06/2004
// Origem   : Funcef
// Código   : AL_1
// Motivo   : Alteracao na BuscaTodososSaldosInvestLote quando for Reversao
//********************************************************************************************************
unit FFechaBoletaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, FPreview,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBTables, Wwquery,
  Wwdatsrc, Menus, faMensagem, uRegra, uCtrlInvContab;

type
  TfrmFechaBoletaOpcInd = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    dblCorretora: TwwDBLookupCombo;
    Label1: TLabel;
    dbeLote: TDBEdit;
    Label4: TLabel;
    dbDataLiquidacao: TCMDateTimePicker;
    Label3: TLabel;
    lblBoletaAF: TLabel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblTotalDespesas: TLabel;
    lblTotalLiquido: TLabel;
    PnlTotLiquido: TPanel;
    PnlTotalDespesas: TPanel;
    Panel7: TPanel;
    QryCorretValores: TwwQuery;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    dsCorretValores: TwwDataSource;
    Panel10: TPanel;
    pnlOperacoes: TPanel;
    lblPremio: TLabel;
    lblQuantidade: TLabel;
    lblOperacao: TLabel;
    lblOpcao: TLabel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    dbePremio: TDBEdit;
    dbeQuantidade: TDBEdit;
    dbeOperacao: TDBEdit;
    dbeOpcao: TDBEdit;
    dbgrOperacoes: TDBGrid;
    PopOperacao: TPopupMenu;
    mnuAlterarOperOpcInd: TMenuItem;
    dbeValor: TDBEdit;
    lblValor: TLabel;
    lblPrecoEx: TLabel;
    dbePrecoEx: TDBEdit;
    dbeVencimento: TDBEdit;
    lblVencimento: TLabel;
    PopDespesa: TPopupMenu;
    mnuPopDespAlterar: TMenuItem;
    pnlDespOpcInd: TPanel;
    lblVlrDesp: TLabel;
    lblDespesa: TLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnOkDesp: TBitBtn;
    bbtnCancDesp: TBitBtn;
    bbtnVoltarDesp: TBitBtn;
    dbeVlrDesp: TDBEdit;
    dbeTipoDesp: TDBEdit;
    BitBtn1: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    dbgDespOpcInd: TDBGrid;
    Panel8: TPanel;
    fraMsg: TfraMensagem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure dblCorretoraExit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure dbgrOperacoesDblClick(Sender: TObject);
    procedure mnuAlterarOperOpcIndClick(Sender: TObject);
    procedure dbgDespOpcIndDblClick(Sender: TObject);
    procedure mnuPopDespAlterarClick(Sender: TObject);
    procedure bbtnOkDespClick(Sender: TObject);
    procedure bbtnCancDespClick(Sender: TObject);
    procedure bbtnVoltarDespClick(Sender: TObject);
    procedure dsBuscaBoletaOperStateChange(Sender: TObject);
    procedure dsBuscaOperacoesStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MontaDadosBoleta(iIdBoleta:String):boolean;
    procedure AlteraValorDespesa;
    procedure AlteraValorOrdem;
    procedure AbreBoleta;
    procedure BoletaFechada;
    procedure BoletaAberta;
  end;

var
  frmFechaBoletaOpcInd: TfrmFechaBoletaOpcInd;
  fTotalLiquido,fDespesaAnt,fValorAnt : Double;

implementation

{$R *.DFM}

uses
   UBibliotecaInvest,UMensErro,DBaseDados,UDataBase,uOperComum,uSistema,uDiasUteisInv,
   dOpcoesIndice,UOpcaoIndice, dOperComum, FDmRelConsBoletaOpcInd, dOpcoes,
  URendaVariavel;

procedure TfrmFechaBoletaOpcInd.FormCreate(Sender: TObject);
begin
  inherited;
   WindowState := wsMaximized;
end;

procedure TfrmFechaBoletaOpcInd.FormShow(Sender: TObject);
begin
  inherited;
   pnlDespOpcInd.SendToBack;
   pnlOperacoes.SendToBack;
   dbDtaOperacao.Text := DateToStr(DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False));
   if dbDtaOperacao.CanFocus then
      dbDtaOperacao.SetFocus;
   fraMsg.Width := TB97oKCancelar.Left;
   fraMsg.Apaga;
end;

procedure TfrmFechaBoletaOpcInd.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
  
   OperComum.LimpaParametros(QryCorretValores);
   QryCorretValores.ParamByName('DATAORDEM').AsString := dbDtaOperacao.Text;
   QryCorretValores.Open;

   If QryCorretValores.RecordCount = 1 Then
   begin
      dblCorretora.Text := QryCorretValoresSGLCORRETVALORES.AsString;
      dblCorretoraExit(Sender);
   end;
   AbreBoleta;
end;

procedure TfrmFechaBoletaOpcInd.dblCorretoraExit(Sender: TObject);
begin
  inherited;
  AbreBoleta;
end;

procedure TfrmFechaBoletaOpcInd.BoletaFechada;
begin
   lblBoletaAF.Caption   := 'Boleta Fechada';
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmFechaBoletaOpcInd.BoletaAberta;
begin
   lblBoletaAF.Caption   := 'Boleta Aberta';
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmFechaBoletaOpcInd.AbreBoleta;
begin
   OperComum.LimpaParametros(DMOpcoesIndice.qryBuscaOperacoes);
   if Trim(dblCorretora.Text) <> '' then
      DMOpcoesIndice.qryBuscaOperacoes.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValoresIDCORRETVALORES.AsInteger;
   if Trim(dbDtaOperacao.Text) <> '' then
      DMOpcoesIndice.qryBuscaOperacoes.ParamByName('DATAORDEM').AsString        := dbDtaOperacao.Text;
   DMOpcoesIndice.qryBuscaOperacoes.Open;

   if not DMOpcoesIndice.qryBuscaOperacoes.IsEmpty then
   begin
      if DMOpcoesIndice.qryBuscaOperacoes.FieldByName('STATUS').AsString <> 'F' then
         BoletaAberta
      else
         BoletaFechada;

      // Data de Liquidação
      dbDataLiquidacao.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(dbDtaOperacao.Date,-1,1,'',True,False,False);

      // Monta Tabela de Despesas
      if not MontaDadosBoleta(DMOpcoesIndice.qryBuscaOperacoes.FieldByName('IDBOLETA').AsString) then
      begin
         DMOpcoesIndice.qryBuscaOperacoes.Close;
         DMOpcoesIndice.qryBuscaBoletaOper.Close;
      end;
   end
   else
      DMOpcoesIndice.qryBuscaOperacoes.Close;
end;

procedure TfrmFechaBoletaOpcInd.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
   SelectNext(ActiveControl,True,True);
   if DMOpcoesIndice.dsBuscaOperacoes.DataSet.State in [dsEdit] then
   begin
      DMOpcoesIndice.qryBuscaOperacoes.Post;
      DMOpcoesIndice.qryBuscaOperacoes.ApplyUpdates;

      AbreBoleta;
   end;
   pnlOperacoes.SendToBack;
end;

procedure TfrmFechaBoletaOpcInd.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaOperacoes.UpdatesPending then
   begin
      DMOpcoesIndice.qryBuscaOperacoes.Cancel;
      DMOpcoesIndice.qryBuscaOperacoes.CancelUpdates;
   end;
   pnlOperacoes.SendToBack;
end;

procedure TfrmFechaBoletaOpcInd.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaOperacoes.UpdatesPending then
   begin
      DMOpcoesIndice.qryBuscaOperacoes.Cancel;
      DMOpcoesIndice.qryBuscaOperacoes.CancelUpdates;
   end;
   pnlOperacoes.SendToBack;
end;

procedure TfrmFechaBoletaOpcInd.dbgrOperacoesDblClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaOperacoes.FieldByName('STATUS').AsString <> 'F' then
      AlteraValorOrdem;
end;

procedure TfrmFechaBoletaOpcInd.mnuAlterarOperOpcIndClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaOperacoes.FieldByName('STATUS').AsString <> 'F' then
      AlteraValorOrdem;
end;

procedure TfrmFechaBoletaOpcInd.AlteraValorOrdem;
begin
   fValorAnt := DMOpcoesIndice.qryBuscaOperacoesVALOR.AsFloat;
   pnlOperacoes.BringToFront;
   if not DtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.StartTransaction;

   DMOpcoesIndice.qryBuscaOperacoes.Edit;
end;

function TfrmFechaBoletaOpcInd.MontaDadosBoleta(iIdBoleta:String):boolean;
begin
   Result := True;
   OperComum.LimpaParametros(DMOpcoesIndice.qryBuscaBoletaOper);
   DMOpcoesIndice.qryBuscaBoletaOper.ParamByName('IDBOLETA').AsString := iIdBoleta;
   DMOpcoesIndice.qryBuscaBoletaOper.Open;
   if (DMOpcoesIndice.qryBuscaBoletaOper.IsEmpty) and (Trim(iIdBoleta) <> '') then // Grava um Registro em Branco
   begin
      Try
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if not OpcaoIndice.GravaDespOpcInd(LeUltRegistro(nil, 'DESPOPEROPCINC'),
                                     -1,-28,-1,-1,
                                      iIdBoleta,0) then
            Abort;

         DtmBaseDados.dbBaseDados.Commit;

         OperComum.LimpaParametros(DMOpcoesIndice.qryBuscaBoletaOper);
         DMOpcoesIndice.qryBuscaBoletaOper.ParamByName('IDBOLETA').AsString := iIdBoleta;
         DMOpcoesIndice.qryBuscaBoletaOper.Open;

      Except;
         If dtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.Rollback;
         Result := False;
      end;
   end;
   PnlTotalDespesas.Caption := FormatFloat('###,###,###,##0.00',Abs(DMOpcoesIndice.qryBuscaBoletaOperVLRDESPESA.AsFloat))+' ';
   fTotalLiquido            := DMOpcoesIndice.qryBuscaOperacoesTOTALORDEM.AsFloat - DMOpcoesIndice.qryBuscaBoletaOperVLRDESPESA.AsFloat;
   PnlTotLiquido.Caption    := FormatFloat('###,###,###,##0.00',fTotalLiquido)+' ';
   if fTotalLiquido > 0 then
      lblTotalLiquido.Caption := 'Total Líquido à Receber'
   else if fTotalLiquido < 0 then
      lblTotalLiquido.Caption := 'Total Líquido à Pagar'
   else
      lblTotalLiquido.Caption := 'Total Líquido';
end;


procedure TfrmFechaBoletaOpcInd.dbgDespOpcIndDblClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaOperacoes.FieldByName('STATUS').AsString <> 'F' then
      AlteraValorDespesa;
end;

procedure TfrmFechaBoletaOpcInd.mnuPopDespAlterarClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaOperacoes.FieldByName('STATUS').AsString <> 'F' then
      AlteraValorDespesa;
end;


procedure TfrmFechaBoletaOpcInd.bbtnCancDespClick(Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.qryBuscaBoletaOper.UpdatesPending then
   begin
      DMOpcoesIndice.qryBuscaBoletaOper.Cancel;
      DMOpcoesIndice.qryBuscaBoletaOper.CancelUpdates;
   end;
   pnlDespOpcInd.SendToBack;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;

procedure TfrmFechaBoletaOpcInd.bbtnVoltarDespClick(Sender: TObject);
begin
  inherited;
   DMOpcoesIndice.qryBuscaBoletaOper.Cancel;
   DMOpcoesIndice.qryBuscaBoletaOper.CancelUpdates;
   pnlDespOpcInd.SendToBack;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;

procedure TfrmFechaBoletaOpcInd.AlteraValorDespesa;
begin
   fDespesaAnt := DMOpcoesIndice.qryBuscaBoletaOperVLRDESPESA.AsFloat;
   pnlDespOpcInd.BringToFront;

   if not DtmBaseDados.dbBaseDados.InTransaction then
   DtmBaseDados.dbBaseDados.StartTransaction;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;

   DMOpcoesIndice.qryBuscaBoletaOper.Edit;
end;

procedure TfrmFechaBoletaOpcInd.bbtnOkDespClick(Sender: TObject);
begin
  inherited;
   SelectNext(ActiveControl,True,True);
   if DMOpcoesIndice.dsBuscaBoletaOper.DataSet.State in [dsEdit] then
   begin
      DMOpcoesIndice.qryBuscaBoletaOper.Post;
      DMOpcoesIndice.qryBuscaBoletaOper.ApplyUpdates;

      PnlTotalDespesas.Caption := FormatFloat('###,###,###,##0.00',Abs(DMOpcoesIndice.qryBuscaBoletaOperVLRDESPESA.AsFloat))+' ';
      fTotalLiquido            := DMOpcoesIndice.qryBuscaOperacoesTOTALORDEM.AsFloat - DMOpcoesIndice.qryBuscaBoletaOperVLRDESPESA.AsFloat;
      PnlTotLiquido.Caption    := FormatFloat('###,###,###,##0.00',fTotalLiquido)+' ';
   end;
   pnlDespOpcInd.SendToBack;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;

procedure TfrmFechaBoletaOpcInd.dsBuscaBoletaOperStateChange(
  Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.dsBuscaBoletaOper.DataSet.State in [dsEdit] then
   begin
      bbtnOkDesp.Default    := True;
      bbtnOkDet.Default     := False;
      bbtnConfirmar.Default := False;
   end
   else
      bbtnConfirmar.Default := True;
end;

procedure TfrmFechaBoletaOpcInd.dsBuscaOperacoesStateChange(
  Sender: TObject);
begin
  inherited;
   if DMOpcoesIndice.dsBuscaOperacoes.DataSet.State in [dsEdit] then
   begin
      bbtnOkDet.Default     := True;
      bbtnOkDesp.Default    := False;
      bbtnConfirmar.Default := False;
   end
   else
      bbtnConfirmar.Default := True;
end;

procedure TfrmFechaBoletaOpcInd.bbtnConfirmarClick(Sender: TObject);
var
// AL_11
   iIdHistOpcInd,iIdOperOpcInd, iPlano, iPlanilha,iDocumento,iTipoOperacao,iIdHistCartInvDest,iCesta: Integer;
   fValor,fQtd,fSldValor,fSldQtd,wSaldoInutil,fSaldoLiberado,fSaldoBloqueado : Double;
   //AL_14
   sBoletaOrig, sHistorico, sBoletaTRC : String;
   bReversao,iAchouPadrao : Boolean;
   iPosBoleta: integer;
   iCarteiraOrig,iCarteiraDest,iMotBloqOrig,iMotBloqDest,iMercadoOrig,iMercadoDest : Integer;
   fVlrCompra,fVlrVencto,fVlrCesta,fVlrAtual,fVlrMercado,fVlrAjusteDia,fVlrAjusteCesta : Double;
   RegraFBolOpcInd: TRegra;
begin
   inherited;

   // AL_6
   if RendaVariavel.VerEmAbertura then
      Exit;

   //AL_10
   if not CtrlInvContab.TestaPeriodo(DateToStr(DMOpcoesIndice.qryBuscaOperacoesDATAORDEM.AsDateTime), 2, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
      Exit;
   end;

   try
      try

         if (Trim(dblCorretora.Text) = '') then
         begin
            MsgDlg('Selecione a Corretora.','Mensagem do Sistema', MtWarning,[MbOk],0);
            If dblCorretora.CanFocus Then
               dblCorretora.SetFocus;
            Exit;
         end;

         if not DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.StartTransaction;

         RegraFBolOpcInd              := TRegra.Create(Application);
         RegraFBolOpcInd.DatabaseName := 'BaseDados';
         RegraFBolOpcInd.TipoCliente  := tcFundacao;

         iPlano     := -1;
         iPlanilha  := -1;
         iDocumento := -1;

         with DMOpcoesIndice, DMOpcoesIndice.qryBuscaOperacoes do
         begin
            First;
            fraMsg.Mostra;
            fraMsg.Max := RecordCount;
            fraMsg.Pos := 0;
            while not EOF do
            begin
               //AL_3 - 29/06/2004
               fQtd      := qryBuscaOperacoesQUANTIDADE.AsFloat;
               fSldQtd   := fQtd;
               fValor    := fQtd * qryBuscaOperacoesVLRPONTO.AsFloat * qryBuscaOperacoesVLRSTRIKEPUT.AsFloat;
               fSldValor := fValor;

               // Verifica sé é Reversão
               fraMsg.Mes := 'Verificando se é Reversão';
               bReversao  := False;
               OpcaoIndice.BuscaSaldoOpcInd(qryBuscaOperacoesDATAORDEM.AsDateTime,
                                            '','',
                                            qryBuscaOperacoesIDINVESTIMENTO.AsInteger);

               If ((qryBuscaOperacoesIDTIPOOPERACAO.AsInteger*-1) In [90,89,85,84]) Then
               begin
                  fValor    := fValor * -1;
                  fQtd      := fQtd * -1;
                  fSldValor := qryBuscaSaldoHistOpcIndSLDVLRHISTOPCIND.AsFloat + fValor;
                  fSldQtd   := qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsFloat + fQtd;
                  bReversao := True;
               end;

               fraMsg.Mes := 'Gravando Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;

               //Grava OperacaoOpcInd
               iIdOperOpcInd := LeUltRegistro(nil, 'OPERACAOOPCINC');
               if not OpcaoIndice.GravaOperOpcInd(iIdOperOpcInd,
                                                  qryBuscaOperacoesIDINVESTIMENTO.AsInteger,
                                                  qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                  qryBuscaOperacoesIDTIPOOPERACAO.AsInteger,
                                                  qryBuscaOperacoesIDTIPOINVEST.AsInteger,
                                                  qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                  qryBuscaOperacoesIDCARTEIRAGERENC.AsInteger,
                                                  qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                  qryBuscaOperacoesIDLOTE.AsString,
                                                  qryBuscaOperacoesIDBOLETA.AsString,
                                                  qryBuscaOperacoesDATAORDEM.AsDateTime,
                                                  qryBuscaOperacoesQUANTIDADE.AsFloat,
                                                  qryBuscaOperacoesPREMIO.AsFloat,
                                                  qryBuscaOperacoesVALOR.AsFloat) then
                  Raise Exception.Create('Erro na Gravação da Operação de Opções');

               sHistorico := OpcaoIndice.MontaHistorico(qryBuscaOperacoesNATUREZAOPERACAO.AsString,
                                                        qryBuscaOperacoesDESCTIPOOPERACAO.AsString,
                                                        qryBuscaOperacoesDESCINVESTIMENTO.AsString);

               //Grava HistOpcInd
               //AL_14
               sBoletaOrig := qryBuscaSaldoHistOpcIndIDBOLETA.AsString;
               if Trim(sBoletaOrig) = '' then
                  sBoletaOrig := qryBuscaOperacoesIDBOLETA.AsString;
                  
               fraMsg.Mes  := 'Gravando Histórico da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
               iIdHistOpcInd := LeUltRegistro(nil, 'HISTOPCIND');
               if not OpcaoIndice.GravaHistOpcInd(iIdHistOpcInd,
                                                  iIdOperOpcInd,
                                                  qryBuscaOperacoesIDINVESTIMENTO.AsInteger,
                                                  qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                  qryBuscaOperacoesIDTIPOOPERACAO.AsInteger,
                                                  qryBuscaOperacoesIDTIPOINVEST.AsInteger,
                                                  qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                  qryBuscaOperacoesIDCARTEIRAGERENC.AsInteger,
                                                  -1,
                                                  qryBuscaOperacoesIDLOTE.AsString,
                                                  //AL_14
                                                  sBoletaOrig{Boleta original para manter o saldo na buscasaldo},
                                                  sHistorico,
                                                  'OPE',
                                                  '',
                                                  qryBuscaOperacoesDATAORDEM.AsDateTime,
                                                  fValor,
                                                  fSldValor,
                                                  fQtd,
                                                  fSldQtd) then
                  Raise Exception.Create('Erro na Gravação do Histórico da Operação de Opções');

               // Monta query de entrada para a regra de Valor de Mercado
               qryAux.SQL.Clear;
               qryAux.SQL.Add('SELECT ');
               qryAux.SQL.Add( 'TO_DATE(' + QuotedStr(qryBuscaOperacoesDATAORDEM.AsString) + ',''DD/MM/YYYY'') AS DATAATUAL, ');
               qryAux.SQL.Add( FloatToStr(fSldQtd) + ' AS QUANTIDADE, ');
               qryAux.SQL.Add( qryBuscaOperacoesVLRPONTO.AsString + ' AS VLRPONTO, ');
               qryAux.SQL.Add('-1 AS IDCIDADES, ');
               qryAux.SQL.Add(' 1 AS IDPAIS, ');
               qryAux.SQL.Add(''' '' AS CODESTADO');
               qryAux.SQL.Add('FROM DUAL ');
               qryAux.Open;

               // Busca o ID da Regra no cadastro do Item
               OperComum.LimpaParametros(qryItensOpcInd);
               qryItensOpcInd.ParamByName('IDITEMOPCIND').AsInteger := -6;
               qryItensOpcInd.Open;

               RegraFBolOpcInd.RuleName := qryItensOpcIndIDREGRA.AsString;
               RegraFBolOpcInd.QueryIn  := qryAux;
               try
                  RegraFBolOpcInd.Execute;
               except
                  on E:Exception do
                  begin
                     MsgDlg('Erro ao calcular a Regra de Valor de Mercado.' + #13 +
                            'Regra: ' + DMOpcoesIndice.qryItensOpcIndIDREGRA.AsString + #13 +
                            'Mensagem: ' + E.Message,
                            'Mensagem do Sistema', MtError,[MbOk],0);
                     Exit;
                  end;
               end;

               fraMsg.Mes := 'Gravando Itens de Histórico da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
               fVlrCompra      := fQtd * qryBuscaOperacoesVLRPONTO.AsFloat * qryBuscaOperacoesVLRSTRIKEPUT.AsFloat;
               fVlrVencto      := fQtd * qryBuscaOperacoesVLRPONTO.AsFloat * qryBuscaOperacoesVLRPRECOEX.AsFloat;
               fVlrCesta       := OpcaoIndice.BuscaValorCesta(qryBuscaOperacoesIDCESTAOPCIND.AsInteger,qryBuscaOperacoesDATAORDEM.AsDateTime);
               fVlrAtual       := fVlrCompra;
               fVlrMercado     := StrToFloat(TrocaPontoVirgula(RegraFBolOpcInd.Result));
               fVlrAjusteDia   := 0;
               fVlrAjusteCesta := 0;

               // Gravar os Itens
               if not OpcaoIndice.GravaItensHistOpcInd(iIdHistOpcInd,
                                                       fQtd,fSldQtd,
                                                       fVlrCompra,fVlrCompra,
                                                       fVlrVencto,fVlrVencto,
                                                       fVlrCesta,fVlrCesta,
                                                       fVlrAtual,fVlrAtual,
                                                       fVlrMercado,fVlrMercado,
                                                       fVlrAjusteDia,fVlrAjusteDia,
                                                       fVlrAjusteCesta, fVlrAjusteCesta) then
                  Raise Exception.Create('Erro na Gravação dos Items do Histórico da Operação de Opções');

               // Grava a Boleta
               if qryBuscaOperacoesIDBOLETA.AsString <> '' then
               begin
                  // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
                  OperComum.LimpaParametros(dtmOperComum.QryBoleta);
                  dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := qryBuscaOperacoesIDBOLETA.AsString;
                  dtmOperComum.QryBoleta.Open;
                  // Caso não tenha, cria um registro
                  if dtmOperComum.QryBoleta.IsEmpty then
                  begin
                     fraMsg.Mes := 'Gravando a Boleta ' + qryBuscaOperacoesIDBOLETA.AsString;
                     if not OpcaoIndice.GravaBoletaOpcInd(qryBuscaOperacoesIDBOLETA.AsString,
                                                          'F',
                                                          qryBuscaOperacoesDATAORDEM.AsDateTime,
                                                          qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                          iPlano, iPlanilha,iDocumento,'OPE') then
                        Raise Exception.Create('Erro na Gravação da Boleta da Operação de Opções');
                  end;
               end;

               // Contabiliza a Operação

               //AL_13
               //AL_12
               if CtrlInvContab.IntegraCtbFinModulo(8) then
               begin
                  //AL_13
                  //AL_11
                  if CtrlInvContab.BuscaPadrLanc.Executa( -1, //OperComum.RetornaSegmentacaoRV(qryBuscaOperacoesIDINVESTIMENTO.AsInteger),  //Renan CGPC
                                                         0,2, qryBuscaOperacoesIDTIPOOPERACAO.AsInteger,
                                                         0, -1, qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                         qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                         qryBuscaOperacoesVALOR.AsFloat, '', 'OPE') = 0 then
                  begin
                     fraMsg.Mes := 'Contabilizando Item da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
                     //AL_11
                     if not OpcaoIndice.ContabilizaOpcInd(qryBuscaOperacoesVALOR.AsFloat{fValor},
                                                          CtrlInvContab.BuscaPadrLanc.Plano,
                                                          qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                          CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                          CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                          CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                          qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                          CtrlInvContab.BuscaPadrLanc.Historico,
                                                          CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                          CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                          CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                          CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                          CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                          CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                          qryBuscaOperacoesDATAORDEM.AsDateTime,iPlanilha,-1) then
                        // AL_5
                        Raise Exception.Create(OperComum.IIF(CtrlInvContab.MessageInfo = '','Erro na Contabilização da Operação de Opções', CtrlInvContab.MessageInfo));
                  end
                  else
                     //AL_11
                     Raise Exception.Create('Ocorreu um problema na busca da Parametrização Contábil para a Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString + #13 +
                                            'Mensagem: ' + CtrlInvContab.MessageInfo);
               end;

               iPosBoleta := fraMsg.Pos;

               // Transfere a Cesta
               if not bReversao then
               begin
                  OperComum.LimpaParametros(qryBuscaCestaOpcInd);
                  qryBuscaCestaOpcInd.ParamByName('DATAVIGENCIA').AsString   := DateToStr(qryBuscaOperacoesDATAORDEM.AsDateTime);
                  qryBuscaCestaOpcInd.ParamByName('IDCESTAOPCIND').AsInteger := qryBuscaOperacoesIDCESTAOPCIND.AsInteger;
                  qryBuscaCestaOpcInd.Open;
                  if not qryBuscaCestaOpcInd.IsEmpty then
                  begin
                     // Gera nova boleta para as tranferências
                     sBoletaTRC := 'OI-' + Copy(DateToStr(pRPI.DATAULTFECH),9,2) + '/' +
                                           FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                           Copy(DateToStr(pRPI.DATAULTFECH),9,2)));

                     fraMsg.Mes := 'Gravando a Boleta ' + sBoletaTRC;
                     try
                        OperComum.LimpaParametros(DMOpcoesIndice.qryInsBoletaOpcInd, True);
                        qryInsBoletaOpcInd.ParamByName('IDBOLETA').AsString := sBoletaTRC;
                        qryInsBoletaOpcInd.ParamByName('STATUS').AsString   := 'P';
                        qryInsBoletaOpcInd.ParamByName('DATABOLETA').AsDateTime := pRPI.DATAULTFECH;
                        qryInsBoletaOpcInd.ParamByName('TIPMOVBOLETA').AsString := 'TRC';
                        qryInsBoletaOpcInd.ExecSQL;
                     except
                        Raise Exception.Create('Erro na Gravação da Boleta de Transferência: ' + sBoletaTRC);
                     end;

                     iCesta := qryBuscaOperacoesIDCESTAOPCIND.AsInteger;
                     fraMsg.Max := qryBuscaCestaOpcInd.RecordCount;
                     fraMsg.Pos := 0;
                     fraMsg.Mes := 'Transferindo Cesta da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
                     while not qryBuscaCestaOpcInd.EOF do
                     begin
                        fraMsg.Mes := 'Buscando Saldos de ' + qryBuscaCestaOpcIndDESCINVESTIMENTO.AsString;
                        // Transfere
                        if bReversao then
                        begin
                           // Busca o Saldo Bloqueado
                           //AL_2
                           //AL_4
                           //AL_7
                           //AL_8
                           //AL_9
                           OperComum.BuscaTodosSaldosInvestLote(
                                 qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                 qryBuscaOperacoesIDCARTEIRAGERENC.AsInteger,
                                 qryBuscaCestaOpcIndIDINVESTIMENTO.AsInteger,
                                 9999999, qryBuscaCestaOpcIndIDCUSTODIANTE.AsInteger,'',
                                 DateToStr(qryBuscaOperacoesDATAORDEM.AsDateTime), pRPI.IDMOTBLOQOPC,
                                 wSaldoInutil,   wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                 wSaldoInutil,   wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                 wSaldoInutil,   wSaldoInutil,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                 fSaldoLiberado, fSaldoBloqueado, wSaldoInutil, wSaldoInutil);
                                 fSaldoLiberado := fSaldoBloqueado;

                           iCarteiraOrig := qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger;
                           iCarteiraDest := pRPI.IDCARTAVISTA;
                           iMotBloqOrig  := pRPI.IDMOTBLOQOPC;
                           iMotBloqDest  := -1;
                           iMercadoOrig  := 3;
                           iMercadoDest  := 1;
                        end
                        else
                        begin
                           // Busca o Saldo Liberado
                           //AL_2
                           //AL_4
                           //AL_7
                           //AL_8
                           //AL_9
                           OperComum.BuscaTodosSaldosInvestLote(
                                 qryBuscaCestaOpcIndIDCARTEIRAINVEST.AsInteger,
                                 qryBuscaCestaOpcIndIDCARTEIRAGERENC.AsInteger,
                                 qryBuscaCestaOpcIndIDINVESTIMENTO.AsInteger,
                                 9999999, qryBuscaCestaOpcIndIDCUSTODIANTE.AsInteger,'',
                                 DateToStr(qryBuscaOperacoesDATAORDEM.AsDateTime), -1,
                                 wSaldoInutil,   wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                 wSaldoInutil,   wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                 wSaldoInutil,   wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                                 fSaldoLiberado, wSaldoInutil, wSaldoInutil, wSaldoInutil);
                           // SE A CARTEIRA É SEMPRE A VISTA PARA QUE SELECIONAR A CARTEIRA NA TELA
                           iCarteiraOrig := pRPI.IDCARTAVISTA;
                           iCarteiraDest := qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger;
                           iMotBloqOrig  := -1;
                           iMotBloqDest  := pRPI.IDMOTBLOQOPC;
                           iMercadoOrig  := 1;
                           iMercadoDest  := 3;
                        end;

                        fraMsg.Mes := 'Transferindo ' + qryBuscaCestaOpcIndDESCINVESTIMENTO.AsString;
                        if not OperComum.TransfEntreCarteiras(qryBuscaCestaOpcIndIDEMISSOR.AsInteger,
                                                              iCarteiraOrig,iCarteiraDest,
                                                              qryBuscaCestaOpcIndIDINVESTIMENTO.AsInteger,
                                                              qryBuscaCestaOpcIndIDCUSTODIANTE.AsInteger,
                                                              qryBuscaCestaOpcIndIDCUSTODIANTE.AsInteger,
                                                              iMotBloqOrig,iMotBloqDest,iMercadoOrig,iMercadoDest,
                                                              qryBuscaCestaOpcIndIDEMISSOR.AsInteger,
                                                              fSaldoLiberado,Abs(qryBuscaCestaOpcIndQUANTIDADE.AsFloat),
                                                              qryBuscaOperacoesDATAORDEM.AsDateTime,
                                                              False,'',
                                                              sBoletaTRC,
                                                              iIdHistCartInvDest) then
                           Raise Exception.Create('Erro na Transferência de ' + qryBuscaCestaOpcIndDESCINVESTIMENTO.AsString);
                        qryBuscaCestaOpcInd.Next;
                        fraMsg.Incrementa;
                     end;
                     // UPDATE com o IDBOLETA na Cesta
                     try
                        with DMOpcoesIndice.qryAux do
                        begin
                           Close;
                           SQL.Clear;
                           SQL.Text := 'UPDATE CESTAOPCIND SET IDBOLETA = ' + QuotedStr(sBoletaTRC) +
                                       ' WHERE IDCESTAOPCIND = '+ IntToStr(iCesta)+
                                       ' AND DATAVIGENCIA = TO_DATE('+ QuotedStr(DateToStr(qryBuscaOperacoesDATAORDEM.AsDateTime))+',''DD/MM/YYYY'')';
                           ExecSQL;
                           Close;
                        end;
                     except
                        Raise Exception.Create('Erro na Atualização da Boleta ' + sBoletaTRC + ' na Cesta da Opção');
                     end;
                  end;
               end;
               fraMsg.Max := RecordCount;
               fraMsg.Pos := iPosBoleta;
               Next;
               fraMsg.Incrementa;
            end;

            fraMsg.Apaga;
            fraMsg.Mostra;
            fraMsg.Max := 4;

            //Contabiliza Despesa da Boleta
            if fTotalLiquido <> 0 then
            begin
               if fTotalLiquido < 0 then
                  iTipoOperacao := -88  // Compra (à Pagar)
               else
                  iTipoOperacao := -86; // Venda (à Receber)

               //AL_13
               //AL_12
               if CtrlInvContab.IntegraCtbFinModulo(8) then
               begin
                  //AL_13
                  //AL_11
                  if CtrlInvContab.BuscaPadrLanc.Executa( -1 ,//OperComum.RetornaSegmentacaoRV(qryBuscaOperacoesIDINVESTIMENTO.AsInteger), //Renan CGPC
                                                         0,2, iTipoOperacao, -28, -1,
                                                         qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                         qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                         fTotalLiquido, '', 'DOP') = 0 then
                  begin
                     fraMsg.Mes := 'Contabilizando o Financeiro da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
                     //AL_11
                     if not OpcaoIndice.ContabilizaOpcInd(fTotalLiquido,
                                                          CtrlInvContab.BuscaPadrLanc.Plano,
                                                          qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                          CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                          CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                          CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                          qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                          CtrlInvContab.BuscaPadrLanc.Historico,
                                                          CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                          CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                          CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                          CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                          CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                          CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                          qryBuscaOperacoesDATAORDEM.AsDateTime,iPlanilha,-1) then
                        // AL_5
                        Raise Exception.Create(OperComum.IIF(CtrlInvContab.MessageInfo = '','Erro na Contabilização das Despesas da Operação de Opções', CtrlInvContab.MessageInfo));
                     fraMsg.Pos := 1;

                     fraMsg.Mes := 'Integrando o Financeiro da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;

                     //Integra Financeiro da Boleta
                     if not OpcaoIndice.IntegraCapCarOpcInd(fTotalLiquido, qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                            CtrlInvContab.BuscaPadrLanc.Plano,
                                                            qryBuscaOperacoesCODTIPDOC.AsInteger,
                                                            CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                            CtrlInvContab.BuscaPadrLanc.SubContaCre,iPlanilha,
                                                            CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                            CtrlInvContab.BuscaPadrLanc.TipoRecDes,
                                                            CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                            CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                            CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                            DateToStr(qryBuscaOperacoesDATAORDEM.AsDateTime),
                                                            DateToStr(dbDataLiquidacao.Date),
                                                            CtrlInvContab.BuscaPadrLanc.CentroRespon,
                                                            CtrlInvContab.BuscaPadrLanc.Historico, iDocumento, -1) then
                        Raise Exception.Create('Erro na Integração Financeira da Operação de Opções');
                     fraMsg.Pos := 2;
                  end
                  else
                     //AL_11
                     Raise Exception.Create('Ocorreu um problema na busca da Parametrização Contábil para a Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString + #13 +
                                            'Mensagem: ' + CtrlInvContab.MessageInfo);
               end;
            end;
            fraMsg.Pos := 2;

            // Grava a Boleta
            if qryBuscaOperacoesIDBOLETA.AsString <> '' then
            begin
               fraMsg.Mes := 'Gravando a Boleta ' + qryBuscaOperacoesIDBOLETA.AsString;
               // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
               OperComum.LimpaParametros(dtmOperComum.QryBoleta);
               dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := qryBuscaOperacoesIDBOLETA.AsString;
               dtmOperComum.QryBoleta.Open;
               // Caso não tenha, cria um registro
               if dtmOperComum.QryBoleta.IsEmpty then
               begin
                  if not OpcaoIndice.GravaBoletaOpcInd(qryBuscaOperacoesIDBOLETA.AsString, 'F',
                                                       qryBuscaOperacoesDATAORDEM.AsDateTime,
                                                       qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                       iPlano, iPlanilha,iDocumento,'OPE') then
                     Raise Exception.Create('Erro na Gravação da Boleta da Operação de Opções');
               end
               else
               begin
                  if not OpcaoIndice.UpdStatusBoleta(qryBuscaOperacoesIDBOLETA.AsString,'F','OPE',
                                                     qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                     iPlano,iPlanilha,iDocumento) then
                     Raise Exception.Create('Erro na Atualização da Boleta da Operação de Opções');
               end;
            end;
            fraMsg.Pos := 3;

            // Altera o Status da Ordem para Fechada
            fraMsg.Mes := 'Gravando Status das Ordens da Boleta ' + qryBuscaOperacoesIDBOLETA.AsString;
            if not OpcaoIndice.UpdStatusOrdemOpcInd(qryBuscaOperacoesIDBOLETA.AsString,'F') then
               Abort;

            DtmBaseDados.dbBaseDados.Commit;
            qryBuscaOperacoes.CommitUpdates;
            qryBuscaBoletaOper.CommitUpdates;
            fraMsg.Pos := 4;
            MsgDlg('Processamento concluído com sucesso.','Mensagem do Sistema ',mtConfirmation,[mbOK],0);
            bbtnSair.Click;
         end;
      except
         on E: Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            fraMsg.Apaga;
            MsgDlg('Ocorreu problema ao confirmar a Boleta.' + #13 + E.Message,
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            Exit;
         end;
      end;
   finally
      FreeAndNil(RegraFBolOpcInd);
   end;
end;

procedure TfrmFechaBoletaOpcInd.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if not DtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.StartTransaction;
   DtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmFechaBoletaOpcInd.bbtnSairClick(Sender: TObject);
begin
  inherited;
   if not DtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.StartTransaction;
   DtmBaseDados.dbBaseDados.Rollback;

   DMOpcoesIndice.qryBuscaOperacoes.Close;
   DMOpcoesIndice.qryBuscaBoletaOper.Close;
   DMOpcoesIndice.qryBuscaCestaOpcInd.Close;
end;

procedure TfrmFechaBoletaOpcInd.BitBtn1Click(Sender: TObject);
begin
  inherited;

   DmRelConsBoletaOpcInd.pplVlrDesp.Caption  := PnlTotalDespesas.Caption;
   DmRelConsBoletaOpcInd.pplVlrTotal.Caption := PnlTotLiquido.Caption;
   DmRelConsBoletaOpcInd.pplLabTotal.Caption := lblTotalLiquido.Caption;

   TfrmPreview.CreateModalPreview(Application,
                                  DmRelConsBoletaOpcInd.rpConsBoletaOpcInd,
                                  DmRelConsBoletaOpcInd.rpConsBoletaOpcInd.PrinterSetup.DocumentName);
end;

procedure TfrmFechaBoletaOpcInd.FormResize(Sender: TObject);
begin
   inherited;
   fraMsg.Width := TB97oKCancelar.Left;
end;

end.
    
