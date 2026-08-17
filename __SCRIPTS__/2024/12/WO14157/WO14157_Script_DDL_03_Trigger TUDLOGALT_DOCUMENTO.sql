CREATE OR REPLACE trigger CM.TUDLOGALT_DOCUMENTO
  before update of
    CODDOCUMENTO
   ,IDPESSOA
   ,CODFORMA
   ,CODPORTFORMA
   ,INDICECORRECAO
   ,CODSUBCONTA
   ,PLANO
   ,PLACONTA
   ,MOECODIGO
   ,IDEMPRESA
   ,CODCENTROCUSTO
   ,IDFORCLI
   ,IDMODULO
   ,CODTIPDOC
   ,RECPAG
   ,NODOCUMENTO
   ,COMPLDOCUMENTO
   ,DATAEMISSAO
   ,DATAVENCTO
   ,DATAPROGRAMADA
   ,STATUS
   ,NUMFATURA
   ,OPERACAO
   ,IDUSUARIOINCLUSAO
   ,NUMSLIP
   ,EMISBLOQ
   ,DATALIMITE
   ,VALORDESCONTO
   ,NOSSONUMERO
   ,VALORJUROS
   ,LOTETRANSMISSAO
   ,CONTROLEREMESSA
   ,DATAREMESSA
   ,VLRMULTA
   ,CODGRUPOCNAB
   ,NUMAPGR
   ,NUMLEITCODBARRAS
   ,NUMDIGCODBARRAS
   ,FLGEMITELANCBAIX
   ,DATACORRECAO
   ,PERCJUROSATUARIAL
   ,PERCJUROSSIMPLES
   ,TRGDTINCLUSAO
   ,TRGUSERINCLUSAO
   ,UNIDNEGOC
   ,REFERENCIA
   ,OBS
   ,FLGCONFIRMARECPAG
   ,IDCBANCARIA
   ,NUMCPBAIXA
   ,GRUPODOC
   ,FLGNAOCONCILIADO
   ,CODGERADORINSS
   ,FLGTIPODOCUMENTO
   ,DATADISPONIB
   ,IDSEGREGACRITER
   ,IDPROCESSO
   ,FLGCONTAINVEST
   ,FLGIMPORTADO
   ,PLACONTAANT
   ,QTDECOTAS
   ,IDENVIODOCUMENTO
   ,IDEMISSBANCARIA
   ,FLGSIMPLES
   ,FLGESPECIAL
   ,FLGSERVICOEXEC
   ,FLGREGISTRADO
   ,NFSNUMERO
   ,NFSSERIE
   ,NFSDATAEMISSAO
   ,NFSOBS
   ,DATAREGISTRO
   ,SITUACAOREGISTRO
   ,NUMPROCESSO
   ,PARTEFUNCEF
   ,PARTECONTRARIA 
   
  or delete on DOCUMENTO
  for each row
declare
  vTipoOperacao char(1);
begin
  if deleting then
    vTipoOperacao := 'D';
  end if;
  if updating then
     vTipoOperacao := 'A';
  end if;
  if (:new.CODDOCUMENTO <> :old.CODDOCUMENTO) or
     (:new.CODDOCUMENTO is null and :old.CODDOCUMENTO is not null) or
     (:new.CODDOCUMENTO is not null and :old.CODDOCUMENTO is null)
  or (:new.IDPESSOA <> :old.IDPESSOA) or
     (:new.IDPESSOA is null and :old.IDPESSOA is not null) or
     (:new.IDPESSOA is not null and :old.IDPESSOA is null)
  or (:new.CODFORMA <> :old.CODFORMA) or
     (:new.CODFORMA is null and :old.CODFORMA is not null) or
     (:new.CODFORMA is not null and :old.CODFORMA is null)
  or (:new.CODPORTFORMA <> :old.CODPORTFORMA) or
     (:new.CODPORTFORMA is null and :old.CODPORTFORMA is not null) or
     (:new.CODPORTFORMA is not null and :old.CODPORTFORMA is null)
  or (:new.INDICECORRECAO <> :old.INDICECORRECAO) or
     (:new.INDICECORRECAO is null and :old.INDICECORRECAO is not null) or
     (:new.INDICECORRECAO is not null and :old.INDICECORRECAO is null)
  or (:new.CODSUBCONTA <> :old.CODSUBCONTA) or
     (:new.CODSUBCONTA is null and :old.CODSUBCONTA is not null) or
     (:new.CODSUBCONTA is not null and :old.CODSUBCONTA is null)
  or (:new.PLANO <> :old.PLANO) or
     (:new.PLANO is null and :old.PLANO is not null) or
     (:new.PLANO is not null and :old.PLANO is null)
  or (:new.PLACONTA <> :old.PLACONTA) or
     (:new.PLACONTA is null and :old.PLACONTA is not null) or
     (:new.PLACONTA is not null and :old.PLACONTA is null)
  or (:new.MOECODIGO <> :old.MOECODIGO) or
     (:new.MOECODIGO is null and :old.MOECODIGO is not null) or
     (:new.MOECODIGO is not null and :old.MOECODIGO is null)
  or (:new.IDEMPRESA <> :old.IDEMPRESA) or
     (:new.IDEMPRESA is null and :old.IDEMPRESA is not null) or
     (:new.IDEMPRESA is not null and :old.IDEMPRESA is null)
  or (:new.CODCENTROCUSTO <> :old.CODCENTROCUSTO) or
     (:new.CODCENTROCUSTO is null and :old.CODCENTROCUSTO is not null) or
     (:new.CODCENTROCUSTO is not null and :old.CODCENTROCUSTO is null)
  or (:new.IDFORCLI <> :old.IDFORCLI) or
     (:new.IDFORCLI is null and :old.IDFORCLI is not null) or
     (:new.IDFORCLI is not null and :old.IDFORCLI is null)
  or (:new.IDMODULO <> :old.IDMODULO) or
     (:new.IDMODULO is null and :old.IDMODULO is not null) or
     (:new.IDMODULO is not null and :old.IDMODULO is null)
  or (:new.CODTIPDOC <> :old.CODTIPDOC) or
     (:new.CODTIPDOC is null and :old.CODTIPDOC is not null) or
     (:new.CODTIPDOC is not null and :old.CODTIPDOC is null)
  or (:new.RECPAG <> :old.RECPAG) or
     (:new.RECPAG is null and :old.RECPAG is not null) or
     (:new.RECPAG is not null and :old.RECPAG is null)
  or (:new.NODOCUMENTO <> :old.NODOCUMENTO) or
     (:new.NODOCUMENTO is null and :old.NODOCUMENTO is not null) or
     (:new.NODOCUMENTO is not null and :old.NODOCUMENTO is null)
  or (:new.COMPLDOCUMENTO <> :old.COMPLDOCUMENTO) or
     (:new.COMPLDOCUMENTO is null and :old.COMPLDOCUMENTO is not null) or
     (:new.COMPLDOCUMENTO is not null and :old.COMPLDOCUMENTO is null)
  or (:new.DATAEMISSAO <> :old.DATAEMISSAO) or
     (:new.DATAEMISSAO is null and :old.DATAEMISSAO is not null) or
     (:new.DATAEMISSAO is not null and :old.DATAEMISSAO is null)
  or (:new.DATAVENCTO <> :old.DATAVENCTO) or
     (:new.DATAVENCTO is null and :old.DATAVENCTO is not null) or
     (:new.DATAVENCTO is not null and :old.DATAVENCTO is null)
  or (:new.DATAPROGRAMADA <> :old.DATAPROGRAMADA) or
     (:new.DATAPROGRAMADA is null and :old.DATAPROGRAMADA is not null) or
     (:new.DATAPROGRAMADA is not null and :old.DATAPROGRAMADA is null)
  or (:new.STATUS <> :old.STATUS) or
     (:new.STATUS is null and :old.STATUS is not null) or
     (:new.STATUS is not null and :old.STATUS is null)
  or (:new.NUMFATURA <> :old.NUMFATURA) or
     (:new.NUMFATURA is null and :old.NUMFATURA is not null) or
     (:new.NUMFATURA is not null and :old.NUMFATURA is null)
  or (:new.OPERACAO <> :old.OPERACAO) or
     (:new.OPERACAO is null and :old.OPERACAO is not null) or
     (:new.OPERACAO is not null and :old.OPERACAO is null)
  or (:new.IDUSUARIOINCLUSAO <> :old.IDUSUARIOINCLUSAO) or
     (:new.IDUSUARIOINCLUSAO is null and :old.IDUSUARIOINCLUSAO is not null) or
     (:new.IDUSUARIOINCLUSAO is not null and :old.IDUSUARIOINCLUSAO is null)
  or (:new.NUMSLIP <> :old.NUMSLIP) or
     (:new.NUMSLIP is null and :old.NUMSLIP is not null) or
     (:new.NUMSLIP is not null and :old.NUMSLIP is null)
  or (:new.EMISBLOQ <> :old.EMISBLOQ) or
     (:new.EMISBLOQ is null and :old.EMISBLOQ is not null) or
     (:new.EMISBLOQ is not null and :old.EMISBLOQ is null)
  or (:new.DATALIMITE <> :old.DATALIMITE) or
     (:new.DATALIMITE is null and :old.DATALIMITE is not null) or
     (:new.DATALIMITE is not null and :old.DATALIMITE is null)
  or (:new.VALORDESCONTO <> :old.VALORDESCONTO) or
     (:new.VALORDESCONTO is null and :old.VALORDESCONTO is not null) or
     (:new.VALORDESCONTO is not null and :old.VALORDESCONTO is null)
  or (:new.NOSSONUMERO <> :old.NOSSONUMERO) or
     (:new.NOSSONUMERO is null and :old.NOSSONUMERO is not null) or
     (:new.NOSSONUMERO is not null and :old.NOSSONUMERO is null)
  or (:new.VALORJUROS <> :old.VALORJUROS) or
     (:new.VALORJUROS is null and :old.VALORJUROS is not null) or
     (:new.VALORJUROS is not null and :old.VALORJUROS is null)
  or (:new.LOTETRANSMISSAO <> :old.LOTETRANSMISSAO) or
     (:new.LOTETRANSMISSAO is null and :old.LOTETRANSMISSAO is not null) or
     (:new.LOTETRANSMISSAO is not null and :old.LOTETRANSMISSAO is null)
  or (:new.CONTROLEREMESSA <> :old.CONTROLEREMESSA) or
     (:new.CONTROLEREMESSA is null and :old.CONTROLEREMESSA is not null) or
     (:new.CONTROLEREMESSA is not null and :old.CONTROLEREMESSA is null)
  or (:new.DATAREMESSA <> :old.DATAREMESSA) or
     (:new.DATAREMESSA is null and :old.DATAREMESSA is not null) or
     (:new.DATAREMESSA is not null and :old.DATAREMESSA is null)
  or (:new.VLRMULTA <> :old.VLRMULTA) or
     (:new.VLRMULTA is null and :old.VLRMULTA is not null) or
     (:new.VLRMULTA is not null and :old.VLRMULTA is null)
  or (:new.CODGRUPOCNAB <> :old.CODGRUPOCNAB) or
     (:new.CODGRUPOCNAB is null and :old.CODGRUPOCNAB is not null) or
     (:new.CODGRUPOCNAB is not null and :old.CODGRUPOCNAB is null)
  or (:new.NUMAPGR <> :old.NUMAPGR) or
     (:new.NUMAPGR is null and :old.NUMAPGR is not null) or
     (:new.NUMAPGR is not null and :old.NUMAPGR is null)
  or (:new.NUMLEITCODBARRAS <> :old.NUMLEITCODBARRAS) or
     (:new.NUMLEITCODBARRAS is null and :old.NUMLEITCODBARRAS is not null) or
     (:new.NUMLEITCODBARRAS is not null and :old.NUMLEITCODBARRAS is null)
  or (:new.NUMDIGCODBARRAS <> :old.NUMDIGCODBARRAS) or
     (:new.NUMDIGCODBARRAS is null and :old.NUMDIGCODBARRAS is not null) or
     (:new.NUMDIGCODBARRAS is not null and :old.NUMDIGCODBARRAS is null)
  or (:new.FLGEMITELANCBAIX <> :old.FLGEMITELANCBAIX) or
     (:new.FLGEMITELANCBAIX is null and :old.FLGEMITELANCBAIX is not null) or
     (:new.FLGEMITELANCBAIX is not null and :old.FLGEMITELANCBAIX is null)
  or (:new.DATACORRECAO <> :old.DATACORRECAO) or
     (:new.DATACORRECAO is null and :old.DATACORRECAO is not null) or
     (:new.DATACORRECAO is not null and :old.DATACORRECAO is null)
  or (:new.PERCJUROSATUARIAL <> :old.PERCJUROSATUARIAL) or
     (:new.PERCJUROSATUARIAL is null and :old.PERCJUROSATUARIAL is not null) or
     (:new.PERCJUROSATUARIAL is not null and :old.PERCJUROSATUARIAL is null)
  or (:new.PERCJUROSSIMPLES <> :old.PERCJUROSSIMPLES) or
     (:new.PERCJUROSSIMPLES is null and :old.PERCJUROSSIMPLES is not null) or
     (:new.PERCJUROSSIMPLES is not null and :old.PERCJUROSSIMPLES is null)
  or (:new.TRGDTINCLUSAO <> :old.TRGDTINCLUSAO) or
     (:new.TRGDTINCLUSAO is null and :old.TRGDTINCLUSAO is not null) or
     (:new.TRGDTINCLUSAO is not null and :old.TRGDTINCLUSAO is null)
  or (:new.TRGUSERINCLUSAO <> :old.TRGUSERINCLUSAO) or
     (:new.TRGUSERINCLUSAO is null and :old.TRGUSERINCLUSAO is not null) or
     (:new.TRGUSERINCLUSAO is not null and :old.TRGUSERINCLUSAO is null)
  or (:new.UNIDNEGOC <> :old.UNIDNEGOC) or
     (:new.UNIDNEGOC is null and :old.UNIDNEGOC is not null) or
     (:new.UNIDNEGOC is not null and :old.UNIDNEGOC is null)
  or (:new.REFERENCIA <> :old.REFERENCIA) or
     (:new.REFERENCIA is null and :old.REFERENCIA is not null) or
     (:new.REFERENCIA is not null and :old.REFERENCIA is null)
  or (:new.OBS <> :old.OBS) or
     (:new.OBS is null and :old.OBS is not null) or
     (:new.OBS is not null and :old.OBS is null)
  or (:new.FLGCONFIRMARECPAG <> :old.FLGCONFIRMARECPAG) or
     (:new.FLGCONFIRMARECPAG is null and :old.FLGCONFIRMARECPAG is not null) or
     (:new.FLGCONFIRMARECPAG is not null and :old.FLGCONFIRMARECPAG is null)
  or (:new.IDCBANCARIA <> :old.IDCBANCARIA) or
     (:new.IDCBANCARIA is null and :old.IDCBANCARIA is not null) or
     (:new.IDCBANCARIA is not null and :old.IDCBANCARIA is null)
  or (:new.NUMCPBAIXA <> :old.NUMCPBAIXA) or
     (:new.NUMCPBAIXA is null and :old.NUMCPBAIXA is not null) or
     (:new.NUMCPBAIXA is not null and :old.NUMCPBAIXA is null)
  or (:new.GRUPODOC <> :old.GRUPODOC) or
     (:new.GRUPODOC is null and :old.GRUPODOC is not null) or
     (:new.GRUPODOC is not null and :old.GRUPODOC is null)
  or (:new.FLGNAOCONCILIADO <> :old.FLGNAOCONCILIADO) or
     (:new.FLGNAOCONCILIADO is null and :old.FLGNAOCONCILIADO is not null) or
     (:new.FLGNAOCONCILIADO is not null and :old.FLGNAOCONCILIADO is null)
  or (:new.CODGERADORINSS <> :old.CODGERADORINSS) or
     (:new.CODGERADORINSS is null and :old.CODGERADORINSS is not null) or
     (:new.CODGERADORINSS is not null and :old.CODGERADORINSS is null)
  or (:new.FLGTIPODOCUMENTO <> :old.FLGTIPODOCUMENTO) or
     (:new.FLGTIPODOCUMENTO is null and :old.FLGTIPODOCUMENTO is not null) or
     (:new.FLGTIPODOCUMENTO is not null and :old.FLGTIPODOCUMENTO is null)
  or (:new.DATADISPONIB <> :old.DATADISPONIB) or
     (:new.DATADISPONIB is null and :old.DATADISPONIB is not null) or
     (:new.DATADISPONIB is not null and :old.DATADISPONIB is null)
  or (:new.IDSEGREGACRITER <> :old.IDSEGREGACRITER) or
     (:new.IDSEGREGACRITER is null and :old.IDSEGREGACRITER is not null) or
     (:new.IDSEGREGACRITER is not null and :old.IDSEGREGACRITER is null)
  or (:new.IDPROCESSO <> :old.IDPROCESSO) or
     (:new.IDPROCESSO is null and :old.IDPROCESSO is not null) or
     (:new.IDPROCESSO is not null and :old.IDPROCESSO is null)
  or (:new.FLGCONTAINVEST <> :old.FLGCONTAINVEST) or
     (:new.FLGCONTAINVEST is null and :old.FLGCONTAINVEST is not null) or
     (:new.FLGCONTAINVEST is not null and :old.FLGCONTAINVEST is null)
  or (:new.FLGIMPORTADO <> :old.FLGIMPORTADO) or
     (:new.FLGIMPORTADO is null and :old.FLGIMPORTADO is not null) or
     (:new.FLGIMPORTADO is not null and :old.FLGIMPORTADO is null)
  or (:new.PLACONTAANT <> :old.PLACONTAANT) or
     (:new.PLACONTAANT is null and :old.PLACONTAANT is not null) or
     (:new.PLACONTAANT is not null and :old.PLACONTAANT is null)
  or (:new.QTDECOTAS <> :old.QTDECOTAS) or
     (:new.QTDECOTAS is null and :old.QTDECOTAS is not null) or
     (:new.QTDECOTAS is not null and :old.QTDECOTAS is null)
  or (:new.IDENVIODOCUMENTO <> :old.IDENVIODOCUMENTO) or
     (:new.IDENVIODOCUMENTO is null and :old.IDENVIODOCUMENTO is not null) or
     (:new.IDENVIODOCUMENTO is not null and :old.IDENVIODOCUMENTO is null)
  or (:new.IDEMISSBANCARIA <> :old.IDEMISSBANCARIA) or
     (:new.IDEMISSBANCARIA is null and :old.IDEMISSBANCARIA is not null) or
     (:new.IDEMISSBANCARIA is not null and :old.IDEMISSBANCARIA is null)
  or (:new.FLGSIMPLES <> :old.FLGSIMPLES) or
     (:new.FLGSIMPLES is null and :old.FLGSIMPLES is not null) or
     (:new.FLGSIMPLES is not null and :old.FLGSIMPLES is null)
  or (:new.FLGESPECIAL <> :old.FLGESPECIAL) or
     (:new.FLGESPECIAL is null and :old.FLGESPECIAL is not null) or
     (:new.FLGESPECIAL is not null and :old.FLGESPECIAL is null)
  or (:new.FLGSERVICOEXEC <> :old.FLGSERVICOEXEC) or
     (:new.FLGSERVICOEXEC is null and :old.FLGSERVICOEXEC is not null) or
     (:new.FLGSERVICOEXEC is not null and :old.FLGSERVICOEXEC is null)
  or (:new.FLGREGISTRADO <> :old.FLGREGISTRADO) or
     (:new.FLGREGISTRADO is null and :old.FLGREGISTRADO is not null) or
     (:new.FLGREGISTRADO is not null and :old.FLGREGISTRADO is null)
  or (:new.NFSNUMERO <> :old.NFSNUMERO) or
     (:new.NFSNUMERO is null and :old.NFSNUMERO is not null) or
     (:new.NFSNUMERO is not null and :old.NFSNUMERO is null)
  or (:new.NFSSERIE <> :old.NFSSERIE) or
     (:new.NFSSERIE is null and :old.NFSSERIE is not null) or
     (:new.NFSSERIE is not null and :old.NFSSERIE is null)
  or (:new.NFSDATAEMISSAO <> :old.NFSDATAEMISSAO) or
     (:new.NFSDATAEMISSAO is null and :old.NFSDATAEMISSAO is not null) or
     (:new.NFSDATAEMISSAO is not null and :old.NFSDATAEMISSAO is null)
  or (:new.NFSOBS <> :old.NFSOBS) or
     (:new.NFSOBS is null and :old.NFSOBS is not null) or
     (:new.NFSOBS is not null and :old.NFSOBS is null)
  or (:new.DATAREGISTRO <> :old.DATAREGISTRO) or
     (:new.DATAREGISTRO is null and :old.DATAREGISTRO is not null) or
     (:new.DATAREGISTRO is not null and :old.DATAREGISTRO is null)
  or (:new.SITUACAOREGISTRO <> :old.SITUACAOREGISTRO) or
     (:new.SITUACAOREGISTRO is null and :old.SITUACAOREGISTRO is not null) or
     (:new.SITUACAOREGISTRO is not null and :old.SITUACAOREGISTRO is null)
  or (:new.NUMPROCESSO <> :old.NUMPROCESSO) or
     (:new.NUMPROCESSO is null and :old.NUMPROCESSO is not null) or
     (:new.NUMPROCESSO is not null and :old.NUMPROCESSO is null)
  or (:new.PARTEFUNCEF <> :old.PARTEFUNCEF) or
     (:new.PARTEFUNCEF is null and :old.PARTEFUNCEF is not null) or
     (:new.PARTEFUNCEF is not null and :old.PARTEFUNCEF is null)
  or (:new.PARTECONTRARIA <> :old.PARTECONTRARIA) or
     (:new.PARTECONTRARIA is null and :old.PARTECONTRARIA is not null) or
     (:new.PARTECONTRARIA is not null and :old.PARTECONTRARIA is null)
  then
    insert into LOGPLANUS.LOG_PLANUS_DOCUMENTO (
        IDLOGDOCUMENTO,
        CODDOCUMENTO,
        IDPESSOA,
        CODFORMA,
        CODPORTFORMA,
        INDICECORRECAO,
        CODSUBCONTA,
        PLANO,
        PLACONTA,
        MOECODIGO,
        IDEMPRESA,
        CODCENTROCUSTO,
        IDFORCLI,
        IDMODULO,
        CODTIPDOC,
        RECPAG,
        NODOCUMENTO,
        COMPLDOCUMENTO,
        DATAEMISSAO,
        DATAVENCTO,
        DATAPROGRAMADA,
        STATUS,
        NUMFATURA,
        OPERACAO,
        IDUSUARIOINCLUSAO,
        NUMSLIP,
        EMISBLOQ,
        DATALIMITE,
        VALORDESCONTO,
        NOSSONUMERO,
        VALORJUROS,
        LOTETRANSMISSAO,
        CONTROLEREMESSA,
        DATAREMESSA,
        VLRMULTA,
        CODGRUPOCNAB,
        NUMAPGR,
        NUMLEITCODBARRAS,
        NUMDIGCODBARRAS,
        FLGEMITELANCBAIX,
        DATACORRECAO,
        PERCJUROSATUARIAL,
        PERCJUROSSIMPLES,
        TRGDTINCLUSAO,
        TRGUSERINCLUSAO,
        UNIDNEGOC,
        REFERENCIA,
        OBS,
        FLGCONFIRMARECPAG,
        IDCBANCARIA,
        NUMCPBAIXA,
        GRUPODOC,
        FLGNAOCONCILIADO,
        CODGERADORINSS,
        FLGTIPODOCUMENTO,
        DATADISPONIB,
        IDSEGREGACRITER,
        IDPROCESSO,
        FLGCONTAINVEST,
        FLGIMPORTADO,
        PLACONTAANT,
        QTDECOTAS,
        IDENVIODOCUMENTO,
        IDEMISSBANCARIA,
        FLGSIMPLES,
        FLGESPECIAL,
        FLGSERVICOEXEC,
        FLGREGISTRADO,
        NFSNUMERO,
        NFSSERIE,
        NFSDATAEMISSAO,
        NFSOBS,
        DATAREGISTRO,
        SITUACAOREGISTRO,
        NUMPROCESSO,
        PARTEFUNCEF,
        PARTECONTRARIA, 
        ROWIDORIGEM, 
        OPERACAO_LOG,
        TRGDTALTERACAO,
        TRGUSERALTERACAO
       )
    values (
      LOGPLANUS.SEQLOGPLANUS_DOCUMENTO.NEXTVAL,
      :old.CODDOCUMENTO,
      :old.IDPESSOA,
      :old.CODFORMA,
      :old.CODPORTFORMA,
      :old.INDICECORRECAO,
      :old.CODSUBCONTA,
      :old.PLANO,
      :old.PLACONTA,
      :old.MOECODIGO,
      :old.IDEMPRESA,
      :old.CODCENTROCUSTO,
      :old.IDFORCLI,
      :old.IDMODULO,
      :old.CODTIPDOC,
      :old.RECPAG,
      :old.NODOCUMENTO,
      :old.COMPLDOCUMENTO,
      :old.DATAEMISSAO,
      :old.DATAVENCTO,
      :old.DATAPROGRAMADA,
      :old.STATUS,
      :old.NUMFATURA,
      :old.OPERACAO,
      :old.IDUSUARIOINCLUSAO,
      :old.NUMSLIP,
      :old.EMISBLOQ,
      :old.DATALIMITE,
      :old.VALORDESCONTO,
      :old.NOSSONUMERO,
      :old.VALORJUROS,
      :old.LOTETRANSMISSAO,
      :old.CONTROLEREMESSA,
      :old.DATAREMESSA,
      :old.VLRMULTA,
      :old.CODGRUPOCNAB,
      :old.NUMAPGR,
      :old.NUMLEITCODBARRAS,
      :old.NUMDIGCODBARRAS,
      :old.FLGEMITELANCBAIX,
      :old.DATACORRECAO,
      :old.PERCJUROSATUARIAL,
      :old.PERCJUROSSIMPLES,
      :old.TRGDTINCLUSAO,
      :old.TRGUSERINCLUSAO,
      :old.UNIDNEGOC,
      :old.REFERENCIA,
      :old.OBS,
      :old.FLGCONFIRMARECPAG,
      :old.IDCBANCARIA,
      :old.NUMCPBAIXA,
      :old.GRUPODOC,
      :old.FLGNAOCONCILIADO,
      :old.CODGERADORINSS,
      :old.FLGTIPODOCUMENTO,
      :old.DATADISPONIB,
      :old.IDSEGREGACRITER,
      :old.IDPROCESSO,
      :old.FLGCONTAINVEST,
      :old.FLGIMPORTADO,
      :old.PLACONTAANT,
      :old.QTDECOTAS,
      :old.IDENVIODOCUMENTO,
      :old.IDEMISSBANCARIA,
      :old.FLGSIMPLES,
      :old.FLGESPECIAL,
      :old.FLGSERVICOEXEC,
      :old.FLGREGISTRADO,
      :old.NFSNUMERO,
      :old.NFSSERIE,
      :old.NFSDATAEMISSAO,
      :old.NFSOBS,
      :old.DATAREGISTRO,
      :old.SITUACAOREGISTRO,
      :old.NUMPROCESSO,
      :old.PARTEFUNCEF,
      :old.PARTECONTRARIA, 
      :old.rowid, 
      vTipoOperacao,
      sysdate,
      user
     );
  end if;
end;