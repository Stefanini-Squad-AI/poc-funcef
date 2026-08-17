{
--------------------------------------------------------------------------------------------------
Rotina......: RetiraComentarios
Nº SOL......: 155728
Nº KINTANA..: 1212675
Data........: 31/03/2011
Responsável.: Thaise Amaral Martins
Descrição...: Essa procedure RetiraComentarios não será mais utilizada, pois quaisquer caracteres
              em SQL que sejam de comentários PODEM ser inseridos.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 139129
Nº KINTANA..: 852607
Data........: 07/07/2010
Responsável.: Thaise Amaral Martins
Descrição...: Ajuste na validação de Querys na procedure 'Converte' para zerar String lida para não entrar em looping em caso de subquery
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 139129
Nº KINTANA..: 852607
Data........: 06/07/2010                     
Responsável.: Thaise Amaral Martins
Descrição...: Ajuste na validação de Querys na procedure 'Converte'
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 137667
Nº KINTANA..: 833978
Data........: 19/04/2010
Responsável.: Thaise Amaral Martins
Descrição...: Correção da procedure 'Converte', que estava se perdendo ao validar SubQuerys
--------------------------------------------------------------------------------------------------
}
unit uVerificaSQL;
                            
interface

uses Classes, Dialogs, SysUtils, {Wwquery, }DbClient, uCmSqlParams, DbTables;

type
  TStatus = (stIdle, stSelect, stFrom, stWhere, stOrder);
  TTipoWhere = (twWhere, twParentL, twParentR, twOperador, twClausula);

Function VerificaSql( sql: TStrings ): Boolean;

implementation

uses DbaseDados, uSistema, JclStrings, uMensErro;

Function VerificaSql( sql: TStrings ): Boolean;
var
   lFim: boolean;
   Status: TStatus;
   UltLinha: TTipoWhere;

   iLinhaFimComent, iPosSearchSubStr, iNumParentesis, iCountSubQueries, PosMais,
   PosIgual, iFrom, PosEspaco, PosVirgula, i, j: integer;

   sComando, sPalavra, sPosJoin, sCampoL, sCampoR, sTabelaL, sTabelaR, sAliasL,
   sAliasR, sJoin, sAuxTabelaL, sAuxAliasL, sAuxAliasR, sAuxTabelaR: String;

   strSelect, strFrom, strWhere, strOrderBy, strJoin, strAtuJoin, strTabela,
   strAlias, slTabelaBD: TStringList;

   strSubQuery: Array of TStrings;
   QryTrab, QryTrab2: TClientDataset;
   SqlTrab, SqlTrab2: TCmSqlParams;

   { function Acerta }
   function Acerta( sString, sTira, sPoe : string; SoUmaVez : boolean): string;
   var
      Posicao : integer;
      sTemp : string;
   begin
      sTemp := '';
      Posicao := Pos(UpperCase(sTira), UpperCase(sString));

      while Posicao > 0 do begin
            delete(sString, Posicao, Length(sTira));
            insert(sPoe, sString, Posicao);

            if SoUmaVez then begin
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

            If Posicao > 0 Then Begin
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
      else begin
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
      else begin
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

   { procedure EncheJoin }
   procedure EncheJoin;
   var
      i, j, PosPonto, PosIgual, iAtu : integer;
      sCompara, sTesteJoin : string;

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

      for i := 0 to strJoin.count-1 do begin
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

      while i >= 1 do begin
            sTesteJoin := strAtuJoin[i];
            j := i-1;

            while (j >= 0) and (i >= 1) do begin
                  if (TabL(sTesteJoin) = TabL(strAtuJoin[j])) and
                         (TabR(sTesteJoin) = TabR(strAtuJoin[j])) then begin
                     strAtuJoin[j] := strAtuJoin[j]+ ' AND ('+Compara(sTesteJoin)+')';
                     strAtuJoin.Delete(i);
                     Dec(i);
                     j := i-1;
                  end else
                     Dec(j);
            end;

            Dec(i);
      end;

      // Atualiza
      i := strAtuJoin.count-1;

      while i >= 1 do begin
            sTesteJoin := strAtuJoin[i];
            j := i-1;

            while (j >= 0) and (i >= 1) do begin
                  if TabL(sTesteJoin) = TabR(strAtuJoin[j]) then begin
                     strAtuJoin[j] := InsereJoin(strAtuJoin[j], TabL(sTesteJoin), sTesteJoin);
                     strAtuJoin.Delete(i);
                     Dec(i);
                     j := i-1;
                  end else
                     Dec(j);
            end;

            Dec(i);
      end;

      i := strAtuJoin.count-1;

      while i >= 1 do begin
            sTesteJoin := strAtuJoin[i];
            j := i-1;

            while (j >= 0) and (i >= 1) do begin
                  if (TabL(sTesteJoin) = TabL(strAtuJoin[j])) then begin
                     strAtuJoin[j] := strAtuJoin[j]+' '+Join(strAtuJoin[i]);
                     strAtuJoin.Delete(i);
                     Dec(i);
                     j := i-1;
                  end else
                     Dec(j);
            end;

            Dec(i);
      end;
   end;

   procedure ConverteJoin;
   var
      i, j : integer;
      sComandoTemp, sFromTemp: string;
      lRepete : boolean;
   begin
      sComandoTemp := sComando;
      status := stSelect;
      // Monta listas de comandos
      lFim := false;

      repeat
            sComandoTemp := trim(sComandoTemp);
            PosEspaco := Pos(' ',sComandoTemp);

            if PosEspaco = 0 then begin
               sPalavra := sComandoTemp;
               lFim := true;
            end else begin
               // Algumas palavras devem ficar juntas
               lRepete := true;

               while lRepete do begin
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

            if (Pos(' SELECT ', AnsiUpperCase(sPalavra)) > 0) then
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

      while i <= strfrom.count-1 do begin
            if (Pos(',', strFrom[i]) = 0) and (i < strfrom.count-1) then begin
               strFrom[i] := strFrom[i]+' '+strFrom[i+1];
               strFrom.delete(i+1);
            end;

            sFromTemp := trim(strFrom[i]);
            PosVirgula := Pos(',', sFromTemp);

            if (PosVirgula = Length(sFromTemp)) then
               sFromTemp := trim(Copy(sFromTemp,1,PosVirgula-1));

            PosEspaco := Pos(' ', sFromTemp);

            if (PosEspaco = 0) then begin
               strTabela.add( sFromTemp);
               strAlias.add('');
            end else begin
               strTabela.add(trim(copy(sFromTemp,1, PosEspaco)));
               strAlias.add(trim(copy(sFromTemp,PosEspaco, Length(sFromTemp)-PosEspaco+1)));
            end;

            Inc(i);
      end;

      // Traduz o (+)
      strJoin.Clear;

      for i := 1 to strWhere.Count -1 do begin
          if (Pos('(+)', strWhere[i]) > 0) then begin
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

             for j := strFrom.Count-1 downto 1 do begin
                 sAliasL := Trim(sAliasL);

                 if (sAliasL <> '') Then Begin
                    If Pos(',',strFrom[j]) <> 0 Then
                       sAuxAliasL := Trim(Copy(strFrom[j],1,Pos(',',strFrom[j]) - 1))
                    Else
                       sAuxAliasL := Trim(strFrom[j]);

                    sAuxAliasL  := UpperCase(Trim(Copy(sAuxAliasL,Pos(' ',sAuxAliasL),Length(sAuxAliasL)) ));
                 End Else
                    sAuxAliasL  := '';

                 sAuxTabelaL := Copy(trim(strFrom[j]),1,Length(sTabelaL));

                 if (sAliasR <> '') Then Begin
                    If Pos(',',strFrom[j]) <> 0 Then
                       sAuxAliasR := Trim(Copy(strFrom[j],1,Pos(',',strFrom[j]) - 1))
                    Else
                       sAuxAliasR := Trim(strFrom[j]);

                    sAuxAliasR  := UpperCase(Trim(Copy(sAuxAliasR,Pos(' ',sAuxAliasR),Length(sAuxAliasR)) ));
                 End Else
                    sAuxAliasR  := '';

                 //Código Antigo da Tabelas
                 sAuxTabelaR := Copy(trim(strFrom[j]),1,Length(sTabelaR));

                 //Só efetua a comparação pela tabela do left se não houver alias no left
                 if (sAliasL <> '') Then Begin
                    If (Uppercase(Trim(sAliasL))= sAuxAliasL) then
                       strFrom.Delete(j)
                    else
                       //Só efetua a comparação pela tabela do Rigth se não houver alias no Rigth
                       if (sAliasR <> '') Then Begin
                          If (Uppercase(Trim(sAliasR))= sAuxAliasR) then
                             strFrom.Delete(j);
                       End Else
                          //Compara se a tabela do Right join esta na lista do from pelo nome da tabela
                          if (Uppercase(Trim(sTabelaR)) = sAuxTabelaR) then
                             strFrom.Delete(j);
                 End Else
                    //Compara se a tabela do left join esta na lista do from pelo nome da tabela
                    if (Uppercase(Trim(sTabelaL)) = sAuxTabelaL) then
                       strFrom.Delete(j)
                    else
                       //Compara se a tabela do Right join esta na lista do from pelo nome do alias
                       if (sAliasR <> '') Then Begin
                          If (Uppercase(Trim(sAliasR))= sAuxAliasR) then
                             strFrom.Delete(j);
                       End Else
                          //Compara se a tabela do Right join esta na lista do from pelo nome da tabela
                          if (Uppercase(Trim(sTabelaR)) = sAuxTabelaR) then
                             strFrom.Delete(j);

             end;
          end;
      end;

      EncheJoin;
      iFrom := 1;

      for i := 0 to strAtuJoin.count-1 do begin
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

      while i <= strWhere.count-1 do begin
            if Pos('WHERE', AnsiUpperCase(strWhere[i])) > 0 then begin
               UltLinha := twWhere;
               Inc(i);
            end else
               if Pos('(', strWhere[i]) > 0 then begin
                  UltLinha := twParentL;
                  Inc(i);
               end else
                   //Incluso para subqueries com IN e NOT IN
                   if (Pos(')', strWhere[i]) > 0) AND (Pos('QUERYTROCA',strWhere[i])=0) then begin
                      if UltLinha = twParentL then begin
                         strWhere.Delete(i);
                         strWhere.Delete(i-1);
                         i := 0;
                      end else
                         Inc(i);

                      UltLinha := twParentR;
                   end else
                      if (Pos(' AND ', AnsiUpperCase(strWhere[i])) > 0) OR
                             (Pos(' OR ', AnsiUpperCase(strWhere[i])) > 0) then begin
                         if (i = (strWhere.count-1)) or
                                (UltLinha in [twWhere, twOperador, twParentL]) then begin
                            strWhere.Delete(i);
                            i := 0;
                         end else
                            Inc(i);

                         UltLinha := twOperador;
                      end else begin
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

   end;

   Function AjustaString(const sTexto : String) : String;
   begin
     Result := StringReplace(sTexto,#$D,' ',[rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result,#$A,'', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result,#$9, ' ',[rfReplaceAll,rfIgnoreCase]);
     Result := AcertaVirgulas( Result );
     Result := StringReplace(Result, ' ,', ', ',[rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, ' =', '=', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, '= ', '=', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, ' >', '>', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, '> ', '>', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, ' <', '<', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, '< ', '<', [rfReplaceAll,rfIgnoreCase]);
     Result := Acerta( Result, '(', ' ( ', true );
     Result := Acerta( Result, ')', ' ) ', true );
     Result := StringReplace(Result, ' +', '+', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, '+ ', '+', [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, ' (+)', '(+)',  [rfReplaceAll,rfIgnoreCase]);
     Result := StringReplace(Result, '(+) =', '(+)=',[rfReplaceAll,rfIgnoreCase]);
     Result := Acerta( Result, '))', ') )', true );
     Result := Acerta( Result, '((', '( (', true );
     Result := Acerta( Result, ') =', ')=', true );
     Result := Acerta( Result, ') <', ')<', true );
     Result := Acerta( Result, ') >', ')>', true );
     Result := StringReplace(Result, 'UPPER ', 'UPPER',[rfReplaceAll,rfIgnoreCase]);
     Result := Acerta(Result, 'UPPER(', 'LCASE(', true );
     Result := StringReplace(Result, 'LOWER ', 'LOWER',[rfReplaceAll,rfIgnoreCase]);
     Result := Acerta( Result, 'LOWER(', 'LCASE(', true );
     Result := Acerta( Result, 'ORDER BY', ' ORDER BY', true );
   end;


   procedure RetiraComentarios;
   var iPosSearchSubStr : Integer;
       i,x, iFrom : Integer;
       iLinhaFimComent : Integer;
   begin
     //Retira Comentários do tipo "--" da linha da Instrução SQL
     for i := sql.Count - 1 DownTo 0 Do
     Begin
       iPosSearchSubStr := Pos( '--', sql[ i ] );
       If iPosSearchSubStr <> 0 Then
         Sql[ i ] := Copy( sql[ i ], 1, iPosSearchSubStr - 1 );
     End;

     //Retira Comentários do tipo "/* aaaaaa */" da linha da Instrução SQL
     iLinhaFimComent := 0;

     for i := sql.Count - 1 DownTo 0 Do
     Begin
       If Pos( '*/', sql[ i ] ) <> 0 Then
         iLinhaFimComent := i;

       iPosSearchSubStr := Pos( '/*', sql[ i ] );
       PosMais := Pos( '/*+', sql[ i ] );

       If ( iPosSearchSubStr <> 0 ) And ( PosMais < iPosSearchSubStr ) And
                   ( iLinhaFimComent <> 0 ) Then
       Begin
         If iLinhaFimComent = i Then
         Begin
           iFrom := Pos( '*/', sql[ i ] );
           Sql[ i ] := Copy( Sql[ i ], 1, iPosSearchSubStr - 1 ) +
                       Copy( Sql[ i ], iFrom + 2, Length( Sql[ i ] ) - iFrom - 1 );
         End
         Else
         begin
           For x := iLinhaFimComent DownTo i Do
             If x = iLinhaFimComent Then
             Begin
               iFrom := Pos( '*/', sql[ x ] );
               Sql[ x ] := Copy( Sql[ x ], iFrom + 2, Length( Sql[ i ] ) - iFrom - 1 );
             End
             Else
             begin
               If x = i Then
                 Sql[ x ] := Copy( Sql[ x ], 1, iPosSearchSubStr - 1 )
               Else
                 Sql.Delete( x );
             end;
         end;
         iLinhaFimComent := 0;
       End;
       If Trim( Sql[ i ] ) = '' Then
         Sql.Delete( i );
     End;
   End;


   procedure Converte(Sql: TStrings; bAjusta : Boolean = False );
   var i, x: Integer;
       sComandoOriginal,sComandoParcial : AnsiString;
       iPosOriginal : Integer;
       bAchou : Boolean;
       sTexto : String;
       iPosSearchSubStrAnt : integer; //Bruno Bastos - 06/07/2010

   begin
     iCountSubQueries := 0;
     iPosSearchSubStrAnt := 0; //Bruno Bastos - 06/07/2010

     Try

        // Prepara Linha de comando para analise
        If bAjusta then
        begin
          //Thaise Amaral SOL155728 - Comentar a procedure RetiraComentarios, pois é necessário permitir que os
          //comentários sejam inseridos.
          //RetiraComentarios;
          sComandoOriginal := AjustaString(Trim(sql.Text));
          sComando          := sComandoOriginal
        end
        else
        Begin
          sComandoOriginal := sComando;
          iPosOriginal     := iPosSearchSubStr;
          sComando         := Trim(sql.Text);
        end;

        sTexto := '';
        //Trata as subqueryes fazendo um loop na chamada da convertesql convertendo as instruções de forma recursiva
        //Faz a Busca Inicial verificando a existência de SUBQUERYES no select para tratálos separadamente
        iPosSearchSubStr := Pos('SELECT',UpperCase(sComando));
        If iPosSearchSubStr = 1 then
        begin
          iPosSearchSubStr := Pos('SELECT',UpperCase(Copy(sComando,6,length(sComando))));
          If iPosSearchSubStr > 0 then
            iPosSearchSubStr := iPosSearchSubStr + 5;
        end;

        While iPosSearchSubStr <> 0 Do
        Begin
          iNumParentesis := 1;
          For X := iPosSearchSubStr To Length( sComando ) Do
          Begin
            If sComando[x] = '(' Then
              Inc( iNumParentesis );
            If sComando[x] = ')' Then
              Dec( iNumParentesis );
            bAchou := Copy(AnsiUppercase(sComando),x,6) = 'UNION ';
            If (iNumParentesis = 0) or bAchou Then
            Begin
              sComandoParcial := Copy( sComando, iPosSearchSubStr, X - iPosSearchSubStr );
              Inc( iCountSubQueries );

              SetLength( strSubQuery, iCountSubQueries );
              strSubQuery[ iCountSubQueries - 1 ] := TStringList.Create;
              TStringList(strSubQuery[ iCountSubQueries - 1 ]).Add( sComandoParcial );

              Converte( strSubQuery[ iCountSubQueries - 1 ] );

              Delete( sComando, iPosSearchSubStr, X  - iPosSearchSubStr  );
              sTexto := 'QUERYTROCA' + IntToStr( iCountSubQueries - 1 );
              Insert( sTexto, sComando, iPosSearchSubStr );
              Break;
            End;
          End;
          iPosSearchSubStrAnt := iPosSearchSubStr; //Bruno Bastos - 06/07/2010
          If sTexto <> '' then
          begin
            iPosSearchSubStr := Pos(sTexto,sComando);
            If iPosSearchSubStr > 0 then
              iPosSearchSubStr := iPosSearchSubStr + Length(sTexto) + 5;
          end
          //Bruno Bastos - teste 05/07/2010 - início
          else
            iPosSearchSubStr := iPosSearchSubStr + 5;
          //Bruno Bastos - teste 05/07/2010 - Fim

          iPosSearchSubStr := StrSearch( 'SELECT', UpperCase( sComando ), iPosSearchSubStr );

          //Bruno Bastos - teste 06/07/2010 - início
          if iPosSearchSubStrAnt = iPosSearchSubStr then
            iPosSearchSubStr := 0;
          //Bruno Bastos - teste 06/07/2010 - Fim

         End;
         ConverteJoin;
     Finally
        If iCountSubQueries > 0 Then Begin
           For X := iCountSubQueries - 1 DownTo 0 Do
               strSubQuery[ x ].Free;
        End;
        sComando         := sComandoOriginal;
        iPosSearchSubStr := iPosOriginal;
     End;
   End;

// Inicio do Método
Begin
   strSelect  := TStringList.Create;
   strFrom    := TStringList.Create;
   strWhere   := TStringList.Create;
   strOrderBy := TStringList.Create;
   strJoin    := TStringList.Create;
   strAtuJoin := TStringList.Create;
   strTabela  := TStringList.Create;
   strAlias   := TStringList.Create;
   SqlTrab    := TCmSqlParams.Create( Nil );
   SqlTrab2   := TCmSqlParams.Create( Nil );
   QryTrab    := TClientDataset.Create( Nil );
   QryTrab2   := TClientDataset.Create( Nil );
   SqlTrab.ClientDataSet  := QryTrab;
   SqlTrab2.ClientDataSet := QryTrab2;
   Result := True;

   Converte( sql, True );

   For i := StrSelect.Count - 1 DownTo 0 Do
       If UpperCase( Trim( strSelect[ i ] ) ) = 'SELECT' Then
          strSelect.Delete( i )
       Else
          If UpperCase( Trim( strSelect[ i ] ) ) = 'AS' Then Begin
             strSelect.Delete( i + 1 );
             strSelect.Delete( i );
          End Else
             strSelect[ i ] := UpperCase( Trim( StringReplace( strSelect[ i ], ',', '', [] ) ) );

   QryTrab.Close;
   SqlTrab.Sql.Clear;
   SqlTrab.Sql.Add( 'SELECT TABLE_NAME' );
   SqlTrab.Sql.Add( 'FROM TABELAACESSO' );
   SqlTrab.Sql.Add( 'WHERE IDESPACESSO = :IDESPACESSO' );
   SqlTrab.SQl.Add( 'UNION' );
   SqlTrab.SQl.Add( 'SELECT A.TABLE_NAME' );
   SqlTrab.SQl.Add( 'FROM TABELAACESSO A, GRUPOACESSO G, GRUPOUSU U' );
   SqlTrab.SQl.Add( 'WHERE U.IDUSUARIO = :IDUSUARIO AND' );
   SqlTrab.SQl.Add( 'G.IDGRUPO = U.IDGRUPO AND' );
   SqlTrab.SQl.Add( 'A.IDESPACESSO = G.IDESPACESSO' );
   SqlTrab.Prepare;
   SqlTrab.ParamByName( 'IdEspAcesso' ).AsInteger := Sistema.IdEspAcesso;
   SqlTrab.ParamByName( 'IdUsuario' ).AsInteger := Sistema.IdUsuario;
   SqlTrab.Open;

   If Not QryTrab.IsEmpty Then Begin
      dtmBaseDados.Cds.Close;
      slTabelaBD := TStringList.Create;

      if not Sistema.UsuarioUnico then
         Session.GetTableNames( 'BaseDados', 'CM.*', false, false, slTabelaBD )
      else
         Session.GetTableNames( 'BaseDados', Sistema.Owner + '.*', false, false, slTabelaBD );


      For i := 0 To slTabelaBD.Count - 1 Do
          slTabelaBD[ i ] := UpperCase( Copy( slTabelaBD[ i ], 4, Length( slTabelaBD[ i ] ) - 3 ) );

      QryTrab2.Close;
      SqlTrab2.Sql.Clear;
      SqlTrab2.Sql.Add( 'SELECT Upper( COLUMN_NAME ) COLUMN_NAME FROM COLUNAACESSO' );
      SqlTrab2.Sql.Add( 'WHERE IDESPACESSO = :idespacesso' );
      SqlTrab2.Sql.Add( 'AND TABLE_NAME = :table_name' );
      i := 0;

      While ( i < strTabela.Count ) And ( Result ) Do Begin
            If slTabelaBD.IndexOf( UpperCase( strTabela[ i ] ) ) <> -1 Then Begin
               If Not QryTrab.Locate( 'Table_Name', UpperCase( strTabela[ i ] ), [] ) Then Begin
                  Result := False;
                  Break;
               End Else Begin
                  saliasr := UpperCase( Alias( strTabela[ i ] ) );
                  SqlTrab2.Prepare;
                  SqlTrab2.ParamByName( 'IdEspAcesso' ).AsInteger := Sistema.IdEspAcesso;
                  SqlTrab2.ParamByName( 'table_name' ).AsString   := UpperCase( strTabela[ i ] );
                  SqlTrab2.Open;

                  If Not QryTrab2.IsEmpty Then Begin
                     For j := 0 To StrSelect.Count - 1 Do Begin
                         If saliasr = '' Then Begin
                            If Not QryTrab2.Locate( 'COLUMN_NAME', strselect[ j ], [] ) Then Begin
                               Result := False;
                               Break;
                            End;
                         End Else Begin
                            If Pos( saliasr + '.', strselect[ j ] ) <> 0 Then
                               If Not QryTrab2.Locate( 'COLUMN_NAME', strselect[ j ], [] ) Then Begin
                                  Result := False;
                                  Break;
                               End;
                         End;
                     End;
                  End;

                  QryTrab2.Close;
               End;
            End;

            Inc( i );
      End;

      If QryTrab2.Active Then
         QryTrab2.Close;
   End;

   QryTrab.Close;
   slTabelaBD.Free;
   strSelect.Free;
   strFrom.Free;
   strWhere.Free;
   strOrderBy.Free;
   strJoin.Free;
   strAtuJoin.Free;
   strTabela.Free;
   strAlias.Free;
End;

end.
