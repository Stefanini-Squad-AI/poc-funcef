# Scripts de banco de dados — TemplateBase

DDL do domínio de exemplo (Cliente/Ordem) no schema `TEMPLATETESTE`, no padrão
**PadraoBD v2.2 (CODAN)** — a mesma convenção do repositório `script-banco-dados`:

- Tabelas: prefixo `TB_` + plural, `UPPERCASE_UNDERSCORE`.
- Constraints **sem** prefixo `TB_`: `PK_`, `FK_`, `UK_`, `CK_`; índices `IDX_`.
- Coluna de controle `DATA_INCLUSAO_ALTERACAO DATE DEFAULT SYSDATE NOT NULL` em toda tabela
  (setada pela aplicação no create **e** no update).
- `COMMENT ON` obrigatório em tabela e colunas.
- Booleanos: `NUMBER(1)` com check `IN (0,1)` (ADR-017) — não usados neste domínio.

## Estrutura

| Pasta | Conteúdo | Ambiente |
|---|---|---|
| `00-schema/` | Criação de usuário/schema (`TEMPLATETESTE`, `LOG_AUDIT` + `SVC_LOG_AUDIT`) | **Somente dev local** (Docker) |
| `01-tabelas/` | `TB_CLIENTES`, `TB_ORDENS` | Todos (via DBA/Liquibase no corporativo) |
| `02-indices/` | Índices de apoio de `TB_ORDENS` | Todos (via DBA/Liquibase no corporativo) |

No corporativo, mudanças de banco seguem o fluxo DB-as-Code (Liquibase + PR);
estes arquivos são a fonte para os changesets. O schema `LOG_AUDIT` local é uma
réplica mínima do Oracle Lakehouse de auditoria (somente tabelas HOT + views).

## Aplicação no Oracle local (Docker)

Container `oracle-db` (imagem `gvenzl/oracle-free`, PDB `FREEPDB1`, porta 1521):

```bash
docker cp scripts/banco-dados oracle-db:/tmp/ddl
docker exec -it oracle-db sqlplus sys/<senha>@FREEPDB1 as sysdba
SQL> @/tmp/ddl/00-schema/001_SCHEMA_TEMPLATETESTE.sql
SQL> @/tmp/ddl/00-schema/002_SCHEMA_LOG_AUDIT.sql
SQL> @/tmp/ddl/01-tabelas/001_TB_CLIENTES.sql
SQL> @/tmp/ddl/01-tabelas/002_TB_ORDENS.sql
SQL> @/tmp/ddl/02-indices/002_TB_ORDENS.sql
```

A aplicação (EF Core/Dapper) é **DDL-first**: não há migrations no projeto; o
`AddFuncefORMDevelopment` apenas executa os seeders (`ClienteSeeder`/`OrdemSeeder`)
quando o schema já existe.
