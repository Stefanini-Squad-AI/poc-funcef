declare
  iConjunto  number;
begin  
  
  begin
    -- Select
    SELECT IDCONJUNTORUBRICA INTO iConjunto
      FROM cm.CONJUNTORUBRICA
     WHERE CODIGO = 'REINFABADT';
    -- Exception
    EXCEPTION WHEN OTHERS THEN iConjunto := -1;
    -- Criação do Registro
    If iConjunto = -1 then
      SELECT CM.SEQCONJUNTORUBRICA.NEXTVAL INTO iConjunto FROM DUAL;
      INSERT INTO cm.CONJUNTORUBRICA (IDCONJUNTORUBRICA, DESCRICAO, CODIGO)
        VALUES (iConjunto, 'Rubricas do REINF Adantamento Abono', 'REINFABADT');
    End If;

    if iConjunto <> -1 then
       insert into cm.CONJUNTORUBXRUB (IDCONJUNTORUBRICA, idrubrica) 
       select iConjunto, idprovento 
         from cm.provdesc
        where codprovdesc in ('130604', '213004', '217304', '313004', '317304');
    end if;
  end;
  
  commit; 
     
end; 