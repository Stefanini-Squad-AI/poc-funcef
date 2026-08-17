Unit FConsJurosProvisionados;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook, FPreview,
   wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, uCtrlEmpAcoes,
   uCtrlPadroes;

Type
   TFrmConsJurosProvisionados = Class(TfrmOkCancelarInv)
      Panel1: TPanel;
      Label1: TLabel;
      Label3: TLabel;
      lbPlanPrev: TLabel;
      Label2: TLabel;
      dtDataIni: TCMDateTimePicker;
      dblInvestimento: TwwDBLookupCombo;
      dblkPlanPrev: TwwDBLookupCombo;
      dtDataFim: TCMDateTimePicker;
      Panel2: TPanel;
      Panel11: TPanel;
      bbtnImprimir: TBitBtn;
      Panel3: TPanel;
      Bevel1: TBevel;
      Splitter1: TSplitter;
      Panel4: TPanel;
      fcLabel1: TfcLabel;
      Panel5: TPanel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      CMDateTimePicker1: TCMDateTimePicker;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      CMDateTimePicker2: TCMDateTimePicker;
      Panel6: TPanel;
      Panel7: TPanel;
      wwDBGrid1: TwwDBGrid;
      qryPlanPrev: TwwQuery;
      qryPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryPlanPrevIDPLANOPREV: TFloatField;
      qryPlanPrevIDPATRO: TFloatField;
      qryInvestimento: TwwQuery;
      qryInvestimentoIDINVESTIMENTO: TFloatField;
      qryInvestimentoDESCINVESTIMENTO: TStringField;
      dbgOperacoes: TwwDBGrid;
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
      cbExpandir: TCheckBox;
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblInvestimentoChange(Sender: TObject);
      Procedure dtDataIniCloseUp(Sender: TObject);
      Procedure dtDataIniExit(Sender: TObject);
      Procedure bbtnImprimirClick(Sender: TObject);
      Procedure dbgOperacoesCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
//Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      Procedure cbExpandirClick(Sender: TObject);
   Private
      //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   FrmConsJurosProvisionados: TFrmConsJurosProvisionados;
   dDataVig: TDateTime;
   CtrlEmpAcoes: TCtrlEmpAcoes;

Implementation
Uses UMensErro, UBibliotecaInvest, FDMRelEmpAcoesJuros, uOperComum;

{$R *.DFM}

Procedure TFrmConsJurosProvisionados.bbtnConfirmarClick(Sender: TObject);
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
         //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
         MsgDlg('Data Inicial informada é anterior a data da vigência atual -> ' + datetostr(dDataVig) + '. Verifique !', 'Atenção', mtWarning, [mbOK], 0);
         If dtDataIni.CanFocus Then
            Begin
               dtDataIni.Text := DateTostr(Date);
               dtDataIni.SetFocus;
            End;
         Exit;
      End;
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
//Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
   Screen.Cursor := crSQLWait;
   OperComum.LimpaParametros(DmRelEmpAcoesJuros.qryJurosSi);
   OperComum.LimpaParametros(DmRelEmpAcoesJuros.qryJurosAn);

   DmRelEmpAcoesJuros.qryJurosSi.ParamByName('DATAINI').AsString := dtDataIni.Text;
   DmRelEmpAcoesJuros.qryJurosSi.ParamByName('DATAFIM').AsString := dtDataFim.Text;

   If Trim(dblInvestimento.Text) <> '' Then
      DmRelEmpAcoesJuros.qryJurosSi.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;

   If Trim(dblkPlanPrev.Text) <> '' Then
      DmRelEmpAcoesJuros.qryJurosSi.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPrev.LookupValue;

   DmRelEmpAcoesJuros.qryJurosSi.Open;

   If Not (DmRelEmpAcoesJuros.qryJurosSi.IsEmpty) Then
      Begin
         DmRelEmpAcoesJuros.qryJurosAn.ParamByName('DATAINI').AsString := dtDataIni.Text;
         DmRelEmpAcoesJuros.qryJurosAn.ParamByName('DATAFIM').AsString := dtDataFim.Text;

         If Trim(dblInvestimento.Text) <> '' Then
            DmRelEmpAcoesJuros.qryJurosAn.ParamByName('IDINVESTIMENTO').AsString := dblInvestimento.LookupValue;

         If Trim(dblkPlanPrev.Text) <> '' Then
            DmRelEmpAcoesJuros.qryJurosAn.ParamByName('IDPLANPREVCTBPATR').AsString := dblkPlanPrev.LookupValue;

         DmRelEmpAcoesJuros.qryJurosAn.Open;
      End
   Else
      If DmRelEmpAcoesJuros.qryJurosAn.EOF Then
         MsgDlg('Não há Juros disponíveis para os critérios informados !', 'Atenção', mtWarning, [mbOK], 0);
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   Screen.Cursor := crDefault;
End;
//Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763

Procedure TFrmConsJurosProvisionados.FormShow(Sender: TObject);
Begin
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);
   qryPlanPrev.Open;
   qryInvestimento.Open;

   Inherited;

   dDataVig := CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date());
   dtDataIni.Text := DateToStr(dDataVig);
   //   dtDataIni.Text := DateTostr(strtodate((FormatDateTime('01/mm/yyyy', Date()))));
   dtDataFim.Text := DateTostr(Date);
End;
//Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763

Procedure TFrmConsJurosProvisionados.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   qryPlanPrev.Close;
   qryInvestimento.Close;
   FreeAndNil(CtrlEmpAcoes);
End;

Procedure TFrmConsJurosProvisionados.dblInvestimentoChange(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesJuros.qryJurosAn.Close;
End;

Procedure TFrmConsJurosProvisionados.dtDataIniCloseUp(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesJuros.qryJurosAn.Close;
   If StrToDate(dtDataIni.Text) < dDataVig Then
      dtDataIni.Text := DateTostr(Date);
End;

Procedure TFrmConsJurosProvisionados.dtDataIniExit(Sender: TObject);
Begin
   Inherited;
   If StrToDate(dtDataIni.Text) < dDataVig Then
      dtDataIni.Text := DateTostr(Date);
End;

Procedure TFrmConsJurosProvisionados.bbtnImprimirClick(Sender: TObject);
Begin
   Inherited;
   If DmRelEmpAcoesJuros.QryJurosAn.IsEmpty Then
      exit;

   DmRelEmpAcoesJuros.pplPeriodo.Caption := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;

   DmRelEmpAcoesJuros.qryJurosAn.DisableControls;
   TfrmPreview.CreateModalPreview(Application,
      DmRelEmpAcoesJuros.rptEmpAcoesJuros,
      DmRelEmpAcoesJuros.rptEmpAcoesJuros.PrinterSetup.DocumentName);
   DmRelEmpAcoesJuros.qryJurosAn.EnableControls;

   DmRelEmpAcoesJuros.QryJurosAn.Filtered := False;

End;

Procedure TFrmConsJurosProvisionados.dbgOperacoesCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
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

Procedure TFrmConsJurosProvisionados.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesJuros.QryJurosAn.Close;
   DmRelEmpAcoesJuros.QryJurosSi.Close;
   DmRelEmpAcoesJuros.QryJurosAn.Filtered := False;
   If dtDataIni.CanFocus Then
      dtDataIni.SetFocus;
End;

Procedure TFrmConsJurosProvisionados.bbtnSairClick(Sender: TObject);
Begin
   Inherited;
   DmRelEmpAcoesJuros.qryJurosSi.Close;
   DmRelEmpAcoesJuros.qryJurosAn.Close;
End;
//Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
Procedure TFrmConsJurosProvisionados.cbExpandirClick(Sender: TObject);
Begin
   Inherited;
   OperComum.LimpaParametros(DmRelEmpAcoesJuros.qryJurosSi);
   OperComum.LimpaParametros(DmRelEmpAcoesJuros.qryJurosAn);
End;

End.

