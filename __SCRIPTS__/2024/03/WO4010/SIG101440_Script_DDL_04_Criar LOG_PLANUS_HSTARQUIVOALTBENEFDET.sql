-- ATENCAO -------------------------------------------------------------------------------------
  -- nome de TABELA nao exceder 18 caracteres  
  -- nome de CAMPOS nao exceder 23 caracteres
  -- primeiro campo será PK da tabela de log, em seguida replicar estrutura da tabela auditada
  -- se preferir, substitua as tags abaixo para gerar o script
  -- HSTARQUIVOALTBENEFDET   {nao precisa ser o mesmo nome da tabela auditada}
  -- HSTARQUIVOALTBENEFDET   {faça referencia ao nome da tabela respeitando o limite de tamanho }
  -- 2023  {informe o ano corrente,  ex: 2022}
  -- 2024   {informe o proximo ano, ex: 2023}
  -- IDLOGHSTARQUIVOALTBENEFDET  {campo(s) que compoe a chave da tabela auditada}
------------------------------------------------------------------------------------------------

-- CRIAÇÃO DA TABELA DE LOG.
-- drop table LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEFDET;
create table LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEFDET
(
  	IDLOGHSTARQUIVOALTBENEFDET  NUMBER,
	IDHSTARQUIVOALTBENEFDET NUMBER NOT NULL,
	IDLOTEIMPORTA NUMBER NOT NULL,
	MATRICULA VARCHAR(8),
	NUMEROPROCESSO NUMBER,
	IDPESSOA NUMBER,
	IDTITULAR NUMBER,
	IDPLANOPREV NUMBER,
	IDPESSJUR NUMBER,
	SEQPROPOSTA NUMBER,
	VALORATUAL NUMBER(17,2),
	VALORTOTAL NUMBER(17,2),
	VALORSRB NUMBER,
	VLRBSTOTAL NUMBER(17,2),
	VLRFABTOTAL NUMBER(17,2),
	VLRBSATUAL NUMBER(17,2),
	VLRFABATUAL NUMBER(17,2),
	VALORATUALANT NUMBER,
	VALORTOTALANT NUMBER,
	VALORSRBANT NUMBER,
	VLRBSTOTALANT NUMBER(17,2),
	VLRFABTOTALANT NUMBER(17,2),
	VLRBSATUALANT NUMBER(17,2),
	VLRFABATUALANT NUMBER(17,2),
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
-- drop index LOGPLANUS.XIE1LOG_PLANUS_HSTARQUIVOALTBENEFDET;
create index LOGPLANUS.XIE1LOG_PLANUS_HSTARQUIVOALTBENEFDET on LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEFDET (IDLOGHSTARQUIVOALTBENEFDET);
-- drop index LOGPLANUS.XIE2LOG_PLANUS_HSTARQUIVOALTBENEFDET;
create index LOGPLANUS.XIE2LOG_PLANUS_HSTARQUIVOALTBENEFDET on LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEFDET(TRGDTALTERACAO);
 
-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.
alter table LOGPLANUS.LOG_PLANUS_HSTARQUIVOALTBENEFDET
  add constraint XPKLOG_PLANUS_PK_HSTARQUIVOALTBENEFDET primary key (IDLOGHSTARQUIVOALTBENEFDET)
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
 
