//*******************************************************************************************************
//N. Sol..........: 163239
//N. Kintana......: 1392476
//Data............: 16/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado os campos da grid para considerar os novos tipos 6, 7
//***************************************************************************************************
// Data      : 28/05/2008
// Código    : AL_3
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Reformulação do relatório incluindo a coluna juros até o dia
//******************************************************************************
// Data      : 01/10/2007
// Código    : AL_2
// Pendencia : 26447
// SOL       : 70152
// Desc      : Inclusão do campo Valor dos Juros no relatório de Saldos de Empréstimo de Ações.
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_1
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro
//******************************************************************************

Unit FConsSaldoEmpAcoes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook, FPreview,
   wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid,
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   uCtrlEmpAcoes, uCtrlPadroes, 
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   DBGrids;

Type
   TfrmConsSaldoEmpAcoes = Class(TfrmOkCancelarInv)
      Panel1: TPanel;
      dtDataIni: TCMDateTimePicker;
      dblInvestimento: TwwDBLookupCombo;
      qryInvestimento: TwwQuery;
      Label1: TLabel;
      Label3: TLabel;
      Panel2: TPanel;
      Panel11: TPanel;
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
      qryInvestimentoIDINVESTIMENTO: TFloatField;
      qryInvestimentoDESCINVESTIMENTO: TStringField;
      bbtnImprimir: TBitBtn;
      ToolbarSep972: TToolbarSep97;
      qryPlanPrev: TwwQuery;
      qryPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryPlanPrevIDPLANOPREV: TFloatField;
      qryPlanPrevIDPATRO: TFloatField;
      lbPlanPrev: TLabel;
      dblkPlanPrev: TwwDBLookupCombo;
      Label2: TLabel;
      dtDataFim: TCMDateTimePicker;
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
      dbgOperacoes: TwwDBGrid;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnImprimirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure dblInvestimentoChange(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      Procedure dtDataIniCloseUp(Sender: TObject);
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      Procedure dtDataIniExit(Sender: TObject);
   Private
      { Private declarations }
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   Public
      { Public declarations }
   End;

Var
   frmConsSaldoEmpAcoes: TfrmConsSaldoEmpAcoes;
   dDataVig: TDateTime;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   CtrlEmpAcoes: TCtrlEmpAcoes;

Implementation

Uses UMensErro, UBibliotecaInvest, FDMRelEmpAcoesSaldo, uOperComum;

{$R *.DFM}

Procedure TfrmConsSaldoEmpAcoes.FormShow(Sender: TObject);
Begin
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
   qryInvestimento.Open;
   qryPlanPrev.Open;

   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   DmRelEmpAcoesSaldo.qryHistorico.Close;

   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   dDataVig := CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date());
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   dtDataIni.Text := DateTostr(dDataVig);
   dtDataFim.Text := DateTostr(Date);

   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
End;

Procedure TfrmConsSaldoEmpAcoes.bbtnImprimirClick(Sender: TObject);
Begin
   Inherited;
   If DmRelEmpAcoesSaldo.qryHistorico.IsEmpty Then
      exit;

   DmRelEmpAcoesSaldo.pplPeriodo.Caption := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;

   DmRelEmpAcoesSaldo.qryHistorico.DisableControls;
   TfrmPreview.CreateModalPreview(Application,
      DmRelEmpAcoesSaldo.rptRenEmpAcoesSaldo,
      DmRelEmpAcoesSaldo.rptRenEmpAcoesSaldo.PrinterSetup.DocumentName);
   DmRelEmpAcoesSaldo.qryHistorico.EnableControls;
End;

Procedure TfrmConsSaldoEmpAcoes.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesSaldo.qryHistorico.Close;
   If dtDataIni.CanFocus Then
      dtDataIni.SetFocus;
End;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253

Procedure TfrmConsSaldoEmpAcoes.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   qryInvestimento.Close;
   DmRelEmpAcoesSaldo.qryHistorico.Close;
   qryPlanPrev.Close;

   FreeAndNil(CtrlEmpAcoes);
   Inherited;
End;

Procedure TfrmConsSaldoEmpAcoes.FormCreate(Sender: TObject);
Begin
   Inherited;
   WindowState := wsMaximized;
End;

Procedure TfrmConsSaldoEmpAcoes.dblInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesSaldo.qryHistorico.Close;
End;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
Procedure TfrmConsSaldoEmpAcoes.bbtnConfirmarClick(Sender: TObject);
Begin
//Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   If Trim(dtDataIni.Text) = '' Then
      Begin
         MsgDlg('Data Início não informada.', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataIni.CanFocus Then
            dtDataIni.SetFocus;
         exit;
      End;

   If Trim(dtDataFim.Text) = '' Then
      Begin
         MsgDlg('Data Fim não informada.', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataFim.CanFocus Then
            dtDataFim.SetFocus;
         exit;
      End;

   If StrToDate(dtDataIni.Text) < dDataVig Then
      Begin
         MsgDlg('Data Inicial informada é anterior a data da vigência atual -> ' + datetostr(dDataVig) + '. Verifique !', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataIni.CanFocus Then
            Begin
               dtDataIni.Text := DateTostr(Date);
               dtDataIni.SetFocus;
            End;
         Exit;
      End;
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   OperComum.LimpaParametros(DmRelEmpAcoesSaldo.qryHistorico);
   DmRelEmpAcoesSaldo.qryHistorico.ParamByName('DATAINI').AsString := dtDataIni.Text;
   DmRelEmpAcoesSaldo.qryHistorico.ParamByName('DATAFIM').AsString := dtDataFim.Text;

   If Trim(dblInvestimento.Text) <> '' Then
      DmRelEmpAcoesSaldo.qryHistorico.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;

   If Trim(dblkPlanPrev.Text) <> '' Then
      DmRelEmpAcoesSaldo.qryHistorico.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPrev.LookupValue;

   DmRelEmpAcoesSaldo.qryHistorico.Close;
   DmRelEmpAcoesSaldo.qryHistorico.Open;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   If DmRelEmpAcoesSaldo.qryHistorico.EOF Then
      MsgDlg('Não há Recebimentos disponíveis para os critérios informados !', 'Atenção', mtWarning, [mbOK], 0);
End;

Procedure TfrmConsSaldoEmpAcoes.dtDataIniCloseUp(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesSaldo.qryHistorico.Close;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   If StrToDate(dtDataIni.Text) < dDataVig Then
      dtDataIni.Text := DateTostr(Date);
End;

Procedure TfrmConsSaldoEmpAcoes.dtDataIniExit(Sender: TObject);
Begin
   Inherited;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   If StrToDate(dtDataIni.Text) < dDataVig Then
      dtDataIni.Text := DateTostr(Date);
End;

End.


