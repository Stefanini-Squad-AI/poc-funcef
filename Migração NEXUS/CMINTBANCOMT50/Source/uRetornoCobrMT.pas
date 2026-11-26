{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
 Atender............: 18980
 Data da Alteração..: 30/05/2025
 Responsável........: Luis Ferrari
 Descrição..........: Ajustado arquivo log para vir o numero do documento e mais o grupo cnab na RetornoCobr.
--------------------------------------------------------------------------------
 
 N. SIG.............: 119748
 Data da Alteração..: 03/11/2021
 Responsável........: Ewerton Beltramini
 Descrição..........: Remanejando o Indice Banco 61 para seguir o mesmo fluxo do 62.
--------------------------------------------------------------------------------
 N. SIG.............: 103323
 Data da Alteração..: 07/12/2020
 Responsável........: Everson Cunha
 Descrição..........: Implementação do Modelo:
                                        BANCO CEF - SIACC - DEB - SEM FINANCEIRO
--------------------------------------------------------------------------------
 N. SIG.............: 103935
 Data da Alteração..: 09/11/2020
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/Ajustes SIACC
--------------------------------------------------------------------------------
 Rotina.............: RetornoCobr
 N. SIG.............: 102967
 Data da Alteração..: 08/10/2020
 Responsável........: Cássio Florencio Rovaroto
 Descrição..........: Correção no trartamento de leitura de arquivo de retorno
                      SIACC 150.
--------------------------------------------------------------------------------
 Rotina                : RetornoCobr
 N. Sig..........      : 102320
 Data da Alteração:    : 30/09/2020
 Responsável:          : Cássio Florencio Rovaroto
 Descrição.......      : Adequação na leitura de arquivos no formato SIACC 150
--------------------------------------------------------------------------------
 Rotina                : RetornoCobr
 N. Sig..........      : 51379
 Data da Alteração:    : 23/08/2017
 Responsável:          : Osni Cavalcante
 Descrição.......      : Correção na rotina de baixa dos arquivos para não
                         processar baixas com código de Movimento de retorno
                         diferente de 06 ("Liquidação")
--------------------------------------------------------------------------------
 Rotina                : RetornoCobr
 N. Sol..........      : 214738_15892
 N. Kintana......      : 2057238
 Data da Alteração:    : 19/03/2014
 Alteração Form:       : FBaixaIntBancoMT
 Responsável:          : Paulo  Nobre
 Descrição.......      : Inclusão do Parametro p/ indicar se visualiza o Log
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TRetornoCobranca: Processamento do Retorno para os  }
{   seguinte arquivos de remessa:                       }
{     0/R Itaú                                          }
{     1/R Bradesco                                      }
{     2/R Unibano                                       }
{     4/R Banco do Brasil                               }
{     6/R Bcn                                           }
{     7/R Banco do Brasil Remessa - 240 Posições        }
{     9/R HSBC >>>>> Argh: Foi Ela !!!!!!!!!            }
{     10/R SANTANDER  >>>>> Argh: Foi Ela !!!!!!!!!     }
{     12/P BANCO DO BRASIL S/A                          }
{     13/R BANCO REAL                                   }
{     14/R CAIXA ECONOMICA DEBITO AUTOMÁTICO            }
{     16/R BICBANCO REMESSA                             }
{     17/R COBRANÇA REGISTRADA BANCO SAFRA              }
{     18/R COBRANÇA ESCRITURAL BANCO DE BOSTON          }
{     19/R BANCO CIDADE                                 }
{     20/R HSBC Cobrança Resgistrada                    }
{     21/R BANRISUL - Cobrança Eletrônica               }
{     22/R BBV - Cobrança Eletrônica                    }
{     23/R UNIBANCO - COBRANÇA SEM REGISTRO             }
{     50/R CEF - CONVÊRNIO SICOV                        }
{     52/R Banco REAL     - Cnab 240                    }
{     53/R Banco Unibanco - Cnab 240                    }
{     54/R Banco Bradesco - Cnab 240                    }
{     58/R Banco BESC                                   }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/06/2001                             }
{                01/10/2001 - Fábio Barros              }
{                16/10/2001 - Fábio Barros              }
{                22/11/2001 - Fábio Barros              }
{                23/11/2001 - Fábio Barros              }
{                01/12/2001 - Fábio Barros              }
{                02/12/2001 - Fábio Barros              }
{                25/07/2003 - André Tavares             }
{                26/04/2004 - André Tavares             }
{                15/04/2005 - André Tavares - pendência 19024 }
{                30/09/2005 - André Tavares - implementação banespa cnab240 coranca - pendência 20286 }
{                11/01/2006 - andre tavares - pendência 21229 - ajuste na captção do campo "nosso número"
{                05/12/2006 - andre tavares - pendência 23868 - 05/12/2006 - se encontrou outro header no mesmo arquivo então continua lendo.
{                06/12/2006 - andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
{                12/06/2007 - Antonio Marcos(amf) - pendencia 24978 Retorno Cobrança BESC
{*******************************************************}


Unit uRetornoCobrMT;

Interface

Uses classes, SysUtils, Forms, Db;

Type
   TRetornoCobranca = Class
   Private
      {Controle de linha a ser processada: A primeira linha do retorno contem informações da empresa e não dos documentos}
      PrimeiraLinha: Boolean;
      {Linha ser processada}
      sLinha: String;
      {Indice para a descrição do erro no processamento}
      iLogErro: Integer;
      {Lista com os dados interpretados do arquivo de retorno}
      ListaRetorno: TStrings;
      {Número do bando a ser processado}
      iNumBanco: Integer;
      {Formata string processada ( lida do arquivo de retorno ) de acordo com o tipo de dado da coluna}
      Function FormataString(sString, sMascara: String): String;
      {Adiciona os campos pertinendtes para baixa na lista para processamento no financeiro}
      Procedure EncheListaRetorno(sNum, siCarteira, siOcorrencia, sdDataOcorencia, sDocumento, sdVencimento,
         // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa, COLOQUEI O CAMPO sCodLiqBaixa
         srAbatimento, srDescontos, srCredito, srMora, siErro, srValorNominal, sCodLiqBaixa, sCodFormaPagBanco, sFloatBaixa: String);
      {Busca descrição do erro de acordo com o processamento e retorna na Lista de Retorno}
      Procedure DescreveErro;
   Public
      {Processa o arquivo de retorn e retorna uma lista com o resultado do processamento}
      Function RetornoCobr(iIndiceBanco: Integer; pApresentaVisulaizacao: String): TStrings;
   End;

Var
   RetornoCobranca: TRetornoCobranca;

Implementation

Uses uString, uIntBancoManager, uCmFileUtils;

Function TRetornoCobranca.FormataString(sString, sMascara: String): String;
Begin
   If sMascara = 'D' Then
      Begin
         Try
            Case iNumBanco Of
               12, 13, 14:
                  Result := DateToStr(DevolveBarras2(sString))
            Else
               Result := DateToStr(DevolveBarras(sString)); // Data Da Ocorrência
            End;
         Except
            Result := DateToStr(Date);
         End;
      End
   Else
      If sMascara = 'N' Then
         Begin
            Try
               Result := FloatToStr(DevolveVirgulas(sString, 2)); // Valor Nominal
            Except
               Result := '0';
            End;
         End
      Else
         Result := sString;
End;

                  // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
Function TRetornoCobranca.RetornoCobr(iIndiceBanco: Integer; pApresentaVisulaizacao: String): TStrings;
Var
   sCampo, sDescCampo, sMascara: Array[0..15] Of String; // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
   iColuna, iTam: Array[0..15] Of Integer; // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
   sDesc: String;
   X: Integer;
   CobrancaPadrao: Boolean;
   // Alex 07/12/05
   sCodOcorr: String;
   iConvenio: integer;
   iPosIni, iPosFim: Integer;
Begin
   CobrancaPadrao := False;
   iNumBanco := iIndiceBanco;

   sCampo[0] := ''; sDescCampo[0] := 'Nome da Empresa: ........... '; sMascara[0] := 'C';
   sCampo[1] := ''; sDescCampo[1] := 'Nosso Número: .............. '; sMascara[1] := 'C';
   sCampo[2] := ''; sDescCampo[2] := 'Carteira: .................. '; sMascara[2] := 'C';
   sCampo[3] := ''; sDescCampo[3] := 'Cod Ocorrência: ............ '; sMascara[3] := 'C';
   sCampo[4] := ''; sDescCampo[4] := 'Data Da Ocorrência: ........ '; sMascara[4] := 'D';
   sCampo[5] := ''; sDescCampo[5] := 'Código Do Documento: ....... '; sMascara[5] := 'C';
   sCampo[6] := ''; sDescCampo[6] := 'Data Vencimento: ........... '; sMascara[6] := 'D';
   sCampo[7] := ''; sDescCampo[7] := 'Valor Nominal do Título:.... '; sMascara[7] := 'N';
   sCampo[8] := ''; sDescCampo[8] := 'Valor Abatimento: .......... '; sMascara[8] := 'N';
   sCampo[9] := ''; sDescCampo[9] := 'Valor Descontos: ........... '; sMascara[9] := 'N';
   sCampo[10] := ''; sDescCampo[10] := 'Juros de Mora: ............. '; sMascara[10] := 'N';
   sCampo[11] := ''; sDescCampo[11] := 'Valor do Crédito em Conta: . '; sMascara[11] := 'N';
   sCampo[12] := ''; sDescCampo[12] := 'Código de Erro: ............ '; sMascara[12] := 'C';
   // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
   sCampo[13] := ''; sDescCampo[13] := 'Código de Liq./Baixa: ...... '; sMascara[13] := 'C';
   // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
   sCampo[14] := ''; sDescCampo[14] := 'Código da Forma Pag.: ...... '; sMascara[14] := 'C';
   // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
   sCampo[15] := ''; sDescCampo[15] := 'Float: ..................... '; sMascara[15] := 'C';

   Case iIndiceBanco Of
      0: //Itaú
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 86; iTam[1] := 9; //Nosso Número
            iColuna[2] := 83; iTam[2] := 3; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal do Título
            iColuna[8] := 228; iTam[8] := 13; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := 378; iTam[12] := 8; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float

         End;
      1: //Bradesco
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 71; iTam[1] := 12; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal do Título
            iColuna[8] := 228; iTam[8] := 13; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := 109; iTam[12] := 2; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      2: //UNIBANCO - Cobrança Registrada - Fábio Barros - 02/12/2001
         Begin
            iColuna[0] := 347; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 117; iTam[1] := 10; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      4: //Banco do Brasil - Codigo de Barras
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 63; iTam[1] := 12; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 81; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 127; iTam[5] := 20; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal do Título
            iColuna[8] := 228; iTam[8] := 13; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 306; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      6: //Bcn
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 75; iTam[1] := 8; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal do Título
            iColuna[8] := 228; iTam[8] := 13; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      7: //BB - Cobrança Eletrônica(240 posições) e Banco Real Cnab 240
         Begin
            CobrancaPadrao := True;
            iColuna[0] := 73; iTam[0] := 30; //Nome da Empresa
            //     iColuna[1]  := 38;  iTam[1]  := 20;  //Nosso Número
            iColuna[1] := 59; iTam[1] := 15; //Nosso Número // andré tavares - estava pegando o numero errado - fazendo teste na valia
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 16; iTam[3] := 2; //Cod Ocorrência

            iColuna[4] := 138; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 106; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 74; iTam[6] := 8; //Data Vencimento

            iColuna[7] := 82; iTam[7] := 15; //Valor Nominal do Título
            iColuna[8] := 48; iTam[8] := 15; //Valor Abatimento
            iColuna[9] := 33; iTam[9] := 15; //Valor Descontos
            iColuna[10] := 18; iTam[10] := 15; //Juros de Mora
            iColuna[11] := 78; iTam[11] := 15; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      // Convenio SICOB
      8: //CEF - Cobrança Eletrônica(240 posições) - convênio sicob
         Begin
            CobrancaPadrao := True;
            iColuna[0] := 73; iTam[0] := 30; // Nome da Empresa
            iColuna[1] := 47; iTam[1] := 11; // Registro T - Nosso Número
            iColuna[2] := -1; iTam[2] := -1; // Carteira
            iColuna[3] := 16; iTam[3] := 2; // Registro T - Cod Ocorrência
            iColuna[4] := 138; iTam[4] := 8; // Registro U - Data Da Ocorrência
            iColuna[5] := 106; iTam[5] := 25; // Registro T - Código Do Documento
            iColuna[6] := 74; iTam[6] := 8; // Registro T - Data Vencimento
            iColuna[7] := 82; iTam[7] := 15; // Registro T - Valor Nominal do Título
            iColuna[8] := 48; iTam[8] := 15; // Registro U - Valor Abatimento
            iColuna[9] := 33; iTam[9] := 15; // Registro U - Valor Descontos
            iColuna[10] := 18; iTam[10] := 15; // Registro U - Juros de Mora
            iColuna[11] := 78; iTam[11] := 15; // Registro U - Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; // Código de Erro
            iColuna[13] := 214; iTam[13] := 2; // Registro T - Código de Liq./Baixa
            iColuna[14] := 216; iTam[14] := 2; // Registro T - Código da forma Pag.
            iColuna[15] := 218; iTam[15] := 1; // Registro U - Float para crédito na conta corrente
         End;

      // Convenio SIGCB
      60: //CEF - Cobrança Eletrônica(240 posições) - convênio sigcb
         Begin
            CobrancaPadrao := True;
            iColuna[0] := 73; iTam[0] := 30; // Nome da Empresa
            iColuna[1] := 40; iTam[1] := 17; // Registro T - Nosso Número - Ok (alterou)
            iColuna[2] := -1; iTam[2] := -1; // Carteira
            iColuna[3] := 16; iTam[3] := 2; // Registro T - Cod Ocorrência - Ok
            iColuna[4] := 138; iTam[4] := 8; // Registro U - Data Da Ocorrência - Ok
            iColuna[5] := 59; iTam[5] := 11; // Registro T - Código Do Documento - Ok (Alterou)
            iColuna[6] := 74; iTam[6] := 8; // Registro T - Data Vencimento - Ok
            iColuna[7] := 82; iTam[7] := 15; // Registro T - Valor Nominal do Título - Ok
            iColuna[8] := 48; iTam[8] := 15; // Registro U - Valor Abatimento - Ok
            iColuna[9] := 33; iTam[9] := 15; // Registro U - Valor Descontos - Ok
            iColuna[10] := 18; iTam[10] := 15; // Registro U - Juros de Mora - Ok
            iColuna[11] := 78; iTam[11] := 15; // Registro U - Valor do Crédito em Conta - Ok
            iColuna[12] := -1; iTam[12] := -1; // Código de Erro
            iColuna[13] := 214; iTam[13] := 2; // Registro T - Código de Liq./Baixa - Ok
            iColuna[14] := 216; iTam[14] := 2; // Registro T - Código da forma Pag. - Ok
            iColuna[15] := 146; iTam[15] := 8; // Registro U - Data de Efetivaçao do Credito - Ok (Alterou)
            sMascara[15] := 'D';
         End;

      55: //banespa cnab240 - pendência 20286
         Begin
            CobrancaPadrao := True;
            iColuna[0] := 73; iTam[0] := 30; //Nome da Empresa
            //início - andre tavares - 11/01/2005 - pendência 21229
            //iColuna[1]  := 47;  iTam[1]  := 10;  //Nosso Número
            iColuna[1] := 38; iTam[1] := 13; //Nosso Número
            //fim - andre tavares - 11/01/2005 - pendência 21229
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 16; iTam[3] := 2; //Cod Ocorrência

            iColuna[4] := 138; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 106; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 74; iTam[6] := 8; //Data Vencimento

            iColuna[7] := 82; iTam[7] := 15; //Valor Nominal do Título
            iColuna[8] := 48; iTam[8] := 15; //Valor Abatimento
            iColuna[9] := 33; iTam[9] := 15; //Valor Descontos
            iColuna[10] := 18; iTam[10] := 15; //Juros de Mora
            iColuna[11] := 78; iTam[11] := 15; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := 214; iTam[13] := 2; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := 216; iTam[14] := 2; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := 218; iTam[15] := 1; //Float para crédito na conta corrente
         End;

      9: //HSBC   //MARIA
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 16; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      10: //SANTANDER //MARIA
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 127; iTam[1] := 8; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal dA PARCELA
            iColuna[8] := 228; iTam[8] := 13; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      11: // Cobrança Registrada BANCO REAL - 10/04/2002
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := 127; iTam[1] := 7; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal dA PARCELA
            iColuna[8] := 228; iTam[8] := 13; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      12, //BANCO DO BRASIL S/A
      13, //BANCO REAL
      14: //CAIXA ECONOMICA DEBITO AUTOMÁTICO
         Begin
            iColuna[0] := 23; iTam[0] := 20; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 68; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 45; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 70; iTam[5] := 60; //Código Do Documento
            iColuna[6] := 45; iTam[6] := 8; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := -1; iTam[9] := -1; //Valor Descontos
            iColuna[10] := -1; iTam[10] := -1; //Juros de Mora
            iColuna[11] := 53; iTam[11] := 15; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      16: //BICBANCO REMESSA - Fábio Barros - 01/10/2001
         Begin
            iColuna[0] := 312; iTam[0] := 40; //Nome da Empresa
            iColuna[1] := 38; iTam[1] := 25; //Nosso Número
            iColuna[2] := 108; iTam[2] := 108; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 117; iTam[5] := 10; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      17: //COBRANÇA REGISTRADA BANCO SAFRA - Fábio Barros - 23/10/2001
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := 63; iTam[1] := 9; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 117; iTam[5] := 10; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal da PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      18: //COBRANÇA ESCRITURAL BANCO DE BOSTON - Fábio Barros - 02/10/2001
         Begin
            iColuna[0] := 308; iTam[0] := 39; //Nome da Empresa
            iColuna[1] := 38; iTam[1] := 25; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 117; iTam[5] := 10; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 228; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := 347; iTam[12] := 2; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      19: //BANCO CIDADE - Fábio Barros - 01/10/2001
         Begin
            iColuna[0] := 308; iTam[0] := 39; //Nome da Empresa
            iColuna[1] := 38; iTam[1] := 25; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 117; iTam[5] := 10; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 228; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := 347; iTam[12] := 2; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      20: //HSBC Cobrança Registrada - Fábio Barros - 16/10/2001
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := 63; iTam[1] := 11; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 228; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      21: //Banrisul - Cobrança Eletrônica - Fábio Barros - 22/11/2001
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;

      22: //BBV - Cobrança Eletrônica - Fábio Barros - 01/12/2001
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;

      23: //UNIBANCO - COBRANÇA SEM REGISTRO
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := 108; iTam[2] := 1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência
            iColuna[5] := 38; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := 267; iTam[10] := 13; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      // inicio - andre tavares - pendência 14349
      50: //CEF - CONVENIO SICOV      //Ewerton Beltramini - 03/11/2021 - Sig 119748 - Retirado o cod 61
         Begin
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 68; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 45; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 2; iTam[5] := 25; //Código Do Documento
            iColuna[6] := -1; iTam[6] := -1; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := -1; iTam[9] := -1; //Valor Descontos
            iColuna[10] := -1; iTam[10] := -1; //Juros de Mora
            iColuna[11] := 53; iTam[11] := 15; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
      // fim - andre tavares - pendência 14349

      // inicio - andre tavares - 26/04/2004 - pendência 16655
      52, //Banco Real Cnab 240

      // Rodolpho da Silva - 19473/19480 - 16/06/2005
      53, 54: //  Unibanco e Bradesco CNAB 240

         Begin
            // início - André Tavares - pendência 19024 - 15/04/2005
            CobrancaPadrao := True;
            iColuna[0] := 73; iTam[0] := 30; //Nome da Empresa
            iColuna[1] := 51; iTam[1] := 7; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 16; iTam[3] := 2; //Cod Ocorrência

            iColuna[4] := 138; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 106; iTam[5] := 25; //Código Do Documento
            iColuna[6] := 74; iTam[6] := 8; //Data Vencimento

            iColuna[7] := 82; iTam[7] := 15; //Valor Nominal do Título
            iColuna[8] := 48; iTam[8] := 15; //Valor Abatimento
            iColuna[9] := 33; iTam[9] := 15; //Valor Descontos
            iColuna[10] := 18; iTam[10] := 15; //Juros de Mora
            iColuna[11] := 78; iTam[11] := 15; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            // fim - André Tavares - pendência 19024 - 15/04/2005
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código da forma de pagamento no banco
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            // andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
            iColuna[15] := 218; iTam[15] := 1; //Float para crédito na conta corrente
         End;
      // fim - andre tavares - 26/04/2004 - pendência 16655

      58: //BESC - pendência 24978 - Arquivo retorno com 400 posições
         Begin
            iColuna[0] := 47; iTam[0] := 30; //Nome da Empresa

            //iColuna[1]  := -1;   iTam[1]   := -1;  //Nosso Número
            //andré tavares - pendência 26864 - 15/01/2008
            iColuna[1] := 38; iTam[1] := 16; //Código Do Documento

            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 109; iTam[3] := 2; //Cod Ocorrência

            iColuna[4] := 111; iTam[4] := 6; //Data Da Ocorrência

            //iColuna[5]  := 38;   iTam[5]   := 16;  //Código Do Documento
            //andré tavares - pendência 26864 - 15/01/2008
            iColuna[5] := -1; iTam[5] := -1; //Código Do Documento

            iColuna[6] := 38; iTam[6] := 6; //Data Vencimento *

            iColuna[7] := 153; iTam[7] := 13; //Valor Nominal do Título
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := 241; iTam[9] := 13; //Valor Descontos
            iColuna[10] := -1; iTam[10] := -1; //Juros de Mora
            iColuna[11] := 254; iTam[11] := 13; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            iColuna[13] := 214; iTam[13] := -1; //Código de Liq./Baixa
            iColuna[14] := 216; iTam[14] := -1; //Código da forma Pag.
            iColuna[15] := 218; iTam[15] := -1; //Float para crédito na conta corrente
         End;

      //pendência 26864 - 15/01/2008 - inclui o modelo 59 do CAR que é o mesmo layout do 58 do CAP, só que usa o débito em conta corrente
      59:
         Begin
            CobrancaPadrao := True;
            iColuna[0] := -1; iTam[0] := -1; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número

            iColuna[2] := -1; iTam[2] := -1; //Carteira

            iColuna[3] := 68; iTam[3] := 2; //Cod Ocorrência *

            iColuna[4] := 138; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 2; iTam[5] := 25; //Código Do Documento

            iColuna[6] := 147; iTam[6] := 6; //Data Vencimento

            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal do Título
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := -1; iTam[9] := -1; //Valor Descontos
            iColuna[10] := -1; iTam[10] := -1; //Juros de Mora

            iColuna[11] := 53; iTam[11] := 15; //Valor do Débito em Conta *

            iColuna[12] := -1; iTam[12] := -1; //Código de Erro

            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            iColuna[15] := -1; iTam[15] := -1; //Float para crédito na conta corrente
         End;

         //Everson Cunha - SIACC - SIG 103935 - Ini
         61, 62, 63: //CEF - CONVENIO SIACC 150 (Com e SEM financeiro) //Everson Cunha - SIG103323 - Inluído o modelo 63 //Ewerton Beltramini - 03/11/2021 - Sig 119748 - Acrescentado o cod 61
         Begin
            iColuna[0] := 23; iTam[0] := 20; //Nome da Empresa
            iColuna[1] := -1; iTam[1] := -1; //Nosso Número
            iColuna[2] := -1; iTam[2] := -1; //Carteira
            iColuna[3] := 68; iTam[3] := 2; //Cod Ocorrência
            iColuna[4] := 45; iTam[4] := 8; //Data Da Ocorrência
            iColuna[5] := 82; iTam[5] := 10; //Código Do Documento
            iColuna[6] := -1; iTam[6] := -1; //Data Vencimento
            iColuna[7] := -1; iTam[7] := -1; //Valor Nominal dA PARCELA
            iColuna[8] := -1; iTam[8] := -1; //Valor Abatimento
            iColuna[9] := -1; iTam[9] := -1; //Valor Descontos
            iColuna[10] := -1; iTam[10] := -1; //Juros de Mora
            iColuna[11] := 53; iTam[11] := 15; //Valor do Crédito em Conta
            iColuna[12] := -1; iTam[12] := -1; //Código de Erro
            iColuna[13] := -1; iTam[13] := -1; //Código de Liq./Baixa
            iColuna[14] := -1; iTam[14] := -1; //Código da forma Pag.
            iColuna[15] := -1; iTam[15] := -1; //Float
         End;
         //Everson Cunha - SIACC - SIG103935 - Fim
   Else
      Result := Nil;
      Exit;
   End;

   Try
      ListaRetorno := TStringList.Create;
      //Cria Arquivo de Log
      AssignFile(IntBancoManager.ArquivoLog, Copy(IntBancoManager.sNomeArquivo, 1, Pos('.', IntBancoManager.sNomeArquivo)) + 'LOG');
      ReWrite(IntBancoManager.ArquivoLog);
      WriteLn(IntBancoManager.ArquivoLog, 'Nome Arquivo de Retorno: ' + IntBancoManager.sNomeArquivo);
      //Abre Arquivo de Retorno

      AssignFile(IntBancoManager.ArquivoTexto, IntBancoManager.sNomeArquivo);
      Reset(IntBancoManager.ArquivoTexto);

      PrimeiraLinha := True;

      { ------------------------------------------------------------------------------
        Cobrança Padrão informa se o modelo selecionado é o de 240 posições ou não
        Se TRUE, é de 240 posições
        ----------------------------------------------------------------------------- }
           // Alex 07/12/2005 -- guarda o código de ocorrência para fazer a query apenas uma vez a cada mudança
      sCodOcorr := '';
      if CobrancaPadrao then
      begin
        while Not Eof(IntBancoManager.ArquivoTexto) Do
        begin
          // Lê cabeçalho do retorno para comparar com empresa proprietária logada
          if PrimeiraLinha then
          begin
            ReadLn(IntBancoManager.ArquivoTexto, sLinha);
            sCampo[0] := Copy(sLinha, iColuna[0], iTam[0]);
            //            WriteLn(IntBancoManager.ArquivoLog,sDescCampo[0] +  sCampo[0]);
            PrimeiraLinha := False;
            ReadLn(IntBancoManager.ArquivoTexto, sLinha);
          end
          else
          begin
            ReadLn(IntBancoManager.ArquivoTexto, sLinha);

            if (iIndiceBanco <> 60) or (copy(sLinha, iColuna[3], iTam[3]) = '06') then //Osni Cavalcanti - SIG51379
            begin
              iConvenio := strtoint(copy(sLinha, 24, 6));  // WO18980 Ferrari para pegar o numero do convenio
              //*** WriteLn(IntBancoManager.ArquivoLog,'-----------------------------------------------');
              if copy(sLinha, 14, 1) = 'T' then
              begin
                for X := 1 to 7 do
                begin
                  iLogErro := X - 1;
                  if (iIndiceBanco = 60) and (X = 4) then
                    Continue;
                  if iColuna[x] = -1 then
                    sCampo[X] := ' '
                  // Inicio WO18980 Ferrari
                  else if (X = 5) and (iConvenio = 391384) then
                    begin
                      IntBancoManager.CdsAux.Close;
                      IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT D.NODOCUMENTO ' +
                        'FROM ' +
                        '  DOCUMENTO D ' +
                        'WHERE ' +
                        ' D.CODGRUPOCNAB = ' + FormataString(Copy(sLinha, iColuna[X], iTam[X]), sMascara[x]));
                      sCampo[X] := IntBancoManager.CdsAux.Fields[0].AsString + '   Grupo CNAB:'+FormataString(Copy(sLinha, iColuna[X], iTam[X]), sMascara[x]);
                    end
                  // Fim WO18980 Ferrari
                  else
                    sCampo[X] := FormataString(Copy(sLinha, iColuna[X], iTam[X]), sMascara[x]);

                  if X = 3 then
                  begin
                    //Alex 07/12/2005 -- guarda o código de ocorrência para fazer a query apenas uma vez a cada mudança
                    // somente abre a query se a ocorrência mudar
                    if sCodOcorr <> sCampo[3] then
                    begin
                      IntBancoManager.CdsAux.Close;      // WO18980 Ferrari
                      IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT C.DESCRICAO ' +
                        'FROM ' +
                        '  CODIGOSCNAB C ' +
                        'WHERE ' +
                        '  (C.IDMODELOSCNAB = ' + IntToStr(iIndiceBanco) + ') AND ' +
                        '  (C.CODIGO = ' + sCampo[3] + ') AND ' +
                        '  (C.RECPAG = ''R'') AND ' +
                        '  (C.TIPO = ''T'') ');
                      sCodOcorr := sCampo[3];
                    end;

                    if not IntBancoManager.CdsAux.IsEmpty then
                      sDesc := ' - ' + IntBancoManager.CdsAux.Fields[0].AsString
                    else
                      sDesc := '';
                  end
                  else
                    sDesc := '';
                  //início - andre tavares - 20/05/2005 -pendência 19024
                  if X = 1 then
                  begin
                    WriteLn(IntBancoManager.ArquivoLog, '-----------------------------------------------');
                    WriteLn(IntBancoManager.ArquivoLog, sDescCampo[0] + sCampo[0]);
                    WriteLn(IntBancoManager.ArquivoLog, sDescCampo[1] + sCampo[1]);
                  end
                  else
                    WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                    //fim - andre tavares - 20/05/2005 -pendência 19024

                end; // for

                //início - andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa

                IntBancoManager.CdsAux.Close;
                IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket(' SELECT DESCCODLIQ FROM CODLIQBAIXACNAB CL, CODIGOSCNAB CB ' +
                  ' WHERE CL.IDMODELOSCNAB = ' + IntToStr(iIndiceBanco) +
                  '   AND CL.IDMODELOSCNAB = CB.IDMODELOSCNAB ' +
                  '   AND CB.CODIGO = ' + QUOTEDsTR(sCampo[3]) +
                  '   AND CL.CODIGOLIQ = ' + quotedStr(sCampo[13]));

                sCampo[13] := FormataString(Copy(sLinha, iColuna[13], iTam[13]), sMascara[13]);
                WriteLn(IntBancoManager.ArquivoLog, sDescCampo[13] + sCampo[13] + ' - ' + IntBancoManager.CdsAux.fieldByName('DESCCODLIQ').asString);

                sCampo[14] := FormataString(Copy(sLinha, iColuna[14], iTam[14]), sMascara[14]);
                WriteLn(IntBancoManager.ArquivoLog, sDescCampo[14] + sCampo[14] + ' - ' + IntBancoManager.CdsAux.fieldByName('DESCCODLIQ').asString);

                if iIndiceBanco <> 60 then
                begin
                  sCampo[15] := FormataString(Copy(sLinha, iColuna[15], iTam[15]), sMascara[15]); //andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
                  WriteLn(IntBancoManager.ArquivoLog, sDescCampo[15] + sCampo[15] + ' Dia(s)');
                end;

                IntBancoManager.CdsAux.Close;
                //fim - andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa

              end; //if 'T'

              if (copy(sLinha, 14, 1) = 'U') then
              begin
                sCampo[4] := FormataString(Copy(sLinha, iColuna[4], iTam[4]), sMascara[4]);
                for X := 8 to 12 do
                begin
                  iLogErro := X - 1;

                  if iColuna[x] = -1 then
                    sCampo[X] := ' '
                  else
                    sCampo[X] := FormataString(Copy(sLinha, iColuna[X], iTam[X]), sMascara[x]);

                  // início - andré tavares - pendência 19024 - 19/04/2005
                  {                if X = 8 then
                                   begin
                                     WriteLn(IntBancoManager.ArquivoLog,sDescCampo[0] +  sCampo[0]);
                                     WriteLn(IntBancoManager.ArquivoLog,sDescCampo[1] +  sCampo[1]);
                                   end;
                  }// fim - andré tavares - pendência 19024 - 19/04/2005

                  if X in [8, 9, 11, 10, 12] then
                    try
                      if Trim(sCampo[X]) <> '' then
                        WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + FormatFloat('#,##0.00', StrToFloat(sCampo[X])) + sDesc)
                      else
                        WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                    except
                      WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                    end
                  else
                    WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                end; // for
                if iIndiceBanco = 60 then
                begin
                  sCampo[15] := FormataString(Copy(sLinha, iColuna[15], iTam[15]), sMascara[15]);
                  sCampo[15] := FloatToStr(StrToDate(sCampo[15]) - StrToDate(sCampo[04]));
                  WriteLn(IntBancoManager.ArquivoLog, sDescCampo[15] + sCampo[15] + ' Dia(s)');
                end;
                  EncheListaRetorno(sCampo[1], //Nosso Número               1
                                    sCampo[2], //Carteira                   2
                                    sCampo[3], //Cod Ocorrência             3
                                    sCampo[4], //Data Da Ocorrência         4
                                    sCampo[5], //Código Do Documento        5
                                    sCampo[6], //Data Vencimento            6
                                    sCampo[8], //Valor Nominal do Título    7
                                    sCampo[9], //Valor Abatimento           8
                                    sCampo[11], //Valor Descontos           9
                                    sCampo[10], //Juros de Mora             10
                                    sCampo[12], //Valor do Crédito em Conta 11
                                    sCampo[7], //Código de Erro             12
                                    sCampo[13], //Código de Liq/Baixa             13 //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
                                    sCampo[14], //Código da forma de Pag no banco 14 //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
                                    sCampo[15] //andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
                                   );

              end; // if 'U'
            end; //Osni Cavalcante - SIG51379
          end;
        end;
      end
      else
      begin
        // -----------------------------------------------------------------------------
        // Não é de 240 Posições
        // -----------------------------------------------------------------------------
        while not Eof(IntBancoManager.ArquivoTexto) do
        begin
          // Lê cabeçalho do retorno para comparar com empresa proprietária logada
          if PrimeiraLinha then
          begin
            ReadLn(IntBancoManager.ArquivoTexto, sLinha);
            sCampo[0] := Copy(sLinha, iColuna[0], iTam[0]);
            WriteLn(IntBancoManager.ArquivoLog, sDescCampo[0] + sCampo[0]);
            PrimeiraLinha := False;
            // inicio - andre tavares - pendência 14349
            //            última linha - trailer do arquivo CEF - SICOV
            if (copy(sLinha, 1, 1) = 'Z') and ((iIndiceBanco = 50) or (iIndiceBanco = 61)) then
            begin
              ReadLn(IntBancoManager.ArquivoTexto, sLinha);
              Break;
            end;
            // fim - andre tavares - pendência 14349
          end
          else
          begin
            //Cássio Rovaroto - SIG nº 102320 - Início
            // Se o Convênio for SIACC 150, e a linha foi um retorno de manutenção cadastral,
            //não deve ser lida

            ReadLn(IntBancoManager.ArquivoTexto, sLinha); //Everson Cunha - SIACC - SIG103935

            //Everson Cunha - SIG103323 - Ini
            //if (iIndiceBanco <> 62) or ((Copy(sLinha, 0, 1) = 'F') and (Copy(sLinha, 150, 1) <> '5')) then
            if (not iIndiceBanco in [62, 63]) or ((Copy(sLinha, 0, 1) = 'F') and (Copy(sLinha, 150, 1) <> '5')) then
            //Everson Cunha - SIG103323 - Fim
            begin
              //início - andre tavares - pendência 23868 - 05/12/2006 - se encontrou outro header no mesmo arquivo.
              if (copy(sLinha, 1, 1) = 'Z') and ((iIndiceBanco = 50) or (iIndiceBanco = 61)) then
              begin
                ReadLn(IntBancoManager.ArquivoTexto, sLinha);
              end;
              //fim - andre tavares - pendência 23868 - 05/12/2006

              //ReadLn(IntBancoManager.ArquivoTexto, sLinha); //Everson Cunha - SIACC - SIG103935

              //início - andre tavares - pendência 23868 - 05/12/2006
              // inicio - andre tavares - pendência 14349
              //            última linha - trailer do arquivo CEF - SICOV
              {
               if (copy (sLinha, 1, 1) = 'Z') and (iIndiceBanco = 50) then
               begin
                ReadLn(IntBancoManager.ArquivoTexto,sLinha);
                break;
               end;
              }
              // fim - andre tavares - pendência 14349
              //fim - andre tavares - pendência 23868 - 05/12/2006

              { Retirei este IF porque, aparentemente, estava gerando erros em alguns MODELOS
                Fábio Barros - 10/04/2002
                if (Copy(sLinha,1,1) = '1') or (Copy(sLinha,1,1) = 'F') then
                begin                                                                 }

              if (iIndiceBanco <> 60) or (copy(sLinha, iColuna[3], iTam[3]) = '06') then //Osni Cavalcanti - SIG51379
              begin
                WriteLn(IntBancoManager.ArquivoLog, '-----------------------------------------------');
                for X := 1 to 12 do
                begin
                  iLogErro := X - 1;

                  if iColuna[x] = -1 then
                    sCampo[X] := ' '
                  else
                  begin
                    //inicio andre tavares - pendência 14439
                    //formato de data da CEF (YYYYMMDD) - arquivo do sistema SICOV
                    if ((iIndiceBanco = 50) or (iIndiceBanco = 61) or (iIndiceBanco in [62, 63])) and (X = 4) then
                    begin
                      sCampo[X] := copy(sLinha, iColuna[X] + 6, 2) + copy(sLinha, iColuna[X] + 4, 2) + copy(sLinha, iColuna[X], 4);
                      sCampo[X] := FormataString(sCampo[X], sMascara[x]);
                    end
                    else
                      //fim andre tavares - pendência 14439
                      sCampo[X] := FormataString(Copy(sLinha, iColuna[X], iTam[X]), sMascara[x]);
                  end;

                  if X = 3 then
                  begin
                    // Alex 07/12/2005 -- guarda o código de ocorrência para fazer a query apenas uma vez a cada mudança
                    // somente abre a query se a ocorrência mudar
                    if sCodOcorr <> sCampo[3] then
                    begin
                      IntBancoManager.CdsAux.Data := IntBancoManager.GetDataPacket('SELECT C.DESCRICAO ' +
                        'FROM ' +
                        '  CODIGOSCNAB C ' +
                        'WHERE ' +
                        '  (C.IDMODELOSCNAB = ' + IntToStr(iIndiceBanco) + ') AND ' +
                        '  (C.CODIGO = ' + QuotedStr(sCampo[3]) + ') AND ' +
                        '  (C.RECPAG = ''R'') AND ' +
                        '  (C.TIPO = ''T'') ');
                      sCodOcorr := sCampo[3];
                    end;

                    if not IntBancoManager.CdsAux.IsEmpty then
                      sDesc := ' - ' + IntBancoManager.CdsAux.Fields[0].AsString
                    else
                      sDesc := '';
                  end
                  else
                    sDesc := '';

                  if X in [8, 9, 11, 10, 12] then
                    try
                      if Trim(sCampo[X]) <> '' then
                        WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + FormatFloat('#,##0.00', StrToFloat(sCampo[X])) + sDesc)
                      else
                        WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                    except
                      WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                    end
                  else
                    WriteLn(IntBancoManager.ArquivoLog, sDescCampo[X] + sCampo[X] + sDesc);
                end;
              end; //Osni Cavalcanti - SIG51379

            end;
            EncheListaRetorno(sCampo[1], //Nosso Número               1
                              sCampo[2], //Carteira                   2
                              sCampo[3], //Cod Ocorrência             3
                              sCampo[4], //Data Da Ocorrência         4
                              sCampo[5], //Código Do Documento        5
                              sCampo[6], //Data Vencimento            6
                              sCampo[8], //Valor Nominal do Título    7
                              sCampo[9], //Valor Abatimento           8
                              sCampo[11], //Valor Descontos            9
                              sCampo[10], //Juros de Mora             10
                              sCampo[12], //Valor do Crédito em Conta 11
                              sCampo[7], //Código de Erro            12
                              sCampo[13], //Código de Liq/Baixa       13 //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
                              sCampo[14], //Código da forma de Pag no banco 14 //andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa
                              sCampo[15] //andre tavares - pendencia 23195 - 06/12/2006 - para poder ler o float de recebimento D + N
                              );
          end;          
        end;
      end;
      CloseFile(IntBancoManager.ArquivoTexto);
      CloseFile(IntBancoManager.ArquivoLog);
      // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
      If pApresentaVisulaizacao = 'S' Then
         VisualizaArquivo(Copy(IntBancoManager.sNomeArquivo, 1, Pos('.', IntBancoManager.sNomeArquivo)) + 'LOG', '');
      Result := ListaRetorno;
   Except
      DescreveErro;
      CloseFile(IntBancoManager.ArquivoTexto);
      CloseFile(IntBancoManager.ArquivoLog);
      Raise;
   End;

End;

Procedure TRetornoCobranca.EncheListaRetorno(sNum, siCarteira, siOcorrencia, sdDataOcorencia, sDocumento, sdVencimento,
   // andre tavares - pendencia 21102 - 30/05/2006 - para poder ler o código de liquidação de baixa, COLOQUEI O CAMPO sCodLiqBaixa
   srAbatimento, srDescontos, srCredito, srMora, siErro, srValorNominal, sCodLiqBaixa, sCodFormaPagBanco, sFloatBaixa: String);
Begin
   ListaRetorno.Add(Ae(sNum, 20) + Ae(siCarteira, 5) + Ae(siOcorrencia, 5) +
      Ae(sdDataOcorencia, 10) + Ae(sDocumento, 20) + Ae(sdVencimento, 10) +
      Ae(srAbatimento, 20) + Ae(srDescontos, 20) + Ae(srCredito, 20) +
      Ae(srMora, 20) + Ae(siErro, 5) + Ae(srValorNominal, 20) + Ae(sCodLiqBaixa, 2) +
      Ae(sCodFormaPagBanco, 2) + sFloatBaixa);
End;

Procedure TRetornoCobranca.DescreveErro;
Var
   DescErro: String;
Begin
   ListaRetorno.Clear;
   ListaRetorno.Add('Erro');
   Case iLogErro Of
      0: DescErro := 'Nosso Número';
      1: DescErro := 'Carteira';
      2: DescErro := 'Código da Ocorrência';
      3: DescErro := 'Data da Ocorrência';
      4: DescErro := 'Seu Número - Código do Documento';
      5: DescErro := 'Data do Vencimento';
      6: DescErro := 'Valor Nominal';
      7: DescErro := 'Valor do Abatimento';
      8: DescErro := 'Valor Descontos';
      9: DescErro := 'Valor do Crédito em Conta';
      10: DescErro := 'Juros de Mora';
      11: DescErro := 'Código do Erro';
   End;
   WriteLn(IntBancoManager.ArquivoLog, 'Ocorreu um erro ler o campo ' + DescErro + ' do arquivo de retorno');
End;

End.

