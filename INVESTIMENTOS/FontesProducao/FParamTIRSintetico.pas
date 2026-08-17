//******************************************************************************
// Data      : 24/01/2006
// Pendência : 233367
// SOL       : 21140
// Código    : AL_1
// Motivo    : Filtragem na qryTipoInvest e qryCarteira para somente TipoInvest = Renda Variável
//******************************************************************************

unit FParamTIRSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, OleCtrls,
  vcf1, checklst, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  ComCtrls, Wwdatsrc, Gauges, AxCtrls;

type
  TFrmParamTIRSintetico = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    Label5: TLabel;
    Bevel1: TBevel;
    ChckDiasUteis: TCheckBox;
    Bevel2: TBevel;
    lblParamEmissor: TLabel;
    chklstInvestimentos: TCheckListBox;
    qryInvestimentos: TwwQuery;
    qryInvestimentosIDINVESTIMENTO: TFloatField;
    qryInvestimentosDESCINVESTIMENTO: TStringField;
    qryInvestimentosIDLOTE: TStringField;
    qryTipoInvest: TwwQuery;
    dblcTipoInvest: TwwDBLookupCombo;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    sbtnMarcar: TSpeedButton;
    ChckRentCotas: TCheckBox;
    chkImpFluxo: TCheckBox;
    Bevel3: TBevel;
    ChckTIRInv: TCheckBox;
    qryLocal1: TwwQuery;
    qryLocal2: TwwQuery;
    pnlBarras: TPanel;
    PnlInv: TPanel;
    PnlData: TPanel;
    gauProgresso: TGauge;
    qryInvestimentosNew: TwwQuery;
    qryInvestimentosNewIDINVESTIMENTO: TFloatField;
    qryInvestimentosNewDESCINVESTIMENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMarcarClick(Sender: TObject);
    procedure dblcTipoInvestExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcCarteiraExit(Sender: TObject);
    procedure ChckTIRInvClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
    Procedure SelInvestimentos;
  public
    { Public declarations }
  end;

var
  FrmParamTIRSintetico: TFrmParamTIRSintetico;

implementation

{$R *.DFM}

Uses USistema, uMensErro, FDmRelatorios, UDiasUteis, UBibliotecaInvest, dOperacaoInvest,
     UOperacaoInvest, UOperComum, dOperComum, dFuncoesInvest;

var ListaGeral,ListaPapeis: TStringList;

Procedure TFrmParamTIRSintetico.FazQry;
var
   fTIR, fTIRTotal, fNulo, fSaldo, fSaldoMercado, fSaldoPremio, wVlrCota1, wVlrCota2, wVlrCota3 : double;
   wVlrSaldo, wNumerador, wDenominador, wSoma, wSoma1, wTIR, wSaldoDia,FSALDO1 : double;
   iCalcula, iFlag, iCarteira : smallint;
   dDataAnt, dDataFim, dDataRef: TDate;
   I, idiasuteis, iexp : Byte;
   SpreadSheet: TF1Book;
   sSQL, sTipoInv, sRentab : string;
   bFluxoTitulo : boolean;

   A,B : STRING;
Begin
   OperComum.LimpaParametros(DmRelatorios.qryFluxoTir);
   OperComum.LimpaParametros(DmRelatorios.qryTIRSintetico);   
   sTipoInv  := '';
   wVlrCota3 := 0;
   sTipoInv := ' AND (HC.IDTIPOINVEST = ' + dblcTipoInvest.LookupValue + ') ';

   if Trim(dblcCarteira.Text) <> '' then
      DmRelatorios.RptTIRSinteticoCarteira.Caption := dblcCarteira.Text
   else
      DmRelatorios.RptTIRSinteticoCarteira.Caption := 'Todas';

   dDataAnt := StrToDate(EdDataIni.Text) - 1;

   dDataFim := StrToDate(edDataFim.Text);

   while ((ChckDiasUteis.Checked) and not (DiasUteis.DiaUtil(dDataFim, 0, 1, '', True, False, False))) do
      dDataFim := dDataFim - 1;

   with DmRelatorios.qryTIRSintetico do
   begin
      DmRelatorios.lbDataIni.Caption    := edDataIni.Text;
      DmRelatorios.lbDataFim.Caption    := edDataFim.Text;
      Close;
      Sql.Clear;
      Sql.add(' SELECT DISTINCT IV.DESCINVESTIMENTO, HC.IDLOTE, P.NOME, ');
      Sql.add('                 HC.IDINVESTIMENTO, (0) AS TIR, '' '' AS FLGERRO, (0) AS VARIACAO ');
      Sql.add('  FROM                                                                                         ');
      Sql.add('     HISTCARTINV HC, INVESTIMENTO IV,  EMISSOR EM, PESSOA P ');
      Sql.add('  WHERE                                                            ');
      Sql.add('        (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)                  ');
      Sql.add('    AND (EM.IDEMISSOR        = IV.IDEMISSOR)                       ');
      Sql.add('    AND (P.IDPESSOA          = EM.IDEMISSOR)                       ');
      Sql.add('    AND (HC.IDTIPOINVEST = ' + dblcTipoInvest.LookupValue + ')     ');
      Sql.add('    AND (IV.IDINVESTIMENTO IN (' + ListaPapeis.Text + '))          ');
      Sql.add('  ORDER BY                                                  ');
      Sql.add('        IV.DESCINVESTIMENTO,                                ');
      Sql.add('        HC.IDLOTE                                           ');
      Open;
      First;

      gauProgresso.MaxValue := RecordCount;
      gauProgresso.Progress := 0;
      gauProgresso.ShowText := True;
      while not EOF do
      begin
         PnlInv.Caption := FieldByName('DESCINVESTIMENTO').AsString;
         PnlInv.Repaint;

         if Trim(dblcCarteira.Text) <> '' then
            iCarteira := StrToInt(dblcCarteira.LookupValue)
         else
            iCarteira := -1;

         if ChckTIRInv.Checked then
         begin
            if OPeracaoInvest.CalculaTIRMob(FieldByName('IDINVESTIMENTO').AsInteger,
                                            iCarteira,
                                            qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger,
                                            FieldByName('IDLOTE').AsString,
                                            edDataIni.Date, dDataFim, StrToDate(edDataFim.Text),
                                            True, ChckDiasUteis.Checked, fTir, iCalcula) then
            begin
               Edit;
               if iCalcula = 0 then
                  FieldByName('FLGERRO').AsString := '*'
               else
                  FieldByName('TIR').asFloat := fTIR;
               Post;
            end
            else
            begin
               Edit;
               FieldByName('FLGERRO').AsString := 'S';
               Post;
            end;
         end
         else
         begin
            Edit;
            FieldByName('FLGERRO').AsString := '*';
            Post;
         end;

         Next;
         gauProgresso.Progress := gauProgresso.Progress + 1;
      end;
   end;
   gauProgresso.MaxValue := 100;
   gauProgresso.Progress := 0;
   gauProgresso.ShowText := False;


   PnlInv.Caption := 'TIR Total';
   PnlInv.Repaint;

   // Calcula Rentabilidade das Cotas das Carteiras
   // Calcula TIR Total.

   idiasuteis := 0;

   DmRelatorios.qryFluxoTir.Open;

   dDataRef := dDataAnt;

   while dDataRef <= dDataFim do
   begin
      if ((ChckDiasUteis.Checked) and (DiasUteis.DiaUtil(dDataRef, 0, 1, '', True, False, False))) or
         (not (ChckDiasUteis.Checked)) or
         (dDataRef = dDataAnt)  then
      begin
         DmRelatorios.qryFluxoTir.Append;
         DmRelatorios.qryFluxoTir.FieldByName('DATAMOVCARTINV').asDateTime  := dDataRef;
         DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat           := 0;
         DmRelatorios.qryFluxoTir.Post;
      end;

      if (DiasUteis.DiaUtil(dDataRef, 0, 1, '', True, False, False)) and (dDataRef <> dDataAnt) then
         idiasuteis := idiasuteis + 1;

      dDataRef := dDataRef + 1;
   end;

   PnlData.Caption := IntToStr(idiasuteis) + ' dias úteis. ';
   PnlData.Repaint;

   sSQL :=
      'SELECT DISTINCT CA.DESCCARTINVEST, HC.IDCARTEIRAINVEST '+
      'FROM HISTCARTINV HC,  CARTEIRAINVEST CA, INVESTIMENTO IV '+
      'WHERE '+
      '      (HC.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)       '+
      '  AND (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO)         '+
      '  AND (HC.IDINVESTIMENTO  IS NOT NULL)                      '+
      '  AND (HC.IDTIPOINVEST = ' + dblcTipoInvest.LookupValue + ')';
      if Trim(dblcCarteira.Text) <> '' Then
         sSQL := sSQL + '    AND (HC.IDCARTEIRAINVEST = '+QuotedStr(dblcCarteira.LookupValue)+')  ';

      sSQL := sSQL + '  AND (IV.IDINVESTIMENTO IN (' + ListaPapeis.Text + '))     '+

      '  ORDER BY                                                  '+
      '        CA.DESCCARTINVEST                                   ';

   // Seleciona Todas as Carteiras do Período
   FazQuery(QryLocal1, sSQL);

   // Varre Carteira

   qryLocal1.Open;
   qryLocal1.First;

   while not qryLocal1.EOF do
   begin
      FazQuery(QryLocal2,'SELECT DISTINCT HC.IDINVESTIMENTO, HC.IDLOTE FROM HISTCARTINV HC '+
                         'WHERE  (IDCARTEIRAINVEST = ' + qryLocal1.FieldByName('IDCARTEIRAINVEST').AsString+') ' +
                         sTipoInv + '  AND (HC.IDINVESTIMENTO IN (' + ListaPapeis.Text + '))');

      // Varre Investimentos da Carteira

      QryLocal2.Open;
      QryLocal2.First;

      gauProgresso.MaxValue := DmRelatorios.qryFluxoTir.RecordCount * QryLocal2.RecordCount;
      gauProgresso.Progress := 0;
      gauProgresso.ShowText := True;

      while not QryLocal2.EOF do
      begin
         // Percorre Período para Investimento/Carteira, acumulando Saldos
         DmRelatorios.qryFluxoTir.First;
         while not DmRelatorios.qryFluxoTir.EOF do
         begin
            DmRelatorios.qryFluxoTir.Edit;
            // Verifica se o título possui Fluxo de Pagamento (Renda Fixa)
            with dtmFuncoesInvest.QryBuscaFluxoTitulo do
            begin
               Close;
               ParamByName('iIdinvestimento').AsInteger := QryLocal2.FieldByName('IDINVESTIMENTO').AsInteger;
               ParamByName('dDataRef').AsString         := DmRelatorios.qryFluxoTir.FieldByName('DATAMOVCARTINV').AsString;
               Open;
               if not IsEmpty then
                  bFluxoTitulo := True
               else
                  bFluxoTitulo := False;
            end;

            if DmRelatorios.qryFluxoTir.FieldByName('DATAMOVCARTINV').asDateTime = dDataAnt then
            begin
               // Busca Saldo Inicial no dia anterior a Data Inicio para simular uma Compra (-)
               OperComum.CalculaSaldo(QryLocal2.FieldByName('IDINVESTIMENTO').AsInteger,
                               qryLocal1.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryLocal2.FieldByName('IDLOTE').AsString,
                               dDataAnt,
                               fNulo, fSaldo,
                               fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fSaldoMercado,fNulo,
                               fNulo, fSaldoPremio, fNulo, fNulo, fNulo, fNulo, fNulo);

               FSALDO1 := fSaldo;
               DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat := DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat + (fSaldo* -1)
            end
            else
            begin
               fSaldo   := OPeracaoInvest.CalculaSaldoDiaTIR(
                                                         QryLocal2.FieldByName('IDINVESTIMENTO').AsInteger,
                                                         qryLocal1.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                         qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger,
                                                         QryLocal2.FieldByName('IDLOTE').AsString,
                                                         DmRelatorios.qryFluxoTir.FieldByName('DATAMOVCARTINV').asDateTime,
                                                         dDataFim, StrToDate(edDataFim.Text), iFlag,bFluxoTitulo);
               DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat := DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat + fSaldo;
            end;
            DmRelatorios.qryFluxoTir.Post;
            DmRelatorios.qryFluxoTir.Next;
            gauProgresso.Progress := gauProgresso.Progress + 1;
         end;
         QryLocal2.Next;
      end;
      gauProgresso.MaxValue := 100;
      gauProgresso.Progress := 0;
      gauProgresso.ShowText := False;

      // Busca Rentabilidade por Cotas da Carteira a Vista

      if qryLocal1.FieldByName('IDCARTEIRAINVEST').AsInteger = 1 then
      begin
         wVlrCota1 := OPerComum.BuscaVlrCotaCarteira(
                                   qryLocal1.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   StrToDate(edDataIni.Text) - 1);
         wVlrCota2 := OPerComum.BuscaVlrCotaCarteira(
                                   qryLocal1.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   StrToDate(edDataFim.Text));
         if wVlrCota1 <> 0 then
            wVlrCota3 := wVlrCota2/wVlrCota1
         else
            wVlrCota3 := 0;
      end;

      qryLocal1.Next;
   end;

   // Cria Planilha com valores zerados.
   SpreadSheet := TF1Book.Create(Application);
   SpreadSheet.ClearRange(-1, -1, -1, -1, F1ClearAll);

   wSoma := 0;
   I := 0;
   DmRelatorios.qryFluxoTir.First;

   while not DmRelatorios.qryFluxoTir.EOF do
   begin
      // ************* Alimenta Planilha com saldo do dia
      I := I + 1;
      a := FloatToStr(DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat);
      SpreadSheet.NumberRC[i,1]    := DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat;
      wSaldoDia := DmRelatorios.qryFluxoTir.FieldByName('SALDODIA').asFloat;
      wSoma := wSoma + wSaldoDia;
      DmRelatorios.qryFluxoTir.Next;
   end;

   if ChckDiasUteis.Checked then
      iexp := idiasuteis
   else
     iexp := i - 1;

   // preenche a fórmula e calcula TIR.
   SpreadSheet.FormulaRC[2,2]    := 'IF(B3=0;9999999;((IRR(' + 'A1:A' + IntToStr(I) + '; ' + FloatToStr(1/1000) + ' ) + 1) ^ (' + IntToStr(iexp) + ') - 1) *100)';
   SpreadSheet.FormulaRC[3,2]    := 'SUM(' + 'A1:A' + IntToStr(I) + ')';
   SpreadSheet.FormulaRC[4,2]    := 'IRR(' + 'A1:A' + IntToStr(I) + ')';

   try
      SpreadSheet.Recalc;
      fTIRTotal := SpreadSheet.NumberRC[2,2];
      a := FloatToStr(fTIRTotal);
      wSoma     := SpreadSheet.NumberRC[3,2];
      wTIR      := SpreadSheet.NumberRC[4,2];
      b := FloatToStr(WTIR);

      SpreadSheet.Free;
   except
      SpreadSheet.Free;
   end;

   // Varre Carteira
   wSoma := wSoma + wTIR;

   if fTirTotal = 9999999 then
      fTirTotal := 0;

   if ChckRentCotas.Checked Then
      sRentab := 'Rentabilidade de Cotas :  '+
                  FloatToStrF((wVlrCota3 - 1)*100,FfNumber,17,2)+
                  ' %                                                        '
   else
      sRentab := Replicate(' ',101);

   try
      DmRelatorios.Lbl2.Caption := sRentab + FormatFloat('##,###,###,##0.00',OperComum.Round(fTIRTotal,2));
   except
      // Para omitir qualquer erro na formatação da TIR
   end;

   qryLocal1.Close;
   QryLocal2.Close;

   if chkImpFluxo.Checked then
      DmRelatorios.srptFluxo.Visible := True
   else
      DmRelatorios.srptFluxo.Visible := False;

end;

procedure TFrmParamTIRSintetico.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmParamTIRSintetico.bbtnConfirmarClick(Sender: TObject);
var x: Integer;
    strInv: String;
begin
  inherited;
  ListaPapeis.Clear;
  for x := 0 to (chklstInvestimentos.Items.Count-1) do
  begin
// Caso Checado inclui na lista
    if chklstInvestimentos.Checked[x] then
    begin
       if ListaPapeis.Count = 0 then
          ListaPapeis.Add(ListaGeral.Strings[x])
       else
          ListaPapeis.Add(',' + ListaGeral.Strings[x]);
    end;
  end;

  if ListaPapeis.Count = 0 then
  begin
     MsgDlg('Nenhum Investimento foi escolhido ','Mensagem do Sistema ',
            mtWarning,[MbOk],0);
     ModalResult := mrNone;
     Exit;
  end
  else
     FazQry;

end;

procedure TFrmParamTIRSintetico.edDataIniExit(Sender: TObject);
begin
  inherited;
  If trim(edDataIni.Text) = '' Then
     Begin
         MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
         edDataIni.SetFocus;
     End;
end;

procedure TFrmParamTIRSintetico.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then
     Begin
         MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
         edDataFim.SetFocus;
     End;

end;

procedure TFrmParamTIRSintetico.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
  qryTipoInvest.Open;
  dblcTipoInvest.Text := qryTipoInvestDESCTIPOINVEST.AsString;
  dblcTipoInvest.LookupValue := qryTipoInvestIDTIPOINVEST.AsString;
  ChckDiasUteis.Checked:=True;
  ListaPapeis := TStringList.Create;
  ListaGeral := TStringList.Create;
end;

procedure TFrmParamTIRSintetico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
  qryInvestimentos.Close;
  qryTipoInvest.Close;
  ListaPapeis.Free;
  ListaGeral.Free;
end;

procedure TFrmParamTIRSintetico.sbtnMarcarClick(Sender: TObject);
var x: Integer;
begin
  inherited;
  if sbtnMarcar.Down then
  begin
     for x := 0 to chklstInvestimentos.Items.Count -1 do
         chklstInvestimentos.Checked[x] := True;
     sbtnMarcar.Caption := 'Desmarcar Todos';
  end
  else
  begin
     for x := 0 to chklstInvestimentos.Items.Count -1 do
         chklstInvestimentos.Checked[x] := False;
     sbtnMarcar.Caption := 'Marcar Todos';
  end

end;

procedure TFrmParamTIRSintetico.SelInvestimentos;
var sTipo: String;
    x: Integer;
begin
  inherited;
  OperComum.LimpaParametros(qryInvestimentosNew);
  qryInvestimentosNew.ParamByName('IDTIPOINVEST').AsInteger := qryTipoInvestIDTIPOINVEST.AsInteger;
  qryInvestimentosNew.Open;
  qryInvestimentosNew.First;

  ListaGeral.Clear;
  chklstInvestimentos.Clear;


  while not qryInvestimentosNew.Eof do
  begin
     chklstInvestimentos.Items.Add(qryInvestimentosNew.FieldByName('DESCINVESTIMENTO').AsString);
     chklstInvestimentos.Checked[chklstInvestimentos.Items.Count-1] := True;

     ListaGeral.Add(qryInvestimentosNew.FieldByName('IDINVESTIMENTO').AsString);

     qryInvestimentosNew.Next;
  end;
  sbtnMarcar.Down := True;
  sbtnMarcar.Caption := 'Desmarcar Todos';

end;


procedure TFrmParamTIRSintetico.dblcTipoInvestExit(Sender: TObject);
begin
  inherited;
  if dblcTipoInvest.Text = '' then
  begin
     MsgDlg('Escolha um Tipo de Investimento','Erro',mtError,[mbOK],0);
     dblcTipoInvest.SetFocus;
  end
  else
     qryCarteira.Close;
     qryCarteira.Open;
     SelInvestimentos;

end;

procedure TFrmParamTIRSintetico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

procedure TFrmParamTIRSintetico.dblcCarteiraExit(Sender: TObject);
begin
  inherited;
  SelInvestimentos;

end;

procedure TFrmParamTIRSintetico.ChckTIRInvClick(Sender: TObject);
begin
  inherited;
  if ChckTIRInv.Checked then
  begin
     sbtnMarcar.Enabled := True;
     chklstInvestimentos.Enabled := True;
  end
  else
  begin
     sbtnMarcar.Enabled := False;
     chklstInvestimentos.Enabled := False;
  end;
end;

end.


