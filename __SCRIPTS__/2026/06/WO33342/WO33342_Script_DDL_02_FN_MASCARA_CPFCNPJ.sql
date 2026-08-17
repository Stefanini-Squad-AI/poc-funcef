----------------------------------------------------------------------------------
--Atender   : WO33432
--Data      : 03/03/2026
--Autor     : Paulo Nobre
--Descrição : Funçoes para colocar mascaras no CPF e CNPJ..   
----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION CM.FN_FORMATACPFCNPJ(p_value IN VARCHAR2)
  RETURN VARCHAR2
IS
  v VARCHAR2(32) := CM.FN_LIMPACARACTERES(p_value);
BEGIN
  IF v IS NULL THEN
    RETURN NULL;
  ELSIF LENGTH(v) = 11 THEN    
    RETURN SUBSTR(v,1,3) || '.' ||
           SUBSTR(v,4,3) || '.' ||
           SUBSTR(v,7,3) || '-' ||
           SUBSTR(v,10,2);
  ELSIF LENGTH(v) = 14 THEN   
    RETURN SUBSTR(v,1,2)  || '.' ||
           SUBSTR(v,3,3)  || '.' ||
           SUBSTR(v,6,3)  || '/' ||
           SUBSTR(v,9,4)  || '-' ||
           SUBSTR(v,13,2);
  ELSE
    -- Tamanho inválido: retorna como veio 
    RETURN p_value;
  END IF;
END;

--GRANT EXECUTE ON CM.FN_FORMATACPFCNPJ TO PUBLIC;
