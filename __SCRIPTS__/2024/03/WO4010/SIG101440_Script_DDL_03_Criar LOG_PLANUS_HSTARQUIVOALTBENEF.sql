-- ATENCAO -------------------------------------------------------------------------------------
  -- nome de TABELA nao exceder 18 caracteres  
  -- nome de CAMPOS nao exceder 23 caracteres
  -- primeiro campo será PK da tabela de log, em seguida replicar estrutura da tabela auditada
  -- se preferir, substitua as tags abaixo para gerar o script
  -- HSTARQUIVOALTBENEF   {nao precisa ser o mesmo nome da tabela auditada}
  -- HSTARQUIVOALTBENEF   {faça referencia ao nome da tabela respeitando o limite de tamanho }
  -- 2023  {informe o ano corrente,  ex: 2022}
  -- 2024   {informe o proximo ano, ex: 2023}
  -- IDLOGHSTARQUIVOALTBENEF  {campo(s) que compoe a chave da tabela auditada}
------------------------------------------------------------------------------------------------

-- CRIAÇÃO DA TABELA DE LOG.
-- drop table LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEF;
create table LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEF
(
        IDLOGHSTARQUIVOALTBENEF  NUMBER,
	IDLOTEIMPORTA NUMBER NOT NULL,
	NOMEARQUIVO VARCHAR2(100),
	DATAIMPORTA DATE,
	QTDEITENS NUMBER,
	QTDEIMPORTA NUMBER,
	HASHARQUIVO VARCHAR2(60),
	TRGDTINCLUSAO DATE DEFAULT SYSDATE,
	TRGUSERINCLUSAO VARCHAR(30) DEFAULT USER,
  ROWIDORIGEM ROWID,
  OPERACAO CHAR(1),
  TRGDTALTERACAO   DATE default SYSDATE,
  TRGUSERALTERACAO VARCHAR2(30) default USER
)
partition by range (TRGDTALTERACAO)
(
  partition JAN2023 values less than (TO_DATE(' 2023-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition FEV2023 values less than (TO_DATE(' 2023-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition MAR2023 values less than (TO_DATE(' 2023-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition ABR2023 values less than (TO_DATE(' 2023-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition MAI2023 values less than (TO_DATE(' 2023-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition JUN2023 values less than (TO_DATE(' 2023-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition JUL2023 values less than (TO_DATE(' 2023-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition AGO2023 values less than (TO_DATE(' 2023-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition SET2023 values less than (TO_DATE(' 2023-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition OUT2023 values less than (TO_DATE(' 2023-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition NOV2023 values less than (TO_DATE(' 2023-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  partition DEZ2023 values less than (TO_DATE(' 2024-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
-- drop index LOGPLANUS.XIE1LOG_PLANUS_HSTARQUIVOALTBENEF;
create index LOGPLANUS.XIE1LOG_PLANUS_HSTARQUIVOALTBENEF on LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEF (IDLOGHSTARQUIVOALTBENEF);
-- drop index LOGPLANUS.XIE2LOG_PLANUS_HSTARQUIVOALTBENEF;
create index LOGPLANUS.XIE2LOG_PLANUS_HSTARQUIVOALTBENEF on LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEF(TRGDTALTERACAO);
 
-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.
alter table LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEF
  add constraint XPKLOG_PLANUS_PK_HSTARQUIVOALTBENEF primary key (IDLOGHSTARQUIVOALTBENEF)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3208K
    minextents 1
    maxextents unlimited
  );
 
