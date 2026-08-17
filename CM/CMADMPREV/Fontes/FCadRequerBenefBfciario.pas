unit FCadRequerBenefBfciario;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  : BuscaIndice, ConcedeUmBeneficio
Nº SIG.....: WO16247
Data.......: 05/11/2024 / 29/08/2025
Responsável: Edilaine / Paulo Nobre
Descrição..: Valor do campo RESERVADIB  seja replicado no campo SALDODECONTADIB
--------------------------------------------------------------------------------
Alteração  : (dfm qryDet, pnlInfTitular, edNumDep, rePercPensao)
Nº SIG.....: WO18367
Data.......: 03/02/2025
Responsável: Edilaine
Descrição..: Alterar o percentual aplicado para concessão de Pensão Reg/Replan
             (atualmente o beneficio calcula 80% do valor cheio antes de ratear
             pelo grupo familiar. A nova regra estipula 50%+10% por dependente,
             limitado a 80%. Para 2 dependentes, o beneficio será 70% do cheio)
--------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: WO8511
Data.......: 07/03/2024
Responsável: Edilaine
Descrição..: erro no calculo de alterador Correcao Monetaria na concessao pensão
--------------------------------------------------------------------------------
Alteração  : AssociaTaxas
Nº SIG.....: 50850
Data.......: 08/10/2019
Responsável: Fábio Sampaio
Descrição..: Inclusão dos parãmetros 7 e 0 para utilização na procedure
             SP_CP_ASSOCIA_CONTRIBXBENEF
--------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: 20491
Data Merge : 24/06/2022
Data dev   : 27/02/2018
Responsável: Edilaine
Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
             de retenção de percentual das contribuições
--------------------------------------------------------------------------------
Alteração  : GravaBeneficiodeReferencia
Nº SIG.....: 127245
Data.......: 14/07/2022
Responsável: Luis Ferrari
Descrição..: corrigir o erro ao tentar requerer o benefício de pensão por morte - BPD
-------------------------------------------------------------------------------
Alteração  : qryDetBeforePost
Nº SIG.....: 118881
Data.......: 14/09/2021
Responsável: edilaine
Descrição..: contabilização da movimentação de reserva indevida, não considerando o
             plano contábil do perfil de assistido
-------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick
Nº SIG.....: 115877
Data.......: 07/05/2021
Responsável: edilaine
Descrição..: Validação das Datas de Requerimento, DIP e DIB apenas no beneficio
-------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick
Nº SIG.....: 115300
Data.......: 16/04/2021
Responsável: edilaine
Descrição..: Validação das Datas de Requerimento, DIP e DIB
-------------------------------------------------------------------------------
Alteração  : sbtnConcederClick
Nº SIG.....: 111820
Data.......: 14/12/2020
Responsável: edilaine
Descrição..: DataAlimenta = DIB apenas para resgate de designados
-------------------------------------------------------------------------------
Alteração  : TfrmCadRequerBenefBfciario.sbtnConcederClick
Nº SIG.....: 103736
Data.......: 04/11/2020
Responsável: Taffarel Sevaybriker
Descrição..: Mudança na passagem de parâmetro da DataAlimenta
-------------------------------------------------------------------------------
Alteração  : 
Nº SIG.....: 103584
Data.......: 28/10/2020
Responsável: André Imakawa
Descrição..: Alteração feita para atendimento do voto 007/2020 DIBEN.
-------------------------------------------------------------------------------
Alteração  : CriaLogOcorrencia
Nº SIG.....: 99886
Data.......: 14/05/2020
Responsável: Edilaine
Descrição..: mudança na passagem de parametro, de IDPLANOORIGEM para IDPLANOPREV
-------------------------------------------------------------------------------
Alteração  : sbtnApagarClick, bbtnConfirmaClick
Nº SIG.....: 99559
Data.......: 24/04/2020
Responsável: Taffarel Sevaybriker / Edilaine Ferraresi
Descrição..: Inclusão de parâmetro na função de desfazer requerimentos para correção
             de erro ao excluir todos os requerimentos do grid detalhe.
-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: 90571
Data.......: 22/08/2019
Responsável: Taffarel Sevaybriker
Descrição..: Erro na exclusão de requerimento.
-------------------------------------------------------------------------------
Alteração  : AtualizaReservaPart
Nº SIG.....: 89800
Data.......: 06/08/2019
Responsável: Taffarel Sevaybriker
Descrição..: Erro na condição do update da reserva.
-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: 50989
Data.......: 09/07/2019
Responsável: Everson Cunha
Descrição..: Solicito corrigir erro na concessão de benefícios, pois o sistema
             deve gravar HSTPERGRUPO apenas para os processos que estão sendo
             concedidos em tela, não devendo encerrar processos já concedidos
-------------------------------------------------------------------------------
Alteração  : ConcedeUmBeneficio
Nº SIG.....: 81749
Data.......: 04/02/2019
Responsável: edilaine
Descrição..: Erro ao conceder pensão para titular que é beneficiário
-------------------------------------------------------------------------------
Nº SIG.....: 70414
Data.......: 19/06/2018
Responsável: edilaine
Descrição..: Na concessão, não corrigir valores quando o índice for negativo
-------------------------------------------------------------------------------

Nº SIG.....: SIG TIBERO
Data.......: 28/02/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
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
Nº SIG.....: SIG49612
Data       : 03/07/2017
Responsável: Fernando Xavier
Descrição..: Na concessão de benefício único antecipado para pensão por morte,
             o sistema não esta calculando alteradores para o benefício.
-------------------------------------------------------------------------------
Nº SOL.....: 269674
Data       : 26/10/2016
Responsável: William Santana
Descrição..: Duplicando registros na HSTMOVRESERVA e está registrando
             saídas de reservas indevidas
-------------------------------------------------------------------------------
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
Alteração  : GeraDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : sbtnExcluiDetClick
Nº SOL.....: 270851
KTN / PPM  : 1338345
Data       : 18/03/2016
Responsável: Edilaine
Descrição..: no desfaz requerimento, as taxas estao sendo apagadas para mais de
             uma pessoa indevidamente
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 270813
KTN / PPM  : 1336094
Data       : 17/03/2016
Responsável: Edilaine
Descrição..: após conceder pensao INSS o 2o demonstrativo apresenta erro
{-------------------------------------------------------------------------------
Alteração  : AssociaTaxas, bbtnConfirmarClick, sbtnConcederClick
Nº SOL.....: 253577-18094
KTN / PPM  : 1269549
Data       : 02/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associação de taxas
{-------------------------------------------------------------------------------
Alteração  : AbreRequerBfciario, bbtnConfirmarClick, FormShow, bbtnSairClick, sbtnInserirClick
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 25/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
{-------------------------------------------------------------------------------
Alteração  : (.dfm) qrydet, qryBenefAux, bbtnConfirmarClick, bbtnOkDetClick, CalculaValorTotalBenef
Nº SOL.....: 253577-18064
KTN / PPM  : 1240079
Data       : 14/01/2016
Responsável: Edilaine
Descrição..: valores nao sao atualizados na benefbfciario (BS, FAB, Base Deficit)
{-------------------------------------------------------------------------------
Alteração   : (.dfm) updDet, CmeCadastroConfirma
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
Nº SOL.....: 253577/17666
KTN / PPM  : 1019935
Data       : 23/11/2015
Responsável: Helio Lima Custodio
Descrição..: Houve mudança na ExecutaSP_PreparoContribuicao, teve que enviar
             '' como mesreferencia para que conserve o mesmo comportamento.
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
Alteração  : GeraDemonstrativo
Nº SOL.....: 262938
KTN / PPM  : 1099698
Data       : 05/10/2015
Responsável: Edilaine
Descrição..: concessão INSS não apresenta 2o demonstrativo homologado
{-------------------------------------------------------------------------------
Alteração  : (dfm) , GeraDemonstrativo, CmeCadastroConfirma, FormCreate, FormClose
Nº SOL.....: 253577-17464
KTN / PPM  : 955703
Data       : 02/07/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - concessão
{-------------------------------------------------------------------------------
Alteração  : (dfm) campos novos
Nº SOL.....: 253577-17404
KTN / PPM  : 850977
Data       : 30/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - Manutenção benefícios
{-------------------------------------------------------------------------------
Alteração  : (dfm) campos novos
Nº SOL.....: 253577-17374
KTN / PPM  : 848182
Data       : 19/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - requerimento de benefícios
-------------------------------------------------------------------------------}
// Rotina      : DesfazRequerimentos
// Autor(a)    : Fernando Xavier
// Data        : 30/07/2015
// Pendência   : SOL 256744 PPM 999526
// Descricao   : ao clicar no botão sair da tela de concessão o sistema apresenta a
//               mensagem informando que o requerimento será desfeito, porém foi observado
//               que o sistema esta muito lento quando da deleção do requerimento.
//------------------------------------------------------------------------------
//Pendência   : SOL:258193 PPM:976792
//Responsável : Wylliam Leite da Silva
//Data        : 14/07/2015
//Descrição   : Foi retirado o filtro pelo FLGPECULIO = 1 para não apresentar
//              a critica quando o Flag for igual a 0.
//------------------------------------------------------------------------------
//Pendência   : SOL 238053.16451 PPM 496100
//Responsável : Thiago Melo
//Data        : 03/10/2014
//Descrição   : Concessão de benefício de pensão referente ao falecido Antônio
//              de Andrade Rodrigues - porém no momento da Concessão o sistema
//              não traz o plano.
//------------------------------------------------------------------------------
//Pendência   : SOL 237944 KINTANA 497587
//Responsável : William Moreira da Silva
//Data        : 23/09/2014
//Descrição   : A rotina não estava gerando Taxas Administrativas quando o mutuario
//              tinha um beneficio normal e um Unico
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
// Pendência   : SOL 200953 KTN 1952412
// Responsável : Flávio Souza
// Data        : 04/09/2013
// Descrição   : Remoção do botão "gerar matrícula", pois está funcionalidade foi
//               transferida para o Módulo CadastroPrev e não será mais necessária
//               no Módulo BeneficioPrev.
//--------------------------------------------------------------------------------
//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/10/2013
//Descrição   : Atividade para liberação de versão 15188.
//              Retirar de campos e fazer com que não possa mais ser inserido
//              mais nenhum evento de morte no modulo.
//------------------------------------------------------------------------------
//Pendência   : SOL 213339 KINTANA 2054769
//Responsável : William Moreira da Silva
//Data        : 05/12/2013
//Descrição   : Ajustar a rotina de concessão de Pensão
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 220983 2053498 Kintana
// Data        : 28/11/2013
// Descricao   : Solicitamos que o campo texto seja gravado na inclusao
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
//--------------------------------------------------------------------------------
// Pendência : SOL 181948 - KINTANA 1724239
// Autor(a)  : TADEU PASSOS
// Data      : 28/03/2013
// Descrição : Alteração para permitir mais de um benefício
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 199265 Kintana 1918879
// Data        : 01/03/2013
// Descricao   : Reajuste do valor Total do benefício de Pensão
//------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 201131 Kintana 1944161
// Data        : 20/02/2013
// Descricao   : Trava implementada Sol 163064
//------------------------------------------------------------------------------
//Pendência   : SOL 163064 KINTANA 1388980
//Responsável : DOUGLAS DE SIQUEIRA
//Data        : 14/02/2013
//Descrição   : Trava no botão ok para verificar situação dos bonefícios.
// -----------------------------------------------------------------------------
// Rotina    : 
// Autor(a)  : André Felipe SOL 160185
// Data      : 14/01/2013
// Descrição : Criação de campos para cadastro do CNPB e Plano Receptor
// -----------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Pendência   : SOL 132938 Kintana 770226
//Responsável : BRUNO AZEVEDO, Fernando Xavier E André Oliveira
//Descrição   : inclusão do processo de Alteradores na concessão.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 169562/11863 Kintana 1821350
// Data        : 11/10/2012
// Descricao   : Na concessão, a rotina não está alterando a PROCESSOBENEF
//------------------------------------------------------------------------------
// Autor(a)    : Jonas Otavio Henrique R. Oliveira
// Pendência   : SOL 136384/11582 Kintana 1797879
// Data        : 13/09/2012
// Descricao   : Query SRB campo IDPENSIONISTA
//------------------------------------------------------------------------------
// Higor Nayde Ferreira  SOL - 173938 KTN - 1627112 Início
// Autor(a)    : Higor Nayde Ferreira
// Pendência   : SOL 173938 Kintana 1627112
// Data        : 24/07/2012
// Descricao   : Alterção no "Rodapé" do documento de Demonstrativo de Concessão
//antes e depois de ser confirmados os dados.
//------------------------------------------------------------------------------
// Autor(a)    : Otacilio Aquino
// Pendência   : SOL 185498 Kintana 1689872
// Data        : 24/07/2012
// Descricao   : Ao conceder o benefício de pensão e auxílio funeral o
//               demonstrativo apresenta somente o de pensão.
//------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 181961 Kintana 1689872
// Data        : 28/06/2012
// Descricao   : Erro demostrativos de Concessão (MostraDemonstrativoConcessao)
//------------------------------------------------------------------------------
// Higor Nayde Ferreira  SOL - 181980 KTN - 1706119 Início
// Autor(a)    : Higor Nayde Ferreira
// Pendência   : SOL 181980 Kintana 1706119
// Data        : 22/06/2012
// Descricao   : Permitir alterar o campo Valor Total quando a situação
// for pendente de concessão.
//------------------------------------------------------------------------------

// Autor(a)    : Fanuel Junior
// Pendência   : SOL 148463 Kintana 1050263
// Data        : 27/01/2012
// Descricao   : Busca Automática %PBE, %FUNCEF e Benefício Mínimo
//------------------------------------------------------------------------------
//Pendência   : SOL 161215 Kintana 1379812
//Responsável : Marcos Merola
//Data        : 07/11/2011
//Descrição   : Implementação de Trava Concessão.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 136385/7362 Kintana 1527997
//Data         : 26/12/2011
// Descricao   : inclusão do campo IDEVENTOGERADOR na query de entrada da regra
//               de cálculo de valor total
//------------------------------------------------------------------------------
//Pendência   : SOL 164340 Kintana 1468711
//Responsável : Fernando Xavier
//Data        : 29/11/2011
//Descrição   : Erro nos campos OPÇÕES valor -1
//------------------------------------------------------------------------------
//Pendência   : SOL 170020 Kintana
//Responsável : Fernando Xavier
//Data        : 07/12/2011
//Descrição   : alterado a query Beneficio para que considere o
//              caso seja um beneficiario designado não fazer a validação
//------------------------------------------------------------------------------
//Pendência   : SOL 169376 Kintana 1501396
//Responsável : Fernando Xavier
//Data        : 25/11/2011
//Descrição   : Concessão de benefícios diferentes com a data de pagamento
//              diferentes o mesmo retorna que a matrícula já existe
//------------------------------------------------------------------------------
//Pendência   : SOL 164472 KINTANA 1442193
//Responsável : BRUNO AZEVEDO
//Data        : 07/11/2011
//Descrição   : Ajustes na geração de matrícula.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 160863 KINTANA 1381911
//Responsável : OTACILIO AQUINO
//Data        : 18/11/2011
//Descrição   : Gravar o Evento antes de fazer uma nova pesquisa.
//------------------------------------------------------------------------------
//Responsável : Otacilio Aquino
//Pendência   : SOL 161040 Kintana 1356059
//Descrição   : Implementação de trava no requerimento quando não tiver conta
//              salario cadastrada.
//------------------------------------------------------------------------------
//Pendência   : SOL 164519 KINTANA 1412858
//Responsável : BRUNO AZEVEDO
//Data        : 04/10/2011
//Descrição   : A alteração do SOL 157416 foi perdida, sendo disponibilizada novamente.
//------------------------------------------------------------------------------
//Pendência   : SOL 164346 Kintana 1410789
//Responsável : VINICIUS FERREIRA
//Data        : 08/09/2011
//Descrição   : Ajuste no demosntrativo de concessão, Erro no campo "Valor Rateado"
//------------------------------------------------------------------------------
//Pendência   : SOL 140042.6361 Kintana 1410792
//Responsável : Fernando Xavier
//Descrição   : Erro Beneficio FUNCEF mês competência Reembolso.
// -----------------------------------------------------------------------------
//Pendência   : SOL 163521/6401 Kintana 1412085
//Responsável : Fernando Xavier
//Data        : 06/09/2011
//Descrição   : ao conceder pecúlio por morte junto com um beneficio Funcef,
//              o sistema não está retornando as taxas administrativas
//------------------------------------------------------------------------------
//Pendência   : SOL 163521 Kintana 1396877
//Responsável : Fanuel Junior
//Data        : 13/08/2011
//Descrição   : Pois ao conceder pecúlio por morte da 2003400, o sistema está
//              trazendo acertos referentes ao evento de falecimento do titular,
//              quando o correto é não trazer.
//------------------------------------------------------------------------------
//Pendência   : SOL 164005 Kintana 1405148
//Responsável : VINICIUS FERREIRA
//Data        : 31/08/2011
//Descrição   : Erro alterar o valor de um benefício
//------------------------------------------------------------------------------
//Pendência   : SOL 163824 KINTANA 1402584
//Responsável : ERALDO LUIS DA SILVA
//Data        : 29/08/2011
//Descrição   : Trava de requerimento de Pecúlios
//--------------------------------------------------------------------------
//Pendência   : SOL 163259 Kintana 1392995
//Responsável : VINICIUS FERREIRA
//Data        : 23/08/2011
//Descrição   : erro de IDNUCLEO FAMILIAR
//------------------------------------------------------------------------------
//Pendência   : SOL 136375 KINTANA 815802
//Responsável : ERALDO LUIS DA SILVA
//Data        : 18/08/2011
//Descrição   : ( I C ) Trava para número de benefício zerado.
//--------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
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
//--------------------------------------------------------------------------------
//Pendência   : SOL 152307 KINTANA 1131419
//Responsável : BRUNO AZEVEDO
//Data        : 30/03/2011
//Descrição   : Crítica ao informar uma matrícula que ja existe.
//--------------------------------------------------------------------------
//Responsável : Fernando Xavier
//Pendência   : SOL 152279 Kintana 1130835
//Descrição   : Demonstrativo exibe informações do titular
//--------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 155058 Kintana 1197225
//Descrição   : Ao clicar no botão OK o sistema não estava fazendo nada.
//--------------------------------------------------------------------------------
//Responsável : Fernando Xavier
//Pendência   : SOL 141078 Kintana 888253
//Descrição   : Implementação de TRava no requerimento
//--------------------------------------------------------------------------------
//Responsável : Fernando Xavier
//Pendência   : SOL 141078 Kintana 888253
//Descrição   : Implementação de TRava no requerimento
//--------------------------------------------------------------------------------
//Pendência   : SOL 145995 Kintana 1023814
//Responsável : BRUNO AZEVEDO
//Data        : 18/11/2010
//Descrição   : Correção ao inserir campo datalimentacao na histmovreserva.
//--------------------------------------------------------------------------
//Pendência   : SOL 154040 KINTANA 1167990
//Responsável : BRUNO AZEVEDO
//Data        : 02/03/2011
//Descrição   : Não exibir crítica quando o benefício for de pecúlio.
//--------------------------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 151915 Kintana 1121526
//Descrição   : Ao conceder o benefício INSS para a matrícula 9749432 o mesmo está trazendo os valores
//              do benefício na DIB (2010/12) ao invés do últim mês processado (2011/02).
//--------------------------------------------------------------------------------
//Pendência   : SOL 130057-1781 KINTANA 717976
//Responsável : BRUNO AZEVEDO
//Data        : 04/05/2010
//Descrição   : Somente atualizar a HSTCONTRIBPREV se o evento gerador nao for de demissao.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 142916 KINTANA 923914
//Responsável : BRUNO AZEVEDO
//Data        : 31/08/2010
//Descrição   : Adicionado na qryDet "AND (BF.IDSITBENEFICIO = 4)".
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 137519 KINTANA 831220
//Responsável : BRUNO AZEVEDO
//Data        : 16/06/2010
//Descrição   : Ajuste no controle de transação ao fechar a tela.
//--------------------------------------------------------------------------------------------------

// Autor(a)    : Ádler Souza
// Data        : 23/07/2010
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 134799 Kintana 797445
// Descricao   : Corrigido o erro na QryReservapart ao requerer o benefício para
//               beneficiários de um resgate.
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 18/03/2010
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 124056 Kintana 665262
// Descricao   : O sistema estava jogando o idtitular no campo idpessoa na SQL
//               de entrada para a regra 25073 .
// -----------------------------------------------------------------------------
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
// Autor(a)    : Jéssica Lana
// Data        : 22/10/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 125930 \ Kintana 654723
// Descricao   : Mudança no critério de concessão de beneficio.
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 30/06/2009
// Rotina      : ConcedeUmBeneficio
// Pendência   : SOL 118811 Kintana 569080
// Descricao   : Apresentar critica quando o plano contabil do beneficio que esta sendo concedido
// for diferente do plano contabil do beneficio INSS.
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
// Autor(a)    : Ádler Souza
// Data        : 14/09/2009
// Rotina      : bbtnConfirmarClick
// Pendência   : SOL 124097 KTN 628439
// Descricao   : Inclusão de um Commit no final do processo.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 29/09/2009
// Rotina      : qryDetBeforePost
// Pendência   : SOL 124616 Kintana 637550
// Descricao   : O sistema não estava passando o IDTITULAR como parametro do update, alterando
//               a matricula do participante de forma incorreta.
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
// Autor(a)    : Augusto
// Data        : 03/09/2007 - 06/09/2007 - 28/09/2007
// Rotina      : CalculaReservaParaBeneficio
// Pendência   : 26280
// Descricao   : Passar dados de rateiro para a regra de calculo da reserva
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnOpcoesClick
// Descricao   : Enviar e receber o IDCALCULO para as opções 
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/06/2007
// Pendência   : 25647
// Rotina      : VerificaContribAtrasada
// Descricao   : Acerto na query para considerar apenas as contribuições com
//               sitrecebimento 0, 1 e 3
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnOpcoesClick
// Descricao   : Enviar e receber o IDCALCULO para as opções 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/05/2007
// Pendência   : 24849
// Rotina      : bbtnProcurarClick
// Descricao   : Retirado o FLGDESATIVADO
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/02/2007
// Pendência   : 24579
// Rotina      : 1) QryTitular
// Descricao   :    Retirado o FLGDESATIVADO
//               2) BuscaPlanoOrigem
//                  Voltar a usar o plano selecionado por causa do saldamento.
//               3) MostraDemonstrativoConcessao
//                  Acerto na consulta das contribuições para voltar a pesquisar a HSTCONTRIBPREV
// Data        : 05/04/2007
// Pendência   : 25017
// Rotina      : ConcedeUmBeneficio
// Descricao   : Acerto no controle da DATAFINAL
// Data        : 24/04/2007
// Pendência   : 25178
// Rotina      : ConcedeUmBeneficio
// Descricao   : Inclusão de rotina para no caso de concessão de INSS fora do convenio
//               gerar movimento de retenção 
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 29/01/2007
// Pendência   : 24334
// Rotina      : várias
// Descricao   : Forçado formato de datas para 'dd/mm/yyyy' em todas as rotinas do form,
//               substituindo-se DateToStr() por FormatDateTime
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 23/01/2007
// Pendência   : 24270
// Rotina      : ForShow
// Descricao   : Acerto na pesquisa do processo a exibir quando vindo de evento para
//               exibir somente processos de pensionistas
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/01/2007
// Pendência   : 24027
// Rotina      : MostraDemonstrativoConcessao
// Descricao   : Acerto no demonstrativo para mostrar corretamente os
//               beneficiários envolvidos.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/01/2007
// Pendência   : 22208
// Rotina      : TestaQuitacaoDividas
// Descricao   : Permitir que seja feita uma concessão sem quitar um empréstimo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/10/2006
// Pendência   : 23246
// Rotina      : VerificaProcessoEncerrado
// Descricao   : Implementação de nova rotina para reabrir processo no requerimeno.
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
// Autor(a)    : André Pontes
// Data        : 18/07/2006
// Pendência   : 22739
// Rotina      : ConcedeUmBeneficio (em 2 pontos distintos)
// Descricao   : Não estava gravando a concessão se a data de término do benefício fosse anterior a hoje, ie,
//                se o benefício já fosse concedido encerrado. Gleyber: a data de concessão deve ser sempre
//                gravada (pq pode ser concessão retroativa)
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 03/07/2006
// Rotina      : 21883
// Descricao   : Correção para concessão de benefício de participante cancelado
//               pegar o calendário de assistido.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/03/2006 - 30/03/2006
// Rotina      : 21861
// Descricao   : 1) Novo controle de Convenio
//               2) Novo controle de Acompanhante (antigo ainda existe)
//               3) Acerto no demonstrativo de concessão para não exibir os FLGENVIADO = 8
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
// Autor(a)    : Gleyber
// Rotina      : CobraContribAtrasada
// Data        : 11/01/2006
// Pendência   : 19538
// Alteração   : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/01/2006
// Pendência   : 19531
// Rotina      : Varias
// Descricao   : Atualizar o campo FLGPAGAINSS da BENEFBFCIARIO
//--------------------------------------------------------------------------------------------------
// Rotinas     : MostraDemonstrativoConcessao
// Autor(a)    : Augusto
// Data        : 23/11/2005 - 24/11/2005
// Pendência   :
// Descricao   : Incluir novas informações no demonstrativo de concessão
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Rotina     : CmeCadastroConfirma
//  Data       : 03/11/2005
//  Pendencia  : 20602
//  Alteração  : Atualizar campo VALORNADIB quando na manutenção
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Bruno Bastos
//  Rotina     : CobraContribAtrasada
//  Data       : 25/10/2005
//  Pendencia  : 20518
//  Alteração  : Atribui a uma variável o número do recebimento retornado pela
//               função InsereHstContribPrev
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Rotina     : dblkpcmbBeneficiarioCloseUp
//  Data       : 04/10/2005
//  Pendencia  : 20357
//  Alteração  : Cancela processo caso beneficio já tenha sido requerido para a pessoa
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : CobraContribAtrasada
//  Data       : 12/09/2005
//  Pendencia  : 20169
//  Alteração  : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
//               dtmAPrevIntegraBack.BuscaInfIntegra
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : bbtnOkDetClick, bbtnOpcoesClick e dblkpcmbBeneficioCloseUp
//  Data       : 01/08/2005
//  Pendência  : 19060
//  Descrição  : Criar replicação de opção para todos os beneficiários de um benefício
//--------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ConcedeUmBeneficio
//  Data       : 06/07/2005
//  Pendência  : 19637
//  Descrição  : atualizar IDSITBENEFICIO para 3, encerrado, caso a datafinal seja anterior a atual
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
// Autor(a)    : Augusto
// Data        : 17/05/2005
// Pendencia   : 18560
// Rotina      : TestaQuitacaoDividas
// Alteração   : Testar Saldo da quitação do Emprestimo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   :
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
//--------------------------------------------------------------------------------------------------
// Rotina      : EfetuaConcessao e sbtnConcederClick
// Autor(a)    : Gleyber
// Pendência   : 18306
// Data        : 14/04/2005
// Descricao   : Mudança da rotina RodaPadraoMovReserva de lugar
//--------------------------------------------------------------------------------------------------
// Rotina      : CmeCadastroConfirma, CmeCadastroCancel,
//               CalculaReservaParaBeneficio e DesindexaReserva
// Autor(a)    : Gleyber
// Pendência   : 18272
// Data        : 23/03/2005
// Descricao   : criação do campo FLGDESINDRES para a opção de DESINDEXAR RESERVA
//               ATÉ A DATA DO EVENTO
//--------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : ConcedeUmBeneficio
//  Data       : 10/03/2005 
//  Descrição  : Atualizar sempre os valores do beneficio depois do preparo
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ConcedeUmBeneficio
//  Data       : 17/02/2005
//  Pendência  : 18314
//  Descrição  : Considerar para benefícios que tenham quitação automática.
//--------------------------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : ConcedeUmBeneficio
//  Data       : 31/01/2005
//  Pendência  : 18314 / 16939
//  Descrição  : Atualização dos campos necessários para encerrar benefício em
//               caso de quitação automática.
//--------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CmeCadastroCancel
//  Data       : 14/01/2005
//  Descrição  : Chamar Rollback somente se for Concessão
//  Data       : 06/01/2005
//  Descrição  : Executar um Rollback ao cancelar Processo
//  Rotina     : bbtnOkDetClick
//  Data       : 22/12/2004
//  Rotina     : Acerto na visualização do FrmAguarde
//  Data       : 19/11/2004
//  Pendencia  : 16931
//  Descrição  : Quando beneficio for de Resgate, Numero do Processo não é obrogatório
//--------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 23.10.2004
//  Pendencia  : 17865
//  Descrição  : Acerto em erro de ortografia ( "da beneficio" )
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
// Rotina      : reValorBeneficioBtnClick / reValorTotalBtnClick
// Autor(a)    : Augusto
// Data        : 21/09/2004
// Descricao   : Inicializar variavel bOk
// Pendência   : 17722
// Data        : 20/09/2004
// Descricao   : Novo parametro para função
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
// Rotina      : MontaSelect
// Autor(a)    : Leo
// Data        : 01/09/2004
// Descricao   : correção da ordem dos valores da propriedade Tipodedado do MontaSelect
//               que estavam errados
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
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
// Rotina      : dblkpcmbBeneficioCloseUp
// Autor(a)    : Gleyber
// Pendência   : 17366
// Data        : 11/08/2004
// Descricao   : Quando o usuário troca o benefício os campos de valor total,
//               valor rateado e valor srb são zerados.  
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
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 17220
// Data        : 19.07.2004
// Descricao   : Implementar padrao de movimentacao de reservas para beneficiario
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Augusto
// Data        : 07/07/2004
// Descricao   : Movi a função GeraMatricula para a uBeneficio, para ser usada
//               tbm no Desdobramento.
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Augusto
// Data        : 31/05/2004
// Descricao   : ACERTO - atribuição automática de parametros contábeis individuais
// Data        : 18/06/2004
// Descricao   : IMPLEMENTAÇÃO - Opçao para gerar matricula na alteração do processo
// Data        : 19/06/2004
// Descricao   : ATUALIZAÇÂO - Rotina de Geração de Matricula, utilizar o campo criado
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Leo
// Data        : 28/05/2004
// Descricao   : ATUALIZAÇÃO - atribuição automática de parametros contábeis individuais
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 19/05/2004
// Descricao   : atribuição automática de parametros contábeis individuais
//--------------------------------------------------------------------------------------------------
// Rotina      : GeraMatricula (nova)
// Autor(a)    : Augusto
// Data        : 18/05/2004
// Descricao   : Novas implementações para Gerar matricula automáticamente
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Leofuncef
// Data        : 10.05.2004
// Descricao   : modificações gerais para atribuição automática de
//               matrícula para pensionista, conforme parametrização
//--------------------------------------------------------------------------------------------------
// Rotina      : VerificaVALORLimiteBeneficio
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 04.05.2004
// Descricao   : Nova rotina para tratamento de valor limite de beneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 16286
// Data        : 19.04.2004
// Descricao   : Não aplicar percentual de concessao de beneficio provisorio
//--------------------------------------------------------------------------------------------------
// Rotina      : MontaSelect
// Autor(a)    : Augusto
// Data        : 16/04/2004
// Descricao   : Inclusão do nome do beneficiario
//--------------------------------------------------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Gleyber
// Pendência   : 16276
// Data        : 30/03/2004
// Descricao   : Inclusão da função ExecutaRegraPlanPrevContab para gravação do
//               IDPLANPREVCONTAB da BENEFBFCIARIO
//--------------------------------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Augusto
// Data      : 12/02/2004
// Descrição : Acerto no demonstrativo de Contribuicoes
// Data      : 19/03/2004 - bbtnConfirmarClick
// Descrição : Acerto para beneficarios migrados 
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Augusto
// Data      : 08/02/2004
// Descrição : Acerto nos parametros da PreparaBeneficioConcedido
// Descrição : SRB no demontrativo não pode ser somado, errado quando varios beneficiarios .
// -----------------------------------------------------------------------------
// Rotina    : Diversas
// Autor(a)  : Gleyber
// Data      : 26/01/2004
// Pendência : 15925
// Descrição : Inclusão do campo MATRÍCULA para gravação da matrícula do
//             Beneficiário / Pensionista
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 23/01/2004
// Pendência : 15983
// Descrição : Inclusão de um Commit final para simulação a fim de evitar travamento
//             no banco.
// -----------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficiarioloseUp
// Autor(a)  : Camille
// Data      : 15.01.2004
// Descrição : Chamar regra de data de inicio do beneficio
// Pendencia : 15903
// -----------------------------------------------------------------------------
// Rotina    : QRYBENEFICIO
// Autor(a)  : Leo
// Data      : 10/01/2004
// Descrição : incluão do campo FLGACEITAACERTO
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Leo
// Data      : 10/12/2003
// Descrição : verificação do campo FLGACEITAACERTO, que esta se é para
//             pegar acertos do falecido
// -----------------------------------------------------------------------------
// Rotina    : reValorBeneficioBtnClick
// Autor(a)  : Gleyber
// Data      : 09/01/2004
// Pendência : 15757
// Descrição : Acerto na funcionalidade de transformar o valor do benefício de
//             real para cotas.
// -----------------------------------------------------------------------------
// Autor(a)  : Augusto
// Data      : 15/11/2003
// Descrição : Quando beneficios de referencia a DIB (DATAINICIOFUND) não estava alterando
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Gleyber - Augusto FUNCEF pendencia 15153
// Data      : 07/11/2003
// Descrição : Inicia Transação - Quando Simulação.......
// -----------------------------------------------------------------------------
// Rotina    : reValorTotalBtnClick
// Autor(a)  : Leo
// Data      : 29/10/2003
// Descrição : chamaa da função DevolveReserva
// -----------------------------------------------------------------------------
// Rotina    : geral
// Autor(a)  : Leo
// Data      : 28/10/2003
// Descrição : Retirada das rotinas InsereHistContrib,GeraContribBenef e PreparaContribNucleo,
//             passando para a UBENEFICIO, pois os mesmos cálculos deveraim ser executados
//             pelo desdobramento.
//             Modificação na chamada da função GeraContribBenef.
// -----------------------------------------------------------------------------
// Rotina    : ProcessaNucleoFamiliar
// Autor(a)  : Augusto
// Data      : 28/10/2003
// Descrição : mensagem caso responsavel não esteja cadastrado
// -----------------------------------------------------------------------------
// Rotina    : InsereHistContrib
// Autor(a)  : Augusto
// Data      : 27/10/2003
// Descrição : IIdLote trocado pelo lote da concessao iIdLoteConcessao,
//             SQL da regra de primeiro e ultimo pagamento estavam errados
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Rotina    : ExecutaRegraDataPgtoBeneficio
// Autor(a)  : Ricardo Vigorito
// Data      : 15/1O/2003
// Descrição : Incluir o campo DATAREQUERIMENTO  para query de executa a data
// do pagamento do benefício
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Augusto
// Data      : 21/1O/2003
// Descrição : Inclusão do IDSITBENEFICIO = 6 na pesquisa dos processos a conceder
// -----------------------------------------------------------------------------
// Rotina    : bbtnOkDetClick
// Autor(a)  : Leo
// Data      : 09/1O/2003
// Descrição : crítica da data de requerimento, levando em conta o caso de resgate,
//             onde a data de requerimento pode ser menor que a data de evento
// -----------------------------------------------------------------------------
// Rotina    : qryDetAfterInsert
// Autor(a)  : Leo
// Data      : 18/09/2003
// Descrição : chamada da função limpavariáveis do regras
// -----------------------------------------------------------------------------
// Rotina      : CmeDetalheInsert
// Autor(a)    : Leo
// Data        : 09/09/2003
// Alteração   : alteração na comparação de data inicio na fundação
//--------------------------------------------------------------------------------------------------
// Rotina      : reValorCalcInssBtnClick
// Autor(a)    : Augusto
// Data        : 09/09/2003
// Alteração   : passar dados do beneficio anterior para calculo do INSS
//--------------------------------------------------------------------------------------------------
// Rotina      : dblkpcmbBeneficiarioCloseUp
// Autor(a)    : Gleyber
// Data        : 02/09/2003
// Alteração   : acerto de busca da datafinal para REFER.
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnOkDetClick
// Autor(a)    : Leo
// Data        : 01/09/2003
// Alteração   : estava criticando valor em reValorTotal mesmo para benef. Inss
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 31/07/2003
// Alteração   : QRYDET; QRYBENEFAUX; bbtnOpcoesClick; GeraContribBenef;
//               dblkpcmbBeneficiarioCloseUp; VerificaCamposObrigREGRA
// Pendência   : 14651 / 14652
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 25/07/2003
// Alteração   : Adicionando controles para os campos valor SRB, Total do Benefício,
//               Valor atual. Mesmo que tenha regra associada.
// Pendência   : 14645
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 20.06.2003
// Alteração   : Criação do campo FLGTIPOGRAVAINSS com parametro do plano
//--------------------------------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficiarioCloseUp
// Autor(a)  : Camille
// Data      : 27.05.2003
// Alteração : Rodar regra de data inicio e final por beneficiário
// -----------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficioCloseUp
// Autor(a)  : Augusto
// Data      : 29/04/2003
// Alteração : Não estava preenchendo o campo Data Final do Beneficio
// -----------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Gleyber
// Data      : 24/04/2003
// Alteração : Liberação do campo VALOR TOTAL e VALOR RATEADO para digitação
// -----------------------------------------------------------------------------
// Rotina    : Várias rotinas que calculam benefícios.
// Autor(a)  : Carlos Guedes
// Data      : 28/03/2003
// Alteração : Pendência: 13113
//  Verificar se o parâmetro prmQtdDiasRetroBenef possui valor mais que 0,
//  caso afirmativo verifca se a diferença da data do registro do evento e a data do requerimento
//  é maior do que o parâmetro, se for NÃO paga benefícios retroativos.
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : acrescentei no demonstrativo as contribuições calculadas para pensionistas
// -----------------------------------------------------------------------------
// Rotina    : InsereHistContrib
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : alterei a crítica para criação de lote
//             antes: if iIdLote  < 0
//             depois: if iIdLote  <= 0
// -----------------------------------------------------------------------------
// Rotina    : PreparaContribNucleo
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : inclusão dos campos DATAREF e NUMEORPROCESSO nas querys passadas para regras de
//             calculo de contribuição, normal, primeira e última.
// -----------------------------------------------------------------------------
// Rotina    : SelecionaProcesso
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : zerar a variável iIdLote
// -----------------------------------------------------------------------------
// Rotina    : ProcessaNucleoFamiliar
// Autor(a)  : Leo
// Data      : 27/03/2003
// Alteração : inclusão de nucleos familiares
// -----------------------------------------------------------------------------
// Rotina    : reValorInfINSSExit
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : mudar a cor do valor informado do Inss caso seja diferente do valor calculado
// -----------------------------------------------------------------------------
// Rotina    : bbtnOkDetClick
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : abrir a query qryRelBenefPart, caso desativada
// -----------------------------------------------------------------------------
// Rotina    : btn_SelecionaBeneficiosClick, dblkpcmbBeneficiarioCloseUp
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : caso o benef. do INSS seja requerido separadamente, este está com
//             outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
//             caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
// -----------------------------------------------------------------------------
// Rotina    : reValorInfINSSExit
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : mudar a cor do edit caso o valor seja diferente do calculado
// -----------------------------------------------------------------------------
// Rotina    : qryDetBeforePost
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : caso benefício do INSS gravar o valor total como o valor do INSS
//             que não estava sendo gravado
// -----------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficioCloseUp
// Autor(a)  : Carlos Guedes
// Data      : 25/03/2003
// Alteração : Desabilitando campo Data Final na caso do benef. ter pagto. vitalício
//          Pend: 13115
// -----------------------------------------------------------------------------
// Rotina    : VerificaNumeroDependentes
// Autor(a)  : Camille
// Data      : 06.02.2003
// Alteração : Se a fundacao parametrizou que utilizara o calculo automatica de numero
//             de dependentes, entao nao atualizar por esta rotina abaixo
// -----------------------------------------------------------------------------
// Rotina    : CalculaReservaParaBeneficio
// Autor(a)  : Augusto
// Data      : 29/01/2003
// Alteração : Caso a Data do Cancelamento esteja vazia (DATACANCELAMENTO = '')
//             passa para Regra um espaço ( ' ' ) (CBS)   
// -----------------------------------------------------------------------------
// Rotina    : TestaQuitacaoDividas
// Autor(a)  : Gleyber
// Data      : 15/01/2003
// Alteração : Inclusão da função QuitaContratosMutuarioMorte para quitação do empréstimo.
// -----------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Leo  (leofuncef
// Data      : 0512.2002
// Alteração : alteração para permitir banaf. provisório do INSS, e cálculos
// -----------------------------------------------------------------------------
// Rotina    : Gravação do Plano de Origem
// Autor(a)  : Camille
// Data      : 03.12.2002
// Alteração : Alteração para gravar no plano de origem o plano do qual o participante
//             migrou
// -----------------------------------------------------------------------------
// Rotina      : AbreRequerBfciario
// Autor(a)    : Augusto
// Data        : 22/11/2002
// Alteração   : Caso chamado de evento esconder o botão procurar.
// ----------------------------------------------------------------------------
// Rotina      : qryBeneficioAfterScroll/dblkpcmbBeneficioCloseUp/qryDetAfterScroll
// Autor(a)    : Gleyber
// Data        : 11/11/2002
// Alteração   : Permitir a visibilidade de parte do panel INFORMAÇÃO DA SUPLEMENTAÇÃO
// ----------------------------------------------------------------------------
// Rotina      : CobraContribAtrasada
// Autor(a)    : Leo
// Data        : 03.10.2002
// Alteração   : comentei achamada da função pois agora os acertos de atraso
//               são feitos também pela TrataAtrasoDevolContribPosMorte
// ----------------------------------------------------------------------------
// Rotina      : qrydet
// Autor(a)    : Leo
// Data        : 02.10.2002
// Alteração   : acrescentei o campo FLGDATAPREVISTA na qrydet
// -----------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Leo
// Data        : 02.10.2002
// Alteração   : gravar os registros de concessão na MOVBENEF
// -----------------------------------------------------------------------------
// Rotina      : qryDetBeforePost
// Autor(a)    : Leo
// Data        : 26.09.2002
// Alteração   : forçar a gravação do IDTPPAGTOBENEFIC
// -----------------------------------------------------------------------------
// Rotina      : CmeCadastroEdit
// Autor(a)    : Camille
// Data        : 24.09.2002
// Alteração   : Se o beneficio estiver pendente de concessao, permitir alterar dados
// -----------------------------------------------------------------------------
// Rotina    : dbedNumProcINSSExit
// Autor(a)  : Leo
// Data      : 24/09/2002
// Alteração : valida número do processo
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Leo
// Data      : 23/09/2002
// Alteração : troquei a data passada para pagamento de DATAPREPARO para DATAPAGAMENTO
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Carlos Eduardo
// Data      : 09/09/2002
// Alteração : Passando data do início do INNS correta pra função PreparaBeneficioConcedido
// -----------------------------------------------------------------------------
// Rotina    : PreparaBeneficioConcedido
// Autor(a)  : Camille
// Data      : 23.08.2002
// Alteração : Acrescimo do campo ValorSRB para PreparaBeneficioConcedido
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Camille
// Data      : 07.08.2002
// Alteração : Acrescimo do join do IDPESSOA
// -----------------------------------------------------------------------------
// Rotina    : Cálculo do Numero de Beneficiarios (inumbenef)
// Autor(a)  : Camille
// Data      : 07.08.2002
// Alteração : Calcular numero de beneficiarios sem considerar os beneficios do
//             INSS se estes não forem pagos
// -----------------------------------------------------------------------------
// Rotina    : qryDET
// Autor(a)  : Camille
// Data      : 07.08.2002
// Alteração : Acréscimo do campo VALORNADIB 
// -----------------------------------------------------------------------------
// Rotina    : ExecutaRegraBeneficioMinimo
// Autor(a)  : Camille
// Data      : 01.08.2002
// Alteração : Acréscimo do campo ValorSRB na query de calculo
// -----------------------------------------------------------------------------
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Carlos Guedes
// Data        : 23/07/2002
// Alteração   : Estava sendo passado um valor já rateado para a função, que sofreria
//               novo rateio. Substituindo VALORATUAL por VALORTOTAL.
//               Pendência: 7753
// *****************************************************************************
// Rotina      : VerificaEvolucaoPensionista
// Autor(a)    : Carlos Guedes
// Data        : 17/07/2002
// Alteração   : Verifica e incorpora pensionistas à evolução funcional do titular.
//               Feito no requerimento para todos os pensionistas do titular.
//               Pendência: 6253
// *****************************************************************************
// Rotina      : qryBeneficioAfterScroll/dblkpcmbBeneficioCloseUp/qryDetAfterScroll
// Autor(a)    : Carlos Guedes
// Data        : 16/07/2002
// Alteração   : Caso benefício do INSS torna invisível grpInfSupl ( Informações da Suplementação )
//               Pendência:5718
// *****************************************************************************
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Carlos Guedes
// Data        : 27/05/2002:
// Alteração   : A função PreencheDadosBeneficiario não estava sendo utilizada no lugar certo,
//      no retorno do montaselect, pois não era alimentada a qryrelbenefpart, utilizada no momento
//      da exclusão de benefícios para beneficiários.
// *****************************************************************************
// Rotina      : MostraDemonstrativoConcessao
// Autor(a)    : Carlos Guedes
// Data        : 10/06/2002:
// Alteração   : PARA ATENDER A ESTRUTURA PLANO POR BENEFICIÁRIO.
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask,  wwdblook,
  TREdit, MskEdDlg, TEdNum, wwdbedit,FTelaAut, checklst, IvDictio,
  IvMulti, IvEMulti,FCadastroCS, wwdbdatetimepicker, CMDateTimePicker,

  RDemonstraConcessao,            // edilaine - SOL 253577-17464 / PPM 955703
  RDemonstraConcessaoINSS,        // edilaine - SOL 253577-17464 / PPM 955703
  FMostraContribuicoes,           // edilaine - SOL 253577-18094 / PPM 1269549

  DBCtrls, CmEventosCadastro, ImgList, ppTypes, FPreview, DBClient,
  uCMClientDataSet,
  UBeneficio;  //edilaine - SIG55933

const VetDescBeneficio : array[1..7] of string =
                      ('Normal', 'Retido','Encerrado','Pendente de Concessão',
                       'Encerrado por Morte do Beneficiário','Não Concedido',
                       'Concedido em exigência');


type
  TTipoCalculo = (tcViaDeficit, tcViaValorTotal);          // edilaine - SOL 253577-17464 / PPM 955703
  TTipoConfiguacaoTela = (ctConcessaoViaRequerimento, ctDesfazRequerimento);      // edilaine - SOL 253577-18129 / PPM 1303078

  TfrmCadRequerBenefBfciario = class(TfrmCadMestreDetalheCS)
    qryEvento: TwwQuery;
    qryTpPgtoBenef: TwwQuery;
    Label12: TLabel;
    dblkpcmbEvento: TwwDBLookupCombo;
    Label5: TLabel;
    dtDataEvento: TCMDateTimePicker;
    Label15: TLabel;
    dtDataRequerimento: TCMDateTimePicker;
    Label21: TLabel;
    grpPagamento: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    dtDataInicio: TCMDateTimePicker;
    dtDataFinal: TCMDateTimePicker;
    dblkcmbTpPgtoBenef: TwwDBLookupCombo;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryAux: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryTitular: TwwQuery;
    qryBfciarioTitPlan: TwwQuery;
    updBfciarioTitPlan: TUpdateSQL;
    bbtnElegibilidade: TBitBtn;
    bbtnOpcoes: TBitBtn;
    qryBenefReferencia: TwwQuery;
    updBenefReferencia: TUpdateSQL;
    lblNomeBenef: TLabel;
    qryFolha: TwwQuery;
    qryContrib: TwwQuery;
    Label1: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    qryPortForma: TwwQuery;
    qryMovReservaTemp: TwwQuery;
    updMovReservaTemp: TUpdateSQL;
    qryReservaPart: TwwQuery;
    updReservaPart: TUpdateSQL;
    qryBenefAUX: TwwQuery;
    updBenefAUX: TUpdateSQL;
    Label6: TLabel;
    dblkpcmbBeneficiario: TwwDBLookupCombo;
    qryBeneficiario: TwwQuery;
    btn_SelecionaBeneficios: TSpeedButton;
    wwDtsBeneficiarios: TwwDataSource;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    qryDetNUMEROPROCESSO: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
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
    qryDetVLRCALCINSS: TFloatField;
    qryDetVLRINFINSS: TFloatField;
    qryDetDATAINICIOINSS: TDateTimeField;
    qryDetNUMPROCINSS: TStringField;
    qryDetDATAINICIOFUND: TDateTimeField;
    qryDetNUMORDEMEVENTO: TFloatField;
    qryDetNOME: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetFLGRESGATE: TFloatField;
    qryDetVALORBASE1: TFloatField;
    qryDetVALORBASE2: TFloatField;
    qryDetVALORBASE3: TFloatField;
    qrybeneficio1: TwwQuery;
    Panel1: TPanel;
    dsBenefAux: TwwDataSource;
    qryDetDEPEN: TStringField;
    qryReajINSS: TwwQuery;
    qryContaBancaria: TwwQuery;
    qryDetVALORTOTAL: TFloatField;
    qryDetDATACONCESSAO: TDateTimeField;
    qryDetFLGPROVISORIO: TFloatField;
    qryDetPERCPROVISORIO: TFloatField;
    qryDetPRAZOPROVISORIO: TFloatField;
    qryDetIDRESPONSAVEL: TFloatField;
    qryDetULTMESREAJUSTE: TStringField;
    qryDetULTVALORATUALREAJ: TFloatField;
    qryAgenciaResgate: TwwQuery;
    lblAgencia: TLabel;
    dblkpcmbAgencia: TwwDBLookupCombo;
    qryDetIDAGENCIARESGATE: TFloatField;
    qryRelBenefPart: TwwQuery;
    updRelBenefPart: TUpdateSQL;
    sbtnConceder: TToolbarButton97;
    qryDetVALORCOTAS: TFloatField;
    QryBuscaContrib: TwwQuery;
    qryNucleoFamiliar: TwwQuery;
    QryBenefProc: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField5: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField6: TStringField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    DateTimeField7: TDateTimeField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField7: TStringField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    QryContribProc: TwwQuery;
    qryDetFLGTIPOINSS: TFloatField;
    qryTotalRecebedor: TwwQuery;
    updTotalRecebedor: TUpdateSQL;
    qryDetDIBBENEFANT: TDateTimeField;
    qryDetVALORBENEFANT: TFloatField;
    bbtnOutrasInformacoes: TBitBtn;
    qryDetVALORBINSSANT1: TFloatField;
    qryDetVALORBINSSANT2: TFloatField;
    qryDetVALORBINSSANT3: TFloatField;
    sbtnConcedeUm: TToolbarButton97;
    sbtnImprimirSimulacao: TToolbarButton97;
    bbtnProcurar: TBitBtn;
    qryDetFLGPECULIO: TFloatField;
    qryDetFLGBENEFMIN: TFloatField;
    sbtnCadContaCorrente: TToolbarButton97;
    grpInfINSS: TGroupBox;
    Label4: TLabel;
    dbedNumProcINSS: TwwDBEdit;
    Label2: TLabel;
    dtInicioINSS: TCMDateTimePicker;
    lblValorCalcInss: TLabel;
    reValorCalcInss: TcmMaskEditDlg;
    lblValorInfINSS: TLabel;
    reValorInfINSS: TEditNum;
    grpInfSupl: TGroupBox;
    pnlBenefProv: TPanel;
    lblPercConc: TLabel;
    lblPrazoProv: TLabel;
    lblMesProv: TLabel;
    lblPercent: TLabel;
    dbrgrpBenefProvisorio: TDBRadioGroup;
    dbedPercConc: TwwDBEdit;
    dbedPrazoProv: TwwDBEdit;
    qryDetVALORSRB: TFloatField;
    lblNumProcesso: TLabel;
    lblSitProcesso: TLabel;
    qryDetIDPLANOORIGEM: TFloatField;
    qryDetIDBENEFREFEREN: TFloatField;
    qryDetVALORNADIB: TFloatField;
    sbtnDemonsSRB: TToolbarButton97;
    qryDetFLGDATAPREVISTA: TFloatField;
    pnlNaoBenefProv: TPanel;
    reValorSRB: TcmMaskEditDlg;
    Label8: TLabel;
    dtInicioFund: TCMDateTimePicker;
    Label3: TLabel;
    lblCodFundacao: TLabel;
    dsBeneficio: TwwDataSource;
    edCodFundacao: TStaticText;
    qryloop: TwwQuery;
    qryBeneficio: TwwQuery;
    qryDepentit: TwwQuery;
    dsDepentit: TwwDataSource;
    updDepentit: TUpdateSQL;
    Label9: TLabel;
    dbeMatriculaBenef: TwwDBEdit;
    qryDetIDPLANPREVCONTAB: TFloatField;
    qryDetUSUARIOALT: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    qryDetPLACONTAD: TStringField;
    qryDetPLACONTAC: TStringField;
    qryDetFLGMOVRESAPOSCONC: TFloatField;
    qryDetFLGMOVEURESERVA: TFloatField;
    qryDesindRes: TwwQuery;
    dsDesindRes: TwwDataSource;
    updDesindRes: TUpdateSQL;
    qryDResPart: TwwQuery;
    dsDResPart: TwwDataSource;
    updDResPart: TUpdateSQL;
    qryDetFLGPAGAINSS: TFloatField;
    Bevel1: TBevel;
    DbChbPossuiConvenio: TDBCheckBox;
    QryPlanoContabInss: TwwQuery;
    qryUpdPlanoContab: TwwQuery;
    qryUpdAux: TwwQuery;
    qryAux2: TwwQuery; // SOL 132938
    QryAlteradorCorrecao: TwwQuery; // SOL 132938
    qryIncluiAlterador: TwwQuery;  // SOL 132938
    QryFatorAtualizacao: TwwQuery; // SOL 132938
    qryBfciariotitPlanAux: TwwQuery;
    updBfciarioTitPlanAux: TUpdateSQL;
    qryDetTIPOBENEFICIO: TFloatField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryUser: TwwQuery;
    DbLAlterador: TwwDBLookupCombo;
    LblAlterador: TLabel;
    qryDetCAMPOTEXTO1: TStringField;
    qryDetCAMPOTEXTO2: TStringField;
    qryDetCAMPOTEXTO3: TStringField;
    pnlBSFAB: TPanel;
    lblFABTot: TLabel;
    lblBSTot: TLabel;
    reValorFAB: TcmMaskEditDlg;
    reValorBS: TcmMaskEditDlg;
    reValorDeficit: TcmMaskEditDlg;
    lblDeficit: TLabel;
    pnlVrlBenef: TPanel;
    lblVlrTotal: TLabel;
    reValorTotal: TcmMaskEditDlg;
    lblValorBenef: TLabel;
    reValorBeneficio: TcmMaskEditDlg;
    reValorBSAtu: TcmMaskEditDlg;
    Label11: TLabel;
    reValorFABAtu: TcmMaskEditDlg;
    lblFABAtu: TLabel;
    qryDetVLRBSTOTAL: TFloatField;
    qryDetVLRFABTOTAL: TFloatField;
    qryDetVLRBSATUAL: TFloatField;
    qryDetVLRFABATUAL: TFloatField;
    qryDetVLRBASEDEFICIT: TFloatField;
    qryDetBSDIB: TFloatField;
    qryDetFABDIB: TFloatField;
    qryDetIDPERFILINVEST: TFloatField;
    qryDetRESERVADIB: TFloatField;
    qryDetSALDOCONTADIB: TFloatField;
    qryDetINDICEDIB: TFloatField;
    QryBuscaIndice: TQuery;
    qryDetFABTITULAR: TFloatField;
    qryDetBSTITULAR: TFloatField;
    qryDetVLRTOTALTITULAR: TFloatField;
    grpInfTitular: TGroupBox;
    lblFabTitular: TLabel;
    reVlrFabTit: TcmMaskEditDlg;
    lblBsTitular: TLabel;
    reVlrBsTit: TcmMaskEditDlg;
    lblTotTitular: TLabel;
    reVlrTotalTit: TcmMaskEditDlg;
    Label14: TLabel;
    edNumDep: TcmMaskEditDlg;
    Label18: TLabel;
    rePercPensao: TcmMaskEditDlg;

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
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBeneficiarioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryBeneficiarioAfterOpen(DataSet: TDataSet);
    procedure btn_SelecionaBeneficiosClick(Sender: TObject);
    procedure dblkpcmbBeneficioExit(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure reValorBeneficioMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure reValorBeneficioExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure reValorTotalBtnClick(Sender: TObject);
    procedure reValorTotalExit(Sender: TObject);
    procedure dbrgrpBenefProvisorioClick(Sender: TObject);
    procedure dbedPrazoProvExit(Sender: TObject);
    procedure reValorInfINSSEnter(Sender: TObject);
    procedure dbrgrpBenefProvisorioEnter(Sender: TObject);
    procedure dbrgrpBenefProvisorioExit(Sender: TObject);
    procedure sbtnConcederClick(Sender: TObject);
    procedure bbtnOutrasInformacoesClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnImprimirSimulacaoClick(Sender: TObject);
    procedure bbtnProcParticipanteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnCadContaCorrenteClick(Sender: TObject);
    procedure reValorSRBBtnClick(Sender: TObject);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure sbtnDemonsSRBClick(Sender: TObject);
    procedure dbedNumProcINSSExit(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure Label12Click(Sender: TObject);
    procedure lblSitProcessoClick(Sender: TObject);
    procedure dtInicioINSSChange(Sender: TObject);
    procedure BtMatriculaClick(Sender: TObject);
    procedure reValorSRBExit(Sender: TObject);
    procedure dbeMatriculaBenefExit(Sender: TObject);
    procedure dbeMatriculaBenefKeyPress(Sender: TObject; var Key: Char);
    procedure dbeMatriculaBenefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbLAlteradorKeyPress(Sender: TObject; var Key: Char);
    procedure reValorFABBtnClick(Sender: TObject);
    procedure reValorDeficitBtnClick(Sender: TObject);
    procedure reValorBSBtnClick(Sender: TObject);
    procedure reValorBSAtuBtnClick(Sender: TObject);
    procedure reValorFABAtuBtnClick(Sender: TObject);
    procedure pnlBSFABEnter(Sender: TObject);
    procedure reValorFABKeyPress(Sender: TObject; var Key: Char);
    procedure reValorFABAtuKeyPress(Sender: TObject; var Key: Char);
    procedure reValorBSKeyPress(Sender: TObject; var Key: Char);
    procedure reValorBSAtuKeyPress(Sender: TObject; var Key: Char);
    procedure reValorDeficitKeyPress(Sender: TObject; var Key: Char);
    procedure edNumDepBtnClick(Sender: TObject);
    procedure edNumDepKeyPress(Sender: TObject; var Key: Char);
    procedure edNumDepChange(Sender: TObject);
  private
    { Private declarations }
    rValorTitular1, rValorTitular2,
    rValorTitular3 : real;
    bFaltaValorTitular : boolean;
    //Fanuel Junior SOL148463 Kintana1050263

    bConfirmaConcessao : boolean; // SOL 199265

    sAnoMesAtualCalcAlt   : string; // SOL 232043 PPM 396781
    sAnoMesRefAux: String; // SOL 232043 PPM 396781

    sBeneficioAnterior  : String; // Vinicius Ferreira SOL 159322 KINTANA 1308856
    iFlgEmprestimo          : Integer;

    sBeneficiosMovReserva   : string;
    iIdUsuarioAutoriza      : longint;
    bAtivo               : boolean;
    iIdLoteConcessao     : longint;
    sAnoMesLoteConcessao,
    sDataPagamentoConcessao : string;
    sSQL : String;  // SOL 132938
    sIdContribuicaoAlteradores: String; //SOL132938 BRUNO

    //lstDadosCorrecao : TStringList;    // edilaine - SOL 253577-17464 / PPM 955703   // edilaine - SOL 262968 / PPM 1102753 - comentado
    sdataInicioConcessao : string;       // edilaine - SOL 253577-17464 / PPM 955703
    sParametrosDemonstra : string;       // edilaine - SOL 253577-17464 / PPM 955703
    sListaProcessos, sListaProcessosAux : string;               // edilaine - SOL 253577-18094 / PPM 1269549

    iIdEvento,
    iIdEventoAux,  // SOL 136385/7362 Kintana 1527997

    iIdPlanoPrevTit,
    iNumeroProcesso,       iIdTitular,               iIdPessJur,
    iIdPlanoPrev,          iIdPessoa,                iSeqProposta,
    iIdSitPart,            iIdSitFunc,               iIdSitPlanoPrev  ,
    iNumBenef,             iIdBenefReferencia,       NumeroProcesso            : longInt;

    // edilaine - SOL 253577-17374 / PPM 848182 - inicio
    bFlgApresentaDeficit,
    bFlgApresentaBSFAB   : boolean;
    // edilaine - SOL 253577-17374 / PPM 848182 - fim

    iProvisorioAntes : longint;

    iIdChamaElegebilidade: Integer;

    bPerguntouCancelar,
    bRecalculouProvisorio,
    bReajustouINSS,
    bAbriuOutroForm,
    bNovoBeneficio,
    bConcedeBeneficio,     bPossuiDivPrevid,         bPossuiDivAssist,
    bPossuiDivEmprest,     bExecutouRegraConcessao,  bQueryTitular,
    bQuerySalarios,        bQueryContribuicoes,      bGravaBenefReferencia : boolean;


    dValorSRB, dValorTotalAux : double;
    rValorReal,            rValorCotas,              rValorDaCotaBenef : real;

    // Dados do INSS para preencher caso ja tenha sido requerido
    sNumProcINSS, sValorCalcINSS, sValorInfINSS, sDataInicioINSS,
    sValorBase1INSS, sValorBase2INSS, sValorBase3INSS, sFlgPagaINSS : string;

    // Variaveis para controlar validacoes necessárias na concessao
    bCobraContribAtrasada,
    bConcedeuBeneficio : boolean;

    bChamarConcessao, bApagaProcesso, sRequerimento : boolean;     // edilaine - SOL 253577-18129 / PPM 1303078

    sValorINSSAntes, sValorINSSDepois,
    sNumerosProcessos,
    sTipoSitFunc        : string;
    // Variaveis para guardar e apresentar igual ao anterior quando
    // for outro beneficiario para o mesmo beneficio
    iFlgTipoINSS : integer;
    sValorReserva,
    sValorTotal,
    sDataInicioPagto,
    sDataDaCotaBenef,
    sTipoFormChamador, // EV - Evento, CO - Concessao, SI - Simulacao
    sDataEvento,           sFlgTpDemissao,
    sMatricula,            sNomeTitular,             sNomePatro,
    sNomePlano,            sNomeSitPart,
    sNomeSitFunc,          sNomeSitPlano,
    sFlgInternoAntes,
    sFlgInternoDepois,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartDepois,
    sIdSitPlanDepois,
    sMatriculaAtual,
    sIdSitFuncDepois : string;
    sIdBeneficiarioEncerrado : String;

    sNumeroProcessoAntesGravar : string;
    sTempoServAnoAntes,    sTempoServMesAntes,       sTempoServDiaAntes         : string;

    StrConcedidos    : string;

    iFlgIncluiMesConc   : integer;
    iTotRequeridos      : word;

    bPagaRetroativo: Boolean;

    bValidaOpcaoBeneficio : Boolean;

    MatriculaBenefInicial: String; // Vinicius Ferreira SOL 159322 KINTANA 1308856

    //edilaine - SIG55933 - inicio
    PerfilAtual    : TRecPerfilInv;
    PerfilAnterior : TRecPerfilInv;
    bPerfilAtivo   : Boolean;
    //edilaine - SIG55933 - fim

    procedure ValidaTitular;  // Fanuel Junior SOL148463
    function  qryBuscaValorTitular: String; // Fanuel Junior SOL148463
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
    procedure PreencheDadosBeneficiario(piNumeroProcesso,piIdTitular, piIdPessoa,piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure GravaBeneficioDeReferencia;
    procedure SelecionaReservaPart;
    function  CalculaReservaParaBeneficio                     : double;
    function  AtualizaReservaPart ( piIdBeneficio : longint ) : boolean;

    procedure AjustaTela;                               // edilaine - SOL 253577-17374 / PPM 848182
    function  VerificaOpcoesObrigatorias : boolean ;    // edilaine - SOL 253577-17374 / PPM 848182
    procedure CalculaValorTotalBenef(tTipoCalculo : TTipoCalculo);    // edilaine - SOL 253577-17464 / PPM 955703
    function  AssociaTaxas(bApresentaResumo : boolean = true): boolean ; // edilaine - SOL 253577-18094 / PPM 1269549

    // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
    function  DeleteProcessoBenef(NumeroProcesso: string): boolean;
    procedure ConfiguraAcessosTela(tTipoAjuste : TTipoConfiguacaoTela);
    procedure DeletaBfciarioTitPlan(piIdNumeroProcesso:Integer);
    function  VerificaBeneficioxBenefTitPlan(piIdNumeroProcesso, piIdPessoa, piIdBenficio :Integer) : boolean;
    // edilaine - SOL 253577-18129 / PPM 1303078 - fim

    function  ConverteBeneficioParaCotas( prValorReal : real) : real;
    function  ConverteBeneficioParaReal ( prValorCotas: real) : real;

    function  TestaQuitacaoDividas         : boolean;
    function  VerificaBeneficioObrigatorio : boolean;
    function  VerificaBeneficioRepetido    : boolean;
    function  VerificaNumeroDependentes    : boolean;
    function  VerificaContribAtrasada   ( var sMesAtraso : string) : boolean;
    function  VerificaAcertosFalecido   ( piNumeroProcesso  : longint;
                                          piIdPessJur       : longint;
                                          piIdPlanoPrev     : longint;
                                          piIdTitular       : longint;
                                          piSeqProposta     : longint;
                                          piIdLoteConcessao : longint;
                                          psDataEvento      : string;
                                          psDataPagamento   : string ) : boolean;

    function  CalculaSaldoRealCont(piIdTipoReserva : integer; pdVlMovReal : double) : double;
    function  DevolveReserva       ( piIdBeneficio, piIdBeneficiario : longint )   : boolean;
    function  ConfirmaBeneficio : boolean;
    function  CobraContribAtrasada(piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                   psDataInicioFund : string) : boolean;

    procedure MostraDemonstrativoConcessao(const homologado :Boolean = False; const HoraHomologacao: String = '');//Higor Nayde SOL - 173938 KINTANA - 1627112

    procedure GeraDemonstrativo(const HoraHomologacao: String = '');  // edilaine - SOL 253577-17464 / PPM 955703

    function  AtualizaSitParticipante(piIdPessJur, piIdPlanoPrev,piIdPessoa,
                                      piSeqProposta, piIdEventoGerador : longint ) : boolean;
    function EfetuaConcessao(iIdSitEscolhida : word;
                             var rValorAtualizado,
                                 rValorAtualizadoTotal,
                                 rValorAtualizadoINSS,
                                 rValorAtualizadoTotalINSS : double;
                             var sUltMesReajuste,
                                 sUltMesReajusteINSS  : string;
                             var bErro                : boolean ) : word;
    procedure AtualizaEventosPrev(iIdPessJur,   iIdPlanoPrev, iIdPessoa,
                                  iSeqProposta, iIdEventoGerador : Integer);

    function  ConcedeUmBeneficio ( Sender : TObject; piIdSitBenef : integer ): boolean;


    Procedure VerificaEvolucaoPensionista;
    function  VerificaCamposObrigREGRA                              : boolean;
//Ádler Souza - SOL 132110 KINTANA 758869
//    Function ComparaPLanoContabil(pIdPessoa,IdPLanoPrevContab,IdplanoPrev,pidTitular : Integer): Boolean; //Renato Visoni SOL 118811 Kintana 569080

    Procedure DesindexaReserva;

    Procedure VerificaProcessoEncerrado;

    function DeleteLogPreparoTaxa(  pNumeroProcesso,
                                    pIdPessoa,
                                    pIdTitular,
                                    pIdBeneficio,
                                    pIdPlanoprev  : string): boolean; //edilaine - SOL 253577-17464 / PPM 955703

    function BuscaIndice(pIDPESSJUR, pIDPESSOA, pIDPLANOPREV: String): Double;   //edilaine WO16247

    function   CarregaValorBsFabTitular(bPreencheCampo : boolean = true) : double;     //edilaine WO18367
    procedure  CalculaPercentualPensao;                                                //edilaine WO18367

  public
     iIdCalculo                   : Integer;
     sDataDemissao,
     sIdDepen, Msg                 : string;
     rOpcao1,  rOpcao2,  rOpcao3  : real;
     rCampoTexto1, rCampoTexto2, rCampoTexto3 : string;
     rTotalLote                   : double;
     iIdLote,iNumReg, wIdMotivo   : longint;
     bFlgBenefMorte               : Boolean;
     sVlrATualMonBeneficio, sVlrATualMonContrib : string;
    { Public declarations }
  end;

var
  frmCadRequerBenefBfciario: TfrmCadRequerBenefBfciario;
  iIdTitularSel, iIdPessjurSel, iIdPlanoPrevSel : Integer;

function  AbreRequerBfciario(psTipoChamador, // EV - Evento, CO - Concessao, MA - Manutencao de Processo
                             pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
                             pDataEvento,
                             pIdEventoGerador, pFlgTpDemissao : string;
                             var psNumerosProcessos : string;
                             psFlgInternoAntes,
                             psFlgInternoDepois,
                             psIdSitPartAntes,
                             psIdSitPlanAntes,
                             psIdSitFuncAntes,
                             psIdSitPartDepois,
                             psIdSitPlanDepois,
                             psIdSitFuncDepois   : string;
                             Var piIdCalculo : Integer;
                             pbFlgBenefMorte : Boolean = False;
                             const psNumProcesso : String = '';
                             const psMatricula : String = '';
                             const psRequerimento :boolean = False ) : boolean;



implementation

uses UAdmPrev, DBaseDados, UDataBase, UMensErro, UParticipante,
  fAguarde, FCadOpcoesBenef, FPedeBenefExigencia, UContribuicaoPrev,
  UMovReserva, fSelecionaBeneficiariosdoBeneficio,
  UEventos, UIntegraBack, FMostraAux, DAPrev, FCadContaRequerimento,
  FEscolheMotivo, USistema, FPedeDadosBenefAnterior, FSelecionaLote,
  UFuncoesUteis, FLerTempoServico, DRelatAdmPREV2, DAPrevIntegraBack,
  FCadContaRequerBenef, FPRelDemosBenef, DDividaEP , UIntegraEP;

{$R *.DFM}
// ********************************** ********************** *************************
// ******************************* ROTINA A SER CHAMADA DAS TELAS ********************
// ********************************** ********************** *************************
function  AbreRequerBfciario(psTipoChamador, // EV - Evento, CO - Concessao, MA - Manutencao de Processo
                             pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
                             pDataEvento,
                             pIdEventoGerador, pFlgTpDemissao : string;
                             var psNumerosProcessos : string;
                             psFlgInternoAntes,
                             psFlgInternoDepois,
                             psIdSitPartAntes,
                             psIdSitPlanAntes,
                             psIdSitFuncAntes,
                             psIdSitPartDepois,
                             psIdSitPlanDepois,
                             psIdSitFuncDepois   : string;
                             Var piIdCalculo : Integer;
                             pbFlgBenefMorte : Boolean;
                             const psNumProcesso : String;
                             const psMatricula : String;
                             const psRequerimento: boolean) : boolean;

begin
  Application.CreateForm(TfrmCadRequerBenefBfciario, frmCadRequerBenefBfciario);

  if psTipoChamador = 'MA' Then
    frmCadRequerBenefBfciario.HelpContext := 160071
  else
    If psTipoChamador = 'CO' Then
      frmCadRequerBenefBfciario.HelpContext := 160072
    else
      If psTipoChamador = 'SI' Then
        frmCadRequerBenefBfciario.HelpContext := 160074;
  
  with frmCadRequerBenefBfciario do
  begin
     sTipoFormChamador := psTipoChamador;
     sTipoTelaBenef    := sTipoFormChamador;

     iIdEvento         := StrToInt(pIdEventoGerador);
     sDataEvento       := pDataEvento;
     iIdTitular        := StrToInt(pIdTitular);
     iIdPessJur        := StrToInt(pIdPessJur);
     iIdPlanoPrev      := StrToInt(pIdPlanoPrev);
     iSeqProposta      := StrToInt(pSeqProposta);
     sFlgTpDemissao    := pFlgTpDemissao;
     bFlgBenefMorte    := pbFlgBenefMorte;  

     // Acertar situacoes da seguinte maneira :
     // Se a tela está chamando é evento, entao as situacoes anteriores
     //    são as que estao na tela do evento
     // Senao, Se a tela está sendo chamada pela "Manutencao de Processos" ou "Concessao"
     //        Entao as situacoes anteriores são as que estao na tabela eventosprev
     //              no evento <> do evento que estou fazendo agora
     sFlgInternoAntes  := psFlgInternoAntes;
     sFlgInternoDepois  := psFlgInternoDepois;
     sIdSitPartAntes   := psIdSitPartAntes;
     sIdSitPlanAntes   := psIdSitPlanAntes;
     sIdSitFuncAntes   := psIdSitFuncAntes;
     sIdSitPartDepois   := psIdSitPartDepois;
     sIdSitPlanDepois   := psIdSitPlanDepois;
     sIdSitFuncDepois   := psIdSitFuncDepois;

     sRequerimento      := psRequerimento;        // edilaine - SOL 253577-18129 / PPM 1303078

     //bbtnProcurar.Visible := True;              // edilaine - SOL 253577-18129 / PPM 1303078

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
     end else begin
       bbtnProcurar.Visible := False;
     end; { If TipoChamador }

  end;

  If (psTipoChamador = 'CO')and (Sistema.IdModulo = 454) Then begin
    frmCadRequerBenefBfciario.PreencheDadosTitular(StrToInt(pIdTitular),
                                                         StrToInt(pIdPessJur),
                                                         StrToInt(pIdPlanoPrev),
                                                         StrToInt(pSeqProposta));
    if (psNumProcesso <>'')then
        frmCadRequerBenefBfciario.SelecionaProcesso(StrToInt(psNumProcesso));
    //frmCadRequerBenefBfciario.sbtnAlterar.OnClick(frmCadRequerBenefBfciario);//Se quiser alterar - Tirar
  end;

  frmCadRequerBenefBfciario.ShowModal;

  if psTipoChamador <> 'EV' Then
  Begin
     psNumerosProcessos := Copy(frmCadRequerBenefBfciario.sNumerosProcessos,
                                2,length(frmCadRequerBenefBfciario.sNumerosProcessos)-1);
  end
  else
     psNumerosProcessos := frmCadRequerBenefBfciario.sNumerosProcessos;

  piIdCalculo := frmCadRequerBenefBfciario.iIdCalculo;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if (psTipoChamador = 'EV') and (Sistema.IdModulo = 454) Then
     Result := frmCadRequerBenefBfciario.bChamarConcessao;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  frmCadRequerBenefBfciario.Free;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if not ((psTipoChamador = 'EV') and (Sistema.IdModulo = 454)) Then
     Result := True;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS AUXILIARES ***********************
// ********************************** ********************** *************************

Function TfrmCadRequerBenefBfciario.CalculaAlteradores(pcTipo : Char;
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
               QuotedStr(sAnoMesLoteConcessao)           + ' AS PROXMESCOB,  ';
    end;

    sSQL := sSQL +
                      QuotedStr(QryAlteradorCorrecao.FieldByName('DESCRICAO').AsString)    + ' AS NOMEALTERADOR, '+
                      QuotedStr(sDataRefInd)                + ' AS DATAREF, '+
                      QuotedStr('0')                        + ' AS FLGMIGRACAO, '+
                      QuotedStr(sAnoMesAnt)                 + ' AS ANOMESREFANT, '+
                      QuotedStr(psAnoMesRef)                + ' AS ANOMESREF, '+
                      QuotedStr(psAnoMesRef)                + ' AS MESREFERENCIA,    '+
                      QuotedStr(sDataPagamentoConcessao)         + ' AS DATARECEBIMENTO,  '+
                      QuotedStr(sDataPrevisaoRecebimento)   + ' AS DATAPREVISAORECE, '+

                      QuotedStr(sAnoMesInicio)              + ' AS ANOMESACERTOINI, '+
                      IntToStr (Sistema.IdModulo)           + ' AS IDMODULO, '+
                      QuotedStr(sAnoMesLoteConcessao)       + ' AS ANOMESACERTOFIM,  '+
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



procedure TfrmCadRequerBenefBfciario.InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                                     QryDados       : TwwQuery;
                                                     psAnoMesRef    : String;
                                                     pdValor        : Double;
                                                     piNumLancamento : LongInt = -1 );
Var
  iIdRubrica : Integer;
  bBenefProprio : Boolean;
  sFlgTipo, sDataInicio, sDataFinal : String;
  QryAuxiliar : Twwquery;
begin
  // ************************************************************************ //
  // INSERIR CORREÇÃO DE BENEFICIOS NA HSTATRASOBENEF OU NA HSTATRASOCONTRIB  //
  // ************************************************************************ //

  if StrToFloat(FormatFloat('#0.00',pdValor)) = 0 then  Exit;

  If pcTipoCorracao = 'B' Then Begin

  QryFatorAtualizacao.Close;
  //QryFatorAtualizacao.Parambyname('COTMESREF').asString := QryDados.FieldByName('DATAINICIOFUND').AsString ;
  QryFatorAtualizacao.Parambyname('COTMESREF').asString := Copy(QryDados.FieldByName('DATAINICIOFUND').AsString,7,4)+'/01';
  QryFatorAtualizacao.Open;
  QryFatorAtualizacao.Locate('MESINDICE',(sAnoMesLoteConcessao),[]);

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
             QuotedStr(sAnoMesLoteConcessao)                                   +', '+
             inttostr(prmIDMOTIVOFOLHABEN)                            +', '+
             QryDados.FieldByName('NUMEROPROCESSO').AsString          +', '+
             QryDados.FieldByName('IDBENEFICIO').AsString             +', '+
             //QryDados.FieldByName('IDPESSOA').AsString                +', '+
             QryAux2.FieldByName('IDPESSOA').AsString                +', '+//William Moreira da Silva - SOL 231025 PPM 363636
             QuotedStr(psAnoMesRef)                          +', '+
             QryDados.FieldByName('SEQPROPOSTA').AsString             +', '+
             qryAux.FieldByName('SEQBENEFICIO').AsString             +', '+
             QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString        +', '+
             OraNumero(FloattoStr(Abs(pdValor)))                      +', '+
             QuotedStr(sFlgTipo)                                      +', '+
             '1'
                                                                 +') ';

    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
    QryAuxiliar.SQL.Add(' SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = '+QryDados.FieldByName('IDBENEFICIO').AsString);
    QryAuxiliar.Open;

    // edilaine - SOL 262968 / PPM 1102753 - inicio comentado
    {sVlrATualMonBeneficio := sVlrATualMonBeneficio+#13+#10+
                             PreparaStr(psAnoMesRef                                  ,8)+
                             PreparaStr(QryAuxiliar.FieldByName('NOME').AsString     ,34)+
                             PreparaStr(' '                                          ,1)+
                             PreparaStr('(+)'+FormatFloat('#0.00',Abs(pdValor))      ,12)+
                             PreparaStr('(-)'+FormatFloat('#0.00',0)                 ,10);

    // edilaine - SOL 253577-17464 / PPM 955703 - inicio
    lstDadosCorrecao.Add('B' +'|' +
                         QryAux2.FieldByName('IDPESSOA').AsString + '|' +
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

        // SOL 232043 PPM 396781
    if sAnoMesRefAux <> '' then
      psAnoMesRef := sAnoMesRefAux;


    sSQL :='INSERT INTO HSTATRASOCONTRIB '+
           '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, FLGTIPO, '+
           '   VALOR, CODALTERADOR, FLGEVENTO)                                '+
           'VALUES( '+
           IntToStr(piNumLancamento)                                    +', '+
           QuotedStr(psAnoMesRef)                                       +', '+
           QuotedStr(sAnoMesLoteConcessao)                              +', '+
           inttostr(prmIdMotivoContrib)                                 +', '+
           QuotedStr(sFlgTipo)                                          +', '+
           OraNumero(FloattoStr(Abs(pdValor)))                          +', '+
           QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString    +', '+
           QuotedStr('0')                                               +') ';

    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
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
                           PreparaStr('(+)'+FormatFloat('#0.00',0)                 ,10)+
                           PreparaStr('(-)'+FormatFloat('#0.00',Abs(pdValor))      ,12);

    // edilaine - SOL 253577-17464 / PPM 955703
    lstDadosCorrecao.Add('C' +'|' +
                         QryAux2.FieldByName('IDPESSOA').AsString + '|' +
                         psAnoMesRef +'|'+
                         QryAuxiliar.FieldByName('NOME').AsString +'|'+
                         '(+)'+FormatFloat('#0.00', 0) + '|' +
                         '(-)'+FormatFloat('#0.00', Abs(pdValor)) +';' );
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

procedure TfrmCadRequerBenefBfciario.SelecionaReservaPart;
begin
  qryReservaPart.Close;
  qryReservaPart.ParamByName('IdPessJur').Value      := iIdPessJur;
  qryReservaPart.ParamByName('IdPlanoPrev').Value    := iIdPlanoPrev;
  qryReservaPart.ParamByName('IdTitular').Value      := iIdTitular;
  qryReservaPart.ParamByName('SeqProposta').Value    := iSeqProposta;
  qryReservaPart.Open;
end;



procedure TfrmCadRequerBenefBfciario.SelecionaProcesso(piNumeroProcesso : longInt);
begin

  qry.Close;
  qry.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('NumeroProcesso').AsInteger := qry.ParamByName('NumeroProcesso').AsInteger  ;
  qryDet.Open;

  if (piNumeroProcesso = -1) or
     (qryDet.IsEmpty)
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
     qryBeneficio.ParamByName('IdPlanoPrev').AsInteger     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end
  else begin
     qryBeneficio.Close; 
     qryBeneficio.ParamByName('IdEventoGerador').AsInteger := qry.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').AsInteger     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end;

  qryBenefAux.Close;
  qryBenefAux.ParamByName('NumeroProcesso').AsInteger := qry.ParamByName('NumeroProcesso').AsInteger;
  qryBenefAux.Open;

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
                        ' FROM   EVENTOGERADOR                                                            '+
                        ' WHERE  FLGINTERNO IN (''FL'', ''RC'', ''BI'')                                   '+
                        ' AND    IDFUNDACAO = '+IntToStr(iIdFundacao)+ 
                        ' AND    IDEVENTOGERADOR IN (SELECT IDEVENTOGERADOR FROM BENEFICIO) '+
                        ' ORDER BY NOME        ');
      qryEvento.Open;
  end;

  if sTipoFormChamador <> 'EV'
  then begin
     if sTipoFormChamador <> 'SI'
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
                   ' AND    EP.IDPLANOPREV     = '+IntToStr(qryDet.FieldByName('IdPlanoPrev').AsInteger)+
                   ' AND    EP.IDPESSOA        = '+IntToStr(qryDet.FieldByName('IdTitular').AsInteger)+
                   ' AND    EP.SEQPROPOSTA     = '+IntToStr(qryDet.FieldByName('SeqProposta').AsInteger)+
                   ' AND    EP.IDEVENTOGERADOR = '+IntToStr(iIdEvento));
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

  // Refazer query de beneficiario
  qryBeneficiario.Close;
  qrybeneficiario.SQL.Clear;
  qrybeneficiario.SQL.Add(' SELECT  P.NOME, D.DESCRICAO,                                '+
                          '  P.IDPESSOA, DT.NUMSEQUENCIA, DT.IDDEPENDENCIA,             '+
                          '  DT.FLGCONTAIMPOSTOR, DT.FLGCONTASALARIOF,                  '+
                          '  DT.FLGBENEFICIARIO,  BT.IDTITULAR,                         '+
                          '  BT.IDPESSJUR,BT.IDPLANOPREV,BT.IDPESSOA,                   '+
                          '  BT.IDRESPONSAVEL, BT.IDBENEFICIO,BT.PRIORIDADE,            '+
                          '  BT.PERCENTUAL, PRESP.NOME AS NOMERESPONSAVEL,              '+
                          '  PF.DATANASC, PF.SEXO, DT.MATRICULA, BT.IDPLANOORIGEM       '+
                          '  FROM   PESSOA P, PESSOA PRESP, DEPEN D, DEPENTIT DT,        '+
                          '         BFCIARIOTITPLAN BT, BENEFBFCIARIO BB, PESSOAFISICA PF '+
                          '  WHERE  (BB.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+')  '+
                          '  AND    (P.IDPESSOA        = BT.IDPESSOA)                   '+
                          '  AND    (PF.IDPESSOA       = P.IDPESSOA)                    '+
                          '  AND    (BB.IDPESSOA       = BT.IDPESSOA)                   '+
                          '  AND    (BB.IDTITULAR      = BT.IDTITULAR)                  '+
                          '  AND    (BB.IDPESSJUR      = BT.IDPESSJUR)                  '+
                          '  AND    (BB.IDPLANOPREV    = BT.IDPLANOPREV)                '+
                          
                          '  AND    (BB.IDPLANOORIGEM  = BT.IDPLANOORIGEM)              '+

                          '  AND    (BB.IDBENEFICIO    = BT.IDBENEFICIO)                '+
                          '  AND    (BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+))             '+
                          '  AND    (DT.IDPESSOA        = BT.IDPESSOA)                  '+
                          '  AND    (DT.IDTITULAR       = BT.IDTITULAR)                 '+
                          '  AND    (D.IDDEPENDENCIA    = DT.IDDEPENDENCIA)             '+
                          '  ORDER BY P.NOME                                            ');
  qryBeneficiario.Open;


  if piNumeroProcesso <= 0
  then begin
     lblNumProcesso.Caption   := 'Processo Nº ';
     lblSitProcesso.Caption := '';
  end
  else begin
     lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(piNumeroProcesso);
     lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;
     Refresh;
  end;

  pnlMestre.Enabled     := False;

  bbtnProcurar.Visible  := False;
  sbtnConcedeUm.Enabled := False;
  iIdLoteConcessao := -1;
  iIdLote := -1;
  NumeroProcesso := pINumeroProcesso;
  sBeneficiosMovReserva := '';

  iNumeroProcesso := piNumeroProcesso;

end; // SelecionaProcesso

procedure TfrmCadRequerBenefBfciario.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var
    sMesRef,
    sIdTpPagtoAnt,
    sFlgBenefMinimo,
    sValorSalario,
    sValorUltBeneficio : string;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  if qryTitular.IsEmpty then Exit;

  // Dados da Patrocinadora e do Plano
  sNomePatro    := qryTitular.FieldByName('NomePatro').AsString;
  sNomePlano    := qryTitular.FieldByName('NomePlano').AsString;
  sNomeTitular  := qryTitular.FieldByName('Nome').AsString;
  sMatricula    := qryTitular.FieldByName('Matricula').AsString;

  sValorReserva := CalcReservaPart(piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdTitular,
                                   -1,
                                   piSeqProposta,
                                   FormatDateTime('dd/mm/yyyy', date),  
                                   FormatDateTime('dd/mm/yyyy', date),  
                                   '',
                                   '',
                                   '-1',
                                   qryAux
                                  );

  sMesRef         := FormatDateTime('yyyy/mm', Date);
  sValorSalario   := CalcSALPART(piIdPessJur, piIdTitular, sMesRef, qryAux);

  // Situacoes
  iIdSitFunc      := qryTitular.FieldbyName('IdSitFunc').AsInteger;
  iIdSitPart      := qryTitular.FieldbyName('IdSitPart').AsInteger;
  iIdSitPlanoPrev := qryTitular.FieldbyName('IdSitPlanoPrev').AsInteger;
  sTipoSitFunc    := qryTitular.FieldbyName('TipoSit').AsString;     

  if sTipoFormChamador = 'SI'
  then begin
     sFlgInternoAntes   := qryTitular.FieldByName('FLGINTERNO').AsString;
     sFlgInternoDepois  := qryTitular.FieldByName('FLGINTERNO').AsString;
     sIdSitPartAntes    := qryTitular.FieldByName('IDSITPART').AsString;
     sIdSitPartDepois   := qryTitular.FieldByName('IDSITPART').AsString;
     sIdSitFuncAntes    := qryTitular.FieldByName('IDSITFUNC').AsString;
     sIdSitFuncDepois   := qryTitular.FieldByName('IDSITFUNC').AsString;
     sIdSitPlanAntes    := qryTitular.FieldByName('IDSITPLANOPREV').AsString;
     sIdSitPlanDepois   := qryTitular.FieldByName('IDSITPLANOPREV').AsString;
  end;

  sNomeSitPart  := qryTitular.FieldByName('NomeSitPart').AsString;
  sNomeSitFunc  := qryTitular.FieldByName('NomeSitFunc').AsString;
  sNomeSitPlano := qryTitular.FieldByName('NomeSitPlano').AsString;


  bPossuiDivPrevid := (qryTitular.FieldByName('FLGDEVEPREVIDENC').AsString = '1');
  bPossuiDivAssist := (qryTitular.FieldByName('FLGDEVEASSISTENC').AsString = '1');


  bQueryTitular := True;

  if not bAbriuOutroForm
  then begin
     SelecionaReservaPart;

     with qryBfciarioTitPlan do
     begin
        Close;
        ParamByName('IdTitular').Value   := piIdTitular;
        ParamByName('SeqProposta').Value := piSeqProposta;
        ParamByName('IdPessJur').Value   := piIdPessJur;
        ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
        Open;
     end;
     
     with qryBenefReferencia do
     begin
        Close;
        ParamByName('IdTitular').Value       := piIdTitular;
        ParamByName('SeqProposta').Value     := piSeqProposta;
        ParamByName('IdPessJur').Value       := piIdPessJur;
        ParamByName('IdPlanoPrev').Value     := piIdPlanoPrev;
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
  end; // if not bAbriuOutroForm
end; //PreencheDadosTitular

procedure TfrmCadRequerBenefBfciario.PreencheDadosBeneficiario(piNumeroProcesso, piIdTitular, piIdPessoa, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
begin
  iIdPessoa := piIdPessoa;
  if not bAbriuOutroForm
  then begin
     with qryRelBenefPart   do
     begin
        Close;
        ParamByName('IdPessoa').Value       := piIdPessoa;
        ParamByName('IdTitular').Value      := piIdTitular;
        ParamByName('SeqProposta').Value    := piSeqProposta;
        ParamByName('IdPessJur').Value      := piIdPessJur;
        ParamByName('IdPlanoPrev').Value    := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value := iNumeroProcesso;
        Open;
     end;
  end; // if not bAbriuOutroForm

  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := piIdPessoa;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiario.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;
  
  qryDepentit.Close;
  qryDepentit.ParamByName('IDTITULAR').AsInteger := piIdTitular;
  qryDepentit.ParamByName('IDPESSOA').AsInteger  := piIdPessoa;
  qryDepentit.Open;

  If (qryBeneficiario.FieldByName('MATRICULA').AsString <> qryDepentit.FieldByName('MATRICULA').AsString)
     and (prmIDRGDIGMATPENS = 0) 
   Then Begin
    qryDepentit.Edit;
    dbeMatriculaBenef.Field.Value := qryBeneficiario.FieldByName('MATRICULA').AsString;
     //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
    MatriculaBenefInicial := qryBeneficiario.fieldbyname('MATRICULA').AsString;
  End;

end; //PreencheDadosBeneficiario

function  TfrmCadRequerBenefBfciario.AtualizaSitParticipante(piIdPessJur, piIdPlanoPrev,piIdPessoa,
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
      if IsEmpty then Exit;

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

procedure TfrmCadRequerBenefBfciario.GravaBeneficiodeReferencia;
var varfields : variant;
begin
  if iIdBenefReferencia <= 0
  then begin
     MsgDlg('O Benefício de Referência para '+qryBeneficio.FieldByName('Nome').AsString+
            ' não está associado. Verifique. ','Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  varFields    := VarArrayCreate([0,1],varVariant);
  varFields[0] := iIdBenefReferencia;
  varFields[1] := iIdPessoa;


  // Verificar se participante já esta na bfciariotitplan para este beneficio
  if not qryBfciarioTitPlan.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     qryBfciarioTitPlan.Insert;
     qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger    := iIdPessoa;
     qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger   := iIdTitular;
     qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
     qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger   := iIdPessJur;

     
     qryBfciarioTitPlan.FieldByName('IdPlanoorigem').AsInteger := iIdPlanoPrev;


     
     qryBfciarioTitPlan.FieldByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := iIdBenefReferencia;
     qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat    := 0;
     qryBfciarioTitPlan.FieldByName('Percentual').AsFloat    := 100;
     qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdPessoa;
     qryBfciarioTitPlan.Post;
  end; //with

  if not qryBenefReferencia.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then
  if qryBenefReferencia.State in [dsEdit, dsInsert] then  // SIG 127245 Ferrari
  begin
     bGravaBenefReferencia := True;
     qryBenefReferencia.Insert;
     qryBenefReferencia.FieldByName('NUMEROPROCESSO').AsInteger  := iNumeroProcesso;
     qryBenefReferencia.FieldByName('IDPESSJUR').AsInteger       := iIdPessJur;
     qryBenefReferencia.FieldByName('IDPLANOPREV').AsInteger     := iIdPlanoPrev;

     qryBenefReferencia.FieldByName('IDPLANOORIGEM').AsInteger   := iIdPlanoPrev;

     qryBenefReferencia.FieldByName('IDTITULAR').AsInteger       := iIdTitular;
     qryBenefReferencia.FieldByName('IDPESSOA').AsInteger        := iIdPessoa;
     qryBenefReferencia.FieldByName('SEQPROPOSTA').AsInteger     := iSeqProposta;
     qryBenefReferencia.FieldByName('IDBENEFICIO').AsInteger     := iIdBenefReferencia;

     if sTipoFormChamador <> 'SI'
     then qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 6 // Nao Concedido
     else qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 8; // Nao Concedido

     qryBenefReferencia.FieldByName('IDDEPENDENCIA').AsString    := qryBeneficiario.FieldByName('IdDependencia').AsString;
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

     qryBenefReferencia.FieldByName('DATAREQUERIMENTO').AsString := dtDataRequerimento.Text;
     qryBenefReferencia.FieldByName('DATAINICIO').AsString       := dtInicioINSS.Text;
     qryBenefReferencia.FieldByName('DATAFINAL').AsString        := dtDataFinal.Text;
     qryBenefReferencia.FieldByName('FLGFORMAPAGTO').AsString    := 'F';
     qryBenefReferencia.Post;
  end // with
  else if qryBenefReferencia.State in [dsEdit, dsInsert] then    // SIG 127245 Ferrari
  begin // Editar beneficio de referencia
     bGravaBenefReferencia := True;
     qryBenefReferencia.Edit;
     qryBenefReferencia.FieldByName('VALORCALCULADO').AsFloat    := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRCALCINSS').AsFloat       := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRINFINSS').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('DATAREQUERIMENTO').AsString := dtDataRequerimento.Text;
     qryBenefReferencia.FieldByName('DATAINICIO').AsString       := dtInicioINSS.Text;
     qryBenefReferencia.FieldByName('DATAFINAL').AsString        := dtDataFinal.Text;
     qryBenefReferencia.Post;
  end;
end;

function TfrmCadRequerBenefBfciario.TestaQuitacaoDividas : boolean;
Var
  sDataSaldoEmprestimo : String;
  sMensagemErro        : String;
  fSaldoAtualizado,
  fSaldoDevedor,
  fParcelasAberto  : Currency;
  retButton            : Word;
begin
  // Quando o Pagamento do Beneficio é unico
  // Devemos verificar se o beneficio obriga quitar as dividas e se o Titular possui dividas.
  // Caso Positivo, A Situacao do Beneficio Permanece Pendente de Concessao ate que o Titular quite a divida
  Result := False;

  if (qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsString = '0') and bPossuiDivPrevid then
  begin
    MsgDlg('O participante '+sNomeTitular+ ' possui dívida previdenciária e o '+
              'plano não permite a Concessão deste benefício com este tipo de dívida. ',
              'Informação',mtInformation, [mbOk], 0);

    Exit;
  end;

  if (qryBeneficio.FieldByName('FLGQUITAASSISTEN').AsString = '0') and bPossuiDivAssist then
  begin
    MsgDlg('O participante '+sNomeTitular+ ' possui dívida assistencial e o '+
              'plano não permite a Concessão deste benefício com este tipo de dívida. ',
              'Informação',mtInformation, [mbOk], 0);
    Exit;
  end;

  iFlgEmprestimo := -1;
  if (qryBeneficio.FieldByName('FLGQUITAEMPRESTI').AsString = '1') then
  begin
     FazQuery(QryAux,' SELECT DATAPAGAMENTO FROM CTRLINTERFACE '+
                     ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));

    if QryAux.IsEmpty or (QryAux.FieldByName('DATAPAGAMENTO').AsString = '') then
      sDataSaldoEmprestimo := sDataPagamentoConcessao
    else
      sDataSaldoEmprestimo := QryAux.FieldByName('DATAPAGAMENTO').AsString;

     if not dtmDividaEP.ValorDevidoMutuario(qryDet.FieldByName('IdPessoa').AsInteger,
                                            StrToDate(sDataSaldoEmprestimo),
                                            -1,
                                            10,
                                            fSaldoAtualizado,
                                            fSaldoDevedor,
                                            fParcelasAberto,
                                            False, False ) then
    begin
        MsgDlg('Ocorreram erros na apuração do saldo devedor de empréstimo. Verifique.',
               'Erro',mtError,[mbOk],0);
        Exit;
     end;


    if fSaldoAtualizado > 0 then
    begin
      
      If MsgDlg('Saldo de empréstimo: ' + FormatFloat('#,0.00', fSaldoDevedor)    + #13 +
                'Itens em aberto:     ' + FormatFloat('#,0.00', fParcelasAberto)  + #13 +
                'Saldo atualizado:    ' + FormatFloat('#,0.00', fSaldoAtualizado) + '.'+ #13 + #13 +
                'Este saldo será descontado na Folha de Benefícios. Deseja continuar a concessão ? ',
                'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo then
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

        MsgDlg('Concessão cancelada.','Informação',mtInformation,[mbOK],0);
        Exit;
      end;

      iFlgEmprestimo := 0;

      // inicio SOL 149370 KINTANA 1075548
      qryAux.close;
      qryaux.sql.clear;
      qryaux.sql.add('SELECT IDPLANOPREV FROM CONTRATOEMPTMO ');
      qryaux.sql.add('WHERE  Idplanoprev = '+ qryDet.FieldByName('IDPLANOPREV').Asstring );
      qryaux.sql.add('AND IDPESSOA    = '+ qryDet.FieldByName('IdPessoa').Asstring );
      qryaux.sql.add('AND IDBENEF     = '+ qryDet.FieldByName('IdPessoa').Asstring );
      qryaux.sql.add('AND FLGSITUACAO NOT IN (''C'', ''K'', ''Q'') ');
      qryAux.open;
      if not(qryAux.IsEmpty) then //fim SOL 149370 KINTANA 1075548

      if not(dtmDividaEP.QuitaContratosMutuario(qryDet.FieldByName('IdPessoa').AsInteger,
                                                StrToDate(sDataSaldoEmprestimo),
                                                dtDataEvento.Date,  
                                                8,
                                                'B',
                                                iIdLoteConcessao,
                                                sMensagemErro
                                                )) then
      begin
        MsgDlg('Ocorreram erros na quitação automática de empréstimo. Verifique.','Erro',mtError,[mbOk],0);
        Exit;
      end;
      

    end; { if fSaldoAtualizado > 0 }
  end
  else
    iFlgEmprestimo := 2; 

  Result := True;
end; // TestaQuitacaoDividas

function  TfrmCadRequerBenefBfciario.CalculaSaldoRealCont(piIdTipoReserva : integer; pdVlMovReal : double) : double;
var dVlSaldoCont : double;
begin
   Result := 0;

   
   qryaux.Close;
   qryaux.sql.clear;
   qryaux.sql.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT '+
                  ' FROM   HISTMOVRESERVA   '+
                  ' WHERE  (IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)    +')'+
                  ' AND    (IDPESSJUR     = '+IntToStr(iIdPessJur)      +')'+
                  ' AND    (IDTIPORESERVA = '+IntToStr(piIdTipoReserva) +')'+
                  ' AND    (SEQPROPOSTA   = '+IntToStr(iSeqProposta)    +')'+
                  ' AND    ((IDPESSOA IS NULL) OR (IDPESSOA = '+IntToStr(iIdTitular) +'))'+
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

function  TfrmCadRequerBenefBfciario.DevolveReserva(piIdBeneficio, piIdBeneficiario : longint)  : boolean;
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
       if (qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio) or
          (qryMovReservaTemp.FieldByName('IdPessoa').AsInteger    <> piIdBeneficiario) 
       then begin
          qryMovReservaTemp.Next;
          continue;
       end;

       // Preencher valor da reserva do participante hoje
       if not qryReservaPart.Locate('IdTipoReserva', qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger,[loCaseInsensitive])
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

function  TfrmCadRequerBenefBfciario.VerificaNumeroDependentes : boolean;
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



function  TfrmCadRequerBenefBfciario.VerificaBeneficioObrigatorio : boolean;
var bExisteBenefDaMesmaOrdem,
    bExisteBenefNaoRequerido : boolean;
    iIdBeneficiarioAntes,
    iIdBenefAntes,
    iNumBenefNaoRequeridos : longint;
    sMsg ,
    sNomesBeneficios : string;
    varfields : variant;
begin
  Result := False;
  iIdBenefAntes        := qryDet.FieldByName('IdBeneficio').AsInteger;
  iIdBeneficiarioAntes := qryDet.FieldByName('IdPessoa').AsInteger;
  // Fazer verificacoes
  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // requerido

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NOME, B.NUMORDEMEVENTO '+
                 ' FROM BENEFICIO B, BENEFPLANPREV BP '+
                 ' WHERE  B.IDEVENTOGERADOR  = '+qryEvento.FieldByName('IdEventoGerador').AsString+
                 ' AND    B.FLGBENEFOBRIGATO = 1 '+
                 ' AND    BP.IDPLANOPREV     =  '+IntToStr(iIdPlanoPrev)+
                 ' AND    B.NUMORDEMEVENTO   <> '+OraNumero(qryDet.FieldByName('NumOrdemEvento').AsString)+
                 ' AND    BP.IDBENEFICIO     = B.IDBENEFICIO ');
  qryAux.Open;
  bExisteBenefNaoRequerido := False;
  sNomesBeneficios         := '';
  iNumBenefNaoRequeridos   := 0;

  while not qryAux.Eof do
  begin
     if not qryDet.Locate('IdBeneficio',qryAux.FieldbyName('IdBeneficio').AsInteger,[loCaseInsensitive])
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


  varFields := VarArrayCreate([0,1],varVariant);
  varFields[0] := iIdBenefAntes;
  varFields[1] := iIdBeneficiarioAntes;

  qryDet.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive]);
    // HIGOR NAYDE FERREIRA SOL 211709/15287

  if bExisteBenefNaoRequerido
  then begin
       sNomesBeneficios := Copy(sNomesBeneficios,3,length(sNomesBeneficios) - 2);
       if (sistema.idmodulo <> 454) then begin
         if iNumBenefNaoRequeridos = 1
         then sMsg := 'O benefício  '+sNomesBeneficios+ ' é obrigatório e não foi requerido.'
         else sMsg := 'Os benefícios '+sNomesBeneficios+ ' são obrigatórios e não foram requeridos.';

         if MsgDlg(sMsg+'Deseja confirmar o Requerimento do Processo '+IntToStr(iNumeroProcesso)+' ? ' ,
                   'Confirmação',mtConfirmation,[mbYes,mbNo], 1) = mrNo
         then begin
            TiraSQL(qryAux);
            Exit;
         end;
       end;   // HIGOR NAYDE FERREIRA SOL 211709/15287
  end;
  Result := True;
end; // VerificaBeneficioObrigatorio

function  TfrmCadRequerBenefBfciario.VerificaBeneficioRepetido    : boolean;
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
                 ' AND    ((BP.FLGREFERENCIA  = 0 ) OR ((BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 0) ) ) '+
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
   // HIGOR NAYDE FERREIRA SOL 211709/15287
    if (sistema.idmodulo <> 454)then begin
      if bExisteBenefRepetido
      then begin
         sNomesBeneficios := Copy(sNomesBeneficios,3,length(sNomesBeneficios) - 2);
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
  end; // HIGOR NAYDE FERREIRA SOL 211709/15287
  Result := True;
end; // VerificaBeneficioRepetido

function  TfrmCadRequerBenefBfciario.VerificaContribAtrasada (var sMesAtraso : string) : boolean;
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
            ' WHERE (HST.IDPESSOA      = ' + IntToSTr(iIdTitular)   + ')' +
            '   AND (HST.IDPESSJUR     = ' + IntToSTr(iIdPessJur)   + ')' +
            '   AND (HST.IDPLANOPREV   = ' + IntToSTr(iIdPlanoPrev) + ')' +
            '   AND (HST.SEQPROPOSTA   = ' + IntToSTr(iSeqProposta) + ')' +
            '   AND (HST.VALORESPERADO > 0 )  '+
            '   AND (HST.SITRECEBIMENTO IN (''0'',''1'',''3'')) '+
            '   AND (HST.MESREFERENCIA < '''+sMesRef+''') '+
            '   AND (HST.MESCOBRANCA   < '''+sAnoMesLoteConcessao+''')'+
            '   AND (HST.IDMOTIVO      <> '+IntToStr(prmIdMotDevolNaoIden)+')'+
            '   AND (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
            '                                   WHERE  IDPESSJUR   = '+IntToSTr(iIdPessJur)+
            '                                     AND  IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+') )'+
            ' ORDER BY HST.MESREFERENCIA DESC');
    Open;

    if not IsEmpty then
    begin
      sMesAtraso := FieldByName('MesReferencia').AsString;
      Result     := True;
    end;

    Close;
  end; //with

  frmAguarde.Apaga;
end; // VerificaContribAtrasada


function  TfrmCadRequerBenefBfciario.CobraContribAtrasada(piIdPessJur, piIdPlanoPrev,
                                    piIdPessoa, piSeqProposta : longint;
                                   psDataInicioFund : string) : boolean;
var sMesRef           : string;
    dValorPorBeneficiario : double;
    iContBeneficiario     : longint;

    sTipCodigo,
    sCodTipRecDes,
    sRecPag,
    sCodTipDoc,
    sCodPortForma,
    sCodCentroRespon,
    sCodSubConta,
    sCodCentroCustoD,
    sIdEmpresa,
    sCodCentroCustoC,
    sPlaContaD,
    sPlano,
    sPlaContaC,
    sUnidNegoc,
    sIdEmpresaProp   : string;
    sPlaContaDProvis,   
    sPlaContaCProvis,   
    sMsgErro : String;  
    iNumRecebimento : LongInt; 
begin
   Result := False;

   // Se o participante falecido tiver contribuicoes atrasadas, o sistema deve :
   // 1. Acertar o histórico do participante inserindo uma devolucao para ele
   // 2. Inserir o registro de devolucao na TMPDESC para ser descontado dos
   //    dependentes
   frmAguarde.Mostra('Atualizando contribuições atrasadas ... ');

   sMesRef := Copy(psDataInicioFund,7,4)+'/'+Copy(psDataInicioFund,4,2);

   
   with qryAux do
   begin
     Close;

     SQL.Clear;
     SQL.Add(' SELECT HST.MESREFERENCIA,  HST.MESCOBRANCA,    HST.IDMOTIVO,   '+
             '        HST.NUMRECEBIMENTO, HST.VALORESPERADO,  HST.VALOROP1,   '+
             '        HST.VALOROP2,       HST.VALOROP3,       HST.DATAINICIO, '+
             '        HST.DATAFINAL,      HST.IDCONTRIBUICAO, RP.CODPROVDESC, '+
             '        RP.IDRUBRICA                                            '+
             ' FROM   CONTPREV CP, RUBRICAXPESS RP, HSTCONTRIBPREV HST  '+
             ' WHERE  (HST.IDPESSOA       = '  +IntToSTr(iIdTitular)  +')'+
             ' AND    (HST.IDPESSJUR      = '  +IntToSTr(iIdPessJur)  +')'+
             ' AND    (HST.IDPLANOPREV    = '+IntToSTr(iIdPlanoPrev)+')'+
             ' AND    (HST.SEQPROPOSTA    = '+IntToSTr(iSeqProposta)+')'+
             ' AND    (HST.VALORESPERADO > 0 )  '+
             ' AND    (HST.SITRECEBIMENTO <> ''2'') '+
             ' AND    (HST.SITRECEBIMENTO <> ''5'') '+
             ' AND    (HST.SITRECEBIMENTO <> ''9'') '+
             ' AND    (HST.MESREFERENCIA < '''+sMesRef+''') '+
             ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
             '                                    WHERE  IDPESSJUR   = '+IntToSTr(iIdPessJur)+
             '                                    AND    IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+') )'+
             ' AND    (CP.IDPLANOPREV    = HST.IDPLANOPREV)             '+
             ' AND    (CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)          '+
             ' AND    (RP.IDRUBRICA      = CP.IDRUBRICAATRASO)          '+
             ' AND    (RP.IDPESSOA       = '+IntToStr(iIdFundacao)+')   ' );
     Open;

     if IsEmpty then
     begin
       MsgDlg('Contribuições Atrasadas com parâmetros incompletos. '+#13+
              'Verifique se as contribuições possuem rubrica de atraso e se as mesmas '+
              'estão associadas à Fundação.','Erro',mtError,[mbOk],0);

       frmAguarde.Apaga;
       Exit;
     end;

     while not Eof do
     begin
        //BRUNO AZEVEDO SOL 130057 KINTANA 717976
       if (iIdEvento <> 334) and (iIdEvento <> 337) and (iIdEvento <> 15) and (iIdEvento <> 336) and (iIdEvento <> 345) then begin
         // Acertar histórico do participante
         if (iIdEvento <> 4) and (qryDet.FieldByName('FLGPECULIO').AsInteger <> 1) and (qryDet.FieldByName('IDPESSOA').AsInteger <> qryDet.FieldByName('IDTITULAR').AsInteger) then begin  //Fanuel Junior SOL 163521 Kintana 1396877
         iNumRecebimento := InsereHstContribPREV( dtmAPrev.qryAux,
                                                  iIdTitular,
                                                  1,
                                                  iIdPessJur,
                                                  iIdPlanoPrev,
                                                  FieldByName('IdContribuicao').AsInteger,
                                                  prmIDMOTIVOFOLHABEN,
                                                  FieldByName('MesReferencia').AsString,
                                                  FormatDateTime('yyyy/mm', StrToDate(sDataPagamentoConcessao)),
                                                  -1,
                                                  sDataPagamentoConcessao,
                                                  '',
                                                  FieldByName('ValorEsperado').AsFloat,
                                                  FieldByName('ValorEsperado').AsFloat,
                                                  0,
                                                  -1,
                                                  1,
                                                  FieldByName('ValorOp1').AsFloat,
                                                  FieldByName('ValorOp2').AsFloat,
                                                  FieldByName('ValorOp3').AsFloat,
                                                  FieldByName('DataInicio').AsString,
                                                  FieldByName('DataFinal').AsString,
                                                  'AS',
                                                  2,
                                                  1,
                                                  iIdLoteConcessao,
                                                  'F',
                                                  0,
                                                  0,
                                                  1,
                                                  1 );

         If iNumRecebimento < 0 then
         Begin
           frmAguarde.Apaga;
           Exit;
         End;

         dtmAPrev.qryAux.Close;
         dtmAPrev.qryAux.SQL.Clear;
         dtmAPrev.qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 9  '+
                                 ' WHERE  MESREFERENCIA  = '''+FieldByName('MESREFERENCIA').AsString+ ''''+
                                 ' AND    MESCOBRANCA    = '''+FieldByName('MESREFERENCIA').AsString+ ''''+
                                 ' AND    IDMOTIVO       =   '+FieldByName('IDMOTIVO').AsString+
                                 ' AND    NUMRECEBIMENTO =   '+FieldByName('NUMRECEBIMENTO').AsString);
         try
           dtmAPrev.qryAux.ExecSQL;
         except
           frmAguarde.Apaga;
           Exit;
         end;
        end; //Fanuel Junior SOL 163521 Kintana 1396877
       end;
       //BRUNO AZEVEDO SOL 130057 KINTANA 717976

       // Contar quantos beneficiario tem e guardar o IdPessoa de Cada um deles
       qryDet.First;
       iContBeneficiario := 0;
       while not qryDet.Eof do
       begin
          if (qryDet.FieldByName('IdSitBeneficio').AsInteger = 1) or
             (qryDet.FieldByName('IdSitBeneficio').AsInteger = 2) or
             (qryDet.FieldByName('FLGPECULIO').AsInteger = 1)  
          then inc(iContBeneficiario);
          qryDet.Next;
       end;

       dValorPorBeneficiario := FieldByName('ValorEsperado').AsFloat / iContBeneficiario;

       qryDet.First;
       while not qryDet.Eof do
       begin

         // ******************************************************************************
         // Preencher Informacoes de Integracao com Financeiro e Contabilidade
         // ******************************************************************************
         if not dtmAPrevIntegraBack.BuscaInfIntegra( iIdPessJur,
                                                     iIdPlanoPrev,
                                                     iIdTitular,
                                                     qryDet.FieldByName('IdPessoa').AsInteger,
                                                     FieldByName('IdContribuicao').AsInteger,
                                                     'C',
                                                     'B',
                                                     0,
                                                     FormatDateTime('yyyy/mm', StrToDate(sDataPagamentoConcessao)), 
                                                     FieldByName('MesReferencia').AsString,
                                                     sTipCodigo,
                                                     sCodTipRecDes,
                                                     sRecPag,
                                                     sCodTipDoc,
                                                     sCodPortForma,
                                                     sCodCentroRespon,
                                                     sCodSubConta,
                                                     sCodCentroCustoD,
                                                     sIdEmpresa,
                                                     sCodCentroCustoC,
                                                     sPlaContaD,
                                                     sPlano,
                                                     sPlaContaC,
                                                     sPlaContaDProvis,    
                                                     sPlaContaCProvis,    
                                                     sUnidNegoc,
                                                     sIdEmpresaProp,
                                                     'R',  
                                                     True,
                                                     sMsgErro ) then 
         begin
            MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
            frmAguarde.Apaga; 
            Exit;
         end;

         // Inserir divida na TMPDESC rateada por beneficiario
         if not InsereTMPDESC ( dtmAPrev.qryAux,
                                '',               // psCODALTERADOR
                                sCodCentroCustoC, // psCODCENTROCUSTOC
                                sCodCentroCustoD, // psCODCENTROCUSTOD
                                sCodCentroRespon, // psCODCENTRORESPON
                                '',               // psCODDOCUMENTOEFET
                                '',               // psCODDOCUMENTOPREV
                                sCodPortForma,    // psCODPORTFORMA
                                FieldByName('CodProvDesc').AsString,
                                sCodSubConta,    // psCODSUBCONTA
                                sCodTipDoc,      // psCODTIPDOC
                                sCodTipRecDes,   // psCODTIPRECDES
                                '',              // psCOMPLDOCUMENTO
                                sDataPagamentoConcessao,
                                '',              // psDATARECEBIMENTO
                                sDataPagamentoConcessao,
                                'Contrib. atrasada de particip. falecido. ',
                                '',              // psEXERCICIO
                                '',              // psFLGALTERADOR
                                'A',             // psFLGATRASODEVOL
                                'B',             // psFLGDESCFOLHA
                                '1',             // psFLGDESCONTO
                                '1',             // psFLGEXISTEHST
                                '',
                                'P',             // psFLGTIPODESC
                                FieldByName('IdContribuicao').AsString,    // psIDDESCONTO
                                sIdEmpresaProp,                            // psIDEMPCOBRANCA
                                sIdEmpresaProp,                            // psIDEMPRESA
                                sIdEmpresaProp,                            // psIDEMPRESAPROP
                                '',                                        // psIDFAVORECIDO
                                IntToStr(iIdFundacao),                     // psIDFUNDACAO
                                IntToStr(iIdLoteConcessao),                // psIDLOTE
                                '16',                                      // psIDMODULO
                                IntToStr(prmIdMotivoFOLHABEN),             // psIDMOTIVO
                                IntToStr(iIdPessJur),                      // psIDPESSJUR
                                qryDet.FieldByName('IdPessoa').AsString,
                                IntToStr(iIdPlanoPrev),                    // psIDPLANOPREV
                                IntToStr(iIdPlanoPrev),                    // psIDPLANPREVCONTAB
                                FieldByName('IdRubrica').AsString,         // psIDPROVENTO
                                IntToStr(iIdTitular),                      // psIDTITULAR
                                qryTitular.FieldByName('InscricaoNumero').AsString,
                                qryTitular.FieldByName('Matricula').AsString,
                                FormatDateTime('yyyy/mm', StrToDate(sDataPagamentoConcessao)), 
                                FieldByName('MesReferencia').AsString,
                                '',                            // psNODOCUMENTO
                                '',                            // psPERIODO
                                sPlaContaC,                    // psPLACONTAC
                                sPlaContaD,                    // psPLACONTAD
                                sPlano,                        // psPLANO
                                'P',                           // psRECPAG
                                '***',                         // psREFERENCIA
                                '1',                           // psSEQPROPOSTA
                                '16',                          // SISTORIGEM
                                '0',                           // psSITENVIO
                                prmTpOperFolhaBen,             // psTIPCODIGO,
                                sUnidNegoc,                    // psUNIDNEGOC,
                                FloatToStr(dValorPorBeneficiario),
                                FieldByName('ValorOp1').AsString,      // psVALORBASE1,
                                FieldByName('ValorOp2').AsString,      // psVALORBASE2,
                                FieldByName('ValorOp3').AsString,      // psVALORBASE3,
                                '',                                    // psVALORINFO,
                                '',                                    // psVALORRECEBIDO
                                iNumRecebimento //NUMRECEBIMENTO 
                      ) then
         Begin
           frmAguarde.Apaga; 
           Exit;
         End;

         qryDet.Next;
       end;

       Next;
     end;
   end; //with

   frmAguarde.Apaga;

   Result := True;
end; // CobraContribAtrasada

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS OVERRIDE *************************
// ********************************** ********************** *************************
procedure TfrmCadRequerBenefBfciario.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Se for concessao de beneficio, desbilitar o inserir
  sbtnInserir.Enabled  := ((sTipoFormChamador <> 'CO') and (sTipoFormChamador <> 'MA'));
  sbtnConceder.Enabled :=  (sTipoFormChamador  = 'CO') and (not qryDet.IsEmpty);
  sbtnProcurar.Enabled :=  (sTipoFormChamador <> 'EV');

  sbtnImprimirSimulacao.Visible := False;
  sbtnImprimirSimulacao.Enabled := False;

  sbtnDemonsSRB.Visible         := False;
  sbtnDemonsSRB.Enabled         := False;

  LblAlterador.visible      := sbtnConceder.Enabled; // SOL 132938
  DbLAlterador.visible      := sbtnConceder.Enabled; // SOL 132938
  DbLAlterador.Enabled := True;

  if sTipoFormChamador = 'SI' then
  begin
    if not prmFlgGravaSimulBenef then
      sbtnProcurar.Enabled      := False
    else
      sbtnProcurar.Enabled      := True;

    sbtnImprimirSimulacao.Visible := True;
    sbtnImprimirSimulacao.Enabled := True;
  end
  else
  begin
    sbtnDemonsSRB.Visible         := True;
    //sbtnDemonsSRB.Enabled         := True;           // edilaine - SOL 253577-18129 / PPM 1303078
  end;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {se entrou na concessão pela tela de requerimento, desabilitar controles}
  if sRequerimento then
     ConfiguraAcessosTela(ctConcessaoViaRequerimento);
  sbtnApagar.enabled := false;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmCadRequerBenefBfciario.CmeCadastroConfirma(Sender: TObject);
begin
   try
      //Vinicius Ferreira
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

      with qry do begin
         if qry.State in [dsEdit, dsInsert] then qry.Post;
         if Active and UpdatesPending then ApplyUpdates;
      end;

      with qryBfciarioTitPlan do
         if Active and UpdatesPending then ApplyUpdates;

      with qryDet do
         if Active and UpdatesPending
         then begin
            // Andre Imakawa - SIG 61218 - Inicio
            if (Sistema.IdModulo = 454) and (sTipoFormChamador <> 'CO')
                 and (sTipoFormChamador <> 'SI') then
            begin
                  updDet.InsertSQL.Clear;
                  updDet.InsertSQL.Add('insert into BENEFBFCIARIO' + #13#10 +
                  '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDTITULAR, IDPESSOA,' + #13#10 +
                  'SEQPROPOSTA,' + #13#10 +
                  '   IDBENEFICIO, CODPORTFORMA, IDSITBENEFICIO, IDDEPENDENCIA,' + #13#10 +
                  'IDTPPAGTOBENEFIC,' + #13#10 +
                  '   VALORATUAL, DATAREQUERIMENTO, DATAINICIO, DATAFINAL,' + #13#10 +
                  'FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS,' + #13#10 +
                  'VLRINFINSS,' + #13#10 +
                  '   DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND, VALORCOTAS,' + #13#10 +
                  'VALORTOTAL,' + #13#10 +
                  '   DATACONCESSAO, FLGPROVISORIO, PERCPROVISORIO,' + #13#10 +
                  'PRAZOPROVISORIO, ULTMESREAJUSTE,' + #13#10 +
                  '   ULTVALORATUALREAJ, DIBBENEFANT, VALORBENEFANT,' + #13#10 +
                  'VALORBINSSANT1, VALORBINSSANT2,' + #13#10 +
                  '   VALORBINSSANT3, FLGBENEFMIN, VALORSRB, IDPLANOORIGEM,VALORNADIB,' + #13#10 +
                  'IDPLANPREVCONTAB, FONTEPAGADORA, PLACONTAD, PLACONTAC, FLGPAGAINSS,' + #13#10 +
                  'VALORBASE1,   VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3,' + #13#10 +
                  'VLRBSTOTAL, VLRFABTOTAL, VLRBSATUAL, VLRFABATUAL, VLRBASEDEFICIT, BSDIB, FABDIB' + #13#10 +
                  ',IDPERFILINVEST' + #13#10 +
                  ',FABTITULAR, BSTITULAR, VLRTOTALTITULAR ' + #13#10 +         //edilaine WO18667
                  ')' + #13#10 +
                  '' + #13#10 +
                  'values' + #13#10 +
                  '' + #13#10 +
                  '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDTITULAR, :IDPESSOA,' + #13#10 +
                  ':SEQPROPOSTA,' + #13#10 +
                  '   :IDBENEFICIO, :CODPORTFORMA, :IDSITBENEFICIO, :IDDEPENDENCIA,' + #13#10 +
                  ':IDTPPAGTOBENEFIC,' + #13#10 +
                  '   :VALORATUAL, :DATAREQUERIMENTO, :DATAINICIO, :DATAFINAL,' + #13#10 +
                  ':FLGFORMAPAGTO, :VALORCALCULADO, :DATAULTREAJUSTE, :VLRCALCINSS,' + #13#10 +
                  ':VLRINFINSS,' + #13#10 +
                  '   :DATAINICIOINSS, :NUMPROCINSS, :DATAINICIOFUND, :VALORCOTAS,' + #13#10 +
                  ':VALORTOTAL,' + #13#10 +
                  '   :DATACONCESSAO, :FLGPROVISORIO, :PERCPROVISORIO,' + #13#10 +
                  ':PRAZOPROVISORIO, :ULTMESREAJUSTE,' + #13#10 +
                  '   :ULTVALORATUALREAJ, :DIBBENEFANT, :VALORBENEFANT,' + #13#10 +
                  ':VALORBINSSANT1, :VALORBINSSANT2,' + #13#10 +
                  '   :VALORBINSSANT3, :FLGBENEFMIN, :VALORSRB, :IDPLANOORIGEM, :VALORNADIB,' + #13#10 +
                  ':IDPLANPREVCONTAB, :FONTEPAGADORA, :PLACONTAD, :PLACONTAC, :FLGPAGAINSS,' + #13#10 +
                  ':VALORBASE1,   :VALORBASE2, :VALORBASE3, :CAMPOTEXTO1, :CAMPOTEXTO2, :CAMPOTEXTO3,' + #13#10 +
                  ':VLRBSTOTAL, :VLRFABTOTAL, :VLRBSATUAL, :VLRFABATUAL, :VLRBASEDEFICIT, :BSDIB, :FABDIB' + #13#10 +
                  ',:IDPERFILINVEST' + #13#10 +
                  ',:FABTITULAR, :BSTITULAR, :VLRTOTALTITULAR ' + #13#10 +         //edilaine WO18667
                  ')');

            end;
            // Andre Imakawa - SIG 61218 - Fim
            
            updDet.ModifySQL.Clear;
            if (sTipoFormChamador = 'CO') and bConcedeuBeneficio
            then updDet.ModifySQL.Add( ' UPDATE BENEFBFCIARIO                              '+
                                       ' SET                                               '+
                                       '   CODPORTFORMA = :CODPORTFORMA,                   '+
                                       '   IDSITBENEFICIO = :IDSITBENEFICIO,               '+
                                       '   IDDEPENDENCIA = :IDDEPENDENCIA,                 '+
                                       '   IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,           '+
                                       '   DATAREQUERIMENTO = :DATAREQUERIMENTO,           '+
                                       '   DATAINICIO = :DATAINICIO,                       '+
                                       '   DATAFINAL = :DATAFINAL,                         '+
                                       '   FLGFORMAPAGTO = :FLGFORMAPAGTO,                 '+

                                      
                                       '   VALORATUAL = :VALORATUAL,                       '+
                                       '   VALORTOTAL = :VALORTOTAL,                       '+

                                      
                                       '   FLGPAGAINSS = :FLGPAGAINSS,                     '+

                                       '   VALORCALCULADO = :VALORCALCULADO,               '+
                                       '   VLRCALCINSS = :VLRCALCINSS,                     '+
                                       '   VLRINFINSS = :VLRINFINSS,                       '+
                                       '   DATAINICIOINSS = :DATAINICIOINSS,               '+
                                       '   NUMPROCINSS = :NUMPROCINSS,                     '+
                                       '   DATAINICIOFUND = :DATAINICIOFUND,               '+
                                       '   VALORCOTAS = :VALORCOTAS,                       '+
                                       '   DATACONCESSAO = :DATACONCESSAO,                 '+
                                       '   FLGPROVISORIO = :FLGPROVISORIO,                 '+
                                       '   PERCPROVISORIO = :PERCPROVISORIO,               '+
                                       '   PRAZOPROVISORIO = :PRAZOPROVISORIO,             '+
                                       '   DIBBENEFANT = :DIBBENEFANT,                     '+
                                       '   VALORBENEFANT = :VALORBENEFANT,                 '+
                                       '   VALORBINSSANT1 = :VALORBINSSANT1,               '+
                                       '   VALORBINSSANT2 = :VALORBINSSANT2,               '+
                                       '   VALORBINSSANT3 = :VALORBINSSANT3,               '+
                                       '   FLGBENEFMIN = :FLGBENEFMIN,                     '+
                                       '   VALORSRB = :VALORSRB,                           '+
                                       // edilaine - SOL 253577-17464 / PPM 955703 - inicio
                                       // bruno azevedo - SOL 253577-18069 / PPM 1241131 - COMENTADO INICIO
                                       {'   VLRBSTOTAL = :VLRBSTOTAL,                       '+
                                       '   VLRFABTOTAL = :VLRFABTOTAL,                     '+
                                       '   VLRBSATUAL = :VLRBSATUAL,                       '+
                                       '   VLRFABATUAL = :VLRFABATUAL,                     '+
                                       '   VLRBASEDEFICIT = :VLRBASEDEFICIT,               '+ }
                                       // bruno azevedo - SOL 253577-18069 / PPM 1241131 - COMENTADO FIM
                                       '   BSDIB = :BSDIB,                                 '+
                                       '   FABDIB = :FABDIB,                               '+
                                       // edilaine - SOL 253577-17464 / PPM 955703 - fim

                                       // Paulo Nobre - WO16247 - Inicio
                                       '   RESERVADIB = :RESERVADIB,                       '+
                                       '   SALDOCONTADIB = :SALDOCONTADIB,                 '+
                                       '   INDICEDIB = :INDICEDIB                          '+
                                       // Paulo Nobre - WO16247 - Fim

                                       ' WHERE                                             '+
                                       '   NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND        '+
                                       '   IDPESSJUR = :OLD_IDPESSJUR AND                  '+
                                       '   IDTITULAR = :OLD_IDTITULAR AND                  '+
                                       '   IDPLANOPREV = :OLD_IDPLANOPREV AND            '+
                                       '   IDPESSOA = :OLD_IDPESSOA AND                    '+
                                       '   SEQPROPOSTA = :OLD_SEQPROPOSTA AND              '+
                                       '   IDBENEFICIO = :OLD_IDBENEFICIO                  ')
            else updDet.ModifySQL.Add( ' UPDATE BENEFBFCIARIO                              '+
                                       ' SET                                               '+
                                       '   CODPORTFORMA = :CODPORTFORMA,                   '+
                                       '   IDSITBENEFICIO = :IDSITBENEFICIO,               '+
                                       '   IDDEPENDENCIA = :IDDEPENDENCIA,                 '+
                                       '   IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,           '+
                                       '   VALORATUAL = :VALORATUAL,                       '+
                                       '   DATAREQUERIMENTO = :DATAREQUERIMENTO,           '+
                                       '   DATAINICIO = :DATAINICIO,                       '+
                                       '   DATAFINAL = :DATAFINAL,                         '+
                                       '   FLGFORMAPAGTO = :FLGFORMAPAGTO,                 '+
                                       '   VALORCALCULADO = :VALORCALCULADO,               '+
                                       '   DATAULTREAJUSTE = :DATAULTREAJUSTE,             '+
                                       '   VLRCALCINSS = :VLRCALCINSS,                     '+
                                       '   VLRINFINSS = :VLRINFINSS,                       '+
                                       '   DATAINICIOINSS = :DATAINICIOINSS,               '+
                                       '   NUMPROCINSS = :NUMPROCINSS,                     '+
                                       '   DATAINICIOFUND = :DATAINICIOFUND,               '+
                                       '   VALORCOTAS = :VALORCOTAS,                       '+
                                       '   VALORTOTAL = :VALORTOTAL,                       '+
                                       '   DATACONCESSAO = :DATACONCESSAO,                 '+
                                       '   FLGPROVISORIO = :FLGPROVISORIO,                 '+
                                       '   PERCPROVISORIO = :PERCPROVISORIO,               '+
                                       '   PRAZOPROVISORIO = :PRAZOPROVISORIO,             '+
                                       '   ULTMESREAJUSTE = :ULTMESREAJUSTE,               '+
                                       '   ULTVALORATUALREAJ = :ULTVALORATUALREAJ,         '+
                                       '   DIBBENEFANT = :DIBBENEFANT,                     '+
                                       '   VALORBENEFANT = :VALORBENEFANT,                 '+
                                       '   VALORBINSSANT1 = :VALORBINSSANT1,               '+
                                       '   VALORBINSSANT2 = :VALORBINSSANT2,               '+
                                       '   VALORBINSSANT3 = :VALORBINSSANT3,               '+
                                       '   FLGBENEFMIN = :FLGBENEFMIN,                     '+

                                       '   VALORNADIB = :VALORNADIB,                       '+

                                       '   FLGPAGAINSS = :FLGPAGAINSS,                     '+

                                       '   VALORSRB = :VALORSRB,                           '+

                                       // edilaine - SOL 253577-17464 / PPM 955703 - inicio
                                       // bruno azevedo - SOL 253577-18069 / PPM 1241131 - COMENTADO INICIO
                                       '   VLRBSTOTAL = :VLRBSTOTAL,                       '+     // edilaine - SOL 253577-18129 / PPM 1303078 - descomentado inicio
                                       '   VLRFABTOTAL = :VLRFABTOTAL,                     '+
                                       '   VLRBSATUAL = :VLRBSATUAL,                       '+
                                       '   VLRFABATUAL = :VLRFABATUAL,                     '+
                                       '   VLRBASEDEFICIT = :VLRBASEDEFICIT,               '+     // edilaine - SOL 253577-18129 / PPM 1303078 - descomentado fim
                                       // bruno azevedo - SOL 253577-18069 / PPM 1241131 - COMENTADO FIM
                                       '   BSDIB = :BSDIB,                                 '+
                                       '   FABDIB = :FABDIB,                               '+
                                       // edilaine - SOL 253577-17464 / PPM 955703 - fim

                                       // Paulo Nobre - WO16247 - Inicio
                                       '   RESERVADIB = :RESERVADIB,                       '+      
                                       '   SALDOCONTADIB = :SALDOCONTADIB,                 '+
                                       '   INDICEDIB = :INDICEDIB                          '+
                                       // Paulo Nobre - WO16247 - Fim
 
                                       ', FABTITULAR = :FABTITULAR ' + #13#10 +         //edilaine WO18667
                                       ', BSTITULAR  = :BSTITULAR   ' + #13#10 +         //edilaine WO18667
                                       ', VLRTOTALTITULAR = :VLRTOTALTITULAR ' + #13#10 +     //edilaine WO18667

                                       // edilaine - SOL 253577-17464 / PPM 955703 - fim
                                       IFF(Sistema.IdModulo <> 454, '''','  ,IDPERFILINVEST = :IDPERFILINVEST ')+  //edilaine - SIG55933 // Andre Imakawa - SIG 61218
                                       ' WHERE                                             '+
                                       '   NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND        '+
                                       '   IDPESSJUR = :OLD_IDPESSJUR AND                  '+
                                       '   IDPLANOPREV = :OLD_IDPLANOPREV AND              '+
                                       '   IDPLANOORIGEM = :OLD_IDPLANOORIGEM AND              '+
                                       '   IDTITULAR = :OLD_IDTITULAR AND                  '+
                                       '   IDPESSOA = :OLD_IDPESSOA AND                    '+
                                       '   SEQPROPOSTA = :OLD_SEQPROPOSTA AND              '+
                                       '   IDBENEFICIO = :OLD_IDBENEFICIO                  ');
            ApplyUpdates;
         end;

      if sTipoFormChamador <> 'SI'
      then begin
         with qryReservaPart do
            if Active and UpdatesPending then ApplyUpdates;

         with qryMovReservaTemp do
            if Active and UpdatesPending then ApplyUpdates;

      end;

      
      with qryDepentit do
         if Active and UpdatesPending then ApplyUpdates;
      

      with qryBenefReferencia do
         if Active and UpdatesPending then ApplyUpdates;

      with qryRelBenefPart do
         if Active and UpdatesPending then ApplyUpdates;

      with qryRelBenefPart do
         if Active and UpdatesPending and bGravaBenefReferencia then ApplyUpdates;

      
      With qryDResPart Do
       If (Active) And (UpdatesPending)
        Then ApplyUpdates;

      With qryDesindRes do
       If (Active) And (UpdatesPending)
        Then ApplyUpdates;
      

      SelecionaProcesso(qry.FieldByName('NumeroProcesso').AsInteger);

   except
      raise;
   end;

end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRequerBenefBfciario.CmeCadastroCancel(Sender: TObject);
begin
  try
      
      with qryDepentit do
         if Active and UpdatesPending then CancelUpdates;
      

     with qryBenefReferencia do
        if Active and UpdatesPending then CancelUpdates;

     with qryBfciarioTitPlan do
        if Active and UpdatesPending then CancelUpdates;

     with qryMovReservaTemp do
        if Active and UpdatesPending then CancelUpdates;

     
     With qryDResPart Do
      If (Active) And (UpdatesPending)
       Then CancelUpdates;

     With qryDesindRes do
      If (Active) And (UpdatesPending)
       Then CancelUpdates;
     

  except
     raise;
  end;


  inherited;

  
  if (sTipoFormChamador = 'CO') and (dtmBaseDados.dbBaseDados.InTransaction)
  then dtmBaseDados.dbBaseDados.RollBack;

end;

procedure TfrmCadRequerBenefBfciario.CmeCadastroDelete(Sender: TObject);
begin
  // Verificar restricoes a exclusao
  qryMovReservaTemp.First;
  while not qryMovReservaTemp.Eof do
  begin
     qryMovReservaTemp.Delete;
  end;

  qryRelBenefPart.First;
  while not qryRelBenefPart.Eof do
  begin
     qryRelBenefPart.Delete;
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

procedure TfrmCadRequerBenefBfciario.CmeCadastroInsert(Sender: TObject);
begin
   if (qryDet.recordcount <= 0) then   // SOL 256744 PPM 999526
   begin
     iNumeroProcesso := LeUltRegistro(qryAux,'PROCESSOBENEF');
     SelecionaProcesso(iNumeroProcesso);
     iNumBenef := 0;

     inherited;
     pnlMestre.Enabled    := True;

     if sTipoFormChamador = '' then          // edilaine - SOL 253577-18129 / PPM 1303078
        bbtnProcurar.visible := True;
   

     {A data do evento na tela deve ser igual a data de evento da tela de
      registro do evento e não a data de hoje}
     dtDataEvento.Date        := StrToDate(sDataEvento);

     qry.FieldByName('DtEvento').AsDateTime   := dtDataEvento.Date;
     qry.FieldByName('DtDireito').AsDateTime  := date;

     lblNumProcesso.Caption   := 'Processo Nº ' + IntToStr(iNumeroProcesso);
     lblSitProcesso.Caption   := 'Situação : Pendente de Concessão';
     Refresh;

     bGravaBenefReferencia    := False;
     bExecutouRegraConcessao  := False;
     lblNomeBenef.Caption     := '';
     sValorTotal              := '0';
     sValorInfInss            := '0';
     sValorCalcInss           := '0';
     iFlgTipoINSS             := 2;
     sDataInicioPagto         := FormatDateTime('dd/mm/yyyy', date); 
   end;
end; // CmeCadastro.Insert(Self)



procedure TfrmCadRequerBenefBfciario.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled    := True;
   
   bbtnProcurar.visible := False;
   bGravaBenefReferencia := False;
   bExecutouRegraConcessao := False;
   bConcedeuBeneficio      := False;
   bPerguntouCancelar := False;


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
      pnlBenefProv.Enabled       := True;
      dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499
   end;

end; // CmeCadastro.Edit(Self)

procedure TfrmCadRequerBenefBfciario.CmeDetalheConfirma(Sender: TObject);
begin
  //
  inherited;
end; // CmeDetalhe.Confirma(Self)

procedure TfrmCadRequerBenefBfciario.CmeCadastroFind(Sender: TObject);
var sTempoServAnoDigitado,
    sTempoServMesDigitado,
    sTempoServDiaDigitado : string;
begin
  inherited;
  if ((MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> ''))
     Or ((bFlgBenefMorte) And (MontaSelect.ValoresChave[0] <> '')) 
  then begin
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     iIdTitular      := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
     
     iIdPlanoPrevTit := StrToInt(MontaSelect.ValoresChave[5]);

     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;
     bPerguntouCancelar := False;

     if sTipoFormChamador <> 'SI' then sbtnCadContaCorrente.Enabled := True; 
     //if sTipoFormChamador <> 'SI' then sbtnDemonsSRB.Enabled        := True;         // edilaine - SOL 253577-18129 / PPM 1303078

     // FUNCEF - Se o chamador for uma SIMULACAO , entao pedir o tempo de servico
     if sTipoFormChamador = 'SI'
     then begin
        Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);
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
     iIdCalculo      := 0;
     iIdCalculoGeral := 0;

     
     If qryDepentit.State = dsEdit
      Then qryDepentit.Post;
     

     SelecionaProcesso(iNumeroProcesso);
     
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrevTit, iSeqProposta);
     
     PreencheDadosBeneficiario(iNUmeroProcesso,iIdTitular,qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                iIdPessJur,iIdPlanoPrev,iSeqProposta);
  end;
end; // CmeCadastro.Find(Self)

procedure TfrmCadRequerBenefBfciario.CmeDetalheInsert(Sender: TObject);
var sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sFlgBenefMinAnt,
    sUltMesReajAnt,
    sDataEventoAnt,
    sCodBeneficioAnt     : string;
    sValorBase1Ant,
    sValorBase2Ant,
    sValorBase3Ant    : string;
begin
  iIdChamaElegebilidade := 0; // Andre Imakawa - SIG 103584
  if Trim(dblkpcmbEvento.Text) = ''
  then begin
    MsgDlg('Preencha o Evento Gerador.','Erro',mtError,[mbOk],0);
    dblkpcmbEvento.Enabled := True;
    dblkpcmbEvento.SetFocus;
    bbtnCancelarDetClick(frmCadRequerBenefBfciario);
    Exit;
  end;

  if (iIdTitular <= 0) or (iIdPessJur <= 0) or (iIdPlanoPrev <= 0) or (iSeqProposta <= 0 )
  then begin
    MsgDlg('Escolha o Participante Titular.','Erro',mtError,[mbOk],0);
    if (bbtnProcurar.enabled) and (bbtnProcurar.visible) then
    bbtnProcurar.SetFocus;
    bbtnCancelarDetClick(frmCadRequerBenefBfciario);
    sbtnInsDet.Enabled := True;
    Exit;
  end;
  lblNomeBenef.Caption := '';

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
  qryBeneficio.Open;

  inherited;

  // Se o parametro tiver valor maior que zero ó pq foi ativo, pois o default no banco é "0" (zero)
  If prmQtdDiasRetrBenef > 0 Then
    // se a diferença da datarequirimento e dataevento for menor do que o parametro,
    // então paga o retroativo normalmente, caso contrário não paga.
    bPagaRetroativo :=  (Abs(Date - dtDataEvento.Date)  < prmQtdDiasRetrBenef)
  Else
    bPagaRetroativo := True;
  

  rValorReal              := 0;
  rValorCotas             := 0;
  rValorDaCotaBenef       := 0;
  sDataDaCotaBenef        := '';

  reValorBeneficio.Text   := '';          // edilaine - SOL 253577-17374 / PPM 848182 - alterado para vazio
  reValorTotal.Text       := '';          // edilaine - SOL 253577-17374 / PPM 848182
  reValorSRB.Text         := '0';
  reValorCalcINSS.Text    := '0';
  reValorINfINSS.Text     := '0';
  dtDataRequerimento.Date := date;

  qryDet.FieldByName('ValorAtual').AsFloat            := 0;
  qryDet.FieldByName('ValorCalculado').AsFloat        := 0;
  qryDet.FieldByName('DataRequerimento').AsDateTime   := date;
  qryDet.FieldByName('FlgFormaPagto').AsString        := 'F';
  qryDet.FieldByName('FlgProvisorio').AsInteger       := 0;
  dbrgrpBenefProvisorio.ItemIndex                     := 0;

  dtInicioINSS.Date := dtDataEvento.Date;
  qryDet.FieldByName('DataInicioINSS').AsString := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date); 

  if (Trim(dtInicioFund.Text) = '') and (Trim(dtDataEvento.Text) <> '') then
  begin
    If bPagaRetroativo Then
    Begin
      qryDet.FieldByName('DataInicioFund').AsString := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date); 
      dtInicioFund.Date                             := dtDataEvento.Date;
    End Else
    Begin
      qryDet.FieldByName('DataInicioFund').AsString := FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date); 
      dtInicioFund.Date                             := dtDataRequerimento.Date;
      dtInicioFund.Enabled :=  False;
      dtDataEvento.Enabled := dtInicioFund.Enabled;
    End;
  end;

  bbtnOpcoes.Visible      := False;
  lblAgencia.Visible      := False;
  dblkpcmbAgencia.Visible := False;

  reValorInfINSS.Color := clWindow;

  if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible)
  then dblkpcmbBeneficio.SetFocus;

  if Trim(sDataInicioPagto) = '' then   
  begin
    If bPagaRetroativo Then
      qryDet.FieldByName('DataInicio').AsString := sDataInicioPagto
    Else
      qryDet.FieldByName('DataInicio').AsString := dtDataRequerimento.Text;
      If Trim(sDataInicioPagto) <> '' Then
        dtDataInicio.Date                         := StrToDate(sDataInicioPagto);
  end else
  begin
     qryDet.FieldByName('DataInicio').AsString := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date);  
     dtDataInicio.Date                         := dtDataEvento.Date;  
  end;

  lblPercConc.Visible   := False;
  dbedPercConc.Visible  := False;
  lblPercent.Visible    := False;
  lblPrazoProv.Visible  := False;
  dbedPrazoProv.Visible := False;
  lblMesProv.Visible    := False;
  pnlBenefProv.width    := 148;   // edilaine - SOL 253577-17374 / PPM 848182

  iIdBenefReferencia    := -1;
  bReajustouInss        := False;
  bRecalculouProvisorio := False;


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
    reValorFABAtu.text  := '';
    reValorBSAtu.text   := '';
    reValorDeficit.text := '';

    //edilaine WO18367 : inicio
    reVlrFabTit.text    := '';
    reVlrBsTit.text     := '';
    reVlrTotalTit.text  := '';
    //edilaine WO18367 : inicio
  end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
  BuscaDadosBeneficioAnterior ( qryAux,
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
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS,
                                True );

  if Trim(sDataInicioAnt) <> ''
  then begin
    qryDet.FieldByName('DibBenefAnt').AsString   := sDataInicioAnt;
    qryDet.FieldByName('ValorBenefAnt').AsString := ClienteNumero(sValorAnt);
  end;

  bbtnConfirmar.enabled := false;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := false;    // edilaine - SOL 253577-18129 / PPM 1303078

end; // CmeDetalhe.Insert(Self)

procedure TfrmCadRequerBenefBfciario.CmeDetalheEdit(Sender: TObject);
var rvalor : real;
begin
  inherited;
  sNumProcINSS    := '';
  sValorCalcINSS  := '0';
  sValorInfINSS   := '0';
  sDataInicioINSS := '';
  sValorBase1INSS := '0';
  sValorBase2INSS := '0';
  sValorBase3INSS := '0';
  rvalor := 0;
  // Habilitar os componentes
  btn_SelecionaBeneficios.enabled := true;
  dtDataRequerimento.Enabled      := true;
  dblkpcmbBeneficiario.enabled    := true;
  dbeMatriculaBenef.Enabled       := True;  
  dbedNumProcINSS.enabled         := true;
  dtInicioINSS.enabled            := true;
  dtInicioFund.enabled            := true;
  reValorCalcInss.enabled         := true;
  reValorInfINSS.enabled          := true;
  reValorBeneficio.enabled        := true;
  reValorSRB.Enabled              := True;
  reValorTotal.enabled            := true;
  dtDataInicio.enabled            := true;
  dtDataFinal.enabled             := true;
  dblkcmbTpPgtoBenef.Enabled      := False; // Peterson Victor SOL 268616 PPM 1266499
  dblkpcmbPortForma.enabled       := true;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
  qryBeneficio.Open;
  
  if sTipoFormChamador <> 'CO' then
      reValorTotal.Text        := qryDet.FieldByName('ValorTotal').AsString;
  reValorCalcInss.Text     := FormatFloat('#0.00',qryDet.FieldByName('VlrCalcINSS').AsFloat);
  reValorInfInss.Text      := FormatFloat('#0.00',qryDet.FieldByName('VlrINFINSS').AsFloat);

  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
  then begin
     reValorBeneficio.Text := FormatFloat('#0.000000',qryDet.FieldByName('ValorCotas').AsFloat);
     rValorCotas           := StrToFloat(FormatFloat('#0.000000',qryDet.FieldByName('ValorCotas').AsFloat));
     rValorReal            := StrToFloat(FormatFloat('#0.000000',ConverteBeneficioParaReal(rValorCotas)));
  end
  else begin
     reValorBeneficio.Text := FormatFloat('#0.00',qryDet.FieldByName('ValorAtual').AsFloat);
     rValorReal            := StrToFloat(FormatFloat('#0.00',qryDet.FieldByName('ValorAtual').AsFloat));
     rValorCotas           := 0;
  end;

  reValorSRB.Text          := FormatFloat('#0.00',qryDet.FieldByName('ValorSRB').AsFloat);

  if qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
    pnlBenefProv.width    := 148;   // edilaine - SOL 253577-17374 / PPM 848182
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
    pnlBenefProv.width    := 388;   // edilaine - SOL 253577-17374 / PPM 848182
  end;
  bRecalculouProvisorio := True;

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  bFlgApresentaDeficit := (qryBeneficio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
  bFlgApresentaBSFAB   := (qryBeneficio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);

  AjustaTela();
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
     (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
  begin
    reValorFAB.text     := qryDet.FieldByName('VLRFABTOTAL').AsString;
    reValorBS.text      := qryDet.FieldByName('VLRBSTOTAL').AsString;
    reValorFABAtu.text  := qryDet.FieldByName('VLRFABATUAL').AsString;
    reValorBSAtu.text   := qryDet.FieldByName('VLRBSATUAL').AsString;
    reValorDeficit.text := qryDet.FieldByName('VLRBASEDEFICIT').AsString;

    //edilaine WO18367 : inicio
    reVlrFabTit.text    := qryDet.FieldByName('FABTITULAR').AsString;
    reVlrBsTit.text     := qryDet.FieldByName('BSTITULAR').AsString;
    reVlrTotalTit.text  := qryDet.FieldByName('VLRTOTALTITULAR').AsString;
    //edilaine WO18367 : inicio
  end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  // Se o parametro do beneficio por plano (flgbenefinf) definir que
  //    o no. de beneficiarios elegiveis                                                                                  
  // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
  //       está com os elegiveis
  // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
  //       iNumBenef := numero total de beneficiarios

  qryAux.Close;
  qryAux.SQL.Clear;
  
  qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP '+
                 ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                 ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                 ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                 ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                 ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                 ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                 ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                 ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                 );
  qryAux.Open;

  iNumBenef := qryAux.RecordCount;

  if not qryBeneficio.Active then Exit;

  if (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) and
     (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
  then begin
    qryAux.Close;
    qryAux.SQL.Clear;
    
    qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP '+
                   ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                   ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                   ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                   ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                   ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                   ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                   ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                   ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                   );
    qryAux.Open;
    iNumBenef := qryAux.RecordCount;
  end;

  
  // No caso de manutenção de processo, caso o parametro seja maior do que zero,
  // desabilitar os componentes que manipulam das data de evento e requerimento.
  If sTipoFormChamador = 'MA' Then
  Begin
    If prmQtdDiasRetrBenef > 0 Then
    Begin
      dtInicioFund.Enabled :=  (Abs(Date - dtDataEvento.Date)  < prmQtdDiasRetrBenef);
      dtDataEvento.Enabled := dtInicioFund.Enabled;
    End;
  End;   

  bbtnConfirmar.enabled := false;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := false;    // edilaine - SOL 253577-18129 / PPM 1303078
  
end;
// ********************************** ********************** *************************
// ********************************** MÉTODOS DO FORM  ***** *************************
// ********************************** ********************** *************************

procedure TfrmCadRequerBenefBfciario.FormCreate(Sender: TObject);
begin
  sTipoFormChamador := '';
  inherited;
  iIdChamaElegebilidade := 0;
  
  bbtnCancelar.ModalResult := mrNone;

  qryTpPgtoBenef.Close;
  qryTpPgtoBenef.Open;
  qryFolha.Close;
  qryFolha.ParamByName('idfundacao').asinteger := iIdFundacao;
  qryFolha.Open;
  qryPortForma.Close;
  qryPortForma.Open;
  qryAgenciaResgate.Close;
  qryAgenciaResgate.Open;


///retirado pelo SOL206918
//  //Marcos Merola SOL161215  07/11/2011 Inicio
//  qryUser.Close;
//  qryUser.Open;
//  //Marcos Merola SOL161215  07/11/2011 Fim

  SelecionaProcesso(-1);
  bQueryTitular := False;
  bQuerySalarios := False;
  bQueryContribuicoes := False;
  bAbriuOutroForm     := False;
  qryBeneficiario.open; // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O qryBeneficiario.open;

  dbeMatriculaBenef.ReadOnly := (prmIDRGDIGMATPENS = 1);
  qryIncluiAlterador.Open; // SOL 132938
  DblAlterador.Text := 'Não'; // SOL 132938

  //lstDadosCorrecao := TStringList.create;     // edilaine - SOL 253577-17464 / PPM 955703  // edilaine - SOL 262968 / PPM 1102753 - comentado
  
end;

procedure TfrmCadRequerBenefBfciario.bbtnProcurarClick(Sender: TObject);
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     iIdTitular                := StrToInt(MontaSelectPart.ValoresChave[0]);
     iIdPessJur                := StrToInt(MontaSelectPart.ValoresChave[1]);
     iIdPlanoPrev              := StrToInt(MontaSelectPart.ValoresChave[2]);
     iSeqProposta              := StrToInt(MontaSelectPart.ValoresChave[7]);
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end; // if montasel.valoreschave.count > 0
end;


procedure TfrmCadRequerBenefBfciario.qryBeforePost(DataSet: TDataSet);
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
     if (dtDataEvento.enabled) and (dtDataEvento.visible) then
     dtDataEvento.SetFocus;
     Abort;
  end;

  inherited;
  if qry.State = dsInsert
  then begin
     qry.FieldByName('NumeroProcesso').AsInteger := iNumeroProcesso;
     qry.FieldByName('IdEventoGerador').AsInteger := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qry.FieldByName('DtRegistro').AsDateTime    := date;
     if sTipoFormChamador <> 'SI'
     then qry.FieldbyName('IdSitProcesso').AsInteger   := 4  // Pendente de Concessao
     else qry.FieldbyName('IdSitProcesso').AsInteger   := 8; // Simulacao
     sNumerosProcessos := sNumerosProcessos + ','+IntToStr(iNumeroProcesso);
  end;

end;

procedure TfrmCadRequerBenefBfciario.qryDetBeforePost(DataSet: TDataSet);
var bBeneficioMinimo, bErro : boolean;
begin
  if qryDet.State = dsInsert
  then begin
     qryDet.FieldByName('NumeroProcesso').AsInteger := iNumeroProcesso;
     qryDet.FieldByName('IdTitular').AsInteger      := iIdTitular;
     qryDet.FieldByName('IdPessJur').AsInteger      := iIdPessJur;
     qryDet.FieldByName('IdPlanoPrev').AsInteger    := iIdPlanoPrev;
     qryDet.FieldByName('IdPlanoORIGEM').AsInteger  := iIdPlanoPrev;
     qryDet.FieldByName('SeqProposta').AsInteger    := iSeqProposta;
     qryDet.FieldByName('IdPessoa').AsInteger       := qrybeneficiario.fieldbyname('IDPESSOA').AsInteger;
     qryDet.FieldByName('IdBeneficio').AsInteger    := qrybeneficio.fieldbyname('IDBENEFICIO').AsInteger;

     if sTipoFormChamador <> 'SI'
     then qryDet.FieldByName('IdSitBeneficio').AsInteger := 4
     else qryDet.FieldByName('IdSitBeneficio').AsInteger := 8;

     qryDet.FieldByName('IdDependencia').AsString   := qrybeneficiario.fieldbyname('IDDEPENDENCIA').AsString;
     qryDet.FieldByName('FlgFormaPagto').AsString   := 'F';
     qryDet.FieldByName('Descricao').AsString       := 'Pendente de Concessão';
     qrydet.fieldbyname('NOME').AsString            := qrybeneficio.fieldbyname('NOME').AsString;
     qrydet.fieldbyname('DEPEN').AsString           := qrybeneficiario.fieldbyname('NOME').AsString;
  end;

  //edilaine - SIG55933 - inicio
  if sTipoFormChamador <> 'CO' then
     qryDet.FieldByName('IDPERFILINVEST').AsInteger := PerfilAtual.iIdPerfilInvest
  else
     //PerfilAtual.iIdPerfilInvest := qryDet.FieldByName('IDPERFILINVEST').AsInteger;              //edilaine SIG118881
     PerfilAtual := BuscaPerfilInvestimento( qryDet.FieldByName('IDPERFILINVEST').AsInteger );     //edilaine SIG118881
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


  if Trim(reValorTotal.Text)     = '' then reValorTotal.Text     := '0';
  if Trim(reValorBeneficio.Text) = '' then reValorBeneficio.Text := '0';
  if Trim(reValorSRB.Text)       = '' then reValorSRB.Text       := '0';
  if Trim(reValorCalcInss.Text)  = '' then reValorCalcInss.Text  := '0';
  if Trim(reValorInfINSS.Text)   = '' then reValorInfINSS.Text   := '0';

  //sValorTotal      := OraNumero(Trim(reValorTotal.Text));
  sValorInfInss    := OraNumero(Trim(reValorInfInss.Text));
  sValorCalcInss   := OraNumero(Trim(reValorCalcInss.Text));
  sDataInicioPagto := Trim(dtDataInicio.Text);
  iFlgTipoINSS     := 0;
  bNovoBeneficio := False;

  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
  then begin // beneficio em cotas
     qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.00',ConverteBeneficioParaReal(rValorCotas)));
     qryDet.FieldByName('ValorCalculado').AsFloat := rValorCotas;
     qryDet.FieldByName('ValorCotas').AsFloat     := rValorCotas;
  end
  else begin // beneficio em real
     qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryDet.FieldByName('ValorCalculado').AsFloat := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryDet.FieldByName('ValorCotas').AsFloat     := rValorCotas;
  end;

  
  if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0)
  then qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 1
  else qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 2;


  if not bConcedeuBeneficio
  then qryDet.FieldByName('VALORSRB').AsFloat          := StrToFloat(ClienteNumero(reValorSRB.Text))
  else qryDet.FieldByName('VALORSRB').AsFloat          := dValorSRB;

  If sTipoFormChamador <> 'CO' Then

    qryDet.FieldByName('VALORNADIB').AsFloat           := qryDet.FieldByName('ValorAtual').AsFloat ;

  qryDet.FieldByName('VLRCALCINSS').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
  qryDet.FieldByName('VlrINFINSS').AsFloat         := StrToFloat(ClienteNumero(reValorInfINSS.Text));

  // Higor Nayde Ferreira  SOL - 181980 KTN - 1706119 Início
  //qryDet.FieldByName('ValorTotal').AsFloat         := StrToFloat(ClienteNumero(sValorTotal));

  If sTipoFormChamador <> 'CO' Then Begin
    //caso benefício do INSS gravar o valor total como o valor do INSS
    //que não estava sendo gravado
    if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 then
       qryDet.FieldByName('ValorTotal').AsFloat := StrToFloat(FormatFloat('#0.00',rValorReal))
       else qryDet.FieldByName('ValorTotal').AsFloat := StrToFloat(ClienteNumero(reValorTotal.Text));
  End;
  // Higor Nayde Ferreira SOL - 181980 KTN - 1706119 Fim


  qryDet.FieldByName('NUMORDEMEVENTO').AsInteger   := qryBeneficio.FieldByName('NUMORDEMEVENTO').AsInteger;
  if trim(dblkpcmbPortForma.text) = '' then
    qryDet.fieldbyname('CODPORTFORMA').AsString := '';

  
  // Chamar a regra de verificação de benefício mínimo
  if qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger > 0
  then begin

     bBeneficioMinimo := ExecutaRegraBeneficioMinimo (qryAux,
                                                      qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger,
                                                      iIdPessJur,
                                                      iIdPlanoPrev,
                                                      iIdTitular,
                                                      iSeqProposta,
                                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                      qrybeneficiario.fieldbyname('IDPESSOA').AsInteger,
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
                                                      0,
                                                      bErro,
                                                      reValorSRB.Text,
                                                      '0',      
                                                      '' );     
     if bErro
     then begin
        MsgDlg('Erro na Regra de Verificação de Benefício Mínimo - Regra No. '+qryBeneficio.FieldByName('IDREGRABENEFMIN').AsString,
               'Erro', mtError, [mbOk], 0);
        Abort;
     end;

     if bBeneficioMinimo
     then qryDet.FieldByName('FLGBENEFMIN').AsInteger := 1
     else qryDet.FieldByName('FLGBENEFMIN').AsInteger := 0;
  end;


  
  qryDet.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryTpPgtoBenef.FieldByName('IDTPPAGTOBENEFIC').AsInteger;


  
  ExecutarQuery(QryAux, 'UPDATE DEPENTIT SET MATRICULA = '+
                         QuotedStr(dbeMatriculaBenef.Text)+
                        ' WHERE IDPESSOA  = '+QryDet.FieldByName('IDPESSOA').AsString +
                        ' AND   IDTITULAR = '+QryDet.FieldByName('IDTITULAR').AsString); // Renato Visoni SOL 124616 Kintana 637550



  inherited;

end;

procedure TfrmCadRequerBenefBfciario.reValorBeneficioBtnClick(
  Sender: TObject);
var rPercProvisorio,
    rValorReserva,
    rValorBeneficio : double;
    bErro : boolean;
    sSQLBenefAssoc,
    sValorReserva,
    sMsgErro : string;
    iIdCalculoAnt,
    iIdBeneficio : LongInt;
begin
  inherited;
  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
    if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
    dblkpcmbBeneficio.SetFocus;
    Exit;
  end;



  frmAguarde.Mostra('Regra de Cálculo de Benefício - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString);

  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

  // Executar regra de calculo do beneficio
  try
    iIdCalculoAnt   := iIdCalculo;

    if reValorFAB.text = '' then
       reValorFAB.text := '0';

    if reValorBS.text = '' then
       reValorBS.text := '0';

    rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                            qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                            -1,
                                                            iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                            iSeqProposta,
                                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                            iNumeroProcesso,
                                                            iNumBenef,
                                                            rOpcao1, rOpcao2, rOpcao3,
                                                            sSQLBenefAssoc,
                                                            FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), 
                                                            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), 
                                                            FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), 
                                                            reValorTotal.Text,
                                                            reValorInfInss.Text,
                                                            reValorCalcINSS.Text,
                                                            FloatToStr(rValorReserva),
                                                            bErro,
                                                            sMsgErro,
                                                            iIdCalculo,
                                                            qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                            qryBeneficiario.FieldByName('IdDependencia').AsString,
                                                            qryBeneficiario.FieldByName('Percentual').AsString,
                                                            1,
                                                            qryDet.FieldByName('DibBenefAnt').AsString,
                                                            qryDet.FieldByName('ValorBenefAnt').AsString,
                                                            '',
                                                            -1,
                                                            qryDet.FieldByName('FLGPROVISORIO').AsInteger,   
                                                            qryDet.FieldByName('PRAZOPROVISORIO').AsInteger, 
                                                            qryDet.FieldByName('PERCPROVISORIO').AsFloat,
                                                            0,    
                                                            qryDet.FieldByName('DATAREQUERIMENTO').AsString
                                                            ,-1, StrToFloat(ClienteNumero(reValorFAB.text)),          // edilaine - SOL 253577-17464 / PPM 955703
                                                            StrToFloat(ClienteNumero(reValorBS.text))
                                                            );
  except
    frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;

  if iIdCalculo = 0 then
    iIdCalculo := iIdCalculoAnt;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    rValorReal  := 0;
    rValorCotas := 0;
    reValorBeneficio.Text := '0';
    Exit;
  end;

  rValorReal  := rValorBeneficio;  

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then Begin
    rValorCotas := ConverteBeneficioParaCotas(rValorReal); 
    reValorBeneficio.Text := FormatFloat('#0.000000',rValorCotas);
  end
  else reValorBeneficio.Text := FormatFloat('#0.00',rValorReal);
  bRecalculouProvisorio := True;

end;

procedure TfrmCadRequerBenefBfciario.reValorCalcInssBtnClick(
  Sender: TObject);
var rValorINSS : double;
    bErro : boolean;
    sMsgErro : string;
begin
  inherited;
  // Executar regra de calculo do valor do inss
  if (Trim(qryBeneficio.FieldByName('IDREGRACALCINSS').AsString) <> '') AND
     (qryBeneficio.FieldByName('IDREGRACALCINSS').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Cálculo do INSS - Nº '+qryBeneficio.FieldByName('IdRegraCALCINSS').AsString);

     Try
       rValorINSS :=  ExecutaRegraCalculoINSS (qryAux,
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
                                    1,
                                    bErro,
                                    sMsgErro, iIdCalculo,                                    
                                    qryDet.FieldByName('DibBenefAnt').AsString,
                                    qryDet.FieldByName('ValorBenefAnt').AsString,

                                    qryDet.FieldByName('VALORBINSSANT1').AsString,
                                    qryDet.FieldByName('VALORBINSSANT2').AsString,
                                    qryDet.FieldByName('VALORBINSSANT3').AsString,0,'0');
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
     else reValorCalcINSS.Text  := FloatToStr(rValorINSS);
  end // if idregra <> ''
  else
  begin
    rValorINSS := 0;
    reValorCalcINSS.Text := '0';
  end;
end;

procedure TfrmCadRequerBenefBfciario.qryBeneficioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (not qryDet.Active) or (not (qryDet.State in [dsEdit,dsInsert]))
  then Exit;

  if sTipoFormChamador = 'SI'
  then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor (Real)  ';

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;
  end
  else dblkcmbTpPgtoBenef.Text := '';

  bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FLGACEITAOPCAO').AsInteger = 1 ) or  (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);

 lblAgencia.Visible      := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );
 dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );

  // Preencher qual é o beneficio de referencia
  if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
  then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
  else iIdBenefReferencia  := -1;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';
     pnlNaoBenefProv.Visible := False;
     pnlBenefProv.Visible    := True;

  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação '; 
     pnlNaoBenefProv.Visible := True;
     pnlBenefProv.Visible    := True;
  end;

end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbEventoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (iIdPlanoPrev <= 0 ) or (not qryEvento.Active) then Exit;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
  qryBeneficio.Open;
end;

procedure TfrmCadRequerBenefBfciario.bbtnOkDetClick(Sender: TObject);
var rPercProvisorio : double;
    beneficioselecionado : string ;
    i , idbeneficioselecionado : integer;  // contador de for
    sDataInicio, sDataFinal, sMsgErro : string; 
    bErro : boolean;
    varFields : variant;

    sSql, sResult : String;

    sFlgFitEspecial, sFlgMigrado  : String;
    cAuxSeparador : char;
    dVlrOpcao1,
    dVlrOpcao2,
    dVlrOpcao3    : Double;

    //SOL160185
    sCampoTexto1,
    sCampoTexto2,
    sCampoTexto3 :string;
    //SOL160185

begin
  // edilaine - SOL 253577-17404 / PPM 850977 - inicio
  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or
     (sTipoFormChamador = 'CO') then
  begin

    if (bFlgApresentaBSFAB) then
    begin
      {RN17 - Ao calcular da base do déficit, caso os valores de BS e FAB não tenham sido calculados anteriormente apresentar crítica MSG06}
      if (reValorBS.Text = '') or (reValorFAB.Text = '') then
      begin
        MsgDlg('Para cálculo da base do déficit é necessário calcular o valor do BS e o valor do FAB. ','Informação',mtInformation,[mbOk],0);
        Exit;
      end;
    end;
      
    if (pnlNaoBenefProv.visible) and (reValorTotal.text = '') then
    begin
      MsgDlg('É necessário calcular o '+lblVlrTotal.Caption+'.','Informação',mtInformation,[mbOk],0);
      Exit;
    end;

    if (pnlNaoBenefProv.visible) and (reValorBeneficio.text = '') then
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
        frmAguarde.Apaga;
        Exit;
      end;

      {RN1/2/3 - Ao alterar o processo de benefício se o valor do Beneficio Saldado não for informado o sistema apresenta crítica MSG13}
      if (reValorFAB.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do FAB.','Informação',mtInformation,[mbOk],0);
        frmAguarde.Apaga;
        Exit;
      end;
    end;

    {RN1/2/3 - Ao alterar o processo de benefício se o valor do Beneficio Saldado não for informado o sistema apresenta crítica MSG14}
    if (bFlgApresentaDeficit) and (reValorDeficit.text = '') then
    begin
      MsgDlg('É necessário informar o valor da base de cálculo do déficit.', 'Erro', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  // edilaine - SOL 253577-17404 / PPM 850977 - fim

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
                                           false,
                                           false,
                                           bPerfilAtivo);

    //if (sTipoFormChamador <> 'CO') then
    begin
      if (PerfilAtual.iIdPerfilInvest < 0) then
      begin
        MsgDlg('Participante não possui perfil de investimento cadastrado.','Erro',mtError,[mbOk],0);
        Exit;
      end
      else if (PerfilAtual.iIdPerfilInvest > 0) and (not bPerfilAtivo) then
      begin
        MsgDlg('O perfil de investimento do participante está inativo.','Erro',mtError,[mbOk],0);
        Exit;
      end;
    end;
  end
  else
  begin
    PerfilAtual.iIdPerfilInvest   := -1;
    PerfilAtual.iIdPlanPrevContab := -1;
  end;
  //edilaine - SIG55933 - fim

  idBeneficioSelecionado := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger; // guarda último beneficio selecionado
  iIdPessoa              := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;

      // Vinicius Ferreira SOL 159322 KINTANA 1308856 - INICIO
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.Sql.Add('SELECT IDPESSOA, ');
      qryAux.Sql.Add('       MATRICULA AS MATRICULA' );
      qryAux.Sql.Add('  FROM DEPENTIT ');
      qryAux.Sql.Add(' WHERE MATRICULA = ' + QuotedStr(dbeMatriculaBenef.Text));
      qryAux.Sql.Add(' AND   IDPESSOA  <> ' + Inttostr(iIdPessoa));  //SOL 169376 Kintana 1501396
      //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
      if (MatriculaBenefInicial <> '') then begin
        qryAux.SQL.Add('   AND MATRICULA <> ' + QuotedStr(MatriculaBenefInicial));
      end;
      //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
      qryAux.Open;

      if qryAux.Recordcount > 0 then begin
        MsgDlg('Matrícula já existe. ','Informação',mtInformation,[mbOk],0);
        Abort;
      end;
      // Vinicius Ferreira SOL 159322 KINTANA 1308856 - FIM

      // Verificar hstbenefbfciario Vinicius Ferreira
  sBeneficioAnterior := IntToStr(qryDet.FieldByName('IdBeneficio').AsInteger);       // SIG 127245 Ferrari
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
                 ' FROM   hstbenefbfciario '+
                 ' WHERE     NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                 ' AND    IDBENEFICIO  = '+QuotedStr(sBeneficioAnterior)+  // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O QuotedStr
                 ' AND    IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    IDPESSOA     = '+IntToStr(iIdPessoa)+
                 ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(iSeqProposta));
  qryAux.Open;

   if not (qryAux.IsEmpty) then
   begin

     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

 // SOL 141078 KINTANA 888253
  with qryAux do
  begin
     Close;
     SQL.Clear;
     //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Inicio **
     SQL.Add(' SELECT TIPOCONTA FROM CM.CONTABANCARIA '+
             ' WHERE TIPOCONTA = 2 '+
             ' AND (IDPESSOA = ' + inttostr(iIdPessoa) + ')');
     Open;
     if IsEmpty then
     begin
        Msg := 'Conta Salário não cadastrada!';
     end;
     //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Fim **

     Close;
     SQL.Clear;
     SQL.Add(' SELECT NUMDOCUMENTO FROM CM.PESSOA  '+
             ' WHERE  NUMDOCUMENTO IS NOT NULL '+
             ' AND   (IDPESSOA        = '+inttostr(iIdPessoa)   +')');
     Open;
     if IsEmpty
     then begin
        if Msg <> '' then
           Msg := Msg + chr(13) + 'Participante/Pensionita sem CPF cadastrado!'
        else
           Msg := 'Participante/Pensionita sem CPF cadastrado!';
     end;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGISENTOIRRF FROM CM.PESSOAFISICA  '+
             ' WHERE  FLGISENTOIRRF IS NOT NULL '+
             ' AND   (IDPESSOA        = '+inttostr(iIdPessoa)   +')');
     Open;
     if IsEmpty
     then begin
        if Msg <> '' then
           Msg := Msg + chr(13) + 'Participante/Pensionista sem Opção de Imposto de Renda!'
        else
           Msg := 'Participante/Pensionista sem Opção de Imposto de Renda!';
     end;

    //Renato Visoni SOL 155058 Kintana 1197225
    if Msg <> '' then begin
       MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
       exit;
    end;
    //Renato Visoni SOL 155058 Kintana 1197225
  end;


  // SOL 141078 KINTANA 888253

  // Fazer Validacoes
  //ERALDO LUIS DA SILVA SOL 136375 KINTANA 815802 INICIO
  if (qryDet.State in [dsEdit,dsInsert]) then
  begin
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
    or (not (QryAux.IsEmpty)) then begin
       if (QryAux2.IsEmpty) and (qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2) then begin //ERALDO LUIS DA SILVA SOL 163824 KINTANA 1402584 // SOL:258193 PPM:976792
          if (dbedNumProcINSS.Text = ''  ) OR (dbedNumProcINSS.Text ='          ') then begin
             MsgDlg('É necessário informar o NB do INSS.','Informação',mtInformation,[mbOk],0);
             Exit;
          end;
       end;
       QryAux2.Close;
    end;
  end;
  //ERALDO LUIS DA SILVA SOL 136375 KINTANA 815802 FIM

  if Trim(dtDataRequerimento.Text) = ''
  then begin
    MsgDlg('Data de Requerimento não preenchida.','Erro',mtError,[mbOk],0);
    if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible) then
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if Trim(dtDataInicio.Text) = ''
  then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    if (dtDataInicio.Enabled) and (dtDataInicio.Visible)
    then dtDataInicio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

    //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
  if Trim(dtInicioFund.Text) = ''
  then begin
    MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
    if (dtInicioFund.Enabled) and (dtInicioFund.Visible)
    then dtInicioFund.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;
  //BRUNO AZEVEDO SOL 156428 KINTANA 1235970


   //edilaine SIG115877 : inicio
   if (Sistema.IdModulo = 454)
   then begin
    //edilaine SIG115300 : inicio
    if (dtDataRequerimento.Date > date)
    then begin
       MsgDlg('A Data de Requerimento não pode ser superior a Data Atual. ',
              'Informação',mtInformation,[mbOk],0);
       dtDataRequerimento.SetFocus;
       Exit;
    end;

    if (Trim(dtInicioFund.Text) <> '') and
       (Trim(dtDataEvento.Text) <> '') and
       (dtInicioFund.Date > dtDataEvento.Date) then
    begin
       MsgDlg('A DIB (Data de Início na Fundação) não pode superior a Data do Evento. ',
              Sistema.NomeModulo, mtInformation, [mbOk], 0);
       Repaint;
       dtInicioFund.SetFocus;
       Exit;
    end;

    if (dtDataInicio.Date > date)
    then begin
       MsgDlg('A Data Início do Pagamento não pode ser superior a Data Atual. ',
              'Informação',mtInformation,[mbOk],0);
       if dtDataInicio.Canfocus then
          dtDataInicio.SetFocus;
       Exit;
    end;
    //edilaine SIG115300 : inicio
  end;
  //edilaine SIG115877 : inicio


  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Benefício não preenchido.','Erro',mtError,[mbOk],0);
    if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
    dblkpcmbBeneficio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  
  if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) and
     ((Trim(reValorTotal.Text) = '') or (StrToFloat(ClienteNumero(reValorTotal.Text)) <= 0)) and
     (qryBeneficio.FieldByName('FLGACEITAZERO').AsInteger <= 0) 
  then begin
    MsgDlg('Valor Total do Benefício inválido.','Erro',mtError,[mbOk],0);
    if (reValorTotal.Enabled) and (reValorTotal.Visible)
    then reValorTotal.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;


  
  if (prmIDRGDIGMATPENS = 1) and (trim(dbeMatriculaBenef.text)  = '')
  then begin
    MsgDlg('A matrícula da pensionista não foi preenchida. Verificar parametrização.','Erro',mtError,[mbOk],0);
    if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible) then
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;


  if (prmIDRGDIGMATPENS = 1) and
     (length(trim(dbeMatriculaBenef.text)) <> strtoint(prmMASCMATPENS))
  then begin
    MsgDlg('A matrícula do pensionista não está de acordo com o número de digitos parametrizado. Verificar regra do DV.','Erro',mtError,[mbOk],0);
    if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible) then
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;
  


  
  // Data do Requerimento nao pode ser menor que a data do evento
  if (Trim(dtDataRequerimento.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtDataRequerimento.Date < dtDataEvento.Date)   and
     not(qrybeneficio.fieldbyname('FLGRESGATE').AsInteger in [0,1])  // SOL 224485 Kintana 2060136
  then begin
     MsgDlg('A Data de Requerimento não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtDataRequerimento.SetFocus;
     Exit;
  end;
  


  
  // se for benefício do INSS atribuir o valor Inf. do INSS ao valor do benefício.
  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 Then
  begin
     rValorReal  := StrToFloat(ClienteNumero(reValorInfINSS.Text));
  end;


     

  if  (pnlNaoBenefProv.Visible) and  
   ((Trim(reValorBeneficio.Text) = '') or (StrToFloat(ClienteNumero(reValorBeneficio.Text)) <= 0))
   and (qryBeneficio.FieldByName('FLGACEITAZERO').AsInteger <= 0) 

  then begin
    MsgDlg('Valor do Benefício inválido.','Erro',mtError,[mbOk],0);
    if (reValorBeneficio.enabled) and (reValorBeneficio.visible) then
    reValorBeneficio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if (Trim(dtDataInicio.Text) <> '') and (Trim(dtDataFinal.Text) <> '') and
     (StrToDate(dtDataInicio.Text) > StrToDate(dtDataFinal.Text) )
  then begin
    MsgDlg('Inconsistência : a data de início do pagamento é maior que a data final.','Erro',mtError,[mbOk],0);
    if dtDataInicio.Enabled then dtDataInicio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  // Se o beneficio obriga numero do processo e o numero estiver em
  // branco, dar mensagem
  if (qryBeneficio.FieldByName('flgObrigaNProc').AsString = '1') and
     (Trim(dbedNumProcINSS.Text) = '') and
     (sTipoFormChamador <> 'SI')
     { Caso beneficio de Resgato, nº do processo não é obrigatório }
     and (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger  <> 1)
  then begin
    MsgDlg('O Nº do Processo no INSS para este benefício é obrigatório e não foi preenchido. Verifique',
           'Erro',mtError,[mbOk],0);
    dbedNumProcINSS.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if  (pnlNaoBenefProv.Visible) and  
    ((qryBeneficio.FieldbyName('IdRegraCalculo').AsInteger > 0) and
    ( not bRecalculouProvisorio))
  then begin
    MsgDlg('A opção "Benefício Provisório" foi alterada e o benefício não foi recalculado.'+#13+
           'Recalcule o benefício antes de confirmar a operação.',
           'Informação',mtInformation,[mbOk],0);
    TiraSQL(qryAux);
    Abort;
  end;

  // Se o beneficio tem alguma opcao obrigatoria e esta opcao nao foi preenchida,
  // chamar cadastro de opcoes
  if   ((qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) And
      ((qryBeneficio.FieldbyName('flgObrigaOp1').AsInteger = 1) And (rOpcao1 <= 0)) Or
      ((qryBeneficio.FieldbyName('flgObrigaOp2').AsInteger = 1) And (rOpcao2 <= 0)) Or
      ((qryBeneficio.FieldbyName('flgObrigaOp3').AsInteger = 1) And (rOpcao3 <= 0))) or
      ((qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger >= 1) And
      (((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO1').AsInteger = 1) And (rCampoTexto1 = '')) or
      ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO2').AsInteger = 1) And (rCampoTexto2 = '')) or
      ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO3').AsInteger = 1) And (rCampoTexto3 = '')))
      )
  then begin
     
     If bValidaOpcaoBeneficio
      Then Begin
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT DISTINCT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3');
         qryAux.SQL.Add('WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur));
         qryAux.SQL.Add('  AND IDTITULAR   = ' + IntToStr(iIdTitular));
         qryAux.SQL.Add('  AND IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev));
         qryAux.SQL.Add('  AND SEQPROPOSTA = ' + IntToSTr(iSeqProposta));
         qryAux.SQL.Add('  AND IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);

         Try
           qryAux.Open;
         Except
           On E:EDBEngineError Do
           Begin
              MostrarErro(E);
              Exit;
           End
         End;

         dVlrOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat;
         dVlrOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat;
         dVlrOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat;

         //SOL160185
         sCampoTexto1 :=  qryAux.FieldByName('CAMPOTEXTO1').AsString;
         sCampoTexto2 :=  qryAux.FieldByName('CAMPOTEXTO2').AsString;
         sCampoTexto3 :=  qryAux.FieldByName('CAMPOTEXTO3').AsString;
         //SOL160185


         cAuxSeparador    := DecimalSeparator;
         DecimalSeparator := '.';

         qryAux.SQL.Clear;
         qryAux.SQL.Add('UPDATE BENEFBFCIARIO SET  VALORBASE1 = ' + FormatFloat('#0.00000',dVlrOpcao1) + ',');
         qryAux.SQL.Add('                          VALORBASE2 = ' + FormatFloat('#0.00000',dVlrOpcao2) + ',');
         qryAux.SQL.Add('                          VALORBASE3 = ' + FormatFloat('#0.00000',dVlrOpcao3) + ',');
         //SOL160185
         qryAux.SQL.Add('                          CAMPOTEXTO1 = ' + QuotedStr(sCampoTexto1) + ',');
         qryAux.SQL.Add('                          CAMPOTEXTO2 = ' + QuotedStr(sCampoTexto2) + ',');
         qryAux.SQL.Add('                          CAMPOTEXTO3 = ' + QuotedStr(sCampoTexto3));
         //SOL160185
         qryAux.SQL.Add('WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   );
         qryAux.SQL.Add('  AND IDTITULAR   = ' + IntToStr(iIdTitular)   );
         qryAux.SQL.Add('  AND IDPESSOA    = ' + IntToStr(iIdPessoa)    );
         qryAux.SQL.Add('  AND IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) );
         qryAux.SQL.Add('  AND SEQPROPOSTA = ' + IntToSTr(iSeqProposta) );
         qryAux.SQL.Add('  AND IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);

         DecimalSeparator := cAuxSeparador;
         Try
           qryAux.Open;
         Except
           On E:EDBEngineError Do
           Begin
              MostrarErro(E);
              Exit;
           End
         End;
      End // If bValidaOpcaoBeneficio
      Else Begin
        MsgDlg('Existe opção de benefício obrigatória não informada.','Erro',mtError,[mbOk],0);
        bbtnOpcoesClick(Sender);
      End;
     
  end;

  iIdChamaElegebilidade := 0;
  // Se o usuario nao executou a regra de concessao, executá-la agora
  if not bExecutouRegraConcessao
  then bbtnElegibilidadeClick(Sender);

  // Se o usuario nao executou a regra de concessao, executá-la agora
  if not bConcedeBeneficio   
  then begin
       MsgDlg('A Regra de Elegibilidade nº '+
              qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
              ' NÃO foi satisteita. Verifique. ','Informação',mtInformation,[mbOk],0);
       Abort;
  end;



  if sTipoFormChamador <> 'SI'
  then begin
     iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                          frmCadRequerBenefBfciario.Caption,
                                                          -1,
                                                          -1,
                                                          iIdPlanoPrev,
                                                          -1,
                                                          -1,
                                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                          StrToFloat(ClienteNumero(reValorBeneficio.Text)),
                                                          False); 
     if iIdUsuarioAutoriza < 0
     then begin
        MsgDlg('Requerimento de Benefício não permitido por exceder valor limite e não ter autorização. Verifique. ','Informação',mtInformation,[mbOk],0);
        Abort;
     end;
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

     { Verifica se participante possui migração de plano }
     If PossuiMigracao(qryBeneficiario.fieldbyname('IDTITULAR').AsInteger,
                       qryBeneficiario.fieldbyname('IDPLANOPREV').AsInteger,
                       qry.FieldByName('DTEVENTO').AsString) Then Begin
       sFlgMigrado :=  '1';
     End Else Begin
       sFlgMigrado :=  '0';
     End;

     sSQL := 'SELECT  '+qryBeneficiario.fieldbyname('IDPESSOA').AsString+' AS IDPESSOA ,'+
             ' '+qryBeneficiario.fieldbyname('IDTITULAR').AsString+' AS IDTITULAR ,'+
             ' '+qryBeneficiario.fieldbyname('IDPLANOPREV').AsString+' AS IDPLANOPREV ,'+
             ' '+qryBeneficiario.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO , '+
             ' '+IntToStr(iIdSitPart)  +' AS IDSITPART, '+             
             ' '+IntToStr(iIdSitPlanoPrev)  +' AS IDSITPLANOPREV,   '+ 
             ' '+sFlgFitEspecial+' AS FLGFITESPECIAL, '+sFlgMigrado+' AS FLGMIGRADO ';


     //IDPLANPREVCONTAB
     sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                            sSQL+', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL',
                            bErro, iIdCalculo );


     if bErro then
     begin
        MsgDlg('Erro na regra para atribuição automática de entidade contábil.','Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if  trim(sResult) = '' then
     begin
        MsgDlg('Erro na regra para atribuição automática de entidade contábil. Resultado nulo.','Erro',mtError,[mbOk],0);
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
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de entidade contábil. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;

        qrydet.fieldbyname('IDPLANPREVCONTAB').AsString := trim(sResult);
     end;
     //FIM - IDPLANPREVCONTAB




     //PLACONTAD
     sResult := RegraString( inttostr(prmIdRegraContabBenefIndiv),
                            sSQL+', ''PLACONTAD'' AS CAMPO FROM DUAL',
                            bErro, iIdCalculo );


     if bErro then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para débito.','Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if  trim(sResult) = '' then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para débito. Resultado nulo.','Erro',mtError,[mbOk],0);
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
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para débito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
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
        MsgDlg('Erro na regra para atribuição automática de conta para crédito.','Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Abort;
     end;


     if  trim(sResult) = '' then
     begin
        MsgDlg('Erro na regra para atribuição automática de conta para crédito. Resultado nulo.','Erro',mtError,[mbOk],0);
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
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de conta para crédito. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;


        qrydet.fieldbyname('PLACONTAC').AsString := trim(sResult);
     end;
     //FIM - PLACONTAC


  end;
  


  varFields    := VarArrayCreate([0,1],varVariant);
  varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  varFields[1] := iIdPessoa;

  // Preencher campos ainda nao preenchidos
  if (qryDet.State = dsInsert) and
     (not qryBfciarioTitPlan.Locate('IdBeneficio;IdPessoa',VarFields,[loCaseInsensitive]))
  then begin
     qryBfciarioTitPlan.Insert;
     qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger    := iIdPessoa;   // Estava invertido o IdTitular
     qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger   := iIdTitular;  
     qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
     qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger   := iIdPessJur;
     qryBfciarioTitPlan.FieldByName('IDPLANOORIGEM').AsInteger := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
     qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat    := 0;
     qryBfciarioTitPlan.FieldByName('Percentual').AsFloat    := 100;
     qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdPessoa;
     qryBfciarioTitPlan.Post;
  end; // if state = insert and not locate

  If qryDepentit.State = dsEdit
   Then qryDepentit.Post;

  // Preencher qual é o benefício de referência
  if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
  then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
  else iIdBenefReferencia  := -1;

  // Se necessario, gravar beneficio de referencia
  if qryBeneficio.FieldByName('IdBenefRef').AsInteger > 0
  then GravaBeneficioDeReferencia;

  // Gravar beneficio auxiliar para usar depois os valores dos beneficios
  // e suas opcoes para passar para a regra de calculo dos outros beneficios
  if qryDet.State = dsInsert
  then begin
     qryBenefAux.Insert;
     qryBenefAux.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     qryBenefAux.FieldByName('IDPESSOA').AsInteger       := iIdPessoa;
     qryBenefAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;
     qryBenefAux.FieldByName('NUMORDEMEVENTO').AsInteger := qryBeneficio.FieldbyName('NumOrdemEvento').AsInteger;
     qryBenefAux.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
     qryBenefAux.FieldByName('VALORATUAL').AsFloat       := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat       := rValorCotas;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat       := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat       := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat       := rOpcao3;
     qryBenefAux.FieldByName('CAMPOTEXTO1').AsString     := rCampoTexto1;
     qryBenefAux.FieldByName('CAMPOTEXTO2').AsString     := rCampoTexto2;
     qryBenefAux.FieldByName('CAMPOTEXTO3').AsString     := rCampoTexto3;
     qryBenefAux.FieldByName('FLGPECULIO').AsInteger     := qryBeneficio.FieldbyName('FLGPECULIO').AsInteger;  // edilaine - SOL 253577-18064 / PPM 1240079

     // edilaine - SOL 253577-17374 / PPM 848182 - inicio
     if bFlgApresentaBSFAB then
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSTOTAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));

       qryBenefAux.FieldByName('VLRFABATUAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));

       //edilaine WO18367 : inicio
       qryBenefAux.FieldByName('FABTITULAR').AsFloat    := StrToFloat(ClienteNumero(reVlrFabTit.text));
       qryBenefAux.FieldByName('BSTITULAR').AsFloat     := StrToFloat(ClienteNumero(reVlrBsTit.text));
       if reVlrTotalTit.text <> '' then
          qryBenefAux.FieldByName('VLRTOTALTITULAR').AsFloat := StrToFloat(ClienteNumero(reVlrTotalTit.text))
       else
          qryBenefAux.FieldByName('VLRTOTALTITULAR').Value   := null;
       //edilaine WO18367 : inicio
     end
     else
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').Value := null;
       qryBenefAux.FieldByName('VLRBSTOTAL').Value  := null;
       qryBenefAux.FieldByName('VLRFABATUAL').Value := null;
       qryBenefAux.FieldByName('VLRBSATUAL').Value  := null;

       //edilaine WO18367 : inicio
       qryBenefAux.FieldByName('FABTITULAR').Value    := null;
       qryBenefAux.FieldByName('BSTITULAR').Value     := null;
       qryBenefAux.FieldByName('VLRTOTALTITULAR').Value  := null;
       //edilaine WO18367 : inicio
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
       qryBenefAux.FieldByName('BSDIB').AsFloat  := null;
       qryBenefAux.FieldByName('FABDIB').AsFloat := null;
     end;
     // edilaine - SOL 253577-17374 / PPM 848182 - fim


     qryBenefAux.Post;
     inc(iTotRequeridos);
  end
  else begin
     {qryBenefAux.Edit;
     qryBenefAux.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
     qryBenefAux.FieldByName('VALORATUAL').AsFloat       := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat       := rValorCotas;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat       := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat       := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat       := rOpcao3;
     qryBenefAux.Post;}

      //Vinicius Ferreira

     qryBfciariotitPlanAux.Close;
     qryBfciariotitPlanAux.ParamByName('IdPessoa').Value    := iIdPessoa; // Vinicius Ferreira SOL 163259 Kintana 1392995
     qryBfciariotitPlanAux.ParamByName('IdTitular').Value   := iIdTitular; // Vinicius Ferreira SOL 163259 Kintana 1392995
     qryBfciariotitPlanAux.ParamByName('IdPessJur').Value   := iIdPessJur;
     qryBfciarioTitPlanAux.ParamByName('SeqProposta').AsInteger   := iSeqProposta; // Vinicius Ferreira SOL 164005 Kintana 1405148
     qryBfciariotitPlanAux.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
     qryBfciariotitPlanAux.ParamByName('idbeneficio').Value := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;
     qryBfciariotitPlanAux.Open;

     if qryBfciariotitPlanAux.RecordCount = 0 then begin
          qryBfciariotitPlanAux.Close;
          qryBfciariotitPlanAux.Open;
          qryBfciariotitPlanAux.Insert;
          qryBfciarioTitPlanAux.FieldByName('IdPessoa').AsInteger    := iIdPessoa; // Vinicius Ferreira SOL 163259 Kintana 1392995
          qryBfciarioTitPlanAux.FieldByName('IdTitular').AsInteger   := iIdTitular;
          qryBfciarioTitPlanAux.FieldByName('SeqProposta').AsInteger := iSeqProposta;
          qryBfciarioTitPlanAux.FieldByName('IdPessJur').AsInteger   := iIdPessJur;
          qryBfciarioTitPlanAux.FieldByName('IdPlanoORIGEM').AsInteger := iIdPlanoPrev;
          qryBfciarioTitPlanAux.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
          qryBfciariotitPlanAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;// Vinicius Ferreira
          qryBfciarioTitPlanAux.FieldByName('Prioridade').AsFloat    := 0;
          qryBfciarioTitPlanAux.FieldByName('Percentual').AsFloat    := 100;
          qryBfciarioTitPlanAux.FieldByName('IdResponsavel').AsInteger := iIdTitular;
          //If qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E' Then begin
          //  qryBfciarioTitPlanAux.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;
          //end;
         qryBfciariotitPlanAux.Post;


     end;

     qryBenefAux.Edit;
     if  (sTipoFormChamador <> 'CO') and not(bConfirmaConcessao) then
        qryBenefAux.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)))
     else
        qryBenefAux.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(sValorTotal));


     qryBenefAux.FieldByName('VALORATUAL').AsFloat       := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat       := rValorCotas;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat       := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat       := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat       := rOpcao3;
     qryBenefAux.FieldByName('CAMPOTEXTO1').AsString     := rCampoTexto1;
     qryBenefAux.FieldByName('CAMPOTEXTO2').AsString     := rCampoTexto2;
     qryBenefAux.FieldByName('CAMPOTEXTO3').AsString     := rCampoTexto3;
     qryBenefAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;// Vinicius Ferreira

     // edilaine - SOL 253577-17374 / PPM 848182 - inicio
     if bFlgApresentaBSFAB then
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').AsFloat    := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSTOTAL').AsFloat     := StrToFloat(ClienteNumero(reValorBS.text));

       qryBenefAux.FieldByName('VLRFABATUAL').AsFloat    := StrToFloat(ClienteNumero(reValorFAB.text));
       qryBenefAux.FieldByName('VLRBSATUAL').AsFloat     := StrToFloat(ClienteNumero(reValorBS.text));

       //edilaine WO18367 : inicio
       qryBenefAux.FieldByName('FABTITULAR').AsFloat    := StrToFloat(ClienteNumero(reVlrFabTit.text));
       qryBenefAux.FieldByName('BSTITULAR').AsFloat     := StrToFloat(ClienteNumero(reVlrBsTit.text));
       if reVlrTotalTit.text <> '' then
          qryBenefAux.FieldByName('VLRTOTALTITULAR').AsFloat  := StrToFloat(ClienteNumero(reVlrTotalTit.text))
       else
          qryBenefAux.FieldByName('VLRTOTALTITULAR').Value  := null;
       //edilaine WO18367 : inicio
     end
     else
     begin
       qryBenefAux.FieldByName('VLRFABTOTAL').Value := null;
       qryBenefAux.FieldByName('VLRBSTOTAL').Value  := null;
       qryBenefAux.FieldByName('VLRFABATUAL').Value := null;
       qryBenefAux.FieldByName('VLRBSATUAL').Value  := null;

       //edilaine WO18367 : inicio
       qryBenefAux.FieldByName('FABTITULAR').Value    := null;
       qryBenefAux.FieldByName('BSTITULAR').Value     := null;
       qryBenefAux.FieldByName('VLRTOTALTITULAR').Value  := null;
       //edilaine WO18367 : inicio
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

     qryBenefAux.Post;

  end;

  // Grava RELBENEFPART - Dados para o Relatório de Demonstrativo de Benefício
  if iIdCalculo > 0
  then begin

     if not qryRelBenefPart.active then
     begin
        with qryRelBenefPart   do
        begin
           Close;
           ParamByName('IdPessoa').Value       := iIdPessoa;
           ParamByName('IdTitular').Value      := iIdTitular;
           ParamByName('SeqProposta').Value    := iSeqProposta;
           ParamByName('IdPessJur').Value      := iIdPessJur;
           ParamByName('IdPlanoPrev').Value    := iIdPlanoPrev;
           ParamByName('NumeroProcesso').Value := iNumeroProcesso;
           Open;
        end;
     end;


     if qryDet.State = dsInsert
     then qryRelBenefPart.Insert
     else qryRelBenefPart.Edit;

     qryRelBenefPart.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
     qryRelBenefPart.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
     qryRelBenefPart.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
     qryRelBenefPart.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     qryRelBenefPart.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
     qryRelBenefPart.FieldByName('IDPESSOA').AsInteger       := iIdPessoa;
     qryRelBenefPart.FieldByName('IDCALCULO').AsInteger      := iIdCalculo;
     qryRelBenefPart.FieldByName('SEQPROPOSTA').AsInteger    := iSeqProposta;
     qryRelBenefPart.FieldByName('DATACALCULO').AsDateTime   := StrToDate(dtInicioFund.Text);
     qryRelBenefPart.FieldByName('FLGRECALCULO').AsInteger   := 0;
     qryRelBenefPart.Post;

  end;

  qryDet.FieldByName('VALORTOTAL').AsFloat := StrToFloat(ClienteNumero(sValorTotal));

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  if qryDet.State in [dsInsert, dsEdit] then
  begin
    if bFlgApresentaBSFAB then
    begin
      qryDet.FieldByName('VLRFABTOTAL').AsFloat := StrToFloat(ClienteNumero(reValorFAB.text));
      qryDet.FieldByName('VLRBSTOTAL').AsFloat  := StrToFloat(ClienteNumero(reValorBS.text));
      qryDet.FieldByName('VLRFABATUAL').AsFloat := StrToFloat(ClienteNumero(reValorFABAtu.text));
      qryDet.FieldByName('VLRBSATUAL').AsFloat  := StrToFloat(ClienteNumero(reValorBSAtu.text));

      //edilaine WO18367 : inicio
      qryDet.FieldByName('FABTITULAR').AsFloat    := StrToFloat(ClienteNumero(reVlrFabTit.text));
      qryDet.FieldByName('BSTITULAR').AsFloat     := StrToFloat(ClienteNumero(reVlrBsTit.text));
      if reVlrTotalTit.text <> '' then
         qryDet.FieldByName('VLRTOTALTITULAR').AsFloat  := StrToFloat(ClienteNumero(reVlrTotalTit.text))
      else
         qryDet.FieldByName('VLRTOTALTITULAR').Value  := null;
      //edilaine WO18367 : inicio
    end
    else
    begin
      qryDet.FieldByName('VLRFABTOTAL').Value   := null;
      qryDet.FieldByName('VLRBSTOTAL').Value    := null;
      qryDet.FieldByName('VLRFABATUAL').Value   := null;
      qryDet.FieldByName('VLRBSATUAL').Value    := null;

      //edilaine WO18367 : inicio
      qryDet.FieldByName('FABTITULAR').Value    := null;
      qryDet.FieldByName('BSTITULAR').Value     := null;
      qryDet.FieldByName('VLRTOTALTITULAR').Value  := null;
      //edilaine WO18367 : inicio
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

  // Verifica se todos beneficiarios já estão cadastrados no beneficio
  if iTotRequeridos = qryBeneficiario.RecordCount
  then begin
     MsgDlg('Requerimento de '+lblNomeBenef.caption+' concluído com sucesso ! '+
            'Selecione novo benefício e os beneficiários que tenham direito',

            'Informação',mtInformation,[mbOk],0);

     // Atualizar a reserva part com os valores  movimentados da reserva
     // para que o proximo beneficio já tenha seu valor atualizado
     if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) and
        (not AtualizaReservaPart(qryBeneficio.FieldByName('IdBeneficio').AsInteger))
     then begin
        MsgDlg('Ocorreu um erro na atualização do valor da reserva do participante. ',
               'Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Abort;
     end;

     dblkpcmbBeneficio.Enabled := True;
     btn_SelecionaBeneficios.enabled := True;
     dtDataRequerimento.Enabled      := False;
     dblkpcmbBeneficiario.enabled    := False;
     dbeMatriculaBenef.Enabled       := False;
     dbedNumProcINSS.enabled         := False;
     dtInicioINSS.enabled            := False;
     dtInicioFund.enabled            := False;
     reValorCalcInss.enabled         := False;
     reValorInfINSS.enabled          := False;
     reValorBeneficio.Enabled        := False;
     reValorTotal.Enabled            := False;
     dtDataInicio.enabled            := False;
     dtDataFinal.enabled             := False;
     dblkcmbTpPgtoBenef.enabled      := False;
     dblkpcmbPortForma.enabled       := False;

     iTotRequeridos                  := 0;
     if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then dblkpcmbBeneficio.SetFocus;
  end
  else begin
     qrybeneficio1.Close;
     qrybeneficio1.SQL.Clear;
     qrybeneficio1.SQL.Add('SELECT B.IDBENEFICIO, B.NOME '+
                           'FROM BENEFICIO B '+
                           'WHERE B.IDBENEFICIO = :IDBENEFICIO');
     qrybeneficio1.ParamByName('IDBENEFICIO').AsInteger := idbeneficioselecionado;
     qrybeneficio1.Open;
     btn_SelecionaBeneficios.enabled := false;

     dblkpcmbBeneficio.Text := qrybeneficio1.FieldByName('Nome').AsString;

     bbtnOpcoes.Visible := ( qryBeneficio.FieldbyName('FLGACEITAOPCAO').AsInteger = 1 ) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);


     // Verificar se este benefício já foi requerido para algum beneficiário
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 '+
                 ' AND    BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso));
     qryAux.Open;
     if not qryAux.IsEmpty
     then begin
         if MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
                   ' e está pendente de concessão. '+
                   'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'. Deseja continuar ?',
                   'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
         then begin
            qryAux.Close;
            dblkpcmbBeneficio.Text := '';
            if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
            dblkpcmbBeneficio.SetFocus;
            Exit;
         end;
     end; 

     lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

     if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible)
     then dtDataRequerimento.SetFocus;
  end;

  // edilaine - SOL 262938 /  PPM 1099698 - inicio
  if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) and (dblkpcmbBeneficio.Text <> '') then
  begin
    bFlgApresentaDeficit := (qryBeneficio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
    bFlgApresentaBSFAB   := (qryBeneficio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);

    AjustaTela();
  end;
  // edilaine - SOL 262938 /  PPM 1099698 - fim

  bbtnConfirmar.enabled := true;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := true;    // edilaine - SOL 253577-18129 / PPM 1303078
end;

procedure TfrmCadRequerBenefBfciario.bbtnElegibilidadeClick(
  Sender: TObject);
var bErro : boolean;
    sMsgErro : string;
begin
  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
    if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
    dblkpcmbBeneficio.SetFocus;
    Exit;
  end;

  bExecutouRegraConcessao := True;

  // Se for simulacao nao executar regra de elegibilidade
  if sTipoFormChamador = 'SI'
  then begin
    bConcedeBeneficio       := True;
    bExecutouRegraConcessao := True;
    Exit;
  end;

  if (Trim(qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString) = '') or
     (qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger <= 0) then
  begin
    bConcedeBeneficio := True;
  end
  else
  begin
     frmAguarde.Mostra( 'Regra de Elegibilidade - Nº ' +
                        qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString );

     Try
       bConcedeBeneficio := ExecutaRegraElegibilidade(qryAux,
                                                      qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger,
                                                      iIdPessJur, iIdPlanoPrev, iIdTitular,//AQUI PASSAR O ID DO TITULAR
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
                                                      iNumBenef,
                                                      0,
                                                      bErro,
                                                      sMsgErro,
                                                      0,  // Andre Imakawa - SIG 103584
                                                      qryDet.FieldByName('IdPessoa').AsInteger, // Andre Imakawa - SIG 103584
                                                      iIdChamaElegebilidade
                                                      );
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
        if not bConcedeBeneficio
        then  MsgDlg('A Regra de Elegibilidade nº '+
                     qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
                     ' NÃO foi satisteita. Verifique. ','Informação',mtInformation,[mbOk],0)
        else MsgDlg('A Regra de Elegibilidade nº '+
                     qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
                     ' foi satisteita. ','Informação',mtInformation,[mbOk],0);
     end;
  end;
end;

procedure TfrmCadRequerBenefBfciario.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;

  
  
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3  FROM BENEFBFCIARIO ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.IsEmpty then
  begin

  end
  else
  begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;

      If qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
         Then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
      Else rCampoTexto1 := '';

      If qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
         Then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
      Else rCampoTexto2 := '';

      If qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
         Then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
      Else rCampoTexto3 := '';
  end;

  ValidaTitular; // Fanuel Junior SOl148463
  bPodeAlterarOpcoes := True;

  iIdCalculoGeral := iIdCalculo; { Passar IDCALCULO para opçoes }

  if not qryAux.IsEmpty then
  begin // Opcoes já cadastradas
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
                                 reValorCalcINSS.Text,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sFlgInternoAntes,
                                 sFlgInternoDepois,
                                 sIdSitPartAntes,
                                 sIdSitPlanAntes,
                                 sIdSitFuncAntes,
                                 sIdSitPartDepois,
                                 sIdSitPlanDepois,
                                 sIdSitFuncDepois);
     frmCadOpcoesBenef.Free;
  end
  else
  begin // Cadastrar Opcoes
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
                                 sIdSitFuncDepois  );

     frmCadOpcoesBenef.Free;
  end;

  iIdCalculo := iIdCalculoGeral; { Receber IDCALCULO das opçoes }

  // SOL 164340 Kintana 1468711
  if (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) and
     not(bOpcoesExistem) then
  begin
     qryDet.FieldByName('VALORBASE1').Asstring := FormatFloat('#0.00000',rOpcao1);
     qryDet.FieldByName('VALORBASE2').Asstring := FormatFloat('#0.00000',rOpcao2);
     qryDet.FieldByName('VALORBASE3').Asstring := FormatFloat('#0.00000',rOpcao3);
     //Inicio - SOL160185
     qryDet.FieldByName('CAMPOTEXTO1').Asstring := rCampoTexto1;
     qryDet.FieldByName('CAMPOTEXTO2').Asstring := rCampoTexto2;
     qryDet.FieldByName('CAMPOTEXTO3').Asstring := rCampoTexto3;
     //FIM - SOL160185

  end  // SOL 164340 Kintana 1468711
  else
  // Gravar Opcoes do participante na BenefPlanoPart
  if (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) and
     (bOpcoesExistem) then 
  begin // Opcoes ainda nao existiam



     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET  VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1)  + ',' +
                    '                           VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2)  + ',' +
                    '                           VALORBASE3 = ' + FormatFloat('#0.00000', rOpcao3) + ',' +
                    '                           CAMPOTEXTO1 = ' +  QuotedStr(rCampoTexto1)        + ',' +
                    '                           CAMPOTEXTO2 = ' +  QuotedStr(rCampoTexto2)        + ',' +
                    '                           CAMPOTEXTO3 = ' +  QuotedStr(rCampoTexto3)        +
                    ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   + ' AND ' +
                    '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                    '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
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

    
    If (Not bValidaOpcaoBeneficio) And
       (MsgDlg('As opções informadas são idênticas para todos os beneficiários deste benefício?','Confirmação',
               mtConfirmation,[mbYes,mbNo],0) = mrYes)
     Then bValidaOpcaoBeneficio := True;



  end;
end;

procedure TfrmCadRequerBenefBfciario.sbtnConcedeUmClick(Sender: TObject);
var iIdSitBenef, iIdSitTemp : integer;
    bSituacoesDiferentes    : boolean;
begin
  // Se estiver em insercao ou edicao, nao permitir concessao
  // Andre Imakawa - SIG 103584 - Inicio
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioConcessao := qryAux.fieldByName('datenow').AsString;
  // Andre Imakawa - SIG 103584 - Fim
  
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

  // Atualizar query de conta bancaria
  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;

  if not qryBeneficio.Active
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qry.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end;
  // Andre Imakawa - SIG 103584 - Inicio
  if (sistema.idmodulo <> 454) then
  begin
    If frmPedeBenefExigencia = Nil Then
      Application.CreateForm(TfrmPedeBenefExigencia, frmPedeBenefExigencia);
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
         'E' : iIdSitBenef := 7;
         'P' : iIdSitBenef := 4;
       else iIdSitBenef :=  1;
       end; //case
    end;//with
  end
  else
  begin
    iIdSitBenef := 1;
  end;
  // Andre Imakawa - SIG 103584 - Fim


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

        If (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3) Then
        Begin
          qryDet.Next;
          Continue;
        End;

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
        TiraSQL(qryAux);
     end
     else begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
        qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
        qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitTemp];
     end;
  end; // else - if RecordCount = 1

  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qryDetDescricao.AsString; // SOL 221079
  Refresh;
  sbtnConcedeUm.Down := False;
  MsgDlg('Benefício concedido com sucesso.', 'Informação',mtInformation,[mbOk, mbHelp],0);
  TiraSQL(qryAux);
end;

procedure TfrmCadRequerBenefBfciario.dsStateChange(Sender: TObject);
begin
  inherited;
  if sTipoFormChamador = 'CO'
  then sbtnConcedeUm.Enabled    := (ds.DataSet.State = dsEdit);
end;

procedure TfrmCadRequerBenefBfciario.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if sTipoFormChamador = 'CO'
  then sbtnConcedeUm.Enabled    := not (ds.DataSet.State in [dsInsert,dsEdit]);

end;

procedure TfrmCadRequerBenefBfciario.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryBeneficio.Active
  then begin
     if not qryDet.Active
     then Exit
     else lblNomeBenef.Caption := qryDet.FieldByName('Nome').AsString;
  end
  else lblNomeBenef.Caption := qryBeneficio.FieldByName('Nome').AsString;
  if qryDet.Active
  then begin
     rOpcao1 := qryDet.FieldByName('VALORBASE1').AsFloat;
     rOpcao2 := qryDet.FieldByName('VALORBASE2').AsFloat;
     rOpcao3 := qryDet.FieldByName('VALORBASE3').AsFloat;
     rCampoTexto1 := qryDet.FieldByName('CAMPOTEXTO1').AsString;
     rCampoTexto2 := qryDet.FieldByName('CAMPOTEXTO2').AsString;
     rCampoTexto3 := qryDet.FieldByName('CAMPOTEXTO3').AsString;
  end;

  if  (sTipoFormChamador <> 'CO') then
      reValorTotal.Text        := qryDet.FieldByName('VALORTOTAL').AsString
  else

  reValorTotal.Text        := qryDet.FieldByName('VALORTOTAL').AsString;
  reValorCalcInss.Text     := qryDet.FieldByName('VLRCALCINSS').AsString;
  reValorInfInss.Text      := qryDet.FieldByName('VLRINFINSS').AsString;
  reValorSRB.Text          := qryDet.FieldByName('VALORSRB').AsString;

  if (qryBeneficio.Active) and (qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1)
  then reValorBeneficio.Text := qryDet.FieldByName('ValorCotas').AsString
  else reValorBeneficio.Text := qryDet.FieldByName('ValorAtual').AsString;

  rValorCotas := qryDet.FieldByName('ValorCotas').AsFloat;
  rValorReal  := qryDet.FieldByName('ValorAtual').AsFloat;

  if qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
  then begin
  
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
    pnlBenefProv.width    := 148;   // edilaine - SOL 253577-17374 / PPM 848182
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
    pnlBenefProv.width    := 388;   // edilaine - SOL 253577-17374 / PPM 848182
  end;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';
     pnlNaoBenefProv.Visible := False;
     pnlBenefProv.Visible    := True;

  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';  
     pnlNaoBenefProv.Visible := True;
     pnlBenefProv.Visible    := True;

  end;

  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('idPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiario.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;
end;

procedure TfrmCadRequerBenefBfciario.sbtnApagarClick(Sender: TObject);
begin
  if MsgDlg(' Esta operação não irá desfazer o evento '+qryEvento.FieldByName('Nome').AsString+'.'+
            ' Para desfazer o evento, utilize a função "Cancelar Evento Registrado". '+
            ' Deseja continuar exclusão do processo ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
  then begin
     sbtnApagar.Down := False;
     Exit;
  end;

  if (qry.FieldByName('IdSitProcesso').AsInteger <> 4) and // pendente
     (qry.FieldByName('IdSitProcesso').AsInteger <> 6) and // nao concedido
     (qry.FieldByName('IdSitProcesso').AsInteger <> 7)     // concedido em exigencia
  then begin
    MsgDlg(' Este processo não pode ser excluído. ','Informação',mtInformation,[mbOk],0);
    sbtnApagar.Down := False;
    Exit;
  end;

  // Se estiver deletando um processo ainda Pendente, ou concedido em exigencia
  // o sistema tem que devolver a reserva
  if (qry.FieldByName('IdSitProcesso').AsInteger = 4) or // pendente
     (qry.FieldByName('IdSitProcesso').AsInteger = 7) then     // concedido em exigencia
  begin
    frmAguarde.Mostra('Verificando saldo de reservas ... ');

    qryDet.DisableControls;
    qryDet.First;
    while not qryDet.Eof do
    begin
      if qryDet.FieldByName('FlgResgate').AsString = '1' then
      begin
        if not DevolveReserva( qryDet.FieldByName('IdBeneficio').AsInteger,
                               qryDet.FieldByName('IdPessoa').AsInteger) then
        begin
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

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if (sTipoFormChamador = 'MA') then
  begin
    if not DesfazRequerimentos(qryAux, qry.FieldByName('NumeroProcesso').AsString, qryDet.IsEmpty) then  //TAES - SIG99559
    begin
      MsgDlg('Erro ao desfazer requerimento. ','Informação',mtInformation,[mbOk],0);
      sbtnApagar.Down := False;
      Exit;
    end;
  end;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  DeleteLogPreparoTaxa(qryDet.FieldByName('NumeroProcesso').AsString,
                       qryDet.FieldByName('IdPessoa').AsString,
                       qryDet.FieldByName('IdTitular').AsString,
                       qryDet.FieldByName('IdBeneficio').AsString,
                       qryDet.FieldByName('IdPlanoPrev').AsString
                       );  //edilaine - SOL 253577-17464 / PPM 955703

  inherited;

   bApagaProcesso := true;    // edilaine - SOL 253577-18129 / PPM 1303078

end;

//edilaine - SOL 253577-17464 / PPM 955703
function TfrmCadRequerBenefBfciario.DeleteLogPreparoTaxa(
  pNumeroProcesso, pIdPessoa, pIdTitular, pIdBeneficio, pIdPlanoprev  : string): boolean;
begin
   Result := true;
   with Tquery.Create(Self) do
   begin
      databasename := 'basedados';
      SQL.Add(' DELETE FROM LOGPREPAROTAXA LPT  WHERE LPT.NUMEROPROCESSO = '+pNumeroProcesso +
              '  AND   LPT.IDBENEFICIO   = '+ pIdBeneficio +
              '  AND   LPT.IDPESSOA      = '+ pIdPessoa +
              '  AND   LPT.IDTITULAR     = '+ pIdTitular +
              '  AND   LPT.IDPLANOPREV   = '+ pIdPlanoprev );
      try
         ExecSQL;
      except
         Result := false;
      end;
   end;
end;

procedure TfrmCadRequerBenefBfciario.sbtnAlterarClick(Sender: TObject);
begin
   bApagaProcesso := false;   // edilaine - SOL 253577-18129 / PPM 1303078

   If bFlgBenefMorte
    Then Begin
      If qry.State <> dsEdit
       Then qry.Edit;
      qry.FieldByName('IdSitProcesso').AsInteger := 4;
      qry.Post;
    End;
   if (qry.FieldByName('IdSitProcesso').AsInteger <> 4) and  // Pendente de Concessao
      (qry.FieldByName('IdSitProcesso').AsInteger <> 8) and  // Simulacao
      (sTipoFormChamador <> 'MA')
   then begin
     MsgDlg(' Este processo não pode ser alterado. ','Informação',mtInformation,[mbOk],0);
     bbtnCancelarClick(frmCadRequerBenefBfciario);
     Exit;
   end;
  inherited;
end;

procedure TfrmCadRequerBenefBfciario.dtInicioFundExit(Sender: TObject);
begin
  inherited;
  if (Trim(dtDataInicio.Text) = '') and (Trim(dtInicioFund.Text) <> '')
  then begin
     qryDet.FieldByName('DataInicio').AsDateTime := StrToDate(dtDataInicio.Text);
     dtDataInicio.Date := dtInicioFund.Date;
  end;
  // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
  // nem que a data do evento
  if (Trim(dtInicioFund.Text) <> '') and
     (Trim(dtInicioINSS.Text) <> '') and
     (dtInicioFund.Date < dtInicioINSS.Date)  
  then begin
     MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data de Início no INSS. ',
            'Informação',mtInformation,[mbOk],0);
     dtInicioFund.SetFocus;
     Exit;
  end;

  if (Trim(dtInicioFund.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtInicioFund.Date < dtDataEvento.Date)
  then begin
     MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtInicioFund.SetFocus;
     Exit;
  end;

  //edilaine WO18367 : inicio
  if (Trim(dtInicioFund.Text) <> '') and (rePercPensao.visible) then
     CalculaPercentualPensao();
  //edilaine WO18367 : fim
end;

procedure TfrmCadRequerBenefBfciario.dtDataInicioExit(Sender: TObject);
begin
  inherited;
  if Trim(dtInicioFund.Text) = ''
  then dtInicioFund.Date := dtDataInicio.Date;

  // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
  // nem que a data do evento
  if (Trim(dtDataInicio.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtDataInicio.Date < dtDataEvento.Date)  
  then begin
     MsgDlg('A Data de Início do Pagamento não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtDataInicio.SetFocus;
     Exit;
  end;
  sDataInicioPagto := Trim(dtDataInicio.Text);

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

procedure TfrmCadRequerBenefBfciario.bbtnConfirmarClick(Sender: TObject);
var bOk : boolean;
    sMesAtraso: string;
    sDataInicioContrib : string; 

    cAuxSeparador : char;
    dVlrOpcao1,
    dVlrOpcao2,
    dVlrOpcao3    : Double;

    dCorrecaoMonetaria : Currency;  // SOL 132938
    sAnoMesAtual, sAnoMesFim   : String;      // SOL 132938
    iNumRecebimento,  iIdContribuicao : INTEGER; // SOL 132938
    bAlteradorBua : boolean ;     // SOL 132938
    sNomeParticipante, sNomePatro, sNomePlano, sMsgErro : string;    // edilaine - SOL 253577-18094 / PPM 1269549
    bPossuiIDTPPAGTOBENEFIC : boolean ; // Andre Imakawa - SIG 50047
begin
  sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);

  bAlteradorBua := false; // SOL 132938

  iIdPessoa                  := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;
  if qryDet.State in [dsInsert,dsEdit]   then
  begin
     if Msg <> '' then
     begin
        MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
        exit;
     end
     else
     begin
        // SOL 141078 KINTANA 888253
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT FLGCONTAPREF FROM CM.CONTABANCARIA  '+
                   ' WHERE  FLGCONTAPREF = 1 '+
                   ' AND   (IDPESSOA        = '+inttostr(iIdPessoa)   +')');
           Open;
           if IsEmpty
           then begin
              Msg := 'Conta preferencial não cadastrada!';
           end;

           Close;
           SQL.Clear;
           SQL.Add(' SELECT NUMDOCUMENTO FROM CM.PESSOA  '+
                   ' WHERE  NUMDOCUMENTO IS NOT NULL '+
                   ' AND   (IDPESSOA        = '+inttostr(iIdPessoa)   +')');
           Open;
           if IsEmpty
           then begin
              if Msg <> '' then
                 Msg := Msg + chr(13) + 'Participante/Pensionita sem CPF cadastrado!'
              else
                 Msg := 'Participante/Pensionita sem CPF cadastrado!';
           end;

           Close;
           SQL.Clear;
           SQL.Add(' SELECT FLGISENTOIRRF FROM CM.PESSOAFISICA  '+
                   ' WHERE  FLGISENTOIRRF IS NOT NULL '+
                   ' AND   (IDPESSOA        = '+inttostr(iIdPessoa)   +')');
           Open;
           if IsEmpty
           then begin
              if Msg <> '' then
                 Msg := Msg + chr(13) + 'Participante/Pensionista sem Opção de Imposto de Renda!'
              else
                 Msg := 'Participante/Pensionista sem Opção de Imposto de Renda!';
           end;

          //Renato Visoni SOL 155058 Kintana 1197225
          if Msg <> '' then begin
            MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
            exit;
          end;
          //Renato Visoni SOL 155058 Kintana 1197225
        end;
        // SOL 141078 KINTANA 888253
     end;
  end;

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
     if not(bApagaProcesso)  then      // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
     begin
       if (sTipoFormChamador = 'MA') then
       begin
         if not DesfazRequerimentos(qryAux, qry.FieldByName('NumeroProcesso').AsString, qryDet.IsEmpty) then //TAES - SIG99559
         begin
           MsgDlg('Erro ao desfazer requerimento. ','Informação',mtInformation,[mbOk],0);
           Exit;
         end
         else
         begin
           //SIG90571 - TAES
           {try
             if qryDet.UpdatesPending then
                qryDet.ApplyUpdates;
           except

           end;}
           //SIG90571 - TAES


           if dtmBaseDados.dbBaseDados.InTransaction   then
              dtmBaseDados.dbBaseDados.Commit;
           SelecionaProcesso(-1);
           ConfiguraAcessosTela(ctDesfazRequerimento);
           exit;
         end;
       end
       else
       begin
         MsgDlg('O Processo deve conter ao menos um benefício.','Erro',mtError,[mbOk],0);
         Abort;
       end;
     end
     else
     begin
       Inherited;
       DeleteProcessoBenef(IntToStr(iNumeroProcesso));
       DeletaBfciarioTitPlan(iNumeroProcesso);
       if dtmBaseDados.dbBaseDados.InTransaction   then
          dtmBaseDados.dbBaseDados.Commit;
       exit;
     end;
     // edilaine - SOL 253577-18129 / PPM 1303078 - fim
  end;

  with qryAux do
  begin
     Close;
     SQL.Clear;

     SQL.Add(' SELECT COUNT(DISTINCT BF.IDPESSOA)  AS NUMBENEF '+
             ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP       '+
             ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
             ' AND    ((BF.IDSITBENEFICIO = 1) OR (BF.IDSITBENEFICIO = 4)) '+
             ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
             ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
             ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
             );
     Open;
     if IsEmpty
     then iNumBenef := 1
     else iNumBenef := FieldByName('NUMBENEF').AsInteger;
  end;

  // Verificar consistencia de no de dependentes para IRRF e SalarioFamilia
  if not VerificaNumeroDependentes then Exit;

  // Verificar se existe  algum benefício obrigatorio no evento que não foi
  // requerido
  if not VerificaBeneficioObrigatorio then Exit;

  // Verificar se existem beneficios com o mesmo numero de ordem no mesmo
  // requerimento
  if not VerificaBeneficioRepetido then Exit;

  If sTipoFormChamador = 'EV' Then
    VerificaEvolucaoPensionista;


  // Se está em edicao, e concedeu o beneficio, preparar contribuicoes
  if (qry.State = dsEdit) and (bConcedeuBeneficio)
  then begin

     bCobraContribAtrasada := False;


     if qryBeneficio.FieldByName('FLGACEITAACERTO').AsInteger = 1 then
     //verifica se os acertos devem ser cobrados no benefício do beneficiário
     begin
        // Verificar se participante tem contribuicoes atrasadas
        if VerificaContribAtrasada(sMesAtraso)
        then begin
           if qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsInteger = 0
           then begin
              if MsgDlg('Este participante possui contribuições atrasadas desde '+sMesAtraso+'. '+
                        'Deseja cobrar estas contribuições na Folha de Benefícios ? ',
                        'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
              then begin
                 bCobraContribAtrasada := False;
                 if MsgDlg('Deseja continuar a concessão do benefício ? ' ,
                        'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
                 then begin
                    TiraSQL(qryAux);
                    Exit;
                 end;
              end
              else bCobraContribAtrasada := True;
           end
           else begin
              MsgDlg('Este participante possui contribuições atrasadas desde '+sMesAtraso+' e '+
                     'o benefício selecionado OBRIGA QUITAR as dívidas previdenciárias. '+
                     'Verifique.','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Exit;
           end;
        end;
     end;

     if not dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;


     bOK := True;

     // Se o parametro prmFLGENVACERTOFALEC = True
     // Entao verificar se ficou algum acerto lançado para o proprio participante
     //       e que não tenha sido processado pela folha. Se sim, entao
     //       jogar esses acertos para o idmotivo = prmIdMotDevolNaoIden
     if bOK and prmFLGENVACERTOFALEC
     then begin
        bOK := False;
        bOK := VerificaAcertosFalecido( iNumeroProcesso,
                                        qryDet.FieldByName('IdPessJur').AsInteger,
                                        qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                        qryDet.FieldByName('IdTitular').AsInteger,
                                        qryDet.FieldByName('SeqProposta').AsInteger,
                                        iIdLoteConcessao,
                                        FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                        sDataPagamentoConcessao  );
        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação dos acertos lançados para o participante falecido. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;

     // Verificar beneficios POS-MORTE, ou seja, os beneficios que já foram pagos ao
     // participante com data posterior a data da morte do mesmo
     // Estes beneficios devem ser descontados dos beneficiarios
     if bOK
     then begin
        bOK := False;
        bOK := TrataBeneficioPosMorte( iNumeroProcesso,
                                       qryDet.FieldByName('IdPessJur').AsInteger,
                                       qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                       qryDet.FieldByName('IdTitular').AsInteger,
                                       qryDet.FieldByName('SeqProposta').AsInteger,
                                       prmIdMotivoFolhaBen,
                                       iNumBenef, iIdLoteConcessao,
                                       FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                       sDataPagamentoConcessao,
                                       -1,
                                       sIdBeneficiarioEncerrado
                                     );


        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação/tratamento de benefício pós-morte. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

     end;



     if bOK
     then begin
        bOK := False;
        bOK := TrataAtrasoDevolContribPosMorte( iNumeroProcesso,
                                          qryDet.FieldByName('IdPessJur').AsInteger,
                                          qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                          qryDet.FieldByName('IdTitular').AsInteger,
                                          qryDet.FieldByName('IdPessoa').AsInteger, //William Moreira da Silva - SOL 213329
                                          qryDet.FieldByName('SeqProposta').AsInteger,
                                          prmIdMotivoFolhaBen,
                                          iNumBenef, iIdLoteConcessao,
                                          FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                          sDataPagamentoConcessao,
                                          sIdBeneficiarioEncerrado
                                          );

        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação/tratamento de contribuição pós-morte. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;


     if bOk
     then begin
        bOK := AtualizaSitParticipante( qryDet.FieldByName('IDPESSJUR').AsInteger,
                                        qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                        qryDet.FieldByName('IDTITULAR').AsInteger,
                                        qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                        qryEvento.FieldByName('IDEVENTOGERADOR').AsInteger );
        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao atualizar situações do beneficiário, verificar Eventos. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;



     //grava o mvimento na MOVBENEF
     sDataInicioContrib := '';
     qryDet.First;
     while not qryDet.Eof do
     begin

        // Se beneficio não foi concedido, não gravar logocorrencia
        if qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 4 // pendente de concessao
        then begin
           qryDet.Next;
           continue;
        end;


        // Preencher a variavel sDataInicioContrib com a menor data de inicio dos
        // beneficios concedidos
        if sDataInicioContrib = ''
        then sDataInicioContrib := qryDet.FieldByName('DataInicio').AsString
        else if StrToDate(qryDet.FieldByName('DataInicio').AsString) < StrToDate(sDataInicioContrib)
             then sDataInicioContrib := qryDet.FieldByName('DataInicio').AsString;


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
                             qryDet.FieldByName('DataFinal').AsString,
                             qryDet.FieldByName('ValorAtual').AsString,
                             qryDet.FieldByName('DataInicio').AsString,
                             qryDet.FieldByName('DataFinal').AsString,
                             '4',
                             qryDet.FieldByName('FlgDataPrevista').AsInteger,
                             qryAux, '',
                             iIdLoteConcessao,
                             iIdCalculo,
                             False,
                             qryDet.FieldByName('USUARIOALT').AsInteger,
                             iFlgEmprestimo,
                             false,                                             //edilaine WO18367
                             qryDet.FieldByName('BSTitular').AsString,          //edilaine WO18367
                             qryDet.FieldByName('FABTitular').AsString,         //edilaine WO18367
                             qryDet.FieldByName('VlrTotalTitular').AsString     //edilaine WO18367
                             );
        except
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

        qryDet.Next;
     end;


     if Trim(sDataInicioContrib) = '' then sDataInicioContrib := sDataEvento;

     //William Moreira da Silva - SOL 237944 KINTANA 497587
     qryDet.first;
     while (not qryDet.eof) do
     begin
       //verifica o cadastro e não a forma de pgto do benefício
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA '+
                     ' FROM   TPPAGTOBENEFICIO T   '+
                     ' WHERE  T.IDTPPAGTOBENEFIC = '+IntToStr(qrydet.FieldByName('IdTpPagtoBenefic').AsInteger));
       qryAux.Open;

       if(qryAux.FieldByName('FlgFrequencia').AsString <> 'U') then
       begin
            break;
       end;
       qryDet.next;
     end;
     //William Moreira da Silva - SOL 237944 KINTANA 497587


     // edilaine - SOL 253577-17464 / PPM 955703 - inicio

     if ExecutaSP_PreparoContribuicao(iNumeroProcesso,
                                          iIdTitular,
                                          prmIdMotivoContrib,
                                          iIdLoteConcessao,
                                          DbLAlterador.Text, sAnoMesLoteConcessao,
                                          '', //Helio - SOL Nº 253577/17666 PPM Nº 1019935 //FormatDateTime('yyyy/mm', dtDataEvento.Date)
                                          -1,    // edilaine - SOL 253577-18070  PPM 1240812 - inicio
                                          -1,
                                          6     // edilaine - SOL 253577-18070  PPM 1240812 - fim
                                         )
     then begin
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk],0);
        Exit;
     end;


     // comentar aqui depois
     {
     if qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3 then
     begin
       if not GeraContribBenef(QryLoop, QryContribProc, QryAux,
                               StrConcedidos,
                               iNumeroProcesso,
                               iIdLoteConcessao,
                               sAnoMesLoteConcessao,
                               sDataEvento,
                               Copy(sDataInicioContrib,7,4)+'/'+Copy(sDataInicioContrib,4,2),
                               '',
                               -1,
                               '',
                               2
                               //BRUNO AZEVEDO SOL 164519 KINTANA 1412858 - FOI PERDIDO NO MERGE, COLOQUEI NOVAMENTE
                               //Renato Visoni SOL 157416 Kintana 1259334
                               ,''
                               ,''
                               ,''
                               ,False
                               ,qryDet.FieldByName('IDSITBENEFICIO').AsInteger //Renato Visoni SOL 157416 Kintana 1259334 // SOL 232043 PPM 396781 Correção de um outro problema referente a taxa feito neste SOL
                               ,-1//BRUNO AZEVEDO SOL 164519 KINTANA 1412858 - FOI PERDIDO NO MERGE, COLOQUEI NOVAMENTE
                               ,-1
                               )

       then begin
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk],0);
          TiraSQL(qryAux);
          Exit;
       end;
     end
     else
     begin
       if not GeraContribBenef(QryLoop, QryContribProc, QryAux,
                               StrConcedidos,
                               iNumeroProcesso,
                               iIdLoteConcessao,
                               sAnoMesLoteConcessao,
                               sDataEvento,
                               Copy(sDataInicioContrib,7,4)+'/'+Copy(sDataInicioContrib,4,2),
                               '',
                               -1,
                               '',
                               2
                               //BRUNO AZEVEDO SOL 164519 KINTANA 1412858 - FOI PERDIDO NO MERGE, COLOQUEI NOVAMENTE
                               //Renato Visoni SOL 157416 Kintana 1259334
                               ,''
                               ,''
                               ,''
                               ,False
                               , 4 //Renato Visoni SOL 157416 Kintana 1259334 // SOL 232043 PPM 396781 Correção de um outro problema referente a taxa feito neste SOL
                               ,-1//BRUNO AZEVEDO SOL 164519 KINTANA 1412858 - FOI PERDIDO NO MERGE, COLOQUEI NOVAMENTE
                               ,-1
                               )

       then begin
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk],0);
          TiraSQL(qryAux);
          Exit;
       end;

     end;
     }  // edilaine - SOL 253577-17464 / PPM 955703 - fim

     // SOL 132938
     If Trim(DbLAlterador.Text) = 'Sim' Then
     Begin

         // para que seja possivel ordenar as contribuições de acordo com a ordenação dos beneficios
         // foi necessario criar uma query ordenada conforme a query que traz os beneficios no demonstrativo
         sSQL :=
               //' SELECT BF.IDBENEFICIO FROM BENEFBFCIARIO BF , BENEFICIO B '+
               ' SELECT BF.IDBENEFICIO, BF.IDPESSOA FROM BENEFBFCIARIO BF , BENEFICIO B '+//William Moreira da Silva - SOL 231025 PPM 363636
               ' WHERE  B.IDBENEFICIO = BF.IDBENEFICIO      '+
               ' AND    BF.NUMEROPROCESSO = '+ qryDet.FieldByName('NUMEROPROCESSO').AsString +
               ' ORDER  BY B.NOME                           ';

         FazQuery(qryAux2, sSQL);

         qryAux2.First;

         while not qryAux2.Eof do
         begin

            //edilaine WO8511 - inicio
            if not qryDet.Locate('IdBeneficio',qryAux2.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]) then
            begin
              qryAux2.next;
              continue;
            end;
            //edilaine WO8511 - fim

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
               //sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime); //SIG49612
               //sAnoMesFim   := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime); //SIG49612
               bAlteradorBua := true;
            end
            else
            begin
               bAlteradorBua := false;
               // Inicio SIG49612
               {if  qryDet.FieldByName('DATAINICIO').Asstring <> '' then
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
               else
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);  }
               //Final SIG49612
            end;

            //Inicio SIG49612
            if  qryDet.FieldByName('DATAINICIO').Asstring <> '' then
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
            else
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);
            //Final SIG49612
            while  sAnoMesAtual <= sAnoMesFim do
            begin

               sSQL :=
               ' SELECT DECODE(H.FLGDEVOLUCAO,1,-H.VALORPREV ,H.VALORPREV) AS VALORPREV' +   //SOL 132938 André Oliveira
               '   FROM BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP ' +
               '  WHERE H.IDLOTE = ' + QuotedStr(IntToStr(iIdLoteConcessao)) +
               '    AND H.IDPESSJUR = '+ qryDet.FieldByName('IDPESSJUR').AsString +
               '    AND H.IDPESSOA =  '+ QryAux2.FieldByName('IDPESSOA').AsString + //William Moreira da Silva - SOL 231025 PPM 363636
               //'    AND H.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString + //William Moreira da Silva - SOL 231025 PPM 363636
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
               end;
              if Length(sIdContribuicaoAlteradores) <= 0 then  //SOL 132938 André Oliveira
                  sIdContribuicaoAlteradores := '0';

             // edilaine - SOL 262968 / PPM 1102753
             {os alteradores de contribuição são calculados pela procedure da Taxa - ExecutaSP_PreparoContribuicao}
             //Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB
             {sSQL := 'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO, DECODE(H.FLGDEVOLUCAO,1,H.VALORESPERADO ,-H.VALORESPERADO) as VALORESPERADO  FROM ' + //SOL 132938 André Oliveira
                     'HSTCONTRIBPREV H WHERE  H.NUMRECEBIMENTO =      '+
                     '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                     ' FROM HSTCONTRIBPREV HCP '+
                     ' WHERE                   '+
                     //'  HCP.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString      +' AND '+
                     '  HCP.IDPESSOA = '+ QryAux2.FieldByName('IDPESSOA').AsString     +' AND '+
                     '  HCP.IDMOTIVO = '+ inttostr(prmIdMotivoContrib)                 +' AND '+
                     '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                +' AND '+
                     '  HCP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                             AND '+
                     '  HCP.IDPESSOA = H.IDPESSOA )                                       AND '+
                     '  H.Idcontribuicao in ( ' +sIdContribuicaoAlteradores +' ) ';

             If FazQuery(QryAux, sSQL) Then Begin

               iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
               iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

               If (((iNumRecebimento > 0) and not(bAlteradorBua)) and (sAnoMesAtual <> sAnoMesFim)) Then Begin // SOL 232043 PPM 396781
                 // Calcular Alterados
                   If Not CalculaAlteradores('C', sAnoMesAtual,
                                             qryAux.FieldByName('VALORESPERADO').AsFloat,  // SOL 231025 PPM 363636
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
             } // edilaine - SOL 262968 / PPM 1102753


             if (((sAnoMesAtual = sAnoMesFim) and (sAnoMesAtual <> (Copy(sAnoMesAtual, 1,4) + '/13'))) and not(bAlteradorBua)) then begin
               sAnoMesAtual := Copy(sAnoMesAtual, 1,4) + '/13';
               sAnoMesFim   := Copy(sAnoMesFim, 1,4) + '/13';
             end else begin
               if (Copy(sAnoMesAtual, 6,2) = '12') then begin
                 sAnoMesAtual  := Copy(sAnoMesAtual, 1,4) + '/13';
               end else begin
                 sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
               end;
             end;
            end;
            qryAux2.next;
         end;
     end;
      // SOL 132938

     // edilaine - SOL 253577-17464 / PPM 955703 - fim


     if not ConfirmaBeneficio
     then begin
        dtmBaseDados.dbBaseDados.RollBack;
        TiraSQL(qryAux);

        MsgDlg('Todo o processo de concessão do benefício será cancelado.','Atenção',mtInformation,[mbOk],0);
        bbtnCancelarClick(Self);

        lblSitProcesso.Caption := 'Situação : ' + qryDetDescricao.AsString; // SOL 221079
        Refresh;

        Exit;
     end;


    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


    Try //Brunno Mattos - KTN 767861 - SOL 132659

     dtmBaseDados.dbBaseDados.Commit;
    //Brunno Mattos - KTN 767861 - SOL 132659 Inicio

      //Otacilio Aquino SOL 160863 Kintana 1381911
      uBeneficio.bGravaEvento := True;
     Except
      on e:Exception do
      begin
        TratarErro(e.Message);
      end;
     end;
     //Brunno Mattos - KTN 767861 - SOL 132659 Fim
  end;  // if state = dsEdit e bConcedeuBeneficio    // edilaine - SOL 253577-18094 / PPM 1269549
  {else begin
      Busca Contribuicoes associadas ao evento
     QryBuscaContrib.Close;
     QryBuscaContrib.ParamByName('IDEVENTOGERADOR').AsInteger := iIdEvento;
     QryBuscaContrib.ParamByName('IDPLANOPREV').AsInteger     := iIdPlanoPrev;

     QryBuscaContrib.Open;
     // Processo o Controle de Nucleos Familiares caso tenha contribuicao associada
     // ao evento
     If (Not QryBuscaContrib.IsEmpty) Then Begin

        If (Not ProcessaNucleoFamiliar(QryDet,QryNucleoFamiliar,QryAux,QryBuscaContrib,
                                       iIdTitular, iIdPessJur,
                                       iIdPlanoPrev,
                                       iIdEvento)) Then Begin

           MsgDlg('Erro ao associar contribuições ao Núcleo Familiar. Processo não Confirmado!','Erro',mtError,[mbOk],0);
           bbtnCancelarClick(Self);
           Exit;
        End;

     End; 
  end;}   // edilaine - SOL 253577-18094 / PPM 1269549


//inherited;//SOL 201131 Kintana 1944161
     // SOL 169562/11863 Kintana 1821350 ** Inicio **

     lblSitProcesso.Caption := 'Situação : ' + qryDetDescricao.AsString; // SOL 221079
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

     // SOL 169562/11863 Kintana 1821350 ** Fim **
  qry.FieldbyName('IdSitProcesso').value :=IntToStr(qryDet.FieldByName('IDSITBENEFICIO').AsInteger);//SOL 201131 Kintana 1944161//
inherited;//SOL 201131 Kintana 1944161

  if (sTipoFormChamador = 'SI') and (not prmFlgGravaSimulBenef)
  then begin
      // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio

      If not dtmBaseDados.dbBaseDados.InTransaction
       Then dtmBaseDados.dbBaseDados.StartTransaction;

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
         DesfazRequerimentos(qryAux, sNumeroProcessoAntesGravar, qryDet.IsEmpty); //TAES - SIG99559
      end;

    //  If dtmBaseDados.dbBaseDados.InTransaction
    //   Then dtmBaseDados.dbBaseDados.Rollback;
  end;

  //SOL 124097 - Ádler Souza
  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;
  Try //Brunno Mattos - KTN 767861 - SOL 132659


     // edilaine - SOL 253577-18064 / PPM 1240079- inicio
     { gera historico de percentual }
     if (sTipoFormChamador = 'CO')
        and (bConcedeuBeneficio) then        // edilaine - SOL 253577-18129 / PPM 1303078
     begin

       // Andre Imakawa - SIG 50047 - Inicio
       if bPossuiIDTPPAGTOBENEFIC then
         begin
//           if not (GravaHstPercGrupoHistorico(iIdTitular)) then  //Everson Cunha - SIG50989
           if not (GravaHstPercGrupoHistorico(iIdTitular, 1)) then //Everson Cunha - SIG50989
           begin
             MsgDlg('Erro na gravação do histórico do percentual por grupo.','Erro',mtError,[mbOK],0);
             exit;                               // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
             //if dtmBaseDados.dbBaseDados.InTransaction then
             //   dtmBaseDados.dbBaseDados.Rollback;
             // edilaine - SOL 253577-18129 / PPM 1303078 - fim
           end;
         end;
       // Andre Imakawa - SIG 50047 - Fim
     end;
     // edilaine - SOL 253577-18064 / PPM 1240079 - fim

    // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
    if (Sistema.IdModulo = 454) and ((sTipoFormChamador = 'EV') or (sTipoFormChamador = 'MA')) then
    begin
       if not(AssociaTaxas()) then
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
      if not DesmembraProcessosBeneficios(iNumeroProcesso, sListaProcessos, sMsgErro ) then
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
                       ' WHERE NUMEROPROCESSO IN ('+sListaProcessos+')');
        qryAux.ExecSql;
      end;
      //edilaine SIG20491 : fim
    end;
    // edilaine - SOL 253577-18094 / PPM 1269549 - fim

    if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;

     if (sTipoFormChamador = 'CO') and    // edilaine - SOL 253577-17464 / PPM 955703
        (bConcedeuBeneficio) then        // edilaine - SOL 253577-18129 / PPM 1303078
     begin
        GeraDemonstrativo(formatdatetime ('hh:mm:ss',now));

       // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
       if sRequerimento then
          bbtnSairClick(Sender)
       else
          SelecionaProcesso(-1);
       // edilaine - SOL 253577-18129 / PPM 1303078 - fim
     end;

     //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
     //Otacilio Aquino SOL 160863 Kintana 1381911
    uBeneficio.bGravaEvento := True;
  Except
    on e:Exception do
    begin
      TratarErro(e.Message);
    end;
   end;
   //Brunno Mattos - KTN 767861 - SOL 132659 Fim
  //Fim - SOL 124097 - Ádler Souza

  if (Sistema.IdModulo = 454) and (sTipoFormChamador = 'EV') then
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


procedure TfrmCadRequerBenefBfciario.sbtnExcluiDetClick(Sender: TObject);
var qryAuxCalc, qryDelCalc : TQuery;
begin
  If (bFlgBenefMorte) And (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3)
   Then Begin
      MsgDlg('Este benefício está encerrado e não pode ser excluído.','Aviso',mtInformation,[mbOk],0);
      sbtnExcluiDet.Down := false;
      exit;
   End;

  if qrydet.isempty then
  begin
     sbtnExcluiDet.Down := false;
     exit;
  end;

  if not qryBeneficio.Active
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
     qryBeneficio.Open;
  end;

  // O usuario só terá este botao disponivel se o processo estiver
  // pendente ou nao concedido
  // Logo se o processo estiver pendente e o beneficio que o usuario esta
  // tentando excluir for resgate, o sistema devera devolver a reserva
  if ( (qryDet.FieldByName('IdSitBeneficio').AsInteger = 4) or
       (qryDet.FieldByName('IdSitBeneficio').AsInteger = 8) ) and
     (qryDet.FieldByName('FlgResgate').AsInteger = 1)
  then begin
     if not DevolveReserva( qryDet.FieldByName('IdBeneficio').AsInteger,
                            qryDet.FieldByName('IdPessoa').AsInteger)
     then begin
        MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
               'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
               'Verifique. ','Informação',mtInformation,[mbOk],0);
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);
  while (not qryBenefAux.Eof) and {or}         // edilaine - SOL 253577-18129 / PPM 1303078
        (qryBenefAux.FieldByName('IdBeneficio').AsInteger = qryBeneficio.FieldByName('IdBeneficio').AsInteger)   do
  begin
     qryBenefAux.Delete;
  end;
  
  QryAuxCalc := Tquery.Create(Self);
  QryAuxCalc.databasename := 'basedados';
  QryAuxCalc.SQL.Add(' Select idcalculo from relbenefpart where numeroprocesso = '+inttostr(iNumeroProcesso)+
                     ' and idpessoa    = '+qryBeneficiario.fieldbyname('idpessoa').asstring+
                     ' and idbeneficio = '+qrybeneficio.fieldbyname('idbeneficio').asString);
  QryAuxCalc.Open;
  QryDelCalc := Tquery.Create(Self);
  QryDelCalc.databasename := 'basedados';

  While not QryAuxCalc.eof do
  begin
     QryDelCalc.sql.Clear;
     QryDelCalc.sql.add(' delete from relbenefpart where idcalculo = '+ QryAuxCalc.fieldbyname('idcalculo').asString+
                        ' and idpessoa = '+qryBeneficiario.fieldbyname('idpessoa').asstring);
     QryDelCalc.ExecSql;

     QryAuxCalc.next;
  end;

  // edilaine - SOL 270851 / PPM 1338345 - comentado inicio
  // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
  {QryAuxCalc.close;
  QryAuxCalc.sql.clear;
  QryAuxCalc.SQL.Add(' DELETE FROM CONTRIBPREVNUCLEO C                               '+
                     ' WHERE  EXISTS                                                 '+
                     '        ( SELECT 1                                             '+
                     '          FROM   BENEFBFCIARIO BF, BFCIARIOTITPLAN BTIT        '+
                     '          WHERE  BF.NUMEROPROCESSO  = '+inttostr(iNumeroProcesso)+
                     '          AND    BF.IDPESSOA        = '+qryBeneficiario.fieldbyname('idpessoa').asstring+
                     '          AND    BF.IDBENEFICIO     = '+qrybeneficio.fieldbyname('idbeneficio').asString+
                     '          AND    BTIT.IDPESSJUR     = BF.IDPESSJUR             '+
                     '          AND    BTIT.IDTITULAR     = BF.IDTITULAR             '+
                     '          AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM         '+
                     '          AND    BTIT.IDPESSOA      = BF.IDPESSOA              '+
                     '          AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA           '+
                     '          AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV           '+
                     '          AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO           '+
                     '          AND    C.IDNUCLEOFAMILIAR = BTIT.IDNUCLEOFAMILIAR    '+
                     '          AND    TO_CHAR(C.DATAINICIO,''YYYY/MM/DD'') >= TO_CHAR(BF.DATAINICIO, ''YYYY/MM/DD'') '+
                     '        ) ');
  QryAuxCalc.ExecSql;
  // edilaine - SOL 253577-18094 / PPM 1269549 - fim
  }// edilaine - SOL 270851 / PPM 1338345 - comentado fim

  QryDelCalc.Free;
  QryAuxCalc.Free;

  inherited;
//  SelecionaProcesso(-1);
end;

procedure TfrmCadRequerBenefBfciario.FormShow(Sender: TObject);
begin
  InicializaEP;

  sbtnCadContaCorrente.Enabled := False;
  sbtnDemonsSRB.Enabled        := False; 

  sIdBeneficiarioEncerrado     := '';    

    if bAbriuOutroForm
  then begin
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     Exit;
  end;

  sNumerosProcessos := '';

  inherited;

  if sTipoFormChamador = 'EV' // form chamador é um dos eventos
  then begin

     // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
     if not dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;
     // edilaine - SOL 253577-18129 / PPM 1303078 - fim

     Caption := 'Requerimento de Benefícios para Beneficiário';
     // Verificar se beneficio já foi requerido por este evento
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT P.NUMEROPROCESSO FROM PROCESSOBENEF P, BENEFBFCIARIO B '+
                    ' WHERE P.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+
                    ' AND   P.IDSITPROCESSO  = 4'+//IN (1,4) '+  // falar para o HEBIO
                    ' AND   P.DTEVENTO = TO_DATE('''+sDataEvento+''',''DD/MM/YYYY'') '+
                    ' AND   B.NUMEROPROCESSO = P.NUMEROPROCESSO '+
                    ' AND   B.IDTITULAR = '+IntToStr(iIdTitular)+
                    ' AND   B.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+
                    ' AND   B.IDPESSJUR  = '+IntToStr(iIdPessJur)+
                    ' AND   B.IDTITULAR <> B.IDPESSOA ');
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        qryAux.Close;
        If Not bFlgBenefMorte
          Then sbtnInserirClick(Sender)
          Else VerificaProcessoEncerrado;

        // Preencher dados do evento
        try
           qryEvento.Close;
           qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
           qryEvento.Open;

           dblkpcmbEvento.Text  := qryEvento.FieldByName('Nome').AsString;
           dtDataEvento.Date    := StrToDate(sDataEvento);
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
        qryEvento.Close;
        qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
        qryEvento.Open;

        dblkpcmbEvento.Text := qryEvento.FieldByName('Nome').AsString;
        dtDataEvento.Date   := StrToDate(sDataEvento);
        iNumeroProcesso     := qryAux.FieldbyName('NumeroProcesso').AsInteger;

        qryAux.Close;

        SelecionaProcesso(iNumeroProcesso);
        sbtnAlterarClick(Sender);
     end;

     // Desabilitar a concessao e a alteracao do tipo de evento
     sbtnConcedeUm.Enabled := False;
     dblkpcmbEvento.Enabled := False;

     // Simular um procurar com os dados passados como parametro
     bQueryTitular       := False;
     bQuerySalarios      := False;
     bQueryContribuicoes := False;
     bPerguntouCancelar := False;

     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
     qryBeneficio.Open;

     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end
  else begin
     if sTipoFormChamador = 'CO' // form chamador é o menu concessao
     then begin
        Caption := 'Concessão de Benefícios para Beneficiário';
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
             Caption := 'Simulação de Benefício para Beneficiário';
             MontaSelect.Filtro.Add(' B.IDSITBENEFICIO = 8 ');
             lblNomeBenef.Caption   := '';
             dblkpcmbEvento.Enabled := True;

             
             If Not DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.StartTransaction;
          end
          else begin // form chamador é o menu Manutencao de Requerimento
             Caption := 'Manutenção de Processos de Benefícios para Beneficiário - NÃO CONCEDIDOS'; 
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
  wIdMotivo  := prmIdMotivoContrib;

  dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499

end;

procedure TfrmCadRequerBenefBfciario.bbtnSairClick(Sender: TObject);
begin
 sNumerosProcessos := Inttostr(iNumeroProcesso);
 bbtnCancelar.ModalResult := mrCancel;

 // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
 {se for requerimento e estiver com transacao em aberto, nao chamar a tela para conceder o beneficio}
 if (sTipoFormChamador = 'EV') and (DtmBaseDados.dbBaseDados.InTransaction) then
    bChamarConcessao := false;
 // edilaine - SOL 253577-18129 / PPM 1303078 - fim

 Close;
end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbBeneficioCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var sDataInicio, sDataFinal, sMsgErro,
    sNomeBenefOrdemMenor    : string;

    bExisteBenefOrdemMenor, 
    bErro : boolean;

    sProxMat, sDv , sSql : String;

begin
  inherited;
  ValidaTitular;
  //Fanuel Junior SOL148463 Kintana1050263 - INICIO
  if ((qryBeneficio.FieldByName('FLGVALORTITULAR1').AsInteger = 1) and  (rOpcao1 <= 0)) or
     ((qryBeneficio.FieldByName('FLGVALORTITULAR2').AsInteger = 1) and  (rOpcao2 <= 0)) then
     begin
        MessageDlg('O titular não possui %FUNCEF ou %PBE cadastrado. '+#13+
                   'Não é possível conceder o benefício até o devido preenchimento.', mtWarning, [mbOK,mbHelp], 0);
        btn_SelecionaBeneficios.Enabled := false;
        dblkpcmbBeneficio.Text := '';
        Exit;
     end
     else
        btn_SelecionaBeneficios.Enabled := true;

  //Fanuel Junior SOL148463 Kintana1050263 - FIM



  // Verificar hstbenefbfciario Vinicius Ferreira
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
                 ' FROM   hstbenefbfciario '+
                 ' WHERE     NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                 ' AND    IDBENEFICIO  = '+QuotedStr(sBeneficioAnterior)+  // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O QuotedStr
                 ' AND    IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    IDPESSOA     = '+IntToStr(iIdPessoa)+
                 ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(iSeqProposta));
  qryAux.Open;

   if not (qryAux.IsEmpty) then
   begin

     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

  If Modified
   Then Begin
     reValorSRB.Text       := '';
     reValorTotal.Text     := '';
     reValorBeneficio.Text := '';
     bValidaOpcaoBeneficio := False; 
   End;


  If dblkpcmbBeneficio.Text <> '' Then
    edCodFundacao.Caption := qryBeneficio.FieldByName('CODBENEFICIO').AsString;
  btn_SelecionaBeneficios.Enabled := True;
  bNovoBeneficio                  := True;
  dblkpcmbBeneficiario.enabled    := False;
  dbeMatriculaBenef.Enabled       := False; 
  iTotRequeridos                  := 0;

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;
  end
  else dblkcmbTpPgtoBenef.Text := '';


  // Verificar se este benefício já foi requerido para algum beneficiário
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 ');
                 //' AND    BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso));    // edilaine - SOL 253577-18129 / PPM 1303078
  qryAux.Open;
  if (not qryAux.IsEmpty)
     and (iNumeroProcesso <> qryAux.FieldByName('NumeroProcesso').AsInteger)   // edilaine - SOL 253577-18129 / PPM 1303078
  then begin
     if MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
            ' e está pendente de concessão. '+
            'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'. Deseja continuar ?',
            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        qryAux.Close;
        dblkpcmbBeneficio.Text := '';
        if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
           dblkpcmbBeneficio.SetFocus;
        Exit;
     end;
  end;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {verifica se o novo beneficio selecionado está registrado na BFCIARIOTITPLAN}
  if (sTipoFormChamador <> 'EV') and (qryDet.State = dsEdit) then
  begin
    if not VerificaBeneficioxBenefTitPlan(iNumeroProcesso, iIdPessoa, qryBeneficio.FieldbyName('IdBeneficio').AsInteger) then
    begin
      MsgDlg('O benefício selecionado não está associado para este beneficiário.','Erro',mtError,[mbOk],0);
      qryBeneficio.Locate('IDBENEFICIO', StrToInt(sBeneficioAnterior), [loCaseInsensitive]);
      dblkpcmbBeneficio.Text := qryBeneficio.FieldbyName('Nome').AsString;
      if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
         dblkpcmbBeneficio.SetFocus;
      Exit;
    end;
  end;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim


  { Iniciar Calculo para cada beneficio utilizado }
  iIdCalculo := 0;

  if qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])
  then begin
        qryaux.SQL.clear;
        qryaux.sql.add('SELECT IDCALCULO FROM RELBENEFPART WHERE NUMEROPROCESSO = '+IntToStr(iNumeroProcesso) +
                       ' AND IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').asstring);
        qryaux.open;
        iIdCalculo  := qryaux.fieldbyname('IDCALCULO').asInteger;
        qryAux.Close;
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
     // HIGOR NAYDE FERREIRA SOL 211709/15287
     if(sistema.idmodulo <> 454)then begin
       if (bExisteBenefOrdemMenor) and
          (MsgDlg('O benefício '+sNomeBenefOrdemMenor+' deveria ser requerido antes do '+
                        qryBeneficio.FieldByName('Nome').AsString+'. Confirma o requerimento ? ',
                        'Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo)
       then begin
            dblkpcmbBeneficio.Text := '';
            dblkpcmbBeneficio.SetFocus;
            Exit;
       end;// HIGOR NAYDE FERREIRA SOL 211709/15287
     end;
     dtDataFinal.Enabled :=  (qryAux.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital);

  end;

  lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

  // Preencher qual é o beneficio de referencia
  if Trim(qryBeneficio.FieldByName('IDBENEFREF').AsString) <> '' then begin
    iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger;
  end else begin
    iIdBenefReferencia  := -1;
  end;

  If qryBeneficio.FieldByName('FLGREFERENCIA').AsString = '1' Then Begin
    grpInfINSS.Visible  := True;
  End Else Begin
    If Trim(qryBeneficio.FieldByName('IDBENEFREF').AsString) <> '' then begin
      grpInfINSS.Visible  := True;
     End Else Begin
      grpInfINSS.Visible  := False;
     End;

     If (qryBeneficio.FieldByName('FLGOBRIGANPROC').AsString = '1') Then Begin
      grpInfINSS.Enabled  := True;
      grpInfINSS.Visible  := True;
     End;
  End;

  TiraSQL(qryAux);

  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;

  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFBFCIARIO ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.FieldByName('VALORBASE1').AsString <> ''
  then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
  else rOpcao1 := 0;

  if qryAux.FieldByName('VALORBASE2').AsString <> ''
  then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
  else rOpcao2 := 0;

  if qryAux.FieldByName('VALORBASE3').AsString <> ''
  then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
  else rOpcao3 := 0;

  if qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
  then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
  else rCampoTexto1 := '';

  if qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
  then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
  else rCampoTexto2 := '';

  if qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
  then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
  else rCampoTexto3 := '';

  qryAux.Close;

  if sTipoFormChamador = 'SI'
  then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor (Real)  ';

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;

     dtDataFinal.Enabled :=  (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital);
     If Not dtDataFinal.Enabled Then
       dtDataFinal.Text := '';

  end
  else dblkcmbTpPgtoBenef.Text := '';

  bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FlgAceitaOpcao').AsInteger = 1 ) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);

  lblAgencia.Visible      := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );
  dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor (Real)  ';

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';
     pnlNaoBenefProv.Visible := False;
     pnlBenefProv.Visible    := True;
  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação '; 
     pnlNaoBenefProv.Visible := True;
     pnlBenefProv.Visible    := True;
  end;

    reValorSRB.ReadOnly       := Not ((qryBeneficio.FieldByName('FLGACTVLRSRB').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString) <> '')));

    reValorBeneficio.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IDREGRASIMULA').AsString) <> '')));

    reValorTotal.ReadOnly     := Not ((qryBeneficio.FieldByName('FLGACTVLRTOTBEN').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString) <> '')));



  If QryDet.State  in [dsInsert, dsEdit] Then Begin
    QryDet.FieldByName('FLGPAGAINSS').AsInteger := QryBeneficio.FieldByName('FLGPAGAINSS').AsInteger;
  End;

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  bFlgApresentaDeficit := (qryBeneficio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
  bFlgApresentaBSFAB   := (qryBeneficio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);

  if (sTipoFormChamador = 'EV') or
     (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
     (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
     AjustaTela();
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbBeneficiarioCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var varFields : variant;
    sNumeroProcessoInss : String;
    sDataInicio : string;
    bErro : boolean;
    sMsgErro : string;
    sProxMat, sDataFinal : string;
begin
  inherited;

  // Verificar se este beneficio já foi requerido para este beneficiario
  dblkpcmbBeneficio.PerformSearch;
  varFields := VarArrayCreate([0,1],varVariant);
  varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  varFields[1] := qryBeneficiario.FieldByName('IdPessoa').AsInteger;
  if qryBenefAux.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     MsgDlg('Este beneficiário já está neste mesmo processo para este benefício. Verifique. ','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficiario.Text := '';
     dblkpcmbBeneficiario.SetFocus;
     Exit;
  end;

  { Pesquisar a existencia de um beneficio igual }
  If (JaPossuiBeneficio(iIdPessJur, iIdTitular,
                        QryBeneficiario.FieldByName('IDPESSOA').AsInteger,     
                        iIdPlanoPrev,
                        QryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                        iSeqProposta, True,
                        qryEvento.FieldByName('IdEventoGerador').AsString))  // TADEU PASSOS, SOL 181948 KINTANA 1724239
    And (sTipoFormChamador <> 'SI') 
  Then Begin
    MsgDlg('Este benefício já foi requerido para esta pessoa em outro processo. ',
           'Atenção', mtError, [mbOk],0);
    dblkpcmbBeneficiario.Text := '';
    dblkpcmbBeneficiario.SetFocus;
    Exit;

  End;


  PreencheDadosBeneficiario(iNumeroProcesso,iIdTitular, qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                            iIdPessJur, iIdPlanoPrev, iSeqProposta);

  dbeMatriculaBenef.Enabled := True;

  // Verificar se exitem opções de beneficiario
  qryAux.Close;
  qryAux.SQL.Clear;

  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFBFCIARIO ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
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

     if qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
     then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
     else rCampoTexto1 := '';

     if qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
     then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
     else rCampoTexto2 := '';

     if qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
     then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
     else rCampoTexto3 := '';
  end;
  qryAux.Close;
  ValidaTitular;  //Fanuel Junior SOL148463

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;
  end
  else dblkcmbTpPgtoBenef.Text := '';

  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  if bNovoBeneficio
  then begin
     sValorTotal       := '0';
     sValorInfInss     := '0';
     sValorCalcInss    := '0';
     sDataInicioPagto  := dtDataInicio.Text;
     iFlgTipoINSS      := 2;
  end;

  if qryBeneficio.FieldByName('FlgReferencia').AsInteger = 0
  then begin
     if (BuscaDadosINSSEmVigor ( qryAux,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                 sValorCalcINSS, sValorInfINSS, sDataInicioINSS, sNumProcINSS,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sNumeroProcessoInss, sFlgPagaINSS ) ) and
        (StrToFloat(ClienteNumero(sValorCalcInss)) > 0 )
     then begin
        qryDet.FieldByName('VLRCALCINSS').AsString    := ClienteNumero(sValorCalcINSS);
        qryDet.FieldByName('VLRINFINSS').AsString     := ClienteNumero(sValorInfINSS);
        qryDet.FieldByName('DATAINICIOINSS').AsString := sDataInicioINSS;
        qryDet.FieldByName('NUMPROCINSS').AsString    := sNumProcINSS;
        qryDet.FieldByName('FLGPAGAINSS').AsString    := sFlgPagaINSS;

        reValorCalcInss.Text    := ClienteNumero(sValorCalcINSS);
        reValorInfINSS.Text     := ClienteNumero(sValorInfINSS);
        dtInicioINSS.Date       := StrToDate(sDataInicioINSS);
        dbedNumProcINSS.Text    := sNumProcINSS;
        reValorCalcINSS.Enabled := False;
        dbedNumProcINSS.Enabled := False;

        //caso o benef. do INSS seja requerido separadamente, este está com
        //outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
        //caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
        if (trim(sNumeroProcessoInss) <> '') and
           (StrToInt(sNumeroProcessoInss) <>  iNumeroProcesso) then
        begin
           with qryBenefReferencia do
           begin
              Close;
              ParamByName('IdTitular').Value       := iIdTitular;
              ParamByName('SeqProposta').Value     := iSeqProposta;
              ParamByName('IdPessJur').Value       := iIdPessJur;
              ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
              ParamByName('NumeroProcesso').Value  := StrToInt(sNumeroProcessoInss);
              Open;
           end;
        end;
     end
     else begin
        reValorCalcInss.Text    := '0';
        reValorInfINSS.Text     := '0';
        dbedNumProcINSS.Text    := '';
        reValorCalcINSS.Enabled := True;
        dbedNumProcINSS.Enabled := True;
     end;

     { Somente persistir o VALOR TOTAL do beneficio caso não seja }
     { beneficio de Resgate, pois nesse caso é necessário recalcular o VALOR TOTAL     }
     { para abater os valores resgatados das suas reservas.                            }
     if ( ( qrybeneficio.fieldbyname('FLGRESGATE').AsInteger    <> 1 ) )
     Then reValorTotal.Text := ClienteNumero(sValorTotal);

  end
  else begin // esta requerendo o proprio beneficio do INSS -> repetir dados do beneficiario anterior
     reValorTotal.Text        := ClienteNumero(sValorTotal);
     reValorCalcInss.Text     := ClienteNumero(sValorCalcInss);
     reValorInfInss.Text      := ClienteNumero(sValorInfInss);
  end;

  // Executar regra de calculo de data de inicio e data final
  if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraInicio').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);

     sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),       
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),       
                                 FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),       
                                 FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),        
                                 FormatDateTime('dd/mm/yyyy', date),                    
                                 FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), 
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
     frmAguarde.Apaga;

     if bErro
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
        qryDet.FieldByName('DataInicio').AsString := '';
        dtDataInicio.Text := '';
     end
     else
     begin
        if Trim(sDataInicio) <> '' then
        begin
          qryDet.FieldByName('DataInicio').AsString := sDataInicio;
          dtDataInicio.Text                         := sDataInicio;
        end;
     end;
  end; //if regrainicio <> ''

  if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0) then
  begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);

     Try
       sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                                   iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                   iSeqProposta,
                                                   qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   rOpcao1, rOpcao2, rOpcao3,
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
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
     else
     begin
       qrydet.FieldByName('DATAFINAL').AsString := sDataFinal; 

       If sDataFinal <> '' Then                                
         dtDataFinal.date := StrToDate(sDataFinal);            
     end;
  end; // if regrafim <> ''

  if (qrybeneficio.fieldbyname('FLGPECULIO').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGREFERENCIA').AsInteger <> 1) and
     (qryDet.State in [dsInsert]) and
     (trim(prmMASCMATPENS) <> '')
  then begin
     If qryDepentit.FieldByName('MATRICULA').AsString = '' Then Begin
       sProxMat := GeraMatricula(QryAux, iIdCalculo); 
       qryDepentit.Edit;
       qryDepentit.FieldByName('MATRICULA').AsString := sProxMat;
       //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
       MatriculaBenefInicial := sProxMat;
     End else begin
       //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
       MatriculaBenefInicial := qryDepentit.FieldByName('MATRICULA').AsString;
     end;
  end;

  //  Andre Imakawa - SIG 58900 - Inicio
  If (dtDataFinal.Enabled) and (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = 2) and (dtDataFinal.Text = '') Then
  Begin
    qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DataInicio').AsString;
    dtDataFinal.Text                         := dtDataInicio.Text;
  end;
  //  Andre Imakawa - SIG 58900 - Fim

end;

procedure TfrmCadRequerBenefBfciario.qryBeneficiarioAfterOpen( DataSet: TDataSet );
begin
  inherited;
  // Se o parametro do beneficio por plano (flgbenefinf) definir que
  //    é para considerar o no. de beneficiarios elegiveis
  // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
  //       está com os elegiveis
  // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
  //       iNumBenef := numero total de beneficiarios


  if not qryBeneficio.Active then Exit;

  if (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
  then begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF '+
                   ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                   ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                   ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                   ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                   ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') ');
    qryAux.Open;
    iNumBenef := qryAux.RecordCount;
  end;
end;

procedure TfrmCadRequerBenefBfciario.btn_SelecionaBeneficiosClick(Sender: TObject);
var sMsgErro: string;
    bConcedeBeneficio,
    bErro : boolean;

    sNumeroProcessoInss : String;

begin
  inherited;
  iIdTitularSel := iIdTitular;
  iIdPessjurSel := iIdPessjur;
  iIdPlanoprevSel := iIdPlanoprev;

  AbrirFormModal(frmSelecionaBeneficiariosdoBeneficio, TfrmSelecionaBeneficiariosdoBeneficio);
  ValidaTitular; //Fanuel Junior SOL148463
  if (not bSaiuSel) and (bAlgumElegivel)
  then begin
     { Lembrando que a qryBeneficiario é alterada novamente }
     { no formulario fSelecionaBeneficiariosdoBeneficio                          }
     qryBeneficiario.Close;
     qryBeneficiario.ParamByName('IdTitular').AsInteger   := iIdTitular;
     qryBeneficiario.ParamByName('IdPessJur').AsInteger   := iIdPessJur;
     qryBeneficiario.ParamByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
     qryBeneficiario.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
     qryBeneficiario.Open;
     
     while not qryBeneficiario.Eof do
     begin
        // EXECUTAR A REGAR DE BENEFICIARIO PARA CADA BENEFICIARIO
        if (Trim(qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString) = '') or
           (qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger <= 0)
        then bConcedeBeneficio := True
        else begin
           frmAguarde.Mostra('Regra de Elegibilidade do Beneficiário  - Nº '+
                              qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString);

           Try
             bConcedeBeneficio := ExecutaRegraElegibilidadeBfciario(qryAux,
                                       qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger,
                                       iIdPessJur, iIdPlanoPrev, iIdTitular,
                                       qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                       iSeqProposta,
                                       qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                       rOpcao1, rOpcao2, rOpcao3,
                                       FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                       FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                       sDataDemissao,
                                       bErro,
                                       sMsgErro, 1); 
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
             begin
               MsgDlg('A Regra de Elegibilidade do Beneficiário - Nº '+
                      qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString+
                      ' NÃO foi satisteita para '+
                      qryBeneficiario.FieldByName('Nome').AsString+
                      '. Verifique. ','Informação',mtInformation,[mbOk],0);
               Exit;
             end;
           end;
         end;
         qryBeneficiario.Next;
     end;

     // Habilitar os componentes
     btn_SelecionaBeneficios.enabled := true;
     dtDataRequerimento.Enabled      := true;
     dblkpcmbBeneficiario.enabled    := true;
     dbeMatriculaBenef.Enabled       := True; 
     dbedNumProcINSS.enabled         := true;
     dtInicioINSS.enabled            := true;
     dtInicioFund.enabled            := bPagaRetroativo;
     dtDataInicio.enabled            := bPagaRetroativo;
     reValorCalcInss.enabled         := true;
     reValorInfINSS.enabled          := true;
     reValorBeneficio.enabled        := true;
     reValorSRB.Enabled              := True;
     reValorTotal.enabled            := true;
     dtDataFinal.enabled             := true;
     dblkcmbTpPgtoBenef.Enabled      := False; // Peterson Victor SOL 268616 PPM 1266499
     dblkpcmbPortForma.enabled       := true;

     if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible)
     then dtDataRequerimento.SetFocus;

     if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
     then begin
        dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
        dblkcmbTpPgtoBenef.PerformSearch;
     end
     else dblkcmbTpPgtoBenef.Text := '';

     sNumProcINSS    := '';
     sValorCalcINSS  := '0';
     sValorInfINSS   := '0';
     sDataInicioINSS := '';
     sValorBase1INSS := '0';
     sValorBase2INSS := '0';
     sValorBase3INSS := '0';

     // Verificar se o beneficio de INSS já foi requerido.
     // Se sim, entao trazer os dados do INSS já preenchidos
     if qryBeneficio.FieldbyName('FlgReferencia').AsInteger = 0
     then begin
        if (BuscaDadosINSSEmVigor ( qryAux,
                                    iIdPessJur, iIdPlanoPrev, iIdTitular,
                                    qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                    FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                    sValorCalcINSS, sValorInfINSS, sDataInicioINSS,sNumProcINSS,
                                    sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                    sNumeroProcessoInss, sFlgPagaINSS )) and
           (StrToFloat(ClienteNumero(sValorCalcInss)) > 0 )
        then begin
           qryDet.FieldByName('VLRCALCINSS').AsString    := ClienteNumero(sValorCalcINSS);
           qryDet.FieldByName('VLRINFINSS').AsString     := ClienteNumero(sValorInfINSS);
           qryDet.FieldByName('DATAINICIOINSS').AsString := sDataInicioINSS;
           qryDet.FieldByName('NUMPROCINSS').AsString    := sNumProcINSS;
           qryDet.FieldByName('FLGPAGAINSS').AsString    := sFlgPagaINSS;


           reValorCalcInss.Text    := ClienteNumero(sValorCalcINSS);
           reValorInfINSS.Text     := ClienteNumero(sValorInfINSS);
           dtInicioINSS.Date       := StrToDate(sDataInicioINSS);
           dbedNumProcINSS.Text    := sNumProcINSS;
           reValorCalcINSS.Enabled := False;
           dbedNumProcINSS.Enabled := False;

           //caso o benef. do INSS seja requerido separadamente, este está com
           //outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
           //caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
           if (trim(sNumeroProcessoInss) <> '') and
              (StrToInt(sNumeroProcessoInss) <>  iNumeroProcesso) then
           begin
              with qryBenefReferencia do
              begin
                 Close;
                 ParamByName('IdTitular').Value       := iIdTitular;
                 ParamByName('SeqProposta').Value     := iSeqProposta;
                 ParamByName('IdPessJur').Value       := iIdPessJur;
                 ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
                 ParamByName('NumeroProcesso').Value  := StrToInt(sNumeroProcessoInss);
                 Open;
              end;
           end;
           //leofuncef - fim - 25/03/2003

        end
        else begin
           reValorCalcInss.Text    := '0';
           reValorInfINSS.Text     := '0';
           dbedNumProcINSS.Text    := '';

           reValorCalcINSS.Enabled := True;
           dbedNumProcINSS.Enabled := True;
        end;
     end;
  end
  else if not bAlgumElegivel
       then MsgDlg('Nenhum beneficiário foi aprovado pela regra de elegibilidade.','Informação',mtInformation,[mbOk],0);

end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbBeneficioExit(
  Sender: TObject);
var sDataInicio, sDataFinal, sMsgErro : string;
    bErro : boolean;
begin
  inherited;

  btn_SelecionaBeneficios.Enabled := True;

  // Verificar se este benefício já foi requerido para algum beneficiário
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 ');
                 //' AND    BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso));    // edilaine - SOL 253577-18129 / PPM 1303078
  qryAux.Open;
  if (not qryAux.IsEmpty)
     and (iNumeroProcesso <> qryAux.FieldByName('NumeroProcesso').AsInteger)    // edilaine - SOL 253577-18129 / PPM 1303078
  then begin
     if MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
            ' e está pendente de concessão. '+
            'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'. Deseja continuar ?',
            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        qryAux.Close;
        dblkpcmbBeneficio.Text := '';
        if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
           dblkpcmbBeneficio.SetFocus;
        Exit;
     end;
  end;

  { Atualizar Fonte Pagamento - SUPLEMENTAÇÃO  1 - INSS 2 }
  If (qryDet.Active) And (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) Then
    qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 1
  Else
    qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 2;

  lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

  // Preencher qual é o beneficio de referencia
  if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
  then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
  else iIdBenefReferencia  := -1;

  TiraSQL(qryAux);

  if trim(dblkpcmbBeneficio.text) = '' then
  begin
     bFlgApresentaDeficit := false;
     bFlgApresentaBSFAB   := false;

     AjustaTela();
  end;
end;

procedure TfrmCadRequerBenefBfciario.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  lblNomeBenef.caption := 'Benefícios';

  bbtnConfirmar.enabled := true;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := true;    // edilaine - SOL 253577-18129 / PPM 1303078
end;

procedure TfrmCadRequerBenefBfciario.bbtnCancelarDetClick(Sender: TObject);
begin
  bConfirmaConcessao := false;
  inherited;
  lblNomeBenef.caption := 'Benefícios';

  bbtnConfirmar.enabled := true;    // edilaine - SOL 253577-18129 / PPM 1303078
  bbtnCancelar.enabled  := true;    // edilaine - SOL 253577-18129 / PPM 1303078
end;

procedure TfrmCadRequerBenefBfciario.sbtnAltDetClick(Sender: TObject);
var iItem : Integer;
begin
  iIdChamaElegebilidade := 0; // Andre Imakawa - SIG 103584
  If (bFlgBenefMorte) And (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3)
   Then Begin
      MsgDlg('Este benefício está encerrado e não pode ser alterado.','Aviso',mtInformation,[mbOk],0);
      sbtnAltDet.Down := false;
      exit;
   End;

  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;

  inherited;

  if (not qryDet.Active) or (not qryEvento.Active) then Exit;


  PreencheDadosBeneficiario(qryDet.FieldByName('numeroprocesso').AsInteger,
                            qryDet.FieldByName('idtitular').AsInteger,
                            qryDet.FieldByName('idpessoa').AsInteger,
                            qryDet.FieldByName('idpessjur').AsInteger,
                            qryDet.FieldByName('idplanoprev').AsInteger,
                            qryDet.FieldByName('seqproposta').AsInteger);

  if qryDet.State = dsEdit
  then begin
     sBeneficioAnterior := IntToStr(qryDet.FieldByName('IdBeneficio').AsInteger);

     if qryRelBenefPart.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])
     then iIdCalculo := qryRelBenefPart.FieldByName('IDCALCULO').AsInteger;

  end;

  MatriculaBenefInicial := qryDepentit.fieldbyname('MATRICULA').AsString;  // Vinicius Ferreira SOL 159322 KINTANA 1308856

end;

procedure TfrmCadRequerBenefBfciario.sbtnInserirClick(Sender: TObject);
begin
  if qry.State = dsinsert then exit;
  inherited;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if dblkpcmbEvento.Text = '' then
  begin
    dblkpcmbEvento.Text  := qryEvento.FieldByName('Nome').AsString;
    dtDataEvento.Date    := StrToDate(sDataEvento);
    dtDataEvento.Enabled := False;
  end;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim
  
end;

function TfrmCadRequerBenefBfciario.ConverteBeneficioParaCotas(prValorReal : real) : real;
begin
  Result := 0;
  // Verificar e beneficio é em real ou em cotas
  if (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
  then begin
     frmAguarde.Mostra('Convertendo benefício em cotas ...');

     if qryBeneficio.FieldbyName('IndiceReajBenef').AsString = '' then
     begin
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
                    ' AND    (COTDATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtInicioFund.Date) + ''', ''DD/MM/YYYY'') ) ' + 
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;

     if qryAux.IsEmpty then
     begin
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
     if rValorDaCotaBenef = 0 then
     begin
       MsgDlg('O índice de conversão do valor do benefício está zerado. '+
              'Verifique no Cadastro de Cotações da Moeda.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
     end
     else
       Result  := prValorReal / rValorDaCotaBenef;
  end
  else
    Result := 0;
    
  frmAguarde.Apaga;
end; // ConverteBeneficioParaCotas

function TfrmCadRequerBenefBfciario.ConverteBeneficioParaReal(prValorCotas : real) : real;
begin
  Result := 0;
  // Verificar e beneficio é em real ou em cotas
  if (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
  then begin
     frmAguarde.Mostra('Convertendo benefício para Real  ...');

     if qryBeneficio.FieldbyName('IndiceReajBenef').AsString = '' then
     begin
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
                    ' AND    (COTDATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtInicioFund.Date) + ''', ''DD/MM/YYYY'') ) ' + // 24334
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;

     if qryAux.IsEmpty then
     begin
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
     sDataDaCotaBenef  := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime); // 24334

     // Converter de cota para real
     if rValorDaCotaBenef = 0 then
     begin
       MsgDlg('O índice de conversão do valor do benefício está zerado. '+
              'Verifique no Cadastro de Cotações da Moeda.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
     end
     else
       Result  := prValorCotas * rValorDaCotaBenef;
  end
  else
    Result := 0;

  frmAguarde.Apaga;
end; // ConverteBeneficioParaReal

procedure TfrmCadRequerBenefBfciario.reValorBeneficioMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Trim(dblkpcmbBeneficio.Text) = '' then Exit;

  // Se o beneficio estiver em branco, mostrar hint dizendo para digitar ou calcular
  if (Trim(reValorBeneficio.Text) = '') or (Trim(reValorBeneficio.Text) = '0')
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
  then reValorBeneficio.Hint := 'Valor em Real = '+FloatToStr(rValorReal)+
                                '. Cota Utilizada = '+ FormatFloat('#0.000000',rValorDaCotaBenef)+
                                ' em '+sDataDaCotaBenef+'.'
  else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';

end;

procedure TfrmCadRequerBenefBfciario.reValorBeneficioExit(Sender: TObject);
begin
  inherited;
  if (Trim(reValorBeneficio.Text) <> '') and (Trim(reValorBeneficio.Text) <> '0')
  then rValorReal  := StrToFloat(ClienteNumero(reValorBeneficio.Text))
  else rValorReal  := 0;
  bRecalculouProvisorio := True; 
end;

procedure TfrmCadRequerBenefBfciario.FormActivate(Sender: TObject);
begin
  if bAbriuOutroForm 
  then begin
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     PreencheDadosBeneficiario(iNumeroProcesso,iIdTitular,
                               qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                               iIdPessJur, iIdPlanoPrev, iSeqProposta);
     Exit;
  end;
  inherited;
end;


procedure TfrmCadRequerBenefBfciario.CalculaValorTotalBenef(tTipoCalculo : TTipoCalculo);
var rValorBeneficio,
    rValorReserva    : double;
    bErro            : boolean;
    sSQLBenefAssoc,
    sMsgErro         : string;
    iIdRegraCalculo  : longint;
    rVlrTotalTitular : double;      //edilaine WO18367
begin
  inherited;

  frmAguarde.Apaga;

  if (tTipoCalculo = tcViaDeficit) then   // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  begin
    //if (bFlgApresentaBSFAB) then
    //begin
    //  {RN17 - Ao calcular da base do déficit, caso os valores de BS e FAB não tenham sido calculados anteriormente apresentar crítica MSG06}
    //  if (reValorBS.Text = '') or (reValorFAB.Text = '') then
    //  begin
    //    MsgDlg('Para cálculo da base do déficit é necessário calcular o valor do BS e o valor do FAB. ','Informação',mtInformation,[mbOk],0);
    //    Exit;
    //  end;
    //end;

    if qryBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger <= 0 then
       Exit;

    iIdRegraCalculo := qryBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger;

    frmAguarde.Mostra('Regra de Cálculo do Déficit - Nº '+qryBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsString);

  end
  else
  begin
    if not VerificaCamposObrigREGRA then Exit;

    // Calcular valor total do beneficio
    if Trim(dblkpcmbBeneficio.Text) = '' then
    begin
      MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);

      If (dblkpcmbBeneficio.enabled) And
         (dblkpcmbBeneficio.visible) Then
        dblkpcmbBeneficio.SetFocus;

      Exit;
    end;

    if (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString) = '') or
       (qryBeneficio.FieldByName('IdRgValorTotal').AsInteger <= 0)      then
      Exit;
  end;   // edilaine - SOL 253577-17464 / PPM 955703 - fim

  // Executar o exit do calculo do inss para garantir que o valor informado do inss
  // foi preenchido antes de calcular o valor da suplementacao
  try
    reValorCalcInssExit(reValorTotal);
  except end;

  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  if tTipoCalculo = tcViaValorTotal then
  begin
    if sTipoFormChamador = 'SI' then
      if qryBeneficio.FieldByName('IdRegraSimula').AsInteger <= 0 then
        Exit
      else
        iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraSimula').AsInteger
    else
      iIdRegraCalculo := qryBeneficio.FieldByName('IdRgValorTotal').AsInteger;

    frmAguarde.Mostra('Regra de Cálculo do Total - Nº '+IntToStr(iIdRegraCalculo));
  end;
  // edilaine - SOL 253577-17464 / PPM 955703 - fim

  //limpa operações feitas na reserva para este benefício
  //retira erro de vários cálculos simultâneos
  if qryDet.FieldByName('FlgResgate').AsString = '1' then
  begin
    if not DevolveReserva( qryDet.FieldByName('IdBeneficio').AsInteger,
                           qryDet.FieldByName('IdPessoa').AsInteger) then
    begin
      MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
             'Para sua garantia o processo não será excluído até que o problema seja solucionado. '+
             'Verifique. ','Informação',mtInformation,[mbOk],0);
      TiraSQL(qryAux);
      frmAguarde.Apaga;
      Exit;
    end;
  end;

  // Executar regra de calculo da reserva para beneficio passando a query ReservaPart
  // que está com o valor abatido da reserva
  rValorReserva  := CalculaReservaParaBeneficio;
  sValorReserva  := FloatToStr(rValorReserva);
  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

  iIdEventoAux := qryBeneficio.FieldByName('IDEVENTOGERADOR').AsInteger;  //SOL 136385/7362 Kintana 1527997



  // Executar regra de calculo do beneficio
  try
    // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
    if (tTipoCalculo = tcViaDeficit) then
    begin
      sSQLBenefAssoc := MontaSQLBenefAssoc(qryDet.FieldByName('IDTITULAR').AsInteger);

      rValorBeneficio := ExecutaRegraCalculoDeficit(qryAux,
                                                iIdRegraCalculo,
                                                iIdPlanoPrev,    // iIdPlanoPrev,
                                                iIdPessJur,      // iIdPessJur,
                                                iIdPessoa,       // iIdPessoa,
                                                iIdTitular,      // iIdTitular,
                                                qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,    // IdBeneficio
                                                bErro,
                                                sMsgErro,
                                                iIdCalculo,
                                                rOpcao1,       // rOpcao1,
                                                rOpcao3,       // rOpcao1,
                                                sSQLBenefAssoc,
                                                StrToFloat(ClienteNumero(reValorBS.text)),
                                                StrToFloat(ClienteNumero(reValorTotal.text)),
                                                StrToFloat(ClienteNumero(reValorBeneficio.text)),
                                                StrToFloat(reValorInfINSS.Text),
                                                qryDet.FieldByName('PERCPROVISORIO').AsString,
                                                qryTitular.FieldByName('IDSITPLANOPREV').AsInteger,
                                                FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                                FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                                                qryBeneficio.FieldByName('IDPLANPREVCONTAB').AsInteger
                                               );

    end
    else // edilaine - SOL 253577-18064 / PPM 1240079 - fim
    begin

      //edilaine WO18367 : inicio
      rVlrTotalTitular := CarregaValorBsFabTitular(false);
      //edilaine WO18367 : fim

      rValorBeneficio := ExecutaRegraValorTotal(qryAux,
                                                iIdRegraCalculo,
                                                iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                iSeqProposta,
                                                iNumeroProcesso,
                                                qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                iNumBenef,
                                                rOpcao1, rOpcao2, rOpcao3,
                                                sSQLBenefAssoc,
                                                FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                                FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),
                                                FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),
                                                reValorCalcInss.Text,
                                                reValorInfINSS.Text,
                                                FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                                                sValorReserva,
                                                qryDet.FieldByName('VALORBINSSANT1').AsString,
                                                qryDet.FieldByName('VALORBINSSANT2').AsString,
                                                qryDet.FieldByName('VALORBINSSANT3').AsString,
                                                bErro,
                                                sMsgErro,
                                                iIdCalculo,
                                                1,
                                                qryDet.FieldByName('DibBenefAnt').AsString,
                                                qryDet.FieldByName('ValorBenefAnt').AsString,
                                                StrToFloat(ClienteNumero(reValorSRB.Text)),
                                                qryDet.FieldByName('IdPessoa').AsInteger,//-1, //Renato Visoni SOL 124056 Kintana 665262

                                                1,//-1,                                        //Renato Visoni SOL 124056 Kintana 665262
                                                qryDet.FieldByName('FLGPROVISORIO').AsInteger,
                                                qryDet.FieldByName('PRAZOPROVISORIO').AsInteger,
                                                qryDet.FieldByName('PERCPROVISORIO').AsFloat,
                                                FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAREQUERIMENTO').AsDateTime),
                                                '',
                                                -1,
                                                iIdEventoAux, //SOL 136385/7362 Kintana 1527997
                                                StrToFloat(ClienteNumero(reValorFAB.text)),          // edilaine - SOL 253577-17464 / PPM 955703
                                                StrToFloat(ClienteNumero(reValorBS.text))            // edilaine - SOL 253577-17464 / PPM 955703
                                                ,rVlrTotalTitular                                    // edilaine WO18367
                                               );
      end;

  except
     frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;

  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  if (tTipoCalculo = tcViaDeficit) and (bErro) then
  begin
    sMsgErro := StringReplace(sMsgErro, 'Valor Total do Benefício', 'Déficit', [rfReplaceAll]);
  end;
  // edilaine - SOL 253577-17464 / PPM 955703 - fim

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorTotal.Text := '0';
    Exit;
  end;

  // edilaine - SOL 253577-17464 / PPM 955703 - incio
  //if (tTipoCalculo = tcViaDeficit) and (bErro) then
  if (tTipoCalculo = tcViaDeficit)  then
     reValorDeficit.text := FormatFloat('#0.00',rValorBeneficio)
  else
  begin
    // So formatar se o valor nao for em cota
    if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 0 then
      reValorTotal.Text := FormatFloat('#0.00',rValorBeneficio)
    else
      reValorTotal.Text := FormatFloat('#0.000000',rValorBeneficio)
  end;
  // edilaine - SOL 253577-17464 / PPM 955703 - fim
end;


procedure TfrmCadRequerBenefBfciario.reValorTotalBtnClick(Sender: TObject);
var
  rValorTotalTit : double;     //edilaine WO18367
begin

  CalculaValorTotalBenef(tcViaValorTotal);   // edilaine - SOL 253577-17464 / PPM 955703

end;


procedure TfrmCadRequerBenefBfciario.reValorDeficitBtnClick(Sender: TObject);
begin

  CalculaValorTotalBenef(tcViaDeficit);   // edilaine - SOL 253577-17464 / PPM 955703

end;


procedure TfrmCadRequerBenefBfciario.reValorTotalExit(Sender: TObject);
begin
  inherited;
  sValorTotal := OraNumero(Trim(reValorTotal.Text));

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1 then
    rValorCotas  := StrToFloat(ClienteNumero(sValorTotal))
  else
    rValorCotas := 0;
end;

procedure TfrmCadRequerBenefBfciario.reValorCalcInssExit(Sender: TObject);
begin
  inherited;
  if (Trim(reValorInfINSS.Text) = '') or (StrToFloat(ClienteNumero(reValorInfINSS.Text)) <= 0)
  then reValorInfINSS.Text := reValorCalcINSS.Text;
  sValorCalcInss := OraNumero(Trim(reValorCalcInss.Text));
end;

procedure TfrmCadRequerBenefBfciario.reValorInfINSSExit(Sender: TObject);
var sSQL,
    sAnoMesInicioINSS,
    sAnoMesInicioFundacao,
    sAnoMesAtual,
    sValorRegra,
    sValorAtual,
    sMsgErro : string;
    rValorRegra : double;
    bErro : boolean;

begin
  inherited;

  //mudar a cor do edit caso o valor seja diferente do calculado
  if Trim(reValorInfINSS.Text) <> Trim(reValorCalcINSS.Text)
  then reValorInfINSS.Color := clRed
  else reValorInfINSS.Color := clWindow;

end;

procedure TfrmCadRequerBenefBfciario.dbrgrpBenefProvisorioClick(
  Sender: TObject);
begin
  inherited;
  if dbrgrpBenefProvisorio.ItemIndex = 0
  then begin
    lblPercConc.Visible   := False;
    dbedPercConc.Visible  := False;
    lblPercent.Visible    := False;
    lblPrazoProv.Visible  := False;
    dbedPrazoProv.Visible := False;
    lblMesProv.Visible    := False;
    pnlBenefProv.width    := 148;   // edilaine - SOL 253577-17374 / PPM 848182
  end
  else begin
    lblPercConc.Visible   := True;
    dbedPercConc.Visible  := True;
    lblPercent.Visible    := True;
    lblPrazoProv.Visible  := True;
    dbedPrazoProv.Visible := True;
    lblMesProv.Visible    := True;
    pnlBenefProv.width    := 388;   // edilaine - SOL 253577-17374 / PPM 848182
    if (dsDet.DataSet.State = dsInsert) and (Trim(dbedPrazoProv.Text) = '')
    then begin
       dbedPrazoProv.Text := qryBeneficio.FieldByName('PrazoProvisorio').AsString;
       qryDet.FieldByName('PrazoProvisorio').AsInteger := qryBeneficio.FieldByName('PrazoProvisorio').AsInteger;
    end;
  end;
  AjustaTela();  // edilaine - SOL 253577-17374 / PPM 848182
end;

procedure TfrmCadRequerBenefBfciario.dbedPrazoProvExit(Sender: TObject);
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
  sDataFinal    := CalculaDataAposPrazo(dtDataInicio.Text,iPrazoEmMeses);

  if (Trim(dtDataFinal.Text) <> '') and
     (Trim(dtDataFinal.Text) <> sDataFinal)
  then begin
    if MsgDlg('A data final informada até o momento não coincide com o prazo informado : '+
              ' [Data Informada - '+Trim(dtDataFinal.Text)+ ' e  '+
              ' Data após Prazo - '+sDataFinal+']. '+
              ' Confirma o Prazo ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
    then begin
       dbedPrazoProv.Text := '';
       dbedPrazoProv.SetFocus;
       Exit;
    end
    else if Trim(sDataFinal) <> ''
         then dtDataFinal.Date := StrToDate(sDataFinal);
  end
  else if Trim(sDataFinal) <> ''
       then dtDataFinal.Date := StrToDate(sDataFinal);

end;

function TfrmCadRequerBenefBfciario.ConfirmaBeneficio : boolean;
begin
   Result := False;

   //MostraDemonstrativoConcessao;        // edilaine - SOL 253577-17464 / PPM 955703 - comentado

   sParametrosDemonstra := ''; // edilaine - SOL 253577-17464 / PPM 955703
   GeraDemonstrativo();        // edilaine - SOL 253577-17464 / PPM 955703

   //Higor Nayde SOL - 173938 KINTANA - 1627112 inicio
   if MsgDlg('Deseja confirmar os resultados da concessão ?','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
   then begin
       Result := False;
       bConfirmaConcessao := false;
       qryDet.first;
   end
   else
    begin
////Douglas.Siqueira SOL=163064 Kintana= 1388980

  if (sbtnInserir.Enabled=FALSE )and (bConcedeuBeneficio) then
//  if (sbtnConceder.Enabled )and (bConcedeuBeneficio) then
     begin
     Qrydet.First;
     while not Qrydet.Eof do
        begin
           if (Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 1) and (Qrydet.FieldByName('FONTEPAGADORA').AsInteger = 1) then //FUNCEF
           begin
              if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>1) and (qrydet.FieldbyName('datafinal').Asstring = '') //SOL 201131 Kintana 1944161
              then
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
                 if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>1) and (qrydet.FieldbyName('datafinal').Asstring = '') // SOL 201131 Kintana 1944161
                 then  begin
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                    if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                    bbtnCancelarClick(Self);
                    Exit;
                 end;
              end
              else
              begin
                 if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>2) {or (qry.FieldbyName('IdSitProcesso').AsInteger<>2) } // SOL 201131 Kintana 1944161
                 then  begin
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
                 if (QryDet.FieldByName('IdSitBeneficio').AsInteger<>3)
                   and (QryDet.FieldbyName('resgateparcelado').AsInteger<>1)   // SOL 209659 Kintana 2022632
                   then  begin
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                    if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                       dtmBaseDados.dbBaseDados.RollBack;


                    bbtnCancelarClick(Self);
                    Exit;
                    end
                 end
              else
              // Andre Imakawa - SIG 103584 - Inicio
              begin
                if qryBeneficio.Locate('IDBENEFICIO',qryDet.FieldByName('IdBeneficio').AsInteger,[]) then
                begin
                  if qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger <> 27096 then
                    if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>3) then
                    begin
                       MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                       if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                          dtmBaseDados.dbBaseDados.RollBack;


                       bbtnCancelarClick(Self);
                       Exit;
                    end;
                end
                else
                begin
                  if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>3) then
                  begin
                     MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                     if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                        dtmBaseDados.dbBaseDados.RollBack;


                     bbtnCancelarClick(Self);
                     Exit;
                  end;
                end;

              // Andre Imakawa - SIG 103584 - Fim              
              end;
           end;

        Qrydet.next;
        end;/// fim do while

     end;
////fim.Douglas.Siqueira SOL=163064 Kintana= 1388980
        //MostraDemonstrativoConcessao(True, FormatDateTime('hh:nn:ss',now));    // edilaine - SOL 253577-17464 / PPM 955703

        Result := True;
        bConfirmaConcessao := true;
    end;
    //Higor Nayde SOL - 173938 KINTANA - 1627112 Fim
end; // ConfirmaBeneficio


procedure TfrmCadRequerBenefBfciario.MostraDemonstrativoConcessao(const homologado :Boolean; const HoraHomologacao: String);//Higor Nayde SOL - 173938 KINTANA - 1627112
var sFormato, sAnoMesAtual, sRecebedorAtual, sSQL : string;
    iIdRecebedorAtual             : longint;
    dValorIntegralNaDib,
    dValorTotalNaDib              : double;
    iIdBeneficio, iBenefNaoPeculio : Integer;
    sPlano : String; //Renato Visoni SOL 146984/3021 Kintana 1031393
    //Renato Visoni SOL 151915 Kintana 1121526
    fVlrINSS : double;
    fValorTotalBeneficio : double;
    fValorRateado : double;
    fValorInformado : double;
    //Renato Visoni SOL 151915 Kintana 1121526

    //SOL 185498 Kintana 1739628 Otacilio ** Inicio **
    // Caso ao conceder seja mais de um Beneficio então guardar o ID dos
    // demais atualmente so pegava o ultimo benefico para o demonstrativo.
      sIDBeneficio: string;
    //SOL 185498 Kintana 1739628 Otacilio ** Fim **
begin
   //SOL 185498 Kintana 1739628 Otacilio ** Inicio **
   sIDBeneficio := '';

   frmAguarde.Mostra('Preparando o Demonstrativo da Concessão...');

   if not qryTitular.Active
   then begin
     qryTitular.Close;
     qryTitular.ParamByName('IdPessoa').Value    := iIdTitular;
     qryTitular.ParamByName('IdPessJur').Value   := iIdPessJur;
     qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
     qryTitular.ParamByName('SeqProposta').Value := iSeqProposta;
     qryTitular.Open;
   end;

   qryAux.Close;

   If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);

   frmMostraAux.Caption := 'Resumo da Concessão de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('-----------------------------------------------------------------------------------------------------');
      Add(PreparaStr('                                DEMONSTRATIVO DE CONCESSÃO',72)+'- VERSÃO            : '+Sistema.Versao);
      Add(PreparaStr(' '                                                         ,72)+'  LOTE              : '+IntToStr(iIdLoteConcessao));
      Add(PreparaStr('USUÁRIO : '+Sistema.NomeUsuario                            ,72)+'  DATA DA CONCESSÃO : '+FormatDateTime('dd/mm/yyyy', date));
      Add('-----------------------------------------------------------------------------------------------------');
      Add('Participante         : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add('Data de Nascimento   : '+qryTitular.FieldByName('DataNasc').AsString);
      Add('Data do Falecimento  : '+qryTitular.FieldByName('DataMorte').AsString);
      Add('-----------------------------------------------------------------------------------------------------');

      Add(PreparaStr('Patrocinadora        : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString,50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString,50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString,50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

         Add('-----------------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qry.FieldbyName('NumeroProcesso').AsString);
      Add('EVENTO : '+Trim(dblkpcmbEvento.Text)+ ' - DATA : '+ FormatDateTime('dd/mm/yyyy', dtDataEvento.Date)); 
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS CONCEDIDOS :');

      // FUNCEF - Abrir query com total por recebedor para demonstrar no final
      qryTotalRecebedor.Close;
      qryTotalRecebedor.ParamByName('IdPessoa').AsInteger := -1;
      qryTotalRecebedor.Open;

      qryDet.First;
      iBenefNaoPeculio := 0;
      while not qryDet.Eof do
      begin
         Add('-----------------------------------------------------------------------------------------------------');
         Add('     => '+qryDet.FieldByName('Nome').AsString+ ' para '+ qryDet.FieldByName('Depen').AsString);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+ IntToStr(qryDet.FieldByName('IdResponsavel').AsInteger) );
         qryAux.Open;

         if qryAux.FieldByName('NOME').AsString = ''
         then begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+ IntToStr(qryDet.FieldByName('IdPessoa').AsInteger) );
            qryAux.Open;
         end;
         Add('        Recebedor : '+qryAux.FieldByName('Nome').AsString);

         if qryTotalRecebedor.Locate('IdPessoa',qryDet.FieldByName('IdResponsavel').AsInteger,[])
         then begin
            qryTotalRecebedor.Edit;
            qryTotalRecebedor.FieldByName('Total').AsFloat := qryTotalRecebedor.FieldByName('Total').AsFloat + qryDet.FieldByName('VALORATUAL').AsFloat;
            qryTotalRecebedor.Post;
         end
         else begin
            qryTotalRecebedor.Insert;
            qryTotalRecebedor.FieldByName('IdPessoa').AsInteger := qryDet.FieldByName('IdResponsavel').AsInteger;
            qryTotalRecebedor.FieldByName('Nome').AsString      := qryAux.FieldByName('Nome').AsString;
            qryTotalRecebedor.FieldByName('Total').AsFloat      := qryDet.FieldByName('VALORATUAL').AsFloat;
            qryTotalRecebedor.Post;
         end;

         // Vinicius Ferreira SOL 164346 Kintana 1410789 - INICIO
         {
         //Renato Visoni SOL 151915 Kintana 1121526
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT VLRCALCINSS,VALORTOTAL,VALORATUAL,VLRINFINSS FROM BENEFBFCIARIO');
         qryAux.SQL.Add(' WHERE NUMEROPROCESSO = ' + qryDet.FieldByName('NumeroProcesso').asString);
         qryAux.SQL.Add('AND IDPESSJUR = '  + qryDet.FieldByName('IDPESSJUR').asString);
         qryAux.SQL.Add('AND IDTITULAR = '  + qryDet.FieldByName('IDTITULAR').asString);
         qryAux.SQL.Add('AND IDPLANOPREV ='  + qryDet.FieldByName('IDPLANOPREV').asString);
         qryAux.SQL.Add('AND IDPESSOA = '   + qryDet.FieldByName('IDPESSOA').asString);
         qryAux.SQL.Add('AND SEQPROPOSTA = '+ qryDet.FieldByName('SEQPROPOSTA').asString);
         qryAux.SQL.Add('AND IDBENEFICIO = '+ qryDet.FieldByName('IDBENEFICIO').asString);
         qryAux.Open;

         fVlrINSS              := qryAux.FieldByname('VLRCALCINSS').asFloat;
         fValorTotalBeneficio  := qryAux.FieldByname('VALORTOTAL').asFloat;
         fValorRateado         := qryAux.FieldByname('VALORATUAL').asFloat;
         fValorInformado       := qryAux.FieldByname('VLRINFINSS').asFloat;
         //Renato Visoni SOL 151915 Kintana 1121526
         }
         fVlrINSS              := qryDet.FieldByname('VLRCALCINSS').asFloat;
         fValorTotalBeneficio  := qryDet.FieldByname('VALORTOTAL').asFloat;
         fValorRateado         := qryDet.FieldByname('VALORATUAL').asFloat;
         fValorInformado       := qryDet.FieldByname('VLRINFINSS').asFloat;
         // Vinicius Ferreira SOL 164346 Kintana 1410789 - FIM

         Add(' ');
         Add('        '+ PreparaStr('Data de Requerimento : '+qryDet.FieldByName('DataRequerimento').AsString, 50)+
                         PreparaStr('Data de Concessão : '+FormatDateTime('dd/mm/yyyy', date), 49));  // 24334

         Add('        '+ PreparaStr('Data de Início no INSS : '+qryDet.FieldByName('DataInicioINSS').AsString,50)+
                         PreparaStr('Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString, 49));

      //Renato Visoni SOL 151915 Kintana 1121526
      //   Add('        '+ PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRCALCINSS').AsFloat),50)+
      //                   PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRINFINSS').AsFloat), 49));
           Add('        '+ PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', fVlrINSS),50)+
                         PreparaStr('Informado = R$ '+FormatFloat('#0.00', fValorInformado), 49));
      //Renato Visoni SOL 151915 Kintana 1121526




         dValorIntegralNaDib := PegaValorIntegral( dtmAPrev.qry,
                                                   iNumeroProcesso,
                                                   qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                   qryDet.FieldByName('IDPESSOA').AsInteger,
                                                   qryDet.FieldByName('DATAINICIOFUND').AsString );

         dValorTotalNaDib    := PegaValorTotal   ( dtmAPrev.qry,
                                                   iNumeroProcesso,
                                                   qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                   qryDet.FieldByName('IDPESSOA').AsInteger,
                                                   qryDet.FieldByName('DATAINICIOFUND').AsString );

         //Renato Visoni SOL 151915 Kintana 1121526
	 //Add('        '+ PreparaStr('Valor Total do Benefício = R$ '+FormatFloat('#0.00', dValorTotalNaDib) ,50)+
         //                PreparaStr('Data Início Pagamento : '+qryDet.FieldByName('DataInicio').AsString, 49));
         // Add('        '+ PreparaStr('Valor Rateado do Benefício = R$ '+FormatFloat('#0.00', dValorIntegralNaDib),50));

         Add('        '+ PreparaStr('Valor Total do Benefício = R$ '+FormatFloat('#0.00', fValorTotalBeneficio) ,50)+


                         PreparaStr('Data Início Pagamento : '+qryDet.FieldByName('DataInicio').AsString, 49));
         Add('        '+ PreparaStr('Valor Rateado do Benefício = R$ '+FormatFloat('#0.00', fValorRateado),50));
         //Renato Visoni SOL 151915 Kintana 1121526
         Add('-----------------------------------------------------------------------------------------------------');

         if (qryDet.FieldByName('FLGPECULIO').AsInteger <> 1) then   // SOL 163521/6401 Kintana 1412085
         begin
            inc(iBenefNaoPeculio);
         end; // SOL 163521/6401 Kintana 1412085

         //SOL 185498 Kintana 1739628 Otacilio ** Inicio **
           sIDBeneficio := sIDBeneficio +  qryDet.FieldByName('IDBENEFICIO').AsString + ',';
         //SOL 185498 Kintana 1739628 Otacilio ** Fim **

         qryDet.Next;
      end; // while not qryDet.Eof

       //SOL 185498 Kintana 1739628 Otacilio ** Inicio **
       sIDBeneficio := Copy(sIDBeneficio, 1, Length(sIDBeneficio) - 1);
       //SOL 185498 Kintana 1739628 Otacilio ** Fim **

      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS A PAGAR                                                                                ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT DECODE(P.NOME , NULL, BENEF.NOME, P.NOME) AS RECEBEDOR, BP.FLGCALCTODOMES,                      '+
                 '        DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF) AS FLGISENTOIRRF,                '+
                 '        DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL) AS IDRESPONSAVEL,           '+

                 '        BTIT.IDPESSOA, '+
                 '        DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB) AS VALORSRB, '+
                 '        B.NOME, H.MESREFERENCIA, H.FLGDEVOLUCAO, ' +
                 '        SUM(H.VALORPREV) AS VALORPREV , SUM(H.VALORINTEGRAL) AS VALORINTEGRAL,'+
                 '        BP.FLGREFERENCIA, BF.DATAINICIOFUND '+

                 //Renato Visoni SOL 146984/3021 Kintana 1031393
                 ' ,(SELECT BF.IDPLANPREVCONTAB ' +
                 ' FROM BENEFBFCIARIO BF       ' +
                 ' WHERE BF.IDPLANOPREV    = H.IDPLANOPREV ' +
                 '  AND BF.IDBENEFICIO    = H.IDBENEFICIO  ' +
                 '  AND BF.NUMEROPROCESSO = H.NUMEROPROCESSO  ' +
                 '  AND BF.IDPESSJUR      = H.IDPESSJUR       ' +
                 '  AND BF.IDTITULAR      = H.IDTITULAR       ' +
                 '  AND BF.IDPLANOORIGEM  = H.IDPLANOORIGEM   ' +
                 '  AND BF.IDPESSOA       = H.IDPESSOA        ' +
                 '  AND BF.SEQPROPOSTA    = H.SEQPROPOSTA     ' +
                 '  AND ROWNUM = 1) AS CODIGO                 ' +
                 //Renato Visoni SOL 146984/3021 Kintana 1031393

                 ' FROM   PESSOA BENEF, PESSOA P, PESSOAFISICA PFBENEF, PESSOAFISICA PF, BENEFICIO B, BENEFPLANPREV BP,   '+
                 '        BFCIARIOTITPLAN BTIT, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)      +
                 '   AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)            +
                 '   AND    H.IDPLANOORIGEM    = '+IntToStr(iIdPlanoPrev)          +
                 '   AND    H.IDTITULAR        = '+IntToStr(iIdTitular)            +
                 '   AND    H.SEQPROPOSTA      = 1                                '+
                 '   AND    H.IDMOTIVO         <> '+IntToStr(prmIdMotDevolNaoIden) +
                 '   AND    H.FLGENVIADO       = 0 '+

                 //SOL 185498 Kintana 1739628 Otacilio ** Inicio **
                 // Thiago Melo SOL 181961 Kintana 1689872
                 //  '   AND    H.IDBENEFICIO      = ' + qryDet.FieldByName('IDBENEFICIO').AsString +
                 '   AND    H.IDBENEFICIO      IN ( ' + Trim(sIDBeneficio) + ' )' +
                 // Thiago Melo SOL 181961 Kintana 1689872
                 //SOL 185498 Kintana 1739628 Otacilio ** Fim **

                 '   AND    B.IDBENEFICIO      = H.IDBENEFICIO                    '+
                 '   AND    BF.NUMEROPROCESSO  = H .NUMEROPROCESSO                ');
         //if iBenefNaoPeculio = 0 then   // SOL 163521/6401 Kintana 1412085 // SOL 231025 PPM 363636
         begin
            SQL.Add('   AND    H.NUMEROPROCESSO = '+ qry.FieldbyName('NumeroProcesso').AsString + ' '); //Fanuel Junior SOL 163521 Kintana 1396877
         end;  // SOL 163521/6401 Kintana 1412085
         SQL.Add('   AND    BF.IDPLANOORIGEM   = H.IDPLANOORIGEM                  '+
                 '   AND    BF.IDPLANOPREV     = H.IDPLANOPREV                    '+
                 '   AND    BF.IDPESSJUR       = H.IDPESSJUR                      '+
                 '   AND    BF.IDTITULAR       = H.IDTITULAR                      '+
                 '   AND    BF.IDPESSOA        = H.IDPESSOA                       '+
                 '   AND    BF.SEQPROPOSTA     = H.SEQPROPOSTA                    '+
                 '   AND    BF.IDBENEFICIO     = H.IDBENEFICIO                    '+
                 '   AND    BTIT.IDPESSJUR     = BF.IDPESSJUR                     '+
                 '   AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV                   '+
                 '   AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM                 '+
                 '   AND    BTIT.IDTITULAR     = BF.IDTITULAR                     '+
                 '   AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA                   '+
                 '   AND    BTIT.IDPESSOA      = BF.IDPESSOA                      '+
                 '   AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO                   '+
                 '   AND    BENEF.IDPESSOA     = BTIT.IDPESSOA                    '+
                 '   AND    PFBENEF.IDPESSOA   = BTIT.IDPESSOA                    '+
                 '   AND    P.IDPESSOA(+)      = BTIT.IDRESPONSAVEL               '+
                 '   AND    PF.IDPESSOA(+)     = BTIT.IDRESPONSAVEL               '+
                 '   AND    BP.IDPLANOPREV     = H.IDPLANOPREV                    '+
                 '   AND    BP.IDBENEFICIO     = H.IDBENEFICIO                    '+
                 ' GROUP BY '+
                 '   DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                 '   BP.FLGCALCTODOMES, '+
                 '   DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF), '+
                 '   DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL), '+
                 '   BTIT.IDPESSOA,    '+
                 '   H.VALORSRB,       '+
                 '   B.NOME,           '+
                 '   H.MESREFERENCIA,  '+
                 '   H.FLGDEVOLUCAO,   '+
                 '   BP.FLGREFERENCIA, '+
                 '   BF.DATAINICIOFUND '+

                 '   ,H.IDPLANOPREV,H.IDPESSOA,H.IDBENEFICIO,H.NUMEROPROCESSO,H.IDPLANOORIGEM,H.IDPESSJUR,H.IDTITULAR,H.SEQPROPOSTA '+ //Renato Visoni SOL 146984/3021 Kintana 1031393

                 'ORDER BY  '+
                 ' DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                 ' H.FLGDEVOLUCAO, '+
                 ' B.NOME, '+
                 ' H.MESREFERENCIA ');
         Open;
         First;

         if FieldByName('FLGCALCTODOMES').AsInteger = 0 then
           sFormato := '#0.00'
         else
           sFormato := '#0.0000';

         sRecebedorAtual   := '';
         iIdRecebedorAtual := -1;

         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            if FieldByName('FLGISENTOIRRF').AsInteger = 0
            then Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                     PreparaStr('Isento de Imposto de Renda : Não ', 49))
            else Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                     PreparaStr('Isento de Imposto de Renda : Sim ', 49));

            Add('MÊS     ITEM                                PAGAR      DESCONTAR [INTEGRAL]  SRB  PLANO CONTAB'); //Renato Visoni SOL 146984/3021 Kintana 1031393

            // Mostrar os beneficios deste recebedor
            sPlano := ''; //Renato Visoni SOL 146984/3021 Kintana 1031393
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDEVOLUCAO').AsInteger = 0
               then Add(PreparaStr(FieldByName('MesReferencia').AsString                            ,8)+
                        PreparaStr(FieldByName('Nome').AsString                                     ,34)+
                        ' '+PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,12)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                    ,10)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorIntegral').AsFloat) ,11)+
                        PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat)        ,11)+
                        PreparaStr(FieldByName('CODIGO').AsString                                   ,10))//Renato Visoni SOL 146984/3021 Kintana 1031393
               else Add(PreparaStr(FieldByName('MesReferencia').AsString                        ,8)+
                        PreparaStr(FieldByName('Nome').AsString                                 ,34)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,12)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,10)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,11)+
                        PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat)    ,11)+
                        PreparaStr(FieldByName('CODIGO').AsString                               ,10));//Renato Visoni SOL 146984/3021 Kintana 1031393

               //Renato Visoni SOL 146984/3021 Kintana 1031393
               if sPlano = '' then begin
                 sPlano := FieldByName('CODIGO').AsString;
               end else begin
                 sPlano := sPlano+','+FieldByName('CODIGO').AsString;
               end;
               //Renato Visoni SOL 146984/3021 Kintana 1031393

               Next;
            end; // while 2

            { Exibir memória de calculo caso exista }
            sSQL := 'SELECT '+
                    '  DET.IDCALCULO,   DET.IDDETCALCULO, DET.DESCRICAO, DET.VALOR, '+
                    '  BEN.IDBENEFICIO, BEN.NOME AS NOMEBENEFICIO '+
                    'FROM   '+
                    '  DETCALCULO DET,    CALCULO CAL,  RELBENEFPART REL, '+
                    '  BENEFPLANPREV BPP, BENEFICIO BEN                   '+
                    'WHERE '+
                    '  REL.IDPESSJUR   = '+ IntToStr( iIdPessJur )         +' AND '+
                    '  REL.IDPLANOPREV = '+ IntToStr( iIdPlanoPrev )       +' AND '+
                    '  REL.IDPESSOA    = '+ IntToStr( QryAux.FieldByName('IDPESSOA').AsInteger ) +' AND '+
                    '  REL.NUMEROPROCESSO = '+ IntToStr( iNumeroProcesso ) +' AND '+

                    '  DET.IDCALCULO = CAL.IDCALCULO AND '+
                    '  DET.IDCALCULO = REL.IDCALCULO AND '+

                    '  REL.IDPLANOPREV = BPP.IDPLANOPREV AND '+
                    '  REL.IDBENEFICIO = BPP.IDBENEFICIO AND '+

                    '  BPP.IDBENEFICIO = BEN.IDBENEFICIO  '+

                    'ORDER BY '+
                    '  BEN.NOME, REL.IDCALCULO, DET.IDDETCALCULO ';

            If FazQuery( DtmAPrev.QryAux, ssQL ) Then Begin

              Add(' ');
              Add('   => MEMÓRIA DE CÁLCULO ');
              Add(' ');
              Add('   DESCRIÇÃO                                                                  VALOR       ');

              While Not DtmAPrev.QryAux.Eof Do Begin

                Add( ' ' );

                iIdBeneficio := DtmAPrev.QryAux.FieldByName('IDBENEFICIO').AsInteger;

                While ( iIdBeneficio = DtmAPrev.QryAux.FieldByName('IDBENEFICIO').AsInteger ) And
                      ( Not DtmAPrev.QryAux.Eof )
                Do Begin

                  Add( '   '+PreparaStr( DtmAPrev.QryAux.FieldByName('DESCRICAO').AsString, 70 )+
                       PreparaStr( ' ', 05 )+
                       PreparaStr( DtmAPrev.QryAux.FieldByName('VALOR').AsString, 30 )
                     );

                  DtmAPrev.QryAux.Next;

                End; { While Not QryAux.Eof Do Begin }

              End; { While Not QryAux.Eof Do Begin }

            End; { If FazQuery( }
            Add(' ');




         end; // while 1
      end;

      //SOL 152279 Kintana 1130835
      {// Mostrar acertos de tratamento pos-morte
      Add('----------------------------------------------------------------------------------------------------');
      Add('=> ACERTOS DE BENEFÍCIOS DO TITULAR                                                                 ');
      Add('----------------------------------------------------------------------------------------------------');
      Add(' ');

      // Buscar ACERTOS
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT P.NOME  AS RECEBEDOR, T.IDPESSOA AS IDRESPONSAVEL,                        '+
                 '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) AS NOME,   '+
                 '        T.MESREFERENCIA,                                                          '+
                 '        T.FLGDESCONTO,  SUM(T.VALOR) AS VALORPREV                                 '+
                 ' FROM   PESSOA P, TMPDESC T, PROVDESC PV                                          '+
                 ' WHERE  T.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    T.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    T.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    T.IDTITULAR        = '+IntToStr(iIdTitular)+
                 ' AND    T.IDPESSOA         <> T.IDTITULAR                                          '+
                 ' AND    T.SEQPROPOSTA      = 1                                                     '+
                 ' AND    PV.IDPROVENTO      = T.IDPROVENTO                                          '+
                 ' AND    P.IDPESSOA         = T.IDPESSOA                                            '+
                 ' AND    T.NUMRECEBIMENTO   IS NULL ');

         If Trim(sIdBeneficiarioEncerrado) <> ''
         Then SQL.Add(' AND    T.IDPESSOA NOT IN ('+sIdBeneficiarioEncerrado+')');

         SQL.Add(' GROUP BY P.NOME  , T.IDPESSOA , '+
                 '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC), '+
                 '        T.MESREFERENCIA, T.FLGDESCONTO '+
                 ' ORDER BY T.IDPESSOA,  T.MESREFERENCIA, DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) ');
         Open;

         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            Add(' - RECEBEDOR : '+sRecebedorAtual);
            Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
            // Mostrar os beneficios deste recebedor
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDESCONTO').AsInteger = 0
               then Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15))
               else Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15));
               Next;
            end; // while 2
         end; // while 1
      end; }
      //SOL 152279 Kintana 1130835

      // Mostrar acertos de tratamento pos-morte
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> CONTRIBUIÇÕES DO PENSIONISTA                                                                   ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');
      // Buscar ACERTOS
      with qryAux do
      begin
         Close;
         SQL.Clear;

         { Voltar consulta da HSTCONTRIBPREV e unir com TMPDESC }

         sSQL := ' SELECT DISTINCT 1 AS TIPO, P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL,   '+
                 '        CO.NOME,   H.MESREFERENCIA, H.VALORESPERADO AS VALORPREV, H.FLGDEVOLUCAO '+
                 ' FROM   PESSOA P, HSTCONTRIBPREV H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT, benefbfciario bf         '+
                 ' WHERE  bf.fontepagadora = 1              '+
                 ' and    bf.IDPESSJUR    =  H.IDPESSJUR      '+
                 ' AND    bf.IDPLANOPREV  =     H.IDPLANOPREV  '+
                 ' AND    bf.SEQPROPOSTA  =     H.SEQPROPOSTA   '+
                 ' AND    bf.IDPESSOA     =     H.IDPESSOA       '+
                 ' AND    bf.IDBENEFICIO  =     BT.IDBENEFICIO    '+
                 ' AND    H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 //' AND    H.IDPESSOA         =  BT.IDRESPONSAVEL '+ // Xavier/Tiago   em BSB SOL 232043 PPM 396781
                 ' AND    H.SEQPROPOSTA      = 1        '+
                 ' AND    BT.IDPESSJUR  =  H.IDPESSJUR '+
                 ' AND    BT.IDPLANOPREV = H.IDPLANOPREV '+
                 ' AND    BT.IDTITULAR =   '+IntToStr(iIdTitular)+' '+
                 ' AND    BT.IDBENEFICIO   IN ( ' + Trim(sIDBeneficio) + ' )' + // SOL 231025 PPM 363636
                 ' AND    BT.SEQPROPOSTA =  1 '+
                 ' AND    CO.IDCONTRIBUICAO    = H.IDCONTRIBUICAO        '+
                 ' AND    H.IDPESSOA         =  P.IDPESSOA  '+
                 ' AND    P.IDPESSOA         =  '+qryDet.FieldByName('IDPESSOA').AsString+ // SOL 231025 PPM 363636
                 ' ORDER BY H.MESREFERENCIA ';


         //Renato Visoni SOL 152279 Kintana 1130835
         {
         sSQL := sSQL +
                 ' UNION ALL ';

         sSQL := sSQL +
                 ' SELECT DISTINCT 2 AS TIPO,  P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL, '+
                 '        CO.NOME,   H.MESREFERENCIA, H.VALOR AS VALORPREV ,  DECODE(H.FLGATRASODEVOL,''D'' , 1, 0) FLGDEVOLUCAO '+
                 ' FROM   PESSOA P, TMPDESC H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT  '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDPESSOA         = BT.IDRESPONSAVEL '+
                 ' AND    H.SEQPROPOSTA      = 1        '+
                 ' AND    BT.IDPESSJUR       = H.IDPESSJUR '+
                 ' AND    BT.IDPLANOPREV     = H.IDPLANOPREV '+
                 ' AND    BT.IDTITULAR       = '+IntToStr(iIdTitular)+
                 ' AND    BT.SEQPROPOSTA     = 1 '+
                 ' AND    CO.IDCONTRIBUICAO  = H.IDDESCONTO '+
                 ' AND    P.IDPESSOA         = H.IDPESSOA  '+
                 ' AND    H.NUMRECEBIMENTO   IS NOT NULL ';

         If Trim(sIdBeneficiarioEncerrado) <> ''
         Then sSQL := sSQL + ' AND    P.IDPESSOA NOT IN ('+sIdBeneficiarioEncerrado+')'+ #13 ;

         sSQL := sSQL + ' ORDER BY 3,  5, 4 ';
         }
         //Renato Visoni SOL 152279 Kintana 1130835
         
         SQL.Add(sSQL);
         Open;

         if (iBenefNaoPeculio <> 0) then // // SOL 163521/6401 Kintana 1412085
         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            Add(' - RESPONSÁVEL : '+sRecebedorAtual);
            Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
            // Mostrar os beneficios deste recebedor

            if (iBenefNaoPeculio <> 0)  then // // SOL 163521/6401 Kintana 1412085
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDEVOLUCAO').AsInteger = 1 
               then Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,15))
               else Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                        PreparaStr(FieldByName('Nome').AsString                          ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,15)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,15));
               Next;
            end; // while 2
         end; // while 1
      end;
      // SOL 132938
      Add('----------------------------------------------------------------------------------------------');
      Add('=> VALORES DE ATUALIZAÇÃO MONETÁRIA                                                           ');

      Add('----------------------------------------------------------------------------------------------');
      Add(sVlrATualMonBeneficio);
      Add(' ');
      Add(sVlrATualMonContrib);
      Add(' ');
      // SOL 132938
      //Renato Visoni SOL 146984/3021 Kintana 1031393
      Add('----------------------------------------------------------------------------------------------');
      Add('Legenda Plano Contábil                                                                        ');
      Add('Código    Descrição                                                                           ');
      if sPlano <> '' then begin
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT IDPLANOPREV AS CODIGO, NOME AS PLANO FROM PLANPREVCONTABIL');
           SQL.Add(' WHERE IDPLANOPREV IN ('+sPlano+')                  ');
           Open;

           while not Eof do
           begin
              Add( PreparaStr(FieldByName('codigo').AsString                                ,10) +
                   PreparaStr(FieldByName('Plano').AsString                                 ,40));
              Next;
           end;
        end;
      end;
      //Renato Visoni SOL 146984/3021 Kintana 1031393
     //Higor Nayde SOL - 173938 KINTANA - 1627112 Inicio
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

      {
      Add('-----------------------------------------------------------------------------------------------------');
      Add('                                             APENAS PARA CONFERÊNCIA ');
      Add('-----------------------------------------------------------------------------------------------------');}
      //Higor Nayde SOL - 173938 KINTANA - 1627112 FIM
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoConcessao


procedure TfrmCadRequerBenefBfciario.reValorInfINSSEnter(Sender: TObject);
begin
  inherited;
  sValorINSSAntes := Trim(reValorInfINSS.Text);
end;

procedure TfrmCadRequerBenefBfciario.dbrgrpBenefProvisorioEnter(
  Sender: TObject);
begin
  inherited;
  iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex;

end;

procedure TfrmCadRequerBenefBfciario.dbrgrpBenefProvisorioExit(
  Sender: TObject);
begin
  inherited;
  iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex; 

  if iProvisorioAntes <> dbrgrpBenefProvisorio.ItemIndex
  then bRecalculouProvisorio := False;
end;

function TfrmCadRequerBenefBfciario.EfetuaConcessao(iIdSitEscolhida : word;
                             var rValorAtualizado,
                                 rValorAtualizadoTotal,
                                 rValorAtualizadoINSS,
                                 rValorAtualizadoTotalINSS : double;
                             var sUltMesReajuste,
                                 sUltMesReajusteINSS  : string;
                             var bErro                : boolean ) : word;
var 
    bPreparoOK,
    bFlgIntContab   : boolean;
    sDataReserva,
    sMsgErro        : string;
    dSaldoCotas     : double;

    varfields       : variant;

    sDataInicioINSS, sidbeneficioproc : String;
begin
   Result := iIdSitEscolhida;

   if iIdLoteConcessao <= 0
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,                                           
                                                       iFlgIncluiMesConc );
      if iIdLoteConcessao <= 0
      then begin
         bErro := True;
         MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;
   end;

   sidbeneficioproc := qryDet.FieldByName('IDBENEFICIO').AsString;
   if  (sTipoFormChamador <> 'CO')  then
      reValorTotal.Text        := qryDet.FieldByName('VALORTOTAL').AsString
   else
      if trim(sValorTotal) = '' then
         sValorTotal  := qryDet.FieldByName('VALORTOTAL').AsString;

   With qryAux do
    Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT DATAPAGAMENTO');
     SQL.Add('FROM CTRLINTERFACE');
     SQL.Add('WHERE IDLOTE = '+IntToStr(iIdLoteConcessao));
     Open;

     If (Not IsEmpty) And
        (StrToDate(FieldByName('DATAPAGAMENTO').AsString) < dtInicioFund.Date)
      Then Begin
         bErro := True;
         MsgDlg('Atenção!!'+#13+#13+
                'O lote escolhido possui uma data de pagamento ('+qryAux.FieldByName('DATAPAGAMENTO').AsString+')'+#13+
                'anterior a data de inicio de beneficio - DIB (' + FormatDateTime('dd/mm/yyyy', dtInicioFund.Date) + ').'+#13+#13+
                'Favor escolher outro lote.' , 'Lote com data anterior',mtError,[mbOk, mbHelp],0);
         iIdLoteConcessao := -1;  // edilaine - SOL 253577-17464 / PPM 955703
         Exit;
      End;
    End;

   if (not qryAux.IsEmpty) And (qryEvento.FieldbyName('FLGINTERNO').AsString <> 'CA') 
   then sDataPagamentoConcessao := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('DATAPAGAMENTO').AsDateTime)
   else sDataPagamentoConcessao := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),
                                                          '',
                                                          'AS',
                                                          'P',
                                                          FormatDateTime('mm', Date),   
                                                          FormatDateTime('yyyy', Date), 
                                                         );


   // Testar quitacao de dividas
   // Se, por algum motivo, o usuario disser que nao quer conceder,
   // manter a situacao = 4
   TestaQuitacaoDividas;

   if not dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.StartTransaction;


   // Calcular INSS antes da suplementacao pois no calculo da suplementacao é
   // necessário o valor do inss

   // Preencher qual é o beneficio de referencia
   if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
   then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
   else iIdBenefReferencia  := -1;

   varFields    := VarArrayCreate([0,1],varVariant);
   varFields[0] := iIdBenefReferencia;
   varFields[1] := qryDet.FieldByName('IdPessoa').AsInteger;

   // se pagar benefício do INSS, utilizar data do inicio do do mesmo,
   // senão usar o primeiro dia do mês da DIB (Fundação)
   If qryBenefReferencia.FieldByName('FLGPAGAINSS').AsInteger = 1 Then
     sDataInicioINSS := qryDet.FieldByName('DataInicioINSS').AsString
   Else  sDataInicioINSS := dtDataInicio.Text;

   { Para cada concessão de beneficio, gerar um único IDCALCULO }
   iIdCalculo := -1;

   if iIdBenefReferencia > 0 Then
   if qryBenefReferencia.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
   then begin
      dValorSRB               := qryDet.FieldByName('VALORSRB').AsFloat;
      bPreparoOK := PreparaBeneficioConcedido(qryAux,
                             qryDet.FieldByName('IdTitular').AsInteger,
                             qryDet.FieldByName('IdPessoa').AsInteger,
                             qryDet.FieldByName('SeqProposta').AsInteger,
                             qryDet.FieldByName('IdPessJur').AsInteger,
                             qryDet.FieldByName('IdPlanoPrev').AsInteger,
                             qryDet.FieldByName('NumeroProcesso').AsInteger,
                             qryBenefReferencia.FieldByName('IdBeneficio').AsInteger,
                             prmIDMOTIVOFOLHABEN,
                             iNumBenef, // 1, // piTotBeneficiarios
                             qryBenefReferencia.FieldByName('IdRegraCalculo').AsInteger,
                             -1, //IDREGRAREAJBENEF
                             qryBenefReferencia.FieldByName('IdRegraPrimPagto').AsInteger,
                             qryBenefReferencia.FieldByName('IdRegraUltPagto').AsInteger,
                             qryBenefReferencia.FieldByName('IdTpPagtoBenefic').AsInteger,
                             qryDet.FieldByName('CODPORTFORMA').AsInteger,
                             qryBenefReferencia.FieldByName('Nome').AsString,
                             sNomePatro, sNomePlano, sMatricula,
                             sDataInicioINSS,
                             qryDet.FieldByName('DataFinal').AsString,
                             qryBenefReferencia.FieldByName('flgCalcTodoMes').AsString,
                             qryBenefReferencia.FieldByName('ValorAtual').AsFloat,
                             0, // valorcotas
                             qryBenefReferencia.FieldByName('ValorAtual').AsFloat,
                             True,
                             rValorAtualizadoINSS,
                             rValorAtualizadoTotalINSS,
                             sUltMesReajusteINSS,
                             bErro,
                             bAux,
                             sMsgErro,iIdLoteConcessao,
                             qryDet.FieldByName('DATAINICIO').AsString,
                             7,
                             0,
                             dValorSRB,
                             iIdCalculo
                             , False, True, qryDet.FieldByName('IDPERFILINVEST').AsInteger  //edilaine - SIG55933
                             );

      if bErro or (not bPreparoOK)
      then begin
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
                             qryDet.FieldByName('IdPessoa').AsInteger,
                             qryDet.FieldByName('SeqProposta').AsInteger,
                             qryDet.FieldByName('IdPessJur').AsInteger,
                             qryDet.FieldByName('IdPlanoPrev').AsInteger,
                             qryDet.FieldByName('NumeroProcesso').AsInteger,
                             qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                             prmIDMOTIVOFOLHABEN,
                             iNumBenef, // 1, // piTotBeneficiarios
                             qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                             -1, // IDREGRAREAJBENEF
                             qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                             qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                             qryDet.FieldByName('IdTpPagtoBenefic').AsInteger,
                             qryDet.FieldByName('CODPORTFORMA').AsInteger,
                             qryBeneficio.FieldByName('Nome').AsString,
                             sNomePatro, sNomePlano, sMatricula,
                             qryDet.FieldByName('DataInicio').AsString,
                             qryDet.FieldByName('DataFinal').AsString,
                             qryBeneficio.FieldByName('flgCalcTodoMes').AsString,
                             qryDet.FieldByName('ValorAtual').AsFloat,
                             qryDet.FieldByName('ValorCotas').AsFloat,
                             //qryDet.FieldByName('ValorTotal').AsFloat,
                             StrToFloat(ClienteNumero(sValorTotal)),
                             True,
                             rValorAtualizado,
                             rValorAtualizadoTotal,
                             sUltMesReajuste,
                             bErro,
                             bAux,
                             sMsgErro,iIdLoteConcessao,
                             qryDet.FieldByName('DATAINICIO').AsString,
                             7,
                             0,
                             dValorSRB,
                             iIdCalculo
                             , False, True, qryDet.FieldByName('IDPERFILINVEST').AsInteger  //edilaine - SIG55933
                             );
   if bErro
   then begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg(sMsgErro+' O benefício será mantido como "Pendente de Concessão"  '+
            'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
      TiraSQL(qryAux);
      Result := 4;
      Exit;
   end;


   AtualizaEventosPrev(qryDet.FieldByName('IdPessJur').AsInteger,
                       qryDet.FieldByName('IdPlanoPrev').AsInteger,
                       qryDet.FieldByName('IdTitular').AsInteger,
                       qryDet.FieldByName('SeqProposta').AsInteger,
                       qry.FieldByName('IdEventoGerador').AsInteger);


   // Chamar movimentacao de reservas

   bFlgIntContab := (IntegraBack.Contabilidade = 'S');

   // Para cada movimento de reserva feito, neste momento - de concessao do beneficio -
   // o sistema deve gerar o movimento de reserva efetivo e apagar a movreservatemp
   if qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1
   then begin
      qryMovReservaTemp.First;
      while not qryMovReservaTemp.Eof do
      begin

         if qryMovReservaTemp.FieldbyName('IdBeneficio').AsInteger <>
            qryDet.FieldbyName('IdBeneficio').AsInteger
         then begin
            qryMovReservaTemp.Next;
            continue;
         end;

         if qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat <= 0
         then begin
            qryMovReservaTemp.Delete;
            continue;
         end;

         if qryBeneficio.FieldByName('FlgDataIndiceRes').AsInteger = 0       // usar DIB
         then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString
         else if qryBeneficio.FieldByName('FlgDataIndiceRes').AsInteger = 2 // usar Data do Requerimento
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

         dSaldoCotas := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat -
                        qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;
         //Início - William Santana - SOL 269674 - estava duplicando registros
         //if MoveReserva( qry.FieldByName('IdEventoGerador').AsString,
//                      qryDet.FieldByName('IdTitular').AsString,
//                      qryDet.FieldByName('SeqProposta').AsString,
//                      sNomeTitular,
//                      qryDet.FieldByName('IDBENEFICIO').AsString,
//                      qryAux, dtmAPrev.RegraAPrev, sMsgErro,
//                      qryDet.FieldByName('IDPESSJUR').AsString,
//                      qryDet.FieldByName('IDPLANOPREV').AsString,
//                      qryMovReservaTemp.FieldByName('IdTipoReserva').AsString,
//                      qryDet.FieldByName('IDPESSJUR').AsString,
//                      qryDet.FieldByName('IDPLANOPREV').AsString,
//                      qryMovReservaTemp.FieldByName('IdTipoReserva').AsString,
//                      bFlgIntContab,
//                      OraNumero(qryMovReservaTemp.FieldByName('VlrAbatido').AsString),
//                      Date, '',
//                      qryDet.FieldByName('NUMEROPROCESSO').AsString,
//                      'F',
//                      qry.FieldByName('DtDireito').AsString,
//                      1,
//                      qryDet.FieldByName('VlrINFINSS').AsFloat,
//                      StrToDate(sDataReserva),
//                      OraNumero(FloatToStr(dSaldoCotas)) ) <> 2
//         then begin
//            MsgDlg('Ocorreram erros ao movimentar a reserva relativa ao benefício. '+
//                   'O benefício será mantido como "Pendente de Concessão"  '+
//                   'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
//            TiraSQL(qryAux);
//            Result := 4;
//            Exit;
//         end;
         //Término - William Santana - SOL 269674 
         qryMovReservaTemp.Delete;
      end;
   end;


   // Executar PADRAO DE MOVIMENTACAO DE RESERVAS
   if qryDet.FieldByName('FLGMOVRESAPOSCONC').AsInteger = 1
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET FLGMOVEURESERVA = 0 '+
                     ' WHERE  NUMEROPROCESSO = '+qryDet.FieldbyName('NUMEROPROCESSO').AsString+
                     ' AND    IDPESSJUR      = '+qryDet.FieldbyName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+qryDet.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    IDTITULAR      = '+qryDet.FieldbyName('IDTITULAR').AsString+
                     ' AND    IDPESSOA       = '+qryDet.FieldbyName('IDPESSOA').AsString+
                     ' AND    IDBENEFICIO    = '+qryDet.FieldbyName('IDBENEFICIO').AsString);
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Ocorreram erros ao atualizar situação de movimento de reserva do processo. '+
                'O benefício será mantido como "Pendente de Concessão"  '+
                'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;
   end
   else
   begin
     // movimentar a reserva apenas uma vez por beneficio
     if Pos('*'+qryDet.FieldbyName('IDBENEFICIO').AsString+'*', sBeneficiosMovReserva) <= 0 then
       sBeneficiosMovReserva := sBeneficiosMovReserva +'*'+qryDet.FieldbyName('IDBENEFICIO').AsString+'*';

   end;

   StrConcedidos := StrConcedidos + QryDet.FieldByName('IDPESSOA').AsString+',';

   bConcedeuBeneficio := True;
end; // EfetuaConcessao

procedure TfrmCadRequerBenefBfciario.AtualizaEventosPrev(iIdPessJur,   iIdPlanoPrev, iIdPessoa,
                                                         iSeqProposta, iIdEventoGerador : Integer);
var sDataEfetivado : string;
begin
    sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY'')';
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE EVENTOSPREV SET FLGEFETIVADO  = 1, '+
                   '                        DATAEFETIVADO = '+sDataEfetivado+
                   ' WHERE   IDEVENTOSPREV IN '+
                   ' (SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV          '+
                   ' WHERE  IDPESSOA        = '+IntToStr(iIdPessoa)        +
                   ' AND    IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)     +
                   ' AND    IDPESSJUR       = '+IntToStr(iIdPessJur)       +
                   ' AND    SEQPROPOSTA     = '+IntToSTr(iSeqProposta)     +
                   ' AND    DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                   '                                 WHERE IDPESSOA     = '+IntToStr(iIdPessoa)+
                   '                                 AND   IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                   '                                 AND   IDPESSJUR    = '+IntToStr(iIdPessJur)+
                   '                                 AND    IDEVENTOGERADOR = '+IntToStr(iIdEventoGerador)+') '+
                   ' AND    IDEVENTOGERADOR = '+IntToStr(iIdEventoGerador) +')');

    try
      qryAux.ExecSql;
    except
    end;
    qryAux.Close;
end;

procedure TfrmCadRequerBenefBfciario.sbtnConcederClick(Sender: TObject);
var iIdSitBenef, iIdSitTemp : integer;
    bSituacoesDiferentes    : boolean;
    sMsgErro                : String;
    sDataAlimenta           : string;    //edilaine SIG111820
    //Marcos Merola SOL161215  07/11/2011 Inicio
  //  iUser : String; Retirada SOL 206918
   query:TwwQuery;
begin
  // edilaine - SOL 253577-17464 / PPM 955703 - inicio
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioConcessao := qryAux.fieldByName('datenow').AsString;

  //lstDadosCorrecao.clear;    // edilaine - SOL 262968 / PPM 1102753

  bConfirmaConcessao := true;
  inherited;
  //BRUNO AZEVEDO SOL 132938
  sVlrATualMonBeneficio := '';
  sVlrATualMonContrib   := '';
  //BRUNO AZEVEDO SOL 132938
  // edilaine - SOL 253577-17464 / PPM 955703 - fim

//Retirado Pelo SOL 206918
 // iUser   := inttostr(sistema.IdUsuario);
//
//   if (qryDet.Fieldbyname('TIPOBENEFICIO').asFloat <> 6) then
//   begin
//     if (((qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = 'CM'+Trim(iUser)) OR
//       (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = Trim(iUser)) OR
//       (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = 'CM'+Trim(iUser)) OR
//       (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = Trim(iUser)))) then
//      begin
//        MsgDlg('Você não possui permissão para efetuar a concessão do(s) benefício(s).','Informação',mtInformation,[mbOk],0);
//        Exit;
//      end;
//   end;
   //Marcos Merola SOL161215  07/11/2011 Fim

  // Conceder todos os benefícios do processo

////douglas


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

  sbtnAlterarClick(Sender);

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


  // Atualizar query de conta bancaria
  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;

  if not qryBeneficio.Active
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qry.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end;

  // Chamar tela de Modo de Concessao

 if (sistema.idmodulo <> 454) then begin
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
       else iIdSitBenef :=  1;
       end; //case
    end;//with
  end
  else  begin
    iIdSitBenef := 1;
  end;

  // edilaine - SOL 253577-18094 / PPM 1269549 - inicio
  if (Sistema.IdModulo = 454) and (sTipoFormChamador = 'CO') then
  begin
    if not(AssociaTaxas(false)) then
       exit;
  end;
  // edilaine - SOL 253577-18094 / PPM 1269549 - fim


  sBeneficiosMovReserva := '';
  qryDet.First;
  while not qryDet.Eof do
  begin

     If (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 1) Or 
        (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3)
     Then Begin
       If Trim(sIdBeneficiarioEncerrado) = ''
       Then sIdBeneficiarioEncerrado := qryDet.FieldByName('IdPessoa').AsString
       Else sIdBeneficiarioEncerrado := sIdBeneficiarioEncerrado+', '+
                                        qryDet.FieldByName('IdPessoa').AsString;
       qryDet.Next;
       Continue;
     End;

     PreencheDadosBeneficiario( qryDet.FieldByName('NumeroProcesso').AsInteger,
                                qryDet.FieldByName('IdTitular').AsInteger,
                                qryDet.FieldByName('IdPessoa').AsInteger,
                                qryDet.FieldByName('IdPessJur').AsInteger,
                                qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                qryDet.FieldByName('SeqProposta').AsInteger);

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

        If (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3) Then
        Begin
          qryDet.Next;
          Continue;
        End;

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
        TiraSQL(qryAux);
     end
     else begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
        qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
        qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitTemp];
     end;
  end; // else - if RecordCount = 1

  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qryDetDescricao.AsString; // SOL 221079
  Refresh;

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
                                              sDataPagamentoConcessao,
                                              qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2,
                                              true,
                                              bPerfilAtivo);

    if PerfilAnterior.iIdPerfilInvest = -1 then
       PerfilAnterior := PerfilAtual;
  end
  else
  begin
    PerfilAnterior.iIdPerfilInvest   := -1;
    PerfilAnterior.iIdPlanPrevContab := -1;
  end;
  //edilaine - SIG55933 - fim

  //edilaine SIG111820 : inicio
  if (qryDet.FieldByName('IDBENEFICIO').AsInteger = 528) or
     (qryDet.FieldByName('IDBENEFICIO').AsInteger = 893) then
    sDataAlimenta := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date)
  else
    sDataAlimenta := FormatDateTime('dd/mm/yyyy', Now);
  //edilaine SIG111820 : fim

  If Not RodaPadraoMovReserva( qryDet.FieldByName('IDPESSJUR').AsInteger,
                               qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                               qryDet.FieldByName('IDTITULAR').AsInteger,
                               qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                               -1,
                               qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                               -1,
                               qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                               qryEvento.FieldbyName('FLGINTERNO').AsString,
                               sDataPagamentoConcessao,
                               sMsgErro,
                               qryDet.FieldbyName('NUMEROPROCESSO').AsInteger,
                               'C',
                               dtDataFinal.Text,
                               //101075
                               false,
                               '',
                               //BRUNO AZEVEDO SOL 145995 Kintana 1023814
                               //FormatDateTime('dd/mm/yyyy', dtDataFinal.Date))
                               //FormatDateTime('dd/mm/yyyy', Now), //Taffarel - SIG103736
                               //FormatDateTime('dd/mm/yyyy', dtDataInicio.Date), //Taffarel - SIG103736    //SIG111820
                               sDataAlimenta,                                     //edilaine - SIG111820
                               //BRUNO AZEVEDO SOL 145995 Kintana 1023814
                               // FIM
                               PerfilAnterior.iIdPlanPrevContab,                //edilaine - SIG55933
                               PerfilAtual.iIdPlanPrevContab                    //edilaine - SIG55933
                               )
                                then begin
     MsgDlg('Ocorreram erros ao executar padrão de movimentação de reservas. '+#13+
            'O processo de concessão será cancelado até que o problema seja resolvido. ',
            'Erro',mtError,[mbOk],0);
     bbtnCancelarClick(Self);
     Exit;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET FLGMOVEURESERVA = 1 '+
                 ' WHERE  NUMEROPROCESSO = '+qryDet.FieldbyName('NUMEROPROCESSO').AsString+
                 ' AND    IDPESSJUR      = '+qryDet.FieldbyName('IDPESSJUR').AsString+
                 ' AND    IDPLANOPREV    = '+qryDet.FieldbyName('IDPLANOPREV').AsString+
                 ' AND    IDTITULAR      = '+qryDet.FieldbyName('IDTITULAR').AsString+
                 ' AND    IDPESSOA       = '+qryDet.FieldbyName('IDPESSOA').AsString+
                 ' AND    IDBENEFICIO    = '+qryDet.FieldbyName('IDBENEFICIO').AsString);
  Try
    qryAux.ExecSQL;
  Except
    MsgDlg('Ocorreram erros ao atualizar situação de movimento de reserva do processo. '+#13+
            'O processo de concessão será cancelado até que o problema seja resolvido. ',
            'Erro',mtError,[mbOk],0);
     bbtnCancelarClick(Self);
     Exit;
  End;

  sbtnConcedeUm.Down := False;
  //MsgDlg('Benefício concedido com sucesso.', 'Informação',mtInformation,[mbOk, mbHelp],0);    // edilaine - SOL 253577-18129 / PPM 1303078 - comentado
  TiraSQL(qryAux);
  bbtnConfirmarClick(self);     // edilaine - SOL 253577-18129 / PPM 1303078
end;

function TfrmCadRequerBenefBfciario.ConcedeUmBeneficio ( Sender : TObject; piIdSitBenef : integer ): boolean;
var sNomeSituacao               : string;
    rValorAtualizado,
    rValorAtualizadoTotal,
    rValorAtualizadoINSS,
    rValorAtualizadoTotalINSS   : double;
    sUltMesReajuste,
    sUltMesReajusteINSS         : string;
    bErro                       : boolean;
    varfields                   : variant;
    sMsgErro                    : String;
    iIdPlanPrevContab           : Integer;
    sDataFinalATestar : String;
    idPessoa, Idtitular, Idbeneficio  : String; // Jéssica SOL125930
    sEventoGerador : String;                    // Jéssica SOL125930
    sIDContribuicao : String;                   // Jéssica SOL125930
    dCorrecaoMonetaria : Currency;  // SOL 132938
    sAnoMesAtual, sAnoMesFim   : String;      // SOL 132938
    iNumRecebimento,  iIdContribuicao : INTEGER; // SOL 132938
begin
  inherited;

  iIdCalculo      := -1;
  iIdCalculoGeral := -1;


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

      if not qryAux2.RecordCount > 1 then
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
   qryAux2.SQL.Add(' from BENEFICIO B, BENEFBFCIARIO BF' );
   qryAux2.SQL.Add(' WHERE B.IDBENEFICIO = BF.IDBENEFICIO');
   qryAux2.SQL.Add(' AND B.IDBENEFICIO =' + QuotedStr(qryDet.FieldByName('IDBENEFICIO').asString));
   qryAux2.SQL.Add(' AND BF.IDPESSOA =' + QuotedStr(qryDet.FieldByName('IDPESSOA').asString));
   qryAux2.SQL.Add(' AND BF.IDTITULAR =' + QuotedStr(qryDet.FieldByName('IDTITULAR').asString));
   qryAux2.SQL.Add(' AND BF.IDPLANOPREV =' + QuotedStr(qryDet.FieldByName('IDPLANOPREV').asString));
   qryAux2.SQL.Add(' AND BF.IDPESSJUR =' + QuotedStr(qryDet.FieldByName('IDPESSJUR').asString));
   qryAux2.SQL.Add(' AND BF.FONTEPAGADORA = 1');
   qryAux2.Open;
   sEventoGerador := qryAux2.FieldByname('IDEVENTOGERADOR').asString;
   // FIM - A

      if not qryAux2.IsEmpty then
        begin
                sEventoGerador := qryAux2.FieldByname('IDEVENTOGERADOR').asString
        end
   else
        begin
                sEventoGerador:= '-1';
        end;

   // B
   qryAux2.close;
   qryAux2.SQL.Clear;
   //edilaine - SIG81749 - inicio
   qryAux2.SQL.Add(' SELECT D.IDPESSOA, D.IDTITULAR FROM DEPENTIT D WHERE D.IDPESSOA = '+QuotedStr(qryDet.FieldByName('IdPessoa').asString));
   qryAux2.SQL.Add(' AND    D.IDTITULAR = '+QuotedStr(qryDet.FieldByName('IDTITULAR').asString));
   //edilaine - SIG81749 - fim
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
   {qryAux2.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add('WHERE C.IDEVENTOGERADOR = EP.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA  ='+ QuotedStr(IDTITULAR));
   qryAux2.SQL.Add(' AND EP.IDEVENTOGERADOR ='+ sEventoGerador);
   } // edilaine - SOL 253577-18094 / PPM 1269549 - fim
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
       // edilaine - SOL 253577-18094 / PPM 1269549 - inicio 
       qryAux2.SQL.Add('SELECT 1 FROM CONTRIBPREVPARTP C WHERE IDPESSJUR = '+ qryDet.FieldByName('IDPESSJUR').asString);
       qryAux2.SQL.Add(' AND C.IDPESSOA = '+QuotedStr(IDPESSOA));
       qryAux2.SQL.Add(' AND C.IDPLANOPREV = '+ qryDet.FieldByName('IDPLANOPREV').asString);
       qryAux2.SQL.Add(' AND C.IDCONTRIBUICAO IN ('+ sIDContribuicao +')');
       // edilaine - SOL 253577-18094 / PPM 1269549 - fim
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
        // caso seja um beneficiario designado não fazer a validação
        // SOL 170020 Kintana
        qryAux2.close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add(' select count(1) QTDE ');
        qryAux2.SQL.Add('FROM beneficio b ');
        qryAux2.SQL.Add('WHERE b.flgdestbenef = ''B'' AND ');
        qryAux2.SQL.Add('b.idbeneficio = ' + qryDet.FieldByName('IdBeneficio').Asstring + ' AND ');
        qryAux2.SQL.Add('b.idtppagtobenefic = 2 AND ');
        qryAux2.SQL.Add('b.ideventogerador = 346 ');
        qryAux2.open;

        if  qryAux2.FieldByName('QTDE').asinteger = 0 then
        begin
            qryAux2.close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.Add('SELECT 1 FROM NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CP ');      // edilaine - SOL 253577-18094 / PPM 1269549
            qryAux2.SQL.Add('WHERE N.IDRESPNUCLEO = ' + QuotedStr(IDPESSOA));              // edilaine - SOL 253577-18094 / PPM 1269549
            qryAux2.SQL.Add(' AND CP.IDTITULAR = ' + QuotedStr(Idtitular));                // edilaine - SOL 253577-18094 / PPM 1269549
            qryAux2.SQL.Add(' AND N.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR');
            qryAux2.SQL.Add(' AND CP.IDCONTRIBUICAO IN (259, 633, 500) ');
            qryAux2.Open;

            if qryAux2.IsEmpty then
            begin
               MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Núcleo Familiar', mtInformation, [mbOK], 0);
               Result := False;
               Exit;
            end;
        end;
     end;
   end;
  { else

   begin
     //MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Participante', mtInformation, [mbOK], 0);
     //Result := False;
     //Exit;
   end;}

{// Jéssica Lana SOL 121166  KINTANA 579890 22/09/2009
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT IDPESSOA, IDTITULAR, MATRICULA ');
   qryAux2.SQL.Add(' FROM DEPENTIT ' );
   qryAux2.SQL.Add(' WHERE MATRICULA =' + QuotedStr(qryDepentit.FieldByName('MATRICULA').AsString));
   qryAux2.SQL.Add(' AND IDPESSOA    =' + QuotedStr(qryDet.FieldByName('IdPessoa').AsString));

   qryAux2.Open;
   idPessoa  := qryAux2.FieldByname('idPessoa').asString;
   Idtitular :=  qryAux2.FieldByname('idTitular').asString;

   if qryAux2.FieldByname('idPessoa').asString = qryAux2.FieldByname('idTitular').asString then begin

//Alteração SOL125930
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT C.IDCONTRIBUICAO, EP.IDPESSOA, EP.IDBENEFICIO ');
   qryAux2.SQL.Add(' FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add(' WHERE C.IDEVENTOGERADOR = EP.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA = ' + QuotedStr(qryDet.FieldByName('IdPessoa').asString) );
   qryAux2.SQL.Add(' AND EP.IDBENEFICIO = ' + QuotedStr(qryDet.FieldByName('IdBeneficio').asString) );

   qryAux2.Open;

   idPessoa  := qryAux2.FieldByname('idPessoa').asString;
   idBeneficio := qryAux2.FieldByname('idBeneficio').asString;

   if not qryAux2.IsEmpty
   then begin

// Aposentado

   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT * FROM CONTRIBPREVPARTP ');
   qryAux2.SQL.Add(' WHERE IDPESSJUR = ' + qryDet.FieldByName('IDPESSJUR').asString);
   qryAux2.SQL.Add(' AND IDPESSOA  = '   + qryDet.FieldByName('IDPESSOA').asString);
   qryAux2.SQL.Add(' AND IDPLANOPREV = ' + qryDet.FieldByName('IDPLANOPREV').asString);
   qryAux2.SQL.Add(' AND IDCONTRIBUICAO IN ( SELECT C.IDCONTRIBUICAO ');
   qryAux2.SQL.Add(' FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA = IDPESSOA ');
   qryAux2.SQL.Add(' AND EP.IDBENEFICIO = IDBENEFICIO ');
   qryAux2.Open;

    if qryAux2.IsEmpty then begin
       MessageDlg('Não é possível conceder benefício sem a contribuição vinculada ao participante', mtInformation, [mbOK], 0);
       Result := False;
       Exit;
     end;
     end else begin

// Pensionista
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
   end;
  end;  //Fim SOL125930}

  // Se o pagamento for para Folha de Beneficio
  // Verificar se participante possui conta bancaria
  if (qryDet.FieldByName('FLGFORMAPAGTO').AsString = 'F') and
     (Trim(dblkpcmbPortForma.Text) = '') and
     (qryContaBancaria.IsEmpty)
  then begin
     MsgDlg(' Este beneficiário/recebedor não possui Conta Bancária cadastrada. '+
            ' Cadastre pelo menos uma conta para conceder o benefício.',
            'Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Se for um beneficio de resgate e tiver portador forma indicado
  // sugerir ao usuario que preencha a agencia para credito
  if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) and
     (Trim(dblkpcmbPortForma.Text) <> '') and
     (Trim(dblkpcmbAgencia.Text) = '')
  then begin
     if MsgDlg(' Este participante não possui Agência para Crédito cadastrada. '+
               ' Deseja cadastrar antes de conceder o benefício ? ',
               'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes
     then begin
        sbtnConcedeUm.Down := False;
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  {Ádler Souza - SOL 132110 KINTANA 758869
  //Renato Visoni SOL 118811 Kintana 569080
  if not (ComparaPLanoContabil(qryDet.FieldByName('IDPESSOA').AsInteger,qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger, qryDet.FieldByName('IDPLANOPREV').AsInteger, qryDet.FieldByName('IDTITULAR').AsInteger)) then begin
    Result := False;
    Exit;
  end;
  //Renato Visoni SOL 118811 Kintana 569080}

  qryBeneficio.Locate('IdBeneficio',qryDet.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);

  // Renato Visoni SOL 123843 Kintana 636875
   if not ComparaValorReservaComHistorico(QryAux,qryDet.FieldByName('IDPESSOA').asString,
                                          qryDet.FieldByName('IDPESSJUR').asString,
                                          qryDet.FieldByName('IDPLANOPREV').asString, false) then begin      // edilaine - SOL 253577-18129 / PPM 1303078
     Result := False;
     // edilaine - SOL 253577-18129 / PPM 1303078 - incio
     bbtnCancelarClick(self);
     if sRequerimento then
        sbtnAlterar.enabled := false;
     // edilaine - SOL 253577-18129 / PPM 1303078 - fim
     Exit;
   end;
   // Renato Visoni SOL 123843 Kintana 636875
  

  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // requerido
  if not VerificaBeneficioObrigatorio
  then begin
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;
  
  iIdChamaElegebilidade := 1;

  // Executar regra de elegibilidade
  if (piIdSitBenef <> 4) and (piIdSitBenef <> 6)
  then bbtnElegibilidadeClick(Sender);

  if not bConcedeBeneficio
  then begin
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     // Andre Imakawa - SIG 103584 - Inicio
     if qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger = 27096 then
       Result := True;
     // Andre Imakawa - SIG 103584 - Fim  
     Exit;
  end;

  // Se a situacao do beneficio for "Concedido Normal" (sit = 1)
  // Preparar o beneficio inserindo-o na benefbfciario
  if piIdSitBenef = 1
  then begin
       // Se o parametro do beneficio por plano (flgbenefinf) definir que
       //    o no. de beneficiarios elegiveis
       // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
       //       está com os elegiveis
       // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
       //       iNumBenef := numero total de beneficiarios

       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BENEFBFCIARIO BF, BENEFPLANPREV BP  '+
                      ' WHERE  (BF.IDTITULAR      = '+IntToStr(iIdTitular)  +') '+
                      ' AND    (BF.IDPESSJUR      = '+IntToStr(iIdPessJur)  +') '+
                      ' AND    (BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+') '+
                      ' AND    (BF.SEQPROPOSTA    = '+IntToStr(iSeqProposta)+') '+
                      ' AND    (BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+')'+
                      ' AND    (BF.IDBENEFICIO    = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                      ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                      ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                      ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                      );
       qryAux.Open;

       iNumBenef := qryAux.RecordCount;

       if not qryBeneficio.Active then Exit;

       if (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) and
          (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
       then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP '+
                        ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                        ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                        ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                        ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                        ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                        ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                        ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                        ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                        );
         qryAux.Open;
         iNumBenef := qryAux.RecordCount;
       end;

       iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                            frmCadRequerBenefBfciario.Caption,
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
       sValorTotal := ''; 
       piIdSitBenef := EfetuaConcessao(piIdSitBenef,
                                    rValorAtualizado,
                                    rValorAtualizadoTotal,
                                    rValorAtualizadoINSS,
                                    rValorAtualizadoTotalINSS,
                                    sUltMesReajuste,
                                    sUltMesReajusteINSS,bErro);
       if bErro
       then begin
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
       end;

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
             //Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB
             sSQL := 'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO FROM '+
                     'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                     '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                     ' FROM HSTCONTRIBPREV HCP '+
                     ' WHERE                   '+
                     '  HCP.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString      +' AND '+
                     '  HCP.IDMOTIVO = '+ inttostr(prmIdMotivoContrib)                 +' AND '+
                    // '  HCP.IDLOTE   = '+ IntToStr(iIdLoteConcessao)                   +' AND '+
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
      end; }
      // SOL 132938

  end;

  // Se a situacao final do beneficio for 6 (nao concedido), devolver para
  // a reserva o valor que havia sido abatido
  if (piIdSitBenef = 6) and (qryDet.FieldByName('FlgResgate').AsInteger = 1)
  then begin
     if not DevolveReserva (qryDet.FieldByName('IdBeneficio').AsInteger,
                            qryDet.FieldByName('IdPessoa').AsInteger)
     then begin
        MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
               'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
               'Verifique. ','Informação',mtInformation,[mbOk],0);
        sbtnConcedeUm.Down := False;
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  // Gravar situacao final do beneficio na qryDet (BenefBfciario)
  qryDet.DisableControls;
  qryDet.Edit;

  if iIdUsuarioAutoriza > 0
  then qryDet.FieldByName('USUARIOALT').AsInteger := iIdUsuarioAutoriza;

  // Se o preparo de beneficio atualizou o beneficio, gravar os dados
  // agora, pois senao o requerimento irá substitui-los

  { Sempre atualizar os valores do beneficio }
  if Trim(sUltMesReajuste) <> '' then begin
     qryDet.FieldByName('ULTMESREAJUSTE').AsString   := sUltMesReajuste;
     qryDet.FieldByName('ULTVALORATUALREAJ').AsFloat := qryDet.FieldByName('ValorAtual').AsFloat;
  End;
  qryDet.FieldByName('VALORATUAL').AsFloat        := rValorAtualizado;
  qryDet.FieldByName('VALORCALCULADO').AsFloat    := rValorAtualizado;
  qryDet.FieldByName('VALORTOTAL').AsFloat        := rValorAtualizadoTotal;
  if qryBeneficio.FieldbyName('FLGCALCTODOMES').AsInteger = 1
  then rValorCotas := rValorAtualizado  // beneficio em cotas
  else rValorReal  := rValorAtualizado; // beneficio em real

  if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
  then sDataFinalATestar := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAFINALPREVISTA').AsDateTime) 
  else sDataFinalATestar := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAFINAL').AsDateTime);

  If ( sDataFinalATestar = '30/12/1899' ) Then sDataFinalATestar := '';

  if (sDataFinalATestar <> '') and
     (Copy(sDataFinalATestar,7,4)+'/'+Copy(sDataFinalATestar,4,2) <= FormatDateTime('yyyy/mm', Date)) then
  begin
     if (Copy(sDataFinalATestar,7,4)+'/'+Copy(sDataFinalATestar,4,2) = FormatDateTime('yyyy/mm', Date)) then
     begin


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

  qryDet.FieldByName('IdSitBeneficio').AsInteger := piIdSitBenef;
  qryDet.FieldByName('Descricao').AsString := vetDescBeneficio[piIdSitBenef];

   qryDet.FieldByName('DataConcessao').AsDateTime := Date;

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
    If qryaux.FieldByName('IdSitBeneficio').AsInteger = 3 Then
    Begin
      rValorReal                                     := qryAux.FieldByName('valoratual').AsFloat;
      rValorCotas                                    := qryAux.FieldByName('valoratual').AsFloat;
      qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
      qryDet.FieldByName('DATAFINAL').AsString       := qryDet.FieldByName('DATAINICIO').AsString; 
    End;
  End;

   //verifica o cadastro e não a forma de pgto do benefício
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA '+
                 ' FROM   TPPAGTOBENEFICIO T   '+
                 ' WHERE  T.IDTPPAGTOBENEFIC = '+IntToStr(qrydet.FieldByName('IdTpPagtoBenefic').AsInteger));
   qryAux.Open;

   if (qryAux.FieldByName('FlgFrequencia').AsString = 'U')
   then
   begin
      qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
      piIdSitBenef := 3;
   end;

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
                                                     iNumBenef,
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
                         iFlgEmprestimo );
    Except
      frmAguarde.Apaga;
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro no registro da Retenção.','Erro',mtError,[mbOk],0);
      TiraSQL(qryAux);
      Exit;
    End;

    QryDet.FieldByName('IDSITBENEFICIO').AsInteger := 2;
    QryDet.FieldByName('DESCRICAO').AsString       := VetDescBeneficio[2];

  End;

  //edilaine WO16247 : inicio
  if qryDet.FieldByName('FONTEPAGADORA').asInteger = 1 then
  begin
    qryDet.FieldByName('RESERVADIB').asFloat    := CalculaReservaParaBeneficio;
    qryDet.FieldByName('SALDOCONTADIB').asFloat := qryDet.FieldByName('RESERVADIB').asFloat ;
    qryDet.FieldByName('INDICEDIB').asFloat     := BuscaIndice(QryDet.FieldByname('IDPESSJUR').asString,QryDet.FieldByname('IDTITULAR').asString,QryDet.FieldByname('IDPLANOPREV').asString);
  end;
  //edilaine WO16247 : fim


  qryDet.Post;
  qryDet.EnableControls;

  varFields    := VarArrayCreate([0,1],varVariant);
  varFields[0] := iIdBenefReferencia;
  varFields[1] := qryDet.FieldByName('IdPessoa').AsInteger;

  if qryBenefReferencia.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     qryBenefReferencia.Edit;
     qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 6;

   qryBenefReferencia.FieldByName('DataConcessao').AsDateTime := Date;

     if Trim(sUltMesReajusteINSS) <> ''
     then begin
        qryBenefReferencia.FieldByName('UltMesReajuste').AsString   := sUltMesReajusteINSS;
        qryBenefReferencia.FieldByName('ULTVALORATUALREAJ').AsFloat := qryBenefReferencia.FieldByName('ValorAtual').AsFloat;
        qryBenefReferencia.FieldByName('ValorAtual').AsFloat        := rValorAtualizadoINSS;
        qryBenefReferencia.FieldByName('ValorCalculado').AsFloat    := rValorAtualizadoINSS;
        qryBenefReferencia.FieldByName('valortotal').AsFloat        := rValorAtualizadoTotalINSS;
     end;

     qryBenefReferencia.Post;

     bGravaBenefReferencia := True;
  end; // with


  Result := True;
end;


Function TfrmCadRequerBenefBfciario.CalculaReservaParaBeneficio : double;
Var
  dTotReservaReal, dValorReservaCota, dValorDaCota    : double;

  sDataRef, sDataInicio, sDataCancelamento,
  sValorProvento,    sValorAtualReserva,
  sValorReservaCota, sValorTotReservaReal,

  sSQLReserva     : string;

  bErro           : boolean;
  iNumReg, iTotReserva,
  iFlgUltimo      : integer;

  varfields       : variant;

begin

   Result := 0;

   if qryReservaPart.IsEmpty
   then Exit;

   if FormatDateTime( 'DD/MM/YYYY', Qry.FieldByName('DTEVENTO').AsDateTime ) <> ''
   then sDataRef := FormatDateTime('dd/mm/yyyy', qry.FieldByName('DTEVENTO').AsDateTime)
   else sDataRef := FormatDateTime('dd/mm/yyyy', Date);

   if qryBeneficio.FieldByName('IDREGRAPAGAMENTO').AsString <> '' then
   begin

     if Trim(dtInicioFund.Text) <> ''
     then sDataInicio := FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)
     else sDataInicio := sDataRef;

     sValorProvento := CalcSALPART( iIdPessJur, iIdTitular,
                                    Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2),
                                    qryAux );
     sSQLReserva := '';
     iNumReg     := 0;
     iFlgUltimo  := 0;
     iTotReserva := qryReservaPart.RecordCount;

     qryReservaPart.First;

     If qryBeneficio.FieldByName('FLGDESINDRES').AsInteger = 1
     Then DesindexaReserva;

     { Executar a regra de reserva para beneficio, para cada reserva.                  }

     { A regra retornará o valor em cotas que será retirado da reserva para calcular   }
     { o valor do benefício. Este valor será guardado na MOVRESERVATEMP                }

     { Quando acabar de executar a regra para todas as reservas, executá-la mais       }
     { uma vez para a regra retornar o valor total em real da reserva para benefício   }


     while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do
     begin
        inc(iNumReg);

        { Quando a variavel iNumReg for > que a variavel iTotReserva significa }
        { que já rodei a regra para todas as reservas e estou rodando a ultima }
        { vez para pegar o total em real das reservas                          }
        if iNumReg > iTotReserva
        then iFlgUltimo := 1;


        if iFlgUltimo = 1 then { Última passada, passar Somatório como sendo o valor da reserva }
        begin
           sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal));
        end
        else
        begin

           varFields := VarArrayCreate([0,1],varVariant);
           varFields[0] := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
           varFields[1] := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;

           if qryMovReservaTemp.Locate('IDBENEFICIO;IDTIPORESERVA',varFields , [loCaseInsensitive])
           then sValorAtualReserva := OraNumero(qryMovReservaTemp.FieldByName('VLRORIGINAL').AsString)
           else sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('VALORRESERVA').AsString);

        end;

        sDataCancelamento := qryTitular.FieldByName('DATACANCELAMENTO').AsString;
        If sDataCancelamento = '' Then sDataCancelamento := ' ';

        sSQLReserva := ' SELECT '+IntToStr(iNumReg)+' AS CONTRESERVA, '+
                       IntToStr(iFlgUltimo)+' AS ULTRESERVA, '+
                       qryReservaPart.FieldByName('IdTipoReserva').AsString+ ' AS IDTIPORESERVA,    '+
                       qryReservaPart.FieldByName('IdPessJur').AsString    + ' AS IDPESSJUR,        '+
                       qryReservaPart.FieldByName('IdPlanoPrev').AsString  + ' AS IDPLANOPREV,      '+
                       qryReservaPart.FieldByName('IdPessoa').AsString     + ' AS IDPESSOA,         '+
                       qryReservaPart.FieldByName('IDPESSOA').AsString     + ' AS IDTITULAR,        '+
                       qryReservaPart.FieldByName('SeqProposta').AsString  + ' AS SEQPROPOSTA,   '+
                       ''+qryReservaPart.FieldByName('FLGDESCIRRF').AsString+ ' AS FLGDESCIRRF, '+
                       qryBeneficio.FieldByName('IdBeneficio').AsString+ ' AS IDBENEFICIO,          '+
                       OraNumero(sValorProvento) + ' AS VALORPROVENTO,                              '+
                       sValorAtualReserva        + ' AS VALORRESERVA,                               '+
                       ''''+qryReservaPart.FieldByName('MoeSigla').AsString+ '''         AS MOESIGLA,     '+
                       ''''+PreparaStrRegra(sDataInicio)+ '''       AS DATAINICIO,                                         '+
                       ''''+PreparaStrRegra(sDataRef)+ '''          AS DATAREF,                                            '+
                       ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString)+ ''' AS DATAREFERENCIASA, '+
                       ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString) +''' AS DATANASC,       '+
                       ''''+PreparaStrRegra(qryTitular.FieldByName('INSCRICAODATA').AsString)+''' AS INSCRICAODATA,       '+
                       ''''+ PreparaStrRegra(sDataCancelamento) +'''    AS DATACANCELAMENTO, '+
                       ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAADMISSAO').AsString)  +'''    AS DATAADMISSAO,   '+
                       ''''+qryReservaPart.FieldByName('CODHIERARQUIA').AsString +'''    AS CODHIERARQUIA,  '+
                       ''+OraNumero(qryReservaPart.FieldByName('INDICEREAJUSTE').AsString)+'    AS INDICEREAJUSTE, '+
                       ''+OraNumero(qryReservaPart.FieldByName('FLGCONTROLE').AsString)   +'    AS FLGCONTROLE,    '+
                       ''''+PreparaStrRegra(Trim(dtDataRequerimento.Text))   +''' AS DATAREQUERIMENTO,              '+
                       ''''+PreparaStrRegra(Trim(dtDataInicio.Text))         +''' AS DATAINICIOPAGTO, '+
                       ''''+PreparaStrRegra(sFlgInternoAntes)+'''  AS FLGINTERNOANT, '+
                       ''''+PreparaStrRegra(sFlgInternoDepois)+''' AS FLGINTERNO, '+
                       ''+PreparaStrRegra(sIdSitPartAntes)+'   AS IDSITPARTATUAL, '+
                       ''+PreparaStrRegra(sIdSitPlanAntes)+'   AS IDSITPLANOATUAL, '+
                       ''+PreparaStrRegra(sIdSitFuncAntes)+'   AS IDSITFUNCATUAL, '+
                       ''+PreparaStrRegra(sIdSitPartDepois)+'  AS IDSITPARTNOVO, '+
                       ''+PreparaStrRegra(sIdSitPlanDepois)+'  AS IDSITPLANONOVO, '+
                       ''+PreparaStrRegra(sIdSitFuncDepois)+'  AS IDSITFUNCNOVO, '+
                       ''''+OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString)+'''   AS PERCENTUALSAQUE, '+
                       QuotedStr(dtDataFinal.Text)+ ' AS DATAFINAL,  '+

                       OraNumero(FloatToStr(rOpcao1))+ ' AS VALORBASE1, '+
                       OraNumero(FloatToStr(rOpcao2))+ ' AS VALORBASE2, '+
                       OraNumero(FloatToStr(rOpcao3))+ ' AS VALORBASE3, '+

                       qryBeneficiario.FieldByName('PERCENTUAL').AsString+'  AS PERCENTUAL, '+
                       IntToStr(iNumBenef) +' AS NUMBENEF '+

                       ' FROM DUAL ';

        if iNumReg <=  iTotReserva
        then begin
           sValorReservaCota    := RegraNumerica( qryBeneficio.FieldByName('IdRegraPagamento').AsString,
                                                  sSQLReserva, bErro, iIdCalculo );
           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+qryBeneficio.FieldByName('IdRegraPagamento').AsString+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dValorReservaCota := 0;
              break;
           end
           else dValorReservaCota := StrToFloat(ClienteNumero(sValorReservaCota));

           dTotReservaReal := dTotReservaReal + dValorReservaCota;

           if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1)
           then begin

              varFields := VarArrayCreate([0,1],varVariant);
              varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
              varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

              if qryMovReservaTemp.Locate('IDBENEFICIO;IDTIPORESERVA',varFields , [loCaseInsensitive, loPartialKey])
              then begin
                 qryMovReservaTemp.Edit;
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := ( qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat +
                                                                                  dValorReservaCota );
                 qryMovReservaTemp.Post;
              end
              else begin
                 qryMovReservaTemp.Insert;
                 qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                 qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                 qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
                 qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
                 qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdTitular;
                 qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdPessoa;
                 qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
                 qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := iNumeroProcesso;
                 qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
                 qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
                 qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                 qryMovReservaTemp.Post;
              end;
           end;

           qryReservaPart.Next;

        end
        else begin

           sValorTotReservaReal := RegraNumerica( qryBeneficio.FieldByName('IdRegraPagamento').AsString,
                                                  sSQLReserva, bErro, iIdCalculo );
           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+qryBeneficio.FieldByName('IdRegraPagamento').AsString+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dTotReservaReal := 0;
              break;
           end
           else dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));

        end;

     end; { while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do }

   end
   else
   begin

       { Não possui Regra. Então retirar todo o valor das reservas e retornar }
       { o somatório de todas as reservas em Real.                            }
       
       dTotReservaReal := 0;
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
              dValorDaCota  := VoltaValorCotacao(qryaux,
                                                 qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date)
                                                );

              dTotReservaReal := dTotReservaReal + (  qryReservaPart.FieldByName('ValorReserva').AsFloat
                                                    * dValorDaCota );

              if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1)
              then begin

                 varFields := VarArrayCreate([0,1],varVariant);
                 varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
                 varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

                 if qryMovReservaTemp.Locate('IDBENEFICIO;IDTIPORESERVA',varFields , [loCaseInsensitive, loPartialKey])
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
                    qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdPessoa;
                    qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
                    qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := iNumeroProcesso;
                    qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
                    qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end;

              end;

           end;
           qryReservaPart.Next;

       end; { while not qryReservaPart.Eof do }

   end;


   try
     OraNumero(FloatToStr(dTotReservaReal));
   except
     MsgDlg('O valor calculado para a reserva é inválido. ','Erro',mtError,[mbOk],0);
     Exit;
   end;

   Result := dTotReservaReal;
   
end;

function TfrmCadRequerBenefBfciario.AtualizaReservaPart ( piIdBeneficio : longint ) : boolean;
var
qryAux : TQuery; //Ádler Souza - SOL 134799 KTN 797445
begin
   Result := False;
   qryMovReservaTemp.First;

   qryAux := TQuery.Create(Application);
   qryAux.DataBaseName := 'Basedados';

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

//Ádler Souza - SOL 134799 KTN 797445

//      qryReservaPart.Edit;

      // Só zerar o saldo se o valor original era positivo, pois no caso da CBS pode existir reserva originalmente positivo
//      if (( qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat ) < 0) and
//          (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat > 0 )
//      then qryReservaPart.FieldByName('ValorReserva').AsFloat := 0
//      else qryReservaPart.FieldByName('ValorReserva').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
//                                                               - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;
//      qryReservaPart.Post;

      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE RESERVAPART SET');
      if (( qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat ) < 0) and
          (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat > 0 )
      Then
        qryAux.SQL.Add('  VALORRESERVA = 0')
      Else
        qryAux.SQL.Add('  VALORRESERVA = ' +OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat)));
      qryAux.SQL.Add('WHERE IDPESSJUR = '+ qryReservaPart.ParamByName('IDPESSJUR').AsString     );
      qryAux.SQL.Add('  AND IDPLANOPREV = '+ qryReservaPart.ParamByName('IDPLANOPREV').AsString );
      qryAux.SQL.Add('  AND IDPESSOA = '+ qryReservaPart.ParamByName('IDPESSJUR').AsString      );
      qryAux.SQL.Add('  AND SEQPROPOSTA = '+ qryReservaPart.ParamByName('IDPESSJUR').AsString   );
      qryAux.SQL.Add('  AND FLGATIVO = 1                                                    ');
      qryAux.SQL.Add('  AND IDTIPORESERVA IN( SELECT DISTINCT R.IDTIPORESERVA               '); //SIG89800
      qryAux.SQL.Add('                          FROM RESERVAPART RP, RESERVAXPLANO R        ');
      qryAux.SQL.Add('                         WHERE RP.IDTIPORESERVA = R.IDTIPORESERVA AND ');
      qryAux.SQL.Add('                               RP.IDPLANOPREV = R.IDPLANOPREV AND     ');
      qryAux.SQL.Add('                               R.ANALITICOSINTETI   = ''A'')          ');

      qryAux.ExecSql;

//Fim - Ádler Souza - SOL 134799 KTN 797445

      qryMovReservaTemp.Next;
   end; // while
   FreeAndNil(qryAux);
   Result := True;
end;

procedure TfrmCadRequerBenefBfciario.bbtnOutrasInformacoesClick(
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

    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant : string;

    iTotalBenef : longint;
begin
  inherited;

  BuscaDadosBeneficioAnterior ( qryAux,
                                iIdPessJur, iIdPlanoPrev, iIdTitular,
                                qryDet.FieldByName('IdBeneficio').AsInteger,
                                qryBeneficio.FieldByName('FlgReferencia').AsInteger,
                                FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  
                                sDataInicioAnt,
                                sValorAnt, sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, 
                                True );

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

     dtDibBenefAnt.Text           := sDataInicioAnt;
     edValorBenefAnt.Text         := ClienteNumero(sValorAnt);

     if (qryBeneficio.FieldByName('FlgReferencia').AsInteger = 0) or (prmNumOPINSS = 0)
     then begin
        grpParamINSS.Visible := False;
        Height               := 184;
     end
     else begin
        grpParamINSS.Visible := True;
        Height               := 344;

        iTotalBenef          := qryBeneficiario.RecordCount;

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
          IntToSTr(1)                                      +  ' AS FLGTIPOINSS,      '+
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
        qryDet.FieldByName('DibBenefAnt').AsString := dtDibBenefAnt.Text;
        qryDet.FieldByName('ValorBenefAnt').AsFloat := StrtoFloat(ClienteNumero(edValorBenefAnt.Text));
        qryDet.FieldByName('VALORBINSSANT1').AsFloat := StrToFloat(ClienteNumero(edOpcao1.Text));
        qryDet.FieldByName('VALORBINSSANT2').AsFloat := StrToFloat(ClienteNumero(edOpcao2.Text));
        qryDet.FieldByName('VALORBINSSANT3').AsFloat := StrToFloat(ClienteNumero(edOpcao3.Text));
     end;

     Free;
  end; // with
end;

procedure TfrmCadRequerBenefBfciario.bbtnCancelarClick(Sender: TObject);
begin
   bApagaProcesso := false;  // edilaine - SOL 253577-18129 / PPM 1303078

   bConfirmaConcessao := false;
  //Otacilio Aquino SOL 160863 Kintana 1381911
     uBeneficio.bGravaEvento := False;
  if (sTipoFormChamador = 'SI') and (not bPerguntouCancelar)
  then begin
     bPerguntouCancelar := True;
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

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  if (sTipoFormChamador = 'CO') then
     iIdLoteConcessao := -1;
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

  inherited;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio
  {se entrou na concessão pela tela de requerimento, desabilitar controles}
  if sRequerimento then
     ConfiguraAcessosTela(ctConcessaoViaRequerimento);
  // edilaine - SOL 253577-18129 / PPM 1303078 - fim

end;

procedure TfrmCadRequerBenefBfciario.sbtnImprimirSimulacaoClick(
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

  with qryAux do
  begin
     Close;
     SQL.Clear;
     // Pegar id do relatorio
//     SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+  //Everson TIBERO
     SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(BP.ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+ //Everson TIBERO
             ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF                              '+
             ' WHERE  BF.NUMEROPROCESSO = '+sNumeroProcessoAntesGravar+
             ' AND    BF.IDPLANOORIGEM    = BP.IDPLANOPREV '+
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

     TFrmPreview.CreateModalPreview(Application, rpRelatParametrizavel, 'AdmPREV - ' + frmCadRequerBenefBfciario.Caption);

     DeleteFile(sArquivoTemp);
     DeleteFile(sSQLTemp);
  end;

end;

procedure TfrmCadRequerBenefBfciario.bbtnProcParticipanteClick(
  Sender: TObject);
var sTempoServAnoDigitado,
    sTempoServMesDigitado,
    sTempoServDiaDigitado : string;
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     iIdTitular                := StrToInt(MontaSelectPart.ValoresChave[0]);
     iIdPessJur                := StrToInt(MontaSelectPart.ValoresChave[1]);
     iIdPlanoPrev              := StrToInt(MontaSelectPart.ValoresChave[2]);
     iSeqProposta              := StrToInt(MontaSelectPart.ValoresChave[7]);
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;

     if sTipoFormChamador = 'SI'
     then begin
        Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);
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

        bPerguntouCancelar := False;

     end;
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end; // if montasel.valoreschave.count > 0
end;

procedure TfrmCadRequerBenefBfciario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sTipoTelaBenef    := '';
  FinalizaEP;
  inherited;

  //lstDadosCorrecao.Free;      // edilaine - SOL 253577-17464 / PPM 955703    // edilaine - SOL 262968 / PPM 1102753 - comentado

   //Marcos Merola SOL161215  07/11/2011 Inicio
 //  qryUser.Close; Retirado pelo SOL 206918
   //Marcos Merola SOL161215  07/11/2011 Fim

   //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  // SOL124279 - Daniel Begnami
  //If (dtmBaseDados.dbBaseDados.InTransaction) And (sTipoFormChamador = 'CO') Then Begin // Renato Visoni SOL 128888 Kintana 695913
  //      dtmBaseDados.dbBaseDados.RollBack;
  //      ShowMessage('Existe uma transação em aberto. A Transação será cancelada!');
  //   End;
  // FIM SOL124279 - Daniel Begnami
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack; 
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
end;

procedure TfrmCadRequerBenefBfciario.sbtnCadContaCorrenteClick(
  Sender: TObject);
begin
  inherited;
  try
     // passa o parametro da qrycontabancaria pra o cadastro, para certificar que o recebedor(efetivo),
     // é o dono da conta (idresponsavel ou idpessoa)
     frmCadContaRequerBenef := TFrmCadContaRequerBenef.Create(Self);
     with frmCadContaRequerBenef do
     begin
        iIdPessoa := qryContaBancaria.ParamByName('IdPessoa').AsInteger;
        qry.Close;
        qry.ParamByName('IDPESSOA').AsInteger := qryContaBancaria.ParamByName('IdPessoa').AsInteger;
        qry.Open;
        ShowModal;
     end;

     { Re-Atualiza Dados do Beneficiario }
     PreencheDadosBeneficiario(iNumeroProcesso,iIdTitular,
                               qryDet.FieldByName('IdPessoa').AsInteger,
                               iIdPessJur, iIdPlanoPrev, iSeqProposta);
  finally
     sbtnCadContaCorrente.Down := False;
  end;
end;

procedure TfrmCadRequerBenefBfciario.reValorSRBBtnClick(Sender: TObject);
var rValorSRB            : double;
    bErro                : boolean;
    sSQLBenefAssoc,
    sMsgErro             : string;
    iIdCalculoAnt,
    iIdRegraCalculo      : longint;
begin

  inherited;

  if qryBeneficio.FieldByName('IdRegraSRB').AsInteger <= 0 then Exit;

  frmAguarde.Mostra('Regra de Cálculo do SRB - Nº '+qryBeneficio.FieldByName('IdRegraSRB').AsString);

  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

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

  // Executar regra de calculo do beneficio
  try
     rValorSRB       := 0;
     iIdCalculoAnt   := iIdCalculo;

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
                                         False,
                                         0,
                                         qryDet.FieldByName('DibBenefAnt').AsString,
                                         qryDet.FieldByName('ValorBenefAnt').AsString,
                                         qryDet.FieldByName('VALORBINSSANT1').AsString,
                                         qryDet.FieldByName('VALORBINSSANT2').AsString,
                                         qryDet.FieldByName('VALORBINSSANT3').AsString,
                                         bErro,
                                         sMsgErro,
                                         iIdCalculo,
                                         0,
                                         -1,      // Jonas Otavio Henrique R. Oliveira  SOL - 136384/11582 KTN - 1797879
                                         iIdPessoa);  // Jonas Otavio Henrique R. Oliveira  SOL - 136384/11582 KTN - 1797879
     frmAguarde.Apaga;
  except
     frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;
  if bErro
  then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorSRB.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0
  then iIdCalculo := iIdCalculoAnt;

  reValorSRB.Text := FormatFloat('#0.00',rValorSRB);

end;

procedure TfrmCadRequerBenefBfciario.qryDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Verificar se todos os beneficiários já foram requeridos


end;

procedure TfrmCadRequerBenefBfciario.VerificaEvolucaoPensionista;
{Se FLGINCORPORAPENS estiver marcado no plano, incorpora os dependentes à evolução funcional do
titular, inserindo na tabela EVOLFUNCPREV cada um.
Não fazer para benefício de pagamento único.
Verificar se dependente já foi inserido na tabela EVOLFUNCPREV.}

  {-->}
  Procedure PreecheVariaveis(qryAux: TwwQuery; var pWhere     : String);
  var
    sSeqHistFuncPrev : String;
  Begin
    With qryAux DO
    Begin
      If Active Then
      Begin
        // pega o sequence.
        sSeqHistFuncPrev := IntToStr(LeUltRegistro(Nil,'EVOLFUNCPREV'));

        pWhere :=
          qryBeneficiario.FieldByName('IDPESSOA').AsString +','+
          qryBeneficiario.FieldByName('IDPESSJUR').AsString +','+
          sSeqHistFuncPrev  +',';

        If FieldByName('IdCargoExt').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdCargoExt').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdFuncao').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdFuncao').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdPessJurCG').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdPessJurCG').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdPessJurFG').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdPessJurFG').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('Perc1AC').AsString <> '' Then
          pWhere := pWhere + FieldByName('Perc1AC').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('Perc2AC').AsString <> '' Then
          pWhere := pWhere + FieldByName('Perc2AC').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercATS').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercATS').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercInsalub').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercInsalub').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercPericul').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercPericul').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercFuncao').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercFuncao').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('ModoFuncao').AsString <> '' Then
          pWhere := pWhere + '''' +FieldByName('ModoFuncao').AsString  +''','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('DataInicio').IsNull Then
          pWhere := pWhere + 'NULL,'
        Else pWhere := pWhere + 'TO_DATE('''+FieldByName('DataInicio').AsString+''',''DD/MM/YYYY''),';

        If FieldByName('DataFinal').IsNull Then
          pWhere := pWhere + 'NULL,'
        Else pWhere := pWhere + 'TO_DATE('''+FieldByName('DataFinal').AsString+''',''DD/MM/YYYY''),';

        pWhere := pWhere + ''''+FieldByName('Origem').AsString  +''',';

        If FieldByName('PercAdNot').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercAdNot').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('QTDEMINUTOS').AsString <> '' Then
          pWhere := pWhere + FieldByName('QTDEMINUTOS').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdPessJurGR').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdPessJurGR').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdGrupoFunc').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdGrupoFunc').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercAdicionalNot').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercAdicionalNot').AsString
        Else pWhere := pWhere + 'NULL';


      End;
    End; // With qryAux DO
  End;
  {<--}

  {-->}
  Procedure AbreQuery(Var qryAux: TwwQuery);
  Begin
    // Busca dados da ÚLTIMA evolução do titular para usar no insert.
    qryAux.Sql.Clear;
    qryAux.Sql.Add(
      ' SELECT * FROM EVOLFUNCPREV ' +
      ' WHERE IDPESSOA = '+ qryBeneficiario.FieldByName('IDTITULAR').AsString+
      '   AND IDPESSJUR = '+ qryBeneficiario.FieldByName('IDPESSJUR').AsString+
      '   AND SEQHISTFUNC = (SELECT MAX(SEQHISTFUNC) SEQHISTFUNC FROM EVOLFUNCPREV '+
      '                   WHERE IDPESSOA = '+ qryBeneficiario.FieldByName('IDTITULAR').AsString+
      '                    AND IDPESSJUR = '+ qryBeneficiario.FieldByName('IDPESSJUR').AsString+')');
    qryAux.Open;
  End;
  {<--}

  {-->}
  Function HePagtoUnico(QryAux: TwwQuery; pIdTpPagto: String): Boolean;
  Begin
    With qryAux do
    Begin
      Sql.Clear;
      Sql.Add( ' SELECT FLGFREQUENCIA FROM TPPAGTOBENEFICIO ' +
               ' WHERE IDTPPAGTOBENEFIC = '+pIdTpPagto);
      Open;
      If (IsEmpty) Or (FieldByname('FLGFREQUENCIA').AsString = 'U') Then
        Result := True
      Else Result := False;
    End;
  End;
  {<--}

Var
  _qry: TwwQuery;
  sWhere     : String;
begin
  try

  _qry := TwwQuery.Create(Application);
  _qry.DatabaseName :=  'BaseDados';

  // verificar se flag está permite operação.
  If qryTitular.FieldByName('FLGUSAEVOLFUNC').AsInteger = 1 Then

    // verifica se incorpora pensionista à evolução funcional do titular.
    If qryTitular.FieldByName('FLGINCORPORAPENS').AsInteger = 1 Then
    Begin

      // verifica que o beneficio é pagto único.
      If HePagtoUnico(_qry,qryDet.FieldByName('IDTPPAGTOBENEFIC').AsString) Then Exit;

      // Se Titular não possui evolução funcional sai.
      AbreQuery(_qry);
      If _qry.IsEmpty Then Exit;

    // verifica se o dependente já exite na evolução.
      qryBeneficiario.First;
      while Not qryBeneficiario.EOF Do
      Begin

        // procura
        _qry.Sql.Clear;
        _qry.Sql.Add(' SELECT COUNT(*) NUM FROM EVOLFUNCPREV '+
                     ' WHERE IDPESSOA = '+ qryBeneficiario.FieldByName('IDPESSOA').AsString+
                     '   AND IDPESSJUR = '+ qryBeneficiario.FieldByName('IDPESSJUR').AsString);
        _qry.Open;

        // se existir algum registro passa para o próximo.
        If _qry.FieldByName('NUM').AsInteger > 0 Then Break;

        AbreQuery(_qry);
        PreecheVariaveis(_qry, sWhere);

        _qry.Sql.Clear;
        _qry.Sql.Add(
        ' INSERT INTO EVOLFUNCPREV (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, '+
        '       IDFUNCAO, IDPESSJURCG, IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERICUL,  '+
        '       PERCFUNCAO, MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM,  '+
        '       PERCADNOT, QTDEMINUTOS, IDPESSJURGR, IDGRUPOFUNC, PERCADICIONALNOT ) VALUES '+
        '('+ sWhere +')');

        _qry.ExecSQL;
        qryBeneficiario.Next;
      End;  // while Not qryBeneficiario.EOF Do
    End;  // If qryTitular.FieldByName('FLGINCORPORAPENS').AsInteger = 1 Then
  Finally
    _qry.Free;
  ENd;
end;

procedure TfrmCadRequerBenefBfciario.sbtnDemonsSRBClick(Sender: TObject);
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
                                               IntToStr(iIdPessoa), 
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

procedure TfrmCadRequerBenefBfciario.dbedNumProcINSSExit(Sender: TObject);
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


function TfrmCadRequerBenefBfciario.VerificaCamposObrigRegra : boolean;
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

   // edilaine - SOL 253577-17374 / PPM 848182
   if not VerificaOpcoesObrigatorias() then
      Exit;

   // edilaine - SOL 253577-17374 / PPM 848182 - inicio
   if (sTipoFormChamador = 'EV') or
      (sTipoFormChamador = 'MA') or        // edilaine - SOL 253577-17404 / PPM 850977
      (sTipoFormChamador = 'CO') then      // edilaine - SOL 253577-17464 / PPM 955703
   begin
     {RN17 - A validação dos valores deve obedecer a marcação dos flag´s de apresentação do Déficit.
             Em virtude dessa parametrização o sistema apresenta crítica MSG07 }
     {if (bFlgApresentaDeficit) and (reValorDeficit.text = '') then
     begin
       MsgDlg('Para requerer o benefício, é necessário calcular o valor da base de cálculo do déficit.', 'Erro', mtError, [mbOK], 0);
       Exit;
     end; }

    if (bFlgApresentaBSFAB) then
    begin
      {RN17 - Ao requerer benefício, caso o valor do Benefício Saldado não tenha sido calculado o sistema apresenta crítica MSG04}
      if (reValorBS.Text = '') then
      begin
        MsgDlg('Para requerer o benefício, é necessário calcular o valor do benefício saldado. ','Informação',mtInformation,[mbOk],0);
        frmAguarde.Apaga;
        Exit;
      end;

      {RN17 - A validação dos valores deve obedecer a marcação dos flag´s de apresentação do BS, FAB e Deficit
              Ao requerer benefício, caso o valor do FAB não tenha sido calculado o sistema apresenta crítica MSG05}
      if (reValorFAB.Text = '') then
      begin
        MsgDlg('Para requerer o benefício, é necessário calcular o valor do FAB. ','Informação',mtInformation,[mbOk],0);
        frmAguarde.Apaga;
        Exit;
      end;
    end;

   end;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim


    Result := True;
end; { VerificaCamposObrigRegra }

function TfrmCadRequerBenefBfciario.VerificaAcertosFalecido( piNumeroProcesso  : longint;
                                                             piIdPessJur       : longint;
                                                             piIdPlanoPrev     : longint;
                                                             piIdTitular       : longint;
                                                             piSeqProposta     : longint;
                                                             piIdLoteConcessao : longint;
                                                             psDataEvento      : string;
                                                             psDataPagamento   : string ) : boolean;
begin
    Result := False;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE HSTBENEFBFCIARIO HST SET IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+
                   ' WHERE  HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   ' AND    HST.IDPLANOPREV    = '+IntToStr(piIDPLANOPREV)+
                   ' AND    HST.IDTITULAR      = '+IntToStr(piIDTITULAR)+
                   ' AND    HST.SEQPROPOSTA    = '+IntToStr(piSEQPROPOSTA)+
                   ' AND    HST.IDPESSOA       = '+IntToStr(piIDTITULAR)+
                   ' AND    HST.IDMOTIVO       = '+IntToStr(prmIdMotivoAcertoFL)+
                   ' AND    HST.VLBENEFPGTO    IS NULL '+
                   ' AND    HST.FLGENVIADO     = 0 ');
    try
       qryAux.ExecSQL;
    except
    //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
    on e:Exception do
    begin
      TratarErro(e.Message);
       Exit;
    end;
    //Brunno Mattos - KTN 767861 - SOL 132659 Fim

    end;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV HST SET IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+
                   ' WHERE  HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   ' AND    HST.IDPLANOPREV    = '+IntToStr(piIDPLANOPREV)+
                   ' AND    HST.IDPESSOA       = '+IntToStr(piIDTITULAR)+
                   ' AND    HST.SEQPROPOSTA    = '+IntToStr(piSEQPROPOSTA)+
                   ' AND    HST.IDMOTIVO       = '+IntToStr(prmIdMotivoAcertoFL)+
                   ' AND    HST.SITRECEBIMENTO = 0 ');
    try
       qryAux.ExecSQL;
    except
       Exit;
    end;

    Result := True;
end;

procedure TfrmCadRequerBenefBfciario.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dtmaprev.regraAPrev.LimpaVariaveis;
end;

procedure TfrmCadRequerBenefBfciario.Label12Click(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled   := True;
end;

procedure TfrmCadRequerBenefBfciario.lblSitProcessoClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled   := True;
end;

procedure TfrmCadRequerBenefBfciario.dtInicioINSSChange(Sender: TObject);
begin
  inherited;
  If (qryDet.State in [dsEdit, dsInsert]) And
     (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1)
  Then Begin
    qryDet.FieldByName('DataInicioFund').AsString := dtInicioINSS.Text;
  End;
end;


procedure TfrmCadRequerBenefBfciario.BtMatriculaClick(Sender: TObject);
Var
  sProxMat : String;
begin
  inherited;

  { Passei do Beneficio pra cá }
  If (Not qryDepentit.FieldByName('MATRICULA').IsNull) Then Begin
    if MsgDlg('Já existe uma matricula para este beneficiário. Realmente deja gerar uma nova? ',
              'Atenção',mtWarning,[mbyes,mbno],0) = mrNo
    then Exit;
  End;
  if (qrybeneficio.fieldbyname('FLGPECULIO').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGREFERENCIA').AsInteger <> 1) and 
     (qryDet.State in [dsEdit]) and
     (Trim(prmMASCMATPENS) <> '')
  then begin
     //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
     If Trim(dbeMatriculaBenef.Text) <> '' Then Begin
       MatriculaBenefInicial := Trim(dbeMatriculaBenef.Text);
     end;

     sProxMat := GeraMatricula(QryAux, iIdCalculo);
     qryDepentit.Edit;
     qryDepentit.FieldByName('MATRICULA').AsString := sProxMat;
     MatriculaBenefInicial := sProxMat;
     //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
  end;
end;

procedure TfrmCadRequerBenefBfciario.reValorSRBExit(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TfrmCadRequerBenefBfciario.DesindexaReserva;
Var
  sMesLimite,
  sMesUltMov,
  sDataMov,
  sSql             : String;
  dValorAtualizado : double;
  iIdHistorico     : longint;
begin
  // Pega o mês anterior ao do evento
  sMesLimite := sAnoMesAnterior(FormatDateTime('yyyy/mm', dtDataEvento.Date));  

  qryReservaPart.First;
  While Not qryReservaPart.Eof do
   Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT MAX(DATAMOV) AS MAIORDATAMOV');
     qryAux.SQL.Add('FROM HISTMOVRESERVA');
     qryAux.SQL.Add('WHERE IDTIPORESERVA   = '+qryReservaPart.FieldByName('IDTIPORESERVA').AsString);
     qryAux.SQL.Add('  AND IDPLANOPREV     = '+qryReservaPart.FieldByName('IDPLANOPREV').AsString);
     qryAux.SQL.Add('  AND IDPESSOA        = '+qryReservaPart.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND IDPESSJUR       = '+qryReservaPart.FieldByName('IDPESSJUR').AsString);
     qryAux.SQL.Add('  AND FLGENTRADA      = 1');
     qryAux.SQL.Add('  AND VLRREAL         = 0');
     qryAux.SQL.Add('  AND VLRCOTAS        = 0');
     qryAux.SQL.Add('  AND PERCENTUAL      = 0');
     qryAux.SQL.Add('  AND FLGENTRADA      = 1');
     qryAux.SQL.Add('  AND IDBENEFICIO     IS NULL');
     qryAux.SQL.Add('  AND IDCONTRIBUICAO  IS NULL');
     qryAux.SQL.Add('  AND IDEVENTOGERADOR IS NULL');
     qryAux.Open;

     sDataMov   := qryAux.FieldByName('MAIORDATAMOV').AsString;
     
     sMesUltMov := Copy(qryAux.FieldByName('MAIORDATAMOV').AsString,7,4)+'/'+
                   Copy(qryAux.FieldByName('MAIORDATAMOV').AsString,4,2);

     // Se a reserva em questão já foi corrigida posterior ao evento
     // deverá ser desindexada ate um mês antes do evento

     If sMesUltMov > sMesLimite
      Then Begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT IDPLANOPREV, IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, SYSDATE AS DATAMOV,');
        qryAux.SQL.Add('       VLRREAL, VLRCOTAS, SALDOREAL, 0 AS FLGENTRADA, PERCENTUAL, IDPARTICIPANTE,');
        qryAux.SQL.Add('       SALDOREALCONT, DATAALIMENTACAO, VALORINDICE, MESREFERENCIA, FLGPROCEDENCIA, ');
        qryAux.SQL.Add('       SALDOCORRIGIDO, INDICECORRECAO, SALDOCOTAS, DATAINDICE ');
        qryAux.SQL.Add('FROM HISTMOVRESERVA');
        qryAux.SQL.Add('WHERE IDTIPORESERVA   = '+qryReservaPart.FieldByName('IDTIPORESERVA').AsString);
        qryAux.SQL.Add('  AND IDPLANOPREV     = '+qryReservaPart.FieldByName('IDPLANOPREV').AsString);
        qryAux.SQL.Add('  AND IDPESSOA        = '+qryReservaPart.FieldByName('IDPESSOA').AsString);
        qryAux.SQL.Add('  AND IDPESSJUR       = '+qryReservaPart.FieldByName('IDPESSJUR').AsString);
        qryAux.SQL.Add('  AND FLGENTRADA      = 1');
        qryAux.SQL.Add('  AND VLRREAL         = 0');
        qryAux.SQL.Add('  AND VLRCOTAS        = 0');
        qryAux.SQL.Add('  AND PERCENTUAL      = 0');
        qryAux.SQL.Add('  AND IDREGRACALCULO  IS NULL ');
        qryAux.SQL.Add('  AND IDBENEFICIO     IS NULL');
        qryAux.SQL.Add('  AND IDCONTRIBUICAO  IS NULL');
        qryAux.SQL.Add('  AND IDEVENTOGERADOR IS NULL');
        qryAux.SQL.Add('  AND SALDOCORRIGIDO  IS NOT NULL');
        qryAux.SQL.Add('  AND INDICECORRECAO  > 0');
        qryAux.SQL.Add('  AND DATAMOV > TO_DATE('+QuotedStr(sDataMov) +', '+QuotedStr('DD/MM/YYYY')+')');
        qryAux.SQL.Add('ORDER BY MESREFERENCIA DESC');
        qryAux.Open;

        // Abre o histórico em cache apenas para inserir os novos registros
        If Not qryDesindRes.Active
         Then Begin
           qryDesindRes.ParamByName('IDPLANOPREV').AsInteger   := qryReservaPart.FieldByName('IDPLANOPREV').AsInteger;
           qryDesindRes.ParamByName('IDPESSOA').AsInteger      := qryReservaPart.FieldByName('IDPESSOA').AsInteger;
           qryDesindRes.ParamByName('IDPESSJUR').AsInteger     := qryReservaPart.FieldByName('IDPESSJUR').AsInteger;
           qryDesindRes.Open;
         End;

        // Abre as reservas do participante em cache para atualizar
        If Not qryDResPart.Active
         Then Begin
           qryDResPart.ParamByName('IDPLANOPREV').AsInteger   := qryReservaPart.FieldByName('IDPLANOPREV').AsInteger;
           qryDResPart.ParamByName('IDPESSOA').AsInteger      := qryReservaPart.FieldByName('IDPESSOA').AsInteger;
           qryDResPart.ParamByName('IDPESSJUR').AsInteger     := qryReservaPart.FieldByName('IDPESSJUR').AsInteger;
           qryDResPart.Open
         End;

        While Not qryAux.Eof do
         Begin
           // Pega o valor corrigido e aplica o índice para desindexar a reserva
           dValorAtualizado := qryAux.FieldByName('SALDOCORRIGIDO').AsFloat /
                               qryAux.FieldByName('INDICECORRECAO').AsFloat;
           iIdHistorico     := LeUltRegistro(nil,'HISTMOVRESERVA');

           With qryDesindRes do
            Begin
              Insert;

              FieldByName('IDHISTRESERVA').AsInteger    := iIdHistorico;
              FieldByName('IDPLANOPREV').AsInteger      := qryAux.FieldByName('IDPLANOPREV').AsInteger;
              FieldByName('IDTIPORESERVA').AsInteger    := qryAux.FieldByName('IDTIPORESERVA').AsInteger;
              FieldByName('IDPESSJUR').AsInteger        := qryAux.FieldByName('IDPESSJUR').AsInteger;
              FieldByName('IDPESSOA').AsInteger         := qryAux.FieldByName('IDPESSOA').AsInteger;
              FieldByName('SEQPROPOSTA').AsInteger      := qryAux.FieldByName('SEQPROPOSTA').AsInteger;
              FieldByName('DATAMOV').AsDateTime         := Date;
              FieldByName('VLRREAL').AsFloat            := qryAux.FieldByName('VLRREAL').AsFloat;
              FieldByName('VLRCOTAS').AsFloat           := qryAux.FieldByName('VLRCOTAS').AsFloat;
              FieldByName('SALDOREAL').AsFloat          := dValorAtualizado;
              FieldByName('FLGENTRADA').AsInteger       := 0;
              FieldByName('PERCENTUAL').AsFloat         := qryAux.FieldByName('PERCENTUAL').AsFloat;
              FieldByName('IDPARTICIPANTE').AsInteger   := qryAux.FieldByName('IDPARTICIPANTE').AsInteger;
              FieldByName('SALDOREALCONT').AsFloat      := qryAux.FieldByName('SALDOREALCONT').AsFloat;
              FieldByName('DATAALIMENTACAO').AsDateTime := qryAux.FieldByName('DATAALIMENTACAO').AsDateTime;
              FieldByName('VALORINDICE').AsFloat        := qryAux.FieldByName('VALORINDICE').AsFloat;
              FieldByName('MESREFERENCIA').AsString     := qryAux.FieldByName('MESREFERENCIA').AsString;
              FieldByName('FLGPROCEDENCIA').AsInteger   := qryAux.FieldByName('FLGPROCEDENCIA').AsInteger;
              FieldByName('SALDOCORRIGIDO').AsFloat     := qryAux.FieldByName('SALDOCORRIGIDO').AsFloat;
              FieldByName('INDICECORRECAO').AsFloat     := qryAux.FieldByName('INDICECORRECAO').AsFloat;
              FieldByName('SALDOCOTAS').AsFloat         := dValorAtualizado;
              FieldByName('DATAINDICE').AsDateTime      := qryAux.FieldByName('DATAINDICE').AsDateTime;

              Post;
            End; // With qryDesindRes do

            With qryDResPart do
             Begin
              If Locate('IDPLANOPREV;IDPESSJUR;IDTIPORESERVA;IDPESSOA;SEQPROPOSTA',
                        VarArrayOf([qryAux.FieldByName('IDPLANOPREV').AsInteger,
                                    qryAux.FieldByName('IDPESSJUR').AsInteger,
                                    qryAux.FieldByName('IDTIPORESERVA').AsInteger,
                                    qryAux.FieldByName('IDPESSOA').AsInteger,
                                    qryAux.FieldByName('SEQPROPOSTA').AsInteger]),
                                    [loPartialKey])
               Then Begin
                 Edit;
                 FieldByName('VALORRESERVA').AsFloat := dValorAtualizado;
                 Post;
               End;

             End; // With qryDResPart do
           qryAux.Next;
         End; // While Not qryAux.Eof do

      End; // If sMesUltMov > sMesLimite
   End;
end;

procedure TfrmCadRequerBenefBfciario.VerificaProcessoEncerrado;
begin
 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('SELECT DISTINCT EL.MATRICULA, DP.MATRICULA, PTIT.NOME, PDEP.NOME, P.NUMEROPROCESSO,');
 qryAux.SQL.Add('       BF.NOME, P.DTEVENTO, PP.INSCRICAONUMERO, P.NUMEROPROCESSO, B.IDTITULAR,');
 qryAux.SQL.Add('       B.SEQPROPOSTA, B.IDPESSJUR, B.IDPLANOPREV, B.IDPLANOORIGEM');
 qryAux.SQL.Add('FROM PROCESSOBENEF P,');
 qryAux.SQL.Add('     BENEFBFCIARIO B,');
 qryAux.SQL.Add('     BENEFPLANPREV BPL,');
 qryAux.SQL.Add('     BENEFICIO     BF,');
 qryAux.SQL.Add('     PESSOA        PTIT,');
 qryAux.SQL.Add('     ELEGPATRO     EL,');
 qryAux.SQL.Add('     PARTPREVPLAN  PP,');
 qryAux.SQL.Add('     PESSOA        PDEP,');
 qryAux.SQL.Add('     DEPENTIT      DP');
 qryAux.SQL.Add('WHERE (P.NUMEROPROCESSO = B.NUMEROPROCESSO)');
 qryAux.SQL.Add('  AND (B.IDTITULAR = PTIT.IDPESSOA)');
 qryAux.SQL.Add('  AND (B.IDTITULAR <> B.IDPESSOA)');
 qryAux.SQL.Add('  AND (BF.IDBENEFICIO = B.IDBENEFICIO)');
 qryAux.SQL.Add('  AND (BPL.IDBENEFICIO = B.IDBENEFICIO)');
 qryAux.SQL.Add('  AND (BPL.IDPLANOPREV = B.IDPLANOPREV)');
 qryAux.SQL.Add('  AND (EL.IDPESSOA = B.IDTITULAR)');
 qryAux.SQL.Add('  AND (EL.IDPESSJUR = B.IDPESSJUR)');
 qryAux.SQL.Add('  AND (BF.FLGDESTBENEF <> ''P'')');
 qryAux.SQL.Add('  AND (B.IDPESSJUR = PP.IDPESSJUR)');
 qryAux.SQL.Add('  AND (B.IDPLANOORIGEM = PP.IDPLANOPREV )');
 qryAux.SQL.Add('  AND (B.IDTITULAR = PP.IDPESSOA)');
 qryAux.SQL.Add('  AND (B.SEQPROPOSTA = PP.SEQPROPOSTA)');
 qryAux.SQL.Add('  AND (B.IDPESSOA = PDEP.IDPESSOA)');
 qryAux.SQL.Add('  AND (DP.IDTITULAR = B.IDTITULAR)');
 qryAux.SQL.Add('  AND (DP.IDPESSOA = B.IDPESSOA)');
 qryAux.SQL.Add('  AND (DP.IDTITULAR = '+IntToStr(iIdTitular)+')');
 qryAux.SQL.Add('  AND (P.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+')');
 // Thiago Melo SOL 238053.16451 PPM 496100
 qryAux.SQL.Add('  AND (B.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ')');
 // Thiago Melo SOL 238053.16451 PPM 496100
 qryAux.SQL.Add('  AND (P.IDSITPROCESSO = 3)');

 qryAux.Open;

 If qryAux.IsEmpty
  Then Begin
    bFlgBenefMorte := False;
    sbtnInserirClick(Self);
    Exit;
  End;
 // HIGOR NAYDE FERREIRA SOL 211709/15287
  if (sistema.idmodulo <> 454)then begin
     If MsgDlg('Existe um processo encerrado para este evento.'+#13+
               'Deseja reabri-lo?','Processo Encerrado',mtConfirmation,
               [mbYes,MbNo],0) = mrNo
      Then Begin
        bFlgBenefMorte := False;
        sbtnInserirClick(Self);
        Exit;
      End;
  end;
  // HIGOR NAYDE FERREIRA SOL 211709/15287

 MontaSelect.Filtro.Add('DP.IDTITULAR = '+IntToStr(iIdTitular));
 MontaSelect.Filtro.Add('P.IDEVENTOGERADOR = '+IntToStr(iIdEvento));
 MontaSelect.Filtro.Add('P.IDSITPROCESSO = 3');

 MontaSelect.RepeteConsulta := True;
 MontaSelect.ExibePergunta := False;
 MontaSelect.ItemsBusca.Clear;
 MontaSelect.ItemsBusca.Add(qryAux.FieldByName('MATRICULA').AsString);
 MontaSelect.Executar;

 If MontaSelect.RetornouValor
  Then CmeCadastroFind(Self)
  Else Begin
    bFlgBenefMorte := False;
    sbtnInserirClick(Self);
    Exit;
  End;

 sbtnAlterarClick(Self);
end;


{Ádler Souza - SOL 132110 KINTANA 758869
function TfrmCadRequerBenefBfciario.ComparaPLanoContabil(pIdPessoa,
  IdPLanoPrevContab, IdplanoPrev, pIdTitular: Integer): Boolean;
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
      '   NULL AS datafinal,       '+  ////Renato Visoni SOL 127345 Kintana 674527
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

//BRUNO AZEVEDO SOL 152307 KINTANA 1131419
procedure TfrmCadRequerBenefBfciario.dbeMatriculaBenefExit(
  Sender: TObject);
var
  xQry: TwwQuery;
begin
  inherited;
  iIdPessoa    := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;
     try
      xQry := TwwQuery.Create(Self);
      with xQry do begin
        DatabaseName := 'BaseDados';
        Close;
        Sql.Clear();
        Sql.Add('SELECT IDPESSOA, ');
        Sql.Add('       MATRICULA AS MATRICULA' );
        Sql.Add('  FROM DEPENTIT ');
        Sql.Add(' WHERE MATRICULA =  ' + QuotedStr(dbeMatriculaBenef.Text));
        Sql.Add(' AND   IDPESSOA  <> ' + Inttostr(iIdPessoa));  //SOL 169376 Kintana 1501396
        //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
        if (MatriculaBenefInicial <> '') then begin
          SQL.Add('   AND MATRICULA <> ' + QuotedStr(MatriculaBenefInicial));
        end;
        //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
        Open;
      end;

      if xQry.Recordcount > 0 then begin
        MsgDlg('Matrícula já existe. ','Informação',mtInformation,[mbOk],0);
        //dbeMatriculaBenef.SetFocus();  // Vinicius Ferreira SOL 159322 KINTANA 1308856
      end;
    finally
      FreeAndNil(xQry);


  end;

end;


procedure TfrmCadRequerBenefBfciario.dbeMatriculaBenefKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  //BRUNO AZEVEDO SOL 164472 KINTANA
  Key := #0;
end;

procedure TfrmCadRequerBenefBfciario.dbeMatriculaBenefKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //BRUNO AZEVEDO SOL 164472 KINTANA
  if (Key = VK_DELETE) then begin
    Key := VK_RETURN;
  end;
end;

//Fanuel Junior SOL149463 Kintana1050263
function TfrmCadRequerBenefBfciario.qryBuscaValorTitular: String;
begin
Result :=  ' SELECT NVL(BBC.VALORBASE1, 0)   AS VALORBASE1,'+
           '        NVL(BBC.VALORBASE2, 0)   AS VALORBASE2,'+
           '        NVL(BBC.VALORBASE3, 0)   AS VALORBASE3,'+
           '        BBC.IDSITBENEFICIO,     '+
           '        BBC.IDBENEFICIO         '+
           '   FROM BENEFBFCIARIO BBC , PLANPREVCONTABIL PC '+
           '  WHERE BBC.IDPESSOA  = '+ IntToStr(iIdTitular)+
           '    AND BBC.IDTITULAR = '+ IntToStr(iIdTitular)+
           '    AND BBC.IDPESSJUR = '+ IntToStr(iIdPessJur)+
           '    AND BBC.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev)+
           '    AND BBC.IDPLANPREVCONTAB = PC.IDPLANOPREV '+
           //'    AND BBC.IDPLANPREVCONTAB = '+ IntToStr(iIdPlanoPrev)+
           //'    AND BBC.IDPLANPREVCONTAB = '+ qryDet.FieldByName('IDPLANPREVCONTAB').AsString+
           '    AND BBC.FONTEPAGADORA = 1    '+
           '    AND BBC.IDTPPAGTOBENEFIC = 1 ';
end;
//Fanuel Junior SOL149463 Kintana1050263



//Fanuel Junior SOL148463 Kintana1050263
procedure TfrmCadRequerBenefBfciario.ValidaTitular;
var
  qryValorTitular : TwwQuery;
begin
  //Fanuel Junior SOL148463 Kintana1050263
  qryValorTitular := TwwQuery.Create(nil);
  qryValorTitular.DataBaseName := 'BASEDADOS';
  qryValorTitular.Close;
  qryValorTitular.SQL.Clear;
  qryValorTitular.SQL.Add(qryBuscaValorTitular);
  qryValorTitular.Open;    //0182254

  rValorTitular1 := qryValorTitular.FieldByName('VALORBASE1').AsFloat;
  rValorTitular2 := qryValorTitular.FieldByName('VALORBASE2').AsFloat;
  rValorTitular3 := qryValorTitular.FieldByName('VALORBASE3').AsFloat;

  if qryBeneficio.FieldByName('FLGVALORTITULAR1').AsInteger = 1 then
     rOpcao1 := rValorTitular1;

  if qryBeneficio.FieldByName('FLGVALORTITULAR2').AsInteger = 1 then
     rOpcao2 := rValorTitular2;

  if qryBeneficio.FieldByName('FLGVALORTITULAR3').AsInteger = 1 then
     rOpcao3 := rValorTitular3;

  bFaltaValorTitular :=  ((qryBeneficio.FieldByName('FLGVALORTITULAR1').AsInteger = 1) and  (rOpcao1 = 0)) or
                         ((qryBeneficio.FieldByName('FLGVALORTITULAR2').AsInteger = 1) and  (rOpcao2 = 0));

  FreeAndNil(qryValorTitular);
end;
//Fanuel Junior SOL148463 Kintana1050263

procedure TfrmCadRequerBenefBfciario.DbLAlteradorKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key <> #0 then
       Key := #0;
end;

// edilaine - SOL 253577-17374 / PPM 848182 - inicio
procedure TfrmCadRequerBenefBfciario.AjustaTela;
begin
  {RN015 - Os campos referentes ao Valor BS e Valor FAB não devem ser apresentados no requerimento por Idade}
  pnlBSFAB.Visible := bFlgApresentaBSFAB;

  //edilaine WO18367 : inicio
  grpInfTitular.Visible := (bFlgApresentaBSFAB);
  lblTotTitular.visible := (bFlgApresentaBSFAB) and (qryBeneficio.FieldByName('IDBENEFICIO').AsInteger <> 496);
  reVlrTotalTit.visible := (bFlgApresentaBSFAB) and (qryBeneficio.FieldByName('IDBENEFICIO').AsInteger <> 496);
  if bFlgApresentaBSFAB then
  begin
    edNumDepBtnClick(edNumDep);
    CarregaValorBsFabTitular();
  end;
  //edilaine WO18367 : fim

  {RN16 - o sistema deverá verificar se o campo referente ao flag de apresentação da base de cálculo do déficit está marcado}
  reValorDeficit.Visible := bFlgApresentaDeficit;
  lblDeficit.Visible     := bFlgApresentaDeficit;

  if (sTipoFormChamador = 'EV') then
  begin
    {RN20 - Para edição da Base de Cálculo do Déficit a parametrização deverá obedecer a marcação do campo Valor Total do Benefício}
    //reValorDeficit.ReadOnly := (bFlgApresentaDeficit) and (qryBeneficio.FieldByName('FLGACTVLRTOTBEN').AsInteger = 0);
    reValorDeficit.ReadOnly := (qryBeneficio.FieldByName('FLGACTVLRTOTBEN').AsInteger = 0);
    {RN20 - Para edição do Valor Atual do BS e do FAB a parametrização é a marcação do campo Valor Atual}
    reValorBS.ReadOnly     := (qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 0);
    reValorBSAtu.ReadOnly  := (qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 0);
    reValorFAB.ReadOnly    := (qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 0);
    reValorFABAtu.ReadOnly := (qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 0);

  end;

  if (bFlgApresentaDeficit) then
  begin
    lblDeficit.Left     := pnlNaoBenefProv.width - lblDeficit.width - 5;
    reValorDeficit.Left := lblDeficit.left;

    pnlVrlBenef.Left    := reValorDeficit.left - reValorBeneficio.width - 25;
    pnlVrlBenef.Top     := pnlBSFAB.Top;
  end
  else if (not bFlgApresentaBSFAB) then
  begin
    if dbrgrpBenefProvisorio.ItemIndex = 0 then
       pnlVrlBenef.Top := 3
    else
       pnlVrlBenef.Top := pnlBSFAB.Top;

    pnlVrlBenef.Left    := pnlNaoBenefProv.width - pnlVrlBenef.width - 8;
  end;

  if pnlBSFAB.visible then
  begin
    pnlVrlBenef.Top     := pnlBSFAB.Top;
    pnlBSFAB.BevelOuter := bvNone;
  end;
  grpInfSupl.Height := (pnlVrlBenef.Top + pnlVrlBenef.Height) + 19;

end;

function TfrmCadRequerBenefBfciario.VerificaOpcoesObrigatorias: boolean;
begin
   Result := false;

   if ((qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) And
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
      Exit;
   end;

   Result := true;
end;


procedure TfrmCadRequerBenefBfciario.reValorFABBtnClick(Sender: TObject);
var
  rValorFAB      : double;
  bErro          : boolean;
  iIdCalculoAnt  : longint;
  sMsgErro       : string;
  sMesReferencia : string;
  sSQLBenefAssoc : string;
  rValorFABTit   : double;         //edilaine WO18367
begin
  inherited;

  // valida fator autorial
  {RN15 - O fator atuarial será obrigatório para requerimento de benefícios que exigem o BS e FAB parametrizado com esta opção}
  if not VerificaOpcoesObrigatorias() then
     Exit;

  //edilaine WO18367 : inicio
  if (rePercPensao.text = '') then
     rePercPensao.text := '0';
  //edilaine WO18367 : fim

  if qryBeneficio.FieldByName('IDREGRACALCFAB').AsInteger <= 0 then
     Exit;

  frmAguarde.Mostra('Regra de Cálculo do FAB - Nº '+qryBeneficio.FieldByName('IDREGRACALCFAB').AsString);

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorFAB      := 0;
     iIdCalculoAnt  := iIdCalculo;
     sMesReferencia := formatdatetime('yyyy/mm', dtInicioFund.date);

     rValorFAB :=  ExecutaRegraCalculoDeficit('FAB', qryAux,
                                              qryBeneficio.FieldByName('IDREGRACALCFAB').AsInteger,
                                              iIdPlanoPrev,
                                              iIdPessJur,
                                              iIdPessoa,
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
                                              dtInicioFund.text,            // edilaine - SOL 253577-18064 / PPM 1240079
                                              rePercPensao.text             //edilaine WO18367
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


procedure TfrmCadRequerBenefBfciario.reValorBSBtnClick(Sender: TObject);
var
  rValorBS       : double;
  bErro          : boolean;
  sMsgErro       : string;
  iIdCalculoAnt  : longint;
  sMesReferencia : string;
  sSQLBenefAssoc : string;
  rValorBSTit    : double;             //edilaine WO18367
begin
  inherited;

  if qryBeneficio.FieldByName('IDREGRACALCBS').AsInteger <= 0 then
     Exit;

  //edilaine WO18367 : inicio
  if (rePercPensao.text = '') then
     rePercPensao.text := '0';
  //edilaine WO18367 : fim

  frmAguarde.Mostra('Regra de Cálculo do BS - Nº '+qryBeneficio.FieldByName('IDREGRACALCBS').AsString);

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorBS       := 0;
     iIdCalculoAnt  := iIdCalculo;
     sMesReferencia := formatdatetime('yyyy/mm', dtInicioFund.date);

     rValorBS := ExecutaRegraCalculoDeficit('BS', qryAux,
                                            qryBeneficio.FieldByName('IDREGRACALCBS').AsInteger,
                                            iIdPlanoPrev,
                                            iIdPessJur,
                                            iIdPessoa,
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
                                            dtInicioFund.text,            // edilaine - SOL 253577-18064 / PPM 1240079
                                            rePercPensao.text             //edilaine WO18367
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

procedure TfrmCadRequerBenefBfciario.reValorBSAtuBtnClick(Sender: TObject);
var
  rValorBS       : double;
  bErro          : boolean;
  iIdCalculoAnt  : longint;
  sMsgErro       : string;
  sMesReferencia : string;
  sSQLBenefAssoc : string;
  rPercProvisorio,
  rValorReserva,
  rValorBeneficio : double;
  sValorReserva :  string;
  iIdBeneficio : LongInt;
begin
  inherited;

  if qryBeneficio.FieldByName('IDREGRACALCBS').AsInteger <= 0 then
     Exit;

  frmAguarde.Mostra('Regra de Cálculo do BS - Nº '+qryBeneficio.FieldByName('IDREGRACALCBS').AsString);

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorBS       := 0;
     iIdCalculoAnt  := iIdCalculo;
     sMesReferencia := formatdatetime('yyyy/mm', dtInicioFund.date);

     rValorBS :=      ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                            qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                            -1,
                                                            iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                            iSeqProposta,
                                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                            iNumeroProcesso,
                                                            iNumBenef,
                                                            rOpcao1, rOpcao2, rOpcao3,
                                                            sSQLBenefAssoc,
                                                            FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), 
                                                            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), 
                                                            FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), 
                                                            reValorBS.text,
                                                            reValorInfInss.Text,
                                                            reValorCalcINSS.Text,
                                                            FloatToStr(rValorReserva),
                                                            bErro,
                                                            sMsgErro,
                                                            iIdCalculo,
                                                            qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                            qryBeneficiario.FieldByName('IdDependencia').AsString,
                                                            qryBeneficiario.FieldByName('Percentual').AsString,
                                                            1,
                                                            qryDet.FieldByName('DibBenefAnt').AsString,
                                                            qryDet.FieldByName('ValorBenefAnt').AsString,
                                                            '',
                                                            -1,
                                                            qryDet.FieldByName('FLGPROVISORIO').AsInteger,   
                                                            qryDet.FieldByName('PRAZOPROVISORIO').AsInteger, 
                                                            qryDet.FieldByName('PERCPROVISORIO').AsFloat,
                                                            0,    
                                                            qryDet.FieldByName('DATAREQUERIMENTO').AsString
                                                            ,-1, 0,          // edilaine - SOL 253577-17464 / PPM 955703
                                                            StrToFloat(ClienteNumero(reValorBS.text))
                                                            );

  except
     frmAguarde.Apaga;
  end;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorBSAtu.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  reValorBSAtu.Text := FormatFloat('#0.00',rValorBS);
end;

procedure TfrmCadRequerBenefBfciario.reValorFABAtuBtnClick(Sender: TObject);
var
  rValorFAB      : double;
  bErro          : boolean;
  iIdCalculoAnt  : longint;
  sMsgErro       : string;
  sMesReferencia : string;
  sSQLBenefAssoc : string;
  rPercProvisorio,
  rValorReserva,
  rValorBeneficio : double;
  sValorReserva :  string;
  iIdBeneficio : LongInt;
begin
  inherited;

  // valida fator autorial
  {RN15 - O fator atuarial será obrigatório para requerimento de benefícios que exigem o BS e FAB parametrizado com esta opção}
  if not VerificaOpcoesObrigatorias() then
     Exit;

  if qryBeneficio.FieldByName('IDREGRACALCFAB').AsInteger <= 0 then
     Exit;

  frmAguarde.Mostra('Regra de Cálculo do FAB - Nº '+qryBeneficio.FieldByName('IDREGRACALCFAB').AsString);

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

     rValorFAB      := 0;
     iIdCalculoAnt  := iIdCalculo;
     sMesReferencia := formatdatetime('yyyy/mm', dtInicioFund.date);

     rValorFAB :=      ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                            qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                            -1,
                                                            iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                            iSeqProposta,
                                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                            iNumeroProcesso,
                                                            iNumBenef,
                                                            rOpcao1, rOpcao2, rOpcao3,
                                                            sSQLBenefAssoc,
                                                            FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), 
                                                            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), 
                                                            FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), 
                                                            reValorFAB.text,
                                                            reValorInfInss.Text,
                                                            reValorCalcINSS.Text,
                                                            FloatToStr(rValorReserva),
                                                            bErro,
                                                            sMsgErro,
                                                            iIdCalculo,
                                                            qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                            qryBeneficiario.FieldByName('IdDependencia').AsString,
                                                            qryBeneficiario.FieldByName('Percentual').AsString,
                                                            1,
                                                            qryDet.FieldByName('DibBenefAnt').AsString,
                                                            qryDet.FieldByName('ValorBenefAnt').AsString,
                                                            '',
                                                            -1,
                                                            qryDet.FieldByName('FLGPROVISORIO').AsInteger,   
                                                            qryDet.FieldByName('PRAZOPROVISORIO').AsInteger, 
                                                            qryDet.FieldByName('PERCPROVISORIO').AsFloat,
                                                            0,    
                                                            qryDet.FieldByName('DATAREQUERIMENTO').AsString
                                                            ,-1, StrToFloat(ClienteNumero(reValorFAB.text)),          // edilaine - SOL 253577-17464 / PPM 955703
                                                            0
                                                            );

  except
     frmAguarde.Apaga;
  end;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorFABAtu.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  reValorFABAtu.Text := FormatFloat('#0.00',rValorFAB);
end;

procedure TfrmCadRequerBenefBfciario.pnlBSFABEnter(Sender: TObject);
begin
  inherited;
  if reValorFAB.visible then
     reValorFAB.setfocus;
end;

procedure TfrmCadRequerBenefBfciario.reValorFABKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmCadRequerBenefBfciario.reValorFABAtuKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmCadRequerBenefBfciario.reValorBSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmCadRequerBenefBfciario.reValorBSAtuKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;


procedure TfrmCadRequerBenefBfciario.reValorDeficitKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;
// edilaine - SOL 253577-17374 / PPM 848182 - fim


// edilaine - SOL 253577-17464 / PPM 955703
procedure TfrmCadRequerBenefBfciario.GeraDemonstrativo(const HoraHomologacao: String);
var
  iIdReport  : integer;
  sMensagem  : String;
  bDemonstraOK : boolean;
  iFontePagadora : integer;
  sTemAlterador : string;         // edilaine - SOL 262968 / PPM 1102753
  bConcessaoResgate : boolean;    // edilaine - SOL 253577-18174 / PPM 1327585
begin
   {Busca ID do report}
   if sParametrosDemonstra = emptyStr then
      iFontePagadora := qryDet.FieldByname('FONTEPAGADORA').AsInteger
   else
   begin
     iFontePagadora := StrToInt(copy( sParametrosDemonstra, pos('FONTEPAG', sParametrosDemonstra)+9, 1));
     sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'FONTEPAG='+IntToStr(iFontePagadora), '', []);
   end;

   // edilaine - SOL 253577-18174 / PPM 1327585 - comentado inicio
   {iIdReport := -1;
   qryAux.close;
   if iFontePagadora = 1 then
      qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativo de Concessão de Benefícios'' '
   else
      qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativo de Concessão de Benefícios do INSS'' ';
   qryAux.Open;
   if not qryAux.IsEmpty then
      iIdReport := qryAux.Fields[0].AsInteger;
   }// edilaine - SOL 253577-18174 / PPM 1327585 - comentado fim

   sTemAlterador := iff(Trim(dblAlterador.text) = '', 'N', copy(dblAlterador.text,1,1));   // edilaine - SOL 262968 / PPM 1102753

   bConcessaoResgate := VerificaLoteRestage(iIdLoteConcessao);    // edilaine - SOL 253577-18174 / PPM 1327585

   if iFontePagadora = 1 then
   begin
      if sParametrosDemonstra = emptyStr then
      begin
         // edilaine - SOL 253577-18174 / PPM 1327585 {no sParametrosDemonstra foi substituido o delimitador  |=| por |  apenas}
         sListaProcessosAux := qry.FieldbyName('NumeroProcesso').AsString; // edilaine - SOL 253577-18094 / PPM 1269549
         sParametrosDemonstra := InttoStr(iIdLoteConcessao) + '| ' +   // numLote
                                 InttoStr(iIdTitular)       + '| ' +   // idtitular
                                 InttoStr(iIdPessJur)       + '| ' +   // idPessJur
                                 InttoStr(iIdPlanoPrev)     + '| ' +   // idPlanoPrev
                                 InttoStr(iSeqProposta)     + '| ' +   // iSegProposta
                                 'PROC'+sListaProcessosAux  + '| ' +   //numprocesso // edilaine - SOL 253577-18094 / PPM 1269549
                                 Trim(dblkpcmbEvento.Text)  + '| ' +   // sEvento
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date) + '| ' +   // sDataEvento
                                 sdataInicioConcessao       + '| ' +   // sDataHoraConcessao
                                 sTemAlterador              + '| ' +   // FlgCorrecoes            // edilaine - SOL 262968 / PPM 1102753
                                 'PENSIONISTA'              + '| ' +   // Tipo concessao
                                 'visualiza|';                            // sDtHrHomologacao
                                 //lstDadosCorrecao.text + '|'      // edilaine - SOL 262968 / PPM 1102753
      end
      else
      begin
         sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'visualiza|', HoraHomologacao+'|', []);
         sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sListaProcessosAux, 'PROC'+sListaProcessos, []);// edilaine - SOL 253577-18094 / PPM 1269549
      end;

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
                                                 sMensagem);
      }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

      sParametrosDemonstra := sParametrosDemonstra + 'FONTEPAG='+qryDet.FieldByname('FONTEPAGADORA').AsString;
   end
   else
   begin
      // edilaine - SOL 253577-18174 / PPM 1327585 {no sParametrosDemonstra foi substituido o delimitador  |=| por |  apenas}
      if sParametrosDemonstra = emptyStr then
      begin
         sListaProcessosAux := qry.FieldbyName('NumeroProcesso').AsString;// edilaine - SOL 253577-18094 / PPM 1269549
         sParametrosDemonstra := 'PROC'+sListaProcessosAux  + '| ' +   //numprocesso // edilaine - SOL 253577-18094 / PPM 1269549
                                 InttoStr(iIdLoteConcessao) + '| ' +   // numLote
                                 InttoStr(iSeqProposta)     + '| ' +   // iSegProposta
                                 InttoStr(iIdPessJur)       + '| ' +   // idPessJur
                                 InttoStr(iIdPlanoPrev)     + '| ' +   // idPlanoPrev
                                 qryDet.FieldByName('IDPLANPREVCONTAB').AsString + '| ' + // idPlanoPrevContab
                                 qryDet.FieldByName('IDPLANOORIGEM').AsString    + '| ' + // idPlanoOrigem
                                 InttoStr(iIdTitular)       + '| ' +   // idtitular
                                 'visualiza|';
      end
      else
      begin
         sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'visualiza|', HoraHomologacao+'|', []);
         // edilaine - SOL 270813 / PPM 1336094 - inicio
         //sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sListaProcessosAux, 'PROC'+sListaProcessos+'|', []); // edilaine - SOL 253577-18094 / PPM 1269549
         sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sListaProcessosAux, 'PROC'+sListaProcessos, []); // edilaine - SOL 253577-18094 / PPM 1269549
         // edilaine - SOL 270813 / PPM 1336094 - fim
      end;

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

      sParametrosDemonstra := sParametrosDemonstra + 'FONTEPAG='+qryDet.FieldByname('FONTEPAGADORA').AsString;   // edilaine - SOL 262938 /  PPM 1099698

   end;


   if not bDemonstraOK then
      MsgDlg(sMensagem, 'Impressão do Demonstrativo de Concessão.', mtError, [], 0);

end;
// edilaine - SOL 253577-17464 / PPM 955703


// edilaine - SOL 253577-18094 / PPM 1269549 - inicio
Function TfrmCadRequerBenefBfciario.AssociaTaxas(bApresentaResumo : boolean = true): boolean;
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
                                    7, 0 // Alterado por FHBS - 08/10/2019 - SIG50850
                                    ) then
     begin
       MsgDlg('Erro ao associar taxas para o benefício.'+#13+sErro,'Erro',mtError,[mbOK],0);
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


// edilaine - SOL 253577-18129 / PPM 1303078 - incio
function TfrmCadRequerBenefBfciario.DeleteProcessoBenef(NumeroProcesso: string): boolean;
var  _qryAux : TwwQuery;
Begin
  Result := true;

  _qryAux := TwwQuery.create(nil);
  try
     with _qryAux  do
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
     _qryAux.Free;
   end;
end;

procedure TfrmCadRequerBenefBfciario.ConfiguraAcessosTela(tTipoAjuste : TTipoConfiguacaoTela);
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

procedure TfrmCadRequerBenefBfciario.DeletaBfciarioTitPlan(piIdNumeroProcesso:Integer);
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
  finally;
    _qryAux.Free;
  end;
End;

function TfrmCadRequerBenefBfciario.VerificaBeneficioxBenefTitPlan(piIdNumeroProcesso,
                                                                   piIdPessoa,
                                                                   piIdBenficio: Integer): boolean;
var  _qryAux : TwwQuery;
Begin
  _qryAux := TwwQuery.create(nil);
  try
    with _qryAux  do
    begin
       DataBaseName := 'basedados';
       SQL.Add(' SELECT * FROM BFCIARIOTITPLAN BT '+
               '  WHERE EXISTS ( SELECT 1 FROM BENEFBFCIARIO BF '+
               '   WHERE BF.IDPESSJUR     = BT.IDPESSJUR       '+
               '     AND BF.IDTITULAR     = BT.IDTITULAR       '+
               '     AND BF.IDPLANOORIGEM = BT.IDPLANOORIGEM   '+
               '     AND BF.IDPESSOA      = BT.IDPESSOA        '+
               '     AND BF.SEQPROPOSTA   = BT.SEQPROPOSTA     '+
               '     AND BF.IDPLANOPREV   = BT.IDPLANOPREV     '+
               '     AND BF.NUMEROPROCESSO = '+InttoStr(piIdNumeroProcesso)+
               '     AND BF.IDPESSOA       = '+InttoStr(piIdPessoa)+
               ' ) '+
               '  AND BT.IDBENEFICIO = '+InttoStr(piIdBenficio) );
       Open;
       Result := (not eof);
    end;
  finally
    _qryAux.free;
  end;
end;
// edilaine - SOL 253577-18129 / PPM 1303078 - fim


//edilaine - WO18367 : inicio
procedure TfrmCadRequerBenefBfciario.edNumDepBtnClick(Sender: TObject);
var
   iNumDep : integer;
begin
  inherited;
  iNumDep := RetornaNumeroDependentes(iIdTitular,
                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                      dtInicioFund.text);

  edNumDep.text := IntToStr( iNumDep );
  CalculaPercentualPensao();
end;

procedure TfrmCadRequerBenefBfciario.edNumDepKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then
     key := #0;
end;

function TfrmCadRequerBenefBfciario.CarregaValorBsFabTitular(bPreencheCampo : boolean = true) : double;
var
  rVlrBSSaldo    : double;
  rVlrSaldoFAB   : double;
  rValorTotalTit : double;
begin
  inherited;
  Result := 0;

  if not PegaValorBsFabTitular(qryAux,
                                iIdPlanoPrev,
                                iIdPessJur,
                                iIdPessoa,
                                iIdTitular,
                                qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                formatdatetime('yyyy/mm', dtInicioFund.date),
                                iif(qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0, '1', '2'),
                                qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger,
                                qryBeneficio.FieldByName('IDPLANPREVCONTAB').AsInteger,
                                rVlrBSSaldo,
                                rVlrSaldoFAB)
  then begin
    MsgDlg('Ocorreu um erro na Busca do Valores de FAB e BS', 'Erro', mtError,[mbOk],0);
    reVlrFabTit.Text := '0';
    reVlrBsTit.Text  := '0';
    Exit;
  end;

  if bPreencheCampo then
  begin
    reVlrFabTit.Text := FormatFloat('#0.00', rVlrSaldoFAB);
    reVlrBsTit.Text  := FormatFloat('#0.00', rVlrBSSaldo);

    if reVlrTotalTit.visible then
       rValorTotalTit   := rVlrSaldoFAB + rVlrBSSaldo;

    if rValorTotalTit = 0 then
       reVlrTotalTit.Text := ''
    else
    begin
      if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 0 then
         reVlrTotalTit.Text := FormatFloat('#0.00', rValorTotalTit)
      else
         reVlrTotalTit.Text := FormatFloat('#0.000000', rValorTotalTit);
    end;
  end
  else
  begin
    if (qryBeneficio.FieldByName('IDBENEFICIO').AsInteger = 500) then
    begin
      rValorTotalTit := rVlrSaldoFAB + rVlrBSSaldo;
      Result := rValorTotalTit;
    end;
  end;
end;

procedure TfrmCadRequerBenefBfciario.edNumDepChange(Sender: TObject);
var
  iNumDep  : integer;
begin
  inherited;

  if edNumDep.text = '' then
     rePercPensao.text := ''
  else
     CalculaPercentualPensao();

  reValorFAB.text       := '';
  reValorBS.text        := '';
  reValorFABAtu.text    := '';
  reValorBSAtu.text     := '';
  reValorTotal.text     := '';
  reValorBeneficio.text := '';
  reValorDeficit.text   := '';
end;

procedure TfrmCadRequerBenefBfciario.CalculaPercentualPensao;
var
  iNumDep : integer;
begin
  rePercPensao.text := '';
  if FlgNovaCalcPensaoSaldada(dtInicioFund.text) then
  begin
    if edNumDep.text <> '' then
    begin
      iNumDep := StrToIntDef(edNumDep.text, 0);
      rePercPensao.text := IntToStr( iff(iNumDep >= 3, 80, 50 + (iNumDep * 10)) );
    end;
  end
  else
     rePercPensao.text := '80';
end;

//edilaine WO16247 : inicio
function TfrmCadRequerBenefBfciario.BuscaIndice(pIDPESSJUR, pIDPESSOA,
                                                pIDPLANOPREV: String): Double;
var sSQL : String;
begin
  sSQL := ' SELECT DISTINCT CO.COTVALOR  '+
          ' FROM RESERVAPART RS,         '+
          '      RESERVAXPLANO TP,       '+
          '      PLANPREV PV,            '+
          '      COTACAOMOEDA CO,        '+
          '      MOEDA,                  '+
          '      (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(CO1.COTDATA) AS DATAMAX '+
          '         FROM RESERVAPART RP1, RESERVAXPLANO TP1, COTACAOMOEDA CO1 '+
          '        WHERE (RP1.IDPESSJUR     ='+ QuotedStr(pIDPESSJUR)+ ' )    '+
          '          AND (RP1.IDPESSOA      ='+ QuotedStr(pIDPESSOA)+ ' )     '+
          '          AND (RP1.IDPLANOPREV   ='+ QuotedStr(pIDPLANOPREV)+ ' )  '+
          '          AND (TP1.IDPLANOPREV = RP1.IDPLANOPREV)                  '+
          '          AND (TP1.IDTIPORESERVA = RP1.IDTIPORESERVA)              '+
          '          AND (CO1.MOECODIGO = TP1.INDICEREAJUSTE)                 '+
          '        GROUP BY TP1.INDICEREAJUSTE) MAXDATA                       '+
          ' WHERE (RS.IDPESSJUR   ='+ QuotedStr(pIDPESSJUR)+ ' )    '+
          '  AND (RS.IDPESSOA     ='+ QuotedStr(pIDPESSOA)+ ' )     '+
          '  AND (RS.IDPLANOPREV  ='+ QuotedStr(pIDPLANOPREV)+ ' )  '+
          '  AND (TP.FLGCONTROLE = 0)                                         '+
          '  AND (TP.IDPLANOPREV = RS.IDPLANOPREV)                            '+
          '  AND (TP.IDTIPORESERVA = RS.IDTIPORESERVA)                        '+
          '  AND (TP.INDICEREAJUSTE = MAXDATA.INDICERE(+))                    '+
          '  AND (TP.ANALITICOSINTETI = ''A'')                                  '+
          '  AND (PV.IDPLANOPREV = RS.IDPLANOPREV)                            '+
          '  AND (CO.MOECODIGO(+) = MAXDATA.INDICERE)                         '+
          '  AND (CO.COTDATA(+) = MAXDATA.DATAMAX)                            '+
          '  AND (MOEDA.MOECODIGO(+) = TP.INDICEREAJUSTE)                     '+
          '  AND (CO.COTVALOR IS NOT NULL)                                    ';

  QryBuscaIndice.Close;
  QryBuscaIndice.SQL.Clear;
  QryBuscaIndice.SQL.ADD(sSQL);
  QryBuscaIndice.Open;

  Result := QryBuscaIndice.FieldByname('COTVALOR').asFloat;

end;
//edilaine WO16247 : fim

end.
