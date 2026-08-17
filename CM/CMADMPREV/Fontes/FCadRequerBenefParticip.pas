unit FCadRequerBenefParticip;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  : GravaBeneficiodeReferencia, bbtnOkDetClick, CalculaBeneficioGrupo
Nº SIG.....: WO16247
Data.......: 05/11/2024          
Responsável: Edilaine
Descrição..: Valor do campo RESERVADIB  seja replicado no campo SALDODECONTADIB.
--------------------------------------------------------------------------------
Rotina.....: (transferido pra UBeneficio) BuscaIndice
Nº SIG.....: WO10872
Data       : 25/08/2023
Responsável: Edilaine
Descrição..: Calculo total de cotas resgatadas Plano REB Regressivo com retençao
------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: WO7690
Data.......: 06/02/2024
Responsável: Edilaine
Descrição..: erro no calculo de alterador Correcao Monetaria na concessao
--------------------------------------------------------------------------------
Rotina.....: bbtnOkDetClick
Nº SIG:....: 135429
Data.......: 12/05/2023
Responsável: Marcos Lima
Descrição..: Refazer alteração SIG135992
--------------------------------------------------------------------------------
Alteração  : dblkpcmbBeneficioCloseUp, CalculaValorTotalBenef
Nº SIG.....: 135838
Data.......: 29/05/2023
Responsável: Edilaine
Descrição..: Resgate Judicial nao calcula total de cotas resgatadas corretamente
-------------------------------------------------------------------------------
Alteração  : AssociaTaxas
Nº SIG.....: 50850
Data.......: 03/10/2019
Responsável: Fábio Sampaio
Descrição..: Inclusão dos parãmetros 7 e 0 para utilização na procedure
             SP_CP_ASSOCIA_CONTRIBXBENEF
-------------------------------------------------------------------------------
//Pendência   : SIG 135992
//Responsável : Luis Ferrari
//Data        : 25/05/2023
//Descrição   :  Foi ajustado a rotina bbtnOkDetClick para gravar a atualização da troca de Portabilidade.
//--------------------------------------------------------------------------------------------------
//Pendência   : SIG 132064
//Responsável : Luis Ferrari
//Data        : 26/01/2023
//Descrição   :  desbloquear o campo DATA FINAL da tela de requerimento dos benefícios de APOSENTADORIA e INVALIDEZ de TODOS OS PLANOS.
//            :  Foi retirado a validação de False e true no campo dtDataFinal na rotina dblkpcmbBeneficioCloseUp
//--------------------------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick, EfetuaConcessao
Nº SIG.....: 20491
Data Merge : 24/06/2022
Data dev   : 27/02/2018
Responsável: Edilaine
Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
             de retenção de percentual das contribuições
--------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick
Nº SIG.....: 115747
Data.......: 03/05/2021
Responsável: edilaine
Descrição..: Validação das Datas de Requerimento, DIP e DIB apenas no beneficio
-------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick
Nº SIG.....: 115300
Data.......: 16/04/2021
Responsável: edilaine
Descrição..: Validação das Datas de Requerimento, DIP e DIB
-------------------------------------------------------------------------------
Alteração  : (dfm updBfciarioTitPlan) bbtnOkDetClick
Nº SIG.....: 114751
Data.......: 29/03/2021
Responsável: Edilaine
Descrição..: atualização entidade previdenciária privada
-------------------------------------------------------------------------------
Alteração  : qryDetBeforePost
Nº SIG.....: 100325
Data.......: 19/06/2020
Responsável: Edilaine
Descrição..: contabilização da movimentação de reserva indevida, não considerando o
             plano contábil do perfil de assistido
-------------------------------------------------------------------------------
Alteração  : CriaLogOcorrencia
Nº SIG.....: 99886
Data.......: 14/05/2020
Responsável: Edilaine
Descrição..: mudança na passagem de parametro, de IDPLANOORIGEM para IDPLANOPREV
-------------------------------------------------------------------------------
//Alteração  : bbtnOutrasInformacoesClick / BuscaDadosBeneficioAnterior
//Nº SIG.....: 97504
//Data.......: 11/02/2020
//Responsável: Tiago Von
//Descrição..: Ajuste na função que busca o valor do benefício anterior.
-------------------------------------------------------------------------------
Alteração  : ConcedeUmBeneficio, AtualizaReservaPart
Nº SIG.....: 84530
Data.......: 30/04/2019
Responsável: Darivaldo
Descrição..: excesso de update na tabela ReservaPart
-------------------------------------------------------------------------------
Alteração  : sbtnConcederClick
Nº SIG.....: 84752
Data.......: 15/04/2019
Responsável: edilaine
Descrição..: remover padronização datas movimentação de reserva quando for Resgate e Portabilidade
-------------------------------------------------------------------------------
Alteração  : sbtnConcederClick
Nº SIG.....: 81801
Data.......: 19/02/2019
Responsável: edilaine
Descrição..: Padronização datas movimentação de reserva na Concessão de beneficio
-------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick, bbtnConfirmarClick
Nº SIG.....: 77401
Data.......: 05/11/2018
Responsável: Edilaine
Descrição..: Correção para passar o IdPlanoPrevContab na BuscaPerfilInvestimento
             na concessão de INSS
-------------------------------------------------------------------------------
Alteração  : CmeDetalheInsert, bbtnOpcoesClick
Nº SIG.....: 47962
Data.......: 19/01/2018
Responsável: Edilaine Ferraresi
Descrição..: Ajuste concessão INSS para flag Está no Convenio e preenchimento
             automatico do %INSS e Índice de Reajuste do Teto (opções)
--------------------------------------------------------------------------------
Nº SIG.....: 70414
Data.......: 19/06/2018
Responsável: edilaine
Descrição..: Na concessão, não corrigir valores quando o índice for negativo
-------------------------------------------------------------------------------
Pendência   : SIG 68132
Responsável : Edilaine
Data        : 08/05/2018
Descrição   : Na aposentadoria INSS de Ativo não traz o perfil padrao INSS
--------------------------------------------------------------------------------
Nº SIG.....: SIG TIBERO
Data.......: 01/03/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Pendência   : SIG 32846
Responsável : Peterson Victor
Data        : 27/01/2017
Descrição   : Correção do valor quando for resgate judicial
--------------------------------------------------------------------------------
Alteração  : (.dfm updDet), CmeCadastroConfirma
Nº SIG.....: 61218
Data.......: 08/01/2018
Responsável: Andre Imakawa
Descrição..: Perfil de investimento só deve ser inserido quando modulo Beneficio
             Previdenciario e Diferente de Concessão e Simulação.
--------------------------------------------------------------------------------
Alteração  : (.dfm updDet, qryDet), CmeCadastroConfirma
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
--------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: 58900
Data.......: 29/11/2017
Responsável: Andre Imakawa
Descrição..: IdTpPagtoBenefic = 2 o campo data final deve ser preenchido com
             a data inicio
-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: 50047
Data.......: 14/07/2017
Responsável: Andre Imakawa
Descrição..: Apenas alterar tabela HSTPERCGRUPO quando IdTpPagtoBenefic = 1
-------------------------------------------------------------------------------
Nº SIG.....: 23985
Data       : 23/09/2016
Responsável: Darivaldo Alencar
Descrição..: Inclusão de flag referente a Lei 142
--------------------------------------------------------------------------------
Nº SIG.....: 31971
Data       : 24/10/2016
Responsável: William Moreira da Silva
Descrição..: Erro ao conceder beneficio parcelado
-------------------------------------------------------------------------------
Nº SIG.....: 23661
Data       : 14/07/2016                              
Responsável: Andre Imakawa
Descrição..: Ao efetuarmos a concessão de benefício com a marcação de correção
             monetária o sistema esta corrigindo os valores de benefícios e das
             taxas administrativas, porém o Benefício Único Antecipado não é
             corrigido.
{-------------------------------------------------------------------------------
Nº SOL.....: 249379/18179
PPM........: 1410733
Data       : 10/05/2016
Responsável: Felipe Azevedo dos Santos
Descrição..: Gravar as informações de tempo de contribuição na estrutura BENEFBFCIARIO
{-------------------------------------------------------------------------------
Nº SOL.....: 268616
KTN / PPM  : 1266499
Data       : 06/04/2016
Responsável: Peterson Victor
Descrição..: Bloqueio do campo dblkcmbTpPgtoBenef
{-------------------------------------------------------------------------------
Alteração  : CmeCadastroConfirma
Nº SOL.....: 271517
KTN / PPM  : 1367209
Data       : 08/04/2016
Responsável: Edilaine Ferraresi
Descrição..: na manutenção de processo não está atualizando os campos BS TOTAL,
             BS ATUAL, FAB TOTAL, FAB ATUAL.
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SOL.....: 253577-17744
KTN / PPM  : 1063636
Data       : 12/01/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - inadimplencia
{-------------------------------------------------------------------------------
Alteração  : sbtnExcluiDetClick
Nº SOL.....: 270851
KTN / PPM  : 1338345
Data       : 18/03/2016
Responsável: Edilaine
Descrição..: no desfaz requerimento, as taxas estao sendo apagadas para mais de
             uma pessoa indevidamente
{-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SOL.....: 253577-18094
KTN / PPM  : 1269549
Data       : 02/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associação de taxas
{-------------------------------------------------------------------------------
Alteração  : AbreRequerParticip, sbtnConcedeUmClick, bbtnConfirmarClick,FormShow
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 25/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
{-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick, CalculaValorTotalBenef
Nº SOL.....: 253577-18064
KTN / PPM  : 1240079
Data       : 14/01/2016
Responsável: Edilaine
Descrição..: valores nao sao atualizados na benefbfciario (BS, FAB, Base Deficit)
{-------------------------------------------------------------------------------
Alteração   : (.dfm)  updDet
Autor(a)    : BRUNO AZEVEDO DOS SANTOS
Data        : 14/01/2016
Pendência   : SOL 253577/18069 PPM 1241131
Descricao   : Ajustes para o equacionamento. Sistema não atualizava os campos
              na tabela BENEFBFCIARIO. Ajustes relacionados a lógica dos cálculos
              dos valores pois para pensão onde exista mais de um beneficiário,
              dividindo em percentuais, o sistema não calculava corretamente.
{-------------------------------------------------------------------------------
Alteração   : ExecutaSP_PreparoContribuicao
Pendência   : SOL 253577-18070  PPM 1240812
Responsável : Edilaine Ferraresi
Data        : 14/01/2106
Descrição   : passar tipoMov na chamadas da procedure
{-------------------------------------------------------------------------------
Alteração  : ExecutaSP_PreparoContribuicao
Nº SOL.....: 253577.17666
KTN / PPM  : 1019935
Data       : 23/11/2015
Responsável: Helio Lima Custodio
Descrição..: Houve mudança na ExecutaSP_PreparoContribuicao, teve que enviar
             '' como mesreferencia para que conserve o mesmo comportamento.
{-------------------------------------------------------------------------------
// Autor(a)    : Peterson Victor
// Data        : 02/12/2015
// Pendência   : SOL 265717 PPM 1186709
// Descricao   : Só realizar as alterações na tabela EVENTOSPREV quando
                 for o modulo 454 e fonte pagadora 2
{-------------------------------------------------------------------------------
Alteração  : reValorFABBtnClick, reValorBSBtnClick
Nº SOL.....: 253577-17854
KTN / PPM  : 1131941
Data       : 26/10/2015
Responsável: Edilaine
Descrição..: ajuste na query de entrada do BS/FAB
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo, InsereCorrecaoMonetaria
Nº SOL.....: 262968
KTN / PPM  : 1102753
Data       : 06/10/2015
Responsável: Edilaine
Descrição..: erro ao gerar demonstrativo quando há lançamento de alterador
{-------------------------------------------------------------------------------
Nº SOL.....: 262811
KTN / PPM  : 1125645
Data       : 21/10/2015
Responsável: Marcelo Cardoso
Descrição..: A informação DIB INSS  não deve ser preenchidapara os benefícios
             gerados por meios dos eventos de Demissão com Cancelamento.
{-------------------------------------------------------------------------------
Alteração  : (dfm) , GeraDemonstrativo, FormClose, FormCreate
Nº SOL.....: 253577-17464
KTN / PPM  : 955703
Data       : 02/07/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - concessão
{-------------------------------------------------------------------------------
Alteração  : (dfm) campos novos, qryBeneficio, qryDet, updDet
Nº SOL.....: 253577-17404
KTN / PPM  : 850977
Data       : 30/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - Manutenção benefícios
{-------------------------------------------------------------------------------
Alteração  : (dfm) campos novos, qryBeneficio, qryDet, updDet, MostraDemonstrativoConcessao
Nº SOL.....: 253577-17374
KTN / PPM  : 848182
Data       : 19/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - requerimento de benefícios
//------------------------------------------------------------------------------
// Rotina      : DesfazRequrimentos
// Autor(a)    : Fernando Xavier
// Data        : 30/07/2015
// Pendência   : SOL 256744 PPM 999526
// Descricao   : ao clicar no botão sair da tela de concessão o sistema apresenta a
//               mensagem informando que o requerimento será desfeito, porém foi observado
//               que o sistema esta muito lento quando da deleção do requerimento.
-------------------------------------------------------------------------------}
//Pendência   : SOL:258193 PPM:976792
//Responsável : Wylliam Leite da Silva
//Data        : 14/07/2015
//Descrição   : Foi retirado o filtro pelo FLGPECULIO = 1 para não apresentar
//              a critica quando o Flag for igual a 0.
//------------------------------------------------------------------------------
//Pendência   : SOL 243165 PPM 581923
//Responsável : William Moreira da Silva
//Data        : 14/11/2014
//Descrição   : A rotina de concessão de beneficios esta apresentando erro ao 
//				concedermos um beneficio INSS.
//------------------------------------------------------------------------------
//Pendência   : SOL 221079 KINTANA 2058169
//Responsável : Fernando Xavier
//Data        : 29/01/2012
//Descrição   : A rotina esta cancelando as contribuições do beneficio FUNCEF
//              ao cancelar um evento de Aposentadoria INSS.
//------------------------------------------------------------------------------
//Pendência   : SOL 232043 PPM 396781
//Responsável : Fernando Xavier
//Data        : 20/12/2012
//Descrição   : Não está pegando o indice do mês de Novembro para calculo do Abono Anual.
//--------------------------------------------------------------------------------
// Pendência   : SOL 231025 PPM 363636
// Responsável : William Moreira da Silva
// Data        : 29/04/2014
// Descrição   : Erro na concessão ao utilizar a opção de correção monetaria
//--------------------------------------------------------------------------------
// Pendência   : SOL 224485 Kintana 2060136
// Responsável : Fernando Xavier
// Data        : 24/02/2014
// Descrição   : Data do requerimento menor que a data do evento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/10/2013
//Descrição   : Atividade para liberação de versão 15188.
//              Retirar de campos e fazer com que não possa mais ser inserido
//              mais nenhum evento de morte no modulo.
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 220983 2053498 Kintana
// Data        : 28/11/2013
// Descricao   : Solicitamos que o campo texto seja gravado na inclusao
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 221078 Kintana 2053573
// Data        : 21/11/2013
// Descricao   : A rotina de exclusão de beneficios não esta funcionando corretamente.
//--------------------------------------------------------------------------------
// Autor(a)    : Higor Nayde Ferreira
// Pendência   : SOL 153770/7741 Kintana 1622372
// Data        : 09/10/2013
// Descricao   : implementação campo TEMPVINCFUND na Qry de entrada de Reserva
//               para Beneficio
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 215522 Kintana 2046098
// Data        : 04/10/2013
// Descricao   : Solicitamos que o campo texto na tela de concessão de benefícios
//               seja gravado.
//--------------------------------------------------------------------------------
// Autor(a)    : Marcio Sanches Spinosa SOL 214243 Kintana 2044934
// Pendência   : SOL 214243 Kintana 2044934
// Data        : 10/09/2013
// Descricao   : Alteração no filtro do mapa de calculo, pois trazia descrições
//               desnecessárias.
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 215300 Kintana 2044141
// Data        : 29/08/2013
// Descricao   : Alteração em DFM, nova consulta para trazer as informações dos beneficios.
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 210200 Kintana 2027146
// Data        : 28/06/2013
// Descricao   : Erro na concessão de benefícios
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 209659 Kintana 2022632
// Data        : 21/06/2013
// Descricao   : Na cocessão de resgate apresenta mensagem de cancelamento,
//               impossibilitando a efetivação do mesmo.
//------------------------------------------------------------------------------
// Pendência : SOL 206918 - KINTANA 1999411
// Autor(a)  : douglas.siqueira
// Data      : 20/06/2013
// Descrição : Retirada Crítica SOL 161215
//--------------------------------------------------------------------------------
//Pendência   : SOL 205075 - KTN 1983581
//Responsável : Fernando Xavier
//Data        : 16/04/2013
//Descrição   : Permitir mais de um Benefício INSS correção do SOL 181948
//------------------------------------------------------------------------------
// Pendência : SOL 192129/14203 - KINTANA 1968560
// Autor(a)  : MONICA GONZAGA
// Data      : 10/03/2013
// Descrição : Retirado o UPDATE FLGCOBRA = 0
//--------------------------------------------------------------------------------
// Pendência : SOL 181948 - KINTANA 1724239
// Autor(a)  : TADEU PASSOS
// Data      : 10/03/2013
// Descrição : Alteração para permitir mais de um benefício
// -----------------------------------------------------------------------------
//Pendência   : SOL 163064 KINTANA 1388980
//Responsável : DOUGLAS DE SIQUEIRA
//Data        : 14/02/2013
//Descrição   : Trava no botão ok para verificar situação dos bonefícios.
// -----------------------------------------------------------------------------
// Pendência : SOL 160185
// Autor(a)  : André Felipe
// Data      : 14/01/2013
// Descrição : Criação de campos para cadastro do CNPB e Plano Receptor
// -----------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//Pendência   : SOL 132938 Kintana 770226
//Responsável : BRUNO AZEVEDO, Fernando Xavier e André
//Descrição   : inclusão do processo de Alteradores na concessão.
//------------------------------------------------------------------------------
//Pendência   : SOL 189184 - KTN 1785236
//Responsável : Fernando Xavier
//Data        : 31/08/2012
//Descrição   : ERRO CONCESSÃO - DIVISOR IGUAL A ZERO
//------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : MARCELO ALMEIDA
//Data        : 12/11/2010
//Descrição   : Cadastro Previdenciário - Resgate de Contribuições
//------------------------------------------------------------------------------
// Higor Nayde Ferreira  SOL - 173938 KTN - 1627112 Início
// Autor(a)    : Higor Nayde Ferreira
// Pendência   : SOL 173938 Kintana 1627112
// Data        : 24/07/2012
// Descricao   : Alterção no "Rodapé" do documento de Demonstrativo de Concessão
//antes e depois de ser confirmados os dados.
//------------------------------------------------------------------------------
//Pendência   : SOL 181743 Kintana 1706063
//Responsável : Fernando Xavier
//Descrição   : Correção na data do índice da reserva.
//------------------------------------------------------------------------------
//Pendência   : SOL 173999 KINTANA 1576192
//Responsável : Monica Gonzaga
//Data        : 10/05/2012
//Descrição   : Alterado o campo percentual de retenção para 4 casas decimais
//------------------------------------------------------------------------------
//Pendência   : SOL 169125 KINTANA 1515949
//Responsável : OTACILIO AQUINO
//Data        : 19/12/2011
//Descrição   : Atualizar a tabela PROCESSOBENEF.
//------------------------------------------------------------------------------
//Pendência   : SOL 159477 KINTANA 1319244
//Responsável : Wylliam Leite da Silva
//Data        : 13/02/2012
//Descrição   : Foi criado uma mensagem para avisar, dois campo na qryDET :
//              BPL.FLGISENTOIRRF, BF.FLGISENTOIRRFANT
//------------------------------------------------------------------------------
//Pendência   : SOL 167480 KINTANA 1519761
//Responsável : Wylliam Leite da Silva
//Data        : 24/01/2012
//Descrição   : Alterar o demonstrativo de concessão na parte de
//              VALOR RECEBER/PAGAR, pois a query estava trazendo os dados
//              de concessões anteriores.
//------------------------------------------------------------------------------
//Pendência   : SOL 171837 KINTANA 1542017
//Responsável : Wylliam Leite da Silva
//Data        : 24/01/2012
//Descrição   : Alterar o demonstrativo de concessão na parte de
//              VALOR RECEBER/PAGAR, pois a query estava trazendo os dados
//              de concessões anteriores.
//--------------------------------------------------------------------------
//Pendência   : SOL 173475 KINTANA 1392988
//Responsável : BRUNO AZEVEDO
//Data        : 02/02/2012
//Descrição   : Ajustes ao carregar o NB
//--------------------------------------------------------------------------
//Pendência   : SOL 161215 Kintana 1379812
//Responsável : Marcos Merola
//Data        : 07/11/2011
//Descrição   : Implementação de Trava Concessão - Titular / Direto Partic.
//              Benefício p/ Beneficiário.
//------------------------------------------------------------------------------
//Pendência   : SOL 160863 KINTANA 1381911
//Responsável : OTACILIO AQUINO
//Data        : 18/11/2011
//Descrição   : Gravar o Evento antes de fazer uma nova pesquisa.
//------------------------------------------------------------------------------
//Pendência   : SOL 140042.6361 Kintana 1410792
//Responsável : Fernando Xavier
//Descrição   : Erro Beneficio FUNCEF mês competência Reembolso.
// -----------------------------------------------------------------------------
//Pendência   : SOL 163824 KINTANA 1402584
//Responsável : ERALDO LUIS DA SILVA
//Data        : 29/08/2011
//Descrição   : Trava de requerimento de Pecúlios
//--------------------------------------------------------------------------
//Pendência   : SOL 136375 KINTANA 815802
//Responsável : ERALDO LUIS DA SILVA
//Data        : 18/08/2011
//Descrição   : ( I C ) Trava para número de benefício zerado.
//--------------------------------------------------------------------------
//Pendência   : SOL 163261 KINTANA 1392988
//Responsável : BRUNO AZEVEDO
//Data        : 16/08/2011
//Descrição   : Ajuste na exibição do plano contábil.
//--------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 162023 Kintana 1373448
//Responsável : RENATO VISONI
//Descrição   : Erro de constrainT
//--------------------------------------------------------------------------------
//Pendência   : SOL 162003 Kintana 1373069
//Responsável : FERNANDO XAVIER
//Descrição   : Erro de SQL ao selecionar benefício
//--------------------------------------------------------------------------------
//Pendência   : SOL 157583 Kintana 1269810
//Responsável : Vinicius Ferreira
//Descrição   : Erro ao alterar tipo de benefício
//-----------------------------------------------------------------------------------
//Pendência   : SOL 161675 Kintana 1370250
//Responsável : Renato Visoni
//Descrição   : Foi identificado que na funcionalidade "Manutenção de Processo de Benefícios",
//              ao selecionar o valor do benefício mínimo e recalcular a regra, está aparecendo
//              a mensagem de erro: qryBeneficio: Field 'IDPLANOPREV' not found.
//-----------------------------------------------------------------------------------
//Pendência   : SOL 161611 Kintana 1365052
//Responsável : Fernando Xavier
//Descrição   : erro ao abrir qryContaBancaria trocava sql em tempo de execução e ao
//              abri-la novamente não encontrava o parametro idpessoa
//-----------------------------------------------------------------------------------
//Pendência   : SOL 149370/3861 Kintana 1149770
//Responsável : Renato Visoni
//Descrição   : Buscar conta resgate quando lote for de resgate.
//-----------------------------------------------------------------------------------
//Pendência   : SOL 160868 Kintana 1353515
//Responsável : Renato Visoni
//Descrição   : Erro ao comparar a DIB Funcef e DIB Inss para Saldado.
//--------------------------------------------------------------------------
//Pendência   : SOL 160872 KINTANA 1353610
//Responsável : BRUNO AZEVEDO
//Data        : 05/07/2011
//Descrição   : Sistema não estava gerando contribuição na concessão.
//--------------------------------------------------------------------------
//Pendência   : SOL 156428 KINTANA 1235970
//Responsável : BRUNO AZEVEDO
//Data        : 25/04/2011
//Descrição   : Não permitir conceder e requerer benefício sem informar DIB e DIP.
//--------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 25/09/2009
// Pendência   : SOL 123227 Kintana 614304
// Descricao   : Criação dos campos RESERVADIB,SALDOCONTADIB e INDICEDIB
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 155566/4401 Kintana 1214773
//Responsável : Fernando Xavier
//Descrição   : erro na ativaçao do plano no requerimento de beneficios.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 155863 Kintana 1216997
//Responsável : Renato Visoni
//Data        : 13/08/2010
//Descrição   : Pois ao conceder pecúlio por morte da 2003400, o sistema está
//              trazendo acertos referentes ao evento de falecimento do titular,
//              quando o correto é não trazer.
//--------------------------------------------------------------------------------
//Pendência   : SOL 153767 Kintana 1162587
//Responsável : Renato Visoni
//Descrição   : Permitir 2 casas decimais no percentual de Retenção.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 154040 KINTANA 1167990
//Responsável : BRUNO AZEVEDO
//Data        : 02/03/2011
//Descrição   : Não exibir crítica quando o benefício for de pecúlio.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 153181 KINTANA 1150653
//Responsável : BRUNO AZEVEDO
//Data        : 17/02/2011
//Descrição   : Ajuste na consulta de benefícios.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 130057-1781 KINTANA 717976
//Responsável : BRUNO AZEVEDO
//Data        : 04/05/2010
//Descrição   : Somente atualizar a HSTCONTRIBPREV se o evento gerador nao for de demissao.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 147952 KINTANA 1029787
//Responsável : BRUNO AZEVEDO
//Data        : 22/11/2010
//Descrição   : Adicionado o campo percretencao a query de entrada da regra do valor de beneficio.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 141452 KINTANA 896510
//Responsável : FERNANDO XAVIER
//Data        : 21/09/2010
//Descrição   : Ajuste no demonstrativo inclusão do plano contabil
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 135283 Kintana 803604
//Responsável : Renato Visoni
//Descrição   : Validação da Conta Resgate.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 143833 KINTANA 943330
//Responsável : Fernando santana
//Data        : 23/09/2010
//Descrição   : Atualizar os P REB e NOVOPLANO
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 137519 KINTANA 831220
//Responsável : BRUNO AZEVEDO
//Data        : 16/06/2010
//Descrição   : Ajuste no controle de transação ao fechar a tela.
//--------------------------------------------------------------------------------------------------
// Autor(a)  :  Renato Visoni
// Data      :  20/01/2010
// Pendência :  SOL 124583 Kintana 633547
// Descricao :  Ao processar um resgate complementar,verificamos que no segundo resgate,
//              no ato da alimentação da reserva a data "DATAALIMENTACAO" estava sendo inserida
//              errada.
// --------------------------------------------------------------------------------------
//Pendência   : SOL 138348/1921 KINTANA 841578
//Responsável : BRUNO AZEVEDO
//Data        : 23/06/2010
//Descrição   : No update do LOTE na HSTBENEFBFCIARIO, comparar também com o IDBENEFICIO e o NUMEROPROCESSO.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 97577 Kintana 424749
//Responsável : THIAGO PASSOS / BRUNO AZEVEDO 21/06/2010
//Descrição   : Validação para quitação de Emprestimo.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 135605 KINTANA 807282
//Responsável : BRUNO AZEVEDO
//Data        : 11/05/2010
//Descrição   : Padronizar como '0' o valor do campo RETENÇÃO.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 15/04/2010
// Rotina      : MoveReserva
// Pendência   : SOL 125426 Kintana 711048
// Descricao   : Criação do campo de Percentual de Retenção.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 18/01/2010
// Rotina      : MoveReserva
// Pendência   : SOL 124089 Kintana 693423
// Descricao   : Identificamos que a data da alimentação das reservas, quando da concessão
// do resgate, é diferente da data de pagamento
//--------------------------------------------------------------------------------------------------
// Autor(a)  :  Renato Visoni
// Data      :  23/12/2009
// Pendência :  SOL 128888 Kintana 695913
// Descricao :  Favor verificar a emissão da mensagem "Existe uma transação
//              em aberto. A Transação será cancelada!"
// --------------------------------------------------------------------------------------
// Autor(a)  :  Daniel Begnami
// Data      :  06/10/2009
// Pendência :  SOL 124279 KT:629988
// Descricao :  Fechar a seção com RollBack no evento on-close do formulario, caso a seção esteja aberta.
// --------------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 26/11/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 127464 Kintana 675734
// Descricao   : Alteração da QryPlanoContabInss para validação dos planos.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 25/11/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 127411 Kintana 678567
// Descricao   : Alteração da QryPlanoContabInss e da função ComparaPLanoContabil
// aplicando idtitular como parametro.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 20/11/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 127345 Kintana 674527
// Descricao   : Ao conceder um benefício Saldado (FUNCEF) e participante já possuir
// INSS em outro Plano, o sistema está encerrando (lançando data final e sitbeneficio)nas
// duas linhas de benefício (INSS Novo Plano e INSS Saldado). Deve-se encerrar apenas
// o INSS no plano anterior. O novo deve estar com os campos (datafinal = null.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 28/09/2009
// Rotina      : ComparaValorReservaComHistorico
// Pendência   : SOL 123843 Kintana 636875
// Descricao   : Para alguns casos a concessão de resgate estava gerando diferneças
//               entre a alimentação das reservas e o valor resgatado.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 05/11/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 126697 Kintana 665666
// Descricao   : Incluimos a matricula no filtro da sql.
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 22/10/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 125930 \ Kintana 654723
// Descricao   : Mudança no critério de concessão de beneficio.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 30/06/2009
// Rotina      : ConcedeUmBeneficio
// Pendência   : SOL 118811 Kintana 569080
// Descricao   : Apresentar critica quando o plano contabil do beneficio que
//               esta sendo concedido for diferente do plano contabil do bene-
//               ficio INSS.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 22/09/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 121166 \ Kintana 579890
// Descricao   : Inseri no sistema BENEFICIOPREV uma critica que trava o processo
//               de concessão de beneficio quando não há contribuição associado
//               tanto de pensionista quanto de aposentado evitando assim que os
//               beneficios sejam concedidos sem CONTRIBUIÇÃO.
//---------------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 09/06/2009
// Rotina      : Concessão de Resgate
// Pendência   : SOL 119077 \ Kintana 566187
// Descricao   : O sistema não estava completando o processo de concessão para beneficiario particip.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 11/02/2009
// Rotina      : bbtnConfirmarClick
// Pendência   : SOL 108695 \ Kintana 493168
// Descricao   : O sistema não estava comitando alguns UPDATE's, coloquei o COMMIT no final do processo.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 04/02/2009
// Rotina      : MostraDemonstrativoConcessao
// Pendência   : 107899_487681
// Descricao   : Não filtrar plano previdenciário, pois todos os registros da pessoa tem de ser mos_
//               trado.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 18/11/2008
// Rotina      : RodaPadraoMovReserva
// Pendência   : 101075_448004
// Descricao   : Gravar DATAFINAL na DATAALIMENTACAO da tabela HISTMOVRESERVA
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/10/2007
// Rotina      : bbtnOkDetClick
// Pendência   : 26707
// Descricao   : Incluir IDSITPART na query de Plano Contabil
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 23/10/2007
// Pendência   : 25133
// Rotina      : Varias
// Descricao   : Correção nas querys da Tabela "PortadorForma" e no componente qryPortForma, acrescentando a
//               condição: AND NVL(PORTADORFORMA.FLGATIVO, 'S') = 'S'
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 04/09/2007
// Rotina      : Várias
// Pendencia   : 22119
// Alteração   : Confirmar que a FrmAguarde seja sempre fechada qdo terminar a uma operação
// --------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : 1) Passar IDCALCULO para as funções de beneficio
//               2) Gravar o IDCALACULO na movimentação de beneficios
//------------------------------------------------------------------------------
// Alterações:
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnOpcoesClick
// Descricao   : Enviar e receber o IDCALCULO para as opções
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 12/07/2007
// Pendência   : 25848
// Descricao   : Acerto na qry da "Forma de Pagamento".
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/06/2007
// Pendência   : 25647
// Rotina      : VerificaContribAtrasada
// Descricao   : Acerto na query para considerar apenas as contribuições com
//               sitrecebimento 0, 1 e 3
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/05/2007
// Pendência   : 21961
// Rotina      : Diversas
// Descricao   : Vincular uma EPP como favorecido para beneficios de portabilidade
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/05/2007
// Pendência   : 24848
// Rotina      : bbtnProcurarClick
// Descricao   : Comentado acertos no calculo das posição de Mes e Dia
// Pendência   : 24849
// Rotina      : bbtnProcurarClick
// Descricao   : Retirado o FLGDESATIVADO
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/04/2007
// Pendência   : 25178
// Rotina      : ConcedeUmBeneficio
// Descricao   : Inclusão de rotina para no caso de concessão de INSS fora do convenio
//               gerar movimento de retenção
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 30/01/2007
// Pendência   : 24334
// Rotina      : várias
// Descricao   : Forçado formato de datas para 'dd/mm/yyyy' em todas as rotinas do form,
//               substituindo-se DateToStr() por FormatDateTime
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 27/12/2006
// Pendência   : 22208
// Rotina      : TestaQuitacaoDividas
// Descricao   : Permitir que seja feita uma concessão sem quitar um empréstimo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 25/10/2006
// Pendência   : 23609
// Rotina      : EfetuaConcessao
// Descricao   : Acerto na atribuição de valor à variavel.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : - (qryReservaPart e updReservaPart)
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//             ***************************************************************
//             *****  ATENÇÃO AO DAR MANUTENÇÃO NO updReservaPart:       *****
//             *****  A passagem do campo foi implementada diretamente   *****
//             *****  no UpdateSQL                                       *****
//             ***************************************************************
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/10/2006
// Pendência   : 22892
// Rotina      : bbtnConfirmarClick
// Descricao   : Para casos de resgate de reserva, passa a contabilizar pela data
//               de pagamento.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 28/09/2006
// Pendência   : 23419
// Rotina      : AbreRequerParticip
// Descricao   : Tornar o campo DataRequerimento obrigatório, para seja sempre
//   passado o valor definido no evento.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/09/2006
// Rotina      : bbtnOkDetClick
// Descricao   : Incluir IDSITPLANOPREV na query de Plano Contabil
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 20/07/2006
// Rotina      : 21787
// Descricao   : 1) Converter o preview do ReportBuilder para o FPreview
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/05/2006
// Rotina      : 22204
// Descricao   : 1) Atualizar o VALORNADIB no caso de beneficio em grupo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/04/2006
// Pendência   : 21049
// Rotina      : bbtnConfirmarClick
// Descricao   : Ao encerrar as contribuições colocar a data final do benefício.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/03/2006 - 30/03/2006
// Rotina      : 21861
// Descricao   : 1) Novo controle de Convenio
//               2) Novo controle de Acompanhante (antigo ainda existe)
//               3) Acerto no demonstrativo de concessão para não exibir os FLGENVIADO = 8
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/03/2006
// Pendência   : 21616
// Rotina      : qryDetBeforePost
// Descricao   : Voltar codigo que faz movimentação da reserva da MOVRESERVATEMP para a HISTMOVRESERVA
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/02/2006
// Pendência   : 21431
// Rotina      : qryDetBeforePost
// Descricao   : Não atualizar o VALORNADIB quando for Concessão
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/01/2006
// Pendência   : 21195
// Rotina      : sbtnDemonsSRBClick
// Descricao   : Novo parametro para a função DisparaRelatorio. IDPESSOA.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/01/2006
// Pendência   : 19531
// Rotina      : Varias
// Descricao   : Atualizar o campo FLGPAGAINSS da BENEFBFCIARIO
//--------------------------------------------------------------------------------------------------
// Rotinas     : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 06/12/2005
// Pendência   : 20931
// Descricao   : Implementação para quando realizar a simulação já trazer o tempo
//               total de serviço.
//--------------------------------------------------------------------------------------------------
// Rotinas     : MostraDemonstrativoConcessao
// Autor(a)    : Augusto
// Data        : 23/11/2005
// Pendência   :
// Descricao   : Incluir novas informações no demonstrativo de concessão
//--------------------------------------------------------------------------------------------------
// Rotinas     : AbreRequerParticip / CmeDetalheInsert
// Autor(a)    : Augusto
// Data        : 07/07/2005
// Pendência   : 19429
// Descricao   : Receber e atualizar a Data de Requerimento
//--------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : CalculaReservaParaBeneficio
//  Data       : 30/06/2005
//  Pendência  : 19575
//  Descrição  : não somar reservas de controle ao passar o somatório de reservas para a regra de
//               cálculo do benefício
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : dblkpcmbBeneficioCloseUp
//  Data       : 03/06/2005
//  Pendência  : 18637
//  Descrição  : Alteração para criticar se benefício já foi requerido em outro processo
//               apenas se o form chamador for diferente de SIMULAÇÃO.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : EfetuaConcessao
//  Data       : 01/06/2005
//  Pendência  : 17806
//  Descrição  : Acrescentada crítica para verificação da data da DIB não ser
//               anterior à do pagamento do lote.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/05/2005
// Pendencia   : 19208
// Rotina      : MostraDemonstrativoConcessao
// Alteração   : Usar a rotina BeneficioComQuitacao para controlar benefícios
//               com situação diferente.
//               Quando tiver quitação antecipada exibir no demonstrativo o valor.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/05/2005
// Rotina      : MostraDemonstrativoConcessao
// Pendência   : 19221
// Descricao   : Trocar os valores de Valor do benefício e Valor do benefício
//               original que estavam invertidos.
//--------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : bbtnConfirmarClick
//  Data       : 10/05/2005 - 11/05/2005
//  Pendência  : 19214
//  Descrição  : Caso simulação de beneficios, Acertos para imprimir relatório e
//               não gravar a Simulação
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : bbtnConfirmarClick
//  Data       : 26/04/2005
//  Pendência  : 18874
//  Descrição  : Mudança do Inherited para o fim do procedimento.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : dblkpcmbBeneficioCloseUp
//  Data       : 14/04/2005
//  Pendência  : 19027
//  Descrição  : Habilitação do Nº do processo.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : bbtnConfirmarClick
//  Data       : 10/03/2005
//  Pendência  : 18418 / 18740
//  Descrição  : Alterado o order by da qryContribuicao para:
//               ORDER BY HST.MESCOBRANCA DESC, HST.MESREFERENCIA
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : AbreRequerParticip e SelecionaProcesso
//  Data       : 01/03/2005
//  Pendência  : 18731
//  Descrição  : Modificação na consulta para ler, na concessão, apenas o evento
//               mais recente.
//--------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CmeCadastroCancel
//  Data       : 08/03/2005
//  Pendência  : 18810
//  Descrição  : Executar um rollback ao cancelar processo caso Concessão
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : AbreRequerParticip e SelecionaProcesso
//  Data       : 01/03/2005
//  Pendência  : 18731
//  Descrição  : Modificação na consulta para ler, na concessão, apenas o evento
//               mais recente.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ConcedeUmBeneficio
//  Data       : 17/02/2005
//  Pendência  : 18314
//  Descrição  : Considerar para benefícios que tenham quitação automática.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ChamaPreparoDeContribuicao
//  Data       : 16/02/2005
//  Pendência  : 18651
//  Descrição  : Acerto na funcionalidade para considerar benefícios temporários
//               no cálculo da data final.
//--------------------------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : ConcedeUmBeneficio
//  Data       : 31/01/2005
//  Pendência  : 18314 / 16939
//  Descrição  : Atualização dos campos necessários para encerrar benefício em
//               caso de quitação automática.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ChamaPreparoDeContribuicao
//  Data       : 21/01/2005
//  Pendência  : 18510
//  Descrição  : Acerto na variável de data final.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ChamaPreparoDeContribuicao, bbtnConfirmarClick
//  Data       : 18/01/2005
//  Pendência  : 18500
//  Descrição  : Acerto na passagem de data final para funções de preparo de contribuição.
//--------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 20.10.2004
//  Pendencia  : 17578
//  Descrição  : Filtrar planos ativos (PLANPREVCONTABIL.ATIVO = S)
//--------------------------------------------------------------------------------------------------
// Rotina      : dblkpcmbBeneficioCloseUp
// Autor(a)    : Augusto
// Data        : 13/10/2004
// Descricao   : Demonstrar caso a pessoa já possua este beneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : qryDetBeforePost
// Autor(a)    : Camille
// Data        : 17.09.2004
// Descricao   : Acerto na gravacao da FONTEPAGADORA
//--------------------------------------------------------------------------------------------------
// Rotina      : FormShow
// Autor(a)    : Leo
// Data        : 14.09.2004
// Descricao   : acrescentei o filtro  BF.IDSITBENEFICIO IN (4,8,6) no MontaSelectPart
//--------------------------------------------------------------------------------------------------
// Rotina      : CalculaReservaParaBeneficio
// Autor(a)    : Camille
// Pendência   : 16283 (refazendo)
// Data        : 10.09.2004
// Descricao   : Se clicar duas vezes na calculadora de beneficio na 2a. vez
//               dá um valor totalmente errado. O problema é por causa da
//               qryMovReservaTemp
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick  , ChamaPreparoDeContribuicao
// Autor(a)    : Leo
// Data        : 30/08/2004
// Descricao   : teste se existe benef. vitalício. caso exista, não testar data final para preparo de contribuição.
//               As contribuições devem ser preparadas até a data do lote.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Pendência   : 17393
// Data        : 17/08/2004
// Descricao   : Quando o parâmetro prmFlgGravaSimulBenef indicar para não gravar
//               na simulação de benefício, executa um rollback na transação.
//--------------------------------------------------------------------------------------------------
// Rotina      : CalculaReserva
// Autor(a)    : Camille
// Pendência   : 17391
// Data        : 16.08.2004
// Descricao   : Acrescentar IDTITULAR na query de calculo de reserva
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 17230
// Data        : 10/08/2004
// Descricao   : Quando o usuário escolher não confirmar a concessão, todo o processo
//               de concessão é cancelado.
//--------------------------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Camille
// Data        : 05.08.2004
// Descricao   : Acertos na chamada do cadastro de conta bancaria e na habilitacao
//               dos botoes conta bancaria e demons.
//--------------------------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Augusto
// Data        : 09/07/2004
// Descricao   : Acertos para beneficio de Acompanhante
// Data        : 07/07/2004 - 09/07/2004
// Descricao   : Atualizar o campo valor do beneficio com o valor informado do INSS
//               quando de beneficio de referencia
//--------------------------------------------------------------------------------------------------
// Rotina      : dblkpcmbBeneficioCloseUp, bbtnOkDetClick
// Autor(a)    : Gleyber
// Pendência   : 17137
// Data        : 02/07/2004
// Descricao   : Alteração para desabilitar o campo de Nº do processo apenas para
//               quando já estiver preenchido. A crítica desta campo também só
//               efetuada quando estiver habilitado.
//--------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ------
//  Data       : 01.07.2004
//  Pendência  : ----
//  Descrição  : Retirada das chamadas a rotina BuscaPlanoOrigem pois para o
//               proprio participante o IdPlanoOrigem é SEMPRE igual ao IdPlanoPrev
//--------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaContribCAR
//  Data       : 30.06.2004
//  Pendência  : 17112
//  Descrição  : Não impedir que continue se der erro em uma matricula
//               ATENÇÃO :  ALTEREI A ROTINA PARA NÃO FAZER MAIS O LOOP NA
//                          QRYCONTRIB. O LOOP  DEVE  SER  FEITO NA ROTINA
//                          CHAMADORA.
//--------------------------------------------------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Camille
// Pendência   : 17051
// Data        : 18.06.2004
// Descricao   : Passar data do lote como data para atualizacao do emprestimo
//--------------------------------------------------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Camille
// Pendência   : 16764
// Data        : 14.06.2004
// Descricao   : Gravar data final do beneficio de pagamento unico apenas se
//               nao estiver preenchida. Se estiver, deixa a data que estiver.
//--------------------------------------------------------------------------------------------------
// Rotina      : QryDetBeforePost
// Autor(a)    : Augusto
// Data        : 02/06/2004
// Descricao   : Atualizar DATAINICIOFUND
// Data        : 03/06/2004
// Descricao   : Passar VALORTOTAL para PreparaBeneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Leo
// Data        : 27/05/2004
// Descricao   : ATUALIZAÇÃO - atribuição automática de parametros contábeis individuais
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 20/05/2004
// Descricao   : atribuição automática de parametros contábeis individuais
// Autor(a)    : Augusto
// Descricao   : Atualização do campo VALORNADIB
//--------------------------------------------------------------------------------------------------
// Rotina      : QryTitular
// Autor(a)    : Augusto
// Data        : 13/05/2004
// Descricao   : Retirado o filtro de FLGDESATIVADO
//               Acerto no Demonstrativo de Concessão
//               Atualização do campo FONTEPAGADORA
//-------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Camille
// Pendência   : 16764
// Data        : 11.05.2004
// Descricao   : Gravar data final do beneficio de pagamento unico
//--------------------------------------------------------------------------------------------------
// Rotina      : após todas as chamadas de BuscaPlanoOrigem
// Autor(a)    : Leo
// Data        : 05/05/2004
// Descricao   : tratamento para idplanoorigem não encontrado (part. cancelados)
//--------------------------------------------------------------------------------------------------
// Rotina      : CalculaReservaParaBeneficio
// Autor(a)    : Leo
// Data        : 05/05/2004
// Descricao   : Novo campo na query para reserva DTINICIOINSC
//--------------------------------------------------------------------------------------------------
// Rotina      : reValorCalcInssBtnClick
// Autor(a)    : Augusto
// Data        : 04/05/2004
// Descricao   : Novos parametros para regra
//--------------------------------------------------------------------------------------------------
// Rotina      : VerificaVALORLimiteBeneficio
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 28.04.2004
// Descricao   : Nova rotina para tratamento de valor limite de beneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 16286
// Data        : 07.04.2004
// Descricao   : Não aplicar percentual de concessao de beneficio provisorio
//--------------------------------------------------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Gleyber
// Pendência   : 16276
// Data        : 30/03/2004
// Descricao   : Inclusão da função ExecutaRegraPlanPrevContab para gravação do
//               IDPLANPREVCONTAB da BENEFBFCIARIO
//--------------------------------------------------------------------------------------------------
// Rotina    : bbtnElegibilidadeClick
// Autor(a)  : Augusto
// Data      : 30/03/2004
// Descrição : Passar FlgPossuiacmpo para regra de Elegibilisade
// -----------------------------------------------------------------------------
// Rotina    : CalculaReservaParaBeneficio
// Autor(a)  : Gleyber
// Data      : 29/03/2004
// Pendência : 16283
// Descrição : Verifica se há alguma coisa em cache e descarta para fazer nova
//             verificação.
// -----------------------------------------------------------------------------
// Rotina    : Varias
// Autor(a)  : Augusto
// Data      : 23/03/2004
// Descrição : Acerto no controle do componente de Acompanhante (dbrgrpPossuiAcompINSS)
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 23/01/2004
// Pendência : 15983
// Descrição : Inclusão de um Commit final para simulação a fim de evitar travamento
//             no banco.
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 15/01/2004
// Pendência : 15945
// Descrição : Acerto na atribuição de valor para a query de detalhe.
// -----------------------------------------------------------------------------
// Rotina    : reValorBeneficioBtnClick
// Autor(a)  : Gleyber
// Data      : 09/01/2004
// Pendência : 15757
// Descrição : Acerto na funcionalidade de transformar o valor do benefício de
//             real para cotas.
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 06/01/2004 (My Birthday !!!)
// Pendência : 15091
// Descrição : Implementando funcionalidade para realizar a movimentação de reservas
//             em um outro momento.
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Gleyber
// Data      : 12/12/2003
// Pendência : 15793
// Descrição : Acréscimo da linha VALOR DO BENEFÍCIO ORIGINAL no demonstrativo.
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Gleyber
// Data      : 07/11/2003
// Pendência : 15153
// Descrição : Starta uma transação para quando se tratar de uma simulação.
// -----------------------------------------------------------------------------
// Rotina    : reValorBeneficioBtnClick
// Autor(a)  : Camille
// Data      : 29/10/2003
// Pendência : 14851
// Descrição : Inclusão de parâmetro para passar a data final do beneficio na
//             função EXECUTACALCULOREGRA
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Gleyber
// Data      : 28/10/2003
// Pendência : 15521
// Descrição : Inserido um Next na MovReservaTemp para não ficar em loop.
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Gleyber
// Data      : 23/10/2003
// Descrição : Inibida o delete na MOVRESERVATEMP (REFER).
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Augusto
// Data      : 20/1O/2003
// Descrição : Inclusão do IDSITBENEFICIO = 6 na pesquisa dos processos a conceder
// -----------------------------------------------------------------------------
// Rotina    : ExecutaRegraDataPgtoBeneficio
// Autor(a)  : Ricardo Vigorito
// Data      : 15/1O/2003
// Descrição : Incluir o campo DATAREQUERIMENTO  para query de executa a data
// do pagamento do benefício
// -----------------------------------------------------------------------------
// Rotina    : CalculaReservaParaBeneficio
// Autor(a)  : Leo
// Data      : 09/1O/2003
// Descrição : acrescentei na query de cálculo do valor da reserva, o campo de
//             último recebimento de contribuição, que pelo regulamento da Funcef deve
//             ser usado para apurar a idade do participante para resgate de contribuições.
// -----------------------------------------------------------------------------
// Rotina    : bbtnOkDetClick
// Autor(a)  : Leo
// Data      : 09/1O/2003
// Descrição : crítica da data de requerimento, levando em conta o caso de resgate,
//             onde a data de requerimento pode ser menor que a data de evento
// -----------------------------------------------------------------------------
// Rotina    : bbtnOpcoesClick
// Autor(a)  : Augusto
// Data      : 26/09/2003
// Descrição : Atualização do campo FLGACEITAZERO na QryDet
// -----------------------------------------------------------------------------
// Rotina    : bbtnOpcoesClick
// Autor(a)  : Augusto
// Data      : 20/09/2003
// Descrição : Inclusão do Valor do SRB no calculo do da opcoao (PBA)
// -----------------------------------------------------------------------------
// Rotina    : qryDetAfterInsert
// Autor(a)  : Leo
// Data      : 18/09/2003
// Descrição : chamada da função limpavariáveis do regras
// -----------------------------------------------------------------------------
// Rotina    : CalculaReservaParaBeneficio
// Autor(a)  : Leo
// Data      : 30/08/2003
// Descrição : alterações na rotina para ler a reserva abatida após
//             processamento
// -----------------------------------------------------------------------------
// Rotina    : reValorCalcInssBtnClick
// Autor(a)  : Leo
// Data      : 30/08/2003
// Descrição : tratamento do ValorInfInss para passar para a função ExecutaRegraCalculoINSS
// -----------------------------------------------------------------------------
// Rotina    : reValorBeneficioBtnClick
// Autor(a)  : Gleyber
// Data      : 20/08/2003
// Pendência : 14851 e 14863
// Descrição : Inclusão de parâmetro para passar a data final do beneficio na
//             função EXECUTACALCULOREGRA (14851) e RODAPADRAOMOVRESERVA (14863)
// -----------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 25/07/2003
// Alteração   : Criação de campos para controlar a entrada de valores para os
//  campos  Valor SRB e Valor do Benefício. Mesmo se houver regra associada.
// Pendência   : 14645
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//--------------------------------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Augusto
// Data      : 23/06/2003
// Alteração : Atualização dos acertos para o Lote da concessão, não filtra mais
//             por NumeroProcesso
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 20.06.2003
// Alteração   : Criação do campo FLGTIPOGRAVAINSS com parametro do plano
//--------------------------------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Camille
// Data      : 06.05.2003
// Alteração : Tratamento de acertos feitos pelo encerramento de outros beneficios
//             Pendencia 13879
//--------------------------------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Camille
// Data      : 28.04.2003
// Alteração : Retirada do if bOK
//--------------------------------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Gleyber
// Data      : 24/04/2003
// Alteração : Liberação do campo VALOR TOTAL para digitação
//--------------------------------------------------------------------------------------------------
// Rotina    : AbreQryBeneficio
// Autor(a)  : Augusto
// Data      : 07/04/2003
// Alteração : Inclusao do campo CODBENEFICIO
//--------------------------------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficioCloseUp
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : caso o benef. do INSS seja requerido separadamente, este está com
//             outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
//             caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
//--------------------------------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficioCloseUp
// Autor(a)  : Carlos Guedes
// Data      : 25/03/2003
// Alteração : Desabilitando campo Data Final na caso do benef. ter pagto. vitalício
//          Pend: 13115
//--------------------------------------------------------------------------------------------------
// Rotina    : AbreRequerParticip
// Autor(a)  : Gleyber
// Data      : 11/02/2003
// Alteração : Alteração para criação de um novo tipo chamador - AV (Altera Valor)
//--------------------------------------------------------------------------------------------------
// Rotina    : VerificaNumeroDependentes
// Autor(a)  : Camille
// Data      : 06.02.2003
// Alteração : Se a fundacao parametrizou que utilizara o calculo automatica de numero
//             de dependentes, entao nao atualizar por esta rotina abaixo
//--------------------------------------------------------------------------------------------------
// Rotina    : reValorInfINSSExit
// Autor(a)  : Camille
// Data      : 05.02.2003
// Alteração : Se valor informado diferente do calculado ficar vermelho
//--------------------------------------------------------------------------------------------------
// Rotina    : Controle de Divida Previdenciária
// Autor(a)  : Augusto
// Data      : 15/01/2003
// Alteração : beneficio de Referencia quando é pago pela fundação não pode estar
//             no mesmo processo do beneficio da Fundação
//--------------------------------------------------------------------------------------------------
// Rotina    : Controle de Divida Previdenciária
// Autor(a)  : Augusto
// Data      : 14/01/2003
// Alteração : Retirado este controle do processo, variavel bPossuiDivPrevid estará sempre False
//--------------------------------------------------------------------------------------------------
// Rotina    : ChamaPreparoDeContribuicao
// Autor(a)  : Camille
// Data      : 07.01.2003
// Alteração : Comentar chamada ao calendário pois não o utiliza para nada
//--------------------------------------------------------------------------------------------------
// Rotina    : PreparaBeneficioConcedido
// Autor(a)  : Gleyber
// Data      : 16/12/2002
// Alteração : Verifica se beneficio é de referencia e muda a data passada para
//             a funcao
//--------------------------------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Leo  (leofuncef)
// Data      : 05/12/2002
// Alteração : habilitar e desabilitar campos para tornar possível benefício
//             provisórivo do INSS
//--------------------------------------------------------------------------------------------------
// Rotina    : Varias
// Autor(a)  : Augusto
// Data      : 04/12/2002
// Alteração : Novos parametros na chamada da funcão ExecutaRegraDataPgtoBeneficio
//--------------------------------------------------------------------------------------------------
// Rotina    : AtualizaEventosPrev
// Autor(a)  : Gleyber
// Data      : 03/12/2002
// Alteração : Alteração para gravar na EVENTOSPREV somente quando FLGEFETIVADO <> 1
//             migrou
//--------------------------------------------------------------------------------------------------
// Rotina    : Gravação do Plano de Origem
// Autor(a)  : Camille
// Data      : 03.12.2002
// Alteração : Alteração para gravar no plano de origem o plano do qual o participante
//             migrou
//--------------------------------------------------------------------------------------------------
// Rotina    : TestaQuitacaoDividas
// Autor(a)  : Camille
// Data      : 20.11.2002
// Alteração : Habilitacao da rotina de Baixa Automatica de Empéstimo
//             ATENCAO : As rotinas InicializaEP e FinalizaEP
//             devem ser colocadas no FormShow e FormClose (antes do inherited)
//--------------------------------------------------------------------------------------------------
// Rotina    : ChamaPreparodeContribuicao
// Autor(a)  : Leo
// Data      : 16/10/2002
// Alteração : acrescentei a cláusula (CP.FLGCOBRA = 1 AND) no SQL que será passado
//             para a query qryContrib
//--------------------------------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Gleyber
// Data      : 30/09/2002
// Alteração : Aplicar valor default ao dbrgrpPossuiAcompINSS
//--------------------------------------------------------------------------------------------------
// Rotina    : dbedNumProcINSSExit
// Autor(a)  : Leo
// Data      : 24/09/2002
// Alteração : valida número do processo
//--------------------------------------------------------------------------------------------------
// Rotina      : CmeCadastroEdit
// Autor(a)    : Camille
// Data        : 24.09.2002
// Alteração   : Se o beneficio estiver pendente de concessao, permitir alterar dados
//--------------------------------------------------------------------------------------------------
// Rotina      : EfetuaConcessao
// Autor(a)    : Carlos
// Data        : 16/09/2002
// Alteração   : Comentada função AcertaBeneficioINSS
//--------------------------------------------------------------------------------------------------
// Rotina      : TestaQuitacaoDividas
// Autor(a)    : Leo
// Data        : 12.09.2002
// Alteração   : mudança dos nomes e parâmetros das fnções de integração com empréstimo
//--------------------------------------------------------------------------------------------------
// Rotina      : GravaBeneficioDeReferencia;
// Autor(a)    : Carlos
// Data        : 10/09/2002
// Alteração   : No caso de benefício do INSS que for apenas de REFERÊNCIA, usar a
//      DATAINICIO do beneficio de suplementação, pois se alterar a data de pagto. da
//      supl., a DATAINICIO do INSS fica diferente.
//      Léo, eu crie uma função EApenasReferencia que vc deve copiar.  (apagar aesta linha depois)
//--------------------------------------------------------------------------------------------------
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Carlos
// Data        : 09/09/2002
// Alteração   : Passando data do início do INNS correta pra função PreparaBeneficioConcedido
//--------------------------------------------------------------------------------------------------
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Carlos
// Data        : 14.08.2002
// Alteração   : Preparar o beneficio do INSS antes do beneficio de suplementacao
//               pois se houver reajuste do INSS a suplementação já tem que buscar
//               este valor reajustado
//--------------------------------------------------------------------------------------------------
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Camille
// Data        : 14.08.2002
// Alteração   : Preparar o beneficio do INSS antes do beneficio de suplementacao
//               pois se houver reajuste do INSS a suplementação já tem que buscar
//               este valor reajustado
//--------------------------------------------------------------------------------------------------
// Rotina      : CriaLogOcorrencia
// Autor(a)    : Camille
// Data        : 13.08.2002
// Alteração   : Gravação do Lote da Movimentacao de Beneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : ConfirmarDetalhe
// Autor(a)    : Camille
// Data        : 13.08.2002
// Alteração   : Permitir valor zerado de beneficio, se assim estiver parametrizado
//               no cadastro de beneficioxplano
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 12.08.2002
// Alteração   : Preencher variavel iIdBenefReferencia para concessao do INSS
//--------------------------------------------------------------------------------------------------
// Rotina      : ExecutaRegraBeneficioMinimo
// Autor(a)    : Camille
// Data        : 01.08.2002
// Alteração   : Acréscimo do campo ValorSRB na query de calculo
//--------------------------------------------------------------------------------------------------
// Rotina      : qryBeneficioAfterScroll/dblkpcmbBeneficioCloseUp/qryDetAfterScroll
// Autor(a)    : Carlos Guedes
// Data        : 16/07/2002
// Alteração   : Caso benefício do INSS torna invisível grpInfSupl ( Informações da Suplementação )
//               Atribuir o valor do Inf. do INSS ao valor do benefício.
//               Pendência:5718
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Carlos Guedes
// Data        : 12/07/2002
// Alteração   : Atualizando DATAFINAL na CONTRIBPREVPARTP
//--------------------------------------------------------------------------------------------------
// Rotina    : ExecutaRegraDataPgtoBeneficio
// Autor(a)  : Camille
// Data      : 10.07.2002
// Alteração : Adicionei o parâmetro piIdPessoa para poder executar a regra por
//             beneficiario no caso de beneficio para beneficiarios
//--------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask,  wwdblook, ShellApi,

  fTipoBenefConcede,dRelRetroRegional,dRelatorios, dRelatAdmPrev,
  dRelatGerencial,  dRelTempoServicoMT,
  dRelatEspecificos, dRelTransfPlano, fCadRequerBenefPensionista,fCadRequerBenefBfciario,

  RDemonstraConcessao,            // edilaine - SOL 253577-17464 / PPM 955703
  RDemonstraConcessaoINSS,        // edilaine - SOL 253577-17464 / PPM 955703
  FMostraContribuicoes,           // edilaine - SOL 253577-18094 / PPM 1269549

  TREdit, MskEdDlg, TEdNum, wwdbedit, IvDictio, IvMulti, IvEMulti,
  FCadastroCS, ppTypes, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, DBGrids, FPreview{$IFNDEF VERSAO0505 }, UCMTypes,
  
  ppComm, ppEndUsr, DBClient, uCMClientDataSet {$ENDIF}, 
  UBeneficio;  //edilaine - SIG55933

const VetDescBeneficio : array[1..7] of string =
                      ('Normal', 'Retido','Encerrado','Pendente de Concessão',
                       'Encerrado por Morte do Beneficiário','Não Concedido',
                       'Concedido em exigência');

type
  TTipoCalculo = (tcViaDeficit, tcViaValorTotal);                                 // edilaine - SOL 253577-17464 / PPM 955703
  TTipoConfiguacaoTela = (ctConcessaoViaRequerimento, ctDesfazRequerimento);      // edilaine - SOL 253577-18129 / PPM 1303078

  TfrmCadRequerBenefParticip = class(TfrmCadMestreDetalheCS)
    qryEvento: TwwQuery;
    qryBeneficio: TwwQuery;
    qryTpPgtoBenef: TwwQuery;
    Label12: TLabel;
    dblkpcmbEvento: TwwDBLookupCombo;
    Label5: TLabel;
    dtDataEvento: TCMDateTimePicker;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryAux: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryTitular: TwwQuery;
    qrySalarios: TwwQuery;
    qryContribuicoes: TwwQuery;
    dsSalarios: TwwDataSource;
    dsContribuicoes: TwwDataSource;
    bbtnProcurar: TBitBtn;
    qryBfciarioTitPlan: TwwQuery;
    updBfciarioTitPlan: TUpdateSQL;
    bbtnElegibilidade: TBitBtn;
    bbtnOpcoes: TBitBtn;
    qryBenefReferencia: TwwQuery;
    updBenefReferencia: TUpdateSQL;
    lblNomeBenef: TLabel;
    qryFolha: TwwQuery;
    qryContrib: TwwQuery;
    qryPortForma: TwwQuery;
    qryMovReservaTemp: TwwQuery;
    updMovReservaTemp: TUpdateSQL;
    qryReservaPart: TwwQuery;
    updReservaPart: TUpdateSQL;
    qryBenefAUX: TwwQuery;
    updBenefAUX: TUpdateSQL;
    qryContaBancaria: TwwQuery;
    qryReajINSS: TwwQuery;
    qryTemporaria: TwwQuery;
    qryAgenciaResgate: TwwQuery;
    dsPortForma: TwwDataSource;
    qryContribuicao: TwwQuery;
    qryRelBenefPart: TwwQuery;
    updRelBenefPart: TUpdateSQL;
    sbtnConceder: TToolbarButton97;
    qryBenefGrupo: TwwQuery;
    sbtnImprimirSimulacao: TToolbarButton97;
    bbtnOutrasInformacoes: TBitBtn;
    sbtnConcedeUm: TToolbarButton97;
    sbtnCadContaCorrente: TToolbarButton97;
    DataSource1: TDataSource;
    qryResMatematica: TwwQuery;
    updResMatematica: TUpdateSQL;
    lblNumProcesso: TLabel;
    lblSitProcesso: TLabel;
    qrySelecionaBenefRef: TwwQuery;
    qryDetNUMEROPROCESSO: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPLANOORIGEM: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetIDBENEFREFEREN: TFloatField;
    qryDetCODPORTFORMA: TFloatField;
    qryDetIDSITBENEFICIO: TFloatField;
    qryDetIDDEPENDENCIA: TStringField;
    qryDetIDTPPAGTOBENEFIC: TFloatField;
    qryDetVALORATUAL: TFloatField;
    qryDetDATAREQUERIMENTO: TDateTimeField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetFLGFORMAPAGTO: TStringField;
    qryDetVALORCALCULADO: TFloatField;
    qryDetDATAULTREAJUSTE: TDateTimeField;
    i: TFloatField;
    qryDetVLRINFINSS: TFloatField;
    qryDetDATAINICIOINSS: TDateTimeField;
    qryDetNUMPROCINSS: TStringField;
    qryDetDATAINICIOFUND: TDateTimeField;
    qryDetVALORCOTAS: TFloatField;
    qryDetDATACONCESSAO: TDateTimeField;
    qryDetFLGPROVISORIO: TFloatField;
    qryDetPERCPROVISORIO: TFloatField;
    qryDetPRAZOPROVISORIO: TFloatField;
    qryDetULTMESREAJUSTE: TStringField;
    qryDetULTVALORATUALREAJ: TFloatField;
    qryDetIDAGENCIARESGATE: TFloatField;
    qryDetDATAFINALPREVISTA: TDateTimeField;
    qryDetFLGDATAPREVISTA: TFloatField;
    qryDetFLGTIPOINSS: TFloatField;
    qryDetDIBBENEFANT: TDateTimeField;
    qryDetVALORBENEFANT: TFloatField;
    qryDetVALORBINSSANT1: TFloatField;
    qryDetVALORBINSSANT2: TFloatField;
    qryDetVALORBINSSANT3: TFloatField;
    qryDetVALORTOTAL: TFloatField;
    qryDetFLGPOSSUIACOMPINSS: TFloatField;
    qryDetFLGBENEFMIN: TFloatField;
    qryDetVALORSRB: TFloatField;
    qryDetFLGREFERENCIA: TFloatField;
    qryDetNUMORDEMEVENTO: TFloatField;
    qryDetNOME: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetFLGRESGATE: TFloatField;
    qryDetVALORBASE1: TFloatField;
    qryDetVALORBASE2: TFloatField;
    qryDetVALORBASE3: TFloatField;
    qryDetIDRUBSALAUXDOENCA: TFloatField;
    qryDetFLGACEITAZERO: TFloatField;
    sbtnDemonsSRB: TToolbarButton97;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    updContabil: TUpdateSQL;
    Panel1: TPanel;
    lblDescNome: TLabel;
    lblNome: TLabel;
    lblDescMatricula: TLabel;
    lblMatricula: TLabel;
    dsSelecionaBenefRef: TwwDataSource;
    dsBeneficio: TwwDataSource;
    DSTESTE: TDataSource;
    DBGrid1: TDBGrid;
    qryDetFLGMOVRESAPOSCONC: TFloatField;
    qryDetFLGMOVEURESERVA: TFloatField;
    qryDetIDPLANPREVCONTAB: TFloatField;
    qryDetUSUARIOALT: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    qryDetPLACONTAD: TStringField;
    qryDetPLACONTAC: TStringField;
    qryDetVALORNADIB: TFloatField;
    qryDetFLGBENEFTEMP: TFloatField;
    qryDetFLGPAGAINSS: TFloatField;
    qryEPP: TwwQuery;
    dsBfciarioTitPlan: TwwDataSource;
    qryDetIDRESPONNAOREC: TFloatField;
    MontaSelectEPP: TMontaSelect;
    qryDetIDCALCULO: TFloatField;
    QryPlanoContabInss: TwwQuery;
    qryUpdPlanoContab: TwwQuery;
    qryUpdAux: TwwQuery;
    qryAux2: TwwQuery;
    qryDetPERCRETENCAO: TFloatField;
    qryDetFLGPECULIO: TFloatField;
    qryDetAux: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    FloatField9: TFloatField;
    StringField2: TStringField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField3: TStringField;
    FloatField23: TFloatField;
    StringField4: TStringField;
    FloatField24: TFloatField;
    DateTimeField7: TDateTimeField;
    StringField5: TStringField;
    DateTimeField8: TDateTimeField;
    FloatField25: TFloatField;
    StringField6: TStringField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    DateTimeField9: TDateTimeField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    LblAlterador: TLabel; // SOL 132938
    DbLAlterador: TwwDBLookupCombo; // SOL 132938
    qryIncluiAlterador: TwwQuery;  // SOL 132938
    QryAlteradorCorrecao: TwwQuery; // SOL 132938
    QryFatorAtualizacao: TwwQuery; // SOL 132938
    qryDetIDREGRAPAGAMENTO: TFloatField;
    qryDetSALDOCONTADIB: TFloatField;
    qryDetRESERVADIB: TFloatField;
    qryDetINDICEDIB: TFloatField;
    QryBuscaIndice: TQuery;
    updBfciarioTitPlanAux: TUpdateSQL;
    qryBfciariotitPlanAux: TwwQuery;
	qryDetQTDEPARCELAS: TFloatField;
    qryDetRESGATEPARCELADO: TFloatField;
    qryDetIDRUBRICA: TFloatField;
    qryUser: TwwQuery;
    qryDetTIPOBENEFICIO: TFloatField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryDetFLGISENTOIRRF: TFloatField;
    qryDetFLGISENTOIRRFANT: TFloatField;
    Label21: TLabel;
    Label15: TLabel;
    lblBenefReferencia: TLabel;
    lblCodFundacao: TLabel;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    grpInfINSS: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    lblValorCalcInss: TLabel;
    lblValorInfINSS: TLabel;
    Bevel1: TBevel;
    dbedNumProcINSS: TwwDBEdit;
    dtInicioINSS: TCMDateTimePicker;
    reValorCalcInss: TcmMaskEditDlg;
    reValorInfINSS: TEditNum;
    DbChbPossuiAcomp: TDBCheckBox;
    DbChbPossuiConvenio: TDBCheckBox;
    dbrgrpPossuiAcompINSS: TDBRadioGroup;
    dtDataRequerimento: TCMDateTimePicker;
    dblkpcmbBenefReferencia: TwwDBLookupCombo;
    edCodFundacao: TStaticText;
    grpInfSupl: TGroupBox;
    lblSRB: TLabel;
    lblValorBenef: TLabel;
    lblDeficit: TLabel;
    pnlNaoBenefProv: TPanel;
    lblDIB: TLabel;
    Label8: TLabel;
    dtInicioFund: TCMDateTimePicker;
    pnlBenefProv: TPanel;
    lblPercConc: TLabel;
    lblPrazoProv: TLabel;
    lblMesProv: TLabel;
    lblPercent: TLabel;
    dbrgrpBenefProvisorio: TDBRadioGroup;
    dbedPercConc: TwwDBEdit;
    dbedPrazoProv: TwwDBEdit;
    dbedPercContrib: TRealEdit;
    reValorSRB: TcmMaskEditDlg;
    reValorBeneficio: TcmMaskEditDlg;
    pnlBSFAB: TPanel;
    lblFABTot: TLabel;
    lblBSTot: TLabel;
    reValorFAB: TcmMaskEditDlg;
    reValorBS: TcmMaskEditDlg;
    reValorDeficit: TcmMaskEditDlg;
    PnlTempoContribuicao: TPanel;
    Label7: TLabel;
    LbTempoContribuicao: TLabel;
    lblQdeParcelas: TLabel;
    grpPagamento: TGroupBox;
    Label16: TLabel;
    lblDataFinal: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    lblAgencia: TLabel;
    lbEPP: TLabel;
    spbEPP: TSpeedButton;
    dbrgrpDataPrevista: TDBRadioGroup;
    dtDataInicio: TCMDateTimePicker;
    dtDataFinal: TCMDateTimePicker;
    dblkcmbTpPgtoBenef: TwwDBLookupCombo;
    dbrgFlgFormaPagto: TDBRadioGroup;
    dblkpcmbPortForma: TwwDBLookupCombo;
    dblkpcmbAgencia: TwwDBLookupCombo;
    dblkcbEPP: TwwDBLookupCombo;
    dbedQtdeParcelas: TwwDBEdit;
    dbrgrpResgateParcelado: TDBRadioGroup;
    qryDetVLRBSTOTAL: TFloatField;
    qryDetVLRBSATUAL: TFloatField;
    qryDetVLRFABTOTAL: TFloatField;
    qryDetVLRFABATUAL: TFloatField;
    qryDetVLRBASEDEFICIT: TFloatField;
    qryDetBSDIB: TFloatField;
    qryDetFABDIB: TFloatField;
    DbChbBenef142: TDBCheckBox;
    qryDetBENEFLEI142: TFloatField;
    qryDetIDPERFILINVEST: TFloatField;
    //qryCarregarConc: TwwQuery;

    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure reValorBeneficioBtnClick(Sender: TObject);
    procedure qryBeneficioAfterScroll(DataSet: TDataSet);
    procedure reValorCalcInssBtnClick(Sender: TObject);
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbEventoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnElegibilidadeClick(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reValorCalcInssExit(Sender: TObject);
    procedure reValorInfINSSExit(Sender: TObject);
    procedure sbtnConcedeUmClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dtInicioFundExit(Sender: TObject);
    procedure dtDataInicioExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure reValorBeneficioMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure reValorBeneficioExit(Sender: TObject);
    procedure dbrgrpBenefProvisorioClick(Sender: TObject);
    procedure dbedPrazoProvExit(Sender: TObject);
    procedure reValorInfINSSEnter(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbrgrpBenefProvisorioEnter(Sender: TObject);
    procedure dbrgrpBenefProvisorioExit(Sender: TObject);
    procedure sbtnConcederClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbrgrpDataPrevistaClick(Sender: TObject);
    procedure sbtnImprimirSimulacaoClick(Sender: TObject);
    procedure bbtnOutrasInformacoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryBenefAUXAfterInsert(DataSet: TDataSet);
    procedure sbtnCadContaCorrenteClick(Sender: TObject);
    procedure reValorSRBBtnClick(Sender: TObject);
    procedure dtInicioINSSExit(Sender: TObject);
    procedure sbtnDemonsSRBClick(Sender: TObject);
    procedure dbedNumProcINSSExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure dbrgrpPossuiAcompINSSChange(Sender: TObject);
    procedure qryDetAfterEdit(DataSet: TDataSet);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure DbChbPossuiAcompClick(Sender: TObject);
    procedure dblkpcmbBeneficioChange(Sender: TObject);
    procedure spbEPPClick(Sender: TObject);
	procedure DbLAlteradorKeyPress(Sender: TObject; var Key: Char);
	procedure qryDetRESGATEPARCELADOValidate(Sender: TField);
    procedure dbrgrpResgateParceladoChange(Sender: TObject);
    procedure qryDetQTDEPARCELASValidate(Sender: TField);
    procedure CalculaDias;//Higor Nayde Ferreira SOL 153770/7741 KTN 1622372
    procedure ConcederOK;
    procedure CriaDataModule;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure reValorFABBtnClick(Sender: TObject);
    procedure reValorBSBtnClick(Sender: TObject);
    procedure pnlBSFABEnter(Sender: TObject);
    procedure reValorFABKeyPress(Sender: TObject; var Key: Char);
    procedure reValorBSKeyPress(Sender: TObject; var Key: Char);
    procedure reValorDeficitKeyPress(Sender: TObject; var Key: Char);
    procedure reValorSRBKeyPress(Sender: TObject; var Key: Char);
    procedure reValorDeficitBtnClick(Sender: TObject);
    procedure dblkpcmbBeneficioExit(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
  private
    { Private declarations }
    sBeneficioAnterior  : String; //Vinicius Ferreira SOL 157583 Kintana 1269810
    iContClick          : integer;
    iIdUsuarioAutoriza  : longint;
    bAtivo, bApagaProcesso : boolean; //edilaine - SOL 253577-17464 / PPM 955703
    OperacaoDetalhe     : TOperacao;
	
    sAnoMesAtualCalcAlt   : string; // SOL 232043 PPM 396781
    sAnoMesRefAux: String; // SOL 232043 PPM 396781

    iIdLoteConcessao    : longint;
    sAnoMesPagamento    : string;
    sdataInicioConcessao : string; // Wylliam Leite da Silva - SOL 167480 KINTANA 1519761

    //lstDadosCorrecao : TStringList;     // edilaine - SOL 253577-17464 / PPM 955703   // edilaine - SOL 262968 / PPM 1102753 - comentado
    sParametrosDemonstra : string;      // edilaine - SOL 253577-17464 / PPM 955703

    sNumeroProcessoAntesGravar : string;
    slstProcessosNovos : string;        // edilaine - SOL 253577-18094 / PPM 1269549

    iIdCalculo,
    iNumeroProcesso,       iIdTitular,               iIdPessJur,
    iIdPlanoPrev,          iSeqProposta,             iIdSitPart,
    iIdSitFunc,            iIdSitPlanoPrev,          iIdBenefReferencia    : longInt;
    iIdEvento : integer;

    // Dados do INSS para preencher caso ja tenha sido requerido
    sNumProcINSS, sValorCalcINSS, sValorInfINSS, sDataInicioINSS,
    sValorBase1INSS, sValorBase2INSS, sValorBase3INSS, sFlgPagaINSS : string;


    // Variavies globais para utilizacao na geracao de beneficios de um mesmo grupo
    bInserindoGrupo : boolean;

    sValorReserva   : string;

    bChamarConcessao : boolean;     // edilaine - SOL 253577-18129 / PPM 1303078

    // Variaveis para controlar validacoes necessárias na concessao
    bCobraContribAtrasada,
    bDevolveContrib,
    bNAOConcedeuBeneficio,
    bConcedeuBeneficio : boolean;

    iProvisorioAntes : longint;
    bRecalculouProvisorio,
    bReajustouINSS,
    bAbriuOutroForm,
    bConcedeBeneficio,     bPossuiDivPrevid,         bPossuiDivAssist,
    bPossuiDivEmprest,     bExecutouRegraConcessao,  bQueryTitular,
    bQuerySalarios,        bQueryContribuicoes,      bGravaBenefReferencia,
    bPreparaContrib13INSS, // variavel auxiliar apenas para passar para funcao PreparaBeneficioConcedido
    bPreparaContrib13                                                      : boolean;


    dValorSRB : double;
    rValorReal,            rValorCotas,              rValorDaCotaBenef,
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcaoGrupo1,          rOpcaoGrupo2,             rOpcaoGrupo3               : real;
    rCampoTexto1,rCampoTexto2,rCampoTexto3 : String;

    // edilaine - SOL 253577-17374 / PPM 848182 - inicio
    bFlgApresentaDeficit,
    bFlgApresentaBSFAB   : boolean;
    // edilaine - SOL 253577-17374 / PPM 848182 - fim

    sValorINSSAntes, sValorINSSDepois,
    sNumerosProcessos,

    sDataDaCotaBenef,
    sTipoFormChamador, // EV - Evento, CO - Concessao, SI - Simulacao
    sDataEvento,
    sDataRequerimento,
    sFlgTpDemissao,
    sDataFinalEvento,
    sFlgInternoSitPart,
    sTipoSitFuncAntes,
    sFlgInternoAntes,
    sFlgInternoDepois,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartDepois,
    sIdSitPlanDepois,
    sIdSitFuncDepois,
    sMatricula,            sNomeTitular,             sNomePatro,
    sNomePlano,            sDataDemissao,            sNomeSitPart,
    sNomeSitFunc,          sNomeSitPlano                                   : string;

    sTempoServAnoAntes,    sTempoServMesAntes,       sTempoServDiaAntes         : string;

    iFlgIncluiMesConc : integer;

    sDataPagamentoLote : string;
    sDataAlimentacao   : String; // Renato Visoni SOL 124583 Kintana 633547
    sSQL : String;  // SOL 132938
    sIdContribuicaoAlteradores: String; //SOL132938 BRUNO

    bAtualizaDados : Boolean;

    sDataInicioRef : String;

    iFlgEmprestimo : Integer;

    //edilaine - SIG55933 - inicio
    PerfilAtual    : TRecPerfilInv;
    PerfilAnterior : TRecPerfilInv;
    bPerfilAtivo   : Boolean;
    //edilaine - SIG55933 - fim


    bResgateRegReplan: boolean; //Thiago Passos 97577 Kintana 424749
    pTempVincFunc : Integer;
    Function CalculaAlteradores(pcTipo : Char;
                                psAnoMesRef : String;
                                pdValorCalculo : Double;
                                Var dValorTotalAlteradores : Currency;
                                piIdContribuicao : Integer = -1;
                                piNumLancamento  : LongInt = -1;
                                piflgevento : LongInt = -1): Boolean; // SOL 132938

    procedure InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                      QryDados       : TwwQuery;
                                      psAnoMesRef    : String;
                                      pdValor        : Double;
                                      piNumLancamento : LongInt = -1 ); // SOL 132938

    procedure SelecionaProcesso(piNumeroProcesso : longint);
    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure PreencheSalarios(piIdTitular, piIdPessJur  : longInt);
    procedure PreencheContribuicoes(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure GravaBeneficioDeReferencia;
    procedure SelecionaReservaPart;
    procedure AtualizaEventosPrev(iIdPessJur,   iIdPlanoPrev, iIdPessoa,
                                  iSeqProposta, iIdEventoGerador : Integer;
                                  psDataVolta : string);

    function  ConverteBeneficioParaCotas( prValorReal : real) : real;
    function  ConverteBeneficioParaReal ( prValorCotas: real ; bEntra : Boolean = False) : real;

    function  TestaQuitacaoDividas : boolean;
    function  ChamaPreparoDeContribuicao(piIdPessJur, piIdPlanoPrev,
                                  piIdTitular, piSeqProposta, piNumeroProcesso : longInt;
                                  psMatricula,
                                  psDataEvento,
                                  psDataFinal,
                                  sValorBenef : string)            : boolean;
    function  VerificaCamposObrigREGRA                             : boolean;
    function  VerificaBeneficioObrigatorio                         : boolean;
    function  VerificaBeneficioRepetido                            : boolean;
    function  VerificaNumeroDependentes                            : boolean;
    function  VerificaContribAtrasada (var sMesAtraso : string)    : boolean;
    function  VerificaContribPosterior(var sMesPosterior : string) : boolean;

    procedure AjustaTela;                               // edilaine - SOL 253577-17374 / PPM 848182
    function  VerificaOpcoesObrigatorias : boolean ;    // edilaine - SOL 253577-17374 / PPM 848182

    function  AssociaTaxas(bApresentaResumo : boolean = true) : boolean;         // edilaine - SOL 253577-18094 / PPM 1269549

    function  CalculaReservaParaBeneficio ( piIdBeneficio,
                                            piIdRegraReserva,
                                            piFlgResgate           : longint )  : double;

    //function  AtualizaReservaPart ( piIdBeneficio : longint ) : boolean; //SIG84530
    function  AtualizaReservaPart ( piIdBeneficio : longint; bAtualiza: boolean = True ) : boolean;//SIG84530

    function  CalculaSaldoRealCont ( piIdTipoReserva : integer;
                                     pdVlMovReal : double)         : double;
    function  DevolveReserva       ( piIdBeneficio   : longint; bApagaMovTemp : boolean )   : boolean;
    function  MontaSQLBenefAssoc   ( piNumOrdem  : longint)        : string;
    function  ConfirmaBeneficio                                    : boolean;
    function  CobraContribAtrasada ( piIdPessJur, piIdPlanoPrev,
                                     piIdPessoa,  piSeqProposta    : longint;
                                     psDataInicioFund : string)    : boolean;

    function  VerificaQuantBenefProcesso ( NumeroProcesso : string)    : Integer; //edilaine - SOL 253577-17464 / PPM 955703

    function  DeleteProcessoBenef ( NumeroProcesso : string)    : boolean; //edilaine - SOL 253577-17464 / PPM 955703

    procedure MostraDemonstrativoConcessao(const homologado :Boolean = False; const HoraHomologacao: String = ''); //Higor Nayde SOL - 173938 KINTANA - 1627112

    procedure GeraDemonstrativo(const HoraHomologacao: String = '');  // edilaine - SOL 253577-17464 / PPM 955703
    procedure CalculaValorTotalBenef(tTipoCalculo : TTipoCalculo;             // edilaine - SOL 253577-17464 / PPM 955703
                                     bRequererJudicial : boolean = false);    //edilaine SIG135838

    function  AtualizaSitParticipante(piIdPessJur, piIdPlanoPrev,
                                      piIdPessoa,  piSeqProposta,
                                      piIdEventoGerador : longint): boolean;

    function EfetuaConcessao(iIdSitEscolhida : word;
                             var rValorAtualizado,
                                 rValorAtualizadoINSS : double;
                             var sUltMesReajuste,
                                 sUltMesReajusteINSS  : string;
                             var bErro                : boolean ) : word;

    procedure CalculaBeneficioGrupo( piIdBeneficio, piIdRegraCalculo,
                                     piIdRegraReserva,
                                     piIdRegraSRB,
                                     piNumOrdemEvento : longint;
                                     psNomeBeneficio  : string;
                                     piFlgResgate,
                                     piNumOpcoes,
                                     piIdTpPagtoBenef       : longint ) ;

    function ConcedeUmBeneficio ( Sender : TObject; piIdSitBenef : integer ): boolean;

    procedure AbreQryBeneficio( bConsideraGrupo : boolean;
                                piIdEventoGerador, piIdPlanoPrev : longint ) ;


    Function EApenasReferencia(pIdPlanoPrev, pIdBeneficio: Integer): Boolean;

    procedure DeletaBfciarioTitPlan(piIdNumeroProcesso :Integer);   // edilaine - SOL 253577-17464 / PPM 955703

    procedure ConfiguraAcessosTela(tTipoAjuste : TTipoConfiguacaoTela);  // edilaine - SOL 253577-18129 / PPM 1303078

    //Ádler Souza - SOL 132110 KINTANA 758869
    //Function ComparaPLanoContabil(pIdPessoa,IdPLanoPrevContab,IdplanoPrev, pIdtitular : Integer): Boolean; //Renato Visoni SOL 118811 Kintana 569080
    Function RodaQuitacaoEmptmo: boolean;
    Procedure AjustaAtivacaoPlano;

    procedure ExibirQuantidadeParcelasParaResgateParcelado;  //MARCELO ALMEIDA - SOL 63067 - KTN 524520

    //MARCELO ALMEIDA - SOL 63067 - KTN 524520
    function ProcessarResgateParcelado : Boolean;
    function ParticipantePossuiEmprestimo(AIdPessoa : Integer) : Boolean;
    function SaldoRestanteReservasParticipante(AIdPessoa : Integer; AIdTitular : Integer; AIdBeneficio : Integer; ADataSaldoEmptmo : TDateTime) : Double;
    //MARCELO ALMEIDA - SOL 63067 - KTN 524520

    //edilaine WO10872 : funçao passada pra uBeneficio
    //Function BuscaIndice(pIDPESSJUR,pIDPESSOA,pIDPLANOPREV : String): Double; //Renato Visoni SOL 123227 Kintana 614304

    procedure MostraDados(p1, p2, p3, p4 : integer; p5 : string);
    function BeneficioRiscoInss: Boolean;//Darivaldo Alencar SIG 23985
  public
    fSaldoContabil : Double;
    strMatricula, strNumProcesso :string;
    sRequerimento: Boolean;
	sVlrATualMonBeneficio, sVlrATualMonContrib : string;
    { Public declarations }
  end;

var
  frmCadRequerBenefParticip: TfrmCadRequerBenefParticip;

  // Funcao      : AbreRequerParticip
  // Descricao   : Abre a tela de requerimento e concessao de beneficios
  //               para o participante a partir de um evento, ou do menu
  // Parametros  :
  // psTipoChamador - indica o form que chamou a tela
  //                  EV - Evento
  //                  CO - Concessao
  //                  MA - Manutencao de Processo
  // psNumerosProcesso - retorna os números dos processos que foram inseridos
  // psTipoSitFuncAntes- TipoSit    da SitFunc antes do evento ocorrer
  //                     Caso o form chamador seja um evento, é obrigatório
  //                     caso contrario, pode passar em branco que a rotina
  //                     preenche

  function  AbreRequerParticip(
                            psTipoChamador,
                            pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
                            pDataEvento, pDataFinalEvento,
                            pIdEventoGerador, pFlgTpDemissao : string;
                            var psNumerosProcessos : string;
                            psTipoSitFuncAntes: string;
                            psFlgInternoAntes,
                            psFlgInternoDepois,
                            psIdSitPartAntes,
                            psIdSitPlanAntes,
                            psIdSitFuncAntes,
                            psIdSitPartDepois,
                            psIdSitPlanDepois,
                            psIdSitFuncDepois,
                            psTempoContribuicao : string;
                            psDataRequerimento : String;
                            const psNumProcesso : String = '';
                            const psMatricula : String = '';
                            const psRequerimento :boolean = False) : boolean; 

implementation

uses UAutorizacao,UAdmPrev, FTelaAut, DBaseDados, UDataBase, UMensErro,
     UParticipante, fAguarde, FCadOpcoesBenef, FPedeBenefExigencia,
     UContribuicaoPrev, UMovReserva, FMostraAux, FDevolveContribuicoes,
     UIntegraBack, DAPrev, uSincronismo, UDividaAssist, FLerTempoServico,
     DRelatAdmPREV2, USistema, FPedeDadosBenefAnterior, FSelecionaLote,
     UFuncoesUteis, FCadContaRequerBenef, FPRelDemosBenef, DDividaEP,
     UIntegraEP, uConsPart;

{$R *.DFM}
// ********************************** ********************** *************************
// ******************************* ROTINA A SER CHAMADA DAS TELAS ********************
// ********************************** ********************** *************************

Function TfrmCadRequerBenefParticip.CalculaAlteradores(pcTipo : Char;
                                               psAnoMesRef : String;
                                               pdValorCalculo : Double;
                                               Var dValorTotalAlteradores : Currency;
                                               piIdContribuicao : Integer = -1;
                                               piNumLancamento  : LongInt = -1;
                                               piflgevento : LongInt = -1): Boolean;
Var
  sDataRefInd, sAnoMesAnt, sSQL, sValorAlterador, sDataPrevisaoRecebimento,
  sComplementoSQL, sFlgInterno, sAnoMesInicio : String;
  dValorAlterador : Double;
  bErro : Boolean;
Begin
  Result := True;
  dValorTotalAlteradores := 0;
  
  sAnoMesRefAux := ''; //SOL 232043 PPM 396781

            // SOL 232043 PPM 396781
            If (Copy(psAnoMesRef,6,2) <> '13') Then
            psAnoMesRef := psAnoMesRef
            else
            begin
              sAnoMesRefAux := psAnoMesRef; // SOL 232043 PPM 396781
              psAnoMesRef := Copy(psAnoMesRef,1,5)+'11';
              // SOL 232043 PPM 396781
            end;  

  if StrToFloat(FormatFloat('#0.00',pdValorCalculo)) = 0 then Exit;
  if DbLAlterador.Text <> 'Sim' then Exit;

  If pdValorCalculo > 0 Then Begin
    sComplementoSQL := '(FLGATRASO = 1) AND ';
  End Else Begin
    sComplementoSQL := '(FLGDEVOL  = 1) AND ';
  End;

  If pcTipo = 'B' Then Begin { ALTERADORES BENEFICIOS }


    //BRUNO AZEVEDO SOL 202213 KINTANA 1954318
    If pdValorCalculo > 0 Then Begin
      sComplementoSQL := '(FLGATRASO = 1) AND ';
    End Else Begin
      sComplementoSQL := '(FLGDEVOL  = 1) AND ';
    End;


    sFlgInterno := 'AS';

    sSQL := 'SELECT '+
            '  AT.IDREGRACALCULO, T.CODALTERADOR, T.DESCRICAO '+
            'FROM   '+
            '  TIPOALTERADOR T, ALTERADORXBENEF AT '+
            'WHERE  '+
            '  (AT.FLGCOBRA = 1) AND '+
            sComplementoSQL+
            '  (AT.IDBENEFICIO = '+qryDet.FieldByName('IDBENEFICIO').AsString+') AND '+
            '  (AT.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+') AND '+
            '  (T.CODALTERADOR = AT.CODALTERADOR) '+
            'ORDER BY '+
            '  AT.NUMORDEM ';

  End Else Begin            { ALTERADORES CONTRIBUIÇÃO }

    sFlgInterno := 'AS';


    //BRUNO AZEVEDO SOL 202213 KINTANA 1954318
    If pdValorCalculo > 0 Then Begin
      sComplementoSQL := '(FLGDEVOL  = 1) AND ';
    End Else Begin
      sComplementoSQL := '(FLGATRASO = 1) AND ';
    End;

    sSQL := 'SELECT '+
            '  AT.IDREGRACALCULO, T.CODALTERADOR, T.DESCRICAO '+
            'FROM   '+
            '  TIPOALTERADOR T, ALTERADORXCONTRIB AT '+
            'WHERE '+
            '  (AT.FLGCOBRA = 1) AND '+
             sComplementoSQL +
            '  (AT.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+') AND '+
            '  (AT.IDPLANOPREV    = '+IntToStr(iIdPlanoPrev)+') AND '+
            '  (T.CODALTERADOR = AT.CODALTERADOR) '+
            'ORDER BY '+
            '  AT.NUMORDEM ';


  End;

  FazQuery(QryAlteradorCorrecao,sSQL);
  If QryAlteradorCorrecao.IsEmpty Then Begin
    QryAlteradorCorrecao.Close;
    Exit;
  End;

  { Loop para calcular os alteradores }
  sAnoMesAnt := sAnoMesAnterior(psAnoMesRef);
  While Not QryAlteradorCorrecao.EOF Do Begin
    { Buscar Data de previsao de recebimento }
    sDataPrevisaoRecebimento := CriticaDataCobrancaSit(dtmAPrev.qry,
                                           IntToStr(iIdFundacao),
                                           qryDet.FieldByName('IDPLANOPREV').AsString,
                                           sFlgInterno,
                                           'N',
                                           Copy(psAnoMesRef,6,2),Copy(psAnoMesRef,1,4),
                                           true);

    if Trim(sDataPrevisaoRecebimento) = '' then sDataPrevisaoRecebimento := FormatDateTime('dd/mm/yyyy', date);

    sDataRefInd  := '01/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);
    if qryDet.FieldByName('DataInicioFund').AsString <> '' then
       sAnoMesInicio := formatdatetime('yyyy/mm',qryDet.FieldByName('DataInicioFund').Asdatetime)
    else
       sAnoMesInicio := '';

    If pcTipo = 'B' Then
    begin
       sSQL := 'SELECT '+OraNumero(FloatToStr(pdValorCalculo)) + ' AS VALOR, '+
               QuotedStr(QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString) + ' AS CODALTERADOR, ';
    end
    ELSE
    begin
       sSQL := 'SELECT '+OraNumero(FloatToStr(pdValorCalculo)) + ' AS VALOR, '+
               QuotedStr(QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString) + ' AS ALTERADOR, '+
               inttostr(piflgevento)                                             + ' AS FLGEVENTO,  '+
               QuotedStr(sAnoMesPagamento)           + ' AS PROXMESCOB,  ';
    end;

    sSQL := sSQL +
                      QuotedStr(QryAlteradorCorrecao.FieldByName('DESCRICAO').AsString)    + ' AS NOMEALTERADOR, '+
                      QuotedStr(sDataRefInd)                + ' AS DATAREF, '+
                      QuotedStr('0')                        + ' AS FLGMIGRACAO, '+
                      QuotedStr(sAnoMesAnt)                 + ' AS ANOMESREFANT, '+
                      QuotedStr(psAnoMesRef)                + ' AS ANOMESREF, '+
                      QuotedStr(psAnoMesRef)                + ' AS MESREFERENCIA,    '+
                      QuotedStr(sDataPagamentoLote)         + ' AS DATARECEBIMENTO,  '+
                      QuotedStr(sDataPrevisaoRecebimento)   + ' AS DATAPREVISAORECE, '+

                      QuotedStr(sAnoMesInicio)              + ' AS ANOMESACERTOINI, '+
                      IntToStr (Sistema.IdModulo)           + ' AS IDMODULO, '+
                      QuotedStr(sAnoMesPagamento)           + ' AS ANOMESACERTOFIM,  '+
                      '7'                                   + ' AS TIPOMOV           '+    //edilaine - SIG70414

            'FROM DUAL ';

    sValorAlterador := RegraNumerica(QryAlteradorCorrecao.FieldByName('IDREGRACALCULO').AsString,
                                     sSQL, bErro, iIdCalculo);

    dValorAlterador        := StrToFloat(ClienteNumero(sValorAlterador));
    dValorAlterador        := StrToFloat(FormatFloat('#0.00',dValorAlterador));

    dValorTotalAlteradores := dValorTotalAlteradores + dValorAlterador;

    { Caso tenha ocorrido erro na Regra, sai com erro }
    If bErro Then Begin
      Result := False;
      Exit;
    End;

    { Insere o valor do alterador }
    InsereCorrecaoMonetaria(pcTipo,qryDet, psAnoMesRef,
                            dValorAlterador,
                            piNumLancamento);
    QryAlteradorCorrecao.Next;
  End;

  dValorTotalAlteradores := StrToFloat(FormatFloat('#0.00',dValorTotalAlteradores))

End; { CalculaAlteradores }  // SOL 132938


procedure TfrmCadRequerBenefParticip.InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                                     QryDados       : TwwQuery;
                                                     psAnoMesRef    : String;
                                                     pdValor        : Double;
                                                     piNumLancamento : LongInt = -1 );
Var
  iIdRubrica : Integer;
  bBenefProprio : Boolean;
  sFlgTipo, sDataInicio, sDataFinal, sMescobAtrasoContrib : String;
  QryAuxiliar : Twwquery;
begin
  // ************************************************************************ //
  // INSERIR CORREÇÃO DE BENEFICIOS NA HSTATRASOBENEF OU NA HSTATRASOCONTRIB  //
  // ************************************************************************ //

  if StrToFloat(FormatFloat('#0.00',pdValor)) = 0 then  Exit;

  If pcTipoCorracao = 'B' Then Begin

  QryFatorAtualizacao.Close;
  QryFatorAtualizacao.Parambyname('COTMESREF').asString := QryDados.FieldByName('DATAINICIOFUND').AsString ;
  QryFatorAtualizacao.Open;
  QryFatorAtualizacao.Locate('MESINDICE',(sAnoMesPagamento),[]);

  if QryFatorAtualizacao.FieldByName('COTACAO').asFloat = 1.0 then exit;
    { BENEFICIO }

    sFlgTipo := 'A'; { Atraso, pagar para o associado }
    if pdValor < 0 then begin
      sFlgTipo := 'D'; { Devolução, cobrar do associado }
    end;
    pdValor := Abs(pdValor);

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT SEQBENEFICIO '+
                   ' FROM   hstbenefbfciario '+
                   ' WHERE  NUMEROPROCESSO = '+QryDados.FieldByName('NUMEROPROCESSO').AsString+
                   ' AND    IDBENEFICIO  = '+QryDados.FieldByName('IDBENEFICIO').AsString+
                   ' AND    IDPESSJUR    = '+QryDados.FieldByName('IDPESSJUR').AsString+
                   ' AND    IDPLANOPREV  = '+QryDados.FieldByName('IDPLANOPREV').AsString+
                   ' AND    IDPESSOA     = '+QryDados.FieldByName('IDPESSOA').AsString+
                   ' AND    IDTITULAR    = '+QryDados.FieldByName('IDTITULAR').AsString+
                   ' AND    SEQPROPOSTA  = '+QryDados.FieldByName('SEQPROPOSTA').AsString);
    qryAux.Open;

    // SOL 232043 PPM 396781
    if sAnoMesRefAux <> '' then
      psAnoMesRef := sAnoMesRefAux;

    sSQL :='INSERT INTO HSTATRASOBENEF '+
           ' (IDPESSJUR, IDTITULAR, IDPLANOPREV, MES, IDMOTIVO, NUMEROPROCESSO,  '+
           '  IDBENEFICIO, IDPESSOA, MESREFERENCIA, SEQPROPOSTA, SEQBENEFICIO,   '+
           '  CODALTERADOR, VALOR, FLGTIPO, FLGRETROATIVO)                       '+
           'VALUES ( '+
             QryDados.FieldByName('IDPESSJUR').AsString               +', '+
             QryDados.FieldByName('IDTITULAR').AsString               +', '+
             QryDados.FieldByName('IDPLANOPREV').AsString             +', '+
             QuotedStr(sAnoMesPagamento)                              +', '+
             inttostr(prmIDMOTIVOFOLHABEN)                       +', '+
             QryDados.FieldByName('NUMEROPROCESSO').AsString          +', '+
             QryDados.FieldByName('IDBENEFICIO').AsString             +', '+
             QryDados.FieldByName('IDPESSOA').AsString                +', '+
             QuotedStr(psAnoMesRef)                                   +', '+
             QryDados.FieldByName('SEQPROPOSTA').AsString             +', '+
             qryAux.FieldByName('SEQBENEFICIO').AsString             +', '+
             QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString        +', '+
             OraNumero(FloattoStr(Abs(pdValor)))                      +', '+
             QuotedStr(sFlgTipo)                                      +', '+
             '1'                                                      +') ';

    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
    QryAuxiliar.close;
    QryAuxiliar.SQL.clear;
    QryAuxiliar.SQL.Add(' SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = '+QryDados.FieldByName('IDBENEFICIO').AsString);
    QryAuxiliar.Open;

    // edilaine - SOL 262968 / PPM 1102753 - inicio comentado
    {sVlrATualMonBeneficio := sVlrATualMonBeneficio+#13+#10+
                             PreparaStr(psAnoMesRef                                  ,8)+
                             PreparaStr(QryAuxiliar.FieldByName('NOME').AsString     ,34)+
                             PreparaStr(' '                                          ,1)+
                             PreparaStr('(+)'+FormatFloat('#0.00',Abs(pdValor))      ,12)+
                             PreparaStr('(-)'+FormatFloat('#0.00',0)                 ,10);

    // edilaine - SOL 253577-17464 / PPM 955703
    lstDadosCorrecao.Add('B' +'|' +
                         QryDados.FieldByName('IDPESSOA').AsString + '|' +
                         psAnoMesRef +'|'+
                         QryAuxiliar.FieldByName('NOME').AsString +'|'+
                         '(+)'+FormatFloat('#0.00',Abs(pdValor)) + '|' +
                         '(-)'+FormatFloat('#0.00',0) +';' );
    // edilaine - SOL 253577-17464 / PPM 955703
     } // edilaine - SOL 262968 / PPM 1102753 - fim


    FreeAndNil(QryAuxiliar);

  End Else If pcTipoCorracao = 'C' Then Begin

    { CONTRIBUIÇÃO }

    sFlgTipo := 'D'; { Atraso, pagar para o associado }
    if pdValor < 0 then begin
      sFlgTipo := 'A'; { Devolução, cobrar do associado }
    end;

    pdValor := Abs(pdValor);
    sMescobAtrasoContrib := '';
    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
    QryAuxiliar.close;
    QryAuxiliar.SQL.clear;
    QryAuxiliar.SQL.Add(' SELECT HST.MESCOBRANCA FROM HSTCONTRIBPREV HST '+
                        ' WHERE  HST.NUMRECEBIMENTO = '+IntToStr(piNumLancamento));
    QryAuxiliar.Open;

    sMescobAtrasoContrib :=  QryAuxiliar.FieldByName('MESCOBRANCA').AsString;

    FreeAndNil(QryAuxiliar);
	
        // SOL 232043 PPM 396781
    if sAnoMesRefAux <> '' then
      psAnoMesRef := sAnoMesRefAux;	

    sSQL :='INSERT INTO HSTATRASOCONTRIB '+
           '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, FLGTIPO, '+
           '   VALOR, CODALTERADOR, FLGEVENTO)                                '+
           'VALUES( '+
           IntToStr(piNumLancamento)                                    +', '+
           QuotedStr(psAnoMesRef)                                       +', '+
           QuotedStr(sMescobAtrasoContrib)                              +', '+
           inttostr(prmIdMotivoContrib)                                 +', '+
           QuotedStr(sFlgTipo)                                          +', '+
           OraNumero(FloattoStr(Abs(pdValor)))                          +', '+
           QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString    +', '+
           QuotedStr('0')                                               +') ';

    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
    QryAuxiliar.close;
    QryAuxiliar.SQL.clear;
    QryAuxiliar.SQL.Add(' SELECT C.NOME FROM HSTCONTRIBPREV HST , CONTRIBUICAO  C '+
                        ' WHERE C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO '+
                        ' AND   HST.NUMRECEBIMENTO = '+IntToStr(piNumLancamento)+
                        ' AND   HST.IDPESSOA = '+QryDados.FieldByName('IDPESSOA').AsString );
    QryAuxiliar.Open;

    // edilaine - SOL 262968 / PPM 1102753 - inicio comentado
    {sVlrATualMonContrib := sVlrATualMonContrib+#13+#10+
                           PreparaStr(psAnoMesRef                                  ,8)+
                           PreparaStr(QryAuxiliar.FieldByName('NOME').AsString     ,34)+
                           PreparaStr(' '                                          ,1)+
                           PreparaStr('(+)'+FormatFloat('#0.00',0)                 ,12)+
                           PreparaStr('(-)'+FormatFloat('#0.00',Abs(pdValor))      ,10);


    // edilaine - SOL 253577-17464 / PPM 955703
    lstDadosCorrecao.Add('C' +'|' +
                         QryDados.FieldByName('IDPESSOA').AsString + '|' +
                         psAnoMesRef +'|'+
                         QryAuxiliar.FieldByName('NOME').AsString +'|'+
                         '(+)'+FormatFloat('#0.00',0) +'|'+
                         '(-)'+FormatFloat('#0.00',Abs(pdValor)) + ';' );
    // edilaine - SOL 253577-17464 / PPM 955703
    } // edilaine - SOL 262968 / PPM 1102753 - fim


    FreeAndNil(QryAuxiliar);

  End; { If }



  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
     qryAux.ExecSQL;
     qryAux.Close; //SOL 144007/2802 Kintana 1003179
  except
     MessageDlg('Erro ao inserir Correção monetária. Verifique.', mtInformation, [mbOK], 0);
     Exit;
  end;

end;  // SOL 132938

function  AbreRequerParticip(
                            psTipoChamador,
                            pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
                            pDataEvento, pDataFinalEvento,
                            pIdEventoGerador, pFlgTpDemissao : string;
                            var psNumerosProcessos : string;
                            psTipoSitFuncAntes: string;
                            psFlgInternoAntes,
                            psFlgInternoDepois,
                            psIdSitPartAntes,
                            psIdSitPlanAntes,
                            psIdSitFuncAntes,
                            psIdSitPartDepois,
                            psIdSitPlanDepois,
                            psIdSitFuncDepois,
                            psTempoContribuicao : string;
                            psDataRequerimento : String;
                            const psNumProcesso : String;
                            Const psMatricula : String;
                            Const psRequerimento: boolean) : boolean;
begin
  Application.CreateForm(TfrmCadRequerBenefParticip, frmCadRequerBenefParticip);
 // frmCadRequerBenefParticip.sRequerimento := psRequerimento;

  if psTipoChamador = 'MA' Then
    frmCadRequerBenefParticip.HelpContext := 160071
  else
    If psTipoChamador = 'CO' Then
      frmCadRequerBenefParticip.HelpContext := 160072
    else
      If psTipoChamador = 'SI' Then
        frmCadRequerBenefParticip.HelpContext := 160074;


  with frmCadRequerBenefParticip do
  begin
     sTipoFormChamador := psTipoChamador;

     sTipoTelaBenef    := sTipoFormChamador;
     if Trim(pIdEventoGerador) = ''
     then iIdEvento    := -1
     else iIdEvento    := StrToInt(pIdEventoGerador);

     sDataEvento       := pDataEvento;
     sDataRequerimento := psDataRequerimento;
     sDataFinalEvento  := pDataFinalEvento;
     sTipoSitFuncAntes := psTipoSitFuncAntes;
     sFlgInternoAntes  := psFlgInternoAntes;
     sFlgInternoDepois  := psFlgInternoDepois;
     sIdSitPartAntes   := psIdSitPartAntes;
     sIdSitPlanAntes   := psIdSitPlanAntes;
     sIdSitFuncAntes   := psIdSitFuncAntes;
     sIdSitPartDepois  := psIdSitPartDepois;
     sIdSitPlanDepois  := psIdSitPlanDepois;
     sIdSitFuncDepois  := psIdSitFuncDepois;

     iIdTitular        := StrToInt(pIdTitular);
     iIdPessJur        := StrToInt(pIdPessJur);
     iIdPlanoPrev      := StrToInt(pIdPlanoPrev);
     iSeqProposta      := StrToInt(pSeqProposta);
     sFlgTpDemissao    := pFlgTpDemissao;

     sRequerimento     := psRequerimento;        // edilaine - SOL 253577-18129 / PPM 1303078
     
     if psTipoChamador <> 'EV'
     then begin
        with dtmAPrev.qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT EP.IDSITFUNCATUAL, EP.IDSITFUNCNOVO, EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO, '+
	                '        EP.IDSITPARTATUAL, EP.IDSITPARTNOVO, SP.FLGINTERNO AS FLGINTERNOATUAL, '+
	                '        SP2.FLGINTERNO AS FLGINTERNONOVO                                       '+
                   ' FROM   EVENTOSPREV EP, SITPART SP, SITPART SP2  '+
                   ' WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART        '+
                   ' AND    EP.IDSITPARTNOVO   = SP2.IDSITPART       '+
                   ' AND    EP.IDPESSJUR       = '+pIdPessJur+
                   ' AND    EP.IDPLANOPREV     = '+pIdPlanoPrev+
                   ' AND    EP.IDPESSOA        = '+pIdTitular+
                   ' AND    EP.SEQPROPOSTA     = '+pSeqProposta+
                   ' AND    EP.IDEVENTOGERADOR = '+pIdEventoGerador);

           If psTipoChamador = 'CO' // Apenas para concessão
            Then Begin
              SQL.Add('  AND EP.IDEVENTOSPREV = (SELECT MAX(E.IDEVENTOSPREV) ');
              SQL.Add('                          FROM EVENTOSPREV E ');
              SQL.Add('                          WHERE E.IDPESSJUR = EP.IDPESSJUR ');
              SQL.Add('                            AND E.IDPLANOPREV = EP.IDPLANOPREV ');
              SQL.Add('                            AND E.IDPESSOA = EP.IDPESSOA ');
              SQL.Add('                            AND E.SEQPROPOSTA = EP.SEQPROPOSTA ');
              SQL.Add('                            AND E.IDEVENTOGERADOR = EP.IDEVENTOGERADOR) ');
            End;

           Open;
           if not IsEmpty
           then begin
              sFlgInternoAntes  := FieldByName('FLGINTERNOATUAL').AsString;
              sFlgInternoDepois  := FieldByName('FLGINTERNONOVO').AsString;
              sIdSitPartAntes   := FieldByName('IDSITPARTATUAL').AsString;
              sIdSitPartDepois   := FieldByName('IDSITPARTNOVO').AsString;
              sIdSitFuncAntes   := FieldByName('IDSITFUNCATUAL').AsString;
              sIdSitFuncDepois   := FieldByName('IDSITFUNCNOVO').AsString;
              sIdSitPlanAntes   := FieldByName('IDSITPLANOATUAL').AsString;
              sIdSitPlanDepois   := FieldByName('IDSITPLANONOVO').AsString;
           end;
           Close;
        end; //with
     end;
  end;

   if psTipoChamador = 'AV'
     Then Begin
        frmCadRequerBenefParticip.PreencheDadosTitular(StrToInt(pIdTitular),
                                                       StrToInt(pIdPessJur),
                                                       StrToInt(pIdPlanoPrev),
                                                       StrToInt(pSeqProposta));
        frmCadRequerBenefParticip.SelecionaProcesso(StrToInt(psNumerosProcessos));
        frmCadRequerBenefParticip.sbtnAlterar.OnClick(frmCadRequerBenefParticip);
     End;

  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  If (psTipoChamador = 'CO')and (psRequerimento)and(Sistema.IdModulo = 454) Then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
    frmCadRequerBenefParticip.PreencheDadosTitular(StrToInt(pIdTitular),
                                                         StrToInt(pIdPessJur),
                                                         StrToInt(pIdPlanoPrev),
                                                         StrToInt(pSeqProposta));
   if (psNumProcesso <> '')then
      frmCadRequerBenefParticip.SelecionaProcesso(StrToInt(psNumProcesso));
   //frmCadRequerBenefParticip.sbtnAlterar.OnClick(frmCadRequerBenefParticip);//Se quiser alterar - Tirar
 end;
   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393


  frmCadRequerBenefParticip.ShowModal;

  if psTipoChamador <> 'EV' Then
  Begin
   psNumerosProcessos := Copy(frmCadRequerBenefParticip.sNumerosProcessos,
                              2,length(frmCadRequerBenefParticip.sNumerosProcessos)-1);
  end
  else
     psNumerosProcessos := frmCadRequerBenefParticip.sNumerosProcessos;


  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if (psTipoChamador = 'EV') and (Sistema.IdModulo = 454) Then
     Result := frmCadRequerBenefParticip.bChamarConcessao;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  frmCadRequerBenefParticip.Free;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if not ((psTipoChamador = 'EV') and (Sistema.IdModulo = 454)) Then
     Result := True;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS AUXILIARES ***********************
// ********************************** ********************** *************************


procedure TfrmCadRequerBenefParticip.DeletaBfciarioTitPlan(piIdNumeroProcesso:Integer);   // edilaine - SOL 253577-17464 / PPM 955703
var  _qryAux : TwwQuery;
Begin
  _qryAux := TwwQuery.create(nil);
  try
    with _qryAux  do
    begin
       DataBaseName := 'basedados';
       SQL.Add(' DELETE FROM BFCIARIOTITPLAN BT '+
               ' WHERE EXISTS ( SELECT 1 FROM BENEFBFCIARIO BF '+
               '   WHERE BF.IDPESSJUR     = BT.IDPESSJUR       '+
               '     AND BF.IDTITULAR     = BT.IDTITULAR       '+
               '     AND BF.IDPLANOORIGEM = BT.IDPLANOORIGEM   '+
               '     AND BF.IDPESSOA      = BT.IDPESSOA        '+
               '     AND BF.SEQPROPOSTA   = BT.SEQPROPOSTA     '+
               '     AND BF.IDPLANOPREV   = BT.IDPLANOPREV     '+
               '     AND BF.IDBENEFICIO   = BT.IDBENEFICIO     '+
               '     AND BF.NUMEROPROCESSO = '+InttoStr(piIdNumeroProcesso)+
               ' ) ');
       ExecSql;
    end;
  finally
    _qryAux.Free;
  end;
End;


procedure TfrmCadRequerBenefParticip.AbreQryBeneficio( bConsideraGrupo : boolean;
                                                       piIdEventoGerador, piIdPlanoPrev : longint ) ;
begin
    qryBeneficio.Close;
    qryBeneficio.SQL.Clear;
    if bConsideraGrupo

    then begin
       qryBeneficio.SQL.Add(
       //BRUNO AZEVEDO SOL 153181 KINTANA 1150653
       ' SELECT  B.IDBENEFICIO, B.TIPOBENEFICIO,                                          '+
       '         DECODE(BG.IDBENEFICIO, NULL,B.NOME,(''Grupo '' || G.DESCRICAO)) AS NOME, '+
       '         B.NOME AS NOMEBENEFICIO,                                                 '+
       '         DECODE(BG.IDGRUPOBENEF, NULL, -1, BG.IDGRUPOBENEF) AS IDGRUPOBENEF,      '+
       '         B.FLGDESTBENEF, B.IDEVENTOGERADOR,                                       '+
       '         B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,                      '+
       '         B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,                                   '+
       '         BP.IDREGRACALCULO,  BP.IDREGRASIMULA, BP.FLGPAGAINSS,                    '+
       '         BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOPCAO,             '+
       '         BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,                 '+
       '         BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITAOP3,             '+
       '         BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.IDBENEFREF,      '+
       '         BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASSISTEN,           '+
       '         BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,                  '+
       '         BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,            '+
       '         BP.CODPORTFORMA,    BP.FLGOBRIGANPROC, B.FLGUSADTPREVISAO,               '+
       '         BP.FLGREFERENCIA,  BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.FLGOBRIGAOP3,    '+
       //SOL160185
       '         BP.FLGOPCAOTEXTO,  BP.NOMECAMPOTEXTO1,                                   '+
       '         BP.NOMECAMPOTEXTO2,    BP.NOMECAMPOTEXTO3,   BP.NUMOPCOESTEXTO,          '+
       '         BP.FLGEDITAOPTEXTO1,      BP.FLGEDITAOPTEXTO2,   BP.FLGEDITAOPTEXTO3,    '+
       '         BP.FLGOBRIGAOPTEXTO1, BP. FLGOBRIGAOPTEXTO2, BP.FLGOBRIGAOPTEXTO3,       '+
       //SOL160185
       // edilaine - SOL 253577-17374 / PPM 848182 - inicio
       '         BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT, BP.IDREGRACALCFAB,         '+
       '         BP.IDREGRACALCBASEDEFICIT, BP.IDREGRACALCBS, BP.FLGACTVLRTOTBEN, BP.FLGACTVLRATUAL, '+
       // edilaine - SOL 253577-17374 / PPM 848182 - fim
       '         BP.IDREGRABENEFMIN, BP.IDREGRASRB, BP.FLGACEITAZERO,  B.CODBENEFICIO,     '+
       '         PL.FLGTIPOGRAVAINSS, BP.FLGACTVLRSRB, BP.FLGACTVLRATUAL, BP.FLGACTVLRTOTBEN, '+
       '         BP.IDRGPLANPREVCONT, BP.FLGPERMITEQUITAR, ' +
       '         BP.IDPLANPREVCONTAB, ' + //Helio - SOL Nº 253577/17666 PPM Nº 1019935
       '        DECODE(B.IDEVENTOGERADOR,11,1,2,1,7,1,8,1,370,1,0) AS FLGHABDATAFIM  ' +  //* SIG 132064 */
       ' FROM   BENEFICIO B '+
       ' JOIN BENEFPLANPREV BP ON BP.IDBENEFICIO = B.IDBENEFICIO '+
       ' JOIN PLANPREV      PL ON PL.IDPLANOPREV = BP.IDPLANOPREV '+
       ' LEFT JOIN BENEFXGRUPO   BG ON BP.IDPLANOPREV = BG.IDPLANOPREV '+
       '                        AND BP.IDBENEFICIO = BG.IDBENEFICIO '+
       '                        AND ((1 = BG.FLGPRINCIPAL) OR BG.FLGPRINCIPAL IS NULL) '+
       ' LEFT JOIN GRUPOBENEF    G ON BG.IDGRUPOBENEF = G.IDGRUPOBENEF '+
       ' WHERE  B.IDEVENTOGERADOR = ' +IntToStr(piIdEventoGerador)+
       ' AND    BP.IDPLANOPREV    = ' +IntToStr(piIdPlanoPrev)+
       ' AND    B.FLGDESTBENEF    <> ''B'' '+
       ' AND    ((BP.FLGREFERENCIA = 0) OR ((BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) ) ');
    end
    else begin
       qryBeneficio.SQL.Add(
          ' SELECT B.IDBENEFICIO, B.TIPOBENEFICIO, B.NOME, B.NOME AS NOMEBENEFICIO,    '+
          '        -1 as IDGRUPOBENEF,                                                 '+
          '        B.FLGDESTBENEF, B.IDEVENTOGERADOR,                                  '+
          '        B.FLGRESGATE, B.FLGBENEFOBRIGATO, B.NUMORDEMEVENTO,                 '+
          '        B.IDTPPAGTOBENEFIC, B.PRAZOPROVISORIO,                              '+
          '        BP.IDREGRACALCULO,  BP.IDREGRASIMULA, BP.FLGPAGAINSS,               '+
          '        BP.IDREGRAPAGAMENTO, BP.IDREGRAELEGIBILI, BP.FLGACEITAOPCAO,        '+
          '        BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,            '+
          '        BP.NUMOPCOES,BP.FLGEDITAOP1, BP.FLGEDITAOP2, BP.FLGEDITAOP3,        '+
          '        BP.IDREGRAINICIO, BP.IDREGRAFIM, BP.IDREGRACALCINSS, BP.IDBENEFREF, '+
          '        BP.FLGQUITAPREVIDEN, BP.FLGQUITAEMPRESTI, BP.FLGQUITAASSISTEN,      '+
          '        BP.INDICEREAJBENEF, BP.FLGCALCTODOMES,             '+
          '        BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO,       '+
          '        BP.CODPORTFORMA, BP.FLGOBRIGAOP1, BP.FLGOBRIGAOP2, BP.FLGOBRIGAOP3,  '+
          //SOL160185
          '        BP.FLGOPCAOTEXTO,  BP.NOMECAMPOTEXTO1,                                    '+
          '        BP.NOMECAMPOTEXTO2,    BP.NOMECAMPOTEXTO3,   BP.NUMOPCOESTEXTO,          '+
          '        BP.FLGEDITAOPTEXTO1,      BP.FLGEDITAOPTEXTO2,   BP.FLGEDITAOPTEXTO3,     '+
          '        BP.FLGOBRIGAOPTEXTO1, BP. FLGOBRIGAOPTEXTO2, BP.FLGOBRIGAOPTEXTO3,       '+
          //SOL160185
          // edilaine - SOL 253577-17374 / PPM 848182 - inicio
          '        BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT, BP.IDREGRACALCFAB,         '+
          '        BP.IDREGRACALCBASEDEFICIT, BP.IDREGRACALCBS, BP.FLGACTVLRTOTBEN, BP.FLGACTVLRATUAL, '+
          // edilaine - SOL 253577-17374 / PPM 848182 - fim
          '        BP.FLGOBRIGANPROC, BP.FLGREFERENCIA,                                 '+
          '        BP.IDREGRABENEFMIN, BP.IDREGRASRB, BP.FLGACEITAZERO,  B.CODBENEFICIO, '+
          '        PL.FLGTIPOGRAVAINSS, BP.FLGACTVLRSRB, BP.FLGACTVLRATUAL, BP.FLGACTVLRTOTBEN, '+
          '        BP.IDRGPLANPREVCONT, BP.FLGPERMITEQUITAR, ' +
          '        BP.IDPLANPREVCONTAB, ' + //Helio - SOL Nº 253577/17666 PPM Nº 1019935
          '        DECODE(B.IDEVENTOGERADOR,11,1,2,1,7,1,8,1,370,1,0) AS FLGHABDATAFIM  ' +  //* SIG 132064 */
          ' FROM   BENEFICIO B, PLANPREV PL, BENEFPLANPREV BP                                        '+
          ' WHERE  B.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)+
          ' AND    BP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
          ' AND    B.FLGDESTBENEF    <> ''B''                                          '+
          ' AND    PL.IDPLANOPREV   = BP.IDPLANOPREV     '+
          ' AND    ((BP.FLGREFERENCIA = 0) OR ((BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) ) '+
          ' AND    BP.IDBENEFICIO   = B.IDBENEFICIO                                    ');
    end;
    qryBeneficio.Open;
end; // AbreQryBeneficio

procedure TfrmCadRequerBenefParticip.SelecionaReservaPart;
begin

  with qryReservaPart do
  begin
     if Active and UpdatesPending
     then begin
        CancelUpdates;

        with qryMovReservaTemp do
        begin
           if Active and UpdatesPending then CancelUpdates;

           Close;
           ParamByName('IdTitular').Value      := iIdTitular;
           ParamByName('SeqProposta').Value    := iSeqProposta;
           ParamByName('IdPessJur').Value      := iIdPessJur;
           ParamByName('IdPlanoPrev').Value    := iIdPlanoPrev;
           ParamByName('NumeroProcesso').Value := iNumeroProcesso;
           Open;
        end;

     end;

     Close;
     ParamByName('IdPessJur').Value      := iIdPessJur;
     ParamByName('IdPlanoPrev').Value    := iIdPlanoPrev;
     ParamByName('IdTitular').Value      := iIdTitular;
     ParamByName('SeqProposta').Value    := iSeqProposta;
     Open;
  end;
end;

procedure TfrmCadRequerBenefParticip.SelecionaProcesso(piNumeroProcesso : longInt);
begin
  qry.Close;
  qry.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryDet.Open;
  // xavier SOL 155566/4401 Kintana 1214773
  qryDetAux.Close;
  qryDetAux.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryDetAux.Open;
  //xavier SOL 155566/4401 Kintana 1214773
  qryDet.First;
  While not qryDet.Eof do Begin
    If (not EApenasReferencia(qryDet.FieldByName('IDPLANOPREV').AsInteger,
                             qryDet.FieldByName('IDBENEFICIO').AsInteger))
        and (not qryDet.FieldByName('DATAINICIO').IsNull)
      Then sDataInicioref:= qryDet.FieldByName('DATAINICIO').AsString;
    qryDet.Next;
  End;


  if (piNumeroProcesso = -1) or
     (qryDet.IsEmpty)

  then AbreQryBeneficio(True, iIdEvento, qryDet.FieldByName('IDPLANOORIGEM').AsInteger)
  else AbreQryBeneficio(True, qry.FieldByName('IdEventoGerador').AsInteger, qryDet.FieldByName('IDPLANOORIGEM').AsInteger);

  if (not qryDet.IsEmpty) and (not qryBeneficio.IsEmpty)
  then qryBeneficio.Locate('IdBeneficio',qryDet.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);

  qryBenefAux.Close;
  qryBenefAux.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryBenefAux.Open;

  if piNumeroProcesso <= 0
  then begin
     lblNumProcesso.Caption   := 'Processo Nº ';
     lblSitProcesso.Caption := '';
  end
  else begin
     lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(piNumeroProcesso);
     lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;
  end;

  if not qry.IsEmpty
  then iIdEvento := qry.FieldByName('IdEventoGerador').AsInteger;

  if sTipoFormChamador <> 'SI'
  then begin
      qryEvento.Close;
      qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
      qryEvento.Open;
  end
  else begin
      qryEvento.Close;
      qryEvento.SQL.Clear;
      qryEvento.SQL.Add(' SELECT IDEVENTOGERADOR, NOME, FLGRISCO, FLGINTERNO '+
                        ' FROM   EVENTOGERADOR '+
                        ' WHERE  FLGINTERNO NOT IN (''FL'', ''RC'', ''BI'')  '+
                        ' AND    IDFUNDACAO = '+IntToStr(iIdFundacao)+
                        ' AND    IDEVENTOGERADOR IN (SELECT IDEVENTOGERADOR FROM BENEFICIO) '+
                        ' ORDER BY NOME        ');
      qryEvento.Open;
  end;

  if sTipoFormChamador <> 'EV'
  then begin
     with dtmAPrev.qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT EP.IDSITFUNCATUAL, EP.IDSITFUNCNOVO, EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO, '+
                '        EP.IDSITPARTATUAL, EP.IDSITPARTNOVO, SP.FLGINTERNO AS FLGINTERNOATUAL, '+
                '        SP2.FLGINTERNO AS FLGINTERNONOVO                                       '+
                ' FROM   EVENTOSPREV EP, SITPART SP, SITPART SP2  '+
                ' WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART        '+
                ' AND    EP.IDSITPARTNOVO   = SP2.IDSITPART       '+
                ' AND    EP.IDPESSJUR       = '+IntToStr(qryDet.FieldByName('IdPessJur').AsInteger)+

                ' AND    EP.IDPLANOPREV     = '+IntToStr(qryDet.FieldByName('IDPLANOORIGEM').AsInteger)+
                ' AND    EP.IDPESSOA        = '+IntToStr(qryDet.FieldByName('IdTitular').AsInteger)+
                ' AND    EP.SEQPROPOSTA     = '+IntToStr(qryDet.FieldByName('SeqProposta').AsInteger)+
                ' AND    EP.IDEVENTOGERADOR = '+IntToStr(iIdEvento));

        If sTipoFormChamador = 'CO' // Apenas para concessão
         Then Begin
           SQL.Add('AND EP.IDEVENTOSPREV = (SELECT MAX(E.IDEVENTOSPREV) ');
           SQL.Add('                        FROM EVENTOSPREV E ');
           SQL.Add('                        WHERE E.IDPESSJUR       = EP.IDPESSJUR ');
           SQL.Add('                          AND E.IDPLANOPREV     = EP.IDPLANOPREV ');
           SQL.Add('                          AND E.IDPESSOA        = EP.IDPESSOA ');
           SQL.Add('                          AND E.SEQPROPOSTA     = EP.SEQPROPOSTA ');
           SQL.Add('                          AND E.IDEVENTOGERADOR = EP.IDEVENTOGERADOR) ');
         End;

        Open;
        if not IsEmpty
        then begin
           sFlgInternoAntes   := FieldByName('FLGINTERNOATUAL').AsString;
           sFlgInternoDepois  := FieldByName('FLGINTERNONOVO').AsString;
           sIdSitPartAntes    := FieldByName('IDSITPARTATUAL').AsString;
           sIdSitPartDepois   := FieldByName('IDSITPARTNOVO').AsString;
           sIdSitFuncAntes    := FieldByName('IDSITFUNCATUAL').AsString;
           sIdSitFuncDepois   := FieldByName('IDSITFUNCNOVO').AsString;
           sIdSitPlanAntes    := FieldByName('IDSITPLANOATUAL').AsString;
           sIdSitPlanDepois   := FieldByName('IDSITPLANONOVO').AsString;
        end;
        Close;
     end; //with
  end;

  bInserindoGrupo            := False;
  bPreparaContrib13          := False;
  dblkpcmbEvento.Text        := qryEvento.FieldByName('Nome').AsString;
  pnlMestre.Enabled          := False;

  bbtnProcurar.Visible       := False;
  sbtnConcedeUm.Enabled      := False;
  if (sTipoFormChamador <> 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
     iIdLoteConcessao           := -1;

//Incio SIG 132064 Ferrari
  dtDataFinal.Enabled :=  (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital) or
                          ((qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = prmIdTpPgBenVital) and
                           (qryBeneficio.FieldByname('FLGHABDATAFIM').AsInteger = 1)) ;
// Fim                           
  iNumeroProcesso := piNumeroProcesso;

end; // SelecionaProcesso

procedure TfrmCadRequerBenefParticip.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var
    iIdBenefPDV : longint;
begin

  // Verifica se participante possui divida previdenciaria e atualizar flgs de
  // divida tanto de Assitencial quanto de Emprestimo
  if not(AtualizaDividaEmprestimo(qryAux,
                                  piIdPessJur,
                                  piIdPlanoPrev,
                                  piIdTitular,
                                  piSeqProposta,
                                  FormatDateTime('dd/mm/yyyy', date)  
                                 )) then
  begin
    MsgDlg('Erro ao verificar dívida de empréstimo.', Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;
    Exit;
  end;

  if not(AtualizaDividaAssistencial(qryAux,
                                    piIdPessJur,
                                    piIdPlanoPrev,
                                    piIdTitular,
                                    piSeqProposta,
                                    FormatDateTime('dd/mm/yyyy', date)  
                                   )) then
  begin
    MsgDlg('Erro ao verificar dívida assistencial.', Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;
    Exit;
  end;

  // Verificar se participante está cadastrado como dependente dele mesmo na DEPENTIT

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDTITULAR FROM DEPENTIT '+
             ' WHERE  IDTITULAR = '+IntToStr(piIdTitular)+
             ' AND    IDPESSOA  = '+IntToStr(piIdTitular));
     Open;
     if IsEmpty
     then begin
        MsgDlg( ' O Titular não está cadastrado como dependente. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;
  end;

  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  with qryContaBancaria do    // SOL 161611 Kintana 1365052
  begin
     Close;
     Sql.Clear;
     SQL.Add(' SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCONTAPREF,');
     SQL.Add('  CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BANCO.NOME AS BANCO,');
     SQL.Add('  AGENCIABANCARIA.NUMAGENCIA   , B.NUMBANCO  , CB.FLGCONTACONJUNTA');
     SQL.Add('  FROM CONTABANCARIA  CB, PESSOA AGENCIA,');
     SQL.Add(' PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA  , BANCO B');
     SQL.Add(' WHERE CB.IDPESSOA =' +inttostr(piIdTitular));
     SQL.Add('  AND  CB.IDAGENCIA = AGENCIA.IDPESSOA AND');
     SQL.Add('  CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND');
     SQL.Add('  AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND ');
     SQL.Add('  AGENCIABANCARIA.IDBANCO = B.IDPESSOA      AND ');
     SQL.Add('  CB.FLGCONTAPREF = 1 ');
     Open;
  end;            // SOL 161611 Kintana 1365052

  with qrySelecionaBenefRef do
  begin
     Close;
     ParamByName('IDPLANOPREV').AsInteger := piIdPlanoPrev;
     Open;
  end;


  // Dados da Patrocinadora e do Plano
  sNomePatro            := qryTitular.FieldByName('NomePatro').AsString;
  sNomePlano            := qryTitular.FieldByName('NomePlano').AsString;
  sNomeTitular          := qryTitular.FieldByName('Nome').AsString;
  lblNome.caption       := qryTitular.FieldByName('Nome').AsString;
  sMatricula            := qryTitular.FieldByName('Matricula').AsString;
  lblMatricula.caption  := qryTitular.FieldByName('Matricula').AsString;
  sFlgInternoSitPart    := qryTitular.FieldByName('FlgInterno').AsString;

  sValorReserva := CalcReservaPart(piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdTitular,
                                   -1,
                                   piSeqProposta ,
                                  FormatDateTime('dd/mm/yyyy', date),
                                   FormatDateTime('dd/mm/yyyy', date),
                                   FormatDateTime('dd/mm/yyyy', date), 
                                   FormatDateTime('dd/mm/yyyy', date), 
                                   '-1',
                                   qryAux
                                   );

  // Preencher situacao do participante na patrocinadora antes
  // do evento ocorrer
  if Trim(sTipoSitFuncAntes) = ''
  then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT SF.TIPOSIT '+
                     ' FROM   SITFUNC SF, EVENTOSPREV E '+
                     ' WHERE  (E.IDPESSOA        = '+IntToStr(piIdTitular)+')'+
                     ' AND    (E.IDPESSJUR       = '+IntToStr(piIdPessJur)+')'+
                     ' AND    (E.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+')'+
                     ' AND    (E.SEQPROPOSTA     = '+IntToStr(piSeqProposta)+')'+
                     ' AND    (E.IDEVENTOGERADOR = '+IntToStr(qryEvento.FieldByName('IdEventoGerador').AsInteger)+')'+
                     ' AND    (E.IDSITFUNCATUAL  = SF.IDSITFUNC)');
      qryAux.Open;
      if   qryAux.IsEmpty
      then sTipoSitFuncAntes := 'A'
      else sTipoSitFuncAntes := qryAux.FieldByName('TipoSit').AsString;
      qryAux.Close;
  end;

  // Situacoes
  iIdSitFunc := qryTitular.FieldbyName('IdSitFunc').AsInteger;
  iIdSitPart := qryTitular.FieldbyName('IdSitPart').AsInteger;
  iIdSitPlanoPrev := qryTitular.FieldbyName('IdSitPlanoPrev').AsInteger;


  
  { Retirado para não testar Divida Previdenciária, variavel será sempre false }
  
  bPossuiDivPrevid := False;
  
  bPossuiDivAssist := (qryTitular.FieldByName('FLGDEVEASSISTENC').AsString = '1');


  bQueryTitular := True;

  if not bAbriuOutroForm
  then begin
     SelecionaReservaPart;

     with qryBfciarioTitPlan do
     begin
        Close;
        ParamByName('IdPessoa').Value    := piIdTitular;
        ParamByName('SeqProposta').Value := piSeqProposta;
        ParamByName('IdPessJur').Value   := piIdPessJur;
        ParamByName('IDPLANOPREV').Value := piIdPlanoPrev;
        Open;
     end;

     with qryBenefReferencia do
     begin
        Close;
        ParamByName('IdPessoa').Value    := piIdTitular;
        ParamByName('SeqProposta').Value := piSeqProposta;
        ParamByName('IdPessJur').Value   := piIdPessJur;
        
        ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value  := iNumeroProcesso;
        Open;
     end;

     with qryMovReservaTemp do
     begin
        Close;
        ParamByName('IdTitular').Value      := piIdTitular;
        ParamByName('SeqProposta').Value    := piSeqProposta;
        ParamByName('IdPessJur').Value      := piIdPessJur;
        ParamByName('IdPlanoPrev').Value    := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value := iNumeroProcesso;
        Open;
     end;

     with qryRelBenefPart   do
     begin
        Close;
        ParamByName('IdTitular').Value      := piIdTitular;
        ParamByName('SeqProposta').Value    := piSeqProposta;
        ParamByName('IdPessJur').Value      := piIdPessJur;
        ParamByName('IdPlanoPrev').Value    := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value := iNumeroProcesso;
        ParamByName('IdPessoa').Value       := piIdTitular;
        Open;
     end;
   end; // if not bAbriuOutroForm
end; //PreencheDadosTitular

procedure TfrmCadRequerBenefParticip.PreencheSalarios(piIdTitular, piIdPessJur  : longInt);
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDRUBSALPARTICIP, IDRUBSALMANUT, IDRUBSALMANUTPARC, IDRUBSALAUXDOENCA ');
  qryAux.SQL.Add('FROM PATRO WHERE IDPESSOA = ' + InttoStr(piIdPessJur));
  qryAux.Open;
  qrySalarios.Close;
  qrySalarios.ParamByName('IdPessoa').Value           := piIdTitular;
  qrySalarios.ParamByName('IdPessJur').Value          := piIdPessJur;
  qrySalarios.ParamByName('IdRubricaAuxDoenca').Value := qryAux.FieldByName('IDRUBSALAUXDOENCA').AsInteger;
  qrySalarios.ParamByName('IdRubricaManut').Value     := qryAux.FieldByName('IDRUBSALMANUT').AsInteger;
  qrySalarios.ParamByName('IdRubricaManutParc').Value := qryAux.FieldByName('IDRUBSALMANUTPARC').AsInteger;
  qrySalarios.ParamByName('IdRubricaSalPart').Value   := qryAux.FieldByName('IDRUBSALPARTICIP').AsInteger;
  qrySalarios.Open;

end; // PreencheSalarios

procedure TfrmCadRequerBenefParticip.PreencheContribuicoes(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
begin
  qryContribuicoes.Close;
  qryContribuicoes.ParamByName('IdPessoa').Value := piIdTitular;
  qryContribuicoes.ParamByName('SeqProposta').Value := piSeqProposta;
  qryContribuicoes.ParamByName('IdPessJur').Value := piIdPessJur;
  qryContribuicoes.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryContribuicoes.Open;
end; // PreencheContribuicoes

procedure TfrmCadRequerBenefParticip.GravaBeneficiodeReferencia;
var
  sFlgFormaPagto,
  sDataPagto       : string;

   sDataInicioAntINSS,
   sValorAntINSS,
   sNomeBenefAntINSS,
   sIdTpPagtoAntINSS,
   sUltMesReajAntINSS,
   sFlgBenefMinAntINSS,
   sDataEventoAntINSS,
   sCodBeneficioAntINSS,
   sValorBase1AntINSS,
   sValorBase2AntINSS,
   sValorBase3AntINSS,
   sNumProcAntINSS       : string;
begin
  if iIdBenefReferencia <= 0
  then begin
     if (Trim(dblkpcmbBenefReferencia.Text) <> '')
     then iIdBenefReferencia := qrySelecionaBenefRef.FieldbyName('IDBENEFICIO').AsInteger
     else begin
        MsgDlg('O Benefício de Referência para '+qryBeneficio.FieldByName('Nome').AsString+
               ' não está associado. Verifique. ','Informação',mtInformation,[mbOk],0);
        Exit;
     end;
  end;

  sDataInicioAntINSS    := '';
  sValorAntINSS         := '0';
  sNomeBenefAntINSS     := '';
  sIdTpPagtoAntINSS     := '';
  sUltMesReajAntINSS    := '';
  sFlgBenefMinAntINSS   := '';
  sDataEventoAntINSS    := '';
  sCodBeneficioAntINSS  := '';
  sValorBase1AntINSS    := '0';
  sValorBase2AntINSS    := '0';
  sValorBase3AntINSS    := '0';
  sNumProcAntINSS       := '';

  BuscaDadosBeneficioAnterior(qryAux,
                              iIdPessJur,
                              iIdPlanoPrev,
                              iIdTitular,
                              iIdBenefReferencia,
                              1,
                              FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  
                              sDataInicioAntINSS,
                              sValorAntINSS,
                              sNomeBenefAntINSS,
                              sIdTpPagtoAntINSS,
                              sUltMesReajAntINSS,
                              sFlgBenefMinAntINSS,
                              sDataEventoAntINSS,
                              sCodBeneficioAntINSS,
                              sValorBase1AntINSS,
                              sValorBase2AntINSS,
                              sValorBase3AntINSS,
                              sNumProcAntINSS,
                              True
                             );


  if dbrgFlgFormaPagto.ItemIndex = 0
  then sFlgFormaPagto := 'F'
  else sFlgFormaPagto := 'R';

  // verifica se o benef. é apenas de referência ou se paga.
  if EApenasReferencia(iIdPlanoPrev, iIdBenefReferencia) then
    sDataPagto := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date) 
  else
  begin
    
    Exit;

    sDataPagto := FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date);  
  end;

  // Verificar se participante já esta na bfciariotitplan para este beneficio
  if not qryBfciarioTitPlan.Locate('IdBeneficio',iIdBenefReferencia,[loCaseInsensitive])
  then begin
     qryBfciarioTitPlan.Insert;
     qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger      := iIdTitular;
     qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger     := iIdTitular;
     qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger   := iSeqProposta;

     qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger     := iIdPessJur;
     
     
     

     
     qryBfciarioTitPlan.FieldByName('IDPLANOORIGEM').AsInteger  := iIdPlanoPrev;
     

     qryBfciarioTitPlan.FieldByName('IDPLANOPREV').AsInteger   := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger   := iIdBenefReferencia;
     qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat      := 0;
     qryBfciarioTitPlan.FieldByName('Percentual').AsFloat      := 100;


     
     qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdTitular;

     If qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E' Then
       qryBfciarioTitPlan.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;
     

     qryBfciarioTitPlan.Post;
  end; //with

  if not qryBenefReferencia.Locate('IdBeneficio',iIdBenefReferencia,[loCaseInsensitive])
  then begin
     
     // benefício de suplementação.

     bGravaBenefReferencia := True;
     qryBenefReferencia.Insert;
     qryBenefReferencia.FieldByName('NUMEROPROCESSO').AsInteger  := iNumeroProcesso;
     qryBenefReferencia.FieldByName('IDPESSJUR').AsInteger       := iIdPessJur;

     qryBenefReferencia.FieldByName('IDPLANOORIGEM').AsInteger   := iIdPlanoPrev;

     if qryBenefReferencia.FieldByName('IdPlanoORIGEM').AsInteger <= 0 then
       qryBenefReferencia.FieldByName('IdPlanoORIGEM').AsInteger := iIdPlanoPrev;

     qryBenefReferencia.FieldByName('IDPLANOPREV').AsInteger     := iIdPlanoPrev;
     qryBenefReferencia.FieldByName('IDTITULAR').AsInteger       := iIdTitular;
     qryBenefReferencia.FieldByName('IDPESSOA').AsInteger        := iIdTitular;
     qryBenefReferencia.FieldByName('SEQPROPOSTA').AsInteger     := iSeqProposta;
     qryBenefReferencia.FieldByName('IDBENEFICIO').AsInteger     := iIdBenefReferencia;
     
     If dbrgrpBenefProvisorio.ItemIndex = 1
      Then qryBenefReferencia.FieldByName('FLGPROVISORIO').AsInteger   := 1
      Else qryBenefReferencia.FieldByName('FLGPROVISORIO').AsInteger   := 0;

     if sTipoFormChamador <> 'SI'
     then qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 4  
     else qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 8;

     qryBenefReferencia.FieldByName('IDDEPENDENCIA').AsString    := 'PRP';
     qryBenefReferencia.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryTpPgtoBenef.FieldByName('IDTPPAGTOBENEFIC').AsInteger;
     qryBenefReferencia.FieldByName('VALORCALCULADO').AsFloat    := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRCALCINSS').AsFloat       := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRINFINSS').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));

     
     if qryBeneficio.FieldByName('FLGTIPOGRAVAINSS').AsInteger = 0
     then begin
        qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
        qryBenefReferencia.FieldByName('VALORTOTAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     end
     else begin
        qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
        qryBenefReferencia.FieldByName('VALORTOTAL').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     end;
     qryBenefReferencia.FieldByName('DATAREQUERIMENTO').AsDateTime := dtDataRequerimento.Date;  

     qryBenefReferencia.FieldByName('DATAINICIO').AsString       := sDataPagto;


     qryBenefReferencia.FieldByName('DATAINICIOINSS').AsString   := qryDet.FieldByName('DATAINICIOINSS').AsString;
     qryBenefReferencia.FieldByName('DATAINICIOFUND').AsString   := qryDet.FieldByName('DATAINICIOINSS').AsString;
     qryBenefReferencia.FieldByName('DIBBENEFANT').AsString      := sDataInicioAntINSS;


     if dbrgrpDataPrevista.ItemIndex = 1
     then qryBenefReferencia.FieldByName('DATAFINAL').AsDateTime          := dtDataFinal.Date
     else qryBenefReferencia.FieldByName('DATAFINALPREVISTA').AsDateTime  := dtDataFinal.Date;  

     qryBenefReferencia.FieldByName('FLGFORMAPAGTO').AsString    := sFlgFormaPagto;


      //Renato Visoni SOL 123227 Kintana 614304
     if qryBenefReferencia.FieldByname('FONTEPAGADORA').asInteger = 1 then begin
       fSaldoContabil :=0;

       qryBenefReferencia.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                             QryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                                                             QryBeneficio.FieldByName('FlgResgate').AsInteger );
       //WO16247 - Helen V Bianchi - Inicio
       //qryBenefReferencia.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
       qryBenefReferencia.FieldByName('SALDOCONTADIB').asFloat := qryBenefReferencia.FieldByName('RESERVADIB').asFloat;
       //WO16247 - Helen V Bianchi - Fim

       //Renato Visoni SOL 161675 Kintana 1370250
       //qryBenefReferencia.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryBeneficio.FieldByname('IDPESSJUR').asString,QryBeneficio.FieldByname('IDPESSOA').asString,QryBeneficio.FieldByname('IDPLANOPREV').asString);
       qryBenefReferencia.FieldByName('INDICEDIB').asFloat     := BuscaIndice(IntTostr(iIdPessJur),IntTostr(iIdTitular),IntTostr(iIdPlanoPrev));
       //Renato Visoni SOL 161675 Kintana 1370250

     end;
     //Renato Visoni SOL 123227 Kintana 614304


     qryBenefReferencia.Post;
  end // with
  else begin // Editar beneficio de referencia
     bGravaBenefReferencia := True;
     qryBenefReferencia.Edit;
     qryBenefReferencia.FieldByName('VALORCALCULADO').AsFloat    := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRCALCINSS').AsFloat       := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRINFINSS').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('VALORTOTAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('DATAREQUERIMENTO').AsDateTime  := dtDataRequerimento.Date; 
     qryBenefReferencia.FieldByName('DATAINICIO').AsDateTime       := dtInicioINSS.Date;  

     if dbrgrpDataPrevista.ItemIndex = 1
     then qryBenefReferencia.FieldByName('DATAFINAL').AsDateTime          := dtDataFinal.Date   
     else qryBenefReferencia.FieldByName('DATAFINALPREVISTA').AsDateTime  := dtDataFinal.Date;  

     qryBenefReferencia.FieldByName('FLGFORMAPAGTO').AsString    := sFlgFormaPagto;

     //Renato Visoni SOL 123227 Kintana 614304
     if qryBenefReferencia.FieldByname('FONTEPAGADORA').asInteger = 1 then begin
       fSaldoContabil :=0;
       qryBenefReferencia.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                              QryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                                                              QryBeneficio.FieldByName('FlgResgate').AsInteger );
       //WO16247 - Helen V Bianchi - Inicio
       //qryBenefReferencia.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
       qryBenefReferencia.FieldByName('SALDOCONTADIB').asFloat := qryBenefReferencia.FieldByName('RESERVADIB').asFloat;
       //WO16247 - Helen V Bianchi - Fim

       //Renato Visoni SOL 161675 Kintana 1370250
       //qryBenefReferencia.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryBeneficio.FieldByname('IDPESSJUR').asString,QryBeneficio.FieldByname('IDPESSOA').asString,QryBeneficio.FieldByname('IDPLANOPREV').asString);
       qryBenefReferencia.FieldByName('INDICEDIB').asFloat     := BuscaIndice(IntTostr(iIdPessJur),IntTostr(iIdTitular),IntTostr(iIdPlanoPrev));
      //Renato Visoni SOL 161675 Kintana 1370250


      end;
     //Renato Visoni SOL 123227 Kintana 614304

     qryBenefReferencia.Post;
  end;
end;

function  TfrmCadRequerBenefParticip.AtualizaSitParticipante(piIdPessJur, piIdPlanoPrev,piIdPessoa,
                                      piSeqProposta, piIdEventoGerador : longint ) : boolean;
var iIdSitFuncNOVO, iIdSitPartNOVO, iIdSitPlanoNOVO : longint;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO '+
              ' FROM   EVENTOSPREV '+
              ' WHERE  (IDPESSJUR       = '+IntToStr(piIdPessJur)       +')'+
              ' AND    (IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)     +')'+
              ' AND    (IDPESSOA        = '+IntToStr(piIdPessoa)        +')'+
              ' AND    (SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +')'+
              ' AND    (IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador) +')'+
              ' ORDER BY DATAREGISTRO DESC ');
      Open;
      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;

      iIdSitFuncNOVO  := FieldByName('IdSitFuncNovo').AsInteger;
      iIdSitPartNOVO  := FieldByName('IdSitPartNovo').AsInteger;
      iIdSitPlanoNOVO := FieldByName('IdSitPlanoNovo').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+IntToStr(iIdSitFuncNOVO)+
              ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PARTPREVPLAN SET IDSITPART = '+IntToStr(iIdSitPartNOVO)+','+
              '                         IDSITPLANOPREV = '+IntToStr(iIdSitPlanoNOVO)+
              ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)   +
              ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +
              ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)    +
              ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta));
      try
         ExecSQL;
      except
         Exit;
      end;
   end; //with
   Result := True;
end;

function TfrmCadRequerBenefParticip.TestaQuitacaoDividas : boolean;
var dValorDivida    : double;
    sValor          : double;
    sSQL            : string;
    dValorDividaAss : extended;
    retButton       : Word;

    // Parametros para Quitacao de EMPRESTIMO
    fSaldoAtualizado,
    fSaldoDevedor,
    fParcelasAberto      : Currency;
    iPlanilha,
    iPlanilhaResult      : longint;
    sResult              : TStringList;
    sErro                : TStringList;
    sMensagemErro        : String;
    sDataSaldoEmprestimo : string;
begin
  // Quando o Pagamento do Beneficio é unico
  // Devemos verificar se o beneficio obriga quitar as dividas e se o Titular possui dividas.
  // Caso Positivo, A Situacao do Beneficio Permanece Pendente de Concessao ate que o Titular quite a divida
  Result := False;

  if ( qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsString = '1' ) and
     bPossuiDivPrevid then
  begin
    if MsgDlg( 'O participante '+Trim(sNomeTitular)+ ' possui dívida previdenciária e o ' +
               'plano permite a quitação automática desta dívida. ' + #13 +
               'Deseja quitar a dívida neste momento ? ',
               'Confirmação', mtConfirmation,  [mbYes, mbNo], 0 ) = mrNo then
      Exit;

    dValorDivida := DividaPrevidenciaria(qryAux,
                                         qryDet.FieldByName('IdPessJur').AsInteger,
                                         qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                                         qryDet.FieldByName('IdPessoa').AsInteger,
                                         qryDet.FieldByName('SeqProposta').AsInteger,
                                         FormatDateTime('yyyy/mm', qryDet.FieldByName('DataInicio').AsDateTime) 
                                        );

    if not(CobraContribAtrasada( qryDet.FieldByName('IdPessJur').AsInteger,
                                 qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                                 qryDet.FieldByName('IdPessoa').AsInteger,
                                 qryDet.FieldByName('SeqProposta').AsInteger,
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)  
                                )) then
    begin
      MsgDlg('Ocorreram erros na quitação da dívida previdenciária. Verifique.','Erro',mtError,[mbOk],0);
      Exit;
    end;
  end;

  // Modificação geral na integração com empréstimo
  iFlgEmprestimo := -1;
  If (qryBeneficio.FieldByName('FLGQUITAEMPRESTI').AsString = '1') Then
  Begin
    // ATUALIZAR SALDO DO EMPRESTIMO ATÉ A DATA DO LOTE
    With qryAux do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DATAPAGAMENTO FROM CTRLINTERFACE '+
              ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));
      Open;

      If IsEmpty or (FieldByName('DATAPAGAMENTO').AsString = '') Then
        sDataSaldoEmprestimo := sDataPagamentoLote
      Else
       sDataSaldoEmprestimo := FieldByName('DATAPAGAMENTO').AsString;
    end;

    if not dtmDividaEP.ValorDevidoMutuario( qryDet.FieldByName('IdPessoa').AsInteger,
                                            StrToDate(sDataSaldoEmprestimo),
                                            -1,
                                            10,
                                            fSaldoAtualizado,
                                            fSaldoDevedor,
                                            fParcelasAberto,
                                            False,
                                            False) then
    begin
      MsgDlg('Ocorreram erros na apuração do saldo devedor de empréstimo. Verifique.','Erro',mtError,[mbOk],0);
      Exit;
    end;

    if fSaldoAtualizado > 0 then
    begin
      
      if MsgDlg('Saldo de Empréstimo: ' + FormatFloat('#,0.00', fSaldoDevedor)    + #13 +
                 'Itens em Aberto:    ' + FormatFloat('#,0.00', fParcelasAberto)  + #13 +
                 'Saldo Atualizado:   ' + FormatFloat('#,0.00', fSaldoAtualizado) + '.'+ #13 + #13 +
                 'Este Saldo será descontado na Folha de Benefícios. Deseja Continuar a Concessão ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
        If (qryBeneficio.FieldByName('FLGPERMITEQUITAR').AsString = '1') Then
        Begin
          If MsgDlg('Deseja continuar com a concessão sem quitar o empréstimo?', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
            iFlgEmprestimo := 1;
            Result := True;
            Exit;
          End;
        End;

        MsgDlg('Concessão Cancelada.','Informação',mtInformation,[mbOK],0);
        Exit;
      end;

      iFlgEmprestimo := 0;
      if not(dtmDividaEP.QuitaContratosMutuario(  qryDet.FieldByName('IdPessoa').AsInteger,
                                                  StrToDate(sDataSaldoEmprestimo),
                                                  -1,
                                                  10,
                                                  'B',
                                                  iIdLoteConcessao,
                                                  sMensagemErro
                                                  ) ) then
      begin
        MsgDlg('Ocorreram erros na quitação automática de empréstimo. Verifique.','Erro',mtError,[mbOk],0);
        Exit;
      end;
      
    end;
  end
  else
    iFlgEmprestimo := 2; 

  if (qryBeneficio.FieldByName('FLGQUITAASSISTEN').AsString = '1') and bPossuiDivAssist then
  begin
    if MsgDlg( 'O participante '+sNomeTitular+ ' possui dívida assistencial e o ' +
               'plano permite a quitação automática desta dívida. ' + #13 +
               'Deseja quitar a dívida neste momento ? ',
               'Confirmação', mtConfirmation,  [mbYes, mbNo], 0) = mrNo then
      Exit;

    ConsultaDividaAssist(qryDet.FieldByName('IdPessoa').AsInteger,
                         dValorDividaAss, sSQL);

    if dValorDividaAss > 0 then
    begin
      with qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;
        First;
        while not Eof do
        begin
          If BaixaDividaAssist( FieldByName('Mes').AsString,
                                FieldByName('MesCobranca').AsString,
                                FieldByName('IdMotivo').AsInteger,
                                FieldByName('IdPlanAss').AsInteger,
                                FieldByName('IdPlanoPrev').AsInteger,
                                FieldByName('IdPessJur').AsInteger,
                                FieldByName('IdTitular').AsInteger,
                                FieldByName('IdDependente').AsInteger,
                                FieldByName('IdContAss').AsInteger) <> 0 Then
          Begin
            MsgDlg('Ocorreram erros na quitação da dívida assistencial. Verifique.','Erro',mtError,[mbOk],0);
            Exit;
          End;

          Next;
        end; // while not Eof

        Close;
      end;
    end;
  end;

  Result := True;
end; // TestaQuitacaoDividas



function  TfrmCadRequerBenefParticip.ChamaPreparoDeContribuicao(piIdPessJur,
                                                                piIdPlanoPrev,
                                                                piIdTitular,
                                                                piSeqProposta,
                                                                piNumeroProcesso : longInt;
                                                                psMatricula,
                                                                psDataEvento,
                                                                psDataFinal,
                                                                sValorBenef : string
                                                               ) : boolean;
var
  sSql, sDescPreparo, sMsgErro, sSqlRegra, sWhereSQLRegra, sAliasSQLRegra: string;
  sMesRef, sAnoRef, sDataFinal: string;
  sMesReferencia,
  sSalPart  : string;
  bErroPreparo : boolean;
  sDataInicio13,
  sDataFinalBenef : string;
begin
  Result  := False;

  sMesRef := FormatDateTime('mm', Date);
  sAnoRef := FormatDateTime('yyyy', Date);


  // Verificar contribuicoes que foram associadas no evento com flgCobra = 0
  // para colocar o flgCobra = 1 agora
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1 '+
                 ' WHERE  IDPESSOA    = '+IntToStr(piIdTitular)+
                 ' AND    IDPESSJUR   = '+IntToStr(piIdPessJur)+
                 ' AND    IDPLANOPREV = '+IntToStr(piIdPLANOPrev)+
                 ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                 // edilaine - SOL 253577-18094 / PPM 1269549 - INICIO
                 ' AND    IDCONTRIBUICAO IN  (SELECT B.IDCONTRIBUICAO  '+
                 '                              FROM BENEFXTAXA B, BENEFBFCIARIO BF '+
                 '                             WHERE B.IDBENEFICIO = BF.IDBENEFICIO '+
                 '                               AND BF.IDPESSOA    = '+IntToStr(piIdTitular)+
                 '                               AND BF.IDPESSJUR   = '+IntToStr(piIdPessJur)+
                 '                               AND BF.IDPLANOPREV = '+IntToStr(piIdPLANOPrev)+
                 '                               AND BF.SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                 '                               AND BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+')' );

                 {' AND    IDCONTRIBUICAO IN ( SELECT IDCONTRIBUICAO '+
                 '                            FROM   CONTPREVEVENTO '+
                 '                            WHERE  IDPLANOPREV = '+IntToStr(piIdPLANOPrev)+
                 '                            AND    IDEVENTOGERADOR = '+qry.FieldByName('IdEventoGerador').AsString+')'); }
                 // edilaine - SOL 253577-18094 / PPM 1269549 - FIM
  try
     qryAux.ExecSQL;
  except
     MsgDlg('Ocorreu um erro na atualização das Contribuições a Cobrar. Verifique. ',
            'Erro',mtError,[mbOk],0);
     Exit;
  end;

  // Prepara query para passar as contribuicoes a cobrar para o Preparo
  sSQL := ' SELECT CP.IDCONTRIBUICAO, CP.SEQPROPOSTA, CP.IDCONTRIBUICAO, CP.IDPESSOA,    ' +
          '        CP.CODPORTFORMA, CP.FLGDESCFOLHA, CP.VALORBASE1, CP.VALORBASE2,       ' +
          '        CP.VALORBASE3, CP.DATAINICIO, CP.DATAFINAL, C.NOME, PP.INSCRICAODATA, ' +
          '        PF.DATANASC, CT.ORDEMCALCULO                                          ' +
          ' FROM  CONTRIBUICAO C, CONTPREV CT,  PARTPREVPLAN PP, CONTRIBPREVPARTP CP,    ' +
          '       PESSOAFISICA PF                                                        ' +
          ' WHERE CP.IDPESSJUR      = ' + IntToStr(piIdPessJur)   + ' AND ' +
          '       CP.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev) + ' AND ' +
          '       CP.IDPESSOA       = ' + IntToStr(piIdTitular)   + ' AND ' +
          '       CP.SEQPROPOSTA    = ' + IntToStr(piSeqProposta) + ' AND ' +
          '       CP.FLGRETROATIVO  = 1 AND ' +
          '       CP.FLGCOBRA = 1 AND '+
          '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
          '       PP.IDPESSJUR      = CP.IDPESSJUR AND '+
          '       PP.IDPLANOPREV    = CP.IDPLANOPREV AND '+
          '       PP.IDPESSOA       = CP.IDPESSOA AND '+
          '       PP.SEQPROPOSTA    = CP.SEQPROPOSTA AND '+
          '       PF.IDPESSOA       = CP.IDPESSOA AND '+
          '       CT.IDPLANOPREV    = CP.IDPLANOPREV AND '+
          '       CT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO '+
          ' ORDER BY CT.ORDEMCALCULO ';

  sMesReferencia   := Copy(Trim(psDataEvento), 7, 4) + '/' + Copy(Trim(psDataEvento), 4, 2);

   // Se, no evento (principalmente os temporarios), o usuario optou
   // por usar salario virtual, passar o salario virtual como salario
   // senao, calcular salario
   if (qryEvento.FieldbyName('FlgInterno').AsString = 'IN') or
      (qryEvento.FieldbyName('FlgInterno').AsString = 'DO') or
      (qryEvento.FieldbyName('FlgInterno').AsString = 'AC') or
      (qryEvento.FieldbyName('FlgInterno').AsString = 'OE') then
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT SALAUXDOENCA, FLGSALVIRTBENEF '+
                     ' FROM   PARTPREVPLAN '+
                     ' WHERE  IDPESSOA    = '+IntToStr(piIdTitular)+
                     ' AND    IDPESSJUR   = '+IntToStr(piIdPessJur)+
                     ' AND    IDPLANOPREV = '+IntToStr(piIdPLANOPrev)+
                     ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta));
      qryAux.Open;

      // Se nao encontrou o salario virtual, pegar o salario default
      if (qryAux.IsEmpty) or
         (qryAux.FieldByName('SalAuxDoenca').AsString = '') or
         (qryAux.FieldByName('SalAuxDoenca').AsString = '0') or
         (qryAux.FieldByName('FlgSalVirtBenef').AsInteger <> 1)
      then sSalPart := ORANUMERO(CalcSalPart(piIdPessJur,
                                              piIdTitular,
                                              sAnoMesAnterior(sMesReferencia),
                                              qryAux))
      else sSalPart := ORANUMERO(qryAux.FieldbyName('SALAUXDOENCA').AsString);
   end
   else sSalPart := ORANUMERO(CalcSalPart(piIdPessJur,
                                    piIdTitular,
                                    sAnoMesAnterior(sMesReferencia),
                                    qryAux));

  qryAux.Close;

  if Trim(sSalPart) = ''         then  sSalPart := '0';

  sSqlRegra := ' SELECT C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES, ' +
               '        CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO,  '+
               '        EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, ' +
               '        P.NUMDOCUMENTO, PF.DATAMORTE, PP.SALPARTICIPACAO, ' +
                        sSALPART + ' AS VALORPROVENTO, ' +
                        Trim(psDataEvento) + ''' AS DATAREF, ' +
               ' CP.VALORBASE1,CP.VALORBASE2,CP.VALORBASE3, '+
               '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA ' +
               ' FROM CONTRIBPREVPARTP CP, CONTPREV C, CONTRIBUICAO CONT, ' +
               '      PARTPREVPLAN PP, ELEGPATRO EL, PESSOA P, PESSOAFISICA PF, PLANPREV PL ';

  sWhereSQLRegra := ' CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' +
                    ' CP.IDPLANOPREV = C.IDPLANOPREV AND ' +
                    ' CP.FLGCOBRA = 1 AND ' +
                    ' CP.FLGRETROATIVO = 1 AND ' +
                    ' PL.IDPLANOPREV = CP.IDPLANOPREV  AND ' +
                    ' CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' +
                    ' PP.IDPESSOA = CP.IDPESSOA AND ' +
                    ' PP.IDPESSJUR = CP.IDPESSJUR AND ' +
                    ' PP.IDPLANOPREV = CP.IDPLANOPREV AND ' +
                    ' EL.IDPESSOA = PP.IDPESSOA AND ' +
                    ' EL.IDPESSJUR = PP.IDPESSJUR AND ' +
                    ' P.IDPESSOA = EL.IDPESSOA AND ' +
                    ' PF.IDPESSOA = P.IDPESSOA ';

  sAliasSQLRegra := 'CP';

  sDescPreparo := 'Contribuição de Assistido - Matrícula: ' + psMatricula+
                  ' - Processo n°: ' + IntToStr(piNumeroProcesso);

  // Se nao tiver data final -> entao prepara as contribuicoes ate hoje
  if Trim(psDataFinal) = ''
  then sDataFinal := ''
  else if (StrtoDate(psDataFinal) > Date)
          Or (qryDet.FieldByName('FLGBENEFTEMP').AsInteger = 1)
       then sDataFinal := psDataFinal
       Else sDataFinal := FormatDateTime('dd/mm/yyyy', Date);

  // Abrir a query e verificar se tem alguma coisa a preparar
  bErroPreparo := False;
  qryContrib.Close;
  qryContrib.SQL.Clear;
  qryContrib.SQL.Add(sSQL);
  try
     qryContrib.Open;
  except
     sMsgErro := ' Erro na consulta de contribuições a preparar. ';
     bErroPreparo := True;
  end;

  if bErroPreparo // Deu erro no preparo
  then begin
     if  MsgDlg(sMsgErro+' Deseja conceder o benefício ? ','Confirmação',mtConfirmation ,[mbNo, mbYes, mbHelp],0) = mrNo
     then Exit;
  end;

  if qryContrib.IsEmpty
  then begin
     Result := True;
     qryContrib.Close;
     Exit;
  end;

  // edilaine - SOL 253577-17464 / PPM 955703 - inicio

  bErroPreparo := ExecutaSP_PreparoContribuicao(piNumeroProcesso,
                                                qryDet.fieldByName('IDPESSOA').AsInteger,
                                                prmIdMotivoContrib,
                                                iIdLoteConcessao,
                                                DbLAlterador.Text,sAnoMesPagamento ,
                                                '', //Helio - SOL Nº 253577/17666 PPM Nº 1019935//sMesReferencia
                                                -1,    // edilaine - SOL 253577-18070  PPM 1240812 - inicio
                                                -1,
                                                6     // edilaine - SOL 253577-18070  PPM 1240812 - fim
                                                );
  ///// comentar esse chamada
 { bErroPreparo := PreparaContribuicaoASSISTIDO(piIdPessJur,
                                               piIdPlanoPrev,
                                               prmIdMotivoContrib, 0,
                                               qryContrib, qryAux, sSQL,
                                               '',
                                               '',
                                               '',
                                               'AS',
                                               sDescPreparo,
                                               'R',
                                               '1',
                                               False, False, sMsgErro, iIdLoteConcessao,
                                               sSalPart,'',
                                               qryEvento.FieldbyName('FlgInterno').AsString,
                                               True,
                                               False,
                                               '',
                                               False,
                                               qryEvento.FieldbyName('IdEventoGerador').AsInteger,
                                               FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                               sDataFinal,
                                               2,
                                               qryDet.FieldByName('FlgDataPrevista').AsInteger,
                                               FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                               piNumeroProcesso
                                              );  }

  // edilaine - SOL 253577-17464 / PPM 955703 - fim

  if bErroPreparo // Deu erro no preparo
  then begin
     if  MsgDlg(sMsgErro+' Deseja conceder o benefício ? ','Confirmação',mtConfirmation ,[mbNo, mbYes, mbHelp],0) = mrNo
     then Exit;
  end
  else begin   // Preparo nao deu erro
     if Trim(sMsgErro) <> ''  // houve mensagem de insconsistencia
     then begin
        if  MsgDlg(sMsgErro+' Deseja conceder o benefício ? ','Confirmação',mtConfirmation ,[mbNo, mbYes, mbHelp],0) = mrNo
        then Exit;
     end;
  end; //if bErroPreparo

  // CONTRIBUICAO SOBRE 13o. ( ABONO )
  // Se pagou abono no final do beneficio no ano atual, ou seja, o beneficio que esta sendo
  // concedido ja comecou e ja acabou, entao preparar a contribuicao sobre este beneficio
  // tambem
  // AS CONTRIBUICOES SOBRE 13o. DOS ANOS ANTERIORES JÁ FORAM CALCULADAS NA
  // CHAMADA ANTERIOR.

  Result := True;
end; // ChamaPreparoDeContribuicao

function  TfrmCadRequerBenefParticip.CalculaSaldoRealCont(piIdTipoReserva : integer; pdVlMovReal : double) : double;
var dVlSaldoCont : double;
begin
   Result := 0;

   qryaux.Close;
   qryaux.sql.clear;
   qryaux.sql.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT '+
                  ' FROM   HISTMOVRESERVA '+
                  ' WHERE  IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+
                  ' AND    IDPESSJUR     = '+IntToStr(iIdPessJur)+
                  ' AND    IDTIPORESERVA = '+IntToStr(piIdTipoReserva)+
                  ' AND    SEQPROPOSTA   = '+IntToStr(iSeqProposta)+
                  ' AND    IDPESSOA IN (NULL,'''+IntToStr(iIdTitular)+''') '+
                  ' GROUP  BY DATAMOV, SALDOREAL,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ');
   try
      qryaux.open;
   except
      Exit;
   end;

   if qryaux.IsEmpty
   then dVlSaldoCont := pdVlMovReal
   else begin
      qryaux.Last;
      if (qryaux.FieldByName('IDEVENTOGERADOR').AsString = '') and
         (qryaux.FieldByName('IDBENEFICIO').AsString     = '') and
         (qryaux.FieldByName('IDCONTRIBUICAO').AsString  = '') and
         (qryaux.FieldByName('VLRCOTAS').AsFloat <= 0) //o último lançamento foi uma atualização monetária
      then dVlSaldoCont := pdVlMovReal
      else dVlSaldoCont := qryaux.fieldbyname('SALDOREALCONT').AsFloat - pdVlMovReal;
   end;
   qryaux.close;
   Result := dVlSaldoCont;
end; //CalculaSaldoRealCont

function  TfrmCadRequerBenefParticip.DevolveReserva(piIdBeneficio : longint; bApagaMovTemp : boolean)  : boolean;
var dValorTotalReserva,
    dValorDaCotaNaData,
    dNovoValorReserva,
    dValorADevolverEmCotas : double;
    sDataRef : string;
begin
   Result := False;
   dValorTotalReserva := 0;
   qryMovReservaTemp.First;
   while not qryMovReservaTemp.Eof do
   begin
       if qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio
       then begin
          qryMovReservaTemp.Next;
          continue;
       end;
       // Preencher valor da reserva do participante hoje
       if not qryReservaPart.Locate('IdTipoReserva', qryMovReservaTemp.FieldbyName('IdTipoReserva').AsInteger,[loCaseInsensitive])
       then begin
          // nao encontrou a reserva
          qryMovReservaTemp.Next;
          continue;
       end;

       with qryReservaPart do
       begin
          Edit;
          FieldByName('VALORRESERVA').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat;
          Post;
       end;

       qryMovReservaTemp.Delete;
   end;

   Result := True;
end; // DevolveReserva

function  TfrmCadRequerBenefParticip.MontaSQLBenefAssoc (piNumOrdem : longint) : string;
var sValor,
    sSQL : string;
    iNumBenefAssoc : integer;
begin
   Result := '';
   sSQL   := '';

   iNumBenefAssoc := 0;
   qryBenefAux.First;
   while not qryBenefAux.Eof do
   begin
      if qryBenefAux.FieldByName('NumOrdemEvento').AsInteger >= piNumOrdem
      then begin
         qryBenefAux.Next;
         continue;
      end;
      inc(iNumBenefAssoc);


      if qryBenefAux.FieldByName('FlgCalcTodoMes').AsInteger = 1
      then begin
         if Trim(qryBenefAux.FieldByName('VALORCOTAS').AsString) <> ''
         then sValor := qryBenefAux.FieldByName('VALORCOTAS').AsString
         else sValor := '0';
      end
      else begin
         if Trim(qryBenefAux.FieldByName('VALORATUAL').AsString) <> ''
         then sValor := qryBenefAux.FieldByName('VALORATUAL').AsString
         else sValor := '0';
      end;

      sSQL := sSQL +','+OraNumero(sValor)+' AS VALORASSOCIADO'+IntToStr(iNumBenefAssoc);

      if Trim(qryBenefAux.FieldByName('VALORBASE1').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE1').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP1';

      if Trim(qryBenefAux.FieldByName('VALORBASE2').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE2').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP2';

      if Trim(qryBenefAux.FieldByName('VALORBASE3').AsString) <> ''
      then sValor := qryBenefAux.FieldByName('VALORBASE3').AsString
      else sValor := '0';
      sSQL := sSQL +','+OraNumero(sValor)+' AS ASSOC'+IntToStr(iNumBenefAssoc)+'OP3';
      qryBenefAux.Next;
   end; //while
   Result := sSQL;

end; //MontaSQLBenefAssoc


function  TfrmCadRequerBenefParticip.VerificaNumeroDependentes : boolean;
var iNumDepIRRF,
    iNumDepSalF,
    iNumDepIRRFCad,
    iNumDepSalFCad    : longint;
begin
  Result := False;
  // Verificar se o No. de Dependentes para IRRF e para Salario Familia coincidem
  // com o no. de dependentes cadastrados no sistemas que dizem que conta para IRRF
  // e para Salario Familia
  with qryAux do
  begin
     
     // Se a fundacao parametrizou que utilizara o calculo automatica de numero
     // de dependentes, entao nao atualizar por esta rotina abaixo
     Close;
     SQL.Clear;
     SQL.Add(' SELECT VALORPARAM FROM PARAMFOLHA '+
             ' WHERE NOMEPARAM = ''FLGNUMDEPIRNUMDEPSALFAM'' ');
     Open;
     if (not IsEmpty) and (FieldbyName('VALORPARAM').AsString = '1')
     then begin
        Result := True;
        Exit;
     end;

     Close;
     SQl.Clear;
     SQL.Add(' SELECT NUMDEPIRRF, NUMDEPSALF FROM PESSOAFISICA WHERE IDPESSOA = '+IntToStr(iIdTitular));
     Open;
     if IsEmpty
     then begin
       iNumDepIRRF := 0;
       iNumDepSalF := 0;
     end
     else begin
       if Trim(FieldByName('NumDepIRRF').AsString) <> ''
       then iNumDepIRRF := FieldByName('NUMDEPIRRF').AsInteger
       else iNumDepIRRF := 0;
       if Trim(FieldByName('NumDepSALF').AsString) <> ''
       then iNumDepSalF := FieldByName('NUMDEPSALF').AsInteger
       else iNumDepSalF := 0;
     end;
  end;

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPIRRF FROM DEPENTIT '+
             ' WHERE IDTITULAR = '+IntToStr(iIdTitular)+
             ' AND   IDPESSOA <> IDTITULAR '+
             ' AND   FLGCONTAIMPOSTOR = 1 ');
     Open;
     if IsEmpty
     then iNumDepIRRFCad := 0
     else iNumDepIRRFCad := FieldByName('NumDepIRRF').AsInteger;

     if (iNumDepIRRF <> iNumDepIRRFCad)
     then begin
        if MsgDlg(' Existem '+IntToStr(iNumDepIRRFCad)+ ' dependentes cadastrados '+
                  ' no sistema para IRRF. Porém existem '+InttoStr(iNumDepIRRF)+
                  ' dependentes informados nos dados do participante. '+
                  ' Deseja atualizar este número no cadastro de participante ? ',
                  'Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
        then begin
           Result := True;
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQl.Add(' UPDATE PESSOAFISICA SET NUMDEPIRRF = '+IntToStr(iNumDepIRRFCad)+
                          ' WHERE IDPESSOA = '+IntToStr(iIdTitular));
           try
             qryAux.ExecSQL;
           except
             Result := False;
           end;
        end
        else if MsgDlg(' Deseja continuar com o processo ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
             then Result := True
             else Result := False;

     end
     else Result := True;
  end;//with qryAux

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPSALF FROM DEPENTIT '+
             ' WHERE IDTITULAR = '+IntToStr(iIdTitular)+
             ' AND   IDPESSOA <> IDTITULAR '+
             ' AND   FLGCONTASALARIOF = 1 ');
     Open;
     if IsEmpty
     then iNumDepSalFCad := 0
     else iNumDepSalFCad := FieldByName('NumDepSALF').AsInteger;

     if (iNumDepSalF <> iNumDepSalFCad)
     then begin
        if MsgDlg(' Existem '+IntToStr(iNumDepSalFCad)+ ' dependentes cadastrados '+
                  ' no sistema para Salário Família. Porém existem '+InttoStr(iNumDepSalF)+
                  ' dependentes informados nos dados do participante. '+
                  ' Deseja atualizar este número no cadastro de participante ? ',
                  'Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
        then begin
           Result := True;
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQl.Add(' UPDATE PESSOAFISICA SET NUMDEPSALF = '+IntToStr(iNumDepSalFCad)+
                          ' WHERE IDPESSOA = '+IntToStr(iIdTitular));
           try
             qryAux.ExecSQL;
           except
             Result := False;
           end;
        end
        else if MsgDlg(' Deseja continuar com o processo ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
             then Result := True
             else Result := False;
     end
     else Result := True;
  end;//with qryAux

end; // VerificaNumeroDependentes

function  TfrmCadRequerBenefParticip.VerificaBeneficioObrigatorio : boolean;
var bExisteBenefDaMesmaOrdem,
    bExisteBenefNaoRequerido : boolean;
    iIdBenefAntes,
    iNumBenefNaoRequeridos   : longint;
    sMsg ,
    sNomesBeneficios         : string;
begin
  Result := False;
  iIdBenefAntes := qryDet.FieldByName('IdBeneficio').AsInteger;

  // Fazer verificacoes
  // Verificar se existem algum benefício obrigatorio, de ordem diferente no evento que não foi
  // requerido
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NOME, B.NUMORDEMEVENTO       '+
                 ' FROM   BENEFICIO B, BENEFICIO BDET, BENEFPLANPREV BP '+
                 ' WHERE  B.IDEVENTOGERADOR  = '+qryEvento.FieldByName('IdEventoGerador').AsString+
                 ' AND    B.FLGBENEFOBRIGATO = 1 '+
                 ' AND    BP.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BDET.IDBENEFICIO   = '+IntToStr(qryDet.FieldByName('IdBeneficio').AsInteger)+
                 ' AND    B.NUMORDEMEVENTO  <> BDET.NUMORDEMEVENTO '+
                 ' AND    BP.IDBENEFICIO     = B.IDBENEFICIO ');
  qryAux.Open;
  bExisteBenefNaoRequerido := False;
  sNomesBeneficios         := '';
  iNumBenefNaoRequeridos   := 0;

  while not qryAux.Eof do
  begin
     if (not qryDet.Locate('IdBeneficio',qryAux.FieldbyName('IdBeneficio').AsInteger,[loCaseInsensitive]))
     then begin
        // Verificar se tem outro beneficio da mesma ordem
        bExisteBenefDaMesmaOrdem := False;
        qryDet.First;
        while not qryDet.Eof do
        begin
           if (qryDet.FieldByName('NumOrdemEvento').AsInteger) =  (qryAux.FieldByName('NumOrdemEvento').AsInteger)
           then begin
              bExisteBenefDaMesmaOrdem := True;
              break;
           end;
           qryDet.Next;
        end;
        if not bExisteBenefDaMesmaOrdem
        then begin
           sNomesBeneficios := sNomesBeneficios +', '+qryAux.FieldByName('Nome').AsString;
           bExisteBenefNaoRequerido := True;
           inc(iNumBenefNaoRequeridos);
        end;
     end;
     qryAux.Next;
  end; //while

  qryDet.Locate('IdBeneficio',iIdBenefAntes,[loCaseInsensitive]);

  if bExisteBenefNaoRequerido
  then begin
     sNomesBeneficios := Copy(sNomesBeneficios,3,length(sNomesBeneficios) - 2);
     if (sistema.idmodulo <>454) then begin
         if (iNumBenefNaoRequeridos = 1)
         then sMsg := 'O benefício  '+sNomesBeneficios+ ' é obrigatório e não foi requerido.'
         else sMsg := 'Os benefícios '+sNomesBeneficios+ ' são obrigatórios e não foram requeridos.';

         if MsgDlg(sMsg+'Deseja confirmar o Requerimento do Processo '+IntToStr(iNumeroProcesso)+' ? ' ,
                   'Confirmação',mtConfirmation,[mbYes,mbNo], 1) = mrNo
         then begin
            TiraSQL(qryAux);
            Exit;
         end;
     end;
  end;
  Result := True;
end; // VerificaBeneficioObrigatorio

function  TfrmCadRequerBenefParticip.VerificaBeneficioRepetido    : boolean;
var bExisteBenefRepetido  : boolean;
    iNumBenefRepetido : integer;
    sMsg ,
    sNomesBeneficios : string;
begin
  Result := False;
  // Fazer verificacoes
  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // Repetido
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NOME, B.NUMORDEMEVENTO '+
                 ' FROM   BENEFICIO B, BENEFPLANPREV BP '+
                 ' WHERE  (B.IDEVENTOGERADOR = '+qryEvento.FieldByName('IdEventoGerador').AsString+')'+
                 ' AND    (BP.FLGREFERENCIA  = 0 ) '+    
                 ' AND    (BP.IDPLANOPREV    = '+IntToStr(iIdPlanoPrev)+')'+
                 ' AND    (B.IDBENEFICIO     = BP.IDBENEFICIO) ');
  qryAux.Open;
  bExisteBenefRepetido := False;
  sNomesBeneficios     := '';
  iNumBenefRepetido    := 0;
  while not qryAux.Eof do
  begin
     if (qryDet.Locate('NumOrdemEvento',qryAux.FieldbyName('NumOrdemEvento').AsString,[loCaseInsensitive])) and
        (qryDet.FieldByName('IdBeneficio').AsString <> qryAux.FieldByName('IdBeneficio').AsString)
     then begin
        sNomesBeneficios := sNomesBeneficios +', '+qryAux.FieldByName('Nome').AsString;
        bExisteBenefRepetido := True;
        inc(iNumBenefRepetido);
     end;
     qryAux.Next;
  end; //while

  if bExisteBenefRepetido
  then begin
     sNomesBeneficios := Copy(sNomesBeneficios,3,length(sNomesBeneficios) - 2);
     if (sistema.IdModulo <> 454) then begin
       if iNumBenefRepetido = 1
       then sMsg := 'O benefício  '+sNomesBeneficios+ ' possui o mesmo número de '+
                    'ordem de outro benefício neste processo. '
       else sMsg := 'Os benefícios '+sNomesBeneficios+ ' possum o mesmo número de ordem '+
                    'de outro benefício neste processo. ' ;

       if MsgDlg(sMsg+'Deseja confirmar o Requerimento do Processo '+IntToStr(iNumeroProcesso)+' ? ' ,
                 'Confirmação',mtConfirmation,[mbYes,mbNo], 1) = mrNo
       then begin
          TiraSQL(qryAux);
          Exit;
       end;
     end;
  end;
  Result := True;
end; // VerificaBeneficioRepetido

function  TfrmCadRequerBenefParticip.VerificaContribAtrasada (var sMesAtraso : string) : boolean;
var sMesRef : string;
begin
  Result := False;

  // Verificar se participante tem contribuicoes atrasadas
  frmAguarde.Mostra('Verificando contribuições atrasadas ... ');

  sMesRef := FormatDateTime('yyyy/mm', dtInicioFund.Date);  

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT HST.MESREFERENCIA FROM HSTCONTRIBPREV HST '+
             ' WHERE  (HST.IDPESSOA      = '  +IntToSTr(iIdTitular)  +')'+
             ' AND    (HST.IDPESSJUR     = '  +IntToSTr(iIdPessJur)  +')'+
             ' AND    (HST.IDPLANOPREV   = '+IntToSTr(iIdPlanoPrev)+')'+
             ' AND    (HST.SEQPROPOSTA   = '+IntToSTr(iSeqProposta)+')'+
             ' AND    (HST.VALORESPERADO > 0 )  '+
             ' AND    (HST.SITRECEBIMENTO IN (''0'',''1'',''3'')) '+
             ' AND    (HST.MESREFERENCIA < '''+sMesRef+''') '+
             ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
             '                                    WHERE  IDPESSJUR   = '+IntToSTr(iIdPessJur)+
             '                                    AND    IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+') )'+
             ' ORDER BY HST.MESREFERENCIA DESC');
     Open;
     if not IsEmpty
     then begin
        sMesAtraso := FieldByName('MesReferencia').AsString;
        Result     := True;
     end;
     Close;
  end; //with
  frmAguarde.Apaga;
end; // VerificaContribAtrasada

function  TfrmCadRequerBenefParticip.VerificaContribPosterior(var sMesPosterior : string) : boolean;
var sMesRef, sAnoMesFinal : string;
begin
   Result := False;
   frmAguarde.Mostra('Verificando contribuições posteriores a data de início ... ');

   sMesRef := FormatDateTime('yyyy/mm', dtInicioFund.Date); 

   if qryDet.FieldbyName('DATAFINAL').AsString <> ''
   then sAnoMesFinal := FormatDateTime('yyyy/mm', qryDet.FieldByName('DATAFINAL').AsDateTime) 
   else if qryDet.FieldbyName('DATAFINALPREVISTA').AsString <> ''
        then sAnoMesFinal := FormatDateTime('yyyy/mm', qryDet.FieldByName('DATAFINALPREVISTA').AsDateTime);

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT HST.MESREFERENCIA FROM HSTCONTRIBPREV HST '+
              ' WHERE  (HST.IDPESSOA  = '  +IntToSTr(iIdTitular)  +')'+
              ' AND    (HST.IDPESSJUR = '  +IntToSTr(iIdPessJur)  +')'+
              ' AND    (HST.IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+')'+
              ' AND    (HST.SEQPROPOSTA = '+IntToSTr(iSeqProposta)+')'+
              ' AND    (HST.MESREFERENCIA > '''+sMesRef+''') ');

      if Trim(sAnoMesFinal) <> ''
      then SQL.Add(' AND (HST.MESREFERENCIA <= '''+sAnoMesFinal+''') ');

      SQL.Add(' AND    (HST.VALORRECEBIDO  IS NOT NULL)  '+
              ' AND    (HST.VALORRECEBIDO  > 0)          '+
              ' AND    ((HST.OPTRATDIVERG   NOT IN ( 4,5,6,8 )) OR (HST.OPTRATDIVERG IS NULL) ) '+
              ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
              '                                    WHERE  IDPESSJUR   = '+IntToSTr(iIdPessJur)+
              '                                    AND    IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+') )'+
              ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT CPP.IDCONTRIBUICAO '+
              '                                    FROM   CONTRIBPREVPARTP CPP '+ //, CONTPREVEVENTO CE '+      // edilaine - SOL 253577-18094 / PPM 1269549 - INICIO
              '                                    WHERE  (CPP.IDPESSOA  = '  +IntToSTr(iIdTitular)  +')'+
              '                                    AND    (CPP.IDPESSJUR = '  +IntToSTr(iIdPessJur)  +')'+
              '                                    AND    (CPP.IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+')'+
              '                                    AND    (CPP.SEQPROPOSTA = '+IntToSTr(iSeqProposta)+')'+
              '                                    AND    EXISTS (SELECT 1 '+
              '                                                     FROM  BENEFXTAXA B, BENEFBFCIARIO BF '+
              '                                                     WHERE B.IDBENEFICIO = BF.IDBENEFICIO '+
              '                                                       AND B.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
              '                                                       AND BF.IDPESSOA    = '+IntToStr(iIdTitular)+
              '                                                       AND BF.IDPESSJUR   = '+IntToStr(iIdPessJur)+
              '                                                       AND BF.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+
              '                                                       AND BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+
              '                                                       AND BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+')'+
              //'                                    AND    (CE.IDPLANOPREV  = '+IntToSTr(iIdPlanoPrev)+')'+
              //'                                    AND    (CE.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO ) '+
              //'                                    AND    (CE.IDEVENTOGERADOR = '+qry.FieldByName('IdEventoGerador').AsString+')'+
              // edilaine - SOL 253577-18094 / PPM 1269549 - FIM
              '                                    AND    (CPP.DATAINICIO     = TO_DATE('''+qryDet.FieldByName('DataInicioFund').AsString+''',''DD/MM/YYYY'')) ) )'+
              ' ORDER BY HST.MESREFERENCIA ');
      Open;
      if not IsEmpty
      then begin
         Last;
         sMesPosterior := FieldByName('MesReferencia').AsString;
         Result := True;
      end;
      Close;
   end; //with
   frmAguarde.Apaga;
end; // VerificaContribPosterior

function  TfrmCadRequerBenefParticip.CobraContribAtrasada(piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                   psDataInicioFund : string) : boolean;
var sMesRef : string;
begin
   Result := False;

   // Verificar se participante tem contribuicoes atrasadas
   frmAguarde.Mostra('Atualizando contribuições atrasadas ... ');
   sMesRef := Copy(psDataInicioFund,7,4)+'/'+Copy(psDataInicioFund,4,2);

   //BRUNO AZEVEDO SOL 130057 KINTANA 717976
   if (iIdEvento <> 334) and (iIdEvento <> 337) and (iIdEvento <> 15) and (iIdEvento <> 336) and (iIdEvento <> 345) then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE HSTCONTRIBPREV HST SET SITRECEBIMENTO = 9  '+
                ' WHERE  (HST.IDPESSOA  = '  +IntToSTr(iIdTitular)  +')'+
                ' AND    (HST.IDPESSJUR = '  +IntToSTr(iIdPessJur)  +')'+
                ' AND    (HST.IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+')'+
                ' AND    (HST.SEQPROPOSTA = '+IntToSTr(iSeqProposta)+')'+
                ' AND    (HST.SITRECEBIMENTO <> 2) '+
                ' AND    (HST.SITRECEBIMENTO <> 5) '+
                ' AND    (HST.SITRECEBIMENTO <> 9) '+
                ' AND    (HST.MESREFERENCIA < '''+sMesRef+''') ');
        try
          ExecSQL;
        except
          frmAguarde.Apaga;
          Exit;
        end;
     end; //with
   end;
   //BRUNO AZEVEDO SOL 130057 KINTANA 717976

   frmAguarde.Apaga;
   Result := True;
end; // CobraContribAtrasada

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS OVERRIDE *************************
// ********************************** ********************** *************************
procedure TfrmCadRequerBenefParticip.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   // Se for concessao de beneficio, desbilitar o inserir
   sbtnInserir.Enabled  := ( (sTipoFormChamador <> 'CO') and (sTipoFormChamador <> 'MA') );
   sbtnConceder.Enabled := (sTipoFormChamador = 'CO') and (not qryDet.IsEmpty);
   sbtnProcurar.Enabled := (sTipoFormChamador <> 'EV');
   sbtnImprimirSimulacao.Visible := False;
   sbtnImprimirSimulacao.Enabled := False;
   sbtnDemonsSRB.Visible         := False;
   sbtnDemonsSRB.Enabled         := False;

   LblAlterador.visible      := sbtnConceder.Enabled; // SOL 132938
   DbLAlterador.visible      := sbtnConceder.Enabled; // SOL 132938

   if sTipoFormChamador = 'SI'
   then begin
      if not prmFlgGravaSimulBenef
      then sbtnProcurar.Enabled     := False
      else sbtnProcurar.Enabled     := True;
      sbtnImprimirSimulacao.Visible := True;
      sbtnImprimirSimulacao.Enabled := True;
   end
   else begin
      sbtnDemonsSRB.Visible         := True;
      //sbtnDemonsSRB.Enabled         := True;          // edilaine - SOL 253577-18129 / PPM 1303078
   end;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {se entrou na concessão pela tela de requerimento, desabilitar controles}
  if sRequerimento then
     ConfiguraAcessosTela(ctConcessaoViaRequerimento);
  sbtnApagar.enabled := false;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmCadRequerBenefParticip.CmeCadastroConfirma(Sender: TObject);
begin
   try

         //Vinicius Ferreira SOL 157583 Kintana 1269810
      with qryBfciariotitPlanAux do
         if Active and UpdatesPending then ApplyUpdates;

      //Renato Visoni SOL 162023 KINTANA 1373448
      with qryBenefAux do begin
         if qryBenefAux.State in [dsEdit] then begin
           if Active and UpdatesPending then ApplyUpdates;
         end else begin
           if Active and UpdatesPending then CancelUpdates;
         end;
      end;
      //Renato Visoni SOL 162023 KINTANA 1373448

      //inherited;

      with qry do begin
         if qry.State in [dsEdit, dsInsert] then qry.Post;
         if Active and UpdatesPending       then ApplyUpdates;
      end;

      with qryBfciarioTitPlan do
         if Active and UpdatesPending then ApplyUpdates;

      with qryDet do
         // edilaine - SOL 271517 / PPM 1367209 - inicio
         //if Active and UpdatesPending then ApplyUpdates;
         if Active and UpdatesPending
         then begin
             // Andre Imakawa - SIG 61218 - Inicio
             if (Sistema.IdModulo = 454) and (sTipoFormChamador <> 'CO')
                 and (sTipoFormChamador <> 'SI') then
             begin
                  updDet.InsertSQL.Clear;
                  updDet.InsertSQL.Add('insert into BENEFBFCIARIO' + #13#10 +
                  '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDPLANOORIGEM,' + #13#10 +
                  'IDTITULAR, IDPESSOA,' + #13#10 +
                  '   SEQPROPOSTA, IDBENEFICIO, IDBENEFREFEREN, CODPORTFORMA,' + #13#10 +
                  'IDSITBENEFICIO,' + #13#10 +
                  '   IDDEPENDENCIA, IDTPPAGTOBENEFIC, VALORATUAL,' + #13#10 +
                  'DATAREQUERIMENTO, DATAINICIO,' + #13#10 +
                  '   DATAFINAL, FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE,' + #13#10 +
                  'VLRCALCINSS,' + #13#10 +
                  '   VLRINFINSS, DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND,' + #13#10 +
                  'VALORCOTAS,' + #13#10 +
                  '   DATACONCESSAO, FLGPROVISORIO, PERCPROVISORIO,' + #13#10 +
                  'PRAZOPROVISORIO, ULTMESREAJUSTE,' + #13#10 +
                  '   ULTVALORATUALREAJ, IDAGENCIARESGATE, DATAFINALPREVISTA,' + #13#10 +
                  'FLGDATAPREVISTA,' + #13#10 +
                  '   FLGTIPOINSS, DIBBENEFANT, VALORBENEFANT, VALORBINSSANT1,' + #13#10 +
                  'VALORBINSSANT2,' + #13#10 +
                  '   VALORBINSSANT3, VALORTOTAL, FLGPOSSUIACOMPINSS, FLGBENEFMIN,' + #13#10 +
                  'VALORSRB, FLGMOVEURESERVA, IDPLANPREVCONTAB, FONTEPAGADORA,' + #13#10 +
                  'PLACONTAD,PLACONTAC,' + #13#10 +
                  'VALORNADIB, FLGPAGAINSS, PERCRETENCAO,' + #13#10 +
                  'SALDOCONTADIB,RESERVADIB,INDICEDIB, RESGATEPARCELADO,' + #13#10 +
                  'QTDEPARCELAS' + #13#10 +
                  '' + #13#10 +
                  ',VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2,' + #13#10 +
                  'CAMPOTEXTO3,' + #13#10 +
                  'VLRBSTOTAL, VLRBSATUAL, VLRFABTOTAL, VLRFABATUAL, VLRBASEDEFICIT,' + #13#10 +
                  'BSDIB, FABDIB, BENEFLEI142' + #13#10 +
                  ',IDPERFILINVEST' + #13#10 +
                  ')' + #13#10 +
                  'values' + #13#10 +
                  '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDPLANOORIGEM,' + #13#10 +
                  ':IDTITULAR,' + #13#10 +
                  '   :IDPESSOA, :SEQPROPOSTA, :IDBENEFICIO, :IDBENEFREFEREN,' + #13#10 +
                  ':CODPORTFORMA,' + #13#10 +
                  '   :IDSITBENEFICIO, :IDDEPENDENCIA, :IDTPPAGTOBENEFIC, :VALORATUAL,' + #13#10 +
                  ':DATAREQUERIMENTO,' + #13#10 +
                  '   :DATAINICIO, :DATAFINAL, :FLGFORMAPAGTO, :VALORCALCULADO,' + #13#10 +
                  ':DATAULTREAJUSTE,' + #13#10 +
                  '   :VLRCALCINSS, :VLRINFINSS, :DATAINICIOINSS, :NUMPROCINSS,' + #13#10 +
                  ':DATAINICIOFUND,' + #13#10 +
                  '   :VALORCOTAS, :DATACONCESSAO, :FLGPROVISORIO, :PERCPROVISORIO,' + #13#10 +
                  ':PRAZOPROVISORIO,' + #13#10 +
                  '   :ULTMESREAJUSTE, :ULTVALORATUALREAJ, :IDAGENCIARESGATE,' + #13#10 +
                  ':DATAFINALPREVISTA,' + #13#10 +
                  '   :FLGDATAPREVISTA, :FLGTIPOINSS, :DIBBENEFANT, :VALORBENEFANT,' + #13#10 +
                  ':VALORBINSSANT1,' + #13#10 +
                  '   :VALORBINSSANT2, :VALORBINSSANT3, :VALORTOTAL,' + #13#10 +
                  ':FLGPOSSUIACOMPINSS,' + #13#10 +
                  '   :FLGBENEFMIN, :VALORSRB, :FLGMOVEURESERVA, :IDPLANPREVCONTAB,' + #13#10 +
                  ':FONTEPAGADORA   , :PLACONTAD, :PLACONTAC, :VALORNADIB,' + #13#10 +
                  ':FLGPAGAINSS, :PERCRETENCAO,' + #13#10 +
                  ':SALDOCONTADIB,:RESERVADIB,:INDICEDIB, :RESGATEPARCELADO,' + #13#10 +
                  ':QTDEPARCELAS' + #13#10 +
                  ', :VALORBASE1, :VALORBASE2, :VALORBASE3, :CAMPOTEXTO1,' + #13#10 +
                  ':CAMPOTEXTO2, :CAMPOTEXTO3,' + #13#10 +
                  ':VLRBSTOTAL, :VLRBSATUAL, :VLRFABTOTAL, :VLRFABATUAL,' + #13#10 +
                  ':VLRBASEDEFICIT, :BSDIB, :FABDIB, :BENEFLEI142' + #13#10 +
                  ',:IDPERFILINVEST' + #13#10 +
                  ')');

             end;
            // Andre Imakawa - SIG 61218 - Fim 
            updDet.ModifySQL.Clear;
            if (sTipoFormChamador = 'CO') and (bConcedeuBeneficio)
            then updDet.ModifySQL.Add( 'update BENEFBFCIARIO                    '+
                                       'set                                     '+
                                       '  IDBENEFREFEREN = :IDBENEFREFEREN,     '+
                                       '  CODPORTFORMA = :CODPORTFORMA,         '+
                                       '  IDSITBENEFICIO = :IDSITBENEFICIO,     '+
                                       '  IDDEPENDENCIA = :IDDEPENDENCIA,       '+
                                       '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC, '+
                                       '  VALORATUAL = :VALORATUAL,             '+
                                       '  DATAREQUERIMENTO = :DATAREQUERIMENTO, '+
                                       '  DATAINICIO = :DATAINICIO,             '+
                                       '  DATAFINAL = :DATAFINAL,               '+
                                       '  FLGFORMAPAGTO = :FLGFORMAPAGTO,       '+
                                       '  VALORCALCULADO = :VALORCALCULADO,     '+
                                       '  DATAULTREAJUSTE = :DATAULTREAJUSTE,   '+
                                       '  VLRCALCINSS = :VLRCALCINSS,           '+
                                       '  VLRINFINSS = :VLRINFINSS,             '+
                                       '  DATAINICIOINSS = :DATAINICIOINSS,     '+
                                       '  NUMPROCINSS = :NUMPROCINSS,           '+
                                       '  DATAINICIOFUND = :DATAINICIOFUND,     '+
                                       '  VALORCOTAS = :VALORCOTAS,             '+
                                       '  DATACONCESSAO = :DATACONCESSAO,       '+
                                       '  FLGPROVISORIO = :FLGPROVISORIO,       '+
                                       '  PERCPROVISORIO = :PERCPROVISORIO,     '+
                                       '  PRAZOPROVISORIO = :PRAZOPROVISORIO,   '+
                                       '  ULTMESREAJUSTE = :ULTMESREAJUSTE,     '+
                                       '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ, '+
                                       '  IDAGENCIARESGATE = :IDAGENCIARESGATE,   '+
                                       '  DATAFINALPREVISTA = :DATAFINALPREVISTA, '+
                                       '  FLGDATAPREVISTA = :FLGDATAPREVISTA,     '+
                                       '  FLGTIPOINSS = :FLGTIPOINSS,             '+
                                       '  DIBBENEFANT = :DIBBENEFANT,             '+
                                       '  VALORBENEFANT = :VALORBENEFANT,         '+
                                       '  VALORBINSSANT1 = :VALORBINSSANT1,       '+
                                       '  VALORBINSSANT2 = :VALORBINSSANT2,       '+
                                       '  VALORBINSSANT3 = :VALORBINSSANT3,       '+
                                       '  VALORTOTAL = :VALORTOTAL,                 '+
                                       '  FLGPOSSUIACOMPINSS = :FLGPOSSUIACOMPINSS, '+
                                       '  FLGBENEFMIN = :FLGBENEFMIN,               '+
                                       '  VALORSRB = :VALORSRB,                     '+
                                       '  FLGMOVEURESERVA = :FLGMOVEURESERVA,       '+
                                       '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,     '+
                                       '  FONTEPAGADORA = :FONTEPAGADORA,           '+
                                       '  PLACONTAD = :PLACONTAD,        '+
                                       '  PLACONTAC = :PLACONTAC,        '+
                                       '  VALORNADIB = :VALORNADIB,      '+
                                       '  FLGPAGAINSS = :FLGPAGAINSS,    '+
                                       '  PERCRETENCAO = :PERCRETENCAO,  '+
                                       '  SALDOCONTADIB =:SALDOCONTADIB, '+
                                       '  RESERVADIB=:RESERVADIB,        '+
                                       '  INDICEDIB=:INDICEDIB,          '+
                                       '  IDBENEFICIO = :IDBENEFICIO,    '+
                                       '  RESGATEPARCELADO = :RESGATEPARCELADO, '+
                                       '  QTDEPARCELAS    = :QTDEPARCELAS,      '+
                                       '  VALORBASE1 = :VALORBASE1,   '+
                                       '  VALORBASE2 = :VALORBASE2,   '+
                                       '  VALORBASE3 = :VALORBASE3,   '+
                                       '  CAMPOTEXTO1 = :CAMPOTEXTO1, '+
                                       '  CAMPOTEXTO2 = :CAMPOTEXTO2, '+
                                       '  CAMPOTEXTO3 = :CAMPOTEXTO3, '+
                                       '  BSDIB = :BSDIB,  '+
                                       '  FABDIB = :FABDIB '+
                                       '  ,BENEFLEI142  =  :BENEFLEI142 ' + //Darivaldo Alencar SIG 23985
                                       'where '+
                                       '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and '+
                                       '  IDPESSJUR = :OLD_IDPESSJUR and           '+
                                       '  IDPLANOPREV = :OLD_IDPLANOPREV and       '+
                                       '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and   '+
                                       '  IDTITULAR = :OLD_IDTITULAR and           '+
                                       '  IDPESSOA = :OLD_IDPESSOA and             '+
                                       '  SEQPROPOSTA = :OLD_SEQPROPOSTA and       '+
                                       '  IDBENEFICIO = :OLD_IDBENEFICIO ')

            else updDet.ModifySQL.Add( 'update BENEFBFCIARIO                    '+
                                       'set                                     '+
                                       '  IDBENEFREFEREN = :IDBENEFREFEREN,     '+
                                       '  CODPORTFORMA = :CODPORTFORMA,         '+
                                       '  IDSITBENEFICIO = :IDSITBENEFICIO,     '+
                                       '  IDDEPENDENCIA = :IDDEPENDENCIA,       '+
                                       '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC, '+
                                       '  VALORATUAL = :VALORATUAL,             '+
                                       '  DATAREQUERIMENTO = :DATAREQUERIMENTO, '+
                                       '  DATAINICIO = :DATAINICIO,             '+
                                       '  DATAFINAL = :DATAFINAL,               '+
                                       '  FLGFORMAPAGTO = :FLGFORMAPAGTO,       '+
                                       '  VALORCALCULADO = :VALORCALCULADO,     '+
                                       '  DATAULTREAJUSTE = :DATAULTREAJUSTE,   '+
                                       '  VLRCALCINSS = :VLRCALCINSS,           '+
                                       '  VLRINFINSS = :VLRINFINSS,             '+
                                       '  DATAINICIOINSS = :DATAINICIOINSS,     '+
                                       '  NUMPROCINSS = :NUMPROCINSS,           '+
                                       '  DATAINICIOFUND = :DATAINICIOFUND,     '+
                                       '  VALORCOTAS = :VALORCOTAS,             '+
                                       '  DATACONCESSAO = :DATACONCESSAO,       '+
                                       '  FLGPROVISORIO = :FLGPROVISORIO,       '+
                                       '  PERCPROVISORIO = :PERCPROVISORIO,     '+
                                       '  PRAZOPROVISORIO = :PRAZOPROVISORIO,   '+
                                       '  ULTMESREAJUSTE = :ULTMESREAJUSTE,     '+
                                       '  ULTVALORATUALREAJ = :ULTVALORATUALREAJ, '+
                                       '  IDAGENCIARESGATE = :IDAGENCIARESGATE,   '+
                                       '  DATAFINALPREVISTA = :DATAFINALPREVISTA, '+
                                       '  FLGDATAPREVISTA = :FLGDATAPREVISTA,     '+
                                       '  FLGTIPOINSS = :FLGTIPOINSS,             '+
                                       '  DIBBENEFANT = :DIBBENEFANT,             '+
                                       '  VALORBENEFANT = :VALORBENEFANT,         '+
                                       '  VALORBINSSANT1 = :VALORBINSSANT1,       '+
                                       '  VALORBINSSANT2 = :VALORBINSSANT2,       '+
                                       '  VALORBINSSANT3 = :VALORBINSSANT3,       '+
                                       '  VALORTOTAL = :VALORTOTAL,                 '+
                                       '  FLGPOSSUIACOMPINSS = :FLGPOSSUIACOMPINSS, '+
                                       '  FLGBENEFMIN = :FLGBENEFMIN,               '+
                                       '  VALORSRB = :VALORSRB,                     '+
                                       '  FLGMOVEURESERVA = :FLGMOVEURESERVA,       '+
                                       '  IDPLANPREVCONTAB = :IDPLANPREVCONTAB,     '+
                                       '  FONTEPAGADORA = :FONTEPAGADORA,           '+
                                       '  PLACONTAD = :PLACONTAD,        '+
                                       '  PLACONTAC = :PLACONTAC,        '+
                                       '  VALORNADIB = :VALORNADIB,      '+
                                       '  FLGPAGAINSS = :FLGPAGAINSS,    '+
                                       '  PERCRETENCAO = :PERCRETENCAO,  '+
                                       '  SALDOCONTADIB =:SALDOCONTADIB, '+
                                       '  RESERVADIB=:RESERVADIB,        '+
                                       '  INDICEDIB=:INDICEDIB,          '+
                                       '  IDBENEFICIO = :IDBENEFICIO,    '+
                                       '  RESGATEPARCELADO = :RESGATEPARCELADO, '+
                                       '  QTDEPARCELAS    = :QTDEPARCELAS,      '+
                                       '  VALORBASE1 = :VALORBASE1,   '+
                                       '  VALORBASE2 = :VALORBASE2,   '+
                                       '  VALORBASE3 = :VALORBASE3,   '+
                                       '  CAMPOTEXTO1 = :CAMPOTEXTO1, '+
                                       '  CAMPOTEXTO2 = :CAMPOTEXTO2, '+
                                       '  CAMPOTEXTO3 = :CAMPOTEXTO3, '+
                                       '  VLRBSTOTAL = :VLRBSTOTAL,   '+
                                       '  VLRFABTOTAL = :VLRFABTOTAL, '+
                                       '  VLRBSATUAL = :VLRBSATUAL,   '+
                                       '  VLRFABATUAL = :VLRFABATUAL, '+
                                       '  VLRBASEDEFICIT = :VLRBASEDEFICIT, '+
                                       '  BSDIB = :BSDIB,  '+
                                       '  FABDIB = :FABDIB '+
                                       '  ,BENEFLEI142  =  :BENEFLEI142 ' + //Darivaldo Alencar SIG 23985
                                       IFF(Sistema.IdModulo <> 454, '''','  ,IDPERFILINVEST = :IDPERFILINVEST ')+  //edilaine - SIG55933 // Andre Imakawa - SIG 61218
                                       'where '+
                                       '  NUMEROPROCESSO = :OLD_NUMEROPROCESSO and '+
                                       '  IDPESSJUR = :OLD_IDPESSJUR and           '+
                                       '  IDPLANOPREV = :OLD_IDPLANOPREV and       '+
                                       '  IDPLANOORIGEM = :OLD_IDPLANOORIGEM and   '+
                                       '  IDTITULAR = :OLD_IDTITULAR and           '+
                                       '  IDPESSOA = :OLD_IDPESSOA and             '+
                                       '  SEQPROPOSTA = :OLD_SEQPROPOSTA and       '+
                                       '  IDBENEFICIO = :OLD_IDBENEFICIO ');
            ApplyUpdates;
         end;
         // edilaine - SOL 271517 / PPM 1367209 - fim

      with qryBenefReferencia do
         if Active and UpdatesPending then ApplyUpdates;

      if sTipoFormChamador <> 'SI'
      then begin
         with qryReservaPart do
            if Active and UpdatesPending then ApplyUpdates;

         with qryMovReservaTemp do
            if Active and UpdatesPending then ApplyUpdates;
      end;

      with qryRelBenefPart do
         if Active and UpdatesPending then ApplyUpdates;

      with qryRelBenefPart do
         if Active and UpdatesPending and bGravaBenefReferencia then ApplyUpdates;

      
      with qryResMatematica do
         if Active and UpdatesPending then ApplyUpdates;

      SelecionaProcesso(qry.FieldByName('NumeroProcesso').AsInteger);


   except
      raise;
   end;
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRequerBenefParticip.CmeCadastroDelete(Sender: TObject);
begin
  qryRelBenefPart.First;
  while not qryRelBenefPart.Eof do
  begin
     qryRelBenefPart.Delete;
  end;

  qryMovReservaTemp.First;
  while not qryMovReservaTemp.Eof do
  begin
     qryMovReservaTemp.Delete;
  end;

  qryDet.First;
  while not qryDet.Eof do
  Begin
     qryDet.Delete;
  end;

  qry.Delete;

  dtmBaseDados.dbBaseDados.ApplyUpdates([qryRelBenefPart,qryMovReservaTemp,qryDet,qry]);
  SelecionaProcesso(-1);
end; // CmeCadastro.Delete(Self)

procedure TfrmCadRequerBenefParticip.CmeCadastroInsert(Sender: TObject);
begin
   if (qryDet.recordcount <= 0) then   // SOL 256744 PPM 999526
   begin
     iNumeroProcesso := LeUltRegistro(qryAux,'PROCESSOBENEF');
     SelecionaProcesso(iNumeroProcesso);
     inherited;
     pnlMestre.Enabled    := True;
   
     if sTipoFormChamador = '' then     // edilaine - SOL 253577-17374 / PPM 848182
        bbtnProcurar.Visible := True;


     if Trim(sDataEvento) <> ''
     then begin
        dtDataEvento.Date                       := StrToDate(sDataEvento);  
        qry.FieldByName('DtEvento').AsDateTime  := StrToDate(sDataEvento);
        qry.FieldByName('DtDireito').AsDateTime := StrToDate(sDataEvento);
     end
     else begin
        dtDataEvento.Date                       := date;  
        qry.FieldByName('DtEvento').AsDateTime  := date;
        qry.FieldByName('DtDireito').AsDateTime := date;
     end;

     lblPercConc.Visible             := False;
     dbedPercConc.Visible            := False;
     lblPercent.Visible              := False;
     lblPrazoProv.Visible            := False;
     dbedPrazoProv.Visible           := False;
     lblMesProv.Visible              := False;

     lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
     lblSitProcesso.Caption := 'Situação : Pendente de Concessão ';

     bGravaBenefReferencia := False;
     bExecutouRegraConcessao := False;

     lblNomeBenef.Caption := '';
   end;
end; // CmeCadastro.Insert(Self)

procedure TfrmCadRequerBenefParticip.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled       := True;

   bbtnProcurar.Visible    := False;
   bGravaBenefReferencia   := False;
   bExecutouRegraConcessao := False;
   bConcedeuBeneficio      := False;
   bNAOConcedeuBeneficio   := False;

   // Desabilitar itens que nao possam ser alterados nem na MANUTENCAO DE PROCESSO
   if ((sTipoFormChamador = 'MA') and (qry.FieldbyName('IDSITPROCESSO').AsInteger <> 4)) 
   then begin
      dtInicioFund.Enabled       := True;
      dtInicioINSS.Enabled       := True;
      reValorCalcInss.Enabled    := False;
      reValorInfINSS.Enabled     := False;
      reValorBeneficio.Enabled   := False;
      reValorSRB.Enabled         := False;
      dtDataRequerimento.Enabled := True;
      dtDataInicio.Enabled       := True;
      dtDataFinal.Enabled        := True;
      dbrgrpDataPrevista.Enabled := True;
      pnlBenefProv.Enabled       := False;
      dblkcmbTpPgtoBenef.Enabled := False;
   end
   else begin
      dtInicioFund.Enabled       := True;
      dtInicioINSS.Enabled       := True;
      reValorCalcInss.Enabled    := True;
      reValorInfINSS.Enabled     := True;
      reValorBeneficio.Enabled   := True;
      reValorSRB.Enabled         := True;
      dtDataRequerimento.Enabled := True;
      dtDataInicio.Enabled       := True;
      dtDataFinal.Enabled        := True;
      dbrgrpDataPrevista.Enabled := True;
      pnlBenefProv.Enabled       := True;
      dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499
   end;

end; // CmeCadastro.Edit(Self)

procedure TfrmCadRequerBenefParticip.CmeDetalheConfirma(Sender: TObject);
begin
  //
  inherited;
end; // CmeDetalhe.Confirma(Self)

procedure TfrmCadRequerBenefParticip.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     // SOL 63067 - KTN 524520
     dbrgrpResgateParcelado.visible :=  false; // SOL 63067 - KTN 524520
     dbedQtdeParcelas.visible       :=  false; // SOL 63067 - KTN 524520
     lblQdeParcelas.visible         :=  false; // SOL 63067 - KTN 524520

     // SOL 63067 - KTN 524520
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     iIdTitular      := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;
     if sTipoFormChamador <> 'SI' then sbtnCadContaCorrente.Enabled := True;
     //if sTipoFormChamador <> 'SI' then sbtnDemonsSRB.Enabled        := True;     // edilaine - SOL 253577-18129 / PPM 1303078

     SelecionaProcesso(iNumeroProcesso);
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);

     BeneficioRiscoInss; //Darivaldo Alencar SIG 23985
  end;

end; // CmeCadastro.Find(Self)

procedure TfrmCadRequerBenefParticip.CmeDetalheInsert(Sender: TObject);
var sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sFlgBenefMinAnt,
    sUltMesReajAnt,
    sDataEventoAnt,
    sNumProcINSS, 
    sCodBeneficioAnt     : string;
    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant : string;
begin
  if Trim(dblkpcmbEvento.Text) = ''
  then begin
    MsgDlg('Preencha o Evento Gerador.','Erro',mtError,[mbOk],0);
    dblkpcmbEvento.Enabled := True;
    dblkpcmbEvento.SetFocus;
    bbtnCancelarDetClick(frmCadRequerBenefParticip);
    Exit;
  end;

  if (iIdTitular <= 0) or (iIdPessJur <= 0) or (iIdPlanoPrev <= 0) or (iSeqProposta <= 0 )
  then begin
    MsgDlg('Escolha o Participante Titular.','Erro',mtError,[mbOk],0);
    bbtnProcurar.SetFocus;
    bbtnCancelarDetClick(frmCadRequerBenefParticip);
    sbtnInsDet.Enabled := True;
    Exit;
  end;
  lblNomeBenef.Caption := '';

  sNumProcINSS    := '';
  sValorCalcINSS  := '0';
  sValorInfINSS   := '0';
  sDataInicioINSS := '';
  sValorBase1INSS := '0';
  sValorBase2INSS := '0';
  sValorBase3INSS := '0';

  AbreQryBeneficio(True,qryEvento.FieldByName('IdEventoGerador').AsInteger, iIdPlanoPrev);

  inherited;

  rValorReal              := 0;
  rValorCotas             := 0;
  rValorDaCotaBenef       := 0;
  sDataDaCotaBenef        := '';

  reValorBeneficio.Text   := '';     // edilaine - SOL 253577-17374 / PPM 848182 - alterado pra vazio
  reValorCalcINSS.Text    := '0';
  reValorINfINSS.Text     := '0';

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  bFlgApresentaDeficit := false;
  bFlgApresentaBSFAB   := false;

  AjustaTela();
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
     (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
  begin
    reValorFAB.text     := '';
    reValorBS.text      := '';
    reValorDeficit.text := '';
  end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  dbrgFlgFormaPagto.ItemIndex := 0;

  qryDet.FieldByName('ValorAtual').AsFloat     := 0;
  qryDet.FieldByName('ValorCalculado').AsFloat := 0;

  qryDet.FieldByName('FLGPAGAINSS').AsFloat := 0;    //edilaine - SIG47962

  If Trim(sDataRequerimento) = '' Then Begin
    qryDet.FieldByName('DATAREQUERIMENTO').AsDateTime  := Date;
  End Else Begin
    qryDet.FieldByName('DATAREQUERIMENTO').AsString := sDataRequerimento;
  End;
  DtDataRequerimento.Date := qryDet.FieldByName('DATAREQUERIMENTO').AsDateTime;

  

  qryDet.FieldByName('FlgFormaPagto').AsString       := 'F';
  qryDet.FieldByName('FlgProvisorio').AsInteger      := 0;

  dbrgrpBenefProvisorio.ItemIndex                    := 0;

  qryDet.FieldByName('FLGDATAPREVISTA').AsInteger    := 0;
  dbrgrpDataPrevista.ItemIndex                       := 1;

  if (Trim(sDataFinalEvento) <> '') and(Trim(dtDataFinal.Text) = '')
  then begin
     qryDet.FieldByName('DataFinal').AsString  := sDataFinalEvento;
     dtDataFinal.Date                          := StrToDate(sDataFinalEvento);
  end;

  if (Trim(dtInicioFund.Text) = '') and (Trim(dtDataEvento.Text) <> '')
  then begin
     qryDet.FieldByName('DataInicioFund').AsDateTime  := dtDataEvento.Date; 
     dtInicioFund.Date                                := dtDataEvento.Date; 
     dtInicioINSS.Date                                := dtDataEvento.Date; 
  end;

  if (Trim(dtDataInicio.Text) = '') and (Trim(dtDataEvento.Text) <> '')
  then begin
     qryDet.FieldByName('DataInicio').AsDateTime      := dtDataEvento.Date; 
     dtDataInicio.Date                                := dtDataEvento.Date; 
  end;

  // Se já tiver algum benefício, preencher a data de inicio do inns
  //  INICIO - Marcelo Cardoso
  if (sIdEventoGerador = '334') or (sIdEventoGerador = '369') or (sIdEventoGerador = '373') or (sIdEventoGerador = '368') or
          (sIdEventoGerador = '337') or (sIdEventoGerador = '15') or (sIdEventoGerador = '336') or (sIdEventoGerador = '345') THEN
  begin
     if sTipoFormChamador = 'EV'  then
     begin
        qryDet.FieldByName('DataInicioINSS').AsString := '';
     end
     else
     begin
        if (not qryDet.IsEmpty) and (not qryBenefAux.IsEmpty) then
        begin
           qryBenefAux.First;
           qryDet.FieldByName('DataInicioINSS').AsString := qryBenefAux.FieldByName('DataInicioINSS').AsString;
           dtInicioINSS.Date := qryBenefAux.FieldByName('DataInicioINSS').AsDateTime;
        end
        else
        begin
           qryDet.FieldByName('DataInicioINSS').AsDateTime  := dtDataEvento.Date;
           dtInicioINSS.Date                                := dtDataEvento.Date;
        end;

     end;
  end

  else
  begin
     if (not qryDet.IsEmpty) and (not qryBenefAux.IsEmpty) then
     begin
        qryBenefAux.First;
        qryDet.FieldByName('DataInicioINSS').AsString := qryBenefAux.FieldByName('DataInicioINSS').AsString;
        dtInicioINSS.Date := qryBenefAux.FieldByName('DataInicioINSS').AsDateTime;
     end
     else
     begin
        qryDet.FieldByName('DataInicioINSS').AsDateTime  := dtDataEvento.Date;
        dtInicioINSS.Date                                := dtDataEvento.Date;
     end;
  end;
  // Fim - Marcelo Cardoso - SOL262811 PPM1125645
  lblPercConc.Visible     := False;
  dbedPercConc.Visible    := False;
  lblPercent.Visible      := False;
  lblPrazoProv.Visible    := False;
  dbedPrazoProv.Visible   := False;
  lblMesProv.Visible      := False;

  bbtnOpcoes.Visible      := False;
  lblAgencia.Visible      := False;
  dblkpcmbAgencia.Visible := False;

  reValorInfINSS.Color    := clWindow;
  dblkpcmbBeneficio.SetFocus;
  iIdBenefReferencia      := -1;
  bReajustouInss          := False;
  bRecalculouProvisorio   := False;
  iProvisorioAntes        := dbrgrpBenefProvisorio.ItemIndex; 


  // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
  BuscaDadosBeneficioAnterior(qryAux,
                              iIdPessJur,
                              iIdPlanoPrev,
                              iIdTitular,
                              qryDet.FieldByName('IdBeneficio').AsInteger,
                              qryBeneficio.FieldByName('FlgReferencia').AsInteger,
                              FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  
                              sDataInicioAnt,
                              sValorAnt,
                              sNomeBenefAnt,
                              sIdTpPagtoAnt,
                              sUltMesReajAnt,
                              sFlgBenefMinAnt,
                              sDataEventoAnt,
                              sCodBeneficioAnt,
                              sValorBase1Ant,
                              sValorBase2Ant,
                              sValorBase3Ant,
                              sNumProcINSS, 
                              True
                             );

  if Trim(sDataInicioAnt) <> ''
  then begin
    qryDet.FieldByName('DibBenefAnt').AsString   := sDataInicioAnt;
    qryDet.FieldByName('ValorBenefAnt').AsString := ClienteNumero(sValorAnt);
    qryDet.FieldByName('NumProcINSS').AsString   := sNumProcINSS;
  end;

  bbtnConfirmar.enabled := false;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := false;    // edilaine - SOL 253577-18129 / PPM 1303078

end; // CmeDetalhe.Insert(Self)

procedure TfrmCadRequerBenefParticip.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  sNumProcINSS    := '';
  sValorCalcINSS  := '0';
  sValorInfINSS   := '0';
  sDataInicioINSS := '';
  sValorBase1INSS := '0';
  sValorBase2INSS := '0';
  sValorBase3INSS := '0';

  AbreQryBeneficio(False,qryEvento.FieldByName('IdEventoGerador').AsInteger, iIdPlanoPrev);

  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
  then begin
     reValorBeneficio.Text := FormatFloat('#0.00',qryDet.FieldByName('ValorCotas').AsFloat);
     rValorCotas           := StrToFloat(FormatFloat('#0.00',qryDet.FieldByName('ValorCotas').AsFloat));
     rValorReal            := StrToFloat(FormatFloat('#0.00',ConverteBeneficioParaReal(rValorCotas)));
  end
  else begin
     reValorBeneficio.Text := FormatFloat('#0.00',qryDet.FieldByName('ValorAtual').AsFloat);
     rValorReal            := StrToFloat(FormatFloat('#0.00',qryDet.FieldByName('ValorAtual').AsFloat));
     rValorCotas           := 0;
  end;

  reValorCalcInss.Text  := FormatFloat('#0.00',qryDet.FieldByName('VlrCalcINSS').AsFloat);
  reValorInfInss.Text   := FormatFloat('#0.00',qryDet.FieldByName('VlrINFINSS').AsFloat);

  if qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
  end;

  if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
  then begin
     lblDataFinal.Caption         := 'Data Final(Prev.)';
     dtDataFinal.DataField        := 'DataFinalPrevista';
     dtDataFinal.Text             := qryDet.FieldbyName('DATAFINALPREVISTA').AsString;
     dbrgrpDataPrevista.ItemIndex := 0;
  end
  else begin
     lblDataFinal.Caption         := 'Data Final';
     dtDataFinal.DataField        := 'DataFinal';
     dtDataFinal.Text             := qryDet.FieldbyName('DATAFINAL').AsString;
     dbrgrpDataPrevista.ItemIndex := 1;
  end;


  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  bFlgApresentaDeficit := (qryBeneficio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
  bFlgApresentaBSFAB   := (qryBeneficio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);

  AjustaTela();
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
     (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
  begin
    reValorFAB.Text     := qryDet.FieldByName('VLRFABTOTAL').AsString;
    reValorBS.Text      := qryDet.FieldByName('VLRBSTOTAL').AsString;
    reValorDeficit.Text := qryDet.FieldByName('VLRBASEDEFICIT').AsString;
  end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  bbtnConfirmar.enabled := false;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := false;    // edilaine - SOL 253577-18129 / PPM 1303078

  bRecalculouProvisorio := True;
end;
// ********************************** ********************** *************************
// ********************************** MÉTODOS DO FORM  ***** *************************
// ********************************** ********************** *************************

procedure TfrmCadRequerBenefParticip.FormCreate(Sender: TObject);
begin
  sTipoFormChamador := '';
  inherited;
  qryTpPgtoBenef.Close; qryTpPgtoBenef.Open;

  qryFolha.Close;
  qryFolha.ParamByName('idfundacao').asinteger := iIdFundacao;
  qryFolha.Open;

  qrySelecionaBenefRef.Close;
  qrySelecionaBenefRef.ParamByName('IDPLANOPREV').AsInteger := -1;
  qrySelecionaBenefRef.Open;
//      //Marcos Merola SOL161215  07/11/2011 Inicio
//  qryUser.Close;
//  qryUser.Open;         Retirado pelo SOL 206918
//  //Marcos Merola SOL161215  07/11/2011 Fim
  qryPortForma.Close;
  qryPortForma.Open;
  qryAgenciaResgate.Close;
  qryAgenciaResgate.Open;
  SelecionaProcesso(-1);
  bQueryTitular := False;
  bQuerySalarios := False;
  bQueryContribuicoes := False;
  bAbriuOutroForm     := False;
  qryEPP.Open; 
  qryIncluiAlterador.Open; // SOL 132938
  DblAlterador.Text := 'Não'; // SOL 132938

  //lstDadosCorrecao := TStringList.create;     // edilaine - SOL 253577-17464 / PPM 955703   // edilaine - SOL 262968 / PPM 1102753 - comentado

end;

procedure TfrmCadRequerBenefParticip.bbtnProcurarClick(Sender: TObject);
var sTempoServAnoDigitado,
    sTempoServMesDigitado,
    sTempoServDiaDigitado : string;
    iTempoSimples         : Integer; 
    sTempoResumido,
    sAnos,
    sMeses,
    sDias,
    sDataAdmissao         : String;  
begin

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     iIdTitular                := StrToInt(MontaSelectPart.ValoresChave[0]);
     iIdPessJur                := StrToInt(MontaSelectPart.ValoresChave[1]);
     iIdPlanoPrev              := StrToInt(MontaSelectPart.ValoresChave[2]);
     iSeqProposta              := StrToInt(MontaSelectPart.ValoresChave[7]);
     sDataAdmissao             := MontaSelectPart.ValoresChave[8];
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;

     iIdLoteConcessao          := -1;  // edilaine - SOL 253577-17464 / PPM 955703

     if sTipoFormChamador = 'SI'
     then begin
        Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);

        If FazQuery( QryAux, 'SELECT MIN( HFP.DATAINICIO ) AS DATAINICIO ' +
                             'FROM HISTFUNCPREV HFP ' +
                             'WHERE HFP.IDPESSOA = ' + IntToStr( iIdTitular ) +
                             '  AND NVL(HFP.FLGTEMPOMANUT, 0) = 0 ' ) Then
        Begin

          sDataAdmissao := QryAux.FieldByName('DATAINICIO').AsString;

        End;


        // Aguardando a liberação da função TransformaDiasTempo como publica
        // para trocar as linhas de comando abaixo comentadas
        iTempoSimples := CalcTempoContrib(qryAux,
                                          iIdTitular,
                                          0,
                                          1,
                                          1,
                                          sDataAdmissao,
                                          FormatDateTime('dd/mm/yyyy', Date),
                                          FormatDateTime('dd/mm/yyyy', Date)
                                         );


        sTempoResumido := TransformaDiasTempo(iTempoSimples);

        // Anos
        sAnos := copy(sTempoResumido, 1, 2);
        If Trim(sAnos) = ''
         Then sAnos := '0';


        // Meses
        sMeses := copy(sTempoResumido, 3, 2);
        If Trim(sMeses) = ''
         Then sMeses := '0';


        // Dias
        sDias := copy(sTempoResumido, 5, 2);
        If Trim(sDias) = ''
         Then sDias := '0';

        frmLerTempoServico.edTempoServTotal.Text := sAnos;
        frmLerTempoServico.edTempoServMes.Text   := sMeses;
        frmLerTempoServico.edTempoServDia.Text   := sDias;


        frmLerTempoServico.ShowModal;
        if frmLerTempoServico.ModalResult <> mrOk
        then Exit;
        sTempoServAnoDigitado := OraNumero(frmLerTempoServico.edTempoServTotal.Text);
        sTempoServMesDigitado := OraNumero(frmLerTempoServico.edTempoServMes.Text);
        sTempoServDiaDigitado := OraNumero(frmLerTempoServico.edTempoServDia.Text);
        frmLerTempoServico.Free;

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' SELECT TEMPOSERVTOTAL, TEMPOSERVTOTMES, TEMPOSERVTOTDIA  '+
                             ' FROM   ELEGPATRO '+
                             ' WHERE  IDPESSJUR = ' +IntToStr(iIdPessJur) + ' AND ' +
                             '        IDPESSOA  = ' +IntToStr(iIdTitular));
        dtmAPrev.qry.Open;

        sTempoServAnoAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTAL').AsString);
        sTempoServMesAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTMES').AsString);
        sTempoServDiaAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTDIA').AsString);

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ sTempoServAnoDigitado +', '+
                             '                      TEMPOSERVTOTMES  = '+ sTempoServMesDigitado +', '+
                             '                      TEMPOSERVTOTDIA  = '+ sTempoServDiaDigitado +
                             ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                             ' AND   IDPESSOA  = ' + IntToStr(iIdTitular) );
        try
           dtmAPrev.qry.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

     end;

     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end; // if montasel.valoreschave.count > 0
end;

procedure TfrmCadRequerBenefParticip.qryBeforePost(DataSet: TDataSet);
begin

  if Trim(dblkpcmbEvento.Text) = ''
  then begin
     MsgDlg('O Evento Gerador deve ser informado.','Erro',mtError,[mbOk],0);
     dblkpcmbEvento.Enabled := True;
     dblkpcmbEvento.SetFocus;
     Abort;
  end;

  if Trim(dtDataEvento.Text) = ''
  then begin
     MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk],0);
     dtDataEvento.SetFocus;
     Abort;
  end;

  inherited;

  if qry.State = dsInsert
  then begin
     qry.FieldByName('NumeroProcesso').AsInteger  := iNumeroProcesso;
     qry.FieldByName('IdEventoGerador').AsInteger := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qry.FieldByName('DtRegistro').AsDateTime     := date;
     if sTipoFormChamador <> 'SI'
     then qry.FieldbyName('IdSitProcesso').AsInteger   := 4 // Pendente de Concessao
     else qry.FieldbyName('IdSitProcesso').AsInteger   := 8; // Simulacao
     sNumerosProcessos                            := sNumerosProcessos + ','+IntToStr(iNumeroProcesso);
  end;

end;

procedure TfrmCadRequerBenefParticip.qryDetBeforePost(DataSet: TDataSet);
var bBeneficioMinimo, bErro : boolean;
    iFlgPossuiAcomp         : integer;
begin

  if bInserindoGrupo then Exit;

  if qryDet.State = dsInsert then
  begin
     qryDet.FieldByName('NumeroProcesso').AsInteger := iNumeroProcesso;
     qryDet.FieldByName('IdTitular').AsInteger      := iIdTitular;
     qryDet.FieldByName('IdPessJur').AsInteger      := iIdPessJur;

     qryDet.FieldByName('IdPlanoORIGEM').AsInteger  := iIdPlanoPrev;
     qryDet.FieldByName('IdPlanoPrev').AsInteger    := iIdPlanoPrev;
     qryDet.FieldByName('SeqProposta').AsInteger    := iSeqProposta;
     qryDet.FieldByName('IdPessoa').AsInteger       := iIdTitular;

     if sTipoFormChamador <> 'SI'
     then qryDet.FieldByName('IdSitBeneficio').AsInteger := 4
     else qryDet.FieldByName('IdSitBeneficio').AsInteger := 8;

     qryDet.FieldByName('IdDependencia').AsString   := 'PRP';
     qryDet.FieldByName('Nome').AsString            := qryBeneficio.FieldByName('NomeBeneficio').AsString;
     qryDet.FieldByName('Descricao').AsString       := 'Pendente de Concessão';
  end;

  //edilaine - SIG55933 - inicio
  if sTipoFormChamador <> 'CO' then
     qryDet.FieldByName('IDPERFILINVEST').AsInteger := PerfilAtual.iIdPerfilInvest
  else
  begin
    //PerfilAtual.iIdPerfilInvest := qryDet.FieldByName('IDPERFILINVEST').AsInteger;            //edilaine SIG100325
    PerfilAtual := BuscaPerfilInvestimento( qryDet.FieldByName('IDPERFILINVEST').AsInteger );   //edilaine SIG100325
  end;
  //edilaine - SIG55933 - fim

  // Thiago Melo SOL 220983 2053498 Kintana
  if qryDet.State in [DsInsert, DsEdit] then begin
    qryDet.FieldByName('VALORBASE1').AsFloat := rOpcao1;
    qryDet.FieldByName('VALORBASE2').AsFloat := rOpcao2;
    qryDet.FieldByName('VALORBASE3').AsFloat := rOpcao3;
    qryDet.FieldByName('CAMPOTEXTO1').AsString := rCampoTexto1;
    qryDet.FieldByName('CAMPOTEXTO2').AsString := rCampoTexto2;
    qryDet.FieldByName('CAMPOTEXTO3').AsString := rCampoTexto3;
  end;
  // Thiago Melo SOL 220983 2053498 Kintana


  if Trim(reValorBeneficio.Text) = '' then reValorBeneficio.Text := '0';
  if Trim(reValorCalcInss.Text)  = '' then reValorCalcInss.Text  := '0';
  if Trim(reValorInfINSS.Text)   = '' then reValorInfINSS.Text   := '0';
  if Trim(reValorSRB.Text)   = ''     then reValorSRB.Text   := '0';

  qryDet.FieldByName('PERCRETENCAO').AsFloat        := dbedPercContrib.Value;  // Renato Visoni SOL 153767 Kintana 1162587

  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
  then begin // beneficio em cotas

     
     // O SISTEMA NÃO APLICARÁ MAIS O PERCENTUAL DE CONCESSAO AO BENEFICIO
     // AS REGRAS DE CALCULO DEVERÃO FAZER ISSO
     
     
     
     qryDet.FieldByName('ValorTotal').AsFloat     :=  StrToFloat(FormatFloat('#0.00',rValorReal));

     
     qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.00',ConverteBeneficioParaReal(rValorCotas))); 
     qryDet.FieldByName('ValorCalculado').AsFloat := rValorCotas;
     qryDet.FieldByName('ValorCotas').AsFloat     := rValorCotas;
  end
  else begin // beneficio em real
     
     // O SISTEMA NÃO APLICARÁ MAIS O PERCENTUAL DE CONCESSAO AO BENEFICIO
     // AS REGRAS DE CALCULO DEVERÃO FAZER ISSO
     
     
     
     qryDet.FieldByName('ValorTotal').AsFloat     := StrToFloat(FormatFloat('#0.00',rValorReal));

     qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryDet.FieldByName('ValorCalculado').AsFloat := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryDet.FieldByName('ValorCotas').AsFloat     := rValorCotas;
  end;


  if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0)
  then qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 1
  else qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 2;
  
  if Trim(dblkpcmbBenefReferencia.Text) <> ''
  then qryDet.FieldByName('IDBENEFREFEREN').AsInteger := qrySelecionaBenefRef.FieldByName('IDBENEFICIO').AsInteger;

  { Somente se não for concessão }
  If sTipoFormChamador <> 'CO' Then

    qryDet.FieldByName('VALORNADIB').AsFloat       := qryDet.FieldByName('VALORATUAL').AsFloat ;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 Then
    qryDet.FieldByName('DATAINICIOFUND').AsString  := qryDet.FieldByName('DATAINICIOINSS').AsString;

  qryDet.FieldByName('VLRCALCINSS').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
  qryDet.FieldByName('VLRINFINSS').AsFloat         := StrToFloat(ClienteNumero(reValorInfINSS.Text));
  if not bConcedeuBeneficio
  then qryDet.FieldByName('VALORSRB').AsFloat      := StrToFloat(ClienteNumero(reValorSRB.Text))
  else qryDet.FieldByName('VALORSRB').AsFloat      := dValorSRB;

  
  if trim(dblkpcmbPortForma.text) = '' then
    qryDet.fieldbyname('CODPORTFORMA').AsString := '';

  
  // Chamar a regra de verificação de benefício mínimo
  if qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger > 0
  then begin

     
     if dbrgrpPossuiAcompINSS.ItemIndex = 0
     then iFlgPossuiAcomp := 0
     else iFlgPossuiAcomp := 1;

     If (Not DbChbPossuiAcomp.Checked)
     Then iFlgPossuiAcomp := 0
     Else iFlgPossuiAcomp := 1;
     

     bBeneficioMinimo := ExecutaRegraBeneficioMinimo(qryAux,
                                                     qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger,
                                                     iIdPessJur,
                                                     iIdPlanoPrev,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     iIdTitular,
                                                     iIdSitFunc,
                                                     iIdSitPart,
                                                     iIdSitPlanoPrev,
                                                     rOpcao1,
                                                     rOpcao2,
                                                     rOpcao3,
                                                     FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                                     FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                                     FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                                     FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),        
                                                     FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                                     reValorInfINSS.Text,
                                                     reValorCalcINSS.Text,
                                                     qryDet.FieldByName('DibBenefAnt').AsString,
                                                     qryDet.FieldByName('ValorBenefAnt').AsString,
                                                     qryDet.FieldByName('ValorAtual').AsString,
                                                     iFlgPossuiAcomp,
                                                     bErro,
                                                     reValorSRB.Text,
                                                     '0', 
                                                     ''   
                                                    );
     if bErro then
     begin
        MsgDlg('Erro na Regra de Verificação de Benefício Mínimo. '+#13+
               'Verificar a Regra No. '+qryBeneficio.FieldByName('IDREGRABENEFMIN').AsString,
               'Erro', mtError, [mbOk], 0);
        Abort;
     end;

     if bBeneficioMinimo
     then qryDet.FieldByName('FLGBENEFMIN').AsInteger := 1
     else qryDet.FieldByName('FLGBENEFMIN').AsInteger := 0;
  end;

  if qryDet.State = dsInsert
  then OperacaoDetalhe := opInserir
  else if qryDet.State = dsEdit
       then OperacaoDetalhe := opAlterar
       else OperacaoDetalhe := opIdle;

  inherited;

end;


procedure TfrmCadRequerBenefParticip.CalculaValorTotalBenef(tTipoCalculo : TTipoCalculo;
                                                            bRequererJudicial : boolean = false);    //edilaine SIG135838
var rPercProvisorio,
    rValorReserva,
    rValorBeneficio : double;
    bErro : boolean;
    sPercentualSaque,
    sSQLBenefAssoc,

    sSQLReserva,
    sMsgErro : string;
    iIdBenefPDV,
    iIdCalculoAnt,
    iIdRegraCalculo : longint;
    bGrupo          : boolean;
    piFlgPossuiAcomp : integer;
begin

  if (tTipoCalculo = tcViaDeficit) then  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  begin
    if (bFlgApresentaBSFAB) then
    begin
     {IN: RN09 / TC: RN05 }
     {Ao calcular da base do déficit, caso os valores de BS e FAB não tenham sido calculados anteriormente apresentar crítica}
     if (reValorBS.Text = '') or (reValorFAB.Text = '') then
     begin
       MsgDlg('Para cálculo da base do déficit é necessário calcular o valor do BS e o valor do FAB. ','Informação',mtInformation,[mbOk],0);
       Exit;
     end;
    end;

    if qryBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger <= 0 then
       Exit;

    iIdRegraCalculo := qryBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger;

  end
  else
  begin
    iContClick        := iContClick + 1;
    if not VerificaCamposObrigREGRA then Exit;
  end;  // edilaine - SOL 253577-17464 / PPM 955703 - fim

  // Executar o exit do calculo do inss para garantir que o valor informado do inss
  // foi preenchido antes de calcular o valor da suplementacao
  try
    reValorCalcInssExit(reValorBeneficio);
  except
  end;

  // Se nao tiver regra
  // Entao  verificar se o benefício é em cotas
  //        Se o beneficio for em cotas
  //        Entao apenas converter o valor digitado para cotas
  //        Senao nao fazer nada

  if (tTipoCalculo = tcViaValorTotal) then  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  begin
    // Se o participante, antes de requerer o beneficio, estava em
    // manutencao PDV (P), utilizar a regra gravada no evento
    // Senao, usar a regra do beneficio
    if UpperCase(Trim(sTipoSitFuncAntes)) = 'P'
    then begin
       if qryBeneficio.FieldByName('FlgResgate').AsInteger = 0
       then iIdRegraCalculo := BuscaRegraEventoPdv('B',iIdPessJur, iIdPlanoPrev,
                                                       iIdTitular, iSeqProposta,
                                                       iIdBenefPDV,
                                                       qryAux)
       else iIdRegraCalculo := BuscaRegraEventoPdv('R',iIdPessJur, iIdPlanoPrev,
                                                       iIdTitular, iSeqProposta,
                                                       iIdBenefPDV,
                                                       qryAux);
       // Se o beneficio pretendido quando o participante entrou em PDV
       // for o mesmo que está sendo requerido agora, usar as regras do beneficio
       // na epoca do PDV.
       // Se o participante estiver requerendo um benefício diferente,
       // usar as regras do proprio beneficio que está sendo requerido.
       if iIdBenefPDV = qryBeneficio.FieldByName('IdRegraCalculo').AsInteger
       then begin
          if iIdRegraCalculo <= 0
          then begin
             MsgDlg('Este participante se encontrava em Manutenção PDV, '+
                    'porém a Regra de Cálculo de Benefício para este caso não foi encontrada. '+
                    'Verifique. ','Informação',mtInformation,[mbOk],0);
             frmAguarde.Apaga;
             Exit;
          end;
       end
       else iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraCalculo').AsInteger;
    end
    else iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraCalculo').AsInteger;
  end; // edilaine - SOL 253577-17464 / PPM 955703 - fim

  if sTipoFormChamador = 'SI' then
    if qryBeneficio.FieldByName('IdRegraSimula').AsInteger <= 0 then
    Begin
      frmAguarde.Apaga;
      Exit
    End
    Else
      iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraSimula').AsInteger;


  if (tTipoCalculo = tcViaValorTotal) then  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
     frmAguarde.Mostra('Regra de Cálculo de Benefício - Nº '+IntToStr(iIdRegraCalculo))
  else
     frmAguarde.Mostra('Regra de Cálculo do Déficit - Nº '+qryBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsString);
  // edilaine - SOL 253577-17464 / PPM 955703 - fim

  // Se já calculou o benefício, entao voltar a reserva para valor original para recalcular
  if StrToFloat(ClienteNumero(reValorBeneficio.Text)) > 0 then
    SelecionaReservaPart;

  CalculaDias;

  // Executar regra de calculo da reserva para beneficio passando a query ReservaPart
  // que está com o valor abatido da reserva
  rValorReserva := CalculaReservaParaBeneficio ( qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                 qryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                                 qryBeneficio.FieldByName('FlgResgate').AsInteger );

  sValorReserva  := FloatToStr(rValorReserva);

  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

  // Se nao tiver valor inf. do inss, mas o beneficio cadastrado antes deste
  // tiver, passar o valor dele para esta regra
  if (Trim(reValorInfInss.Text) = '') or
     (Trim(reValorInfINSS.Text) = '0') or
     (Trim(reValorInfInss.Text) <> '') and (StrToFloat(ClienteNumero(Trim(reValorInfInss.Text))) <= 0) and
     (not qryBenefAux.IsEmpty) then
  begin
    qryBenefAux.First;
    sValorInfINSS := OraNumero(qryBenefAux.FieldByName('VlrInfInss').AsString);
  end
  else
    sValorInfINSS := OraNumero(Trim(reValorInfInss.Text));

  if qryBeneficio.FieldByName('IdGrupoBenef').AsInteger > 0 then
    bGrupo := True
  else
    bGrupo := False;

  // Executar regra de calculo do beneficio
  try
    rValorBeneficio := 0;
    iIdCalculoAnt   := iIdCalculo;


    if dbrgrpPossuiAcompINSS.ItemIndex = 0 then
      piFlgPossuiAcomp := 0
    else
      piFlgPossuiAcomp := 1;

    If (Not DbChbPossuiAcomp.Checked) Then
      piFlgPossuiAcomp := 0
    Else
      piFlgPossuiAcomp := 1;
    

    if (tTipoCalculo = tcViaDeficit) then  // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
    begin

      sSQLBenefAssoc := MontaSQLBenefAssoc(qryDet.FieldByName('IDTITULAR').AsInteger);

      rValorBeneficio := ExecutaRegraCalculoDeficit(qryAux,
                                                iIdRegraCalculo,
                                                iIdPlanoPrev,    // iIdPlanoPrev,
                                                iIdPessJur,      // iIdPessJur,
                                                iIdTitular,       // iIdPessoa,
                                                iIdTitular,      // iIdTitular,
                                                qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,    // IdBeneficio
                                                bErro,
                                                sMsgErro,
                                                iIdCalculo,
                                                rOpcao1,       // rOpcao1,
                                                rOpcao3,       // rOpcao1,
                                                sSQLBenefAssoc,
                                                StrToFloat(ClienteNumero(reValorBS.text)),
                                                StrToFloat(ClienteNumero(reValorBeneficio.text)),
                                                StrToFloat(ClienteNumero(reValorBeneficio.text)),
                                                StrToFloat(sValorInfINSS),
                                                '100',
                                                iIdSitPlanoPrev,
                                                FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                                FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                                qryBeneficio.FieldByName('IDPLANPREVCONTAB').AsInteger
                                               );

    end
    else   // edilaine - SOL 253577-18064 / PPM 1240079 - fim
    begin

      rValorBeneficio := ExecutaRegraCalculoBeneficio(qryAux,
                                          iIdRegraCalculo,
                                          qryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                          iIdPessJur, iIdPlanoPrev, iIdTitular,
                                          iSeqProposta,
                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                          iNumeroProcesso,
                                          rOpcao1, rOpcao2, rOpcao3,
                                          sSQLBenefAssoc,
                                          FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                          FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                          FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),
                                          FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                          FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
                                          sValorInfINSS,
                                          reValorCalcINSS.Text,
                                          FloatToStr(rValorReserva),
                                          bGrupo,
                                          0,
                                          qryDet.FieldByName('DibBenefAnt').AsString,
                                          qryDet.FieldByName('ValorBenefAnt').AsString,
                                          qryDet.FieldByName('VALORBINSSANT1').AsString,
                                          qryDet.FieldByName('VALORBINSSANT2').AsString,
                                          qryDet.FieldByName('VALORBINSSANT3').AsString,
                                          bErro,
                                          sMsgErro,
                                          iIdCalculo,
                                          piFlgPossuiAcomp,
                                          StrToFloat(ClienteNumero(reValorSRB.Text)),
                                          sIdSitPartAntes,
                                          sIdSitPlanAntes,
                                          sIdSitFuncAntes,
                                          IntToStr(iIdSitPart),
                                          IntToStr(iIdSitPlanoPrev),
                                          IntToStr(iIdSitFunc),
                                          FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
                                          qryDet.FieldByName('FLGPROVISORIO').AsInteger,
                                          qryDet.FieldByName('PRAZOPROVISORIO').AsInteger,
                                          qryDet.FieldByName('PERCPROVISORIO').AsFloat,
                                          -1,
                                          StrToFloat(ClienteNumero(reValorFAB.text)),          // edilaine - SOL 253577-17464 / PPM 955703
                                          StrToFloat(ClienteNumero(reValorBS.text)),            // edilaine - SOL 253577-17464 / PPM 955703
                                          StrToFloat(ClienteNumero(reValorBeneficio.text))      // edilaine - SOL 253577-17464 / PPM 955703
                                          );
    end;

  except
    frmAguarde.Apaga;
  end;
  frmAguarde.Apaga;

  if (tTipoCalculo = tcViaDeficit) and (bErro) then
  begin
    sMsgErro := StringReplace(sMsgErro, 'Valor do Benefício', 'Déficit', [rfReplaceAll]);
  end;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    rValorReal  := 0;
    rValorCotas := 0;
    reValorBeneficio.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0 then
    iIdCalculo := iIdCalculoAnt;


  if (tTipoCalculo = tcViaDeficit) then  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  begin
     reValorDeficit.Text := FormatFloat('#0.00', rValorBeneficio);
  end
  else
  begin
    // O SISTEMA NÃO APLICARÁ MAIS O PERCENTUAL DE CONCESSAO AO BENEFICIO
    // AS REGRAS DE CALCULO DEVERÃO FAZER ISSO

    rValorReal  := rValorBeneficio;

    // O trecho abaixo foi comentado pois tira toda a funcionalidade de
    // transformar real para cotas

    if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1 then
    Begin
      rValorCotas := ConverteBeneficioParaCotas(rValorReal);
      if (not bRequererJudicial) then    //edilaine SIG135838
         reValorBeneficio.Text := FormatFloat('#0.000000',rValorCotas)
    End
    else
    begin
      if (not bRequererJudicial) then    //edilaine SIG135838
         reValorBeneficio.Text := FormatFloat('#0.00',rValorReal);
    end;
    
    bRecalculouProvisorio := True;
  end;     // edilaine - SOL 253577-17464 / PPM 955703 - fim
end;


procedure TfrmCadRequerBenefParticip.reValorBeneficioBtnClick(Sender: TObject);
begin

  CalculaValorTotalBenef(tcViaValorTotal);   // edilaine - SOL 253577-17464 / PPM 955703

end;


procedure TfrmCadRequerBenefParticip.reValorDeficitBtnClick(Sender: TObject);
begin

  CalculaValorTotalBenef(tcViaDeficit);   // edilaine - SOL 253577-17464 / PPM 955703

end;


procedure TfrmCadRequerBenefParticip.reValorCalcInssBtnClick(
  Sender: TObject);
var rValorINSS       : double;
    bErro            : boolean;
    sSQL,
    sMsgErro         : string;
    rValorRegra      : double;
    piFlgPossuiAcomp : integer;
    sValorInfINSS : String;
begin
  inherited;
  // Executar regra de calculo do valor do inss
  if (Trim(qryBeneficio.FieldByName('IDREGRACALCINSS').AsString) <> '') AND
     (qryBeneficio.FieldByName('IDREGRACALCINSS').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Cálculo do INSS - Nº '+qryBeneficio.FieldByName('IdRegraCALCINSS').AsString);

     
     if dbrgrpPossuiAcompINSS.ItemIndex = 0 then
       piFlgPossuiAcomp := 0
     else
       piFlgPossuiAcomp := 1;

     If (Not DbChbPossuiAcomp.Checked) Then
       piFlgPossuiAcomp := 0
     Else
       piFlgPossuiAcomp := 1;
     


     
     // Se nao tiver valor inf. do inss, mas o beneficio cadastrado antes deste
     // tiver, passar o valor dele para esta regra
     if (Trim(reValorInfInss.Text) = '') or
        (Trim(reValorInfINSS.Text) = '0') or
        (Trim(reValorInfInss.Text) <> '') and (StrToFloat(ClienteNumero(Trim(reValorInfInss.Text))) <= 0) and
        (not qryBenefAux.IsEmpty) then
     begin
       qryBenefAux.First;
       sValorInfINSS := OraNumero(qryBenefAux.FieldByName('VlrInfInss').AsString);
     end
     else
       sValorInfINSS := OraNumero(Trim(reValorInfInss.Text));
     

     Try
     rValorINSS :=  ExecutaRegraCalculoINSS(qryAux,
                                            qryBeneficio.FieldByName('IdRegraCALCINSS').AsInteger,
                                            iIdPessJur, iIdPlanoPrev, iIdTitular,
                                            iSeqProposta,
                                            qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                            iNumeroProcesso,
                                            iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
                                            rOpcao1, rOpcao2, rOpcao3,
                                            FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                            FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                            FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                            0,
                                            bErro,
                                            sMsgErro,iIdCalculo,
                                            qryDet.FieldByName('DibBenefAnt').AsString,
                                            qryDet.FieldByName('ValorBenefAnt').AsString,
                                            qryDet.FieldByName('VALORBINSSANT1').AsString,
                                            qryDet.FieldByName('VALORBINSSANT2').AsString,
                                            qryDet.FieldByName('VALORBINSSANT3').AsString,
                                            piFlgPossuiAcomp, sValorInfINSS,
                                            
                                            qryDet.FieldByName('FLGPROVISORIO').AsInteger,
                                            qryDet.FieldByName('PRAZOPROVISORIO').AsInteger,
                                            qryDet.FieldByName('PERCPROVISORIO').AsFloat
                                           );
     Except
       frmAguarde.Apaga; 
     End;
     frmAguarde.Apaga;

     if bErro then
     begin
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
       reValorCalcINSS.Text := '0';
       Exit;
     end
     else
       reValorCalcINSS.Text  := FloatToStr(rValorINSS);
  end // if idregra <> ''
  else
  begin
     rValorINSS := 0;
     reValorCalcINSS.Text := '0';
  end;
  reValorInfInss.Text := '';
  bReajustouINSS := False;
end;

procedure TfrmCadRequerBenefParticip.qryBeneficioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (not qryDet.Active) or (not (qryDet.State in [dsEdit,dsInsert]))
  then Exit;
  
  if sTipoFormChamador = 'SI' then
  Begin
    
    reValorSRB.ReadOnly       := Not ((qryBeneficio.FieldByName('FLGACTVLRSRB').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString) <> '')));

    reValorBeneficio.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IDREGRASIMULA').AsString) <> '')));
    
  End;



  reValorCalcINSS.ReadOnly       := (Trim(qryBeneficio.FieldByName('IdRegraCalcINSS').AsString) <> '');

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor Inicial  ';


  //estava sempre alterando a forma de pagamento
  if  qryDet.State  = dsInsert then
  begin
     if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
     then begin
        dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
        dblkcmbTpPgtoBenef.PerformSearch;
     end
     else dblkcmbTpPgtoBenef.Text := '';
  end;



  bbtnOpcoes.Visible      := (qryBeneficio.FieldbyName('FlgAceitaOpcao').AsInteger = 1 ) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);
  lblAgencia.Visible      := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );
  dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );

  
  // Preencher qual é o beneficio de referencia
  if (qryDet.Active) and (qryDet.FieldByName('IDBENEFREFEREN').AsInteger > 0)
  then iIdBenefReferencia  := qryDet.FieldByName('IDBENEFREFEREN').AsInteger
  else if (Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> '')
       then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
       else iIdBenefReferencia  := -1;



  // Verificar se é um benefício de INVALIDEZ.
  // Se for, exibir pergunta de ACOMPANHANTE INSS

  if qryBeneficio.FieldByName('TIPOBENEFICIO').AsInteger = 1
  Then DbChbPossuiAcomp.Enabled := True
  Else DbChbPossuiAcomp.Enabled := False;
  

  if qryDet.State <> dsEdit
  then begin
    lblDataFinal.Caption  := 'Data Final';
    dtDataFinal.DataField := 'DataFinal';
    qryDet.FieldByName('FLGDATAPREVISTA').AsInteger    := 0;
  end;

  dbrgrpDataPrevista.ItemIndex := 1;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';

     pnlNaoBenefProv.visible := false;
     grpInfSupl.Visible := True;
  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';

     pnlNaoBenefProv.visible := True;
     grpInfSupl.Visible := True;
  end;

  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  lblSRB.visible           := pnlNaoBenefProv.visible;
  reValorSRB.visible       := pnlNaoBenefProv.visible;
  lblValorBenef.visible    := pnlNaoBenefProv.visible;
  reValorBeneficio.visible := pnlNaoBenefProv.visible;
  // edilaine - SOL 253577-17464 / PPM 955703 - fim


  // Configurar combo de beneficio de referencia
  // Se for do INSS ou for uma suplementarcao com um beneficio de referencia cadastrado na parametrizacao
  // Entao nao mostrar o combo para preenchimento individual
  // Senao, permitir que o usuario informe o beneficio de referencia neste momento
  if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1) or
     (Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> '') or
     (qrySelecionaBenefRef.IsEmpty)
  then begin
     dblkpcmbBenefReferencia.Visible := False;
     lblBenefReferencia.Visible      := False;
     edCodFundacao.Visible           := False;
     lblCodFundacao.Visible          := False;
     dblkpcmbBenefReferencia.Text    := '';
  end
  else begin
     dblkpcmbBenefReferencia.Visible := True;
     lblBenefReferencia.Visible      := True;
     edCodFundacao.Visible           := True;
     lblCodFundacao.Visible          := True;
  end;

end;

procedure TfrmCadRequerBenefParticip.dblkpcmbBeneficioCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var sDataInicio, sDataFinal, sMsgErro,
    sNOmeBenefOrdemMenor : string;
    bExisteBenefOrdemMenor,
    bErro : boolean;

    sNumeroProcessoInss : String;
begin
  inherited;

  // TADEU PASSOS, SOL 181948 KINTANA 1724239
  // Verifica se há alum benefício em aberto
  if not(qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) then  // SOL 205075 Xavier
  begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                     ' FROM   BENEFBFCIARIO BF, BENEFICIO B ' +
                     ' WHERE BF.IDBENEFICIO = B.IDBENEFICIO ' +
                     ' AND   BF.IDTITULAR      = ' + IntToStr(iIdTitular) +
                     ' AND   BF.IDPESSOA       = ' + IntToStr(iIdTitular) +
                     ' AND   BF.SEQPROPOSTA    = ' + IntToStr(iSeqProposta) +
                     ' AND   BF.IDPESSJUR      = ' + IntToStr(iIdPessJur) +
                     ' AND   BF.IDPLANOORIGEM  = ' + IntToStr(iIdPlanoPrev) +
                     ' AND   B.IDEVENTOGERADOR = 129' +
                     ' AND   BF.IDSITBENEFICIO <> 3'); // diferente de Encerrado
      qryAux.Open;

      if not qryAux.IsEmpty then
      begin
        MsgDlg('Existe um benefício em aberto para esta pessoa em outro processo. Para requerer um novo beneficio é necessário ' + #13 +
               'que o benefício existente seja encerrado.','Atenção!',mtConfirmation,[mbOk,mbHelp],0);
        dblkpcmbBeneficio.Text := '';
        dblkpcmbBeneficio.SetFocus;
        qryAux.Close;
        Exit;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT B.IDBENEFICIO FROM BENEFBFCIARIO BF, BENEFICIO B ' +
                     'WHERE BF.IDBENEFICIO = B.IDBENEFICIO ' +
                     ' AND BF.IDPESSJUR = '     + IntToStr(iIdPessJur) +
                     ' AND BF.IDTITULAR = '     + IntToStr(iIdTitular) +
                     ' AND BF.IDPESSOA  = '     + IntToStr(iIdTitular) +
                     ' AND BF.IDPLANOORIGEM = ' + IntToStr(iIdPlanoPrev) +
                     ' AND BF.SEQPROPOSTA = '   + IntToStr(iSeqProposta) +
                     ' AND B.IDEVENTOGERADOR = 129' +
                     ' AND BF.IDSITBENEFICIO = 3');

      qryAux.Open;

      if not qryAux.IsEmpty then
      begin
        if MsgDlg('Este benefício já foi requerido para essa pessoa em outro processo. Deseja requerer um novo beneficio?',
                  'Atenção!',mtConfirmation,[mbNo, mbYes],0) = mrNo then
          begin
            dblkpcmbBeneficio.Text := '';
            dblkpcmbBeneficio.SetFocus;
            qryAux.Close;
            Exit;
          end;
      end;
  end; // SOL 205075 Xavier
  // TADEU PASSOS, SOL 181948 KINTANA 1724239
  
  // Verificar hstbenefbfciario Vinicius Ferreira SOL 157583 Kintana 1269810
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
                 ' FROM   hstbenefbfciario '+
                 ' WHERE  NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                 ' AND    IDBENEFICIO  = '+ QuotedStr(sBeneficioAnterior)+   // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O QuotedStr
                 ' AND    IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    IDPESSOA     = '+IntToStr(iIdTitular)+
                 ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(iSeqProposta));
  qryAux.Open;

   if not (qryAux.IsEmpty) then
   begin

     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

   if not (qryAux.IsEmpty) then
   begin
     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

  If dblkpcmbBeneficio.Text <> '' Then
    edCodFundacao.Caption := qryBeneficio.FieldByName('CODBENEFICIO').AsString;

  // Verificar se este benefício já foi requerido em outro processo
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT P.DTEVENTO, BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF, PROCESSOBENEF P '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.IDPESSOA     = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 '+
                 ' AND    BF.NUMEROPROCESSO < '+IntToStr(iNumeroProcesso)+
                 ' AND    BF.NUMEROPROCESSO = P.NUMEROPROCESSO ');
  qryAux.Open;

  if not(qryAux.IsEmpty) then
  begin
     if qryAux.FieldbyName('DtEvento').AsString = FormatDateTime('dd/mm/yyyy', dtDataEvento.Date) then  
     begin
        MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
               ' e está pendente de concessão. '+
               'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'.','Erro',mtError,[mbOk],0);
        qryAux.Close;
        dblkpcmbBeneficio.Text := '';
        dblkpcmbBeneficio.SetFocus;
        Exit;
     end
     else
     begin
        if MsgDlg('O mesmo benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
                  ' e está pendente de concessão. Processo Nº '+qryAux.FieldByName('NumeroProcesso').AsString+'.'+#13+
                  'Deseja abrir um novo requerimento ?  ','Confirmação',mtConfirmation,[mbYes, mbNO],0) = mrNo
        then begin
           qryAux.Close;
           dblkpcmbBeneficio.Text := '';
           dblkpcmbBeneficio.SetFocus;
           Exit;
        end;
     end;
  end;

  // Verificar se este beneficio já foi requerido neste processo
  if qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])
  then begin
     MsgDlg('Este benefício já foi requerido neste mesmo processo. Verifique. ','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficio.Text := '';
     dblkpcmbBeneficio.SetFocus;
     Exit;
  end;

  
  If (JaPossuiBeneficio(iIdPessJur, iIdTitular, iIdTitular, iIdPlanoPrev,
                           qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                           iSeqProposta))
    And (sTipoFormChamador <> 'SI') 
  Then Begin
     If MsgDlg('Este benefício já foi requerido em outro processo, deseja continuar? ',
               'Atenção',mtConfirmation,[mbYes, mbNO],0) = mrNo
     Then Begin
       dblkpcmbBeneficio.Text := '';
       dblkpcmbBeneficio.SetFocus;
       Exit;
     End;
  end;
  

  // Verificar se o benefício é de ordem maior que outro nao requerido
  bExisteBenefOrdemMenor := False;
  sNomeBenefOrdemMenor   := '';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NUMORDEMEVENTO, B.NOME, B.IDTPPAGTOBENEFIC '+
                 ' FROM   BENEFICIO B, BENEFPLANPREV BP  '+
                 ' WHERE  B.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+
                 ' AND    B.IDBENEFICIO     <> '+qryBeneficio.FieldByName('IdBeneficio').AsString+
                 ' AND    BP.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+
                 ' AND    B.IDBENEFICIO    = BP.IDBENEFICIO '+
                 ' AND    BP.FLGREFERENCIA = 0 ');
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
     qryAux.First;
     while not qryAux.Eof do
     begin
        if (qryAux.FieldByName('NUMORDEMEVENTO').AsInteger <
            qryBeneficio.FieldByName('NUMORDEMEVENTO').AsInteger) and
            (not qryBenefAux.Locate('IdBeneficio',qryAux.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]))
        then begin
           bExisteBenefOrdemMenor := True;
           sNomeBenefOrdemMenor   := qryAux.FieldByName('Nome').AsString;
           break;
        end;
        qryAux.Next;
     end;
     if (sistema.IdModulo <> 454) then begin
       if (bExisteBenefOrdemMenor) and
          (MsgDlg('O benefício '+sNomeBenefOrdemMenor+' deveria ser requerido antes do '+
                      qryBeneficio.FieldByName('Nome').AsString+'. Confirma o requerimento ? ',
                      'Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo)
       then begin
          dblkpcmbBeneficio.Text := '';
          dblkpcmbBeneficio.SetFocus;
          Exit;
       end;
     end;
// Inicio SIG 132064
   dtDataFinal.Enabled :=  (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital) or
                           ((qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = prmIdTpPgBenVital) and
                            (qryBeneficio.FieldByname('FLGHABDATAFIM').AsInteger = 1)) ;
// FIM
  end;

  { Iniciar Calculo para cada beneficio utilizado }
  iIdCalculo := 0;

  lblNomeBenef.Caption := qryBeneficio.FieldByName('Nome').AsString;

  //Preencher tipo de pagamento
  
  //estava sempre alterando a forma de pagamento
  if  qryDet.State  = dsInsert then
  begin
     
     QryDet.FieldByName('FLGACEITAZERO').AsInteger  := QryBeneficio.FieldByName('FLGACEITAZERO').AsInteger;

     //edilaine - SIG47962 - inicio
     //QryDet.FieldByName('FLGPAGAINSS').AsInteger    := QryBeneficio.FieldByName('FLGPAGAINSS').AsInteger;
     //edilaine - SIG47962 - fim

     if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
     then begin
        dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
        dblkcmbTpPgtoBenef.PerformSearch;
     end
     else dblkcmbTpPgtoBenef.Text := '';


// SIG 132064     dtDataFinal.Enabled :=  (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital);
//Inicio SIG 132064
   dtDataFinal.Enabled :=  (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital) or
                           ((qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = prmIdTpPgBenVital) and
                            (qryBeneficio.FieldByname('FLGHABDATAFIM').AsInteger = 1)) ;

     If (Not dtDataFinal.Enabled) or
        ((dtDataFinal.Enabled) and (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = prmIdTpPgBenVital))  Then      // SIG 132064
       dtDataFinal.Text := '';
// FIM
  end;
  



  If (qryDet.Active) And (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) Then
    qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 1
  Else
    qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 2;


  
  // Preencher qual é o beneficio de referencia
  if (qryDet.Active) and (qryDet.FieldByName('IDBENEFREFEREN').AsInteger > 0)
  then iIdBenefReferencia  := qryDet.FieldByName('IDBENEFREFEREN').AsInteger
  else if (Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> '')
       then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
       else iIdBenefReferencia  := -1;

  // Verificar se é um benefício de INVALIDEZ.
  // Se for, exibir pergunta de ACOMPANHANTE INSS

  
  
  
  

  if qryBeneficio.FieldByName('TIPOBENEFICIO').AsInteger = 1 Then
    DbChbPossuiAcomp.Enabled := True
  Else Begin
    DbChbPossuiAcomp.Checked := False;
    DbChbPossuiAcomp.Enabled := False;
  End;
  

 

 

  bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FlgAceitaOpcao').AsInteger = 1 ) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);

  // Executar regra de calculo de data de inicio e data final
  if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraInicio').AsInteger > 0) then
  begin
     frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);

     Try
       sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                                    iIdPessJur,
                                                    iIdPlanoPrev,
                                                    iIdTitular,
                                                    iSeqProposta,
                                                    iIdTitular,
                                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                    rOpcao1,
                                                    rOpcao2,
                                                    rOpcao3,
                                                    FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                                    FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                                    FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                                    FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
                                                    FormatDateTime('dd/mm/yyyy', date),
                                                    FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
                                                    sFlgTpDemissao,
                                                    bErro,
                                                    sMsgErro
                                                   );
     Except
       frmAguarde.Apaga;
     End;
     frmAguarde.Apaga;

     if bErro then
     begin
        MsgDlg(sMsgErro, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        dtDataInicio.Clear;
        dtInicioFund.Clear;
     end
     else
     begin
        qryDet.FieldByName('DataInicio').AsString     := sDataInicio;
        qryDet.FieldByName('DataInicioFund').AsString := sDataInicio;
        dtDataInicio.Date := StrToDate(sDataInicio);
        dtInicioFund.Date := StrToDate(sDataInicio);
     end;
  end; //if regrainicio <> ''

  if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <>  '') and
     (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0)
  then
  begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);

     Try
       sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                                   iIdPessJur,
                                                   iIdPlanoPrev,
                                                   iIdTitular,
                                                   iSeqProposta,
                                                   iIdTitular,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   rOpcao1,
                                                   rOpcao2,
                                                   rOpcao3,
                                                   FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                                   FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                                   FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                                   FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
                                                   FormatDateTime('dd/mm/yyyy', Date),
                                                   FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
                                                   sFlgTpDemissao,
                                                   bErro,
                                                   sMsgErro
                                                  );
     Except
       frmAguarde.Apaga;
     End;
     frmAguarde.Apaga;

     if bErro
     then MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
     else begin
        if Trim(sDataFinal) <> ''
        then begin
           qryDet.FieldByName(dtDataFinal.DataField).AsString   := sDataFinal;
           dtDataFinal.Date                                     := StrToDate(sDataFinal);
        end;
     end;
  end; // if regrafim <> ''
  TiraSQL(qryAux);

  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFPLANOPART ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     rCampoTexto1 := '';
     rCampoTexto2 := '';
     rCampoTexto3 := '';
     // Se participante nao fez opcoes, inserir registro na benefplanopart
     // para o caso de alguma regra ter que gravar valores lá

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, '+
                    '             IDBENEFICIO,VALORBASE1, '+
                    '             VALORBASE2,VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3) '+
                    ' VALUES ('+ IntToStr(iIdPessJur) + ',' +  IntToStr(iIdPlanoPrev) + ','+
                                 IntToStr(iIdTitular) + ',' +  IntToSTr(iSeqProposta) + ','+
                                 qryBeneficio.FieldByName('IDBENEFICIO').AsString+','+
                                 OraNumero(FormatFloat('#0.00000',rOpcao1))+','+
                                 OraNumero(FormatFloat('#0.00000',rOpcao2))+','+
                                 OraNumero(FormatFloat('#0.00000',rOpcao3))+','+
                                 QuotedStr(rCampoTexto1) +','+
                                 QuotedStr(rCampoTexto2) +','+
                                 QuotedStr(rCampoTexto3) +')');
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro na associação do benefício ao participante.','Erro',mtError,[mbOk],0);
        Exit;
     end;
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;
     //Inicio - SOL160185
     If qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
        Then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
     Else rCampoTexto1 := '';

     If qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
        Then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
     Else rCampoTexto2 := '';

     If qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
        Then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
     Else rCampoTexto3 := '';
     //fim - SOL160185
  end;
  qryAux.Close;


  if sTipoFormChamador = 'SI'
  then reValorBeneficio.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');


  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor Inicial  ';

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';




     pnlNaoBenefProv.visible := False;
     grpInfSupl.Visible := True;
  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';

     

     pnlNaoBenefProv.visible := True;
     grpInfSupl.Visible := True
  end;
  rOpcaoGrupo1 := rOpcao1;
  rOpcaoGrupo2 := rOpcao2;
  rOpcaoGrupo3 := rOpcao3;


  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  if (StrToFloat(ClienteNumero(sValorCalcInss)) > 0 ) and
     (
     BuscaDadosINSSEmVigor(qryAux,
                           iIdPessJur,
                           iIdPlanoPrev,
                           iIdTitular,
                           iIdTitular,
                           qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                           FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), 
                           sValorCalcINSS,
                           sValorInfINSS,
                           sDataInicioINSS,
                           sNumProcINSS,
                           sValorBase1INSS,
                           sValorBase2INSS,
                           sValorBase3INSS,
                           sNumeroProcessoInss,
                           sFlgPagaINSS
                          )
     ) then
  begin
     qryDet.FieldByName('VLRCALCINSS').AsString    := ClienteNumero(sValorCalcINSS);
     qryDet.FieldByName('VLRINFINSS').AsString     := ClienteNumero(sValorInfINSS);

      // INICIO - Marcelo Cardoso - SOL262811 PPM1125645
     if sTipoFormChamador = 'EV'  then
     begin
        if (sIdEventoGerador = '334') or (sIdEventoGerador = '369') or (sIdEventoGerador = '373') or (sIdEventoGerador = '368') or
             (sIdEventoGerador = '337') or (sIdEventoGerador = '15') or (sIdEventoGerador = '336') or (sIdEventoGerador = '345')  THEN
        begin
           qryDet.FieldByName('DATAINICIOINSS').AsString := '';
        end
        else
        begin
           qryDet.FieldByName('DATAINICIOINSS').AsString := sDataInicioINSS;
        end;
     end
     else
     begin
        qryDet.FieldByName('DATAINICIOINSS').AsString := sDataInicioINSS;
     end;
     // FIM - Marcelo Cardoso - SOL262811 PPM1125645

     qryDet.FieldByName('NUMPROCINSS').AsString    := sNumProcINSS;
     qryDet.FieldByName('FLGPAGAINSS').AsString    := sFlgPagaINSS;


     reValorCalcInss.Text    := ClienteNumero(sValorCalcINSS);
     reValorInfINSS.Text     := ClienteNumero(sValorInfINSS);
     dtInicioINSS.Date       := StrToDate(sDataInicioINSS);
     dbedNumProcINSS.Text    := sNumProcINSS;

     { Atualizar campo valor do beneficio }
     if (Trim(reValorInfINSS.Text) = '') or (StrToFloat(ClienteNumero(reValorInfINSS.Text)) <= 0)
     then reValorInfINSS.Text := reValorCalcINSS.Text;

     if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
     then begin
        reValorSRB.Text                           := '0';
        reValorBeneficio.Text                     := reValorInfINSS.Text;
        qryDet.FieldByName('VALORATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorInfINSS.Text));
     end;
     
     
     //caso o benef. do INSS seja requerido separadamente, este está com
     //outro NUMPROCESSO, que foi capturado em BuscaINSSEmVigor.
     //caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
     if (trim(sNumeroProcessoInss) <> '') and
        (StrToInt(sNumeroProcessoInss) <>  iNumeroProcesso) then
     begin
        with qryBenefReferencia do
        begin
           Close;
           
           
           ParamByName('IDPESSOA').Value        := iIdTitular;
           ParamByName('SeqProposta').Value     := iSeqProposta;
           ParamByName('IdPessJur').Value       := iIdPessJur;
           ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
           ParamByName('NumeroProcesso').Value  := StrToInt(sNumeroProcessoInss);
           Open;
        end;
     end;
     


  end
  else begin
     reValorCalcINSS.Enabled := True;
     dbedNumProcINSS.Enabled := True;
     // Configurar combo de beneficio de referencia
     // Se for do INSS ou for uma suplementarcao com um beneficio de referencia cadastrado na parametrizacao
     // Entao nao mostrar o combo para preenchimento individual
     // Senao, permitir que o usuario informe o beneficio de referencia neste momento
     if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1) or
        (Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> '') or
        (qrySelecionaBenefRef.IsEmpty)
     then begin
        dblkpcmbBenefReferencia.Visible := False;
        lblBenefReferencia.Visible      := False;
        edCodFundacao.Visible           := False;
        lblCodFundacao.Visible          := False;
        dblkpcmbBenefReferencia.Text    := '';
     end
     else begin
        dblkpcmbBenefReferencia.Visible := True;
        lblBenefReferencia.Visible      := True;
        edCodFundacao.Visible           := True;
        lblCodFundacao.Visible          := True;
     end;

  end;

  
  reValorSRB.ReadOnly       := Not ((qryBeneficio.FieldByName('FLGACTVLRSRB').AsInteger = 1) Or
                              (Not (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString) <> '')));

  reValorBeneficio.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 1) Or
                              (Not (Trim(qryBeneficio.FieldByName('IDREGRASIMULA').AsString) <> '')));

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  if trim(dblkpcmbBeneficio.text) <> '' then
  begin
     bFlgApresentaDeficit := (qryBeneficio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
     bFlgApresentaBSFAB   := (qryBeneficio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
  end;
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
     (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
     AjustaTela();

  // edilaine - SOL 253577-17374 / PPM 848182 - fim
  
  BeneficioRiscoInss; //Darivaldo Alencar SIG 23985

  //  Andre Imakawa - SIG 58900 - Inicio
  If (dtDataFinal.Enabled) and (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = 2) and (dtDataFinal.Text = '') Then
  Begin
    qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DataInicio').AsString;
    dtDataFinal.Date                         := dtDataInicio.Date;
  //  Andre Imakawa - SIG 58900 - Fim

  //edilaine SIG135838 - inicio
  if sIdEventoGerador = '336' then
  begin
    CalculaValorTotalBenef(tcViaValorTotal, true);   
  end;
  //edilaine SIG135838 - fim

end;

end;

procedure TfrmCadRequerBenefParticip.dblkpcmbEventoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (iIdPlanoPrev <= 0 ) or (not qryEvento.Active) then Exit;

  AbreQryBeneficio(True,qryEvento.FieldByName('IdEventoGerador').AsInteger, iIdPlanoPrev);
end;

procedure TfrmCadRequerBenefParticip.bbtnOkDetClick(Sender: TObject);
var EstadoAnterior : TDataSetState;
    sSql, sResult : String;

    bErro : Boolean;

    sFlgFitEspecial, sFlgMigrado  : String;
    bBloqueia : Boolean; //Renato Visoni SOL 160868 Kintana 1353515
    bOK : Boolean;// Wylliam Silva Kintana: 1319244 SOL: 159477
    bInserir: Boolean;//SIG84530
begin
  bInserir:= (qry.State <> dsInsert);//SIG84530

  // edilaine - SOL 253577-17404 / PPM 850977 - inicio
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or
     (sTipoFormChamador = 'CO') then
  begin
    if (reValorBeneficio.text = '') then
    begin
      MsgDlg('É necessário calcular o '+lblValorBenef.Caption+'.','Informação',mtInformation,[mbOk],0);
      Exit;
    end;

    if (bFlgApresentaBSFAB) then
    begin
      {RN1/2/3 - Ao alterar o processo de benefício se o valor do Beneficio Saldado não for informado o sistema apresenta crítica MSG12}
      if (reValorBS.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do BS. ','Informação',mtInformation,[mbOk],0);
        Exit;
      end;

      {RN1/2/3 - Ao alterar o processo de benefício se o valor do Beneficio Saldado não for informado o sistema apresenta crítica MSG13}
      if (reValorFAB.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do FAB.','Informação',mtInformation,[mbOk],0);
        Exit;
      end;
    end;

    {RN1/2/3 - Ao alterar o processo de benefício se o valor do Beneficio Saldado não for informado o sistema apresenta crítica MSG14}
    if (bFlgApresentaDeficit) and (reValorDeficit.text = '') then
    begin
      MsgDlg('Para requerer o benefício, é necessário calcular o valor da base de cálculo do déficit.', 'Informação', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  // edilaine - SOL 253577-17404 / PPM 850977 - fim

  // edilaine - SIG77401
  {trecho referente ao Perfil de Investimento movido apos  if prmIdRegraContabBenefIndiv > 0 then  }

// Wylliam Silva Kintana: 1319244 SOL: 159477 - Inicio
//*Se DBCheckBox11 (Isenção INSS) estiver checado apresentar a messagem abaixo*
  bOK := false;
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGISENTOIRRF FROM BENEFPLANPREV WHERE IDPLANOPREV ='+IntToStr(iIdPlanoPrev));
     SQL.Add(' AND   IDBENEFICIO =  '+ qryBeneficio.FieldByName('IdBeneficio').AsString);
     Open;
     if FieldByName('FLGISENTOIRRF').AsInteger = 1 then
     begin
        MessageDlg('O benefício que está sento requerido, possui marcação para isenção do IRRF', mtInformation, [mbOK], 0);
        BEGIN
           bOK := true;
        END;
     end;
  end;
  if  bOK  then
  begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add( ' SELECT FLGISENTOIRRF FROM  PESSOAFISICA  WHERE IDPESSOA = '+InttoStr(iIdTitular) );
        Open;
        qryDetFLGISENTOIRRFANT.AsString :=  FieldByName('FLGISENTOIRRF').AsString;
     end;
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add( '   UPDATE PESSOAFISICA SET FLGISENTOIRRF = 1 WHERE IDPESSOA = '+InttoStr(iIdTitular));
        execSql;
     end;
  end;

// Wylliam Silva Kintana: 1319244 SOL: 159477 - Fim

  bInserindoGrupo := False;
  iContClick      := 0;

  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  if (dbedQtdeParcelas.DataSource.DataSet.FieldByName('RESGATEPARCELADO').AsInteger = 1) then
  begin
    if (dbedQtdeParcelas.DataSource.DataSet.FieldByName('QTDEPARCELAS').AsInteger = 0) then
    begin
      MsgDlg('É necessário informar a quantidade de parcelas para o resgate.', Sistema.NomeModulo, mtError, [mbOk], 0);
      if (dbedQtdeParcelas.CanFocus) then
      begin
        dbedQtdeParcelas.SetFocus;
      end;
      SysUtils.Abort;
    end;

    if not((dbedQtdeParcelas.DataSource.DataSet.FieldByName('QTDEPARCELAS').AsInteger >= 2) and (dbedQtdeParcelas.DataSource.DataSet.FieldByName('QTDEPARCELAS').AsInteger <= 12)) then
    begin
      MsgDlg('É necessário informar a quantidade de parcelas válida, valor deve estar entre 2 e 12.', Sistema.NomeModulo, mtError, [mbOk], 0);
      if (dbedQtdeParcelas.CanFocus) then
      begin
        dbedQtdeParcelas.SetFocus;
      end;
      SysUtils.Abort;
    end;

    if (dtDataFinal.DataSource.DataSet.FieldByName('DATAFINAL').IsNull) then
    begin
      MsgDlg('É necessário informar a Data Final para resgate parcelado.', Sistema.NomeModulo, mtError, [mbOk], 0);
      if (dtDataFinal.CanFocus) then
      begin
        dtDataFinal.SetFocus;
      end;
      SysUtils.Abort;
    end;

  end;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520

  // Verificar hstbenefbfciario Vinicius Ferreira SOL 157583 Kintana 1269810
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
                 ' FROM   hstbenefbfciario '+
                 ' WHERE     NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                 ' AND    IDBENEFICIO  = '+QuotedStr(sBeneficioAnterior)+    // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O QuotedStr
                 ' AND    IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    IDPESSOA     = '+IntToStr(iIdTitular)+
                 ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(iSeqProposta));
  qryAux.Open;

   if not (qryAux.IsEmpty) then
   begin

     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

  // ******************************************************************************
  //  VALIDAR DADOS ANTES DE CONFIRMAR O BENEFICIO
  // ******************************************************************************
  //ERALDO LUIS DA SILVA SOL 136375 KINTANA 815802 INICIO
  if (qryDet.State in [dsEdit,dsInsert]) then
  begin
       qryAux := TwwQuery.Create(nil);
       qryAux.Databasename:='BASEDADOS';
       QryAux.Close;
       QryAux.SQL.Clear;
       QryAux.SQL.Add(' SELECT FLGRISCO FROM EVENTOGERADOR ');
       QryAux.SQL.Add(' WHERE IDEVENTOGERADOR = ' +IntToStr (iIdEvento));
       QryAux.SQL.Add(' AND FLGRISCO = ''R'' ');
       QryAux.Open;
      //ERALDO LUIS DA SILVA SOL 163824 KINTANA 1402584 INICIO
       QryAux2.Close;
       QryAux2.SQL.Clear;
       QryAux2.SQL.Add(' SELECT FLGPECULIO FROM BENEFICIO ');
       QryAux2.SQL.Add(' WHERE IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
       QryAux2.SQL.Add(' AND FLGPECULIO = 1 ');
       QryAux2.Open;
     //ERALDO LUIS DA SILVA SOL 163824 KINTANA 1402584 FIM

       if (qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger = 2)
        or (not (QryAux.IsEmpty))  then begin
           if (QryAux2.IsEmpty) and (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2) then begin  //ERALDO LUIS DA SILVA SOL 163824 KINTANA 1402584 // SOL:258193 PPM:976792
              if (dbedNumProcINSS.Text = ''  ) OR (dbedNumProcINSS.Text ='          ') then begin
                 MsgDlg('É necessário informar o NB do INSS.','Informação',mtInformation,[mbOk],0);
                 Exit;
              end;
           end;
           QryAux2.Close;
       end;
  end;
  //ERALDO LUIS DA SILVA SOL 136375 KINTANA 815802 FIM


  //BRUNO AZEVEDO SOL 135605 KINTANA 807282
  if (dbedPercContrib.text = '') then begin
    dbedPercContrib.text := '0';
  end;

  // Renato Visoni SOL 153767 Kintana 1162587
  if ((dbedPercContrib.text = '') or
     (dbedPercContrib.Value < 0) or
     (dbedPercContrib.Value > 100))
  then begin
    MsgDlg('Só é aceito valores numéricos entre 0 e 100.','Erro', mtError, [mbOK], 0);
    dbedPercContrib.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;
  // Renato Visoni SOL 153767 Kintana 1162587


  if Trim(dtDataRequerimento.Text) = ''
  then begin
    MsgDlg('Data de Requerimento não preenchida.','Erro',mtError,[mbOk],0);
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

    //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
  if Trim(dtDataInicio.Text) = ''
  then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    if (dtDataInicio.Enabled) and (dtDataInicio.Visible)
    then dtDataInicio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if Trim(dtInicioFund.Text) = ''
  then begin
    MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
    if (dtInicioFund.Enabled) and (dtInicioFund.Visible)
    then dtInicioFund.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;
  //BRUNO AZEVEDO SOL 156428 KINTANA 1235970


  //edilaine SIG115300 : inicio
  if (dtDataRequerimento.Date > date) and
     (Sistema.IdModulo = 454)                 //edilaine SIG115747
  then begin
     MsgDlg('A Data de Requerimento não pode ser superior a Data Atual. ',
            'Informação',mtInformation,[mbOk],0);
     dtDataRequerimento.SetFocus;
     Exit;
  end;

  if (dtDataInicio.Date > date) and
     (Sistema.IdModulo = 454)                //edilaine SIG115747
  then begin
     MsgDlg('A Data Início do Pagamento não pode ser superior a Data Atual. ',
            'Informação',mtInformation,[mbOk],0);
     if dtDataInicio.CanFocus then
        dtDataInicio.SetFocus;
     Exit;
  end;
  //edilaine SIG115300 : inicio

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Benefício não preenchido.','Erro',mtError,[mbOk],0);
    dblkpcmbBeneficio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  // se for benefício do INSS atribuir o valor Inf. do INSS ao valor do benefício.
  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 Then
    rValorReal := StrToFloat(ClienteNumero(reValorInfINSS.Text));

  if ((Trim(reValorBeneficio.Text) = '') or (StrToFloat(ClienteNumero(reValorBeneficio.Text)) <= 0) ) and
     (qryBeneficio.FieldByName('FLGACEITAZERO').AsInteger <= 0)
  then begin
    MsgDlg('Valor do Benefício inválido.','Erro',mtError,[mbOk],0);
    If reValorBeneficio.CanFocus Then  reValorBeneficio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if (Trim(dtDataInicio.Text) <> '') and (Trim(dtDataFinal.Text) <> '') and
     (dtDataInicio.Date > dtDataFinal.Date) 
  then begin
    MsgDlg('Inconsistência : a data de início do pagamento é maior que a data final.','Erro',mtError,[mbOk],0);
    if dtDataInicio.Enabled then dtDataInicio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

    //Renato Visoni SOL 160868 Kintana 1353515
  bBloqueia := True;

  if (iIdPlanoPrev = 2) then begin
    if ((sIdSitPlanDepois = '25') or (sIdSitPlanDepois ='26')) then begin
      bBloqueia := False;
    end else begin
      bBloqueia := True;
    end;
  end;
  //Renato Visoni SOL 160868 Kintana 1353515

  // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
  // nem que a data do evento
  if (Trim(dtInicioFund.Text) <> '') and
     (Trim(dtInicioINSS.Text) <> '') and
     (dtInicioFund.Date < dtInicioINSS.Date)
     and (bBloqueia) //Renato Visoni SOL 160868 Kintana 1353515
     then
  begin
     MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data de Início no INSS. ',
            Sistema.NomeModulo, mtInformation, [mbOk], 0);
     Repaint;
     if dtInicioFund.CanFocus then dtInicioFund.SetFocus;
     Exit;
  end;

  //edilaine SIG115747 : inicio
  if (Sistema.IdModulo = 454)
  then
  begin
    if (Trim(dtInicioFund.Text) <> '') and
       (Trim(dtDataEvento.Text) <> '') and
       //(dtInicioFund.Date < dtDataEvento.Date) then   //edilaine SIG115300
       (dtInicioFund.Date > dtDataEvento.Date)          //edilaine SIG115300
    then
    begin
       MsgDlg('A DIB (Data de Início na Fundação) não pode ser superior a Data do Evento. ',    //edilaine SIG115300
              Sistema.NomeModulo, mtInformation, [mbOk], 0);
       Repaint;
       dtInicioFund.SetFocus;
       Exit;
    end;
  end
  else
  begin
    if (Trim(dtInicioFund.Text) <> '') and
       (Trim(dtDataEvento.Text) <> '') and
       (dtInicioFund.Date < dtDataEvento.Date)
    then
    begin
       MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data do Evento. ',
              Sistema.NomeModulo, mtInformation, [mbOk], 0);
       Repaint;
       dtInicioFund.SetFocus;
       Exit;
    end;
  end;
  //edilaine SIG115747 : fim


  // Data do Requerimento nao pode ser menor que a data do evento
  if (Trim(dtDataRequerimento.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtDataRequerimento.Date < dtDataEvento.Date) and  
     not(qrybeneficio.fieldbyname('FLGRESGATE').AsInteger  in [0,1])   // SOL 224485 Kintana 2060136
  then begin
     MsgDlg('A Data de Requerimento não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtDataRequerimento.SetFocus;
     Exit;
  end;

  
  If (qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E') And
     (Trim(dblkpcmbPortForma.Text) = '') Then
  Begin
     MsgDlg('É necessário informar a forma de pagamento para esse benefício',
            'Informação',mtInformation,[mbOk],0);
     dblkpcmbPortForma.SetFocus;
     Exit;
  End;

  If (qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E') And
     (Trim(dblkcbEPP.Text) = '') Then
  Begin
     MsgDlg('É necessário informar a Entidade Previdenciária Privada para esse benefício',
            'Informação',mtInformation,[mbOk],0);
     dblkcbEPP.SetFocus;
     Exit;
  End;
  

  // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
  // nem que a data do evento
  if (Trim(dtDataInicio.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtDataInicio.Date < dtDataEvento.Date)  
  then begin
     if MsgDlg('A Data de Início do Pagamento não pode ser inferior a Data do Evento. Confirma ? ',
            'Confirmação',mtConfirmation,[mbOk],0) = mrNo
     then begin
        dtDataInicio.SetFocus;
        Exit;
     end;
  end;

  // Se o beneficio obriga numero do processo e o numero estiver em
  // branco, dar mensagem
  if (qryBeneficio.FieldByName('flgObrigaNProc').AsString = '1') and
     (Trim(dbedNumProcINSS.Text) = '') and
     (sTipoFormChamador <> 'SI')
     And (dbedNumProcINSS.Enabled)      
  then begin
    MsgDlg('O Nº do Processo no INSS para este benefício é obrigatório e não foi preenchido. Verifique',
           'Erro',mtError,[mbOk],0);
    dbedNumProcINSS.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if (qryBeneficio.FieldbyName('IdRegraCalculo').AsInteger > 0) and
     ( iProvisorioAntes <> dbrgrpBenefProvisorio.ItemIndex)     and
     ( not bRecalculouProvisorio )
  then begin
    MsgDlg('A opção "Benefício Provisório" foi alterada e o benefício não foi recalculado.'+#13+
           'Recalcule o benefício antes de confirmar a operação.',
           'Informação',mtInformation,[mbOk],0);
    TiraSQL(qryAux);
    Abort;
  end;

  // Se o beneficio tem alguma opcao obrigatoria e esta opcao nao foi preenchida,
  // chamar cadastro de opcoes
  if  ((qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) And
      ((qryBeneficio.FieldbyName('flgObrigaOp1').AsInteger = 1) And (rOpcao1 <= 0)) Or
      ((qryBeneficio.FieldbyName('flgObrigaOp2').AsInteger = 1) And (rOpcao2 <= 0)) Or
      ((qryBeneficio.FieldbyName('flgObrigaOp3').AsInteger = 1) And (rOpcao3 <= 0))) or
      ((qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger >= 1) And
      (((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO1').AsInteger = 1) And (rCampoTexto1 = '')) or
      ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO2').AsInteger = 1) And (rCampoTexto2 = '')) or
      ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO3').AsInteger = 1) And (rCampoTexto3 = '')))
      )
  then begin
     MsgDlg('Existe opção de benefício obrigatória não informada.','Erro',mtError,[mbOk],0);
     bbtnOpcoesClick(Sender);
  end;

  // Se o usuario nao executou a regra de concessao, executá-la agora
  if not bExecutouRegraConcessao
  then bbtnElegibilidadeClick(Sender);

  if not bConcedeBeneficio
  then begin
       MsgDlg('A Regra de Elegibilidade nº '+
              qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
              ' NÃO foi satisteita. Verifique. ','Informação',mtInformation,[mbOk],0);
       Abort;
  end;


  
  //dados para contabilização individual
  if prmIdRegraContabBenefIndiv > 0 then
  begin
     //a regra será executada para cada campo com possibilidade de
     //parametrização individual automática
     //a regra é única e o tipo de campo a ser retornada é informado através
     //do campo de nome "CAMPO" na query
     //caso não haja parametrização individual para determinado caso, a regra deve retornar "0" (zero)


     sFlgFitEspecial := '0';
     qryaux.close;
     qryaux.SQL.text := ' SELECT NVL(FLGFITESPECIAL ,0) FLGFITESPECIAL'+
                        ' FROM PARTPREVPLAN '+
                        ' WHERE IDPESSOA = '+IntToStr(iIdTitular)+' AND '+
                        ' IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' ';
     qryaux.open;
     if not qryaux.isempty then
     sFlgFitEspecial :=  qryaux.fieldbyname('FLGFITESPECIAL').AsString;



     sFlgMigrado := '0';
     qryaux.close;
     qryaux.SQL.text := '  SELECT 1 FROM PARTPREVPLAN '+
                        '  WHERE IDPESSOA = '+IntToStr(iIdTitular)+' AND '+
                        '  IDPLANOPREV <> '+IntToStr(iIdPlanoPrev)+'  AND '+
                        '  IDSITPLANOPREV IN '+
                        '  (SELECT IDSITPLANOPREV '+
                        '  FROM SITPLANOPREV '+
                        '  WHERE FLGINTERNO = ''TR'') ';
     qryaux.open;
     if not qryaux.isempty then
     sFlgMigrado :=  '1';


     sSQL := 'SELECT  '+IntToStr(iIdTitular)+' AS IDPESSOA ,'+
             ' '+IntToStr(iIdTitular)+' AS IDTITULAR ,'+
             ' '+IntToStr(iIdPlanoPrev)+' AS IDPLANOPREV ,'+
             ' '+IntToStr(iIdSitPart)  +' AS IDSITPART, '+             
             ' '+IntToStr(iIdSitPlanoPrev)  +' AS IDSITPLANOPREV,   '+ 
             ' '+qryBeneficio.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO, '+
             ' '+sFlgFitEspecial+' AS FLGFITESPECIAL, '+sFlgMigrado+' AS FLGMIGRADO ';


     //IDPLANPREVCONTAB
     sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                            sSQL+', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL',
                            bErro, iIdCalculo );


     if bErro then
     begin
        MsgDlg('Erro na regra para atribuição automática de entidade contábil.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if  trim(sResult) = '' then
     begin
        MsgDlg('Erro na regra para atribuição automática de entidade contábil. Resultado nulo.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if trim(sResult) <> '0' then
     begin
        //testa validade da informação
        qryaux.close;
        qryaux.sql.text := '  SELECT * FROM  PLANPREVCONTABIL '+
                           '  WHERE IDPLANOPREV = '+sResult    +
                           '  AND   NVL(ATIVO,''S'') = ''S''   '; 
        qryaux.open;

        if qryaux.isempty then
        begin
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de entidade contábil. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Abort;
        end;

        qrydet.fieldbyname('IDPLANPREVCONTAB').AsString := trim(sResult);
     end;
     




     //PLACONTAD
     sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                            sSQL+', ''PLACONTAD'' AS CAMPO FROM DUAL',
                            bErro, iIdCalculo );


     if bErro then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para débito.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if  trim(sResult) = '' then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para débito. Resultado nulo.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if trim(sResult) <> '0' then
     begin
        //testa validade da informação
        qryaux.close;
        qryaux.sql.text := '  SELECT 1 FROM  PLANOCONTA  '+
                           '  WHERE PLACONTA = '+sResult+' ';
        qryaux.open;

        if qryaux.isempty then
        begin
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para débito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Abort;
        end;

        qrydet.fieldbyname('PLACONTAD').AsString := trim(sResult);

     end;
     //FIM - PLACONTAD




     //PLACONTAC
     sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                            sSQL+', ''PLACONTAC'' AS CAMPO FROM DUAL',
                            bErro, iIdCalculo );


     if bErro then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para crédito.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if  trim(sResult) = '' then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para crédito. Resultado nulo.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if trim(sResult) <> '0' then
     begin
        //testa validade da informação
        qryaux.close;
        qryaux.sql.text := '  SELECT 1 FROM  PLANOCONTA  '+
                           '  WHERE PLACONTA = '+sResult+' ';
        qryaux.open;

        if qryaux.isempty then
        begin
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para crédito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Abort;
        end;


        qrydet.fieldbyname('PLACONTAC').AsString := trim(sResult);
     end;
     //FIM - PLACONTAC

  end;

  //edilaine - SIG55933 - inicio
  {verifica se existe perfil parametrizado}
  if (sistema.IdModulo = 454) then  {só para Beneficioprev}
  begin
    PerfilAtual := BuscaPerfilInvestimento(iIdPessJur,
                                           iIdTitular,
                                           iIdPlanoPrev,
                                           iSeqProposta,
                                           -1,
                                           -1,
                                           dtDataInicio.Text,
                                           {false} qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2,    //edilaine - SIG68132
                                           false,
                                           bPerfilAtivo,
                                           QryDet.FieldByName('IDPLANPREVCONTAB').AsInteger              // edilaine - SIG77401
                                           );

    //if (sTipoFormChamador <> 'CO') then
    begin
      if (PerfilAtual.iIdPerfilInvest < 0) then
      begin
        MsgDlg('Participante não possui perfil de investimento cadastrado.','Erro',mtError,[mbOk],0);
        Abort;
      end
      else if (PerfilAtual.iIdPerfilInvest > 0) and (not bPerfilAtivo) then
      begin
        MsgDlg('O perfil de investimento do participante está inativo.','Erro',mtError,[mbOk],0);
        Abort;
      end;
    end;
  end
  else
  begin
    PerfilAtual.iIdPerfilInvest   := -1;
    PerfilAtual.iIdPlanPrevContab := -1;
  end;
  //edilaine - SIG55933 - fim
  
  if sTipoFormChamador <> 'SI'
  then begin
     iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                          frmCadRequerBenefParticip.Caption,
                                                          -1,
                                                          -1,
                                                          iIdPlanoPrev,
                                                          -1,
                                                          -1,
                                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                          StrToFloat(ClienteNumero(reValorBeneficio.Text)),
                                                          False); // Requerimento = False, Outras = True
     if iIdUsuarioAutoriza < 0
     then begin
        MsgDlg('Requerimento de Benefício não permitido por exceder valor limite e não ter autorização. Verifique. ','Informação',mtInformation,[mbOk],0);
        Abort;
     end;
  end;

  //edilaine SIG114751 : inicio
  if ((qryDet.State = dsEdit) or (qryDet.State = dsInsert)) and     // SIG 135992 Ferrari
     (qryBfciarioTitPlan.Locate('IdBeneficio', qryBeneficio.FieldByName('IdBeneficio').AsInteger, [loCaseInsensitive])) and
     (qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E')
  then begin
     qryBfciarioTitPlan.edit;
     qryBfciarioTitPlan.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;
     qryBfciarioTitPlan.Post;
  end;
  //edilaine SIG114751 : fim

  // Preencher campos ainda nao preenchidos
  if (qryDet.State = dsInsert) and
     (not qryBfciarioTitPlan.Locate('IdBeneficio', qryBeneficio.FieldByName('IdBeneficio').AsInteger, [loCaseInsensitive]))
  then begin
     qryBfciarioTitPlan.Insert;
     qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger    := iIdTitular;
     qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger   := iIdTitular;
     qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
     qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger   := iIdPessJur;

     qryBfciarioTitPlan.FieldByName('IdPlanoORIGEM').AsInteger := iIdPlanoPrev;

     qryBfciarioTitPlan.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
     qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat    := 0;
     qryBfciarioTitPlan.FieldByName('Percentual').AsFloat    := 100;


     qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdTitular;

     If qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E' Then
       qryBfciarioTitPlan.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;


     qryBfciarioTitPlan.Post;

  End;

  // Atualizar a reserva part com os valores  movimentados da reserva
  // para que o proximo beneficio já tenha seu valor atualizado

    if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) and
       //(not AtualizaReservaPart(qryBeneficio.FieldByName('IdBeneficio').AsInteger)) //SIG84530
       (not AtualizaReservaPart(qryBeneficio.FieldByName('IdBeneficio').AsInteger, bInserir))
    then begin
       MsgDlg('Ocorreu um erro na atualização do valor da reserva do participante. ',
              'Erro',mtError,[mbOk],0);
       TiraSQL(qryAux);
       Abort;
    end;

  // Se necessario, gravar beneficio de referencia
  if (qryBeneficio.FieldByName('IDBENEFREF').AsInteger > 0) or (dblkpcmbBenefReferencia.Text <> '')
  then GravaBeneficioDeReferencia;

  // Gravar beneficio auxiliar para usar depois os valores dos beneficios
  // e suas opcoes para passar para a regra de calculo dos outros beneficios
  if qryDet.State = dsInsert
  then begin
     qryBenefAux.Insert;
     qryBenefAux.FieldByName('NUMORDEMEVENTO').AsInteger    := qryBeneficio.FieldbyName('NumOrdemEvento').AsInteger;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat          := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat          := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat          := rOpcao3;
     qryBenefAux.FieldByName('CAMPOTEXTO1').AsString        := rCampoTexto1;
     qryBenefAux.FieldByName('CAMPOTEXTO2').AsString        := rCampoTexto2;
     qryBenefAux.FieldByName('CAMPOTEXTO3').AsString        := rCampoTexto3;
     qryBenefAux.FieldByName('NUMEROPROCESSO').AsInteger    := iNumeroProcesso;
     qryBenefAux.FieldByName('IDPESSJUR').AsInteger         := iIdPessJur;

     qryBenefAux.FieldByName('IdPlanoORIGEM').AsInteger     := iIdPlanoPrev;

     qryBenefAux.FieldByName('IDPLANOPREV').AsInteger       := iIdPlanoPrev;
     qryBenefAux.FieldByName('IDTITULAR').AsInteger         := iIdTitular;
     qryBenefAux.FieldByName('IDPESSOA').AsInteger          := iIdTitular;
     qryBenefAux.FieldByName('SEQPROPOSTA').AsInteger       := iSeqProposta;
     qryBenefAux.FieldByName('IDBENEFICIO').AsInteger       := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;

     if sTipoFormChamador <> 'SI'
     then qryBenefAux.FieldByName('IDSITBENEFICIO').AsInteger    := 4
     else qryBenefAux.FieldByName('IDSITBENEFICIO').AsInteger    := 8;

     qryBenefAux.FieldByName('IDDEPENDENCIA').AsString      := 'PRP';

     qryBenefAux.FieldByName('VALORTOTAL').AsFloat          := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryBenefAux.FieldByName('VALORATUAL').AsFloat          := rValorReal;
     qryBenefAux.FieldByName('VALORCALCULADO').AsFloat      := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat          := rValorCotas;
     qryBenefAux.FieldByName('VLRCALCINSS').AsFloat         := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefAux.FieldByName('VLRINFINSS').AsFloat          := StrToFloat(ClienteNumero(reValorInfINSS.Text));
     qryBenefAux.FieldByName('PERCPROVISORIO').AsFloat      := StrToFloat(ClienteNumero(dbedPercConc.Text));
     qryBenefAux.FieldByName('PERCRETENCAO').AsFloat        := dbedPercContrib.Value;  // Renato Visoni SOL 153767 Kintana 1162587

     // edilaine - SOL 253577-17374 / PPM 848182 - inicio
     if bFlgApresentaBSFAB then
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSTOTAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));

       qryBenefAux.FieldByName('VLRFABATUAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));
     end
     else
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').Value   := null;
       qryBenefAux.FieldByName('VLRBSTOTAL').Value    := null;

       qryBenefAux.FieldByName('VLRFABATUAL').Value   := null;
       qryBenefAux.FieldByName('VLRBSATUAL').Value    := null;
     end;
     if bFlgApresentaDeficit then
        qryBenefAux.FieldByName('VLRBASEDEFICIT').AsFloat := StrToFloat(ClienteNumero(reValorDeficit.text))
     else
        qryBenefAux.FieldByName('VLRBASEDEFICIT').Value   := null;

     if (sTipoFormChamador = 'EV') or
        (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
        (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
     begin
       qryBenefAux.FieldByName('BSDIB').AsFloat  := qryBenefAux.FieldByName('VLRBSATUAL').AsFloat;
       qryBenefAux.FieldByName('FABDIB').AsFloat := qryBenefAux.FieldByName('VLRFABATUAL').AsFloat;
     end
     else
     begin
       qryBenefAux.FieldByName('BSDIB').Value  := null;
       qryBenefAux.FieldByName('FABDIB').Value := null;
     end;
     // edilaine - SOL 253577-17374 / PPM 848182 - fim

     if Trim(dbedPrazoProv.Text) <> ''
     then qryBenefAux.FieldByName('PRAZOPROVISORIO').AsInteger   := StrToInt(dbedPrazoProv.Text);

     if Trim(dtInicioFund.Text) <> ''
     then qryBenefAux.FieldByName('DATAINICIOFUND').AsDateTime   := dtInicioFund.Date;

     if Trim(dbedNumProcINSS.Text) <> ''
     then qryBenefAux.FieldByName('NUMPROCINSS').AsString        := dbedNumProcINSS.Text;

     if Trim(dtInicioINSS.Text) <> ''
     then qryBenefAux.FieldByName('DATAINICIOINSS').AsDateTime   := dtInicioINSS.Date;  

     if Trim(dtDataRequerimento.Text) <> ''
     then qryBenefAux.FieldByName('DATAREQUERIMENTO').AsDateTime := dtDataRequerimento.Date;  

     if Trim(dtDataInicio.Text) <> ''
     then qryBenefAux.FieldByName('DATAINICIO').AsDateTime       := dtDataInicio.Date;

     if Trim(dtDataFinal.Text) <> ''
     then if dbrgrpDataPrevista.ItemIndex = 1
          then qryBenefAux.FieldByName('DATAFINAL').AsDateTime          := dtDataFinal.Date   
          else qryBenefAux.FieldByName('DataFinalPrevista').AsDateTime  := dtDataFinal.Date;  


     if Trim(dblkpcmbPortForma.Text) <> ''
     then qryBenefAux.FieldByName('CODPORTFORMA').AsInteger := qryPortForma.FieldByName('CodPortForma').AsInteger;

     if Trim(dblkcmbTpPgtoBenef.Text) <> ''
     then qryBenefAux.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryTpPgtoBenef.FieldByName('IdTpPagtoBenefic').AsInteger;

     // Verificar se é um benefício de INVALIDEZ.
     // Se for, exibir pergunta de ACOMPANHANTE INSS
     if dbrgrpPossuiAcompINSS.ItemIndex = 1
     then qryBenefAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger := 1
     else qryBenefAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger := 0;

     
     If (DbChbPossuiAcomp.Checked) 
     Then qryBenefAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger := 1
     Else qryBenefAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger := 0;
     
     //Darivaldo Alencar SIG 23985 - inicio
     If (DbChbBenef142.Checked)
     Then qryBenefAux.FieldByName('BENEFLEI142').AsInteger := 1
     Else qryBenefAux.FieldByName('BENEFLEI142').AsInteger := 0;
     //Darivaldo Alencar SIG 23985 - fim


     if dbrgFlgFormaPagto.ItemIndex = 0
     then qryBenefAux.FieldByName('FLGFORMAPAGTO').AsString      := 'F'
     else qryBenefAux.FieldByName('FLGFORMAPAGTO').AsString      := 'R';

     if dbrgrpBenefProvisorio.ItemIndex = 0
     then qryBenefAux.FieldByName('FLGPROVISORIO').AsInteger     := 0
     else qryBenefAux.FieldByName('FLGPROVISORIO').AsInteger     := 1;

     if Trim(dblkpcmbAgencia.Text) <> ''
     then qryBenefAux.FieldByName('IDAGENCIARESGATE').AsInteger  := qryAgenciaResgate.FieldByName('IdPessoa').AsInteger;

     //Renato Visoni SOL 123227 Kintana 614304
     if qryBenefAux.FieldByname('FONTEPAGADORA').asInteger = 1 then begin
       fSaldoContabil :=0;
       qryBenefAux.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                                 QryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                                                                  QryBeneficio.FieldByName('FlgResgate').AsInteger );
       //WO16247 - Helen V Bianchi - Inicio
       //qryBenefAux.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
       qryBenefAux.FieldByName('SALDOCONTADIB').asFloat :=  qryBenefAux.FieldByName('RESERVADIB').asFloat;
       //WO16247 - Helen V Bianchi - Fim

      //Renato Visoni SOL 161675 Kintana 1370250
      //qryBenefAux.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryBeneficio.FieldByname('IDPESSJUR').asString,QryBeneficio.FieldByname('IDPESSOA').asString,QryBeneficio.FieldByname('IDPLANOPREV').asString);
      qryBenefAux.FieldByName('INDICEDIB').asFloat     := BuscaIndice(IntTostr(iIdPessJur),IntTostr(iIdTitular),IntTostr(iIdPlanoPrev));
      //Renato Visoni SOL 161675 Kintana 1370250

     end;
     //Renato Visoni SOL 123227 Kintana 614304

     qryBenefAux.Post;
  end
  else begin

     qryBfciariotitPlanAux.Close;
     qryBfciariotitPlanAux.ParamByName('IdPessoa').Value    := iIdTitular;
     qryBfciariotitPlanAux.ParamByName('SeqProposta').Value := iSeqProposta;
     qryBfciariotitPlanAux.ParamByName('IdPessJur').Value   := iIdPessJur;
     qryBfciariotitPlanAux.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
     qryBfciariotitPlanAux.ParamByName('idbeneficio').Value := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;
     qryBfciariotitPlanAux.Open;

     if qryBfciariotitPlanAux.RecordCount = 0 then begin
          qryBfciariotitPlanAux.Close;
          qryBfciariotitPlanAux.Open;
          qryBfciariotitPlanAux.Insert;
          qryBfciarioTitPlanAux.FieldByName('IdPessoa').AsInteger    := iIdTitular;
          qryBfciarioTitPlanAux.FieldByName('IdTitular').AsInteger   := iIdTitular;
          qryBfciarioTitPlanAux.FieldByName('SeqProposta').AsInteger := iSeqProposta;
          qryBfciarioTitPlanAux.FieldByName('IdPessJur').AsInteger   := iIdPessJur;
          qryBfciarioTitPlanAux.FieldByName('IdPlanoORIGEM').AsInteger := iIdPlanoPrev;
          qryBfciarioTitPlanAux.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
          qryBfciariotitPlanAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;// Vinicius Ferreira SOL 157583 Kintana 1269810
          qryBfciarioTitPlanAux.FieldByName('Prioridade').AsFloat    := 0;
          qryBfciarioTitPlanAux.FieldByName('Percentual').AsFloat    := 100;
          qryBfciarioTitPlanAux.FieldByName('IdResponsavel').AsInteger := iIdTitular;
          If qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E' Then begin
            qryBfciarioTitPlanAux.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;
          end;
         qryBfciariotitPlanAux.Post;
         

     end;

     qryBenefAux.Edit;
     qryBenefAux.FieldByName('VALORATUAL').AsFloat       := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat       := rValorCotas;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat       := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat       := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat       := rOpcao3;
     qryBenefAux.FieldByName('CAMPOTEXTO1').AsString     := rCampoTexto1;
     qryBenefAux.FieldByName('CAMPOTEXTO2').AsString     := rCampoTexto2;
     qryBenefAux.FieldByName('CAMPOTEXTO3').AsString     := rCampoTexto3;
     qryBenefAux.FieldByName('VLRINFINSS').AsFloat       := StrToFloat(ClienteNumero(reValorInfINSS.Text));
     qryBenefAux.FieldByName('DATAINICIOINSS').AsDateTime := dtInicioINSS.Date;

     // edilaine - SOL 253577-17374 / PPM 848182 - inicio
     if bFlgApresentaBSFAB then
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSTOTAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));
       qryBenefAux.FieldByName('VLRFABATUAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));
     end
     else
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').Value   := null;
       qryBenefAux.FieldByName('VLRBSTOTAL').Value    := null;
       qryBenefAux.FieldByName('VLRFABATUAL').Value   := null;
       qryBenefAux.FieldByName('VLRBSATUAL').Value    := null;
     end;
     if bFlgApresentaDeficit then
        qryBenefAux.FieldByName('VLRBASEDEFICIT').AsFloat := StrToFloat(ClienteNumero(reValorDeficit.text))
     else
        qryBenefAux.FieldByName('VLRBASEDEFICIT').Value   := null;

     if (sTipoFormChamador = 'EV') or
        (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
        (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
     begin
       qryBenefAux.FieldByName('BSDIB').AsFloat  := qryBenefAux.FieldByName('VLRBSATUAL').AsFloat;
       qryBenefAux.FieldByName('FABDIB').AsFloat := qryBenefAux.FieldByName('VLRFABATUAL').AsFloat;
     end
     else
     begin
       qryBenefAux.FieldByName('BSDIB').Value    := null;
       qryBenefAux.FieldByName('FABDIB').Value   := null;
     end;
     // edilaine - SOL 253577-17374 / PPM 848182 - fim

     //Renato Visoni SOL 123227 Kintana 614304
     if qryBenefAux.FieldByname('FONTEPAGADORA').asInteger = 1 then begin
       fSaldoContabil :=0;
       qryBenefAux.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                                                 QryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                                                                 QryBeneficio.FieldByName('FlgResgate').AsInteger );
       //WO16247 - Helen V Bianchi - Inicio
       //qryBenefAux.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
       qryBenefAux.FieldByName('SALDOCONTADIB').asFloat := qryBenefAux.FieldByName('RESERVADIB').asFloat;
       //WO16247 - Helen V Bianchi - Fim

      //Renato Visoni SOL 161675 Kintana 1370250
      //qryBenefAux.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryBeneficio.FieldByname('IDPESSJUR').asString,QryBeneficio.FieldByname('IDPESSOA').asString,QryBeneficio.FieldByname('IDPLANOPREV').asString);
      qryBenefAux.FieldByName('INDICEDIB').asFloat     := BuscaIndice(IntTostr(iIdPessJur),IntTostr(iIdTitular),IntTostr(iIdPlanoPrev));
      //Renato Visoni SOL 161675 Kintana 1370250

     end;
     //Renato Visoni SOL 123227 Kintana 614304
     qryBenefAux.Post;
  end;

  // Grava RELBENEFPART - Dados para o Relatório de Demonstrativo de Benefício
  if iIdCalculo > 0
  then begin
     if qryDet.State = dsInsert
     then qryRelBenefPart.Insert
     else qryRelBenefPart.Edit;

     qryRelBenefPart.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
     qryRelBenefPart.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
     qryRelBenefPart.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
     qryRelBenefPart.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     qryRelBenefPart.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
     qryRelBenefPart.FieldByName('IDPESSOA').AsInteger       := iIdTitular;
     qryRelBenefPart.FieldByName('IDCALCULO').AsInteger      := iIdCalculo;
     qryRelBenefPart.FieldByName('SEQPROPOSTA').AsInteger    := iSeqProposta;
     qryRelBenefPart.FieldByName('DATACALCULO').AsDateTime   := dtInicioFund.Date;
     qryRelBenefPart.FieldByName('FLGRECALCULO').AsInteger   := 0;
     qryRelBenefPart.Post;
  end;

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  if qryDet.State in [dsInsert, dsEdit] then
  begin
    if bFlgApresentaBSFAB then
    begin
      qryDet.FieldByName('VLRFABTOTAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
      qryDet.FieldByName('VLRBSTOTAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));
      qryDet.FieldByName('VLRFABATUAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
      qryDet.FieldByName('VLRBSATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));
    end
    else
    begin
      qryDet.FieldByName('VLRFABTOTAL').Value   := null;
      qryDet.FieldByName('VLRBSTOTAL').Value    := null;
      qryDet.FieldByName('VLRFABATUAL').Value   := null;
      qryDet.FieldByName('VLRBSATUAL').Value    := null;
    end;

    if bFlgApresentaDeficit then
       qryDet.FieldByName('VLRBASEDEFICIT').AsFloat := StrToFloat(ClienteNumero(reValorDeficit.text))
    else
       qryDet.FieldByName('VLRBASEDEFICIT').Value   := null;

    if (sTipoFormChamador = 'EV') or
       (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
       (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
    begin
      qryDet.FieldByName('BSDIB').AsFloat  := qryDet.FieldByName('VLRBSATUAL').AsFloat;
      qryDet.FieldByName('FABDIB').AsFloat := qryDet.FieldByName('VLRFABATUAL').AsFloat;
    end
    else
    begin
      qryDet.FieldByName('BSDIB').Value  := null;
      qryDet.FieldByName('FABDIB').Value := null;
    end;
  end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  inherited;

  // Caso esteja inserindo um benefício no processo
  // Verificar se o benefício pertence (e é o principal ) à algum grupo de benefícios
  // Se pertencer
  // Entao inserir os outros benefícios (os não principais) do grupo no processo
  if (OperacaoDetalhe = opInserir) and (qryBeneficio.FieldByName('IdGrupoBenef').AsInteger > 0)
  then begin
     // Abrir query com todos os beneficios do grupo,  menos o principal, que já foi
     // inserido pelo form de cadastro
     qryBenefGrupo.Close;
     qryBenefGrupo.SQL.Clear;
     qryBenefGrupo.SQL.Add(' SELECT BG.IDBENEFICIO, BP.IDREGRACALCULO, BP.IDREGRAPAGAMENTO, BP.IDREGRASRB, '+
                           '        B.NUMORDEMEVENTO, B.NOME, B.FLGRESGATE, BP.IDREGRASIMULA, BP.NUMOPCOES , '+
                           '        B.IDTPPAGTOBENEFIC '+
                    ' FROM   BENEFXGRUPO BG, BENEFPLANPREV BP, BENEFICIO B  '+
                    ' WHERE  (BG.IDGRUPOBENEF = '+IntToStr(qryBeneficio.FieldByName('IdGrupoBenef').AsInteger)+')'+
                    ' AND    (BG.IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+')'+
                    ' AND    (BG.FLGPRINCIPAL = 0) '+
                    ' AND    (BG.IDPLANOPREV  = BP.IDPLANOPREV) '+
                    ' AND    (BG.IDBENEFICIO  = BP.IDBENEFICIO) '+
                    ' AND    (BP.IDBENEFICIO  = B.IDBENEFICIO) ');
     qryBenefGrupo.Open;
     if qryBenefGrupo.IsEmpty
     then begin
        qryBenefGrupo.Close;
        OperacaoDetalhe := opIdle;
        Exit;
     end;
     // Para cada benefício do grupo fazer :
     // 1. Executar a regra de calculo do beneficio
     // 2. Inserir na benefbfciario no beneficio do grupo
     // Guardar o estado da qryDet e cancelar caso o padrão tenha dado outro insert
     // ou edit
     EstadoAnterior := qryDet.State;
     if qryDet.State in [dsInsert, dsEdit]
     then qryDet.Cancel;
     qryBenefGrupo.First;
     while not qryBenefGrupo.Eof do
     begin
        // Localizar beneficio principal na qryBenefAux
        qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);

        if sTipoFormChamador <> 'SI'
        then CalculaBeneficioGrupo( qryBenefGrupo.FieldByName('IdBeneficio').AsInteger,
                               qryBenefGrupo.FieldByName('IdRegraCalculo').AsInteger,
                               qryBenefGrupo.FieldByName('IdRegraPagamento').AsInteger,
                               qryBenefGrupo.FieldByName('IdRegraSRB').AsInteger,
                               qryBenefGrupo.FieldByName('NumOrdemEvento').AsInteger,
                               qryBenefGrupo.FieldByName('Nome').AsString,
                               qryBenefGrupo.FieldByName('FlgResgate').AsInteger,
                               qryBenefGrupo.FieldByName('NumOpcoes').AsInteger,
                               qryBenefGrupo.FieldByName('IDTPPAGTOBENEFIC').AsInteger)
        else CalculaBeneficioGrupo( qryBenefGrupo.FieldByName('IdBeneficio').AsInteger,
                               qryBenefGrupo.FieldByName('IdRegraSimula').AsInteger,
                               qryBenefGrupo.FieldByName('IdRegraPagamento').AsInteger,
                               qryBenefGrupo.FieldByName('IdRegraSRB').AsInteger,
                               qryBenefGrupo.FieldByName('NumOrdemEvento').AsInteger,
                               qryBenefGrupo.FieldByName('Nome').AsString,
                               qryBenefGrupo.FieldByName('FlgResgate').AsInteger,
                               qryBenefGrupo.FieldByName('NumOpcoes').AsInteger,
                               qryBenefGrupo.FieldByName('IDTPPAGTOBENEFIC').AsInteger);

        // Atualizar a reserva part com os valores  movimentados da reserva
        // para que o proximo beneficio já tenha seu valor atualizado
        if (qryBenefGrupo.FieldByName('FlgResgate').AsInteger = 1) and
           (not AtualizaReservaPart(qryBenefGrupo.FieldByName('IdBeneficio').AsInteger))
        then begin
           MsgDlg('Ocorreu um erro na atualização do valor da reserva do participante (benef.ref.). ',
                  'Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;

        qryBenefGrupo.Next;
     end;
     qryBenefGrupo.Close;
     if EstadoAnterior = dsInsert
     then qryDet.Insert;
  end;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if (OperacaoDetalhe = opAlterar) then
  begin
    bbtnConfirmar.enabled := true;
    bbtnCancelar.enabled  := true;
  end;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  bInserindoGrupo := False;
  OperacaoDetalhe := opIdle;
end;

procedure TfrmCadRequerBenefParticip.CalculaBeneficioGrupo( piIdBeneficio,
                                                            piIdRegraCalculo,
                                                            piIdRegraReserva,
                                                            piIdRegraSRB,
                                                            piNumOrdemEvento : longint;
                                                            psNomeBeneficio  : string;
                                                            piFlgResgate,
                                                            piNumOpcoes,
                                                            piIdTpPagtoBenef : longint ) ;
var rValorBeneficio,
    rValorSRB       : double;
    sMsgErro,
    sSQLBenefAssoc  : string;
    bErro           : boolean;
    rValorReserva   : double;
    cAuxSeparador   : char;
    iIdCalculoGrupo : longint;
begin
   bRecalculouProvisorio := True;
   if piIdRegraCalculo < 0 then Exit;
   sSQLBenefAssoc := MontaSQLBenefAssoc(piNumOrdemEvento);

   rValorReserva := CalculaReservaParaBeneficio ( piIdBeneficio, piIdRegraReserva, piFlgResgate);
   sValorReserva := FloatToStr(rValorReserva);

   iIdCalculoGrupo := iIdCalculo;

  // Gravar Opcoes do beneficio principal para os beneficios do grupo
  if (piNumOpcoes > 0 ) and
     ((rOpcaoGrupo1 >= 0) and (rOpcaoGrupo2 >= 0) and (rOpcaoGrupo3 >= 0))
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE BENEFPLANOPART SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcaoGrupo1) + ',' +
                    '                           VALORBASE2 = ' + FormatFloat('#0.00000',rOpcaoGrupo2) + ',' +
                    '                           VALORBASE3 = ' + FormatFloat('#0.00000',rOpcaoGrupo3) +
                    ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   + ' AND ' +
                    '       IDPESSOA    = ' + IntToSTr(iIdTitular)   + ' AND ' +
                    '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
                    '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
                    '       IDBENEFICIO = ' + IntToStr(piIdBeneficio));
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
     end;// except

     if qryAux.RowsAffected <= 0
     then begin
        cAuxSeparador    := DecimalSeparator;
        DecimalSeparator := '.';
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, IDBENEFICIO,VALORBASE1, '+
                       '             VALORBASE2,VALORBASE3) '+
                       ' VALUES ('+ IntToStr(iIdPessJur) + ',' +  IntToStr(iIdPlanoPrev) + ','+
                                    IntToStr(iIdTitular) + ',' +  IntToSTr(iSeqProposta) + ','+
                                    IntToStr(piIdBeneficio)+','+
                                    FormatFloat('#0.00000',rOpcaoGrupo1)+','+
                                    FormatFloat('#0.00000',rOpcaoGrupo2)+','+
                                    FormatFloat('#0.00000',rOpcaoGrupo3)+')');
        DecimalSeparator := cAuxSeparador;
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;//try
     end;
  end;

  // Executar regra de calculo do SRB
  try
     rValorSRB := 0;
     if piIdRegraSRB > 0
     then rValorSRB := ExecutaRegraCalculoSRB(qryAux,
                                              piIdRegraSRB,
                                              iIdPessJur,
                                              iIdPlanoPrev,
                                              iIdTitular,
                                              iSeqProposta,
                                              piIdBeneficio,
                                              iNumeroProcesso,
                                              iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
                                              rOpcaoGrupo1, rOpcaoGrupo2, rOpcaoGrupo3,
                                              sSQLBenefAssoc,
                                              FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                              FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                              FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                              FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),        
                                              FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                              sValorInfINSS,
                                              reValorCalcINSS.Text,
                                              '0',
                                              True,
                                              0,
                                              qryDet.FieldByName('DibBenefAnt').AsString,
                                              qryDet.FieldByName('ValorBenefAnt').AsString,
                                              qryDet.FieldByName('VALORBINSSANT1').AsString,
                                              qryDet.FieldByName('VALORBINSSANT2').AsString,
                                              qryDet.FieldByName('VALORBINSSANT3').AsString,
                                              bErro,
                                              sMsgErro,
                                              iIdCalculoGrupo,
                                              qryDet.FieldByName('FLGPOSSUIACOMPINSS').AsInteger );
  except
     frmAguarde.Apaga;
  end;

  // Executar regra de calculo do beneficio
  try
     rValorBeneficio := 0;
     rValorBeneficio := ExecutaRegraCalculoBeneficio(dtmAPrev.qry,
                                         piIdRegraCalculo,
                                         piIdRegraReserva,
                                         iIdPessJur, iIdPlanoPrev, iIdTitular,
                                         iSeqProposta,
                                         piIdBeneficio,
                                         iNumeroProcesso,
                                         rOpcaoGrupo1, rOpcaoGrupo2, rOpcaoGrupo3,
                                         sSQLBenefAssoc,
                                         FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                         sValorInfINSS,
                                         reValorCalcINSS.Text,
                                         sValorReserva,
                                         True,
                                         0,
                                         qryDet.FieldByName('DibBenefAnt').AsString,
                                         qryDet.FieldByName('ValorBenefAnt').AsString,
                                         qryDet.FieldByName('VALORBINSSANT1').AsString,
                                         qryDet.FieldByName('VALORBINSSANT2').AsString,
                                         qryDet.FieldByName('VALORBINSSANT3').AsString,
                                         bErro,
                                         sMsgErro,
                                         iIdCalculoGrupo,
                                         qryDet.FieldByName('FLGPOSSUIACOMPINSS').AsInteger,
                                         rValorSRB,
                                         sIdSitPartAntes,
                                         sIdSitPlanAntes,
                                         sIdSitFuncAntes,
                                         IntToStr(iIdSitPart),
                                         IntToStr(iIdSitPlanoPrev),
                                         IntToStr(iIdSitFunc),
                                         '',
                                         qryDet.FieldByName('FLGPROVISORIO').AsInteger,   
                                         qryDet.FieldByName('PRAZOPROVISORIO').AsInteger, 
                                         qryDet.FieldByName('PERCPROVISORIO').AsFloat     
                                         );
  except
     frmAguarde.Apaga;
  end;

  bInserindoGrupo := True;

  
  if sTipoFormChamador <> 'SI'
  then begin
     iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                          frmCadRequerBenefParticip.Caption,
                                                          -1,
                                                          -1,
                                                          iIdPlanoPrev,
                                                          -1,
                                                          -1,
                                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                          rValorBeneficio,
                                                          False); // Requerimento = False, Outras = True
     if iIdUsuarioAutoriza < 0
     then begin
        MsgDlg('Requerimento de Benefício não permitido por exceder valor limite e não ter autorização. Verifique. ','Informação',mtInformation,[mbOk],0);
        Abort;
     end;
  end;

   if (not qryBfciarioTitPlan.Locate('IdBeneficio',piIdBeneficio,[loCaseInsensitive]))
   then begin
      qryBfciarioTitPlan.Insert;
      qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger    := iIdTitular;
      qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger   := iIdTitular;
      qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
      qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger   := iIdPessJur;

      qryBfciarioTitPlan.FieldByName('IdPlanoORIGEM').AsInteger := iIdPlanoPrev;

      qryBfciarioTitPlan.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
      qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := piIdBeneficio;
      qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat    := 0;
      qryBfciarioTitPlan.FieldByName('Percentual').AsFloat    := 100;

      
      qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdTitular;

      If qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E' Then
        qryBfciarioTitPlan.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;
      

      qryBfciarioTitPlan.Post;
   end; // if state = insert and not locate

   qryDet.Insert;
   qryDet.FieldByName('NUMEROPROCESSO').AsInteger    := iNumeroProcesso;
   qryDet.FieldByName('IDPESSJUR').AsInteger         := iIdPessJur;

   qryDet.FieldByName('IdPlanoORIGEM').AsInteger     := iIdPlanoPrev;

   qryDet.FieldByName('IDPLANOPREV').AsInteger       := iIdPlanoPrev;
   qryDet.FieldByName('IDTITULAR').AsInteger         := iIdTitular;
   qryDet.FieldByName('IDPESSOA').AsInteger          := iIdTitular;
   qryDet.FieldByName('SEQPROPOSTA').AsInteger       := iSeqProposta;
   qryDet.FieldByName('IDBENEFICIO').AsInteger       := piIdBeneficio;
   if sTipoFormChamador <> 'SI'
   then qryDet.FieldByName('IDSITBENEFICIO').AsInteger    := 4
   else qryDet.FieldByName('IDSITBENEFICIO').AsInteger    := 8;

   qryDet.FieldByName('IDDEPENDENCIA').AsString      := 'PRP';
   qryDet.FieldByName('Nome').AsString               := psNomeBeneficio;
   qryDet.FieldByName('Descricao').AsString          := 'Pendente de Concessão';
   qryDet.FieldByName('VALORATUAL').AsFloat          := rValorBeneficio;

   
   If sTipoFormChamador <> 'CO' Then qryDet.FieldByName('VALORNADIB').AsFloat := rValorBeneficio;

   if qryBenefAux.FieldbyName('FLGPROVISORIO').AsInteger = 0
   then qryDet.FieldByName('ValorTotal').AsFloat     := StrToFloat(FormatFloat('#0.00',rValorBeneficio))
   else qryDet.FieldByName('ValorTotal').AsFloat     := StrToFloat(FormatFloat('#0.00',rValorBeneficio)) * 100 / qryBenefAux.FieldByName('PERCPROVISORIO').AsFloat;

   qryDet.FieldByName('VALORCALCULADO').AsFloat      := rValorBeneficio;
   qryDet.FieldByName('VALORCOTAS').AsFloat          := rValorBeneficio;
   qryDet.FieldByName('VLRCALCINSS').AsFloat         := 0;
   qryDet.FieldByName('VLRINFINSS').AsFloat          := 0;
   qryDet.FieldByName('VALORSRB').AsFloat            := rValorSRB;
   qryDet.FieldByName('PERCPROVISORIO').AsFloat      := qryBenefAux.FieldByName('PercProvisorio').AsFloat;
   qryDet.FieldByName('PRAZOPROVISORIO').AsInteger   := qryBenefAux.FieldByName('PRAZOPROVISORIO').AsInteger;

   if  not qryBenefAux.FieldByName('DATAINICIOFUND').IsNull
   then qryDet.FieldByName('DATAINICIOFUND').AsDateTime   := qryBenefAux.FieldByName('DATAINICIOFUND').AsDateTime;

   if Trim(qryBenefAux.FieldByName('NUMPROCINSS').AsString) <> ''
   then qryDet.FieldByName('NUMPROCINSS').AsString        := qryBenefAux.FieldByName('NUMPROCINSS').AsString;

   // INICIO - Marcelo Cardoso - SOL262811 PPM1125645
   if sTipoFormChamador = 'EV'  then
   begin
      if (sIdEventoGerador = '334') or (sIdEventoGerador = '369') or (sIdEventoGerador = '373') or (sIdEventoGerador = '368') or
          (sIdEventoGerador = '337') or (sIdEventoGerador = '15') or (sIdEventoGerador = '336') or (sIdEventoGerador = '345') THEN
      begin
         qryDet.FieldByName('DATAINICIOINSS').AsString   :=  '';
      end
      else
      begin
         qryDet.FieldByName('DATAINICIOINSS').AsDateTime   := qryBenefAux.FieldByName('DATAINICIOINSS').AsDateTime;
      end;
   end
   else
   begin
      if not qryBenefAux.FieldByName('DATAINICIOINSS').IsNull
      then qryDet.FieldByName('DATAINICIOINSS').AsDateTime   := qryBenefAux.FieldByName('DATAINICIOINSS').AsDateTime;
   end;
   // FIM - Marcelo Cardoso - SOL262811 PPM1125645

   if not qryBenefAux.FieldByName('DATAREQUERIMENTO').IsNull
   then qryDet.FieldByName('DATAREQUERIMENTO').AsDateTime := qryBenefAux.FieldByName('DATAREQUERIMENTO').AsDateTime;

   if not qryBenefAux.FieldByName('DATAINICIO').IsNull
   then qryDet.FieldByName('DATAINICIO').AsDateTime       := qryBenefAux.FieldByName('DATAINICIO').AsDateTime;

   if not qryBenefAux.FieldByName('DATAFINAL').IsNull
   then qryDet.FieldByName('DATAFINAL').AsDateTime        := qryBenefAux.FieldByName('DATAFINAL').AsDateTime;

   if not qryBenefAux.FieldByName('DataFinalPrevista').IsNull
   then qryDet.FieldByName('DataFinalPrevista').AsDateTime := qryBenefAux.FieldByName('DataFinalPrevista').AsDateTime;

   if qryBenefAux.FieldByName('CODPORTFORMA').AsInteger >0
   then qryDet.FieldByName('CODPORTFORMA').AsInteger := qryBenefAux.FieldByName('CODPORTFORMA').AsInteger;

   if piIdTpPagtoBenef  > 0
   then qryDet.FieldByName('IDTPPAGTOBENEFIC').AsInteger := piIdTpPagtoBenef
   else if qryBenefAux.FieldByName('IDTPPAGTOBENEFIC').AsInteger > 0
        then qryDet.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryBenefAux.FieldByName('IDTPPAGTOBENEFIC').AsInteger;

   qryDet.FieldByName('FLGFORMAPAGTO').AsString   := qryBenefAux.FieldByName('FLGFORMAPAGTO').AsString;
   qryDet.FieldByName('FLGPROVISORIO').AsInteger  := qryBenefAux.FieldByName('FLGPROVISORIO').AsInteger;

   if qryBenefAux.FieldByName('IDAGENCIARESGATE').AsInteger > 0
   then qryDet.FieldByName('IDAGENCIARESGATE').AsInteger  := qryBenefAux.FieldByName('IDAGENCIARESGATE').AsInteger;
   
   QryDet.FieldByName('FLGACEITAZERO').AsInteger       := qryBeneficio.FieldbyName('FLGACEITAZERO').AsInteger;

   //Renato Visoni SOL 123227 Kintana 614304

   if qryDet.FieldByName('FONTEPAGADORA').asInteger = 1 then begin
     fSaldoContabil :=0;
     qryDet.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryDet.FieldByName('IdBeneficio').AsInteger,
                                                                              QryDet.FieldByName('IdRegraPagamento').AsInteger,
                                                                           QryDet.FieldByName('FlgResgate').AsInteger );

     //WO16247 - Helen V Bianchi - Inicio
     //qryDet.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
     qryDet.FieldByName('SALDOCONTADIB').asFloat := qryDet.FieldByName('RESERVADIB').asFloat;
     //WO16247 - Helen V Bianchi - Fim
     qryDet.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryDet.FieldByname('IDPESSJUR').asString,QryDet.FieldByname('IDPESSOA').asString,QryDet.FieldByname('IDPLANOPREV').asString);
   end;
   //Renato Visoni SOL 123227 Kintana 614304

   qryDet.Post;

  // Grava RELBENEFPART - Dados para o Relatório de Demonstrativo de Benefício
  if (rValorBeneficio > 0) and (iIdCalculoGrupo > 0)
  then begin
     qryRelBenefPart.Insert;
     qryRelBenefPart.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
     qryRelBenefPart.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
     qryRelBenefPart.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
     qryRelBenefPart.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     qryRelBenefPart.FieldByName('IDBENEFICIO').AsInteger    := piIdBeneficio;
     qryRelBenefPart.FieldByName('IDPESSOA').AsInteger       := iIdTitular;
     qryRelBenefPart.FieldByName('IDCALCULO').AsInteger      := iIdCalculoGrupo;
     qryRelBenefPart.FieldByName('SEQPROPOSTA').AsInteger    := iSeqProposta;
     qryRelBenefPart.FieldByName('DATACALCULO').AsDateTime   := qryBenefAux.FieldByName('DATAINICIOFUND').AsDateTime;
     qryRelBenefPart.FieldByName('FLGRECALCULO').AsInteger   := 0;
     qryRelBenefPart.Post;
  end;


   if rValorBeneficio = 0
   then MsgDlg('O benefício '+psNomeBeneficio+' pertencente ao Grupo de Benefícios foi calculado com valor ZERO.'+#13+
               'Este benefício será exibido no requerimento apenas a título de informação, porém '+
               'não será gravado no Processo de Benefício.','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmCadRequerBenefParticip.bbtnElegibilidadeClick(
  Sender: TObject);
var bErro : boolean;
    sMsgErro : string;
    iFlgPossuiAcomp : integer;
begin

  // Se for simulacao nao executar regra de elegibilidade
  if sTipoFormChamador = 'SI'
  then begin
    bConcedeBeneficio       := True;
    bExecutouRegraConcessao := True;
    Exit;
  end;

  if (qryDet.State in [dsEdit,dsInsert]) and (Trim(dblkpcmbBeneficio.Text) = '')
  then begin
    MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
    dblkpcmbBeneficio.SetFocus;
    Exit;
  end;

  bExecutouRegraConcessao := True;
  
  if dbrgrpPossuiAcompINSS.ItemIndex = 0
  then iFlgPossuiAcomp := 0
  else iFlgPossuiAcomp := 1;

  
  If (Not DbChbPossuiAcomp.Checked) 
  Then iFlgPossuiAcomp := 0
  Else iFlgPossuiAcomp := 1;
  


  if (Trim(qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString) = '') or
     (qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger <= 0)
  then bConcedeBeneficio := True
  else begin
     frmAguarde.Mostra('Regra de Elegibilidade - Nº '+qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString);

     Try
       bConcedeBeneficio := ExecutaRegraElegibilidade(qryAux,
                                        qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger,
                                        iIdPessJur, iIdPlanoPrev, iIdTitular,
                                        iSeqProposta,
                                        qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                        rOpcao1, rOpcao2, rOpcao3,
                                        FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                        FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                        sDataDemissao,
                                        FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                        sFlgInternoAntes,
                                        sFlgInternoDepois,
                                        sIdSitPartAntes,
                                        sIdSitPlanAntes,
                                        sIdSitFuncAntes,
                                        sIdSitPartDepois,
                                        sIdSitPlanDepois,
                                        sIdSitFuncDepois,
                                        1,
                                        0,
                                        bErro,
                                        sMsgErro,
                                        iFlgPossuiAcomp); 
     Except
       frmAguarde.Apaga; 
     End;
     frmAguarde.Apaga;

     if bErro then
     begin
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
       Exit;
     end
     else
     begin
        if not bConcedeBeneficio then
          MsgDlg('A Regra de Elegibilidade nº '+
                 qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
                 ' NÃO foi satisteita. Verifique. ','Informação',mtInformation,[mbOk],0)
        else
          if sTipoFormChamador = 'CO' then
            MsgDlg('A Regra de Elegibilidade nº '+
                   qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
                   ' foi satisteita. ','Informação',mtInformation,[mbOk],0);
     end;
  end;
end;

procedure TfrmCadRequerBenefParticip.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
    sDataInicio, sDataFinal, sMsgErro : string;
    bErro : boolean;
    bExecutaRegras : boolean;      //edilaine - SIG47962
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFPLANOPART ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     //SOL160185
     rCampoTexto1 := '';
     rCampoTexto2 := '';
     rCampoTexto3 := '';
     //SOL160185
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;
     //SOL160185
     If qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
     Then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
     Else rCampoTexto1 := '';

     If qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
     Then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
     Else rCampoTexto2 := '';

     If qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
     Then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
     Else rCampoTexto3 := '';
     //SOL160185
  end;

  bPodeAlterarOpcoes := True;

  iIdCalculoGeral := iIdCalculo; { Passar IDCALCULO para opçoes }

  //edilaine - SIG47962 - inicio
  bExecutaRegras := (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2) and
                    ((qryAux.IsEmpty) or ((not qryAux.IsEmpty) and (rOpcao1+rOpcao2 = 0)));
  //edilaine - SIG47962 - fim

  if not qryAux.IsEmpty
  then begin // Opcoes já cadastradas
     bOpcoesExistem := True;
     frmCadOpcoesBenef := TfrmCadOpcoesBenef.Create(Application);
     frmCadOpcoesBenef.LerOpcoes(sNomeTitular, sNomePlano, sNomePatro,
                                 dblkpcmbBeneficio.Text,
                                 qryBeneficio.FieldByName('NOMEVALORBASE1').AsString,
                                 qryBeneficio.FieldByName('NOMEVALORBASE2').AsString,
                                 qryBeneficio.FieldByName('NOMEVALORBASE3').AsString,
                                 qryBeneficio.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
                                 qryBeneficio.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP3').AsInteger,
                                 //Inicio - SOL160185
                                 qryBeneficio.FieldByName('NOMECAMPOTEXTO1').AsString,
                                 qryBeneficio.FieldByName('NOMECAMPOTEXTO2').AsString,
                                 qryBeneficio.FieldByName('NOMECAMPOTEXTO3').AsString,
                                 qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger,
                                 rCampoTexto1, rCampoTexto2, rCampoTexto3,
                                 qryBeneficio.FieldByName('FLGEDITAOPTEXTO1').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOPTEXTO2').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOPTEXTO3').AsInteger,
                                 //FIM - SOL160185
                                 iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdTitular,
                                 iSeqProposta,
                                 qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                 iNumeroProcesso,
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                 FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                 FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                 reValorInfINSS.Text,
                                 reValorCalcInss.Text,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sFlgInternoAntes,
                                 sFlgInternoDepois,
                                 sIdSitPartAntes,
                                 sIdSitPlanAntes,
                                 sIdSitFuncAntes,
                                 sIdSitPartDepois,
                                 sIdSitPlanDepois,
                                 sIdSitFuncDepois,
                                 reValorSRB.Text,
                                 bExecutaRegras);  //edilaine - SIG47962
     frmCadOpcoesBenef.Free;
  end
  else begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesBenef := TfrmCadOpcoesBenef.Create(Application);
     frmCadOpcoesBenef.LerOpcoes(sNomeTitular, sNomePlano, sNomePatro,
                                 dblkpcmbBeneficio.Text,
                                 qryBeneficio.FieldByName('NOMEVALORBASE1').AsString, qryBeneficio.FieldByName('NOMEVALORBASE2').AsString,
                                 qryBeneficio.FieldByName('NOMEVALORBASE3').AsString,
                                 qryBeneficio.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
                                 qryBeneficio.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP3').AsInteger,
                                 //Inicio - SOL160185
                                 qryBeneficio.FieldByName('NOMECAMPOTEXTO1').AsString,
                                 qryBeneficio.FieldByName('NOMECAMPOTEXTO2').AsString,
                                 qryBeneficio.FieldByName('NOMECAMPOTEXTO3').AsString,
                                 qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger,
                                 rCampoTexto1, rCampoTexto2, rCampoTexto3,
                                 qryBeneficio.FieldByName('FLGEDITAOPTEXTO1').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOPTEXTO2').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOPTEXTO3').AsInteger,
                                 //FIM - SOL160185
                                 iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdTitular,
                                 iSeqProposta,
                                 qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                 iNumeroProcesso,
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                 FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                 FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                 reValorInfINSS.Text,
                                 reValorCalcINSS.Text,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sFlgInternoAntes,
                                 sFlgInternoDepois,
                                 sIdSitPartAntes,
                                 sIdSitPlanAntes,
                                 sIdSitFuncAntes,
                                 sIdSitPartDepois,
                                 sIdSitPlanDepois,
                                 sIdSitFuncDepois,
                                 '0', bExecutaRegras);  //edilaine - SIG47962

     frmCadOpcoesBenef.Free;
  end;

  iIdCalculo := iIdCalculoGeral; { Receber IDCALCULO das opçoes }

  // Gravar Opcoes do participante na BenefPlanoPart
  if (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) and
     (not bOpcoesExistem)
  then begin // Opcoes ainda nao existiam
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, IDBENEFICIO,VALORBASE1, '+
                    '             VALORBASE2,VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3) ' +
                    ' VALUES ('+ IntToStr(iIdPessJur) + ',' +  IntToStr(iIdPlanoPrev) + ','+
                                 IntToStr(iIdTitular) + ',' +  IntToSTr(iSeqProposta) + ','+
                                 qryBeneficio.FieldByName('IDBENEFICIO').AsString+','+
                                 FormatFloat('#0.00000',rOpcao1)+','+
                                 FormatFloat('#0.00000',rOpcao2)+','+
                                 FormatFloat('#0.00000', rOpcao3) + ',' +
                                 QuotedStr(rCampoTexto1)          + ','+
                                 QuotedStr(rCampoTexto2)          + ','+
                                 QuotedStr(rCampoTexto3)          + ')');
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;//try
  end
  else begin // atualizar opcoes
     if (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) and
       (bOpcoesExistem)
     then begin
       qryAux.Close;
       qryAux.SQL.Clear;
       cAuxSeparador    := DecimalSeparator;
       DecimalSeparator := '.';
       qryAux.SQL.Add(' UPDATE BENEFPLANOPART SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1)  + ',' +
                      '                           VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2)  + ',' +
                      '                           VALORBASE3 = ' + FormatFloat('#0.00000', rOpcao3) + ',' +
                      '                           CAMPOTEXTO1 = ' +  QuotedStr(rCampoTexto1)        + ',' +
                      '                           CAMPOTEXTO2 = ' +  QuotedStr(rCampoTexto2)        + ',' +
                      '                           CAMPOTEXTO3 = ' +  QuotedStr(rCampoTexto3)        +
                      ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   + ' AND ' +
                      '       IDPESSOA    = ' + IntToSTr(iIdTitular)   + ' AND ' +
                      '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
                      '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
                      '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
       DecimalSeparator := cAuxSeparador;
       try
          qryAux.ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;// except
     end; // if
  end;

  // Thiago Melo SOL 215522 Kintana 2046098
  if (((rOpcao1 >= 0) and
       (rOpcao2 >= 0) and
       (rOpcao3 >= 0)) or
      ((rCampoTexto1 <> '') or
       (rCampoTexto2 <> '') or
       (rCampoTexto3 <>''))) then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    cAuxSeparador    := DecimalSeparator;
    DecimalSeparator := '.';
    qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1)  + ',' +
                   '                          VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2)  + ',' +
                   '                          VALORBASE3 = ' + FormatFloat('#0.00000', rOpcao3) + ',' +
                   '                          CAMPOTEXTO1 = ' +  QuotedStr(rCampoTexto1)        + ',' +
                   '                          CAMPOTEXTO2 = ' +  QuotedStr(rCampoTexto2)        + ',' +
                   '                          CAMPOTEXTO3 = ' +  QuotedStr(rCampoTexto3)        +
                   ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   + ' AND ' +
                   '       IDPESSOA    = ' + IntToSTr(iIdTitular)   + ' AND ' +
                   '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
                   '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
                   '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
    DecimalSeparator := cAuxSeparador;
    try
       qryAux.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;
  end;
  // Thiago Melo SOL 215522 Kintana 2046098

  // Executar regra de calculo de data de inicio e data final
  if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraInicio').AsInteger > 0) then
  begin
     frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);

     Try
       sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                                    iIdPessJur,
                                                    iIdPlanoPrev,
                                                    iIdTitular,
                                                    iSeqProposta,
                                                    iIdTitular,
                                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                    rOpcao1,
                                                    rOpcao2,
                                                    rOpcao3,
                                                    FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                                    FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                                    FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),        
                                                    FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),         
                                                    FormatDateTime('dd/mm/yyyy', Date),
                                                    FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
                                                    sFlgTpDemissao,
                                                    bErro,
                                                    sMsgErro
                                                   );
     Except
      frmAguarde.Apaga; 
     End;
     frmAguarde.Apaga;

     if bErro then
     begin
        MsgDlg(sMsgErro, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        dtDataInicio.Clear;
        dtInicioFund.Clear;
     end
     else begin
        dtDataInicio.Date := StrToDate(sDataInicio);  
        if Trim(dtInicioFund.Text) = '' then dtInicioFund.Date := StrToDate(sDataInicio); 
     end;
  end; //if regrainicio <> ''

  if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <>  '') and
     (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0) then
  begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);

     Try
       sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                                   iIdPessJur,
                                                   iIdPlanoPrev,
                                                   iIdTitular,
                                                   iSeqProposta,
                                                   iIdTitular,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   rOpcao1,
                                                   rOpcao2,
                                                   rOpcao3,
                                                   FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),       
                                                   FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),       
                                                   FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),       
                                                   FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),        
                                                   FormatDateTime('dd/mm/yyyy', Date),                    
                                                   FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), 
                                                   sFlgTpDemissao,
                                                   bErro,
                                                   sMsgErro
                                                  );
     Except
       frmAguarde.Apaga; 
     End;
     frmAguarde.Apaga;

     if bErro then
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
     else
     begin
       if dbrgrpDataPrevista.ItemIndex = 1 then
         qryDet.FieldByName('DATAFINAL').AsString         := sDataFinal
       else
         qryDet.FieldByName('DataFinalPrevista').AsString  := sDataFinal;

       if Trim(sDataFinal) <> '' then
         dtDataFinal.Date := StrToDate(sDataFinal); 
     end;
  end; // if regrafim <> ''

  rOpcaoGrupo1 := rOpcao1;
  rOpcaoGrupo2 := rOpcao2;
  rOpcaoGrupo3 := rOpcao3;

end;

procedure TfrmCadRequerBenefParticip.reValorCalcInssExit(Sender: TObject);
begin
  inherited;
  if (Trim(reValorInfINSS.Text) = '') or (StrToFloat(ClienteNumero(reValorInfINSS.Text)) <= 0)
  then reValorInfINSS.Text := reValorCalcINSS.Text;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     reValorSRB.Text                           := '0';
     reValorBeneficio.Text                     := reValorInfINSS.Text;
     qryDet.FieldByName('VALORATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorInfINSS.Text));
     qryDet.FieldByName('VLRCALCINSS').AsFloat := StrToFloat(ClienteNumero(reValorInfINSS.Text));
  end;
end;

procedure TfrmCadRequerBenefParticip.reValorInfINSSExit(Sender: TObject);
var sSQL,
    sAnoMesInicioINSS,
    sAnoMesInicioFundacao,
    sAnoMesAtual,
    sValorRegra,
    sValorAtual,
    sMsgErro : string;
    bErro : boolean;
    rValorRegra : double;
begin
  inherited;
  if Trim(reValorInfINSS.Text) <> Trim(reValorCalcINSS.Text)
  then reValorInfINSS.Color := clRed
  else reValorInfINSS.Color := clWindow;

  { Atualizar campo valor do beneficio }
  if (Trim(reValorInfINSS.Text) = '') or (StrToFloat(ClienteNumero(reValorInfINSS.Text)) <= 0)
  then reValorInfINSS.Text := reValorCalcINSS.Text;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     reValorSRB.Text                           := '0';
     reValorBeneficio.Text                     := reValorInfINSS.Text;
     qryDet.FieldByName('VALORATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorInfINSS.Text));
  end;
  




end;

procedure TfrmCadRequerBenefParticip.sbtnConcedeUmClick(Sender: TObject);
var
   iIdSitBenef,
   iIdSitTemp : integer;
   bSituacoesDiferentes : boolean;
begin
  // Se estiver em insercao ou edicao, nao permitir concessao
  if qryDet.State in [dsEdit, dsInsert]
  then begin
     MsgDlg(' Este benefício não pode ser concedido antes de ser confirmado. '+
            ' Confirme a operação antes de concedê-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Verificar se o motivo default na tabela de parametros está preenchido
  if prmIDMOTIVOFOLHABEN <= 0
  then begin
     MsgDlg('O parâmetro motivo da folha de benefício não está preenchido. '+
            'Utilize a tela de parâmetros para cadastrá-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Dependendo da situacao do beneficio, nao faz sentido concede-lo novamente
  if (qryDet.FieldByName('IdSitBeneficio').AsInteger in [1,3,5])
  then begin
     MsgDlg(' Este benefício não pode ser concedido. Verifique sua situação.  ',
            'Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
  if Trim(qryDet.FieldByName('DataInicio').AsString) = ''
  then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
  end;

  if Trim(qryDet.FieldByName('DATAINICIOFUND').AsString) = ''
  then begin
    MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
  end;
  //BRUNO AZEVEDO SOL 156428 KINTANA 1235970

  if not qryBeneficio.Active

  then AbreQryBeneficio(False,qry.FieldByName('IdEventoGerador').AsInteger, qryDet.FieldByName('IdPlanoORIGEM').AsInteger);


  // Chamar tela de Modo de Concessao
  with frmPedeBenefExigencia do
  begin
     // Modos de Concessao = N - concedido Normal
     //                      E - concedido em Exigencia
     //                      P - manter Pendente
     //                      C - nao conceder (Cancelar requerimento)
     ShowModal;
     case cModoConcessao of
       'N' : iIdSitBenef := 1;
       'C' : begin // Cancelar
                if MsgDlg('Deseja realmente "NÃO CONCEDER" este benefício ? '+
                          ' Esta operação irá cancelar o requerimento do mesmo.','Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrYes
                then iIdSitBenef := 6  // nao concedido
                else iIdSitBenef := 4; // pendente de concessao
             end;
       'E' : iIdSitBenef := 7; // em exigencia
       'P' : iIdSitBenef := 4; // pendende de concessao
     else iIdSitBenef := 1;
     end; //case
  end;//with


  if not ConcedeUmBeneficio(Sender, iIdSitBenef)
  then begin
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Se o processo só possuir um beneficio, atualizar situacao do processo
  // Caso contrario verificar se todos os beneficios do processo estao com a mesma
  // situacao
  if qryDet.RecordCount = 1
  then begin
     qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitBenef;
     qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitBenef];
  end
  else begin // processo possui + de 1 beneficio
     // Verificar se existem beneficios com situacoes diferentes
     iIdSitTemp := iIdSitBenef;
     bSituacoesDiferentes := False;
     qryDet.DisableControls;
     qryDet.First;
     while not qryDet.Eof do
     begin
        if (qryDet.FieldByName('IdSitBeneficio').AsInteger <> iIdSitTemp) and
           (not BeneficioDePagamentoUnico ( qryDet.FieldByName('IdBeneficio').AsInteger ) )
        then bSituacoesDiferentes := True;
        qryDet.Next;
     end;//while
     qryDet.EnableControls;

     if bSituacoesDiferentes
     then begin // existe + de 1 beneficio no processo e estao com situacoes diferentes
        MsgDlg('O Processo Nº '+IntToStr(iNumeroProcesso)+' possui benefícios com situações diferentes.' +
                  'Caso estas situações não sejam regularizadas o processo não terá sua situação alterada.',
                  'Informação', mtInformation, [mbOk], 0);
     end
     else begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
        qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
        qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitTemp];
     end;
  end; 

  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;

  sbtnConcedeUm.Down := False;
  MsgDlg('Benefício concedido com sucesso.', 'Informação',mtInformation,[mbOk, mbHelp],0);     
  TiraSQL(qryAux);
end;


procedure TfrmCadRequerBenefParticip.dsStateChange(Sender: TObject);
begin
  inherited;
  if sTipoFormChamador = 'CO'
  then sbtnConcedeUm.Enabled    := (ds.DataSet.State = dsEdit);
end;

procedure TfrmCadRequerBenefParticip.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if sTipoFormChamador = 'CO'
  then sbtnConcedeUm.Enabled := (not (dsdet.DataSet.State in [dsInsert,dsEdit]))  and
                                (ds.DataSet.State = dsEdit);
end;

procedure TfrmCadRequerBenefParticip.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (not qryDet.Active) or (not qryEvento.Active) then Exit;

  if not qryBeneficio.Active
  then AbreQryBeneficio(True, qryEvento.FieldByName('IdEventoGerador').AsInteger, iIdPlanoPrev);

  lblNomeBenef.Caption := qryDet.FieldByName('Nome').AsString;

  rOpcao1 := qryDet.FieldByName('VALORBASE1').AsFloat;
  rOpcao2 := qryDet.FieldByName('VALORBASE2').AsFloat;
  rOpcao3 := qryDet.FieldByName('VALORBASE3').AsFloat;

  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  rCampoTexto1 := qryDet.FieldByName('CAMPOTEXTO1').AsString;
  rCampoTexto2 := qryDet.FieldByName('CAMPOTEXTO2').AsString;
  rCampoTexto3 := qryDet.FieldByName('CAMPOTEXTO3').AsString;
  // edilaine - SOL 253577-17464 / PPM 955703 - fim

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then reValorBeneficio.Text := qryDet.FieldByName('ValorCotas').AsString
  else reValorBeneficio.Text := qryDet.FieldByName('ValorAtual').AsString;

  rValorCotas := qryDet.FieldByName('ValorCotas').AsFloat;
  rValorReal  := qryDet.FieldByName('ValorAtual').AsFloat;

  reValorCalcInss.Text  := qryDet.FieldByName('VlrCalcINSS').AsString;
  reValorInfInss.Text   := qryDet.FieldByName('VlrINFINSS').AsString;
  reValorSRB.Text       := qryDet.FieldByName('VALORSRB').AsString;

  dbedPercContrib.Value := qryDet.FieldByName('PERCRETENCAO').asFloat; // Renato Visoni SOL 153767 Kintana 1162587

  if qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
  end;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';


     
     pnlNaoBenefProv.visible := False; 
     grpInfSupl.Visible := True;
  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';

     
     
     pnlNaoBenefProv.visible := True; 
     grpInfSupl.Visible := True;
  end;

end;

procedure TfrmCadRequerBenefParticip.sbtnApagarClick(Sender: TObject);
begin

   if (qryDet.RecordCount > 0) then  //edilaine - SOL 253577-17464 / PPM 955703
   begin
      MessageDlg('Para exclusão do processo é necessario primeiramente excluir os benefício(s) requerido(s).', mtInformation, [mbOK], 0);
      sbtnApagar.Down := False;     // edilaine - SOL 253577-18129 / PPM 1303078
      Exit;
   end; //edilaine - SOL 253577-17464 / PPM 955703

   if MsgDlg(' Esta operação não irá desfazer o evento '+qryEvento.FieldByName('Nome').AsString+'.'+
             ' Para desfazer o evento, utilize a função "Cancelar Evento Registrado". '+
             ' Deseja continuar exclusão do processo ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
   then begin
      sbtnApagar.Down := False;
      Exit;
   end;

   if (qry.FieldByName('IdSitProcesso').AsInteger <> 4) and // pendente
      (qry.FieldByName('IdSitProcesso').AsInteger <> 6) and // nao concedido
      (qry.FieldByName('IdSitProcesso').AsInteger <> 8) and // simulacao      
      (qry.FieldByName('IdSitProcesso').AsInteger <> 7)     // concedido em exigencia
   then begin
     MsgDlg(' Este processo não pode ser excluído. ','Informação',mtInformation,[mbOk],0);
     sbtnApagar.Down := False;
     Exit;
   end;

   // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
   if (sTipoFormChamador = 'MA') then
   begin
     if not DesfazRequerimentos(qryAux, qry.FieldByName('NumeroProcesso').AsString ) then
     begin
       MsgDlg('Erro ao desfazer requerimento. ','Informação',mtInformation,[mbOk],0);
       sbtnApagar.Down := False;
       Exit;
     end;
   end;
   // edilaine - SOL 253577-18129 / PPM 1303078 - fim

   qryAux.close; // SOL 221078 Kintana 2053573
   qryAux.SQL.Clear;
   qryAux.SQL.Add(qryDet.sql.Text);
   qryAux.ParamByName('NumeroProcesso').AsInteger := qry.FieldByName('NumeroProcesso').AsInteger;
   qryAux.Open; // SOL 221078 Kintana 2053573

   //edilaine - SOL 253577-17464 / PPM 955703 comentado o delete da BfciarioTitPlan
   //qryDet.DisableControls;
   //qryDet.First;
   //While not qryDet.Eof Do
   //Begin
     //DeletaBfciarioTitPlan(qryDet.FieldByName('IDBENEFICIO').AsInteger,
     //                      qryDet.FieldByName('IDTITULAR').AsInteger);

   
   {qryDet.DisableControls;
   //qryDet.First;
   //While not qryDet.Eof Do
   //Begin
   //  DeletaBfciarioTitPlan(qryDet.FieldByName('IDBENEFICIO').AsInteger,
   //                        qryDet.FieldByName('IDTITULAR').AsInteger);
   //
   // qryDet.Next;                           
   //End;}

   //qryDet.EnableControls;}
   

   // Se estiver deletando um processo ainda Pendente, ou concedido em exigencia
   // o sistema tem que devolver a reserva
   if (qry.FieldByName('IdSitProcesso').AsInteger = 4) or // pendente
      (qry.FieldByName('IdSitProcesso').AsInteger = 7)     // concedido em exigencia
   then begin
      frmAguarde.Mostra('Verificando saldo de reservas ... ');

      qryDet.DisableControls;
      qryDet.First;
      while not qryDet.Eof do
      begin
         if qryDet.FieldByName('FlgResgate').AsString = '1'
         then begin
            if not DevolveReserva(qryDet.FieldByName('IdBeneficio').AsInteger, True)
            then begin
               MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
                      'Para sua garantia o processo não será excluído até que o problema seja solucionado. '+
                      'Verifique. ','Informação',mtInformation,[mbOk],0);
               TiraSQL(qryAux);
               frmAguarde.Apaga;
               Exit;
            end;
         end;
         qryDet.Next;
      end; //while
      frmAguarde.Apaga;
      qryDet.EnableControls;
   end;

   inherited;


   {qryAux.First; // SOL 221078 Kintana 2053573
   While not qryAux.Eof Do
   Begin
     DeletaBfciarioTitPlan(qryAux.FieldByName('IDBENEFICIO').AsInteger,
                           qryAux.FieldByName('IDTITULAR').AsInteger);

     qryAux.Next;
   End;} // SOL 221078 Kintana 2053573

   bApagaProcesso := true; //edilaine - SOL 253577-17464 / PPM 955703

end;

procedure TfrmCadRequerBenefParticip.sbtnAlterarClick(Sender: TObject);
begin
   bApagaProcesso := false; //edilaine - SOL 253577-17464 / PPM 955703 
   if (qry.FieldByName('IdSitProcesso').AsInteger <> 4) and
      (qry.FieldByName('IdSitProcesso').AsInteger <> 8) and
      (sTipoFormChamador <> 'MA') and
      (TToolbarButton97(Sender).Name <> 'sbtnConceder') 
   then begin
     MsgDlg(' Este processo não pode ser alterado. ','Informação',mtInformation,[mbOk],0);
     bbtnCancelarClick(frmCadRequerBenefParticip);
     Exit;
   end;

  dbrgrpResgateParcelado.visible :=  (iIdEvento = 15); // SOL 63067 - KTN 524520
  dbedQtdeParcelas.visible       :=  (iIdEvento = 15); // SOL 63067 - KTN 524520
  lblQdeParcelas.visible         :=  (iIdEvento = 15); // SOL 63067 - KTN 524520

  inherited;


end;



procedure TfrmCadRequerBenefParticip.dtInicioFundExit(Sender: TObject);
begin
  inherited;
  if (Trim(dtDataInicio.Text) = '') and (Trim(dtInicioFund.Text) <> '') then
  begin
     qryDet.FieldByName('DataInicio').AsDateTime  := dtInicioFund.Date;  
     dtDataInicio.Date                            := dtInicioFund.Date;
  end;
end;



procedure TfrmCadRequerBenefParticip.dtDataInicioExit(Sender: TObject);
begin
  inherited;
  if Trim(dtInicioFund.Text) = '' then dtInicioFund.Date := dtDataInicio.Date;

  //  Andre Imakawa - SIG 58900 - Inicio
  if (qryDet.State in [DsInsert, DsEdit]) and not(qryBeneficio.IsEmpty) then
  begin
    If (dtDataInicio.Text <> '') and (dtDataFinal.Enabled) and
      (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = 2) and (dtDataFinal.Text = '') Then
    Begin
      qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DataInicio').AsString;
      dtDataFinal.Text                         := dtDataInicio.Text;
end;
  end;
  //  Andre Imakawa - SIG 58900 - Fim
end;



procedure TfrmCadRequerBenefParticip.bbtnConfirmarClick(Sender: TObject);
var bOK : boolean;
    sAnoMesIniSalario,
    sAnoMesFimSalario,
    sMsgErro,
    sDataFinal,
    sMesAtraso, sMesPosterior : string;
    iTipoDevolucao : integer;

    sFlgIntEvento : string;
    sAnoMesFinal  : string;
    sSQL          : string;
    bTodosEncerrados : boolean;

    bBenefVitalic : Boolean;
    dValorPago    : Double;
    sDataLancamento: String; //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
    dCorrecaoMonetaria : Currency;  // SOL 132938
    sAnoMesAtual, sAnoMesFim : String;         // SOL 132938
    iNumRecebimento,  iIdContribuicao : INTEGER; // SOL 132938
    bAlteradorBua : boolean;  // SOL 132938
    varfields       : variant;
    sDtUltimaBaixa  : string;      // edilaine - SOL 253577-17744 / PPM 1063636
    bPossuiIDTPPAGTOBENEFIC: boolean; // Andre Imakawa - SIG 50047
begin

  iFlgEmprestimo := -1;
  bAlteradorBua := false; // SOL 132938
  sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);

  bOK := True;
  // Fazer verificacoes
  if qryDet.State in [dsInsert,dsEdit]
  then begin
     MsgDlg('O Processo não pode ser confirmado. '+
            'Confirme o benefício em aberto. ','Erro',mtError,[mbOk],0);
     Abort;
  end;

  // Verificar campos obrigatorios
  if qryDet.IsEmpty
  then begin
     if not(bApagaProcesso)  then //edilaine - SOL 253577-17464 / PPM 955703
     begin
       // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
       if (sTipoFormChamador = 'MA') then
       begin
         if not DesfazRequerimentos(qryAux, qry.FieldByName('NumeroProcesso').AsString ) then
         begin
           MsgDlg('Erro ao desfazer requerimento. ','Informação',mtInformation,[mbOk],0);
           sbtnApagar.Down := False;
           Exit;
         end
         else
         begin
           if dtmBaseDados.dbBaseDados.InTransaction   then
              dtmBaseDados.dbBaseDados.Commit;
           SelecionaProcesso(-1);
           ConfiguraAcessosTela(ctDesfazRequerimento);
           exit;
         end;
       end
       else   // edilaine - SOL 253577-18129 / PPM 1303078 - fim
       begin
         MsgDlg('O Processo deve conter ao menos um benefício.','Erro',mtError,[mbOk],0);
         bApagaProcesso := false;
         Abort;
       end;
     end
     else
     begin
        inherited;
        DeleteProcessoBenef(IntToStr(iNumeroProcesso)); //edilaine - SOL 253577-17464 / PPM 955703
        DeletaBfciarioTitPlan(iNumeroProcesso);
        if dtmBaseDados.dbBaseDados.InTransaction   then
           dtmBaseDados.dbBaseDados.Commit;
        exit;
     end;
  end;

  // Percorrer a qrydet para verificar se existe algum beneficio com valor 0
  // o que pode acontecer quando for um beneficio pertencente a Grupo de Benef.
  // Caso haja, apagar o beneficio
  bBenefVitalic := false;

  qryDet.First;
  while not qryDet.Eof do
  begin


     // Tratar beneficios temporários  - Exemplos: Aux.Doenca
     // Data final deve ser passada para os calculos das contribuicoes.
     If qryDet.FieldByName('FLGBENEFTEMP').AsInteger = 1
      Then  bBenefVitalic := False
      Else Begin

        //caso haja, preparar contrib até data do lote
        qryaux.close;
        qryaux.sql.text := ' SELECT UPPER(FLGFREQUENCIA) FLAG FROM TPPAGTOBENEFICIO '+
                           ' WHERE IDTPPAGTOBENEFIC = '''+qrydet.fieldbyname('IDTPPAGTOBENEFIC').AsString+''' ';
        qryaux.open;

        if qryaux.fieldbyname('FLAG').AsString = 'I' then   bBenefVitalic := True;

      End;


     if (qryDet.FieldByName('ValorAtual').AsFloat <= 0) and
        (qryDet.FieldByName('FLGACEITAZERO').AsInteger = 0)
     then begin
        qryMovReservaTemp.First;
        while not qryMovReservaTemp.Eof do
        begin
           if qryMovReservaTemp.FieldByName('IDBENEFICIO').AsString =
              qryDet.FieldByName('IDBENEFICIO').AsString
           then qryMovReservaTemp.Delete
           else qryMovReservaTemp.Next;
        end;
        qryDet.Delete;
     end
     else qryDet.Next;
  end;

  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  if (qry.State = dsEdit) and (bConcedeuBeneficio)
  then begin
     qryDet.First;
     while not qryDet.Eof do
     begin
        if (qryDet.FieldByName('RESGATEPARCELADO').AsInteger = 1) then
        begin
           frmAguarde.Mostra('Efetuando resgate parcelado... ');
           if not(ProcessarResgateParcelado) then
           Begin
              frmAguarde.Apaga;
              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.RollBack;
              sbtnConceder.Down := False;
              TiraSQL(qryAux);
              Exit;
           end;
           //qryDet.edit;
           //qryDet.FieldByName('ValorTotal').AsFloat     := qryDet.FieldByName('ValorTotal').AsFloat / qryDet.FieldByName('QTDEPARCELAS').AsInteger;
           //qryDet.post;
        end;
        qryDet.Next;
     end;
  end;
      //MARCELO ALMEIDA - SOL 63067 - KTN 524520

  // Verificar consistencia de no de dependentes para IRRF e SalarioFamilia
  if not VerificaNumeroDependentes then Exit;

  // Verificar se existe  algum benefício obrigatorio no evento que não foi
  // requerido
  if not VerificaBeneficioObrigatorio then Exit;

  // Verificar se existem beneficios com o mesmo numero de ordem no mesmo
  // requerimento
  if not VerificaBeneficioRepetido then Exit;



  // Se nao for um evento EXCLUSIVO INSS ( AI e BI ) entao Executar rotina de calculo de RESERVA MATEMÁTICA
  if (qryEvento.FieldbyName('FlgInterno').AsString <> 'AI') and
     (qryEvento.FieldbyName('FlgInterno').AsString <> 'BI') and
     (sTipoFormChamador                            = 'EV')
  then begin
     if not CalculaReservaMatematica ( qryResMatematica,
                                       qryDet,
                                       qryAux,
                                       qryDet.FieldByName('IDPESSJUR').AsInteger,
                                       qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                       qryDet.FieldByName('IDTITULAR').AsInteger,
                                       qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                       iIdEvento,
                                       qryReservaPart.FieldByName('ValorReserva').AsFloat,
                                       sMsgErro)
     then begin
        bOK := False;
        MsgDlg('Ocorreu um erro na execução do Calculo de Reserva Matemática['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  // Se está em edicao, e concedeu o beneficio, preparar contribuicoes
  if (qry.State = dsEdit) and (bConcedeuBeneficio)
  then begin

     //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
     sDataLancamento := sDataPagamentoLote;
     // Colocar como data da cota, a data do calendario do ano/mes do lote
     sDataPagamentoLote := CriticaDataCobrancaSit( qryAux,
                                          IntToStr(iIdFundacao),
                                          IntToStr(iIdPlanoPrev),
                                          'AS', 'P',
                                          Copy(sAnoMesPagamento,6,2),
                                          Copy(sAnoMesPagamento,1,4));

     if Trim(sDataPagamentoLote) = ''
     then sDataPagamentoLote := '01/'+Copy(sAnoMesPagamento,6,2)+'/'+Copy(sAnoMesPagamento,1,4);

     if  (qryEvento.FieldbyName('FlgInterno').AsString <> 'AI') and
         (qryEvento.FieldbyName('FlgInterno').AsString <> 'BI')
     then begin


        if not dtmBaseDados.dbBaseDados.InTransaction
        then dtmBaseDados.dbBaseDados.StartTransaction;

        // Executar PADRAO DE MOVIMENTACAO DE RESERVAS

        If qryDet.FieldByName('FLGMOVRESAPOSCONC').AsInteger = 1
        Then Begin
          qryDet.Edit;
          qryDet.FieldByName('FLGMOVEURESERVA').AsInteger := 0;
          qryDet.Post;
        End Else

        //edilaine - SIG55933 - inicio
        {verifica se existe perfil parametrizado}
        if (sistema.IdModulo = 454) then  {só para Beneficioprev}
        begin
          PerfilAnterior := BuscaPerfilInvestimento(qryDet.FieldByName('IDPESSJUR').AsInteger,
                                                    qryDet.FieldByName('IDTITULAR').AsInteger,
                                                    qryDet.FieldByName('IDPLANOPREV').AsInteger,
                                                    qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                                    -1,
                                                    -1,
                                                    sDataPagamentoLote,
                                                    qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2,
                                                    true,
                                                    bPerfilAtivo,
                                                    QryDet.FieldByName('IDPLANPREVCONTAB').AsInteger        // edilaine - SIG77401
                                                    );
                                                    
          if PerfilAnterior.iIdPerfilInvest = -1 then
             PerfilAnterior := PerfilAtual;

          //edilaine - SIG84752 - inicio
          if FazQuery( QryAux, 'SELECT * FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(iIdLoteConcessao)+ ' AND NVL(FLGRESGATE,0) = 0') Then
             sDataAlimentacao := DateToStr(date);           //edilaine - SIG81801
          //edilaine - SIG84752 - fim

        end
        else
        begin
          PerfilAnterior.iIdPerfilInvest   := -1;
          PerfilAnterior.iIdPlanPrevContab := -1;
        end;
        //edilaine - SIG55933 - fim


        if not RODAPADRAOMOVRESERVA( qryDet.FieldByName('IDPESSJUR').AsInteger,
                                     qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                     qryDet.FieldByName('IDTITULAR').AsInteger,
                                     qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                     -1,
                                     qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                                     -1,
                                     qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                     qryEvento.FieldbyName('FlgInterno').AsString,
                                     sDataPagamentoLote,
                                     sMsgErro,
                                     qryDet.FieldbyName('NUMEROPROCESSO').AsInteger,
                                     'C',
                                     FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
                                     False,
                                     //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
                                     sDataLancamento,
                                     
                                     FormatDateTime('dd/mm/yyyy', strTodate(sDataAlimentacao)),//Renato Visoni SOL 124583 Kintana 633547 //FormatDateTime('dd/mm/yyyy', dtDataFinal.Date) // 101075
                                     PerfilAnterior.iIdPlanPrevContab,                         //edilaine - SIG55933
                                     PerfilAtual.iIdPlanPrevContab,                            //edilaine - SIG55933
                                     False //SIG84530
                                    ) then
        begin
           bOK := False;
           MsgDlg('Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end

        Else Begin
           qryDet.Edit;
           qryDet.FieldByName('FLGMOVEURESERVA').AsInteger := 1;
           qryDet.Post;
        End;


        // Baixar contribuicoes antes de exibir
        bDevolveContrib       := False;
        bCobraContribAtrasada := False;
        frmAguarde.Mostra('Atualizando contribuições ...');

        qryContribuicao.Close;
        qryContribuicao.ParamByName('IdPessoa').AsInteger    := qryDet.FieldByName('IdTitular').AsInteger;
        qryContribuicao.ParamByName('IdPessJur').AsInteger   := qryDet.FieldByName('IdPessJur').AsInteger;

        qryContribuicao.ParamByName('IdPlanoPrev').AsInteger := qryDet.FieldByName('IdPlanoORIGEM').AsInteger;
        qryContribuicao.Open;
        qryContribuicao.DisableControls;

        qryContribuicao.First;
        dValorPago := 0;
        while not qryContribuicao.Eof do
        begin
             bOk := BaixaContribCAR( qryAux,
                                     qryContribuicao.FieldByName('MESCOBRANCA').AsString,
                                     qryContribuicao.FieldByName('MESREFERENCIA').AsString,
                                     qryContribuicao.FieldByName('NUMRECEBIMENTO').AsInteger,
                                     qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger,
                                     qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsInteger,
                                     qryContribuicao.FieldByName('IDMOTIVO').AsInteger,
                                     qryContribuicao.FieldByName('VALORESPERADO').AsFloat,
                                     sMsgErro,
                                     sDtUltimaBaixa       // edilaine - SOL 253577-17744 / PPM 1063636
                                     );
             if not bOK
             then begin
                MsgDlg('O participante possui contribuições baixadas no Contas a Receber e não recebidas no AdmPrev. '+#13+
                       'Porém, ocorreu o seguinte erro no recebimento dessas contribuições : '+#13+
                       sMsgErro,'Erro',mtError,[mbOK],0);
                TiraSQL(qryAux);

                frmAguarde.Apaga;
                Exit;
             end;
             qryContribuicao.Next;
        end;

        frmAguarde.Mostra('Verificando contribuições posteriores ...');
        if VerificaContribPosterior(sMesPosterior)
        then begin
           frmAguarde.Apaga;
           if (sistema.IdModulo <> 454) then begin
               if MsgDlg('Este participante possui contribuições posteriores à data de início do benefício. '+
                         '[Contribuições até '+sMesPosterior+']. '+
                         'Deseja devolver estas contribuições na folha de benefícios ? ' ,
                         'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
               then begin
                  bDevolveContrib := False;
                  if MsgDlg('Deseja continuar a concessão do benefício ? ' ,
                         'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
                  then begin
                     frmAguarde.Apaga;
                     TiraSQL(qryAux);
                     Exit;
                  end;
               end
               else bDevolveContrib := True;
           end else begin
                bDevolveContrib := False;
           end;
        end;

        if not dtmBaseDados.dbBaseDados.InTransaction
        then dtmBaseDados.dbBaseDados.StartTransaction;

        // Se usuario optou por devolver contribuicoes na folha de beneficio,
        // chamar a devolucao de contribuicao
        if bDevolveContrib
        then begin
           bOK := False;

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT FLGINTERNO FROM EVENTOGERADOR WHERE IDEVENTOGERADOR = '+IntToStr(iIdEvento));
           qryAux.Open;
           if not qry.IsEmpty
           then sFlgIntEvento := qryAux.FieldByName('FLGINTERNO').AsString
           else sFlgIntEvento := '';


           if bBenefVitalic then
           begin
              sAnoMesFinal := sMesPosterior;
              sDataFinal   := '';
           end
           else
           begin
              if qryDet.FieldbyName('DATAFINAL').AsString <> ''
              then begin
                 sAnoMesFinal := FormatDateTime('yyyy/mm', qryDet.FieldByName('DATAFINAL').AsDateTime);
                 sDataFinal   := qryDet.FieldByName('DATAFINAL').AsString;
              end
              else if qryDet.FieldbyName('DATAFINALPREVISTA').AsString <> ''
                   then begin
                      sAnoMesFinal := FormatDateTime('yyyy/mm', qryDet.FieldByName('DATAFINALPREVISTA').AsDateTime);
                      sDataFinal   := qryDet.FieldByName('DATAFINALPREVISTA').AsString;
                   end
                   else begin
                      sAnoMesFinal := sMesPosterior;
                      sDataFinal   := '';
                   end;
           end;

           iTipoDevolucao := DevolveContribuicoes(qryDet.FieldByName('IdPessJur').AsInteger,
                                                  qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                                                  qryDet.FieldByName('IdPessoa').AsInteger,
                                                  qryDet.FieldByName('SeqProposta').AsInteger,
                                                  iIdLoteConcessao,
                                                  sMatricula,
                                                  sNomeTitular,
                                                  sFlgInternoSitPart,
                                                  FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                                  sDataFinal,
                                                  FormatDateTime('yyyy/mm', dtInicioFund.Date),
                                                  sAnoMesFinal, 2,
                                                  'C',
                                                  sFlgIntEvento,
                                                  qry.FieldByName('IdEventoGerador').AsString
                                                 );
           if iTipoDevolucao < 0
           then begin
           if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana 119077
              dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro na devolução das contribuições. Verifique. ','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Exit;
           end
           else bOk := True;
        end
        else bOk := True;

        // Testar quitacao de dividas
        // Se, por algum motivo, der um erro na quitacao manter a situacao = 4
        frmAguarde.Mostra('Verificando dívidas ... ');
        if not TestaQuitacaoDividas
        then begin
           frmAguarde.Apaga;
        if dtmBaseDados.dbBaseDados.InTransaction then //Jéssica Lana 119077
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Concessão de benefício cancelada. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

        frmAguarde.Mostra('Preparando contribuições ... ');
        if bOK
        then begin
           // Prepara contribuicoes para o titular
           if bBenefVitalic then sDataFinal   := ''
           else if qryDet.FieldByName('FlgDataPrevista').AsInteger = 0
           then sDataFinal := qryDet.FieldByName('DataFinal').AsString
           else sDataFinal := qryDet.FieldByName('DataFinalPrevista').AsString;

           //BRUNO AZEVEDO SOL 160872 KINTANA 1353610
           bOK := ChamaPreparoDeContribuicao(qryDet.FieldByName('IdPessJur').AsInteger,
                                  qryDet.FieldByName('IDPLANOPREV').AsInteger,
                                  qryDet.FieldByName('IdTitular').AsInteger,
                                  qryDet.FieldByName('SeqProposta').AsInteger,
                                  qryDet.FieldByName('NumeroProcesso').AsInteger,
                                  sMatricula,
                                  qry.FieldByName('DtEvento').AsString,
                                  sDataFinal,
                                  qryDet.FieldByName('ValorAtual').AsString);
           //bOK := True;
           //BRUNO AZEVEDO SOL 160872 KINTANA 1353610

           if not bOK
           then begin
              frmAguarde.Apaga;
           if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana 119077
              dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro no Preparo de Contribuições. Verifique. ','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Exit;
           end;
        end;
        frmAguarde.Apaga;


        // VERIFICAR SE POSSUI ACERTOS DE BENEFICIO/CONTRIBUICAO FEITOS POR ENCERRAMENTO
        // SEM LOTE

        sSQL := ' UPDATE HSTBENEFBFCIARIO HST                      '+
                ' SET    FLGENVIADO     = 0,                       '+
                '        IDLOTE = '+IntToStr(iIdLoteConcessao)+',  '+
                '        FLGCONCESSAO   = 1,                       '+
                '        MES            = '''+sAnoMesPagamento+''' '+
                ' WHERE  IDPESSJUR      = '+IntToStr(iIdPessJur)+
                ' AND    IDPLANOPREV    = '+InttoStr(iIdPlanoPrev)+
                ' AND    IDTITULAR      = '+InttoStr(iIdTitular)+
                ' AND    SEQPROPOSTA    = '+InttoStr(iSeqProposta)+

                ' AND    IDPESSOA       = '+InttoStr(iIdTitular)+
                //BRUNO AZEVEDO SOL 138348/1921 KINTANA 841578
                ' AND    NUMEROPROCESSO = '+InttoStr(iNumeroProcesso)+
                ' AND    IDBENEFICIO    = '+qryDet.FieldByName('IDBENEFICIO').AsString+
                //BRUNO AZEVEDO SOL 138348/1921 KINTANA 841578
                ' AND    IDLOTE IS NULL   '+
                ' AND    (( IDMOTIVO    = '+IntToStr(prmIdMotDevolNaoIden)+' ) OR '+
                '         ( IDMOTIVO    = '+IntToStr(prmIdMotivoAcertoFL) +' ) OR '+
                '         ( IDMOTIVO    = '+IntToStr(prmIdMotivoDevolBen) +' ) )  '+
                ' AND    ((VLBENEFPGTO IS NULL) OR (VLBENEFPGTO = 0) )           '+
                ' AND  NOT EXISTS ( SELECT 1 FROM PREVIA PR                      '+
                '                   WHERE  PR.IDPESSJUR      = '+IntToStr(iIdPessJur)+
                '                   AND    PR.IDPLANOPREV    = '+InttoStr(iIdPlanoPrev)+
                '                   AND    PR.IDTITULAR      = '+InttoStr(iIdTitular)+
                '                   AND    PR.SEQPROPOSTA    = '+InttoStr(iSeqProposta)+

                '                   AND    PR.IDPESSOA       = '+InttoStr(iIdTitular)+
                '                   AND    PR.MES            = HST.MESREFERENCIA '+
                '                   AND    PR.MESCOBRANCA    = HST.MES           '+
                '                   AND    PR.IDBENEFICIO    = HST.IDBENEFICIO ) ';

        qryAux.Close;
        qryAux.SQl.Clear;
        qryAux.SQL.Add(sSQL);
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do begin
              frmAguarde.Apaga;
           if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana 119077
              dtmBaseDados.dbBaseDados.RollBack;
              MostrarErro(E);
              Exit;
           end;
        end;
        //BRUNO AZEVEDO SOL 130057 KINTANA 717976
        if (iIdEvento <> 334) and (iIdEvento <> 337) and (iIdEvento <> 15) and (iIdEvento <> 336) and (iIdEvento <> 345) then begin
          //idevento = 4 Falecimento
          if (iIdEvento <> 4) and (qryDet.FieldByName('FLGPECULIO').AsInteger <> 1) and (qryDet.FieldByName('IDPESSOA').AsInteger <> qryDet.FieldByName('IDTITULAR').AsInteger) then begin  //Renato Visoni SOL 155863 Kintana 1216997
            sSQL := ' UPDATE HSTCONTRIBPREV HST                        '+
                  ' SET    SITRECEBIMENTO = 0,                       '+
                  '        IDLOTE         = '+IntToStr(iIdLoteConcessao)+',  '+
                  '        FLGCONCESSAO   = 1,                       '+
                  '        MESCOBRANCA    = '''+sAnoMesPagamento+''' '+
                  ' WHERE  IDPESSJUR      = '+IntToStr(iIdPessJur)+
                  ' AND    IDPLANOPREV    = '+InttoStr(iIdPlanoPrev)+
                  ' AND    IDPESSOA       = '+InttoStr(iIdTitular)+
                  ' AND    SEQPROPOSTA    = '+InttoStr(iSeqProposta)+
                  ' AND    (( IDMOTIVO    = '+IntToStr(prmIdMotDevolNaoIden)+' ) OR '+
                  '         ( IDMOTIVO    = '+IntToStr(prmIdMotivoAcertoFL) +' ) OR '+
                  '         ( IDMOTIVO    = '+IntToStr(prmIdMotivoDevolBen) +' ) )  '+
                  ' AND    ((VALORRECEBIDO IS NULL) OR (VALORRECEBIDO = 0) )       '+
                  ' AND  NOT EXISTS ( SELECT 1 FROM TMPDESC PR                     '+
                  '                   WHERE  PR.IDPESSJUR      = '+IntToStr(iIdPessJur)+
                  '                   AND    PR.IDPLANOPREV    = '+InttoStr(iIdPlanoPrev)+
                  '                   AND    PR.IDPESSOA       = '+InttoStr(iIdTitular)+
                  '                   AND    PR.SEQPROPOSTA    = '+InttoStr(iSeqProposta)+
                  '                   AND    PR.MESREFERENCIA  = HST.MESREFERENCIA '+
                  '                   AND    PR.MESCOBRANCA    = HST.MESCOBRANCA   '+
                  '                   AND    PR.IDDESCONTO     = HST.IDCONTRIBUICAO ) ';
            qryAux.Close;
            qryAux.SQl.Clear;
            qryAux.SQL.Add(sSQL);
            try
              qryAux.ExecSQL;
            except
              on E:EDBEngineError do begin
                frmAguarde.Apaga;
              if dtmBaseDados.dbBaseDados.InTransaction then   //Jéssica Lana SOL 119077
                dtmBaseDados.dbBaseDados.RollBack;
                MostrarErro(E);
                Exit;
              end;
            end;//Renato Visoni SOL 155863 Kintana 1216997
          end;
        end;
     end; // if evento <> AI e BI ( EVENTOS DO INSS )

     // SOL 132938 BRUNO AZEVEDO  e Xavier
     If Trim(DbLAlterador.Text) = 'Sim' Then
     Begin
         // para que seja possivel ordenar as contribuições de acordo com a ordenação dos beneficios
         // foi necessario criar uma query ordenada conforme a query que traz os beneficios no demonstrativo
         sSQL :=
               ' SELECT BF.IDBENEFICIO, BF.IDPESSOA FROM BENEFBFCIARIO BF , BENEFICIO B '+
               ' WHERE  B.IDBENEFICIO = BF.IDBENEFICIO      '+
               ' AND    BF.NUMEROPROCESSO = '+ qryDet.FieldByName('NUMEROPROCESSO').AsString +
               ' ORDER  BY B.NOME                           ';

         FazQuery(qryAux2, sSQL);

         qryAux2.First;

         while not qryAux2.Eof do
         begin

           varFields := VarArrayCreate([0,1],varVariant);
           varFields[0] := qryAux2.FieldByName('IdBeneficio').AsInteger;
           varFields[1] := qryAux2.FieldByName('IdPessoa').AsInteger;

           //edilaine WO7690 - inicio
           if not qryDet.Locate('IdBeneficio;IdPessoa',varFields , [loCaseInsensitive, loPartialKey])then
           begin
             qryAux2.next;
             continue;
           end;
           //edilaine WO7690 - fim

            With qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE '+
                       ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));
               Open;

               sAnoMesFim :=  qryAux.FieldByName('MESREFERENCIA').Asstring;
           end;

         // verifica se é BUA
            sSQL :=
            ' SELECT * ' +
            ' FROM BENEFBFCIARIO BEN ' +
            ' WHERE BEN.IDTPPAGTOBENEFIC = 2 ' +
            ' AND   BEN.IDBENEFICIO   = '+ qryDet.FieldByName('IDBENEFICIO').AsString +
            ' AND   BEN.IDPESSOA      = '+ qryDet.FieldByName('IDPESSOA').AsString +
            ' AND   BEN.IDTITULAR     = '+ qryDet.FieldByName('IDTITULAR').AsString +
            ' AND   BEN.IDPLANOPREV   = '+ qryDet.FieldByName('IDPLANOPREV').AsString ;

            If FazQuery(QryAux, sSQL) Then
            Begin
               //sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime); // Andre Imakawa - SIG 23661
               //sAnoMesFim   := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime); // Andre Imakawa - SIG 23661
               bAlteradorBua := true;
            end
            else
            begin
               bAlteradorBua := false;
               // Andre Imakawa - SIG 23661 - Inicio
               {
               if  qryDet.FieldByName('DATAINICIO').Asstring <> '' then
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
               else
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);
               }
               // Andre Imakawa - SIG 23661 - Fim
            end;

            // Andre Imakawa - SIG 23661 - Inicio
            if  qryDet.FieldByName('DATAINICIO').Asstring <> '' then
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
            else
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);
            // Andre Imakawa - SIG 23661 - Fim

            while  sAnoMesAtual <= sAnoMesFim do
            begin

               sSQL :=
              // ' SELECT H.VALORPREV ' +
               ' SELECT DECODE(H.FLGDEVOLUCAO,1,-H.VALORPREV ,H.VALORPREV) AS VALORPREV' +   //SOL 132938 André Oliveira
               '   FROM BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP ' +
               '  WHERE H.IDLOTE = ' + QuotedStr(IntToStr(iIdLoteConcessao)) +
               '    AND H.IDPESSJUR = '+ qryDet.FieldByName('IDPESSJUR').AsString +
               '    AND H.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString +
               '    AND H.SEQPROPOSTA = 1 ' +
               '    AND H.NUMEROPROCESSO = '+ qryDet.FieldByName('NUMEROPROCESSO').AsString +
               '    AND H.IDBENEFICIO    = '+ qryDet.FieldByName('IDBENEFICIO').AsString +
               '    AND BPP.IDBENEFICIO = H.IDBENEFICIO ' +
               '    AND BPP.IDPLANOPREV = H.IDPLANOPREV ' +
               '    AND H.FLGDEVOLUCAO = 0 ' +
               '    AND H.FLGENVIADO = 0 ' +
               '    AND B.IDBENEFICIO = H.IDBENEFICIO ' +
               '    AND H.MESREFERENCIA = ' + QuotedStr(sAnoMesAtual);

               If FazQuery(QryAux, sSQL) and (sAnoMesAtual <> sAnoMesFim) Then Begin // SOL 232043 PPM 396781

                 If Not CalculaAlteradores('B', sAnoMesAtual,
                                        QryAux.FieldByName('VALORPREV').AsFloat,
                                        dCorrecaoMonetaria,
                                        -1,-1)
                 Then Begin
                    dtmBaseDados.dbBaseDados.RollBack;
                    MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                    TiraSQL(qryAux);
                    Exit;
                 End;
               End;
               if Length(sIdContribuicaoAlteradores) <= 0 then  //SOL 132938 André Oliveira
                  sIdContribuicaoAlteradores := '0';

               // edilaine - SOL 262968 / PPM 1102753
               {os alteradores de contribuição são calculados pela procedure da Taxa - ExecutaSP_PreparoContribuicao}
               { Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB }
               {sSQL := //'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO, H.VALORESPERADO FROM '+
                'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO, DECODE(H.FLGDEVOLUCAO,1,H.VALORESPERADO ,-H.VALORESPERADO) AS VALORESPERADO FROM ' +//SOL 132938 André Oliveira
                     'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                     '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                     ' FROM HSTCONTRIBPREV HCP '+
                     ' WHERE                   '+
                     '  HCP.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString      +' AND '+
                     '  HCP.IDMOTIVO = '+ inttostr(prmIdMotivoContrib)                 +' AND '+
                     '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                +' AND '+
                     '  HCP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                             AND '+
                     '  HCP.IDPESSOA = H.IDPESSOA )                                       AND '+
                     '  H.Idcontribuicao in ( ' +sIdContribuicaoAlteradores+' ) ';

               If FazQuery(QryAux, sSQL) Then
               Begin

                  iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
                  iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

                  If (((iNumRecebimento > 0) and not(bAlteradorBua)) and (sAnoMesAtual <> sAnoMesFim)) Then    // SOL 232043 PPM 396781
                  Begin
                     // Calcular Alterados
                     If Not CalculaAlteradores('C', sAnoMesAtual,
                                             qryAux.FieldByName('VALORESPERADO').AsFloat, // SOL 231025 PPM 363636
                                             dCorrecaoMonetaria,
                                             iIdContribuicao, iNumRecebimento,0)
                     Then
                     Begin
                        dtmBaseDados.dbBaseDados.RollBack;
                        MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                        TiraSQL(qryAux);
                        Exit;
                     End;
                  END;
               END;
               } // edilaine - SOL 262968 / PPM 1102753

               if (((sAnoMesAtual = sAnoMesFim) and (sAnoMesAtual <> (Copy(sAnoMesAtual, 1,4) + '/13'))) and not(bAlteradorBua)) then
               begin
                  sAnoMesAtual := Copy(sAnoMesAtual, 1,4) + '/13';
                  sAnoMesFim   := Copy(sAnoMesFim, 1,4) + '/13';
               end
               else
               begin
                  if (Copy(sAnoMesAtual, 6,2) = '12') then
                  begin
                     sAnoMesAtual  := Copy(sAnoMesAtual, 1,4) + '/13';
                  end
                  else
                  begin
                     sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                  end;


               end;
            end;
            qryAux2.Next;
         end;
         // SOL 132938 BRUNO AZEVEDO

     end;

     // RETIRADA DO IF bOK
      frmAguarde.Mostra('Atualizando Situações ...');
      If bAtualizaDados Then
         bOK := AtualizaSitParticipante(iIdPessJur,
                                        iIdPlanoPrev,
                                        iIdTitular,
                                        iSeqProposta,
                                        qryEvento.FieldByName('IdEventoGerador').AsInteger);
      if not bOK
      then begin
         frmAguarde.Apaga;
      if dtmBaseDados.dbBaseDados.InTransaction then   //Jéssica Lana SOL 119077
         dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Erro na atualização da situação do participante. Verifique. ','Erro',mtError,[mbOk],0);
         TiraSQL(qryAux);
         Exit;
      end;
      frmAguarde.Apaga;

     bTodosEncerrados := True;
     qryDet.First;
     while not qryDet.Eof do
     begin
        if qryDet.FieldByName('IDSITBENEFICIO').AsInteger <> 3
        then bTodosEncerrados := False;

        iIdCalculo := QryDet.FieldByName('IDCALCULO').AsInteger;

        try
           CriaLogOcorrencia({qryDet.FieldByName('IdPlanoORIGEM').AsString,      //edilaine SIG99886}
                             qryDet.FieldByName('IdPlanoPREV').AsString,         //edilaine SIG99886
                             qryDet.FieldByName('IdPessJur').AsString,
                             qryDet.FieldByName('IdTitular').AsString,
                             qryDet.FieldByName('IdBeneficio').AsString,
                             qryDet.FieldByName('NumeroProcesso').AsString,
                             qryDet.FieldByName('IdPessoa').AsString,
                             qryDet.FieldByName('SeqProposta').AsString,
                             '7',
                             FormatDateTime('dd/mm/yyyy', date),
                             qryDet.FieldByName('ValorAtual').AsString,
                             qryDet.FieldByName('ValorTotal').AsString,
                             qryDet.FieldByName('ValorCotas').AsString,
                             qryDet.FieldByName('DataInicio').AsString,
                             sDataFinal,
                             qryDet.FieldByName('ValorAtual').AsString,
                             qryDet.FieldByName('DataInicio').AsString,
                             sDataFinal,
                             '4',
                             qryDet.FieldByName('FlgDataPrevista').AsInteger,
                             qryAux, '',
                             iIdLoteConcessao,
                             iIdCalculo,
                             False,
                             qryDet.FieldByName('USUARIOALT').AsInteger,
                             iFlgEmprestimo
                             )
        except
           frmAguarde.Apaga;
        if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana SOL 119077
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
        qryDet.Next;
     end;

     qryBenefReferencia.First;
     while not qryBenefReferencia.Eof do
     begin
        try

           iIdCalculo := QryDet.FieldByName('IDCALCULO').AsInteger;


           CriaLogOcorrencia({qryDet.FieldByName('IdPlanoORIGEM').AsString,      //edilaine SIG99886}
                             qryDet.FieldByName('IdPlanoPREV').AsString,         //edilaine SIG99886
                             qryDet.FieldByName('IdPessJur').AsString,
                             qryDet.FieldByName('IdTitular').AsString,
                             qryBenefReferencia.FieldByName('IdBeneficio').AsString,
                             qryDet.FieldByName('NumeroProcesso').AsString,
                             qryDet.FieldByName('IdPessoa').AsString,
                             qryDet.FieldByName('SeqProposta').AsString,
                             '7',
                             FormatDateTime('dd/mm/yyyy', date),
                             qryBenefReferencia.FieldByName('ValorAtual').AsString,
                             qryBenefReferencia.FieldByName('ValorTotal').AsString,
                             '0',
                             qryBenefReferencia.FieldByName('DataInicio').AsString,
                             qryBenefReferencia.FieldByName('DataFinal').AsString,
                             qryBenefReferencia.FieldByName('ValorAtual').AsString,
                             qryBenefReferencia.FieldByName('DataInicio').AsString,
                             qryBenefReferencia.FieldByName('DataFinal').AsString,
                             '6',
                             qryDet.FieldByName('FlgDataPrevista').AsInteger,
                             qryAux,
                             '',
                             iIdLoteConcessao,
                             iIdCalculo,
                             False,
                             -1,
                             iFlgEmprestimo
                             )
        except
           frmAguarde.Apaga;
        if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana SOL 119077
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

        qryBenefReferencia.Next;
     end;

//Monica Gonzaga - SOL192129/14203 KTN - 1968560 - inicio
      //Retirado o FLGCOBRA = 0
	 // SE TODOS OS BENEFICIOS DO PROCESSO ESTIVEREM ENCERRADOS, ENCERRAR
     // AS CONTRIBUICOES TAMBÉM
     {if bTodosEncerrados
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;


        qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, '                       +
                       '        DATAFINAL = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataFinal.Date)) + ', ''DD/MM/YYYY'') ' +

                       ' WHERE  IDPESSOA    = '+IntToStr(iIdTitular)                       +
                       ' AND    IDPESSJUR   = '+IntToStr(iIdPessJur)                       +
                       ' AND    IDPLANOPREV = '+IntToStr(iIdPLANOPrev)                     +
                       ' AND    SEQPROPOSTA = '+IntToStr(iSeqProposta)                     +
                       ' AND    IDCONTRIBUICAO IN ( SELECT IDCONTRIBUICAO                 '+
                       '                            FROM   CONTPREVEVENTO                 '+
                       '                            WHERE  IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)  +
                       '                            AND    IDEVENTOGERADOR = '+IntToStr(iIdEvento) +')');
        try
           qryAux.ExecSQL;
        except
           frmAguarde.Apaga;
        if dtmBaseDados.dbBaseDados.InTransaction then     //Jéssica Lana SOL 119077
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Ocorreu um erro no encerramento das contribuições a cobrar. Verifique. ',
                  'Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;}
//Monica Gonzaga - SOL192129/14203 KTN - 1968560 - FIM

     if not ConfirmaBeneficio
     then begin
        frmAguarde.Apaga;
     if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
        dtmBaseDados.dbBaseDados.RollBack;
        TiraSQL(qryAux);

        MsgDlg('Todo o processo de concessão do benefício será cancelado.','Atenção',mtInformation,[mbOk,mbHelp],0);
        bbtnCancelarClick(Self);

        Exit;
     end;



     { Renato Visoni SOL 108695 \ Kintana 493168
     Try
       dtmBaseDados.dbBaseDados.Commit;
     Except
        MsgDlg('Erro na confirmação do Processo. Verifique.','Erro',mtError,[mbOk],0);
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        TiraSQL(qryAux);
        Exit;
     End;
     }
  {end              // edilaine - SOL 253577-18094 / PPM 1269549 - comentado inicio

  // Alterar a DATAFINAL da CONTRIBPREVPARTP
  Else If (qry.State = dsEdit) and (Not bConcedeuBeneficio) Then
  Begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET '+
                   ' DATAFINAL = TO_DATE('''+qryDet.FieldByName(dtDataFinal.DataField).AsString+''',''DD/MM/YYYY'')'+
                   ' WHERE  IDPESSOA    = '+qryDet.FieldByName('IDTITULAR').AsString+
                   ' AND    IDPESSJUR   = '+qryDet.FieldByName('IDPESSJUR').AsString+
                   ' AND    IDPLANOPREV = '+qryDet.FieldByName('IDPLANOPREV').AsString+
                   ' AND    SEQPROPOSTA = '+qryDet.FieldByName('SEQPROPOSTA').AsString+
                   ' AND    IDCONTRIBUICAO IN ( SELECT IDCONTRIBUICAO '+
                   '                            FROM   CONTPREVEVENTO '+
                   '                            WHERE  IDPLANOPREV = '+qryDet.FieldByName('IDPLANOPREV').AsString+
                   '                            AND    IDEVENTOGERADOR = '+qry.FieldByName('IDEVENTOGERADOR').AsString+')');
    try
       qryAux.ExecSQL;
    except
       frmAguarde.Apaga;
       MsgDlg('Ocorreu um erro na atualização das Contribuições a Cobrar. Verifique. ',
              'Erro',mtError,[mbOk],0);
       Exit;
    end;}     // edilaine - SOL 253577-18094 / PPM 1269549 - comentado fim
  End;
  // Se o usuario escolheu a opcao NAO CONCEDER beneficio Então
  // 1. Se foi um beneficio temporari -> apagar salarios virtuais
  // 2. Voltar situacoes do participante
  // 3. Voltar contribuicoes a pagar
  if (qry.State = dsEdit) and (bNAOConcedeuBeneficio)
  then begin
     if not dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;

     // Se a situacao final do beneficio for 6 (nao concedido) e o beneficio
     // for temporario, apagar rubricas de salario geradas pelo evento
     if ((qryEvento.FieldByName('FlgInterno').AsString = 'AC') or
         (qryEvento.FieldByName('FlgInterno').AsString = 'DO') or
         (qryEvento.FieldByName('FlgInterno').AsString = 'FR') ) and
        (qryDet.FieldByName('IdRubSalAuxDoenca').AsInteger > 0)
     then begin
        sAnoMesIniSalario := FormatDateTime('yyyy/mm', qry.FieldByName('DtEvento').AsDateTime);

        if qryDet.FieldByName('FlgDataPrevista').AsInteger = 0
        then sDataFinal := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DataFinal').AsDateTime)
        else sDataFinal := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DataFinalPrevista').AsDateTime);

        if (sDataFinal<> '') and (StrToDate(sDataFinal) <= date) then
        begin
          sAnoMesFimSalario := Copy(sDataFinal,7,4)+'/'+ Copy(sDataFinal,4,2);
        end
        else
        begin
          sAnoMesFimSalario := FormatDateTime('yyyy/mm', Date);
        end;

        if not ApagaRubricaMES( qryDet.FieldByName('IdPessJur').AsInteger,
                                qryDet.FieldByName('IdPessoa').AsInteger,
                                qryDet.FieldByName('IdRubSalAuxDoenca').AsInteger,
                                sAnoMesIniSalario,
                                sAnoMesFimSalario,
                                False,
                                qryAux
                               ) then
        begin
           MsgDlg('Ocorreu um problema no acerto dos salários virtuais. '+#13+
                  'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
                  'Verifique. ', Sistema.NomeModulo, mtInformation, [mbOk], 0);
           Repaint;
        if dtmBaseDados.dbBaseDados.InTransaction then    //Jéssica Lana SOL 119077
           dtmBaseDados.dbBaseDados.RollBack;
           TiraSQL(qryAux);
           Exit;
        end;

        if not DesfazEventoParticipante ( qryDet.FieldByName('IdPessJur').AsInteger,

                                    qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                                    qryDet.FieldByName('IdPessoa').AsInteger,
                                    qryDet.FieldByName('SeqProposta').AsInteger,
                                    qry.FieldByName('IdEventoGerador').AsInteger,
                                    qry.FieldByName('DtEvento').AsString,
                                    sMsgErro,
                                    qryAux)
        then begin
           frmAguarde.Apaga;
           MsgDlg('Ocorreu um problema ao acertar situação do participante. '+#13+
                  'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
                  'Verifique. ','Informação',mtInformation,[mbOk],0);
        if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana SOL 119077
           dtmBaseDados.dbBaseDados.RollBack;
           TiraSQL(qryAux);
           Exit;
        end;
        // Grava FlgEfetivado = 1 na EventosPrev
        AtualizaEventosPrev(qryDet.FieldByName('IdPessJur').AsInteger,

                            qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                            qryDet.FieldByName('IdTitular').AsInteger,
                            qryDet.FieldByName('SeqProposta').AsInteger,
                            qry.FieldByName('IdEventoGerador').AsInteger,
                            qry.FieldByName('DtEvento').AsString);



    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

     if dtmBaseDados.dbBaseDados.InTransaction then   //Jéssica Lana SOL 119077
        dtmBaseDados.dbBaseDados.Commit;

       //Otacilio Aquino SOL 160863 Kintana 1381911
       uBeneficio.bGravaEvento := True;

     end;
  end;

  // ***************************************************************************

  if (sTipoFormChamador = 'SI') and (not prmFlgGravaSimulBenef)
  then begin
      // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio


      If not dtmBaseDados.dbBaseDados.InTransaction
       Then dtmBaseDados.dbBaseDados.StartTransaction;


      Inherited; { Executar o inherited para gravar processo }

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(BP.ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+
                 ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF        '+
                 ' WHERE  BF.NUMEROPROCESSO IN ('+sNumeroProcessoAntesGravar+')'+
                 ' AND    BP.IDPLANOPREV = BF.IDPLANOPREV '+
                 ' AND    BP.IDBENEFICIO = BF.IDBENEFICIO ' );
         Open;
         if (FieldByName('IdRelatBeneficio').AsInteger > 0) and
            (MsgDlg('Esta simulação será descartada. Deseja imprimir relatório de simulação ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes)
         then begin
            sbtnImprimirSimulacaoClick(Sender);
         end;
         DesfazRequerimentos(qryAux, sNumeroProcessoAntesGravar);
      end;

      if dtmBaseDados.dbBaseDados.InTransaction then   //Jéssica Lana SOL 119077
         dtmBaseDados.dbBaseDados.Rollback;


      bbtnCancelarClick(Self); Exit;
  end;

  // Andre Imakawa - SIG 50047 - Inicio
  bPossuiIDTPPAGTOBENEFIC := False;
  qryDet.first;
  while (not qryDet.eof) do
  begin
    if qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 1 then
    begin
      bPossuiIDTPPAGTOBENEFIC := True;
      break;
    end;
    qryDet.next;
  end;
  // Andre Imakawa - SIG 50047 - Fim

    // Colocado o Inherited no fim da procedure
  inherited;

  // Kintana 1515949 SOL 169125 - Otacilio ** Inicio **
  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  lblSitProcesso.Caption := 'Situação : ' + qryDet.FieldByName('Descricao').AsString;
  Refresh;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE PROCESSOBENEF SET '+
                 ' IDSITPROCESSO = ' + IntToStr(qryDet.FieldByName('IDSITBENEFICIO').AsInteger) +
                 ' WHERE NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso));
  try
     qryAux.ExecSQL;
  except
     if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.RollBack;

     MsgDlg('Ocorreu um erro na atualização do Processo Beneficiário. Verifique. ',
            'Erro',mtError,[mbOk],0);
     Exit;
  end;
  // Kintana 1515949 SOL 169125 - Otacilio ** Fim **

  AjustaAtivacaoPlano; //Thiago Passos 97577 Kintana 424749

  //Renato Visoni SOL 108695 \ Kintana 493168
  Try

    // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
    if (Sistema.IdModulo = 454) and ((sTipoFormChamador = 'EV') or (sTipoFormChamador = 'MA')) then
    begin
      if not AssociaTaxas() then
         exit;
    end
    else  // edilaine - SOL 270851 / PPM 1338345 - inicio
    begin
      if ((sTipoFormChamador = 'CO') and (not bConcedeuBeneficio)) then
      if not AssociaTaxas(false) then
         exit;
    end;  // edilaine - SOL 270851 / PPM 1338345 - fim

    if (sTipoFormChamador = 'CO') and  (bConcedeuBeneficio) then
    begin
      // chamar procedure que abre o processo em vários por pessoaxbeneficio
      if not DesmembraProcessosBeneficios(iNumeroProcesso, slstProcessosNovos, sMsgErro ) then
      begin
        MsgDlg('Erro no desmembramento do Processo ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk],0);
        frmAguarde.Apaga;
        exit;
      end
      //edilaine SIG20491 : inicio
      else
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE PROCESSOBENEF SET '+
                       '   NUMPROCESSOPAI = '+IntToStr(iNumeroProcesso) +', '+
                       '   SEQRESGATE = (SELECT SEQRESGATE FROM PROCESSOBENEF WHERE NUMEROPROCESSO = '+IntToStr(iNumeroProcesso) +') '+
                       ' WHERE NUMEROPROCESSO IN ('+slstProcessosNovos+')');
        qryAux.ExecSql;
      end;
      //edilaine SIG20491 : fim
    end;
    // edilaine - SOL 253577-18094 / PPM 1269549 - fim

    if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana SOL 119077
       dtmBaseDados.dbBaseDados.Commit;

    if (sTipoFormChamador = 'CO') and   // edilaine - SOL 253577-17464 / PPM 955703
       (bConcedeuBeneficio) then        // edilaine - SOL 253577-18129 / PPM 1303078
    begin
       GeraDemonstrativo(formatdatetime ('hh:mm:ss',now));
    end;

    //Otacilio Aquino SOL 160863 Kintana 1381911
    uBeneficio.bGravaEvento := True;
  Except
    MsgDlg('Erro na confirmação do Processo. Verifique.','Erro',mtError,[mbOk],0);
    frmAguarde.Apaga;
 if dtmBaseDados.dbBaseDados.InTransaction then   //Jéssica Lana SOL 119077
    dtmBaseDados.dbBaseDados.RollBack;
    Exit;
  End;
  //Fim Renato Visoni SOL 108695 \ Kintana 493168
  if (bConcedeuBeneficio) then
  begin
     qryDet.first;
     while not(qryDet.eof) do
     begin
        if not(dtmBaseDados.dbBaseDados.InTransaction) then  //Jéssica Lana SOL 119077
        dtmBaseDados.dbBaseDados.StartTransaction;
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add('  UPDATE BENEFBFCIARIO ' );
           //SQL.Add('  SET    VALORATUAL     = (VALORATUAL / QTDEPARCELAS) ' );
           SQL.Add('  SET    VALORATUAL     = DECODE(RESGATEPARCELADO,1,(VALORATUAL / QTDEPARCELAS),VALORATUAL) ' ); //  SOL 189184 - KTN 1785236

           SQL.Add('  WHERE  IDBENEFICIO    = ' + qryDet.FieldByName('IDBENEFICIO').AsString);
           SQL.Add('  AND    IDTITULAR      = ' + qryDet.FieldByName('IDTITULAR').AsString);
           SQL.Add('  AND    IDPLANOPREV    = ' + qryDet.FieldByName('IDPLANOPREV').AsString);
           SQL.Add('  AND    NUMEROPROCESSO = ' + qryDet.FieldByName('NUMEROPROCESSO').AsString);
           ExecSql;
        end;
        if dtmBaseDados.dbBaseDados.InTransaction then  //
           dtmBaseDados.dbBaseDados.Commit;

        qryDet.Next;
     end;

     // Andre Imakawa - SIG 50047 - Inicio
     if (sTipoFormChamador = 'CO') then
     begin
       if bPossuiIDTPPAGTOBENEFIC then
         begin
     // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
     { gera historico de percentual }
     if not(dtmBaseDados.dbBaseDados.InTransaction) then
        dtmBaseDados.dbBaseDados.StartTransaction;     
           //qryDet.first;
     if not (GravaHstPercGrupoHistorico(qryDet.FieldByName('IDTITULAR').AsInteger)) then
     begin
       MsgDlg('Erro na gravação do histórico do percentual por grupo.','Erro',mtError,[mbOK],0);
       if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
     end
     else
     begin
       if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;
     end;
     // edilaine - SOL 253577-18064 / PPM 1240079 - fim
         end;

     end;
     // Andre Imakawa - SIG 50047 - Fim

     // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
     if sRequerimento then
        bbtnSairClick(Sender)
     else
        SelecionaProcesso(-1);
     // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  End;

 // if (Sistema.IdModulo = 454) and (sTipoFormChamador = 'EV') then
 //    ConcederOK;
   if (Sistema.IdModulo = 454) and (sTipoFormChamador = 'EV') then   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
   begin
     // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733  - início
     qryDet.DisableControls;
     qryDet.First;

     uBeneficio.sIdBeneficios := '';
     uBeneficio.sIdPessoas := '';

     while not (qryDet.Eof) do
     begin
        if (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 4) and (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2) then
        begin
           uBeneficio.sIdBeneficios := uBeneficio.sIdBeneficios + qryDet.FieldByName('IDBENEFICIO').AsString + ',';
           uBeneficio.sIdPessoas := uBeneficio.sIdPessoas + qryDet.FieldByName('IDPESSOA').AsString + ',';
        end;

        qryDet.Next;
     end;

     if (uBeneficio.sIdBeneficios <> '') then
        uBeneficio.sIdBeneficios := Copy(uBeneficio.sIdBeneficios, 1 , Length(uBeneficio.sIdBeneficios) -1); // Retira a última vírgula

     if (uBeneficio.sIdPessoas <> '') then
        uBeneficio.sIdPessoas := Copy(uBeneficio.sIdPessoas, 1 , Length(uBeneficio.sIdPessoas) -1); // Retira a última vírgula

     qryDet.EnableControls;
     // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733 - fim


     // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
     if not dtmBaseDados.dbBaseDados.InTransaction then
        bChamarConcessao := true;
     // edilaine - SOL 253577-18129 / PPM 1303078 - fim

     bbtnSairClick(Sender);
   end;

end;

function TfrmCadRequerBenefParticip.VerificaQuantBenefProcesso(
  NumeroProcesso: string): Integer;
begin
   Result := 0;
   with Tquery.Create(Self) do
   begin
      databasename := 'basedados';
      SQL.Add('SELECT COUNT(1) QTDE FROM BENEFBFCIARIO BF  WHERE BF.NUMEROPROCESSO = '+NumeroProcesso);
      Open;
      Result := FieldByName('QTDE').AsInteger;
      Close;
   end;
end;

//edilaine - SOL 253577-17464 / PPM 955703
function TfrmCadRequerBenefParticip.DeleteProcessoBenef(
  NumeroProcesso: string): boolean;
begin
   Result := true;
   try
     with Tquery.Create(Self) do
     begin
        databasename := 'basedados';
        SQL.Add('DELETE FROM PROCESSOBENEF PBF  WHERE PBF.NUMEROPROCESSO = '+NumeroProcesso);
        try
           ExecSQL;
        except
           Result := false;
        end;
     end;
   finally
     Free;
   end;
end;
//edilaine - SOL 253577-17464 / PPM 955703

procedure TfrmCadRequerBenefParticip.sbtnExcluiDetClick(Sender: TObject);
var
  QryDelCalc,QryAuxCalc:tquery;
  iQtdeBeneficioProcesso : Integer;    // edilaine - SOL 253577-17464 / PPM 955703
begin

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  //iQtdeBeneficioProcesso := VerificaQuantBenefProcesso(IntToStr(iNumeroProcesso));    // edilaine - SOL 253577-17464 / PPM 955703
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  if not qryBeneficio.Active
  then AbreQryBeneficio(False,qryEvento.FieldByName('IdEventoGerador').AsInteger, iIdPlanoPrev);

  // O usuario só terá este botao disponivel se o processo estiver
  // pendente ou nao concedido
  // Logo se o processo estiver pendente e o beneficio que o usuario esta
  // tentando excluir for resgate, o sistema devera devolver a reserva
  if ( (qryDet.FieldByName('IdSitBeneficio').AsInteger = 4) or
       (qryDet.FieldByName('IdSitBeneficio').AsInteger = 8) ) and
     (qryDet.FieldByName('FlgResgate').AsInteger = 1)
  then begin
     if not DevolveReserva(qryDet.FieldByName('IdBeneficio').AsInteger, True)
     then begin
        MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
               'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
               'Verifique. ','Informação',mtInformation,[mbOk],0);
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);
  while (not qryBenefAux.Eof) and {or}      // edilaine - SOL 253577-18129 / PPM 1303078
        (qryBenefAux.FieldByName('IdBeneficio').AsInteger = qryBeneficio.FieldByName('IdBeneficio').AsInteger)   do
  begin
     qryBenefAux.Delete;
  end;

  QryAuxCalc := Tquery.Create(Self);
  QryAuxCalc.databasename := 'basedados';
  QryAuxCalc.SQL.Add(' Select idcalculo from relbenefpart where numeroprocesso = '+inttostr(iNumeroProcesso)+
                     ' and idbeneficio = '+qrybeneficio.fieldbyname('idbeneficio').asString);
  QryAuxCalc.Open;
  QryDelCalc := Tquery.Create(Self);
  QryDelCalc.databasename := 'basedados';

  While not QryAuxCalc.eof do
  begin

     QryDelCalc.sql.add('delete from calculobenef where idcalculo = '+ QryAuxCalc.fieldbyname('idcalculo').asString);
     QryDelCalc.ExecSql;

     QryDelCalc.sql.Clear;
     QryDelCalc.sql.add('delete from detcalculo   where idcalculo = '+ QryAuxCalc.fieldbyname('idcalculo').asString);
     QryDelCalc.ExecSql;

     QryDelCalc.sql.Clear;
     QryDelCalc.sql.add('delete from relbenefpart where idcalculo = '+ QryAuxCalc.fieldbyname('idcalculo').asString);
     QryDelCalc.ExecSql;

     QryDelCalc.sql.Clear;
     QryDelCalc.sql.add('delete from calculo where idcalculo      = '+ QryAuxCalc.fieldbyname('idcalculo').asString);
     QryDelCalc.ExecSql;

     QryAuxCalc.next;
  end;

  // edilaine - SOL 270851 / PPM 1338345 - comentado inicio
  // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
  {QryAuxCalc.close;
  QryAuxCalc.sql.clear;
  QryAuxCalc.SQL.Add(' DELETE FROM CONTRIBPREVPARTP C                      '+
                     ' WHERE  EXISTS                                       '+
                     '        ( SELECT 1                                             '+
                     '          FROM   BENEFBFCIARIO BF, BENEFXTAXA BXT              '+
                     '          WHERE  BF.NUMEROPROCESSO = '+inttostr(iNumeroProcesso)+
                     '          AND    BF.IDBENEFICIO    = '+qrybeneficio.fieldbyname('idbeneficio').asString+
                     '          AND    BF.IDBENEFICIO    = BXT.IDBENEFICIO          '+
                     '          AND    C.IDCONTRIBUICAO  = BXT.IDCONTRIBUICAO       '+
                     // edilaine - SOL 270851 / PPM 1338345 - inicio
                     '          AND    C.IDPESSOA        = BF.IDPESSOA              '+
                     '          AND    C.IDPESSJUR       = BF.IDPESSJUR             '+
                     '          AND    C.IDPLANOPREV     = BF.IDPLANOPREV           '+
                     '          AND    C.SEQPROPOSTA     = BF.SEQPROPOSTA           '+
                     // edilaine - SOL 270851 / PPM 1338345 - fim
                     '          AND    TO_CHAR(C.DATAINICIO,''YYYY/MM/DD'') >= TO_CHAR(BF.DATAINICIO, ''YYYY/MM/DD'') '+
                     '        ) ');
  QryAuxCalc.ExecSql;
  // edilaine - SOL 253577-18094 / PPM 1269549 - fim
  }// edilaine - SOL 270851 / PPM 1338345 - comentado fim


  QryDelCalc.Free;
  QryAuxCalc.Free;

  inherited;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {if (qryDet.RecordCount <= 0)  then  //edilaine - SOL 253577-17464 / PPM 955703
  begin
    sbtnApagarClick(self);  //edilaine - SOL 253577-17464 / PPM 955703
  end;
  }// edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmCadRequerBenefParticip.FormShow(Sender: TObject);
begin
  InicializaEP;

  //Ádler Souza - SOL 125426 Kintana 711048
  If (iIdEvento = 337) or (iIdEvento = 15) then
  begin
    Label8.Visible := True;;
    dbedPercContrib.Visible := True;;
  end else begin
    Label8.Visible := False;
    dbedPercContrib.Visible := False;
  end;
  //Ádler Souza - SOL 125426 Kintana 711048 - Fim

  //BRUNO AZEVEDO SOL 135605 KINTANA 807282
  dbedPercContrib.text := '0';

  sbtnCadContaCorrente.Enabled := False;
  sbtnDemonsSRB.Enabled        := False;


  if bAbriuOutroForm
  then begin
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     Exit;
  end;

  sNumerosProcessos := '';
  iContClick        := 0;

  inherited;

  if sTipoFormChamador = 'EV' // form chamador é um dos eventos
  then begin

     // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
     if not dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;
     // edilaine - SOL 253577-18129 / PPM 1303078 - fim

     Caption := 'Requerimento de Benefícios para Participante';
     // Verificar se beneficio já foi requerido por este evento
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT P.NUMEROPROCESSO FROM PROCESSOBENEF P, BENEFBFCIARIO B '+
                    ' WHERE P.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+
                    ' AND   P.DTEVENTO        = TO_DATE('''+sDataEvento+''',''dd/mm/yyyy'') '+
                    ' AND   P.IDSITPROCESSO   = 4 '+
                    ' AND   B.NUMEROPROCESSO  = P.NUMEROPROCESSO '+
                    ' AND   B.IDTITULAR       = '+IntToStr(iIdTitular)+
                    ' AND   B.IDPESSOA        = '+IntToStr(iIdTitular)+
                    ' AND   B.IDPLANOORIGEM     = '+IntToStr(iIdPlanoPrev)+
                    ' AND   B.IDPESSJUR       = '+IntToStr(iIdPessJur));
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        qryAux.Close;
        sbtnInserirClick(Sender);
        // Preencher dados do evento
        try
           qryEvento.Close;
           qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
           qryEvento.Open;
           dblkpcmbEvento.Text := qryEvento.FieldByName('Nome').AsString;
           dtDataEvento.Enabled := False;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              MsgDlg(' Erro ao tentar localizar o evento gerador. Verifique. ','Informação',mtInformation,[mbOk],0);
           end;
        end;
     end
     else begin
        iNumeroProcesso := qryAux.FieldbyName('NumeroProcesso').AsInteger;
        qryAux.Close;
        SelecionaProcesso(iNumeroProcesso);
        sbtnAlterarClick(Sender);
     end;

     // Desabilitar a concessao e a alteracao do tipo de evento
     sbtnConcedeUm.Enabled := False;
     dblkpcmbEvento.Enabled := False;

     // Simular um procurar com os dados passados como parametro
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;

     AbreQryBeneficio(True, qryEvento.FieldByName('IdEventoGerador').AsInteger,iIdPlanoPrev);

     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end
  else begin
     if sTipoFormChamador = 'CO' // form chamador é o menu concessao
     then begin
        Caption := 'Concessão de Benefícios para Participante';
        MontaSelect.Filtro.Add(' ( (B.IDSITBENEFICIO = 4) OR (B.IDSITBENEFICIO = 6) ) ');
        sbtnInserir.Enabled := False;
        lblNomeBenef.Caption := '';
        dblkpcmbEvento.Enabled := True;

        // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
        if not dtmBaseDados.dbBaseDados.InTransaction
        then dtmBaseDados.dbBaseDados.StartTransaction;
        // edilaine - SOL 253577-18129 / PPM 1303078 - fim

     end
     else if sTipoFormChamador = 'SI' // form chamador é o menu simulacao
          then begin
             Caption := 'Simulação de Benefício para Participante';
             MontaSelect.Filtro.Add(' B.IDSITBENEFICIO = 8 ');
             lblNomeBenef.Caption   := '';
             dblkpcmbEvento.Enabled := True;

             If Not dtmBaseDados.dbBaseDados.InTransaction
              Then dtmBaseDados.dbBaseDados.StartTransaction;

          end
          else begin // form chamador é o menu Manutencao de Requerimento
             Caption := 'Manutenção de Processos de Benefícios para Participante - NÃO CONCEDIDOS';
             MontaSelect.Filtro.Add(' B.IDSITBENEFICIO IN (4,8,6) ');
             sbtnInserir.Enabled := False;
             lblNomeBenef.Caption := '';
             dblkpcmbEvento.Enabled := True;

             // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
             if not dtmBaseDados.dbBaseDados.InTransaction
             then dtmBaseDados.dbBaseDados.StartTransaction;
             // edilaine - SOL 253577-18129 / PPM 1303078 - fim

          end;
  end;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

  dbrgrpResgateParcelado.visible :=  (iIdEvento = 15); // SOL 63067 - KTN 524520
  dbedQtdeParcelas.visible       :=  (iIdEvento = 15); // SOL 63067 - KTN 524520
  lblQdeParcelas.visible         :=  (iIdEvento = 15); // SOL 63067 - KTN 524520
  pTempVincFunc := 0;
  sTipoFormChamador:=sTipoFormChamador;

  dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499
end;

procedure TfrmCadRequerBenefParticip.bbtnSairClick(Sender: TObject);
begin
  sNumerosProcessos := Inttostr(iNumeroProcesso);

 // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
 {se for requerimento e estiver com transacao em aberto, nao chamar a tela para conceder o beneficio}
 if (sTipoFormChamador = 'EV') and (DtmBaseDados.dbBaseDados.InTransaction) then
    bChamarConcessao := false;
 // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  inherited;

end;

procedure TfrmCadRequerBenefParticip.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  inherited; // NAO TIRAR O COMENTARIO
               // ESTA DANDO UMA MENSAGEM DE ERRO

end;

procedure TfrmCadRequerBenefParticip.FormActivate(Sender: TObject);
begin
  if bAbriuOutroForm
  then begin
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     Exit;
  end;
  inherited;

end;

procedure TfrmCadRequerBenefParticip.AtualizaEventosPrev(iIdPessJur,   iIdPlanoPrev, iIdPessoa,
                                                         iSeqProposta, iIdEventoGerador : Integer;
                                                         psDataVolta : string);
var sDataEfetivado,
    sDataVolta,
    strSQL      : string;
begin
    sDataEfetivado := ' TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', Date)) + ', ''DD/MM/YYYY'')';
    if Trim(psDataVolta) <> ''
    then sDataVolta := ', DATAVOLTA = TO_DATE(' + QuotedStr(psDataVolta) + ', ''DD/MM/YYYY'')'
    else sDataVolta := '  ';



    strSQL :=      ' WHERE   IDEVENTOSPREV IN '+
                   ' (SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV           '+
                   ' WHERE   IDPESSOA        = '+IntToStr(iIdPessoa)        +
                   ' AND     IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)     +
                   ' AND     IDPESSJUR       = '+IntToStr(iIdPessJur)       +
                   ' AND     SEQPROPOSTA     = '+IntToSTr(iSeqProposta)     +
                   ' AND    DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                   '                                 WHERE IDPESSOA     = '+IntToStr(iIdPessoa)+
                   '                                 AND   IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                   '                                 AND   IDPESSJUR    = '+IntToStr(iIdPessJur)+
                   '                                 AND    IDEVENTOGERADOR = '+IntToStr(iIdEventoGerador)+') '+
                   ' AND     IDEVENTOGERADOR = '+IntToStr(iIdEventoGerador) +
                   ' AND     FLGEFETIVADO <> 1 )';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT FLGEFETIVADO '+
                   ' FROM EVENTOSPREV '+ strSQL + sDataVolta);
    qryAux.Open;

    bAtualizaDados := qryAux.RecordCount > 0;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE EVENTOSPREV SET FLGEFETIVADO  = 1, '+
                   '                        DATAEFETIVADO = '+sDataEfetivado+
                   sDataVolta+ strSQL);



    try
      qryAux.ExecSql;
    except
    end;
    qryAux.Close;
end;

function TfrmCadRequerBenefParticip.ConverteBeneficioParaCotas(prValorReal : real) : real;
begin
  Result := 0;
  // Verificar e beneficio é em real ou em cotas
  if (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
  then begin
     frmAguarde.Mostra('Convertendo benefício em cotas ...');

     if qryBeneficio.FieldbyName('IndiceReajBenef').AsString = ''
     then begin
        frmAguarde.Apaga;
        MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
               'Verifique no Cadastro de Plano Previdenciário.',
               'Informação',mtInformation,[mbOk],0);
        Result := 0;
        Exit;
     end;

     // O beneficio é em cotas -> converter pelo indice
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  (MOECODIGO = '+qryBeneficio.FieldbyName('IndiceReajBenef').AsString+')'+
                    ' AND    (COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)) + ', ''DD/MM/YYYY'') ) ' +
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        frmAguarde.Apaga;
        qryAux.Close;
        MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
               'Verifique no Cadastro de Cotações da Moeda.',
               'Informação',mtInformation,[mbOk],0);
        Result := 0;
        Exit;
     end;

     qryAux.First;
     rValorDaCotaBenef := qryAux.FieldByName('CotValor').AsFloat;
     sDataDaCotaBenef  := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime);

     // Converter de cota para real
     if rValorDaCotaBenef = 0
     then begin
        MsgDlg('O índice de conversão do valor do benefício está zerado. '+
               'Verifique no Cadastro de Cotações da Moeda.',
               'Informação',mtInformation,[mbOk],0);
        Result := 0;
     end
     else Result  := prValorReal / rValorDaCotaBenef;
  end
  else Result := 0;
  frmAguarde.Apaga;
end; // ConverteBeneficioParaCotas


function TfrmCadRequerBenefParticip.ConverteBeneficioParaReal(prValorCotas : real; bEntra : Boolean) : real;
begin
  Result := 0;
  // Verificar e beneficio é em real ou em cotas
  if (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
  then begin
     frmAguarde.Mostra('Convertendo benefício para Real  ...');
     if qryBeneficio.FieldbyName('IndiceReajBenef').AsString = ''
     then begin
        frmAguarde.Apaga;
        MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
               'Verifique no Cadastro de Plano Previdenciário.',
               'Informação',mtInformation,[mbOk],0);
        Result := 0;
        Exit;
     end;
     // O beneficio é em cotas -> converter pelo indice
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  (MOECODIGO = '+qryBeneficio.FieldbyName('IndiceReajBenef').AsString+')'+
                    ' AND    (COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)) + ', ''DD/MM/YYYY'') ) ' +
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        frmAguarde.Apaga;
        qryAux.Close;
        MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
               'Verifique no Cadastro de Cotações da Moeda.',
               'Informação',mtInformation,[mbOk],0);
        Result := 0;
        Exit;
     end;
     qryAux.First;
     rValorDaCotaBenef := qryAux.FieldByName('CotValor').AsFloat;
     sDataDaCotaBenef  := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime);

     // Converter de cota para real
     if rValorDaCotaBenef = 0
     then begin
        MsgDlg('O índice de conversão do valor do benefício está zerado. '+
               'Verifique no Cadastro de Cotações da Moeda.',
               'Informação',mtInformation,[mbOk],0);
        Result := 0;
     end
     else Result  := prValorCotas * rValorDaCotaBenef;
  end
  else Result := 0;
  frmAguarde.Apaga;
end; // ConverteBeneficioParaReal

procedure TfrmCadRequerBenefParticip.reValorBeneficioMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Trim(dblkpcmbBeneficio.Text) = '' then Exit;

  // Se o beneficio estiver em branco, mostrar hint dizendo para digitar ou calcular
  if (Trim(reValorBeneficio.Text) = '') or (StrToFloat(ClienteNumero(reValorBeneficio.Text)) <= 0)
  then begin
     if (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString) = '')
     then if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
          then reValorBeneficio.Hint := 'Digite o valor do benefício e Clique no botão à direita caso deseje convertê-lo em Cotas. '
          else reValorBeneficio.Hint := 'Digite o valor do benefício. '
     else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';
     Exit;
  end;

  // Se beneficio estiver em cotas, mostrar no hint o valor em real
  // se estiver em real, mostrar no hint o valor em cotas
  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then reValorBeneficio.Hint := 'Valor em Real = '+FormatFloat('#0.00',rValorReal)+
                                '. Cota Utilizada = '+ FormatFloat('#0.000000',rValorDaCotaBenef)+
                                ' em '+sDataDaCotaBenef+'.'
  else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';
end;

procedure TfrmCadRequerBenefParticip.reValorBeneficioExit(Sender: TObject);
begin
  inherited;

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then rValorCotas := StrToFloat(ClienteNumero(reValorBeneficio.Text))
  else rValorCotas := 0;

  if (Trim(reValorBeneficio.Text) <> '') and (Trim(reValorBeneficio.Text) <> '0')
  then rValorReal  := StrToFloat(ClienteNumero(reValorBeneficio.Text))
  else rValorReal  := 0;

end;


procedure TfrmCadRequerBenefParticip.dbrgrpBenefProvisorioClick(
  Sender: TObject);
begin
  inherited;
  if dbrgrpBenefProvisorio.ItemIndex = 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;

    if (dsDet.DataSet.State = dsInsert) and (Trim(dbedPrazoProv.Text) = '')
    then begin
       dbedPrazoProv.Text := qryBeneficio.FieldByName('PrazoProvisorio').AsString;
       qryDet.FieldByName('PrazoProvisorio').AsInteger := qryBeneficio.FieldByName('PrazoProvisorio').AsInteger;
       dbedPercConc.Text  := '100';
       qryDet.FieldByName('PERCPROVISORIO').AsFloat := 100;
    end;

  end;
end;

procedure TfrmCadRequerBenefParticip.dbedPrazoProvExit(Sender: TObject);
var sDataFinal : string;
    iPrazoEmMeses : integer;
begin
  inherited;
  if Trim(dbedPrazoProv.Text) = '' then Exit;

  // Calcular data final do beneficio
  try
     iPrazoEmMeses := StrToInt(dbedPrazoProv.Text);
  except
     MsgDlg('Prazo Máximo de Concessão inválido.','Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  sDataFinal := CalculaDataAposPrazo(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                     iPrazoEmMeses
                                    );

  if Trim(sDataFinal) = '' then Exit;

  if (Trim(dtDataFinal.Text) <> '')
  then begin
     if dtDataFinal.Date <> StrToDate(sDataFinal) then
     begin
        if MsgDlg('A data final informada até o momento não coincide com o prazo informado : '+
                  ' [Data Informada - ' + FormatDateTime('dd/mm/yyyy', dtDataFinal.Date) + ' e  '+
                  ' Data após Prazo - ' + sDataFinal+']. '+
                  ' Deseja utilizar a MENOR data ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrYes
        then begin
           if StrToDate(sDataFinal) < dtDataFinal.Date  
           then begin

              if dbrgrpDataPrevista.ItemIndex = 1
              then qryDet.FieldByName('DataFinal').AsString  := sDataFinal
              else qryDet.FieldByName('DataFinalPrevista').AsString  := sDataFinal;

              if Trim(sDataFinal) <> '' then
              begin
                 dtDataFinal.Date             := StrToDate(sDataFinal);
                 dbrgrpDataPrevista.ItemIndex := 0;
              end;
           end;
           Exit;
        end;

        if MsgDlg(' Deseja alterar o prazo ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrYes
        then begin
           dbedPrazoProv.Text := '';
           dbedPrazoProv.SetFocus;
           Exit;
        end;
     end;
  end
  else
  begin
    dtDataFinal.Date              := StrToDate(sDataFinal);
    dbrgrpDataPrevista.ItemIndex  := 0;
  end;
end;



function TfrmCadRequerBenefParticip.ConfirmaBeneficio : boolean;
var sMsgErro: string;
begin
   Result := False;
   //Higor Nayde SOL - 173938 KINTANA - 1627112 Inicio
   //MostraDemonstrativoConcessao;     // edilaine - SOL 253577-17464 / PPM 955703 - comentado

   sParametrosDemonstra := '';   // edilaine - SOL 253577-17464 / PPM 955703
   GeraDemonstrativo();          // edilaine - SOL 253577-17464 / PPM 955703


   if MsgDlg('Deseja confirmar os resultados da concessão ?','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
   then
        Result := False
   else begin

////Douglas.Siqueira SOL=163064 Kintana= 1388980
  if (sbtnInserir.Enabled=FALSE )and (bConcedeuBeneficio) then
//  if (sbtnConceder.Enabled )and (bConcedeuBeneficio) then
     begin
     Qrydet.First;
     while not Qrydet.Eof do
        begin
           if (Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 1) and (Qrydet.FieldByName('FONTEPAGADORA').AsInteger = 1) then //FUNCEF
           begin
              if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>1) and (qrydet.FieldbyName('datafinal').Asstring = '') then
              begin
                 MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                 bbtnCancelarClick(Self);
                 Exit;
              end;
           end
           else
           if (Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 1) and (Qrydet.FieldByName('FONTEPAGADORA').AsInteger = 2) then //INSS
           begin
              if QryDet.FieldByName('FLGPAGAINSS').AsInteger = 1 then
              begin
              // Thiago Melo SOL 210200 Kintana 2027146

{                 if (QryDet.FieldByName('IdSitBeneficio').AsInteger<>3)
                   and (QryDet.FieldbyName('resgateparcelado').AsInteger<>1)   // SOL 209659 Kintana 2022632
                   then begin        }
                 if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>1) and (qrydet.FieldbyName('datafinal').Asstring = '') then begin

              // Thiago Melo SOL 210200 Kintana 2027146
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                    if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                      dtmBaseDados.dbBaseDados.RollBack;


                    bbtnCancelarClick(Self);
                    Exit;
                 end;
              end
              else
              begin
                 if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>2) {or (qry.FieldbyName('IdSitProcesso').AsInteger<>2)} then
                 begin
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                    if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                      dtmBaseDados.dbBaseDados.RollBack;


                    bbtnCancelarClick(Self);
                    Exit;
                  end;
              end;
           end
           else
           if Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 2 then ///Pag único
           begin
              if (Qrydet.RecordCount=1) then
                 begin
                 if (QryDet.FieldByName('IdSitBeneficio').AsInteger<>3) {or (qry.FieldbyName('IdSitProcesso').AsInteger<>3) } // then Thiago Melo SOL 210200 Kintana 2027146
                 // Thiago Melo SOL 210200 Kintana 2027146
                   and (QryDet.FieldbyName('resgateparcelado').AsInteger<>1)   // SOL 209659 Kintana 2022632
                   then begin
                 // Thiago Melo SOL 210200 Kintana 2027146
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                    if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                       dtmBaseDados.dbBaseDados.RollBack;


                    bbtnCancelarClick(Self);
                    Exit;
                    end
                 end
              else
              if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>3)
              //William Moreira da Silva - SiG 31971
              and (QryDet.FieldbyName('resgateparcelado').AsInteger<>1)  then
              //William Moreira da Silva - SiG 31971
              begin
                 MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;


                 bbtnCancelarClick(Self);
                 Exit;
              end;
           end;

        Qrydet.next;
        end;/// fim do while

     end;
////fim.Douglas.Siqueira SOL=163064 Kintana= 1388980

        //MostraDemonstrativoConcessao(True,formatdatetime ('hh:mm:ss',now));    // edilaine - SOL 253577-17464 / PPM 955703

        Result := True;
   end;
   //Higor Nayde SOL - 173938 KINTANA - 1627112 FIM
end;

procedure TfrmCadRequerBenefParticip.MostraDemonstrativoConcessao(const homologado :Boolean; const HoraHomologacao: String);//Higor Nayde SOL - 173938 KINTANA - 1627112
var dTotalBeneficio : double;
    sSQL, sSalarioNaDib   : string;
    sOpcoesContrib, sListaContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
    bAlgumPagadorPatro : boolean;
    dValorNaDib        : double;
    iIdBeneficio : Integer;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo da Concessão...');

   qryAux.Close;

   frmMostraAux.Caption := 'Resumo da Concessão de Benefício ... ';
   bAlgumPagadorPatro := False;

   // Exibir dados do participante
   If frmMostraAux = nil Then
      Application.CreateForm(TfrmMostraAux, frmMostraAux);

   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('----------------------------------------------------------------------------------------------');
      Add('                                DEMONSTRATIVO DE CONCESSÃO               - VERSÃO : '+Sistema.Versao);
      Add('                                                                           LOTE   : '+IntToStr(iIdLoteConcessao));
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                               DATA DA CONCESSÃO : '+FormatDateTime('dd/mm/yyyy', date)); 
      Add('----------------------------------------------------------------------------------------------');
      Add('Participante        : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add(PreparaStr('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString,50)+
          PreparaStr('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString,49));

      if qryTitular.FieldByName('FLGISENTOIRRF').AsInteger = 0
      then Add(PreparaStr(' ',50)+
               PreparaStr('Isento de Imposto de Renda : Não ', 49))
      else Add(PreparaStr(' ',50)+
               PreparaStr('Isento de Imposto de Renda : Sim ', 49));

      // Conta Bancaria
      Add('----------------------------------------------------------------------------------------------');
      Add('Conta Bancária Preferencial : ');

      //Renato Visoni SOL 149370/3861 Kintana 1149770
      qryContaBancaria.Close;
      qryContaBancaria.SQL.Clear;
      qryContaBancaria.SQL.Add('SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCONTAPREF,');
      qryContaBancaria.SQL.Add('  CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BANCO.NOME AS BANCO,');
      qryContaBancaria.SQL.Add('  AGENCIABANCARIA.NUMAGENCIA   , B.NUMBANCO  , CB.FLGCONTACONJUNTA');
      qryContaBancaria.SQL.Add('  FROM CONTABANCARIA  CB, PESSOA AGENCIA,');
      qryContaBancaria.SQL.Add(' PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA  , BANCO B');
      qryContaBancaria.SQL.Add(' WHERE CB.IDPESSOA =' +QryDet.FieldByName('IDPESSOA').AsString);
      qryContaBancaria.SQL.Add('  AND  CB.IDAGENCIA = AGENCIA.IDPESSOA AND');
      qryContaBancaria.SQL.Add('  CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND');
      qryContaBancaria.SQL.Add('  AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND ');
      qryContaBancaria.SQL.Add('  AGENCIABANCARIA.IDBANCO = B.IDPESSOA      AND ');

      If FazQuery( QryAux, 'SELECT * FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(iIdLoteConcessao)+ ' AND NVL(FLGRESGATE,0) = 1') Then Begin
        qryContaBancaria.SQL.Add('  NVL(FLGCONTARESGATE,0) = 1 ');
      end else begin
        qryContaBancaria.SQL.Add('  CB.FLGCONTAPREF = 1 ');
      end;

      qryContaBancaria.Open;
      //Renato Visoni SOl 149370/3861 Kintana 1149770



      if not qryContaBancaria.IsEmpty
      then begin
         Add('Banco    : '+qryContaBancaria.FieldByName('Banco').AsString);
         Add('Agência  : '+qryContaBancaria.FieldByName('Agencia').AsString);
         Add('Conta Nº : '+qryContaBancaria.FieldByName('ContaCorrente').AsString);
      end
      else begin
         Add(' < não cadastrada até o momento > ');
      end;
      Add('----------------------------------------------------------------------------------------------');

      { Reorganização dos dados }
      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString,50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString,50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString,50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));
(*
      // Dados na Patrocinadora
      Add('  ');
      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

      // Dados no Plano
      Add('  ');
      Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
      Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
      Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);
*)

      
      Add('----------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qry.FieldbyName('NumeroProcesso').AsString);
      Add('EVENTO : '+Trim(dblkpcmbEvento.Text)+ ' - DATA DO EVENTO : '+ FormatDateTime('dd/mm/yyyy', dtDataEvento.Date));
      Add('----------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS CONCEDIDOS :');
      qryDet.First;
      dTotalBeneficio := 0;
      while not qryDet.Eof do
      begin
         Add('----------------------------------------------------------------------------------------------');
         Add('- '+qryDet.FieldByName('Nome').AsString);
         Add(' ');
         Add(' '+PreparaStr('Data de Requerimento : '+qryDet.FieldByName('DataRequerimento').AsString, 50)+
             PreparaStr('Data de Concessão : '+FormatDateTime('dd/mm/yyyy', date), 49));

         if qryDet.FieldByName('FlgResgate').AsInteger = 0 // nao é resgate
         then begin
            Add(' '+PreparaStr('Data de Início no INSS : '+qryDet.FieldByName('DataInicioINSS').AsString,50)+
                PreparaStr('Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString,49));

            if (qryDet.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryDet.FieldByName('DATAFINALPREVISTA').AsString <> '')
            then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Prevista) : '+qryDet.FieldByName('DATAFINALPREVISTA').AsString,49))
            else if qryDet.FieldByName('DATAFINAL').AsString <> ''
                 then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Efetiva) : '+qryDet.FieldByName('DATAFINAL').AsString,49))
                 else Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final : <indefinida> ',49));

            Add(' '+PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRCALCINSS').AsFloat),50)+
                PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRINFINSS').AsFloat),49));
         end
         else begin // é resgate
            Add(' Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString);
         end;

         sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL(dtmAPrev.qry,
                                                     iIdPessJur,
                                                     iIdPlanoPrev,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     'AS',
                                                     FormatDateTime('yyyy/mm', qryDet.FieldByName('DataInicioFUND').AsDateTime)  
                                                    );

         Add(' Salário de Participação anterior ao Evento = R$ '+FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioNaDib))));



         dValorNaDib := PegaValorIntegral( dtmAPrev.qry,
                                           iNumeroProcesso,
                                           qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                           iIdTitular,
                                           qryDet.FieldByName('DATAINICIOFUND').AsString );
         




         Add(' '+
             PreparaStr('Valor do Benefício = R$ '+
               FormatFloat('#0.00', qryDet.FieldByName('VALORATUAL').AsFloat),50)+
             PreparaStr('Valor do Benefício Original = R$ '+
               FormatFloat('#0.00', dValorNaDib),49));
         

         
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(
           'SELECT H.VALORPREV '+#13#10+
           'FROM HSTBENEFBFCIARIO H, BENEFPLANPREV BPP, PARAMAPREV P '+#13#10+
           'WHERE H.IDLOTE = '+IntToStr(iIdLoteConcessao)+#13#10+
           'AND H.IDPESSJUR = '+IntToStr(iIdPessJur)+#13#10+
           'AND H.IDPESSOA = '+IntToStr(iIdTitular)+#13#10+
           'AND H.IDBENEFICIO = '+IntToStr(qryDet.FieldByName('IDBENEFICIO').AsInteger)+#13#10+
           'AND H.SEQPROPOSTA = 1 '+#13#10+
           'AND P.IDPESSOA = '+IntToStr(iidfundacao)+#13#10+
           'AND H.IDMOTIVO = P.IDMOTIVOQUITANT'+#13#10+
           'AND BPP.IDBENEFICIO = H.IDBENEFICIO '+#13#10+
           'AND BPP.IDPLANOPREV = H.IDPLANOPREV '+#13#10+
           'AND H.FLGDEVOLUCAO = 0 '+#13#10+
           'AND H.FLGENVIADO   = 0 '+ 
           'AND NVL(BPP.IDREGRAQUITANT,0) > 0 ');
         qryAux.open;

         if not qryAux.isempty then
           Add(' '+
               PreparaStr('   ==> Quitação Antecipada Calculada para o Benefício = R$ '+
                 FormatFloat('#0.00', qryAux.FieldByName('VALORPREV').AsFloat),99));
         

         dTotalBeneficio := dTotalBeneficio + dValorNaDib;

         qryDet.Next;
      end; // while not qryDet.Eof

      // FUNCEF Colocar o total de benefícios
      Add(' Total dos Benefícios do Processo : '+FormatFloat('#0.00', dTotalBeneficio));

      qryDet.First;

      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('----------------------------------------------------------------------------------------------');
      Add('=> VALORES A PAGAR / RECEBER                                                                                         ');

      Add('----------------------------------------------------------------------------------------------');
      Add('MÊS     ITEM                               PAGAR       DESCONTAR [ORIGINAL]  SRB  PLANO CONTAB');
      Add(' ');

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, H.VALORPREVMIN, '+
                 '  DECODE(BPP.FLGREFERENCIA,0,H.VALORSRB,NULL) VALORSRB,  '+
                 //BRUNO AZEVEDO SOL 163261 KINTANA 1392988
                 '   (SELECT BF.IDPLANPREVCONTAB  ' +
                 '    FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC ' +
                 '    WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB ' +
                 '    and BF.IDPLANOPREV      =  H.IDPLANOPREV ' +
                 '    AND BF.IDPESSOA         =  H.IDPESSOA ' +
                 '    AND BF.IDBENEFICIO      = H.IDBENEFICIO ' +
                 '    AND BF.NUMEROPROCESSO   = H.NUMEROPROCESSO ' +
                 '    AND BF.IDPESSJUR        = H.IDPESSJUR ' +
                 '    AND BF.IDTITULAR        = H.IDTITULAR ' +
                 '    AND BF.IDPLANOORIGEM    = H.IDPLANOORIGEM ' +
                 '    AND BF.SEQPROPOSTA      = H.SEQPROPOSTA ' +
                 '    AND rownum = 1) as Codigo ' +
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+


                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.NUMEROPROCESSO = '+ qry.FieldbyName('NumeroProcesso').AsString + //Renato Visoni SOL 155863 Kintana 1216997
                 ' AND    BPP.IDBENEFICIO  = H.IDBENEFICIO '+
                 ' AND    BPP.IDPLANOPREV  = H.IDPLANOPREV '+
                 ' AND    H.FLGDEVOLUCAO     = 0 '+
                 ' AND    H.FLGENVIADO       = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;


         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                          ,8)+
                 PreparaStr(FieldByName('Nome').AsString                                   ,34)+
                 PreparaStr(' '                                                            ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)    ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                   ,10)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrevMin').AsFloat) ,11)+
                 PreparaStr(FormatFloat('#0.00',FieldByName('VALORSRB').AsFloat)           ,11) +
                 PreparaStr(FieldByName('Codigo').AsString                                 ,10));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a devolver no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT C.NOME, CP.FLGPAGADOR, HST.MESREFERENCIA, HST.VALORESPERADO             '+
                 ' FROM   CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST '+
                 ' WHERE  HST.IDPESSJUR       = ' + IntToStr(iIdPessJur)  +
                 ' AND    HST.IDPLANOPREV     = ' + IntToStr(iIdPlanoPrev) +
                 ' AND    HST.IDPESSOA        = ' + IntToStr(iIdTitular) +
                 ' AND    HST.SEQPROPOSTA     = ' + IntToStr(iSeqProposta) +
                 ' AND    HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
                 ' AND    HST.FLGDEVOLUCAO    = 1 '+
                 ' AND    HST.FLGDESCFOLHA    = 1 '+
                 ' AND    HST.FLGCONCESSAO    = 1 '+
                 ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                 ' AND    CP.IDPLANOPREV      = HST.IDPLANOPREV     '+
                 ' AND    CP.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO  '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA');
         Open;

         while not Eof do
         begin
            if FieldByName('FLGPAGADOR').AsString <> 'C'
            then begin
               bAlgumPagadorPatro := True;
               Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                    PreparaStr(FieldByName('Nome').AsString                                    ,35)+
                    PreparaStr(' '                                                             ,1)+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,11)+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                    ,9)+'(*)');
            end
            else
               Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                    PreparaStr(FieldByName('Nome').AsString                                    ,35)+
                    PreparaStr(' '                                                             ,1)+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,11)+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                    ,09));

            Next;
         end;
      end;

      // Buscar Beneficios a devolver(descontar) no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+



                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 1 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                 ,35)+
                 PreparaStr(' '                                                          ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                 ,11)+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)  ,9));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a COBRAR no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT C.IDCONTRIBUICAO, C.NOME, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES, '+
                 '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                                '+
                 '        CP.FLGPAGADOR,                                                                 '+
                 '        HST.MESREFERENCIA, HST.VALORESPERADO  ,  hst.trgdtinclusao                     '+   // Add hst.trgdtinclusao
                 ' FROM   CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST '+
                 ' WHERE  HST.IDPESSJUR       = ' +  IntToStr(iIdPessJur)  +
                 ' AND    HST.IDPLANOPREV     = ' +  IntToStr(iIdPlanoPrev) +
                 ' AND    HST.IDPESSOA        = ' +  IntToStr(iIdTitular)  +
                 ' AND    HST.SEQPROPOSTA     = ' +  IntToStr(iSeqProposta) +
                 ' AND    HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+

                 ' AND to_date(to_char(hst.trgdtinclusao,''dd/mm/yyyy hh24:mi''),''dd/mm/yyyy hh24:mi'') >= to_date( '+QuotedStr(sdataInicioConcessao)+',''dd/mm/yyyy hh24:mi'')' + //Wylliam Leite da Silva SOL: 167480 KINTANA: 1519761

                 ' AND    HST.FLGDEVOLUCAO    = 0 '+
                 ' AND    HST.FLGDESCFOLHA    = 1 '+
                 ' AND    HST.FLGCONCESSAO    = 1 '+
                 ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                 ' AND    CPP.IDPESSJUR       = HST.IDPESSJUR       '+
                 ' AND    CPP.IDPLANOPREV     = HST.IDPLANOPREV     '+
                 ' AND    CPP.IDPESSOA        = HST.IDPESSOA        '+
                 ' AND    CPP.SEQPROPOSTA     = HST.SEQPROPOSTA     '+
                 ' AND    CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO  '+
                 ' AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV     '+
                 ' AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO  '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA ');
         Open;
         sOpcoesContrib     := '';
         iIdContribAnterior := -1;
         while not Eof do
         begin
                //if FieldByName('trgdtinclusao').asdate = date then   //Retirado o ">" do codigo FieldByName('trgdtinclusao').value >= date  //Wylliam Leite da Silva SOL 171837 KINTANA 1542017
                //if FormatDateTime('dd/mm/yyyy', FieldByName('trgdtinclusao').AsDateTime) = FormatDateTime('dd/mm/yyyy', date) then
                //begin
                      if FieldByName('FLGPAGADOR').AsString <> 'C' then
                      begin
                          bAlgumPagadorPatro := True;
                         Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                              PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                              PreparaStr(' '                                                             ,1)+
                              PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+
                              PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,10)+'(*)');
                      end
                      else
                         Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                              PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                              PreparaStr(' '                                                             ,1)+
                              PreparaStr('(+)'+FormatFloat('#0.00',0)                                    ,12)+
                              PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,10));
                 //end;

                   //if FieldByName('trgdtinclusao').asdate = date then begin //Wylliam Leite da Silva

                      iIdContribAtual    := FieldByName('IDCONTRIBUICAO').AsInteger;
                      if iIdContribAtual <> iIdContribAnterior               then
                      begin
                          sOpcoesContrib := sOpcoesContrib+#13+#10+
                                         PreparaStr(FieldByName('Nome').AsString    ,50)+
                                         PreparaStr(' '                                                   ,5)+
                                         PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE1').AsFloat) ,13)+
                                         PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE2').AsFloat) ,13)+
                                         PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE3').AsFloat) ,7);
                          iIdContribAnterior := FieldByName('IDCONTRIBUICAO').AsInteger;
                      end;
                //   end;
            Next;
         end;
      end;

      if bAlgumPagadorPatro
      then begin
         Add('(*) Contribuições Patronais. Estas contribuições serão enviadas para o CAP/CAR. ');
      end;

      // Mostrar opções de contribuições a cobrar
      Add('----------------------------------------------------------------------------------------------');
      Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
      Add('----------------------------------------------------------------------------------------------');
      Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
      Add(sOpcoesContrib);



      // SOL 132938
      Add(' ');
      Add('----------------------------------------------------------------------------------------------');
      Add('=> VALORES DE ATUALIZAÇÃO MONETÁRIA                                                           ');

      Add('----------------------------------------------------------------------------------------------');
      Add(sVlrATualMonBeneficio);
      Add(' ');
      Add(sVlrATualMonContrib);
      Add(' ');
      // SOL 132938


      { Exibir memória de calculo caso exista }
      sSQL := 'SELECT '+
              '  DET.IDCALCULO,   DET.IDDETCALCULO, DET.DESCRICAO, DET.VALOR, '+
              '  BEN.IDBENEFICIO, BEN.NOME AS NOMEBENEFICIO '+
              'FROM   '+
              '  DETCALCULO DET,   /* CALCULO CAL, */ RELBENEFPART REL, '+
              '  BENEFPLANPREV BPP, BENEFICIO BEN '+
              'WHERE '+

              '  REL.IDPESSJUR   = '+ IntToStr( iIdPessJur )         +' AND '+
              '  REL.IDPLANOPREV = '+ IntToStr( iIdPlanoPrev )       +' AND '+
              '  REL.IDPESSOA    = '+ IntToStr( iIdTitular )         +' AND '+

              '  REL.NUMEROPROCESSO = '+ IntToStr( iNumeroProcesso ) +' AND '+
                    //Marcio Sanches Spinosa SOL 214243 Kintana 2044934 - Inicio
//              '  DET.IDCALCULO = CAL.IDCALCULO AND '+
//              '  DET.IDCALCULO = REL.IDCALCULO AND '+
              '  DET.IDPESSOA = REL.IDPESSOA AND ' +
                    //Marcio Sanches Spinosa SOL 214243 Kintana 2044934 - Fim              
              '  REL.IDPLANOPREV = BPP.IDPLANOPREV AND '+
              '  REL.IDBENEFICIO = BPP.IDBENEFICIO AND '+

              '  BPP.IDBENEFICIO = BEN.IDBENEFICIO  '+

              //Marcio Sanches Spinosa SOL 214243 Kintana 2044934 - Inicio
              '  AND (trim(DET.descricao) IN (''CODIGO DO CARGO:'',  ' +
              ' ''% AD. NOTURNO:'', '+
              ' ''% ATS:'', '+
              ' ''% HR. SUPLEMENTAR:'', '+
              ' ''% INSALUBRIDADE:'', '+
              ' ''% PERICULOSIDADE:'', '+
              ' ''AÇÃO JUDICIAL:'', '+
              ' ''COMP. PESSOAL BNH:'', '+
              ' ''DIF. COMPENSAVEL BNH:'', '+
              ' ''VANT. PESSOAL BNH:'', ' +
              ' ''FUNCAOEXDIRETOR:'') OR ' +
              ' trim(DET.descricao) LIKE ''CODFUNC/%'' OR '+
              ' trim(DET.descricao) LIKE ''CODACPF/%'' OR '+
              ' trim(DET.descricao) LIKE ''CODADINC/%'') '+
              //Marcio Sanches Spinosa SOL 214243 Kintana 2044934 - Fim
              'ORDER BY '+
              '  BEN.NOME, REL.IDCALCULO, DET.IDDETCALCULO ';

      If FazQuery( QryAux, ssQL ) Then Begin

        Add('----------------------------------------------------------------------------------------------');
        Add('=> MEMÓRIA DE CÁLCULO ');
        Add('----------------------------------------------------------------------------------------------');
        Add('  DESCRIÇÃO                                                                  VALOR       ');

        While Not QryAux.Eof Do Begin

          Add( ' - '+PreparaStr( QryAux.FieldByName('NOMEBENEFICIO').AsString, 70 ) );
          Add( ' ' );

          iIdBeneficio := QryAux.FieldByName('IDBENEFICIO').AsInteger;

          While ( iIdBeneficio = QryAux.FieldByName('IDBENEFICIO').AsInteger ) And
                ( Not QryAux.Eof )
          Do Begin

            Add( '  '+PreparaStr( QryAux.FieldByName('DESCRICAO').AsString, 70 )+
                 PreparaStr( ' ', 05 )+
                 PreparaStr( QryAux.FieldByName('VALOR').AsString, 30 )

               );

            QryAux.Next;

          End; { While Not QryAux.Eof Do Begin }

        End; { While Not QryAux.Eof Do Begin }

      End; { If FazQuery( }

      Add('----------------------------------------------------------------------------------------------');
      Add('Legenda Plano Contábil                                                                        ');
      Add('Código    Descrição                                                                           ');

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         //BRUNO AZEVEDO SOL 163261 KINTANA 1392988
         SQL.Add(' SELECT distinct(SELECT BF.IDPLANPREVCONTAB ' +
                 '         FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC ' +
                 '         WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB ' +
                 '         and    BF.IDPLANOPREV      = H.IDPLANOPREV ' +
                 '         AND    BF.IDPESSOA         = H.IDPESSOA ' +
                 '         AND BF.IDBENEFICIO         = H.IDBENEFICIO ' +
                 '         AND BF.NUMEROPROCESSO      = H.NUMEROPROCESSO ' +
                 '         AND BF.IDPESSJUR           = H.IDPESSJUR ' +
                 '         AND BF.IDTITULAR           = H.IDTITULAR ' +
                 '         AND BF.IDPLANOORIGEM       = H.IDPLANOORIGEM ' +
                 '         AND BF.SEQPROPOSTA         = H.SEQPROPOSTA ' +
                 '         AND rownum <= 1 ) as  Codigo, ' +
                 '        (SELECT PPC.NOME ' +
                 '         FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC ' +
                 '         WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB ' +
                 '         and    BF.IDPLANOPREV      =  H.IDPLANOPREV ' +
                 '         AND    BF.IDPESSOA         =  H.IDPESSOA ' +
                 '         AND BF.IDBENEFICIO         = H.IDBENEFICIO ' +
                 '         AND BF.NUMEROPROCESSO      = H.NUMEROPROCESSO ' +
                 '         AND BF.IDPESSJUR           = H.IDPESSJUR ' +
                 '         AND BF.IDTITULAR           = H.IDTITULAR ' +
                 '         AND BF.IDPLANOORIGEM       = H.IDPLANOORIGEM ' +
                 '         AND BF.SEQPROPOSTA         = H.SEQPROPOSTA ' +
                 '         and rownum <= 1) as  Plano ' +
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    BPP.IDBENEFICIO = H.IDBENEFICIO '+
                 ' AND    BPP.IDPLANOPREV = H.IDPLANOPREV '+
                 ' AND    H.FLGDEVOLUCAO     = 0 '+
                 ' AND    H.FLGENVIADO       = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' ORDER BY 1, 2 ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('codigo').AsString                                ,10) +
                 PreparaStr(FieldByName('Plano').AsString                                 ,40));
            Next;
         end;
      end;
      //Higor Nayde SOL - 173938 KINTANA - 1627112  Inicio
      if(not homologado)then
       begin
          Add('----------------------------------------------------------------------------------------------');
          Add('                         BENEFÍCIO NÃO HOMOLOGADO - APENAS PARA CONFERÊNCIA ');
          Add('----------------------------------------------------------------------------------------------');
       end
      else
       begin
          Add('----------------------------------------------------------------------------------------------');
          Add('                           BENEFÍCIO HOMOLOGADO - '+HoraHomologacao);
          Add('----------------------------------------------------------------------------------------------');
       end;
      //Higor Nayde SOL - 173938 KINTANA - 1627112   FIm
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoConcessao

procedure TfrmCadRequerBenefParticip.reValorInfINSSEnter(Sender: TObject);
begin
  inherited;
  sValorINSSAntes := Trim(reValorInfINSS.Text);
end;

procedure TfrmCadRequerBenefParticip.sbtnAltDetClick(Sender: TObject);
var iItem : Integer;
begin
  inherited;
  if (not qryDet.Active) or (not qryEvento.Active) then Exit;

  if qryDet.State = dsEdit 
  then begin
     sBeneficioAnterior := IntToStr(qryDet.FieldByName('IdBeneficio').AsInteger);

     if qryRelBenefPart.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])
     then iIdCalculo := qryRelBenefPart.FieldByName('IDCALCULO').AsInteger;

     if qrySelecionaBenefRef.Active and
        qrySelecionaBenefRef.Locate('IDBENEFICIO',qryDet.FieldByName('IDBENEFREFEREN').AsInteger, [loCaseInsensitive])
     then dblkpcmbBenefReferencia.Text := qrySelecionaBenefRef.FieldByName('NOME').AsString;
     
     bReajustouINSS := True;

     BeneficioRiscoInss; //Darivaldo Alencar SIG 23985
  end;
end;

procedure TfrmCadRequerBenefParticip.dbrgrpBenefProvisorioEnter(
  Sender: TObject);
begin
  inherited;
  iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex;
end;

procedure TfrmCadRequerBenefParticip.dbrgrpBenefProvisorioExit(
  Sender: TObject);
begin
  inherited;
  if iProvisorioAntes <> dbrgrpBenefProvisorio.ItemIndex
  then bRecalculouProvisorio := False;

  iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex; 
end;

function TfrmCadRequerBenefParticip.EfetuaConcessao(iIdSitEscolhida : word;
                                                    var rValorAtualizado,
                                                        rValorAtualizadoINSS : double;
                                                    var sUltMesReajuste,
                                                        sUltMesReajusteINSS  : string;
                                                    var bErro                : boolean ) : word;

var iIdRegraCalculo,
    iIdRegraCalculoREF,
    iIdBenefPDV         : longint;
    bPreparoOK,
    bFlgIntContab       : boolean;
    sSQLValues,
    sDataReserva,
    sDataFinal,
    sMsgErro            : string;
    dSaldoCotas         : double;

    sDataInicioINSS     : String;

    dDataMov            : TDate;

begin

   Result := iIdSitEscolhida;

   bErro  := False;

   if iIdLoteConcessao <= 0
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesPagamento,
                                             
                                                       iFlgIncluiMesConc );
      if iIdLoteConcessao <= 0
      then begin
         bErro := True;
         MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
         Exit;
      end;

   end;

   //Renato Visoni SOL 135283 Kintana 803604
   if not TemContaResgate(iIdLoteConcessao,qryDet.FieldByName('IDPESSOA').asInteger) then begin
     sbtnCadContaCorrente.Click;
     bErro := True;
     Exit;
   end;
   //Renato Visoni SOL 135283 Kintana 803604
      
   with qryAux do
   begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT DATAPAGAMENTO');
     SQL.Add('FROM CTRLINTERFACE');
     SQL.Add('WHERE IDLOTE = '+IntToStr(iIdLoteConcessao));
     Open;

     if not(IsEmpty) and (FieldByName('DATAPAGAMENTO').AsDateTime < dtInicioFund.Date) then 
     begin
       bErro := True;
       MsgDlg('Atenção!!'+#13+#13+
              'O lote escolhido possui uma data de pagamento ('+qryAux.FieldByName('DATAPAGAMENTO').AsString+')'+#13+
              'anterior a data de inicio de beneficio - DIB (' + FormatFloat('dd/mm/yyyy', dtInicioFund.Date) + ').'+#13+#13+ 
              'Favor escolher outro lote.' , 'Lote com data anterior',mtError,[mbOk, mbHelp],0);
       iIdLoteConcessao := -1;  // edilaine - SOL 253577-17464 / PPM 955703
       Exit;
     end;

     sDataPagamentoLote := FieldByName('DATAPAGAMENTO').AsString;
     sDataAlimentacao   := FieldByName('DATAPAGAMENTO').AsString; //Renato Visoni SOL 124583 Kintana 633547
   end;
   


   qryTemporaria.Close;
   
   qryTemporaria.ParamByName('IdPlanoPrev').AsInteger := qryDet.FieldByName('IdPlanoORIGEM').AsInteger;
   qryTemporaria.ParamByName('IdBeneficio').AsInteger := qryDet.FieldByName('IdBeneficio').AsInteger;
   qryTemporaria.Open;

   // Se o participante, antes de requerer o beneficio, estava em
   // manutencao PDV (P), utilizar a regra gravada no evento
   // Senao, usar a regra do beneficio
   if UpperCase(Trim(sTipoSitFuncAntes)) = 'P'
   then begin
      if QRYTEMPORARIA.FieldByName('FlgResgate').AsInteger = 0
      then iIdRegraCalculo := BuscaRegraEventoPdv('B',iIdPessJur, iIdPlanoPrev,
                                                      iIdTitular, iSeqProposta,
                                                      iIdBenefPDV,
                                                      qryAux)
      else iIdRegraCalculo := BuscaRegraEventoPdv('R',iIdPessJur, iIdPlanoPrev,
                                                      iIdTitular, iSeqProposta,
                                                      iIdBenefPDV,
                                                      qryAux);
      // Se o beneficio pretendido quando o participante entrou em PDV
      // for o mesmo que está sendo requerido agora, usar as regras do beneficio
      // na epoca do PDV.
      // Se o participante estiver requerendo um benefício diferente,
      // usar as regras do proprio beneficio que está sendo requerido.
      if iIdBenefPDV = QRYTEMPORARIA.FieldByName('IdRegraCalculo').AsInteger
      then begin
         if iIdRegraCalculo <= 0
         then begin
            MsgDlg('Este participante se encontrava em Manutenção PDV, '+
                   'porém a Regra de Cálculo de Benefício para este caso não foi encontrada. '+
                   'Verifique. ','Informação',mtInformation,[mbOk],0);
            Exit;
         end;
      end
      else iIdRegraCalculo := QRYTEMPORARIA.FieldByName('IdRegraCalculo').AsInteger;
   end
   else iIdRegraCalculo := QRYTEMPORARIA.FieldByName('IdRegraCalculo').AsInteger;

  if sTipoFormChamador = 'SI'
  then if QRYTEMPORARIA.FieldByName('IdRegraSimula').AsInteger <= 0
       then Exit
       else iIdRegraCalculo := QRYTEMPORARIA.FieldByName('IdRegraSimula').AsInteger;


   // Preparar beneficio gravando-o no Historico de Beneficios
   if not dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.StartTransaction;

   if qryDet.FieldByName('FlgDataPrevista').AsInteger = 0
   then sDataFinal := qryDet.FieldByName('DataFinal').AsString
   else sDataFinal := qryDet.FieldByName('DataFinalPrevista').AsString;

   
   sUltMesReajuste := qryDet.FieldbyName('ULTMESREAJUSTE').AsString;

   
   // Inversão da ordem de preparo de beneficios para preparar o INSS antes da suplementacao
   // pois caso haja um reajuste a suplementação já tem que ver o valor do INSS reajustado

   
   // senão usar o primeiro dia do mês da DIB (Fundação)
   if qryBenefReferencia.FieldByName('FLGPAGAINSS').AsInteger = 1 then
   begin
     sDataInicioINSS  := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DataInicioINSS').AsDateTime);  
     sDataInicioRef   := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DataInicioINSS').AsDateTime);
   end
   else
     sDataInicioINSS  := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date);  

   
   if Trim(sDataInicioRef) = '' then
     sDataInicioRef   := FormatDateTime('dd/mm/yyyy', qryBenefReferencia.FieldByName('DATAINICIO').AsDateTime); 
   //

   { Para cada concessão de beneficio, gerar um único IDCALCULO }
   iIdCalculo := -1;

   if qryBenefReferencia.Locate('IdBeneficio', iIdBenefReferencia, [loCaseInsensitive])
   then begin

      if sTipoFormChamador <> 'SI'
      then iIdRegraCalculoREF := qryBenefReferencia.FieldByName('IdRegraCalculo').AsInteger
      else iIdRegraCalculoREF := qryBenefReferencia.FieldByName('IdRegraSimula').AsInteger;

      sUltMesReajusteINSS     := qryBenefReferencia.FieldbyName('ULTMESREAJUSTE').AsString;
      dValorSRB               := qryDet.FieldByName('VALORSRB').AsFloat;
      bPreparoOK              := PreparaBeneficioConcedido( qryAux,
                                                            qryDet.FieldByName('IdTitular').AsInteger,
                                                            qryDet.FieldByName('IdTitular').AsInteger,
                                                            qryDet.FieldByName('SeqProposta').AsInteger,
                                                            qryDet.FieldByName('IdPessJur').AsInteger,
                                                            qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                                                            qryDet.FieldByName('NumeroProcesso').AsInteger,
                                                            qryBenefReferencia.FieldByName('IdBeneficio').AsInteger,
                                                            prmIDMOTIVOFOLHABEN,
                                                            1, 
                                                            iIdRegraCalculoREF,
                                                            -1,
                                                            qryBenefReferencia.FieldByName('IdRegraPrimPagto').AsInteger,
                                                            qryBenefReferencia.FieldByName('IdRegraUltPagto').AsInteger,
                                                            qrydet.FieldByName('IdTpPagtoBenefic').AsInteger,
                                                            qryDet.FieldByName('CODPORTFORMA').AsInteger,
                                                            qryBenefReferencia.FieldByName('Nome').AsString,
                                                            sNomePatro, sNomePlano, sMatricula,
                                                            sDataInicioINSS,
                                                            sDataFinal,
                                                            qryBenefReferencia.FieldByName('flgCalcTodoMes').AsString,
                                                            qryBenefReferencia.FieldByName('ValorAtual').AsFloat,
                                                            0,
                                                            qryBenefReferencia.FieldByName('VALORTOTAL').AsFloat, 
                                                            True,
                                                            rValorAtualizadoINSS,
                                                            rValorAtualizadoINSS,
                                                            sUltMesReajusteINSS,
                                                            bErro,
                                                            bPreparaContrib13INSS,
                                                            sMsgErro,
                                                            iIdLoteConcessao,
                                                            
                                                            
                                                            qryDet.FieldByName('DATAINICIO').AsString,
                                                            
                                                            7,
                                                            qryDet.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                            dValorSRB,
                                                            iIdCalculo
                                                            , False, True, qryDet.FieldByName('IDPERFILINVEST').AsInteger  //edilaine - SIG55933
                                                            );

      if bErro or (not bPreparoOK)
      then begin
      if dtmBaseDados.dbBaseDados.InTransaction then //Jéssica Lana SOL 119077
         dtmBaseDados.dbBaseDados.RollBack;
         if Trim(sMsgErro) = '' then sMsgErro := 'Erro no Preparo do Benefício.';
         MsgDlg(sMsgErro+' O benefício será mantido como "Pendente de Concessão"  '+
               'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;
   end; // if Beneficio Referencia

   dValorSRB               := qryDet.FieldByName('VALORSRB').AsFloat;
   bPreparoOK := PreparaBeneficioConcedido(qryAux,
                             qryDet.FieldByName('IdTitular').AsInteger,
                             qryDet.FieldByName('IdTitular').AsInteger,
                             qryDet.FieldByName('SeqProposta').AsInteger,
                             qryDet.FieldByName('IdPessJur').AsInteger,
                             
                             qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                             qryDet.FieldByName('NumeroProcesso').AsInteger,
                             QRYTEMPORARIA.FieldByName('IdBeneficio').AsInteger,
                             prmIDMOTIVOFOLHABEN,
                             1, 
                             iIdRegraCalculo,
                             -1,
                             QRYTEMPORARIA.FieldByName('IdRegraPrimPagto').AsInteger,
                             QRYTEMPORARIA.FieldByName('IdRegraUltPagto').AsInteger,
                             
                             //por que não respeitava o que foi cadastrado na tela
                             qrydet.FieldByName('IdTpPagtoBenefic').AsInteger,
                             

                             
                             qryDet.FieldByName('CODPORTFORMA').AsInteger,
                             QRYTEMPORARIA.FieldByName('Nome').AsString,
                             sNomePatro, sNomePlano, sMatricula,
                             qryDet.FieldByName('DataInicio').AsString,
                             sDataFinal,
                             QRYTEMPORARIA.FieldByName('flgCalcTodoMes').AsString,
                             qryDet.FieldByName('ValorAtual').AsFloat,
                             qryDet.FieldByName('ValorCotas').AsFloat,
                             qryDet.FieldByName('VALORTOTAL').AsFloat, 
                             True,
                             rValorAtualizado,
                             rValorAtualizado,
                             sUltMesReajuste,
                             bErro,
                             bPreparaContrib13,
                             sMsgErro,iIdLoteConcessao,
                             qryDet.FieldByName('DataInicio').AsString,
                             7,
                             qryDet.FieldByName('FLGDATAPREVISTA').AsInteger,
                             dValorSRB,
                             iIdCalculo
                             , False, True, qryDet.FieldByName('IDPERFILINVEST').AsInteger  //edilaine - SIG55933
                             );
   if bErro or (not bPreparoOK)
   then begin
   if dtmBaseDados.dbBaseDados.InTransaction then //Jéssica Lana SOL 119077
      dtmBaseDados.dbBaseDados.RollBack;
   if Trim(sMsgErro) = '' then sMsgErro := 'Erro no Preparo do Benefício.';
      MsgDlg(sMsgErro+' O benefício será mantido como "Pendente de Concessão"  '+
            'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
      TiraSQL(qryAux);
      Result := 4;
      Exit;
   end;

   
   // SE A FUNDACAO CALCULAR A SUPLEMENTACAO BASEADA EM SRB-INSS, VERIFICAR
   // SE HOUVER MUDANCA DE VALOR DO INSS E ACERTÁ-LO

   if (Sistema.IdModulo = 454) and 
      (qryDet.FieldByName('FONTEPAGADORA').asinteger = 2) then // SOL 265717 PPM 1186709
   AtualizaEventosPrev(qryDet.FieldByName('IdPessJur').AsInteger,

                       qryDet.FieldByName('IdPlanoORIGEM').AsInteger,
                       qryDet.FieldByName('IdTitular').AsInteger,
                       qryDet.FieldByName('SeqProposta').AsInteger,
                       qry.FieldByName('IdEventoGerador').AsInteger,
                       ''); 

   // Chamar movimentacao de reservas
   bFlgIntContab := (IntegraBack.Contabilidade = 'S');


   // Para cada movimento de reserva feito, neste momento - de concessao do beneficio -
   // o sistema deve gerar o movimento de reserva efetivo e apagar a movreservatemp
   if qryTemporaria.FieldbyName('FlgResgate').AsInteger = 1
   then begin
      qryMovReservaTemp.First;
      while not qryMovReservaTemp.Eof do
      begin

         if qryMovReservaTemp.FieldbyName('IdBeneficio').AsInteger <>
            qryTemporaria.FieldbyName('IdBeneficio').AsInteger
         then begin
            qryMovReservaTemp.Next;
            continue;
         end;

         if qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat <= 0
         then begin

            qryMovReservaTemp.Next;  
            continue;
         end;

         //edilaine SIG20491 : inicio
         {if qryTemporaria.FieldByName('FlgDataIndiceRes').AsInteger = 0
         then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString
         else if qryTemporaria.FieldByName('FlgDataIndiceRes').AsInteger = 2 // usar Data do Requerimento
         then sDataReserva := qryDet.FieldByName('DataRequerimento').AsString
         else begin // usar data do efetivo pagamento. Esta data será informada pelo usuario
            PedeInfAux('Informe a Data do Efetivo Pagamento','Data do Efetivo Pagamento','',2,sDataReserva);

            if Trim(sDataReserva) = ''
            then begin
               MsgDlg('O benefício está configurado para abater a reserva com a cota da data do efetivo '+
                     'pagamento. A informação desta data é obrigatória. Verifique.','Erro',mtError,[mbOk],0);
               TiraSQL(qryAux);
               Result := 4;
               Exit;
            end;
         end;
         if Trim(sDataReserva) = '' then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString;
         }//edilaine SIG20491 : fim

         dSaldoCotas := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat -
                        qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;

         
         If qryEvento.FieldByName('FLGINTERNO').AsString = 'DC'
          Then dDataMov := StrToDate(sDataPagamentoLote)
          Else dDataMov := date;


         // SOL 132639 KINTANA 881704 Volta a comentar o código abaixo, pois esta duplicando eventos so tipo reb
         { Volta do código abaixo, pois não sabemos pq foi comentado }
         {if MoveReserva( qry.FieldByName('IdEventoGerador').AsString,
                         qryDet.FieldByName('IdTitular').AsString,
                         qryDet.FieldByName('SeqProposta').AsString,
                         sNomeTitular,
                         qryDet.FieldByName('IDBENEFICIO').AsString,
                         qryAux,
                         dtmAPrev.RegraAPrev,
                         sMsgErro,
                         qryDet.FieldByName('IDPESSJUR').AsString,
                         qryDet.FieldByName('IDPLANOPREV').AsString,
                         qryMovReservaTemp.FieldByName('IdTipoReserva').AsString, 
                         qryDet.FieldByName('IDPESSJUR').AsString,
                         qryDet.FieldByName('IDPLANOPREV').AsString,
                         qryMovReservaTemp.FieldByName('IdTipoReserva').AsString, 
                         bFlgIntContab,
                         OraNumero(qryMovReservaTemp.FieldByName('VlrAbatido').AsString),
                         
                         dDataMov,   
                         '',
                         qryDet.FieldByName('NUMEROPROCESSO').AsString,
                         'F',
                         qry.FieldByName('DtDireito').AsString,
                         1,
                         qryDet.FieldByName('VlrINFINSS').AsFloat,
                         StrToDate(sDataReserva),
                         OraNumero(FloatToStr(dSaldoCotas)),
                         sDataAlimentacao // Renato Visoni SOL 124089 Kintana 693423
                         ) <> 2
         then begin
            MsgDlg('Ocorreram erros ao movimentar a reserva relativa ao benefício. '+
                   'O benefício será mantido como "Pendente de Concessão"  '+
                   'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
            TiraSQL(qryAux);
            Result := 4;
            Exit;
         end;}
         // FIM SOL 132639 KINTANA 881704 Volta a comentar o código abaixo, pois esta duplicando eventos so tipo reb
         qryMovReservaTemp.Delete;
         

         

      end;
   end;


   bConcedeuBeneficio := True;
end; // EfetuaConcessao


procedure TfrmCadRequerBenefParticip.sbtnConcederClick(Sender: TObject);
var iIdSitBenef,
    iIdSitTemp  : integer;
    bSituacoesDiferentes : boolean;
    //Marcos Merola SOL161215  07/11/2011 Inicio
    iUser : String;
    query:TwwQuery;
begin
  inherited;
  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  //lstDadosCorrecao.clear;   // edilaine - SOL 262968 / PPM 1102753 - comentado

  //BRUNO AZEVEDO SOL 132938
  {sVlrATualMonBeneficio := '';         
  sVlrATualMonContrib   := ''; }
  //BRUNO AZEVEDO SOL 132938
  // edilaine - SOL 253577-17464 / PPM 955703 - fim

 // iUser   := inttostr(sistema.IdUsuario);
//
//  if (qryDet.Fieldbyname('TIPOBENEFICIO').asFloat <> 6) then
//  begin
//      if (((qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = 'CM'+Trim(iUser)) OR
//        (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = Trim(iUser)) OR
//        (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = 'CM'+Trim(iUser)) OR
//        (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = Trim(iUser)))) then
//        begin
//          MsgDlg('Você não possui permissão para efetuar a concessão do(s) benefício(s).','Informação',mtInformation,[mbOk],0);
//          Exit;
//        end
//
//  end;Retirado pelo SOL 206918
  //Marcos Merola SOL161215  07/11/2011 Fim

////douglas
 // iNumeroProcesso :=

  query:=TwwQuery.Create(Self);
  query.DataBaseName := 'BaseDados';
  query.Active:=false;
  query.Sql.Clear;
  query.Sql.add('SELECT FLGIMPEDCONC FROM PARAMAPREV');
  query.open;
  if (query.fieldbyname('FLGIMPEDCONC').text='1') then
       begin
        MsgDlg('Você não possui permissão para efetuar a concessão do(s) benefício(s).','Informação',mtInformation,[mbOk],0);
        Exit;
        end;

  query.Active:=false;
  query.destroy;
////douglas


  //Wylliam Leite da Silva
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioConcessao := qryAux.fieldByName('datenow').asstring;
  //Wylliam Leite da Silva

  // Conceder todos os benefícios do processo
  sbtnAlterarClick(Sender);

  // Se estiver em insercao ou edicao, nao permitir concessao
  if qryDet.State in [dsEdit, dsInsert]
  then begin
     MsgDlg(' O benefício não pode ser concedido antes de ser confirmado. '+
            ' Confirme a operação antes de concedê-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConceder.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Verificar se o motivo default na tabela de parametros está preenchido
  if prmIDMOTIVOFOLHABEN <= 0
  then begin
     MsgDlg('O parâmetro motivo da folha de benefício não está preenchido. '+
            'Utilize a tela de parâmetros para cadastrá-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConceder.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

    //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
  if Trim(qryDet.FieldByName('DataInicio').AsString) = ''
  then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
  end;

  if Trim(qryDet.FieldByName('DATAINICIOFUND').AsString) = ''
  then begin
    MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
  end;
  //BRUNO AZEVEDO SOL 156428 KINTANA 1235970

  if not qryBeneficio.Active

  then AbreQryBeneficio(True, qry.FieldByName('IdEventoGerador').AsInteger,qryDet.FieldByName('IdPlanoORIGEM').AsInteger);

  if (sistema.idmodulo <> 454)then begin

    If frmPedeBenefExigencia = Nil Then
       Application.CreateForm(TfrmPedeBenefExigencia, frmPedeBenefExigencia);

    with frmPedeBenefExigencia do
    begin
       // Modos de Concessao = N - concedido Normal
       //                      E - concedido em Exigencia
       //                      P - manter Pendente
       //                      C - nao conceder (Cancelar requerimento)
       ShowModal;
       case cModoConcessao of
         'N' : iIdSitBenef := 1;
         'C' : begin // Cancelar
                  if MsgDlg('Deseja realmente "NÃO CONCEDER" este benefício ? '+
                            ' Esta operação irá cancelar o requerimento do mesmo.','Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrYes
                  then iIdSitBenef := 6  // nao concedido
                  else iIdSitBenef := 4; // pendente de concessao
               end;
         'E' : iIdSitBenef := 7;
         'P' : iIdSitBenef := 4;
         'S' : Exit;
       else iIdSitBenef := 1;
       end; //case
    end;//with

  end else begin
     iIdSitBenef := 1;
  end;

  // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
  if (Sistema.IdModulo = 454) and (sTipoFormChamador = 'CO') then
  begin
    if not AssociaTaxas(false) then
       exit;
  end;
  // edilaine - SOL 253577-18094 / PPM 1269549 - fim


  qryDet.First;
  while not qryDet.Eof do
  begin
     if not ConcedeUmBeneficio(Sender, iIdSitBenef)
     then begin
        sbtnConceder.Down := False;
        TiraSQL(qryAux);
        Exit;
     end;
     qryDet.Next;
  end; // while

  // Se o processo só possuir um beneficio, atualizar situacao do processo
  // Caso contrario verificar se todos os beneficios do processo estao com a mesma
  // situacao
  if qryDet.RecordCount = 1
  then begin
     qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitBenef;
     qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitBenef];
  end
  else begin // processo possui + de 1 beneficio
     // Verificar se existem beneficios com situacoes diferentes
     iIdSitTemp := iIdSitBenef;
     bSituacoesDiferentes := False;
     qryDet.DisableControls;
     qryDet.First;
     while not qryDet.Eof do
     begin
        if (qryDet.FieldByName('IdSitBeneficio').AsInteger <> iIdSitTemp) and
          (not BeneficioDePagamentoUnico(qryDet.FieldByName('IdBeneficio').AsInteger) and
           not BeneficioComQuitacao(qryDet.FieldByName('IdBeneficio').AsInteger,
             qryDet.FieldByName('idplanoprev').AsInteger))
        then bSituacoesDiferentes := True;
        qryDet.Next;
     end;//while
     qryDet.EnableControls;

     if bSituacoesDiferentes
     then begin // existe + de 1 beneficio no processo e estao com situacoes diferentes
        MsgDlg('O Processo Nº '+IntToStr(iNumeroProcesso)+' possui benefícios com situações diferentes.' +
                  'Caso estas situações não sejam regularizadas o processo não terá sua situação alterada.',
                  'Informação', mtInformation, [mbOk], 0);
     end
     else begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
        qry.Edit; 
        qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
        qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitTemp];
     end;
  end; // else - if RecordCount = 1

  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;

  sbtnConceder.Down := False;
  //MsgDlg('Processo concedido com sucesso.', 'Informação',mtInformation,[mbOk, mbHelp],0);     // edilaine - SOL 253577-18129 / PPM 1303078 - comentado
  TiraSQL(qryAux);
  bbtnConfirmarClick(self);       // edilaine - SOL 253577-18129 / PPM 1303078
end;

function TfrmCadRequerBenefParticip.ConcedeUmBeneficio ( Sender : TObject; piIdSitBenef : integer ): boolean;
var 

    rValorAtualizado,
    rValorAtualizadoINSS : double;
    sMesFolha,
    sUltMesReajuste,
    sUltMesReajusteINSS,
    sDataFinalATestar    : string;
    bErro,
    bFolhaEfetivada      : boolean;
    cTipoEnvPrev         : char;
    sMsgErro                    : String;
    iIdPlanPrevContab           : Integer;
    idPessoa, Idtitular, Idbeneficio  : String; // Jéssica SOL125930
    sEventoGerador : String;                    // Jéssica SOL125930
    sIDContribuicao : String;                   // Jéssica SOL125930
    dCorrecaoMonetaria : Currency;  // SOL 132938
    sAnoMesAtual, sAnoMesFim : String;         // SOL 132938
    iNumRecebimento,  iIdContribuicao : INTEGER; // SOL 132938
begin
   // Conceder Um benefício do processo
   Result := False;

   //SOL 140042 Kintana 900220
   if qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2 then    //SOL 140042.6361 Kintana 1410792
   begin
      qryAux2.close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT DISTINCT DC.MESCOBRANCA ');
      qryAux2.SQL.Add(' FROM   DETCONCINSS DC ' );
      qryAux2.SQL.Add(' WHERE  DC.NUMPROCINSS   = ' + QuotedStr(qryDet.FieldByName('NUMPROCINSS').asString));
      qryAux2.SQL.Add(' Union All ');
      qryAux2.SQL.Add(' SELECT DISTINCT TC.MESPROCESSAMENTO ');
      qryAux2.SQL.Add(' FROM   TEMPCONCINSS TC ' );
      qryAux2.SQL.Add(' WHERE TC.NUMPROCINSS    = ' + QuotedStr(qryDet.FieldByName('NUMPROCINSS').asString));
      qryAux2.Open;

      if qryAux2.RecordCount > 1 then
      begin
         ShowMessage('Existe mais de um mês de cobrança de reembolso para os valores informados. Favor verificar no Reembolso INSS. ');
      end;
   end;
   //SOL 140042 Kintana 900220


   // SOL 125930
   // A
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT B.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' FROM BENEFICIO B, BENEFBFCIARIO BF' );
   qryAux2.SQL.Add(' WHERE B.IDBENEFICIO = BF.IDBENEFICIO');
   qryAux2.SQL.Add(' AND B.IDBENEFICIO =' + QuotedStr(qryDet.FieldByName('IDBENEFICIO').asString));
   qryAux2.SQL.Add(' AND BF.IDPESSOA =' + QuotedStr(qryDet.FieldByName('IDPESSOA').asString));
   qryAux2.SQL.Add(' AND BF.IDTITULAR =' + QuotedStr(qryDet.FieldByName('IDTITULAR').asString));
   qryAux2.SQL.Add(' AND BF.IDPLANOPREV =' + QuotedStr(qryDet.FieldByName('IDPLANOPREV').asString));
   qryAux2.SQL.Add(' AND BF.IDPESSJUR =' + QuotedStr(qryDet.FieldByName('IDPESSJUR').asString));
   qryAux2.SQL.Add(' AND BF.FONTEPAGADORA = 1');
   qryAux2.Open;

   if not qryAux2.IsEmpty then
        begin
                sEventoGerador := qryAux2.FieldByname('IDEVENTOGERADOR').asString
        end
   else
        begin
                sEventoGerador:= '-1';
        end;
   // FIM - A



   // B
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT D.IDPESSOA, D.IDTITULAR FROM DEPENTIT D WHERE D.IDPESSOA = '+QuotedStr(qryDet.FieldByName('IdPessoa').asString));
   QryAux2.SQL.Add(' AND D.MATRICULA = ' + QuotedStr(lblMatricula.caption)); //Renato Visoni SOL 126697 Kintana 665666
   qryAux2.Open;
   Idtitular :=  qryAux2.FieldByname('IDTITULAR').asString;
   idPessoa  :=  qryAux2.FieldByname('IDPESSOA').asString;
   // FIM - B



   // C
   qryAux2.close;
   qryAux2.SQL.Clear;
   // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
   qryAux2.SQL.Add('SELECT B.IDCONTRIBUICAO ');
   qryAux2.SQL.Add('  FROM BENEFXTAXA B ');
   qryAux2.SQL.Add(' WHERE B.IDBENEFICIO ='+qryDet.FieldByName('IDBENEFICIO').asString );
   {
   qryAux2.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add('WHERE C.IDEVENTOGERADOR = EP.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA  ='+ QuotedStr(IDTITULAR));
   qryAux2.SQL.Add(' AND EP.IDEVENTOGERADOR ='+ sEventoGerador); }
   // edilaine - SOL 253577-18094 / PPM 1269549 - fim
   qryAux2.Open;
   if not qryAux2.IsEmpty then
   begin
     While not qryAux2.eof do
     begin
       sIDContribuicao := sIDContribuicao + IntToStr(qryAux2.FieldByname('IDCONTRIBUICAO').AsInteger) + ',';
       qryAux2.next;
     end;
     sIDContribuicao := Copy(sIDContribuicao,1, length(sIDContribuicao)-1);
     sIdContribuicaoAlteradores := sIDContribuicao; //132938 BRUNO AZEVEDO
   end;
   // FIM - C


   // LOGICA
   //BRUNO AZEVEDO SOL 154040 KINTANA 1167990
   if (not qryAux2.IsEmpty) and (qryDet.FieldByName('FLGPECULIO').asString <> '1') then
   begin
     if (Idtitular = idPessoa) then
     begin
       qryAux2.close;
       qryAux2.SQL.Clear;
       qryAux2.SQL.Add('SELECT * FROM CONTRIBPREVPARTP C WHERE IDPESSJUR = '+ qryDet.FieldByName('IDPESSJUR').asString);
       qryAux2.SQL.Add(' AND IDPESSOA = '+QuotedStr(IDPESSOA));
       qryAux2.SQL.Add(' AND IDPLANOPREV = '+ qryDet.FieldByName('IDPLANOPREV').asString);
       qryAux2.SQL.Add(' AND IDCONTRIBUICAO IN ('+ sIDContribuicao +')');
       qryAux2.Open;
       if qryAux2.IsEmpty then
       begin
         MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Participante', mtInformation, [mbOK], 0);
         Result := False;
         Exit;
       end
     end
     else
     begin
       qryAux2.close;
       qryAux2.SQL.Clear;
       qryAux2.SQL.Add('SELECT * FROM NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CP ');
       qryAux2.SQL.Add('WHERE IDRESPNUCLEO = ' + QuotedStr(IDPESSOA));
       qryAux2.SQL.Add(' AND IDTITULAR = ' + QuotedStr(Idtitular));
       qryAux2.SQL.Add(' AND N.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR');
       qryAux2.SQL.Add(' AND CP.IDCONTRIBUICAO IN (259, 633, 500) ');
       qryAux2.Open;
       if qryAux2.IsEmpty then
       begin
         MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Núcleo Familiar', mtInformation, [mbOK], 0);
         Result := False;
         Exit;
       end
     end;
   end;
   {else
   begin
     //MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Participante', mtInformation, [mbOK], 0);
     //Result := False;
     //Exit;
   end;}


  {**Alteração anterior **
   //Aposentado
     qryAux2.close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' SELECT * FROM CONTRIBPREVPARTP ');
     qryAux2.SQL.Add(' WHERE IDPESSJUR = ' + qryDet.FieldByName('IDPESSJUR').asString);
     qryAux2.SQL.Add(' AND IDPESSOA  ='    + qryDet.FieldByName('IDPESSOA').asString);
     qryAux2.SQL.Add(' AND IDPLANOPREV = ' + qryDet.FieldByName('IDPLANOPREV').asString);
     qryAux2.SQL.Add(' AND IDCONTRIBUICAO IN (''633'' ,''259'', ''500'')  ');

     qryAux2.Open;

     if qryAux2.IsEmpty then begin
       MessageDlg('Não é possível conceder benefício sem a contribuição vinculada ao participante', mtInformation, [mbOK], 0);
       Result := False;
       Exit;
     end;

   end else begin
   //Pensionista

     qryAux2.close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' SELECT * FROM NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CP ');
     qryAux2.SQL.Add(' WHERE IDRESPNUCLEO = ' + QuotedStr(IDPESSOA));
     qryAux2.SQL.Add(' AND IDTITULAR =      ' + QuotedStr(IDTITULAR));
     qryAux2.SQL.Add(' AND N.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR ');
     qryAux2.SQL.Add(' AND CP.IDCONTRIBUICAO IN (''259'', ''633'', ''500'') ');

     qryAux2.Open;

     if qryAux2.IsEmpty then begin
       MessageDlg('Não é possível conceder benefício sem a contribuição vinculada ao Núcleo familiar', mtInformation, [mbOK], 0);
       Result := False;
       Exit;
     end;

   end; }

// Dependendo da situacao do beneficio, nao faz sentido concede-lo novamente
   if (qryDet.FieldByName('IdSitBeneficio').AsInteger in [1,3,5])
   then begin
      if MsgDlg(' O benefício '+qryDet.FieldByName('Nome').AsString+' não pode ser concedido. '+
                'Situação : '+ qryDet.FieldByName('Descricao').AsString+#13+
                'Deseja conceder os outros benefícios ? ',
                'Confirmação',mtConfirmation,[mbYes,mbNo, mbHelp],0) = mrNo
      then Result := False
      else Result := True;
      Exit;
   end;

   //Ádler Souza - SOL 132110 KINTANA 758869
   { //Renato Visoni SOL 118811 Kintana 569080
   if not (ComparaPLanoContabil(qryDet.FieldByName('IDPESSOA').AsInteger,qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger, qryDet.FieldByName('IDPLANOPREV').AsInteger, qryDet.FieldByName('IDTITULAR').AsInteger)) then begin
     Result := False;
     Exit;
   end;
   //Renato Visoni SOL 118811 Kintana 569080 }

   qryBeneficio.Locate('IdBeneficio',qryDet.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);
//SIG84530 -inicio
//   //William Moreira da Silva - SOL 243165 KTN 581923
//   if (qryDet.FieldByName('FONTEPAGADORA').asInteger <> 2) and
//      (iIdEvento <> 336)  then //Peterson Victor SIG32846
//   begin
//         // Renato Visoni SOL 123843 Kintana 636875
//         if not ComparaValorReservaComHistorico(QryAux,qryDet.FieldByName('IDPESSOA').asString,
//                                                qryDet.FieldByName('IDPESSJUR').asString,
//                                                qryDet.FieldByName('IDPLANOPREV').asString, false) then begin    // edilaine - SOL 253577-18129 / PPM 1303078
//           Result := False;
//           // edilaine - SOL 253577-18129 / PPM 1303078 - incio
//           bbtnCancelarClick(self);
//           if sRequerimento then
//              sbtnAlterar.enabled := false;
//           // edilaine - SOL 253577-18129 / PPM 1303078 - fim
//           Exit;
//         end;
//   end;
//   //William Moreira da Silva - SOL 243165 KTN 581923
//   // Renato Visoni SOL 123843 Kintana 636875
//SIG84530 -fim

   // Preencher qual é o beneficio de referencia
   if (qryDet.Active) and (qryDet.FieldByName('IDBENEFREFEREN').AsInteger > 0)
   then iIdBenefReferencia  := qryDet.FieldByName('IDBENEFREFEREN').AsInteger
   else if (Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> '')
        then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
        else iIdBenefReferencia  := -1;

   // Verificar se existe algum benefício obrigatorio no evento que não foi
   // requerido
   if not VerificaBeneficioObrigatorio then Exit;

   // Executar regra de elegibilidade
   if (piIdSitBenef <> 4) and (piIdSitBenef <> 6)
   then bbtnElegibilidadeClick(Sender);

   if not bConcedeBeneficio
   then Exit;


   // Se a situacao do beneficio for "Concedido Normal" (sit = 1)
   // Preparar o beneficio inserindo-o na benefbfciario
   if piIdSitBenef = 1
   then begin
      // Se o pagamento for para Folha de Beneficio e nao tem portador forma preenchido
      // Verificar se participante possui conta bancaria
      if (qryDet.FieldByName('FLGFORMAPAGTO').AsString = 'F') and
         (Trim(dblkpcmbPortForma.Text) = '') and
         (qryContaBancaria.IsEmpty)
      then begin
         MsgDlg(' Este participante não possui Conta Bancária cadastrada. '+
                ' Cadastre pelo menos uma conta para conceder o benefício.',
                'Informação',mtInformation,[mbOk],0);
         Exit;
      end;

      // Se for um beneficio de resgate e tiver portador forma indicado
      // sugerir ao usuario que preencha a agencia para credito
      if (qryBeneficio.FieldByName('FLGDESTBENEF').AsString <> 'E') and 
         (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) and
         (Trim(dblkpcmbPortForma.Text) <> '') and
         (Trim(dblkpcmbAgencia.Text) = '')
      then begin
         if MsgDlg(' Este participante não possui Agência para Crédito cadastrada. '+
                   ' Deseja cadastrar antes de conceder o benefício ? ',
                   'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes
         then Exit;
      end;

      
      If (qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E') AND
         (qryEPP.FieldByName('TEM_CONTA').AsString = '0') Then
      Begin
        If MsgDlg(' Esta EPP não possui Conta BAncária cadastrada. '+
                  ' Deseja cadastrar antes de conceder o benefício ? ',
                  'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes Then
          Exit;
      End;
      

      // SINCRONISMO : Verificar se a Folha de Benefício do mês da data de inicio
      //               do pagamento já foi efetivada.
      //               Se sim, informar ao usuário que o benefício só será pago
      //               no mês posterior.

      sMesFolha       := FormatDateTime('yyyy/mm', qryDet.FieldByName('DataInicio').AsDateTime);

      bFolhaEfetivada := VerificaFechamento( qryDet.FieldByName('IdPessJur').AsInteger,
                                             cteIdModuloFolhaBen,
                                             sMesFolha,
                                             'E' ,cTipoEnvPrev);
      if bFolhaEfetivada
      then begin
         if MsgDlg(' A Folha de Benefícios do mês "'+sMesFolha+'" já foi efetivada. '+
                   ' Deseja conceder o benefício ? ',
                   'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
         then Exit
         else begin
            if MsgDlg(' Este benefício será concedido para a próxima Folha de Benefícios em aberto. Confirma ? ',
                      'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
            then Exit;
         end;
      end;

      iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                           frmCadRequerBenefParticip.Caption,
                                                           qryDet.FieldByName('NumeroProcesso').AsInteger,
                                                           qryDet.FieldByName('IdPessJur').AsInteger,
                                                           qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                                           qryDet.FieldByName('IdTitular').AsInteger,
                                                           qryDet.FieldByName('IdPessoa').AsInteger,
                                                           qryDet.FieldByName('IdBeneficio').AsInteger,
                                                           qryDet.FieldByName('ValorAtual').AsFloat,
                                                           True); // Requerimento = False, Outras = True
      if iIdUsuarioAutoriza < 0
      then begin
         MsgDlg('Concessão de Benefício não permitida por exceder valor limite e não ter autorização. Verifique. ','Erro',mtError,[mbOk],0);
         Abort;
      end;


      piIdSitBenef := EfetuaConcessao(piIdSitBenef,
                                     rValorAtualizado,
                                     rValorAtualizadoINSS,
                                     sUltMesReajuste,
                                     sUltMesReajusteINSS, bErro);
      if bErro then Exit;
      // SOL 132938

      {If Trim(DbLAlterador.Text) = 'Sim' Then Begin
         With qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE '+
                    ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));
            Open;

            sAnoMesFim :=  qryAux.FieldByName('MESREFERENCIA').Asstring;

            if qryDet.FieldByName('DATAINICIO').Asstring <> '' then
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
            else
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);

            while  sAnoMesAtual <= sAnoMesFim do
            begin

               If Not CalculaAlteradores('B', sAnoMesAtual,
                                      qryDet.FieldByName('ValorAtual').AsFloat,
                                      dCorrecaoMonetaria,
                                      -1,-1)
               Then Begin
                  dtmBaseDados.dbBaseDados.RollBack;
                  MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                  TiraSQL(qryAux);
                  Exit;
               End;

             // Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB
             sSQL := 'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO FROM '+
                     'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                     '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                     ' FROM HSTCONTRIBPREV HCP '+
                     ' WHERE                   '+
                     '  HCP.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString      +' AND '+
                     '  HCP.IDMOTIVO = '+ inttostr(prmIdMotivoContrib)                 +' AND '+
                  //   '  HCP.IDLOTE   = '+ IntToStr(iIdLoteConcessao)                   +' AND '+
                     '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                +' ) AND '+
                     '  H.Idcontribuicao in ( ' +sIDContribuicao +' ) ';

             If FazQuery(QryAux, sSQL) Then Begin

               iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
               iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

               If iNumRecebimento > 0 Then Begin
                 // Calcular Alterados
                   If Not CalculaAlteradores('C', sAnoMesAtual,
                                             qryDet.FieldByName('ValorAtual').AsFloat,
                                             dCorrecaoMonetaria,
                                             iIdContribuicao, iNumRecebimento,0)
                   Then Begin
                     dtmBaseDados.dbBaseDados.RollBack;
                     MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                     TiraSQL(qryAux);
                     Exit;
                   End;
               END;
             END;
             sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            end;
         end;
      end;       }
      // SOL 132938
   end; 

   // Se a situacao final do beneficio for 6 (nao concedido)
   // devolver para a reserva o valor que havia sido abatido
   if (piIdSitBenef = 6) and (qryDet.FieldByName('FlgResgate').AsInteger = 1)
   then begin
      if not DevolveReserva(qryDet.FieldByName('IdBeneficio').AsInteger, True)
      then begin
         MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
                'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
                'Verifique. ','Informação',mtInformation,[mbOk],0);
         Exit;
      end;
   end;

   if piIdSitBenef = 6
   then bNAOConcedeuBeneficio := True;

   // Gravar situacao final do beneficio na qryDet (BenefBfciario)
   qryDet.DisableControls;
   qryDet.Edit;

   
   if iIdUsuarioAutoriza > 0
   then qryDet.FieldByName('USUARIOALT').AsInteger := iIdUsuarioAutoriza;

   // Se o preparo de beneficio atualizou o beneficio, gravar os dados
   // agora, pois senao o requerimento irá substitui-los
   if Trim(sUltMesReajuste) <> ''
   then begin
      qryDet.FieldByName('UltMesReajuste').AsString   := sUltMesReajuste;
      qryDet.FieldByName('ULTVALORATUALREAJ').AsFloat := qryDet.FieldByName('ValorAtual').AsFloat;
      qryDet.FieldByName('ValorAtual').AsFloat        := rValorAtualizado;
      qryDet.FieldByName('ValorCalculado').AsFloat    := rValorAtualizado;
      qryDet.FieldByName('VALORTOTAL').AsFloat        := rValorAtualizado;

      if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
      then rValorCotas := rValorAtualizado  // beneficio em cotas
      else rValorReal  := rValorAtualizado; // beneficio em real
   end
   else begin
      rValorCotas := qryDet.FieldByName('ValorCotas').AsFloat;
      rValorReal  := qryDet.FieldByName('ValorAtual').AsFloat;
   end;

   qryDet.FieldByName('IdSitBeneficio').AsInteger     := piIdSitBenef;
   qryDet.FieldByName('Descricao').AsString           := vetDescBeneficio[piIdSitBenef];

   if sTipoFormChamador = 'CO'
   then qryDet.FieldByName('DataConcessao').AsDateTime := Date;

   
   
   If FazQuery(qryAux, ' SELECT BF.IDSITBENEFICIO, BF.VALORATUAL '+
                       ' FROM BENEFBFCIARIO BF, MOVBENEF MB '+
                       ' WHERE BF.IDPESSOA       = '+qryDet.FieldByName('IdPessoa').AsString+
                       '   AND BF.IDBENEFICIO    = '+qryDet.FieldByName('IdBeneficio').AsString+
                       '   AND BF.NUMEROPROCESSO = '+qryDet.FieldByName('NumeroProcesso').AsString+
                       '   AND BF.IDPESSOA       = MB.IDPESSOA '+
                       '   AND BF.IDBENEFICIO    = MB.IDBENEFICIO '+
                       '   AND BF.NUMEROPROCESSO = MB.NUMEROPROCESSO '+
                       '   AND MB.MOTRETENC      = 8') Then
   
   Begin
     If ((qryaux.FieldByName('IdSitBeneficio').AsInteger = 3) and
        (qryDet.FieldByName('RESGATEPARCELADO').AsInteger <> 1)) //MARCELO ALMEIDA - SOL 63067 - KTN 524520
     Then
     Begin
       rValorReal                                     := qryAux.FieldByName('valoratual').AsFloat;
       rValorCotas                                    := qryAux.FieldByName('valoratual').AsFloat;
       qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
       qryDet.FieldByName('DATAFINAL').AsString       := qryDet.FieldByName('DATAINICIO').AsString; 
     End;
   End;
   

   // Se o beneficio for de pagamento unico, colocar como encerrado, porque a
   // folha de beneficio nao encerra
   

   
   //verifica o cadastro e não a forma de pgto do benefício
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA '+
                 ' FROM   TPPAGTOBENEFICIO T   '+
                 ' WHERE  T.IDTPPAGTOBENEFIC = '+IntToStr(qrydet.FieldByName('IdTpPagtoBenefic').AsInteger));
   qryAux.Open;

   //MARCELO ALMEIDA - SOL 63067 - KTN 524520
   if ((qryAux.FieldByName('FlgFrequencia').AsString = 'U') and (qryDet.FieldByName('RESGATEPARCELADO').AsInteger <> 1))
   //MARCELO ALMEIDA - SOL 63067 - KTN 524520
   then begin
      qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
      qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString;
      piIdSitBenef := 3;
   end;
   

   // Se o beneficio tem datafinal <= MESATUAL
   // Entao Se a data final for no mes ATUAL (mes do lote)
   //       Entao Se o parametro de concessao for para conceder até mes anterior
   //             Entao NAO ENCERRAR BENEFICIO e NAO PAGAR MES ATUAL
   //             Senao ENCERRAR BENEFICIO e PAGAR MES ATUAL
   //       Senao // data final anterior ao mes atual
   //             ENCERRAR BENEFICIO e PAGAR ULTIMO MES

   if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
   then sDataFinalATestar := Trim(qryDet.FieldByName('DATAFINALPREVISTA').AsString)
   else sDataFinalATestar := Trim(qryDet.FieldByName('DATAFINAL').AsString);

   if (sDataFinalATestar <> '') and
      (Copy(sDataFinalATestar,7,4)+'/'+Copy(sDataFinalATestar,4,2) <= sAnoMesPagamento)
      //MARCELO ALMEIDA - SOL 63067 - KTN 524520
      and (qryDet.FieldByName('RESGATEPARCELADO').AsInteger <> 1)
      //MARCELO ALMEIDA - SOL 63067 - KTN 524520
   then begin
      if (Copy(sDataFinalATestar,7,4)+'/'+Copy(sDataFinalATestar,4,2) = sAnoMesPagamento)
      then begin


         if iFlgIncluiMesConc = 0
         then begin
            qryDet.FieldByName('IdSitBeneficio').AsInteger := 1;
         end
         else begin
            if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
            then qryDet.FieldByName('IdSitBeneficio').AsInteger := 2
            else begin
               qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
               
               if Trim(qryDet.FieldByName('DATAFINAL').AsString) = ''
               then qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString; 
            end;
         end;
      end
      else begin
         if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
         then qryDet.FieldByName('IdSitBeneficio').AsInteger := 2
         else begin
            qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
            
            if Trim(qryDet.FieldByName('DATAFINAL').AsString) = ''
            then qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString; 
         end;
      end;
      piIdSitBenef := qryDet.FieldByName('IdSitBeneficio').AsInteger;
   end;

  
  // Regra para indicar Entidade Contábil/Financeira.
  // Se não houver regra cadastrada gravar nulo senão
  // executar regra

  If Trim(qryBeneficio.FieldByName('IDRGPLANPREVCONT').AsString) <> ''
   Then Begin
     iIdPlanPrevContab := ExecutaRegraPlanPrevContab(qryAux,
                                                     qryBeneficio.FieldByName('IDRGPLANPREVCONT').AsInteger,
                                                     iIdPessJur,
                                                     iIdPlanoPrev,
                                                     iIdTitular,
                                                     iSeqProposta,
                                                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                     rOpcao1,
                                                     rOpcao2,
                                                     rOpcao3,
                                                     FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                                     FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                                     sDataDemissao,
                                                     FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  
                                                     sFlgInternoAntes,
                                                     sFlgInternoDepois,
                                                     sIdSitPartAntes,
                                                     sIdSitPlanAntes,
                                                     sIdSitFuncAntes,
                                                     sIdSitPartDepois,
                                                     sIdSitPlanDepois,
                                                     sIdSitFuncDepois,
                                                     1,
                                                     0,
                                                     bErro,
                                                     sMsgErro);
     If bErro
      Then MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
      Else qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger := iIdPlanPrevContab;
   End;

  

  { No caso de concessão fora do convênio com o INSS }
  { automáticamente reter beenficio e gerar motivmento de retenção com motivo 11 }
  { (Fora do convênio).                                                          }

  If ( QryDet.FieldByName('FLGPAGAINSS').AsInteger = 0 ) And
     ( QryBeneficio.FieldByName('FLGPAGAINSS').AsInteger = 1 ) And
     ( QryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 ) Then
  Begin

    Try
      CriaLogOcorrencia( {qryDet.FieldByName('IDPLANOORIGEM').AsString,      //edilaine SIG99886}
                         qryDet.FieldByName('IdPlanoPREV').AsString,         //edilaine SIG99886
                         qryDet.FieldByName('IDPESSJUR').AsString,
                         qryDet.FieldByName('IDTITULAR').AsString,
                         qryDet.FieldByName('IDBENEFICIO').AsString,
                         qryDet.FieldByName('NUMEROPROCESSO').AsString,
                         qryDet.FieldByName('IDPESSOA').AsString,
                         qryDet.FieldByName('SEQPROPOSTA').AsString,
                         '3',
                         FormatDateTime('DD/MM/YYYY', Date),
                         qryDet.FieldByName('VALORATUAL').AsString,
                         qryDet.FieldByName('VALORTOTAL').AsString,
                         qryDet.FieldByName('VALORCOTAS').AsString,
                         qryDet.FieldByName('DATAINICIO').AsString,
                         qryDet.FieldByName('DATAFINAL').AsString,
                         qryDet.FieldByName('VALORATUAL').AsString,
                         qryDet.FieldByName('DATAINICIO').AsString,
                         qryDet.FieldByName('DATAFINAL').AsString,
                         QryDet.FieldByName('IDSITBENEFICIO').AsString,
                         qryDet.FieldByName('FLGDATAPREVISTA').AsInteger,
                         qryAux, '11',
                         iIdLoteConcessao,
                         iIdCalculo,
                         False,
                         qryDet.FieldByName('USUARIOALT').AsInteger,
                         iFlgEmprestimo
                       );
    Except
      frmAguarde.Apaga;
   if dtmBaseDados.dbBaseDados.InTransaction then  //Jéssica Lana SOL 119077
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro no registro da Retenção.','Erro',mtError,[mbOk],0);
      TiraSQL(qryAux);
      Exit;
    End;

    QryDet.FieldByName('IDSITBENEFICIO').AsInteger := 2;
    QryDet.FieldByName('DESCRICAO').AsString       := VetDescBeneficio[2];

  End;

    //Renato Visoni SOL 123227 Kintana 614304
    if qryDet.FieldByName('FONTEPAGADORA').asInteger = 1 then begin
      fSaldoContabil :=0;

      qryDet.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryDet.FieldByName('IdBeneficio').AsInteger,
                                                                              QryDet.FieldByName('IdRegraPagamento').AsInteger,
                                                                              QryDet.FieldByName('FlgResgate').AsInteger );

      //WO16247 - Helen V Bianchi - Inicio
      //qryDet.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
      qryDet.FieldByName('SALDOCONTADIB').asFloat :=  qryDet.FieldByName('RESERVADIB').asFloat ;
      //WO16247 - Helen V Bianchi - Fim


      qryDet.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryDet.FieldByname('IDPESSJUR').asString,QryDet.FieldByname('IDPESSOA').asString,QryDet.FieldByname('IDPLANOPREV').asString);
    end;
    //Renato Visoni SOL 123227 Kintana 614304

   { Guardar IDCALCULO de cada beneficio }
   QryDet.FieldByName('IDCALCULO').AsInteger := iIdCalculo;
   qryDet.Post;
   qryDet.EnableControls;

   if qryBenefReferencia.Locate('IdBeneficio',iIdBenefReferencia,[loCaseInsensitive])
   then begin
      qryBenefReferencia.Edit;

      qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 6; 

      if sTipoFormChamador = 'CO'
      then qryBenefReferencia.FieldByName('DataConcessao').AsDateTime := Date;

      if Trim(sUltMesReajusteINSS) <> ''
      then begin
         qryBenefReferencia.FieldByName('UltMesReajuste').AsString   := sUltMesReajusteINSS;
         qryBenefReferencia.FieldByName('ULTVALORATUALREAJ').AsFloat := qryBenefReferencia.FieldByName('ValorAtual').AsFloat;
         qryBenefReferencia.FieldByName('ValorAtual').AsFloat        := rValorAtualizadoINSS;
         qryBenefReferencia.FieldByName('ValorCalculado').AsFloat    := rValorAtualizadoINSS;
      end;

      //Renato Visoni SOL 123227 Kintana 614304
      if qryBenefReferencia.FieldByName('FONTEPAGADORA').asInteger = 1 then begin
        fSaldoContabil :=0;
        qryBenefReferencia.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio (QryDet.FieldByName('IdBeneficio').AsInteger,
                                                                              QryDet.FieldByName('IdRegraPagamento').AsInteger,
                                                                              QryDet.FieldByName('FlgResgate').AsInteger );

        //WO16247 - Helen V Bianchi - Inicio
        //qryBenefReferencia.FieldByName('SALDOCONTADIB').asFloat := fSaldoContabil;
        qryBenefReferencia.FieldByName('SALDOCONTADIB').asFloat := qryBenefReferencia.FieldByName('RESERVADIB').asFloat;
        //WO16247 - Helen V Bianchi - Fim
        qryBenefReferencia.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryDet.FieldByname('IDPESSJUR').asString,QryDet.FieldByname('IDPESSOA').asString,QryDet.FieldByname('IDPLANOPREV').asString);
      end;
      //Renato Visoni SOL 123227 Kintana 614304
      qryBenefReferencia.Post;

      bGravaBenefReferencia := True;
   end; // with

   Result := True;
end;// ConcedeUmBeneficio

procedure TfrmCadRequerBenefParticip.bbtnCancelarClick(Sender: TObject);
begin
  bApagaProcesso := false; //edilaine - SOL 253577-17464 / PPM 955703
  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;

  if sTipoFormChamador = 'SI'
  then begin
     if MsgDlg('Deseja guardar as informações de Tempo de Serviço informadas para a Simulação ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ sTempoServAnoAntes +', '+
                             '                      TEMPOSERVTOTMES  = '+ sTempoServMesAntes +', '+
                             '                      TEMPOSERVTOTDIA  = '+ sTempoServDiaAntes +
                             ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                             ' AND   IDPESSOA  = ' + IntToStr(iIdTitular) );
        try
           dtmAPrev.qry.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;
  end;
  inherited;
  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {se entrou na concessão pela tela de requerimento, desabilitar controles}
  if sRequerimento then
     ConfiguraAcessosTela(ctConcessaoViaRequerimento);
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim
  
end;

procedure TfrmCadRequerBenefParticip.dbrgrpDataPrevistaClick(
  Sender: TObject);
begin
  inherited;
  if dbrgrpDataPrevista.ItemIndex = 0
  then begin
     lblDataFinal.Caption  := 'Data Final(Prev.)';
     if qryDet.FieldByName('DataFinal').AsString <> ''
     then qryDet.FieldByName('DataFinalPrevista').AsDateTime := qryDet.FieldByName('DataFinal').AsDateTime;
     qryDet.FieldByName('DataFinal').AsString := '';
     dtDataFinal.DataField := 'DataFinalPrevista';
  end
  else begin
     lblDataFinal.Caption  := 'Data Final';
     if qryDet.FieldByName('DataFinalPrevista').AsString <> ''
     then qryDet.FieldByName('DataFinal').AsDateTime := qryDet.FieldByName('DataFinalPrevista').AsDateTime;
     qryDet.FieldByName('DataFinalPrevista').AsString := '';
     dtDataFinal.DataField := 'DataFinal';
  end;

end;

function TfrmCadRequerBenefParticip.VerificaCamposObrigRegra : boolean;
begin
   Result := False;

   // Verificar campos obrigatorios
   if Trim(dblkpcmbBeneficio.Text) = ''
   then begin
     MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficio.SetFocus;
     Exit;
   end;
   if Trim(dtDataEvento.Text) = ''
   then begin
     MsgDlg('Preencha a Data do Evento.','Erro',mtError,[mbOk],0);
     dtDataEvento.SetFocus;
     Exit;
   end;
   if Trim(dtInicioFund.Text) = ''
   then begin
     MsgDlg('Preencha a Data de Início da Fundação.','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficio.SetFocus;
     Exit;
   end;

   // Se for beneficio provisorio, verificar percentual de concessao
   if (dbrgrpBenefProvisorio.ItemIndex = 1) and
      (Trim(dbedPercConc.Text) = '')
   then begin
     MsgDlg('Este benefício está marcado como "PROVISÓRIO". '+
            'Preencha o Percentual de Concessão. ','Erro',mtError,[mbOk],0);
     dbrgrpBenefProvisorio.SetFocus;
     Exit;
   end;

   // edilaine - SOL 253577-17374 / PPM 848182 - inicio

   // Verificar se participante já fez opções
   if not VerificaOpcoesObrigatorias() then
      Exit;


  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
     (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
  begin

    if (bFlgApresentaBSFAB) then
    begin
      {IN: RN09 - Ao requerer benefício, caso o valor do Benefício Saldado não tenha sido calculado o sistema apresenta crítica}
      if (reValorBS.Text = '') then
      begin
        MsgDlg('Para requerer o benefício, é necessário calcular o valor do benefício saldado. ','Informação',mtInformation,[mbOk],0);
        frmAguarde.Apaga;
        Exit;
      end;

      {IN: RN09 / TC: RN05  }
      {A validação dos valores deve obedecer a marcação dos flag´s de apresentação do BS, FAB e Deficit}
      {Ao requerer benefício, caso o valor do FAB não tenha sido calculado o sistema apresenta crítica}
      if (reValorFAB.Text = '') then
      begin
        MsgDlg('Para requerer o benefício, é necessário calcular o valor do FAB. ','Informação',mtInformation,[mbOk],0);
        frmAguarde.Apaga;
        Exit;
      end;
    end;

  end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  frmAguarde.Apaga;

  Result := True;
end;

function TfrmCadRequerBenefParticip.CalculaReservaParaBeneficio ( piIdBeneficio,
                                            piIdRegraReserva,
                                            piFlgResgate           : longint )  : double;

var dTotReservaReal,
    dValorReservaCota,
    dValorDaCota,
    dTotReserva    : double;
    sDataRef,
    sDataInicio,
    sValorProvento,
    sValorAtualReserva,
    sValorReservaCota,
    sValorTotReservaReal,
    sDataCancelamento,
    sSQLReserva,
    sDataUltRecebimento     : string;
    bErro           : boolean;
    iNumReg,
    iTotReserva,
    iFlgUltimo      : integer;
    varfields       : variant;
begin
   Result := 0;

   if qryReservaPart.IsEmpty
   then Exit;

   
   // PARA BENEFICIOS EM GRUPO SE CANCELARMOS A QRYMOVRESERVATEMP DÁ TUDO ERRADO
   
   If (qryMovReservaTemp.UpdatesPending) and
      (StrToFloat(ClienteNumero(reValorBeneficio.Text)) > 0) and 
      (iContClick > 1)                                           
   Then qryMovReservaTemp.CancelUpdates;
   

   if Trim(dtDataEvento.Text) <> ''
   then sDataRef := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date) 
   else sDataRef := FormatDateTime('dd/mm/yyyy', date); 

   if Trim(dtInicioFund.Text) <> ''
   then sDataInicio := FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)  
   else sDataInicio := sDataRef;


   // Se tiver regra de calculo de reserva para pagamento
   // Entao utilizar a regra
   // Senao converter as reservas para real e somá-las
   if piIdRegraReserva > 0
   then begin

     
     qryaux.close;
     qryaux.sql.text := ' SELECT MAX(DATARECEBIMENTO) DATA '+
                        ' FROM HSTCONTRIBPREV  '+
                        ' WHERE  IDPESSJUR =  '''+qryReservaPart.FieldByName('IdPessJur').AsString+'''   '+
                        ' AND IDPLANOPREV = '''+qryReservaPart.FieldByName('IdPlanoPrev').AsString+'''   '+
                        ' AND IDPESSOA =  '''+qryReservaPart.FieldByName('IdPessoa').AsString+'''    '+
                        ' AND SEQPROPOSTA =  '''+qryReservaPart.FieldByName('SeqProposta').AsString+''' ';
     qryaux.open;

     if not qryaux.isempty then sDataUltRecebimento :=   qryaux.fieldbyname('DATA').AsString;
     


     sValorProvento := CalcSALPART( iIdPessJur,iIdTitular,
                                    Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2),
                                    qryAux);
     sSQLReserva := '';
     iNumReg     := 0;
     iFlgUltimo  := 0;
     iTotReserva := qryReservaPart.RecordCount;
     qryReservaPart.First;

     // Executar a regra de reserva para beneficio para cada reserva.
     // A regra retornará o valor em cotas que será usado da reserva para calcular o
     // valor do benefício. Este valor deve ser guardado na MOVRESERVATEMP
     // Quando acabar de executar a regra para todas as reservas, executá-la mais
     // uma vez para a regra retornar o valor total em real da reserva para benefício
     while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do
     begin
        inc(iNumReg);

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        if iNumReg > iTotReserva
        then iFlgUltimo := 1;


        
        //se for o valor atual deve ser passado como o somatório
        //dos valorres abatidos
        if iFlgUltimo = 1 then
        begin
           sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal));
        end
        else
        begin
           varFields := VarArrayCreate([0,1],varVariant);
           varFields[0] := piIdBeneficio;
           varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

           if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
           then sValorAtualReserva := OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)) 
           else if qryMovReservaTemp.Locate('IdTipoReserva',qryReservaPart.FieldByName('IdTipoReserva').AsInteger , [loCaseInsensitive, loPartialKey])
           then sValorAtualReserva := OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat))
           else sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('ValorReserva').AsString);
        end;




        sDataCancelamento := qryTitular.FieldByName('DATACANCELAMENTO').AsString;
        If sDataCancelamento = '' Then sDataCancelamento := ' ';

        //Renato Visoni SOL 123227 Kintana 614304

        if (sValorAtualReserva <> '') and (not qryReservaPart.Eof) then begin
          fSaldoContabil := fSaldoContabil+StrToFloat(ClienteNumero(sValorAtualReserva));
        end;
        //Renato Visoni SOL 123227 Kintana 614304

        sSQLReserva := ' SELECT '+IntToStr(iNumReg)+' AS CONTRESERVA, '+
                                IntToStr(iFlgUltimo)+' AS ULTRESERVA, '+
                                qryReservaPart.FieldByName('IdTipoReserva').AsString+ ' AS IDTIPORESERVA,    '+
                                OraNumero(dbedPercContrib.Text)+ ' AS PERCRETENCAO, '+ // Renato Visoni SOL 153767 Kintana 1162587
                                qryReservaPart.FieldByName('IdPessJur').AsString    + ' AS IDPESSJUR,        '+
                                qryReservaPart.FieldByName('IdPlanoPrev').AsString  + ' AS IDPLANOPREV,      '+
                                qryReservaPart.FieldByName('IDPESSOA').AsString     + ' AS IDTITULAR,        '+
                                qryReservaPart.FieldByName('IdPessoa').AsString     + ' AS IDPESSOA,         '+
                                qryReservaPart.FieldByName('SeqProposta').AsString     + ' AS SEQPROPOSTA,   '+
                                ''''+qryReservaPart.FieldByName('FLGDESCIRRF').AsString+ ''' AS FLGDESCIRRF, '+
                                IntToStr(piIdBeneficio)+ ' AS IDBENEFICIO,          '+
                                OraNumero(sValorProvento) + ' AS VALORPROVENTO,                              '+
                                sValorAtualReserva        + ' AS VALORRESERVA,                               '+
                                ''''+qryReservaPart.FieldByName('MoeSigla').AsString+ '''         AS MOESIGLA,     '+
                                ''''+PreparaStrRegra(sDataInicio)+ '''       AS DATAINICIO,                                         '+
                                ''''+PreparaStrRegra(sDataRef)+ '''          AS DATAREF,                                            '+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString)+ ''' AS DATAREFERENCIASA, '+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString)      +'''    AS DATANASC,       '+
                                ''''+PreparaStrRegra(qryTitular.FieldByName('INSCRICAODATA').AsString)+'''    AS INSCRICAODATA,       '+
                                ''''+ PreparaStrRegra(sDataCancelamento) +'''    AS DATACANCELAMENTO, '+                                ''''+qryReservaPart.FieldByName('DATAADMISSAO').AsString  +'''    AS DATAADMISSAO,   '+
                                ''''+qryReservaPart.FieldByName('CODHIERARQUIA').AsString +'''    AS CODHIERARQUIA,  '+
                                ''''+qryReservaPart.FieldByName('INDICEREAJUSTE').AsString+'''    AS INDICEREAJUSTE, '+
                                ''''+qryReservaPart.FieldByName('FLGCONTROLE').AsString   +'''    AS FLGCONTROLE,    '+
                                ''''+PreparaStrRegra(FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date) )        +'''    AS DATAREQUERIMENTO,              '+
                                ''''+PreparaStrRegra(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date) )        +'''    AS DATAINICIOPAGTO, '+
                                ''''+PreparaStrRegra(sFlgInternoAntes)+''' AS FLGINTERNOANT, '+
                                ''''+PreparaStrRegra(sFlgInternoDepois)+''' AS FLGINTERNO, '+
                                ''''+PreparaStrRegra(sIdSitPartAntes)+''' AS IDSITPARTATUAL, '+
                                ''''+PreparaStrRegra(sIdSitPlanAntes)+''' AS IDSITPLANOATUAL, '+
                                ''''+PreparaStrRegra(sIdSitFuncAntes)+''' AS IDSITFUNCATUAL, '+
                                ''''+PreparaStrRegra(sIdSitPartDepois)+''' AS IDSITPARTNOVO, '+
                                ''''+PreparaStrRegra(sIdSitPlanDepois)+''' AS IDSITPLANONOVO, '+
                                ''''+PreparaStrRegra(sIdSitFuncDepois)+''' AS IDSITFUNCNOVO, '+
                                ''''+OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString)+'''         AS PERCENTUALSAQUE, '+
                                OraNumero(FloatToStr(rOpcao1))+ ' AS VALORBASE1, '+
                                OraNumero(FloatToStr(rOpcao2))+ ' AS VALORBASE2, '+
                                OraNumero(FloatToStr(rOpcao3))+ ' AS VALORBASE3 , '+
                                ''''+PreparaStrRegra(sDataUltRecebimento)+'''    AS DATAULTCONTRIB  ,     '+
                                ''''+PreparaStrRegra(qryTitular.FieldByName('DTINICIOINSC').AsString)+'''    AS DTINICIOINSC     '+
                                ', '+ IntToSTr(pTempVincFunc) +' AS TEMPVINCFUND            '+//Higor Nayde
                    ' FROM DUAL ';

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        if iNumReg <=  iTotReserva
        then begin
           sValorReservaCota    := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo );

           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+IntToStr(piIdRegraReserva)+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dValorReservaCota := 0;
              break;
           end
           else dValorReservaCota := StrToFloat(ClienteNumero(sValorReservaCota));


           //acumula valor a ser usado na regra de benefício
           //que é o valor a ser abatido
           dTotReservaReal := dTotReservaReal + dValorReservaCota;


           if (piFlgResgate = 1)
           then begin
              // Atualizar/inserir reserva na qryMovReservaTemp
              varFields := VarArrayCreate([0,1],varVariant);
              varFields[0] := piIdBeneficio;
              varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
              if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
              then begin
                 qryMovReservaTemp.Edit;
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
                 qryMovReservaTemp.Post;
              end
              else begin
                 qryMovReservaTemp.Insert;
                 qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                 qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                 qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
                 qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
                 qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdTitular;
                 qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdTitular;
                 qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
                 qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := iNumeroProcesso;
                 qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := piIdBeneficio;
                 qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
                 qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                 qryMovReservaTemp.Post;
              end;
           end;
           qryReservaPart.Next;
        end
        else begin

           sValorTotReservaReal := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo );

           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+IntToStr(piIdRegraReserva)+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dTotReservaReal := 0;
              break;
           end
           else dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));
        end;
     end; // while
   end
   else begin
       dTotReservaReal := 0;
       dTotReserva     := 0;
       qryReservaPart.First;



       while not qryReservaPart.Eof do
       begin

           
           if qryReservaPart.FieldByName('FLGCONTROLE').AsInteger = 1
           then begin
              qryReservaPart.Next;
              continue;
           end;
           

           if qryReservaPart.FieldByName('ValorReserva').AsString <> ''
           then begin


              if not  qryMovReservaTemp.isempty then
              begin
                 varFields := VarArrayCreate([0,1],varVariant);
                 varFields[0] := piIdBeneficio;
                 varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

                 if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
                 then dTotReserva := (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                     - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)
                 else if qryMovReservaTemp.Locate('IdTipoReserva',qryReservaPart.FieldByName('IdTipoReserva').AsInteger , [loCaseInsensitive, loPartialKey])
                 then dTotReserva := (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                     - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)
                 else dTotReserva := qryReservaPart.FieldByName('ValorReserva').AsFloat;
              end
              else
              begin
                 dTotReserva := qryReservaPart.FieldByName('ValorReserva').AsFloat;
              end;
              


              dValorDaCota  := VoltaValorCotacao(qryaux,
                                                 qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)  // SOL 181743 Kintana 1706063
                                                );

              dTotReservaReal := dTotReservaReal + (  dTotReserva   * dValorDaCota );

              // Atualizar/inserir reserva na qryMovReservaTemp
              if (piFlgResgate = 1)
              then begin
                 varFields := VarArrayCreate([0,1],varVariant);
                 varFields[0] := piIdBeneficio;
                 varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
                 if qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey])
                 then begin
                    qryMovReservaTemp.Edit;
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end
                 else begin
                    qryMovReservaTemp.Insert;
                    qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                    qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                    qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
                    qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
                    qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdTitular;
                    qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdTitular;
                    qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
                    qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := iNumeroProcesso;
                    qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := piIdBeneficio;
                    qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end;
              end;
           end;
           qryReservaPart.Next;
       end;
   end;


   try
     OraNumero(FloatToStr(dTotReservaReal));
   except
     MsgDlg('O valor calculado para a reserva é inválido. ','Erro',mtError,[mbOk],0);
     Exit;
   end;

   Result := dTotReservaReal;
end;

//function TfrmCadRequerBenefParticip.AtualizaReservaPart ( piIdBeneficio : longint ) : boolean; //SIG84530
function TfrmCadRequerBenefParticip.AtualizaReservaPart ( piIdBeneficio : longint ; bAtualiza: boolean = True) : boolean;//SIG84530
   //SIG32846 - Peterson Victor - inicio 
   function fct_AcertaMovResevaTemp : Boolean;
   var QryAuxiliar : Twwquery;
       ValorTot, Percent,valoraux : Double;
       vlrCota : extended;                        //edilaine SIG20491
       lstReservas  : TStringlist;                //edilaine SIG20491
       sReservaPatro, sReservaPart : string;      //edilaine SIG20491
   begin

      try
      begin

        qryMovReservaTemp.First;
        if qryMovReservaTemp.IsEmpty then
           Exit;

        QryAuxiliar := Twwquery.Create(Self);
        QryAuxiliar.databasename := 'basedados';
        QryAuxiliar.close;
        QryAuxiliar.SQL.clear;

        lstReservas := TStringlist.create;    //edilaine SIG20491

        QryAuxiliar.SQL.Text := 'SELECT DISTINCT SUM(CO.COTVALOR * VALORRESERVA) AS VALORTOT ' + #13#10 +
                              'FROM  RESERVAPART RS,' + #13#10 +
                              '      RESERVAXPLANO TP,' + #13#10 +
                              '      COTACAOMOEDA CO,' + #13#10 +
                              '      MOEDA,' + #13#10 +
                              '      DEPENTIT DP,' + #13#10 +
                              '      (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX' + #13#10 +
                              '       FROM RESERVAPART RP1, RESERVAXPLANO TP1,COTACAOMOEDA CO1' + #13#10 +
                              '       WHERE (RP1.IDPESSJUR = ' + qryMovReservaTemp.FieldByName('IDPESSJUR').AsString + ' )' + #13#10 +
                              '             AND   (RP1.IDPESSOA = ' + qryMovReservaTemp.FieldByName('IDPESSOA').AsString  + ' )' + #13#10 +
                              '             AND   (RP1.IDPLANOPREV = ' + qryMovReservaTemp.FieldByName('IDPLANOPREV').AsString + ' )' + #13#10 +
                              '             AND   (RP1.SEQPROPOSTA = ' + qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsString + ' )' + #13#10 +
                              '             AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV)' + #13#10 +
                              '             AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA)' + #13#10 +
                              '             AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE)' + #13#10 +
                              '       GROUP BY TP1.INDICEREAJUSTE) MAXDATA' + #13#10 +
                              'WHERE (RS.IDPESSJUR = ' + qryMovReservaTemp.FieldByName('IDPESSJUR').AsString + ' )' + #13#10 +
                              'AND   (RS.IDPESSOA = ' + qryMovReservaTemp.FieldByName('IDPESSOA').AsString  + ' )' + #13#10 +
                              'AND   (RS.IDPLANOPREV = ' + qryMovReservaTemp.FieldByName('IDPLANOPREV').AsString + ' )' + #13#10 +
                              'AND   (RS.SEQPROPOSTA =  ' + qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsString + ' )' + #13#10 +
                              'AND   (RS.IDPARTICIPANTE = DP.IDTITULAR)' + #13#10 +
                              'AND   (RS.IDPESSOA=DP.IDPESSOA)' + #13#10 +
                              'AND   (TP.IDPLANOPREV = RS.IDPLANOPREV)' + #13#10 +
                              'AND   (TP.IDTIPORESERVA = RS.IDTIPORESERVA)' + #13#10 +
                              'AND   (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+))' + #13#10 +
                              'AND   (TP.ANALITICOSINTETI = ''A'')' + #13#10 +
                              'AND   (CO.MOECODIGO(+) = MAXDATA.INDICERE)' + #13#10 +
                              'AND   (CO.COTDATA(+) = MAXDATA.DATAMAX)' + #13#10 +
                              'AND   (MOEDA.MOECODIGO(+)  = TP.INDICEREAJUSTE)' + #13#10 +
                              'AND   (FLGCOLETIVA = 0 or FLGCOLETIVA IS NULL)' + #13#10 +
                              'AND   (FLGCONTROLE = 0)';

        QryAuxiliar.Open;

        if (QryAuxiliar.IsEmpty) or (trim(reValorBeneficio.Text) = '') then
           Exit;

        ValorTot := StrToFloat(ClienteNumero(QryAuxiliar.FieldByName('VALORTOT').AsString));
        ValorTot := StrToFloat(FormatFloat('#0.00',ValorTot));

        if  (ValorTot = StrToFloat(reValorBeneficio.Text)) or
            (StrToFloat(reValorBeneficio.Text) = 0 ) then
           Exit;


        //edilaine SIG20491 : inicio
        if qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger = 66 then
        begin
          ValorTot := StrToFloat(reValorBeneficio.Text);

          sReservaPart  := '51,52,53,55,167,23,33,117';
          sReservaPatro := '59,60,61,62,170';

          lstReservas.CommaText := sReservaPart;

          repeat
            if qryMovReservaTemp.Locate('IDTIPORESERVA', lstReservas.Strings[0], []) then
            begin
              QryAuxiliar.SQL.Text := '';

              if qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat > 0 then
              begin
                QryAuxiliar.SQL.Text := 'SELECT DISTINCT TP.IDTIPORESERVA,' + #13#10 +
                                        '       VALORRESERVA, CO.COTVALOR, CO.COTVALOR * VALORRESERVA AS VLRATUAL,' + #13#10 +
                                        '       NVL(TP.FLGCOLETIVA,0) AS FLGCOLETIVA,' + #13#10 +
                                        '       NVL(TP.FLGCONTROLE,0) AS FLGCONTROLE' + #13#10 +
                                        'FROM  RESERVAPART RS,' + #13#10 +
                                        '      RESERVAXPLANO TP,' + #13#10 +
                                        '      COTACAOMOEDA CO,' + #13#10 +
                                        '      MOEDA,' + #13#10 +
                                        '      DEPENTIT DP,' + #13#10 +
                                        '      (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX' + #13#10 +
                                        '       FROM RESERVAPART RP1, RESERVAXPLANO TP1,COTACAOMOEDA CO1' + #13#10 +
                                        '       WHERE (RP1.IDPESSJUR =  ' + qryMovReservaTemp.FieldByName('IDPESSJUR').AsString + ' )' + #13#10 +
                                        '             AND   (RP1.IDPESSOA =  ' + qryMovReservaTemp.FieldByName('IDPESSOA').AsString  + ' )' + #13#10 +
                                        '             AND   (RP1.IDPLANOPREV =  ' + qryMovReservaTemp.FieldByName('IDPLANOPREV').AsString + ' )' + #13#10 +
                                        '             AND   (RP1.Idtiporeserva = ' + qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsString + ' )' + #13#10 +
                                        '             AND   (RP1.SEQPROPOSTA =   ' + qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsString + ' )' + #13#10 +
                                        '             AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV)' + #13#10 +
                                        '             AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA)' + #13#10 +
                                        '             AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE)' + #13#10 +
                                        '       GROUP BY TP1.INDICEREAJUSTE) MAXDATA' + #13#10 +
                                        'WHERE (RS.IDPESSJUR =   ' + qryMovReservaTemp.FieldByName('IDPESSJUR').AsString + ' )' + #13#10 +
                                        'AND   (RS.IDPESSOA =   ' + qryMovReservaTemp.FieldByName('IDPESSOA').AsString  + ' )' + #13#10 +
                                        'AND   (RS.IDPLANOPREV =   ' + qryMovReservaTemp.FieldByName('IDPLANOPREV').AsString + ' )' + #13#10 +
                                        'AND   (RS.Idtiporeserva =  ' + qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsString + ' )' + #13#10 +
                                        'AND   (RS.SEQPROPOSTA =    ' + qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsString + ' )' + #13#10 +
                                        'AND   (RS.IDPARTICIPANTE = DP.IDTITULAR)' + #13#10 +
                                        'AND   (RS.IDPESSOA=DP.IDPESSOA)' + #13#10 +
                                        'AND   (TP.IDPLANOPREV = RS.IDPLANOPREV)' + #13#10 +
                                        'AND   (TP.IDTIPORESERVA = RS.IDTIPORESERVA)' + #13#10 +
                                        'AND   (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+))' + #13#10 +
                                        'AND   (TP.ANALITICOSINTETI = ''A'')' + #13#10 +
                                        'AND   (CO.MOECODIGO(+) = MAXDATA.INDICERE)' + #13#10 +
                                        'AND   (CO.COTDATA(+) = MAXDATA.DATAMAX)' + #13#10 +
                                        'AND   (MOEDA.MOECODIGO(+)  = TP.INDICEREAJUSTE)' + #13#10 +
                                        'AND   (FLGCOLETIVA = 0 or FLGCOLETIVA IS NULL)' + #13#10 +
                                        'AND   (FLGCONTROLE = 0)';
                QryAuxiliar.Open;
                if not QryAuxiliar.isEmpty then
                begin
                  vlrCota := QryAuxiliar.FieldByName('COTVALOR').AsFloat;

                  if (qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat * vlrCota) <= ValorTot then
                     Valoraux := qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat
                  else
                     Valoraux := ValorTot / vlrCota;


                  qryMovReservaTemp.Edit;
                  qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat := Valoraux;
                  qryMovReservaTemp.Post;

                  ValorTot := ValorTot - (QryAuxiliar.FieldByName('COTVALOR').AsFloat * Valoraux);

                end;
              end;
            end;
            lstReservas.Delete(0);

            if (ValorTot > 0) and (lstReservas.Count = 0) and (sReservaPatro <> '') then
            begin
              lstReservas.CommaText := sReservaPatro;
              sReservaPatro := '';
            end;

          until (lstReservas.count = 0);

          exit;
        end;
        //edilaine SIG20491 : fim


         Percent := StrToFloat(reValorBeneficio.Text) / ValorTot;

         ValorTot := StrToFloat(reValorBeneficio.Text);

         while not qryMovReservaTemp.Eof do
         begin

            QryAuxiliar.SQL.Text := 'SELECT DISTINCT TP.IDTIPORESERVA,' + #13#10 +
                            '       VALORRESERVA, CO.COTVALOR, CO.COTVALOR * VALORRESERVA AS VLRATUAL,' + #13#10 +
                            '       NVL(TP.FLGCOLETIVA,0) AS FLGCOLETIVA,' + #13#10 +
                            '       NVL(TP.FLGCONTROLE,0) AS FLGCONTROLE' + #13#10 +
                            'FROM  RESERVAPART RS,' + #13#10 +
                            '      RESERVAXPLANO TP,' + #13#10 +
                            '      COTACAOMOEDA CO,' + #13#10 +
                            '      MOEDA,' + #13#10 +
                            '      DEPENTIT DP,' + #13#10 +
                            '      (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX' + #13#10 +
                            '       FROM RESERVAPART RP1, RESERVAXPLANO TP1,COTACAOMOEDA CO1' + #13#10 +
                            '       WHERE (RP1.IDPESSJUR =  ' + qryMovReservaTemp.FieldByName('IDPESSJUR').AsString + ' )' + #13#10 +
                            '             AND   (RP1.IDPESSOA =  ' + qryMovReservaTemp.FieldByName('IDPESSOA').AsString  + ' )' + #13#10 +
                            '             AND   (RP1.IDPLANOPREV =  ' + qryMovReservaTemp.FieldByName('IDPLANOPREV').AsString + ' )' + #13#10 +
                            '             AND   (RP1.Idtiporeserva = ' + qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsString + ' )' + #13#10 +
                            '             AND   (RP1.SEQPROPOSTA =   ' + qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsString + ' )' + #13#10 +
                            '             AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV)' + #13#10 +
                            '             AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA)' + #13#10 +
                            '             AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE)' + #13#10 +
                            '       GROUP BY TP1.INDICEREAJUSTE) MAXDATA' + #13#10 +
                            'WHERE (RS.IDPESSJUR =   ' + qryMovReservaTemp.FieldByName('IDPESSJUR').AsString + ' )' + #13#10 +
                            'AND   (RS.IDPESSOA =   ' + qryMovReservaTemp.FieldByName('IDPESSOA').AsString  + ' )' + #13#10 +
                            'AND   (RS.IDPLANOPREV =   ' + qryMovReservaTemp.FieldByName('IDPLANOPREV').AsString + ' )' + #13#10 +
                            'AND   (RS.Idtiporeserva =  ' + qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsString + ' )' + #13#10 +
                            'AND   (RS.SEQPROPOSTA =    ' + qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsString + ' )' + #13#10 +
                            'AND   (RS.IDPARTICIPANTE = DP.IDTITULAR)' + #13#10 +
                            'AND   (RS.IDPESSOA=DP.IDPESSOA)' + #13#10 +
                            'AND   (TP.IDPLANOPREV = RS.IDPLANOPREV)' + #13#10 +
                            'AND   (TP.IDTIPORESERVA = RS.IDTIPORESERVA)' + #13#10 +
                            'AND   (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+))' + #13#10 +
                            'AND   (TP.ANALITICOSINTETI = ''A'')' + #13#10 +
                            'AND   (CO.MOECODIGO(+) = MAXDATA.INDICERE)' + #13#10 +
                            'AND   (CO.COTDATA(+) = MAXDATA.DATAMAX)' + #13#10 +
                            'AND   (MOEDA.MOECODIGO(+)  = TP.INDICEREAJUSTE)' + #13#10 +
                            'AND   (FLGCOLETIVA = 0 or FLGCOLETIVA IS NULL)' + #13#10 +
                            'AND   (FLGCONTROLE = 0)';

            QryAuxiliar.Open;

            if QryAuxiliar.IsEmpty then
               Exit;

            Valoraux := (QryAuxiliar.FieldByName('VLRATUAL').AsFloat * Percent) / QryAuxiliar.FieldByName('COTVALOR').AsFloat;

            qryMovReservaTemp.Edit;

            if qryMovReservaTemp.RecordCount <> qryMovReservaTemp.RecNo then
               qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat := Valoraux
            else
               qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat := ValorTot / QryAuxiliar.FieldByName('COTVALOR').AsFloat;

            qryMovReservaTemp.Post;

            ValorTot := ValorTot - (QryAuxiliar.FieldByName('COTVALOR').AsFloat * Valoraux);

            qryMovReservaTemp.Next;
         end;

      end;
      finally
         FreeAndNil(QryAuxiliar);
         FreeAndNil(lstReservas);    //edilaine SIG20491
      end;
   end;
   //SIG32846 - Peterson Victor - fim

begin
   Result := False;


   if (sTipoFormChamador = 'EV') and (dblkpcmbEvento.Text = 'Resgate Judicial') then //SIG32846 - Peterson Victor 
      fct_AcertaMovResevaTemp;														 //SIG32846 - Peterson Victor 


   qryMovReservaTemp.First;
   while not qryMovReservaTemp.Eof do
   begin
      if qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio
      then begin
         qryMovReservaTemp.Next;
         continue;
      end;

      if not qryReservaPart.Locate('IdTipoReserva',qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger,[loCaseInsensitive])
      then begin
         qryMovReservaTemp.Next;
         continue;
      end;
      if (bAtualiza) then begin //SIG84530
        qryReservaPart.Edit;
        
      // Só zerar o saldo se o valor original era positivo, pois no caso da CBS pode existir reserva originalmente positivo
        if (( qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat ) < 0) and
           (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat > 0 )
        then qryReservaPart.FieldByName('ValorReserva').AsFloat := 0
        else qryReservaPart.FieldByName('ValorReserva').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                                - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;
        qryReservaPart.Post;
      end;

      qryMovReservaTemp.Next;
   end; // while

   Result := True;
end;

procedure TfrmCadRequerBenefParticip.sbtnImprimirSimulacaoClick(
  Sender: TObject);
var sArquivoTemp,
    sSQLTemp,
    sSQL : string;
    iIdReports,
    iOrigemCM          : longint;
begin
  inherited;

  // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio
  if Trim(sNumeroProcessoAntesGravar) = ''
  then sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);

  
  CmeCadastroConfirma(sender);

  with qryAux do
  begin
     Close;
     SQL.Clear;
     // Pegar id do relatorio
     
//     SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+  //Everson TIBERO
     SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(BP.ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+ //Everson TIBERO
             ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF                              '+
             ' WHERE  BF.NUMEROPROCESSO = '+sNumeroProcessoAntesGravar+
             ' AND    BF.IDPLANOPREV    = BP.IDPLANOPREV '+
             ' AND    BF.IDBENEFICIO    = BP.IDBENEFICIO ');
     Open;
     if FieldByName('IdRelatBeneficio').AsInteger <= 0
     then begin
        MsgDlg('Não existe relatório parametrizado para Simulação de Benefício. Verifique no Cadastro de Planos Previdenciários. ', 'Erro',mtError,[mbOk],0);
        sbtnImprimirSimulacao.Down := False;
        qryAux.Close;
        Exit;
     end;
  end;

  // Verificar se foi gerado um IdCalculo para este módulo
  if (iIdCalculo <= 0) and (qryRelBenefPart.IsEmpty)
  then begin
     MsgDlg('A Regra de Simulação não gravou, em nenhum passo, os dados de sua execução. Verifique.', 'Erro',mtError,[mbOk],0);
     sbtnImprimirSimulacao.Down := False;
     qryAux.Close;
     Exit;

     if iIdCalculo <= 0 then iIdCalculo := qryRelBenefPart.FieldByName('IdCalculo').AsInteger;
  end;

  iIdReports := qryAux.FieldByName('IdRelatBeneficio').AsInteger;
  iOrigemCM  := qryAux.FieldByName('OrigemCMBeneficio').AsInteger;

  // Abrir query com SQL do relatorio
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT D.TEMPLATE AS SQL '+
             ' FROM   REPORTS R, DATAVIEW D        '+
             ' WHERE  R.IDREPORTS  = '+ IntToStr(iIdReports)+
             ' AND    R.ORIGEMCM   = '+ IntToStr(iOrigemCM) +
             ' AND    D.IDDATAVIEW = R.IDDATAVIEW '+
             ' AND    D.ORIGEMCMDV = R.ORIGEMCMDV ');
     Open;
     sSQL := FieldByName('SQL').AsString;
  end;

  // Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
  // que estar no FieldsEditor e a query tem que ser RequestLive
  with dtmRelatAdmPREV2.qryDoUsuario do
  begin
     Close;
     ParamByName('IdReports').AsInteger := iIdReports;
     ParamByName('OrigemCM').AsInteger  := iOrigemCM;
     Open;
     if IsEmpty
     then begin
        MsgDlg('Faltam parâmetros para o relatório parametrizado para Simulação de Benefício. Verifique no Cadastro de Planos Previdenciários. ', 'Erro',mtError,[mbOk],0);
        sbtnImprimirSimulacao.Down := False;
        qryAux.Close;
        Close;
        Exit;
     end;
  end;

  with dtmRelatAdmPREV2 do
  begin
     sArquivoTemp := Sistema.TempDir+'APrevRelSimulaBenef.tmp';
     sSQLTemp     := Sistema.TempDir+'APrevSQLRelSimulaBenef.sql';
     qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

     qryRelatParametrizavel.Close;
     qryRelatParametrizavel.SQL.Clear;
     qryRelatParametrizavel.SQL.Text := sSQL;
     qryRelatParametrizavel.SQL.Add(' AND DETCALCULO.IDCALCULO = '+IntTostr(iIdCalculo));
     qryRelatParametrizavel.SQL.Add(' AND DETCALCULO.IDPESSOA  = '+IntTostr(iIdTitular));
     qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
     qryRelatParametrizavel.Open;

     dsRelatParametrizavel.DataSet           := qryRelatParametrizavel;
     pplRelatParametrizavel.DataSource       := dsRelatParametrizavel;
     rpRelatParametrizavel.Template.SaveTo   := stFile;
     rpRelatParametrizavel.Template.Format   := ftBinary;
     rpRelatParametrizavel.Template.FileName := sArquivoTemp;
     rpRelatParametrizavel.Template.LoadFromFile;
     rpRelatParametrizavel.DataPipeline      := pplRelatParametrizavel;


     TFrmPreview.CreateModalPreview(Application, rpRelatParametrizavel, 'AdmPREV - ' + frmCadRequerBenefParticip.Caption);

     
     
     


     DeleteFile(sArquivoTemp);
     DeleteFile(sSQLTemp);
  end;

end;

procedure TfrmCadRequerBenefParticip.bbtnOutrasInformacoesClick(
  Sender: TObject);
var sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sFlgBenefMinAnt,
    sUltMesReajAnt,
    sDataEventoAnt,
    sNumProcINSS, 
    sCodBeneficioAnt     : string;

   sValorBase1Ant,
   sValorBase2Ant,
   sValorBase3Ant        : string;

   iTotalBenef           : longint;
begin
  inherited;

  // Somar o total de beneficiarios do titular
  with dtmAPrev.qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS TOTALDEPENDENTES '+
             ' FROM   DEPENTIT                            '+
             ' WHERE  IDTITULAR = '+IntToStr(iIdTitular) );
     Open;
     if IsEmpty
     then iTotalBenef := 0
     else iTotalBenef := FieldByName('TOTALDEPENDENTES').AsInteger;
  end;

  BuscaDadosBeneficioAnterior(qryAux,
                              iIdPessJur, iIdPlanoPrev, iIdTitular,
                              qryDet.FieldByName('IdBeneficio').AsInteger,
                              qryBeneficio.FieldByName('FlgReferencia').AsInteger,
                              FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                              sDataInicioAnt,
                              sValorAnt,
                              sNomeBenefAnt,
                              sIdTpPagtoAnt,
                              sUltMesReajAnt,
                              sFlgBenefMinAnt,
                              sDataEventoAnt,
                              sCodBeneficioAnt,
                              sValorBase1Ant,
                              sValorBase2Ant,
                              sValorBase3Ant,
                              sNumProcINSS,
                              True,                                               // SIG97504 Tiago Von
                              -1,                                                 // SIG97504 Tiago Von
                              2);                                                 // SIG97504 Tiago Von

  if sDataInicioAnt = ''
  then begin
     sDataInicioAnt := qryDet.FieldByName('DibBenefAnt').AsString;
     sValorAnt      := ClienteNumero(qryDet.FieldByName('ValorBenefAnt').AsString);
  end;

  // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
  frmPedeDadosBenefAnterior := TfrmPedeDadosBenefAnterior.Create(Application);
  with frmPedeDadosBenefAnterior do
  begin
     if Trim(sDataInicioAnt) = ''
     then begin
        lblNomeBenefAnt.Caption := 'Benefício Anterior não Encontrado no Banco de Dados da Fundação';
        lblTituloBenef.Caption  := 'Salário de Benefício';
     end
     else begin
        lblNomeBenefAnt.Caption := sNomeBenefAnt;
        lblTituloBenef.Caption  := 'Renda Mensal Inicial';
     end;

     if Trim(sDataInicioAnt) <>  ''
     then dtDibBenefAnt.Text     := sDataInicioAnt;
     edValorBenefAnt.Text        := ClienteNumero(sValorAnt);

     if (qryBeneficio.FieldByName('FlgReferencia').AsInteger = 0) or (prmNumOPINSS = 0)
     then begin
        grpParamINSS.Visible := False;
        Height               := 184;
     end
     else begin
        grpParamINSS.Visible := True;
        Height               := 344;

        sSQLOpcaoINSS        := ' SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
          '        PP.INSCRICAOTIPO,                                                                   '+
          '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  PP.SALPARTICIPACAO, '+
          '        PP.SALPARTICIPACAO AS VALORPROVENTO,                                                '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, SP.FLGINTERNO, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        PP.IDPESSOA AS IDTITULAR, '+
          qryBeneficio.FieldByName('IdBeneficio').AsString +  ' AS IDBENEFICIO,      '+
          IntToSTr(iNumeroProcesso)                        +  ' AS NUMEROPROCESSO ,  '+
          '0 AS FLGTIPOINSS,      '+

          QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataEvento.Date))            + ' AS DATAREF,          '+  
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date))            + ' AS DATAINICIO,       '+  
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date))            + ' AS DATAINICIOINSS,   '+  
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date))            + ' AS DATAINICIOPAGTO,  '+  
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date))      + ' AS DATAREQUERIMENTO, '+  

          IntToStr(iTotalBenef)                            +'   AS NUMBENEF           '+ 
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF  '+
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND '+
          '        PP.IDPESSOA    = ' + IntToStr(iIdTitular)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA              ';

        if prmNumOpINSS >= 1
        then begin
           lblNomeBINSS1.Visible := True;
           edOpcao1.Visible      := True;
           lblNomeBINSS1.Caption :=  prmNOMEBINSS1;
           edOpcao1.Text         := ClienteNumero(sValorBase1Ant);
           edOpcao1.Enabled      := prmFLGEDITABINSS1;
        end;

        if prmNumOpINSS >= 2
        then begin
           lblNomeBINSS2.Visible := True;
           edOpcao2.Visible      := True;
           lblNomeBINSS2.Caption :=  prmNOMEBINSS2;
           edOpcao2.Text         := ClienteNumero(sValorBase2Ant);
           edOpcao2.Enabled      := prmFLGEDITABINSS2;
        end;

        if prmNumOpINSS >= 3
        then begin
           lblNomeBINSS3.Visible := True;
           edOpcao3.Visible      := True;
           lblNomeBINSS3.Caption :=  prmNOMEBINSS3;
           edOpcao3.Text         := ClienteNumero(sValorBase3Ant);
           edOpcao3.Enabled      := prmFLGEDITABINSS3;
        end;
     end;

     ShowModal;

     if ModalResult = mrOk
     then begin
        qryDet.FieldByName('DibBenefAnt').AsString   := dtDibBenefAnt.Text;
        qryDet.FieldByName('ValorBenefAnt').AsFloat  := StrToFloat(ClienteNumero(edValorBenefAnt.Text));
        qryDet.FieldByName('VALORBINSSANT1').AsFloat := StrToFloat(ClienteNumero(edOpcao1.Text));
        qryDet.FieldByName('VALORBINSSANT2').AsFloat := StrToFloat(ClienteNumero(edOpcao2.Text));
        qryDet.FieldByName('VALORBINSSANT3').AsFloat := StrToFloat(ClienteNumero(edOpcao3.Text));
     end;

     Free;
  end; // with
end;

procedure TfrmCadRequerBenefParticip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizaEP;

  qryEPP.Close;
  qryUser.Close; 

  sTipoTelaBenef    := '';

  //lstDadosCorrecao.Free;      // edilaine - SOL 253577-17464 / PPM 955703   // edilaine - SOL 262968 / PPM 1102753 - comentado

  inherited;

  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  // SOL124279 - Daniel Begnami
  //If (dtmBaseDados.dbBaseDados.InTransaction) And (sTipoFormChamador = 'CO') Then Begin // Renato Visoni SOL 128888 Kintana 695913
  //      dtmBaseDados.dbBaseDados.RollBack;
  //      ShowMessage('Existe uma transação em aberto. A Transação será cancelada!');
  //   End;
  // FIM SOL124279 - Daniel Begnami
  If (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
end;

procedure TfrmCadRequerBenefParticip.qryBenefAUXAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  
  qryBenefAux.FieldByName('FLGPOSSUIACOMPINSS').AsInteger := 0;
  
  
end;

procedure TfrmCadRequerBenefParticip.sbtnCadContaCorrenteClick(
  Sender: TObject);
begin
  inherited;
  try
    // passa o parametro da qrycontabancaria pra o cadastro, para certificar que o recebedor(efetivo),
    // é o dono da conta (idresponsavel ou idpessoa)
    frmCadContaRequerBenef := TFrmCadContaRequerBenef.Create(Self);
    with frmCadContaRequerBenef do
    begin
       qry.Close;
       qry.ParamByName('IDPESSOA').AsInteger := qryContaBancaria.FieldByName('IdPessoa').AsInteger;
       qry.Open;
       iIdPessoa := qryContaBancaria.FieldByName('IdPessoa').AsInteger;
       ShowModal;
    end;
    PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  finally
     sbtnCadContaCorrente.Down := False;
  end;
end;

procedure TfrmCadRequerBenefParticip.reValorSRBBtnClick(Sender: TObject);
var rValorSRB            : double;
    bErro                : boolean;
    sSQLBenefAssoc,
    sMsgErro             : string;
    iIdCalculoAnt,
    iIdRegraCalculo      : longint;
    bGrupo               : boolean;
    piFlgPossuiAcomp     : integer;
begin

  inherited;

  if qryBeneficio.FieldByName('IdRegraSRB').AsInteger <= 0 then Exit;

  frmAguarde.Mostra('Regra de Cálculo do SRB - Nº '+qryBeneficio.FieldByName('IdRegraSRB').AsString);

  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

  // Se nao tiver valor inf. do inss, mas o beneficio cadastrado antes deste
  // tiver, passar o valor dele para esta regra
  if (Trim(reValorInfInss.Text) = '') or
     (Trim(reValorInfINSS.Text) = '0') or
     (Trim(reValorInfInss.Text) <> '') and (StrToFloat(ClienteNumero(Trim(reValorInfInss.Text))) <= 0) and
     (not qryBenefAux.IsEmpty)
  then begin
     qryBenefAux.First;
     sValorInfINSS := OraNumero(qryBenefAux.FieldByName('VlrInfInss').AsString);
  end
  else sValorInfINSS := OraNumero(Trim(reValorInfInss.Text));

  if qryBeneficio.FieldByName('IdGrupoBenef').AsInteger > 0
  then bGrupo := True
  else bGrupo := False;

  // Executar regra de calculo do beneficio
  try
     rValorSRB       := 0;
     iIdCalculoAnt   := iIdCalculo;

     if dbrgrpPossuiAcompINSS.ItemIndex = 0
     then piFlgPossuiAcomp := 0
     else piFlgPossuiAcomp := 1;


     If (Not DbChbPossuiAcomp.Checked)
     Then piFlgPossuiAcomp := 0
     Else piFlgPossuiAcomp := 1;


     rValorSRB := ExecutaRegraCalculoSRB(qryAux,
                                         qryBeneficio.FieldByName('IdRegraSRB').AsInteger,
                                         iIdPessJur,
                                         iIdPlanoPrev,
                                         iIdTitular,
                                         iSeqProposta,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumeroProcesso,
                                         iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
                                         rOpcao1, rOpcao2, rOpcao3,
                                         sSQLBenefAssoc,
                                         FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),        
                                         FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
                                         sValorInfINSS,
                                         reValorCalcINSS.Text,
                                         '0',
                                         bGrupo,
                                         0,
                                         qryDet.FieldByName('DibBenefAnt').AsString,
                                         qryDet.FieldByName('ValorBenefAnt').AsString,
                                         qryDet.FieldByName('VALORBINSSANT1').AsString,
                                         qryDet.FieldByName('VALORBINSSANT2').AsString,
                                         qryDet.FieldByName('VALORBINSSANT3').AsString,
                                         bErro,
                                         sMsgErro,
                                         iIdCalculo,
                                         piFlgPossuiAcomp,
                                         // Thiago Melo SOL 210200 Kintana 2027146
                                         -1,
                                         -1,
                                         True
                                         // Thiago Melo SOL 210200 Kintana 2027146
                                          );
  except
     frmAguarde.Apaga;
  end;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorSRB.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0 then
    iIdCalculo := iIdCalculoAnt;

  reValorSRB.Text := FormatFloat('#0.00',rValorSRB);
end;



procedure TfrmCadRequerBenefParticip.dtInicioINSSExit(Sender: TObject);
begin
  inherited;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 then
  begin
    dtInicioFund.Date := dtInicioINSS.Date; 
    dtDataInicio.Date := dtInicioINSS.Date; 
  end;
end;



procedure TfrmCadRequerBenefParticip.sbtnDemonsSRBClick(Sender: TObject);
begin
  inherited;
  if not qryDet.Active
  then begin
     sbtnDemonsSRB.Down := False;
     Exit;
  end;
  try
     iIdCalculoGeral   := iIdCalculo;
     frmPRelDemosBenef := TfrmPRelDemosBenef.Create(Application);
     if not frmPRelDemosBenef.DisparaRelatorio('M',
                                               IntToStr(iIdTitular),
                                               IntToStr(iIdTitular), 
                                               IntToStr(iIdPessJur),
                                               IntToStr(iIdPlanoPrev),
                                               IntToStr(iNumeroProcesso),
                                               qryDet.FieldByName('DATAINICIOFUND').AsString,
                                               '')
     then begin
        MsgDlg('Erro ao Montar Demonstrativo de Cálculo.','Erro',mtError,[mbOk],0);
        Exit;
     end;
  finally
     frmPRelDemosBenef.Free;
     iIdCalculoGeral := 0;
     sbtnDemonsSRB.Down := False;
  end;
  
end;

function TfrmCadRequerBenefParticip.EApenasReferencia(pIdPlanoPrev,
  pIdBeneficio: Integer): Boolean;
begin
  //retorna TRUE se o benefício for apenas de referênca (Não paga.)
  with qryAux Do
  Begin
    sql.Clear;
    sql.Add(' SELECT NVL(FLGPAGAINSS,0) FLGPAGAINSS FROM BENEFPLANPREV '+
            ' WHERE IDPLANOPREV = ' + IntToStr(pIdPlanoPrev) +
            '   AND IDBENEFICIO = ' + IntToStr(pIdBeneficio));
    Open;
    Result := FieldByName('FLGPAGAINSS').AsInteger = 0;
    Close;
  End;
end;

procedure TfrmCadRequerBenefParticip.dbedNumProcINSSExit(Sender: TObject);
begin
  inherited;
  if (dbedNumProcINSS.text <> '') then
  begin
     if not ValidaNumProcesso(qrydet.fieldbyname('NUMPROCINSS').AsString) then
     begin
        
        if MsgDlg('O Número do Processo no INSS informado é INVÁLIDO. '+#13+
                  'Deseja manter este número e continuar a operação ?', Caption, mtError , [mbNo, mbYes], 0) = mrNo then
        begin
           if dbedNumProcINSS.CanFocus then dbedNumProcINSS.setfocus
        end;
     end;
  end;
end;

procedure TfrmCadRequerBenefParticip.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  sBeneficioAnterior := '0'; //Vinicius Ferreira SOL 157583 Kintana 1269810

  //BRUNO AZEVEDO SOL 135605 KINTANA 807282
  dbedPercContrib.text := '0';

  If dbrgrpPossuiAcompINSS.Visible
   Then dbrgrpPossuiAcompINSS.ItemIndex := 0;
  

  
  If (DbChbPossuiAcomp.Visible = True)
  Then DbChbPossuiAcomp.Checked := False;


  // INICIO - Marcelo Cardoso - SOL262811 PPM1125645
  If sTipoFormChamador = 'EV' then
  begin
     if (sIdEventoGerador = '334') or (sIdEventoGerador = '369') or (sIdEventoGerador = '373') or (sIdEventoGerador = '368') or
        (sIdEventoGerador = '337') or (sIdEventoGerador = '15') or (sIdEventoGerador = '336') or (sIdEventoGerador = '345') then
     dtInicioINSS.Text := '';
  end;
  // Fim - Marcelo Cardoso - SOL262811 PPM1125645

  BeneficioRiscoInss; //Darivaldo Alencar SIG 23985
  DbChbBenef142.checked:= false;//Darivaldo Alencar SIG 23985
end;

procedure TfrmCadRequerBenefParticip.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dtmaprev.regraAPrev.LimpaVariaveis;
  iContClick        := 0; 
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  DataSet.FieldByName('RESGATEPARCELADO').AsInteger := 0;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
end;

procedure TfrmCadRequerBenefParticip.qryDetAfterEdit(DataSet: TDataSet);
begin
  inherited;
  iContClick        := 0;
end;

procedure TfrmCadRequerBenefParticip.dbrgrpPossuiAcompINSSChange(Sender: TObject);
begin
  inherited;

  if dbrgrpPossuiAcompINSS.ItemIndex = 1 Then Begin
    reValorCalcINSS.Enabled := True;
    reValorInfINSS.Enabled  := True;
  End;
end;


procedure TfrmCadRequerBenefParticip.CmeCadastroCancel(Sender: TObject);
begin
  inherited;


  if (sTipoFormChamador = 'CO') and (dtmBaseDados.dbBaseDados.InTransaction)
  then dtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmCadRequerBenefParticip.DbChbPossuiAcompClick(Sender: TObject);
begin
  inherited;

  If (DbChbPossuiAcomp.Checked) Then Begin
    reValorCalcINSS.Enabled := True;
    reValorInfINSS.Enabled  := True;
  End;


end;

procedure TfrmCadRequerBenefParticip.dblkpcmbBeneficioChange(
  Sender: TObject);
Var sSQL : String;
begin
  inherited;
  dblkcbEPP.Visible := (qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E');
  lbEPP.Visible     := dblkcbEPP.Visible;
  spbEPP.Visible    := dblkcbEPP.Visible;

  
  sSQL := 'SELECT CODPORTFORMA, ' + #13 +
          '       DESCRICAO, '    + #13 +
          '       CODPORTADOR'    + #13 +
          'FROM PORTADORFORMA'    + #13 +
          'WHERE RECPAG = ''P'' ' + #13 +
          'AND NVL(FLGATIVO, ''S'') = ''S'''; 


  If (qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E') Then
  Begin
    sSQL := sSQL + ' AND CODPORTFORMA NOT IN (SELECT DISTINCT CODPORTFORMA ' + #13 +
                   '                          FROM BANCOPORTFORMA)'          + #13;
  End;

  sSQL := sSQL + 'ORDER BY DESCRICAO';

  qryPortForma.Close;
  qryPortForma.SQL.Clear;
  qryPortForma.SQL.Text := sSQL;
  qryPortForma.Open;

end;

procedure TfrmCadRequerBenefParticip.spbEPPClick(Sender: TObject);
begin
  inherited;

  MontaSelectEPP.Executar;

  If (MontaSelectEPP.ValoresChave.count > 0) and
     (MontaSelectEPP.ValoresChave[0] <> '')  Then
  Begin
     If qryEPP.Locate('IDPESSOA', MontaSelectEPP.ValoresChave[0], []) Then
     Begin
       dblkcbEPP.LookupValue := MontaSelectEPP.ValoresChave[0];
       dblkcbEPP.Text        := MontaSelectEPP.ValoresChave[1];
     End;
  End;
end;

//Ádler Souza - SOL 132110 KINTANA 758869
{function TfrmCadRequerBenefParticip.ComparaPLanoContabil(pIdPessoa,
  IdPLanoPrevContab, IdplanoPrev, pidTitular: Integer): Boolean;
var sMsg,sSQL : String;

begin

  //Renato Visoni SOL 118811 Kintana 569080
  
  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  result := True;

  sSQL := '';
  sMsg := '';

  QryPlanoContabInss.Close;

  QryPlanoContabInss.Sql.Clear;

  QryPlanoContabInss.Sql.Add('select idplanprevcontab,idplanoPrev from benefbfciario bb          ');
  QryPlanoContabInss.Sql.Add('where idpessoa = '+inttostr(pIdPessoa)+'                           ');
  QryPlanoContabInss.Sql.Add('  AND idtitular = '+inttostr(pIdTitular)+'                         ');
  QryPlanoContabInss.Sql.Add('  and idsitbeneficio = 1                                           ');
  QryPlanoContabInss.Sql.Add('  and fontepagadora=2                                              ');
  QryPlanoContabInss.Sql.Add('  AND NOT EXISTS (SELECT 1 FROM benefbfciario b                    ');
  QryPlanoContabInss.Sql.Add('                   WHERE b.idpessoa = bb.idpessoa                  ');
  QryPlanoContabInss.Sql.Add('                     AND b.idtitular = bb.idtitular                ');
  QryPlanoContabInss.Sql.Add('                     AND b.idplanoprev = bb.idplanoprev            ');
  QryPlanoContabInss.Sql.Add('                     AND b.idplanprevcontab = bb.idplanprevcontab  ');
  QryPlanoContabInss.Sql.Add('                     AND b.fontepagadora = 1                       ');
  QryPlanoContabInss.Sql.Add('                     AND b.idsitbeneficio <> 3                     ');
  QryPlanoContabInss.Sql.Add('                     AND b.idtppagtobenefic = 1)                   ');
  QryPlanoContabInss.Sql.Add('  AND NOT EXISTS (SELECT 1 FROM benefbfciario bbb                  ');
  QryPlanoContabInss.Sql.Add('                   WHERE bbb.idpessoa = bb.idpessoa                ');
  QryPlanoContabInss.Sql.Add('                     AND bbb.idtitular = bb.idtitular              ');
  QryPlanoContabInss.Sql.Add('                     AND bbb.fontepagadora = 1                     ');
  QryPlanoContabInss.Sql.Add('                     AND bbb.idtppagtobenefic = 2)                 ');

  QryPlanoContabInss.Open;

  if QryPlanoContabInss.isEmpty then begin
    QryPlanoContabInss.Close;
    QryPlanoContabInss.Sql.Clear;

    QryPlanoContabInss.Sql.Add('select idplanprevcontab, idplanoPrev                               ');
    QryPlanoContabInss.Sql.Add('from benefbfciario bb                                              ');
    QryPlanoContabInss.Sql.Add('where idpessoa = '+inttostr(pIdPessoa)+'                           ');
    QryPlanoContabInss.Sql.Add('  AND idtitular = '+inttostr(pIdTitular)+'                         ');
    QryPlanoContabInss.Sql.Add('  and idsitbeneficio = 1                                           ');
    QryPlanoContabInss.Sql.Add('  and fontepagadora = 2                                            ');
    QryPlanoContabInss.Sql.Add('  AND EXISTS (SELECT 1                                             ');
    QryPlanoContabInss.Sql.Add('                FROM benefbfciario b                               ');
    QryPlanoContabInss.Sql.Add('               WHERE b.idpessoa = bb.idpessoa                      ');
    QryPlanoContabInss.Sql.Add('                 AND b.idtitular = bb.idtitular                    ');
    QryPlanoContabInss.Sql.Add('                 AND b.fontepagadora = 1                           ');
    QryPlanoContabInss.Sql.Add('                 AND b.idsitbeneficio = 4                          ');
    QryPlanoContabInss.Sql.Add('                 AND b.idtppagtobenefic = 1)                       ');
    QryPlanoContabInss.Sql.Add('  AND NOT EXISTS (SELECT 1                                         ');
    QryPlanoContabInss.Sql.Add('                    FROM benefbfciario b                           ');
    QryPlanoContabInss.Sql.Add('                   WHERE b.idpessoa = bb.idpessoa                  ');
    QryPlanoContabInss.Sql.Add('                     AND b.idtitular = bb.idtitular                ');
    QryPlanoContabInss.Sql.Add('                     AND b.idplanoprev = bb.idplanoprev            ');
    QryPlanoContabInss.Sql.Add('                     AND b.idplanprevcontab = bb.idplanprevcontab  ');
    QryPlanoContabInss.Sql.Add('                     AND b.fontepagadora = 1                       ');
    QryPlanoContabInss.Sql.Add('                     AND b.idsitbeneficio = 3                      ');
    QryPlanoContabInss.Sql.Add('                     AND b.idtppagtobenefic = 1)                   ');

    QryPlanoContabInss.Open;
  end;

  if not QryPlanoContabInss.isEmpty then begin
    if (QryPlanoContabInss.FieldByname('idPLanPrevContab').asInteger <> IdPLanoPrevContab) then begin
        sMsg := 'O assistido possuí benefício INSS Ativo com Plano Contábil diferente do Plano Contábil do benefício que está sendo concedido.'+#13+
       'A concessão alterará o Plano Contábil do benefício INSS ativo. Deseja continuar?';
       if MessageDlg(sMsg, mtConfirmation, [mbYes, mbNo], 0) = id_No then begin
         Result := False;
         Exit;
       end;
    end else begin
      Result := True;
      Exit;
    end;


    if (QryPlanoContabInss.FieldByname('idPLanoPrev').asInteger = IdplanoPrev) then begin
      qryUpdPlanoContab.Close;
      qryUpdPlanoContab.ParamByName('IDPESSOA').asInteger         := pIdPessoa;
      qryUpdPlanoContab.ParamByName('IDPLANOPREV').asInteger      := IdplanoPrev;
      qryUpdPlanoContab.ParamByName('IDPLANPREVCONTAB').asInteger := IdPLanoPrevContab;
      qryUpdPlanoContab.ExecSQL;
    end else begin

        sSQL := ' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3, DATAFINAL =  (SELECT TO_CHAR(SYSDATE,''DD/MM/YYYY'') FROM DUAL)' +
      ' WHERE IDPESSOA ='+ intToStr(pIdPessoa) +
      ' AND idsitbeneficio= 1                                                    '+
      ' AND fontepagadora = 2                                                    '+
      ' AND IdPlanoPrev = ' + QryPlanoContabInss.FieldByname('idPLanoPrev').asString+ //Renato Visoni SOL 127345 Kintana 674527
      ' AND idtitular   = ' + qryDet.FieldByname('idTitular').asString; ////Renato Visoni SOL 127345 Kintana 674527

      qryUpdAux.Close;
      qryUpdAux.SQL.Clear;
      qryUpdAux.SQL.Add(sSQL);
      qryUpdAux.ExecSQL;


   sSQL := ' Insert into bfciariotitplan   '+
     ' (idtitular, '+
     ' idpessjur, '+
     ' idplanoprev, '+
     ' idpessoa,    '+
     ' idresponsavel, '+
     ' idbeneficio,   '+
     ' seqproposta,   '+
     ' iddepenrespon, '+
     ' prioridade,    '+
     ' percentual,    '+
     ' idnucleofamiliar, '+
     ' codtiporecebedor, '+
     ' datafimreceb,    '+
     ' idresponnaorec,  '+
     ' idplanoorigem) '+
     '  select idtitular,            '+
     '         idpessjur,            '+
     ' '+intTostr(IdplanoPrev)+' as  idplanoprev,          '+
     '         idpessoa,             '+
     '         idresponsavel,        '+
     '         idbeneficio,          '+
     '         seqproposta,          '+
     '         iddepenrespon,        '+
     '         prioridade,           '+
     '         percentual,           '+
     '         idnucleofamiliar,     '+
     '         codtiporecebedor,     '+
     '         datafimreceb,         '+
     '         idresponnaorec,       '+
     ' '+intTostr(IdplanoPrev)+' as idplanoorigem         '+
     '    from bfciariotitplan       '+
     '     where idpessoa = '+ intTostr(pIdPessoa) +
     '     and idplanoprev ='+ QryPlanoContabInss.FieldByname('idPLanoPrev').asString;

     qryUpdAux.Close;
     qryUpdAux.SQL.Clear;
     qryUpdAux.SQL.Add(sSQL);
     qryUpdAux.ExecSQL;



      sSQL := ' INSERT INTO BENEFBFCIARIO  '+
      '(                        '+
      '    numeroprocesso,      '+
      '    idplanoprev,         '+
      '    idtitular,           '+
      '    idpessjur,           '+
      '    idbeneficio,         '+
      '    idpessoa,            '+
      '    plano,               '+
      '    seqproposta,         '+
      '    tipcodigo,           '+
      '    codcentrorespon,     '+
      '    idempresaprop,       '+
      '    iddependencia,       '+
      '    idsitbeneficio,      '+
      '    codsubconta,         '+
      '    placontad,           '+
      '    placontac,           '+
      '    idtppagtobenefic,    '+
      '    datafinal,           '+
      '    codcentrocustod,     '+
      '    codcentrocustoc,     '+
      '    valoratual,          '+
      '    percparticipacao,    '+
      '    idempresa,           '+
      '    unidnegoc,           '+
      '    idadeingresso,       '+
      '    codportforma,        '+
      '    datarequerimento,    '+
      '    datainicio,          '+
      '    tmppagtobeneficio,   '+
      '    flgformapagto,       '+
      '    valorcalculado,      '+
      '    dataultreajuste,     '+
      //'    motivocancelamen,    '+
      '    ultmespreparo,       '+
      '    vlrcalcinss,         '+
      '    vlrinfinss,          '+
      '    datainicioinss,      '+
      '    numprocinss,         '+
      '    datainiciofund,      '+
      '    flgbenefmin,         '+
      '    valorcotas,          '+
      '    valortotal,          '+
      '    dataconcessao,       '+
      '    dataencerramento,    '+
      '    flgprovisorio,       '+
      '    percprovisorio,      '+
      '    prazoprovisorio,     '+
      '    numcartarecad,       '+
      '    dataemissaorecad,    '+
      '    datalimiterecad,     '+
      '    datarecebrecad,      '+
      '    flgstatus,           '+
      '    bancoinss,           '+
      '    mesreciboinss,       '+
      '    anoreciboinss,       '+
      '    fontepagadora,       '+
      '    idagenciaresgate,    '+
      '    ultmesreajuste,      '+
      '    ultvaloratualreaj,   '+
      '    ultvalorbruto,       '+
      '    valorabono13,        '+
      '    dibbenefant,         '+
      '    flgdataprevista,     '+
      '    datafinalprevista,   '+
      '    dfloatpagto,         '+
      '    flgtipoinss,         '+
      '    idplanprevcontab,    '+
      '    valorbenefant,       '+
      '    valorbinss1,         '+
      '    valorbinss2,         '+
      '    valorbinss3,         '+
      '    valorbinssant1,      '+
      '    valorbinssant2,      '+
      '    valorbinssant3,      '+
      '    flgencerraporfale,   '+
      '    dataultrevisao,      '+
      '    flgdescirmes,        '+
      '    percentual,          '+
      '    valornadib,          '+
      '    flgpossuiacompinss,  '+
      '    valorsrb,            '+
      '    idbenefreferen,      '+
      '    dataliberacao,       '+
      '    mespagliberacao,     '+
      '    idplanoorigem,       '+
      '    idtitbenef,          '+
      '    flgacertocbp,        '+
      '    valorbase1,          '+
      '    valorbase2,          '+
      '    valorbase3,          '+
      '    recpag,              '+
      '    codrecebcapabn,      '+
      '    codtiprecebdevol,    '+
      '    placontacabn,        '+
      '    idempresadesemb,     '+
      '    codsubcontaabn,      '+
      '    recpagdesemb,        '+
      '    idempresapropabn,    '+
      '    codtiprecdesadt,     '+
      '    codtipdesembprov,    '+
      '    codtiprecebcap13,    '+
      '    codtiprecebcap,      '+
      '    codtiprecdesabn,     '+
      '    codtiprecdes,        '+
      '    codcentrorespona,    '+
      '    codportformaabn,     '+
      '    unidnegocabn,        '+
      '    placontacprovadt,    '+
      '    placontadprovadt,    '+
      '    placontacprovis,     '+
      '    placontadprovis,     '+
      '    plactaacjud13,       '+
      '    plactaacjud,         '+
      '    placontadabn,        '+
      '    flgmoveureserva,     '+
      '    placontadadt13,      '+
      '    flgpagainss )        '+
      '  SELECT numeroprocesso,    '+
      '  '+intTostr(IdplanoPrev)+ ' as idplanoprev,'+
      '   idtitular,               '+
      '   idpessjur,               '+
      '   idbeneficio,             '+
      '   idpessoa,                '+
      '   plano,                   '+
      '   seqproposta,             '+
      '   tipcodigo,               '+
      '   codcentrorespon,         '+
      '   idempresaprop,           '+
      '   iddependencia,           '+
      '   1 AS idsitbeneficio,     '+
      '   codsubconta,             '+
      '   placontad,               '+
      '   placontac,               '+
      '   idtppagtobenefic,        '+
      '   NULL AS datafinal,       '+ ////Renato Visoni SOL 127345 Kintana 67452
      '   codcentrocustod,         '+
      '   codcentrocustoc,         '+
      '   valoratual,              '+
      '   percparticipacao,        '+
      '  idempresa,                '+
      '   unidnegoc,               '+
      '   idadeingresso,           '+
      '  codportforma,             '+
      '  datarequerimento,         '+
      '  datainicio,               '+
      '  tmppagtobeneficio,        '+
      '  flgformapagto,            '+
      '  valorcalculado,           '+
      '  dataultreajuste,          '+
      //'  motivocancelamen,         '+
      '  ultmespreparo,            '+
      '  vlrcalcinss,              '+
      '  vlrinfinss,               '+
      '  datainicioinss,           '+
      '  numprocinss,              '+
      '  datainiciofund,           '+
      '  flgbenefmin,              '+
      '  valorcotas,               '+
      '  valortotal,               '+
      '  dataconcessao,            '+
      '  NULL AS dataencerramento, '+
      '  flgprovisorio,            '+
      '  percprovisorio,           '+
      '  prazoprovisorio,          '+
      '  numcartarecad,            '+
      '  dataemissaorecad,         '+
      '  datalimiterecad,          '+
      '  datarecebrecad,           '+
      '  flgstatus,                '+
      '  bancoinss,                '+
      '  mesreciboinss,            '+
      '  anoreciboinss,            '+
      '  fontepagadora,            '+
      '  idagenciaresgate,         '+
      '  ultmesreajuste,           '+
      '  ultvaloratualreaj,        '+
      '  ultvalorbruto,            '+
      '  valorabono13,             '+
      '  dibbenefant,              '+
      '  flgdataprevista,          '+
      '  datafinalprevista,        '+
      '  dfloatpagto,              '+
      '  flgtipoinss,              '+
      '  '+intTostr(IdPLanoPrevContab)+' as idplanprevcontab,'+
      '  valorbenefant,            '+
      '  valorbinss1,              '+
      '  valorbinss2,              '+
      '  valorbinss3,              '+
      '  valorbinssant1,           '+
      '  valorbinssant2,           '+
      '  valorbinssant3,           '+
      '  flgencerraporfale,        '+
      '  dataultrevisao,           '+
      '  flgdescirmes,             '+
      '  percentual,               '+
      '  valornadib,               '+
      '  flgpossuiacompinss,       '+
      '  valorsrb,                 '+
      '  idbenefreferen,           '+
      '  dataliberacao,            '+
      '  mespagliberacao,          '+
      '  '+intTostr(IdplanoPrev)+ ' as idplanoorigem,            '+
      '  idtitbenef,               '+
      '  flgacertocbp,             '+
      '  valorbase1,               '+
      '  valorbase2,               '+
      '  valorbase3,               '+
      '  recpag,                   '+
      '  codrecebcapabn,           '+
      '  codtiprecebdevol,         '+
      '  placontacabn,             '+
      '  idempresadesemb,          '+
      '  codsubcontaabn,           '+
      '  recpagdesemb,             '+
      '  idempresapropabn,         '+
      '  codtiprecdesadt,          '+
      '  codtipdesembprov,         '+
      '  codtiprecebcap13,         '+
      '  codtiprecebcap,           '+
      '  codtiprecdesabn,          '+
      '  codtiprecdes,             '+
      '  codcentrorespona,         '+
      '  codportformaabn,          '+
      '  unidnegocabn,             '+
      '  placontacprovadt,         '+
      '  placontadprovadt,         '+
      '  placontacprovis,          '+
      '  placontadprovis,          '+
      '  plactaacjud13,            '+
      '  plactaacjud,              '+
      '  placontadabn,             '+
      '  flgmoveureserva,          '+
      '  placontadadt13,           '+
      '  flgpagainss               '+
      ' FROM benefbfciario            '+
      ' WHERE IDPESSOA ='+ intTostr(pIdPessoa) +
      ' AND idsitbeneficio= 3         '+
      ' AND fontepagadora = 2         '+
      ' AND idplanoPrev ='+ QryPlanoContabInss.FieldByname('idPLanoPrev').asString +
      ' AND idTitular   ='+ QryDet.FieldByname('idTitular').asString ; //Renato Visoni SOL 127345 Kintana 674527

      qryUpdAux.Close;
      qryUpdAux.SQL.Clear;
      qryUpdAux.SQL.Add(sSQL);
      qryUpdAux.ExecSQL;


     sSQL := ' UPDATE HSTBENEFBFCIARIO SET IDPLANOPREV ='+intTostr(IdplanoPrev)+',IDPLANOORIGEM ='+intTostr(IdplanoPrev)+
             ' WHERE idpessoa ='+intTostr(pIdPessoa) +
             ' AND fontepagadora = 2          '+
             ' AND IdTitular = ' + QryDet.FieldByname('idTitular').asString+ // //Renato Visoni SOL 127345 Kintana 674527
             ' AND idplanoPrev ='+ QryPlanoContabInss.FieldByname('idPLanoPrev').asString ;//Renato Visoni SOL 127345 Kintana 674527


     qryUpdAux.Close;
     qryUpdAux.SQL.Clear;
     qryUpdAux.SQL.Add(sSQL);
     qryUpdAux.ExecSQL;


    end;
  end;
  //Renato Visoni SOL 118811 Kintana 569080
end;}

Function TfrmCadRequerBenefParticip.RodaQuitacaoEmptmo: boolean; //Thiago Passos 97577 Kintana 424749
Var
   bRegReplanResgatado, bRegPlanCancelado, bResgNovoPlano: Boolean;
   xQryAux: TwwQuery;
Begin
  Result := False;
  bRegPlanCancelado := True;

  try
    xQryAux := TwwQuery.Create(Application);
    xQryAux.DatabaseName := 'BaseDados';

    xQryAux.Close;
    xQryAux.SQL.Clear;
    xQryAux.SQL.Add('SELECT pp.idplanoprev');
    xQryAux.SQL.Add('  FROM PARTPREVPLAN PP, sitpart s');
    xQryAux.SQL.Add(' WHERE PP.IDPESSOA = :IDPESSOA');
    xQryAux.SQL.Add('   AND PP.IDPLANOPREV = 2');
    xQryAux.SQL.Add('   AND PP.IDSITPLANOPREV = 25');
    xQryAux.SQL.Add('   AND pp.idsitpart = s.idsitpart');
    xQryAux.SQL.Add('   AND s.flginterno <> ''CA''');
    xQryAux.ParamByName('IDPESSOA').AsInteger := QryDet.FieldByName('idpessoa').asInteger;
    xQryAux.Open;

    bRegPlanCancelado := xQryAux.IsEmpty;

    //Verifica quais planos estão sendo resgatados nesse momento
    QryDet.First;
    while not QryDet.Eof do begin
      If (QryDet.FieldByName('idplanoprev').asInteger = 74) and (QryDet.FieldByName('flgresgate').asInteger = 1) then begin
        bResgNovoPlano := true;
      end;
      If (QryDet.FieldByName('idplanoprev').asInteger = 2) and (QryDet.FieldByName('flgresgate').asInteger = 1) then begin
        bResgateRegReplan := true;
      end;
      QryDet.Next;
    end;

    //Se for do Novo Plano Originario de RegReplan e o RegRegPlan também for resgatado ou já foi resgatado anteriormente
    //então roda a regra de quitação
    if (bResgNovoPlano = True) And ((bResgateRegRePlan = True) Or (bRegPlanCancelado = True)) then begin
      Result := true;
    end;

  finally
    FreeAndNil(xQryAux);
  end;
end;

Procedure TfrmCadRequerBenefParticip.AjustaAtivacaoPlano; //Thiago Passos 97577 Kintana 424749
Var
   xQryAux: TwwQuery;
   bResgNovoPlano, bResgateRegReplan, bRegPlanCancelado, bResgateReb: boolean ;
   SMsg : string;
Begin
  try
    SMsg := '';
    xQryAux := TwwQuery.Create(Application);
    xQryAux.DatabaseName := 'BaseDados';

   //Verifica quais os planos foram resgatados
    bResgNovoPlano    := false;
    bResgateReb       := false;
    bResgateRegReplan := false;
    // xavier alteração na query de controle para não considerar eventos de resgate SOL 155566/4401 Kintana 1214773
    qryDetAux.First;
    while not qryDetAux.Eof do
    begin
      if qryDetAux.FieldByName('flgresgate').asInteger = 1 then
      begin
        case qryDetAux.FieldByName('idplanoprev').asInteger of
           74 : bResgNovoPlano    := True;
           66 : bResgateReb       := True;  //Fernando Santana SOL 143833 KINTANA 943330
            2 : bResgateRegReplan := True;
        end;
      end;

      qryDetAux.Next;

    end;
    // xavierv SOL 155566/4401 Kintana 1214773

   //Se novo plano foi resgatado e o RegReplan Saldado(idsitplanprev = 25 e idplanoprev =2) não foi, O RegReplan tem que ficar com o partplanprev.flgdesativado = 0
   //Se todos os planos foram resgatados não fazer nada, pois o proprio sistema desativa

   //A Variavel bResgateRegReplan verifica se o RegReplan está sendo resgatado nesse momento
   //A rotina abaixo verifica se o plano RegReplan ja foi resgatado anterioremente (Cancelado).
   //Então se a variavel bCancelado for igual a True significa que o plano ja foi cancelado
   //E não pode ser reativado novamente
   //E se a variavel  bResgateRegReplan for True, significa que está resgantando agora e também
   //não pode ser reativado

   bRegPlanCancelado := True;

   xQryAux.Close;
   xQryAux.SQL.Clear;
   xQryAux.SQL.Add('SELECT pp.idplanoprev');
   xQryAux.SQL.Add('  FROM PARTPREVPLAN PP, sitpart s');
   xQryAux.SQL.Add(' WHERE PP.IDPESSOA = :IDPESSOA');
   xQryAux.SQL.Add('   AND PP.IDPLANOPREV = 2');
   xQryAux.SQL.Add('   AND PP.IDSITPLANOPREV = 25');
   xQryAux.SQL.Add('   AND pp.idsitpart = s.idsitpart');
   xQryAux.SQL.Add('   AND s.flginterno <> ''CA''');
   xQryAux.ParamByName('IDPESSOA').AsInteger := QryDet.FieldByName('idpessoa').asInteger;
   xQryAux.Open;

   bRegPlanCancelado := xQryAux.IsEmpty;

   if ((bResgNovoPlano = True) or (bResgateReb = True)) And (bResgateRegReplan = False) And (bRegPlanCancelado = False) then
   begin
     xQryAux.Close;
     xQryAux.SQL.Clear;
     xQryAux.SQL.Add('UPDATE partprevplan SET');
     xQryAux.SQL.Add(' flgdesativado    = 0,');                //Reativando o Contrato
     xQryAux.SQL.Add(' DataSaldamento   = DataCancelamento,'); //Guardando a data do cancelamento no campo DataSaldamento
     xQryAux.SQL.Add(' DataCancelamento     = NULL');          //Limpando o campo DataCancelamento
     xQryAux.SQL.Add(' WHERE idpessoa       = :IDPESSOA');
     xQryAux.SQL.Add('   AND idplanoprev    = 2');
     xQryAux.SQL.Add('   AND idsitplanoprev = 25');
     xQryAux.ParamByName('IDPESSOA').AsInteger := QryDet.FieldByName('idpessoa').asInteger;
     xQryAux.ExecSQL;
     if (xQryAux.RowsAffected > 0) then
        SMsg := 'O Plano REGREPLAN SALDADO foi Ativado!';
   end;

   if bResgNovoPlano = True then
   begin
     xQryAux.Close;
     xQryAux.SQL.Clear;
     xQryAux.SQL.Add('UPDATE partprevplan SET');
     xQryAux.SQL.Add(' flgdesativado     = 1 ');                //Desativando o Contrato
     xQryAux.SQL.Add(' WHERE idpessoa    = :IDPESSOA');
     xQryAux.SQL.Add('   AND idplanoprev = 74');
     xQryAux.ParamByName('IDPESSOA').AsInteger := QryDet.FieldByName('idpessoa').asInteger;
     xQryAux.ExecSQL;
   end;

   // Inicio - Fernando Santana SOL 143833 KINTANA 943330
   if bResgateReb = True then
   begin
     xQryAux.Close;
     xQryAux.SQL.Clear;
     xQryAux.SQL.Add('UPDATE partprevplan SET');
     xQryAux.SQL.Add(' flgdesativado     = 1 ');
     xQryAux.SQL.Add(' WHERE idpessoa    = :IDPESSOA');
     xQryAux.SQL.Add('   AND idplanoprev = 66');
     xQryAux.ParamByName('IDPESSOA').AsInteger := QryDet.FieldByName('idpessoa').asInteger;
     xQryAux.ExecSQL;
   end;
   // Fim - Fernando Santana SOL 143833 KINTANA 943330
   if SMsg <> '' then
     Showmessage(SMsg);


   finally
     FreeAndNil(xQryAux);
   end;
end;


procedure TfrmCadRequerBenefParticip.ExibirQuantidadeParcelasParaResgateParcelado;
var
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  resgateParcelado : Boolean;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520  
begin
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  resgateParcelado := (dbrgrpResgateParcelado.Value = '1');
  lblQdeParcelas.Visible := resgateParcelado;
  dbedQtdeParcelas.Visible := resgateParcelado;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
end;

//MARCELO ALMEIDA - SOL 63067 - KTN 524520
function TfrmCadRequerBenefParticip.ProcessarResgateParcelado: Boolean;
var
  resgateParcelado : Boolean;
  qtdeParcelasResgate : Integer;
  saldoRestante : Double;
  valorParcela : Double;

  procedure InserirRubricaResgate;
  var
    qrySEQRUBRICAINDIV : TwwQuery;
    insRUBRICAINDIV : TwwQuery;
    sequencialRubricaIndiv : Integer;
  begin

    //Obter sequencial da rubrica individual
    sequencialRubricaIndiv := 1;
    qrySEQRUBRICAINDIV := TwwQuery.Create(Application);
    try
      qrySEQRUBRICAINDIV.DatabaseName := 'BaseDados';
      with qrySEQRUBRICAINDIV do
      begin
        SQL.Clear;
        SQL.Add('SELECT (NVL(MAX(RI_S.SEQRUBRICAINDIV), 0)+1) SEQRUBRICAINDIV');
        SQL.Add('  FROM RUBRICAINDIV RI_S');
        SQL.Add(' WHERE RI_S.IDPESSOA = :IDPESSOA');
        SQL.Add('   AND RI_S.IDRUBRICA = :IDRUBRICA');
      end;
      qrySEQRUBRICAINDIV.Params.Clear;
      qrySEQRUBRICAINDIV.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput).AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
      qrySEQRUBRICAINDIV.Params.CreateParam(ftInteger, 'IDRUBRICA', ptInput).AsInteger := qryDet.FieldByName('IDRUBRICA').AsInteger;
      qrySEQRUBRICAINDIV.Open;
      if (not(qrySEQRUBRICAINDIV.IsEmpty)) then
      begin
        sequencialRubricaIndiv := qrySEQRUBRICAINDIV.FieldByName('SEQRUBRICAINDIV').AsInteger;
      end;
    finally
      FreeAndNil(qrySEQRUBRICAINDIV);
    end;

    //Inserir registro da RUBRICAINDIV
    insRUBRICAINDIV := TwwQuery.Create(Application);
    try
      insRUBRICAINDIV.DatabaseName := 'BaseDados';
      with insRUBRICAINDIV do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO RUBRICAINDIV (');
        SQL.Add('                          IDPESSOA,');
        SQL.Add('                          IDEMPRESA,');
        SQL.Add('                          IDRUBRICA,');
        SQL.Add('                          NUMOCORRENCIAS,');
        SQL.Add('                          SEQRUBRICAINDIV,');
        SQL.Add('                          IDFAVORECIDO,');
        SQL.Add('                          IDREGRACALCULO,');
        SQL.Add('                          VALORRUBRICA,');
        SQL.Add('                          ANOMESINICIO,');
        SQL.Add('                          FLGPERMANENTE,');
        SQL.Add('                          PARCELAS,');
        SQL.Add('                          FLGPERCENT,');
        SQL.Add('                          FLGTPRUBMANUT,');
        SQL.Add('                          FLGPENSAOALIM,');
        SQL.Add('                          RUBRICAPROVENTOPA,');
        SQL.Add('                          DATAFINAL,');
        SQL.Add('                          ANOMESREF,');
        SQL.Add('                          CODPORTFORMA,');
        SQL.Add('                          IDTITULAR,');
        SQL.Add('                          DATAINICIO,');
        SQL.Add('                          FLGBASEPA,');
        SQL.Add('                          FLGUSAABONO,');
        SQL.Add('                          IDALIMENTADO,');
        SQL.Add('                          IDLOTE,');
        SQL.Add('                          FLGDESATIVADO,');
        SQL.Add('                          FLGUSADO,');
        SQL.Add('                          FLGCALCULACPMF,');
        SQL.Add('                          ULTMESPREPARO,');
        SQL.Add('                          VALORANTERIOR,');
        SQL.Add('                          IDPROCESSO,');
        SQL.Add('                          IDRUBRICA13,');
        SQL.Add('                          IDRUBRICAPROVENTO13,');
        SQL.Add('                          IDMOTIVO,');
        SQL.Add('                          IDLOTEREVISAO,');
        SQL.Add('                          FLGANTECIPABONO,');
        SQL.Add('                          IDSEQINTERNOFB,');
        SQL.Add('                          NUMPROCINSS,');
        SQL.Add('                          IDMOVBENEF,');
        SQL.Add('                          FLGCONTROLASALDO,');
        SQL.Add('                          VLRSALDOINICIAL,');
        SQL.Add('                          VLRTOTALPROC,');
        SQL.Add('                          IDPLANOCONTABIL,');
        SQL.Add('                          FLGRETROACAO,');
        SQL.Add('                          FLGANTECIPAABONOINSS,');
        SQL.Add('                          SITUACAOAJ,');
        SQL.Add('                          OBSERVACAO,');
        SQL.Add('                          FLGRUBRICARESGATE,');
        SQL.Add('                          IDTMPDESC,');
        SQL.Add('                          FLGREPROGRAMACAO, ');
        SQL.Add('                          FLGRESGATEPARCELADO ');
        SQL.Add('                         )');
        SQL.Add('                  VALUES');
        SQL.Add('                         (');
        SQL.Add('                          :IDPESSOA,');
        SQL.Add('                          1,');
        SQL.Add('                          :IDRUBRICA,');
        SQL.Add('                          0,');
        SQL.Add('                          :SEQRUBRICAINDIV,');
        SQL.Add('                          NULL,');
        SQL.Add('                          22423,');
        SQL.Add('                          :VALORRUBRICA,');
        SQL.Add('                          :ANOMESINICIO,');
        SQL.Add('                          0,');
        SQL.Add('                          :PARCELAS,');
        SQL.Add('                          NULL,');
        SQL.Add('                          1,');
        SQL.Add('                          0,');
        SQL.Add('                          NULL,');
        SQL.Add('                          :DATAFINAL,');
        SQL.Add('                          :ANOMESREF,');
        SQL.Add('                          NULL,');
        SQL.Add('                          :IDTITULAR,');
        SQL.Add('                          :DATAINICIO,');
        SQL.Add('                          0,');
        SQL.Add('                          0,');
        SQL.Add('                          NULL,');
        SQL.Add('                          :IDLOTE,');
        SQL.Add('                          0,');
        SQL.Add('                          0,');
        SQL.Add('                          0,');
        SQL.Add('                          NULL,');
        SQL.Add('                          0,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          :IDSEQINTERNOFB,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          0,');
        SQL.Add('                          :VLRSALDOINICIAL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          :IDPLANOCONTABIL,');
        SQL.Add('                          1,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          1,');
        SQL.Add('                          NULL,');
        SQL.Add('                          NULL,');
        SQL.Add('                          1');
        SQL.Add('                         )');
      end;
      insRUBRICAINDIV.Params.Clear;
      insRUBRICAINDIV.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput).AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;

      if qryDet.FieldByName('IDBENEFICIO').AsInteger = 231 Then
         insRUBRICAINDIV.Params.CreateParam(ftInteger, 'IDRUBRICA', ptInput).AsInteger := 36247
      else
      if qryDet.FieldByName('IDBENEFICIO').AsInteger = 378 Then
         insRUBRICAINDIV.Params.CreateParam(ftInteger, 'IDRUBRICA', ptInput).AsInteger := 39772;

      insRUBRICAINDIV.Params.CreateParam(ftInteger, 'SEQRUBRICAINDIV', ptInput).AsInteger := sequencialRubricaIndiv;
      insRUBRICAINDIV.Params.CreateParam(ftFloat,  'VALORRUBRICA', ptInput).AsFloat := valorParcela;
      insRUBRICAINDIV.Params.CreateParam(ftString, 'ANOMESINICIO', ptInput).AsString := FormatDateTime('yyyy/mm', qryDet.FieldByName('DATAINICIO').AsDateTime);
      insRUBRICAINDIV.Params.CreateParam(ftInteger, 'PARCELAS', ptInput).AsInteger := qtdeParcelasResgate;

      if (qryDet.FieldByName('FlgDataPrevista').AsInteger = 0) then
      begin
        insRUBRICAINDIV.Params.CreateParam(ftDateTime, 'DATAFINAL', ptInput).AsDateTime := qryDet.FieldByName('DATAFINAL').AsDateTime;
      end
      else
      begin
        insRUBRICAINDIV.Params.CreateParam(ftDateTime, 'DATAFINAL', ptInput).AsDateTime := qryDet.FieldByName('DATAFINALPREVISTA').AsDateTime;
      end;

      insRUBRICAINDIV.Params.CreateParam(ftString, 'ANOMESREF', ptInput).AsString := FormatDateTime('yyyy/mm', qryDet.FieldByName('DATAINICIO').AsDateTime);
      insRUBRICAINDIV.Params.CreateParam(ftInteger, 'IDTITULAR', ptInput).AsInteger := qryDet.FieldByName('IDTITULAR').AsInteger;
      insRUBRICAINDIV.Params.CreateParam(ftDateTime, 'DATAINICIO', ptInput).AsDateTime := qryDet.FieldByName('DATAINICIO').AsDateTime;
      insRUBRICAINDIV.Params.CreateParam(ftFloat, 'IDLOTE', ptInput).AsFloat := iIdLoteConcessao;
      insRUBRICAINDIV.Params.CreateParam(ftFloat, 'IDSEQINTERNOFB', ptInput).AsFloat := iIdLoteConcessao;
      insRUBRICAINDIV.Params.CreateParam(ftFloat, 'VLRSALDOINICIAL', ptInput).AsFloat := saldoRestante;
      insRUBRICAINDIV.Params.CreateParam(ftFloat, 'IDPLANOCONTABIL', ptInput).AsFloat := qryDet.FieldByName('IDPLANPREVCONTAB').AsFloat;
      try
         insRUBRICAINDIV.ExecSQL();
      except
      end;
    finally
      FreeAndNil(insRUBRICAINDIV);
    end;
  end;
begin
  Result := False;
  qtdeParcelasResgate := 0;
  resgateParcelado := (qryDet.FieldByName('RESGATEPARCELADO').AsInteger = 1);
  if (resgateParcelado) then
  begin
    qtdeParcelasResgate := qryDet.FieldByName('QTDEPARCELAS').AsInteger;
    if ((qtdeParcelasResgate >= 2) and (qtdeParcelasResgate <= 12)) then
    begin
      //if (not(ParticipantePossuiEmprestimo(qryDet.FieldByName('IDPESSOA').AsInteger))) then
      //begin
        //saldoRestante := SaldoRestanteReservasParticipante(qryDet.FieldByName('IDPESSOA').AsInteger,
        //                                                   qryDet.FieldByName('IDTITULAR').AsInteger,
        //                                                   qryDet.FieldByName('IDBENEFICIO').AsInteger,
        //                                                   qryDet.FieldByName('IDPESSOA').AsInteger);
        saldoRestante := 0;
        valorParcela  := 0;//(saldoRestante / qtdeParcelasResgate);
        if qryDet.FieldByName('IDPLANOPREV').AsInteger = 2 then // [a Rubrica de correção so tem q ser lançada para o plano regreplan
           InserirRubricaResgate();
        Result := True;
     // end;
      //else
      //begin
      //MessageDlg('Para participantes que possuem empréstimo,'+#13+#10+' não será permitido o resgate parcelado!', mtInformation, [mbOK], 0);
      //end;
    end
    else
    begin
      MessageDlg('Quantidade de parcelas para resgate parcelado inválido!', mtInformation, [mbOK], 0);
    end;
  end
  else
  begin
    Result := True;
  end;
end;
//MARCELO ALMEIDA - SOL 63067 - KTN 524520


//MARCELO ALMEIDA - SOL 63067 - KTN 524520
function TfrmCadRequerBenefParticip.ParticipantePossuiEmprestimo(
  AIdPessoa: Integer): Boolean;
var
  qryCONTRATOEMPTMO : TwwQuery;
begin
  qryCONTRATOEMPTMO := TwwQuery.Create(Application);
  try
    if (qryCONTRATOEMPTMO.Active) then
    begin
      qryCONTRATOEMPTMO.Close;
    end;
    qryCONTRATOEMPTMO.DatabaseName := 'BaseDados';
    with qryCONTRATOEMPTMO do
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) QTDE_EMPTMO_ABERTO');
      SQL.Add('  FROM CONTRATOEMPTMO CE');
      SQL.Add(' WHERE CE.IDPESSOA = :IDPESSOA');
      SQL.Add('   AND CE.FLGSITUACAO = ''A''');
    end;
    qryCONTRATOEMPTMO.Params.Clear;
    qryCONTRATOEMPTMO.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput).AsInteger := AIdPessoa;
    qryCONTRATOEMPTMO.Open;
    Result := ((not(qryCONTRATOEMPTMO.IsEmpty)) and (qryCONTRATOEMPTMO.FieldByName('QTDE_EMPTMO_ABERTO').AsInteger > 0))
  finally
    if (qryCONTRATOEMPTMO.Active) then
    begin
      qryCONTRATOEMPTMO.Close;
    end;
    FreeAndNil(qryCONTRATOEMPTMO);
  end;
end;
//MARCELO ALMEIDA - SOL 63067 - KTN 524520

//MARCELO ALMEIDA - SOL 63067 - KTN 524520
function TfrmCadRequerBenefParticip.SaldoRestanteReservasParticipante(
  AIdPessoa, AIdTitular, AIdBeneficio: Integer;
  ADataSaldoEmptmo: TDateTime): Double;
var
  qryBENEFBFCIARIO : TwwQuery;
  valorTotal : Double;
  saldoRestante : Double;
  fSaldoAtualizado,
  fSaldoDevedor,
  fParcelasAberto : Currency;
begin
  valorTotal := 0;
  saldoRestante := 0;
  qryBENEFBFCIARIO := TwwQuery.Create(Application);
  try
    if (qryBENEFBFCIARIO.Active) then
    begin
      qryBENEFBFCIARIO.Close;
    end;
    qryBENEFBFCIARIO.DatabaseName := 'BaseDados';
    with qryBENEFBFCIARIO do
    begin
      SQL.Clear;
      SQL.Add('SELECT BB.valortotal');
      SQL.Add('  FROM benefbfciario BB');
      SQL.Add(' WHERE BB.idpessoa = :IDPESSOA');
      SQL.Add('   AND BB.idtitular = :IDTITULAR');
      SQL.Add('   AND BB.idbeneficio = :IDBENEFICIO');
    end;
    qryBENEFBFCIARIO.Params.Clear;
    qryBENEFBFCIARIO.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput).AsInteger := AIdPessoa;
    qryBENEFBFCIARIO.Params.CreateParam(ftInteger, 'IDTITULAR', ptInput).AsInteger := AIdTitular;
    qryBENEFBFCIARIO.Params.CreateParam(ftInteger, 'IDBENEFICIO', ptInput).AsInteger := AIdBeneficio;
    qryBENEFBFCIARIO.Open;
    if (not(qryBENEFBFCIARIO.IsEmpty)) then
    begin
      valorTotal := qryBENEFBFCIARIO.FieldByName('valortotal').AsFloat;

      if (dtmDividaEP.ValorDevidoMutuario(AIdPessoa,
                                              ADataSaldoEmptmo,
                                              -1,
                                              10,
                                              fSaldoAtualizado,
                                              fSaldoDevedor,
                                              fParcelasAberto,
                                              False,
                                              False)) then
      begin
        saldoRestante := (valorTotal - fSaldoAtualizado);


      end
      else
      begin
        MsgDlg('Ocorreram erros na apuração do saldo devedor de empréstimo. Verifique.', 'Erro', mtError, [mbOk], 0);
      end;
    end
    else
    begin
      MsgDlg('Valor total para o bebeficio igual a ZERO. Verifique.', 'Erro', mtError, [mbOk], 0);
    end;
    Result := saldoRestante;
  finally
    if (qryBENEFBFCIARIO.Active) then
    begin
      qryBENEFBFCIARIO.Close;
    end;
    FreeAndNil(qryBENEFBFCIARIO);
  end;


end;
//MARCELO ALMEIDA - SOL 63067 - KTN 524520


procedure TfrmCadRequerBenefParticip.qryDetRESGATEPARCELADOValidate(
  Sender: TField);
begin
  inherited;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  ExibirQuantidadeParcelasParaResgateParcelado();
  if (Sender.AsInteger = 0) then
  begin
    Sender.DataSet.FieldByName('QTDEPARCELAS').AsInteger := 0;
  end;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
end;

procedure TfrmCadRequerBenefParticip.dbrgrpResgateParceladoChange(
  Sender: TObject);
begin
  inherited;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  ExibirQuantidadeParcelasParaResgateParcelado();
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
end;

procedure TfrmCadRequerBenefParticip.qryDetQTDEPARCELASValidate(
  Sender: TField);
begin
  inherited;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
  if (Sender.DataSet.FieldByName('RESGATEPARCELADO').AsInteger = 1) then
  begin
    if (Sender.AsInteger = 0) then
    begin
      MsgDlg('É necessário informar a quantidade de parcelas para o resgate.', Sistema.NomeModulo, mtError, [mbOk], 0);
      SysUtils.Abort;
    end;
  end;
  //MARCELO ALMEIDA - SOL 63067 - KTN 524520
end;
procedure TfrmCadRequerBenefParticip.DbLAlteradorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if Key <> #0 then
       Key := #0;
end;
procedure TfrmCadRequerBenefParticip.CalculaDias;
var

  sDataInscriFund    :TDateTime; //higor
  sDataCancelFuncao  :TDateTime; //higor
  qryAux : TwwQuery;
begin
  //Higor Nayde Ferreira SOL 153770/7741 KTN 1622372
  pTempVincFunc := 0;
  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('    SELECT DAT.IDPESSOA,                                                     '+
                 '       DAT.IDTITULAR,                                                        '+
                 '       DAT.MATRICULA,                                                        '+
                 '       DAT.DATAINSCRICAOFUND,                                                '+
                 '       DAT.DATACANCELFUNDACAO DATACANCELFUNDACAO                      '+
                 '  FROM (SELECT D.IDPESSOA,                                                   '+
                 '               D.IDTITULAR,                                                  '+
                 '               D.MATRICULA,                                                  '+
                 '               (SELECT MIN(PPP1.DTINICIOINSC)                                '+
                 '                  FROM PARTPREVPLAN PPP1                                     '+
                 '                 WHERE PPP1.IDPESSOA = D.IDPESSOA) DATAINSCRICAOFUND,        '+
                 '               (SELECT MAX(NVL(PPP1.DATACANCELAMENTO,TRUNC(SYSDATE)))        '+
                 '                  FROM PARTPREVPLAN PPP1                                     '+
                 '                 WHERE PPP1.IDPESSOA = D.IDPESSOA) DATACANCELFUNDACAO        '+
                 '          FROM DEPENTIT D                                                    '+
                 '         WHERE D.IDPESSOA = '+ INTTOSTR(IIDTITULAR)+' ) DAT');
  qryAux.Open;
  sDataInscriFund    :=   StrToDate(qryAux.FieldByName('DATAINSCRICAOFUND').AsString);
  sDataCancelFuncao  :=   StrToDate(qryAux.FieldByName('DATACANCELFUNDACAO').AsString);
//  while (sDataInscriFund <> sDataCancelFuncao +1 )do //SOL 256744 PPM 999526
//  begin //SOL 256744 PPM 999526
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('   SELECT SUM((NVL(PPP.DATACANCELAMENTO, (trunc(SYSDATE) + 1)) - PPP.INSCRICAODATA)) AS TempVincFunc  '+
                   '     FROM PARTPREVPLAN PPP                                                                                  '+
                   '     WHERE PPP.IDPESSOA = '+ IntToStr(iIdTitular)+
                   '        AND '+ QuotedStr(DateToStr(sDataInscriFund))  +' >=  '+ QuotedStr(DateToStr(sDataCancelFuncao)));
    qryAux.Open;
//    if (qryAux.FieldByName('1').AsInteger = 1) then //SOL 256744 PPM 999526
         //pTempVincFunc := pTempVincFunc + 1; //SOL 256744 PPM 999526
    pTempVincFunc := qryAux.FieldByName('TempVincFunc').AsInteger; //SOL 256744 PPM 999526
//    sDataInscriFund := sDataInscriFund +1; //SOL 256744 PPM 999526
  //end; //SOL 256744 PPM 999526
end; //Higor Nayde Ferreira SOL 153770/7741 KTN 1622372

procedure TfrmCadRequerBenefParticip.ConcederOK;
var
  sNumerosProcessos : string;
  cTipoBenef : Char;
  iIdCalculo : Integer;
begin
  inherited;
  CriaDataModule;

  If frmTipoBenefConcede = Nil Then
     Application.CreateForm(TfrmTipoBenefConcede, frmTipoBenefConcede);

  with frmTipoBenefConcede do  begin
     Caption := 'Tipo de Benefício a Conceder';
     frmTipoBenefConcede.HelpContext := 160072;
     rgrpTipo.Items.Clear;
     rgrpTipo.Items.Add('Concessão de Benefícios para o Participante (Titular)');
     rgrpTipo.Items.Add('Concessão de Benefícios para Beneficiários Diretos do Participante');
     rgrpTipo.Items.Add('Concessão de Benefícios para Beneficiários de um Beneficiário');
     ShowModal;
     cTipoBenef := cTipoBeneficio;
     //Free;
  End;
  case  cTipoBenef of
     'P' : // Concessao de Beneficio para PARTICIPANTE
     begin       sRequerimento := True;
            AbreRequerParticip(
              'CO','-1', '-1', '-1', '-1',
              DateToStr(date),'', '-1','',sNumerosProcessos,'',
              '','','','','','','','','',
              '','',lblMatricula.Caption);
     end;
     'B' : // Concessao de Beneficio para BENEFICIARIO
            AbreRequerBfciario( 'CO','-1', '-1', '-1', '-1',
                               DateToStr(date), '-1','',sNumerosProcessos,
                               '','','','','','','','', iIdCalculo
                                );
     'D' : // Manutencao de Processo para BENEFICIARIO
           AbreRequerPensionista( 'CO',
                                 '-1', '-1', '-1', '-1',
                                 '-1',
                                 DateToStr(date),
                                 sNumerosProcessos);
  end;
end;

procedure TfrmCadRequerBenefParticip.CriaDataModule;
begin
  inherited;
  If DtmRelatorios = nil
   Then Begin
     Screen.Cursor := crSQLWait;
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorios, DtmRelatorios);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorios".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
   End;

  If DtmRelatAdmPrev = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev, DtmRelatAdmPrev);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelRetroRegional = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelRetroRegional, DtmRelRetroRegional);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelRetroRegional".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatorioGerencial = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorioGerencial, DtmRelatorioGerencial);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorioGerencial".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatAdmPrev2 = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev2, DtmRelatAdmPrev2);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev2".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelTempoServicoMT = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelTempoServicoMT".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelatEspecificos = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelatEspecificos".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelTransfPlano = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelTransfPlano, DtmRelTransfPlano);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelTransfPlano".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If Screen.Cursor = crSqlWait
   Then Screen.Cursor := crDefault;
end;

procedure TfrmCadRequerBenefParticip.MostraDados(p1, p2, p3, p4 : integer; p5 : string);
var sTempoServAnoDigitado,
    sTempoServMesDigitado,
    sTempoServDiaDigitado : string;
    iTempoSimples         : Integer;
    sTempoResumido,
    sAnos,
    sMeses,
    sDias,
    sDataAdmissao         : String;
begin

     iIdTitular                := p1;
     iIdPessJur                := p2;
     iIdPlanoPrev              := p3;
     iSeqProposta              := p4;
     sDataAdmissao             := p5;
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;


     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                     ' FROM   BENEFBFCIARIO BF, BENEFICIO B ' +
                     ' WHERE BF.IDBENEFICIO = B.IDBENEFICIO ' +
                     ' AND   BF.IDTITULAR      = ' + IntToStr(iIdTitular) +
                     ' AND   BF.IDPESSOA       = ' + IntToStr(iIdTitular) +
                     ' AND   BF.SEQPROPOSTA    = ' + IntToStr(iSeqProposta) +
                     ' AND   BF.IDPESSJUR      = ' + IntToStr(iIdPessJur) +
                     ' AND   BF.IDPLANOORIGEM  = ' + IntToStr(iIdPlanoPrev) +
                     ' AND   B.IDEVENTOGERADOR = 129' +
                     ' AND   BF.IDSITBENEFICIO <> 3'); // diferente de Encerrado
     qryAux.Open;
     iNumeroProcesso := qryAux.FieldByName('NUMEROPROCESSO').AsInteger;


     if sTipoFormChamador = 'SI'
     then begin
        Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);

        If FazQuery( QryAux, 'SELECT MIN( HFP.DATAINICIO ) AS DATAINICIO ' +
                             'FROM HISTFUNCPREV HFP ' +
                             'WHERE HFP.IDPESSOA = ' + IntToStr( iIdTitular ) +
                             '  AND NVL(HFP.FLGTEMPOMANUT, 0) = 0 ' ) Then
        Begin

          sDataAdmissao := QryAux.FieldByName('DATAINICIO').AsString;

        End;


        // Aguardando a liberação da função TransformaDiasTempo como publica
        // para trocar as linhas de comando abaixo comentadas
        iTempoSimples := CalcTempoContrib(qryAux,
                                          iIdTitular,
                                          0,
                                          1,
                                          1,
                                          sDataAdmissao,
                                          FormatDateTime('dd/mm/yyyy', Date),
                                          FormatDateTime('dd/mm/yyyy', Date)
                                         );


        sTempoResumido := TransformaDiasTempo(iTempoSimples);

        // Anos
        sAnos := copy(sTempoResumido, 1, 2);
        If Trim(sAnos) = ''
         Then sAnos := '0';


        // Meses
        sMeses := copy(sTempoResumido, 3, 2);
        If Trim(sMeses) = ''
         Then sMeses := '0';


        // Dias
        sDias := copy(sTempoResumido, 5, 2);
        If Trim(sDias) = ''
         Then sDias := '0';

        frmLerTempoServico.edTempoServTotal.Text := sAnos;
        frmLerTempoServico.edTempoServMes.Text   := sMeses;
        frmLerTempoServico.edTempoServDia.Text   := sDias;


        frmLerTempoServico.ShowModal;
        if frmLerTempoServico.ModalResult <> mrOk
        then Exit;
        sTempoServAnoDigitado := OraNumero(frmLerTempoServico.edTempoServTotal.Text);
        sTempoServMesDigitado := OraNumero(frmLerTempoServico.edTempoServMes.Text);
        sTempoServDiaDigitado := OraNumero(frmLerTempoServico.edTempoServDia.Text);
        frmLerTempoServico.Free;

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' SELECT TEMPOSERVTOTAL, TEMPOSERVTOTMES, TEMPOSERVTOTDIA  '+
                             ' FROM   ELEGPATRO '+
                             ' WHERE  IDPESSJUR = ' +IntToStr(iIdPessJur) + ' AND ' +
                             '        IDPESSOA  = ' +IntToStr(iIdTitular));
        dtmAPrev.qry.Open;

        sTempoServAnoAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTAL').AsString);
        sTempoServMesAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTMES').AsString);
        sTempoServDiaAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTDIA').AsString);

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ sTempoServAnoDigitado +', '+
                             '                      TEMPOSERVTOTMES  = '+ sTempoServMesDigitado +', '+
                             '                      TEMPOSERVTOTDIA  = '+ sTempoServDiaDigitado +
                             ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                             ' AND   IDPESSOA  = ' + IntToStr(iIdTitular) );
        try
           dtmAPrev.qry.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

     end;

     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     frmCadRequerBenefParticip.SelecionaProcesso(iNumeroProcesso);
     CmeCadastroFind(self);
     CmeCadastroAtualizaBotoes(self);
     

end;

procedure TfrmCadRequerBenefParticip.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  {MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then begin
     MostraDados( StrToInt(MontaSelectPart.ValoresChave[0]),
                  StrToInt(MontaSelectPart.ValoresChave[1]),
                  StrToInt(MontaSelectPart.ValoresChave[2]),
                  StrToInt(MontaSelectPart.ValoresChave[7]),
                  MontaSelectPart.ValoresChave[8]
                 );
  end;
       }
end;


// edilaine - SOL 253577-17374 / PPM 848182 - inicio
procedure TfrmCadRequerBenefParticip.reValorFABBtnClick(Sender: TObject);
var
  rValorFAB      : double;
  bErro          : boolean;
  iIdCalculoAnt  : longint;
  sMsgErro       : string;
  sMesReferencia : string;
  sSQLBenefAssoc : string;
begin
  inherited;

  // valida fator autorial
  {IN: RN06 / TC: RN02 }
  {O fator atuarial será obrigatório para requerimento de benefícios que exigem o BS e FAB parametrizado com esta opção}
  if not VerificaOpcoesObrigatorias() then
     Exit;

  if qryBeneficio.FieldByName('IDREGRACALCFAB').AsInteger <= 0 then
     Exit;

  frmAguarde.Mostra('Regra de Cálculo do FAB - Nº '+qryBeneficio.FieldByName('IDREGRACALCFAB').AsString);

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorFAB      := 0;
     iIdCalculoAnt  := iIdCalculo;
     sMesReferencia := formatdatetime('yyyy/mm', dtInicioFund.date);

     rValorFAB :=  ExecutaRegraCalculoDeficit('FAB', qryAux,
                                              qryBeneficio.FieldByName('IDREGRACALCFAB').AsInteger,
                                              iIdPlanoPrev,
                                              iIdPessJur,
                                              iIdTitular,
                                              iIdTitular,
                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                              sMesReferencia,
                                              bErro,
                                              sMsgErro,
                                              iIdCalculo,
                                              rOpcao1,
                                              sSQLBenefAssoc,
                                              iif(qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0, '1', '2'),
                                              qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger,
                                              qryBeneficio.FieldByName('IDPLANPREVCONTAB').AsInteger,     // edilaine - SOL 253577-17854 / PPM 1131941
                                              dtInicioFund.text            // edilaine - SOL 253577-18064 / PPM 1240079
                                               );

  except
     frmAguarde.Apaga;
  end;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorFAB.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  reValorFAB.Text := FormatFloat('#0.00',rValorFAB);
end;


procedure TfrmCadRequerBenefParticip.reValorBSBtnClick(Sender: TObject);
var
  rValorBS       : double;
  bErro          : boolean;
  sMsgErro       : string;
  iIdCalculoAnt  : longint;
  sMesReferencia : string;
  sSQLBenefAssoc : string;
begin
  inherited;

  if qryBeneficio.FieldByName('IDREGRACALCBS').AsInteger <= 0 then
     Exit;

  frmAguarde.Mostra('Regra de Cálculo do BS - Nº '+qryBeneficio.FieldByName('IDREGRACALCBS').AsString);

  // Executar regra de calculo do beneficio
  try
     rValorBS       := 0;
     iIdCalculoAnt  := iIdCalculo;
     sMesReferencia := formatdatetime('yyyy/mm', dtInicioFund.date);

     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorBS := ExecutaRegraCalculoDeficit('BS', qryAux,
                                            qryBeneficio.FieldByName('IDREGRACALCBS').AsInteger,
                                            iIdPlanoPrev,
                                            iIdPessJur,
                                            iIdTitular,
                                            iIdTitular,
                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                            sMesReferencia,
                                            bErro,
                                            sMsgErro,
                                            iIdCalculo,
                                            rOpcao1,
                                            sSQLBenefAssoc,
                                            iif(qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0, '1', '2'),
                                            qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger,
                                            qryBeneficio.FieldByName('IDPLANPREVCONTAB').AsInteger,     // edilaine - SOL 253577-17854 / PPM 1131941
                                            dtInicioFund.text            // edilaine - SOL 253577-18064 / PPM 1240079
                                           );

  except
     frmAguarde.Apaga;
  end;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorBS.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  reValorBS.Text := FormatFloat('#0.00',rValorBS);
end;


function TfrmCadRequerBenefParticip.VerificaOpcoesObrigatorias : boolean;
begin
  Result := false;

  frmAguarde.Mostra(' Verificando opções obrigatórias ...');
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFPLANOPART ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;
  if (not qryAux.IsEmpty) and
     (((qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) and
     ( ( (qryBeneficio.FieldByName('FlgObrigaOp1').AsInteger = 1) and
         ( (qryAux.FieldByName('ValorBase1').AsString = '') or
           (qryAux.FieldByName('ValorBase1').AsFloat <= 0 ) )
       ) or
       ( (qryBeneficio.FieldByName('FlgObrigaOp2').AsInteger = 1) and
         ( (qryAux.FieldByName('ValorBase2').AsString = '') or
           (qryAux.FieldByName('ValorBase2').AsFloat <= 0) )
       )or
       ( (qryBeneficio.FieldByName('FlgObrigaOp3').AsInteger = 1) and
         ( (qryAux.FieldByName('ValorBase3').AsString = '') or
           (qryAux.FieldByName('ValorBase3').AsFloat <= 0) )
       )
     )) or
     ((qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger >= 1) and
     ( ( (qryBeneficio.FieldByName('FLGOBRIGAOPTEXTO1').AsInteger = 1) and
          (qryAux.FieldByName('CAMPOTEXTO1').AsString = '')
       ) or
       ( (qryBeneficio.FieldByName('FLGOBRIGAOPTEXTO2').AsInteger = 1) and
          (qryAux.FieldByName('CAMPOTEXTO2').AsString = '')
       ) or
       ( (qryBeneficio.FieldByName('FLGOBRIGAOPTEXTO3').AsInteger = 1) and
          (qryAux.FieldByName('CAMPOTEXTO3').AsString = '')
       )
     ))
     )

  then begin
     MsgDlg('Existe uma ou mais opções de benefício obrigatórias não preenchidas. Verifique. ','Informação',mtInformation,[mbOk],0);
     frmAguarde.Apaga;
     Exit;
  end;

  if (qryAux.IsEmpty) and
     (((qryBeneficio.FieldByName('FlgAceitaOpcao').AsInteger = 1)and
     ( ( qryBeneficio.FieldByName('FlgObrigaOp1').AsInteger = 1  )  or
       ( qryBeneficio.FieldByName('FlgObrigaOp2').AsInteger = 1  )  or
       ( qryBeneficio.FieldByName('FlgObrigaOp3').AsInteger = 1  ))) or
     ((qryBeneficio.FieldByName('FLGOPCAOTEXTO').AsInteger = 1)and
       ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO1').AsInteger = 1) or
       (qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO2').AsInteger = 1) or
       (qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO3').AsInteger = 1))
       ))
  then begin
     MsgDlg('Existe uma ou mais opções de benefício obrigatórias não preenchidas. Verifique. ','Informação',mtInformation,[mbOk],0);
     frmAguarde.Apaga;
     Exit;
  end;

  frmAguarde.Apaga;

  Result := true;

end;


procedure TfrmCadRequerBenefParticip.AjustaTela;
begin

  {ID: RN07 - Os campos referentes ao Valor BS e Valor FAB não devem ser apresentados no requerimento por Idade}
   pnlBSFAB.Visible := bFlgApresentaBSFAB;

  {ID: RN07 - o sistema deverá verificar se o campo referente ao flag de apresentação da base de cálculo do déficit está marcado}
  reValorDeficit.Visible := bFlgApresentaDeficit;
  lblDeficit.Visible     := bFlgApresentaDeficit;

  if (sTipoFormChamador = 'EV') then
  begin
    {ID: RN09 - Para edição da Base de Cálculo do Déficit a parametrização deverá obedecer a marcação do campo Valor Total do Benefício}
    reValorDeficit.ReadOnly := (bFlgApresentaDeficit) and (qryBeneficio.FieldByName('FLGACTVLRTOTBEN').AsInteger = 0);

    {IN: RN12 - Para edição do Valor Atual do BS e do FAB a parametrização é a marcação do campo Valor Atual}
    reValorBS.ReadOnly  := (bFlgApresentaBSFAB) and (qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 0);
    reValorFAB.ReadOnly := (bFlgApresentaBSFAB) and (qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 0);
  end;

  {ajusta a tela}
  {ID: RN07 / IN: RN07 e RN08 / TC: RN03 e RN04 }
  {Caso o FLGAPRESENTADEFICIT esteja desmarcado, o sistema não deverá apresentar na interface o campo Base de Cálculo de Déficit}
  {Caso o FLGAPRESENTABSFAB esteja desmarcado, o sistema não deverá apresentar na interface o campo BS e FAB}
  if (bFlgApresentaDeficit) then
  begin
    lblDeficit.Left     := grpInfSupl.width - lblDeficit.width - 5;
    reValorDeficit.Left := lblDeficit.left;

    reValorBeneficio.Left := reValorDeficit.left - reValorBeneficio.width - 25;
    lblValorBenef.Left    := reValorBeneficio.left;
  end;

  if (not bFlgApresentaBSFAB) and (not bFlgApresentaDeficit) then
  begin
    reValorBeneficio.Left := grpInfSupl.width - reValorBeneficio.width - 9;
    lblValorBenef.left    := reValorBeneficio.Left;
  end;
  if (bFlgApresentaBSFAB) then
  begin
    pnlBSFAB.BevelOuter := bvNone;
  end;

end;

procedure TfrmCadRequerBenefParticip.pnlBSFABEnter(Sender: TObject);
begin
  inherited;
  if reValorFAB.visible then
     reValorFAB.setfocus;
end;

procedure TfrmCadRequerBenefParticip.reValorFABKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmCadRequerBenefParticip.reValorBSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmCadRequerBenefParticip.reValorDeficitKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmCadRequerBenefParticip.reValorSRBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;
// edilaine - SOL 253577-17374 / PPM 848182 - fim


// edilaine - SOL 253577-17464 / PPM 955703
procedure TfrmCadRequerBenefParticip.GeraDemonstrativo(const HoraHomologacao: String);
var
  iIdReport    : integer;
  sMensagem    : String;
  bDemonstraOK : boolean;
  sTemAlterador : string;         // edilaine - SOL 262968 / PPM 1102753
  bConcessaoResgate : boolean;    // edilaine - SOL 253577-18174 / PPM 1327585
begin
   {Busca ID do report}
   // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
   {iIdReport := -1;
   qryAux.close;
   if qryDet.FieldByname('FONTEPAGADORA').AsInteger = 1 then
      qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativo de Concessão de Benefícios'' '
   else
      qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativo de Concessão de Benefícios do INSS'' ';
   qryAux.Open;
   if not qryAux.IsEmpty then
      iIdReport := qryAux.Fields[0].AsInteger;
   }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

   sTemAlterador := iff(Trim(dblAlterador.text) = '', 'N', copy(dblAlterador.text,1,1));   // edilaine - SOL 262968 / PPM 1102753

   bConcessaoResgate := VerificaLoteRestage(iIdLoteConcessao);    // edilaine - SOL 253577-18174 / PPM 1327585

   if qryDet.FieldByname('FONTEPAGADORA').AsInteger = 1 then
   begin
     // edilaine - SOL 253577-18174 / PPM 1327585 {no sParametrosDemonstra foi substituido o delimitador  |=| por |  apenas}
     if sParametrosDemonstra = emptyStr then
        sParametrosDemonstra := InttoStr(iIdLoteConcessao) + '| ' +   // numLote
                                InttoStr(iIdTitular)       + '| ' +   // idtitular
                                InttoStr(iIdPessJur)       + '| ' +   // idPessJur
                                InttoStr(iIdPlanoPrev)     + '| ' +   // idPlanoPrev
                                InttoStr(iSeqProposta)     + '| ' +   // iSegProposta
                                'PROC'+sNumeroProcessoAntesGravar + '| ' +   //numprocesso                   // edilaine - SOL 253577-18094 / PPM 1269549
                                //qry.FieldbyName('NumeroProcesso').AsString + '|=| ' +   //numprocesso        // edilaine - SOL 253577-18094 / PPM 1269549 - comentado
                                Trim(dblkpcmbEvento.Text)  + '| ' +   // sEvento
                                FormatDateTime('dd/mm/yyyy', dtDataEvento.Date) + '| ' +   // sDataEvento
                                sdataInicioConcessao       + '| ' +   // sDataHoraConcessao
                                sTemAlterador              + '| ' +   // FlgCorrecoes               // edilaine - SOL 262968 / PPM 1102753
                                'APOSENTADORIA'            + '| ' +   // Tipo concessao
                                'visualiza|'                            // sDtHrHomologacao
                                //lstDadosCorrecao.text + '|'    // edilaine - SOL 262968 / PPM 1102753
     else
     begin // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
       sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sNumeroProcessoAntesGravar, 'PROC'+slstProcessosNovos, []);
       sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'visualiza|', HoraHomologacao+'|', []);
     end; // edilaine - SOL 253577-18094 / PPM 1269549 - fim

      // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
      try
        try
          RptDemonstraConcessao :=  TRptDemonstraConcessao.create(self);
          with RptDemonstraConcessao do
          begin

            MontaSQLRelatorio;   //edilaine - SIG55933
            AbreConsultas(sParametrosDemonstra);

            if (HoraHomologacao = '') or (bConcessaoResgate) then
               TFrmPreview.CreateModalPreview(Application, rpDemonstraConcessaoFuncef, 'Concessão de Benefícios')
            else
               SalvarArquivoDemonstrativo();

            bDemonstraOK := true;
          end;
        except
          bDemonstraOK := false;
        end;
      finally
        RptDemonstraConcessao.free;
      end;

     {bDemonstraOK := TRptDemonstraConcessao.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                                sParametrosDemonstra,
                                                '',
                                                'BaseDados',
                                                Sistema.NomeEmpresa,
                                                Sistema.NomeModulo,
                                                sMensagem)
     }// edilaine - SOL 253577-18174 / PPM 1327585 - fim
   end
   else
   begin
     // edilaine - SOL 253577-18174 / PPM 1327585 {no sParametrosDemonstra foi substituido o delimitador  |=| por |  apenas}
     if sParametrosDemonstra = emptyStr then
        sParametrosDemonstra := //qry.FieldbyName('NumeroProcesso').AsString + '|=| ' +   //numprocesso    // edilaine - SOL 253577-18094 / PPM 1269549 - comentado
                                'PROC'+sNumeroProcessoAntesGravar + '| ' +   //numprocesso               // edilaine - SOL 253577-18094 / PPM 1269549
                                InttoStr(iIdLoteConcessao) + '| ' +   // numLote
                                InttoStr(iSeqProposta)     + '| ' +   // iSegProposta
                                InttoStr(iIdPessJur)       + '| ' +   // idPessJur
                                InttoStr(iIdPlanoPrev)     + '| ' +   // idPlanoPrev
                                qryDet.FieldByName('IDPLANPREVCONTAB').AsString + '| ' + // idPlanoPrevContab
                                qryDet.FieldByName('IDPLANOORIGEM').AsString    + '| ' + // idPlanoOrigem
                                InttoStr(iIdTitular)       + '| ' +   // idtitular
                                'visualiza|'
     else
     begin // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
       sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sNumeroProcessoAntesGravar, 'PROC'+slstProcessosNovos, []);
       sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'visualiza|', HoraHomologacao+'|', []);
     end; // edilaine - SOL 253577-18094 / PPM 1269549 - fim

      // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
      try
        try
          RptDemonstraConcessaoINSS :=  TRptDemonstraConcessaoINSS.create(self);
          with RptDemonstraConcessaoINSS do
          begin

            AbreConsultas(sParametrosDemonstra);

            if HoraHomologacao = '' then
               TFrmPreview.CreateModalPreview(Application, rpDemonstraConcessaoINSS, 'Concessão de Benefícios')
            else
               SalvarArquivoDemonstrativo();

            bDemonstraOK := true;
          end;
        except
          bDemonstraOK := false;
        end;
      finally
        RptDemonstraConcessaoINSS.free;
      end;


      {bDemonstraOK := TRptDemonstraConcessaoINSS.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                                sParametrosDemonstra,
                                                '',
                                                'BaseDados',
                                                Sistema.NomeEmpresa,
                                                Sistema.NomeModulo,
                                                sMensagem);
      }// edilaine - SOL 253577-18174 / PPM 1327585 - fim
   end;


    if not bDemonstraOK then
        MsgDlg(sMensagem, 'Impressão do Demonstrativo de Concessão.', mtError, [], 0)

end;
// edilaine - SOL 253577-17464 / PPM 955703




procedure TfrmCadRequerBenefParticip.dblkpcmbBeneficioExit(
  Sender: TObject);
begin
   inherited;
   if trim(dblkpcmbBeneficio.text) = '' then
   begin
      bFlgApresentaDeficit := false;
      bFlgApresentaBSFAB   := false;

      AjustaTela();
   end;
end;

// edilaine - SOL 253577-18094 / PPM 1269549 - inicio
function TfrmCadRequerBenefParticip.AssociaTaxas(bApresentaResumo : boolean = true) : boolean;
var
  sNomeParticipante, sNomePatro, sNomePlano, sErro : string;
begin
  result := true;

  qryDet.first;
  if qryDet.FieldByName('FONTEPAGADORA').AsInteger  = 1 then
  begin
    // associa taxas ao beneficio
    if not AssociaTaxaPorBeneficio(qryDet.FieldByName('IDPLANOPREV').AsInteger,
                                   qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                                   qryDet.FieldByName('IDPESSJUR').AsInteger,
                                   qryDet.FieldByName('IDTITULAR').AsInteger,
                                   qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                   qryDet.FieldByName('IDPESSOA').AsInteger,
                                   qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                   Sistema.IdUsuario,
                                   sErro,
                                   7, 0 // Alterado por FHBS - 03/10/2019 - SIG50850
                                   ) then
    begin
      MsgDlg('Erro ao associar taxas para o benefício ['+sErro+']. Verifique.','Erro',mtError,[mbOK],0);
      frmAguarde.Apaga;
      result := false;
      Exit;
    end;

    if bApresentaResumo then
    begin
      BuscaDadosParticipante(qryDet.FieldByName('IDTITULAR').AsInteger,
                             qryDet.FieldByName('IDPESSOA').AsInteger,
                             qryDet.FieldByName('IDPLANOPREV').AsInteger,
                             qryDet.FieldByName('IDPESSJUR').AsInteger,
                             qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                             qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                             sNomeParticipante, sNomePlano, sNomePatro);

      //busca dados das associacoes e mostra
      MostraContribuicoes(qryDet.FieldByName('IDTITULAR').AsInteger,
                          qryDet.FieldByName('IDPESSOA').AsInteger,
                          qryDet.FieldByName('IDPLANOPREV').AsInteger,
                          qryDet.FieldByName('IDPESSJUR').AsInteger,
                          qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                          qryDet.FieldByName('NUMEROPROCESSO').AsInteger,
                          sNomeParticipante, sNomePatro, sNomePlano);
    end;
  end;
end;
// edilaine - SOL 253577-18094 / PPM 1269549 - fim


// edilaine - SOL 253577-18129 / PPM 1303078 - inicio
procedure TfrmCadRequerBenefParticip.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled  := true;
end;

procedure TfrmCadRequerBenefParticip.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  bbtnConfirmar.enabled := true;
  bbtnCancelar.enabled  := true;
end;

procedure TfrmCadRequerBenefParticip.ConfiguraAcessosTela(tTipoAjuste : TTipoConfiguacaoTela);
begin
  if  tTipoAjuste = ctConcessaoViaRequerimento then
  begin
    sbtnProcurar.enabled  := false;
    sbtnApagar.enabled    := false;
    sbtnDemonsSRB.enabled := false;
  end;

  if tTipoAjuste = ctDesfazRequerimento then
  begin
    sbtnProcurar.enabled  := true;
    sbtnAlterar.Enabled   := False;
    sbtnInserir.Enabled   := False;
    sbtnApagar.enabled    := false;
    sbtnDemonsSRB.enabled := false;
    bbtnConfirmar.enabled := false;
    bbtnCancelar.enabled  := false;

    sbtnCadContaCorrente.enabled := false;

    lblNomeBenef.Caption := '';
    dblkpcmbEvento.Enabled := True;
  end;

end;
// edilaine - SOL 253577-18129 / PPM 1303078 - fim

//Darivaldo Alencar SIG 23985 -inicio
function TfrmCadRequerBenefParticip.BeneficioRiscoInss: Boolean;
var
  Qry: TwwQuery;

Function TipoBeneficio: Integer;
begin
  try
     Qry:= TwwQuery.Create(nil);
     Qry.DatabaseName:= Trim('BaseDados');

     if not(QryDet.FieldByName('IDBENEFICIO').IsNull) then
       begin
         FazQuery(Qry,'SELECT B.TIPOBENEFICIO FROM BENEFICIO B WHERE B.IDBENEFICIO =' + QryDet.FieldByName('IDBENEFICIO').AsString);

         if not(Qry.IsEmpty) then
            result:= Qry.fieldbyname('TIPOBENEFICIO').AsInteger
         else result:= 0;
       end
     else result:= 0;
  finally
     FreeAndNil(Qry);
  end;
end;

begin
  {** O Checkbox referente ao Benefício Lei nº 142 deverá ser apresentado apenas para benefícios
   de aposentadoria, com fonte pagadora do INSS e que forem caracterizados como benefício de risco.}
   result:= (QryDet.FieldByName('FONTEPAGADORA').AsInteger = 2)and
            (TipoBeneficio <> 1);

   DbChbBenef142.visible:= result;

   if not(DbChbBenef142.Visible) then
    begin
      DbChbBenef142.Checked:= False;
      if not (qryDet.IsEmpty) then
         begin
          if (qryDet.state in [dsInsert,dsEdit]) then
              qryDet.fieldbyname('BENEFLEI142').asInteger := 0;
         end;
    end;
end;
//Darivaldo Alencar SIG 23985 -fim

end.




