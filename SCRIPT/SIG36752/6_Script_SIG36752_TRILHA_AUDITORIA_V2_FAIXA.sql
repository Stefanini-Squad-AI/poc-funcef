--CRIAÇÃO DA TABELA DE LOG.
--drop table LOGPLANUS.LOG_PLANUS_FAIXA;
create table LOGPLANUS.LOG_PLANUS_FAIXA
(
IDLOGFAIXA NUMBER,
IDFAIXA NUMBER,
DESCRICAO VARCHAR2 (60),
IDPESSJUR NUMBER,
IDPLANOPREV NUMBER,
IDPLANPREVCONTAB NUMBER,
IDTPCONTRIBUICAO NUMBER,
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
 
-- DROP PUBLIC SYNONYM LOG_PLANUS_FAIXA;
 CREATE PUBLIC SYNONYM LOG_PLANUS_FAIXA FOR LOGPLANUS.LOG_PLANUS_FAIXA; 
 
--CRIAÇÃO DOS INDEXES DA TABELA DE LOG.
--drop index LOGPLANUS.XIE1LOG_PLANUS_FAIXA;
create index LOGPLANUS.XIE1LOG_PLANUS_FAIXA on LOGPLANUS.LOG_PLANUS_FAIXA (IDFAIXA);
--drop index LOGPLANUS.XIE2LOG_PLANUS_FAIXA;
create index LOGPLANUS.XIE2LOG_PLANUS_FAIXA on LOGPLANUS.LOG_PLANUS_FAIXA(TRGDTALTERACAO);
 
--CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.
alter table LOGPLANUS.LOG_PLANUS_FAIXA
add constraint XPKLOG_PLANUS_FAIXA primary key (IDLOGFAIXA)
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
--drop sequence LOGPLANUS.SEQLOGPLANUS_FAIXA;
create sequence LOGPLANUS.SEQLOGPLANUS_FAIXA
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
 
--PERMISSÃO PARA A TABELA DE LOG.
grant select on LOGPLANUS.LOG_PLANUS_FAIXA to ROLE_CONSULTA;
grant insert on LOGPLANUS.LOG_PLANUS_FAIXA to CM;
grant select on LOGPLANUS.SEQLOGPLANUS_FAIXA to CM;
 
--CRIAÇÃO DA TRIGGER DA TABELA DE LOG.
CREATE OR REPLACE TRIGGER CM.TUDLOGALT_FAIXA
BEFORE UPDATE OF
IDFAIXA
,DESCRICAO
,IDPESSJUR
,IDPLANOPREV
,IDPLANPREVCONTAB
,IDTPCONTRIBUICAO
,TRGUSERINCLUSAO
,TRGDTINCLUSAO
OR DELETE ON FAIXA
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
IF  (:NEW.IDFAIXA <> :OLD.IDFAIXA) OR
    (:NEW.IDFAIXA IS NULL AND :OLD.IDFAIXA IS NOT NULL) OR
    (:NEW.IDFAIXA IS NOT NULL AND :OLD.IDFAIXA IS NULL)
 OR (:NEW.DESCRICAO <> :OLD.DESCRICAO) OR
    (:NEW.DESCRICAO IS NULL AND :OLD.DESCRICAO IS NOT NULL) OR
    (:NEW.DESCRICAO IS NOT NULL AND :OLD.DESCRICAO IS NULL)
 OR (:NEW.IDPESSJUR <> :OLD.IDPESSJUR) OR
    (:NEW.IDPESSJUR IS NULL AND :OLD.IDPESSJUR IS NOT NULL) OR
    (:NEW.IDPESSJUR IS NOT NULL AND :OLD.IDPESSJUR IS NULL)
 OR (:NEW.IDPLANOPREV <> :OLD.IDPLANOPREV) OR
    (:NEW.IDPLANOPREV IS NULL AND :OLD.IDPLANOPREV IS NOT NULL) OR
    (:NEW.IDPLANOPREV IS NOT NULL AND :OLD.IDPLANOPREV IS NULL)
 OR (:NEW.IDPLANPREVCONTAB <> :OLD.IDPLANPREVCONTAB) OR
    (:NEW.IDPLANPREVCONTAB IS NULL AND :OLD.IDPLANPREVCONTAB IS NOT NULL) OR
    (:NEW.IDPLANPREVCONTAB IS NOT NULL AND :OLD.IDPLANPREVCONTAB IS NULL)
 OR (:NEW.IDTPCONTRIBUICAO <> :OLD.IDTPCONTRIBUICAO) OR
    (:NEW.IDTPCONTRIBUICAO IS NULL AND :OLD.IDTPCONTRIBUICAO IS NOT NULL) OR
    (:NEW.IDTPCONTRIBUICAO IS NOT NULL AND :OLD.IDTPCONTRIBUICAO IS NULL)
 OR (:NEW.TRGUSERINCLUSAO <> :OLD.TRGUSERINCLUSAO) OR
    (:NEW.TRGUSERINCLUSAO IS NULL AND :OLD.TRGUSERINCLUSAO IS NOT NULL) OR
    (:NEW.TRGUSERINCLUSAO IS NOT NULL AND :OLD.TRGUSERINCLUSAO IS NULL)
 OR (:NEW.TRGDTINCLUSAO <> :OLD.TRGDTINCLUSAO) OR
    (:NEW.TRGDTINCLUSAO IS NULL AND :OLD.TRGDTINCLUSAO IS NOT NULL) OR
    (:NEW.TRGDTINCLUSAO IS NOT NULL AND :OLD.TRGDTINCLUSAO IS NULL)
THEN
INSERT INTO LOGPLANUS.LOG_PLANUS_FAIXA (IDLOGFAIXA,
IDFAIXA,
DESCRICAO,
IDPESSJUR,
IDPLANOPREV,
IDPLANPREVCONTAB,
IDTPCONTRIBUICAO,
TRGUSERINCLUSAO,
TRGDTINCLUSAO,
ROWIDORIGEM, 
Operacao,
TRGDTALTERACAO,
TRGUSERALTERACAO
)
VALUES (LOGPLANUS.SEQLOGPLANUS_FAIXA.NEXTVAL,
:OLD.IDFAIXA,
:OLD.DESCRICAO,
:OLD.IDPESSJUR,
:OLD.IDPLANOPREV,
:OLD.IDPLANPREVCONTAB,
:OLD.IDTPCONTRIBUICAO,
:OLD.TRGUSERINCLUSAO,
:OLD.TRGDTINCLUSAO,
:OLD.ROWID, 
vTipoOperacao,
SYSDATE,
USER
);
END IF;
END;
