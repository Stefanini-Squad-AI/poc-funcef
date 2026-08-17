//******************************************************************************
// Data     : 03/10/2006
// Código   : AL_1
// Pendencia: 22965
// Desc     : Segregação Plano / Patrocinadora (DFM)
//******************************************************************************
unit FParamGerCartCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  UBibliotecaInvest,
  UOperacaoInvest, UOperComum, dOperComum, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmParamGerCartCust = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    RgCotacao: TRadioGroup;
    RdgCustos: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    UsaLote : boolean;
    QtdLote : double;
    Procedure FazQry;
    function BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;
  public
    { Public declarations }
  end;

var
  FrmParamGerCartCust: TFrmParamGerCartCust;

implementation

{$R *.DFM}

uses uSistema, uMensErro, FDmRelatorios, FDmRelatorio;

Procedure TfrmParamGerCartCust.FazQry;
var
   fNulo, fSaldoQtdeInv, fSaldoCar, fSaldoAtu, fSaldoAqui : double;
   wTotalCarteira, wCotacao1, wSoma1, wSoma2, wCotaMoeda  : double;
   wSaldoLiberado, wSaldoBloqueado, wSaldoLib, wSaldoBloq : double;
   iCartAnt1, iCartant, iInvestAnt, iMoeda : integer;
   QryLocal, QryLocalAux, QryLocalAux1 :TwwQuery;
   dDataCotacao: TDateTime;
   bCalculaLiberado: boolean;
Begin
    fNulo      := 0;
    iCartAnt1  := 0;
    iCartAnt   := 0;
    iInvestAnt := 0;
    wSaldoLiberado := 0;
// Cria Objetos Locais
    QryLocal                  := TwwQuery.Create(Application);
    QryLocal.DatabaseName     := 'BaseDados';
    QryLocalAux1              := TwwQuery.Create(Application);
    QryLocalAux1.DatabaseName := 'BaseDados';
    QryLocalAux               := TwwQuery.Create(Application);
    QryLocalAux.DatabaseName  := 'BaseDados';

// Busca Moeda Atuarial
  FazQuery(QryLocal, 'SELECT * FROM PARAMINVEST');
  iMoeda := QryLocal.FieldByName('MOEDAATU').AsInteger;
  if iMoeda <> 0 then
    OperComum.BuscaCotacaoMoeda(iMoeda, edDataRef.Date, '', wCotaMoeda, dDataCotacao)
  else
    wCotaMoeda := 0;

    With DtmRelatorio.qryGerCartCust Do
      Begin
          DtmRelatorio.RptGerCarteiraLabel2.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;

          Sql.add('SELECT DISTINCT                                                     ');
          Sql.add('   H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO,                          ');
          Sql.add('   IV.DESCINVESTIMENTO,IV.IDEMISSOR,                                ');
          Sql.add('   CA.DESCCARTINVEST,                                               ');
          Sql.add('   SE.DESCSETOREMISSOR,                                             ');
          Sql.add('   AC.CODTIPOACAO,                                                  ');
          Sql.add('   AB.SIGLAACAOBOLSA,                                               ');
          Sql.add('   MB.IDMOTIVOBLOQUEIO, MB.SIGLAMOTBLOQ,                            ');
          Sql.add('  (0) AS SALDOAQUI,        (0) AS SALDOATU,     (0) AS QTDTITLOTE,  ');
          Sql.add('  (0) AS SALDOQTDEINVCART, (0) AS SALDOCAR,     (0) AS COTACAOAUX,  ');
          Sql.add('  (0) AS COTACAO,          (0) AS TOTCART,      (0) AS TOTACAOTIPO, ');
          Sql.add('  (0) AS TOTLIBERADO,      (0) AS TOTBLOQUEADO, (1) AS VISIVEL,     ');
          Sql.add('  (0) AS TOTACAO                                                    ');
          Sql.add('FROM                                                                ');
          Sql.add('   HISTCARTINV H1,                                               ');
          Sql.add('   CARTEIRAINVEST CA,                                            ');
          Sql.add('   INVESTIMENTO IV,                                              ');
          Sql.add('   ACAO AC,                                                      ');
          Sql.add('   EMISSOR EM,                                                   ');
          Sql.add('   SETOREMISSOR SE,                                              ');
          Sql.add('   HISTCUSTODIA HC,                                              ');
          Sql.add('   MOTIVOBLOQUEIO MB,                                            ');
          Sql.add('   ACOESXBOLSA AB                                                   ');
          Sql.add('WHERE                                                               ');
          Sql.add('       (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)              ');
          Sql.add('   AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)                ');
          Sql.add('   AND (IV.IDINVESTIMENTO       = AC.IDACAO)                        ');
          Sql.add('   AND (IV.IDEMISSOR            = EM.IDEMISSOR)                     ');
          Sql.add('   AND (EM.IDSETOREMISSOR       = SE.CODSETOREMISSOR)               ');
          Sql.add('   AND (AC.IDACAO               = AB.IDACAO)                        ');
          Sql.add('   AND (HC.IDCARTEIRAINVEST(+)  = H1.IDCARTEIRAINVEST)              ');
          Sql.add('   AND (HC.IDINVESTIMENTO(+)    = H1.IDINVESTIMENTO)                ');
          Sql.add('   AND (HC.IDMOTIVOBLOQUEIO     = MB.IDMOTIVOBLOQUEIO(+))           ');
          Sql.add('   AND (H1.IDINVESTIMENTO  IS NOT NULL)                             ');
          Sql.add('   AND (HC.IDMOTIVOBLOQUEIO(+) <> -1)                               ');

            if Trim(dblcCarteira.Text) <> '' Then
               Sql.add('  AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')     ');

          Sql.add('  ORDER BY                                                          ');
          Sql.add('        CA.DESCCARTINVEST,                                          ');
          Sql.add('        SE.DESCSETOREMISSOR,                                        ');
          Sql.add('        IV.DESCINVESTIMENTO,                                        ');
          Sql.add('        MB.SIGLAMOTBLOQ                                             ');
          Open;
          First;

          While Not EOF Do Begin

            wSoma1 := 0; wSoma2 := 0;

            if iCartant1 <> FieldByName('IDCARTEIRAINVEST').AsInteger then begin
               OperComum.SaldosInvCart(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   edDataRef.Date, fNulo, fNulo,
                                   fNulo, fNulo, fNulo, fNulo, wTotalCarteira);
               iCartAnt1 := FieldByName('IDCARTEIRAINVEST').AsInteger;
            end;


// Cotacao Por Lote ou Investimento
            If RgCotacao.ItemIndex = 0 Then  begin
              UsaLote := False;
              DtmRelatorio.LblLote.Caption := 'Cotação por Lote';
            end Else begin
              UsaLote := True;
              DtmRelatorio.LblLote.Caption := 'Cotação por Investimento';
            end;

            wCotacao1 := BuscaDadosCotacaoInvest(
                         FieldByName('IDINVESTIMENTO').AsInteger, edDataRef.Date, UsaLote, QtdLote);
//          Busca Saldos do Investimento
            OperComum.CalculaSaldo(FieldByName('IDINVESTIMENTO').AsInteger,
                                        FieldByName('IDCARTEIRAINVEST').AsInteger, '-1',
                                        edDataRef.Date, fSaldoQtdeInv,
                                        fNulo, fNulo, fNulo, fSaldoAtu, fSaldoCar,
                                        fSaldoAqui, fNulo, fNulo, fNulo, fNulo, fNulo,
                                        fNulo, fNulo, fNulo, fNulo, fNulo);

//          Busca Tipos de Ação emitidas pelo Emissor
            FazQuery(QryLocal,
              'SELECT  SUM(VPE.VLRPARAMEMISSOR) AS TOTAL '+
              'FROM    VALPARAMXEMISSOR VPE, '+

              '(SELECT DISTINCT(TA.IDPARAMEMISSOR)                      '+
              ' FROM   ACAO A, TIPOACAO TA, INVESTIMENTO I, EMISSOR E   '+
              ' WHERE  (A.CODTIPOACAO      = TA.CODTIPOACAO)            '+
              ' AND    (I.IDINVESTIMENTO   = A.IDACAO)                  '+
              ' AND    (E.IDEMISSOR        = I.IDEMISSOR)               '+
              ' AND    (E.IDEMISSOR        = '''+ FieldByName('IDEMISSOR').AsString+''')) PARAMSEL  '+

              ' WHERE  (VPE.IDEMISSOR = '''+ FieldByName('IDEMISSOR').AsString+''') '+
              '         AND	(VPE.IDPARAMEMISSOR   =PARAMSEL.IDPARAMEMISSOR)  '+
              '      	AND (VPE.DATAREFPREMISSOR = '+
              '      	       (SELECT MAX(VP1.DATAREFPREMISSOR) '+
              '      	        FROM   VALPARAMXEMISSOR VP1 '+
              '         	WHERE (VP1.IDEMISSOR =VPE.IDEMISSOR) AND '+
              '         	(VP1.IDPARAMEMISSOR   =VPE.IDPARAMEMISSOR) AND '+
              '                 (VP1.DATAREFPREMISSOR  <= TO_DATE( '''+edDataRef.Text+''',''DD/MM/YYYY'')))) ');
            wSoma1 := QryLocal.FieldByName('TOTAL').AsFloat;

            FazQuery(QryLocal,
              'SELECT  VPE.VLRPARAMEMISSOR '+
              'FROM    VALPARAMXEMISSOR VPE, ACAO AC, TIPOACAO TP '+
              'WHERE  (VPE.IDEMISSOR = '''+ FieldByName('IDEMISSOR').AsString+''') '+
              '      	AND (VPE.DATAREFPREMISSOR = '+
              '      	       (SELECT MAX(VP1.DATAREFPREMISSOR) '+
              '      	        FROM   VALPARAMXEMISSOR VP1 '+
              '         	WHERE (VP1.IDEMISSOR =VPE.IDEMISSOR) AND '+
              '         	(VP1.IDPARAMEMISSOR   =VPE.IDPARAMEMISSOR) AND '+
              '                 (VP1.DATAREFPREMISSOR  <= TO_DATE( '''+edDataRef.Text+''',''DD/MM/YYYY'')))) '+
              '        AND (AC.IDACAO = '''+ FieldByName('IDINVESTIMENTO').AsString+''') '+
              '        AND (AC.CODTIPOACAO = TP.CODTIPOACAO) '+
              '        AND (TP.IDPARAMEMISSOR = VPE.IDPARAMEMISSOR)');

            wSoma2 := QryLocal.FieldByName('VLRPARAMEMISSOR').AsFloat;

// Busca Saldos Liberado e Bloqueado de Custodiantes

            wSaldoBloqueado := 0;

            if (trim(InttoStr(iCartant)) + trim(InttoStr(iInvestAnt))) <>
               (FieldByName('IDCARTEIRAINVEST').AsString +
                FieldByName('IDINVESTIMENTO').AsString) then begin

               // Busca Lotes da Carteira/Investimento
               QryLocalAux1.Close;
               QryLocalAux1.Sql.Clear;
               QryLocalAux1.Sql.add(' SELECT DISTINCT IDLOTE              ');
               QryLocalAux1.Sql.add(' FROM HISTCARTINV                                   ');
               QryLocalAux1.Sql.add(' WHERE (IDCARTEIRAINVEST = '''+ FieldByName('IDCARTEIRAINVEST').AsString+''')  ');
               QryLocalAux1.Sql.add('   AND (IDINVESTIMENTO   = '''+ FieldByName('IDINVESTIMENTO').AsString+''')  ');
               QryLocalAux1.Sql.add(' ORDER BY IDLOTE                  ');
               QryLocalAux1.Open;

               bCalculaLiberado := true;
               wSaldoLiberado   := 0;
               iCartAnt   := FieldByName('IDCARTEIRAINVEST').AsInteger;
               iInvestAnt := FieldByName('IDINVESTIMENTO').AsInteger;

            end else
               bCalculaLiberado := false;

            QryLocalAux1.First;
            While Not QryLocalAux1.Eof Do Begin

              FazQuery(QryLocalAux, 'SELECT IDCUSTODIANTE '+
                                    'FROM CUSTODIANTE ');
              While Not QryLocalAux.Eof Do Begin

                //AL_1
                if bCalculaLiberado then begin
                     OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro,
                                    FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                                    QryLocalAux.FieldByName('IDCUSTODIANTE').AsInteger, -1,
                                    QryLocalAux1.FieldByName('IDLOTE').AsString, edDataRef.Date,
                                    wSaldoBloq, wSaldoLib);
                     wSaldoLiberado := wSaldoLiberado + wSaldoLib;
                end;

                //AL_1
                  OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro, 
                                 FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                                 QryLocalAux.FieldByName('IDCUSTODIANTE').AsInteger,
                                 FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                                 QryLocalAux1.FieldByName('IDLOTE').AsString, edDataRef.Date,
                                 wSaldoBloq, wSaldoLib);
                  wSaldoBloqueado := wSaldoBloqueado + wSaldoBloq;

                  QryLocalAux.Next;
               End;

               QryLocalAux1.Next;
            End;

            Edit;

            if QtdLote = 0 then
               FieldByName('QTDTITLOTE').AsFloat  := 1
            else
               FieldByName('QTDTITLOTE').AsFloat  := QtdLote;


            FieldByName('SALDOQTDEINVCART').asFloat := fSaldoQtdeInv;

            if  RdgCustos.ItemIndex = 0 then
            begin
                  DtmRelatorio.iTipoSaldo           := 0;
                  FieldByName('SALDOCAR').asFloat   := fSaldoCar * wCotaMoeda;
                  DtmRelatorio.LblSaldoAtu.Visible  := False;
                  DtmRelatorio.LblSaldoAqui.Visible := False;
                  DtmRelatorio.LblSaldoCarr.Visible := True;
                  DtmRelatorio.LblCusto.Caption     := 'Custo Carreg.';
            end
            else
              if RdgCustos.ItemIndex = 1 then
              begin
                  DtmRelatorio.iTipoSaldo           := 1;
                  FieldByName('SALDOATU').asFloat   := fSaldoAtu * wCotaMoeda;
                  DtmRelatorio.LblSaldoAtu.Visible  := True;
                  DtmRelatorio.LblSaldoAqui.Visible := False;
                  DtmRelatorio.LblSaldoCarr.Visible := False;
                  DtmRelatorio.LblCusto.Caption     := 'Custo Atuarial';
              end
              else if RdgCustos.ItemIndex = 2 then
              begin
                  DtmRelatorio.iTipoSaldo           := 2;
                  FieldByName('SALDOAQUI').asFloat  := fSaldoAqui;
                  DtmRelatorio.LblSaldoAtu.Visible  := False;
                  DtmRelatorio.LblSaldoAqui.Visible := True;
                  DtmRelatorio.LblSaldoCarr.Visible := False;
                  DtmRelatorio.LblCusto.Caption     := 'Custo Aquisição';
              end;

            FieldByName('TOTCART').asFloat       := wTotalCarteira;
            FieldByName('COTACAO').asFloat       := wCotacao1;

            if RgCotacao.ItemIndex = 0 then
               FieldByName('COTACAOAUX').asFloat    := wCotacao1/QtdLote
            else
               FieldByName('COTACAOAUX').asFloat    := wCotacao1;
            FieldByName('TOTACAO').asFloat       := wSoma1;
            FieldByName('TOTACAOTIPO').asFloat   := wSoma2;
            FieldByName('TOTLIBERADO').asFloat   := wSaldoLiberado;
            FieldByName('TOTBLOQUEADO').asFloat  := wSaldoBloqueado;
            if bCalculaLiberado then
               FieldByName('VISIVEL').asInteger  := 1
            else
               FieldByName('VISIVEL').asInteger  := 0;
            Post;
            Next;
          End;
          First;
      End;
// Libera Objetos Locais
  QryLocal.Free;
  QryLocalAux.Free;
  QryLocalAux1.Free;
End;

procedure TFrmParamGerCartCust.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmParamGerCartCust.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamGerCartCust.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamGerCartCust.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamGerCartCust.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

// Função que Busca Cotação de um Investimento numa determinada data.
function TFrmParamGerCartCust.BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;
var
   QryLocal  :TwwQuery;
begin
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,
      'SELECT DATACOTACAO, VLRCONTABIL, QTDTITLOTE '+
      'FROM COTACAOINVEST '+
      'WHERE 	(IDINVESTIMENTO = '''+ InttoStr(iInvestimento)+''') AND '+
      '      	(DATACOTACAO <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
      'ORDER BY DATACOTACAO DESC ');

// Caso Utilize Lote Faz Calculo
    If UsaLote = True Then Begin
      If QryLocal.FieldByName('QTDTITLOTE').AsFloat <> 0 then
         Result := (QryLocal.FieldByName('VLRCONTABIL').AsFloat /
                   QryLocal.FieldByName('QTDTITLOTE').AsFloat)

      Else
         Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    End Else Begin
// Caso Não Utilize Lote. Guarda
      Result := QryLocal.FieldByName('VLRCONTABIL').AsFloat;
    End;
    If QryLocal.FieldByName('QTDTITLOTE').AsFloat <> 0 Then
       QtdLote := QryLocal.FieldByName('QTDTITLOTE').AsFloat
    Else
       QtdLote := 1;
    QryLocal.Free;
end;

end.
