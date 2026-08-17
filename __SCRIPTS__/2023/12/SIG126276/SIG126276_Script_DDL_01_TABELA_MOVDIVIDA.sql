--CRIAÇÃO DA TABELA.
CREATE TABLE CM.MOVDIVIDA (
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
	SALDODEVEDORANT            NUMBER NOT NULL ,
	SALDODEVEDORATUAL          NUMBER NOT NULL ,
	MESINICIO                  DATE   NOT NULL ,
	MESFIM                     DATE   NOT NULL ,
	QTDEPARCELASANT            NUMBER NOT NULL ,
	QTDEPARCELASATUAL          NUMBER NOT NULL ,
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
	TRGUSERINCLUSAO            VARCHAR(30) DEFAULT USER
); 

-- CRIAÇÃO DA CHAVE PRIMARIA DA TABELA 
ALTER TABLE CM.MOVDIVIDA
  ADD CONSTRAINT XPKMOVDIVIDA PRIMARY KEY (IDMOVDIVIDABENEFICIO)
  USING INDEX 
  TABLESPACE INDICES
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 3208K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  ); 

-- CRIAÇÃO DA CHAVE ESTRANGEIRA DA TABELA 
ALTER TABLE CM.MOVDIVIDA ADD CONSTRAINT FK_MOVDIVIDA_CTRLEDIVIDABENEF
  FOREIGN KEY (IDCONTROLEDIVIDABENEFICIO) REFERENCES CM.CONTROLEDIVIDABENEFICIO (IDCONTROLEDIVIDABENEFICIO);

-- Add comments to table
comment on table cm.MOVDIVIDA is 'Movimentações da dívida de benefícios';

-- Add comments to the columns 
COMMENT ON COLUMN CM.MOVDIVIDA.IDMOVDIVIDABENEFICIO IS 'Sequencial identificador da movimentação da dívida' ;
COMMENT ON COLUMN CM.MOVDIVIDA.IDCONTROLEDIVIDABENEFICIO IS 'Sequencial identificador de controle de dívida de benefício' ;
COMMENT ON COLUMN CM.MOVDIVIDA.IDPESSOA IS 'Identificador de pessoa' ;
COMMENT ON COLUMN CM.MOVDIVIDA.IDTITULAR IS 'Identificador do titular no plano previdenciário' ;
COMMENT ON COLUMN CM.MOVDIVIDA.IDBENEFICIO IS 'Identificador do benefício do aposentado ou pensionista' ;
COMMENT ON COLUMN CM.MOVDIVIDA.IDPLANOPREV IS 'Identificador do plano previdenciário do participante' ;
COMMENT ON COLUMN CM.MOVDIVIDA.DATAMOV IS 'Data de movimento da divida' ;
COMMENT ON COLUMN CM.MOVDIVIDA.IDTIPOMOVDIVIDA IS 'Operação que originou o movimento da divida' ;
COMMENT ON COLUMN CM.MOVDIVIDA.VALORULTIMAPARCELA IS 'Valor da ultima parcela da divida.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.VALORPARCELA IS 'Valor da parcela atual' ;
COMMENT ON COLUMN CM.MOVDIVIDA.SALDODEVEDORATUAL IS 'Saldo devedor atual da divida.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.SALDODEVEDORANT IS 'Saldo devedor anterior da divida.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.MESINICIO IS 'Mes de inicio da divida de beneficio.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.MESFIM IS 'Mes final da divida de beneficio.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.QTDEPARCELASANT IS 'Quantidade total de parcelas anterior.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.QTDEPARCELASATUAL IS 'Quantidade total de parcelas atual.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGDESATIVADO IS 'Flag que indica se a divida esta desativada. 0-Não, 1-Sim.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGATUALIZARSALDO IS 'Flag que indica atualização de saldo. 0-Não, 1-Sim.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGQUITADO IS 'Flag de quitação da divida. 0-Não, 1-Sim.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGDESCFOLHA IS 'Flag de desconto da divida. B-Folha, P-Banco.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGPORTFORMA IS 'Flag que indica o portador forma (alterador) associado.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGSTATUS IS 'Status da dívida de benefício: 1 - Ativa, 2 - Suspensa, 3 - Encerrada' ;
COMMENT ON COLUMN CM.MOVDIVIDA.OBSERVACAO IS 'Observações sobre a parcela' ;
COMMENT ON COLUMN CM.MOVDIVIDA.ULTMESREAJ IS 'Último mês/ano de reajuste da dívida.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.FLGACAOJUD IS 'Indicativo de processo judicial relacionado à suspensão da dívida' ;
COMMENT ON COLUMN CM.MOVDIVIDA.SALDOPROVPERDA IS 'Saldo para provisão de perda' ;
COMMENT ON COLUMN CM.MOVDIVIDA.SALDOBAIXADEF IS 'Saldo para baixa definitiva' ;
COMMENT ON COLUMN CM.MOVDIVIDA.TRGDTINCLUSAO IS 'Data da inclusão do registro. Evento de auditoria preenchido no momento da última alteração do registro no banco de dados.' ;
COMMENT ON COLUMN CM.MOVDIVIDA.TRGUSERINCLUSAO IS 'Usuário responsável pela inclusão do registro. Evento de auditoria preenchido no momento da última alteração do registro no banco de dados.' ;
