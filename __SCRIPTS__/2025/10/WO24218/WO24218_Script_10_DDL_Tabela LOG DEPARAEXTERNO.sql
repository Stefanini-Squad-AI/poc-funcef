--CRIACAO DA TABELA DE LOG.        
create table LOGPLANUS.LOG_PLANUS_DEPARAEXTERNO
 (                                   
   IDLOGDEPARAEXTERNO       NUMBER,
   IDDEPARAEXTERNO          NUMBER(22),
   ATRIBUTO                 VARCHAR(30),
   VLRCM                    VARCHAR(100),
   VLREXTERNO               VARCHAR(100),
   TRGDTINCLUSAO            DATE,
   TRGUSERINCLUSAO          VARCHAR(30),
   FLGORIGEM                CHAR(1),
   TABELAORIGEM             VARCHAR(100),
   CAMPOFILTROORIGEM        VARCHAR(100),
   FLGUSACRITPO             NUMBER(1)   default 0,
   FLGAPLICACRITPO          NUMBER(1)   default 0,
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
create index LOGPLANUS.XIE1LOG_PLANUS_DEPARAEXTERNO on LOGPLANUS.LOG_PLANUS_DEPARAEXTERNO(IDDEPARAEXTERNO);  
create index LOGPLANUS.XIE2LOG_PLANUS_DEPARAEXTERNO on LOGPLANUS.LOG_PLANUS_DEPARAEXTERNO(TRGDTALTERACAO);             
-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.   
alter table LOGPLANUS.LOG_PLANUS_DEPARAEXTERNO
  add constraint XPKLOG_PLANUS_PK_DEPARAEXTERNO primary key (IDLOGDEPARAEXTERNO)
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
