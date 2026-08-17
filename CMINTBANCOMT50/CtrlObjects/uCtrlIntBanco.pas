{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: BaixadeTitulosSiacc
//N. SIG.............: 63651
//Data da Alteração..: 12/11/2019 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de tratamento de baixa de documento no convênio SIACC 150.
//***************************************************************************************
Nº SIG.....: 60379
Data.......: 19/09/2019
Autor......: Everson Cunha
Descrição..: Inclusão do campo Nº Documento(s)
--------------------------------------------------------------------------------
Rotina           : BaixadeTitulosAutomatica
N. Sol.......... : 214738_15892
N. Kintana...... : 2057238
Data da Alteração: 19/03/2014
Alteração Form:  : FBaixaIntBancoMT
Responsável:     : Paulo Nobre
Descrição....... : Inclusão do Parametro p/ indicar se visualiza o Log ou não
--------------------------------------------------------------------------------
Rotina........: MostraFormRemessa,ValidaNossoNumero,MontaPagamentoEletronico,
                MostraFormAlteracao,EncheListaOcorrencia
N. Sol........: 151593
N. Kintana....: 1115220
Data..........: 09/02/2011
Responsável...: Ricaroo de Freitas Araújo
Descrição.....: Inclusão do layout para apresentação do documento
                referente ao convênio 6034 que deve ser apresentado
                conforme layout 61(que é igual ao layout 50).
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBancoMT50             }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCtrlIntBanco: Classe de controle da geração de arquivos   }
{   Intbanco > Intercâmbio Eletrônico de Arquivos CM    }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 02/02/2003                             }
{                28/07/2003  -  André Tavares                   }
{                29/07/2003  -  André Tavares                   }
{                08/09/2003  -  André Tavares - pendência 14332 }
{                02/09/2003  -  andre tavares - pendência 15147 }
{                08/11/2004  -  andre tavares - pendência 15887 }
{                23/01/2004  -  André Tavares - pendência 15976 }
{                22/03/2004 -   André Tavares - pendência 16086 }
{                13/04/2004 -   André Tavares - pendência 16136 }
{                13/04/2004 -   André Tavares - pendência 16137 }
{                21/12/2004 -   André Tavares - pendência 18093 }
{                31/03/2005 -   André Tavares - pendência 18844 }
{                16/06/2005 -   Rodolpho da Silva - Pendências 19473 e 19480}
{                28/03/2006 -   André Tavares - pendência 21659 - Recebimento Automático do }
{                               Banco Banespa Cnab 240 - Pagto de Fornecedores (idmodelosCnab = 55) }
{***************************************************************}
// andre tavares - pendencia 19978 - 17/08/2005 - tranquei o registro na tabela portadorforma no momento da geração do arquivo.

{------------------------  ---------------------------------------------------------------------------------------------------------------------------------}
{Unit                      Script de Criãção de Modelos de Arquivo                                                                                          }
{------------------------  ---------------------------------------------------------------------------------------------------------------------------------}

{FCobrRemessaItau.pas      INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (0,'R',  'BANCO ITAÚ - SISTEMA DE COBRANÇA');                    }
{FCobrRemessaBradesco.pas  INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (1,'R',  'BANCO BRADESCO - COBRANÇA');                           }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (2,'R',  'BANCO UNIBANCO - COBRANÇA REGISTRADA');                }
{uCobranca.pas**           INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (3,'R',  'BANCO REAL - COBRANÇA NÃO REGISTRADA');                }
{fParamBarrasBb.pas        INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (4,'R',  'BANCO DO BRASIL - CÓDIGO DE BARRAS');                  }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (5,'R',  'BANCO REAL - CÓDIGO DE BARRAS');                       }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (6,'R',  'BANCO BCN - COBRANÇA');                                }
{uCnabBB.pas               INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (7,'R',  'BANCO DO BRASIL - SISTEMA DE COBRANÇAS');              }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (8 ,'R', 'BANCO CEF - COBRANÇA ELETRÔNICA');                     }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (9 ,'R', 'BANCO HSBC - COBRANÇA NÃO REGISTRADA');                }
{uCnabSantander.pas        INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (10,'R', 'BANCO SANTANDER - SISTEMA DE COBRANÇA');               }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (11,'R', 'BANCO REAL - COBRANÇA REGISTRADA');                    }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (12,'R', 'BANCO DO BRASIL - DÉBITO AUTOMÁTICO');                 }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (13,'R', 'BANCO REAL - DÉBITO AUTOMÁTICO');                      }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (14,'R', 'BANCO CEF - DÉBITO AUTOMÁTICO');                       }
{DCobranca .pas**          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (15,'R', 'BANCO DO BRASIL - ARQUIVO LASER');                     }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (16,'R', 'BANCO BICBANCO - SISTEMA DE COBRANÇA');                }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (17,'R', 'BANCO SAFRA - COBRANÇA REGISTRADA');                   }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (18,'R', 'BANCO DE BOSTON - COBRANÇA ESCRITURAL');               }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (19,'R', 'BANCO CIDADE - COBRANÇA');                             }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (20,'R', 'BANCO HSBC - COBRANÇA REGISTRADA');                    }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (21,'R', 'BANCO BANRISUL - COBRANÇA ELETRÔNICA');                }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (22,'R', 'BANCO BBV - COBRANÇA ELETRÔNICA');                     }
{uCobranca.pas             INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (23,'R', 'BANCO UNIBANCO - COBRANÇA NÃO REGISTRADA');            }
{uDebAutBanrisul.Pas       INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (24,'R', 'BANCO BANRISUL - DÉBITO AUTOMÁTICO');                  }
{uCnabSantander.pas        INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (25,'R', 'BANCO BANESPA - SISTEMA DE COBRANÇA');                 }
{uCobBescCnab240.pas       INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (58,'R', 'BANCO BESC - CNAB 240')

// inicio - andre tavares 21/07/2003 pendencia 14439
{uSicovCEF.Pas       INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (50,'R', 'BANCO CEF - DÉBITO/CRÉDITO AUTOMÁTICO');                     }
// fim - andre tavares 21/07/2003 pendencia 14439

{ UPagRealCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(52, 'P', 'BANCO DO REAL - CANAB 240', 0);        }
{ UPagRealCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(52, 'R', 'BANCO DO REAL - CANAB 240', 0);        }

// Início - Rodolpho da Silva - P: 18473,19480 - 16/06/2005
{ UPagUnibancoCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(53, 'R', 'BANCO UNIBANCO - CNAB 240', 0);          }
{ UPagUnibancoCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(53, 'P', 'BANCO UNIBANCO - CNAB 240', 0);          }
{ UPagBradescoCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(54, 'R', 'BANCO BRADESCO - CNAB 240', 0);          }
{ UPagBradescoCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(54, 'P', 'BANCO BRADESCO - CNAB 240', 0);          }
// Fim - Rodolpho da Silva - P: 18473,19480 - 16/06/2005

//início andre tavares
{ UPagBanespacnab240.pas   - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(55, 'P', 'BANESPA - PAG. FORN. - CNAB 240', 0) }
{ UCobraBanespaCnab240.pas - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(55, 'R', 'BANESPA - COBRANÇA - CNAB 240', 0)   }
{ UuFolhaPagBanespaMT.Pas  - INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(56, 'P', 'BANESPA - FOLHA DE PAGAMENTO - CANAB 240', 0) }
//fim andre tavares

{------------------------  -------------------------------------------------------------------------------------------------------------------------------- }
{------------------------  -------------------------------------------------------------------------------------------------------------------------------- }

{uSisPag.Pas               INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (0, 'P', 'BANCO ITAÚ - SISTEMA DE PAGAMENTOS');                  }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (1, 'P', 'BANCO REAL - PAGAMENTO DE FORNECEDORES');              }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (2, 'P', 'BANCO REAL - FOLHA DE PAGAMENTO');                     }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (3, 'P', 'BANCO BRADESCO - FOLHA DE PAGAMENTO');                 }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (4, 'P', 'BANCO BRADESCO - PAGAMENTO DE FORNECEDORES');          }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (5, 'P', 'BANCO DO BRASIL - PAGAMENTO DE FORNECEDORES');         }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (6, 'P', 'BANCO UNIBANCO - CRÉDITO EM CONTA');                   }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (7, 'P', 'BANCO UNIBANCO - DOC');                                }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (8, 'P', 'BANCO UNIBANCO - PAGAMENTO ELETRÔNICO, CARTÃO');       }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (9, 'P', 'BANCO UNIBANCO - OCT, COBRANÇA ESPECIAL');             }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (10, 'P','BANCO UNIBANCO - ORDEM DE PAGAMENTO, CHEQUE ADM');     }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (11, 'P','BANCO UNIBANCO - TÍTULOS UNICOBRANÇA');                }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (12, 'P','BANCO UNIBANCO - TÍTULOS OUTROS BANCOS');              }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (13, 'P','BANCO CEF - FOLHA DE PAGAMENTO');                      }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (14, 'P','BANCO MERIDIONAL - SAQUE RÁPIDO');                     }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (15, 'P','BANCO BANESPA - CRÉDITO EM CONTA CORRENTE');           }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (16, 'P','BANCO UNIBANCO - DÉBITO EM CONTA');                    }

// implementação do TED Unibanco - André Tavares - 31/03/2004 - pendência 16160
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (51, 'P','BANCO UNIBANCO - TED');                                }
{uPagUnibanco.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (51, 'R','BANCO UNIBANCO - TED');                                }

{uPagHsbc.Pas              INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (17, 'P','BANCO HSBC - SISTEMA DE PAGAMENTOS');                  }
{uPagBB.Pas                INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (18, 'P','BANCO DO BRASIL - PAGAMENTOS');                        }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (19, 'P','BANCO DO BRASIL - TRANSF');                            }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (20, 'P','BANCO DE BOSTON - SISTEMA DE PAGAMENTOS');             }
{uPagBanrisul.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (21, 'P','BANCO BANRISUL - PAGAMENTO DE FORNECEDORES');          }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (22, 'P','BANCO BANRISUL - LANÇAMENTOS EM CONTA CORRENTE');      }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (23, 'P','BANCO BBV - SISTEMA DE PAGAMENTOS';                    }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (24, 'P','BANCO SANTANDER - PAGAMENTO DE FORNECEDORES(400 POSIÇÕES)';}
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (25, 'P','CARTÃO ACC CARD - FOLHA DE PAGAMENTO';                 }
{uPagSantander.Pas         INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (26, 'P','BANCO SANTANDER - CARTÃO SALÁRIO');                    }

// inicio - andre tavares 21/07/2003 pendencia 14439
{uSicovCEF.Pas       INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (50,'P', 'BANCO CEF - DÉBITO/CRÉDITO AUTOMÁTICO');                  }
// fim - andre tavares 21/07/2003 pendencia 14439

// inicio - andre tavares - 11/10/2005 - pendência 20359
{ uFolhaPagRealCnab240MT.Pas  INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA) VALUES(57, 'P', 'BANCO REAL - FOLHA DE PAGAMENTO - CNAB 240', 0) }
// fim - andre tavares - 11/10/2005 - pendência 20359

//ANDRE TAVARES - PENDÊNCIA ????? - 05/06/2007
//uPagFornBescCnab240.pas INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (58,'P', 'BANCO BESC - PAG. FORN. CNAB 240')

//andre tavares - pendência 26864 - 15/01/2008 - é o mesmo layout do CAP
//uPagFornBescCnab240.pas INSERT INTO MODELOSCNAB (IDMODELOSCNAB, RECPAG, DESCRICAO, CONTROLEREMESSA, SEQARQUIVO) VALUES (59, 'R', 'BANCO BESC - REC. ETRÔNICO - CNAB 240', 0, 0);

{------------------------  -------------------------------------------------------------------------------------------------------------------------------  }

{Campos da QryTexto - Com os dados para os registros do arquivo de cobrança                                             }
{                     CAR FParamBloqueteCobranca QryBloquete, QryBloqueteTipoCli                                        }
{                                                                                                                       }
{    CEP, CODESTADO,  CIDADE,  BAIRRO,   COMPLEMENTO,   NUMERO,   LOGRADOURO,   NUMDOCUMENTO,   NOME,                   }
{    VALORDESCONTO,  DATALIMITE,   DATAPROGRAMADA,   CODPORTFORMA,   DATAVENCTO,   DATAEMISSAO,  NODOCUMENTO,           }
{    MOESIGLA,  CODDOCUMENTO,   TIPO,  NOSSONUMERO,  COMPLDOCUMENTO,  TIPOENDERECO,   NUMAGENCIA,   NUMCONTA,           }
{    VALORJUROS,  FLGGRUPO,   VALOR,  VALOROM,   NUMRAZAOCC,   IDTIPOCLIENTE,   CODTIPDOC, IDMODULO                     }
{                                                                                                                       }
{                                                                                                                       }
{Campos da QryTexto - Com os dados para os registros do arquivo de pagamento                                            }
{                     CAP FPagEletronico QryDocumentos                                                                  }
{                                                                                                                       }
{    PESS.IDPESSOA, PESS.NOME, PESS.RAZAOSOCIAL, DECODE(PESS.TIPO,'J',DECODE(PESS.NUMDOCUMENTO,NULL,'00000000000000',   }
{    PESS.NUMDOCUMENTO),DECODE(PESS.NUMDOCUMENTO,NULL,'00000000000',PESS.NUMDOCUMENTO)) AS NUMDOCUMENTO,                }
{    E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, CID.NOME AS CIDADE, ES.CODESTADO,                                 }
{    E.CEP, DOC.IDFORCLI, DOC.CODDOCUMENTO, LOTEX.VALOR, DOC.VALORDESCONTO, DOC.VALORJUROS, DOC.DATAVENCTO,             }
{    DOC.DATAPROGRAMADA,    DOC.MOECODIGO AS TIPOMOEDA, LP.NUMLOTE, LP.CODPORTFORMA, PF.CODFORMAPAGTO, PF.CODTIPOPAGTO, }
{    PF.FLGEMITEAVISO, PF.CODARQUIVOREMESSA, PC.IDBANCO, PC.NOCONTACORR, pf.codportador  ,                              }
{    LOTEX.CODBARRA, LOTEX.CODBARRAVALOR, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, PESS.TIPO, PF.NUMEMPRESABANCO,           }
{    TD.DEBCRE, '                         ' as livre, PAG.NOME AS NOMEAGENCIA                                           }
{                                                                                                                       }
{Campos da QryEmpresa - Ver Função VerficaDadosEmpresa                                                                  }
{                                                                                                                       }

Unit uCtrlIntBanco;

Interface

Uses Forms, Messages, Windows, Classes, SysUtils, Dialogs, Controls,
   uCMControlObject, UCripto, ShellAPI;

Type
   TCobrancaEletronicaError = Exception;

   TCtrlIntBanco = Class(TCMControlObject)
   Private
      _sSQLEmpresa: String;
      FIndiceDoBanco: Integer;
      FCodigosBarra, FModeloCodigoBarra, FNomeArquivoGerado: String;
      FFechaQryTexto, fExibeArquivoGerado: Boolean;
      FDataPagamento: String;
      FValidaDvContaAgencia: Boolean;
      fnaogerararquivo: Boolean;
      FiFloatExternoAlt: integer;
      FiFloatExterno: integer;
      Procedure SetAtualizaDoc(Value: Boolean);
      Procedure SetValidaDvContaAgencia(Const Value: Boolean);

      {Verifica o caminho de destino do arquivo a ser gerado}
      Procedure CheckPath(Var sPath: String);
      Procedure SetIdentficaOrigem(Const Value: String);
      Function GetIdentficaOrigem: String;
      Function GetMensagem1: String;
      Function GetMensagem2: String;
      Function GetMensagem3: String;
      Function GetMensagem4: String;
      Function GetMensagem5: String;
      Function GetMensagem6: String;
      Function GetMensagem7: String;
      Function GetMensagem8: String;
      Function GetNaoGerarArquivo: Boolean;
      Procedure SetMensagem1(Const Value: String);
      Procedure SetMensagem2(Const Value: String);
      Procedure SetMensagem3(Const Value: String);
      Procedure SetMensagem4(Const Value: String);
      Procedure SetMensagem5(Const Value: String);
      Procedure SetMensagem6(Const Value: String);
      Procedure SetMensagem7(Const Value: String);
      Procedure SetMensagem8(Const Value: String);
      Function GetAtualizaDoc: Boolean;
      Procedure SetiFloatExterno(Const Value: integer);
      Procedure SetiFloatExternoAlt(Const Value: integer);
   Protected
      Procedure AfterInitialize; Override;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {Indica se o processamento gera fisicamento um arquivo >>> ARGH: Foi Ela !!!!!!!!!!!!!!!}
      Property NaoGerarArquivo: Boolean Read GetNaoGerarArquivo Write fnaogerararquivo;
      {Número do banco ( IDMODELOSCNAB ) a ser processado}
      Property IndiceDoBanco: Integer Read FIndiceDoBanco Write FIndiceDoBanco;
      {Controla a atualização de dados da remessa na tabela DOCUMENTO}
      Property AtualizaDoc: Boolean Read GetAtualizaDoc Write SetAtualizaDoc;
      {Controla o 'CloseOpen' da consulta com os dados dos registros a serem processados}
      Property FechaQryTexto: Boolean Read FFechaQryTexto Write FFechaQryTexto;
      {Controla a exibição em tela do arquivo gerado}
      Property ExibeArquivoGerado: Boolean Read fExibeArquivoGerado Write fExibeArquivoGerado;
      {Identifica a origem do arquivo: Utilizado para arquivos gerados pelo TOTALPREV}
      Property IdentficaOrigem: String Read GetIdentficaOrigem Write SetIdentficaOrigem;
      {Data do pargamento do arquivo}
      Property DataPagamento: String Read FDataPagamento Write FDataPagamento;
      {Código de barra a ser impresso no arquivo >> Acho que não é isso !!!!!!!!!!}
      Property CodigosBarra: String Read FCodigosBarra;
      {Modelo do Código de barra a ser impresso no arquivo >> Acho que não é isso !!!!!!!!!!}
      Property ModeloCodigoBarra: String Read FModeloCodigoBarra;
      {Nome do arquivo gerado para remssa}
      Property NomeArquivoGerado: String Read FNomeArquivoGerado;

      {Controle de Mensagens do Documento >>> ARGH: Foi Ela !!!!!!!!!!!!!!!}
      Property Mensagem1: String Read GetMensagem1 Write SetMensagem1;
      Property Mensagem2: String Read GetMensagem2 Write SetMensagem2;
      Property Mensagem3: String Read GetMensagem3 Write SetMensagem3;
      Property Mensagem4: String Read GetMensagem4 Write SetMensagem4;
      Property Mensagem5: String Read GetMensagem5 Write SetMensagem5;
      Property Mensagem6: String Read GetMensagem6 Write SetMensagem6;
      Property Mensagem7: String Read GetMensagem7 Write SetMensagem7;
      Property Mensagem8: String Read GetMensagem8 Write SetMensagem8;

      {Controla a validação da Contab Bancária e Agência para os modelos de arquivo que Obrigam Dados bancários}
      Property ValidaDvContaAgencia: Boolean Read FValidaDvContaAgencia Write SetValidaDvContaAgencia;

      //início - andré tavares - pendência 25172 - 29/05/2007 - propriedades que recebem float externo que sobrepõem os floats do portadorforma.
      Property iFloatExterno: integer Read FiFloatExterno Write SetiFloatExterno; //ex. Doc
      Property iFloatExternoAlt: integer Read FiFloatExternoAlt Write SetiFloatExternoAlt; //ex. Ted
      //fim - andré tavares - pendência 25172 - 29/05/2007

      {Retorna um TStrings com os Tipos ou Formas de Pagamentos válidos para o SISPAG Itaú}
      Function EncheListaTipoFormaSispag(bTipo: Boolean; iSisPag: Integer): TStrings;
      {Enche lista com as ocorrências valídas de acordo com o índice do banco}
      Function EncheListaOcorrencia(iIndiceBanco: Integer): TStrings;
      {Retorna o Código do Tipo ou Forma de pagameto de acordo com o índice do Mesmo}
      Function BuscaTipoFormaSisPag(bTipo, bCodigo: Boolean; iValorBusca, iSisPag: Integer): Integer;
      {Gera arquivo INTBANCO de pagamentos - CAP}
      Function MontaPagamentoEletronico(iIndiceArquivo, iUltCodArquivoGerado: Integer;
         OvDados: OleVariant; sPathRemessa: String): Boolean;
      {Gera arquivo INTBANCO de Cobrança - CAR}
      Procedure MostraFormRemessa(IndiceBanco, pNumRemessaDia: Integer; pGeraNossoNumero: Boolean;
         pNossoNumero, pDiasProtesto, pValorJuros, pNumeEmpresaBanco, pCodArquivoRemessa, ppath: String;
         ovCdsTexto: OleVariant; Var iUltNossoNumero, iUltCodArquivoGerado: String);
      {Gera arquivo INTBANCo para alteração de remessa - CAR}
      Procedure MostraFormAlteracao(IndiceBanco: Integer; OvDocumentos: OleVariant; sPath, sNumeEmpresaBanco, sOcorrencia: String);
      {Valida os campos obrigatório para gerar arquivo de alteração de remessa}
      Function VerificaCamposParaAlteracao(iIndiceBanco, iOcorrencia: Integer): String;
      {Valida os dados cadastrais de Empresa que esta enviando o arquivo ( Endereço, Contá Bancári e Documento}
      Function VerficaDadosEmpresa(sRecPag: Char; iCodPortForma: Integer): Boolean;
      {Valida dados da remessa sem gerar o arquivo}
      Function ValidaRemessa(sRecPag: Char; Const OvDocumentos: OleVariant; bValidaCodBarras: Boolean): Boolean;
      {Proceessa arquivo de retorno genéricos}
      Function BaixadeTitulosAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial, pApresentaVisulaizacao: String): TStrings;
      {Proceessa arquivo de retorno do tipo SISPAG}
      Function BaixadeSispagAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial: String): TStrings;
      {Valida o cadastro do nosso número no PORTADORFORMA de acordo com o banco}
      Function ValidaNossoNumero(sNossoNumero: String; iBanco: Integer; Var Mensagem: String): Boolean;
      {Valida o cadastro do Número de inscrição da empresa no PORTADORFORMA de acordo com o banco}
      Function ValidaNumInscricaoEmpresa(sNumInscricaoEmpresa: String; iBanco: Integer): Boolean;
      {Valida o código de barras a ser gravado no arquivo SISPAG}
      Function ValidaCodBarrasSispag(sCodBarras: String; idv: Integer): Boolean;
      {Indica se determinado banco\modelo obriga a indicação de tipo de pagamento}
      Function ObrigaTipoPagto(iBanco: Integer): Boolean;
      {Indica se determinado banco\modelo obriga a indicação de forma de pagamento}
      Function ObrigaFormaPagto(iBanco: Integer): Boolean;
      {Indica se determinado banco\modelo obriga a indicação de dados bançarios}
      Function ObrigaDadosBancarios(iBanco, iFormaPag: Integer): Boolean;
      {Seta parâmetros de acordo com o portador forma}
      Function SetParametros(iCodPortForma: Longint; sRecPag: String): Boolean;
      { 29/04/2004 - Andre Tavares - pendência 16342 - valida o código de barras de arrecadação DARF, LUZ, TELEFONE IPTU etc}
      Function ValidaCodBarrasArrecad(sCodBarras: String): Boolean;
      {Busca o codigo de emissao de aviso do Banespa FLGEMITEAVISO}
      Function CodAvisoBanespa(bCod: boolean): String;
      
      function BaixadeTitulosSiacc(IndiceBanco: Integer; sRazaoSocial, pApresentaVisualizacao, pDataRetorno: String; pCodPortForma: Integer): TStrings;
   End;

Implementation

Uses uIntBancoManager,
   uRetornoCobrMT,
   uSisPagMT,
   uRetornoSispagMT,
   uPagUnibancoMT,
   uCobrancaMT,
   uPagDiversosMT,
   uPagHsbcMT,
   uCnabBBMT,
   uDebAutBanriSulMT,
   uCnabCEFMT,
   uPagBBMT,
   uPagBanrisulMT,
   uPagSantanderMT,
   uCnabSantanderMT,
   // inicio - andre tavares 21/07/2003 pendencia 14439
   uSicovCEF,
   // fim - andre tavares 21/07/2003 pendencia 14439
   UPagRealCnab240,

   // Início - Rodolpho da Silva - P: 19473/19480 - 16/06/2005
   uPagBradescoCnab240,
   uPagUnibancoCnab240,
   // Fim - Rodolpho da Silva - P: 19473/19480 - 16/06/2005

   //início - andre tavares pendencia 20286
   uPagBanespaCnab240,
   uCobBANESPACnab240,
   uFolhaPagBanespaMT,
   //fim - andre tavares pendencia 20286
   uFolhaPagRealCnab240MT, //andre tavares pendencia 20359

   UPagBescCnab240, //andre tavares - pendencia ????? - 05/06/2007
   uCobBescCnab240, //amf 11.06.2007 24978

   uSiaccCEF, //Cássio Rovaroto - SIG nº 63651

   uFormManager,
   uCmDialogs,

   FileCtrl,
   uCalcDv,
   uSistema,
   uCMFileUtils,
   uString,
   fAguarde,

   FCobrRemessaBradescoMT,
   FCobrRemessaItauMT,
   FAlteraRemessItauMT,
   FParamFolhaPagrealMT,
   FParamFolhaPagBradescoMT,
   FParamPagForneBradescoMT,
   FParamPagBBMT,
   FParamUnibancoMT,
   fParamBarrasBbMT,
   FParamCnabSantanderMT,
   FparamBBpagMT,
   FCobrNregHSBCMT,
   FParamTransfBbMT,
   FParamCobRegRealMT,
   FParamRemBicBancoMT,
   fParamSAFRARegistradaMT,
   fParamBostonEscrituralMT,
   fParamBancoCidadeMT,
   fParamRegistradaHSBCMT,
   fParamCobrancaEletronicaBanrisulMT,
   fParamCobrancaEletronicaBBVMT,
   fParamCobrancaRegistradaUnibancoMT,
   fParamCobrancaSemRegistroUnibancoMT,
   fParamFolhaPagCEFMT,
   fParamPagamentoFornecedorSantanderMT, dbClient;

{Impressão sem gerar Nosso Número:
   a - Caso o arquivo seja gerado novamento, passar pGeraNossoNumero como False e
       pCodArquivoRemessa como o codigo do arquivo no Documento - 1
   b - caso 0 arquivo seja novo, passar pGeraNossoNumero como False}

Constructor TCtrlIntBanco.Create;
Begin
   Inherited;
   IntBancoManager := TIntBancoManager.Create;
   FIndiceDoBanco := 0;
   FCodigosBarra := '30,31,6,32,33'; // André Tavares - 22/03/2004 - pendência 16086 - incluí o código 33 (arrecadações diversas)
   FModeloCodigoBarra := '11,12';
   FFechaQryTexto := True;
   //  fExibeArquivoGerado   := True;
   fExibeArquivoGerado := false; // andre tavares - pendencia 17884 - 21/12/2004
   fnaogerararquivo := False;
   FValidaDvContaAgencia := True;
   SetAtualizaDoc(False);
   FiFloatExterno := 0;
   FiFloatExternoAlt := 0;
End;

Destructor TCtrlIntBanco.Destroy;
Begin
   //IntBancoManager.Free;
   If assigned(IntBancoManager) Then //andre tavares - 18/07/2006
      freeAndNil(IntBancoManager);
   Inherited Destroy;
End;

Procedure TCtrlIntBanco.SetAtualizaDoc(Value: Boolean);
Begin
   IntBancoManager.bAtualizadoc := Value;
End;

Function TCtrlIntBanco.EncheListaTipoFormaSispag(bTipo: Boolean; iSisPag: Integer): TStrings;
Var ListaTipoFormaSispag: TStrings;
Begin
   FIndiceDoBanco := iSisPag;

   ListaTipoFormaSispag := TStringList.Create;
   ListaTipoFormaSispag.Clear;
   Case iSisPag Of

      //// início andre tavares - 02/04/2004 - pendência 16160
      7:
         Begin
            If Not bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO OFF');
                  ListaTipoFormaSispag.Add('TED');
                  ListaTipoFormaSispag.Add('TED ESPECIAL');
               End;
         End;
      //// fim andre tavares - 02/04/2004 - pendência 16160

      0:
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('DIVIDENDOS');
                  ListaTipoFormaSispag.Add('DEBÊNTURES');
                  ListaTipoFormaSispag.Add('FORNECEDORES');
                  ListaTipoFormaSispag.Add('SALÁRIOS');
                  ListaTipoFormaSispag.Add('FUNDOS DE INVESTIMENTOS');
                  ListaTipoFormaSispag.Add('SINISTROS DE SEGUROS');
                  ListaTipoFormaSispag.Add('DESPESAS VIAJANTE EM TRÂNSITO');
                  ListaTipoFormaSispag.Add('REPRESENTANTES AUTORIZADOS');
                  ListaTipoFormaSispag.Add('BENEFÍCIOS');
                  ListaTipoFormaSispag.Add('DIVERSOS');
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE NO ITAÚ');
                  ListaTipoFormaSispag.Add('CHEQUE PAGAMENTO ADMINISTRATIVO');
                  ListaTipoFormaSispag.Add('DOC');
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA POUPANÇA ITAÚ');
                  ListaTipoFormaSispag.Add('ORDEM DE PAGAMENTO À DISPOSIÇÃO');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE TÍTULOS EM COBRANÇA NO ITAÚ');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE TÍTULOS EM COBRANÇA EM OUTROS BANCOS');
                  ListaTipoFormaSispag.Add('DARF NORMAL');
                  ListaTipoFormaSispag.Add('GPS- GUIA DA PREVIDÊNCIA');
                  ListaTipoFormaSispag.Add('DARF SIMPLES');
                  ListaTipoFormaSispag.Add('IPTU');
                  ListaTipoFormaSispag.Add('DARJ');
                  ListaTipoFormaSispag.Add('TED - OUTRO TITULAR');
                  ListaTipoFormaSispag.Add('TED - MESMO TITULAR');
                  ListaTipoFormaSispag.Add('CARTÃO SALARIO');
               End;
         End;
      1:
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('TED');
                  ListaTipoFormaSispag.Add('DOC COMPE');
                  ListaTipoFormaSispag.Add('DIVERSOS');
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CHEQUE ADM');
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA');
                  ListaTipoFormaSispag.Add('DOC');
                  ListaTipoFormaSispag.Add('RECIBO');
                  ListaTipoFormaSispag.Add('CAIXA/ TIT. COBRANCA COD. BARRAS');
                  ListaTipoFormaSispag.Add('NÃO DEFINIDA');
               End;

         End;
      4:
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE ALUGUEL CONDOMÍNO');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DUPLICATAS/TÍTULOS');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DIVIDENDOS');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE MENSALIDADE ESCOLAR');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE SALÁRIO');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE FORNECEDORES/HONORÁRIO');
                  ListaTipoFormaSispag.Add('OPERAÇÃO DE CÂMBIO/FUNDOS/BOLSA DE VALORES');
                  ListaTipoFormaSispag.Add('REPASSE DE ARRECADAÇÃO/PAGAMENTO DE TRIBUTOS');
                  ListaTipoFormaSispag.Add('TRANSFERÊNCIA INTERNACIONAL EM REAIS');
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA POUPANÇA');
                  ListaTipoFormaSispag.Add('CRÉDITO JUDICIAL');
                  ListaTipoFormaSispag.Add('OUTROS\DIVERSOS');
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE');
                  ListaTipoFormaSispag.Add('TÍTULO EM COBRANÇA BRADESCO');
                  ListaTipoFormaSispag.Add('CHEQUE OPERACIONAL');
                  ListaTipoFormaSispag.Add('DOC');
                  ListaTipoFormaSispag.Add('TITULO DE TERCEIROS');
                  // Início - André Tavares - 28/07/2003 - pendência 14217
                  ListaTipoFormaSispag.Add('CRÉDITO CC OU POUPANÇA REAL TIME');
                  ListaTipoFormaSispag.Add('CIP - TED CIP');
                  ListaTipoFormaSispag.Add('STR - TED STR');
                  // Fim - André Tavares - 28/07/2003 - pendência 14217
               End;
         End;
      17:
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('COBRANÇA');
                  ListaTipoFormaSispag.Add('PAGAMENTOS DE DIVIDENDOS');
                  ListaTipoFormaSispag.Add('VENDA DE ACOES');
                  ListaTipoFormaSispag.Add('PAGAMENTO A FORNECEDORES');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE SALÁRIOS');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE ADIANTAMENTO DE SALÁRIO');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DÉCIMO TERCEIRO');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE FERIAS');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE EMPRÉSTIMOS');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE COMISSÕES');
                  ListaTipoFormaSispag.Add('PAGAMENTO LOJISTAS');
                  ListaTipoFormaSispag.Add('TRANSFERÊNCIA DE TITULARES');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DESPESA VIAJANTE EM TRANSITO');
                  ListaTipoFormaSispag.Add('PAGAMENTO DE ADIANTAMENTO/ACERTO DESPESA VIAGENS');
                  ListaTipoFormaSispag.Add('REEMBOLSO DE DESPESA');
                  ListaTipoFormaSispag.Add('PAGAMENTO AUTORIZADO');
                  ListaTipoFormaSispag.Add('PAGAMENTO BENEFÍCIOS');
                  ListaTipoFormaSispag.Add('PAGAMENTO ASSITÊNCIA MÉDICA\ODONTOLÓGICA');
                  ListaTipoFormaSispag.Add('PAGAMENTO PIS/PASEP');
                  ListaTipoFormaSispag.Add('PAGAMENTO DA GUIA DA PREVIDÊNCIA SOCIAL');
                  ListaTipoFormaSispag.Add('PAGAMENTO APOSENTADORIA\OUTRAS');
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('CRÉDITO ADMINISTRATIVO'); //02
                  ListaTipoFormaSispag.Add('DOCUMENTO DE CRÉDITO - DOC'); //03
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA POUNPANÇA'); //05
                  ListaTipoFormaSispag.Add('EMISSÃO DE CHEQUE SALÁRIO'); //07
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS HSBC'); //30
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS OUTROS BANCOS'); //31
                  ListaTipoFormaSispag.Add('LIBERAÇÃO DE TÍTULOS HSBC'); //32
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE PARCELAS COBRANÇA NÃO REGISTRADA - CNR'); //33
                  ListaTipoFormaSispag.Add('CARTÃO SALÁRIO'); //37
               End;
         End;

      //início - andre tavares - 29/11/2005 - acerto na forma de lançamentos. No Banco real é diferente embora seja cnab 240
      52: //real cnab 240
         Begin
            If bTipo Then //finalidade do pagamento
               Begin
                  ListaTipoFormaSispag.Add('PAGAMENTOS DE DIVIDENDOS'); //10
                  ListaTipoFormaSispag.Add('PAGAMENTO DE SALÁRIOS'); //30
                  ListaTipoFormaSispag.Add('PAGAMENTO DESPESAS VIAJANTE EM TRÂNSITO'); //60
                  ListaTipoFormaSispag.Add('PAGAMENTO AUTORIZADO'); //70
                  ListaTipoFormaSispag.Add('PAGAMENTO BENEFÍCIOS'); //90
                  ListaTipoFormaSispag.Add('PAGAMENTO DIVERSOS'); //98
               End
            Else // forma de pagamento
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('CHEQUE ADMINISTRATIVO'); //02
                  ListaTipoFormaSispag.Add('DOC/TED'); //03
                  ListaTipoFormaSispag.Add('CARTÃO SALÁRIO ELETRÔNICO'); //04
                  ListaTipoFormaSispag.Add('RECIBO OP À DISPOSIÇÃO'); //10
                  ListaTipoFormaSispag.Add('PAGAMENTO COM AUTENTICAÇÃO NO CAIXA'); //20
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO/PAGAMENTO DE TÍTULOS DE COBRANÇA DO PRÓPRIO BANCO'); //30
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO/PAGAMENTO DE TÍTULOS DE COBRANÇA DE OUTROS BANCOS'); //31
               End;
         End;
      //fim - andre tavares - 29/11/2005 - acerto na forma de lançamentos. No Banco real é diferente
      //18, //52,
      //  Rodolpho da Silva - P: 19473/19480 - 16/06/2005
      //CATIA P:22120 - 24/05/06
     //  53, 54 : //padrao cnab 240
      18, 53, 54: //padrao cnab 240
         // FIM
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('PAGAMENTOS DE DIVIDENDOS'); //10
                  ListaTipoFormaSispag.Add('PAGAMENTO A FORNECEDOR'); //20
                  ListaTipoFormaSispag.Add('PAGAMENTO DE SALÁRIOS'); //30
                  ListaTipoFormaSispag.Add('PAGAMENTO SINISTROS SEGURADOS'); //50
                  ListaTipoFormaSispag.Add('PAGAMENTO DESPESAS VIAJANTE EM TRÂNSITO'); //60
                  ListaTipoFormaSispag.Add('PAGAMENTO AUTORIZADO'); //70
                  ListaTipoFormaSispag.Add('PAGAMENTO CREDENCIADOS'); //75
                  ListaTipoFormaSispag.Add('PAGAMENTO REPRESENTANTES/VENDEDORES AUTORIZADOS'); //80
                  ListaTipoFormaSispag.Add('PAGAMENTO BENEFÍCIOS'); //90
                  ListaTipoFormaSispag.Add('PAGAMENTO DIVERSOS'); //98

                  //  ListaTipoFormaSispag.Add('BLOQUETO ELETÔNICO'); //03 - André Tavares - pendência 18903
                  ListaTipoFormaSispag.Add('BLOQUETO ELETRÔNICO'); //  Rodolpho da Silva - P: 19352 -10/06/2005

                  ListaTipoFormaSispag.Add('ALEGAÇÃO DO SACADO'); //29 - André Tavares - pendência 18903
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('CHEQUE PAGAMENTO/ADMINISTRATIVO'); //02
                  ListaTipoFormaSispag.Add('DOC'); //03
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA POUPANÇA'); //05
                  ListaTipoFormaSispag.Add('OP À DISPOSIÇÃO'); //10
                  ListaTipoFormaSispag.Add('PAGAMENTO COM AUTENTICAÇÃO'); //20
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS DO PRÓPRIO BANCO'); //30
                  ListaTipoFormaSispag.Add('PAGAMENTO DE TITULOS EM OUTROS BANCOS'); //31
                  // início - André Tavares - 23/01/2004 - pendência 15976
                  ListaTipoFormaSispag.Add('T.E.D.'); //18
                  // fim    - André Tavares - 23/01/2004 - pendência 15976
               End;
         End;
      //--------------
          //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
      55, 56, 58, 59: //padrao cnab 240 do banespa //andre tavares - pendência ????? - inclui o banco besc
         Begin
            If bTipo Then // FINALIDADE
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('PAGAMENTO DE ALUGUEL / CONDOMÍNIO'); //02
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DUPLICATAS E TÍTULOS'); //03
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DIVIDENDOS'); //04
                  ListaTipoFormaSispag.Add('PAGAMENTO DE MENSALIDADES ESCOLARES'); //05
                  ListaTipoFormaSispag.Add('PAGAMENTO DE SALÁRIO'); //06
                  ListaTipoFormaSispag.Add('PAGAMENTO A FORNECEDOR / HONORÁRIOS'); //07
                  ListaTipoFormaSispag.Add('PAGAMENTO DE CÂMBIO / FUNDOS E BOLSAS'); //08
                  ListaTipoFormaSispag.Add('REPASSE DE ARRECADAÇÃO / PAGAMENTO DE TRIBUTOS'); //09
                  ListaTipoFormaSispag.Add('DOC / TED PARA POUPANÇA'); //11
                  ListaTipoFormaSispag.Add('DOC / TED PARA DEPÓSITO JUDICIAL'); //12
                  ListaTipoFormaSispag.Add('PENSÃO ALIMENTÍCIA'); //13
                  ListaTipoFormaSispag.Add('RESTITUIÇÃO DE IMPOSTO DE RENDA'); //14
                  ListaTipoFormaSispag.Add('OUTROS'); //99
               End
            Else
               Begin //FORMA DE PAGAMENTO
                  //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
                  If iSisPag In [58, 59] Then //andre tavares - pendência ????? - inclui o banco besc
                     Begin
                        ListaTipoFormaSispag.Add('01 CRÉDITO EM CONTA CORRENTE');
                        ListaTipoFormaSispag.Add('03 DOC - DOCUMENTO DE OPERAÇÃO DE CRÉDITO');
                        ListaTipoFormaSispag.Add('04 PAGAMENTO VIA RECIBO');
                        ListaTipoFormaSispag.Add('05 CRÉDITO EM CONTA POUPANÇA');
                        ListaTipoFormaSispag.Add('50 DÉBITO EM CONTA CORRENTE');
                        ListaTipoFormaSispag.Add('80 CARTÃO DE PAGAMENTO CCA');
                     End
                  Else
                     Begin
                        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                        ListaTipoFormaSispag.Add('CHEQUE ADMINISTRATIVO'); //02
                        ListaTipoFormaSispag.Add('TRANSFERÊNCIA PARA OUTROS BANCOS DOC, TED CIP e TED STR'); //03
                        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA POUPANÇA'); //05
                        ListaTipoFormaSispag.Add('ORDEM DE PAGAMENTO'); //10
                        If iSisPag = 55 Then
                           Begin
                              ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS DO PRÓPRIO BANCO'); //30
                              ListaTipoFormaSispag.Add('PAGAMENTO DE TITULOS EM OUTROS BANCOS'); //31
                           End;
                        ListaTipoFormaSispag.Add('TED CIP OUTRA TITULARIDADE'); //41
                        ListaTipoFormaSispag.Add('TED CIP MESMA TITULARIDADE'); //43
                        //início andre tavares - pendência 21175 - 03/04/2006
                        If iSisPag = 55 Then
                           ListaTipoFormaSispag.Add('GUIA DA PREVIDÊNCIA SOCIAL - GPS'); //50
                        //fim andre tavares - pendência 21175 - 03/04/2006
                     End;
               End;
         End;

      57: //padrao cnab 240 do real FOLHA DE PAGAMENTO
         Begin
            If bTipo Then // FINALIDADE
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DIVIDENDOS'); //04
                  ListaTipoFormaSispag.Add('PAGAMENTO DE SALÁRIO'); //06
                  ListaTipoFormaSispag.Add('DOC / TED PARA DEPÓSITO JUDICIAL'); //12
                  ListaTipoFormaSispag.Add('OUTROS'); //13
               End
            Else
               Begin //FORMA DE PAGAMENTO
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('CHEQUE ADMINISTRATIVO'); //02
                  ListaTipoFormaSispag.Add('TRANSFERÊNCIA PARA OUTROS BANCOS DOC, TED CIP e TED STR'); //03
                  ListaTipoFormaSispag.Add('RECIBO (OP À DISPOSIÇÃO)'); //10
               End;
         End;

      //--------------

      21: //Banrisul - PAGAMENTO DE FORNECEDORES
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('COBRANÇA'); //01
                  ListaTipoFormaSispag.Add('PAGAMENTO DIVIDENDOS'); //10
                  // inicio - André Tavares - pendência 14332
                  ListaTipoFormaSispag.Add('T.E.D.'); //12
                  // fim - André Tavares - pendência 14332
                  ListaTipoFormaSispag.Add('PAGAMENTO FORNECEDOR'); //20
                  ListaTipoFormaSispag.Add('PAGAMENTO SALÁRIOS'); //30
                  ListaTipoFormaSispag.Add('PAGAMENTO SINISTROS SEGURADOS'); //50
                  ListaTipoFormaSispag.Add('PAGAMENTO DESPESAS VIAJANTE EM TRÂNSITO'); //60
                  ListaTipoFormaSispag.Add('PAGAMENTO AUTORIZADO'); //70
                  ListaTipoFormaSispag.Add('PAGAMENTO CREDENCIADO'); //75
                  ListaTipoFormaSispag.Add('PAGAMENTO REPRESENTANTES/VENDEDORES AUTORIZADOS'); //80
                  ListaTipoFormaSispag.Add('PAGAMENTO BENEFÍCIOS'); //90
                  // inicio - André Tavares - pendência 14332
                  ListaTipoFormaSispag.Add('PAGAMENTO DE G.A.'); //91
                  ListaTipoFormaSispag.Add('PAGAMENTO DE GNRE'); //92
                  ListaTipoFormaSispag.Add('PAGAMENTO DE DARF'); //93
                  ListaTipoFormaSispag.Add('PAGAMENTO DE ARRECADACAO - PREFEITURAS, ÁGUA, LUZ, ETC'); //94
                  ListaTipoFormaSispag.Add('TELECOMUNICAÇÕES'); //95
                  // fim - André Tavares - pendência 14332
                  ListaTipoFormaSispag.Add('PAGAMENTO DIVERSOS'); //98
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('DOC'); //03
                  ListaTipoFormaSispag.Add('OP À DISPOSIÇÃO'); //10
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS DO PRÓPRIO BANCO'); //30
                  ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TITULOS DE OUTROS BANCOS'); //31
                  // inicio - André Tavares - pendência 14332
                  ListaTipoFormaSispag.Add('PAGAMENTO DE ARRECADAÇÕES DIVERSAS'); //33
                  // fim - André Tavares - pendência 14332
                  // inicio - André Tavares - pendência 15887 - 08/01/2004
                  ListaTipoFormaSispag.Add('T.E.D.'); //12
                  // fim - André Tavares - pendência 15887 - 08/01/2004
               End;
         End;

      23: //Pagamentos - Banco BBV
         Begin
            If bTipo Then
               Begin
                  ListaTipoFormaSispag.Add('Pagamento de Salário'); //01
                  ListaTipoFormaSispag.Add('Pagamentos Diversos'); //02
                  ListaTipoFormaSispag.Add('Pagamento Manual'); //03
                  ListaTipoFormaSispag.Add('Pagamento a Fornecedor'); //04
                  ListaTipoFormaSispag.Add('Carnês e Recibos'); //05
                  ListaTipoFormaSispag.Add('Cartão de Crédito'); //06
                  ListaTipoFormaSispag.Add('Pagamento a Acionista'); //07
                  ListaTipoFormaSispag.Add('Pagamento Personalizado'); //08
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
                  ListaTipoFormaSispag.Add('CHEQUE ORDEM DE PAGAMENTO'); //03
                  ListaTipoFormaSispag.Add('DOCUMENTO DE CRÉDITO - DOC'); //04
                  ListaTipoFormaSispag.Add('PAGUE (AUTENTICAÇÃO DE DOCUMENTOS)'); //05
                  ListaTipoFormaSispag.Add('PAGUE ELETRÔNICO(CÓDIGO DE BARRAS)'); //07
               End;
         End;

      24: //Pagamento de Fornecedores - Banco Santander
         Begin
            If bTipo Then
               Begin
                  //teste
               End
            Else
               Begin
                  ListaTipoFormaSispag.Add('DOC - Documento Ordem de Crédito'); //01
                  ListaTipoFormaSispag.Add('CHQ - Cheque Ordem de Pagamento'); //02
                  ListaTipoFormaSispag.Add('C/C - Crédito em Conta(Cliente Santander)'); //03
                  ListaTipoFormaSispag.Add('BLQ - Bloqueto(Eletrônico)'); //31
                  ListaTipoFormaSispag.Add('STR - TED STR'); //04
                  ListaTipoFormaSispag.Add('CIP - TED CIP'); //05
               End;
         End;
   End;
   Result := ListaTipoFormaSispag;
End;

Procedure TCtrlIntBanco.MostraFormRemessa(IndiceBanco, pNumRemessaDia: Integer; pGeraNossoNumero: Boolean;
   pNossoNumero, pDiasProtesto, pValorJuros, pNumeEmpresaBanco, pCodArquivoRemessa, ppath: String;
   ovCdsTexto: OleVariant; Var iUltNossoNumero, iUltCodArquivoGerado: String);

Var
   iContArq: Integer;
   bIniciouTrasacao, bEspera: boolean;
   _cdsAux: TclientDataset;
Begin
   CheckPath(ppath);

   //início  andre tavares - pendência 18844 - 28/03/2005
   IntbancoManager.CdsTexto.Data := OvCdsTexto;
   bespera := true;
   bIniciouTrasacao := false;
   If Not DataBase.InTransaction Then
      Begin
         startTransaction;
         bIniciouTrasacao := true;
      End;
   //fim  andre tavares - pendência 18844 - 28/03/2005

   Try
      With IntBancoManager Do
         Begin

            //inicio andre tavares - pendência 18844 - 28/03/2005
            _cdsAux := TclientDataSet.Create(Nil);
            bEspera := true;
            {
                  while bEspera do
                  begin

                    MessageInfo := '';
                    getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + CdsTexto.fieldByName('CODPORTFORMA').asString + 'FOR UPDATE NOWAIT');
                    if Pos('00054',MessageInfo) > 0 then
                    begin
                      if msgDlg('O registro está sendo atualizado em outro processo. Deseja tentar novamente?', 'Processo',
                                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                      begin
                        bEspera := false;
                        if bIniciouTrasacao then
                          RollBack;
                        exit;
                      end // if
                    end
                    else bEspera := false;
                  end; // while
                  MessageInfo := '';
                  _cdsAux.Data := getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + CdsTexto.fieldByName('CODPORTFORMA').asString + 'FOR UPDATE NOWAIT');
            }
                  // andré tavares - pendência 19308 - comentei o código acima e escrevi a linha abaixo, por algum motivo está dando erro de sql na FCRT.
            _cdsAux.Data := getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + CdsTexto.fieldByName('CODPORTFORMA').asString + ' FOR UPDATE');
            IntBancoManager.NossoNumero := _cdsAux.fieldByName('NOSSONUMERO').asString;
            _cds.Close;
            _cdsAux.free;
            IntBancoManager.CodigoPortadorForma := cdsTexto.fieldByName('CODPORTFORMA').asInteger;
            //fim - andre tavares - pendência 18844 - 28/03/2005

            bExibeArquivoGerado := fExibeArquivoGerado;

            FIndiceDoBanco := IndiceBanco;

            If Not DirectoryExists(ppath) Then
               Begin
                  Application.MessageBox(PChar('O Diretório indicado como padrão para este ' + (#13 + #10) +
                     'Modelo de Cobrança Eletrônica, não existe.'), 'Cobrança Eletrônica', MB_ICONINFORMATION);
                  UltNossoNumero := '0';
                  UltCodArquivoGerado := '0';
                  Exit;
               End;

            iContArq := 0;

            If IndiceBanco = 1 Then
               SNomeArquivo := ppath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'

               {
               // inicio - andre tavares 21/07/2003 pendencia 14439
                   else if IndiceBanco = 50 then
                   begin
                     SNomeArquivo := ppath + 'COV' + Copy(RemoveBarras(DateToStr(Date)), 3, 2)  + intTostr(iContArq + 1) + '.TXT'
                   end
               // fim - andre tavares 21/07/2003 pendencia 14439
               }

                   //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - Comentado - else if IndiceBanco = 50 then
                   //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado layout 61 no if
            Else If ((IndiceBanco = 50) Or (IndiceBanco = 61)) Then
               Begin
                  SicovCEF := TSicovCEF.Create;
                  SicovCEF.sRecPag := 'R';
                  SicovCEF.iCodOcorrencia := -1;
                  SNomeArquivo := ppath + SicovCEF.GetNomeArq;

                  // Alterado Por Arnaldo V. Scarin em 22/10/2010
                  // Se contas a Receber Força o Update dentro da Rotina de
                  // geração do Arquivo Sicov
                  SicovCEF.bMostraMensagem := (sistema.idModulo <> 4);
               End
            Else
               SNomeArquivo := ppath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';

            While FileExists(SNomeArquivo) Do
               Begin
                  Inc(iContArq);
                  If IndiceBanco = 1 Then
                     SNomeArquivo := ppath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'

                     {
                     // inicio - andre tavares 21/07/2003 pendencia 14439
                           else if IndiceBanco = 50 then
                           begin
                             SNomeArquivo := ppath + 'COV' + Copy(RemoveBarras(DateToStr(Date)), 3, 2)  + intTostr(iContArq + 1) + '.TXT'
                           end
                     // fim - andre tavares 21/07/2003 pendencia 14439
                     }
                  Else
                     SNomeArquivo := ppath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';
               End;

            CdsTexto.Data := OvCdsTexto;
            CdsEmpresa.Data := GetDataPacket(_sSQLEmpresa);

            GeraNossoNumero := pGeraNossoNumero;
            CodArquivoRemessa := IntToStr(StrToInt(pCodArquivoRemessa) + 1);
            NumeEmpresaBanco := pNumeEmpresaBanco;

            If pNossoNumero = '' Then
               NossoNumero := '0'
            Else
               NossoNumero := pNossoNumero;

            DiasProtesto := pDiasProtesto;
            ValorJuros := pValorJuros;

            UltNossoNumero := '0';
            UltCodArquivoGerado := '0';

            Cobranca := TCobranca.Create;

            If Self.NaoGerarArquivo And
               (IndiceBanco = 0) And
               (Not ChamaForm(TFrmCobrRemessaItauMT, FrmCobrRemessaItauMT)) Then
               Raise TCobrancaEletronicaError.Create('Configuração de remessa Itaú cancelada');

            If Not Self.NaoGerarArquivo Then
               Case IndiceBanco Of
                  0: If Not ChamaForm(TFrmCobrRemessaItauMT, FrmCobrRemessaItauMT) Then
                        Raise TCobrancaEletronicaError.Create('Configuração de remessa Itaú cancelada');

                  1: If Not ChamaForm(TFrmCobrRemessaBradescoMT, FrmCobrRemessaBradescoMT) Then
                        Raise TCobrancaEletronicaError.Create('Configuração de remessa Bradesco cancelada');

                  2: Cobranca.MontaCobrancaRegistradaUnibanco;
                  3: Cobranca.RealSR;
                  4:
                     Begin
                        DtmIntBanco.ExibeRelatorio;
                        If Not (Application.MessageBox('Os Documentos foram impressos Corretamente ?', 'Atenção', MB_YESNO + MB_ICONEXCLAMATION) = ID_YES) Then Abort;
                     End;
                  5: Cobranca.RealBarras;
                  6: Cobranca.Bcn;
                  7:
                     Begin
                        CnabBB := TCnabBB.Create;
                        CnabBB.MontaArquivo;
                        CnabBB.Free;
                     End;

                  8: // Cobranca.Cef;
                     Begin
                        CnabCEF := TCnabCEF.Create;
                        CnabCEF.MontaArquivo;
                        CnabCEF.Free;
                     End;

                  9: Cobranca.hsbc;
                  10, 25:
                     Begin
                        CnabSantander := TCnabSantander.Create;
                        CnabSantander.GeraArquivoSantander;
                        CnabSantander.Free;
                     End;
                  11: Cobranca.RealRegistrada;
                  12: Cobranca.MontaDebitoProgramado('001', 'BANCO DO BRASIL S/A', 'BBDEBITO');
                  13: Cobranca.MontaDebitoProgramado('356', 'BANCO REAL', 'REALDEBITO');
                  14: Cobranca.MontaDebitoProgramado('104', 'CAIXA ECONOMICA', 'CEFDEBITO');
                  15: DtmIntBanco.MontaBBLaser;
                  16: Cobranca.MontaBicBanco;
                  17: Cobranca.MontaSafraRegistrada;
                  18: Cobranca.MontaBancoBostonEscritural;
                  19: Cobranca.MontaBancoCidade;
                  20: Cobranca.MontaRegistradaHSBC;
                  21: Cobranca.MontaCobrancaEletronicaBanrisul;
                  22: Cobranca.MontaCobrancaEletronicaBBV;
                  23: Cobranca.MontaCobrancaSemRegistroUnibanco;
                  24:
                     Begin
                        Cobranca.GeraDebAutBanrisul;
                        Cobranca.MontaCobrancaEletronicaBanrisul;
                     End;
                  // inicio - Andre tavares 22/07/2003 - pendencia 14439
                  50:
                     Begin
                        SicovCEF.MontaSicovCEF;
                        SicovCEF.Free;
                     End;
                  // Fim - Andre tavares 22/07/2003 - pendencia 14439

                  //inicio andre tavares pendência 20286
                  55: // Cobrança banespa cnab 240
                     Begin
                        CobBANESPACnab240 := TCobBANESPACnab240.Create;
                        sNomeArquivo := ppath + CobBANESPACnab240.GetNomeArq;
                        CobBANESPACnab240.MontaArquivo;
                        CobBANESPACnab240.Free;
                     End;
                  //fim andre tavares pendência 20286

                  58: //amf 11.06.2007 24978 Cobrança BESC cnab 240
                     Begin
                        CobBESCCnab240 := TCobBESCCnab240.Create;
                        sNomeArquivo := ppath + CobBESCCnab240.GetNomeArq;
                        CobBESCCnab240.MontaArquivo;
                        CobBESCCnab240.Free;
                     End;

                  //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
                  59: //andre tavares - pendência 05/06/2007
                     Begin
                        PagBesccnab240 := TPagBesccnab240.Create;
                        Try
                           SNomeArquivo := ppath + PagBesccnab240.GetNomeArq;
                           PagBesccnab240.PagamentosBescCnab240;
                        Finally
                           PagBesccnab240.free;
                        End;
                     End;
                  // Fim - Andre tavares 22/07/2003 - pendencia 14439

                  //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
                  //layout 61 conforme layout 50
                  61:
                     Begin
                        SicovCEF.MontaSicovCEF;
                        SicovCEF.Free;
                     End
                     //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - FIM

               Else
                  MsgAviso('Modelo de Cobrança Eletrônica não implementado', 'Cobrança Eletrônica');
               End;
            Cobranca.Free;

            iUltNossoNumero := UltNossoNumero;
            iUltCodArquivoGerado := UltCodArquivoGerado;
            FNomeArquivoGerado := NomeArquivoIntBanco;
         End;

      //início - andré tavares - pendência 18844
      If bIniciouTrasacao Then
         commit;

   Except
      _cdsAux.Close;
      _cdsAux.free;
      If bIniciouTrasacao Then
         rollBack;
   End;
   //fim - andré tavares - pendência 18844

End;

Function TCtrlIntBanco.ValidaNossoNumero(sNossoNumero: String; iBanco: Integer; Var Mensagem: String): Boolean;
Var
   fNossoNumero: Real;
Begin
   Mensagem := '';
   FIndiceDoBanco := iBanco;
   Try
      fNossoNumero := StrToFloat(sNossoNumero);
   Except
      fNossoNumero := 0;
   End;

   Case iBanco Of
      0:
         Begin
            Result := (Length(sNossoNumero) < 9); // Itaú
            If Not Result Then
               Mensagem := 'O Nosso Número deve ter no máximo 8 posições';
         End;
      1:
         Begin
            {Formato: 9 - Carteira
                    00 - Fixos
                    AA - Dois ultimos digitos do ano
                    0000001 - Numero Sequencial
                    DV - DIGITO QUE SERÁ CALCULADO}
            {Novo Formato: 9 - Carteira
                         AA - Dois ultimos digitos do ano
                         000000001 - Numero Sequencial  }

            Result := (Length(sNossoNumero) = 12); //Bradesco
            //if Result then
            //  Result := (Copy(sNossoNumero, 2, 2) = '00');
            //if Result then
            //  Result := (Copy(sNossoNumero, 4, 2) = Copy(DateToStr(Date), Length(DateToStr(Date)) - 1, 2));
            If Not Result Then
               Mensagem := 'O Nosso Número deve ter o Fomato CAA999999999 onde,'#13 +
                  '(C - Carteira, AA - Ano e 999999999(9 Posições) Número Sequencial)';
         End;
      15:
         Begin
            Result := (Length(Trim(sNossoNumero)) = 11); // Banco do Brasil LASER
            If Not Result Then
               Mensagem := 'O Nosso Número deve ter 11 posições';
         End;
      21: // Banco Banrisul - Cobrança Eletrônica
         Begin
            Result := True;
            Exit;
         End;
      // início André Tavares - pendência 15205
      50: // banco CEF convênio SICOV
         Begin
            Result := True;
            Exit;
         End;
      // início André Tavares - pendência 15205

      58, 59: //amf 11.06.2007 24978 - não creio que o nosso número seja este... farei o teste.
         Begin
            Result := True;
            Exit;
         End;

      //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
      //layout 61 conforme layout 50
      61: // banco CEF convênio SICOV
         Begin
            Result := True;
            Exit;
         End;
      //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - FIM

   Else
      Result := True;
   End;

   If fNossoNumero = 0 Then Result := False;
End;

Function TCtrlIntBanco.ValidaNumInscricaoEmpresa(sNumInscricaoEmpresa: String; iBanco: Integer): Boolean;
Begin
   FIndiceDoBanco := iBanco;
   Case iBanco Of
      0: Result := (Length(sNumInscricaoEmpresa) = 12); // Itaú Agencia 5 + 0 Esquerda + Conta 7 + 0 Esquerda
      1: Result := (Length(sNumInscricaoEmpresa) = 17); // Bradesco
      14: Result := ((Length(sNumInscricaoEmpresa) <= 9) And (Length(sNumInscricaoEmpresa) > 0)); // Meridional
      16: Result := (Length(sNumInscricaoEmpresa) = 10); // BicBanco Remessa
      17: Result := (Length(sNumInscricaoEmpresa) = 14); // Banco SAFRA - Cobrança Registrada
      //    20: Result := (Length(sNumInscricaoEmpresa) <= 5); // HSBC  - Cobrança Registrada
      //    21: Result := (Length(sNumInscricaoEmpresa) <= 11); // BANRISUL  - Cobrança Eletrônica
      //    22: Result := (Length(sNumInscricaoEmpresa) <= 5); // BANRISUL  - Cobrança Eletrônica
   Else
      Result := True;
   End;
End;

// Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014

Function TCtrlIntBanco.BaixadeTitulosAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial, pApresentaVisulaizacao: String): TStrings;
Begin
   FIndiceDoBanco := IndiceBanco;
   With IntBancoManager Do
      Begin
         SNomeArquivo := sNomeArquivoRetorno;
         Result := Nil;
         Try
            AssignFile(ArquivoTexto, SNomeArquivo);
            Reset(ArquivoTexto);
            CloseFile(ArquivoTexto);
         Except
            Application.MessageBox(PChar('Erro ao abrir o Arquivo ' + SNomeArquivo), 'Aviso', MB_ICONINFORMATION);
            Exit;
         End;
      End;

   Try
      RetornoCobranca := TRetornoCobranca.Create;
      // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
      Result := RetornoCobranca.RetornoCobr(IndiceBanco, pApresentaVisulaizacao);
   Finally
      RetornoCobranca.Free;
   End;

   If Result = Nil Then
      Application.MessageBox('Retorno não Implementado Para Este Modelo de Cobrança Eletrônica', 'Cobrança Eletrônica', MB_ICONINFORMATION);
End;

Function TCtrlIntBanco.BuscaTipoFormaSisPag(bTipo, bCodigo: Boolean; iValorBusca, iSisPag: Integer): Integer;
Var iValor: Integer;
Begin
   FIndiceDoBanco := iSisPag;

   iValor := 0;
   Case iSisPag Of
      /////////////// início - andré tavares - 02/04/2004 - pendência 16160
      7: // todos do unibanco
         Begin
            If Not btipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           5: iValor := 0; //Crédito of = 5
                           7: iValor := 1; //TED = 7
                           8: iValor := 2; //TED especial = 8
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 5; //Crédito of = 5
                           1: iValor := 7; //TED = 7
                           2: iValor := 8; //TED especial = 8
                        End;
                     End;
               End;
         End;
      /////////////// fim - andré tavares - 02/04/2004 - pendência 16160
      0:
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           10: iValor := 0;
                           15: iValor := 1;
                           20: iValor := 2;
                           30: iValor := 3;
                           40: iValor := 4;
                           50: iValor := 5;
                           60: iValor := 6;
                           80: iValor := 7;
                           90: iValor := 8;
                           98: iValor := 9;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 10;
                           1: iValor := 15;
                           2: iValor := 20;
                           3: iValor := 30;
                           4: iValor := 40;
                           5: iValor := 50;
                           6: iValor := 60;
                           7: iValor := 80;
                           8: iValor := 90;
                           9: iValor := 98;
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           05: iValor := 3;
                           10: iValor := 4;
                           30: iValor := 5;
                           31: iValor := 6;
                           16: iValor := 7; //- DARF NORMAL
                           17: iValor := 8; // GPS- GUIA DA PREVIDÊNCIA
                           18: iValor := 9; //- DARF SIMPLES
                           19: iValor := 10; //- IPTU
                           21: iValor := 11; //- DARJ
                           41: iValor := 12; //- TED - OUTRO TITULAR
                           43: iValor := 13; //- TED - MESMO TITULAR
                           60: iValor := 14; //- CARTÃO SALARIO
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 05;
                           4: iValor := 10;
                           5: iValor := 30;
                           6: iValor := 31;
                           7: iValor := 16; //- DARF NORMAL
                           8: iValor := 17; // GPS- GUIA DA PREVIDÊNCIA
                           9: iValor := 18; //- DARF SIMPLES
                           10: iValor := 19; //- IPTU
                           11: iValor := 21; //- DARJ
                           12: iValor := 41; //- TED - OUTRO TITULAR
                           13: iValor := 43; //- TED - MESMO TITULAR
                           14: iValor := 60; //- CARTÃO SALARIO
                        End;
                     End;
               End;
         End;
      1:
         Begin
            If bTipo Then
               Begin

                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           18: iValor := 0;
                           70: iValor := 1;
                           00: iValor := 2;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 18;
                           1: iValor := 70;
                           2: iValor := 00;
                        End;
                     End;
               End

            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           1: iValor := 0;
                           2: iValor := 1;
                           4: iValor := 2;
                           5: iValor := 3;
                           6: iValor := 4;
                           7: iValor := 5;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 1;
                           1: iValor := 2;
                           2: iValor := 4;
                           3: iValor := 5;
                           4: iValor := 6;
                           5: iValor := 7;
                        End;
                     End;
               End
         End;
      4: //***
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           04: iValor := 3;
                           05: iValor := 4;
                           06: iValor := 5;
                           07: iValor := 6;
                           08: iValor := 7;
                           09: iValor := 8;
                           10: iValor := 9;
                           11: iValor := 10;
                           12: iValor := 11;
                           20: iValor := 12;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 04;
                           4: iValor := 05;
                           5: iValor := 06;
                           6: iValor := 07;
                           7: iValor := 08;
                           8: iValor := 09;
                           9: iValor := 10;
                           10: iValor := 11;
                           11: iValor := 12;
                           12: iValor := 20;
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           30: iValor := 1;
                           02: iValor := 2;
                           03: iValor := 3;
                           31: iValor := 4;
                           //início-  André Tavares - 28/07/2003 - pendência 14217
                           05: iValor := 5; // Crédito CC ou Poupança RealTime
                           07: iValor := 6; // TED CIP
                           08: iValor := 7; // TED STR
                           //Fim-  André Tavares - 28/07/2003 - pendência 14217
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 30;
                           2: iValor := 02;
                           3: iValor := 03;
                           4: iValor := 31;
                           //início-  André Tavares - 28/07/2003 - pendência 14217
                           5: iValor := 05; // Crédito CC ou Poupança RealTime
                           6: iValor := 07; // TED CIP
                           7: iValor := 08; // TED STR
                           //Fim-  André Tavares - 28/07/2003 - pendência 14217
                        End;
                     End;
               End;
         End;
      17:
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           10: iValor := 1;
                           11: iValor := 2;
                           20: iValor := 3;
                           30: iValor := 4;
                           31: iValor := 5;
                           32: iValor := 6;
                           33: iValor := 7;
                           34: iValor := 8;
                           36: iValor := 9;
                           40: iValor := 10;
                           50: iValor := 11;
                           60: iValor := 12;
                           61: iValor := 13;
                           62: iValor := 14;
                           70: iValor := 15;
                           90: iValor := 16;
                           91: iValor := 17;
                           92: iValor := 18;
                           95: iValor := 19;
                           39: iValor := 20;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 10;
                           2: iValor := 11;
                           3: iValor := 20;
                           4: iValor := 30;
                           5: iValor := 31;
                           6: iValor := 32;
                           7: iValor := 33;
                           8: iValor := 34;
                           9: iValor := 36;
                           10: iValor := 40;
                           11: iValor := 50;
                           12: iValor := 60;
                           13: iValor := 61;
                           14: iValor := 62;
                           15: iValor := 70;
                           16: iValor := 90;
                           17: iValor := 91;
                           18: iValor := 92;
                           19: iValor := 95;
                           20: iValor := 39;
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           05: iValor := 3;
                           07: iValor := 4;
                           30: iValor := 5;
                           31: iValor := 6;
                           32: iValor := 7;
                           33: iValor := 8;
                           37: iValor := 9;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 05;
                           4: iValor := 07;
                           5: iValor := 30;
                           6: iValor := 31;
                           7: iValor := 32;
                           8: iValor := 33;
                           9: iValor := 37;
                        End;
                     End;
               End;
         End;

      //52,
      //  Rodolpho da Silva - P: 19473/19480 - 16/06/2005

      57:
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then //FINALIDADE
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           04: iValor := 1;
                           06: iValor := 2;
                           12: iValor := 3;
                           13: iValor := 4;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 04;
                           2: iValor := 06;
                           3: iValor := 12;
                           4: iValor := 13;
                        End;
                     End;
               End
            Else //forma de pagamento
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           10: iValor := 3;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 10;
                        End;
                     End;
               End;
         End;

      //cátia - Pendência 22120 - 24/05/06
   // 53, 54:
      18, 53, 54:
         //FIM
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           10: iValor := 0;
                           20: iValor := 1;
                           30: iValor := 2;
                           50: iValor := 3;
                           60: iValor := 4;
                           70: iValor := 5;
                           75: iValor := 6;
                           80: iValor := 7;
                           90: iValor := 8;
                           98: iValor := 9;
                           03: iValor := 10; //André Tavares - 21/12/2004 - pendência 18093
                           29: iValor := 11; //André Tavares - 21/12/2004 - pendência 18093
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 10;
                           1: iValor := 20;
                           2: iValor := 30;
                           3: iValor := 50;
                           4: iValor := 60;
                           5: iValor := 70;
                           6: iValor := 75;
                           7: iValor := 80;
                           8: iValor := 90;
                           9: iValor := 98;
                           // início - André Tavares - 23/01/2004 - pendência 15976
                           //10: iValor := 50;
                           // fim - André Tavares - 23/01/2004 - pendência 15976
                           10: iValor := 03; //André Tavares - 21/12/2004 - pendência 18093
                           11: iValor := 29; //André Tavares - 21/12/2004 - pendência 18093
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           05: iValor := 3;
                           10: iValor := 4;
                           20: iValor := 5; //maria
                           30: iValor := 6;
                           31: iValor := 7;
                           // início - André Tavares - 23/01/2004 - pendência 15976
                           18: iValor := 8;
                           // fim - André Tavares - 23/01/2004 - pendência 15976
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 05;
                           4: iValor := 10;
                           5: iValor := 20; //maria
                           6: iValor := 30;
                           7: iValor := 31;
                           // início - André Tavares - 23/01/2004 - pendência 15976
                           8: iValor := 18;
                           // fim - André Tavares - 23/01/2004 - pendência 15976
                        End;
                     End;
               End;
         End;

      //------------------
      52:
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           10: iValor := 0;
                           30: iValor := 1;
                           60: iValor := 2;
                           70: iValor := 3;
                           90: iValor := 4;
                           98: iValor := 5;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 10;
                           1: iValor := 30;
                           2: iValor := 60;
                           3: iValor := 70;
                           4: iValor := 90;
                           5: iValor := 98;
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           04: iValor := 3;
                           10: iValor := 4;
                           20: iValor := 5;
                           30: iValor := 6;
                           31: iValor := 7;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 04;
                           4: iValor := 10;
                           5: iValor := 20;
                           6: iValor := 30;
                           7: iValor := 31;
                        End;
                     End;
               End;
         End;

      //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
      55, 56, 58, 59: // banespa cnab 240 // andre tavares - pendência ???? - 05/06/2007 - inclui o besc
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           04: iValor := 3;
                           05: iValor := 4;
                           06: iValor := 5;
                           07: iValor := 6;
                           08: iValor := 7;
                           09: iValor := 8;
                           11: iValor := 9;
                           12: iValor := 10;
                           13: iValor := 11;
                           14: iValor := 12;
                           99: iValor := 13;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 04;
                           4: iValor := 05;
                           5: iValor := 06;
                           6: iValor := 07;
                           7: iValor := 08;
                           8: iValor := 09;
                           9: iValor := 11;
                           10: iValor := 12;
                           11: iValor := 13;
                           12: iValor := 14;
                           13: iValor := 99;
                        End;
                     End;
               End
            Else
               Begin
                  //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
                  If iSisPag In [58, 59] Then //andre tavares - pendência ????? - inclui o banco besc
                     Begin
                        { ListaTipoFormaSispag.Add('01 CRÉDITO EM CONTA CORRENTE');
                         ListaTipoFormaSispag.Add('03 DOC - DOCUMENTO DE OPERAÇÃO DE CRÉDITO');
                         ListaTipoFormaSispag.Add('04 PAGAMENTO VIA RECIBO');
                         ListaTipoFormaSispag.Add('05 CRÉDITO EM CONTA POUPANÇA');
                         ListaTipoFormaSispag.Add('50 DÉBITO EM CONTA CORRENTE');
                         ListaTipoFormaSispag.Add('80 CARTÃO DE PAGAMENTO CCA');}
                        If bCodigo Then //
                           Begin
                              Case iValorBusca Of
                                 01: iValor := 0;
                                 03: iValor := 1;
                                 04: iValor := 2;
                                 05: iValor := 3;
                                 50: iValor := 4;
                                 80: iValor := 5;
                              End; //case
                           End
                        Else
                           Begin
                              Case iValorBusca Of
                                 0: iValor := 01;
                                 1: iValor := 03;
                                 2: iValor := 04;
                                 3: iValor := 05;
                                 4: iValor := 50;
                                 5: iValor := 80;
                              End;
                           End;
                     End

                  Else
                     Begin
                        If bCodigo Then // formas de pagamento do banespa cnab 240
                           Begin
                              Case iValorBusca Of
                                 01: iValor := 0;
                                 02: iValor := 1;
                                 03: iValor := 2;
                                 05: iValor := 3;
                                 10: iValor := 4;
                                 30: If iSisPag = 55 Then iValor := 5;
                                 31: If iSisPag = 55 Then iValor := 6;
                                 41: iValor := 7;
                                 43: iValor := 8;
                                 //início - andre tavares - pendência 21175 - 03/04/2006
                                 50: If iSisPag = 55 Then iValor := 9;
                                 //fim - andre tavares - pendência 21175 - 03/04/2006
                              End;
                           End
                        Else
                           Begin
                              Case iValorBusca Of
                                 0: iValor := 01;
                                 1: iValor := 02;
                                 2: iValor := 03;
                                 3: iValor := 05;
                                 4: iValor := 10;
                                 5: If iSisPag = 55 Then iValor := 30;
                                 6: If iSisPag = 55 Then iValor := 31;
                                 7: iValor := 41;
                                 8: iValor := 43;
                                 //início - andre tavares - pendência 21175 - 03/04/2006
                                 9: If iSisPag = 55 Then iValor := 50;
                                 //fim - andre tavares - pendência 21175 - 03/04/2006
                              End;
                           End;
                     End;
               End;
         End;
      //------------------

      { BANRISUL - Pagamento de Fornecedores - Fábio Barros 26/11/2001  }
      21:
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           10: iValor := 1;
                           12: iValor := 2;
                           20: iValor := 3;
                           30: iValor := 4;
                           50: iValor := 5;
                           60: iValor := 6;
                           70: iValor := 7;
                           75: iValor := 8;
                           80: iValor := 9;
                           90: iValor := 10;
                           91: iValor := 11;
                           92: iValor := 12;
                           93: iValor := 13;
                           94: iValor := 14;
                           95: iValor := 15;
                           98: iValor := 16;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 10;
                           2: iValor := 12;
                           3: iValor := 20;
                           4: iValor := 30;
                           5: iValor := 50;
                           6: iValor := 60;
                           7: iValor := 70;
                           8: iValor := 75;
                           9: iValor := 80;
                           10: iValor := 90;
                           11: iValor := 91;
                           12: iValor := 92;
                           13: iValor := 93;
                           14: iValor := 94;
                           15: iValor := 95;
                           16: iValor := 98;
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           03: iValor := 1;
                           10: iValor := 2;
                           30: iValor := 3;
                           31: iValor := 4;
                           33: iValor := 5;
                           //início - Andre Tavares - pendência 15887 - 09/01/2004
                           12: iValor := 6;
                           //fim - Andre Tavares - pendência 15887 - 09/01/2004
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 03;
                           2: iValor := 10;
                           3: iValor := 30;
                           4: iValor := 31;
                           5: iValor := 33;
                           //início - Andre Tavares - pendência 15887 - 09/01/2004
                           6: iValor := 12;
                           //fim - Andre Tavares - pendência 15887 - 09/01/2004
                        End;
                     End;
               End;
         End;

      { BBV - Pagamento - Fábio Barros 11/01/2002 }
      23:
         Begin
            If bTipo Then
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           02: iValor := 1;
                           03: iValor := 2;
                           04: iValor := 3;
                           05: iValor := 4;
                           06: iValor := 5;
                           07: iValor := 6;
                           08: iValor := 7;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 02;
                           2: iValor := 03;
                           3: iValor := 04;
                           4: iValor := 05;
                           5: iValor := 06;
                           6: iValor := 07;
                           7: iValor := 08;
                        End;
                     End;
               End
            Else
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           01: iValor := 0;
                           03: iValor := 1;
                           04: iValor := 2;
                           05: iValor := 3;
                           07: iValor := 4;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 01;
                           1: iValor := 03;
                           2: iValor := 04;
                           3: iValor := 05;
                           4: iValor := 07;
                        End;
                     End;
               End;
         End;

      { Banco Santander - Pagamento de Fornecedores - Fábio Barros 04/06/2002 }
      24:
         Begin
            If Not bTipo Then //Se for Forma de Pagamento. Este módelo não possui TIPO de PAGAMENTO
               Begin
                  If bCodigo Then
                     Begin
                        Case iValorBusca Of
                           1: iValor := 0;
                           2: iValor := 1;
                           3: iValor := 2;
                           31: iValor := 3;
                           4: iValor := 4;
                           5: iValor := 5;
                        End;
                     End
                  Else
                     Begin
                        Case iValorBusca Of
                           0: iValor := 1;
                           1: iValor := 2;
                           2: iValor := 3;
                           3: iValor := 31;
                           4: iValor := 4;
                           5: iValor := 5;
                        End;
                     End;
               End;
         End;
   End;
   Result := iValor;
End;

Function TCtrlIntBanco.MontaPagamentoEletronico(iIndiceArquivo, iUltCodArquivoGerado: Integer;
   OvDados: OleVariant; sPathRemessa: String): Boolean;

Var iContArq, iSeqArqAux: Integer;
   portforma: String;

   Function MontaNomeArquiv(sPathRemessa, sInicial, sExtensao: String; bContNumerico: Boolean): String;
   Var
      iCont: Integer;
   Begin
      iCont := 1;
      iSeqArqAux := 1;
      If bContNumerico Then
         Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iCont), 2) + '.' + sExtensao
      Else
         Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(64 + iCont) + '.' + sExtensao;

      While FileExists(Result) Do
         Begin
            Inc(iCont);

            If bContNumerico Then
               Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iCont), 2) + '.' + sExtensao
            Else
               Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(64 + iCont) + '.' + sExtensao;
         End;
      // inicio tavares 29/07/2003 - pendencia 14330
      iSeqArqAux := iCont;
      // fim tavares 29/07/2003 - pendencia 14330
   End;
Begin
   FIndiceDoBanco := iIndiceArquivo;

   CheckPath(sPathRemessa);

   With IntBancoManager Do
      Begin
         bExibeArquivoGerado := fExibeArquivoGerado;
         Try
            //if FDataPagamento <> '' then DataPagamento := FDataPagamento;
            If self.FDataPagamento <> '' Then IntBancoManager.DataPagamento := self.FDataPagamento; //andre tavares - pendencia 25172 - 22/05/2007 - ocomando with atrapalhou tudo, neste caso não se pode usar pois as variáveis de ambas as classes têm o mesmo nome

            bArquivoCriado := False;
            Result := bArquivoCriado;

            If Not DirectoryExists(sPathRemessa) Then
               Begin
                  Application.MessageBox(PChar('O Diretório indicado como padrão para este ' + (#13 + #10) +
                     'Modelo de Pagamento Eletrônico, não existe.'), 'Cobrança Eletrônica', MB_ICONINFORMATION);
                  Exit;
               End;

            iContArq := 0;

            // início - andre tavares - pendencia 19978 - 17/08/2005
            getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + CdsTexto.fieldByName('CODPORTFORMA').asString + ' FOR UPDATE');
            //fim - andre tavares - pendencia 19978 - 17/08/2005

            Case iIndiceArquivo Of
               1, 3:
                  SNomeArquivo := sPathRemessa;
               6, 7, 8, 9, 10, 11, 12, 16:
                  SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'CW', 'REM', True);
               2:
                  SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'REAL', 'REM', True);
               4:
                  SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'PG', 'REM', False);
               5:
                  SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'BBRCC', 'DAT', True);
               18:
                  SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'BBRDOC', 'DAT', True);
               19:
                  SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'BBRTRANSF', 'DAT', True);
               //inicio tavares pendência 15147
               //        21:
               //          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'RPEN', 'BRR', True);
               //fim tavares pendência 15147
               // inicio - andre tavares 21/07/2003 pendencia 14439
               50:
                  Begin
                     SicovCEF := TSicovCEF.Create;
                     SicovCEF.sRecPag := 'P';
                     SicovCEF.iCodOcorrencia := -1;
                     SNomeArquivo := sPathRemessa + SicovCEF.GetNomeArq;
                     //BRUNO AZEVEDO SOL 149534 KINTANA 1074989
                     SicovCEF.bMostraMensagem := (sistema.idModulo <> 4);
                  End;
               // fim - andre tavares 21/07/2003 pendencia 14439
               52:
                  Begin
                     PagREALcnab240 := TPagREALcnab240.Create;
                     SNomeArquivo := sPathRemessa + PagREALcnab240.GetNomeArq;
                  End;

               // Início - Rodolpho da Silva - P: 19473/19480 - 16/06/2005
               53: Begin
                     PagUnibancoCnab240 := TPagUnibancoCnab240.Create;
                     sNomeArquivo := sPathRemessa + PagUnibancoCnab240.GetNomeArq;
                  End;

               54: Begin
                     PagBradescoCnab240 := TPagBradescoCnab240.Create;
                     sNomeArquivo := sPathRemessa + PagBradescoCnab240.GetNomeArq;
                  End;
               // Fim - Rodolpho da Silva - P: 19473/19480 - 16/06/2005

               //inicio andre tavares - pendencia 20286
               55:
                  Begin
                     PagBanespacnab240 := TPagBanespacnab240.Create;
                     SNomeArquivo := sPathRemessa + PagBanespacnab240.GetNomeArq;
                  End;
               56:
                  Begin
                     FolhaPagBanespa := TFolhaPagBanespa.Create;
                     SNomeArquivo := sPathRemessa + FolhaPagBanespa.GetNomeArq;
                  End;
               //fim andre tavares - pendencia 20286

               // inicio - andre tavares - 11/10/2005 - pendência 20359
               57:
                  Begin
                     FolhaPagReal := TFolhaPagReal.Create;
                     SNomeArquivo := sPathRemessa + FolhaPagReal.GetNomeArq;
                  End;
               // fim - andre tavares - 11/10/2005 - pendência 20359

               //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
               58, 59: //andre tavares - pendência 05/06/2007
                  Begin
                     PagBesccnab240 := TPagBesccnab240.Create;
                     SNomeArquivo := sPathRemessa + PagBesccnab240.GetNomeArq;
                  End;

               //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
               //layout 61 conforme layout 50
               61:
                  Begin
                     SicovCEF := TSicovCEF.Create;
                     SicovCEF.sRecPag := 'P';
                     SicovCEF.iCodOcorrencia := -1;
                     SNomeArquivo := sPathRemessa + SicovCEF.GetNomeArq;
                     //BRUNO AZEVEDO SOL 149534 KINTANA 1074989
                     SicovCEF.bMostraMensagem := (sistema.idModulo <> 4);
                  End;
               //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - FIM
            Else
               Begin
                  SNomeArquivo := sPathRemessa + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.PAG';

                  While FileExists(SNomeArquivo) Do
                     Begin
                        Inc(iContArq);
                        SNomeArquivo := sPathRemessa + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.PAG';
                     End;
               End;
            End;

            CdsTexto.Data := OvDados;
            CdsEmpresa.Data := GetDataPacket(_sSQLEmpresa);

            CodArquivoRemessa := IntToStr(iUltCodArquivoGerado + 1);

            portforma := CdsTexto.fieldbyname('codportforma').asstring;

            Case iIndiceArquivo Of
               0: Sispag := TSispag.Create;
               1, 2, 3, 4, 5, 13, 14, 15, 19, 20, 22, 23, 24, 25: PagDiversos := TPagDiversos.Create;
               // andré tavares - 01/04/2004 pendência 16160 - incluí o codigo Cnab 51 (Ted unibanco)
               6, 7, 8, 9, 10, 11, 12, 16, 51: PagUnibanco := TPagUnibanco.Create;
            End;

            Case iIndiceArquivo Of
               0: Sispag.MontaSispagItau;
               1: PagDiversos.MontaPagFornReal;
               2: PagDiversos.MontaFolhaPagReal;
               3: PagDiversos.MontaFolhaPagBradesco;
               4: Begin
                     PagDiversos.MontaPagForneBradesco;
                     // inicio tavares pendência 15155
                     CodArquivoRemessa := intToStr(PagDiversos.iSeqRemessa);
                     // fim tavares pendência 15155
                  End;
               5: PagDiversos.MontaPagBancoDoBrasil;
               // andré tavares - 01/04/2004 pendência 16160 - incluí o codigo Cnab 51 (Ted unibanco)
               6, 7, 8, 9, 10, 11, 12, 51: PagUnibanco.MontaPagtoUnibanco(iIndiceArquivo);
               13: PagDiversos.MontaPagCEF;
               14: PagDiversos.MontaPagMeridional;
               15: PagDiversos.MontaPagBanespa;
               16: PagUnibanco.MontaPagtoUnibanco(1);
               17:
                  Begin
                     PagHsbc := TPagHsbc.Create;
                     PagHsbc.PagamentosHsbc;
                     PagHsbc.Free;
                  End;
               18:
                  Begin
                     PagBB := TPagBB.Create;
                     PagBB.PagamentosBB;
                     PagBB.Free;
                  End;
               19: PagDiversos.TransfBB;
               20: PagDiversos.MontaPagForBoston;
               21:
                  Begin
                     PagBanriSul := TPagBanriSul.Create;
                     //inicio tavares pendência 15147
                     SNomeArquivo := sPathRemessa + PagBanriSul.getNomeArq;
                     CodArquivoRemessa := intToStr(PagBanriSul.iSeqArquivo);
                     //fim tavares pendência 15147
                     PagBanriSul.GeraArquivoBanrisul;
                     PagBanriSul.Free;
                  End;
               22: PagDiversos.MontaLancamentoCCBanrisul;
               23: PagDiversos.MontaPagamentoBBV;
               24: PagDiversos.MontaPagamentoFornecedorSantander;
               25: PagDiversos.MontaFolhaPagamentoACCCARD;
               26:
                  Begin
                     PagSantander := TPagSantander.Create;
                     PagSantander.PagamentosSantander;
                     PagSantander.Free;
                  End;
               50:
                  Begin
                     SicovCEF.MontaSicovCEF;
                  End;
               52:
                  Begin
                     PagREALcnab240.PagamentosRealCnab240;
                  End;

               // Início - Rodolpho da Silva - P: 19473/19480 - 16/06/2005
               53:
                  Begin
                     PagUnibancoCnab240.PagamentosUnibancoCnab240;
                  End;
               54:
                  Begin
                     PagBradescoCnab240.PagamentosBradescoCnab240;
                  End;
               // Fim - Rodolpho da Silva - P: 19473/19480 - 16/06/2005

               // início - André Tavares - pendência 20286
               55:
                  Begin
                     PagBanespaCnab240.PagamentosBanespaCnab240;
                  End;

               56:
                  Begin
                     FolhaPagBanespa.FolhaPagamentosBanespa;
                  End;
               // fim - André Tavares - pendência 20286

               // inicio - andre tavares - 11/10/2005 - pendência 20359
               57:
                  Begin
                     FolhaPagReal.FolhaPagamentosReal;
                  End;
               // fim - andre tavares - 11/10/2005 - pendência 20359

               //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
               58, 59: //andre tavares - pendência 05/06/2007
                  Begin
                     PagBesccnab240.PagamentosBescCnab240;
                  End;

               //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
               //layout 61 conforme layout 50
               61:
                  Begin
                     SicovCEF.MontaSicovCEF;
                  End;
               //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - FIM

            End;

            Atualizaportforma(CodArquivoRemessa, portforma);
         Finally
            Case iIndiceArquivo Of
               0: Sispag.Free;
               1, 2, 3, 4, 5, 13, 14, 15, 19, 20: PagDiversos.Free;
               // andré tavares - 01/04/2004 pendência 16160 - incluí o codigo Cnab 51 (Ted unibanco)
               6, 7, 8, 9, 10, 11, 12, 16, 51: PagUnibanco.Free;
               50: SicovCEF.Free;
               52: PagREALcnab240.free;

               // Início - Rodolpho da Silva - P: 19473/19480 - 16/06/2005
               53: PagUnibancoCnab240.free;
               54: PagBradescoCnab240.free;
               // Fim - Rodolpho da Silva - P: 19473/19480 - 16/06/2005

               55: PagBanespaCnab240.free; // André Tavares - pendência 20286

               56: FolhaPagBanespa.free; // André Tavares - pendência 20286

               // inicio - andre tavares - 11/10/2005 - pendência 20359
               57: FolhaPagReal.free;
               // fim - andre tavares - 11/10/2005 - pendência 20359

              //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
               58, 59: //andre tavares - pendência 05/06/2007
                  PagBesccnab240.free;

               //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
               //layout 61 conforme layout 50
               61: SicovCEF.Free;
            End;

            Result := bArquivoCriado;

            FNomeArquivoGerado := NomeArquivoIntBanco;
            FNomeArquivoGerado := SNomeArquivo;
         End;
      End;
End;

Function TCtrlIntBanco.BaixadeSispagAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial: String): TStrings;
Begin
   With IntBancoManager Do
      Begin
         SNomeArquivo := sNomeArquivoRetorno;
         Result := Nil;
         Try
            AssignFile(ArquivoTexto, SNomeArquivo);
            Reset(ArquivoTexto);
            CloseFile(ArquivoTexto);
         Except
            Application.MessageBox(PChar('Erro ao abrir o Arquivo ' + SNomeArquivo), 'Aviso', MB_ICONINFORMATION);
            Exit;
         End;

         FIndiceDoBanco := IndiceBanco;

         Try
            RetornoSispag := TRetornoSispag.Create;

            Case IndiceBanco Of
               0: Result := RetornoSispag.RetornoSispagItau;
               1: Result := RetornoSispag.RetornoPagReal;
               4: Result := RetornoSispag.RetornoSispagPagForBradesco;
               17: Result := RetornoSispag.RetornoSISPagHsbc;
               18: Result := RetornoSispag.RetornoSISPagBB; //MARIA
               23: Result := RetornoSispag.RetornoPagForBBV;
               24: Result := RetornoSispag.RetornoPagForSANTANDER;

               //André Tavares - pendência 21659 - 28/03/2006 - Recebimento Automático do
               //Banco Banespa Cnab 240 - Pagto de Fornecedores (idmodelosCnab = 55)
               55: Result := RetornoSispag.RetornoSispagBanespa;

               //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
               58, 59: Result := RetornoSispag.RetornoSisPagBESC; //andre tavares - pendência 24978 - 15/06/2007

            Else
               Application.MessageBox('Modelo de Arquivo de Retorno Pagamento não implementado', 'Cobrança Eletrônica', MB_ICONINFORMATION);
               Result := Nil;
            End;
            RetornoSispag.Free;
         Except
            RetornoSispag.Free;
            Raise;
         End;
      End;
End;

Function TCtrlIntBanco.ValidaCodBarrasSispag(sCodBarras: String; idv: Integer): Boolean;
Var
   sTipoCodigo, sAuxCodBarras, sProd: String;
   X, iBase, iDividendo, iDigito, I, Z, isprod: Integer;
   iCdigito: Array[0..3] Of Integer;
Begin
   Result := False;
   sTipoCodigo := '';
   Case idv Of
      10: //Composição da represantação numérica do código de barras - parte superior da ficha de compensação
         Begin
            sTipoCodigo := 'Superior';
            //Cálculo do DV Módulo 10 base 2
            If Length(sCodBarras) >= 33 Then
               Begin
                  //Cálculo do DV do Campo 1
                  iBase := 2;
                  iDividendo := 0;
                  I := 9;
                  sAuxCodBarras := Copy(sCodBarras, 1, 9);
                  For X := 1 To 9 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[0] := 10 - (iDividendo Mod 10);

                  //Cálculo do DV do Campo 2
                  iBase := 2;
                  iDividendo := 0;
                  I := 10;
                  sAuxCodBarras := Copy(sCodBarras, 11, 10);
                  For X := 1 To 10 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[1] := 10 - (iDividendo Mod 10);

                  //Cálculo do DV do Campo 3
                  iBase := 2;
                  iDividendo := 0;
                  I := 10;
                  sAuxCodBarras := Copy(sCodBarras, 22, 10);
                  For X := 1 To 10 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[2] := 10 - (iDividendo Mod 10);

                  //-------------------------------------------------------

                  For X := 0 To 2 Do
                     If iCdigito[X] = 10 Then iCdigito[X] := 0;

                  Result := ((iCdigito[0] = StrToInt(sCodBarras[10])) And
                     (iCdigito[1] = StrToInt(sCodBarras[21])) And
                     (iCdigito[2] = StrToInt(sCodBarras[32])));
                  {AND (iCDigito[3] = StrToInt(sCodBarras[33])));}
               End;
         End;

      11: //Composição do código de barras - parte inferior da ficha de compensação
         Begin
            sTipoCodigo := 'Inferior';
            //Cálculo do DV Módulo 11 base 9
            If Length(sCodBarras) >= 40 Then
               Begin
                  iBase := 2;
                  iDividendo := 0;
                  sAuxCodBarras := Copy(sCodBarras, 1, 4) + Copy(sCodBarras, 6, 39);
                  For X := 1 To 43 Do
                     Begin
                        iDividendo := iDividendo + (StrToInt(sAuxCodBarras[44 - X]) * iBase);
                        If iBase = 9 Then
                           iBase := 2
                        Else
                           Inc(iBase);
                     End;
                  iDigito := 11 - (iDividendo Mod 11);

                  If iDigito In [10, 11] Then iDigito := 1;

                  Result := (iDigito = StrToInt(sCodBarras[5]));
               End;
         End;
   End;

   If Not Result Then MsgAviso('Código de Barras ' + sTipoCodigo + ' Incorreto', 'Aviso');
End;

Function TCtrlIntBanco.ObrigaTipoPagto(iBanco: Integer): Boolean;
Begin
   //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
   Result := (iBanco In [0, 1, 4, 17, 18, 21, 23, 52,
      53, 54, 55, 56, 57, 58, 59]);
End;

Function TCtrlIntBanco.ObrigaFormaPagto(iBanco: Integer): Boolean;
Begin
   //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 só que usa o débito em conta corrente
   Result := (iBanco In [0, 1, 4, 17, 18, 21, 23, 24, 52,
      53, 54, 55, 56, 57, 58, 59]);
End;

Function TCtrlIntBanco.ObrigaDadosBancarios(iBanco, iFormaPag: Integer): Boolean;
Begin
   Result := False;
   Case iBanco Of
      0: Result := (Not (iFormaPag In [30, 31]));
      1: Result := (iFormaPag In [1, 2, 4]);
      2, 3, 5, 6, 7, 8, 9, 10, 11, 12: Result := True;
      4, 17: Result := (Not (iFormaPag In [30, 31]));
      13, 14: Result := True;
   End;
End;

Procedure TCtrlIntBanco.MostraFormAlteracao(IndiceBanco: Integer; OvDocumentos: OleVariant;
   sPath, sNumeEmpresaBanco, sOcorrencia: String);
Var
   iContArq: Integer;
Begin
   With IntBancoManager Do
      Begin

         If Copy(sPath, Length(sPath), 1) <> '\' Then
            sPath := sPath + '\';

         intBancoManager.sCodOcorrencia := sOcorrencia;

         FIndiceDoBanco := IndiceBanco;

         If Not DirectoryExists(sPath) Then
            Begin
               Application.MessageBox(PChar('O Diretório indicado como padrão para este ' + (#13 + #10) +
                  'Modelo de Cobrança Eletrônica, não existe.'), 'Cobrança Eletrônica', MB_ICONINFORMATION);
               UltNossoNumero := '0';
               UltCodArquivoGerado := '0';
               Exit;
            End;

         iContArq := 0;
         // bradesco
         If IndiceBanco = 1 Then
            SNomeArquivo := sPath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'
         Else
            SNomeArquivo := sPath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';

         While FileExists(SNomeArquivo) Do
            Begin
               Inc(iContArq);
               If IndiceBanco = 1 Then
                  SNomeArquivo := sPath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'
               Else
                  SNomeArquivo := sPath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';
            End;
         //// bradesco

         CdsTexto.Data := OvDocumentos;
         CdsEmpresa.Data := GetDataPacket(_sSQLEmpresa);

         NumeEmpresaBanco := sNumeEmpresaBanco;

         bExibeArquivoGerado := fExibeArquivoGerado;
         Case IndiceBanco Of
            0: If Not ChamaForm(TFrmAlteraRemessItauMT, FrmAlteraRemessItauMT) Then
                  Raise TCobrancaEletronicaError.Create('Alteração de remessa Itaú cancelada'); //amf 11.06.2007 - correção de mensagem raise TCobrancaEletronicaError.Create('Alteração de renessa Itaú cancelada');
            // início - André Tavares - 12/04/2004 pendência 16137
            1:
               Begin
                  If trim(sOcorrencia) = '' Then
                     Begin
                        showMessage('Selecione o código de ocorrência.');
                        abort;
                     End;

                  If Not ChamaForm(TFrmCobrRemessaBradescoMT, FrmCobrRemessaBradescoMT) Then
                     Raise TCobrancaEletronicaError.Create('Configuração de remessa Bradesco cancelada');

               End;
            // fim - André Tavares - 12/04/2004 pendência 16137
            // início - André Tavares - 12/04/2004 pendência 16136
            50:
               Begin
                  If trim(sCodOcorrencia) = '' Then
                     Begin
                        showMessage('Selecione o código de ocorrência.');
                        abort;
                     End;
                  SicovCEF := TSicovCEF.Create;
                  SicovCEF.sRecPag := 'R';
                  SicovCEF.iCodOcorrencia := strToIntDef(trim(sCodOcorrencia), -1);
                  SNomeArquivo := spath + SicovCEF.GetNomeArq;
                  SicovCEF.bMostraMensagem := true; //Everson Cunha - SIG60379
                  SicovCEF.MontaSicovCEF;
                  SicovCEF.Free;
               End;
            // fim - André Tavares - 12/04/2004 pendência 16136
            52:
               Begin
                  PagREALcnab240 := TPagREALcnab240.Create;
                  SNomeArquivo := spath + PagREALcnab240.GetNomeArq;
                  PagREALcnab240.PagamentosRealCnab240;
                  PagREALcnab240.Free;
               End;

            // Início - Rodolpho da Silva - P: 19473/19480 - 16/06/2005
            53:
               Begin
                  PagUnibancoCnab240 := TPagUnibancoCnab240.Create;
                  SNomeArquivo := spath + PagUnibancoCnab240.GetNomeArq;
                  PagUnibancoCnab240.PagamentosUnibancoCnab240;
                  PagUnibancoCnab240.Free;
               End;

            54:
               Begin
                  PagBradescoCnab240 := TPagBradescoCnab240.Create;
                  SNomeArquivo := spath + PagBradescoCnab240.GetNomeArq;
                  PagBradescoCnab240.PagamentosBradescoCnab240;
                  PagBradescoCnab240.Free;
               End;
            // Fim - Rodolpho da Silva - P: 19473/19480 - 16/06/2005

            // início - andre tavares - pendência 20286
            55:
               Begin
                  PagBanespaCnab240 := TPagBanespacnab240.Create;
                  SNomeArquivo := spath + PagBanespaCnab240.GetNomeArq;
                  PagBanespaCnab240.PagamentosBanespaCnab240;
                  PagBanespaCnab240.Free;
               End;

            56:
               Begin
                  FolhaPagBanespa := TFolhaPagBanespa.Create;
                  SNomeArquivo := spath + FolhaPagBanespa.GetNomeArq;
                  FolhaPagBanespa.FolhaPagamentosBanespa;
                  FolhaPagBanespa.Free;
               End;
            // fim - andre tavares - pendência 20286

            // inicio - andre tavares - 11/10/2005 - pendência 20359
            57:
               Begin
                  FolhaPagReal := TFolhaPagReal.Create;
                  SNomeArquivo := spath + FolhaPagReal.GetNomeArq;
                  FolhaPagReal.FolhaPagamentosReal;
                  FolhaPagReal.Free;
               End;
            // fim - andre tavares - 11/10/2005 - pendência 20359

            // fim - André Tavares - 12/04/2004 pendência 16137

            //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
            //layout 61 conforme layout 50
            61:
               Begin
                  If trim(sCodOcorrencia) = '' Then
                     Begin
                        showMessage('Selecione o código de ocorrência.');
                        abort;
                     End;
                  SicovCEF := TSicovCEF.Create;
                  SicovCEF.sRecPag := 'R';
                  SicovCEF.iCodOcorrencia := strToIntDef(trim(sCodOcorrencia), -1);
                  SNomeArquivo := spath + SicovCEF.GetNomeArq;
                  SicovCEF.MontaSicovCEF;
                  SicovCEF.Free;
               End;
            //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - FIM
         Else
            //amf 11.06.2007
            Application.MessageBox('A alteração para este Modelo de Cobrança Não foi Implementada', 'Cobrança Eletrônica', MB_ICONINFORMATION); //amf 11.06.2007 Application.MessageBox('A alteração para este Modelo de Cobrança Não foi Implementado', 'Cobrança Eletrônica', MB_ICONINFORMATION);
         End;
      End;
End;

Function TCtrlIntBanco.EncheListaOcorrencia(iIndiceBanco: Integer): TStrings;
Var
   ListaAux: TStrings;
Begin
   ListaAux := TStringList.Create;

   Case iIndiceBanco Of
      0: //itau
         Begin
            ListaAux.Add('02 - PEDIDO DE BAIXA');
            ListaAux.Add('04 - CONCESSÃO DE ABATIMENTO');
            ListaAux.Add('05 - CANCELAMENTO DE ABATIMENTO');
            ListaAux.Add('06 - ALTERAÇÃO DO VENCIMENTO');
            ListaAux.Add('07 - ALTERAÇÃO DO USO DA EMPRESA');
            ListaAux.Add('08 - ALTERAÇÃO DO SEU NÚMERO');
            ListaAux.Add('09 - PROTESTAR (emite aviso ao sacado, enviando a cartório após 4 dias úteis)');
            ListaAux.Add('10 - NÃO PROTESTAR (INIBE O PROTESTO AUTOMÁTICO)');
            ListaAux.Add('18 - SUSTAR O PROTESTO');
            ListaAux.Add('31 - ALTERAÇÃO DE OUTROS DADOS');
            ListaAux.Add('34 - BAIXA POR TER SIDO PAGO DIRETAMENTE AO CEDENTE');
            ListaAux.Add('36 - PROTESTO URGENTE (envia a cartório no dia útil seguinte)');
            ListaAux.Add('37 - ALTERAÇÃO DO VENCIMENTO E SUSTAR PROTESTO');
            ListaAux.Add('47 - CEDENTE SOLICITA DISPENSA DE JUROS');
         End;
      // início andre tavares - 08/04/2004 - pendência 16137
      1: //bradesco
         Begin
            ListaAux.Add('01 - REMESSA');
            ListaAux.Add('02 - PEDIDO DE BAIXA');
            ListaAux.Add('04 - CONCESSÃO DE ABATIMENTO');
            ListaAux.Add('05 - CANCELAMENTO DE ABATIMENTO CONCEDIDO');
            ListaAux.Add('06 - ALTERAÇÃO DO VENCIMENTO');
            ListaAux.Add('07 - ALTERAÇÃO DO CONTROLE DO PARTICIPANTE');
            ListaAux.Add('08 - ALTERAÇÃO DE SEU NÚMERO');
            ListaAux.Add('09 - PEDIDO DE PROTESTO');
            ListaAux.Add('18 - SUSTAR O PROTESTO E BAIXAR TÍTULO');
            ListaAux.Add('19 - SUSTAR O PROTESTO E MANTER EM CARTEIRA');
            ListaAux.Add('31 - ALTERAÇÃO DE OUTROS DADOS');
            ListaAux.Add('35 - DESAGENDAMENTO DO DÉBITO AUTOMÁTICO');
            ListaAux.Add('68 - ACERTO NOS DADOS DO RATEIO DE CRÉDITO');
            ListaAux.Add('69 - CANCELAMENTO DO RATEIO DE CRÉDITO');
         End;
      // fim andre tavares - 08/04/2004 - pendência 16137
      // início andre tavares - 08/04/2004 - pendência 16136
      50: //sicov
         Begin
            ListaAux.Add('0 - DÉBITO NORMAL');
            ListaAux.Add('1 - CANCELAMENTO(EXCLUSÃO) DE LANÇAMENTO ENVIADO ANTERIORMENTE PARA O BANCO');
         End;
      // fim andre tavares - 08/04/2004 - pendência 16136

          //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para
          //layout 61 conforme layout 50
      61: //sicov
         Begin
            ListaAux.Add('0 - DÉBITO NORMAL');
            ListaAux.Add('1 - CANCELAMENTO(EXCLUSÃO) DE LANÇAMENTO ENVIADO ANTERIORMENTE PARA O BANCO');
         End;
      ////Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - FIM

   End;
   Result := ListaAux;
End;

Function TCtrlIntBanco.VerificaCamposParaAlteracao(iIndiceBanco, iOcorrencia: Integer): String;
Begin
   Case iIndiceBanco Of
      0: // itaú
         Begin
            Case iOcorrencia Of
               31: Result := '-1';
               37, 6: Result := '4,5';
               4, 5: Result := '5,15';
               2, 9, 20, 28, 34, 36, 47: Result := '5';
               7, 8: Result := '5,20';
            Else
               Result := '-1'
            End;
         End;
      50: //SicovCEF  // andre tavares - 12/04/2003 pendência 16136
         result := '-1';
      61: //SicovCEF      //Ricardo Freitas Araújo SOL 151593 KINTANA 1115220 - adicionado para layout 61 conforme layout 50
         result := '-1';
   Else
      Result := '-1';
   End;
End;

Function TCtrlIntBanco.ValidaRemessa(sRecPag: Char; Const OvDocumentos: OleVariant; bValidaCodBarras: Boolean): Boolean;
Var
   X, iContArq, iOldPortForma: Integer;
   ListErro: TStrings;
   ArqLoqErro: TextFile;
   sMensagemDoc, SNomeArquivo, sMensagem, sMensagemBanco, sMensagemBarras: String;
   bVerificaBanco, bVerificaBarras: Boolean;
Begin

   Result := False;
   ListErro := TStringList.Create;
   CalculaDv := TCalcDv.Create;

   IntBancoManager.CdsTexto.Data := OvDocumentos;

   With IntBancoManager.CdsTexto Do
      Begin
         Try
            Case sRecPag Of
               'P', 'p':
                  Begin

                     If Not frmAguarde.Visible Then
                        Begin
                           frmAguarde.Min := 0;
                           frmAguarde.MAX := 100;
                           frmAguarde.Pos := 0;
                           frmAguarde.Mostra('Verificando Documentos');
                        End;

                     If IsEmpty Then Exit;

                     frmAguarde.Pos := 20;
                     First;

                     iOldPortForma := 0;

                     While Not EOF Do
                        Begin
                           bVerificaBarras := False;
                           sMensagemBarras := '';

                           If bValidaCodBarras Then
                              Begin
                                 If (iOldPortForma <> fieldbyname('CODPORTFORMA').AsInteger) Then
                                    Begin
                                       _Cds.Data := GetDataPacket('SELECT CODPORTFORMA FROM PORTADORFORMA WHERE ' +
                                          '(CODPORTFORMA = ' + fieldbyname('CODPORTFORMA').asstring + ') AND ' +
                                          '((CODFORMAPAGTO IN (' + fCodigosBarra + ')) Or (CODARQUIVOREMESSA IN (' + fModeloCodigoBarra + ')))');

                                       bVerificaBarras := Not _Cds.IsEmpty;
                                       _Cds.CLOSE;
                                    End;

                                 iOldPortForma := fieldbyname('CODPORTFORMA').AsInteger;

                                 If bVerificaBarras Then
                                    Begin
                                       If fieldbyname('CODBARRA').IsNull And
                                          fieldbyname('CODBARRAVALOR').IsNull Then
                                          sMensagemBarras := '>>> O Modelo de arquivo obriga a indicação do código de barras, que não foi informado para este documento'
                                    End;

                              End;

                           bVerificaBanco := ObrigaDadosBancarios(FIndiceDoBanco, fieldbyname('CODFORMAPAGTO').AsInteger);

                           If bVerificaBanco Then
                              Begin
                                 fieldbyname('CONTACORRENTE').Tag := 9;
                                 fieldbyname('CODBANCOFAVORECIDO').Tag := 9;
                                 fieldbyname('NUMAGENCIA').Tag := 9;
                              End
                           Else
                              Begin
                                 fieldbyname('CONTACORRENTE').Tag := 0;
                                 fieldbyname('CODBANCOFAVORECIDO').Tag := 0;
                                 fieldbyname('NUMAGENCIA').Tag := 0;
                              End;

                           If (Not fieldbyname('FLGEMITEAVISO').IsNull) And
                              (fieldbyname('FLGEMITEAVISO').asstring <> '0') Then
                              Begin
                                 fieldbyname('LOGRADOURO').Tag := 9;
                                 fieldbyname('CIDADE').Tag := 9;
                                 fieldbyname('CODESTADO').Tag := 9;
                                 fieldbyname('CEP').Tag := 9;
                                 fieldbyname('BAIRRO').Tag := 9;
                              End
                           Else
                              Begin
                                 fieldbyname('LOGRADOURO').Tag := 0;
                                 fieldbyname('CIDADE').Tag := 0;
                                 fieldbyname('CODESTADO').Tag := 0;
                                 fieldbyname('CEP').Tag := 0;
                                 fieldbyname('BAIRRO').Tag := 0;
                              End;

                           sMensagemBanco := '';
                           sMensagemDoc := '';

                           If bVerificaBanco Then
                              Begin
                                 //>> Excluído a verificação do DV na remessa, implementar verificação do parâmetro do banco para
                                 //       validação da conta - 23/03/2001
                                 {If fValidaDvContaAgencia Then
                                 Begin
                                    CalculaDv.TipoConta := FieldByName('TIPOCONTA').AsInteger;
                                    If Not CalculaDv.ValidaConta(FieldByName('CODBANCOFAVORECIDO').AsString,
                                                                FieldByName('NUMAGENCIA').AsString,
                                                                 FieldByName('CONTACORRENTE').AsString,False) Then
                                    sMensagemBanco := '>>> Favor Verificar a Conta Bancária\Agência Cadastrados para o Fornecedor!';
                                 End;}

                                 If FIndiceDoBanco = 1 Then
                                    Begin
                                       If ((Trim(fieldbyname('CODBANCOFAVORECIDO').asstring) = '275') Or (Trim(fieldbyname('CODBANCOFAVORECIDO').asstring) = '356')) And
                                          (Trim(fieldbyname('CODFORMAPAGTO').asstring) = '4') Then
                                          sMensagemDoc := 'Não é possível enviar DOC para contas Banco REAL';

                                       If (((Trim(fieldbyname('CODBANCOFAVORECIDO').AsString) <> '275') And (Trim(fieldbyname('CODBANCOFAVORECIDO').AsString) <> '356')) And
                                          (Trim(fieldbyname('CODFORMAPAGTO').asstring) = '2')) Then
                                          sMensagemDoc := 'Não é possível enviar arquivo e fazer crédito em conta para bancos diferentes do Banco REAL';
                                    End;
                              End;

                           sMensagem := '';

                           For X := 0 To FieldCount - 1 Do
                              If Fields[X].Tag = 9 Then
                                 If Fields[X].IsNull Then sMensagem := sMensagem + Fields
                                    [X].DisplayLabel + ', ';

                           frmAguarde.Pos := 45;

                           If (sMensagem <> '') Or
                              (sMensagemBanco <> '') Or
                              (sMensagemBarras <> '') Or
                              (sMensagemDoc <> '') Then
                              Begin
                                 ListErro.Add('Nome Fornecedor\Favorecido: ' + fieldbyname('Nome').asstring);
                                 ListErro.Add('Documento Nº: ' + fieldbyname('NoDocumento').asstring + '-' + fieldbyname('ComplDocumento').asstring);

                                 If (sMensagemBanco <> '') Then
                                    ListErro.Add(sMensagemBanco);

                                 If (sMensagemBarras <> '') Then
                                    ListErro.Add(sMensagemBarras);

                                 If (sMensagemDoc <> '') Then
                                    ListErro.Add(sMensagemDoc);

                                 If (sMensagem <> '') Then
                                    Begin
                                       ListErro.Add('Campos não preenchidos para este Fornecedor: ');
                                       ListErro.Add(Copy(sMensagem, 1, Length(sMensagem) - 2));
                                    End;

                                 ListErro.Add('_');
                                 ListErro.Add('');
                              End;

                           Next;
                        End;

                     frmAguarde.Pos := 55;

                     If ListErro.Text = '' Then
                        Result := True
                     Else
                        Begin
                           iContArq := 0;

                           frmAguarde.Pos := 60;

                           SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroSISPAG' + IntToStr(iContArq) + '.Txt';

                           frmAguarde.Pos := 65;

                           While FileExists(SNomeArquivo) Do
                              Begin
                                 Inc(iContArq);
                                 SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroSISPAG' + IntToStr(iContArq) + '.Txt';
                              End;

                           frmAguarde.Pos := 75;

                           AssignFile(ArqLoqErro, SNomeArquivo);

                           If FileExists(SNomeArquivo) Then
                              Reset(ArqLoqErro)
                           Else
                              ReWrite(ArqLoqErro);

                           frmAguarde.Pos := 80;

                           WriteLn(ArqLoqErro, '------------------------------------------------------------------------------');
                           WriteLn(ArqLoqErro, 'Erros Encontrados na preparação do Arquivo de Remessa Para Pagamento Automático em  ' + DateToStr(Date) + ' às ' + TimeToStr(Time));
                           WriteLn(ArqLoqErro, ' ');

                           For X := 0 To ListErro.Count - 1 Do
                              WriteLn(ArqLoqErro, ListErro[X]);

                           frmAguarde.Pos := 85;

                           WriteLn(ArqLoqErro, ' ');

                           CloseFile(ArqLoqErro);

                           frmAguarde.Pos := 95;

                           frmAguarde.Pos := 100;

                           frmAguarde.Apaga;

                           If Application.MessageBox(PChar('Faltam dados para gerar o Arquivo de Remessa Para Pagamento Eletrônico, deseja visualizar o arquivo de Log: ' + SNomeArquivo + '?'), 'Pagamento Eletrônico', MB_ICONQUESTION + MB_YESNO) = ID_YES Then
                              Begin
                                 CopyFile(PChar(SNomeArquivo), PChar(ExtractFilePath(SNomeArquivo) + 'Visualiza.Txt'), False);
                                 ShellExecuteFile(ExtractFilePath(SNomeArquivo) + 'Visualiza.Txt', '', '', SW_SHOW);
                              End;
                        End;
                  End;
               'R', 'r':
                  Begin
                     If IsEmpty Then Exit;

                     First;
                     While Not EOF Do
                        Begin
                           sMensagem := '';
                           For X := 0 To FieldCount - 1 Do
                              If (Fields[X].Tag = 9) And (Fields[X].IsNull) Then
                                 sMensagem := sMensagem + Fields[X].DisplayLabel + ', ';

                           If sMensagem <> '' Then
                              Begin
                                 ListErro.Add('Nome Cliente: ' + fieldbyname('Nome').asstring);
                                 ListErro.Add('Campos não preenchidos para este cliente: ');
                                 ListErro.Add(Copy(sMensagem, 1, Length(sMensagem) - 2));
                              End;

                           //Verifica ContaBancária
                           If FIndiceDoBanco = 12 Then
                              Begin
                                 IntBancoManager.DtmDadosBancarios.BuscaContaDoc(fieldbyname('CODDOCUMENTO').AsFloat);
                                 If IntBancoManager.DtmDadosBancarios.ContaBancaria.Numero = '' Then
                                    Begin
                                       If sMensagem = '' Then
                                          Begin
                                             ListErro.Add('Nome Cliente: ' + fieldbyname('Nome').asstring);
                                             ListErro.Add('Campos não preenchidos para este cliente: ');
                                          End;
                                       ListErro.Add('Conta Bancária Não Indicada')
                                    End
                                 Else
                                    If IntBancoManager.DtmDadosBancarios.ContaBancaria.Banco <> '001' Then
                                       Begin
                                          If sMensagem = '' Then
                                             Begin
                                                ListErro.Add('Nome Cliente: ' + fieldbyname('Nome').asstring);
                                                ListErro.Add('Campos não preenchidos para este cliente: ');
                                             End;

                                          ListErro.Add('Este modelo é exclusivamente para contas do Banco do Brasil');
                                       End;
                              End;

                           Next;
                        End;

                     If ListErro.Text = '' Then
                        Result := True
                     Else
                        Begin
                           iContArq := 0;

                           SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroCobrCM' + IntToStr(iContArq) + '.Txt';

                           While FileExists(SNomeArquivo) Do
                              Begin
                                 Inc(iContArq);
                                 SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroCobrCM' + IntToStr(iContArq) + '.Txt';
                              End;

                           AssignFile(ArqLoqErro, SNomeArquivo);
                           If FileExists(SNomeArquivo) Then
                              Reset(ArqLoqErro)
                           Else
                              ReWrite(ArqLoqErro);

                           WriteLn(ArqLoqErro, '------------------------------------------------------------------------------');
                           WriteLn(ArqLoqErro, 'Erros Encontrados na preparação para impressão de Bloquetos/Cobrança Eletrônica em ' + DateToStr(Date) + ' às ' + TimeToStr(Time));
                           WriteLn(ArqLoqErro, ' ');

                           For X := 0 To ListErro.Count - 1 Do
                              WriteLn(ArqLoqErro, ListErro[X]);

                           WriteLn(ArqLoqErro, ' ');

                           CloseFile(ArqLoqErro);

                           If Application.MessageBox(PChar('Faltam dados para imprimir os Bloquetos/Gerar Arquivo de Cobrança, deseja visualizar o arquivo de Log: ' + SNomeArquivo + '?'), 'Bloquetos\Cobrança Eletrônica', MB_ICONQUESTION + MB_YESNO) = ID_YES Then
                              WinExec(PChar('Notepad ' + SNomeArquivo), 1);
                        End;
                  End;
            Else
               MsgAviso('Tipo de remessa inválido', 'Atenção');
            End;

            ListErro.Free;
            CalculaDv.Free;
            First;
         Except
            ListErro.Free;
            CalculaDv.Free;
            First;
            Raise;
         End;
      End;
End;

Function TCtrlIntBanco.VerficaDadosEmpresa(sRecPag: Char; iCodPortForma: Integer): Boolean;
Var
   sMensagem: String;
Begin

   With IntBancoManager.DtmIntBanco.SQLParamIntBanco Do
      Begin
         Prepare;
         ParamByName('RECPAG').asstring := sRecPag;
         ParamByName('IDMODELOSCNAB').AsInteger := FIndiceDoBanco;
         ParamByName('CODPORTFORMA').AsInteger := iCodPortForma;
         Open;
      End;

   With IntBancoManager.CdsEmpresa Do
      Begin
         Result := False;
         sMensagem := '';

         Case sRecPag Of
            'P', 'p':
               Begin
                  _sSqlEmpresa := 'SELECT DISTINCT ' +
                     ' P.NOME,P.RAZAOSOCIAL,P.TIPO,E.LOGRADOURO,E.NUMERO,E.COMPLEMENTO, ' +
                     ' E.BAIRRO,C.NOME AS CIDADE,E.CEP,ES.CODESTADO, P.NUMDOCUMENTO, ' +
                     ' AG.NUMAGENCIA,PC.NOCONTACORR AS NUMCONTA,PB.NOME AS NOMEBANCO, PF.NUMEMPRESABANCO ' +
                     'FROM ' +
                     ' PESSOA P, ENDPESS E, CIDADES C, ESTADO ES, PORTADORFORMA PF, PORTADORCONTA PC, ' +
                     ' PESSOA PB, AGENCIABANCARIA AG ' +
                     'WHERE ' +
                     ' (PF.CODPORTFORMA = ' + IntToStr(iCodPortForma) + ') AND ' +
                     ' (PF.CODPORTADOR = PC.CODPORTADOR) AND ' +
                     ' (PC.IDBANCO = PB.IDPESSOA) AND ' +
                     ' (PC.IDAGENCIA = AG.IDPESSOA) AND ' +
                     ' (P.IDPESSOA = E.IDPESSOA(+)) AND ' +
                     ' (E.IDCIDADES = C.IDCIDADES(+)) AND ' +
                     ' (ES.IDESTADO(+) = C.IDESTADO)  AND ' +
                     ' (E.IDENDERECO(+) = P.IDENDCOMERCIAL) AND ' +
                     ' (P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')';

                  Data := GetDataPacket(_sSqlEmpresa);

                  If fieldbyname('NOME').IsNull Then sMensagem := 'Nome, ';
                  If fieldbyname('RAZAOSOCIAL').IsNull Then sMensagem := sMensagem + 'Razão Social, ';
                  If fieldbyname('CIDADE').IsNull Then sMensagem := sMensagem + 'Cidade, ';
                  If fieldbyname('CEP').IsNull Then sMensagem := sMensagem + 'Cep, ';
                  If fieldbyname('CODESTADO').IsNull Then sMensagem := sMensagem + 'Estado, ';
                  If fieldbyname('NUMDOCUMENTO').IsNull Then sMensagem := sMensagem + 'Numero do Documento, ';
                  If fieldbyname('LOGRADOURO').IsNull Then sMensagem := sMensagem + 'Nome da Rua\Logradouro, ';
                  If fieldbyname('NUMAGENCIA').IsNull Then sMensagem := sMensagem + 'Número da agência bancária, ';
                  If fieldbyname('NUMCONTA').IsNull Then sMensagem := sMensagem + 'Número da Conta Corrente, ';
                  If fieldbyname('NOMEBANCO').IsNull Then sMensagem := sMensagem + 'Nome do Banco, ';
               End;
            'R', 'r':
               Begin
                  _sSqlEmpresa := 'SELECT DISTINCT ' +
                     '  P.NOME, P.RAZAOSOCIAL, P.TIPO, ' +
                     ' (E.LOGRADOURO || '' '' || E.NUMERO || '' '' || E.COMPLEMENTO) AS ENDERECO, ' +
                     '  E.LOGRADOURO,E.NUMERO,E.COMPLEMENTO, ' + //pendência 26864 - 16/01/2008
                  '  E.BAIRRO,C.NOME AS CIDADE,E.CEP,ES.CODESTADO, P.NUMDOCUMENTO, ' +
                     '  AG.NUMAGENCIA,PC.NOCONTACORR AS NUMCONTA,PB.NOME AS NOMEBANCO, PF.NUMEMPRESABANCO ' +
                     'FROM ' +
                     ' PESSOA P, ENDPESS E, CIDADES C, ESTADO ES, PORTADORFORMA PF, PORTADORCONTA PC, ' +
                     ' PESSOA PB, AGENCIABANCARIA AG ' +
                     'WHERE ' +
                     ' (PF.CODPORTFORMA = ' + IntToStr(iCodPortForma) + ') AND ' +
                     ' (PF.CODPORTADOR = PC.CODPORTADOR) AND ' +
                     ' (PC.IDBANCO = PB.IDPESSOA) AND ' +
                     ' (PC.IDAGENCIA = AG.IDPESSOA) AND ' +
                     ' (P.IDPESSOA = E.IDPESSOA(+)) AND ' +
                     ' (E.IDCIDADES = C.IDCIDADES(+)) AND ' +
                     ' (ES.IDESTADO(+) = C.IDESTADO)  AND ' +
                     ' (E.IDENDERECO(+) = P.IDENDCOMERCIAL) AND ' +
                     ' (P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')';

                  Data := GetDataPacket(_sSqlEmpresa);

                  If fieldbyname('NOME').IsNull Then sMensagem := 'Nome, ';
                  If fieldbyname('RAZAOSOCIAL').IsNull Then sMensagem := sMensagem + 'Razão Social, ';
                  If fieldbyname('CIDADE').IsNull Then sMensagem := sMensagem + 'Cidade, ';
                  If fieldbyname('CEP').IsNull Then sMensagem := sMensagem + 'Cep, ';
                  If fieldbyname('CODESTADO').IsNull Then sMensagem := sMensagem + 'Estado, ';
                  If fieldbyname('NUMDOCUMENTO').IsNull Then sMensagem := sMensagem + 'Numero do Documento, ';
                  If fieldbyname('ENDERECO').IsNull Then sMensagem := 'Endereço, ';
                  If fieldbyname('BAIRRO').IsNull Then sMensagem := 'Bairro, ';
               End;
         Else
            MsgAviso('Tipo de remessa inválido', 'Atenção');
         End;

         sMensagem := Copy(sMensagem, 1, Length(sMensagem) - 2);

         If sMensagem <> '' Then
            Begin
               MsgAviso('0(s) campo(s): ' + sMensagem + ' da Empresa Proprietária, está(ão) em branco.' +
                  (#13 + #10) + 'Impossível gerar arquivo de remessa!', 'Atenção');
               If frmAguarde.Visible Then frmAguarde.Apaga;
            End
         Else
            Result := True;

         If Active Then CLOSE;
      End;
End;

Function TCtrlIntBanco.SetParametros(iCodPortForma: Longint; sRecPag: String): Boolean;
Var
   frm: TForm;
Begin
   IntBancoManager.CodigoPortadorForma := iCodPortForma;

   With IntBancoManager.DtmIntBanco.SQLParamIntBanco Do
      Begin
         Prepare;
         ParamByName('RECPAG').asstring := sRecPag;
         ParamByName('IDMODELOSCNAB').AsInteger := FIndiceDoBanco;
         ParamByName('CODPORTFORMA').AsInteger := iCodPortForma;
         Open;
      End;

   frm := Nil;

   If sRecPag = 'P' Then
      Begin
         Case FIndiceDoBanco Of
            2: frm := TFrmParamFolhaPagrealMT.Create(Application); //BANCO REAL FOLHA DE PAGAMENTO
            3: frm := TFrmParamFolhaPagBradescoMT.Create(Application); //BRADESCO FOLHA DE PAGAMENTO
            4: frm := TFrmParamPagForneBradescoMT.Create(Application); //BRADESCO PAGTO FORNECEDORES
            5: frm := TFrmParamPagBBMT.Create(Application); //BANCO DO BRASIL
            6: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO CRÉDITO EM CONTA
            7: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO DOC

            // andre tavares 02/04/2004 - pendência 16160
            51: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO TED

            8: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO PAGTO ELETRÔNICO, CARTÃO
            9: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO OCT, COBRANÇA ESPECIAL
            10: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO ORDEM PAGAMENTO, CHEQUE ADM
            11: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO TÍTULOS UNICOBRANÇA
            12: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO TÍTULOS OUTROS BANCOS
            13: frm := TfrmParamFolhaPagCEFMT.Create(Application); //UNIBANCO TÍTULOS OUTROS BANCOS
            16: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO DÉBITO EM CONTA
            18: frm := TFrmparamBBpagMT.Create(Application);
            19: frm := TFrmParamTransfBbMT.Create(Application); //BANCO DO BRASIL TRANSF
            24: frm := TfrmParamPagamentoFornecedorSantanderMT.Create(Application); //BANCO SANTANDER - PAG. FORNECEDORES

            //0:  frm := .Create(Application); //ITAÚ
            //1:  frm := .Create(Application); //BANCO REAL PAGTO FORNECEDORES
            //13: frm := .Create(Application); //CEF FOLHA DE PAGAMENTO
            //14: frm := .Create(Application); //MERIDIONAL SAQUE RÁPIDO
            //15: frm := .Create(Application); //BANESPA CONTAS CORRENTES
            //17: frm := .Create(Application); //HSBC BAMERINDUS
         End;
      End
   Else
      Begin
         Case FIndiceDoBanco Of
            2: frm := TFrmParamCobrancaRegistradaUnibancoMT.Create(Application); //UNIBANCO - Cobrança Registrada
            4: frm := TFrmParamBarrasBbMT.Create(Application); //BANCO DO BRASIL CÓDIGO DE BARRAS
            9: frm := TFrmCobrNregHSBCMT.Create(Application); //HSBC
            10, 25: frm := TfrmParamCnabSantanderMT.Create(Application); //Santander e Banespa
            11: frm := TfrmParamCobRegRealMT.Create(Application); //Real - Cobrança Registrada
            16: frm := TfrmParamRemBicBancoMT.Create(Application); //BicBanco - Remessa
            17: frm := TfrmParamSAFRARegistradaMT.Create(Application); //BANCO SAFRA - Cobrança Registrada
            18: frm := TfrmParamBostonEscrituralMT.Create(Application); //BANCO DE BOSTON - Cobrança Escritural
            19: frm := TfrmParamBancoCidadeMT.Create(Application); //BANCO CIDADE
            20: frm := TfrmParamRegistradaHSBCMT.Create(Application); //COBRANCA REGISTRADA HSBC
            21: frm := TfrmParamCobrancaEletronicaBanrisulMT.Create(Application); //COBRANCA ELETRÔNICA BANRISUL
            22: frm := TfrmParamCobrancaEletronicaBBVMT.Create(Application); //COBRANCA ELETRÔNICA BBV
            23: frm := TfrmParamCobrancaSemRegistroUnibancoMT.Create(Application); //UNIBANCO - COBRANCA SEM REGISTRO

            { Quando o usuário seleciona o débito automático, é criado tambem, o arquivo de cobrança eletrônica.
              Para mais informações falar comigo!!!!
              Fábio Barros - 16/05/2002
             }
            24: frm := TfrmParamCobrancaEletronicaBanrisulMT.Create(Application); //DÉBITO AUTOMÁTICO
         End;
      End;

   If frm = Nil Then
      Result := True
   Else
      With frm Do
         Begin
            Result := (ShowModal = mrOk);
            Free;
         End;
End;

Procedure TCtrlIntBanco.CheckPath(Var sPath: String);
Begin
   If Trim(sPath) = '' Then
      sPath := Sistema.TempDir
   Else
      Begin
         If Copy(sPath, Length(sPath), 1) <> '\' Then
            sPath := sPath + '\';

         If Not DirectoryExists(sPath) Then ForceDirectories(sPath);
      End;
End;

Procedure TCtrlIntBanco.SetValidaDvContaAgencia(Const Value: Boolean);
Begin
   FValidaDvContaAgencia := Value;
End;

Procedure TCtrlIntBanco.SetIdentficaOrigem(Const Value: String);
Begin
   If trim(value) = '' Then
      IntBancoManager.IdentificaOrigem := ' '
   Else
      IntBancoManager.IdentificaOrigem := Value;
End;

Procedure TCtrlIntBanco.AfterInitialize;
Begin
   Inherited;
   IntBancoManager.InitializeAs(Self);
End;

Function TCtrlIntBanco.GetIdentficaOrigem: String;
Begin
   Result := IntBancoManager.IdentificaOrigem;
End;

Function TCtrlIntBanco.GetMensagem1: String;
Begin
   Result := IntBancoManager.Mensagem1;
End;

Function TCtrlIntBanco.GetMensagem2: String;
Begin
   Result := IntBancoManager.Mensagem2;
End;

Function TCtrlIntBanco.GetMensagem3: String;
Begin
   Result := IntBancoManager.Mensagem3;
End;

Function TCtrlIntBanco.GetMensagem4: String;
Begin
   Result := IntBancoManager.Mensagem4;
End;

Function TCtrlIntBanco.GetMensagem5: String;
Begin
   Result := IntBancoManager.Mensagem5;
End;

Function TCtrlIntBanco.GetMensagem6: String;
Begin
   Result := IntBancoManager.Mensagem6;
End;

Function TCtrlIntBanco.GetMensagem7: String;
Begin
   Result := IntBancoManager.Mensagem7;
End;

Function TCtrlIntBanco.GetMensagem8: String;
Begin
   Result := IntBancoManager.Mensagem8;
End;

Function TCtrlIntBanco.GetNaoGerarArquivo: Boolean;
Begin
   Result := fnaogerararquivo;
End;

Procedure TCtrlIntBanco.SetMensagem1(Const Value: String);
Begin
   IntBancoManager.Mensagem1 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem2(Const Value: String);
Begin
   IntBancoManager.Mensagem2 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem3(Const Value: String);
Begin
   IntBancoManager.Mensagem3 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem4(Const Value: String);
Begin
   IntBancoManager.Mensagem4 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem5(Const Value: String);
Begin
   IntBancoManager.Mensagem5 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem6(Const Value: String);
Begin
   IntBancoManager.Mensagem6 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem7(Const Value: String);
Begin
   IntBancoManager.Mensagem7 := Trim(Value);
End;

Procedure TCtrlIntBanco.SetMensagem8(Const Value: String);
Begin
   IntBancoManager.Mensagem8 := Trim(Value);
End;

Function TCtrlIntBanco.GetAtualizaDoc: Boolean;
Begin
   Result := IntBancoManager.bAtualizadoc;
End;

{início - andre tavares - pendência 16342 - 29/04/2004 }
{ valida o código de barras de arrecadação DARF, LUZ, TELEFONE IPTU etc}

Function TCtrlIntBanco.ValidaCodBarrasArrecad(sCodBarras: String): Boolean;
Var
   iBlocoDigitos: Array[1..48] Of integer;
   iSomatorio: Array[1..48] Of integer;
   i, p, peso, resto: integer;
   dv1, dv2, dv3, dv4: integer;
Begin
   resto := 0;
   dv1 := 0;
   dv2 := 0;
   dv3 := 0;
   dv4 := 0;
   result := false;
   For i := 1 To 48 Do
      iSomatorio[i] := 0;

   // vare o string e pega cada dígito do código de barras
   p := 1;
   For i := 1 To length(sCodBarras) Do
      Begin
         If (sCodBarras[i] >= '0') And (sCodBarras[i] <= '9') Then
            Begin
               iBlocoDigitos[p] := strToInt(sCodBarras[i]);
               p := p + 1;
            End
      End;

   peso := 2;
   For i := 1 To 48 Do
      Begin
         If Not (i In [12, 24, 36, 48]) Then // posições dos dvs no array
            Begin
               iSomatorio[i] := (iBlocoDigitos[i] * peso);
               If iSomatorio[i] > 9 Then
                  iSomatorio[i] := iSomatorio[i] - 9;
               If peso = 2 Then
                  peso := 1
               Else
                  peso := 2;
            End
         Else
            peso := 2;
      End;

   // cálculo do dv1
   resto := 0;
   For i := 1 To 11 Do
      dv1 := dv1 + iSomatorio[i];
   If dv1 > 10 Then
      resto := dv1 Mod 10
   Else
      resto := dv1;
   If resto = 0 Then
      dv1 := 0
   Else
      dv1 := 10 - resto;

   // cálculo do dv2
   resto := 0;
   For i := 13 To 23 Do
      dv2 := dv2 + iSomatorio[i];
   If dv2 > 10 Then
      resto := dv2 Mod 10
   Else
      resto := dv2;
   If resto = 0 Then
      dv2 := 0
   Else
      dv2 := 10 - resto;

   // cálculo do dv3
   resto := 0;
   For i := 25 To 35 Do
      dv3 := dv3 + iSomatorio[i];
   If dv3 > 10 Then
      resto := dv3 Mod 10
   Else
      resto := dv3;
   If resto = 0 Then
      dv3 := 0
   Else
      dv3 := 10 - resto;

   // cálculo do dv4
   resto := 0;
   For i := 37 To 47 Do
      dv4 := dv4 + iSomatorio[i];
   If dv4 > 10 Then
      resto := dv4 Mod 10
   Else
      resto := dv4;
   If resto = 0 Then
      dv4 := 0
   Else
      dv4 := 10 - resto;

   result := (dv1 = iBlocoDigitos[12]) And (dv2 = iBlocoDigitos[24]) And
      (dv3 = iBlocoDigitos[36]) And (dv4 = iBlocoDigitos[48]);

   If Not Result Then
      MsgAviso('Código de Barras de Guia de Arrecadação Incorreto', 'Aviso');
End;
{fim - andre tavares - pendência 16342 - 29/04/2004 }

Function TCtrlIntBanco.CodAvisoBanespa(bCod: boolean): String;
Var ts: TstringList;
Begin
   ts := TstringList.Create;
   ts.Clear;
   If bCod Then
      Begin
         ts.Add('0');
         ts.Add('2');
         ts.Add('5');
         ts.Add('6');
      End Else Begin
         ts.Add('Não Emite Aviso');
         ts.Add('Emite Aviso Somente para o Remetente');
         ts.Add('Emite Aviso Somente para o Favorecido');
         ts.Add('Emite Aviso Somente para o Remetente e Favorecido');
      End;
   result := ts.text;
   ts.free;
End;

Procedure TCtrlIntBanco.SetiFloatExterno(Const Value: integer);
Begin
   FiFloatExterno := Value;
   intBancoManager.iFloatExterno := FiFloatExterno;
End;

Procedure TCtrlIntBanco.SetiFloatExternoAlt(Const Value: integer);
Begin
   FiFloatExternoAlt := Value;
   intBancoManager.iFloatExternoAlt := FiFloatExternoAlt;
End;

function TCtrlIntBanco.BaixadeTitulosSiacc(IndiceBanco: Integer;
  sRazaoSocial,
  pApresentaVisualizacao,
  pDataRetorno: String;
  pCodPortForma: Integer): TStrings;
var
  sLinha: string;
  sArquivoTemp: TextFile;
  sCaminhoArquivo: string;
begin
  Result := nil;
  sLinha := '';
  FIndiceDoBanco := IndiceBanco;
  sCaminhoArquivo :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\Retorno_' + IntToStr(pCodPortForma) + '_' + StringReplace(pDataRetorno, '/', '', [rfReplaceAll]) + '.txt';

  _sSQLEmpresa := 'SELECT LPAD(AD.ID_DOC_CODBARRAS_PESSOAS, 20, ''0'') AS CODDOCUMENTO,            ' +#13#10+
                  '       LPAD(REPLACE((AD.VALOR_EFETIVADO * 100), ''.'', ''''), 15, ''0'') AS VLRCREDITO, ' +#13#10+
                  '       TO_CHAR(AD.DATA_EFETIVACAO, ''YYYYMMDD'') AS DTOCORRENCIA,               ' +#13#10+
                  '       SUBSTR(AD.OCORRENCIA_RET, 1, 2) AS OCORRENCIA                            ' +#13#10+
                  '  FROM ARQUIVOXDOCUM AD                                                         ' +#13#10+
                  '  JOIN ARQUIVOPAGTO AP                                                          ' +#13#10+
                  '    ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO                                    ' +#13#10+
                  '   AND AP.CODPORTFORMA = ' + IntToStr(pCodPortForma)                              +#13#10+
                  ' WHERE AD.DATARETORNO = TO_DATE(' + QuotedStr(pDataRetorno) + ', ''DD/MM/YYYY'')' ;
  IntBancoManager.CdsAux.Data := GetDataPacket(_sSQLEmpresa);

  if not IntBancoManager.CdsAux.IsEmpty then
  begin
    AssignFile(sArquivoTemp, sCaminhoArquivo);
    Rewrite(sArquivoTemp);
    CloseFile(sArquivoTemp);
    IntBancoManager.sNomeArquivo := sCaminhoArquivo;
        
    while not IntBancoManager.CdsAux.Eof do
    begin
      sLinha := (IntBancoManager.CdsAux.FieldbyName('CODDOCUMENTO').AsString + IntBancoManager.CdsAux.FieldbyName('VLRCREDITO').AsString +
                 IntBancoManager.CdsAux.FieldbyName('DTOCORRENCIA').AsString + IntBancoManager.CdsAux.FieldbyName('OCORRENCIA').AsString);

      AssignFile(sArquivoTemp, sCaminhoArquivo);
      Append(sArquivoTemp);
      Write(sArquivoTemp, sLinha);
      WriteLn(sArquivoTemp);
      CloseFile(sArquivoTemp);

      IntBancoManager.CdsAux.Next;
    end;

    try
      AssignFile(IntBancoManager.ArquivoTexto, sCaminhoArquivo);
      Reset(IntBancoManager.ArquivoTexto);
      CloseFile(IntBancoManager.ArquivoTexto);

      RetornoCobranca := TRetornoCobranca.Create;
      Result := RetornoCobranca.RetornoCobr(IndiceBanco, pApresentaVisualizacao);
    finally
      FreeAndNil(RetornoCobranca);
      DeleteFile(sCaminhoArquivo);
    end;
  end
  else
    Application.MessageBox('Erro ao interpretar informações de retorno.', 'Aviso', MB_ICONINFORMATION);
end;

End.

