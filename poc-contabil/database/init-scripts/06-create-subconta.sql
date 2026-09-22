-- ============================================================
-- 06-create-subconta.sql
-- Cria tabelas SUBCONTA (maestro) e CONTASXSUBC (relação)
-- Migração de: FCadContasContabMT.pas → TabSheet5 (Conta x Sub-Conta)
--   CdsSubConta  → SUBCONTA  (grid esquerdo: sub-contas disponíveis)
--   CdsContasxSC → CONTASXSUBC (grid direito: sub-contas associadas)
-- ============================================================

CONNECT CM/cm_password@FREEPDB1;

-- ─── Tabla SUBCONTA (maestro de sub-contas) ───
CREATE TABLE CM.SUBCONTA (
    IDPESSOA      NUMBER(10)   NOT NULL,
    CODSUBCONTA   NUMBER(10)   NOT NULL,
    NOMESUBCONTA  VARCHAR2(60) NOT NULL,
    ATIVO         VARCHAR2(1)  DEFAULT 'S' NOT NULL,
    CONSTRAINT PK_SUBCONTA PRIMARY KEY (IDPESSOA, CODSUBCONTA)
);

COMMENT ON TABLE  CM.SUBCONTA IS 'Maestro de Sub-Contas (migrado de FCadSubContaMT.pas)';
COMMENT ON COLUMN CM.SUBCONTA.IDPESSOA     IS 'ID da empresa/pessoa (FK PESSOA)';
COMMENT ON COLUMN CM.SUBCONTA.CODSUBCONTA  IS 'Código da sub-conta';
COMMENT ON COLUMN CM.SUBCONTA.NOMESUBCONTA IS 'Nome da sub-conta';
COMMENT ON COLUMN CM.SUBCONTA.ATIVO        IS 'Ativo: S=Sim, N=Não';

-- ─── Tabla CONTASXSUBC (relação Conta × Sub-Conta) ───
CREATE TABLE CM.CONTASXSUBC (
    IDPESSOA      NUMBER(10)   NOT NULL,
    IDUSUARIO     NUMBER(10)   DEFAULT 0,
    PLANO         NUMBER(10)   NOT NULL,
    PLACONTA      VARCHAR2(20) NOT NULL,
    CODSUBCONTA   NUMBER(10)   NOT NULL,
    NOMESUBCONTA  VARCHAR2(60) NOT NULL,
    DTINCLUSAO    DATE         DEFAULT SYSDATE,
    CONSTRAINT PK_CONTASXSUBC PRIMARY KEY (IDPESSOA, PLANO, PLACONTA, CODSUBCONTA)
);

COMMENT ON TABLE  CM.CONTASXSUBC IS 'Relação Conta Contábil × Sub-Conta (migrado de CdsContasxSC)';
COMMENT ON COLUMN CM.CONTASXSUBC.IDPESSOA     IS 'ID da empresa/pessoa';
COMMENT ON COLUMN CM.CONTASXSUBC.IDUSUARIO    IS 'ID do usuário que incluiu';
COMMENT ON COLUMN CM.CONTASXSUBC.PLANO        IS 'Plano contábil';
COMMENT ON COLUMN CM.CONTASXSUBC.PLACONTA     IS 'Código da conta contábil';
COMMENT ON COLUMN CM.CONTASXSUBC.CODSUBCONTA  IS 'Código da sub-conta';
COMMENT ON COLUMN CM.CONTASXSUBC.NOMESUBCONTA IS 'Nome da sub-conta (denormalizado)';
COMMENT ON COLUMN CM.CONTASXSUBC.DTINCLUSAO   IS 'Data de inclusão';

-- ─── Seed data: Sub-Contas para empresa 1 ───
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  1, 'Sub-Conta 001 - Projetos',           'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  2, 'Sub-Conta 002 - Departamentos',      'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  3, 'Sub-Conta 003 - Filiais',            'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  4, 'Sub-Conta 004 - Centros de Resultado','S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  5, 'Sub-Conta 005 - Unidades de Negócio', 'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  6, 'Sub-Conta 006 - Regiões',            'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  7, 'Sub-Conta 007 - Setores',            'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  8, 'Sub-Conta 008 - Linhas de Produto',  'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1,  9, 'Sub-Conta 009 - Clientes Especiais', 'S');
INSERT INTO CM.SUBCONTA (IDPESSOA, CODSUBCONTA, NOMESUBCONTA, ATIVO) VALUES (1, 10, 'Sub-Conta 010 - Fornecedores',       'S');

COMMIT;

EXIT;
