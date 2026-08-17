{
--------------------------------------------------------------------------------
N. Chamado....: WO29522
Dt Alterações.: 31/12/2025
Responsável...: Paulo Nobre
Descrição.....: Substituição da exclusão dos lançamentos do método apply por
                exclusão com DELETE FROM.
--------------------------------------------------------------------------------
}
//******************************************************************************
//N. SIG..........: 125198
//Data............: 12/07/2022
//Responsável.....: Everson Cunha
//Descrição.......: Retirar obrigatoriedade do campo "Data Disponibilidade"
//******************************************************************************
//N. Sig..........: 90731
//Data............: 02/09/2019
//Responsável.....: Rafael Vasconcelos
//Descrição.......: Alteração do Centro de Responsabilidade para GEFIN
//******************************************************************************
//N. Sol..........: 218052
//N. Kintana......: 2048764
//Data............: 11/10/2013
//Responsável.....: Thiago Melo
//Descrição.......: Soma de valores Total Bloqueado
//******************************************************************************
//N. Sol..........: 207968
//N. Kintana......: 2040576
//Data............: 06/08/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Implementar Rateios, filtros e ajustes gerais
//******************************************************************************
//N. Sol..........: 207772
//N. Kintana......: 2007429
//Data............: 22/05/2012
//Responsável.....: Otacilio Aquino
//Descrição.......: Cadastro dos Bloqueios Judiciais retornar valor campo
//                  SITDESBLOQ = 0 ao excluir registro de desbloqueio.
//******************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 13/07/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro dos Bloqueios Judiciais
//******************************************************************************************
Unit fCadBloqueiosJudiciaisFinanc;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, TB97Ctls, TB97, TB97Tlbr, MAHlpBtn, Db, DBTables, Wwquery,
   MontaSelect, ImgList, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
   ExtCtrls, DBCtrls, CMProcuraMask, ComCtrls, Mask, wwdbedit, Wwdatsrc,
   TREdit, wwdbdatetimepicker, jpeg, uFuncoesUteisIR, uCMMath;

Const CorDaZebra = clBtnFace; //$00C0FFFF;

Type
   TDadosDesbloqueio = Record
      NumDocto: String;
      CodPortador: Integer;
      Valor: double;
      CentroRespon: String;
      PlanoPatro: Integer;
      IdRegistroBloqueioPai: Integer;
   End;

   TfrmCadBloqueiosJudiciaisFinanc = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      MontaSelect: TMontaSelect;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryAux: TQuery;
      qryTotalBloq: TwwQuery;
      dsTotalBloq: TDataSource;
      pnlDadosPrincipal: TPanel;
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      dbValorBloq: TDBRealEdit;
      dbNumDocto: TwwDBEdit;
      dbHist: TwwDBEdit;
      qryAux1: TQuery;
      qryLkpBanco: TwwQuery;
      qryLkpBancoDESCRICAO: TStringField;
      qryLkpBancoNUMBANCO: TStringField;
      qryLkpBancoNOCONTACORR: TStringField;
      qryLkpBancoCODPORTADOR: TFloatField;
      dsLkpBanco: TwwDataSource;
      dblkpBanco: TwwDBLookupCombo;
      Label2: TLabel;
      dbDtDisponib: TwwDBDateTimePicker;
      Label6: TLabel;
      qryTotalBloqSALDOB: TFloatField;
      dblkpCentroRespon: TwwDBLookupCombo;
      Label23: TLabel;
      qryLkpCentroRespon: TwwQuery;
      qryLkpCentroResponNOME: TStringField;
      qryLkpCentroResponCODCENTRORESPON: TStringField;
      dsLkpCentroRespon: TwwDataSource;
      qryLkpPlanPrev: TwwQuery;
      qryLkpPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryLkpPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryLkpPlanPrevIDPLANOPREV: TFloatField;
      qryLkpPlanPrevIDPATRO: TFloatField;
      dsLkpPlanPrev: TwwDataSource;
      sbtnProcurar: TToolbarButton97;
      sbtnDesbloquear: TToolbarButton97;
      dsMovBloqJudAberto: TDataSource;
      updMovBloqJudAberto: TUpdateSQL;
      Label5: TLabel;
      dbDtLancto: TwwDBDateTimePicker;
      pnlRateios: TPanel;
      Dock973: TDock97;
      tb97Detalhe: TToolbar97;
      btnCon1: TBitBtn;
      btnCan1: TBitBtn;
      Dock974: TDock97;
      lblTitDet: TLabel;
      Toolbar974: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      btnExc1: TToolbarButton97;
      qryRateios: TwwQuery;
      dsRateios: TDataSource;
      updRateio: TUpdateSQL;
      qryRateiosIDMOVFINBLOQJUDICIAIS: TFloatField;
      qryRateiosIDPLANPREVCTBPATR: TFloatField;
      qryRateiosVLRRATEIO: TFloatField;
      qryRateiosDSCPLANOPATRO: TStringField;
      ListaImagens: TImageList;
      ImlPadrao: TImageList;
      Panel1: TPanel;
      dbgRateios: TwwDBGrid;
      pnlDadosRateio: TPanel;
      Label10: TLabel;
      Label7: TLabel;
      dbValorRateio: TDBRealEdit;
      dblkpPlanoPatro: TwwDBLookupCombo;
      StaticText2: TStaticText;
      dbValorTotRateios: TwwDBEdit;
      qryTotalRateios: TwwQuery;
      dsTotalRateios: TDataSource;
      qryTotalRateiosTOTRATEIO: TFloatField;
      qryBancoFiltro: TwwQuery;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      FloatField1: TFloatField;
      dsBancoFiltro: TwwDataSource;
      edSaldoRateioRestante: TRealEdit;
      Label13: TLabel;
      pnlFiltros: TPanel;
      spbExecutarFiltro: TSpeedButton;
      spbDesfazerFiltro: TSpeedButton;
      GroupBox1: TGroupBox;
      pnlBanco: TPanel;
      Label8: TLabel;
      dblkpBancoFiltro: TwwDBLookupCombo;
      cb1: TCheckBox;
      cb2: TCheckBox;
      cb3: TCheckBox;
      pnlDatas: TPanel;
      Label9: TLabel;
      Label11: TLabel;
      dbDtLancDe: TwwDBDateTimePicker;
      dbDtLancAte: TwwDBDateTimePicker;
      pnlValor: TPanel;
      Label12: TLabel;
      rdbIgual: TRadioButton;
      rdbMenor: TRadioButton;
      rdbMaior: TRadioButton;
      edValorFiltro: TRealEdit;
      pcMovimentoBloqueios: TPageControl;
      tbsBloqJudAberto: TTabSheet;
      tbsBloqJudDesbloq: TTabSheet;
      pnlBloqueio: TPanel;
      StaticText1: TStaticText;
    edtTotBloqueado: TwwDBEdit;
      Panel2: TPanel;
      dbg: TwwDBGrid;
      dbgBloqAberto: TwwDBGrid;
      dsMovBloqJudDesbloq: TDataSource;
      qryMovBloqJudAberto: TwwQuery;
      qryMovBloqJudAbertoIDMOVFINBLOQJUDICIAIS: TFloatField;
      qryMovBloqJudAbertoCODPORTADOR: TFloatField;
      qryMovBloqJudAbertoSITBLOQDESBLOQ: TFloatField;
      qryMovBloqJudAbertoDSCSITBLOQDESBLOQ: TStringField;
      qryMovBloqJudAbertoDATALANCTO: TDateTimeField;
      qryMovBloqJudAbertoDATADISPONIB: TDateTimeField;
      qryMovBloqJudAbertoNUMDOCUMENTO: TStringField;
      qryMovBloqJudAbertoTIPOLANCTO: TStringField;
      qryMovBloqJudAbertoVALORLANCTO: TFloatField;
      qryMovBloqJudAbertoHISTORICO: TStringField;
      qryMovBloqJudAbertoIDPLANPREVCTBPATR: TFloatField;
      qryMovBloqJudAbertoCODCENTRORESPON: TStringField;
      qryMovBloqJudAbertoHISTPADFINAN: TFloatField;
      qryMovBloqJudAbertoIDMOVFINBLOQJUDICIAISPAI: TFloatField;
      qryMovBloqJudAbertoSITDESBLOQ: TFloatField;
      qryMovBloqJudAbertoNOMEBANCO: TStringField;
      qryMovBloqJudDesbloq: TwwQuery;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      DateTimeField1: TDateTimeField;
      DateTimeField2: TDateTimeField;
      StringField4: TStringField;
      StringField5: TStringField;
      FloatField4: TFloatField;
      StringField6: TStringField;
      FloatField5: TFloatField;
      StringField7: TStringField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      StringField9: TStringField;
      qryMovBloqJudDesbloqSITIMG: TStringField;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure sbtnDesbloquearClick(Sender: TObject);
      Procedure qryMovBloqJudAbertoAfterScroll(DataSet: TDataSet);
      Procedure btnInc1Click(Sender: TObject);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnExc1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
      Procedure dbgRateiosCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure spbExecutarFiltroClick(Sender: TObject);
      Procedure spbDesfazerFiltroClick(Sender: TObject);
      Procedure cb1Click(Sender: TObject);
      Procedure cb2Click(Sender: TObject);
      Procedure cb3Click(Sender: TObject);
      Procedure wwDBGrid1DrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure pcMovimentoBloqueiosChange(Sender: TObject);
   Private
      { Private declarations }
      Procedure CarregaMovimento;
      Function TemDesbloqueioAssociado: Boolean;
      Function PrepararFloat(sString: String): String;
      Function TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
      Function somaValorGrid (var qry : TwwQuery) : Double; // Thiago Melo SOL 218052 Kintana 2048764
   Public
      { Public declarations }
      iCodPortador: Integer;
      iIdMovFinBloqJud: Integer;
   End;

Var
   frmCadBloqueiosJudiciaisFinanc: TfrmCadBloqueiosJudiciaisFinanc;
   bDesbloqueia: Boolean;
   DadosDesbloqueio: TDadosDesbloqueio;

Implementation

Uses DBaseDados, uSistema, UMensErro, uCtrlPadroes;
{$R *.DFM}

Procedure TfrmCadBloqueiosJudiciaisFinanc.FormShow(Sender: TObject);
Begin
   If frmCadBloqueiosJudiciaisFinanc.WindowState = wsNormal Then
   Begin
     frmCadBloqueiosJudiciaisFinanc.Top := (Screen.Height - Height) Div 2;
     frmCadBloqueiosJudiciaisFinanc.Left := (Screen.Width - Width) Div 2;
   End;

   iIdMovFinBloqJud := 0;

   spbExecutarFiltro.enabled := False;
   spbDesfazerFiltro.enabled := False;
   cb1.Checked := False;
   cb2.Checked := False;
   cb3.Checked := False;
   pnlBanco.Enabled := cb1.Checked;
   pnlDatas.Enabled := cb2.Checked;
   pnlValor.Enabled := cb3.Checked;
   dblkpBancoFiltro.Text := '';
   dbDtLancDe.Date := strtodate('01/' + inttostr(ExtraiMes(date)) + '/' + inttostr(ExtraiAno(date)));
   dbDtLancAte.Date := TrazUltDiaData(dbDtLancDe.Date);
   rdbIgual.Checked := True;
   edValorFiltro.Text := '0,00';

   Screen.Cursor := crSQLWait;
   qryLkpBanco.Close;
   qryLkpBanco.Open;
   qryLkpPlanPrev.Close;
   qryLkpPlanPrev.Open;
   qryLkpCentroRespon.Close;
   qryLkpCentroRespon.Open;
   qryBancoFiltro.Close;
   qryBancoFiltro.Open;

   CarregaMovimento;

   Screen.Cursor := crDefault;

   pnlDadosPrincipal.enabled := False;
   pnlFiltros.enabled := (iCodPortador = -1); // Chamado pelo Menu Principal
   sbtnInserir.enabled := (iCodPortador = -1);
   sbtnAlterar.enabled := (iCodPortador = -1);
   sbtnApagar.enabled := (iCodPortador = -1);
   sbtnProcurar.enabled := (iCodPortador = -1);
   sbtnDesbloquear.enabled := (iCodPortador = -1);
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   dbgRateios.enabled := True;
   pnlDadosRateio.enabled := False;
   btnInc1.enabled := (iCodPortador = -1);
   btnAlt1.enabled := (iCodPortador = -1);
   btnExc1.enabled := (iCodPortador = -1);

   btnCon1.Enabled := False;
   btnCan1.Enabled := False;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.CarregaMovimento;
Begin
   qryRateios.DataSource := dsMovBloqJudAberto;
   qryTotalRateios.DataSource := dsMovBloqJudAberto;
   pcMovimentoBloqueios.ActivePageIndex := 0;
   bDesbloqueia := False;
   DadosDesbloqueio.NumDocto := '';
   DadosDesbloqueio.CodPortador := 0;
   DadosDesbloqueio.Valor := 0.00;
   DadosDesbloqueio.CentroRespon := '10077'; // Gestor sugeriu ser sempre TESOURARIA; Rafael Vasconcelos - SIG 90731
   DadosDesbloqueio.PlanoPatro := 21; // Gestor sugeriu ser sempre PGA;
   DadosDesbloqueio.IdRegistroBloqueioPai := 1;

   Screen.Cursor := crSQLWait;
   qryMovBloqJudAberto.Close;
   qryMovBloqJudAberto.SQL.Clear;
   qryMovBloqJudAberto.SQL.ADD('SELECT idmovfinbloqjudiciais, codportador, sitbloqdesbloq, DECODE(sitbloqdesbloq, 1, ''Bloqueio'', ''Desbloqueio'') dscSitBloqDesbloq,  ');
   qryMovBloqJudAberto.SQL.ADD('datalancto, datadisponib, numdocumento, tipolancto, valorlancto, historico,  ');
   qryMovBloqJudAberto.SQL.ADD('idplanprevctbpatr, codcentrorespon, histpadfinan, idmovfinbloqjudiciaispai, sitdesbloq   ');
   qryMovBloqJudAberto.SQL.ADD('FROM MOVFINBLOQJUDICIAIS WHERE    ');
   If iCodPortador <> -1 Then
      qryMovBloqJudAberto.SQL.ADD('CODPORTADOR = ' + floattostr(iCodPortador) + ' AND SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 0')
   Else If iIdMovFinBloqJud <> 0 Then
      qryMovBloqJudAberto.SQL.ADD('IDMOVFINBLOQJUDICIAIS = ' + floattostr(iIdMovFinBloqJud))
   Else
      qryMovBloqJudAberto.SQL.ADD('SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 0'); // somente os bloqueios que não foram desbloqueados

   qryMovBloqJudAberto.SQL.ADD('ORDER BY DATALANCTO DESC, CODPORTADOR ');
   qryMovBloqJudAberto.Open;

   qryMovBloqJudAbertoAfterScroll(qryMovBloqJudAberto);

   qryTotalBloq.Close;
   qryTotalBloq.SQL.Clear;
   qryTotalBloq.SQL.ADD('SELECT NVL(SUM(VALORLANCTO),0) AS SALDOB         ');
   qryTotalBloq.SQL.ADD('FROM MOVFINBLOQJUDICIAIS WHERE                   ');
   If iCodPortador <> -1 Then
      qryTotalBloq.SQL.ADD('CODPORTADOR = ' + floattostr(iCodPortador) + ' AND SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 0')
   Else If iIdMovFinBloqJud <> 0 Then
      qryTotalBloq.SQL.ADD('IDMOVFINBLOQJUDICIAIS = ' + floattostr(iIdMovFinBloqJud))
   Else
      qryTotalBloq.SQL.ADD('SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 0'); // somente os bloqueios que não foram desbloqueados
   qryTotalBloq.Open;

   qryMovBloqJudDesbloq.Close;
   qryMovBloqJudDesbloq.SQL.Clear;
   qryMovBloqJudDesbloq.SQL.ADD('SELECT *                          ');
   qryMovBloqJudDesbloq.SQL.ADD('FROM MOVFINBLOQJUDICIAIS WHERE    ');
   If iCodPortador <> -1 Then
      qryMovBloqJudDesbloq.SQL.ADD('CODPORTADOR = ' + floattostr(iCodPortador) + ' AND ');
   qryMovBloqJudDesbloq.SQL.ADD('(SITBLOQDESBLOQ = 1 AND SITDESBLOQ = 1) OR (SITBLOQDESBLOQ = 0 AND SITDESBLOQ = 0)');
   qryMovBloqJudDesbloq.SQL.ADD('ORDER BY IDMOVFINBLOQJUDICIAISPAI, CODPORTADOR, SITBLOQDESBLOQ DESC ');
   qryMovBloqJudDesbloq.Open;

   qryRateios.Close;
   qryRateios.Open;
   qryTotalRateios.Close;
   qryTotalRateios.Open;

   Screen.Cursor := crDefault;

   // Thiago Melo SOL 218052 Kintana 2048764
   if (not qryMovBloqJudAberto.IsEmpty) then begin
     edtTotBloqueado.Text := FloatToStr(somaValorGrid(qryMovBloqJudAberto));
     edtTotBloqueado.Text := FormatFloat('#,##0.00;(#,##0.00)',StrToFloat(edtTotBloqueado.Text));
     qryMovBloqJudAberto.EnableControls;
   end;
   // Thiago Melo SOL 218052 Kintana 2048764
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.sbtnProcurarClick(Sender: TObject);
Begin
   iIdMovFinBloqJud := 0;
   MontaSelect.Caption := 'Selecione os Bloqueios Judiciais';
   MontaSelect.Executar;
   If (MontaSelect.RetornouValor) Then
      iIdMovFinBloqJud := strtoint(MontaSelect.ValoresChave[0]);

   CarregaMovimento;
   sbtnProcurar.Down := False;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.bbtnSairClick(Sender: TObject);
Begin
   If pcMovimentoBloqueios.ActivePageIndex = 0 Then
      Begin
         If (Not qryMovBloqJudAberto.fieldbyname('IDMOVFINBLOQJUDICIAIS').isnull) And (qryRateios.IsEmpty) Then
            Begin
               Application.MessageBox(pchar('É obrigatório a inclusão de pelo menos um Rateio p/ este Bloqueio. Verifique !'), 'Atenção !', Mb_IconExclamation);
               exit;
            End;

         If RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2) < RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) Then
            Begin
               Application.MessageBox(pchar('Ainda existe um saldo de: ' + floattostrf(RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2), ffnumber, 12, 2) + #13 + #13 +
                  ' para ratear. Verifique !'), 'Atenção !', Mb_IconExclamation);
               exit;
            End;
      End;

   Close;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If pcMovimentoBloqueios.ActivePageIndex = 0 Then
      Begin
         If (Not qryMovBloqJudAberto.fieldbyname('IDMOVFINBLOQJUDICIAIS').isnull) And (qryRateios.IsEmpty) Then
            Begin
               Application.MessageBox(pchar('É obrigatório a inclusão de pelo menos um Rateio p/ este Bloqueio. Verifique !'), 'Atenção !', Mb_IconExclamation);
               CanClose := False;
               exit;
            End;

         If RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2) < RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) Then
            Begin
               Application.MessageBox(pchar('Ainda existe um saldo de: ' + floattostrf(RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2), ffnumber, 12, 2) + #13 + #13 +
                  ' para ratear. Verifique !'), 'Atenção !', Mb_IconExclamation);
               CanClose := False;
               exit;
            End;
      End;

   If qryMovBloqJudAberto.State In [dsEdit, dsInsert] Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryMovBloqJudAberto.CancelUpdates;
               qryMovBloqJudAberto.Close;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryRateios.Close;
               qryTotalRateios.Close;
               qryTotalBloq.Close;
               qryLkpBanco.Close;
               qryLkpPlanPrev.Close;
               qryLkpCentroRespon.Close;
               Screen.Cursor := crDefault;

               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryRateios.Close;
         qryTotalRateios.Close;
         qryTotalBloq.Close;
         qryLkpBanco.Close;
         qryLkpPlanPrev.Close;
         qryLkpCentroRespon.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.sbtnAlterarClick(Sender: TObject);
Begin
   sbtnAlterar.Down := True;
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If (Not qryMovBloqJudAberto.IsEmpty) Then
         Begin
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            sbtnDesbloquear.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;
            pnlFiltros.Enabled := False;
            dbg.enabled := False;
            pnlRateios.Enabled := False;

            qryMovBloqJudAberto.Edit;
            dbDtLancto.setfocus;
         End
      Else
         Begin
            Application.MessageBox('Sem Movimento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
            sbtnAlterar.Down := False;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.sbtnInserirClick(Sender: TObject);
Begin
   sbtnInserir.Down := True;
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;
      sbtnProcurar.enabled := False;
      sbtnDesbloquear.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      pnlDadosPrincipal.enabled := True;
      pnlFiltros.Enabled := False;
      dbg.enabled := False;
      pnlRateios.Enabled := False;
      dblkpBanco.Enabled := True;
      dbValorBloq.Enabled := True;

      qryMovBloqJudAberto.Insert;
      If Not bDesbloqueia Then
         Begin
            qryMovBloqJudAberto.FieldByName('SITBLOQDESBLOQ').AsInteger := 1; // Lançamento de Bloqueio
            qryMovBloqJudAberto.fieldByname('TIPOLANCTO').AsString := 'S'; // Saída de valor da conta - Bloqueio
         End
      Else
         Begin
            qryMovBloqJudAberto.FieldByName('SITBLOQDESBLOQ').AsInteger := 0; // Lançamento de Desbloqueio
            qryMovBloqJudAberto.FieldByName('NUMDOCUMENTO').AsString := DadosDesbloqueio.NumDocto;
            qryMovBloqJudAberto.FieldByName('CODPORTADOR').AsInteger := DadosDesbloqueio.CodPortador;
            qryMovBloqJudAberto.fieldByname('TIPOLANCTO').AsString := 'E'; // Entrada (retorno) de Valor na conta- Desbloqueio
            qryMovBloqJudAberto.FieldByName('VALORLANCTO').AsFloat := DadosDesbloqueio.Valor;
            qryMovBloqJudAberto.FieldByName('IDMOVFINBLOQJUDICIAISPAI').AsInteger := DadosDesbloqueio.IdRegistroBloqueioPai;
            dblkpBanco.Enabled := False;
            dbValorBloq.Enabled := False;
         End;

      qryMovBloqJudAberto.FieldByName('SITDESBLOQ').AsInteger := 0; // Não foi Desbloqueado
      qryMovBloqJudAberto.FieldByName('CODCENTRORESPON').AsString := DadosDesbloqueio.CentroRespon;
      qryMovBloqJudAberto.FieldByName('IDPLANPREVCTBPATR').AsInteger := DadosDesbloqueio.PlanoPatro;
      dbDtLancto.setfocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.bbtnCancelarClick(Sender: TObject);
Begin
   If qryMovBloqJudAberto.state In [dsEdit, dsInsert] Then
      Begin
         qryMovBloqJudAberto.CancelUpdates;

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;
      End;

   sbtnInserir.enabled := (iCodPortador = -1); // Chamado pelo Menu Principal
   sbtnAlterar.enabled := (iCodPortador = -1);
   sbtnApagar.enabled := (iCodPortador = -1);
   sbtnProcurar.enabled := (iCodPortador = -1);
   sbtnDesbloquear.enabled := (iCodPortador = -1);

   sbtnInserir.Down := False;
   sbtnAlterar.Down := False;
   sbtnApagar.Down := False;
   sbtnDesbloquear.Down := False;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   pnlDadosPrincipal.enabled := False;
   pnlFiltros.Enabled := True;
   dbg.enabled := True;
   pnlRateios.Enabled := True;
   dblkpBanco.Enabled := True;
   dbValorBloq.Enabled := True;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.sbtnApagarClick(Sender: TObject);
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If pcMovimentoBloqueios.ActivePageIndex = 0 Then
         Begin
            If (Not qryMovBloqJudAberto.IsEmpty) Then
               Begin
                If MsgDlg('Confirma Exclusão deste Bloqueio ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                   Begin
                      Screen.Cursor := crSQLWait;

                      // Paulo Nobre - WO29522 - Inicio
                      qryAux.Close;
                      qryAux.SQL.clear;
                      qryAux.SQL.ADD('DELETE FROM CM.MOVFINBLOQJUDICIAIS         ');
                      qryAux.SQL.ADD('WHERE IDMOVFINBLOQJUDICIAIS = ' + qryMovBloqJudDesbloq.fieldbyname('IDMOVFINBLOQJUDICIAIS').asstring);
                      If Not qryAux.Prepared Then
                         qryAux.Prepare;
                      qryAux.ExecSQL;
                      // Paulo Nobre - WO29522 - Fim

//                      qryMovBloqJudAberto.Delete;
//                      qryMovBloqJudAberto.ApplyUpdates;

                      dtmBaseDados.dbBaseDados.Commit;

                      CarregaMovimento;

                      Screen.Cursor := crDefault;
                  End;
               End
            Else
               Application.MessageBox('Sem Movimento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);

            sbtnApagar.Down := False;
         End
      Else
         Begin
            If (Not qryMovBloqJudDesbloq.IsEmpty) Then
               Begin
                 If TemDesbloqueioAssociado Then
                      MsgDlg('Atenção ! Bloqueio tem um Desbloqueio associado, exclua o Desbloqueio p/ liberar o Bloqueio !', 'Aviso', mtWarning, [mbOk], 0)
                 Else
                     If MsgDlg('Confirma Exclusão deste Desbloqueio ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                        Begin
                           Screen.Cursor := crSQLWait;

                           qryAux.Close;
                           qryAux.SQL.Clear;
                           qryAux.SQL.ADD('UPDATE MOVFINBLOQJUDICIAIS SET SITDESBLOQ = 0 '); // Liberando o Desbloqueio
                           qryAux.SQL.ADD('WHERE IDMOVFINBLOQJUDICIAIS = ' + qryMovBloqJudDesbloq.fieldbyname('IDMOVFINBLOQJUDICIAISPAI').asstring);
                           If Not qryAux.Prepared Then
                              qryAux.Prepare;
                           qryAux.ExecSQL;

                           // Paulo Nobre - WO29522 - Inicio
                           qryAux.Close;
                           qryAux.SQL.Clear;
                           qryAux.SQL.ADD('DELETE FROM CM.MOVFINBLOQJUDICIAIS         ');
                           qryAux.SQL.ADD('WHERE IDMOVFINBLOQJUDICIAIS = ' + qryMovBloqJudDesbloq.fieldbyname('IDMOVFINBLOQJUDICIAIS').asstring);
                           If Not qryAux.Prepared Then
                              qryAux.Prepare;
                           qryAux.ExecSQL;

//                           qryMovBloqJudDesbloq.Delete;
//                           qryMovBloqJudAberto.ApplyUpdates;

                           // Paulo Nobre - WO29522 - Fim

                           dtmBaseDados.dbBaseDados.Commit;

                           CarregaMovimento;
                           Screen.Cursor := crDefault;

                           bbtnCancelarClick(Self);
                        End;
               End
            Else
               Application.MessageBox('Sem Movimento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);

            sbtnApagar.Down := False;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.bbtnConfirmarClick(Sender: TObject);
Begin
   If dbDtLancto.Date = 0 Then
      Begin
         MsgDlg('Data do Lançamento tem que ser Informada !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

      //Everson Cunha - SIG125198 - Ini
   {If dbDtDisponib.Date = 0 Then
      Begin
         MsgDlg('Data da Disponibilidade tem que ser Informada !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If dbDtDisponib.Date < dbDtLancto.Date Then
      Begin
         MsgDlg('Data da Disponibilidade tem que ser MAOIR OU IGUAL a Data do Lançamento !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;}
      //Everson Cunha - SIG125198 - Fim

   If dblkpBanco.text = '' Then
      Begin
         MsgDlg('Banco/Conta tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If dbValorBloq.Value = 0 Then
      Begin
         MsgDlg('Valor tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If dbNumDocto.Text = '' Then
      Begin
         MsgDlg('Nº do Documento tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   If dbHist.Text = '' Then
      Begin
         MsgDlg('Histórico tem que ser Informado !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryMovBloqJudAberto.State In [dsInsert, dsEdit] Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If qryMovBloqJudAberto.State = dsInsert Then
                     Begin
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQMOVFINBLOQJUDICIAIS.NEXTVAL SEQ FROM DUAL');
                        qryAux.Open;

                        qryMovBloqJudAberto.fieldByname('IDMOVFINBLOQJUDICIAIS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                        If qryMovBloqJudAberto.fieldByname('SITBLOQDESBLOQ').AsInteger = 1 Then // Lançamento de Bloqueio
                           qryMovBloqJudAberto.fieldByname('IDMOVFINBLOQJUDICIAISPAI').asInteger := qryAux.fieldByname('SEQ').asInteger;

                        If bDesbloqueia Then // Se for Desbloqueio, então seta uma situação de que o regsitro Pai foi desbloqueado
                           Begin
                              qryAux.Close;
                              qryAux.SQL.clear;
                              qryAux.SQL.ADD('UPDATE MOVFINBLOQJUDICIAIS SET SITDESBLOQ = 1 '); // Foi Desbloqueado
                              qryAux.SQL.ADD('WHERE IDMOVFINBLOQJUDICIAIS = ' + IntToStr(DadosDesbloqueio.IdRegistroBloqueioPai));
                              If Not qryAux.Prepared Then
                                 qryAux.Prepare;
                              qryAux.ExecSQL;
                           End;
                     End;

                  qryMovBloqJudAberto.ApplyUpdates;
                  dtmBaseDados.dbBaseDados.Commit;

                  CarregaMovimento;

                  Screen.Cursor := crDefault;
               End;

            bbtnCancelarClick(Self);
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Function TfrmCadBloqueiosJudiciaisFinanc.TemDesbloqueioAssociado: Boolean;
Begin
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT COUNT(*) AS QTDLANC        ');
   qryAux.SQL.add('FROM MOVFINBLOQJUDICIAIS          ');
   qryAux.SQL.add('WHERE IDMOVFINBLOQJUDICIAISPAI = ' + qryMovBloqJudDesbloq.fieldByname('IDMOVFINBLOQJUDICIAIS').asString);
   qryAux.SQL.add('      AND SITBLOQDESBLOQ = 0      '); // Lançamento de Desbloqueio
   qryAux.Open;
   Result := (qryAux.fieldbyname('QTDLANC').asInteger > 0);
   qryAux.Close;
   Cursor := crDefault;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.sbtnDesbloquearClick(Sender: TObject);
Begin
   bDesbloqueia := True;

   DadosDesbloqueio.IdRegistroBloqueioPai := qryMovBloqJudAberto.FieldByName('IDMOVFINBLOQJUDICIAIS').AsInteger;
   DadosDesbloqueio.NumDocto := qryMovBloqJudAberto.FieldByName('NUMDOCUMENTO').AsString;
   DadosDesbloqueio.CodPortador := qryMovBloqJudAberto.FieldByName('CODPORTADOR').AsInteger;
   DadosDesbloqueio.Valor := qryMovBloqJudAberto.FieldByName('VALORLANCTO').AsFloat;
   DadosDesbloqueio.CentroRespon := qryMovBloqJudAberto.FieldByName('CODCENTRORESPON').AsString;
   DadosDesbloqueio.PlanoPatro := qryMovBloqJudAberto.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   sbtnInserirClick(self);
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.qryMovBloqJudAbertoAfterScroll(DataSet: TDataSet);
Begin
   sbtnDesbloquear.Visible := ((qryMovBloqJudAberto.fieldByname('SITBLOQDESBLOQ').AsInteger = 1) And (qryMovBloqJudAberto.fieldByname('SITDESBLOQ').AsInteger = 0));
   edSaldoRateioRestante.value := RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2);
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.btnInc1Click(Sender: TObject);
Begin
   btnInc1.down := True;
   If qryRateios.State <> dsInsert Then
      Begin
         Try
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            sbtnDesbloquear.enabled := False;

            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            pnlBloqueio.enabled := False;
            pnlFiltros.enabled := False;
            dbgRateios.enabled := False;
            pnlDadosRateio.enabled := True;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            qryRateios.Insert;

            dblkpPlanoPatro.setfocus;
         Except
            btnCan1Click(Self);
            Raise;
         End;
      End
   Else
      btnInc1.Down := False;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.btnAlt1Click(Sender: TObject);
Begin
   If Not qryRateios.isEmpty Then
      Begin
         btnAlt1.down := True;
         If qryRateios.State <> dsInsert Then
            Begin
               Try
                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnAlterar.enabled := False;
                  sbtnProcurar.enabled := False;
                  sbtnDesbloquear.enabled := False;
                  bbtnConfirmar.enabled := False;
                  bbtnCancelar.enabled := False;

                  pnlBloqueio.enabled := False;
                  pnlFiltros.enabled := False;
                  dbgRateios.enabled := False;
                  pnlDadosRateio.enabled := True;

                  btnInc1.enabled := False;
                  btnExc1.enabled := False;
                  btnCon1.Enabled := True;
                  btnCan1.Enabled := True;

                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryRateios.Edit;
                  dblkpPlanoPatro.setfocus;
               Except
                  btnCan1Click(Self);
                  Raise;
               End;
            End
         Else
            btnAlt1.Down := False;
      End
   Else
      btnAlt1.Down := False;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.btnExc1Click(Sender: TObject);
Begin
   If Not qryRateios.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Rateio ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryRateios.Delete;
                  qryRateios.ApplyUpdates;
                  dtmBaseDados.dbBaseDados.Commit;

                  qryRateios.Close;
                  qryRateios.Open;
                  qryTotalRateios.Close;
                  qryTotalRateios.Open;
                  Screen.Cursor := crDefault;

                  edSaldoRateioRestante.value := RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2);

                  If RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2) < RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) Then
                     Application.MessageBox(pchar('Ainda existe um saldo de: ' + floattostrf(RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2), ffnumber, 12, 2) + #13 + #13 +
                        ' para ratear. Verifique !'), 'Atenção !', Mb_IconExclamation);

                  btnCan1Click(Self);
               End;
         Except
            Raise;
         End;
      End
   Else
      btnAlt1.Down := False;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.btnCon1Click(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryRateios.State In [dsInsert, dsEdit] Then
               Begin
                  If (dblkpPlanoPatro.Text = '') Then
                     Begin
                        Application.MessageBox('Plano/Patro não Informado !', 'Atenção !', Mb_IconExclamation);
                        dblkpPlanoPatro.setfocus;
                        Exit;
                     End;

                  If dbValorRateio.Value = 0 Then
                     Begin
                        Application.MessageBox('Valor do Rateio não Informado !', 'Atenção !', Mb_IconExclamation);
                        dbValorRateio.setfocus;
                        Exit;
                     End;

                  If RoundCM(qryRateiosVLRRATEIO.AsFloat, 2) > RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) Then
                     Begin
                        Application.MessageBox('Valor do Rateio não pode ser MAIOR que o Valor Total do Bloqueio !', 'Atenção !', Mb_IconExclamation);
                        dbValorRateio.setfocus;
                        Exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryRateios.State = dsInsert Then
                     Begin
                        qryRateios.fieldByname('IDMOVFINBLOQJUDICIAIS').asInteger := qryMovBloqJudAberto.fieldByname('IDMOVFINBLOQJUDICIAIS').asInteger; ;

                        qryAux.Close;
                     End;

                  qryRateios.ApplyUpdates;
                  qryTotalRateios.Close;
                  qryTotalRateios.Open;

                  If RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2) > RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) Then
                     Begin
                        Application.MessageBox('Total dos Rateio não pode ser MAIOR que o Valor Total do Bloqueio !', 'Atenção !', Mb_IconExclamation);
                        dbValorRateio.setfocus;
                        Exit;
                     End;

                  dtmBaseDados.dbBaseDados.Commit;
                  qryRateios.Close;
                  qryRateios.Open;

                  edSaldoRateioRestante.value := RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2);

                  If RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2) < RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) Then
                     Application.MessageBox(pchar('Ainda existe um saldo de: ' + floattostrf(RoundCM(qryMovBloqJudAbertoVALORLANCTO.asFloat, 2) - RoundCM(qryTotalRateiosTOTRATEIO.asFloat, 2), ffnumber, 12, 2) + #13 + #13 +
                        ' para ratear. Verifique !'), 'Atenção !', Mb_IconExclamation);

                  Screen.Cursor := crDefault;

                  btnCan1Click(Self);
               End;
         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.btnCan1Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryRateios.state In [dsEdit, dsInsert] Then
            qryRateios.CancelUpdates;

         dtmBaseDados.dbBaseDados.RollBack;

         qryRateios.Close;
         qryRateios.Open;
         qryTotalRateios.Close;
         qryTotalRateios.Open;
      End;

   sbtnInserir.enabled := True;
   sbtnApagar.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnProcurar.enabled := True;
   sbtnDesbloquear.enabled := True;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   pnlBloqueio.enabled := True;
   pnlFiltros.enabled := True;
   dbgRateios.enabled := True;
   pnlDadosRateio.enabled := False;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;
   btnCon1.enabled := False;
   btnCan1.enabled := False;
   btnInc1.down := False;
   btnAlt1.down := False;
   btnExc1.down := False;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.dbgRateiosCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := CorDaZebra
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.spbExecutarFiltroClick(Sender: TObject);
Var dSep: char;
   fValor: Extended;
   sSinal, sCriterioFiltro1, sCriterioFiltro2, sCriterioFiltro3: String;
Begin
   If (cb1.Checked) Or (cb2.Checked) Or (cb3.Checked) Then
   Begin
     pcMovimentoBloqueios.ActivePageIndex := 0;
     sCriterioFiltro1 := '';
     sCriterioFiltro2 := '';
     sCriterioFiltro3 := '';

     // Filtrando somente pelo banco
     If (cb1.Checked) Then
       If (dblkpBancoFiltro.Text <> '') Then
         sCriterioFiltro1 := 'CODPORTADOR = ' + quotedstr(qryBancoFiltro.fieldbyname('CODPORTADOR').asString)
       Else
       Begin
         Application.MessageBox('Banco selecionado mas não informado. Verifique !', 'Atenção !', Mb_IconExclamation);
         Exit;
       End;

     // Filtrando somente pelas datas
     If (cb2.Checked) Then
       sCriterioFiltro2 := 'DATALANCTO >= ' + quotedstr(dbDtLancDe.text) + ' AND DATALANCTO <= ' + quotedstr(dbDtLancAte.text);

     // Filtrando somente pelo valor
     If (cb3.Checked) Then
       If (edValorFiltro.Value <> 0) Then
       Begin
         If rdbIgual.Checked Then sSinal := ' = ';
         If rdbMenor.Checked Then sSinal := ' < ';
         If rdbMaior.Checked Then sSinal := ' > ';

         dSep := DecimalSeparator;
         sCriterioFiltro3 := 'VALORLANCTO ' + sSinal + PrepararFloat(edValorFiltro.text);
         DecimalSeparator := dSep;
       End
       Else
       Begin
         Application.MessageBox('Valor selecionado mas não informado. Verifique !', 'Atenção !', Mb_IconExclamation);
         Exit;
       End;

     Cursor := crSQLWait;
     qryMovBloqJudAberto.Filtered := False;
     
     If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 = '') Then begin
       // Somente Banco
       qryMovBloqJudAberto.Filter := sCriterioFiltro1;
     end;


     If (sCriterioFiltro1 = '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 = '') Then begin
       // Somente Datas
       qryMovBloqJudAberto.Filter := sCriterioFiltro2;
     end;

     If (sCriterioFiltro1 = '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 <> '') Then begin
       // Somente Valor
       qryMovBloqJudAberto.Filter := sCriterioFiltro3;
     end;

     If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 = '') Then begin
       // Banco + Datas
       qryMovBloqJudAberto.Filter := sCriterioFiltro1 + ' AND ' + sCriterioFiltro2;
     end;

     If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 = '') And (sCriterioFiltro3 <> '') Then begin
       // Banco + Valor
       qryMovBloqJudAberto.Filter := sCriterioFiltro1 + ' AND ' + sCriterioFiltro3;
     end;

     If (sCriterioFiltro1 <> '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 <> '') Then begin
       // Banco + Datas + Valor
       qryMovBloqJudAberto.Filter := sCriterioFiltro1 + ' AND ' + sCriterioFiltro2 + ' AND ' + sCriterioFiltro3;
     end;

     If (sCriterioFiltro1 = '') And (sCriterioFiltro2 <> '') And (sCriterioFiltro3 <> '') Then begin
       // Datas + Valor
       qryMovBloqJudAberto.Filter := sCriterioFiltro2 + ' AND ' + sCriterioFiltro3;
     end;

     qryMovBloqJudAberto.Filtered := True;
     Cursor := crDefault;
     spbDesfazerFiltro.enabled := True;

     // Thiago Melo SOL 218052 Kintana 2048764
     if (not qryMovBloqJudAberto.IsEmpty) then begin
       edtTotBloqueado.Text := FloatToStr(somaValorGrid(qryMovBloqJudAberto));
       edtTotBloqueado.Text := FormatFloat('#,##0.00;(#,##0.00)',StrToFloat(edtTotBloqueado.Text));
       qryMovBloqJudAberto.EnableControls;
     end;
     // Thiago Melo SOL 218052 Kintana 2048764
   End;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.spbDesfazerFiltroClick(Sender: TObject);
Begin
   pcMovimentoBloqueios.ActivePageIndex := 0;
   dblkpBancoFiltro.Text := '';
   dbDtLancDe.Date := strtodate('01/' + inttostr(ExtraiMes(date)) + '/' + inttostr(ExtraiAno(date)));
   dbDtLancAte.Date := TrazUltDiaData(dbDtLancDe.Date);
   rdbIgual.Checked := True;
   edValorFiltro.Text := '0,00';
   cb1.Checked := False;
   cb2.Checked := False;
   cb3.Checked := False;
   pnlBanco.Enabled := cb1.Checked;
   pnlDatas.Enabled := cb2.Checked;
   pnlValor.Enabled := cb3.Checked;
   spbExecutarFiltro.enabled := False;
   spbDesfazerFiltro.enabled := False;
   Cursor := crSQLWait;
   qryMovBloqJudAberto.Filtered := False;
   qryMovBloqJudAberto.Filter := 'IDMOVFINBLOQJUDICIAIS <> ''-1'' '; // Macete só para desfazer
   qryMovBloqJudAberto.Filtered := True;
   Cursor := crDefault;

   // Thiago Melo SOL 218052 Kintana 2048764
   if (not qryMovBloqJudAberto.IsEmpty) then begin
     edtTotBloqueado.Text := FloatToStr(somaValorGrid(qryMovBloqJudAberto));
     edtTotBloqueado.Text := FormatFloat('#,##0.00;(#,##0.00)',StrToFloat(edtTotBloqueado.Text));
     qryMovBloqJudAberto.EnableControls;
   end;
   // Thiago Melo SOL 218052 Kintana 2048764
End;

Function TfrmCadBloqueiosJudiciaisFinanc.PrepararFloat(sString: String): String;
Begin
   Result := sString;
   Result := TrocaTexto(Result, '.', DecimalSeparator);
   Result := TrocaTexto(Result, ',', DecimalSeparator);
End;

Function TfrmCadBloqueiosJudiciaisFinanc.TrocaTexto(sString: String; sOld: String; sNew: String; bInsensitive: boolean = true): String;
Var
   iPosition: integer;
   sTemp: String;
Begin
   iPosition := 1;
   sTemp := '';
   While (iPosition > 0) Do
      Begin
         If bInsensitive Then
            iPosition := AnsiPos(UpperCase(sOld), UpperCase(sString))
         Else
            iPosition := AnsiPos(sOld, sString);
         If (iPosition > 0) Then
            Begin
               sTemp := sTemp + copy(sString, 1, iPosition - 1) + sNew;
               sString := copy(sString, iPosition + Length(sOld), Length(sString));
            End;
      End;
   sTemp := sTemp + sString;
   Result := (sTemp);
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.cb1Click(Sender: TObject);
Begin
   pnlBanco.Enabled := cb1.Checked;
   spbExecutarFiltro.enabled := True;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.cb2Click(Sender: TObject);
Begin
   pnlDatas.Enabled := cb2.Checked;
   spbExecutarFiltro.enabled := True;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.cb3Click(Sender: TObject);
Begin
   pnlValor.Enabled := cb3.Checked;
   rdbIgual.checked;
   spbExecutarFiltro.enabled := True;
End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.wwDBGrid1DrawDataCell(
   Sender: TObject; Const Rect: TRect; Field: TField;
   State: TGridDrawState);
Var
   bitmap: TBitmap;
   fixRect: TRect;
   bmpWidth: integer;
   imgIndex: integer;
Begin
   If Not qryMovBloqJudDesbloq.isEmpty Then
      Begin
         fixRect := Rect;
         If Field.FieldName = 'SITIMG' Then
            Begin
               If qryMovBloqJudDesbloq.fieldByname('SITBLOQDESBLOQ').AsInteger = 1 Then // Lançamento de Bloqueio
                  Begin
                     imgIndex := 5;
                     dbg.Canvas.Font.Color := clRed;
                  End
               Else
                  Begin
                     imgIndex := 4;
                     dbg.Canvas.Font.Color := clGreen;
                  End;

               bitmap := TBitmap.Create;
               Try
                  ImlPadrao.GetBitmap(imgIndex, bitmap);
                  bmpWidth := (Rect.Bottom - Rect.Top);
                  fixRect.Right := Rect.Left + bmpWidth;
                  dbg.Canvas.StretchDraw(fixRect, bitmap);
               Finally
                  bitmap.Free;
               End;

               fixRect := Rect;
               fixRect.Left := fixRect.Left + bmpWidth;
            End;

         dbg.DefaultDrawDataCell(fixRect, Field, State);
      End;

End;

Procedure TfrmCadBloqueiosJudiciaisFinanc.pcMovimentoBloqueiosChange(Sender: TObject);
Begin
   sbtnInserir.enabled := (iCodPortador = -1); // Chamado pelo Menu Principal
   sbtnAlterar.enabled := (iCodPortador = -1);
   sbtnApagar.enabled := (iCodPortador = -1);
   sbtnProcurar.enabled := (iCodPortador = -1);
   sbtnDesbloquear.enabled := (iCodPortador = -1);
   pnlFiltros.Enabled := True;
   pnlRateios.Enabled := True;
   qryRateios.DataSource := dsMovBloqJudAberto;
   qryTotalRateios.DataSource := dsMovBloqJudAberto;

   If pcMovimentoBloqueios.ActivePageIndex = 1 Then
   Begin
     sbtnInserir.enabled := False;
     sbtnAlterar.enabled := False;
     sbtnApagar.enabled := True;
     sbtnProcurar.enabled := False;
     sbtnDesbloquear.enabled := False;
     bbtnConfirmar.enabled := False;
     bbtnCancelar.enabled := False;
     pnlFiltros.Enabled := False;
     pnlRateios.Enabled := False;
     qryRateios.DataSource := dsMovBloqJudDesbloq;
     qryTotalRateios.DataSource := dsMovBloqJudDesbloq;

     // Thiago Melo SOL 218052 Kintana 2048764
     dbDtLancto.DataSource := dsMovBloqJudDesbloq;
     dbDtLancto.DataField := 'DATALANCTO';

     dbDtDisponib.DataSource := dsMovBloqJudDesbloq;
     dbDtDisponib.DataField := 'DATADISPONIB';

     dblkpBanco.DataSource := dsMovBloqJudDesbloq;
     dblkpBanco.DataField := 'CODPORTADOR';

     dbNumDocto.DataSource := dsMovBloqJudDesbloq;
     dbNumDocto.DataField := 'NUMDOCUMENTO';

     dblkpCentroRespon.DataSource := dsMovBloqJudDesbloq;
     dblkpCentroRespon.DataField := 'CODCENTRORESPON';

     dbHist.DataSource := dsMovBloqJudDesbloq;
     dbHist.DataField := 'HISTORICO';

     dbValorBloq.DataSource := dsMovBloqJudDesbloq;
     dbValorBloq.DataField := 'VALORLANCTO';
     // Thiago Melo SOL 218052 Kintana 2048764
   End
   // Thiago Melo SOL 218052 Kintana 2048764
   else begin
     dbDtLancto.DataSource := dsMovBloqJudAberto;
     dbDtLancto.DataField := 'DATALANCTO';

     dbDtDisponib.DataSource := dsMovBloqJudAberto;
     dbDtDisponib.DataField := 'DATADISPONIB';

     dblkpBanco.DataSource := dsMovBloqJudAberto;
     dblkpBanco.DataField := 'CODPORTADOR';

     dbNumDocto.DataSource := dsMovBloqJudAberto;
     dbNumDocto.DataField := 'NUMDOCUMENTO';

     dblkpCentroRespon.DataSource := dsMovBloqJudAberto;
     dblkpCentroRespon.DataField := 'CODCENTRORESPON';

     dbHist.DataSource := dsMovBloqJudAberto;
     dbHist.DataField := 'HISTORICO';

     dbValorBloq.DataSource := dsMovBloqJudAberto;
     dbValorBloq.DataField := 'VALORLANCTO';
   end;
   // Thiago Melo SOL 218052 Kintana 2048764
End;

// Thiago Melo SOL 218052 Kintana 2048764
function TfrmCadBloqueiosJudiciaisFinanc.somaValorGrid(
  var qry: TwwQuery): Double;
var
  valor : Double;
begin
  valor := 0;

  qry.First;
  qry.DisableControls;

  while (not qry.Eof) do begin
    valor := valor + qry.FieldByName('VALORLANCTO').AsFloat;
    qry.Next;
  end;
  qry.EnableConstraints;
  qry.First;
  dbgBloqAberto.RefreshDisplay;

  result := valor;
end;
// Thiago Melo SOL 218052 Kintana 2048764

End.

