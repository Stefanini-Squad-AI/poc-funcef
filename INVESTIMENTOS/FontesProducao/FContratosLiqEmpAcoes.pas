//*******************************************************************************************************
//N. Sol..........: 179261
//N. Kintana......: 1654087
//Data............: 03/05/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterado toda a querys para considerar o novo tipo 8 - Contrato pre-datado
//*******************************************************************************************************
//Rotina..........: FContratosLiqEmpAcoes
//N. Sol..........: 161791
//N. Kintana......: 1369052
//Data............: 21/07/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Foi refeito o select que identifica se os contratos estão em aberto ou liquidados
//**********************************************************************************************
//Rotina..........: FContratosLiqEmpAcoes
//N. Sol..........: 84432
//N. Kintana......: 523253
//Data............: 20/01/2011
//Responsável.....: Renan Cristiano
//Descrição.......: Posição dos Contratos
//***********************************************************************************************
Unit FContratosLiqEmpAcoes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, FPreview,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, Grids,
   Wwdbigrd, Wwdbgrid, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Mask,
   uCtrlEmpAcoes, uCtrlPadroes;

Type
   TfrmContratosLiqEmpAcoes = Class(TfrmOkCancelarRelInv)
      Panel1: TPanel;
      Label1: TLabel;
      //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      lbPlanPrev: TLabel;
      dtDataIni: TCMDateTimePicker;
      //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      dblkPlanPrev: TwwDBLookupCombo;
      Panel2: TPanel;
      Panel11: TPanel;
      dbgContrato: TwwDBGrid;
      qryInvestimento: TwwQuery;
      qryInvestimentoIDINVESTIMENTO: TFloatField;
      qryInvestimentoDESCINVESTIMENTO: TStringField;
      qryPlanPrev: TwwQuery;
      qryPlanPrevPLANPRVCONTABPATRO: TStringField;
      qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
      qryPlanPrevIDPLANOPREV: TFloatField;
      qryPlanPrevIDPATRO: TFloatField;
      dtDataFim: TCMDateTimePicker;
      Label2: TLabel;
      rgTipo: TRadioGroup;
      Label4: TLabel;
      edtContrato: TEdit;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bt_ImprimeClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure edtContratoKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
   Private
      { Private declarations }
      Procedure AbreQry;
   Public
      { Public declarations }
   End;

Var
   frmContratosLiqEmpAcoes: TfrmContratosLiqEmpAcoes;
   CtrlEmpAcoes: TCtrlEmpAcoes;

Implementation

Uses RContratosLiqEmpAcoes, UMensErro;

{$R *.DFM}

Procedure TfrmContratosLiqEmpAcoes.FormShow(Sender: TObject);
Begin
   CtrlEmpAcoes := TCtrlEmpAcoes.Create;
   CtrlEmpAcoes.InitializeAs(Padroes);

   Inherited;

   qryInvestimento.Open;
   qryPlanPrev.Open;
   DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.Close;
   //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009

   dtDataIni.Text := DateToStr(CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date()));
   //Paulo Nobre 05/07/2011 - SOL 160038 - Kintana 1331763
   dtDataFim.Text := DateTostr(Date);
End;

Procedure TfrmContratosLiqEmpAcoes.bbtnConfirmarClick(Sender: TObject);
Var dDataVig: TDateTime;
Begin
   dDataVig := CtrlEmpAcoes.BuscaDataVigEmpAcoes(Date());
   If dDataVig > StrToDate(dtDataIni.Text) Then
      dtDataIni.Text := DateToStr(dDataVig);
   If dDataVig > StrToDate(dtDataFim.Text) Then
      dtDataFim.Text := DateToStr(dDataVig);

   Inherited;

   AbreQry;
End;

Procedure TfrmContratosLiqEmpAcoes.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.Close;
   If dtDataIni.CanFocus Then
      dtDataIni.SetFocus;
End;

Procedure TfrmContratosLiqEmpAcoes.bt_ImprimeClick(Sender: TObject);
Begin
   Inherited;
   If DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.IsEmpty Then
      exit;
   //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
   //   DmRContratosLiqEmpAcoes.lblPosicao.Caption := 'Contratos ' + rgTipo.Items.Strings[rgTipo.ItemIndex];
   DmRContratosLiqEmpAcoes.lblPeriodo.Caption := 'Período : ' + dtDataIni.Text + ' a ' + dtDataFim.Text;

   DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.DisableControls;
   TfrmPreview.CreateModalPreview(Application,
      DmRContratosLiqEmpAcoes.rpRContratosLiqEmpAcoes,
      DmRContratosLiqEmpAcoes.rpRContratosLiqEmpAcoes.PrinterSetup.DocumentName);
   DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.EnableControls;
End;

Procedure TfrmContratosLiqEmpAcoes.AbreQry;
Var
   sSql: String;
   sDataIni, sDataFim: String;
   Dia, Mes, Ano: Word;
Begin
   If Trim(dtDataIni.Text) = '' Then
      Begin
         MsgDlg('Data Inicial não informada.', 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
         If dtDataIni.CanFocus Then
            dtDataIni.SetFocus;
         exit;
      End;

   If Trim(dtDataFim.Text) = '' Then
      Begin
         MsgDlg('Data Final não informada.', 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
         If dtDataFim.CanFocus Then
            dtDataFim.SetFocus;
         exit;
      End;

   If dtDataFim.Date < dtDataIni.Date Then
      Begin
         MsgDlg('Data Final não pode ser menor que a Inicial.', 'Mensagem do Sistema ', mtWarning, [mbOK], 0);
         dtDataFim.Date := dtDataIni.Date;
         If dtDataFim.CanFocus Then
            dtDataFim.SetFocus;
         exit;
      End;

   Try
      Dia := StrToInt(FormatDateTime('DD', dtDataIni.Date));
      Mes := StrToInt(FormatDateTime('MM', dtDataIni.Date));
      Ano := StrToInt(FormatDateTime('YYYY', dtDataIni.Date));

      sDataIni := FormatDateTime('DD/MM/YYYY', EncodeDate(Ano, Mes, Dia));

      Dia := StrToInt(FormatDateTime('DD', dtDataFim.Date));
      Mes := StrToInt(FormatDateTime('MM', dtDataFim.Date));
      Ano := StrToInt(FormatDateTime('YYYY', dtDataFim.Date));

      sDataFim := FormatDateTime('DD/MM/YYYY', EncodeDate(Ano, Mes, Dia));

      DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.Close;
      DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.sql.Clear;
      //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009
      sSql := sSql + 'SELECT NUMCONTRATOCUSTODIA,  ' + #13 + #10 +
         '       DATAOPER,                     ' + #13 + #10 +
         '       DATAVENCTO,                   ' + #13 + #10 +
         '       DSCMOVIMENTO,                 ' + #13 + #10 +
         '       QTDOPER,                      ' + #13 + #10 +
         '       PU,                           ' + #13 + #10 +
         '       TAXA,                         ' + #13 + #10 +
         '       VALORCONTRATO,                ' + #13 + #10 +
         '       VALOROPER,                    ' + #13 + #10 +
         '       RECEITA,                      ' + #13 + #10 +
         //Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
      '       SALDO,                        ' + #13 + #10 +
         '       TIPOLANCAMENTO,               ' + #13 + #10 +
         '       TIPOMOVIMENTO,                ' + #13 + #10 +
         '       PLANOPATRO,                   ' + #13 + #10 +
         '       DSCINVEST,                    ' + #13 + #10 +
         '       CORRET                        ' + #13 + #10 +
         '  FROM (SELECT HE.NUMCONTRATOCUSTODIA,  ' + #13 + #10 +
         '               HE.DATAHISTEMPACOES AS DATAOPER,    ' + #13 + #10 +
         '               NULL AS DATAVENCTO,  ' + #13 + #10 +
         '               CASE                                ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 2 THEN    ' + #13 + #10 +
         '                  ''Reversao Parcial''             ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 3 THEN    ' + #13 + #10 +
         '                  ''Reversao Total''               ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ''I'' THEN ' + #13 + #10 +
         '                  ''Juros Importados''                                     ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ''C'' THEN ' + #13 + #10 +
         '                  ''Juros na Reversao/Liquidação''                         ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ''J'' THEN ' + #13 + #10 +
         '                  ''Juros de Ajuste''                                      ' + #13 + #10 +
         // Paulo Nobre 07/10/2011 - SOL 166300 - Kintana 1446695
      '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ''Z'' THEN ' + #13 + #10 +
         '                  ''Acerto fechamento contabil''       ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 6 THEN    ' + #13 + #10 +
         '                  ''Liquidação Financeira''        ' + #13 + #10 +
         '               END AS DSCMOVIMENTO,                                        ' + #13 + #10 +
         //Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
      '               CASE                                                        ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN                   ' + #13 + #10 +
         // Paulo Nobre 06/10/2011 - SOL 166163 - Kintana 1445211
      '                  HE.QTDHISTEMPACOES * -1                                  ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 5 THEN                            ' + #13 + #10 +
         '                  0.00                                                     ' + #13 + #10 +
         '               END AS QTDOPER,                                             ' + #13 + #10 +
         '               0.00 PU,                                                    ' + #13 + #10 +
         '               0.00 TAXA,                                                  ' + #13 + #10 +
         '               0.00 VALORCONTRATO,                                         ' + #13 + #10 +
         '               CASE                                                        ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN                   ' + #13 + #10 +
         '                  0.00                                                     ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 5 THEN                            ' + #13 + #10 +
         '                  HE.VLRJUROSIMPORTA                                       ' + #13 + #10 +
         '               END AS VALOROPER,                                           ' + #13 + #10 +
         '               CASE                                                        ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN                   ' + #13 + #10 +
         '                  ABS(NVL(HE.VLRJUROSIMPORTA, 0))                          ' + #13 + #10 +
         '                 WHEN HE.TIPOMOVIMENTO = 5 THEN                            ' + #13 + #10 +
         '                  0.00                                                     ' + #13 + #10 +
         '               END AS RECEITA,                                             ' + #13 + #10 +
         //Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
      '              (CASE                                                        ' + #13 + #10 +
         '               WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN                     ' + #13 + #10 + // SALDO = REVERSÕES - JUROS
      '                  ABS(NVL(HE.VLRJUROSIMPORTA, 0))                          ' + #13 + #10 +
         '               WHEN HE.TIPOMOVIMENTO = 5 THEN                              ' + #13 + #10 +
         '                  0.00                                                     ' + #13 + #10 +
         '               END -                                                       ' + #13 + #10 +
         '               CASE                                                        ' + #13 + #10 +
         '               WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN                     ' + #13 + #10 +
         '                  0.00                                                     ' + #13 + #10 +
         '               WHEN HE.TIPOMOVIMENTO = 5 THEN                              ' + #13 + #10 +
         '                 HE.VLRJUROSIMPORTA                                        ' + #13 + #10 +
         '               END ) AS SALDO,                                             ' + #13 + #10 +
         '               HE.TIPOLANCAMENTO,                                          ' + #13 + #10 +
         '               HE.TIPOMOVIMENTO,                                           ' + #13 + #10 +
         '               '' '' PLANOPATRO,                                           ' + #13 + #10 +
         '               '' '' DSCINVEST,                                            ' + #13 + #10 +
         '               '' '' CORRET                                                ' + #13 + #10 +
         '        FROM HISTEMPACOES HE                                               ' + #13 + #10 +
         '        WHERE HE.TIPOMOVIMENTO IN (2, 3, 5, 6)                             ' + #13 + #10;
      If Trim(edtContrato.Text) <> '' Then
         sSql := sSql + 'AND HE.NUMCONTRATOCUSTODIA = ' + QuotedStr(edtContrato.text) + #13 + #10;

      sSql := sSql + 'UNION                                        ' + #13 + #10 +

      '        SELECT OE.NUMCONTRATOCUSTODIA,                      ' + #13 + #10 +
         '               OE.DATAOPERACAO AS DATAOPER,              ' + #13 + #10 +
         '               OE.datavencoper AS DATAVENCTO,            ' + #13 + #10 +
         '               CASE                                      ' + #13 + #10 +
         '                 WHEN OE.TIPOMOVIMENTO = 1 THEN          ' + #13 + #10 +
         '                  ''Concessão''                          ' + #13 + #10 +
         '                 WHEN OE.TIPOMOVIMENTO = 4 THEN          ' + #13 + #10 +
         '                  ''Repactuação''                        ' + #13 + #10 +
         '                 WHEN OE.TIPOMOVIMENTO = 7 THEN          ' + #13 + #10 +
         '                  ''Inadimplência''                      ' + #13 + #10 +
         // pnobre
         '                 WHEN OE.TIPOMOVIMENTO = 8 THEN          ' + #13 + #10 +
         '                  ''Contrato Pré-Datado''                ' + #13 + #10 +
         '               END AS DSCMOVIMENTO,                      ' + #13 + #10 +
         '               OE.qtdoperacao AS QTDOPER,                ' + #13 + #10 +
         '               OE.puoperacao PU,                         ' + #13 + #10 +
         '               OE.taxaoperacao TAXA,                     ' + #13 + #10 +
         '               OE.vlroperacao VALORCONTRATO,             ' + #13 + #10 +
         '               0.00 VALOROPER,                           ' + #13 + #10 +
         '               0.00 RECEITA,                             ' + #13 + #10 +
         //Paulo Nobre 30/08/2011 - SOL 164140 - Kintana 1407348
         '               0.00 SALDO,                               ' + #13 + #10 +
         '               OE.TIPOLANCAMENTO,                        ' + #13 + #10 +
         '               OE.TIPOMOVIMENTO,                         ' + #13 + #10 +
         '               pp.PLANPRVCONTABPATRO PLANOPATRO,         ' + #13 + #10 +
         '               ab.siglaacaobolsa     DSCINVEST,          ' + #13 + #10 +
         '               CV.SGLCORRETVALORES   CORRET              ' + #13 + #10 +
         '        FROM OPEREMPACOES OE, vwplanprevctbpatr pp, acoesxbolsa ab, CORRETVALORES CV  ' + #13 + #10 +
         // pnobre
      '        WHERE OE.TIPOMOVIMENTO IN (1, 4, 7, 8)              ' + #13 + #10;
      If Trim(edtContrato.Text) <> '' Then
         sSql := sSql + 'AND OE.NUMCONTRATOCUSTODIA = ' + QuotedStr(edtContrato.text) + #13 + #10;

      sSql := sSql + ' And pp.idplanprevctbpatr = OE.idplanprevctbpatr' + #13 + #10 +
         '  AND ab.idacao = OE.idinvestimento                      ' + #13 + #10 +
         '  AND CV.IDCORRETVALORES = OE.IDCORRETVALORES             ' + #13 + #10;

      sSql := sSql + ')' + #13 + #10;
      // Paulo Nobre 06/10/2011 - SOL 166163 - Kintana 1445211
      sSql := sSql + 'ORDER BY NUMCONTRATOCUSTODIA, DATAOPER, TIPOLANCAMENTO, TIPOMOVIMENTO' + #13 + #10;

      DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.SQL.Add(sSql);
      DmRContratosLiqEmpAcoes.qryRContratosLiqEmpAcoes.Open;
   Except
      On E: Exception Do
         ShowMessage(e.Message);
   End;
   //Paulo Nobre - 27/07/2011 - N. Sol 161867 -  N. Kintana 1371009 - Fim
End;

Procedure TfrmContratosLiqEmpAcoes.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   Inherited;
   qryInvestimento.Close;
   qryPlanPrev.Close;
End;

Procedure TfrmContratosLiqEmpAcoes.edtContratoKeyPress(Sender: TObject; Var Key: Char);
Begin
   Inherited;
   If (Not (Key In ['0'..'9'])) And (Not (Key = #8)) Then
      Key := #0;
End;

Procedure TfrmContratosLiqEmpAcoes.FormCreate(Sender: TObject);
Begin
   Inherited;
   WindowState := wsMaximized;
End;

End.

