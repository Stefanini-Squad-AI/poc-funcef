-- =============================================================================================
-- TemplateBase - Registro do sistema "Template" no GAP (schema GAP, banco do api-ms-gap)
-- ---------------------------------------------------------------------------------------------
-- Cadastra o que o GAP precisa para autorizar o template e servir o menu efetivo
-- (GET /auth/menu/me com Auth:Autorizacao:CodigoSistema = "Template"):
--   1. Sistema  'Template' (app registration TemplateFuncef, area CONAP)
--   2. Permissoes Funcef.Template/* (read/write por recurso + wildcard administrativa)
--   3. Grupo de acesso GFUNCEF_CONAP_AllUsers espelhado do Entra para o sistema Template
--   4. Vinculo grupo -> wildcard (membros do grupo tem acesso total ao template)
--   5. Menu em dois niveis (secoes sem rota + itens com rota e permissao de leitura)
--
-- NOTA (2026-07-30): o dominio de exemplo EventoIntegracao (SQL Server) foi removido do template;
-- as acoes Funcef.Template/eventos-integracao/* e o item de menu "Eventos de Integracao" sairam
-- deste script. Em ambientes ja semeados, desative os registros antigos com FLAG_ATIVO = 0
-- (padrao dos seeds do GAP: acoes obsoletas nunca sao deletadas).
--
-- Idempotente (NOT EXISTS / MERGE por chave de negocio, comparacao case-insensitive via UPPER).
-- Rotulos acentuados usam UNISTR para manter o arquivo ASCII-safe (padrao dos seeds do GAP).
-- Executar como usuario com INSERT no schema GAP (dev Docker: sqlplus / as sysdba + FREEPDB1).
-- Em ambientes promovidos, este conteudo deve virar changeset Liquibase no repo do GAP.
-- =============================================================================================

-- 1. Sistema Template (area CONAP = COD_AREA '71454'; app registration TemplateFuncef)
INSERT INTO GAP.TB_SISTEMAS (COD_SISTEMA, NOME_SISTEMA, DESC_SISTEMA, AREA_ID,
                             ID_CLIENTE_APLICACAO, LINK_PRINCIPAL, FLAG_ATIVO)
SELECT 'Template',
       'Template Base - Microsservico de Referencia',
       'API de referencia (api-template-base) usada como base dos microsservicos FUNCEF.',
       (SELECT AREA_ID FROM GAP.TB_AREAS WHERE COD_AREA = '71454'),
       '4d632f1b-4fb8-43ed-8bfc-354625377a31',
       'https://localhost:56055/dashboard.html',
       1
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM GAP.TB_SISTEMAS WHERE UPPER(COD_SISTEMA) = UPPER('Template'));

-- 2. Permissoes do template (acoes canonicas Funcef.Template/<recurso>/<verbo>)
INSERT INTO GAP.TB_PERMISSOES (SISTEMA_ID, ACAO_PERMISSAO, DESC_PERMISSAO, CLASSIFICACAO_SENSIBILIDADE, FLAG_ATIVO)
SELECT s.SISTEMA_ID, p.ACAO, p.DESCRICAO, p.SENSIBILIDADE, 1
FROM GAP.TB_SISTEMAS s
CROSS JOIN (
    SELECT 'Funcef.Template/clientes/read'            AS ACAO, 'Consultar clientes'                          AS DESCRICAO, 'INTERNA'  AS SENSIBILIDADE FROM DUAL UNION ALL
    SELECT 'Funcef.Template/clientes/write',                   'Criar, alterar e excluir clientes',                        'INTERNA'  FROM DUAL UNION ALL
    SELECT 'Funcef.Template/ordens/read',                      'Consultar ordens',                                         'INTERNA'  FROM DUAL UNION ALL
    SELECT 'Funcef.Template/ordens/write',                     'Criar, alterar e excluir ordens',                          'INTERNA'  FROM DUAL UNION ALL
    SELECT 'Funcef.Template/**',                               'Acesso total ao template (wildcard administrativa)',       'SENSIVEL' FROM DUAL
) p
WHERE UPPER(s.COD_SISTEMA) = UPPER('Template')
  AND NOT EXISTS (
      SELECT 1 FROM GAP.TB_PERMISSOES x
      WHERE x.SISTEMA_ID = s.SISTEMA_ID AND UPPER(x.ACAO_PERMISSAO) = UPPER(p.ACAO)
  );

-- 3. Grupo de acesso (espelho do grupo Entra GFUNCEF_CONAP_AllUsers, o mesmo admin do GAP)
INSERT INTO GAP.TB_GRUPOS_ACESSO (SISTEMA_ID, ID_OBJETO_ENTRA, NOME_GRUPO_ACESSO, TIPO_GRUPO_ACESSO, FLAG_ATIVO)
SELECT s.SISTEMA_ID, '69ba6e1c-4e8c-4c62-869c-1b9d5053ad84', 'GFUNCEF_CONAP_AllUsers', 'GRUPO', 1
FROM GAP.TB_SISTEMAS s
WHERE UPPER(s.COD_SISTEMA) = UPPER('Template')
  AND NOT EXISTS (
      SELECT 1 FROM GAP.TB_GRUPOS_ACESSO x
      WHERE x.SISTEMA_ID = s.SISTEMA_ID
        AND UPPER(x.ID_OBJETO_ENTRA) = UPPER('69ba6e1c-4e8c-4c62-869c-1b9d5053ad84')
  );

-- 4. Vinculo grupo -> wildcard Funcef.Template/**
INSERT INTO GAP.TB_GRUPO_ACESSO_PERMISSAO (GRUPO_ACESSO_ID, PERMISSAO_ID)
SELECT ga.GRUPO_ACESSO_ID, pe.PERMISSAO_ID
FROM GAP.TB_GRUPOS_ACESSO ga
JOIN GAP.TB_SISTEMAS s    ON s.SISTEMA_ID = ga.SISTEMA_ID AND UPPER(s.COD_SISTEMA) = UPPER('Template')
JOIN GAP.TB_PERMISSOES pe ON pe.SISTEMA_ID = s.SISTEMA_ID AND UPPER(pe.ACAO_PERMISSAO) = UPPER('Funcef.Template/**')
WHERE UPPER(ga.ID_OBJETO_ENTRA) = UPPER('69ba6e1c-4e8c-4c62-869c-1b9d5053ad84')
  AND NOT EXISTS (
      SELECT 1 FROM GAP.TB_GRUPO_ACESSO_PERMISSAO x
      WHERE x.GRUPO_ACESSO_ID = ga.GRUPO_ACESSO_ID AND x.PERMISSAO_ID = pe.PERMISSAO_ID
  );

-- 5.1. Secoes do menu (agrupadores raiz: sem rota, sem permissao). "Painel" fica fora (item raiz).
INSERT INTO GAP.TB_ITENS_MENU (SISTEMA_ID, ITEM_MENU_PAI_ID, PERMISSAO_ID, ROTULO_ITEM_MENU, ROTA_ITEM_MENU, ICONE_ITEM_MENU, ORDEM_ITEM_MENU, FLAG_ATIVO, DATA_INCLUSAO_ALTERACAO)
SELECT s.SISTEMA_ID, NULL, NULL, g.ROTULO, NULL, NULL, g.ORDEM, 1, SYSTIMESTAMP
FROM GAP.TB_SISTEMAS s
CROSS JOIN (
    SELECT 'CADASTROS'                                AS ROTULO, 2 AS ORDEM FROM DUAL
) g
WHERE UPPER(s.COD_SISTEMA) = UPPER('Template')
  AND NOT EXISTS (
      SELECT 1 FROM GAP.TB_ITENS_MENU x
      WHERE x.SISTEMA_ID = s.SISTEMA_ID
        AND x.ROTA_ITEM_MENU IS NULL
        AND x.ROTULO_ITEM_MENU = g.ROTULO
  );

-- 5.2. Itens de menu (com rota), filhos das secoes. MERGE insere novos e realinha existentes.
MERGE INTO GAP.TB_ITENS_MENU t
USING (
    SELECT s.SISTEMA_ID,
           sec.ITEM_MENU_ID AS PAI_ID,
           pe.PERMISSAO_ID,
           m.ROTULO, m.ROTA, m.ICONE, m.ORDEM
    FROM GAP.TB_SISTEMAS s
    CROSS JOIN (
        SELECT 'Painel' AS ROTULO, '/dashboard.html' AS ROTA, 'LayoutDashboardIcon' AS ICONE, 1 AS ORDEM,
               CAST(NULL AS VARCHAR2(200)) AS ACAO, CAST(NULL AS VARCHAR2(50)) AS SECAO                                             FROM DUAL UNION ALL
        SELECT 'Clientes',                                  '/clientes',            'UsersIcon',        1, 'Funcef.Template/clientes/read',           'CADASTROS'                            FROM DUAL UNION ALL
        SELECT 'Ordens',                                    '/ordens',              'ClipboardListIcon',2, 'Funcef.Template/ordens/read',             'CADASTROS'                            FROM DUAL
    ) m
    LEFT JOIN GAP.TB_PERMISSOES pe
           ON pe.SISTEMA_ID = s.SISTEMA_ID AND UPPER(pe.ACAO_PERMISSAO) = UPPER(m.ACAO)
    LEFT JOIN GAP.TB_ITENS_MENU sec
           ON sec.SISTEMA_ID = s.SISTEMA_ID AND sec.ROTA_ITEM_MENU IS NULL AND sec.ROTULO_ITEM_MENU = m.SECAO
    WHERE UPPER(s.COD_SISTEMA) = UPPER('Template')
) src
ON (t.SISTEMA_ID = src.SISTEMA_ID AND t.ROTA_ITEM_MENU = src.ROTA)
WHEN MATCHED THEN UPDATE SET
    t.ITEM_MENU_PAI_ID        = src.PAI_ID,
    t.PERMISSAO_ID            = src.PERMISSAO_ID,
    t.ROTULO_ITEM_MENU        = src.ROTULO,
    t.ICONE_ITEM_MENU         = src.ICONE,
    t.ORDEM_ITEM_MENU         = src.ORDEM,
    t.DATA_INCLUSAO_ALTERACAO = SYSTIMESTAMP
WHEN NOT MATCHED THEN INSERT
    (SISTEMA_ID, ITEM_MENU_PAI_ID, PERMISSAO_ID, ROTULO_ITEM_MENU, ROTA_ITEM_MENU, ICONE_ITEM_MENU, ORDEM_ITEM_MENU, FLAG_ATIVO, DATA_INCLUSAO_ALTERACAO)
VALUES
    (src.SISTEMA_ID, src.PAI_ID, src.PERMISSAO_ID, src.ROTULO, src.ROTA, src.ICONE, src.ORDEM, 1, SYSTIMESTAMP);

COMMIT;
