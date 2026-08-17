unit uCtrlGiam;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCtrlConvICMS5795;

Type
    TCtrlGiam = Class(TCmControlObject)

    private
      ConvICMS5795 : TCtrlConvICMS5795;
    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {monta o OleVariant com os dados para o Registro corrente}
      function MontaSelect(Numero, IdPessoa : LongInt; sMes, sAno : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlGiam }
Const sSulSudeste : string = '''SP'', ''MG'', ''RJ'', ''RS'', ''PR'', ''SC''';


procedure TCtrlGiam.AfterInitialize;
begin
  inherited;
  ConvICMS5795.InitializeAs(Self);
end;

constructor TCtrlGiam.Create;
begin
  inherited;
  ConvICMS5795 := TCtrlConvICMS5795.create;
end;

destructor TCtrlGiam.Destroy;
begin
  inherited;
  ConvICMS5795.free;
end;

procedure TCtrlGiam.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlGiam.MontaSelect(Numero, IdPessoa: Integer; sMes,
                               sAno: string): OleVariant;
Var
  Ssql : string;
begin
  case Numero of
    1: //Informações gerais da GIAM - Header
      Begin
        Ssql := 'SELECT RAZAOSOCIAL FROM PESSOA '+
                ' WHERE IDPESSOA = '+intTostr(IdPessoa);
      end;
    2: //Totais de valores do quadro A
      Begin
        Ssql := 'SELECT (SUM(EI.VALORCONTABIL) * 100) AS QAB001, '+
                '       (SUM(EI.BASECALCULO) * 100)   AS QAB002, '+
                '       (SUM(EI.VALORIMPOSTO) * 100) AS QAB003, '+
                '       (SUM(EI.VALORISENTO) * 100) AS QAB004, '+
                '       (SUM(EI.VALOROUTROS) * 100) AS QAB005, '+
                '       (SUM(EE.VALORCONTABIL) * 100) AS QAB006, '+
                '       (SUM(EE.BASECALCULO) * 100) AS QAB007, '+
                '       (SUM(EE.VALORIMPOSTO) * 100) AS QAB008, '+
                '       (SUM(EE.VALORISENTO) * 100) AS QAB009, '+
                '       (SUM(EE.VALOROUTROS) * 100) AS QAB010 '+
                '  FROM (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''E'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''1'') EI, '+
                '       (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''E'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''2'') EE ';
      end;
    3: //Totais de valores do quadro A - Continuação
      Begin
        Ssql := 'SELECT (SUM(EI.VALORCONTABIL) * 100) AS QAB011, '+
                '       (SUM(EI.BASECALCULO) * 100)   AS QAB012, '+
                '       (SUM(EI.VALORIMPOSTO) * 100) AS QAB013, '+
                '       (SUM(EI.VALORISENTO) * 100) AS QAB014, '+
                '       (SUM(EI.VALOROUTROS) * 100) AS QAB015, '+
                '       (SUM(EE.VALORCONTABIL) * 100) AS QAB016, '+
                '       (SUM(EE.BASECALCULO) * 100) AS QAB017, '+
                '       (SUM(EE.VALORIMPOSTO) * 100) AS QAB018, '+
                '       (SUM(EE.VALORISENTO) * 100) AS QAB019, '+
                '       (SUM(EE.VALOROUTROS) * 100) AS QAB020 '+
                '  FROM (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD, PESSOA P, ESTADO ES, CIDADES C, ENDPESS E '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''E'' '+
                '           AND L.IDFORCLI = P.IDPESSOA '+
                '           AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                '           AND E.IDCIDADES = C.IDCIDADES(+) '+
                '           AND C.IDESTADO = ES.IDESTADO(+) '+
                '           AND ES.CODESTADO IN ('+ sSulSudeste +') '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''2'') EI, '+
                '       (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''E'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''3'') EE ';
      end;
    4: //Totais de valores do quadro B
      Begin
        Ssql := 'SELECT (SUM(EI.VALORCONTABIL) * 100) AS QAB021, '+
                '       (SUM(EI.BASECALCULO) * 100)   AS QAB022, '+
                '       (SUM(EI.VALORIMPOSTO) * 100) AS QAB023, '+
                '       (SUM(EI.VALORISENTO) * 100) AS QAB024, '+
                '       (SUM(EI.VALOROUTROS) * 100) AS QAB025, '+
                '       (SUM(EE.VALORCONTABIL) * 100) AS QAB026, '+
                '       (SUM(EE.BASECALCULO) * 100) AS QAB027, '+
                '       (SUM(EE.VALORIMPOSTO) * 100) AS QAB028, '+
                '       (SUM(EE.VALORISENTO) * 100) AS QAB029, '+
                '       (SUM(EE.VALOROUTROS) * 100) AS QAB030, '+
                '       (SUM(EX.VALORCONTABIL) * 100) AS QAB031, '+
                '       (SUM(EX.BASECALCULO) * 100) AS QAB032, '+
                '       (SUM(EX.VALORIMPOSTO) * 100) AS QAB033, '+
                '       (SUM(EX.VALORISENTO) * 100) AS QAB034, '+
                '       (SUM(EX.VALOROUTROS) * 100) AS QAB035 '+
                '  FROM (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''S'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''5'') EI, '+ 
                '       (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''S'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''6'') EE, '+
                '       (SELECT LD.VALORCONTABIL, LD.BASECALCULO, LD.VALORIMPOSTO, LD.VALORISENTO, LD.VALOROUTROS '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''S'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '           AND SUBSTR(LD.CODFISCAL, 1, 1) = ''7'') EX ';
      end;
    5: //Totais de valores do quadro C e D
      Begin
        Ssql := 'SELECT  A.VALORENTRADAS, B.VALORSAIDAS '+
                '  FROM (SELECT (SUM(LD.VALORCONTABIL) * 100) AS VALORENTRADAS'+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''E'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO) A, '+
                '       (SELECT (SUM(LD.VALORCONTABIL) * 100) AS VALORSAIDAS'+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''S'' '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO) B ';
      end;
    6: //Totais de valores do quadro E
      Begin
      end;
    7: //Totais de valores do quadro E - Continuação
      Begin
      end;
    8: //Totais de valores do quadro F
      Begin
      end;
    9: //Totais de valores do quadro G
      Begin
      end;
    10: //Totais de valores do quadro H
      Begin
      end;
    11: //Totais de valores do quadro I
      Begin
      end;
    12: //Totais de valores do quadro I - Continuação
      Begin
      end;
    13: //Detalhamentosde CFOP
      Begin
        Ssql := 'SELECT LD.ALIQUOTA, LD.BASECALCULO, LD.VALORISENTO, LD.VALOROUTROS, LD.VALORIMPOSTO,'+
                '       LD.VALORCONTABIL, LD.CODFISCAL, LD.CODFISCAL '+
                '  FROM NFLIVRODETALHE LD, NFLIVRO L '+
                ' WHERE (L.FLGENTRADASAIDA in (''E'', ''S'')) '+
                '   AND (L.IDPESSOA = '+intTostr(IdPessoa)+') '+
                '   AND (L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'')) '+
                '   AND (L.IDNFLIVRO = LD.IDNFLIVRO) '+
                '   AND (LD.CODFISCAL IS NULL) '+
                ' GROUP BY LD.CODFISCAL, LD.ALIQUOTA, LD.BASECALCULO, LD.VALORISENTO, LD.VALOROUTROS, '+
                '       LD.VALORIMPOSTO, LD.VALORCONTABIL'+
                ' ORDER BY LD.CODFISCAL';
      end;
    14: //Detalhamentos de Municípios
      Begin
        Ssql := 'SELECT  SUM(E.VALORENTRADAS) AS VALORENTRADAS,  SUM(S.VALORSAIDAS) AS VALORSAIDAS, E.CODESTADO, E.NOME'+
                '  FROM (SELECT (SUM(LD.VALORCONTABIL) * 100) AS VALORENTRADAS,  ES.CODESTADO, C.NOME '+
                '          FROM NFLIVRO L, NFLIVRODETALHE LD, PESSOA P, ESTADO ES, CIDADES C, ENDPESS E '+
                '         WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '           AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '           AND L.FLGENTRADASAIDA = ''E'' '+
                '           AND L.IDFORCLI = P.IDPESSOA '+
                '           AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                '           AND E.IDCIDADES = C.IDCIDADES(+) '+
                '           AND C.IDESTADO = ES.IDESTADO(+) '+
                '           AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '          GROUP BY ES.CODESTADO, C.NOME) E, '+
                '        (SELECT (SUM(LD.VALORCONTABIL) * 100) AS VALORSAIDAS,  ES.CODESTADO, C.NOME '+
                '           FROM NFLIVRO L, NFLIVRODETALHE LD, PESSOA P, ESTADO ES, CIDADES C, ENDPESS E '+
                '          WHERE L.IDPESSOA = '+intTostr(IdPessoa) +
                '            AND L.DATAENTRADANF BETWEEN  TO_DATE('+quotedStr('01/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) +', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(IntTostr(ConvICMS5795.DiasNoMes(strToint(sAno), strToint(sMes))) + '/'+ConvICMS5795.strzero(2, sMes) + '/'+ sAno) + ', ''DD/MM/YYYY'') '+
                '            AND L.FLGENTRADASAIDA = ''S'' '+
                '            AND L.IDFORCLI = P.IDPESSOA '+
                '            AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                '            AND E.IDCIDADES = C.IDCIDADES(+) '+
                '            AND C.IDESTADO = ES.IDESTADO(+) '+
                '            AND L.IDNFLIVRO = LD.IDNFLIVRO '+
                '          GROUP BY ES.CODESTADO, C.NOME) S '+
                ' WHERE E.CODESTADO = S.CODESTADO '+
                '   AND E.NOME = S.NOME '+
                ' GROUP BY E.CODESTADO, E.NOME  '+
                ' ORDER BY E.NOME';
      end;
    15: //Detalhamentos de Equipamentos
      Begin
      end;
    16: //Detalhamentos de Recolhimentos
      Begin
      end;
    17: //Detalhamentos de Manutenção
      Begin
      end;
  end;
  Result := getDataPacket(Ssql);

end;

procedure TCtrlGiam.OnCreateAppServer;
begin
  inherited;

end;

end.
