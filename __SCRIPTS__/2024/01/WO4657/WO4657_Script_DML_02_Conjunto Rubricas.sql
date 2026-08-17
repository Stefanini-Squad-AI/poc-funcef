declare
  iConjunto  number;
begin  
  
  begin
    -- Select
    SELECT IDCONJUNTORUBRICA INTO iConjunto
      FROM cm.CONJUNTORUBRICA
     WHERE CODIGO = 'REINFSIMPL';
    -- Exception
    EXCEPTION WHEN OTHERS THEN iConjunto := -1;
    -- Criação do Registro
    If iConjunto = -1 then
      SELECT CM.SEQCONJUNTORUBRICA.NEXTVAL INTO iConjunto FROM DUAL;
      INSERT INTO cm.CONJUNTORUBRICA (IDCONJUNTORUBRICA, DESCRICAO, CODIGO)
        VALUES (iConjunto, 'Rubricas do REINF de Dedução Simplif.', 'REINFSIMPL');
    End If;

    if iConjunto <> -1 then
       insert into cm.CONJUNTORUBXRUB (IDCONJUNTORUBRICA, idrubrica) 
       select iConjunto, idprovento 
         from cm.provdesc
        where idprovento in (41715, 41716, 41717, 41718);
    end if;
  end;


  begin
    -- Select
    SELECT IDCONJUNTORUBRICA INTO iConjunto
      FROM CONJUNTORUBRICA
     WHERE CODIGO = 'RUBLEGAIS';
    -- Exception
    EXCEPTION WHEN OTHERS THEN iConjunto := -1;
    -- Criação do Registro
    If iConjunto = -1 then
      SELECT CM.SEQCONJUNTORUBRICA.NEXTVAL INTO iConjunto FROM DUAL;
      INSERT INTO CONJUNTORUBRICA (IDCONJUNTORUBRICA, DESCRICAO, CODIGO)
        VALUES (iConjunto, 'Rubricas de Desconto Legais', 'RUBLEGAIS');
    End If;

    if iConjunto <> -1 then
       insert into cm.CONJUNTORUBXRUB (IDCONJUNTORUBRICA, idrubrica) 
       select iConjunto, idprovento 
         from cm.provdesc
        where idprovento in (31356, 31358, 34256, 34263, 34264, 34267, 34270,
                             34281, 34282, 34288, 34352, 34355, 34370, 34395,
                             36018, 36244, 38549, 38550, 38551, 38552, 38553,
                             38556, 38560, 38643, 38645, 38650, 38826, 38993,
                             39221, 39421, 39498, 39994, 39996, 40002, 40739, 40898);
    end if;

  end;
  
  commit; 
     
end; 