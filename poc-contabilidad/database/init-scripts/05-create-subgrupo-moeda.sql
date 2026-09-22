-- ================================================================
-- FUNCEF POC - Tablas SUBGRUPO y MOEDA
-- Migração de: FCadContasContabMT.pas → CdsSubGrupo / CdsMoeda
--   dblkSubGrupo1..4 (TwwDBLookupCombo) → LookupTable = CdsSubGrupo
--   dblkMoeda (TwwDBLookupCombo) → LookupTable = CdsMoeda
-- ================================================================

-- Conectar como usuario CM
CONNECT CM/cm_password@FREEPDB1;

-- ================================================================
-- SEQUENCES
-- ================================================================

CREATE SEQUENCE CM.SEQ_SUBGRUPO
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE CM.SEQ_MOEDA
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- ================================================================
-- TABLA: SUBGRUPO (Sub-Grupos Contábeis)
-- Migração de: FCadContasContabMT.pas → CdsSubGrupo
--   dblkSubGrupo1..4 (TwwDBLookupCombo) → LookupTable = CdsSubGrupo
--   Selected.Strings = ('DESCSUBGRP'#9'25'#9'Descrição')
--   LookupField = 'CODSUBGRP'
-- ================================================================

CREATE TABLE CM.SUBGRUPO (
    CODSUBGRP NUMBER(10) NOT NULL,
    DESCSUBGRP VARCHAR2(100) NOT NULL,
    DTINCLUSAO DATE DEFAULT SYSDATE,
    DTALTERACAO DATE,
    CONSTRAINT PK_SUBGRUPO PRIMARY KEY (CODSUBGRP)
);

COMMENT ON TABLE CM.SUBGRUPO IS 'Sub-grupos contábeis (legacy: SUBGRUPO)';
COMMENT ON COLUMN CM.SUBGRUPO.CODSUBGRP IS 'Código único do sub-grupo (PK)';
COMMENT ON COLUMN CM.SUBGRUPO.DESCSUBGRP IS 'Descrição do sub-grupo';

CREATE INDEX IDX_SUBGRUPO_DESC ON CM.SUBGRUPO(DESCSUBGRP);

-- Seed data
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (1, 'Circulante');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (2, 'Não Circulante');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (3, 'Realizável a Longo Prazo');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (4, 'Permanente');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (5, 'Investimentos');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (6, 'Imobilizado');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (7, 'Intangível');
INSERT INTO CM.SUBGRUPO (CODSUBGRP, DESCSUBGRP) VALUES (8, 'Diferido');

COMMIT;

-- ================================================================
-- TABLA: MOEDA (Moedas)
-- Migração de: FCadContasContabMT.pas → CdsMoeda
--   dblkMoeda (TwwDBLookupCombo) → LookupTable = CdsMoeda
--   Selected.Strings = ('MOEDESC'#9'20'#9'MOEDESC')
--   LookupField = 'MOECODIGO'
-- ================================================================

CREATE TABLE CM.MOEDA (
    MOECODIGO NUMBER(10) NOT NULL,
    MOEDESC VARCHAR2(50) NOT NULL,
    MOESIGLA VARCHAR2(10),
    DTINCLUSAO DATE DEFAULT SYSDATE,
    DTALTERACAO DATE,
    CONSTRAINT PK_MOEDA PRIMARY KEY (MOECODIGO)
);

COMMENT ON TABLE CM.MOEDA IS 'Moedas (legacy: MOEDA)';
COMMENT ON COLUMN CM.MOEDA.MOECODIGO IS 'Código único da moeda (PK)';
COMMENT ON COLUMN CM.MOEDA.MOEDESC IS 'Descrição da moeda';
COMMENT ON COLUMN CM.MOEDA.MOESIGLA IS 'Sigla da moeda (ex: R$, US$, EUR)';

CREATE INDEX IDX_MOEDA_DESC ON CM.MOEDA(MOEDESC);

-- Seed data
INSERT INTO CM.MOEDA (MOECODIGO, MOEDESC, MOESIGLA) VALUES (1, 'Real', 'R$');
INSERT INTO CM.MOEDA (MOECODIGO, MOEDESC, MOESIGLA) VALUES (2, 'Dólar Americano', 'US$');
INSERT INTO CM.MOEDA (MOECODIGO, MOEDESC, MOESIGLA) VALUES (3, 'Euro', 'EUR');
INSERT INTO CM.MOEDA (MOECODIGO, MOEDESC, MOESIGLA) VALUES (4, 'Unidade Fiscal', 'UFIR');
INSERT INTO CM.MOEDA (MOECODIGO, MOEDESC, MOESIGLA) VALUES (5, 'Índice de Preços', 'IPCA');

COMMIT;

EXIT;
