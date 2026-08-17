unit uValorAtual;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, Wwtable, uRegra,
  Wwquery, uDocumento, uIntegraBack;

function ValorAtual(const ValHist:double; const DataHist,Moeda,Regra,sNumProc:string;
                    const TipoCalc:integer): double;

function RegraNumerica(sNumRegra,sSQL:string; var bErro:boolean): string;

function ValidaDadosDoc(var CodCentroRespon, sMens:string; StiPrecDes:string;
                        var UnidNegoc:integer): boolean;

function AlimentaQryDocumentos(
  QryDocumentos: TwwQuery;
  CodDocumento, NumLancto, Plano, UnidNegoc, iUltPortForma: integer;
  PlaConta, CodCentroRespon, CodTipRecDes, sDebCre: string;
  Valor: real;
  var sMens: string;
  iPortFormaParticip: integer;
  sCodCentroCusto: string): boolean;

function DescarregaQryDocumentos(
  qryDocumentos: TwwQuery;
  iFavorecido, plnCodigo: integer;
  sCodPortForma, sMes, sAno: string;
  Valor: real;
  dtRecebimento: TDateTime;
  Documento: TDocumento;
  bRateio: boolean): LongInt;

function RateioCusto(const VALORREF       : Double;
                     const DATAADMISSAO   : TDate;
                     const DATADEMISSAO   : TDate;
                     const DATANOTIF      : TDate;
                     const IDFILIALPESSOA : Integer;
                     const IDPESSOA       : Integer;
                     const DATABASE       : TDate;
                     const TIPORATEIO     : Integer;
                     const PERIODO        : Integer;
                     const PERCENT1       : Double;
                     const VALORBASE1     : Double;
                     const PERCENT2       : Double;
                     const VALORBASE2     : Double;
                     const PERCENT3       : Double;
                     const VALORBASE3     : Double;
                     const PERCENT4       : Double;
                     const VALORBASE4     : Double;
                     const PERCENT5       : Double;
                     const VALORBASE5     : Double) : Double;

var
  compRegra: TRegra;
  qryInRegra: TwwQuery;

implementation

uses uSistema, uFuncoesUteisRH, fPrincipal;

function ValorAtual(const ValHist: Double; const DataHist, Moeda, Regra, sNumProc: String;
                    const TipoCalc: Integer) : Double;
var
  qry: TwwQuery;
  sSQL, sPercValor: string;
  bErroRegra: boolean;
//  vTaxa: double;
begin
   // Criar query temporária
   Result := ValHist;
   if  (DataHist = '') or (TipoCalc = 2)  then  exit;
   if  (TipoCalc = 0) and (Moeda <> '') then
   begin
      qry := TwwQuery.Create(Application);
      qry.DatabaseName := 'BaseDados';

      qry.SQL.Clear;
      sSQL := 'SELECT FLGPERCVALOR FROM MOEDA ' +
              'WHERE MOECODIGO = ' + Moeda;
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(sSql);
      qry.Open;
      sPercValor := qry.FieldByName('FLGPERCVALOR').asString;

      if sPercValor = 'V' then
         sSQL := 'SELECT COTVALOR FROM COTACAOMOEDA ' +
                 'WHERE MOECODIGO = ' + Moeda + ' AND ' +
                 '      COTDATA  <= to_date(''' +  DataHist  + ''',''dd/mm/yyyy'') ' +
                 '      ORDER BY  COTDATA DESC'
      else
         sSQL := 'SELECT COTVALOR FROM COTACAOMOEDA ' +
                 'WHERE MOECODIGO = ' + Moeda + ' AND ' +
                 '      COTDATA  BETWEEN to_date(''' +  DataHist  + ''',''dd/mm/yyyy'') ' +
                 '      AND SYSDATE ORDER BY  COTDATA';

      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(sSql);
      qry.Open;

      if  not qry.IsEmpty  then
          if sPercValor = 'V' then
             Result := ValHist * qry.FieldByName('COTVALOR').asFloat
          else
             while not qry.EOF do
             begin
                Result := Result + Result * qry.FieldByName('COTVALOR').asFloat / 100;
                qry.Next;
             end;

      qry.Close;
      qry.Free;
   end;

   if  (TipoCalc = 1) and (Regra <> '') then
   begin
      sSQL := 'SELECT P.*, ' + FloatToStr(ValHist) + ' AS VALORHIST ' +
              ' FROM PROCESSOTRAB P ' +
              'WHERE NUMPROCTRAB = ' + sNumProc;

      Result := StrToFloat(ClienteNumero(RegraNumerica(Regra, sSQL, bErroRegra)));
   end;

end;

function RegraNumerica(sNumRegra,sSQL:string; var bErro:boolean): string;
begin
  Result:=''; bErro:=false;

  compRegra.RuleName := sNumRegra;

  qryInRegra.Close;
  qryInRegra.SQL.Clear;
  qryInRegra.SQl.Add(sSQL);
  qryInRegra.Open;

  if (qryInRegra.RecordCount = 0) then
  begin
    qryInRegra.Close;
    exit;
  end;

  compRegra.Execute;

  if not(compRegra.Error) then
    Result := OraNumero(compRegra.Result)
  else
    bErro := true;

  qryInRegra.Close;
end;

function AlimentaQryDocumentos (
  QryDocumentos: TwwQuery;
  CodDocumento, NumLancto, Plano, UnidNegoc, iUltPortForma: integer;
  PlaConta, CodCentroRespon, CodTipRecDes, sDebCre : string;
  Valor: real;
  var sMens: string;
  iPortFormaParticip: integer;
  sCodCentroCusto  : string): boolean;
begin
  Result := true;

  if not(ValidaDadosDoc(CodCentroRespon, sMens, CodTipRecDes, UnidNegoc)) then
  begin
    Result := false;
    exit;
  end;

  qryDocumentos.First;
  while not(qryDocumentos.EOF) do
  begin
    if (qryDocumentos.FieldByName('CODDOCUMENTO').asInteger = CodDocumento) and
       (qryDocumentos.FieldByName('NUMLANCTO').asInteger = NumLancto) and
       (qryDocumentos.FieldByName('UNIDNEGOC').asInteger = UnidNegoc) and
       (qryDocumentos.FieldByName('CODCENTRORESPON').asString = CodCentroRespon) and
       (qryDocumentos.FieldByName('CODTIPRECDES').asString = codtiprecdes) and
       (qryDocumentos.FieldByName('PLACONTA').asString = placonta) and
       (qryDocumentos.FieldByName('CODPORTFORMA').asInteger = iUltPortForma) and
       (qryDocumentos.FieldByName('PORTFORMAPARTICIP').asInteger = iPortFormaParticip) and
       (qryDocumentos.FieldByName('CodCentroCusto').asString = sCodCentroCusto) then
    begin
      qryDocumentos.Edit;
      qryDocumentos.FieldByName('VALOR').asFloat :=
        qryDocumentos.FieldByName('VALOR').asFloat + Valor;
      qryDocumentos.Post;
      exit;
    end;
    qryDocumentos.Next
  end;

  QryDocumentos.Insert;
  qryDocumentos.FieldByName('CODDOCUMENTO').asInteger      := Coddocumento;
  qryDocumentos.FieldByName('NUMLANCTO').asInteger         := NumLancto;
  qryDocumentos.FieldByName('PLANO').asInteger             := plano;
  qryDocumentos.FieldByName('UNIDNEGOC').asInteger         := unidnegoc;
  qryDocumentos.FieldByName('PLACONTA').asString           := placonta;
  qryDocumentos.FieldByName('CODCENTRORESPON').asString    := codcentrorespon;
  qryDocumentos.FieldByName('CODTIPRECDES').asString       := codtiprecdes;
  qryDocumentos.FieldByName('VALOR').asFloat               := valor;
  qryDocumentos.FieldByName('CODPORTFORMA').asInteger      := iUltPortForma;
  qryDocumentos.FieldByName('DEBCRE').asString             := sDebCre;
  qryDocumentos.FieldByName('PORTFORMAPARTICIP').asInteger := iPortFormaParticip;
  qryDocumentos.FieldByName('CodCentroCusto').asString     := sCodCentroCusto;
  QryDocumentos.Post;
end;

function DescarregaQryDocumentos(
  qryDocumentos: TwwQuery;
  iFavorecido, plnCodigo: integer;
  sCodPortForma, sMes, sAno: string;
  Valor: real;
  dtRecebimento: TDateTime;
  Documento: TDocumento;
  bRateio: boolean): LongInt;
var
  sVarPlaconta, sVarCCusto, sCodCentroCusto,
  PlaConta, PlaContaAnt, sNoDocumento ,sCentroRespon, sTiprecDes{, sDebCre}: string;
  Plano, iPrograma, iVarCodDoc, iVarSubConta, iVarPlano,
  iOrdem, iCodLancCAPCAR,iNumLancto,iUnidNegoc: integer;
  rValor: double;  
  qryAux: TwwQuery;
begin
  Result := -3;

  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';
  
  qryAux.SQL.Add('SELECT IDCBANCARIA FROM CONTABANCARIA WHERE IDPESSOA = ' +
    IntToStr(iFavorecido) + ' AND FLGCONTAPREF = 1');
  qryAux.Open;
  if not(qryAux.IsEmpty) then
    Documento.IdContaBancaria := qryAux.FieldByName('IDCBANCARIA').asInteger;
    
  qryAux.Close;
  qryAux.SQL.Clear;

  qryDocumentos.First;
  while not(qryDocumentos.EOF) do
  begin
    // Pego a Conta Contábil do Favorecido
    PlaConta := qryDocumentos.FieldByName('PLACONTA').asString;
    Plano    := qryDocumentos.FieldByName('PLANO').asInteger;
    if (PlaConta = '') then
    begin
      qryAux.Close;
      with (qryAux.SQL) do
      begin
        Clear;
        Add('SELECT CONTACFORN, PLANO FROM EMPRESAFORN WHERE');
        Add('  (IDPESSOA = ' +IntToStr(Sistema.IdEmpresa)+') AND');
        Add('  (IDFORCLI = ' +IntToStr(iFavorecido)+ ')');
      end;
      qryAux.Open;
      PlaConta := qryAux.FieldByName('CONTACFORN').asString;

      if (Plano = -1) and (qryAux.FieldByName('PLANO').asInteger <> 0) then
        Plano := qryAux.FieldByName('PLANO').asInteger;

      qryAux.Close;
    end;

    iCodLancCAPCAR := Documento.GetCodigo(qryAux);
    Inc(iOrdem);
    sNoDocumento := IntToStr(iFavorecido) + IntToStr(iOrdem);

    while (Documento.ValidaNumDoc(qryAux, 'P', iFavorecido, StrToFloat(sNoDocumento),
           '', iVarCodDoc, iVarSubConta, iVarPlano, sVarPlaconta, sVarCCusto)) do
    begin
      Inc(iOrdem);
      sNoDocumento := IntToStr(iFavorecido) + IntToStr(iOrdem);
    end;

    Documento.Inserir(
      qryAux,
      iCodLancCAPCAR,
      IntToStr(Sistema.IdModulo),
      IntToStr(Plano),
      PlaConta,
      '',
      -1, // iMoeCodigo (nao é em outra moeda)
      -1,
      Sistema.IdEmpresa,
      iFavorecido,
      StrToInt(FrmPrincipal.prmCodTipDoc),
      StrToInt(sCodPortForma),
      'P', // Contas a Pagar
      StrToFloat(sNoDocumento),
      '',
      DateToStr(Date), // Data de Emissao
      DateToStr(dtRecebimento),
      DateToStr(dtRecebimento),
      '0', // sStatus
      -1,  // iNumFatura
      '2', // sOperacao
      Sistema.IdUsuario,
      -1,
      -1,
      '',
      '',
      false,
      0,
      0,
      0);

    Result     := -2;
    iNumLancto := Documento.GerarNumLancto(qryAux, iCodLancCAPCAR);
    Result     := -1;

    if (iNumLancto <= 0) then
      exit;

    Documento.CriarLanctoDoc(
      qryAux,
      iCodLancCAPCAR,
      iNumLancto,
      -1,
      PlnCodigo,
      DateToStr(Date),
      Abs(valor),
      0,
      -1,
      Documento.BuscaDebCre(StrToInt(FrmPrincipal.prmCodTipDoc)),
      '2', // sOperacao
      '',
      Sistema.IdUsuario,
      false,
      qryDocumentos.FieldByName('CODPORTFORMA').asInteger,
      '');

    //Documento.Informa_Planilha(); Registrar a planilha contábil no CAP

    PlaContaAnt := qryDocumentos.FieldByName('PLACONTA').asString;
    Result      := 0;
    while (qryDocumentos.FieldByName('PLACONTA').asString = PlaContaAnt) and
          (not qryDocumentos.EOF) do
    begin
      iUnidNegoc      := qryDocumentos.FieldByName('UNIDNEGOC').asInteger;
      sCentroRespon   := qryDocumentos.FieldByName('CODCENTRORESPON').asString;
      sTiprecDes      := qryDocumentos.FieldByName('CODTIPRECDES').asString;
      sCodCentroCusto := qryDocumentos.FieldByName('CODCENTROCUSTO').asString;
      rValor          := 0;

      if (bRateio) and (Sistema.UsaPlanoPatro) then
      begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT '+
                       'IDPROGRAMA '+
                       'FROM '+
                       'CENTCUST '+
                       'WHERE '+
                       '(CODCENTROCUSTO = ' +QuotedStr(sCodCentroCusto)+ ') AND '+
                       '(IDEMPRESA = ' +IntToStr(Sistema.IdEmpresa)+ ') AND '+
                       '(IDPROGRAMA IS NOT NULL AND IDPROGRAMA > 0)');
        qryAux.Open;

        if (qryAux.FieldByName('IDPROGRAMA').asInteger > 0) then
          iPrograma := qryAux.FieldByName('IDPROGRAMA').asInteger
        else
          iPrograma := -1;
      end
      else
        iPrograma := -1;

      if (bRateio) then
      begin
        while (PlaContaAnt   = qryDocumentos.FieldByName('PLACONTA').asString)         and
              (iUnidNegoc    = qryDocumentos.FieldByName('UNIDNEGOC').asInteger)       and
              (sCentroRespon = qryDocumentos.FieldByName('CODCENTRORESPON').asString)  and
              (sTiprecDes    = qryDocumentos.FieldByName('CODTIPRECDES').asString)     and
              (sCodCentroCusto = qryDocumentos.FieldByName('CODCENTROCUSTO').asString) and
              (not qryDocumentos.EOF) do
        begin
          if (qryDocumentos.FieldByName('DEBCRE').asString = 'D') then
            rValor := rValor + qryDocumentos.FieldByName('VALOR').asFloat
          else
            rValor := rValor - qryDocumentos.FieldByName('VALOR').asFloat;
          qryDocumentos.Next;
        end;
      end
      else
      begin
        while (PlaContaAnt   = qryDocumentos.FieldByName('PLACONTA').asString)         and
              (iUnidNegoc    = qryDocumentos.FieldByName('UNIDNEGOC').asInteger)       and
              (sCentroRespon = qryDocumentos.FieldByName('CODCENTRORESPON').asString)  and
              (sTiprecDes    = qryDocumentos.FieldByName('CODTIPRECDES').asString)     and
              (not qryDocumentos.EOF) do
        begin
          if (qryDocumentos.FieldByName('DEBCRE').asString = 'D') then
            rValor := rValor + qryDocumentos.FieldByName('VALOR').asFloat
          else
            rValor := rValor - qryDocumentos.FieldByName('VALOR').asFloat;
          qryDocumentos.Next;
        end;
      end;

      Documento.Rateio.Inserir(
        iCodLancCAPCAR,
        sTipRecDes,
        'P',
        IFF(sCentroRespon = '','0',sCentroRespon),
        Sistema.IdEmpresa,
        Abs(rValor),
        0,
        Sistema.IdUsuario,
        IFF(iUnidNegoc = 0,-1,iUnidNegoc),
        -1,
        IFF(bRateio,sCodCentroCusto,''),
        IFF(Sistema.UsaPlanoPatro,IntegraBack.PatroGlobal,-1),
        iPrograma,
        IFF(Sistema.UsaPlanoPatro,IntegraBack.PlanoPrevGlobal,-1));
    end;
  end;
  
  Result := StrToInt(sNoDocumento);
  qryAux.Free;
end;

function ValidaDadosDoc(var CodCentroRespon, sMens:string; sTipRecDes:string;
                        var UnidNegoc:integer): boolean;
begin
  sMens:=''; Result:=true;

  if (IntegraBack.ObrigaAbc = 'S') and (unidnegoc = 0) then
  begin
    sMens  := sMens + ' - Atividade / Projeto não cadastrada';
    Result := false;
  end;

  if (IntegraBack.ObrigaCRespon = 'S') and (codcentrorespon = '') then
  begin
    sMens  := sMens + ' - Centro de Responsabilidade não cadastrado';
    Result := false;
  end;

  if (sTipRecDes = '') then
  begin
    sMens  := sMens + ' - Tipo de Recebimento/Desembolso não cadastrado';
    Result := false;
  end;
end;

function RateioCusto(const VALORREF      : Double;
                     const DATAADMISSAO  : TDate;
                     const DATADEMISSAO  : TDate;
                     const DATANOTIF     : TDate;
                     const IDFILIALPESSOA: Integer;
                     const IDPESSOA      : Integer;
                     const DATABASE      : TDate;
                     const TIPORATEIO    : Integer;
                     const PERIODO       : Integer;
                     const PERCENT1      : Double;
                     const VALORBASE1    : Double;
                     const PERCENT2      : Double;
                     const VALORBASE2    : Double;
                     const PERCENT3      : Double;
                     const VALORBASE3    : Double;
                     const PERCENT4      : Double;
                     const VALORBASE4    : Double;
                     const PERCENT5      : Double;
                     const VALORBASE5    : Double): double;
var
  DataPrescricao: TDate;
  PeriodoTotal, Periodo1: integer;
begin
  DataPrescricao := DATANOTIF - round(PERIODO * 365.25 / 12);
  if (DATAADMISSAO > DataPrescricao) then
    DataPrescricao := DATAADMISSAO;
  PeriodoTotal   := round(DATADEMISSAO - DataPrescricao);
  Periodo1       := round(DATABASE     - DataPrescricao);

  if (PeriodoTotal <= 0) then
  begin
    Result := 0;
    exit;
  end;
  
  if (Periodo1 < 0) then
    Periodo1 := 0;
    
  if (Periodo1 > PeriodoTotal) then
    Periodo1 := PeriodoTotal;

  if (TIPORATEIO = 1) then // Por Data
    Result := 100 -
      (((Periodo1 * PERCENT1) + ((PeriodoTotal - Periodo1) * PERCENT2)) / PeriodoTotal)
  else // Por Valor
  if (VALORREF <= VALORBASE1) then
    Result := (100 - PERCENT1) * VALORREF / 100
  else
  if (VALORREF > VALORBASE1) and (VALORREF <= VALORBASE2) then
    Result := (100 - PERCENT2) * VALORREF / 100
  else
  if (VALORREF > VALORBASE2) and (VALORREF <= VALORBASE3) then
    Result := (100 - PERCENT3) * VALORREF / 100
  else
  if (VALORREF > VALORBASE3) and (VALORREF <= VALORBASE4) then
    Result := (100 - PERCENT4) * VALORREF / 100
  else
  if (VALORREF > VALORBASE4) and (VALORREF <= VALORBASE5) then
    Result := (100 - PERCENT5) * VALORREF / 100
  else
  if (VALORREF >  VALORBASE5) then
    Result := 0;
end;

end.
