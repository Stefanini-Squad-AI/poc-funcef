//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_1
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
//Data	    : 29/06/2004
//Origem    : FUNCEF
//Query     : qryDetalhe
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadFluxoCotasIntegralizarAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, uOperacaoInvest, TREdit, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadFluxoCotasIntegralizarAcoes = class(TfrmCadastroRMDetInv)
    qryInvest: TwwQuery;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestIDGESTORCARTEIRA: TFloatField;
    qryInvestTRGDTINCLUSAO: TDateTimeField;
    qryInvestTRGUSERINCLUSAO: TStringField;
    qryInvestMOECODIGO: TFloatField;
    qryInvestIDCARTEIRAINVEST: TFloatField;
    qryInvestIDTIPOFUNDOINVEST: TFloatField;
    qryInvestCNPJFUNDO: TStringField;
    qryInvestSTAEXCLUSIVO: TStringField;
    qryInvestPZOCARENCIA: TFloatField;
    qryInvestPZOANIVERSARIO: TFloatField;
    qryInvestPZOLIQAPLIC: TFloatField;
    qryInvestPZOLIQRESG: TFloatField;
    qryInvestQTDDECQTD: TFloatField;
    qryInvestQTDDECVALOR: TFloatField;
    qryInvestSTAFUNDO: TStringField;
    qryInvestPZOAMORTIZACAO: TFloatField;
    qryInvestPERCTXPERFORM: TFloatField;
    qryInvestPERCTXADM: TFloatField;
    qryInvestCODFUNCETIP: TStringField;
    qryInvestSTAPROVISIONAIR: TStringField;
    qryInvestSTAPROVISIONAIOF: TStringField;
    qryInvestCONTRCETIP: TStringField;
    qryInvestDATAREFERENCIA: TStringField;
    qryInvestIDTIPOINVEST: TFloatField;
    dsInvest: TwwDataSource;
    QryVerDelAplicacao: TwwQuery;
    qryAux: TwwQuery;
    QryParaminvest: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    dbdDta: TCMDateTimePicker;
    DBEQtdCota: TDBRealEdit;
    DBEVlrCota: TDBRealEdit;
    DBEVlrPago: TDBRealEdit;
    DBEVlrDesconto: TDBRealEdit;
    DBEVlrLiquido: TDBRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDPEDIDOFUNDO: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAOPERACAO: TDateTimeField;
    qryDetalheDATALIQUIDACAO: TDateTimeField;
    qryDetalheQTDOPERACAO: TFloatField;
    qryDetalheVLROPERACAO: TFloatField;
    qryDetalheVLRCOTA: TFloatField;
    qryDetalheVLRIR: TFloatField;
    qryDetalheVLRIOF: TFloatField;
    qryDetalheVLRRENDIMENTO: TFloatField;
    qryDetalheSTACONFIRMA: TStringField;
    qryDetalheIDOPERACAOORIGEM: TFloatField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheDATACOTIZACAO: TDateTimeField;
    qryDetalheVLRDESCONTO: TFloatField;
    qryDetalheVLRPAGO: TFloatField;
    dbdDtaIntegr: TCMDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DBEQtdCotaExit(Sender: TObject);
    procedure DBEVlrDescontoExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    procedure StatusGeral;
    procedure StatusInclui;
    procedure StatusAltera;
    procedure Decimais;    

    function  VerificaResgates : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFluxoCotasIntegralizarAcoes : TfrmCadFluxoCotasIntegralizarAcoes;
  iIdTipoOperacao              : Integer;
  sDescOperacao                : String; 

implementation

uses UDataBase, UOperComum, UmensErro, UBibliotecaInvest, dBaseDados,
     UFundoComum;

{$R *.DFM}

procedure TfrmCadFluxoCotasIntegralizarAcoes.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.sbtnProcurarClick(Sender: TObject);
var x: Integer;
    wDisplay: String;
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

  sbtnInsDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  dblInvest.Enabled := True;

  if MontaSelect.RetornouValor then
  begin
     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerformSearch;

     qryDetalhe.Close;
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := StrToInt(montaSelect.ValoresChave[0]);
     qryDetalhe.ParambyName('IDTIPOOPERACAO').asInteger := StrToInt(montaSelect.ValoresChave[1]);

     DBEQtdCota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
     qryDetalheQTDOPERACAO.DisplayFormat :=
                   MontaMascaraDecQtd(StrToInt(montaSelect.ValoresChave[0]));
     DBEVlrCota.DecDigits   := QryInvest.FieldByName('QTDDECVALOR').AsInteger;
     qryDetalheVLRCOTA.DisplayFormat     :=
                   MontaMascaraDecVlr(StrToInt(montaSelect.ValoresChave[0]));

     qryDetalhe.Open;
  end;

// Define o status dos controles do form
  StatusGeral;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.DBEQtdCotaExit(Sender: TObject);
begin
  inherited;
   If DBEQtdCota.Value = 0 Then
   begin
     ShowMessage('A Quantidade de Cotas a Intgralizar tem que ser diferente de zero.');
     DBEQtdCota.SetFocus;
     Exit;
   end;
   DBEVlrPago.Value := DBEQtdCota.Value*DBEVlrCota.Value;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.DBEVlrDescontoExit(
  Sender: TObject);
begin
  inherited;
   DBEVlrLiquido.Value := DBEVlrPago.Value - DBEVlrDesconto.Value;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.sbtnInsDetClick(Sender: TObject);
begin

// Inicia Transação
  If not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  inherited;

  if dsDet.DataSet.State in [dsInsert] then
  Begin
     if qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger <=0 then
        qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(nil,'OPERACAOFUNDO');
  end;
  StatusInclui;
  dbdDta.setfocus;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.sbtnExcluiDetClick(
  Sender: TObject);
var
   wStr     : String;
   wQtdOper : Double;
   wDataOper: TDateTime;
begin
 if (not qryDetalhe.IsEmpty) then
 begin
  If Not VerificaResgates Then
  Begin
     MsgDlg('Já ocorreram Resgates para essa Aplicação, não é possível excluir essa Operação.','Mensagem do Sistema',
               mtInformation,[MbOk],0);
     StatusGeral;
     Exit;
  End;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes
  Then Begin

    Try
      // Inicia Transação
      If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      wDataOper := StrToDate(dbdDta.Text);
      wQtdOper  := QryDetalhe.FieldByName('QTDOPERACAO').AsFloat;

      QryVerDelAplicacao.Close;
      QryVerDelAplicacao.ParamByName('IDTIPOOPERACAO').AsInteger := iIdTipoOperacao;
      QryVerDelAplicacao.ParamByName('IDFUNDOINVEST').AsInteger  :=
                         QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
      QryVerDelAplicacao.ParamByName('DATAAPLICACAO').AsDateTime :=
                         QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime;
      QryVerDelAplicacao.Open;

      // Exclui Dados do Historico
      If Not ProcExcluiFundo(QryVerDelAplicacao.FieldByName('CODDOCUMENTO').AsInteger,
                             QryVerDelAplicacao.FieldByName('PLNCODIGO').AsInteger,
                             QryVerDelAplicacao.FieldByName('PLANO').AsInteger,
                             QryVerDelAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                             QryVerDelAplicacao.FieldByName('DATAMOVFUNDO').AsDateTime,
                             True) Then
        Abort;

      QryVerDelAplicacao.Close;

      wStr :=' SELECT QTDINTEGRALIZAR FROM COTAINTEGRALIZA '+
             ' WHERE (DATAINTEGRALIZAR = '+'TO_DATE('+
                QuotedStr(QryDetalhe.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')) AND'+
             ' (IDFUNDOINVEST   = '''+
                IntToStr(QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger)  +''')';

      FazQuery(QryAux,wStr);

      wQtdOper := wQtdOper+QryAux.FieldByName('QTDINTEGRALIZAR').AsFloat;

      QryAux.Close;

      If Not ExecutaQuery(QryAux,
          'UPDATE COTAINTEGRALIZA SET QTDINTEGRALIZAR = '+FloatToStr(wQtdOper)+
          ' WHERE (DATAINTEGRALIZAR = '+'TO_DATE('+
          QuotedStr(QryDetalhe.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')) AND'+
          ' (IDFUNDOINVEST   = '''+
              IntToStr(QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger)  +''')') Then
         Abort;

      wStr :=
       'DELETE FROM HISTFUNDO '+
       'WHERE IDFUNDOINVEST = '+QryDetalhe.FieldByName('IDFUNDOINVEST').AsString+' AND '+
       '      DATAAPLICACAO = '+'TO_DATE('+
          QuotedStr(QryDetalhe.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')';

      If Not ExecutaQuery(QryAux,wStr) Then
      Begin
        QryAux.Close;
        Abort;
      End;
      QryAux.Close;

      inherited;

      // Confirma Transação
      dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                          qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    If wDataOper < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin

       If Not Reprocessamento(iTipoInvestUsu,
                              qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbdDta.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              True) Then
          MsgDlg('O Reprocessamento foi cancelado! Faça o fechamento para esse dia até a data desejada!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);

    end;

    Except
      On E:Exception Do Begin
        MsgDlg('Erro ao Excluir Aplicação do Cadastro!'#13+
               'Com a Mensagem:'#13+
               E.Message,'Erro',mtError,[mbOk],0);
        // Cancela Transação
        dtmBaseDados.dbBaseDados.Rollback;
        Exit;
      End;

    End; // Except

    aplicaAlteracoes([qryDetalhe]);
  end;
 end;
 StatusGeral;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.bbtnOkDetClick(Sender: TObject);
Var
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fVlrCustoAcoes, fVlrVarAcoes : Currency;  
begin
  fVlrCustoAcoes := 0;
  fVlrVarAcoes   := 0;

  if dbdDta.Text = '' then
  begin
    ShowMessage('O Campo DATA deve ser preenchido');
    dbdDta.Setfocus;
    Exit;
  end;

  if dbdDtaIntegr.Text = '' then
  begin
    ShowMessage('O Campo Data da Integralização deve ser preenchido');
    dbdDtaIntegr.SetFocus;
    Exit;
  end;

  if DBEQtdCota.Value <= 0 then
  begin
    ShowMessage('O Campo Quantidade de Cotas deve ser maior que zero.');
    DBEQtdCota.SetFocus;
    Exit;
  end;

  if DBEVlrCota.value <= 0 then
  begin
    ShowMessage('O Campo Valor da Cota Integralizada deve ser maior que zero.');
    DBEVlrCota.SetFocus;
    Exit;
  end;

  if DBEVlrPago.value <= 0 Then
  begin
    ShowMessage('O Campo Valor Pago deve ser maior que zero.');
    DBEVlrPago.SetFocus;
    Exit;
  end;

  if DBEVlrLiquido.value <= 0 Then
  begin
    ShowMessage('O Campo Valor Líquido deve ser maior que zero.');
    DBEVlrLiquido.SetFocus;
    Exit;
  end;

  Try

    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
    qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
    qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime   := dbdDta.Date;

    qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                            qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;

    qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

    qryDetalhe.FieldByName('STACONFIRMA').AsString        := 'S';

    qryDetalhe.FieldByName('VLRCOTA').AsFloat             := DBEVlrCota.Value;     

    qryDetalhe.Post;

    bbtnConfirmar.Enabled := True;

    iPlanilha  := -1;
    iDocumento := -1;
    iPlano     := -1;

    iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                       qryInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                       iIdTipoOperacao, pRPI.IDTIPOCLIENTEEMI);

    //Rotina de confirmação das operações
    If Not AlimentaFundo(iTipoInvestUsu,
                         iIdTipoOperacao,
                         qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                         qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                         iPlanoPrevContab,
                         iPatrocinadora,
                         qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                         qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                         qryInvest.FieldByName('QTDDECQTD').AsInteger,
                         qryInvest.FieldbyName('IDTIPOFUNDOINVEST').AsInteger,
                         iIdForCli,
                         qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                         qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                         qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
                         qryDetalhe.FieldByName('QTDOPERACAO').AsFloat,
                         qryDetalhe.FieldByName('VLRCOTA').AsFloat,
                         qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                         0{IRRF},
                         0{IOF},
                         'A', Trim(sDescOperacao)+' / '+
                         qryInvest.FieldbyName('DESCFUNDOINVEST').AsString, 'OPE', True,
                         iPlanPrevCtbPatro,-1,-1,
                         0 {Rendimento}) Then
    Begin
       MsgDlg('Erro na gravação da Operação dos Fundos, '#13+
              'essas não poderá ser gravada. ','Mensagem do Sistema',
               MtError,[MbOk],0);
       Abort;
    End;

    If Not ExecutaQuery(QryAux,
          'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
          '(IDOPERACAOFUNDO   = '''+
              IntToStr(qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')') Then
       Abort;

    QryAux.Close;

    //Al_1
    If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                    iIdTipoOperacao,
                                    iTipoInvestUsu,
                                    qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                    iIdForCli,
                                    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
                                    'OPE', 'A',
                                    qryInvest.FieldbyName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                    True, qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes) Then
       Abort;

    inherited;

    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                       qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    If StrToDate(dbdDta.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin

       If Not Reprocessamento(iTipoInvestUsu,
                              qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbdDta.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              True) Then
          MsgDlg('O Reprocessamento foi cancelado! Faça o fechamento para esse dia até a data desejada!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);

    end;

  Except
    On E:Exception Do Begin
      MsgDlg('Erro ao Incluir Aplicação no Cadastro.'#13+
             'Com a Mensagem:'#13+
             E.Message,'Erro',mtError,[mbOk],0);
      // Cancela Transação
      dtmBaseDados.dbBaseDados.Rollback;
      QryAux.Close;
      bbtnCancelarDet.Click;
    End;
  End;

  pnlControlesDet.SendToBack;

  AplicaAlteracoes([qryDetalhe]);
  CmeDetalhe.Cancel(Self);
  StatusGeral;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.StatusGeral;
begin
   dblInvest.Enabled    := True;
   dbdDta.Enabled       := True;
   sbtnProcurar.Enabled := True;
   sbtnInserir.Enabled  := False;

   if Trim(dblInvest.Text) = '' then
   begin
      sbtnInsDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
      dbgrdDet.Enabled      := False;
   end
   else
   begin
         sbtnInsDet.Enabled    := True;
         sbtnExcluiDet.Enabled := True;
         dbgrdDet.Enabled      := True;
   end;
   bbtnOkDet.Enabled       := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled   := False;
   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.StatusInclui;
begin
   sbtnProcurar.Enabled  := False;
   dblInvest.Enabled     := False;

   sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.StatusAltera;
begin
   sbtnProcurar.Enabled    := False;
   dblInvest.Enabled       := False;

   sbtnInsDet.Enabled      := False;
   sbtnExcluiDet.Enabled   := False;

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end;

function  TfrmCadFluxoCotasIntegralizarAcoes.VerificaResgates : Boolean;
begin
   FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDOPERACAOORIGEM = '+
                   qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString);
   If QryAux.Isempty Then
      Result := True
   Else
      Result := False;
   QryAux.Close;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.FormShow(Sender: TObject);
begin
  inherited;
  //Abre Qry's
  qryInvest.Close;
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryInvest.Open;
  qryDetalhe.Open;
  //Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;

  // Carrega quantidade de casas decimais
  Decimais;

  // Define o status dos controles do form
  StatusGeral;

  FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE '+
                  '     (IDTIPOINVEST='+qryInvest.FieldByName('IDTIPOINVEST').AsString+')'+
                  ' AND (CODTIPDOC IS NOT NULL) AND (RECPAG <> ''N'')'+
                  ' AND (IDTIPOOPERACAO > 0)    AND (NATUREZAOPERACAO =  ''A'')');

  iIdTipoOperacao := QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;
  sDescOperacao   := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOOPERACAO = '+IntToStr(iIdTipoOperacao));

end;

Procedure TfrmCadFluxoCotasIntegralizarAcoes.Decimais;
var tmpQry : TQuery;
begin
   tmpQry := TQuery.Create(Self);
   tmpQry.DatabaseName := 'BaseDados';
   tmpQry.sql.Add('SELECT MAX(QTDDECQTD) AS DECIMAIS FROM FUNDOINVEST');
   tmpQry.Open;

   if tmpQry.RecordCount > 0 then
      DBEQtdCOTA.DecDigits := tmpQry.FieldByName('DECIMAIS').AsInteger
   else
      DBEQtdCOTA.DecDigits := 0;

   tmpQry.Free;
end;

procedure TfrmCadFluxoCotasIntegralizarAcoes.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var x: integer;
    wDisplay: String;
begin
   if dblInvest.lookupvalue <> '' then
   begin
      inherited;
      qryDetalhe.Close;
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger  := StrToInt(dblInvest.LookupValue);
      qryDetalhe.ParambyName('IDTIPOOPERACAO').asInteger := iIdTipoOperacao;
      qryDetalhe.Open;

      sbtnInsDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      dblInvest.Enabled     := True;

      case dsDet.State of
           dsInsert : dbdDta.SetFocus;
      end;

      // Altera Formato do Valor da Cota
      DBEQtdCota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      qryDetalheQTDOPERACAO.DisplayFormat :=
                         MontaMascaraDecQtd(StrToInt(dblInvest.LookupValue));
      DBEVlrCota.DecDigits   := QryInvest.FieldByName('QTDDECVALOR').AsInteger;
      qryDetalheVLRCOTA.DisplayFormat :=
                         MontaMascaraDecVlr(StrToInt(dblInvest.LookupValue));
   end;
   // Define o status dos controles do form
   StatusGeral;
end;

end.
