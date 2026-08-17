//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Biblioteca de Funcoes
//              Unit - UBiblioteca
// Data      .: 01/10/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit UBibliotecaAtuarial;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery;

// Procedures Publicas

// Funcoes Publicas
  Function  ExecutaQuery       (Qry:TQuery; Const Str:String) :Boolean;
  Function  FazQuery           (Var Qry:TwwQuery; Str:String) :Boolean;
  Function  GerarTabela        (Var QryQueryIn:TwwQuery; wTabela:String):String;
  Function  TrocaPontoVirgula  (Value: String): String;

implementation
// Procedures Privadas

// Funcoes Privadas


//-- INICIO DAS FUNCOES --\\
//------------------------------------------------------------------
// Executa uma Query - ExecSQL
Function ExecutaQuery(Qry: TQuery; Const Str :String): Boolean;
begin
  Result := False;
  With Qry Do Begin
    Close;
    SQL.Clear;
    SQL.Add(str);
    ExecSQL;
  End; {with}
  Result := True;
end; {ExecutarQuery}

//------------------------------------------------------------------
// Abre uma Query - Open
Function FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
Begin
  With qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(str);
      Open;
    Except
      Result := False;
      Raise;
    End;
    Result := (EOF <> BOF);
  End;
End;

//-----------------------------------------------------------------
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
//-- Fim da Montagem da Query  --\\
End;

//------------------------------------------------------
// Troca Virgulas por Ponto
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

end.


//-- FIM DA LISTAGEM --\\
