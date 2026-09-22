-- ================================================================
-- FIX: ORA-04091 table CM.PLANOCONTA is mutating
-- El trigger TRG_VAL_PLANOCONTA consulta la misma tabla que se está
-- modificando (SELECT COUNT(*) FROM CM.PLANOCONTA), lo que causa
-- ORA-04091 en operaciones UPDATE.
--
-- Solución: Convertir a COMPOUND TRIGGER.
--   - BEFORE EACH ROW: normalizar campos + marcar PLAREDUZ
--   - AFTER STATEMENT: validar unicidad de PLAREDUZ (la tabla ya
--     no está mutando en este punto)
-- ================================================================

CREATE OR REPLACE TRIGGER CM.TRG_VAL_PLANOCONTA
FOR INSERT OR UPDATE ON CM.PLANOCONTA
COMPOUND TRIGGER

    -- Colección para diferir la validación de unicidad
    TYPE t_reduz_rec IS RECORD (
        plano    CM.PLANOCONTA.PLANO%TYPE,
        placonta CM.PLANOCONTA.PLACONTA%TYPE,
        plareduz CM.PLANOCONTA.PLAREDUZ%TYPE
    );
    TYPE t_reduz_tbl IS TABLE OF t_reduz_rec;

    v_reduz_a_validar  t_reduz_tbl := t_reduz_tbl();

    BEFORE EACH ROW IS
    BEGIN
        -- Cuentas sintéticas no son modificables
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

-- Verificar que el trigger se creó correctamente
SELECT TRIGGER_NAME, TRIGGER_TYPE, TRIGGERING_EVENT, STATUS
FROM USER_TRIGGERS
WHERE TRIGGER_NAME = 'TRG_VAL_PLANOCONTA';

EXIT;
