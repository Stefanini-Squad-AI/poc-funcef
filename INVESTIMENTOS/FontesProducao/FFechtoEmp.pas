//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_14
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Ajuste para o novo empréstimo MT
//             Ajuste na qryInvestimento
//******************************************************************************
// Data      : 14/04/2008
// Código    : AL_13
// Pendencia : 27767
// SOL       : 83267
// Desc      : Verificação de Out of Memory do Empréstimo de Ações
//******************************************************************************
// Data      : 11/12/2007
// Código    : AL_12
// Pendencia : 26457
// SOL       : 70157
// Desc      : Ajuste na rotina: IntegraContabCapCar,
//             permitindo passar o plano/patro informado ao invés do logado
//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_11
// Pendencia : 26503
// SOL       : 70689
// Desc      : Substitui a crítica que impede a atualização do empréstimo pela
//             pergunta, para continuar caso deseje.
//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_10
// Pendencia : 26504
// SOL       : 70533
// Desc      : Retirada a critica para acertar a diferença de valores no último
//             dia de atualização. As reversões antes do vencimento causaram divergência
//             no dia do vencimento.
//******************************************************************************
// Data      : 21/09/2007
// Código    : AL_9
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Segregação Plano / Patrocinadora
//                          Reprocessamento
//                          Funcionamento geral
//                          Utilização da CtrlPInv
//******************************************************************************
// Data      : 23/03/2007
// Código    : AL_8
// Desc      : Alterado para True as propriedades AllowClearKey e AutoDropDown das
//            combols;
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_7
// Pendencia : 22982
// Desc      : Implementacao Plano e Patro
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_6
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//*****************************************************************************
//Data	    : 02/05/2006
//Código    : Al_5
//Motivo(S) : Inclusao do Paramentro na IntegraContabCapCar
//******************************************************************************
// Data     : 20/04/2006
// Código   : AL_4
// Motivo   : Ajuste na qyrInvestimentos para buscar investimentos que tenham
//              saldos na data do inicio do reprocessamento
//******************************************************************************
// Data     : 23/06/2005
// Código   : AL_3
// Motivo   : Ajuste no tratamento das datas
//******************************************************************************
// Data     : 17/06/2005
// Código   : AL_2
// Motivo   : Implementação de Reprocessamento (DFM)
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
Unit FFechtoEmp;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
   Db, DBTables, Wwquery, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   Wwdatsrc, uCtrlInvContab, uCtrlParamInvest,
   //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   DbClient, uCMClientDataSet,
   //AL_14
   uCtrlEmpAcoes, uCtrlPadroes, URegra;

Type
   TfrmFechtoEmp = Class(TfrmOkCancelarInv)
      bbtnProcessar: TBitBtn;
      ToolbarSep972: TToolbarSep97;
      qryAux: TwwQuery;
      pnlDados: TPanel;
      lblDtInicio: TLabel;
      dteDataInicio: TCMDateTimePicker;
      lblDtFinal: TLabel;
      dteDataFinal: TCMDateTimePicker;
      cbxDepurar: TCheckBox;
      qryInvestimentos: TwwQuery;
      dblInvestimento: TwwDBLookupCombo;
      pgcFechtoEmp: TPageControl;
      tbsProcesso: TTabSheet;
      lblInvestimento: TLabel;
      lblAtualizaDia: TLabel;
      lblAtualizaInv: TLabel;
      lblInvProc: TLabel;
      lblDia: TLabel;
      prbDatas: TProgressBar;
      prbHistorico: TProgressBar;
      tbsDepurar: TTabSheet;
      pnlDepurarDados: TPanel;
      cbxPassoPasso: TCheckBox;
      pnlDepurarGrid: TPanel;
      dbgHistEmpAcoes: TwwDBGrid;
      qryHistEmpAcoes: TwwQuery;
      dsHistEmpAcoes: TwwDataSource;
      lblMensagem: TfcLabel;
      Label1: TLabel;
      qryTipoOperacaoAtu: TwwQuery;
      qryVencEmpAcoes: TwwQuery;
      qryRevEmpAcoes: TwwQuery;
      qryConfEmpAcoes: TwwQuery;
      qryPlanPrev: TwwQuery;
      dblkPlanPrev: TwwDBLookupCombo;
      lbPlanPrev: TLabel;
      Regra: TRegra;
      //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      Cds: TCMClientDataSet;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnProcessarClick(Sender: TObject);
      Procedure cbxDepurarClick(Sender: TObject);
      Procedure cbxPassoPassoClick(Sender: TObject);
      Procedure dteDataInicioExit(Sender: TObject);
      Procedure dteDataFinalExit(Sender: TObject);
      Procedure dblkPlanPrevExit(Sender: TObject);
   Private
      { Private declarations }
      DataProxFech, DataUltFech: TDateTime;
      Procedure StatusTela(sStatus: Char);
      Function AtualizaEmprestimoAcoes(dDataProc: TDateTime; iPlano: Integer = -1; iInv: Integer = -1; iOperAplic: Integer = -1): boolean;
      Function VerificaDadosTela: Boolean;
      //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      Function CancelaAcao: Boolean;
      //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      Function VerificaVencEmpAcoes(sDataIni, sDataFim: String): Boolean;
      //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      Function VerificaConfEmpAcoes(sDataIni, sDataFim: String): Boolean;
      //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      Function ProcessoManual: Boolean;
      //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
      Function ProcessoImportado: Boolean;

   Public
      { Public declarations }
   End;

Var
   frmFechtoEmp: TfrmFechtoEmp;
   bReprocesso: boolean;
   //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   sTipoProcesso: String;

Implementation

Uses dBaseDados, UMensErro, USistema, UDataBase, UDiasUteisInv, ULancContab,
   UOperComum, UOperacaoInvest, UBibliotecaInvest, uEmprestAcoes,
   dEmprestAcoes;

{$R *.DFM}

Procedure TfrmFechtoEmp.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin

   // Caso o Banco esteja em Transacao Rollbacka
   If DtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If MsgDlg('O Processo NÂO foi Confirmado, Continuar ira Desfazer o Processamento.' + #13 +
            'Continua ?', 'Mensagem do Sistema', mtInformation, [MbYes, MbNo], 0) = mrNo Then
            Exit;
         DtmBaseDados.dbBaseDados.Rollback;
      End;

   // Fechar Queries
   qryInvestimentos.Close;
   qryTipoOperacaoAtu.Close;
   //AL_7
   qryPlanPrev.Close;
   //AL_14
   //AL_13
   DMEmprestAcoes.qryBuscaSaldoHist.Close;
   DMEmprestAcoes.qryExisteOperacoes.Close;
   DMEmprestAcoes.qryExisteOperacoes.Close;
   qryHistEmpAcoes.Close;
   Inherited;
End;

Procedure TfrmFechtoEmp.FormShow(Sender: TObject);
//Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
Var _CdsDtVig: TCMClientDataSet;
   CtrlEmpAcoes: TCtrlEmpAcoes;
   dDataVig: TDateTime;
Begin
   Inherited;
   StatusTela('N');

   //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);

   _CdsDtVig := TCMClientDataSet.Create(Nil);

   // Caso Nao exista ultimo fechamento Cria com a Última Operação no histórico
   //AL_9
   If CtrlPInv.DataUltFechEmp = 0 Then
      Begin
         dteDataInicio.Text := DateToStr(Date);
         dteDataFinal.Text := DateToStr(Date);
      End
   Else
      Begin
         //AL_9
         DataProxFech := CtrlPInv.DataUltFechEmp + 1;
         While Not DiasUteisInv.DiaUtil(DataProxFech, -1, 1, '', True, False, False) Do
            DataProxFech := DataProxFech + 1;
         dteDataInicio.Text := DateToStr(DataProxFech);
         dteDataFinal.Text := DateToStr(DataProxFech);
      End;

   //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   dDataVig := CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date());
   If dDataVig > StrToDate(dteDataInicio.Text) Then
      Begin
         dteDataInicio.Text := DateToStr(dDataVig);
         dteDataFinal.Text := DateToStr(dDataVig);
      End;

   pgcFechtoEmp.ActivePage := tbsProcesso;
   cbxDepurar.Checked := False;
   cbxDepurarClick(self);
   cbxPassoPasso.Checked := False;
   cbxPassoPassoClick(self);
   qryInvestimentos.Close;
   qryInvestimentos.ParamByName('SDATAINI').AsString := dteDataInicio.Text;
   qryInvestimentos.ParamByName('SDATAFIM').AsString := dteDataFinal.Text;
   qryInvestimentos.Open;
   qryTipoOperacaoAtu.Open;
   //AL_7
   qryPlanPrev.Open;

   //Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253
   sTipoProcesso := 'M';

   Cds.Data := CtrlEmpAcoes.ListLancVigEmp(0, StrToDate(dteDataFinal.Text));

   _CdsDtVig.Data := CtrlEmpAcoes.ListLancVigEmp(0, StrToDate(dteDataFinal.Text));

   If Not _CdsDtVig.IsEmpty Then
      Begin
         //      lblDtInicio.Enabled := (_CdsDtVig.FieldByName('TIPOLANC').AsString = 'M');
         //      dteDataInicio.Enabled := (_CdsDtVig.FieldByName('TIPOLANC').AsString = 'M');
         sTipoProcesso := _CdsDtVig.FieldByName('TIPOLANC').AsString;
      End;

   _CdsDtVig.Close;

   FreeAndNil(_CdsDtVig);
   FreeAndNil(CtrlEmpAcoes);
End;

Procedure TfrmFechtoEmp.bbtnConfirmarClick(Sender: TObject);
Begin
   Inherited;

   StatusTela('N');

   // Guarda a Data do Ultimo Fechamento
   ExecutaQuery(QryAux, 'UPDATE PARAMINVEST SET DATAULTFECHEMP = TO_DATE(''' + dteDataFinal.Text + ''',''DD/MM/YYYY'')');

   // Caso o Banco esteja em Transacao Commita
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Commit;

   //AL_9 - Ini
   // Preenche Datas com o ultimo fechamento + 1
   //AL_14
   CtrlPInv.GetParamsInvest(CtrlPInv.IDEmpresa);
   DataProxFech := DiasUteisInv.PrimeiroDiaUtilPosterior(CtrlPInv.DataUltFechEmp, -1, 1, '', True, False, False);
   dteDataInicio.Date := DataProxFech;
   dteDataFinal.Date := DataProxFech;
   //AL_9 - Fim

   qryInvestimentos.Close;
   qryInvestimentos.ParamByName('SDATAINI').AsString := dteDataInicio.Text;
   qryInvestimentos.ParamByName('SDATAFIM').AsString := dteDataFinal.Text;
   qryInvestimentos.Open;

   // Desabilita Botões
   bbtnCancelar.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnProcessar.Enabled := True;

End;

Procedure TfrmFechtoEmp.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;

   // Caso o Banco esteja em Transacao Rollbacka
   If DtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If MsgDlg('O Processo NÂO foi Confirmado, Continuar ira Desfazer o Processamento.' + #13 +
            'Continua ?', 'Mensagem do Sistema', mtInformation, [MbYes, MbNo], 0) = mrNo Then
            Exit;
         DtmBaseDados.dbBaseDados.Rollback;
      End;

   StatusTela('N');

   // Caso Nao exista ultimo fechamento Cria com a Última Operação no histórico
   //AL_9
   If CtrlPInv.DataUltFechEmp = 0 Then
      Begin

      End
   Else
      Begin
         //AL_9
         DataProxFech := DiasUteisInv.PrimeiroDiaUtilPosterior(CtrlPInv.DataUltFechEmp, -1, 1, '', True, False, False);
         dteDataInicio.Date := DataProxFech;
         dteDataFinal.Date := DataProxFech;
      End;
End;

Procedure TfrmFechtoEmp.bbtnSairClick(Sender: TObject);
Begin
   //AL_9 - Retirada de testes desnecessários - Já são feitos no CancelarClick
   // Executa Botao Cancelar
   bbtnCancelarClick(Self);
   Inherited;
End;

//Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253

Procedure TfrmFechtoEmp.bbtnProcessarClick(Sender: TObject);
Begin
   If Not VerificaDadosTela Then
      Exit;

   If sTipoProcesso = 'M' Then
      Begin
         If Not ProcessoManual Then
            exit;
      End
   Else
      Begin
         If Not ProcessoImportado Then
            exit;
      End;

   bbtnConfirmar.Click;

   MsgDlg('Processo concluído com sucesso.', 'Mensagem do Sistema ', mtInformation, [MbOk], 0);

End;

Procedure TfrmFechtoEmp.StatusTela(sStatus: Char);
Begin
   Case sStatus Of
      'N': // Status Normal - Botão Processa habilitado
         Begin
            bbtnProcessar.Enabled := True;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled := False;
            prbDatas.Position := 0;
            prbHistorico.Position := 0;
            lblMensagem.Caption := '';
            lblDia.Caption := '';
            lblInvestimento.Caption := '';
         End;
      'P': // Status Processando - Todos os Botões Desabilitados
         Begin
            bbtnProcessar.Enabled := False;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled := False;
            lblMensagem.Caption := 'Atualizando...';
         End;
      'C': // Status Processo Concluído - Botôes OK e Cancelar habilitados
         Begin
            bbtnProcessar.Enabled := False;
            If cbxDepurar.Checked = False Then
               bbtnConfirmar.Enabled := True
            Else
               bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled := True;
            lblMensagem.Caption := ''; //'Processamento Concluído Com Sucesso.';
         End;
   End;
   //AL_14
   Self.Update;
   //Application.ProcessMessages;
End;

//AL_9

Function TfrmFechtoEmp.AtualizaEmprestimoAcoes(dDataProc: TDateTime; iPlano: Integer = -1; iInv: Integer = -1; iOperAplic: Integer = -1): boolean;
Var
   //AL_7
   //AL_9
   //AL_14
   fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo, fSldHist, fSldQtdHist, fResult, fPrincipal: Double;

   iIdHistEmpAcoes, iPlanilha, iDocumento, iInvestimento, iOperEmpAplic, i,
      iPlanPrev: Integer;

   dDataDia: TDateTime;

   sHistorico, sErro: String;

   CtrlEmpAcoes: TCtrlEmpAcoes;

   sDecSep: Char;
Begin
   // AL_9 - Ini - Usa um finally para destruir o Regra
   //              Ajustes nas mensagens de erro
   Try
      //AL_14
      Result := False;

      //AL_14
      CtrlEmpAcoes := TCtrlEmpAcoes.Create;
      CtrlEmpAcoes.InitializeAs(Padroes);

      If Trim(dblInvestimento.Text) = '' Then
         Begin
            iInvestimento := -1;
            iOperEmpAplic := -1;
         End
      Else
         Begin
            iInvestimento := qryInvestimentos.FieldByName('IDINVESTIMENTO').AsInteger;
            iOperEmpAplic := qryInvestimentos.FieldByName('IDOPEREMPACOESAP').AsInteger;
         End;

      //AL_7
      If Trim(dblkPlanPrev.Text) = '' Then
         iPlanPrev := -1
      Else
         iPlanPrev := qryInvestimentos.FieldByName('IDPLANPREVCTBPATR').AsInteger;

      //AL_9 - Se foi passado um parametro, ignora o informado na tela, faz o parâmetro
      If iPlano > 0 Then
         iPlanPrev := iPlano;
      If iInv > 0 Then
         iInvestimento := iInv;
      If iOperAplic > 0 Then
         iOperEmpAplic := iOperAplic;

      //AL_14
      If Not EmprestAcoes.BuscaSaldosHist(dDataProc, iInvestimento, iOperEmpAplic, -1,
         //AL_7
         iPlanPrev,
         fSldHist, fSldQtdHist) Then
         Raise Exception.Create('Não foi possível buscar os saldos de empréstimo de ações')
      Else
         Begin
            // Calcula a Atualizacao do Emprestimo
            //AL_9
            If Not bReprocesso Then
               Begin
                  prbHistorico.Max := DMEmprestAcoes.qryBuscaSaldoHist.RecordCount;
                  prbHistorico.Position := 0;
               End;

            While Not DMEmprestAcoes.qryBuscaSaldoHist.Eof Do
               Begin

                  lblInvestimento.Caption := DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DESCINVESTIMENTO').AsString + ' / ' +
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('PLANPRVCONTABPATRO').AsString;
                  //AL_14
                  Self.Update;
                  //Application.ProcessMessages;

                  // Verifica se Existe Saldo para a Operação
                  // Esta verificação não é mais feita no form de Operação
                  // Pega somente registros de APLICAÇÃO
                  If DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('NATURMOV').AsString = 'A' Then
                     Begin
                        EmprestAcoes.VerificaSaldoCustodia(DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DATAOPERACAO').AsDateTime,
                           DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                           DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDINVESTIMENTO').AsInteger,
                           DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDCUSTODIANTE').AsInteger,
                           DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDOPEREMPACOES').AsInteger,
                           fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo);
                        If (fSaldoBloq - fSaldoHist) < DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('QTDOPERACAOAPLIC').AsFloat Then
                           Raise Exception.Create('Foi Cadastrado para o Investimento ' + lblInvestimento.Caption + #13 +
                              'um Empréstimo de ' + FormatFloat('###,###,###,###,###', DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('QTDOPERACAOAPLIC').AsFloat) + ' Ações.' + #13 +
                              'no dia ' + DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DATAOPERACAO').AsString + '.' + #13 +
                              'Não Existe Saldo Suficiente Bloqueado na Custódia para esta Operação.');
                     End;
                  // Não atualiza na data da aplicação
                  If (DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DATAOPERACAO').AsDateTime = dDataProc) And
                     (DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('NATURMOV').AsString = 'A') Then
                     Begin
                        //AL_9
                        If Not bReprocesso Then
                           prbHistorico.StepIt;
                        DMEmprestAcoes.qryBuscaSaldoHist.Next;
                        Continue;
                     End;
                  // Montar SQL
                  DMEmprestAcoes.qryAux.SQL.Clear;

                  //AL_14 - Passa a calcular o Juros acumulado no período
                  DMEmprestAcoes.qryAux.SQL.Add('SELECT ');
                  DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy', DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DATAOPERACAO').AsDateTime)) + ' AS DATAEMISSAO,');
                  //AL_14 - Período para jurtos acumulado
                  DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy', dDataProc)) + ' AS DATAATUAL,');
                  DMEmprestAcoes.qryAux.SQL.Add(QuotedStr('N') + ' AS NATUREZAOPER,');
                  //AL_14 - Testar este novo campo de saldo de principal
                  fPrincipal := DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('SLDPRINCIPAL').AsFloat;
                  DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##', fPrincipal)) + ' AS VLRPRINCIPAL,');
                  DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##', DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('TAXAOPERACAO').AsFloat)) + ' AS TAXA,');
                  DMEmprestAcoes.qryAux.SQL.Add('1 AS IDPAIS,');
                  DMEmprestAcoes.qryAux.SQL.Add('-1 AS IDCIDADES,');
                  DMEmprestAcoes.qryAux.SQL.Add('-1 AS CODESTADO');
                  DMEmprestAcoes.qryAux.SQL.Add('FROM DUAL');
                  DMEmprestAcoes.qryAux.Open;

                  Regra.RuleName := IntToStr(CtrlPInv.IdRegraEmpAcoes);
                  Regra.QueryIn := DMEmprestAcoes.qryAux;
                  //AL_14
                  Try
                     sDecSep := DecimalSeparator;
                     Try
                        If cbxPassoPasso.Checked Then
                           Regra.PassoaPasso
                        Else
                           Regra.Execute;
                     Except
                        On E: Exception Do
                           Raise Exception.Create('Houve um problema ao calcular o Valor de Resgate.' + #13 +
                              'Mensagem: ' + E.Message);
                     End;
                  Finally
                     DecimalSeparator := sDecSep;
                  End;
                  //AL_10
                  //03/10/2007 - A apuração do juros continua sendo o result da regra até o dia do vencimento, devido a reversão
                  //             antes do vencimento
                  // Acerta a diferença de valores no último dia de atualização
                  {if dDataProc = DMEmprestAcoes.qryBuscaSaldoHistDATAVENCOPER.AsDateTime then
                     fResult := DMEmprestAcoes.qryBuscaSaldoHistVLRRESGATE.AsFloat - DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat
                  else}

                  //AL_14 - Retorna valor acumulado
                  fResult := StrToFloat(TrocaPontoVirgula(Regra.Result));
                  //AL_14 - Diminui do saldo anterior para ter o valor de juros
                  fResult := fResult - DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('SLDJUROS').AsFloat;

                  //AL_14
                  // Grava Histórico
                  If Not CtrlEmpAcoes.GravaHistEmpAcoes(-1, dDataProc,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDOPEREMPACOESAP').AsInteger,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDINVESTIMENTO').AsInteger,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                     fResult) Then
                     Raise Exception.Create('Ocorreu um problema ao gravar o histórico da atualização' + #13 +
                        'Mensagem: ' + CtrlEmpAcoes.MessageInfo);

                  // Integra Contabiliza / Financeiro
                  sHistorico := qryTipoOperacaoAtu.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' +
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DESCINVESTIMENTO').AsString;

                  iPlanilha := -1;
                  iDocumento := -1;
                  //AL_5
                  //AL_9
                  //AL_14
                  If Not EmprestAcoes.IntegraContabCapCar(CtrlEmpAcoes.IdHistEmpAcoes, //    iIdHistEmpAcoes,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDINVESTIMENTO').AsInteger,
                     -54,
                     CtrlPInv.IdCartEmpAcoes,
                     qryTipoOperacaoAtu.FieldByName('FLGGERACONTAB').AsInteger,
                     qryTipoOperacaoAtu.FieldByName('FLGGERACAPCAR').AsInteger,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDCUSTODIANTE').AsInteger,
                     qryTipoOperacaoAtu.FieldByName('CODTIPDOC').AsInteger,
                     -1,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('DESCINVESTIMENTO').AsString,
                     sHistorico,
                     fResult,
                     0,
                     dDataProc,
                     dDataProc,
                     iPlanilha,
                     iDocumento,
                     //AL_12
                     0,
                     DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('IDPLANPREVCTBPATR').AsInteger) Then
                     Raise Exception.Create('Não foi possível integrar o Contábil/Financeiro.');
                  If Not bReprocesso Then
                     prbHistorico.StepIt;
                  DMEmprestAcoes.qryBuscaSaldoHist.Next;
               End;

            //Busca Operações sem Histórico no Dia
            //AL_9 - Volta a relançar o histórico da operação após o lançamento da atualização
            OperComum.LimpaParametros(DMEmprestAcoes.qryExisteOperacoes, True);
            DMEmprestAcoes.qryExisteOperacoes.ParamByName('dDataProc').AsString := DateToStr(dDataProc);
            If Trim(dblInvestimento.Text) <> '' Then
               Begin
                  DMEmprestAcoes.qryExisteOperacoes.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
                  DMEmprestAcoes.qryExisteOperacoes.ParamByName('IDOPEREMPACOESAP').AsInteger := iOperAplic;
               End;
            DMEmprestAcoes.qryExisteOperacoes.Open;
            While Not DMEmprestAcoes.qryExisteOperacoes.Eof Do
               Begin
                  //AL_9 - Nova rotina para verificar se existe saldo para relançar uma reversão
                  If DMEmprestAcoes.qryExisteOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
                     Begin
                        If EmprestAcoes.VerSaldoOper(DMEmprestAcoes.qryExisteOperacoes.FieldByName('DATAOPERACAO').AsDateTime,
                           DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDOPEREMPACOESAP').AsInteger) < DMEmprestAcoes.qryExisteOperacoes.FieldByName('QTDOPERACAO').AsFloat Then
                           Raise Exception.Create('Foi Cadastrado para o Investimento ' + DMEmprestAcoes.qryExisteOperacoes.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                              'um(a) ' + DMEmprestAcoes.qryExisteOperacoes.FieldByName('DESCTIPOOPERACAO').AsString + #13 +
                              'de ' + FormatFloat('###,###,###,###,###', DMEmprestAcoes.qryExisteOperacoes.FieldByName('QTDOPERACAO').AsFloat) + ' Ações ' +
                              'no dia ' + DMEmprestAcoes.qryExisteOperacoes.FieldByName('DATAOPERACAO').AsString + '.' + #13 +
                              'Não Existe Saldo Suficiente para Refazer o Histórico desta Operação.' + #13 +
                              'Saldo: ' + FormatFloat('###,###,###,###,##0', fSaldo));
                     End;

                  //AL_14
                  If Not CtrlEmpAcoes.GravaHistEmpAcoes(DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDOPEREMPACOES').AsInteger) Then
                     Raise Exception.Create('Ocorreu um problema ao gravar o histórico de uma operação' + #13 +
                        'Mensagem: ' + CtrlEmpAcoes.MessageInfo);

                  DMEmprestAcoes.qryExisteOperacoes.Next;
               End;
            DMEmprestAcoes.qryExisteOperacoes.Close;
            //AL_14
            Result := True;
         End;
   Finally
      //AL_13
      //AL_14
      Regra.LimpaVariaveis;
      Regra.RefazAmbiente;
      FreeAndNil(CtrlEmpAcoes);
      DMEmprestAcoes.qryAux.Close;
      DMEmprestAcoes.qryExisteOperacoes.Close;
      DMEmprestAcoes.qryBuscaSaldoHist.Close;
   End;
   //AL_9 - Fim
End;

Procedure TfrmFechtoEmp.cbxDepurarClick(Sender: TObject);
Begin
   Inherited;
   If cbxDepurar.Checked Then
      Begin
         tbsDepurar.TabVisible := True;
         dteDataFinal.Text := dteDataInicio.Text;
      End
   Else
      tbsDepurar.TabVisible := False;

End;

Procedure TfrmFechtoEmp.cbxPassoPassoClick(Sender: TObject);
Begin
   Inherited;
   If cbxDepurar.Checked Then
      Begin
         tbsDepurar.TabVisible := True;
         pgcFechtoEmp.ActivePage := tbsDepurar;
         dteDataFinal.Text := dteDataInicio.Text;
      End
   Else
      tbsDepurar.TabVisible := False;

End;

Function TfrmFechtoEmp.VerificaDadosTela: Boolean;
Begin
   Result := False;
   bReprocesso := False;
   If (Trim(dteDataInicio.Text) = '') Or (Trim(dteDataFinal.Text) = '') Then
      Begin
         MsgDlg('As Datas de Início e Fim devem ser Preenchidas!',
            'Mensagem do Sistema ', mtWarning, [MbOk], 0);
         If Trim(dteDataInicio.Text) = '' Then
            Begin
               If dteDataInicio.CanFocus Then
                  dteDataInicio.SetFocus;
            End
         Else
            Begin
               If dteDataFinal.CanFocus Then
                  dteDataFinal.SetFocus;
            End;
         Exit;
      End;

   If dteDataFinal.Date < dteDataInicio.Date Then
      Begin
         MsgDlg('A Data Inicial Deve Ser Menor ou Igual a Data Final!',
            'Mensagem do Sistema ', mtWarning, [MbOk], 0);
         If dteDataFinal.CanFocus Then
            dteDataFinal.SetFocus;
         Exit;
      End;

   // AL_1
   //AL_6
   If Not CtrlInvContab.TestaPeriodo(dteDataInicio.Text, 2, 5) Then
      Begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         If dteDataInicio.CanFocus Then
            dteDataInicio.SetFocus;
         Exit;
      End;

   If (cbxDepurar.Checked = True) And (Trim(dblInvestimento.Text) = '') Then
      Begin
         MsgDlg('Para Depurar é Necessário Escolher um Investimento',
            'Mensagem do Sistema ', mtWarning, [MbOk], 0);
         If dblInvestimento.CanFocus Then
            dblInvestimento.SetFocus;
         Exit;
      End;

   //Al_14 - Para depurar não precisa criticar estas informações
   If Not cbxDepurar.Checked Then
      Begin
         If Trim(dblInvestimento.Text) <> '' Then
            Begin
               //AL_9
               If dteDataFinal.DateTime > CtrlPInv.DataUltFechEmp Then
                  Begin
                     MsgDlg('Não é Possível Fechar Dia Novo para um Investimento Somente !',
                        'Mensagem do Sistema ', mtWarning, [MbOk], 0);
                     Exit;
                  End;
               //AL_9
               If dteDataFinal.DateTime < CtrlPInv.DataUltFechEmp Then
                  Begin
                     MsgDlg('Só é Possível Reprocessar um Investimento Finalizando na Data do Último Fechamento !',
                        'Mensagem do Sistema ', mtWarning, [MbOk], 0);
                     Exit;
                  End;
               If (MsgDlg('Será efetuado o fechamento somente de:' + #13 +
                  qryInvestimentos.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                  'Continua?',
                  'Mensagem do Sistema', mtConfirmation, [MbYes, MbNo], 0) = MrNo) Then
                  Exit
               Else
                  bReprocesso := True;
            End;
      End;

   If dteDataInicio.DateTime <= CtrlPInv.DataUltFechEmp Then
      bReprocesso := True;

   Result := True;

End;

Procedure TfrmFechtoEmp.dteDataInicioExit(Sender: TObject);
Begin
   Inherited;
   //AL_9
   If dteDataInicio.DateTime < (CtrlPInv.DataUltFechEmp + 1) Then
      dteDataFinal.DateTime := CtrlPInv.DataUltFechEmp;
   //Al_3
   If dteDataFinal.DateTime < dteDataInicio.DateTime Then
      dteDataInicio.DateTime := dteDataFinal.DateTime;

   qryInvestimentos.Close;
   qryInvestimentos.ParamByName('SDATAINI').AsString := dteDataInicio.Text;
   qryInvestimentos.ParamByName('SDATAFIM').AsString := dteDataFinal.Text;
   qryInvestimentos.Open;

End;

Function TfrmFechtoEmp.CancelaAcao: Boolean;
Begin
   Try
      If DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.Rollback;

      StatusTela('N');

      // Caso Nao exista ultimo fechamento Cria com a Última Operação no histórico
      //AL_9
      If CtrlPInv.DataUltFechEmp = 0 Then
         Begin

         End
      Else
         Begin
            //AL_9
            DataProxFech := DiasUteisInv.PrimeiroDiaUtilPosterior(CtrlPInv.DataUltFechEmp, -1, 1, '', True, False, False);
            dteDataInicio.Date := DataProxFech;
            dteDataFinal.Date := DataProxFech;
         End;
      Result := True;
   Except
      Result := False;
   End;
End;

Function TfrmFechtoEmp.VerificaVencEmpAcoes(sDataIni, sDataFim: String): Boolean;
Var
   dData: TDateTime;
Begin
   //AL_14
   Try
      Result := True;
      //AL_9
      dData := CtrlPInv.DataUltFechEmp;
      While dData < StrToDate(dteDataFinal.Text) Do
         Begin
            // Verifica se existem Operações de Empréstimo vencendo na Data.
            OperComum.LimpaParametros(qryVencEmpAcoes);
            qryVencEmpAcoes.ParamByName('DATA').AsString := DateToStr(dData);
            qryVencEmpAcoes.Open;

            While Not qryVencEmpAcoes.Eof Do
               Begin
                  // Procura Reversão da operação Vencendo na data.
                  OperComum.LimpaParametros(qryRevEmpAcoes);
                  qryRevEmpAcoes.ParamByName('IDINVESTIMENTO').AsInteger := qryVencEmpAcoes.FieldByName('IDINVESTIMENTO').AsInteger;
                  qryRevEmpAcoes.ParamByName('IDOPEREMPACOESAP').AsInteger := qryVencEmpAcoes.FieldByName('IDOPEREMPACOES').AsInteger;
                  qryRevEmpAcoes.Open;
                  If qryRevEmpAcoes.IsEmpty Then
                     Begin
                        // Operação de Empréstimo Vencendo não Revertida
                        Result := False;
                        Exit;
                     End;
                  qryVencEmpAcoes.Next;
               End;
            //AL_9
            dData := DiasUteisInv.PrimeiroDiaUtilPosterior(dData, -1, 1, '', True, False, False);
         End;
   Finally
      qryRevEmpAcoes.Close;
      qryVencEmpAcoes.Close;
   End;
End;

Function TfrmFechtoEmp.VerificaConfEmpAcoes(sDataIni, sDataFim: String): Boolean;
Begin
   //AL_13
   //AL_14
   Try
      Result := True;
      // Verifica se existem Operações de Empréstimo vencendo na Data.
      OperComum.LimpaParametros(qryConfEmpAcoes);
      qryConfEmpAcoes.ParamByName('DATAINI').AsString := sDataIni;
      qryConfEmpAcoes.ParamByName('DATAFIM').AsString := sDataFim;
      qryConfEmpAcoes.Open;

      If Not qryConfEmpAcoes.IsEmpty Then
         Begin
            // Operação de Empréstimo não confirmadas
            Result := False;
            Exit;
         End;
   Finally
      qryConfEmpAcoes.Close;
   End;
End;

Procedure TfrmFechtoEmp.dteDataFinalExit(Sender: TObject);
Begin
   Inherited;
   //Al_3
   //AL_9
   If dteDataInicio.DateTime < (CtrlPInv.DataUltFechEmp) Then
      dteDataFinal.DateTime := CtrlPInv.DataUltFechEmp;

   If dteDataFinal.DateTime < (CtrlPInv.DataUltFechEmp) Then
      dteDataFinal.DateTime := CtrlPInv.DataUltFechEmp;

   If dteDataFinal.DateTime < dteDataInicio.DateTime Then
      dteDataInicio.DateTime := dteDataFinal.DateTime;
   //Al_3 - Fim
   qryInvestimentos.Close;
   qryInvestimentos.ParamByName('SDATAINI').AsString := dteDataInicio.Text;
   qryInvestimentos.ParamByName('SDATAFIM').AsString := dteDataFinal.Text;
   qryInvestimentos.Open;

End;

Procedure TfrmFechtoEmp.dblkPlanPrevExit(Sender: TObject);
Begin
   Inherited;
   OperComum.LimpaParametros(qryInvestimentos);
   qryInvestimentos.ParamByName('SDATAINI').AsString := dteDataInicio.Text;
   qryInvestimentos.ParamByName('SDATAFIM').AsString := dteDataFinal.Text;
   If Trim(dblkPlanPrev.text) <> '' Then
      qryInvestimentos.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;
   qryInvestimentos.Open;
End;

//Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253

Function TfrmFechtoEmp.ProcessoManual: Boolean;
Var dDataProc: TDateTime;
   iNumDias, iIdOperEmpAp, iPlanPrev, iInvestimento: Integer;
   qryBuscaMarcados: TwwQuery;
Begin
   Inherited;
   Result := True;
   //AL_9 - Ini
   Try
      Try
         //AL_14
         If bReprocesso Then
            Begin
               //AL_14
               If Trim(dblkPlanPrev.Text) <> '' Then
                  iPlanPrev := qryPlanPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger
               Else
                  iPlanPrev := -1;

               If Trim(dblInvestimento.Text) <> '' Then
                  Begin
                     iIdOperEmpAp := qryInvestimentos.FieldByName('IDOPEREMPACOESAP').AsInteger;
                     iInvestimento := qryInvestimentos.FieldByName('IDINVESTIMENTO').AsInteger;
                     iPlanPrev := qryInvestimentos.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  End
               Else
                  Begin
                     iIdOperEmpAp := -1;
                     iInvestimento := -1;
                  End;

               //Abre uma transação para marcar os investimentos para reprocessamento
               If Not DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.StartTransaction;

               EmprestAcoes.MarcaFlgReproc(dteDataInicio.DateTime, iIdOperEmpAp, iInvestimento, iPlanPrev);

               //Comita a transação que marca os investimentos para reprocessamento
               DtmBaseDados.dbBaseDados.Commit;

            End;

         // Verifica se existem investimentos para serem reprocessados
         qryBuscaMarcados := TwwQuery.Create(Application);
         qryBuscaMarcados.DatabaseName := 'BaseDados';
         qryBuscaMarcados.SQL.Add('SELECT MIN(H.DATAHISTEMPACOES) AS DATAHISTEMPACOES, H.IDPLANPREVCTBPATR, H.IDINVESTIMENTO, H.IDOPEREMPACOESAP, I.DESCINVESTIMENTO');
         qryBuscaMarcados.SQL.Add('FROM HISTEMPACOES H, INVESTIMENTO I');
         qryBuscaMarcados.SQL.Add('WHERE H.FLGRECALC = ''S''');
         qryBuscaMarcados.SQL.Add('  AND H.DATAHISTEMPACOES <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', CtrlPInv.DataUltFechEmp)) + ', ' + QuotedStr('dd/mm/yyyy') + ')');
         qryBuscaMarcados.SQL.Add('  AND H.IDINVESTIMENTO = I.IDINVESTIMENTO');
         qryBuscaMarcados.SQL.Add('GROUP BY H.IDPLANPREVCTBPATR, H.IDINVESTIMENTO, I.DESCINVESTIMENTO, H.IDOPEREMPACOESAP');
         qryBuscaMarcados.SQL.Add('ORDER BY DATAHISTEMPACOES, H.IDPLANPREVCTBPATR, H.IDINVESTIMENTO, H.IDOPEREMPACOESAP');
         qryBuscaMarcados.Open;

         If Not qryBuscaMarcados.IsEmpty Then
            Begin
               If Not bReprocesso Then
                  Begin
                     If OperComum.InvMsgBox('Existem investimentos a serem reprocessados', mtWarning, 'Mensagem do Sistema',
                        [mbYes, mbCancel], 'Reprocessa;Cancela') = mrCancel Then
                        Raise Exception.Create('Processo cancelado pelo usuário');
                  End;

               // Inicia o reprocessamento dos investimentos marcados
               prbHistorico.Max := qryBuscaMarcados.RecordCount;
               prbHistorico.Position := 0;
               StatusTela('P');
               While Not qryBuscaMarcados.eof Do
                  Begin
                     iInvestimento := qryBuscaMarcados.FieldByName('IDINVESTIMENTO').AsInteger;
                     iIdOperEmpAp := qryBuscaMarcados.FieldByName('IDOPEREMPACOESAP').AsInteger;
                     iPlanPrev := qryBuscaMarcados.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                     dDataProc := qryBuscaMarcados.FieldByName('DATAHISTEMPACOES').AsDateTime;

                     //Abre uma transação para exclusão dos históricos posteriores
                     If Not DtmBaseDados.dbBaseDados.InTransaction Then
                        DtmBaseDados.dbBaseDados.StartTransaction;

                     If Not EmprestAcoes.ExcluiHistEmpAcoes(iIdOperEmpAp, iPlanPrev, dDataProc) Then
                        Raise Exception.Create('Não foi possível excluir os históricos posteriores');

                     iNumdias := DiasUteisInv.IntervaloDiasUteis(qryBuscaMarcados.FieldByName('DATAHISTEMPACOES').AsDateTime,
                        CtrlPInv.DataUltFechEmp, -1, 1, '', True, False, False);
                     prbDatas.Max := iNumdias + 1;
                     prbDatas.Position := 0;

                     While dDataProc <= CtrlPInv.DataUltFechEmp Do
                        Begin
                           //AL_14
                           lblDia.Caption := DateToStr(dDataProc);
                           Self.Update;
                           //Application.ProcessMessages;

                           //Abre uma transação para cada dia a ser atualizado
                           If Not DtmBaseDados.dbBaseDados.InTransaction Then
                              DtmBaseDados.dbBaseDados.StartTransaction;

                           If Not AtualizaEmprestimoAcoes(dDataProc, iPlanPrev, iInvestimento, iIdOperEmpAp) Then
                              Raise Exception.Create('Não foi possível reprocessar ' + chr(13) +
                                 qryBuscaMarcados.FieldByName('DESCINVESTIMENTO').AsString + chr(13) +
                                 'no dia ' + DateToStr(dDataProc));
                           dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc, -1, 1, '', True, False, False);

                           //Comita a transação da atualização diária
                           DtmBaseDados.dbBaseDados.Commit;

                           //AL_14
                           prbDatas.StepIt;
                           Self.Update;
                           //Application.ProcessMessages;
                        End;

                     //Comita a transação para exclusão dos históricos posteriores
                     If DtmBaseDados.dbBaseDados.InTransaction Then
                        DtmBaseDados.dbBaseDados.Commit;

                     qryBuscaMarcados.Next;
                     prbHistorico.StepIt;
                  End;
               StatusTela('C');
            End;
      Except
         On E: Exception Do
            Begin
               CancelaAcao;
               MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
               Result := False;
            End;
      End;
   Finally
      qryBuscaMarcados.Close;
      FreeAndNil(qryBuscaMarcados);
   End;

   If Not Result Then
      Exit;

   If Not bReprocesso Then
      Begin
         //Al_14
         Try
            // Testa se existem operações de empréstimo vencidas e não revertidas
            If Not VerificaVencEmpAcoes(dteDataInicio.Text, dteDataFinal.Text) Then
               Begin
                  //AL_11
                  If (MsgDlg('Existem Operações de Empréstimo Vencidas e não Revertidas no Período. Deseja continuar?',
                     'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
                     Begin
                        dteDataFinal.SetFocus;
                        Raise Exception.Create('Operação cancelada pelo usuário');
                     End;
               End;

            dDataProc := StrToDate(dteDataInicio.Text);
            iIdOperEmpAp := -1;
            iPlanPrev := -1;

            If Not DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.StartTransaction;

            // AL_2 - Inicio
            //AL_7
            // Exclui Registros posteriores
            If Not EmprestAcoes.ExcluiHistEmpAcoes(iIdOperEmpAp, iPlanPrev, dDataProc) Then
               Raise Exception.Create('Não foi possível excluir as atualizações posteriores');

            StatusTela('P');

            // AL_2
            iNumdias := DiasUteisInv.IntervaloDiasUteis(dteDataInicio.DateTime, dteDataFinal.DateTime, -1, 1, '', True, False, False);
            prbDatas.Max := iNumdias + 1;
            // AL_2 - Fim
            prbDatas.Position := 0;

            While dDataProc <= StrToDate(dteDataFinal.Text) Do
               Begin

                  If Not DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.StartTransaction;

                  //AL_14
                  lblDia.Caption := DateToStr(dDataProc);
                  Self.Update;
                  //Application.ProcessMessages;

                  If Not AtualizaEmprestimoAcoes(dDataProc) Then
                     Raise Exception.Create('Não foi possível atualizar um investimento');

                  // Se não estiver Depurando
                  If cbxDepurar.Checked = False Then
                     Begin
                        //AL_9 - ini
                        // Se Data de Processamento for maior que o último Fechamento
                        If dDataProc > CtrlPInv.DataUltFechEmp Then
                           Begin
                              //AL_14
                              //Altera se a data de Fechamento
                              If Not ExecutarQuery(qryAux, 'UPDATE PARAMINVEST SET DATAULTFECHEMP = TO_DATE(''' + DateToStr(dDataProc) + ''',''DD/MM/YYYY'')') Then
                                 Raise Exception.Create('Não foi possível alterar a Data de Fechamento.');
                              CtrlPInv.GetParamsInvest(CtrlPInv.IdEmpresa);
                           End;
                        //AL_9 - Fim
                     End;

                  // Próxima Dia Útil
                  dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc, -1, 1, '', True, False, False);

                  // Move Barra de Progresso de Dias
                  //AL_14
                  prbDatas.StepIt;
                  Self.Update;
                  //Application.ProcessMessages;
               End;

            StatusTela('C');

            If cbxDepurar.Checked Then
               Begin
                  OperComum.LimpaParametros(qryHistEmpAcoes);
                  qryHistEmpAcoes.ParamByName('IDOPEREMPACOESAP').AsInteger := qryInvestimentos.FieldByName('IDOPEREMPACOESAP').AsInteger;
                  qryHistEmpAcoes.Open;
                  qryHistEmpAcoes.Last;
                  pgcFechtoEmp.ActivePage := tbsDepurar;
               End;
            //AL_13
            qryHistEmpAcoes.Close;

         Except
            On E: Exception Do
               Begin
                  MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                  CancelaAcao;
                  Result := False;
               End;
         End;
      End;
   //AL_9 - Fim
End;

//Ricardo Cristiano - 24/02/2011 - N. Sol 84432 -  N. Kintana 523253

Function TfrmFechtoEmp.ProcessoImportado: Boolean;
Var dDataProc: TDateTime;
   iNumDias, iPlanPrev, iInvestimento: Integer;
   CtrlEmpAcoes: TCtrlEmpAcoes;
Begin
   //fazer o periodo
   //buscar o dia e atualizar o juros do dia
   Try
      Try
         CtrlEmpAcoes := TCtrlEmpAcoes.Create;
         CtrlEmpAcoes.InitializeAs(Padroes);

         dDataProc := StrToDate(dteDataInicio.Text);

         iPlanPrev := -1;
         If Trim(dblkPlanPrev.Text) <> '' Then
            iPlanPrev := qryPlanPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;

         iInvestimento := -1;
         If Trim(dblInvestimento.Text) <> '' Then
            iInvestimento := qryInvestimentos.FieldByName('IDINVESTIMENTO').AsInteger;

         // Testa se existem operações de empréstimo vencidas e não revertidas
         If Not VerificaVencEmpAcoes(dteDataInicio.Text, dteDataFinal.Text) Then
            Begin
               //AL_11
               If (MsgDlg('Existem Operações de Empréstimo Vencidas e não Revertidas no Período. Deseja continuar?',
                  'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrNo) Then
                  Begin
                     dteDataFinal.SetFocus;
                     Raise Exception.Create('Operação cancelada pelo usuário');
                  End;
            End;

         StatusTela('P');

         iNumdias := DiasUteisInv.IntervaloDiasUteis(dteDataInicio.DateTime, dteDataFinal.DateTime, -1, 1, '', True, False, False);
         prbDatas.Max := iNumdias + 1;
         prbDatas.Position := 0;

         While dDataProc <= StrToDate(dteDataFinal.Text) Do
            Begin

               If Not DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.StartTransaction;

               lblDia.Caption := DateToStr(dDataProc);
               Self.Update;

//               If Not CtrlEmpAcoes.AtualizaHistorico(dDataProc, iInvestimento, iPlanPrev) Then
//                  Raise Exception.Create('Não foi possível atualizar histórico de Empréstimo de Ações.');

               If Not CtrlEmpAcoes.ContabilizaJuros(dDataProc, iInvestimento, iPlanPrev) Then
                  Raise Exception.Create('Não foi possível contabilizar o juros do dia.');

               // Se não estiver Depurando
               If cbxDepurar.Checked = False Then
                  Begin
                     // Se Data de Processamento for maior que o último Fechamento
                     If dDataProc > CtrlPInv.DataUltFechEmp Then
                        Begin
                           //Altera se a data de Fechamento
                           If Not ExecutarQuery(qryAux, 'UPDATE PARAMINVEST SET PARAMINVEST.DATAULTFECHEMP = TO_DATE(''' + DateToStr(dDataProc) + ''',''DD/MM/YYYY'')') Then
                              Raise Exception.Create('Não foi possível alterar a Data de Fechamento.');
                           CtrlPInv.GetParamsInvest(CtrlPInv.IdEmpresa);
                        End;
                  End;

               If DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.Commit;

               // Próxima Dia Útil
               dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc, -1, 1, '', True, False, False);

               // Move Barra de Progresso de Dias
               prbDatas.StepIt;
               Self.Update;
            End;

         StatusTela('C');

         Result := True;
      Except
         On E: Exception Do
            Begin
               MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
               CancelaAcao;
               Result := False;
            End;
      End;
   Finally
      FreeAndNil(CtrlEmpAcoes);
   End;
End;

End.

