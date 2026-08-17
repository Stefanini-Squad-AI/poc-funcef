----------------------------------------------------------------------------------
--Atender   : WO33432
--Data      : 03/03/2026
--Autor     : Paulo Nobre
--Descrição : Funçoes para limpar caracteres não alfanuméricos..    
----------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION CM.FN_LIMPACARACTERES(p_text IN VARCHAR2)
  RETURN VARCHAR2
IS
BEGIN
  -- Remove tudo que não for caracter alfanumerico (A-Z / 0-9)
  RETURN REGEXP_REPLACE(TRIM(p_text), '[^A-Za-z0-9]', '');
END;

GRANT EXECUTE ON CM.FN_LIMPACARACTERES TO PUBLIC;
