unit uValidaLayout;

interface

Uses DBTables,Classes,SysUtils,uMensagem,DB;

Var WMensagem : TMensagem;

Type
  TValidaLayout = Class

    Private

      // Querys para validação do Lay-out;
      FImportacao : String;
      FExportacao : String;
      FTabelas    : TStringList;
      Fqry_aux    : TQuery;

      // Busca Finalidade do Layout
      Procedure GetFinalidadeLayout ( Layout : Integer );

      // Valida Tabelas Vinculadas
      Procedure ValidaTabsVinc ( Layout : Integer );

      // Valida Tabelas Vinculadas
      Procedure ValidaCamposObrig ( Layout : Integer );

      // Valida Campos Lookups Associados
      Procedure ValidaLookups ( Layout : Integer );

      // Valida Associação dos Campos
      Procedure ValidaAssociacao ( Layout : Integer );

    Public
      //-- Indicadores de Erros ou Avisos
      FErro     : Boolean;
      FAviso    : Boolean;
      FMensagem : String; // Armazena os Erros decorrentes da crítica

      //-- Create e Destroy da Classe
      Constructor Create (AOWner : TComponent);
      Destructor Destroy; override;
      //-- Valida Lay-out
      Function Layout_Valido ( Layout : Integer ) : Boolean;
End;

implementation

//--------------------------------------------------------
//-- Cronstructor Classe TValidaArquivo
//--------------------------------------------------------
Constructor TValidaLayout.Create (AOwner : TComponent);
Begin
     Inherited Create;
     FTabelas   := TStringList.Create;
     Fqry_aux   := TQuery.Create(AOwner);
     Fqry_aux.DataBaseName := 'BaseDados';

     WMensagem  := TMensagem.Create;

     //-- Inicializa Variáveis de controle de Erro
     FErro     := False;
     FAviso    := False;
     FMensagem := '';
End;

//--------------------------------------------------------
//-- Destroy da Classe TValidaArquivo
//--------------------------------------------------------
Destructor TValidaLayout.Destroy;
Begin
     FTabelas.Free;
     Fqry_aux.Free;

     WMensagem.Free;
     Inherited Destroy;
End;

//---------------------------------------------------------------
//-- Rotina que Valida o Lay-ou do Arquivo
//---------------------------------------------------------------
Function TValidaLayout.Layout_Valido ( Layout : Integer ) : Boolean;
Begin

     ValidaTabsVinc(Layout);       // Verifica Tabelas Vinculadas

     If FImportacao = 'S' Then     // Verifica Campos Obrigatórios
        ValidaCamposObrig(Layout);

     ValidaLookups(Layout);        // Valida Campos Lookups Associados

     If FExportacao = 'S' Then     // Verifica Assocoação Múltipla de campos
        ValidaAssociacao(Layout);

     //-- Seta Ocorrência de Erros
     FErro     := WMensagem.FErro;
     FAviso    := WMensagem.FAviso;
     FMensagem := WMensagem.FMensagem;

     //-- Seta Retorno da Função
     If (FErro)
     or (FAviso) Then
        Result := False
     Else
        Result := True;
End;

//-------------------------------------------------------------------
//-- Rotina que seta as Finalidades do Layout (Importação/Exportacao)
//-------------------------------------------------------------------
Procedure TValidaLayout.GetFinalidadeLayout ( Layout : Integer );
Begin
  //-- Lê Tabelas às quais foram vinculados dados
  Fqry_aux.SQL.Clear;
  Fqry_aux.SQL.Add ('SELECT IR_PARA_IMPORTACAO, IR_PARA_EXPORTACAO FROM FI_LAYOUT_ARQUIVO_TABELA');
  Fqry_aux.SQL.Add ('WHERE CD_ARQUIVO = ' + inttostr(Layout));
  Fqry_aux.Open;
  if Fqry_aux.IsEmpty Then
     Raise Exception.Create ('Layout não encontrado')
  Else
     Begin
       FImportacao := Fqry_aux.FieldByName('IR_PARA_IMPORTACAO').AsString; 
       FExportacao := Fqry_aux.FieldByName('IR_PARA_EXPORTACAO').AsString;
       Fqry_aux.Close;
     End;
End;

//---------------------------------------------------------------
//-- Rotina que Carrega Lay-out de arquivo para validação
//---------------------------------------------------------------
Procedure TValidaLayout.ValidaTabsVinc ( Layout : Integer );
Begin

  //-- Lê Tabelas às quais foram vinculados dados
  Fqry_aux.SQL.Clear;
  Fqry_aux.SQL.Add ('SELECT DISTINCT NO_TABELA FROM FI_LAYOUT_ARQUIVO_TABELA');
  Fqry_aux.SQL.Add ('WHERE CD_ARQUIVO = ' + inttostr(Layout));
  Fqry_aux.Open;
  if Fqry_aux.eof Then
     Begin
       WMensagem.SetMsgErro('É necessário estabelecer a vinculação dos campos');
       Fqry_aux.Close;
       exit;
     End;

  //-- Carrega Tabelas Obrigatórias para StringList
  While not Fqry_aux.Eof do
    Begin
      FTabelas.Add(Fqry_aux.FieldByName('NO_TABELA').AsString);
      Fqry_aux.Next;
    End;
  FTabelas.Add('');
  Fqry_aux.Close;

  // Verifica se houve vinculação com tabelas obrigatórias
  // No caso a única obrigatória é a de Participante;
  If fTabelas.IndexOf('FI_PARTICIPANTE') = -1 Then
     WMensagem.SetMsgErro('É necessário estabelecer uma vinculação com dados do Participante.' + #13);

End;

//---------------------------------------------------------------
//-- Rotina que Verifica vinculação de campos obrigatórios
//---------------------------------------------------------------
Procedure TValidaLayout.ValidaCamposObrig ( Layout : Integer );
Begin

  Fqry_aux.SQL.Clear;
  Fqry_aux.SQL.Add ('SELECT A.NO_GRUPO, B.DS_ATRIBUTO_TABELA');
  Fqry_aux.SQL.Add ('FROM   FI_GRUPO_LOGICO A, FI_ATRIBUTO_TABELA B');
  Fqry_aux.SQL.Add ('WHERE  B.IR_CARGA_OBRIGATORIA = ' + #39 + 'S' + #39);
  Fqry_aux.SQL.Add ('AND    A.CD_GRUPO = B.CD_GRUPO');
  Fqry_aux.SQL.Add ('AND    B.NO_ATRIBUTO_TABELA NOT IN');
  Fqry_aux.SQL.Add ('      (SELECT C.NO_ATRIBUTO_TABELA FROM FI_LAYOUT_ARQUIVO_TABELA C');
  Fqry_aux.SQL.Add ('       WHERE  C.NO_TABELA  = B.NO_TABELA');
  Fqry_aux.SQL.Add ('         AND  C.CD_ARQUIVO = ' + inttostr(Layout) + ')');
  Fqry_aux.Open;

  While not Fqry_aux.Eof Do
    Begin
      WMensagem.SetMsgErro('Campos obrigatórios não vinculados a nenhum campo do Lay-out:' + #13);
      WMensagem.SetMsgErro
      ('Campo: ' + Fqry_aux.FieldByName('DS_ATRIBUTO_TABELA').AsString +
       ' - ' +  Fqry_aux.FieldByName('NO_GRUPO').AsString + ';');
      Fqry_aux.Next;
    End;

  Fqry_aux.Close;

End;

//---------------------------------------------------------------
//-- Rotina que Verifica preenchimento de campos Lookup
//---------------------------------------------------------------
Procedure TValidaLayout.ValidaLookups ( Layout : Integer );
Begin

  Fqry_aux.SQL.Clear;
  Fqry_aux.SQL.Add ('SELECT A.NO_GRUPO, B.DS_ATRIBUTO_TABELA ');
  Fqry_aux.SQL.Add ('  FROM FI_GRUPO_LOGICO A, FI_ATRIBUTO_TABELA B, ');
  Fqry_aux.SQL.Add ('       FI_LAYOUT_ARQUIVO_TABELA C ');
  Fqry_aux.SQL.Add (' WHERE A.CD_GRUPO = B.CD_GRUPO ');
  Fqry_aux.SQL.Add ('   AND B.NO_TABELA = C.NO_TABELA ');
  Fqry_aux.SQL.Add ('   AND B.NO_ATRIBUTO_TABELA = C.NO_ATRIBUTO_TABELA');
  Fqry_aux.SQL.Add ('   AND C.CD_ARQUIVO = ' + inttostr( Layout ) );;
  Fqry_aux.SQL.Add ('   AND B.NO_TABELA_LOOKUP IS NOT NULL ');
  Fqry_aux.SQL.Add ('   AND C.NO_ATRIBUTO_TABELA NOT IN ');
  Fqry_aux.SQL.Add ('       (SELECT D.NO_ATRIBUTO_TABELA ');
  Fqry_aux.SQL.Add ('          FROM FI_LAYOUT_ARQUIVO_TABELA_VALOR D ');
  Fqry_aux.SQL.Add ('         WHERE D.NO_TABELA = C.NO_TABELA ');
  Fqry_aux.SQL.Add ('           AND D.CD_ARQUIVO = C.CD_ARQUIVO ');
  Fqry_aux.SQL.Add ('           AND D.SQ_CAMPO = C.SQ_CAMPO ) ');
  Fqry_aux.Open;

  While not Fqry_aux.Eof Do
    Begin
      WMensagem.SetMsgErro('É necessária a definição de valores para o(s) campo(s) abaixo relacionado(s):' + #13);
      WMensagem.SetMsgErro
      ('Campo: ' + Fqry_aux.FieldByName('DS_ATRIBUTO_TABELA').AsString +
       ' - ' +  Fqry_aux.FieldByName('NO_GRUPO').AsString + ';');
      Fqry_aux.Next;
    End;

  Fqry_aux.Close;

End;

//-------------------------------------------------------------------
//-- Valida associação do campo do Layout a mais de um campo do Banco
//-------------------------------------------------------------------
Procedure TValidaLayout.ValidaAssociacao ( Layout : Integer );
Begin

  Fqry_aux.SQL.Clear;

  Fqry_aux.SQL.Add ('SELECT CD_ARQUIVO, SQ_CAMPO FROM FI_LAYOUT_ARQUIVO_TABELA');
  Fqry_aux.SQL.Add (' WHERE CD_ARQUIVO = ' + inttostr( Layout ) );
  Fqry_aux.SQL.Add ('GROUP BY CD_ARQUIVO, SQ_CAMPO');
  Fqry_aux.SQL.Add ('HAVING SUM(1) > 1');
  Fqry_aux.Open;

  If not Fqry_aux.IsEmpty Then
     WMensagem.SetMsgErro('Em layouts para exportação não é permitida a vinculação de campos a mais de um campo do sistema.');

  Fqry_aux.Close;

End;

end.
