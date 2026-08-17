//******************************************************************************
// Data     : 03/10/2006
// Código   : AL_1
// Pendencia: 22965
// Desc     : Segregação Plano / Patrocinadora (DFM)
//******************************************************************************
// Data     : 05/10/2004
// Motivo   : Acerto na qryCarteira para filtrar IDTIPOINVEST = 2
//******************************************************************************

unit FParamCompCartCust;

interface
                                                           
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UBibliotecaInvest,
  UOperacaoInvest, UOperComum, dOperComum, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamCompCartCust = class(TfrmOkCancelar)
    qryCarteira: TwwQuery;
    Label2: TLabel;
    Label4: TLabel;
    edDataRef: TCMDateTimePicker;
    dblcCarteira: TwwDBLookupCombo;
    RdgCustos: TRadioGroup;
    rgbCotMercado: TRadioGroup;
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
    function BuscaUltimaCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): Double;
  public
    { Public declarations }
  end;

var
  frmParamCompCartCust: TfrmParamCompCartCust;

implementation

{$R *.DFM}

uses uSistema, uMensErro, FDmRelatorios, FDmRelatorio;

Procedure TfrmParamCompCartCust.FazQry;
var
   fNulo, fSaldoQtdeInv, fSaldoCar, fSaldoAtu, fSaldoAqui : double;
   wTotalCarteira, wCotacao1, wSoma1, wSoma2, wCotaMoeda  : double;
   wSaldoLib, wSaldoBloq : double;
   iCartAnt1, iCartant, iInvestAnt, iMoeda : integer;
   QryLocal, QryLocalAux, QryLocalAux1, QryLocalAux2, qryTmp :TwwQuery;
   dDataCotacao: TDateTime;
   dNovaDataRef : TDateTime;
Begin
    fNulo      := 0;
    iCartAnt1  := 0;
    iCartAnt   := 0;
    iInvestAnt := 0;
    wCotacao1  := 0;
// Cria Objetos Locais
    QryLocal                  := TwwQuery.Create(Application);
    QryLocal.DatabaseName     := 'BaseDados';
    QryLocalAux1              := TwwQuery.Create(Application);
    QryLocalAux1.DatabaseName := 'BaseDados';
    QryLocalAux               := TwwQuery.Create(Application);
    QryLocalAux.DatabaseName  := 'BaseDados';
    QryLocalAux2              := TwwQuery.Create(Application);
    QryLocalAux2.DatabaseName := 'BaseDados';

// Busca Moeda Atuarial
  FazQuery(QryLocal, 'SELECT * FROM PARAMINVEST');
  iMoeda := QryLocal.FieldByName('MOEDAATU').AsInteger;
  if iMoeda <> 0 then
    OperComum.BuscaCotacaoMoeda(iMoeda, edDataRef.Date, '', wCotaMoeda, dDataCotacao)
  else
    wCotaMoeda := 0;

    With DtmRelatorio.qryCompCartCust Do
      Begin
          DtmRelatorio.ppLabel82.Caption    := edDataRef.Text;
          Close;
          Filter   := '';
          Filtered := False;
          Sql.Clear;
          Sql.add('SELECT DISTINCT CA.DESCCARTINVEST,  IV.DESCINVESTIMENTO, CUS.SGLCUSTODIANTE,');
          Sql.add('               H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.IDLOTE, IV.IDEMISSOR, AC.CODTIPOACAO,');
          Sql.add('               MB.IDMOTIVOBLOQUEIO,  AB.SIGLAACAOBOLSA,');
          Sql.add('               DECODE(HC.IDMOTIVOBLOQUEIO, -1, '#39' '#39', MB.DESCMOTBLOQ) DESCMOTBLOQ,');
          Sql.add('               HC.IDCUSTODIANTE, ');
          Sql.add('               (0) AS SALDOAQUI, (0) AS SALDOATU, (0) AS QTDTITLOTE,');
          Sql.add('               (0) AS COTACAOAUX,');
          Sql.add('               (0) AS SALDOQTDEINVCART, (0) AS SALDOCAR,');
          Sql.add('               (0) AS COTACAO, (0) AS TOTCART, (0) AS TOTACAOTIPO, (0) AS TOTACAO,');
          Sql.add('               (0) AS TOTLIBERADO, (0) AS TOTBLOQUEADO, (0) AS PUCUSTO, (0) AS TOTLIBBLOQ,');
          Sql.add('               (1) AS VISIVEL, (0) AS VALCUSTO, (0) AS VALMERCADO  ');
          Sql.add('FROM   HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV,');
          Sql.add('       EMISSOR EM, ACAO AC, HISTCUSTODIA HC,');
          Sql.add('       MOTIVOBLOQUEIO MB, ACOESXBOLSA AB, BOLSAVALORES BV,');
          Sql.add('       PARAMINVEST PI, CUSTODIANTE CUS');
          Sql.add('WHERE (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND');
          Sql.add('      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND');
          Sql.add('      (IV.IDINVESTIMENTO       = AC.IDACAO) AND');
          Sql.add('      (IV.IDEMISSOR            = EM.IDEMISSOR) AND');
          Sql.add('      (H1.IDINVESTIMENTO  IS NOT NULL)  AND');
          Sql.add('      (HC.IDCARTEIRAINVEST(+) = H1.IDCARTEIRAINVEST) AND');
          Sql.add('      (HC.IDINVESTIMENTO  (+) = H1.IDINVESTIMENTO  ) AND');
          Sql.add('      ((HC.IDLOTE = H1.IDLOTE) OR (HC.IDLOTE IS NULL AND H1.IDLOTE IS NULL)) AND');
          Sql.add('      (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)) AND');
          Sql.add('      (CUS.IDCUSTODIANTE(+)   = HC.IDCUSTODIANTE) AND');
          Sql.add('      (BV.IDCUSTODIANTE(+) = CUS.IDCUSTODIANTE) AND');
          Sql.add('      (AB.IDACAO = H1.IDINVESTIMENTO) AND');
          Sql.add('      (AC.IDACAO = AB.IDACAO) AND');
          Sql.add('      (AB.IDBOLSAVALORES(+) = PI.IDBVSP)');
          if Trim(dblcCarteira.Text) <> '' Then
             Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');
          Sql.add('ORDER BY CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, CUS.SGLCUSTODIANTE, DECODE(HC.IDMOTIVOBLOQUEIO, -1, '#39' '#39', MB.DESCMOTBLOQ)');
          Open;

          While Not EOF Do Begin

            wSoma1 := 0; wSoma2 := 0;

            if iCartant1 <> FieldByName('IDCARTEIRAINVEST').AsInteger then begin
               OperComum.SaldosInvCart(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   edDataRef.Date, fNulo, fNulo,
                                   fNulo, fNulo, fNulo, fNulo, wTotalCarteira);
               iCartAnt1 := FieldByName('IDCARTEIRAINVEST').AsInteger;
            end;

            case rgbCotMercado.ItemIndex Of
              0 :
                wCotacao1 := OperComum.BuscaCotacaoInvest(FieldByName('IDINVESTIMENTO').AsInteger,
                                                          edDataRef.Date, True);
              1 :
                wCotacao1 := OperComum.BuscaCotacaoAcao(FieldByName('IDINVESTIMENTO').AsInteger,
                                                          edDataRef.Date, True);

            end;
            qryTmp := TwwQuery.Create(Application);
            try
              qryTmp.DatabaseName := DtmRelatorio.qryCompCartCust.DatabaseName;
              qryTmp.Close;
              qryTmp.SQL.Clear;
              qryTmp.SQL.Add('SELECT MAX(DATAMOVCARTINV) AS DATAMOVCARTINV');
              qryTmp.SQL.Add('FROM HISTCARTINV');
              qryTmp.SQL.Add('WHERE');
              qryTmp.SQL.Add('  SALDOQTDEINVCART > 0 AND');
              qryTmp.SQL.Add('  IDCARTEIRAINVEST = :P_IDCARTEIRAINVEST AND');
              qryTmp.SQL.Add('  IDINVESTIMENTO   = :P_IDINVESTIMENTO');
              qryTmp.ParamByName('P_IDCARTEIRAINVEST').AsInteger := FieldByName('IDCARTEIRAINVEST').AsInteger;
              qryTmp.ParamByName('P_IDINVESTIMENTO').AsInteger := FieldByName('IDINVESTIMENTO').AsInteger;
              qryTmp.Open;
              dNovaDataRef := qryTmp.FieldByName('DATAMOVCARTINV').AsDateTime;
            finally
              qryTmp.Close;
              qryTmp.Free;
            end;
            if dNovaDataRef > edDataRef.Date Then
               dNovaDataRef := edDataRef.Date;
            OperComum.CalculaSaldo(FieldByName('IDINVESTIMENTO').AsInteger,
                                        FieldByName('IDCARTEIRAINVEST').AsInteger, '-1',
                                        dNovaDataRef, fSaldoQtdeInv,
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


            if ((iCartant <> FieldByName('IDCARTEIRAINVEST').AsInteger)
                or (iInvestAnt <> FieldByName('IDINVESTIMENTO').AsInteger)) then

            begin
               iCartAnt   := FieldByName('IDCARTEIRAINVEST').AsInteger;
               iInvestAnt := FieldByName('IDINVESTIMENTO').AsInteger;

            end;

            //AL_1
            OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro,
                           FieldByName('IDCARTEIRAINVEST').AsInteger,
                           FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                           FieldByName('IDCUSTODIANTE').AsInteger,
                           FieldByName('IDMOTIVOBLOQUEIO').AsInteger,
                           FieldByName('IDLOTE').AsString, edDataRef.Date,
                           wSaldoBloq, wSaldoLib);

            Edit;

            if FieldByName('IDMOTIVOBLOQUEIO').AsFloat = -1 Then
               FieldByName('TOTLIBBLOQ').AsFloat := wSaldoLib
            else
               FieldByName('TOTLIBBLOQ').AsFloat := wSaldoBloq;

            if QtdLote = 0 then
               FieldByName('QTDTITLOTE').AsFloat  := 1
            else
               FieldByName('QTDTITLOTE').AsFloat  := QtdLote;


            FieldByName('SALDOQTDEINVCART').asFloat := fSaldoQtdeInv;

            if  RdgCustos.ItemIndex = 0 then
            begin
                  DtmRelatorio.iTipoSaldo           := 0;
                  FieldByName('SALDOCAR').asFloat   := fSaldoCar * wCotaMoeda; {wcotamoeda}
                  FieldByName('PUCUSTO').asFloat    := wCotaMoeda;
                  DtmRelatorio.LblSaldoAtu.Visible  := False;
                  DtmRelatorio.LblSaldoAqui.Visible := False;
                  DtmRelatorio.LblSaldoCarr.Visible := True;
                  DtmRelatorio.LblCusto.Caption     := 'Carregamento';
            end
            else
              if RdgCustos.ItemIndex = 1 then
              begin
                  DtmRelatorio.iTipoSaldo           := 1;
                  FieldByName('SALDOATU').asFloat   := fSaldoAtu * wCotaMoeda; {wCotaMoeda}
                  FieldByName('PUCUSTO').asFloat    := wCotaMoeda;
                  DtmRelatorio.LblSaldoAtu.Visible  := True;
                  DtmRelatorio.LblSaldoAqui.Visible := False;
                  DtmRelatorio.LblSaldoCarr.Visible := False;
                  DtmRelatorio.LblCusto.Caption     := 'Atuarial';
              end
              else if RdgCustos.ItemIndex = 2 then
              begin
                  DtmRelatorio.iTipoSaldo           := 2;
                  FieldByName('SALDOAQUI').asFloat  := fSaldoAqui; {}
                  if FieldByName('SALDOQTDEINVCART').asFloat <> 0 then
                    FieldByName('PUCUSTO').asFloat    := fSaldoAqui / FieldByName('SALDOQTDEINVCART').asFloat
                  else
                    FieldByName('PUCUSTO').asFloat    := 0;
                  DtmRelatorio.LblSaldoAtu.Visible  := False;
                  DtmRelatorio.LblSaldoAqui.Visible := True;
                  DtmRelatorio.LblSaldoCarr.Visible := False;
                  DtmRelatorio.LblCusto.Caption     := 'Aquisição';
              end;

            FieldByName('TOTCART').asFloat       := wTotalCarteira;
            FieldByName('COTACAO').asFloat       := wCotacao1;

            FieldByName('COTACAOAUX').asFloat    := wCotacao1;
            FieldByName('TOTACAO').asFloat       := wSoma1;
            FieldByName('TOTACAOTIPO').asFloat   := wSoma2;

            FieldByName('VALMERCADO').AsFloat := ((FieldByName('COTACAO').AsFloat
                                                 * FieldByName('TOTLIBBLOQ').AsFloat)
                                                 / FieldByName('QTDTITLOTE').AsFloat);
            Post;
            Next;
          End;
          First;
          Filtered := True;
          Filter   := 'TOTLIBBLOQ > 0 ';
      End;
// Libera Objetos Locais
  QryLocal.Free;
  QryLocalAux.Free;
  QryLocalAux1.Free;
End;

procedure TfrmParamCompCartCust.FormCreate(Sender: TObject);
begin
  inherited;
   edDataRef.Date := Date;
end;

procedure TfrmParamCompCartCust.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TfrmParamCompCartCust.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TfrmParamCompCartCust.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TfrmParamCompCartCust.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

// Função que Busca Cotação de um Investimento numa determinada data.
function TfrmParamCompCartCust.BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
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

function TfrmParamCompCartCust.BuscaUltimaCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): Double;
Var
  qryTmp : TwwQuery;
  dData  : TDateTime;
begin
  qryTmp := TwwQuery.Create(Application);
  Try
    qryTmp.DataBaseName := 'BaseDados';
//---Busca a ultima data da cotação
    qryTmp.Close;
    qryTmp.SQL.Clear;
    qryTmp.SQL.Add('SELECT MAX(DATACOTAACAO) As  DATACOTAACAO');
    qryTmp.SQL.Add('FROM COTACAOACAO                        ');
    qryTmp.SQL.Add('WHERE 	(IDACAO = '''+IntToStr(iInvestimento)+''') AND');
    qryTmp.SQL.Add('(DATACOTAACAO <= To_Date('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
    qryTmp.Open;
    If Not qryTmp.FieldByName('DATACOTAACAO').IsNull Then
       dData := qryTmp.FieldByName('DATACOTAACAO').AsDateTime
    Else
       dData := dDataRef;
//---Busca a cotação
    qryTmp.Close;
    qryTmp.SQL.Clear;
    qryTmp.SQL.Add('SELECT VOLNEGOCIADO, VLRMEDIA, QTDELOTE ');
    qryTmp.SQL.Add('FROM COTACAOACAO                        ');
    qryTmp.SQL.Add('WHERE 	(IDACAO = '''+IntToStr(iInvestimento)+''') AND');
    qryTmp.SQL.Add('(DATACOTAACAO = To_Date('''+DateToStr(dData)+''',''DD/MM/YYYY'')) ');
    qryTmp.SQL.Add('ORDER BY VOLNEGOCIADO DESC ');
    qryTmp.Open;

// Caso Utilize Lote Faz Calculo
    If UsaLote = True Then Begin
      If qryTmp.FieldByName('QTDELOTE').AsFloat <> 0 then
         Result := (qryTmp.FieldByName('VLRMEDIA').AsFloat /
                   qryTmp.FieldByName('QTDELOTE').AsFloat)

      Else
         Result := qryTmp.FieldByName('VLRMEDIA').AsFloat;
    End Else Begin
// Caso Não Utilize Lote. Guarda
      Result := qryTmp.FieldByName('VLRMEDIA').AsFloat;
    End;
    If qryTmp.FieldByName('QTDELOTE').AsFloat <> 0 Then
       QtdLote := qryTmp.FieldByName('QTDELOTE').AsFloat
    Else
       QtdLote := 1;

    qryTmp.Close;
  Finally
    qryTmp.Free;
  end;
end;

end.

