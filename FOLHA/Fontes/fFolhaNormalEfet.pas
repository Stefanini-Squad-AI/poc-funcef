Unit fFolhaNormalEfet;
// Alterações:
//***************************************************************************************************
//Alteração  : ValidaVersao e BuscaRegVersao
//Nº WO......: 5879
//Data.......: 04/12/2023
//Responsável: André Imakawa
//Descrição..: validar apenas registros diferentes de flgtipodesc K
//***************************************************************************************************
//Alteração  : atualizaHstPrazoAcumulacaoFolha
//Nº SIG.....: 132342
//Data.......: 02/02/2023
//Responsável: André Imakawa
//Descrição..: Não atualizar HSTPRAZOACUMULACAOFOLHA quando Folha de Resgate/Portabilidade
//***************************************************************************************************
//Alteração  : ValidaContaBancaria
//Nº SIG.....: 123179
//Data.......: 11/02/2022
//Responsável: André Imakawa
//Descrição..: Ajuste para não criticar validação de conta salario para portador forma 308, 309 e 310
//***************************************************************************************************
//Alteração  : ValidaContaBancaria
//Nº SIG.....: 123059
//Data.......: 09/02/2022
//Responsável: André Imakawa
//Descrição..: Ajuste para não criticar validação de conta salario para portador forma 308, 309 e 310
//***************************************************************************************************
//Alteração  : ProcessaFaseHistrubsal
//Nº SIG.....: 79100
//Data.......: 05/07/2021
//Responsável: André Imakawa
//Descrição..: Alterado JOIN da PESSOAFISICA para PESSOA
//***************************************************************************************************
//Alteração  : Monitoramento e Contra_Cheque
//Nº SIG.....: 112010
//Data.......: 22/10/2020
//Responsável: André Imakawa
//Descrição..: Chamada do Serviço Web com Log e Monitoramento.
//***************************************************************************************************
//Alteração  : ProcessaCompensacaoAdiantamento e ProcessaRetornos
//Nº SIG.....: 101623
//Data.......: 22/10/2020
//Responsável: André Imakawa
//Descrição..: Passar a gravar o PerfilInvest para rubricas de adiantamento da folha extra.
//***************************************************************************************************
//Rotina     : ValidaContaBancaria
//Data       : 14/10/2020
//SIG        : 101624
//Autor      : Andre Imakawa
//Descrição  : Atualizar tipo conta quando estiver diferente da previa.
//***************************************************************************************************
//Alteração  : Monitoramento e GravaLog
//Nº SIG.....: 102321
//Data.......: 15/09/2020
//Responsável: Andre Imakawa
//Descrição..: Criação da propriedade MAQUINA
//***************************************************************************************************
//Rotina     : GeraArquivoPagamentoleiauteCNAB240
//Data       : 11/08/2020
//SIG        : 101541
//Autor      : Andre Imakawa / Cássio Florencio Rovaroto
//Descrição  : Gravar conta corrente conforme recuperado da PREVIA.
//***************************************************************************************************
//Rotina             : SetRegistrosArquivoPagamento, SetDocumentoArqPagamento, SetFavorecidoArqPagamento,
//                     SetTarifaBancariaArqPagamento, SetStatusDocArquivoPagamento,
//                     GeraArquivoPagamentoLeiauteCNAB150, GeraArquivoPagamentoleiauteCNAB240,
//                     ProcessaArquivobanco
//N. SIG..........   : 60540
//Data da Alteração: :
//Alteração Form:    : fFolhaNormalEfet
//Responsável:       : Cássio Florencio Rovaroto
//Descrição.......   : Adaptações na efetivação da folha de benefícios, para geração de dados para
//                     remessa eletrônica em formato SIACC 240.
//***************************************************************************************************
//Rotina     : Monitoramento e RetornaDiretorioETL
//Data       : 10/07/2020
//SIG        : 100935
//Autor      : Andre Imakawa
//Descrição  : Tratamento para ALIAS diferente de PRODUCAO.
//***************************************************************************************************
//Rotina     : MensagemValidacao, Terminar e Monitoramento
//Data       : 17/01/2020
//SIG        : 96394
//Autor      : Andre Imakawa
//Descrição  : Exibe mensagem no Monitoramento com o status
//***************************************************************************************************
//Rotina     : 
//Data       : 22/04/2019
//SIG        : 85168
//Autor      : Andre Imakawa
//Descrição  : Validação da Efetivação - ETL.
//***************************************************************************************************
//Rotina     : VerificaResgate
//Data       : 15/04/2019
//SIG        : 84679
//Autor      : Andre Imakawa
//Descrição  : Verificação de Lote de Resgate
//***************************************************************************************************
//Rotina     : Terminar, ProcessaFaseHistrubsal e ProcessaRetornos_ETL.
//Data       : 18/03/2019
//SIG        : 83524
//Autor      : Andre Imakawa
//Descrição  : Commit após finalizar efetivação
//***************************************************************************************************
//Rotina     : Monitoramento
//Data       : 25/02/2019
//SIG        : 82710
//Autor      : Andre Imakawa
//Descrição  : Monitoramento
//***************************************************************************************************
// Alteração  : atualizaBasePagamento
// Data       : 12/02/2019
// SIG        : 82154
// Autor      : Andre Imakawa
// Descrição  : Update na basedepagamento está lento.
//***************************************************************************************************
// Data       : 05/02/2019
// SIG        : 81798
// Autor      : Andre Imakawa
// Descrição  : Recompilação
//***************************************************************************************************
//Alteração  : Monitoramento, Processa e Terminar
//Nº SIG.....: 81948
//Data.......: 07/02/2019
//Responsável: Andre Imakawa
//Descrição..: Monitoramento e PGA
//***************************************************************************************************
//Alteração  : Executa_ETL, InsereETLEfetivacao, RetornaDiretorioETL, VerificaEfeticaoETL,
//             ProcessaFaseHistrubsal e ProcessaRetornos
//Nº SIG.....: 78705 / 78713
//Data.......: 03/11/2018
//Responsável: Andre Imakawa
//Descrição..: Chamar ETL para gravar dados na HISTRUBSAL  / RETORNOS
//***************************************************************************************************
//Alteração  : VerificaLoteSemPerfil e Processa
//Nº SIG.....: 74538
//Data.......: 04/09/2018
//Responsável: Andre Imakawa
//Descrição..: Não deixar Efetivar quando existir registro na PREVIA sem preenchimento do perfil.
//***************************************************************************************************
// Data       : 26/06/2018
// SIG        : 67668
// Autor      : Darivaldo Alencar
// Descrição  : Validação de perfil de investimento através de procedure cm.SP_FB_CHECKLIST_EFETIVACAO
//***************************************************************************************************
// Data       : 13/03/2018
// SIG        : 64961
// Autor      : Andre Imakawa
// Descrição  : Removido o exit. Quando a validação das informações não estão Ok sistema deve
//              continuar o fluxo normal.
//***************************************************************************************************
// Data       : 21/02/2018
// SIG        : SIG TIBERO
// Autor      : Everson Luiz Pereira da Cunha
// Descrição  : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
// Data       : 27/11/2017
// SIG        : 56702
// Autor      : Peterson Victor
// Descrição  : Alterações para tratar perfil de investimento
//***************************************************************************************************
//Alteração  :
//Nº SIG.....: SIG35762
//Data.......: 21/08/2017
//Responsável: Rodrigo Ramos
//Descrição..: Campo inclído 'RELACAODEPEN', este também foi incluido no SQL, nas tabelas:
//PREVIA e HISTRUBSAL conforme solicitado.
//
//------------------------------------------------------------------------------
//Pendência   : SIG 35803
//Responsável : André Imakawa
//Data        : 02/01/2017
//Descrição   : Erro ao gerar rateio de documento do tipo TED na efetivação da folha
//------------------------------------------------------------------------------
//Alteração  :
//Nº SIG.....: SIG49055
//Data.......: 03/07/2017
//Responsável: Fernando Xavier
//Descrição..: O sistema não respeita a parametrização de códigos de natureza e
//             informe de rendimentos.
//------------------------------------------------------------------------------
//Alteração   : (dfm) PreparaContribuicaoPatro
//Pendência   : SIG 39907
//Responsável : Edilaine
//Data        : 10/02/2017
//Descrição   : Equacionamento - preparo de contribuição da patro
//------------------------------------------------------------------------------
//Alteração  : processaIRRegressivo
//Nº SIG.....: 47459
//Data.......: 08/06/2017
//Responsável: Andre Imakawa
//Descrição..: HSTPRAZOACUMULACAOFOLHA e HSTCALCULOPMPFOLHA devem ser atualizadas em situações
//             diferentes: HSTPRAZOACUMULACAOFOLHA(Apenas folha Resgate) e HSTCALCULOPMPFOLHA
//             (qualquer tipo de folha)
//------------------------------------------------------------------------------
//Pendência   : SOL 207789/16615 PPM 554283
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
//              Informações da Fita de Crédito
//------------------------------------------------------------------------------
//Alteração  : Form
//Nº SIG.....: 26633
//Data.......: 13/04/2017
//Responsável: Andre Imakawa
//Descrição..: chkExcessoDebito e cbEXEC_SP_MAPA iniciam com check = False
//------------------------------------------------------------------------------
//Pendência   : SIG 41892
//Responsável : André Imakawa
//Data        : 12/03/2017
//Descrição   : HSTPRAZOACUMULACAOFOLHA e HSTCALCULOPMPFOLHA devem ser feitas
//              somente para IR Regressivo independente de Folha Normal ou de Resgate.
//------------------------------------------------------------------------------
//Alteração  : RetornaInformeTipoOpcaoIR
//Nº SIG.....: 40670
//Data.......: 01/03/2017
//Responsável: Andre Imakawa
//Descrição..: Caso IRRegressivo e não existir parametrização, utilizar
//             o CODDARF do IR Progressivo.
//------------------------------------------------------------------------------
//Pendência   : SIG 28145
//Responsável : André Imakawa
//Data        : 26/09/2016
//Descrição   : Para FontePagadora = 2 não deve verificar parametrização de IR
//              Regressivo
//------------------------------------------------------------------------------
//Pendência   : SIG 29797
//Responsável : Andre Imakawa
//Data        : 28/09/2016
//Descrição   : CodDocumento não está sendo atualizado para CODPORTFORMA 189,165,139,102,72.
//              Necessario criar a coluna IDFAVDOC na tabela HISTRUBSAL.
//------------------------------------------------------------------------------
//Pendência   : SOL 269049 PPM 1287659
//Responsável : Fernando Xavier
//Data        : 15/03/2016
//Descrição   : Sistema lança código do informe de rendimento incorreto sem
//              respeitar parametrização pré-estabelecida
//------------------------------------------------------------------------------
//Nº SOL.....: 270393
//PPM........: 1348254
//Data ......: 01/04/2016
//Alteração..: apenas executa atualizaHstCalculoPMPFolha e atualizaHstPrazoAcumulacaoFolha
//             quando for folha de resgate/resgate parcelado.

//Responsável: André Imakawa
//Descrição:  Erro Previa e Efetivação PRAZO ACUMULACAO FOLHA Identificamos que os processos de
//            previa e efetivação da folha de benefícios estão alterando registros da tabela
//            HSTPRAZOACUMULACAOFOLHA pertencentes exclusivamente a folha de resgate. Esse erro
//            tem ocasionado frequentes inconsistências no calculo do IR para resgates. Além do
//            exposto acima, identificamos também que a rotina de efetivação do resgate não esta
//            alimentando os campos FLGPROCESSADO e IDHSTFOLHABENEF
//------------------------------------------------------------------------------
//Pendência   : SOL 258357/17801 PPM 1083052
//Responsável : Felipe A. Santos
//Data        : 30/09/2015
//Descrição   : Verificação do mês de referencia das rubricas de RRA para os lotes
//              Selecionados.
//------------------------------------------------------------------------------
//Pendência   : SOL 263531 PPM 1118462
//Responsável : Fernando Xavier
//Data        : 20/10/2015
//Descrição   : Sistema apresenta erro durante a efetivação
//------------------------------------------------------------------------------
//Pendência   : SOL 261754 PPM 1072844
//Responsável : Fernando Xavier
//Data        : 28/09/2015
//Descrição   : Lentidão anormal no processo de efetivação
//------------------------------------------------------------------------------
//Pendência   : SOL 260044 PPM 1028226
//Responsável : Petri Nocentini
//Data        : 20/08/2015
//Descrição   : Verificar se é lote de resgate antes de atualizar a tabela
//              HSTPRAZOACUMULACAOFOLHA 
//------------------------------------------------------------------------------
//Pendência   : SOL 259740 PPM 761404
//Responsável : Higor Nayde Ferreira
//Data        : 24/08/2015
//Descrição   : Sistema lança código do informe de rendimento incorreto sem
//              respeitar parametrização pré-estabele..
//------------------------------------------------------------------------------
//Pendência   : SOL 252332 PPM 761404
//Responsável : Helio Lima Custodio
//Data        : 28/04/2015
//Descrição   : Atualizar os valores VALORRECEBIDO, DATARECEBIMENTO e SITENVIO
//              da tabela TMPDESC para as rubricas com FLGTIPODESC = J
//------------------------------------------------------------------------------
//Pendência   : SOL 252458 KINTANA 754788
//Responsável : BRUNO AZEVEDO
//Data        : 22/04/2015
//Descrição   : NÃO ESTAVA CARREGANDO O LOTE DA PREVIA AO PROCESSAR OS LOTES PENDENTES,
//              FAZENDO COM QUE NÃO INSERISSE NA BASEPGTOEFETIVAÇÃO VERSÕES PENDENTES.
//------------------------------------------------------------------------------
//Pendência   : SOL 242740 PPM 575822
//Responsável : Fernando Xavier
//Data        : 06/03/2015
//Descrição   : Queda de performance do processamento da prévia
//------------------------------------------------------------------------------
//Pendência   : SOL 247170 PPM 649841
//Responsável : Fernando Xavier
//Data        : 23/01/2015
//Descrição   : ** PROJETO MELHORIA DE PERFORMANCE DA FOLHA DE BENEFÍCIOS O processo de
//              efetivação esta fazendo busca na histrubsal para atualizar o campo
//              flgprocessado, sendo que o correto seria atualizar somente registros
//              que ainda não foram efetivados.
//------------------------------------------------------------------------------
//Pendência   : SOL 244007/16804 - PPM 614680
//Responsável : Higor Nayde Ferreira
//Data        : 26/12/2014
//Descrição   : Alteração da Efetivação para contemplar o FLGTIPODESC = D - Dívida de Benefício
//------------------------------------------------------------------------------
//Pendência   : SOL 151061-10442 - KINTANA 1720319
//Responsável : Helio Lima Custodio
//Data        : 30/06/2014
//Descrição   : Correção no Calculo do IR Regressivo
//--------------------------------------------------------------------------------
//Pendência   : SOL 151061 - KINTANA 1105188
//Responsável : MARCIO MORAIS
//Data        : 16/11/2012
//Descrição   : Calculo do IR Regressivo
//--------------------------------------------------------------------------------
//Pendência   : SOL 136569 KINTANA 820997
//Responsável : MARCIO DENILSON
//Data        : 16/02/2012
//Descrição   : Rotina tratamento excesso de débito
//----------------------------------------------------------------------------------
//**************************************************************************************************
//Pendência   : SOL 205224/15237 Kintana 2048156
//Responsável : Douglas Siqueira
//Data        : 04/11/2013
//Descrição   : Atividade aberta para recebimento do produto do ajuste do 13º dos idosos e do manual de histórico de benefícios - atividade 15007..
//--------------------------------------------------------------------------------
//**************************************************************************************************
//Pendência   : SOL 214523 Kintana 2043162
//Responsável : Fernando Xavier
//Data        : 29/08/2013
//Descrição   : Gerando os lançamentos da TED com um unico valor para todas as pessoas.
//--------------------------------------------------------------------------------
//Pendência   : SOL 205224
//Responsável : douglas.siqueira
//Descrição   : IN1343 .
//**************************************************************************************************
//Pendência   : SOL 203937 Kintana 1974720
//Responsável : Thiago Melo
//Data        : 23/07/2013
//Descrição   : Problemas na efetivação da TED
//--------------------------------------------------------------------------------
//Pendência   : SOL 178922 KINTANA 1645281
//Responsável : MARCIO DENILSON
//Data        : 02/03/2012
//Descrição   : Alteração da rotina de rateio de documentos de TED
//--------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : FERNANDO XAVIER
//Data        : 12/01/2012
//Descrição   : Cadastro Previdenciário - Resgate de Contribuições
//--------------------------------------------------------------------------------
//Pendência   : SOL 163938 KINTANA 1410369
//Responsável : MARCIO DENILSON
//Data        : 02/03/2012
//Descrição   : Alteração da rotina de geração de TED. Correção do valor do documento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 164763 Kintana 1419360
//Responsável : Fernando Xavier
//Descrição   : Erro no contador de participantes.
// -----------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
//Pendência   : SOL 163247 KINTANA 1392627
//Responsável : BRUNO AZEVEDO
//Data        : 15/08/2011
//Descrição   : Ajuste no caminho do log gerado.
//------------------------------------------------------------------------------
//Pendência   : SOL 156410 Kintana 1232584
//Responsável : Renato Visoni
//Descrição   : Ajuste na desativação de rubricas individuais.
//--------------------------------------------------------------------------------
//Pendência   : SOL 149567 KINTANA 1075547
//Responsável : Fernando Xavier
//Data        : 09/11/2010
//Descrição   : Identificamos que o mecanismo que gera os demonstrativos automaticamente,
//              após a efetivação da folha não está funcionando
//--------------------------------------------------------------------------------
//Pendência   : SOL 147218 KINTANA 1015910
//Responsável : BRUNO AZEVEDO
//Data        : 08/11/2010
//Descrição   : Na opção "Folha de Resgate" acrescentar "/Portabilidade" na Prévia e Efetivação.
//--------------------------------------------------------------------------------
// Autor(a)  : Renato Visoni
// Pendencia : SOL 138251 kintana 840758
// Alteração : Processo da efetivação para lote de resgate.
//------------------------------------------------------------------------------
// Autor(a)    :  Renato Visoni
// Pendência   :  SOL 143380 Kintana 943521
// Descrição   :  Se eu efetivar duas versões de adto Extra folha, e estornar
// uma o sistema não considera a versão que foi considerado o estorno e apagas
// todas as rubricas individuais da tabela RubricaIndiv.
// Ficando assim sem a cobrança devida na próxima folha normal.
//------------------------------------------------------------------------------
//Pendência   : SOL 140974 KINTANA 889580
//Responsável : BRUNO AZEVEDO
//Data        : 05/08/2010
//Descrição   : Correção na atualização de Dependentes. Salvar Previa\Efet\Preparo na rede.
//--------------------------------------------------------------------------------
//Pendência   : SOL 137211 KINTANA 829681
//Responsável : BRUNO AZEVEDO
//Data        : 15/06/2010
//Descrição   : Correção na query que busca o valor para lancto na hstfolhabenefcap.
//--------------------------------------------------------------------------------
//Pendência   : SOL 134696 KINTANA 796614
//Responsável : BRUNO AZEVEDO
//Data        : 28/04/2010
//Descrição   : Ao fazer o UPDATE na HISTRUBSAL, adicionar a cláusula
//              'IDRESPONSAVEL = IDFAVDOC', caso o portadorforma in 189,165,139,102,72.
//--------------------------------------------------------------------------------
//Pendência   : SOL 134131 KINTANA 786673
//Responsável : BRUNO AZEVEDO
//Data        : 15/04/2010
//Descrição   : Ao fazer o UPDATE na HISTRUBSAL, adicionar a cláusula
//              'IDRESPONSAVEL = IDFAVDOC', caso o portadorforma not in 92,96,99.
//--------------------------------------------------------------------------------
//Pendência   : SOL 133967 KINTANA 784165
//Responsável : BRUNO AZEVEDO
//Data        : 12/04/2010
//Descrição   : Formatar o campo ULTMESPREPARO, redefinido, no insert gravar sempre null.
//--------------------------------------------------------------------------------
//  Autor(a)   : Daniel Begnami
//  Data       : 09.07.2009
//  Pendencia  : 111915
//  Alteração  : Foi alterado a conta de conta PREFERENCIAL para conta SALAÁRIO (TIPOCONTA = 2).
//--------------------------------------------------------------------------------
//Pendência   : SOL 133133 KINTANA 773576
//Responsável : BRUNO AZEVEDO
//Data        : 30/03/2010
//Descrição   : Na validação do número sequencial, retirada a condição pelo idtitular.
//--------------------------------------------------------------------------------
//Pendência   : SOL 132145 KINTANA 759285
//Responsável : BRUNO AZEVEDO
//Data        : 11/03/2010
//Descrição   : Quando o tipo de processamento for 5 (Extra) gravar flgpermanente = 1.
//------------------------------------------------------------------------------
// Autor(a)    :  Thiago Passos
// Data        :  03/03/2010
// Pendência   :  SOL 131811 Kintana 753556
// Descrição   :  Ajuste na gravação do documento na histrubsal
//------------------------------------------------------------------------------
// Autor(a)    :  Daniel Begnami
// Data        :  20/01/2010
// Pendência   :  SOL 129635
// Descrição   :  Correçao na Efetivação na qual estava ocasionando erro ao processar os documentos.
//------------------------------------------------------------------------------
// Autor(a)    :  Thiago Passos
// Data        :  08/02/2010
// Pendência   :  SOL 130770 Kintana 735946
// Descrição   :  Quando For uma Folha Extra, o Campo RubricaIndiv.FlgPermanente
//                Obrigatoriamente tem que ser = 0
//------------------------------------------------------------------------------
// Autor(a)    :  Luis Dornellas
// Data        :  30/09/2009
// Pendência   :  SOL 121617 Kintana 588199
// Descrição   :  Implementação do campo NUMDOCUMENTO na tabela HISTRUBSAL
//------------------------------------------------------------------------------
// Autor(a)    :  Daniel Begnami
// Data        :  18/09/2009
// Pendência   :  SOL 122512 Kintana 602764
// Descrição   :  Ajustar a procedure mapa da folha de beneficios para conciliação contábil,
//                de forma que seja liberado automaticamente após efetivação da Folha.
//------------------------------------------------------------------------------
// Autor(a)    :  Renato Visoni
// Data        :  07/05/2009
// Pendência   :  SOL 107088 Kintana 507022
// Descrição   :  Implementação do IDBENEFICIO na tabela HISTRUBSAL
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 26/02/2009
// Rotina      : datasPagto
// Pendência   : SOL110083 Kintana 501795
// Descricao   : O sistema estava salvando a data de pagamento errada na HISTRUBSAL.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 20/02/2009
// Rotina      : dptDtProgramadaExit
// Pendência   : SOL 109776 Kintana 498569
// Descricao   : O sistema Não estava acatando a data de pagamento quando alterada.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 10/02/2009
// Rotina      : Processa
// Pendência   : Sol 108334 / Kintana 488340
// Descricao   : O sistema estava apresentando uma Critica ao processar a Regeração Contabil.
//               Critica: Erro nos Parametros contábeis!!!!
//------------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Data        : 27/11/2008
// Rotina      : Processa
// Pendência   : sol 102448 / kintana 455526
// Descricao   : As validações de datas faziam o sistema entrar em loop pois chamava o primeiro registro marcado (processar=1) da qrylista.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 29/10/2008
// Rotina      : ProcessaCompensacaoAdiantamento
// Pendência   : 99580_438893
// Descricao   : No momento da efetivação o sistema esta lançando corretamente os itens de adiantamento
//               na tabela RUBRICAINDIV.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 17/07/2008
// Rotina      : ProcessaRetornos
// Pendência   : 90476_381341
// Descricao   : Gravar o campo IDPLANOCONTABIL na tabela RUBRICAINDIV
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 26/02/2008
// Rotina      : Processa
// Pendência   : 22537 (ReAbertura)
// Descricao   : Disparar a geração automaticamente a geração do arquivo dos
//               demonstrativos no modulo FUNCEF (Contra-Cheque)
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/01/2008
// Rotina      : Inicializa
// Pendência   : 27063
// Descricao   : Decrementar o numero da parcela quando ocorrer excesso de debito quando for convenio externo
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 26/10/2007
// Rotina      : ProcessaFaseHistrubsal
// Pendência   : 26576
// Descricao   : Ajuste na gravação da hstfolhabenefcap quando a concessão for de portabilidade
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 29/08/2007
// Rotina      : Processa
// Pendência   : 22537
// Descricao   : Disparar a geração automaticamente a geração do arquivo dos
//               demonstrativos no modulo FUNCEF (Contra-Cheque)
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 10/09/2007
// Rotina      : GravaHstFolhaBenefCAP
// Pendência   : 21964 (ReAbertura)
// Descricao   : Gravar o campo dfloatpagtoalter na tabela HstFolhaBenefCap.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 23/08/2007
// Rotina      : ProcessaRetornos
// Pendência   : 26154
// Descricao   : Ajuste no inc da SeqRubricaIndiv
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 11/07/2007
// Rotina      : ProcessaDocumento
// Pendência   : 21962 (ReAbertura)
// Descricao   : Passar IDrecebePgto no lugar do IDPresponsavel.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 05/07/2007
// Rotina      : ProcessaFaseHistrubsal
// Pendência   : 20092
// Descricao   : Passar a gravar o novo campo na histrubsal IdProcJud.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 31/05/2008
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Novos parametros para o IntBanco.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/05/25007
// Rotina      : Diversas
// Pendência   : 21962
// Descricao   : Controlar o pagamento de beneficio de portabilidade para favorecidos EPP
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : ProcessaRetornos
// Pendência   : 21874
// Descricao   : Criar parâmetro para controle de desativação automática da
//   Rubrica individual, no processo de Efetivação de versão de pagamento.
//   Situações em que ocorre a desativação automática da rubrica individual:
//     - data final atingida
//     - parcela atingida
//     - saldo atingido
//   Opções:
//     0 - sem desativação
//     1 - desativação automática individual
//     2 - desativação automática geral (para qualquer registro na condição)
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 08/05/2007
// Rotina      : ProcessaRetornos
// Pendência   : 25271
// Descricao   : Ajuste na gravação do mes referencia gravado na efetivação.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : Processa
// Pendência   : 24693
// Descricao   : Força a verificação da Prévia para lote de Folha Extra.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 12/04/2007
// Rotina      : ProcessaFaseHistRubsal, ProcessaDocumentos e ProcessaArquivoBanco
// Pendência   : 21964 (Reabertura)
// Descricao   : Controle de Float e float alternativo para data programada.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/04/2006
// Rotina      : ProcessaRetornos
// Pendência   : 24962
// Descricao   : Atualizar o campo ULTMESATUALIZA, quando o valor da compensação
//   de IR for atualizado por índice.
//------------------------------------------------------------------------------
// Data        : 13/03/2006
// Rotina      : ProcessaRetornos
// Pendência   : 24728
// Descricao   : Ajuste na atualização do saldo total de IR compensado.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : ProcessaCompensaçãoAdiantamento
// Data      : 22/01/2007
// Pendencia : 20814
// Alteração : Inclusão de um De/Para para as rubricas de compensação de adiantamento
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//-----------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 10/01/2007
// Rotina      : ValidaParametrosCF
// Pendência   : 19500
// Descricao   : Retirada mensagem de "erro" quando não havia retorno de registros (a prévia não
//               processou) para um determinado lote
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : InsereTmpdesc
// Data      : 05/01/2007
// Pendencia : 24045
// Alteração : Acertar o codprovdesc da rubrica de contribuição sobre ação judicial ganha.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : AtualizaParametrosCF
// Data      : 22/12/2006
// Pendencia : 24017
// Alteração : Tratar novo tipo de rubrica 'R' referente a correção sobre benefício.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 06/12/2006
// Rotina      : ProcessaFaseHistRubsal
// Pendência   : 21964 (reabertura)
// Descricao   : Ajuste no controle de Float e float alternativo para data programada,
//               quando se seleciona a opção de não gerar arquivo eletrônico.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/11/2006
// Rotina      : ProcessaRetornos
// Pendência   : 21559
// Descricao   : Gravar o campo IdSeqInternoFB na inclusão de registros na RUBRICAINDIV.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/11/2006
// Rotina      : ProcessaFaseHistRubsal, ProcessaDocumentos e ProcessaArquivoBanco
// Pendência   : 21964
// Descricao   : Controle de Float e float alternativo para data programada.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 25/10/2006
// Rotina      : Processa
// Pendência   : 23611
// Descricao   : Reativar crítica de existência de Prévia contra Hstbenefbfciario.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/10/2006
// Rotina      : ProcessaArquivobanco
// Pendência   : 22675
// Descricao   : Filtrar na qryDadosRec apenas o documento referente a CPF.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/10/2006
// Rotina      : DFM
// Pendência   : 23569
// Descricao   : Colocar qryProcesso.Unidirecional = TRUE, para evitar o estouro
//  de memória da BDE.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/10/2006
// Rotina      : ProcessaArquivobanco
// Pendência   : 23561
// Descricao   : Não fazer quebra de valores por plano. Esta correção visa
//  suportar mais de um plano previdenciario.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 15/09/2006
// Rotina      : ProcessaRetornos
// Pendência   : 18767
// Descricao   : Tratar nova rubrica de adiantamento isenta de IR.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/07/2006
// Rotina      : ProcessaRetornos
// Pendência   : 22839
// Descricao   : Consulta para obter registros oriundos da Tmpdesc alterada para
//  considerar os casos de excesso de débito.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 09/06/2006
// Rotina      : ProcessaRetornos
// Pendência   : 20652
// Descricao   : Executar a atualização dos valores de compensação de IR que
//  tenham índice vinculado.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 09.03.2006
//  Pendencia  :
//  Alteração  : Retirar RULE das consultas.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 06.03.2006
//  Pendencia  : 21346
//  Alteração  : Criar tipo de conta OP, para a qual não é obrigatório
//               informar a conta corrente. Definir portador específico.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/01/2006
// Rotina      : Várias, controle do tempo
// Pendência   : 20914
// Descricao   : Alteração exibição dos tempos do processo, pois a rotina
//               TempoDecorrido retorna em branco quando o processo se inicia
//               num dia e termina no seguinte.
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : form
//  Data       : 08/12/2005
//  Descricao  : Alteração nos hints dos campos de data
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : ProcessaDocumentos
//  Pendência  : 20827
//  Data       : 25/11/2005
//  Descricao  : Lançar UNIDNEGOC na CCBAIXASXDOCUM. Quando a UNIDNEGOC não é
//               necessária usar o valor padrão ao invés de -1.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : Várias
//  Pendência  : 20586
//  Data       : 28/10/2005
//  Descricao  : Passar para a função UltDiaUtilAnterior da DiasUteis os parâme_
//               tros da fundação.
//------------------------------------------------------------------------------

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   fProcessoPadrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, fFrameProgresso, ComCtrls, ExtCtrls, ToolWin,
   wwdbdatetimepicker, CMDateTimePicker, Spin, wwdblook, Grids, Wwdbigrd,
   Wwdbgrid, FileCtrl, Db, DBTables, Wwquery, uCtrlDocumento,
   uCtrlIntBanco, Registry,
   uCtrlLancamento, uCtrlPeriodo, uCtrlContab,
   uSistema, uIntegraBack, uDatabase, uObjFolha, uFuncoesFolha, uMensErro,
   Wwdatsrc, dContabil, uAdmPrevFB, dbasedados,
   uFuncoesuteisFB, ActnList, Provider, DBClient, uCMClientDataSet, uConstFolha,
   uCtrlPadroes, Mask, wwdbedit, Wwdotdot, Wwdbcomb, uCtrlBancoPortForma,
   uMovReservaFB, uCtrlParamRubrica;

Type
   TfrmFolhaNormalEfet = Class(TfrmProcessoPadrao)
      tbsLista: TTabSheet;
      pnlSelecaoLista: TPanel;
      rgOpcaoSelecao: TRadioGroup;
      gboxSituacaoCF: TGroupBox;
      lblContabil: TLabel;
      lblfinanc: TLabel;
      pnlOpcoesLote: TPanel;
      rdgProcessar: TRadioGroup;
      pnlDatas: TPanel;
      grpMesRef: TGroupBox;
      spnedAno: TSpinEdit;
      cmbMes: TComboBox;
      GroupBox3: TGroupBox;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      dtpDtEfetivacao: TCMDateTimePicker;
      dptDtVencimento: TCMDateTimePicker;
      dptDtProgramada: TCMDateTimePicker;
      Panel3: TPanel;
      lbHistorico: TLabel;
      edtHistorico: TEdit;
      pnlEletronico: TPanel;
      toolControles: TToolBar;
      tbtnSep1: TToolButton;
      tbtnsep2: TToolButton;
      pnlOpcaoFiltroLista: TPanel;
      rgEletronico: TRadioGroup;
      pnlOpcaoEletronico: TPanel;
      Label6: TLabel;
      pnlLblDiretorio: TPanel;
      lblDiretorio: TLabel;
      btnEscolheDir: TBitBtn;
      pnlOpcaoDocIndiv: TPanel;
      Label1: TLabel;
      dblkPortadorForma: TwwDBLookupCombo;
      btnInverte: TBitBtn;
      cboxVerificar: TCheckBox;
      cbPreparaContrib: TCheckBox;
      dbgrdLista: TwwDBGrid;
      pnlDiretorio: TPanel;
      DriveComboBox1: TDriveComboBox;
      btnOkDir: TBitBtn;
      btnSairDiretorio: TBitBtn;
      DirectoryListBox1: TDirectoryListBox;
      qryPortadorForma1: TwwQuery;
      qryAux1: TwwQuery;
      qryLista: TwwQuery;
      updLista: TUpdateSQL;
      dsLista: TwwDataSource;
      qryProcesso: TwwQuery;
      QryDocTxt1: TwwQuery;
      qryDadosRec: TwwQuery;
      qryDadosAg: TwwQuery;
      qryaux2: TwwQuery;
      qryUltEvento: TwwQuery;
      qryEncerrado: TwwQuery;
      qryHstContEventosPR: TwwQuery;
      qryContribuicaoEv: TwwQuery;
      qryUpdPartPrevPlan: TwwQuery;
      qryUpdElegpatro: TwwQuery;
      updDoc: TUpdateSQL;
      cdsDocTxt: TCMClientDataSet;
      dspDocTxt: TDataSetProvider;
      qryDadoReceb: TwwQuery;
      pnlOpcoesVersao: TPanel;
      cboxAlteraEstadoVersao: TCheckBox;
      dbcboxNovoEstado: TwwDBComboBox;
      lblcontabilizacao: TLabel;
      dtpDtContabilizacao: TCMDateTimePicker;
      cdsParamRubrica: TClientDataSet;
      chkDemonstrativos: TCheckBox;
      qryAux3: TwwQuery;
      QryParamFolha: TwwQuery;
      cbEXEC_SP_MAPA: TCheckBox;
      QryCpf: TwwQuery;
    qryAux10: TwwQuery;
    edtNumLinhas: TEdit;
    Label5: TLabel;
    chkExcessoDebito: TCheckBox;
      // Felipe A. Santos - SOL 258357/17801 PPM 1083052 {fim qryVerifRRA}
      qryVerifRRA: TwwQuery;
    qryAux4: TwwQuery;
      Procedure rgEletronicoClick(Sender: TObject);
      Procedure btnEscolheDirClick(Sender: TObject);
      Procedure btnOkDirClick(Sender: TObject);
      Procedure btnSairDiretorioClick(Sender: TObject);
      Procedure MontaMes(Sender: TObject);
      Procedure MontaLista(Sender: TObject);
      Procedure rgOpcaoSelecaoClick(Sender: TObject);
      Procedure dbgrdListaCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgrdListaFieldChanged(Sender: TObject; Field: TField);
      Procedure btnInverteClick(Sender: TObject);
      Procedure pgctrlInformacoesChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dptDtProgramadaChange(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure chkDemonstrativosClick(Sender: TObject);
      Procedure dtpDtEfetivacaoExit(Sender: TObject);
      Procedure dtpDtContabilizacaoExit(Sender: TObject);
      Procedure dptDtVencimentoExit(Sender: TObject);
      Procedure dptDtProgramadaExit(Sender: TObject);
      //function VerificaTipoOpcaoIRreg(piIDPessJur,piIDPlanoPrev, piIDTitular: Integer): Boolean;   //MARCIO DENILSON SOL 151061 KINTANA 1105188 //Higor Nayde Ferreira SOL 259740 PPM 761404 // SOL 261754 PPM 1072844 //SOL 269049 PPM 1287659
      function RetornaInformeTipoOpcaoIR(piIDPessJur,piIDPlanoPrev, piIDTitular, piIdRubrica, piFontePagadora: Integer): string; //SOL 269049 PPM 1287659 // Andre Imakawa - SIG 28145
   Private
      { Private declarations }
      ctrlDocumento: tctrlDocumento;
      ctrlLancamento: tctrlLancamento;
      ctrlPeriodo: tctrlPeriodo;
      ctrlContab: tctrlContab;
      ctrlParamRubrica: TCtrlParamRubrica;
      Registry: TRegistry;
      FMesPagamento: String;
      FMesAbono: String;
      dataspagto: Array[0..2] Of tdatetime;
      FHistorico: String;
      FIdHistorico: integer;

      liExercicio, liPeriodo, liEmpresa: integer;
      liPlnCodigo: integer;
      liPlnProvisaoAbono: integer;

      liseqregistroarquivo: integer;

      FCtrlIntBanco: TCtrlIntBanco;
      Reg: TRegistry;

      sCODCENTRORESPON: String; //Renato Visoni

      sDtEfetivacao, sDtContabilizacao, sDtvencimento, sDtProgramada: String; // Renato Visoni Sol 108334 / Kintana 488340
      bCalcula: Boolean; //Renato Visoni SOL110083 Kintana 501795

      iIdArquivoPagto, iCodDocArq, iIdDocPessoa: Integer;//Cássio Rovaroto - SIG nº 60540

      Procedure GravaDiretorioCAP;
      Procedure SetMesPagamento(Const Value: String);
      Procedure SetMesAbono(Const Value: String);
      Procedure CalculaDatasPagto;
      Procedure ObtemMesSelecao;
      Procedure SetHistorico(Const Value: String);
      Procedure ObtemParametroCF(qry: twwquery; Var CF: TRegContFinan);
      Procedure SetIdHistorico(Const Value: integer);
      Procedure ObtemIdHistorico;
      Procedure AlimentaRegistroParaArquivoEletronico;
      Procedure GeraLoteXHstFolhabenef(aiIdHstFolhaBenef: integer; aslotes: String);
      Function ObtemLotesXVersao(aidhstfolhabenef: integer): String;
      Function ValidaVersao(asLotes: String; ainumreg: integer): boolean;
      Function BuscaRegVersao(aiversao: integer): integer;
      Function PegaDadosRecebedor(aiidtitular, aiidresponsavel, aiidplanoprev,
         aiidplanoorigem, aiidpessjur: integer): boolean;
      Function ObtemLiquidoVersao(aiidversao: integer): real;

      Function Exec_SP_MapaFolhaBenef: String;
      Function TiraMes(pData : String): String;// Bruno Azevedo SOL 132145 KINTANA 759285
	  Function Exec_SP_ExcessoDebito(iLote: Integer; sMes, sDataInicio, sDataProgramada: String): String;
    //function VerificaTipoOpcaoIRREG(piIDPessJur, piIDPlanoPrev,
    //  piIDTitular: Integer): Boolean;

       procedure PreparaContribuicaoPatro(slotes : string);          //edilaine - SIG39907

       //Cássio Rovaroto - SIG nº 60540 - Início
       function SetRegistrosArquivoPagamento(pCodPortForma: Integer; pValorTotal: Double): Boolean;
       function SetDocumentoArqPagamento(pCodDocumento, pCodForma: Integer; pValor: Double): Boolean;
       function SetFavorecidoArqPagamento(pNome, pDocumento, pBanco, pAgencia, pConta, pTipoConta, pOperacao: string; pValor: double; pCodDocumento, pIdForCli, pIdTitular: Integer): Boolean;
       procedure SetTarifaBancariaArqPagamento(aiidhistorico, pIdResponsavel: Integer);
       function SetStatusDocArquivoPagamento(pCodDocumento: Integer): Boolean;
       procedure GeraArquivoPagamentoLeiauteCNAB150(aiidhistorico: integer);
       procedure GeraArquivoPagamentoleiauteCNAB240(aiidhistorico, aiTotalArquivo: integer);
       //Cássio Rovaroto - SIG nº 60540 - Fim

       function PossuiPerfil(aiidlote, aiIdHstFolhaBenef:  Integer): Boolean;   //Darivaldo Alencar SIG67668

       //Andre Imakawa - 78705 - Inicio
       procedure Executa_ETL(pLote: String; pIdhstfolhabenef: Integer; pDtPgto_0, pDtPgto_1, pDtPgto_2: TDatetime;
                                                  pFlgArquivo, pCodPortadorForma_Aux, pFundacaoCorrente, pTipoEfetivacao: Integer; var pStatus: String);
       Function InsereETLEfetivacao(pLote: String; pIdhstfolhabenef: Integer; pDtPgto_0, pDtPgto_1, pDtPgto_2: String;
                                     pFlgArquivo, pCodPortadorForma_Aux, pFundacaoCorrente, pTipoEfetivacao: Integer): Integer;

       function RetornaDiretorioETL(pFuncionalidade, pRotina: String): String;

       function VerificaEfeticaoETL(pIdETLEfet: Integer; var pStatus: String): Integer;

       Procedure AtualizaETLEfetivacao(pIdhstfolhabenef, pTipoEfetivacao: Integer);       
       //Andre Imakawa - 78705 - Fim                                            

       procedure Monitoramento(pRotina:String; ptipo: Integer; pErro:String=''); // Andre Imakawa - SIG 81948

       Function Verifica_Critica_ETL(pIdETLEfet: Integer; plote: String):Boolean; // Andre Imakawa - SIG 85168

       Procedure GravaLog; // Andre Imakawa - SIG 85168

   Public
      { Public declarations }

      ctrlBCP: tCtrlBancoPortForma;
      iNumOcorrencias: Integer; //CPrev - 27063

      Function Inicializa: boolean; Override;
      Procedure Terminar; Override;
      Procedure InicializaAmbiente; Override;
      Procedure LimpaAmbiente; Override;
      Procedure FinalizaAmbiente; Override;
      Function ValidaProcessar: boolean; Override;
      Procedure MostraTela; Override;
      Property MesPagamento: String Read FMesPagamento Write SetMesPagamento;
      Property MesAbono: String Read FMesAbono Write SetMesAbono;
      Property Historico: String Read FHistorico Write SetHistorico;
      Procedure Processa; Override;
      Procedure AtualizaParametrosCF(aiidlote: integer); //atualização de parâmetros contábeis e financeiros não preenchidos
      Function ValidaContaBancaria(aiidlote: integer): boolean; //validação da conta bancária
      Function ValidaParametrosCF(aiidlote: integer): boolean; //validação de parâmetros contábeis e financeiros
      Function VerificaPreviaProcessada(aiidlote: integer;
         asmesref: String): boolean; //VERIFICAR SE TEM PREVIA NÃO PROCESSADA
      Procedure GravaHstFolhaBenef(aiidhistorico: integer; ashistorico: String;
         //PLANILHA DE PROVISÃO DE ABONO
         aitipofolha, aistatus, aiplncodigo, aiplnprovisaoabono: integer;
         arliquidototal: real);

      Procedure GravaHstFolhaBenefCAP(aiidhistorico: integer;
         aicoddocumento: double;
         aiseqdocumento,
         ainumregistros,
         aicodportforma,
         aiplncodigo,
         aidfloatpagto,
         aidfloatpagtoAlter,
         aidfavdoc,
         piDFloatProg: integer;
         arvalordoc: real;
         asnometxt,
         astipoportador: String);

      Procedure GravaCtrlinterface(aslotes: String);
      Procedure ProcessaFaseHistrubsal(aslotes: String; aiidhistorico: integer); //processa gravação dos registros da Previa na Histrubsal
      Procedure ProcessaContabilizacao(aiidhistorico: integer;
         abregera: boolean = false
         ); //processa geração da planilha contábil
      Procedure ProcessaDocumentos(aiidhistorico: integer); //processa geração dos documentos financeiros
      Procedure ProcessaArquivobanco(aiidhistorico: integer); //processa geração dos arquivos de banco
      Procedure ProcessaRetornos(aiidhistorico: integer; aslotes: String); //processa geração dos retornos
      Property IdHistorico: integer Read FIdHistorico Write SetIdHistorico;
      Function ObtemPermissaoConfirmar: boolean; Override;

      //MARCIO DENILSON SOL 151061 KINTANA 1105188
      procedure processaIRRegressivo(psMes: String; piIdHstFolhaBenef, pIdLote: Integer); //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319 //adiciona pIdLote
      procedure atualizaHstCalculoPMPFolha(piIdHstFolhaBenef: Integer);
      procedure atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef: Integer);
      procedure atualizaBasePagamento(psMes, pIdLote: String; piIdHstFolhaBenef: Integer); //SOL 207789/16615 PPM 554283
      //SOL 207789/16615 PPM 554283 inicio comentario
      //procedure atualizaBasePagamentoPrevia(psMes: String; piIdHstFolhaBenef, pIdLote: Integer); //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319 //adiciona pIdLote
      //procedure atualizaBasePagamentoEfetivacao(psMes: String; pIdLote: Integer); //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319 //adiciona pIdLote
      //FIM MARCIO DENILSON SOL 151061 KINTANA 1105188
      //SOL 207789/16615 PPM 554283 fim comentario

      Procedure ProcessaRetornos_ETL(aiidhistorico: integer; aslotes: String);
      Function VerificaDisponibilidade: integer;
      Function VerificaResgate(aiidhistorico: integer): Boolean; // Andre Imakawa - SIG 84679
      Procedure MensagemValidacao(aIdHistorico: Integer); // Andre Imakawa - SIG 96394
      procedure GeraArquivoSIACC(pIdHstFolhaBenef: Integer; pQtdRegistrosLote: Integer; pQtdLinhasLote: integer);
      function RecuperaValorSIACC:real;
      function CargaContraChequeMongo(pIdFolha: Integer):boolean;
   End;

Var
   frmFolhaNormalEfet: TfrmFolhaNormalEfet;

Implementation

Uses fAguarde, uFolhaBenef, FEspera, FDemPag, uFuncaoGeral,
     uCmfileUtils; //Andre Imakawa - SIG 112010

{$R *.DFM}

Const _GeraHistrubsal = -6;
   _GeraContabilizacao = -5;
   _GeraDocumentos = -4;
   _GeraArquivos = -3;
   _GeraRetornos = -2;
   _ApagaPrevia = -1;
   _EfetivadoOK = 1;

Procedure TfrmFolhaNormalEfet.rgEletronicoClick(Sender: TObject);
Begin
   Inherited;

   pnlOpcaoEletronico.visible := rgEletronico.itemindex = 0;
   pnlOpcaoDocIndiv.visible := rgEletronico.itemindex = 1;
   ChecaValidacao(sender);
End;

Procedure TfrmFolhaNormalEfet.btnEscolheDirClick(Sender: TObject);
Begin
   Inherited;

   pnlDiretorio.Visible := true;
   pgctrlInformacoes.Visible := false;
End;

Procedure TfrmFolhaNormalEfet.btnOkDirClick(Sender: TObject);
Begin
   Inherited;
   lblDiretorio.Caption := DirectoryListBox1.Directory;
   pnlDiretorio.Visible := false;
   pgctrlInformacoes.Visible := true;
   GravaDiretorioCAP;
End;

Procedure TfrmFolhaNormalEfet.btnSairDiretorioClick(Sender: TObject);
Begin
   Inherited;

   pnlDiretorio.Visible := false;
   pgctrlInformacoes.Visible := true;
End;

Procedure TfrmFolhaNormalEfet.GravaDiretorioCAP;
Begin
   Registry.RootKey := HKEY_CURRENT_USER;

   If Registry.OpenKey('Software\CM\Folha de Benefícios\', true) Then
      Registry.WriteString('Diretorio CAP', lblDiretorio.Caption);

   Registry.CloseKey;
End;

Procedure TfrmFolhaNormalEfet.MontaMes(Sender: TObject);
Var lsAnoAux, lsMesAux, lsDataFolha: String;
Begin
   lsAnoAux := spnedAno.Text;

   If cmbMes.ItemIndex <= 8 Then
      lsMesAux := '0' + inttostr(cmbMes.ItemIndex + 1)
   Else
      lsMesAux := inttostr(cmbMes.ItemIndex + 1);

   lsDataFolha := AtualizaDataFolha(lsMesAux, lsAnoAux);

   If lsDataFolha <> '' Then
      Begin
         dptDtVencimento.Text := lsDataFolha;
         sDtVencimento := dptDtVencimento.Text; //Renato Visoni Sol 108334 / Kintana 488340
         dptDtProgramada.Text := lsDataFolha;
         sDtProgramada := dptDtProgramada.Text; //Renato Visoni Sol 108334 / Kintana 488340
      End
   Else
      Begin
         MsgDlg('Erro na Data de Pagamento da Folha de Benefícios. Consulte o Cadastro de Fundação',
            'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
      End;

   CalculaDatasPagto;
   MesPagamento := lsAnoAux + '/' + lsMesAux;
End;

Procedure TfrmFolhaNormalEfet.InicializaAmbiente;
Begin
   Inherited;

   lblDiretorio.Caption := '';
   Registry := TRegistry.Create;
   Registry.RootKey := HKEY_CURRENT_USER;

   If Registry.OpenKey('Software\CM\Folha de Benefícios\', true) Then
      Begin
         lblDiretorio.Caption := Registry.ReadString('Diretorio CAP');

         If lblDiretorio.Caption = '' Then
            Begin
               //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
               //lblDiretorio.Caption:='C:\';
               lblDiretorio.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

               Registry.WriteString('Diretorio CAP', lblDiretorio.Caption);
            End;
      End;

   Registry.CloseKey;

   Try
      DirectoryListBox1.Directory := lblDiretorio.Caption;
   Except
      //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
      //DirectoryListBox1.Directory:='C:\';
      DirectoryListBox1.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   End;

   pnlOpcaoEletronico.visible := true;
   pnlOpcaoDocIndiv.Visible := false;
   pnlDiretorio.Left := 24;
   pnlDiretorio.Top := 154;
   pnlDiretorio.Visible := false;

   FazQuery(qryPortadorForma1, 'SELECT PFR.CODPORTFORMA, PFR.DESCRICAO, PFR.CODARQUIVOREMESSA, ' + _clinefeed +
      '       PFR.CONTROLEREMESSA, PFR.CODFORMAPAGTO, PFR.FLGEMITEAVISO, ' + _clinefeed +
      '       PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO, ' + _clinefeed +
      '       PCT.IDBANCO, PCT.NOCONTACORR, ' + _clinefeed +
      '       PFR.DMAISALT, PFR.CODFORMAPGTOALT, PFR.VALORMAXIMO ' + _clinefeed +
      'FROM PORTADORFORMA PFR, PORTADORCONTA PCT ' + _clinefeed +
      'WHERE PFR.RECPAG = ''P'' ' + _clinefeed +
      '  AND PFR.IDPESSOA = ' + inttostr(SistemaFolha.FundacaoCorrente) + ' ' + _clinefeed +
      '  AND PCT.CODPORTADOR = PFR.CODPORTADOR ' + _clinefeed +
      //INCLUSÃO DE ORDER BY, DESCARTAR PORTADORES ELETRONICOS
      '  AND PFR.CODPORTFORMA NOT IN ' + _clinefeed +
      '      (SELECT DISTINCT CODPORTFORMA ' + _clinefeed +
      '       FROM BANCOPORTFORMA ' + _clinefeed +
      '       WHERE IDMODULO = 18) ' + _clinefeed +
      '       ORDER BY PFR.DESCRICAO');
End;

Procedure TfrmFolhaNormalEfet.MostraTela;
Var liDia, liMes, liAno: Word;
   sAnoAux, sMesAux, sDataFolha: String;
Begin
   Inherited;
   dtpDtEfetivacao.Text := DateTimeToStr(Date);

   sDtEfetivacao := dtpDtEfetivacao.Text; //Renato Visoni Sol 108334 / Kintana 488340

   dtpDtContabilizacao.date := dtpDtEfetivacao.date;

   sDtContabilizacao := dtpDtContabilizacao.Text; //Renato Visoni Sol 108334 / Kintana 488340

   If SistemaFolha.FLGINTEGRAFINANC = 1 Then
      Begin
         lblfinanc.Font.Color := clBlue;
         lblfinanc.caption := 'Integrado ao Financeiro';
      End
   Else
      Begin
         lblfinanc.Font.Color := clRed;
         lblfinanc.caption := 'Não Integrado ao Financeiro';
      End;

   If Sistemafolha.FLGINTEGRACONTABIL = 1 Then
      Begin
         lblContabil.Font.Color := clBlue;
         lblContabil.caption := 'Integrado a Contabilidade';
      End
   Else
      Begin
         lblContabil.Font.Color := clRed;
         lblContabil.caption := 'Não Integrado a Contabilidade';
      End;

   DecodeDate(date, liAno, liMes, liDia);

   If (liMes >= 1) And (liMes <= 12) Then
      Begin
         cmbMes.ItemIndex := liMes - 1;
         cmbMes.Text := cmbMes.Items[cmbMes.ItemIndex];
         spnedAno.Text := inttostr(liAno);
      End;

   MontaMes(self);

   If Sistemafolha.FLGINTEGRACONTABIL = 1 Then
      Begin
         If FazQuery(qryAux1, 'SELECT P.MASCARA, PC.PLANO ' + _clinefeed +
            'FROM PLANO P, PARAMCONTAB PC ' + _clinefeed +
            'WHERE (PC.IDPESSOA = ' + inttostr(Sistema.idEmpresa) + ') ' + _clinefeed +
            '  AND (P.PLANO = PC.PLANO)') Then
            Begin
               IntegraBack.Plano := qryAux1.fieldbyname('PLANO').asinteger;
               IntegraBack.MascaraPlano := qryAux1.fieldbyname('MASCARA').AsString;
            End
         Else
            Begin
               MsgDlg('O Plano de Contas do exercício não foi definido.' + _clinefeed +
                  'Portanto não será possível efetivar qualquer versão de pagamento.',
                  'Atenção', mtError, [mbOK, mbHelp], 0);
               IntegraBack.Plano := 0;
               IntegraBack.MascaraPlano := '';
            End;
      End;

   MontaLista(self);
End;

Procedure TfrmFolhaNormalEfet.SetMesPagamento(Const Value: String);
Begin
   FMesPagamento := Value;
End;

Procedure TfrmFolhaNormalEfet.SetMesAbono(Const Value: String);
Begin
   FMesAbono := Value;
End;

Procedure TfrmFolhaNormalEfet.rgOpcaoSelecaoClick(Sender: TObject);
Begin
   Inherited;

   pnlOpcoesLote.visible := rgOpcaoSelecao.itemindex = 0;
   //USAR NO REPROCESSAMENTO
   cboxVerificar.visible := rgOpcaoSelecao.itemindex = 0;

   If rgOpcaoSelecao.itemindex = 0 Then
      Begin
         tbsLista.caption := 'Lotes a efetivar';
         pnlOpcoes.height := 252;
      End
   Else
      Begin
         //REGERAR CONTABILIZAÇÃO
         If rgOpcaoSelecao.itemindex = 1 Then
            tbsLista.caption := 'Versões com Pendência'
         Else
            tbsLista.caption := 'Versões passíveis de regeração da contabilização';

         pnlOpcoes.height := 252 - pnlOpcoesLote.height;
      End;

   MontaLista(self);
End;

Procedure TfrmFolhaNormalEfet.CalculaDatasPagto;
Begin
   //dataspagto[0] := StrToDate(dptDtProgramada.Text); //Renato Visoni Sol 108334 / Kintana 488340
   dataspagto[0] := StrToDate(sDtProgramada);
   dataspagto[1] := DiasUteis.UltDiaUtilAnterior(dataspagto[0], SistemaFolha.CidadeEmpresa, SistemaFolha.PaisEmpresa, SistemaFolha.UFEmpresa, true, true, false);
   dataspagto[2] := DiasUteis.UltDiaUtilAnterior(dataspagto[1], SistemaFolha.CidadeEmpresa, SistemaFolha.PaisEmpresa, SistemaFolha.UFEmpresa, true, true, false);
End;

Procedure TfrmFolhaNormalEfet.ObtemMesSelecao;
Begin
   If cmbMes.itemindex <= 8 Then
      MesPagamento := trim(spnedAno.Text) + '/0' + inttostr(cmbMes.ItemIndex + 1)
   Else
      MesPagamento := trim(spnedAno.Text) + '/' + inttostr(cmbMes.ItemIndex + 1);

   MesAbono := trim(spnedAno.Text) + '/' + '13';
   Historico := 'v.' + MesPagamento + '/';
   lbHistorico.caption := 'Descrição (v.' + Historico + 'versao) : ';
End;

Procedure TfrmFolhaNormalEfet.MontaLista(Sender: TObject);
Var sSql: String;
Begin
   pgctrlInformacoes.ActivePage := tbsLista;
   If rgOpcaoSelecao.itemindex = 0 Then
      Begin
         sSql := 'SELECT ' + _clinefeed +
            '  0 AS PROCESSAR, ' + _clinefeed +
            '  IDLOTE AS IDLISTA, ' + _clinefeed +
            '  DECODE(FLGCONCESSAO,1,''Concessão'',' + _clinefeed +
            '                      DECODE(FLGTIPOFOLHA, ' + _clinefeed +
            '                                           0,''Manutenção'',' + _clinefeed +
            '                                           1,''Pagamento Pendente'',' + _clinefeed +
            '                                           2,''Folha Extra'',' + _clinefeed +
            '                                           3,''Folha de Abono'',' + _clinefeed +
            '                                           4,''Folha de Antec. Abono'',' + _clinefeed +
            '                                           5,''Exclusões Efetivação'',' + _clinefeed +
            '                                           6,''Reprocessamento'')) AS TIPOLOTE, ' + _clinefeed +
            '  DECODE(SUBSTR(NVL(RESPCHKLIST,''0''),1,1),''0'',''Bloqueado'',''Liberado'') AS BLOQUEIO, ' + _clinefeed +
            '  MESREFERENCIA AS MES, ' + _clinefeed +
            '  DESCRICAO, ' + _clinefeed +
            '  NVL(FLGTIPOFOLHA,0) AS FLGTIPOFOLHALOTE, ' + _clinefeed +
            '  RESPCHKLIST,  ' + _clinefeed +
            '  0 AS PLNPROVISABONO, ' + _clinefeed +
            '  0 AS PLNCODIGO ' + _clinefeed +
            'FROM CTRLINTERFACE ' + _clinefeed +
            'WHERE (FLGIDATMP = 1) ' + _clinefeed +
            '  AND (IDPESSOA = ' + inttostr(SistemaFolha.FundacaoCorrente) + ') ' + _clinefeed +
            '  AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL)  ' + _clinefeed +
            '  AND (TIPO = ''B'') ' + _clinefeed +
            '  AND (MESREFERENCIA <= ' + QuotedStr(MesPagamento) + ') ' + _clinefeed;

         Case rdgProcessar.ItemIndex Of
            // Manutenção
            0: sSQL := sSQL + '  AND ((FLGCONCESSAO = 0) OR (FLGCONCESSAO is null)) ' + _clinefeed +
               '  AND (FLGTIPOFOLHA IN (0,6,5,3,4)) ' + _clinefeed;
            // Concessão
            1: sSQL := sSQL + '  AND (FLGCONCESSAO=1) ' + _clinefeed +
               '  AND (FLGTIPOFOLHA IN (0,6,5)) ' + _clinefeed;
            // Manutenção/Concessão
            2: sSQL := sSQL + '  AND (FLGTIPOFOLHA IN (0,6,5,3,4)) ' + _clinefeed;

            // Abono
            3: sSQL := sSQL + '  AND (FLGTIPOFOLHA = 3) ' + _clinefeed;

            // Antecipação de Abono
            4: sSQL := sSQL + '  AND (FLGTIPOFOLHA = 4) ' + _clinefeed;

            // Folha Extra
            5: sSQL := sSQL + '  AND (FLGTIPOFOLHA = 2) ' + _clinefeed;

            // Pagamentos Pendentes
            6: sSQL := sSQL + '  AND (FLGTIPOFOLHA = 1) ' + _clinefeed;

            //Renato Visoni SOL 138251 kintana 840758
            //Resgate
            7: sSQL := sSQL + ' AND ((NVL(FLGRESGATE,0)=1) OR (NVL(flgresgateparcelado,0)=1) )'+ _clinefeed;  // Add (NVL(flgresgateparcelado,0)=1 // SOL 63067 - KTN 524520
            //Renato Visoni SOL 138251 kintana 840758
         End;

         //Renato Visoni SOL 138251 kintana 840758
         if rdgProcessar.ItemIndex <> 7 then begin
           sSQL := sSQL + ' AND (NVL(FLGRESGATE,0)=0)';
         end;
         //Renato Visoni SOL 138251 kintana 840758


         sSQL := sSQL + 'ORDER BY IDLOTE ' + _clinefeed;

         FazQuery(qryLista, ssql);

         qryLista.fieldbyname('PROCESSAR').visible := true;
         qryLista.fieldbyname('IDLISTA').visible := true;
         qryLista.fieldbyname('TIPOLOTE').visible := true;
         qryLista.fieldbyname('BLOQUEIO').visible := true;
         qryLista.fieldbyname('MES').visible := true;
         qryLista.fieldbyname('DESCRICAO').visible := true;
         qryLista.fieldbyname('FLGTIPOFOLHALOTE').visible := false;
         qryLista.fieldbyname('RESPCHKLIST').visible := false;

         qryLista.fieldbyname('PROCESSAR').readonly := false;
         qryLista.fieldbyname('IDLISTA').readonly := true;
         qryLista.fieldbyname('TIPOLOTE').readonly := true;
         qryLista.fieldbyname('BLOQUEIO').readonly := true;
         qryLista.fieldbyname('MES').readonly := true;
         qryLista.fieldbyname('DESCRICAO').readonly := true;
         qryLista.fieldbyname('FLGTIPOFOLHALOTE').readonly := true;
         qryLista.fieldbyname('RESPCHKLIST').readonly := true;

         qryLista.fieldbyname('PROCESSAR').displaylabel := 'Processar';
         qryLista.fieldbyname('IDLISTA').displaylabel := 'Lote';
         qryLista.fieldbyname('TIPOLOTE').displaylabel := 'Tipo Lote';
         qryLista.fieldbyname('BLOQUEIO').displaylabel := 'Bloqueio';
         qryLista.fieldbyname('BLOQUEIO').displaywidth := 25;
         qryLista.fieldbyname('MES').displaylabel := 'Mês Ref.';
         qryLista.fieldbyname('DESCRICAO').displaylabel := 'Descrição';
         qryLista.fieldbyname('DESCRICAO').displaywidth := 88;

         dbgrdLista.Selected.clear;
         dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
         dbgrdLista.Selected.add('IDLISTA'#9'10'#9'Lote');
         dbgrdLista.Selected.add('TIPOLOTE'#9'25'#9'Tipo Lote');
         dbgrdLista.Selected.add('BLOQUEIO'#9'16'#9'Bloqueio');
         dbgrdLista.Selected.add('MES'#9'10'#9'Mês Ref.');
         dbgrdLista.Selected.add('DESCRICAO'#9'88'#9'Descrição');
      End
   Else
      //REGERAR CONTABILIZAÇÃO-opção 2
      If rgOpcaoSelecao.itemindex = 1 Then
         Begin
            ssql := 'SELECT ' + _clinefeed +
               '0 AS PROCESSAR, ' + _clinefeed +
               'IDHSTFOLHABENEF AS IDLISTA, ' + _clinefeed +
               'DECODE(FLGTIPOFOLHA, ' + _clinefeed +
               '0,''Folha Normal'',' + _clinefeed +
               '1,''Pagamento Pendente'',' + _clinefeed +
               '2,''Folha Extra'',' + _clinefeed +
               '3,''Folha de Abono'',' + _clinefeed +
               '4,''Folha de Antec. Abono'',' + _clinefeed +
               '5,''Exclusões Efetivação'',' + _clinefeed +
               '6,''Reprocessamento'') AS TIPOLOTE, ' + _clinefeed +
               'DECODE(FLGESTADO,' + _clinefeed +
               inttostr(_GeraHistrubsal) + ',''Gerar históricos'',' + _clinefeed +
               inttostr(_GeraDocumentos) + ',''Gerar documentos'',' + _clinefeed +
               inttostr(_GeraArquivos) + ',''Gerar arquivos de banco'',' + _clinefeed +
               inttostr(_GeraContabilizacao) + ',''Gerar contabilização'',' + _clinefeed +
               inttostr(_ApagaPrevia) + ',''Eliminar Prévia'',' + _clinefeed +
               inttostr(_GeraRetornos) + ',''Gerar retornos para outros sistemas'') AS ESTADO, ' + _clinefeed +
               'FLGESTADO, ' + _clinefeed +
               'MESREFERENCIA AS MES, ' + _clinefeed +
               'HISTORICO AS DESCRICAO, ' + _clinefeed +
               'VALORLIQTOTAL AS NUMREG, ' + _clinefeed +
               'DATAPREVPAGTO, ' + _clinefeed +
               'DATAEFETIVACAO, ' + _clinefeed +
               'DATACONTABIL, ' + _clinefeed +
               'DATAVENCIMENTO, ' + _clinefeed +
               'NVL(FLGTIPOFOLHA,0) AS FLGTIPOFOLHA, ' + _clinefeed +
               'PLNPROVISABONO, ' + _clinefeed +
               'PLNCODIGO ' + _clinefeed +
               'FROM HSTFOLHABENEF ' + _clinefeed +
               'WHERE (FLGESTADO < 0) ' + _clinefeed +
               'AND (IDFUNDACAO = ' + inttostr(SistemaFolha.FundacaoCorrente) + ') ' + _clinefeed +
               'ORDER BY IDHSTFOLHABENEF ' + _clinefeed;

            FazQuery(qryLista, ssql);

            qryLista.fieldbyname('PROCESSAR').visible := true;
            qryLista.fieldbyname('IDLISTA').visible := true;
            qryLista.fieldbyname('TIPOLOTE').visible := true;
            qryLista.fieldbyname('ESTADO').visible := true;
            qryLista.fieldbyname('MES').visible := true;
            qryLista.fieldbyname('DESCRICAO').visible := true;
            qryLista.fieldbyname('FLGTIPOFOLHA').visible := false;

            qryLista.fieldbyname('PROCESSAR').readonly := false;
            qryLista.fieldbyname('IDLISTA').readonly := true;
            qryLista.fieldbyname('TIPOLOTE').readonly := true;
            qryLista.fieldbyname('ESTADO').readonly := true;
            qryLista.fieldbyname('MES').readonly := true;
            qryLista.fieldbyname('DESCRICAO').readonly := true;
            qryLista.fieldbyname('FLGTIPOFOLHA').readonly := true;

            qryLista.fieldbyname('PROCESSAR').displaylabel := 'Processar';
            qryLista.fieldbyname('IDLISTA').displaylabel := 'Versão';
            qryLista.fieldbyname('TIPOLOTE').displaylabel := 'Tipo Versão';
            qryLista.fieldbyname('ESTADO').displaylabel := 'Estado';
            qryLista.fieldbyname('MES').displaylabel := 'Mês Ref.';
            qryLista.fieldbyname('DESCRICAO').displaylabel := 'Descrição';
            qryLista.fieldbyname('DESCRICAO').displaywidth := 78;

            dbgrdLista.Selected.clear;
            dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
            dbgrdLista.Selected.add('IDLISTA'#9'10'#9'Versão');
            dbgrdLista.Selected.add('TIPOLOTE'#9'25'#9'Tipo Versão');
            dbgrdLista.Selected.add('ESTADO'#9'35'#9'Estado');
            dbgrdLista.Selected.add('MES'#9'10'#9'Mês Ref.');
            dbgrdLista.Selected.add('DESCRICAO'#9'78'#9'Descrição');
         End
      Else
         Begin
            ssql := 'SELECT ' + _clinefeed +
               '0 AS PROCESSAR, ' + _clinefeed +
               'H.IDHSTFOLHABENEF AS IDLISTA, ' + _clinefeed +
               'DECODE(H.FLGTIPOFOLHA, ' + _clinefeed +
               '0,''Folha Normal'',' + _clinefeed +
               '1,''Pagamento Pendente'',' + _clinefeed +
               '2,''Folha Extra'',' + _clinefeed +
               '3,''Folha de Abono'',' + _clinefeed +
               '4,''Folha de Antec. Abono'',' + _clinefeed +
               '5,''Exclusões Efetivação'',' + _clinefeed +
               '6,''Reprocessamento'') AS TIPOLOTE, ' + _clinefeed +
               'DECODE(H.FLGESTADO,' + _clinefeed +
               inttostr(_EfetivadoOK) + ',''Efetivado'',' + _clinefeed +
               inttostr(_GeraHistrubsal) + ',''Gerar históricos'',' + _clinefeed +
               inttostr(_GeraDocumentos) + ',''Gerar documentos'',' + _clinefeed +
               inttostr(_GeraArquivos) + ',''Gerar arquivos de banco'',' + _clinefeed +
               inttostr(_GeraContabilizacao) + ',''Gerar contabilização'',' + _clinefeed +
               inttostr(_ApagaPrevia) + ',''Eliminar Prévia'',' + _clinefeed +
               inttostr(_GeraRetornos) + ',''Gerar retornos para outros sistemas'') AS ESTADO, ' + _clinefeed +
               'H.FLGESTADO, ' + _clinefeed +
               'H.MESREFERENCIA AS MES, ' + _clinefeed +
               'H.HISTORICO AS DESCRICAO, ' + _clinefeed +
               'H.VALORLIQTOTAL AS NUMREG, ' + _clinefeed +
               'H.DATAPREVPAGTO, ' + _clinefeed +
               'H.DATAEFETIVACAO, ' + _clinefeed +
               'H.DATACONTABIL, ' + _clinefeed +
               'H.DATAVENCIMENTO, ' + _clinefeed +
               'NVL(H.FLGTIPOFOLHA,0) AS FLGTIPOFOLHA, ' + _clinefeed +
               'H.PLNPROVISABONO, ' + _clinefeed +
               'H.PLNCODIGO ' + _clinefeed +
               'FROM HSTFOLHABENEF H, PLANILHA P ' + _clinefeed +
               'WHERE (H.FLGESTADO = 1) ' + _clinefeed +
               'AND (H.FLGTIPOFOLHA = 0) ' + _clinefeed +
               'AND (H.IDFUNDACAO = ' + inttostr(SistemaFolha.FundacaoCorrente) + ') ' + _clinefeed +
               'AND (H.PLNCODIGO = P.PLNCODIGO) ' + _clinefeed +
               'AND (P.PLNEFETIVADO = ''N'') ' + _clinefeed +
               'ORDER BY H.IDHSTFOLHABENEF ' + _clinefeed;

            FazQuery(qryLista, ssql);

            qryLista.fieldbyname('PROCESSAR').visible := true;
            qryLista.fieldbyname('IDLISTA').visible := true;
            qryLista.fieldbyname('TIPOLOTE').visible := true;
            qryLista.fieldbyname('ESTADO').visible := true;
            qryLista.fieldbyname('MES').visible := true;
            qryLista.fieldbyname('DESCRICAO').visible := true;
            qryLista.fieldbyname('FLGTIPOFOLHA').visible := false;

            qryLista.fieldbyname('PROCESSAR').readonly := false;
            qryLista.fieldbyname('IDLISTA').readonly := true;
            qryLista.fieldbyname('TIPOLOTE').readonly := true;
            qryLista.fieldbyname('ESTADO').readonly := true;
            qryLista.fieldbyname('MES').readonly := true;
            qryLista.fieldbyname('DESCRICAO').readonly := true;
            qryLista.fieldbyname('FLGTIPOFOLHA').readonly := true;

            qryLista.fieldbyname('PROCESSAR').displaylabel := 'Processar';
            qryLista.fieldbyname('IDLISTA').displaylabel := 'Versão';
            qryLista.fieldbyname('TIPOLOTE').displaylabel := 'Tipo Versão';
            qryLista.fieldbyname('ESTADO').displaylabel := 'Estado';
            qryLista.fieldbyname('MES').displaylabel := 'Mês Ref.';
            qryLista.fieldbyname('DESCRICAO').displaylabel := 'Descrição';
            qryLista.fieldbyname('DESCRICAO').displaywidth := 78;

            dbgrdLista.Selected.clear;
            dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
            dbgrdLista.Selected.add('IDLISTA'#9'10'#9'Versão');
            dbgrdLista.Selected.add('TIPOLOTE'#9'25'#9'Tipo Versão');
            dbgrdLista.Selected.add('ESTADO'#9'35'#9'Estado');
            dbgrdLista.Selected.add('MES'#9'10'#9'Mês Ref.');
            dbgrdLista.Selected.add('DESCRICAO'#9'78'#9'Descrição');
         End;
   ChecaValidacao(sender);
End;

Procedure TfrmFolhaNormalEfet.SetHistorico(Const Value: String);
Begin
   FHistorico := Value;
End;

Procedure TfrmFolhaNormalEfet.FinalizaAmbiente;
Begin
   Inherited;
   Registry.Free;
End;

Function TfrmFolhaNormalEfet.ValidaProcessar: boolean;
Begin
   result := false;
   If Not qryLista.active Then
      exit;
   qryLista.disablecontrols;
   qryLista.first;
   While Not qryLista.eof Do
      Begin
         If rgOpcaoSelecao.itemindex = 0 Then
            Begin
               //apenas verificar dados a efetivar
               If cboxVerificar.checked Then
                  Begin
                     If (qryLista.fieldbyname('PROCESSAR').asinteger = 1) Then
                        result := true;
                  End
               Else
                  Begin
                     If (qryLista.fieldbyname('PROCESSAR').asinteger = 1) And
                        (qryLista.fieldbyname('BLOQUEIO').asstring = 'Liberado') Then
                        result := true;
                  End;
            End
         Else
            Begin
               If (qryLista.fieldbyname('PROCESSAR').asinteger = 1) Then
                  result := true;
            End;
         If result Then
            break;
         qryLista.next;
      End;
   qryLista.enablecontrols;
   If rgOpcaoSelecao.itemindex = 0 Then
      Begin
         result := result And
            ((rgEletronico.itemindex = 0) Or
            ((rgEletronico.itemindex = 1) And
            (trim(dblkPortadorForma.text) <> '')));
         If Not cboxVerificar.checked Then
            result := result And
               (trim(edtHistorico.text) <> '') And
               (trim(dtpDtEfetivacao.text) <> '') And
               (trim(dtpDtContabilizacao.text) <> '') And
               (trim(dptDtVencimento.text) <> '') And
               (trim(dptDtProgramada.text) <> '');
      End;
End;

Procedure TfrmFolhaNormalEfet.dbgrdListaCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   Inherited;
   If Field = qryLista.fieldbyname('PROCESSAR') Then
      Abrush.color := $00BDF9F8
End;

Procedure TfrmFolhaNormalEfet.dbgrdListaFieldChanged(Sender: TObject;
   Field: TField);
Begin
   Inherited;
   If Field = qryLista.fieldbyname('PROCESSAR') Then
      ChecaValidacao(sender);
End;

Procedure TfrmFolhaNormalEfet.btnInverteClick(Sender: TObject);
Begin
   Inherited;
   qrylista.disablecontrols;
   qrylista.first;
   While Not qrylista.eof Do
      Begin
         qrylista.edit;
         qrylista.fieldbyname('PROCESSAR').asinteger :=
            abs(qrylista.fieldbyname('PROCESSAR').asinteger - 1);
         qrylista.next;
      End;
   qrylista.enablecontrols;
End;

Procedure TfrmFolhaNormalEfet.pgctrlInformacoesChange(Sender: TObject);
Begin
   Inherited;
   If pgctrlInformacoes.activepage = tbsResultado Then
      Begin
         frameProgresso.redResultado.setfocus;
         application.processmessages;
      End;
End;

Function TfrmFolhaNormalEfet.Inicializa: boolean;
Begin
   result := false;

   dtmContabil.AbreQryContabFinan;
   dtmContabil.HabilitaControleListas := true;
   dtmContabil.AlocaListas;

   frameProgresso.Iniciar('Folha de Benefícios', true);
   If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      frameProgresso.IntervaloCommit := 1000
   Else //COMMIT AO FINAL
      frameProgresso.IntervaloCommit := 0;
   frameProgresso.IntervaloAtualiza := 100;

   If rgOpcaoSelecao.itemindex = 0 Then
      Begin
         If cboxVerificar.checked Then
            frameProgresso.ExibeMensagem('Verificação de Lotes de Prévia a Efetivar.')
         Else
            Begin
               //Por sempre FORÇAR VERIFICAÇÃO PARA FOLHA EXTRA não precisa mostrar esta mensagem
               If (rdgProcessar.ItemIndex <> 5) Then
                  Begin
                     If SistemaFolha.FlgVerificaParm = 1 Then
                        Begin
                           If MsgDlg('A opção que obriga a verificação da Efetivação está desmarcada. ' + #13#13 +
                              'Confirme que os lotes marcados foram previamente verificados e não apresentaram problemas.' + #13#13 +
                              'Deseja continuar o processo de efetivação sem verificar ? (S/N)',
                              'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
                              Begin
                                 enabled := true;
                                 exit;
                              End;
                        End;
                     frameProgresso.ExibeMensagem('Efetivação de Lotes de Prévia.');
                     If SistemaFolha.FlgVerificaParm = 1 Then
                        frameProgresso.ExibeMensagem('Efetivação confirmada com a obrigatoriedade da verificação desmarcada.');
                  End;
            End;

         frameProgresso.ExibeMensagem('Opções marcadas');
         frameProgresso.ExibeMensagem('  Mês de Referência do Pagamento: ' + trim(MesPagamento));
         frameProgresso.ExibeMensagem('  Data da Efetivação: ' + sDtEfetivacao); // Renato Visoni dtpDtEfetivacao.Text Sol 108334 / Kintana 488340
         frameProgresso.ExibeMensagem('  Data da Contabilização: ' + sDtContabilizacao); // Renato Visoni dtpDtContabilizacao.text Sol 108334 / Kintana 488340
         frameProgresso.ExibeMensagem('  Data do Pagamento Previsto (Vencimento): ' + sDtVencimento); // Renato Visoni dptDtVencimento.Text Sol 108334 / Kintana 488340
         frameProgresso.ExibeMensagem('  Data do Pagamento Efetivo (Programada): ' + sDtProgramada); // Renato Visoni dptDtProgramada.Text Sol 108334 / Kintana 488340

         If rgEletronico.itemindex = 0 Then
            Begin
               frameProgresso.ExibeMensagem('  Geração arquivo eletrônico marcada.');
            End
         Else
            Begin
               frameProgresso.ExibeMensagem('  Geração arquivo eletrônico desmarcada.');
               frameProgresso.ExibeMensagem('  Contas/Caixas x Forma de Pagamento para documentos individuais:' + dblkPortadorForma.text);
            End;

         frameProgresso.ExibeMensagem('Lotes selecionados:');
         qryLista.disablecontrols;
         qryLista.first;
         While Not qryLista.eof Do
            Begin
               If qryLista.fieldbyname('PROCESSAR').asinteger = 1 Then
                  frameProgresso.ExibeMensagem('  ' + qryLista.fieldbyname('IDLISTA').asstring +
                     ' - ' + qryLista.fieldbyname('DESCRICAO').asstring);                     
               qryLista.next;
            End;
         qryLista.enablecontrols;

         frameProgresso.ExibeMensagem('');
         frameProgresso.ExibeMensagem('Validação de parâmetros globais necessários.');

         Try
            If SistemaFolha.FLGCAPCONTROLACPMF = 1 Then
               Begin
                  If SistemaFolha.CODCCUSTOFINAN = '' Then
                     Begin
                        frameProgresso.ExibeMensagem('  ERRO: o parâmetro referente ao Centro de Custo para o Sistema ');
                        frameProgresso.ExibeMensagem('  de Contas a Pagar não está preenchido.');
                        frameProgresso.ExibeMensagem('  Verifique nos Parâmetros Globais do Sistema.');
                        exit;
                     End;

                  If SistemaFolha.idprogramafolha = 0 Then
                     Begin
                        frameProgresso.ExibeMensagem('  ERRO: o parâmetro referente ao Programa para o Sistema ');
                        frameProgresso.ExibeMensagem('  de Contas a Pagar não está preenchido.');
                        frameProgresso.ExibeMensagem('  Verifique nos Parâmetros Globais do Sistema.');
                        exit;
                     End;
               End;

            If Not VerificaFolha('3', MesPagamento, '1', sDtProgramada) Then //Renato Visoni dptDtProgramada.Text Sol 108334 / Kintana 488340
               Begin
                  frameProgresso.ExibeMensagem('  ERRO: a Regra de Verificação da Folha impede que a Efetivação prossiga.');
                  frameProgresso.ExibeMensagem('  Verifique se os parâmetros necessários para a Efetivação estão cadastrados.');
                  exit;
               End;

            If (prmCodTipDoc = '') Or (prmTipCodigo = '') Then
               Begin
                  frameProgresso.ExibeMensagem('  ERRO: os parâmetros globais Tipo Operação e Tipo Documento não estão cadastrados.');
                  exit;
               End;

            liExercicio := 0;
            liPeriodo := 0;
            liEmpresa := Sistema.IdEmpresa;

            If (Sistemafolha.FLGINTEGRACONTABIL = 1) Then
               Begin
                  If Not ctrlPeriodo.RetornaPeriodoExercicioDataProc(
                     liEmpresa, sDtContabilizacao) Then //Renato Visoni dtpDtContabilizacao.Text Sol 108334 / Kintana 488340
                     Begin
                        frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
                        exit;
                     End;

                  If ctrlPeriodo.TestaPeriodoBloqueadoProc(liEmpresa, tbBloqOuInt,
                     ctrlPeriodo.Periodo, ctrlPeriodo.Exercicio, False) Then
                     Begin
                        frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
                        exit;
                     End;

                  If Not ctrlContab.TestaDataBloqueadaProc(liEmpresa,
                     Sistema.IdModulo, sDtContabilizacao) Then //Renato Visoni dtpDtContabilizacao.Text Sol 108334 / Kintana 488340
                     Begin
                        frameProgresso.ExibeMensagem(ctrlContab.MessageInfo);
                        exit;
                     End;
               End;

            If prmIDMOTIVOFOLHABEN <= 0 Then
               Begin
                  frameProgresso.ExibeMensagem('  ERRO: o Motivo Padrão de Pagamento de Benefícios não preenchido.');
                  Exit;
               End;
            result := true;
         Finally
            If result Then
               frameProgresso.ExibeMensagem('Parâmetros necessários validados.')
            Else
               frameProgresso.ExibeMensagem('Problema nos parâmetros apontados. Verificar para poder prosseguir.');
            frameProgresso.ExibeMensagem('');
         End;
      End
   Else
      Begin
         liExercicio := 0;
         liPeriodo := 0;
         liEmpresa := Sistema.IdEmpresa;

         If (Sistemafolha.FLGINTEGRACONTABIL = 1) Then
            Begin
               If Not ctrlPeriodo.RetornaPeriodoExercicioDataProc(
                  liEmpresa,
                  DateTimeToStr(qryLista.fieldbyname('DATAEFETIVACAO').asdatetime)) Then
                  Begin
                     frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
                     exit;
                  End;

               If ctrlPeriodo.TestaPeriodoBloqueadoProc(liEmpresa, tbBloqOuInt,
                  ctrlPeriodo.Periodo, ctrlPeriodo.Exercicio, False) Then
                  Begin
                     frameProgresso.ExibeMensagem(ctrlPeriodo.MessageInfo);
                     exit;
                  End;

               If Not ctrlContab.TestaDataBloqueadaProc(liEmpresa,
                  Sistema.IdModulo,
                  DateTimeToStr(qryLista.fieldbyname('DATAEFETIVACAO').asdatetime)) Then
                  Begin
                     frameProgresso.ExibeMensagem(ctrlContab.MessageInfo);
                     exit;
                  End;
            End;

         result := true;
      End;
End;

Procedure TfrmFolhaNormalEfet.Terminar;
 var ffile : textfile;
     lii : longint;
     NomeLog: String;
Begin
   Inherited;
   frameProgresso.Terminar('Processo concluído Verificar o log de ocorrências.', true);

   //BRUNO AZEVEDO SOL 140974 KINTANA 889580
   try
     NomeLog := '\\Avd14261\Publico\Folha\LOGFOLHABENEFICIO.TXT';
     assignfile(ffile, NomeLog);
     if FileExists(NomeLog) then
        append(ffile)
     else
        rewrite(ffile);
     try
        for lii:=0 to frameProgresso.redResultado.lines.count-1 do
            writeln(ffile, frameProgresso.redResultado.lines[lii]);
     finally
        closefile(ffile);
     end;
   except
   end;
   //BRUNO AZEVEDO SOL 140974 KINTANA 889580

   // Andre Imakawa - SIG 83524 - Inicio
   // Andre Imakawa - SIG 81948 - Inicio
   {
   try
     AlterSessionBD('alter session set _PGA_CR_CACHE_SIZE = 524288');
   except
     frameProgresso.ExibeMensagem('Falha ao alterar _PGA_CR_CACHE_SIZE');
   end;
   }

   GravaLog; 

   If dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.Commit;
   // Andre Imakawa - SIG 83524 - Fim

   // Andre Imakawa - SIG 96394 - Inicio
   if (IdHistorico > 0) then
      MensagemValidacao(IdHistorico);
   // Andre Imakawa - SIG 96394 - Fim

   if cboxVerificar.Checked = False then
     Monitoramento('EFETIVACAO',1)
   else
     Monitoramento('EFETIVACAO - APENAS VALIDACAO',1);


   // Andre Imakawa - SIG 81948 - Fim

   dtmContabil.DesalocaListas;

   IdHistorico := 0; // Andre Imakawa - SIG 96394
End;

Function TfrmFolhaNormalEfet.ObtemLotesXVersao(
   aidhstfolhabenef: integer): String;
Var saux: String;
Begin
   saux := '';
   If FazQuery(qryAux1,
      'SELECT IDLOTE ' +
      'FROM LOTEXHSTFOLHABENEF ' +
      'WHERE FLGTIPOLOTE = ''B'' ' +
      'AND IDHSTFOLHABENEF = ' + inttostr(aidhstfolhabenef)) Then
      Begin
         While Not qryAux1.eof Do
            Begin
               saux := saux + inttostr(qryAux1.fieldbyname('IDLOTE').asinteger) + ',';
               qryAux1.next;
            End;
         delete(saux, length(saux), 1);
      End;
   result := saux;
End;

Function TfrmFolhaNormalEfet.ValidaVersao(asLotes: String;
   ainumreg: integer): boolean;
Begin
   result := false;
   If FazQuery(qryAux1,
      'SELECT COUNT(*) ' +
      'FROM PREVIA ' +
      'WHERE IDLOTE ' + aslotes + ' AND FLGTIPODESC <> ''K''') Then  // Andre Imakawa - WO5879
      Begin
         result := qryAux1.fields[0].asinteger = ainumreg;
      End;
End;

Function TfrmFolhaNormalEfet.BuscaRegVersao(aiversao: integer): integer;
Begin
   result := 0;
   If FazQuery(qryAux1,
      'SELECT COUNT(*) ' +
      'FROM HISTRUBSAL ' +
      'WHERE IDHSTFOLHABENEF = ' + inttostr(aiversao) + ' AND FLGTIPODESC <> ''K''') Then    // Andre Imakawa - WO5879
      result := qryAux1.fields[0].asinteger;
End;

Function TfrmFolhaNormalEfet.ObtemLiquidoVersao(aiidversao: integer): real;
Begin
   result := 0;
   If FazQuery(qryAux1,
      'SELECT SUM(VALORDOC) ' +
      'FROM HSTFOLHABENEFCAP ' +
      'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidversao)) Then
      result := qryAux1.fields[0].asfloat;
End;

Procedure TfrmFolhaNormalEfet.Processa;
Var slotes: String;
   //BRUNO AZEVEDO SOL 252458 KINTANA 754788
   sLoteIrRegressivo, sLoteIrRegressivoAux: String; //SOL 263531 PPM 1118462
   //BRUNO AZEVEDO SOL 252458 KINTANA 754788
   rValorLiquido: real;
   linumreghb: integer;
   lbvalidacc, lbvalidacf: boolean;
   lbvalidaprevia: boolean;
   sERRO_EXEC_SP: String; // SOL:122512 - Daniel Begnami
   sMesCobrancaRRA : string; // Felipe A. Santos - SOL 258357/17801 PPM 1083052

   //Darivaldo Alencar SIG67668 -Inicio
   sLotesX: TStringlist;
   slotesAux: String; // Andre Imakawa - SIG VALIDACAO 85168

   sStatus, sMensagem: String;  // Andre Imakawa - SIG VALIDACAO 85168

   Function ValidouPerfil: Boolean;
   var
     i: Integer;
     iLotesY: array[1..2] of integer;
     qryAUXY: TwwQuery;
   begin
      result:= False;

      try
        qryAUXY:= TwwQuery.Create(Application);
        qryAUXY.databasename:= 'BaseDados';

        for i:= 0 to sLotesX.count-1 do
          begin
            if (sLotesX[i] <> EMptyStr) then
              begin
                iLotesY[1]:= StrToInt(sLotesX[i]);//lote selecionado
                if not(cboxVerificar.checked) then
                   iLotesY[2]:= IdHistorico
                else begin
                   FazQuery(qryAUXY,'SELECT (CM.CHECKLIST_IDHSTFOLHABENEF.NEXTVAL * -1) AS SEQUENCIA FROM DUAL');
                   iLotesY[2]:= qryAUXY.Fieldbyname('SEQUENCIA').asInteger;
                end;
                result := PossuiPerfil(iLotesY[1], iLotesY[2]);
              end
          end;
      finally
        FreeAndNil(qryAUXY);
      end;
   end;
   //Darivaldo Alencar SIG67668 -Fim

   Function VerificaLoteSemPerfil: Boolean;
   var
     i, iTotal: Integer;
     qryAUXY: TwwQuery;
   begin
      result:= False;

      try
        qryAUXY:= TwwQuery.Create(Application);
        qryAUXY.databasename:= 'BaseDados';
        iTotal := 0;
        for i:= 0 to sLotesX.count-1 do
          begin
            if (sLotesX[i] <> EMptyStr) then
              begin
                 FazQuery(qryAUXY,' SELECT COUNT(1) AS QTD FROM PREVIA P WHERE P.IDPERFILINVEST IS NULL AND P.IDLOTE = '+sLotesX[i]);
                 iTotal:= iTotal + qryAUXY.Fieldbyname('QTD').asInteger ;
              end;
          end;

        if iTotal > 0 then
          result:= True
        else
          result:= False;
      finally
        FreeAndNil(qryAUXY);
      end;
   end;
Begin
   Inherited;

   // Andre Imakawa - SIG 81948 - Inicio
   if cboxVerificar.Checked = False then
     Monitoramento('EFETIVACAO',0)
   else
     Monitoramento('EFETIVACAO - APENAS VALIDACAO',0);

   // Andre Imakawa - SIG 83524 - Inicio
   {
   try
     AlterSessionBD('alter session set _PGA_CR_CACHE_SIZE = 3145728');
   except
     frameProgresso.ExibeMensagem('Falha ao alterar _PGA_CR_CACHE_SIZE');
   end;
   }
   // Andre Imakawa - SIG 83524 - Fim
   // Andre Imakawa - SIG 81948 - Fim

   if cboxVerificar.Checked = False then
   begin
     if VerificaDisponibilidade = 0 then
     begin
       MsgDlg('A Disponibilidade esta bloqueada.', 'Informação', mtInformation, [mbOk], 0);
       exit;
     end;
   end;

   //SOL 149567 KINTANA 1075547
   If (chkDemonstrativos.Checked) And (trim(edtNumLinhas.Text) = '') Then
   Begin
      MsgDlg('O Número de linhas para cada página do contra-cheque não foi informado.',
             'Informação', mtInformation, [mbOk], 0);
      exit;
   End;
   //SOL 149567 KINTANA 1075547


   If (SistemaFolha.FlgConfirmaNoFinal = 1) Then
      Begin
         ControleCommit := true;
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.starttransaction;
      End
   Else
      ControleCommit := true;

   try
     sLotesX:= TStringlist.create; //Darivaldo Alencar SIG67668

     If rgOpcaoSelecao.itemindex = 0 Then
        Begin
           Monitoramento('EFETIVACAO VALIDACAO',0); // Andre Imakawa - SIG VALIDACAO 85168
           // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
           // Verifica se nos lotes a efetivar possuem rubricas de RRA com mês de referencia diferente das datas
           // Contabilização, Prevista ou Programada, se tiver exibe mensagem de aviso.
           slotes := '';
           sMesCobrancaRRA := '';
           qryLista.disablecontrols;
           qryLista.First;

           // Andre Imakawa - SIG VALIDACAO 85168 - Inicio
           //if not rdgProcessar.ItemIndex in [0,1,2] then
           //begin
           
           while not(qryLista.Eof) do
           begin
             if qryLista.fieldbyname('PROCESSAR').asinteger = 1 Then
             begin
               if (slotes = '') then
                 slotes := qryLista.fieldbyname('IDLISTA').AsString
               else
                 slotes := slotes + ',' + qryLista.fieldbyname('IDLISTA').AsString;
             end;

             qryLista.Next;
           end;

           qryVerifRRA.Close;
           qryVerifRRA.SQL.Clear;
           qryVerifRRA.SQL.Add('SELECT DISTINCT ' +
                               '       P.MESCOBRANCA ' +
                               '  FROM PREVIA P, PROVDESC PD ' +
                               ' WHERE P.IDRUBRICA = PD.IDPROVENTO ' +
                               '   AND PD.FLGRRA = 1 ' +
                               '   AND P.IDLOTE IN ( ' + slotes + ')' +
                               ' ORDER BY P.MESCOBRANCA '
                              );
           qryVerifRRA.Open;
           qryVerifRRA.First;
           while not(qryVerifRRA.Eof) do
           begin
              sMesCobrancaRRA := qryVerifRRA.FieldByName('MESCOBRANCA').AsString;

              if (sMesCobrancaRRA <> FormatDateTime('YYYY/MM', dtpDtContabilizacao.Date)) or
                 (sMesCobrancaRRA <> FormatDateTime('YYYY/MM', dptDtVencimento.Date)) or
                 (sMesCobrancaRRA <> FormatDateTime('YYYY/MM', dptDtProgramada.Date)) then
              begin
                if MsgDlg('Existem rubricas de RRA nos lotes selecionados com data de referência diferente da data de efetivação. Deseja continuar o processamento?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = MrNo then
                   Exit
                else
                   Break;
              end;

              qryVerifRRA.Next;
           end;

           qryVerifRRA.Close;
        //   end;
           // Andre Imakawa - SIG VALIDACAO 85168 - Fim


           // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim


           // Andre Imakawa - SIG 85168 - Inicio
           qryLista.first;
           ProcessamentoOK := true;

           if rdgProcessar.ItemIndex in [0,1,2] then
           begin
             While Not qryLista.eof Do
             Begin
               If qryLista.fieldbyname('PROCESSAR').asinteger = 1 Then
                 slotesAux := slotesAux + inttostr(qryLista.fieldbyname('IDLISTA').asinteger) + ',';
               qryLista.next;  
             end;

             delete(slotesAux, length(slotesAux), 1);

             frameProgresso.ExibeMensagemEmCaixa('Verificação do(s) lote(s): ' + slotesAux);

             If pos(',', slotesAux) > 0 Then
                slotesAux := ' IN (' + slotesAux + ')'
             Else
                slotesAux := ' = ' + slotesAux;

             sStatus := 'I';
             sMensagem := '';

             Executa_ETL(slotesAux, 0, dataspagto[0], dataspagto[1], dataspagto[2],rgEletronico.itemindex,
                         qryPortadorForma1.fieldbyname('CODPORTFORMA').asinteger, SistemaFolha.FundacaoCorrente, 3, sStatus);

             {
             if (UpperCase(sStatus) = 'F') then
             Begin
               frameProgresso.ExibeMensagem('Erro no processo de Validação.');
               ProcessamentoOK := false;
               exit;
             End;

             lbvalidacc := ProcessamentoOK;
             }

           end;
           // Andre Imakawa - SIG 85168 - Fim

           slotes := '';
           //qryLista.disablecontrols; // Felipe A. Santos - SOL 258357/17801 PPM 1083052
           qryLista.first;

           ProcessamentoOK := true;

           While Not qryLista.eof Do
              Begin
                 If qryLista.fieldbyname('PROCESSAR').asinteger = 1 Then
                    Begin
                       sLotesX.Add(qryLista.fieldbyname('IDLISTA').AsString);//Darivaldo Alencar SIG67668

                       slotes := slotes + inttostr(qryLista.fieldbyname('IDLISTA').asinteger) + ',';
                       If (SistemaFolha.FlgVerificaParm = 0) Or
                          (cboxVerificar.checked) Or
                          (rdgProcessar.ItemIndex = 5) Then //FORÇAR VERIFICAÇÃO PARA FOLHA EXTRA
                          Begin
                             // Andre Imakawa - SIG 85168 - Inicio
                             //if not rdgProcessar.ItemIndex in [0,1,2] then
                             //begin
                             //  frameProgresso.ExibeMensagemEmCaixa('Verificação do lote: ' +
                             //   qryLista.fieldbyname('IDLISTA').asstring);
                             //end;
                             // Andre Imakawa - SIG 85168 - Fim

                             AtualizaParametrosCF(qryLista.fieldbyname('IDLISTA').asinteger);
                             If rgEletronico.itemindex = 0 Then
                             begin

                               //if not rdgProcessar.ItemIndex in [0,1,2] then
                               //begin
                                  lbvalidacc := ValidaContaBancaria(qryLista.fieldbyname('IDLISTA').asinteger);

                                  // SIG35803 Xavier - Validação das contas bancarias
                                  qryAux3.Close;
                                  qryAux3.SQL.Clear;
                                  qryAux3.SQL.Add(' SELECT  DISTINCT D.MATRICULA, P.NOME, PF.DESCRICAO, PRV.IDTITULAR, PRV.IDRESPONSAVEL, PRV.IDPLANOPREV, PRV.IDPLANOORIGEM, PRV.IDPESSJUR ' + #13#10 +
                                                  '         FROM PREVIA PRV' + #13#10 +
                                                  'INNER JOIN PESSOA P ON (P.IDPESSOA = PRV.IDRESPONSAVEL)'+ #13#10 +
                                                  'INNER JOIN DEPENTIT D ON (D.IDPESSOA = PRV.IDPESSOA AND D.IDTITULAR = PRV.IDTITULAR)' + #13#10 +
                                                  '         INNER JOIN PORTADORFORMA PF ON (PF.CODPORTFORMA = PRV.CODPORTFORMA )' + #13#10 +
                                                  '         INNER JOIN FORMARECPAG FP ON (FP.CODFORMA = PF.CODFORMA )' + #13#10 +
                                                  'WHERE FP.FLGDADOSBANCARIOS = ''S''' + #13#10 +
                                                  'AND   PRV.CONTACORRENTE IS NULL' + #13#10 +
                                                  'AND   PRV.IDLOTE = ' +qryLista.fieldbyname('IDLISTA').AsString+ #13#10 +
                                                  ' ORDER BY PRV.IDTITULAR, PRV.IDRESPONSAVEL ');

                                  qryAux3.open;
                                  qryAux3.First;
                                  while not(qryAux3.Eof) do
                                  begin

                                     frameProgresso.ExibeMensagem('Erro, Dados bancários inexistentes');
                                     frameProgresso.ExibeMensagem('Convênio : '+ qryAux3.fieldbyname('DESCRICAO').AsString);
                                     frameProgresso.ExibeMensagem('Matrícula Titular : ' + qryAux3.fieldbyname('Matricula').AsString);
                                     frameProgresso.ExibeMensagem('Recebedor : ' + qryAux3.fieldbyname('Nome').AsString);
                                     frameProgresso.ExibeMensagem('Código Recebedor (idpessoa) : ' + qryAux3.fieldbyname('IDRESPONSAVEL').AsString);
                                     frameProgresso.ExibeMensagem('');

                                     qryAux3.Next;
                                     ProcessamentoOK := false;
                                  end;
                                     // SIG35803 Xavier - Validação das contas bancarias

                                  //if not(ProcessamentoOK) then  // Andre Imakawa - SIG 64961
                                  //   exit;                      // Andre Imakawa - SIG 64961
                             //  end;
                             end
                             Else
                                lbvalidacc := true;
                             lbvalidacf := ValidaParametrosCF(qryLista.fieldbyname('IDLISTA').asinteger);

                             lbvalidaprevia := VerificaPreviaProcessada(
                                qryLista.fieldbyname('IDLISTA').asinteger,
                                qryLista.fieldbyname('MES').asstring);

                             ProcessamentoOK := ProcessamentoOK And
                                lbvalidacc And lbvalidacf
                                And lbValidaPrevia;
                          End
                       Else
                          ProcessamentoOK := true;
                    End;
                 qryLista.next;
              End;



           qryLista.enablecontrols;

           If Not cboxVerificar.checked And ProcessamentoOK Then
              Begin

                 Monitoramento('EFETIVACAO VALIDACAO',1); // Andre Imakawa - SIG VALIDACAO 85168

                 If Not VerificaFolha('3', MesPagamento, '1', sDtProgramada) Then //Renato Visoni dptDtProgramada.Text Sol 108334 / Kintana 488340
                    Begin
                       MsgDlg('A Regra de Verificação da Folha impede que a Efetivação prossiga. ' + #13#13 +
                          'Verifique os parâmetros necessários para a Efetivação.',
                          'Informação', mtInformation, [mbOk, mbHelp], 0);
                       exit;
                    End;

                 //
                 //Por FORÇAR VERIFICAÇÃO PARA FOLHA EXTRA não precisa mostrar esta mensagem
                 If (rdgProcessar.ItemIndex <> 5) Then
                    If SistemaFolha.FlgVerificaParm = 1 Then
                       Begin
                          If MsgDlg('A opção que obriga a verificação da Efetivação está desmarcada. ' + #13#13 +
                             'Confirme que os lotes marcados foram previamente verificados e não apresentaram problemas.' + #13#13 +
                             'Deseja continuar o processo de efetivação sem verificar ? (S/N)',
                             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
                             exit;
                       End;

                 delete(slotes, length(slotes), 1);

                 frameProgresso.ExibeMensagemEmCaixa('Efetivação dos lotes: ' + slotes);

                 If pos(',', slotes) > 0 Then
                    slotes := ' IN (' + slotes + ')'
                 Else
                    slotes := ' = ' + slotes;

                 ObtemIdHistorico;
                 frameProgresso.ExibeMensagemEmCaixa('EFETIVAÇÃO DA VERSÃO: ' + inttostr(IdHistorico));

                //Darivaldo Alencar SIG67668
                 if ProcessamentoOK then
                   begin
                     // Andre Imakawa - SIG 74538 - Inicio
                     if VerificaLoteSemPerfil then
                       begin
                         frameProgresso.ExibeMensagem('ERRO: PRÉVIA SEM PERFIL DE INVESTIMENTOS CADASTRADO');
                         ProcessamentoOK:= false;
                         exit;
                       end;
                     // Andre Imakawa - SIG 74538 - Fim  
                     if not(ValidouPerfil) then
                       begin
                         ProcessamentoOK:= false;
                         exit;
                       end;
                   end;
                //Darivaldo Alencar SIG67668

                 If ProcessamentoOK Then
                    ProcessaFaseHistrubsal(slotes, IdHistorico); //processa gravação dos registros da Previa na Histrubsal
                 If ProcessamentoOK And (Sistemafolha.flgintegracontabil = 1) Then
                    ProcessaContabilizacao(IdHistorico); //processa geração da planilha contábil
                 If ProcessamentoOK Then
                    ProcessaDocumentos(IdHistorico); //processa geração dos documentos financeiros
                 If ProcessamentoOK Then
                    ProcessaArquivobanco(IdHistorico); //processa geração dos arquivos de banco
                 If ProcessamentoOK then
                   if rdgProcessar.ItemIndex in [0,1,2] then
                     ProcessaRetornos_ETL(Idhistorico, slotes) //processa geração dos retornos via ETL
                   else
                     ProcessaRetornos(Idhistorico, slotes); //processa geração dos retornos

                 If ProcessamentoOK Then
                    Begin

                       //edilaine - SIG39907 - inicio
                       if cbPreparaContrib.checked then
                       begin
                         PreparaContribuicaoPatro(slotes);
                       end;
                       //edilaine - SIG39907 - fim

                       rValorLiquido := ObtemLiquidoVersao(idhistorico);
                       GravaHstFolhaBenef(idhistorico, Historico, 0, _ApagaPrevia,
                          liplncodigo, liplnprovisaoabono, rValorLiquido);
                       If SistemaFolha.FlgApagaPrevia = 1 Then
                          Begin
                             frameProgresso.MarcaInicioFase('Apagar Prévia.');
                             frameProgresso.ResetaFrame(1, 1);
                             Try
                                ApagaPreviaEfetivacao(slotes, true);
                                frameProgresso.MarcaFinalFase('Prévia eliminada com sucesso.');
                             Except
                                frameProgresso.MarcaFinalFase('Erro ao apagar a Prévia.');
                             End;
                          End
                       Else
                          frameProgresso.ExibeMensagem('Seguindo a parametrização corrente a Prévia não foi eliminada.');
                       rValorLiquido := ObtemLiquidoVersao(idhistorico);
                       GravaHstFolhaBenef(idhistorico, Historico, 0, _EfetivadoOK,
                          liplncodigo, liplnprovisaoabono, rValorLiquido);
                       If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
                          frameProgresso.FazCommit(false);
                    End;
              End
           else
           begin
             ValidouPerfil;//Darivaldo Alencar SIG67668
             Monitoramento('EFETIVACAO VALIDACAO',1); // Andre Imakawa - SIG VALIDACAO 85168
           end;

        End
     Else
      //REGERAR CONTABILIZAÇÃO-trata opção 2 para regerar contabilização
      Begin
         If rgOpcaoSelecao.itemindex = 1 Then
            Begin
               //fazer codigo de complemento da efetivacao
               qryLista.first;
               While Not qryLista.eof Do
                  Begin
                     If qryLista.fieldbyname('PROCESSAR').asinteger = 1 Then
                        Begin
                           MesPagamento := qryLista.fieldbyname('MES').asstring;

                           sLotes := ObtemLotesXVersao(qryLista.fieldbyname('IDLISTA').asinteger);
                           If pos(',', slotes) > 0 Then
                              slotes := ' IN (' + slotes + ')'
                           Else
                              slotes := ' = ' + slotes;

                           linumreghb := BuscaRegVersao(qryLista.fieldbyname('IDLISTA').asinteger);

                           If qryLista.fieldbyname('FLGESTADO').asinteger > _GeraHistrubsal Then
                              Begin
                                 If Not ValidaVersao(sLotes, linumreghb) Then
                                    Begin
                                       frameProgresso.ExibeMensagem('A Prévia não está compatível com o Histórico de Rubricas gravado.');
                                       frameProgresso.ExibeMensagem('Contatar o suporte.');
                                       qryLista.next;
                                       continue;
                                    End
                              End;

                           IdHistorico := qryLista.fieldbyname('IDLISTA').asinteger;
                           rgEletronico.itemindex := 0;
                           dblkPortadorForma.text := '';


                           //Renato Visoni SOL110083 Kintana 501795
                           If sDtProgramada <> DateTimeToStr(qryLista.fieldbyname('DATAPREVPAGTO').asdatetime) Then Begin
                                 bCalcula := true;
                              End;
                           //Fim Renato Visoni SOL110083 Kintana 501795

                           //Renato Visoni Sol 108334 / Kintana 488340
                           sDtEfetivacao := DateTimeToStr(qryLista.fieldbyname('DATAEFETIVACAO').asdatetime);
                           sDtContabilizacao := DateTimeToStr(qryLista.fieldbyname('DATACONTABIL').asdatetime);
                           sDtVencimento := DateTimeToStr(qryLista.fieldbyname('DATAVENCIMENTO').asdatetime);
                           sDtProgramada := DateTimeToStr(qryLista.fieldbyname('DATAPREVPAGTO').asdatetime);
                           //Fim Renato Visoni Sol 108334 / Kintana 488340

                           {dtpDtEfetivacao.Text:=DateTimeToStr(qryLista.fieldbyname('DATAEFETIVACAO').asdatetime);
                           dtpDtContabilizacao.Text:=DateTimeToStr(qryLista.fieldbyname('DATACONTABIL').asdatetime);
                           dptDtVencimento.Text:=DateTimeToStr(qryLista.fieldbyname('DATAVENCIMENTO').asdatetime);
                           dptDtProgramada.Text:=DateTimeToStr(qryLista.fieldbyname('DATAPREVPAGTO').asdatetime);
                           }

                           //Renato Visoni SOL110083 Kintana 501795
                           If bCalcula Then Begin
                                 CalculaDatasPagto;
                                 bCalcula := False;
                              End;
                           //Fim Renato Visoni SOL110083 Kintana 501795

                           frameProgresso.ExibeMensagem('CONTINUAÇÃO DE EFETIVAÇÃO. VERSÃO: ' + inttostr(IdHistorico));
                           frameProgresso.ExibeMensagem('DATA EFETIVAÇÃO: ' + sDtEfetivacao); //Renato Visoni dtpDtEfetivacao.Text Sol 108334 / Kintana 488340
                           frameProgresso.ExibeMensagem('DATA CONTABILIZAÇÃO: ' + sDtContabilizacao); //Renato Visoni dtpDtContabilizacao.text Sol 108334 / Kintana 488340
                           frameProgresso.ExibeMensagem('DATA PAGAMENTO PREVISTO: ' + sDtVencimento); //Renato Visoni dptDtVencimento.Text Sol 108334 / Kintana 488340
                           frameProgresso.ExibeMensagem('DATA PROGRAMADA: ' + sDtProgramada); //Renato Visoni dptDtProgramada.Text Sol 108334 / Kintana 488340
                           frameProgresso.ExibeMensagem('');

                           ProcessamentoOK := true;

                           If qryLista.fieldbyname('FLGESTADO').asinteger <= _GeraHistrubsal Then
                              Begin
                                 If ProcessamentoOK Then
                                    ProcessaFaseHistrubsal(slotes, IdHistorico); //processa gravação dos registros da Previa na Histrubsal
                              End;


                           If qryLista.fieldbyname('FLGESTADO').asinteger <= _GeraContabilizacao Then
                              Begin
                                 If ProcessamentoOK And (Sistemafolha.flgintegracontabil = 1) Then
                                    ProcessaContabilizacao(IdHistorico); //processa geração da planilha contábil
                              End;

                           If liplncodigo = 0 Then
                              liplncodigo := qryLista.fieldbyname('PLNCODIGO').asinteger;

                           If liplnprovisaoabono = 0 Then
                              liplnprovisaoabono := qryLista.fieldbyname('PLNPROVISABONO').asinteger;

                           If qryLista.fieldbyname('FLGESTADO').asinteger <= _GeraDocumentos Then
                              Begin
                                 If ProcessamentoOK Then
                                    ProcessaDocumentos(IdHistorico); //processa geração dos documentos financeiros
                              End;

                           If qryLista.fieldbyname('FLGESTADO').asinteger <= _GeraArquivos Then
                              Begin
                                 If ProcessamentoOK Then
                                    ProcessaArquivobanco(IdHistorico); //processa geração dos arquivos de banco
                              End;


                           If qryLista.fieldbyname('FLGESTADO').asinteger <= _GeraRetornos Then
                              Begin
                                 If ProcessamentoOK Then
                                   if (qrylista.FieldByName('FLGTIPOFOLHA').AsInteger = 0) AND NOT(VerificaResgate(Idhistorico)) then // Andre Imakawa - SIG 84679
                                     ProcessaRetornos_ETL(Idhistorico, slotes) //processa geração dos retornos via ETL
                                   else
                                     ProcessaRetornos(Idhistorico, slotes); //processa geração dos retornos
                              End;

                           If qryLista.fieldbyname('FLGESTADO').asinteger <= _ApagaPrevia Then
                              Begin
                                 If ProcessamentoOK Then
                                    Begin
                                       rValorLiquido := ObtemLiquidoVersao(idhistorico);
                                       GravaHstFolhaBenef(idhistorico, Historico, 0, _ApagaPrevia,
                                          liplncodigo, liplnprovisaoabono, rValorLiquido);

                                       If SistemaFolha.FlgApagaPrevia = 1 Then
                                          Begin
                                             frameProgresso.MarcaInicioFase('Apagar Prévia.');
                                             frameProgresso.ResetaFrame(1, 1);
                                             Try
                                                ApagaPreviaEfetivacao(slotes, true);
                                                frameProgresso.MarcaFinalFase('Prévia eliminada com sucesso.');
                                             Except
                                                frameProgresso.MarcaFinalFase('Erro ao apagar a Prévia.');
                                             End;
                                          End
                                       Else
                                          frameProgresso.ExibeMensagem('Seguindo a parametrização corrente a Prévia não foi eliminada.');

                                       //SÓ PODE ATUALIZAR O ESTADO DA VERSÃO SE ESTIVER OK
                                       //colocar o valor liquido real e não zero
                                       rValorLiquido := ObtemLiquidoVersao(idhistorico);
                                       GravaHstFolhaBenef(idhistorico, Historico, 0, _EfetivadoOK,
                                          liplncodigo, liplnprovisaoabono, rValorLiquido);
                                       If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
                                          frameProgresso.FazCommit(false);
                                    End;
                              End;
                        End;
                     qryLista.Next;
                  End;
            End
               //REGERAR CONTABILIZAÇÃO-trata opção 2 para regerar contabilização
         Else
            Begin
               If MessageDlg('Confirma regeração das planilhas contábeis para as versões ' + #13#10 +
                  'selecionadas ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                  Begin
                     qryLista.first;
                     While Not qryLista.eof Do
                        Begin
                           If qryLista.fieldbyname('PROCESSAR').asinteger = 1 Then
                              Begin
                                 MesPagamento := qryLista.fieldbyname('MES').asstring;

                                 IdHistorico := qryLista.fieldbyname('IDLISTA').asinteger;
                                 rgEletronico.itemindex := 0;
                                 dblkPortadorForma.text := '';

                                 //Renato Visoni SOL110083 Kintana 501795
                                 If sDtProgramada <> DateTimeToStr(qryLista.fieldbyname('DATAPREVPAGTO').asdatetime) Then Begin
                                       bCalcula := true;
                                    End;
                                 //Fim Renato Visoni SOL110083 Kintana 501795

                                 //Renato Visoni Sol 108334 / Kintana 488340
                                 sDtEfetivacao := DateTimeToStr(qryLista.fieldbyname('DATAEFETIVACAO').asdatetime);
                                 sDtContabilizacao := DateTimeToStr(qryLista.fieldbyname('DATACONTABIL').asdatetime);
                                 sDtvencimento := DateTimeToStr(qryLista.fieldbyname('DATAVENCIMENTO').asdatetime);
                                 sDtProgramada := DateTimeToStr(qryLista.fieldbyname('DATAPREVPAGTO').asdatetime);
                                 //Fim Renato Visoni Sol 108334 / Kintana 488340
                                 {
                                 //Henrique Massão Sol 102448
                                 dtpDtEfetivacao.Text     := DateTimeToStr(qryLista.fieldbyname('DATAEFETIVACAO').asdatetime);
                                 dtpDtContabilizacao.Text := DateTimeToStr(qryLista.fieldbyname('DATACONTABIL').asdatetime);
                                 dptDtVencimento.Text     := DateTimeToStr(qryLista.fieldbyname('DATAVENCIMENTO').asdatetime);
                                 dptDtProgramada.Text     := DateTimeToStr(qryLista.fieldbyname('DATAPREVPAGTO').asdatetime);
                                 //Henrique Massão Sol 102448
                                 }

                                 //Renato Visoni SOL110083 Kintana 501795
                                 If bCalcula Then Begin
                                       CalculaDatasPagto;
                                       bCalcula := False;
                                    End;
                                 //Fim Renato Visoni SOL110083 Kintana 501795

                                 frameProgresso.ExibeMensagemEmCaixa('REGERAÇÃO DA CONTABILIZAÇÃO PARA VERSÃO: ' + inttostr(IdHistorico));
                                 frameProgresso.ExibeMensagem('DATA EFETIVAÇÃO: ' + sDtEfetivacao); //Renato Visoni dtpDtEfetivacao.Text Sol 108334 / Kintana 488340
                                 frameProgresso.ExibeMensagem('DATA CONTABILIZAÇÃO: ' + sDtContabilizacao); //Renato Visoni dtpDtContabilizacao.text Sol 108334 / Kintana 488340
                                 frameProgresso.ExibeMensagem('DATA PAGAMENTO PREVISTO: ' + sDtVencimento); //Renato Visoni dptDtVencimento.Text Sol 108334 / Kintana 488340
                                 frameProgresso.ExibeMensagem('DATA PROGRAMADA: ' + sDtProgramada); //Renato Visoni dptDtProgramada.Text Sol 108334 / Kintana 488340
                                 frameProgresso.ExibeMensagem('');

                                 ProcessamentoOK := true;

                                 liplncodigo := qryLista.fieldbyname('PLNCODIGO').asinteger;
                                 liplnprovisaoabono := qryLista.fieldbyname('PLNPROVISABONO').asinteger;

                                 If ProcessamentoOK And (Sistemafolha.flgintegracontabil = 1) Then
                                    ProcessaContabilizacao(IdHistorico, true);
                              End;
                           qryLista.Next;
                        End;
                  End;
            End;
      End;
      
   finally
     FreeAndNil(sLotesX); //Darivaldo Alencar SIG67668
   end;

   //MARCIO DENILSON SOL 151061 KINTANA 1105188
   //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
   qryLista.First;
   while not qryLista.Eof do
   begin
      if qryLista.FieldByName('PROCESSAR').AsInteger = 1 then begin
         //BRUNO AZEVEDO SOL 252458 KINTANA 754788
         //NÃO ESTAVA CARREGANDO O LOTE DA PREVIA AO PROCESSAR OS LOTES PENDENTES, FAZENDO COM QUE NÃO INSERISSE NA BASEPGTOEFETIVAÇÃO
         //VERSÕES PENDENTES

         If (rgOpcaoSelecao.itemindex = 1) Then begin
           // SOL 263531 PPM 1118462 inicio
           sLoteIrRegressivo := ObtemLotesXVersao(qryLista.fieldbyname('IDLISTA').asinteger);
           sLoteIrRegressivoAux := sLoteIrRegressivo;
           while pos(',', sLoteIrRegressivoAux) > 0  do
           begin
              processaIRRegressivo(qryLista.fieldbyname('MES').asstring,IdHistorico,StrtoInt(Copy(sLoteIrRegressivoAux,1,pos(',', sLoteIrRegressivoAux)-1)));
              sLoteIrRegressivoAux := Copy(sLoteIrRegressivoAux,pos(',', sLoteIrRegressivoAux) + 1,length(sLoteIrRegressivoAux));
           end;
           if pos(',', sLoteIrRegressivoAux) > 0 Then
           begin
              processaIRRegressivo(qryLista.fieldbyname('MES').asstring,IdHistorico,StrToInt(sLoteIrRegressivoAux));
           end
           else if trim(sLoteIrRegressivoAux) <> '' then
           begin
               processaIRRegressivo(qryLista.fieldbyname('MES').asstring,IdHistorico,StrToInt(sLoteIrRegressivoAux));
           end;

           //sLoteIrRegressivo := ObtemLotesXVersao(qryLista.fieldbyname('IDLISTA').asinteger);
           //processaIRRegressivo(qryLista.fieldbyname('MES').asstring,IdHistorico,StrToInt(sLoteIrRegressivo));

           // SOL 263531 PPM 1118462 final

         //LOTES PENDENTES, MANTIVE COMO ESTAVA
         end else begin
           processaIRRegressivo(qryLista.fieldbyname('MES').asstring,IdHistorico,
                                qryLista.fieldbyname('IDLISTA').AsInteger); //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
         end;
         //BRUNO AZEVEDO SOL 252458 KINTANA 754788
      end;
      qryLista.Next;
   end;
   //FIM Helio - SOL Nº 151061-10442 KINTANA Nº 1720319

   //Marcio Denilson - SOL 136569 - KINTANA 820997
   If chkExcessoDebito.Checked Then
      Begin
         frameProgresso.ExibeMensagem('Inicio da Execução da procedure: SP_FB_EXCESSODEBITO.');

         Try

           If Not assigned(frmEspera) Then
              Application.CreateForm(TfrmEspera, frmEspera);
           frmEspera.Config('Aguarde...', 'Controle de excesso de débito via procedure !', False);
           frmEspera.Show;
           Application.ProcessMessages;
           frmEspera.Mostra;
           sERRO_EXEC_SP := Self.Exec_SP_ExcessoDebito( qryLista.fieldbyname('IDLISTA').asinteger
                                                       ,qryLista.fieldbyname('MES').asstring
                                                       ,sDtVencimento
                                                       ,sDtProgramada );
           frmEspera.Esconde;
           FreeAndNil(frmEspera);

           If uppercase(copy(sERRO_EXEC_SP, 1, 2)) = 'OK' Then
              sERRO_EXEC_SP := 'Concluído com Sucesso';

           frameProgresso.ExibeMensagem('Resultado da execução:' + sERRO_EXEC_SP);

           frameProgresso.ExibeMensagem('Fim da Execução da procedure: SP_FB_EXCESSODEBITO.');

         Except
           on e:Exception do
            begin
                 If frmEspera <> nil Then
                  begin
                     frmEspera.Esconde;
                     FreeAndNil(frmEspera);
                  end;

                 frameProgresso.ExibeMensagem('Erro na execução da procedure: SP_FB_EXCESSODEBITO. Erro: ' + e.Message );
            end;
         end;

      End;
   // FIM
        

   // SOL:122512 - Daniel Begnami
   If cbEXEC_SP_MAPA.Checked Then
      Begin

         frameProgresso.ExibeMensagem('Inicio da Execução da procedure: SP_FB_MAPAFOLHABENEF.');

         If Not assigned(frmEspera) Then
            Application.CreateForm(TfrmEspera, frmEspera);
         frmEspera.Config('Aguarde...', 'Gerando o mapa da folha de benefício via procedure !', False);
         frmEspera.Show;
         Application.ProcessMessages;
         frmEspera.Mostra;
         sERRO_EXEC_SP := Self.Exec_SP_MapaFolhaBenef;
         frmEspera.Esconde;
         FreeAndNil(frmEspera);

         If uppercase(copy(sERRO_EXEC_SP, 1, 2)) = 'OK' Then
            sERRO_EXEC_SP := 'Concluído com Sucesso';

         frameProgresso.ExibeMensagem('Resultado da execução:' + sERRO_EXEC_SP);

         frameProgresso.ExibeMensagem('Fim da Execução da procedure: SP_FB_MAPAFOLHABENEF.');

      End;
   // FIM

   //CPrev - 22537 - Inicio
   If ProcessamentoOK Then
      Begin
         Reg := TRegistry.Create;

         Try
            Reg.RootKey := HKEY_CURRENT_USER;

            If Reg.OpenKey('\Software\CM\Funcef', True) Then
               Begin
                  Reg.WriteString('Demonstrativos', 'False');
                  Reg.WriteString('DemonstrativosString', '');

                  If chkDemonstrativos.Checked Then
                     Begin
                        Reg.WriteString('Demonstrativos', 'True');
                        Reg.WriteString('DemonstrativosString', IntToStr(idhistorico));
                     End;
               End;
         Finally
            Reg.CloseKey;
            Reg.Free;

            Inherited;
         End;
         //SOL 149567 KINTANA 1075547
         if chkDemonstrativos.Checked then
         begin
            Application.CreateForm(TFrmDemPag,FrmDemPag);
            if(FrmDemPag.FormStyle = fsMDIChild)then
            begin
               FrmDemPag.FormStyle := fsNormal;
               FrmDemPag.Visible := False;
            end;
            if FrmDemPag.qryHistorico.Locate('IDHSTFOLHABENEF',IdHistorico,[]) then
            begin
               FrmDemPag.dblcHistorico.LookupValue  := FrmDemPag.qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString;
               FrmDemPag.dblcHistoricoChange(FrmDemPag);
               FrmDemPag.CBoxPatro.Checked     := true;
               FrmDemPag.CBoxPatro.onclick(FrmDemPag);
               FrmDemPag.CBoxPlano.Checked     := true;
               FrmDemPag.CBoxPlano.onclick(FrmDemPag);
               FrmDemPag.CBoxPortForma.Checked := true;
               FrmDemPag.CBoxPortForma.onclick(FrmDemPag);
               FrmDemPag.frameBenef.bbtnExcluiCorrente.onclick(FrmDemPag);
               FrmDemPag.edtNumLinhas.Text := edtNumLinhas.Text;
               FrmDemPag.bbtnConfirmarClick(FrmDemPag);
            end;

            FreeAndNil(FrmDemPag);

         end;
        //SOL 149567 KINTANA 1075547
      End;
   //CPrev - 22537 - Fim



End;

Procedure TfrmFolhaNormalEfet.ObtemParametroCF(qry: twwquery;
   Var CF: TRegContFinan);
Begin
   CF.PlaContaD := qry.fieldbyname('PLACONTAD').asstring;
   CF.CentroCustoD := qry.fieldbyname('CODCENTROCUSTOD').asstring;
   CF.PlaContaC := qry.fieldbyname('PLACONTAC').asstring;
   CF.CentroCustoC := qry.fieldbyname('CODCENTROCUSTOC').asstring;
   CF.SubConta := 0;
   CF.UnidNegoc := qry.fieldbyname('UNIDNEGOC').asinteger;
   CF.CentroRespon := qry.fieldbyname('CODCENTRORESPON').asstring;
   CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDES').asstring;
   CF.Plano := qry.fieldbyname('PLANO').asinteger;
   CF.RecPag := 'P';

   If SistemaFolha.FlgUsaProvisaoAbono And
      (qryProcesso.fieldbyname('FLGTEMPROVISAO').asinteger = 1) Then
      Begin
         CF.PlaContaCProvisAbono := qry.fieldbyname('PLACONTACPROVIS').asstring;
         CF.CentroCustoCProvisAbono := qry.fieldbyname('CODCCUSTOCPROVIS').asstring;
         CF.PlaContaDProvisAbono := qry.fieldbyname('PLACONTADPROVIS').asstring;
         CF.CentroCustoDProvisAbono := qry.fieldbyname('CODCCUSTODPROVIS').asstring;
      End
   Else
      Begin
         CF.PlaContaCProvisAbono := '';
         CF.CentroCustoCProvisAbono := '';
         CF.PlaContaDProvisAbono := '';
         CF.CentroCustoDProvisAbono := '';
      End;

   CF.Mensagem := '';
   CF.bValidada := false;
End;

Procedure TfrmFolhaNormalEfet.AtualizaParametrosCF(aiidlote: integer);
Var ssql: String;
   regCF: TRegContFinan;
   lsmsg: String;
   lsplacontaliq: String;
Begin
   ssql :=
      'SELECT P.MES, P.MESCOBRANCA, P.IDPESSJUR, P.IDRUBRICA, P.IDMOTIVO, ' + _clinefeed +
      '       P.REFERENCIA, P.IDPESSOA, P.SEQRUBRICA, P.IDTITULAR, ' + _clinefeed +
      '       P.IDPLANOCONTABIL, ' + _clinefeed +
      '       P.FLGTIPODESC, P.IDPLANOPREV, P.IDBENEFICIO, D.FLGDESCONTO, ' + _clinefeed +
      '       P.FLGPROVISORIO, P.IDPATRO, ' + _clinefeed +
      '       P.CODTIPRECDES, ' + _clinefeed +
      '       (SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM=''CODCENTRORESPON'') AS CODCENTRORESPON, ' + _clinefeed + // Renato Visoni SOL 107549 \ Kintana 483466
   '       P.UNIDNEGOC, ' + _clinefeed +
      '       P.PLANO, ' + _clinefeed +
      '       P.PLACONTAC, ' + _clinefeed +
      '       P.PLACONTAD, ' + _clinefeed +
      '       P.CODCENTROCUSTOC, ' + _clinefeed +
      '       P.CODCENTROCUSTOD, ' + _clinefeed +
      '       P.PLACONTACPROVIS, ' + _clinefeed +
      '       P.PLACONTADPROVIS, ' + _clinefeed +
      '       P.CODCCUSTOCPROVIS, ' + _clinefeed +
      '       P.CODCCUSTODPROVIS, ' + _clinefeed +
      '       P.FLGTEMPROVISAO ' + _clinefeed +
//      '       P.MESCOMPREEM  '  + _clinefeed +  //  SOL 140042 Kintana 900220    //SOL 164763 Kintana 1419360
      'FROM PREVIA P, PROVDESC D ' + _clinefeed +
      'WHERE P.IDLOTE = ' + inttostr(qryLista.fieldbyname('IDLISTA').asinteger) + ' ' + _clinefeed +
      'AND P.IDRUBRICA = D.IDPROVENTO ' + _clinefeed +
      'AND D.FLGESPECIAL = 0 ' + _clinefeed +
      'AND D.FLGDESCONTO IN (0,1) ' + _clinefeed;

   //SE NÃO RECALCULA IR NÃO GERA CONTABILIZAÇÃO
   ssql := ssql +
      'AND (P.CODTIPRECDES IS NULL ' + _clinefeed +
      '     OR P.CODCENTRORESPON IS NULL ' + _clinefeed +
      '     OR P.UNIDNEGOC IS NULL ' + _clinefeed +
      '     OR P.PLANO IS NULL ' + _clinefeed +
      '     OR P.PLACONTAC IS NULL ' + _clinefeed +
      '     OR P.PLACONTAD IS NULL ' + _clinefeed +
      '     OR (P.CODCENTROCUSTOC IS NULL ' + _clinefeed +
      '         AND EXISTS (SELECT 1 ' + _clinefeed +
      '                     FROM PLANOCONTA PL ' + _clinefeed +
      '                     WHERE PL.PLANO = P.PLANO ' + _clinefeed +
      '                     AND PL.PLACONTA = P.PLACONTAC ' + _clinefeed +
      '                     AND PL.PLACCUST = ''S'')) ' + _clinefeed +
      '     OR (P.CODCENTROCUSTOD IS NULL ' + _clinefeed +
      '         AND EXISTS (SELECT 1 ' + _clinefeed +
      '                     FROM PLANOCONTA PL ' + _clinefeed +
      '                     WHERE PL.PLANO = P.PLANO ' + _clinefeed +
      '                     AND PL.PLACONTA = P.PLACONTAD ' + _clinefeed +
      '                     AND PL.PLACCUST = ''S''))' + _clinefeed;

   If SistemaFolha.FlgUsaProvisaoAbono Then
      Begin
         ssql := ssql +
            '     OR ((P.FLGTEMPROVISAO = 1) ' + _clinefeed +
            '         AND ' + _clinefeed +
            '         (   P.PLACONTACPROVIS IS NULL ' + _clinefeed +
            '          OR P.PLACONTADPROVIS IS NULL ' + _clinefeed +
            '          OR (P.CODCCUSTOCPROVIS IS NULL ' + _clinefeed +
            '              AND EXISTS (SELECT 1 ' + _clinefeed +
            '                          FROM PLANOCONTA PL ' + _clinefeed +
            '                          WHERE PL.PLANO = P.PLANO ' + _clinefeed +
            '                          AND PL.PLACONTA = P.PLACONTACPROVIS ' + _clinefeed +
            '                          AND PL.PLACCUST = ''S'')) ' + _clinefeed +
            '          OR (P.CODCCUSTODPROVIS IS NULL ' + _clinefeed +
            '              AND EXISTS (SELECT 1 ' + _clinefeed +
            '                          FROM PLANOCONTA PL ' + _clinefeed +
            '                          WHERE PL.PLANO = P.PLANO ' + _clinefeed +
            '                          AND PL.PLACONTA = P.PLACONTADPROVIS ' + _clinefeed +
            '                          AND PL.PLACCUST = ''S''))' + _clinefeed +
            '        ))' + _clinefeed;
      End;
   ssql := ssql + '    )' + _clinefeed;

   If FazQuery(qryProcesso, ssql) Then
      Begin
         Try
            frameProgresso.MarcaInicioFase('Atualiza parâmetros contábeis e financeiros do lote.');
            frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.starttransaction;

            While Not qryProcesso.eof Do
               Begin
                  lsplacontaliq := dtmContabil.AchaContaLiquidoBeneficio(
                     qryProcesso.fieldbyname('IDPATRO').asinteger,
                     qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                     qryProcesso.fieldbyname('IDBENEFICIO').asinteger);

                  ObtemParametroCF(qryProcesso, regCF);

                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'B') Then
                     Begin
                        dtmContabil.PegaTipoDescB(
                           qryProcesso.fieldbyname('FLGTIPODESC').asstring,
                           false,
                           qryProcesso.fieldbyname('IDPATRO').asinteger,
                           qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                           qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger,
                           qryProcesso.fieldbyname('IDBENEFICIO').asinteger,
                           qryProcesso.fieldbyname('FLGDESCONTO').asinteger,
                           qryProcesso.fieldbyname('MES').asstring,
                           qryProcesso.FieldByName('MESCOBRANCA').asstring,
                           qryProcesso.fieldbyname('FLGPROVISORIO').asinteger,
                           0,
                           qryProcesso.fieldbyname('FLGTEMPROVISAO').asinteger = 1,
                           regCF,
                           lsmsg,
                           lsplacontaliq);
                     End;

                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'P') Or
                     (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'Y') Then
                     Begin
                        dtmContabil.PegaTipoDescP_Y(
                           qryProcesso.fieldbyname('FLGTIPODESC').asstring,
                           false,
                           qryProcesso.fieldbyname('IDPATRO').asinteger,
                           qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                           qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger,
                           qryProcesso.fieldbyname('IDRUBRICA').asinteger,
                           qryProcesso.fieldbyname('FLGDESCONTO').asinteger,
                           qryProcesso.fieldbyname('MES').asstring,
                           qryProcesso.FieldByName('MESCOBRANCA').asstring,
                           qryProcesso.fieldbyname('FLGPROVISORIO').asinteger,
                           0,
                           qryProcesso.fieldbyname('FLGTEMPROVISAO').asinteger = 1,
                           lsplacontaliq,
                           true,
                           qryProcesso.fieldbyname('IDTITULAR').asinteger,
                           regCF,
                           lsmsg);
                     End;

                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'C') Or
                     (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'T') Or
                     (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'R') Or
                     (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'Q') Then
                     Begin
                        dtmContabil.PegaTipoDescC_T_Q(
                           qryProcesso.fieldbyname('FLGTIPODESC').asstring,
                           false,
                           qryProcesso.fieldbyname('IDPATRO').asinteger,
                           qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                           qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger,
                           qryProcesso.fieldbyname('IDRUBRICA').asinteger,
                           qryProcesso.fieldbyname('FLGDESCONTO').asinteger,
                           qryProcesso.fieldbyname('MES').asstring,
                           lsplacontaliq,
                           regCF,
                           lsmsg);
                     End;

                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'E') Or
                     (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'A') Then
                     Begin
                        dtmContabil.PegaTipoDescE_A(
                           qryProcesso.fieldbyname('FLGTIPODESC').asstring,
                           false,
                           qryProcesso.fieldbyname('IDPATRO').asinteger,
                           qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                           qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger,
                           qryProcesso.fieldbyname('IDRUBRICA').asinteger,
                           qryProcesso.fieldbyname('FLGDESCONTO').asinteger,
                           lsplacontaliq,
                           regCF,
                           lsmsg);
                     End;

                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'I') Then
                     Begin
                        dtmContabil.PegaTipoDescI(
                           qryProcesso.fieldbyname('FLGTIPODESC').asstring,
                           false,
                           qryProcesso.fieldbyname('IDPATRO').asinteger,
                           qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                           qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger,
                           qryProcesso.fieldbyname('IDRUBRICA').asinteger,
                           qryProcesso.fieldbyname('FLGDESCONTO').asinteger,
                           lsplacontaliq,
                           regCF,
                           lsmsg);
                     End;

                  ssql :=
                     'UPDATE PREVIA SET ';

                  If SistemaFolha.FlgUsaProvisaoAbono And
                     (qryProcesso.fieldbyname('FLGTEMPROVISAO').asinteger = 1) Then
                     Begin
                        If regCF.PlaContaCProvisAbono <> '' Then
                           ssql := ssql + 'PLACONTACPROVIS = ' + QuotedStr(regCF.PlaContaCProvisAbono) + ','
                        Else
                           ssql := ssql + 'PLACONTACPROVIS = NULL,';

                        If regCF.PlaContaDProvisAbono <> '' Then
                           ssql := ssql + 'PLACONTADPROVIS = ' + QuotedStr(regCF.PlaContaDProvisAbono) + ','
                        Else
                           ssql := ssql + 'PLACONTADPROVIS = NULL,';

                        If regCF.CentroCustoCProvisAbono <> '' Then
                           ssql := ssql + 'CODCCUSTOCPROVIS = ' + QuotedStr(regCF.CentroCustoCProvisAbono) + ','
                        Else
                           ssql := ssql + 'CODCCUSTOCPROVIS = NULL,';

                        If regCF.CentroCustoDProvisAbono <> '' Then
                           ssql := ssql + 'CODCCUSTODPROVIS = ' + QuotedStr(regCF.CentroCustoDProvisAbono) + ', '
                        Else
                           ssql := ssql + 'CODCCUSTODPROVIS = NULL, ';
                     End;

                  If trim(regCF.CodTipRecDes) <> '' Then
                     ssql := ssql + 'CODTIPRECDES = ' + QuotedStr(regCF.CodTipRecDes) + ','
                  Else
                     ssql := ssql + 'CODTIPRECDES = NULL,';

                  If trim(regCF.CentroRespon) <> '' Then
                     ssql := ssql + 'CODCENTRORESPON = ' + QuotedStr(regCF.CentroRespon) + ','
                  Else
                     ssql := ssql + 'CODCENTRORESPON = ' + prmcodcentrorespon + ',';

                  If regCF.UnidNegoc > 0 Then
                     ssql := ssql + 'UNIDNEGOC = ' + inttostr(regCF.UnidNegoc) + ','
                  Else
                     ssql := ssql + 'UNIDNEGOC = ' + inttostr(prmUnidNegoc) + ',';

                  If regCF.Plano > 0 Then
                     ssql := ssql + 'PLANO = ' + inttostr(regCF.Plano) + ','
                  Else
                     ssql := ssql + 'PLANO = ' + inttostr(IntegraBack.Plano) + ',';

                  If regCF.PlaContaC <> '' Then
                     ssql := ssql + 'PLACONTAC = ' + QuotedStr(regCF.PlaContaC) + ','
                  Else
                     ssql := ssql + 'PLACONTAC = NULL,';

                  If regCF.PlaContaD <> '' Then
                     ssql := ssql + 'PLACONTAD = ' + QuotedStr(regCF.PlaContaD) + ','
                  Else
                     ssql := ssql + 'PLACONTAD = NULL,';

                  If regCF.CentroCustoC <> '' Then
                     ssql := ssql + 'CODCENTROCUSTOC = ' + QuotedStr(regCF.CentroCustoC) + ','
                  Else
                     ssql := ssql + 'CODCENTROCUSTOC = NULL,';

                  If regCF.CentroCustoD <> '' Then
                     ssql := ssql + 'CODCENTROCUSTOD = ' + QuotedStr(regCF.CentroCustoD) + ' '
                  Else
                     ssql := ssql + 'CODCENTROCUSTOD = NULL ';

                  ssql := ssql +
                     'WHERE MES = ' + QuotedStr(qryProcesso.fieldbyname('MES').asstring) + ' ' +
                     'AND MESCOBRANCA = ' + QuotedStr(qryProcesso.fieldbyname('MESCOBRANCA').asstring) + ' ' +
                     'AND IDPESSJUR = ' + inttostr(qryProcesso.fieldbyname('IDPESSJUR').asinteger) + ' ' +
                     'AND IDRUBRICA = ' + inttostr(qryProcesso.fieldbyname('IDRUBRICA').asinteger) + ' ' +
                     'AND IDMOTIVO = ' + inttostr(qryProcesso.fieldbyname('IDMOTIVO').asinteger) + ' ' +
                     'AND REFERENCIA = ' + QuotedStr(qryProcesso.fieldbyname('REFERENCIA').asstring) + ' ' +
                     'AND IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDPESSOA').asinteger) + ' ' +
                     'AND SEQRUBRICA = ' + inttostr(qryProcesso.fieldbyname('SEQRUBRICA').asinteger) + ' ' +
                     'AND IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ' ';

                  ExecutarQuery(qryAux1, ssql);

                  frameProgresso.Passo;
                  qryProcesso.next;
               End;
         Finally
            frameProgresso.MarcaFinalFase('Conclusão da atualização dos parâmetros contábeis e financeiros do lote.');
            frameProgresso.ResetaFrame(1, 0);

            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               frameProgresso.FazCommit(false);
         End;
      End;
End;

Function TfrmFolhaNormalEfet.PegaDadosRecebedor(aiidtitular,
   aiidresponsavel, aiidplanoprev, aiidplanoorigem, aiidpessjur: integer): boolean;
Var iplano: integer;
   ssql: String;
Begin
   If aiidtitular = aiidresponsavel Then
      iplano := aiidplanoprev
   Else
      iplano := aiidplanoorigem;

   ssql := 'SELECT DISTINCT ELP.MATRICULA, DEP.MATRICULA AS MATDEP, ' + _clinefeed +
      'PPP.INSCRICAONUMERO, P.NOME ' + _clinefeed +
      'FROM PARTPREVPLAN PPP, ELEGPATRO ELP, DEPENTIT DEP, PESSOA P ' + _clinefeed +
      'WHERE (PPP.IDPESSJUR = ' + inttostr(aiidpessjur) + ') ' + _clinefeed +
      'AND (PPP.IDPLANOPREV = ' + inttostr(iplano) + ') ' + _clinefeed +
      'AND (PPP.IDPESSOA = ' + inttostr(aiidtitular) + ') ' + _clinefeed +
      'AND (PPP.SEQPROPOSTA = 1) ' + _clinefeed +
      'AND (ELP.IDPESSOA = PPP.IDPESSOA) ' + _clinefeed +
      'AND (ELP.IDPESSJUR = PPP.IDPESSJUR) ' + _clinefeed +
      'AND (DEP.IDTITULAR(+) = PPP.IDPESSOA) ' + _clinefeed +
      'AND (DEP.IDPESSOA(+) = ' + inttostr(aiidresponsavel) + ') ' + _clinefeed +
      'AND (P.IDPESSOA = ' + inttostr(aiidresponsavel) + ') ';

   result := false;
   If FazQuery(qryDadoReceb, ssql) Then
      result := Not qryDadoReceb.isempty;
End;

Function TfrmFolhaNormalEfet.ValidaContaBancaria(aiidlote: integer): boolean;
Var ssql: String;
   lsNomeAgencia, lsTipoConta, lsCBancariaElet: String;
   lbPagtoElet, lbDuplContaPref: boolean;
   lsBanco_ini: String;
   lsAgencia_ini: String;
   lsContaCorrente_ini: String;
   ifavdoc_ini: integer;
   licodportforma_ini: integer;
   lsBanco_novo: String;
   lsAgencia_novo: String;
   lsContaCorrente_novo: String;
   ifavdoc_novo: integer;
   licodportforma_novo: integer;
   lbfolhareserva: boolean;
   lipulareg: integer;
   smsgerro: String;
   lobjPortador: tObjPortadorForma;
   lrValorLiquido: real;
   liseqdoc: integer;
   bResgateParc : boolean; // SOL 63067
   lsTipoConta_ini : string; // Andre Imakawa - SIG 101624
Begin
   result := true;
   lbfolhareserva := IsLoteReserva(qryAux1, aiidlote);

   ssql := 'SELECT ' + _clinefeed +
      '       SUM(DECODE(PRV.FLGDESCONTO,0, ' + _clinefeed +
      '                  DECODE(PRV.FLGESPECIAL,0,PRV.VALORPROVENTO,0), ' + _clinefeed +
      '                  DECODE(PRV.FLGESPECIAL,0,PRV.VALORPROVENTO*-1,0))) LIQUIDO, ' + _clinefeed +
      '       PRV.SEQDOCUMENTO, PRV.IDRECEBEPGTO, ' + _clinefeed +
      '       PRV.IDPATRO IDPESSJUR, PRV.IDPLANOPREV, ' + _clinefeed +
      '       PRV.IDTITULAR, PRV.IDRESPONSAVEL, PRV.IDPLANOORIGEM, ' + _clinefeed +
      '       PRV.IDLOTE, PRV.FLGPROVISORIO, ' + _clinefeed +
      '       NVL(PRV.CODPORTFORMA,0) AS CODPORTFORMA, ' + _clinefeed +
      '       NVL(PRV.IDFAVDOC,0) AS IDFAVDOC, ' + _clinefeed +
      '       PRV.NUMBANCO, PRV.NUMAGENCIA, PRV.CONTACORRENTE, ' + _clinefeed +
      '       DECODE(PRV.FLGPENSAOALIM,2,1,0) AS FLGPENSAOALIM, ' + _clinefeed +
      '       NVL(CT.FLGTIPOFOLHA,0) FLGTIPOFOLHA ' + _clinefeed +
      '       , PRV.TIPOCONTA  ' + _clinefeed +       // Andre Imakawa - SIG 101624
      '       ,NVL(CT.FLGRESGATE,0) FLGRESGATE ' + _clinefeed + //Renato Visoni SOL 138251 kintana 840758
//      '       PRV.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220  // SOL 164763 Kintana 1419360
      'FROM PREVIA PRV, CTRLINTERFACE CT ' + _clinefeed +
      'WHERE (PRV.IDLOTE = ' + inttostr(aiidlote) + ') ' + _clinefeed +
      'AND (PRV.IDLOTE = CT.IDLOTE) ' + _clinefeed +
      'GROUP BY PRV.SEQDOCUMENTO, ' + _clinefeed +
      '         PRV.IDPATRO, PRV.IDPLANOPREV, ' + _clinefeed +
      '         PRV.IDTITULAR, PRV.IDRESPONSAVEL, PRV.IDPLANOORIGEM, ' + _clinefeed +
      '         PRV.IDLOTE, PRV.FLGPROVISORIO, ' + _clinefeed +
      '         NVL(PRV.CODPORTFORMA,0), ' + _clinefeed +
      '         NVL(PRV.IDFAVDOC,0), ' + _clinefeed +
      '         PRV.NUMBANCO, PRV.NUMAGENCIA, PRV.CONTACORRENTE, ' + _clinefeed +
      '         DECODE(PRV.FLGPENSAOALIM,2,1,0), ' + _clinefeed +
      '         PRV.TIPOCONTA,  ' + _clinefeed +       // Andre Imakawa - SIG 101624
      '         NVL(CT.FLGTIPOFOLHA,0), PRV.IDRECEBEPGTO ' + _clinefeed +
      '         ,CT.FLGRESGATE ' + _clinefeed + //Renato Visoni SOL 138251 kintana 840758
//      '         ,PRV.MESCOMPREEM ' + _clinefeed +  // SOL 140042 Kintana 900220   // SOL 164763 Kintana 1419360
      'ORDER BY PRV.IDRESPONSAVEL';

   If FazQuery(qryProcesso, ssql) Then
      Begin
         Try
            frameProgresso.MarcaInicioFase('Verificação de contas bancárias.');
            frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.starttransaction;

            While Not qryProcesso.eof Do
               Begin
                  //pegar estes parametros da previa e gravar os novos se houver alteracao
                  licodportforma_ini := qryProcesso.fieldbyname('CODPORTFORMA').asinteger;
                  ifavdoc_ini := qryProcesso.fieldbyname('IDFAVDOC').asinteger;
                  lsBanco_ini := qryProcesso.fieldbyname('NUMBANCO').asstring;
                  lsAgencia_ini := qryProcesso.fieldbyname('NUMAGENCIA').asstring;
                  lsContaCorrente_ini := qryProcesso.fieldbyname('CONTACORRENTE').asstring;
                  lsTipoConta_ini := qryProcesso.fieldbyname('TIPOCONTA').asString; // Andre Imakawa - SIG 101624

                  licodportforma_novo := licodportforma_ini;
                  ifavdoc_novo := ifavdoc_ini;
                  lsBanco_novo := lsBanco_ini;
                  lsAgencia_novo := lsAgencia_ini;
                  lsContaCorrente_novo := lsContaCorrente_ini;
                  lsTipoConta := lsTipoConta_ini; // Andre Imakawa - SIG 101624

                  lrValorLiquido := qryProcesso.fieldbyname('LIQUIDO').asfloat;

                  licodportforma_novo := ctrlBCP.DefinePortadorForma(
                     qryProcesso.fieldbyname('IDTITULAR').asinteger,
                     qryProcesso.fieldbyname('IDRECEBEPGTO').asinteger,
                     qryProcesso.fieldbyname('IDPESSJUR').asinteger,
                     qryProcesso.fieldbyname('FLGTIPOFOLHA').asinteger,
                     qryProcesso.fieldbyname('FLGPROVISORIO').asinteger,
                     qryProcesso.fieldbyname('FLGPENSAOALIM').asinteger,
                     licodportforma_ini, byte(lbfolhareserva),
                     lsBanco_novo, lsAgencia_novo, lsNomeAgencia, lsContaCorrente_novo,
                     lsTipoConta, lsCBancariaElet, lbPagtoElet, lbDuplContaPref,
                     ifavdoc_novo,
                     lrValorLiquido,
                     liseqdoc,
                     lobjPortador,
                     aiidlote// Renato Visoni SOL 138251 kintana 840758
                     );

                  smsgerro := '';

                  sSQL := ' SELECT * FROM CTRLINTERFACE WHERE IDLOTE = ' + intTostr(aiidlote) +' AND NVL(FLGRESGATEPARCELADO,1)=1';
                  qryAux3.close;
                  qryAux3.sql.clear;
                  qryAux3.sql.add(ssql);
                  qryAux3.open;
                  bResgateParc := not (qryAux3.IsEmpty);

                  if bResgateParc then
                  begin
                     if (trim(lsBanco_novo) = '') Or(trim(lsAgencia_novo) = '') Or(trim(lsContaCorrente_novo) = '') then
                        smsgerro:='Erro, Conta Resgate não cadastrada ...';
                  end
                  else
                  If lbPagtoElet Then
                     Begin
                        If lbDuplContaPref Then
                           Begin
                             if (licodportforma_novo < 308) or (licodportforma_novo > 310) then // Andre Imakawa - SIG 123179
                               smsgerro:='Erro, existe mais de uma Conta Salário Cadastrada ...';   // SOL:111915 - Daniel Begnami
                           End
                        Else
                           //Renato Visoni SOL 138251 kintana 840758
                           if qryProcesso.fieldbyname('FLGRESGATE').asinteger  = 0 then begin
                             If (licodportforma_novo = 0) Or
                                (trim(lsBanco_novo) = '') Or
                                (trim(lsAgencia_novo) = '') Or
                                //trata novo TIPO de conta OP/Recibo
                             ((trim(lsContaCorrente_novo) = '') And (lsTipoConta <> '4')) Then
                                Begin
                                  if (licodportforma_novo < 308) or (licodportforma_novo > 310) then // Andre Imakawa - SIG 123059
                                    smsgerro:='Erro, Conta Salário não Cadastrada ...';  // SOL:111915 - Daniel Begnami
                                End;
                           end else begin
                             if (trim(lsBanco_novo) = '') Or(trim(lsAgencia_novo) = '') Or(trim(lsContaCorrente_novo) = '') then begin
                               smsgerro:='Erro, Conta Resgate não cadastrada ...';
                             end;
                           end;
                      End;

                  If smsgerro <> '' Then
                     Begin
                        If PegaDadosRecebedor(
                           qryProcesso.fieldbyname('IDTITULAR').asinteger,
                           qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger,
                           qryProcesso.fieldbyname('IDPLANOPREV').asinteger,
                           qryProcesso.fieldbyname('IDPLANOORIGEM').asinteger,
                           qryProcesso.fieldbyname('IDPESSJUR').asinteger) Then
                           Begin
                              frameProgresso.ExibeMensagem(smsgerro);
                              frameProgresso.ExibeMensagem('Acesse o Menu Cadastros / Contas Bancárias para corrigir.');
                              frameProgresso.ExibeMensagem('Matrícula Titular : ' + qryDadoReceb.fieldbyname('Matricula').AsString);
                              If qryDadoReceb.fieldbyname('MATDEP').AsString <> '' Then
                                 frameProgresso.ExibeMensagem('Matrícula  Benef. : ' + qryDadoReceb.fieldbyname('MATDEP').AsString);
                              frameProgresso.ExibeMensagem('Recebedor : ' + qryDadoReceb.fieldbyname('Nome').AsString);
                              frameProgresso.ExibeMensagem('Código Recebedor (idpessoa) : ' + qryProcesso.fieldbyname('IDRESPONSAVEL').AsString);
                              frameProgresso.ExibeMensagem('');
                              result := false;
                           End;
                     End;

                  //TRATA GRAVAÇÃO DA PRÉVIA CASO DE DOC'S INDIVIDUAIS-ELSE DO IF ABAIXO
                  If lbPagtoElet Then
                     Begin
                        //se ocorreu alteração dos dados bancários gravar na Prévia
                        If ((trim(lsBanco_novo) <> '') And
                           (trim(lsAgencia_novo) <> '') And
                           (trim(lsContaCorrente_novo) <> '') And
                           (ifavdoc_novo <> 0) And
                           (licodportforma_novo <> 0)) And
                           ((lsBanco_ini <> lsBanco_novo) Or
                           (lsAgencia_ini <> lsAgencia_novo) Or
                           (lsContaCorrente_ini <> lsContaCorrente_novo) Or
                           (ifavdoc_ini <> ifavdoc_novo) Or
                           (lsTipoConta <> lsTipoConta_ini) Or // Andre Imakawa - SIG 101624
                           (licodportforma_ini <> licodportforma_novo)) Or
                           (liseqdoc <> qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) Then
                           Begin
                              ssql :=
                                 'UPDATE PREVIA ' + _clinefeed +
                                 'SET CODPORTFORMA = ' + inttostr(licodportforma_novo) + ', ' + _clinefeed +
                                 '    IDFAVDOC = ' + inttostr(ifavdoc_novo) + ', ' + _clinefeed +
                                 '    NUMBANCO = ' + quotedstr(lsBanco_novo) + ', ' + _clinefeed +
                                 '    NUMAGENCIA = ' + quotedstr(lsAgencia_novo) + ', ' + _clinefeed +
                                 '    CONTACORRENTE = ' + quotedstr(lsContaCorrente_novo) + ', ' + _clinefeed +
                                 '    SEQDOCUMENTO = ' + inttostr(liseqdoc) + ', ' + _clinefeed +
                                 '    TIPOCONTA    = ' + lsTipoConta +  ' ' + _clinefeed +
                                 'WHERE IDLOTE = ' + inttostr(aiidlote) + ' ' + _clinefeed +
                                 'AND IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                                 'AND IDRESPONSAVEL = ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ' ' + _clinefeed;

                              ExecutarQuery(qryAux1, ssql);
                           End;
                     End
                  Else
                     Begin
                        If ((ifavdoc_novo <> 0) And
                           (licodportforma_novo <> 0)) And
                           ((ifavdoc_ini <> ifavdoc_novo) Or
                           (licodportforma_ini <> licodportforma_novo)) Then
                           Begin
                              ssql :=
                                 'UPDATE PREVIA SET ';
                              If (trim(lsBanco_novo) <> '') And
                                 (trim(lsAgencia_novo) <> '') And
                                 (trim(lsContaCorrente_novo) <> '') Then
                                 ssql := ssql +
                                    'NUMBANCO = ' + quotedstr(lsBanco_novo) + ', ' +
                                    'NUMAGENCIA = ' + quotedstr(lsAgencia_novo) + ', ' +
                                    'CONTACORRENTE = ' + quotedstr(lsContaCorrente_novo) + ', ';
                              ssql := ssql +
                                 'CODPORTFORMA = ' + inttostr(licodportforma_novo) + ', ' +
                                 'IDFAVDOC = ' + inttostr(ifavdoc_novo) + ' ' +
                                 'WHERE IDLOTE = ' + inttostr(aiidlote) + ' ' +
                                 'AND IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ' ' +
                                 'AND IDRESPONSAVEL = ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ' ';

                              ExecutarQuery(qryAux1, ssql);
                           End;
                     End;

                  frameProgresso.Passo;
                  qryProcesso.next;
               End;
         Finally
            frameProgresso.MarcaFinalFase('Conclusão da verificação das contas bancárias do lote.');
            frameProgresso.ResetaFrame(1, 0);
            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               frameProgresso.FazCommit(false);
         End;
      End;
End;

Function TfrmFolhaNormalEfet.ValidaParametrosCF(aiidlote: integer): boolean;
Var lstipodesc, lsplaconta,
   lsplacontaliq,
      lsmsg: String;
   regCF: tRegContFinan;
   ssql: String;

   Procedure VerificaIntegracao;
   Begin
      lsmsg := '';
      ObtemParametroCF(qryProcesso, regCF);
      lsmsg := '';
      dtmContabil.ValidaCF(
         qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger,
         (qryProcesso.fieldbyname('FLGTEMPROVISAO').asinteger = 1),
         regCF, lsmsg);

      //VALIDAR PARÂMETROS CONTÁBEIS
      If lsmsg <> '' Then
         Begin
            If (qryProcesso.fieldbyname('FLGTIPOFOLHA').asinteger = 1) Then
               Begin
                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring <> 'I') Then
                     Begin
                        If dtmContabil.ValidaFinanceiro(regCF) Then
                           Begin
                              If (qryProcesso.fieldbyname('FLGDESCONTO').asinteger = 0) Then
                                 Begin
                                    If regCF.PlaContaC <> '' Then
                                       lsmsg := '';
                                 End
                              Else
                                 Begin
                                    If regCF.PlaContaD <> '' Then
                                       lsmsg := '';
                                 End;
                           End;
                     End;
               End;
         End;
   End;

   Procedure GravaPessoas;
   Var ls: String;
   Begin
      If lsmsg <> '' Then
         Begin
            frameProgresso.ExibeMensagem('Erro na Integração Contábil/Financeira.');
            frameProgresso.ExibeMensagem('Cód.Int.Rubr.: ' +
               qryProcesso.fieldbyname('IDRUBRICA').asstring);
            frameProgresso.ExibeMensagem('Cód.Ext.Rubr.: ' +
               qryProcesso.fieldbyname('CODPROVDESC').asstring);
            frameProgresso.ExibeMensagem('Descrição Rubrica: ' +
               qryProcesso.fieldbyname('DESCRICAO').asstring);
            frameProgresso.ExibeMensagem('Quantidade de registros nesta condição: ' +
               qryProcesso.fieldbyname('TOTAL').asstring);
            frameProgresso.ExibeMensagem('Mês : ' +
               qryProcesso.fieldbyname('MES').asstring);
            frameProgresso.ExibeMensagem('Tipo rubrica : ' +
               qryProcesso.fieldbyname('FLGTIPODESC').asstring);
            frameProgresso.ExibeMensagem('Plano        : ' +
               qryProcesso.fieldbyname('IDPLANOPREV').asstring + '-' +
               qryProcesso.fieldbyname('NOMEPLANO').asstring);
            frameProgresso.ExibeMensagem('Patrocinadora: ' +
               qryProcesso.fieldbyname('IDPATRO').asstring + '-' +
               qryProcesso.fieldbyname('NOMEPATRO').asstring);
            If qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'B' Then
               frameProgresso.ExibeMensagem('Benefício    : ' +
                  qryProcesso.fieldbyname('IDBENEFICIO').asstring + '-' +
                  qryProcesso.fieldbyname('NOMEBEN').asstring);
            frameProgresso.ExibeMensagem('Erros : ' +
               copy(lsmsg, 1, length(lsmsg) - 1));
            ls := 'Dados - ';
            If Sistemafolha.FLGINTEGRACONTABIL = 1 Then
               Begin
                  ls := ls + 'Conta crédito=[' + regCF.PlaContaC + '] ' +
                     'Conta débito=[' + regCF.PlaContaD + '] ' +
                     'C. custo cred=[' + regCF.CentroCustoC + '] ' +
                     'C. custo deb=[' + regCF.CentroCustoD + '] ';
                  ls := ls + 'Tipo desembolso=[' + regCF.CodTipRecDes + '] ';
                  ls := ls + 'Centro resp.=[' + regCF.CentroRespon + '] ';
                  ls := ls + 'Unid Negoc.=[' + inttostr(regCF.UnidNegoc) + '] ';
                  ls := ls + 'Recpag=[' + regCF.RecPag + '] ';
                  ls := ls + 'Plano=[' + inttostr(regCF.Plano) + '] ';
                  frameProgresso.ExibeMensagem(ls);
                  frameProgresso.ExibeMensagem('');

                  ssql :=
                     'SELECT DISTINCT PRV.IDTITULAR, PRV.IDRESPONSAVEL, P.NOME, PRV.IDLOTE, ' + _clinefeed +
                     'ELP.MATRICULA, DEP.MATRICULA AS MATDEP, ' + _clinefeed +
                     'PPP.INSCRICAONUMERO ' + _clinefeed +
                     ', PRV.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
                     'FROM PREVIA PRV, PARTPREVPLAN PPP, ELEGPATRO ELP, DEPENTIT DEP, ' + _clinefeed +
                     'PESSOA P, CTRLINTERFACE CT ' + _clinefeed +
                     'WHERE (PRV.IDLOTE = ' + inttostr(aiidlote) + ') ' + _clinefeed +
                     'AND (PPP.IDPESSJUR = PRV.IDPATRO) ' + _clinefeed +
                     ' AND ((PPP.IDPLANOPREV = PRV.IDPLANOPREV AND PRV.IDTITULAR = PRV.IDPESSOA) ' + _clinefeed +
                     ' OR (PPP.IDPLANOPREV = PRV.IDPLANOORIGEM AND PRV.IDTITULAR <> PRV.IDPESSOA)) ' + _clinefeed +
                     'AND (PPP.IDPESSOA = PRV.IDTITULAR) ' + _clinefeed +
                     'AND (PPP.SEQPROPOSTA = PRV.SEQPROPOSTA) ' + _clinefeed +
                     'AND (ELP.IDPESSOA = PRV.IDTITULAR) ' + _clinefeed +
                     'AND (ELP.IDPESSJUR = PRV.IDPATRO) ' + _clinefeed +
                     'AND (DEP.IDTITULAR(+) = PRV.IDTITULAR) ' + _clinefeed +
                     'AND (DEP.IDPESSOA(+) = PRV.IDRESPONSAVEL) ' + _clinefeed +
                     'AND (P.IDPESSOA = PRV.IDRESPONSAVEL) ' + _clinefeed +
                     'AND (PRV.IDLOTE = CT.IDLOTE) ' + _clinefeed +
                     'AND (PRV.IDRUBRICA = ' + qryProcesso.fieldbyname('IDRUBRICA').asstring + ') ' + _clinefeed +
                     'AND (PRV.FLGTIPODESC = ' + quotedstr(qryProcesso.fieldbyname('FLGTIPODESC').asstring) + ') ' + _clinefeed +
                     'AND (PRV.MES = ' + quotedstr(qryProcesso.fieldbyname('MES').asstring) + ') ' + _clinefeed +
                     'AND (PRV.IDPLANOPREV = ' + qryProcesso.fieldbyname('IDPLANOPREV').asstring + ') ' + _clinefeed +
                     'AND (PRV.IDPATRO = ' + qryProcesso.fieldbyname('IDPATRO').asstring + ') ' + _clinefeed;

                  If (qryProcesso.fieldbyname('FLGTIPODESC').asstring = 'B') And
                     (qryProcesso.fieldbyname('IDBENEFICIO').asinteger > 0) Then
                     ssql := ssql +
                        'AND (PRV.IDBENEFICIO = ' + qryProcesso.fieldbyname('IDBENEFICIO').asstring + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('CODCENTROCUSTOC').isnull Then
                     ssql := ssql + 'AND (PRV.CODCENTROCUSTOC IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.CODCENTROCUSTOC = ' +
                        quotedstr(qryProcesso.fieldbyname('CODCENTROCUSTOC').asstring) + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('CODCENTROCUSTOD').isnull Then
                     ssql := ssql + 'AND (PRV.CODCENTROCUSTOD IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.CODCENTROCUSTOD = ' +
                        quotedstr(qryProcesso.fieldbyname('CODCENTROCUSTOD').asstring) + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('PLACONTAC').isnull Then
                     ssql := ssql + 'AND (PRV.PLACONTAC IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.PLACONTAC = ' +
                        quotedstr(qryProcesso.fieldbyname('PLACONTAC').asstring) + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('PLACONTAD').isnull Then
                     ssql := ssql + 'AND (PRV.PLACONTAD IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.PLACONTAD = ' +
                        quotedstr(qryProcesso.fieldbyname('PLACONTAD').asstring) + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('UNIDNEGOC').isnull Then
                     ssql := ssql + 'AND (PRV.UNIDNEGOC IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.UNIDNEGOC = ' +
                        qryProcesso.fieldbyname('UNIDNEGOC').asstring + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('CODCENTRORESPON').isnull Then
                     ssql := ssql + 'AND (PRV.CODCENTRORESPON IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.CODCENTRORESPON = ' +
                        quotedstr(qryProcesso.fieldbyname('CODCENTRORESPON').asstring) + ') ' + _clinefeed;

                  If qryProcesso.fieldbyname('CODTIPRECDES').isnull Then
                     ssql := ssql + 'AND (PRV.CODTIPRECDES IS NULL) ' + _clinefeed
                  Else
                     ssql := ssql + 'AND (PRV.CODTIPRECDES = ' +
                        quotedstr(qryProcesso.fieldbyname('CODTIPRECDES').asstring) + ') ' + _clinefeed;

                  ssql := ssql + 'ORDER BY DEP.MATRICULA, ELP.MATRICULA';

                  If FazQuery(qryAux1, ssql) Then
                     Begin
                        frameProgresso.ExibeMensagem(' Recebedores com rubrica na condição de erro apontada acima:');
                        frameProgresso.ExibeMensagem(' (Matricula Titular - Matricula Dependente - Inscrição - IdPessoa Recebedor - Nome Recebedor)');
                        While Not qryAux1.eof Do
                           Begin
                              frameProgresso.ExibeMensagem(' ' + qryAux1.fieldbyname('MATRICULA').asstring + ' - ' +
                                 qryAux1.fieldbyname('MATDEP').asstring + ' - ' +
                                 qryAux1.fieldbyname('INSCRICAONUMERO').asstring + ' - ' +
                                 qryAux1.fieldbyname('IDRESPONSAVEL').asstring + ' - ' +
                                 qryAux1.fieldbyname('NOME').AsString);
                              qryAux1.next;
                           End;
                     End;
                  frameProgresso.ExibeMensagem('');
               End;
         End;
   End;

Begin
   result := true;
   frameProgresso.MarcaInicioFase('Verificando integração contábil/financeira das rubricas.');

   sSQL := 'SELECT COUNT(*) AS TOTAL, PRV.IDPATRO, PRV.IDPLANOPREV, ' + _clinefeed +
      'PRV.IDPLANOCONTABIL, ' + _clinefeed +
      'PRV.IDBENEFICIO, BEN.NOME AS NOMEBEN, PRV.MES, PRV.FLGTIPODESC, ' + _clinefeed +
      'NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO, ' + _clinefeed +
      'PRV.IDRUBRICA, PD.CODPROVDESC, PRV.PLANO, PRV.IDEMPRESA, ' + _clinefeed +
      'PRV.CODCENTROCUSTOC, PRV.PLACONTAC, ' + _clinefeed +
      'PRV.CODCENTROCUSTOD, PRV.PLACONTAD, PRV.UNIDNEGOC, ' + _clinefeed +
      'PRV.CODCCUSTOCPROVIS, PRV.PLACONTACPROVIS, ' + _clinefeed +
      'PRV.CODCCUSTODPROVIS, PRV.PLACONTADPROVIS, ' + _clinefeed +
      'PRV.FLGTEMPROVISAO, ' + _clinefeed +
      '' + sCODCENTRORESPON + ' AS CODCENTRORESPON, PRV.CODTIPRECDES, ' + _clinefeed + //Renato Visoni SOL 107549 \ Kintana 483466
   'PRV.FLGPROVISORIO, PD.FLGDESCONTO, ' + _clinefeed +
      'NVL(CT.FLGTIPOFOLHA,0) FLGTIPOFOLHA, ' + _clinefeed +
      'PLA.NOME AS NOMEPLANO, PAT.NOME AS NOMEPATRO, ' + _clinefeed +
      'PRV.MESCOMPREEM  '  + _clinefeed + //SOL 140042 Kintana 900220
      'FROM PREVIA PRV, PROVDESC PD, CTRLINTERFACE CT, ' + _clinefeed +
      'PLANPREV PLA, PESSOA PAT, BENEFICIO BEN ' + _clinefeed +
      'WHERE (PRV.IDLOTE = ' + inttostr(aiidlote) + ') ' + _clinefeed +
      'AND (PRV.FLGPAGA = 1) ' + _clinefeed +
      'AND (PRV.FLGTIPODESC IN (''B'',''E'',''A'',''P'',''C'',' +
      '''I'',''Q'',''Y'',''T'',''R'')) ' + _clinefeed +
      'AND (PD.IDPROVENTO = PRV.IDRUBRICA) ' + _clinefeed +
      'AND (PRV.IDLOTE = CT.IDLOTE) ' + _clinefeed +
      'AND (PRV.IDPATRO = PAT.IDPESSOA) ' + _clinefeed +
      'AND (PRV.IDPLANOPREV = PLA.IDPLANOPREV) ' + _clinefeed +
      'AND (PRV.IDBENEFICIO = BEN.IDBENEFICIO(+)) ' + _clinefeed;

   ssql := ssql +
      'GROUP BY PRV.IDPATRO, PRV.IDPLANOPREV, CT.FLGTIPOFOLHA, ' + _clinefeed +
      'PRV.IDPLANOCONTABIL, ' + _clinefeed +
      'PRV.IDBENEFICIO, PRV.MES, PRV.FLGPROVISORIO, PD.FLGDESCONTO, ' + _clinefeed +
      'PRV.FLGTIPODESC, PRV.IDRUBRICA, PD.CODPROVDESC, PRV.PLANO, ' + _clinefeed +
      'PRV.IDEMPRESA, PRV.CODCENTROCUSTOC, PRV.PLACONTAC, ' + _clinefeed +
      'PRV.CODCENTROCUSTOD, PRV.PLACONTAD, PRV.UNIDNEGOC, ' + _clinefeed +
      'PRV.CODCCUSTOCPROVIS, PRV.PLACONTACPROVIS, ' + _clinefeed +
      'PRV.CODCCUSTODPROVIS, PRV.PLACONTADPROVIS, ' + _clinefeed +
      'PRV.FLGTEMPROVISAO, ' + _clinefeed +
      'PRV.CODTIPRECDES, ' + _clinefeed + // PRV.CODCENTRORESPON, Renato Visoni SOL 107549 \ Kintana 483466
      'NVL(PD.DESCRPROVDESC,PD.DESCRICAO), PLA.NOME, PAT.NOME, ben.NOME, ' + _clinefeed +
      'PRV.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
      'ORDER BY PRV.FLGTIPODESC, PD.CODPROVDESC, PRV.IDPLANOPREV, PRV.IDPATRO';

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               VerificaIntegracao;
               result := result And (lsmsg = '');
               GravaPessoas;

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End;

   frameProgresso.MarcaFinalFase('Conclusão da verificação da parametrização contábil/financeira do lote.');
   frameProgresso.ResetaFrame(1, 0);
End;

Function TfrmFolhaNormalEfet.VerificaPreviaProcessada(
   aiidlote: integer; asmesref: String): boolean;
Var ssql: String;
Begin
   result := true;

   //Verifica HSTBENEFBFCIARIO SEM PREVIA
   If (rdgProcessar.ItemIndex < 5) Then
      Begin
         frameProgresso.MarcaInicioFase('Identificando beneficiários com a Prévia não processada.');

         ssql := 'SELECT DISTINCT E.MATRICULA, P.NOME, G.IDTITULAR, G.IDPESSOA, G.IDLOTE ' + _clinefeed +
            'FROM (SELECT DISTINCT H.IDPESSJUR, H.IDTITULAR, H.IDPESSOA, H.IDLOTE ' + _clinefeed +
            'FROM HSTBENEFBFCIARIO H, BENEFPLANPREV BP ' + _clinefeed +
            'WHERE H.IDLOTE = ' + inttostr(aiidlote) + ' ' + _clinefeed +
            'AND H.MES = ' + QuotedStr(asmesref) + ' ' + _clinefeed +
            'AND BP.IDPLANOPREV = H.IDPLANOPREV ' + _clinefeed +
            'AND BP.IDBENEFICIO = H.IDBENEFICIO ' + _clinefeed +
            'AND (BP.FLGREFERENCIA = 0 OR BP.FLGPAGAINSS = 1) ' + _clinefeed +
            'AND (H.FLGDEVOLUCAO = 0 OR H.FLGDEVOLUCAO IS NULL) ' + _clinefeed +
            'AND H.FLGENVIADO = 0 ' + _clinefeed +
            'MINUS ' + _clinefeed +
            'SELECT DISTINCT P.IDPATRO, P.IDTITULAR, P.IDPESSOA, P.IDLOTE ' + _clinefeed +
            'FROM PREVIA P, PROVDESC V ' + _clinefeed +
            'WHERE P.IDLOTE = ' + inttostr(aiidlote) + ' ' + _clinefeed +
            'AND P.IDRUBRICA = V.IDPROVENTO ' + _clinefeed +
            'AND V.FLGDESCONTO = 0 ' + _clinefeed +
            'AND P.MESCOBRANCA = ' + QuotedStr(asmesref) + ') G, ELEGPATRO E, PESSOA P ' + _clinefeed +
            'WHERE G.IDTITULAR = E.IDPESSOA ' + _clinefeed +
            'AND G.IDPESSJUR = E.IDPESSJUR ' + _clinefeed +
            'AND G.IDPESSOA = P.IDPESSOA ' + _clinefeed +
            'ORDER BY E.MATRICULA, P.NOME ' + _clinefeed;

         If FazQuery(qryAux2, ssql) Then
            Begin
               frameProgresso.ExibeMensagem('Beneficiários com a Prévia não processada.');
               qryAux2.first;
               While Not qryAux2.eof Do
                  Begin
                     frameProgresso.ExibeMensagem('Lote:' + qryAux2.fieldbyname('idlote').asstring + ' - ' +
                        'Matr:' + qryAux2.fieldbyname('matricula').asstring + ' - ' +
                        'Recebedor:' + qryAux2.fieldbyname('nome').asstring);
                     qryAux2.next;
                  End;
               frameProgresso.ExibeMensagem('');
               frameProgresso.MarcaFinalFase('Deve-se executar a Prévia completa dos lotes ' +
                  'identificados para poder verificar/efetivar estes lotes.');
               result := false;
            End
         Else
            frameProgresso.MarcaFinalFase('Nenhum beneficiário encontrado sem Prévia processada.');
         frameProgresso.ResetaFrame(1, 0);
      End;
End;

Procedure TfrmFolhaNormalEfet.GravaCtrlinterface(aslotes: String);
Var ssql: String;
Begin
   frameProgresso.ExibeMensagem('Fechamento dos lotes.');
   ssql := 'UPDATE CTRLINTERFACE ' +
      'SET FLGVOLTATMP = 1,' +
      '    DATAVOLTATMP = TO_DATE(' + QuotedStr(sDtEfetivacao) + ',''DD/MM/YYYY'')' +
      'WHERE IDLOTE ' + aslotes;
   ExecutarQuery(qryAux2, ssql);
End;

Procedure TfrmFolhaNormalEfet.GravaHstFolhaBenef(aiidhistorico: integer;
   ashistorico: String; aitipofolha, aistatus,
   aiplncodigo, aiplnprovisaoabono: integer; arliquidototal: real);
Var ssql: String;
Begin
   //testa existência deste historico
   If FazQuery(qryAux2, 'SELECT IDHSTFOLHABENEF ' +
      'FROM HSTFOLHABENEF ' +
      'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidhistorico)) Then
      Begin
         ssql :=
            'UPDATE HSTFOLHABENEF ' +
            'SET FLGESTADO = ' + inttostr(aistatus) + ', ' +
            'VALORLIQTOTAL = ' + oranumero(floattostr(arliquidototal)) + ' ';

         //SÓ GRAVA PLNCODIGO SE FOR MAIOR DO QUE ZERO
         If aiplncodigo > 0 Then
            ssql := ssql +
               ', PLNCODIGO = ' + inttostr(aiplncodigo) + ' ';

         //PLANILHA DE PROVISÃO DE ABONO
         If aiplnprovisaoabono > 0 Then
            ssql := ssql +
               ', PLNPROVISABONO = ' + inttostr(aiplnprovisaoabono) + ' ';

         ssql := ssql +
            'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidhistorico);
      End
   Else
      Begin
         ssql := 'INSERT INTO HSTFOLHABENEF (' +
            'IDHSTFOLHABENEF, DATAEFETIVACAO, ' +
            'DATACONTABIL, DATAVENCIMENTO, ' +
            'DATAPREVPAGTO, VALORLIQTOTAL, ' +
            'HISTORICO, MESREFERENCIA, FLGTIPOFOLHA, FLGESTADO, IDFUNDACAO) ' +
            'VALUES (' + inttostr(aiidhistorico) + ', ' +
            'to_date(' + quotedstr(sDtEfetivacao) + ',''dd/mm/yyyy''), ' + //Renato Visoni dtpDtEfetivacao.Text Sol 108334 / Kintana 488340
         'to_date(' + quotedstr(sDtContabilizacao) + ',''dd/mm/yyyy''), ' + //Renato Visoni dtpDtContabilizacao.text Sol 108334 / Kintana 488340
         'to_date(' + quotedstr(sDtVencimento) + ',''dd/mm/yyyy''), ' + // Renato Visoni dptDtVencimento.text Sol 108334 / Kintana 488340
         'to_date(' + quotedstr(sDtProgramada) + ',''dd/mm/yyyy'')' + ', ' + //Renato Visoni dptDtProgramada.text Sol 108334 / Kintana 488340
         'null,' +
            quotedstr(copy(ashistorico, 1, 50)) + ', ' +
            quotedstr(MesPagamento) + ', ' +
            inttostr(aitipofolha) + ', ' +
            inttostr(aistatus) + ', ' +
            inttostr(iidfundacao) + ')';
      End;
   ExecutarQuery(qryAux2, ssql);
End;

Procedure TfrmFolhaNormalEfet.GravaHstFolhaBenefCAP(aiidhistorico: integer;
   aicoddocumento: double;
   aiseqdocumento,
   ainumregistros,
   aicodportforma,
   aiplncodigo,
   aidfloatpagto,
   aidfloatpagtoAlter,
   aidfavdoc,
   piDFloatProg: integer;
   arvalordoc: real;
   asnometxt,
   astipoportador: String);
Var ssql: String;
   idhstfolhabenefcap: integer;
   {sTipoPortador = 'A' - ARQUIVO ELETRONIVO
                    'P' - PATROCINADORA
                    'O' - OUTROS (INDIVIDUAIS)}
Begin
   //testa existência deste historico
   ssql := 'SELECT IDHSTFOLHABENEFCAP ' + #13 +
      'FROM HSTFOLHABENEFCAP ' + #13 +
      'WHERE IDHSTFOLHABENEF = ' + IntToStr(aiidhistorico) + ' ' + _clinefeed +
      '  AND CODPORTFORMA    = ' + IntToStr(aicodportforma) + ' ' + _clinefeed +
      '  AND IDFAVDOC        = ' + IntToStr(aidfavdoc) + ' ' + _clinefeed +
      'AND TIPOPORTADOR = ' + quotedstr(astipoportador) + ' ';

   If (aiseqdocumento > 0) Then
      ssql := ssql + '  AND SEQDOCUMENTO    = ' + IntToStr(aiseqdocumento) + ' ';

   If FazQuery(qryAux2, ssql) Then
      Begin
         ssql := '';

         If aiplncodigo > 0 Then
            Begin
               If ssql <> '' Then
                  ssql := ssql + ', ' + _clinefeed;

               ssql := ssql + '    PLNCODIGO = ' + inttostr(aiplncodigo);
            End;

         If asnometxt <> '' Then
            Begin
               If ssql <> '' Then
                  ssql := ssql + ', ' + _clinefeed;

               ssql := ssql + '    NOMETXT = ' + quotedstr(asnometxt);
            End;

         If ainumregistros > 0 Then
            Begin
               If ssql <> '' Then
                  ssql := ssql + ', ' + _clinefeed;
               ssql := ssql +
                  '    NUMREGISTROS = ' + inttostr(ainumregistros);
            End;
         If aicoddocumento > 0 Then
            Begin
               If ssql <> '' Then
                  ssql := ssql + ', ' + _clinefeed;
               ssql := ssql + '    CODDOCUMENTO = ' + floattostr(aicoddocumento);
            End;
         If arvalordoc > 0 Then
            Begin
               If ssql <> '' Then
                  ssql := ssql + ', ' + _clinefeed;
               ssql := ssql + '    VALORDOC = ' + oranumero(floattostr(arvalordoc));
            End;

         If ssql <> '' Then
            Begin
               ssql := 'UPDATE HSTFOLHABENEFCAP SET ' + _clinefeed +
                  ssql + ' ' + _clinefeed +
                  'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ';

               If (aiseqdocumento > 0) Then
                  ssql := ssql + '  AND IDHSTFOLHABENEFCAP = ' + inttostr(qryAux2.fieldbyname('IDHSTFOLHABENEFCAP').asinteger)
               Else
                  ssql := ssql + '  AND CODPORTFORMA       = ' + inttostr(aicodportforma) + ' ' +
                     '  AND IDFAVDOC = ' + inttostr(aidfavdoc) + ' ' +
                     '  AND TIPOPORTADOR = ' + quotedstr(astipoportador) + ' ';
            End;
      End
   Else
      Begin
         idhstfolhabenefcap := LeUltRegistro(Nil, 'HSTFOLHABENEFCAP');
         ssql := 'INSERT INTO HSTFOLHABENEFCAP (' +
            '  IDHSTFOLHABENEF, IDHSTFOLHABENEFCAP, CODPORTFORMA, TIPOPORTADOR, ' +
            '  SEQDOCUMENTO, ' +
            'DFLOATPAGTO, IDFAVDOC, DFLOATPROG, DFLOATPAGTOALTER) ' +
            'VALUES (' + inttostr(aiidhistorico) + ', ' + inttostr(idhstfolhabenefcap) + ', ' +
            inttostr(aicodportforma) + ', ' +
            quotedstr(astipoportador) + ', ' +
            inttostr(aiseqdocumento) + ', ' +
            inttostr(aidfloatpagto) + ', ' +
            inttostr(aidfavdoc) + ', ' +
            inttostr(piDFloatProg) + ',' +
            inttostr(aidfloatpagtoalter) + ')';
      End;
   If ssql <> '' Then
      ExecutarQuery(qryAux2, ssql);
End;

Procedure TfrmFolhaNormalEfet.GeraLoteXHstFolhabenef(aiIdHstFolhaBenef: integer;
   aslotes: String);
Var ssql: String;
Begin
   ssql := 'INSERT INTO LOTEXHSTFOLHABENEF ' +
      '(IDHSTFOLHABENEF, IDLOTE, FLGTIPOLOTE) ' +
      'SELECT DISTINCT ' + inttostr(aiIdHstFolhaBenef) + ' AS IDHSTFOLHABENEF, IDLOTE, ''B'' AS TIPO ' +
      'FROM CTRLINTERFACE ' +
      'WHERE IDLOTE ' + aslotes + ' ';

   ExecutarQuery(qryAux2, ssql);

   ssql := 'INSERT INTO LOTEXHSTFOLHABENEF ' +
      '(IDHSTFOLHABENEF, IDLOTE, FLGTIPOLOTE) ' +
      'SELECT DISTINCT ' + inttostr(aiIdHstFolhaBenef) + ' AS IDHSTFOLHABENEF, IDLOTE, FLGTIPODESC ' +
      'FROM TMPDESC T ' +
      'WHERE T.MESCOBRANCA = ' + QuotedStr(MesPagamento) + ' ' +
      'AND T.LOTEPREVIA ' + aslotes + ' ' +
      'AND T.FLGDESCFOLHA = ''B'' ' +
      'AND NOT EXISTS (SELECT 1 ' +
      'FROM LOTEXHSTFOLHABENEF L ' +
      'WHERE L.IDLOTE = T.IDLOTE ' +
      'AND L.IDHSTFOLHABENEF = ' + inttostr(aiIdHstFolhaBenef) + ')';

   ExecutarQuery(qryAux2, ssql);
End;

Procedure TfrmFolhaNormalEfet.ProcessaFaseHistrubsal(aslotes: String;
   aiidhistorico: integer);
Var sagencia, ssql, scampos, svalores: String;
   lii: integer;
   linumreg: integer;
   iDFLOATPROG: Integer;
   sIdInforme: string;//SOL 269049 PPM 1287659
   query:TwwQuery;//SOL205224 douglas.siqueira
   sStatus, sMensagem: string; // Andre Imakawa - SIG 78705
   bProcessaETL: Boolean;
Begin

query := TwwQuery.Create(Application);//SOL205224 douglas.siqueira
query.DataBaseName := 'BaseDados';//SOL205224 douglas.siqueira


   If FazQuery(qryAux2,
      'SELECT COUNT(*) ' +
      'FROM HISTRUBSAL ' +
      'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidhistorico)) Then
      Begin
         linumreg := qryAux2.fields[0].asinteger;
      End
   Else
      linumreg := 0;

   sCampos :=
      'IDHSTFOLHABENEF, MESCOBRANCA,      MES,               DATAPAGAMENTO,   IDMOTIVO,        ' + _clinefeed +
      'IDPESSJUR,       IDPATRO,          IDPLANOPREV,       IDPLANOORIGEM,   IDPLANOCONTABIL, ' + _clinefeed +
      'CODPORTFORMA,    NUMBANCO,         NUMAGENCIA,        CONTACORRENTE,   IDTITULAR,       ' + _clinefeed +
      'IDRESPONSAVEL,   IDPESSOA,         IDFAVORECIDO,      SEQRUBRICA,      IDRUBRICA,       ' + _clinefeed +
      'CODPROVDESC,     IDINFORME,        CODIRRFDARF,       FLGTIPODESC,     VALORPROVENTO,   ' + _clinefeed +
      'VALORCOTAS,      VALORINFO,        VALORRECEBIDO,     REFERENCIA,      CODMOEDA,        ' + _clinefeed +
      'IDREGRACALCULO,  FLGCOMPOESALPART, FLGCOMPOESALBENEF, FLGIRRF,         FLGSRB,          ' + _clinefeed +
      'FONTEPAGADORA,   FLGCONCESSAO,     IDMODULO,          FLGPENSAOALIM,   FLGESTORNO,      ' + _clinefeed +
      'FLGISENTOIRRF,   FLGIRRFTOTAL,     FLGMOLESTIAGRAVE,  NUMDEPIRRF,      NUMDEPSF,        ' + _clinefeed +
      'PARCELAS,        PLANO,            PLACONTAC,         PLACONTAD,       ' + _clinefeed +
      'CODCENTROCUSTOC, CODCENTROCUSTOD,  UNIDNEGOC,         CODCENTRORESPON, CODTIPRECDES,    ' + _clinefeed +
      'IDCBANCARIA, ' + _clinefeed +
      'IDPROCJUD, ' + _clinefeed +
      'NUMEROPROCESSO,  NUMPROCINSS,      FLGDESCONTO,       FLGESPECIAL,     LOTEORIGINAL,    ' + _clinefeed +
      'ORDEM,           SEQORIGINAL, ' + _clinefeed +
      'IDRECEBEPGTO, ' + _clinefeed +
      'IDBENEFICIO, ' + _clinefeed + //Renato Visoni SOL 107088 Kintana 507022
      'NUMDOCUMENTO, ' + _clinefeed+ //Luis Dornellas SOL 121617 Kintana
      'MESCOMPREEM, ' + _clinefeed + // SOL 140042 Kintana 900220
      'IDFAVDOC, ' + _clinefeed + // Andre Imakawa - SIG 29797
      'RELACAODEPEN, ' + _clinefeed + // Rodrigo Ramos - SIG 35762 - 21/08/2017
      'IDPERFILINVEST' + _clinefeed + //Peterson Victor - SIG56702
      ',TIPOCONTA' + _clinefeed ;      //Andre Imakawa - SIG 60540
   //DETERMINA QUANTIDADE DE REGISTROS gravados para continuar do ponto que parou anteriormente
   ssql :=
      'SELECT COUNT(*) ' + _clinefeed +
      'FROM PREVIA PRV, PROVDESC PD, PESSOA P, CTRLINTERFACE CT ' + _clinefeed + //Andre Imakawa - SIG 79100
      'WHERE (PRV.IDLOTE ' + aslotes + ') ' + _clinefeed +
      'AND (PD.IDPROVENTO = PRV.IDRUBRICA) ' + _clinefeed +
      'AND (PRV.IDLOTE = CT.IDLOTE) ' + _clinefeed +
      'AND (PRV.IDRESPONSAVEL = P.IDPESSOA)' + _clinefeed; //Andre Imakawa - SIG 79100

   If FazQuery(qryProcesso, ssql) Then
      Begin
         If qryProcesso.fields[0].asinteger = 0 Then
            Begin
               frameProgresso.ExibeMensagem('Nenhum registro a processar. Verificar a Prévia deste lote.');
               frameProgresso.ExibeMensagem('');
               ProcessamentoOK := false;
               exit;
            End;
      End;

   frameProgresso.MarcaInicioFase('Gravação do Histórico de Pagamento.');
   frameProgresso.ResetaFrame(1, qryProcesso.fields[0].asinteger);

   ssql :=
      'SELECT ' + _clinefeed +
      'PRV.MESCOBRANCA,      PRV.MES,               PRV.DATAPAGAMENTO,   PRV.IDMOTIVO,        PRV.IDPESSJUR,      ' + _clinefeed +
      'PRV.IDPATRO,          PRV.IDPLANOPREV,       PRV.CODPORTFORMA,   ' + _clinefeed +
      'NVL(PRV.IDPLANOORIGEM, PRV.IDPLANOPREV) AS IDPLANOORIGEM, ' + _clinefeed +
      'NVL(PRV.IDPLANOCONTABIL, PRV.IDPLANOPREV) AS IDPLANOCONTABIL, ' + _clinefeed +
      'PRV.NUMBANCO,         PRV.NUMAGENCIA,        PRV.CONTACORRENTE,   PRV.IDTITULAR,       PRV.IDRESPONSAVEL,  ' + _clinefeed +
      'PRV.IDPESSOA,         PRV.IDFAVORECIDO,      PRV.SEQRUBRICA,      PRV.IDRUBRICA, ' + _clinefeed +
      'NVL(PRV.CODPROVDESC, PD.CODPROVDESC) AS CODPROVDESC, ' + _clinefeed +
      //'PD.IDINFORME,PD.IDINFORMEREG,         PRV.CODIRRFDARF,  PRV.FLGTIPODESC,     PRV.VALORPROVENTO,   PRV.VALORCOTAS,     ' + _clinefeed +        //MARCIO DENILSON SOL 151061 KINTANA 1105188 //SIG49055
      'PRV.IDINFORME,         PRV.CODIRRFDARF,  PRV.FLGTIPODESC,     PRV.VALORPROVENTO,   PRV.VALORCOTAS,     ' + _clinefeed +        //MARCIO DENILSON SOL 151061 KINTANA 1105188 //SIG49055
      'PRV.VALORINFO,        PRV.VALORRECEBIDO,     PRV.REFERENCIA,      PRV.CODMOEDA,        PRV.IDREGRACALCULO, ' + _clinefeed +
      'PRV.FLGCOMPOESALPART, PRV.FLGCOMPOESALBENEF, PRV.FLGIRRF,         PRV.FLGSRB,          PRV.FONTEPAGADORA,  ' + _clinefeed +
      'PRV.FLGCONCESSAO,     PRV.IDMODULO,          PRV.FLGPENSAOALIM, prv.IDRESPONNAOREC, ' + _clinefeed +
      'NVL(PF.FLGISENTOIRRF,0) AS FLGISENTOIRRF, ' + _clinefeed +
      'NVL(PF.FLGSOMAIRSUPINSS,0) AS FLGIRRFTOTAL, ' + _clinefeed +
      'NVL(PF.FLGMOLESTIAGRAVE,0) AS FLGMOLESTIAGRAVE, ' + _clinefeed +
      'NVL(PF.NUMDEPIRRF,0) AS NUMDEPIRRF, ' + _clinefeed +
      'NVL(PF.NUMDEPSALF,0) AS NUMDEPSF, ' + _clinefeed +
      'NVL(PRV.DFLOATPAGTO,0) AS DFLOATPAGTO, ' + _clinefeed +
      'PRV.PARCELAS, NVL(CT.FLGTIPOFOLHA,0) FLGTIPOFOLHA, ' + _clinefeed +
      'PRV.PLANO,            PRV.PLACONTAC,         PRV.PLACONTAD,       PRV.CODCENTROCUSTOC, PRV.CODCENTROCUSTOD, ' + _clinefeed +
      'PRV.UNIDNEGOC,(SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM=''CODCENTRORESPON'') AS CODCENTRORESPON,   PRV.CODTIPRECDES,    PRV.NUMEROPROCESSO,  PRV.NUMPROCINSS,     ' + _clinefeed + // Renato Visoni SOL 107549 \ Kintana 483466
   'PRV.IDPROCJUD, ' + _clinefeed +
      'NVL(PRV.FLGDESCONTO, PD.FLGDESCONTO) FLGDESCONTO, ' + _clinefeed +
      'NVL(PRV.FLGESPECIAL, PD.FLGESPECIAL) FLGESPECIAL, ' + _clinefeed +
      'PRV.LOTEORIGINAL,    PRV.ORDEM,           PRV.IDFAVDOC, ' + _clinefeed +
      'PRV.IDSEQINTERNOFB,   PRV.SEQDOCUMENTO, ' + _clinefeed +
      'PRV.IDRECEBEPGTO, ' + _clinefeed +

   'PRV.IDBENEFICIO, ' + _clinefeed + //Renato Visoni SOL 107088 Kintana 507022
   'PRV.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
   ',PRV.RELACAODEPEN '  + _clinefeed + //Rodrigo Ramos SIG 35762 - 21/08/2017
   ',PRV.IDPERFILINVEST '  + _clinefeed + //Peterson Victor SIG56702
   ',NVL(PRV.TIPOCONTA,1) AS TIPOCONTA '  + _clinefeed +//Andre Imakawa - SIG 60540 //Andre Imakawa - SIG101624
   'FROM PREVIA PRV, PROVDESC PD, PESSOAFISICA PF, CTRLINTERFACE CT ' + _clinefeed +
      'WHERE (PRV.IDLOTE ' + aslotes + ') ' + _clinefeed +
      'AND (PRV.IDLOTE = CT.IDLOTE) ' + _clinefeed +
      'AND (PD.IDPROVENTO = PRV.IDRUBRICA) ' + _clinefeed +
      'AND (PRV.IDRESPONSAVEL = PF.IDPESSOA(+)) ' + _clinefeed +   // Andre Imakawa - SIG 79100 - ADD Left Join
      'ORDER BY PRV.CODPORTFORMA, PRV.IDFAVDOC, PRV.SEQDOCUMENTO, PRV.IDPATRO, ' + _clinefeed +
      '         PRV.IDPLANOPREV, PRV.IDTITULAR, PRV.IDRESPONSAVEL, PRV.SEQRUBRICA ' + _clinefeed;

   qryProcesso.Close;
   //Evitar estouro da BDE
   qryProcesso.UniDirectional := true;

   If FazQuery(qryProcesso, ssql) Then
      Begin
         Try
            If linumreg > 0 Then
               Begin
                  PulaRegistros(qryProcesso, linumreg);
                  frameProgresso.BarraProgresso.position := linumreg;
               End;

            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.starttransaction;

            GravaHstFolhaBenef(aiidhistorico, Historico,
               qryProcesso.fieldbyname('FLGTIPOFOLHA').asinteger, _GeraHistrubsal,
               liplncodigo, liplnprovisaoabono, 0);

            GeraLoteXHstFolhabenef(aiidhistorico, aslotes);

            GravaCtrlinterface(aslotes);

            //INCLUSÃO DE CONTROLE DE DOCUMENTOS INDIVIDUAIS SEM ARQUIVO ELETRONICO
            If rgEletronico.itemindex = 0 Then
               Begin
                  //IDENTIFICA DOCUMENTOS A GRAVAR NA HSTFOLHABENEFCAP
                  ssql := 'SELECT CODPORTFORMA, IDFAVDOC, IDRECEBEPGTO, ' + _clinefeed +
                     '       MAX(DFLOATPAGTO) AS DFLOATPAGTO, ' + _clinefeed +
                     '       MAX(DFLOATPAGTOALTER) AS DFLOATPAGTOALTER, ' + _clinefeed +
                     '       SEQDOCUMENTO, TIPOPORTADOR, ' + _clinefeed +
                     '       MAX(DFLOATPROG) AS DFLOATPROG, ' + _clinefeed +
                     '       MAX(DFLOATPROGALTER) AS DFLOATPROGALTER ' + _clinefeed +
                     'FROM ( ' + _clinefeed +
                     '  SELECT PRV.CODPORTFORMA, PRV.IDFAVDOC, PRV.IDRECEBEPGTO, ' + _clinefeed +
                     '         NVL(BP.DFLOATPAGTO,0) AS DFLOATPAGTO, ' + _clinefeed +
                     '         NVL(BP.DFLOATPAGTOALTER,0) AS DFLOATPAGTOALTER, ' + _clinefeed +
                     '         PRV.SEQDOCUMENTO, ' + _clinefeed +
                     //DECODE PARA PEGAR CORRETAMENTE O TIPOPORTADOR DE PATROCINADORA
                  '         DECODE(BP.CODPORTFORMA,' + _clinefeed +
                     '                NULL,DECODE(PRV.IDFAVDOC,PRV.IDPATRO,''P'',''O''), ' + _clinefeed +
                     '                ''A'') AS TIPOPORTADOR, ' + _clinefeed +
                     '         NVL(BP.DFLOATPROG,0) AS DFLOATPROG, ' + _clinefeed +
                     '         NVL(BP.DFLOATPROGALTER,0) AS DFLOATPROGALTER, ' + _clinefeed +
                     '       PRV.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
                     '  FROM PREVIA PRV, BANCOPORTFORMA BP ' + _clinefeed +
//                     '  WHERE IDLOTE ' + aslotes + ' ' + _clinefeed +   //Everson TIBERO
                     '  WHERE PRV.IDLOTE ' + aslotes + ' ' + _clinefeed + //Everson TIBERO
                     '  AND BP.CODPORTFORMA(+) = PRV.CODPORTFORMA ' + _clinefeed +
                     '  AND BP.IDMODULO(+) = 18 ' + _clinefeed +
                     ') ' + _clinefeed +
                     'GROUP BY CODPORTFORMA, IDFAVDOC, IDRECEBEPGTO, ' + _clinefeed +
                     '         SEQDOCUMENTO, TIPOPORTADOR ' + _clinefeed

               End
            Else
               Begin
                  ssql := 'SELECT DISTINCT ' + _clinefeed +
                     inttostr(qryPortadorForma1.fieldbyname('CODPORTFORMA').asinteger) + _clinefeed +
                     //CPrev - 26576 - Inicio
               //' AS CODPORTFORMA, PRV.IDRESPONSAVEL AS IDFAVDOC,  PRV.IDRECEBEPGTO, ' + _clinefeed+
                  ' AS CODPORTFORMA, NVL(PRV.IDRECEBEPGTO, PRV.IDRESPONSAVEL) AS IDFAVDOC,  PRV.IDRECEBEPGTO, ' + _clinefeed +
                     //CPrev - 26576 - Fim
                  '       0 AS DFLOATPAGTO, ' + _clinefeed +
                     '       0 AS DFLOATPAGTOALTER, ' + _clinefeed +
                     '       1 AS SEQDOCUMENTO, ' + _clinefeed +
                     '       ''O'' AS TIPOPORTADOR, ' + _clinefeed +
                     '       0 AS DFLOATPROG, ' + _clinefeed +
                     '       0 AS DFLOATPROGALTER ' + _clinefeed +
                     'FROM PREVIA PRV ' + _clinefeed +
                     'WHERE IDLOTE ' + aslotes + ' ' + _clinefeed;
               End;

            If FazQuery(qryAux1, ssql) Then
               Begin
                  While Not qryAux1.eof Do
                     Begin
                        If qryAux1.fieldbyname('SEQDOCUMENTO').AsInteger = 1 Then
                           iDFLOATPROG := qryAux1.fieldbyname('DFLOATPROG').AsInteger
                        Else
                           iDFLOATPROG := qryAux1.fieldbyname('DFLOATPROGALTER').AsInteger;

                        GravaHstFolhaBenefCAP(aiidhistorico,
                           0,
                           qryAux1.fieldbyname('SEQDOCUMENTO').asinteger,
                           0, qryAux1.fieldbyname('CODPORTFORMA').asinteger,
                           0,
                           qryAux1.fieldbyname('DFLOATPAGTO').asinteger,
                           qryAux1.fieldbyname('DFLOATPAGTOALTER').asinteger,
                           qryAux1.fieldbyname('IDFAVDOC').asinteger,
                           iDFLOATPROG,
                           0, '', qryAux1.fieldbyname('TIPOPORTADOR').asstring);

                        qryaux1.next;
                     End;
               End;

               
           bProcessaETL := False;

           if rgOpcaoSelecao.ItemIndex = 0 then
           begin
             if rdgProcessar.ItemIndex in [0,1,2] then
               bProcessaETL := True;
           end
           else
             if (qrylista.FieldByName('FLGTIPOFOLHA').AsInteger = 0) AND NOT(VerificaResgate(aiidhistorico)) then // Andre Imakawa - SIG 84679
               bProcessaETL := True;

           if bProcessaETL then
           begin
              Monitoramento('EFETIVACAO - ETL HISTRUBSAL',0); // Andre Imakawa - SIG 83524
              sStatus := 'I';
              sMensagem := '';
              // Andre Imakawa - 78705 - Inicio
              Executa_ETL(aslotes, aiidhistorico, dataspagto[0], dataspagto[1], dataspagto[2],
                          rgEletronico.itemindex, qryPortadorForma1.fieldbyname('CODPORTFORMA').asinteger,
                          SistemaFolha.FundacaoCorrente, 1, sStatus);

              if (UpperCase(sStatus) = 'F') then
              Begin
                 frameProgresso.ExibeMensagem('Erro inclusão da rubrica na Histrubsal.');
                 ProcessamentoOK := false;
                 Monitoramento('EFETIVACAO - ETL HISTRUBSAL',2, 'VERIFICAR ROTINA ETL'); // Andre Imakawa - SIG 83524
                 exit;
              End; 
              Monitoramento('EFETIVACAO - ETL HISTRUBSAL',1);  // Andre Imakawa - SIG 83524
           end
           else
           begin

              While Not qryProcesso.eof Do
                 Begin
                    sagencia := qryProcesso.fieldbyname('NUMAGENCIA').AsString;
                    For lii := 1 To length(sAgencia) Do
                       If sagencia[lii] = '&' Then
                          sagencia[lii] := ' ';
                    Repeat
                       lii := pos('-', sagencia);
                       If lii > 0 Then
                          system.delete(sagencia, lii, 1)
                       Else
                          break;
                    Until false;

                    svalores :=
                       inttostr(aiidhistorico) + ', ' + //IDHSTFOLHABENEF,
                    QuotedStr(qryProcesso.fieldbyname('MESCOBRANCA').AsString) + ', ' + //MESCOBRANCA,
                    QuotedStr(qryProcesso.fieldbyname('MES').AsString) + ', ' + //MES,
                    'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dataspagto[qryProcesso.fieldbyname('DFLOATPAGTO').asinteger])) + ',''DD/MM/YYYY''), ' + //DATAPAGAMENTO,
                    inttostr(qryProcesso.fieldbyname('IDMOTIVO').asinteger) + ', ' + //IDMOTIVO,
                    inttostr(qryProcesso.fieldbyname('IDPESSJUR').asinteger) + ', ' + //IDPESSJUR,
                    inttostr(qryProcesso.fieldbyname('IDPATRO').asinteger) + ', ' + //IDPATRO,
                    inttostr(qryProcesso.fieldbyname('IDPLANOPREV').asinteger) + ', ' + //IDPLANOPREV,
                    inttostr(qryProcesso.fieldbyname('IDPLANOORIGEM').asinteger) + ', ' + //IDPLANOORIGEM,
                    inttostr(qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger) + ', '; //IDPLANOCONTABIL,

                    If rgEletronico.itemindex = 0 Then
                       svalores := svalores +
                          inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ', ' //CODPORTFORMA,
                    Else
                       svalores := svalores +
                          inttostr(qryPortadorForma1.fieldbyname('CODPORTFORMA').asinteger) + ', ';
                    svalores := svalores +
                       QuotedStr(qryProcesso.fieldbyname('NUMBANCO').AsString) + ', ' + //NUMBANCO,
                    QuotedStr(sagencia) + ', ' + //NUMAGENCIA,
                    QuotedStr(qryProcesso.fieldbyname('CONTACORRENTE').AsString) + ', ' + //CONTACORRENTE,
                    inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ', ' + //IDTITULAR,
                    inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ', ' + //IDRESPONSAVEL,
                    inttostr(qryProcesso.fieldbyname('IDPESSOA').asinteger) + ', '; //IDPESSOA,

                    If qryProcesso.fieldbyname('IDFAVORECIDO').asinteger <> 0 Then
                       svalores := svalores +
                          inttostr(qryProcesso.fieldbyname('IDFAVORECIDO').asinteger) + ', ' //IDFAVORECIDO,
                    Else
                       svalores := svalores + 'NULL, ';

                    svalores := svalores +
                       inttostr(qryProcesso.fieldbyname('SEQRUBRICA').asinteger) + ', ' + //SEQRUBRICA,
                    inttostr(qryProcesso.fieldbyname('IDRUBRICA').asinteger) + ', '; //IDRUBRICA,

                    If trim(qryProcesso.fieldbyname('CODPROVDESC').asString) <> '' Then
                       svalores := svalores +
                          QuotedStr(qryProcesso.fieldbyname('CODPROVDESC').asString) + ', ' //CODPROVDESC,
                    Else
                       svalores := svalores +
                          QuotedStr(qryProcesso.fieldbyname('IDRUBRICA').asstring) + ', '; //CODPROVDESC,



                    //MARCIO DENILSON SOL 151061 KINTANA 1105188 //SOL 269049 PPM 1287659 comentado
                    //IF VerificaTipoOpcaoIRREG(qryProcesso.fieldbyname('IDPESSJUR').asinteger,qryProcesso.fieldbyname('IDPLANOPREV').asinteger,qryProcesso.fieldbyname('IDTITULAR').asinteger) then ///verifica se tipoopcao é  = 2 //Higor Nayde Ferreira SOL 259740 PPM 761404 //SOL 261754 PPM 1072844
                    //begin
                    //
                    //  If qryProcesso.fieldbyname('IDINFORMEREG').isnull Then
                    //     svalores := svalores + 'NULL, '
                    //  Else
                    //     svalores := svalores + inttostr(qryProcesso.fieldbyname('IDINFORMEREG').asinteger) + ', '; //IDINFORME,
                    //end
                    //else
                    //begin
                    //   If qryProcesso.fieldbyname('IDINFORME').isnull Then
                    //      svalores := svalores + 'NULL, '
                    //   Else
                    //      svalores := svalores + inttostr(qryProcesso.fieldbyname('IDINFORME').asinteger) + ', '; //IDINFORME,
                    //end;
                    //MARCIO DENILSON SOL 151061 KINTANA 1105188 - fim // SOL 269049 PPM 1287659 fim comentario
                    //sIdInforme := RetornaInformeTipoOpcaoIR(qryProcesso.fieldbyname('IDPATRO').asinteger,qryProcesso.fieldbyname('IDPLANOPREV').asinteger,qryProcesso.fieldbyname('IDTITULAR').asinteger, qryProcesso.fieldbyname('IDRUBRICA').asinteger); // Andre Imakawa - SIG 28145
                    //SIG49055
                    //sIdInforme := RetornaInformeTipoOpcaoIR(qryProcesso.fieldbyname('IDPATRO').asinteger,qryProcesso.fieldbyname('IDPLANOPREV').asinteger,qryProcesso.fieldbyname('IDTITULAR').asinteger, qryProcesso.fieldbyname('IDRUBRICA').asinteger, qryProcesso.fieldbyname('FONTEPAGADORA').asinteger); // Andre Imakawa - SIG 28145
                    //if sIdInforme <> '' then
                    //   svalores := svalores + sIdInforme+ ', ' //SOL 269049 PPM 1287659
                    //else
                    //   svalores := svalores + 'NULL, ';
                    //SIG49055

                    If qryProcesso.fieldbyname('IDINFORME').isnull Then
                       svalores := svalores + 'NULL, '
                    Else
                       svalores := svalores + inttostr(qryProcesso.fieldbyname('IDINFORME').asinteger) + ', '; //IDINFORME,

                    svalores := svalores +
                       QuotedStr(qryProcesso.fieldbyname('CODIRRFDARF').asString) + ', ' + //CODIRRFDARF,
                    QuotedStr(qryProcesso.fieldbyname('FLGTIPODESC').asString) + ', ' + //FLGTIPODESC,
                    OraNumero(FloattoStr(qryProcesso.fieldbyname('VALORPROVENTO').asfloat)) + ', ' + //VALORPROVENTO,
                    OraNumero(FloattoStr(qryProcesso.fieldbyname('VALORCOTAS').asfloat)) + ', ' + //VALORCOTAS,
                    OraNumero(FloattoStr(qryProcesso.fieldbyname('VALORINFO').asfloat)) + ', ' + //VALORINFO,
                    OraNumero(FloattoStr(qryProcesso.fieldbyname('VALORRECEBIDO').asfloat)) + ', ' + //VALORRECEBIDO,
                    QuotedStr(qryProcesso.fieldbyname('REFERENCIA').AsString) + ', ' + //REFERENCIA,
                    QuotedStr(qryProcesso.fieldbyname('CODMOEDA').AsString) + ', '; //CODMOEDA,

                    If qryProcesso.fieldbyname('IDREGRACALCULO').asinteger <> 0 Then
                       svalores := svalores +
                          inttostr(qryProcesso.fieldbyname('IDREGRACALCULO').asinteger) + ', ' //IDREGRACALCULO,
                    Else
                       svalores := svalores + 'NULL, ';

                    svalores := svalores +
                       QuotedStr(qryProcesso.fieldbyname('FLGCOMPOESALPART').AsString) + ', ' + //FLGCOMPOESALPART,
                    QuotedStr(qryProcesso.fieldbyname('FLGCOMPOESALBENEF').AsString) + ', ' + //FLGCOMPOESALBENEF,
                    QuotedStr(qryProcesso.fieldbyname('FLGIRRF').AsString) + ', ' + //FLGIRRF,
                    QuotedStr(qryProcesso.fieldbyname('FLGSRB').AsString) + ', ' + //FLGSRB,
                    inttostr(qryProcesso.fieldbyname('FONTEPAGADORA').asinteger) + ', ' + //FONTEPAGADORA,
                    inttostr(qryProcesso.fieldbyname('FLGCONCESSAO').asinteger) + ', ' + //FLGCONCESSAO,
                    inttostr(Sistema.IdModulo) + ', ' + //IDMODULO,
                    inttostr(qryProcesso.fieldbyname('FLGPENSAOALIM').asinteger) + ', ' + //FLGPENSAOALIM,
                    '0, ' + //FLGESTORNO,
                    inttostr(qryProcesso.fieldbyname('FLGISENTOIRRF').asinteger) + ', ' + //FLGISENTOIRRF,
                    inttostr(qryProcesso.fieldbyname('FLGIRRFTOTAL').asinteger) + ', ' + //FLGIRRFTOTAL,
                    inttostr(qryProcesso.fieldbyname('FLGMOLESTIAGRAVE').asinteger) + ', ' + //FLGMOLESTIAGRAVE,
                    inttostr(qryProcesso.fieldbyname('NUMDEPIRRF').asinteger) + ', ' + //NUMDEPIRRF,
                    inttostr(qryProcesso.fieldbyname('NUMDEPSF').asinteger) + ', '; //NUMDEPSF,

                    Try
                       If qryProcesso.fieldbyname('PARCELAS').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores +
                             inttostr(qryProcesso.fieldbyname('PARCELAS').asinteger) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //PLANO,
                    Try
                       If qryProcesso.fieldbyname('PLANO').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + qryProcesso.fieldbyname('PLANO').asstring + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //PLACONTAC,
                    Try
                       If qryProcesso.fieldbyname('PLACONTAC').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + QuotedStr(qryProcesso.fieldbyname('PLACONTAC').asstring) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //PLACONTAD,
                    Try
                       If qryProcesso.fieldbyname('PLACONTAD').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + QuotedStr(qryProcesso.fieldbyname('PLACONTAD').asstring) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //CODCENTROCUSTOC,
                    Try
                       If qryProcesso.fieldbyname('CODCENTROCUSTOC').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + QuotedStr(qryProcesso.fieldbyname('CODCENTROCUSTOC').asstring) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //CODCENTROCUSTOD,
                    Try
                       If qryProcesso.fieldbyname('CODCENTROCUSTOD').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + QuotedStr(qryProcesso.fieldbyname('CODCENTROCUSTOD').asstring) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //UNIDNEGOC,
                    Try
                       If qryProcesso.fieldbyname('UNIDNEGOC').isnull Then
                          svalores := svalores + inttostr(prmUnidNegoc) + ', '
                       Else
                          svalores := svalores + inttostr(qryProcesso.fieldbyname('UNIDNEGOC').asinteger) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //CODCENTRORESPON,
                    Try
                       If qryProcesso.fieldbyname('CODCENTRORESPON').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + QuotedStr(qryProcesso.fieldbyname('CODCENTRORESPON').asstring) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    //CODTIPRECDES,
                    Try
                       If qryProcesso.fieldbyname('CODTIPRECDES').isnull Then
                          svalores := svalores + 'NULL, '
                       Else
                          svalores := svalores + QuotedStr(qryProcesso.fieldbyname('CODTIPRECDES').asstring) + ', ';
                    Except
                       svalores := svalores + 'NULL, ';
                    End;

                    If rgEletronico.itemindex = 0 Then
                       svalores := svalores +
                          inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ', ' //SEQDOCUMENTO,
                    Else
                       svalores := svalores + '1, ';

                    If qryProcesso.FieldByName('IDPROCJUD').IsNull Then
                       svalores := svalores + 'NULL, '
                    Else
                       svalores := svalores + qryProcesso.FieldByName('IDPROCJUD').AsString + ', ';

                    svalores := svalores +
                       inttostr(qryProcesso.fieldbyname('NUMEROPROCESSO').asinteger) + ', ' + //NUMEROPROCESSO,
                    QuotedStr(qryProcesso.fieldbyname('NUMPROCINSS').asstring) + ', ' + //NUMPROCINSS,
                    QuotedStr(qryProcesso.fieldbyname('FLGDESCONTO').AsString) + ', ' + //FLGDESCONTO,
                    QuotedStr(qryProcesso.fieldbyname('FLGESPECIAL').AsString) + ', ' + //FLGESPECIAL,
                    inttostr(qryProcesso.fieldbyname('LOTEORIGINAL').asinteger) + ', ' + //LOTEORIGINAL,
                    floattostr(qryProcesso.fieldbyname('ORDEM').asfloat) + ', ' + //ORDEM
                    inttostr(qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger) + ', ' + //IDSEQINTERNOFB
                    IntToStr(qryProcesso.FieldByName('IDRECEBEPGTO').AsInteger) + ', '; //IDRECEBEPGTO


                    //Renato Visoni SOL 107088 Kintana 507022
                    If qryProcesso.FieldByName('IDBENEFICIO').IsNull Then
                       svalores := svalores + 'NULL'
                    Else
                       svalores := svalores + qryProcesso.FieldByName('IDBENEFICIO').AsString;
                    //Renato Visoni SOL 107088 Kintana 507022
                            //Luis Dornellas SOL 121617 Kintana
                    QryCpf.Close;
                    QryCpf.ParamByname('IDPESSOA').asString := qryProcesso.FieldByName('IDRESPONSAVEL').AsString;
                    QryCpf.Open;

                    svalores := svalores + ', ' + QuotedStr(QryCpf.FieldByName('NumDocumento').AsString);
                    //Luis Dornellas SOL 121617 Kintana

                    svalores := svalores + ', ' + QuotedStr(qryProcesso.FieldByName('MESCOMPREEM').AsString); // SOL 140042 Kintana 900220

                    svalores := svalores + ', ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger); //IDFAVDOC, // Andre Imakawa - SIG 29797

                    svalores := svalores + ', ' + QuotedStr(qryProcesso.FieldByName('RELACAODEPEN').AsString); // Rodrigo Ramos SIG 35762  21/08/2017

                    svalores := svalores + ', ' + inttostr(qryProcesso.fieldbyname('IDPERFILINVEST').asinteger); //Peterson Victor - SIG56702

                    svalores := svalores + ', ' + inttostr(qryProcesso.fieldbyname('TIPOCONTA').asinteger); //Andre Imakawa - SIG 60540

                    ssql := 'INSERT INTO HISTRUBSAL (' + sCampos + ') VALUES (' + sValores + ')';

                    //EXIBE MENSAGEM DE EXCEÇÃO
                    Try
                       qryAux1.sql.clear;
                       qryAux1.sql.add(ssql);
                       qryAux1.execsql;

  //SOL205224 douglas.siqueira

                   query.close;
                   query.SQL.Clear;
                   query.SQL.Add('UPDATE HSTBITRIBUTACAO');
                   query.SQL.Add('SET IDHSTFOLHABENEF = '+inttostr(aiidhistorico));
                   query.SQL.Add('WHERE');
                   query.SQL.Add('IDLOTE '+aslotes);
                   query.SQL.Add(' AND IDPESSOA='+qryProcesso.FieldByName('IDRESPONSAVEL').AsString);
                   query.ExecSQL;


                   query.close;
                   query.SQL.Clear;
                   query.SQL.Add('UPDATE HSTDEDIDADEBITRIB');
                   query.SQL.Add('SET IDHSTFOLHABENEF = '+inttostr(aiidhistorico));
                   query.SQL.Add('WHERE');
                   query.SQL.Add('IDLOTE '+aslotes);
                   query.SQL.Add(' AND IDPESSOA='+qryProcesso.FieldByName('IDRESPONSAVEL').AsString);
                   query.ExecSQL;
  //SOL205224 douglas.siqueira
                    Except
                       On E: Exception Do
                          Begin
                             frameProgresso.ExibeMensagem('Erro inclusão da rubrica na Histrubsal.');
                             frameProgresso.ExibeMensagem('Rubrica: ' + inttostr(qryProcesso.fieldbyname('IDRUBRICA').asinteger));
                             frameProgresso.ExibeMensagem('IDTITULAR: ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger));
                             frameProgresso.ExibeMensagem('IDRESPONSAVEL: ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger));
                             frameProgresso.ExibeMensagem('SEQRUBRICA: ' + inttostr(qryProcesso.fieldbyname('SEQRUBRICA').asinteger));
                             frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.Message);
                             ProcessamentoOK := false;
                             break;
                          End;
                    End;

                    frameProgresso.Passo;

                    qryProcesso.next;
                 End;



                 atualizaBasePagamento(qryProcesso.fieldbyname('MESCOBRANCA').AsString, aslotes, aiidhistorico); //SOL 207789/16615 PPM 554283

           end;

         Finally
            If ProcessamentoOK Then
               frameProgresso.MarcaFinalFase('Conclusão da gravação do Histórico de Pagamento.')
            Else
               frameProgresso.MarcaFinalFase('Ocorreu um problema na gravação do Histórico de Pagamento. Verificar LOG.');
            frameProgresso.ResetaFrame(1, 0);
            //COLOCA NO PRÓXIMO ESTADO
            If ProcessamentoOK Then
               GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraContabilizacao,
                  liplncodigo, liplnprovisaoabono, 0);
            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               frameProgresso.FazCommit(false);
         End;
      End;
   qryProcesso.Close;
   qryProcesso.UniDirectional := false;
   query.close;//SOL205224 douglas.siqueira
   query.Destroy;//SOL205224 douglas.siqueira
End;

Procedure TfrmFolhaNormalEfet.ProcessaContabilizacao(aiidhistorico: integer;
   abregera: boolean = false); //processa geração da planilha contábil
Const cbjunta: boolean = FALSE;
Var ssql: String;
   lshist1, lshist2, lshist3, lshist4, lshist5: String;
   litipofolha: integer;
   rValorIRCorrente: real;
   rValorIROriginal: real;
   dplncodigo: double;
   lcTipoLanc: char;
   lsplacontac, lsccustoc,
      lsplacontad, lsccustod: String;
Begin
   ssql :=
      'SELECT FLGTIPOFOLHA ' + _clinefeed +
      'FROM HSTFOLHABENEF ' + _clinefeed +
      'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed;

   If FazQuery(qryAux1, ssql) Then
      litipofolha := qryAux1.fieldbyname('FLGTIPOFOLHA').asinteger
   Else
      Begin
         frameProgresso.ExibeMensagem('Não encontrou HSTFOLHABENEF');
         frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
         ProcessamentoOK := false;
         exit;
      End;

   frameProgresso.IntervaloCommit := 0;
   If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.starttransaction;

   ProcessamentoOK := true;

   If Not abregera Then
      Begin
         liPlnCodigo := 0;
         liplnprovisaoabono := 0;
         GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraContabilizacao,
            liplncodigo, liplnprovisaoabono, 0);
      End
   Else
      //ELIMINA A PLANILHA JÁ CRIADA
      Begin
         If Not ctrlLancamento.ExcluiLancaContab(Sistema.Idusuario, liplncodigo,
            Sistema.Idmodulo, 0, true, false) Then
            Begin
               frameProgresso.ExibeMensagem('Erro na exclusão da planilha corrente, para regeração.');
               frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
               frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
               ProcessamentoOK := false;
               exit;
            End;
      End;

   //TRATAR PAGAMENTO PENDENTE
   If litipofolha <> 1 Then
      Begin
         If Sistemafolha.flgpartidadobrada = 0 Then
            Begin
               //ALTERAÇÃO NA CONSULTA PRINCIPAL UTILIZANDO UNION
               //  DE FORMA A PROCESSAR TODOS OS LANÇAMENTOS DE UMA SÓ VEZ E FAZENDO A APURAÇÃO
               //  DO VALOR LÍQUIDO PARA AS CONTAS DE LÍQUIDO DOS VALORES A CRÉDITO MENOS OS
               //  VALORES A DÉBIDO

               frameProgresso.MarcaInicioFase('Geração de contabilização de lançamentos de apropriação em partida simples');

                              ssql :=
                  'SELECT ''C'' AS TIPO, SUM(VALOR) AS VALOR, HISTORICO, IDPATRO,IDPLANOCONTABIL, PLANO, ' + _clinefeed +
                  '       PLACONTA, CODCENTROCUSTO, UNIDNEGOC, FLGTIPODESC, NOMEPLANO, ' + _clinefeed +
                  '       FLGDESCONTO, IDRUBRICA, CODPROVDESC, DESCRICAO ' + _clinefeed +
                  'FROM ( ' + _clinefeed +
//                  'SELECT SUM(VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed + //Everson TIBERO
                  'SELECT SUM(H.VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed + //Everson TIBERO
                  '       H.IDPATRO, PI.idplanprevcontab as IDPLANOCONTABIL, H.PLANO, H.PLACONTAC AS PLACONTA, ' + _clinefeed + //Peterson Victor SIG 56702
                  '       H.CODCENTROCUSTOC AS CODCENTROCUSTO, H.UNIDNEGOC, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,0,'' '',H.FLGTIPODESC) AS FLGTIPODESC, ' + _clinefeed +
                  '       PL.NOME AS NOMEPLANO, H.FLGDESCONTO, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,0,0,H.IDRUBRICA) AS IDRUBRICA, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,0,'' '',H.CODPROVDESC) AS CODPROVDESC, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,0,'' '',P.DESCRICAO) AS DESCRICAO ' + _clinefeed +
                  'FROM HISTRUBSAL H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL, perfilinvest PI ' + _clinefeed +   //Peterson Victor SIG 56702
                  'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                  'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' + _clinefeed +
                  'AND H.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
                  'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                  'AND H.FLGDESCONTO = 1 ' + _clinefeed +
                  'AND PL.IDPLANOPREV = pi.idplanprevcontab ' + _clinefeed +   //edilaine SIG56702
                  'and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed + //Peterson Victor SIG 56702
                  'GROUP BY HH.HISTORICO, H.IDPATRO, PI.idplanprevcontab, H.PLANO, H.PLACONTAC, ' + _clinefeed +  //Peterson Victor SIG 56702
                  '         H.CODCENTROCUSTOC, H.UNIDNEGOC, H.FLGTIPODESC, PL.NOME, ' + _clinefeed +
                  '         H.FLGDESCONTO, H.IDRUBRICA, H.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
//                  'HAVING SUM(VALORPROVENTO) > 0 ' + _clinefeed + //Everson TIBERO
                  'HAVING SUM(H.VALORPROVENTO) > 0 ' + _clinefeed + //Everson TIBERO
                  ') ' + _clinefeed +
                  'GROUP BY HISTORICO, IDPATRO, IDPLANOCONTABIL, PLANO, PLACONTA, ' + _clinefeed +
                  '      CODCENTROCUSTO, UNIDNEGOC, FLGTIPODESC, NOMEPLANO, ' + _clinefeed +
                  '      FLGDESCONTO, IDRUBRICA, CODPROVDESC, DESCRICAO ' + _clinefeed +


                  'UNION ' + _clinefeed +


                  'SELECT ''D'' AS TIPO, SUM(VALOR) AS VALOR, HISTORICO, IDPATRO, IDPLANOCONTABIL, PLANO, ' + _clinefeed +
                  '       PLACONTA, CODCENTROCUSTO, UNIDNEGOC, FLGTIPODESC, NOMEPLANO, ' + _clinefeed +
                  '       FLGDESCONTO, IDRUBRICA, CODPROVDESC, DESCRICAO ' + _clinefeed +
                  'FROM ( ' + _clinefeed +
//                  'SELECT SUM(VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed + //Everson TIBERO
                  'SELECT SUM(H.VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed + //Everson TIBERO
                  '       H.IDPATRO, PI.idplanprevcontab as IDPLANOCONTABIL, H.PLANO, H.PLACONTAD AS PLACONTA, ' + _clinefeed + //Peterson Victor SIG 56702
                  '       H.CODCENTROCUSTOD AS CODCENTROCUSTO, H.UNIDNEGOC, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,1,'' '',H.FLGTIPODESC) AS FLGTIPODESC, ' + _clinefeed +
                  '       PL.NOME AS NOMEPLANO, H.FLGDESCONTO, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,1,0,H.IDRUBRICA) AS IDRUBRICA, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,1,'' '',H.CODPROVDESC) AS CODPROVDESC, ' + _clinefeed +
                  '       DECODE(H.FLGDESCONTO,1,'' '',P.DESCRICAO) AS DESCRICAO ' + _clinefeed +
                  'FROM HISTRUBSAL H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL, perfilinvest PI ' + _clinefeed + //Peterson Victor SIG 56702
                  'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                  'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' + _clinefeed +
                  'AND H.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
                  'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                  'AND H.FLGDESCONTO = 0 ' + _clinefeed +
                  'AND PL.IDPLANOPREV = pi.idplanprevcontab ' + _clinefeed +   //edilaine SIG56702
                  'and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed + //Peterson Victor SIG 56702
                  'GROUP BY HH.HISTORICO, H.IDPATRO, PI.idplanprevcontab, H.PLANO, H.PLACONTAD, ' + _clinefeed + //Peterson Victor SIG 56702
                  '         H.CODCENTROCUSTOD, H.UNIDNEGOC, H.FLGTIPODESC, PL.NOME, ' + _clinefeed +
                  '         H.FLGDESCONTO, H.IDRUBRICA, H.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
//                  'HAVING SUM(VALORPROVENTO) > 0 ' + _clinefeed + //Everson TIBERO
                  'HAVING SUM(H.VALORPROVENTO) > 0 ' + _clinefeed + //Everson TIBERO
                  ') ' + _clinefeed +
                  'GROUP BY HISTORICO, IDPATRO, IDPLANOCONTABIL, PLANO, PLACONTA, ' + _clinefeed +
                  '         CODCENTROCUSTO, UNIDNEGOC, FLGTIPODESC, NOMEPLANO, ' + _clinefeed +
                  '         FLGDESCONTO, IDRUBRICA, CODPROVDESC, DESCRICAO ' + _clinefeed +


                  'UNION ' + _clinefeed +



                  'SELECT ''L'' AS TIPO, ' + _clinefeed +
                  '       SUM(DECODE(G.FLGDESCONTO,0,G.VALORPROVENTO,1,-G.VALORPROVENTO,0)) AS VALOR, ' + _clinefeed +
                  '       G.HISTORICO, G.IDPATRO, G.IDPLANOCONTABIL, G.PLANO, ' + _clinefeed +
                  '       G.PLACONTA, G.CODCENTROCUSTO, G.UNIDNEGOC, G.FLGTIPODESC, G.NOMEPLANO, ' + _clinefeed +
                  '       -1, G.IDRUBRICA, G.CODPROVDESC, G.DESCRICAO ' + _clinefeed +
                  'FROM ( ' + _clinefeed +
                  'SELECT H.FLGDESCONTO, H.VALORPROVENTO, ' + _clinefeed +
//                  '       LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,PLACONTAD))) AS PLACONTA, ' + _clinefeed +  //Everson TIBERO
                  '       LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,H.PLACONTAD))) AS PLACONTA, ' + _clinefeed +  //Everson TIBERO
//                  '       LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.CODCENTROCUSTOC,1,CODCENTROCUSTOD))) AS CODCENTROCUSTO, ' + _clinefeed +  //Everson TIBERO
                  '       LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.CODCENTROCUSTOC,1,H.CODCENTROCUSTOD))) AS CODCENTROCUSTO, ' + _clinefeed +  //Everson TIBERO
                  '       HH.HISTORICO, H.IDPATRO, PI.idplanprevcontab as IDPLANOCONTABIL , H.PLANO, ' + _clinefeed +  //Peterson Victor SIG 56702
                  '       H.UNIDNEGOC, ' + _clinefeed +
                  '       '' '' AS FLGTIPODESC, ' + _clinefeed +
                  '       PL.NOME AS NOMEPLANO, ' + _clinefeed +
                  '       0 AS IDRUBRICA, ' + _clinefeed +
                  '       '' '' AS CODPROVDESC, ' + _clinefeed +
                  '       '' '' AS DESCRICAO ' + _clinefeed +
                  'FROM HISTRUBSAL H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL, perfilinvest PI  ' + _clinefeed +  //Peterson Victor SIG 56702
                  'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                  'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' + _clinefeed +
                  'AND H.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
                  'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                  'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                  'and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed + //Peterson Victor SIG 56702
                  'AND PL.IDPLANOPREV = pi.idplanprevcontab) G ' + _clinefeed +   //edilaine SIG56702
                  'GROUP BY G.HISTORICO, G.IDPATRO, G.IDPLANOCONTABIL, G.PLANO, G.PLACONTA, ' + _clinefeed +
                  '         G.CODCENTROCUSTO, G.UNIDNEGOC, G.FLGTIPODESC, G.NOMEPLANO, ' + _clinefeed +
                  '         G.IDRUBRICA, G.CODPROVDESC, G.DESCRICAO ' + _clinefeed;

               Try
                  If FazQuery(qryAux1, ssql) Then
                     Begin
                        frameProgresso.ResetaFrame(1, qryAux1.recordcount);

                        While Not qryAux1.eof Do
                           Begin
                              //ALTERAÇÃO NO CONTROLE PARA INCORPORAR OS CÓDIGOS A
                              //  DÉBITO E A CRÉDITO NUM ÚNICO CÓDIGO, PREVENDO TB O NOVO TIPO DE CONTA LÍQUIDO

                              lcTipoLanc := ' ';
                              lsplacontac := '';
                              lsccustoc := '';
                              lsplacontad := '';
                              lsccustod := '';

                              If qryAux1.fieldbyname('TIPO').asstring = 'L' Then
                                 Begin
                                    lsHist1 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 1, 40);
                                    lsHist2 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 41, 40);
                                    lsHist3 := '';
                                    lsHist4 := '';
                                    lsHist5 := '';

                                    If qryAux1.fieldbyname('VALOR').asfloat > 0 Then
                                       Begin
                                          lcTipoLanc := '1';
                                          lsplacontac := qryAux1.fieldbyname('PLACONTA').asstring;
                                          lsccustoc := qryAux1.fieldbyname('CODCENTROCUSTO').asstring;
                                          lsplacontad := '';
                                          lsccustod := '';
                                       End
                                    Else
                                       Begin
                                          lcTipoLanc := '0';
                                          lsplacontac := '';
                                          lsccustoc := '';
                                          lsplacontad := qryAux1.fieldbyname('PLACONTA').asstring;
                                          lsccustod := qryAux1.fieldbyname('CODCENTROCUSTO').asstring;
                                       End;

                                 End
                              Else
                                 Begin
                                    If qryAux1.fieldbyname('TIPO').asstring = 'C' Then
                                       Begin

                                          lcTipoLanc := '1';
                                          lsplacontac := qryAux1.fieldbyname('PLACONTA').asstring;
                                          lsccustoc := qryAux1.fieldbyname('CODCENTROCUSTO').asstring;
                                          lsplacontad := '';
                                          lsccustod := '';

                                          lsHist1 := copy(qryAux1.fieldbyname('CODPROVDESC').asstring + '-' +
                                             qryAux1.fieldbyname('DESCRICAO').asstring, 1, 40);
                                          lsHist2 := copy(qryAux1.fieldbyname('NOMEPLANO').asstring, 1, 40);
                                          lsHist3 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 1, 40);
                                          lsHist4 := '';
                                          lsHist5 := '';
                                          If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'B' Then
                                             Begin
                                                lsHist1 := copy(dtmContabil.PegaNomeBeneficioDeRubrica(qryAux1.fieldbyname('IDRUBRICA').asinteger), 1, 40);
                                                lsHist4 := 'Estorno de Benefícios';
                                             End
                                          Else
                                             If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'Q' Then
                                                Begin
                                                   lsHist4 := 'Estorno de Pagamento de Consignação';
                                                End
                                             Else
                                                If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'E' Then
                                                   Begin
                                                      lsHist4 := 'Receita de Empréstimo';
                                                   End
                                                Else
                                                   If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'A' Then
                                                      Begin
                                                         lsHist4 := 'Receita Assistencial';
                                                      End
                                                   Else
                                                      If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'P' Then
                                                         Begin
                                                            lsHist4 := 'Receita de Contribuição';
                                                         End
                                                      Else
                                                         If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'C' Then
                                                            Begin
                                                               lsHist4 := 'Desconto Individual';
                                                            End
                                                         Else
                                                            If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'I' Then
                                                               Begin
                                                                  lsHist4 := 'Retenção de IR';
                                                               End
                                                            Else
                                                               If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'Y' Then
                                                                  Begin
                                                                     lsHist4 := 'Desconto Individual';
                                                                  End
                                                               Else
                                                                  If (qryAux1.fieldbyname('FLGTIPODESC').asstring = 'T') Or
                                                                     (qryAux1.fieldbyname('FLGTIPODESC').asstring = 'R') Then
                                                                     Begin
                                                                        lsHist4 := 'Descontos Diversos';
                                                                     End;
                                       End
                                    Else
                                       Begin
                                          If qryAux1.fieldbyname('TIPO').asstring = 'D' Then
                                             Begin

                                                lcTipoLanc := '0';
                                                lsplacontac := '';
                                                lsccustoc := '';
                                                lsplacontad := qryAux1.fieldbyname('PLACONTA').asstring;
                                                lsccustod := qryAux1.fieldbyname('CODCENTROCUSTO').asstring;

                                                lsHist1 := copy(qryAux1.fieldbyname('CODPROVDESC').asstring + '-' +
                                                   qryAux1.fieldbyname('DESCRICAO').asstring, 1, 40);
                                                lsHist2 := copy(qryAux1.fieldbyname('NOMEPLANO').asstring, 1, 40);
                                                lsHist3 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 1, 40);
                                                lsHist4 := '';
                                                lsHist5 := '';
                                                If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'B' Then
                                                   Begin
                                                      lsHist1 := copy(dtmContabil.PegaNomeBeneficioDeRubrica(qryAux1.fieldbyname('IDRUBRICA').asinteger), 1, 40);
                                                      If trim(lsHist1) = '' Then
                                                         lsHist1 := copy(qryAux1.fieldbyname('CODPROVDESC').asstring + '-' +
                                                            qryAux1.fieldbyname('DESCRICAO').asstring, 1, 40);
                                                      lsHist4 := 'Despesa de Benefícios';
                                                   End
                                                Else
                                                   If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'Q' Then
                                                      Begin
                                                         lsHist4 := 'Pagamento de Consignação';
                                                      End
                                                   Else
                                                      If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'E' Then
                                                         Begin
                                                            lsHist4 := 'Estorno de Empréstimo';
                                                         End
                                                      Else
                                                         If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'A' Then
                                                            Begin
                                                               lsHist4 := 'Estorno Assistencial';
                                                            End
                                                         Else
                                                            If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'P' Then
                                                               Begin
                                                                  lsHist4 := 'Estorno de Contribuição';
                                                               End
                                                            Else
                                                               If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'C' Then
                                                                  Begin
                                                                     lsHist4 := 'Estorno de Desconto Individual';
                                                                  End
                                                               Else
                                                                  If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'I' Then
                                                                     Begin
                                                                        lsHist4 := 'Estorno de IR';
                                                                     End
                                                                  Else
                                                                     If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'Y' Then
                                                                        Begin
                                                                           lsHist4 := 'Estorno de Desconto Individual';
                                                                        End
                                                                     Else
                                                                        If (qryAux1.fieldbyname('FLGTIPODESC').asstring = 'T') Or
                                                                           (qryAux1.fieldbyname('FLGTIPODESC').asstring = 'R') Then
                                                                           Begin
                                                                              lsHist4 := 'Estorno de Descontos Diversos';
                                                                           End;
                                             End;
                                       End;
                                 End;

                              Try
                                 If Not ctrlLancamento.InsereLancaContab(
                                    lcTipoLanc,
                                    liEmpresa, //IdEmpresa
                                    Sistema.IdModulo, //iModuloOrigem
                                    Sistema.IdUsuario, //liUsuario
                                    IntegraBack.Plano, //liCodPlano
                                    qryAux1.fieldbyname('UNIDNEGOC').asinteger, //liUnidNegoc
                                    0, //liSubContaDeb
                                    0, //liSubContaCre
                                    qryAux1.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                                    qryAux1.fieldbyname('IDPATRO').asinteger, //iPatro
                                    liPlnCodigo, //liPlnCodigo
                                    0, //iNumLan
                                    sDtContabilizacao, //sDataLanc
                                    '', //sNumDoc
                                    lshist1, //sHist1
                                    lshist2, //sHist2
                                    lshist3, //sHist3
                                    lshist4, //sHist4
                                    lshist5, //sHist5
                                    prmTipCodigo, //sTipoOper
                                    lsccustod,
                                    lsplacontad,
                                    lsccustoc,
                                    lsplacontac,
                                    '', //sCodHist
                                    abs(qryAux1.fieldbyname('VALOR').AsFloat), //rValLanc
                                    cbjunta, //bJunta
                                    Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                                    -1, //iIdSegregaCriter
                                    -1 //dDataSegregaCriter
                                    ) Then
                                    Begin
                                       frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                       frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
                                       frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                       ProcessamentoOK := false;
                                       break;
                                    End;

                                 dplncodigo := ctrlLancamento.RetornoPlnCodigo;
                                 liPlnCodigo := round(dplncodigo);
                              Except
                                 On e: exception Do
                                    Begin
                                       frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                       frameProgresso.ExibeMensagem('Erro no processamento do lançamento contábil');
                                       frameProgresso.ExibeMensagem(e.message);
                                       frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                       ProcessamentoOK := false;
                                       break;
                                    End;
                              End;

                              frameProgresso.Passo;
                              qryAux1.next;
                           End;
                     End
                  Else
                     frameProgresso.MarcaFinalFase('Nenhum lançamento em partida simples a ser gerado.');
               Finally
                  If ProcessamentoOK Then
                     frameProgresso.MarcaFinalFase('Conclusão contabilização dos lançamentos em partida simples.')
                  Else
                     frameProgresso.MarcaFinalFase('Ocorrreu problema na contabilização dos lançamentos em partida simples. Verificar LOG.');
                  frameProgresso.ResetaFrame(1, 0);
               End;
            End
         Else
            Begin
               frameProgresso.MarcaInicioFase('Geração de contabilização dos lançamentos em partida dobrada.');

               //* MONTA PLANILHA CONTABIL PARTIDA DOBRADA DA HISTRUBSAL */
               ssql :=
//                  'SELECT SUM(VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed + //Everson TIBERO
                  'SELECT SUM(H.VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed + //Everson TIBERO
                  'H.IDPATRO, PI.idplanprevcontab as IDPLANOCONTABIL, H.PLANO, ' + _clinefeed + //Peterson Victor SIG 56702
                  'H.PLACONTAC, H.PLACONTAD, ' + _clinefeed +
                  'H.CODCENTROCUSTOC, H.CODCENTROCUSTOD, H.UNIDNEGOC, ' + _clinefeed +
                  'H.FLGTIPODESC, PL.NOME AS NOMEPLANO, ' + _clinefeed +
                  'H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
                  'FROM HISTRUBSAL H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL, perfilinvest PI  ' + _clinefeed +   //Peterson Victor SIG 56702
                  'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                  'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' + _clinefeed +
                  'AND H.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
                  'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                  'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                  'AND PL.IDPLANOPREV = pi.idplanprevcontab ' + _clinefeed +   //edilaine SIG56702
                  'and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed + //Peterson Victor SIG 56702
                  'GROUP BY HH.HISTORICO, H.IDPATRO, PI.idplanprevcontab, ' + _clinefeed + //Peterson Victor SIG 56702
                  'H.PLANO, H.PLACONTAC, H.PLACONTAD, ' + _clinefeed +
                  'H.CODCENTROCUSTOC, H.CODCENTROCUSTOD, ' + _clinefeed +
                  'H.UNIDNEGOC, H.FLGTIPODESC, PL.NOME, ' + _clinefeed +
                  'H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
//                  'HAVING SUM(VALORPROVENTO) > 0 '; //Everson TIBERO
                  'HAVING SUM(H.VALORPROVENTO) > 0 '; //Everson TIBERO

               Try
                  If FazQuery(qryAux1, ssql) Then
                     Begin
                        frameProgresso.ResetaFrame(1, qryAux1.recordcount);

                        While Not qryAux1.eof Do
                           Begin
                              lsHist1 := copy(qryAux1.fieldbyname('CODPROVDESC').asstring + '-' +
                                 qryAux1.fieldbyname('DESCRICAO').asstring, 1, 40);
                              lsHist2 := copy(qryAux1.fieldbyname('NOMEPLANO').asstring, 1, 40);
                              lsHist3 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 1, 40);
                              lsHist4 := '';
                              lsHist5 := '';
                              If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'B' Then
                                 Begin
                                    If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                       lsHist4 := 'Despesa de Benefícios'
                                    Else
                                       lsHist4 := 'Estorno de Benefícios';
                                 End
                              Else
                                 If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'Q' Then
                                    Begin
                                       If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                          lsHist4 := 'Pagamento de Consignação'
                                       Else
                                          lsHist4 := 'Estorno de Pagamento de Consignação';
                                    End
                                 Else
                                    If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'E' Then
                                       Begin
                                          If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                             lsHist4 := 'Receita de Empréstimo'
                                          Else
                                             lsHist4 := 'Estorno de Empréstimo';
                                       End
                                    Else
                                       If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'A' Then
                                          Begin
                                             If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                                lsHist4 := 'Receita Assistencial'
                                             Else
                                                lsHist4 := 'Estorno Assistencial';
                                          End
                                       Else
                                          If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'P' Then
                                             Begin
                                                If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                                   lsHist4 := 'Receita de Contribuição'
                                                Else
                                                   lsHist4 := 'Estorno de Contribuição';
                                             End
                                          Else
                                             If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'C' Then
                                                Begin
                                                   If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                                      lsHist4 := 'Desconto Individual'
                                                   Else
                                                      lsHist4 := 'Estorno de Desconto Individual';
                                                End
                                             Else
                                                If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'I' Then
                                                   Begin
                                                      If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                                         lsHist4 := 'Retenção de IR'
                                                      Else
                                                         lsHist4 := 'Estorno de IR';
                                                   End
                                                Else
                                                   If qryAux1.fieldbyname('FLGTIPODESC').asstring = 'Y' Then
                                                      Begin
                                                         If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                                            lsHist4 := 'Desconto Individual'
                                                         Else
                                                            lsHist4 := 'Estorno de Desconto Individual';
                                                      End
                                                   Else
                                                      If (qryAux1.fieldbyname('FLGTIPODESC').asstring = 'T') Or
                                                         (qryAux1.fieldbyname('FLGTIPODESC').asstring = 'R') Then
                                                         Begin
                                                            If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                                               lsHist4 := 'Descontos Diversos'
                                                            Else
                                                               lsHist4 := 'Estorno de Desconto Diversos';
                                                         End;

                              Try
                                 If Not ctrlLancamento.InsereLancaContab(
                                    '2', //cTipoLanc
                                    liEmpresa, //IdEmpresa
                                    Sistema.IdModulo, //iModuloOrigem
                                    Sistema.IdUsuario, //liUsuario
                                    IntegraBack.Plano, //liCodPlano
                                    qryAux1.fieldbyname('UNIDNEGOC').asinteger, //liUnidNegoc
                                    0, //liSubContaDeb
                                    0, //liSubContaCre
                                    qryAux1.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                                    qryAux1.fieldbyname('IDPATRO').asinteger, //iPatro
                                    liPlnCodigo, //liPlnCodigo
                                    0, //iNumLan
                                    sDtContabilizacao, //sDataLanc
                                    '', //sNumDoc
                                    lshist1, //sHist1
                                    lshist2, //sHist2
                                    lshist3, //sHist3
                                    lshist4, //sHist4
                                    lshist5, //sHist5
                                    prmTipCodigo, //sTipoOper
                                    qryAux1.fieldbyname('CODCENTROCUSTOD').asstring, //cCCustd
                                    qryAux1.fieldbyname('PLACONTAD').asstring, //cContad
                                    qryAux1.fieldbyname('CODCENTROCUSTOC').asstring, //cCCustc
                                    qryAux1.fieldbyname('PLACONTAC').asstring, //cContac
                                    '', //sCodHist
                                    qryAux1.fieldbyname('VALOR').AsFloat, //rValLanc
                                    cbjunta, //bJunta
                                    Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                                    -1, //iIdSegregaCriter
                                    -1 //dDataSegregaCriter
                                    ) Then
                                    Begin
                                       frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                       frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
                                       frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                       ProcessamentoOK := false;
                                       break;
                                    End;

                                 dplncodigo := ctrlLancamento.RetornoPlnCodigo;
                                 liPlnCodigo := round(dplncodigo);
                              Except
                                 On e: exception Do
                                    Begin
                                       frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                       frameProgresso.ExibeMensagem('Erro no processamento do lançamento contábil');
                                       frameProgresso.ExibeMensagem(e.message);
                                       frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                       ProcessamentoOK := false;
                                       break;
                                    End;
                              End;

                              frameProgresso.Passo;
                              qryAux1.next;
                           End;
                     End
                  Else
                     frameProgresso.MarcaFinalFase('Nenhum lançamento de conta crédito a ser gerado.');
               Finally
                  If ProcessamentoOK Then
                     frameProgresso.MarcaFinalFase('Conclusão contabilização dos lançamentos em partida dobrada.')
                  Else
                     frameProgresso.MarcaFinalFase('Ocorrreu problema na contabilização dos lançamentos em partida dobrada. Verificar LOG.');
                  frameProgresso.ResetaFrame(1, 0);
               End;
            End;
      End
   Else
      Begin
         If Not SistemaFolha.FlgNaoRecalcIRPagPendente Then
            Begin
               frameProgresso.MarcaInicioFase('Geração de contabilização de lançamentos');

               ssql :=
                  'SELECT H.IDTITULAR, H.IDRESPONSAVEL, ' + _clinefeed +
                  '       SUM(H.VALORPROVENTO) AS VALOR, HH.HISTORICO, ' + _clinefeed +
                  '       H.IDPATRO, PI.idplanprevcontab as IDPLANOCONTABIL, H.PLANO, ' + _clinefeed +       //Peterson Victor SIG 56702
                  '       H.PLACONTAC, H.PLACONTAD, ' + _clinefeed +
                  '       H.CODCENTROCUSTOC, H.CODCENTROCUSTOD, ' + _clinefeed +
                  '       H.UNIDNEGOC, H.FLGTIPODESC, ' + _clinefeed +
                  '       PL.NOME AS NOMEPLANO, H.FLGDESCONTO, ' + _clinefeed +
                  '       H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
                  'FROM HISTRUBSAL H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL,  perfilinvest PI  ' + _clinefeed +   //Peterson Victor SIG 56702
                  'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                  'AND H.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' + _clinefeed +
                  'AND H.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
                  'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                  'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                  'AND PL.IDPLANOPREV = pi.idplanprevcontab ' + _clinefeed +   //edilaine SIG56702
                  'AND H.FLGTIPODESC = ''I'' ' + _clinefeed +
                  ' and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed +   //Peterson Victor SIG 56702
                  'GROUP BY HH.HISTORICO, H.IDPATRO, PI.idplanprevcontab, ' + _clinefeed +   //Peterson Victor SIG 56702
                  '         H.IDTITULAR, H.IDRESPONSAVEL, ' + _clinefeed +
                  '         H.PLANO, H.PLACONTAC, H.PLACONTAD, ' + _clinefeed +
                  '         H.CODCENTROCUSTOC, H.CODCENTROCUSTOD, ' + _clinefeed +
                  '         H.UNIDNEGOC, H.FLGTIPODESC, PL.NOME, ' + _clinefeed +
                  '         H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
                  'ORDER BY H.IDTITULAR, H.IDRESPONSAVEL ' + _clinefeed;

               Try
                  If FazQuery(qryAux1, ssql) Then
                     Begin
                        frameProgresso.ResetaFrame(1, qryAux1.recordcount);

                        While Not qryAux1.eof Do
                           Begin
                              ssql :=
                                 'SELECT SUM(H.VALORPROVENTO) AS VALOR ' + _clinefeed +
                                 'FROM HISTRUBSAL H, PREVIA P, LOTEXHSTFOLHABENEF L ' + _clinefeed +
                                 'WHERE H.IDMODULO = 18 ' + _clinefeed +
                                 'AND H.IDTITULAR = ' +
                                 inttostr(qryAux1.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                                 'AND H.IDRESPONSAVEL = ' +
                                 inttostr(qryAux1.fieldbyname('IDRESPONSAVEL').asinteger) + ' ' + _clinefeed +
                                 'AND H.IDRUBRICA = ' +
                                 inttostr(qryAux1.fieldbyname('IDRUBRICA').asinteger) + ' ' + _clinefeed +
                                 'AND H.FLGTIPODESC = ''I'' ' + _clinefeed +
                                 'AND H.IDHSTFOLHABENEF = P.IDVERSAOESTORNO ' + _clinefeed +
                                 'AND L.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                                 'AND P.IDLOTE = L.IDLOTE ' + _clinefeed +
                                 'AND P.IDTITULAR = ' +
                                 inttostr(qryAux1.fieldbyname('IDTITULAR').asinteger) + ' ' + _clinefeed +
                                 'AND P.IDRESPONSAVEL = ' +
                                 inttostr(qryAux1.fieldbyname('IDRESPONSAVEL').asinteger) + ' ' + _clinefeed +
                                 'AND P.IDRUBRICA = ' +
                                 inttostr(qryAux1.fieldbyname('IDRUBRICA').asinteger) + ' ' + _clinefeed +
                                 'AND P.FLGTIPODESC = ''I'' ' + _clinefeed +
                                 'GROUP BY H.IDRUBRICA';

                              If FazQuery(qryAux2, ssql) Then
                                 Begin
                                    rValorIROriginal := qryAux2.fieldbyname('VALOR').asfloat;
                                    rValorIRCorrente := qryAux1.fieldbyname('VALOR').asfloat;

                                    If TruncaMoeda(abs(rValorIRCorrente - rValorIROriginal)) > 0.00 Then
                                       Begin
                                          Try
                                             lsHist1 := copy(qryAux1.fieldbyname('CODPROVDESC').asstring + '-' +
                                                qryAux1.fieldbyname('DESCRICAO').asstring, 1, 40);
                                             lsHist2 := copy(qryAux1.fieldbyname('NOMEPLANO').asstring, 1, 40);
                                             lsHist3 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 1, 40);
                                             lsHist5 := '';
                                             If rValorIRCorrente > rValorIROriginal Then
                                                Begin
                                                   lsHist4 := 'Retenção de IR';
                                                   If Not ctrlLancamento.InsereLancaContab(
                                                      '2', //cTipoLanc
                                                      liEmpresa, //IdEmpresa
                                                      Sistema.IdModulo, //iModuloOrigem
                                                      Sistema.IdUsuario, //liUsuario
                                                      IntegraBack.Plano, //liCodPlano
                                                      qryAux1.fieldbyname('UNIDNEGOC').asinteger, //liUnidNegoc
                                                      0, //liSubContaDeb
                                                      0, //liSubContaCre
                                                      qryAux1.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                                                      qryAux1.fieldbyname('IDPATRO').asinteger, //iPatro
                                                      liPlnCodigo, //liPlnCodigo
                                                      0, //iNumLan
                                                      sDtContabilizacao, //sDataLanc
                                                      '', //sNumDoc
                                                      lshist1, //sHist1
                                                      lshist2, //sHist2
                                                      lshist3, //sHist3
                                                      lshist4, //sHist4
                                                      lshist5, //sHist5
                                                      prmTipCodigo, //sTipoOper
                                                      qryAux1.fieldbyname('CODCENTROCUSTOD').asstring, //cCCustd
                                                      qryAux1.fieldbyname('PLACONTAD').asstring, //cContad
                                                      qryAux1.fieldbyname('CODCENTROCUSTOC').asstring, //cCCustc
                                                      qryAux1.fieldbyname('PLACONTAC').asstring, //cContac
                                                      '', //sCodHist
                                                      TruncaMoeda(abs(rValorIRCorrente - rValorIROriginal)), //rValLanc
                                                      cbjunta, //bJunta
                                                      Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                                                      -1, //iIdSegregaCriter
                                                      -1 //dDataSegregaCriter
                                                      ) Then
                                                      Begin
                                                         frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                                         frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
                                                         frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                                         ProcessamentoOK := false;
                                                         break;
                                                      End;

                                                   dplncodigo := ctrlLancamento.RetornoPlnCodigo;
                                                   liPlnCodigo := round(dplncodigo);
                                                End
                                             Else
                                                Begin
                                                   lsHist4 := 'Estorno de IR';
                                                   If Not ctrlLancamento.InsereLancaContab(
                                                      '2', //cTipoLanc
                                                      liEmpresa, //IdEmpresa
                                                      Sistema.IdModulo, //iModuloOrigem
                                                      Sistema.IdUsuario, //liUsuario
                                                      IntegraBack.Plano, //liCodPlano
                                                      qryAux1.fieldbyname('UNIDNEGOC').asinteger, //liUnidNegoc
                                                      0, //liSubContaDeb
                                                      0, //liSubContaCre
                                                      qryAux1.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                                                      qryAux1.fieldbyname('IDPATRO').asinteger, //iPatro
                                                      liPlnCodigo, //liPlnCodigo
                                                      0, //iNumLan
                                                      sDtContabilizacao, //sDataLanc
                                                      '', //sNumDoc
                                                      lshist1, //sHist1
                                                      lshist2, //sHist2
                                                      lshist3, //sHist3
                                                      lshist4, //sHist4
                                                      lshist5, //sHist5
                                                      prmTipCodigo, //sTipoOper
                                                      qryAux1.fieldbyname('CODCENTROCUSTOD').asstring, //cCCustd
                                                      qryAux1.fieldbyname('PLACONTAD').asstring, //cContad
                                                      qryAux1.fieldbyname('CODCENTROCUSTOC').asstring, //cCCustc
                                                      qryAux1.fieldbyname('PLACONTAC').asstring, //cContac
                                                      '', //sCodHist
                                                      TruncaMoeda(abs(rValorIRCorrente - rValorIROriginal)), //rValLanc
                                                      cbjunta, //bJunta
                                                      Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                                                      -1, //iIdSegregaCriter
                                                      -1 //dDataSegregaCriter
                                                      ) Then
                                                      Begin
                                                         frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                                         frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
                                                         frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                                         ProcessamentoOK := false;
                                                         break;
                                                      End;

                                                   dplncodigo := ctrlLancamento.RetornoPlnCodigo;
                                                   liPlnCodigo := round(dplncodigo);

                                                End;

                                          Except
                                             On e: exception Do
                                                Begin
                                                   frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis !!!');
                                                   frameProgresso.ExibeMensagem('Erro no processamento do lançamento contábil');
                                                   frameProgresso.ExibeMensagem(e.message);
                                                   frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                                   ProcessamentoOK := false;
                                                   break;
                                                End;
                                          End;
                                       End;
                                 End;

                              frameProgresso.Passo;
                              qryAux1.next;
                           End;
                     End
                  Else
                     frameProgresso.MarcaFinalFase('Nenhum lançamento a crédito a ser gerado.');
               Finally
                  If ProcessamentoOK Then
                     frameProgresso.MarcaFinalFase('Conclusão contabilização dos lançamentos a crédito.')
                  Else
                     frameProgresso.MarcaFinalFase('Ocorrreu problema na contabilização dos lançamentos a crédito. Verificar LOG.');
                  frameProgresso.ResetaFrame(1, 0);
               End;
            End;
      End;

   If SistemaFolha.FlgUsaProvisaoAbono Then
      Begin
         If litipofolha In [0, 5, 6] Then
            Begin
               frameProgresso.MarcaInicioFase('Geração de contabilização da provisão de abono anual.');

               //* MONTA PLANILHA CONTABIL DE PROVISÃO EM PARTIDA DOBRADA DA PREVIA */
               ssql :=
                  'SELECT SUM(H.VALORPROVENTO)/12 AS VALOR, HH.HISTORICO, ' + _clinefeed + //COLOCAR 1 DOZE AVOS NO VALOR
               '       H.IDPATRO, PI.idplanprevcontab as IDPLANOCONTABIL, H.PLANO, ' + _clinefeed +      //Peterson Victor SIG 56702
                  '       H.PLACONTACPROVIS, ' + _clinefeed +
                  '       H.PLACONTADPROVIS, ' + _clinefeed +
                  '       H.CODCCUSTOCPROVIS, ' + _clinefeed +
                  '       H.CODCCUSTODPROVIS, ' + _clinefeed +
                  '       H.UNIDNEGOC, ' + _clinefeed +
                  '       PL.NOME AS NOMEPLANO, ' + _clinefeed +
                  '       H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
                  'FROM LOTEXHSTFOLHABENEF L, PREVIA H, HSTFOLHABENEF HH, PROVDESC P, PLANPREVCONTABIL PL, perfilinvest PI  ' + _clinefeed +   //Peterson Victor SIG 56702
                  'WHERE L.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                  'AND L.FLGTIPOLOTE = ''B'' ' + _clinefeed +
                  'AND L.IDLOTE = H.IDLOTE ' + _clinefeed +
                  'AND H.FLGTEMPROVISAO = 1 ' + _clinefeed +
                  'AND L.IDHSTFOLHABENEF = HH.IDHSTFOLHABENEF ' + _clinefeed +
                  'AND H.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
                  'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                  'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                  'AND PL.IDPLANOPREV = pi.idplanprevcontab ' + _clinefeed +   //edilaine SIG56702
                  ' and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed + //Peterson Victor SIG 56702
                  'GROUP BY HH.HISTORICO, H.IDPATRO, PI.idplanprevcontab, ' + _clinefeed +        //Peterson Victor SIG 56702
                  '         H.PLANO, H.PLACONTACPROVIS, H.PLACONTADPROVIS, ' + _clinefeed +
                  '         H.CODCCUSTOCPROVIS, H.CODCCUSTODPROVIS, ' + _clinefeed +
                  '         H.UNIDNEGOC, PL.NOME, ' + _clinefeed +
                  '         H.FLGDESCONTO, H.IDRUBRICA, P.CODPROVDESC, P.DESCRICAO ' + _clinefeed +
                  'HAVING SUM(H.VALORPROVENTO) > 0 ';

               Try
                  If FazQuery(qryAux1, ssql) Then
                     Begin
                        frameProgresso.ResetaFrame(1, qryAux1.recordcount);

                        While Not qryAux1.eof Do
                           Begin
                              lsHist1 := copy(qryAux1.fieldbyname('CODPROVDESC').asstring + '-' +
                                 qryAux1.fieldbyname('DESCRICAO').asstring, 1, 40);
                              lsHist2 := copy(qryAux1.fieldbyname('NOMEPLANO').asstring, 1, 40);
                              lsHist3 := copy(qryAux1.fieldbyname('HISTORICO').asstring, 1, 40);
                              lsHist4 := '';
                              lsHist5 := '';
                              If qryAux1.fieldbyname('FLGDESCONTO').asinteger = 0 Then
                                 lsHist4 := 'Provisão Pagto Beneficio s/ Abono Anual'
                              Else
                                 lsHist4 := 'Provisão Receita Contrib s/ Abono Anual';

                              Try
                                 If Not ctrlLancamento.InsereLancaContab(
                                    '2', //cTipoLanc
                                    liEmpresa, //IdEmpresa
                                    Sistema.IdModulo, //iModuloOrigem
                                    Sistema.IdUsuario, //liUsuario
                                    IntegraBack.Plano, //liCodPlano
                                    qryAux1.fieldbyname('UNIDNEGOC').asinteger, //liUnidNegoc
                                    0, //liSubContaDeb
                                    0, //liSubContaCre
                                    qryAux1.fieldbyname('IDPLANOCONTABIL').asinteger, //iPlanoPrev
                                    qryAux1.fieldbyname('IDPATRO').asinteger, //iPatro
                                    liPlnProvisaoAbono, //liPlnCodigo
                                    0, //iNumLan
                                    sDtContabilizacao, //sDataLanc
                                    '', //sNumDoc
                                    lshist1, //sHist1
                                    lshist2, //sHist2
                                    lshist3, //sHist3
                                    lshist4, //sHist4
                                    lshist5, //sHist5
                                    prmTipCodigo, //sTipoOper
                                    qryAux1.fieldbyname('CODCCUSTODPROVIS').asstring, //cCCustd
                                    qryAux1.fieldbyname('PLACONTADPROVIS').asstring, //cContad
                                    qryAux1.fieldbyname('CODCCUSTOCPROVIS').asstring, //cCCustc
                                    qryAux1.fieldbyname('PLACONTACPROVIS').asstring, //cContac
                                    '', //sCodHist
                                    qryAux1.fieldbyname('VALOR').AsFloat, //rValLanc
                                    cbjunta, //bJunta
                                    Sistema.UsaPlanoPatro, //bUsaPlanoPatro
                                    -1, //iIdSegregaCriter
                                    -1 //dDataSegregaCriter
                                    ) Then
                                    Begin
                                       frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis para provisão de abono anual !!!');
                                       frameProgresso.ExibeMensagem(ctrlLancamento.MessageInfo);
                                       frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                       ProcessamentoOK := false;
                                       break;
                                    End;
                                 dplncodigo := ctrlLancamento.RetornoPlnCodigo;
                                 liPlnProvisaoAbono := round(dplncodigo);
                              Except
                                 On e: exception Do
                                    Begin
                                       frameProgresso.ExibeMensagem('Erro nos Parametros Contábeis para provisão de abono anual !!!');
                                       frameProgresso.ExibeMensagem('Erro no processamento do lançamento contábil');
                                       frameProgresso.ExibeMensagem(e.message);
                                       frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                                       ProcessamentoOK := false;
                                       break;
                                    End;
                              End;

                              frameProgresso.Passo;
                              qryAux1.next;
                           End;
                     End
                  Else
                     frameProgresso.MarcaFinalFase('Nenhum lançamento de provisão de abono anual a ser gerado.');

               Finally
                  If ProcessamentoOK Then
                     frameProgresso.MarcaFinalFase('Conclusão contabilização dos lançamentos de provisão de abono anual em partida dobrada.')
                  Else
                     frameProgresso.MarcaFinalFase('Ocorrreu problema na contabilização dos lançamentos de provisão de abono anual em partida dobrada. Verificar LOG.');
                  frameProgresso.ResetaFrame(1, 0);
               End;
            End;
      End;

   If Not abregera Then
      If ProcessamentoOK Then
         GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraDocumentos,
            liplncodigo, liplnprovisaoabono, 0);
   If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      frameProgresso.FazCommit(false);
End;

//processa geração dos documentos financeiros

Procedure TfrmFolhaNormalEfet.ProcessaDocumentos(aiidhistorico: integer);
Var ssqldoc, ssqldetdoc: String;
   bmultiplaconta: Boolean;
   splacontabaixa: String;
   idcbancaria: Integer;
   lrvalordoc: Real;
   linumreg: Integer;
   iDFLOATPROG: Integer;
   dDtProgramada: TDateTime;
   ContDias: Integer;
   liseqdocumento: Integer;
   ldtlanc: TDateTime;
    iIDPLANPREVCONTAB: Integer; //Peterson Victor SIG56702
   Begin
   frameProgresso.IntervaloCommit := 0;
   ProcessamentoOK := true;

   If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.starttransaction;

   GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraDocumentos,
      liplncodigo, liplnprovisaoabono, 0);

   ldtlanc := date;

   If StrToDate(sDtVencimento) < Date Then // Renato Visoni Sol 108334 / Kintana 488340 dptDtVencimento.date < date
      // Renato Visoni Sol 108334 / Kintana 488340 ldtlanc :=dptDtVencimento.date;
      ldtlanc := StrToDate(sDtVencimento);

   ssqldoc := 'SELECT H.HISTORICO, HC.IDFAVDOC, HC.DFLOATPAGTO, HC.DFLOATPAGTOALTER, ' + _clinefeed +
      '       HC.CODPORTFORMA, HC.TIPOPORTADOR, ' + _clinefeed +
      '       P.DESCRICAO, F.NOME, ' + _clinefeed +
      '       HC.SEQDOCUMENTO, ' + _clinefeed +
      '       HC.IDHSTFOLHABENEFCAP, P.CODFORMA, ' + _clinefeed +
      '       NVL(HC.DFLOATPROG,0) AS DFLOATPROG ' + _clinefeed +
      'FROM HSTFOLHABENEF H, HSTFOLHABENEFCAP HC, PORTADORFORMA P, PESSOA F ' + _clinefeed +
      'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
      'AND H.IDHSTFOLHABENEF = HC.IDHSTFOLHABENEF ' + _clinefeed +
      'AND HC.CODPORTFORMA = P.CODPORTFORMA ' + _clinefeed +
      'AND P.RECPAG = ''P'' ' + _clinefeed +
      'AND F.IDPESSOA(+) = HC.IDFAVDOC ' + _clinefeed +
      'ORDER BY HC.TIPOPORTADOR, HC.CODPORTFORMA, HC.IDFAVDOC, HC.SEQDOCUMENTO ';

   frameProgresso.MarcaInicioFase('Geração dos documentos financeiros.');

   If FazQuery(qryProcesso, ssqldoc) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         Try
            liseqdocumento := 0;

            While Not qryProcesso.eof Do
               Begin
                  CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
                  CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
                  CtrlDocumento.IdUsuario := Sistema.IdUsuario;

                  ssqldoc := 'SELECT F.IDPESSOA ' + _clinefeed +
                     'FROM EMPRESAFORN E, FORNSERV F ' + _clinefeed +
                     'WHERE E.IDFORCLI = F.IDPESSOA ' + _clinefeed +
                     ' AND F.IDPESSOA = ' +
                     inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + _clinefeed;

                  If Not FazQuery(qryAux1, ssqldoc) Then
                     CtrlDocumento.ForCli.Inserir(qryProcesso.fieldbyname('IDFAVDOC').asinteger, Sistema.IdEmpresa,
                        -1, IntegraBack.Plano, prmIdRamoTipoFor, '', '', '', '', tfcFornecedor);

                  //obtem conta bancaria do favorecido individual
                  If (qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O') Or
                     //TRATA PORTDOR PATROCINADORA
                  (qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P') Then
                     Begin
                        If FazQuery(qryAux1, 'SELECT IDCBANCARIA ' +
                           'FROM CONTABANCARIA ' +
                           'WHERE FLGCONTAPREF = 1 ' +
                           'AND IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger)) Then
                           idcbancaria := qryAux1.fieldbyname('IDCBANCARIA').asinteger
                        Else
                           idcbancaria := 0;
                     End
                  Else
                     idcbancaria := 0;

                  //IDENTIFICA SE TEM UMA CONTA DE BAIXA
                  ssqldetdoc := ' SELECT DISTINCT PLACONTA ' + _clinefeed +
                     ' FROM ( ' + _clinefeed +
                     '       SELECT H.FLGDESCONTO, H.VALORPROVENTO, ' + _clinefeed +
//                     '              LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,PLACONTAD))) AS PLACONTA ' + _clinefeed + //Everson TIBERO
                     '              LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,H.PLACONTAD))) AS PLACONTA ' + _clinefeed + //Everson TIBERO
                     '       FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP ' + _clinefeed +
                     '       WHERE H.IDHSTFOLHABENEF    = ' + IntToStr(aiidhistorico) + ' ' + _clinefeed +
                     '         AND HCAP.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ' + _clinefeed +
                     '         AND H.FLGESPECIAL        = 0 ' + _clinefeed +
                     '         AND H.FLGDESCONTO        IN (0,1) ' + _clinefeed +
                     '         AND HCAP.IDFAVDOC        = ' + IntToStr(qryProcesso.FieldByName('IDFAVDOC').AsInteger) + ' ' + _clinefeed +
                     '         AND HCAP.CODPORTFORMA    = ' + IntToStr(qryProcesso.FieldByName('CODPORTFORMA').AsInteger) + ' ' + _clinefeed;

                  If qryProcesso.FieldByName('TIPOPORTADOR').AsString = 'O' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO ';

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDPATRO ';

                  ssqldetdoc := ssqldetdoc +
                  //ATENÇÃO O CAMPO IDCBANCARIA ESTAVA DESATIVADO E FOI USADO PARA GUARDAR
                  // TEMPORARIAMENTE O SEQDOCUMENTO PARA IDENTIFICAR O DOCUMENTO A SER CRIADO
                  '         AND HCAP.SEQDOCUMENTO    = H.IDCBANCARIA ' + _clinefeed +
                     '         AND HCAP.SEQDOCUMENTO    = ' + IntToStr(qryProcesso.FieldByName('SEQDOCUMENTO').AsInteger) + ' ' + _clinefeed +
                     '         AND HCAP.CODPORTFORMA    = H.CODPORTFORMA) ' + _clinefeed;

                  // SOL 129635 - Daniel Begnami
                  qryAux10.close;
                  qryAux10.sql.Clear;
                  qryAux10.sql.add(ssqldetdoc);
                  qryAux10.open;

                  if qryAux10.RecordCount > 0 then
                  begin
                    if qryAux10.RecordCount > 1 then
                    begin
                      bmultiplaconta := True;
                      splacontabaixa:='';
                    end
                    else
                    begin
                      bmultiplaconta := False;
                      splacontabaixa := qryAux10.FieldByName('PLACONTA').AsString;
                    end;
                  end
                  // FIM - SOL 129635 - Daniel Begnami
                  else
                  begin
                    frameProgresso.ExibeMensagem('Erro na busca das contas de baixa.');
                    frameProgresso.ExibeMensagem('Favorecido:'+
                                                 IntToStr(qryProcesso.FieldByName('IDFAVDOC').AsInteger) + '-' +
                                                 qryProcesso.fieldbyname('NOME').AsString);
                    frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:'+
                                                 IntToStr(qryProcesso.FieldByName('CODPORTFORMA').AsInteger) + '-' +
                                                 qryProcesso.fieldbyname('DESCRICAO').AsString);
                    ProcessamentoOK:=false;
                    exit;
                  end;

                  dDtProgramada := strTodate(sDtProgramada); //dptDtProgramada.date;
                  For ContDias := 1 To qryProcesso.fieldbyname('DFLOATPROG').AsInteger Do
                     Begin
                        While True Do
                           Begin
                              dDtProgramada := dDtProgramada - 1;
                              If DiasUteis.DiaUtil(dDtProgramada, -1, -1, '', True, True, False) Then Break;
                           End;
                     End;

                  inc(liseqdocumento);

                  CtrlDocumento.SetValues(0, //licoddocumento
                     StrToFloat(inttostr(aiidhistorico) +
                     inttostr(liseqdocumento) +
                     inttostr(qryProcesso.FieldByName('IDFAVDOC').AsInteger)
                     ), //rnodocumento
                     '', //scompldocumento
                     '0', // sStatus
                     'P', // recpag
                     '2', // sOperacao
                     '', //sNumslip,
                     '', //sNumleitcodbarras,
                     splacontabaixa, //sPlaconta,
                     '', //sCodcentrocusto,
                     '', //sNossonumero,
                     '', //sNumdigcodbarras,
                     '', //sGrupodoc,
                     '', //sFlgemitelancbaix,
                     '', //sFlgconfirmarecpag,
                     '', //sEmisbloq,
                     '', //sReferencia,
                     '', //sObs
                     strToDate(sDtVencimento), //dDatavencto,
                     date, //dDataemissao,
                     dDtProgramada, //dDataprogramada,
                     0, //dDataremessa,
                     0, //dDatalimite,
                     0, //dDatacorrecao,
                     0, //rVlrmulta,
                     0, //rValorjuros,
                     0, //rValordesconto,
                     0, //rPercjurossimples,
                     0, //rPercjurosatuarial
                     StrToInt(prmCodTipDoc), //liCodtipdoc,
                     Sistema.IdEmpresa, //liIdpessoa,
                     Sistema.idmodulo, //liIdmodulo,
                     qryProcesso.fieldbyname('IDFAVDOC').asinteger, //liIdforcli,
                     0, //liNumfatura,
                     idcbancaria, //liIdcbancaria,
                     prmUnidNegoc, //-1, //liUnidnegoc,
                     IntegraBack.Plano, //liPlano,
                     0, //liNumcpbaixa,
                     0, //liNumapgr,
                     0, //liMoecodigo,
                     0, //liLotetransmissao,
                     0, //liIndicecorrecao,
                     Sistema.Idusuario, //liIdusuarioinclusao,
                     Sistema.IdEmpresa, //liIdempresa,
                     0, //liFlgnaoconciliado,
                     0, //liControleremessa,
                     0, //liCodsubconta,
                     qryProcesso.fieldbyname('CODPORTFORMA').asinteger, //liCodportforma,
                     0, //liCodgrupocnab,
                     0, //liCodgeradorinss,
                     qryProcesso.fieldbyname('CODFORMA').asinteger //liCodforma
                     // -1 //iIdSegregaCriter
                     );

                  //GERA CCBAIXASXDOCUM SE TEM MAIS DE UMA CONTA DE BAIXA
                  If bmultiplaconta Then
                     Begin
                        //* MONTA CONTAS DE LIQUIDO POR LANÇAMENTO DE DOCUMENTO DA HISTRUBSAL */
                        ssqldetdoc :=
                           'SELECT ' + _clinefeed +
                           'SUM(DECODE(FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR, ' + _clinefeed +
                           'PLACONTA ' + _clinefeed +
                           'FROM ( ' + _clinefeed +
                           'SELECT H.FLGDESCONTO, H.VALORPROVENTO, ' + _clinefeed +
//                           'LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,PLACONTAD))) AS PLACONTA ' + _clinefeed + //Everson TIBERO
                           'LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,H.PLACONTAD))) AS PLACONTA ' + _clinefeed + //Everson TIBERO
                           'FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP ' + _clinefeed +
                           'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                           'AND HCAP.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ' + _clinefeed +
                           'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                           'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                           'AND HCAP.IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed +
                           'AND HCAP.CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ' ' + _clinefeed;

                        If qryProcesso.FieldByName('TIPOPORTADOR').AsString = 'O' Then
                           ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO ';

                        If qryProcesso.FieldByName('TIPOPORTADOR').AsString = 'P' Then
                           ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDPATRO ';

                        ssqldetdoc := ssqldetdoc +
                           'AND HCAP.SEQDOCUMENTO = H.IDCBANCARIA ' + _clinefeed +
                           'AND HCAP.SEQDOCUMENTO = ' + inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ' ' + _clinefeed +
                           'AND HCAP.CODPORTFORMA = H.CODPORTFORMA) ' + _clinefeed +
                           'GROUP BY PLACONTA ' + _clinefeed;

                        If FazQuery(qryAux1, ssqldetdoc) Then
                           Begin
                              frameProgresso.ExibeMensagem('');
                              frameProgresso.ExibeMensagem('Lançando múltiplas contas de baixa para documento gerado.');
                              frameProgresso.ExibeMensagem('Favorecido:' +
                                 IntToStr(qryProcesso.FieldByName('IDFAVDOC').AsInteger) + '-' +
                                 qryProcesso.FieldByName('NOME').AsString);
                              frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:' +
                                 IntToStr(qryProcesso.FieldByName('CODPORTFORMA').AsInteger) + '-' +
                                 qryProcesso.FieldByName('DESCRICAO').AsString);

                              //inclui plano e patro
                              ssqldetdoc :=
                                 'SELECT ' + _clinefeed +
                                 '       SUM(DECODE(FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR, ' + _clinefeed +
                                 '       UNIDNEGOC, ' + _clinefeed +
                                 '       PLACONTA, IDPLANOCONTABIL, IDPATRO ' + _clinefeed +
                                 'FROM ( ' + _clinefeed +
                                 '  SELECT H.FLGDESCONTO, H.VALORPROVENTO, PI.idplanprevcontab as IDPLANOCONTABIL , H.IDPATRO, ' + _clinefeed +
                                 '         NVL(H.UNIDNEGOC,' + inttostr(prmUnidNegoc) + ') AS UNIDNEGOC, ' + _clinefeed +
//                                 '         LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,PLACONTAD))) AS PLACONTA ' + _clinefeed + //Everson TIBERO
                                 '         LTRIM(RTRIM(DECODE(H.FLGDESCONTO,0,H.PLACONTAC,1,H.PLACONTAD))) AS PLACONTA ' + _clinefeed + //Everson TIBERO
                                 '  FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP, perfilinvest PI  ' + _clinefeed +
                                 '  WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                                 '  AND HCAP.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ' + _clinefeed +
                                 '  AND H.FLGESPECIAL = 0 ' + _clinefeed +
                                 '  AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                                 '  AND HCAP.IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed +
                                 '  AND HCAP.CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ' ' + _clinefeed;

                              If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O' Then
                                 ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO ';

                              If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P' Then
                                 ssqldetdoc := ssqldetdoc + '  AND HCAP.IDFAVDOC = H.IDPATRO ';

                              ssqldetdoc := ssqldetdoc +
                                 '  AND HCAP.SEQDOCUMENTO = H.IDCBANCARIA ' + _clinefeed +
                                 '  AND HCAP.SEQDOCUMENTO = ' + inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ' ' + _clinefeed +
                                 '  and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed +
                                 '  AND HCAP.CODPORTFORMA = H.CODPORTFORMA) ' + _clinefeed +
                                 'GROUP BY PLACONTA, UNIDNEGOC, IDPLANOCONTABIL, IDPATRO ' + _clinefeed;

                              If FazQuery(qryAux1, ssqldetdoc) Then
                                 Begin
                                    While (Not qryAux1.eof) Do
                                       Begin
                                          CtrlDocumento.CCBaixasXDocum.SetValues(qryAux1.FieldByName('VALOR').AsFloat, //rValor,
                                             0, //liIdCcBaixasxDocum,
                                             Sistema.Idempresa, //liIdpessoa,
                                             0, //liCodDocumento,
                                             qryAux1.FieldByName('UNIDNEGOC').AsInteger, //-1, //liUnidNegoc,
                                             IntegraBack.Plano, //liPlano,
                                             qryAux1.FieldByName('IDPLANOCONTABIL').AsInteger, //liIdplanoPrev,
                                             qryAux1.FieldByName('IDPATRO').Asinteger, //liIdPatro,
                                             -1, //liIdSegregaCriter,
                                             qryAux1.FieldByName('PLACONTA').AsString //sPlaConta
                                             );

                                          qryAux1.next;
                                       End;
                                 End;
                           End
                        Else
                           Begin
                              frameProgresso.ExibeMensagem('');
                              frameProgresso.ExibeMensagem('Nenhuma conta de baixa com valor para documento gerado.');
                              frameProgresso.ExibeMensagem('Favorecido:' +
                                 inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + '-' +
                                 qryProcesso.fieldbyname('NOME').asstring);
                              frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:' +
                                 inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + '-' +
                                 qryProcesso.fieldbyname('DESCRICAO').asstring);
                              frameProgresso.ExibeMensagem('---------------------------------------------------------------------');
                           End;
                     End
                  Else
                     Begin
                        frameProgresso.ExibeMensagem('');
                        frameProgresso.ExibeMensagem(
                           'Documento com apenas uma conta de baixa: ' + splacontabaixa);
                        frameProgresso.ExibeMensagem('Favorecido:' +
                           inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + '-' +
                           qryProcesso.fieldbyname('NOME').asstring);
                        frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:' +
                           inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + '-' +
                           qryProcesso.fieldbyname('DESCRICAO').asstring);
                     End;

                  //* MONTA LANÇAMENTO DE DOCUMENTO DOCUMENTO DA HISTRUBSAL */
                  ssqldetdoc :=
                     'SELECT ' + _clinefeed +
                     'SUM(DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO,0)) AS VALOR ' + _clinefeed +
                     'FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP ' + _clinefeed +
                     'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                     'AND HCAP.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ' + _clinefeed +
                     'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                     'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                     'AND HCAP.IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed +
                     'AND HCAP.CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ' ' + _clinefeed +
                     //ATENÇÃO O CAMPO IDCBANCARIA ESTAVA DESATIVADO E FOI USADO PARA GUARDAR
               // TEMPORARIAMENTE O SEQDOCUMENTO PARA IDENTIFICAR O DOCUMENTO A SER CRIADO
                  // BRUNO AZEVEDO SOL 137211 KINTANA 829681
                  // 'AND HCAP.SEQDOCUMENTO = H.IDCBANCARIA ' + _clinefeed +
                     'AND HCAP.SEQDOCUMENTO = ' + inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ' ' + _clinefeed +
                     'AND HCAP.CODPORTFORMA = H.CODPORTFORMA ' + _clinefeed;

                  // Andre Imakawa - SIG 35803 - Inicio
                  {
                  //MARCIO DENILSON SOL 163938 KINTANA 1410369
                  If qryProcesso.fieldbyname('CODPORTFORMA').asstring = '189' Then  begin
                     //if not rdgProcessar.ItemIndex = 7 then begin // Thiago Melo SOL 203937 Kintana 1974720 // SOL 214523 Kintana 2043162
                     if not(rdgProcessar.ItemIndex = 7) then begin // SOL 214523 Kintana 2043162
                       ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO '
                     end;
                  end
                  Else
                  //FIM MARCIO DENILSON SOL 163938 KINTANA 1410369
                  }
                  // Andre Imakawa - SIG 35803 - Fim

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO '

                  //MARCIO DENILSON SOL 163938 KINTANA 1410369
                  Else
                  //FIM MARCIO DENILSON SOL 163938 KINTANA 1410369

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDPATRO ';

//                  ssqldetdoc := ssqldetdoc + ' GROUP BY IDPESSOA'; //Thiago Passos

                  If FazQuery(qryAux1, ssqldetdoc) Then
                     Begin
                        While (Not qryAux1.EOF) Do
                           Begin
                              lrvalordoc := qryAux1.fieldbyname('VALOR').asfloat;

                              CtrlDocumento.Lanctodocum.SetValues(
                                 ldtlanc, //dDatalancto
                                 0, //liCoddocumento,
                                 0, //liNumlancto
                                 qryAux1.fieldbyname('VALOR').asfloat, //rVlrliquido,
                                 0, //rValorOM
                                 qryAux1.fieldbyname('VALOR').asfloat, //rValor
                                 prmUnidNegoc, //-1, //liUnidnegoc,
                                 liPlncodigo, //liPlncodigo
                                 0, //liNumlotemanual,
                                 Sistema.Idusuario, //liIdusuarioinclusao,
                                 Sistema.IdEmpresa, //liIdempresa,
                                 0, //liIdnflivro,
                                 0, //liEstorno,
                                 0, //liCodtipdoc,
                                 0, //liCoddocinss,
                                 0, //liCodalterador
                                 '2', //sOperacao,
                                 '', //sNumrecibo,
                                 '', //sNumnf,
                                 '', //sNumfatura,
                                 copy(qryProcesso.fieldbyname('HISTORICO').asstring, 1, 60), //sHistoricocompl,
                                 '', //sFlgtipofatura,
                                 '', //sFlgrecebeunf,
                                 '', //sFlgfatemitida,
                                 'C', //sDebcre
                                 Sistema.idmodulo, //liIdModulo
                                 IntegraBack.Plano, //liPlanoConta
                                 true, //bUsaPlanoPatro
                                 false, //bContabiliza
                                 0, //iCodPortForma,
                                 0, //iDiasFloat
                                 '', //splacontabaixa, //sContaBaixa
                                 0 //liSubContaBaixa
                                 );

                              qryAux1.Next;
                           End;
                     End;

                  //* MONTA RATEIO DE DOCUMENTO DA HISTRUBSAL */
                  ssqldetdoc :=
//                     'SELECT SUM(DECODE(H.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR, ' + _clinefeed +   //Everson TIBERO
                     'SELECT SUM(DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO,1,-H.VALORPROVENTO,0)) AS VALOR, ' + _clinefeed + //Everson TIBERO

                  //   'H.IDPATRO, H.IDPLANOCONTABIL, ' + _clinefeed +
                  'H.IDPATRO,PI.idplanprevcontab as IDPLANOCONTABIL, ' + _clinefeed +
                     'H.CODTIPRECDES,(SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM=''CODCENTRORESPON'') AS CODCENTRORESPON, H.UNIDNEGOC ' + _clinefeed + // Renato Visoni SOL 107549 \ Kintana 483466
//                     'H.IDPESSOA, H.CODPORTFORMA, H.IDHSTFOLHABENEF ' + _clinefeed + //Peterson Victor - SIG56702
                  'FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP, perfilinvest PI ' + _clinefeed +
                     'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                     'AND HCAP.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ' + _clinefeed +
                     'AND H.FLGESPECIAL = 0 ' + _clinefeed +
                     'AND H.FLGDESCONTO IN (0,1) ' + _clinefeed +
                     'AND HCAP.IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed +
                     'AND HCAP.CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ' ' + _clinefeed +
                     //ATENÇÃO O CAMPO IDCBANCARIA ESTAVA DESATIVADO E FOI USADO PARA GUARDAR
               // TEMPORARIAMENTE O SEQDOCUMENTO PARA IDENTIFICAR O DOCUMENTO A SER CRIADO
                  // BRUNO AZEVEDO SOL 137211 KINTANA 829681
                  // 'AND HCAP.SEQDOCUMENTO = H.IDCBANCARIA ' + _clinefeed +
                     'AND HCAP.SEQDOCUMENTO = ' + inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ' ' + _clinefeed +
                     'AND HCAP.CODPORTFORMA = H.CODPORTFORMA ' + _clinefeed +
                     'and pi.idperfilinvest = h.idperfilinvest ' + _clinefeed;
                     
                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO ';
                  // Andre Imakawa - SIG 35803 - Inicio
                  {
                  //MARCIO DENILSON SOL 178922 KINTANA 1645281
                  If qryProcesso.fieldbyname('CODPORTFORMA').asstring = '189' Then begin
                     //if not rdgProcessar.ItemIndex = 7 then begin // Thiago Melo SOL 203937 Kintana 1974720 // SOL 214523 Kintana 2043162
                     if not(rdgProcessar.ItemIndex = 7) then begin // SOL 214523 Kintana 2043162
                      ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO '
                    end;
                  //FIM MARCIO DENILSON SOL 178922 KINTANA 1645281
                  end

                  //MARCIO DENILSON SOL 178922 KINTANA 1645281
                  Else
                  }
                  // Andre Imakawa - SIG 35803 - Fim

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O' Then
                  //FIM MARCIO DENILSON SOL 178922 KINTANA 1645281
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO '

                  //MARCIO DENILSON SOL 178922 KINTANA 1645281
                  Else If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P' Then
                  //FIM MARCIO DENILSON SOL 178922 KINTANA 1645281
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDPATRO ';

                  ssqldetdoc := ssqldetdoc +
                     'GROUP BY H.IDPATRO, PI.idplanprevcontab, H.CODTIPRECDES, ' + _clinefeed +
                     'H.UNIDNEGOC ' + _clinefeed; // H.CODCENTRORESPON  Renato Visoni SOL 107549 \ Kintana 483466

                  If FazQuery(qryAux1, ssqldetdoc) Then
                     Begin
                        While (Not qryAux1.eof) Do
                           Begin


                              CtrlDocumento.Rateiodocum.SetValues(qryAux1.fieldbyname('VALOR').asfloat, //rValor,
                                 0, //rValorOM,
                                 0, //rVlrresorcamen: Double;
                                 0, //liIdrateiodocum,
                                 Sistema.Idempresa, //liIdpessoa,
                                 0, //liCoddocumento,
                                 qryAux1.fieldbyname('UNIDNEGOC').asinteger, //liUnidnegoc,
                                 0, //liMoecodigo,
                                 Sistema.Idusuario, //liIdusuarioinclusao,
                                 0, //liIdreservaorcamen,
                                 Integraback.Plano, //liPlano,
                                 qryAux1.fieldbyname('IDPLANOCONTABIL').asinteger, //liIdplanoprev,
                                 qryAux1.fieldbyname('IDPATRO').asinteger, //liIdpatro,
                                 SistemaFolha.IdProgramaFolha, //liIdprograma,
                                 0, //liIdprocesso,
                                 Sistema.idempresa, //liIdempresa
                                 qryAux1.fieldbyname('CODTIPRECDES').asstring, //sCodtiprecdes,
                                 'P', //sRecpag,
                                 qryAux1.fieldbyname('CODCENTRORESPON').asstring, //sCodcentrorespon,
                                 SistemaFolha.CODCCUSTOFINAN, //sCodcentrocusto,
                                 '' //sNumimovel
                                 );

                              qryAux1.Next;
                           End;
                     End;

                  Try
                     If Not CtrlDocumento.Insert Then
                        Begin
                           frameProgresso.ExibeMensagem('Erro ao criar documento.');
                           frameProgresso.ExibeMensagem('Favorecido:' +
                              inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + '-' +
                              qryProcesso.fieldbyname('NOME').asstring);
                           frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:' +
                              inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + '-' +
                              qryProcesso.fieldbyname('DESCRICAO').asstring);
                           frameProgresso.ExibeMensagem(CtrlDocumento.MessageInfo);
                           ProcessamentoOK := false;
                           exit;
                        End;
                  Except
                     On E: Exception Do
                        Begin
                           frameProgresso.ExibeMensagem('Erro ao criar documento.');
                           frameProgresso.ExibeMensagem('Favorecido:' +
                              inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + '-' +
                              qryProcesso.fieldbyname('NOME').asstring);
                           frameProgresso.ExibeMensagem('Contas Caixa x Forma Pagto:' +
                              inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + '-' +
                              qryProcesso.fieldbyname('DESCRICAO').asstring);
                           frameProgresso.ExibeMensagem(CtrlDocumento.MessageInfo);
                           frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.Message);
                           ProcessamentoOK := false;
                           break;
                        End;
                  End;

                  ssqldetdoc :=
                     'SELECT ' + _clinefeed +
                     'COUNT(DISTINCT H.IDRESPONSAVEL) AS NUMREG ' + _clinefeed +
                     'FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP ' + _clinefeed +
                     'WHERE H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                     'AND HCAP.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ' + _clinefeed +
                     'AND HCAP.IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed +
                     'AND HCAP.CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ' ' + _clinefeed +
                     //ATENÇÃO O CAMPO IDCBANCARIA ESTAVA DESATIVADO E FOI USADO PARA GUARDAR
               // TEMPORARIAMENTE O SEQDOCUMENTO PARA IDENTIFICAR O DOCUMENTO A SER CRIADO
                  'AND HCAP.SEQDOCUMENTO = H.IDCBANCARIA ' + _clinefeed +
                     'AND HCAP.SEQDOCUMENTO = ' + inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ' ' + _clinefeed +
                     'AND HCAP.CODPORTFORMA = H.CODPORTFORMA ' + _clinefeed;

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDRECEBEPGTO ';

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P' Then
                     ssqldetdoc := ssqldetdoc + 'AND HCAP.IDFAVDOC = H.IDPATRO ';

                  If FazQuery(qryAux1, ssqldetdoc) Then
                     linumreg := qryAux1.fieldbyname('NUMREG').asinteger
                  Else
                     linumreg := 0;

                  GravaHstFolhaBenefCAP(aiidhistorico,
                     CtrlDocumento.CodDocumento,
                     qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger,
                     linumreg,
                     qryProcesso.fieldbyname('CODPORTFORMA').asinteger,
                     liplncodigo,
                     qryProcesso.fieldbyname('DFLOATPAGTO').asinteger,
                     qryProcesso.fieldbyname('DFLOATPAGTOALTER').asinteger,
                     qryProcesso.fieldbyname('IDFAVDOC').asinteger,
                     iDFLOATPROG,
                     lrvalordoc,
                     '',
                     qryProcesso.fieldbyname('TIPOPORTADOR').asstring);

                  ssqldetdoc :=
                     'UPDATE HISTRUBSAL ' + _clinefeed +
                     'SET CODDOCUMENTO = ' + floattostr(CtrlDocumento.CodDocumento) + ', ' + _clinefeed +
                     '    IDCBANCARIA = NULL ' + _clinefeed +
                     'WHERE IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
                     'AND CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ' ' + _clinefeed +
                     //ATENÇÃO O CAMPO IDCBANCARIA ESTAVA DESATIVADO E FOI USADO PARA GUARDAR
               // TEMPORARIAMENTE O SEQDOCUMENTO PARA IDENTIFICAR O DOCUMENTO A SER CRIADO
                  'AND IDCBANCARIA = ' + inttostr(qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger) + ' ' + _clinefeed;

                  //BRUNO AZEVEDO SOL 134131 KINTANA 786673

                  //BRUNO AZEVEDO SOL 134696 KINTANA 796614
                  if (qryProcesso.fieldbyname('CODPORTFORMA').asinteger = 189) or
                     (qryProcesso.fieldbyname('CODPORTFORMA').asinteger = 165) or
                     (qryProcesso.fieldbyname('CODPORTFORMA').asinteger = 139) or
                     (qryProcesso.fieldbyname('CODPORTFORMA').asinteger = 102) or
                     (qryProcesso.fieldbyname('CODPORTFORMA').asinteger =  72)  then begin
                    ssqldetdoc := ssqldetdoc + 'AND IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed;// Andre Imakawa - SIG 29797
                  end;

                  // Andre Imakawa - SIG 35803 - Inicio
                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'A' Then
                     ssqldetdoc := ssqldetdoc + 'AND IDFAVDOC = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger) + ' ' + _clinefeed;
                  // Andre Imakawa - SIG 35803 - Fim

                 // Thiago Passo SOL 131811 Kintana 753556

                  // if  ((qryProcesso.fieldbyname('CODPORTFORMA').asinteger <> 96) or       // SOL 129635 - Daniel Begnami
                  //    (qryProcesso.fieldbyname('CODPORTFORMA').asinteger <> 92)) then
                  //  ssqldetdoc := ssqldetdoc + ' AND IDPESSOA ='+IntToStr(qryProcesso.fieldbyname('IDFAVDOC').asinteger);

                // FIM Thiago Passo SOL 131811 Kintana 753556

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'O' Then
                     ssqldetdoc := ssqldetdoc + 'AND IDRECEBEPGTO = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger);

                  If qryProcesso.fieldbyname('TIPOPORTADOR').asstring = 'P' Then
                     ssqldetdoc := ssqldetdoc +
                        'AND IDPATRO = ' + inttostr(qryProcesso.fieldbyname('IDFAVDOC').asinteger);

                  If Not ExecutarQuery(qryAux1, ssqldetdoc) Then
                     Begin
                        frameProgresso.ExibeMensagem('Erro ao gravar o documento no histórico de pagamentos.');
                     End;

                  frameProgresso.ExibeMensagem('Documento criado código: ' + floattostr(CtrlDocumento.CodDocumento));

                  frameProgresso.Passo;
                  qryProcesso.next;
               End;

         Finally
            If ProcessamentoOK Then
               Begin
                  //COLOCA NO PRÓXIMO ESTADO
                  GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraArquivos,
                     liplncodigo, liplnprovisaoabono, 0);

                  frameProgresso.MarcaFinalFase('Conclusão da gravação dos documentos a pagar.');
                  If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
                     frameProgresso.FazCommit(false);
               End
            Else
               Begin
                  //EFETUA ROLLBACK SE ERRO
                  frameProgresso.MarcaFinalFase('Ocorreu um problema na gravação dos documentos a pagar. Verificar LOG.');
                  dtmBaseDados.dbBaseDados.rollback;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.starttransaction;
               End;
            frameProgresso.ResetaFrame(1, 0);
         End;
      End
   Else
      frameProgresso.MarcaFinalFase('Nenhum documento a ser gerado.');
End;

Procedure TfrmFolhaNormalEfet.AlimentaRegistroParaArquivoEletronico;
Var sLogradouro, sNumero, sComplemento, sBairro,
   sCidade, sCodestado, sCep, sNumdocumento, sNomeRecebedor,
      sMatricula, sContaCorrente, sAgencia, sBanco,
      sTipoConta, sNomeAgencia: String;
Begin
   sLOGRADOURO := '';
   sNUMERO := '';
   sCOMPLEMENTO := '';
   sBAIRRO := '';
   sCIDADE := '';
   sCODESTADO := '';
   sCEP := '';
   sNumdocumento := '';
   qryDadosRec.Close;
   qryDadosRec.parambyname('IDRESPONSAVEL').asinteger :=
      qryAux1.fieldbyname('IDRESPONSAVEL').asinteger;
   qryDadosRec.Open;

   If Not qryDadosRec.isempty Then
      Begin
         sLOGRADOURO := qryDadosRec.FieldByName('LOGRADOURO').AsString;
         sNUMERO := qryDadosRec.FieldByName('NUMERO').AsString;
         sCOMPLEMENTO := qryDadosRec.FieldByName('COMPLEMENTO').AsString;
         sBAIRRO := qryDadosRec.FieldByName('BAIRRO').AsString;
         sCIDADE := qryDadosRec.FieldByName('CIDADE').AsString;
         sCODESTADO := qryDadosRec.FieldByName('CODESTADO').AsString;
         sCEP := qryDadosRec.FieldByName('CEP').AsString;
         sNumdocumento := qryDadosRec.FieldByName('NUMDOCUMENTO').AsString;
         While length(sNumdocumento) < 11 Do
            sNumdocumento := '0' + sNumDocumento;
         sNomeRecebedor := qryDadosRec.FieldByName('NOME').AsString;
      End
   Else
      Begin
         frameProgresso.ExibeMensagem(
            'Informações do recebedor ' +
            qryAux1.fieldbyname('IDRESPONSAVEL').asstring +
            ' inexistentes (linha ignorada).');
         exit;
      End;

   qryDadosAg.close;
   qryDadosAg.SQL.clear;
   qryDadosAg.SQL.add('SELECT 1 AS TIPOCONTA, PA.NOME AS NOMEAGENCIA ');
   qryDadosAg.SQL.add('FROM AGENCIABANCARIA AG, BANCO BA, PESSOA PA ');
   qryDadosAg.SQL.add('WHERE AG.NUMAGENCIA = ''' + qryAux1.fieldbyname('NUMAGENCIA').asstring + '''');
   qryDadosAg.SQL.add('AND BA.NUMBANCO = ''' + qryAux1.fieldbyname('NUMBANCO').asstring + '''');
   qryDadosAg.SQL.add('AND BA.IDPESSOA = AG.IDBANCO ');
   qryDadosAg.SQL.add('AND PA.IDPESSOA = AG.IDPESSOA ');
   qryDadosAg.Open;

   If Not qryDadosAg.isempty Then
      Begin
         sTipoConta := qryDadosAg.FieldByName('TIPOCONTA').AsString;
         sNomeAgencia := qryDadosAg.FieldByName('NOMEAGENCIA').AsString;
      End
   Else
      Begin
         frameProgresso.ExibeMensagem(
            'Informações de banco e agência ' +
            qryAux1.fieldbyname('NUMBANCO').asstring + '/' +
            qryAux1.fieldbyname('NUMAGENCIA').asstring +
            ' inexistentes (linha ignorada).');
         exit;
      End;

   sBanco := qryAux1.FieldByName('NUMBANCO').AsString;
   sAgencia := qryAux1.FieldByName('NUMAGENCIA').AsString;
   While length(sAgencia) < 5 Do
      sAgencia := sAgencia + '&';
   sContaCorrente := qryAux1.FieldByName('CONTACORRENTE').AsString;
   Try
      inc(liseqregistroarquivo);
      cdsDocTxt.Insert;
      cdsDocTxt.FieldByName('CONTALIQUIDO').AsString := '';
      cdsDocTxt.FieldByName('IDPESSOA').AsInteger :=
         qryAux1.fieldbyname('IDRESPONSAVEL').asinteger;
      //Testes NAS ATRIBUIÇÕES PARA MANTER CAMPOS NULOS PARA VALIDAÇÃO DO ARQUIVO
      If trim(sNomeRecebedor) <> '' Then
         cdsDocTxt.FieldByName('NOME').AsString := sNomeRecebedor;
      If trim(sNomeRecebedor) <> '' Then
         cdsDocTxt.FieldByName('RAZAOSOCIAL').AsString := sNomeRecebedor;
      If trim(sNumdocumento) <> '' Then
         cdsDocTxt.FieldByName('NUMDOCUMENTO').AsString := sNumdocumento;
      If trim(sContaCorrente) <> '' Then
         cdsDocTxt.FieldByName('CONTACORRENTE').AsString := sContaCorrente;
      If trim(sBanco) <> '' Then
         cdsDocTxt.FieldByName('CODBANCOFAVORECIDO').AsString := sBanco;
      If trim(sAgencia) <> '' Then
         cdsDocTxt.FieldByName('NUMAGENCIA').AsString := sAgencia;
      cdsDocTxt.FieldByName('IDFORCLI').AsInteger :=
         qryAux1.fieldbyname('IDRESPONSAVEL').asinteger;
      If trim(sTipoConta) <> '' Then
         cdsDocTxt.FieldByname('TIPOCONTA').AsString := sTipoConta;
      If trim(sNomeAgencia) <> '' Then
         cdsDocTxt.FieldByName('NOMEAGENCIA').AsString := sNomeAgencia;
      If trim(sLOGRADOURO) <> '' Then
         cdsDocTxt.FieldByName('LOGRADOURO').AsString := sLOGRADOURO;
      If trim(sNUMERO) <> '' Then
         cdsDocTxt.FieldByName('NUMERO').AsString := sNUMERO;
      If trim(sCOMPLEMENTO) <> '' Then
         cdsDocTxt.FieldByName('COMPLEMENTO').AsString := sCOMPLEMENTO;
      If trim(sBAIRRO) <> '' Then
         cdsDocTxt.FieldByName('BAIRRO').AsString := sBAIRRO;
      If trim(sCIDADE) <> '' Then
         cdsDocTxt.FieldByName('CIDADE').AsString := sCIDADE;
      If trim(sCODESTADO) <> '' Then
         cdsDocTxt.FieldByName('CODESTADO').AsString := sCODESTADO;
      If trim(sCEP) <> '' Then
         cdsDocTxt.FieldByName('CEP').AsString := sCEP;
      sMatricula := qryAux1.fieldbyname('MATRICULA').asstring;
      If sMatricula = '' Then
         Begin
            If FazQuery(qryAux2, 'SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = ' +
               qryAux1.fieldbyname('IDTITULAR').asstring) Then
               sMatricula := qryAux2.fieldbyname('MATRICULA').asstring;
         End;
      cdsDocTxt.FieldByName('CODDOCUMENTO').asstring := sMatricula;
      cdsDocTxt.FieldByName('VALOR').AsFloat :=
         qryAux1.fieldbyname('VALORPROVENTO').asfloat;
      cdsDocTxt.FieldByName('VALORDESCONTO').AsFloat := 0;
      cdsDocTxt.FieldByName('VALORJUROS').AsFloat := 0;
      cdsDocTxt.FieldByName('DATAVENCTO').AsString :=
         formatdatetime('dd/mm/yyyy', qryAux1.fieldbyname('DATAPAGAMENTO').asdatetime);
      cdsDocTxt.FieldByName('DATAPROGRAMADA').AsString :=
         formatdatetime('dd/mm/yyyy', qryAux1.fieldbyname('DATAPAGAMENTO').asdatetime);
      cdsDocTxt.FieldByName('TIPOMOEDA').AsInteger := 0;
      cdsDocTxt.FieldByName('NUMLOTE').AsInteger := 0;
      cdsDocTxt.FieldByName('CODPORTFORMA').AsInteger :=
         qryProcesso.fieldbyname('CODPORTFORMA').asinteger;
      cdsDocTxt.FieldByName('CODPORTADOR').AsInteger :=
         qryProcesso.fieldbyname('CODPORTFORMA').asinteger;
      cdsDocTxt.FieldByName('CODFORMAPAGTO').AsInteger :=
         qryProcesso.FieldByName('CODFORMAPAGTO').AsInteger;
      cdsDocTxt.FieldByName('CODTIPOPAGTO').AsInteger :=
         qryProcesso.FieldByName('CODTIPOPAGTO').AsInteger;
      cdsDocTxt.FieldByName('FLGEMITEAVISO').AsString :=
         qryProcesso.FieldByName('FLGEMITEAVISO').AsString;
      cdsDocTxt.FieldByName('CODARQUIVOREMESSA').AsInteger :=
         qryProcesso.FieldByName('CODARQUIVOREMESSA').AsInteger;
      cdsDocTxt.FieldByName('IDBANCO').AsInteger :=
         qryProcesso.FieldByName('IDBANCO').AsInteger; //Portador Forma
      cdsDocTxt.FieldByName('NOCONTACORR').AsString :=
         qryProcesso.FieldByName('NOCONTACORR').AsString;
      cdsDocTxt.FieldByName('CODBARRA').AsString := '';
      cdsDocTxt.FieldByName('CODBARRAVALOR').AsString := '';
      cdsDocTxt.FieldByName('NODOCUMENTO').asstring :=
         qryAux1.fieldbyname('IDTITULAR').asstring + '-' +
         qryAux1.fieldbyname('IDRESPONSAVEL').asstring + '-';
      cdsDocTxt.FieldByName('COMPLDOCUMENTO').AsString :=
         Copy(MesPagamento, 6, 2); // Codigo que aparece no relatorio
      cdsDocTxt.FieldByName('TIPO').AsString := 'F';
      cdsDocTxt.FieldByName('NUMEMPRESABANCO').AsString :=
         qryProcesso.FieldByName('NUMEMPRESABANCO').AsString;
      cdsDocTxt.FieldByName('DEBCRE').AsString := '';
      cdsDocTxt.FieldByName('DMAISALT').asinteger :=
         qryProcesso.FieldByName('DMAISALT').asinteger;
      cdsDocTxt.FieldByName('CODFORMAPGTOALT').asinteger :=
         qryProcesso.FieldByName('CODFORMAPGTOALT').asinteger;
      cdsDocTxt.FieldByName('VALORMAXIMO').asfloat :=
         qryProcesso.FieldByName('VALORMAXIMO').asfloat;
      cdsDocTxt.FieldByName('LIVRE').AsString :=
         copy(inttostr(qryAux1.fieldbyname('IDRESPONSAVEL').asinteger) +
         inttostr(liseqregistroarquivo), 1, 25);
      cdsDocTxt.Post;
   Except
      frameProgresso.ExibeMensagem(
         'Problema na geração da informação de pagamento do recebedor ' +
         qryAux1.fieldbyname('IDRESPONSAVEL').asstring +
         ' (linha ignorada).');
   End;
End;

Procedure TfrmFolhaNormalEfet.ProcessaArquivobanco(aiidhistorico: integer);
//processa geração dos arquivos de banco
Var ssql: String;
   sPathArquivoRem: String;
   ddatafloat: tdatetime;
   lii: integer;
Begin
   frameProgresso.IntervaloCommit := 0;

   GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraArquivos,
      liplncodigo, liplnprovisaoabono, 0);

   ProcessamentoOK := true; // Andre Imakawa - SIG 60540  

   If SistemaFolha.FlgAgrupaArqDocAlt Then
      ssql :=
         'SELECT DISTINCT HC.IDFAVDOC, HC.DFLOATPAGTO, HC.DFLOATPAGTOALTER, ' + _clinefeed +
         '       HC.CODPORTFORMA, 0 AS CODDOCUMENTO, 0 AS SEQDOCUMENTO, ' + _clinefeed +
         '       HC.TIPOPORTADOR, 0 AS NUMREGISTROS, HC.PLNCODIGO, ' + _clinefeed +
         '       P.DESCRICAO, P.CODARQUIVOREMESSA, P.CONTROLEREMESSA, ' + _clinefeed +
         '       P.CODFORMAPAGTO, P.FLGEMITEAVISO, P.PATHARQUIVOREM, ' + _clinefeed +
         '       P.NUMEMPRESABANCO, P.CODTIPOPAGTO, PC.IDBANCO, PC.NOCONTACORR, ' + _clinefeed +
         '       P.DMAISALT, P.CODFORMAPGTOALT, P.VALORMAXIMO, ' + _clinefeed +
         '       P.CODFORMA, ' + _clinefeed +
         '       0 AS VALORDOC ' + _clinefeed +
         //Cássio Rovaroto - SIG nº 60540 - Início
         '       , NVL(P.FLGARQUIVO, ''N'') AS FLGARQUIVO ' + _clinefeed +
         '       , NVL(P.QTDLINHASLOTE, 40000) AS QTDLINHASLOTE ' + _clinefeed +
         //Cássio Rovaroto - SIG nº 60540 - Fim
         'FROM HSTFOLHABENEFCAP HC, PORTADORFORMA P, PORTADORCONTA PC ' + _clinefeed +
         'WHERE HC.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
         'AND HC.TIPOPORTADOR = ''A'' ' + _clinefeed +
         'AND P.RECPAG = ''P'' ' + _clinefeed +
         'AND HC.CODPORTFORMA = P.CODPORTFORMA ' + _clinefeed +
         'AND PC.CODPORTADOR = P.CODPORTADOR ' + _clinefeed
   Else
      ssql :=
         'SELECT HC.IDFAVDOC, HC.DFLOATPAGTO, HC.DFLOATPAGTOALTER, HC.CODPORTFORMA, ' + _clinefeed +
         '       HC.CODDOCUMENTO, HC.SEQDOCUMENTO, ' + _clinefeed +
         '       HC.TIPOPORTADOR, HC.NUMREGISTROS, HC.PLNCODIGO, ' + _clinefeed +
         '       P.DESCRICAO, P.CODARQUIVOREMESSA, P.CONTROLEREMESSA, ' + _clinefeed +
         '       P.CODFORMAPAGTO, P.FLGEMITEAVISO, P.PATHARQUIVOREM, ' + _clinefeed +
         '       P.NUMEMPRESABANCO, P.CODTIPOPAGTO, PC.IDBANCO, PC.NOCONTACORR, ' + _clinefeed +
         '       P.DMAISALT, P.CODFORMAPGTOALT, P.VALORMAXIMO, ' + _clinefeed +
         '       P.CODFORMA, ' + _clinefeed +
         '       HC.VALORDOC ' + _clinefeed +
         //Cássio Rovaroto - SIG nº 60540 - Início
         '       , NVL(P.FLGARQUIVO, ''N'') AS FLGARQUIVO ' + _clinefeed +
         '       , NVL(P.QTDLINHASLOTE, 40000) AS QTDLINHASLOTE ' + _clinefeed +
         //Cássio Rovaroto - SIG nº 60540 - Fim
         'FROM HSTFOLHABENEFCAP HC, PORTADORFORMA P, PORTADORCONTA PC ' + _clinefeed +
         'WHERE HC.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ' ' + _clinefeed +
         'AND HC.TIPOPORTADOR = ''A'' ' + _clinefeed +
         'AND P.RECPAG = ''P'' ' + _clinefeed +
         'AND HC.CODPORTFORMA = P.CODPORTFORMA ' + _clinefeed +
         'AND PC.CODPORTADOR = P.CODPORTADOR ' + _clinefeed;

   frameProgresso.MarcaInicioFase('Geração dos arquivos bancários.');

   If FazQuery(qryProcesso, ssql) Then
      Begin

         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         Try
            While Not qryprocesso.eof Do
               Begin
                  ssql :=
                     //Cássio rovaroto - SIG nº 60540 - Início
                     'SELECT LINHA, IDPESSJUR, IDTITULAR, IDRESPONSAVEL, NOME, NUMDOCUMENTO, ' + _clinefeed +
                     'DATAPAGAMENTO, NUMBANCO, NUMAGENCIA, CONTACORRENTE, VALORPROVENTO, ' + _clinefeed +
                     'MATRICULA, TIPOCONTA ' + _clinefeed +
                     'FROM ( '  + _clinefeed +
                     'SELECT ROWNUM AS LINHA, IDPESSJUR, IDTITULAR, IDRESPONSAVEL, NOME, NUMDOCUMENTO, ' + _clinefeed +
                     'DATAPAGAMENTO, NUMBANCO, NUMAGENCIA, CONTACORRENTE, VALORPROVENTO, ' + _clinefeed +
                     'MATRICULA, TIPOCONTA ' + _clinefeed +
                     'FROM ( ' + _clinefeed +
                     //Cássio Rovaroto - SIG Nº 60540 - Fim
                     'SELECT G.IDPESSJUR, G.IDTITULAR, G.IDRESPONSAVEL, G.NOME, G.NUMDOCUMENTO, ' + _clinefeed +
                     'G.DATAPAGAMENTO, ' + _clinefeed +
                     'G.NUMBANCO, G.NUMAGENCIA, G.CONTACORRENTE, G.VALORPROVENTO, G.MATRICULA, ' + _clinefeed +
                     'G.TIPOCONTA' + _clinefeed +   // Andre Imakawa - SIG 60540
                     'FROM ( ' + _clinefeed +
                     'SELECT HS.IDPESSJUR, HS.IDTITULAR, HS.IDRESPONSAVEL, P.NOME, P.NUMDOCUMENTO, ' + _clinefeed +
                     'HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, D.MATRICULA, ' + _clinefeed +
                     'HS.DATAPAGAMENTO, ' + _clinefeed +
                     'SUM(DECODE(HS.FLGDESCONTO,0, ' + _clinefeed +
                     'DECODE(HS.FLGESPECIAL,0,HS.VALORPROVENTO,0), ' + _clinefeed +
                     'DECODE(HS.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))) VALORPROVENTO ' + _clinefeed +
                     ',DECODE(HS.TIPOCONTA,3,3,1) AS TIPOCONTA' + _clinefeed +  // Andre Imakawa - SIG 60540
                     'FROM HISTRUBSAL HS, PROVDESC PR, PESSOA P, DEPENTIT D ' + _clinefeed +
                     'WHERE (HS.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ') ' + _clinefeed +
                     'AND (HS.CODPORTFORMA = ' + inttostr(qryProcesso.fieldbyname('CODPORTFORMA').asinteger) + ') ' + _clinefeed;

                  If Not SistemaFolha.FlgAgrupaArqDocAlt Then
                     ssql := ssql +
                        'AND (HS.CODDOCUMENTO = ' + inttostr(qryProcesso.fieldbyname('CODDOCUMENTO').asinteger) + ') ' + _clinefeed;

                  ssql := ssql +
                     'AND (HS.IDTITULAR = D.IDTITULAR(+)) ' + _clinefeed +
                     'AND (HS.IDRESPONSAVEL = D.IDPESSOA(+)) ' + _clinefeed +
                     'AND (NVL(HS.FLGESTORNO,0) = 0) ' + _clinefeed +
                     'AND (PR.IDPROVENTO = HS.IDRUBRICA) ' + _clinefeed +
                     'AND (HS.FLGESPECIAL = 0) ' + _clinefeed +
                     'AND (HS.FLGDESCONTO IN (0,1)) ' + _clinefeed +
                     'AND (HS.IDRESPONSAVEL = P.IDPESSOA) ' + _clinefeed +
                     'GROUP BY HS.IDPESSJUR, HS.IDTITULAR, P.NOME, D.MATRICULA, HS.IDRESPONSAVEL, ' + _clinefeed +
                     'HS.DATAPAGAMENTO, ' + _clinefeed +
                     'HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, P.NUMDOCUMENTO ' + _clinefeed +
                     ',DECODE(HS.TIPOCONTA,3,3,1)' + _clinefeed + // Andre Imakawa - SIG 60540
                     ') G ' + _clinefeed +
                     'WHERE G.VALORPROVENTO >= 0.01 ' + _clinefeed +
                     //Cássio Rovaroto - SIG Nº 60540 - Início
                     //'ORDER BY G.NOME, G.IDPESSJUR, G.IDTITULAR, G.IDRESPONSAVEL ';
                     'ORDER BY G.NOME, G.IDPESSJUR, G.IDTITULAR, G.IDRESPONSAVEL ))';

                  If FazQuery(qryAux1, ssql) Then
                     Begin
                        if (qryProcesso.FieldByName('FLGARQUIVO').AsString <> 'S') then
                          GeraArquivoPagamentoLeiauteCNAB150(aiidhistorico)
                        else
                        begin
                          GeraArquivoSIACC(aiidhistorico,
                                           qryProcesso.RecordCount,
                                           qryProcesso.FieldByName('QTDLINHASLOTE').AsInteger);

                        end;



                        //liseqregistroarquivo := 0;

                        //Cássio Rovaroto - SIG nº 60540 - Início
                        //TESTES para nova geração
                        //cdsDocTxt.Close;
                        //cdsDocTxt.Open;

                        //While Not qryAux1.eof Do
                        //   Begin
                        //      If liseqregistroarquivo Mod 100 = 0 Then
                        //         application.processmessages;
                        //      AlimentaRegistroParaArquivoEletronico;
                        //      qryAux1.next;
                        //   End;

                        //If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
                        //   If Not dtmBaseDados.dbBaseDados.InTransaction Then
                        //      dtmBaseDados.dbBaseDados.starttransaction;


                        //FCtrlIntBanco := TCtrlIntBanco.Create;
                        //FCtrlIntBanco.InitializeAs(Padroes);
                        //FCtrlIntBanco.ValidaDvContaAgencia := false;
                        //FCtrlIntBanco.FechaQryTexto := false;
                        //FCtrlIntBanco.IdentficaOrigem := '18';

                        //If qryProcesso.FieldByName('PATHARQUIVOREM').isnull Or
                        //   (qryProcesso.FieldByName('PATHARQUIVOREM').asstring = '') Then

                           //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
                           //sPathArquivoRem:='C:\'
                        //   sPathArquivoRem := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)

                        //Else
                        //   sPathArquivoRem := qryProcesso.FieldByName('PATHARQUIVOREM').asstring;

                        //Try
                           //cdsDocTxt.First;
                           //FCtrlIntBanco.IndiceDoBanco := qryProcesso.FieldByName('CODARQUIVOREMESSA').asinteger;
                           //If FCtrlIntBanco.VerficaDadosEmpresa('P', qryProcesso.FieldByName('CodPortForma').AsInteger) Then
                              //Begin
                              //   If FCtrlIntBanco.ValidaRemessa('P', cdsDocTxt.data, false) Then
                              //      Begin
                              //         FCtrlIntBanco.ExibeArquivoGerado := false;

                              //         ddatafloat := strTodate(sDtProgramada); //dptDtProgramada.date;

                              //         FCtrlIntBanco.iFloatExterno := qryProcesso.fieldbyname('DFLOATPAGTO').AsInteger;
                              //         FCtrlIntBanco.iFloatExternoAlt := qryProcesso.fieldbyname('DFLOATPAGTOALTER').AsInteger; ;

                              //         FCtrlIntBanco.MontaPagamentoEletronico(
                              //            qryProcesso.FieldByName('CODARQUIVOREMESSA').asinteger,
                              //            qryProcesso.FieldByName('CONTROLEREMESSA').asinteger,
                              //            cdsDocTxt.data,
                              //            sPathArquivoRem);
                              //         frameProgresso.ExibeMensagem('Arquivo Eletrônico gerado para:');

                              //         If SistemaFolha.FlgAgrupaArqDocAlt Then
                              //            frameProgresso.ExibeMensagem('Contas Caixas x Forma Pagto: ' +
                              //               inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                              //               qryProcesso.FieldByName('DESCRICAO').asstring)
                              //         Else
                              //            frameProgresso.ExibeMensagem(' Documento: ' +
                              //               qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                              //               'Contas Caixas x Forma Pagto: ' +
                              //               inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                              //               qryProcesso.FieldByName('DESCRICAO').asstring);

                              //         If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
                              //            If Not dtmBaseDados.dbBaseDados.InTransaction Then
                              //               dtmBaseDados.dbBaseDados.starttransaction;

                           //            GravaHstFolhaBenefCAP(aiidhistorico,
                           //               qryProcesso.fieldbyname('CODDOCUMENTO').asinteger,
                           //               qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger,
                           //               0,
                           //               qryProcesso.fieldbyname('CODPORTFORMA').asinteger,
                           //               qryProcesso.fieldbyname('PLNCODIGO').asinteger,
                           //               qryProcesso.fieldbyname('DFLOATPAGTO').asinteger,
                           //               qryProcesso.fieldbyname('DFLOATPAGTOALTER').asinteger,
                           //               qryProcesso.fieldbyname('IDFAVDOC').asinteger,
                           //               0,
                           //              0,
                           //                extractfilename(FCtrlIntBanco.NomeArquivoGerado),
                           //               qryProcesso.fieldbyname('TIPOPORTADOR').asstring);
                              //      End
                              //   Else
                              //      Begin
                              //         frameProgresso.ExibeMensagem('Erro na geração do arquivo de remessa.');
                              //         frameProgresso.ExibeMensagem(' Documento: ' +
                              //            qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                              //            'Contas Caixas x Forma Pagto: ' +
                              //            inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                              //            qryProcesso.FieldByName('DESCRICAO').asstring);
                              //         frameProgresso.ExibeMensagem('');
                              //      End;
                              //End
                           //Else
                             // Begin
                             //    frameProgresso.ExibeMensagem('Problema nos dados do Portador de Pagamento.');
                             //    frameProgresso.ExibeMensagem(' Documento: ' +
                             //       qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                             //       'Contas Caixas x Forma Pagto: ' +
                             //       inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                             //       qryProcesso.FieldByName('DESCRICAO').asstring);
                             //    frameProgresso.ExibeMensagem('');
                             // End;
                             //Cássio Rovaroto - SIG nº 60540 - Fim

                        //Except
                        //   On E: Exception Do
                        //      Begin
                        //         frameProgresso.ExibeMensagem('Problema na geração do arquivo de pagamento.');
                        //         frameProgresso.ExibeMensagem(' Documento: ' +
                        //            qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                        //            'Contas Caixas x Forma Pagto: ' +
                        //            inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                        //            qryProcesso.FieldByName('DESCRICAO').asstring);
                        //         frameProgresso.ExibeMensagem(e.message);
                        //         frameProgresso.ExibeMensagem('');
                        //      End;
                        //End;
                     End
                  Else
                     Begin
                        frameProgresso.ExibeMensagem('Não gerou o arquivo de remessa, pois todos os pagamentos estão iguais a zero para:');
                        frameProgresso.ExibeMensagem(' Documento: ' +
                           qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                           'Contas Caixas x Forma Pagto: ' +
                           inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                           qryProcesso.FieldByName('DESCRICAO').asstring);
                        frameProgresso.ExibeMensagem('');
                     End;

                  frmaguarde.apaga;
                  frameProgresso.Passo;
                  qryProcesso.next;
               End;
         Finally
            FCtrlIntBanco.free;
            frmaguarde.apaga;
            If ProcessamentoOK Then
               frameProgresso.MarcaFinalFase('Conclusão da geração dos arquivos eletrônicos.')
            Else
            begin
              frameProgresso.MarcaFinalFase('Ocorreu um problema na geração dos arquivos eletrônicos. Verificar LOG.');
              dtmBaseDados.dbBaseDados.rollback;
            end;

            frameProgresso.ResetaFrame(1, 0);

            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.starttransaction;

            If ProcessamentoOK Then
              GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraRetornos, liplncodigo, liplnprovisaoabono, 0);

            If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
               frameProgresso.FazCommit(true);
         End;
      End
   Else
      frameProgresso.MarcaFinalFase('Nenhum arquivo a ser gerado.');
End;

//processa geração dos retornos

Procedure TfrmFolhaNormalEfet.ProcessaRetornos(aiidhistorico: integer; aslotes: String);
Var sPrimeiroDia: String;
   iultIdTitular: integer;
   lisittmpdesc: integer;
   sCampo: String;

   //COMPENSA ADIANTAMENTO DE BENEFICIO QUANDO FOLHA EXTRA
   Procedure ProcessaCompensacaoAdiantamento(ParamRubricaCompensa: Integer);
   Var lssql: String;
      iseqinterno, llseq: longint;
      lRubrica: integer;
      sPFLGPERMANENTE, sPPARCELAS, sPIDREGRACALCULO, sPULTMESPREPARO: String;
      sPFLGCONTROLASALDO, sPVLRSALDOINICIAL, sPVLRTOTALPROC: String;
   Begin
      Try
         llseq := 1;
         sPrimeiroDia := '01/' + copy(MesPagamento, 6, 2) + '/' + copy(MesPagamento, 1, 4);

         cdsParamRubrica.Data := ctrlParamRubrica.ListaDePara(0, ParamRubricaCompensa);

         If (Not cdsParamRubrica.IsEmpty) And
            (cdsParamRubrica.FieldByName('IDRUBRICAPARA').AsInteger > 0) Then
            Begin
               lRubrica := cdsParamRubrica.FieldByName('IDRUBRICAPARA').AsInteger;

               if rdgProcessar.ItemIndex = 5 Then //Folha Extra  SOL 130770 Kintana 735946 Thiago Passos
               begin
                     //BRUNO AZEVEDO SOL 132145 KINTANA 759285
                     {sPFLGPERMANENTE := QuotedStr('0');
                     sPPARCELAS := QuotedStr('1');
                     sPIDREGRACALCULO := 'Null';
                     sPFLGCONTROLASALDO := 'Null';
                     sPVLRSALDOINICIAL := 'Null';
                     sPVLRTOTALPROC := 'Null';}

                     sPFLGPERMANENTE    := QuotedStr('1');

                     //BRUNO SOL 133967 KINTANA 784165
                     //sPPARCELAS         := QuotedStr('1');
                     //sPIDREGRACALCULO   := 'Null';
                     sPPARCELAS := QuotedStr('0');
                     sPIDREGRACALCULO := QuotedStr(IntToStr(cdsParamRubrica.fieldbyname('IDREGRA').asinteger));
                     //BRUNO SOL 133967 KINTANA 784165
                     
                     sPFLGCONTROLASALDO := QuotedStr('1');
                     sPVLRSALDOINICIAL  := OraNumero(FormatFloat('#,##0.00', qryProcesso.fieldbyname('VALORPROVENTO').asfloat));
                     sPVLRTOTALPROC     := QuotedStr('0');

                     //BRUNO SOL 133967 KINTANA 784165
                     //sPULTMESPREPARO    := TiraMes(MesPagamento);
                     sPULTMESPREPARO := 'Null';
                     //BRUNO SOL 133967 KINTANA 784165

                     //BRUNO AZEVEDO SOL 132145 KINTANA 759285
               end
               else
               If cdsParamRubrica.FieldByName('IDREGRA').AsInteger <> 0 Then
                  Begin
                     sPFLGPERMANENTE := QuotedStr('1');
                     sPPARCELAS := QuotedStr('0');
                     sPIDREGRACALCULO := QuotedStr(IntToStr(cdsParamRubrica.fieldbyname('IDREGRA').asinteger));
                     sPFLGCONTROLASALDO := QuotedStr('1');
                     sPVLRSALDOINICIAL := OraNumero(FormatFloat('#,##0.00', qryProcesso.fieldbyname('VALORPROVENTO').asfloat));
                     sPVLRTOTALPROC := QuotedStr('0');
                     sPULTMESPREPARO := 'Null';
                  End
               Else
                  Begin
                     sPFLGPERMANENTE := QuotedStr('0');
                     sPPARCELAS := QuotedStr('1');
                     sPIDREGRACALCULO := 'Null';
                     sPFLGCONTROLASALDO := 'Null';
                     sPVLRSALDOINICIAL := 'Null';
                     sPVLRTOTALPROC := 'Null';
                     sPULTMESPREPARO := 'Null';
                  End;

               //Renato Visoni SOL 143380 Kintana 943521
               if (rdgProcessar.ItemIndex = 5) and (qryProcesso.fieldbyname('IDSEQINTERNOFB').asInteger > 0) then begin
                 iseqinterno := qryProcesso.fieldbyname('IDSEQINTERNOFB').asInteger;
               end else begin
                 iseqinterno := LeUltRegistro(Nil, 'SEQINTERNOFB');
               end;
               //Renato Visoni SOL 143380 Kintana 943521

               lssql := ' SELECT MAX(SEQRUBRICAINDIV) + 1 SEQRUBRICAINDIV ' + #13 +
                  ' FROM RUBRICAINDIV ' + #13 +
                  //BRUNO AZEVEDO SOL 133133 KINTANA 773576
                  //' WHERE IDTITULAR = ' + IntToStr(qryProcesso.FieldByName('IDTITULAR').AsInteger) + #13 +
                  ' WHERE IDPESSOA  = ' + IntToStr(qryProcesso.FieldByName('IDRESPONSAVEL').AsInteger) + #13 +
                  '   AND IDEMPRESA = ' + IntToStr(iIdFundacao) + #13 +
                  '   AND IDRUBRICA = ' + IntToStr(lRubrica) + #13;

               qryAux1.Close;
               qryAux1.SQL.Clear;
               qryAux1.SQL.Add(lssql);
               qryAux1.Open;

               If Not qryAux1.IsEmpty Then
                  Begin
                     If qryAux1.FieldByName('SEQRUBRICAINDIV').AsInteger > 0 Then
                        llseq := qryAux1.FieldByName('SEQRUBRICAINDIV').AsInteger
                     Else
                        llseq := 1;
                  End;

               Repeat
                  lssql := ' INSERT INTO RUBRICAINDIV (IDTITULAR, IDPESSOA, IDEMPRESA, IDRUBRICA, ' +
                     '             PARCELAS, NUMOCORRENCIAS, FLGPERMANENTE, FLGTPRUBMANUT, VALORRUBRICA, ' +
                     '             ANOMESREF, DATAINICIO, DATAFINAL, SEQRUBRICAINDIV, IDSEQINTERNOFB, ' +

                  '             IDREGRACALCULO,  FLGCONTROLASALDO, VLRSALDOINICIAL,  VLRTOTALPROC, IDPLANOCONTABIL, ULTMESPREPARO, IDPERFILINVEST) ' +    // Andre Imakawa - SIG 101623
                     ' VALUES (' +
                     inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ',' +
                     inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ',' +
                     inttostr(iidfundacao) + ',' +
                     inttostr(lRubrica) + ',' + sPPARCELAS + ',0,' + sPFLGPERMANENTE + ',''1'',' +
                     OraNumero(FloattoStr(ArredondaMoeda(qryProcesso.fieldbyname('VALORPROVENTO').asfloat))) + ',' +
                     QuotedStr(copy(MesPagamento, 1, 4) + '/' + copy(MesPagamento, 6, 2)) +
                     ',TO_DATE(''' + sPrimeiroDia + ''',''DD/MM/YYYY''),NULL,' +
                     inttostr(llseq) + ',' +
                     inttostr(iseqinterno) + ',' +

                  sPIDREGRACALCULO + ',' + sPFLGCONTROLASALDO + ',' + sPVLRSALDOINICIAL + ',' + sPVLRTOTALPROC + ', ' +
                     // Daniel Begnami
               // Inicio Pendencia: 90476_381341
                  inttostr(qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger) + ', ' +
                  sPULTMESPREPARO + 
                  ',' + inttostr(qryProcesso.fieldbyname('IDPERFILINVEST').asinteger) + // Andre Imakawa - SIG101623
                  ' )';
                  // Fim Pendencia: 90476_381341

                  qryaux1.close;
                  qryaux1.sql.clear;
                  qryaux1.sql.add(lssql);

                  Try
                     qryaux1.execsql;
                     Break;
                  Except
                     On E: EDBEngineError Do
                        Begin
                           TratarErro(E.Message); //Brunno Mattos - KTN 767861 - SOL 132659
                           Raise;
                        End;
                  Else
                     inc(llseq);
                  End;
               Until false;
            End;

      Except
         On E: Exception Do
            Begin
               ProcessamentoOK := false;
               frameProgresso.ExibeMensagem('Erro ao tratar rubrica de compensação de adiantamento.');
               frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                  'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
               frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
               frameProgresso.ExibeMensagem('');
            End;
      End;
   End;

   Function VerificaUltimoPagto: boolean;
   Begin
      result := false;
      If iultIdTitular <> qryProcesso.FieldByName('IDTITULAR').AsInteger Then
         Begin
            iultidTitular := qryProcesso.FieldByName('IDTITULAR').AsInteger;
            qryEncerrado.close;
            qryEncerrado.parambyname('PNUMEROPROCESSO').asinteger :=
               qryProcesso.FieldByName('NUMEROPROCESSO').AsInteger;
            qryEncerrado.parambyname('PIDTITULAR').asinteger := iultidTitular;
            qryEncerrado.parambyname('PMESREF').asstring := MesPagamento;
            qryEncerrado.open;
            result := Not qryEncerrado.isempty;
         End;
   End;

   //ALTERACAO PARA REASSOCIAR AS CONTRIBUICOES VINCULADAS
   //AO EVENTO ANTERIOR SE NÃO EXISTIR NA HSTCONTEVENTOSPR
   Procedure ReassociaContribuicoes;
   Var lssql: String;
   Begin
      {Desassociar contribuicoes, onde flgcobra = 1 trocar para 0.}
      lssql := 'UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0' +
         ' WHERE IDPESSOA = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) +
         ' AND IDPESSJUR = ' + inttostr(qryProcesso.FieldByName('IDPATRO').AsInteger) +
         ' AND IDPLANOPREV = ' + inttostr(qryProcesso.FieldByName('IdPlanoprev').AsInteger) +
         ' AND FLGCOBRA = 1';
      If ExecutarQuery(qryAux2, lssql) Then
         Begin
            {Reassociar contribuições que estão na HSTEVENTOSCONTPR ou são vinculadas ao Evento Anterior.}
            qryHstContEventosPR.close;
            qryHstContEventosPR.parambyname('IDEVENTOSPREV').asinteger :=
               qryUltEvento.fieldbyname('ideventosprev').asinteger;
            qryHstContEventosPR.open;
            If Not qryHstContEventosPR.isempty Then
               Begin
                  While Not qryHstContEventosPR.eof Do
                     Begin
                        lssql := 'UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1' +
                           ' WHERE IDPESSOA = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) +
                           ' AND IDPESSJUR = ' + inttostr(qryProcesso.FieldByName('IDPATRO').AsInteger) +
                           ' AND IDPLANOPREV = ' + inttostr(qryProcesso.FieldByName('IdPlanoprev').AsInteger) +
                           ' AND IDCONTRIBUICAO = ' + inttostr(qryHstContEventosPR.FieldByName('IDCONTRIBUICAOF').AsInteger);
                        If Not ExecutarQuery(qryaux1, lssql) Then
                           Begin
                              frameProgresso.ExibeMensagem('Erro ao associar Contribuição: ' +
                                 qryHstContEventosPR.FieldByName('nome').Asstring);
                              frameProgresso.ExibeMensagem(
                                 'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                                 'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                           End
                        Else
                           Begin
                              frameProgresso.ExibeMensagem('Contribuição associada: ' +
                                 qryHstContEventosPR.FieldByName('nome').Asstring);
                              frameProgresso.ExibeMensagem(
                                 'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                                 'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                           End;
                        qryHstContEventosPR.next;
                     End;
               End
            Else
               Begin
                  qryContribuicaoEv.close;
                  qryContribuicaoEv.parambyname('idpessoa').asinteger :=
                     qryProcesso.FieldByName('IdTitular').AsInteger;
                  qryContribuicaoEv.parambyname('idpessjur').asinteger :=
                     qryProcesso.FieldByName('IDPATRO').AsInteger;
                  qryContribuicaoEv.parambyname('idplanoprev').asinteger :=
                     qryProcesso.FieldByName('IdPlanoprev').AsInteger;
                  qryContribuicaoEv.parambyname('ideventoanterior').asinteger :=
                     qryUltEvento.fieldbyname('ideventosprev').asinteger;
                  qryContribuicaoEv.open;
                  If Not qryContribuicaoEv.isempty Then
                     Begin
                        While Not qryContribuicaoEv.eof Do
                           Begin
                              lssql := 'UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1' +
                                 ' WHERE IDPESSOA = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) +
                                 ' AND IDPESSJUR = ' + inttostr(qryProcesso.FieldByName('IDPATRO').AsInteger) +
                                 ' AND IDPLANOPREV = ' + inttostr(qryProcesso.FieldByName('IdPlanoprev').AsInteger) +
                                 ' AND IDCONTRIBUICAO = ' + inttostr(qryContribuicaoEv.FieldByName('IDCONTRIBUICAO').AsInteger);
                              If Not ExecutarQuery(qryaux1, lssql) Then
                                 Begin
                                    frameProgresso.ExibeMensagem('Erro ao associar Contribuição: ' +
                                       qryContribuicaoEv.FieldByName('nome').Asstring);
                                    frameProgresso.ExibeMensagem(
                                       'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                                       'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                                 End
                              Else
                                 Begin
                                    frameProgresso.ExibeMensagem('Contribuição associada: ' +
                                       qryContribuicaoEv.FieldByName('nome').Asstring);
                                    frameProgresso.ExibeMensagem(
                                       'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                                       'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                                 End;
                              qryContribuicaoEv.next;
                           End;
                     End
                  Else
                     Begin
                        frameProgresso.ExibeMensagem('Nenhuma Contribuição para ser associada.');
                        frameProgresso.ExibeMensagem(
                           'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                           'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                     End;
               End;
         End
      Else
         Begin
            frameProgresso.ExibeMensagem('Erro ao desassociar Contribuições Atuais.');
            frameProgresso.ExibeMensagem(
               'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
               'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
         End;
   End; // ReassociaContribuicoes

   //ALTERACAO PARA REASSOCIAR AS CONTRIBUICOES VINCULADAS
   //AO EVENTO ANTERIOR SE NÃO EXISTIR NA HSTCONTEVENTOSPR
   Procedure TrataUltimoPagamento;
   Var IDSITFUNCATUAL, IDSITPLANOATUAL, IDSITPARTATUAL: Integer;
      sFLGINTERNO: String;
   Begin
      sFLGINTERNO := qryProcesso.FieldByName('FLGINTERNO').AsString;
      // Flginterno=AC,DO,OE indica casos em que o benefício volta
      // a situacao anterior no fim do beneficio.
      If ((sFLGINTERNO = 'AC') Or (sFLGINTERNO = 'DO') Or (sFLGINTERNO = 'OE')) Then
         Begin
            qryUltEvento.ParamByName('IDPESSJUR').AsInteger :=
               qryProcesso.FieldByName('IDPATRO').AsInteger;
            qryUltEvento.ParamByName('IDPLANOPREV').AsInteger :=
               qryProcesso.FieldByName('IDPLANOPREV').AsInteger;
            qryUltEvento.ParamByName('idpessoa').AsInteger :=
               qryProcesso.FieldByName('IDPESSOA').AsInteger;
            qryUltEvento.ParamByName('SEQPROPOSTA').AsInteger :=
               qryProcesso.FieldByName('SEQPROPOSTA').AsInteger;
            qryUltEvento.ParamByName('IDEVENTOGERADOR').AsInteger :=
               qryProcesso.FieldByName('IDEVENTOGERADOR').AsInteger;
            qryUltEvento.Open;
            If Not qryUltEvento.isempty Then
               Begin
                  IDSITFUNCATUAL := qryUltEvento.FieldByName('IDSITFUNCATUAL').AsInteger;
                  IDSITPLANOATUAL := qryUltEvento.FieldByName('IDSITPLANOATUAL').AsInteger;
                  IDSITPARTATUAL := qryUltEvento.FieldByName('IDSITPARTATUAL').AsInteger;
                  qryUpdPartPrevPlan.ParamByName('IDPESSJUR').AsInteger :=
                     qryProcesso.FieldByName('IDPATRO').AsInteger;
                  qryUpdPartPrevPlan.ParamByName('IDPLANOPREV').AsInteger :=
                     qryProcesso.FieldByName('IDPLANOPREV').AsInteger;
                  qryUpdPartPrevPlan.ParamByName('IDPESSOA').AsInteger :=
                     qryProcesso.FieldByName('IDPESSOA').AsInteger;
                  qryUpdPartPrevPlan.ParamByName('SEQPROPOSTA').AsInteger :=
                     qryProcesso.FieldByName('SEQPROPOSTA').AsInteger;
                  qryUpdPartPrevPlan.ParamByName('IDSITPLANOATUAL').AsInteger := IDSITPLANOATUAL;
                  qryUpdPartPrevPlan.ParamByName('IDSITPARTATUAL').AsInteger := IDSITPARTATUAL;
                  Try
                     qryUpdPartPrevPlan.ExecSql;
                  Except
                     On E: Exception Do
                        Begin
                           frameProgresso.ExibeMensagem('Erro ao voltar situação na Fundação.');
                           frameProgresso.ExibeMensagem(
                              'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                              'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                           frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                           frameProgresso.ExibeMensagem('');
                        End;
                  End;
                  qryUpdElegpatro.ParamByName('IDPESSJUR').AsInteger :=
                     qryProcesso.FieldByName('IDPATRO').AsInteger;
                  qryUpdElegpatro.ParamByName('IDPESSOA').AsInteger :=
                     qryProcesso.FieldByName('IDPESSOA').AsInteger;
                  qryUpdElegpatro.ParamByName('IDSITFUNCATUAL').AsInteger := IDSITFUNCATUAL;
                  Try
                     qryUpdElegpatro.ExecSql;
                  Except
                     On E: Exception Do
                        Begin
                           frameProgresso.ExibeMensagem('Erro ao voltar situação na Patrocinadora.');
                           frameProgresso.ExibeMensagem(
                              'Matrícula : ' + qryProcesso.fieldbyname('MATRICULA').asstring + '  ' +
                              'Nome : ' + qryProcesso.fieldbyname('NOME').asstring);
                           frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                           frameProgresso.ExibeMensagem('');
                        End;
                  End;
                  ReassociaContribuicoes;
               End
            Else
               Begin
                  //NÃO ENCONTROU EVENTOSPREV
                  frameProgresso.ExibeMensagem('Não voltou situação. Idpessoa = ' + qryProcesso.FieldByName('IDPESSOA').Asstring);
               End;
            qryUltEvento.Close;
         End;
   End;

   //ATUALIZA HSTBENEFBFCIARIO RESTANTE
   Function AtualizaPrevidencialRestantes: boolean;
   Var lssql: String;
   Begin
      result := true;
      Try
         lssql := 'SELECT DISTINCT E.MATRICULA, P.INSCRICAONUMERO, H.NUMEROPROCESSO, ' + _clinefeed +
            'H.MES, H.MESREFERENCIA, H.IDMOTIVO, M.DESCRICAO, ' + _clinefeed +
            'H.VALORPREV, H.IDLOTE, PB.NOME ' + _clinefeed +
            'FROM HSTBENEFBFCIARIO H, ELEGPATRO E, PARTPREVPLAN P, ' + _clinefeed +
            'PESSOA PB, MOTIVO M ' + _clinefeed +
            'WHERE H.IDLOTE ' + aslotes + ' ' + _clinefeed +
            'AND H.VLBENEFPGTO IS NULL ' + _clinefeed +
            'AND H.FLGENVIADO = 0 ' + _clinefeed +
            'AND E.IDPESSOA = H.IDTITULAR ' + _clinefeed +
            'AND E.IDPESSJUR = H.IDPESSJUR ' + _clinefeed +
            'AND P.IDPESSOA = H.IDTITULAR ' + _clinefeed +
            'AND P.IDPESSJUR = H.IDPESSJUR ' + _clinefeed +
            'AND P.IDPLANOPREV = H.IDPLANOPREV ' + _clinefeed +
            'AND PB.IDPESSOA = H.IDPESSOA ' + _clinefeed +
            'AND M.IDMOTIVO = H.IDMOTIVO ' + _clinefeed +
            'ORDER BY E.MATRICULA, PB.NOME, H.MESREFERENCIA';
         qryaux1.close;
         qryaux1.sql.clear;
         qryaux1.sql.add(lssql);
         qryaux1.open;
         If Not qryaux1.IsEmpty Then
            Begin
               frameProgresso.ExibeMensagem('');
               frameProgresso.ExibeMensagem('Histórico de Benefício com baixa não efetuada.');
               frameProgresso.ExibeMensagem('Deve-se verificar estes lançamentos na tela ' +
                  ' de Cadastro Manual de Benefícios.');
               frameProgresso.ExibeMensagem('');
               qryaux1.first;
               While Not qryaux1.eof Do
                  Begin
                     frameProgresso.ExibeMensagem(
                        'Lote:' + qryaux1.fieldbyname('idlote').asstring + ' - ' +
                        'Matr:' + qryaux1.fieldbyname('matricula').asstring + ' - ' +
                        'Inscrição:' + qryaux1.fieldbyname('inscricaonumero').asstring + ' - ' +
                        'Beneficiário:' + qryaux1.fieldbyname('nome').asstring + ' - ' +
                        'Processo:' + qryaux1.fieldbyname('numeroprocesso').asstring + ' - ' +
                        'Mês Ref.:' + qryaux1.fieldbyname('mesreferencia').asstring + ' - ' +
                        'Motivo:' + qryaux1.fieldbyname('descricao').asstring + ' - ' +
                        'Valor:' + formatfloat('#0.00', qryaux1.fieldbyname('valorprev').asfloat));
                     qryaux1.next;
                  End;
               frameProgresso.ExibeMensagem('');
            End;
      Except
         ProcessamentoOK := false;
         frameProgresso.ExibeMensagem('Erro baixa dos Hist. Beneficio restantes.');
         frameProgresso.ExibeMensagem('');
         exit;
      End;
   End;

   Procedure GravaHistoricoCompensacao(arvalor: real; asdescricao: String);
   Var lssql: String;
      llseq: longint;
   Begin
      // Insere registro historico na tabela HSTCOMPENSAIRRF
      llseq := LeUltRegistro(Nil, 'HSTCOMPENSAIRRF');
      lssql :=
         'INSERT INTO HSTCOMPENSAIRRF ' +
         '(IDHSTCOMPIRRF, IDPESSOA, IDHSTFOLHABENEF, VLRCOMPMES, VLRDEVIDOMES, MESREF, DESCRICAO) ' +
         'VALUES ' +
         '(' + inttostr(llseq) + ', ' +
         inttostr(qryProcesso.fieldbyname('IDPESSOA').asinteger) + ', ' +
         inttostr(aiidhistorico) + ', ' +
         OraNumero(FloattoStr(arvalor)) + ', ' +
         OraNumero(FloattoStr(arvalor)) + ', ' +
         QuotedStr(qryProcesso.FieldByName('MESCOBRANCA').AsString) + ',' +
         quotedstr(asdescricao) + ')';

      qryaux2.close;
      qryaux2.sql.clear;
      qryaux2.sql.add(lssql);
      Try
         qryaux2.execsql;
      Except
         On E: Exception Do
            Begin
               ProcessamentoOK := false;
               frameProgresso.ExibeMensagem('Erro na Efetivação da inserção do registro histórico da Compensação do IRRF.');
               frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
               frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
               frameProgresso.ExibeMensagem('');
            End;
      End;
   End;

   Procedure ProcessaDesativacaoRubricaIndiv(aiidtitular, aiidpessoa: integer);
   Var ssql: String;
   Begin

    if rdgProcessar.ItemIndex in [0,2,7] then begin // Renato Visoni SOL 156410 Kintana 1232584
      ssql :=
         'UPDATE RUBRICAINDIV ' + _clinefeed +
         'SET FLGDESATIVADO = 1 ' + _clinefeed +
         ', DATAFINAL = SYSDATE ' + _clinefeed + // Renato Visoni SOL 156410 Kintana 1232584
         'WHERE ' + _clinefeed +
         '    IDEMPRESA = ' + inttostr(iidFundacao) + ' ' + _clinefeed +
         'AND FLGTPRUBMANUT = ''1'' ' + _clinefeed +
         'AND NVL(FLGDESATIVADO,0) = 0 ' + _clinefeed +
         'AND (   ((FLGCONTROLASALDO = 1) AND (VLRTOTALPROC >= VLRSALDOINICIAL)) ' + _clinefeed +
         //'     OR ((FLGPERMANENTE = 0) AND (PARCELAS >= NUMOCORRENCIAS)) ' + _clinefeed +
         '     OR ((FLGPERMANENTE = 0) AND (PARCELAS <= NUMOCORRENCIAS)) ' + _clinefeed + // Renato Visoni SOL 156410 Kintana 1232584
         '     OR (DATAFINAL < TO_DATE(''01/' +
         Copy(MesPagamento, 6, 2) + '/' + Copy(MesPagamento, 1, 4) + ''',''DD/MM/YYYY''))) ' + _clinefeed;

      // Renato Visoni SOL 156410 Kintana 1232584
      if rdgProcessar.ItemIndex = 7 then begin
        ssql := ssql + 'AND  NVL(FLGRUBRICARESGATE,0) = 1 ';
      end else if rdgProcessar.ItemIndex in [0,2] then begin
        ssql := ssql + 'AND  NVL(FLGRUBRICARESGATE,0) <> 1 ';
      end;
      // Renato Visoni SOL 156410 Kintana 1232584

      If (aiidtitular > 0) And (aiidpessoa > 0) Then
         ssql := ssql +
            'AND IDTITULAR = ' + inttostr(aiidtitular) + ' ' + _clinefeed +
            'AND IDPESSOA = ' + inttostr(aiidpessoa) + ' ' + _clinefeed;

      qryaux1.close;
      qryaux1.sql.clear;
      qryaux1.sql.add(ssql);
      Try
         qryaux1.execsql;
      Except
         On E: Exception Do
            Begin
               TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
               ProcessamentoOK := false;
               frameProgresso.ExibeMensagem('Erro ao processar desativação das rubricas individuais encerradas.');
               frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
               frameProgresso.ExibeMensagem('');
            End;
      End;
    End; // Renato Visoni SOL 156410 Kintana 1232584


   End;

Var ssql: String;
   sidregraabaterese: String;
   llseq: integer;
   lsdataref: String;
   lrValorBenef: real;
   dUltIndice: Double;
   lsmsg: String;
   rValorCompensa: real;
   dValorIndice: double;
   rValorCorrecao: real;
   iseqinterno: integer;
Begin
   ProcessamentoOK := true;

   frameProgresso.IntervaloCommit := 0;
   If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.starttransaction;

   GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraRetornos,
      liplncodigo, liplnprovisaoabono, 0);

   frameProgresso.ExibeMensagem('Tratamento de retornos.');

   iultidTitular := 0;

   //Verificando tratamento de benefícios
   ssql :=
      'SELECT V.FLGDESCONTO, SUM(V.VALORPROVENTO) AS VALORPROVENTO, ' + _clinefeed +
      '       SUM(V.VALORRECEBIDO) AS VALORRECEBIDO, ' + _clinefeed +
      '       V.IDSEQINTERNOFB, EVG.FLGINTERNO, PRO.IDEVENTOGERADOR, ' + _clinefeed +
      '       V.IDTITULAR, V.IDRESPONSAVEL, V.ORDEM, ' + _clinefeed +
      '       E.MATRICULA, R.NOME, V.DFLOATPAGTO, ' + _clinefeed +
      '       V.IDPATRO, V.IDPLANOPREV, V.IDBENEFICIO, ' + _clinefeed +
      '       V.MESCOBRANCA, V.IDMOTIVO, V.NUMEROPROCESSO, V.IDPESSOA, V.MES, ' + _clinefeed +
      '       C.FLGTIPOFOLHA, V.SEQPROPOSTA, V.IDLOTE, ' + _clinefeed +
      '       V.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
      'FROM PREVIA V, PROVDESC P, ELEGPATRO E, PROCESSOBENEF PRO, ' + _clinefeed +
      '     EVENTOGERADOR EVG, PESSOA R, CTRLINTERFACE C ' + _clinefeed +
      'WHERE V.IDLOTE ' + aslotes + ' ' + _clinefeed +
      'AND V.IDLOTE = C.IDLOTE ' + _clinefeed +
      'AND PRO.NUMEROPROCESSO = V.NUMEROPROCESSO ' + _clinefeed +
      'AND EVG.IDEVENTOGERADOR = PRO.IDEVENTOGERADOR ' + _clinefeed +
      'AND V.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
      'AND V.FLGTIPODESC = ''B'' ' + _clinefeed +
      'AND V.IDPATRO = E.IDPESSJUR ' + _clinefeed +
      'AND V.IDTITULAR = E.IDPESSOA ' + _clinefeed +
      'AND V.IDRESPONSAVEL = R.IDPESSOA ' + _clinefeed +
      'AND C.FLGTIPOFOLHA IN (0,3,4,5,6) ' + _clinefeed +
      'GROUP BY V.FLGDESCONTO, ' + _clinefeed +
      '         V.IDSEQINTERNOFB, EVG.FLGINTERNO, PRO.IDEVENTOGERADOR, ' + _clinefeed +
      '         V.IDTITULAR, V.IDRESPONSAVEL, V.ORDEM, ' + _clinefeed +
      '         E.MATRICULA, R.NOME, V.DFLOATPAGTO, ' + _clinefeed +
      '         V.IDPATRO, V.IDPLANOPREV, V.IDBENEFICIO, ' + _clinefeed +
      '         V.MESCOBRANCA, V.IDMOTIVO, V.NUMEROPROCESSO, V.IDPESSOA, V.MES, ' + _clinefeed +
      '         C.FLGTIPOFOLHA, V.SEQPROPOSTA, V.IDLOTE, ' + _clinefeed +
      '         V.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
      'ORDER BY V.IDPATRO, V.IDPLANOPREV, V.IDTITULAR, V.IDRESPONSAVEL, V.MES';

   frameProgresso.MarcaInicioFase('Verificando tratamento de benefícios.');

   qryHstContEventosPR.prepare;
   qryContribuicaoEv.prepare;

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               Try
                  ssql := 'UPDATE HSTBENEFBFCIARIO ' +
                     'SET FLGENVIADO = 1, ' +
                     'IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) + ', ' +
                     'DTEFETPGTO = TO_DATE(' + QuotedStr(formatdatetime('dd/mm/yyyy',
                     StrTodate(sDtProgramada))) + ',''DD/MM/YYYY''), ';
                  //TRATA BAIXA DA HSTBENEFBFCIARIO PARA CASO ACAO JUDICIAL
                  If qryProcesso.FieldByName('FLGDESCONTO').AsInteger = 0 Then
                     Begin
                        ssql := ssql +
                           'VLBENEFPGTO = ' + OraNumero(qryProcesso.FieldByName('VALORRECEBIDO').asstring) + ' ';
                     End
                  Else
                     Begin
                        If abs(qryProcesso.FieldByName('VALORRECEBIDO').asinteger -
                           qryProcesso.FieldByName('VALORPROVENTO').asinteger) < 0.01 Then
                           ssql := ssql + 'VLBENEFPGTO = VALORPREV '
                        Else
                           ssql := ssql +
                              'VLBENEFPGTO = ' + OraNumero(qryProcesso.FieldByName('VALORPROVENTO').asstring) + ' ';
                     End;

                  If qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger > 0 Then
                     Begin
                        ssql := ssql +
                           'WHERE (IDSEQINTERNOFB = ' +
                           inttostr(qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger) + ')' +
                           'AND (VLBENEFPGTO IS NULL) ' +
                           'AND (FLGENVIADO = 0) ';
                     End
                  Else
                     Begin
                        ssql := ssql +
                           'WHERE (IDPESSJUR = ' + inttostr(qryProcesso.FieldByName('IDPATRO').AsInteger) + ')' +
                           'AND (IDTITULAR = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) + ')' +
                           'AND (IDPLANOPREV = ' + inttostr(qryProcesso.FieldByName('IdPlanoPrev').AsInteger) + ')' +
                           'AND (IDBENEFICIO = ' + inttostr(qryProcesso.FieldByName('IdBeneficio').AsInteger) + ')' +
                           'AND (MES = ' + QuotedStr(qryProcesso.FieldByName('MESCOBRANCA').AsString) + ')' +
                           'AND (IDMOTIVO = ' + inttostr(qryProcesso.FieldByName('IdMotivo').AsInteger) + ')' +
                           'AND (NUMEROPROCESSO = ' + inttostr(qryProcesso.FieldByName('NumeroProcesso').AsInteger) + ')' +
                           'AND (IDPESSOA = ' + inttostr(qryProcesso.FieldByName('IdPessoa').AsInteger) + ')' +
                           'AND (MESREFERENCIA = ' + QuotedStr(qryProcesso.FieldByName('MES').AsString) + ')' +
                           'AND (SEQPROPOSTA = ' + inttostr(qryProcesso.FieldByName('SeqProposta').AsInteger) + ')' +
                           'AND (IDLOTE = ' + inttostr(qryProcesso.FieldByName('IDLOTE').AsInteger) + ')' +
                           'AND (SEQBENEFICIO = ' + inttostr(qryProcesso.FieldByName('ORDEM').AsInteger) + ')' +
                           'AND (VLBENEFPGTO IS NULL) ' +
                           'AND (FLGENVIADO = 0) ';
                     End;
                  ExecutarQuery(qryaux1, ssql);
               Except
                  ProcessamentoOK := false;
                  frameProgresso.ExibeMensagem('Erro baixa do Hist. Beneficio processado. Idpessoa = ' +
                     qryProcesso.FieldByName('IDPESSOA').Asstring);
                  frameProgresso.ExibeMensagem('N° Processo: ' + qryProcesso.FieldByName('NUMEROPROCESSO').AsString);
                  frameProgresso.ExibeMensagem('Recebedor : ' + qryProcesso.FieldByName('NOME').AsString);
                  frameProgresso.ExibeMensagem('Matrícula Titular : ' + qryProcesso.FieldByName('Matricula').AsString);
                  frameProgresso.ExibeMensagem('');
               End;

               //BENEFICIOS DE REFERENCIA NÃO PAGOS
               Try
                  ssql := 'UPDATE HSTBENEFBFCIARIO H ' +
                     'SET H.FLGENVIADO = 1, ' +
                     '    H.DTEFETPGTO = TO_DATE(' + QuotedStr(formatdatetime('dd/mm/yyyy', StrTodate(sDtProgramada))) + ',''DD/MM/YYYY''), ' +
                     ' H.VLBENEFPGTO = H.VALORPREV,' +
                     ' H.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico) +
                     ' WHERE (H.IDPESSJUR = ' + inttostr(qryProcesso.FieldByName('IDPATRO').AsInteger) + ')' +
                     ' AND (H.IDTITULAR = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) + ')' +
                     ' AND (H.IDPLANOPREV = ' + inttostr(qryProcesso.FieldByName('IdPlanoPrev').AsInteger) + ')' +
                     ' AND (H.MES = ' + QuotedStr(qryProcesso.FieldByName('MESCOBRANCA').AsString) + ')' +
                     ' AND (H.IDMOTIVO = ' + inttostr(qryProcesso.FieldByName('IdMotivo').AsInteger) + ')' +
                     ' AND (H.NUMEROPROCESSO = ' + inttostr(qryProcesso.FieldByName('NumeroProcesso').AsInteger) + ')' +
                     ' AND (H.IDPESSOA = ' + inttostr(qryProcesso.FieldByName('IdPessoa').AsInteger) + ')' +
                     ' AND (H.MESREFERENCIA = ' + QuotedStr(qryProcesso.FieldByName('MES').AsString) + ')' +
                     ' AND (H.SEQPROPOSTA = ' + inttostr(qryProcesso.FieldByName('SeqProposta').AsInteger) + ')' +
                     ' AND (H.IDLOTE = ' + inttostr(qryProcesso.FieldByName('IDLOTE').AsInteger) + ')' +
                     ' AND (H.VLBENEFPGTO IS NULL) ' +
                     ' AND (H.FLGENVIADO = 0) ' +
                     ' AND EXISTS (SELECT 1 ' +
                     'FROM BENEFPLANPREV BP ' +
                     'WHERE BP.IDPLANOPREV = H.IDPLANOPREV ' +
                     'AND BP.IDBENEFICIO = H.IDBENEFICIO ' +
                     'AND BP.FLGREFERENCIA = 1)';

                  ExecutarQuery(qryaux1, ssql);
               Except
                  ProcessamentoOK := false;
                  frameProgresso.ExibeMensagem('Erro na baixa do Histórico de Beneficio de Referência (INSS). Idpessoa = ' +
                     qryProcesso.FieldByName('IDPESSOA').Asstring);
                  frameProgresso.ExibeMensagem('N° Processo: ' + qryProcesso.FieldByName('NUMEROPROCESSO').AsString);
                  frameProgresso.ExibeMensagem('Recebedor : ' + qryProcesso.FieldByName('NOME').AsString);
                  frameProgresso.ExibeMensagem('Matrícula Titular : ' + qryProcesso.FieldByName('Matricula').AsString);
                  frameProgresso.ExibeMensagem('');
               End;

               ssql := ' SELECT SUM(NVL(VLBENEFPGTO,0)) AS VLBENEFPGTO ' +
                       ' FROM HSTBENEFBFCIARIO ' +
                       ' WHERE (IDTITULAR   = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) + ')' +
                       ' AND   (IDPESSOA    = ' + inttostr(qryProcesso.FieldByName('IdPessoa').AsInteger) + ')' +
                       ' AND   (IDBENEFICIO = ' + inttostr(qryProcesso.FieldByName('IdBeneficio').AsInteger) + ')' +
                       ' AND   (IDPLANOPREV = ' + inttostr(qryProcesso.FieldByName('IdPlanoPrev').AsInteger) + ')' +
                       ' AND   (FLGENVIADO  = 1 )' +
                       ' AND   (DTEFETPGTO IS NOT NULL )' ;



               If FazQuery(qryaux1, ssql) Then

               //ATUALIZA VALORCALCULADO DA BENEFBFCIARIO COM O VALOR PAGO
               Try
                  ssql := 'UPDATE BENEFBFCIARIO BF ' +
                     'SET BF.VALORCALCULADO   = (BF.VALORTOTAL - ' + OraNumero(qryaux1.FieldByName('VLBENEFPGTO').AsString) + ')' +
                     ' WHERE (BF.IDPESSJUR    = ' + inttostr(qryProcesso.FieldByName('IDPATRO').AsInteger) + ')' +
                     ' AND (BF.IDTITULAR      = ' + inttostr(qryProcesso.FieldByName('IdTitular').AsInteger) + ')' +
                     ' AND (BF.IDPLANOPREV    = ' + inttostr(qryProcesso.FieldByName('IdPlanoPrev').AsInteger) + ')' +
                     ' AND (BF.NUMEROPROCESSO = ' + inttostr(qryProcesso.FieldByName('NumeroProcesso').AsInteger) + ')' +
                     ' AND (BF.IDBENEFICIO    = ' + inttostr(qryProcesso.FieldByName('IdBeneficio').AsInteger) + ')' +
                     ' AND (BF.IDPESSOA       = ' + inttostr(qryProcesso.FieldByName('IdPessoa').AsInteger) + ')';

                  ExecutarQuery(qryaux1, ssql);
               Except
                  ProcessamentoOK := false;
                  frameProgresso.ExibeMensagem('Erro na Atualização do Valor Calculado do Beneficio. Idpessoa = ' +
                     qryProcesso.FieldByName('IDPESSOA').Asstring);
                  frameProgresso.ExibeMensagem('N° Processo: ' + qryProcesso.FieldByName('NUMEROPROCESSO').AsString);
                  frameProgresso.ExibeMensagem('Recebedor : ' + qryProcesso.FieldByName('NOME').AsString);
                  frameProgresso.ExibeMensagem('Matrícula Titular : ' + qryProcesso.FieldByName('Matricula').AsString);
                  frameProgresso.ExibeMensagem('');
               End;
			   
			   
               //TRATA ENCERRAMENTO SE FOR FOLHA NORMAL
               If qryProcesso.FieldByName('FLGTIPOFOLHA').asinteger In [0, 5, 6] Then
                  Begin
                     Try
                        If VerificaUltimoPagto Then
                           TrataUltimoPagamento;
                     Except
                        ProcessamentoOK := false;
                        frameProgresso.ExibeMensagem('N° Processo: ' + qryProcesso.FieldByName('NUMEROPROCESSO').AsString);
                        frameProgresso.ExibeMensagem('Recebedor : ' + qryProcesso.FieldByName('NOME').AsString);
                        frameProgresso.ExibeMensagem('Matrícula Titular : ' + qryProcesso.FieldByName('Matricula').AsString);
                        frameProgresso.ExibeMensagem('');
                     End;
                  End;

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento de benefício a ser realizado.');
      End;

   //Verificando tratamento rubricas de arredondamento
   ssql :=
      'SELECT V.FLGDESCONTO, V.VALORPROVENTO, V.VALORRECEBIDO, ' + _clinefeed +
      'V.IDSEQINTERNOFB, ' + _clinefeed +
      'V.IDTITULAR, V.IDRESPONSAVEL, ' + _clinefeed +
      'E.MATRICULA, R.NOME, ' + _clinefeed +
      'V.IDPATRO, V.IDPLANOPREV, V.IDBENEFICIO, ' + _clinefeed +
      'V.MESCOBRANCA, V.IDMOTIVO, V.NUMEROPROCESSO, V.IDPESSOA, V.MES, ' + _clinefeed +
      'C.FLGTIPOFOLHA, V.SEQPROPOSTA, V.IDLOTE, ' + _clinefeed +
      'V.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
      'FROM PREVIA V, PROVDESC P, ELEGPATRO E, PESSOA R, CTRLINTERFACE C ' + _clinefeed +
      'WHERE V.IDLOTE ' + aslotes + ' ' + _clinefeed +
      'AND V.FLGPAGA = 1 ' + _clinefeed +
      'AND V.IDRUBRICA = ' + inttostr(prmIDRUBARRED) + _clinefeed +
      'AND V.IDLOTE = C.IDLOTE ' + _clinefeed +
      'AND V.IDRUBRICA = P.IDPROVENTO ' + _clinefeed +
      'AND V.FLGTIPODESC = ''T'' ' + _clinefeed +
      'AND V.IDPATRO = E.IDPESSJUR ' + _clinefeed +
      'AND V.IDTITULAR = E.IDPESSOA ' + _clinefeed +
      'AND V.IDRESPONSAVEL = R.IDPESSOA ' + _clinefeed +
      'AND C.FLGTIPOFOLHA IN (0,3,5,6) ' + _clinefeed +
      'ORDER BY V.IDPATRO, V.IDPLANOPREV, V.IDTITULAR, V.IDRESPONSAVEL, V.MES';

   frameProgresso.MarcaInicioFase('Verificando tratamento rubricas de arredondamento.');

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               //LANCAR RUBRICA COMPENSACAO DE ARREDONDAMENTO PARA O MES SEGUINTE
               Try
                  //SÓ ELIMINAR RUBRICAINDIV JÁ DESCONTADAS
                  ssql := 'DELETE RUBRICAINDIV' +
                     ' WHERE IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) +
                     ' AND IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) +
                     ' AND IDRUBRICA = ' + inttostr(prmIDRUBARREDMESANT) +
                     ' AND NUMOCORRENCIAS = PARCELAS' +
                     ' AND FLGPERMANENTE = 0' +
                     ' AND IDEMPRESA = ' + inttostr(iidfundacao) +
                     ' AND FLGTPRUBMANUT = ''1''';

                  If Not ExecutarQuery(qryaux1, ssql) Then
                     Begin
                        frameProgresso.ExibeMensagem('Erro ao eliminar rubrica de compensação de arredondamento de meses anteriores.');
                        frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                        frameProgresso.ExibeMensagem('');
                     End;

                  llseq := 1;
                  //COLOCAR COM MÊS REFERENCIA DE ABONO ANUAL
                  If qryProcesso.FieldByName('FLGTIPOFOLHA').asinteger In [3, 4] Then
                     Begin
                        //no abono considera o início do próprio mês
                        sPrimeiroDia := '01/' + copy(MesPagamento, 6, 2) + '/' + copy(MesPagamento, 1, 4);
                        lsdataref := MesAbono;
                     End
                  Else
                     Begin
                        //outras folhas início no próximo mês
                        sPrimeiroDia := '01/' + copy(IncData('01/' + copy(MesPagamento, 6, 2) + '/' +
                           copy(MesPagamento, 1, 4), 40, 0, 0), 4, 7);
                        lsdataref := MesPagamento;
                     End;

                  //Renato Visoni SOL 143380 Kintana 943521
                  if (rdgProcessar.ItemIndex = 5) and (qryProcesso.fieldbyname('IDSEQINTERNOFB').asInteger > 0) then begin
                    iseqinterno := qryProcesso.fieldbyname('IDSEQINTERNOFB').asInteger;
                  end else begin
                    iseqinterno := LeUltRegistro(Nil, 'SEQINTERNOFB');
                  end;
                  //Renato Visoni SOL 143380 Kintana 943521

                  Repeat
                     //INCLUSÃO DO CAMPO FLGUSADO = 0
                     //MARCAR PARA COBRAR NO ABONO ANUAL
                     ssql := 'INSERT INTO RUBRICAINDIV (IDTITULAR, IDPESSOA, IDEMPRESA, IDRUBRICA, ' +
                        'PARCELAS, NUMOCORRENCIAS, FLGPERMANENTE, FLGUSADO, FLGTPRUBMANUT, VALORRUBRICA, ' +
                        'ANOMESREF, DATAINICIO, DATAFINAL, SEQRUBRICAINDIV, FLGUSAABONO, ' +
                        'IDSEQINTERNOFB, IDPLANOCONTABIL ' +
                        ') VALUES (' +
                        inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ',' +
                        inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ',' +
                        inttostr(iidfundacao) + ',' +
                        inttostr(prmIDRUBARREDMESANT) + ',1,0,0,0,''1'',' +
                        OraNumero(FloattoStr(ArredondaMoeda(qryProcesso.fieldbyname('VALORPROVENTO').asfloat))) + ',' +
                        //gravar apenas data inicio e o mês de referência
                  //COLOCAR COM MÊS REFERENCIA DE ABONO ANUAL
                     QuotedStr(lsdataref) +
                        ',TO_DATE(''' + sPrimeiroDia + ''',''DD/MM/YYYY''),NULL,' +
                        inttostr(llseq) + ',1,' +
                        inttostr(iseqinterno) + ', ' +
                        // Daniel Begnami
                  // Inicio Pendencia: 90476_381341
                     inttostr(qryProcesso.fieldbyname('IDPLANOCONTABIL').asinteger) +
                        // Fim
                     ')';
                     qryaux1.close;
                     qryaux1.sql.clear;
                     qryaux1.sql.add(ssql);
                     Try
                        qryaux1.execsql;
                        break;
                     Except
                     //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
                      on e:Exception do
                      begin
                        TratarErro(e.Message);
                        inc(llseq);
                      end;
                      //Brunno Mattos - KTN 767861 - SOL 132659 Fim
                        
                     End;
                  Until false;
               Except
                  On E: Exception Do
                     Begin
                        ProcessamentoOK := false;
                        frameProgresso.ExibeMensagem('Erro ao tratar rubrica de compensação de arredondamento.');
                        frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                        frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                        frameProgresso.ExibeMensagem('');
                     End;
               End;

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento de rubrica de arredondamento a ser realizado.');
      End;

   //Verificando tratamento rubricas individuais
   ssql := 'SELECT V.FLGDESCONTO, V.VALORPROVENTO, V.VALORRECEBIDO, ' + _clinefeed +
      '       V.IDSEQINTERNOFB, V.IDRUBRICA, V.ORDEM, ' + _clinefeed +
      '       V.IDTITULAR, V.IDRESPONSAVEL, ' + _clinefeed +
      '       E.MATRICULA, R.NOME, ' + _clinefeed +
      '       V.IDPATRO, V.IDPLANOPREV, V.IDBENEFICIO, ' + _clinefeed +
      '       V.MESCOBRANCA, V.IDMOTIVO, V.NUMEROPROCESSO, V.IDPESSOA, V.MES, ' + _clinefeed +
      '       C.FLGTIPOFOLHA, V.SEQPROPOSTA, V.IDLOTE, ' + _clinefeed +
      '       V.FLGPAGA, V.IDFAVORECIDO, ' + _clinefeed + //CPrev - 27063
      '       V.MESCOMPREEM, C.FLGRESGATEPARCELADO  '  + _clinefeed +  // SOL 140042 Kintana 900220
   'FROM PREVIA V, PROVDESC P, ELEGPATRO E, PESSOA R, CTRLINTERFACE C ' + _clinefeed +
      'WHERE V.IDLOTE        ' + aslotes + ' ' + _clinefeed +
      //       '  AND V.FLGPAGA       = 1 '                                              + _clinefeed +
   '  AND V.IDLOTE        = C.IDLOTE ' + _clinefeed +
      '  AND V.IDRUBRICA     = P.IDPROVENTO ' + _clinefeed +
            //'  AND V.FLGTIPODESC   = ''Y'' ' + _clinefeed +   // SOL 63067 - KTN 524520 comentado
      '  AND V.FLGTIPODESC = DECODE(C.FLGRESGATEPARCELADO,1,''B'',''Y'') ' + _clinefeed +  // SOL 63067 - KTN 524520 add nova linha
      '  AND V.IDPATRO       = E.IDPESSJUR ' + _clinefeed +
      '  AND V.IDTITULAR     = E.IDPESSOA ' + _clinefeed +
      '  AND V.IDRESPONSAVEL = R.IDPESSOA ' + _clinefeed +
      '  AND C.FLGTIPOFOLHA  IN (0,3,4,5,6) ' + _clinefeed +
      'ORDER BY V.IDPATRO, V.IDPLANOPREV, V.IDTITULAR, V.IDRESPONSAVEL, V.MES' + _clinefeed;

   frameProgresso.MarcaInicioFase('Verificando tratamento rubricas individuais.');

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               //CPrev - 27063 - Inicio
               iNumOcorrencias := 0;
               If (qryProcesso.FieldByName('FLGPAGA').AsInteger = 0) Then
                  Begin
                     sSql := 'SELECT FLGPERMANENTE, FLGRESGATEPARCELADO ' + _clinefeed +
                        'FROM RUBRICAINDIV ' + _clinefeed +
                        'WHERE IDTITULAR       = ' + IntToStr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + _clinefeed +
                        '  AND IDPESSOA        = ' + IntToStr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + _clinefeed +
                        '  AND IDRUBRICA       = ' + IntToStr(qryProcesso.fieldbyname('IDRUBRICA').asinteger) + _clinefeed +
                        '  AND IDEMPRESA       = ' + IntToStr(iidFundacao) + _clinefeed +
                        '  AND SEQRUBRICAINDIV = ' + FormatFloat('#0', qryProcesso.fieldbyname('ORDEM').asfloat) + _clinefeed +
                        '  AND IDFAVORECIDO    IN (SELECT DISTINCT FORNSERV.IDPESSOA AS IDPESSOA ' + _clinefeed +
                        '                          FROM PESSOA, ' + _clinefeed +
                        '                               FORNSERV, ' + _clinefeed +
                        '                               LAYOUTXCOLUNAS ' + _clinefeed +
                        '                          WHERE ( PESSOA.IDPESSOA = FORNSERV.IDPESSOA ) ' + _clinefeed +
                        '                            AND ( PESSOA.TIPO     = ''J'' ) ' + _clinefeed +
                        '                            AND ( PESSOA.IDPESSOA = LAYOUTXCOLUNAS.IDFAVORECIDO )) ' + _clinefeed +
                        '  AND FLGTPRUBMANUT   = ''1''  ' + _clinefeed;


                     If FazQuery(qryAux3, ssql) Then
                        iNumOcorrencias := 1;
                  End
               Else
                  iNumOcorrencias := 1;


               //ssql:='UPDATE RUBRICAINDIV SET FLGUSADO = 1, NUMOCORRENCIAS = NUMOCORRENCIAS + 1, '+
               sSql := 'UPDATE RUBRICAINDIV SET FLGUSADO = 1, NUMOCORRENCIAS = NUMOCORRENCIAS + ' + IntToStr(iNumOcorrencias) + ', ' +
                  //CPrev - 27063 - Fim

               'VLRTOTALPROC = DECODE(FLGCONTROLASALDO,1,VLRTOTALPROC+' +
                  oranumero(floattostr(qryProcesso.fieldbyname('VALORPROVENTO').asfloat)) +
                  ',VLRTOTALPROC) ';
               //SE FOR FOLHA DE ABONO NÃO PODE ATUALIZAR ULTMESPREPARO

               If SistemaFolha.MantemMesRefConstanteRB = 1 Then
                  sCampo := 'MESCOBRANCA'
               Else
                  sCampo := 'MES';

               If (qryProcesso.FieldByName('FLGTIPOFOLHA').asinteger In [0, 6]) And
                  (copy(qryProcesso.fieldbyname(sCampo).asstring, 6, 2) <> '13') Then
                  ssql := ssql +
                     ',ULTMESPREPARO = GREATEST(NVL(ULTMESPREPARO,''0000/00''), ' +
                     QuotedStr(qryProcesso.fieldbyname(sCampo).asstring) + ') ';

               If (qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger > 0) and (qryProcesso.fieldbyname('FLGRESGATEPARCELADO').asinteger = 0) Then
                  Begin
                     ssql := ssql +
                        'WHERE (IDSEQINTERNOFB = ' +
                        inttostr(qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger) + ')';
                  End
               Else
                  Begin
                     ssql := ssql +
                        'WHERE IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ' ' +
                        'AND IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ' ' +
                        'AND IDRUBRICA = ' + inttostr(qryProcesso.fieldbyname('IDRUBRICA').asinteger) + ' ' +
                        'AND IDEMPRESA = ' + inttostr(iidFundacao) + ' ' +
                        'AND SEQRUBRICAINDIV = ' + formatfloat('#0', qryProcesso.fieldbyname('ORDEM').asfloat) + ' ' +
                        'AND FLGTPRUBMANUT = ''1'' ';
                  End;
               qryaux1.close;
               qryaux1.sql.clear;
               qryaux1.sql.add(ssql);
               Try
                  qryaux1.execsql;
               Except
                  On E: Exception Do
                     Begin
                        TratarErro(e.Message); //Brunno Mattos - KTN 767861 - SOL 132659
                        ProcessamentoOK := false;
                        frameProgresso.ExibeMensagem('Erro ao atualizar rubrica individual.');
                        frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                        frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                        frameProgresso.ExibeMensagem('');
                     End;
               End;

               If (SistemaFolha.DesativacaoAutomaticaRubricaIndiv = 1) Then
                  ProcessaDesativacaoRubricaIndiv(
                     qryProcesso.fieldbyname('IDTITULAR').asinteger,
                     qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger);

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento de rubricas individuais.');
      End;

   //Verificando tratamento rubricas avulsas temporárias
   ssql :=
      'SELECT G.FLGDESCONTO, ' + _clinefeed +
      '       SUM(G.VALORPROVENTO) AS VALORPROVENTO, ' + _clinefeed +
      '       SUM(G.VALORRECEBIDO) AS VALORRECEBIDO, ' + _clinefeed +
      '       G.IDSEQINTERNOFB, G.ORDEM, ' + _clinefeed +
      '       G.IDTITULAR, G.IDRESPONSAVEL, G.IDRUBRICA, ' + _clinefeed +
      '       G.MATRICULA, G.NOME, ' + _clinefeed +
      '       G.IDPATRO, G.IDPLANOPREV, ' + _clinefeed +
      '       G.MESCOBRANCA, G.IDMOTIVO, G.IDPESSOA, G.MES, ' + _clinefeed +
      '       G.FLGTIPOFOLHA, G.SEQPROPOSTA, G.IDLOTE, G.FLGTIPODESC ' + _clinefeed +
      'FROM ( ' + _clinefeed +
      'SELECT V.FLGDESCONTO, V.VALORPROVENTO, V.VALORRECEBIDO, ' + _clinefeed +
      '       V.IDSEQINTERNOFB, V.ORDEM, ' + _clinefeed +
      '       V.IDTITULAR, V.IDRESPONSAVEL, ' + _clinefeed +
      '       DECODE(V.IDSEQINTERNOFB, NULL, V.IDRUBRICA, 0) AS IDRUBRICA, ' + _clinefeed +
      '       E.MATRICULA, R.NOME, V.IDPESSOA, V.MES, ' + _clinefeed +
      '       V.IDPATRO, V.IDPLANOPREV, ' + _clinefeed +
      '       V.MESCOBRANCA, V.IDMOTIVO, ' + _clinefeed +
      '       C.FLGTIPOFOLHA, V.SEQPROPOSTA, V.IDLOTE, V.FLGTIPODESC, ' + _clinefeed +
      '       V.MESCOMPREEM  '  + _clinefeed + // SOL 140042 Kintana 900220
      'FROM PREVIA V, ELEGPATRO E, PESSOA R, CTRLINTERFACE C ' + _clinefeed +
      'WHERE V.IDLOTE ' + aslotes + ' ' + _clinefeed +
      'AND V.IDLOTE = C.IDLOTE ' + _clinefeed +
      'AND V.FLGTIPODESC IN (''C'',''E'',''P'',''A'',''D'',' + //Higor Nayde Ferreira SOL 244007/16804  PPM 614680
      '''J'') ' + _clinefeed + //Helio - SOL Nº 252332 PPM Nº 761404 RN029
      'AND V.IDPATRO = E.IDPESSJUR ' + _clinefeed +
      'AND V.IDTITULAR = E.IDPESSOA ' + _clinefeed +
      'AND V.IDRESPONSAVEL = R.IDPESSOA ' + _clinefeed +
      'AND C.FLGTIPOFOLHA IN (0,3,4,5,6) ' + _clinefeed +
      ') G ' + _clinefeed +
      'GROUP BY G.FLGDESCONTO, G.IDSEQINTERNOFB, G.ORDEM, ' + _clinefeed +
      '         G.IDTITULAR, G.IDRESPONSAVEL, G.MATRICULA, G.NOME, ' + _clinefeed +
      '         G.IDPATRO, G.IDPLANOPREV, G.IDRUBRICA, ' + _clinefeed +
      '         G.MESCOBRANCA, G.IDMOTIVO, G.IDPESSOA, G.MES, ' + _clinefeed +
      '         G.FLGTIPOFOLHA, G.SEQPROPOSTA, G.IDLOTE, G.FLGTIPODESC ' + _clinefeed +
      'ORDER BY G.IDPATRO, G.IDPLANOPREV, G.IDTITULAR, G.IDRESPONSAVEL, G.MES ' + _clinefeed;

   frameProgresso.MarcaInicioFase('Verificando tratamento rubricas avulsas temporárias.');

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               If abs(qryProcesso.FieldByname('VALORRECEBIDO').asFloat -
                  qryProcesso.FieldByname('VALORPROVENTO').asFloat) < 0.01 Then
                  lisittmpdesc := 2
               Else
                  lisittmpdesc := 1;
               ssql := 'UPDATE TMPDESC ' + _clinefeed +
                  'SET DATARECEBIMENTO = TO_DATE(''' + sDtProgramada + ''',''DD/MM/YYYY''), ' + _clinefeed +
                  '    VALORRECEBIDO = ' +
                  OraNumero(formatfloat('#0.00',
                  qryProcesso.fieldbyname('VALORPROVENTO').asfloat)) + ', ' + _clinefeed +
                  '    SITENVIO = ' + quotedstr(inttostr(lisittmpdesc)) + ' ' + _clinefeed;

               If qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger > 0 Then
                  Begin
                     ssql := ssql +
                        'WHERE (IDSEQINTERNOFB = ' +
                        inttostr(qryProcesso.fieldbyname('IDSEQINTERNOFB').asinteger) + ')' + _clinefeed;
                  End
               Else
                  Begin
                     If (Not qryProcesso.fieldbyname('ORDEM').isnull) And
                        (qryProcesso.fieldbyname('ORDEM').asfloat <> 0) Then
                        ssql := ssql +
                           'WHERE (ORDEM = ' + formatfloat('#0', qryProcesso.fieldbyname('ORDEM').asfloat) + ') ' + _clinefeed
                     Else
                        ssql := ssql +
                           'WHERE (ORDEM = 0 OR ORDEM IS NULL) ' + _clinefeed;
                     ssql := ssql +
                        'AND (IDPROVENTO = ' + inttostr(qryProcesso.fieldbyname('IDRUBRICA').asinteger) + ') ' + _clinefeed;
                  End;

               ssql := ssql +
                  'AND (MESCOBRANCA = ' + QuotedStr(qryProcesso.fieldbyname('MESCOBRANCA').asstring) + ') ' + _clinefeed +
                  'AND (MESREFERENCIA = ' + QuotedStr(qryProcesso.fieldbyname('MES').asstring) + ') ' + _clinefeed +
                  'AND (IDPESSJUR = ' + inttostr(qryProcesso.fieldbyname('IDPATRO').asinteger) + ') ' + _clinefeed +
                  'AND (IDPLANOPREV = ' + inttostr(qryProcesso.fieldbyname('IDPLANOPREV').asinteger) + ') ' + _clinefeed +
                  'AND (IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) + ') ' + _clinefeed +
                  'AND (   (IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger) + ') ' + _clinefeed +
                  '     OR (IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDPESSOA').asinteger) + ')) ' + _clinefeed +
                  'AND (LOTEPREVIA = ' + inttostr(qryProcesso.fieldbyname('IDLOTE').asinteger) + ') ' + _clinefeed +
                  'AND (FLGTIPODESC = ' + QuotedStr(qryProcesso.fieldbyname('FLGTIPODESC').asstring) + ') ' + _clinefeed +
                  'AND (FLGDESCFOLHA = ''B'')' + _clinefeed;

               qryaux1.close;
               qryaux1.sql.clear;
               qryaux1.sql.add(ssql);
               Try
                  qryaux1.execsql;
               Except
                  On E: Exception Do
                     Begin
                        ProcessamentoOK := false;
                        frameProgresso.ExibeMensagem('Erro na atualização da data e valor efetivo dos descontos.');
                        frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                        frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                        frameProgresso.ExibeMensagem('');
                     End;
               End;

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento de rubricas avulsas temporárias.');
      End;

   //Verificando tratamento rubricas de compensação de IR
   //EFETUAR A ATUALIZAÇÃO DO VALOR DE COMPENSAÇÃO DE IR
   //  POR ÍNDICE. FAZER OTIMIZAÇÃO PARA TRATAR ESTE PROCEDIMENTO NA ROTINA ATUAL.

   ssql := 'SELECT DISTINCT CI.IDCOMPIRRF, CI.SALDOCOMP, CI.COMPTOTAL, ' + _clinefeed +
      '       CI.ULTMESATUALIZA, CI.INDICE, CI.IDPESSOA, ' + _clinefeed +
      '       E.MATRICULA, R.NOME, V.MESCOBRANCA, ' + _clinefeed +
      '       NVL(V.DFLOATPAGTO,0) AS DFLOATPAGTO ' + _clinefeed +
      'FROM COMPENSAIRRF CI, PREVIA V, ELEGPATRO E, ' + _clinefeed +
      '     PESSOA R, CTRLINTERFACE C ' + _clinefeed +
      'WHERE CI.SALDOCOMP    < CI.COMPTOTAL ' + _clinefeed +
      '  AND V.IDRESPONSAVEL = CI.IDPESSOA ' + _clinefeed +
      '  AND V.IDLOTE ' + aslotes + ' ' + _clinefeed +
      '  AND V.IDLOTE        = C.IDLOTE ' + _clinefeed +
      '  AND V.IDRUBRICA     = ' + inttostr(prmIDRUBIRRFCOMPIR) + ' ' + _clinefeed +
      '  AND V.IDPATRO       = E.IDPESSJUR ' + _clinefeed +
      '  AND V.IDTITULAR     = E.IDPESSOA ' + _clinefeed +
      '  AND V.IDRESPONSAVEL = R.IDPESSOA ' + _clinefeed +
      '  AND C.FLGTIPOFOLHA  IN (0,3,4,5,6) ' + _clinefeed +
      'ORDER BY CI.IDPESSOA';

   frameProgresso.MarcaInicioFase('Verificando tratamento rubricas de compensação de IR.');

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               ssql :=
                  'SELECT V.VALORPROVENTO, V.MES ' + _clinefeed +
                  'FROM PREVIA V, CTRLINTERFACE C ' + _clinefeed +
                  'WHERE V.IDLOTE ' + aslotes + ' ' + _clinefeed +
                  'AND V.IDLOTE = C.IDLOTE ' + _clinefeed +
                  'AND V.IDRUBRICA = ' + inttostr(prmIDRUBIRRFCOMPIR) + ' ' + _clinefeed +
                  'AND V.IDRESPONSAVEL = ' + qryProcesso.fieldbyname('IDPESSOA').asstring + ' ' + _clinefeed +
                  'AND C.FLGTIPOFOLHA IN (0,3,4,5,6) ' + _clinefeed +
                  'ORDER BY V.MES';

               If FazQuery(qryAux1, ssql) Then
                  Begin
                     rValorCompensa := qryProcesso.fieldbyname('SALDOCOMP').asfloat;

                     While Not qryAux1.eof Do
                        Begin
                           GravaHistoricoCompensacao(
                              ArredondaMoeda(qryAux1.fieldbyname('VALORPROVENTO').asfloat), 'Compensação Mensal');
                           rValorCompensa := rValorCompensa +
                              ArredondaMoeda(qryAux1.fieldbyname('VALORPROVENTO').asfloat);
                           qryAux1.next;
                        End;

                     ssql :=
                        'UPDATE COMPENSAIRRF ' +
                        'SET SALDOCOMP = (' + OraNumero(FloattoStr(rValorCompensa)) + ') ';

                     //verifica se tem saldo a compensar nos meses seguintes
                     If rValorCompensa < qryProcesso.fieldbyname('COMPTOTAL').asfloat Then
                        Begin
                           //verifica se a compensação tem indice de atualizacao
                           If Not qryProcesso.fieldbyname('INDICE').isnull Then
                              Begin
                                 If PegaIndiceData(qryProcesso.fieldbyname('INDICE').asinteger,
                                    formatdatetime('dd/mm/yyyy', dataspagto[qryProcesso.fieldbyname('DFLOATPAGTO').asinteger]),
                                    dValorIndice) Then
                                    Begin
                                       rValorCorrecao :=
                                          ArredondaMoeda((qryProcesso.fieldbyname('COMPTOTAL').asfloat - rValorCompensa) * dValorIndice / 100);
                                       If rValorCorrecao > 0.01 Then
                                          Begin
                                             GravaHistoricoCompensacao(-rValorCorrecao, 'Atualização por Índice');
                                             ssql := ssql +
                                                ', COMPTOTAL = (COMPTOTAL + ' + OraNumero(FloattoStr(rValorCorrecao)) + ') ';

                                             ssql := ssql +
                                                ', ULTMESATUALIZA = ' + QuotedStr(qryProcesso.FieldByName('MESCOBRANCA').AsString);
                                          End;
                                    End
                                 Else
                                    Begin
                                       frameProgresso.ExibeMensagem('Não conseguiu obter o índice de atualização da Compensação do IRRF.');
                                       frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                                       frameProgresso.ExibeMensagem('');
                                    End;
                              End;
                        End
                     Else
                        //ATUALIZA O ANO FINAL SE SALDO ZERAR OU NEGATIVAR
                        Begin
                           ssql := ssql +
                              ', ANOMESFIM = ' + QuotedStr(MesPagamento) + ' ';
                        End;

                     //Atualiza o saldo a compensar na tabela COMPENSAIRRF
                     sSQL := ssql +
                        'WHERE IDPESSOA = ' + inttostr(qryProcesso.fieldbyname('IDPESSOA').asinteger) + ' ' +
                        'AND IDCOMPIRRF = ' + qryProcesso.fieldbyname('IDCOMPIRRF').asstring + ' ';

                     qryaux2.close;
                     qryaux2.sql.clear;
                     qryaux2.sql.add(ssql);
                     Try
                        qryaux2.execsql;
                     Except
                        On E: Exception Do
                           Begin
                              ProcessamentoOK := false;
                              frameProgresso.ExibeMensagem('Erro na Efetivação da atualização de saldo da Compensação do IRRF.');
                              frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                              frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                              frameProgresso.ExibeMensagem('');
                           End;
                     End;
                  End;

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento de rubricas de compensação de IR.');
      End;

   //Verificando tratamento dos pagamentos pendentes
   ssql :=
      'SELECT DISTINCT V.IDTITULAR, V.IDRESPONSAVEL, V.IDVERSAOESTORNO, ' + _clinefeed +
      'E.MATRICULA, R.NOME ' + _clinefeed +
      'FROM PREVIA V, ELEGPATRO E, PESSOA R, CTRLINTERFACE C ' + _clinefeed +
      'WHERE V.IDLOTE ' + aslotes + ' ' + _clinefeed +
      'AND V.IDLOTE = C.IDLOTE ' + _clinefeed +
      'AND V.IDPATRO = E.IDPESSJUR ' + _clinefeed +
      'AND V.IDTITULAR = E.IDPESSOA ' + _clinefeed +
      'AND V.IDRESPONSAVEL = R.IDPESSOA ' + _clinefeed +
      'AND C.FLGTIPOFOLHA = 1 ' + _clinefeed +
      'ORDER BY V.IDTITULAR, V.IDRESPONSAVEL ';

   frameProgresso.MarcaInicioFase('Verificando tratamento dos pagamentos pendentes.');

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               ssql := 'UPDATE HISTRUBSAL SET FLGESTORNO = 3, IDVERSAOPAGTO = ' + inttostr(aiidhistorico) +
                  ' WHERE IDHSTFOLHABENEF = ' + inttostr(qryProcesso.fieldbyname('IDVERSAOESTORNO').asinteger) +
                  ' AND IDTITULAR = ' + inttostr(qryProcesso.fieldbyname('IDTITULAR').asinteger) +
                  ' AND IDRESPONSAVEL = ' + inttostr(qryProcesso.fieldbyname('IDRESPONSAVEL').asinteger);
               qryaux1.close;
               qryaux1.sql.clear;
               qryaux1.sql.add(ssql);
               Try
                  qryaux1.execsql;
               Except
                  On E: Exception Do
                     Begin
                        ProcessamentoOK := false;
                        frameProgresso.ExibeMensagem('Erro na atualização da versão estornada.');
                        frameProgresso.ExibeMensagem('Matrícula : ' + qryProcesso.fieldbyname('matricula').asstring);
                        frameProgresso.ExibeMensagem('Mensagem de erro : ' + E.message);
                        frameProgresso.ExibeMensagem('');
                     End;
               End;

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento dos pagamentos pendentes.');
      End;

   // Verificando tratamento rubricas de compensação de IR
   ssql :=
      'SELECT ' + _clinefeed +
      '  V.IDTITULAR, ' + _clinefeed +
      '  V.IDRESPONSAVEL, ' + _clinefeed +
      '  V.IDEMPRESA, ' + _clinefeed +
      '  V.VALORPROVENTO,  ' + _clinefeed +
      '  V.MESCOBRANCA, ' + _clinefeed +
      '  V.IDRUBRICA, ' + _clinefeed +
      '  V.IDSEQINTERNOFB, ' + _clinefeed + //Renato Visoni SOL 143380 Kintana 943521
      '  E.MATRICULA, ' + _clinefeed +
      '  P.NOME, ' + _clinefeed +
      '  C.FLGTIPOFOLHA, V.IDPLANOCONTABIL ' + _clinefeed +
      '  , V.IDPERFILINVEST ' + _clinefeed +        // Andre Imakawa - SIG 101623
      'FROM ' + _clinefeed +
      '  PREVIA V, ' + _clinefeed +
      '  ELEGPATRO E, ' + _clinefeed +
      '  PESSOA P, ' + _clinefeed +
      '  CTRLINTERFACE C ' + _clinefeed +
      'WHERE ' + _clinefeed +
      '    (V.IDLOTE = C.IDLOTE) ' + _clinefeed +
      'AND (C.FLGTIPOFOLHA = 2) ' + _clinefeed +
      'AND (V.IDPATRO = E.IDPESSJUR) ' + _clinefeed +
      'AND (V.IDTITULAR = E.IDPESSOA) ' + _clinefeed +
      'AND (V.IDRESPONSAVEL = P.IDPESSOA)  ' + _clinefeed +

   'AND (V.IDLOTE ' + aslotes + ') ';

   frameProgresso.MarcaInicioFase('Verificando tratamento de rubricas de adiantamento.');

   If FazQuery(qryProcesso, ssql) Then
      Begin
         frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

         While Not qryProcesso.eof Do
            Begin
               ProcessaCompensacaoAdiantamento(qryProcesso.FieldByName('IDRUBRICA').AsInteger);

               frameProgresso.Passo;
               qryProcesso.next;
            End;
      End
   Else
      Begin
         frameProgresso.MarcaFinalFase('Nenhum tratamento de rubricas de adiantamento.');
      End;

   //IDENTIFICA LOTE NORMAL DE PREVIA
   ssql :=
      'SELECT COUNT(*) AS NUM ' + _clinefeed +
      'FROM CTRLINTERFACE C ' + _clinefeed +
      'WHERE C.IDLOTE ' + aslotes + ' ' + _clinefeed +
      'AND C.FLGTIPOFOLHA IN (0,3,4,5,6) ' + _clinefeed;

   If FazQuery(qryProcesso, ssql) Then
      If (qryProcesso.fieldbyname('NUM').asinteger > 0) Then
         Begin
            ssql := 'UPDATE BENEFBFCIARIO ' + _clinefeed +
               'SET FLGDESCIRMES = 0 ' + _clinefeed +
               'WHERE FLGDESCIRMES = 1' + _clinefeed;

            If Not ExecutarQuery(qryAux1, ssql) Then
               Begin
                  frameProgresso.ExibeMensagem('');
                  frameProgresso.ExibeMensagem('Erro, Atualizacao do Flag de desconto do IR para beneficios na tabela de beneficiarios ');
                  frameProgresso.ExibeMensagem('');
               End;

            //Verificando desativação automática geral das rubricas individuais
            If (SistemaFolha.DesativacaoAutomaticaRubricaIndiv = 2) Then
               Begin
                  frameProgresso.MarcaInicioFase('Verificando desativação automática geral das rubricas individuais.');
                  ProcessaDesativacaoRubricaIndiv(0, 0);
               End;
         End;

   If ProcessamentoOK Then
      GravaHstFolhaBenef(idhistorico, Historico, 0, _ApagaPrevia,
         liplncodigo, liplnprovisaoabono, 0);

   If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      frameProgresso.FazCommit(false);
End;

Procedure TfrmFolhaNormalEfet.LimpaAmbiente;
Begin
   Inherited;
   cboxVerificar.checked := false;
   edtHistorico.text := '';
   MontaLista(self);
End;

Procedure TfrmFolhaNormalEfet.SetIdHistorico(Const Value: integer);
Begin
   FIdHistorico := Value;
End;

Procedure TfrmFolhaNormalEfet.ObtemIdHistorico;
Begin
   idHistorico := LeUltRegistro(Nil, 'HSTFOLHABENEF');
   Historico := 'v.' + MesPagamento + '/' + inttostr(idHistorico) + ' : ' + edtHistorico.Text;
End;

Function TfrmFolhaNormalEfet.ObtemPermissaoConfirmar: boolean;
Var smsg: String;
   bmostraconfirmacao: boolean;
Begin
   bmostraconfirmacao := true;
   If rgOpcaoSelecao.itemindex = 0 Then
      Begin
         If cboxVerificar.checked Then
            Begin
               If ProcessamentoOK Then
                  smsg := 'Processo de verificação concluído com sucesso. '
               Else
                  Begin
                     smsg := '####  ATENÇÃO  ####' +
                        '' + #13#10 +
                        'Processo de verificação constatou problemas ' +
                        'que devem ser analisados.' + #13#10 +
                        '' + #13#10 +
                        'Proceda da seguinte forma:' + #13#10 +
                        '1) verifique o log gerado na tela.' + #13#10 +
                        '2) faça os ajustes indicados.' + #13#10 +
                        '3) efetue novamente a verificação.' +
                        '' + #13#10;
                     bmostraconfirmacao := false;
                  End;
            End
         Else
            Begin
               If ProcessamentoOK Then
                  smsg := 'Processo de efetivação da Folha de Benefícios concluído com sucesso. '
               Else
                  Begin
                     smsg := '####  ATENÇÃO  ####' +
                        '' + #13#10 +
                        'Processo de efetivação não pôde ser finalizado.' + #13#10 +
                        '' + #13#10 +
                        'Ocorreram erros que devem ser analisados.' + #13#10 +
                        '' + #13#10 +
                        'Proceda da seguinte forma:' + #13#10 +
                        '1) verifique o log gerado na tela.' + #13#10 +
                        '2) faça os ajustes indicados.' + #13#10 +
                        '3) efetue novamente a efetivação.' +
                        '' + #13#10;
                     bmostraconfirmacao := false;
                  End;
            End;
      End
   Else
      Begin
         If ProcessamentoOK Then
            Begin
               smsg := 'Processo de efetivação da Folha de Benefícios concluído com sucesso. ';
            End
         Else
            Begin
               smsg := '####  ATENÇÃO  ####' +
                  '' + #13#10 +
                  'Processo de efetivação não pôde ser finalizado.' + #13#10 +
                  '' + #13#10 +
                  'Ocorreram erros que devem ser analisados.' + #13#10 +
                  '' + #13#10 +
                  'Proceda da seguinte forma:' + #13#10 +
                  '1) verifique o log gerado na tela.' + #13#10 +
                  '2) faça os ajustes indicados.' + #13#10 +
                  '3) efetue novamente a efetivação.';
               bmostraconfirmacao := false;
            End;
      End;

   If bmostraconfirmacao Then
      Begin
         result := MsgDlg(smsg + 'Deseja confirmar ? (S/N)', 'Informação', mtInformation,
            [mbYes, mbNo, mbHelp], 0) = mrYes;
      End
   Else
      Begin
         MsgDlg(smsg, 'Informação', mtInformation, [mbOK, mbHelp], 0);
         result := false;
      End;
End;

Procedure TfrmFolhaNormalEfet.FormCreate(Sender: TObject);
Begin
   Inherited;

   //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
   lblDiretorio.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

   ctrlBCP := tCtrlBancoPortForma.create;
   ctrlBCP.InitializeAs(Padroes);
   ctrlBCP.Inicializa(iidfundacao);

   ctrlDocumento := tctrlDocumento.create;
   ctrlDocumento.InitializeAs(Padroes);

   ctrlLancamento := tctrlLancamento.create;
   ctrlLancamento.InitializeAs(Padroes);

   ctrlPeriodo := tctrlPeriodo.create;
   ctrlPeriodo.InitializeAs(Padroes);

   ctrlContab := tctrlContab.create;
   ctrlContab.InitializeAs(Padroes);

   CtrlParamRubrica := TCtrlParamRubrica.Create;
   ctrlParamRubrica.InitializeAs(Padroes);
End;

Procedure TfrmFolhaNormalEfet.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   ctrlBCP.free;
   ctrlDocumento.Free;
   ctrlLancamento.free;
   ctrlPeriodo.free;
   ctrlContab.free;
   ctrlParamRubrica.Free;

   action := cafree;
   Inherited;
End;

Procedure TfrmFolhaNormalEfet.dptDtProgramadaChange(Sender: TObject);
Begin
   Inherited;
   Try
      CalculaDatasPagto;
      ChecaValidacao(self);
   Except
   End;
End;

Procedure TfrmFolhaNormalEfet.FormShow(Sender: TObject);
Begin
   Inherited;

   sCODCENTRORESPON := BuscaValorParametro(QryParamFolha, 'CODCENTRORESPON'); //Renato Visoni SOL 107549 \ Kintana 483466

   If Sistema.TipoCliente = 19991 Then
      chkDemonstrativos.Visible := True
   Else
      chkDemonstrativos.Visible := False;
End;

Procedure TfrmFolhaNormalEfet.chkDemonstrativosClick(Sender: TObject);
Begin
   Inherited;
   //SOL 149567 KINTANA 1075547
   {If chkDemonstrativos.Checked Then
      Begin
         MsgDlg('Foi parametrizado a geração automática do demonstrativo, ' + chr(13) +
            'para que essa operação funcione corretamente o módulo FUNCEF ' + chr(13) +
            'deve estar sendo executada em conjunto com a folha de benefício.',
            'Informação', mtInformation, [mbOk], 0);
      End;}
   Label5.Visible       :=  (chkDemonstrativos.Checked);
   edtNumLinhas.Visible :=  (chkDemonstrativos.Checked);
   //SOL 149567 KINTANA 1075547
End;

Procedure TfrmFolhaNormalEfet.dtpDtEfetivacaoExit(Sender: TObject);
Begin
   Inherited;

   sDtEfetivacao := dtpDtEfetivacao.Text; //Renato Visoni Sol 108334 / Kintana 488340 e SOL 109776 Kintana 498569

End;

Procedure TfrmFolhaNormalEfet.dtpDtContabilizacaoExit(Sender: TObject);
Begin
   Inherited;
   sDtContabilizacao := dtpDtContabilizacao.Text; //Renato Visoni Sol 108334 / Kintana 488340  e SOL 109776 Kintana 498569
End;

Procedure TfrmFolhaNormalEfet.dptDtVencimentoExit(Sender: TObject);
Begin
   Inherited;
   sDtVencimento := dptDtVencimento.Text; //Renato Visoni Sol 108334 / Kintana 488340 e SOL 109776 Kintana 498569
End;

Procedure TfrmFolhaNormalEfet.dptDtProgramadaExit(Sender: TObject);
Begin
   Inherited;
   sDtProgramada := dptDtProgramada.text; //Renato Visoni Sol 108334 / Kintana 488340

   //Renato Visoni SOL 110083 Kintana 501795
   Try
      CalculaDatasPagto;
      ChecaValidacao(self);
   Except
   End;
   //Fim Renato Visoni SOL110083 Kintana 501795

End;

// SOL:122512 - Daniel Begnami

Function TfrmFolhaNormalEfet.Exec_SP_MapaFolhaBenef: String;
Var
   SP_ERRO: String;
   SP_PROC: TStoredProc;
Begin
   Try
      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName := 'BaseDados';

      SP_PROC.StoredProcName := 'SP_FB_MAPAFOLHABENEF';

      SP_PROC.Params.CreateParam(ftString, 'pOutERRO', ptOutput);

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      SP_ERRO := SP_PROC.ParamByName('pOutERRO').AsString;

      SP_PROC.Close;

      Result := SP_ERRO;

   Finally
      FreeAndNil(SP_PROC);
   End;
End;
// FIM




function TfrmFolhaNormalEfet.TiraMes(pData: String): String;
Var QryAux : TQuery;
begin
// Bruno Azevedo SOL 132145 KINTANA 759285
  QryAux              := TQuery.Create(Self);
  QryAux.DataBaseName := 'BaseDados';

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.ADD('SELECT TO_CHAR(ADD_MONTHS(TO_DATE('+QuotedStr(pData)+',''YYYY/MM''), -1),''YYYY/MM'')  AS FDATA FROM DUAL');
  QryAux.Open;
  Result := QryAux.FieldByname('FDATA').asString;

  QryAux.Destroy;

// Bruno Azevedo SOL 132145 KINTANA 759285

end;

//Marcio Denilson - SOL 136569 - KINTANA 820997
function TfrmFolhaNormalEfet.Exec_SP_ExcessoDebito(iLote: Integer; sMes,sDataInicio, sDataProgramada: String): String;
Var
   SP_ERRO,SP_LOG: String;
   SP_PROC: TStoredProc;
Begin
   Try

      If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.starttransaction;


      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName := 'BaseDados';

      SP_PROC.StoredProcName := 'CM.SP_FB_EXCESSODEBITO';   //SP_FB_CONTROLEEXCESSODEBITO

      SP_PROC.Params.CreateParam(ftInteger, 'pIDLOTE', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pMES', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pDATA_INICIO', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pDATA_PROGRAMADA', ptInput);
      SP_PROC.Params.CreateParam(ftString, 'pOutERRO', ptOutput);
      SP_PROC.Params.CreateParam(ftString, 'pOutLOG', ptOutput);

      SP_PROC.ParamByName('pIDLOTE').AsInteger          := iLote;
      SP_PROC.ParamByName('pMES').AsString              := sMes;
      SP_PROC.ParamByName('pDATA_INICIO').AsString      := sDataInicio;
      SP_PROC.ParamByName('pDATA_PROGRAMADA').AsString  := sDataProgramada;

      //SP_PROC.ParamByName('pESTORNA').AsString  := '0';         // pESTORNA 0 Efetivacao, 1 Estorno da folha

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

      SP_ERRO := SP_PROC.ParamByName('pOutERRO').AsString;
      SP_LOG  := SP_PROC.ParamByName('pOutLOG').AsString;

      SP_PROC.Close;

      frameProgresso.ExibeMensagem('LOG EXECUÇAO PROCEDURE:' + SP_LOG);

      Result := SP_ERRO;

   Finally
      FreeAndNil(SP_PROC);

      If dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Commit;

   End;
end;
// FIM

//MARCIO DENILSON SOL 151061 KINTANA 1105188
//Helio - SOL Nº 151061-10442 KINTANA Nº 1720319 //adiciona pIdLote
procedure TfrmFolhaNormalEfet.processaIRRegressivo(psMes: String; piIdHstFolhaBenef, pIdLote: Integer);
var ssql:String;
    bresgate:boolean;
begin

  //Petri Nocentini SOL 260044 PPM 1028226 inicio
  // Andre Imakawa - SIG - 47459 - Inicio]

  ssql :=' SELECT * FROM CTRLINTERFACE WHERE IDLOTE = ' + intTostr(pIdLote)  + _clinefeed +                                 // André Imakawa - SIG 41892
         ' AND ((NVL(FLGRESGATE, 0) = 1) or (NVL(FLGRESGATEPARCELADO,0) = 1))'; // André Imakawa -  SOL 270393 - PPM 1348254 // André Imakawa - SIG 41892
  qryAux3.close; // André Imakawa - SIG 41892
  qryAux3.sql.clear; // André Imakawa - SIG 41892
  qryAux3.sql.add(ssql); // André Imakawa - SIG 41892
  qryAux3.open; // André Imakawa - SIG 41892

  // Andre Imakawa - SIG - 47459 - Fim
  //Petri Nocentini SOL 260044 PPM 1028226 fim

  // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio

   //if not (qryAux3.IsEmpty) then  atualizaHstCalculoPMPFolha(piIdHstFolhaBenef); // André Imakawa - SIG 41892
   atualizaHstCalculoPMPFolha(piIdHstFolhaBenef); // Andre Imakawa - SIG - 47459
   if not (qryAux3.IsEmpty) then  atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef);//Petri Nocentini SOL 260044 PPM 1028226 // André Imakawa - SIG 41892

  // André Imakawa -  SOL 270393 - PPM 1348254 - Fim

  { SIG 41892:
      Comentado a validação indevida referente a lote de resgate uma vez que o Ir Regressivo existe para Folha normal e Folha de Resgate
      A verificação será dentro do metodo verificando a pessoa na partprevplan se a opção de IR é igual a "2".}

  atualizaHstCalculoPMPFolha(piIdHstFolhaBenef); // André Imakawa - SIG 41892
  atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef); // André Imakawa - SIG 41892

  //atualizaBasePagamentoPrevia(psMes,piIdHstFolhaBenef, pIdLote); SOL 207789/16615 PPM 554283 comentado
  //atualizaBasePagamentoEfetivacao(psMes, pIdLote); SOL 207789/16615 PPM 554283 comentado
end;

//SOL 207789/16615 PPM 554283 inicio comentario
//MARCIO DENILSON SOL 151061 KINTANA 1105188
//Helio - SOL Nº 151061-10442 KINTANA Nº 1720319 //adiciona pIdLote
{procedure TfrmFolhaNormalEfet.atualizaBasePagamentoEfetivacao(psMes: String; pIdLote: Integer);
var
  sSQL : String;
begin

  sSQL := ' INSERT INTO CM.BASEDEPAGAMENTOEFETIVACAO   '
        + ' (                                          '
        + '        IDBASEPGTOEFETIVACAO                '
        + '      , IDTITULAR                           '
        + '      , IDPESSOA                            '
        + '      , MATRICULA                           '
        + '      , DATAPAGAMENTO                       '
        + '      , MES                                 '
        + '      , MESCOBRANCA                         '
        + '      , PRAZOMEDIOPONDERADO                 '
        + '      , PERCENTUALIRREGRESSIVO              '
        + '      , BASECALCIRREGRESSIVO                '
        + '      , VLRIRREGRESSIVO                     '
        + '      , VLRBRUTO                            '
        + '      , VLRDESCONTO                         '
        + '      , VLRLIQUIDO                          '
        + '      , TIPOFOLHA                           '
        + '      , FLGRISCO                            '
        + '      , FLGEFETIVADO                        '
        + '      , IDHSTFOLHABENEF                     '
        + '      , TRGUSERINCLUSAO                     '
        + '      , TRGDTINCLUSAO                       '
        + ' )                                          '
        + ' SELECT CM.SEQIDBASEPGTOEFETIVACAO.NEXTVAL  '
        + '      , IDTITULAR                           '
        + '      , IDPESSOA                            '
        + '      , MATRICULA                           '
        + '      , DATAPAGAMENTO                       '
        + '      , MES                                 '
        + '      , MESCOBRANCA                         '
        + '      , PRAZOMEDIOPONDERADO                 '
        + '      , PERCENTUALIRREGRESSIVO              '
        + '      , BASECALCIRREGRESSIVO                '
        + '      , VLRIRREGRESSIVO                     '
        + '      , VLRBRUTO                            '
        + '      , VLRDESCONTO                         '
        + '      , VLRLIQUIDO                          '
        + '      , TIPOFOLHA                           '
        + '      , FLGRISCO                            '
        + '      , FLGEFETIVADO                        '
        + '      , IDHSTFOLHABENEF                     '
        + '      , USER                                '
        + '      , SYSDATE                             '
        //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
        //adiciona lote como filtro
        + ' FROM (SELECT DISTINCT B.* FROM BASEDEPAGAMENTOPREVIA B '
        + ' INNER JOIN PREVIA P '
        + ' ON B.MESCOBRANCA = P.MESCOBRANCA '
        + ' AND B.MES = P.MES '
        + ' AND B.IDPESSOA = P.IDPESSOA '
        + ' AND B.IDTITULAR = P.IDTITULAR '
        + ' WHERE IDLOTE = :IDLOTE '
        + ' AND B.MESCOBRANCA = :MESCOBRANCA)';
        //+ ' FROM CM.BASEDEPAGAMENTOPREVIA              '
        //+ ' WHERE MESCOBRANCA = :MESCOBRANCA           ';
        //FIM Helio - SOL Nº 151061-10442 KINTANA Nº 1720319

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('MESCOBRANCA').AsString := psMes;
     ParamByName('IDLOTE').AsInteger := pIdLote; //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
     ExecSQL;
     Close;
     Free;
   end;
end; }
//SOL 207789/16615 PPM 554283 fim comentario

//SOL 207789/16615 PPM 554283   criação do metodo atualizaBasePagamento
procedure TfrmFolhaNormalEfet.atualizaBasePagamento(psMes, pIdLote: String; piIdHstFolhaBenef: Integer);
var
  sSQL : String;
begin
  // If Not dtmBaseDados.dbBaseDados.InTransaction Then
    //  dtmBaseDados.dbBaseDados.starttransaction;

   sSQL := ' UPDATE CM.BASEDEPAGAMENTO BA           '
         + ' SET FLGEFETIVADO = 1                   '
         + '    ,IDHSTFOLHABENEF = :IDHSTFOLHABENEF '
         + '    ,DATAPAGAMENTO = TO_DATE(' + QuotedStr(sDtEfetivacao) + ',''DD/MM/YYYY'')' //SOL 207789/16615 PPM 554283 Ajuste apos envio para homologação
         + ' WHERE BA.IDLOTE '+pIdLote
         //+ ' AND   BA.MESCOBRANCA = :MESCOBRANCA ' // Andre Imakawa - SIG 82154
         + ' AND   EXISTS (SELECT 1 FROM HISTRUBSAL H '
         + '             WHERE   H.MESCOBRANCA = BA.MESCOBRANCA'
         + '             AND     H.IDPESSOA    = BA.IDPESSOA'
         + '             AND     H.IDTITULAR   = BA.IDTITULAR'
         + '             AND     H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF ' 
         + '             )';


   with TwwQuery.Create(dtmBaseDados) do
   begin
      DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
      SQL.Add(sSQL);
      //ParamByName('MESCOBRANCA').AsString      := psMes;  // Andre Imakawa - SIG 82154
      ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
      //ParamByName('IDLOTE').AsInteger := pIdLote;
      ExecSQL;
      Close;
      Free;
   end;
   //If  dtmBaseDados.dbBaseDados.InTransaction Then
   //   dtmBaseDados.dbBaseDados.commit;
end;
//SOL 207789/16615 PPM 554283

//SOL 207789/16615 PPM 554283 inicio comentario
//MARCIO DENILSON SOL 151061 KINTANA 1105188
//Helio - SOL Nº 151061-10442 KINTANA Nº 1720319 //adiciona pIdLote
{procedure TfrmFolhaNormalEfet.atualizaBasePagamentoPrevia(psMes: String; piIdHstFolhaBenef, pIdLote: Integer);
var
  sSQL : String;
begin

  sSQL := ' UPDATE CM.BASEDEPAGAMENTOPREVIA        '
        + ' SET FLGEFETIVADO = 1                   '
        + '    ,IDHSTFOLHABENEF = :IDHSTFOLHABENEF '
        //Helio - SOL Nº 151061-10442 KINTANA Nº 1720319
        //adiciona lote como filtro
        + ' WHERE IDBASEPGTOPREVIA IN '
        + ' (SELECT DISTINCT BA.IDBASEPGTOPREVIA FROM BASEDEPAGAMENTOPREVIA BA '
        + ' INNER JOIN PREVIA P '
        + ' ON BA.MESCOBRANCA = P.MESCOBRANCA '
        + ' AND BA.MES = P.MES '
        + ' AND BA.IDPESSOA = P.IDPESSOA '
        + ' AND BA.IDTITULAR = P.IDTITULAR '
        + ' WHERE IDLOTE = :IDLOTE '
        + ' AND BA.MESCOBRANCA = :MESCOBRANCA) ';
        //+ ' WHERE MESCOBRANCA = :MESCOBRANCA       ';
        //FIM Helio - SOL Nº 151061-10442 KINTANA Nº 1720319

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('MESCOBRANCA').AsString      := psMes;
     ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
     ParamByName('IDLOTE').AsInteger := pIdLote;
     ExecSQL;
     Close;
     Free;
   end;
end;   }
//SOL 207789/16615 PPM 554283 fim comentario

//MARCIO DENILSON SOL 151061 KINTANA 1105188
procedure TfrmFolhaNormalEfet.atualizaHstCalculoPMPFolha( piIdHstFolhaBenef: Integer);
var
  sSQL : String;
begin
  // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio
  sSQL := ' UPDATE CM.HSTCALCULOPMPFOLHA HST              '
        + ' SET FLGPROCESSADO = 3                         '
        + '   , IDHSTFOLHABENEF = :IDHSTFOLHABENEF        '
        + ' WHERE EXISTS                                  '
        + '(SELECT 1                                                   '
        + '         FROM PREVIA P                                      '
        + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
        + '          AND P.IDTITULAR = HST.IDTITULAR                   '
        + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
        // André Imakawa - SIG 41892 - Inicio
        + '          AND EXISTS(  SELECT 1                             '
        + '                 FROM PARTPREVPLAN PART                     '
        + '                WHERE PART.IDPESSOA    = P.IDTITULAR        ' 
        + '                  AND PART.IDPESSJUR   = P.IDPATRO          ' 
        + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV      ' 
        + '                  AND PART.TIPOOPCAOIR = 2)                 '
        // André Imakawa - SIG 41892 - Fim
        + '          AND EXISTS (SELECT C.IDLOTE                       '
        + '                 FROM LOTEXHSTFOLHABENEF L                  '
        + '                INNER JOIN CTRLINTERFACE C                  '
        + '                   ON (C.IDLOTE = L.IDLOTE)                 '
        //+ '                WHERE (NVL(C.FLGRESGATE, 0) = 1 OR          '  // André Imakawa - SIG 41892
        //+ '                      NVL(C.FLGRESGATEPARCELADO, 0) = 1)    '  // André Imakawa - SIG 41892
        + '                  WHERE L.IDLOTE = P.IDLOTE                   '  // André Imakawa - SIG 41892
        + '                  AND L.IDHSTFOLHABENEF = :IDHSTFOLHABENEF))';
   // André Imakawa -  SOL 270393 - PPM 1348254 - Fim

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
     ExecSQL;
     Close;
     Free;
   end;
end;

//MARCIO DENILSON SOL 151061 KINTANA 1105188
procedure TfrmFolhaNormalEfet.atualizaHstPrazoAcumulacaoFolha(piIdHstFolhaBenef: Integer);
var
  sSQL : String;
begin
  // André Imakawa -  SOL 270393 - PPM 1348254 - Inicio
  sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST              '
        + ' SET FLGPROCESSADO = 3                         '
        + '   , IDHSTFOLHABENEF = :IDHSTFOLHABENEF        '
        + ' WHERE EXISTS                                  '
        + '(SELECT 1                                                   '
        + '         FROM PREVIA P, BENEFICIO B                         '
        + '        WHERE P.IDPESSOA = HST.IDPESSOA                     '
        + '          AND B.IDBENEFICIO(+) = P.IDBENEFICIO              '   // Andre Imakawa - SIG 132342
        + '          AND B.FLGDESTBENEF <> ''E''                       '   // Andre Imakawa - SIG 132342
        + '          AND P.IDTITULAR = HST.IDTITULAR                   '
        + '          AND P.IDPLANOPREV = HST.IDPLANOPREV               '
        // André Imakawa - SIG 41892 - Inicio
        + '          AND EXISTS(  SELECT 1                             '
        + '                 FROM PARTPREVPLAN PART                     '
        + '                WHERE PART.IDPESSOA    = P.IDTITULAR        ' 
        + '                  AND PART.IDPESSJUR   = P.IDPATRO          '
        + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV      '
        + '                  AND PART.TIPOOPCAOIR = 2)                 '
        // André Imakawa - SIG 41892 - Fim
        + '          AND EXISTS (SELECT C.IDLOTE                       '
        + '                 FROM LOTEXHSTFOLHABENEF L                  '
        + '                INNER JOIN CTRLINTERFACE C                  '
        + '                   ON (C.IDLOTE = L.IDLOTE)                 '
        + '                WHERE (NVL(C.FLGRESGATE, 0) = 1 OR          '  // André Imakawa - SIG 41892 // Andre Imakawa SIG 47459
        + '                      NVL(C.FLGRESGATEPARCELADO, 0) = 1)    '  // André Imakawa - SIG 41892 // Andre Imakawa SIG 47459
        + '                  AND L.IDLOTE = P.IDLOTE                   '  // André Imakawa - SIG 41892 // Andre Imakawa SIG 47459
        + '                  AND L.IDHSTFOLHABENEF = :IDHSTFOLHABENEF))'
        + ' AND FLGPROCESSADO <> 3                                     ';    // SOL 247170 PPM 649841
  // André Imakawa -  SOL 270393 - PPM 1348254 - Fim

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
     SQL.Add(sSQL);
     ParamByName('IDHSTFOLHABENEF').AsInteger := piIdHstFolhaBenef;
     ExecSQL;
     Close;
     Free;
   end;
end;

{function TfrmFolhaNormalEfet.VerificaTipoOpcaoIRREG(piIDPessJur,piIDPlanoPrev, piIDTitular: Integer): Boolean; //SOL 261754 PPM 1072844
var
  sSQL : String;
begin
  //Higor Nayde Ferreira SOL 259740 PPM 761404
  Result := False; // SOL 242740 PPM 575822

  // SOL 261754 PPM 1072844 inicio nova query
  sSQL := ' SELECT 1 ' +#13+
          ' FROM PARTPREVPLAN PPP ' +#13+
          ' WHERE PPP.IDPESSOA  = ' + IntToStr(piIDTitular)   +#13+
          ' AND PPP.IDPESSJUR   = ' + IntToStr(piIDPessJur)   +#13+
          ' AND PPP.IDPLANOPREV = ' + IntToStr(piIDPlanoPrev) +#13+
          ' AND PPP.TIPOOPCAOIR = 2 ';
  //SOL 261754 PPM 1072844 final da nova query

{sSQL :=  ' SELECT 1             '
        + ' FROM PARTPREVPLAN PT,                       '
        + '      BENEFBFCIARIO BF                       '
        + ' WHERE                                       '
        + '    ((' + IntToStr(piIDTitular) + ' = ' + IntToStr(piIDPessoa) + ' AND (BF.idpessoa = ' + IntToStr(piIDPessoa) + ' OR PT.idpessoa = ' + IntToStr(piIDPessoa) + '))  '
        + '    OR (' + IntToStr(piIDTitular) + ' <> ' + IntToStr(piIDPessoa) + ' AND PT.idpessoa = ' + IntToStr(piIDTitular) + ' AND BF.idpessoa = ' + IntToStr(piIDPessoa) + ')) '
        + '    AND PT.IDPLANOPREV = '+ IntToStr(piIDPlanoPrev)
        + '    AND PT.IDPESSJUR   = BF.IDPESSJUR        '
        + '    AND PT.IDPLANOPREV = BF.IDPLANOPREV      '
        + '    AND BF.IDSITBENEFICIO = 1                '
        + '    AND NVL(TIPOOPCAOIR,0) = 2               ';  }
          //Higor Nayde
          {
  sSQL :='SELECT COUNT(1) AS QTD'+
         '  FROM (SELECT tipoopcaoir'+
         '          FROM partprevplan pt, benefbfciario bf'+
         '         WHERE PT.IDPESSOA  =' + IntToStr(piIDPessoa) +
         '           AND pt.idpessoa = bf.idpessoa'+
         '           and pt.idpessjur = bf.idpessjur'+
         '           and pt.idplanoprev = bf.idplanoprev'+
         '           and bf.idsitbeneficio = 1'+
         '           AND PT.tipoopcaoir = 2)';
         }
         //Higor Nayde
  { with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

     SQL.Add(sSQL);
     //CMDebugToFile(#13#10 + sSQL + #13#10);
     Open;

     Result := not IsEmpty;

     Close;
     Free;
   end;
   //Higor Nayde Ferreira SOL 259740 PPM 761404
end; }
//MARCIO DENILSON SOL 151061 KINTANA 1105188 - fim

//SOL 269049 PPM 1287659
function TfrmFolhaNormalEfet.RetornaInformeTipoOpcaoIR(piIDPessJur,
  piIDPlanoPrev, piIDTitular, piIdRubrica, piFontePagadora: Integer): string;
var
   auxSql : String;
   participanteOptaIRREgressivo : Boolean;
begin
   Result := '';
   participanteOptaIRREgressivo := False;

   auxSql := ' SELECT 1 ' +#13+
                   ' FROM PARTPREVPLAN PART ' +#13+
                   ' WHERE PART.IDPESSOA = ' + IntToStr(piIDTitular) +#13+//IntToStr(Self.iidresponsavel) +#13+
                   ' AND PART.IDPESSJUR = ' + IntToStr(piIDPessJur) +#13+
                   ' AND PART.IDPLANOPREV = ' + IntToStr(piIDPlanoPrev) +#13+
                   ' AND PART.TIPOOPCAOIR = 2 ';// +#13+
                  // ' AND PART.FLGDESATIVADO <> 1';   // SOL 246290 PPM 642043

   qryAux1.close;
   qryAux1.SQL.clear;
   qryAux1.SQL.Add(auxSql);
   qryAux1.Open;

   if Not(qryAux1.IsEmpty) then
      participanteOptaIRREgressivo := True;

   qryAux1.Close;

   auxSql := ' SELECT IDINFORMEREG, IDINFORME FROM PROVDESC WHERE IDPROVENTO = ' + IntToStr(piIdRubrica);

   qryAux1.close;
   qryAux1.SQL.clear;
   qryAux1.SQL.Add(auxSql);
   qryAux1.Open;

   //if participanteOptaIRREgressivo then  // Andre Imakawa - SIG 28145
   if (participanteOptaIRREgressivo) and (piFontePagadora <> 2) then     // Andre Imakawa - SIG 28145
      // Andre Imakawa - SIG 40670 - Inicio
      if not(qryAux1.FieldByName('IDINFORMEREG').isnull) then
        Result :=  qryAux1.FieldByName('IDINFORMEREG').AsString
      else
        Result :=  qryAux1.FieldByName('IDINFORME').AsString
      // Andre Imakawa - SIG 40670 - Fim
   else
      Result :=  qryAux1.FieldByName('IDINFORME').AsString;

   qryAux1.Close;

end;
//SOL 269049 PPM 1287659


//edilaine - SIG39907 - inicio
procedure TfrmFolhaNormalEfet.PreparaContribuicaoPatro(slotes : string);
var
  sSQL : string;
begin

  frameProgresso.ExibeMensagem('Prepara Contribuição da Patrocinadora.');

  sSQL := 'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, C.DATAPAGAMENTO, C.FLGTIPOFOLHA' + _clinefeed +
          '  FROM CTRLINTERFACE C           '+ _clinefeed +
          ' WHERE C.TIPO = ''B''            '+ _clinefeed +
          '   AND C.FLGRESGATEPARCELADO = 0 '+ _clinefeed +
          '   AND C.FLGTIPOFOLHA = 0        '+ _clinefeed +
          '   AND C.FLGCONCESSAO = 0        '+ _clinefeed +
          '   AND C.IDLOTE '+sLotes ;

  frameProgresso.MarcaInicioFase('Verificando lotes para preparo de contribuição da patrocinadora.');

  If FazQuery(qryProcesso, sSQL) Then
  Begin

    frameProgresso.ResetaFrame(1, qryProcesso.recordcount);

    while not qryProcesso.eof do
    begin
      try
        sSQL := 'INSERT INTO PREPAROCONTRIB  ' + _clinefeed +
                '   (IDPREPAROCONTRIB,       ' + _clinefeed +
                '    MESCOBRANCA,            ' + _clinefeed +         //<<MES COBRANÇA>>, --Mês de cobrança do lote.
                '    MESREFERENCIA,          ' + _clinefeed +         //<<MES COBRANÇA>>, --Mês de cobrança do lote.
                '    DATAVENCIMENTO,         ' + _clinefeed +         //<<DATA DE PAGAMENTO DA FOLHA>>, -- Data de pagamento informada na interface.
                '    FLGTIPOPREPARO,         ' + _clinefeed +         //(INFORMAÇÃO FIXA),
                '    FLGPROCESSADO,          ' + _clinefeed +         //(INFORMAÇÃO FIXA),
                '    DATAINICIO,             ' + _clinefeed +
                '    IDLOTE)                 ' + _clinefeed +         //<<lote de preparo da folha>>
                ' VALUES                     ' + _clinefeed +
                '   (CM.SEQPREPAROCONTRIB.NEXTVAL, '+ _clinefeed +
                '   '+QuotedStr(qryProcesso.FieldByName('MESREFERENCIA').AsString) +', ' + _clinefeed +
                '   '+QuotedStr(qryProcesso.FieldByName('MESREFERENCIA').AsString) +', ' + _clinefeed +
                '   '+QuotedStr(qryProcesso.FieldByName('DATAPAGAMENTO').AsString) +', ' + _clinefeed +
                '    2,        ' + _clinefeed +
                '    -2,       ' + _clinefeed +
                '    sysdate,  ' + _clinefeed +
                '   '+qryProcesso.FieldByName('IDLOTE').AsString  + _clinefeed +
                '   )';

        ExecutarQuery(qryaux1, ssql);

      except
        frameProgresso.ExibeMensagem('Erro no preparo de contribuição da patrocinadora. Lote = ' +
           qryProcesso.FieldByName('IDLOTE').Asstring);
        frameProgresso.ExibeMensagem('');
      end;

      frameProgresso.Passo;

      qryProcesso.next;
    end;
    frameProgresso.MarcaFinalFase('Conclusão da gravação do preparo de contribuição da patrocinadora.')

  end
  else
  begin
    frameProgresso.MarcaFinalFase('Nenhum lote para preparo de contribuição a ser realizado.');
  end;
  qryProcesso.close;

end;
//edilaine - SIG39907 - fim


//Darivaldo Alencar SIG67668 -inicio
function TfrmFolhaNormalEfet.PossuiPerfil(aiidlote, aiIdHstFolhaBenef: Integer): Boolean;
Var
   SP_CHECK_EFETIV: TStoredProc;
Begin
   Try
      result:= false;
      SP_CHECK_EFETIV := TStoredProc.Create(Application);
      with SP_CHECK_EFETIV do
        begin
          DatabaseName   := 'BaseDados';
          StoredProcName := 'CM.SP_FB_CHECKLIST_EFETIVACAO';
          Params.CreateParam(ftFloat, 'IN_IDLOTE', ptInput);
          Params.CreateParam(ftFloat, 'IN_IDHSTFOLHABENEF', ptInput);
          Params.CreateParam(ftFloat, 'OUT_FLGINTERROMPE', ptOutput);

          ParamByName('IN_IDLOTE').AsFloat          := aiidlote;
          ParamByName('IN_IDHSTFOLHABENEF').AsFloat := aiIdHstFolhaBenef;
          Prepare;

          try
            ExecProc;

            if (SP_CHECK_EFETIV.ParamByName('OUT_FLGINTERROMPE').AsFloat > 0) then
              begin
                frameProgresso.ExibeMensagem('ERRO: LANÇAMENTO DA PRÉVIA SEM PERFIL DE INVESTIMENTOS CADASTRADO - LOTE '+ IntToStr(aiidlote));
              end
            else result:= true;

          except on e: Exception do
            frameProgresso.ExibeMensagem('Erro na execução da procedure: '+ SP_CHECK_EFETIV.StoredProcName + #13#10+
                                         'Parametro <IN_IDLOTE>: '+ IntToStr(aiidlote)  +#13#10+
                                         'Parametro <IN_IDHSTFOLHABENEF>: '+ IntToStr(aiIdHstFolhaBenef) +'.' +#13#10+
                                         'Erro: ' + e.message);
          end;

          Close;
        end;

   Finally
      FreeAndNil(SP_CHECK_EFETIV);
   End;
end;
//Darivaldo Alencar SIG67668 -fim

// Andre Imakawa - 78705 - Inicio

procedure TfrmFolhaNormalEfet.Executa_ETL(pLote: String; pIdhstfolhabenef: Integer; pDtPgto_0, pDtPgto_1, pDtPgto_2: TDatetime;
                                                  pFlgArquivo, pCodPortadorForma_Aux, pFundacaoCorrente, pTipoEfetivacao: Integer; var pStatus: String);
var
  F : TextFile;
  sDiretorioETL, sTipoEfetivacao, sArquivo, sLotes: String;
  iIdETLEFET: Integer;
Begin

  case pTipoEfetivacao of
    1: begin
         sTipoEfetivacao := 'HISTRUBSAL';
         sArquivo := '\Iniciar_Histrubsal.csv';
       end;

    2: begin
         sTipoEfetivacao := 'RETORNOS';
         sArquivo := '\Iniciar_Retornos.csv';
       end;
    // Andre Imakawa - SIG VALIDACAO 85168 - Inicio
    3: begin
         sTipoEfetivacao := 'VALIDACAO';
         sArquivo := '\Iniciar_Validacao.csv';
       end;
    // Andre Imakawa - SIG VALIDACAO 85168 - Fim   
  end;

  iIdETLEFET := 0;
  sDiretorioETL := '';
  sDiretorioETL := RetornaDiretorioETL('EFETIVACAO',sTipoEfetivacao);

  if sDiretorioETL <> '' then
  begin
    try
      If pos('IN', pLote) > 0 Then
        slotes :=  copy(pLote, 6, length(pLote) - 6)
      else
        slotes :=  copy(pLote, 4, length(pLote) - 3);

      AtualizaETLEfetivacao(pIdhstfolhabenef, pTipoEfetivacao);
      iIdETLEFET := InsereETLEfetivacao(slotes, pIdhstfolhabenef, formatdatetime('dd/mm/yyyy',pDtPgto_0),
                                        formatdatetime('dd/mm/yyyy',pDtPgto_1), formatdatetime('dd/mm/yyyy',pDtPgto_2),
                                        pFlgArquivo, pCodPortadorForma_Aux, pFundacaoCorrente, pTipoEfetivacao );
      
      AssignFile( F, sDiretorioETL + sArquivo );
      ReWrite( F );
      Closefile( F );


      if (pTipoEfetivacao <> 3) then
      begin
        While VerificaEfeticaoETL(iIdETLEFET,pStatus) = 0 do
        begin
          Sleep(10000);
        end;
      end;


      // Andre Imakawa - SIG VALIDACAO 85168 - Inicio
      {
      if (pTipoEfetivacao = 3) and (UpperCase(pStatus) <> 'F') then
      begin
        if Verifica_Critica_ETL(iIdETLEFET, slotes) then
        begin
          ProcessamentoOK := false;
        end;
      end;
      }
      // Andre Imakawa - SIG VALIDACAO 85168 - Fim

    except
      if pTipoEfetivacao <> 3 then
      begin
        ProcessamentoOK := false;
        pStatus := 'F';
        frameProgresso.ExibeMensagem('Erro ao executar ETL: '+ sTipoEfetivacao);
      end;

      exit;
    end;

  end
  else
  begin
    if pTipoEfetivacao <> 3 then
    begin
      ProcessamentoOK := false;
      pStatus := 'F';
      frameProgresso.ExibeMensagem('Falta Parametrização no diretório do ETL: '+ sTipoEfetivacao);
    end;

    exit;
  end;

end;
Function TfrmFolhaNormalEfet.InsereETLEfetivacao(pLote: String; pIdhstfolhabenef: Integer; pDtPgto_0, pDtPgto_1, pDtPgto_2: String;
                                                  pFlgArquivo, pCodPortadorForma_Aux, pFundacaoCorrente, pTipoEfetivacao: Integer): Integer;
var
  query, qryaux :TwwQuery;
  iSeq: Integer;
begin
  try
    query := TwwQuery.Create(nil);
    qryaux:= TwwQuery.Create(nil);

    query.DataBaseName := 'BaseDados';
    qryaux.DataBaseName := 'BaseDados';

    qryaux.Close;
    qryaux.SQl.Clear;
    qryaux.SQL.Add('SELECT CM.SEQETL_FOLHA_EFETIVACAO.NEXTVAL AS SEQ FROM DUAL');
    qryaux.Open;
    
    if not(qryaux.IsEmpty) then
      iSeq := qryaux.Fieldbyname('SEQ').asInteger;

    query.Close;
    query.SQl.Clear;
    query.SQL.Add(' INSERT INTO CM.ETL_FOLHA_EFETIVACAO (IDETLEFET, IDLOTE, IDHSTFOLHABENEF, DATAPAGTO_0,' );
    query.SQL.Add(' DATAPAGTO_1, DATAPAGTO_2, FLGARQUIVOELETRONICO, CODPORTFORMA_AUX, FUNDACAOCORRENTE, DATA_INICIO_ETL, FLGSTATUSEXEC,');
    query.SQL.Add(' USUARIOFINANCEIRO, USUARIOSISTEMA, TIPOPROCESSAMENTO, IDRUBARREDMESANT, MANTEMMESREFCONSTANTERB, IDRUBIRRFCOMPIR, TIPOEFETIVACAO, ');
    query.SQL.Add(' DATAEFETIVACAO, DATACONTABILIZACAO, DATAVENCIMENTO, DATAPROGRAMADA, MESCOBRANCA, IDRUBARRED, FLGABREDOCALT, PORTFORMAPATRO)');
    query.SQL.Add(' VALUES('+ IntToStr(iSeq) + ', '+ QuotedStr(pLote)+ ', '+ IntToStr(pIdhstfolhabenef));
    query.SQL.Add(' , TO_DATE('+ QuotedStr(pDtPgto_0) + ', ''DD/MM/YYYY''), TO_DATE('+ QuotedStr(pDtPgto_1) + ', ''DD/MM/YYYY'') ');
    query.SQL.Add(' , TO_DATE('+ QuotedStr(pDtPgto_2) + ', ''DD/MM/YYYY''), ' +  IntToStr(pFlgArquivo) + ', ');
    query.SQL.Add(  IntToStr(pCodPortadorForma_Aux) + ', '+ IntToStr(pFundacaoCorrente) +', SYSDATE, ''I'',');
    query.SQL.Add(  QuotedStr(inttostr(Sistema.Idusuario))+', ''ETL_FOLHA_BENEF'', '+ inttostr(rdgProcessar.ItemIndex) +', '+ inttostr(prmIDRUBARREDMESANT)+', ');
    query.SQL.Add(  QuotedStr(inttostr(SistemaFolha.MantemMesRefConstanteRB))+', '+ inttostr(prmIDRUBIRRFCOMPIR) +', '+ IntToStr(pTipoEfetivacao) +',');
    query.SQL.Add(  ' TO_DATE('+ QuotedStr(sDtEfetivacao) + ', ''DD/MM/YYYY''), TO_DATE(' + QuotedStr(sDtContabilizacao) + ', ''DD/MM/YYYY''),');
    query.SQL.Add(  ' TO_DATE('+ QuotedStr(sDtvencimento) + ', ''DD/MM/YYYY''), TO_DATE(' + QuotedStr(sDtProgramada) + ', ''DD/MM/YYYY''),');
    query.SQL.Add(  QuotedStr(MesPagamento)+', '+ inttostr(prmIDRUBARRED)+', ' + iff(SistemaFolha.FlgAbreDocAlt, '1','0') +', '+  inttostr(prmPortFormaPatro)+')');



    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
       dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    query.ExecSQL;
    dtmBaseDados.dbBaseDados.Commit;

    Result := iSeq;
  finally
    FreeAndNil(query);
    FreeAndNil(qryaux);
  end;
end;

Procedure TfrmFolhaNormalEfet.AtualizaETLEfetivacao(pIdhstfolhabenef, pTipoEfetivacao: Integer);
var
  query :TwwQuery;
  iSeq: Integer;
begin
  try
    query := TwwQuery.Create(nil);

    query.DataBaseName := 'BaseDados';

    query.Close;
    query.SQl.Clear;
    query.SQL.Add(' DELETE FROM CM.ETL_FOLHA_EFETIVACAO ' );
    query.SQL.Add(' WHERE IDHSTFOLHABENEF = ' + IntToStr(pIdhstfolhabenef) );
    query.SQL.Add(' AND TIPOEFETIVACAO = ' + IntToStr(pTipoEfetivacao) );
    query.SQL.Add(' AND FLGSTATUSEXEC = ''I''');

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
       dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    query.ExecSQL;
    dtmBaseDados.dbBaseDados.Commit;

  finally
    FreeAndNil(query);
  end;
end;

function TfrmFolhaNormalEfet.RetornaDiretorioETL(pFuncionalidade, pRotina: String): String;
var
  query:TwwQuery;
begin

  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add(' SELECT PEP.DIRETORIO_PROD, DIRETORIO_DEV' );
  query.SQL.Add(' FROM CM.PARAMETLPLANUS PEP ');
  query.SQL.Add(' WHERE PEP.IDMODULO = 18 ');
  query.SQL.Add(' AND PEP.FUNCIONALIDADE = '+ QuotedStr(pFuncionalidade));
  query.SQL.Add(' AND PEP.ROTINA = '+ QuotedStr(pRotina));

  query.Open;

  if query.IsEmpty then
    Result := ''
  else
    //if UpperCase(Sistema.AliasServidor) = 'PRODUCAO' then          // Andre Imakawa - SIG 100935
    if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then  // Andre Imakawa - SIG 100935
      result := query.FieldByName('DIRETORIO_PROD').AsString
    else
      result := query.FieldByName('DIRETORIO_DEV').AsString;

  FreeAndNil(query);

end;

function TfrmFolhaNormalEfet.VerificaEfeticaoETL(pIdETLEfet: Integer; var pStatus: String): Integer;
var
  query:TwwQuery;
begin

  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add('SELECT COUNT(1) AS QTD,  FLGSTATUSEXEC  FROM CM.ETL_FOLHA_EFETIVACAO EFE' );
  query.SQL.Add(' WHERE EFE.IDETLEFET = '+IntToStr(pIdETLEfet));
  query.SQL.Add(' AND EFE.DATA_FIM_ETL IS NOT NULL ');
  query.SQL.Add(' GROUP BY FLGSTATUSEXEC ');

  query.Open;

  if query.IsEmpty then
    Result := 0
  else
  begin
    result := query.FieldByName('QTD').AsInteger;
    pStatus := query.FieldByName('FLGSTATUSEXEC').AsString;
  end;


  FreeAndNil(query);

end;
// Andre Imakawa - 78705 - Fim

Procedure TfrmFolhaNormalEfet.ProcessaRetornos_ETL(aiidhistorico: integer; aslotes: String);
Var
   sStatus, sMensagem: String;
begin

  Monitoramento('EFETIVACAO - ETL RETORNOS',0);   // Andre Imakawa - SIG 83524

  ProcessamentoOK := true;

  frameProgresso.IntervaloCommit := 0;
  If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.starttransaction;

  GravaHstFolhaBenef(aiidhistorico, Historico, 0, _GeraRetornos, liplncodigo, liplnprovisaoabono, 0);

  frameProgresso.ExibeMensagem('Tratamento de retornos.');

  sStatus := 'I';
  sMensagem := '';
  // Andre Imakawa - 78705 - Inicio
  Executa_ETL(aslotes, aiidhistorico, dataspagto[0], dataspagto[1], dataspagto[2],
              rgEletronico.itemindex, qryPortadorForma1.fieldbyname('CODPORTFORMA').asinteger,
              SistemaFolha.FundacaoCorrente, 2, sStatus);

  if (UpperCase(sStatus) = 'F') then
  Begin
     frameProgresso.ExibeMensagem('Erro no processo de retornos.');
     ProcessamentoOK := false;
     Monitoramento('EFETIVACAO - ETL RETORNOS',2,'VERIFICAR ROTINA ETL');  // Andre Imakawa - SIG 83524
     exit;
  End;

  If (SistemaFolha.FlgConfirmaNoFinal = 0) Then
      frameProgresso.FazCommit(false);

  Monitoramento('EFETIVACAO - ETL RETORNOS',1);   // Andre Imakawa - SIG 83524
end;

Function TfrmFolhaNormalEfet.VerificaDisponibilidade: integer;
Begin
   result := 0;
   If FazQuery(qryAux1,
      'SELECT COUNT(1) AS QTD FROM USUARIOSISTEMA U WHERE U.FLGDISPFINANC = ''Y'' AND U.IDUSUARIO = ' + inttostr(Sistema.Idusuario)) Then
      result := qryAux1.fields[0].asinteger;
End;

// Andre Imakawa - SIG 81948 - Inicio
procedure TfrmFolhaNormalEfet.Monitoramento(pRotina:String; ptipo: Integer; pErro:String='');
var lParams :TStringList;
    lResponse : TStringStream;
    sHeader, sUsuario, sHorario, sErro, sMensagem, sIdExec : string;
    dia: TDateTime;
    sGrupo, sQuebra: string; // Andre Imakawa - SIG 96394
    sMaquina, sRetorno: string; // Andre Imakawa - SIG 102321

begin
  inherited;

  sQuebra := ' \ue008\ue007\ue000'; // Andre Imakawa - SIG 96394

  // Andre Imakawa - SIG 96394 - Inicio
  if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then
    sGrupo := 'Checklist Sistemas'
  else
    sGrupo := 'Monitoramento';
  // Andre Imakawa - SIG 96394 - Fim
    
  Try
    try

      case ptipo of
        0: sHeader := ' - INICIO';
        1: sHeader := ' - FIM';
      end;
      sHeader := sHeader + '';

      // Andre Imakawa - SIG 96394 - Inicio
      sUsuario := 'USUARIO: '+Sistema.NomeUsuario;
      sHorario := 'HORARIO: '+ formatdatetime('dd/mm/yyyy hh:nn:ss',now);
      sMaquina := 'MAQUINA: '+ UpperCase(trim(FuncaoGeral.GetNomeComputador)); // Andre Imakawa - SIG 102321
      
      case ptipo of
        2: sErro    := 'MSG: '+pErro;
        3: sErro    := pErro;
      end;
      // Andre Imakawa - SIG 96394 - Fim

      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');

      case ptipo of
        0,1: sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sHeader + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina +'"}'; // Andre Imakawa - SIG 102321
        2:   sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sHeader + sQuebra + sErro + sQuebra +  sUsuario + sQuebra + sHorario + sQuebra + sMaquina + '"}'; // Andre Imakawa - SIG 102321
        3:   sMensagem := '{"numero":"'+ sGrupo +'","mensagem":"'+ pRotina + sQuebra + sUsuario + sQuebra + sMaquina + sQuebra + sErro +'"}';
      end;

      //FuncaoGeral.EnviaMonitoramento('http://mw.funcef.com.br:5000/api/envia', 'application/json', sMensagem); // Andre Imakawa - SIG 82710
      FuncaoGeral.RequestAPI('http://mw.funcef.com.br:5000/api/envia', sMensagem, sRetorno, 'application/json',''); // Andre Imakawa - SIG 102321
    Except
      on E: Exception do
      begin
        //frameProgresso.ExibeMensagem('ERRO INT1-C.'); // Andre Imakawa - SIG 82710
      end;
    end;
  finally
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
  end;
end;
// Andre Imakawa - SIG 81948 - Fim

Function TfrmFolhaNormalEfet.Verifica_Critica_ETL(pIdETLEfet: Integer; plote: String): Boolean;
var query :TwwQuery;
    iMsg: Integer;
begin
  Result := False;
  
  query := TwwQuery.Create(nil);
  query.DataBaseName := 'BaseDados';
  query.Close;
  query.SQl.Clear;
  query.SQL.Add('SELECT EFC.FLGTIPOROTINA, EFC.FLGABORTAPROCESSAMENTO, EFC.CRITICA' );
  query.SQL.Add('  FROM CM.ETL_FOLHA_CRITICAS EFC' );
  query.SQL.Add(' WHERE EFC.IDETLEFET = '+IntToStr(pIdETLEfet));
  query.SQL.Add(' ORDER BY EFC.FLGTIPOROTINA ASC, EFC.FLGABORTAPROCESSAMENTO ASC, EFC.CRITICA ASC' );
  iMsg := 0;

  try
    query.Open;

    if not(query.IsEmpty) then
    begin

      While Not query.eof Do
        Begin
          if (query.FieldByName('FLGTIPOROTINA').AsInteger in [2] ) and (iMsg = 0) then
          begin
            iMsg := 1;
            frameProgresso.ExibeMensagem('Verificação de contas bancárias.');
            frameProgresso.ExibeMensagem('Acesse o Menu Cadastros / Contas Bancárias para corrigir.');
          end;
          frameProgresso.ExibeMensagem(query.FieldByName('CRITICA').AsString);
          if query.FieldByName('FLGABORTAPROCESSAMENTO').AsInteger > 0 then
            Result := True;
          query.next;
        end;

      if (iMsg = 1) then
      begin
        frameProgresso.ExibeMensagem('Conclusão da verificação das contas bancárias do lote.');
      end;

    end;
  finally
    FreeAndNil(query);
  end;                

end;

Procedure TfrmFolhaNormalEfet.GravaLog;
Var lii, iIdLog: integer;
   ssql: String;
   query :TwwQuery;
Begin
  Try
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    iIdLog := LeUltRegistro(Nil, 'LOGEFETIVACAO');

    query := TwwQuery.Create(nil);
    query.DataBaseName := 'BaseDados';
    query.Close;
    query.SQl.Clear;

    for lii:=0 to frameProgresso.redResultado.lines.count-1 do
    begin
      ssql := 'INSERT INTO CM.LOGEFETIVACAO' + #13#10 +
              '  (IDLOGEFETIVACAO, IDSEQLOG, LINHALOG, TRGDTINCLUSAO, TRGUSERINCLUSAO, MAQUINA)' + #13#10 + // Andre Imakawa - SIG 102321
              'VALUES' + #13#10 +
              '  ( '+ IntToStr(iIdLog) +',' +IntToStr(lii +1) +', ' + QuotedStr(frameProgresso.redResultado.lines[lii]) + ', SYSDATE, '+IntToStr(Sistema.IdUsuario)+ ', '+ QuotedStr(FuncaoGeral.GetNomeComputador) +')'; // Andre Imakawa - SIG 102321

      try
        ExecutarQuery(query, ssql);
      except
      end;

      If lii Mod 100 = 0 Then
      Begin
        If dtmBaseDados.dbBaseDados.InTransaction Then
        begin
           dtmBaseDados.dbBaseDados.Commit;
           dtmBaseDados.dbBaseDados.StartTransaction;
        end;
      End;

    end;                                    

  Finally
    FreeAndNil(query);
    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
  End;

end;

// Andre Imakawa - SIG 84679 - Inicio
Function TfrmFolhaNormalEfet.VerificaResgate(aiidhistorico: integer): Boolean;
var sSQL: string;
Begin
  result := False;

  sSQL := ' SELECT COUNT(1) AS QTD'
     + '   FROM CM.LOTEXHSTFOLHABENEF L INNER JOIN CM.CTRLINTERFACE C ON L.IDLOTE = C.IDLOTE'
     + '  WHERE L.IDHSTFOLHABENEF = ' + inttostr(aiidhistorico)
     + '    AND ((C.FLGRESGATE = 1) OR (C.FLGRESGATEPARCELADO = 1))' ;

  If FazQuery(qryAux1, sSQL) Then
      result := qryAux1.fieldbyname('QTD').asinteger > 0;


End;
// Andre Imakawa - SIG 84679 - Fim

// Andre Imakawa - SIG 96394 - Inicio
Procedure TfrmFolhaNormalEfet.MensagemValidacao(aIdHistorico: Integer);
var sSQL, sMsg, sMsgCritica, sQuebra: string;
    iStatus: Integer;
Begin
  sQuebra := ' \ue008\ue007\ue000';
  sMsg := '';
  sMsgCritica := '';

  sSQL :=   'SELECT H.FLGESTADO                                                   ' + #13#10 +
            '  FROM CM.HSTFOLHABENEF H                                               ' + #13#10 +
            ' WHERE H.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico);

  If FazQuery(qryAux1, sSQL) Then
  begin
    if qryAux1.IsEmpty then
    begin
      Monitoramento('EFETIVACAO - INVALIDA',3, 'Houve falha no processo de efetivacao.');
      Exit;
    end
    else
      If qryAux1.FieldByName('FLGESTADO').AsInteger <> 1 then
      begin
        Monitoramento('EFETIVACAO - INVALIDA',3, 'Houve falha no processo de efetivacao.');
        Exit;
      end;
  end;

  sSQL :=   'SELECT PV.MES,                                                       ' + #13#10 +
            '       PV.MESCOBRANCA,                                               ' + #13#10 +
            '       PV.IDPESSJUR,                                                 ' + #13#10 +
            '       PV.IDRUBRICA,                                                 ' + #13#10 +
            '       PV.IDMOTIVO,                                                  ' + #13#10 +
            '       PV.REFERENCIA,                                                ' + #13#10 +
            '       PV.IDPESSOA,                                                  ' + #13#10 +
            '       PV.SEQRUBRICA,                                                ' + #13#10 +
            '       PV.VALORPROVENTO                                              ' + #13#10 +
            '  FROM CM.PREVIA PV                                                  ' + #13#10 +
            ' WHERE PV.IDLOTE IN (SELECT L.IDLOTE                                 ' + #13#10 +
            '          FROM CM.LOTEXHSTFOLHABENEF L                               ' + #13#10 +
            '         WHERE L.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico) + ')   ' + #13#10 +
            ' AND PV.FLGDESCONTO IN (0,1)                                         ' + #13#10 +
            ' AND PV.FLGTIPODESC <> ''K''                                         ' + #13#10 +
            ' MINUS                                                               ' + #13#10 +
            'SELECT H.MES,                                                        ' + #13#10 +
            '       H.MESCOBRANCA,                                                ' + #13#10 +
            '       H.IDPESSJUR,                                                  ' + #13#10 +
            '       H.IDRUBRICA,                                                  ' + #13#10 +
            '       H.IDMOTIVO,                                                   ' + #13#10 +
            '       H.REFERENCIA,                                                 ' + #13#10 +
            '       H.IDPESSOA,                                                   ' + #13#10 +
            '       H.SEQRUBRICA,                                                 ' + #13#10 +
            '       H.VALORPROVENTO                                               ' + #13#10 +
            '  FROM CM.HISTRUBSAL H                                               ' + #13#10 +
            ' WHERE H.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico)                  + #13#10 +
            '   AND H.FLGDESCONTO IN(0,1)                                         ';

  If FazQuery(qryAux1, sSQL) Then
  begin
    if qryAux1.recordcount > 0 then
    begin
      sMsgCritica := sMsgCritica + sQuebra +  '- Diferenca de quantidade de registros previa x histrubsal.';
    end;
  end;

  sSQL := ' SELECT H.MES,                                                       ' + #13#10 +
          '        H.MESCOBRANCA,                                               ' + #13#10 +
          '        H.IDPESSJUR,                                                 ' + #13#10 +
          '        H.IDRUBRICA,                                                 ' + #13#10 +
          '        H.IDMOTIVO,                                                  ' + #13#10 +
          '        H.REFERENCIA,                                                ' + #13#10 +
          '        H.IDPESSOA,                                                  ' + #13#10 +
          '        H.SEQRUBRICA,                                                ' + #13#10 +
          '        H.VALORPROVENTO                                              ' + #13#10 +
          '   FROM CM.HISTRUBSAL H                                              ' + #13#10 +
          '  WHERE H.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico)                 + #13#10 +
           '   AND H.FLGDESCONTO IN(0,1)                                        ' + #13#10 +
          ' MINUS                                                               ' + #13#10 +
          ' SELECT PV.MES,                                                      ' + #13#10 +
          '        PV.MESCOBRANCA,                                              ' + #13#10 +
          '        PV.IDPESSJUR,                                                ' + #13#10 +
          '        PV.IDRUBRICA,                                                ' + #13#10 +
          '        PV.IDMOTIVO,                                                 ' + #13#10 +
          '        PV.REFERENCIA,                                               ' + #13#10 +
          '        PV.IDPESSOA,                                                 ' + #13#10 +
          '        PV.SEQRUBRICA,                                               ' + #13#10 +
          '        PV.VALORPROVENTO                                             ' + #13#10 +
          '   FROM CM.PREVIA PV                                                 ' + #13#10 +
          '  WHERE PV.IDLOTE IN (SELECT L.IDLOTE                                ' + #13#10 +
          '           FROM CM.LOTEXHSTFOLHABENEF L                              ' + #13#10 +
          '          WHERE L.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico) + ')  ' + #13#10 +
          ' AND PV.FLGDESCONTO IN (0,1)                                         ' + #13#10 +
          ' AND PV.FLGTIPODESC <> ''K''                                         ';

  if sMsgCritica = '' then
  begin
    If FazQuery(qryAux1, sSQL) Then
    begin
      if qryAux1.recordcount > 0 then
      begin
        sMsgCritica := sMsgCritica + sQuebra +  '- Diferenca de quantidade de registros histrubsal x previa.';
      end;
    end;
  end;

  sSQL :=   'SELECT COUNT(1) QTD FROM HISTRUBSAL H WHERE H.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico) + ' AND H.CODDOCUMENTO IS NULL';

  If FazQuery(qryAux1, sSQL) Then
  begin
    if qryAux1.FieldByName('QTD').AsInteger > 0  then
    begin
      sMsgCritica := sMsgCritica + sQuebra + '- Registros no historico de pagamento sem identificacao do documento financeiro.';
    end;
  end;

  sSQL :=   'SELECT CASE GROUPING(LD.CODDOCUMENTO)                                        ' + #13#10 +
            '           WHEN 1 THEN                                                       ' + #13#10 +
            '            ''Total da Folha no Mês''                                        ' + #13#10 +
            '           ELSE                                                              ' + #13#10 +
            '            TO_CHAR(LD.CODDOCUMENTO)                                         ' + #13#10 +
            '       END AS DOCUMENTO                                                      ' + #13#10 +
            '      ,SUM(LD.VALOR) AS VALOR                                                ' + #13#10 +
            '  FROM LANCTODOCUM LD                                                        ' + #13#10 +
            '  INNER JOIN documento d                                                     ' + #13#10 +
            '   ON ld.coddocumento = d.coddocumento                                       ' + #13#10 +
            '  inner JOIN portadorforma pf                                                ' + #13#10 +
            '  ON pf.codportforma = d.codportforma                                        ' + #13#10 +
            'WHERE LD.CODDOCUMENTO IN (SELECT H.CODDOCUMENTO                              ' + #13#10 +
            '                             FROM HISTRUBSAL H                               ' + #13#10 +
            '                            WHERE H.IDHSTFOLHABENEF = ' + inttostr(aIdHistorico) +
            '                            GROUP BY H.CODDOCUMENTO)                         ' + #13#10 +
            '   AND LD.OPERACAO = 2                                                       ' + #13#10 +
            'GROUP BY ROLLUP(LD.CODDOCUMENTO)                                             ' + #13#10 +
            'ORDER BY LD.CODDOCUMENTO                                                     ' ;

  If FazQuery(qryAux1, sSQL) Then
  begin
    qryAux1.Last;
    if qryAux1.FieldByName('VALOR').AsFloat > 0 then
    begin
      sMsg := 'Folha ' + inttostr(aIdHistorico) + ' gerada com sucesso no valor de R$' + FormatFloat('#,##0.00', qryAux1.FieldByName('VALOR').asfloat) + '. ' ;
      sMsg := sMsg + 'Total de documento(s) gerado(s): ' + IntToStr((qryAux1.recordcount - 1))
    end;
  end;

  if sMsgCritica <> '' then
  begin
    sMsg := 'Folha ' + inttostr(aIdHistorico) + ' gerada com divergencias:';
    sMsg := sMsg + sMsgCritica;
    Monitoramento('EFETIVACAO - INVALIDA',3,sMsg);
  end
  else
  begin
    if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
    begin
      //CargaContraChequeMongo(aIdHistorico); // Andre Imakawa - SIG 102321  // Andre Imakawa - SIG 114804
      Monitoramento('EFETIVACAO - VALIDA',3,sMsg);
    end;
  end;

End;
// Andre Imakawa - SIG 96394 - Fim

procedure TfrmFolhaNormalEfet.GeraArquivoPagamentoLeiauteCNAB150(
  aiidhistorico: integer);
var sPathArquivoRem: String;
    ddatafloat: tdatetime;
begin
  liseqregistroarquivo := 0;

  cdsDocTxt.Close;
  cdsDocTxt.Open;

  while Not qryAux1.eof Do
  begin
    if liseqregistroarquivo Mod 100 = 0 then
      Application.ProcessMessages;
    AlimentaRegistroParaArquivoEletronico;
    qryAux1.next;
  end;

  if (SistemaFolha.FlgConfirmaNoFinal = 0) then
    if Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.starttransaction;


  FCtrlIntBanco := TCtrlIntBanco.Create;
  FCtrlIntBanco.InitializeAs(Padroes);
  FCtrlIntBanco.ValidaDvContaAgencia := false;
  FCtrlIntBanco.FechaQryTexto := false;
  FCtrlIntBanco.IdentficaOrigem := '18';

  if qryProcesso.FieldByName('PATHARQUIVOREM').IsNull Or
    (qryProcesso.FieldByName('PATHARQUIVOREM').AsString = '') then
    //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
    //sPathArquivoRem:='C:\'
    sPathArquivoRem := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)

  else
    sPathArquivoRem := qryProcesso.FieldByName('PATHARQUIVOREM').asString;

  try
    cdsDocTxt.First;
    FCtrlIntBanco.IndiceDoBanco := qryProcesso.FieldByName('CODARQUIVOREMESSA').asinteger;

    if FCtrlIntBanco.VerficaDadosEmpresa('P', qryProcesso.FieldByName('CodPortForma').AsInteger) Then
    begin
      if FCtrlIntBanco.ValidaRemessa('P', cdsDocTxt.data, false) then
      begin
        FCtrlIntBanco.ExibeArquivoGerado := False;
        ddatafloat := strTodate(sDtProgramada); //dptDtProgramada.date;

        FCtrlIntBanco.iFloatExterno := qryProcesso.fieldbyname('DFLOATPAGTO').AsInteger;
        FCtrlIntBanco.iFloatExternoAlt := qryProcesso.fieldbyname('DFLOATPAGTOALTER').AsInteger; ;
        FCtrlIntBanco.MontaPagamentoEletronico(qryProcesso.FieldByName('CODARQUIVOREMESSA').asinteger,
                                               qryProcesso.FieldByName('CONTROLEREMESSA').asinteger,
                                               cdsDocTxt.data,
                                               sPathArquivoRem);
        frameProgresso.ExibeMensagem('Arquivo Eletrônico gerado para:');

        if SistemaFolha.FlgAgrupaArqDocAlt then
          frameProgresso.ExibeMensagem('Contas Caixas x Forma Pagto: ' +
                                        IntToStr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                        qryProcesso.FieldByName('DESCRICAO').asstring)
        else
          frameProgresso.ExibeMensagem(' Documento: ' +
                                       qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                                       'Contas Caixas x Forma Pagto: ' +
                                       inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                       qryProcesso.FieldByName('DESCRICAO').asstring);

        if (SistemaFolha.FlgConfirmaNoFinal = 0) then
          if Not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.starttransaction;

        GravaHstFolhaBenefCAP(aiidhistorico,
                              qryProcesso.fieldbyname('CODDOCUMENTO').asinteger,
                              qryProcesso.fieldbyname('SEQDOCUMENTO').asinteger,
                              0,
                              qryProcesso.fieldbyname('CODPORTFORMA').asinteger,
                              qryProcesso.fieldbyname('PLNCODIGO').asinteger,
                              qryProcesso.fieldbyname('DFLOATPAGTO').asinteger,
                              qryProcesso.fieldbyname('DFLOATPAGTOALTER').asinteger,
                              qryProcesso.fieldbyname('IDFAVDOC').asinteger,
                              0,
                              0,
                              extractfilename(FCtrlIntBanco.NomeArquivoGerado),
                              qryProcesso.fieldbyname('TIPOPORTADOR').asstring);
      end
      else
      begin
        frameProgresso.ExibeMensagem('Erro na geração do arquivo de remessa.');
        frameProgresso.ExibeMensagem(' Documento: ' +
                                     qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                                    'Contas Caixas x Forma Pagto: ' +
                                    inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                    qryProcesso.FieldByName('DESCRICAO').asstring);
        frameProgresso.ExibeMensagem('');
      end;
    end
    else
    begin
      frameProgresso.ExibeMensagem('Problema nos dados do Portador de Pagamento.');
      frameProgresso.ExibeMensagem(' Documento: ' +
                                   qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                                   'Contas Caixas x Forma Pagto: ' +
                                   inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                   qryProcesso.FieldByName('DESCRICAO').asstring);
      frameProgresso.ExibeMensagem('');
    end;
  except
    On E: Exception Do
    begin
      frameProgresso.ExibeMensagem('Problema na geração do arquivo de pagamento.');
      frameProgresso.ExibeMensagem(' Documento: ' +
                                   qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                                   'Contas Caixas x Forma Pagto: ' +
                                   inttostr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                   qryProcesso.FieldByName('DESCRICAO').asstring);
      frameProgresso.ExibeMensagem(e.message);
      frameProgresso.ExibeMensagem('');
    end;
  end;
end;

procedure TfrmFolhaNormalEfet.GeraArquivoPagamentoleiauteCNAB240(
  aiidhistorico, aiTotalArquivo: integer);
  var
    rValorArquivo: Real;
begin
  try
    {
    if aiTotalArquivo = 1 then
      rValorArquivo := qryProcesso.FieldByName('VALORDOC').AsFloat
    else
      rValorArquivo := RecuperaValorSIACC;
    }

    if not SetRegistrosArquivoPagamento(qryProcesso.FieldByName('CODPORTFORMA').AsInteger,
                                        qryProcesso.FieldByName('VALORDOC').AsFloat
                                        ) then                            //Andre Imakawa - SIG 60540
    begin
      frameProgresso.ExibeMensagem('Problema na geração do arquivo de pagamento.');
      frameProgresso.ExibeMensagem(' Documento: ' +
                                   qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                                   'Contas Caixas x Forma Pagto: ' +
                                   IntToStr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                   qryProcesso.FieldByName('DESCRICAO').asstring);
      ProcessamentoOK := false; // Andre Imakawa - SIG 60540                                   
    end;

    iCodDocArq := 0;

    qryAux1.First;
    while not qryAux1.Eof do
    begin
      if not SetFavorecidoArqPagamento(qryAux1.FieldByName('NOME').AsString,  //Nome do recebedor
                                       qryAux1.FieldByName('NUMDOCUMENTO').AsString, //Núemro do CPF
                                       qryAux1.FieldByName('NUMBANCO').AsString, //Número do banco
                                       qryAux1.FieldByName('NUMAGENCIA').AsString, //Número da agência bancária
                                       //Copy(qryAux1.FieldByName('CONTACORRENTE').AsString, 3, length(qryAux1.FieldByName('CONTACORRENTE').AsString)- 3), //Número da conta corrente sem a operação
                                       qryAux1.FieldByName('CONTACORRENTE').AsString, // Andre Imakawa / Cássio Florencio Rovaroto - SIG 101541
                                       qryAux1.FieldByName('TIPOCONTA').AsString,    //Andre Imakawa - SIG 60540
                                       //'1', //Tipo da Operação - Débito em conta   //Andre Imakawa - SIG 60540
                                       Copy(qryAux1.FieldByName('CONTACORRENTE').AsString, 0, 3), //Número da Operação
                                       qryAux1.FieldByName('VALORPROVENTO').AsFloat, //Valor a receber
                                       qryProcesso.FieldByName('CODDOCUMENTO').AsInteger, //Número do documento financeiro
                                       qryAux1.fieldByName('IDRESPONSAVEL').AsInteger, //ID do Recebedor
                                       qryAux1.fieldByName('IDTITULAR').AsInteger //ID do titular do plano de benefício
                                       ) then
      begin
        frameProgresso.ExibeMensagem('Problema na definição do recebedor para o arquivo de pagamento.');
        frameProgresso.ExibeMensagem(' Documento: ' +
                                    qryProcesso.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                    'Recebedor: ' + qryAux1.FieldByName('NOME').AsString);
        frameProgresso.ExibeMensagem('');
        ProcessamentoOK := false; // Andre Imakawa - SIG 60540 
      end;

      if not SetDocumentoArqPagamento(qryProcesso.FieldByName('CODDOCUMENTO').AsInteger,
                                       qryProcesso.FieldByName('CODFORMA').AsInteger,
                                       qryAux1.FieldByName('VALORPROVENTO').AsFloat) then
      begin
        frameProgresso.ExibeMensagem('Problema na definição do documento para o arquivo de pagamento.');
        frameProgresso.ExibeMensagem(' Documento: ' +
                                    qryProcesso.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                    'Recebedor: ' + qryAux1.FieldByName('NOME').AsString);
        frameProgresso.ExibeMensagem('');
        ProcessamentoOK := false; // Andre Imakawa - SIG 60540
      end;

      //SetTarifaBancariaArqPagamento(aiidhistorico,
      //                              qryAux1.FieldByName('IDRESPONSAVEL').AsInteger);

      qryAux1.Next;
    end;

    // Andre Imakawa - SIG 101541 - Inicio
    {
    if not SetStatusDocArquivoPagamento(qryProcesso.FieldByname('CODDOCUMENTO').AsInteger) then
    begin
      frameProgresso.ExibeMensagem('Problema na atualização do status do documento financeiro.');
      frameProgresso.ExibeMensagem(' Documento: ' +
                                   qryProcesso.FieldByName('CODDOCUMENTO').asstring + ' - ' +
                                   'Contas Caixas x Forma Pagto: ' +
                                   IntToStr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                   qryProcesso.FieldByName('DESCRICAO').asstring);
        frameProgresso.ExibeMensagem('');
      ProcessamentoOK := false; // Andre Imakawa - SIG 60540 
    end;
    }
    // Andre Imakawa - SIG 101541 - Fim
    {GravaHstFolhaBenefCAP(aiidhistorico,
                        qryProcesso.FieldByName('CODDOCUMENTO').AsInteger,
                        qryProcesso.FieldByName('SEQDOCUMENTO').AsInteger,
                        0,
                        qryProcesso.FieldByName('CODPORTFORMA').AsInteger,
                        qryProcesso.FieldByName('PLNCODIGO').AsInteger,
                        qryProcesso.FieldByName('DFLOATPAGTO').AsInteger,
                        qryProcesso.FieldByName('DFLOATPAGTOALTER').AsInteger,
                        qryProcesso.FieldByName('IDFAVDOC').AsInteger,
                        0,
                        0,
                        '',
                        qryProcesso.FieldByName('TIPOPORTADOR').AsString);}
  except
    on E: Exception Do
    begin
      frameProgresso.ExibeMensagem('Problema na geração do arquivo de pagamento.');
      frameProgresso.ExibeMensagem(' Documento: ' +
                                   qryProcesso.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                   'Contas Caixas x Forma Pagto: ' +
                                   IntToStr(qryProcesso.FieldByName('CodPortForma').AsInteger) + ' - ' +
                                   qryProcesso.FieldByName('DESCRICAO').AsString);
      frameProgresso.ExibeMensagem(e.message);
      frameProgresso.ExibeMensagem('');
      ProcessamentoOK := false; // Andre Imakawa - SIG 60540 
    end;
  end;
end;

function TfrmFolhaNormalEfet.SetDocumentoArqPagamento(pCodDocumento,
  pCodForma: Integer; pValor: Double): Boolean;
var
  sSQL: string;
  qryArquivoxDocum: TwwQuery;
begin
  Result := False;
  qryArquivoxDocum := TwwQuery.Create(nil);

  try
    qryArquivoxDocum.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    //sSQL :=  'SELECT SEQCODDOCARQ.NEXTVAL CODDOCARQ FROM DUAL ';
    //FazQuery(qryArquivoxDocum, sSQL);

    Inc(iCodDocArq);
    //iCodDocArq := qryArquivoxDocum.FieldByName('CODDOCARQ').AsInteger;
    qryArquivoxDocum.Close;

    sSQL := 'INSERT INTO ARQUIVOXDOCUM (IDARQUIVOPAGTO, CODDOCARQ, ID_DOC_CODBARRAS_PESSOAS, CODFORMA, VALOR, TIPO) VALUES (' +
            IntToStr(iIdArquivoPagto) + ', ' +
            IntToStr(iCodDocArq) + ', ' +
            IntToStr(iIdDocPessoa) + ', ' +
            IntToStr(pCodForma) + ', ' +
            Stringreplace(FloatToStr(pValor), ',', '.', [rfReplaceAll]) + ', ' +
            '2)';

    if ExecutarQuery(qryArquivoxDocum, sSQL) then
      Result := True;
  finally
    FreeAndNil(qryArquivoxDocum);
  end;
end;

function TfrmFolhaNormalEfet.SetFavorecidoArqPagamento(pNome, pDocumento,
  pBanco, pAgencia, pConta, pTipoConta, pOperacao: string; pValor: double;
  pCodDocumento, pIdForCli, pIdTitular: Integer): Boolean;
var
  sSQL: string;
  qryDocumentosxPessoas: TwwQuery;
  
begin
  Result := False;
  qryDocumentosxPessoas := TwwQuery.Create(nil);

  try
    qryDocumentosxPessoas.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    sSQL :=  'SELECT SEQDOCXPESSOAS.NEXTVAL IDDOCUMENTOXPESSOAS FROM DUAL     ';
    FazQuery(qryDocumentosxPessoas, sSQL);

    iIdDocPessoa := qryDocumentosxPessoas.FieldByName('IDDOCUMENTOXPESSOAS').AsInteger;
    qryDocumentosxPessoas.Close;

    sSQL := 'INSERT INTO DOCUMENTOXPESSOAS(IDDOCUMENTOXPESSOAS, CODDOCUMENTO, IDFORCLI, RAZAOSOCIAL, NUMDOCUMENTO, ' +
            'NUMBANCO, NUMAGENCIA, NUMOPERACAO, NUMCONTA, TIPOCONTA, VALOR, FLGIMPORTADO, IDTITULAR) VALUES(' +
            IntToStr(iIdDocPessoa) + ', ' +
            IntToStr(pCodDocumento) + ', ' +
            IntToStr(pIdForCli) + ', ' +
            QuotedStr(pNome) + ', ' +
            QuotedStr(pDocumento) + ', ' +
            QuotedStr(pBanco) + ', ' +
            QuotedStr(pAgencia) + ', ' +
            QuotedStr(pOperacao) + ', ' +
            QuotedStr(pConta) + ', ' +
            QuotedStr(pTipoConta) + ', ' +
            StringReplace(FloatToStr(pValor), ',', '.', [rfReplaceAll]) + ', ' +
            QuotedStr('S') + ', ' +
            IntToStr(pIdTitular) + ')';

    if ExecutarQuery(qryDocumentosxPessoas, sSQL) then
      Result := True;
  finally
    FreeAndNil(qryDocumentosxPessoas);
  end;
end;

function TfrmFolhaNormalEfet.SetRegistrosArquivoPagamento(
  pCodPortForma: Integer; pValorTotal: Double): Boolean;
var
  sSQL : string;
  qryArquivoPagto: TwwQuery;
  iNSA: Integer;
  sNumEmpresaBanco: string;
begin
  Result := False;
  qryArquivoPagto := TwwQuery.Create(nil);
  
  try
    qryArquivoPagto.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    sSQL := 'SELECT SEQARQUIVOPAGTO.NEXTVAL SEQ FROM DUAL ';
    FazQuery(qryArquivoPagto, sSQL);

    iIdArquivoPagto := qryArquivoPagto.FieldByName('SEQ').AsInteger;
    qryArquivoPagto.Close;

    sSQL :=  'SELECT TRIM(NUMEMPRESABANCO) AS NUMEMPRESABANCO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + IntToStr(pCodPortForma);
    FazQuery(qryArquivoPagto, sSQL);
    sNumEmpresaBanco := qryArquivoPagto.FieldByName('NUMEMPRESABANCO').AsString;
    qryArquivoPagto.Close;

    sSQL := 'SELECT SEQ_NSA_SIACC_' + sNumEmpresaBanco + '.NEXTVAL AS NSA FROM DUAL';
    FazQuery(qryArquivoPagto, sSQL);
    iNSA := qryArquivoPagto.FieldByName('NSA').AsInteger;
    qryArquivoPagto.Close;

    sSQL := 'INSERT INTO ARQUIVOPAGTO (IDARQUIVOPAGTO, VLRTOTAL, FLGENVIADO, CODPORTFORMA, NSA) VALUES (' +
            IntToStr(iIdArquivoPagto) + ', ' +
            Stringreplace(FloatToStr(pValorTotal), ',', '.', [rfReplaceAll]) + ', ' +
            QuotedStr('N') + ', ' +
            IntToStr(pCodPortForma) + ', ' +
            IntToStr(iNSA) + ')';

    if ExecutarQuery(qryArquivoPagto, sSQL) then
      Result := True;
  finally
    FreeAndNil(qryArquivoPagto);
  end;
end;

function TfrmFolhaNormalEfet.SetStatusDocArquivoPagamento(
  pCodDocumento: Integer): Boolean;
var
  sSQL: string;
  qryDocumento: TwwQuery;
begin
  Result := False;
  qryDocumento := TwwQuery.Create(nil);

  try
    qryDocumento.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
    
    sSQL := 'UPDATE DOCUMENTO SET STATUS = 1 WHERE CODDOCUMENTO = ' + IntToStr(pCodDocumento);

    if ExecutarQuery(qryDocumento, sSQL) then
    begin
      Result := True;
    end;
  finally
    FreeAndNil(qryDocumento);
  end;
end;

procedure TfrmFolhaNormalEfet.SetTarifaBancariaArqPagamento(aiidhistorico,
  pIdResponsavel: Integer);
var
  sSQL: string;
  qryRateioTarifa, qryTarifaArqPagto: TwwQuery;
  iIdTarifaArqPagto: Integer;
begin
  qryRateioTarifa := TwwQuery.Create(nil);
  qryTarifaArqPagto := TwwQuery.Create(nil);
  try
    qryRateioTarifa.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
    qryTarifaArqPagto.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    sSQL := 'SELECT HS.IDRESPONSAVEL,                                                                        ' +#13#10+
            '       ROUND((HS.PROVENTO / HT.PROVENTO), 2) AS PERCENTUAL,                                     ' +#13#10+
            '       HS.IDPLANOPREV                                                                           ' +#13#10+
            '  FROM (SELECT HS.IDRESPONSAVEL,                                                                ' +#13#10+
            '               HS.IDPLANOPREV,                                                                  ' +#13#10+
            '               SUM(DECODE(PR.FLGDESCONTO,                                                       ' +#13#10+
            '                          0, DECODE(PR.FLGESPECIAL, 0, HS.VALORPROVENTO, 0),                    ' +#13#10+
            '                          DECODE(PR.FLGESPECIAL, 0, HS.VALORPROVENTO * -1, 0))) AS PROVENTO     ' +#13#10+
            '          FROM HISTRUBSAL HS                                                                    ' +#13#10+
            '          JOIN PROVDESC PR                                                                      ' +#13#10+
            '            ON PR.IDPROVENTO = HS.IDRUBRICA                                                     ' +#13#10+
            '         WHERE HS.IDHSTFOLHABENEF = ' + IntToStr(aiidhistorico)                                   +#13#10+
            '           AND HS.IDRESPONSAVEL = ' + IntToStr(pIdResponsavel)                                    +#13#10+
            '         GROUP BY HS.IDRESPONSAVEL, HS.IDPLANOPREV) HS                                          ' +#13#10+
            '  JOIN (SELECT IDRESPONSAVEL, SUM(PROVENTO) AS PROVENTO                                         ' +#13#10+
            '          FROM (SELECT H.IDRESPONSAVEL,                                                         ' +#13#10+
            '                       H.IDPLANOPREV,                                                           ' +#13#10+
            '                       SUM(DECODE(P.FLGDESCONTO,                                                ' +#13#10+
            '                                  0, DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0),              ' +#13#10+
            '                                  DECODE(P.FLGESPECIAL,0,H.VALORPROVENTO * -1, 0))) AS PROVENTO ' +#13#10+
            '                  FROM HISTRUBSAL H                                                             ' +#13#10+
            '                  JOIN PROVDESC P                                                               ' +#13#10+
            '                    ON P.IDPROVENTO = H.IDRUBRICA                                               ' +#13#10+
            '                 WHERE H.IDHSTFOLHABENEF = ' + IntToStr(aiidhistorico)                            +#13#10+
            '                   AND H.IDRESPONSAVEL =' + IntToStr(pIdResponsavel)                              +#13#10+
            '                 GROUP BY H.IDRESPONSAVEL, H.IDPLANOPREV)                                       ' +#13#10+
            '         WHERE PROVENTO >= 0.01                                                                 ' +#13#10+
            '         GROUP BY IDRESPONSAVEL) HT                                                             ' +#13#10+
            '    ON HT.IDRESPONSAVEL = HS.IDRESPONSAVEL                                                      ' +#13#10+
            ' WHERE HS.PROVENTO >= 0.01                                                                      ';
    FazQuery(qryRateioTarifa, sSQL);

    while not qryRateioTarifa.Eof do
    begin
      sSQL := 'SELECT SEQTARIFAARQPAGTO.NEXTVAL AS IDTARIFAPAGTO FROM DUAL ';
      FazQuery(qryTarifaArqPagto, sSQL);

      iIdTarifaArqPagto := qryTarifaArqPagto.FieldByName('IDTARIFAPAGTO').AsInteger;
      qryTarifaArqPagto.Close;

      sSQL :=  'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, PERCENTUAL) VALUES(' +
               IntToStr(iIdTarifaArqPagto) + ', ' +
               IntToStr(iIdArquivoPagto) + ', ' +
               IntToStr(iCodDocArq) + ', ' +
               qryRateioTarifa.FieldByName('IDPLANOPREV').AsString + ', ' +
               TrocaCaracter(qryRateioTarifa.FieldByName('PERCENTUAL').AsString, ',', '.') + ')';

      if not ExecutarQuery(qryTarifaArqPagto, sSQL) then
      begin
        frameProgresso.ExibeMensagem('Problema na definição do valor de tarifa bancária.');
        frameProgresso.ExibeMensagem(' Documento: ' +
                                    qryProcesso.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                    'Recebedor: ' + qryAux1.FieldByName('NOME').AsString);
        frameProgresso.ExibeMensagem('');
        ProcessamentoOK := false; // Andre Imakawa - SIG 60540 
      end;
      qryRateioTarifa.Next;
    end;

  finally
    FreeAndNil(qryRateioTarifa);
    FreeAndNil(qryTarifaArqPagto);
  end;
end;

procedure TfrmFolhaNormalEfet.GeraArquivoSIACC(pIdHstFolhaBenef,
  pQtdRegistrosLote, pQtdLinhasLote: integer);
var
  iQtdArquivosConvenio, i, iCountLinha: Integer;
begin

  GeraArquivoPagamentoleiauteCNAB240(pIdHstFolhaBenef, iQtdArquivosConvenio);

  GravaHstFolhaBenefCAP(pIdHstFolhaBenef,
                        qryProcesso.FieldByName('CODDOCUMENTO').AsInteger,
                        qryProcesso.FieldByName('SEQDOCUMENTO').AsInteger,
                        0,
                        qryProcesso.FieldByName('CODPORTFORMA').AsInteger,
                        qryProcesso.FieldByName('PLNCODIGO').AsInteger,
                        qryProcesso.FieldByName('DFLOATPAGTO').AsInteger,
                        qryProcesso.FieldByName('DFLOATPAGTOALTER').AsInteger,
                        qryProcesso.FieldByName('IDFAVDOC').AsInteger,
                        0,
                        0,
                        '',
                        qryProcesso.FieldByName('TIPOPORTADOR').AsString);

end;
function TfrmFolhaNormalEfet.RecuperaValorSIACC:real;
var
  rValor: real;
begin
  rValor := 0;
  qryAux1.First;
    while not qryAux1.Eof do
    begin
      rValor  := rValor + qryAux1.fieldbyname('VALORPROVENTO').asfloat;
      qryAux1.next;
    end;
  Result := rValor;
end;

// Andre Imakawa - SIG 102321 - Inicio
function TfrmFolhaNormalEfet.CargaContraChequeMongo(pIdFolha: Integer):boolean;
var
  iOk: Boolean;
  sURL, sJSON: string;
  sUsuario, sSenha: string;
  sRetorno: string;
  sSQL: String;
  iCont: Integer; // Andre Imakawa - SIG 112010
begin                                                                                       
  sSQL := ' SELECT COUNT(1) AS QTD'                                                                + _clinefeed +
       '   FROM CM.HSTFOLHABENEF HST '                                                      + _clinefeed +
       '  WHERE HST.FLGTIPOFOLHA IN(0,6)'                                                   + _clinefeed +
       '     AND UPPER(HST.HISTORICO) LIKE ''% FOLHA %'' || TO_CHAR(SYSDATE,''YYYY'')'      + _clinefeed +
       '    AND HST.IDHSTFOLHABENEF = '+ IntToStr(pIdFolha);

  If FazQuery(qryAux1, sSQL) Then
  begin

    if qryAux1.FieldByName('QTD').AsInteger > 0 then
    begin

      sUsuario :=  'svc_folhacontrachequeapp';
      sSenha   :=  'VebwhNI@2020';
      sURL     :=  'https://www.funcef.com.br/api/autoatendimento/contracheque/AtualizarContraChequeApp';
      sJSON    :=  '{"nomeusuario":"'+ sUsuario +'","senha":"'+ sSenha +'"}';

      // Inicio do Monitoramento
      Monitoramento('CARGA CONTRACHEQUE APP',0);
      // Andre Imakawa - SIG 112010 - Inicio
      iCont := 0;
      while iCont <= 2 do
      begin
        iCont:= iCont + 1;
        Sleep(15000);
        try
          // Chamada do Serviço
          iOk := FuncaoGeral.RequestAPI(sURL, sJSON, sRetorno, 'application/x-www-form-urlencoded','');
          sRetorno := FuncaoGeral.RemoveCaracterEspecial(FuncaoGeral.RetiraEnter(sRetorno),False);
          if iOk then
          begin
            if Pos('"Sucesso":true', sRetorno) > 0 then
              Monitoramento('CARGA CONTRACHEQUE APP',1)
            else
            begin
              Monitoramento('CARGA CONTRACHEQUE APP',2,'FALHA NA EXECUCAO DA CARGA. '+ UpperCase(sRetorno));
              CMDebugToFile(sRetorno);
            end;
            Break;
          end
          else
          begin
            CMDebugToFile(sRetorno);
            Monitoramento('CARGA CONTRACHEQUE APP',2,'ERRO NA EXECUCAO DA CARGA. TENTATIVA '+ IntToStr(iCont) + ': '+UpperCase(sRetorno));
          end;
        except
          on E:Exception do
          begin
            CMDebugToFile(sRetorno + '. '+ e.Message);
            Monitoramento('CARGA CONTRACHEQUE APP',2,'FALHA NA CHAMADA DA CARGA. TENTATIVA '+ IntToStr(iCont) + ': '+UpperCase(sRetorno)+ '. '+ e.Message);
          end;

        end;
      end;


    // Andre Imakawa - SIG 112010 - Fim
    end;
  end;
end;
// Andre Imakawa - SIG 102321 - Fim



End.

{-----  -------------------------------------------------------------------------|
| UNIT: FFOLHANORMALEFET                                                       |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   PROCESSA A EFETIVAÇÃO DE UMA PREVIA DE PAGAMENTO DA FOLHA DE BENEFÍCIOS.   |
| FUNCIONALIDADES:                                                             |
| - GRAVAR HISTRUBSAL.                                                         |
| - CONTABILIZA AS RUBRICAS.                                                   |
| - GERA O CONTAS A PAGAR.                                                     |
| - GERA ARQUIVOS BANCÁRIOS.                                                   |
| - VOLTA A SITUAÇÃO PARA ATIVO DE BENEFÍCIOS ENCERRADOS.                      |
| - ABATE A RESERVA RELATIVA AO BENEFÍCIO.                                     |
| - ACERTA OS VALORES DE RETORNO NA TMPDESC.                                   |
| - INCREMENTA OCORRÊNCIA DA RUBRICA INDIVIDUAL.                               |
| - GERA RUBRICA DE COMPENSAÇÃO DE ARREDONDAMENTO.                             |
|                                                                              |
| NOVA ROTINA                                                                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/10/2004 A 14/10/2004                         |
| PENDÊNCIA: 17917                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13o                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PERMITIR A REGERAÇÃO DA CONTABILIZAÇÃO DE UMA VERSÃO EFETIVADA.            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/11/2004 A 22/11/2004                         |
| PENDÊNCIA: 17774 e 18063                                                     |
| VERSÃO PARA LIBERAÇÃO: 3.04.13u                                              |
| CLIENTE: FBRTPREV e CBS                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA QUERY QRYENCERRADO PARA NÃO PEGAR BENEFBFCIARIO SE EVENTO NÃO |
| O ÚLTIMO OU SE BENEFÍCIO FOR DE PAGAMENTO ÚNICO.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE   /  /     A   /  /                             |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}


