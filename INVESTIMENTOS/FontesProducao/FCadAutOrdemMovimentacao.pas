//*******************************************************************************************************
//N. Sol..........: 171022
//N. Kintana......: 1528923
//Data............: 26/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Refeita a lógica da Função VerificaCorretoras
//******************************************************************************
//Data	     : 11/06/2008
//Codigo     : AL_12
//Pendência  : 25354
//SOL        : 60201
//Desc       : Implementação de Plano/Patrocinadora independente do login (DFM)
//******************************************************************************
//Data	    : 23/10/2007
//Código    : Al_11
//Pendencia : 25780
//SOL       : 63850
//Motivo(S) : Alterar a fonte do rodapé que está clgray para clnavy
//******************************************************************************
//Data	    : 10/08/2007
//Código    : Al_12
//Pendencia : 25728
//SOL       : 63282
//Motivo(S) : Implementação da crítica de acesso as carteiras
//******************************************************************************
// Data     : 26/07/2006
// Código   : AL_11
// Pendencia: 22959
// SOL      :
// Desc     : Implementação da View VWCARTEIRASRV para o Union da
//              CARTEIRAINVEST com a CARTEIRAGERENC já prevendo o FLAG de Parametro
//            Implementação de segregação de Planos
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_10
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 29/06/2006
// Código   : AL_9
// Desc     : Acerto no cartesiano com a BolsaValores qdo a ação está cadastrada
//            em mais de uma Bolsa
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_8
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_7
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
//Data	    : 30/05/2006
//Código    : Al_6
//Pendencia : 21302
//SOL       : 19930
//Motivo(S) : Implementação de crítica para não autorizar ordens não confirmadas
//            Ajustes nas mensagens
//******************************************************************************
//Data	    : 11/04/2006
//Código    : Al_5
//SOL       : 42169
//Motivo(S) : Ajuste para voltar a qtdeordenada para a qtdeordmovinv das operações autorizadas
//            individualmente
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_4
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data     : 24/03/2005
// Código   : AL_3
// Motivo   : Alteração no if pois estava ocorrendo um erro de Acess Violation.
//********************************************************************************************************
// Data     : 05/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

Unit FCadAutOrdemMovimentacao;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
   Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
   ExtCtrls, DBCtrls, Mask, UDataBase, TREdit, wwdbedit,
   Wwdotdot, Wwdbcomb, USistema, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
   DBGrids, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
   CmEventosCadastro, ImgList, uCtrlParaminvest, uCtrlAcessoCarteira, uCtrlPadroes,
   DBClient, uCMClientDataSet;

Type
   TfrmAutOrdemMovimentacao = Class(TfrmCadastroCS)
      Label1: TLabel;
      Label2: TLabel;
      dblCarteira: TwwDBLookupCombo;
      Label4: TLabel;
      dblSiglaCorretora: TwwDBLookupCombo;
      QryBuscaCarteira: TwwQuery;
      QryCorretValores: TwwQuery;
      QryBuscaOperacao: TwwQuery;
      QryAux: TwwQuery;
      Label5: TLabel;
      dbDocumento: TDBEdit;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      DsDetalhe: TwwDataSource;
      QryBuscaOperacaoIDTIPOOPERACAO: TFloatField;
      QryBuscaOperacaoSIGLATIPOOPER: TStringField;
      QryInvestimentoAcao: TwwQuery;
      QryInvestimentoAcaoDESCINVESTIMENTO: TStringField;
      QryInvestimentoAcaoIDTIPOINVEST: TFloatField;
      QryInvestimentoAcaoIDEMISSOR: TFloatField;
      QryInvestimentoAcaoIDINVESTIMENTO: TFloatField;
      QryTotalOperacao: TwwQuery;
      updDetalhe: TUpdateSQL;
      dbDtaOperacao: TCMDateTimePicker;
      QrySubTipo: TwwQuery;
      DsSubTipo: TwwDataSource;
      updSubTipo: TUpdateSQL;
      QryBuscaOperacaoNATUREZAOPERACAO2: TStringField;
      QryBuscaOperacaoTIPOCUSTODIA2: TStringField;
      QryBuscaOperacaoFLGTRATAIR2: TStringField;
      QryBuscaOperacaoIDMERCADO2: TFloatField;
      QryBuscaOperacaoDESCTIPOOPERACAO: TStringField;
      QryBuscaOperacaoVENCIMENTO: TFloatField;
      Label3: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      dblBolsa: TwwDBLookupCombo;
      QryBolsaValores: TwwQuery;
      QryBolsaValoresSGLBOLSAVALORES: TStringField;
      QryBolsaValoresIDBOLSAVALORES: TFloatField;
      QryBolsaValoresMOECODIGO: TFloatField;
      QryBolsaValoresIDCUSTODIANTE: TFloatField;
      QryBuscaCustodiante: TwwQuery;
      QryBuscaCustodianteSGLCUSTODIANTE: TStringField;
      QryBuscaCustodianteIDCUSTODIANTE: TFloatField;
      dblOperacao: TwwDBLookupCombo;
      dblAcao: TwwDBLookupCombo;
      dbgOperacao: TwwDBGrid;
      dbgSelecao: TDBGrid;
      Panel1: TPanel;
      QryNumDocumento: TwwQuery;
      QryDetalhe: TwwQuery;
      QryDetalheHORAMOV: TStringField;
      QryDetalheSGLCUSTODIANTE: TStringField;
      QryDetalheQTDEORDENADA: TFloatField;
      QryDetalhePUORDMOVINV: TFloatField;
      QryDetalheVALOR: TFloatField;
      QryDetalheQTDEORDMOVINV: TFloatField;
      QryDetalheIDCUSTODIANTE: TFloatField;
      QryDetalheIDORDMOVINV: TFloatField;
      QryDetalheIDCORRETVALORES: TFloatField;
      v: TFloatField;
      QryDetalheOBSMOVINV: TStringField;
      QryDetalheDATAORDMOVINV: TDateTimeField;
      QryDetalheNUMDOCMOVINV: TStringField;
      QryDetalheSTATMOVINV: TStringField;
      QryDetalheIDUSUARIO: TFloatField;
      QryDetalheIDAUTORIZACAO: TFloatField;
      QryDetalheTRGDTINCLUSAO: TDateTimeField;
      QryDetalheTRGUSERINCLUSAO: TStringField;
      QryDetalheIDTIPOINVEST: TFloatField;
      QryDetalheIDTIPOOPERACAO: TFloatField;
      QryDetalheOBSAUTMOV: TStringField;
      QryDetalheIDCARTEIRAINVEST: TFloatField;
      QryDetalheIDLOTE: TStringField;
      QryDetalheDATAAUTORIZACAO: TDateTimeField;
      QryDetalheIDBOLSAVALORES: TFloatField;
      StringField9: TStringField;
      StringField10: TStringField;
      StringField11: TStringField;
      StringField12: TStringField;
      StringField13: TStringField;
      StringField14: TStringField;
      QryDetalheNATUREZAOPERACAO: TStringField;
      QryDetalheSTACONFIRMA: TStringField;
      btnTodas: TBitBtn;
      BtAutConfirma: TBitBtn;
      btnNenhuma: TBitBtn;
      BtnInverte: TBitBtn;
      QryDetalheIDCARTEIRAGERENC: TFloatField;
      QryDetalheIDBOLETA: TStringField;
      QryDetalheSTATUS: TStringField;
      QryDetalheSTAAUTORIZA: TStringField;
      UpdateSQL1: TUpdateSQL;
      UpdateSQL2: TUpdateSQL;
      Panel2: TPanel;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label13: TLabel;
      rQtdLote: TRealEdit;
      rQtdAtual: TRealEdit;
      rQtdPrevista: TRealEdit;
      rTotalOperacao: TRealEdit;
      Label12: TLabel;
      dblPlanoPatro: TwwDBLookupCombo;
      qryPlanoPatro: TwwQuery;
      QryDetalhePLANPRVCONTABPATRO: TStringField;
      QryInvestimentoAcaoSIGLAACAOBOLSA: TStringField;
      QryDetalheSIGLAACAOBOLSA: TStringField;
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure AbreQry;
      Procedure ApuraSaldoIR;
      Procedure CancelaOperacao;
      Procedure AlimentaQryDetalhe;
      Procedure AtualizaQtdAtual;
      Procedure AtualizaQtdPrevista;
      Procedure PosicionaNumDocumento;
      Procedure LancadaAutorizada;

      Function AtualizaLote(IDINVESTIMENTO: Integer): Double;
      Function AtualizaLoteGrid(IDINVESTIMENTO: Integer): Integer;
      Function ValidaCamposPrincipal: Boolean;
      Function ValidaCamposDetalhe: Boolean;
      Function DivValorZero(Valor1, Valor2: Extended): Extended;

      Function VerificaCorretoras: Boolean;
      Function VerifFechamento: Boolean;

      Procedure CmeCadastroFind(Sender: TObject);
      Procedure dbDtaOperacaoExit(Sender: TObject);
      Procedure FormKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgOperacaColExit(Sender: TObject);
      Procedure BtAutConfirmaClick(Sender: TObject);
      Procedure dblCarteiraExit(Sender: TObject);
      Procedure btnTodasClick(Sender: TObject);
      Procedure btnNenhumaClick(Sender: TObject);
      Procedure BtnInverteClick(Sender: TObject);
      Procedure HabilitaBotaoConfirma;
      Procedure dblAcaoExit(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure QryDetalheSTAAUTORIZAValidate(Sender: TField);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
   Private
      { Private declarations }
      // AL_6
      Function VerificaConfirmadas: Boolean;

      // SOL 171022   KTN 1528923 - Paulo Nobre
      Function VerificaAutorizadas: Boolean;

      Procedure MontaQryCart(dDataLimite: TDateTime);
   Public
      { Public declarations }
   End;

Var
   frmAutOrdemMovimentacao: TfrmAutOrdemMovimentacao;
   wDocumento, wPlano, wIdOperCust, wIdAcao, IDORDMOVINV, iCorretora: Integer;
   wFLGORDMOVINV, wIdLote, wTipoOrdMov, sNumDocumento: String;
   bDelete, bTrocaLine, bGrid, bVerifica: Boolean;
   dValor, wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoAqui, wSaldoIRApu, wSaldo, wVlrIRProv,
      wQtdCotaIni, fVrlRendimento: Double;

Implementation

Uses DBaseDados, UBibliotecaInvest, UOperComum, UMensErro, UImpostos, UOperacaoInvest;

{$R *.DFM}

Procedure TfrmAutOrdemMovimentacao.HabilitaBotaoConfirma;
Var
   Ponteiro: TBookmark;
Begin
   If QryDetalheSTAAUTORIZA.Value <> QryDetalheSTAAUTORIZA.OldValue Then
      Begin
         BtAutConfirma.Enabled := True;
      End;
End;

Function TfrmAutOrdemMovimentacao.VerifFechamento: Boolean;
Var
   Ponteiro: TBookmark;
Begin
   Ponteiro := QryDetalhe.GetBookmark;
   If Not bGrid Then
      Begin
         QryDetalhe.First;
         While Not QryDetalhe.eof Do
            Begin
               If QryDetalhe.FieldByName('STATUS').AsString <> 'F' Then
                  Begin
                     MsgDlg('Operação já Fechada. Não pode ser alterada.',
                        'Mensagem do Sistema ', mtWarning, [mbOK], 0);
                     QryDetalhe.Cancel;
                     AbreQry;
                     Result := false;
                     Exit;
                  End;
               QryDetalhe.Next;
            End;
      End
   Else
      Begin
         If QryDetalhe.FieldByName('STATUS').AsString <> 'F' Then
            Begin
               MsgDlg('Operação já Fechada. Não pode ser alterada.',
                  'Mensagem do Sistema ', mtWarning, [mbOK], 0);
               QryDetalhe.Cancel;
               AbreQry;
               Result := false;
               Exit;
            End;
      End;

   QryDetalhe.GotoBookmark(Ponteiro);
   Result := true;
End;

Procedure TfrmAutOrdemMovimentacao.CmeCadastroFind(Sender: TObject);
Begin
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
      Begin
         dbDtaOperacao.Text := Copy(MontaSelect.ValoresChave[0], 1, 10);
         //AL_12 - Faz o exit para preencher as queries de carteira e corretora pela data correta
         dbDtaOperacaoExit(Sender);

         If MontaSelect.ValoresChave[1] <> '' Then
            Begin
               //AL_11
               If QryBuscaCarteira.Locate('IDCARTEIRAINVEST', MontaSelect.ValoresChave[1], [loPartialKey]) Then
                  dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString;

               If ((pRPI.FLGCARTGERENC = 'S') And (Trim(MontaSelect.ValoresChave[6]) <> '')) Then
                  Begin
                     If QryBuscaCarteira.Locate('IDCARTEIRAGERENC', MontaSelect.ValoresChave[6], [loPartialKey]) Then
                        dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString;
                  End;
               dblCarteira.PerformSearch;
            End
         Else
            dblCarteira.Text := '';

         If MontaSelect.ValoresChave[2] <> '' Then
            Begin
               If QryCorretValores.Locate('IDCORRETVALORES', MontaSelect.ValoresChave[2], [loPartialKey]) Then
                  dblSiglaCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString
               Else
                  dblSiglaCorretora.Text := '';
            End
         Else
            dblSiglaCorretora.Text := '';
         //AL_11
         dblSiglaCorretora.PerformSearch;

         If MontaSelect.ValoresChave[3] <> '' Then
            Begin
               If QryBuscaOperacao.Locate('IDTIPOOPERACAO', MontaSelect.ValoresChave[3], [loPartialKey]) Then
                  dblOperacao.Text := QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString
               Else
                  dblOperacao.Text := '';
            End
         Else
            dblOperacao.Text := '';

         If MontaSelect.ValoresChave[4] <> '' Then
            Begin
               If QryInvestimentoAcao.Locate('IDINVESTIMENTO', MontaSelect.ValoresChave[4], [loPartialKey]) Then
                  dblAcao.Text := QryInvestimentoAcao.FieldByName('DESCINVESTIMENTO').AsString
               Else
                  dblAcao.Text := '';
            End
         Else
            dblAcao.Text := '';

         If MontaSelect.ValoresChave[5] <> '' Then
            Begin
               If QryBolsaValores.Locate('IDBOLSAVALORES', MontaSelect.ValoresChave[5], [loPartialKey]) Then
                  dblBolsa.Text := QryBolsaValores.FieldByName('SGLBOLSAVALORES').AsString
               Else
                  dblBolsa.Text := '';
            End
         Else
            dblBolsa.Text := '';

         //AL_12
         dblPlanoPatro.Text := '';
         If MontaSelect.ValoresChave[7] <> '' Then
            Begin
               If qryPlanoPatro.Locate('IDPLANPREVCTBPATR', MontaSelect.ValoresChave[7], []) Then
                  dblPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
               dblPlanoPatro.PerformSearch;
            End;

         If dblAcao.Text = '' Then
            AtualizaLote(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger)
         Else
            AtualizaLote(QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger);
         AbreQry;
         AtualizaQtdAtual;
         AtualizaQtdPrevista;

      End
   Else
      Begin
         dblCarteira.Text := '';
         dblSiglaCorretora.Text := '';
         dblOperacao.Text := '';
         dblAcao.Text := '';
         dblBolsa.Text := '';
         dbDocumento.Text := '';
         dbDtaOperacao.Text := DateToStr(pRPI.DATAMOVTORV);
         QryDetalhe.Close;
         rQtdLote.Clear;
         rQtdAtual.Clear;
         rTotalOperacao.Clear;
      End;
End;

Procedure TfrmAutOrdemMovimentacao.FormShow(Sender: TObject);
Begin
   Inherited;

   dbgOperacao.Font.Color := clGray;
   bTrocaLine := True;
   //AL_11
   //AL_12
   MontaQryCart(CtrlPInv.DataUltFech);

   Qry.Open;
   QryBolsaValores.Open;
   //AL_12
   QryCorretValores.Open;
   QryBuscaOperacao.Open;
   QryInvestimentoAcao.Open;
   //AL_12
   qryPlanoPatro.Open;
   CMeCadastro.AtualizaBotoes(self);
   wQtdCotaIni := pRPI.VLRCOTAINICART;
   wTipoOrdMov := pRPI.FLGORDMOVINV;
   wFLGORDMOVINV := pRPI.FLGORDMOVINV;
   dbDtaOperacao.Date := pRPI.DATAMOVTORV;
   IDORDMOVINV := 0;
   bDelete := False;
   bGrid := False;
   bVerifica := False;
   dbDtaOperacaoExit(Sender);
End;

Procedure TfrmAutOrdemMovimentacao.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   //AL_11 - Tem que encerrar a transação antes do Inherited
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Inherited;
   Qry.Close;
   QryAux.Close;
   QryDetalhe.Close;
   QrySubTipo.Close;
   QryBuscaCustodiante.Close;
   QryBolsaValores.Close;
   QryTotalOperacao.Close;
   QryBuscaCarteira.Close;
   QryCorretValores.Close;
   QryBuscaOperacao.Close;
   QryInvestimentoAcao.Close;
   //AL_12
   qryPlanoPatro.Close;
End;

Procedure TfrmAutOrdemMovimentacao.AbreQry;
Begin
   rQtdPrevista.Clear;
   With QryDetalhe Do
      Begin
         DisableControls;
         Close;
         Sql.
            Clear;
         Sql.Add('SELECT DISTINCT                                                  ');
         Sql.Add('  ORDMOVINV.IDORDMOVINV ,                                        ');
         Sql.Add('  ORDMOVINV.IDCORRETVALORES,                                     ');
         Sql.Add('  ORDMOVINV.IDINVESTIMENTO,                                      ');
         Sql.Add('  ORDMOVINV.PUORDMOVINV,                                         ');
         Sql.Add('  ORDMOVINV.OBSMOVINV,                                           ');
         Sql.Add('  ORDMOVINV.DATAORDMOVINV,                                       ');
         Sql.Add('  ORDMOVINV.QTDEORDMOVINV,                                       ');
         Sql.Add('  ORDMOVINV.NUMDOCMOVINV,                                        ');
         Sql.Add('  ORDMOVINV.STATMOVINV,                                          ');
         Sql.Add('  ORDMOVINV.IDUSUARIO,                                           ');
         Sql.Add('  ORDMOVINV.IDAUTORIZACAO,                                       ');
         Sql.Add('  ORDMOVINV.TRGDTINCLUSAO,                                       ');
         Sql.Add('  ORDMOVINV.TRGUSERINCLUSAO,                                     ');
         Sql.Add('  ORDMOVINV.IDTIPOINVEST,                                        ');
         Sql.Add('  ORDMOVINV.IDTIPOOPERACAO,                                      ');
         Sql.Add('  ORDMOVINV.OBSAUTMOV,                                           ');
         Sql.Add('  ORDMOVINV.IDCARTEIRAINVEST,                                    ');
         Sql.Add('  ORDMOVINV.IDCARTEIRAGERENC,                                    ');
         Sql.Add('  ORDMOVINV.IDLOTE,                                              ');
         Sql.Add('  ORDMOVINV.IDBOLSAVALORES,                                      ');
         Sql.Add('  ORDMOVINV.IDCUSTODIANTE,                                       ');
         Sql.Add('  ORDMOVINV.QTDEORDENADA,                                        ');
         Sql.Add('  ORDMOVINV.DATAAUTORIZACAO,                                     ');
         Sql.Add('  TO_CHAR(ORDMOVINV.DATAORDMOVINV, ''HH24:MM'') AS HORAMOV,      ');
         Sql.Add('  (((PUORDMOVINV*QTDEORDENADA)/QTDELOTE)-0.0049) AS VALOR,       ');
         Sql.Add('  CARTEIRAINVEST.DESCCARTINVEST,                                 ');
         Sql.Add('  CORRETVALORES.SGLCORRETVALORES,                                ');
         Sql.Add('  TIPOOPERACAO.DESCTIPOOPERACAO,                                 ');
         Sql.Add('  TIPOOPERACAO.SIGLATIPOOPER,                                    ');
         Sql.Add('  INVESTIMENTO.DESCINVESTIMENTO,                                 ');
         Sql.Add('  BOLSAVALORES.SGLBOLSAVALORES,                                  ');
         Sql.Add('  TIPOOPERACAO.NATUREZAOPERACAO,                                 ');
         Sql.Add('  ORDMOVINV.STACONFIRMA,                                         ');
         Sql.Add('  ORDMOVINV.STAAUTORIZA,                                          ');
         Sql.Add('  BOLETA.IDBOLETA,                                               ');
         Sql.Add('  BOLETA.STATUS,                                                 ');
         Sql.Add('  ACOESXBOLSA.SIGLAACAOBOLSA,                                    ');
         //AL_12
         Sql.Add('  VWPLANPREVCTBPATR.PLANPRVCONTABPATRO                           ');
         Sql.Add('FROM                                                             ');
         Sql.Add('  ORDMOVINV, VWCARTEIRASRV CARTEIRAINVEST, CORRETVALORES, INVESTIMENTO, BOLSAVALORES, TIPOOPERACAO, BOLETA, ACOESXBOLSA, VWPLANPREVCTBPATR  ');
         Sql.Add('WHERE                                                            ');

         If dbDtaOperacao.Text <> '' Then
            Sql.Add('ORDMOVINV.DATAORDMOVINV LIKE TO_DATE(''' + dbDtaOperacao.Text + ''',''DD/MM/YYYY'') AND ')
         Else
            Sql.Add('NOT ORDMOVINV.DATAORDMOVINV IS NULL                           AND  ');

         //AL_12 - Ini
         If dblPlanoPatro.Text <> '' Then
            Sql.Add('ORDMOVINV.IDPLANPREVCTBPATR = ' +
               qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString + '        AND  ')
         Else
            Sql.Add('NOT ORDMOVINV.IDPLANPREVCTBPATR IS NULL                         AND  ');

         If dblCarteira.Text <> '' Then
            Begin
               Sql.Add('ORDMOVINV.IDCARTEIRAINVEST  = ''' +
                  QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsString + '''     AND  ');

               If QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 Then
                  Sql.Add('ORDMOVINV.IDCARTEIRAGERENC  = ''' +
                     QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsString + '''   AND  ')
               Else
                  Sql.Add('ORDMOVINV.IDCARTEIRAGERENC IS NULL                         AND  ');
            End;
         //AL_x - Fim

         If dblSiglaCorretora.Text <> '' Then
            Sql.Add('ORDMOVINV.IDCORRETVALORES   = ' +
               QryCorretValores.FieldByName('IDCORRETVALORES').AsString + '        AND  ')
         Else
            Sql.Add('NOT ORDMOVINV.IDCORRETVALORES IS NULL                         AND  ');

         If dblOperacao.Text <> '' Then
            Sql.Add('ORDMOVINV.IDTIPOOPERACAO   = ' +
               QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsString + '         AND  ')
         Else
            Sql.Add('NOT ORDMOVINV.IDTIPOOPERACAO IS NULL                          AND  ');

         If dblAcao.Text <> '' Then
            Sql.Add('ORDMOVINV.IDINVESTIMENTO   = ' +
               QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsString + '      AND  ')
         Else
            Sql.Add('NOT ORDMOVINV.IDINVESTIMENTO IS NULL                          AND  ');

         If dblBolsa.Text <> '' Then
            Sql.Add('ORDMOVINV.IDBOLSAVALORES   = ' +
               QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString + '          AND  ')
         Else
            Sql.Add('NOT ORDMOVINV.IDBOLSAVALORES IS NULL                          AND  ');

         //AL_11 - Ini
         //AL_11
         Sql.Add(' VWPLANPREVCTBPATR.IDPLANPREVCTBPATR = ORDMOVINV.IDPLANPREVCTBPATR AND ');
         Sql.Add(' ORDMOVINV.IDTIPOINVEST          <> 8                            AND  ');
         Sql.Add(' CARTEIRAINVEST.IDCARTEIRAINVEST(+) = ORDMOVINV.IDCARTEIRAINVEST AND  ');
         ////AL_12
         Sql.Add(' NVL(CARTEIRAINVEST.IDCARTEIRAGERENC,0) = NVL(ORDMOVINV.IDCARTEIRAGERENC,0) AND  ');
         //AL_11 - Fim
         Sql.Add(' CORRETVALORES.IDCORRETVALORES   = ORDMOVINV.IDCORRETVALORES     AND  ');
         Sql.Add(' INVESTIMENTO.IDINVESTIMENTO     = ORDMOVINV.IDINVESTIMENTO      AND  ');
         Sql.Add(' BOLSAVALORES.IDBOLSAVALORES     = ORDMOVINV.IDBOLSAVALORES      AND  ');
         Sql.Add(' TIPOOPERACAO.IDTIPOOPERACAO     = ORDMOVINV.IDTIPOOPERACAO      AND  ');
         Sql.Add(' ORDMOVINV.NUMDOCMOVINV          = BOLETA.IDBOLETA(+)            AND  ');
         //AL_9
         Sql.Add(' ACOESXBOLSA.IDBOLSAVALORES(+)   = ORDMOVINV.IDBOLSAVALORES      AND  ');

         Sql.Add(' ACOESXBOLSA.IDACAO(+)           = ORDMOVINV.IDINVESTIMENTO           ');
         //AL_12
         Sql.Add(' ORDER BY VWPLANPREVCTBPATR.PLANPRVCONTABPATRO, CORRETVALORES.SGLCORRETVALORES, INVESTIMENTO.DESCINVESTIMENTO, ORDMOVINV.IDORDMOVINV ');
         Open;
         EnableControls;
      End;
   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;
End;

Procedure TfrmAutOrdemMovimentacao.AlimentaQryDetalhe;
Begin
   QryDetalheVALOR.ReadOnly := False;
   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               Edit;
               FieldByName('HORAMOV').AsString :=
                  FormatDateTime('HH:NN', FieldByName('DATAORDMOVINV').AsDateTime);
               FieldByName('VALOR').AsFloat :=
                  AtualizaLote(QryDetalhe.FieldByname('IDINVESTIMENTO').AsInteger);
               Post;
               Next;
            End;
         First;
         EnableControls;
      End;
   QryDetalheVALOR.ReadOnly := True;
End;

Procedure TfrmAutOrdemMovimentacao.LancadaAutorizada;
Begin
   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               Edit;
               If FieldByName('STAAUTORIZA').AsString = 'A' Then
                  Begin
                     FieldByName('STAAUTORIZA').AsString := 'A';
                     FieldByName('QTDEORDMOVINV').AsFloat := FieldByName('QTDEORDENADA').AsFloat;
                     FieldByName('IDAUTORIZACAO').AsInteger := Sistema.IdUsuario;
                     FieldByName('DATAAUTORIZACAO').AsDateTime := Date;
                  End;
               Post;
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Function TfrmAutOrdemMovimentacao.AtualizaLoteGrid(IDINVESTIMENTO: Integer): Integer;
Begin
   // Busca a Quantidade por Lote na Bolsa
   Result := 0;
   If FazQuery(QryAux, 'SELECT DISTINCT QTDELOTE FROM ACOESXBOLSA WHERE IDACAO = ' +
      QuotedStr(IntToStr(IDINVESTIMENTO))) Then
      Result := QryAux.FieldByName('QTDELOTE').AsInteger;
   rQtdLote.Value := Result;
End;

Function TfrmAutOrdemMovimentacao.AtualizaLote(IDINVESTIMENTO: Integer): Double;
Var
   wQtdLote: Integer;
Begin
   // Busca a Quantidade por Lote na Bolsa
   wQtdLote := AtualizaLoteGrid(IDINVESTIMENTO);
   rQtdLote.Value := wQtdLote;
   Result := (DivValorZero((QryDetalhe.FieldByName('PUORDMOVINV').AsFloat *
      QryDetalhe.FieldByName('QTDEORDENADA').AsFloat), wQtdLote) - 0.0049);
End;

Procedure TfrmAutOrdemMovimentacao.AtualizaQtdAtual;
Var
   wQtdInvest, wSaldoInutil: Double;
Begin
   //AL_1
   //AL_2
   //AL_4
   //AL_7
   //AL_10
   OperComum.BuscaTodosSaldosInvestLote(
      QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
      QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger,
      QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger,
      9999999, -1,
      QryDetalhe.FieldByName('IDLOTE').AsString,
      dbDtaOperacao.Text, -1,
      wQtdInvest, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);
   rQtdAtual.Value := wQtdInvest;
End;

Procedure TfrmAutOrdemMovimentacao.AtualizaQtdPrevista;
Begin
   rTotalOperacao.Value := 0;
   rQtdPrevista.Value := rQtdAtual.Value;
   QryDetalhe.DisableControls;
   QryDetalhe.First;
   While Not QryDetalhe.EOF Do
      Begin
         If (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
            Begin
               rQtdPrevista.Value := rQtdPrevista.Value +
                  QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
               rTotalOperacao.Value := rTotalOperacao.Value + QryDetalhe.FieldByName('VALOR').AsFloat;
            End
         Else If (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
            Begin
               rQtdPrevista.Value := rQtdPrevista.Value -
                  QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
               rTotalOperacao.Value := rTotalOperacao.Value - QryDetalhe.FieldByName('VALOR').AsFloat;
            End;
         QryDetalhe.Next;
      End;
   QryDetalhe.First;
   QryDetalhe.EnableControls;
End;

Procedure TfrmAutOrdemMovimentacao.sbtnProcurarClick(Sender: TObject);
Begin
   Inherited;
   bDelete := False;
   CMeCadastro.AtualizaBotoes(self);
End;

Procedure TfrmAutOrdemMovimentacao.dbDtaOperacaoExit(Sender: TObject);
//AL_11
Var sCorretora: String;
Begin
   Inherited;
   If Trim(dbDtaOperacao.Text) = '' Then
      Begin
         MsgDlg('Data de Operação inválida.',
            'Mensagem do Sistema ', mtWarning, [mbOK], 0);
         dbDtaOperacao.Clear;
         dbDtaOperacao.SetFocus;
         Exit;
      End;
   QryDetalheSGLCUSTODIANTE.ReadOnly := False;
   QryDetalheQTDEORDENADA.ReadOnly := False;
   QryDetalhePUORDMOVINV.ReadOnly := False;
   QryDetalheVALOR.ReadOnly := False;
   bDelete := False;
   rQtdPrevista.Clear;
   If Not bDelete Then
      Begin
         //AL_12 - Posiciona query de Carteiras
         If Trim(dbDtaOperacao.Text) <> '' Then
            MontaQryCart(dbDtaOperacao.DateTime)
         Else
            MontaQryCart(CtrlPInv.DataUltFech);
         //AL_12
         //dblCarteira.PerformSearch;

         AbreQry;
         AtualizaQtdPrevista;
      End;
   With QryCorretValores Do
      Begin
         //AL_11
         sCorretora := dblSiglaCorretora.Text;
         Close;
         Sql.Clear;
         Sql.Add('SELECT DISTINCT');
         Sql.Add('   CORRETVALORES.IDCORRETVALORES,');
         Sql.Add('   CORRETVALORES.SglCorretValores');
         Sql.Add('FROM                             ');
         Sql.Add('   CORRETVALORES, ORDMOVINV      ');
         Sql.Add('WHERE                            ');
         Sql.Add('   CORRETVALORES.IDCORRETVALORES = ORDMOVINV.IDCORRETVALORES(+) AND ');
         If dbDtaOperacao.Text <> '' Then
            Sql.Add('DATAORDMOVINV LIKE TO_DATE(''' + dbDtaOperacao.Text + ''',''DD/MM/YYYY'')')
         Else
            Sql.Add('DATAORDMOVINV IS NULL ');
         Sql.Add('ORDER BY CORRETVALORES.SglCorretValores ');
         Open;
         //AL_11
         If sCorretora <> '' Then
            Begin
               dblSiglaCorretora.Text := sCorretora;
               dblSiglaCorretora.PerformSearch;
            End;
      End;
   dbgOperacao.Font.Color := clGray;
   IDORDMOVINV := 0;
   QryDetalheSGLCUSTODIANTE.ReadOnly := True;
   QryDetalheQTDEORDENADA.ReadOnly := True;
   QryDetalhePUORDMOVINV.ReadOnly := True;
   QryDetalheVALOR.ReadOnly := True;
End;

Procedure TfrmAutOrdemMovimentacao.FormKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   Inherited;
   If Key = VK_Return Then
      SelectNext(ActiveControl, True, True)
End;

Procedure TfrmAutOrdemMovimentacao.ApuraSaldoIR;
Var wdiv, wqtd: double;
Begin
   If (QryBuscaOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D') And
      ((QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString = 'G') Or // F.Gerador -> Ganho Capital
      (QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString = 'V')) Then // F.Gerador -> Valor da Operação
      Begin
         fVrlRendimento := 0;
         QryDetalhe.FieldByName('VLRIR').AsFloat :=
            Impostos.CalculaIr(2,
            QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger, 0 {CARTEIRAGERENC},
            QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
            QryBuscaOperacao.FieldByName('IDMERCADO').AsInteger,
            QryDetalhe.FieldByName('IDLOTE').AsString,
            StrToDate(dbDtaOperacao.Text),
            StrToDate(dbDtaOperacao.Text),
            (QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat * DivValorZero(wSaldoAqui, wSaldoQtd)),
            QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
            0,
            'S',
            QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString,
            fVrlRendimento);

         // Verifica se existe provisionamento de IR
         If Impostos.BuscaProvisaoIR(2, QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger) Then
            wVlrIRProv := (DivValorZero(wSaldoIRApu, wSaldoQtd) * QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat) * -1;
      End;
End;

Procedure TfrmAutOrdemMovimentacao.CancelaOperacao;
Begin
   QryDetalhe.Cancel;

   DtmBaseDados.dbBaseDados.Rollback;

   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color := clGray;
   // AL_13
   dbgOperacao.Color := clwindow; // Fim AL_13

   dbgOperacao.SetFocus;

   QryDetalhe.Close;
   QryDetalhe.Open;
   AlimentaQryDetalhe;

End;

Function TfrmAutOrdemMovimentacao.ValidaCamposPrincipal: Boolean;
Begin
   // AL_6
   Result := True;

   If dbDtaOperacao.Text = '' Then
      Begin
         MsgDlg('Informe qual a Data de Operação.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         dbDtaOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If dblCarteira.Text = '' Then
      Begin
         MsgDlg('Informe a Carteira.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         dblCarteira.SetFocus;
         Result := False;
         Exit;
      End;

   If dblSiglaCorretora.Text = '' Then
      Begin
         MsgDlg('Informe a Sigla da Corretora.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         dblSiglaCorretora.SetFocus;
         Result := False;
         Exit;
      End;

   If dblOperacao.Text = '' Then
      Begin
         MsgDlg('Informe o Tipo de Operação.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         dbgOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If dblAcao.Text = '' Then
      Begin
         MsgDlg('Informe o Investimento.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         dblAcao.SetFocus;
         Result := False;
         Exit;
      End;

   If dblBolsa.Text = '' Then
      Begin
         MsgDlg('Informe a Bolsa de Valores.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
         dblBolsa.SetFocus;
         Result := False;
         Exit;
      End;
   // AL_6
End;

Function TfrmAutOrdemMovimentacao.ValidaCamposDetalhe: Boolean;
Begin
   // AL_6 - Ini
   Try
      Result := True;
      If QryDetalhe.FieldByName('HORAMOV').IsNull Then
         Begin
            MsgDlg('Informe a Hora. ', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
            Result := False;
            Exit;
         End;

      If QryDetalhe.FieldByName('QTDEORDENADA').IsNull Then
         Begin
            MsgDlg('Informe a Quantidade Negociada.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
            Result := False;
            Exit;
         End;

      If QryDetalhe.FieldByName('PUORDMOVINV').IsNull Then
         Begin
            MsgDlg('Informe o Preço. ', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
            Result := False;
            Exit;
         End;

      If (QryDetalhe.FieldByName('VALOR').IsNull) Then
         Begin
            MsgDlg('Informe o Valor da Operação.', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
            Result := False;
            Exit;
         End;
   Finally
      If (Not Result) And (dbgOperacao.CanFocus) Then
         dbgOperacao.SetFocus;
   End;
   // AL_6 - Fim
End;

Function TfrmAutOrdemMovimentacao.DivValorZero(Valor1, Valor2: Extended): Extended;
Begin
   If Valor2 <> 0 Then
      Result := Valor1 / Valor2
   Else
      Result := 0;
End;

Procedure TfrmAutOrdemMovimentacao.dbgOperacaColExit(Sender: TObject);
Begin
   Inherited;
   If (dbgOperacao.Options = [TwwDBgridOption(dgEditing), TwwDBgridOption(dgAlwaysShowEditor), TwwDBgridOption(dgTitles), TwwDBgridOption(dgIndicator),
      TwwDBgridOption(dgColumnResize), TwwDBgridOption(dgColLines), TwwDBgridOption(dgRowLines), TwwDBgridOption(dgCancelOnExit)])
      Then
      Begin
         dValor := (DivValorZero(QryDetalhe.FieldByName('QTDEORDENADA').AsFloat, rQtdLote.Value) *
            QryDetalhe.FieldByName('PUORDMOVINV').AsFloat - 0.0049);
         QryDetalhe.FieldByName('VALOR').Value := dValor;
      End;
End;

Procedure TfrmAutOrdemMovimentacao.BtAutConfirmaClick(Sender: TObject);
Begin
   Inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         // AL_6 - Ini
         Try
            Try
               // SOL 171022   KTN 1528923 - Paulo Nobre
               If VerificaAutorizadas Then // Só faz se tiver pelo menos uma autorizada
                  If VerificaCorretoras Then //Se tiver mais de uma da a mensagem
                     Begin
                        If MsgDlg('Há ' + IntToStr(iCorretora) + ' Corretoras diferentes, autoriza ?', 'Mensagem do Sistema ',
                           mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
                           Begin
                              DtmBaseDados.dbBaseDados.Rollback;
                              BtAutConfirma.Enabled := False;
                              Exit;
                           End;
                     End;

               If Not VerificaConfirmadas Then
                  MsgDlg('Existem ordens não confirmadas que não podem ser autorizadas.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);

               // AL_5
               LancadaAutorizada;
               QryDetalhe.ApplyUpdates;
               QryDetalhe.CommitUpdates;
               DtmBaseDados.dbBaseDados.Commit;
            Except
               On E: Exception Do
                  Begin
                     DtmBaseDados.dbBaseDados.Rollback;
                     MsgDlg('Não foi possível realizar a Operação.' + #13 + E.Message,
                        'Mensagem do Sistema ', mtWarning, [mbOK], 0);
                  End;
            End;
            BtAutConfirma.Enabled := False;
         Finally
            AbreQry;
         End;
         // AL_6 - Fim
      End;
End;

Procedure TfrmAutOrdemMovimentacao.PosicionaNumDocumento;
Begin
   With QryNumDocumento Do
      Begin
         DisableControls;
         Close;
         Sql.Clear;
         Sql.Add('SELECT                                                           ');
         Sql.Add('  NUMDOCMOVINV                                                   ');
         Sql.Add('FROM                                                             ');
         Sql.Add('  ORDMOVINV                                                      ');
         Sql.Add('WHERE                                                            ');
         Sql.Add('                                                                 ');
         If dbDtaOperacao.Text <> '' Then
            Sql.Add('DATAORDMOVINV LIKE TO_DATE(''' + dbDtaOperacao.Text + ''',''DD/MM/YYYY'') ');
         If Trim(dblCarteira.Text) <> '' Then
            Sql.Add('AND IDCARTEIRAINVEST   = ' +
               QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsString + '        ');
         Open;
         If Not FieldByName('NUMDOCMOVINV').IsNull Then
            dbDocumento.Text := FieldByName('NUMDOCMOVINV').AsString
         Else
            dbDocumento.Text := 'RV-' + Copy(dbDtaOperacao.Text, 9, 2) + '/' + FormatFloat('0000',
               LeUltRegistro(Nil, 'CONTDOCRENVAR' + Copy(dbDtaOperacao.Text, 9, 2)));
         Close;
      End;
End;

Function TfrmAutOrdemMovimentacao.VerificaCorretoras: Boolean;
Var iIdCorretoraAtu, iIdCorretoraAnt: integer;
Begin
   // SOL 171022 KTN 1528923 - Paulo Nobre
   Result := False;
   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         iCorretora := 1;
         iIdCorretoraAtu := FieldByName('IDCORRETVALORES').AsInteger;
         iIdCorretoraAnt := FieldByName('IDCORRETVALORES').AsInteger;
         While Not Eof Do
            Begin
               If iIdCorretoraAtu <> iIdCorretoraAnt Then
                  Begin
                     inc(iCorretora);

                     iIdCorretoraAnt := FieldByName('IDCORRETVALORES').AsInteger;
                  End;

               Next;

               iIdCorretoraAtu := FieldByName('IDCORRETVALORES').AsInteger;
            End;
         First;
         EnableControls;
      End;
   If iCorretora > 1 Then
      Result := True;
End;

Procedure TfrmAutOrdemMovimentacao.dblCarteiraExit(Sender: TObject);
Begin
   Inherited;
   bVerifica := False;
   QryDetalheSGLCUSTODIANTE.ReadOnly := False;
   QryDetalheQTDEORDENADA.ReadOnly := False;
   QryDetalhePUORDMOVINV.ReadOnly := False;
   QryDetalheVALOR.ReadOnly := False;
   QryDetalheSTACONFIRMA.ReadOnly := False;
   If Not bDelete Then
      Begin
         AbreQry;
         AtualizaQtdPrevista;

         PosicionaNumDocumento;
         If Not QryDetalhe.IsEmpty Then
            Begin
               QryDetalhe.Edit;
               If Not DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.StartTransaction;

               dbgOperacao.SelectedIndex := 0;
               dbgOperacao.Options := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
               dbgOperacao.Font.Color := clGray;
            End;
      End;
   IDORDMOVINV := 0;
   QryDetalheSGLCUSTODIANTE.ReadOnly := True;
   QryDetalheQTDEORDENADA.ReadOnly := True;
   QryDetalhePUORDMOVINV.ReadOnly := True;
   QryDetalheVALOR.ReadOnly := True;
   QryDetalheSTACONFIRMA.ReadOnly := True;
End;

Procedure TfrmAutOrdemMovimentacao.btnTodasClick(Sender: TObject);
Begin
   Inherited;
   bGrid := False;
   bVerifica := True;
   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;
   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               If QryDetalhe.FieldByName('STATUS').AsString <> 'F' Then
                  Begin
                     Edit;
                     FieldByName('STAAUTORIZA').AsString := 'A';
                     FieldByName('QTDEORDMOVINV').AsFloat := FieldByName('QTDEORDENADA').AsFloat;
                     FieldByName('IDAUTORIZACAO').AsInteger := Sistema.IdUsuario;
                     FieldByName('DATAAUTORIZACAO').AsDateTime := Date;
                     Post;
                  End;
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Procedure TfrmAutOrdemMovimentacao.btnNenhumaClick(Sender: TObject);
Begin

   bGrid := False;
   bVerifica := True;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               If QryDetalhe.FieldByName('STATUS').AsString <> 'F' Then
                  Begin
                     Edit;
                     FieldByName('STAAUTORIZA').AsString := 'P';
                     FieldByName('QTDEORDMOVINV').AsFloat := 0;
                     FieldByName('IDAUTORIZACAO').AsInteger := Sistema.IdUsuario;
                     FieldByName('DATAAUTORIZACAO').AsDateTime := Date;
                     Post;
                  End;
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Procedure TfrmAutOrdemMovimentacao.BtnInverteClick(Sender: TObject);
Begin
   Inherited;
   bGrid := False;
   bVerifica := True;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               If QryDetalhe.FieldByName('STATUS').AsString <> 'F' Then
                  Begin
                     Edit;
                     If (FieldByName('STAAUTORIZA').AsString = 'A') Then
                        Begin
                           FieldByName('STAAUTORIZA').AsString := 'P';
                           FieldByName('QTDEORDMOVINV').AsFloat := 0;
                           FieldByName('IDAUTORIZACAO').AsInteger := Sistema.IdUsuario;
                           FieldByName('DATAAUTORIZACAO').AsDateTime := Date;
                        End
                     Else
                        Begin
                           FieldByName('STAAUTORIZA').AsString := 'A';
                           FieldByName('QTDEORDMOVINV').AsFloat := FieldByName('QTDEORDENADA').AsFloat;
                           FieldByName('IDAUTORIZACAO').AsInteger := Sistema.IdUsuario;
                           FieldByName('DATAAUTORIZACAO').AsDateTime := Date;
                        End;
                     Post;
                  End;
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Procedure TfrmAutOrdemMovimentacao.dblAcaoExit(Sender: TObject);
Begin
   Inherited;
   bVerifica := False;
   QryDetalheSGLCUSTODIANTE.ReadOnly := False;
   QryDetalheQTDEORDENADA.ReadOnly := False;
   QryDetalhePUORDMOVINV.ReadOnly := False;
   QryDetalheVALOR.ReadOnly := False;
   QryDetalheSTACONFIRMA.ReadOnly := False;
   If Not bDelete Then
      Begin
         AbreQry;
         If dblAcao.Text = '' Then
            AtualizaLote(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger)
         Else
            AtualizaLote(QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger);
         AtualizaQtdAtual;
         AtualizaQtdPrevista;

         PosicionaNumDocumento;
         If Not QryDetalhe.IsEmpty Then
            Begin
               QryDetalhe.Edit;
               If Not DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.StartTransaction;

               dbgOperacao.SelectedIndex := 0;
               dbgOperacao.Options := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
               dbgOperacao.Font.Color := clGray;
            End;
      End;
   IDORDMOVINV := 0;
   QryDetalheSGLCUSTODIANTE.ReadOnly := True;
   QryDetalheQTDEORDENADA.ReadOnly := True;
   QryDetalhePUORDMOVINV.ReadOnly := True;
   QryDetalheVALOR.ReadOnly := True;
   QryDetalheSTACONFIRMA.ReadOnly := True;
End;

Procedure TfrmAutOrdemMovimentacao.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   pnlFundo.Enabled := True;
End;

Procedure TfrmAutOrdemMovimentacao.QryDetalheSTAAUTORIZAValidate(
   Sender: TField);
Begin
   Inherited;
   //Ricardo Cristiano SOL 114139 / KT 532083 - 15.04.2009
   If (pRPI.REGRABOLETA <> '1') Then
      Begin
         If (QryDetalhe.FieldByName('STATUS').AsString = 'F') Then // Se for 'F' , força o Raise
            Begin
               MsgDlg('Operação já Fechada. Não pode ser alterada.',
                  'Mensagem do Sistema ', mtWarning, [mbOK], 0);
               Abort;
            End
         Else
            BtAutConfirma.Enabled := True;
      End
   Else If (pRPI.REGRABOLETA = '1') Then
      Begin
         If ((QryDetalhe.FieldByName('STAAUTORIZA').AsString <> 'A') And
            (QryDetalhe.FieldByName('STATUS').AsString = 'F')) Then // Se for 'F' , força o Raise
            Begin
               MsgDlg('Operação já Fechada. Não pode ser alterada.',
                  'Mensagem do Sistema ', mtWarning, [mbOK], 0);
               Abort;
            End
         Else
            BtAutConfirma.Enabled := True;
      End;
End;

// AL_6

Function TfrmAutOrdemMovimentacao.VerificaConfirmadas: Boolean;
Begin
   Try
      Try
         QryDetalhe.DisableControls;
         QryDetalhe.First;
         Result := True;
         While Not QryDetalhe.Eof Do
            Begin
               QryDetalhe.Edit;
               If QryDetalhe.FieldByName('STACONFIRMA').AsString <> 'S' Then
                  Begin
                     QryDetalhe.FieldByName('STAAUTORIZA').Clear;
                     Result := False;
                  End;
               QryDetalhe.Post;

               QryDetalhe.Next;
            End;
      Except
         Result := False;
      End;
   Finally
      QryDetalhe.First;
      QryDetalhe.EnableControls;
   End;
End;

Procedure TfrmAutOrdemMovimentacao.bbtnSairClick(Sender: TObject);
Begin
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Inherited;
End;

Procedure TfrmAutOrdemMovimentacao.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   //AL_11 - Fecha a transaçãio se o usuário terminar a aplicação sem fechar o form
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Inherited;

End;

//AL_12

Procedure TfrmAutOrdemMovimentacao.MontaQryCart(dDataLimite: TDateTime);
Var CtrlAcessoCart: TCtrlAcessoCarteira;
   cdsCarteiras: TCMClientDataSet;
   sCart: String;
Begin
   Try // Finally
      QryBuscaCarteira.Close;
      cdsCarteiras := TCMClientDataSet.Create(Nil);
      CtrlAcessoCart := TCtrlAcessoCarteira.Create;
      CtrlAcessoCart.InitializeAs(Padroes);
      cdsCarteiras.Data := CtrlAcessoCart.ListaCartAutorizada(Sistema.IdUsuario);
      // Se não há carteiras autorizadas para este usuário, inclui a carteira 0 para não trazer nenhuma
      If cdsCarteiras.IsEmpty Then
         Begin
            cdsCarteiras.Insert;
            cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger := 0;
            cdsCarteiras.Post;
         End;
      cdsCarteiras.First;

      If (CtrlPInv.FlgCartGerenc = 'S') Or ((CtrlPInv.FlgCartGerenc = 'N') And (dDataLimite <= CtrlPInv.DataLimCartGer)) Then
         Begin
            QryBuscaCarteira.Sql.Clear;
            QryBuscaCarteira.Sql.Add('SELECT LPAD(CG.IDCARTEIRAINVEST,2,''0'') || LPAD(CG.IDCARTEIRAGERENC,2,''0'') AS IDCARTEIRA, ');
            QryBuscaCarteira.Sql.Add('       CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC, ');
            QryBuscaCarteira.Sql.Add('       CG.DESCCARTGERENC AS DESCCARTINVEST ');
            QryBuscaCarteira.Sql.Add('FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI ');
            QryBuscaCarteira.Sql.Add('WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST ');
            QryBuscaCarteira.Sql.Add('  AND (CI.IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
            cdsCarteiras.Next;
            While Not cdsCarteiras.Eof Do
               Begin
                  QryBuscaCarteira.Sql.Add('  OR CI.IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
                  cdsCarteiras.Next;
               End;
            QryBuscaCarteira.Sql.Add(' )');
            cdsCarteiras.First;

            QryBuscaCarteira.Sql.Add('UNION                                     ');
            QryBuscaCarteira.Sql.Add('SELECT LPAD(IDCARTEIRAINVEST,2,''0'') || NULL AS IDCARTEIRA, IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, ');
            QryBuscaCarteira.Sql.Add('       DESCCARTINVEST ');
            QryBuscaCarteira.Sql.Add('FROM  CARTEIRAINVEST ');
            QryBuscaCarteira.Sql.Add('WHERE IDTIPOINVEST = 2 ');
            QryBuscaCarteira.Sql.Add('  AND (IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
            cdsCarteiras.Next;
            While Not cdsCarteiras.Eof Do
               Begin
                  QryBuscaCarteira.Sql.Add('  OR IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
                  cdsCarteiras.Next;
               End;
            QryBuscaCarteira.Sql.Add(' )');
            QryBuscaCarteira.Sql.Add('ORDER BY DESCCARTINVEST');
         End
      Else
         Begin
            QryBuscaCarteira.Sql.Clear;
            QryBuscaCarteira.Sql.Add('SELECT LPAD(IDCARTEIRAINVEST,2,''0'') || NULL AS IDCARTEIRA, IDCARTEIRAINVEST, ''0'' AS IDCARTEIRAGERENC, ');
            QryBuscaCarteira.Sql.Add('       DESCCARTINVEST ');
            QryBuscaCarteira.Sql.Add('FROM CARTEIRAINVEST ');
            QryBuscaCarteira.Sql.Add('WHERE IDTIPOINVEST IS NOT NULL ');
            QryBuscaCarteira.Sql.Add('  AND IDTIPOINVEST = 2 ');
            QryBuscaCarteira.Sql.Add('  AND (IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
            cdsCarteiras.Next;
            While Not cdsCarteiras.Eof Do
               Begin
                  QryBuscaCarteira.Sql.Add('  OR IDCARTEIRAINVEST = ' + cdsCarteiras.FieldByName('IDCARTEIRAINVEST').AsString);
                  cdsCarteiras.Next;
               End;
            QryBuscaCarteira.Sql.Add(' )');

            QryBuscaCarteira.Sql.Add('ORDER BY DESCCARTINVEST');
         End;
   Finally
      FreeAndNil(CtrlAcessoCart);
      cdsCarteiras.Close;
      FreeAndNil(cdsCarteiras);
      //AL_12
      sCart := OperComum.IIF(Trim(dblCarteira.Text) <> '', dblCarteira.Text, '');
      QryBuscaCarteira.Open;
      dblCarteira.Text := sCart;
      dblCarteira.PerformSearch;
   End;
End;

// SOL 171022   KTN 1528923 - Paulo Nobre      
Function TfrmAutOrdemMovimentacao.VerificaAutorizadas: Boolean;
Begin
   Try
      Try
         QryDetalhe.DisableControls;
         QryDetalhe.First;
         Result := False;
         While Not QryDetalhe.Eof Do
            Begin
               If QryDetalhe.FieldByName('STAAUTORIZA').AsString = 'A' Then
                  Result := True;

               QryDetalhe.Next;
            End;
      Except
         Result := False;
      End;
   Finally
      QryDetalhe.First;
      QryDetalhe.EnableControls;
   End;
End;

End.

