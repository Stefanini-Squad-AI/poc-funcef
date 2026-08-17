{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}


unit UCalcRub;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, uRegra, wwQuery,
     VcF1, uCalcIrrf; //Parser10;

procedure CalcBenef (const iTipoFolha: Integer; const bRescisao: boolean;
  var RegRegra, RegPessoa: string;
  var ValBene, ValBase: double;
  var TemLanc, QtdParc, QtdOcor: integer; dTotProv, dTotDesc : double
);

procedure CalcBenef2(var RegRegra:string; var RegPessoa:string; var ValBene: double);

procedure uCalRetro (
  const TipoFolha: integer; 
  const RegRegra, RegPessoa: string;
  var ValRetro, ValBase, PercRetro: double;
  IndMes: integer; dTotProv, dTotDesc : double
);

function RegraBooleana(sNumRegra,sSQL:string; var bErro:boolean): boolean;

function RegraNumerica(sNumRegra,sSQL:string; var bErro:boolean): string;

function FormaCalculo ({qryRub: TwwQuery; }sRegra,RegPessoa: string): real;

// Nas 3 funcoes abaixo, se TipoFolha = -1 faz para todos os tipos
function SomaHistRub (CodRubrica:string; DataRef:TDate; QtdeMeses,TipoFolha:integer): real;

function MediaHistRub (CodRubrica:string; DataRef:TDate; QtdeMeses,TipoFolha:integer): real;

function QtdeHistRub (CodRubrica:string; DataRef: TDate; QtdeMeses,TipoFolha:integer): real;

function DiasTrab (DataRef:TDate; OpcaoDiasTrab:integer): real;
// Retorna a Qtde de dias trabalhados Mes correspondente a DataRef, conforme a OpcaoDiasTrab
// 1 = Desconta só Admissão e Demissão
// 2 = Desconta Admissão, Demissão, Afastamento e Retorno
// 3 = Desconta Admissão, Demissão e Férias
// 4 = Desconta Admissão, Demissão, Afastamento, Retorno e Férias

function DiasFerias (InicioFerias:TDate; OpcaoFerias:integer): real;
// Retorna a Qtde de dias de ferias cujo inicio de gozo seja em InicioFerias
// Se OpcaoFerias = 0 Sem adicionar os dias do Abono Pecuniário
// Se OpcaoFerias = 1 Com adição dos dias do Abono Pecuniário

function DiasFeriasNoMes (DataRef: TDate): real;
// Retorna a Qtde de dias de gozo de ferias no Mes correspondente a DataRef

function RetornaFuncao (Texto: string): string;
// Retorna o resultado da funcao expressa em Texto

procedure InicializaFormula1;

procedure FinalizaFormula1;

function ExecutaFormula1(Expressao: string): real;

function TABGENERICA(sTabela,sChave,sColPesq,sColCons,sOpcao: string): string;

function TABLONGA   (Linha: string): string;

function TpDadoCons(NomeTabGener,Campo: string): string;

function Indice(sIndexador,sData,sExato: string): string;

function IRRF(NumDep,DataNasc,ValorBase,DataRef,TipodeResultado: string): string;

function MAXIMO(formula: string): string;

function MINIMO(formula: string): string;

function Arredonda(FormulaLoc: string): string;

function DifMesesArred (DataIni,DataFin: string): integer;
// Retorna a diferença de meses entre datas considerando os dias

function Avos13: integer;

function AvosFerias: integer;

function QtdeDepen(DataRef,TipoDepen:string;IdadeMin,IdadeMax,OpcaoTempo:integer): double;

var
  iUltAno13, iUltMes13, iUltFlgOc13, iUltFlgAbo, iUltFlgOcor, iUltNumSq, iUltQtdParc,
  iUltDiasSaldoFerias, Ano13, Mes13, FlgOc13, FlgAbo, FlgOcor, NumSq, QtdParcFer,
  DiasSaldoFerias, iContRegQryIn, iTemLanc, iQtdParc, iQtdOcor, iMesRetro: integer;

  ValInfRubrica, ValBaseRubrica, ValUltSalChefe, ValSalChefe, ValTotProventos, ValTotDescontos,
  ValSalFuncao, ValUltSalFuncao, vSalva, ValUltSalChefe2, ValSalChefe2, dPercRetro: double;

  sUltPessoa, sUltDataFer1, sUltDataFer2, sUltDataFer3, sUltDataProx, SValor, sDataFer1,
  sDataFer2, sDataFer3, DataProx, sSQL: string;

  bPrimeiraRegra, bPassoaPasso: boolean;

  compRegra: TRegra;
  qryInRegra: TwwQuery;

  formula1: TF1Book;

implementation

uses uMensErro, uSistema, uAutorizacao, uFuncoesUteisRH, dFolha;

procedure CalcBenef (const iTipoFolha: Integer; const bRescisao : boolean;
  var RegRegra, RegPessoa: string;
  var ValBene, ValBase:double;
  var TemLanc, QtdParc, QtdOcor: integer; dTotProv, dTotDesc : double
);
var
  bErroRegra, bAlgRegra: boolean;
//SvNum: TBookMark;
begin
  //SvNum := qryRub.GetBookmark;

  iTemLanc        := TemLanc;
  iQtdParc        := QtdParc;
  iQtdOcor        := QtdOcor;
  ValInfRubrica   := ValBene;
  ValBaseRubrica  := ValBase;
  ValTotProventos := dTotProv;
  ValTotDescontos := dTotDesc;

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
    ValSalChefe     := ValUltSalChefe;
    ValSalChefe2    := ValUltSalChefe2;
    ValSalFuncao    := ValUltSalFuncao;
  end
  else
  begin
    bPrimeiraRegra := true;
    ValSalChefe    := 0;
    ValSalChefe2   := 0;
    ValSalFuncao   := 0;
    vSalva         := 0;

    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT '+
      '  SALARIOATUAL AS SALCHEFE '+
      'FROM '+
      '  FUNCIONARIO '+
      'WHERE '+
      '  IDPESSOA = (SELECT IDCHEFE FROM FUNCIONARIO WHERE IDPESSOA = ' +RegPessoa+ ')');
    dtmFolha.qryAux.Open;
    ValSalChefe := dtmFolha.qryAux.FieldByName('SALCHEFE').asFloat;

    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT DECODE(PR.FLGDOISCARGOS, 0, F.SALARIOATUAL,   '+
      '       DECODE(F.IDFUNCAO,NULL, F.SALARIOATUAL,       '+
      '       DECODE(PR.FLGNIVELINDIV, 0, FX.STEP1,         '+
      '       DECODE(F.NIVELINDIV2,1,FX.STEP1, 2,FX.STEP2,  '+
      '                            3,FX.STEP3, 4,FX.STEP4,  '+
      '                            5,FX.STEP5, 6,FX.STEP6,  '+
      '                            7,FX.STEP7, 8,FX.STEP8,  '+
      '                            9,FX.STEP9, 10,FX.STEP10,  '+  //Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            11,FX.STEP11, 12,FX.STEP12,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            13,FX.STEP13, 14,FX.STEP14,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            15,FX.STEP15, 16,FX.STEP16,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            17,FX.STEP17, 18,FX.STEP18,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            19,FX.STEP19,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            FX.STEP20)))) AS SALFUNCAO'+//Douglas.Siqueira SOL 171426 Kintana 1537613
      ' FROM FUNCIONARIO F, FAIXASAL FX, CARGO C, PARAMRH PR'+
      ' WHERE  F.IDPESSOA = (SELECT IDCHEFE FROM FUNCIONARIO WHERE IDPESSOA = ' +RegPessoa+ ')'+
      ' AND FX.IDFAIXASALARIAL = DECODE(PR.FLGNIVELINDIV, 1,'+
      '          DECODE(F.IDFAIXAFUNCAO,NULL,F.IDFAIXACARGO,'+
      '                 F.IDFAIXAFUNCAO), C.IDFAIXASALARIAL)'+
      ' AND C.IDCARGO=DECODE(PR.FLGDOISCARGOS, 0, F.IDCARGO,'+
      '      DECODE(F.IDFUNCAO,NULL, F.IDCARGO, F.IDFUNCAO))');

    dtmFolha.qryAux.Open;
    ValSalChefe2 := dtmFolha.qryAux.FieldByName('SALFUNCAO').asFloat;




    dtmFolha.qryAux.Close;
    dtmFolha.qryAux.SQL.Clear;
    dtmFolha.qryAux.SQL.Add(
      'SELECT DECODE(PR.FLGDOISCARGOS, 0, F.SALARIOATUAL,   '+
      '       DECODE(F.IDFUNCAO,NULL, F.SALARIOATUAL,       '+
      '       DECODE(PR.FLGNIVELINDIV, 0, FX.STEP1,         '+
      '       DECODE(F.NIVELINDIV2,1,FX.STEP1, 2,FX.STEP2,  '+
      '                            3,FX.STEP3, 4,FX.STEP4,  '+
      '                            5,FX.STEP5, 6,FX.STEP6,  '+
      '                            7,FX.STEP7, 8,FX.STEP8,  '+
      '                            9,FX.STEP9, 10,FX.STEP10,  '+  //Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            11,FX.STEP11, 12,FX.STEP12,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            13,FX.STEP13, 14,FX.STEP14,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            15,FX.STEP15, 16,FX.STEP16,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            17,FX.STEP17, 18,FX.STEP18,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            19,FX.STEP19,  '+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '                            FX.STEP20)))) AS SALFUNCAO'+//Douglas.Siqueira SOL 171426 Kintana 1537613
      ' FROM FUNCIONARIO F, FAIXASAL FX, CARGO C, PARAMRH PR'+
      ' WHERE  F.IDPESSOA = '+RegPessoa+
      ' AND FX.IDFAIXASALARIAL = DECODE(PR.FLGNIVELINDIV, 1,'+
      '          DECODE(F.IDFAIXAFUNCAO,NULL,F.IDFAIXACARGO,'+
      '                 F.IDFAIXAFUNCAO), C.IDFAIXASALARIAL)'+
      ' AND C.IDCARGO=DECODE(PR.FLGDOISCARGOS, 0, F.IDCARGO,'+
      '      DECODE(F.IDFUNCAO,NULL, F.IDCARGO, F.IDFUNCAO))');

    dtmFolha.qryAux.Open;
    ValSalFuncao := dtmFolha.qryAux.FieldByName('SALFUNCAO').asFloat;

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

    sDataFer1  := dtmFolha.qryAux.FieldByName('INIPERIODOFERIAS').asString;
    sDataFer2  := dtmFolha.qryAux.FieldByName('INIGOZOFERIAS').asString;
    sDataFer3  := dtmFolha.qryAux.FieldByName('FIMGOZOFERIAS').asString;
    FlgAbo     := dtmFolha.qryAux.FieldByName('FLGABONO').asInteger;
    FlgOcor    := dtmFolha.qryAux.FieldByName('FLGOCORRIDA').asInteger;
    NumSq      := dtmFolha.qryAux.FieldByName('NUMSEQ').asInteger;
    QtdParcFer := dtmFolha.qryAux.FieldByName('QTDPARCDEVOL').asInteger;

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

      if not(dtmFolha.qryAux.FieldByName('PROXAQUISFER').isNull) then
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
        DataProx := dtmFolha.qryAux.FieldByName('PROXAQUISFER').asString;
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
      '  DECODE(FLGABONO,0,0,DECODE(NVL(QTDIASABONO,0),0,trunc((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2), QTDIASABONO))),30) '+
      '  AS DIASACUMFERIAS '+
      '  FROM  FERIAS      '+
      'WHERE '+
      '  (FERIAS.IDPESSOA    = ' +RegPessoa+ ') AND '+
      '  (FERIAS.FLGOCORRIDA = 1)');
    dtmFolha.qryAux.Open;

    DiasSaldoFerias := dtmFolha.qryAux.FieldByName('DIASACUMFERIAS').asInteger;
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

  if (bRescisao) then
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
    '  FE.FLGOCORRIDA, FE.QTDPARCDEVOL, FE.QTDIASABONO, '+
    '  FE.FLGABONO, FE.FLGOCORRIDA, FE.NUMSEQ, '+
    '  TO_DATE(''' +DataProx+  ''',''DD/MM/YYYY'') AS PROXAQUISFER, '+
    OraNumero(FloatToStr(ValBene)) + ' AS VALORRUBRICA,  ' +
    OraNumero(FloatToStr(ValBase)) + ' AS BSRUBRICA, ' +
    OraNumero(FloatToStr(ValSalChefe)) + ' AS SALCHEFE, ' +
    OraNumero(FloatToStr(ValSalChefe2)) + ' AS SALCHEFE2, ' +
    OraNumero(FloatToStr(ValSalFuncao)) + ' AS SALFUNCAO, ' +
    OraNumero(FloatToStr(dTotProv)) + ' AS TOTALPROVENTOS, '+
    OraNumero(FloatToStr(dTotDesc)) + ' AS TOTALDESCONTOS, '+
    OraNumero(FloatToStr(dPercRetro))+ ' AS PERCRETRO, '+
    IntToStr(iMesRetro)  + ' AS MESRETRO, '+
    IntToStr(iTipoFolha) + ' AS TIPOFOLHA, '+
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
    '  FERIAS.QTDPARCDEVOL, FERIAS.QTDIASABONO, FERIAS.IDPESSOA '+
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

  sUltPessoa := RegPessoa;

  if (bAlgRegra) then
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
  ValUltSalChefe := ValSalChefe;
  ValUltSalChefe2:= ValSalChefe2;
  ValUltSalFuncao:= ValSalFuncao;
  //qryRub.GotoBookmark(SvNum);
end;

procedure CalcBenef2(var RegRegra:string; var RegPessoa:string; var ValBene:double);
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
  if (bErroRegra) then
  begin
    MsgDlg('Erro na execução da Regra', 'Erro', mtError, [mbOk,mbHelp], 0);
    exit;
  end;
end;

procedure uCalRetro (
  const TipoFolha: integer; 
  const RegRegra, RegPessoa: string;
  var ValRetro, ValBase, PercRetro: double;
  IndMes: integer; dTotProv, dTotDesc : double
);
var
  sValor, sSQL, sRegraRetro, sPessoaRetro: string;
  bErroRegra, bAlgRegra: boolean;
  iZero: Integer;
begin
  sRegraRetro  := RegRegra;
  sPessoaRetro := RegPessoa;
  dPercRetro   := PercRetro;
  iMesRetro    := IndMes;
  iZero        := 0;

  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.SQL.Clear;
  dtmFolha.qryAux.SQL.Add('SELECT IDREGRA FROM ALGREGRA WHERE IDREGRA = '+ RegRegra);
  dtmFolha.qryAux.Open;
  bAlgRegra := (not dtmFolha.qryAux.IsEmpty);

  bPrimeiraRegra := true;


  if (bAlgRegra) then
  begin
    // Regra de Cálculo do Valor
    sSQL :=
    'SELECT '+
    '  PESSOAFISICA.*, FUNCIONARIO.*, SITFUNC.TIPOSIT, '+
    '  PARAMRH.FERIASINI, PARAMRH.FERIASFIM, '+
    '  PARAMRH.NORMALINI, PARAMRH.NORMALFIM, HORATRAB.JORNADAMENSAL, '+
    OraNumero(FloatToStr(ValBase))+   ' AS BSRUBRICA, '+
    OraNumero(FloatToStr(PercRetro))+ ' AS PERCRETRO, '+
    OraNumero(FloatToStr(dTotProv)) + ' AS TOTALPROVENTOS, '+
    OraNumero(FloatToStr(dTotDesc)) + ' AS TOTALDESCONTOS, '+
    IntToStr(IndMes) + ' AS MESRETRO, '+
    IntToStr(TipoFolha)+ ' AS TIPOFOLHA, '+
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
  end
  else
     CalcBenef (TipoFolha, False,
                sRegraRetro, sPessoaRetro,
                ValRetro, ValBase,
                iZero, iZero, iZero,
                dTotProv, dTotDesc);


end;

function RegraBooleana(sNumRegra,sSQL:string; var bErro:boolean): boolean;
begin
  Result := false;
  bErro  := false;

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
    if (compRegra.Result = 'false') then
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

//  compRegra.RuleName  := sNumRegra;
  compRegra.RuleNumber := sNumRegra;
  compRegra.IdEmpresa := Sistema.IdEmpresa; { Augusto 26/07/2002 }
  compRegra.IdCalculo := 0;
  compRegra.FlgGravaCalculo := false;
  compRegra.FlgReloadRule := false;
  if (Sistema.TipoEmpresa = 'P') then
    compRegra.TipoCliente := {uRegra.}tcFundacao
  else
    compRegra.TipoCliente := {uRegra.}tcOutros;

  qryInRegra.Close;
  qryInRegra.SQL.Clear;
  qryInRegra.SQl.Add(sSQL);
  qryInRegra.Open;

  if (qryInRegra.RecordCount = 0) then
  begin
    qryInRegra.Close;
    exit;
  end;

  if bPassoaPasso then
    compRegra.PassoaPasso
  else
    compRegra.Execute;

  if not(compRegra.Error) then
    Result := OraNumero(compRegra.Result)
  else
    bErro := true;

  qryInRegra.Close;
end;

function FormaCalculo ({qryRub: TwwQuery; }sRegra, RegPessoa: string): real;
var
  I, J, K: integer;
  CodRub, Expressao, sResultFuncao, svExpressao: string;
//  ValRub: real;
//  Parser : TParser;
begin
  //Parser := TParser.Create(Application);
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DESCRICAOREGRA FROM REGRA WHERE IDREGRA = ' + sRegra);
    Open;
    Expressao   := Trim(FieldByName('DESCRICAOREGRA').asString);
    if pos('&', Expressao) > 0 then
       Expressao := copy(Expressao, 1, pos('&', Expressao) - 1);
    svExpressao := Expressao;
    Close;
    SQL.Clear;
  end;
  Result    := 0;
  Expressao := Trim(Expressao);
  if (Expressao = '') then
    exit;
  //I := 0;
  iContRegQryIn := 0;

  with (dtmFolha.qryAuxFormaCalc) do
  begin
    if (bPrimeiraRegra) then
    begin
      bPrimeiraRegra := false;
      Close;
      SQL.Clear;
      SQL.Add(sSql);
      Open;
    end
    else
      First;
  end;

  while not(dtmFolha.qryAuxFormaCalc.EOF) do
  begin
    Inc(iContRegQryIn);
    Expressao := svExpressao;
    if (bPassoaPasso) then
      ShowMessage(Expressao);
      // Substituir Rubricas
    {  while  I < Length(Expressao) do
      begin
         //if Pos('R(', copy(Expressao, I+1, Length(Expressao) - I)) = 0 then break;
         //I := I + Pos('R(', copy(Expressao, I+1, Length(Expressao) - I));
         if Pos('R(', Expressao) = 0 then break;
         I := I + Pos('R(', Expressao);
         // Rotina para apanhar o valor da rubrica
         J := Pos(')', copy(Expressao, I, Length(Expressao) - I + 1));
         CodRub := copy(Expressao, I+2, J - 3);
         //qryRub.Filtered  := false;
         //qryRub.Filter    := 'CODPROVDESC = ' + QuotedStr(CodRub);
         //qryRub.Filtered  := true;
         qryRub.Locate('CODPROVDESC',CodRub,[]);
         //qryRub.First;
         ValRub := qryRub.FieldByName('ValEspeciais').asFloat;
         Expressao :=
          StringReplace(Expressao,'R('+CodRub+')',
                        StringReplace(FloatToStr(ValRub),',','.',[rfReplaceAll]),
                        [rfReplaceAll]);
         //qryRub.Filtered  := false;
         //I := I + J;
         I := 0;
      end;
    }
    I := 0;
    // Substituir Campos
    if (Pos('C(', Expressao) > 0) then
    begin
      while (I < Length(Expressao)) do
      begin
        //if Pos('C(', copy(Expressao, I+1, Length(Expressao) - I)) = 0 then break;
        //I := I + Pos('C(', copy(Expressao, I+1, Length(Expressao) - I));
        if (Pos('C(', Expressao) = 0) then
          break;
        I := I + Pos('C(', Expressao);
        // Rotina para apanhar o valor do campo
        J      := Pos(')', copy(Expressao, I, Length(Expressao) - I + 1));
        CodRub := copy(Expressao, I+2, J - 3);
        if (CodRub = 'TEMLANCAMENTO') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',IntToStr(iTemLanc),[rfReplaceAll])
        else
        if (CodRub = 'PARCELAS') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',IntToStr(iQtdParc),[rfReplaceAll])
        else
        if (CodRub = 'NUMOCORRENCIAS') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',IntToStr(iQtdOcor),[rfReplaceAll])
        else
        if (CodRub = 'VALORRUBRICA') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(FloatToStr(ValInfRubrica),',','.',[rfReplaceAll]),
                       [rfReplaceAll])
        else
        if (CodRub = 'BSRUBRICA') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(FloatToStr(ValBaseRubrica),',','.',[rfReplaceAll]),
                       [rfReplaceAll])
        else
        if (CodRub = 'MESRETRO') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(IntToStr(iMesRetro),',','.',[rfReplaceAll]),
                       [rfReplaceAll])
        else
        if (CodRub = 'PERCRETRO') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(FloatToStr(dPercRetro),',','.',[rfReplaceAll]),
                       [rfReplaceAll])
        else
        if (CodRub = 'TOTALPROVENTOS') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(FloatToStr(ValTotProventos),',','.',[rfReplaceAll]),
                       [rfReplaceAll])
        else
        if (CodRub = 'TOTALDESCONTOS') then
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(FloatToStr(ValTotDescontos),',','.',[rfReplaceAll]),
                       [rfReplaceAll])
        else
          Expressao := StringReplace(Expressao,'C('+CodRub+')',
                       StringReplace(
                         iff(dtmFolha.qryAuxFormaCalc.FieldByName(CodRub).asString='','0',
                             dtmFolha.qryAuxFormaCalc.FieldByName(CodRub).asString),
                         ',','.',[rfReplaceAll]),
                       [rfReplaceAll]);
        //I := I + J;
        if (bPassoaPasso) then
          ShowMessage(Expressao);
        I := 0;
      end;
    end;

    I := 0;
    // Substituir Funções
    if (Pos('F%', Expressao) > 0) then
    begin
      while (I < Length(Expressao)) do
      begin
        //if Pos('F%', copy(Expressao, I+1, Length(Expressao) - I)) = 0 then break;
        //I := I + Pos('F%', copy(Expressao, I+1, Length(Expressao) - I));
        if (Pos('F%', Expressao) = 0) then
          break;
        I := I + Pos('F%', Expressao);
        // Rotina para apanhar o valor do campo
        while (true) do
        begin
          J := Pos(')',  copy(Expressao, I,   Length(Expressao) - I + 1));
          K := Pos('F%', copy(Expressao, I+1, Length(Expressao) - I));
          if (K = 0) or (K+1 > J) then
            break
          else
            I := I + K;
        end;
        CodRub := copy(Expressao, I+2, J - 2);
        // Executa a Função Contida em CodRub
        sResultFuncao := RetornaFuncao (CodRub);
        //
        Expressao := StringReplace(Expressao,'F%'+CodRub,
                     StringReplace(sResultFuncao,',','.',[rfReplaceAll]),[]);
        //I := I + J;
        if (bPassoaPasso) then
          ShowMessage(Expressao);
        I := 0;
      end;
    end;

    if (Expressao <> '') then
      Result := ExecutaFormula1(Expressao);

    dtmFolha.qryAuxFormaCalc.Next;
  end;
  //dtmFolha.qryAuxFormaCalc.Close;
end;

function SomaHistRub (CodRubrica:string; DataRef: TDate;
                      QtdeMeses, TipoFolha:integer): real;
begin
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(H.VALORPROVENTO) AS VALORPROVENTO');
    SQL.Add('FROM   HISTRUBSAL H');
    SQL.Add('WHERE (H.IDMODULO    = 21)');
    SQL.Add('AND   (H.IDPESSOA    = '+sUltPessoa+')');
    SQL.Add('AND   (H.MES  BETWEEN  '+QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-QtdeMeses))+' ');
    SQL.Add('AND                    '+QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-1))+')');
    SQL.Add('AND   (H.CODPROVDESC = ' +QuotedStr(CodRubrica)+')');
    SQL.Add('AND   (H.IDPESSJUR   = ' +IntToStr(Sistema.IdEmpresa)+')');
    SQL.Add('AND   (H.MES not LIKE ''%13'')               ');
    if (TipoFolha <> -1) then
      SQL.Add('AND   (H.IDMOTIVO= ' + IntToStr(TipoFolha)+')');
    Open;
    Result := FieldByName('VALORPROVENTO').asFloat;
    Close;
  end;
end;

function MediaHistRub (CodRubrica:string; DataRef:TDate; QtdeMeses,TipoFolha:integer): real;
begin
  Result := 0;
  if (QtdeMeses <= 0) then
    exit;
  Result := SomaHistRub (CodRubrica, DataRef, QtdeMeses, TipoFolha) / QtdeMeses;
end;

function QtdeHistRub (CodRubrica:string; DataRef:TDate; QtdeMeses,TipoFolha:integer): real;
begin
  with (dtmFolha.qryAux) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT  COUNT(H.VALORPROVENTO) AS VALORPROVENTO');
    SQL.Add('FROM   HISTRUBSAL H');
    SQL.Add('WHERE (H.IDMODULO    = 21)');
    SQL.Add('AND   (H.IDPESSOA    = '+sUltPessoa+')');
    SQL.Add('AND   (H.MES  BETWEEN  '+QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-QtdeMeses))+' ');
    SQL.Add('AND                    '+QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-1))+')');
    SQL.Add('AND   (H.CODPROVDESC = '+QuotedStr(CodRubrica)+')');
    SQL.Add('AND   (H.IDPESSJUR   = ' + IntToStr(Sistema.IdEmpresa)+')');
    SQL.Add('AND   (H.MES not LIKE ''%13'')               ');
    if (TipoFolha <> -1) then
      SQL.Add('AND   (H.IDMOTIVO= ' + IntToStr(TipoFolha)+')');
    Open;
    Result := FieldByName('VALORPROVENTO').asFloat;
    Close;
  end;
end;

function DiasTrab (DataRef: TDate; OpcaoDiasTrab:integer): real;
var
  wDiaIni,wMesIni,wAnoIni,wDiaFin,wMesFin,wAnoFin,
  wAnoNormalFin, wMesNormalFin, wDiaNormalFin: word;
  DatIni, DatFim: TDate;
  AnoMes: string;
begin
  Result  := 30;
  wDiaIni := 1;
  AnoMes  := RetornaAnoMes(DataRef);
  DatIni  := StrToDate('01/' + copy(AnoMes,6,2) + '/' + copy(AnoMes,1,4));
  DatFim  := StrToDate(IncData(DateToStr(DatIni), -1,1,0));
  with (dtmFolha.qryAuxFormaCalc) do
  begin
    // Admissao e Demissao Fora do Mes
    if (FieldByName('DATAADMISSAO').asDateTime > DatFim) or
       ((FieldByName('DATADESLIGAMENTO').asDateTime < DatIni) and
        (FieldByName('TIPOSIT').asString = 'D'))  or
       ((FieldByName('DATADESLIGAMENTO').asDateTime <= DatIni) and
        (FieldByName('TIPOSIT').asString = 'F') and
        (OpcaoDiasTrab in [2,4])) then
    begin
      Result := 0;
      exit;
    end;

    // Admissao e Demissao no Mes
    if (FieldByName('DATAADMISSAO').asDateTime > DatIni) then
    begin
      DecodeDate(FieldByName('DATAADMISSAO').asDateTime, wAnoIni, wMesIni, wDiaIni);
      if wDiaIni = 31 then dec(wDiaIni);
      Result := Result - wDiaIni + 1;
    end;

    if (FieldByName('DATADESLIGAMENTO').asDateTime < DatFim) and
       (FieldByName('TIPOSIT').asString = 'D') then
    begin
      DecodeDate(FieldByName('DATADESLIGAMENTO').asDateTime, wAnoFin, wMesFin, wDiaFin);
      Result := wDiaFin - wDiaIni + 1;
    end;

    // Afastamento e Retorno no Mes
    if OpcaoDiasTrab in [2,4] then
    begin
      if (FieldByName('DATARETORNO').asDateTime >  DatIni) and
         (FieldByName('DATARETORNO').asDateTime <= DatFim) and
         (FieldByName('TIPOSIT').asString = 'A') then
      begin
        DecodeDate(FieldByName('DATARETORNO').asDateTime, wAnoIni, wMesIni, wDiaIni);
        Result := Result - wDiaIni + 1;
        if (FieldByName('DATADESLIGAMENTO').asDateTime >=  DatIni) then
        begin
          DecodeDate(FieldByName('DATADESLIGAMENTO').asDateTime, wAnoIni, wMesIni, wDiaIni);
          Result := Result + wDiaIni - 1;
        end;
      end;

      if (FieldByName('DATADESLIGAMENTO').asDateTime <= DatFim) and
         (FieldByName('DATADESLIGAMENTO').asDateTime >  DatIni) and
         (FieldByName('TIPOSIT').asString = 'F') then
      begin
        DecodeDate(FieldByName('DATADESLIGAMENTO').asDateTime, wAnoFin, wMesFin, wDiaFin);
        Result := wDiaFin - wDiaIni;
      end;
    end;

    // Ferias no Mes
    if (OpcaoDiasTrab in [3,4]) and
       (FieldByName('FIMGOZOFERIAS').asDateTime >= DatIni) and
       (FieldByName('INIGOZOFERIAS').asDateTime <= DatFim) then
    begin
      DecodeDate(FieldByName('INIGOZOFERIAS').asDateTime, wAnoIni, wMesIni, wDiaIni);
      DecodeDate(FieldByName('FIMGOZOFERIAS').asDateTime, wAnoFin, wMesFin, wDiaFin);
      DecodeDate(FieldByName('NORMALFIM').asDateTime, wAnoNormalFin, wMesNormalFin, wDiaNormalFin);
      if (FieldByName('FIMGOZOFERIAS').asDateTime > DatFim) then
        DecodeDate(FieldByName('NORMALFIM').asDateTime, wAnoFin, wMesFin, wDiaFin);
      if (FieldByName('INIGOZOFERIAS').asDateTime < DatIni) then
        wDiaIni := 1;
      Result := Result - (wDiaFin - wDiaIni + 1);
      if (Result > 0) and (wMesFin = 2) and (wDiaIni = 1) and (wDiaFin = wDiaNormalFin) then
         if wDiaNormalFin = 28 then
           Result :=  Result - 2
         else
           Result :=  Result - 1;

    end;
  end;
  if (Result < 0) then
    Result :=  0;
  if (Result > 30) then
    Result := 30;
end;

function DiasFerias (InicioFerias:TDate; OpcaoFerias:integer): real;
begin
  with (dtmFolha.qryAuxFormaCalc) do
  begin
    Result  := 0;
    if (FieldByName('INIGOZOFERIAS').asString  <> '')           and 
       (FieldByName('INIGOZOFERIAS').asDateTime = InicioFerias) then
    begin
      Result := FieldByName('FIMGOZOFERIAS').asDateTime -
                FieldByName('INIGOZOFERIAS').asDateTime + 1;
      if (OpcaoFerias = 1) and (FieldByName('FLGABONO').asInteger = 1) then
      begin
        if (FieldByName('QTDIASABONO').asInteger = 0) then
          Result := trunc(Result * 1.5)
        else
          Result := Result + FieldByName('QTDIASABONO').asInteger;
      end;
    end;
  end;
end;

function DiasFeriasNoMes (DataRef: TDate): real;
var
  wDiaIni,wMesIni,wAnoIni,wDiaFin,wMesFin,wAnoFin: word;
  DatIni, DatFim: TDate;
  AnoMes: string;
begin
  Result  := 0;
  AnoMes  := RetornaAnoMes(DataRef);
  DatIni  := StrToDate('01/' + copy(AnoMes,6,2) + '/' + copy(AnoMes,1,4));
  DatFim  := StrToDate(IncData(DateToStr(DatIni), -1,1,0));
  with (dtmFolha.qryAuxFormaCalc) do
  begin
    if (RetornaAnoMes(FieldByName('FIMGOZOFERIAS').asDateTime) >= AnoMes) and
       (RetornaAnoMes(FieldByName('INIGOZOFERIAS').asDateTime) <= AnoMes) then
    begin
       DecodeDate(FieldByName('INIGOZOFERIAS').asDateTime, wAnoIni, wMesIni, wDiaIni);
       DecodeDate(FieldByName('FIMGOZOFERIAS').asDateTime, wAnoFin, wMesFin, wDiaFin);
       if (FieldByName('FIMGOZOFERIAS').asDateTime > DatFim) then
         DecodeDate(DatFim, wAnoFin, wMesFin, wDiaFin);
       if (FieldByName('INIGOZOFERIAS').asDateTime < DatIni) then
         wDiaIni := 1;
       Result := (wDiaFin - wDiaIni + 1);
    end;
  end;
end;

function RetornaFuncao (Texto:string): string;
var
  NomeFuncao, Param1, Param2, Param3, Param4, Param5 : string;
  I, J, NumDias, NumMeses, NumAnos : integer;
begin
  Result := '0';
  NomeFuncao := UpperCase(trim(copy(Texto,1,Pos('(',Texto)-1)));
  I          := Pos('(',Texto)+1;
  J          := Pos(';',Texto);
  if J = 0 then  J := Pos(')',Texto);
  Param1     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + Pos(';',copy(Texto,I,Length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  Pos(')',copy(Texto,I,Length(Texto)-I+1));
  Param2     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + Pos(';',copy(Texto,I,Length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  Pos(')',copy(Texto,I,Length(Texto)-I+1));
  Param3     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + Pos(';',copy(Texto,I,Length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  Pos(')',copy(Texto,I,Length(Texto)-I+1));
  Param4     := trim(copy(Texto,I,J-I));
  I := J + 1;
  J := I - 1 + Pos(';',copy(Texto,I,Length(Texto)-I+1));
  if J = I -1 then  J := I -1 +  Pos(')',copy(Texto,I,Length(Texto)-I+1));
  Param5     := trim(copy(Texto,I,J-I));

  if NomeFuncao = 'DIASTRAB' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(DiasTrab(StrToDate(Param1),StrToInt(Param2)))
  else
  if NomeFuncao = 'SOMAHISTRUB' then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(SomaHistRub(Param1,StrToDate(Param2),StrToInt(Param3),StrToInt(Param4)))
  else
  if NomeFuncao = 'MEDIAHISTRUB' then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(MediaHistRub(Param1,StrToDate(Param2),StrToInt(Param3),StrToInt(Param4)))
  else
  if NomeFuncao = 'QTDEHISTRUB' then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(QtdeHistRub(Param1,StrToDate(Param2),StrToInt(Param3),StrToInt(Param4)))
  else
  if NomeFuncao = 'QTDEDEPEN' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(QtdeDepen(Param1,Param2,StrToInt(Param3),StrToInt(Param4),StrToInt(Param5)))
  else
  if NomeFuncao = 'DIASFERIAS' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(DiasFerias(StrToDate(Param1),StrToInt(Param2)))
  else
  if NomeFuncao = 'DIASFERIASNOMES' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(DiasFeriasNoMes(StrToDate(Param1)))
  else
  if (NomeFuncao = 'DIFDIAS')  or
     (NomeFuncao = 'DIFANOS')  then
  begin
    CalculaData(Param1,Param2,NumDias,NumMeses,NumAnos);
    if NomeFuncao = 'DIFDIAS' then
      Result := IntToStr(NumDias)
    else
    if NomeFuncao = 'DIFANOS' then
      Result := IntToStr(NumAnos);
  end
  else
  if (NomeFuncao = 'DIFMESES')  then
  begin
    if (Param3 = '') or (Param3 = '0') then
    begin
      CalculaDifData(Param1,Param2,NumDias,NumMeses,NumAnos);
      Result := IntToStr(NumMeses);
    end
    else
      Result := IntToStr(DifMesesArred(Param1,Param2));
  end
  else
  if NomeFuncao = 'INCDATA' then
    Result := IncData(Param1,StrToInt(Param2),StrToInt(Param3),StrToInt(Param4))
  else
  if NomeFuncao = 'TRAZULTDIAMES' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := IntToStr(TrazUltDiaMes(StrToInt(copy(Param1,4,2)),StrToInt(copy(Param1,7,4))))
  else
  if NomeFuncao = 'TRAZULTDIADATA' then
    if (Param1 = '') or (Param1 = '0') then
      Result := ''
    else
      Result := DateToStr(TrazUltDiaData(StrToDate(Param1)))
  else
  if NomeFuncao = 'RETORNAANOMES' then
    if (Param1 = '') or (Param1 = '0') then
      Result := ''
    else
      Result := RetornaAnoMes(StrToDate(Param1))
  else
  if NomeFuncao = 'ANOMES' then
    if (Param1 = '') or (Param1 = '0') then
      Result := ''
    else
      Result := AnoMes(StrToDate(Param1))
  else
  if NomeFuncao = 'EXTRAIDIA' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := IntToStr(ExtraiDia(StrToDate(Param1)))
  else
  if NomeFuncao = 'EXTRAIMES' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := IntToStr(ExtraiMes(StrToDate(Param1)))
  else
  if NomeFuncao = 'EXTRAIANO' then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := IntToStr(ExtraiAno(StrToDate(Param1)))
  else
  if NomeFuncao = 'JUROCOMPOSTO' then
    Result := FloatToStr(JuroComposto(StrToFloat(Param1),StrToInt(Param2),StrToFloat(Param3)))
  else
  if NomeFuncao = 'INDICE' then
    Result := Indice(Param1,Param2,Param3)
  else
  if NomeFuncao = 'ARITM' then
  begin
    Param1 := StringReplace(Param1,'[','(',[rfReplaceAll]);
    Param1 := StringReplace(Param1,']',')',[rfReplaceAll]);
    Result := FloatToStr(ExecutaFormula1(Param1));
  end
  else
  if NomeFuncao = 'SALVA' then
  begin
    Param1 := StringReplace(Param1,'[','(',[rfReplaceAll]);
    Param1 := StringReplace(Param1,']',')',[rfReplaceAll]);
    vSalva := ExecutaFormula1(Param1);
    Result := FloatToStr(vSalva);
  end
  else
  if NomeFuncao = 'RECUPERA' then
    Result := FloatToStr(vSalva)
  else
  if NomeFuncao = 'TABGENERICA' then
  begin
    if Param2 = '' then
      Result := ''
    else
      Result := TabGenerica(Param1,Param2,Param3,Param4,Param5);
  end
  else
  if NomeFuncao = 'TABLONGA' then
  begin
    Param1 := trim(copy(Texto,Pos('(',Texto)+1,Length(Texto)-Pos('(',Texto)-1));
    Result := TabLonga(Param1);
  end
  else
  if NomeFuncao = 'MAXIMO' then
  begin
    Param1 := trim(copy(Texto,Pos('(',Texto)+1,Length(Texto)-Pos('(',Texto)-1));
    Result := Maximo(Param1);
  end
  else
  if NomeFuncao = 'MINIMO' then
  begin
    Param1 := trim(copy(Texto,Pos('(',Texto)+1,Length(Texto)-Pos('(',Texto)-1));
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
  if NomeFuncao = 'AVOSFERIAS' then
    Result := IntToStr(AVOSFERIAS)
  else
  if NomeFuncao = 'AVOS13' then
    Result := IntToStr(AVOS13)
  else
  begin
    if NomeFuncao = 'SE' then
      Texto := StringReplace(Texto,'SE(','if(',[rfReplaceAll])
    else
    if NomeFuncao = 'TRUNCA' then
      Texto := StringReplace(Texto,'TRUNCA(','TRUNC(',[rfReplaceAll])
    else
    if NomeFuncao = 'DATANUM' then
      Texto := 'DATE(' + copy(Param1,7,4) + ';' + copy(Param1,4,2) + ';' + copy(Param1,1,2) + ')';
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
                               StrToFloat(copy(Param1,I+2,Length(Param1))),
                               StrToFloat(Param2),StrToFloat(Param3)))
       else
       if Param4 = '<' then
          Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) <
                               StrToFloat(copy(Param1,I+2,Length(Param1))),
                               StrToFloat(Param2),StrToFloat(Param3)))
       else
       if Param4 = '>' then
          Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) >
                               StrToFloat(copy(Param1,I+2,Length(Param1))),
                               StrToFloat(Param2),StrToFloat(Param3)))
       else
       if Param4 = '>=' then
          Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) >=
                               StrToFloat(copy(Param1,I+2,Length(Param1))),
                               StrToFloat(Param2),StrToFloat(Param3)))
       else
       if Param4 = '<=' then
          Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) <=
                               StrToFloat(copy(Param1,I+2,Length(Param1))),
                               StrToFloat(Param2),StrToFloat(Param3)))
       else
       if Param4 = '<>' then
          Result := FloatToStr(IFF(StrToFloat(copy(Param1,1,I-1)) <>
                               StrToFloat(copy(Param1,I+2,Length(Param1))),
                               StrToFloat(Param2),StrToFloat(Param3)));
    end;}
  end;
end;

procedure InicializaFormula1;
begin
  Formula1 := TF1book.Create(Application);   
  bPassoaPasso := false;
end;

procedure FinalizaFormula1;
begin
  FreeAndNil(Formula1);
end;

function ExecutaFormula1(Expressao: string): real;
begin
  //Expressao := StringReplace(Expressao,',','.',[rfReplaceAll, rfIgnoreCase]);
  Expressao := StringReplace(Expressao,'.',',',[rfReplaceAll]);
  Expressao := StringReplace(Expressao,' ','',[rfReplaceAll]);
  try
    Formula1.MaxCol  := 1;
    Formula1.MaxRow  := 1;
    Formula1.Col     := 1;
    Formula1.Row     := 1;
    Formula1.Formula := Expressao;
    Result := StrToFloat(Formula1.Text);
  except
    Result := 0;
  end;
end;

function TABGENERICA(sTabela,sChave,sColPesq,sColCons,sOpcao: string): string;
var
  sTipoDado, sSqlAux2, sSqlAux, sValorAux, sCond, sOrder, sValorCampo,
  sLinha: string;
  Numero, FError: boolean;
begin
  // Caso Tipo de Pesquisa inválido, pesquisa igual (0)
  if (sOpcao <> '0') and (sOpcao <> '1') and (sOpcao <> '2') then
    sOpcao := '0';
  //------------------------------------------------------------------------------
  // Monta Condicoes do SQL de acordo com o Tipo de Pesquisa
  if (sOpcao = '0') or (sOpcao = '') then
  begin
    sCond  := ' = ';
    sOrder := '';
  end;

  if (sOpcao = '1') then
  begin
    sCond  := ' <= ';
    sOrder := ' ORDER BY 1 DESC ';
  end;

  if (sOpcao = '2') then
  begin
    sCond  := ' >= ';
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
    sTipoDado := dtmFolha.qryAux.FieldByName('IDTIPODADO').asString;
    dtmFolha.qryAux.Close;

    Numero := false;
    FError := false;
  except
    FError := true;
  end;

  if not(FError) then
  begin
    // Tipo de Dado NUMERICO
    if (sTipoDado = '1') then
    begin
      // Acerta Valor de pesquisa
      sChave := OraNumero(sChave);
//      sChave := Copy(sChave,2,Length(sChave)); //???????????????
//      sChave := Copy(sChave,1,Length(sChave)-1); //??????????????
      // Acerda ordenacao
      if (sOpcao = '1') then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','','')) DESC '
      else
      if (sOpcao = '2') then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','',''))      ';
      // Seta indicados de valor numerico
      Numero := true;
      // Monta e Executa a Consulta do Valor Desejado
      sSqlAux2 := 'SELECT '+
                  '  VALOR, NUMLINHA '+
                  'FROM   '+
                  '  (   '+
                  '   SELECT /*+ INDEX (VALTABGENER XPKVALTABGENER)*/'+
                  '     REPLACE(VALOR,'','',''.'') AS VALOR, NUMLINHA '+
                  '   FROM   '+
                  '     VALTABGENER  '+
                  '   WHERE  '+
                  '     CODTABELA = '+QuotedStr(sTabela)+' AND '+
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
      sLinha := dtmFolha.qryAux.FieldByName('NUMLINHA').asString;
    end
    else
    begin
      // Tipo de Dado ALFANUMERICO
      if (sTipoDado = '2') then
      begin
        sValorCampo := ' Valor ';
        sChave      := QuotedStr(sChave);
      end
      else
      begin
        // Tipo de Dado DATA
        if (sTipoDado = '3') then
        begin
          sValorCampo := 'TO_DATE(Valor,''DD/MM/YYYY'')';
          sChave      := 'TO_DATE('+schave+',''DD/MM/YYYY'')';
        end
        else
        begin
          // Outro Tipo ERRO
          if (sColPesq <> '''NUMLINHA''') then
          begin
            FError := true;
            Result := '-6010'
          end
          else
            sValorCampo := ' Valor ';
        end;
      end;
    end;

    //------------------------------------------------------------------------------
    // Caso não seja Numero Continua Rotina
    if not(Numero) then
    begin
      if (sColPesq <> '''NUMLINHA''') then
      begin
        if not(FError) then
        begin
          // Caso Dado tipo DATA
          if (sTipoDado = '3') then
          begin
            sSqlAux := 'SELECT TO_DATE(VALOR,''DD/MM/YYYY'') AS VALOR, NUMLINHA '+
                       'FROM VALTABGENER '+
                       'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                       '      CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+' AND '+
                        sValorCampo+sCond+sChave+' '+
                        sOrder;
          end
          else
          begin
            sSqlAux := 'SELECT VALOR, NUMLINHA '+
                       'FROM VALTABGENER '+
                       'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                       '      CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+' AND '+
                       sValorCampo+sCond+sChave+' '+
                       sOrder;
          end;

          if (sValorAux = '') then
            sValorAux := sValorCampo;

          if (sTipoDado = '1') then
          begin
            sSqlAux2 := 'SELECT TO_NUMBER(REPLACE(VALOR,''.'','','')) VALOR, NUMLINHA '+
                        'FROM VALTABGENER '+
                        'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                        '      CODCAMPO  = '+UpperCase(QuotedStr(sColPesq))+' AND '+
                        sValorAux+sCond+sChave+' '+
                        sOrder;
          end;

          dtmFolha.qryAux.Close;
          dtmFolha.qryAux.Sql.Clear;
          dtmFolha.qryAux.Sql.Add(sSqlAux);
          dtmFolha.qryAux.Open;

          sLinha := dtmFolha.qryAux.FieldByName('NUMLINHA').asString;

          if (sLinha = '') and (sTipoDado = '1') then
          begin
            dtmFolha.qryAux.Close;
            dtmFolha.qryAux.Sql.Clear;
            dtmFolha.qryAux.Sql.Add(sSqlAux2); // SQL feito para acabar com o bug do Oracle 8.0
            dtmFolha.qryAux.Open;
            sLinha := dtmFolha.qryAux.FieldByName('NUMLINHA').asString;
          end;

          if (sLinha = '') then
          begin
            FError := true;
            Result := '';
          end;
        end;
      end
      else
        slinha := sChave;
    end;

    if (sLinha = '') then
    begin
      if (sTipoDado = '1') then
         Result := '0'
      else
         Result := '';
      Exit;
    end;

    if not(FError) then
    begin
      sSqlAux := 'SELECT VALOR '+
                 'FROM VALTABGENER '+
                 'WHERE CODTABELA = '+QuotedStr(sTabela)+' AND '+
                 '      CODCAMPO  = '+UpperCase(QuotedStr(sColCons))+' AND '+
                 '      NUMLINHA = '+sLinha;
      dtmFolha.qryAux.Close;
      dtmFolha.qryAux.Sql.clear;
      dtmFolha.qryAux.Sql.add(sSqlAux);
      dtmFolha.qryAux.Open;
      Result := dtmFolha.qryAux.FieldByName('VALOR').asString;
    end;

    FError := false;
  end;

  // Caso Resultado Nulo, Retorna 1 espaço.
  if (Result = '') then
    Result := ' ';
end;

//******************************************************************************
// Formula, Consulta na Tabela Genérica
function TABLONGA(Linha: string): string;
var
  Formula, vTipo, wAux, wSQL, vSql, wTabela, wCampoResult,
  sTabela, Aux,  Reg, vOpAux, spar, vCmp, vOp, vVal: string;
  i, x: integer;
//   QryAux : TwwQuery;
  Achou: boolean;
begin
  Linha   := StringReplace(Linha, ' ', '', [rfReplaceAll]);
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
  if i > 0 then
  begin
    vTipo := Copy(Formula,i+1,Length(Formula));
     //vTipo := PegaValor(vTipo);
  end
  else
  begin
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

  for i := 1 to 10 do
  begin
    TabChaves[i].Campo := '';
    TabChaves[i].Valor := '';
    TabChaves[i].Op    := '';
    TabChaves[i].Tipo  := '';
  end;

  if vTipo = '1' then //caso vtipo seja igual a "um", consulta por CAMPOTABGENER (Tabela genérica)
  begin 
    x := 1;
    repeat
      i := Pos(';',Aux);
      if i > 0 then
      begin
        Reg := Copy(Aux,1,i-1);
        Aux := Copy(Aux,i+1,Length(Aux));
      end
      else
      begin
        Reg := Aux;
        Aux := '';
      end;
      if Pos('>=', Reg) > 0 then
      begin
        vCmp := Copy(Reg,1,Pos('>=',Reg)-1);
        vVal := Copy(Reg,Pos('>=',Reg)+2,Length(Reg));
        //TabChaves[x].Campo := PegaValor(vCmp);
        //TabChaves[x].Valor := PegaValor(vVal);
        TabChaves[x].Campo := vCmp;
        TabChaves[x].Valor := vVal;
        TabChaves[x].Op    := '>=';
        TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
      end
      else
      begin
        if Pos('<=', Reg) > 0 then
        begin
          vCmp := Copy(Reg,1,Pos('<=',Reg)-1);
          vVal := Copy(Reg,Pos('<=',Reg)+2,Length(Reg));
          //TabChaves[x].Campo := PegaValor(vCmp);
          //TabChaves[x].Valor := PegaValor(vVal);
          TabChaves[x].Campo := vCmp;
          TabChaves[x].Valor := vVal;
          TabChaves[x].Op    := '<=';
          TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
        end
        else
        begin
          if Pos('>', Reg) > 0 then
          begin
            vCmp := Copy(Reg,1,Pos('>',Reg)-1);
            vVal := Copy(Reg,Pos('>',Reg)+1,Length(Reg));
            //TabChaves[x].Campo := PegaValor(vCmp);
            //TabChaves[x].Valor := PegaValor(vVal);
            TabChaves[x].Campo := vCmp;
            TabChaves[x].Valor := vVal;
            TabChaves[x].Op    := '>';
            TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
          end
          else
          begin
            if Pos('<', Reg) > 0 then
            begin
              vCmp := Copy(Reg,1,Pos('<',Reg)-1);
              vVal := Copy(Reg,Pos('<',Reg)+1,Length(Reg));
              //TabChaves[x].Campo := PegaValor(vCmp);
              //TabChaves[x].Valor := PegaValor(vVal);
              TabChaves[x].Campo := vCmp;
              TabChaves[x].Valor := vVal;
              TabChaves[x].Op    := '<';
              TabChaves[x].Tipo  := TpDadoCons(sTabela, TabChaves[x].Campo);
            end
            else
            begin
              if Pos('=', Reg) > 0 then
              begin
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
    until (Aux = '');

    with (dtmFolha.QryAux) do
    begin
      Close;
      SQL.Clear;
      vSql := 'SELECT V.NUMLINHA, V.CODCAMPO, V.VALOR FROM	VALTABGENER V, ';
      for i := 1 to 10 do
      begin
        if TabChaves[i].Campo <> '' then
        begin
          if (TabChaves[i].Tipo = 'N') then
          begin
            vSql := vSql + '(SELECT AUX.NUMLINHA, AUX.CODCAMPO, AUX.VALOR FROM '+
                           '(SELECT NUMLINHA, CODCAMPO, CODTABELA, TO_NUMBER(VALOR, ''99999999999.9999'') AS VALOR FROM VALTABGENER) AUX '+
                           ' WHERE (AUX.CODTABELA = '''+sTabela+''') AND '+
                           '(AUX.CODCAMPO = '''+TabChaves[i].Campo+''') AND (AUX.VALOR'+TabChaves[i].Op+{pegavalor}(tabchaves[i].valor)+')) X'+InttoStr(i);
            if TabChaves[i+1].Campo <> '' then
              vSql := vSql + ', ';
            end
            else
            begin
              if (TabChaves[i].Tipo = 'A') then
              begin
                vSql := vSql + '(SELECT NUMLINHA, CODCAMPO, VALOR FROM VALTABGENER WHERE (CODTABELA = '''+sTabela+''') AND ';
                vSql := vSql + '(CODCAMPO = '''+TabChaves[i].Campo+''') AND (VALOR'+TabChaves[i].Op+''''+{pegavalor}(tabchaves[i].valor)+''')) X'+InttoStr(i);
                if TabChaves[i+1].Campo <> '' then
                  vSql := vSql + ', ';
              end
              else
              begin
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
        for i := 1 to 10 do
        begin
          if (i > 1) and (TabChaves[i].Campo <> '') then
            vSql := vSql + 'AND (X1.NUMLINHA = X'+InttoStr(i)+'.NUMLINHA) ';

          if TabChaves[i].Campo <> '' then
            vSql := vSql + 'AND (V.NUMLINHA = X'+InttoStr(i)+'.NUMLINHA) ';
        end;
        vSql := vsql + 'ORDER BY V.NUMLINHA';
        Sql.Add(vSql);
        Open;
      end;
      if (spar = '<=') then
        dtmFolha.QryAux.last;
      Result := dtmFolha.QryAux.FieldbyName('VALOR').asString;
      dtmFolha.QryAux.Close;
    end
    else
    begin  //caso seja diferente de zero consulta por LONGTABGENER (Table genérica longa)
      Result := '';
      wSQL   := Copy(Trim(Linha),2,(Pos(']',Trim(Linha))-2));
      if Trim(wSQL) = '' then
      begin
        MsgDlg('Erro nos parâmetros da pesquisa ...','Atenção',mterror,[mbOk],0);
        Result := '0';
        Exit;
      end;
        //wSQL := TrocaLetra(',',' AND ',wSQL);
        wSQL := StringReplace(wSQL,';',' AND ',[rfReplaceAll]);
        wAux := wSql;
        Linha        := Copy(Linha,(Pos(']',Linha)+1),Length(Linha));
        wTabela      := trim(Copy(Linha,(Pos(']',Linha)+1),(Pos(';',Linha)-1)));
        wCampoResult := trim(Copy(Linha,(Pos(';',Linha)+1),Length(Linha)));
        if Pos(';',Linha) <> 0 then
          wCampoResult := trim(UpperCase(Copy(Linha,(Pos(';',Linha)+1), Length(Linha))));
        //wCampoResult:=pegavalor(wCampoResult);

        with dtmFolha.QryAux do
        begin
          Close;
          Sql.Clear;
          vSql := 'SELECT LC.IDTABELA,LC.IDCAMPO,LC.DESCRICAO AS DESCRICAO FROM LONGCMPTABGENER LC, '+
                  '(SELECT IDTABELA, DESCRICAO FROM LONGTABGENER WHERE DESCRICAO = '''+wTabela+''') L '+
                  'WHERE LC.IDTABELA = L.IDTABELA';
          Sql.Add(vSql);
          Open;
        end;

        if dtmFolha.QryAux.Locate('DESCRICAO',wCampoResult,[]) then
          wCampoResult := 'C'+dtmFolha.QryAux.FieldbyName('IDCAMPO').asString
        else
        begin

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
                'IDTABELA = '+dtmFolha.QryAux.FieldbyName('IDTABELA').asString+' AND ';
        repeat
          i := Pos('=',wAux);
          Achou := false;
          if (Copy(wAux,i-1,1) = '<') or (Copy(wAux,i-1,1) = '>') or (Copy(wAux,i-1,1) = '=') then
          begin
            i := i -1;
            Achou := true;
          end;
          vCmp := Copy(wAux, 1,i-1); //Campo
          //vCmp := pegavalor(vCmp);
          if dtmFolha.QryAux.Locate('DESCRICAO',vCmp,[]) then
            vCmp := 'C'+dtmFolha.QryAux.FieldbyName('IDCAMPO').asString;

          wAux := Copy(wAux, i, Length(wAux));
          if Achou then
          begin
            vOp := Copy(wAux,1,2); //Operando
            //vOp := PegaValor(vOp);
            if Length(vOp) > 1 then
              vOpAux := vOp;
            wAux := Copy(wAux, 3, Length(wAux));
          end
          else
          begin
            vOp :=Copy(wAux,1,1); //Operando
            //vOp := PegaValor(vOp);
            if Length(vOp) > 1 then
              vOpAux := vOp;
            wAux := Copy(wAux, 2, Length(wAux));
          end;
          i := Pos(' AND ', wAux);
          if i > 0 then
          begin
            vVal := Copy(wAux,1,i-1);
            //vVal := pegavalor(vVal);
            wAux := Copy(wAux, i+5, Length(wAux));
            try
              StrToFloat(vVal);
              vSql := vSql + ''+vCmp+''+vOp+UpperCase(vVal)+' AND ';
            except
              vSql := vSql + ''+vCmp+''+vOp+''''+UpperCase(vVal)+''''+' AND ';
            end;
          end
          else
          begin
            vVal := Copy(wAux,1,Length(wAux));
            //vVal := pegavalor(vVal);
            try
              StrToFloat(vVal);
              vSql := vSql + ''+vCmp+''+vOp+UpperCase(vVal);
            except
              vSql := vSql + ''+vCmp+''+vOp+''''+UpperCase(vVal)+'''';
            end;
          end;
          i := Pos('=',wAux);
        until (i = 0);

        with dtmFolha.QryAux do
        begin
          Close;
          Sql.Clear;
          Sql.Add(vSql);
          Open;
          if vOpAux = '<=' then
            Last;
        end;

        if not dtmFolha.QryAux.IsEmpty then
          Result := dtmFolha.QryAux.FieldbyName(wCampoResult).asString
        else
          Result := '0';
        dtmFolha.QryAux.Close;
  end;
end;

function TpDadoCons(NomeTabGener, Campo : string) : string;
var
   vSql : string;
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
          Result := FieldbyName('TIPO').asString;
          Close;
     end;
end;

function Indice(sIndexador, sData, sExato:string): string;
var
//  i : integer;
  sAux, sSqlAux : string;
  sPer         : string[1];
  Ferror : boolean;
begin
  Ferror := false;

  if sData = 'HOJE' then
     sData := DateToStr(Date);

  if sData[1] = '''' then
    sData := copy(sData,2,Length(sData)-2);

  sIndexador:=QuotedStr(sIndexador);

  sSqlAux := 'SELECT 1 AS REGRA, MOECODIGO,MOEPERIODICIDADE '+
             'FROM MOEDA '+
             'WHERE UPPER(MOESIGLA) = Upper('+sIndexador+')';

  dtmFolha.qryAux.Close;
  dtmFolha.qryAux.Sql.clear;
  dtmFolha.qryAux.Sql.add(sSqlAux);
  dtmFolha.qryAux.Open;
  sAux := dtmFolha.qryAux.FieldByName('MoeCodigo').asString;
  sPer := dtmFolha.qryAux.FieldByName('MoePeriodicidade').asString;

  if not(FError) then
  begin
    if (sExato = '0') or (sExato = '') then
    begin
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
    end
    else
    begin
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
    result := FloatToStr(dtmFolha.qryAux.FieldByName('COTVALOR').asFloat);
    dtmFolha.qryAux.Close;
  end;
end;

function IRRF(NumDep,DataNasc,ValorBase,DataRef,TipodeResultado: string): string;
var
  Tipo: integer;
  fAliquota, fValorBase: double;
  IRRF: TIrrf;
  vSql: string;
begin
  if NumDep = '' then NumDep := '0';
  if ValorBase = '' then ValorBase := '0';
  if TipodeResultado = '' then TipodeResultado := '0';
  if DataNasc = '' then DataNasc := DateToStr(Date);
  if DataRef = '' then DataRef := DateToStr(Date);

  fValorBase := ExecutaFormula1(StringReplace(ValorBase,'.',',',[rfReplaceAll]));

  Tipo := StrtoInt(TipodeResultado);

  case (Tipo) of
    0..2 :
    begin
      IRRF := TIrrf.Create;
      IRRF.CarregaFaixasIRRF(dtmFolha.qryAux,Sistema.idEmpresa);
      Result := FloattoStr(irrf.CalculaIRRF(strtoint(numdep),strtodate(datanasc),fValorbase,fAliquota,dataref,Tipo));
      IRRF.Free;
    end;
    3 : vSql := 'SELECT IDADEIDOSO AS VALOR FROM PARAMIRRF';
    4 : vSql := 'SELECT VLRIDOSOS AS VALOR FROM PARAMIRRF';
    5 : vSql := 'SELECT VLRDEPENDENTE AS VALOR FROM PARAMIRRF';
  end;
  if (Tipo > 2) then
  begin
    with (dtmFolha.qryAux) do
    begin
      Close;
      Sql.Clear;
      Sql.Add(vSql);
      Open;
    end;
    Result := dtmFolha.qryAux.FieldbyName('VALOR').asString;
  end;
end;

function Maximo(Formula: string): string;
var
  FormulaAux: string;
  p, i: LongInt;
  Valor, Maior: real;
begin
  FormulaAux := Formula + ';';
  p := 1;
  Maior := 0;
  repeat
    i := Pos(';',FormulaAux);
    if (i = 0) then
      FormulaAux := '';
    try
      Valor := StrToFloat(Copy(FormulaAux,1,i-1));
      if (p = 1) or (Valor > Maior) then
        Maior := Valor;
      Inc(p);
    except
    end;
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
  until (FormulaAux = '');

  Result := FloatToStr(Maior);
end;

function Minimo(Formula: string): string;
var
  FormulaAux: string;
  p, i: LongInt;
  Valor, Menor: real;
begin
  FormulaAux := Formula + ';';
  p := 1;
  Menor := 0;
  repeat
    i := Pos(';',FormulaAux);
    if (i = 0) then
      FormulaAux := '';
    try
      Valor := StrToFloat(Copy(FormulaAux,1,i-1));
      if (p = 1) or (Valor < Menor) then
        Menor := Valor;
      Inc(p);
    except
    end;
    FormulaAux := Copy(FormulaAux,i+1,Length(FormulaAux));
  until (FormulaAux = '');

  Result := FloatToStr(Menor);
end;

//******************************************************************************
// Formula de Arredondamento
function Arredonda(FormulaLoc:string):string;
var
  I:integer;
  N,Variavel:string;
  Var2:Double;
begin
//------------------------------------------------------------------------------
// DECODIFICA FORMULA

// Retira Nome da Formula
  //FormulaLoc:=Copy(FormulaLoc,7,Length(FormulaLoc)-7);

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

function DifMesesArred (DataIni,DataFin:string): integer;
var
  D1,M1,A1,D2,M2,A2: integer;
begin
  try
    D1 := StrToInt(Copy(DataIni,1,2));
    M1 := StrToInt(Copy(DataIni,4,2));
    A1 := StrToInt(Copy(DataIni,7,4));
    D2 := StrToInt(Copy(DataFin,1,2));
    M2 := StrToInt(Copy(DataFin,4,2));
    A2 := StrToInt(Copy(DataFin,7,4));

    Result := (M2+12*A2)-(M1+12*A1);
    if M2 = 2 then
       if D2 >= 28 then D2 := 30;

    if M1 = 2 then
       if D1 >= 28 then D1 := 30;

    if (D2 - D1) >= 14 then
      Inc(Result);

    if (D2 - D1) < 0 then
       if D2 + iff(D1 = 31, 1, 31 - D1) < 15 then
         Dec(Result);
  except
    Result := 0;
  end;
end;

function Avos13     : integer;
begin
  with (dtmFolha.qryAuxFormaCalc) do
{  Result := DifMesesArred(iff(ExtraiAno(FieldByName('DATAADMISSAO').asDateTime) =
                          ExtraiAno(FieldByName('NORMALFIM').asDateTime),
                          FieldByName('DATAADMISSAO').asString,
                          '01/01/' + IntToStr(ExtraiAno(FieldByName('NORMALFIM').asDateTime))),
                          iff(FieldByName('TIPOSIT').asString = 'D',
                          FieldByName('DATADESLIGAMENTO').asString,
                          FieldByName('NORMALFIM').asString));
}
  // Alterado em 04/12/2002 para considerar a dif. meses e entrada até o dia 16,
  // independente do número de dias nos meses inicial e final 
  Result := iff(FieldByName('TIPOSIT').asString = 'D',
            ExtraiMes(FieldByName('DATADESLIGAMENTO').asDateTime),
            ExtraiMes(FieldByName('NORMALFIM').asDateTime)) -
            iff(ExtraiAno(FieldByName('DATAADMISSAO').asDateTime) =
            ExtraiAno(FieldByName('NORMALFIM').asDateTime),
            ExtraiMes(FieldByName('DATAADMISSAO').asDateTime), 1) + 1 -
            iff((ExtraiAno(FieldByName('DATAADMISSAO').asDateTime) =
                 ExtraiAno(FieldByName('NORMALFIM').asDateTime)) and
                (ExtraiDia(FieldByName('DATAADMISSAO').asDateTime) > 16), 1, 0) -
            iff((FieldByName('TIPOSIT').asString = 'D') and
                (ExtraiDia(FieldByName('DATADESLIGAMENTO').asDateTime) < 15), 1, 0);

  if Result < 0 then Result := 0;


end;

function AvosFerias : integer;
begin
  with (dtmFolha.qryAuxFormaCalc) do
  Result := DifMesesArred(FieldByName('PROXAQUISFER').asString,
                          iff(FieldByName('TIPOSIT').asString = 'D',
                          FieldByName('DATADESLIGAMENTO').asString,
                          FieldByName('NORMALFIM').asString));
end;

function QtdeDepen(DataRef,TipoDepen:string;IdadeMin,IdadeMax,OpcaoTempo:integer): double;
var
  Int1, Int2, Int3: Integer;
begin
  Int1 := OpcaoTempo;
  if Int1 > 2 then Int1 := Int1 - 2;
  with (dtmFolha.qryAux) do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT COUNT(*) AS CONTAGEM FROM DEPENTIT D, PESSOAFISICA P ');
    Sql.Add('WHERE D.IDTITULAR = ' + sUltPessoa);
    Sql.Add(' AND D.IDDEPENDENCIA = ' + QuotedStr(TipoDepen));
    Sql.Add(' AND TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
    Sql.Add(' - P.DATANASC)/365.25 * DECODE('+ IntToStr(Int1) + ',2,12,1))');
    Sql.Add(' BETWEEN ' + IntToStr(IdadeMin) + ' AND ' + IntToStr(IdadeMax));
    Sql.Add(' AND D.IDPESSOA = P.IDPESSOA');
    Open;
    Result := FieldByName('CONTAGEM').AsFloat;

    if (Result > 0) and (OpcaoTempo = 3) then // Anos
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT SUM(ROUND((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25 - TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25),2)) AS FRACAO,');
      Sql.Add(' COUNT(*) AS CONTAGEM');
      Sql.Add('FROM DEPENTIT D, PESSOAFISICA P ');
      Sql.Add('WHERE D.IDTITULAR = ' + sUltPessoa);
      Sql.Add(' AND D.IDDEPENDENCIA = ' + QuotedStr(TipoDepen));
      Sql.Add(' AND TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25 * DECODE('+ IntToStr(Int1) + ',2,12,1))');
      Sql.Add(' BETWEEN ' + IntToStr(IdadeMin) + ' AND ' + IntToStr(IdadeMin));
      Sql.Add(' AND D.IDPESSOA = P.IDPESSOA');
      Open;

      if FieldByName('CONTAGEM').AsInteger > 0 then
         Result := Result - FieldByName('CONTAGEM').AsInteger + FieldByName('FRACAO').AsFloat;

      Close;
      Sql.Clear;
      Sql.Add('SELECT SUM(ROUND((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25 - TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25),2)) AS FRACAO,');
      Sql.Add(' COUNT(*) AS CONTAGEM');
      Sql.Add('FROM DEPENTIT D, PESSOAFISICA P ');
      Sql.Add('WHERE D.IDTITULAR = ' + sUltPessoa);
      Sql.Add(' AND D.IDDEPENDENCIA = ' + QuotedStr(TipoDepen));
      Sql.Add(' AND TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25 * DECODE('+ IntToStr(Int1) + ',2,12,1))');
      Sql.Add(' BETWEEN ' + IntToStr(IdadeMax) + ' AND ' + IntToStr(IdadeMax));
      Sql.Add(' AND D.IDPESSOA = P.IDPESSOA');
      Open;

      if FieldByName('CONTAGEM').AsInteger > 0 then
         Result := Result - FieldByName('FRACAO').AsFloat;
    end;

    if (Result > 0) and (OpcaoTempo = 4) then // Meses
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT SUM(31 - DECODE(TO_NUMBER(TO_CHAR(P.DATANASC,''DD'')),31,30,');
      Sql.Add(' TO_NUMBER(TO_CHAR(P.DATANASC,''DD''))))/30 AS FRACAO,');
      Sql.Add(' COUNT(*) AS CONTAGEM');
      Sql.Add('FROM DEPENTIT D, PESSOAFISICA P ');
      Sql.Add('WHERE D.IDTITULAR = ' + sUltPessoa);
      Sql.Add(' AND D.IDDEPENDENCIA = ' + QuotedStr(TipoDepen));
      Sql.Add(' AND TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25 * DECODE('+ IntToStr(Int1) + ',2,12,1))');
      Sql.Add(' BETWEEN ' + IntToStr(IdadeMin) + ' AND ' + IntToStr(IdadeMin));
      Sql.Add(' AND D.IDPESSOA = P.IDPESSOA');
      Open;

      if FieldByName('CONTAGEM').AsInteger > 0 then
         Result := Result - FieldByName('CONTAGEM').AsInteger + FieldByName('FRACAO').AsFloat;

      Close;
      Sql.Clear;
      Sql.Add('SELECT SUM(31 - DECODE(TO_NUMBER(TO_CHAR(P.DATANASC,''DD'')),31,30,');
      Sql.Add(' TO_NUMBER(TO_CHAR(P.DATANASC,''DD''))))/30 AS FRACAO,');
      Sql.Add(' COUNT(*) AS CONTAGEM');
      Sql.Add('FROM DEPENTIT D, PESSOAFISICA P ');
      Sql.Add('WHERE D.IDTITULAR = ' + sUltPessoa);
      Sql.Add(' AND D.IDDEPENDENCIA = ' + QuotedStr(TipoDepen));
      Sql.Add(' AND TRUNC((TO_DATE(' + QuotedStr(DataRef) + ',''DD/MM/YYYY'') - 1');
      Sql.Add(' - P.DATANASC)/365.25 * DECODE('+ IntToStr(Int1) + ',2,12,1))');
      Sql.Add(' BETWEEN ' + IntToStr(IdadeMax) + ' AND ' + IntToStr(IdadeMax));
      Sql.Add(' AND D.IDPESSOA = P.IDPESSOA');
      Open;

      if FieldByName('CONTAGEM').AsInteger > 0 then
         Result := Result - FieldByName('FRACAO').AsFloat;


    end;


  end;
end;

end.


