--CRIAÇÃO DA TABELA DE LOG.
drop table LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD;
create table LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD
(
IDLOGCONTRIBNUCLEOACJUD NUMBER,
IDCONTRIBACJUDDEFICIT NUMBER,
IDNUCLEOFAMILIAR NUMBER,
IDCONTRIBUICAO NUMBER,
FLGPREPARO NUMBER (2),
PERCACJUDDEFICIT NUMBER,
ANOMESINIACJUDDEFICIT VARCHAR2 (7),
ANOMESFIMACJUDDEFICIT VARCHAR2 (7),
IDMOTIVOACJUDDEFICIT NUMBER,
OBSACJUDDEFICIT VARCHAR2 (400),
TRGDTINCLUSAO DATE,
TRGUSERINCLUSAO VARCHAR2 (30),
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
 
 DROP PUBLIC SYNONYM LOG_PLANUS_CONTRIBNUCLEOACJUD;
 CREATE PUBLIC SYNONYM LOG_PLANUS_CONTRIBNUCLEOACJUD FOR LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD; 
 
--NÃO HÁ INDEXES DA TABELA POIS A MESMA NÃO TEM CHAVE PRIMARIA.
 
--CRIAÇÃO DA CHAVE PRIMARIA DA TABELA DE LOG.
alter table LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD
add constraint XPKLOG_PLANUS_CONTRIBNUCLEOACJ primary key (IDLOGCONTRIBNUCLEOACJUD)
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
drop sequence LOGPLANUS.SEQLOGPLANUS_CONTRIBNUCLEOACJU;
create sequence LOGPLANUS.SEQLOGPLANUS_CONTRIBNUCLEOACJU
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;
 
--PERMISSÃO PARA A TABELA DE LOG.
grant select on LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD to ROLE_CONSULTA;
grant insert on LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD to CM;
grant select on LOGPLANUS.SEQLOGPLANUS_CONTRIBNUCLEOACJU to CM;
 
--CRIAÇÃO DA TRIGGER DA TABELA DE LOG.
CREATE OR REPLACE TRIGGER CM.TUDLOGALTCONTRIBNUCL
BEFORE UPDATE OF
IDCONTRIBACJUDDEFICIT
,IDNUCLEOFAMILIAR
,IDCONTRIBUICAO
,FLGPREPARO
,PERCACJUDDEFICIT
,ANOMESINIACJUDDEFICIT
,ANOMESFIMACJUDDEFICIT
,IDMOTIVOACJUDDEFICIT
,OBSACJUDDEFICIT
,TRGDTINCLUSAO
,TRGUSERINCLUSAO
OR DELETE ON CONTRIBNUCLEOACJUDDEFICIT
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
IF  (:NEW.IDCONTRIBACJUDDEFICIT <> :OLD.IDCONTRIBACJUDDEFICIT) OR
    (:NEW.IDCONTRIBACJUDDEFICIT IS NULL AND :OLD.IDCONTRIBACJUDDEFICIT IS NOT NULL) OR
    (:NEW.IDCONTRIBACJUDDEFICIT IS NOT NULL AND :OLD.IDCONTRIBACJUDDEFICIT IS NULL)
 OR (:NEW.IDNUCLEOFAMILIAR <> :OLD.IDNUCLEOFAMILIAR) OR
    (:NEW.IDNUCLEOFAMILIAR IS NULL AND :OLD.IDNUCLEOFAMILIAR IS NOT NULL) OR
    (:NEW.IDNUCLEOFAMILIAR IS NOT NULL AND :OLD.IDNUCLEOFAMILIAR IS NULL)
 OR (:NEW.IDCONTRIBUICAO <> :OLD.IDCONTRIBUICAO) OR
    (:NEW.IDCONTRIBUICAO IS NULL AND :OLD.IDCONTRIBUICAO IS NOT NULL) OR
    (:NEW.IDCONTRIBUICAO IS NOT NULL AND :OLD.IDCONTRIBUICAO IS NULL)
 OR (:NEW.FLGPREPARO <> :OLD.FLGPREPARO) OR
    (:NEW.FLGPREPARO IS NULL AND :OLD.FLGPREPARO IS NOT NULL) OR
    (:NEW.FLGPREPARO IS NOT NULL AND :OLD.FLGPREPARO IS NULL)
 OR (:NEW.PERCACJUDDEFICIT <> :OLD.PERCACJUDDEFICIT) OR
    (:NEW.PERCACJUDDEFICIT IS NULL AND :OLD.PERCACJUDDEFICIT IS NOT NULL) OR
    (:NEW.PERCACJUDDEFICIT IS NOT NULL AND :OLD.PERCACJUDDEFICIT IS NULL)
 OR (:NEW.ANOMESINIACJUDDEFICIT <> :OLD.ANOMESINIACJUDDEFICIT) OR
    (:NEW.ANOMESINIACJUDDEFICIT IS NULL AND :OLD.ANOMESINIACJUDDEFICIT IS NOT NULL) OR
    (:NEW.ANOMESINIACJUDDEFICIT IS NOT NULL AND :OLD.ANOMESINIACJUDDEFICIT IS NULL)
 OR (:NEW.ANOMESFIMACJUDDEFICIT <> :OLD.ANOMESFIMACJUDDEFICIT) OR
    (:NEW.ANOMESFIMACJUDDEFICIT IS NULL AND :OLD.ANOMESFIMACJUDDEFICIT IS NOT NULL) OR
    (:NEW.ANOMESFIMACJUDDEFICIT IS NOT NULL AND :OLD.ANOMESFIMACJUDDEFICIT IS NULL)
 OR (:NEW.IDMOTIVOACJUDDEFICIT <> :OLD.IDMOTIVOACJUDDEFICIT) OR
    (:NEW.IDMOTIVOACJUDDEFICIT IS NULL AND :OLD.IDMOTIVOACJUDDEFICIT IS NOT NULL) OR
    (:NEW.IDMOTIVOACJUDDEFICIT IS NOT NULL AND :OLD.IDMOTIVOACJUDDEFICIT IS NULL)
 OR (:NEW.OBSACJUDDEFICIT <> :OLD.OBSACJUDDEFICIT) OR
    (:NEW.OBSACJUDDEFICIT IS NULL AND :OLD.OBSACJUDDEFICIT IS NOT NULL) OR
    (:NEW.OBSACJUDDEFICIT IS NOT NULL AND :OLD.OBSACJUDDEFICIT IS NULL)
 OR (:NEW.TRGDTINCLUSAO <> :OLD.TRGDTINCLUSAO) OR
    (:NEW.TRGDTINCLUSAO IS NULL AND :OLD.TRGDTINCLUSAO IS NOT NULL) OR
    (:NEW.TRGDTINCLUSAO IS NOT NULL AND :OLD.TRGDTINCLUSAO IS NULL)
 OR (:NEW.TRGUSERINCLUSAO <> :OLD.TRGUSERINCLUSAO) OR
    (:NEW.TRGUSERINCLUSAO IS NULL AND :OLD.TRGUSERINCLUSAO IS NOT NULL) OR
    (:NEW.TRGUSERINCLUSAO IS NOT NULL AND :OLD.TRGUSERINCLUSAO IS NULL)
THEN
INSERT INTO LOGPLANUS.LOG_PLANUS_CONTRIBNUCLEOACJUD (IDLOGCONTRIBNUCLEOACJUD,
IDCONTRIBACJUDDEFICIT,
IDNUCLEOFAMILIAR,
IDCONTRIBUICAO,
FLGPREPARO,
PERCACJUDDEFICIT,
ANOMESINIACJUDDEFICIT,
ANOMESFIMACJUDDEFICIT,
IDMOTIVOACJUDDEFICIT,
OBSACJUDDEFICIT,
TRGDTINCLUSAO,
TRGUSERINCLUSAO,
ROWIDORIGEM, 
Operacao,
TRGDTALTERACAO,
TRGUSERALTERACAO
)
VALUES (LOGPLANUS.SEQLOGPLANUS_CONTRIBNUCLEOACJU.NEXTVAL,
:OLD.IDCONTRIBACJUDDEFICIT,
:OLD.IDNUCLEOFAMILIAR,
:OLD.IDCONTRIBUICAO,
:OLD.FLGPREPARO,
:OLD.PERCACJUDDEFICIT,
:OLD.ANOMESINIACJUDDEFICIT,
:OLD.ANOMESFIMACJUDDEFICIT,
:OLD.IDMOTIVOACJUDDEFICIT,
:OLD.OBSACJUDDEFICIT,
:OLD.TRGDTINCLUSAO,
:OLD.TRGUSERINCLUSAO,
:OLD.ROWID, 
vTipoOperacao,
SYSDATE,
USER
);
END IF;
END;
