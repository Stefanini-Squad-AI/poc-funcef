unit FParamGerCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UBibliotecaInvest,
  UOperacaoInvest, UOperComum, dOperComum, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmParamGerCarteira = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
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
  FrmParamGerCarteira: TFrmParamGerCarteira;

implementation

{$R *.DFM}

uses uSistema, uMensErro, FDmRelatorios;

Procedure TfrmParamGerCarteira.FazQry;
var
   fNulo, fSaldoQtdeInv, fSaldoCar, fSaldoAtu, fSaldoAqui : double;
   wTotalCarteira, wCotacao1, wSoma1, wSoma2, wCotaMoeda : double;
   iCartant, iMoeda : integer;
   QryLocal, QryLocalAux :TwwQuery;
   dDataCotacao: TDateTime;
   bOk : boolean;
Begin
   fNulo := 0;
   iCartAnt := 0;
   // Cria Objetos Locais
   QryLocal              := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';
   QryLocalAux              := TwwQuery.Create(Application);
   QryLocalAux.DatabaseName := 'BaseDados';

   // Busca Moeda Atuarial
   iMoeda := pRPI.MOEDAATU;

   if iMoeda <> 0 then
      OperComum.BuscaCotacaoMoeda(iMoeda, edDataRef.Date, '', wCotaMoeda, dDataCotacao)
   else
      wCotaMoeda := 0;

    With DmRelatorios.qryGerCarteira Do
      Begin
          DmRelatorios.RptGerCarteiraLabel2.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT DISTINCT                                                           ');
          Sql.add('     CA.DESCCARTINVEST, SE.DESCSETOREMISSOR,  IV.DESCINVESTIMENTO,         ');
          Sql.add('     H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, IV.IDEMISSOR, AC.CODTIPOACAO, ');
          Sql.add('     (0) AS SALDOAQUI, (0) AS SALDOATU, (0) AS QTDTITLOTE,                         ');
          Sql.add('     (0) AS SALDOQTDEINVCART, (0) AS SALDOCAR,  (0) AS COTACAOAUX,         ');
          Sql.add('     (0) AS COTACAO, (0) AS TOTCART, (0) AS TOTACAOTIPO, (0) AS TOTACAO    ');
          Sql.add('  FROM                                                                     ');
          Sql.add('     HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV,          ');
          Sql.add('     EMISSOR EM, SETOREMISSOR SE, ACAO AC                         ');
          Sql.add('  WHERE                                                                    ');
          Sql.add('        (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
          Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
          Sql.add('    AND (IV.IDINVESTIMENTO       = AC.IDACAO)               ');
          Sql.add('    AND (H1.IDINVESTIMENTO  IS NOT NULL)                    ');
          Sql.add('    AND (IV.IDEMISSOR            = EM.IDEMISSOR)            ');
          Sql.add('    AND (EM.IDSETOREMISSOR       = SE.CODSETOREMISSOR)      ');

            if Trim(dblcCarteira.Text) <> '' Then
               Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');

          Sql.add('  ORDER BY                                                  ');
          Sql.add('        CA.DESCCARTINVEST,                                  ');
          Sql.add('        SE.DESCSETOREMISSOR,                                ');
          Sql.add('        IV.DESCINVESTIMENTO                                 ');
          Open;
          First;


          While Not EOF Do
          Begin

             bOk := False;
             while not bOk = True do
             begin
                // Busca Saldos do Investimento
                OperComum.CalculaSaldo(FieldByName('IDINVESTIMENTO').AsInteger,
                                    FieldByName('IDCARTEIRAINVEST').AsInteger, '-1',
                                    edDataRef.Date, fSaldoQtdeInv,
                                    fNulo, fNulo, fNulo, fSaldoAtu, fSaldoCar,
                                    fSaldoAqui, fNulo, fNulo, fNulo, fNulo, fNulo,
                                    fNulo, fNulo, fNulo, fNulo, fNulo);
                // Deleta o Registro do DataSet
                if (fSaldoQtdeInv = 0) and (not DmRelatorios.qryGerCarteira.EOF) then
                begin
                   Delete;
                   //Next;
                end
                else
                   bOk := True;
             end;

            if iCartant <> FieldByName('IDCARTEIRAINVEST').AsInteger then begin
               OperComum.SaldosInvCart(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   edDataRef.Date, fNulo, fNulo,
                                   fNulo, fNulo, fNulo, fNulo, wTotalCarteira);
               iCartAnt := FieldByName('IDCARTEIRAINVEST').AsInteger;
            end;

            wCotacao1 := BuscaDadosCotacaoInvest(
                         FieldByName('IDINVESTIMENTO').AsInteger, edDataRef.Date, True, QtdLote);


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

            Edit;

            if QtdLote = 0 then
               FieldByName('QTDTITLOTE').AsFloat  := 1
            else
               FieldByName('QTDTITLOTE').AsFloat  := QtdLote;


            FieldByName('SALDOQTDEINVCART').asFloat := fSaldoQtdeInv;

            if  RdgCustos.ItemIndex = 0 then
            begin
                  FieldByName('SALDOCAR').asFloat   := fSaldoCar * wCotaMoeda;
                  DmRelatorios.LblSaldoAtu.Visible  := False;
                  DmRelatorios.LblSaldoAqui.Visible := False;
                  DmRelatorios.LblSaldoCarr.Visible := True;
                  DmRelatorios.LblCusto.Caption     := 'Custo Carreg.';
            end
            else
              if RdgCustos.ItemIndex = 1 then
              begin
                  FieldByName('SALDOATU').asFloat   := fSaldoAtu * wCotaMoeda;
                  DmRelatorios.LblSaldoAtu.Visible  := True;
                  DmRelatorios.LblSaldoAqui.Visible := False;
                  DmRelatorios.LblSaldoCarr.Visible := False;
                  DmRelatorios.LblCusto.Caption     := 'Custo Atuarial';
              end
              else if RdgCustos.ItemIndex = 2 then
              begin
                  FieldByName('SALDOAQUI').asFloat  := fSaldoAqui;
                  DmRelatorios.LblSaldoAtu.Visible  := False;
                  DmRelatorios.LblSaldoAqui.Visible := True;
                  DmRelatorios.LblSaldoCarr.Visible := False;
                  DmRelatorios.LblCusto.Caption     := 'Custo Aquisição';
              end;

            FieldByName('TOTCART').asFloat       := wTotalCarteira;
            FieldByName('COTACAO').asFloat       := wCotacao1;

               FieldByName('COTACAOAUX').asFloat    := wCotacao1;
            FieldByName('TOTACAO').asFloat       := wSoma1;
            FieldByName('TOTACAOTIPO').asFloat   := wSoma2;
            Post;
            Next;
          End;
          First;
      End;
// Libera Objetos Locais
  QryLocal.Free;
  QryLocalAux.Free;
End;

procedure TFrmParamGerCarteira.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
end;

procedure TFrmParamGerCarteira.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamGerCarteira.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamGerCarteira.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamGerCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

// Função que Busca Cotação de um Investimento numa determinada data.
function TFrmParamGerCarteira.BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
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
