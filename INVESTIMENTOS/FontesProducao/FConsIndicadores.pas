unit FConsIndicadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  Spin, Menus, FPreview;

type
  TfrmConsIndicadores = class(TfrmOkCancelar)
    qryConsMoeda: TwwQuery;
    Label3: TLabel;
    bt_Imprime: TBitBtn;
    pnlCombos: TPanel;
    dblConsMoeda: TwwDBLookupCombo;
    lblIndicador: TLabel;
    Label4: TLabel;
    pnlLancamentos: TPanel;
    dbgMemoria: TDBGrid;
    spePercentual: TSpinEdit;
    Panel1: TPanel;
    lblVariacao: TLabel;
    pnlVariacao: TPanel;
    qryConsMoedaMOEDESC: TStringField;
    qryConsMoedaMOECODIGO: TFloatField;
    qryConsMoedaCODTRATAIND: TStringField;
    cmbTipoIndicador: TComboBox;
    Label7: TLabel;
    pnlCDI: TPanel;
    grbPeriodo: TGroupBox;
    edDataFim: TCMDateTimePicker;
    Label5: TLabel;
    edDataIni: TCMDateTimePicker;
    qryConsFundos: TwwQuery;
    qryConsFundosDESCFUNDOINVEST: TStringField;
    qryConsFundosIDFUNDOINVEST: TFloatField;
    dblConsFundos: TwwDBLookupCombo;
    lblFundos: TLabel;
    lblVarIndicativo: TLabel;
    pnlPerSInd: TPanel;
    lblPerSInd: TLabel;
    pmnuCopiar: TPopupMenu;
    Copiar1: TMenuItem;
    edtValor: TEdit;
    ToolbarSep972: TToolbarSep97;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure pnlVariacaoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure dblConsMoedaChange(Sender: TObject);
    procedure cmbTipoIndicadorChange(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
  private
    Procedure FazQuery;
    procedure FazQueryFundo;
    procedure FazQueryMoeda;
    procedure PreparaTela;
    function BuscaCotaFundo(wIDFundo: Integer; wData: TDateTime): Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsIndicadores: TfrmConsIndicadores;

implementation

{$R *.DFM}
Uses DBaseDados, UOperComum, UDiasUteisInv, FDmRelatorios, FDmRelatorio,uMensErro,
     UFuncoesRendaFixa, UBibliotecaInvest, Math;

Procedure TfrmConsIndicadores.FazQuery;
var dDataAtu, dDataAnt, dDataIni, dDataFim, dDataFimQry: TDateTime;
    wFator, wFatorAnt, wVariacao, wVarTot: Double;
    wPri: Boolean;
begin

   DmRelatorios.qryMemoria.DisableControls;

   dDataFimQry := DiasUteisInv.UltDiaUtilAnterior(edDataFim.DateTime,-1,1,'',True,False,False);
   dDataFim := edDataFim.DateTime;

   DmRelatorios.qryMemoria.SQL.Clear;
   DmRelatorios.qryMemoria.SQL.Add('SELECT COTDATA AS DATA, ' +
                      'COTVALOR, ' +
                      '(0) AS FATOR, ' +
                      '(0) AS VARIACAO, ' +
                      '(0) AS FATACU, ' +
                      '(0) AS TAXA ' +
                      'FROM COTACAOMOEDA ' +
                      'WHERE MOECODIGO = ' + qryConsMoeda.FieldByName('MOECODIGO').AsString + ' AND ' +
                      'COTDATA BETWEEN TO_DATE(''' + edDataIni.Text  + ''',''DD/MM/YYYY'')' +  ' AND ' +
                      'TO_DATE(''' + DateToStr(dDataFimQry) + ''',''DD/MM/YYYY'')' +
                      'ORDER BY COTDATA');

   DmRelatorios.qryMemoria.Open;

   if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'FATOR') then
      dbgMemoria.Columns[1].Title.Caption := 'Fator'
   else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA') then
      dbgMemoria.Columns[1].Title.Caption := 'Valor'
   else
      dbgMemoria.Columns[1].Title.Caption := 'Taxa';

//   dDataAtu := edDataIni.DateTime;
   dDataAtu := DiasUteisInv.PrimeiroDiaUtilPosterior(edDataIni.DateTime,-1,1,'',True,False,False);
   wVariacao := 0.00;
   wVarTot := 1;
   wPri := True;
   wFator := 1;

   DmRelatorios.qryMemoria.First;

//   dDataAnt := DiasUteisInv.UltDiaUtilAnterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False);
//   dDataIni := dDataAnt;
   dDataAnt := DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime;
   dDataIni := dDataAnt;

   While (DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime <= edDataFim.DateTime) and
         (not DmRelatorios.qryMemoria.Eof) do
   begin
      wFatorAnt := wFator;

      FuncoesRendaFixa.FatorIndicadores(dDataAnt,
                       DiasUteisInv.PrimeiroDiaUtilPosterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False),
                       0, 0, qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                       ' ', 0, qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                       StrToFloat(IntToStr(spePercentual.Value)), False,
                       wFator);
      FuncoesRendaFixa.FatorIndicadores(dDataIni,
                       DiasUteisInv.PrimeiroDiaUtilPosterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False),
                       0, 0, qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                       ' ', 0, qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                       StrToFloat(IntToStr(spePercentual.Value)), False,
                       wVarTot);

      wVariacao := StrToFloat(FormatFloat('#0.00000000',(((wFator * wFatorAnt) -1) * 100)));

      DmRelatorios.qryMemoria.Edit;
      DmRelatorios.qryMemoria.FieldByName('FATOR').AsFloat := wFator;
      DmRelatorios.qryMemoria.FieldByName('FATACU').AsFloat := wVarTot;

      if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA' then
         DmRelatorios.qryMemoria.FieldByName('VARIACAO').AsFloat :=
                     StrToFloat(FormatFloat('#0.00000000',(((wVarTot) -1) * 100)))
      else
         DmRelatorios.qryMemoria.FieldByName('VARIACAO').AsFloat := wVariacao;

      DmRelatorios.qryMemoria.Post;

//      dDataAnt := DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime;
      dDataAnt := DiasUteisInv.PrimeiroDiaUtilPosterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False);
      DmRelatorios.qryMemoria.Next;

   end;

   DmRelatorios.qryMemoria.First;
   DmRelatorios.qryMemoria.EnableControls;

//   if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA' then
//      pnlVariacao.Caption := FormatFloat('#0.00000000', wVarTot) + ' %'
//   else
      pnlVariacao.Caption := FormatFloat('#0.00000000', ((wVarTot-1)*100)) + ' %';

end;

Procedure TfrmConsIndicadores.FazQueryFundo;
var wTaxa, wValCotacao, wVariacao, wPriFat, wFatorCDI : Double;
    wDataCotacao, dDataAnt, dDataFim : TDateTime;
begin

   DmRelatorios.qryMemoria.DisableControls;

//   dDataFim := DiasUteisInv.UltDiaUtilAnterior(edDataFim.DateTime,-1,1,'',True,False,False);
   dDataFim := edDataFim.DateTime;

   DmRelatorios.qryMemoria.SQL.Clear;
   DmRelatorios.qryMemoria.SQL.Add('SELECT DATACOTA AS DATA, ' +
                       '(VLRCOTA) AS COTVALOR, ' +
                       '(0) AS FATOR, ' +
                       '(0) AS VARIACAO, ' +
                       '(0) AS FATACU, ' +
                       '(0) AS TAXA ' +
                       'FROM COTAFUNDO ' +
                       'WHERE IDFUNDOINVEST = ' + qryConsFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                       'DATACOTA BETWEEN TO_DATE(''' + edDataIni.Text  + ''',''DD/MM/YYYY'')' +  ' AND ' +
                       'TO_DATE(''' + edDataFim.Text  + ''',''DD/MM/YYYY'')' +
                       'ORDER BY DATACOTA');
   DmRelatorios.qryMemoria.Open;

   if DmRelatorios.qryMemoria.IsEmpty then
   begin
     MsgDlg('Não existem Cotas para este Fundo no Período.','Mensagem do Sistema',MtError,[MbOk],0);
     edDataIni.SetFocus;
     DmRelatorios.qryMemoria.EnableControls;
     exit;
   end;

   dbgMemoria.Columns[1].Title.Caption := 'Valor';

   wVariacao := 0.00;

   DmRelatorios.qryMemoria.First;
   wPriFat := DmRelatorios.qryMemoria.FieldByName('COTVALOR').AsFloat;

//   dDataAnt := DiasUteisInv.UltDiaUtilAnterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False);
   dDataAnt := DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime;

   While not DmRelatorios.qryMemoria.Eof do
   begin

      wVariacao := ((DmRelatorios.qryMemoria.FieldByName('COTVALOR').AsFloat / wPriFat)-1)*100;

      DmRelatorios.qryMemoria.Edit;
      DmRelatorios.qryMemoria.FieldByName('VARIACAO').AsFloat := wVariacao;

      OperComum.BuscaCotacaoMoeda(qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                                  DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,
                                  '=',wValCotacao,
                                  wDataCotacao);

      wTaxa := StrToFloat(FormatFloat('#0.00000000',(Power(1+(wValCotacao/100),1/252)-1)))+1;

      DmRelatorios.qryMemoria.FieldByName('TAXA').AsFloat     := wTaxa;

      DmRelatorios.qryMemoria.Post;

      DmRelatorios.qryMemoria.Next;

   end;

   FuncoesRendaFixa.FatorIndicadores(dDataAnt, dDataFim, 0, 0,
                    qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                    ' ',
                    0, qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                    StrToFloat(IntToStr(spePercentual.Value)),
                    False,
                    wFatorCDI);

   DmRelatorios.qryMemoria.First;
   DmRelatorios.qryMemoria.EnableControls;

   pnlVariacao.Caption := FormatFloat('#0.00000000', wVariacao) + ' %';
   pnlCDI.Caption      := FormatFloat('#0.00000000', ((wFatorCDI-1)*100)) + ' %';
   if wFatorCDI <> 1 then
      pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((wVariacao / ((wFatorCDI-1)*100)))*100) + ' %'
   else
      pnlPerSInd.Caption := FormatFloat('#,##0.0000', 0) + ' %';

//   if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA' then
//   begin
//      pnlCDI.Caption := FormatFloat('#0.00000000', (wFatorCDI)) + ' %';
//      pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((wVariacao / wFatorCDI)*100)) + ' %';
//   end
//   else
//   begin
//      pnlCDI.Caption := FormatFloat('#0.00000000', ((wFatorCDI-1)*100)) + ' %';
//      if wFatorCDI <> 1 then
//         pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((wVariacao / ((wFatorCDI-1)*100)))*100) + ' %'
//      else
//         pnlPerSInd.Caption := FormatFloat('#,##0.0000', 0) + ' %';
//   end;
end;

procedure TfrmConsIndicadores.FazQueryMoeda;
var dDataAtu, dDataAnt, dDataFim: TDateTime;
    wFator, wFatorAnt, wVariacao, wVarTot: Double;
    wPri: Boolean;
    dDataIni: String;
begin
   DmRelatorios.qryMemoria.DisableControls;

   dDataIni := DateToStr(DiasUteisInv.UltDiaUtilAnterior(edDataIni.DateTime,-1,1,'',True,False,False));
   dDataFim := edDataFim.DateTime;

   DmRelatorios.qryMemoria.SQL.Clear;
   DmRelatorios.qryMemoria.SQL.Add('SELECT CTM.COTDATA AS DATA, ' +
                'CTM.COTVALOR AS COTVALOR, ' +
                '(0) AS FATOR, ' +
                'ROUND((((CTM.COTVALOR / (CAN.COTVALOR))-1)*100),4) AS VARIACAO, ' +
                '(0) AS FATACU, ' +
                '(0) AS TAXA ' +
                'FROM COTACAOMOEDA CTM,' +
                '(SELECT COTVALOR FROM COTACAOMOEDA WHERE MOECODIGO = ' + qryConsMoeda.FieldByName('MOECODIGO').AsString + ' AND ' +
                '                                   COTDATA = TO_DATE('''+dDataIni+''',''DD/MM/YYYY'')'+') CAN ' +
                'WHERE CTM.MOECODIGO = ' + qryConsMoeda.FieldByName('MOECODIGO').AsString + ' AND ' +
                '      CTM.COTDATA BETWEEN TO_DATE(''' + dDataIni  + ''',''DD/MM/YYYY'')' +  ' AND ' +
                '                      TO_DATE(''' + edDataFim.Text + ''',''DD/MM/YYYY'')' +
                'ORDER BY CTM.COTDATA');

   DmRelatorios.qryMemoria.Open;

   dbgMemoria.Columns[1].Title.Caption := 'Valor';

   dDataAtu := DiasUteisInv.PrimeiroDiaUtilPosterior(edDataIni.DateTime,-1,1,'',True,False,False);
   wVariacao := 0.00;
   wVarTot := 1;
   wPri := True;
   wFator := 1;

{   DmRelatorios.qryMemoria.First;

   dDataAnt := DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime;
   dDataIni := dDataAnt;

   While (DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime <= edDataFim.DateTime) and
         (not DmRelatorios.qryMemoria.Eof) do
   begin
      wFatorAnt := wFator;

      FatorIndicadores(dDataAnt,
                       DiasUteisInv.PrimeiroDiaUtilPosterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False),
                       0, 0, qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                       ' ', 0, qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                       StrToFloat(IntToStr(spePercentual.Value)), False,
                       wFator);
      FatorIndicadores(dDataIni,
                       DiasUteisInv.PrimeiroDiaUtilPosterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False),
                       0, 0, qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                       ' ', 0, qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                       StrToFloat(IntToStr(spePercentual.Value)), False,
                       wVarTot);

      DmRelatorios.qryMemoria.Edit;
      DmRelatorios.qryMemoria.FieldByName('FATOR').AsFloat := wFator;
      DmRelatorios.qryMemoria.FieldByName('FATACU').AsFloat := wVarTot;
      DmRelatorios.qryMemoria.Post;
      dDataAnt := DiasUteisInv.PrimeiroDiaUtilPosterior(DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,-1,1,'',True,False,False);
      DmRelatorios.qryMemoria.Next;

   end;  }

   DmRelatorios.qryMemoria.Last;
   pnlVariacao.Caption := FormatFloat('#0.00000000', DmRelatorios.qryMemoria.FieldByName('VARIACAO').AsFloat) + ' %';
   DmRelatorios.qryMemoria.First;
   DmRelatorios.qryMemoria.EnableControls;

end;

procedure TfrmConsIndicadores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmConsIndicadores.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   If (edDataIni.Text = '') then
   begin
     MsgDlg('Informe a Data Inicial.','Mensagem do Sistema',MtError,[MbOk],0);
     edDataIni.SetFocus;
     exit;
   end;

   If (edDataFim.Text = '') then
   begin
     MsgDlg('Informe a DataFinal.','Mensagem do Sistema',MtError,[MbOk],0);
     edDataFim.SetFocus;
     exit;
   end;

   if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA' then
   begin
      If (edDataIni.DateTime  > edDataFim.DateTime) then
      begin
        MsgDlg('A Data Final deve ser igual ou superior a Data Inicial.','Mensagem do Sistema',MtError,[MbOk],0);
        edDataFim.SetFocus;
        exit;
      end;
   end
   else
   begin
      If (edDataIni.DateTime  >= edDataFim.DateTime) then
      begin
        MsgDlg('A Data Final deve ser superior a Data Inicial.','Mensagem do Sistema',MtError,[MbOk],0);
        edDataFim.SetFocus;
        exit;
      end;
   end;

   If (dblConsMoeda.LookupValue = '') then
   begin
     MsgDlg('Informe a Moeda para Consulta.','Mensagem do Sistema',MtError,[MbOk],0);
     dblConsMoeda.SetFocus;
     exit;
   end;

   If (cmbTipoIndicador.Text = 'FUNDO') and  (dblConsFundos.LookupValue = '')  then
   begin
     MsgDlg('Informe a Fundo para Consulta.','Mensagem do Sistema',MtError,[MbOk],0);
     dblConsMoeda.SetFocus;
     exit;
   end;

   DmRelatorios.qryMemoria.Close;
   DmRelatorios.qryMemoria.SQL.Clear;

   if cmbTipoIndicador.Text = 'FUNDO' then
      FazQueryFundo
   else
   begin
      if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA' then
         FazQueryMoeda
      else
         FazQuery;
   end;

end;

procedure TfrmConsIndicadores.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edDataIni.Text := '';
  edDataFim.Text := '';
  DmRelatorios.qryMemoria.Close;
  pnlVariacao.Caption := '';
  pnlCDI.Caption := '';
  dblConsMoeda.Text := '';
  dblConsFundos.Text := '';
  cmbTipoIndicador.SetFocus;
end;

procedure TfrmConsIndicadores.FormShow(Sender: TObject);
begin
  inherited;
  qryConsMoeda.Open;
  qryConsFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryConsFundos.Open;
//  DmRelatorios.qryMemoria.Open;

  dblConsFundos.Visible := False;
  lblFundos.Visible := False;
  lblVarIndicativo.Visible := False;
  pnlCDI.Visible := False;
  lblIndicador.Caption := 'Indicador';
  grbPeriodo.Left := 165;
  lblVariacao.Left := 152;
  pnlVariacao.Left := 312;

  cmbTipoIndicador.ItemIndex := 0;
  PreparaTela;
end;

procedure TfrmConsIndicadores.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
  if cmbTipoIndicador.Text = 'FUNDO' then
  begin
     // Prepara labels visíveis ou invisíveis
     DmRelatorios.ppsVarFundo.Visible := True;
     DmRelatorios.lblCapVarFundo.Visible := True;
     DmRelatorios.lblVarFundo.Visible := True;

     DmRelatorios.ppsVarIndComp.Visible := True;
     DmRelatorios.lblCapVarIndComp.Visible := True;
     DmRelatorios.lblVarIndComp.Visible := True;

     DmRelatorios.ppsVarComp.Visible := True;
     DmRelatorios.lblCapDifPer1.Visible := True;
     DmRelatorios.lblDifPerc.Visible := True;
     DmRelatorios.lblCapDifPer2.Visible := True;
     DmRelatorios.lblIndComp2.Visible := True;

     DmRelatorios.lblCapIndComp.Visible := True;
     DmRelatorios.lblIndComp.Visible := True;

     DmRelatorios.lblTitFator.Visible := False;
     DmRelatorios.lblTitFatAcu.Visible := False;
     DmRelatorios.dbtFator.Visible := False;
     DmRelatorios.dbtFatAcu.Visible := False;

     // Prepara Labels com valores a serem exibidos
     DmRelatorios.lblNomeRelatorio.Text := 'Rentabilidade Comparada de Fundos';
     DmRelatorios.lblTitVariacao.Text := 'Variação até a Data';

     DmRelatorios.lblDataIni.Text := edDataIni.Text;
     DmRelatorios.lblDataFim.Text := edDataFim.Text;

     DmRelatorios.lblCapFundo.Text := 'Fundo:';
     DmRelatorios.lblFundo.Text := dblConsFundos.Text;

     DmRelatorios.lblIndComp.Text := dblConsMoeda.Text;

     DmRelatorios.lblVarFundo.Text := pnlVariacao.Caption;
     DmRelatorios.lblVarIndComp.Text := pnlCDI.Caption;
     DmRelatorios.lblDifPerc.Text := pnlPerSInd.Caption;
     DmRelatorios.lblIndComp2.Text := dblConsMoeda.Text;

  end
  else       // MOEDA
  begin
     // Prepara labels visíveis ou invisíveis
     DmRelatorios.ppsVarFundo.Visible := False;
     DmRelatorios.lblCapVarFundo.Visible := False;
     DmRelatorios.lblVarFundo.Visible := False;

     DmRelatorios.ppsVarIndComp.Visible := True;
     DmRelatorios.lblCapVarIndComp.Visible := True;
     DmRelatorios.lblVarIndComp.Visible := True;

     DmRelatorios.ppsVarComp.Visible := False;
     DmRelatorios.lblCapDifPer1.Visible := False;
     DmRelatorios.lblDifPerc.Visible := False;
     DmRelatorios.lblCapDifPer2.Visible := False;
     DmRelatorios.lblIndComp2.Visible := False;

     DmRelatorios.lblCapIndComp.Visible := False;
     DmRelatorios.lblIndComp.Visible := False;

     DmRelatorios.lblTitFator.Visible := True;
     DmRelatorios.lblTitFatAcu.Visible := True;
     DmRelatorios.dbtFator.Visible := True;
     DmRelatorios.dbtFatAcu.Visible := True;

     // Prepara Labels com valores a serem exibidos
     DmRelatorios.lblNomeRelatorio.Text := 'Rentabilidade de Indicadores';
     if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA') then
     begin
        DmRelatorios.lblTitFator.Visible := False;
        DmRelatorios.lblTitFatAcu.Visible := False;
        DmRelatorios.dbtFator.Visible := False;
        DmRelatorios.dbtFatAcu.Visible := False;
        DmRelatorios.lblTitVariacao.Text := 'Variação até a Data';
     end
     else
     begin
        DmRelatorios.lblTitFator.Visible := True;
        DmRelatorios.lblTitFatAcu.Visible := True;
        DmRelatorios.dbtFator.Visible := True;
        DmRelatorios.dbtFatAcu.Visible := True;
        DmRelatorios.lblTitVariacao.Text := 'Variação Diária';
     end;

     DmRelatorios.lblDataIni.Text := edDataIni.Text;
     DmRelatorios.lblDataFim.Text := edDataFim.Text;

     DmRelatorios.lblCapFundo.Text := 'Indicador:';
     DmRelatorios.lblFundo.Text := dblConsMoeda.Text;
     DmRelatorios.lblVarIndComp.Text := pnlVariacao.Caption;

  end;

  DmRelatorios.qryMemoria.DisableControls;
  TfrmPreview.CreateModalPreview(Application,
                                 DmRelatorios.rptConsIndMoeda,
                                 DmRelatorios.rptConsIndMoeda.PrinterSetup.DocumentName);
  DmRelatorios.qryMemoria.EnableControls;

end;

procedure TfrmConsIndicadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryConsMoeda.Close;
  qryConsFundos.Close;
  DmRelatorios.qryMemoria.Close;

end;

function TfrmConsIndicadores.BuscaCotaFundo(wIDFundo: Integer; wData: TDateTime): Double;
var qry: TwwQuery;
begin
   qry := TwwQuery.Create(Self);
   qry.DatabaseName := 'BASEDADOS';
   qry.SQL.Add('SELECT VLRCOTA FROM COTAFUNDO WHERE IDFUNDOINVEST = ' + IntToStr(wIDFundo) );
   qry.Open;
   if qry.IsEmpty then
      Result := 0
   else
      Result := qry.FieldByName('COTAFUNDO').AsFloat;

   qry.Close;
   qry.Free

end;


procedure TfrmConsIndicadores.FormCreate(Sender: TObject);
begin
  inherited;
  DmRelatorios.ppsVarFundo.Brush.Color := $00C0FFFF;   // Amarelo bebe
  DmRelatorios.ppsVarIndComp.Brush.Color := $00C0FFFF;
  DmRelatorios.ppsVarComp.Brush.Color := $00C0FFFF;
end;

procedure TfrmConsIndicadores.Copiar1Click(Sender: TObject);
var sValor: String;
begin
  inherited;
  Case pmnuCopiar.Tag of
       1: sValor := pnlVariacao.Caption;
       2: sValor := pnlCDI.Caption;
       3: sValor := pnlPerSInd.Caption;
       else sValor := '';
  end;
  Delete(sValor,Pos('%',sValor),1);
  edtValor.Text := sValor;
  edtValor.SelectAll;
  edtValor.CopyToClipboard;
end;

procedure TfrmConsIndicadores.pnlVariacaoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  pmnuCopiar.Tag := TPanel(Sender).Tag;
end;

procedure TfrmConsIndicadores.dblConsMoedaChange(Sender: TObject);
var x, wTamTot: Integer;
begin
  inherited;
  PreparaTela;
end;

procedure TfrmConsIndicadores.PreparaTela;
var x, wTamTot: Integer;
begin
  inherited;
  DmRelatorios.qryMemoria.Close;
  pnlVariacao.Caption := '';
  pnlCDI.Caption := '';
  pnlPerSInd.Caption := '';

  wTamTot := (dbgMemoria.Width - dbgMemoria.Left) - 38;

  if cmbTipoIndicador.Text = 'FUNDO' then
  begin
     dblConsFundos.Visible := True;
     lblFundos.Visible := True;
     lblVarIndicativo.Visible := True;
     pnlCDI.Visible := True;
     lblIndicador.Caption := 'Indicador Comparativo';
     grbPeriodo.Left := 312;
     lblVariacao.Left := 7;
     pnlVariacao.Left := 127;
     lblVarIndicativo.Left := 232;
     pnlCDI.Left := 289;
     lblPerSInd.Visible := True;
     pnlPerSInd.Visible := True;
     dbgMemoria.Columns[2].Visible := False;
     dbgMemoria.Columns[4].Title.Caption := 'Variação até a Data';
     dbgMemoria.Columns[3].Visible := False;
     dbgMemoria.Columns[5].Visible := True;
     wTamTot := StrToInt(FloatToStr(Int(wTamTot / 4)))+1;
  end
  else
  begin
     dblConsFundos.Visible := False;
     lblFundos.Visible := False;
     lblVarIndicativo.Visible := False;
     pnlCDI.Visible := False;
     lblIndicador.Caption := 'Indicador';
     grbPeriodo.Left := 165;
     lblVariacao.Left := 166;
     pnlVariacao.Left := 302;
     lblPerSInd.Visible := False;
     pnlPerSInd.Visible := False;
     if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA' then
     begin
        wTamTot := StrToInt(FloatToStr(Int(wTamTot / 4)))+1;
        dbgMemoria.Columns[2].Visible := False;
        dbgMemoria.Columns[4].Title.Caption := 'Variação até a Data';
        dbgMemoria.Columns[3].Visible := False;
        dbgMemoria.Columns[5].Visible := True;
     end
     else
     begin
        wTamTot := StrToInt(FloatToStr(Int(wTamTot / 5)));
        dbgMemoria.Columns[2].Visible := True;
        dbgMemoria.Columns[4].Title.Caption := 'Variação Diária';
        dbgMemoria.Columns[3].Visible := True;
        dbgMemoria.Columns[5].Visible := False;
     end;
  end;

  for x := 0 to dbgMemoria.Columns.Count -1 do
      dbgMemoria.Columns[x].Width := wTamTot;

end;

procedure TfrmConsIndicadores.cmbTipoIndicadorChange(Sender: TObject);
begin
  inherited;
  PreparaTela;
end;

procedure TfrmConsIndicadores.edDataIniExit(Sender: TObject);
begin
  inherited;

    While not DiasUteisInv.DiaUtil(edDataIni.Date,-1,1,'',True,False,False) Do
      edDataIni.Date  := edDataIni.Date - 1;   // Achar o dia útil anterior

end;

procedure TfrmConsIndicadores.edDataFimExit(Sender: TObject);
begin
  inherited;

    While not DiasUteisInv.DiaUtil(edDataFim.Date,-1,1,'',True,False,False) Do
      edDataFim.Date  := edDataFim.Date - 1;   // Achar o dia útil anterior

end;

end.

{


   if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'PU') then
      // PU Manual (Qtd X PU)
      wFatorCDI := ValorPU(qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                           qryConsMoeda.FieldByName('MOESIGLA').AsString,
                           DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,
                           StrToFloat(IntToStr(spePercentual.Value)))
   else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'TR') then
{      wFator := AcumuladoTR(dDataAtu,
                            QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                            QryLocal.FieldByName('DATAINITR').AsDateTime,
                            dDataBase,
                            QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                            QryLocal.FieldByName('PERCINDEX').asFloat,
                            QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                            bSaldoIni)  }

{   else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'ANBID') then
{      wFator := AcumuladoANBID(dDataAtu,
                               QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                               dDataBase,
                               QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('PERCINDEX').asFloat,
                               QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                               QryLocal.FieldByName('DIASPRAZOANBID').AsInteger,
                               bSaldoIni)}

{   else if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'TJLP' then
{      wFator := AcumuladoTJLP(dDataAtu,
                              QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                              dDataBase,
                              QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                              QryLocal.FieldByName('PERCINDEX').asFloat,
                              QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                              QryLocal.FieldByName('DIASPRAZOANBID2').AsInteger,
                              bSaldoIni)}

{   else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA') then
{      wFator := AcumuladoPU(dDataAtu,
                            QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                            dDataBase,
                            QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                            QryLocal.FieldByName('PERCINDEX').asFloat,
                            QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                            bSaldoIni)}

{   else if ((qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'DI') Or
            (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'SELIC')) Then

      wFatorCDI := AcumuladoDI(qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                               qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                               dDataAnt,
                               dDataFim,
                               StrToFloat(IntToStr(spePercentual.Value)))

   else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'IGPM') or
            (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'INPC') then
{      wFator := AcumuladoIGPM(QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                              QryLocal.FieldByName('CODTRATAIND').AsString,
                              QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                              dDataBase,
                              QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                              dDataAtu,
                              QryLocal.FieldByName('PERCINDEX').AsFloat) }

{   else if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'IGPDI' then
{      wFator := AcumuladoIGPDI(dDataAtu,
                               QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                               dDataBase,
                               QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('PERCINDEX').asFloat,
                               QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                               bSaldoIni,iPzIGPDI,dcp,dct,bProRataIGPDI) }

{   else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = '') and
           (qryConsMoeda.FieldByName('INDEXRENFIX').AsInteger > 0) Then
{      wFator := AcumuladoPUManual(dDataAtu,
                                  dDataBase,
                                  QryLocal.FieldByName('PERCINDEX').AsFloat,
                                  QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                  QryLocal.FieldByName('FLLGPRORATA').AsString,
                                  QryLocal.FieldByName('FLGINTERPOLA').AsString) };




{FazQuery
      if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'PU') then
         // PU Manual (Qtd X PU)
         wFator := ValorPU(qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                            qryConsMoeda.FieldByName('MOESIGLA').AsString,
                            DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,
                            StrToFloat(IntToStr(spePercentual.Value)))
      else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'TR') then
{         wFator := AcumuladoTR(dDataAtu,
                               QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('DATAINITR').AsDateTime,
                               dDataBase,
                               QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('PERCINDEX').asFloat,
                               QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                               bSaldoIni)  }

{      else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'ANBID') then
{         wFator := AcumuladoANBID(dDataAtu,
                                  QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                  dDataBase,
                                  QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                  QryLocal.FieldByName('PERCINDEX').asFloat,
                                  QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                  QryLocal.FieldByName('DIASPRAZOANBID').AsInteger,
                                  bSaldoIni)}

{      else if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'TJLP' then
{         wFator := AcumuladoTJLP(dDataAtu,
                                 QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                 dDataBase,
                                 QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                 QryLocal.FieldByName('PERCINDEX').asFloat,
                                 QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                 QryLocal.FieldByName('DIASPRAZOANBID2').AsInteger,
                                 bSaldoIni)}

{      else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'MOEDA') then
{         wFator := AcumuladoPU(dDataAtu,
                               QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                               dDataBase,
                               QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                               QryLocal.FieldByName('PERCINDEX').asFloat,
                               QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                               bSaldoIni)}

{      else if ((qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'DI') Or
               (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'SELIC')) Then
      begin

         wFator := AcumuladoDI(qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                               qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                               dDataAnt,
                               DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,
                               StrToFloat(IntToStr(spePercentual.Value)));
         wVarTot := AcumuladoDI(qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                               qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                               dDataIni,
                               DmRelatorios.qryMemoria.FieldByName('DATA').AsDateTime,
                               StrToFloat(IntToStr(spePercentual.Value)));

      else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'IGPM') or
               (qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'INPC') then
{         wFator := AcumuladoIGPM(QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                 QryLocal.FieldByName('CODTRATAIND').AsString,
                                 QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                 dDataBase,
                                 QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                 dDataAtu,
                                 QryLocal.FieldByName('PERCINDEX').AsFloat) }

{      else if qryConsMoeda.FieldByName('CODTRATAIND').AsString = 'IGPDI' then
{         wFator := AcumuladoIGPDI(dDataAtu,
                                  QryLocal.FieldByName('DATAEMTITRENFIX').AsDateTime,
                                  dDataBase,
                                  QryLocal.FieldByName('DATAVENCTITRENFIX').AsDateTime,
                                  QryLocal.FieldByName('PERCINDEX').asFloat,
                                  QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                  bSaldoIni,iPzIGPDI,dcp,dct,bProRataIGPDI) }
{      else if (qryConsMoeda.FieldByName('CODTRATAIND').AsString = '') and
              (qryConsMoeda.FieldByName('INDEXRENFIX').AsInteger > 0) Then
{         wFator := AcumuladoPUManual(dDataAtu,
                                     dDataBase,
                                     QryLocal.FieldByName('PERCINDEX').AsFloat,
                                     QryLocal.FieldByName('INDEXRENFIX').AsInteger,
                                     QryLocal.FieldByName('FLLGPRORATA').AsString,
                                     QryLocal.FieldByName('FLGINTERPOLA').AsString) };

