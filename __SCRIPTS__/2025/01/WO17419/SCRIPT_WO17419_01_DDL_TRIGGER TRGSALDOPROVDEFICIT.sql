CREATE or replace TRIGGER CM.TRGSALDOPROVDEFICIT
  BEFORE INSERT OR DELETE OR UPDATE OF SALDOREAL, SALDOCOTAS, VLRCOTAS, VLRREAL
  ON CM.HISTMOVRESERVA
  FOR EACH ROW
  WHEN (NVL(NEW.vlrreal,0) <> NVL(OLD.vlrreal,0)
        OR
        NVL(NEW.vlrcotas,0) <> NVL(OLD.vlrcotas,0)
        OR
        NVL(to_char(NEW.dataalimentacao,'YYYY/MM'), '0000/00') <> NVL(to_char(OLD.dataalimentacao,'YYYY/MM'), '0000/00'))

DECLARE
  TYPE Reserva_Type IS RECORD(IdTipoReserva PLS_INTEGER,
                              IdPlanoPrev   PLS_INTEGER,
                              IdPessJur     PLS_INTEGER,
                              ValorIndice   NUMBER);
  rTipoReserva Reserva_Type;

  vFlgDeficit PLS_INTEGER;

  vOLDCotas NUMBER;
  vNEWCotas NUMBER;
  vOLDMonet NUMBER;
  vNEWMonet NUMBER;

  vMesRef       CHAR(7);
  vMesRefAnt    CHAR(7);
  vMesRefInicio CHAR(7);
  vMesRefFim    CHAR(7);

  vDifValorCotas NUMBER;
  vDifValorMonet NUMBER;

  vSaldoCotasAnt NUMBER;
  vSaldoMonetAtu NUMBER;
  vSaldoCotasAtu NUMBER;

  vVlrUnitarioCota NUMBER;

  vAltCotas BOOLEAN := FALSE;
  vAltMonet BOOLEAN := FALSE;

  FUNCTION VALOR_INDICE(pMesRefCota CHAR) RETURN NUMBER IS
    vVlrCota NUMBER;
  BEGIN
    SELECT cm.cotvalor
    INTO vVlrCota
    FROM cotacaomoeda cm
    WHERE cm.moecodigo = (SELECT rp.indicereajuste
                          FROM reservaxplano rp
                          WHERE rp.idtiporeserva = rTipoReserva.IdTipoReserva
                          AND   rp.idplanoprev = rTipoReserva.IdPlanoPrev)
    AND   cm.cotdata = to_date(pMesRefCota,'YYYY/MM');
    RETURN vVlrCota;
  EXCEPTION
    WHEN no_data_found THEN
      IF rTipoReserva.ValorIndice IS NOT NULL THEN
        vVlrCota := rTipoReserva.ValorIndice;
      ELSE
        vVlrCota := 0;
      END IF;
      IF vVlrCota = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,'NÃ£o hÃ¡ valor de cota no mÃªs ' || pMesRefCota || ' para a reserva ' || rTipoReserva.IdTipoReserva || '.');
      END IF;
      RETURN vVlrCota;
  END VALOR_INDICE;

BEGIN
  IF DELETING THEN
    rTipoReserva.IdTipoReserva := :OLD.idtiporeserva;
    rTipoReserva.IdPlanoPrev := :OLD.idplanoprev;
    rTipoReserva.IdPessJur := :OLD.idpessjur;
    rTipoReserva.ValorIndice := :OLD.valorindice;
  ELSE
    rTipoReserva.IdTipoReserva := :NEW.idtiporeserva;
    rTipoReserva.IdPlanoPrev := :NEW.idplanoprev;
    rTipoReserva.IdPessJur := :NEW.idpessjur;
    rTipoReserva.ValorIndice := :NEW.valorindice;
  END IF;

  SELECT rxp.flgdeficit
  INTO vFlgDeficit
  FROM reservaxplano rxp
  WHERE rxp.idplanoprev = rTipoReserva.IdPlanoPrev
  AND   rxp.idtiporeserva = rTipoReserva.IdTipoReserva;

  IF vFlgDeficit = 1 and rTipoReserva.IdTipoReserva not in (219,220,221,22) THEN
    vMesRefInicio := to_char(LEAST(NVL(:NEW.dataalimentacao,:OLD.dataalimentacao), NVL(:OLD.dataalimentacao,:NEW.dataalimentacao)),'YYYY/MM');
    vMesRef := vMesRefInicio;

    --Ajusta sinal da alimentaÃ§Ã£o de cotas
    IF :NEW.flgentrada = 0 AND NOT DELETING THEN
      vNEWCotas := NVL(:NEW.vlrcotas * -1,0);
    ELSE
      vNEWCotas := NVL(:NEW.vlrcotas,0);
    END IF;
    IF :OLD.flgentrada = 0 AND NOT DELETING THEN
      vOLDCotas := NVL(:OLD.vlrcotas * -1,0);
    ELSE
      vOLDCotas := NVL(:OLD.vlrcotas,0);
    END IF;
    --Ajusta sinal da alimentaÃ§Ã£o do valor monetÃ¡rio
    IF :NEW.flgentrada = 0 AND NOT DELETING THEN
      vNEWMonet := NVL(:NEW.vlrreal * -1,0);
    ELSE
      vNEWMonet := NVL(:NEW.vlrreal,0);
    END IF;
    IF :OLD.flgentrada = 0 AND NOT DELETING THEN
      vOLDMonet := NVL(:OLD.vlrreal * -1,0);
    ELSE
      vOLDMonet := NVL(:OLD.vlrreal,0);
    END IF;

    IF vOLDMonet <> vNEWMonet THEN
      vAltMonet := TRUE;
    END IF;
    IF vOLDCotas <> vNEWCotas THEN
      vAltCotas := TRUE;
    END IF;

    vDifValorCotas := vNEWCotas - vOLDCotas;
    vDifValorMonet := vNEWMonet - vOLDMonet;

    --Verifica se o valor real Ã© compatÃ­vel com a quantidade de cotas
    vVlrUnitarioCota := VALOR_INDICE(vMesRef);
    IF NOT DELETING THEN
      IF vAltMonet AND vAltCotas THEN
        IF ABS(ROUND(vVlrUnitarioCota * vNEWCotas,2) - ROUND(vNEWMonet,2)) > 0.01 THEN
          RAISE_APPLICATION_ERROR(-20000,'Quantidade de cotas nÃ£o Ã© compatÃ­vel com o valor real.');
        END IF;
      ELSIF vAltMonet OR vAltCotas THEN
        IF vAltMonet THEN
          vNEWCotas := vNEWMonet / vVlrUnitarioCota;
          :NEW.vlrcotas := ABS(vNEWCotas);
        ELSE
          vNEWMonet := vNEWCotas * vVlrUnitarioCota;
          :NEW.vlrreal := ABS(vNEWMonet);
        END IF;
        :NEW.saldoreal := :OLD.saldoreal + vDifValorMonet;
        :NEW.saldocotas := :OLD.saldocotas + vDifValorCotas;
      END IF;
    END IF;

    SELECT NVL(MAX(s.mesreferencia), vMesRefInicio)
    INTO vMesRefFim
    FROM saldoprovdeficit s
    WHERE s.idtiporeserva = rTipoReserva.IdTipoReserva
    AND   s.idplanoprev = rTipoReserva.IdPlanoPrev
    AND   s.idpessjur = rTipoReserva.IdPessJur
    AND   s.mesreferencia >= vMesRefInicio;

    LOOP
      BEGIN
        SELECT s.saldocotas
        INTO vSaldoCotasAtu
        FROM saldoprovdeficit s
        WHERE s.idtiporeserva = rTipoReserva.IdTipoReserva
        AND   s.idplanoprev = rTipoReserva.IdPlanoPrev
        AND   s.idpessjur = rTipoReserva.IdPessJur
        AND   s.mesreferencia = vMesRef;
      EXCEPTION
        WHEN no_data_found THEN
          vSaldoCotasAtu := 0;
      END;

      IF vSaldoCotasAtu = 0 THEN
        vMesRefAnt := to_char(add_months(to_date(vMesRef,'YYYY/MM'), -1),'YYYY/MM');
        BEGIN
          SELECT s.saldocotas
          INTO vSaldoCotasAnt
          FROM saldoprovdeficit s
          WHERE s.idtiporeserva = rTipoReserva.IdTipoReserva
          AND   s.idplanoprev = rTipoReserva.IdPlanoPrev
          AND   s.idpessjur = rTipoReserva.IdPessJur
          AND   s.mesreferencia = vMesRefAnt;
        EXCEPTION
          WHEN no_data_found THEN
            vSaldoCotasAnt := 0;
        END;
        vSaldoCotasAtu := vSaldoCotasAnt;
      END IF;

      vSaldoCotasAtu := vSaldoCotasAtu + vDifValorCotas;
      vSaldoMonetAtu := ROUND(vSaldoCotasAtu * vVlrUnitarioCota,2);

      MERGE INTO saldoprovdeficit s
      USING (SELECT rTipoReserva.IdTipoReserva AS IDTIPORESERVA,
                    rTipoReserva.IdPlanoPrev AS IDPLANOPREV,
                    rTipoReserva.IdPessJur AS IDPESSJUR,
                    vMesRef AS MESREF
             FROM dual) aux ON (aux.idtiporeserva = s.idtiporeserva AND
                                aux.idplanoprev = s.idplanoprev AND
                                aux.idpessjur = s.idpessjur AND
                                aux.mesref = s.mesreferencia)
      WHEN MATCHED THEN UPDATE SET s.saldomonetario = vSaldoMonetAtu,
                                   s.saldocotas = vSaldoCotasAtu
      WHEN NOT MATCHED THEN INSERT (IDTIPORESERVA,
                                    IDPLANOPREV,
                                    IDPESSJUR,
                                    MESREFERENCIA,
                                    SALDOMONETARIO,
                                    SALDOCOTAS) VALUES (rTipoReserva.IdTipoReserva,
                                                        rTipoReserva.IdPlanoPrev,
                                                        rTipoReserva.IdPessJur,
                                                        vMesRef,
                                                        vSaldoMonetAtu,
                                                        vSaldoCotasAtu);
      EXIT WHEN vMesRef = vMesRefFim;
      vMesRef := to_char(add_months(to_date(vMesRef,'YYYY/MM'),1),'YYYY/MM');
      vVlrUnitarioCota := VALOR_INDICE(vMesRef);
    END LOOP;
  END IF;
END TRGSALDOPROVDEFICIT;