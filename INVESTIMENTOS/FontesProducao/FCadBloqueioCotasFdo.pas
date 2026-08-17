//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_14
// Pendencia :
// SOL       :
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_13
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 16/01/2007
// Código    : AL_12
// Pendencia : 22229
// SOL       :
// Motivo    : Implementação do desbloqueio de cotas
//******************************************************************************
// Data      : 15/01/2007
// Código    : Al_11
// Pendencia :
// SOL       :
// Motivo    : Ajuste na busca do procura, estava trazendo registros duplicados.
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_10
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_9
// Pendencia :
// SOL       :
// Motivo    : A rotina de confirmação foi otimizada, devido a funcionalidade de alteração
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_8
// Pendencia :
// SOL       :
// Motivo    : A transação da operação foi transferida para o momento de confirmação da operação
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_7
// Pendencia :
// SOL       :
// Motivo    : Implementação do tipo de alteração na verificação da operação para o
//             mesmo dia(QryVerOper).
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_6
// Pendencia :
// SOL       :
// Motivo    : Implementação de ajuste para qdo a quantidade estiver zerada fazer o
//             calculo dessa.
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_5
// Pendencia :
// SOL       :
// Motivo    : Implementação de ajsute no tratamento dos valores da combo qdo essa
//             esta vazia
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_4
// Pendencia :
// SOL       :
// Motivo    : Implementação de ajsute na exclusão do historico da operação
//******************************************************************************
// Data      : 26/06/2006
// Código    : Al_3
// Pendencia :
// SOL       :
// Motivo    : Implementação do focus quando inserir e alterar
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_2
// Pendencia :
// SOL       :
// Motivo    : Implementação na exclusão para reprocessar o fundo qdo a data for igual
//             ou menor que a data de atualização
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************

unit FCadBloqueioCotasFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, StdCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Db, DBTables, Wwquery, CmEventosCadastro, ImgList, MontaSelect,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, fcLabel, ExtCtrls, DBCtrls, ComCtrls, uCtrlInvContab;

type
  TFrmCadBloqueioCotasFdo = class(TfrmCadastroCSInv)
    PageControl1: TPageControl;
    tbsBloqueio: TTabSheet;
    tbsObs: TTabSheet;
    Panel1: TPanel;
    lbData: TLabel;
    dbDataBloqueio: TCMDateTimePicker;
    lbFundo: TLabel;
    DblFundoInvest: TwwDBLookupCombo;
    lbTipoOper: TLabel;
    DblTipoOperacao: TwwDBLookupCombo;
    lbMotivoBloq: TLabel;
    DblMotivoBloq: TwwDBLookupCombo;
    Label19: TLabel;
    DbVlrCota: TDBRealEdit;
    lbValor: TLabel;
    DbVlrBloq: TDBRealEdit;
    DbQtdBloq: TDBRealEdit;
    lbQtdBloq: TLabel;
    PnlObs: TPanel;
    DBMemo1: TDBMemo;
    QryFundoInvest: TwwQuery;
    QryTipoOper: TwwQuery;
    QryMotivoBloq: TwwQuery;
    QryAux: TwwQuery;
    QryVerOper: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    QryUpdPedido: TwwQuery;
    //AL_12
    QrySaldoFundoTotal: TwwQuery;
    procedure dbDataBloqueioExit(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DblFundoInvestExit(Sender: TObject);
    procedure DbVlrBloqExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure DbQtdBloqExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //AL_12
    procedure DblFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DblFundoInvestEnter(Sender: TObject);
    procedure DblTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DblTipoOperacaoEnter(Sender: TObject);
    procedure DblTipoOperacaoExit(Sender: TObject);
  private
    { Private declarations }
    //AL_12
    wValAnt : String;
    bModif  : Boolean;

    procedure HabilitaCampos(Campo  : Boolean);
    
    //AL_12
    procedure MontaCota;
    procedure MontaDesbloqueio;

    function  TestaOperacaoExitente : Boolean;
    //AL_12
    function  VerSaldoBloqueado(var fQtdBloq : Double) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadBloqueioCotasFdo: TFrmCadBloqueioCotasFdo;

implementation

uses UOperComum, UBibliotecaInvest, UFundoComum, UDataBase, uMensErro, UDiasUteisInv,
     dFundoComum, DBaseDados;

{$R *.DFM}

procedure TFrmCadBloqueioCotasFdo.dbDataBloqueioExit(Sender: TObject);
begin
  inherited;
   if qry.State in [dsinsert] then
   begin
     OperComum.LimpaParametros(QryFundoInvest);
     //AL_12
     if dbDataBloqueio.Text <> '' then
        QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString := dbDataBloqueio.Text
     else
        QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString := DateToStr(pRPI.DATAULTFECHFDO);
     QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
     QryFundoInvest.Open;

     DbVlrCota.DecDigits := QryFundoInvest.FieldByName('QTDDECVALOR').AsInteger;
     DbQtdBloq.DecDigits := QryFundoInvest.FieldByName('QTDDECQTD').AsInteger;
   end;
end;

procedure TFrmCadBloqueioCotasFdo.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   //Al_8
   HabilitaCampos(False);
   //Al_3
   if DbVlrCota.CanFocus then
      DbVlrCota.SetFocus;
end;

procedure TFrmCadBloqueioCotasFdo.HabilitaCampos(Campo : Boolean);
begin
  inherited;
   lbData.Enabled          := Campo;
   dbDataBloqueio.Enabled  := Campo;
   lbFundo.Enabled         := Campo;
   DblFundoInvest.Enabled  := Campo;
   lbTipoOper.Enabled      := Campo;
   DblTipoOperacao.Enabled := Campo;
   lbMotivoBloq.Enabled    := Campo;
   DblMotivoBloq.Enabled   := Campo;
end;

procedure TFrmCadBloqueioCotasFdo.sbtnInserirClick(Sender: TObject);
begin

  inherited;
   //Al_8
   OperComum.LimpaParametros(QryTipoOper);
   QryTipoOper.ParamByName('IDTIPOINVEST').AsInteger    := iTipoInvestUsu;
   QryTipoOper.Open;

   OperComum.LimpaParametros(QryMotivoBloq);
   QryMotivoBloq.Open;

   HabilitaCampos(True);

   //Al_3
   if dbDataBloqueio.CanFocus then
      dbDataBloqueio.SetFocus;

end;

procedure TFrmCadBloqueioCotasFdo.bbtnConfirmarClick(Sender: TObject);
var bAltera, bConfirma : Boolean;
    iIdForCli, iPlano, iPlanilha, iDocumento : Integer;
    sMens: String;
begin
  iPlano     := -1;
  iPlanilha  := -1;
  iDocumento := -1;

  //Al_9
  if qry.State = DsEdit then
     bAltera := True;

  CmeCadastroBeforeConfirma(Self, bConfirma);
  if not bConfirma then
     Exit;

  //AL_10
  if not CtrlInvContab.TestaPeriodo(dbDataBloqueio.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo+'.'+#13+
            'O processo será Cancelado.','Mensagem do Sistema',mtWarning,[mbOk],0);
     bbtnCancelar.Click;
     Exit;
  end;

  //AL_1
  if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
  begin
     MsgDlg('O processo será Cancelado.','Mensagem do Sistema',mtWarning,[mbOk],0);
     bbtnCancelar.Click;
     Exit;
  end;

  try
    //Al_8
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    if Not bAltera then
       Qry.FieldByName('IDPEDIDOFUNDO').AsInteger  := LeUltRegistro(nil,'PEDIDOFUNDO');

    Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    Qry.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
    Qry.FieldByName('DATACOTIZACAO').AsDateTime    := StrToDate(dbDataBloqueio.Text);
    Qry.FieldByName('DATALIQUIDACAO').AsDateTime   :=
        DiasUteisInv.SomaDiasUteis(StrToDate(dbDataBloqueio.Text),
                     qryTipoOper.FieldByName('VENCIMENTO').AsInteger,-1,1,'',True,False,False);

    Qry.ApplyUpdates;
    Qry.CommitUpdates;

    if bAltera then
    begin
       if not ProcExcluiFundo(Qry.FieldByName('CODDOCUMENTO').AsInteger,
                              Qry.FieldByName('PLNCODIGO').AsInteger,
                              Qry.FieldByName('PLANO').AsInteger,
                              iTipoInvestUsu,
                              Qry.FieldByName('DATAPEDIDO').AsDateTime,
                              bAltera) then
       Raise Exception.Create('Não foi possível excluir a Contabil do Bloqueio existente. '+#13+
                              'O processo será cancelado.');
    end;

    iIdForCli := OperComum.BuscaForCli(Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                       Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       pRPI.IDTIPOCLIENTEEMI);

    If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                    Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                                    Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                    QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    iIdForCli,
                                    Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                    Qry.FieldByName('DATAPEDIDO').AsDateTime
                                    Qry.FieldByName('DATALIQUIDACAO').AsDateTime,
                                    'OPE' , QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                                    Trim(DblFundoInvest.Text)+' / '+sPlanPrevCtbPatro,
                                    True,
                                    Qry.FieldByName('VLRPEDIDO').AsFloat,
                                    0, 0, 0, 0, 0, 0) Then
       Raise Exception.Create('Não foi possível Contabilizar o Bloqueio, '+#13+
                              'o processo será cancelado.');

    With QryUpdPedido Do
    Begin
       OperComum.LimpaParametros(QryUpdPedido);
       ParamByName('IDPEDIDOFUNDO').AsInteger        := Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;

       //Al_4
       If iPlano > 0 then
          ParamByName('PLANO').AsInteger             := iPlano
       Else
          ParamByName('PLANO').Clear;

       If iPlanilha > 0 then
          ParamByName('PLNCODIGO').AsInteger         := iPlanilha
       Else
          ParamByName('PLNCODIGO').Clear;

       If iDocumento > 0 then
          ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
       Else
          ParamByName('CODDOCUMENTO').Clear;

       ExecSQL;
       Close;
    End;

    if bAltera then
    begin
       //Al_4
       FazQuery(QryAux,'SELECT PLANO, PLNCODIGO, DATAMOVFUNDO FROM HISTFUNDO WHERE '+
                       '(IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+') AND '+
                       '(IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+') AND '+
                       '(IDFUNDOINVEST = '+DblFundoInvest.LookupValue +') AND '+
                       '(DATAMOVFUNDO >= TO_DATE('+QuotedStr(dbDataBloqueio.Text)+','+QuotedStr('DD/MM/YYYY')+')) AND '+
                       '(IDOPERACAOFUNDO IN (SELECT IDOPERACAOORIGEM FROM OPERACAOFUNDO WHERE '+
                       ' IDPEDIDOFUNDO = '+Qry.FieldByName('IDPEDIDOFUNDO').AsString+')) '+
                       'ORDER BY DATAMOVFUNDO, PLNCODIGO');

       While Not QryAux.Eof do
       begin
          if (QryAux.FieldByName('PLANO').AsInteger > 0) and (QryAux.FieldByName('PLNCODIGO').AsInteger > 0) then
          begin
             if Not ProcExcluiContabil(QryAux.FieldByName('PLANO').AsInteger,
                                       QryAux.FieldByName('PLNCODIGO').AsInteger) then
                Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                                       'O processo será Cancelado.');
          end;
          QryAux.Next;
       end;

       If Not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE '+
                                  '(IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+') AND '+
                                  '(IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+') AND '+
                                  '(IDFUNDOINVEST = '+DblFundoInvest.LookupValue +') AND '+
                                  '(DATAMOVFUNDO >= TO_DATE('+QuotedStr(dbDataBloqueio.Text)+','+QuotedStr('DD/MM/YYYY')+')) AND '+
                                  '(IDOPERACAOFUNDO IN (SELECT IDOPERACAOORIGEM FROM OPERACAOFUNDO WHERE '+
                                  ' IDPEDIDOFUNDO = '+Qry.FieldByName('IDPEDIDOFUNDO').AsString+'))') Then
          Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                                'O processo será Cancelado.');

       If Not ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE '+
                                  'IDPEDIDOFUNDO = '+Qry.FieldByName('IDPEDIDOFUNDO').AsString) Then
          Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                                'O processo será Cancelado.');

       If dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

       OperComum.LimpaParametros(QryTipoFundoInvest);
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                          QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;

       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbDataBloqueio.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
          //AL_14
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end
    else
    begin
       If Not BloqueioCotas(Qry.FieldByName('IDTIPOINVEST').AsInteger,
                            Qry.FieldByName('IDPEDIDOFUNDO').AsInteger,
                            Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                            QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                            Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            Qry.FieldByName('DATACOTIZACAO').AsDateTime,
                            Qry.FieldByName('DATAPEDIDO').AsDateTime,
                            Qry.FieldByName('DATALIQUIDACAO').AsDateTime,
                            0,
                            Qry.FieldByName('VLRCOTA').AsFloat,
                            Qry.FieldByName('QTDBLQPEDIDO').AsFloat) Then
          Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                                 'o processo será cancelado.');

       With DmFundoComum Do
       Begin
          OperComum.LimpaParametros(QryConfirmacao);
          QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                     Qry.FieldByName('IDFUNDOINVEST').AsInteger;
          QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                     Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
          QryConfirmacao.ParamByName('DATAOPERACAO').AsString       :=
                                     Qry.FieldByName('DATAPEDIDO').AsString;
          QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                     Qry.FieldByName('DATACOTIZACAO').AsString;
          QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                     Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger;
          QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                     Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;
          QryConfirmacao.Open;
          while not QryConfirmacao.Eof do
          begin
             //AL_13
             If Not AlimentaFundo(QryConfirmacao.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryConfirmacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                  QryConfirmacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                  QryConfirmacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                  iPlanoPrevContab,
                                  iPatrocinadora,
                                  QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                  QryConfirmacao.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                  QryConfirmacao.FieldByName('QTDDECQTD').AsInteger,
                                  QryConfirmacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                  iIdForCli,
                                  QryConfirmacao.FieldByName('DATAOPERACAO').AsDateTime,
                                  QryConfirmacao.FieldByName('DATACOTIZACAO').AsDateTime,
                                  QryConfirmacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                  QryConfirmacao.FieldByName('QTDOPERACAO').AsFloat,
                                  QryConfirmacao.FieldByName('VLRCOTA').AsFloat,
                                  QryConfirmacao.FieldByName('VLRLIQUIDO').AsFloat,
                                  QryConfirmacao.FieldByName('VLRIR').AsFloat,
                                  QryConfirmacao.FieldByName('VLRIOF').AsFloat,
                                  QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                                  Trim(DblTipoOperacao.Text)+' / '+
                                       QryConfirmacao.FieldByName('DESCFUNDOINVEST').AsString,
                                  'BLQ' , True, iPlanPrevCtbPatro, -1, -1,
                                  QryConfirmacao.FieldByName('VLRRENDIMENTO').AsFloat, sMens) Then
             begin
                //AL_13
                if sMens <> '' then
                   Raise Exception.Create('Não foi possível confirmar o Bloqueio' + #13 +
                                          'Mensagem: ' + sMens)
                else
                   Raise Exception.Create('Não foi possível confirmar o Bloqueio' + #13 +
                                          'Ocorreu um problema durante o processo de gravação' + #13 +
                                          'Refaça a operação');
             end;

             QryConfirmacao.Next;

          end;
       end;

       If dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

       OperComum.LimpaParametros(QryTipoFundoInvest);
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                          QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;

       If (StrToDate(dbDataBloqueio.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime) Then
       begin
          If Not Reprocessamento(iTipoInvestUsu,
                                 QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                 iPlanPrevCtbPatro,
                                 StrToDate(dbDataBloqueio.Text),
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                                 True) Then
             //AL_14
             MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0);
       end;
    end;

    QryTipoFundoInvest.Close;

    bbtnCancelar.Click;

  except
     On E:Exception Do
     Begin
        MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Rollback;
     end;
  end;
end;

procedure TFrmCadBloqueioCotasFdo.bbtnCancelarClick(Sender: TObject);
begin
   HabilitaCampos(True);

  inherited;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

end;

procedure TFrmCadBloqueioCotasFdo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      OperComum.LimpaParametros(Qry);
      Qry.ParamByName('IDPEDIDOFUNDO').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      Qry.Open;

      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString  := dbDataBloqueio.Text;
      QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundoInvest.Open;

      OperComum.LimpaParametros(QryTipoOper);
      QryTipoOper.ParamByName('IDTIPOINVEST').AsInteger    := iTipoInvestUsu;
      QryTipoOper.Open;

      OperComum.LimpaParametros(QryMotivoBloq);
      QryMotivoBloq.Open;

      DbVlrCota.DecDigits := QryFundoInvest.FieldByName('QTDDECVALOR').AsInteger;
      DbQtdBloq.DecDigits := QryFundoInvest.FieldByName('QTDDECQTD').AsInteger;

   end;
end;

procedure TFrmCadBloqueioCotasFdo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
    Qry.Close;
    QryFundoInvest.Close;
    QryTipoOper.Close;
    QryMotivoBloq.Close;
end;

procedure TFrmCadBloqueioCotasFdo.DblFundoInvestExit(Sender: TObject);
var DadosCota : TDadosCota;
begin
  inherited;
   //AL_12
   //Al_5
   if ((Not bModif) And (Trim(dbDataBloqueio.Text) <> '') And (Trim(DblFundoInvest.LookupValue) <> '')) then
      if (StrToInt(DblFundoInvest.LookupValue) > 0) then
          MontaCota;

   bModif := false;
end;

procedure TFrmCadBloqueioCotasFdo.DbVlrBloqExit(Sender: TObject);
begin
  inherited;
   //Al_6
   if DbQtdBloq.Value = 0 then
      DbQtdBloq.Value := OperComum.DivValorZero(DbVlrBloq.Value, DbVlrCota.Value);
end;

function TFrmCadBloqueioCotasFdo.TestaOperacaoExitente : Boolean;
begin
   OperComum.LimpaParametros(QryVerOper);
   QryVerOper.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryVerOper.ParamByName('DATAPEDIDO').AsString         := dbDataBloqueio.Text;
   QryVerOper.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundoInvest.LookupValue);
   QryVerOper.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   //Al_7
   QryVerOper.ParamByName('IDTIPOOPERACAO').AsInteger    := StrToInt(DblMotivoBloq.LookupValue);
   QryVerOper.Open;
   if not QryVerOper.IsEmpty then
      Result := True
   else
      Result := False;
   QryVerOper.Close;
end;

procedure TFrmCadBloqueioCotasFdo.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
var fSldQtBlq : Double;
begin
  inherited;
   if (Qry.State = DsInsert) and (TestaOperacaoExitente) then
   begin
      Accept := False;
      MsgDlg('Já existe uma Operação com as mesmas Características.','Mensagem do Sistema',MtWarning,[mbOk],0);
      Exit;
   end;

   if Trim(dbDataBloqueio.Text) = '' then
   begin
      MsgDlg('Não foi informada a Data,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if dbDataBloqueio.CanFocus then
         dbDataBloqueio.SetFocus;
      Exit;
   end
   else if Trim(DblFundoInvest.Text) = '' then
   begin
      MsgDlg('Não foi selecionado um Fundo de Investimento,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if DblFundoInvest.CanFocus then
         DblFundoInvest.SetFocus;
      Exit;
   end
   else if Trim(DblTipoOperacao.Text) = '' then
   begin
      MsgDlg('Não foi selecionado um Tipo de Operação,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if DblTipoOperacao.CanFocus then
         DblTipoOperacao.SetFocus;
      Exit;
   end else if Trim(DblMotivoBloq.Text) = '' then
   begin
      MsgDlg('Não foi selecionado um Motivo de Bloqueio,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if DblMotivoBloq.CanFocus then
         DblMotivoBloq.SetFocus;
      Exit;
   end else if DbQtdBloq.Value <= 0 then
   begin
      MsgDlg('Não foi informado a Quandtidade,'+#13+
             'por favor informe-a.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if DbQtdBloq.CanFocus then
         DbQtdBloq.SetFocus;
      Exit;
   end;

   //AL_12
   if (QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString  = 'A') then
   begin
       if (Not VerSaldoBloqueado(fSldQtBlq)) then
       begin
          Accept := False;
          MsgDlg('A quantidade a Desbloquear é maior que a Bloqueada('+ FloatToStrF(fSldQtBlq,ffNumber,18,9)+').'+#13+
                 'Não será possível efetuar o Desbloqueio de Cotas.','Mensagem do Sistema',MtWarning,[mbOk],0);
          if DbQtdBloq.CanFocus then
             DbQtdBloq.SetFocus;
          Exit;
       end;
   end;
   
   Accept := True;

end;

procedure TFrmCadBloqueioCotasFdo.DbQtdBloqExit(Sender: TObject);
begin
  inherited;
   if DbVlrCota.Value <> 0 then
      DbVlrBloq.Value := OperComum.Round(DbQtdBloq.Value*DbVlrCota.Value,2);
end;

procedure TFrmCadBloqueioCotasFdo.sbtnApagarClick(Sender: TObject);
var iFundo, iTipoFundoInvest : Integer;
    dDataRef, dDtaIniProc : TDateTime;
begin

   iFundo           := Qry.FieldByName('IDFUNDOINVEST').AsInteger;
   iTipoFundoInvest := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   dDataRef         := Qry.FieldByName('DATAPEDIDO').AsDateTime;
   dDtaIniProc      := QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime;

   If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes Then
   Begin
     Try
       //AL_10
       if not CtrlInvContab.TestaPeriodo(dbDataBloqueio.Text, iTipoInvestUsu) then
          Raise Exception.Create(CtrlInvContab.MessageInfo+'.'+#13+
                                 'O processo será Cancelado.');

       //AL_1
       if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
          Raise Exception.Create('O processo será Cancelado.');

       //Al_4
       FazQuery(QryAux,'SELECT H.PLANO, H.PLNCODIGO, H.DATAMOVFUNDO, H.DATAAPLICACAO FROM HISTFUNDO H, '+
                       '    (SELECT IDOPERACAOORIGEM FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+
                                                          Qry.FieldByName('IDPEDIDOFUNDO').AsString+') O '+
                       'WHERE '+
                       'H.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                       'H.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                       'H.IDFUNDOINVEST     = '+DblFundoInvest.LookupValue +' AND '+
                       'H.DATAAPLICACAO    <= TO_DATE('+QuotedStr(dbDataBloqueio.Text)+','+QuotedStr('DD/MM/YYYY')+') AND '+
                       'H.DATAMOVFUNDO     >= TO_DATE('+QuotedStr(dbDataBloqueio.Text)+','+QuotedStr('DD/MM/YYYY')+') AND '+
                       'H.IDOPERACAOFUNDO   = O.IDOPERACAOORIGEM  AND '+
                       'H.PLNCODIGO IS NOT NULL '+
                       'ORDER BY H.DATAMOVFUNDO, H.PLNCODIGO');

       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       While Not QryAux.Eof do
       begin
          if Not ProcExcluiContabil(QryAux.FieldByName('PLANO').AsInteger,
                                    QryAux.FieldByName('PLNCODIGO').AsInteger) then
             Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                                    'O processo será Cancelado.');
          QryAux.Next;
       end;

       QryAux.Close;

       If Not ExcluiResgate(Qry.FieldByName('IDPEDIDOFUNDO').AsInteger) Then
          Raise Exception.Create('Não foi possível efetuar a Operação, '+#13+
                              'O processo será Cancelado.');

       If dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

       Qry.Close;
       Qry.Open;

       OperComum.LimpaParametros(QryTipoFundoInvest);
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger := iTipoFundoInvest;
       QryTipoFundoInvest.Open;

       //Al_2
       If dDataRef <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          If Not Reprocessamento(iTipoInvestUsu,
                                 iTipoFundoInvest,
                                 iFundo,
                                 iPlanPrevCtbPatro,
                                 dDataRef,
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 dDtaIniProc,
                                 True) Then
             //AL_14
             MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0);
       end;

       QryTipoFundoInvest.Close;

     except
        On E:Exception Do
        Begin
           MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

           If dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;

        end;
     end;
   end;
end;

procedure TFrmCadBloqueioCotasFdo.FormCreate(Sender: TObject);
begin
  inherited;
    MontaSelect.Filtro.Add('PEDIDOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));
end;

function TFrmCadBloqueioCotasFdo.VerSaldoBloqueado(var fQtdBloq : Double) : Boolean;
begin
   OperComum.LimpaParametros(QrySaldoFundoTotal);
   QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundoInvest.LookupValue);
   QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString       := dbDataBloqueio.Text;
   QrySaldoFundoTotal.Open;

   fQtdBloq  := QrySaldoFundoTotal.FieldByName('SALDOQTDCOTASBLQ').AsFloat;

   OperComum.LimpaParametros(QrySaldoFundoTotal);

   Result := True;
   if DbQtdBloq.Value > fQtdBloq then
      Result := False;

end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.DblFundoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) And (Trim(dbDataBloqueio.Text) <> '') And (Trim(DblFundoInvest.LookupValue) <> '')) then
      if (StrToInt(DblFundoInvest.LookupValue) > 0) then
          MontaCota;
end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.DblFundoInvestEnter(Sender: TObject);
begin
  inherited;
   wValAnt := DblFundoInvest.LookupValue;
end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.DblTipoOperacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   //AL_12
   bModif := modified;
   if ( (modified) And (Trim(dbDataBloqueio.Text) <> '') And (Trim(DblFundoInvest.LookupValue) <> '') And
        (Trim(DblTipoOperacao.LookupValue) <> '') ) then
      if (QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString  = 'A') then
          MontaDesbloqueio;
end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.DblTipoOperacaoEnter(Sender: TObject);
begin
  inherited;
   wValAnt := DblTipoOperacao.LookupValue;
end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.DblTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   if ( (Not bModif) And (Trim(dbDataBloqueio.Text) <> '') And (Trim(DblFundoInvest.LookupValue) <> '') And
        (Trim(DblTipoOperacao.LookupValue) <> '') ) then
      if (QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString  = 'A') then
          MontaDesbloqueio;
   bModif := False;
end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.MontaCota;
var DadosCota : TDadosCota;
begin
   DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                           StrToInt(DblFundoInvest.LookupValue),
                                           StrToDate(dbDataBloqueio.Text));
   DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
   DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
   DbVlrCota.Value    := DadosCota.VlrCota;
end;

//AL_12
procedure TFrmCadBloqueioCotasFdo.MontaDesbloqueio;
begin
   OperComum.LimpaParametros(QrySaldoFundoTotal);
   QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundoInvest.LookupValue);
   QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString       := dbDataBloqueio.Text;
   QrySaldoFundoTotal.Open;

   DbQtdBloq.Value  :=  QrySaldoFundoTotal.FieldByName('SALDOQTDCOTASBLQ').AsFloat;

   if DbVlrCota.Value <> 0 then
      DbVlrBloq.Value := OperComum.Round(DbQtdBloq.Value*DbVlrCota.Value,2);

   OperComum.LimpaParametros(QrySaldoFundoTotal);
end;

end.
