//*******************************************************************************************************
//N. Sol..........: 179261
//N. Kintana......: 1654087
//Data............: 03/05/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a querys para considerar o novo tipo 8 - Contrato pre-datado
//*******************************************************************************************************
//N. Sol..........: 163239
//N. Kintana......: 1392476
//Data............: 16/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado a grid para considerar os novos tipos 6, 7
//***************************************************************************************************
// Data      : 01/10/2007
// Código    : AL_3
// Pendencia : 26454
// SOL       : 70153
// Desc      : Alteração no relatório da descrição da coluna "valor resgate" para
//             "valor na data do vencimento".
//******************************************************************************
// Data      : 01/10/2007
// Código    : AL_2
// Pendencia : 26367
// SOL       : 69359
// Desc      : Acrescido ao relatório de operações de empréstimos o filtro de
//             "tipo de operações" para segregar os lançamentos de empréstimo das
//             reversões.
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_1
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro
//******************************************************************************

Unit FConsOperEmpAcoes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
   wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, FPreview,
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   uCtrlEmpAcoes, uCtrlPadroes;

Type
   TfrmConsOperEmpAcoes = Class(TfrmOkCancelarInv)
      Panel1: TPanel;
      dblInvestimento: TwwDBLookupCombo;
      qryInvestimento: TwwQuery;
      Label3: TLabel;
      Panel2: TPanel;
      Panel11: TPanel;
      dbgOperacoes: TwwDBGrid;
      Splitter1: TSplitter;
      bbtnImprimir: TBitBtn;
      ToolbarSep972: TToolbarSep97;
      lbPlanPrev: TLabel;
      dblkPlanPrev: TwwDBLookupCombo;
      qryPlanPrev: TwwQuery;
      qryPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryPlanPrevIDPLANOPREV: TFloatField;
      qryPlanPrevIDPATRO: TFloatField;
      //AL_2
      gbPeriodo: TGroupBox;
      dtDataInicio: TCMDateTimePicker;
      dtDataFim: TCMDateTimePicker;
      Label1: TLabel;
      Label2: TLabel;
      dblkTipoOper: TwwDBLookupCombo;
      Label4: TLabel;
      QryTipoOper: TwwQuery;
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
   Private
      { Private declarations }
      Procedure AbreQry;
   Public
      { Public declarations }
   End;

Var
   frmConsOperEmpAcoes: TfrmConsOperEmpAcoes;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   CtrlEmpAcoes: TCtrlEmpAcoes;
   dDataVig: TDateTime;

Implementation

Uses FDMRelEmpAcoesOper, UMensErro, UBibliotecaInvest, uOperComum;

{$R *.DFM}

Procedure TfrmConsOperEmpAcoes.FormShow(Sender: TObject);
Begin
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
   qryInvestimento.Open;
   DmRelEmpAcoesOper.qryOperacoes.Close;
   //AL_1
   qryPlanPrev.Open;
   //AL_2
   QryTipoOper.Open;
   Inherited;
   //AL_1

   dDataVig := CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date());
//Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763 
   dtDataInicio.Text := DateTostr(dDataVig);
   //   dtDataInicio.Text := DateTostr(strtodate((FormatDateTime('01/mm/yyyy', Date()))));
   dtDataFim.Text := DateTostr(Date);

End;

Procedure TfrmConsOperEmpAcoes.AbreQry;
Begin
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763 
   //AL_1
   OperComum.LimpaParametros(DmRelEmpAcoesOper.qryOperacoes);
   DmRelEmpAcoesOper.qryOperacoes.ParamByName('DATAINI').AsString := dtDataInicio.Text;
   DmRelEmpAcoesOper.qryOperacoes.ParamByName('DATAFIM').AsString := dtDataFim.Text;
   If Trim(dblInvestimento.Text) <> '' Then
      DmRelEmpAcoesOper.qryOperacoes.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;

   If Trim(dblkPlanPrev.Text) <> '' Then
      DmRelEmpAcoesOper.qryOperacoes.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPrev.LookupValue;

   //AL_2
   If Trim(dblkTipoOper.Text) <> '' Then
      DmRelEmpAcoesOper.qryOperacoes.ParamByName('IDTIPOOPERACAO').AsString := dblkTipoOper.LookupValue;

   DmRelEmpAcoesOper.qryOperacoes.Open;
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   If DmRelEmpAcoesOper.qryOperacoes.EOF Then
      MsgDlg('Não há Operações disponíveis para os critérios informados !', 'Atenção', mtWarning, [mbOK], 0);
End;

Procedure TfrmConsOperEmpAcoes.bbtnImprimirClick(Sender: TObject);
Begin
   Inherited;
   If DmRelEmpAcoesOper.qryOperacoes.IsEmpty Then
      exit;

   DmRelEmpAcoesOper.pplPeriodo.Caption := 'Período : ' + dtDataInicio.Text + ' a ' + dtDataFim.Text;

   DmRelEmpAcoesOper.qryOperacoes.DisableControls;
   TfrmPreview.CreateModalPreview(Application,
      DmRelEmpAcoesOper.rptEmpAcoesOper,
      DmRelEmpAcoesOper.rptEmpAcoesOper.PrinterSetup.DocumentName);
   DmRelEmpAcoesOper.qryOperacoes.EnableControls;

End;

Procedure TfrmConsOperEmpAcoes.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesOper.qryOperacoes.Close;
   If dtDataInicio.CanFocus Then
      dtDataInicio.SetFocus;
End;

Procedure TfrmConsOperEmpAcoes.dtDataInicioExit(Sender: TObject);
Begin
   Inherited;
   If Trim(dtDataFim.Text) = '' Then
      dtDataFim.DateTime := dtDataInicio.DateTime;

End;

Procedure TfrmConsOperEmpAcoes.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   qryInvestimento.Close;
   DmRelEmpAcoesOper.qryOperacoes.Close;
   //AL_1
   qryPlanPrev.Close;
   Inherited;
End;

Procedure TfrmConsOperEmpAcoes.FormCreate(Sender: TObject);
Begin
   Inherited;
   WindowState := wsMaximized;
End;

Procedure TfrmConsOperEmpAcoes.dblInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesOper.qryOperacoes.Close;

End;

Procedure TfrmConsOperEmpAcoes.dtDataInicioChange(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesOper.qryOperacoes.Close;

End;

Procedure TfrmConsOperEmpAcoes.dtDataFimChange(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesOper.qryOperacoes.Close;

End;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253

Procedure TfrmConsOperEmpAcoes.bbtnConfirmarClick(Sender: TObject);
Begin
   If Trim(dtDataInicio.Text) = '' Then
      Begin
         MsgDlg('Data Início não informada.', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataInicio.CanFocus Then
            dtDataInicio.SetFocus;
         exit;
      End;

   If Trim(dtDataFim.Text) = '' Then
      Begin
         MsgDlg('Data Fim não informada.', 'Atenção', mtWarning, [mbOK], 0);
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

   AbreQry;
End;

Procedure TfrmConsOperEmpAcoes.dblkPlanPrevChange(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesOper.qryOperacoes.Close;
End;

End.

