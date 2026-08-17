//******************************************************************************
// Data      : 19/09/2006
// Código    : AL_13
// Pendencia : 26389
// SOL       :
// Desc      : Implementacao de Depuracao do Regra Passo a Passo
//******************************************************************************
// Data     : 26/12/2006
// Código   : AL_12
// Pendencia: 24046
// SOL      :
// Desc     : Acerto no Tratamento de cálculo de despesas
//******************************************************************************
// Data     : 05/12/2006
// Código   : AL_11
// Pendencia: 23674
// SOL      : 47946
// Desc     : Segregação de Recursos
//******************************************************************************
// Data     : 05/12/2006
// Código   : AL_10
// Pendencia: 22984
// SOL      :
// Desc     : Segregação de Planos - tela de Transferência de Custódia
//******************************************************************************
// Data     : 03/10/2006
// Código   : AL_9
// Pendencia: 22965
// SOL      :
// Desc     : Segregação de Planos
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_8
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_7
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_6
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
// Data     : 21/02/2006
// Código   : AL_5
// Motivo   : Acerto no cálculo das despesas de Boletas que não estava filtrando a Boleta
//********************************************************************************************************
// Data     : 31/01/2003
// Código   : AL_4
// Motivo   : Implementação da procedure InsereElemento
//               - Insere um elemento numa string, com seu separador, caso não seja o primeiro elemento
//********************************************************************************************************
// Data     : 31/01/2005
// Código   : AL_3
// Motivo   : Retirada a alteração da data de fechto do renda variavel, devido ao reprocessamento do mesmo
//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Sistema   .: Sistema de Investimentos
// Objetivo  .: Biblioteca de Funcoes
//              Unit - UBibliotecaInvest
// Data      .: 09/12/1998
//------------------------------------------------------------------------------
// Alterações :
//  21/03/2000  - Inclusão da Rotina de Execução de Operacao Renda Variavel .
//  21/03/2000  - Inclusão da Rotina de Execução de Operacao Renda Fixa.
//------------------------------------------------------------------------------
unit UBibliotecaInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery, URegra, BDE,UOperacaoInvest, uCtrlRendaVariavel, uCtrlPadroes;

//AL_10 - Nova Classe de Tratamento de Erros de Cadastro
type
   EValidacao = class(Exception)
   private
      wcCtrl : TWinControl;
      bShow  : boolean;
   public
      constructor Create(const msg : string; ctr : TWinControl);
      property Control : TWinControl read wcCtrl;
      property Show : boolean read bShow;
   end;

type
   TRecBuscaTipoOperVarRV = Record
                         TIPOOPERACAO  : Integer;
                         IDPLANOPREV   : Integer;
                         IDPATRO       : Integer;
                         EXERCICIO     : Integer;
                         DATAINI       : String;
                         DATAFIM       : String;
                         IDPESSOA      : Integer;
                         CONTAINIPOS   : String;
                         CONTAFIMPOS   : String;
                         CONTAININEG   : String;
                         CONTAFIMNEG   : String;
                         VLROPERACAO   : Double;
                         VLRSALDO      : Double;
                         TIPOOPERSALDO : Integer;
                         RESULT        : Integer;
                       end;

// Procedures Publicas
  Procedure fDbiSetDateFormat;
  Procedure MarcaFlgHistCustodia (IdCustodia, IdLancamento,IdOperCustodia:Integer);
  //AL_13
  Procedure CalcDespesasDoc(DataProc : TDateTime;
                            NumDoc : String;
                            wIdLote : String;
                            sPercDevCorret : String = '';
                            bPassoPasso : Boolean = False);

  Procedure EnquadraInvestimento(Datareferencia:TDate;TabelaClassificacao, TiposInvest:String;
                                 LimpaArquivo, TotalizaSintetico:Boolean);
  Procedure AchaClassInvestimento(wIdCarteira, wIdInvestimento:Integer; TabelaClassificacao:string;
                                 DataReferencia:TDate; var Classificacao: string);
  // AL_4
  procedure InsereElemento( var Str : string; const Delimitador, Elemento : string );

// Funcoes Publicas
  Function OrdenaLista          (Lista:TStringList):TStringList;
  Function ExecutaQuery         (Qry:TQuery; Const Str:String) :Boolean;
  Function FazQuery             (Var Qry:TwwQuery; Str:String) :Boolean;
  Function GerarTabela          (Var QryQueryIn:TwwQuery; wTabela:String):String;
  Function TrocaPontoVirgula    (Value: String): String;
  Function TrocaVirgulaPonto    (Value: String): String;
  Function TiraPonto            (Value: String): String;
  function StrTran              (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
  Function TrocaLetra           (LetraAntiga, NovaString, Frase:String):String;
  function TrocaString          (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
  Function Replicate            (Texto:String;NVezes:Integer):String;
  Function FormataTamanho       (Texto:String;Tamanho:Integer):String;
  Function TestaValor           (ValDiferenca:Double):Boolean;
  Function Alinha               (Texto:String;Tamanho:Integer;Tipo,Preenchedor:String):String;
  Function BuscaSaldoCaixa      (StrDataRef:String):Double;
  Function MudaMes              (dDataIni: TDateTime; iMeses: smallint): TDateTime;

  Function FlgHistCartInv (IdHistCartInv: integer; Ope: string): boolean;
  Function VerificaFechamentoOperacao(StrDataOperacao:String):Boolean;
  Function TransfereAcoes(IdOperacao, IdCarteiraOrigem, IdCarteiraDestino,
                          IdInvestimento:Integer;
                          IdLoteOrigem, IdLoteDestino:String;
                          DataOperacao:TDate;
                          QtdOperacao, ValorOperacao:Double):Boolean;

  Function CapitalizaMoeda(IdMoeda:Integer; Indice:Double; DataInicial, DataFinal:TDate;
                           PulaFeriados,MostraMensagem, GravaResultado:Boolean):Double;

  Function ExecutaOperAcao(IdTipoOperacao, IdBolsaValores, IdCorretValores,
                           IdInvestimento, IdCarteira,     IdCartOriDest :Integer;
                           IdLote :String;
                           QtdOperacao, ValorOperacao :Double;
                           DataProc:TDateTime):Boolean;

  Function ExecutaOperRenFix(IdTipoOperacao, IdInvestimento, IdCorretValores,
                             IdCarteira, IdCartOriDest :Integer;
                             IdLote :String;
                             QtdOperacao, ValorOperacao :Double;
                             DataProc:TDateTime):Boolean;

  Function BuscaCampos(Var wCampoResult,LinhaString, wTabela: String):String;
  Function PesqLongTab(Linha:String):String;
  function Replace(sTexto, sTextoSai, sTextoEntra: String): String;
  function Vazio(sTexto: String): Boolean;
  function FormataValor(fValor: Double): Double;
  function ExisteForm(Form : TForm): Boolean;

const
 crTransf = 5;
// Variaveis Publicas
Var
  wValIniCotasGlobal:Double;
  iPatrocinadora,iPlanoPrevContab,iPlanPrevCtbPatro : integer;
  iTipoInvestUsu : Integer;
  sPlanPrevCtbPatro, sFlgCartGerenc : string;
  pRPI : PTRecParamInvest;
  RecBuscaTipoOperVarRV : TRecBuscaTipoOperVarRV;
  iIdHistCartInv,iIdHistCartInvTRC : Integer;
  //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
  QueryCCBaixa  : TwwQuery;
  DsCCBaixa     : TwwDataSource;
  UpdCCBaixa    : TUpdateSQL;

implementation

Uses
  DOperacaoInvest, DBaseDados, UDiasUteis, UOperComum, dOperComum, USistema, UMensErro,
  UDataBase, FAguarde,FPrincipal;

//AL_10 - Nova Classe de tratamento de erros
{ EValidacao }

Constructor EValidacao.Create(const msg: string; ctr: TWinControl);
begin
   inherited Create(msg);
   wcCtrl := ctr;
   bShow  := msg <> '';
end;

{ BibliotucaInvest }

// Procedures Privadas

// Funcoes Privadas


//-- INICIO DAS FUNCOES --\\
//------------------------------------------------------------------
// Executa uma Query - ExecSQL
Function ExecutaQuery(Qry: TQuery; Const Str :String): Boolean;
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


//------------------------------------------------------------------
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

//-----------------------------------------------------------------
// Extrai Dados da Tabela Genérica e Monta Tabela a ser Filtrada
Function GerarTabela(Var QryQueryIn:TwwQuery; wTabela:String):String;
Var
  wRefresh,wPos,wCont,wCol,wLin,wMaxLin,I : Integer;
  wValInt,wLinha,wSqlAdd : String;
  Grid           : TStringGrid;
  DbGrid         : TwwDBGrid;
  wLinhaSQL      : Array[0..800] Of String;
  Panel2         :TPanel;
  Label7         :TLabel;
  PrgBar1        :TProgressBar;
  QrySQL,QryTabPart,QryAux:TwwQuery;
Begin
// Incrementa Variaveis
  wCol         := 0;
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
         If (QryTabPart.FieldByName('NUMLINHA').AsString<>wLinha) And
           ((Grid.ColCount-1) > wCol+1) Or (Eof) Then Begin
            // Enquanto Faltam Colunas
            wCol     := 1;
            For wCol := wCol+1 To (Grid.ColCount-1) Do
            Begin
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
//-- Fim da Montagem da Query  --\\
End;

//------------------------------------------------------
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

//------------------------------------------------------
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

//------------------------------------------------------
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

function StrTran(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
var iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do
   begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Exit;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;

function TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
var iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do
   begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Exit;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;

//------------------------------------------------------
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

//-----------------------------------------------------------
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

Function TestaValor(ValDiferenca:Double):Boolean;
Var
  QryLocal:TwwQuery;
Begin
  Result := True;
  QryLocal := TwwQuery.Create(Application);
  QryLocal.DatabaseName:='BaseDados';
  FazQuery(QryLocal,'SELECT VLRDIVERG FROM PARAMINVEST');
  If (Abs(ValDiferenca) >  QryLocal.FieldByName('VLRDIVERG').AsFloat) Then Begin
     Result := False;
  End;
  QryLocal.Free;
End;


//---------------------------------------------------------------------------
// Exclui Lancamento na Custodia, e Marca proximos Registros do Investimento,
// Carteira e Custodiante com Flags ....
// PARAMETRO    IdLancamento : Identificacao do Lancamento
// PARAMETRO    IdCustodia   : Identificacao do Registro
Procedure MarcaFlgHistCustodia (IdCustodia, IdLancamento,IdOperCustodia:Integer);
Var
  QryLocalAux1, QryLocalAux2, QryLocalAux3:TwwQuery;
  sCarteira, sInvestimento, sCustodia, sCustodiante, sPlanPrev, sLote, sDataMov: String;
Begin
   //AL_9 - Ini
   try
      // Cria/Inicia Objetos e Variaveis Locais
      QryLocalAux1:= TwwQuery.Create(Application);
      QryLocalAux1.DatabaseName:='BaseDados';
      QryLocalAux2:= TwwQuery.Create(Application);
      QryLocalAux2.DatabaseName:='BaseDados';
      QryLocalAux3:= TwwQuery.Create(Application);
      QryLocalAux3.DatabaseName:='BaseDados';

      // Busca Registro a Excluir
      if IdOperCustodia <> -1 then
         FazQuery(QryLocalAux1,
           'SELECT IDCUSTODIA, FLGCALCSALDO, IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, IDCUSTODIANTE, DATAMOVCUSTOD '+
           ' FROM HISTCUSTODIA WHERE IDOPERCUSTODIA = '+IntToStr(IdOperCustodia))
      else if IdLancamento <> -1 then
         FazQuery(QryLocalAux1,
           'SELECT IDCUSTODIA, FLGCALCSALDO, IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, IDCUSTODIANTE, DATAMOVCUSTOD '+
           ' FROM HISTCUSTODIA WHERE IDOPERACAOINVEST = '+IntToStr(IdLancamento))
      else
         FazQuery(QryLocalAux1,
           'SELECT IDCUSTODIA, FLGCALCSALDO, IDPLANPREVCTBPATR, IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE, IDCUSTODIANTE, DATAMOVCUSTOD '+
           ' FROM HISTCUSTODIA WHERE IDCUSTODIA = '+IntToStr(IdCustodia));

      While Not QryLocalAux1.EOF Do
      Begin
         // Guarda Variaveis
         sPlanPrev    :=QryLocalAux1.FieldByname('IDPLANPREVCTBPATR').AsString;
         sCarteira    :=QryLocalAux1.FieldByname('IDCARTEIRAINVEST').AsString;
         sInvestimento:=QryLocalAux1.FieldByname('IDINVESTIMENTO').AsString;
         sLote        :=QryLocalAux1.FieldByname('IDLOTE').AsString;
         sCustodiante :=QryLocalAux1.FieldByname('IDCUSTODIANTE').AsString;
         sCustodia    :=QryLocalAux1.FieldByname('IDCUSTODIA').AsString;
         sDataMov       :=QryLocalAux1.FieldByname('DATAMOVCUSTOD').AsString;

         // Busca Proximo Lancamento da Mesma Carteira/Investimento/Lote/Custodiante/PlanPrev
         If FazQuery(QryLocalAux2,
                     'SELECT  IDCUSTODIA FROM HISTCUSTODIA  ' + #13 +
                     'WHERE (IDCARTEIRAINVEST = ' + sCarteira + ') AND ' + #13 +
                     '      (IDPLANPREVCTBPATR   = ' + sPlanPrev + ') AND ' + #13 +
                     '      (IDINVESTIMENTO   = ' + sInvestimento + ') AND ' + #13 +
                     '      (((' + QuotedStr(sLote) + ' IS NOT NULL) AND (IDLOTE ='+QuotedStr(sLote)+')) OR (('+QuotedStr(sLote)+' IS NULL) AND (IDLOTE IS NULL))) AND '+ #13 +
                     '      (IDCUSTODIANTE = ' + sCustodiante + ') AND ' + #13 +
                     '      ((DATAMOVCUSTOD   > TO_DATE('+QuotedStr(sDataMov)+ ',' + QuotedStr('DD/MM/YYYY') + ')) OR  '+ #13 +
                     '        ((DATAMOVCUSTOD = TO_DATE('+QuotedStr(sDataMov)+ ',' +QuotedStr('DD/MM/YYYY') + ')) AND '+ #13 +
                     '         (IDCUSTODIA  > ' + sCustodia + ')) )    '+
                     'ORDER BY DATAMOVCUSTOD, IDCUSTODIA ') Then Begin

           QryLocalAux3.SQL.Clear;
           QryLocalAux3.SQL.Add('UPDATE HISTCUSTODIA SET FLGCALCSALDO = ''1'' WHERE IDCUSTODIA = '+
                                 QryLocalAux2.FieldByname('IDCUSTODIA').AsString);
           Try
             QryLocalAux3.ExecSQL;
           Except
             Raise;
           End;
         End;
         QryLocalAux1.Next;
      End;
   finally
      // Libera Objetos Locais
      FreeAndNil(QryLocalAux1);
      FreeAndNil(QryLocalAux2);
      FreeAndNil(QryLocalAux3);
   end;
   //AL_9 - Fim
End;

//-----------------------------------------------
// Calcula as Despesas do Documento
//AL_13
Procedure CalcDespesasDoc(DataProc : TDateTime;
                          NumDoc : String;
                          wIdLote : String;
                          sPercDevCorret : String = '';
                          bPassoPasso : Boolean = False);
Var
  QryLocal, QryLocalAux, QryRegra :TwwQuery;
  wSaldoAntVlr, wSaldoAntQtd, wVlrTotCorretor, wVlrTotBolsa, wVlrResultRegra,
  wSaldoInutil :Double;
  wCredorDespesa, wStrDataResultRegra : String;
  wDecimal, wOldDecimalSeparator:Char;
  RegraLocal: TRegra ;
  //AL_9
  CtrlRendaVariavel: TCtrlRendaVariavel;
Begin
  try
     // Cria Objetos Locais
     QryLocal                 := TwwQuery.Create(Application);
     QryLocal.DatabaseName    := 'BaseDados';
     QryLocalAux              := TwwQuery.Create(Application);
     QryLocalAux.DatabaseName := 'BaseDados';
     QryRegra                 := TwwQuery.Create(Application);
     QryRegra.DatabaseName    := 'BaseDados';
     RegraLocal               := TRegra.Create(Application);
     RegraLocal.DatabaseName  := 'BaseDados';
     CtrlRendaVariavel := TCtrlRendaVariavel.Create;
     CtrlRendaVariavel.InitializeAs(Padroes);

     // Busca Dados das Despesas, das Operacaoes e o Corretor
     // AL_9
     FazQuery(QryLocal,
              'SELECT  DO.IDDESPOPERINVEST, DO.IDFORCLI, DO.IDOPERACAOINVEST, DO.IDTIPOINVEST, OI.IDINVESTIMENTO, '+ #13 +
              '        DO.IDTIPOOPERACAO, DO.VLRDESPOPER, DO.IDTIPODESPINVEST, DO.DATAVENCDESPOPER,    '+ #13 +
              '        DO.IDREGRACALCUSADA, DO.IDREGRAVENCUSADA, DO.FLGCALCDIARIO, OI.IDCORRETVALORES, '+ #13 +
              '        OA.IDACAO, OI.VLROPERACAO, OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, OI.DATAOPERACAO, '+ #13 +
              '        TD.DESCTIPODESPINV, OI.IDPLANPREVCTBPATR '+ #13 +
              'FROM DESPOPERINVEST DO, OPRACAO OA, OPERACAOINVEST OI, TIPODESPINVEST TD, OPRRENFIX OP '+ #13 +
              'WHERE (OI.NUMDOCUMENTO     = '''+ NumDoc +''') AND '+ #13 +
              '      (OI.DATAOPERACAO     = TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY'')) AND '+ #13 +
              '      (DO.IDOPERACAOINVEST = OA.IDOPERACAOINVEST(+)) AND '+ #13 +
              '      (DO.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+)) AND '+ #13 +
              '      (DO.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)    AND '+ #13 +
              '      (DO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)');

     FrmAguarde.Pos:=0;
     FrmAguarde.Max:=QryLocal.RecordCount;
     FrmAguarde.Mostra(' Aguarde, processando') ;
     // Inicia o Progressbar
     // Enquanto existem Registro na Tabela
     While Not QryLocal.Eof Do
     Begin
         // Calcula o Valor Total das Negociacoes na Bolsa do Rio
        wVlrTotBolsa:=0;
        FazQuery(QryLocalAux,
           ' SELECT  SUM(OI.VLROPERACAO)     '+
           ' FROM OPERACAOINVEST OI, OPRACAO OA, BOLSAVALORES BV          '+
           ' WHERE 	(OI.IDCORRETVALORES  = '''+
             QryLocal.FieldByName('IDCORRETVALORES').AsString+''')   AND  '+
           '       	(OI.DATAOPERACAO     = TO_DATE('''+DateToStr(
             QryLocal.FieldByName('DATAOPERACAO').AsDateTime)+''',''DD/MM/YYYY'')) AND '+
           '             (BV.SGLBOLSAVALORES  = ''BVRJ'')            AND'+
           '             (OI.IDCARTEIRAGERENC IS NULL)               AND'+
           '       	(OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST) AND'+
           '       	(OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)       ');
        // Guarda Valor Total negociado na Bolsa (RJ)
        wVlrTotBolsa:=(QryLocalAux.FieldByName('SUM(OI.VLROPERACAO)').AsFloat);
        // Calcula o Valor Total das Operacoes do Corretor desta Despesa
        FazQuery(QryLocalAux,
           ' SELECT  SUM(VLROPERACAO)     '+
           ' FROM DESPOPERINVEST DO, OPERACAOINVEST OI      '+
           ' WHERE 	(OI.IDCORRETVALORES  = '''+
                             QryLocal.FieldByName('IDCORRETVALORES').AsString+''') AND  '+
           '             (DO.IDTIPODESPINVEST = '''+
                             QryLocal.FieldByName('IDTIPODESPINVEST').AsString+''') AND '+
           '             (OI.DATAOPERACAO     = TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY'')) AND '+
           //AL_5
           '             (OI.NUMDOCUMENTO     = '''+ NumDoc +''') AND '+
           '             (OI.IDCARTEIRAGERENC IS NULL)               AND'+
           '       	(DO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) ');
        // Guarda Valor Total do Corretor
        wVlrTotCorretor:=QryLocalAux.FieldByName('SUM(VLROPERACAO)').AsFloat;

        // Anamaria
        // Busca Dado dos Saldos do Investimento
        wSaldoAntVlr :=0;
        wSaldoAntQtd :=0;
        //------------------------------------------------------------------------------
        // Busca Primeiro Lancamento no Historico da Carteira desta Operacao
        FazQuery(QryLocalAux,
                 'SELECT IDHISTCARTINV '+
                 'FROM HISTCARTINV '+
                 'WHERE  (IDOPERACAOINVEST = '+QryLocal.FieldByName('IDOPERACAOINVEST').AsString+')  '+
                 'ORDER BY IDHISTCARTINV');
        //------------------------------------------------------------------------------
        // Busca Lancamento no Historico da Carteira Antes da Operacao.
        // AL_9 - BuscaSaldos em 3 camadas
        CtrlRendaVariavel.BuscaSaldoRV.Executa(QryLocal.FieldByName('DATAOPERACAO').AsDateTime,
                                               QryLocal.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                                               QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryLocal.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               QryLocalAux.FieldByName('IDHISTCARTINV').AsInteger,
                                               -1, wIdLote);

        wSaldoAntQtd := CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal;
        wSaldoAntVlr := CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal;
        //AL_9 - Fim

        //-------------------------------------------------------------------------------------
        // Monta a Query da Regra ** Obs.: No Final do Codigo esta a Query Descritia dos Campos
        wDecimal := DecimalSeparator;
        DecimalSeparator:='.';

        if sPercDevCorret = '' then
           sPercDevCorret := '0';

        FazQuery(QryRegra,
                 'SELECT  DO.*, OI.*, OA.*, OP.*, BV.SGLBOLSAVALORES, '+
                   FloatToStr(wVlrTotCorretor) +' AS VALTOTCORRET, '+
                   FloatToStr(wVlrTotBolsa)+'  AS VALTOTBOLSA,  '+
                   FloatToStr(wSaldoAntVlr)+'  AS SLDANTVLRINV, '+
                   sPercDevCorret+'  AS PERCDEVCOR, '+
                   FloatToStr(wSaldoAntQtd)+'  AS SLDANTQTDINV, CI.FLGCARTPROP  '+
                 'FROM DESPOPERINVEST DO, OPRACAO OA, OPERACAOINVEST OI, OPRRENFIX OP, BOLSAVALORES BV, CARTEIRAINVEST CI '+
                 'WHERE (DO.IDDESPOPERINVEST = '''+
                   QryLocal.FieldByName('IDDESPOPERINVEST').AsString+''') AND '+
                 '      (DO.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)       AND '+
                 '      (DO.IDOPERACAOINVEST = OA.IDOPERACAOINVEST(+))    AND '+
                 '      (DO.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+))    AND '+
                 '      (OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)       AND '+
                 '      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)');

        DecimalSeparator:=wDecimal;

        // Calcula Valor da Despesa
        wVlrResultRegra:=0;
        // Caso Exista Regra Associada Executa
        If (QryLocal.FieldByName('IDREGRACALCUSADA').AsString <> '') Then
        Begin
           // Executa a Regra de Caclulo do Valor Despesas
           RegraLocal.RuleName := QryLocal.FieldByName('IDREGRACALCUSADA').AsString;
           RegraLocal.QueryIn  := QryRegra;
           Try
              //AL_13
              if not bPassoPasso then
                 RegraLocal.Execute
              else
                 RegraLocal.Passoapasso;
           Except
              Raise;
           End;
           wVlrResultRegra:=StrToFloat(TrocaPontoVirgula(RegraLocal.Result));
        End;
        // Calcula Data de Vencimento
        wStrDataResultRegra:=QryRegra.FieldByName('DATAVENCOPER').AsString;
        // Caso Exista Regra de Vencimento Associada Executa
        If (QryLocal.FieldByName('IDREGRAVENCUSADA').AsString <> '') Then
        Begin
           // Executa a Regra de Caclulo do Valor Despesas
           RegraLocal.RuleName := QryLocal.FieldByName('IDREGRAVENCUSADA').AsString;
           RegraLocal.QueryIn  := QryRegra;
           // Tenta Executar a Regra
           Try
              RegraLocal.Execute;
           Except
              Raise;
           End;
           wStrDataResultRegra:=RegraLocal.Result;
        End;
        // Preenche o Arquivo de Despesas
        wOldDecimalSeparator :=DecimalSeparator;
        DecimalSeparator     :='.';
        //AL_12
        if wVlrResultRegra <> 0 then
        begin
           ExecutaQuery(QryLocalAux,
                        //AL_11 - Formata valores com duas casas decimais somente
                        'UPDATE DESPOPERINVEST SET '+
                        'VLRDESPOPER = '+FormatFloat('#0.00',wVlrResultRegra)+', '+
                        'DATAVENCDESPOPER  = TO_DATE('''+wStrDataResultRegra+''',''DD/MM/YYYY'') '+
                        'WHERE (IDDESPOPERINVEST = '+QryLocal.FieldByName('IDDESPOPERINVEST').AsString+')');
        end;
        DecimalSeparator     :=wOldDecimalSeparator;
        // Pula para o Proximo Registro e Incrementa o ProgressBar
        QryLocal.Next;
        FrmAguarde.Pos:=FrmAguarde.Pos+1;
     End;
  finally
     // Libera Objetos Locais
     FreeAndNil(QryLocal);
     FreeAndNil(QryLocalAux);
     FreeAndNil(QryRegra);
     FreeAndNil(RegraLocal);
     FreeAndNil(CtrlRendaVariavel);
     FrmAguarde.Apaga;
  end;
End;

//------------------------------------------------------
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

//------------------------------------------------------------
// Acha Classificação do Investimento
Procedure AchaClassInvestimento(wIdCarteira, wIdInvestimento:Integer; TabelaClassificacao:String;
                                DataReferencia:TDate; Var Classificacao: String);
Var
  QryLocalAux :TwwQuery;
Begin
// Cria Objetos Locais
  QryLocalAux              := TwwQuery.Create(Application);
  QryLocalAux.DatabaseName := 'BaseDados';

//  Processa Buscas, em Niveis, caso não encontre o enquadramento,
//  caso encontre guarda. (CARTEIRA/INVESTIMENTO, CARTEIRA, INVESTIMENTO),
//  Sempre na Data de Referencia.

// Busca o Enquadramento desta Carteira/Investimento \\
  If FazQuery(QryLocalAux,
       'SELECT	CODTABCLASSINV,  CODCLASSINVEST, DTENQUADRA          '+
       'FROM CLASSINVXINVEST                                        '+
       'WHERE (CODTABCLASSINV    = '+QuotedStr(TabelaClassificacao)  +') AND '+
       '      (IDCARTEIRAINVEST  = '+QuotedStr(IntToStr(wIdCarteira))+') AND '+
       '      (IDINVESTIMENTO    = '+QuotedStr(IntToStr(wIdInvestimento))+    ') AND '+
       '      (DTENQUADRA       <= TO_DATE('+QuotedStr(DateToStr(DataReferencia))+
                                           ',''DD/MM/YYYY'')) '+
       'ORDER BY DTENQUADRA DESC ')
  Then Begin
// Guarda Enquadramento
      Classificacao := QryLocalAux.FieldByName('CODCLASSINVEST').AsString;
  End Else Begin

// Busca o Enquadramento desta Carteira \\
    If FazQuery(QryLocalAux,
         'SELECT	CODTABCLASSINV,  CODCLASSINVEST, DTENQUADRA                 '+
         'FROM CLASSINVXINVEST                                               '+
         'WHERE (CODTABCLASSINV    = '+QuotedStr(TabelaClassificacao)+') AND '+
         '      (IDCARTEIRAINVEST  = '+QuotedStr(IntToStr(wIdCarteira))+        ') AND '+
         '      (IDINVESTIMENTO IS NULL) AND '+
         '      (DTENQUADRA       <= TO_DATE('+QuotedStr(DateToStr(DataReferencia))+
                                             ',''DD/MM/YYYY'')) '+
         'ORDER BY DTENQUADRA DESC ')

    Then Begin
// Guarda Enquadramento
      Classificacao := QryLocalAux.FieldByName('CODCLASSINVEST').AsString;
    End Else Begin

// Busca o Enquadramento deste Investimento \\
      If FazQuery(QryLocalAux,
           'SELECT	CODTABCLASSINV, CODCLASSINVEST, DTENQUADRA                  '+
           'FROM CLASSINVXINVEST                                               '+
           'WHERE (CODTABCLASSINV    = '+QuotedStr(TabelaClassificacao)+') AND '+
           '      (IDCARTEIRAINVEST IS NULL) AND '+
           '      (IDINVESTIMENTO = '+QuotedStr(IntToStr(wIdInvestimento))+') AND '+
           '      (DTENQUADRA    <= TO_DATE('+QuotedStr(DateToStr(DataReferencia))+
                                            ',''DD/MM/YYYY'')) '+
           'ORDER BY DTENQUADRA DESC ')

      Then Begin
// Guarda Enquadramento
        Classificacao := QryLocalAux.FieldByName('CODCLASSINVEST').AsString;
      End Else Begin
// Caso Não Encontre Guarda Enquadramento Nulo
        Classificacao := '';
      End;
    End;
  End;
  QryLocalAux.Free;
End;

//------------------------------------------------------------
// Enquadra os Investimentos de Acordo com seua classificacoes
Procedure EnquadraInvestimento(DataReferencia:TDate; TabelaClassificacao, TiposInvest:String;
                               LimpaArquivo, TotalizaSintetico:Boolean);
Var
  QryLocal, QryLocalAux :TwwQuery;
  wOldDecimalSeparator:Char;
  wSQL, wCodTabClassif, wCodClassif :String;
  wQtdInvestLote, wSaldoInvestLote:Double;
  fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
  wSaldoInutil :Double;
  wIdCarteira, wIdInvestimento:Integer;
  wDec:Char;
Begin
// Cria Objetos Locais
  QryLocal              := TwwQuery.Create(Application);
  QryLocal.DatabaseName := 'BaseDados';
  QryLocalAux              := TwwQuery.Create(Application);
  QryLocalAux.DatabaseName := 'BaseDados';
  QryLocalAux.Name         := 'QryLocalAux';       

// Monta SQL para retornar as Carteiras e os Investimentos
  wSQL:= 'SELECT DISTINCT H1.IDCARTEIRAINVEST,  H1.IDINVESTIMENTO, H1.IDLOTE  '+
         'FROM HISTCARTINV H1                                                 '+
         'WHERE H1.IDTIPOINVEST IN ('+TiposInvest+')               '+
         'ORDER BY H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.IDLOTE          ';

// Preenche Query Local com o SQL criado
  FazQuery(QryLocal,wSQL);

// Inicia Transacao \\
  DtmBaseDados.dbBaseDados.StartTransaction;

// Deleta Tabela Inteira
  If LimpaArquivo = True Then
    ExecutaQuery(QryLocalAux,'DELETE HISTCLASSCART ');
// Enquanto não for final da Query Processa .
  While Not QryLocal.EOF Do Begin
// Guarda Dados das Carteiras Investimento
    wIdCarteira     := QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger;
    wIdInvestimento := QryLocal.FieldByName('IDINVESTIMENTO').AsInteger;
// Inicia Saldos
    wSaldoInvestLote:=0; wQtdInvestLote:=0; fSdoQtdeInvCart:=0; fSdoVlrInvCart:=0;
// Enquanto a Carteira
    While (wIdCarteira     = QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger) And
          (wIdInvestimento = QryLocal.FieldByName('IDINVESTIMENTO').AsInteger)   And
          Not QryLocal.EOF Do Begin
// Busca o Saldo do investimento de todos os lotes
      //AL_1
      //AL_2
      //AL_6
      //AL_7
      //AL_8
      OperComum.BuscaTodosSaldosInvestLote(
        QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
        0{IDCARTEIRAGERENC}, QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
        9999999, -1, QryLocal.FieldByName('IDLOTE').AsString, DateToStr(DataReferencia), -1,
        fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui,
        fSdoRend, fSdoRend, wSaldoInutil, wSaldoInutil, wSaldoInutil,
        wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
        wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);

// Guarda Saldos
      wSaldoInvestLote:= fSdoVlrInvCart;
      wQtdInvestLote  := fSdoQtdeInvCart;

// Proximo Registro
      QryLocal.Next;
    End;

// Acha Classificação do Investimento
    AchaClassInvestimento(wIdCarteira, wIdInvestimento, TabelaClassificacao,
                          DataReferencia, wCodClassif);

// Acerta Arquivo de Enquadramento ....
      Try
        wDec:=DecimalSeparator;
        DecimalSeparator:='.';
        ExecutaQuery(QryLocalAux,
          'INSERT INTO HISTCLASSCART '+
          '  (CODTABCLASSINV,  CODCLASSINVEST, IDCARTEIRAINVEST, IDINVESTIMENTO, '+
          '   DATAREFERENCIA, SALDOCLASSCART, SALDOQTDCLASSCART)'+
          'VALUES ('+
               QuotedStr(TabelaClassificacao)         +', '+
               QuotedStr(wCodClassif)                 +', '+
               QuotedStr(IntToStr(wIdCarteira))       +', '+
               QuotedStr(IntToStr(wIdInvestimento))   +', '+
          'TO_DATE('+QuotedStr(DateToStr(DataReferencia))+',''DD/MM/YYYY''), '+
               TrocaVirgulaPonto(FloatToStr(wSaldoInvestLote))+', '+
               TrocaVirgulaPonto(FloatToStr(wQtdInvestLote))  +') '   );
        DecimalSeparator:=wDec;
      Except
        Raise;
// Rollbacka Transacao
        DtmBaseDados.dbBaseDados.RollBack;
        Exit;
      End;
  End;

// Processa os Registros dos Enquadramentos Sinteticos \\

// Busca Todos os Registros desta Tabela
  If (TotalizaSintetico = True) And
     FazQuery(QryLocal,
       'SELECT  CODTABCLASSINV, CODCLASSINVEST FROM CLASSIFINVEST '+
       'WHERE (CODTABCLASSINV = '+QuotedStr(TabelaClassificacao)+') '+
       'ORDER BY CODTABCLASSINV, CODCLASSINVEST') Then Begin

// Processa Classificacoes
    While Not QryLocal.EOF Do Begin
// Guarda Tabela e a Classificacao
      wCodTabClassif := QryLocal.FieldByName('CODTABCLASSINV').AsString;
      wCodClassif    := QryLocal.FieldByName('CODCLASSINVEST').AsString;
// Totaliza Saldos desta Classificacao
      If FazQuery(QryLocalAux,
        'SELECT  SUM(HCC.SALDOCLASSCART) AS SALDOCLASSCART,      '+
        '        SUM(HCC.SALDOQTDCLASSCART) AS SALDOQTDCLASSCART '+
        'FROM HISTCLASSCART HCC '+
        'WHERE 	(HCC.CODTABCLASSINV  = '+QuotedStr(wCodTabClassif)+') AND '+
        '        (HCC.CODCLASSINVEST LIKE '+QuotedStr(wCodClassif+'%')+')  AND '+
        '        (HCC.DATAREFERENCIA <= TO_DATE('+QuotedStr(DateToStr(DataReferencia))+
                                                ',''DD/MM/YYYY'')) ') Then Begin
// Guarda Somatorio dos Saldos
        wSaldoInvestLote:= QryLocalAux.FieldByName('SALDOCLASSCART').AsFloat;
        wQtdInvestLote  := QryLocalAux.FieldByName('SALDOQTDCLASSCART').AsFloat;
// Inserir na Tabela
        If (wSaldoInvestLote > 0 ) Then Begin
          Try
            ExecutaQuery(QryLocalAux,
              'INSERT INTO HISTCLASSCART '+
              '  (CODTABCLASSINV,  CODCLASSINVEST,  '+
              '   DATAREFERENCIA, SALDOCLASSCART, SALDOQTDCLASSCART)'+
              'VALUES ('+
                   QuotedStr(wCodTabClassif)              +', '+
                   QuotedStr(wCodClassif)                 +', '+
              'TO_DATE('+QuotedStr(DateToStr(DataReferencia))+',''DD/MM/YYYY''), '+
                   TrocaVirgulaPonto(FloatToStr(wSaldoInvestLote))+', '+
                   TrocaVirgulaPonto(FloatToStr(wQtdInvestLote))  +') ');
          Except
            Raise;
  // Rollbacka Transacao
            DtmBaseDados.dbBaseDados.RollBack;
            Exit;
          End;
        End;
      End;
// Proximo Registro
      QryLocal.Next;
    End;
  End;
// Comita Transacao
  DtmBaseDados.dbBaseDados.Commit;

// Libera Objetos Locais
  QryLocal.Free;
  QryLocalAux.Free;
End;


//******************************************************************************
// Marca FlgCalSaldo em HistCartInv a partir de uma entrada na tabela.
// Obs.: Só marca
// (OPE) - Operação realizada no HistCartInv:
//       INC - Inclusão
//       ALT - Alteração
//       EXC - Exclusão
function FlgHistCartInv (IdHistCartInv: Integer; OPE: String): Boolean;
var
   Query, QryUpdate : TwwQuery;
   Carteira, Investimento: integer;
   Lote, sqlq, Flg: string;
   Data: TDateTime;
begin
   try
      result    := false;

      Query                  := TwwQuery.Create(Application);
      Query.DatabaseName     := 'BaseDados';

      QryUpdate              := TwwQuery.Create(Application);
      QryUpdate.DatabaseName := 'BaseDados';

      //Acha IdCarteira, IdInvestimento, IdLote e Data
      FazQuery(Query,'Select IdCarteiraInvest, IdInvestimento, IdLote, '+
               'DataMovCartInv From HistCartInv Where IdHistCartInv='+
               IntToStr(IdHistCartInv));

      if Query.IsEmpty then
      begin
         MessageBox(Application.Handle, 'Identificador de histórico inválido.',
                    'Erro',MB_OK or MB_APPLMODAL or MB_ICONERROR);
         Exit;
      end;

      Carteira     := Query.FieldByName('IDCARTEIRAINVEST').AsInteger;
      Investimento := Query.FieldByName('IDINVESTIMENTO').AsInteger;
      Lote         := Query.FieldByName('IDLOTE').AsString;
      Data         := Query.FieldByName('DATAMOVCARTINV').AsDateTime;

      //Cria query com histórico da mesma carteira e mesmo lote
      if Trim(Lote) <> '' then
         sqlq := ' AND IDLOTE='+#39+Lote+#39
      else
         sqlq := ' AND IDLOTE IS NULL';

      FazQuery(Query,
              'SELECT IDCARTEIRAINVEST, IDINVESTIMENTO, DATAMOVCARTINV,'+
              'IDHISTCARTINV FROM HISTCARTINV WHERE '+
              'IDCARTEIRAINVEST='+IntToStr(Carteira)+ sqlq + ' ORDER BY '+
              'DATAMOVCARTINV, IDHISTCARTINV');

      try
         //Procura registros para marca de atualização de saldos
         Query.Locate('IDHISTCARTINV', IdHistCartInv,[]);

         // Nas operações de Inclusão e Alteração
         if Ope <> 'EXC' then begin
            // Marca 3 na própria linha
            ExecutaQuery(QryUpdate, 'UPDATE HISTCARTINV SET FLGCALCSALDO = '+
                         QuotedStr('3')+
                         ' WHERE IDHISTCARTINV ='+IntToStr(IdHistCartInv));

            // Marca 2 na próxima linha com Carteira/Investimento iguais
            ExecutaQuery(QryUpdate, 'UPDATE HISTCARTINV SET FLGCALCSALDO = ' +
                         QuotedStr('2')+' WHERE IDHISTCARTINV=(SELECT '+
                         'MIN(IDHISTCARTINV) FROM HISTCARTINV WHERE '+
                         'IDCARTEIRAINVEST= '+QuotedStr(IntToStr(Carteira))     +' AND '+
                         'IDINVESTIMENTO  = '+QuotedStr(IntToStr(Investimento)) +' AND '+
                         'IDHISTCARTINV   > '+QuotedStr(IntToStr(IdHistCartInv))+
                         sqlq+')')
         end
         else
         // Na Operação de Exclusão
         begin
              // Avança para próxima linha do HistCartInv
              Query.Next;
              if Query.EOF then Exit;

              // Marca 1 se a próxima linha for mesma Carteira/Investimento
              if Query.FieldByName('IdInvestimento').AsInteger = Investimento then
                 ExecutaQuery(QryUpdate, 'Update HistCartInv Set FlgCalcSaldo='+
                              QuotedStr('1')+' Where IdHistCartInv='+
                              Query.FieldByName('IdHistCartInv').AsString)
              else
              // Marca 3 (mesma Carteira) e procura próxima linha com
              //Investimento igual
              begin
                 ExecutaQuery(QryUpdate, 'Update HistCartInv Set FlgCalcSaldo='+
                              QuotedStr('3')+' Where IdHistCartInv='+
                              Query.FieldByName('IdHistCartInv').AsString);
                 Query.Next;
                 if Query.EOF then exit;
                 while Query.FieldByName('IdInvestimento').AsInteger <> Investimento do
                 begin
                      Query.Next;
                      if Query.EOF then exit
                 end;
                 ExecutaQuery(QryUpdate, 'Update HistCartInv Set FlgCalcSaldo='+
                              QuotedStr('2')+' Where IdHistCartInv='+
                              Query.FieldByName('IdHistCartInv').AsString);
              end;
         end;
      except
         raise;
         exit;
      end;
      // Apaga objetos e libera recursos utilizados
   finally
      try
         Query.Close;
         Query.Free;
         Query := nil;
         QryUpdate.Close;
         QryUpdate.Free;
         QryUpdate := nil;
         OperacaoInvest.Free;
         OperacaoInvest := nil
      except
         //Não mostra mensagem de erro
         result := false
      end;
   end;
end;

procedure fDbiSetDateFormat;
Var
  fData : FMTDate;
begin
  fData.szDateSeparator   := '/';
  fData.iDateMode         := 1;
  fData.bFourDigitYear    := False;
  fData.bYearBiased       := True;
  fData.bMonthLeadingZero := True;
  fData.bDayLeadingZero   := True;

  Check(DbiSetDateFormat(fData));
end;

//-----------------------------------------------------------
// Busca Saldo de Caixa
// Parametros :   StrDataRef : Data da Operacao (String)
Function BuscaSaldoCaixa(StrDataRef:String):Double;
Var
  wSqlSaldo:String;
  QryLocalAux:TwwQuery;
Begin
// Cria Query Local
  QryLocalAux:= TwwQuery.Create(Application);
  QryLocalAux.DatabaseName:='BaseDados';

  Result:=0;
// Monta a Query que Busca o Saldo de Caixa
  wSqlsaldo:=
  'SELECT SUM(UN.SALDOATU) AS SALDOATU '+
  'FROM  ((SELECT C.DESCRICAO, C.CODPORTADOR, '+
  '               SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN*-1,M.VALORLANCFINAN)) AS SALDOANTERIOR, '+
  '               0 AS RECTOPAGTO, '+
  '               SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN*-1,M.VALORLANCFINAN)) AS SALDOATU '+
  '        FROM PORTADORCONTA C, MOVIMFINANC M '+
  '        WHERE (M.DATALANCFINAN <=  TO_DATE('+QuotedStr(StrDataRef)+',''DD/MM/YYYY'')) AND '+
  '              (M.IDPESSOA    = '+QuotedStr(IntToStr(Sistema.IdEmpresa))+') AND '+
  '              (M.CODPORTADOR = C.CODPORTADOR) '+
  '        GROUP BY C.DESCRICAO, C.CODPORTADOR) '+
  '   UNION '+
  '       (SELECT C.DESCRICAO, C.CODPORTADOR, '+
  '               0 AS SALDOANTERIOR, '+
  '               SUM(DECODE(L.DEBCRE,''D'',L.VALOR,(L.VALOR*-1))) AS RECBTOPAGTO, '+
  '               SUM(DECODE(L.DEBCRE,''D'',L.VALOR,(L.VALOR*-1))) AS SALDOATU     '+
  '        FROM   LANCTODOCUM L, DOCUMENTO D, PORTADORFORMA P, PORTADORCONTA C   '+
  '        WHERE (D.STATUS <> 2 OR D.STATUS IS NULL) AND   '+
  '              ((D.DATAPROGRAMADA+DECODE(P.DMAIS(+),NULL,0,P.DMAIS(+))) = TO_DATE('+
                   QuotedStr(StrDataRef)+',''DD/MM/YYYY''))  AND '+
  '              (D.IDPESSOA     = '+QuotedStr(IntToStr(Sistema.IdEmpresa))+') AND            '+
  '              (D.CODDOCUMENTO = L.CODDOCUMENTO) AND     '+
  '              (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND  '+
  '              (P.CODPORTADOR  = C.CODPORTADOR(+))       '+
  '        GROUP BY C.DESCRICAO, C.CODPORTADOR)) UN        ';

// Executa a Pesquisa
  FazQuery(QryLocalAux,wSqlSaldo);
// Gera Resultado
  Result:= QryLocalAux.FieldByName('SALDOATU').AsFloat;

// Libera Objetos Locais
  QryLocalAux.Free;
End;

//-------------------------------------------------------------
// Verifica se a Data desta Operacao é menor ou igual a data
// do Fechamento diario caso seja mostra uma mensagem e guarda
// Confirmando ou nao esta operação
// PARAMETROS :   StrDataOperacao : Data da Operacao (String)
// ----------
Function VerificaFechamentoOperacao(StrDataOperacao:String):Boolean;
Var
  QryLocalAux:TwwQuery;
  wStrData:String;
Begin
// Cria Query Local
  QryLocalAux:= TwwQuery.Create(Application);
  QryLocalAux.DatabaseName:='BaseDados';

  Result :=True;

// Pega data de Acordo com o Tipo de Menu
  If TipoMenuInvest = 'A' Then
  Begin
    MsgDlg('Sistema utilizado para Ambos os Tipos de Investimento.'+#13+
           'Escolha apenas um dos Tipos.','Mensagem do Sistema', MtError,[MbOk],0);
    Result :=False;
    Exit;
  End
  Else
  begin
     If TipoMenuInvest = 'F' Then
        wStrData := 'DATAULTFECHRF'
     Else If TipoMenuInvest = 'V' Then
        wStrData := 'DATAULTFECH'
     Else If TipoMenuInvest = 'I' Then
        wStrData := 'DATAULTFECHFDO';
  end;
// Verifica se a data da operacao é menor ou igual a do fechamento
  FazQuery(QryLocalAux,'SELECT '+wStrData+' FROM PARAMINVEST');

  if TipoMenuInvest = 'F' then
  begin
     // Em Renda Fixa as operações são efetuadas em dia já Fechado.
     if StrToDate(StrDataOperacao) < QryLocalAux.FieldByName(wStrData).AsDateTime Then
     begin
        if (MsgDlg('A data desta Operação é anterior a do ultimo Fechamento Diário, '+#13+
                   'confirma esta Operação ?','Mensagem do Sistema',MtConfirmation,[MbYes, MbNo],0) = MrNo) Then
        begin
           Result :=False;
           Exit;
        end;
        // Caso Confirma Altera a Data do Ultimo Fechamento
        ExecutaQuery(QryLocalAux,'UPDATE PARAMINVEST SET '+wStrData+' = '+
                                 'TO_DATE('+QuotedStr(StrDataOperacao)+',''DD/MM/YYYY'')-1');
     end;
  end else if TipoMenuInvest = 'V' Then begin
     If StrToDate(StrDataOperacao) <= QryLocalAux.FieldByName(wStrData).AsDateTime Then
     Begin
        If (MsgDlg('A data desta Operação é anterior a do ultimo Fechamento Diário, '+#13+
                   'confirma esta Operação ?','Mensagem do Sistema',MtConfirmation,[MbYes, MbNo],0) = MrNo) Then
        begin
           Result :=False;
           Exit;
        End;
       //AL_3
     End;
  end else begin
     If StrToDate(StrDataOperacao) <= QryLocalAux.FieldByName(wStrData).AsDateTime Then
     Begin
        If (MsgDlg('A data desta Operação é anterior a do ultimo Fechamento Diário, '+#13+
                   'confirma esta Operação ?','Mensagem do Sistema',MtConfirmation,[MbYes, MbNo],0) = MrNo) Then
        begin
           Result :=False;
           Exit;
        End;
        // Caso Confirma Altera a Data do Ultimo Fechamento
        ExecutaQuery(QryLocalAux,'UPDATE PARAMINVEST SET '+wStrData+' = '+
                                 'TO_DATE('+QuotedStr(StrDataOperacao)+',''DD/MM/YYYY'')-1');
     End;
  end;
// Libera Objetos Locais
  QryLocalAux.Free;
End;

//------------------------------------------------------------------------------
// Transfere Acoes Antes da Operacao
// PARAMETROS :   IdOperacao        - Identificação da Operacao
//                IdCarteiraOrigem  - Identificação da Carteira de Origem das
//                                    Ações que seram transferidas
//                IdCarteiraDestino - Identificação da Carteira de Destino
//                IdInvestimento    - Identificação do Investimento
//                IdLote            - Identificação do Lote do Investimento
//                                    Para onde as Ações serão transferidas
//                DataOperacao      - Data da Operacao
//                QtdOperacao       - Quantidade do Investimento a serem Transferidos
//                ValorOperacao     - Valor da Operacao
//----------------
Function TransfereAcoes(IdOperacao, IdCarteiraOrigem,
                        IdCarteiraDestino, IdInvestimento:Integer;
                        IdLoteOrigem, IdLoteDestino:String;
                        DataOperacao:TDate;
                        QtdOperacao, ValorOperacao :Double):Boolean;
Var
  wDocumento, wPlanilha, wPlano, wFatura, wNoDoc: Integer;

  wQtdCotaIni, wVlrMovCartInv, wSaldoQtd, wSaldoVlr, wSaldoInutil: Double;

  wIdLoteOrigem, wIdLoteDestino:String;

  QryLocalAux:TwwQuery;
Begin
// Cria Query Local
  QryLocalAux:= TwwQuery.Create(Application);
  QryLocalAux.DatabaseName:='BaseDados';
// Inicia Variaveis
  wPlanilha :=-1;wPlano:=-1;wFatura:=-1;wNoDoc:=-1;wDocumento:=-1;
  Result:=True;

// Busca Inicio da Carteira
  FazQuery(QryLocalAux,'SELECT * FROM PARAMINVEST');
  wQtdCotaIni:= QryLocalAux.FieldByName('VLRCOTAINICART').AsInteger;

//******************************************************************************
// Trata a Carteira de Origem
// Busca Dados da Carieira de Origem
  If Not FazQuery(QryLocalAux,
           'SELECT  IDCARTEIRAINVEST, DESCCARTINVEST, FLGCARTPROP, FLGCALCDIARIO, '+
           '        DATAINICIO, FLGTRATALOTE '+
           'FROM CARTEIRAINVEST '+
           'WHERE IDCARTEIRAINVEST = '+QuotedStr(IntToStr(IdCarteiraOrigem))) Then Begin
// Mostra Mensagem antes de Sair
    MsgDlg( 'Carteira de Origem não foi encontrada. ',
            'Mensagem do Sistema ', MtError,[MbOk],0);
// Libera Objetos Locais
    QryLocalAux.Free;
    Exit;
  End;
// Caso a carteira nao trate lotes ignora o Lote
  If QryLocalAux.FieldByName('FLGTRATALOTE').AsString='N' Then
    wIdLoteOrigem:= ''
  Else
    wIdLoteOrigem:=IdLoteOrigem;

// Busca Saldo do Lote P/ calcular Preco unitario
  wSaldoQtd:=0; wSaldoVlr:=0;
  //AL_1
  //AL_2
  //AL_6
  //AL_7
  //AL_8
  OperComum.BuscaTodosSaldosInvestLote(
    IdCarteiraOrigem, 0{IDCARTEIRAGERENC}, IdInvestimento, 9999999,-1,
    wIdLoteOrigem, DateToStr(DataOperacao), -1,
    wSaldoQtd,    wSaldoVlr,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
    wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
    wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
    wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);

// Caso não exista saldo na carteira de origem sai fora
  If (wSaldoQtd < QtdOperacao) Then Begin
    MsgDlg('Quantidade Insuficiente na Carteira/Lote de Origem.',
           'Mensagem do Sistema',
           MtWarning,[MbOk],0);
    Result:=False;
// Libera Objetos Locais
    QryLocalAux.Free;
    Exit;
  End;

// Calcula Valor da Movimentacao (Caso não tenha sido passada (= -1))
  If ValorOperacao = -1 Then
    wVlrMovCartInv:=(QtdOperacao*(wSaldoVlr/wSaldoQtd))
  Else
    wVlrMovCartInv:=ValorOperacao;

// Debita Lancamento de Origem
  If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
    IdInvestimento, 2, IdOperacao, -1,
    -1, IdCarteiraOrigem, 0{IDCARTEIRAGERENC}, -1, -1, wPlanilha, wDocumento, wPlano,
    DataOperacao, wVlrMovCartInv,
    QtdOperacao, wQtdCotaini, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
    'D', 'D', wIdLoteOrigem,
    'Transferência entre Carteiras','TRF', '','', True,
    -1,
    iPlanPrevCtbPatro,iIdHistCartInv) Then Begin
    Result:=False;
// Libera Objetos Locais
    QryLocalAux.Free;
    Exit;
  End;

// Alimenta os Saldos da Carteira
  OperComum.AtualizaSaldos(wQtdCotaini,-1);
  wDocumento:=-1;

//******************************************************************************
// Trata a Carteira de Destino
// Busca Dados da Carieira de Origem
  If Not FazQuery(QryLocalAux,
    'SELECT  IDCARTEIRAINVEST, DESCCARTINVEST, FLGCARTPROP, FLGCALCDIARIO, '+
    '        DATAINICIO, FLGTRATALOTE '+
    'FROM CARTEIRAINVEST '+
    'WHERE IDCARTEIRAINVEST = '+QuotedStr(IntToStr(IdCarteiraDestino))) Then Begin
// Mostra Mensagem antes de Sair
    MsgDlg( 'Carteira de Destino não foi encontrada. ',
            'Mensagem do Sistema ', MtError,[MbOk],0);
// Libera Objetos Locais
    QryLocalAux.Free;
    Exit;
  End;

// Caso a carteira nao trate lotes ignora o Lote
  If QryLocalAux.FieldByName('FLGTRATALOTE').AsString='N' Then
    wIdLoteDestino:= ''
  Else
    wIdLoteDestino:=IdLoteDestino;

// Credita Lancamento de Destino
  If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
    IdInvestimento, 2, IdOperacao, -1,
    -1, IdCarteiraDestino, 0{IDCARTEIRAGERENC}, -1, -1, wPlanilha, wDocumento, wPlano,
    DataOperacao, wVlrMovCartInv, QtdOperacao,
    wQtdCotaini, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
    'A', 'A', wIdLoteDestino,
    'Transferência entre Carteiras','TRF', '', '',True,
    -1, iPlanPrevCtbPatro,iIdHistCartInv) Then Begin
    Result:=False;
// Libera Objetos Locais
    QryLocalAux.Free;
    Exit;
  End;
// Alimenta os Saldos da Carteira
  OperComum.AtualizaSaldos(wQtdCotaini,-1);

// ATUALIZA A CUSTODIA
  If Not OperacaoInvest.CadastraCustodia(-1) Then Begin
    MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
           'Mensagem do Sistema',
           MtError,[MbOk],0);
    Result:=False;
    QryLocalAux.Free;
    Exit;
  End;
// Libera Objetos Locais
  QryLocalAux.Free;
End;

//------------------------------------------------------------------------------
// Evolui Moeda pelo indice Em um Periodo
Function CapitalizaMoeda(IdMoeda:Integer; Indice:Double;DataInicial, DataFinal:TDate;
                         PulaFeriados,MostraMensagem,GravaResultado:Boolean):Double;
Var
  QryLocal      :TwwQuery;
  wVlrUltCotacao, wVlrAcumulado :Double;
  wDtUltCotacao, wDataInterna   :TDate;
  wIdCotacaoMoeda :Integer;
  wDec:Char;
Begin

  Try
// Inicia Objetos Locais
    QryLocal:=TwwQuery.Create(Application);
    QryLocal.DataBaseName:='BaseDados';

// Deleta Cotações posteriores a Data Inicial
    ExecutaQuery(QryLocal,
         'DELETE COTACAOMOEDA  '+
         'WHERE (MOECODIGO = '+QuotedStr(IntToStr(IdMoeda))+')  AND '+
         '      (COTDATA  >= TO_DATE('+QuotedStr(DateToStr(DataInicial))+',''DD/MM/YYYY'')) ');

// Critica Parametros
// Busca Ultima Cotacao Desta Moeda
    FazQuery(QryLocal,
      'SELECT COT1.COTVALOR, COT1.COTDATA '+
      'FROM COTACAOMOEDA COT1,            '+
      '    ( SELECT MAX(CT.COTDATA) AS DATAMAIOR FROM COTACAOMOEDA CT '+
			 '      WHERE (CT.MOECODIGO = '+QuotedStr(IntToStr(IdMoeda))+')  AND '+
			 '            (CT.COTDATA  <= TO_DATE('+QuotedStr(DateToStr(DataInicial))+',''DD/MM/YYYY'')) ) COT2 '+
      'WHERE (COT1.MOECODIGO = '+QuotedStr(IntToStr(IdMoeda))+') AND '+
      '    	(COT1.COTDATA   = DATAMAIOR)');
// Caso Resultado Vazio
    If QryLocal.IsEmpty Then Begin
      MsgDlg('Não foram encontrados dados suficientes com estes paramêtros ',
             'Mensagem do Sistema',MtError,[MbOk],0);
      Result := 1;
      Exit;
    End;
// Guarda Valores
    wVlrUltCotacao := QryLocal.FieldByName('COTVALOR').AsFloat;
    wDtUltCotacao  := QryLocal.FieldByName('COTDATA').AsDateTime;
    wVlrAcumulado  := wVlrUltCotacao;
// Processa Registros
    wDataInterna:=DataInicial;
    wDec:=DecimalSeparator;
    DecimalSeparator:='.';
    While wDataInterna <= DataFinal Do Begin
// Pula Final de Semana, Caso Flag de Feriado True (7 SAB, 1 DOM)
      If PulaFeriados = True Then Begin
        If (DayOfWeek(wDataInterna) = 7) Or (DayOfWeek(wDataInterna) = 1) Then Begin
          wDataInterna := wDataInterna + 1;
          Continue;
        End;
      End;
// Acumula Valor da Moeda
      wVlrAcumulado := wVlrAcumulado + (wVlrAcumulado*Indice);
// Grava Resultado Caso Flag GravaResultado True
      If GravaResultado = True Then Begin
// Inicia Transação Caso Não esteja Iniciada
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;
        wIdCotacaoMoeda := LeUltRegistro(nil, 'COTACAOMOEDA');
// Grava na Tabela de Cotacoes
        If Not ExecutaQuery(QryLocal,
                 'INSERT INTO COTACAOMOEDA (IDCOTACAOMOEDA, MOECODIGO, COTDATA, IDUSUARIOINCLUSAO, COTVALOR) '+
                 'VALUES ('+QuotedStr(IntToStr(wIdCotacaoMoeda))+', '+
                            QuotedStr(IntToStr(IdMoeda))+', TO_DATE('+
                            QuotedStr(DateToStr(wDataInterna))+',''DD/MM/YYYY''), '+
                            QuotedStr(IntToStr(Sistema.IdUsuario))+', '+
                            FloatToStr(wVlrAcumulado)+')') Then Begin
// Mostra Mensagem
          MsgDlg('Erro ao Incluir Cotações ...','Mensagem do Sistema',MtError,[MbOk],0);
// Cancela Transacao
          dtmBaseDados.dbBaseDados.RollBack;
          Result := 1;
          Exit;
        End;
      End;
// Proximo Dia
      wDataInterna := wDataInterna + 1
    End;
    DecimalSeparator:=wDec;
// Gera Resultado com a Ultima Cotacao
    Result:= wVlrAcumulado;
// Commita Transacao Caso esteja
    If dtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.DbBaseDados.Commit;
  Finally
    QryLocal.Free;
  End;
End;

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

//--------------------------------------------------------------------------------------------------
//    MudaMes:   Função que Muda os Mes de Uma Determinada Data Voltando sempre
//               o Ultimo dia deste mes
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       dDataIni    :  data em questão
//       iMeses      :  total de meses que se deseja somar
//
//--------------------------------------------------------------------------------------------------
Function MudaMes(dDataIni: TDateTime; iMeses: smallint): TDateTime;
var
   iDiaIni, iMesIni, iMesFim, iAnoIni, iAnoFim : word;
   wDataOk, bSoma : boolean;

begin
   iDiaIni  := DiasUteis.ExtraiDia(dDataIni);
   iMesIni  := DiasUteis.ExtraiMes(dDataIni);
   iAnoIni  := DiasUteis.ExtraiAno(dDataIni);


   // calcula quantos Anos inteiros há no período em meses e já calcula o ano resultante
   iAnoFim  := iAnoIni + iMeses div 12;

   // calcula o "saldo" em meses (entre 0 e 12)
   iMeses   := iMeses mod 12;

   // soma o "saldo"
   if iMesIni + iMeses > 12 then begin
      iAnoFim := iAnoFim + 1;
      iMesFim := iMesIni + iMeses - 12;
   end else begin
      if iMesIni + iMeses <= 0 then begin
         iAnoFim := iAnoFim - 1;
         iMesFim := 12 - (iMesIni + iMeses);
      end else begin
         iMesFim := iMesIni + iMeses;
      end;
   end;
   Result := DiasUteis.UltDiaMes(iAnoFim, iMesFim);
end;

//******************************************************************************
// Executa a Operacao Renda Variavel
Function ExecutaOperAcao(IdTipoOperacao, IdBolsaValores, IdCorretValores,
                         IdInvestimento, IdCarteira,     IdCartOriDest : Integer;
                         IdLote :String;
                         QtdOperacao, ValorOperacao :Double;
                         DataProc :TDateTime):Boolean;
Var
  wNoDoc    :Extended;

  wPlano, wFatura, wOprContabil, wIdForCli, wPlanilha, wDocumento,
  wIdMoeda, wIdNovaOperacao, wValCota, wQtdCotaIni, wIdEmissor :Integer;

  wValSaldo, wVlrOperacao, wSaldoQtd, wSaldoVlr, wSaldoInutil, wVlrMovCartInv :Double;

  wNaturezaOperacao, wTipoCustodia, wFlgTransf, wTipCredor, wDescTipoOperacao,
  wMensErro, wHistorico, wMovimentoaExecutar, wValString, wCodTipoAcao,
  wDescInvestimento : String;

  QryInterna: TwwQuery;
Const
  wMensagem: Array[-9..0] Of String =
             (' ',
              ' ',
              'Não foi possível efetuar o lançamento de CAP/CAR.',
              'Não foi possível efetuar o lançamento contábil.',
              'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
              'Erro de gravação.',
              'Ambigüidade no Padrão de Lançamento.',
              'Operação com valor igual a "ZERO".',
              'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
              'Lançamento(s) realizados com sucesso.');
begin
// Critica Dados
  If (IdTipoOperacao = 0) Or (IdBolsaValores = 0) Or
     (IdInvestimento = 0) Or
     (IdCarteira     = 0) Or (IdCartOriDest  = 0) Then Begin
    MsgDlg('Faltam Preencher Parâmetros ','Mensagem do Sistema',
            MtWarning,[MbOk],0);
    Result := False;
    Exit;
  End;

  If (IdBolsaValores  = -1) Then IdBolsaValores  := Null;
  If (IdCorretValores = -1) Then IdCorretValores := Null;

// Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
  If Not VerificaFechamentoOperacao(DateToStr(DataProc)) Then Begin
    Result := False;
    Exit;
  End;


// Cria Objetos Locais
  QryInterna              := TwwQuery.Create(Application);
  QryInterna.DatabaseName := 'BaseDados';

//-----------------------------------------------------\\
// Busca Dados Complementares, caso não encontre Sai . \\
// Dados da Cota Inicial
  FazQuery(QryInterna,'SELECT * FROM PARAMINVEST');
  wQtdCotaIni:= QryInterna.FieldByName('VLRCOTAINICART').AsInteger;

// Dados do Tipo de Operacao
  If Not FazQuery(QryInterna,
    ' SELECT  IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO,  '+
    '         TIPOCUSTODIA, VENCIMENTO, CODTIPDOC, FLGGERACONTAB, FLGGERACAPCAR, '+
    '         RECPAG, TIPCREDOR, FLGGERACAF, FLGTRANSF, FLGCORRET                '+
    ' FROM TIPOOPERACAO '+
    ' WHERE IDTIPOOPERACAO = '+QuotedStr(IntToStr(IdTipoOperacao))) Then Begin
// Mostra Mensagem antes de Sair
    MsgDlg( 'Tipo de Operacao não foi encontrada. ',
            'Mensagem do Sistema ', MtError,[MbOk],0);
// Libera Objetos Locais
    QryInterna.Free;
    Result := False;
    Exit;
  End;
// Guarda Dados Complementares
  wTipoCustodia := QryInterna.FieldByName('TIPOCUSTODIA').AsString;
  wFlgTransf    := QryInterna.FieldByName('FLGTRANSF').AsString;
  wTipCredor    := QryInterna.FieldByName('FLGCORRET').AsString;
  wNaturezaOperacao := QryInterna.FieldByName('NATUREZAOPERACAO').AsString;
  wDescTipoOperacao := QryInterna.FieldByName('DESCTIPOOPERACAO').AsString;

// Dados do Investimento
  If Not FazQuery(QryInterna,
    ' SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, INV.IDTIPOINVEST, '+
	   '         INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO                      '+
    ' FROM INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB  '+
    ' WHERE (INV.IDINVESTIMENTO = '+QuotedStr(IntToStr(IdInvestimento))+') AND '+
    '       (AXB.IDBOLSAVALORES = '+QuotedStr(IntToStr(IdBolsaValores))+') AND '+
    '       (INV.IDINVESTIMENTO = ACA.IDACAO) AND '+
    '       (INV.IDINVESTIMENTO = AXB.IDACAO) ') Then Begin

// Mostra Mensagem antes de Sair
    MsgDlg( 'Investimento não foi encontrado. ',
            'Mensagem do Sistema ', MtError,[MbOk],0);
// Libera Objetos Locais
    QryInterna.Free;
    Result := False;
    Exit;
  End;
// Guarda Dados Complementares
  wCodTipoAcao := QryInterna.FieldByName('CODTIPOACAO').AsString;
  wIdEmissor   := QryInterna.FieldByName('IDEMISSOR').AsInteger;
  wIdMoeda     := QryInterna.FieldByName('MOECODIGO').AsInteger;

  wDescInvestimento := QryInterna.FieldByName('DESCINVESTIMENTO').AsString;

//--------------------------------------------------
// Testa Saldo na Custodia Caso Baixe o Investimento
  If (wTipoCustodia = 'D') Or
     (wTipoCustodia = 'X') Then Begin
// Busca Saldos na Carteira
    wSaldoQtd:=0;
    //AL_1
    //AL_2
    //AL_6
    //AL_7
    //AL_8
    OperComum.BuscaTodosSaldosInvestLote(
      idCarteira, 0{IDCARTEIRAGERENC}, IdInvestimento, 9999999, -1,IdLote, DateToStr(DataProc), -1,
      wSaldoQtd,    wSaldoVlr,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);
// Caso não exista saldo na carteira de destino sai fora
    If (QtdOperacao > wSaldoQtd) Then Begin
      MsgDlg('Não existe quantidade suficiente na Carteira.','Mensagem do Sistema',
            MtError,[MbOk],0);
// Libera Objetos Locais
      QryInterna.Free;
      Result := False;
      Exit;
    End;
  End;


// Gera Novo Id de Operacao
  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

// Verifica o Fornecedor
  If wTipCredor = 'CO' Then Begin
    wIdForCli := IdCorretValores;
  End Else Begin
    wIdForCli := wIdEmissor;
  End;
// Inicia outros Dados
  wVlrOperacao := 0;

// Inclui Dados na Tabela de Operacao, OPERACAOINVEST
  ExecutaQuery(QryInterna,
    'INSERT INTO OPERACAOINVEST                                               '+
    '  (IDOPERACAOINVEST,  IDCORRETVALORES,  MOECODIGO,        IDMODULO,      '+
    '   EMPRESAPROP,       IDINVESTIMENTO,   IDCARTEIRAINVEST, IDTIPOINVEST,  '+
    '   IDTIPOOPERACAO,    DATAOPERACAO,     NUMDOCUMENTO,     QTDEOPERACAO,  '+
    '   PRECOUNITOPERACAO, VLROPERACAO,      DATAVENCOPER,     IDFORCLI,      '+
    '   IDCARTORIDEST,     IDLOTE)                                            '+
    'VALUES                                                                   '+
    '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
        QuotedStr(IntToStr(IdCorretValores))+', '+
        QuotedStr(IntToStr(wIdMoeda))+', '+
        QuotedStr(IntToStr(Sistema.IdModulo))+', '+
        QuotedStr(IntToStr(Sistema.IdEmpresa))+', '+
        QuotedStr(IntToStr(IdInvestimento))+', '+
        QuotedStr(IntToStr(IdCarteira))+', '+
        QuotedStr('2')+', '+
        QuotedStr(IntToStr(IdTipoOperacao))+', '+
        'TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY''), '+
        QuotedStr('NAOEX')+', '+
        FloatToStr(QtdOperacao)+', '+
        FloatToStr(ValorOperacao)+', '+
        FloatToStr(0)+', '+
        'TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY''), '+
        QuotedStr(IntToStr(wIdForCli))+', '+
        QuotedStr(IntToStr(IdCartOriDest))+', '+
        QuotedStr(IdLote)+
    ')');

// Inclui Dados na Tabela de SubTipo, OPRACAO
  ExecutaQuery(QryInterna,
    'INSERT INTO OPRACAO                                     '+
    '  (IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR) '+
    'VALUES                                                  '+
    '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
        QuotedStr(IntToStr(IdBolsaValores))+', '+
        QuotedStr(IntToStr(IdInvestimento))+', '+
        QuotedStr(IntToStr(wIdEmissor))+
    ')');

    wPlanilha:=-1;
    wPlano   :=-1;
    wFatura  :=-1;
    wNoDoc   :=-1;

//--------------------------------------------\\
// Contabiliza Operacao

//--------------------------------------------\\
// Acerta Historico da Carteira
  If wPlanilha = 0 Then wPlanilha := -1;
  wDocumento:=-1;
  If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
    IdInvestimento, 2, wIdNovaOperacao, -1, IdTipoOperacao, IdCarteira, 0{IDCARTEIRAGERENC},
    -1, -1, wPlanilha, wDocumento, wPlano, DataProc, 0, wSaldoQtd,
    wQtdCotaini, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
    wNaturezaOperacao, wNaturezaOperacao, IdLote,
    wDescTipoOperacao+' / '+ wDescInvestimento,'OPE', '1', '', True,
    -1, iPlanPrevCtbPatro,iIdHistCartInv) Then Begin
    Result := False;
    Exit;
  End;

// Alimenta os Saldos da Carteira
  OperComum.AtualizaSaldos(wQtdCotaini,-1);

//-------------------------------------------------------\\
// Caso Exista Transferencia de Acoes Depois da Operacao
  If (wFlgTransf = 'D') Then Begin
    If Not TransfereAcoes(wIdNovaOperacao,
                          IdCarteira, IdCartOriDest,
                          IdInvestimento,
                          IdLote, IdLote,
                          DataProc, QtdOperacao, ValorOperacao)
    Then Begin
      MsgDlg('Erro ao transferir papéis depois da Operação, '+#13+
             'esta Operação não poderá ser confirmada ','Mensagem do Sistema',
             MtError,[MbOk],0);
// Exclui Registro da Operacao
// (OPRACAO)
      ExecutaQuery(QryInterna,'DELETE FROM OPRACAO WHERE IDOPERACAOINVEST = '+
                              QuotedStr(IntToStr(wIdNovaOperacao)));
// (OPERACAOINVEST)
      ExecutaQuery(QryInterna,'DELETE FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = '+
                              QuotedStr(IntToStr(wIdNovaOperacao)));
// Caso Nescessite de Estornar Lancamentos Contábeis, Faz Aqui.
// Libera Objetos Locais
      QryInterna.Free;
      Result := False;
      Exit;
    End;
  End;


// Libera Objetos Locais
  QryInterna.Free;
  Result  := True;

End;

//******************************************************************************
// Executa a Operacao de Renda Fixa
Function ExecutaOperRenFix(IdTipoOperacao, IdInvestimento, IdCorretValores,
                           IdCarteira, IdCartOriDest : Integer;
                           IdLote :String;
                           QtdOperacao, ValorOperacao :Double;
                           DataProc :TDateTime):Boolean;
Var
  wNoDoc    :Extended;

  wPlano, wFatura, wOprContabil, wIdForCli, wPlanilha, wDocumento,
  wIdMoeda, wIdNovaOperacao, wValCota, wQtdCotaIni, wIdEmissor :Integer;

  wValSaldo, wVlrOperacao, wSaldoQtd, wSaldoVlr, wSaldoInutil, wVlrMovCartInv :Double;

  wNaturezaOperacao, wTipoCustodia, wFlgTransf, wTipCredor, wDescTipoOperacao,
  wMensErro, wHistorico, wMovimentoaExecutar, wValString, wCodTipoAcao,
  wDescInvestimento : String;

  QryInterna: TwwQuery;
Const
  wMensagem: Array[-9..0] Of String =
             (' ',
              ' ',
              'Não foi possível efetuar o lançamento de CAP/CAR.',
              'Não foi possível efetuar o lançamento contábil.',
              'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
              'Erro de gravação.',
              'Ambigüidade no Padrão de Lançamento.',
              'Operação com valor igual a "ZERO".',
              'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
              'Lançamento(s) realizados com sucesso.');
begin
   wIdForCli := 0;
// Critica Dados
  If (IdTipoOperacao = 0) Or (IdInvestimento = 0) Or
     (IdCarteira     = 0) Or (IdCartOriDest  = 0) Then Begin
    MsgDlg('Faltam Preencher Parâmetros ','Mensagem do Sistema',
            MtWarning,[MbOk],0);
    Result := False;
    Exit;
  End;

// Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
  If Not VerificaFechamentoOperacao(DateToStr(DataProc)) Then Begin
     Result := False;
     Exit;
  End;

// Cria Objetos Locais
  QryInterna              := TwwQuery.Create(Application);
  QryInterna.DatabaseName := 'BaseDados';

//-----------------------------------------------------\\
// Busca Dados Complementares, caso não encontre Sai . \\

// Dados da Cota Inicial
  FazQuery(QryInterna,'SELECT * FROM PARAMINVEST');
  wQtdCotaIni:= QryInterna.FieldByName('VLRCOTAINICART').AsInteger;

// Dados do Tipo de Operacao
  If Not FazQuery(QryInterna,
    ' SELECT  IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO,  '+
    '         TIPOCUSTODIA, VENCIMENTO, CODTIPDOC, FLGGERACONTAB, FLGGERACAPCAR, '+
    '         RECPAG, TIPCREDOR, FLGGERACAF, FLGTRANSF, FLGCORRET                '+
    ' FROM TIPOOPERACAO '+
    ' WHERE IDTIPOOPERACAO = '+QuotedStr(IntToStr(IdTipoOperacao))) Then Begin
// Mostra Mensagem antes de Sair
    MsgDlg( 'Tipo de Operacao não foi encontrada. ',
            'Mensagem do Sistema ', MtError,[MbOk],0);
// Libera Objetos Locais
    QryInterna.Free;
    Result := False;
    Exit;
  End;
// Guarda Dados Complementares
  wTipoCustodia := QryInterna.FieldByName('TIPOCUSTODIA').AsString;
  wFlgTransf    := QryInterna.FieldByName('FLGTRANSF').AsString;
  wTipCredor    := QryInterna.FieldByName('FLGCORRET').AsString;
  wNaturezaOperacao := QryInterna.FieldByName('NATUREZAOPERACAO').AsString;
  wDescTipoOperacao := QryInterna.FieldByName('DESCTIPOOPERACAO').AsString;

// Dados do Investimento
// Guarda Dados Complementares
  wCodTipoAcao := QryInterna.FieldByName('CODTIPOACAO').AsString;
  wIdEmissor   := QryInterna.FieldByName('IDEMISSOR').AsInteger;
  wIdMoeda     := QryInterna.FieldByName('MOECODIGO').AsInteger;

  wDescInvestimento := QryInterna.FieldByName('DESCINVESTIMENTO').AsString;

//--------------------------------------------------
// Testa Saldo na Custodia Caso Baixe o Investimento
  If (wTipoCustodia = 'D') Or
     (wTipoCustodia = 'X') Then Begin
// Busca Saldos na Carteira
    wSaldoQtd:=0;
    //AL_1
    //AL_2
    //Al_6
    //AL_7
    //AL_8
    OperComum.BuscaTodosSaldosInvestLote(
      idCarteira, 0{IDCARTEIRAGERENC}, IdInvestimento, 9999999,-1, IdLote, DateToStr(DataProc), -1,
      wSaldoQtd,    wSaldoVlr,    wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil);
// Caso não exista saldo na carteira de destino sai fora
    If (QtdOperacao > wSaldoQtd) Then Begin
      MsgDlg('Não existe quantidade suficiente na Carteira.','Mensagem do Sistema',
            MtError,[MbOk],0);
// Libera Objetos Locais
      QryInterna.Free;
      Result := False;
      Exit;
    End;
  End;

// Gera Novo Id de Operacao
  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');
// Verifica o Fornecedor
  If wTipCredor = 'CO' Then Begin
//    wIdForCli := IdCorretValores;
  End Else Begin
    wIdForCli := wIdEmissor;
  End;
// Inicia outros Dados
  wVlrOperacao := 0;

// Inclui Dados na Tabela de Operacao, OPERACAOINVEST
  ExecutaQuery(QryInterna,
    'INSERT INTO OPERACAOINVEST                                               '+
    '  (IDOPERACAOINVEST,  IDCORRETVALORES,  MOECODIGO,        IDMODULO,      '+
    '   EMPRESAPROP,       IDINVESTIMENTO,   IDCARTEIRAINVEST, IDTIPOINVEST,  '+
    '   IDTIPOOPERACAO,    DATAOPERACAO,     NUMDOCUMENTO,     QTDEOPERACAO,  '+
    '   PRECOUNITOPERACAO, VLROPERACAO,      DATAVENCOPER,     IDFORCLI,      '+
    '   IDCARTORIDEST,     IDLOTE)                                            '+
    'VALUES                                                                   '+
    '('+QuotedStr(IntToStr(wIdNovaOperacao))+', '+
        QuotedStr(IntToStr(IdCorretValores))+', '+
        QuotedStr(IntToStr(wIdMoeda))+', '+
        QuotedStr(IntToStr(Sistema.IdModulo))+', '+
        QuotedStr(IntToStr(Sistema.IdEmpresa))+', '+
        QuotedStr(IntToStr(IdInvestimento))+', '+
        QuotedStr(IntToStr(IdCarteira))+', '+
        QuotedStr('2')+', '+
        QuotedStr(IntToStr(IdTipoOperacao))+', '+
        'TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY''), '+
        QuotedStr('NAOEX')+', '+
        FloatToStr(QtdOperacao)+', '+
        FloatToStr(ValorOperacao)+', '+
        FloatToStr(0)+', '+
        'TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY''), '+
        QuotedStr(IntToStr(wIdForCli))+', '+
        QuotedStr(IntToStr(IdCartOriDest))+', '+
        QuotedStr(IdLote)+
    ')');

    wPlanilha:= 0;
    wPlano   := 0;
    wFatura  :=-1;
    wNoDoc   :=-1;

//--------------------------------------------\\
// Contabiliza Operacao

//--------------------------------------------\\
// Acerta Historico da Carteira
  If wPlanilha = 0 Then wPlanilha := -1;
  wDocumento:=-1;
  If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
    IdInvestimento, 2, wIdNovaOperacao, -1, IdTipoOperacao, IdCarteira, 0{IDCARTEIRAGERENC},
    -1, -1, wPlanilha, wDocumento, wPlano, DataProc, 0, wSaldoQtd,
    wQtdCotaini, 0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
    wNaturezaOperacao, wNaturezaOperacao, IdLote,
    wDescTipoOperacao+' / '+ wDescInvestimento,'OPE', '1', '', True,
    -1, iPlanPrevCtbPatro,iIdHistCartInv) Then Begin
    Result := False;
    Exit;
  End;

// Alimenta os Saldos da Carteira
  OperComum.AtualizaSaldos(wQtdCotaini,-1);

//-------------------------------------------------------\\
// Caso Exista Transferencia de Acoes Depois da Operacao
  If (wFlgTransf = 'D') Then Begin
    If Not TransfereAcoes(wIdNovaOperacao,
                          IdCarteira, IdCartOriDest,
                          IdInvestimento,
                          IdLote, IdLote,
                          DataProc, QtdOperacao, ValorOperacao)
    Then Begin
      MsgDlg('Erro ao transferir papéis depois da Operação, '+#13+
             'esta Operação não poderá ser confirmada ','Mensagem do Sistema',
             MtError,[MbOk],0);
// Exclui Registro da Operacao
// (OPRACAO)
      ExecutaQuery(QryInterna,'DELETE FROM OPRACAO WHERE IDOPERACAOINVEST = '+
                              QuotedStr(IntToStr(wIdNovaOperacao)));
// (OPERACAOINVEST)
      ExecutaQuery(QryInterna,'DELETE FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = '+
                              QuotedStr(IntToStr(wIdNovaOperacao)));
// Libera Objetos Locais
      QryInterna.Free;
      Result := False;
      Exit;
    End;
  End;


// Libera Objetos Locais
  QryInterna.Free;
  Result := True;

End;

Function Replace(sTexto, sTextoSai, sTextoEntra: String): String;
Var
  I:Integer;
Begin
   // Busca Posição da Substring a ser substituida
   I := Pos(sTextoSai,sTexto);
   while I > 0 do
   begin
      // Exclui
      Delete(sTexto,I,Length(sTextoSai));
      // Inclui a nova substring
      Insert(sTextoEntra,sTexto,I);

      I := Pos(sTextoSai,sTexto);
   end;

   Result := sTexto;
End;

Function TrocaLetra(LetraAntiga,NovaString,Frase:String):String;
Var
  I:Integer;
Begin
   // Le a Frase e Troca se Necessário
   For I := 0 To Length(Frase) Do
   Begin
      // Testa se Letra é a Antiga
      If Frase[I] = LetraAntiga Then
      Begin
         // Altera a Frase
         Frase := Copy(Frase,1,(I-1))+NovaString+Copy(Frase,I+1,Length(Frase));
      End;
   End;
   Result := Frase;
End;


Function PesqLongTab(Linha:String):String;
Var
  wSQL,wTabela,wCampoResult : String;
  wQryBusca : TwwQuery;
Begin
// Inicia Resultado
  Result := '';
// Decodifica SQL \\
// Pega Parte que mosta o SQL
  wSQL := Copy(Trim(Linha),2,(Pos(']',Trim(Linha))-2));
// Caso nao tenha SQL Retorna Erro
  If Trim(wSQL) = '' Then Begin
    ShowMessage('Erro nos parâmetreos da pesquisa ...');
    Result := '0';
    Exit;
  End;
// Troca , por And
  wSQL := TrocaLetra(',',' AND ',wSQL);

// Descodifica a Linha
  Linha       := Copy(Linha,(Pos(']',Linha)+1),Length(Linha));
  wTabela     := Copy(Linha,(Pos(']',Linha)+1),(Pos(',',Linha)-1));
  wCampoResult:= Copy(Linha,(Pos(',',Linha)+1),Length(Linha));

// Cria a Query Pesquisa no Banco
  wQryBusca := TwwQuery.Create(Application);
  wQryBusca.DatabaseName := 'BaseDados';

// Busca do Campo com o Nome Dado
  wSQL := BuscaCampos(wCampoResult,wSQL,wTabela);
  If wSQL = '' Then Begin
    ShowMessage('Erro, Tabela não possui campos ...');
    Result := '0';
    Exit;
  End;

// Monta a Query de pesquisa
  wSQL := 'SELECT '+wCampoResult+
          ' FROM  LONGTABGENER TG, LONGVALTABGENER VTG'+
          ' WHERE TG.DESCRICAO = '''+wTabela+''' AND ' +
          '       VTG.IDTABELA = TG.IDTABELA AND '     +
          wSQL;

// Preenche Resultado
  If FazQuery(wQryBusca,wSQL) Then Begin
    Result := wQryBusca.FieldByName(Trim(Copy(wCampoResult,5,3))).AsString;
  End Else Begin
    Result := '0';
  End;

// Libera Criados dentro da rotina
  wQryBusca.Free;
End;


Function BuscaCampos(Var wCampoResult,LinhaString,wTabela: String):String;
Var
  LocalQry:TwwQuery;
  wProxAnd,I:Integer;
  wLinhaResult,wCampo,wLocalString:String;
Begin
// Cria a Query Pesquisa no Banco
  LocalQry := TwwQuery.Create(Application);
  LocalQry.DatabaseName := 'BaseDados';
  Result :='';
  wLinhaResult:='';
  wLocalString := LinhaString;
// Testa se Tabela possui Campos
  If FazQuery(LocalQry,'SELECT CTG.IDCAMPO, CTG.DESCRICAO '+
                       ' FROM  LONGTABGENER TG, LONGCMPTABGENER CTG'+
                       ' WHERE CTG.IDTABELA = TG.IDTABELA '+
                       ' ORDER BY CTG.IDCAMPO ') Then Begin ;
// Busca Campo Resultado
    If LocalQry.Locate('DESCRICAO',wCampoResult,[]) Then Begin
      wCampoResult:='VTG.C'+LocalQry.FieldByName('IDCAMPO').AsString;
    End;
// Decodifica Campos
    wLocalString:=LinhaString;
    wProxAnd    :=1;
    For I := 1 To Length(LinhaString) Do Begin
      If (wLocalString[I] In ['=','>','<']) And
        (Pos(wLocalString[I-1],'=><') = 0 ) Then Begin
// Troca valor por Campo
        wCampo := Trim(Copy(wLocalString,1,(I-1)));
        If Not LocalQry.Locate('DESCRICAO',wCampo,[]) Then Begin
          Result:='';
          Exit;
        End;

        wProxAnd    :=Pos(' AND ',wLocalString)+4;
        If wProxAnd = 4 Then Begin
          wLinhaResult:= wLinhaResult+
                         'VTG.C'+LocalQry.FieldByName('IDCAMPO').AsString+' '+
                         Copy(wLocalString,I,Length(wLocalString));
          Result := wLinhaResult;
          Exit;
        End;

        wLinhaResult:= wLinhaResult+
                       'VTG.C'+LocalQry.FieldByName('IDCAMPO').AsString+' '+
                       Copy(wLocalString,I,wProxAnd-5);

        wLocalString:=Copy(LinhaString,wProxAnd,Length(LinhaString));

      End;
    End;
    Result := wLinhaResult;
  End Else Begin
    Result :='';
  End;
// Libera Query
  LocalQry.Free;
End;

function Vazio(sTexto: String): Boolean;
begin
   if Trim(sTexto) = '' then
      Result := True
   else Result := False;
end;

function FormataValor(fValor: Double): Double;
var i, iDec: Integer;
    sValor, sFormato: String;
begin
   sFormato := '0.';
   sValor := FloatToStr(fValor);
   iDec := Length(sValor) - Pos(DecimalSeparator,sValor);
   for i := 1 to iDec do
      sFormato := sFormato + '#';

   Result := StrToFloat(FormatFloat(sFormato,fValor));
end;

function ExisteForm(Form : TForm): Boolean;
var
   i: Integer;
begin
   Result := False;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i] = Form then begin
         Result := True;
         Break;
      end;
end;

// AL_4
procedure InsereElemento( var Str : string; const Delimitador, Elemento : string );
begin
   if Trim(Elemento) <> '' then
   begin
      if Str <> '' then
         Str := Str + Delimitador;
      Str := Str + Elemento;
   end;
end;

end.
