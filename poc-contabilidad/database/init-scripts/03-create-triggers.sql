-- ================================================================
-- FUNCEF POC - Triggers de Auditoría
-- ================================================================

CONNECT CM/cm_password@FREEPDB1;

-- ================================================================
-- TRIGGER: Auditoría de PLANOCONTA
-- ================================================================

CREATE OR REPLACE TRIGGER CM.TRG_AUD_PLANOCONTA
AFTER INSERT OR UPDATE OR DELETE ON CM.PLANOCONTA
FOR EACH ROW
DECLARE
    v_operacao VARCHAR2(1);
    v_datos_ant CLOB;
    v_datos_new CLOB;
BEGIN
    -- Determinar operación
    IF INSERTING THEN
        v_operacao := 'I';
    ELSIF UPDATING THEN
        v_operacao := 'U';
    ELSIF DELETING THEN
        v_operacao := 'D';
    END IF;
    
    -- Serializar datos (simplificado, en producción usar JSON)
    IF DELETING OR UPDATING THEN
        v_datos_ant := 'PLANO=' || :OLD.PLANO || 
                       ',PLACONTA=' || :OLD.PLACONTA ||
                       ',PLANOME=' || :OLD.PLANOME ||
                       ',PLAINATIVA=' || :OLD.PLAINATIVA;
    END IF;
    
    IF INSERTING OR UPDATING THEN
        v_datos_new := 'PLANO=' || :NEW.PLANO || 
                       ',PLACONTA=' || :NEW.PLACONTA ||
                       ',PLANOME=' || :NEW.PLANOME ||
                       ',PLAINATIVA=' || :NEW.PLAINATIVA;
    END IF;
    
    -- Insertar log
    INSERT INTO LOGPLANUS.LOG_PLANUS_PLANOCONTA
        (IDLOG, PLANO, PLACONTA, OPERACAO, USUARIO, DATAHORA, DADOS_ANTIGOS, DADOS_NOVOS)
    VALUES
        (LOGPLANUS.SEQ_LOG_PLANOCONTA.NEXTVAL, 
         NVL(:NEW.PLANO, :OLD.PLANO),
         NVL(:NEW.PLACONTA, :OLD.PLACONTA),
         v_operacao,
         USER,
         SYSTIMESTAMP,
         v_datos_ant,
         v_datos_new);
         
EXCEPTION
    WHEN OTHERS THEN
        -- No fallar la transacción principal por error en log
        NULL;
END;
/

-- ================================================================
-- TRIGGER: Auto-actualizar DTALTERACAO
-- ================================================================

CREATE OR REPLACE TRIGGER CM.TRG_UPD_PLANOCONTA
BEFORE UPDATE ON CM.PLANOCONTA
FOR EACH ROW
BEGIN
    :NEW.DTALTERACAO := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER CM.TRG_UPD_PLANO
BEFORE UPDATE ON CM.PLANO
FOR EACH ROW
BEGIN
    :NEW.DTALTERACAO := SYSDATE;
END;
/

-- ================================================================
-- TRIGGER: Validaciones de Negocio
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
        -- Cuentas sintéticas no son modificables
        IF :NEW.PLASUMARIZA = 'S' THEN
            :NEW.PLAALTERA := 'N';
        END IF;

        -- Normalizar campos
        :NEW.PLAINATIVA  := NVL(:NEW.PLAINATIVA, 'N');
        :NEW.PLASUMARIZA := NVL(:NEW.PLASUMARIZA, 'N');
        :NEW.PLACCUST    := NVL(:NEW.PLACCUST, 'N');
        :NEW.PLACONCILIA := NVL(:NEW.PLACONCILIA, 'N');
        :NEW.PLARATEIOAP := NVL(:NEW.PLARATEIOAP, 'N');
        :NEW.PLAMUTACOES := NVL(:NEW.PLAMUTACOES, 'N');
        :NEW.PLABLOQUE   := NVL(:NEW.PLABLOQUE, 'N');

        -- Acumular PLAREDUZ para validar unicidad en AFTER STATEMENT
        -- Skip validacion cuando PLAREDUZ = 0 (auto-generado por la aplicacion)
        IF (:NEW.PLAREDUZ != 0) AND (INSERTING OR (:NEW.PLAREDUZ != NVL(:OLD.PLAREDUZ, -1))) THEN
            v_reduz_a_validar.EXTEND;
            v_reduz_a_validar(v_reduz_a_validar.LAST) :=
                t_reduz_rec(:NEW.PLANO, :NEW.PLACONTA, :NEW.PLAREDUZ);
        END IF;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
        v_existe NUMBER;
    BEGIN
        -- Validar unicidad de PLAREDUZ por PLANO (la tabla ya no está mutando)
        -- Excluir la propia fila (PLACONTA) porque en AFTER STATEMENT
        -- la fila recién insertada/actualizada ya está en la tabla
        FOR i IN 1 .. v_reduz_a_validar.COUNT LOOP
            SELECT COUNT(*)
            INTO v_existe
            FROM CM.PLANOCONTA
            WHERE PLANO    = v_reduz_a_validar(i).plano
              AND PLAREDUZ = v_reduz_a_validar(i).plareduz
              AND PLACONTA != v_reduz_a_validar(i).placonta;

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

-- Mostrar triggers creados
SELECT TRIGGER_NAME, STATUS, TRIGGERING_EVENT
FROM USER_TRIGGERS
WHERE TABLE_NAME IN ('PLANOCONTA', 'PLANO')
ORDER BY TRIGGER_NAME;

EXIT;
