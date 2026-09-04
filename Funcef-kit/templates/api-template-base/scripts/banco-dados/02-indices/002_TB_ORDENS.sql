/*============================================================================
Projeto........: TemplateBase
Sistema........: TemplateBase API (domínio de exemplo Cliente/Ordem)
Schema.........: TEMPLATETESTE
Entidade.......: TB_ORDENS
Tipo...........: Índices
Descrição......: Índices de apoio à chave estrangeira e às consultas por
                 status e por data do pedido da tabela TB_ORDENS.
Autor..........: Roberto Oliveira
Data...........: 14/07/2026
Versão.........: 1.0
Alterações.....: Criação inicial conforme PadraoBD v2.2 (prefixo IDX_,
                 nome sem prefixo TB_).
============================================================================*/

-- Apoio à FK_ORDENS_CLIENTES (consultas de ordens por cliente)
CREATE INDEX TEMPLATETESTE.IDX_ORDENS_CLIENTE_ID
    ON TEMPLATETESTE.TB_ORDENS (CLIENTE_ID);

-- Filtros por situação da ordem
CREATE INDEX TEMPLATETESTE.IDX_ORDENS_STATUS
    ON TEMPLATETESTE.TB_ORDENS (STATUS);

-- Ordenações e faixas por data do pedido
CREATE INDEX TEMPLATETESTE.IDX_ORDENS_DATA_PEDIDO
    ON TEMPLATETESTE.TB_ORDENS (DATA_PEDIDO);
