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

{ tavares - 16/07/2003 - pendência 14332                }

{*******************************************************}



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
{uPagHsbc.Pas              INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (17, 'P','BANCO HSBC - SISTEMA DE PAGAMENTOS');                  }
{uPagBB.Pas                INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (18, 'P','BANCO DO BRASIL - PAGAMENTOS');                        }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (19, 'P','BANCO DO BRASIL - TRANSF');                            }
{uPagDiversos.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (20, 'P','BANCO DE BOSTON - SISTEMA DE PAGAMENTOS');             }
{uPagBanrisul.pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (21, 'P','BANCO BANRISUL - PAGAMENTO DE FORNECEDORES');          }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (22, 'P','BANCO BANRISUL - LANÇAMENTOS EM CONTA CORRENTE');      }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (23, 'P','BANCO BBV - SISTEMA DE PAGAMENTOS';                    }
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (24, 'P','BANCO SANTANDER - PAGAMENTO DE FORNECEDORES(400 POSIÇÕES)';}
{uPagDiversos.Pas          INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (25, 'P','CARTÃO ACC CARD - FOLHA DE PAGAMENTO';                 }
{uPagSantander.Pas         INSERT INTO MODELOSCNAB (IDMODELOSCNAB,RECPAG,DESCRICAO) VALUES (26, 'P','BANCO SANTANDER - CARTÃO SALÁRIO');                 }
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


unit uCtrlIntBanco;

interface

uses Forms, Messages, Windows, Classes, SysUtils, Dialogs, Controls,
     uCMControlObject;

type
  TCobrancaEletronicaError = Exception;

  TCtrlIntBanco = class(TCMControlObject)
  private
    _sSQLEmpresa: String;
    FIndiceDoBanco: Integer;
    FCodigosBarra, FModeloCodigoBarra, FNomeArquivoGerado: string;
    FFechaQryTexto, fExibeArquivoGerado: Boolean;
    FDataPagamento: string;
    { >>>>> Argh: Foi Ela !!!!!!!!!}
    FValidaDvContaAgencia: Boolean;
    fnaogerararquivo: Boolean;
    procedure SetAtualizaDoc(Value: Boolean);
    procedure SetValidaDvContaAgencia(const Value: Boolean);

    {Verifica o caminho de destino do arquivo a ser gerado}
    procedure CheckPath(var sPath: string);
    procedure SetIdentficaOrigem(const Value: string);
    function GetIdentficaOrigem: string;
    function GetMensagem1: string;
    function GetMensagem2: string;
    function GetMensagem3: string;
    function GetMensagem4: string;
    function GetMensagem5: string;
    function GetMensagem6: string;
    function GetMensagem7: string;
    function GetMensagem8: string;
    function GetNaoGerarArquivo: Boolean;
    procedure SetMensagem1(const Value: string);
    procedure SetMensagem2(const Value: string);
    procedure SetMensagem3(const Value: string);
    procedure SetMensagem4(const Value: string);
    procedure SetMensagem5(const Value: string);
    procedure SetMensagem6(const Value: string);
    procedure SetMensagem7(const Value: string);
    procedure SetMensagem8(const Value: string);
    function GetAtualizaDoc: Boolean;
  protected
    procedure AfterInitialize; Override;
  public
    constructor Create; Override;
    destructor Destroy; override;

    {Indica se o processamento gera fisicamento um arquivo >>> ARGH: Foi Ela !!!!!!!!!!!!!!!}
    property NaoGerarArquivo: Boolean read GetNaoGerarArquivo write fnaogerararquivo;
    {Número do banco ( IDMODELOSCNAB ) a ser processado}
    property IndiceDoBanco: Integer read FIndiceDoBanco write FIndiceDoBanco;
    {Controla a atualização de dados da remessa na tabela DOCUMENTO}
    property AtualizaDoc: Boolean read GetAtualizaDoc write SetAtualizaDoc;
    {Controla o 'CloseOpen' da consulta com os dados dos registros a serem processados}
    property FechaQryTexto: Boolean read FFechaQryTexto write FFechaQryTexto;
    {Controla a exibição em tela do arquivo gerado}
    property ExibeArquivoGerado: Boolean read fExibeArquivoGerado write fExibeArquivoGerado;
    {Identifica a origem do arquivo: Utilizado para arquivos gerados pelo TOTALPREV}
    property IdentficaOrigem: string read GetIdentficaOrigem write SetIdentficaOrigem;
    {Data do pargamento do arquivo}
    property DataPagamento: string read FDataPagamento write FDataPagamento;
    {Código de barra a ser impresso no arquivo >> Acho que não é isso !!!!!!!!!!}
    property CodigosBarra: string read FCodigosBarra;
    {Modelo do Código de barra a ser impresso no arquivo >> Acho que não é isso !!!!!!!!!!}
    property ModeloCodigoBarra: string read FModeloCodigoBarra;
    {Nome do arquivo gerado para remssa}
    property NomeArquivoGerado: string read FNomeArquivoGerado;

    {Controle de Mensagens do Documento >>> ARGH: Foi Ela !!!!!!!!!!!!!!!}
    property Mensagem1: string read GetMensagem1 write SetMensagem1;
    property Mensagem2: string read GetMensagem2 write SetMensagem2;
    property Mensagem3: string read GetMensagem3 write SetMensagem3;
    property Mensagem4: string read GetMensagem4 write SetMensagem4;
    property Mensagem5: string read GetMensagem5 write SetMensagem5;
    property Mensagem6: string read GetMensagem6 write SetMensagem6;
    property Mensagem7: string read GetMensagem7 write SetMensagem7;
    property Mensagem8: string read GetMensagem8 write SetMensagem8;

    {Controla a validação da Contab Bancária e Agência para os modelos de arquivo que Obrigam Dados bancários}
    property ValidaDvContaAgencia :Boolean read FValidaDvContaAgencia write SetValidaDvContaAgencia;
    {Retorna um TStrings com os Tipos ou Formas de Pagamentos válidos para o SISPAG Itaú}
    function EncheListaTipoFormaSispag(bTipo: Boolean; iSisPag: Integer): TStrings;
    {Enche lista com as ocorrências valídas de acordo com o índice do banco}
    function EncheListaOcorrencia(iIndiceBanco: Integer): TStrings;
    {Retorna o Código do Tipo ou Forma de pagameto de acordo com o índice do Mesmo}
    function BuscaTipoFormaSisPag(bTipo, bCodigo: Boolean; iValorBusca, iSisPag: Integer): Integer;
    {Gera arquivo INTBANCO de pagamentos - CAP}
    function MontaPagamentoEletronico(iIndiceArquivo, iUltCodArquivoGerado: Integer;
      OvDados: OleVariant; sPathRemessa: string): Boolean;
    {Gera arquivo INTBANCO de Cobrança - CAR}
    procedure MostraFormRemessa(IndiceBanco, pNumRemessaDia: Integer; pGeraNossoNumero: Boolean;
      pNossoNumero, pDiasProtesto, pValorJuros, pNumeEmpresaBanco, pCodArquivoRemessa, ppath: string;
      ovCdsTexto: OleVariant; var iUltNossoNumero, iUltCodArquivoGerado: string);
    {Gera arquivo INTBANCo para alteração de remessa - CAR}
    procedure MostraFormAlteracao(IndiceBanco: Integer; OvDocumentos: OleVariant; sPath, sNumeEmpresaBanco, sOcorrencia: string);
    {Valida os campos obrigatório para gerar arquivo de alteração de remessa}
    function VerificaCamposParaAlteracao(iIndiceBanco, iOcorrencia: Integer): string;
    {Valida os dados cadastrais de Empresa que esta enviando o arquivo ( Endereço, Contá Bancári e Documento}
    function VerficaDadosEmpresa(sRecPag: Char; iCodPortForma: Integer): Boolean;
    {Valida dados da remessa sem gerar o arquivo}
    function ValidaRemessa(sRecPag: Char; Const OvDocumentos: OleVariant; bValidaCodBarras: Boolean): Boolean;
    {Proceessa arquivo de retorno genéricos}
    function BaixadeTitulosAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial: string): TStrings;
    {Proceessa arquivo de retorno do tipo SISPAG}
    function BaixadeSispagAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial: string): TStrings;
    {Valida o cadastro do nosso número no PORTADORFORMA de acordo com o banco}
    function ValidaNossoNumero(sNossoNumero: string; iBanco: Integer): Boolean;
    {Valida o cadastro do Número de inscrição da empresa no PORTADORFORMA de acordo com o banco}
    function ValidaNumInscricaoEmpresa(sNumInscricaoEmpresa: string; iBanco: Integer): Boolean;
    {Valida o código de barras a ser gravado no arquivo SISPAG}
    function ValidaCodBarrasSispag(sCodBarras: string; idv: Integer): Boolean;
    {Indica se determinado banco\modelo obriga a indicação de tipo de pagamento}
    function ObrigaTipoPagto(iBanco: Integer): Boolean;
    {Indica se determinado banco\modelo obriga a indicação de forma de pagamento}
    function ObrigaFormaPagto(iBanco: Integer): Boolean;
    {Indica se determinado banco\modelo obriga a indicação de dados bançarios}
    function ObrigaDadosBancarios(iBanco, iFormaPag: Integer): Boolean;
    {Seta parâmetros de acordo com o portador forma}
    function SetParametros(iCodPortForma: Longint; sRecPag: string): Boolean;
  end;

implementation

uses uIntBancoManager,
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
     fParamPagamentoFornecedorSantanderMT;

{Impressão sem gerar Nosso Número:
   a - Caso o arquivo seja gerado novamento, passar pGeraNossoNumero como False e
       pCodArquivoRemessa como o codigo do arquivo no Documento - 1
   b - caso 0 arquivo seja novo, passar pGeraNossoNumero como False}

constructor TCtrlIntBanco.Create;
begin
  Inherited;
  IntBancoManager := TIntBancoManager.Create;
  FIndiceDoBanco        := 0;
  FCodigosBarra         := '30,31,6,32';
  FModeloCodigoBarra    := '11,12';
  FFechaQryTexto        := True;
  fExibeArquivoGerado   := True;
  fnaogerararquivo      := False;
  FValidaDvContaAgencia := True;
  SetAtualizaDoc(False);
end;

destructor TCtrlIntBanco.Destroy;
begin
  IntBancoManager.Free;
  inherited Destroy;
end;

procedure TCtrlIntBanco.SetAtualizaDoc(Value: Boolean);
begin
  IntBancoManager.bAtualizadoc := Value;
end;

function TCtrlIntBanco.EncheListaTipoFormaSispag(bTipo: Boolean; iSisPag: Integer): TStrings;
var ListaTipoFormaSispag: TStrings;
begin
  FIndiceDoBanco := iSisPag;

  ListaTipoFormaSispag := TStringList.Create;
  ListaTipoFormaSispag.Clear;
  case iSisPag of
    0:
    begin
      if bTipo then
      begin
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
      end
      else
      begin
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
      end;
    end;
    1:
    begin
      if bTipo then
      begin
        ListaTipoFormaSispag.Add('TED');
        ListaTipoFormaSispag.Add('DOC COMPE');
        ListaTipoFormaSispag.Add('DIVERSOS');
      end
      else
      begin
        ListaTipoFormaSispag.Add('CHEQUE ADM');
        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA');
        ListaTipoFormaSispag.Add('DOC');
        ListaTipoFormaSispag.Add('RECIBO');
        ListaTipoFormaSispag.Add('CAIXA/ TIT. COBRANCA COD. BARRAS');
        ListaTipoFormaSispag.Add('NÃO DEFINIDA');
      end;


    end;
    4:
    begin
      if bTipo then
      begin
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
      end
      else
      begin
        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE');
        ListaTipoFormaSispag.Add('TÍTULO EM COBRANÇA BRADESCO');
        ListaTipoFormaSispag.Add('CHEQUE OPERACIONAL');
        ListaTipoFormaSispag.Add('DOC');
        ListaTipoFormaSispag.Add('TITULO DE TERCEIROS');
      end;
    end;
    17:
    begin
      if bTipo then
      begin
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
      end
      else
      begin
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
      end;
    end;

    18: //PAG BB
    begin
      if bTipo then
      begin
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
      end
      else
      begin
        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
        ListaTipoFormaSispag.Add('CHEQUE PAGAMENTO/ADMINISTRATIVO'); //02
        ListaTipoFormaSispag.Add('DOC'); //03
        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA POUNPANÇA'); //05
        ListaTipoFormaSispag.Add('OP À DISPOSIÇÃO'); //10
        ListaTipoFormaSispag.Add('PAGAMENTO COM AUTENTICAÇÃO'); //20
        ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS DO PRÓPRIO BANCO'); //30
        ListaTipoFormaSispag.Add('PAGAMENTO DE TITULOS EM OUTROS BANCOS'); //31
      end;
    end;

    21: //Banrisul - PAGAMENTO DE FORNECEDORES
    begin
      if bTipo then
      begin
        ListaTipoFormaSispag.Add('COBRANÇA'); //01
        ListaTipoFormaSispag.Add('PAGAMENTO DIVIDENDOS'); //10
        ListaTipoFormaSispag.Add('PAGAMENTO FORNECEDOR'); //20
        ListaTipoFormaSispag.Add('PAGAMENTO SALÁRIOS'); //30
        ListaTipoFormaSispag.Add('PAGAMENTO SINISTROS SEGURADOS'); //50
        ListaTipoFormaSispag.Add('PAGAMENTO DESPESAS VIAJANTE EM TRÂNSITO'); //60
        ListaTipoFormaSispag.Add('PAGAMENTO AUTORIZADO'); //70
        ListaTipoFormaSispag.Add('PAGAMENTO CREDENCIADO'); //75
        ListaTipoFormaSispag.Add('PAGAMENTO REPRESENTANTES/VENDEDORES AUTORIZADOS'); //80
        ListaTipoFormaSispag.Add('PAGAMENTO BENEFÍCIOS'); //90
        ListaTipoFormaSispag.Add('PAGAMENTO DIVERSOS'); //98
// inicio tavares - 16/07/2003 - pendencia 14332
        ListaTipoFormaSispag.Add('PAGAMENTO DE GA'); //91
        ListaTipoFormaSispag.Add('PAGAMENTO DE GNRE'); //92
        ListaTipoFormaSispag.Add('PAGAMENTO DE DARF'); //93
        ListaTipoFormaSispag.Add('PAGAMENTO DE ARRECADAÇÃO - PREFEITURAS, ÁGUAS, LUZ, ETC'); //94
        ListaTipoFormaSispag.Add('TELECOMUNICAÇÕES'); //95
// fim tavares - 16/07/2003 - pendencia 14332
      end
      else
      begin
        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE');
        ListaTipoFormaSispag.Add('DOC');
        ListaTipoFormaSispag.Add('OP À DISPOSIÇÃO');
        ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TÍTULOS DO PRÓPRIO BANCO');
        ListaTipoFormaSispag.Add('LIQUIDAÇÃO DE TITULOS DE OUTROS BANCOS');
// inicio tavares - 16/07/2003 - pendencia 14332
        ListaTipoFormaSispag.Add('PAGAMENTO DE ARRECADAÇÕES DIVERSAS');  //33
// fim tavares - 16/07/2003 - pendencia 14332
      end;
    end;

    23: //Pagamentos - Banco BBV
    begin
      if bTipo then
      begin
        ListaTipoFormaSispag.Add('Pagamento de Salário'); //01
        ListaTipoFormaSispag.Add('Pagamentos Diversos'); //02
        ListaTipoFormaSispag.Add('Pagamento Manual'); //03
        ListaTipoFormaSispag.Add('Pagamento a Fornecedor'); //04
        ListaTipoFormaSispag.Add('Carnês e Recibos'); //05
        ListaTipoFormaSispag.Add('Cartão de Crédito'); //06
        ListaTipoFormaSispag.Add('Pagamento a Acionista'); //07
        ListaTipoFormaSispag.Add('Pagamento Personalizado'); //08
      end
      else
      begin
        ListaTipoFormaSispag.Add('CRÉDITO EM CONTA CORRENTE'); //01
        ListaTipoFormaSispag.Add('CHEQUE ORDEM DE PAGAMENTO'); //03
        ListaTipoFormaSispag.Add('DOCUMENTO DE CRÉDITO - DOC'); //04
        ListaTipoFormaSispag.Add('PAGUE (AUTENTICAÇÃO DE DOCUMENTOS)'); //05
        ListaTipoFormaSispag.Add('PAGUE ELETRÔNICO(CÓDIGO DE BARRAS)'); //07
      end;
    end;

    24: //Pagamento de Fornecedores - Banco Santander
    begin
      if bTipo then
      begin
      //teste
      end
      else
      begin
        ListaTipoFormaSispag.Add('DOC - Documento Ordem de Crédito'); //01
        ListaTipoFormaSispag.Add('CHQ - Cheque Ordem de Pagamento'); //02
        ListaTipoFormaSispag.Add('C/C - Crédito em Conta(Cliente Santander)'); //03
        ListaTipoFormaSispag.Add('BLQ - Bloqueto(Eletrônico)'); //31
        ListaTipoFormaSispag.Add('STR - TED STR'); //04
        ListaTipoFormaSispag.Add('CIP - TED CIP'); //05
      end;
    end;
  end;
  Result := ListaTipoFormaSispag;
end;

procedure TCtrlIntBanco.MostraFormRemessa(IndiceBanco, pNumRemessaDia: Integer; pGeraNossoNumero: Boolean;
    pNossoNumero, pDiasProtesto, pValorJuros, pNumeEmpresaBanco, pCodArquivoRemessa, ppath: string;
    ovCdsTexto: OleVariant; var iUltNossoNumero, iUltCodArquivoGerado: string);
var
  iContArq: Integer;
begin
  CheckPath(ppath);

  with IntBancoManager do
  begin
    bExibeArquivoGerado := fExibeArquivoGerado;

    FIndiceDoBanco := IndiceBanco;

    if not DirectoryExists(ppath) then
    begin
      Application.MessageBox(PChar('O Diretório indicado como padrão para este ' + (#13 + #10) +
        'Modelo de Cobrança Eletrônica, não existe.'), 'Cobrança Eletrônica', MB_ICONINFORMATION);
      UltNossoNumero := '0';
      UltCodArquivoGerado := '0';
      Exit;
    end;

    iContArq := 0;

    if IndiceBanco = 1 then
      SNomeArquivo := ppath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'
    else
      SNomeArquivo := ppath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';

    while FileExists(SNomeArquivo) do
    begin
      Inc(iContArq);
      if IndiceBanco = 1 then
        SNomeArquivo := ppath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'
      else
        SNomeArquivo := ppath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';
    end;

    CdsTexto.Data := OvCdsTexto;
    CdsEmpresa.Data := GetDataPacket(_sSQLEmpresa);
    
    GeraNossoNumero := pGeraNossoNumero;
    CodArquivoRemessa := IntToStr(StrToInt(pCodArquivoRemessa) + 1);
    NumeEmpresaBanco := pNumeEmpresaBanco;

    if pNossoNumero = '' then
      NossoNumero := '0'
    else
      NossoNumero := pNossoNumero;

    DiasProtesto := pDiasProtesto;
    ValorJuros := pValorJuros;

    UltNossoNumero := '0';
    UltCodArquivoGerado := '0';

    Cobranca := TCobranca.Create;

    if Self.NaoGerarArquivo and
      (IndiceBanco = 0) and
      (not ChamaForm(TFrmCobrRemessaItauMT, FrmCobrRemessaItauMT)) then
      raise TCobrancaEletronicaError.Create('Configuração de remessa Itaú cancelada');

    if not Self.NaoGerarArquivo then
      case IndiceBanco of
        0: if not ChamaForm(TFrmCobrRemessaItauMT, FrmCobrRemessaItauMT) then
          raise TCobrancaEletronicaError.Create('Configuração de remessa Itaú cancelada');

        1: if not ChamaForm(TFrmCobrRemessaBradescoMT, FrmCobrRemessaBradescoMT) then
          raise TCobrancaEletronicaError.Create('Configuração de remessa Bradesco cancelada');

        2: Cobranca.MontaCobrancaRegistradaUnibanco;
        3: Cobranca.RealSR;
        4:
        begin
           DtmIntBanco.ExibeRelatorio;
          if not (Application.MessageBox('Os Documentos foram impressos Corretamente ?', 'Atenção', MB_YESNO + MB_ICONEXCLAMATION) = ID_YES) then Abort;
        end;
        5: Cobranca.RealBarras;
        6: Cobranca.Bcn;
        7:
        begin
          CnabBB := TCnabBB.Create;
          CnabBB.MontaArquivo;
          CnabBB.Free;
        end;

        8: // Cobranca.Cef;
        begin
          CnabCEF := TCnabCEF.Create;
          CnabCEF.MontaArquivo;
          CnabCEF.Free;
        end;

        9:  Cobranca.hsbc;
        10:
        begin
          CnabSantander := TCnabSantander.Create;
          CnabSantander.GeraArquivoSantander;
          CnabSantander.Free;
        end;
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
        begin
          Cobranca.GeraDebAutBanrisul;
          Cobranca.MontaCobrancaEletronicaBanrisul;
        end;
      else
        MsgAviso('Modelo de Cobrança Eletrônica não implementado', 'Cobrança Eletrônica');
      end;
    Cobranca.Free;

    iUltNossoNumero      := UltNossoNumero;
    iUltCodArquivoGerado := UltCodArquivoGerado;
    FNomeArquivoGerado   := NomeArquivoIntBanco;
  end;
end;


function TCtrlIntBanco.ValidaNossoNumero(sNossoNumero: string; iBanco: Integer): Boolean;
var
  fNossoNumero: Real;
begin 
  FIndiceDoBanco := iBanco;
  try
    fNossoNumero := StrToFloat(sNossoNumero);
  except
    fNossoNumero := 0;
  end;

  case iBanco of
    0: Result := (Length(sNossoNumero) < 9); // Itaú
    1:
    begin
      {Formato: 9 - Carteira
                00 - Fixos
                AA - Dois ultimos digitos do ano
                0000001 - Numero Sequencial
                DV - DIGITO QUE SERÁ CALCULADO}
      Result := (Length(sNossoNumero) = 12); //Bradesco
      if Result then
        Result := (Copy(sNossoNumero, 2, 2) = '00');
      if Result then
        Result := (Copy(sNossoNumero, 4, 2) = Copy(DateToStr(Date), Length(DateToStr(Date)) - 1, 2));
    end;
    15: Result := (Length(Trim(sNossoNumero)) = 11); // Banco do Brasil LASER
    21: // Banco Banrisul - Cobrança Eletrônica
    begin
      Result := True;
      Exit;
    end;
  else
    Result := True;
  end;

  if fNossoNumero = 0 then Result := False;
end;

function TCtrlIntBanco.ValidaNumInscricaoEmpresa(sNumInscricaoEmpresa: string; iBanco: Integer): Boolean;
begin
  FIndiceDoBanco := iBanco;
  case iBanco of
    0:  Result := (Length(sNumInscricaoEmpresa) = 12); // Itaú Agencia 5 + 0 Esquerda + Conta 7 + 0 Esquerda
    1:  Result := (Length(sNumInscricaoEmpresa) = 17); // Bradesco
    14: Result := ((Length(sNumInscricaoEmpresa) <= 9) and (Length(sNumInscricaoEmpresa) > 0)); // Meridional
    16: Result := (Length(sNumInscricaoEmpresa) = 10); // BicBanco Remessa
    17: Result := (Length(sNumInscricaoEmpresa) = 14); // Banco SAFRA - Cobrança Registrada
//    20: Result := (Length(sNumInscricaoEmpresa) <= 5); // HSBC  - Cobrança Registrada
//    21: Result := (Length(sNumInscricaoEmpresa) <= 11); // BANRISUL  - Cobrança Eletrônica
//    22: Result := (Length(sNumInscricaoEmpresa) <= 5); // BANRISUL  - Cobrança Eletrônica
  else
    Result := True;
  end;
end;

function TCtrlIntBanco.BaixadeTitulosAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial: string): TStrings;
begin
  FIndiceDoBanco := IndiceBanco;
  with IntBancoManager do
  begin
    SNomeArquivo := sNomeArquivoRetorno;
    Result := nil;
    try
      AssignFile(ArquivoTexto, SNomeArquivo);
      Reset(ArquivoTexto);
      CloseFile(ArquivoTexto);
    except
      Application.MessageBox(PChar('Erro ao abrir o Arquivo ' + SNomeArquivo), 'Aviso', MB_ICONINFORMATION);
      Exit;
    end;
  end;

  try
    RetornoCobranca := TRetornoCobranca.Create;
    Result := RetornoCobranca.RetornoCobr(IndiceBanco);
  finally
    RetornoCobranca.Free;
  end;

  if Result = nil then
    Application.MessageBox('Retorno não Implementado Para Este Modelo de Cobrança Eletrônica', 'Cobrança Eletrônica', MB_ICONINFORMATION);
end;

function TCtrlIntBanco.BuscaTipoFormaSisPag(bTipo, bCodigo: Boolean; iValorBusca, iSisPag: Integer): Integer;
var iValor: Integer;
begin
  FIndiceDoBanco := iSisPag;

  iValor := 0;
  case iSisPag of
    0:
    begin
      if bTipo then
      begin
        if bCodigo then
        begin
          case iValorBusca of
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
          end;
        end
        else
        begin
          case iValorBusca of
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
          end;
        end;
      end
      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
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
          end;
        end
        else
        begin
          case iValorBusca of
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
          end;
        end;
      end;
    end;
    1:
    begin
      if bTipo then
      begin

        if bCodigo then
        begin
          case iValorBusca of
            18  : iValor := 0;
            70  : iValor := 1;
            00  : iValor := 2;
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 18;
            1: iValor := 70;
            2: iValor := 00;
          end;
        end;
      end

      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
            1: iValor := 0;
            2: iValor := 1;
            4: iValor := 2;
            5: iValor := 3;
            6: iValor := 4;
            7: iValor := 5;
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 1;
            1: iValor := 2;
            2: iValor := 4;
            3: iValor := 5;
            4: iValor := 6;
            5: iValor := 7;
          end;
        end;
      end
    end;
    4:
    begin
      if bTipo then
      begin
        if bCodigo then
        begin
          case iValorBusca of
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
          end;
        end
        else
        begin
          case iValorBusca of
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
          end;
        end;
      end
      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
            01: iValor := 0;
            30: iValor := 1;
            02: iValor := 2;
            03: iValor := 3;
            31: iValor := 4;
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 01;
            1: iValor := 30;
            2: iValor := 02;
            3: iValor := 03;
            4: iValor := 31;
          end;
        end;
      end;
    end;
    17:
    begin
      if bTipo then
      begin
        if bCodigo then
        begin
          case iValorBusca of
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
          end;
        end
        else
        begin
          case iValorBusca of
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
          end;
        end;
      end
      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
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
          end;
        end
        else
        begin
          case iValorBusca of
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
          end;
        end;
      end;
    end;
    18:
    begin
      if bTipo then
      begin
        if bCodigo then
        begin
          case iValorBusca of
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
          end;
        end
        else
        begin
          case iValorBusca of
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
          end;
        end;
      end
      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
            01: iValor := 0;
            02: iValor := 1;
            03: iValor := 2;
            05: iValor := 3;
            10: iValor := 4;
            20: iValor := 5; //maria
            30: iValor := 6;
            31: iValor := 7;
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 01;
            1: iValor := 02;
            2: iValor := 03;
            3: iValor := 05;
            4: iValor := 10;
            5: iValor := 20; //maria
            6: iValor := 30;
            7: iValor := 31;
          end;
        end;
      end;
    end;
{ BANRISUL - Pagamento de Fornecedores - Fábio Barros 26/11/2001  }
    21:
    begin
      if bTipo then
      begin
        if bCodigo then
        begin
          case iValorBusca of
            01: iValor := 0;
            10: iValor := 1;
            20: iValor := 2;
            30: iValor := 3;
            50: iValor := 4;
            60: iValor := 5;
            70: iValor := 6;
            75: iValor := 7;
            80: iValor := 8;
            90: iValor := 9;
            98: iValor := 10;
// inicio tavares - 16/07/2003 - pendencia 14332
            91: iValor := 11;
            92: iValor := 12;
            93: iValor := 13;
            94: iValor := 14;
            95: iValor := 15;
// FIM tavares - 16/07/2003 - pendencia 14332
          end;
        end
        else
        begin
          case iValorBusca of
            0:  iValor := 01;
            1:  iValor := 10;
            2:  iValor := 20;
            3:  iValor := 30;
            4:  iValor := 50;
            5:  iValor := 60;
            6:  iValor := 70;
            7:  iValor := 75;
            8:  iValor := 80;
            9:  iValor := 90;
            10: iValor := 98;
// inicio tavares - 16/07/2003 - pendencia 14332
            11: iValor := 91;
            12: iValor := 92;
            13: iValor := 93;
            14: iValor := 94;
            15: iValor := 95;
// FIM tavares - 16/07/2003 - pendencia 14332
          end;
        end;
      end
      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
            01: iValor := 0;
            03: iValor := 1;
            10: iValor := 2;
            30: iValor := 3;
            31: iValor := 4;
// inicio tavares - 16/07/2003 - pendencia 14332
            33: iValor := 5;
// FIM tavares - 16/07/2003 - pendencia 14332
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 01;
            1: iValor := 03;
            2: iValor := 10;
            3: iValor := 30;
            4: iValor := 31;
// inicio tavares - 16/07/2003 - pendencia 14332
            5: iValor := 33;
// FIM tavares - 16/07/2003 - pendencia 14332
          end;
        end;
      end;
    end;

{ BBV - Pagamento - Fábio Barros 11/01/2002 }
    23:
    begin
      if bTipo then
      begin
        if bCodigo then
        begin
          case iValorBusca of
            01: iValor := 0;
            02: iValor := 1;
            03: iValor := 2;
            04: iValor := 3;
            05: iValor := 4;
            06: iValor := 5;
            07: iValor := 6;
            08: iValor := 7;
          end;
        end
        else
        begin
          case iValorBusca of
            0:  iValor := 01;
            1:  iValor := 02;
            2:  iValor := 03;
            3:  iValor := 04;
            4:  iValor := 05;
            5:  iValor := 06;
            6:  iValor := 07;
            7:  iValor := 08;
          end;
        end;
      end
      else
      begin
        if bCodigo then
        begin
          case iValorBusca of
            01: iValor := 0;
            03: iValor := 1;
            04: iValor := 2;
            05: iValor := 3;
            07: iValor := 4;
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 01;
            1: iValor := 03;
            2: iValor := 04;
            3: iValor := 05;
            4: iValor := 07;
          end;
        end;
      end;
    end;

    { Banco Santander - Pagamento de Fornecedores - Fábio Barros 04/06/2002 }
    24:
    begin
      if not bTipo then //Se for Forma de Pagamento. Este módelo não possui TIPO de PAGAMENTO
      begin
        if bCodigo then
        begin
          case iValorBusca of
            1: iValor := 0;
            2: iValor := 1;
            3: iValor := 2;
            31: iValor := 3;
            4: iValor := 4;
            5: iValor := 5;
          end;
        end
        else
        begin
          case iValorBusca of
            0: iValor := 1;
            1: iValor := 2;
            2: iValor := 3;
            3: iValor := 31;
            4: iValor := 4;
            5: iValor := 5;
          end;
        end;
      end;
    end;
  end;
  Result := iValor;
end;


function TCtrlIntBanco.MontaPagamentoEletronico(iIndiceArquivo, iUltCodArquivoGerado: Integer;
    OvDados: OleVariant; sPathRemessa: string): Boolean;
var iContArq: Integer;
  portforma: string;

  function MontaNomeArquiv(sPathRemessa, sInicial, sExtensao: string; bContNumerico: Boolean): string;
  var
    iCont: Integer;
  begin
    iCont := 1;

    if bContNumerico then
      Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iCont), 2) + '.' + sExtensao
    else
      Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(64 + iCont) + '.' + sExtensao;

    while FileExists(Result) do
    begin
      Inc(iCont);

      if bContNumerico then
        Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + ZD(IntToStr(iCont), 2) + '.' + sExtensao
      else
        Result := sPathRemessa + sInicial + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(64 + iCont) + '.' + sExtensao;
    end;
  end;
begin
  FIndiceDoBanco := iIndiceArquivo;

  CheckPath(sPathRemessa);

  with IntBancoManager do
  begin
    bExibeArquivoGerado := fExibeArquivoGerado;

    try
      if FDataPagamento <> '' then DataPagamento := FDataPagamento;

      bArquivoCriado := False;
      Result := bArquivoCriado;

      if not DirectoryExists(sPathRemessa) then
      begin
        Application.MessageBox(PChar('O Diretório indicado como padrão para este ' + (#13 + #10) +
          'Modelo de Pagamento Eletrônico, não existe.'), 'Cobrança Eletrônica', MB_ICONINFORMATION);
        Exit;
      end;

      iContArq := 0;

      case iIndiceArquivo of
        1, 3:
          SNomeArquivo := sPathRemessa;
        6, 7, 8, 9, 10, 11, 12, 16:
          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'CW', 'REM', True);
        2:
          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'REAL', 'REM', True);
        5:
          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'BBRCC', 'DAT', True);
        18:
          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'BBRDOC', 'DAT', True);
        19:
          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'BBRTRANSF', 'DAT', True);
        21:
          SNomeArquivo := MontaNomeArquiv(sPathRemessa, 'RPEN', 'BRR', True);
      else
      begin
        SNomeArquivo := sPathRemessa + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.PAG';
        while FileExists(SNomeArquivo) do
        begin
          Inc(iContArq);
          SNomeArquivo := sPathRemessa + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.PAG';
        end;
      end;
    end;

    CdsTexto.Data := OvDados;
    CdsEmpresa.Data := GetDataPacket(_sSQLEmpresa);

    CodArquivoRemessa := IntToStr(iUltCodArquivoGerado + 1);

    portforma := CdsTexto.fieldbyname('codportforma').asstring;

    case iIndiceArquivo of
      0: Sispag := TSispag.Create;
      1, 2, 3, 4, 5, 13, 14, 15, 19, 20, 22, 23, 24, 25: PagDiversos := TPagDiversos.Create;
      6, 7, 8, 9, 10, 11, 12, 16: PagUnibanco := TPagUnibanco.Create;
    end;

    case iIndiceArquivo of
      0: Sispag.MontaSispagItau;
      1: PagDiversos.MontaPagFornReal;
      2: PagDiversos.MontaFolhaPagReal;
      3: PagDiversos.MontaFolhaPagBradesco;
      4: PagDiversos.MontaPagForneBradesco;
      5: PagDiversos.MontaPagBancoDoBrasil;
      6, 7, 8, 9, 10, 11, 12: PagUnibanco.MontaPagtoUnibanco(iIndiceArquivo);
      13: PagDiversos.MontaPagCEF;
      14: PagDiversos.MontaPagMeridional;
      15: PagDiversos.MontaPagBanespa;
      16: PagUnibanco.MontaPagtoUnibanco(1);
      17:
      begin
        PagHsbc := TPagHsbc.Create;
        PagHsbc.PagamentosHsbc;
        PagHsbc.Free;
      end;
      18:
      begin
        PagBB := TPagBB.Create;
        PagBB.PagamentosBB;
        PagBB.Free;
      end;
      19: PagDiversos.TransfBB;
      20: PagDiversos.MontaPagForBoston;
      21:
      // início - tavares 16/07/2003 - pendência 14332
      begin
        PagBanriSul := TPagBanriSul.Create;
        PagBanriSul.GeraArquivoBanrisul;
        PagBanriSul.Free;
      end;
      22: PagDiversos.MontaLancamentoCCBanrisul;
      23: PagDiversos.MontaPagamentoBBV;
      24: PagDiversos.MontaPagamentoFornecedorSantander;
      25: PagDiversos.MontaFolhaPagamentoACCCARD;
      26:
      begin
        PagSantander := TPagSantander.Create;
        PagSantander.PagamentosSantander;
        PagSantander.Free;
      end;

    end;
    Atualizaportforma(CodArquivoRemessa, portforma);
  finally

      case iIndiceArquivo of
        0: Sispag.Free;
        1, 2, 3, 4, 5, 13, 14, 15, 19, 20: PagDiversos.Free;
        6, 7, 8, 9, 10, 11, 12, 16: PagUnibanco.Free;
      end;

      Result := bArquivoCriado;

      FNomeArquivoGerado := NomeArquivoIntBanco;
    end;
  end;
end;

function TCtrlIntBanco.BaixadeSispagAutomatica(IndiceBanco: Integer; sNomeArquivoRetorno, sRazaoSocial: string): TStrings;
begin
  with IntBancoManager do
  begin
    SNomeArquivo := sNomeArquivoRetorno;
    Result := nil;
    try
      AssignFile(ArquivoTexto, SNomeArquivo);
      Reset(ArquivoTexto);
      CloseFile(ArquivoTexto);
    except
      Application.MessageBox(PChar('Erro ao abrir o Arquivo ' + SNomeArquivo), 'Aviso', MB_ICONINFORMATION);
      Exit;
    end;
    
    FIndiceDoBanco := IndiceBanco;

    try
      RetornoSispag := TRetornoSispag.Create;
      
      case IndiceBanco of
        0:  Result := RetornoSispag.RetornoSispagItau;
        1:  Result := RetornoSispag.RetornoPagReal;
        4:  Result := RetornoSispag.RetornoSispagPagForBradesco;
        17: Result := RetornoSispag.RetornoSISPagHsbc;
        18: Result := RetornoSispag.RetornoSISPagBB; //MARIA
        23: Result := RetornoSispag.RetornoPagForBBV;
        24: Result := RetornoSispag.RetornoPagForSANTANDER;
      else
        Application.MessageBox('Modelo de Arquivo de Retorno Pagamento não implementado', 'Cobrança Eletrônica', MB_ICONINFORMATION);
        Result := nil;
      end;
      RetornoSispag.Free;
    except
      RetornoSispag.Free;
      raise;
    end;

    
    
  end;
end;

function TCtrlIntBanco.ValidaCodBarrasSispag(sCodBarras: string; idv: Integer): Boolean;
var
  sTipoCodigo, sAuxCodBarras, sProd          : string;
  X, iBase, iDividendo, iDigito, I, Z, isprod: Integer;
  iCdigito                                   : array[0..3] of Integer;
begin
  Result := False;
  sTipoCodigo := '';
  case idv of
    10: //Composição da represantação numérica do código de barras - parte superior da ficha de compensação
    begin
      sTipoCodigo := 'Superior';
      //Cálculo do DV Módulo 10 base 2
      if Length(sCodBarras) >= 33 then
      begin
        //Cálculo do DV do Campo 1
        iBase := 2;
        iDividendo := 0;
        I := 9;
        sAuxCodBarras := Copy(sCodBarras, 1, 9);
        for X := 1 to 9 do
        begin
          isprod := 0;

          sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

          for Z := 1 to Length(sProd) do
            isprod := isprod + StrToInt(sProd[Z]);

          iDividendo := iDividendo + isprod;
          if iBase = 2 then
            iBase := 1
          else
            Inc(iBase);
          dec(I)
        end;
        iCdigito[0] := 10 - (iDividendo mod 10);

        //Cálculo do DV do Campo 2
        iBase := 2;
        iDividendo := 0;
        I := 10;
        sAuxCodBarras := Copy(sCodBarras, 11, 10);
        for X := 1 to 10 do
        begin
          isprod := 0;

          sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

          for Z := 1 to Length(sProd) do
            isprod := isprod + StrToInt(sProd[Z]);

          iDividendo := iDividendo + isprod;
          if iBase = 2 then
            iBase := 1
          else
            Inc(iBase);
          dec(I)
        end;
        iCdigito[1] := 10 - (iDividendo mod 10);

        //Cálculo do DV do Campo 3
        iBase := 2;
        iDividendo := 0;
        I := 10;
        sAuxCodBarras := Copy(sCodBarras, 22, 10);
        for X := 1 to 10 do
        begin
          isprod := 0;

          sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

          for Z := 1 to Length(sProd) do
            isprod := isprod + StrToInt(sProd[Z]);

          iDividendo := iDividendo + isprod;
          if iBase = 2 then
            iBase := 1
          else
            Inc(iBase);
          dec(I)
        end;
        iCdigito[2] := 10 - (iDividendo mod 10);

        //-------------------------------------------------------

        for X := 0 to 2 do
          if iCdigito[X] = 10 then iCdigito[X] := 0;


        Result := ((iCdigito[0] = StrToInt(sCodBarras[10])) and
          (iCdigito[1] = StrToInt(sCodBarras[21])) and
          (iCdigito[2] = StrToInt(sCodBarras[32])));
        {AND (iCDigito[3] = StrToInt(sCodBarras[33])));}
      end;
    end;

    11: //Composição do código de barras - parte inferior da ficha de compensação
    begin
      sTipoCodigo := 'Inferior';
      //Cálculo do DV Módulo 11 base 9
      if Length(sCodBarras) >= 40 then
      begin
        iBase := 2;
        iDividendo := 0;
        sAuxCodBarras := Copy(sCodBarras, 1, 4) + Copy(sCodBarras, 6, 39);
        for X := 1 to 43 do
        begin
          iDividendo := iDividendo + (StrToInt(sAuxCodBarras[44 - X]) * iBase);
          if iBase = 9 then
            iBase := 2
          else
            Inc(iBase);
        end;
        iDigito := 11 - (iDividendo mod 11);

        if iDigito in [10, 11] then iDigito := 1;

        Result := (iDigito = StrToInt(sCodBarras[5]));
      end;
    end;
  end;

  if not Result then MsgAviso('Código de Barras ' + sTipoCodigo + ' Incorreto', 'Aviso');
end;

function TCtrlIntBanco.ObrigaTipoPagto(iBanco: Integer): Boolean;
begin
  Result := (iBanco in [0, 1, 4, 17, 18, 21, 23]);
end;

function TCtrlIntBanco.ObrigaFormaPagto(iBanco: Integer): Boolean;
begin
  Result := (iBanco in [0, 1, 4, 17, 18, 21, 23, 24]);
end;

function TCtrlIntBanco.ObrigaDadosBancarios(iBanco, iFormaPag: Integer): Boolean;
begin
  Result := False;
  case iBanco of
    0: Result := (not (iFormaPag in [30, 31]));
    1: Result := (iFormaPag in [1, 2, 4]);
    2, 3, 5, 6, 7, 8, 9, 10, 11, 12: Result := True;
    4, 17: Result := (not (iFormaPag in [30, 31]));
    13, 14: Result := True;
  end;
end;

procedure TCtrlIntBanco.MostraFormAlteracao(IndiceBanco: Integer; OvDocumentos: OleVariant;
   sPath, sNumeEmpresaBanco, sOcorrencia: string);
var
  iContArq: Integer;
begin
  with IntBancoManager do
  begin

    if Copy(sPath, Length(sPath), 1) <> '\' then
      sPath := sPath + '\';

    sCodOcorrencia := sOcorrencia;

    FIndiceDoBanco := IndiceBanco;

    if not DirectoryExists(sPath) then
    begin
      Application.MessageBox(PChar('O Diretório indicado como padrão para este ' + (#13 + #10) +
        'Modelo de Cobrança Eletrônica, não existe.'), 'Cobrança Eletrônica', MB_ICONINFORMATION);
      UltNossoNumero := '0';
      UltCodArquivoGerado := '0';
      Exit;
    end;

    iContArq := 0;

    if IndiceBanco = 1 then
      SNomeArquivo := sPath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'
    else
      SNomeArquivo := sPath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';

    while FileExists(SNomeArquivo) do
    begin
      Inc(iContArq);
      if IndiceBanco = 1 then
        SNomeArquivo := sPath + 'CB' + Copy(RemoveBarras(DateToStr(Date)), 1, 4) + Chr(65 + iContArq) + '.REM'
      else
        SNomeArquivo := sPath + RemoveBarras(DateToStr(Date)) + Chr(65 + iContArq) + '.REM';
    end;
    
    CdsTexto.Data := OvDocumentos;
    CdsEmpresa.Data := GetDataPacket(_sSQLEmpresa);

    NumeEmpresaBanco := sNumeEmpresaBanco;

    bExibeArquivoGerado := fExibeArquivoGerado;
    case IndiceBanco of
      0: if not ChamaForm(TFrmAlteraRemessItauMT, FrmAlteraRemessItauMT) then
        raise TCobrancaEletronicaError.Create('Alteração de renessa Itaú cancelada');
    else
      Application.MessageBox('A alteração para este Modelo de Cobrança Não foi Implementado', 'Cobrança Eletrônica', MB_ICONINFORMATION);
    end;
  end;
end;

function TCtrlIntBanco.EncheListaOcorrencia(iIndiceBanco: Integer): TStrings;
var
  ListaAux: TStrings;
begin
  ListaAux := TStringList.Create;

  case iIndiceBanco of
    0:
    begin
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
    end;
  end;
  Result := ListaAux;
end;

function TCtrlIntBanco.VerificaCamposParaAlteracao(iIndiceBanco, iOcorrencia: Integer): string;
begin
  case iIndiceBanco of
    0:
    begin
      case iOcorrencia of
        31: Result := '-1';
        37, 6: Result := '4,5';
        4, 5: Result := '5,15';
        2, 9, 20, 28, 34, 36, 47: Result := '5';
        7, 8: Result := '5,20';
      else
        Result := '-1'
      end;
    end;
  else
    Result := '-1';
  end;
end;

function TCtrlIntBanco.ValidaRemessa(sRecPag: Char; Const OvDocumentos: OleVariant; bValidaCodBarras: Boolean): Boolean;
var
  X, iContArq, iOldPortForma: Integer;
  ListErro: TStrings;
  ArqLoqErro: TextFile;
  sMensagemDoc, SNomeArquivo, sMensagem, sMensagemBanco, sMensagemBarras: string;
  bVerificaBanco, bVerificaBarras: Boolean;
begin

  Result := False;
  ListErro := TStringList.Create;
  CalculaDv := TCalcDv.Create;

  IntBancoManager.CdsTexto.Data := OvDocumentos;

  with IntBancoManager.CdsTexto do
  begin
    try
      case sRecPag of
        'P', 'p':
        begin

          if not frmAguarde.Visible then
          begin
            frmAguarde.Min := 0;
            frmAguarde.MAX := 100;
            frmAguarde.Pos := 0;
            frmAguarde.Mostra('Verficando Documentos');
          end;

          if IsEmpty then Exit;

          frmAguarde.Pos := 20;
          First;

          iOldPortForma := 0;

          while not EOF do
          begin
            bVerificaBarras := False;
            sMensagemBarras := '';

            if bValidaCodBarras then
            begin
              if (iOldPortForma <> fieldbyname('CODPORTFORMA').AsInteger) then
              begin
                _Cds.Data := GetDataPacket('SELECT CODPORTFORMA FROM PORTADORFORMA WHERE ' +
                  '(CODPORTFORMA = ' + fieldbyname('CODPORTFORMA').asstring + ') AND ' +
                  '((CODFORMAPAGTO IN (' + fCodigosBarra + ')) Or (CODARQUIVOREMESSA IN (' + fModeloCodigoBarra + ')))');

                bVerificaBarras := Not _Cds.IsEmpty;
                _Cds.CLOSE;
              end;

              iOldPortForma := fieldbyname('CODPORTFORMA').AsInteger;

              if bVerificaBarras then
              begin
                if fieldbyname('CODBARRA').IsNull and
                  fieldbyname('CODBARRAVALOR').IsNull then
                  sMensagemBarras := '>>> O Modelo de arquivo obriga a indicação do código de barras, que não foi informado para este documento'
              end;

            end;

            bVerificaBanco := ObrigaDadosBancarios(FIndiceDoBanco, fieldbyname('CODFORMAPAGTO').AsInteger);

            if bVerificaBanco then
            begin
              fieldbyname('CONTACORRENTE').Tag := 9;
              fieldbyname('CODBANCOFAVORECIDO').Tag := 9;
              fieldbyname('NUMAGENCIA').Tag := 9;
            end
            else
            begin
              fieldbyname('CONTACORRENTE').Tag := 0;
              fieldbyname('CODBANCOFAVORECIDO').Tag := 0;
              fieldbyname('NUMAGENCIA').Tag := 0;
            end;

            if (not fieldbyname('FLGEMITEAVISO').IsNull) and
              (fieldbyname('FLGEMITEAVISO').asstring <> '0') then
            begin
              fieldbyname('LOGRADOURO').Tag := 9;
              fieldbyname('CIDADE').Tag := 9;
              fieldbyname('CODESTADO').Tag := 9;
              fieldbyname('CEP').Tag := 9;
              fieldbyname('BAIRRO').Tag := 9;
            end
            else
            begin
              fieldbyname('LOGRADOURO').Tag := 0;
              fieldbyname('CIDADE').Tag := 0;
              fieldbyname('CODESTADO').Tag := 0;
              fieldbyname('CEP').Tag := 0;
              fieldbyname('BAIRRO').Tag := 0;
            end;

            sMensagemBanco := '';
            sMensagemDoc := '';

            if bVerificaBanco then
            begin
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

              if FIndiceDoBanco = 1 then
              begin
                if ((Trim(fieldbyname('CODBANCOFAVORECIDO').asstring) = '275') or (Trim(fieldbyname('CODBANCOFAVORECIDO').asstring) = '356')) and
                  (Trim(fieldbyname('CODFORMAPAGTO').asstring) = '4') then
                  sMensagemDoc := 'Não é possível enviar DOC para contas Banco REAL';

                if (( (Trim(fieldbyname('CODBANCOFAVORECIDO').AsString) <> '275') and (Trim(fieldbyname('CODBANCOFAVORECIDO').AsString) <> '356')) and
                   (Trim(fieldbyname('CODFORMAPAGTO').asstring) = '2')) then
                  sMensagemDoc := 'Não é possível enviar arquivo e fazer crédito em conta para bancos diferentes do Banco REAL';
              end;
            end;

            sMensagem := '';

            for X := 0 to FieldCount - 1 do
              if Fields[X].Tag = 9 then
                if Fields[X].IsNull then sMensagem := sMensagem + Fields
                  [X].DisplayLabel + ', ';

            frmAguarde.Pos := 45;

            if (sMensagem <> '') or
              (sMensagemBanco <> '') or
              (sMensagemBarras <> '') or
              (sMensagemDoc <> '') then
            begin
              ListErro.Add('Nome Fornecedor\Favorecido: ' + fieldbyname('Nome').asstring);
              ListErro.Add('Documento Nº: ' + fieldbyname('NoDocumento').asstring + '-' + fieldbyname('ComplDocumento').asstring);

              if (sMensagemBanco <> '') then
                ListErro.Add(sMensagemBanco);

              if (sMensagemBarras <> '') then
                ListErro.Add(sMensagemBarras);

              if (sMensagemDoc <> '') then
                ListErro.Add(sMensagemDoc);

              if (sMensagem <> '') then
              begin
                ListErro.Add('Campos não preenchidos para este Fornecedor: ');
                ListErro.Add(Copy(sMensagem, 1, Length(sMensagem) - 2));
              end;

              ListErro.Add('_');
              ListErro.Add('');
            end;

            Next;
          end;

          frmAguarde.Pos := 55;

          if ListErro.Text = '' then
            Result := True
          else
          begin
            iContArq := 0;

            frmAguarde.Pos := 60;

            SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroSISPAG' + IntToStr(iContArq) + '.Txt';

            frmAguarde.Pos := 65;

            while FileExists(SNomeArquivo) do
            begin
              Inc(iContArq);
              SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroSISPAG' + IntToStr(iContArq) + '.Txt';
            end;

            frmAguarde.Pos := 75;

            AssignFile(ArqLoqErro, SNomeArquivo);

            if FileExists(SNomeArquivo) then
              Reset(ArqLoqErro)
            else
              ReWrite(ArqLoqErro);

            frmAguarde.Pos := 80;

            WriteLn(ArqLoqErro, '------------------------------------------------------------------------------');
            WriteLn(ArqLoqErro, 'Erros Encontrados na preparação do Arquivo de Remessa Para Pagamento Automático em  ' + DateToStr(Date) + ' às ' + TimeToStr(Time));
            WriteLn(ArqLoqErro, ' ');

            for X := 0 to ListErro.Count - 1 do
              WriteLn(ArqLoqErro, ListErro[X]);

            frmAguarde.Pos := 85;

            WriteLn(ArqLoqErro, ' ');

            CloseFile(ArqLoqErro);

            frmAguarde.Pos := 95;

            frmAguarde.Pos := 100;

            frmAguarde.Apaga;

            if Application.MessageBox(PChar('Faltam dados para gerar o Arquivo de Remessa Para Pagamento Eletrônico, deseja visualizar o arquivo de Log: ' + SNomeArquivo + '?'), 'Pagamento Eletrônico', MB_ICONQUESTION + MB_YESNO) = ID_YES then
            begin
              CopyFile(PChar(SNomeArquivo), PChar(ExtractFilePath(SNomeArquivo) + 'Visualiza.Txt'), False);
              ShellExecuteFile(ExtractFilePath(SNomeArquivo) + 'Visualiza.Txt', '', '', SW_SHOW);
            end;
          end;
        end;
        'R', 'r':
        begin
          if IsEmpty then Exit;

          First;
          while not EOF do
          begin
            sMensagem := '';
            for X := 0 to FieldCount - 1 do
              if (Fields[X].Tag = 9) and (Fields[X].IsNull) then
                sMensagem := sMensagem + Fields[X].DisplayLabel + ', ';
            
            if sMensagem <> '' then
            begin
              ListErro.Add('Nome Cliente: ' + fieldbyname('Nome').asstring);
              ListErro.Add('Campos não preenchidos para este cliente: ');
              ListErro.Add(Copy(sMensagem, 1, Length(sMensagem) - 2));
            end;
            
            //Verifica ContaBancária
            if FIndiceDoBanco = 12 then
            begin
              IntBancoManager.DtmDadosBancarios.BuscaContaDoc(fieldbyname('CODDOCUMENTO').AsFloat);
              if IntBancoManager.DtmDadosBancarios.ContaBancaria.Numero = '' then
              begin
                if sMensagem = '' then
                begin
                  ListErro.Add('Nome Cliente: ' + fieldbyname('Nome').asstring);
                  ListErro.Add('Campos não preenchidos para este cliente: ');
                end;
                ListErro.Add('Conta Bancária Não Indicada')
              end
              else
                if IntBancoManager.DtmDadosBancarios.ContaBancaria.Banco <> '001' then
                begin
                  if sMensagem = '' then
                  begin
                    ListErro.Add('Nome Cliente: ' + fieldbyname('Nome').asstring);
                    ListErro.Add('Campos não preenchidos para este cliente: ');
                  end;
                  
                  ListErro.Add('Este modelo é exclusivamente para contas do Banco do Brasil');
                end;
            end;

            
            Next;
          end;

          if ListErro.Text = '' then
            Result := True
          else
          begin
            iContArq := 0;

            SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroCobrCM' + IntToStr(iContArq) + '.Txt';
            
            while FileExists(SNomeArquivo) do
            begin
              Inc(iContArq);
              SNomeArquivo := ExtractFilePath(Application.ExeName) + 'LogErroCobrCM' + IntToStr(iContArq) + '.Txt';
            end;
            
            AssignFile(ArqLoqErro, SNomeArquivo);
            if FileExists(SNomeArquivo) then
              Reset(ArqLoqErro)
            else
              ReWrite(ArqLoqErro);
            
            WriteLn(ArqLoqErro, '------------------------------------------------------------------------------');
            WriteLn(ArqLoqErro, 'Erros Encontrados na preparação para impressão de Bloquetos/Cobrança Eletrônica em ' + DateToStr(Date) + ' às ' + TimeToStr(Time));
            WriteLn(ArqLoqErro, ' ');
            
            for X := 0 to ListErro.Count - 1 do
              WriteLn(ArqLoqErro, ListErro[X]);
            
            WriteLn(ArqLoqErro, ' ');
            
            CloseFile(ArqLoqErro);
            
            if Application.MessageBox(PChar('Faltam dados para imprimir os Bloquetos/Gerar Arquivo de Cobrança, deseja visualizar o arquivo de Log: ' + SNomeArquivo + '?'), 'Bloquetos\Cobrança Eletrônica', MB_ICONQUESTION + MB_YESNO) = ID_YES then
              WinExec(PChar('Notepad ' + SNomeArquivo), 1);
          end;
        end;
      else
        MsgAviso('Tipo de remessa inválido', 'Atenção');
      end;
      
      ListErro.Free;
      CalculaDv.Free;
      First;
    except
      ListErro.Free;
      CalculaDv.Free;
      First;
      raise;
    end;
  end;
end;

function TCtrlIntBanco.VerficaDadosEmpresa(sRecPag: Char; iCodPortForma: Integer): Boolean;
var
  sMensagem: string;
begin

  with IntBancoManager.DtmIntBanco.SQLParamIntBanco do
  begin
    Prepare;
    ParamByName('RECPAG').asstring := sRecPag;
    ParamByName('IDMODELOSCNAB').AsInteger := FIndiceDoBanco;
    ParamByName('CODPORTFORMA').AsInteger := iCodPortForma;
    Open;
  end;

  with IntBancoManager.CdsEmpresa do
  begin
    Result := False;
    sMensagem := '';

    case sRecPag of
      'P', 'p':
      begin
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

        if fieldbyname('NOME').IsNull then sMensagem := 'Nome, ';
        if fieldbyname('RAZAOSOCIAL').IsNull then sMensagem := sMensagem + 'Razão Social, ';
        if fieldbyname('CIDADE').IsNull then sMensagem := sMensagem + 'Cidade, ';
        if fieldbyname('CEP').IsNull then sMensagem := sMensagem + 'Cep, ';
        if fieldbyname('CODESTADO').IsNull then sMensagem := sMensagem + 'Estado, ';
        if fieldbyname('NUMDOCUMENTO').IsNull then sMensagem := sMensagem + 'Numero do Documento, ';
        if fieldbyname('LOGRADOURO').IsNull then sMensagem := sMensagem + 'Nome da Rua\Logradouro, ';
        if fieldbyname('NUMAGENCIA').IsNull then sMensagem := sMensagem + 'Número da agência bancária, ';
        if fieldbyname('NUMCONTA').IsNull then sMensagem := sMensagem + 'Número da Conta Corrente, ';
        if fieldbyname('NOMEBANCO').IsNull then sMensagem := sMensagem + 'Nome do Banco, ';
      end;
      'R', 'r':
      begin
        _sSqlEmpresa := 'SELECT DISTINCT ' +
          '  P.NOME, P.RAZAOSOCIAL, P.TIPO, ' +
          ' (E.LOGRADOURO || '' '' || E.NUMERO || '' '' || E.COMPLEMENTO) AS ENDERECO, ' +
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

        if fieldbyname('NOME').IsNull then sMensagem := 'Nome, ';
        if fieldbyname('RAZAOSOCIAL').IsNull then sMensagem := sMensagem + 'Razão Social, ';
        if fieldbyname('CIDADE').IsNull then sMensagem := sMensagem + 'Cidade, ';
        if fieldbyname('CEP').IsNull then sMensagem := sMensagem + 'Cep, ';
        if fieldbyname('CODESTADO').IsNull then sMensagem := sMensagem + 'Estado, ';
        if fieldbyname('NUMDOCUMENTO').IsNull then sMensagem := sMensagem + 'Numero do Documento, ';
        if fieldbyname('ENDERECO').IsNull then sMensagem := 'Endereço, ';
        if fieldbyname('BAIRRO').IsNull then sMensagem := 'Bairro, ';
      end;
    else
      MsgAviso('Tipo de remessa inválido', 'Atenção');
    end;
    
    sMensagem := Copy(sMensagem, 1, Length(sMensagem) - 2);

    if sMensagem <> '' then
    begin
      MsgAviso('0(s) campo(s): ' + sMensagem + ' da Empresa Proprietária, está(ão) em branco.' +
        (#13 + #10) + 'Impossível gerar arquivo de remessa!', 'Atenção');
      if frmAguarde.Visible then frmAguarde.Apaga;
    end
    else
      Result := True;

    if Active then CLOSE;
  end;
end;

function TCtrlIntBanco.SetParametros(iCodPortForma: Longint; sRecPag: string): Boolean;
var
  frm: TForm;
begin
  IntBancoManager.CodigoPortadorForma := iCodPortForma;

  with IntBancoManager.DtmIntBanco.SQLParamIntBanco do
  begin
    Prepare;
    ParamByName('RECPAG').asstring := sRecPag;
    ParamByName('IDMODELOSCNAB').AsInteger := FIndiceDoBanco;
    ParamByName('CODPORTFORMA').AsInteger := iCodPortForma;
    Open;
  end;

  frm := nil;

  if sRecPag = 'P' then
  begin
    case FIndiceDoBanco of
      2: frm := TFrmParamFolhaPagrealMT.Create(Application); //BANCO REAL FOLHA DE PAGAMENTO
      3: frm := TFrmParamFolhaPagBradescoMT.Create(Application); //BRADESCO FOLHA DE PAGAMENTO
      4: frm := TFrmParamPagForneBradescoMT.Create(Application); //BRADESCO PAGTO FORNECEDORES
      5: frm := TFrmParamPagBBMT.Create(Application); //BANCO DO BRASIL
      6: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO CRÉDITO EM CONTA
      7: frm := TFrmParamUnibancoMT.Create(Application); //UNIBANCO DOC
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
    end;
  end
  else
  begin
    case FIndiceDoBanco of
      2: frm  := TFrmParamCobrancaRegistradaUnibancoMT.Create(Application); //UNIBANCO - Cobrança Registrada
      4: frm  := TFrmParamBarrasBbMT.Create(Application); //BANCO DO BRASIL CÓDIGO DE BARRAS
      9: frm  := TFrmCobrNregHSBCMT.Create(Application); //HSBC
      10: frm := TfrmParamCnabSantanderMT.Create(Application); //
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
    end;
  end;

  if frm = nil then
    Result := True
  else
    with frm do
    begin
      Result := (ShowModal = mrOk);
      Free;
    end;
end;

procedure TCtrlIntBanco.CheckPath(var sPath: string);
begin
  if Trim(sPath) = '' then
    sPath := Sistema.TempDir
  else
  begin
    if Copy(sPath, Length(sPath), 1) <> '\' then
      sPath := sPath + '\';

    if not DirectoryExists(sPath) then ForceDirectories(sPath);
  end;
end;

procedure TCtrlIntBanco.SetValidaDvContaAgencia(const Value: Boolean);
begin
  FValidaDvContaAgencia := Value;
end;

procedure TCtrlIntBanco.SetIdentficaOrigem(const Value: string);
begin
  If trim(value) = '' then
    IntBancoManager.IdentificaOrigem := ' '
  else
    IntBancoManager.IdentificaOrigem := Value;
end;

procedure TCtrlIntBanco.AfterInitialize;
begin
  inherited;
  IntBancoManager.InitializeAs(Self);
end;

function TCtrlIntBanco.GetIdentficaOrigem: string;
begin
  Result := IntBancoManager.IdentificaOrigem;
end;

function TCtrlIntBanco.GetMensagem1: string;
begin
  Result := IntBancoManager.Mensagem1;
end;

function TCtrlIntBanco.GetMensagem2: string;
begin
  Result := IntBancoManager.Mensagem2;
end;

function TCtrlIntBanco.GetMensagem3: string;
begin
  Result := IntBancoManager.Mensagem3;
end;

function TCtrlIntBanco.GetMensagem4: string;
begin
  Result := IntBancoManager.Mensagem4;
end;

function TCtrlIntBanco.GetMensagem5: string;
begin
  Result := IntBancoManager.Mensagem5;
end;

function TCtrlIntBanco.GetMensagem6: string;
begin
  Result := IntBancoManager.Mensagem6;
end;

function TCtrlIntBanco.GetMensagem7: string;
begin
  Result := IntBancoManager.Mensagem7;
end;

function TCtrlIntBanco.GetMensagem8: string;
begin
  Result := IntBancoManager.Mensagem8;
end;

function TCtrlIntBanco.GetNaoGerarArquivo: Boolean;
begin
  Result := fnaogerararquivo;
end;

procedure TCtrlIntBanco.SetMensagem1(const Value: string);
begin
  IntBancoManager.Mensagem1 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem2(const Value: string);
begin
  IntBancoManager.Mensagem2 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem3(const Value: string);
begin
  IntBancoManager.Mensagem3 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem4(const Value: string);
begin
  IntBancoManager.Mensagem4 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem5(const Value: string);
begin
  IntBancoManager.Mensagem5 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem6(const Value: string);
begin
  IntBancoManager.Mensagem6 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem7(const Value: string);
begin
  IntBancoManager.Mensagem7 := Trim(Value);
end;

procedure TCtrlIntBanco.SetMensagem8(const Value: string);
begin
  IntBancoManager.Mensagem8 := Trim(Value);
end;

function TCtrlIntBanco.GetAtualizaDoc: Boolean;
begin
  Result := IntBancoManager.bAtualizadoc;
end;

end.
