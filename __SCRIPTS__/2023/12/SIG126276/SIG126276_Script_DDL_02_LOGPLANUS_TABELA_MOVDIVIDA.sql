-- CRIAÇÃO DA TABELA DE LOG.
-- drop table LOGPLANUS.LOG_PLANUS_MOVDIVIDA;
create table LOGPLANUS.LOG_PLANUS_MOVDIVIDA
(
        IDLOGIDMOVDIVIDABENEFICIO  NUMBER NOT NULL ,
	IDMOVDIVIDABENEFICIO       NUMBER NOT NULL ,
	IDCONTROLEDIVIDABENEFICIO  NUMBER NOT NULL ,
	IDPESSOA                   NUMBER NOT NULL ,
	IDTITULAR                  NUMBER NOT NULL ,
	IDBENEFICIO                NUMBER NOT NULL ,
	IDPLANOPREV                NUMBER NOT NULL ,
	DATAMOV                    DATE   NOT NULL ,
	IDTIPOMOVDIVIDA            NUMBER NOT NULL ,
	VALORULTIMAPARCELA         NUMBER NOT NULL ,
	VALORPARCELA               NUMBER NOT NULL ,
	SALDODEVEDORATUAL          NUMBER NOT NULL ,
	MESINICIO                  DATE   NOT NULL ,
	MESFIM                     DATE   NOT NULL ,
	QTDEPARCELAS               NUMBER NOT NULL ,
	FLGDESATIVADO              NUMBER NOT NULL ,
	FLGATUALIZARSALDO          NUMBER NOT NULL ,
	FLGQUITADO                 NUMBER NOT NULL ,
	FLGDESCFOLHA               VARCHAR(1) NOT NULL ,
	FLGPORTFORMA               NUMBER NOT NULL ,
	FLGSTATUS                  NUMBER NOT NULL ,
	OBSERVACAO                 VARCHAR(100),
	ULTMESREAJ                 VARCHAR(7)  ,
	FLGACAOJUD                 NUMBER NOT NULL ,
	SALDOPROVPERDA             NUMBER NOT NULL ,
	SALDOBAIXADEF              NUMBER NOT NULL ,
	TRGDTINCLUSAO              DATE        DEFAULT SYSDATE,
	TRGUSERINCLUSAO            VARCHAR(30) DEFAULT USER,
        ROWIDORIGEM                ROWID,
        OPERACAO                   CHAR(1),
        TRGDTALTERACAO             DATE default SYSDATE,
        TRGUSERALTERACAO           VARCHAR2(30) default USER
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
-- drop index LOGPLANUS.XIE1LOG_PLANUS_MOVDIVIDA;
create index LOGPLANUS.XIE1LOG_PLANUS_MOVDIVIDA on LOGPLANUS.LOG_PLANUS_MOVDIVIDA (IDMOVDIVIDABENEFICIO);
-- drop index LOGPLANUS.XIE2LOG_PLANUS_MOVDIVIDA;
create index LOGPLANUS.XIE2LOG_PLANUS_MOVDIVIDA on LOGPLANUS.LOG_PLANUS_MOVDIVIDA(TRGDTALTERACAO);
 
-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.
alter table LOGPLANUS.LOG_PLANUS_MOVDIVIDA
  add constraint XPKLOG_PLANUS_PK_MOVDIVIDA primary key (IDLOGIDMOVDIVIDABENEFICIO)
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
 
