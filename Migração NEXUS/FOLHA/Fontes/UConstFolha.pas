unit UConstFolha;

interface

const _clinefeed = #13#10;

implementation

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
{------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGESTORNO NA TABELA HISTRUBSAL                               |
| 0 - PAGAMENTO NORMAL                                                         |
| 1 - PAGAMENTO PENDENTE                                                       |
| 2 - PAGAMENTO PENDENTE EM PROCESSO DE PREVIA                                 |
| 3 - PAGAMENTO PENDENTE PAGO NOVAMENTE (REENVIADO PARA CAP)                   |
| 4 - REPROCESSAMENTO DE PAGAMENTO                                             |
| 9 - PAGAMENTO INDEVIDO ESTORNADO                                             |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGTIPOFOLHA NA TABELA CTRLINTERFACE                          |
| 0 - LOTE NORMAL MANUTENÇÃO OU CONCESSÃO                                      |
| 1 - FOLHA DE PAGAMENTO PENDENTE                                              |
| 2 - FOLHA EXTRA                                                              |
| 3 - FOLHA DE ABONO                                                           |
| 4 - FOLHA DE ADIANTAMENTO DE ABONO                                           |
| 5 - LOTE DE EXCLUSÕES DA EFETIVAÇÃO                                          |
| 6 - LOTE DE REPROCESSAMENTO                                                  |
| 7 - LOTE DE ACERTO PÓS MORTE                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGTIPODESC NA TABELA TMPDESC, PREVIA, HISTRUBSAL             |
| B - BENEFICIO                                                                |
| P - CONTRIBUICAO PREVIDENCIARIA                                              |
| C - CONVENIO                                                                 |
| Y - RUBRICA INDIVIDUAL                                                       |
| E - EMPRESTIMO                                                               |
| A - ASSISTENCIAL                                                             |
| K - INFORMATIVA                                                              |
| W - INFORMATIVA QUE AFETA BASE DE IRRF                                       |
| Q - CREDITO DE PA                                                            |
| T - RUBRICA INTERNAS (CPMF, FOLHA EXTRA, OUTRAS CORRECAO MONET., ...)        |
| R - RUBRICA INTERNAS (CORRECAO MONETÁRIA SOBRE BENEFÍCIO)                    |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGUSAABONO NA TABELA RUBRICAINDIV                            |
| 0 - PROCESSA NO MESES 1 A 12 DO ANO                                          |
| 1 - PROCESSA NO MESES 1 A 13 DO ANO                                          |
| 2 - PROCESSA APENAS NO MES 13 ABONO ANUAL                                    |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGESTADO NA TABELA HSTFOLHABENEF                             |
| 0 - PROCESSADO COM ERRO                                                      |
| 1 - PROCESSADO COM SUCESSO                                                   |
| 2 - ESTORNO COMPLETO                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGDESCFOLHA NA TABELA TMPDESC                                |
| B - FOLHA DE BENEFICIOS                                                      |
| N - NÃO É DESCONTO                                                           |
| O - OUTROS                                                                   |
| P - FOLHA DA PATROCINADORA                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGDESCONTO NA TABELA TMPDESC                                 |
| 0 - NÃO É UM DESCONTO                                                        |
| 1 - DESCONTO                                                                 |
| 2 - ESPECIAL                                                                 |
| 3 - SÓ CONTABILIZAÇÃO (NÃO ENVIA PARA CAP/CAR)                               |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGATRASODEVOL NA TABELA TMPDESC                              |
| A - ATRASO                                                                   |
| D - DEVOLUÇÃO                                                                |
| N - NORMAL                                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO SITENVIO NA TABELA TMPDESC                                    |
| 0 - AINDA NÃO FOI PROCESSADO                                                 |
| 1 - RECEBIDO COM DIVERGENCIA                                                 |
| 2 - RECEBIDO NORMAL                                                          |
| 9 - JÁ FOI PROCESSADO                                                        |
|                                                                              |
|------------------------------------------------------------------------------|
|                                                                              |
| ATENÇÃO: CAMPO FLGESTADORUB NA TABELA PROVDESC                               |
| 0 - ATIVA                                                                    |
| 1 - CALCULADA                                                                |
| 2 - BLOQUEADA                                                                |
|                                                                              |
-------------------------------------------------------------------------------}
