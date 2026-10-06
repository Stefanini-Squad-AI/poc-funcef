CREATE OR REPLACE PROCEDURE cm.PR_EMP_REGRA_26433(IDCONTRATO_P NUMBER,
                                                  IDITEMEMPTMO_P INT,
                                                  VLRAMORTIZACAO_P NUMBER,
                                                  DATAAMORTIZACAO_P DATE,
                                                  NOVOPRAZO_P INT,
                                                  PRAZOANT_P INT,
                                                  IDCALCULO_P PLS_INTEGER,
                                                  USUARIO_P VARCHAR2,
                                                  RESULTADO_P OUT NUMBER,
                                                  RETORNO_P   OUT VARCHAR2) IS


vIdpessoa NUMBER;
vIdTitular NUMBER;
vTipoContr INT;

BEGIN

SELECT c.idbenef, c.idpessoa, c.idtipocontremptmo
INTO vIdpessoa, vIdTitular, vTipoContr
FROM contratoemptmo c
WHERE c.idcontratoemptmo = IDCONTRATO_P;


PCK_EMP_REGRA_AMORTIZACAO_R.PR_REGRA_26433( vIdpessoa,
                                            vIdTitular,
                                            IDCONTRATO_P,
                                            vTipoContr,
                                            IDITEMEMPTMO_P,
                                            5,
                                            VLRAMORTIZACAO_P,
                                            DATAAMORTIZACAO_P,
                                            NOVOPRAZO_P,
                                            PRAZOANT_P,
                                            IDCALCULO_P,
                                            USUARIO_P,
                                            RESULTADO_P,
                                            RETORNO_P);

END PR_EMP_REGRA_26433;
