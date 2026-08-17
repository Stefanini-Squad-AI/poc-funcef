//*******************************************************************************************************
//N. Sol..........: 167458
//N. Kintana......: 1469280
//Data............: 27/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reagrupamento dos resultados para apresentação dos relatorios sintético e analítico
//*******************************************************************************************************
//N. Sol..........: 166300
//N. Kintana......: 1446695
//Data............: 07/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reagrupamento dos resultados para apresentação dos relatorios sintético e analítico
//                  Alteração no layout para prover esta nova ordenação
//******************************************************************************************************
//Rotina..........: FDMRelPosicaoJurosEmAberto
//N. Sol..........: 1600038
//N. Kintana......: 1331763
//Data............: 21/06/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Consulta Posição dos Juros em Aberto
//***********************************************************************************************
Unit FConsPosicaoJurosEmAberto;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
   wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, FPreview,
   uCtrlEmpAcoes, uCtrlPadroes;

Type
   TfrmConsPosicaoJurosEmAberto = Class(TfrmOkCancelarInv)
      Panel1: TPanel;
      dblInvestimento: TwwDBLookupCombo;
      qryInvestimento: TwwQuery;
      Label3: TLabel;
      Panel2: TPanel;
      dbgOperacoes: TwwDBGrid;
      bbtnImprimir: TBitBtn;
      ToolbarSep972: TToolbarSep97;
      lbPlanPrev: TLabel;
      dblkPlanPrev: TwwDBLookupCombo;
      qryPlanPrev: TwwQuery;
      qryPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryPlanPrevIDPLANOPREV: TFloatField;
      qryPlanPrevIDPATRO: TFloatField;
      gbPeriodo: TGroupBox;
      dtDataInicio: TCMDateTimePicker;
      dtDataFim: TCMDateTimePicker;
      Label1: TLabel;
      Label2: TLabel;
      rgTipo: TRadioGroup;
      qryInvestimentoIDACAO: TFloatField;
      qryInvestimentoSIGLAACAOBOLSA: TStringField;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnImprimirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure dtDataInicioExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure dblInvestimentoChange(Sender: TObject);
      Procedure dtDataInicioChange(Sender: TObject);
      Procedure dtDataFimChange(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure dblkPlanPrevChange(Sender: TObject);
      Procedure rgTipoClick(Sender: TObject);
   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   frmConsPosicaoJurosEmAberto: TfrmConsPosicaoJurosEmAberto;
   CtrlEmpAcoes: TCtrlEmpAcoes;
   dDataVig: TDateTime;

Implementation

Uses FDMRelPosicaoJurosEmAberto, UMensErro, UBibliotecaInvest, uOperComum;

{$R *.DFM}

Procedure TfrmConsPosicaoJurosEmAberto.FormCreate(Sender: TObject);
Begin
   WindowState := wsMaximized;
End;

Procedure TfrmConsPosicaoJurosEmAberto.FormShow(Sender: TObject);
Begin
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
   qryPlanPrev.Open;
   qryInvestimento.Open;
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;

   dDataVig := CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date());
   dtDataInicio.Text := DateToStr(dDataVig);
   dtDataFim.Text := DateTostr(Date);
End;

Procedure TfrmConsPosicaoJurosEmAberto.bbtnImprimirClick(Sender: TObject);
Begin
   //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
   If DMRelPosicaoJurosEmAberto.qryMovimentoCtr.IsEmpty And DMRelPosicaoJurosEmAberto.qryMovimento.IsEmpty Then
      exit;

   If rgTipo.itemindex = 0 Then // Sintético
      Begin
         DMRelPosicaoJurosEmAberto.pplPeriodo.Caption := 'Período : ' + dtDataInicio.Text + ' a ' + dtDataFim.Text;
         DMRelPosicaoJurosEmAberto.qryMovimento.DisableControls;
         TfrmPreview.CreateModalPreview(Application,
            DMRelPosicaoJurosEmAberto.rptMovEmpAcoes,
            DMRelPosicaoJurosEmAberto.rptMovEmpAcoes.PrinterSetup.DocumentName);
         DMRelPosicaoJurosEmAberto.qryMovimento.EnableControls;
      End
   Else
      Begin
         DMRelPosicaoJurosEmAberto.pplPeriodoCtr.Caption := 'Período : ' + dtDataInicio.Text + ' a ' + dtDataFim.Text;
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.DisableControls;
         TfrmPreview.CreateModalPreview(Application,
            DMRelPosicaoJurosEmAberto.rptMovEmpAcoesCtr,
            DMRelPosicaoJurosEmAberto.rptMovEmpAcoesCtr.PrinterSetup.DocumentName);
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.EnableControls;
      End;
End;

Procedure TfrmConsPosicaoJurosEmAberto.bbtnCancelarClick(Sender: TObject);
Begin
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   If dtDataInicio.CanFocus Then
      dtDataInicio.SetFocus;
End;

Procedure TfrmConsPosicaoJurosEmAberto.dtDataInicioExit(Sender: TObject);
Begin
   If Trim(dtDataFim.Text) = '' Then
      dtDataFim.DateTime := dtDataInicio.DateTime;
End;

Procedure TfrmConsPosicaoJurosEmAberto.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   qryInvestimento.Close;
   qryPlanPrev.Close;
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;

   FreeAndNil(CtrlEmpAcoes);
   Inherited;
End;

Procedure TfrmConsPosicaoJurosEmAberto.dblInvestimentoChange(Sender: TObject);
Begin
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;
End;

Procedure TfrmConsPosicaoJurosEmAberto.dtDataInicioChange(Sender: TObject);
Begin
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;
End;

Procedure TfrmConsPosicaoJurosEmAberto.dtDataFimChange(Sender: TObject);
Begin
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;
End;

Procedure TfrmConsPosicaoJurosEmAberto.bbtnConfirmarClick(Sender: TObject);
Begin
   If Trim(dtDataInicio.Text) = '' Then
      Begin
         MsgDlg('Data Inicial não informada.', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataInicio.CanFocus Then
            dtDataInicio.SetFocus;
         exit;
      End;

   If Trim(dtDataFim.Text) = '' Then
      Begin
         MsgDlg('Data Final não informada.', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataFim.CanFocus Then
            dtDataFim.SetFocus;
         exit;
      End;

   If StrToDate(dtDataInicio.Text) < dDataVig Then
      Begin
         MsgDlg('Data Inicial informada é anterior a data da vigência atual -> ' + datetostr(dDataVig) + '. Verifique !', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataInicio.CanFocus Then
            Begin
               dtDataInicio.Text := DateTostr(Date);
               dtDataInicio.SetFocus;
            End;
         Exit;
      End;

   If rgTipo.itemindex = 0 Then // Sintético
      Begin
         //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
         Screen.Cursor := crSQLWait;
         OperComum.LimpaParametros(DMRelPosicaoJurosEmAberto.qryMovimento);
         DMRelPosicaoJurosEmAberto.qryMovimento.ParamByName('DATAINI').AsString := dtDataInicio.Text;
         DMRelPosicaoJurosEmAberto.qryMovimento.ParamByName('DATAFIM').AsString := dtDataFim.Text;
         If Trim(dblInvestimento.Text) <> '' Then
            DMRelPosicaoJurosEmAberto.qryMovimento.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;

         If Trim(dblkPlanPrev.Text) <> '' Then
            DMRelPosicaoJurosEmAberto.qryMovimento.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPrev.LookupValue;

         DMRelPosicaoJurosEmAberto.qryMovimento.Close;
         dbgOperacoes.DataSource := DMRelPosicaoJurosEmAberto.dsMovimento;
         DMRelPosicaoJurosEmAberto.qryMovimento.Open;
         //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280 - Inicio
         DMRelPosicaoJurosEmAberto.qryMovimento.Filtered := False;
         DMRelPosicaoJurosEmAberto.qryMovimento.DisableControls;
         DMRelPosicaoJurosEmAberto.qryMovimento.Filter := 'SALDO_ANTERIOR <> 0 OR ENTRADA <> 0 OR SAIDA <> 0 OR SALDO_ATUAL <> 0';
         DMRelPosicaoJurosEmAberto.qryMovimento.Filtered := True;
         DMRelPosicaoJurosEmAberto.qryMovimento.EnableControls;

         Screen.Cursor := crDefault;
         //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280 - Fim
         If DMRelPosicaoJurosEmAberto.qryMovimento.EOF Then
            MsgDlg('Não há Movimento disponível para os critérios informados !', 'Atenção', mtWarning, [mbOK], 0);
      End
   Else
      Begin
         //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280
         Screen.Cursor := crSQLWait;
         OperComum.LimpaParametros(DMRelPosicaoJurosEmAberto.qryMovimentoCtr);
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.ParamByName('DATAINI').AsString := dtDataInicio.Text;
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.ParamByName('DATAFIM').AsString := dtDataFim.Text;
         If Trim(dblInvestimento.Text) <> '' Then
            DMRelPosicaoJurosEmAberto.qryMovimentoCtr.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;

         If Trim(dblkPlanPrev.Text) <> '' Then
            DMRelPosicaoJurosEmAberto.qryMovimentoCtr.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPrev.LookupValue;

         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;
         dbgOperacoes.DataSource := DMRelPosicaoJurosEmAberto.dsMovimentoCtr;
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Open;
         //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280 - Inicio
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Filtered := False;
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.DisableControls;
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Filter := 'SALDO_ANTERIOR <> 0 OR ENTRADA <> 0 OR SAIDA <> 0 OR SALDO_ATUAL <> 0';
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Filtered := True;
         DMRelPosicaoJurosEmAberto.qryMovimentoCtr.EnableControls;

         Screen.Cursor := crDefault;
         //Paulo Nobre - 27/10/2011 - N. Sol 167458 -  N. Kintana 1469280 - Fim
         If DMRelPosicaoJurosEmAberto.qryMovimentoCtr.EOF Then
            MsgDlg('Não há Movimento disponível para os critérios informados !', 'Atenção', mtWarning, [mbOK], 0);
      End;
End;

Procedure TfrmConsPosicaoJurosEmAberto.dblkPlanPrevChange(Sender: TObject);
Begin
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;
End;

Procedure TfrmConsPosicaoJurosEmAberto.rgTipoClick(Sender: TObject);
Begin
   DMRelPosicaoJurosEmAberto.qryMovimento.Close;
   DMRelPosicaoJurosEmAberto.qryMovimentoCtr.Close;
End;

End.

