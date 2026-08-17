unit UImportaArquivo;

//------------------------------------------------------------------------------
//SIG         : 101440
//Autor       : Luis Ferrari 
//Data        : 24/07/2023
//Descrição   : Importação Alteração de Valor do Benefício em Lote.
//------------------------------------------------------------------------------
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - validação e importação de arquivos Excel
//------------------------------------------------------------------------------
// Observação:
// Para utilizar essa biblioteca, defina um array do tipo TArrayStr no fonte
// e preencha com os nomes das colunas do layout
//------------------------------------------------------------------------------


interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ComObj, uCMTypes, Contnrs,StdCtrls;


type
  TRecVigencia = record
    sDtIni : string;
    sDtFim : string;
  end;
  TRecDadosNucleo = record
    iIdPessoa    : integer;
    iIdPessJur   : integer;
    iIdPlanoPrev : integer;
    iIdContrib   : integer;
    iIdNucleo    : array of integer;
    sPreparo     : string;
    iPercentual  : integer;
    sAnoMesIni   : string;
    sAnoMesFim   : string;
    iIdMotivo    : integer;
    sObservacao  : string;
  end;
// Inicio 101440 Ferrari
  TRecDadosBenef = record
    iIdPessoa    : integer;
    iIdTitular   : Integer;
    iIdPessJur   : integer;
    iIdPlanoPrev : integer;
    iSeqProposta : Integer;
    sMatricula   : string;
    iProcesso    : integer;
    dVlrSRB      : Double;
    dVlrAtualBS  : Double;
    dVlrAtualFAB : Double;
    dVlrAtual    : Double;
    dVlrTotalBS  : Double;
    dVlrTotalFAB : Double;
    dVlrTotal    : Double;
    dVlrSRBANT      : Double;
    dVlrAtualBSANT  : Double;
    dVlrAtualFABANT : Double;
    dVlrAtualANT    : Double;
    dVlrTotalBSANT  : Double;
    dVlrTotalFABANT : Double;
    dVlrTotalANT    : Double;
  end;
// Fim 101440

  TArrayImportacao = array of TRecDadosNucleo;
  TArrayImportaBenef = array of TRecDadosBenef;      // sig 101440 Ferrari

  TTipoAcao = (taPensionista, taParticipante);
  TOpcaoColuna = (ocObrigatoria, ocOpcional);

  TArrayStr = array of String;
  TArrayTipo = array of TTipoDado;
  TArrayOpcao = array of TOpcaoColuna;


function isNumeric(texto : String): Boolean;
function isFloat(texto : String): Boolean;
function ValidaAnoMes(anomes : String): Boolean;

{valida se as colunas da linha estão vazias}
function ValidaLinhaVazia(Excel: Variant; iLin: integer; iNumColunas : integer): boolean;

{valida se encontrou o final do arquivo}
function UltimaLinha(Excel: Variant; var linha: Integer; iValidaNProximas : byte; iNumColunas : integer): Boolean;

{valida se o layout do arquivo - nome e posição das colunas - está de acordo com o definido no array}
function ValidaLayout(Excel: Variant; vColunas : TArrayStr): Boolean;

{valida se o valor da celulca corresponde ao tipo de dado definido para coluna}
function ValidaDadosColuna(iLin, iCol  : integer;
                           Excel       : Variant;
                           sCampo      : string;
                           TipoColuna  : TTipoDado;
                           OpcaoColuna : TOpcaoColuna;
                           var lstValida  : TStringList;
                           var iNumFalhas : integer) : boolean;

{valida se o valor da celulca corresponde ao tipo de dado definido para coluna}
function ValidaDadosColunaExcel(iLin, iCol  : integer;
                           Excel       : Variant;
                           sCampo      : string;
                           TipoColuna  : TTipoDado;
                           OpcaoColuna : TOpcaoColuna;
                           var memValida  : TMemo;
                           var iNumFalhas : integer) : boolean;

{verifica se dados estão repetidos}
function DadosDuplicados(sTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; iNucleo : integer) : boolean; overload;

function DadosDuplicados(vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; vListaDados : TArrayImportacao) : boolean; overload;

{verifica se ja existe cadastrado o AnoMes para ContribuicaoxPlano }
function VerificaExisteAnoMesCadastrado(sTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; iNucleo : integer; var iIdAcao : integer) : boolean;

{verifica se AnoMes cadastrado está fora de um intervalo já encerrado}
function VerificaPeriodoDataIni(sNomeTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao) : boolean; overload;
function VerificaDataIniValida(sNomeTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; vListaDados : TArrayImportacao; var sMsg : string) : boolean;

{busca dado da Acao Vigente}
function VerificaAcaoJudicialVigente(vDadosProntos  : TRecDadosNucleo;
                                     iIdNucleo      : integer;
                                     TipoImporta    : TTipoAcao;
                                     sNomeTabela    : string;
                                     var sVigencia  : TRecVigencia;
                                     var iIdVigente : integer) : boolean;

function AcaoJudicialVigenteNucleo(iIdNucleo      : integer;
                                   iIdContrib     : integer;
                                   var sVigencia  : TRecVigencia;
                                   var iIdVigente : integer) : boolean;

function AcaoJudicialVigentePessoa(iIdPessoa      : integer;
                                   iIdContrib     : integer;
                                   var sVigencia  : string) : boolean;   overload;

function AcaoJudicialVigentePessoa(iIdPessoa      : integer;
                                   iIdPessJur     : integer;
                                   iIdPlanoPrev   : integer;
                                   iIdContrib     : integer;
                                   var sVigencia  : string) : boolean;   overload;

function AcaoJudicialVigenteParticip(iIdPessoa      : integer;
                                     iIdPessJur     : integer;
                                     iIdPlanoPrev   : integer;
                                     iIdContrib     : integer;
                                     var sVigencia  : TRecVigencia;
                                     var iIdVigente : integer) : boolean;


{importa ação judicial}
function ImportaAcaoJudicial(vDadosProntos : TArrayImportacao; bFazCommit : boolean; TipoImporta : TTipoAcao) : boolean;



implementation

uses
    UMensErro, UAdmPrev, UFuncoesUteis, uDataBase, DBaseDados;


function isFloat(texto : String): Boolean;
var
  x : Double;
  i: integer;
begin
  result := True;
  for i := 1 to length(texto) do
    if not(texto[i] in ['0'..'9',DecimalSeparator]) then
    begin
      result:= false;
      exit;
    end;

  try
    x := StrToFloat(texto) ;
  except
    result := False;
  end;
end;


function isNumeric(texto : String): Boolean;
var
  x : Double;
  i: integer;
begin
  result := True;
  for i := 1 to length(texto) do
    if not(texto[i] in ['0'..'9']) then
    begin
      result:= false;
      exit;
    end;

  try
    x := StrToInt(texto) ;
  except
    result := False;
  end;
end;

function ValidaAnoMes(anomes : String): Boolean;
begin
  try
    result := true;
    anomes := trim(anomes);

    if Length(anomes) <> 7 then
       result := false
    else if ((Copy(anomes,5,1)) <> '/' ) then
       result := false;

    if (result) and (not(isNumeric(Copy(anomes,1,4)) and isNumeric(Copy(anomes,6,2)))) then
       result := false;

    if (result) and ((StrToInt(Copy(anomes,6,2)) < 1) or (StrToInt(Copy(anomes,6,2)) >= 13)) then
       result := false;

  except
    result := false;
  end ;
end;


function ValidaLayout(Excel: Variant; vColunas : TArrayStr): Boolean;
var
  iCol : byte;
begin
  Result := true;

  // Para validar o Layout é verificado se os campos estão na ordem como foi especificado,
  // e os nomes dos campos também devem estar corretos
  for iCol := Low(vColunas) to High(vColunas) do
  begin
    if (AnsiUpperCase(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,iCol+1].Value))) <> vColunas[iCol]) then
    begin
      Result := false;
      Break;
    end;
  end;
end;


function ValidaLinhaVazia(Excel: Variant; iLin: integer; iNumColunas : integer): boolean;
var
  iCol : byte;
begin
  Result := true;
  
  // verificar se todos os campos da linha estão vazios
  for iCol := 1 to iNumColunas do
  begin
    if Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLin, iCol].Value)) <> '' then
    begin
      Result := false;
      break;
    end;
  end;
end;


function UltimaLinha(Excel: Variant; var linha: Integer; iValidaNProximas : byte; iNumColunas : integer): Boolean;
var
  iCol, linIni : integer;
  bUltimaLinha : boolean;
begin
  linIni := linha;

  // Para validar a última linha do arquivo, verificar se todos os campos da linha estão vazios
  repeat
    bUltimaLinha := ValidaLinhaVazia(Excel, linha, iNumColunas);

    // Se a linha do parametro estiver vazia, validar se as proximas 11 linhas tb estão
    if bUltimaLinha then
       inc(linha)

  until ((linha >= linIni+iValidaNProximas) or (not bUltimaLinha));

  Result := bUltimaLinha;
end;


function ValidaDadosColuna(iLin, iCol  : integer;
                           Excel       : Variant;
                           sCampo      : string;
                           TipoColuna  : TTipoDado;
                           OpcaoColuna : TOpcaoColuna;
                           var lstValida  : TStringList;
                           var iNumFalhas : integer) : boolean;
var
  sValor : string;
  bTipoValido : boolean;
begin
  Result := true;

  // valida se coluna está vazia
  sValor := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLin, iCol].Value));
  if (sValor = '') and (OpcaoColuna = ocObrigatoria) then
  begin
    lstValida.Add('LINHA ' + IntToStr(iLin) + ': O campo '+sCampo+' está vazio.');
    inc(iNumFalhas);
    Result := false;
  end;

  if Result then
  begin
    // valida se o conteúdo da célula é compatível com tipo de dado
    bTipoValido := true;
    case TipoColuna of
      tdReal    : bTipoValido  := isFloat(sValor);
      tdInteger : bTipoValido := isNumeric(sValor);
      tdBoolean : bTipoValido := not((AnsiUpperCase(sValor) = 'SIM') or (AnsiUpperCase(sValor) = 'NÃO'));
      tdDate    : if ((OpcaoColuna = ocOpcional) and (sValor <> '')) or (OpcaoColuna = ocObrigatoria) then
                     bTipoValido := ValidaAnoMes(sValor);
    end;

    if not bTipoValido then
    begin
      lstValida.Add('LINHA ' + IntToStr(iLin) + ': O campo '+sCampo+' está inconsistente.');
      inc(iNumFalhas);
      Result := false;
    end;
  end;
end;

function ValidaDadosColunaExcel(iLin, iCol  : integer;
                           Excel          : Variant;
                           sCampo         : string;
                           TipoColuna     : TTipoDado;
                           OpcaoColuna    : TOpcaoColuna;
                           var memValida  : TMemo;
                           var iNumFalhas : integer) : boolean;
var
  sValor : string;
  bTipoValido : boolean;
begin
  Result := true;

  // valida se coluna está vazia
  sValor := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLin, iCol].Value));
  if (sValor = '') and (OpcaoColuna = ocObrigatoria) then
  begin
    memValida.Lines.Add('LINHA ' + IntToStr(iLin) + ': O campo '+sCampo+' está vazio.');
    inc(iNumFalhas);
    Result := false;
  end;

  if Result then
  begin
    // valida se o conteúdo da célula é compatível com tipo de dado
    bTipoValido := true;
    case TipoColuna of
      tdReal    : bTipoValido  := isFloat(sValor);
      tdInteger : bTipoValido := isNumeric(sValor);
      tdBoolean : bTipoValido := not((AnsiUpperCase(sValor) = 'SIM') or (AnsiUpperCase(sValor) = 'NÃO'));
      tdDate    : if ((OpcaoColuna = ocOpcional) and (sValor <> '')) or (OpcaoColuna = ocObrigatoria) then
                     bTipoValido := ValidaAnoMes(sValor);
    end;

    if not bTipoValido then
    begin
      memValida.Lines.Add(Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLin, 1].Value)) + '    ' +
                          Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLin, 2].Value))+ '  O campo '+sCampo+' está inconsistente.');
      inc(iNumFalhas);
      Result := false;
    end;
  end;
end;


function VerificaAcaoJudicialVigente(vDadosProntos  : TRecDadosNucleo;
                                     iIdNucleo      : integer;
                                     TipoImporta    : TTipoAcao;
                                     sNomeTabela    : string;
                                     var sVigencia  : TRecVigencia;
                                     var iIdVigente : integer) : boolean;
begin
  if TipoImporta = taPensionista then
     result := AcaoJudicialVigenteNucleo(iIdNucleo, vDadosProntos.iIdContrib, sVigencia, iIdVigente)
  else
     result := AcaoJudicialVigenteParticip(vDadosProntos.iIdPessoa, vDadosProntos.iIdPessJur,
                                           vDadosProntos.iIdPlanoPrev, vDadosProntos.iIdContrib, sVigencia, iIdVigente);
end;



function AcaoJudicialVigentePessoa(iIdPessoa      : integer;
                                   iIdContrib     : integer;
                                   var sVigencia  : string) : boolean;
var
  _qryAux : TwwQuery;
begin
  _qryAux := TwwQuery.create(nil);
  _qryAux.DatabaseName := 'BaseDados';
  try
    _qryAux.Close;
    _qryAux.sql.clear;
    _qryAux.SQL.Add('SELECT AC.IDCONTRIBACJUDDEFICIT, AC.ANOMESINIACJUDDEFICIT  ');
    _qryAux.SQL.Add('  FROM DEPENTIT DP  ');
    _qryAux.SQL.Add('  JOIN NUCLEOFAMILIAR NF ON NF.IDTITULAR = DP.IDTITULAR                           ');
    _qryAux.SQL.Add('  JOIN CONTRIBPREVNUCLEO CPN ON CPN.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR        ');
    _qryAux.SQL.Add('  join CONTRIBNUCLEOACJUDDEFICIT AC ON AC.IDCONTRIBUICAO   = CPN.IDCONTRIBUICAO   ');
    _qryAux.SQL.Add('                                   AND AC.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR ');
    _qryAux.SQL.Add(' WHERE CPN.IDCONTRIBUICAO = '+IntToStr(iIdContrib) );
    _qryAux.SQL.Add('   AND DP.IDPESSOA = '+IntToStr(iIdPessoa)         );
    _qryAux.SQL.Add('   AND ((ANOMESFIMACJUDDEFICIT IS NULL) OR (TO_DATE(ANOMESFIMACJUDDEFICIT, ''YYYY/MM'') > SYSDATE)) ');
    _qryAux.SQL.Add('ORDER BY AC.ANOMESINIACJUDDEFICIT DESC ');

    if not _qryAux.eof then
       sVigencia  := _qryAux.Fields[1].AsString;

    Result := not _qryAux.eof;

  finally
    FreeAndNil(_qryAux);
  end;
end;


function AcaoJudicialVigentePessoa(iIdPessoa      : integer;
                                   iIdPessJur     : integer;
                                   iIdPlanoPrev   : integer;
                                   iIdContrib     : integer;
                                   var sVigencia  : string) : boolean;   overload;
var
  _qryAux : TwwQuery;
begin
  _qryAux := TwwQuery.create(nil);
  _qryAux.DatabaseName := 'BaseDados';
  try
    _qryAux.Close;
    _qryAux.sql.clear;
    _qryAux.SQL.Add('SELECT AC.IDCONTRIBACJUDDEFICIT, AC.ANOMESINIACJUDDEFICIT ');
    _qryAux.SQL.Add('  FROM CONTRIBPARTPACJUDDEFICIT CPP                       ');
    _qryAux.SQL.Add(' WHERE CPP.IDCONTRIBUICAO = '+IntToStr(iIdContrib) );
    _qryAux.SQL.Add('   AND CPP.IDPESSOA       = '+IntToStr(iIdPessoa)  );
    _qryAux.SQL.Add('   AND CPP.IDPESSJUR      = '+IntToStr(iIdPessJur)  );
    _qryAux.SQL.Add('   AND CPP.IDPLANOPREV    = '+IntToStr(iIdPlanoPrev)  );
    _qryAux.SQL.Add('   AND CPP.SEQPROPOSTA = 1' );
    _qryAux.SQL.Add('   AND ((ANOMESFIMACJUDDEFICIT IS NULL) OR (TO_DATE(ANOMESFIMACJUDDEFICIT, ''YYYY/MM'') > SYSDATE)) ');
    _qryAux.SQL.Add('ORDER BY AC.ANOMESINIACJUDDEFICIT DESC ');

    if not _qryAux.eof then
       sVigencia  := _qryAux.Fields[1].AsString;

    Result := not _qryAux.eof;

  finally
    FreeAndNil(_qryAux);
  end;
end;


function AcaoJudicialVigenteNucleo(iIdNucleo      : integer;
                                   iIdContrib     : integer;
                                   var sVigencia  : TRecVigencia;
                                   var iIdVigente : integer) : boolean;
var
  _qryAux : TwwQuery;
begin
  _qryAux := TwwQuery.create(nil);
  _qryAux.DatabaseName := 'BaseDados';
  try
    _qryAux.Close;
    _qryAux.sql.clear;
    _qryAux.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT, ANOMESINIACJUDDEFICIT, ANOMESFIMACJUDDEFICIT ');
    _qryAux.SQL.Add('FROM   CONTRIBNUCLEOACJUDDEFICIT');
    _qryAux.SQL.Add('WHERE  IDCONTRIBUICAO   = '+IntToStr(iIDContrib));
    _qryAux.SQL.Add('AND    ((ANOMESFIMACJUDDEFICIT IS NULL) OR ');
    _qryAux.SQL.Add('        (ANOMESFIMACJUDDEFICIT > '+QuotedStr(FormatDateTime('YYYY/MM', Date))+')) ');
    _qryAux.SQL.Add('AND  IDNUCLEOFAMILIAR = '+IntToStr(iIdNucleo));
    _qryAux.SQL.Add('ORDER BY ANOMESINIACJUDDEFICIT DESC ');
    _qryAux.open;
    if not _qryAux.eof then
    begin
      iIdVigente := _qryAux.Fields[0].AsInteger;
      sVigencia.sDtIni := _qryAux.Fields[1].AsString;
      sVigencia.sDtFim := _qryAux.Fields[2].AsString;
    end;

    Result := not _qryAux.eof;

  finally
    FreeAndNil(_qryAux);
  end;
end;


function AcaoJudicialVigenteParticip(iIdPessoa      : integer;
                                     iIdPessJur     : integer;
                                     iIdPlanoPrev   : integer;
                                     iIdContrib     : integer;
                                     var sVigencia  : TRecVigencia;
                                     var iIdVigente : integer) : boolean;
var
  _qryAux : TwwQuery;
begin
  _qryAux := TwwQuery.create(nil);
  _qryAux.DatabaseName := 'BaseDados';
  try
    _qryAux.Close;
    _qryAux.sql.clear;
    _qryAux.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT, ANOMESINIACJUDDEFICIT, ANOMESFIMACJUDDEFICIT ');
    _qryAux.SQL.Add('FROM   CONTRIBPARTPACJUDDEFICIT');
    _qryAux.SQL.Add('WHERE  IDCONTRIBUICAO   = '+IntToStr(iIDContrib));
    _qryAux.SQL.Add('AND    ((ANOMESFIMACJUDDEFICIT IS NULL) OR ');
    _qryAux.SQL.Add('        (ANOMESFIMACJUDDEFICIT > '+QuotedStr(FormatDateTime('YYYY/MM', Date))+')) ');
    _qryAux.SQL.Add('AND  IDPESSOA    = '+IntToStr(iIdPessoa));
    _qryAux.SQL.Add('AND  IDPESSJUR   = '+IntToStr(iIdPessJur));
    _qryAux.SQL.Add('AND  IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
    _qryAux.SQL.Add('AND  SEQPROPOSTA = 1');
    _qryAux.SQL.Add('ORDER BY ANOMESINIACJUDDEFICIT DESC ');
    _qryAux.open;
    if not _qryAux.eof then
    begin
      iIdVigente := _qryAux.Fields[0].AsInteger;
      sVigencia.sDtIni := _qryAux.Fields[1].AsString;
      sVigencia.sDtFim := _qryAux.Fields[2].AsString;
    end;

    Result := not _qryAux.eof;

  finally
    FreeAndNil(_qryAux);
  end;
end;


function ImportaAcaoJudicial(vDadosProntos : TArrayImportacao; bFazCommit : boolean; TipoImporta : TTipoAcao) : boolean;
var
  Index    : integer;
  iNucleo  : integer;
  qryAux   : TwwQuery;
  qryInc   : TwwQuery;
  qryAlt   : TwwQuery;
  dDataEnc : TDatetime;
  Operacao : TOperacao;
  bInTrans : boolean;
  sAnoMesVig : TRecVigencia;
  iIdAcaoVigente : integer;
  iIdNucleo   : integer;
  sNomeTabela : string;
begin
  qryAux := TwwQuery.create(nil);
  qryAux.DatabaseName := 'BaseDados';

  sNomeTabela := iff(TipoImporta = taPensionista, 'CONTRIBNUCLEOACJUDDEFICIT', 'CONTRIBPARTPACJUDDEFICIT');

  qryAlt  := TwwQuery.create(nil);
  qryAlt.DatabaseName := 'BaseDados';
  qryAlt.SQL.Add('UPDATE '+sNomeTabela  );
  qryAlt.SQL.Add('SET  ');
  qryAlt.SQL.Add('  FLGPREPARO            = :FLGPREPARO,            ');
  qryAlt.SQL.Add('  PERCACJUDDEFICIT      = :PERCACJUDDEFICIT,      ');
  qryAlt.SQL.Add('  ANOMESINIACJUDDEFICIT = :ANOMESINIACJUDDEFICIT, ');
  qryAlt.SQL.Add('  ANOMESFIMACJUDDEFICIT = :ANOMESFIMACJUDDEFICIT, ');
  qryAlt.SQL.Add('  IDMOTIVOACJUDDEFICIT  = :IDMOTIVOACJUDDEFICIT,  ');
  qryAlt.SQL.Add('  OBSACJUDDEFICIT       = :OBSACJUDDEFICIT        ');
  qryAlt.SQL.Add('WHERE  IDCONTRIBACJUDDEFICIT = :IDCONTRIBACJUDDEFICIT ');

  
  qryInc  := TwwQuery.create(nil);
  qryInc.DatabaseName := 'BaseDados';
  qryInc.SQL.Add('INSERT INTO '+sNomeTabela  );
  qryInc.SQL.Add('( IDCONTRIBACJUDDEFICIT,              ');
  if TipoImporta = taPensionista then
     qryInc.SQL.Add('  IDNUCLEOFAMILIAR,                ')
  else
  begin
     qryInc.SQL.Add('  IDPESSJUR,                       ');
     qryInc.SQL.Add('  IDPLANOPREV,                     ');
     qryInc.SQL.Add('  IDPESSOA,                        ');
     qryInc.SQL.Add('  SEQPROPOSTA,                     ');
  end;
  qryInc.SQL.Add('  IDCONTRIBUICAO,                     ');
  qryInc.SQL.Add('  FLGPREPARO,                         ');
  qryInc.SQL.Add('  PERCACJUDDEFICIT,                   ');
  qryInc.SQL.Add('  ANOMESINIACJUDDEFICIT,              ');
  qryInc.SQL.Add('  ANOMESFIMACJUDDEFICIT,              ');
  qryInc.SQL.Add('  IDMOTIVOACJUDDEFICIT,               ');
  qryInc.SQL.Add('  OBSACJUDDEFICIT                     ');
  qryInc.SQL.Add(')                                     ');
  qryInc.SQL.Add('VALUES                                ');
  qryInc.SQL.Add('( :IDCONTRIBACJUDDEFICIT,             ');
  if TipoImporta = taPensionista then
     qryInc.SQL.Add('  :IDNUCLEOFAMILIAR,               ')
  else
  begin
     qryInc.SQL.Add('  :IDPESSJUR,                      ');
     qryInc.SQL.Add('  :IDPLANOPREV,                    ');
     qryInc.SQL.Add('  :IDPESSOA,                       ');
     qryInc.SQL.Add('  :SEQPROPOSTA,                    ');
  end;
  qryInc.SQL.Add('  :IDCONTRIBUICAO,                    ');
  qryInc.SQL.Add('  :FLGPREPARO,                        ');
  qryInc.SQL.Add('  :PERCACJUDDEFICIT,                  ');
  qryInc.SQL.Add('  :ANOMESINIACJUDDEFICIT,             ');
  qryInc.SQL.Add('  :ANOMESFIMACJUDDEFICIT,             ');
  qryInc.SQL.Add('  :IDMOTIVOACJUDDEFICIT,              ');
  qryInc.SQL.Add('  :OBSACJUDDEFICIT                    ');
  qryInc.SQL.Add(')                                     ');

  try
    bInTrans := dtmBaseDados.dbBaseDados.InTransaction;
    if (not bInTrans) and (bFazCommit) then
       dtmBaseDados.dbBaseDados.StartTransaction;

    try
      for index := low(vDadosProntos) to high(vDadosProntos) do
      begin

        // inclui para todos os núcleos
        for iNucleo := low(vDadosProntos[index].iIdNucleo) to high(vDadosProntos[index].iIdNucleo) do
        begin
          // assume que será uma inclusao
          Operacao := opInserir;

          sAnoMesVig.sDtIni := '';
          sAnoMesVig.sDtFim := '';

          iIdNucleo := iff(TipoImporta = taPensionista, vDadosProntos[index].iIdNucleo[iNucleo], 1);

          if (TipoImporta = taPensionista) and (iIdNucleo = -1) then
             continue;

          if VerificaAcaoJudicialVigente(vDadosProntos[index], iIdNucleo, TipoImporta, sNomeTabela, sAnoMesVig, iIdAcaoVigente) then
          begin
            //se o AnoMes da vigente = sAnoMesIni informado,  alterar os dados da ação vigente
            if (sAnoMesVig.sDtIni = vDadosProntos[index].sAnoMesIni) then
               Operacao := opAlterar
            else
            //se o AnoMes da vigente < sAnoMesIni informado, encerrar a ação vigente com sAnoMesIni -1
            if (vDadosProntos[index].sAnoMesIni > sAnoMesVig.sDtIni) then
            begin
              if (sAnoMesVig.sDtFim <> '') and (vDadosProntos[index].sAnoMesIni < sAnoMesVig.sDtFim) then
                 continue
              else
              begin
                try
                  dDataEnc := StrToDate('01/'+Copy(vDadosProntos[index].sAnoMesIni,6,2)+'/'+Copy(vDadosProntos[index].sAnoMesIni,1,4));
                  dDataEnc := IncMonth(dDataEnc, -1);

                  // muda data da ação vigente
                  qryAux.close;
                  qryAux.SQL.text := 'update '+sNomeTabela+
                                     '   set ANOMESFIMACJUDDEFICIT = '+Quotedstr( FormatDateTime('YYYY/MM', dDataEnc) ) +
                                     ' where IDCONTRIBACJUDDEFICIT = '+IntToStr(iIdAcaoVigente);
                  qryAux.ExecSQL;

                except
                  MsgDlg('Erro ao atualizar Data Final.', 'Atenção', mtInformation, [mbOk], 0);
                end;
              end;
            end
            else
              continue;
            //se estiver cadastrando uma acao sem AnoMesFim e for < acao vigente, preencher AnoMesFim
            {if (vDadosProntos[index].sAnoMesIni < sAnoMesVig.sDtIni) and (vDadosProntos[index].sAnoMesFim = '')  then
            begin
              dDataEnc := StrToDate('01/'+Copy(sAnoMesVig.sDtIni,6,2)+'/'+Copy(sAnoMesVig.sDtIni,1,4));
              dDataEnc := IncMonth(dDataEnc, -1);

              vDadosProntos[index].sAnoMesFim := FormatDateTime('YYYY/MM', dDataEnc);
            end; }
          end
          else
          begin
            if VerificaExisteAnoMesCadastrado(sNomeTabela, qryAux, vDadosProntos[index], TipoImporta, iIdNucleo, iIdAcaoVigente) then
               Operacao := opAlterar
            else if not VerificaPeriodoDataIni(sNomeTabela, qryAux, vDadosProntos[index], TipoImporta) then
               continue;
          end;

          if Operacao = opInserir then
          begin
            if (not DadosDuplicados(sNomeTabela, qryAux, vDadosProntos[index], TipoImporta, iIdNucleo)) then
            begin
              qryInc.close;
              qryInc.ParamByName('IDCONTRIBACJUDDEFICIT').AsInteger := LeUltRegistro(nil, sNomeTabela );

              if TipoImporta = taPensionista then
                 qryInc.ParamByName('IDNUCLEOFAMILIAR').AsInteger   := vDadosProntos[index].iIdNucleo[iNucleo]
              else
              begin
                 qryInc.ParamByName('IDPESSJUR').AsInteger     := vDadosProntos[index].iIdPessJur;
                 qryInc.ParamByName('IDPLANOPREV').AsInteger   := vDadosProntos[index].iIdPlanoPrev;
                 qryInc.ParamByName('IDPESSOA').AsInteger      := vDadosProntos[index].iIdPessoa;
                 qryInc.ParamByName('SEQPROPOSTA').AsInteger   := 1;
              end;

              qryInc.ParamByName('IDCONTRIBUICAO').AsInteger        := vDadosProntos[index].iIdContrib;
              qryInc.ParamByName('FLGPREPARO').AsString             := vDadosProntos[index].sPreparo;
              qryInc.ParamByName('PERCACJUDDEFICIT').AsFloat        := vDadosProntos[index].iPercentual;
              qryInc.ParamByName('IDMOTIVOACJUDDEFICIT').AsInteger  := vDadosProntos[index].iIdMotivo;
              qryInc.ParamByName('ANOMESINIACJUDDEFICIT').AsString  := vDadosProntos[index].sAnoMesIni;
              qryInc.ParamByName('ANOMESFIMACJUDDEFICIT').AsString  := vDadosProntos[index].sAnoMesFim;
              qryInc.ParamByName('OBSACJUDDEFICIT').AsString        := vDadosProntos[index].sObservacao;
              qryInc.ExecSQL;
            end;
          end
          else
          begin
            qryAlt.close;
            qryAlt.ParamByName('FLGPREPARO').AsString             := vDadosProntos[index].sPreparo;
            qryAlt.ParamByName('PERCACJUDDEFICIT').AsFloat        := vDadosProntos[index].iPercentual;
            qryAlt.ParamByName('IDMOTIVOACJUDDEFICIT').AsInteger  := vDadosProntos[index].iIdMotivo;
            qryAlt.ParamByName('ANOMESINIACJUDDEFICIT').AsString  := vDadosProntos[index].sAnoMesIni;
            qryAlt.ParamByName('ANOMESFIMACJUDDEFICIT').AsString  := vDadosProntos[index].sAnoMesFim;
            qryAlt.ParamByName('OBSACJUDDEFICIT').AsString        := vDadosProntos[index].sObservacao;
            qryAlt.ParamByName('IDCONTRIBACJUDDEFICIT').AsInteger := iIdAcaoVigente;
            qryAlt.ExecSQL;
          end;

        end;

      end;

      if (not bInTrans) and (bFazCommit) then
         dtmBaseDados.dbBaseDados.Commit;

      Result := true;
    except
      begin
       if (not bInTrans) and (bFazCommit) then
           dtmBaseDados.dbBaseDados.Rollback;
           
        Result := false;
        MsgDlg('Erro ao importar Ação Judicial.', 'Atenção', mtError, [mbOk], 0);
      end;
    end;

  finally
    FreeAndNil(qryAux);
    FreeAndNil(qryInc);
    FreeAndNil(qryAlt);
  end;
end;


function VerificaExisteAnoMesCadastrado(sTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; iNucleo : integer; var iIdAcao : integer) : boolean;
begin
  _qry.close;
  _qry.Sql.text := 'SELECT IDCONTRIBACJUDDEFICIT ' +
                   '  FROM '+sTabela+
                   ' WHERE IDCONTRIBUICAO        = '+IntToStr(vDados.iIdContrib)+
                   '   AND ANOMESINIACJUDDEFICIT = '+QuotedStr(vDados.sAnoMesIni);

  if TipoImporta = taPensionista then
     _qry.SQL.text := _qry.SQL.text + '   AND IDNUCLEOFAMILIAR = '+IntToStr(iNucleo)
  else
  begin
     _qry.SQL.text := _qry.SQL.text +
     '   AND IDPESSJUR   = '+IntToStr(vDados.iIdPessJur)+
     '   AND IDPLANOPREV = '+IntToStr(vDados.iIdPlanoPrev)+
     '   AND IDPESSOA    = '+IntToStr(vDados.iIdPessoa)+
     '   AND SEQPROPOSTA = 1';
  end;

  _qry.Open;
  if not _qry.eof then
     iIdAcao := _qry.Fields[0].AsInteger;

  Result := not _qry.eof;
end;


function DadosDuplicados(sTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; iNucleo : integer) : boolean;
begin
  _qry.close;
  _qry.Sql.text := 'SELECT IDCONTRIBACJUDDEFICIT ' +
                   '  FROM '+sTabela+
                   ' WHERE IDCONTRIBUICAO        = '+IntToStr(vDados.iIdContrib)+
                   '   AND FLGPREPARO            = '+Quotedstr(vDados.sPreparo)+
                   '   AND PERCACJUDDEFICIT      = '+FloatToStr(vDados.iPercentual)+
                   '   AND ANOMESINIACJUDDEFICIT = '+Quotedstr(vDados.sAnoMesIni)+
                   '   AND ANOMESFIMACJUDDEFICIT = '+Quotedstr(vDados.sAnoMesFim)+
                   '   AND IDMOTIVOACJUDDEFICIT  = '+IntToStr(vDados.iIdMotivo);

  if TipoImporta = taPensionista then
     _qry.SQL.text := _qry.SQL.text + '   AND IDNUCLEOFAMILIAR = '+IntToStr(iNucleo)
  else
  begin
     _qry.SQL.text := _qry.SQL.text +
     '   AND IDPESSJUR   = '+IntToStr(vDados.iIdPessJur)+
     '   AND IDPLANOPREV = '+IntToStr(vDados.iIdPlanoPrev)+
     '   AND IDPESSOA    = '+IntToStr(vDados.iIdPessoa)+
     '   AND SEQPROPOSTA = 1';
  end;

  _qry.Open;
  Result := not _qry.eof;
end;


function VerificaPeriodoDataIni(sNomeTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao) : boolean;
begin
  _qry.close;
  _qry.SQL.Clear;
  _qry.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT ');
  _qry.SQL.Add('  FROM '+sNomeTabela+' CND   ');

  if TipoImporta = taPensionista then
  begin
    _qry.SQL.Add('  JOIN NUCLEOFAMILIAR NF ON NF.IDNUCLEOFAMILIAR = CND.IDNUCLEOFAMILIAR ');
    _qry.SQL.Add('  JOIN CONTRIBPREVNUCLEO CPN ON CPN.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR  ');
    _qry.SQL.Add('                            AND CPN.IDNUCLEOFAMILIAR = CND.IDNUCLEOFAMILIAR ');
    _qry.SQL.Add('                            AND CPN.IDCONTRIBUICAO   = CND.IDCONTRIBUICAO   ');
    _qry.SQL.Add('  JOIN DEPENTIT DP ON NF.IDTITULAR = DP.IDTITULAR ');
  end;

  _qry.SQL.Add(' WHERE '+Quotedstr(vDados.sAnoMesIni)+' BETWEEN CND.ANOMESINIACJUDDEFICIT AND CND.ANOMESFIMACJUDDEFICIT ');
  _qry.SQL.Add('   AND CND.IDCONTRIBUICAO  = '+IntToStr(vDados.iIdContrib) );

  if TipoImporta = taPensionista then
     _qry.SQL.Add('   AND DP.IDPESSOA = '+IntToStr(vDados.iIdPessoa) )
  else
  begin
    _qry.SQL.Add('   AND CND.IDPESSJUR   = '+IntToStr(vDados.iIdPessJur)  );
    _qry.SQL.Add('   AND CND.IDPLANOPREV = '+IntToStr(vDados.iIdPlanoPrev));
    _qry.SQL.Add('   AND CND.IDPESSOA    = '+IntToStr(vDados.iIdPessoa)   );
    _qry.SQL.Add('   AND CND.SEQPROPOSTA = 1');
  end;
  _qry.Open;

  result := _qry.eof;
end;


function VerificaDataIniValida(sNomeTabela : string; _qry : TwwQuery; vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; vListaDados : TArrayImportacao; var sMsg : string) : boolean;
var
  i      : integer;
  bErro  : boolean;
  bAchou : boolean;
begin
  // verifica 1o nos registros ja cadastrados
  _qry.close;
  _qry.SQL.Clear;
  _qry.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT ');
  _qry.SQL.Add('  FROM '+sNomeTabela+' CND   ');

  if TipoImporta = taPensionista then
  begin
    _qry.SQL.Add('  JOIN NUCLEOFAMILIAR NF ON NF.IDNUCLEOFAMILIAR = CND.IDNUCLEOFAMILIAR ');
    _qry.SQL.Add('  JOIN CONTRIBPREVNUCLEO CPN ON CPN.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR  ');
    _qry.SQL.Add('                            AND CPN.IDNUCLEOFAMILIAR = CND.IDNUCLEOFAMILIAR ');
    _qry.SQL.Add('                            AND CPN.IDCONTRIBUICAO   = CND.IDCONTRIBUICAO   ');
    _qry.SQL.Add('  JOIN DEPENTIT DP ON NF.IDTITULAR = DP.IDTITULAR ');
  end;

  _qry.SQL.Add(' WHERE '+Quotedstr(vDados.sAnoMesIni)+' BETWEEN CND.ANOMESINIACJUDDEFICIT AND CND.ANOMESFIMACJUDDEFICIT ');
  _qry.SQL.Add('   AND CND.IDCONTRIBUICAO  = '+IntToStr(vDados.iIdContrib) );

  if TipoImporta = taPensionista then
     _qry.SQL.Add('   AND DP.IDPESSOA = '+IntToStr(vDados.iIdPessoa) )
  else
  begin
    _qry.SQL.Add('   AND CND.IDPESSJUR   = '+IntToStr(vDados.iIdPessJur)  );
    _qry.SQL.Add('   AND CND.IDPLANOPREV = '+IntToStr(vDados.iIdPlanoPrev));
    _qry.SQL.Add('   AND CND.IDPESSOA    = '+IntToStr(vDados.iIdPessoa)   );
    _qry.SQL.Add('   AND CND.SEQPROPOSTA = 1');
  end;
  _qry.Open;

  if not VerificaPeriodoDataIni(sNomeTabela, _qry, vDados, TipoImporta) then
  begin
    bErro := true;
    sMsg  := 'A data de início faz parte do intervalo de uma ação judicial cadastrada.';
  end;

  {se não tem na base, varre a lista de itens carregados pela planilha}
  if not bErro then
  begin
    i := low(vListaDados);
    while (not bErro) and (i <= high(vListaDados)) do
    begin
      bAchou := (vListaDados[i].iIdPessoa  = vDados.iIdPessoa)  and
                (vListaDados[i].iIdContrib = vDados.iIdContrib);
      if TipoImporta = taParticipante then
         bAchoU := (bAchou) and (vListaDados[i].iIdPessJur   = vDados.iIdPessJur)
                            and (vListaDados[i].iIdPlanoprev = vDados.iIdPlanoPrev);

      if bAchou then
      begin
        // ação vigente:
        //   - se DataIni < DataIni Acao vigente  ou
        //   - se DataIni > DataIni Acao vigente e DataIni < DataFim Acao Vigente
        if ((vListaDados[i].sAnoMesFim = '') or (vListaDados[i].sAnoMesFim >= FormatDateTime('YYYY/MM', date))) then
        begin
          if (vListaDados[i].sAnoMesIni > vDados.sAnoMesIni) or
             ((vListaDados[i].sAnoMesFim <> '') and (vDados.sAnoMesIni <= vListaDados[i].sAnoMesFim)) or
             ((vListaDados[i].sAnoMesFim = '') and (vDados.sAnoMesIni <= FormatDateTime('YYYY/MM', date))) then
          begin
            bErro := true;
            sMsg  := 'O campo ANOMESINICIO ' + vDados.sAnoMesIni + ' é menor que a ação vigente.';
          end;
        end
        else
        if (vDados.sAnoMesIni > vListaDados[i].sAnoMesIni) and
           (vListaDados[i].sAnoMesFim <> '') and (vDados.sAnoMesFim < vListaDados[i].sAnoMesFim) then
        begin
          bErro := true;
          sMsg  := 'A data de início faz parte do intervalo de uma ação judicial cadastrada.';
        end;
      end;
      
      inc(i);
    end;
  end;

  Result := bErro;

end;


function DadosDuplicados(vDados : TRecDadosNucleo; TipoImporta : TTipoAcao; vListaDados : TArrayImportacao) : boolean; overload;
var
  i      : integer;
  bErro  : boolean;
  bAchou : boolean;
begin
  bErro := false;

  {se não tem na base, varre a lista de itens carregados pela planilha}
  i := low(vListaDados);
  while (not bErro) and (i <= high(vListaDados)) do
  begin
    bAchou := (vListaDados[i].iIdPessoa  = vDados.iIdPessoa)  and
              (vListaDados[i].iIdContrib = vDados.iIdContrib);
    if TipoImporta = taParticipante then
       bAchou := (bAchou) and (vListaDados[i].iIdPessJur   = vDados.iIdPessJur)
                          and (vListaDados[i].iIdPlanoprev = vDados.iIdPlanoPrev);
    if bAchou then
    begin
      bErro := (vListaDados[i].sPreparo    = vDados.sPreparo) and
               (vListaDados[i].iPercentual = vDados.iPercentual) and
               (vListaDados[i].sAnoMesIni  = vDados.sAnoMesIni) and
               (vListaDados[i].sAnoMesFim  = vDados.sAnoMesFim) and
               (vListaDados[i].iIdMotivo   = vDados.iIdMotivo);
    end;

    inc(i);
  end;

  Result := bErro;

end;


end.
