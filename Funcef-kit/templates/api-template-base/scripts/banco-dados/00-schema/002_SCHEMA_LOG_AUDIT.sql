/*============================================================================
Projeto........: TemplateBase
Sistema........: Auditoria FUNCEF (FUNCEF.ORM.Audit + FUNCEF.Autenticacao.AccessAudit)
Schema.........: LOG_AUDIT
Tipo...........: Schema/Tabelas/Views/Usuário de serviço (SOMENTE dev local)
Descrição......: Réplica local mínima do Oracle Lakehouse de auditoria usada
                 pelos componentes FUNCEF (LOG_AUDIT.REGISTRO_LOG,
                 LOG_AUDIT.ACESSO_LOG e views de consumo). No corporativo o
                 lakehouse é provisionado via oracle-db-as-code (tabelas HOT
                 particionadas + external tables COLD) — NÃO executar este
                 script fora do ambiente local.
                 Requer Oracle 23ai+ (BOOLEAN nativo e tipo JSON).
Autor..........: Roberto Oliveira
Data...........: 14/07/2026
Versão.........: 1.0
Alterações.....: Criação inicial (colunas alinhadas aos stores das libs
                 FuncefORM.Audit/OracleAuditStore e
                 FuncefAutenticacao.AccessAudit/OracleAccessAuditStore).
============================================================================*/

-- Executar conectado ao PDB FREEPDB1 como SYS/SYSTEM.
-- Senhas de uso exclusivamente local (container Docker de desenvolvimento).

-- 1. Schema proprietário
CREATE USER LOG_AUDIT IDENTIFIED BY "LogAudit#2026"
    DEFAULT TABLESPACE USERS
    QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION TO LOG_AUDIT;
GRANT CREATE TABLE TO LOG_AUDIT;
GRANT CREATE VIEW TO LOG_AUDIT;

-- 2. Trilha de auditoria de entidades (FUNCEF.ORM.Audit)
CREATE TABLE LOG_AUDIT.REGISTRO_LOG (
    ID_LOG              VARCHAR2(50 BYTE) NOT NULL,
    DATA_EVENTO         TIMESTAMP(6) DEFAULT SYSTIMESTAMP NOT NULL,
    OPERATION           VARCHAR2(20 BYTE),
    ENTITY_NAME         VARCHAR2(100 BYTE),
    USER_EMAIL          VARCHAR2(255 BYTE),
    CORRELATION_ID      VARCHAR2(100 BYTE),
    CONTEUDO_JSON       JSON,
    ORIGEM_GERACAO_LOG  VARCHAR2(5 BYTE),

    CONSTRAINT PK_REGISTRO_LOG
        PRIMARY KEY (ID_LOG)
);

COMMENT ON TABLE LOG_AUDIT.REGISTRO_LOG IS
'Trilha de auditoria de entidades [Auditable] gravada pelo FUNCEF.ORM.Audit. Granularidade: 1 linha = 1 operação sobre 1 entidade.';

-- 3. Trilha de auditoria de acesso (FUNCEF.Autenticacao.AccessAudit)
CREATE TABLE LOG_AUDIT.ACESSO_LOG (
    ID_LOG              VARCHAR2(100 BYTE) DEFAULT LOWER(RAWTOHEX(SYS_GUID())) NOT NULL,
    SUBJECT             VARCHAR2(255 BYTE),
    ISSUER              VARCHAR2(1000 BYTE),
    AUTH_TYPE           VARCHAR2(50 BYTE),
    AUTH_SCHEME         VARCHAR2(50 BYTE),
    IS_SUCCESS          BOOLEAN,
    FAILURE_REASON      VARCHAR2(1000 BYTE),
    ERROR_DETAILS       CLOB,
    DATA_ACESSO         TIMESTAMP(6) WITH TIME ZONE,
    IP_ADDRESS          VARCHAR2(45 BYTE),
    USER_AGENT          VARCHAR2(1000 BYTE),
    CLAIMS_JSON         CLOB,
    METADATA_JSON       CLOB,
    ORIGEM_GERACAO_LOG  VARCHAR2(5 BYTE),

    CONSTRAINT PK_ACESSO_LOG
        PRIMARY KEY (ID_LOG),

    CONSTRAINT CK_ACESSO_LOG_CLAIMS_JSON
        CHECK (CLAIMS_JSON IS JSON),

    CONSTRAINT CK_ACESSO_LOG_METADATA_JSON
        CHECK (METADATA_JSON IS JSON)
);

COMMENT ON TABLE LOG_AUDIT.ACESSO_LOG IS
'Trilha de auditoria de acesso (login/authN) gravada pelo FUNCEF.Autenticacao.AccessAudit. Granularidade: 1 linha = 1 evento de acesso.';

-- 4. Views de consumo (no corporativo unem HOT + COLD; aqui somente HOT)
CREATE OR REPLACE VIEW LOG_AUDIT.VW_REGISTRO_GERAL (
    ID_LOG, DATA_EVENTO, OPERATION, ENTITY_NAME, USER_EMAIL,
    CORRELATION_ID, ORIGEM_GERACAO_LOG, CONTEUDO_JSON, SOURCE
) AS
SELECT
    ID_LOG,
    CAST(DATA_EVENTO AS TIMESTAMP) AS DATA_EVENTO,
    CAST(OPERATION AS VARCHAR2(20)) AS OPERATION,
    CAST(ENTITY_NAME AS VARCHAR2(100)) AS ENTITY_NAME,
    CAST(USER_EMAIL AS VARCHAR2(255)) AS USER_EMAIL,
    CAST(CORRELATION_ID AS VARCHAR2(100)) AS CORRELATION_ID,
    CAST(ORIGEM_GERACAO_LOG AS VARCHAR2(5)) AS ORIGEM_GERACAO_LOG,
    TO_CLOB(JSON_SERIALIZE(CONTEUDO_JSON)) AS CONTEUDO_JSON,
    'HOT' AS SOURCE
FROM LOG_AUDIT.REGISTRO_LOG;

CREATE OR REPLACE VIEW LOG_AUDIT.VW_ACESSO_GERAL (
    ID_LOG, SUBJECT, ISSUER, AUTH_TYPE, AUTH_SCHEME, IS_SUCCESS,
    FAILURE_REASON, ERROR_DETAILS, DATA_ACESSO, IP_ADDRESS, USER_AGENT,
    ORIGEM_GERACAO_LOG, CLAIMS_JSON, METADATA_JSON, SOURCE
) AS
SELECT
    ID_LOG, SUBJECT, ISSUER, AUTH_TYPE, AUTH_SCHEME, IS_SUCCESS,
    FAILURE_REASON, ERROR_DETAILS, DATA_ACESSO, IP_ADDRESS, USER_AGENT,
    CAST(ORIGEM_GERACAO_LOG AS VARCHAR2(5)) AS ORIGEM_GERACAO_LOG,
    CLAIMS_JSON, METADATA_JSON,
    'HOT' AS SOURCE
FROM LOG_AUDIT.ACESSO_LOG;

-- 5. Usuário de serviço usado pelas aplicações (segredo AuditOracle no Key Vault)
CREATE USER SVC_LOG_AUDIT IDENTIFIED BY "SvcLogAudit#2026";

GRANT CREATE SESSION TO SVC_LOG_AUDIT;
GRANT INSERT, SELECT ON LOG_AUDIT.REGISTRO_LOG TO SVC_LOG_AUDIT;
GRANT INSERT, SELECT ON LOG_AUDIT.ACESSO_LOG TO SVC_LOG_AUDIT;
GRANT SELECT ON LOG_AUDIT.VW_REGISTRO_GERAL TO SVC_LOG_AUDIT;
GRANT SELECT ON LOG_AUDIT.VW_ACESSO_GERAL TO SVC_LOG_AUDIT;
