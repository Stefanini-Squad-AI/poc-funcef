//***************************************************************************************
//Rotina.............: ListTarifaArquivoRetNova
//N. WO..............: 18806
//Data da Alteração..: 10/06/2024
//Responsável........: Helen V Bianchi
//Descrição..........: Alterando o campo VALOR e VLRTARIFA para Float
//***************************************************************************************
//Rotina.............: ListRateioFinanc
//N. SIG.............: 99578
//Data da Alteração..: 24/04/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correções aplicadas na conciliação de tarifas bancárias.
//***************************************************************************************
//Rotina.............: ListConveniosTarifados
//N. SIG.............: 98429
//Data da Alteração..: 06/03/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração da conta contábil padrão de lançamento contábil da tarifa.
//***************************************************************************************
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação da classe de negócio para inclusão de regras de execução do
//                     cadastro e conciliação de tarifas bancárias.
//***************************************************************************************
//Rotina.............: ListRateioFinanc, ListTarifaArquivoRetNova, ListDocumentos,  
//					   GetTarifaBancariaTemplate, ListDocumentos	
//N. SIG.............: 80588
//Data da Alteração..: 28/02/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhoria sobre o procedimento de conciliação de tarifa.
//***************************************************************************************
unit uCtrlTarifaBancaria;

interface

uses
  SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes, uDbTarifaBancaria, uCMMath,DB, uDbTarifaxMovimFinanc;

type
  TCtrlTarifaBancaria = class(TCMControlObject)
    private
    FDbTarifaBancaria: TDbTarifaBancaria;
    FCdsTarifaBancaria: TCMClientDataSet;
    FDbTarifaxMovimFinanc: TDbTarifaxMovimFinanc;
    FCdsTarifaxMovimFinanc: TCMClientDataSet;
    procedure SetDbTarifaBancaria(const Value: TDbTarifaBancaria);
    procedure SetCdsTarifaBancaria(const Value: TCMClientDataSet);
    procedure SetDbTarifaxMovimFinanc(const Value: TDbTarifaxMovimFinanc);
    procedure SetCdsTarifaxMovimFinanc(const Value: TCMClientDataSet);

    protected
      procedure AfterInitialize;   override;
      procedure OnCreateAppServer; override;
      procedure DoChangeDataBase; override;

    public
      constructor Create;  override;
      destructor  Destroy; override;

      property DbTarifaBancaria : TDbTarifaBancaria read FDbTarifaBancaria write SetDbTarifaBancaria;
      property DbTarifaxMovimFinanc : TDbTarifaxMovimFinanc read FDbTarifaxMovimFinanc write SetDbTarifaxMovimFinanc;
      property CdsTarifaBancaria : TCMClientDataSet read FCdsTarifaBancaria write SetCdsTarifaBancaria;
      property CdsTarifaxMovimFinanc: TCMClientDataSet read FCdsTarifaxMovimFinanc write SetCdsTarifaxMovimFinanc;

      function AplicaTarifaBancaria: Boolean;
      function AplicaTarifaxMovimFinanc: Boolean;
      function ListTarifaBancaria(pIdTarifaBancaria: Integer): OleVariant;
      function ListPortadorForma(pTipoConvenio: Integer = 0): OleVariant;
      function ListTarifaArquivos(pCodPortForma: integer = -1; pDataMov: TDateTime = -1): OleVariant;
      function ListRateioDocumArquivo(pDocumentos: string; pValor: double): OleVariant;
      function ListRateioFinanc(pCodLancFinanc: Integer; pValor: Double; pQtdDoc: integer): OleVariant; //Cássio Rovaroto - SIG nº 80588
      function ListTarifasBancariasArq(pCodPortForma: Integer; pDataMovimento: TDateTime): OleVariant;
      function ListTarifaArquivoRet(pCodPortForma, iLinRealizadas: Integer; pNSA: String): OleVariant;
      function ListTarifaArquivoRetNova(pCodLancFinanc: integer): OleVariant; //Cássio Rovaroto - SIG nº 80588
      function ListRateioFinancTarifa: OleVariant;
      function ListaRateioTarifa(pIdArqPagto, pCodForma: string): OleVariant;
      function ListMovimFinancTarifa: OleVariant;
      function ListaFormaRecPag: OleVariant;
      function VerificaDadosTarifa(pCodForma, pCodPortForma: Integer): Boolean;
      function GetSequenceTarifaxMovimFinanc: Integer;
      function ListTarifaxMovimFinanc(pIdTarifaxMovimFinanc: Integer): OleVariant;
      function ListMovimFinancParaTarifa(pNSA: string): boolean;
      function OraNumero(rNumero : Double ):string;
      function ListDocumentos(rCodLancFinanc: Integer): OleVariant; //Cássio Rovaroto - SIG nº 80588
      function GetTarifaBancariaTemplate: OleVariant; //Cássio Rovaroto - SIG nº 80588
      function ListConveniosTarifados(pTipoConvenio: Integer = 0): OleVariant; //Cássio Rovaroto - SIG nº 98429

end;


implementation
uses uFuncaoGeral;
{ TCtrlTarifaBancaria }

procedure TCtrlTarifaBancaria.AfterInitialize;
begin
  inherited;

end;

function TCtrlTarifaBancaria.AplicaTarifaBancaria: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaTarifaBancaria(FCdsTarifaBancaria.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FCdsTarifaBancaria,FDbTarifaBancaria,[],[]);

          if not Result then
           begin
              MessageInfo := FDbTarifaBancaria.MessageInfo;
              Rollback;
           end
          else
           Commit;

       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

constructor TCtrlTarifaBancaria.Create;
begin
  inherited;
    FDbTarifaBancaria  := TDbTarifaBancaria.Create(Self);
    FDbTarifaxMovimFinanc := TDbTarifaxMovimFinanc.Create(Self)
end;

destructor TCtrlTarifaBancaria.Destroy;
begin
  FreeAndNil(FDbTarifaBancaria);
  FreeAndNil(FDbTarifaxMovimFinanc);

  if isAppServer then
  begin
    FreeAndNil(FCdsTarifaBancaria);
    FreeAndNil(FCdsTarifaxMovimFinanc);
  end;
  
  inherited;
end;

procedure TCtrlTarifaBancaria.DoChangeDataBase;
begin
  inherited;
  fDBTarifaBancaria.DataBaseName:= DataBaseName;
  FDbTarifaxMovimFinanc.DataBaseName:= DataBaseName;
end;

function TCtrlTarifaBancaria.GetSequenceTarifaxMovimFinanc: Integer;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := -1;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL :=  'SELECT SEQTARIFAXMOVIMFINANC.NEXTVAL AS IDTARIFAXMOVIMFINANC FROM DUAL';
    cdsAux.Data := GetDataPacket(sSQL);

    if not cdsAux.IsEmpty then
      Result := cdsAux.FieldByName('IDTARIFAXMOVIMFINANC').AsInteger;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlTarifaBancaria.ListaFormaRecPag: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT CODFORMA,                          ' +#13#10+
          '       RECPAG,                            ' +#13#10+
          '	      DESCRICAO                          ' +#13#10+
          '  FROM FORMARECPAG                        ' +#13#10+
          ' ORDER BY DESCRICAO                       ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListaRateioTarifa(pIdArqPagto,
  pCodForma: string): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT IDPLANOPREV,                                      ' +#13#10+
          '       IDPATRO,                                          ' +#13#10+
        	'       VALOR                                             ' +#13#10+
          ' FROM  (SELECT TA.IDPLANOPREV,                           ' +#13#10+
          '               TA.IDPATRO,                               ' +#13#10+
	   		  '               SUM(TA.VALOR) AS VALOR                    ' +#13#10+
          '  		     FROM TARIFAARQPAGTO TA                         ' +#13#10+
          '          JOIN TARIFABANCARIA TB                         ' +#13#10+
          '            ON TB.IDTARIFABANCARIA = TA.IDTARIFABANCARIA ' +#13#10+
          '           AND TB.CODFORMA  ' + pCodForma                  +#13#10+
	        '         WHERE TA.IDARQUIVOPAGTO ' + pIdArqPagto           +#13#10+
	        '         GROUP BY TA.IDPLANOPREV, TA.IDPATRO)            ' +#13#10+
          ' ORDER BY VALOR                                          ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListMovimFinancTarifa: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDMODULO,          ' +#13#10+
          '       HISTPADFINAN,      ' +#13#10+
          '       IDUSUARIOINCLUSAO, ' +#13#10+
          '       CODPORTADOR,       ' +#13#10+
          '       VALORLANCFINAN,    ' +#13#10+
          '       VALOROUTRAMOEDA,   ' +#13#10+
          '       NUMCHQBORDERO,     ' +#13#10+
          '       DATALANCFINAN,     ' +#13#10+
          '       ENTRADASAIDA,      ' +#13#10+
          '       HISTORICO,         ' +#13#10+
          '       STATUSCONCILIA,    ' +#13#10+
          '       IDPESSOA,          ' +#13#10+
          '       CONCILIADO,        ' +#13#10+
          '       DATADISPFINANC,    ' +#13#10+
          '       DATACONCILIACAO,   ' +#13#10+
          '       MOECODIGO          ' +#13#10+
          '  FROM MOVIMFINANC        ' +#13#10+
          ' WHERE CODLANCFINANC = -1 ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListPortadorForma(
  pTipoConvenio: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT CODPORTFORMA,                                              ' +#13#10+
          '       RECPAG,                                                    ' +#13#10+
          '       DECODE(RECPAG, ''P'', ''Débito'', ''Crédito'') AS TIPOCONV, ' +#13#10+
          '       DESCRICAO,                                                 ' +#13#10+
           '      NUMEMPRESABANCO                                            ' +#13#10+
          '  FROM PORTADORFORMA                                              ' +#13#10+
          ' WHERE NVL(FLGATIVO, ''S'') = ''S''                               ';
  if pTipoConvenio = 1 then
    sSQL := sSQL + '   AND FLGARQUIVO = ''S''';
    
  Result := GetDataPacket(sSQL);

end;

function TCtrlTarifaBancaria.ListRateioDocumArquivo(
  pDocumentos: string; pValor: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPLANOPREV, IDPATRO, TO_NUMBER(TO_CHAR(VALOR, ''9990D00'')) AS VALOR               ' +#13#10+
          '  FROM (SELECT RP.IDPLANOPREV, RP.IDPATRO,                                                 ' +#13#10+
          '               ROUND(' + OraNumero(pValor) + ' * (RP.VALOR_PLANO/RT.VALOR), 2) AS VALOR    ' +#13#10+
          '          FROM (SELECT SUM(VALOR) AS VALOR_PLANO, IDPLANOPREV, IDPATRO                     ' +#13#10+
          '		               FROM RATEIODOCUM                                                         ' +#13#10+
          '		              WHERE CODDOCUMENTO IN ' + pDocumentos                                       +#13#10+
          '	                GROUP BY IDPLANOPREV, IDPATRO) RP,                                        ' +#13#10+
          '		            (SELECT SUM(VALOR) AS VALOR                                                 ' +#13#10+
          '		               FROM RATEIODOCUM                                                         ' +#13#10+
          '		              WHERE CODDOCUMENTO IN ' + pDocumentos +') RT )                            ' +#13#10+
          '  ORDER BY VALOR                                                                           ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListRateioFinancTarifa: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPESSOA,         ' +#13#10+
          '       CODLANCFINANC,    ' +#13#10+
          '       UNIDNEGOC,        ' +#13#10+
          '       CODTIPRECDES,     ' +#13#10+
          '       RECPAG,           ' +#13#10+
          '       CODCENTRORESPON,  ' +#13#10+
          '       VALOR,            ' +#13#10+
          '       VALOROUTRAMOEDA,  ' +#13#10+
          '       IDEMPRESA,        ' +#13#10+
          '       CODCENTROCUSTO,   ' +#13#10+
          '       IDPROGRAMA,       ' +#13#10+
          '       IDPLANOPREV,      ' +#13#10+
          '       IDPATRO,          ' +#13#10+
          '       CODTIPDOC,        ' +#13#10+
          '       MOECODIGO,        ' +#13#10+
          '       IDSEGREGACRITER   ' +#13#10+
          '  FROM RATEIOFINANC      ' +#13#10+
          ' WHERE CODLANCFINANC = -1';
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListTarifaArquivoRet(pCodPortForma,
  iLinRealizadas: Integer; pNSA: String): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT 1 AS SEL,                                                                                ' +#13#10+
          '	      0 AS IDARQUIVPAGTO,                                                                      ' +#13#10+
          '	      CAST(LPAD(NVL(' + QuotedStr(pNSA) +', ''0''), 6, ''0'') AS VARCHAR2(6)) AS NSA,          ' +#13#10+  //B_MIGRACAO_ORACLE_2025 LEANDRO 
          '	      PF.CODFORMA AS CODFORMA,                                                                 ' +#13#10+
          '	      FR.DESCRICAO AS FORMARECPAG,                                                             ' +#13#10+
          '       TRIM(TO_CHAR(TB.VALOR, ''9990D00'')) AS VLRTARIFA,                                       ' +#13#10+
          '       0 AS LINPREVISTAS,                                                                       ' +#13#10+
          '	      TRIM(TO_CHAR(0, ''9990D00'')) AS VLRPREVISTO,                                            ' +#13#10+
                  IntToStr(iLinRealizadas) + ' AS LINREALIZADAS,                                           ' +#13#10+
          '	      (TB.VALOR * '+ IntToStr(iLinRealizadas)+' ) AS VLRREALIZADO_F,                           ' +#13#10+
          '	      TRIM(TO_CHAR((TB.VALOR * '+ IntToStr(iLinRealizadas)+' ), ''9990D00'')) AS VLRREALIZADO, ' +#13#10+
          '       2 AS TIPO_TARIFA                                                                         ' +#13#10+ // 2 - TARIFA POR ARQUIVO RETORNO
          '  FROM TARIFABANCARIA TB                                                                        ' +#13#10+
          '  JOIN PORTADORFORMA PF ON PF.CODPORTFORMA = TB.CODPORTFORMA                                    ' +#13#10+
          '   AND PF.CODPORTFORMA = ' + IntToStr(pCodPortForma)                                              +#13#10+
          '  JOIN FORMARECPAG FR ON FR.CODFORMA = PF.CODFORMA                                              ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListTarifaArquivos(pCodPortForma: integer;
  pDataMov: TDateTime): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT CAST(LPAD(AP.NSA, 6,''0'') AS VARCHAR2(6)) AS NSA,                ' +#13#10 +  //B_MIGRACAO_ORACLE_2025 LEANDRO
          '       CAST(LPAD(TP.CODDOCARQ, 5, ''0'') AS VARCHAR2(6)) AS CODDOCARQ,   ' +#13#10 +  //B_MIGRACAO_ORACLE_2025 LEANDRO
          '       (TB.VALOR * TP.PERCENTUAL) AS VLRPREVISTO,                        ' +#13#10 +
          '       TP.VALOR  AS VLRREALIZADO,                                        ' +#13#10 +
          '       TP.IDPLANOPREV AS IDPLANOPREV,                                    ' +#13#10 +
          '       PP.NOME AS PLANO                                                  ' +#13#10 +
          '  FROM TARIFAARQPAGTO TP                                                 ' +#13#10 +
          '  JOIN TARIFABANCARIA TB ON TB.IDTARIFABANCARIA = TP.IDTARIFABANCARIA    ';

  if pCodPortForma <> -1 then
    sSQL := sSQL + ' AND TB.CODPORTFORMA = ' + IntToStr(pCodPortForma)                + #13#10
  else
    sSQL := sSQL + ' AND TB.CODPORTFORMA = -1                                       ' +#13#10;

  sSQL := sSQL + '  JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = TP.IDARQUIVOPAGTO   ' +#13#10 +
                 '  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = TP.IDPLANOPREV     ' +#13#10;
  if pDataMov <> -1 then
    sSQL := sSQL + ' WHERE TP.DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(DateTimeToStr(pDataMov)) + ', ''DD/MM/YYYY'')' + #13#10
  else
    sSQL := sSQL + ' WHERE TP.DATAMOVIMENTACAO = SYSDATE                            ' +#13#10;

  sSQL := sSQL + ' ORDER BY AP.NSA, TP.CODDOCARQ, TP.VALOR                       ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListTarifaBancaria(
  pIdTarifaBancaria: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=  'SELECT IDTARIFABANCARIA,  ' +#13#10+
           '       CODPORTFORMA,      ' +#13#10+
           '       CODFORMA,          ' +#13#10+
           '       DESCRICAO,         ' +#13#10+
           '       VALOR,             ' +#13#10+
           '       VALORANTECIP,      ' +#13#10+
           '       DATAINICIO,        ' +#13#10+
           '       DATAFIM            ' +#13#10+
           '  FROM TARIFABANCARIA     ' +#13#10+
           ' WHERE IDTARIFABANCARIA = ' + IntToStr(pIdTarifaBancaria);
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListTarifasBancariasArq(pCodPortForma: Integer;
  pDataMovimento: TDateTime): OleVariant;
var
  sSQL: string;
begin
  sSQL:= 'SELECT 1 AS SEL,                                                                                               ' +#13#10+
         '       T.IDARQUIVOPAGTO,                                                                                       ' +#13#10+
         '       T.NSA,                                                                                                  ' +#13#10+
         '       T.CODFORMA,                                                                                             ' +#13#10+
         '       T.FORMARECPAG,                                                                                          ' +#13#10+
         '       TRIM(TO_CHAR(T.VLRTARIFA, ''9990D00'')) AS VLRTARIFA,                                                   ' +#13#10+
         '       T.LINPREVISTAS,                                                                                         ' +#13#10+
         '       TRIM(TO_CHAR(T.VLRPREVISTO, ''9990D00'')) AS VLRPREVISTO,                                               ' +#13#10+
         '       T.VLRPREVISTO AS VLRPREVISTO_F,                                                                         ' +#13#10+
         '       L.LINREALIZADAS,                                                                                        ' +#13#10+
         '       TRIM(TO_CHAR(T.VLRREALIZADO, ''9990D00'')) AS VLRREALIZADO,                                             ' +#13#10+
         '       T.VLRREALIZADO AS VLRREALIZADO_F,                                                                       ' +#13#10+
         '       1 AS TIPO_TARIFA                                                                                        ' +#13#10+ //1 = LEITURA SIACC
         '  FROM (SELECT TA.IDARQUIVOPAGTO,                                                                              ' +#13#10+
         '			    CAST(LPAD(AP.NSA, 6, ''0'') AS VARCHAR2(6)) AS NSA,                                  ' +#13#10+  //B_MIGRACAO_ORACLE_2025 LEANDRO
         '               TB.CODFORMA AS CODFORMA,                                                                        ' +#13#10+
         '               FO.DESCRICAO AS FORMARECPAG,                                                                    ' +#13#10+
         '               TB.VALOR AS VLRTARIFA,                                                                          ' +#13#10+
         '               COUNT(TA.IDARQUIVOPAGTO) AS LINPREVISTAS,                                                       ' +#13#10+
         '               ROUND(SUM(TB.VALOR * TA.PERCENTUAL),2) AS VLRPREVISTO,                                          ' +#13#10+
         '               ROUND(SUM(TA.VALOR),2) AS VLRREALIZADO                                                          ' +#13#10+
         '          FROM TARIFAARQPAGTO TA                                                                               ' +#13#10+
         '          JOIN TARIFABANCARIA TB ON TB.IDTARIFABANCARIA = TA.IDTARIFABANCARIA                                  ' +#13#10+
         '          JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = TA.IDARQUIVOPAGTO                                        ' +#13#10+
         '          JOIN FORMARECPAG FO ON FO.CODFORMA = TB.CODFORMA                                                     ' +#13#10+
         '         WHERE TB.CODPORTFORMA = ' + IntToStr(pCodPortForma)                                                     +#13#10+
         '           AND TA.DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(DateTimeToStr(pDataMovimento)) + ', ''DD/MM/YYYY'') ' +#13#10+
         '         GROUP BY TA.IDARQUIVOPAGTO, AP.NSA, TB.VALOR, TB.CODFORMA, FO.DESCRICAO) T                            ' +#13#10+
         '  JOIN (SELECT IDARQUIVOPAGTO,                                                                                 ' +#13#10+
         '  			   COUNT(IDARQUIVOPAGTO) AS LINREALIZADAS                                                              ' +#13#10+
         '  	      FROM TARIFAARQPAGTO TA                                                                               ' +#13#10+
         '          JOIN TARIFABANCARIA TB ON TB.IDTARIFABANCARIA = TA.IDTARIFABANCARIA                                  ' +#13#10+
         '         WHERE TB.CODPORTFORMA = ' + IntToStr(pCodPortForma)                                                     +#13#10+
         '           AND TA.DATAMOVIMENTACAO = TO_DATE(' + QuotedStr(DateTimeToStr(pDataMovimento)) + ', ''DD/MM/YYYY'') ' +#13#10+
         '           AND NVL(TA.VALOR, 0) <> 0                                                                           ' +#13#10+
         '         GROUP BY TA.IDARQUIVOPAGTO) L ON L.IDARQUIVOPAGTO = T.IDARQUIVOPAGTO                                  ' +#13#10+
         ' ORDER BY T.NSA                                                                                                ' ;
         
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListTarifaxMovimFinanc(
  pIdTarifaxMovimFinanc: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDTARIFAXMOVIMFINANC,   ' +#13#10+
          '       NSA,                    ' +#13#10+
          '       CODLANCFINANC           ' +#13#10+
          '  FROM TARIFAXMOVIMFINANC      ' +#13#10+
          ' WHERE IDTARIFAXMOVIMFINANC =  ' + IntToStr(pIdTarifaxMovimFinanc);
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListMovimFinancParaTarifa(pNSA: string): boolean;
var
  sSQL: string;
  cdsAux:TCMClientDataSet;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT 1 FROM TARIFAXMOVIMFINANC WHERE NSA = ' + QuotedStr(pNSA);
    cdsAux.Data := GetDataPacket(sSQL);

    if not cdsAux.IsEmpty then
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TCtrlTarifaBancaria.OnCreateAppServer;
begin
  inherited;
  FCdsTarifaBancaria := TCMClientDataSet.Create(nil);
  FCdsTarifaxMovimFinanc := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTarifaBancaria.SetCdsTarifaBancaria(
  const Value: TCMClientDataSet);
begin
  FCdsTarifaBancaria := Value;
end;

procedure TCtrlTarifaBancaria.SetDbTarifaBancaria(
  const Value: TDbTarifaBancaria);
begin
  FDbTarifaBancaria := Value;
end;

function TCtrlTarifaBancaria.VerificaDadosTarifa(pCodForma,
  pCodPortForma: Integer): Boolean;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT 1                                         ' +#13#10+
            '  FROM TARIFABANCARIA                            ' +#13#10+
            ' WHERE CODPORTFORMA = ' + IntToStr(pCodPortForma)  +#13#10+
            '   AND CODFORMA = ' + IntToStr(pCodForma)          +#13#10+
            '   AND DATAFIM IS NULL                           ';
    cdsAux.Data:= GetDataPacket(sSQL);

    if not cdsAux.IsEmpty then
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;


end;

function TCtrlTarifaBancaria.OraNumero(rNumero : Double ):string;
var
   sNumero : string;
   AuxDec      : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result:=sNumero;
   DecimalSeparator:=AuxDec;
end;

procedure TCtrlTarifaBancaria.SetDbTarifaxMovimFinanc(
  const Value: TDbTarifaxMovimFinanc);
begin
  FDbTarifaxMovimFinanc := Value;
end;

function TCtrlTarifaBancaria.AplicaTarifaxMovimFinanc: Boolean;
begin
  begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaTarifaBancaria(FCdsTarifaxMovimFinanc.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FCdsTarifaxMovimFinanc,FDbTarifaxMovimFinanc,[],[]);

          if not Result then
           begin
              MessageInfo := FDbTarifaxMovimFinanc.MessageInfo;
              Rollback;
           end
          else
           Commit;

       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
  end;
end;

procedure TCtrlTarifaBancaria.SetCdsTarifaxMovimFinanc(
  const Value: TCMClientDataSet);
begin
  FCdsTarifaxMovimFinanc := Value;
end;

function TCtrlTarifaBancaria.ListDocumentos(
  rCodLancFinanc: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT D.CODDOCUMENTO                                       ' +#13#10+
          '  FROM RECBTOPAGTO RR                                       ' +#13#10+
          '  JOIN DOCUMENTO   D ON (D.CODDOCUMENTO = RR.CODDOCUMENTO)  ' +#13#10+
          ' WHERE (RR.CODLANCFINANC = ' + IntToStr(rCodLancFinanc) + ')';

  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListTarifaArquivoRetNova(
  pCodLancFinanc: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT 1 AS SEL,                                                                               ' + #13#10+
          '       NVL(AP.IDARQUIVOPAGTO, 0) AS IDARQUIVOPAGTO,                                            ' + #13#10+  //B_MIGRACAO_ORACLE_2025 LEANDRO
          '       CAST(LPAD(NVL(AP.NSA, ''0''), 6, ''0'') AS VARCHAR2(6)) AS NSA,                         ' + #13#10+
          '       PE.RAZAOSOCIAL,                                                                         ' + #13#10+
          '       DO.NODOCUMENTO,                                                                         ' + #13#10+
          '       DO.CODDOCUMENTO,                                                                        ' + #13#10+
//          '       TRIM(TO_CHAR(LD.VALOR, ''99G999G999G999G990D00'')) AS VALOR,                            ' + #13#10+   WO10886 - Helen V Bianchi
          '       LD.VALOR,                            ' + #13#10+
          '       DO.CODFORMA AS CODFORMA,                                                                ' + #13#10+
          '       TB.DESCRICAO AS FORMARECPAG,                                                            ' + #13#10+
//          '       TRIM(TO_CHAR(TB.VALOR, ''999G990D00'')) AS VLRTARIFA,                                   ' + #13#10+   WO10886 - Helen V Bianchi
          '       TB.VALOR AS VLRTARIFA,                                   ' + #13#10+
          '       2 AS TIPO_TARIFA                                                                        ' + #13#10+
          '  FROM CM.MOVIMFINANC MF                                                                       ' + #13#10+
          '  JOIN CM.RECBTOPAGTO RP ON RP.CODLANCFINANC = MF.CODLANCFINANC                                ' + #13#10+
          '  JOIN CM.DOCUMENTO DO ON DO.CODDOCUMENTO = RP.CODDOCUMENTO                                    ' + #13#10+
          '  JOIN CM.PESSOA PE ON PE.IDPESSOA = DO.IDFORCLI                                               ' + #13#10+
          '  JOIN CM.LANCTODOCUM LD ON LD.CODDOCUMENTO = DO.CODDOCUMENTO AND LD.NUMLANCTO = RP.NUMLANCTO  ' + #13#10+
          '  JOIN CM.TARIFABANCARIA TB ON TB.CODPORTFORMA = DO.CODPORTFORMA                               ' + #13#10+
          '   AND ((DO.CODFORMA IS NOT NULL AND TB.CODFORMA = DO.CODFORMA) OR (TB.CODFORMA IS NULL))      ' + #13#10+
          '  LEFT JOIN CM.ARQUIVOXDOCUM AD ON AD.ID_DOC_CODBARRAS_PESSOAS = DO.CODDOCUMENTO               ' + #13#10+
          '  LEFT JOIN CM.ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO                        ' + #13#10+
          ' WHERE MF.CODLANCFINANC = ' + IntToStr(pCodLancFinanc)                                           + #13#10+
          ' ORDER BY DO.NODOCUMENTO                                                                       ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.GetTarifaBancariaTemplate: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT '''' AS SEL,         ' +#13#10+
          '       '''' AS NODOCUMENTO, ' +#13#10+
          '       '''' AS RAZAOSOCIAL, ' +#13#10+
          '       '''' AS VALOR,       ' +#13#10+
          '       '''' AS NSA,         ' +#13#10+
          '       '''' AS CODFORMA,    ' +#13#10+
          '       '''' AS FORMARECPAG, ' +#13#10+
          '       '''' AS VLRTARIFA    ' +#13#10+
          '   FROM DUAL                ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListRateioFinanc(pCodLancFinanc: Integer;
  pValor: Double; pQtdDoc: integer): OleVariant;
var
  sSQL: string;
begin
//Cássio Rovaroto - SIG nº 99578 - Início
//  sSQL := 'SELECT IDPLANOPREV, IDPATRO, TO_NUMBER(TO_CHAR(VALOR, ''9990D00'')) AS VALOR               ' +#13#10+
  sSQL := 'SELECT IDPLANOPREV, IDPATRO, TO_NUMBER(TO_CHAR(VALOR, ''999999999999990D00'')) AS VALOR    ' +#13#10+
//Cássio Rovaroto - SIG nº 99578 - Início
          '  FROM (SELECT RP.IDPLANOPREV, RP.IDPATRO,                                                 ' +#13#10+
          '               (' + OraNumero(pValor) + ' * (RP.VALOR_PLANO/RT.VALOR)) * ' + IntToStr(pQtdDoc) + ' AS VALOR  ' +#13#10+
          '          FROM (SELECT SUM(VALOR) AS VALOR_PLANO, IDPLANOPREV, IDPATRO                     ' +#13#10+
          '		               FROM RATEIOFINANC                                                        ' +#13#10+
          '		              WHERE CODLANCFINANC = ' + IntToStr(pCodLancFinanc)                          +#13#10+
          '	                GROUP BY IDPLANOPREV, IDPATRO) RP,                                        ' +#13#10+
          '		            (SELECT SUM(VALOR) AS VALOR                                                 ' +#13#10+
          '		               FROM RATEIOFINANC                                                         ' +#13#10+
          '		              WHERE CODLANCFINANC = ' + IntToStr(pCodLancFinanc) + ') RT )              ' +#13#10+
          '  ORDER BY VALOR                                                                           ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlTarifaBancaria.ListConveniosTarifados(
  pTipoConvenio: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT P.CODPORTFORMA,                                               ' +#13#10+
          '       P.RECPAG,                                                     ' +#13#10+
          '       DECODE(P.RECPAG, ''P'', ''Débito'', ''Crédito'') AS TIPOCONV, ' +#13#10+
          '       P.DESCRICAO,                                                  ' +#13#10+
          '       P.NUMEMPRESABANCO                                             ' +#13#10+
          '  FROM PORTADORFORMA P                                               ' +#13#10+
          ' WHERE NVL(P.FLGATIVO, ''S'') = ''S''                                ';
  if pTipoConvenio = 1 then
    sSQL := sSQL + '   AND P.FLGARQUIVO = ''S''';
  sSQL := sSQL +   '   AND EXISTS (SELECT 1 FROM TARIFABANCARIA T WHERE T.CODPORTFORMA = P.CODPORTFORMA) ' +#13#10+
                   ' ORDER BY DESCRICAO                                         ';
    
  Result := GetDataPacket(sSQL);

end;

end.
