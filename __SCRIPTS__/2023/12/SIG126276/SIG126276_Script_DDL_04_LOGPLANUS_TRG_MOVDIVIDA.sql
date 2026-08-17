create or replace trigger CM.TUDLOGALT_MOVDIVIDA
  before update of
  
  IDMOVDIVIDABENEFICIO,
  IDCONTROLEDIVIDABENEFICIO,
  IDPESSOA,
  IDTITULAR,
  IDBENEFICIO,
  IDPLANOPREV,
  DATAMOV,
  IDTIPOMOVDIVIDA,
  VALORULTIMAPARCELA,
  VALORPARCELA,
  SALDODEVEDORANT,
  SALDODEVEDORATUAL,
  MESINICIO,
  MESFIM,
  QTDEPARCELASANT,
  QTDEPARCELASATUAL,
  FLGDESATIVADO,
  FLGATUALIZARSALDO,
  FLGQUITADO,
  FLGDESCFOLHA,
  FLGPORTFORMA,
  FLGSTATUS,
  OBSERVACAO,
  ULTMESREAJ,
  FLGACAOJUD,
  SALDOPROVPERDA,
  SALDOBAIXADEF
  
  or delete on CM.MOVDIVIDA
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

  if (:new.IDMOVDIVIDABENEFICIO <> :old.IDMOVDIVIDABENEFICIO) or
     (:new.IDMOVDIVIDABENEFICIO is null and :old.IDMOVDIVIDABENEFICIO is not null) or
     (:new.IDMOVDIVIDABENEFICIO is not null and :old.IDMOVDIVIDABENEFICIO is null)

  or (:new.IDCONTROLEDIVIDABENEFICIO <> :old.IDCONTROLEDIVIDABENEFICIO) or
     (:new.IDCONTROLEDIVIDABENEFICIO is null and :old.IDCONTROLEDIVIDABENEFICIO is not null) or
     (:new.IDCONTROLEDIVIDABENEFICIO is not null and :old.IDCONTROLEDIVIDABENEFICIO is null)

  or (:new.IDPESSOA <> :old.IDPESSOA) or
     (:new.IDPESSOA is null and :old.IDPESSOA is not null) or
     (:new.IDPESSOA is not null and :old.IDPESSOA is null)

  or (:new.IDTITULAR <> :old.IDTITULAR) or
     (:new.IDTITULAR is null and :old.IDTITULAR is not null) or
     (:new.IDTITULAR is not null and :old.IDTITULAR is null)

  or (:new.IDBENEFICIO <> :old.IDBENEFICIO) or
     (:new.IDBENEFICIO is null and :old.IDBENEFICIO is not null) or
     (:new.IDBENEFICIO is not null and :old.IDBENEFICIO is null)

  or (:new.IDPLANOPREV <> :old.IDPLANOPREV) or
     (:new.IDPLANOPREV is null and :old.IDPLANOPREV is not null) or
     (:new.IDPLANOPREV is not null and :old.IDPLANOPREV is null)

  or (:new.DATAMOV <> :old.DATAMOV) or
     (:new.DATAMOV is null and :old.DATAMOV is not null) or
     (:new.DATAMOV is not null and :old.DATAMOV is null)
	 
  or (:new.IDTIPOMOVDIVIDA <> :old.IDTIPOMOVDIVIDA) or
     (:new.IDTIPOMOVDIVIDA is null and :old.IDTIPOMOVDIVIDA is not null) or
     (:new.IDTIPOMOVDIVIDA is not null and :old.IDTIPOMOVDIVIDA is null)

  or (:new.VALORULTIMAPARCELA <> :old.VALORULTIMAPARCELA) or
     (:new.VALORULTIMAPARCELA is null and :old.VALORULTIMAPARCELA is not null) or
     (:new.VALORULTIMAPARCELA is not null and :old.VALORULTIMAPARCELA is null)

  or (:new.VALORPARCELA <> :old.VALORPARCELA) or
     (:new.VALORPARCELA is null and :old.VALORPARCELA is not null) or
     (:new.VALORPARCELA is not null and :old.VALORPARCELA is null)

  or (:new.SALDODEVEDORANT <> :old.SALDODEVEDORANT) or
     (:new.SALDODEVEDORANT is null and :old.SALDODEVEDORANT is not null) or
     (:new.SALDODEVEDORANT is not null and :old.SALDODEVEDORANT is null)

  or (:new.SALDODEVEDORATUAL <> :old.SALDODEVEDORATUAL) or
     (:new.SALDODEVEDORATUAL is null and :old.SALDODEVEDORATUAL is not null) or
     (:new.SALDODEVEDORATUAL is not null and :old.SALDODEVEDORATUAL is null)

  or (:new.MESINICIO <> :old.MESINICIO) or
     (:new.MESINICIO is null and :old.MESINICIO is not null) or
     (:new.MESINICIO is not null and :old.MESINICIO is null)

  or (:new.MESFIM <> :old.MESFIM) or
     (:new.MESFIM is null and :old.MESFIM is not null) or
     (:new.MESFIM is not null and :old.MESFIM is null)
	 
  or (:new.QTDEPARCELASANT <> :old.QTDEPARCELASANT) or
     (:new.QTDEPARCELASANT is null and :old.QTDEPARCELASANT is not null) or
     (:new.QTDEPARCELASANT is not null and :old.QTDEPARCELASANT is null)

  or (:new.QTDEPARCELASATUAL <> :old.QTDEPARCELASATUAL) or
     (:new.QTDEPARCELASATUAL is null and :old.QTDEPARCELASATUAL is not null) or
     (:new.QTDEPARCELASATUAL is not null and :old.QTDEPARCELASATUAL is null)

  or (:new.FLGDESATIVADO <> :old.FLGDESATIVADO) or
     (:new.FLGDESATIVADO is null and :old.FLGDESATIVADO is not null) or
     (:new.FLGDESATIVADO is not null and :old.FLGDESATIVADO is null)
	 
  or (:new.FLGATUALIZARSALDO <> :old.FLGATUALIZARSALDO) or
     (:new.FLGATUALIZARSALDO is null and :old.FLGATUALIZARSALDO is not null) or
     (:new.FLGATUALIZARSALDO is not null and :old.FLGATUALIZARSALDO is null)
	 
  or (:new.FLGQUITADO <> :old.FLGQUITADO) or
     (:new.FLGQUITADO is null and :old.FLGQUITADO is not null) or
     (:new.FLGQUITADO is not null and :old.FLGQUITADO is null)
	 
  or (:new.FLGDESCFOLHA <> :old.FLGDESCFOLHA) or
     (:new.FLGDESCFOLHA is null and :old.FLGDESCFOLHA is not null) or
     (:new.FLGDESCFOLHA is not null and :old.FLGDESCFOLHA is null)	 

  or (:new.FLGPORTFORMA <> :old.FLGPORTFORMA) or
     (:new.FLGPORTFORMA is null and :old.FLGPORTFORMA is not null) or
     (:new.FLGPORTFORMA is not null and :old.FLGPORTFORMA is null)
	 
  or (:new.FLGSTATUS <> :old.FLGSTATUS) or
     (:new.FLGSTATUS is null and :old.FLGSTATUS is not null) or
     (:new.FLGSTATUS is not null and :old.FLGSTATUS is null)
	 
  or (:new.OBSERVACAO <> :old.OBSERVACAO) or
     (:new.OBSERVACAO is null and :old.OBSERVACAO is not null) or
     (:new.OBSERVACAO is not null and :old.OBSERVACAO is null)
	 
  or (:new.ULTMESREAJ <> :old.ULTMESREAJ) or
     (:new.ULTMESREAJ is null and :old.ULTMESREAJ is not null) or
     (:new.ULTMESREAJ is not null and :old.ULTMESREAJ is null)

  or (:new.FLGACAOJUD <> :old.FLGACAOJUD) or
     (:new.FLGACAOJUD is null and :old.FLGACAOJUD is not null) or
     (:new.FLGACAOJUD is not null and :old.FLGACAOJUD is null)
	 
  or (:new.SALDOPROVPERDA <> :old.SALDOPROVPERDA) or
     (:new.SALDOPROVPERDA is null and :old.SALDOPROVPERDA is not null) or
     (:new.SALDOPROVPERDA is not null and :old.SALDOPROVPERDA is null)	 

  or (:new.SALDOBAIXADEF <> :old.SALDOBAIXADEF) or
     (:new.SALDOBAIXADEF is null and :old.SALDOBAIXADEF is not null) or
     (:new.SALDOBAIXADEF is not null and :old.SALDOBAIXADEF is null)
	 
  then
  
    insert into LOGPLANUS.LOG_PLANUS_MOVDIVIDA (
        IDLOGIDMOVDIVIDABENEFICIO,
        IDMOVDIVIDABENEFICIO,
        IDCONTROLEDIVIDABENEFICIO,
        IDPESSOA,
        IDTITULAR,
        IDBENEFICIO,
        IDPLANOPREV,
        DATAMOV,
        IDTIPOMOVDIVIDA,
        VALORULTIMAPARCELA,
        VALORPARCELA,
        SALDODEVEDORANT,
        SALDODEVEDORATUAL,
        MESINICIO,
        MESFIM,
        QTDEPARCELASANT,
        QTDEPARCELASATUAL,
        FLGDESATIVADO,
        FLGATUALIZARSALDO,
        FLGQUITADO,
        FLGDESCFOLHA,
        FLGPORTFORMA,
        FLGSTATUS,
        OBSERVACAO,
        ULTMESREAJ,
        FLGACAOJUD,
        SALDOPROVPERDA,
        SALDOBAIXADEF,
        TRGUSERINCLUSAO,
        TRGDTINCLUSAO,
        ROWIDORIGEM, 
        OPERACAO,
        TRGDTALTERACAO,
        TRGUSERALTERACAO
       )
    values (
      LOGPLANUS.SEQLOGPLANUS_MOVDIVIDA.NEXTVAL,
      :old.IDMOVDIVIDABENEFICIO,
      :old.IDCONTROLEDIVIDABENEFICIO,
      :old.IDPESSOA,
      :old.IDTITULAR,
      :old.IDBENEFICIO,
      :old.IDPLANOPREV,
      :old.DATAMOV,
      :old.IDTIPOMOVDIVIDA,
      :old.VALORULTIMAPARCELA,
      :old.VALORPARCELA,
      :old.SALDODEVEDORANT,
      :old.SALDODEVEDORATUAL,
      :old.MESINICIO,
      :old.MESFIM,
      :old.QTDEPARCELASANT,
      :old.QTDEPARCELASATUAL,
      :old.FLGDESATIVADO,
      :old.FLGATUALIZARSALDO,
      :old.FLGQUITADO,
      :old.FLGDESCFOLHA,
      :old.FLGPORTFORMA,
      :old.FLGSTATUS,
      :old.OBSERVACAO,
      :old.ULTMESREAJ,
      :old.FLGACAOJUD,
      :old.SALDOPROVPERDA,
      :old.SALDOBAIXADEF,
      :old.TRGUSERINCLUSAO,
      :old.TRGDTINCLUSAO,
      :old.rowid, 
      vTipoOperacao,
      sysdate,
      user
     );
  end if;
end;
