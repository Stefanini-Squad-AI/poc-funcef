--CRIAÇÃO DA TABELA DE LOG.
--drop table LOGPLANUS.LOG_PLANUS_PERCFAIXA;
create table LOGPLANUS.LOG_PLANUS_PERCFAIXA
(
IDLOGPERCFAIXA NUMBER,
IDPERCFAIXA NUMBER,
IDFAIXA NUMBER,
DATAINIVIG DATE,
FAIXA NUMBER,
PERCPARTAT NUMBER,
PERCPATROAT NUMBER,
PERCPARTAS NUMBER,
PERCPATROAS NUMBER,
TRGUSERINCLUSAO VARCHAR2 (30),
TRGDTINCLUSAO DATE,
ROWIDORIGEM ROWID,
OPERACAO CHAR(1),
TRGDTALTERACAO   DATE default SYSDATE,
TRGUSERALTERACAO VARCHAR2(30) default USER
)
partition by range (TRGDTALTERACAO)
 
(
partition JUN2015 values less than (TO_DATE(' 2015-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JUL2015 values less than (TO_DATE(' 2015-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition AGO2015 values less than (TO_DATE(' 2015-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition SET2015 values less than (TO_DATE(' 2015-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition OUT2015 values less than (TO_DATE(' 2015-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition NOV2015 values less than (TO_DATE(' 2015-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition DEZ2015 values less than (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JAN2016 values less than (TO_DATE(' 2016-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition FEV2016 values less than (TO_DATE(' 2016-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition MAR2016 values less than (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition ABR2016 values less than (TO_DATE(' 2016-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition MAI2016 values less than (TO_DATE(' 2016-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JUN2016 values less than (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JUL2016 values less than (TO_DATE(' 2016-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition AGO2016 values less than (TO_DATE(' 2016-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition SET2016 values less than (TO_DATE(' 2016-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition OUT2016 values less than (TO_DATE(' 2016-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition NOV2016 values less than (TO_DATE(' 2016-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition DEZ2016 values less than (TO_DATE(' 2017-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JAN2017 values less than (TO_DATE(' 2017-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition FEV2017 values less than (TO_DATE(' 2017-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition MAR2017 values less than (TO_DATE(' 2017-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition ABR2017 values less than (TO_DATE(' 2017-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition MAI2017 values less than (TO_DATE(' 2017-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JUN2017 values less than (TO_DATE(' 2017-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition JUL2017 values less than (TO_DATE(' 2017-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition AGO2017 values less than (TO_DATE(' 2017-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition SET2017 values less than (TO_DATE(' 2017-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition OUT2017 values less than (TO_DATE(' 2017-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition NOV2017 values less than (TO_DATE(' 2017-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
partition DEZ2017 values less than (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
 
-- DROP PUBLIC SYNONYM LOG_PLANUS_PERCFAIXA;
 CREATE PUBLIC SYNONYM LOG_PLANUS_PERCFAIXA FOR LOGPLANUS.LOG_PLANUS_PERCFAIXA; 
 
--CRIAÇÃO DOS INDEXES DA TABELA DE LOG.
--drop index LOGPLANUS.XIE1LOG_PLANUS_PERCFAIXA;
create index LOGPLANUS.XIE1LOG_PLANUS_PERCFAIXA on LOGPLANUS.LOG_PLANUS_PERCFAIXA (IDPERCFAIXA);
--drop index LOGPLANUS.XIE2LOG_PLANUS_PERCFAIXA;
create index LOGPLANUS.XIE2LOG_PLANUS_PERCFAIXA on LOGPLANUS.LOG_PLANUS_PERCFAIXA(TRGDTALTERACAO);
 
--CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.
alter table LOGPLANUS.LOG_PLANUS_PERCFAIXA
add constraint XPKLOG_PLANUS_PERCFAIXA primary key (IDLOGPERCFAIXA)
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
 
--SEQUENCE DA CHAVE PRIMARIA DA TABELA DE LOG.
--drop sequence LOGPLANUS.SEQLOGPLANUS_PERCFAIXA;
create sequence LOGPLANUS.SEQLOGPLANUS_PERCFAIXA
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
 
--PERMISSÃO PARA A TABELA DE LOG.
grant select on LOGPLANUS.LOG_PLANUS_PERCFAIXA to ROLE_CONSULTA;
grant insert on LOGPLANUS.LOG_PLANUS_PERCFAIXA to CM;
grant select on LOGPLANUS.SEQLOGPLANUS_PERCFAIXA to CM;
 
--CRIAÇÃO DA TRIGGER DA TABELA DE LOG.
CREATE OR REPLACE TRIGGER CM.TUDLOGALT_PERCFAIXA
BEFORE UPDATE OF
IDPERCFAIXA
,IDFAIXA
,DATAINIVIG
,FAIXA
,PERCPARTAT
,PERCPATROAT
,PERCPARTAS
,PERCPATROAS
,TRGUSERINCLUSAO
,TRGDTINCLUSAO
OR DELETE ON PERCFAIXA
FOR EACH ROW
DECLARE
vTipoOperacao CHAR(1);
BEGIN
IF deleting THEN
 vTipoOperacao := 'D';
 END IF;
 IF updating THEN
  vTipoOperacao := 'A';
 END IF;
IF  (:NEW.IDPERCFAIXA <> :OLD.IDPERCFAIXA) OR
    (:NEW.IDPERCFAIXA IS NULL AND :OLD.IDPERCFAIXA IS NOT NULL) OR
    (:NEW.IDPERCFAIXA IS NOT NULL AND :OLD.IDPERCFAIXA IS NULL)
 OR (:NEW.IDFAIXA <> :OLD.IDFAIXA) OR
    (:NEW.IDFAIXA IS NULL AND :OLD.IDFAIXA IS NOT NULL) OR
    (:NEW.IDFAIXA IS NOT NULL AND :OLD.IDFAIXA IS NULL)
 OR (:NEW.DATAINIVIG <> :OLD.DATAINIVIG) OR
    (:NEW.DATAINIVIG IS NULL AND :OLD.DATAINIVIG IS NOT NULL) OR
    (:NEW.DATAINIVIG IS NOT NULL AND :OLD.DATAINIVIG IS NULL)
 OR (:NEW.FAIXA <> :OLD.FAIXA) OR
    (:NEW.FAIXA IS NULL AND :OLD.FAIXA IS NOT NULL) OR
    (:NEW.FAIXA IS NOT NULL AND :OLD.FAIXA IS NULL)
 OR (:NEW.PERCPARTAT <> :OLD.PERCPARTAT) OR
    (:NEW.PERCPARTAT IS NULL AND :OLD.PERCPARTAT IS NOT NULL) OR
    (:NEW.PERCPARTAT IS NOT NULL AND :OLD.PERCPARTAT IS NULL)
 OR (:NEW.PERCPATROAT <> :OLD.PERCPATROAT) OR
    (:NEW.PERCPATROAT IS NULL AND :OLD.PERCPATROAT IS NOT NULL) OR
    (:NEW.PERCPATROAT IS NOT NULL AND :OLD.PERCPATROAT IS NULL)
 OR (:NEW.PERCPARTAS <> :OLD.PERCPARTAS) OR
    (:NEW.PERCPARTAS IS NULL AND :OLD.PERCPARTAS IS NOT NULL) OR
    (:NEW.PERCPARTAS IS NOT NULL AND :OLD.PERCPARTAS IS NULL)
 OR (:NEW.PERCPATROAS <> :OLD.PERCPATROAS) OR
    (:NEW.PERCPATROAS IS NULL AND :OLD.PERCPATROAS IS NOT NULL) OR
    (:NEW.PERCPATROAS IS NOT NULL AND :OLD.PERCPATROAS IS NULL)
 OR (:NEW.TRGUSERINCLUSAO <> :OLD.TRGUSERINCLUSAO) OR
    (:NEW.TRGUSERINCLUSAO IS NULL AND :OLD.TRGUSERINCLUSAO IS NOT NULL) OR
    (:NEW.TRGUSERINCLUSAO IS NOT NULL AND :OLD.TRGUSERINCLUSAO IS NULL)
 OR (:NEW.TRGDTINCLUSAO <> :OLD.TRGDTINCLUSAO) OR
    (:NEW.TRGDTINCLUSAO IS NULL AND :OLD.TRGDTINCLUSAO IS NOT NULL) OR
    (:NEW.TRGDTINCLUSAO IS NOT NULL AND :OLD.TRGDTINCLUSAO IS NULL)
THEN
INSERT INTO LOGPLANUS.LOG_PLANUS_PERCFAIXA (IDLOGPERCFAIXA,
IDPERCFAIXA,
IDFAIXA,
DATAINIVIG,
FAIXA,
PERCPARTAT,
PERCPATROAT,
PERCPARTAS,
PERCPATROAS,
TRGUSERINCLUSAO,
TRGDTINCLUSAO,
ROWIDORIGEM, 
Operacao,
TRGDTALTERACAO,
TRGUSERALTERACAO
)
VALUES (LOGPLANUS.SEQLOGPLANUS_PERCFAIXA.NEXTVAL,
:OLD.IDPERCFAIXA,
:OLD.IDFAIXA,
:OLD.DATAINIVIG,
:OLD.FAIXA,
:OLD.PERCPARTAT,
:OLD.PERCPATROAT,
:OLD.PERCPARTAS,
:OLD.PERCPATROAS,
:OLD.TRGUSERINCLUSAO,
:OLD.TRGDTINCLUSAO,
:OLD.ROWID, 
vTipoOperacao,
SYSDATE,
USER
);
END IF;
END;
