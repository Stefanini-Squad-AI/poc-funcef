declare
  vSequence number;

begin
  --=====================================================================--
  -- Inserção e Ajuste de Dados na Tabelas Informe, InformeAux, ProvDesc --
  -- => Informe 'IR Desconto Simplificado - FUNCEF'                      --
  --=====================================================================--    
  
  Select CM.SEQInforme.NEXTVAL into vSequence FROM DUAL;
  Insert Into CM.Informe (IDINFORME,NOMEINFORME,CODINFORME,CODDIRF,FLGIRRF,FLGBASE,FLGNATUREZA,ANOVIGENCIA,FLGUSADOBUSCACOMPENSA,FLGUSADOBUSCAQUITACAO) 
                  values (vSequence,'IR Desconto Simplificado - FUNCEF',9999,52,'S','N','N','2024','N','N');
  Insert Into CM.InformeAux (IDINFORME,ANOVIGENCIA) values (vSequence,'2024');
  Update CM.ProvDesc set idInforme = vSequence where idProvento = 41715;

  --=====================================================================--
  -- Inserção e Ajuste de Dados na Tabelas Informe, InformeAux, ProvDesc --
  -- => Informe 'IR Desconto Simplificado 13o - FUNCEF'                  --
  --=====================================================================--    
  Select CM.SEQInforme.NEXTVAL into vSequence FROM DUAL;
  Insert Into CM.Informe (IDINFORME,NOMEINFORME,CODINFORME,CODDIRF,FLGIRRF,FLGBASE,FLGNATUREZA,ANOVIGENCIA,FLGUSADOBUSCACOMPENSA,FLGUSADOBUSCAQUITACAO) 
                  values (vSequence,'IR Desconto Simplificado 13o - FUNCEF',9999,53,'N','N','N','2024','N','N');
  Insert Into CM.InformeAux (IDINFORME,ANOVIGENCIA) values (vSequence,'2024');
  Update CM.ProvDesc set idInforme = vSequence where idProvento = 41717;

  --=====================================================================--
  -- Inserção e Ajuste de Dados na Tabelas Informe, InformeAux, ProvDesc --
  -- => Informe 'IR Desconto Simplificado - INSS'                        --
  --=====================================================================--    
  Select CM.SEQInforme.NEXTVAL into vSequence FROM DUAL;
  Insert Into CM.Informe (IDINFORME,NOMEINFORME,CODINFORME,CODDIRF,FLGIRRF,FLGBASE,FLGNATUREZA,ANOVIGENCIA,FLGUSADOBUSCACOMPENSA,FLGUSADOBUSCAQUITACAO) 
                  values (vSequence,'IR Desconto Simplificado - INSS',9999,54,'N','N','N','2024','N','N');
  Insert Into CM.InformeAux (IDINFORME,ANOVIGENCIA) values (vSequence,'2024');
  Update CM.ProvDesc set idInforme = vSequence where idProvento = 41716;

  --=====================================================================--
  -- Inserção e Ajuste de Dados na Tabelas Informe, InformeAux, ProvDesc --
  -- => Informe 'IR Desconto Simplificado 13o - INSS'                    --
  --=====================================================================--    
  Select CM.SEQInforme.NEXTVAL into vSequence FROM DUAL;
  Insert Into CM.Informe (IDINFORME,NOMEINFORME,CODINFORME,CODDIRF,FLGIRRF,FLGBASE,FLGNATUREZA,ANOVIGENCIA,FLGUSADOBUSCACOMPENSA,FLGUSADOBUSCAQUITACAO) 
                  values (vSequence,'IR Desconto Simplificado 13o - INSS',9999,55,'N','N','N','2024','N','N');
  Insert Into CM.InformeAux (IDINFORME,ANOVIGENCIA) values (vSequence,'2024');
  Update CM.ProvDesc set idInforme = vSequence where idProvento = 41718;

  --==================================================--
  -- Update do Codigo do Informe na Tabela HistRubSal --
  --==================================================--    
  update CM.histrubsal h
  set h.idInforme = (select idInforme from CM.ProvDesc pd where h.idRubrica = pd.idProvento)
  where h.idRubrica in (41715,41716,41717,41718);

  Commit;

end;
