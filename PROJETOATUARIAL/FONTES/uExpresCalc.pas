{**************************************************************
Componente:  ExpressCalc

Autor     : Paulo André M. de Carvalho

Data      : 07/11/1999

Objetivo: Propiciar o cáclulo de uma Expressão matemática que
          pode conter variáveis pré-definidas.

Propriedades Publicadas:
      Ferros(R)         : String que conterá '' caso o expressão
                          seja válida ou os erros relacionados na
                          crítica caso a expressão seja inválida

      FVarCalcList      : Ponteiro para uma variável do tipo TVarList,
                          que armazena a listas de variáveis disponíveis
                          no banco de dados.

      Ftoken    (R/W    : StringLista que armazena os Termos da Expresão

      Ftipo_token (R/W) : StringLista que armazena os tipos dos Termos
                          da Expresão

      Ftermo    (R/W    : StringLista que armazena os Termos da Expresão,
                          agregando as variáveis indexadas.

      Ftermo_calc (R/W) : StringLista que armazena os Termos da Expresão,
                          aatribuindo alias para as variáveis indexadas.

      Ftipo_termo (R/W) : StringLista que armazena os Termos da Expresão,
                          considerando as variáveis indexadas.

Métodos Publicos:
      Create            : Cria uma variável do tipo tExpressao.

      Destroy           : Libera a variável criada pelo método Create.

      GetIndexedVar     : Retorna o Alias da variável indexada. Retorna
                          Null caso não exista nehuma variável indexada.

      SetIndexedVarValue: Seta o valor da variável indexada na Lista de
                          variáveis passada por ponteiro FVarCalcList.

      Expressao_Valida  : Valida uma Expressão matemática que pode conter
                          variáveis pré-definidas. Recebe a Expressão a ser
                          validada e Retorna True se ela for válida
                          ou False se for Inválida. No caso do Cálculo deve
                          ser o primeiro método a ser chamado. Todos os outros
                          métodos irão trabalhar com base na expressão passada
                          para este método.

      Variavel_Indexada : Verifica a existência de variáveis indexadas
                          para que possam ser tratadas.
                          Não recebe parâmetros e retorna Null, caso a
                          expressão não contenha variáveis indexadas, ou
                          a própria variável indexada.

      Prepara_Expressao : Criada para melhorar performance na execução dos
                          cálculos. Prepara a expressão para ser calculada
                          sem efetuar as críticas de sintaxe.

      Calcula_Expressao : Calcula o valor de uma Expressão matemática
                          válidada que pode conter variáveis pré-definidas.
                          Não recebe parâmetros e retorna o valor
                          resultante do cáculo. Se e expressão for
                          inválida sempre retornará zero e o propriedade
                          Ferros será setada com os erros decorrentes da
                          crítica.

****************************************************************}
unit uExpresCalc;

interface

Uses Classes, SysUtils, DB, DBTables, uFuncGerais, uVarCalc, uMensagem;

//-- Classe que implementa propriedades e metodos para cálculo
Type
  TExpresCalc = Class
    Private

      WgInd : Integer;

      //-- Rotinas que criticam a expressão
      Function  Limpa_Expressao (Cadeia : String) : String;
      Procedure Estrutura_Expressao (Cadeia : String);
      Procedure Add_Token(Fator : String; Tipo : String);
      Function  Se_Delimitador (Fator : Char) : Boolean;
      Function  Se_Numero (Fator : Char) : Boolean;
      Function  Se_Caracter (Fator : Char) : Boolean;
      Function  Se_Contido_Em (Fator : String; Cadeia : String) : Boolean;
      Function  Variavel_Invalida : Boolean;
      Procedure Add_Termo(Fator : String; FatorCalc : String; Tipo : String);

      //-- Rotinas que efetuam o cálculo da Expressão Valida
      Procedure Substitui_Variavel;
      Function Trata_Soma_Subtracao (WValor : Extended) : Extended;
      Function Trata_Multiplicacao_Divisao(WValor : Extended) : Extended;
      Function Trata_Exponenciacao (Wvalor : Extended) : Extended;
      Function Trata_Parenteses (Wvalor : Extended) : Extended;
      Function Trata_Unario (Wvalor : Extended) : Extended;
      Function Trata_Valor_Primitivo : Extended;
      Function Calcula_Unario(WOperador : String; WValor : Extended) : Extended;
      Function Efetua_Operacao(Operador : String; Valor1 : Extended; Valor2 : Extended) : Extended;

    Public

      //-- Armazena os Erros decorrentes da crítica
      Ferros : String;

      //-- Ponteiro para a Lista de variáveis a ser utilizada
      FVarCalcList : ^TVarCalc;

      //-- Listas que armazenam os fatores da expressão e seu tipo para critica
      Ftoken      : TStringList;
      Ftipo_token : TStringList;

      Ftermo      : TStringList;
      Ftermo_calc : TStringList;
      Ftipo_termo : TStringList;

      //-- Create e Destroy da Classe
      Constructor Create;
      Destructor Destroy; override;

      //-- Rotinas que recuperam e atualizam variáveis indexadas
      Function  GetIndexedVar (Variavel : String) : String;
      Procedure SetIndexedVarValue (Variavel : String; Valor : Extended);

      //-- Rotinas que validam e criticam expressão
      Function  Expressao_Valida (Cadeia : String) : Boolean;
      Function  Variavel_Indexada : Variant;
      Procedure Prepara_Expressao (Cadeia : String);
      Function  Calcula_Expressao : Extended;

End;

implementation

//--------------------------------------------------------//
//-- Cronstructor e Destroy da Classe                   --//
//--------------------------------------------------------//
//Constructor TExpressao.Create (AOwner : TComponent);
Constructor TExpresCalc.Create;
Begin
     Inherited Create;

     Ftoken      := TStringList.create;
     Ftipo_token := TStringList.Create;

     Ftermo      := TStringList.Create;
     Ftermo_calc := TStringList.Create;
     Ftipo_termo := TStringList.Create;

     FVarCalcList := Nil;
End;

Destructor TExpresCalc.Destroy;
Begin
     Ftoken.Free;
     Ftipo_token.Free;

     Ftermo.Free;
     Ftermo_calc.Free;
     Ftipo_termo.Free;

     Inherited Destroy;
End;

//--------------------------------------------------------------------
//-- Expressao_Valida
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Objetivo:
//--   Verificar se a expressão é uma expressão valida, ou seja, possui
//--   uma sequência lógica de operadores e contém apenas variáveis já
//--   cadastrada na tabela de variáveis
//--
//-- Resumo:
//--   - Inicializa variáveis de trabalho;
//--   - Limpa expressao, eleiminando os caracteres inúteis (Limpa_Expressao);
//--   - Estrutura a expressão, empilhando todos os termos em
//--     FToken = Termo e FTipo_Token = Tipo do Termo (Estrutura_Expressao);
//--   - Veifica se existe alguma variável inválida (Variavel_Invalida);
//--
//-- Parâmetros que requer
//--   Cadeia - String que deve conter a expressão a ser validada
//--
//-- Parâmetros que retorna
//--   Boolean - True  - caso a Expressão seja válida
//--           - False - caso a Expressão não seja válida
//--
//-- Obs: A Pripriedade Ferros conterá os erros caso
//--      a expressão seja rejeitada pela crítica ou ''
//--      caso seja válida
//----------------------------------------------------------------------//
Function TExpresCalc.Expressao_Valida (Cadeia : String) : Boolean;
Var  WInd           : Integer;
     WParenteses    : Integer;
     WSeqParValida  : Boolean;
     WColchetes     : Integer;
     WSeqColValida  : Boolean;
     WMensagem      : TMensagem;

Begin

     //-- Cria Objeto de Mensgens
     WMensagem  := TMensagem.Create;

     //-- Inicializa Variáveis
     Ferros := '';
     WInd := 0;
     WParenteses := 0;
     WColchetes := 0;
     WSeqParValida := True;
     WSeqColValida := True;

     //-- Verifica se a propriedade FValListCalc foi setada
     If FVarCalcList = Nil Then
        Raise Exception.Create ('A propriedade FVaListCalc não foi setada - chamada não permitida');

     //-- Monta Estrutura da uma Expressao Limpa
     Estrutura_Expressao(Limpa_Expressao(Cadeia));

     //-- Substitui as Variáveis pelos valores da Lista
     //-- e varifica se existe alguma variável Inválida
     IF Variavel_Invalida Then
        WMensagem.SetMsgErro('Expressão contém variável inválida');

     //-- Verifica se Existe algum caracter Inválido
     IF (Ftipo_token.IndexOf('INVALIDO')) <> -1 Then
        WMensagem.SetMsgErro('Expressão contém caracter inválido');

     {--- Verifica se Início e Término da Expressao Válidos ---}
     if Se_Contido_Em(Ftoken[0],'+-/*^%)[]') Then
        WMensagem.SetMsgErro('Expressão iniciando com caracter inválido');

     if Se_Contido_Em
       (Ftoken[Ftoken.Count-2], '+-/*^%([') Then
        WMensagem.SetMsgErro('Expressão terminando com caracter inválido');

     {--- Valida Expressao Estruturada --}
     While Ftoken[Wind] <> '' Do
       Begin
         //-- Verifica Número de Parenteses
         if Ftoken[WInd] = '(' Then
            WParenteses := WParenteses + 1
         Else
            if Ftoken[WInd] = ')' Then
               Begin
                 WParenteses := WParenteses - 1;
                 If WParenteses < 0 Then
                    WSeqParValida := False;
               End;

         //-- Verifica Sequencia de Colchetes
         if Ftoken[WInd] = '[' Then
            WColchetes := WColchetes + 1
         Else
            if Ftoken[WInd] = ']' Then
               Begin
                 WColchetes := WColchetes - 1;
                 If WColchetes < 0 Then
                    WSeqColValida := False;
               End;

         //-- Verifica validade da sequência de operadores
         if WInd > 0 Then
            Begin
              if Ftipo_token[WInd] =
                 Ftipo_token[WInd-1] Then
                 Begin
                   IF Ftoken[WInd] =
                      Ftoken[WInd-1] Then
                      Begin
                        if Not Se_Contido_Em(Ftoken[WInd],'()[]') Then
                          Begin
                            WMensagem.SetMsgErro('Sequencia de operadores inválida');
                          End
                      End
                   Else
                      Begin
                        If (Ftoken[WInd] = '(')
                        OR (Ftoken[WInd] = ')') Then
                           Begin
                             If Ftoken[WInd] = '(' Then
                                Begin
                                  if (Ftoken[WInd-1] = ')')
                                  or (Ftoken[WInd-1] = ']') Then
                                     WMensagem.SetMsgErro('Sequencia de operadores inválida');
                                End
                             Else
                                Begin
                                  if Ftoken[WInd-1] <> ']' Then
                                     WMensagem.SetMsgErro('Sequencia de operadores inválida');
                                End;
                           End
                        Else
                           If (Ftoken[WInd] = '[')
                           OR (Ftoken[WInd] = ']') Then
                              Begin
                                If Ftoken[WInd] = ']' Then
                                   Begin
                                     IF  (Ftoken[WInd-1] <> ']')
                                     AND (Ftoken[WInd-1] <> ')') Then
                                        Begin
                                          WMensagem.SetMsgErro('Sequencia de operadores inválida');
                                        End;
                                   End
                                Else
                                   Begin
                                     // Colocado para permitir a indexação de variáveis (que são
                                     // expressões) bidimensionais Ex. sal[(k-1)[dx]]
                                     IF (Ftoken[WInd-1] <> ')') Then
                                        Begin
                                          WMensagem.SetMsgErro('Sequencia de operadores inválida');
                                        End;
                                     //---------------
                                   End;
                              End
                           Else
                              IF (Ftoken[WInd-1] = '(')
                              OR (Ftoken[WInd-1] = '[') Then
                                 WMensagem.SetMsgErro('Sequencia de operadores inválida')
                              Else
                                 IF  (Se_Contido_Em(Ftoken[WInd-1], '+-*/%'))
                                 AND (Se_Contido_Em(Ftoken[WInd], '+-*/%')) Then
                                     WMensagem.SetMsgErro('Sequencia de operadores inválida');
                      End;
                 End
              Else
                 if (Ftipo_token[WInd] = 'DELIMITADOR')
                 OR (Ftipo_token[WInd-1] = 'DELIMITADOR') Then
                    Begin
                      If (Ftoken[WInd] = '(')
                      OR (Ftoken[WInd-1] = ')') Then
                         WMensagem.SetMsgErro('Sequencia de parenteses inválida');
                      // Verifica se variável pode ser indexada
                      IF Ftoken[WInd] = '[' Then
                         Begin
                           if (Ftipo_token[WInd-1] = 'VARIAVEL') Then
                              Begin
                                if Get_String_Index(FVarCalcList.Fvariavel, Ftoken[WInd-1]) = -1 Then
                                   // Variável Inválida
                                Else
                                   Begin
                                     // Inabilitado para permitir indexação bidimensional
                                     // de veriáveis que não são de tábua
                                   End;
                              End
                           Else
                              // Colchete precedido por algo que não seja variável
                              WMensagem.SetMsgErro('Sequencia de colchetes inválida');
                         End;
                      IF Ftoken[WInd-1] = ']' Then
                         WMensagem.SetMsgErro('Sequencia de colchetes inválida');
                    End
                 Else
                    WMensagem.SetMsgErro('Sequencia de Operadores inválida');
             End;
         WInd := WInd + 1;
       End;

     //-- Verifica Número de parenteses abertos e fechados
     If WParenteses <> 0 Then
        WMensagem.SetMsgErro('Número de parenteses inválido');

     //-- Verifica Sequencia de Abertura dos Parenteses
     if not WSeqParValida Then
        WMensagem.SetMsgErro('Sequencia de abertura de parenteses inválida');

     //-- Verifica Número de Colchetes abertos e fechados
     If WColchetes <> 0 Then
        WMensagem.SetMsgErro('Número de colchetes inválido');

     //-- Verifica Sequencia de Abertura dos Colchetes
     if not WSeqColValida Then
        WMensagem.SetMsgErro('Sequencia de abertura de colchetes inválida');

    if WMensagem.FErro Then
       Begin
         FErros := WMensagem.FMensagem;
         Result := False
       End
    Else
       Begin
         Result := True;
       End;

    WMensagem.Destroy;
End;

{-- Elimina caracteres indesejáveis da Expressão como Brancos e pontos -- }
Function TExpresCalc.Limpa_Expressao (Cadeia : String) : String;
Var WInd       : Integer;
    WExpressao : String;
Begin
     WExpressao := '';
     For WInd := 1 to Length(Cadeia) do
       Begin
         If not (Cadeia[Wind] in [' ','.',#13,#10]) Then
            WExpressao := WExpressao + Cadeia[Wind];
       End;
     Result := WExpressao;
End;

//-- Estrutura a expressão para crítica e validação
Procedure TExpresCalc.Estrutura_Expressao (Cadeia : String);
Var WInd       : Integer;
    WNumero    : String;
    WVariavel  : String;
Begin
     //-- Inicializa Lista de tokens;
     Ftoken.Clear;
     Ftipo_token.Clear;

     //-- Estrutura expressao carregando Token e Tipo_Token
     WInd := 1;
     While WInd <= Length(Cadeia) do
       Begin
         if Se_Delimitador(Cadeia[WInd]) Then
            Begin
              Add_Token(Cadeia[WInd],'DELIMITADOR');
              WInd := WInd + 1;
            End
          Else
            if Se_Numero(Cadeia[WInd]) Then
               Begin
                 WNumero := '';
                 While (WInd <= Length(Cadeia))
                   AND (Se_Numero(Cadeia[WInd])) Do
                   Begin
                     WNumero := WNUmero + Cadeia[WInd];
                     WInd := WInd + 1;
                   End;
                 Add_Token(WNumero,'NUMERO');
               End
            Else
               if Se_Caracter(Cadeia[WInd]) Then
                  Begin
                    WVariavel := '';
                    While (WInd <= Length(Cadeia))
                      AND ((Se_Caracter(Cadeia[WInd])) OR
                           (Se_Numero(Cadeia[WInd]))) Do
                      Begin
                        WVariavel := WVariavel + Cadeia[WInd];
                        WInd := WInd + 1;
                      End;
                    Add_Token(WVariavel,'VARIAVEL');
                  End
               Else
                  Begin
                    Add_Token(Cadeia[WInd],'INVALIDO');
                    WInd := Wind + 1;
                  End;
       End;
     Add_Token('','');
End;

{-- Verifica a existência de Variáveis que não estão na Lista --}
Function TExpresCalc.Variavel_Invalida : Boolean;
Var WInd : Integer;
Begin
    WInd := 0;
    Result := False;
    While (WInd < Ftoken.Count) And (Result <> True) Do
     Begin
       IF Ftipo_token[Wind] = 'VARIAVEL' Then
        Begin
          IF Get_String_Index(FVarCalcList.Fvariavel,Ftoken[Wind]) = -1 Then
             Result := True;
         End;
       WInd := WInd + 1;
    End;
End;

{-- Adiciona um Fator Lista Token --}
Procedure TExpresCalc.Add_Token(Fator : String; Tipo : String);
begin
       Ftoken.Add(Fator);
       Ftipo_Token.Add(Tipo);
end;

{-- Verifica se o caracter é um Delimitador --}
Function TExpresCalc.Se_Delimitador (Fator : Char) : Boolean;
Begin
     if Se_Contido_Em(Fator,'+-/*^%()[]:') Then
        Result := True
     Else
        Result := False;
End;

{-- Verifica se o caracter é um Número --}
Function TExpresCalc.Se_Numero (Fator : Char) : Boolean;
Begin
     if Se_Contido_Em(Fator,'0123456789,') Then
        Result := True
     Else
        Result := False;
End;

{-- Verifica se o caracter é Alfanumérico --}
Function TExpresCalc.Se_Caracter (Fator : Char) : Boolean;
Begin
     if Fator In ['A'..'Z', 'a'..'z', '_'] Then
        Result := True
     Else
        Result := False;
End;

{-- Verifica se o Caracter está contido na cadeia passada --}
Function TExpresCalc.Se_Contido_Em(Fator : String; Cadeia : String) : Boolean;
Begin
     if pos(Fator, Cadeia) > 0 Then
        Result := True
     Else
        Result := False;
End;

//--------------------------------------------------------------------
//-- Variavel_Indexada
//--------------------------------------------------------------------
//-- Função Publicada.
//--
//-- Objetivo:
//--   Verifiar se existe variável indexada na expressão e retorná-la.
//--   Esta rotina retorna o Alias "Ftermo_calc", que foi atribuído à
//--   variável indexada.
//--
//-- Função Publicada
//--   Parâmetros que requer
//--
//--   Parâmetros que retorna
//--     Variant - Null   - Caso não existe variável Indexada na expressão.
//--                        Neste caso o método "Calcula_Expressao" pode ser
//--                        chamado.
//--             - String - Contendo a variável indexada. Neste caso deve-se
//--                        utilizar o método "GetIndexedVar" para recuperar
//--                        a variável original e, após tratá-la, utilizar o
//--                        método "SetIndexedVarValue" para atualizar a
//--                        variável indexada com o valor desejado.
//--
//-- Obs: A Propriedade Ferros conterá os erros caso
//--      a expressão seja inválida ou Null caso seja válida
//----------------------------------------------------------------------//

Function TExpresCalc.Variavel_Indexada : Variant;
Begin
//-- Retorna uma variável indexada ou Null caso não exista nehuma
     If Ftipo_termo.IndexOf('VARIAVEL_INDEXADA') = -1 Then
        Result := Null // Não existe variável Indexada
     Else
        Result := Ftermo_calc[Ftipo_termo.IndexOf('VARIAVEL_INDEXADA')];
End;

//-----------------------------------------------------------------------
//-- GetIndexedVar
//-----------------------------------------------------------------------
//-- Função Publicada
//-----------------------------------------------------------------------
//--
//-- Objetivo:
//--   Retornar a variável indexada original, com base no Alias a ela
//--   atribuído.
//--
//-- Função Publicada
//--   Parâmetros que requer
//--     String - Nome da variável "Alias" recuperado pelo método
//--              "Variavel_Indexada".
//--
//--   Parâmetros que retorna
//--     String - Contendo a variável indexada original que deve ser tratada
//--
//------------------------------------------------------------------------
Function TExpresCalc.GetIndexedVar (Variavel : String) : String;
Begin
     //-- Retorna uma variável indexada ou Null caso não exista nehuma
     Result := Ftermo[Get_String_Index(Ftermo_calc, Variavel)];
End;

//-----------------------------------------------------------------------
//-- SetIndexedVarValue
//-----------------------------------------------------------------------
//-- Função Publicada
//-----------------------------------------------------------------------
//--
//-- Objetivo:
//--   Atualiza o valor da variável indexada, de maneira que a expressao
//--   possa ser calculada, e seta a variável como não indexada.
//--
//-- Função Publicada
//--   Parâmetros que requer
//--     String   - Nome da variável "Alias" recuperado pelo método
//--                "Variavel_Indexada".
//--     Extended - Valor a ser atribuído para a variável
//--
//--   Parâmetros que retorna
//--
//------------------------------------------------------------------------
Procedure TExpresCalc.SetIndexedVarValue (Variavel : String; Valor : Extended);
Begin

//-- Atualiza o valor da variável indexada na Lista de variáveis
     FVarCalcList.SetVarValue(Variavel,Valor);

//-- Atualiza a variável como variável não indexada
     Ftipo_termo[Get_String_Index(Ftermo_calc,Variavel)] := 'VARIAVEL';
     
End;

//--------------------------------------------------------------------
//-- Prepara_Expressao
//----------------------------------------------------------------------//
//-- Função Publicada                                                 --//
//--   Parâmetros que requer                                          --//
//--     Cadeia - String que deve conter a expressão a ser calculada  --//
//--                                                                  --//
//--   Parâmetros que retorna                                         --//
//--                                                                  --//
//-- Obs: A Propriedade Ferros conterá os erros caso                  --//
//--      a expressão seja inválida ou Null caso seja válida          --//
//----------------------------------------------------------------------//
Procedure TExpresCalc.Prepara_Expressao ( cadeia : String );
var WI          : Integer;
    W_Colchetes : Integer;
    WI_Termo    : Integer;
    W_VarTrab   : String;
Begin

    //-- Verifica se a propriedade FValListCalc foi setada
    If FVarCalcList = Nil Then
       Raise Exception.Create ('A propriedade FVaListCalc não foi setada - chamada não permitida');

    //-- Inicializa Indexadores e Variáveis
    WI_Termo    := 0;
    WI          := 1;
    W_Colchetes := 0;
    W_VarTrab   := '';

    //-- Inicializa Listas de Termos
    Ftermo.Clear;
    Ftermo_calc.Clear;
    Ftipo_termo.CLear;

    //-- Limpa Cadeia
    Cadeia := Limpa_Expressao(Cadeia);

    While WI  <= Length(Cadeia) Do
       Begin
         if Se_Caracter(Cadeia[WI]) Then
            Begin
              W_VarTrab := '';
              While (WI <= Length(Cadeia))
                AND ((Se_Caracter(Cadeia[WI])) OR
                     (Se_Numero(Cadeia[WI]))) Do
                 Begin
                   W_VarTrab := W_VarTrab + Cadeia[WI];
                   WI := WI + 1;
                 End;
              Add_Termo(W_VarTrab,W_VarTrab,'VARIAVEL');
              WI_Termo := WI_Termo + 1;
            End
         Else
           if Se_Delimitador(Cadeia[WI]) Then
              Begin
                If Cadeia[WI] = '[' Then
                   Begin
                     WI_Termo := WI_Termo - 1; //Volta para atualizar o termo anterior
                     W_Colchetes := W_Colchetes + 1;
                     While ( WI <= Length(Cadeia) )
                       AND ( W_Colchetes <> 0 ) DO
                       Begin
                         Ftermo[WI_Termo] := Ftermo[WI_termo] + Cadeia[WI];
                         WI := WI + 1;
                         if Cadeia[WI] = '[' Then
                            W_Colchetes := W_colchetes + 1;
                         if Cadeia[WI] = ']' Then
                            W_Colchetes := W_colchetes - 1;
                       End;
                     Ftermo[WI_Termo] := Ftermo[WI_termo] + Cadeia[WI];
                     Ftermo_calc[WI_Termo] := 'Var' + inttostr(WI_Termo);
                     Ftipo_termo[WI_Termo] := 'VARIAVEL_INDEXADA';
                     WI_Termo := WI_Termo + 1;
                   End
                Else
                   Begin
                     Add_Termo(Cadeia[WI],Cadeia[WI],'DELIMITADOR');
                     WI_Termo := WI_Termo + 1;
                   End;
                WI := WI + 1;
              End
           Else
             if Se_Numero(Cadeia[WI]) Then
                Begin
                  W_VarTrab := '';
                  While (WI <= Length(Cadeia))
                    AND (Se_Numero(Cadeia[WI])) Do
                    Begin
                      W_VarTrab := W_VarTrab + Cadeia[WI];
                      WI := WI + 1;
                    End;
                  Add_Termo(W_VarTrab,W_VarTrab,'NUMERO');
                  WI_Termo := WI_Termo + 1;
                End;
       End;

    Add_Termo('','','');

End;

{-- Adiciona um Fator Lista Token --}
Procedure TExpresCalc.Add_Termo(Fator : String; FatorCalc : String; Tipo : String);
begin
     Ftermo.Add(Fator);
     Ftermo_calc.Add(FatorCalc);
     Ftipo_termo.Add(Tipo);
end;


//--------------------------------------------------------------------
//-- Calcula_Expressao
//----------------------------------------------------------------------//
//-- Função Publicada                                                 --//
//--   Parâmetros que requer                                          --//
//--     Cadeia - String que deve conter a expressão a ser calculada  --//
//--                                                                  --//
//--   Parâmetros que retorna                                         --//
//--     Extended - Contendo o resultado do cálculo                   --//
//--              - Sempre conterá zero caso a expressão seja ibválida--//
//--                                                                  --//
//-- Obs: A Propriedade Ferros conterá os erros caso                  --//
//--      a expressão seja inválida ou Null caso seja válida          --//
//----------------------------------------------------------------------//
Function TExpresCalc.Calcula_Expressao : Extended;
Var WValor : Extended;
Begin
     WgInd := 0;
     WValor := 0;

     //-- Substitui as variáveis existentes pelos valores da Lista
     //-- de variáveis
     Substitui_Variavel;

     //-- Calcula Expressão
     While Ftermo_calc[WgInd] <> '' Do
       Begin
         WValor := Trata_Soma_Subtracao(WValor);
       End;
     Result := WValor;
End;

{-- Substitui as variáveis pelos seus respectivos valores --}
Procedure TExpresCalc.Substitui_Variavel;
Var WI : Integer;
Begin

     For WI := 0 to Ftipo_termo.Count-1 Do
         IF Ftipo_termo[WI] = 'VARIAVEL' Then
            Begin
              Ftermo_calc[WI] := FVarCalcList.Fvalor[Get_String_Index(FVarCalcList.Fvariavel, Ftermo_calc[WI])];
              Ftipo_termo[WI] := 'NUMERO';
            End;

End;

{-- Trata Soma ou Subtração --}
Function TExpresCalc.Trata_Soma_Subtracao (WValor : Extended) : Extended;
Var WValor2 : Extended;
    WOperador : String;
Begin
     WValor := Trata_Multiplicacao_Divisao(WValor);
     While (Ftermo_calc[WgInd] = '+') OR
           (Ftermo_calc[WgInd] = '-') Do
       Begin
         WOperador := Ftermo_calc[WgInd];
         WgInd := WgInd + 1;
         WValor2 := Trata_Multiplicacao_Divisao(WValor);
         WValor := Efetua_Operacao(WOperador, WValor, WValor2)
       End;
     Result := WValor;
End;
{-- Trata Multiplicação e Divisão --}
Function TExpresCalc.Trata_Multiplicacao_Divisao (Wvalor : Extended) : Extended;
Var WValor2 : Extended;
    WOperador : String;
Begin
     WValor := Trata_Exponenciacao(WValor);
     While (Ftermo_calc[WgInd] = '*') OR
           (Ftermo_calc[WgInd] = '/') OR
           (Ftermo_calc[WgInd] = '%') Do
       Begin
         WOperador := Ftermo_calc[WgInd];
         WgInd := WgInd + 1;
         WValor2 := Trata_Exponenciacao(WValor);
         WValor := Efetua_Operacao(WOperador, WValor, WValor2)
       End;
     Result := WValor;
End;

{-- Trata Exponenciação --}
Function TExpresCalc.Trata_Exponenciacao (Wvalor : Extended) : Extended;
Var WValor2 : Extended;
    WOperador : String;
Begin
     WValor := Trata_Unario(Wvalor);
     If Ftermo_calc[WgInd] = '^' Then
       Begin
         WOperador := Ftermo_calc[WgInd];
         WgInd := WgInd + 1;
         WValor2 := Trata_Unario(Wvalor);
         WValor := Efetua_Operacao(WOperador, WValor, WValor2)
       End;
     Result := WValor;
End;

{-- Trata Operador Unário --}
Function TExpresCalc.Trata_Unario (Wvalor : Extended) : Extended;
Var WOperador : String;
Begin
     WOperador := '';
     IF  (Ftipo_termo[WgInd] = 'DELIMITADOR')
     AND ((Ftermo_calc[WgInd] = '+')  OR
          (Ftermo_calc[WgInd] = '-')) Then
         Begin
           WOperador := Ftermo_calc[WgInd];
           WgInd := WgInd + 1;
         End;
     WValor := Trata_Parenteses(WValor);
     IF WOperador = '' Then
        WValor := Calcula_Unario(WOperador, WValor);
     Result := WValor;
End;

{-- Trata Parenteses --}
Function TExpresCalc.Trata_Parenteses (Wvalor : Extended) : Extended;
Begin
     IF  (Ftipo_termo[WgInd] = 'DELIMITADOR')
     AND (Ftermo_calc[WgInd] = '(') Then
         Begin
           WgInd := WgInd + 1;
           WValor := Trata_Soma_Subtracao(WValor);
           IF  (Ftipo_termo[WgInd] = 'DELIMITADOR')
           AND (Ftermo_calc[WgInd] = ')') Then
               WgInd := WgInd + 1
           Else
               Ferros := Ferros + 'Erro no tratamento da exponenciação' + #13;;
           Result := WValor;
         End
     Else
       Result := Trata_Valor_Primitivo;
End;

{-- Calcula Unario --}
Function TExpresCalc.Calcula_Unario (WOperador : String; Wvalor : Extended) : Extended;
Begin
     IF WOperador = '-' Then
        Result := -1 * Wvalor
     Else
        Result := WValor;
End;

{-- Retorna Valor Primitivo --}
Function TExpresCalc.Trata_Valor_Primitivo : Extended;
Begin
  IF Ftipo_termo[WgInd] = 'NUMERO' Then
     Begin
       Result := StrtoFloat(Ftermo_calc[WgInd]);
       WgInd := WgInd + 1;
     End
  Else
     Begin
       Ferros := Ferros + 'Erro Tratamento Ultimo Nivel' + #13;
       Result := 0;
     End;
End;

{-- Efetua Operação --}
Function TExpresCalc.Efetua_Operacao(Operador : String; Valor1 : Extended; Valor2 : Extended) : Extended;
Begin
     Case Operador[1] of
         '+' : Result := Valor1 + Valor2;
         '-' : Result := Valor1 - Valor2;
         '*' : Result := Valor1 * Valor2;
         '%' : Result := Valor1/100*Valor2;
         '/' : Begin
                 If Valor2 = 0 Then
                    Begin
                      Ferros := Ferros + 'Erro Fatal - Divisão por zero' + #13;
                      Result := 0;
                    End
                 Else
                   Result := Valor1 / Valor2;
               End;
         '^' : if abs(Valor1) = 0 then
                  Result := 0
               else
                  Result := Exp(Valor2*Ln(abs(Valor1)));
     Else
       Result := 0;
     End;
End;

end.
