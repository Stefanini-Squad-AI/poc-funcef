//******************************************************************************
// Data     : 20/01/2005
// Código   : AL_1
// Motivo   : Implementaçao da definicão de TIPMOVBOLETA da tabela BOLETA
//******************************************************************************
unit uHelp;

interface

Type
   THelp = Class(TObject)

   private

   public

end;

var
   Help : THelp;

implementation

{
IDENTIFICADORES DOS TIPOS DE ITENS DE RENDA FIXA
================================================
I - Imposto
L - Lucro
M - Moeda
P - PU
T - Taxa
V - Valor
R - Percentual

   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-1');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-2');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-2');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''P'' WHERE IDITEMRENFIX=-3');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''P'' WHERE IDITEMRENFIX=-4');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-5');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-6');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-7');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-8');
   ExecutaQuery(QryAuxiliar,'UPDATE ITEMRENFIX SET TIPOITEM=''V'' WHERE IDITEMRENFIX=-9');


INSERT DE ITENS DE RENDA  NAS TABELA ITEMRENFIX, CMPBD E CMPBDGRP
=================================================================

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-1,'Principal','VLRPRINCIPAL','N','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRPRINC','DUAL','VLRPRINCIPAL','Principal', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRPRINC');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-2,'Quantidade','QUANTIDADE','N','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_QUANTIDA','DUAL','QUANTIDADE','Quantidade', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_QUANTIDA');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-3,'PU de Emissão','PUEMISSAO   ','N','P');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_PUEMI','DUAL','PUEMISSAO','PU de Emissão', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_PUEMI');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-4,'PU da Operação','PUOPERACAO  ','N','P');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_PUOPER','DUAL','PUOPERACAO','PU da Operação', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_PUOPER');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-5,'Valor Líquido','VLRLIQUIDO  ','Y','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRLIQUI','DUAL','VLRLIQUIDO','Valor Líquido', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRLIQUI');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-6,'Valor Bruto','VLRBRUTO    ','Y','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRBRUTO','DUAL','VLRBRUTO','Valor Bruto', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRBRUTO');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-7,'Imposto de Renda','VLRIR       ','Y','I');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRIR','DUAL','VLRIR','Imposto de Renda', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRIR');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-8,'IOF','VLRIOF      ','Y','I');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRIOF','DUAL','VLRIOF','IOF', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRIOF');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES
(-9,'Lucro / Prejuízo','LUCPREJ     ','Y','L');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_LUCPREJ','DUAL','LUCPREJ','Lucro / Prejuízo', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_LUCPREJ');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES
(-10,'Prejuizo','LUCPREJ     ','Y','L');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_LUCPREJ','DUAL','LUCPREJ','Lucro / Prejuízo', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_LUCPREJ');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES
(-11,'PU Atualizado','PUATUALIZADO','Y','P');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_PUATUALI','DUAL','PUATUALIZADO','PU ATUALIZADO', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_PUATUALI');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES
(-12,'TAXA DA BOLSA','VLRTXBOLSA','N','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRTXBOL','DUAL','VLRTXBOLSA','TAXA DA BOLSA', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRTXBOL');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES
(-13,'TAXA DE EMOLUMENTOS','VLRTXEMOL','N','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRTXEMO','DUAL','VLRTXEMOL','TAXA DE EMOLUMENTOS', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRTXEMO');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-14,'Valor Bruto Original','VLRBRUTOORIG ','Y','V');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRBRORI','DUAL','VLRBRORI','Valor Bruto Original', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRBRORI');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-15,'Provisão para Perda','VLRPROPERDA','Y','R');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_VLRPROPE','DUAL','VLRPROPERDA','Provisão para Perda', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_VLRPROPE');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-16,'Correção Negativa','PUCORNEG','Y','M');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_PUCORNEG','DUAL','PUCORNEG','Correção Negativa', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_PUCORNEG');

INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES
(-17,'Rendimento','RENDIMENTO','Y','M');

INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES
('INV_RENDIMENTO','DUAL','RENDIMENTO','Rendimento', 2, 1);

INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES
('INVEST','INV_RENDIMENTO');


    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-1,''Principal'',''VLRPRINCIPAL'',''N'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRPRINC'',''DUAL'',''VLRPRINCIPAL'',''Principal'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRPRINC'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-2,''Quantidade'',''QUANTIDADE'',''N'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_QUANTIDA'',''DUAL'',''QUANTIDADE'',''Quantidade'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_QUANTIDA'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-3,''PU de Emissão'','PUEMISSAO'',''N'',''P')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_PUEMI'',''DUAL'',''PUEMISSAO'',''PU de Emissão'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_PUEMI'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-4,''PU da Operação'',''PUOPERACAO'',''N'',''P')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_PUOPER'',''DUAL'',''PUOPERACAO'',''PU da Operação'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_PUOPER'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-5,''Valor Líquido'',''VLRLIQUIDO'',''Y'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRLIQUI'',''DUAL'',''VLRLIQUIDO'',''Valor Líquido'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRLIQUI'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-6,''Valor Bruto'',''VLRBRUTO'',''Y'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRBRUTO'',''DUAL'',''VLRBRUTO'',''Valor Bruto'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRBRUTO'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-7,''Imposto de Renda'',''VLRIR'',''Y'',''I'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRIR'',''DUAL'',''VLRIR'',''Imposto de Renda'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRIR'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA,TIPOITEM) VALUES (-8,''IOF'',''VLRIOF'',''Y'',''I'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRIOF'',''DUAL'',''VLRIOF'',''IOF'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRIOF'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-9,''Lucro / Prejuízo'',''LUCPREJ     '',''Y'',''L'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_LUCPREJ'',''DUAL'',''LUCPREJ'',''Lucro / Prejuízo'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_LUCPREJ'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-10,''Prejuizo'',''LUCPREJ     '',''Y'',''L'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_LUCPREJ'',''DUAL'',''LUCPREJ'',''LUCRO / PREJUIZO'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_LUCPREJ'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-11,''PU Atualizado'',''PUATUALIZADO'',''Y'',''P'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_PUATUALI'',''DUAL'',''PUATUALIZADO'',''PU ATUALIZADO'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_PUATUALI'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-12,''TAXA DA BOLSA'',''VLRTXBOLSA'',''N'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRTXBOL'',''DUAL'',''VLRTXBOLSA'',''TAXA DA BOLSA'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRTXBOL'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-13,''TAXA DE EMOLUMENTOS'',''VLRTXEMOL'',''N'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRTXEMO'',''DUAL'',''VLRTXEMOL'',''TAXA DE EMOLUMENTOS'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRTXEMO'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-14,''Valor Bruto Original'',''VLRBRUTOORIG'',''Y'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRBRORI'',''DUAL'',''VLRBRORI'',''Valor Bruto Original'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRBRORI'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-15,''Provisão para Perda'',''VLRPROPERDA'',''Y'',''V'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_VLRPROPE'',''DUAL'',''VLRPROPERDA'',''Provisão para Perda'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_VLRPROPE'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-16,''Correção Negativa'',''PUCORNEG'',''Y'',''M'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_PUCORNEG'',''DUAL'',''PUCORNEG'',''Correção Negativa'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_PUCORNEG'')');

    ExecutaQuery(QryAuxiliar,'INSERT INTO ITEMRENFIX (IDITEMRENFIX,DESCITEMRENFIX,CODITEMRENFIX,FLGREGRA, TIPOITEM) VALUES (-17,''Rendimento'',''RENDIMENTO'',''Y'',''M'')');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, IDTIPODADO) VALUES (''INV_RENDIMENTO'',''DUAL'',''RENDIMENTO'',''Rendimento'', 2, 1)');
    ExecutaQuery(QryAuxiliar,'INSERT INTO CMPBDGRP (CODGRUPOARQUIVO, IDCAMPO) VALUES (''INVEST'',''INV_RENDIMENTO'')');

// AL_1
TIPMOVCUSTODIA
--------------
OPE - OPERAÇÕES DE COMPRA E VENDA
TRC - TRANSFERÊNCIA ENTRE CARTEIRAS
TCG - TRANSFERENCIA ENTRE CARTEIRAS GERENCIAIS
AJC - AJUSTE DE CUSTO
DTO - DIVIDENDOS / JUROS SOBRE CAPITAL / MULTA
DTA - ANUNCIO DE PROVENTOS
DTG - GRUPAMENTO
DTS - SUBSCRIÇÃO
DTI - INCORPORACAO
DTB - BONIFICAÇÃO
DTD - DIREITOS - DESDOBRAMENTO
DRS - DIREITOS - RESTITUIÇÃO DE CAPITAL
DCI - DIREITOS - CISÃO
AJQ - AJUSTE DE QUANTIDADE
PEN - PENDENCIA DE LIQUIDAÇÃO
VSU - VENCIMENTO DE SUBSCRIÇÃO
}

{
TIPOS DE ITENS DE RENDA FIXA NEGATIVOS
======================================
IDITEMRENFIX    DESCITEMRENFIX
-1              Principal
-2              Quantidade
-3              PU Emissao
-4              PU da Operacao
-5              Valor Líquido
-6              Valor Bruto
-7              Imposto de Renda
-8              IOF
-9              Lucro
-10             Prejuízo
-11             PU Atualizado
-12             Taxa de Bolsa
-13             Taxa de Emolumentos
-14             Valor Bruto Original
-15             Provisão para Perda
-16             Correção Negativa
-17             Rendimento


TIPOS DE OPERACAO NEGATIVOS
===========================
IDTIPOINVEST    IDTIPOOPERACAO DESCTIPOOPERACAO                                              NATUREZAOPERACAO    TIPOCUSTODIA    VENCIMENTO    FLGGERACONTAB    FLGGERACAPCAR    RECPAG    TIPCREDOR    FLGGERACAF    FLGTRANSF    FLGCORRET    TRGDTINCLUSAO       TRGUSERINCLUSAO                 FLGORDMOVINV    IDMOTIVOBLOQUEIO    FLGOPDIREITO    FLGAGE    FLGDATAEX    FLGDATACOM    FLGINVORIGEM    FLGPERC    FLGPARIDADE    FLGPRZBOLSA    FLGPRZEMP    FLGATADEC    FLGFORMAPAGREC    FLGDIVACAO    FLGINIPAG    FLGJUROS    MOTBLOQCARTORIG    MOTBLOQCARTDEST    TIPSALDOCARTORIG    TIPSALDOCARTDEST    FLGTRATAIR    SIGLATIPOOPER    FLGISENTOIR    FLGGRAVAIRLITIGIO
2               -1             ATUALIZACAO RENDA VARIAVEL                                    N                   N               0             1                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -2             ATUALIZACAO RENDA FIXA                                        N                   N               0             0                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -3             ACRESCIMO POR TRANSFERENCIA R. FIXA                           N                   N               0             0                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -4             ACRESCIMO POR TRANSFERENCIA R. VARIAVEL                       N                   N               0             0                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -5             BAIXA POR TRANSFERENCIA R. FIXA                               N                   N               0             0                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -6             BAIXA POR TRANSFERENCIA R. VARIAVEL                           N                   N               0             0                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -7             ATUALIZACAO IR LITIGIO - RF                                   N                   N               0             0                0                N                      0             N            N            26/09/00 19:50:36   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -8             ATUALIZACAO IR LITIGIO - RV                                   N                   N               0             0                0                N                      0             N            N            26/09/00 19:43:18   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -9             ATUALIZACAO RENDA VARIAVEL - VARIAÇÃO NEGATIVA                N                   N               0             1                0                N                      0             N            N            03/10/00 15:04:10   CM2                                                                 N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -10            Ajuste Posição Positivo de BM&F                               A                   N               1             1                1                R         CO           0             N            N            13/03/01 18:55:39   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                   V
8               -11            Ajuste Posição Negativo de BM&F                               D                   N               1             1                1                P         CO           0             N            N            13/03/01 18:55:32   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                   V
5               -12            FDO APLICAÃ¿O COTAS FIF - R. FIXA AtualizaþÒo (+)             N                   N               0             1                0                N                      0             N            N                                                                                                    N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -13            FDO APLICAÃ¿O COTAS FIF - R. FIXA AtualizaþÒo (-)             N                   N               0             1                0                N                      0             N            N                                                                                                    N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -14            COTAS FIF - RENDA FIXA Atualizacao (-)                        N                   N               0             1                0                N                      0             N            N                                                                                                    N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -15            COTAS FIF - RENDA FIXA Atualizacao (+)                        N                   N               0             1                0                N                      0             N            N                                                                                                    N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -16            Atualizacao IR Litigio de BM&F                                N                   N               0             1                0                N                      0             N            N            13/03/01 18:55:48   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -17            PAGAMENTO DE JUROS                                            A                   N               0             1                1                R         EM           0             N            N            13/07/01 15:24:25   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -18            AMORTIZAÇÃO DE PRINCIPAL                                      A                   N               0             1                1                R         EM           0             N                         13/07/01 15:24:31   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
1               -19            INCORPORACAO DE JUROS                                         A                   N               0             1                0                N                      0             N                         13/07/01 15:24:37   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -20            Atualizacao Positiva Contratos BM&F                           N                   N               0             1                0                N                      0             N            N            24/05/01 17:16:32   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -21            Registro de Contratos BM&F                                    N                   N               0             1                0                N                      0             N            N            24/05/01 17:19:20   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -22            Despesas de BM&F                                              D                   N               1             1                1                P         CO           0             N            N            29/05/01 15:55:36   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -23            CPMF de BM&F                                                  D                   N               1             1                1                P         CO           0             N            N            22/06/01 17:06:32   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -24            IR Apurado Positivo de BM&F                                   N                   N               0             1                0                N                      0             N            N            22/06/01 17:10:42   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -25            IR Apurado Negativo de BM&F                                   N                   N               0             1                0                N                      0             N            N            22/06/01 17:11:05   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -26            IR Litigio Positivo de BM&F                                   N                   N               0             1                0                N                      0             N            N            22/06/01 17:12:14   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
8               -27            IR Litigio Negativo de BM&F                                   N                   N               0             1                0                N                      0             N            N            22/06/01 17:15:28   CMSELECT                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -28            FUNDOS - REVERSAO IOF (-)                                     N                   N               0             1                0                N                      0             N            N            01/08/01 10:00:41   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -29            FUNDOS - PROVISAO IOF (+)                                     N                   N               0             1                0                N                      0             N            N            01/08/01 10:05:33   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -30            FUNDOS - PROVISAO IRRF (+)                                    N                   N               0             1                0                N                      0             N            N            01/08/01 10:12:32   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -31            ??????                                                        N                   N               0             1                0                N                      0             N            N            01/08/01 10:08:26   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -32            ??????                                                        N                   N               0             1                0                N                      0             N            N            01/08/01 10:08:26   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -33            ??????                                                        N                   N               0             1                0                N                      0             N            N            01/08/01 10:12:52   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -34            APLICACAO EM FUNDOS COM VENDA DE ACOES                        A                   N               0             1                1                P         EM           0             N            N            01/08/01 11:29:10   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -35            VENDA DE ACOES PARA APLICACAO EM FUNDOS                       D                   V               3             1                1                R                      0             N            S            01/08/01 11:34:37   CMSELECT                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -36            AJUSTE DE CERTIFICADO                                         A                   N                             0                0                N                      0             N            S            13/9/2001 15:02:20  CM315989                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                                 AJU
6               -37            AJUSTE DE CERTIFICADO                                         A                   N                             0                0                N                      0             N            S            13/9/2001 15:02:23  CM315989                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                                 AJU
5               -38            APLICACAO POR TRANSFERENCIA                                   A                   N                             1                1                P         CO           0             N            S            10/9/2001 15:21:39  CM                              N                                   N               S         S            S             N               N          N              N              N            N            N                 N                          N                                                 L                   L                                 APTR
5               -39            RESGATE POR TRANSFERENCIA                                     D                   N                             1                1                R         CO           0             N            S            10/9/2001 15:45:09  CM                              N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                                 RGTR
6               -40            APLICACAO POR TRANSFERENCIA                                   A                   N               0             0                0                P         CO           0             N            N            10/9/2001 15:49:09  CM                              N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                   G             APTR
6               -41            RESGATE POR TRANSFERENCIA                                     D                   N               0             0                0                R         CO           0             N            N            10/9/2001 15:50:06  CM                              N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                   G             RGTR
5               -42            TRANSFERENCIA ENTRE FUNDOS                                    D                                                 0                0                                       0             N                         10/9/2001 17:11:52  CM                                                                  N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                                 TRFU
6               -42            TRANSFERENCIA ENTRE FUNDOS                                    D                                                 0                0                                       0             N                         10/9/2001 17:11:56  CM                                                                  N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                                 TRFU
6               -43            AMORTIZAÃ¿O DE COTAS                                          D                   N               0             1                1                R         CO           0             N            N            2/10/2001 17:19:56  CM315862                        N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L                   G
2               -44            COMPRA DE ACOES COM RESGATE DE FUNDOS                         A                   C               3             1                1                P         CO           0             N            S            28/9/2001 14:39:59  CM                              N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
6               -45            RESGATE DE FUNDOS PARA APLICACAO EM ACOES                     D                   N                             1                1                R         CO           0             N            S            28/9/2001 14:41:16  CM                              N                                   N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -46            PAGAMENTO DE IRRF MENSAL                                      N                   N               0             1                0                N                      0             N            N            19/10/2001 10:08:32 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -47            PAGAMENTO DE IOF MENSAL                                       N                   N               0             1                0                N                      0             N            N            19/10/2001 10:08:34 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -48            CM IRRF (LIMINAR)                                             N                   N               0             1                0                N                      0             N            N            19/10/2001 10:08:35 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
6               -48            CM IRRF (LIMINAR)                                             N                   N               0             1                0                N                      0             N            N            19/10/2001 15:14:24 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
5               -49            CM IOF (LIMINAR)                                              N                   N               0             1                0                N                      0             N            N            19/10/2001 10:08:36 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
6               -50            RESGATE VARIACAO                                              N                   N               0             1                0                N                      0             N            N            19/10/2001 15:14:24 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
6               -51            TAXA EMOLUMENTOS                                              N                   N               0             1                0                N                      0             N            N            19/10/2001 15:14:24 CM315862                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -52            EMPRESTIMO DE ACOES                                           N                   N               0             1                1                P                      0             N            N            4/2/2002 11:55:38   CM307265                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -53            REVERSAO EMPRESTIMO DE ACOES                                  N                   N               0             1                1                R                      0             N            N            4/2/2002 11:55:38   CM307265                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
2               -54            ATUALIZACAO DE EMPRESTIMO DE ACOES                            N                   N               0             1                0                N                      0             N            N            4/2/2002 11:55:38   CM307265                                                            N               N         N            N             N               N          N              N              N            N            N                 N                          N                                                 L                   L
6               -55            APLICACAO DE COTAS C/ EMOLUMENTOS                            A N 0                  1                  1                  P CO 0                  N N 22/05/2002 14:01:52    CM741908                                            N N N N N N N N N N N N   N                                       L L
6               -56            RESGATE DE COTAS C/ EMOLUMENTOS                              D N 0                  1                  1                  R CO 0                  N N 22/05/2002 14:02:11    CM741908                                            N N N N N N N N N N N N   N                                       L L
6               -57            COMISSAO COLOCACAO (+)                                       N N                    1                  1                  R CO 0                  N   27/05/2002 11:14:43    CM741908                                            N N N N N N N N N N N N   N                                       L L
6               -58            TAXA E EMOLUMENTOS                                           N N                    1                  1                  R CO 0                  N   27/05/2002 11:15:13    CM741908                                            N N N N N N N N N N N N   N                                       L L
6               -59            CORRETAGEM                                                   N N                    1                  1                  R CO 0                  N   27/05/2002 11:20:37    CM741908                                            N N N N N N N N N N N N   N                                       L L
6               -60            COMISSAO COLOCACAO (-)                                       N N                    1                  1                  P CO 0                  N   27/05/2002 11:21:38    CM741908                                            N N N N N N N N N N N N   N                                       L L
-1              -61            CHAMADA DE GARANTIA                                          A
-1              -62            DEVOLUCAO DE GARANTIA                                        D
2               -63            AT - AUMENTO POR TRANSFERENCIA                               A                   C               3             0                0                P         CO           0             N            S            25/07/2002 15:03:19 CM315989                        N                                   N               S         S            S             N               N          N              N              N            N            N                 N                          N                                                 L                   L                   N             AT
2               -64            DT - DIMINUIÇÃO POR TRANSFERENCIA                            D                   V               3             0                0                R         CO                         N            S            25/07/2002 15:18:45 CM315989                        N                                   N                                                                                                                                                                                                                                                                              G             DT
8               -65            Atualizacao Negativa Contratos BM&F                          N
5               -66            AJUSTE DE CERTIFICADO NEGATIVO (FDO RENDA FIXA)
2               -67            TRANSFERENCIA DE CARTEIRA (OPCOES) - BAIXA
2               -68            TRANSFERENCIA DE CARTEIRA (OPCOES) - CREDITO
1               -69            PR - PROVISÃO PARA PERDA                                     A                   C               0             0                0                P         EM                         N            N            27/05/2003 18:49:35 CM315989                        N                                   N                                                                                                                                                                                                                                                                              N             PR
2               -70            Anuncio de Proventos
2               -71            Anuncio de Proventos c/ Resgate de Proventos
2               -72            COMPRA DE OPÇÕES DE COMPRA
2               -74            EXERCÍCIO DE COMPRA DE OPÇÕES DE COMPRA
2               -75            VENDA DE OPÇÕES DE COMPRA
2               -77            EXERCÍCIO DE VENDA DE OPÇÕES DE COMPRA
2               -78            COMPRA DE OPÇÕES DE VENDA
2               -80            EXERCICIO DE COMPRA DE OPÇÕES DE VENDA
2               -81            VENDA DE OPÇÕES DE VENDA
2               -83            EXERCÍCO DE VENDA DE OPÇÕES DE VENDA
2               -84            COMPRA DE OPÇÕES DE COMPRA (INDICE)
2               -85            EXERCÍCIO DE COMPRA DE OPÇÕES DE COMPRA (INDICE)
2               -86            VENDA DE OPÇÕES DE COMPRA (INDICE)
2               -87            EXERCÍCIO DE VENDA DE OPÇÕES DE COMPRA (INDICE)
2               -88            COMPRA DE OPÇÕES DE VENDA (INDICE)
2               -89            EXERCICIO DE COMPRA DE OPÇÕES DE VENDA (INDICE)
2               -90            VENDA DE OPÇÕES DE VENDA (INDICE)
2               -91            EXERCÍCO DE VENDA DE OPÇÕES DE VENDA (INDICE)
2               -92            ATUALIZAÇÃO DE OPÇÕES DE ÍNDICES

INSERT INTO TIPOOPERACAO
(IDTIPOINVEST,IDTIPOOPERACAO,DESCTIPOOPERACAO                   ,NATUREZAOPERACAO,TIPOCUSTODIA,VENCIMENTO,FLGGERACONTAB,FLGGERACAPCAR,RECPAG,TIPCREDOR,FLGGERACAF,FLGTRANSF,FLGCORRET,FLGORDMOVINV,FLGOPDIREITO,FLGAGE,FLGDATAEX,FLGDATACOM,FLGINVORIGEM,FLGPERC,FLGPARIDADE,FLGPRZBOLSA,FLGPRZEMP,FLGATADEC,FLGFORMAPAGREC,FLGDIVACAO,FLGJUROS,TIPSALDOCARTORIG,TIPSALDOCARTDEST,FLGTRATAIR)
VALUES
(2           ,-63           ,'AT - AUMENTO POR TRANSFERENCIA'   ,'A'             ,'C'         ,3         ,0            ,0            ,'P'   ,'CO'     ,0         ,'N'      ,'S'      ,'N'         ,'N',        ,'N'   ,'N'      ,'N'       ,'N'          ,'N'   ,'N'        ,'N'        ,'N'      ,'N'      ,'N'           ,'N'       ,'N'     ,'L'             ,'L'             ,'N'       )
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST,IDTIPOOPERACAO,DESCTIPOOPERACAO                   ,NATUREZAOPERACAO,TIPOCUSTODIA,VENCIMENTO,FLGGERACONTAB,FLGGERACAPCAR,RECPAG,TIPCREDOR,FLGGERACAF,FLGTRANSF,FLGCORRET,FLGORDMOVINV,FLGOPDIREITO,FLGAGE,FLGDATAEX,FLGDATACOM,FLGINVORIGEM,FLGPERC,FLGPARIDADE,FLGPRZBOLSA,FLGPRZEMP,FLGATADEC,FLGFORMAPAGREC,FLGDIVACAO,FLGJUROS,TIPSALDOCARTORIG,TIPSALDOCARTDEST,FLGTRATAIR)
VALUES
(2           ,-64           ,'DT - DIMINUIÇÃO POR TRANSFERENCIA','D'             ,'V'         ,3         ,0            ,0            ,'R'   ,'CO'     ,0         ,'N'      ,'S'      ,'N'         ,'N',        ,'N'   ,'N'      ,'N'       ,'N'          ,'N'   ,'N'        ,'N'        ,'N'      ,'N'      ,'N'           ,'N'       ,'N'     ,'L'             ,'L'             ,'N'       )                                                                                         G             DT


INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-94               ,1           ,'AJUSTE DE BAIXA DE QUANTIDADE'                                 ,'D'                 ,'N'             ,0             ,0                ,0                ,'N'       ,'  '         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'L'                 ,' '           ,'ABQ '           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-93               ,1           ,'AJUSTE DE AUMENTO DE QUANTIDADE'                               ,'A'                 ,'N'             ,0             ,0                ,0                ,'N'       ,'  '         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'L'                 ,' '           ,'AAQ '           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-92               ,3           ,'ATUALIZAÇÃO DE OPÇÕES DE ÍNDICES'                              ,'N'                 ,'N'             ,0             ,1                ,0                ,'N'       ,'  '         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'ATUO'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-91               ,1           ,'EXERCÍCO DE VENDA DE OPÇÕES DE VENDA (INDICE)'                 ,'N'                 ,'N'             ,1             ,0                ,0                ,'R'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'EVOI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-90               ,3           ,38          ,'VENDA DE OPÇÕES DE VENDA (INDICE)'                ,'D'                 ,'N'             ,1             ,0                ,0                ,'R'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'VOVI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-89               ,1           ,'EXERCICIO DE COMPRA DE OPÇÕES DE VENDA (INDICE)'               ,'N'                 ,'N'             ,1             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'EOVI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-88               ,3           ,34          ,'COMPRA DE OPÇÕES DE VENDA (INDICE)'               ,'A'                 ,'N'             ,1             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'COVI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-87               ,1           ,'EXERCÍCIO DE VENDA DE OPÇÕES DE COMPRA (INDICE)'               ,'N'                 ,'N'             ,1             ,0                ,0                ,'R'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,' '           ,'EVCI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-86               ,3           ,34          ,'VENDA DE OPÇÕES DE COMPRA (INDICE)'               ,'D'                 ,'N'             ,1             ,0                ,0                ,'R'       ,'CO'         ,0             ,'A'          ,'S'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'B'                 ,'N'           ,'VOCI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                                ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-85               ,1           ,'EXERCÍCIO DE COMPRA DE OPÇÕES DE COMPRA (INDICE)'              ,'N'                 ,'N'             ,1             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'ECPI'           ,'S')


INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-84               ,3           ,34          ,'COMPRA DE OPÇÕES DE COMPRA (INDICE)'              ,'A'                 ,'N'             ,1             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'L'                 ,'N'           ,'COCI'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-83               ,1           ,38          ,'EXERCÍCO DE VENDA DE OPÇÕES DE VENDA'             ,'D'                 ,'V'             ,3             ,0                ,0                ,'R'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'    '           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-81               ,3           ,38          ,'VENDA DE OPÇÕES DE VENDA'                         ,'O'                 ,'N'             ,3             ,0                ,0                ,'R'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'    '           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-80               ,1           ,34          ,'EXERCICIO DE COMPRA DE OPÇÕES DE VENDA'           ,'D'                 ,'V'             ,3             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'EXOP'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-78               ,3           ,34          ,'COMPRA DE OPÇÕES DE VENDA'                        ,'U'                 ,'N'             ,3             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'COPV'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-77               ,1           ,38          ,'EXERCÍCIO DE VENDA DE OPÇÕES DE COMPRA'           ,'D'                 ,'V'             ,3             ,0                ,0                ,'R'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,' '           ,'EXVD'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-75               ,3           ,34          ,'VENDA DE OPÇÕES DE COMPRA'                        ,'O'                 ,'N'             ,3             ,0                ,0                ,'P'       ,'CO'         ,0             ,'A'          ,'S'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'B'                 ,'N'           ,'VDOP'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-74               ,1           ,34          ,'EXERCÍCIO DE COMPRA DE OPÇÕES DE COMPRA'          ,'A'                 ,'C'             ,3             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'EXCP'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-72               ,3           ,34          ,'COMPRA DE OPÇÕES DE COMPRA'                       ,'U'                 ,'N'             ,3             ,0                ,0                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'L'                 ,'N'           ,'COPC'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-71               ,1           ,38          ,'ANUNCIO DE PROVENTOS C/ RESGATE DE FUNDOS'        ,'R'                 ,'N'             ,0             ,1                ,1                ,'R'       ,'EM'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'APRF'           ,'S')

INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-95               ,1           ,'EMPRESTIMO DE ACOES (TOMADOR)'                    ,'A'                 ,'C'             ,1             ,0                ,0                ,'D'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,'L'                 ,'L'                 ,'N'           ,'EPAC'           ,'S')
INSERT INTO TIPOOPERACAO
(IDTIPOINVEST    ,IDTIPOOPERACAO    ,IDMERCADO   ,CODTIPDOC   ,DESCTIPOOPERACAO                                   ,NATUREZAOPERACAO    ,TIPOCUSTODIA    ,VENCIMENTO    ,FLGGERACONTAB    ,FLGGERACAPCAR    ,RECPAG    ,TIPCREDOR    ,FLGGERACAF    ,FLGTRANSF    ,FLGCORRET    ,FLGORDMOVINV    ,FLGOPDIREITO    ,FLGAGE    ,FLGDATAEX    ,FLGDATACOM    ,FLGINVORIGEM    ,FLGPERC    ,FLGPARIDADE    ,FLGPRZBOLSA    ,FLGPRZEMP    ,FLGATADEC    ,FLGFORMAPAGREC    ,FLGDIVACAO    ,FLGJUROS    ,TIPSALDOCARTORIG    ,TIPSALDOCARTDEST    ,FLGTRATAIR    ,SIGLATIPOOPER    ,STAATIVO) VALUES
(2               ,-96               ,1           ,34          ,'REVERSAO DE EMPRESTIMO DE ACOES (TOMADOR)'        ,'D'                 ,'V'             ,1             ,1                ,1                ,'P'       ,'CO'         ,0             ,'N'          ,'N'          ,'N'             ,'N'             ,'N'       ,'N'          ,'N'           ,'N'             ,'N'        ,'N'            ,'N'            ,'N'          ,'N'          ,'N'               ,'N'           ,'N'         ,' '                 ,' '                 ,'N'           ,'RVEM'           ,'S')
}

end.



