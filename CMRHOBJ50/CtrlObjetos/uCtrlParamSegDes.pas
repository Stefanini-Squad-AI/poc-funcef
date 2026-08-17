// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 09/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlParamSegDes;

interface

uses SysUtils, Classes, Forms, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uCtrlFuncoesRH, USistema;

type
  TCtrlParamSegDes = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FSQL: TStringList;
    FU:   TCtrlFuncoesRH;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    function GerarDadosImpressao(Modelo: integer; DataRef: TDateTime;
      ListaIdEstab, ListaIdFunc, ListaIdRubricaMesRescisao, ListaIdRubricaOutrosMeses: string;
      TipoImpressaoAgenciaBanc: byte; NumAgenciaBanc, NomeAgenciaBanc: string): string;

    function ListSegDes(ListaIdEstab, ListaIdFunc, AnoMes, ListaIdRubricaMesRescisao,
      ListaIdRubricaOutrosMeses: string; TipoImpressaoAgenciaBanc: byte; NumAgenciaBanc,
      NomeAgenciaBanc: string): OleVariant;

    function TrataDados(Dado:string; Tipo:char; Tamanho:word): string;

    property SQL: TStringList read FSQL;
  end;

implementation

uses uCMTypes;

const
  MODELO_1951 = 0;
  MODELO_1953 = 1;
  MODELO_1960 = 2;

{ TCtrlParamSegDes }

constructor TCtrlParamSegDes.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FSQL := TStringList.Create;
  FU :=   TCtrlFuncoesRH.Create;
end;

destructor TCtrlParamSegDes.Destroy;
begin
  FSQL.Free;
  inherited;
end;

procedure TCtrlParamSegDes.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamSegDes.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlParamSegDes.ListSegDes(ListaIdEstab, ListaIdFunc, AnoMes,
  ListaIdRubricaMesRescisao, ListaIdRubricaOutrosMeses: string;
  TipoImpressaoAgenciaBanc: byte; NumAgenciaBanc, NomeAgenciaBanc: string): OleVariant;
var
  c: byte;
  DocID: array[1..5] of integer;
  _CdsAux: TCMClientDataSet;
begin
  for c:=1 to 5 do
    DocID[c] := 0;

  // Documentos
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO' +CR_LF+
      'FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO' +CR_LF+
      'WHERE ((TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') OR' +CR_LF+
      '       (TDO.SIGLADOCUMENTO = ''PIS:'') OR' +CR_LF+
      '       (TDO.SIGLADOCUMENTO = ''CTPS:'') OR' +CR_LF+
      '       (TDO.SIGLADOCUMENTO = ''CPF:'') OR' +CR_LF+
      '       (TDO.SIGLADOCUMENTO = ''CNPJ:'') OR' +CR_LF+
      '       (TDO.SIGLADOCUMENTO = ''CGC:'') OR' +CR_LF+
      '       (TDO.SIGLADOCUMENTO = ''CEI:'')) AND' +CR_LF+
      '      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');

    with (_CdsAux) do
    begin
      while not(EOF) do
      begin
        if (FieldByName('SIGLADOCUMENTO').asString = 'PIS:') or
           (FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
          DocID[1] := FieldByName('IDDOCUMENTO').asInteger
        else
        if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
          DocID[2] := FieldByName('IDDOCUMENTO').asInteger
        else
        if (FieldByName('SIGLADOCUMENTO').asString = 'CPF:') then
          DocID[3] := FieldByName('IDDOCUMENTO').asInteger
        else
        if (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') or
           (FieldByName('SIGLADOCUMENTO').asString = 'CGC:') then
          DocID[4] := FieldByName('IDDOCUMENTO').asInteger
        else
        if (FieldByName('SIGLADOCUMENTO').asString = 'CEI:') then
          DocID[5] := FieldByName('IDDOCUMENTO').asInteger;
        Next;
      end;
    end;
  finally
    _CdsAux.Free;
  end;

  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS ESTAB,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(E.LOGRADOURO) ||');
    Add('    TO_CHAR(DECODE(E.NUMERO,NULL,'''','', ''|| TO_CHAR(E.NUMERO))) ||');
    Add('    TO_CHAR(DECODE(E.BAIRRO,NULL,'''','', ''|| RTRIM(E.BAIRRO))) AS ENDERECO,');
    Add('  RTRIM(E.COMPLEMENTO) AS COMPLEMENTO,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) AS CEP1,');
    Add('  RTRIM(SUBSTR(E.CEP,6,3)) AS CEP2,');
    Add('  ES.CODESTADO AS UF,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE,');
    Add('  RTRIM(PEFIS.NOMEMAE) AS MAE,');
    Add('  TO_CHAR(DECODE(CNPJ.NUM,NULL,''2'',''1'')) AS TIPINSCEMP,');
    Add('  TO_CHAR(DECODE(CNPJ.NUM,NULL,CEI.NUM,CNPJ.NUM)) AS INSCEMP,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  PIS.NUM AS PIS,');
    Add('  RTRIM(CTPS.NUM) AS CTPS,');
    Add('  RTRIM(CTPS.UF) AS CTPS_UF,');
    Add('  CPF.NUM AS CPF,');
    Add('  C.CBO2002 AS CBO,');
    Add('  RTRIM(C.TITULO) AS OCUPACAO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DDMMYY'') AS ADMISSAO,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DDMMYY'') AS DEMISSAO,');
    Add('  TO_CHAR(DECODE(PEFIS.SEXO,''M'',1,''F'',2)) AS SEXO,');
    Add('  RTRIM(GI.IDGRINSTR) AS GRAUINSTRU,');
    Add('  TO_CHAR(PEFIS.DATANASC,''DDMMYY'') AS NASCIMENTO,');
    Add('  ROUND(HT.JORNADAMENSAL/5,0) AS HORASEMANA,');
    Add('  VAL_ANTEPENULT_SAL.MES AS MES_ANTEPENULT_SALARIO,');
    Add('  VAL_ANTEPENULT_SAL.VALOR AS ANTEPENULT_SALARIO,');
    Add('  VAL_PENULT_SAL.MES AS MES_PENULT_SALARIO,');
    Add('  VAL_PENULT_SAL.VALOR AS PENULT_SALARIO,');
    Add('  VAL_ULT_SAL.MES AS MES_ULT_SALARIO,');
    Add('  VAL_ULT_SAL.VALOR AS ULT_SALARIO,');
    Add('  LEAST(TRUNC((TO_NUMBER(F.DATADESLIGAMENTO - F.DATAADMISSAO)*12)/365.25),36) AS QUANT_TRAB_36MESES,');
    Add('  TO_NUMBER(DECODE(RECEB_SAL_6.QTDEMES,6,1,2)) AS RECEB_SAL_6_MESES,');
    Add('  ''104'' AS N_BANCO,');

    // Se imprime Agência do Funcionário...
    // 0 -> Agência do FGTS
    // 1 -> Agência selecionada
    // 2 -> Não imprime Agência
    case (TipoImpressaoAgenciaBanc) of
      0 : Add('  SUBSTR(AG.NUMAGENCIA,1,4) ||'' ''|| SUBSTR(AG.NUMAGENCIA,5,1) AS N_AGENCIA,');
      1 : Add('  '+Trim(QuotedStr(Copy(NumAgenciaBanc,1,4)+' '+
            Copy(NumAgenciaBanc,6,1)))+' AS N_AGENCIA,');
      2 : Add('  '' '' AS N_AGENCIA,');
    end;

    Add('  TO_NUMBER(DECODE(F.DATADESLIGAMENTO,F.DATAAVISO,1,2)) AS AVISOPREVIO');
    Add('FROM');

    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,');
    Add('  FILIALPESSOA FP, CARGO C,' +
      IFF(TipoImpressaoAgenciaBanc = 0, ' AGENCIABANCARIA AG,', ''));

    Add('  CIDADES, ESTADO ES, GRINSTR GI, HORATRAB HT,');
    // -------------------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[1])+ ') AND');
    Add('         (DP.IDPESSOA    = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, ESTADO ES');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[2])+ ') AND');
    Add('         (DP.IDPESSOA    = F.IDPESSOA) AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------------------- //
    // CPF do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[3])+ ') AND');
    Add('         (DP.IDPESSOA    = F.IDPESSOA)) CPF,');
    // -------------------------------------------------------------------------------- //
    // CEI do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FILIALPESSOA FP');
    Add('   WHERE (DP.IDDOCUMENTO    = ' +IntToStr(DocID[4])+ ') AND');
    Add('         (FP.IDFILIALPESSOA = DP.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------------- //
    // CNPJ do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FILIALPESSOA FP');
    Add('   WHERE (DP.IDDOCUMENTO    = ' +IntToStr(DocID[5])+ ') AND');
    Add('         (FP.IDFILIALPESSOA = DP.IDPESSOA)) CNPJ,');
    // -------------------------------------------------------------------------------- //
    // Telefone a Empresa
    Add('  (SELECT TE.IDENDERECO, TE.NUMERO');
    Add('   FROM   TELENDPESS TE,');
    Add('     (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM   TELENDPESS');
    Add('      GROUP BY IDENDERECO) ENDER');
    Add('      WHERE (ENDER.IDTELEFONE = TE.IDTELEFONE)) TELEFONE,');
    // -------------------------------------------------------------------------------- //
    // Último salário
    Add('  (SELECT IDPESSOA, SUM(VALORPROVENTO) AS VALOR, SUBSTR(MES,6,2) AS MES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (ListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('          (IDPESSOA', ListaIdFunc, 4));

    if (ListaIdRubricaMesRescisao <> '') then
      Add(MontaLinhaSelSQL('          (CODPROVDESC', QuotedListaString(ListaIdRubricaMesRescisao, ','), 1));

    Add('          (MES          = '+QuotedStr(AnoMes)+')');
    Add('   GROUP BY IDPESSOA, MES) VAL_ULT_SAL,');
    // -------------------------------------------------------------------------------- //
    // Penúltimo salário
    Add('  (SELECT IDPESSOA, SUM(VALORPROVENTO) AS VALOR, SUBSTR(MES,6,2) AS MES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (ListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('          (IDPESSOA', ListaIdFunc, 4));

    if (ListaIdRubricaOutrosMeses <> '') then
      Add(MontaLinhaSelSQL('          (CODPROVDESC', QuotedListaString(ListaIdRubricaOutrosMeses, ','), 1));

    Add('          (MES          = '+QuotedStr(IncDataAM(AnoMes,-1))+')');
    Add('   GROUP BY IDPESSOA, MES) VAL_PENULT_SAL,');
    // -------------------------------------------------------------------------------- //
    // Antepenúltimo salário
    Add('  (SELECT IDPESSOA, SUM(VALORPROVENTO) AS VALOR, SUBSTR(MES,6,2) AS MES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (ListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('          (IDPESSOA', ListaIdFunc, 4));

    if (ListaIdRubricaOutrosMeses <> '') then
      Add(MontaLinhaSelSQL('          (CODPROVDESC', QuotedListaString(ListaIdRubricaOutrosMeses, ','), 1));

    Add('          (MES          = '+QuotedStr(IncDataAM(AnoMes,-2))+')');
    Add('   GROUP BY IDPESSOA, MES) VAL_ANTEPENULT_SAL,');
    // -------------------------------------------------------------------------------- //
    // Se recebeu salário nos últimos 6 meses
    Add('  (SELECT IDPESSOA, COUNT(MES) AS QTDEMES');
    Add('   FROM   HISTRUBSAL');
    Add('   WHERE');

    if (ListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('          (IDPESSOA', ListaIdFunc, 4));

    if (ListaIdRubricaOutrosMeses <> '') then
      Add(MontaLinhaSelSQL('          (CODPROVDESC', QuotedListaString(ListaIdRubricaOutrosMeses, ','), 1));

    Add('          ((MES        >= '+QuotedStr(IncDataAM(AnoMes,-7))+') OR');
    Add('           (MES        <= '+QuotedStr(IncDataAM(AnoMes,-1))+'))');
    Add('   GROUP BY IDPESSOA) RECEB_SAL_6');
    // -------------------------------------------------------------------------------- //
    Add('WHERE');
    Add(FU.MontaLinhaSelSQL('  (FP.IDFILIALPESSOA',ListaIdEstab,1));

    if (ListaIdFunc <> '') then
      Add(MontaLinhaSelSQL('  (F.IDPESSOA', ListaIdFunc, 8));

    Add('  (FP.IDFILIALPESSOA  = PJ.IDPESSOA) AND');
    Add('  (F.IDESTAB          = FP.IDFILIALPESSOA) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (F.IDCARGO          = C.IDCARGO) AND');
    Add('  (F.IDPESSOA         = CTPS.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = PIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = CPF.IDPESSOA) AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');

    // Se imprime Agência do FGTS do Funcionário
    if (TipoImpressaoAgenciaBanc = 0) then
      Add('  (F.IDAGENCIAFGTS    = AG.IDPESSOA) AND');

    Add('  (E.IDENDERECO       = PF.IDENDRESIDENCIAL) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  (PEFIS.IDGRINSTR    = GI.IDGRINSTR) AND');
    Add('  (F.IDPESSOA         = VAL_ULT_SAL.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = VAL_PENULT_SAL.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = VAL_ANTEPENULT_SAL.IDPESSOA) AND');
    Add('  (F.IDPESSOA         = RECEB_SAL_6.IDPESSOA) AND');
    Add('  (E.IDENDERECO       = TELEFONE.IDENDERECO(+)) AND');
    Add('  (FP.IDFILIALPESSOA  = CEI.IDFILIALPESSOA(+)) AND');
    Add('  (FP.IDFILIALPESSOA  = CNPJ.IDFILIALPESSOA(+))');
    Add('ORDER BY');
    Add('  EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  Result := GetDataPacket(FSQL.Text);
end;

function TCtrlParamSegDes.TrataDados(Dado:string; Tipo:char; Tamanho:word): string;
var
  c, wMax: word;
  sTempFinal, sTemp: string;
begin
  if (Trim(Dado) <> '') then
  begin
    // Inicializa Variáveis
    sTemp := '';
    Tipo := UpCase(Tipo);
    Dado := Trim(Dado);

    // Atribuo o maior tamanho verificável possível
    if (Tamanho > Length(Dado)) then
      wMax := Length(Dado)
    else
      wMax := Tamanho;

    // ******************************
    // Faz tratamento das informações
    // ******************************
    case (Tipo) of
      'A' : // Campos Alfanuméricos
      begin
        try
          Dado := UpperCase(NormalizaString(ConverteCar(Dado)));
          sTemp := Alinha(Copy(Dado,1,wMax), Tamanho, 'E', ' ');

          sTempFinal := '';
          for c:=1 to Length(sTemp) do
            sTempFinal := sTempFinal + sTemp[c] + ' ';
        except
          sTempFinal := Replicate(' ', Tamanho);
        end;
      end;
      'N' : // Campos Numéricos
      begin
        try
          for c:=1 to Length(Dado) do
            if (Dado[c] in ['0'..'9']) then
              sTemp := sTemp+Dado[c];

          sTemp := Alinha(Copy(sTemp,1,wMax), Tamanho, 'D', ' ');

          sTempFinal := '';
          for c:=1 to Length(sTemp) do
            sTempFinal := sTempFinal + sTemp[c] + ' ';
        except
          sTempFinal := Replicate(' ', Tamanho);
        end;
      end;
    end;
  end
  else // Se o Dado for em branco preenche com espaços
  begin
    sTempFinal := '';
    for c:=1 to Tamanho do
      sTempFinal := sTempFinal + '  ';
  end;
  Result := sTempFinal;
end;

function TCtrlParamSegDes.GerarDadosImpressao(Modelo: integer; DataRef: TDateTime;
  ListaIdEstab, ListaIdFunc, ListaIdRubricaMesRescisao, ListaIdRubricaOutrosMeses: string;
  TipoImpressaoAgenciaBanc: byte; NumAgenciaBanc, NomeAgenciaBanc: string): string;
var
  c: byte;
  Arquivo: TStringList;
  CdsSegDes: TCMClientDataSet;
begin
  Arquivo := TStringList.Create;

  CdsSegDes := TCMClientDataSet.Create(nil);

  CdsSegDes.Data := ListSegDes(ListaIdEstab, ListaIdFunc, RetornaAnoMes(DataRef),
    ListaIdRubricaMesRescisao, ListaIdRubricaOutrosMeses, TipoImpressaoAgenciaBanc,
    NumAgenciaBanc, NomeAgenciaBanc);
  DoProgresso([CdsSegDes.RecordCount]);

  // ------------------------------------------------------------------
  // Geração do Relatório para a Pessoa atualmente posicionada na Query
  // ------------------------------------------------------------------
  while not(CdsSegDes.EOF) do
  begin
    // Espaço do Cabeçalho
    for c:=1 to 4 do
      Arquivo.Add(' ');

    if (Modelo = MODELO_1960) then
      for c:=1 to 2 do
        Arquivo.Add(' ');

    if (Modelo = MODELO_1953) then
      for c:=1 to 5 do
        Arquivo.Add(' ');

    // (01) - Nome do Funcionário
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('EMPREGADO').asString,'A',40));

    // (02) - Nome da Mãe do Funcionário
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('MAE').asString,'A',40));

    // (03) - Endereço do Funcionário
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('ENDERECO').asString,'A',40));

    // (04) - Complemento, CEP, UF e Telefone do Funcionário
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('COMPLEMENTO').asString,'A', FU.IFF(Modelo = MODELO_1960, 14, 16))+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 2, FU.IFF(Modelo = MODELO_1960, 2, 1)))+
      TrataDados(CdsSegDes.FieldByName('CEP1').asString,'A',05)+
      Replicate(' ',2)+
      TrataDados(CdsSegDes.FieldByName('CEP2').asString,'A',03)+
      Replicate(' ',2)+
      TrataDados(CdsSegDes.FieldByName('UF').asString,'A',02)+
      Replicate(' ',2)+
      TrataDados(CdsSegDes.FieldByName('TELEFONE').asString,'A',10));

    // (05) - PIS/PASEP/NIT, CTPS e CPF
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('PIS').asString,'A',11)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 6, FU.IFF(Modelo = MODELO_1960, 4, 5)))+
      TrataDados(CdsSegDes.FieldByName('CTPS').asString,'N',07)+
      TrataDados(UltimosCaracteres(Trim(CdsSegDes.FieldByName('CTPS').asString),3),'N',03)+
      TrataDados(CdsSegDes.FieldByName('CTPS_UF').asString,'A',02)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 4, 6))+
      TrataDados(CdsSegDes.FieldByName('CPF').asString,'A',11));

    // (06) - Tipo da Inscrição, Nº do CNPJ ou CEI e Atividade Econômica
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    if (Modelo = MODELO_1951) then
      Arquivo.Add(' ');
      
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 19, FU.IFF(Modelo = MODELO_1960, 12, 14)))+
      TrataDados(CdsSegDes.FieldByName('TIPINSCEMP').asString,'A',01)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 3, 2))+
      TrataDados(CdsSegDes.FieldByName('INSCEMP').asString,'A',14)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 2, 3))+
      TrataDados(CdsSegDes.FieldByName('CNAE').asString,'A',5));

    // (07) - CBO e Ocupação
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    if (Modelo = MODELO_1951) then
      Arquivo.Add(' ');

    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('CBO').asString,'A',5)+
      Replicate(' ',2)+
      TrataDados(UltimosCaracteres(CdsSegDes.FieldByName('CBO').asString,1),'N',1)+
      Replicate(' ',2)+
      Alinha(Copy(CdsSegDes.FieldByName('OCUPACAO').asString,1,35),35,'E',' '));

    // (08) - Data de Admissão, Data de Demissão, Sexo, Grau de Instrução,
    //        Data de Nascimento e Horas Trabalhadas Semanais
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    if (Modelo = MODELO_1960) then
      Arquivo.Add(' ');

    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('ADMISSAO').asString,'A',6)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 3, 4))+
      TrataDados(CdsSegDes.FieldByName('DEMISSAO').asString,'A',6)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 13, FU.IFF(Modelo = MODELO_1960, 11, 12)))+
      TrataDados(CdsSegDes.FieldByName('SEXO').asString,'A',1)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 10, 8))+
      TrataDados(CdsSegDes.FieldByName('GRAUINSTRU').asString,'A',1)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 4, 3))+
      TrataDados(CdsSegDes.FieldByName('NASCIMENTO').asString,'A',6)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 3, 4))+
      TrataDados(CdsSegDes.FieldByName('HORASEMANA').asString,'A',2));

    // (09) - (Mês + Antepenúltimo Sal.), (Mês + Penúltimo Sal.) e (Mês + Último Sal.)
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('MES_ANTEPENULT_SALARIO').asString,'A',02)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 1, 2))+
      TrataDados(FormatFloat('#########0.00',
                 CdsSegDes.FieldByName('ANTEPENULT_SALARIO').asFloat),'N',10)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 0, 2))+
      TrataDados(CdsSegDes.FieldByName('MES_PENULT_SALARIO').asString,'A',02)+
      Replicate(' ',1)+
      TrataDados(FormatFloat('#########0.00',
                 CdsSegDes.FieldByName('PENULT_SALARIO').asFloat),'N',10)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 3, FU.IFF(Modelo = MODELO_1960, 1, 2)))+
      TrataDados(CdsSegDes.FieldByName('MES_ULT_SALARIO').asString,'A',02)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 3, FU.IFF(Modelo = MODELO_1960, 3, 2)))+
      TrataDados(FormatFloat('#########0.00',
                 CdsSegDes.FieldByName('ULT_SALARIO').asFloat),'N',9));

    // (10) - Soma dos 3 Últimos Salários, Nº Banco, Nº Agência e
    //        Qtd Meses trabalhados nos Últimos 36 meses
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(FormatFloat('#########0.00',
        CdsSegDes.FieldByName('ULT_SALARIO').asFloat+
        CdsSegDes.FieldByName('PENULT_SALARIO').asFloat+
        CdsSegDes.FieldByName('ANTEPENULT_SALARIO').asFloat),'N',10)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 7, FU.IFF(Modelo = MODELO_1960, 5, 6)))+
      TrataDados(CdsSegDes.FieldByName('N_BANCO').asString,'A',03)+
      TrataDados(CdsSegDes.FieldByName('N_AGENCIA').asString,'A',06)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1960, 29, 31))+
      TrataDados(
        IFF((CdsSegDes.FieldByName('AVISOPREVIO').asString='1') and
            (CdsSegDes.FieldByName('QUANT_TRAB_36MESES').asInteger < 36),
            IntToStr(CdsSegDes.FieldByName('QUANT_TRAB_36MESES').asInteger+1),
            PoeZero(CdsSegDes.FieldByName('QUANT_TRAB_36MESES').asInteger)),'A',2));

    // (11) - Recebeu Salário nos Últimos 6 meses?, Aviso Prévio Indenizado?
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 26, FU.IFF(Modelo = MODELO_1960, 24, 22)))+
      '1'+ //TrataDados(CdsSegDes.FieldByName('RECEB_SAL_6_MESES').asString ,'A',1)+
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 25, FU.IFF(Modelo = MODELO_1960, 18, 22)))+
      TrataDados(CdsSegDes.FieldByName('AVISOPREVIO').asString,'A',1));

    // Imprimir o final da página
    for c:=1 to 14 do
      Arquivo.Add(' ');

    if (Modelo = MODELO_1953) then
      for c:=1 to 6 do
        Arquivo.Add(' ');

    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('PIS').asString,'A',11));

    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 9, 4))+
      TrataDados(CdsSegDes.FieldByName('EMPREGADO').asString,'A',40));

    if (Modelo in [MODELO_1953, MODELO_1960]) then
      Arquivo.Add(' ');

    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 27, 22))+
      CdsSegDes.FieldByName('ESTAB').asString);

    //if (Modelo = MODELO_1960) then
    //  Arquivo.Add(' ');

    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(' ');
    Arquivo.Add(
      Replicate(' ', FU.IFF(Modelo = MODELO_1953, 12, 7))+
      Alinha(CdsSegDes.FieldByName('CIDADE').asString,14,'E',' ')+
      Replicate(' ',2)+
      PoeZero(ExtraiDia(DataRef))+
      FU.Replicate(' ',3)+
      PoeZero(ExtraiMes(DataRef))+
      FU.Replicate(' ',3)+
      IntToStr(ExtraiAno(DataRef)));

    for c:=1 to 4 do
      Arquivo.Add(' ');

    CdsSegDes.Next;
    DoProgresso([0]);
  end;

  Result := Arquivo.Text;

  CdsSegDes.Free;
  Arquivo.Free;
end;

end.
