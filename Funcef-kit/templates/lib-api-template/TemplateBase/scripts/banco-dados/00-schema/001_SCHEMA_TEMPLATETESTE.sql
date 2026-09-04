/*============================================================================
Projeto........: TemplateBase
Sistema........: TemplateBase API (domínio de exemplo Cliente/Ordem)
Schema.........: TEMPLATETESTE
Tipo...........: Schema/Usuário (SOMENTE ambiente local de desenvolvimento)
Descrição......: Criação do usuário/schema TEMPLATETESTE no Oracle local
                 (container Docker gvenzl/oracle-free, PDB FREEPDB1).
                 Em ambientes corporativos o schema é provisionado pelo DBA —
                 NÃO executar este script fora do ambiente local.
Autor..........: Roberto Oliveira
Data...........: 14/07/2026
Versão.........: 1.0
Alterações.....: Criação inicial.
============================================================================*/

-- Executar conectado ao PDB FREEPDB1 como SYS/SYSTEM.
-- A senha é de uso exclusivamente local (container Docker de desenvolvimento).

CREATE USER TEMPLATETESTE IDENTIFIED BY "Template#2026"
    DEFAULT TABLESPACE USERS
    QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION TO TEMPLATETESTE;
GRANT CREATE TABLE TO TEMPLATETESTE;
GRANT CREATE VIEW TO TEMPLATETESTE;
GRANT CREATE SEQUENCE TO TEMPLATETESTE;
