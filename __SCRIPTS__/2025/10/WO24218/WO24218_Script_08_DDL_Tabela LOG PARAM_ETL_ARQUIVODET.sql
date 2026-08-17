--CRIACAO DA TABELA DE LOG.        
create table LOGPLANUS.LOG_PLANUS_PARAM_ETL_ARQUIVODET
 (                                   
   IDLOGPARAM_ETL_ARQUIVOD  NUMBER,
   IDPARAMETLARQ            NUMBER(22),
   IDPARAMETL               NUMBER(22),
   IDSEQSESSAO              NUMBER(22),
   ORDEM                    NUMBER(22),
   NOMESESSAO               VARCHAR(200),
   BLOCO                    VARCHAR(4000),
   TRGDTINCLUSAO            DATE,
   TRGUSERINCLUSAO          VARCHAR(60),
   ROWIDORIGEM              ROWID,
   OPERACAO                 CHAR(1),
   TRGDTALTERACAO           DATE          default SYSDATE,
   TRGUSERALTERACAO         VARCHAR2(30)  default USER
 )                                                  
 partition by range (TRGDTALTERACAO)                
 (                                                  
   partition SET2025 values less than (TO_DATE('2025-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition OUT2025 values less than (TO_DATE('2025-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition NOV2025 values less than (TO_DATE('2025-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition DEZ2025 values less than (TO_DATE('2025-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition JAN2026 values less than (TO_DATE('2025-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition FEV2026 values less than (TO_DATE('2026-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition MAR2026 values less than (TO_DATE('2026-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition ABR2026 values less than (TO_DATE('2026-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition MAI2026 values less than (TO_DATE('2026-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition JUN2026 values less than (TO_DATE('2026-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition JUL2026 values less than (TO_DATE('2026-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition AGO2026 values less than (TO_DATE('2026-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
   tablespace DADOS       
   pctfree 10             
   initrans 1             
   maxtrans 255           
   storage                
   (                      
     initial 64K          
     minextents 1         
     maxextents unlimited 
   ),                     
   partition FUTURO values less than (MAXVALUE) 
   tablespace DADOS                             
   pctfree 10                                   
   initrans 1                                   
   maxtrans 255                                 
   storage                                      
   (                                            
     initial 64K                                
     minextents 1                               
     maxextents unlimited                       
   )                                            
);                                              


-- CRIAÇÃO DOS INDEXES DA TABELA DE LOG.        
create index LOGPLANUS.XIE1LOG_PLANUS_PARAM_ETL_ARQUIVODET on LOGPLANUS.LOG_PLANUS_PARAM_ETL_ARQUIVODET(IDPARAMETLARQ, IDPARAMETL, IDSEQSESSAO);  
create index LOGPLANUS.XIE2LOG_PLANUS_PARAM_ETL_ARQUIVODET on LOGPLANUS.LOG_PLANUS_PARAM_ETL_ARQUIVODET(TRGDTALTERACAO);             
-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.   
alter table LOGPLANUS.LOG_PLANUS_PARAM_ETL_ARQUIVODET
  add constraint XPKLOG_PLANUS_PK_PARAM_ETL_ARQUIVODET primary key (IDLOGPARAM_ETL_ARQUIVOD)
  using index                                    
  tablespace INDICES                             
  pctfree 10                                     
  initrans 2                                     
  maxtrans 255                                   
  storage                                        
  (                                              
    initial 3208K                                
    minextents 1                                 
    maxextents unlimited                         
  );                                             
