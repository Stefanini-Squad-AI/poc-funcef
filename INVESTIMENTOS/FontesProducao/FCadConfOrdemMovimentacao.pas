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
//Data	    : 25/07/2006
//Código    : Al_10
//Pendencia : 22959
//Motivo(S) : Implementação de segregação de Planos
//            Alterada a qryDetalhe (DFM)
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_9
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 29/06/2006
// Código   : AL_8
// Desc     : Acerto no cartesiano com a BolsaValores qdo a ação está cadastrada
//            em mais de uma Bolsa
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_7
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_6
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data      : 20/04/2006
// Código    : AL_5
// Motivo    : Acerto na filtragem de Carteira Gerencial
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_4
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data      : 24/02/2006
// Código    : AL_3
// Pendência : 21264
// SOL       : 39852
// Motivo    : Acerto no Retorno do Botâo de Procurar  e melhorias no form
//********************************************************************************************************
// Data     : 05/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

Unit FCadConfOrdemMovimentacao;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
   Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
   ExtCtrls, DBCtrls, Mask, UDataBase, TREdit, wwdbedit,
   Wwdotdot, Wwdbcomb, USistema, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
   DBGrids, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
   CmEventosCadastro, ImgList;

Type
   TfrmConfOrdemMovimentacao = Class(TfrmCadastroCS)
      Label1: TLabel;
      Label2: TLabel;
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
      BtnInverte: TBitBtn;
      btnNenhuma: TBitBtn;
      BtAutConfirma: TBitBtn;
      QryDetalheIDCARTEIRAGERENC: TFloatField;
      QryDetalheIDBOLETA: TStringField;
      QryDetalheSTATUS: TStringField;
      dblCarteira: TwwDBLookupCombo;
      QryBuscaCarteiraIDCARTEIRA: TStringField;
      QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField;
      QryBuscaCarteiraIDCARTEIRAGERENC: TFloatField;
      QryBuscaCarteiraDESCCARTINVEST: TStringField;
      Panel2: TPanel;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label13: TLabel;
      rQtdLote: TRealEdit;
      rQtdAtual: TRealEdit;
      rQtdPrevista: TRealEdit;
      rTotalOperacao: TRealEdit;
      qryPlanoPatro: TwwQuery;
      Label12: TLabel;
      dblPlanoPatro: TwwDBLookupCombo;
      QryDetalhePLANPRVCONTABPATRO: TStringField;
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

      Function AtualizaLote(IDINVESTIMENTO: Integer): Double;
      Function AtualizaLoteGrid(IDINVESTIMENTO: Integer): Integer;
      Function ValidaCamposPrincipal: Boolean;
      Function ValidaCamposDetalhe: Boolean;
      Function DivValorZero(Valor1, Valor2: Extended): Extended;
      Function VerificaCorretoras: Boolean;
      Function VerifFechamento: Boolean;

            // SOL 171022   KTN 1528923 - Paulo Nobre      
Function VerificaConfirmadas: Boolean;

      Procedure CmeCadastroFind(Sender: TObject);
      Procedure dbDtaOperacaoExit(Sender: TObject);
      Procedure FormKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbgOperacaColExit(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure BtAutConfirmaClick(Sender: TObject);
      Procedure dblCarteiraExit(Sender: TObject);
      Procedure btnTodasClick(Sender: TObject);
      Procedure btnNenhumaClick(Sender: TObject);
      Procedure BtnInverteClick(Sender: TObject);
      Procedure dbgOperacaoDblClick(Sender: TObject);
      Procedure QryDetalheSTACONFIRMAChange(Sender: TField);
      Procedure HabilitaBotaoConfirma;
      Procedure dblAcaoExit(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure dbgOperacaoEnter(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   frmConfOrdemMovimentacao: TfrmConfOrdemMovimentacao;
   wDocumento, wPlano, wIdOperCust, wIdAcao, IDORDMOVINV, iCorretora: Integer;
   wFLGORDMOVINV, wIdLote, wTipoOrdMov, sNumDocumento: String;
   bTrocaLine, bHabilitaBotaoConfirma, bGrid: Boolean;
   wQtdCotaIni, dValor, wSaldoQtd, wSaldoVlr, wSaldoInutil, wSaldoAqui, wSaldoIRApu,
      wSaldo, fVrlRendimento, wVlrIRProv: Double;

Implementation

Uses DBaseDados, UBibliotecaInvest, UOperComum, UMensErro, UImpostos, UOperacaoInvest,
   FConsObservacaoOrdem;

{$R *.DFM}

Procedure TfrmConfOrdemMovimentacao.HabilitaBotaoConfirma;
Var
   Ponteiro: TBookmark;
Begin
   Ponteiro := QryDetalhe.GetBookmark;
   QryDetalhe.First;
   While Not QryDetalhe.eof Do
      Begin
         If QryDetalheSTACONFIRMA.Value <> QryDetalheSTACONFIRMA.OldValue Then
            Begin
               BtAutConfirma.Enabled := True;
               Break;
            End;
         QryDetalhe.Next;
      End;
   QryDetalhe.GotoBookmark(Ponteiro);
End;

Function TfrmConfOrdemMovimentacao.VerifFechamento: Boolean;
Var
   Ponteiro: TBookmark;
Begin
   Ponteiro := QryDetalhe.GetBookmark;
   If Not bGrid Then
      Begin
      End
   Else
      Begin
         If QryDetalheSTATMOVINV.Value = 'L' Then
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

Procedure TfrmConfOrdemMovimentacao.CmeCadastroFind(Sender: TObject);
Begin
   dblCarteira.Text := '';
   dblSiglaCorretora.Text := '';
   dblOperacao.Text := '';
   dblAcao.Text := '';
   dblBolsa.Text := '';
   dbDocumento.Text := '';
   QryDetalhe.Close;
   rQtdLote.Clear;
   rQtdAtual.Clear;
   rTotalOperacao.Clear;

   If MontaSelect.RetornouValor Then
      Begin
         dbDtaOperacao.Text := Copy(MontaSelect.ValoresChave[0], 1, 10);
         //AL_12 - Faz o exit para preencher as queries de carteira e corretora pela data correta
         dbDtaOperacaoExit(Sender);

         If MontaSelect.ValoresChave[1] <> '' Then
            Begin
               If QryBuscaCarteira.Locate('IDCARTEIRAINVEST', MontaSelect.ValoresChave[1], [loPartialKey]) Then
                  dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString;

               //AL_3
               If ((pRPI.FLGCARTGERENC = 'S') And (Trim(MontaSelect.ValoresChave[6]) <> '')) Then
                  Begin
                     If QryBuscaCarteira.Locate('IDCARTEIRAGERENC', MontaSelect.ValoresChave[6], [loPartialKey]) Then
                        dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString;
                  End;
            End;

         If MontaSelect.ValoresChave[2] <> '' Then
            If QryCorretValores.Locate('IDCORRETVALORES', MontaSelect.ValoresChave[2], [loPartialKey]) Then
               dblSiglaCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;

         If MontaSelect.ValoresChave[3] <> '' Then
            Begin
               If QryBuscaOperacao.Locate('IDTIPOOPERACAO', MontaSelect.ValoresChave[3], [loPartialKey]) Then
                  dblOperacao.Text := QryBuscaOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
            End;

         If MontaSelect.ValoresChave[4] <> '' Then
            Begin
               If QryInvestimentoAcao.Locate('IDINVESTIMENTO', MontaSelect.ValoresChave[4], [loPartialKey]) Then
                  dblAcao.Text := QryInvestimentoAcao.FieldByName('DESCINVESTIMENTO').AsString;
            End;

         If MontaSelect.ValoresChave[5] <> '' Then
            Begin
               If QryBolsaValores.Locate('IDBOLSAVALORES', MontaSelect.ValoresChave[5], [loPartialKey]) Then
                  dblBolsa.Text := QryBolsaValores.FieldByName('SGLBOLSAVALORES').AsString;
            End;

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
      End;
End;

Procedure TfrmConfOrdemMovimentacao.FormShow(Sender: TObject);
Begin
   Inherited;
   dbgOperacao.Font.Color := clGray;
   bTrocaLine := True;

   Qry.Open;
   QryBolsaValores.Open;
   QryBuscaCarteira.Open;
   QryCorretValores.Open;
   QryBuscaOperacao.Open;
   QryInvestimentoAcao.Open;
   //AL_12
   qryPlanoPatro.Open;
   CMeCadastro.AtualizaBotoes(self);
   wQtdCotaIni := pRPI.VLRCOTAINICART;
   wTipoOrdMov := pRPI.FLGORDMOVINV;
   wFLGORDMOVINV := pRPI.FLGORDMOVINV;
   IDORDMOVINV := 0;
   dbDtaOperacaoExit(Sender);
   // AL_11
   dbDtaOperacao.Date := pRPI.DATAMOVTORV;
   dbDtaOperacaoExit(Sender); // Fim AL_11
End;

Procedure TfrmConfOrdemMovimentacao.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   //AL_10 - Tem que encerrar a transação antes do Inherited
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

Procedure TfrmConfOrdemMovimentacao.AbreQry;
Begin
   rQtdPrevista.Clear;
   QryDetalhe.DisableControls;
   OperComum.LimpaParametros(QryDetalhe);
   //AL_10
   OperComum.LimpaParametros(QryDetalhe);
   rQtdLote.Clear;
   rQtdAtual.Clear;
   rTotalOperacao.Clear;

   QryDetalhe.ParamByName('DATAORDMOVINV').AsString := dbDtaOperacao.Text;
   //AL_10 - Ini

   //AL_12
   If Trim(dblPlanoPatro.Text) <> '' Then
      QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   If Trim(dblCarteira.Text) <> '' Then
      QryDetalhe.ParamByName('IDCARTEIRAINVEST').AsInteger := QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   If Trim(dblCarteira.Text) <> '' Then
      QryDetalhe.ParamByName('IDCARTEIRAGERENC').AsInteger := QryBuscaCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;

   //AL_10 - Fim
   If Trim(dblSiglaCorretora.Text) <> '' Then
      QryDetalhe.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;

   If Trim(dblOperacao.Text) <> '' Then
      QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger := QryBuscaOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;

   If Trim(dblAcao.Text) <> '' Then
      QryDetalhe.ParamByName('IDINVESTIMENTO').AsInteger := QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger;

   If Trim(dblBolsa.Text) <> '' Then
      QryDetalhe.ParamByName('IDBOLSAVALORES').AsInteger := QryBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

   QryDetalhe.Open;
   QryDetalhe.EnableControls;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;
End;

Procedure TfrmConfOrdemMovimentacao.AlimentaQryDetalhe;
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
   QryDetalheVALOR.ReadOnly := False;
End;

Function TfrmConfOrdemMovimentacao.AtualizaLoteGrid(IDINVESTIMENTO: Integer): Integer;
Begin
   // Busca a Quantidade por Lote na Bolsa
   Result := 0;
   If FazQuery(QryAux, 'SELECT DISTINCT QTDELOTE FROM ACOESXBOLSA WHERE IDACAO = ' +
      QuotedStr(IntToStr(IDINVESTIMENTO))) Then
      Result := QryAux.FieldByName('QTDELOTE').AsInteger;
   rQtdLote.Value := Result;
End;

Function TfrmConfOrdemMovimentacao.AtualizaLote(IDINVESTIMENTO: Integer): Double;
Var
   wQtdLote: Integer;
Begin
   // Busca a Quantidade por Lote na Bolsa
   wQtdLote := AtualizaLoteGrid(IDINVESTIMENTO);
   rQtdLote.Value := wQtdLote;
   Result := (DivValorZero((QryDetalhe.FieldByName('PUORDMOVINV').AsFloat *
      QryDetalhe.FieldByName('QTDEORDENADA').AsFloat), wQtdLote) - 0.0049);
End;

Procedure TfrmConfOrdemMovimentacao.AtualizaQtdAtual;
Var
   wQtdInvest, wSaldoInutil: Double;
Begin
   //AL_1
   //AL_2
   //AL_4
   //AL_6
   //AL_9
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

Procedure TfrmConfOrdemMovimentacao.AtualizaQtdPrevista;
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
            End
         Else If (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
            (QryDetalhe.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
            Begin
               rQtdPrevista.Value := rQtdPrevista.Value -
                  QryDetalhe.FieldByName('QTDEORDENADA').AsFloat;
            End;
         rTotalOperacao.Value := rTotalOperacao.Value + QryDetalhe.FieldByName('VALOR').AsFloat;

         QryDetalhe.Next;
      End;
   QryDetalhe.First;
   QryDetalhe.EnableControls;
End;

Procedure TfrmConfOrdemMovimentacao.sbtnProcurarClick(Sender: TObject);
Begin
   Inherited;
   CMeCadastro.AtualizaBotoes(self);
End;

Procedure TfrmConfOrdemMovimentacao.dbDtaOperacaoExit(Sender: TObject);
Begin
   Inherited;
   //Al_3
   If Trim(dbDtaOperacao.Text) <> '' Then
      Begin
         QryDetalheSGLCUSTODIANTE.ReadOnly := False;
         QryDetalheQTDEORDENADA.ReadOnly := False;
         QryDetalhePUORDMOVINV.ReadOnly := False;
         QryDetalheVALOR.ReadOnly := False;
         rQtdPrevista.Clear;

         AbreQry;
         AtualizaQtdPrevista;

         dbgOperacao.Font.Color := clGray;
         IDORDMOVINV := 0;
         QryDetalheSGLCUSTODIANTE.ReadOnly := True;
         QryDetalheQTDEORDENADA.ReadOnly := True;
         QryDetalhePUORDMOVINV.ReadOnly := True;
         QryDetalheVALOR.ReadOnly := True;
      End;
End;

Procedure TfrmConfOrdemMovimentacao.FormKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   Inherited;
   If Key = VK_Return Then //Enter - Troca de Campo
      SelectNext(ActiveControl, True, True)
End;

Procedure TfrmConfOrdemMovimentacao.ApuraSaldoIR;
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
            QryBuscaOperacao.FieldByName('FLGTRATAIR').AsString, fVrlRendimento);

         // Verifica se existe provisionamento de IR
         If Impostos.BuscaProvisaoIR(2, QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger) Then
            wVlrIRProv := (DivValorZero(wSaldoIRApu, wSaldoQtd) * QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat) * -1;
      End;
End;

Procedure TfrmConfOrdemMovimentacao.CancelaOperacao;
Begin
   QryDetalhe.Cancel;

   DtmBaseDados.dbBaseDados.Rollback;

   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color := clGray;
   dbgOperacao.Color := clwindow;

   dbgOperacao.SetFocus;

   QryDetalhe.Close;
   QryDetalhe.Open;
   AlimentaQryDetalhe;

End;

Function TfrmConfOrdemMovimentacao.ValidaCamposPrincipal: Boolean;
Begin

   Result := True;

   If dbDtaOperacao.Text = '' Then
      Begin
         MsgDlg('Informe o qual a Data de Operação.     ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dbDtaOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If dblCarteira.Text = '' Then
      Begin
         MsgDlg('Informe o qual a Carteira.     ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dblCarteira.SetFocus;
         Result := False;
         Exit;
      End;

   If dblSiglaCorretora.Text = '' Then
      Begin
         MsgDlg('Informe o qual a Sigla da Corretora.     ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dblSiglaCorretora.SetFocus;
         Result := False;
         Exit;
      End;

   If dblOperacao.Text = '' Then
      Begin
         MsgDlg('Informe o qual a Operação.     ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dbgOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If dblAcao.Text = '' Then
      Begin
         MsgDlg('Informe o qual a Ação.         ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dblAcao.SetFocus;
         Result := False;
         Exit;
      End;

   If dblBolsa.Text = '' Then
      Begin
         MsgDlg('Informe o qual a Bolsa.         ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dblBolsa.SetFocus;
         Result := False;
         Exit;
      End;
End;

Function TfrmConfOrdemMovimentacao.ValidaCamposDetalhe: Boolean;
Begin
   Result := True;
   If QryDetalhe.FieldByName('HORAMOV').IsNull Then
      Begin
         MsgDlg('Informe a Hora.                               ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dbgOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If QryDetalhe.FieldByName('QTDEORDENADA').IsNull Then
      Begin
         MsgDlg('Informe a Quantidade Negociada.',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dbgOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If QryDetalhe.FieldByName('PUORDMOVINV').IsNull Then
      Begin
         MsgDlg('Informe o Preço.               ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dbgOperacao.SetFocus;
         Result := False;
         Exit;
      End;

   If QryDetalhe.FieldByName('VALOR').IsNull Then
      Begin
         MsgDlg('Informe o Valor.               ',
            'Mensagem do Sistema', MtError, [MbOk], 0);
         dbgOperacao.SetFocus;
         Result := False;
         Exit;
      End;
End;

Function TfrmConfOrdemMovimentacao.DivValorZero(Valor1, Valor2: Extended): Extended;
Begin
   If Valor2 <> 0 Then
      Result := Valor1 / Valor2
   Else
      Result := 0;
End;

Procedure TfrmConfOrdemMovimentacao.dbgOperacaColExit(Sender: TObject);
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

Procedure TfrmConfOrdemMovimentacao.bbtnSairClick(Sender: TObject);
Begin
   Inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
End;

Procedure TfrmConfOrdemMovimentacao.BtAutConfirmaClick(Sender: TObject);
Begin
   Inherited;
   If DtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         Try
            // SOL 171022   KTN 1528923 - Paulo Nobre
            If VerificaConfirmadas Then // Só faz se tiver pelo menos uma Confirmada
               If VerificaCorretoras Then
                  Begin
                     If MsgDlg('Há ' + IntToStr(iCorretora) + ' Corretoras diferentes, autoriza ?', 'Mensagem do Sistema ',
                        mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
                        Begin
                           Exit;
                           DtmBaseDados.dbBaseDados.Rollback;
                        End;
                  End;
            QryDetalhe.ApplyUpdates;
            QryDetalhe.CommitUpdates;
            DtmBaseDados.dbBaseDados.Commit;
         Except
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Não foi possível realizar a Operação.',
               'Mensagem do Sistema ', mtWarning, [mbOK], 0);
         End;
         BtAutConfirma.Enabled := False;
      End;
End;

Procedure TfrmConfOrdemMovimentacao.PosicionaNumDocumento;
Begin
   QryNumDocumento.DisableControls;
   OperComum.LimpaParametros(QryNumDocumento);
   If dbDtaOperacao.Text <> '' Then
      QryNumDocumento.ParamByName('DATAORDMOVINV').AsString := dbDtaOperacao.Text;
   If Trim(dblCarteira.Text) <> '' Then
      QryNumDocumento.ParamByName('IDCARTEIRAINVEST').AsInteger := QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
   QryNumDocumento.Open;
   QryNumDocumento.EnableControls;
   If Not QryNumDocumento.IsEmpty Then
      Begin
         If Not QryNumDocumento.FieldByName('NUMDOCMOVINV').IsNull Then
            dbDocumento.Text := QryNumDocumento.FieldByName('NUMDOCMOVINV').AsString
         Else
            dbDocumento.Text := 'RV-' + Copy(dbDtaOperacao.Text, 9, 2) + '/' + FormatFloat('0000',
               LeUltRegistro(Nil, 'CONTDOCRENVAR' + Copy(dbDtaOperacao.Text, 9, 2)));
      End;
   QryNumDocumento.Close;
End;

Function TfrmConfOrdemMovimentacao.VerificaCorretoras: Boolean;
Var iIdCorretoraAtu, iIdCorretoraAnt: integer;
Begin
   // SOL 171022   KTN 1528923 - Paulo Nobre
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

Procedure TfrmConfOrdemMovimentacao.dblCarteiraExit(Sender: TObject);
Begin
   Inherited;
   QryDetalheSGLCUSTODIANTE.ReadOnly := False;
   QryDetalheQTDEORDENADA.ReadOnly := False;
   QryDetalhePUORDMOVINV.ReadOnly := False;
   QryDetalheVALOR.ReadOnly := False;

   AbreQry;
   If dblAcao.Text = '' Then
      AtualizaLote(QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger)
   Else
      AtualizaLote(QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger);

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
   IDORDMOVINV := 0;
   QryDetalheSGLCUSTODIANTE.ReadOnly := True;
   QryDetalheQTDEORDENADA.ReadOnly := True;
   QryDetalhePUORDMOVINV.ReadOnly := True;
   QryDetalheVALOR.ReadOnly := True;
End;

Procedure TfrmConfOrdemMovimentacao.btnTodasClick(Sender: TObject);
Begin
   Inherited;
   bGrid := False;
   If Not VerifFechamento Then
      Exit;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               Edit;
               FieldByName('STACONFIRMA').AsString := 'S';
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Procedure TfrmConfOrdemMovimentacao.btnNenhumaClick(Sender: TObject);
Begin
   Inherited;
   bGrid := False;
   If Not VerifFechamento Then
      Exit;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   With QryDetalhe Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
            Begin
               Edit;
               If QryDetalhe.FieldByName('STATUS').AsString <> 'F' Then
                  FieldByName('STACONFIRMA').AsString := 'N';
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Procedure TfrmConfOrdemMovimentacao.BtnInverteClick(Sender: TObject);
Begin
   Inherited;
   bGrid := False;
   If Not VerifFechamento Then
      Exit;

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
                     If (FieldByName('STACONFIRMA').AsString = 'S') Then
                        FieldByName('STACONFIRMA').AsString := 'N'
                     Else
                        FieldByName('STACONFIRMA').AsString := 'S';
                  End;
               Next;
            End;
         First;
         EnableControls;
      End;
End;

Procedure TfrmConfOrdemMovimentacao.dbgOperacaoDblClick(Sender: TObject);
Begin
   Inherited;
   Application.CreateForm(TFrmObservacaoOrdem, FrmObservacaoOrdem);
   FrmObservacaoOrdem.dbrObservacao.Text := QryDetalheOBSAUTMOV.AsString;
   FrmObservacaoOrdem.ShowModal;
   FrmObservacaoOrdem.Free;
End;

Procedure TfrmConfOrdemMovimentacao.QryDetalheSTACONFIRMAChange(
   Sender: TField);
Begin
   Inherited;
   If Not VerifFechamento Then
      Begin
         QryDetalhe.Cancel;
         Exit;
      End;
   HabilitaBotaoConfirma;
End;

Procedure TfrmConfOrdemMovimentacao.dblAcaoExit(Sender: TObject);
Begin
   Inherited;
   QryDetalheSGLCUSTODIANTE.ReadOnly := False;
   QryDetalheQTDEORDENADA.ReadOnly := False;
   QryDetalhePUORDMOVINV.ReadOnly := False;
   QryDetalheVALOR.ReadOnly := False;
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
   IDORDMOVINV := 0;
   QryDetalheSGLCUSTODIANTE.ReadOnly := True;
   QryDetalheQTDEORDENADA.ReadOnly := True;
   QryDetalhePUORDMOVINV.ReadOnly := True;
   QryDetalheVALOR.ReadOnly := True;
End;

Procedure TfrmConfOrdemMovimentacao.CmeCadastroAtualizaBotoes(
   Sender: TObject);
Begin
   Inherited;
   pnlFundo.Enabled := True;
End;

Procedure TfrmConfOrdemMovimentacao.dbgOperacaoEnter(Sender: TObject);
Begin
   Inherited;
   bGrid := True;
End;

Procedure TfrmConfOrdemMovimentacao.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   //AL_10 - Fecha a transaçãio se o usuário terminar a aplicação sem fechar o form
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   Inherited;
End;

// SOL 171022   KTN 1528923 - Paulo Nobre

Function TfrmConfOrdemMovimentacao.VerificaConfirmadas: Boolean;
Begin
   Try
      Try
         QryDetalhe.DisableControls;
         QryDetalhe.First;
         Result := False;
         While Not QryDetalhe.Eof Do
            Begin
               If QryDetalhe.FieldByName('STACONFIRMA').AsString = 'S' Then
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

