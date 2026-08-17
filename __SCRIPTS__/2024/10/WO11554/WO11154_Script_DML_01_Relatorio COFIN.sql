/*idreports = 4643 */

declare
  iReport   NUMBER;
BEGIN
  iReport  := 4643;
 
  if iReport > 0 then  
     -- Cadastro do relatorio
      
     insert into reports
      (NAME,
       IDREPORTS,
       ORIGEMCM,
       IDGRUPORELATORIO,
       IDMODULO,
       ORIGEMCMGR,
       DESCRIPTION,
       ORIGEMCMDV,
       FLGFILTROMANUAL,
       FORMEVENTOS,
       FORMPARAMREL,
       PPREPORT,
       FLGEXIBENOPREVIEW,
       FLGEXPORTADADOS,
       FLGSUBREPORT,
       FLGRELATATIVO,
       FLGEXPORTAMANUAL,
       FLGEXPORTAMANUALSUB
       )
    VALUES
      ('Autorização de Pagamento - COFIN', --NAME 
       iReport, --IDREPORTS 
       1, --ORIGEMCM
       25, --IDGRUPORELATORIO,  
       3, -- IDMODULO,  
       1, -- ORIGEMCMGR, 
       'WO11554', --DESCRIPTION, 
       0, --ORIGEMCMDV,  
       'N', --FLGFILTROMANUAL,  
       'DtmRelatoriosCapCar2', --FORMEVENTOS,  
       'frmrelautpag', --FORMPARAMREL,  
       'rptAutPagCofinNova', --PPREPORT,  
       'S', --FLGEXIBENOPREVIEW,
       'S', --FLGEXPORTADADOS,
       'N', --FLGSUBREPORT, 
       'S', --FLGRELATATIVO
       'N', --FLGEXPORTAMANUAL
       'N'  -- FLGEXPORTAMANUALSUB
       ); 

    -- 
    INSERT INTO CONFIGREPORTSCM (IDREPORTS, ORIGEMCM, IDPESSOA, DESCRICAO)
    SELECT IDREPORTS, ORIGEMCM, '1', NAME 
      FROM REPORTS
     WHERE IDREPORTS = iReport;   

    commit;
    
  end if;

end;