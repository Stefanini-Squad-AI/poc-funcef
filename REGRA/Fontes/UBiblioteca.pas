//------------------------------------------------------------------------------
// Sistema   .: Sistema de Investimentos
// Objetivo  .: Biblioteca de Funcoes
//              Unit - UBiblioteca
// Data      .: 09/12/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------------------
unit UBiblioteca;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery, URegra, BDE, checklst;


// Funcoes Publicas
  Function OrdenaLista          (Lista:TStringList):TStringList;
  Function ExecutaQuery         (Qry:TwwQuery; Const Str:String) :Boolean;
  Function FazQuery             (Var Qry:TwwQuery; Str:String) :Boolean;
  Function GerarTabela          (Var QryQueryIn:TwwQuery; wTabela:String):String;
  Function TrocaPontoVirgula    (Value: String): String;
  Function TrocaVirgulaPonto    (Value: String): String;
  Function TiraPonto            (Value: String): String;
  Function Replicate            (Texto:String;NVezes:Integer):String;
  Function FormataTamanho       (Texto:String;Tamanho:Integer):String;
  Function Alinha               (Texto:String;Tamanho:Integer;Tipo,Preenchedor:String):String;
  Function GravaLogOperacao     (TextoOperacao : String): Boolean;

  Procedure CriaLista           (ChkList:TCheckListBox; Query : TwwQuery;
                                 Lista : TStringList;
                                 Chave, Descricao : String);

// Variaveis Publicas
Var
  wValIniCotasGlobal:Double;

implementation

Uses
  DBaseDados, USistema, UMensErro, UDataBase, uCtrlPadroes;

// Procedures Privadas

// Funcoes Privadas


//-- INICIO DAS FUNCOES --\\

//******************************************************************************
// Executa uma Query - ExecSQL
Function ExecutaQuery(Qry: TwwQuery; Const Str :String): Boolean;
begin
  Result := False;
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      ExecSQL;
    Except
// Mostra Erro
      On E: Exception Do Begin
        If MessageDlg('Erro na Execução da Query, '+Qry.Name+' :'+#13+
                    #13+Str+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13+#13+'Deseja Capturar a Query ?',MtError,[MbYes,MbNo],0) = MrYes Then Begin
          InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);
        End;

        Result := False;
        Exit;
      End;
    End;
  End;
  Result := True;
end;


//******************************************************************************
// Abre uma Query - Open
Function FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
Var
  wLinha  :String;
  wInicial,wFinal  :Integer;
Begin
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      Open;
    Except
// Mostra Erro
      On E:Exception Do Begin
// Monta Linha da Query
        wInicial:=1;
        wFinal  :=(Pos('FROM',Str)-1);
        If wFinal <= 0 Then wFinal:= Length(Str);
        wLinha:=Copy(Str,1,wFinal)+#13;
// From Ate Where
        wInicial:=(Pos('FROM',Str)-1);
        wFinal  :=(((Pos('WHERE',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Where Ate Order by
        wInicial:=(Pos('WHERE',Str)-1);
        wFinal  :=(((Pos('ORDER BY',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Order By Ate Group By
        wInicial:=(Pos('ORDER BY',Str)-1);
        wFinal  :=(((Pos('GROUP BY',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Group By Ate Final
        wInicial:=(Pos('GROUP BY',Str)-1);
        wFinal  :=Length(Str);
        If wInicial <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
        If MessageDlg('Erro na Abertura da Query, '+Qry.Name+' :'+#13+
                    #13+wLinha+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13+#13+'Deseja Capturar a Query ?',MtError,[MbYes,MbNo],0) = MrYes Then Begin
         InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);
        End;
        Result := False;
      End;
    End;
    Result := (EOF <> BOF);
  End;
End;

//******************************************************************************
// Extrai Dados da Tabela Genérica e Monta Tabela a ser Filtrada
Function GerarTabela(Var QryQueryIn:TwwQuery; wTabela:String):String;
Var
  wRefresh,wPos,wCont,wCol,wLin,wMaxLin,I : Integer;
  wValInt,wLinha,wSqlAdd : String;
  Grid           : TStringGrid;
  DbGrid         : TwwDBGrid;
  wLinhaSQL      : Array[0..800] Of String; {FOI O PEIXOTO - THE REGRAMAN}
  Panel2         :TPanel;
  Label7         :TLabel;
  PrgBar1        :TProgressBar;
  QrySQL,QryTabPart,QryAux:TwwQuery;
Begin
// Incrementa Variaveis
  Grid         := TStringGrid.Create(Application);
  QryTabPart   := TwwQuery.Create(Application);
  QrySQL       := TwwQuery.Create(Application);
  QryAux       := TwwQuery.Create(Application);
  QryTabPart.DataBaseName   :='BaseDados';
  QrySQL.DataBaseName       :='BaseDados';
  QryAux.DataBaseName       :='BaseDados';

// Inicio da Rotina para Filtrar e Criar a Tabela Selecionada
  With QryTabPart Do Begin
    Close;
    Sql.Clear;
// Monta e Abre a Qry que Busca Campos da Tabela
// Selecionada na Tabela de Participantes (dados cadastrais)
    Sql.Add('SELECT VT.NUMLINHA, VT.IDCAMPO, VT.VALOR, CT.DESCREDUZ ');
    Sql.Add('FROM VALTABPART VT, CAMPOTABPART CT ');
    Sql.Add('WHERE CT.IDTABELA = '''+wTabela+''' AND ');
    Sql.Add('VT.IDTABELA = CT.IDTABELA AND ');
    Sql.Add('VT.IDCAMPO  = CT.IDCAMPO ');
    Sql.Add('ORDER BY VT.NUMLINHA, VT.IDCAMPO ');
// Tenta Abrir a Query
    Try
      Prepare;
      Open;
    Except
      ShowMessage('Erro, Tabela não possui campos, Verifique !!!');
      Exit;
    End;

//-- Inicia o Grid --\\
// Cria Barra de Titulo
    Grid.RowCount :=3;
    Grid.ColCount :=0;
    Grid.FixedRows:=2;
    Grid.FixedCols:=0;

// Inicio da Rotina para Preencher o Grid com os dados da Query
    QryTabPart.First;               // Inicio da Query
    wLin:=2;
    wCol:=0;
// Cria Elementos Visuais
    Panel2  :=TPanel.Create(Application);
    Label7  :=TLabel.Create(Application);
// Marca Tamanho da ProgressBar e Visualisa
    Panel2.Visible:=True;
    Panel2.Update;
    Label7.Caption:='Aguarde, Gerando Tabela .....';
    Label7.Update;
// Monta os Titulos \\
// Guarda Linha Posicionada
    wLinha:=QryTabPart.FieldByName('NUMLINHA').AsString;
// Busca Campos da Tabela
    FazQuery(QryAux,'SELECT IDCAMPO,IDTIPODADO,DESCREDUZ FROM CAMPOTABPART WHERE IDTABELA = '+
    ''''+wTabela+''' ORDER BY idcampo');
    While (Not QryAux.Eof) Do Begin
// Muda Coluna (Inclui Coluna no Grid)
      Grid.ColCount:=Grid.ColCount +1;
// Inclui Nome do Campo na Barra de Titulo
      Grid.Cells[wCol,0]:=UpperCase(QryAux.FieldByName('DESCREDUZ').AsString);
// Inclui Tipo do Campo
      Grid.Cells[wCol,1]:=QryAux.FieldByName('IDTIPODADO').AsString;
      QryAux.Next;
      Inc(wCol);
    End;
// Acerta Refresh Rate
    wRefresh:=Trunc(QryTabPart.RecordCount/wCol/800)+1;
// Volta ao Inicio da Query
    QryTabPart.First;
    wCol := 0;
    wPos := 0;
    wCont:= 0;
    I    := 0;
//-- Inicia Montagem da Tabela (Query) --\\

// Enquanto não Final da Query Monta String ..
    wLinhaSQL[0]:='SELECT ';
    While Not Eof Do Begin
      wLinha:=QryTabPart.FieldByName('NUMLINHA').AsString;
// Loop na Coluna
      wLinhaSQL[I]:=wLinhaSQL[I];
// Enquanto Linha Igual ...
      While (QryTabPart.FieldByName('NUMLINHA').AsString=wLinha) And
            (Not QryTabPart.Eof) Do Begin
// Testa o Tipo de Campo (N-A-D)
        If Grid.Cols[wCol].Strings[0] =
           UpperCase(QryTabPart.FieldByName('DESCREDUZ').AsString) Then
          Begin
// Tipo Numerico
          If Grid.Cells[wCol,1] = '1' Then Begin
            If QryTabPart.FieldByName('VALOR').AsString = '' Then
              wValInt:='0'
            Else
              wValInt:=QryTabPart.FieldByName('VALOR').AsString;
            wLinhaSQL[I]:=wLinhaSQL[I] +QryTabPart.FieldByName('VALOR').AsString
              +' AS '+
              UpperCase(QryTabPart.FieldByName('DESCREDUZ').AsString)+', '; End
// Tipo Alfa
          Else If Grid.Cells[wCol,1] = '2' Then Begin
            wLinhaSQL[I]:=wLinhaSQL[I]+''''+QryTabPart.FieldByName('VALOR').AsString
              +''' AS '+
              UpperCase(QryTabPart.FieldByName('DESCREDUZ').AsString)+', '; End
// Tipo Data
          Else If Grid.Cells[wCol,1] = '3' Then Begin
            wLinhaSQL[I]:=wLinhaSQL[I]+
              'TO_DATE('''+QryTabPart.FieldByName('VALOR').AsString
              +''','''+'dd/mm/yyyy'''+') AS '+
              UpperCase(QryTabPart.FieldByName('DESCREDUZ').AsString)+', ';
          End;
// Pula Registro
         QryTabPart.Next;
// Caso Linha Diferente Mas Ainda Contem Colunas
         If(QryTabPart.FieldByName('NUMLINHA').AsString<>wLinha) And
             ((Grid.ColCount-1) > wCol+1)  Or
             (Eof) Then Begin
// Enquanto Faltam Colunas
            For wCol:=wCol+1 To (Grid.ColCount-1) Do Begin
// Caso Tipo de Campo Num, String ou Data
              If Grid.Cells[wCol,1] = '1'  Then Begin
                wLinhaSQL[I]:=wLinhaSQL[I]+'0 AS '+
                Grid.Cols[wCol].Strings[0]+', ' End
              Else If Grid.Cells[wCol,1] = '2' Then Begin
                wLinhaSQL[I]:=wLinhaSQL[I]+''''+' '''+' AS '+
                Grid.Cols[wCol].Strings[0]+', ' End
              Else If Grid.Cells[wCol,1] = '3' Then Begin
                wLinhaSQL[I]:=wLinhaSQL[I]+
               'TO_DATE('''+''','''+'dd/mm/yyyy'''+') AS '+
               Grid.Cols[wCol].Strings[0]+', '
              End;

            End;
         End;
// Campo sem Valor
        End Else Begin
// Caso Tipo de Campo Num, String ou Data
          If Grid.Cells[wCol,1] = '1'  Then Begin
            wLinhaSQL[I]:=wLinhaSQL[I]+'0 AS '+
            Grid.Cols[wCol].Strings[0]+', ' End
          Else If Grid.Cells[wCol,1] = '2' Then Begin
            wLinhaSQL[I]:=wLinhaSQL[I]+''''+' '''+' AS '+
            Grid.Cols[wCol].Strings[0]+', ' End
          Else If Grid.Cells[wCol,1] = '3' Then Begin
            wLinhaSQL[I]:=wLinhaSQL[I]+
            'TO_DATE('''+''','''+'dd/mm/yyyy'''+') AS '+
            Grid.Cols[wCol].Strings[0]+', '
          End;
        End;
        Inc(wCol);
        Inc(wPos);
      End;
      wLinhaSQL[I]:=Copy(wLinhaSQL[I],0,Length(wLinhaSQL[I])-2)+' FROM DUAL UNION SELECT ';
      wLinha:=QryTabPart.FieldByName('NUMLINHA').AsString;
      wCol:=0;

      Inc(wCont);
      If wCont >= wRefresh Then Begin
        Inc(I);
        wCont:=0;
      End;
    End;
  End;
// Volta Contador e Retira Ultimas Colunas (UNION SELECT)
  If wLinhaSQL[I] = '' Then I:= I-1;
  wLinhaSQL[I]:=Copy(wLinhaSQL[I],0,Length(wLinhaSQL[I])-13);
// Remonta a Linha
  For I := 0 to 800 Do Begin
    wSqlAdd := wSqlAdd+wLinhaSQL[I];
    If wLinhaSQL[I] = '' Then Break;
  End;
// Monta a Query e Abre \\
  QryQueryIn.Filter:='';
  QryQueryIn.Close;
  QryQueryIn.SQL.Clear;
  QryQueryIn.SQL.Add(wSqlAdd);
// Tenta Abrir a Query
  Label7.Caption:='Aguarde, Preparando Resultado .....';
  Label7.Update;
  Try
    QryQueryIn.Open;
  Except
    ShowMessage('Erro, Tabela não Gerada, Verifique !!!');
// Esconde ProgressBar
    Panel2.Visible:=False;
  End;
// Libera Objetos Criados
  Grid.Free;
  QryTabPart.Free;
  QrySQL.Free;
  QryAux.Free;
End;

//******************************************************************************
// Troca  Ponto por Virgulas
Function TrocaPontoVirgula(Value: String): String;
var
  i : Integer;
  iPosVirg : Integer;
begin
  iPosVirg := pos('.',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+','+copy(Value,iPosVirg+1,length(Value));
  Result:=Value;
end;

//******************************************************************************
// Troca Virgulas por Ponto
Function TrocaVirgulaPonto(Value: String): String;
var
  i : Integer;
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+'.'+copy(Value,iPosVirg+1,length(Value));
  Result:=Value;
end;

//******************************************************************************
// Tira Pontos da String
Function TiraPonto(Value: String): String;
var
  I          : Integer;
  wSemPontos : String ;
begin
  wSemPontos := '';
  For I :=1 to Length(Value) Do Begin
    If Value[I] <> '.' Then Begin
      wSemPontos := wSemPontos + Value[I];
    End;
  End;
  Result:=wSemPontos;
end;

//******************************************************************************
// Repete Um Texto "n" Neves
Function Replicate(Texto:String;NVezes:Integer):String;
Var
  I:Integer;
Begin
// Critica Dados Enviados
  If (Texto = '') Or (NVezes <=0) Then Begin
    Result:=''; // Resultado
    Exit;
  End;
  Result:='';
// Repete a String N Vezes
  For I:= 1 To nVezes Do Begin
    Result:=Result + Texto
  End;
End;

//******************************************************************************
// Formata Tamanho da String
Function FormataTamanho(Texto:String;Tamanho:Integer):String;
Var
  Complemento:Integer;
Begin
// Calcula quanto Falta para o Tamanho Desejado
  Complemento := (Tamanho-Length(Texto));
// Caso não falte nada zera complemento
  If Complemento < 0 Then Complemento := 0;
// Gera String Resultado
  Result:=Texto+Replicate(' ',Complemento);
End;

//******************************************************************************
// Alinha - Alinhar Texto
Function Alinha(Texto:String;Tamanho:Integer;Tipo,Preenchedor:String):String;
Var
  wEspaco:String;
Begin
  Result:='';
// Testar Parametros
  If Texto = ''  Then Exit;
  If Tamanho = 0 Then Exit;
// Caso tipo Invalido
  If (Tipo <> 'D') And (Tipo <> 'E') And (Tipo <> 'C') Then Exit;

// Testar Tamanho
  If Length(Texto) > Tamanho Then Begin
    ShowMessage('Erro, Alinha -> Texto Maior que Espaço ..');
    Exit;
  End;
// Criar Espaco do Tamanho
  wEspaco:=Replicate(Preenchedor,Tamanho-Length(Texto));
// Caso Tipo = Centralizado Divide Tamanho
  If Tipo = 'C' Then wEspaco:=Replicate(Preenchedor,Trunc((Tamanho-Length(Texto))/2));

// Monta Saida
  If Tipo = 'D' Then                // Direita
    Result:=wEspaco+Texto
  Else If Tipo = 'E' Then           // Esquerda
    Result:=Texto+wEspaco
  Else If Tipo = 'C' Then           // Centralizado
    Result:=wEspaco+Texto+wEspaco;
End;

//******************************************************************************
// Ordena uma Lista
Function OrdenaLista(Lista:TStringList):TStringList;
Var
 I,Z:Integer;
 GuardaItem:String;
Begin
// Inicia Ordenacao
  For I:= 0 To (Lista.Count-1) Do Begin
    For Z := 0 To ((Lista.Count-(I+1))-1) Do Begin
// Caso o Proximo Item maior que o atual
      If Lista.Strings[Z] > Lista.Strings[Z+1] Then Begin
// Guarda o Item
        GuardaItem         := Lista.Strings[Z];
// Puxa o Proximo
        Lista.Strings[Z]   := Lista.Strings[Z+1];
// Adianta o Atual
        Lista.Strings[Z+1] := GuardaItem;
      End;
    End;
  End;
// Gera Resultado
  Result :=Lista;
End;

{------------------------------------------------------------------------------}
{ Retorna uma lista                                                            }
Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                    Lista: TStringList; Chave, Descricao:String);
begin
  Lista.Clear;
  ChkList.Clear;
  While Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  End;
end;

{------------------------------------------------------------------------------}
{ Grava o log de uma operação feita no Sistema                                 }
Function GravaLogOperacao (TextoOperacao : String): Boolean;
Begin
  { Grava Log da operação - 19/12/2002 }
  Result := Padroes.GravaLogOperacoes(Sistema.idEmpresa,Sistema.idModulo,
                                      Sistema.idUsuario,
                                      TextoOperacao,False);
End;

End.