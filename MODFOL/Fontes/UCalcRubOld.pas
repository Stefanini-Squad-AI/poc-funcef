unit UCalcRub;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, uRegra, wwQuery,
     VcF1, uCalcIrrf; //Parser10;

procedure CalcBenef (const bRescisao : Boolean; //qryRub : TwwQuery;
  var RegRegra, RegPessoa: string;
  var ValBene, ValBase:double;
  var TemLanc, QtdParc, QtdOcor: integer
);

procedure CalcBenef2(var RegRegra:string; var RegPessoa:string; var ValBene: double);

procedure uCalRetro (
  const RegRegra, RegPessoa: string;
  var ValRetro, ValBase, PercRetro: double;
  IndMes: integer
);

function RegraBooleana(sNumRegra,sSQL:string; var bErro:boolean): boolean;

function RegraNumerica(sNumRegra,sSQL:string; var bErro:boolean): string;

function FormaCalculo ({qryRub: TwwQuery; }sRegra, RegPessoa: String): Real;


// Nas 3 funcoes abaixo, se TipoFolha = -1 faz para todos os tipos
function SomaHistRub (CodRubrica:string; DataRef: TDate;
                      QtdeMeses, TipoFolha:Integer): Real;

function MediaHistRub (CodRubrica:string; DataRef: TDate;
                       QtdeMeses, TipoFolha:Integer): Real;

function QtdeHistRub (CodRubrica:string; DataRef: TDate;
                      QtdeMeses, TipoFolha:Integer): Real;

function DiasTrab (DataRef: TDate; OpcaoDiasTrab:Integer): Real;
// Retorna a Qtde de dias trabalhados Mes correspondente a DataRef, conforme a OpcaoDiasTrab
// 1 = Desconta só Admissão e Demissão
// 2 = Desconta Admissão, Demissão, Afastamento e Retorno
// 3 = Desconta Admissão, Demissão e Férias
// 4 = Desconta Admissão, Demissão, Afastamento, Retorno e Férias

function DiasFerias (InicioFerias:TDate; OpcaoFerias:Integer): Real;
// Retorna a Qtde de dias de ferias cujo inicio de gozo seja em InicioFerias
// Se OpcaoFerias = 0 Sem adicionar os dias do Abono Pecuniário
// Se OpcaoFerias = 1 Com adição dos dias do Abono Pecuniário

function DiasFeriasNoMes (DataRef: TDate): Real;
// Retorna a Qtde de dias de gozo de ferias no Mes correspondente a DataRef

function RetornaFuncao (Texto:string): string;
// Retorna o resultado da funcao expressa em Texto

procedure InicializaFormula1;

procedure FinalizaFormula1;

function ExecutaFormula1(Expressao : String): Real;

function TABGENERICA(sTabela, sChave, sColPesq, sColCons, sOpcao:String) : String;

function TABLONGA   (Linha   : String) : String;

function TpDadoCons(NomeTabGener, Campo : String) : String;

function Indice(sIndexador, sData, sExato:String): String;

function IRRF(NumDep,DataNasc,ValorBase,DataRef,TipodeResultado:string):String;

function MAXIMO(formula:String) : String;

function MINIMO(formula:String) : String;

function Arredonda(FormulaLoc:string):string;

var
  iUltAno13, iUltMes13, iUltFlgOc13, iUltFlgAbo, iUltFlgOcor, iUltNumSq, iUltQtdParc,
  iUltDiasSaldoFerias, Ano13, Mes13, FlgOc13, FlgAbo, FlgOcor, NumSq, QtdParcFer,
  DiasSaldoFerias, iContRegQryIn: Integer;

  sUltPessoa, sUltDataFer1, sUltDataFer2, sUltDataFer3, sUltDataProx, SValor, sDataFer1,
  sDataFer2, sDataFer3, DataProx, sSQL: string;

  compRegra: TRegra;
  qryInRegra: TwwQuery;

  formula1 :tf1book;

implementation

uses uMensErro, uSistema, uAutorizacao, uFuncoesUteis, dFolha;

procedure CalcBenef (const bRescisao : Boolean; //qryRub : TwwQuery;
  var RegRegra, RegPessoa: string;
  var ValBene, ValBase:double;
  var TemLanc, QtdParc, QtdOcor: integer
);
var
  bBookMark, bErroRegra, bAlgRegra: boolean;
  SvNum : TBookMark;
begin
  //SvNum := qryRub.GetBookmark;
  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.SQL.Clear;
  dtmFolha.qryAux.SQL.Add('SELECT IDREGRA FROM ALGREGRA WHERE IDREGRA = '+ RegRegra);
  dtmFolha.qryAux.Open;
  bAlgRegra := (not dtmFolha.qryAux.IsEmpty);

  if (RegPessoa = sUltPessoa) then
  begin
    Ano13   := iUltAno13;
    Mes13   := iUltMes13;
    FlgOc13 := iUltFlgOc13;
    FlgAbo  := iUltFlgAbo;
    FlgOcor := iUltFlgOcor;
    NumSq   := iUltNumSq;
    sDataFer1  := sUltDataFer1;
    sDataFer2  := sUltDataFer2;
    sDataFer3  := sUltDataFer3;
    DataProx   := sUltDataProx;
    QtdParcFer := iUltQtdParc;
    DiasSaldoFerias := iUltDiasSaldoFerias;
  end
  else
  begin
    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT '+
      '  FERIAS.INIPERIODOFERIAS, FERIAS.INIGOZOFERIAS, FERIAS.NUMSEQ, '+
      '  FERIAS.FIMGOZOFERIAS, FERIAS.FLGOCORRIDA, FERIAS.FLGABONO, '+
      '  FERIAS.QTDPARCDEVOL '+
      'FROM '+
      '  FERIAS, PARAMRH '+
      'WHERE '+
      '  (FERIAS.IDPESSOA    = ' +RegPessoa+ ')      AND '+
      '  (PARAMRH.FERIASINI <= FERIAS.INIGOZOFERIAS) AND '+
      '  (PARAMRH.FERIASFIM >= FERIAS.INIGOZOFERIAS) ORDER BY FERIAS.INIGOZOFERIAS');
    dtmFolha.qryAux.Open;

    sDataFer1   := dtmFolha.qryAux.FieldByName('INIPERIODOFERIAS').asString;
    sDataFer2   := dtmFolha.qryAux.FieldByName('INIGOZOFERIAS').asString;
    sDataFer3   := dtmFolha.qryAux.FieldByName('FIMGOZOFERIAS').asString;
    FlgAbo      := dtmFolha.qryAux.FieldByName('FLGABONO').asInteger;
    FlgOcor     := dtmFolha.qryAux.FieldByName('FLGOCORRIDA').asInteger;
    NumSq       := dtmFolha.qryAux.FieldByName('NUMSEQ').asInteger;
    QtdParcFer  := dtmFolha.qryAux.FieldByName('QTDPARCDEVOL').asInteger;

//    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT '+
      '  MIN(FERIAS.INIPERIODOFERIAS) AS PROXAQUISFER '+
      'FROM '+
      '  FERIAS '+
      'WHERE '+
      '  (FERIAS.IDPESSOA    = ' +RegPessoa+ ') AND '+
      '  (FERIAS.FLGOCORRIDA = 0)');
    dtmFolha.qryAux.Open;


    if (dtmFolha.qryAux.FieldByName('PROXAQUISFER').isNull) then
    begin
       dtmFolha.qryAux.Close;
       dtmFolha.qryAux.SQL.Clear;
       dtmFolha.qryAux.SQL.Add(
         'SELECT '+
         '  MAX(FERIAS.INIPERIODOFERIAS) AS PROXAQUISFER '+
         'FROM '+
         '  FERIAS '+
         'WHERE '+
         '  (FERIAS.IDPESSOA    = ' +RegPessoa+ ') AND '+
         '  (FERIAS.FLGOCORRIDA = 1)');
       dtmFolha.qryAux.Open;

       if (not dtmFolha.qryAux.FieldByName('PROXAQUISFER').isNull) then
       begin
         DataProx := dtmFolha.qryAux.FieldByName('PROXAQUISFER').asString;
         dtmFolha.qryAux.Close;
         DataProx := IncData(DataProx, 0,0,1);
       end
       else
       begin
         dtmFolha.qryAux.Close;
         dtmFolha.qryAux.SQL.Clear;
         dtmFolha.qryAux.SQL.Add(
           'SELECT '+
           '  DATAADMISSAO AS PROXAQUISFER '+
           'FROM '+
           '  FUNCIONARIO '+
           'WHERE '+
           '  (FUNCIONARIO.IDPESSOA = ' +RegPessoa+ ')');
         dtmFolha.qryAux.Open;
         DataProx := dtmFolha.qryAux.FieldByName('PROXAQUISFER').AsString;
         dtmFolha.qryAux.Close;
       end;
    end
    else
    begin
      DataProx := dtmFolha.qryAux.FieldByName('PROXAQUISFER').asString;
      dtmFolha.qryAux.Close;
    end;

    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT '+
      '  MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 + '+
      '  DECODE(FLGABONO,0,0,trunc((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2))),30) '+
      '  AS DIASACUMFERIAS '+
      '  FROM  FERIAS      '+
      'WHERE '+
      '  (FERIAS.IDPESSOA    = ' +RegPessoa+ ') AND '+
      '  (FERIAS.FLGOCORRIDA = 1)');
    dtmFolha.qryAux.Open;

    DiasSaldoFerias := dtmFolha.qryAux.FieldByName('DIASACUMFERIAS').AsInteger;
    if (DiasSaldoFerias > 0) then
      DiasSaldoFerias := 30 - DiasSaldoFerias;

    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT '+
      '  ANTECIP13.ANO, ANTECIP13.MES, ANTECIP13.FLGOCORRIDA '+
      'FROM '+
      '  ANTECIP13, PARAMRH '+
      'WHERE '+
      '  (ANTECIP13.IDPESSOA = ' + RegPessoa + ') AND '+
      '  (ANTECIP13.ANO      = TO_NUMBER(SUBSTR(TO_CHAR(PARAMRH.PGTO13INI,''DD/MM/YYYY''),7,4))) AND '+
      '  (ANTECIP13.MES      = TO_NUMBER(SUBSTR(TO_CHAR(PARAMRH.PGTO13INI,''DD/MM/YYYY''),4,2)))');
    dtmFolha.qryAux.Open;

    Ano13    := dtmFolha.qryAux.FieldByName('ANO').asInteger;
    Mes13    := dtmFolha.qryAux.FieldByName('MES').asInteger;
    FlgOc13  := dtmFolha.qryAux.FieldByName('FLGOCORRIDA').asInteger;
    dtmFolha.qryAux.Close;
  end;

  // Regra de Cálculo do Valor
  sSQL :=
    'SELECT '+
    '  PESSOAFISICA.*, FUNCIONARIO.*, SITFUNC.TIPOSIT, '+
    '  PARAMRH.LIMADM, PARAMRH.LIMDEM, PARAMRH.FERIASINI, PARAMRH.FERIASFIM, ';
    if bRescisao then
       sSQL := sSQL + '  FUNCIONARIO.DATADESLIGAMENTO + 1 - ' +
                      '  TO_NUMBER(TO_CHAR(FUNCIONARIO.DATADESLIGAMENTO,''DD'')) '+
                      '  AS NORMALINI,'+
                      '  ADD_MONTHS(FUNCIONARIO.DATADESLIGAMENTO,1) -' +
                      '  TO_NUMBER(TO_CHAR(ADD_MONTHS(FUNCIONARIO.DATADESLIGAMENTO,1),''DD''))'+
                      '  AS NORMALFIM, '
    else
       sSQL := sSQL + '  PARAMRH.NORMALINI, PARAMRH.NORMALFIM, ';
  sSQL := sSQL +
    '  HORATRAB.JORNADAMENSAL, '+
    '  FUNCIONARIO.IDEMPRESA AS IDPESSJUR, '+
    '  FUNCIONARIO.IDPESSOA  AS IDTITULAR, '+
    '  FE.INIPERIODOFERIAS,   FE.INIGOZOFERIAS,  FE.FIMGOZOFERIAS, '+
    '  FE.FLGOCORRIDA, FE.FLGABONO,  FE.QTDPARCDEVOL, '+
    '  FE.FLGABONO, FE.FLGOCORRIDA, FE.NUMSEQ, '+
    '  TO_DATE(''' +DataProx+  ''',''DD/MM/YYYY'') AS PROXAQUISFER, '+
    OraNumero(FloatToStr(ValBene)) + ' AS VALORRUBRICA,  ' +
    OraNumero(FloatToStr(ValBase)) + ' AS BSRUBRICA, ' +
    IntToStr(TemLanc) + ' AS TEMLANCAMENTO, '+
    IntToStr(QtdParc) + ' AS PARCELAS, '+
    IntToStr(QtdOcor) + ' AS NUMOCORRENCIAS, '+
    IntToStr(DiasSaldoFerias) + ' AS SALDOFERIAS, '+
    IntToStr(Ano13)   + ' AS ANO, '+
    IntToStr(Mes13)   + ' AS MES, '+
    IntToStr(FlgOc13) + ' AS FLGOCORR13 '+
    'FROM '+
    '  PESSOAFISICA, FUNCIONARIO, SITFUNC, HORATRAB, PARAMRH, '+
    '  (SELECT '+
    '  FERIAS.INIPERIODOFERIAS, FERIAS.INIGOZOFERIAS, FERIAS.NUMSEQ, '+
    '  FERIAS.FIMGOZOFERIAS, FERIAS.FLGOCORRIDA, FERIAS.FLGABONO, '+
    '  FERIAS.QTDPARCDEVOL, FERIAS.IDPESSOA '+
    ' FROM '+
    '  FERIAS, PARAMRH '+
    ' WHERE '+
    '  (FERIAS.IDPESSOA    = ' +RegPessoa+ ') AND '+
    '  (PARAMRH.FERIASINI <= FERIAS.INIGOZOFERIAS) AND '+
    '  (PARAMRH.FERIASFIM >= FERIAS.INIGOZOFERIAS)) FE '+
    'WHERE '+
    '  (PESSOAFISICA.IDPESSOA = ' +RegPessoa+ ') AND '+
    '  (FUNCIONARIO.IDPESSOA  = ' +RegPessoa+ ') AND '+
    '  (FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC) AND '+
    '  (FUNCIONARIO.IDHORARIO = HORATRAB.IDHORARIO(+)) AND '+
    '  (FUNCIONARIO.IDPESSOA  = FE.IDPESSOA(+))  ORDER BY FE.INIGOZOFERIAS';

  if bAlgRegra then
  begin
      sValor := RegraNumerica(RegRegra, sSQL, bErroRegra);

      if (sValor <> '') then
      begin
        sValor  := ClienteNumero(sValor);
        ValBene := StrToFloat(sValor);
      end
      else
      begin
        if (bErroRegra) then
        begin
          MsgDlg('Erro na execução da Regra', 'Erro', mtError,[mbOk,mbHelp],0);
          exit;
        end;
      end;
  end
  else
     ValBene := FormaCalculo ({qryRub,} RegRegra, RegPessoa); 

  sUltPessoa   := RegPessoa;
  iUltAno13    := Ano13;
  iUltMes13    := Mes13;
  iUltFlgOc13  := FlgOc13;
  iUltFlgAbo   := FlgAbo;
  iUltFlgOcor  := FlgOcor;
  iUltNumSq    := NumSq;
  sUltDataFer1 := sDataFer1;
  sUltDataFer2 := sDataFer2;
  sUltDataFer3 := sDataFer3;
  sUltDataProx := DataProx;
  iUltQtdParc  := QtdParcFer;
  iUltDiasSaldoFerias := DiasSaldoFerias;
  //qryRub.GotoBookmark(SvNum);
end;

procedure CalcBenef2(var RegRegra:string; var RegPessoa:string; var ValBene: double);
var
  bErroRegra: boolean;
  sValor, sSQL: string;
begin
  // Regra de Cálculo do Valor
  //ValBene := 0;
{   sSQL := 'SELECT * FROM PESSOA,PESSOAFISICA,FUNCIONARIO ' +
           'WHERE PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA AND ' +
           'PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA AND ' +
           'PESSOA.IDPESSOA = ' +  RegPessoa;
}
  sSQL := 'SELECT PESSOAFISICA.*, FUNCIONARIO.*, ' + OraNumero(FloatToStr(ValBene)) +
          ' AS BSRUBRICA FROM PESSOAFISICA,FUNCIONARIO ' +
          'WHERE PESSOAFISICA.IDPESSOA = ' + RegPessoa + ' AND ' +
          'FUNCIONARIO.IDPESSOA = ' +  RegPessoa;

  sValor := RegraNumerica(RegRegra, sSQL, bErroRegra);

  if (sValor <> '') then
  begin
    sValor  := ClienteNumero(sValor);
    ValBene := StrToFloat(sValor);
  end
  else
  begin
    if (bErroRegra) then
    begin
      MsgDlg('Erro na execução da Regra', 'Erro', mtError, [mbOk,mbHelp], 0);
      exit;
    end;
  end;
end;

procedure uCalRetro (
  const RegRegra, RegPessoa: string;
  var ValRetro, ValBase, PercRetro: double;
  IndMes: integer
);
var
  sValor, sSQL: string;
  bErroRegra: boolean;
begin
  // Regra de Cálculo do Valor
  sSQL :=
    'SELECT '+
    '  PESSOAFISICA.*, FUNCIONARIO.*, SITFUNC.TIPOSIT, '+
    '  PARAMRH.FERIASINI, PARAMRH.FERIASFIM, '+
    '  PARAMRH.NORMALINI, PARAMRH.NORMALFIM, HORATRAB.JORNADAMENSAL, '+
    OraNumero(FloatToStr(ValBase))+   ' AS BSRUBRICA, '+
    OraNumero(FloatToStr(PercRetro))+ ' AS PERCRETRO, '+
    IntToStr(IndMes) + ' AS MESRETRO, '+
    '  FUNCIONARIO.IDEMPRESA AS IDPESSJUR '+
    'FROM '+
    '  PESSOAFISICA, FUNCIONARIO, SITFUNC, HORATRAB, PARAMRH '+
    'WHERE '+
    '  (PESSOAFISICA.IDPESSOA = ' +RegPessoa+ ') AND '+
    '  (FUNCIONARIO.IDPESSOA  = ' +RegPessoa+ ') AND '+
    '  (FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC) AND '+
    '  (FUNCIONARIO.IDHORARIO = HORATRAB.IDHORARIO(+))';

  sValor := RegraNumerica(RegRegra, sSQL, bErroRegra);

  if (sValor <> '') then
  begin
    sValor   := ClienteNumero(sValor);
    ValRetro := StrToFloat(sValor);
  end
  else
  begin
    if (bErroRegra) then
    begin
      MsgDlg('Erro na execução da Regra', 'Erro', mtError,[mbOk,mbHelp],0);
      exit;
    end;
  end;
end;

function RegraBooleana(sNumRegra,sSQL:string; var bErro:boolean): boolean;
begin
  Result:=false; bErro:=false;

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
  begin
    if (compRegra.Result = 'False') then
      Result := false
    else
      Result := true;
  end
  else
    bErro := true;

  qryInRegra.Close;
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

function FormaCalculo ({qryRub: TwwQuery; }sRegra, RegPessoa: String): Real;
var
  I, J, K : Integer;
  CodRub, Expressao, sResultFuncao : String;
  ValRub : Real;
  //Parser : TParser;

begin
  //Parser := TParser.Create(Application);
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DESCRICAOREGRA FROM REGRA WHERE IDREGRA = ' + sRegra);
    Open;
    Expressao := FieldByName('DESCRICAOREGRA').AsString;
    Close;
    SQL.Clear;
  end;
  Result := 0;
  Expressao := trim(Expressao);
  if Expressao = '' then exit;
  I := 0;
  iContRegQryIn := 0;

  with (dtmFolha.qryAuxFormaCalc) do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSql);
    Open;
  end;

  while not dtmFolha.qryAuxFormaCalc.Eof do
  begin
    inc(iContRegQryIn);

      // Substituir Rubricas
    {  while  I < length(Expressao) do
      begin
         //if pos('R(', copy(Expressao, I+1, length(Expressao) - I)) = 0 then break;
         //I := I + pos('R(', copy(Expressao, I+1, length(Expressao) - I));
         if pos('R(', Expressao) = 0 then break;
         I := I + pos('R(', Expressao);
         // Rotina para apanhar o valor da rubrica
         J := pos(')', copy(Expressao, I, length(Expressao) - I + 1));
         CodRub := copy(Expressao, I+2, J - 3);
         //qryRub.Filtered  := False;
         //qryRub.Filter    := 'CODPROVDESC = ' + QuotedStr(CodRub);
         //qryRub.Filtered  := True;
         qryRub.Locate('CODPROVDESC',CodRub,[]);
         //qryRub.First;
         ValRub := qryRub.FieldByName('ValEspeciais').asFloat;
         Expressao :=
          StringReplace(Expressao,'R('+CodRub+')',
                        StringReplace(FloatToStr(ValRub),',','.',[rfReplaceAll]),
                        [rfReplaceAll]);
         //qryRub.Filtered  := False;
         //I := I + J;
         I := 0;
      end;
    }
      I := 0;
      // Substituir Campos
      if (pos('C(', Expressao) > 0) then
      begin
          while  (I < length(Expressao)) do
          begin
             //if pos('C(', copy(Expressao, I+1, length(Expressao) - I)) = 0 then break;
             //I := I + pos('C(', copy(Expressao, I+1, length(Expressao) - I));
             if pos('C(', Expressao) = 0 then break;
             I := I + pos('C(', Expressao);
             // Rotina para apanhar o valor do campo
             J := pos(')', copy(Expressao, I, length(Expressao) - I + 1));
             CodRub := copy(Expressao, I+2, J - 3);
             Expressao :=
              StringReplace(Expressao,'C('+CodRub+')',
                            StringReplace(dtmFolha.qryAuxFormaCalc.FieldByName(CodRub).AsString,
                                          ',','.',[rfReplaceAll]),
                            [rfReplaceAll]);
             //I := I + J;
             I := 0;
          end;
      end;

      I := 0;
      // Substituir Funções
      if (pos('F%', Expressao) > 0) then
      begin
          while  (I < length(Expressao)) do
          begin
             //if pos('F%', copy(Expressao, I+1, length(Expressao) - I)) = 0 then break;
             //I := I + pos('F%', copy(Expressao, I+1, length(Expressao) - I));
             if pos('F%', Expressao) = 0 then break;
             I := I + pos('F%', Expressao);
             // Rotina para apanhar o valor do campo
             while True do
             begin
                J := pos(')',  copy(Expressao, I,   length(Expressao) - I + 1));
                K := pos('F%', copy(Expressao, I+1, length(Expressao) - I));
                if (K = 0) or (K+1 > J) then break else I := I + K;
             end;
             CodRub := copy(Expressao, I+2, J - 2);
             // Executa a Função Contida em CodRub
             sResultFuncao := RetornaFuncao (CodRub);
             //
             Expressao :=
              StringReplace(Expressao,'F%'+CodRub,
              StringReplace(sResultFuncao,',','.',[rfReplaceAll]),
              []);
             //I := I + J;
             I := 0;
          end;
      end;

      if Expressao <> '' then
         Result := ExecutaFormula1(Expressao);

      dtmFolha.qryAuxFormaCalc.Next;
  end;
  dtmFolha.qryAuxFormaCalc.Close;
end;

function SomaHistRub (CodRubrica:string; DataRef: TDate;
                      QtdeMeses, TipoFolha:Integer): Real;
begin
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT  SUM(H.VALORPROVENTO) AS VALORPROVENTO');
    SQL.Add('FROM   HISTRUBSAL H                          ');
    SQL.Add('WHERE (H.IDMODULO = 21)                      ');
    SQL.Add('AND   (H.IDPESSOA = ' + sUltPessoa +        ')');
    SQL.Add('AND   (H.MES >= ' + QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-QtdeMeses))+')');
    SQL.Add('AND   (H.MES <  ' + QuotedStr(RetornaAnoMes(DataRef))+')');
    SQL.Add('AND   (H.CODPROVDESC = ' + QuotedStr(CodRubrica)+')');
    SQL.Add('AND   (H.IDPESSJUR   = ' + IntToStr(Sistema.IdEmpresa)+')');
    SQL.Add('AND   (H.MES NOT LIKE ''%13'')               ');
    if TipoFolha <> -1 then
       SQL.Add('AND   (H.IDMOTIVO= ' + IntToStr(TipoFolha)+')');
    Open;
    Result := FieldByName('VALORPROVENTO').AsFloat;
    Close;
  end;
end;

function MediaHistRub (CodRubrica:string; DataRef: TDate;
                       QtdeMeses, TipoFolha:Integer): Real;
begin
  Result := 0;
  if QtdeMeses <= 0 then exit;
  Result := SomaHistRub (CodRubrica, DataRef, QtdeMeses, TipoFolha) / QtdeMeses;
end;

function QtdeHistRub (CodRubrica:string; DataRef: TDate;
                      QtdeMeses, TipoFolha:Integer): Real;
begin
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT  COUNT(H.VALORPROVENTO) AS VALORPROVENTO');
    SQL.Add('FROM   HISTRUBSAL H                          ');
    SQL.Add('WHERE (H.IDMODULO = 21)                      ');
    SQL.Add('AND   (H.IDPESSOA = ' + sUltPessoa +        ')');
    SQL.Add('AND   (H.MES >= '+QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-QtdeMeses))+')');
    SQL.Add('AND   (H.MES <  '+QuotedStr(RetornaAnoMes(DataRef))+')');
    SQL.Add('AND   (H.CODPROVDESC = '+QuotedStr(CodRubrica)+')');
    SQL.Add('AND   (H.IDPESSJUR= ' + IntToStr(Sistema.IdEmpresa)+')');
    SQL.Add('AND   (H.MES NOT LIKE ''%13'')               ');
    if TipoFolha <> -1 then
       SQL.Add('AND   (H.IDMOTIVO= ' + IntToStr(TipoFolha)+')');
    Open;
    Result := FieldByName('VALORPROVENTO').AsFloat;
    Close;
  end;
end;

function DiasTrab (DataRef: TDate; OpcaoDiasTrab:Integer): Real;
var
  wDiaIni,wMesIni,wAnoIni,wDiaFin,wMesFin,wAnoFin: word;
  DatIni, DatFim: TDate;
  AnoMes:string;
begin
  Result := 30;
  wDiaIni:= 1;
  AnoMes := RetornaAnoMes(DataRef);
  DatIni  := StrToDate('01/' + copy(AnoMes,6,2) + '/' + copy(AnoMes,1,4));
  DatFim  := StrToDate(IncData(DateToStr(DatIni), -1,1,0));
  with (dtmFolha.qryAuxFormaCalc) do
  begin
    // Admissao e Demissao Fora do Mes
    if (FieldByName('DATAADMISSAO').AsDateTime > DatFim) or
       ((FieldByName('DATADESLIGAMENTO').AsDateTime < DatIni) and
        (FieldByName('TIPOSIT').AsString = 'D'))  or
       ((FieldByName('DATADESLIGAMENTO').AsDateTime <= DatIni) and
        (FieldByName('TIPOSIT').AsString = 'F')) then
    begin
       Result := 0;
       exit;
    end;

    // Admissao e Demissao no Mes
    if (FieldByName('DATAADMISSAO').AsDateTime > DatIni) then
    begin
       DecodeDate(FieldByName('DATAADMISSAO').AsDateTime, wAnoIni, wMesIni, wDiaIni);
       Result := Result - wDiaIni + 1;
    end;

    if (FieldByName('DATADESLIGAMENTO').AsDateTime < DatFim) and
       (FieldByName('TIPOSIT').AsString = 'D') then
    begin
       DecodeDate(FieldByName('DATADESLIGAMENTO').AsDateTime, wAnoFin, wMesFin, wDiaFin);
       Result := wDiaFin - wDiaIni + 1;
    end;

    // Afastamento e Retorno no Mes
    if OpcaoDiasTrab in [2,4] then
    begin
      if (FieldByName('DATARETORNO').AsDateTime >  DatIni) and
         (FieldByName('DATARETORNO').AsDateTime <= DatFim) and
         (FieldByName('TIPOSIT').AsString = 'A') then
        begin
           DecodeDate(FieldByName('DATARETORNO').AsDateTime, wAnoIni, wMesIni, wDiaIni);
           Result := Result - wDiaIni + 1;
        end;

      if (FieldByName('DATADESLIGAMENTO').AsDateTime <= DatFim) and
         (FieldByName('DATADESLIGAMENTO').AsDateTime >  DatIni) and
         (FieldByName('TIPOSIT').AsString = 'F') then
        begin
           DecodeDate(FieldByName('DATADESLIGAMENTO').AsDateTime, wAnoFin, wMesFin, wDiaFin);
           Result := wDiaFin - wDiaIni;
        end;
    end;

    // Ferias no Mes
    if (OpcaoDiasTrab in [3,4]) and
       (FieldByName('FIMGOZOFERIAS').AsDateTime >= DatIni) and
       (FieldByName('INIGOZOFERIAS').AsDateTime <= DatFim) and
         (FieldByName('TIPOSIT').AsString = 'A') then
    begin
       DecodeDate(FieldByName('INIGOZOFERIAS').AsDateTime, wAnoIni, wMesIni, wDiaIni);
       DecodeDate(FieldByName('FIMGOZOFERIAS').AsDateTime, wAnoFin, wMesFin, wDiaFin);
       if (FieldByName('FIMGOZOFERIAS').AsDateTime > DatFim) then
         DecodeDate(FieldByName('NORMALFIM').AsDateTime, wAnoFin, wMesFin, wDiaFin);
       if (FieldByName('INIGOZOFERIAS').AsDateTime < DatIni) then
         wDiaIni := 1;
       Result := Result - (wDiaFin - wDiaIni + 1);
    end;

  end;
  if Result < 0  then Result :=  0;
  if Result > 30 then Result := 30;
end;

function DiasFerias (InicioFerias:TDate; OpcaoFerias:Integer): Real;
begin
  with (dtmFolha.qryAuxFormaCalc) do
  begin
    Result  := 0;
    if (FieldByName('INIGOZOFERIAS').AsString  <> '')           and 
       (FieldByName('INIGOZOFERIAS').AsDateTime = InicioFerias) then
    begin
       Result := FieldByName('FIMGOZOFERIAS').AsDateTime -
                 FieldByName('INIGOZOFERIAS').AsDateTime + 1;
       if (OpcaoFerias = 1) and (FieldByName('FLGABONO').AsInteger = 1) then
          Result := trunc(Result * 1.5);
    end;
  end;
end;

function DiasFeriasNoMes (DataRef: TDate): Real;
var
  wDiaIni,wMesIni,wAnoIni,wDiaFin,wMesFin,wAnoFin: word;
  DatIni, DatFim: TDate;
  AnoMes:string;
begin
  Result  := 0;
  AnoMes  := RetornaAnoMes(DataRef);
  DatIni  := StrToDate('01/' + copy(AnoMes,6,2) + '/' + copy(AnoMes,1,4));
  DatFim  := StrToDate(IncData(DateToStr(DatIni), -1,1,0));
  with (dtmFolha.qryAuxFormaCalc) do
  begin
    if (RetornaAnoMes(FieldByName('FIMGOZOFERIAS').AsDateTime) >= AnoMes) and
       (RetornaAnoMes(FieldByName('INIGOZOFERIAS').AsDateTime) <= AnoMes) then
    begin
       DecodeDate(FieldByName('INIGOZOFERIAS').AsDateTime, wAnoIni, wMesIni, wDiaIni);
       DecodeDate(FieldByName('FIMGOZOFERIAS').AsDateTime, wAnoFin, wMesFin, wDiaFin);
       if (FieldByName('FIMGOZOFERIAS').AsDateTime > DatFim) then
         DecodeDate(DatFim, wAnoFin, wMesFin, wDiaFin);
       if (FieldByName('INIGOZOFERIAS').AsDateTime < DatIni) then
         wDiaIni := 1;
       Result := (wDiaFin - wDiaIni + 1);
    end;
  end;
end;

function RetornaFuncao (Texto:string): string;
var
  NomeFuncao, Param1, Param2, Param3, Param4, Param5 : String;
  I, J, NumDias, NumMeses, NumAnos : Integer;
begin
  Result := '0';
  NomeFuncao := uppercase(trim(copy(Texto,1,pos('(',Texto)-1)));
  I          := pos('(',Texto)+1;
  J          := pos(';',Texto);
  if J = 0 then  J := pos(')',Texto);
  Param1     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + pos(';',copy(Texto,I,length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  pos(')',copy(Texto,I,length(Texto)-I+1));
  Param2     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + pos(';',copy(Texto,I,length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  pos(')',copy(Texto,I,length(Texto)-I+1));
  Param3     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + pos(';',copy(Texto,I,length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  pos(')',copy(Texto,I,length(Texto)-I+1));
  Param4     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + pos(';',copy(Texto,I,length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  pos(')',copy(Texto,I,length(Texto)-I+1));
  Param5     := trim(copy(Texto,I,J-I));

  if NomeFuncao = 'DIASTRAB' then
     if Param1 = '' then Result := '0'
     else  Result := FloatToStr(DiasTrab(StrToDate(Param1),StrToInt(Param2)))
  else
  if NomeFuncao = 'SOMAHISTRUB' then
     if Param2 = '' then Result := '0'
     else  Result := FloatToStr(SomaHistRub(Param1,StrToDate(Param2),StrToInt(Param3),StrToInt(Param4)))
  else
  if NomeFuncao = 'MEDIAHISTRUB' then
     if Param2 = '' then Result := '0'
     else  Result := FloatToStr(MediaHistRub(Param1,StrToDate(Param2),StrToInt(Param3),StrToInt(Param4)))
  else
  if NomeFuncao = 'QTDEHISTRUB' then
     if Param2 = '' then Result := '0'
     else  Result := FloatToStr(QtdeHistRub(Param1,StrToDate(Param2),StrToInt(Param3),StrToInt(Param4)))
  else
  if NomeFuncao = 'DIASFERIAS' then
     if Param1 = '' then Result := '0'
     else  Result := FloatToStr(DiasFerias(StrToDate(Param1),StrToInt(Param2)))
  else
  if NomeFuncao = 'DIASFERIASNOMES' then
     if Param1 = '' then Result := '0'
     else Result := FloatToStr(DiasFeriasNoMes(StrToDate(Param1)))
  else
  if (NomeFuncao = 'DIFDIAS')  or
     (NomeFuncao = 'DIFMESES') or
     (NomeFuncao = 'DIFANOS')  then
  begin
     CalculaData(Param1,Param2,NumDias,NumMeses,NumAnos);
     if NomeFuncao = 'DIFDIAS'  then  Result := IntToStr(NumDias)
     else
     if NomeFuncao = 'DIFANOS'  then  Result := IntToStr(NumAnos)
     else  Result := IntToStr(NumMeses);
  end
  else
  if NomeFuncao = 'INCDATA' then
     Result := IncData(Param1,StrToInt(Param2),StrToInt(Param3),StrToInt(Param4))
  else
  if NomeFuncao = 'TRAZULTDIAMES' then
     if Param1 = '' then Result := '0'
     else Result := IntToStr(TrazUltDiaMes(StrToInt(copy(Param1,4,2)),StrToInt(copy(Param1,7,4))))
  else
  if NomeFuncao = 'TRAZULTDIADATA' then
     if Param1 = '' then Result := ''
     else  Result := DateToStr(TrazUltDiaData(StrToDate(Param1)))
  else
  if NomeFuncao = 'RETORNAANOMES' then
     if Param1 = '' then Result := ''
     else  Result := RetornaAnoMes(StrToDate(Param1))
  else
  if NomeFuncao = 'ANOMES' then
     if Param1 = '' then Result := ''
     else  Result := AnoMes(StrToDate(Param1))
  else
  if NomeFuncao = 'EXTRAIDIA' then
     if Param1 = '' then Result := '0'
     else  Result := IntToStr(ExtraiDia(StrToDate(Param1)))
  else
  if NomeFuncao = 'EXTRAIMES' then
     if Param1 = '' then Result := '0'
     else  Result := IntToStr(ExtraiMes(StrToDate(Param1)))
  else
  if NomeFuncao = 'EXTRAIANO' then
     if Param1 = '' then Result := '0'
     else  Result := IntToStr(ExtraiAno(StrToDate(Param1)))
  else
  if NomeFuncao = 'JUROCOMPOSTO' then
     Result := FloatToStr(JuroComposto(StrToFloat(Param1),StrToInt(Param2),StrToFloat(Param3)))
  else
  if NomeFuncao = 'INDICE' then
     Result := Indice(Param1,Param2,Param3)
  else
  if NomeFuncao = 'TABGENERICA' then
     Result := TabGenerica(Param1,Param2,Param3,Param4,Param5)
  else
  if NomeFuncao = 'TABLONGA' then
  begin
     Param1 := trim(copy(Texto,pos('(',Texto)+1,length(Texto)-pos('(',Texto)-1));
     Result := TabLonga(Param1);
  end
  else
  if NomeFuncao = 'MAXIMO' then
  begin
     Param1 := trim(copy(Texto,pos('(',Texto)+1,length(Texto)-pos('(',Texto)-1));
     Result := Maximo(Param1);
  end
  else
  if NomeFuncao = 'MINIMO' then
  begin
     Param1 := trim(copy(Texto,pos('(',Texto)+1,length(Texto)-pos('(',Texto)-1));
     Result := Minimo(Param1);
  end
  else
  if NomeFuncao = 'IRRF' then
     Result := IRRF(Param1,Param2,Param3,Param4,Param5)
  else
  if NomeFuncao = 'REGATU' then
     Result := IntToStr(iContRegQryIn)
  else
  if NomeFuncao = 'TOTREGS' then
     Result := IntToStr(dtmFolha.qryAuxFormaCalc.RecordCount)
  else
  begin
     if NomeFuncao = 'SE' then
        Texto := StringReplace(Texto,'SE(','IF(',[rfReplaceAll])
     else
     if NomeFuncao = 'TRUNCA' then
        Texto := StringReplace(Texto,'TRUNCA(','TRUNC(',[rfReplaceAll])
     else
     if NomeFuncao = 'DATANUM' then
        Texto := 'DATE(' + copy(Param1,7,4) + ';' + copy(Param1,4,2) + ';' + copy(Param1,1,2) + ')'
     ;
     Result := FloatToStr(ExecutaFormula1(Texto));
{     Result := '0';
     I := Pos('=',Param1);
     if I = 0 then I := Pos('<',Param1);
     if I = 0 then I := Pos('>',Param1);
     if I > 0 then
     begin
        //Param1 := StringReplace(Param1,'.',',',[rfReplaceAll, rfIgnoreCase]);
        //Param2 := StringReplace(Param2,'.',',',[rfReplaceAll, rfIgnoreCase]);
        //Param3 := StringReplace(Param3,'.',',',[rfReplaceAll, rfIgnoreCase]);
        Param1 := FloatToStr(ExecutaFormula1(Param1));
        Param2 := FloatToStr(ExecutaFormula1(Param2));
        Param3 := FloatToStr(ExecutaFormula1(Param3));
        Param4 := trim(copy(Param1,I,2));
        if Param4 = '=' then
           Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) =
                                StrToFloat(copy(Param1,I+2,length(Param1))),
                                StrToFloat(Param2),StrToFloat(Param3)))
        else
        if Param4 = '<' then
           Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) <
                                StrToFloat(copy(Param1,I+2,length(Param1))),
                                StrToFloat(Param2),StrToFloat(Param3)))
        else
        if Param4 = '>' then
           Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) >
                                StrToFloat(copy(Param1,I+2,length(Param1))),
                                StrToFloat(Param2),StrToFloat(Param3)))
        else
        if Param4 = '>=' then
           Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) >=
                                StrToFloat(copy(Param1,I+2,length(Param1))),
                                StrToFloat(Param2),StrToFloat(Param3)))
        else
        if Param4 = '<=' then
           Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) <=
                                StrToFloat(copy(Param1,I+2,length(Param1))),
                                StrToFloat(Param2),StrToFloat(Param3)))
        else
        if Param4 = '<>' then
           Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) <>
                                StrToFloat(copy(Param1,I+2,length(Param1))),
                                StrToFloat(Param2),StrToFloat(Param3)));
     end;
}
  end
  ;
end;

procedure InicializaFormula1;
begin
  formula1 := TF1book.Create(Application);   //Cria a planilha
end;

procedure FinalizaFormula1;
begin
  formula1.free;
end;

function ExecutaFormula1(Expressao : String): Real;
begin
  //Expressao := StringReplace(Expressao,',','.',[rfReplaceAll, rfIgnoreCase]);
  Expressao := StringReplace(Expressao,'.',',',[rfReplaceAll]);
  Expressao := StringReplace(Expressao,' ','',[rfReplaceAll]);
  try
     formula1.maxcol:=1;
     formula1.maxrow:=1;
     formula1.col:=1;
     formula1.row:=1;
     formula1.formula := Expressao;
     Result := StrToFloat(formula1.Text);
  except
     Result := 0;
  end;
end;

function TABGENERICA(sTabela, sChave, sColPesq, sColCons, sOpcao:String) : String;
var
  sTipoDado, sSqlAux2, sSqlAux,
  sValorAux, vFormula, vRes, sCond, sOrder, sValorCampo, sLinha, AuxCampo:String;
  Numero, FError : Boolean;
  Vlr : Real;
begin
// Caso Tipo de Pesquisa inválido, pesquisa igual (0)
  if (sOpcao <> '0') and (sOpcao <> '1') and (sOpcao <> '2') then
     sOpcao := '0';
//------------------------------------------------------------------------------
// Monta Condicoes do SQL de acordo com o Tipo de Pesquisa
  if (sOpcao = '0') or (sOpcao = '') then begin
     sCond := ' = ';
     sOrder := '';
  end;

  if sOpcao = '1' then begin
     sCond := ' <= ';
     sOrder := ' ORDER BY 1 DESC ';
  end;

  if sOpcao = '2' then begin
     sCond := ' >= ';
     sOrder := ' ORDER BY VALOR' ;
  end;

//------------------------------------------------------------------------------
// Busca o Tipo de Dado do campo pesquisado na Tabela Genérica
  sSqlAux := 'SELECT '+
             '  IDTIPODADO    '+
             'FROM   '+
             '  CAMPOTABGENER '+
             'WHERE  '+
             '  CODTABELA = '+QuotedStr(sTabela)+' AND '+
             '  CODCAMPO  = '+UpperCase(QuotedStr(sColPesq));
//             '  UPPER(CODCAMPO) = '+UpperCase(sColPesq);

// Fecha e Abre a Query de Pesquisa
  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.SQL.Clear;
  dtmFolha.qryAux.Sql.Add(sSqlAux);
  try
      dtmFolha.qryAux.Open;
    // Guarda Tipo de dado do campo pesquisado
      sTipoDado := dtmFolha.qryAux.FieldByName('IDTIPODADO').AsString;
      dtmFolha.qryAux.Close;

      Numero := False;
      FError := False;
  except
      FError := True;
  end;

  If Not FError Then Begin

// Tipo de Dado NUMERICO
    If sTipoDado = '1' Then Begin
// Acerta Valor de pesquisa
      sChave := OraNumero(sChave);
//      sChave := Copy(sChave,2,Length(sChave)); //???????????????
//      sChave := Copy(sChave,1,Length(sChave)-1); //??????????????
// Acerda ordenacao
      If sOpcao = '1' Then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','','')) DESC '
      Else If sOpcao = '2' Then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','',''))      ';


// Seta indicados de valor numerico
      Numero := True;
// Monta e Executa a Consulta do Valor Desejado
      sSqlAux2 := 'SELECT '+
                  '  VALOR, NUMLINHA '+
                  'FROM   '+
                  '  (   '+
                  '   SELECT '+
                  '     REPLACE(VALOR,'','',''.'') AS VALOR, NUMLINHA '+
                  '   FROM   '+
                  '     VALTABGENER  '+
                  '   WHERE  '+
                  '     CODTABELA = '+QuotedStr(sTabela)            +' AND '+
                  '     CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+
                  '  ) A '+
                  'WHERE TO_NUMBER(REPLACE(VALOR,''.'','','')) '+
                    sCond +
                    sChave+
                    sOrder;
// Abre a Consulta
      dtmFolha.qryAux.Sql.Clear;
      dtmFolha.qryAux.Sql.Add(sSqlAux2);
      dtmFolha.qryAux.Open;
// Guarda a linha do valor desejado
      sLinha := dtmFolha.qryAux.FieldByName('NUMLINHA').AsString;

    End else begin

// Tipo de Dado ALFANUMERICO
      If sTipoDado = '2' Then Begin
        sValorCampo := ' Valor ';
      End Else Begin

// Tipo de Dado DATA
        If sTipoDado = '3' then begin
           sValorCampo := 'TO_DATE(Valor,''DD/MM/YYYY'')';
           sChave:='TO_DATE('+schave+',''DD/MM/YYYY'')';

        End Else Begin
// Outro Tipo ERRO
          If sColPesq<>'''NUMLINHA''' Then Begin
            FError := True;
            Result := '-6010'
          End Else Begin
            sValorCampo := ' Valor ';
          End;
        End;

      End;
    End;

//------------------------------------------------------------------------------
// Caso não seja Numero Continua Rotina
    If Not Numero Then Begin

      If sColPesq <> '''NUMLINHA''' Then Begin

        If Not FError Then Begin

// Caso Dado tipo DATA
          If sTipoDado = '3' Then Begin
            sSqlAux := 'SELECT TO_DATE(VALOR,''DD/MM/YYYY'') AS VALOR, NUMLINHA '+
                       'FROM VALTABGENER '+
                       'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                       '      CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+' AND '+
                        sValorCampo+sCond+sChave+' '+
                        sOrder;
          End Else Begin
            sSqlAux := 'SELECT VALOR, NUMLINHA '+
                       'FROM VALTABGENER '+
                       'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                       '      CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+' AND '+
                       sValorCampo+sCond+sChave+' '+
                       sOrder;
          End;

          If sValorAux = '' Then
            sValorAux := sValorCampo;

          If sTipoDado = '1' Then Begin
            sSqlAux2 := 'SELECT TO_NUMBER(REPLACE(VALOR,''.'','','')) VALOR, NUMLINHA '+
                        'FROM VALTABGENER '+
                        'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                        '      CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+' AND '+
                        sValorAux+sCond+sChave+' '+
                        sOrder;
          End;

          dtmFolha.qryAux.Close;
          dtmFolha.qryAux.Sql.clear;
          dtmFolha.qryAux.Sql.add(sSqlAux);
          dtmFolha.qryAux.Open;

          sLinha := dtmFolha.qryAux.FieldByName('NUMLINHA').AsString;

          if (sLinha = '') and (sTipoDado = '1') then begin
             dtmFolha.qryAux.Close;
             dtmFolha.qryAux.Sql.Clear;
             dtmFolha.qryAux.Sql.Add(sSqlAux2); // SQL feito para acabar com o bug do Oracle 8.0
             dtmFolha.qryAux.Open;
             sLinha := dtmFolha.qryAux.FieldByName('NUMLINHA').AsString;
          end;

          if sLinha = '' then begin
             FError := True;
             Result := '';
          end;

        end;

      end else

      slinha:=sChave;

    end;

    if sLinha = '' then begin
      Result := '';
      Exit;
    end;

    If Not FError Then Begin

      sSqlAux := 'SELECT VALOR '+
                 'FROM VALTABGENER '+
                 'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                 '      CODCAMPO  = '+UpperCase(QuotedStr(sColCons))+' AND '+
                 '      NUMLINHA = '+sLinha;
      dtmFolha.qryAux.Close;
      dtmFolha.qryAux.Sql.clear;
      dtmFolha.qryAux.Sql.add(sSqlAux);
      dtmFolha.qryAux.Open;
      Result := dtmFolha.qryAux.FieldByName('VALOR').AsString;
    End;

    FError := False;
  End;

// Caso Resultado Nulo, Retorna 1 espaço.
  if Result = '' then
     Result := ' ';

end;

//******************************************************************************
// Formula, Consulta na Tabela Genérica
Function TABLONGA(Linha:String):String;
Var
   Formula, vTipo, wAux, wSQL, vSql, wTabela, wCampoResult,
   sTabela, Aux,  Reg, vOpAux, spar, vCmp, vOp, vVal : string;
   i, x : integer;
   QryAux : TwwQuery;
   Achou : Boolean;
Begin

  Formula := Linha;

  i := Pos('[',Formula);
  Aux := Copy(Formula,i+1,Length(Formula));
  i := Pos(']',Aux);
  Aux := Copy(Aux,1,i-1);

  i := Pos(']',Formula);
  Formula := Copy(Formula,i+1,Length(Formula));
  i := Pos(';',Formula);
  sTabela := Copy(Formula,1,i-1);
  //sTabela := PegaValor(sTabela);
  Formula := Copy(Formula,i+1,Length(Formula));
  i := Pos(';',Formula);
  sCampoRet := Copy(Formula,1,i-1);
  //sCampoRet := PegaValor(sCampoRet);
  Formula := Copy(Formula,i+1,Length(Formula));
  i := Pos(';',Formula);
  if i > 0 then begin
     vTipo := Copy(Formula,i+1,Length(Formula));
     //vTipo := PegaValor(vTipo);
  end else begin
       vTipo := Formula;
       i := Pos('"',Formula);
       if i > 0 then
          vTipo := Copy(Formula,i+1,Length(Formula));
       i := Pos('"',vTipo);
       if i > 0 then
          vTipo := Copy(vTipo,1,i-1);
       //vTipo := PegaValor(vTipo);
       if vTipo <> '1' then
          vTipo := '0';
  end;

  for i := 1 to 10 do begin
      TabChaves[i].Campo := '';
      TabChaves[i].Valor := '';
      TabChaves[i].Op    := '';
      TabChaves[i].Tipo  := '';
  end;


  if vTipo = '1' then begin //caso vtipo seja igual a "um", consulta por CAMPOTABGENER (Tabela genérica)
     x := 1;
     repeat
           i :=   Pos(';',Aux);
           if i > 0 then begin
              Reg := Copy(Aux,1,i-1);
              Aux := Copy(Aux,i+1,Length(Aux));
           end else begin
              Reg := Aux;
              Aux := '';
           end;
           if Pos('>=', Reg) > 0 then begin
              vCmp := Copy(Reg,1,Pos('>=',Reg)-1);
              vVal := Copy(Reg,Pos('>=',Reg)+2,Length(Reg));
              //TabChaves[x].Campo := PegaValor(vCmp);
              //TabChaves[x].Valor := PegaValor(vVal);
              TabChaves[x].Campo := vCmp;
              TabChaves[x].Valor := vVal;
              TabChaves[x].Op    := '>=';
              TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
           end else begin
               if Pos('<=', Reg) > 0 then begin
                  vCmp := Copy(Reg,1,Pos('<=',Reg)-1);
                  vVal := Copy(Reg,Pos('<=',Reg)+2,Length(Reg));
                  //TabChaves[x].Campo := PegaValor(vCmp);
                  //TabChaves[x].Valor := PegaValor(vVal);
                  TabChaves[x].Campo := vCmp;
                  TabChaves[x].Valor := vVal;
                  TabChaves[x].Op    := '<=';
                  TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
               end else begin
                   if Pos('>', Reg) > 0 then begin
                      vCmp := Copy(Reg,1,Pos('>',Reg)-1);
                      vVal := Copy(Reg,Pos('>',Reg)+1,Length(Reg));
                      //TabChaves[x].Campo := PegaValor(vCmp);
                      //TabChaves[x].Valor := PegaValor(vVal);
                      TabChaves[x].Campo := vCmp;
                      TabChaves[x].Valor := vVal;
                      TabChaves[x].Op    := '>';
                      TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
                   end else begin
                       if Pos('<', Reg) > 0 then begin
                          vCmp := Copy(Reg,1,Pos('<',Reg)-1);
                          vVal := Copy(Reg,Pos('<',Reg)+1,Length(Reg));
                          //TabChaves[x].Campo := PegaValor(vCmp);
                          //TabChaves[x].Valor := PegaValor(vVal);
                          TabChaves[x].Campo := vCmp;
                          TabChaves[x].Valor := vVal;
                          TabChaves[x].Op    := '<';
                          TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
                       end else begin
                           if Pos('=', Reg) > 0 then begin
                              vCmp := Copy(Reg,1,Pos('=',Reg)-1);
                              vVal := Copy(Reg,Pos('=',Reg)+1,Length(Reg));
                              //TabChaves[x].Campo := PegaValor(vCmp);
                              //TabChaves[x].Valor := PegaValor(vVal);
                              TabChaves[x].Campo := vCmp;
                              TabChaves[x].Valor := vVal;
                              TabChaves[x].Op    := '=';
                              TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
                           end;
                       end;
                   end;
               end;
           end;
           spar := TabChaves[x].Op;
           Inc(x);
     until Aux = '';

     with dtmFolha.QryAux do begin
          Close;
          Sql.Clear;
          vSql := 'SELECT V.NUMLINHA, V.CODCAMPO, V.VALOR FROM	VALTABGENER V, ';
          for i := 1 to 10 do begin
              if TabChaves[i].Campo <> '' then begin
                 if (TabChaves[i].Tipo = 'N') then begin
                    vSql := vSql + '(SELECT AUX.NUMLINHA, AUX.CODCAMPO, AUX.VALOR FROM '+
                                   '(SELECT NUMLINHA, CODCAMPO, CODTABELA, TO_NUMBER(VALOR, ''99999999999.9999'') AS VALOR FROM VALTABGENER) AUX '+
                                   ' WHERE (AUX.CODTABELA = '''+sTabela+''') AND '+
                                   '(AUX.CODCAMPO = '''+TabChaves[i].Campo+''') AND (AUX.VALOR'+TabChaves[i].Op+{pegavalor}(tabchaves[i].valor)+')) X'+InttoStr(i);
                    if TabChaves[i+1].Campo <> '' then
                       vSql := vSql + ', ';
                 end else begin
                     if (TabChaves[i].Tipo = 'A') then begin
	                vSql := vSql + '(SELECT NUMLINHA, CODCAMPO, VALOR FROM VALTABGENER WHERE (CODTABELA = '''+sTabela+''') AND ';
                        vSql := vSql + '(CODCAMPO = '''+TabChaves[i].Campo+''') AND (VALOR'+TabChaves[i].Op+''''+{pegavalor}(tabchaves[i].valor)+''')) X'+InttoStr(i);
                        if TabChaves[i+1].Campo <> '' then
                           vSql := vSql + ', ';
                     end else begin
                         vSql := vSql + '(SELECT NUMLINHA, CODCAMPO, VALOR FROM VALTABGENER WHERE (CODTABELA = '''+sTabela+''') AND ';
                         vSql := vSql + '(CODCAMPO = '''+TabChaves[i].Campo+''') AND (TO_DATE(VALOR,''DD/MM/YYYY'')'+TabChaves[i].Op+
                                        'TO_DATE('''+{pegavalor}(tabchaves[i].valor)+''',''DD/MM/YYYY''))) X'+InttoStr(i);
                         if TabChaves[i+1].Campo <> '' then
                            vSql := vSql + ', ';
                     end;
                 end;
              end;
          end;
          vSql := vSql + ' WHERE (V.CODTABELA = '''+sTabela+''') AND (V.CODCAMPO = '''+sCamporet+''')';
          for i := 1 to 10 do begin
              if (i > 1) and (TabChaves[i].Campo <> '') then
                 vSql := vSql + 'AND (X1.NUMLINHA = X'+InttoStr(i)+'.NUMLINHA) ';

              if TabChaves[i].Campo <> '' then
                 vSql := vSql + 'AND (V.NUMLINHA = X'+InttoStr(i)+'.NUMLINHA) ';
          end;
          vSql := vsql + 'ORDER BY V.NUMLINHA';
          Sql.Add(vSql);
          Open;
     end;
     if spar='<=' then
        dtmFolha.QryAux.last;

     Result := dtmFolha.QryAux.FieldbyName('VALOR').AsString;
     dtmFolha.QryAux.Close;
  end else begin  //caso seja diferente de zero consulta por LONGTABGENER (Table genérica longa)
      Result := '';
      wSQL := Copy(Trim(Linha),2,(Pos(']',Trim(Linha))-2));
      If Trim(wSQL) = '' Then Begin
         MsgDlg('Erro nos parâmetros da pesquisa ...','Atenção',mterror,[mbOk],0);
         Result := '0';
         Exit;
      End;
      //wSQL := TrocaLetra(',',' AND ',wSQL);
      wSQL := StringReplace(wSQL,';',' AND ',[rfReplaceAll]);
      wAux := wSql;
      Linha        := Copy(Linha,(Pos(']',Linha)+1),Length(Linha));
      wTabela      := trim(Copy(Linha,(Pos(']',Linha)+1),(Pos(';',Linha)-1)));
      wCampoResult := trim(Copy(Linha,(Pos(';',Linha)+1),Length(Linha)));
      if Pos(';',Linha) <> 0 then
         wCampoResult := trim(UpperCase(Copy(Linha,(Pos(';',Linha)+1), Length(Linha))));
      //wCampoResult:=pegavalor(wCampoResult);

      with dtmFolha.QryAux do begin
           Close;
           Sql.Clear;
           vSql := 'SELECT LC.IDTABELA,LC.IDCAMPO,LC.DESCRICAO AS DESCRICAO FROM LONGCMPTABGENER LC, '+
	          '(SELECT IDTABELA, DESCRICAO FROM LONGTABGENER WHERE DESCRICAO = '''+wTabela+''') L '+
                  'WHERE LC.IDTABELA = L.IDTABELA';
           Sql.Add(vSql);
           Open;
      end;

      if dtmFolha.QryAux.Locate('DESCRICAO',wCampoResult,[]) then
         wCampoResult := 'C'+dtmFolha.QryAux.FieldbyName('IDCAMPO').AsString
      else begin
           MsgDlg('Erro nos parâmetros da pesquisa ...','Atenção',mterror,[mbOk],0);
           Result := '0';
           Exit;
      end;

      vSql := 'SELECT IDTABELA, NUMLINHA, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, '+
	     'C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, '+
	     'C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, '+
	     'C47, C48, C49, C50, C51, C52, C53, C54, C55, C56, C57, C58, C59, C60, C61, C62, '+
	     'C63, C64, C65, C66, C67, C68, C69, C70, C71, C72, C73, C74, C75, C76, C77, C78, '+
	     'C79, C80, C81, C82, C83, C84, C85, C86, C87, C88, C89, C90, C91, C92, C93, C94, '+
	     'C95, C96, C97, C98, C99, C100 FROM LONGVALTABGENER WHERE '+
	     'IDTABELA = '+dtmFolha.QryAux.FieldbyName('IDTABELA').AsString+' AND ';
      repeat
           i := Pos('=',wAux);
           Achou := False;
           if (Copy(wAux,i-1,1) = '<') or (Copy(wAux,i-1,1) = '>') or (Copy(wAux,i-1,1) = '=') then begin
              i := i -1;
              Achou := True;
           end;
           vCmp := Copy(wAux, 1,i-1); //Campo
           //vCmp := pegavalor(vCmp);
           if dtmFolha.QryAux.Locate('DESCRICAO',vCmp,[]) then
              vCmp := 'C'+dtmFolha.QryAux.FieldbyName('IDCAMPO').AsString;

           wAux := Copy(wAux, i, Length(wAux));
           if Achou then begin
              vOp :=Copy(wAux,1,2); //Operando
              //vOp := PegaValor(vOp);
              if Length(vOp) > 1 Then
                 vOpAux := vOp;
              wAux := Copy(wAux, 3, Length(wAux));
           end else begin
               vOp :=Copy(wAux,1,1); //Operando
               //vOp := PegaValor(vOp);
               if Length(vOp) > 1 Then
                  vOpAux := vOp;
               wAux := Copy(wAux, 2, Length(wAux));
           end;
           i := Pos(' AND ', wAux);
           if i > 0 then begin
              vVal := Copy(wAux,1,i-1);
              //vVal := pegavalor(vVal);
              wAux := Copy(wAux, i+5, Length(wAux));
              vSql := vSql + ''+vCmp+''+vOp+''''+UpperCase(vVal)+''''+' AND ';
           end else begin
               vVal := Copy(wAux,1,Length(wAux));
               //vVal := pegavalor(vVal);
               vSql := vSql + ''+vCmp+''+vOp+''''+UpperCase(vVal)+'''';
           end;
           i := Pos('=',wAux);
      until i = 0;

      with dtmFolha.QryAux do begin
           Close;
           Sql.Clear;
           Sql.Add(vSql);
           Open;
           if vOpAux = '<=' then
              Last;
      end;

      if not dtmFolha.QryAux.IsEmpty then
         Result := dtmFolha.QryAux.FieldbyName(wCampoResult).AsString
      else
         Result := '0';
      dtmFolha.QryAux.Close;
  end;
end;

function TpDadoCons(NomeTabGener, Campo : String) : String;
var
   vSql : String;
begin
     //A - Alfanumerico
     //D - Data
     //N - Numerico
     vSql := 'SELECT UPPER(SUBSTR(T.NOMETIPODADO,1,1)) AS TIPO FROM CAMPOTABGENER C, TIPODADO T '+
             'WHERE (C.CODTABELA = '''+NomeTabGener+''') AND (C.CODCAMPO = '''+Campo+''') AND '+
             '(C.IDTIPODADO = T.IDTIPODADO)';

     with dtmFolha.qryIRRF do begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
          Result := FieldbyName('TIPO').AsString;
          Close;
     end;
end;

function Indice(sIndexador, sData, sExato:String): String;
var
  i : Integer;
  sAux, sSqlAux : String;
  sPer         : String[1];
  Ferror : Boolean;
begin
  Ferror := False;

  if sData = 'HOJE' then
     sData := DateToStr(Date);

  if sData[1] = '''' then
    sData := copy(sData,2,length(sData)-2);

  sIndexador:=QuotedStr(sIndexador);

  sSqlAux := 'SELECT 1 AS REGRA, MOECODIGO,MOEPERIODICIDADE '+
             'FROM MOEDA '+
             'WHERE UPPER(MOESIGLA) = Upper('+sIndexador+')';

  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.Sql.clear;
  dtmFolha.qryAux.Sql.add(sSqlAux);
  dtmFolha.qryAux.Open;
  sAux := dtmFolha.qryAux.FieldByName('MoeCodigo').AsString;
  sPer := dtmFolha.qryAux.FieldByName('MoePeriodicidade').AsString;

  if not FError then begin
     if (sExato = '0') or (sExato = '') then begin
        if (sPer = 'A') or (sPer = 'M') then
           sSqlAux := 'SELECT 1 AS REGRA, COTVALOR, COTDATA, COTMESREF  '+
                      'FROM COTACAOMOEDA '+
                      'WHERE MOECODIGO = '''+sAux+''' anD '+
                      '      COTMESREF=''' +copy(sdata,4,2) + copy(sdata,7,4)+''''
        else
           sSqlAux := 'Select 1 AS REGRA, COTVALOR, COTDATA, COTMESREF  '+
                      'FROM COTACAOMOEDA '+
                      'WHERE MOECODIGO = '''+sAux+''' AND '+
                      '      COTDATA=TO_DATE(''' +sdata +
                      ''',''DD/MM/YYYY'')';
     end else begin
        if (sPer = 'A') or (sPer = 'M') then
           sSqlAux := 'SELECT 1 AS REGRA, COTVALOR, COTDATA, COTMESREF '+
                      'FROM COTACAOMOEDA '+
                      'WHERE MOECODIGO = '''+sAux+''' AND '+
                      '      SUBSTR(COTMESREF,3,4)||SUBSTR(COTMESREF,1,2)<=''' +
                      Copy(sdata,7,4) + Copy(sdata,4,2) +
                      ''' ORDER BY COTDATA DESC'
        else
           sSqlAux := 'SELECT 1 AS REGRA, COTVALOR, COTDATA, COTMESREF '+
                      'FROM COTACAOMOEDA '+
                      'WHERE MOECODIGO = '''+sAux+''' AND '+
                      '      COTDATA<=TO_DATE(''' +sdata +
                      ''',''DD/MM/YYYY'') ORDER BY COTDATA DESC'

     end;
     dtmFolha.qryAux.Close;
     dtmFolha.qryAux.Sql.clear;
     dtmFolha.qryAux.Sql.add(sSqlAux);
     dtmFolha.qryAux.Open;
     result := FloatToStr(dtmFolha.qryAux.FieldByName('COTVALOR').AsFloat);
     dtmFolha.qryAux.Close;
  end;
end;

Function IRRF(NumDep,DataNasc,ValorBase,DataRef,TipodeResultado:string):String;
Var
   Tipo : Integer;
   fAliquota, fValorBase :double;
   irrf : tirrf;
   vSql : String;
begin
   fValorBase :=StrToFloat(StringReplace(ValorBase,'.',',',[rfReplaceAll]));

   Tipo := StrtoInt(TipodeResultado);

   Case Tipo of
        0..2 : begin
                    irrf    := tirrf.create;
                    irrf.CarregaFaixasIRRF(dtmFolha.qryAux,Sistema.idEmpresa);
                    Result := FloattoStr(irrf.CalculaIRRF(strtoint(numdep),strtodate(datanasc),fValorbase,fAliquota,dataref,Tipo));
                    irrf.free;
               end;
        3 : vSql := 'SELECT IDADEIDOSO AS VALOR FROM PARAMIRRF';
        4 : vSql := 'SELECT VLRIDOSOS AS VALOR FROM PARAMIRRF';
        5 : vSql := 'SELECT VLRDEPENDENTE AS VALOR FROM PARAMIRRF';
   end;
   if Tipo > 2 then begin
      with dtmFolha.qryAux do begin
           Close;
           Sql.Clear;
           Sql.Add(vSql);
           Open;
      end;
      Result := dtmFolha.qryAux.FieldbyName('VALOR').AsString;
   end;
end;

Function MAXIMO(formula:String) : String;
Type
    Valor = record
                  Tipo: Real;
             end;
var
   TbValor :array [0..100] of Valor;
   vVal, FormulaAux : String;
   Vz, i : LongInt;
   Maior : Real;
begin
     FormulaAux := Copy(formula,8,length(formula));
     FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);
     fillchar(TbValor,sizeof(TbValor),#0);

     for i := 0 to 100 do
         TbValor[i].Tipo := 0;

     vz := 1;
     repeat
           i := Pos(';',FormulaAux);
           if i = 0 then
              FormulaAux := '';
           vVal := Copy(FormulaAux,1,i-1);
           //vVal := PegaValor(vVal);
           try
              TbValor[vz].Tipo := StrtoFloat(vVal);
           except
                 vz := vz - 1;
           end;
           Inc(vz);
           FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux))
     until FormulaAux = '';

     Maior := 0;

     for i := 0 to 100 do begin
         if TbValor[i].Tipo > Maior then
            Maior := TbValor[i].Tipo;
     end;

     Result := FloattoStr(Maior);
end;

Function MINIMO(formula:String) : String;
Type
    Valor = record
                  Tipo: Real;
             end;
var
   TbValor :array [0..100] of Valor;
   vVal, FormulaAux : String;
   Vz, i : LongInt;
   Maior : Real;
begin
     FormulaAux := Copy(formula,8,length(formula));
     FormulaAux := Copy(FormulaAux,1,Length(FormulaAux)-1);
     fillchar(TbValor,sizeof(TbValor),#0);

     for i := 0 to 100 do
         TbValor[i].Tipo := -1000;

     vz := 0;
     repeat
           i := Pos(';',FormulaAux);
           if i = 0 then
              FormulaAux := '';
           vVal := Copy(FormulaAux,1,i-1);
           //vVal := PegaValor(vVal);
           try
              TbValor[vz].Tipo := StrtoFloat(vVal);
           except
                 vz := vz - 1;
           end;
           Inc(vz);
           FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux))
     until FormulaAux = '';

     Maior := TbValor[0].Tipo;

     for i := 0 to 100 do begin
         if TbValor[i].Tipo = -1000 then
            Break;
         if TbValor[i].Tipo < Maior then
            Maior := TbValor[i].Tipo;
     end;

     Result := FloattoStr(Maior);
end;

//******************************************************************************
// Formula de Arredondamento
function Arredonda(FormulaLoc:String):String;
Var
  I:Integer;
  N,Variavel:String;
  Var2:Double;
begin
//------------------------------------------------------------------------------
// DECODIFICA FORMULA

// Retira Nome da Formula
  //FormulaLoc:=Copy(FormulaLoc,7,length(FormulaLoc)-7);

// Guarda Valor a ser arredondado
  I := Pos(';',FormulaLoc);
  Variavel := Copy(FormulaLoc,1,I-1);
  Variavel := trim(Variavel);
// Guarda Numero de Casas a arredondar
  N := Copy(FormulaLoc,I+1,Length(FormulaLoc)-i);
  N := trim(n);
  Var2 := StrToFloat(Variavel);
  I := StrToInt(N);

// FIM DA DECODIFICACAO DA FORMULA
//------------------------------------------------------------------------------

// Seta Resultado Arredondando
  Result  := FloatToStrF(Var2,ffFixed,12,I);
end;

end.
