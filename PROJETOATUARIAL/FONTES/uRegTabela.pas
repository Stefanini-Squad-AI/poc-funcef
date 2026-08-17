unit uRegTabela;

interface

uses Classes, DBTables, SysUtils;

Type TRegTabela = Class
     NO_TABELA          : array [1..50] of String;
     NO_ATRIBUTO_TABELA : array [1..50] of String;
     IR_E_CHAVE         : array [1..50] of String;
     IR_E_FK            : array [1..50] of String;
     TP_ATRIBUTO        : array [1..50] of String;
     VL_CAMPO           : array [1..50] of String;
Private
     FOrdemTabs  : TStringList;
     FTamReg     : integer;

     Fqry : TQuery;

     Procedure GetOrdemTabs;
     Procedure GetTabela;
Public
     // Armazena o tamanho do Layout
     property OrdemTabs : TStringList read FOrdemTabs;

     Constructor Create (AOWner : TComponent);
     Destructor Destroy; override;
End;


implementation

//--------------------------------------------------------
//-- Constroi a Classe TRegLayout
//--------------------------------------------------------
Constructor TRegTabela.Create (AOwner : TComponent);
Begin

  Inherited Create;

  //-- Cria String List de armazenamento da ordem de importacao
  FOrdemTabs := TStringList.Create;

  //-- Cria Query de Trabalho
  Fqry := TQuery.Create(AOwner);
  Fqry.DataBaseName := 'BaseDados';

  //-- Seta Propriedades da Classe
  GetOrdemTabs;

  //-- Carrega tabelas
  GetTabela;

End;

//--------------------------------------------------------
//-- Destroy da Classe
//--------------------------------------------------------
Destructor TRegTabela.Destroy;
Begin
  Inherited Destroy;
End;

//---------------------------------------------------------------
//-- Seta ordem de importação das Tabelas do Sistema
//---------------------------------------------------------------
Procedure TRegTabela.GetOrdemTabs;
Begin
  //-- Lê ordem de importação
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT NO_TABELA FROM FI_TABELA');
  Fqry.SQL.Add ('WHERE SQ_ATUALIZACAO IS NOT NULL');
  Fqry.SQL.Add ('ORDER BY SQ_ATUALIZACAO');
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Não foi estabelecida ordem de importação para as tabelas do Sistema');
     End
  Else
     Begin
       While not Fqry.EOF Do
         Begin
           FOrdemTabs.Add ( Fqry.FieldByName('NO_TABELA').AsString );
           Fqry.Next
         End;
       FOrdemTabs.Add ('');
       Fqry.Close;
     End;
End;

//---------------------------------------------------------------
//-- Lê Tabelas e seus campos
//---------------------------------------------------------------
procedure TRegTabela.GetTabela;
Var WI : Integer;
Begin
  //-- Lê campos das Tabelas
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT DISTINCT A.NO_TABELA, A.NO_ATRIBUTO_TABELA,');
  Fqry.SQL.Add ('DECODE(B.NO_ATRIBUTO_TABELA,NULL,' + #39 + 'N' + #39 + ',' + #39 + 'S' + #39 + ') IR_E_CHAVE,');
  Fqry.SQL.Add ('DECODE(C.NO_ATRIBUTO_TABELA,NULL,' + #39 + 'N' + #39 + ',' + #39 + 'S' + #39 + ') IR_E_FK,');
  Fqry.SQL.Add ('A.TP_ATRIBUTO');
  Fqry.SQL.Add ('FROM FI_ATRIBUTO_TABELA A, FI_PK_TABELA B, FI_FK_TABELA C');
  Fqry.SQL.Add ('WHERE A.NO_TABELA = B.NO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_ATRIBUTO_TABELA = B.NO_ATRIBUTO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_TABELA = C.NO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_ATRIBUTO_TABELA = C.NO_ATRIBUTO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_TABELA IN');
  Fqry.SQL.Add ('   ( SELECT DISTINCT D.NO_TABELA FROM FI_ATRIBUTO_TABELA D');
  Fqry.SQL.Add ('      WHERE D.CD_GRUPO IS NOT NULL )');
  Fqry.SQL.Add ('ORDER BY 1,2');
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Não foram encontradas as definições das tabelas. Problema de instalação do Software;');
     End
 Else
     Begin
       FTamReg := Fqry.RecordCount;
       //-- Carrega array de vinculacao padrão
       WI := 1;
       While not Fqry.Eof do
         Begin
           NO_TABELA[WI]          := Fqry.FieldByName('NO_TABELA').AsString;
           NO_ATRIBUTO_TABELA[WI] := Fqry.FieldByName('NO_ATRIBUTO_TABELA').AsString;
           IR_E_CHAVE[WI]         := Fqry.FieldByName('IR_E_CHAVE').AsString;
           IR_E_FK[WI]            := Fqry.FieldByName('IR_E_FK').AsString;
           TP_ATRIBUTO[WI]        := Fqry.FieldByName('TP_ATRIBUTO').AsString;
           VL_CAMPO[WI]           := '';
           Fqry.Next;
           WI := WI + 1;
         End;
       Fqry.Close;
    End;
End;

end.
