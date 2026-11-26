{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Função de conversão de query para o DB2             }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 18/06/2001                             }
{                                                       }
{*******************************************************}

{
** Dicas de Criação de SQL
   1) Os 'alter joins' devem vir agrupados por tabelas, sempre do mesmo lado
     do join alterando o lado somente qdo a tabela for alterada.
     Ex.:
       >> Errado
          (...)
       WHERE
          A.C1 = B.C1(+) AND
          A.C2 = B.C2(+) AND
          C.C1(+) = A.C3 AND
          C.C2(+) = A.C4 AND
          C.C3 = D.C1(+) AND
          (...)

       >> Correto
          (...)
       WHERE
          A.C1 = B.C1(+) AND
          A.C2 = B.C2(+) AND
          A.C3 = C.C1(+) AND
          A.C4 = C.C2(+) AND
          C.C3 = D.C1(+) AND
          (...)
   2) Para alter joins com valores no lugar de colunas, deve se substituir a
      condicional simples com o alter join por uma dupla utilizando a comparação com nulo
      Ex.:
       >> Errado
          (...)
       WHERE
          A.C1 = B.C1(+) AND
          A.C2 = B.C2(+) AND
          B.C3(+) = 1 AND
          (...)

       >> Correto
          (...)
       WHERE
          A.C1 = B.C1(+) AND
          A.C2 = B.C2(+) AND
          ((B.C3 = 1) OR (B.C3 IS NULL)) AND
          (...)

   3) Nas versões da Bde inferiores a 5.10 a connecção com o DB2 não suporta
      prepare;
      Nas versões superiores a 5.10 o prepare e suportado mas é nescessário
      executar um Unprepare após a execução de cada sql e um prepare antes
      da execução da mesma.
      Extraído do artigo:
      community.borland.com
      Article #19490: ODBC and DB2 don't do Prepare's

   If qryAutoriza.Prepared Then qryAutoriza.Unprepare;
   qryAutoriza.Prepare;

   4) Verificar separações entre nomes de colunas e\ou expressões com espaços
   EX:
   >> Errado
     ... FROM TABELA 1 T1,TABELA2 T2
   >> CORRETO
     ... FROM TABELA 1 T1, TABELA2 T2

   >> Errado
     SELECT CAMPO1 AS C1,CAMPO2 AS C2...
   >> CORRETO
     SELECT CAMPO1 AS C1, CAMPO2 AS C2...

   5) Corrigir as construções dos deletes - Incluir a palavra chave from na consulta
   EX:
   >> Errado
      DELETE TABELA WHERE ....
   >> Correto
      DELETE FROM TABELA WHERE ....

   6) Verificar as comparações com tipos difetentes
   EX:
   >> Errado
      WHERE NOME = 1
   >> Correto
      WHERE NOME = '1'

   7) Implementação da conversão das funções MONTHS_BETWEEN e NVL

   8) Inclusão de espaços antes e depois da vírgula

   9) Correção da tradução para várias ocorrências da mesma tabela no FROM

   10) Verificar indicação de aliases para SQL´S comvárias ocorrências da mesma tabela no FROM
   >> Errado
      FROM PESSOA, PESSOA P1, PESSOA P2
   >> Correto
      FROM PESSOA P0, PESSOA P1, PESSOA P2

   11) Correção na tradução de SUBQUERYES em comparadores do tipo IN e NOT IN

** Bug's Fixed
   18/06/2001
   Correção na tradução do decode qdo a coluna é comparada com null
}

unit SQLDB2;

interface

uses classes, sysutils, dialogs, Forms, JclStrings, SQLTypes;

procedure ConverteDb2(SQL:TStrings);

implementation

procedure ConverteDb2(SQL:TStrings);
var
    sAuxParam: String;
    iPoshh24: Integer;
    iOldPosSearchSubStr: Integer;
    iPosSelect: Integer;
    X, iLinhaFimComent, iPosSearchSubStr, iNumParentesis,
    iCountSubQueries: Integer;
    strSubQuery: Array of TStrings;
    lFim: boolean;
    i, PosMais, PosIgual, iFrom, PosEspaco, PosVirgula : integer;
    sComando, sPalavra, sPosJoin, sCampoL, sCampoR, sTabelaL, sTabelaR,
    sAliasL, sAliasR, sJoin: string;
    Status : TStatus;
    UltLinha : TTipoWhere;
    strSelect,
    strFrom,
    strWhere,
    strOrderBy,
    strJoin,
    strAtuJoin,
    strTabela,
    strAlias : TStringList;
    sAuxTabelaL, sAuxAliasL, sAuxAliasR, sAuxTabelaR: String;
    PosParIni, PosParFin :Integer;

    { function PegaParametros }
    function PegaParametros(sTexto : string; var iTam: integer) : string;
    var
        lstParam : TStringList;
        TempPos, iParent : integer;
        Param, c : string;
    begin
        lFim := false;
        TempPos := 1;
        iParent := -1;
        Param := '';
        lstParam := TStringList.Create;
        iTam := 0;

        while iParent <> 0 do
        begin
             c := Copy(sTexto, TempPos,1);
             if c = '(' then
             begin
                  if iParent<0 then
                     iParent := 1
                  else
                  begin
                       Inc(iParent);
                       Param := Param+c;
                  end;
             end

             else if c = ')' then
             begin
                  Dec(iParent);
                  if (iParent = 0) then
                  begin
                       lstParam.Add(trim(Param));
                       Param := '';
                  end
                  else
                      Param := Param+c;
             end

             else if c = ',' then
             begin
                  if iParent = 1 then
                  begin
                       lstParam.Add(trim(Param));
                       Param := '';
                  end
                  else
                      Param := Param+c;
             end
             else
                 Param := Param+c;
             Inc(TempPos);
             Inc(iTam)
        end;
        Result := lstParam.Text;
        lstParam.free;
    end;

    { function Acerta }
    function Acerta( sString, sTira, sPoe : string; SoUmaVez : boolean): string;
    var
        Posicao : integer;
        sTemp : string;
    begin
        sTemp := '';
        Posicao := Pos(UpperCase(sTira), UpperCase(sString));
        while Posicao > 0 do
        begin
             delete(sString, Posicao, Length(sTira));
             insert(sPoe, sString, Posicao);
             if SoUmaVez then
             begin
                  sTemp := sTemp + Copy(sString, 1, Posicao+Length(sPoe)-1);
                  sString := Copy(sString, Posicao+Length(sPoe), Length(sString));
             end;
             Posicao := Pos(UpperCase(sTira), UpperCase(sString));
        end;
        Result := sTemp+sString;
    end;

    { function Acerta }
    function AcertaVirgulas( sString: String): string;
    var
        Posicao : integer;
        sTemp : string;
    begin
        sTemp := sString;
        Posicao := 1;
        repeat
           Posicao := StrSearch(',',sTemp,Posicao);

           If Posicao > 0 Then
           Begin
              Insert(' ',sTemp,Posicao);

              Insert(' ',sTemp,Posicao + 2);

              Posicao := Posicao + 4
           End;


        until (Posicao = 0);

        Result := sTemp;
    end;


    { function Tabela }
    { Retorna o Nome da tabela dado um Alias ou Nome de Tabela }
    function Tabela( sAlias : string): string;
    var
        iIndexTab, iIndexAlias : integer;
    begin
        iIndexTab := strTabela.IndexOf(sAlias);
        if iIndexTab >= 0 then
           Result := strTabela[iIndexTab]
        else
        begin
             iIndexAlias := strAlias.IndexOf(sAlias);
             if iIndexAlias >= 0 then
                Result := strTabela[iIndexAlias]
             else
                 Result := '';
        end;
        Result := trim(Result);
    end;

    { function Alias }
    { Retorna o Alias um Alias ou Nome de Tabela }
    function Alias( sAlias : string): string;
    var
        iIndexTab, iIndexAlias : integer;
    begin
        iIndexTab := strTabela.IndexOf(sAlias);
        if iIndexTab >= 0 then
           Result := strAlias[iIndexTab]
        else
        begin
             iIndexAlias := strAlias.IndexOf(sAlias);
             if iIndexAlias >= 0 then
                Result := strAlias[iIndexAlias]
             else
                 Result := '';
        end;
        Result := trim(Result);
    end;


    { function tabL }
    function tabL(s:string) : string;
    begin
        Result := Copy(s,1,Pos(';',s)-1);
    end;

    { function tabR }
    function tabR(s:string) : string;
    begin
        s := Copy(s,Pos(';',s)+1, length(s));
        Result := Copy(s,1,Pos(';',s)-1);
    end;

    { function tabJoin }
    function tabLJoin(s:string) : string;
    begin
        Result := trim(Copy(s,3,Pos('.',s)-3));
    end;

    { function tabRJoin }
    function tabRJoin(s:string) : string;
    begin
        s := Copy(s,Pos('=',s)+1, length(s));
        Result := Copy(s,1,Pos('.',s)-1);
    end;

    { function Compara }
    function Compara(s:string) : string;
    begin
        s := Copy(s,Pos(';',s)+1,length(s));
        s := Copy(s,Pos(';',s)+1,length(s));
        Result := Copy(s,1,Pos(';',s)-1);
    end;

    { function Join }
    function Join(s:string) : string;
    begin
         s := Copy(s,Pos(';',s)+1,length(s));
         s := Copy(s,Pos(';',s)+1,length(s));
         Result := Copy(s,Pos(';',s)+1,length(s));
    end;

    { function InsereJoin }
    function InsereJoin(sJoinOri, sTabela, sJoinInsere:string) : string;
    var
        PosInsere : integer;
        sOri, sIns : string;
    begin
        sOri := sJoinOri;
        sIns := sJoinInsere;
        PosInsere := Pos('JOIN '+sTabela, sOri)+5;
        Delete(sOri, PosInsere, Length(sTabela));
        sIns := Copy(sIns,Pos(';',sIns)+1,length(sIns));
        sIns := Copy(sIns,Pos(';',sIns)+1,length(sIns));
        sIns := '( '+sTabela+' '+Copy(sIns,Pos(';',sIns)+1,length(sIns))+' )';
        Insert(sIns, sOri, PosInsere);
        Result := sOri;
    end;

    { procedure EncheJoin }
    procedure EncheJoin;
    var
        i, j, PosPonto, PosIgual, iAtu : integer;
        sCompara,
        sTesteJoin : string;

        { function TrocaOrdem }
        function TrocaOrdem(s : string) : string;
        begin
             if Copy(s,1,1) = 'L' then
                sTesteJoin := 'R; '
             else
                sTesteJoin := 'L; ';
             sCompara := Copy(s,Pos(';',s)+1,Length(s));
             PosIgual := Pos('=',sCompara);
             sTesteJoin := sTesteJoin+trim(Copy(sCompara,PosIgual+1,Length(sCompara)))+'='+trim(Copy(sCompara,1,PosIgual-1));
             Result := sTesteJoin;
        end;

    begin
         strAtuJoin.clear;
         sTesteJoin := '';

         for i := 0 to strJoin.count-1 do
         begin
              PosIgual := Pos('=', strJoin[i]);
              PosPonto := Pos(';', strJoin[i]);
              sCompara := Copy(strJoin[i],PosPonto+1,Length(strJoin[i]));
              sCampoL  := Trim(Copy(strJoin[i],3,PosIgual-3));
              sCampoR  := Trim(Copy(strJoin[i],PosIgual+1,Length(strJoin[i])));
              sTabelaL := Tabela(Trim(Copy(sCampoL,1,Pos('.',sCampoL)-1)));
              sTabelaR := Tabela(Trim(Copy(sCampoR,1,Pos('.',sCampoR)-1)));
              sAliasL  := Alias(Trim(Copy(sCampoL,1,Pos('.',sCampoL)-1)));
              sAliasR  := Alias(Trim(Copy(sCampoR,1,Pos('.',sCampoR)-1)));

              iAtu := strAtuJoin.Add(sTabelaL+' '+sAliasL+';'+sTabelaR+' '+sAliasR+';'+sCompara+';');
              if Copy(strJoin[i],1,1) = 'L' then
                 strAtuJoin[iAtu] := strAtuJoin[iAtu]+' LEFT '
              else
                 strAtuJoin[iAtu] := strAtuJoin[iAtu]+' RIGHT ';
              strAtuJoin[iAtu] := strAtuJoin[iAtu]+' OUTER JOIN '+ sTabelaR + ' '+sAliasR;
              strAtuJoin[iAtu] := strAtuJoin[iAtu]+' ON ( '+sCompara+' )';
         end;

         // Verifica os Joins com tabelas iguais
         i := strAtuJoin.count-1;
         while i >= 1 do
         begin
              sTesteJoin := strAtuJoin[i];
              j := i-1;
              while (j >= 0) and (i >= 1) do
              begin
                   if (TabL(sTesteJoin) = TabL(strAtuJoin[j])) and
                      (TabR(sTesteJoin) = TabR(strAtuJoin[j])) then
                   begin
                        strAtuJoin[j] := strAtuJoin[j]+ ' AND ('+Compara(sTesteJoin)+')';
                        strAtuJoin.Delete(i);
                        Dec(i);
                        j := i-1;
                   end
                   else
                       Dec(j);
              end;
              Dec(i);
         end;

         // Atualiza
         i := strAtuJoin.count-1;
         while i >= 1 do
         begin
              sTesteJoin := strAtuJoin[i];
              j := i-1;
              while (j >= 0) and (i >= 1) do
              begin
                   if TabL(sTesteJoin) = TabR(strAtuJoin[j]) then
                   begin
                        strAtuJoin[j] := InsereJoin(strAtuJoin[j], TabL(sTesteJoin), sTesteJoin);
                        strAtuJoin.Delete(i);
                        Dec(i);
                        j := i-1;
                   end
                   else
                       Dec(j);
              end;
              Dec(i);
         end;

         i := strAtuJoin.count-1;
         while i >= 1 do
         begin
              sTesteJoin := strAtuJoin[i];
              j := i-1;
              while (j >= 0) and (i >= 1) do
              begin
                   if (TabL(sTesteJoin) = TabL(strAtuJoin[j])) then
                   begin
                        strAtuJoin[j] := strAtuJoin[j]+' '+Join(strAtuJoin[i]);
                        strAtuJoin.Delete(i);
                        Dec(i);
                        j := i-1;
                   end
                   else
                       Dec(j);
              end;
              Dec(i);
         end;
    end;

    { procedure ConverteJoin }
    procedure ConverteJoin;
    var
        i, j : integer;
        sComandoTemp,
        sFromTemp: string;
        lRepete : boolean;
    begin
         sComandoTemp := sComando;
         // Cria Listas de strings para montagem do comando SQL
         strSelect  := TStringList.Create;
         strWhere   := TStringList.Create;
         strOrderBy := TStringList.Create;
         strJoin    := TStringList.Create;
         strAtuJoin := TStringList.Create;
         strTabela  := TStringList.Create;
         strFrom    := TStringList.Create;
         strAlias   := TStringList.Create;

         status := stSelect;
         // Monta listas de comandos
         lFim := false;
         repeat
               sComandoTemp := trim(sComandoTemp);

               PosEspaco := Pos(' ',sComandoTemp);
               if PosEspaco = 0 then
               begin
                    sPalavra := sComandoTemp;
                    lFim := true;
               end
               else
               begin
                   // Algumas palavras devem ficar juntas
                   lRepete := true;
                   while lRepete do
                   begin
                        if (Pos(' IS ', AnsiUpperCase(sComandoTemp)) = PosEspaco) then
                           Inc(PosEspaco,3)
                        else if (Pos(' NOT ', AnsiUpperCase(sComandoTemp)) = PosEspaco) then
                           Inc(PosEspaco,4)
                        else if (Pos(' NULL ', AnsiUpperCase(sComandoTemp)) = PosEspaco) then
                             Inc(PosEspaco,5)
                        else
                            lRepete := false;
                   end;
                   sPalavra := ' '+Trim(Copy(sComandoTemp,1,PosEspaco))+' ';
               end;

               iPosSelect := Pos('SELECT', AnsiUpperCase(sPalavra));

               if ( iPosSelect > 0) then
                  Status := stSelect
               else if (Pos(' FROM ', AnsiUpperCase(sPalavra)) > 0) then
                    Status := stFrom
               else if (Pos(' WHERE ', AnsiUpperCase(sPalavra)) > 0) then
                    Status := stWhere
               else if (Pos(' ORDER ', AnsiUpperCase(sPalavra)) > 0) then
                    Status := stOrder;

               case status of
                    stSelect : strSelect.Add(sPalavra);
                    stFrom   : strFrom.Add(sPalavra);
                    stWhere  : strWhere.Add(sPalavra);
                    stOrder  : strOrderBy.Add(sPalavra);
               end;

                    sComandoTemp := copy(sComandoTemp, PosEspaco, length(sComandoTemp));
              until lFim;

              // Cria lista de tabelas e aliases
              i := 1;
              while i <= strfrom.count-1 do
              begin
                   if (Pos(',', strFrom[i]) = 0) and (i < strfrom.count-1) then
                   begin
                        strFrom[i] := strFrom[i]+' '+strFrom[i+1];
                        strFrom.delete(i+1);
                   end;
                   sFromTemp := trim(strFrom[i]);
                   PosVirgula := Pos(',', sFromTemp);
                   if (PosVirgula = Length(sFromTemp)) then
                      sFromTemp := trim(Copy(sFromTemp,1,PosVirgula-1));

                   PosEspaco := Pos(' ', sFromTemp);
                   if (PosEspaco = 0) then
                   begin
                        strTabela.add( sFromTemp);
                        strAlias.add('');
                   end
                   else
                   begin
                        strTabela.add(trim(copy(sFromTemp,1, PosEspaco)));
                        strAlias.add(trim(copy(sFromTemp,PosEspaco, Length(sFromTemp)-PosEspaco+1)));
                   end;
                   Inc(i);
              end;

              // Traduz o (+)
              strJoin.Clear;
              for i := 1 to strWhere.Count -1 do
              begin
                   if (Pos('(+)', strWhere[i]) > 0) then
                   begin
                        PosMais := Pos('(+)', strWhere[i]);
                        PosIgual := Pos('=', strWhere[i]);
                        if PosMais > PosIgual then
                           sPosJoin := 'L'
                        else
                            sPosJoin := 'R';
                        sJoin := strWhere[i];
                        Delete(sJoin, Pos('(+)', sJoin),3);
                        strJoin.Add(trim(sPosJoin+';'+sJoin));

                        sCampoL := Trim(Copy(strWhere[i],1,PosIgual-1));
                        sCampoR := Trim(Copy(strWhere[i],PosIgual+1,Length(strWhere[i])));
                        sTabelaL := Tabela(Trim(Copy(sCampoL,1,Pos('.',sCampoL)-1)));
                        sTabelaR := Tabela(Trim(Copy(sCampoR,1,Pos('.',sCampoR)-1)));
                        sAliasL := Alias(Trim(Copy(sCampoL,1,Pos('.',sCampoL)-1)));
                        sAliasR := Alias(Trim(Copy(sCampoR,1,Pos('.',sCampoR)-1)));

                        for j := strFrom.Count-1 downto 1 do
                        begin
                             sAliasL := Trim(sAliasL);

                             if (sAliasL <> '') Then
                             Begin
                                 If Pos(',',strFrom[j]) <> 0 Then
                                    sAuxAliasL := Trim(Copy(strFrom[j],1,Pos(',',strFrom[j]) - 1))
                                 Else
                                    sAuxAliasL := Trim(strFrom[j]);

                                 sAuxAliasL  := UpperCase(Trim(Copy(sAuxAliasL,Pos(' ',sAuxAliasL),Length(sAuxAliasL)) ));
                             End
                             Else
                                 sAuxAliasL  := '';

                             sAuxTabelaL := Copy(trim(strFrom[j]),1,Length(sTabelaL));

                             if (sAliasR <> '') Then
                             Begin
                                 If Pos(',',strFrom[j]) <> 0 Then
                                    sAuxAliasR := Trim(Copy(strFrom[j],1,Pos(',',strFrom[j]) - 1))
                                 Else
                                    sAuxAliasR := Trim(strFrom[j]);

                                 sAuxAliasR  := UpperCase(Trim(Copy(sAuxAliasR,Pos(' ',sAuxAliasR),Length(sAuxAliasR)) ));
                             End
                             Else
                                 sAuxAliasR  := '';

                             sAuxTabelaR := Copy(trim(strFrom[j]),1,Length(sTabelaR));

                             //Compara se a tabela do left join esta na lista do from pelo nome do alias
                             //Só efetua a comparação pela tabela do left se não houver alias no left
                             if (sAliasL <> '') Then
                             Begin
                                If (Uppercase(Trim(sAliasL))= sAuxAliasL) then
                                    strFrom.Delete(j)
                                else
                                //Compara se a tabela do Right join esta na lista do from pelo nome do alias
                                //Só efetua a comparação pela tabela do Rigth se não houver alias no Rigth
                                if (sAliasR <> '') Then
                                Begin
                                   If (Uppercase(Trim(sAliasR))= sAuxAliasR) then
                                       strFrom.Delete(j);
                                End
                                Else
                                //Compara se a tabela do Right join esta na lista do from pelo nome da tabela
                                if (Uppercase(Trim(sTabelaR)) = sAuxTabelaR) then
                                   strFrom.Delete(j);
                             End
                             Else
                             //Compara se a tabela do left join esta na lista do from pelo nome da tabela
                             if (Uppercase(Trim(sTabelaL)) = sAuxTabelaL) then
                                strFrom.Delete(j)
                             else
                             //Compara se a tabela do Right join esta na lista do from pelo nome do alias
                             if (sAliasR <> '') Then
                             Begin
                                If (Uppercase(Trim(sAliasR))= sAuxAliasR) then
                                   strFrom.Delete(j);
                             End
                             Else
                             //Compara se a tabela do Right join esta na lista do from pelo nome da tabela
                             if (Uppercase(Trim(sTabelaR)) = sAuxTabelaR) then
                                strFrom.Delete(j);

                        end;
                   end;
              end;
    //
              EncheJoin;

              iFrom := 1;
              for i := 0 to strAtuJoin.count-1 do
              begin
                   strFrom.Insert(iFrom, TabL(strAtuJoin[i])+' '+Join(strAtuJoin[i]));
                   Inc(iFrom);
              end;

              for i := 1 to strFrom.count-2 do
              if Copy(strFrom[i], Length(strFrom[i])-1,1) <> ',' then
                  strFrom[i] := strFrom[i]+',';

              sJoin := strFrom[strFrom.count-1];
              Delete(sJoin, Pos(',', sJoin),1);
              strFrom[strFrom.count-1] := sJoin;

              // Analisa a clausula where
              for i := strWhere.count-1 downto 0 do
                  if (Pos('(+)', strWhere[i]) > 0) then
                     strWhere.Delete(i);

              UltLinha := twWhere;
              i := 0;
              while i <= strWhere.count-1 do
              begin
                   if Pos('WHERE', AnsiUpperCase(strWhere[i])) > 0 then
                   begin
                        UltLinha := twWhere;
                        Inc(i);
                   end
                   else if Pos('(', strWhere[i]) > 0 then
                   begin
                        UltLinha := twParentL;
                        Inc(i);
                   end
                   else if (Pos(')', strWhere[i]) > 0) AND (Pos('QUERYTROCA',strWhere[i])=0) then //Incluso para subqueries com IN e NOT IN
                   begin
                        if UltLinha = twParentL then
                        begin
                             strWhere.Delete(i);
                             strWhere.Delete(i-1);
                             i := 0;
                        end
                        else
                            Inc(i);
                        UltLinha := twParentR;
                   end
                   else if (Pos(' AND ', AnsiUpperCase(strWhere[i])) > 0) OR
                           (Pos(' OR ', AnsiUpperCase(strWhere[i])) > 0) then
                   begin
                        if (i = (strWhere.count-1)) or
                           (UltLinha in [twWhere, twOperador, twParentL]) then
                        begin
                             strWhere.Delete(i);
                             i := 0;
                        end
                        else
                            Inc(i);
                        UltLinha := twOperador;
                   end
                   else
                   begin
                        Inc(i);
                        UltLinha := tWClausula;
                   end;
              end;
              if strWhere.count = 1 then
                 strWhere.clear;

              // Montar o novo comando
              sComando := '';
              for j := 0 to strSelect.count-1 do
                  sComando := sComando + strSelect[j]+' ';
              for j := 0 to strFrom.count-1 do
                  sComando := sComando + strFrom[j]+' ';
              for j := 0 to strWhere.count-1 do
                  sComando := sComando + strWhere[j]+' ';
              for j := 0 to strOrderBy.count-1 do
                  sComando := sComando + strOrderBy[j]+' ';


              // Libera Listas de strings para montagem do comando SQL
              strSelect.free;
              strFrom.free;
              strWhere.free;
              strOrderBy.free;
              strJoin.free;
              strAtuJoin.free;
              strTabela.free;
              strAlias.free;
    end;

    procedure ConverteNVL;
    var PosNVL, TamNVL : integer;
        sLinNVL, sNVL : string;
        lstparam : TStringList;
    begin
         repeat
               PosNVL := Pos('NVL', AnsiUpperCase(sComando));
               if PosNVL > 0 Then
               begin
                   lstParam := TStringList.Create;
                   lstParam.Text := PegaParametros(Copy(sComando,PosNVL+3, length(sComando)), TamNVL);
                   Inc(TamNVL,3);

                   sLinNVL := sComando;
                   sNVL := '( CASE WHEN ' + lstParam[0] +' IS NULL THEN ' + lstParam[1] +' ELSE ' + lstParam[0] +' END )';
                   Delete(sLinNVL, PosNVL,TamNVL);
                   Insert(sNVL, sLinNVL, PosNVL);
                   sComando := sLinNVL;
                   lstParam.free;
               end;
         until PosNVL = 0;
    end;
    //


    procedure ConverteMONTHS_BETWEEN;
    var PosMONTHS_BETWEEN, TamMONTHS_BETWEEN : integer;
        sLinMONTHS_BETWEEN, sMONTHS_BETWEEN : string;
        lstparam : TStringList;
    begin
         repeat
               PosMONTHS_BETWEEN := Pos('MONTHS_BETWEEN', AnsiUpperCase(sComando));
               if PosMONTHS_BETWEEN > 0 Then
               begin
                    lstParam := TStringList.Create;
                    lstParam.Text := PegaParametros(Copy(sComando,PosMONTHS_BETWEEN+14, length(sComando)), TamMONTHS_BETWEEN);
                    Inc(TamMONTHS_BETWEEN,14);

                   sLinMONTHS_BETWEEN := sComando;
                   sMONTHS_BETWEEN := '((DAYS(' + lstParam[0] +') - DAYS(' + lstParam[1] +'))/12)';
                   Delete(sLinMONTHS_BETWEEN, PosMONTHS_BETWEEN,TamMONTHS_BETWEEN);
                   Insert(sMONTHS_BETWEEN, sLinMONTHS_BETWEEN, PosMONTHS_BETWEEN);
                   sComando := sLinMONTHS_BETWEEN;
                   lstParam.free;
               end;
         until PosMONTHS_BETWEEN = 0;
    end;

    { procedure ConverteToDate }
    procedure ConverteToDate;
    var xLoop, j, PosToDate, iPos, TamToDate : integer;
        sDia, sMes, sAno, sLinDate, sDate : string;
        lstparam : TStringList;
        sMinuto, sHora, sSegunto: String;
    begin
         repeat
               PosToDate := Pos('TO_DATE', AnsiUpperCase(sComando));
               if PosToDate > 0 then
               begin
                    lstParam := TStringList.Create;
                    lstParam.Text := PegaParametros(Copy(sComando,PosToDate+7, length(sComando)), TamToDate);
                    Inc(TamToDate,7);

                   sLinDate := lstParam.Text;
                   iPos := Pos('''', sLinDate);
                   while iPos > 0 do
                   begin
                         Delete(sLinDate,iPos,1);
                         iPos := Pos('''', sLinDate);
                   end;
                   lstParam.Text := sLinDate;

                   sAuxParam := AnsiUpperCase(lstParam[1]);
                   iPoshh24 := Pos('HH24', sAuxParam);
                   If iPoshh24 <> 0 Then
                   Begin
                     Delete(sAuxParam,iPoshh24,4);
                     Insert('HH',sAuxParam,iPoshh24);
                     lstParam[1] := sAuxParam;
                   End;

                   sDia := '';
                   sMes := '';
                   sAno := '';
                   sSegunto := '';
                   sHora := '';
                   sMinuto := '';
                   for j := 1 to length(lstParam[1]) do
                   begin
                        if (Copy(AnsiUpperCase(lstParam[1]),j,1) = 'D') then
                           sDia := sDia+Copy(lstParam[0],j,1)
                        else if ((Copy(AnsiUpperCase(lstParam[1]),j,1) = 'M') AND
                                 (Copy(AnsiUpperCase(lstParam[1]),j + 1,1) = 'M')) Or
                                 ((Copy(AnsiUpperCase(lstParam[1]),j,1) = 'M') AND
                                 (Copy(AnsiUpperCase(lstParam[1]),j - 1,1) = 'M'))  then
                           sMes := sMes+Copy(lstParam[0],j,1)
                        else if (Copy(AnsiUpperCase(lstParam[1]),j,1) = 'Y') then
                           sAno := sAno+Copy(lstParam[0],j,1)
                        else if ((Copy(AnsiUpperCase(lstParam[1]),j,1) = 'M') AND
                                 (Copy(AnsiUpperCase(lstParam[1]),j + 1,1) = 'I')) Or
                                 ((Copy(AnsiUpperCase(lstParam[1]),j,1) = 'I') AND
                                 (Copy(AnsiUpperCase(lstParam[1]),j - 1,1) = 'M'))  then
                           sMinuto := sMinuto+Copy(lstParam[0],j,1)
                        else if (Copy(AnsiUpperCase(lstParam[1]),j,1) = 'H') then
                           sHora := sHora+Copy(lstParam[0],j,1)
                        else if (Copy(AnsiUpperCase(lstParam[1]),j,1) = 'S') then
                           sSegunto := sSegunto+Copy(lstParam[0],j,1)
                   end;
                   sLinDate := sComando;

                   For xLoop:=1 To Length(sMes) Do
                   Begin
                      Case sMes[xLoop] Of
                      '0'..'9': sMes[xLoop] := sMes[xLoop]
                      Else
                        sMes[xLoop] := ' ';
                      End;                                              
                   End;
                   sMes := Trim(sMes);

                   //Troquei o TIMESTAMP_ISO por TIMESTAMP
                   If Copy(lstParam[0],1,1) = ':' Then
                      sDate := 'TIMESTAMP_ISO(' + lstParam[0] + ')'
                   Else
                      if (sDia='') or (sMes='') or (sAno='') then
                      Begin
                          if (sSegunto='') or (sMinuto='') or (sHora='') then
                             sDate := 'TIMESTAMP_ISO(null)'
                          Else
                             sDate := 'TIMESTAMP_ISO('''+sHora+'.'+sMinuto+'.'+sSegunto+'.000000'')';

                      End
                      else
                          if (sSegunto='') or (sMinuto='') or (sHora='') then
                             sDate := 'TIMESTAMP_ISO('''+sAno+'-'+sMes+'-'+sDia+''')'
                          Else
                             sDate := 'TIMESTAMP_ISO('''+sAno+'-'+sMes+'-'+sDia+'-'+sHora+'.'+sMinuto+'.'+sSegunto+'.000000'')';

                   Delete(sLinDate, PosToDate,TamToDate);
                   Insert(sDate, sLinDate, PosToDate);
                   sComando := sLinDate;
                   lstParam.free;
               end;
         until PosToDate = 0;
    end;

    procedure ConverteToNumber;
    var PosToChar, TamToChar : integer;
        sLinChar, sToChar : string;
        lstParam : TStringList;
    begin
         repeat
              PosToChar := Pos('TO_NUMBER', AnsiUpperCase(sComando));
              if PosToChar > 0 then
              begin
                   lstParam := TStringList.Create;
                   lstParam.Text := PegaParametros(Copy(sComando,PosToChar+9, length(sComando)), TamToChar);
                   Inc(TamToChar,9);

                   sToChar := ' CAST ('+ lstParam[0] + ' AS NUMERIC ) ';

                   lstParam.Free;
                   sLinChar := sComando;
                   Delete(sLinChar, PosToChar, TamToChar);
                   Insert(sToChar, sLinChar, PosToChar);
                   sComando := sLinChar;
              end;
         until PosToChar = 0;
    end;

    { procedure ConverteToChar }
    procedure ConverteToChar;
    var PosToChar, TamToChar : integer;
        sLinChar, sToChar : string;
        lstParam : TStringList;
    begin
         repeat
              PosToChar := Pos('TO_CHAR', AnsiUpperCase(sComando));
              if PosToChar > 0 then
              begin
                   lstParam := TStringList.Create;
                   lstParam.Text := PegaParametros(Copy(sComando,PosToChar+7, length(sComando)), TamToChar);
                   Inc(TamToChar,7);

                   if (lstParam.Count > 1) and
                      ((Pos('DD', AnsiUpperCase(lstParam[1])) > 0) OR
                       (Pos('MM', AnsiUpperCase(lstParam[1])) > 0) or
                       (Pos('YY', AnsiUpperCase(lstParam[1])) > 0)) then
                   Begin
                       If AnsiUpperCase(lstParam[1]) = QuotedStr('DD/MM/YYYY') Then
                          sToChar := ' CHAR(REPLACE(CHAR(DATE(' + lstParam[0] + '), EUR),''.'',''/''),10) '
                       Else
                         If AnsiUpperCase(lstParam[1]) = QuotedStr('MM/YYYY') Then
                            sToChar := ' SUBSTR(REPLACE(CHAR(DATE(' + lstParam[0] + '), EUR),''.'',''/''),4,7) '
                         Else
                            If AnsiUpperCase(lstParam[1]) = QuotedStr('YYYY/MM') Then
                               sToChar := ' CHAR(REPLACE(CHAR(DATE(' + lstParam[0] + '),ISO),''-'',''/''),7) '
                            Else
                            If AnsiUpperCase(lstParam[1]) = QuotedStr('MM/DD/YYYY') Then
                               sToChar := ' CHAR(REPLACE(CHAR(DATE(' + lstParam[0] + '), USA),''-'',''/''),10) '
                              Else
                              If AnsiUpperCase(lstParam[1]) = QuotedStr('DD') Then
                                 sToChar := ' SUBSTR(CHAR(DATE(' + lstParam[0] + '), EUR),1,2) '
                                Else
                                If AnsiUpperCase(lstParam[1]) = QuotedStr('MM') Then
                                   sToChar := ' SUBSTR(CHAR(DATE(' + lstParam[0] + '), EUR),4,2) '
                                  Else
                                  If AnsiUpperCase(lstParam[1]) = QuotedStr('YYYY') Then
                                     sToChar := ' SUBSTR(CHAR(DATE(' + lstParam[0] + '), EUR),7,4) '
                                    Else
                                    If AnsiUpperCase(lstParam[1]) = QuotedStr('YY') Then
                                       sToChar := ' SUBSTR(CHAR(DATE(' + lstParam[0] + '), EUR),9,2) ';

                   End
                   else
                       sToChar := ' CHAR ('+ lstParam[0] + ') ';

                   lstParam.Free;
                   sLinChar := sComando;
                   Delete(sLinChar, PosToChar, TamToChar);
                   Insert(sToChar, sLinChar, PosToChar);
                   sComando := sLinChar;
              end;
         until PosToChar = 0;
    end;


    { procedure ConverteDecode }
    procedure ConverteDecode;
    var PosDecode, iPos, j, TamDecode : integer;
        sCase, sLinDecode : string;
        lstParam : TStringList;
    begin
         repeat
              PosDecode := Pos('DECODE', AnsiUpperCase(sComando));
              if PosDecode > 0 then
              begin
                   lstParam := TStringList.Create;
                   lstParam.Text := PegaParametros(Copy(sComando, PosDecode+6, length(sComando)), TamDecode);
                   Inc(TamDecode,6);

                   sCase := '( CASE ';
                   iPos := 1;
                   for j := 1 to lstParam.count -1 do
                   begin
                        if (j = lstParam.count-1) and (iPos=1) then
                        begin
                             sCase := sCase+'ELSE '+lstParam[j]+' ';
                        end
                        else
                        begin
                             if iPos = 1 then
                             begin
                                  If UpperCase(Trim(lstParam[j])) = 'NULL' Then
                                     sCase := sCase+'WHEN '+lstParam[0]+' IS '+lstParam[j]+' '
                                  Else
                                     sCase := sCase+'WHEN '+lstParam[0]+' = '+lstParam[j]+' ';
                                  iPos := 2;
                             end
                             else if iPos = 2 then
                             begin
                                  sCase := sCase+'THEN '+lstParam[j]+' ';
                                  iPos := 1;
                             end;
                        end;
                   end;
                   lstParam.Free;
                   sCase := sCase + 'END )';
                   sLinDecode := sComando;
                   Delete(sLinDecode, PosDecode, TamDecode);
                   Insert(sCase, sLinDecode, PosDecode);
                   sComando := sLinDecode;
              end;
         until PosDecode = 0;
    end;

   { procedure PoeEspaco }
   procedure PoeEspaco;
   var i : integer;
   begin
        for i := 0 to SQL.Count -1 do
            SQL[i] := SQL[i]+' ';
   end;

   procedure InsereReturnLF(sTexto: String; Var sString :String; bInsertAfter :Boolean = True);
   Var
     iPosSearch :Integer;
   Begin
     sTexto := UpperCase(sTexto);
     iPosSearch := 1;
     iPosSearch := StrSearch(sTexto,UpperCase(sString),iPosSearch);


     While iPosSearch <> 0 Do
     Begin
        iPosSearch := iPosSearch + Length(sTexto);

        If bInsertAfter Then
           Insert((#13+#10),sString,iPosSearch);

        iPosSearch := StrSearch(sTexto,UpperCase(sString),iPosSearch);
     End;
   End;

   function AchaETroca(CONST sOldStr, sNewStr, sStr :String): String;
   Var
     iPos: Integer;
     sAuxStr :String;
   Begin
     sAuxStr := uppercase(sStr);
     iPos := Pos(uppercase(sOldStr), sAuxStr);
     If iPos > 0 Then
     Begin
        While iPos > 0 Do
        Begin
           Delete(sAuxStr, iPos, Length(sOldStr));
           Insert(sNewStr, sAuxStr, iPos);
           iPos := Pos(uppercase(sOldStr), sAuxStr);
        End;

        Result := sAuxStr;
     End
     Else
        Result := sStr;
   End;

begin
   iCountSubQueries := 0;
   Try
     //Retira Comentários do tipo "--" da linha da Instrução SQL
     for i := sql.Count-1 DownTo 0 Do
       If Pos('--',sql[i]) <> 0 Then Sql.Delete(i);

     //Retira Comentários do tipo "/* aaaaaa */" da linha da Instrução SQL
     iLinhaFimComent := 0;
     for i := sql.Count-1 DownTo 0 Do
     Begin
       If Pos('*/',sql[i]) <> 0 Then iLinhaFimComent := i;

       If (Pos('/*',sql[i]) <> 0) And
          (iLinhaFimComent <> 0) Then
       Begin
          For X:=iLinhaFimComent DownTo i Do
              Sql.Delete(X);

          iLinhaFimComent := 0;
       End;
     End;

     // Prepara Linha de comando para analise
     sComando := '';
     for i := 0 to sql.Count-1 do
         sComando := sComando+' '+Trim(sql[i]);

     sComando := trim(sComando);
     sComando := AcertaVirgulas(sComando);
     sComando := Acerta(sComando, '''#9''', ' ', false);
     sComando := Acerta(sComando, ' ,', ', ', false);
     sComando := Acerta(sComando, ' =', '=', false);
     sComando := Acerta(sComando, '= ', '=', false);
     sComando := Acerta(sComando, ' >', '>', false);
     sComando := Acerta(sComando, '> ', '>', false);
     sComando := Acerta(sComando, ' <', '<', false);
     sComando := Acerta(sComando, '< ', '<', false);
     sComando := Acerta(sComando, '(', ' ( ', true);
     sComando := Acerta(sComando, ')', ' ) ', true);
     sComando := Acerta(sComando, ' +', '+', false);
     sComando := Acerta(sComando, '+ ', '+', false);
     sComando := Acerta(sComando, ' (+)', '(+)', false);
     sComando := Acerta(sComando, '(+) =', '(+)=', false);
     sComando := Acerta(sComando, '))', ') )', true);
     sComando := Acerta(sComando, '((', '( (', true);
     sComando := Acerta(sComando, ') =', ')=', true);
     sComando := Acerta(sComando, ') <', ')<', true);
     sComando := Acerta(sComando, ') >', ')>', true);
     sComando := Acerta(sComando, 'UPPER ', 'UPPER', false);
     sComando := Acerta(sComando, 'UPPER(', 'LCASE(', true);
     sComando := Acerta(sComando, 'LOWER ', 'LOWER', false);
     sComando := Acerta(sComando, 'LOWER(', 'LCASE(', true);
     sComando := Acerta(sComando, 'ORDER BY', ' ORDER BY', true);

     //Trata as subqueryes fazendo um loop na chamada da convertesql convertendo as instruções de forma recursiva
     //Faz a Busca Inicial verificando a existência de SUBQUERYES no select para tratálos separadamente
     iPosSearchSubStr := 0;
     iPosSearchSubStr := StrSearch('SELECT',UpperCase(sComando),iPosSearchSubStr);


       iPosSearchSubStr := iPosSearchSubStr + 6;
       iOldPosSearchSubStr := iPosSearchSubStr;
       iPosSearchSubStr := StrSearch(' SELECT',UpperCase(sComando),iPosSearchSubStr);

       If (iPosSearchSubStr = 0) Then
       Begin
          iPosSearchSubStr := iOldPosSearchSubStr;
          iPosSearchSubStr := StrSearch('(SELECT',UpperCase(sComando),iPosSearchSubStr);

             If (iPosSearchSubStr = 0) Then
             Begin
                iPosSearchSubStr := iOldPosSearchSubStr;
                iPosSearchSubStr := StrSearch(',SELECT',UpperCase(sComando),iPosSearchSubStr);

                If iPosSearchSubStr <> 0 Then
                   inc(iPosSearchSubStr)
             End
             Else
               Inc(iPosSearchSubStr);
       End
       ELse
          Inc(iPosSearchSubStr);

     While iPosSearchSubStr <> 0 Do
     Begin
       iNumParentesis := 1;
       For X:= iPosSearchSubStr To (Length(sComando)) Do
       Begin
           If sComando[x] = '(' Then
              Inc(iNumParentesis);

           If sComando[x] = ')' Then
              Dec(iNumParentesis);

           If iNumParentesis = 0 Then
           Begin
              Inc(iCountSubQueries);
              SetLength(strSubQuery,iCountSubQueries);

              strSubQuery[iCountSubQueries - 1] := TStringList.Create;

              strSubQuery[iCountSubQueries - 1].Add(Copy(sComando, iPosSearchSubStr, (X  - iPosSearchSubStr)));

              ConverteDb2(strSubQuery[iCountSubQueries - 1]);


              Delete(sComando, iPosSearchSubStr, (X  - iPosSearchSubStr));
              Insert('QUERYTROCA' + IntToStr(iCountSubQueries - 1), sComando, iPosSearchSubStr - 1);


              //Se a subQuery estiver no from verifica e existência de parênteses e retira da qry principal adicional na lista da subquery
              PosParIni := iPosSearchSubStr - 2;
              If sComando[PosParIni] = '(' Then
              Begin
                 Delete(sComando,PosParIni,1);
                 strSubQuery[iCountSubQueries - 1].Text := '(' + strSubQuery[iCountSubQueries - 1].Text;
              End;

              PosParFin := iPosSearchSubStr + Length('QUERYTROCA' + IntToStr(iCountSubQueries - 1)) - 1;

              If sComando[PosParFin] = ')' Then
              Begin
                 Delete(sComando,PosParFin,1);
                 strSubQuery[iCountSubQueries - 1].Text := strSubQuery[iCountSubQueries - 1].Text + ')';
              End;

              Break;
           End;
       End;

       iPosSearchSubStr := iPosSearchSubStr + 6;
       iOldPosSearchSubStr := iPosSearchSubStr;
       iPosSearchSubStr := StrSearch(' SELECT',UpperCase(sComando),iPosSearchSubStr);

       If (iPosSearchSubStr = 0) Then
       Begin
          iPosSearchSubStr := iOldPosSearchSubStr;
          iPosSearchSubStr := StrSearch('(SELECT',UpperCase(sComando),iPosSearchSubStr);

             If (iPosSearchSubStr = 0) Then
             Begin
                iPosSearchSubStr := iOldPosSearchSubStr;
                iPosSearchSubStr := StrSearch(',SELECT',UpperCase(sComando),iPosSearchSubStr);

                If iPosSearchSubStr <> 0 Then
                   inc(iPosSearchSubStr)
             End
             Else
               Inc(iPosSearchSubStr);
       End
       ELse
          Inc(iPosSearchSubStr);

     End;
     //

     if (Pos('(+)', sComando) > 0) then ConverteJoin;
     ConverteToDate;
     ConverteToChar;
     ConverteDecode;
     ConverteMONTHS_BETWEEN;
     ConverteNVL;
     ConverteToNumber;

     InsereReturnLF('FROM', sComando);
     InsereReturnLF('WHERE', sComando);
     InsereReturnLF('ORDER BY', sComando);
     InsereReturnLF('GROUP BY', sComando);
     InsereReturnLF(' AND ', sComando, False);
     InsereReturnLF(' OR ', sComando, False);
     InsereReturnLF('LEFT  INNER JOIN', sComando, False);
     InsereReturnLF('LEFT  OUTER JOIN', sComando, False);
     InsereReturnLF('RIGHT  OUTER JOIN', sComando, False);
     InsereReturnLF('RIGHT  INNER JOIN', sComando, False);

     sComando := AchaETroca('SYSDATE', 'CURRENT TIMESTAMP', sComando);

     //Substituir as strigs das subqueryes pelas subqueryes convertidas
     For X:=0 To (iCountSubQueries - 1) Do
     Begin
       iPosSearchSubStr := Pos('QUERYTROCA' + IntToStr(X),sComando);
       Delete(sComando, iPosSearchSubStr, Length('QUERYTROCA' + IntToStr(X)));
       Insert(strSubQuery[x].Text, sComando, iPosSearchSubStr);
     End;

     InsereReturnLF(' SELECT', sComando);
     InsereReturnLF('(SELECT', sComando);
     InsereReturnLF(',SELECT', sComando);      

     sql.clear;
     sql.add(sComando);
   finally
     If iCountSubQueries > 0 Then
     Begin
        For X:=(iCountSubQueries - 1) DownTo 0 Do
          strSubQuery[x].Free;
     End;
   End;
end;


end.
