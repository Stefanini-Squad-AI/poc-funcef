//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_10
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_9
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_8
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data     : 23/11/2005
// Código   : AL_7
// Motivo   : Ajuste para mostrar os papeis que deixaram de existir durante o período do Rel.
//            (Incorporação) - Transfere variação e custo para outro
//********************************************************************************************************
// Data     : 29/03/2005
// Código   : AL_6
// Motivo   : Alterado por uma rotina mais rapida
//********************************************************************************************************
// Data     : 28/03/2005
// Código   : AL_5
// Motivo   : Alterado o sql para tornar mais rapido o resultado
//********************************************************************************************************
// Data     : 11/11/2004
// Código   : AL_4
// Motivo   : Incluido filtro tipoinvest = 2
//********************************************************************************************************
// Data     : 13/10/2004
// Código   : AL_3
// Motivo   : Passa a permitir a escolha das Carteiras para impressão
//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//********************************************************************************************************
// Data     : 11/06/2004
// Origem   : CM
// Função   : FazQry
// Motivo   : Tirado o filtro de Lote para não ocorrer problema com opções
//********************************************************************************************************

unit FParamVarMesCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UBibliotecaInvest,
  UOperacaoInvest, UOperComum, dOperComum, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, CheckLst;

type
  TFrmParamVarMesCarteira = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    Label1: TLabel;
    edDataFim: TCMDateTimePicker;
    qryCarteira: TwwQuery;
    QryDtIni: TwwQuery;
    qrySaldoIni: TwwQuery;
    qryQtdVenda: TwwQuery;
    qryQtdVendaQTDE: TFloatField;
    qryCalculaBaixa: TwwQuery;
    qryCalculaBaixaCUSTOVENDA: TFloatField;
    qryCalculaBaixaQTDEMOVINVCART: TFloatField;
    sbtnMarcar: TSpeedButton;
    chklstCarteiras: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMarcarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
    function  BuscaVarMesAnterior(dDataIni,dDataFim : TDateTime):Double;
    function  ValidaCampos : boolean;
  public
    { Public declarations }
  end;

var
  FrmParamVarMesCarteira: TFrmParamVarMesCarteira;
  dDataAnt: TDate;
  fVlrMesAnterior, fVlrMesAntPeriodo,fVlrDifVarMesAnt: Double;
  ListaGeral,ListaCarteiras: TStringList;
implementation

{$R *.DFM}

Uses USistema, uMensErro, FDmRelatorios, UDiasUteisInv;

Procedure TFrmParamVarMesCarteira.FazQry;
var
  wTotalCarteira, wH2SaldoVlrInvCart, wH2SaldoAqui, wH2SaldoAtu, wH2SaldoMercado, wH2SaldoQtde,
  wSaldoAtu,wVarAteMes : double;
  iCartant : integer;
  fNulo, wCotacao1, wCotacao2, wVariacaoMes,wQtdVendida,wTotalBaixa : double;
  wCotacaoIni,wCotacaoFim : double;
  UsaLote:Boolean;
  dDataCotacao: TDateTime;
  QryLocal :TwwQuery;
  sSQL : String;

Begin
   fNulo := 0;
   iCartAnt := 0;
   fVlrMesAntPeriodo := 0;

   // Cria Objetos Locais
   QryLocal              := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';

   With DmRelatorios.qryVarMesCarteira Do
   Begin
      DmRelatorios.RptVarMesCarteiraLabel2.Caption    := edDataIni.Text;
      DmRelatorios.RptVarMesCarteiraLabel4.Caption    := edDataFim.Text;
      Close;
      Sql.Clear;
      Sql.add(' SELECT                                                          ');
      Sql.add('     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE, H1.IDCARTEIRAINVEST, ');
      Sql.add('     H1.DATAMOVCARTINV AS DATAMOV1, H1.IDINVESTIMENTO,CA.IDTIPOINVEST,                      ');
      Sql.add('     H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART, H1.SALDOAQUI, H1.SALDOATU, (0) AS COTACAO,    ');
      Sql.add('     (0) AS VARATEMESANT, (0) AS VARATEMES, (0) AS VARMES, (0) AS TOTCART, (0) AS VARIACAO, ');
      Sql.add('     (0) AS BAIXA, (0) AS QTDEANT ');
      Sql.add('  FROM                                                                       ');
      Sql.add('     HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV             ');
      Sql.add('  WHERE                                                                      ');
      //AL_5
      Sql.add('        (H1.IDHISTCARTINV   IN          ');
      Sql.add('            (SELECT MAX(IDHISTCARTINV)');
      Sql.add('             FROM   HISTCARTINV       ');
      Sql.add('             WHERE (IDTIPOINVEST = 2) ');
      Sql.add('               AND (IDCARTEIRAINVEST IN (' + ListaCarteiras.Text + ')) ');
      Sql.add('               AND (DATAMOVCARTINV || IDINVESTIMENTO) IN               ');
      Sql.add('                   (SELECT (MAX(DATAMOVCARTINV) || IDINVESTIMENTO)     ');
      Sql.add('  	           FROM    HISTCARTINV                     ');
      Sql.add('                    WHERE  (IDTIPOINVEST = 2)               ');
      Sql.add('                     AND   (IDCARTEIRAINVEST IN (' + ListaCarteiras.Text + ')) ');
      // AL_7 - Ini
      Sql.add('                     AND   (DATAMOVCARTINV  >= TO_DATE('''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY'')) ');
      Sql.add('                     AND   (DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY'')) ');
      Sql.add('                    GROUP BY IDCARTEIRAINVEST,IDINVESTIMENTO) ');
      Sql.add('             GROUP BY IDCARTEIRAINVEST,IDINVESTIMENTO))     ');
      // AL_7 - Fim
      Sql.add('    AND (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
      Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
      Sql.add('  ORDER BY                                                  ');
      Sql.add('        CA.DESCCARTINVEST,                                  ');
      Sql.add('        IV.DESCINVESTIMENTO,                                ');
      Sql.add('        H1.IDLOTE                                           ');
      Open;
      First;

      While Not EOF Do
      Begin

         if iCartant <> FieldByName('IDCARTEIRAINVEST').AsInteger then
         begin

            //Al_6
            OperComum.TotalSaldosInvCart(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         -1, -1, -1,
                                         EdDataFim.Date, fNulo, wTotalCarteira,
                                         fNulo, fNulo, fNulo, fNulo);

            iCartAnt := FieldByName('IDCARTEIRAINVEST').AsInteger;
         end;

         // Verifica se o SaldoQtdeInvCart = 0  na DataInicio -1.
         // Se o saldo na datainicio-1 for = 0, não mostrar.
         QryDtIni.Close;
         if FieldByName('IDCARTEIRAINVEST').AsInteger <> 0 then
            QryDtIni.ParamByName('pIDCARTEIRAINVEST').AsInteger := FieldByName('IDCARTEIRAINVEST').AsInteger;
         QryDtIni.ParamByName('pIDINVESTIMENTO').AsInteger   := FieldByName('IDINVESTIMENTO').AsInteger;
         QryDtIni.ParamByName('pDATAMOVCARTINV').AsDateTime  := StrToDateTime(edDataIni.Text)-1;
         QryDtIni.Open;

         if QryDtIni.RecordCount <> 0 then
            DmRelatorios.DetVarMesCarteira.Visible := False
         else
            DmRelatorios.DetVarMesCarteira.Visible := True;

         // Se o SaldoQtdeInvCart = 0 na data inicial mas se tiver algum lançamento no período deve mostrar
         qrySaldoIni.Close;
         if FieldByName('IDCARTEIRAINVEST').AsInteger <> 0 then
            qrySaldoIni.ParamByName('pIDCARTEIRAINVEST').AsInteger := FieldByName('IDCARTEIRAINVEST').AsInteger;
         qrySaldoIni.ParamByName('pIDINVESTIMENTO').AsInteger   := FieldByName('IDINVESTIMENTO').AsInteger;
         qrySaldoIni.ParamByName('pDataSaldo').AsDateTime       := StrToDateTime(edDataIni.Text)-1;
         qrySaldoIni.ParamByName('pDataIni').AsDateTime         := StrToDateTime(edDataIni.Text);
         qrySaldoIni.ParamByName('pDataFim').AsDateTime         := StrToDateTime(edDataFim.Text);
         qrySaldoIni.Open;

         if qrySaldoIni.RecordCount <> 0 then
            DmRelatorios.DetVarMesCarteira.Visible := False
         else
            DmRelatorios.DetVarMesCarteira.Visible := True;

         // Guarda Cotacao
         wCotacao1 := OperComum.BuscaCotacaoInvest(
                       FieldByName('IDINVESTIMENTO').AsInteger, StrToDate(edDataFim.Text), False);
         wCotacao2 := OperComum.BuscaCotacaoInvest(
                       FieldByName('IDINVESTIMENTO').AsInteger, StrToDate(edDataIni.Text)-1, False);

         wH2SaldoVlrInvCart := 0;
         wH2SaldoAqui       :=0;
         wH2SaldoMercado    :=0;
         wQtdVendida := 0;
         wTotalBaixa := 0;
         //AL_1
         //AL_2
         //AL_8
         //AL_9
         //AL_10
         OperComum.BuscaTodosSaldosInvestLote (FieldByName('IDCARTEIRAINVEST').AsInteger, 0,
                                               FieldByName('IDINVESTIMENTO').AsInteger,
                                               high(integer), -1,
                                               FieldByName('IDLOTE').AsString,
                                               DateToStr(edDataIni.Date-1), -1,
                                               wH2SaldoQtde, wH2SaldoVlrInvCart,
                                               wH2SaldoAtu, fNulo, wH2SaldoAqui,
                                               fNulo, wH2SaldoMercado, fNulo, fNulo,
                                               fNulo, fNulo, fNulo, fNulo, fNulo,
                                               fNulo, fNulo, fNulo, fNulo, fNulo);

         // Calcula Variação no Mês
         sSQL :=        'SELECT  SUM(VLRVARIACAO) AS VLRMOVCARTINV ';
         sSQL := sSQL + 'FROM HISTCARTINV                         ';
         sSQL := sSQL + 'WHERE ((TIPMOVCARTINV    = ''ATU'') OR     ';
         sSQL := sSQL + '       ((TIPMOVCARTINV    = ''OPE'') AND (IDTIPOOPERACAO = ' + IntToStr(pRPI.IDTIPOOPERDIRINC) +')) OR ';
         sSQL := sSQL + '       ((TIPMOVCARTINV    = ''OPE'') AND (IDTIPOOPERACAO = ' + IntToStr(pRPI.IDTIPOOPERDIRALT) +')) OR ';
         sSQL := sSQL + '       ((TIPMOVCARTINV    = ''OPE'') AND (IDTIPOOPERACAO = ' + IntToStr(pRPI.IDTIPOOPERDIRINC + 10000) +')) OR ';
         sSQL := sSQL + '       ((TIPMOVCARTINV    = ''OPE'') AND (IDTIPOOPERACAO = ' + IntToStr(pRPI.IDTIPOOPERDIRALT + 10000) +'))) AND ';

         sSQL := sSQL + '      (IDCARTEIRAINVEST = '+FieldByName('IDCARTEIRAINVEST').AsString+') AND ';
         sSQL := sSQL + '      (IDINVESTIMENTO   = '+FieldByName('IDINVESTIMENTO').AsString+')  AND ';
         if FieldByName('IDLOTE').AsString <> '' then
            sSQL := sSQL + '      (IDLOTE = '''+FieldByName('IDLOTE').AsString+''')  AND '
         else
            sSQL := sSQL + '      (IDLOTE IS NULL)  AND ';
         sSQL := sSQL + '      (DATAMOVCARTINV <= TO_DATE( '''+DateToStr(edDataFim.Date)+''',''DD/MM/YYYY'')) AND ';
         sSQL := sSQL + '      (DATAMOVCARTINV >= TO_DATE( '''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY'')) ';

         FazQuery(QryLocal, sSQL);
         wVariacaoMes:=QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;

         Edit;

         FieldByName('VARATEMESANT').asFloat := wH2SaldoMercado - wH2SaldoAqui;
         // Armazena o valor
         fVlrMesAntPeriodo := fVlrMesAntPeriodo + (wH2SaldoMercado - wH2SaldoAqui);
            wTotalBaixa := (FieldByName('SALDOVLRINVCART').AsFloat -
                            FieldByName('SALDOAQUI').AsFloat -
                            (wH2SaldoMercado - wH2SaldoAqui)) -
                             wVariacaoMes;
            FieldByName('BAIXA').asFloat := wTotalBaixa;

         // Zera a Baixa de Variacao caso Positiva
         wVarAteMes := FieldByName('SALDOVLRINVCART').AsFloat -
                       FieldByName('SALDOAQUI').AsFloat;
         FieldByName('VARATEMES').asFloat := wVarAteMes;

         FieldByName('VARMES').asFloat       := wVariacaoMes;
         if wCotacao2 <> 0 then
            FieldByName('VARIACAO').asFloat  := ((wCotacao1/wCotacao2) - 1)*100;
         FieldByName('TOTCART').asFloat      := wTotalCarteira;
         FieldByName('COTACAO').asFloat      := wCotacao1;
         FieldByName('QTDEANT').asFloat      := wH2SaldoQtde;
         Post;
         Next;
      end;
   End;
End;

procedure TFrmParamVarMesCarteira.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmParamVarMesCarteira.bbtnConfirmarClick(Sender: TObject);
Var
  wMes, wAno, wDia:Word;
  x : integer;
begin
  inherited;
  ListaCarteiras.Clear;
  for x := 0 to (chklstCarteiras.Items.Count-1) do
  begin
    // Caso Checado inclui na lista
    if chklstCarteiras.Checked[x] then
    begin
       if ListaCarteiras.Count = 0 then
          ListaCarteiras.Add(ListaGeral.Strings[x])
       else
          ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
    end;
  end;

  if ListaCarteiras.Count = 0 then
  begin
     MsgDlg('Nenhum Investimento foi escolhido ','Mensagem do Sistema ',
            mtWarning,[MbOk],0);
     ModalResult := mrNone;
     Exit;
  end
  else
  begin
     if ValidaCampos then
     begin
        fVlrMesAnterior := BuscaVarMesAnterior(StrToDate(edDataIni.Text),StrToDate(edDataFim.Text));
        FazQry;
        fVlrDifVarMesAnt := fVlrMesAnterior - fVlrMesAntPeriodo;
        DmRelatorios.RptVarMesCarteiralblDifMesAnt.Caption    := FormatFloat('###,###,###,##0.00',fVlrDifVarMesAnt);
        DmRelatorios.RptVarMesCarteiralblVarMesAntTot.Caption := FormatFloat('###,###,###,##0.00',fVlrMesAnterior);
     end;
  end;
end;

procedure TFrmParamVarMesCarteira.edDataIniExit(Sender: TObject);
Var
  wMes, wAno, wDia:Word;
begin
  inherited;
  If trim(edDataIni.Text) = '' Then
     Begin
         MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
         edDataIni.SetFocus;
     End
     else
        dDataAnt := StrToDate(edDataIni.Text) - 1;

   DecodeDate(StrToDate(edDataIni.Text),wAno,wMes,wDia);
   EdDataFim.Date:=DiasUteis.UltDiaMes(wAno,wMes);

end;

procedure TFrmParamVarMesCarteira.edDataFimExit(Sender: TObject);
Var
  wMes, wAno, wDia:Word;
begin
  inherited;
  If trim(EdDataFim.Text) = '' Then Begin
    MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
     edDataFim.SetFocus;
  End;
  DecodeDate(StrToDate(EdDataFim.TExt),wAno,wMes,wDia);
  // Data Final deve ser igual ao Ultimo dia do Mes
end;

procedure TFrmParamVarMesCarteira.FormShow(Sender: TObject);
begin
  inherited;
  ListaCarteiras := TStringList.Create;
  ListaGeral := TStringList.Create;

  ListaGeral.Clear;
  chklstCarteiras.Clear;
  qryCarteira.open;
  while not qryCarteira.Eof do
  begin
     chklstCarteiras.Items.Add(qryCarteira.FieldByName('DESCCARTINVEST').AsString);
     chklstCarteiras.Checked[chklstCarteiras.Items.Count-1] := True;

     ListaGeral.Add(qryCarteira.FieldByName('IDCARTEIRAINVEST').AsString);

     qryCarteira.Next;
  end;
  sbtnMarcar.Down := True;
  sbtnMarcar.Caption := 'Desmarcar Todos';

end;

procedure TFrmParamVarMesCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
  ListaCarteiras.Free;
  ListaGeral.Free;
end;

function TFrmParamVarMesCarteira.BuscaVarMesAnterior(dDataIni,dDataFim : TDateTime):Double;
var
  wTotalCarteira, wH2SaldoVlrInvCart, wH2SaldoAqui, wH2SaldoAtu, wH2SaldoMercado, wH2SaldoQtde,
  wSaldoAtu,wVarAteMes : double;
  iCartant : integer;
  fNulo, wCotacao1, wCotacao2, wVariacaoMes,wQtdVendida,wTotalBaixa : double;
  wCotacaoIni,wCotacaoFim : double;
  UsaLote:Boolean;
  dDataCotacao: TDateTime;
  QryLocal1 :TwwQuery;
  sSQL : String;

  iAno,iMes,iDia : word;
  dDataTemp,dDataIniAnt,dDataFimAnt : TDateTime;
Begin
   Result := 0;

   //Monta Datas Mês Anterior
   DecodeDate(dDataIni,iAno,iMes,iDia);
   dDataTemp  := EncodeDate(iAno,iMes,1);
   dDataFimAnt := DiasUteisInv.UltDiaUtilAnterior(dDataTemp,-1,1,'',True,False,False);

   DecodeDate(dDataFimAnt,iAno,iMes,iDia);
   dDataTemp  := EncodeDate(iAno,iMes,1);
   dDataIniAnt := dDataTemp;


   fNulo := 0;
   iCartAnt := 0;

   // Cria Objetos Locais
   QryLocal1              := TwwQuery.Create(Application);
   QryLocal1.DatabaseName := 'BaseDados';

   With DmRelatorios.qryVarMesCarteira Do
   Begin
      Close;
      Sql.Clear;
      Sql.add(' SELECT                                                          ');
      Sql.add('     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE, H1.IDCARTEIRAINVEST, ');
      Sql.add('     H1.DATAMOVCARTINV AS DATAMOV1, H1.IDINVESTIMENTO,CA.IDTIPOINVEST,                      ');
      Sql.add('     H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART, H1.SALDOAQUI, H1.SALDOATU, (0) AS COTACAO,    ');
      Sql.add('     (0) AS VARATEMESANT, (0) AS VARATEMES, (0) AS VARMES, (0) AS TOTCART, (0) AS VARIACAO, ');
      Sql.add('     (0) AS BAIXA, (0) AS QTDEANT ');
      Sql.add('  FROM                                                                       ');
      Sql.add('     HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV             ');
      Sql.add('  WHERE                                                                      ');
      //AL_5
      Sql.add('        (H1.IDHISTCARTINV   IN          ');
      Sql.add('            (SELECT MAX(IDHISTCARTINV)');
      Sql.add('             FROM   HISTCARTINV       ');
      Sql.add('             WHERE (IDTIPOINVEST = 2) ');
      Sql.add('               AND (IDCARTEIRAINVEST IN (' + ListaCarteiras.Text + ')) ');
      Sql.add('               AND (DATAMOVCARTINV || IDINVESTIMENTO) IN               ');
      Sql.add('                   (SELECT (MAX(DATAMOVCARTINV) || IDINVESTIMENTO)     ');
      Sql.add('  	           FROM    HISTCARTINV                     ');
      Sql.add('                    WHERE  (IDTIPOINVEST = 2)               ');
      Sql.add('                     AND   (IDCARTEIRAINVEST IN (' + ListaCarteiras.Text + ')) ');
      // AL_7 - Ini
      Sql.add('                     AND   (DATAMOVCARTINV  >= TO_DATE('''+DateToStr(dDataIniAnt)+''',''DD/MM/YYYY'')) ');
      Sql.add('                     AND   (DATAMOVCARTINV  <= TO_DATE('''+DateToStr(dDataFimAnt)+''',''DD/MM/YYYY'')) ');
      Sql.add('                    GROUP BY IDCARTEIRAINVEST,IDINVESTIMENTO) ');
      Sql.add('             GROUP BY IDCARTEIRAINVEST,IDINVESTIMENTO))     ');
      // AL_7 - Fin
      Sql.add('    AND (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
      Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
      Sql.add('  ORDER BY                                                  ');
      Sql.add('        CA.DESCCARTINVEST,                                  ');
      Sql.add('        IV.DESCINVESTIMENTO,                                ');
      Sql.add('        H1.IDLOTE                                           ');
      Open;
      First;

      While Not EOF Do
      Begin
         wH2SaldoVlrInvCart := 0;
         wH2SaldoAqui       :=0;
         wH2SaldoMercado    :=0;
         wQtdVendida := 0;
         wTotalBaixa := 0;
         //AL_1
         //AL_2
         //AL_8
         //AL_9
         //AL_10
         OperComum.BuscaTodosSaldosInvestLote(FieldByName('IDCARTEIRAINVEST').AsInteger, 0,
                                              FieldByName('IDINVESTIMENTO').AsInteger,
                                              high(integer), -1,
                                              FieldByName('IDLOTE').AsString,
                                              DateToStr(dDataFimAnt), -1,
                                              wH2SaldoQtde, wH2SaldoVlrInvCart, wH2SaldoAtu,
                                              fNulo, wH2SaldoAqui, fNulo, wH2SaldoMercado,
                                              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo,
                                              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo);

         Result := Result + (wH2SaldoMercado - wH2SaldoAqui);

         Next;
      end;
   End;
End;

function TFrmParamVarMesCarteira.ValidaCampos : boolean;
begin
   Result := True;
   if Trim(edDataIni.Text) = '' then
   begin
    MsgDlg('Data inicial não informada.','Erro',mtError,[mbOK],0);
    Result := False;
    if edDataIni.CanFocus then
       edDataIni.SetFocus;
   end
   else if Trim(edDataFim.Text) = '' then
   begin
    MsgDlg('Data inicial não informada.','Erro',mtError,[mbOK],0);
    Result := False;
    if edDataFim.CanFocus then
       edDataFim.SetFocus;
   end;
end;

procedure TFrmParamVarMesCarteira.sbtnMarcarClick(Sender: TObject);
var x: Integer;
begin
  inherited;
  if sbtnMarcar.Down then
  begin
     for x := 0 to chklstCarteiras.Items.Count -1 do
         chklstCarteiras.Checked[x] := True;
     sbtnMarcar.Caption := 'Desmarcar Todos';
  end
  else
  begin
     for x := 0 to chklstCarteiras.Items.Count -1 do
         chklstCarteiras.Checked[x] := False;
     sbtnMarcar.Caption := 'Marcar Todos';
  end
end;

end.
