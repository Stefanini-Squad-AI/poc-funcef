CONNECT CM/cm_password@FREEPDB1;

-- ================================================================
-- 1. Drop constraints que usan valores incompatibles con EF Core
-- ================================================================

ALTER TABLE CM.PLANOCONTA DROP CONSTRAINT CHK_PLANOCONTA_INATIVA;

-- ================================================================
-- 2. Actualizar datos: PLAINATIVA 'N' -> 'A' (Activa en EF Core)
-- ================================================================

UPDATE CM.PLANOCONTA SET PLAINATIVA = 'A' WHERE PLAINATIVA = 'N';
COMMIT;

-- ================================================================
-- 3. Recrear constraint con valores correctos (A=Activa, I=Inativa)
-- ================================================================

ALTER TABLE CM.PLANOCONTA ADD CONSTRAINT CHK_PLANOCONTA_INATIVA CHECK (PLAINATIVA IN ('A','I'));
ALTER TABLE CM.PLANOCONTA MODIFY PLAINATIVA DEFAULT 'A';

-- ================================================================
-- 4. Recrear trigger de validación con sintaxis corregida
--    (INSERTING no se puede usar dentro de SQL WHERE)
-- ================================================================

CREATE OR REPLACE TRIGGER CM.TRG_VAL_PLANOCONTA
FOR INSERT OR UPDATE ON CM.PLANOCONTA
COMPOUND TRIGGER

    -- Colección para diferir la validación de unicidad (evita ORA-04091)
    TYPE t_reduz_rec IS RECORD (
        plano    CM.PLANOCONTA.PLANO%TYPE,
        placonta CM.PLANOCONTA.PLACONTA%TYPE,
        plareduz CM.PLANOCONTA.PLAREDUZ%TYPE
    );
    TYPE t_reduz_tbl IS TABLE OF t_reduz_rec;

    v_reduz_a_validar  t_reduz_tbl := t_reduz_tbl();

    BEFORE EACH ROW IS
    BEGIN
        -- Cuentas sinteticas no son modificables
        IF :NEW.PLASUMARIZA = 'S' THEN
            :NEW.PLAALTERA := 'N';
        END IF;

        -- Normalizar campos
        :NEW.PLAINATIVA  := NVL(:NEW.PLAINATIVA, 'A');
        :NEW.PLASUMARIZA := NVL(:NEW.PLASUMARIZA, 'N');
        :NEW.PLACCUST    := NVL(:NEW.PLACCUST, 'N');
        :NEW.PLACONCILIA := NVL(:NEW.PLACONCILIA, 'N');
        :NEW.PLARATEIOAP := NVL(:NEW.PLARATEIOAP, 'N');
        :NEW.PLAMUTACOES := NVL(:NEW.PLAMUTACOES, 'N');
        :NEW.PLABLOQUE   := NVL(:NEW.PLABLOQUE, 'N');

        -- Acumular PLAREDUZ para validar unicidad en AFTER STATEMENT
        IF INSERTING OR (:NEW.PLAREDUZ != NVL(:OLD.PLAREDUZ, -1)) THEN
            v_reduz_a_validar.EXTEND;
            v_reduz_a_validar(v_reduz_a_validar.LAST) :=
                t_reduz_rec(:NEW.PLANO, :NEW.PLACONTA, :NEW.PLAREDUZ);
        END IF;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
        v_existe NUMBER;
    BEGIN
        -- Validar unicidad de PLAREDUZ por PLANO (la tabla ya no está mutando)
        FOR i IN 1 .. v_reduz_a_validar.COUNT LOOP
            IF INSERTING THEN
                SELECT COUNT(*)
                INTO v_existe
                FROM CM.PLANOCONTA
                WHERE PLANO    = v_reduz_a_validar(i).plano
                  AND PLAREDUZ = v_reduz_a_validar(i).plareduz;
            ELSE
                SELECT COUNT(*)
                INTO v_existe
                FROM CM.PLANOCONTA
                WHERE PLANO    = v_reduz_a_validar(i).plano
                  AND PLAREDUZ = v_reduz_a_validar(i).plareduz
                  AND PLACONTA != v_reduz_a_validar(i).placonta;
            END IF;

            IF v_existe > 0 THEN
                RAISE_APPLICATION_ERROR(-20001,
                    'Cuenta reducida ' || v_reduz_a_validar(i).plareduz ||
                    ' ya existe en el plan ' || v_reduz_a_validar(i).plano);
            END IF;
        END LOOP;
    END AFTER STATEMENT;

END TRG_VAL_PLANOCONTA;
/

COMMIT;

-- Verificar
SELECT COUNT(*) AS total_cuentas, 
       SUM(CASE WHEN PLAINATIVA = 'A' THEN 1 ELSE 0 END) AS activas
FROM CM.PLANOCONTA;

EXIT;
