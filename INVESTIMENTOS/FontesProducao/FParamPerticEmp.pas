unit FParamPerticEmp;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, UOperacaoInvest, UOperComum,
  dOperComum, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamPerticEmp = class(TfrmOkCancelar)
    Label1: TLabel;
    txtData: TCMDateTimePicker;
    qryData: TwwQuery;
    qryDataDATAMOVCARTINV: TDateTimeField;
    QryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
                              UsaLote:Boolean; var QtdLote : double): double;  
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmParamPerticEmp: TfrmParamPerticEmp;
  wSoma, fTSaldoVlrMerc, fSaldoMercado, wCotacao1, QtdLote   : double;
  QryLocal : TwwQuery;

implementation

uses  DMRelatoriosClaudio, UBibliotecaInvest, USistema, UMensErro;

{$R *.DFM}

procedure TfrmParamPerticEmp.bbtnConfirmarClick(Sender: TObject);
Var
  wStrMes:String;
begin
    QryLocal              := TwwQuery.Create(Application);
    QryLocal.DatabaseName := 'BaseDados';

     inherited;
     // Acha data menor ou igual a data digitada
     qryData.Close;
     if Trim(txtData.Text) <> '' then
        qryData.Params[0].Value := txtData.Date
     else
        qryData.Params[0].Value := '31/12/5000';

     qryData.Open;
     txtData.Text := qryData.FieldByName('DATAMOVCARTINV').AsString;

     DTMRelatoriosClaudio.LblDataEnq.Caption := 'DATA: ' + txtData.Text;
     With DTMRelatoriosClaudio.qryParticEmp Do Begin
       SQL.Clear;

       SQL.Add('SELECT DISTINCT H.SALDOQTDEINVCART, H.DATAMOVCARTINV,       ');
       SQL.Add('	     SL.TOT, PI.PERCPARTICEMPR, P.NOME,                   ');
       SQL.Add('       PI.PERCPARTICRECUR, (0) AS COTACAO,                  ');
       SQL.Add('       H.IDHISTCARTINV,    I.DESCINVESTIMENTO,              ');
       SQL.Add('       C.DESCCARTINVEST,   SL.IDEMISSOR, (0) AS QTDTITLOTE, ');
       SQL.Add('       H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, (0) AS TOTACAO ');

       SQL.Add('FROM HISTCARTINV H, CARTEIRAINVEST C, ACAO A, TIPOACAO TA,  ');
       SQL.Add('     PESSOA P, INVESTIMENTO I,                              ');

       SQL.Add('     (SELECT PERCPARTICEMPR, PERCPARTICRECUR FROM PARAMINVEST) PI, ');

       SQL.Add('	   (SELECT  SUM(PE.VLRPARAMEMISSOR) AS TOT, PE.IDEMISSOR  ');
       SQL.Add('	    FROM VALPARAMXEMISSOR PE, PESSOA P                    ');
       SQL.Add('	    WHERE P.IDPESSOA=IDEMISSOR AND                        ');
       SQL.Add('	      	 IDPARAMEMISSOR IN                               ');
       SQL.Add('		         (SELECT IDPARAMEMISSOR FROM TIPOACAO)         ');
       SQL.Add('	             GROUP BY PE.IDEMISSOR) SL                    ');

       SQL.Add('WHERE (I.IDINVESTIMENTO   =  H.IDINVESTIMENTO   AND  ');
       SQL.Add('	     P.IDPESSOA         =  I.IDEMISSOR        AND  ');
       SQL.Add('	     C.IDCARTEIRAINVEST =  H.IDCARTEIRAINVEST AND  ');
       SQL.Add('	     A.IDACAO           =  H.IDINVESTIMENTO   AND  ');
       SQL.Add('	     TA.CODTIPOACAO     =  A.CODTIPOACAO      AND  ');
       SQL.Add('	     I.IDEMISSOR        =  SL.IDEMISSOR(+))   AND  ');
       SQL.Add('	     (H.SALDOQTDEINVCART <> 0) AND                 ');

       SQL.Add('	IDHISTCARTINV = (SELECT MAX(IDHISTCARTINV) FROM HISTCARTINV H3      ');
       SQL.Add('	                 WHERE H3.DATAMOVCARTINV    = H.DATAMOVCARTINV   AND');
       SQL.Add('			                 H3.IDCARTEIRAINVEST  = H.IDCARTEIRAINVEST AND');
       SQL.Add('			                 H3.IDINVESTIMENTO    = H.IDINVESTIMENTO)  AND');

       SQL.Add('	DATAMOVCARTINV = (SELECT MAX(DATAMOVCARTINV) FROM HISTCARTINV H2      ');
       SQL.Add('			            WHERE H2.IDCARTEIRAINVEST = H.IDCARTEIRAINVEST  AND ');
       SQL.Add('			                  H2.IDINVESTIMENTO   = H.IDINVESTIMENTO)       ');
       SQL.Add('GROUP BY P.NOME,             H.IDHISTCARTINV,  C.DESCCARTINVEST, SL.TOT, ');
       SQL.Add('	       SL.IDEMISSOR,       H.IDCARTEIRAINVEST, H.IDINVESTIMENTO,       ');
       SQL.Add('	       I.DESCINVESTIMENTO, PI.PERCPARTICEMPR,  PI.PERCPARTICRECUR,     ');
       SQL.Add('	       H.SALDOQTDEINVCART, H.DATAMOVCARTINV                      ');

       Open;
       First;
       if IsEmpty then Begin
          Beep;
          Exit;
       End;
       While Not EOF Do Begin
// Busca Tipos de Ação emitidas pelo Emissor
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
               '                 (VP1.DATAREFPREMISSOR  <= TO_DATE( '''+txtData.Text+''',''DD/MM/YYYY'')))) ');

             wSoma := QryLocal.FieldByName('TOTAL').AsFloat;

             Edit;

             FieldByName('TOTACAO').asFloat   := wSoma;
             Post;
             Next;
       End;
       First;
       // Busca cotação
          While Not EOF Do Begin
            wCotacao1 := BuscaDadosCotacaoInvest(
                         FieldByName('IDINVESTIMENTO').AsInteger, txtData.Date, True, QtdLote);
            Edit;
            if QtdLote = 0 then
               FieldByName('QTDTITLOTE').AsFloat  := 1
            else
               FieldByName('QTDTITLOTE').AsFloat  := QtdLote;

            FieldByName('COTACAO').asFloat  := wCotacao1;
            Post;
            Next;
          End;
          First;
     End;

// Busca o Valor dos Recursos Garantidores

  wStrMes:=Copy(txtData.Text,4,2)+Copy(txtData.Text,7,4);
  dtmRelatoriosClaudio.wVlrRecursosGarantidores :=0;
  If FazQuery(QryAux,' SELECT  DAD.EMPRESAPROP, DAD.MES, DAD.VLRRECURGARAN FROM DADOSMESPROP DAD '+
                     ' WHERE DAD.MES = '+QuotedStr(wStrMes)) Then Begin
    dtmRelatoriosClaudio.wVlrRecursosGarantidores :=QryAux.FieldByName('VLRRECURGARAN').AsFloat;
  End;


// Libera Objetos Locais
  QryLocal.Free;
end;

procedure TfrmParamPerticEmp.FormCreate(Sender: TObject);
begin
  inherited;
  txtData.Date := Date
end;


// Função que Busca Cotação de um Investimento numa determinada data.
function TfrmParamPerticEmp.BuscaDadosCotacaoInvest(iInvestimento: Longint; dDataRef: TDateTime;
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
    QtdLote := QryLocal.FieldByName('QTDTITLOTE').AsFloat;
    QryLocal.Free;
end;

end.
