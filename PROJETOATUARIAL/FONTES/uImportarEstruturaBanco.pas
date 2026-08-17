{===============================================================================
Unit    :  uImportarEstruturaBanco
Form    :

Autor   : Paulo André M. de Carvalho
Empresa : Fórmula Informática Ltda.

Data    : 13/05/1999

Objetivo: Montar os SQLs para carga da estrutura do Banco de Dados nas Tabelas
          do Sistema. Implementado inicialmente para Oracle e Interbase.

Propriedades Publicadas:

Métodos Públicos:

      SetSqlLeTabs      : Seta o SQL para leitura das Tabelas do Sistema;

      SetSqlLeAtribTabs : Seta o SQL para leitura dos Atributos das Tabelas do Sistema;

      SetSqlLePkTabs    : Seta o SQL para leitura das chaves primárias das Tabelas;

      SetSqlLeFkTabs    : Seta o SQL para leitura das chaves estrangeiras das Tabelas;

Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
================================================================================}
unit uImportarEstruturaBanco;

interface

Uses SysUtils,DBTables, USistema;

Procedure SetSqlLeTabs      ( var qry : TQuery; creator : String );
Procedure SetSqlLeAtribTabs ( var qry : TQuery; creator : String );
Procedure SetSqlLePkTabs    ( var qry : TQuery; creator : String );
Procedure SetSqlLeFkTabs    ( var qry : TQuery; creator : String );

implementation

//--------------------------------------------------------------------
//-- SetSqlLeTabs
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   qry - Query ( passada por referência ) que terá a propriedade SQL
//--         atualizada com o SQL para leitura das tabelas do Sistema.
//--
//----------------------------------------------------------------------//

Procedure SetSqlLeTabs ( var qry : TQuery; creator : String );
Begin

     // Seta Sql de Banco ORACLE
     If CompareText(Sistema.DriverServidor, 'ORACLE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT TABLE_NAME NO_TABELA FROM ALL_TABLES WHERE OWNER = ' +
          #39 + creator + #39 + ' AND TABLE_NAME LIKE ' +
          #39 + 'FI%' + #39 + ' AND SUBSTR(TABLE_NAME,3,1) = ' +
          #39 + '_' + #39 + ' UNION ' +
          'SELECT VIEW_NAME NO_TABELA FROM ALL_VIEWS WHERE OWNER = ' +
          #39 + creator + #39 + ' AND VIEW_NAME LIKE ' +
          #39 + 'FI_%' + #39 + ' ORDER BY NO_TABELA'
        End;

     // Seta Sql de Banco Interbase
     If CompareText(Sistema.DriverServidor, 'INTBASE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT RDB$RELATION_NAME NO_TABELA FROM RDB$RELATIONS ' +
          'WHERE RDB$SYSTEM_FLAG <> 1'
        End;

End;

//--------------------------------------------------------------------
//-- SetSqlLeAtribTabs
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   qry - Query ( passada por referência ) que terá a propriedade SQL
//--         atualizada com o SQL para leitura das tabelas do Sistema.
//--
//----------------------------------------------------------------------//

Procedure SetSqlLeAtribTabs ( var qry : TQuery; creator : String );
Begin

     // Seta Sql de Banco ORACLE
     If CompareText(Sistema.DriverServidor, 'ORACLE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT TABLE_NAME NO_TABELA, COLUMN_NAME NO_ATRIBUTO_TABELA,' +
          'DECODE(NULLABLE,' + #39 + 'Y' + #39 + ',' + #39 + 'S' + #39 + ',' +#39 + 'N' + #39 + ') ' +
          'IR_MANDATORIO, ' +
          ' DECODE(DATA_TYPE,' + #39 + 'DATE' + #39 + ',' + #39 + 'D' + #39 +
          ',DECODE(DATA_TYPE,' + #39 + 'CHAR' + #39 + ',' + #39 + 'A' + #39 +
          ',DECODE(DATA_TYPE,' + #39 + 'VARCHAR2' + #39 + ',' + #39 + 'M' + #39 +
          ',DECODE(DATA_PRECISION,NULL,' + #39 + 'N' + #39 + ',' + #39 + 'F' + #39 + '))))' +
          'TP_ATRIBUTO, ' +
          'DATA_LENGTH NR_TAM_ATRIBUTO_TABELA, ' +
          'COLUMN_ID NR_ORDEM ' +
          'FROM ALL_TAB_COLUMNS WHERE ' +
          'OWNER = ' + #39 + creator + #39 + ' AND TABLE_NAME LIKE ' +
          #39 + 'FI%' + #39 + ' AND SUBSTR(TABLE_NAME,3,1) = ' +
          #39 + '_' + #39 + ' ORDER BY TABLE_NAME, COLUMN_ID';
        End;

     // Seta Sql de Banco Interbase
     If CompareText(Sistema.DriverServidor, 'INTBASE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT RDB$RELATION_NAME NO_TABELA,' +
          'RDB$RELATION_FIELDS.RDB$FIELD_NAME NO_ATRIBUTO_TABELA,' +
          'RDB$RELATION_FIELDS.RDB$NULL_FLAG IR_MANDATORIO,' +
          'RDB$FIELD_TYPE TIPO_CAMPO,RDB$FIELD_LENGTH NR_TAM_ATRIBUTO_TABELA,' +
          #39 + 'N' + #39 + ' IR_CARGA_OBRIGATORIA,' +
          #39 + 'N' + #39 + ' IR_ATRIBUTO_DISPONIVEL ' +
          'FROM RDB$RELATION_FIELDS, RDB$FIELDS ' +
          'WHERE RDB$RELATION_FIELDS.RDB$FIELD_SOURCE = RDB$FIELDS.RDB$FIELD_NAME ' +
          'AND RDB$SYSTEM_FLAG <> 1 ' +
          'ORDER BY 1,2'
        End;

End;

//--------------------------------------------------------------------
//-- SetSqlLePkTabs
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   qry - Query ( passada por referência ) que terá a propriedade SQL
//--         atualizada com o SQL para leitura das tabelas do Sistema.
//--
//----------------------------------------------------------------------//

Procedure SetSqlLePkTabs ( var qry : TQuery; creator : String );
Begin

     // Seta Sql de Banco ORACLE
     If CompareText(Sistema.DriverServidor, 'ORACLE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT A.TABLE_NAME NO_TABELA, A.COLUMN_NAME NO_ATRIBUTO_TABELA, ' +
          'A.CONSTRAINT_NAME NO_PK_TABELA, A.POSITION NR_ORDEM ' +
          'FROM ALL_CONS_COLUMNS A, ALL_CONSTRAINTS B WHERE ' +
          'A.OWNER = B.OWNER AND ' + 
          'A.CONSTRAINT_NAME = B.CONSTRAINT_NAME AND ' +
          'B.CONSTRAINT_TYPE = ' + #39 + 'P' + #39 + ' AND ' +
          'A.OWNER = ' + #39 + creator + #39 + ' AND ' +
          'A.TABLE_NAME LIKE ' + #39 + 'FI%' + #39 + ' AND ' +
          'A.POSITION IS NOT NULL AND ' +
          'SUBSTR(A.TABLE_NAME,3,1) = ' + #39 + '_' + #39 +
          'ORDER BY A.TABLE_NAME, A.CONSTRAINT_NAME, A.POSITION'
        End;

     // Seta Sql de Banco Interbase
     If CompareText(Sistema.DriverServidor, 'INTBASE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT A.RDB$RELATION_NAME NO_TABELA,B.RDB$FIELD_NAME NO_ATRIBUTO_TABELA,' +
          'B.RDB$FIELD_POSITION ORDEM FROM RDB$RELATION_CONSTRAINTS A, RDB$INDEX_SEGMENTS B ' +
          'WHERE A.RDB$INDEX_NAME = B.RDB$INDEX_NAME ' +
          'AND A.RDB$CONSTRAINT_TYPE = ' + #39 + 'PRIMARY KEY' + #39 +
          ' ORDER BY 1,3 ';
        End;

End;

//--------------------------------------------------------------------
//-- SetSqlLeFkTabs
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   qry - Query ( passada por referência ) que terá a propriedade SQL
//--         atualizada com o SQL para leitura das tabelas do Sistema.
//--
//----------------------------------------------------------------------//

Procedure SetSqlLeFkTabs ( var qry : TQuery; creator : String );
Begin

     // Seta Sql de Banco ORACLE
     If CompareText(Sistema.DriverServidor, 'ORACLE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=

          'SELECT C.TABLE_NAME NO_TABELA, A.NO_TABELA NO_TABELA_FK,' +
          'A.NO_ATRIBUTO_TABELA NO_ATRIBUTO_TABELA_FK,' +
          'C.COLUMN_NAME NO_ATRIBUTO_TABELA,' +
          'B.CONSTRAINT_NAME NO_FK_TABELA, A.NR_ORDEM ' +
          'FROM FI_PK_TABELA A, ALL_CONSTRAINTS B, ALL_CONS_COLUMNS C ' +
          'WHERE ' +
          'RTRIM(A.NO_PK_TABELA) = B.R_CONSTRAINT_NAME AND ' +
          'B.OWNER = C.OWNER AND ' +
          'B.OWNER = ' + #39 + creator + #39 + ' AND ' +
          'B.TABLE_NAME = C.TABLE_NAME AND ' +
          'B.CONSTRAINT_NAME = C.CONSTRAINT_NAME AND ' +
          'A.NR_ORDEM = C.POSITION AND ' +
          'B.CONSTRAINT_TYPE = ' + #39 + 'R' + #39
        End;

     // Seta Sql de Banco Interbase
     If CompareText(Sistema.DriverServidor, 'INTBASE') = 0 Then
        Begin
          qry.sql.Clear;
          qry.sql.Text :=
          'SELECT A.RDB$RELATION_NAME NO_TABELA,' +
          'D.RDB$RELATION_NAME NO_TABELA_FK,' +
          'B.RDB$FIELD_NAME    NO_ATRIBUTO_TABELA,' +
          'E.RDB$FIELD_NAME    NO_ATRIBUTO_TABELA_FK,' +
          'B.RDB$FIELD_POSITION ORDEM ' +
          'FROM RDB$RELATION_CONSTRAINTS A, ' +
          'RDB$INDEX_SEGMENTS B, ' +
          'RDB$REF_CONSTRAINTS C, ' +
          'RDB$RELATION_CONSTRAINTS D, ' +
          'RDB$INDEX_SEGMENTS E ' +
          'WHERE A.RDB$INDEX_NAME      = B.RDB$INDEX_NAME ' +
          'AND A.RDB$CONSTRAINT_NAME = C.RDB$CONSTRAINT_NAME ' +
          'AND C.RDB$CONST_NAME_UQ   = D.RDB$CONSTRAINT_NAME ' +
          'AND D.RDB$INDEX_NAME      = E.RDB$iNDEX_NAME ' +
          'AND B.RDB$FIELD_POSITION  = E.RDB$FIELD_POSITION ' +
          'AND A.RDB$CONSTRAINT_TYPE = ' + #39 +'FOREIGN KEY' + #39 +
          'ORDER BY 1,2,5'
        End;
End;

End.
