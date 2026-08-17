unit uCtrlGfip;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uFuncoesUteisIR;
  Type
    TCtrlGfip = Class(TCmControlObject)

    private
      cdsProcura : TclientDataSet;
    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Lista os documentos disponíveis}
      function ListDoc : OleVariant;
      {Lista as GPS}
      function ListGPS(Data : string) : OleVariant;
      {Listar os estabelecimentos}
      function ListEstabelecimento(IdPessoa : LongInt) : OleVariant;
      {Lista os trabalhadores}
      function ListTrabalhador(IdPessoa : LongInt; Data : string) : OleVariant;

      function Val_DtComp (Campo: string;  Var wMesComp, wAnoComp, iCodRec : word): string;
      function Val_IndiRecFGTS(DtPag,DtComp: TDateTime; Var wMesComp, iCodRec : Word): string;
      function Val_IndiRecPrevSoc (DtPag,Campo: TDateTime;Var wMesComp, wAnoComp, iCodRec : word): char;
      function Val_DtRecPrevSoc (Campo: string; Var cIndRecPrev : string): string;

      function fValidaDadosGFIPMag(cTipo:char; sDado:string; wTamanho:word; Ch:char): string;
      function Val_CEP (CEP: string): string;
      function Val_DtRecFGTS(DtVenc,DtPag: TDateTime; sIndRecFGTS : string): string;
      function Val_IndiAlteracao (Altera: char; wMesComp : word): char;
      function Val_AliqSAT (Campo : real; sFPAS : string; wMesComp, wAnoComp, iCodRec : word; rgSimples : integer): string;
      function Val_CodTerceiros (Campo: string; rgSimples : Integer; iCodRec, wMesComp, wAnoComp : word): string;
      function Val_RemSem13 (Campo: string; wMesComp : word): string;
      function PegaNumeroDocumento(Documento, IdForCli : longInt) : string;


    protected

    End;

implementation

{ TCtrlGfip }

constructor TCtrlGfip.Create;
begin
  inherited;
  cdsProcura := TclientDataSet.create(nil);
end;

destructor TCtrlGfip.Destroy;
begin
  inherited;
  cdsProcura.free;
end;

procedure TCtrlGfip.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGfip.fValidaDadosGFIPMag(cTipo: char; sDado: string;
                                       wTamanho: word; Ch: char): string;
var
  sTemp  : string;
  c, wMax: word;
begin
  Result := 'ERRO VALIDA GFIP';
  // Faz Validação básica para a utilização da Função
  // Verifica se o tamanho é válido
  if not(cTipo in ['*', 'A', 'N', 'V', 'D']) or (wTamanho <= 0) then
    exit;

  // Inicializa Variáveis
  sTemp := '';
  cTipo := UpCase(cTipo);
  sDado := Trim(sDado);

  // Atribuo o maior tamanho verificável possível
  if (wTamanho > Length(sDado)) then
    wMax := Length(sDado)
  else
    wMax := wTamanho;

  // ******************************
  // Faz tratamento das informações
  // ******************************
  case (cTipo) of
    '*','A' : // Campos Alfanuméricos e Alfabéticos
    begin
      try
        sDado := UpperCase(NormalizaString(ConverteCar(TiraCarRepetidos(sDado,2))));

        for c:=1 to length(sDado) do
          if ((cTipo = 'A') and (sDado[c] in [' ','A'..'Z'])) or
             ((cTipo = '*') and (sDado[c] in [' ','A'..'Z','0'..'9'])) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(TiraCarRepetidos(Copy(sTemp,1,wMax),1), wTamanho, 'E', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
    'N' : // Campos Numéricos
    begin
      try
        for c:=1 to length(sDado) do
          if (sDado[c] in ['0'..'9']) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), wTamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
    'V' : // Campos de Valor
    begin
      try
        for c:=1 to length(sDado) do
          if (sDado[c] in ['0'..'9']) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), wTamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
    'D' : // Campos Data
    begin
      try
        StrToDate (sTemp);
        sTemp := Alinha(TiraBarra(sTemp), wTamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, wTamanho);
      end;
    end;
  end;
  Result := sTemp;
end;

function TCtrlGfip.ListDoc: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDDOCUMENTO, NOMEDOCUMENTO '+
          '  FROM TIPODOCPESSOA '+
          ' ORDER BY IDDOCUMENTO ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGfip.ListEstabelecimento(IdPessoa: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DISTINCT PJ.IDPESSOA, RTRIM(PJ.NOME) AS NOME, RTRIM(PJ.RAZAOSOCIAL) AS RAZAO, '+
          '       ''1'' AS TIPO_INSCRICAO, PJ.NUMDOCUMENTO AS INSCRICAO, DECODE(E.LOGRADOURO,NULL,NULL,RTRIM(E.LOGRADOURO) '+
          '       ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS ENDERECO, '+
          '       RTRIM(E.BAIRRO)  AS BAIRRO, RTRIM(E.CEP)     AS CEP, RTRIM(CI.NOME)   AS CIDADE, '+
          '       (ES.CODESTADO)   AS UF, RTRIM(TELEFONE.DDD)    AS DDD, RTRIM(TELEFONE.NUMERO) AS TELEFONE, '+
          '       RTRIM(PJ.EMAIL) AS EMAIL '+
          '  FROM PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES, (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO '+
          '                                                                      FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO '+
          '                                                                                             FROM TELENDPESS '+
          '                                                                                            GROUP BY IDENDERECO) END '+
          '                                                                     WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE '+
          ' WHERE (PJ.IDPESSOA = '+intTostr(IdPessoa)+') '+
          '   AND (PJ.NUMDOCUMENTO IS NOT NULL) '+
          '   AND (PJ.IDENDCOMERCIAL = E.IDENDERECO) '+
          '   AND (PJ.IDPESSOA = E.IDPESSOA) '+
          '   AND (E.IDCIDADES = CI.IDCIDADES) '+
          '   AND (CI.IDESTADO = ES.IDESTADO) '+
          '   AND (PJ.IDENDCOMERCIAL = TELEFONE.IDENDERECO(+)) '+
          '   AND (PJ.IDENDCOMERCIAL  = TE.IDENDERECO(+)) ';
  Result := GetDataPacket(SSql);
end;

function TCtrlGfip.ListGPS(Data: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DATAFIMGRPS, DATAVENCGRPS, IDFILIALPESSOA, MOECODIGO, '+
          '       SEGACIDTRABALHO, CODIGOPAG, TOTAL '+
          '  FROM GUIAGRPS '+
          ' WHERE (TO_CHAR(DATAVENCGRPS, ''MM/YYYY'') = '+quotedStr(Data)+') '+
          ' ORDER BY DATAFIMGRPS DESC ';
  Result := GetDataPacket(SSql);
end;

function TCtrlGfip.ListTrabalhador(IdPessoa: Integer;
                                   Data: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DISTINCT L.DATALANCTO, D.IDFORCLI, '+
          '       P.RAZAOSOCIAL, D.CODDOCUMENTO, L.NUMLANCTO, '+
          '       DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1) AS VALOR, '+
          '       D.OPERACAO, D.NUMFATURA, DECODE(E.LOGRADOURO,NULL,NULL,RTRIM(E.LOGRADOURO) || '', ''|| E.NUMERO || '+
          '       DECODE(E.COMPLEMENTO,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS ENDERECO, '+
          '       RTRIM(E.BAIRRO)  AS BAIRRO, RTRIM(E.CEP) AS CEP, RTRIM(CI.NOME) AS CIDADE, '+
          '       (ES.CODESTADO) AS UF, RTRIM(TELEFONE.DDD) AS DDD, RTRIM(TELEFONE.NUMERO) AS TELEFONE, '+
          '       RTRIM(P.EMAIL) AS EMAIL, P.NUMDOCUMENTO AS INSCRICAO_TOMADOR, L.VALOR '+
          '  FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, ENDPESS E, CIDADES CI, ESTADO ES, '+
          '       (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO '+
          '          FROM TELENDPESS TE, (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO '+
          '                                 FROM TELENDPESS '+
          '                                GROUP BY IDENDERECO) END '+
          '         WHERE (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE '+
          ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '   AND (TO_CHAR(D.DATAVENCTO,''MM/YYYY'') = '+quotedStr(Data)+') '+
          '   AND (P.IDPESSOA = D.IDFORCLI(+)) '+
          '   AND (D.IDPESSOA = '+intTostr(IdPessoa)+') '+
          '   AND (L.HISTORICOCOMPL = ''INSS'') '+
          '   AND (L.ESTORNO IS NULL) '+
          '   AND (P.IDENDCOMERCIAL  = E.IDENDERECO(+)) '+
          '   AND (P.IDPESSOA        = E.IDPESSOA(+)) '+
          '   AND (E.IDCIDADES       = CI.IDCIDADES(+)) '+
          '   AND (CI.IDESTADO       = ES.IDESTADO(+)) '+
          '   AND (P.IDENDCOMERCIAL  = TELEFONE.IDENDERECO(+)) '+
          ' ORDER BY L.DATALANCTO, P.RAZAOSOCIAL, D.IDFORCLI ';
  Result := getdataPacket(SSql);
end;

function TCtrlGfip.PegaNumeroDocumento(Documento,
                                       IdForCli: Integer): string;
Var
  Ssql : string;
begin
  Ssql := 'SELECT NUMDOCUMENTO '+
          '  FROM DOCPESSOA '+
          ' WHERE IDPESSOA = '+quotedStr(intTostr(IdForCli)) + ' '+
          '   AND IDDOCUMENTO = '+quotedStr(intTostr(Documento));
  cdsProcura.data := GetDataPacket(Ssql);
  result := cdsProcura.fieldByname('NUMDOCUMENTO').Asstring;
end;

function TCtrlGfip.Val_AliqSAT(Campo : real; sFPAS : string; wMesComp, wAnoComp, iCodRec : word; rgSimples : integer): string;
{-->}function ConverteSAT (Aliq: real): string;
     var
       sAux : string;
       byPos: byte;
     begin
       sAux   := Float2String(Aliq);
       byPos  := Pos ('.', sAux);
       Result := sAux[1]+Copy(sAux,byPos+1,1);
{-->}end;
begin
  if (sFPAS = '604') or (sFPAS = '647') or ((rgSimples + 1) in [2,3]) or
     (Campo = 0) or ((wMesComp < 10) and (wAnoComp <= 1998)) or
     (Comparar(iCodRec,[145,345,640,660]).Achou) then
    Result := '  '
  else  // Se não, formata a alíquota
    Result := ConverteSAT(Campo);
end;

function TCtrlGfip.Val_CEP(CEP: string): string;
begin
  if (CEP <> '20000000') and (CEP <> '30000000') and (CEP <> '70000000') and (CEP <> '80000000') then
    Result := fValidaDadosGFIPMag('N', CEP, 8,' ')
  else
    Result := '        ';
end;

function TCtrlGfip.Val_CodTerceiros(Campo: string; rgSimples : Integer; iCodRec, wMesComp, wAnoComp : word): string;
begin
  if not(Comparar(iCodRec,[145,345,640,660]).Achou) and
     ((rgSimples + 1) in [2,3]) and (wMesComp >= 10) and (wAnoComp >= 1998) then
    Result := fValidaDadosGFIPMag('N', Campo, 4, '0')
  else
    Result := '0000';
end;

function TCtrlGfip.Val_DtComp(Campo: string; Var wMesComp, wAnoComp, iCodRec : word): string;
begin
  if ((wMesComp = 13) and (wAnoComp < 1998)) or
     ((Comparar(iCodRec,[130,145,244,122,327,337,345,640,650,660,904,909,911]).Achou) and
      (wMesComp = 13)) or
     ((iCodRec = 904) and (wMesComp <= 10) and (wAnoComp <= 1998)) or
     ((iCodRec = 911) and (wMesComp <= 03) and (wAnoComp <= 2000)) or
     ((iCodRec = 640) and (wMesComp >= 10) and (wAnoComp >= 1988)) then
    Result := '      '
  else
    Result := Campo;
end;

function TCtrlGfip.Val_DtRecFGTS(DtVenc, DtPag: TDateTime; sIndRecFGTS : string): string;
begin
  if (sIndRecFGTS = '2') and (DtVenc < DtPag) then
    Result := TiraBarra(DateToStr(DtPag))
  else
    Result := '        ';
end;

function TCtrlGfip.Val_DtRecPrevSoc(Campo: string; Var cIndRecPrev : string): string;
begin
  if (cIndRecPrev <> '2') then
    Result := '        '
  else
    Result := TiraBarra(Campo);
end;

function TCtrlGfip.Val_IndiAlteracao(Altera: char; wMesComp : word): char;
begin
  if (wMesComp = 13) or (Altera = 'N') then
    Result := 'N'
  else
    Result := 'S';
end;

function TCtrlGfip.Val_IndiRecFGTS(DtPag, DtComp: TDateTime; Var wMesComp, iCodRec : Word): string;
begin
  if (wMesComp = 13) or (Comparar(iCodRec,[903,904,905,907,908,909,910,911]).Achou) then
    Result := ' '     // BRANCO
  else
  if (Comparar(iCodRec,[145,345,640]).Achou) or (DtPag > DtComp) then
    Result := '2'    // GFIP em atraso
  else
    Result := '1';   // GFIP no prazo
end;

function TCtrlGfip.Val_IndiRecPrevSoc(DtPag, Campo: TDateTime;Var wMesComp, wAnoComp, iCodRec : word): char;
begin
  if ((wMesComp < 10) and (wAnoComp <= 1998)) or
     (Comparar(iCodRec,[145,317,337,345,640,660,911]).Achou) or (Campo = 0) then
    Result := '3'    // Não gerou GPS
  else
  begin
    if (DtPag <= Campo) then
      Result := '1'  // no prazo
    else
      Result := '2'; // em atraso
  end;

end;

function TCtrlGfip.Val_RemSem13(Campo: string; wMesComp : word): string;
begin
  if (wMesComp <> 13) then
    Result := fValidaDadosGFIPMag ('V', Campo, 15, '0')
  else
    Result := '000000000000000';
end;

end.
