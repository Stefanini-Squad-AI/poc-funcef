--CRIACAO DA TABELA DE LOG.         
create table LOGPLANUS.LOG_PLANUS_IRRF_REDUCAO
 (                                  
   IDLOGIRRF_REDUCAO        NUMBER,
   FAIXA_TRIBUTAVEL         NUMBER(22),
   REDUCAO                  NUMBER(22),
   FATOR                    NUMBER(22),
   DATAINIVIGENCIA          DATE,
   ROWIDORIGEM              ROWID,
   OPERACAO                 CHAR(1),
   TRGDTALTERACAO           DATE          default SYSDATE,
   TRGUSERALTERACAO         VARCHAR2(30)  default USER
 )                                                  
 TABLESPACE LOGPLANUS_DADOS
 partition by range (TRGDTALTERACAO)                
 (                                                  
   partition JAN2026 values less than (TO_DATE('2025-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition FEV2026 values less than (TO_DATE('2026-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition MAR2026 values less than (TO_DATE('2026-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition ABR2026 values less than (TO_DATE('2026-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition MAI2026 values less than (TO_DATE('2026-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition JUN2026 values less than (TO_DATE('2026-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition JUL2026 values less than (TO_DATE('2026-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition AGO2026 values less than (TO_DATE('2026-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition SET2026 values less than (TO_DATE('2026-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition OUT2026 values less than (TO_DATE('2026-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition NOV2026 values less than (TO_DATE('2026-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition DEZ2026 values less than (TO_DATE('2026-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) tablespace LOGPLANUS_DADOS,
   partition FUTURO  values less than (MAXVALUE) tablespace LOGPLANUS_DADOS
);   


-- CRIAÇÃO DOS INDEXES DA TABELA DE LOG.        
create index LOGPLANUS.XIE1LOG_PLANUS_IRRF_REDUCAO on LOGPLANUS.LOG_PLANUS_IRRF_REDUCAO(FAIXA_TRIBUTAVEL, DATAINIVIGENCIA) tablespace INDICES; 
create index LOGPLANUS.XIE2LOG_PLANUS_IRRF_REDUCAO on LOGPLANUS.LOG_PLANUS_IRRF_REDUCAO(TRGDTALTERACAO)  tablespace INDICES; 
-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.   
alter table LOGPLANUS.LOG_PLANUS_IRRF_REDUCAO
  add constraint XPKLOG_PLANUS_PK_IRRF_REDUCAO primary key (IDLOGIRRF_REDUCAO)
  using index                                    
  tablespace INDICES;
