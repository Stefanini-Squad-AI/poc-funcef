Unit uCtrlInformeRendimentos;
// Alterações:
{
BuscaInformeGeral
//sig
//-------------------------------------------------------------------------------------------------
//N.Chamado.....: WO31759
//Dt.Alteração..: 11/02/2026
//Responsável...: Paulo Nobre
//Descrição.....: Nos valores da equalização do contecioso judicial, foi incluso uma lógica (SQL)
//                que tenta encontrar uma diferença para ajustar os valores de forma correta. Estes
//                foram lançamentos que não tem processo (idprocjud) e foram lançados pelo compensa.
//--------------------------------------------------------------------------------------------------
//N.Chamado.....: MIGRACAO-ORACLE-2025 (TAS000000006794)
//Dt.Alteração..: 20/10/2025
//Responsável...: Paulo Nobre
//Descrição.....: Ajustes na função: BuscaInformeGeral para incluir o comando
//                CASE em substituição ao DECODE no SELECT e no GROUP BY.
//---------------------------------------------------------------------------------
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. WO..............: 18939
//Data da Alteração..: 13/02/2025
//Responsável........: Edilaine
//Descrição..........: Ajuste na consulta para Informe Pensao 2019
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. WO..............: 18410
//Data da Alteração..: 03/02/2025
//Responsável........: Leandro pocebon
//Descrição..........: Ajuste na consulta para novos codigo informe
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. WO..............: 17932
//Data da Alteração..: 13/01/2025
//Responsável........: Leandro pocebon
//Descrição..........: Ajuste na consulta para novos codigo informe
//*****************************************************************************************************
//Rotina.............: BuscaCampo6sqlPensionistas
//N. WO..............: 7147
//Data da Alteração..: 25/01/2024
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes para corrigir a totalização da compesação quando ocorrida no pensionista
//*****************************************************************************************************
//Rotina.............: BuscaCampo407Detalhado(), BuscaCampo6sqlPensionistas()
//N. SIG.............: 136995
//Data da Alteração..: 30/06/2023
//Responsável........: Marcos Lima
//Descrição..........: Alteração na consulta
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl()
//N. SIG.............: 135421
//Data da Alteração..: 10/05/2023
//Responsável........: Marcos Lima
//Descrição..........: Alteração do complemento
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 133477
//Data da Alteração..: 07/03/2023
//Responsável........: Andre Imakawa
//Descrição..........: Infome 4081 só foi criado em 2015.
//*****************************************************************************************************
//Rotina.............: BuscaLancResidExterior
//N. SIG.............: 132917
//Data da Alteração..: 15/02/2023
//Responsável........: Andre Imakawa
//Descrição..........: Valor de Residente deve considerar os Informes 195 e 196
//*****************************************************************************************************
//Rotina.............: BuscaContribPrevPrivada
//N. SIG.............: 132907
//Data da Alteração..: 14/02/2023
//Responsável........: Andre Imakwa
//Descrição..........: Campo 7- buscar informações da LANCIRRF 
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl, BuscaContribPrevPrivada
//N. SIG.............: 132465
//Data da Alteração..: 03/02/2023
//Responsável........: Leandro Pocebon
//Descrição..........: Campo 7- Informações Complementares, listar os valores das contribuições para Previdência Privada, IDINFORME’s 37, 46 e 133.
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 131510
//Data da Alteração..: 05/01/2023
//Responsável........: André Imakawa
//Descrição..........: Após ajuste do SIG 130588 o sistema não está gerando informaçoes para 2022.
//*****************************************************************************************************
//Rotina.............:
//N. SIG.............: 130588
//Data da Alteração..: 22/11/2022
//Responsável........: Luis Ferrari
//Descrição..........: emitir 2ª via de comprovantes de rendimentos de pensão alimentícia 2017 a 2020
//*****************************************************************************************************
//Rotina.............:
//N. SIG.............: 129805
//Data da Alteração..: 11/10/2022
//Responsável........: Edilaine
//Descrição..........: Ajuste 2a via do informe de rendimentos para layout de 2012
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl
//N. SIG.............: 124504
//Data da Alteração..: 11/04/2022
//Responsável........: Edilaine
//Descrição..........: Ajuste campo 7 para novo layout do comprovante 2021
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 122959
//Data da Alteração..: 04/02/2022
//Responsável........: Edilaine
//Descrição..........: Ajuste para novo layout do comprovante 2021
//*****************************************************************************************************
//Rotina.............: BuscaCodInforme e BuscaInformeGeral
//N. SIG.............: 122151
//Data da Alteração..: 25/01/2022
//Responsável........: Andre Imakawa
//Descrição..........: Ajuste para novo layout do comprovante 2021
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 113334
//Data da Alteração..: 12/02/2021
//Responsável........: Edilaine
//Descrição..........: Correção na forma de considerar os valores de compensação negativos (Campo 3012).
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 98173
//Data da Alteração..: 28/02/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na forma de considerar os valores de contribuições negativas (Campo 302).
//*****************************************************************************************************
//N. SIG.............: 97084
//Data da Alteração..: 31/01/2020
//Responsável........: Tiago Von
//Descrição..........: Desfazer o ajuste do SIG 96227. Ajuste na busca de pensionistas para não
//                     duplicar os valores no campo 7.
//*****************************************************************************************************
//*****************************************************************************************************
//N. SIG.............: 96719
//Data da Alteração..: 23/01/2020
//Responsável........: Ewerton Beltramini
//Descrição..........: Ajuste de layout no campo 7. Trava para exibir a msg em caso especifico.
//*****************************************************************************************************
//Rotina.............: BuscaCampo6sqlPensionistas, BuscaCampo6sqlPensionistas13
//N. SIG.............: 96227
//Data da Alteração..: 16/01/2020
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Ajuste na busca de pensionistas para não duplicar os valores no campo 7.
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 96222
//Data da Alteração..: 15/01/2020
//Responsável........: Rafael Vasconcelos
//Descrição..........: Melhoria de performance quando for pLayout2019Pensao
//*****************************************************************************************************
//Rotina.............: BuscaDepJudicial
//N. SIG.............: 94605
//Data da Alteração..: 04/12/2019
//Responsável........: Edilaine
//Descrição..........: Ajuste no campo 7 para apresentação do valor de IR sobre abono
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl
//N. SIG.............: 81365
//Data da Alteração..: 29/10/2019
//Responsável........: Everson Cunha
//Descrição..........: Inclusão do campo 4.07 de forma detalhada no campo 7.
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl, BuscaInformeGeral
//N. SIG.............: 85183.92415
//Data da Alteração..: 23/10/2019
//Responsável........: Taffarel/Darivaldo
//Descrição..........: Ajuste para a geração do Informe de Rendimentos no layout 2019
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 87715
//Data da Alteração..: 17/06/2019
//Responsável........: edilaine
//Descrição..........: ajuste para a geração do Informe de Rendimentos no layout 2014
//*****************************************************************************************************
//Rotina.............: BuscaDepJudicial
//N. SIG.............: 85090
//Data da Alteração..: 18/04/2019
//Responsável........: Osni Cavalcante
//Descrição..........: Correção no parâmetro de execução da consulta utilizada para geração do Informe
//					   de Rendimentos
//*****************************************************************************************************
//Rotina.............: BuscaDepJudicial 
//N. SIG.............: 81993
//Data da Alteração..: 07/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na forma definição de valores de processos de equcionamento no campo 7.
//*****************************************************************************************************
//Rotina.............: BuscaInformeGeral
//N. SIG.............: 81200
//Data da Alteração..: 05/02/2019
//Responsável........: Everson Cunha
//Descrição..........: Ajustes no código da natureza para o leiaute de 2018 pois estava duplicando o
//                     comprovante de rendimento dos participantes residentes no Exterior.
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl, BuscaDepJudicial
//N. SIG.............: 81572
//Data da Alteração..: 02/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na montagem do campo 7, para processos judiciais, onde o cabeçalho de
//                     identificação só apareça para processos de bitributação.
//*****************************************************************************************************
//Rotina.............: BuscaDepJudicial
//N. SIG.............: 81281
//Data da Alteração..: 02/02/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Corereção aplicada para tratamento correto de processo de equacionamento
//                     indicados com o informe de Exigibilidade Suspensa.
//*****************************************************************************************************
//Rotina.............: BuscaDepJudicial
//N. SIG.............: 81275
//Data da Alteração..: 30/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos códigos de informe para tratar Ação de Equacionamento Informativa.
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl
//N. SIG.............: 81348
//Data da Alteração..: 29/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de informações de RRA para versão do Informe 2018. 
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl, BuscaDepJudicial
//N. SIG.............: 74355
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alterações para inlcusão de novo layout para a DIRF ano-calendário 2018.
//*****************************************************************************************************
//Rotina.............: BuscaDadosCompl, BuscaInformeGeral
//N. SIG.............: 73545
//Data da Alteração..: 15/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação de novo leiaiute para Residentes no Exterior
//*****************************************************************************************************
//Rotina             : Alteração: BuscaInformeGeral. Criação: AlterSession 
//N. SIG..........   : 78304
//Data da Alteração: : 05/12/2018
//Responsável:       : Everson Luiz Pereira da Cunha
//Descrição          : Melhorias conforme solicitado pela TMax. USE_HASH e Alter Session
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 66333
//Data da Alteração: : 10/04/2018
//Responsável:       : Taffarel Sevaybriker
//Descrição          : Ajuste na busca de endereço de correspondência
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 66013
//Data da Alteração: : 02/04/2018
//Responsável:       : Darivaldo Alencar
//Descrição          : Ajustes para erro de invalid data packet
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 64995
//Data da Alteração: : 15/03/2018
//Responsável:       : Luiz Carlos
//Descrição          : Ajustes para erro de invalid data packet
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 64274
//Data da Alteração: : 06/03/2018
//Responsável:       : Luiz Carlos
//Descrição          : Ajustes para emissão de informe sem endereço cadastrado
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 63065
//Data da Alteração: : 16/02/2018
//Responsável:       : Andre Imakawa
//Descrição          : Correção no Group by do SIG 61753.
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 61753
//Data da Alteração: : 18/01/2018
//Responsável:       : Darivaldo Alencar
//Descrição          : não está gerando o comprovante para residentes no exterior.
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 42347
//Data da Alteração: : 06/12/2017
//Responsável:       : Luiz Carlos
//Descrição          : Permitir emissao do Informe de Rendimentos de Pensao Alimenticia mesmo que a pessoa
//                     nao tenha endereco cadastrado.
//*****************************************************************************************************
//Rotina             : BuscaDadosCompl, VerificaRRA
//N. SIG..........   : 60790
//Data da Alteração: : 28/12/2017
//Responsável:       : Andre Imakawa
//Descrição          : Valores do RRA no Quadro 7 não refletem o valor do quadro 6.
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 59560
//Data da Alteração: : 11/12/2017
//Responsável:       : Andre Imakawa
//Descrição          : Qtd meses RRA deve ser exibido quando possui valor maior que zero nos totalizadores
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 50532
//Data da Alteração: : 06/10/2017
//Responsável:       : Andre Imakawa
//Descrição          : Erro de Invalid Data Packet e apenas unir a natureza 3223, quando origem beneficio
//                     e ano maior ou igual a 2015.
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 50147
//Data da Alteração: : 11/07/2017
//Responsável:       : Andre Imakawa
//Descrição          : VLR5031 não pode possuir valores negativos.
//*****************************************************************************************************
//Rotina             : BuscaDadosCompl
//N. SIG..........   : 47630
//Data da Alteração: : 05/06/2017
//Responsável:       : Andre Imakawa
//Descrição          : Informações complementares, quando existir devolução do RRA, deve ser abatido.
//*****************************************************************************************************
//Rotina             : BuscaDadosCompl
//N. SIG..........   : 41085
//Data da Alteração: : 24/02/2017
//Responsável:       : Andre Imakawa
//Descrição          : Não preencher o quadro 7 com determinada informação quando origem for folha de
//                     pagamento.
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 40753
//Data da Alteração: : 08/02/2017
//Responsável:       : Andre Imakawa
//Descrição          : Incluido os campos VLR6012 / VLR6022 / VLR6032/ VLR6042 para verificar se é
//                     maior que zero.
//*****************************************************************************************************
//Rotina             : BuscaDepJudicial
//N. SIG..........   : 40571
//Data da Alteração: : 20/02/2017
//Responsável:       : Andre Imakawa
//Descrição          : Não está gerando as informações de ação judicial no txt
//*****************************************************************************************************
//Rotina             : VerificaRRA
//N. SIG..........   : 40324
//Data da Alteração: : 08/02/2017
//Responsável:       : Andre Imakawa
//Descrição          : RRA não esta respeitando o ano do informe de rendimentos
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 39491
//Data da Alteração: : 08/02/2017
//Responsável:       : William Moreira da Silva
//Descrição          : Valor estava vindo dobrado, para informes de pessoas com dois CPF's na base de IDPESSOAS diferentes
//*****************************************************************************************************
//Rotina             : VerificaRRA
//N. SIG..........   : 37283
//Data da Alteração: : 27/01/2017
//Responsável:       : William Santana
//Descrição          : Criação de novo Layout com inclusão de informações de RRA
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 29212
//Data da Alteração: : 12/09/2016
//Responsável:       : Andre Imakawa
//Descrição          : Erro na impressão do informe de rendimento folha de Benefícios
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 24855/26744
//Data da Alteração: : 17/08/2016
//Responsável:       : William Moreira da Silva
//Descrição          : Os Valores eram duplicados no demostrativo
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 27224
//Data da Alteração: : 12/08/2016
//Responsável:       : Andre Imakawa
//Descrição          : Prezados, a rotina de reação do comprovante esta duplicando o informe de
//                     rendimentos para o CPF 00993069134 quando marcado o Flag: "Separar Pensão Alimentícia".
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SIG..........   : 19602
//Data da Alteração: : 05/05/2016
//Responsável:       : Edilaine
//Descrição          : quando não há valores para o beneficiário (soma dos totais for zero) os dados
//                     estão sendo incluidos no TXT
//*****************************************************************************************************
//Rotina             : AcertaBuscaPorCPF, AjustaEndereco()
//N. SOL..........   : 270094
//N. PPM..........   : 1349684
//Data da Alteração: : 29/03/2016
//Alteração Form:    :
//Responsável:       : Darivaldo Alencar
//Descrição          : correção do erro do informe de rendimentos de todos os empregados com pensão
                       alimentícia
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral, AjustaEndereco()
//N. SOL..........   : 269789
//N. PPM..........   : 1312365
//Data da Alteração: : 22/02/2016
//Alteração Form:    :
//Responsável:       : William Santana
//Descrição          : Acerto na geração para pensão alimentícia gerais na substituição do valor IdPessoa pelo sCPF
//*****************************************************************************************************
//Rotina             : AcertaBuscaPorCPF, AjustaEndereco()
//N. SOL..........   : 269456
//N. PPM..........   : 1301364
//Data da Alteração: : 22/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acertos gerais na substituição do valor IdPessoa pelo sCPF
//*****************************************************************************************************
//Rotina             : Diversas funções
//N. SOL..........   : 269300
//N. PPM..........   : 1293033
//Data da Alteração: : 15/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Colocar TRUNC(LI.VLRLANC,2) em todos os LI.VLRLANC
//*****************************************************************************************************
//Rotina             : BuscaInformeGeral
//N. SOL..........   : 269130
//N. PPM..........   : 1284502
//Data da Alteração: : 04/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acertos para não duplicar informe e arquivo
//*****************************************************************************************************
//Rotina             : BuscaDepJudicial
//N. SOL..........   : 268775
//N. PPM..........   : 1268748
//Data da Alteração: : 01/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Erro causado (General SQL error. ORA-01762: vopdrv: view query block not in FROM)
//                     foi justificado pelos DBA´s como:
//                     "...este erro ocorre em função de um bug que so pode ser resolvido na versao 11gR2.
//                      Um workaround seria reescrever a querie sem o when clause..."
//                     Sendo assim o SQL sofreu ajustes para atender rapidamente à solução.
//*****************************************************************************************************
//Rotina             : BuscaDadosInforme, BuscaDadosCompl
//N. SOL..........   : 268555
//N. PPM..........   : 1262100
//Data da Alteração: : 25/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Comentado na query principal que gera o informe de rendimento
//                     os campos: X.IDPESSOA, B.MATRICULA, X.IDENDERECO
//                     Comentado a condição do LANCIRRF IS NOT NULL
//***************************************************************************
//Rotina             : BuscaInformeGeral
//N. SOL..........   : 268577
//N. PPM..........   : 1263035
//Data da Alteração: : 27/01/2016
//Alteração Form:    :
//Responsável:       : Felipe A. Santos
//Descrição          : ajuste do campo 501 para folha de pagamento
//***************************************************************************
//Rotina             : MontaLinhaRegistroTipoCinco, MontaLinhaRegistroTipoQuatro
//N. SOL..........   : 268002
//N. PPM..........   : 1245182
//Data da Alteração: : 19/01/2016
//Alteração Form:    :
//Responsável:       : Fernando Xavier
//Descrição          : Inclusão de novos campos 4082, 5032, TOT408, TOT503
//Observação         : Foi incluido apenas o campo no arquivo não sendo passado os
//                     respectivos valores, pois os campos ainda não existem em produçao.
//***************************************************************************
//Rotina             : BuscaInformeGeral, AcertaBuscaPorCPF
//N. SOL..........   : 257831/18009
//N. PPM..........   : 1207646
//Data da Alteração: : 28/12/2015
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Inclusão de novos campos 4081, 5031, TOT408, TOT503
//                      e ajuste no somatorio dos 3011, 3041, 4021, 5011, 5021
//***************************************************************************
Analista.: Wylliam Leite da Silva SOL 248939 PPM 997373 // Fernando Xavier
Data.....: 29/07/2015
Sol......: 248939
PPM......: 997373
Descrição: Estava acontecendo um problema de duplicidade quebrando o agrupamento
           da query que gera o txt, o problema acontecia porque está fixo o
           código de natureza mas a sua descrição não.... para contornar esse
           problema foi preciso "chumbar" a descrição correspondente ao codigo
           de natureza chumbado.
*******************************************************************************
Analista.: Wylliam Leite da Silva SOL 252724 PPM 762428
Data.....: 23/04/2015
Sol......: 252724
PPM......: 762428
Descrição: Ajustar a consulta de geração do comprovante de rensimentos
*******************************************************************************
Analista.: Wylliam Leite da Silva SOL 250062 PPM 733801
Data.....: 10/04/2015
Sol......: 250062
PPM......: 733801
Descrição: Ajustar a consulta responsavel pela gerações do comprovante pois a
           consulta não esta considerando os valores de contribuição positiva.
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 247324 PPM 653497
Data.....: 04/02/2015
Sol......: 247324
PPM......: 653497
Descrição: Ajuste na emissão do arquivo txt para pensão alimenticia.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247950 PPM 659247
Data.....: 04/02/2015
Sol......: 247950
PPM......: 659247
Descrição: Ajuste na dedução da Tributação exclusiva.
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
Data.....: 26/01/2015
Sol......: 246306/16909
PPM......: 645896
Descrição: Retirado a condição que verificava o saldo da contribuição no ano base
           correspondente ao parametrizado na tela, para apresentar o valor na linha
           7ª informações complementares, referente o saldo de contribuição, para
           todos os participantes que tenham saldo.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247267/16925 PPM 652769
Data.....: 29/01/2015
Sol......: 247267/16925
PPM......: 652769
Descrição: Ajuste para retirar a tabela HistRubSal.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247267/16926 PPM 652768
Data.....: 29/01/2015
Sol......: 247267/16926
PPM......: 652768
Descrição: Ajuste para retirar a tabela RubricaIndiv.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247267/16924 PPM 652717
Data.....: 29/01/2015
Sol......: 247267/16924
PPM......: 652717
Descrição: Ajuste para retirar o indice desnecessario.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247267 PPM 647931
Data.....: 06/01/2015
Sol......: 247267
PPM......: 647931
Descrição: Ajuste na query que tinha um campo fixo.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 247174 PPM 647931
Data.....: 06/01/2015
Sol......: 247174
PPM......: 647931
Descrição: Ajuste na query que tinha um campo fixo.
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
Data.....: 15/01/2015
Sol......: 245841
PPM......: 629389
Descrição: adicionado no informe de rendimentos a linha 5.2 referente ao IRRF do
           13º Salário do funcionário para folha de pagamento.
-------------------------------------------------------------------------------
Analista.: Felipe A. Santos
Data.....: 06/01/2015
Sol......: 244545/16839
PPM..: 624515
Descrição: Incluído um novo union  na rotina BuscaInformeGeral para pegar os
           valores de IRº do 13 Salário.
-------------------------------------------------------------------------------
Analista.: Thiago Melo
Data.....: 01/04/2014
Sol......: 228632.15927
Kintana..: 2062830
Descrição: Alterar qry responsável pelas informações de pensão alimentícia do
           comprovante Folha de Pagamento.
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 236827 PPM 500319
Data.....: 28/01/2014
Sol......: 236827
PPM......: 500319
Descrição:Ajuste para atendimento de todas as folhas independente se estiver
maiscula ou minuscula.
-------------------------------------------------------------------------------
Analista.: Fernando Xavier SOL 226163 Kintana 2059950
Data.....: 21/02/2014
Sol......: 226163
Kintana..: 2059950
Descrição: Ajustado solicitados em plantao
-------------------------------------------------------------------------------
Analista.: Fernando Xavier/Edilaine Ferraresi
Data.....: 21/02/2014
Sol......: não ha (SOL XXX)
Kintana..: não ha (KTN XXX)
Descrição: Ajustado solicitados em plantao
-------------------------------------------------------------------------------
Analista.: William Santana
Data.....: 12/02/2014
Sol......: 226121.15703
Kintana..: 2060120
Rotina...: bbtnGeraTxtClick , GeraInformeFuncef
Descrição: Adição da descrição dos informes de rendimentos
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 225024 KINTANA 2059224
Data.....: 05/02/2014
Sol......: 225024
Kintana..: 2059224
Rotina...: BuscaInformeGeral
Descrição: Ajuste no sql para retirar informes anteriores a 2010
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 217765 KINTANA 2059157
Data.....: 28/01/2014
Sol......: 217765
Kintana..: 2059157
Rotina...: BuscaInformeGeral
Descrição: Ajuste no layout do txt conforme necessidade
-------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
Data.....: 28/01/2014
Sol......: 223465
Kintana..: 2058652
Rotina...: BuscaInformeGeral
Descrição: Adicionado os seguintes códigos naturezas (3556, 3579 )amarrados aos
(3223, 5565) respectivamentes
-------------------------------------------------------------------------------
Analista.: Thiago Melo
Data.....: 15/01/2014
Sol......: 223141/15622
Kintana..: 2057248
Rotina...: BuscaInformeGeral
Descrição: Ajustar a consulta para que apresente todas as informações do RRA
           quando o pariticipante possuir mais de um idpessoa.
********************************************************************************
Analista.: William Moreira da Silva
Data.....: 13/01/2014
Sol......: 223696
Kintana..: 2057501
Rotina...: BuscaInformeGeral
Descrição: Ajustar a consulta responsavel pela gerações do arquivo
********************************************************************************
Analista.: William Santana
Data.....: 03/12/2013
Sol......: 219338.15472
Kintana..: 2054550
Rotina...: BuscaInformeGeral
Descrição: Adição da descrição dos informes de rendimentos
********************************************************************************
Analista.: William Moreira da Silva
Data.....: 09/01/2014
Sol......: 223220
Kintana..: 2057177
Rotina...: BuscaInformeGeral
Descrição: Ajustar a consulta responsavel pela gerações do arquivo
********************************************************************************
Analista.: Edilaine Ferraresi / Marcio Sanches Spinosa SOL 216973 KINTANA 2046352
Data.....: 18/09/2013
Sol......: 216973
Kintana..: 2046352
Rotina...: BuscaInformeGeral
Descrição: Ajuste no decode, que estava com uma condição incorreta
********************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Sol......: 202259
Kintana..: 2042903
Rotina...: BuscaInformeGeral
Descrição: agrupar informes 3533 e 3540 na busca e mudança na regra do 3011
********************************************************************************
Analista.: Edilaine
SOL......: 196824
Kintana..: 1884092
Data.....: 13/12/2012
Rotina...: BuscaDepJudicial, BuscaInformeGeral
Descrição: nao esta considerando ações judiciais
------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 207914 Kintana 2028712
SOL......: 207914
Kintana..: 2028712
Data.....: 02/07/2013
Rotina...: BuscaInformeGeral
Descrição: Ajuste nos filtros retirando os códigos da soma de RRA
------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 208778 Kintana 2023148
SOL......: 208778
Kintana..: 2023148
Data.....: 25/06/2013
Rotina...: BuscaInformeGeral
Descrição: Ajuste nos filtros adicionando os codigos 3540 e 3533
------------------------------------------------------------------------------
Analista.: Otacilio
SOL......: 204397
Kintana..: 1980838
Data.....: 16/04/2013
Rotina...: BuscaInformeGeral
Descrição: Ajuste na query adicionando a condição "R.DATAFINAL IS NULL"
           na consulta .
------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 203200 Kintana 1963444
SOL......: 203200
Kintana..: 1963444
Data.....: 19/03/2013
Rotina...: BuscaInformeGeral
Descrição: Validação para pegar a pensão alimenticia ativa.
------------------------------------------------------------------------------
Analista.: Marcio Sanches Spinosa SOL 201709 Kintana 1954579
SOL......: 201709
Kintana..: 1954579
Data.....: 12/03/2013
Rotina...: BuscaCampo6sqlPensionistas, BuscaCampo6sqlPensionistas13
Descrição: Ajuste para criar um array com os IDS da pessoa que possuem o
           mesmo CPF.
{------------------------------------------------------------------------------
Analista.: Felipe Santos
SOL......: 199572
Kintana..: 1948484
Data.....: 26/02/2013
Rotina...: BuscaInformeGeral
Descrição: ajuste no total (TOT501) das soma dos campos INSS e FUNCEF na geração de
           informe de rendimentos.
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 199978
Kintana..: 1925538
Data.....: 01/02/2013
Rotina...: BuscaDadosInforme, BuscaInformeGeral
Descrição: ajustes para geração correta do informe de rendimentos
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 197664
Kintana..: 1894007
Data.....: 21/12/2012
Rotina...: BuscaCampo6sqlPensionistas, BuscaInformeGeral
Descrição: Melhora na performance da geração do informe
{------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 200107
Kintana..: 1927826
Data.....: 01/02/2013
Rotina...: BuscaCampo6sqlPensionistas13
Descrição: acertar geração do valor da pensão alimentícia do 13º salário na linha
           6 - Informações Complementares do informe de rendimentos
{-------------------------------------------------------------------------------
Analista.: RODRIGO DE BRITO FIGUEREDO
SOL......: 199065
Kintana..: 1915799
Data.....: 24/01/2013
Descrição: alteração na geração do comprovante de rendimentos RRA
{------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 198419
Kintana..: 1908788
Data.....: 09/01/2013
Rotina...: BuscaDadosCompl
Descrição: permitir impressão no campo 7 de mais de um processo quando houver
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 198119
Kintana..: 1906990
Data.....: 09/01/2013
Rotina...: BuscaDepJudicial
Descrição: correção do rendimento 13º exigibilidade suspensa, pois está deduzindo
           2x o valor do IR Jud 13º na impressão do campo 7
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 180189
Kintana..: 1761859
Data.....: 03/09/2012
Rotina...: BuscaInformeGeral, _cdsAux, _sqlDados
Descrição: ajustes para melhorar performance,
--------------------------------------------------------------------------------
Analista.: Vander Campos
SOL......: 190550
Kintana..: 1802481
Data.....: 25/09/2012
Descrição: Ajuste em BuscaPeloCpfAno    - Retorna    IdPessoa em Vetor
           Ajuste em BuscaInformeGeral - Utilização IdPessoa em Vetor
--------------------------------------------------------------------------------
Analista.: Otacilio Aquino
SOL......: 189126
Kintana..: 1786515
Data.....: 04/09/2012
Rotina...: BuscaPeloCpfAno
Descrição: Ajuste quando for buscar pensão alimenticia.
--------------------------------------------------------------------------------
Analista.: MARCIO SANCHES SPINOSA
SOL......: 188606
Kintana..: 1777834
Data.....: 24/08/2012
Rotina...: BuscaInformeGeral
Descrição: AJUSTE no sql, para Pensionistas antes de 2011
-------------------------------------------------------------------------------
Analista.: MARCIO SANCHES SPINOSA
SOL......: 182769
Kintana..: 1705106
Data.....: 19/06/2012
Rotina...: BuscaInformeGeral
Descrição: AJUSTE NO DESEMPENHO DA BUSCAINFORMEGERAL.
-------------------------------------------------------------------------------
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 173817
Kintana..: 1568367
Data.....: 07/02/2012
Rotina...: BuscaInformeGeral
Descrição: Ajuste das clausulas Where para funcionar corretamentmente quando se
           busca sem o filtro de CPF.
-------------------------------------------------------------------------------
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 173637
Kintana..: 1567006
Data.....: 04/02/2012
Rotina...: BuscaInformeGeral
Descrição: Alteração do SOL 168331 para utilizar a tabela InformeAux.
-------------------------------------------------------------------------------
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 170987
Kintana..: 1528710
Data.....: 25/01/2012
Rotina...: BuscaInformeGeral
Descrição: A rotina da busca do Informe, foi alterada para a inclusaão do campo
           Quantidade de Meses e para debitação dos Valores de RRA.
-------------------------------------------------------------------------------
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 05/01/2012
Rotina...: BuscaInformeGeral e BuscaDepJudicial
Descrição: Foi adicionado o filtro por ano Vigência na query para que as
           alterações na tabela informe tenham sentido.
-------------------------------------------------------------------------------
Rotina      : BuscaInformeGeral
Data        : 18/08/2011
Autor       : Eraldo Luis
SOL_Kintana : 135079_813939
Descrição   : Correção da rotina para quando náo houvesse informacao do campo FLGTIPOREG
              da tabela LANCXINFORME permitir a impressáo do COMPROVANTE DE RENDIMENTOS
              isso para os casos do ano de 2005 onde essa FLAG ainda não era utilizada.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaInformeGeral
Data        : 21/05/2010
Autor       : Marcos Luiz
SOL_Kintana : 135079_813939
Descrição   : Correção da rotina de Emissão do Informe de Rendimentos e Criação da Script
              para correção de unificar para o IDPESSOA mais novo do beneficiario na tabela
              LANCIRRF
---------------------------------------------------------------------------------------------------
Rotina      : BuscaInformeGeral
Data        : 23/02/2010
Autor       : Bruno Bastos
SOL_Kintana : 131338_746878
Descrição   : Alteração na consulta para ordenação também pelo CEP.
----------------------------------------------------------------------------------------------------
Rotina      : BuscaDepJudicial
Data        : 25/01/2010
Autor       : Bruno Bastos
SOL_Kintana : 129764_715253
Descrição   : Ajuste para acerto na consulta de ação judicial.
----------------------------------------------------------------------------------------------------
Rotina      : BuscaDadosCompl
Data        : 29/07/2009
Autor       : Bruno Bastos
SOL_Kintana : 119417_571974
Descrição   : Condicionar a mensagem da solicitação 108632 em dados complementares ao ano do informe.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaDepJudicial
Data        : 07/04/2009
Autor       : Bruno Bastos
SOL_Kintana : 113554_528458
Descrição   : Coloquei um NVL na query que busca o IR de 13º de ação judicial.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaDadosCompl
Data        : 25/03/2009
Autor       : Bruno Bastos
SOL_Kintana : 112398_520072
Descrição   : Alteração na descrição conforme solicitou o cliente.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaDepJudicial
Data        : 25/03/2009
Autor       : Bruno Bastos
SOL_Kintana : 111063_519084
Descrição   : Ajuste na query que busca ação judicial para acertar o rendimento de 13º.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaInformeGeral
Data        : 19/03/2009
Autor       : Bruno Bastos
SOL_Kintana : 111877_516340
Descrição   : No mesmo ponto do chamado abaixo troquei o campo vlr+código por vlr+código+_seneg. Ou
              seja, onde seria vlr5011 passa a ser vlr5011_SeNeg.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaInformeGeral
Data        : 13/03/2009
Autor       : Bruno Bastos
SOL_Kintana : 111231_513489
Descrição   : Fazer a compensação de valor negativo para 13º se o líquido for negativo.
---------------------------------------------------------------------------------------------------
Rotina      : BuscaDadosCompl
Data        : 12/02/2009
Autor       : Ádler Teodoro de Souza
SOL_KINTANA : 108632_492608
Descrição   : Inclusão de texto, no campo 6 (Informações Complementares) do comprovante de rendimentos
              conforme solicitado.
---------------------------------------------------------------------------------------------------
Autor(a)    :  Ádler Teodoro de Souza
Data        :  27/02/2009
Pendência   : SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------------------------
Rotina      : BuscaInformeGeral
Data        : 04/02/2009
Autor       : Bruno Bastos
SOL_Kintana : 106641_478069
Descrição   : Ajuste para não duplicar quando a pessoa tiver dois titulares na depentit.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 29/01/2009
Autor     : Bruno Bastos
SOL_Kintana : 106642_478070
Descrição : Ajuste para não mostrar valor negativo para décimo terceiro.
----------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 27/01/2009
Autor     : Bruno Bastos
Kintana   : 463663
SOL       : 103796
Descrição : Ajuste na query que busca os valores de ação judicial.
--------------------------------------------------------------------------------------------------
Rotina    : BuscaPensaoEJudicial
Data      : 28/02/2008
Autor     : Bruno Bastos
Pendencia : 27492
Descrição : Ajuste na query que busca os valores de ação judicial.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 14/02/2008
Autor     : Bruno Bastos
Pendencia : 27379
Descrição : Tratamento no campo P.NumDocumento na query para não imprimir CPF com menos de 11 posi_
            ções. Se no banco estiver cadastrado uma situação assim, mostrar um cpf zerado.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaCompensaIR
Data      : 11/02/2008
Autor     : Bruno Bastos
Pendencia : 24752
Descrição : Ajuste para sair no informe compensação de IR em informações complementares mesmo se o registro da pessoa tiver data final para frente.
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Rotina    : BuscaDadosCompl
Data      : 08/02/2008
Autor     : Claudio Faria
Pendencia : 27383
Descrição : Ajuste para sair informações complementares do informe.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 06/02/2008
Autor     : Claudio Faria
Pendencia : 27302 (ReAbertura)
Descrição : Ajusta no retorno do informe de PA que estava acumulando linhas anteriores.
----------------------------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 31/01/2008
Autor     : Bruno Bastos
Pendencia : 27342
Descrição : Alteração na query que busca os valores pagos a consiginatários.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 31/01/2008
Autor     : Claudio Faria
Pendencia : 27302 (ReAbertura)
Descrição : Ajusta no retorno do informe de PA que estava acumulando linhas anteriores.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaIDPessJur
Data      : 31/01/2008
Autor     : Claudio Faria
Pendencia : 27341
Descrição : Ajuste na geração do arquivo TXT do informe da FUNCEF
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 25/01/2008
Autor     : Claudio Faria
Pendencia : 27304
Descrição : Não permitir que gere duas linhas de informe para o mesmo idpessoa.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 25/01/2008
Autor     : Claudio Faria
Pendencia : 27302
Descrição : Ajusta no retorno do informe de PA que estava acumulando linhas anteriores.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaInformeGeral
Data      : 17/12/2007
Autor     : Bruno Bastos
Pendencia : 26341
Descrição : Só buscar registros de ação judicial quando a opção de Origem escolhida for Folha de Be_
            nefícios ou Todas as Origens.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaCompensaIR
Data      : 13/12/2007
Autor     : Bruno Bastos
Pendencia : 24752
Descrição : Buscar também registros gerados na natureza 7431 e 7416.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaCampo6sqlPensionistas e BuscaCampo6sqlPensionistas13.
Data      : 23/11/2007
Autor     : Bruno Bastos
Pendencia : 26816
Descrição : Não busca informações que ainda não teve busca gerada.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaDadosCompl
Data      : 09/11/2007
Autor     : Bruno Bastos
Pendencia : 24752
Descrição : Contemplar a compensairrf na impressão do informe de rendimento.
----------------------------------------------------------------------------------------------------
Rotina    : BuscaDadosTxt(...), BuscaDadosInformeMatriculas(...), BuscaInformeGeral(...)
Data      : 08/10/2007
Autor     : André Pontes
Pendencia : 26341
Descrição : Separação dos informes de rendimentos sujeitos a tributação regressiva (naturezas 3223 e 5565)
---------------------------------------------------------------------------------------------------}

// Bruno Bastos
// Pendencia 21926
// Rotinas: BuscaCodEmProp
// 13/09/2007
// Fazer o teste pelo código do cliente e não pelo nome.

// Bruno Bastos
// Pendencia 26486
// Rotinas: BuscaInformeGeral
// Data: 02/10/2007
// Acerto para imprimir o nome do responsável e a data informada na tela.

// Bruno Bastos
// Pendencia 26210
// Rotinas: BuscaInformeGeral
// 28/08/2007
// Acerto na query pois estava fazendo um produto cartesiano. Além disso filtrar somente a natureza
// de rendimento de ação judicial na subquery que busca os valores de decisões judiciais.

// Bruno Bastos
// Pendência 20091
// Rotinas: Rotinas referentes a ação judicial
// 19/07/2007
// Identação do código inteiro e ajuste na query que busca valores da procjud

// Bruno Bastos
// Pendencia 25058
// Rotinas: BuscaCampo6sqlPensionistas13
// 09/05/2007
// Buscar as rubricas independente do valor do campo flgdesconto quando for folha de pagamento e o
// campo codrubclt tem de ser igual a 50017 que indica que a rubrica é referente a décimo-terceiro.

// Bruno Bastos
// Pendencia 24570
// Rotinas: BuscaDadosCompl
// 27/04/2007
// Não subtrair o valor do rendimento de 13º de ação judicial pelo rendimento mensal.

// Bruno Bastos
// Pendencia 24530
// Rotinas: BuscaDadosInforme, BuscaDadosInformeMatriculas e BuscaDadosInforme
// 20/04/2007
// Buscar separadamente a pensão alimenítica dos outros rendimentos.

// Claudio Faria
// Pendencia 24858
// Rotinas: BuscaCampo6sqlPensionistas e BuscaCampo6sqlPensionistas13
// 23/03/2007
// Ajuste na rotina para listar os dados complementares corretamente

// Claudio Faria
// Pendencia 24431
// Rotina BuscaInformeGeral
// 27/02/2007
// União das query do informe

// Claudio Faria
// Pendencia 24431
// Rotina BuscaDadosInformeMatricula
// 27/02/2007
// Alteração na query para não pegar o alimentado e sim o alimentante

// Claudio Faria
// Pendencia 24544
// Rotina
// 15/02/2007
// Ajuste na rotina para não exibir dados da Folha de Benefício na Folha de Pagamento

// PAULO RAMOS
// Pendencia NÃO TEM
// Rotina VÁRIAS
// 14/02/2007 - 19:20 (buscar este comentário)
// Colocar filtro na RubricaIndiv para separar folha de benefícios da folha de empregados

// Claudio Faria
// Pendencia 20708 (Reabertura)
// Rotina BuscaDadosInforme, BuscaDadosInformeMatricula
// 31/01/2007
// Alterada a query para retornar o somente o endereço de correspondencia

// Bruno Bastos
// Rotina Todas
// 19/01/2007
// Alterar todos os lugares onde usa datalancamento pela datapagamento.

// Claudio Faria
// Pendencia 23062
// Rotina BuscaDadosInforme
// 08/12/2006
// Incluido 2 sub-selects para retornar  se possui pensionista e ou Processo

// Bruno Bastos
// Pendencia 22106
// Rotina BuscaDadosInformeMatriculas
// 13/04/2006
// Acertei o join da ListaFolhaBenefDet com a RubricaIndiv.

// Bruno Bastos
// Pendencia 21994
// Rotina BuscaDadosInforme
// 07/04/2006
// Coloquei um if TipoCliente

// Bruno Bastos
// Pendencia 21573
// Rotina BuscaDadosInforme
// 16/02/2005
// Coloquei um rigth join.

// Paulo Ramos
// Pendencia 21490
// Rotina BuscaDadosInforme e BuscaDadosInformeMatriculas
// 08/02/2006
// Filtrar por IDMODULORESPON ao invés do IDMODULO.

// Bruno Bastos
// Pendencia 21364
// Rotina BuscaCampo6sqlPensionistas13
// 31/01/2006
// Coloquei a condição flgdesconto <> 2 para não calcular nada com rubricas informativas

// Bruno Bastos
// Pendencia 21428
// Rotina BuscaCampo6Outros
// 30/01/2006
// Buscar o idinforme 35 para a brtprev.

// Paulo Ramos
// Pendencia 21288 (reabertura)
// Rotina BuscaDadosInforme e BuscaDadosInformeMatriculas
// 23/01/2006
// Não gerar arquivos para natureza de rendimento 7893 (IOF).

// Bruno Bastos
// Pendencia 21288
// Rotina BuscaDadosInforme e BuscaDadosInformeMatriculas
// 19/01/2006
// Não gerar arquivos para natureza de rendimento 7893 (IOF).

// Bruno Bastos
// Pendencia 20708
// Rotina Várias
// 02/01/2006
// Gerar arquivo de crítica de endereço.

// Bruno Bastos
// Pendencia 19963 e 20108
// Rotina Várias
// 29/12/2005
// Gerar informe utilizando a lista de recebedores.

// Bruno Bastos
// Pendencia 20125
// Rotina BuscaCampo6sqlPensionistas
// 12/09/2005
// Não buscar informações de rubricas informativas.

// Marchetti
// Pendencia 18790
// Rotina BuscaDadosInforme
// 07/03/2005
// Separar a impressão dos informes normais dos informes de pensão alimentícia

// Marchetti
// Pendencia 16300
// 15/07/2004
// Permitir a seleçào de mais de uma matricula

Interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, Classes,
  uCmTypes, DB, JCLSysUtils, uFuncaoGeral, uSistema, uCMFileUtils, wwQuery;

Type
  //Vander - SOL: 190550 - Kintana: 1802481
  TPessoa_InformeRendimentos = Class
  Private
    FIDPessoa: Array Of Integer;
  Public
    Procedure Add(Value: integer);
    Function GetSql: String;
  End;
  //

  TCtrlInformeRendimentos = Class(TCmControlObject)
  Private
    ReemBolsoINSSPA13:  TStringlist; //SIG85183.92415
    FuncaoGeral: TFuncaoGeral;

    _cdsAux: TCMClientDataSet; // Edilaine - SOL 180189 / KTN 1761859
    _sSqlDados: TStringList; // Edilaine - SOL 180189 / KTN 1761859

    Function BuscaCodInforme(pAno: string): Olevariant;
    Procedure AcertaBuscaPorCPF(Const oSql, oResult, oEndereco: TCmClientDataSet;
      Const sDataPagtoIni, sDataPagtoFim: String;
      Const bPensao: Boolean);
    Function AcertaSql(Const pTexto: String): String;
    Function AcertaEnderecoFaltante(Const oDadosSql: OleVariant): OleVariant;

    //function BuscaReembolsoINSS_PA():OleVariant;
    Function GetHint(pAno: String): String; // Marcos Lima SIG136995

  Protected
    Procedure AfterInitialize; Override;
  Public
    pTipoAposentadoPensionistas: boolean; //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834
    pLayout2016: boolean; //William Santana - SIG 37283
    pLayout2018: Boolean;
    pLayout2019: Boolean; //SIG85183.92415
    pLayout2021: Boolean; // Andre Imakawa - SIG122151
    pLayout2019Pensao: Boolean; //SIG85183.92415
    pLayoutResgate: boolean; //edilaine SIG129805

    iNumIN:      String; //SIG85183.92415

    function BuscaReemBolsoINSSPA13: Double; //SIG85183.92415

    Function BuscaCodEmProp: integer;

    Function BuscaEmpresaProp(iIdPessoaProp: Integer): Olevariant;

    Function BuscaDadosInforme(iIdPessoa: Double; iIdEmpresaProp, iAno, isistema: Integer; sRubrica, nomeResp, DataInf: String; bPensao: Boolean = False; bPensaoSeparada: Boolean = True): Olevariant;

    Function BuscaDadosInformeMatriculas(sMatriculas: String; iIdEmpresaProp, iAno, isistema: Integer; sRubrica, nomeResp, DataInf: String; bPensao: Boolean = False; pIdListaUsuario: Integer = 0; bPensaoSeparada: Boolean = True): Olevariant;
    Function BuscaPorMatriculas(sMatricula: String): OleVariant;

    Function BuscaDadosCompl(iIdPessoa: Double;
      iAno, isistema: Integer;
      sRubrica: String;
      bPensao: Boolean;
      pStrCPF: String = ''): String; //Marcio Sanches Spinosa SOL 201709 Kintana 1954579

    Function BuscaDadosInformeFormatado(iIdPessoa: Double; iIdEmpresaProp, iAno, isistema: integer; sRubrica, nomeResp, DataInf: String): Olevariant;

    Function BuscaAnos(iIdPessoa: double): Olevariant;

    Constructor Create; Override;
    Destructor Destroy; Override;
    Function AtualizaLancIRRF(IdBenef, IdModulo: Integer; CodNatureza, pStrCPF: String): Boolean;
    Function FormataCPF(CPF: String): String;
    Function strEspacoEsquerda(TamanhoTexto: Integer; Texto: String): String; //preenche uma string com espaços a direita
    Function Completa(sNome: String; iTam: integer): String;
    Function CompletaZero(sNome: String; iTam: integer): String;

    Function BuscaPelaMatricula(sMatricula: String): integer;
    Function BuscaPeloCpf(sCpf: String): integer;
    // SOL 189126 KTN 1786515 Otacilio ** Inicio **
    Function BuscaPeloCpfAno(Const sCPF, sExercicio: String; bPensaoAlimenticia: Boolean = False; AIdPessoa: TPessoa_InformeRendimentos = Nil): Integer;
    // SOL 189126 KTN 1786515 Otacilio ** Fim **
    Function BuscaCampo6sqlPensionistas(fPessoaPen: Double;
      iano: integer;
      iSistema: integer;
      pStrCPF: String = '' //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
      ): OleVariant;
    Function BuscaCampo6sqlPensionistas13(fPessoaPen: Double;
      iano: integer;
      sRubrica: String;
      iSistema: integer;
      pStrCPF: String = '' //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
      ): OleVariant;
    Function BuscaCampo6sqlRendJud(fPessoaPen: Double; iano, isistema: integer): OleVariant;
    Function BuscaCampo6sqllJud(fPessoaPen: Double; iano: integer): OleVariant;
    Function BuscaJud(fPessoaPen: Double; iano: integer): OleVariant;
    function BuscaCampo407Detalhado(pCPF, pAno: String): OleVariant; //Everson Cunha - SIG81365
    Function BuscaCampo6sqllJud13(fPessoaPen: Double; iano: integer): OleVariant;
    Function BuscaCampo6sqllJudRend13(fPessoaPen: Double; iano: integer): OleVariant;
    Function BuscaCampo6Outros(fPessoaPen: Double; iano: integer; pStrCPF: String): OleVariant;
    Function BuscaEndereco(fPessoaPen: Double): OleVariant;
    Function BuscaInforme1: OleVariant;
    Function BuscaMatLocFunc(fIdPessoa: double; pStrCPF: String): Olevariant;
    Function BuscaDadosTxt(fPessoaPen: Double; iano, isistema: integer; nomeResp: String; iIdPessoa: Integer; DataInf: String; pbPensao: Boolean; pIdListaUsuario: Integer = 0; bPensaoSeparada: Boolean = True): Olevariant;
    Function BuscaMatricula(fIdPessoa, fIdPessJur: double; pStrCPF: String): Olevariant;

    Function BuscaDepJudicial(pCPF: String; Const pidPessoa: Integer; Const piAno: Integer; Const pTipo: boolean = False): OleVariant;

    Function BuscaCompensaIR(Const pidPessoa: Integer; Const piAno: Integer; pCPF: String): OleVariant;

    Function BuscaInformeGeral(Const pfIdPessoa: double;
      Const psAno: String;
      Const piSistema: Integer;
      Const piIdEmpresaProp: Integer;
      Const piIdListaUsuario: Integer;
      Const pbPensao: Boolean;
      Const pbPensaoSeparada: Boolean;
      Const psNomeResp: String;
      Const psDataInf: TDateTime;
      Const pbUsaLista: Boolean;
      Const piIndiceOrd: Integer;
      Const bAgrupaCPF: Boolean = False;
      Const sExcluiCPF: String = '';
      Const AIdPessoa: TPessoa_InformeRendimentos = Nil;
      Const piModelo: Integer = 0; //SOL 248939 PPM 997373
      Const pbEliminaZerados : boolean = false  // edilaine - SIG 19602
      ): OleVariant;

    Function BuscaIDPessJur(Const piIDPessoa: Integer; pCPF: String): OleVariant;

    Function AbreCdsVirtual: OleVariant;

    //William Santana SOL 219338.15472 KIN 2054550
    Function VerificaSaldoAnoBase(iIdPessoa: double; iAno: Integer): Olevariant;
    //Início - William Santana SOL 226121.15703 KIN 2060120
    Function BuscaInformesSaldo(iIdPessoa: double; iAno: Integer; pStrCPF: String): Olevariant;
    // function BuscaInformesSaldo( iIdPessoa: double ): Olevariant;
    //Termino - William Santana SOL 226121.15703 KIN 2060120
     //END - William Santana SOL 219338.15472 KIN 2054550
    Function VerificaRRA(pStrCPF: string; iAno: Integer; pSinal: string = '>'):OleVariant;//William Santana - SIG 37283

    procedure AlterSession(pValue : String); //Everson Cunha - SIG78304 - Tibero

    function BuscaLancResidExterior(pNumDocumento: string; pAno: Integer): OleVariant;

    Function BuscaTotalPA(pIdFavorecido, pAno, pRubrica: String): Double; //SIG85183.92415
    Function VerificarBitributacao (pIdPessoa, pNumProcesso: String): Boolean; //SIG85183.92415

    Function BuscaContribPrevPrivada(iIdPessoa: double; iAno: Integer; pStrCPF: String): Olevariant;  //Leandro sig132465
  Published

  End;

Implementation

{ TCtrlInformeRendimentos }

Function TCtrlInformeRendimentos.BuscaEmpresaProp(iIdPessoaProp: Integer): Olevariant;
Begin
  result := GetDataPacket(' SELECT P.RAZAOSOCIAL, P.NUMDOCUMENTO, T.NUMERO AS TELEFONEFORMATADO, ' +
    '        EN.LOGRADOURO AS ENDEREO, EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME AS CIDADE,  EN.CEP, ' +
    '        ES.CODESTADO AS UF, REPLACE(REPLACE(REPLACE(T.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, T.DDD , C.NUMSEED ' +
    ' FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES, (SELECT DISTINCT IDENDERECO, TIPO, NUMERO, DDD FROM TELENDPESS) T ' +
    ' WHERE  (P.IDPESSOA = ' + intToStr(iIdPessoaProp) + ') AND ' +
    ' (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND ' +
    ' (EN.IDCIDADES     = C.IDCIDADES(+)) AND ' +
    ' (ES.IDESTADO(+)    = C.IDESTADO) AND ' +
    ' (EN.IDPESSOA(+)   = P.IDPESSOA) AND ' +
    ' (EN.IDENDERECO = T.IDENDERECO(+)) ');

End;

Function TCtrlInformeRendimentos.BuscaCodInforme(pAno: string): Olevariant; // PRNS1
Begin
  // Andre Imakawa - SIG 122151 - Inicio
  result := GetDataPacket(' SELECT DISTINCT I.CODINFORME FROM INFORME I                           ' + #13#10 +
  '     JOIN (SELECT IDINFORME, ANOVIGENCIA FROM INFORME                                          ' + #13#10 +
  '      WHERE (IDINFORME, ANOVIGENCIA) IN (SELECT IDINFORME, MAX(ANOVIGENCIA)                    ' + #13#10 +
  '            FROM INFORME WHERE  ANOVIGENCIA <= ' + pAno                                          + #13#10 +
  '            GROUP BY IDINFORME )) INFORME_APOIO                                                ' + #13#10 +
  '     ON INFORME_APOIO.IDINFORME = I.IDINFORME AND INFORME_APOIO.ANOVIGENCIA = I.ANOVIGENCIA    ' + #13#10 +
  ' ORDER BY I.CODINFORME ');
  // Andre Imakawa - SIG 122151 - Fim
End;

Function TCtrlInformeRendimentos.BuscaDadosInforme(iIdPessoa: Double; iIdEmpresaProp, iAno,
  isistema: integer; sRubrica, nomeResp, DataInf: String;
  bPensao: Boolean = False; bPensaoSeparada: Boolean = True): Olevariant;
Var sSqlDados, sDataIni, sDataFin, sAno, sNomeResp, sDataInf: String;
  iIdEmpresaPropLocal, iModeloFundacao: Integer;
  CdsPessoa, CdsLocalEmpProp, CdsLocalInforme, cdsLocalCodInforme: TcmClientDataSet;
  sDadosComp, cLinha13, cLinhaContrib, cLinhaRend, sNomeEmprop: String;
  sSQL: TStringList;
  iCodInforme, iTipoCliente: Integer;

Begin
  sSQL := TStringList.Create;
  iIdEmpresaPropLocal := iIdEmpresaProp;
  sDataIni := '';
  sDataFin := '';
  sSqlDados := '';
  sDadosComp := ' ';
  cLinha13 := '';
  cLinhaContrib := '';
  cLinhaRend := '';
  sNomeEmprop := '';
  CdsLocalEmpProp := TcmClientDataSet.Create(Nil);
  CdsLocalCodInforme := TcmClientDataSet.Create(Nil);
  CdsPessoa := TcmClientDataSet.Create(Nil);

  If iAno < 0 Then
    Begin
      sAno := FormatDateTime('yyyy', Now);
      sDataIni := '01/01/1900';
    End
  Else
    Begin
      sAno := IntToStr(iAno);
      sDataIni := trim('01/01/' + sAno);
    End;

  sDataFin := trim('31/12/' + sAno);
  sDadosComp := BuscaDadosCompl(iIdPessoa, StrToInt(sAno), isistema, sRubrica, bPensao);
  Try
    CdsLocalEmpProp.Data := GetDataPacket('SELECT TIPOCLIENTE FROM EMPRESAPROP ');
    iTipoCliente := CdsLocalEmpProp.FieldByName('TIPOCLIENTE').AsInteger;
    iModeloFundacao := BuscaCodEmProp;
    CdsLocalEmpProp.Data := BuscaEmpresaProp(iIdEmpresaPropLocal);
    CdsLocalCodInforme.Data := BuscaCodInforme(sAno);
    snomeResp := nomeResp;
    sDataInf := DataInf;

    If trim(sNomeResp) = '' Then
      sNomeResp := ' ';

    If trim(sDataInf) = '' Then
      sDataInf := ' ';

    sSql.Add('SELECT  ');
    If bPensao Then
      Begin
        sSql.Add('DISTINCT');
        sSql.Add('PES.NOME AS NOMEALIMENTANTE,');
        sSql.Add('PES.NUMDOCUMENTO AS CPFALIMENTANTE,');
        sSql.Add(''' '' AS TELALIMENTANTE,');
        sSql.Add('EN.LOGRADOURO AS LOGRADOUROALIM,');
        sSql.Add('EN.NUMERO AS NUMEROALIM,');
        sSql.Add('EN.COMPLEMENTO AS COMPLEMENALIM,');
        sSql.Add('EN.BAIRRO  AS BAIRROALIM,');
        sSql.Add('C.NOME  AS CIDADEALIM,');
        sSql.Add('EN.CEP  AS CEPALIM,');
        sSql.Add('ES.CODESTADO  AS ESTADOALIM,');
      End
    Else
      Begin
        sSql.Add(' '' '' AS NOMEALIMENTANTE,');
        sSql.Add(''' ''  AS CPFALIMENTANTE,');
        sSql.Add(''' ''  AS TELALIMENTANTE,');
        sSql.Add(''' ''  AS LOGRADOUROALIM,');
        sSql.Add(''' ''  AS NUMEROALIM,');
        sSql.Add(''' ''  AS COMPLEMENALIM,');
        sSql.Add(''' ''  AS BAIRROALIM,');
        sSql.Add(''' ''  AS CIDADEALIM,');
        sSql.Add(''' ''  AS CEPALIM,');
        sSql.Add(''' ''  AS ESTADOALIM,');
      End;

    sSql.Add('             X.NOMERESP, X.DATAINF, X.ANO_EXERCICIO, X.ANO, X.DATA, X.ANOATUAL,  X.DADOSCOMP, '); // Andre Imakawa - SIG 122151
    //    sSql.Add(' X.IDPESSOA, ');
    sSql.Add('        UPPER(TRIM(X.NOMEBENEF)) AS NOMEBENEF, ' +
      '        X.CPF, X.CGC, X.FONTE, X.TIPO, X.CODNATUREZA,  UPPER(X.DESCRICAO) AS DESCRICAO, UPPER(TRIM(X.RAZAOSOCIAL)) AS RAZAOSOCIAL,  X.ENDEREO,    ' +
      '        X.NUMERO,  X.COMPLEMENTO,  X.BAIRRO,  X.NOME,  X.CEP, X.UF, X.NUMSEED ');

    sSql.Add(', X.IDPESSJUR ');

    While Not CdsLocalCodInforme.Eof Do
      Begin
        If Not bPensao Then
          sSql.Add(', SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ')  ' +
            'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '')

        Else
          sSql.Add(', VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '');
        CdsLocalCodInforme.Next;
      End;

    If iTipoCliente = 19991 Then
      sSql.Add(' ,SUM((VLR3011) + (VLR3012)) AS  tot301 ' +
        ' ,SUM((VLR3021)             AS   tot302 ' +
        ' ,SUM((VLR3031) + (VLR3032)) AS  tot303 ' +
        ' ,SUM((VLR3041) + (VLR3042)) AS  tot304 ' +
        ' ,SUM((VLR3051))             AS  tot305 ' +
        ' ,SUM((VLR4011) + (VLR4012)) AS  TOT401 ');
      // Andre Imakawa - SIG 122151 - Inicio
      //if pLayout2021 then                                                    //edilaine WO18939
      if (pLayout2021) or ((pLayout2019Pensao) and (iAno >= 2021)) then        //edilaine WO18939
            sSql.Add(' ,SUM((VLR4013) + (VLR4014)) AS  TOT401_L2 ');
      // Andre Imakawa - SIG 122151 - Fim
      sSql.Add(
        ' ,SUM((VLR4021) + (VLR4022)) AS  TOT402 ' +
        ' ,SUM((VLR4031) + (VLR4032)) AS  TOT403 ' +
        //               ' ,SUM((VLR4042))             AS  TOT404 '+
        ' ,SUM((VLR4042))  + (SUM(VLR4041))  AS  TOT404 ' +
        ' ,SUM((VLR4051))             AS  TOT405 ' +
        ' ,SUM((VLR4061))             AS  TOT406 ' +
        ' ,SUM((VLR4071) + (VLR4072)) AS  TOT407 ' +
        ' ,SUM((VLR5011) + (VLR5012)) AS  TOT501 ' +
        ' ,SUM((VLR6011))             AS  TOT601 ' +
        //               ' ,SUM((VLR6021))             AS  TOT602 '+
        ' ,SUM((VLR7011))             AS  TOT701 ' +
        ' ,SUM((VLR9011) + (VLR9012)) AS  TOT901 ');

    sSql.Add(', (SELECT DISTINCT ''TRUE'' FROM PROCJUD PJ WHERE PJ.IDPESSOA = X.IDPESSOA) AS PROCESSO ' +
      //Marcio Sanches Spinosa SOL 247267/16926 PPM 652768 - Inicio
      //    	          ', (SELECT DISTINCT ''TRUE'' FROM RUBRICAINDIV RI WHERE RI.IDPESSOA = X.IDPESSOA) AS PENSIONISTA ');
      ', (''TRUE'' ) AS PENSIONISTA ');
    //Marcio Sanches Spinosa SOL 247267/16926 PPM 652768 - Fim

    sSql.Add(' FROM ');

    If bPensao Then
      Begin
        sSql.Add('PESSOA PES,');
        sSql.Add('PESSOA ALI,');
        sSql.Add('RUBRICAINDIV RUB,');
        sSql.Add('ENDPESS EN,');
        sSql.Add('ESTADO ES,');
        sSql.Add('CIDADES C,');
      End;

    sSql.Add('(');

    sSql.Add(
      ' SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + QuotedStr(IntToStr(iAno)) +
      '         AS ANO, ' + QuotedStr(IntToStr(iAno + 1)) + ' AS ANO_EXERCICIO' + // Andre Imakawa - SIG 122151
      '         TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' +
      '         TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' +
      '         PT.IDPESSOA AS IDPESSJUR, ' + #13 +
      '         NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' +
      '         P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' +
      '         NAT.CODNATUREZA, NAT.DESCRICAO, P.RAZAOSOCIAL, ' +
      '         EN.LOGRADOURO ENDEREO, ' +
      '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' +
      '         ES.CODESTADO AS UF, C.NUMSEED,');

    CdsLocalCodInforme.First;

    If iModeloFundacao <> 2 Then
      Begin
        cLinha13 := '501';
        cLinhaContrib := '303';
        cLinhaRend := '301';
      End
    Else
      Begin
        cLinha13 := '51';
        cLinhaContrib := '3';
        cLinhaRend := '1';
      End;

    iCodInforme := 0;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
          // trata 13º negativo
          ssql.Add('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
        Else
          If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
            ssql.Add('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
          Else
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
              ssql.Add('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')

            Else
              ssql.Add('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');

        CdsLocalCodInforme.Next;
        iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
      End;

    ssql.Add(
      ' (''-'') AS TELEFONE, (''C'') AS  TIPOTEL  ' +
      ' FROM PESSOA P, PESSOA E, ENDPESS EN, ESTADO ES, ' +
      ' PESSOA PT, ' + #13 +
      ' CIDADES C, NATURENDIMENTO NAT, ' +
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
      //    ' (SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, '                                                                                                                                                                 +
      ' (SELECT XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, ' +
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
      // Paulo Nobre SOL 269300 PPM 1293033
      ' DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' +
      ' (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,SUM(DECODE(IE.FLGNATUREZA,''N'', ' +
      ' (TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' +
      ' SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' +
      ' SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO ' +
      ' , XB.IDPATRO ' + #13 +
      ' FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI WHERE ');

    If iIDPessoa <> -1999 Then
      //      sSql.Add(' (XB.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ' );
          //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
      //      sSql.Add(' (XB.IDBENEFIRRF in (select idpessoa from pessoa where numdocumento in '+#13#10+
      //               '                    (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ' );

      sSql.Add(' (XB.IDBENEFIRRF in (select idpessoa from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + ')) AND ');
    //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM

    If Not bPensaoSeparada Then
      Begin
        If bPensao Then
          Begin
            sSql.Add('(XB.IDBENEFIRRF IN (SELECT IDFAVORECIDO FROM RUBRICAINDIV WHERE IDFAVORECIDO = XB.IDBENEFIRRF AND RUBRICAPROVENTOPA IS NOT NULL AND FLGPENSAOALIM = 1 AND ' +
              '(DATAFINAL > TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) AND');
          End
        Else
          Begin
            sSql.Add('(XB.IDBENEFIRRF NOT IN (SELECT IDFAVORECIDO FROM RUBRICAINDIV WHERE IDFAVORECIDO = XB.IDBENEFIRRF AND RUBRICAPROVENTOPA IS NOT NULL AND FLGPENSAOALIM = 1 AND ' +
              '(DATAFINAL > TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) AND');
          End;
      End
    Else
      Begin
        If bPensao Then
          Begin
            sSql.Add(' (XB.FLGPENSAOALIM = 2) AND ')
          End
        Else
          Begin
            sSql.Add(' ((XB.FLGPENSAOALIM = 0) OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60)) AND ')
          End;
      End;

    sSql.Add(
      ' (LI.IDLANCIRRF = XB.IDLANCIRRF) AND ' +
      ' (NVL(LI.FLGTIPOREG,''N'') <> ''D'') AND ' +
      ' (LI.IDINFORME = IE.IDINFORME) AND ' +
      ' (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) + ',''DD/MM/YYYY'')) AND ' +
      ' (XB.CODNATUREZA NOT IN (''8888'', ''7893'')) ');

    If iSistema = 0 Then // Folha de Pagamentos
      sSql.Add(' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 21) ');

    If iSistema = 1 Then // Folha de Beneficios
      Begin
        sSql.Add(' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18)    ' +
          ' AND (XB.CODNATUREZA NOT IN (''5565'',''3223'',''7416'',''7431'', ''3556'', ''3579'')) '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      End;

    If iSistema = 3 Then // Folha de Resgate de Reserva
      sSql.Add(' AND (XB.CODNATUREZA in (''3223'', ''5565'', ''3556'', ''3579'')) '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    If iSistema = 4 Then // Contas a Pagar - Autonomos
      sSql.Add(' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 3) ');

    sSql.Add(' GROUP BY XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, XB.IDPATRO) RE ');
    sSql.Add(' WHERE (P.TIPO = ''F'')' +
      ' AND (E.IDPESSOA = ' + IntToStr(iIdEmpresaProp) + ') AND ');

    If iIDPessoa <> -1999 Then
      //      sSql.Add(' (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
      sSql.Add(' (P.IDPESSOA in (select idpessoa from pessoa where numdocumento in ' + #13#10 +
        '                (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ');

    sSql.Add(
      ' (EN.IDENDERECO(+)     = P.IDENDCORRESP) ' +
      '  AND (EN.IDPESSOA(+)  = P.IDPESSOA) ' +
      '  AND (EN.IDCIDADES    = C.IDCIDADES(+)) ' +
      '  AND (ES.IDESTADO(+)  = C.IDESTADO) ' +
      '  AND (NAT.CODNATUREZA = RE.CODNATUREZA) ' +
      '  AND (RE.IDBENEFIRRF  = P.IDPESSOA) ' +
      '  AND (RE.IDPATRO      = PT.IDPESSOA(+)) ' + #13 +
      '  GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' +
      '  E.NUMDOCUMENTO,  E.RAZAOSOCIAL, NAT.CODNATUREZA,  NAT.DESCRICAO, ' +
      '  EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' +
      '  EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO, C.NUMSEED ');

    sSql.Add(' , PT.IDPESSOA ' + #13);

    If (iSistema = 1) Or (iSistema = 2) Then
      Begin
        ssql.Add(' UNION ' +
          ' SELECT ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + QuotedStr(IntToStr(iAno)) +
          ' AS ANO, ' + QuotedStr(IntToStr(iAno)) + ' AS ANO_EXERCICIO ' + // Andre Imakawa - SIG 122151
          '         TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' +
          '         TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' +
          '         PT.IDPESSOA AS IDPESSJUR, ' + #13 +
          '         NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' +
          '         P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ');

        If iModeloFundacao = 1 Then
          Begin
            If iSistema = 3 Then // Folha de Resgate de Reserva
              ssql.Add('  NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ')
            Else
              //          ssql.Add('''0561''  CODNATUREZA, ''RENDIMENTO TRABALHO ASSALARIADO'' AS DESCRICAO, '  );////Marcio Sanches Spinosa SOL 247174 PPM 647931 //SOL 248939 PPM 997373
              ssql.Add('  NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, '); //Marcio Sanches Spinosa SOL 247174 PPM 647931   //SOL 248939 PPM 997373
          End
        Else
          Begin
            If iModeloFundacao = 2 Then
              ssql.Add('   NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ')
            Else
              //          ssql.Add('''0561''  CODNATUREZA, ''RENDIMENTO DO TRABALHO ASSALARIADO'' AS DESCRICAO, '  ); //SOL 248939 PPM 997373
              ssql.Add('   NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO,  '); //SOL 248939 PPM 997373

          End;

        ssql.Add(' P.RAZAOSOCIAL, EN.LOGRADOURO AS ENDEREO, ' +
          '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' +
          '         ES.CODESTADO AS UF, C.NUMSEED,');

        CdsLocalCodInforme.First;

        iCodInforme := 0;
        While Not CdsLocalCodInforme.Eof Do
          Begin
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
              // trata 13º negativo
              ssql.Add('SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0)) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
            Else
              If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
                (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
                (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
                ssql.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
              Else
                If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
                  ssql.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                Else
                  ssql.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');
            CdsLocalCodInforme.Next;
            iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
          End;
        // BUSCA IR e IR 13o DO DEPÓSITO JUDICIAL

        ssql.Add(
          ' (''-'') AS TELEFONE, (''C'') AS  TIPOTEL, DJ.IDINFORME  ' + #13 +
          ' FROM PESSOA P, PESSOA E, ENDPESS EN, ESTADO ES, ' + #13 +
          ' PESSOA PT, ' + #13 +
          ' CIDADES C, NATURENDIMENTO NAT, ');
        //------------------------
   //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
   //      ssql.Add(' (SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, '+
        ssql.Add(' (SELECT XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, ' +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
      // Paulo Nobre SOL 269300 PPM 1293033
          ' DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' +
          '  (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,' +
          'SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' +
          ' SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' +
          ' SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO ' +
          ', XB.IDPATRO ' + #13 +
          ' FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI WHERE ');

        If iIdPessoa <> -1999 Then
          //        ssql.Add(' (XB.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
                 //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
          //        sSql.Add(' (XB.IDBENEFIRRF in (select idpessoa from pessoa where numdocumento in '+#13#10+
          //                 '                    (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ' );

          sSql.Add(' (XB.IDBENEFIRRF in (select idpessoa from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + ')) AND ');

        //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM
        If Not bPensaoSeparada Then
          Begin
            If bPensao Then
              Begin
                sSql.Add('(XB.IDBENEFIRRF IN (SELECT IDFAVORECIDO FROM RUBRICAINDIV WHERE IDFAVORECIDO = XB.IDBENEFIRRF AND RUBRICAPROVENTOPA IS NOT NULL AND FLGPENSAOALIM = 1  AND ' +
                  '(DATAFINAL > TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) AND');
              End
            Else
              Begin
                sSql.Add('(XB.IDBENEFIRRF NOT IN (SELECT IDFAVORECIDO FROM RUBRICAINDIV WHERE IDFAVORECIDO = XB.IDBENEFIRRF AND RUBRICAPROVENTOPA IS NOT NULL AND FLGPENSAOALIM = 1 AND ' +
                  '                        (DATAFINAL > TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) AND');
              End;
          End
        Else
          Begin

            If bPensao Then
              Begin
                sSql.Add(' (XB.FLGPENSAOALIM = 2) AND ')
              End
            Else
              Begin
                sSql.Add(' ((XB.FLGPENSAOALIM = 0) OR (XB.FLGPENSAOLIM = 2 AND LI.IDINFORME = 60)) AND ')
              End;

          End;

        ssql.Add(' (LI.IDLANCIRRF = XB.IDLANCIRRF) AND ' +
          ' (NVL(LI.FLGTIPOREG,''N'') <> ''D'') AND ' +
          ' (LI.IDINFORME = IE.IDINFORME) AND ' +
          ' (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) + ',''DD/MM/YYYY'')) AND ' +
          ' (XB.CODNATUREZA NOT IN (''8888'', ''7893'')) ' +
          ' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18) ' +
          ' AND (XB.CODNATUREZA IN (''7416'',''7431'')) ');

        ssql.Add(' GROUP BY XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, XB.IDPATRO) DJ ');
        //------------------------

        ssql.Add(' WHERE (P.TIPO = ''F'')' +
          ' AND (E.IDPESSOA = ' + IntToStr(iIdEmpresaProp) + ') AND ');
        If iIDPessoa <> -1999 Then
          //        ssql.Add(' (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
          sSql.Add(' (P.IDPESSOA in (select idpessoa from pessoa where numdocumento in ' + #13#10 +
            '                (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ');

        ssql.Add(
          ' (EN.IDENDERECO(+)     = P.IDENDCORRESP) ' +
          '  AND (EN.IDPESSOA(+)    = P.IDPESSOA) ' +
          '  AND (EN.IDCIDADES      = C.IDCIDADES(+)) ' +
          '  AND (ES.IDESTADO(+)    = C.IDESTADO) ' +
          '  AND (NAT.CODNATUREZA   = DJ.CODNATUREZA) ' +
          '  AND (DJ.IDBENEFIRRF(+) = P.IDPESSOA) ' +
          '  AND (DJ.IDPATRO        = PT.IDPESSOA) ' + #13 +
          '  GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' +
          '  E.NUMDOCUMENTO,  E.RAZAOSOCIAL,   NAT.CODNATUREZA,  NAT.DESCRICAO, ' +
          '  EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' +
          '  EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO, C.NUMSEED');

        sSql.Add(' , PT.IDPESSOA ' + #13);
      End;

    ssql.Add('  ) X ');

    If bPensao Then
      Begin
        sSql.Add('WHERE');
        sSql.Add('    ALI.NUMDOCUMENTO = X.CPF');
        sSql.Add('AND RUB.IDFAVORECIDO = ALI.IDPESSOA');
        sSql.Add('AND PES.IDPESSOA     = RUB.IDPESSOA');
        sSql.Add('AND EN.IDENDERECO(+) = PES.IDENDCORRESP');
        sSql.Add('AND EN.IDPESSOA(+)   = PES.IDPESSOA');
        sSql.Add('AND EN.IDCIDADES     = C.IDCIDADES(+)');
        sSql.Add('AND ES.IDESTADO(+)   = C.IDESTADO');

        If iModeloFundacao = 1 Then
          Begin
            sSql.Add('AND X.CPF IS NOT NULL AND X.CPF <> ''00000000000''');
          End;
      End;

    If Not bPensao Then
      Begin
        ssql.Add('GROUP BY ');

        ssql.Add(' X.NOMERESP, X.DATAINF, X.ANO_EXERCICIO, X.ANO, X.DATA, X.ANOATUAL, ' +// Andre Imakawa - SIG 122151
          '  X.DADOSCOMP, /* X.IDPESSOA,*/   UPPER(TRIM(X.NOMEBENEF)), X.CPF, X.CGC, X.FONTE, X.TIPO, X.CODNATUREZA,  UPPER(X.DESCRICAO),' +
          '  UPPER(TRIM(X.RAZAOSOCIAL)), X.ENDEREO, X.NUMERO,  X.COMPLEMENTO,  X.BAIRRO,  X.NOME,  X.CEP, X.UF, X.NUMSEED ');

        sSql.Add(', X.IDPESSJUR ' + #13);
      End
    Else
      Begin
        If iTipoCliente = 19991 Then
          Begin
            ssql.Add('GROUP BY ');
            sSql.Add('PES.NOME,');
            sSql.Add('PES.NUMDOCUMENTO,');
            sSql.Add('EN.LOGRADOURO,');
            sSql.Add('EN.NUMERO,');
            sSql.Add('EN.COMPLEMENTO,');
            sSql.Add('EN.BAIRRO,');
            sSql.Add('C.NOME,');
            sSql.Add('EN.CEP,');
            sSql.Add('ES.CODESTADO,');
            ssql.Add(' X.NOMERESP, X.DATAINF, X.ANO_EXERCICIO, X.ANO, X.DATA, X.ANOATUAL, ' +// Andre Imakawa - SIG 122151
              '  X.DADOSCOMP, /* X.IDPESSOA,*/   UPPER(TRIM(X.NOMEBENEF)), X.CPF, X.CGC, X.FONTE, X.TIPO, X.CODNATUREZA,  UPPER(X.DESCRICAO),' +
              '  UPPER(TRIM(X.RAZAOSOCIAL)), X.ENDEREO, X.NUMERO,  X.COMPLEMENTO,  X.BAIRRO,  X.NOME,  X.CEP, X.UF, X.NUMSEED ');
            sSql.Add(', X.IDPESSJUR ' + #13);

            CdsLocalCodInforme.First;
            While Not CdsLocalCodInforme.Eof Do
              Begin
                sSql.Add(', VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '');
                CdsLocalCodInforme.Next;
              End;
          End;
      End;
    ssql.Add('  ORDER BY  X.CEP, RAZAOSOCIAL, X.CODNATUREZA ');

    Result := GetDataPacket(sSQL.GetText);
  Finally
    CdsLocalEmpProp.Free;
    CdsLocalCodInforme.Free;
    CdsPessoa.free; // Edilaine - SOL 180189 / KTN 1761859
    sSQL.Free; // Edilaine - SOL 180189 / KTN 1761859
  End;
End;

Function TCtrlInformeRendimentos.BuscaDadosCompl(
  iIdPessoa: Double;
  iAno, isistema: Integer; sRubrica: String;
  bPensao: Boolean;
  pStrCPF: String = ''): String;

Var
  sSql: String;
  cdsCompIRRF, cdsExisteJud, cdsPensionista, cdsPensionista13: TcmClientDataSet;
  cdsInformeSaldo: TcmClientDataSet; //William Santana SOL 219338.15472 KIN 2054550
  CdsRRA, CdsRRA_Aux: TcmClientDataSet; //William Santana - SIG 37283
  Cds407Detalhado: Tcmclientdataset;    //Everson Cunha - SIG81365
  sFiltro: string;
  rValor: Real;
  cdsResidExt: TCMClientDataSet; //Cássio Rovaroto - SIG nº 73545
  bCabecalhoProcJud: Boolean; //Cássio Rovaroto - SIG nº 81572
  cdsContribPrevPrivada: TcmClientDataSet; //Leandro Pocebon - SIG132465
Begin
  //result := '  ';
  bCabecalhoProcJud := True;//Cássio Rovaroto - SIG nº 81572
  cdsPensionista := TcmClientDataSet.Create(Nil);
  cdsPensionista13 := TcmClientDataSet.Create(Nil);
  cdsExisteJud := TcmClientDataSet.Create(Nil);

  cdsInformeSaldo := TcmClientDataSet.Create(Nil); //William Santana SOL 219338.15472 KIN 2054550

  CdsRRA := TcmClientDataSet.Create(Nil); //William Santana - SIG 37283
  CdsRRA_Aux := TcmClientDataSet.Create(Nil);

  cdsResidExt := TCMClientDataSet.Create(nil); //Cássio Rovaroto - SIG nº 73545

  //CPREV - 24752
  cdsCompIRRF := TcmClientDataSet.Create(Nil);

  cdsContribPrevPrivada := TcmClientDataSet.Create(Nil); //Leandro Pocebon - SIG132465

  //Everson Cunha - SIG81365 - Início
  Cds407Detalhado := Tcmclientdataset.Create(Nil);
  Cds407Detalhado.Data := BuscaCampo407Detalhado(pStrCPF, IntToStr(iAno));
  //Everson Cunha - SIG81365 - Fim
  cdsPensionista.Data := BuscaCampo6sqlPensionistas(iIdPessoa, iAno, iSistema, pStrCPF);

  //Valores de 13º
  cdsPensionista13.data := BuscaCampo6sqlPensionistas13(iIdPessoa, iAno, sRubrica, iSistema, pStrCPF);

  cdsPensionista.First;
  While Not cdsPensionista.EOF Do
    Begin
      cdsPensionista13.first;
      If Not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull Then
        Begin
          If cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) Then
            Begin
              cdsPensionista.edit;
              cdsPensionista.FieldByName('VALOR13').AsFloat := cdsPensionista13.FieldByName('VALOR').AsFloat;
              cdsPensionista.post;
              cdsPensionista13.delete;
            End;
        End;
      cdsPensionista.next;
    End;

  cdsPensionista13.first;
  While Not cdsPensionista13.eof Do
    Begin
      cdsPensionista.Insert;
      cdsPensionista.FieldByName('IDFAVORECIDO').Asinteger := cdsPensionista13.FieldByName('IDFAVORECIDO').Asinteger;
      cdsPensionista.FieldByName('NUMDOCUMENTO').Asstring := cdsPensionista13.FieldByName('NUMDOCUMENTO').Asstring;
      cdsPensionista.FieldByName('NOME').Asstring := cdsPensionista13.FieldByName('NOME').Asstring;
      cdsPensionista.FieldByName('VALOR').AsFloat := 0;
      cdsPensionista.FieldByName('VALOR13').AsFloat := cdsPensionista13.fieldByname('VALOR').AsFloat;
      cdsPensionista.post;
      cdsPensionista13.next;
    End;

  cdsPensionista.First;
  While Not cdsPensionista.EOF Do
    Begin
      result := result + '   CPF: ' + cdsPensionista.fieldByname('NUMDOCUMENTO').AsString + ' - ' +
        cdsPensionista.fieldByname('NOME').AsString + '   -   ';

        // Tiago Von SIG97084 - inicio
        //SIG85183.92415 - início
        //if (pLayout2019) then
        //begin
        //  result := result + 'Total Ren. Trib.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat + BuscaTotalPA(cdsPensionista.FieldByName('IDFAVORECIDO').AsString, IntToStr(iAno), '161')) + '   -   ' +
        //  'Total 13º : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR13').AsFloat + BuscaTotalPA(cdsPensionista.FieldByName('IDFAVORECIDO').AsString, IntToStr(iAno), '162')) + #13#10;
        //end
        //else
        //begin
          // Andre Imakawa - SIG 122151 - Inicio
          If iAno >= 2021 Then
            //result := result + 'Total de Rendimentos Tributáveis: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat) + '   -   ' +  // Marcos Lima - SIG 135421
            result := result + 'Total de Rendimentos Isentos: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat) + '   -   ' +
            'Total 13º : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR13').AsFloat) + #13#10
          Else
            //result := result + 'Total Ren. Trib.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat) + '   -   ' + // Marcos Lima - SIG 135421
            result := result + 'Total Ren. Isentos: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat) + '   -   ' +
            'Total 13º : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR13').AsFloat) + #13#10;
          // Andre Imakawa - SIG 122151 - Fim
       //end;
       //SIG85183.92415 - fim
       //Tiago Von SIG97084 - fim
      cdsPensionista.Next;
    End;

  //William Santana SOL 219338.15472 KIN 2054550

  // Felipe A. Santos SOL 246306/16909 PPM 645896  - início comentário - RE02
  {cdsInformeSaldo.data := VerificaSaldoAnoBase(iIdPessoa,iAno);
  if not(cdsInformeSaldo.isempty) then
  begin}
  // Felipe A. Santos SOL 246306/16909 PPM 645896  - fim comentário - RE02

  cdsInformeSaldo.data := BuscaInformesSaldo(iIdPessoa, iAno, pStrCPF); // William Santana SOL 226121.15703 KIN 2060120 - adicionado , , strtoint(edtData.text)
  cdsInformeSaldo.first;
  If Not (cdsInformeSaldo.isempty)
    And (iSistema <> 0) Then // Andre Imakawa - SIG 41085
    Begin
      //edilaine SIG124504 : inicio
      if (pLayout2021) then
        result := result + 'O total informado na linha 05 do quadro 04 já inclui o valor abatido de imposto de ' +
          'renda relativo às contribuições efetuadas a título de previdência complementar no ' +
          'período compreendido entre 1º de janeiro de 1989 a 31 de dezembro de 1995, ' +
          'correspondente a R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsinformesaldo.FieldByName('VALOR').AsFloat) + #13#10
      else
        result := result + 'O total informado na linha 04 do quadro 04 já inclui o valor abatido de imposto de ' +
          'renda relativo às contribuições efetuadas a título de previdência complementar no ' +
          'período compreendido entre 1º de janeiro de 1989 a 31 de dezembro de 1995, ' +
          'correspondente a R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsinformesaldo.FieldByName('VALOR').AsFloat) + #13#10;
      //edilaine SIG124504 : fim

    End;
  //end; // Felipe A. Santos SOL 246306/16909 PPM 645896  - comentário - RE02
  //END - William Santana SOL 219338.15472 KIN 2054550

  //Everson Cunha - SIG81365 - Início
  if not Cds407Detalhado.IsEmpty  then
  begin
       if iSistema = 0 then  //Ewerton Beltramini - SIG96719
       begin
           //if result <> '  ' then                  //Ewerton Beltramini - SIG96719
           //   result := result + #13#10;           //Ewerton Beltramini - SIG96719

            Result := Result + ' 4.07 - Outros (Auxílio-Doença, Abono Pecuniário e 1/3 Abono Pecuniário) - DETALHAMENTO: ' + #13#10;

            while not Cds407Detalhado.Eof do
            begin
              result := result + '     ' + Cds407Detalhado.fieldbyname('DESCRICAO').AsString + ' R$ ' + FormatFloat('#,##0.00;(#,##0.00)', Cds407Detalhado.fieldbyname('TOT').AsFloat) + #13#10;

              Cds407Detalhado.Next;
            end;
       end;
  end;
  //Everson Cunha - SIG81365 - Fim
  //CPrev - 27383 - If (iSistema <> 1) Then Exit;
  If (isistema In [0, 4]) Then Exit; //CPrev - 27383

  //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
  cdsExisteJud.Data := BuscaDepJudicial(pStrCPF, Trunc(iIdPessoa), iAno, pTipoAposentadoPensionistas);
  ////Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim
  //Cássio Rovaroto - SIG nº 81572 - Início
  //If Not cdsExisteJud.eof Then
  //  Begin
      //Ádler Teodoro de Souza SOL 108632 KINTANA  492608
          //Bruno Bastos - SOL: 112398 - Kintana: 520072 - result := result + #13 + #10 + 'Os rendimentos e os impostos depositados judicialmente, se for o caso, a seguir discriminados não foram adicionados às linhas 01 e 04 do Quadro 3, e linha 01 do Quadro 5, em razão de estarem com exigibilidade suspensa por determinação judicial.' + #13 + #10 + #13 + #10 + ' Proc.Jud. '+ cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString +
          //Bruno Bastos - SOL: 112398 - Kintana: 520072 - Início
          //Bruno Bastos - SOL: 119417 - Kintana: 571974 - Início
      //If iAno >= 2008 Then
      //  result := result + 'Conforme determinação da RFB (IN nº 890, inciso III), os rendimentos ' + // Edilaine - SOL 198419 / KTN 1908788
      //  'e os impostos depositados judicialmente a seguir discriminados, não foram ' +
      //    'adicionados às linhas 01 e 04 do Quadro 3, e linha 01 do Quadro 5, em razão ' +
      //    'de estarem com exigibilidade suspensa por determinação judicial.' + #13 + #10 + #13 + #10 + ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString
      //Else
        {      result := result + #13 + #10 + 'Os rendimentos e os impostos depositados judicialmente, se '+
                                             ' for o caso, a seguir discriminados não foram adicionados '+
                                             ' às linhas 01 e 04 do Quadro 3, e linha 01 do Quadro 5, em '+
                                             ' razão de estarem com exigibilidade suspensa por determinação '+
                                             ' judicial.' + #13 + #10 + #13 + #10 + ' Proc.Jud. '+
                                             cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString;
        }
      //  result := ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString;

   cdsExisteJud.First;
   While Not cdsExisteJud.eof Do
   Begin // Edilaine - SOL 198419 / KTN 1908788

   //    result := result +
   //Bruno Bastos - SOL: 119417 - Kintana: 571974 - Fim
   //Bruno Bastos - SOL: 112398 - Kintana: 520072 - Fim
   //Cássio Rovaroto - SIG Nº 74355 - Início
            //    ' - ' + cdsExisteJud.fieldByname('DATAINICIO').AsString + '   -   ' +
            //cdsExisteJud.fieldByname('CODVARA').Asstring + '-' + cdsExisteJud.fieldByname('NOMEVARA').asstring +
            //' - Rend.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD').AsFloat) +
            //' - IRRF : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD').AsFloat) +
            //' - Rend 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD13').AsFloat) +
            //' - IRRF 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD13').AsFloat) + #13;
          // Edilaine - SOL 198419 / KTN 1908788
      //    cdsExisteJud.fieldByname('CODVARA').AsString + '-' + cdsExisteJud.fieldByname('NOMEVARA').AsString;

   //SIG85183.92415 - início
    if(VerificarBitributacao(cdsExisteJud.FieldByName('IDBENEFIRRF').AsString, cdsExisteJud.FieldByName('NUMEROPROCESSO').AsString)) AND ((pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
        iNumIN := '1215'
    else
        iNumIN := '890';

   //SIG85183.92415 - fim

    if (cdsExisteJud.FieldByName('VALORRENDJUD').AsFloat <> 0) or (cdsExisteJud.FieldByName('VALORIRJUD').AsFloat <> 0) or
       (cdsExisteJud.FieldByName('VALORRENDJUD13').AsFloat <> 0) or (cdsExisteJud.FieldByName('VALORIRJUD13').AsFloat <> 0) then
    begin
      if bCabecalhoProcJud then
      begin
        bCabecalhoProcJud := False;
        // Andre Imakawa - SIG 122151 - Inicio
        If iAno >= 2021 Then
          Result := Result + 'Conforme determinação "Os rendimentos ' +
                    'e os impostos depositados judicialmente a seguir discriminados, não foram ' +
                    'adicionados às linhas 01 e 04 do Quadro 3, e linha 01 do Quadro 5, em razão ' +
                    'de estarem com exigibilidade suspensa por determinação judicial.' + #13 + #10 + #13 + #10 + ' Processo Judicial nº ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString
        Else
          If iAno >= 2008 Then
            Result := Result + 'Conforme determinação da RFB (IN nº ' + iNumIN + ', inciso III), os rendimentos ' + // Edilaine - SOL 198419 / KTN 1908788
                      'e os impostos depositados judicialmente a seguir discriminados, não foram ' +
                      'adicionados às linhas 01 e 04 do Quadro 3, e linha 01 do Quadro 5, em razão ' +
                      'de estarem com exigibilidade suspensa por determinação judicial.' + #13 + #10 + #13 + #10 + ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString
          Else
            result := ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString;
        // Andre Imakawa - SIG 122151 - Fim
      end
      else
        // Andre Imakawa - SIG 122151 - Inicio
        If iAno >= 2021 Then
          Result := Result + #13 + #10 + 'Processo Judicial ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString
        Else
          Result := Result + #13 + #10 + 'Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString;
        // Andre Imakawa - SIG 122151 - Fim

      Result := Result +
                ' - ' + cdsExisteJud.fieldByname('DATAINICIO').AsString + '   -   ' +
                cdsExisteJud.fieldByname('CODVARA').AsString + '-' + cdsExisteJud.fieldByname('NOMEVARA').AsString;
      // Andre Imakawa - SIG 122151 - Inicio
      If iAno >= 2021 Then
        Result := Result +
                  ' - Rendimentos: R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD').AsFloat) +
                  ' - IRRF (depósito judicial) : R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD').AsFloat) +
                  ' - Rendimento 13º R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD13').AsFloat) +
                  ' - IRRF 13º (depósito judicial) R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD13').AsFloat) + #13
      Else
        Result := Result +
                  ' - Rend.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD').AsFloat) +
                  ' - IRRF : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD').AsFloat) +
                  ' - Rend 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORRENDJUD13').AsFloat) +
                  ' - IRRF 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUD13').AsFloat) + #13;
      // Andre Imakawa - SIG 122151 - Fim
    end
    else
      if (cdsExisteJud.FieldByName('VALORJUDCONTEQ').AsFloat <> 0) or (cdsExisteJud.FieldByName('VALORIRJUDEQ').AsFloat <> 0) or
         (cdsExisteJud.FieldByName('VALORJUDCONTEQ13').AsFloat <> 0) or (cdsExisteJud.FieldByName('VALORIRJUDCONTEQ13').AsFloat <> 0) then
      begin
        // Andre Imakawa - SIG 122151 - Inicio
        If iAno >= 2021 Then
          Result := Result +
                  #13 + #10 + 'Processo Judicial ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString +
                  ' - ' + cdsExisteJud.fieldByname('DATAINICIO').AsString + '   -   ' +
                  cdsExisteJud.fieldByname('CODVARA').AsString + '-' + cdsExisteJud.fieldByname('NOMEVARA').AsString +
                  ' - Contribuição Extraordinária: R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORJUDCONTEQ').AsFloat) +
                  ' - IRRF (depósito judicial) : R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUDEQ').AsFloat) +
                  ' - Contribuição Extraordinária 13º: R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORJUDCONTEQ13').AsFloat) +
                  ' - IRRF 13º (depósito judicial) : R$  ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUDCONTEQ13').AsFloat) + #13
        Else
          Result := Result +
                    #13 + #10 + ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString +
                    ' - ' + cdsExisteJud.fieldByname('DATAINICIO').AsString + '   -   ' +
                    cdsExisteJud.fieldByname('CODVARA').AsString + '-' + cdsExisteJud.fieldByname('NOMEVARA').AsString +
                    ' - Contr. Extr.: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORJUDCONTEQ').AsFloat) +
                    ' - IRRF : ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUDEQ').AsFloat) +
                    ' - Contr. Extr.13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORJUDCONTEQ13').AsFloat) +
                    ' - IRRF 13º ' + FormatFloat('#,##0.00;(#,##0.00)', cdsExisteJud.fieldByname('VALORIRJUDCONTEQ13').AsFloat) + #13;
        // Andre Imakawa - SIG 122151 - Fim
      end;
      //Cássio Rovaroto - SIG Nº 74355 - Fim
      cdsExisteJud.next;


      //If Not cdsExisteJud.eof Then
      //  result := result + #10 + ' Proc.Jud. ' + cdsExisteJud.fieldByname('NUMEROPROCESSO').AsString;
   End; // Edilaine - SOL 198419 / KTN 1908788 - fim
    //End;
  //Cássio Rovaroto - SIG nº 81572 - Fim

  //Leandro Pocebon - SIG132465 - INICIO
  if (pLayout2021) and (iAno >= 2022) then
  begin
    cdsContribPrevPrivada.data := BuscaContribPrevPrivada(iIdPessoa, iAno, pStrCPF);
    cdsContribPrevPrivada.first;
    If Not (cdsContribPrevPrivada.isempty) And (iSistema <> 0) Then
      result := result + #13 + #10 + 'Contribuição Previdência Privada: R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsContribPrevPrivada.FieldByName('VALOR').AsFloat) + #13#10 ;
  End;
  //LENDRO POCEBON - SIG132465 - FIM

  //CPREV - 24752 - Início
  cdsCompIRRF.Data := BuscaCompensaIR(Trunc(iIdPessoa), iAno, pStrCPF);
  If Not cdsCompIRRF.eof Then
    Begin
      // Andre Imakawa - SIG 122151 - Inicio
      If iAno >= 2021 Then
        result := result + #13 + #10 + ' Número Processo ' + cdsCompIRRF.fieldByname('NUMEROPROCESSO').AsString +
          ' - ' + cdsCompIRRF.fieldByname('ANOMESINICIO').AsString + '   -   ' +
          cdsCompIRRF.fieldByname('CODVARA').Asstring + '-' + cdsCompIRRF.fieldByname('NOMEVARA').asstring +
          ' - IR. Compensado: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsCompIRRF.fieldByname('VALORIRJUD').AsFloat) + #13
      Else
        result := result + #13 + #10 + ' Num. Proc. ' + cdsCompIRRF.fieldByname('NUMEROPROCESSO').AsString +
          ' - ' + cdsCompIRRF.fieldByname('ANOMESINICIO').AsString + '   -   ' +
          cdsCompIRRF.fieldByname('CODVARA').Asstring + '-' + cdsCompIRRF.fieldByname('NOMEVARA').asstring +
          ' - IR. Compensado: ' + FormatFloat('#,##0.00;(#,##0.00)', cdsCompIRRF.fieldByname('VALORIRJUD').AsFloat) + #13;
      // Andre Imakawa - SIG 122151 - Fim
    End;

  //Cássio Rovaroto - SIG nº 81348 - Início
  //Início - William Santana - SIG 37283
  //if (iAno >= 2016) and (pLayout2016) then
  if (iAno >= 2016) and ((pLayout2016) or (pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
  //Cássio Rovaroto - SIG nº 81348 - Fim
  begin
   CdsRRA.Data :=  VerificaRRA(pStrCPF, iAno);

   // Andre Imakawa - SIG 47630 - Inicio
   CdsRRA_Aux.Data := VerificaRRA(pStrCPF,iAno, '<');

    if not(CdsRRA.IsEmpty) then
      if not(CdsRRA_Aux.IsEmpty) then
      begin

        
        while not CdsRRA_Aux.Eof do
        begin
          sFiltro := ' MESCOBRANCA <= ' + QuotedStr(CdsRRA_Aux.FieldByName('MESCOBRANCA').AsString);
          rValor  := CdsRRA_Aux.fieldByname('VALOR').AsFloat;
          //CdsRRA.Filtered := false; // Andre Imakawa - SIG 60790
          //CdsRRA.Filter := sFiltro; // Andre Imakawa - SIG 60790
          //CdsRRA.Filtered := true;  // Andre Imakawa - SIG 60790
          CdsRRA.First;

          while not (CdsRRA.Eof) and (Abs(rValor) > 0 ) do
          begin
            CdsRRA.Edit;
            if CdsRRA.fieldByname('VALOR').AsFloat > Abs(rValor) then
            begin
               CdsRRA.fieldByname('VALOR').AsFloat := CdsRRA.fieldByname('VALOR').AsFloat - Abs(rValor);
               rValor := 0;
               CdsRRA.Post;
               CdsRRA.next;  // Andre Imakawa - SIG 60790
            end
            else
            begin
              rValor := rValor + CdsRRA.fieldByname('VALOR').AsFloat;
              CdsRRA.Delete;
            end;
            //CdsRRA.next; // Andre Imakawa - SIG 60790
          end;
          //CdsRRA.Filtered := false; // Andre Imakawa - SIG 60790
          //CdsRRA.Filter := '';      // Andre Imakawa - SIG 60790
          CdsRRA_Aux.next;
        end;
      end;
   CdsRRA.First;
   // Andre Imakawa - SIG 47630 - Fim

   if not(CdsRRA.IsEmpty) then
   begin
     if result <> '  ' then
      result := result + '  ';

     result := result + 'RRA: ';
     while not CdsRRA.Eof do
     begin
      result := result + CdsRRA.FieldByName('MESCOBRANCA').AsString +': R$ '+ FormatFloat('#,##0.00;(#,##0.00)', CdsRRA.fieldByname('VALOR').AsFloat);
      CdsRRA.next;
      if not CdsRRA.Eof then
        result := result + ' | ';
     end;
   end;
  end;
  //Término - William Santana - SIG 37283

  //Cássio Rovaroto - SIG nº 73545
  if (iAno >= 2018) and ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
  begin
    cdsResidExt.Data := BuscaLancResidExterior(pStrCPF, iAno);

    if not cdsResidExt.IsEmpty then
      Result := Result + ('Rendimentos Recebidos por Não Residente: ' +#13#10+#13#10+
                          '  ' + cdsResidExt.FieldByName('NATUREZA_0473').asString + ' (INSS): R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsResidExt.FieldByName('VLR_0473').AsFloat) +
                          ' e ' + cdsResidExt.FieldByName('NATUREZA_9466').asString + ' (FUNCEF): R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsResidExt.FieldByName('VLR_9466').AsFloat) +#13#10+
                          '  ' + 'Total de Imposto de Renda: R$ ' + FormatFloat('#,##0.00;(#,##0.00)', cdsResidExt.FieldByName('VLRTOTAL').AsFloat));
  end;

  cdsExisteJud.Free;
  cdsCompIRRF.Free;
  //CPREV - 24752 - Fim

  cdsPensionista.free;
  cdsPensionista13.free;

  FreeAndNil(CdsRRA); //William Santana - SIG 37283
  FreeAndNil(cdsInformeSaldo); //William Santana - SIG 37283
  FreeAndNil(cdsResidExt); //Cássio Rovaroto - SIG nº 73545
  FreeAndNil(Cds407Detalhado); //Everson Cunha - SIG81365
  FreeAndNil(cdsContribPrevPrivada); //Leandro Pocebon - SIG132465

End;

//William Santana SOL 219338.15472 KIN 2054550

Function TctrlInformeRendimentos.VerificaSaldoAnoBase(iIdPessoa: double; iAno: Integer): Olevariant;
Begin
  result := getDataPacket(' SELECT * FROM BITRIBUTACAO B                      '
    + ' WHERE (TO_CHAR(B.PRIMPAGTO, ''YYYY'') = ' + inttostr(iAno) + ') '
    + ' AND (B.IDPESSOA = ' + floattostr(iIdPessoa) + ')     '
    //+' AND EXISTS (SELECT 1 FROM HSTBITRIBUTACAO H          '
    //+' WHERE H.IDPESSOA = B.IDPESSOA AND H.OPERACAO = ''S'')'
    );

End;
//Início - William Santana SOL 226121.15703 KIN 2060120

Function TCtrlInformeRendimentos.BuscaInformesSaldo(iIdPessoa: double; iAno: Integer; pStrCPF: String): Olevariant;
Begin
  // Paulo Nobre SOL 268555 PPM 1262100
{ result := getDataPacket(' SELECT SUM(H.VALOR) AS VALOR, H.IDPESSOA  ' +
  ' FROM HSTBITRIBUTACAO H           ' +
  ' WHERE H.OPERACAO = ''S''           ' +

  //    ' AND H.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA = ' + floattostr(iIdPessoa) + ')' +
    //
  '      AND H.IDPESSOA IN          ' +
  '    (SELECT IDPESSOA       ' +
  '       FROM PESSOA         ' +
  '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +

  ////////////////////////

  ' AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + inttostr(iAno) +
  ' GROUP BY H.IDPESSOA                '
  );       }

  // Paulo Nobre SOL 268555 PPM 1262100
  result := getDataPacket(' SELECT L.IDBENEFIRRF AS IDPESSOA, SUM(I.VLRLANC) AS VALOR  ' +
    ' FROM LANCIRRF L, LANCXINFORME I                         ' +
    ' WHERE L.IDLANCIRRF = I.IDLANCIRRF                       ' +
    '       AND L.IDBENEFIRRF IN (SELECT IDPESSOA             ' +
    '                             FROM PESSOA                 ' +
    '                             WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +
    '       AND I.IDINFORME = 201                             ' + // IDInforme de Contrib. 1989 a 1995 - IN 1343
    '       AND TO_CHAR(L.DATAPAGAMENTO, ''YYYY'') = ' + inttostr(iAno) +
    ' GROUP BY L.IDBENEFIRRF ');
End;
{
function TCtrlInformeRendimentos.BuscaInformesSaldo( iIdPessoa: double): Olevariant;
begin
    result := getDataPacket ('  SELECT (SUBSTR((SELECT HST.MESCOBRANCA             ' +
     '     FROM HSTBITRIBUTACAO HST                                                ' +
     '    WHERE HST.IDPESSOA =                                                     ' +
     '          (SELECT IDPESSOA FROM ELEGPATRO WHERE IDPESSOA = '+floattostr(iIdPessoa) +')   ' +
     '      AND HST.OPERACAO = ''A''                                               ' +
     '      AND HST.MESCOBRANCA =                                                  ' +
     '          (SELECT MIN(DATA)                                                  ' +
     '             FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA                        ' +
     '                      FROM HSTBITRIBUTACAO H, BITRIBUTACAO B                 ' +
     '                     WHERE H.OPERACAO = ''S''                                ' +
     '                       AND B.IDPESSOA = H.IDPESSOA                           ' +
     '                       AND H.IDPESSOA IN                                     ' +
     '                           (SELECT IDPESSOA                                  ' +
     '                               FROM ELEGPATRO E                              ' +
     '                                WHERE E.IDPESSOA IN ('+floattostr(iIdPessoa) +')))       ' +
     '  UNION (SELECT MAX(H.MESREFERENCIA) AS DATA                                 ' +
     '  FROM HSTBITRIBUTACAO H                                                     ' +
     ' WHERE H.OPERACAO = ''A''                                                    ' +
     '   AND H.IDPESSOA IN                                                         ' +
     '       (SELECT IDPESSOA                                                      ' +
     '          FROM ELEGPATRO E                                                   ' +
     '        WHERE E.IDPESSOA IN ('+floattostr(iIdPessoa) +'))                                ' +
     '   AND NOT                                                                   ' +
     '        EXISTS                                                               ' +
     ' (SELECT 1                                                                   ' +
     '          FROM HSTBITRIBUTACAO H1                                            ' +
     '         WHERE H1.OPERACAO = ''S''                                           ' +
     '           AND H1.IDPESSOA =                                                 ' +
     '               H.IDPESSOA)) UNION                                            ' +
     '                     SELECT TO_CHAR(MAX(COTDATA), ''YYYY/MM'')               ' +
     '                       FROM COTACAOMOEDA CM                                  ' +
     '                      WHERE CM.MOECODIGO = 300                               ' +
     '                        AND CM.COTDATA <=                                    ' +
     '                            LAST_DAY(ADD_MONTHS(SYSDATE, -1)))               ' +
     '                      WHERE DATA IS NOT NULL                                 ' +
     '            )),1,4)) AS CONTRIBUICAO,                                             ' +
     '  ROUND(SUM(H.VALOR) *                                                       ' +
     '        (SELECT NVL(EXP(SUM(LN(COT.COTVALOR / 100 + 1))), 1) AS IND_VLR_ACUMULADO    ' +
     '           FROM COTACAOMOEDA COT                                             ' +
     '           JOIN (SELECT DTINI.VALOR  AS DATAINICIO,                          ' +
     '                       DTFIM.VALOR  AS DATAFIM,                              ' +
     '                       INDICE.VALOR AS INDICE                                ' +
     '                  FROM (SELECT V.NUMLINHA,                                   ' +
     '                               SUBSTR(V.VALOR, 7, 4) ||                      ' +
     '                               SUBSTR(V.VALOR, 3, 3) AS VALOR                ' +
     '                          FROM VALTABGENER V                                 ' +
     '                         WHERE V.CODTABELA = ''IN 1343''                     ' +
     '                           AND V.CODCAMPO = ''DATA INI '') DTINI             ' +
     '                  JOIN (SELECT V.NUMLINHA,                                   ' +
     '                              SUBSTR(V.VALOR, 7, 4) ||                       ' +
     '                              SUBSTR(V.VALOR, 3, 3) AS VALOR                 ' +
     '                         FROM VALTABGENER V                                  ' +
     '                        WHERE V.CODTABELA = ''IN 1343''                      ' +
     '                          AND V.CODCAMPO = ''DATA FIM'') DTFIM               ' +
     '                    ON DTFIM.NUMLINHA = DTINI.NUMLINHA                       ' +
     '                  JOIN (SELECT V.NUMLINHA, V.VALOR                           ' +
     '                         FROM VALTABGENER V                                  ' +
     '                        WHERE V.CODTABELA = ''IN 1343''                      ' +
     '                          AND V.CODCAMPO = ''INDICE'') INDICE                ' +
     '                   ON INDICE.NUMLINHA = DTINI.NUMLINHA                       ' +
     '                WHERE DTINI.VALOR >= ''2007/12'') BI_INDICES                 ' +
     '            ON COT.MOECODIGO = BI_INDICES.INDICE                             ' +
     '            AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') >=                         ' +
     '                BI_INDICES.DATAINICIO                                        ' +
     '            AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') <= BI_INDICES.DATAFIM      ' +
     '          WHERE TO_CHAR(COT.COTDATA, ''YYYY/MM'') <=                         ' +
     '                (SELECT HST.MESCOBRANCA                                      ' +
     '                   FROM HSTBITRIBUTACAO HST                                  ' +
     '                  WHERE HST.IDPESSOA =                                       ' +
     '                        (SELECT IDPESSOA                                     ' +
     '                           FROM ELEGPATRO                                    ' +
     '                          WHERE IDPESSOA = '+floattostr(iIdPessoa) +')                   ' +
     '                    AND HST.OPERACAO = ''A''                                 ' +
     '                    AND HST.MESCOBRANCA =                                    ' +
     '                        (SELECT MIN(DATA)                                    ' +
     '                           FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA          ' +
     '                                    FROM HSTBITRIBUTACAO H, BITRIBUTACAO B   ' +
     '                                   WHERE H.OPERACAO = ''S''                  ' +
     '                                     AND B.IDPESSOA = H.IDPESSOA             ' +
     '                                     AND H.IDPESSOA IN                       ' +
     '                                         (SELECT IDPESSOA                    ' +
     '                                            FROM ELEGPATRO E                 ' +
     '    WHERE E.IDPESSOA IN ('+floattostr(iIdPessoa) +') )) UNION (SELECT MAX(H.MESREFERENCIA) AS DATA   ' +
     '                               FROM HSTBITRIBUTACAO H                        ' +
     '                              WHERE H.OPERACAO = ''A''                       ' +
     '                                AND H.IDPESSOA IN                            ' +
     '                                    (SELECT IDPESSOA                         ' +
     '                                       FROM ELEGPATRO E                      ' +
     '                                      WHERE E.IDPESSOA IN ('+floattostr(iIdPessoa) +'))  ' +
     '                                AND NOT                                      ' +
     '                                     EXISTS                                  ' +
     '                              (SELECT 1                                      ' +
     '                                       FROM HSTBITRIBUTACAO H1               ' +
     '                                      WHERE H1.OPERACAO = ''S''              ' +
     '                                        AND H1.IDPESSOA =                    ' +
     '                                            H.IDPESSOA)) UNION               ' +
     '                                  SELECT TO_CHAR(MAX(COTDATA), ''YYYY/MM'')  ' +
     '                                    FROM COTACAOMOEDA CM                     ' +
     '                                   WHERE CM.MOECODIGO = 300                  ' +
     '                                     AND CM.COTDATA <=                       ' +
     '                                         LAST_DAY(ADD_MONTHS(SYSDATE, -1)))  ' +
     '                                   WHERE DATA IS NOT NULL                    ' +
     '                         ))),                                                ' +
     '        2) AS VALOR,                                                         ' +
     '  H.IDPESSOA,                                                                ' +
     '  PES.NOME,                                                                  ' +
     '  PES.NUMDOCUMENTO,                                                          ' +
     '  E.MATRICULA,                                                               ' +
     '  E.DATAADMISSAO,                                                            ' +
     '  B.PRIMPAGTO,                                                               ' +
     '  SP.DESCRICAO,                                                              ' +
     '  PPR.NOME PLANO,                                                            ' +
     '  PROC.NUMEROPROCESSO,                                                       ' +
     '  PROC.DATAINICIO,                                                           ' +
     '  PROC.DATAFINAL,                                                            ' +
     '  DECODE(PROC.SITPROCESSO,                                                   ' +
     '        0,                                                                   ' +
     '        ''Ação Judicial em Liminar'',                                        ' +
     '        1,                                                                   ' +
     '        ''Ação Judicial Julgada Ganha'',                                     ' +
     '         2,                                                                  ' +
     '        ''Ação Judicial Julgada Perdida'') ACAO,                             ' +
     '  PROC.CODVARA,                                                              ' +
     '  PROC.NOMEVARA                                                              ' +
     '  FROM HSTBITRIBUTACAO H,                                                    ' +
     '  HSTCONTRIBPREV HST,                                                        ' +
     '  CONTRIBUICAO C,                                                            ' +
     '  PESSOA PES,                                                                ' +
     '  BITRIBUTACAO B,                                                            ' +
     '  PESSOAFISICA PF,                                                           ' +
     '  PARTPREVPLAN PP,                                                           ' +
     '  ELEGPATRO E,                                                               ' +
     '  PLANPREV PPR,                                                              ' +
     '  SITPART SP,                                                                ' +
     '  (SELECT P.SITPROCESSO,                                                     ' +
     '          P.IDPESSOA,                                                        ' +
     '          P.NUMEROPROCESSO,                                                  ' +
     '          P.CODVARA,                                                         ' +
     '          P.NOMEVARA,                                                        ' +
     '          P.DATAINICIO,                                                      ' +
     '          P.DATAFINAL                                                        ' +
     '     FROM PROCJUD P                                                          ' +
     '    WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC   ' +
     '   WHERE H.IDPESSOA IN                                                       ' +
     '  (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.IDPESSOA IN ('+floattostr(iIdPessoa) +'))    ' +
     '  AND H.OPERACAO = ''E''                                                     ' +
     '    AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO                                ' +
     '    AND H.IDPESSOA = HST.IDPESSOA                                            ' +
     '    AND H.IDMOTIVO = HST.IDMOTIVO                                            ' +
     '    AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO                                ' +
     '    AND H.MESREFERENCIA = HST.MESREFERENCIA                                  ' +
     '    AND H.MESCOBRANCA = HST.MESCOBRANCA                                      ' +
     '    AND B.IDPESSOA = PES.IDPESSOA                                            ' +
     '    AND PF.IDPESSOA = PES.IDPESSOA                                           ' +
     '    AND PROC.IDPESSOA(+) = PES.IDPESSOA                                      ' +
     '    AND PP.IDPESSOA = E.IDPESSOA                                             ' +
     '    AND PP.IDPESSJUR = E.IDPESSJUR                                           ' +
     '    AND PP.IDSITPART = SP.IDSITPART                                          ' +
     '    AND PP.IDPESSOA IN                                                       ' +
     '        (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.IDPESSOA IN ('+floattostr(iIdPessoa) +'))   ' +
     '    AND PP.IDPLANOPREV = 2                                                   ' +
     '    AND PPR.IDPLANOPREV = PP.IDPLANOPREV                                     ' +
     '    AND E.IDPESSOA = PES.IDPESSOA                                            ' +
     '    AND H.IDPESSOA = B.IDPESSOA                                              ' +
     '    AND H.IDPESSOA = PES.IDPESSOA                                            ' +
     '    AND H.IDPESSOA = PP.IDPESSOA                                             ' +
     '    AND H.IDPESSOA = E.IDPESSOA                                              ' +
     '  GROUP BY H.IDPESSOA,                                                       ' +
     '           H.OPERACAO,                                                       ' +
     '           PES.NOME,                                                         ' +
     '           PES.NUMDOCUMENTO,                                                 ' +
     '           E.MATRICULA,                                                      ' +
     '           E.DATAADMISSAO,                                                   ' +
     '           B.PRIMPAGTO,                                                      ' +
     '           SP.DESCRICAO,                                                     ' +
     '           PPR.NOME,                                                         ' +
     '           PROC.NUMEROPROCESSO,                                              ' +
     '           PROC.DATAINICIO,                                                  ' +
     '           PROC.DATAFINAL,                                                   ' +
     '           PROC.SITPROCESSO,                                                 ' +
     '           PROC.CODVARA,                                                     ' +
     '           PROC.NOMEVARA                                                     ');

end;
}
// END William Santana SOL 219338.15472 KIN 2054550

//Término - William Santana SOL 226121.15703 KIN 2060120

//Inicio - Leandro Pocebon - SIG132465
Function TCtrlInformeRendimentos.BuscaContribPrevPrivada(iIdPessoa: double; iAno: Integer; pStrCPF: String): Olevariant;
var
  SQL: string;
Begin
  // Andre Imakawa - SIG 132907 - Inicio
  {
  result := getDataPacket(' SELECT SUM(H.VALORPROVENTO) AS VALOR  ' +
    ' FROM HISTRUBSAL H                         ' +
    ' WHERE H.IDINFORME in (37,46,133)                        ' +
    ' AND TO_CHAR(H.DATAPAGAMENTO, ''YYYY'') = ' + inttostr(iAno) +
    '       AND H.IDRESPONSAVEL IN (SELECT IDPESSOA           ' +
    '                             FROM PESSOA                 ' +
    '                             WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')');
  }
  result := getDataPacket(  'SELECT DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,'
     + '                                  ''N'','
     + '                                  (TRUNC(LI.VLRLANC, 2) * -1),'
     + '                                  TRUNC(LI.VLRLANC, 2)))),'
     + '                  -1,'
     + '                  (SUM(DECODE(IE.FLGNATUREZA,'
     + '                              ''N'','
     + '                              (TRUNC(LI.VLRLANC, 2) * -1),'
     + '                              TRUNC(LI.VLRLANC, 2)))) * -1,'
     + '                  SUM(DECODE(IE.FLGNATUREZA,'
     + '                             ''N'','
     + '                             (TRUNC(LI.VLRLANC, 2) * -1),'
     + '                             TRUNC(LI.VLRLANC, 2)))) AS VALOR'
     + '  FROM LANCIRRF XB,'
     + '       INFORME IE,'
     + '       LANCXINFORME LI'
     + ' WHERE (XB.FLGPENSAOALIM = 0)'
     + '   AND (LI.IDLANCIRRF = XB.IDLANCIRRF)'
     + '   AND (LI.IDINFORME = IE.IDINFORME)'
     + '   AND (TO_CHAR(XB.DATAPAGAMENTO, ''YYYY'') = ' + QuotedStr(inttostr(iAno)) + ')'
     + '   AND XB.IDBENEFIRRF IN'
     + '       (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO = '+ QuotedStr(pStrCPF) + ')'
     + '   AND (NVL(XB.IDMODULORESPON, XB.IDMODULO) = 18)'
     + '   AND LI.IDINFORME in (37, 46, 133)');
  // Andre Imakawa - SIG 132907 - Fim

End;
//Termino - Leandro Pocebon - SIG132465

//Início - William Santana - SIG 37283
Function TCtrlInformeRendimentos.VerificaRRA(pStrCPF: string; iAno: Integer; pSinal: string = '>'):OleVariant;
Var
 sSQL: String;
begin
  sSQL := ' SELECT * FROM (    ' +
          ' SELECT H.IDRESPONSAVEL,      ' +
          '       SUBSTR(H.MESCOBRANCA,6,7)||''/''||SUBSTR(H.MESCOBRANCA,0,4) MESCOBRANCA,  ' +
          '       SUM(DECODE(H.FLGDESCONTO, 0, H.VALORPROVENTO, H.VALORPROVENTO * -1)) VALOR ' +
          ' FROM HISTRUBSAL H, PROVDESC PR        ' +
          ' WHERE H.IDRUBRICA = PR.IDPROVENTO     ' +
          '   AND H.CODPROVDESC = PR.CODPROVDESC  ' +
          '   AND H.CODIRRFDARF = PR.CODIRRFDARF  ' +
          '   AND TO_CHAR(H.DATAPAGAMENTO, ''YYYY'') = '+ IntToStr(iAno) +   // Andre Imakawa - SIG 40324
          '   AND SUBSTR(H.MESCOBRANCA,1,4) = '+ IntToStr(iAno) +  // Andre Imakawa - SIG 40324
          '   AND H.IDRESPONSAVEL IN (SELECT IDPESSOA       ' +
          '                           FROM PESSOA          ' +
          '                           WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +
          '   AND PR.FLGRRA = 1 ' +
          '   AND H.IDINFORME = 187  ' +
          ' GROUP BY H.IDRESPONSAVEL, H.MESCOBRANCA ) ' +
          ' WHERE VALOR '+ pSinal +' 0' + // Andre Imakawa - SIG 60790
          ' ORDER BY MESCOBRANCA DESC ';  // Andre Imakawa - SIG 60790

  Result := GetDataPacket(sSQL);
end;                                  
//Término - William Santana - SIG 37283

Function TCtrlInformeRendimentos.BuscaAnos(iIdPessoa: double): Olevariant;
Var
  sSQL: String;
Begin
  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT /*+RULE*/ DISTINCT TO_CHAR(DATAPAGAMENTO, ''YYYY'') AS ANO ' + // Edilaine - SOL 180189 / KTN 1761859
    ' FROM LANCIRRF LI, LANCXINFORME LXI, INFORME I ' +
    ' WHERE LI.IDBENEFIRRF = ' + floatToStr(iIdPessoa) +
    '    AND LI.IDLANCIRRF = LXI.IDLANCIRRF ' +
    '    AND LXI.IDINFORME = I.IDINFORME ' +
    ' ORDER BY ANO DESC '); // Edilaine - SOL 180189 / KTN 1761859

  Result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
End;

Function TCtrlInformeRendimentos.BuscaDadosInformeFormatado(iIdPessoa: Double; iIdEmpresaProp, iAno,
  isistema: integer; sRubrica, nomeResp, DataInf: String): Olevariant;

Var
  i: integer;
  cdsLocal, CdsAux: TCmClientDataSet;

Begin
  cdsLocal := TCmClientDataSet.Create(Nil);
  cdsAux := TCmClientDataSet.Create(Nil);
  Try
    cdsLocal.Data := BuscaDadosInforme(iIdPessoa, iIdEmpresaProp, iAno, isistema, sRubrica, nomeResp, DataInf);

    If cdsLocal.IsEmpty Then
      Raise Exception.Create('Não foi possível recuperar dados do informe.');

    For i := 0 To CdsLocal.FieldCount - 1 Do
      Begin
        If Copy(CdsLocal.Fields[i].FieldName, 1, 3) <> 'VLR' Then
          CdsAux.FieldDefs.Add(CdsLocal.Fields[i].FieldName, CdsLocal.Fields[i].DataType,
            CdsLocal.Fields[i].Size, CdsLocal.Fields[i].Required)
        Else
          CdsAux.FieldDefs.Add(CdsLocal.Fields[i].FieldName, ftString,
            15, CdsLocal.Fields[i].Required);
      End;

    CdsLocal.First;
    CdsAux.CreateDataSet;
    While Not CdsLocal.Eof Do
      Begin
        CdsAux.Insert;

        For i := 0 To CdsLocal.FieldCount - 1 Do
          If Copy(CdsAux.Fields[i].FieldName, 1, 3) <> 'VLR' Then
            CdsAux.Fields[i].Value := CdsLocal.Fields[i].Value
          Else
            CdsAux.Fields[i].Value := FormatFloat('#,##0.00', CdsLocal.Fields[i].AsFloat);

        CdsAux.Post;

        CdsLocal.Next;
      End;

    CdsLocal.Close;
    Result := CdsAux.Data;
  Finally
    cdsLocal.Free;
    cdsAux.Free;
  End;
End;

//-------------------------

Procedure TCtrlInformeRendimentos.AfterInitialize;
Begin
  Inherited;
  FuncaoGeral.InitializeAs(Self);
End;

Function TCtrlInformeRendimentos.AtualizaLancIRRF(IdBenef, IdModulo: Integer; CodNatureza, pStrCPF: String): Boolean;
Var
  Ssql: String;

Begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.AtualizaLancIRRF(IdBenef, IdModulo, CodNatureza, pStrCPF);
      If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
    End
  Else
    Begin
      Try
        StartTransaction;
        Ssql := 'UPDATE LANCIRRF SET FLGDARF = ''S'' ' +
          ' WHERE ((FLGDARF = ''N'') ' +
          '    OR (FLGDARF IS NULL)) ' +
          // Paulo Nobre SOL 268555 PPM 1262100
//          '   AND (IDBENEFIRRF = ' + intTostr(IdBenef) + ') ' +
//
        '      AND IDBENEFIRRF IN          ' +
          '    (SELECT IDPESSOA       ' +
          '       FROM PESSOA         ' +
          '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +

        ////////////////////////

        '   AND (CODNATUREZA = ' + quotedStr(CodNatureza) + ')  ' +
          '   AND (NVL(IDMODULORESPON,IDMODULO) = ' + intTostr(IdModulo) + ')';

        If Not ExecSQL(Ssql) Then
          Begin
            Result := False;
            Rollback;
          End
        Else
          Begin
            Result := True;
            Commit;
          End;

      Except
        Result := false;
        Rollback;
      End;
    End;
End;

Function TCtrlInformeRendimentos.Completa(sNome: String;
  iTam: integer): String;

Var
  i: integer;

Begin
  sNome := trim(sNome);
  i := length(sNome);
  Result := sNome + FuncaoGeral.Spc(iTam - i);
End;

Function TCtrlInformeRendimentos.CompletaZero(sNome: String;
  iTam: integer): String;

Var
  i, k: integer;

Begin
  sNome := trim(sNome);
  i := length(sNome);
  Result := '';

  For k := 1 To (iTam - i) Do
    Result := Result + '0';

  Result := Result + sNome;
End;

Function TCtrlInformeRendimentos.FormataCPF(CPF: String): String;
Begin
  Result := Copy(CPF, 1, 3) + '.' + Copy(CPF, 4, 3) + '.' + Copy(CPF, 7, 3) + '-' + Copy(CPF, 10, 2);
End;

Function TCtrlInformeRendimentos.strEspacoEsquerda(TamanhoTexto: Integer;
  Texto: String): String;
Var
  numEspacos: integer;
  f: integer;
  Espacos: String;

Begin
  Espacos := '';
  numEspacos := tamanhoTexto - length(texto);

  For f := 1 To numEspacos Do
    Espacos := Espacos + ' ';

  result := Espacos + texto;
End;

Constructor TCtrlInformeRendimentos.Create;
Begin
  Inherited;
  FuncaoGeral := TFuncaoGeral.create;
  ReemBolsoINSSPA13:=  TStringlist.create;//SIG85183.92415

  _cdsAux := tcmClientDataSet.Create(Nil); // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados := TStringList.Create; // Edilaine - SOL 180189 / KTN 1761859

End;

Destructor TCtrlInformeRendimentos.Destroy;
Begin
  Inherited;
  FuncaoGeral.free;
  FreeAndNil(_CdsAux); // Edilaine - SOL 180189 / KTN 1761859
  FreeAndNil(_sSqlDados); // Edilaine - SOL 180189 / KTN 1761859
  FreeAndNil(ReemBolsoINSSPA13);//SIG85183.92415
End;

Function TCtrlInformeRendimentos.BuscaPelaMatricula(sMatricula: String): integer;
Var
  ssql: String;
  cds: TcmClientDataset;

Begin
  result := -1;
  ssql := '';
  cds := TcmClientDataSet.Create(Nil);
  ssql := ' SELECT F.IDPESSOA, P.NUMDOCUMENTO ' +
    ' FROM PESSOA P, FUNCIONARIO F ' +
    ' WHERE (F.MATRICULA LIKE ' + quotedStr(sMatricula + '%') + ')' +
    ' AND (F.IDPESSOA = P.IDPESSOA) ' +
    ' UNION SELECT E.IDPESSOA, P.NUMDOCUMENTO ' +
    ' FROM PESSOA P, ELEGPATRO E ' +
    ' WHERE (E.MATRICULA LIKE ' + quotedStr(sMatricula + '%') + ')' +
    ' AND (E.IDPESSOA = P.IDPESSOA) ';

  Try
    cds.data := GetDataPacket(ssql);
    If Not cds.IsEmpty Then
      result := cds.fieldByName('IDPESSOA').asInteger;
  Finally
    cds.free;
  End;
End;

Function TCtrlInformeRendimentos.BuscaPeloCpf(sCpf: String): integer;
Var
  cds,
    cdsAux: tcmClientDataSet;

Begin
  result := -1;
  cds := tcmClientDataSet.Create(Nil);
  cdsAux := tcmClientDataSet.Create(Nil);
  Try
    cds.Data := GetDataPacket(' SELECT P.IDPESSOA, P.NUMDOCUMENTO FROM PESSOA P ' +
      ' WHERE (P.NUMDOCUMENTO = ' + quotedStr(sCpf) + ') ');

    While Not cds.Eof Do
      Begin
        cdsAux.Data := GetDataPacket('SELECT NVL(COUNT(*),0) AS TOTAL FROM LANCIRRF WHERE IDBENEFIRRF = ' + cds.FieldByName('IDPESSOA').AsString);

        If cdsAux.FieldByName('TOTAL').AsInteger = 0 Then
          cds.Next
        Else
          Break;
      End;

    If Not cds.Eof Then
      result := cds.FieldByName('IDPESSOA').asInteger;

  Finally
    cds.free;
    cdsAux.free;
  End;
End;

Function TCtrlInformeRendimentos.BuscaPeloCpfAno(Const sCpf, sExercicio: String; bPensaoAlimenticia: Boolean = False; AIdPessoa: TPessoa_InformeRendimentos = Nil): integer;
Var
  cds,
    cdsAux: tcmClientDataSet;
  sString: String;

Begin
  result := -1;
  cds := tcmClientDataSet.Create(Nil);
  cdsAux := tcmClientDataSet.Create(Nil);

  // SOL 189126 KTN 1786515 Otacilio ** Inicio **
  sString := '';
  If bPensaoAlimenticia Then
    sString := ' AND FLGPENSAOALIM IN (1, 2)';
  // SOL 189126 KTN 1786515 Otacilio ** Fim **
  Try
    cds.Data := GetDataPacket(' SELECT P.IDPESSOA, P.NUMDOCUMENTO FROM PESSOA P ' +
      ' WHERE (P.NUMDOCUMENTO = ' + quotedStr(sCpf) + ') ');

    While Not cds.Eof Do
      Begin
        cdsAux.Data := GetDataPacket('SELECT NVL(COUNT(*),0) AS TOTAL' + #13 +
          'FROM LANCIRRF ' + #13 +
          'WHERE IDBENEFIRRF = ' + cds.FieldByName('IDPESSOA').AsString + #13 +
          // SOL 189126 KTN 1786515 Otacilio ** Inicio **
          '  AND TO_CHAR(DATALANCAMENTO,''YYYY'') = ' + QuotedStr(sExercicio) + sString);

        // SOL 189126 KTN 1786515 Otacilio ** Fim **

//Inicio - Vander - SOL: 190550 - Kintana: 1802481
{if cdsAux.FieldByName('TOTAL').AsInteger = 0 then
cds.Next
else
Break;}

//       if (cdsAux.FieldByName('TOTAL').AsInteger > 0) Then //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
//       Begin //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
        If Result = (-1) Then
          result := cds.FieldByName('IDPESSOA').asInteger;

        //if Length(AIdPessoa) = 0 Then
        If AIdPessoa = Nil Then
          Break;

        AIdPessoa.Add(Cds.FieldByName('IDPESSOA').AsInteger);
        //       End; //Marcio Sanches Spinosa SOL 201709 Kintana 1954579

        cds.Next;
        //Fim - Vander - SOL: 190550 - Kintana: 1802481
      End;

    //Comentado - Vander - SOL: 190550 - Kintana: 1802481
    {if not cds.Eof then
      result := cds.FieldByName('IDPESSOA').asInteger;}
  Finally
    cds.free;
    cdsAux.free;
  End;
End;

//-------------------------

Function TCtrlInformeRendimentos.BuscaCampo6sqlPensionistas(
  fPessoaPen: Double;
  iano: integer;
  iSistema: integer;
  pStrCPF: String //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
  ): OleVariant;

Const
  _SQL_IDPESSOA = '***IDPESSOA***'; //Marcio Sanches Spinosa SOL 201709 Kintana 1954579

Var
  sSql: String;
  Pessoas: TPessoa_InformeRendimentos;

  //Inicio - Marcio Sanches Spinosa SOL 201709 Kintana 1954579

  Procedure SetIdPessoa(Var AStrList: TStringList; AStr: String);
  Var
    I: integer;
    StrIdPessoa: String;
  Begin
    If (Pessoas <> Nil) Then
      StrIdPessoa := Pessoas.GetSql
    Else
      StrIdPessoa := ' = ' + FloatToStr(fPessoaPen);

    AStr := StringReplace(Astr, _SQL_IDPESSOA, StrIdPessoa, []);
    AStrList.Add(AStr);
  End;
  //Fim - Marcio Sanches Spinosa SOL 201709 Kintana 1954579
Begin
  //Marcio Sanches Spinosa SOL 201709 Kintana 1954579 - Inicio
  If (pStrCPF <> EmptyStr) Then
    Begin
      Pessoas := TPessoa_InformeRendimentos.Create;

      BuscaPeloCpfAno(pStrCPF, IntToStr(iano), False, Pessoas);
    End;
  //Marcio Sanches Spinosa SOL 201709 Kintana 1954579 - Fim
  If (iSistema = 0) Then //Folha de Empregados
    Begin
      _sSqlDados.Clear; // Edilaine - SOL 180189 / KTN 1761859
      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        'SELECT X.IDFAVORECIDO, X.NUMDOCUMENTO, X.NOME, SUM(X.VALOR) AS VALOR, SUM(X.VALOR13) AS VALOR13 ' +
        'FROM ' +
        '('); // Edilaine - SOL 180189 / KTN 1761859

      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Ini
        //' SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, '+
        ' SELECT H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, ' +
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Fim
        //' SUM(DECODE(PR.FLGDESCONTO,0,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR, '
        ' SUM(DECODE(PR.FLGDESCONTO,1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR, ' + //William Moreira da Silva - 228632.15927

        ' 0 AS VALOR13 ' +
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Ini
        //' FROM HISTRUBSAL H, PESSOA P, RUBRICAINDIV R, PROVDESC PR '+
        ' FROM HISTRUBSAL H, PESSOA P, PROVDESC PR ' +
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Fim
        //Darivaldo ALencar SOL.270094 PPM.1349684 -inicio
        //' WHERE H.MES BETWEEN ' + quotedStr(intToStr(iano) + '/01') + ' AND ' + quotedStr(intToStr(iano) + '/12'));
        ' WHERE H.MESCOBRANCA BETWEEN ' + quotedStr(intToStr(iano) + '/01') + ' AND ' + quotedStr(intToStr(iano) + '/12'));
        //Darivaldo ALencar SOL.270094 PPM.1349684 -fim
      // Thiago Melo SOL 228632.15927 Kintana 2062830 Ini

      // Paulo Nobre SOL 268555 PPM 1262100
      //SetIdPessoa(_ssqlDados, ' AND R.IDPESSOA  '+ _SQL_IDPESSOA); //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
      //
      //
      _sSqlDados.Add('AND H.IDPESSOA IN          ' +
        '    (SELECT IDPESSOA       ' +
        '       FROM PESSOA         ' +
        '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')');

      ////////////////////////

      //_sSqlDados.Add(' AND H.IDRUBRICA = R.IDRUBRICA '+
      _sSqlDados.Add(' AND H.IDRUBRICA = PR.IDPROVENTO ' +
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Fim
        ' AND PR.CODRUBCLT = ''50018'' ' +
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Ini
        //' AND R.IDFAVORECIDO = P.IDPESSOA '+
        ' AND H.IDFAVORECIDO = P.IDPESSOA ' +
        //' AND H.IDPESSOA = R.IDPESSOA '+
        //' AND NVL(H.FLGESTORNO, 0) = 0 ' +
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Fim
        ' AND PR.DESCRICAO NOT LIKE ''%13%'' ' +
        // Paulo Nobre SOL 268555 PPM 1262100
    //        ' AND H.IDLANCIRRF IS NOT NULL ' + //CPREV - Pend. 26816

        ' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'', ''3540'', ''3533'', ''3556'', ''3579'') ' + //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Ini
        //' AND R.FLGTPRUBMANUT = ''2'' '+
        //' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME '
        ' GROUP BY H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME '
        // Thiago Melo SOL 228632.15927 Kintana 2062830 Fim
        ); // Edilaine - SOL 180189 / KTN 1761859

      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        ' ) X ' +
        ' GROUP BY ' +
        ' X.IDFAVORECIDO, X.NUMDOCUMENTO, X.NOME ' +
        ' ORDER BY X.NOME '); // Edilaine - SOL 180189 / KTN 1761859
    End;

  If (iSistema <> 0) Then //Folha de Benefícios
    Begin
      {CPrev - 27342 - Início Comentário
      sSql := sSql +
            ' SELECT H.IDPESSOA AS IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, '+
            ' ABS(SUM(DECODE(PR.FLGDESCONTO,0,(H.VALORPROVENTO*-1),H.VALORPROVENTO))) AS VALOR, '+
            ' 0 AS VALOR13 '+
            ' FROM '+
            ' HISTRUBSAL H, '+
            ' PESSOA P, '+
            ' PROVDESC PR '+
            ' WHERE '+
            ' DATAPAGAMENTO BETWEEN TO_DATE('+ quotedStr('01/01/'+ intToStr(iAno)) +', ''DD/MM/YYYY'') '+
            ' AND TO_DATE('+ quotedStr('31/12/'+ intToStr(iAno)) +', ''DD/MM/YYYY'') ' +
            ' AND H.IDPESSOA = P.IDPESSOA '+
        ' AND EXISTS (SELECT IDFAVORECIDO '+
        '             FROM RUBRICAINDIV '+
        '             WHERE IDFAVORECIDO = H.IDPESSOA '+
        '             AND FLGTPRUBMANUT = ''1'' '+
        '             AND FLGPENSAOALIM = ''1'' '+
        '             AND H.IDRUBRICA = RUBRICAPROVENTOPA ) '+
            ' AND H.IDTITULAR = '+ floatToStr(fPessoaPen) +
            ' AND H.IDPESSOA <> H.IDTITULAR '+
            ' AND PR.IDPROVENTO = H.IDRUBRICA '+
            ' AND H.IDLANCIRRF IS NOT NULL '+ //CPREV - Pend. 26816
            ' AND NVL(H.FLGESTORNO, 0) = 0 '  +

            ' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'') ' +
            ' GROUP BY H.IDPESSOA, P.NUMDOCUMENTO, P.NOME '+

            ' UNION '+

            ' SELECT H.IDPESSOA AS IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, '+
            ' ABS(SUM(DECODE(PR.FLGDESCONTO,0,(H.VALORPROVENTO*-1),H.VALORPROVENTO))) AS VALOR, '+
            ' 0 AS VALOR13 '+
            ' FROM '+
            ' HISTRUBSAL H, '+
            ' PESSOA P, '+
            ' PROVDESC PR '+
            ' WHERE '+
            ' DATAPAGAMENTO BETWEEN TO_DATE('+ quotedStr('01/01/'+ intToStr(iAno)) +', ''DD/MM/YYYY'') '+
            ' AND TO_DATE('+ quotedStr('31/12/'+ intToStr(iAno)) +', ''DD/MM/YYYY'') ' +
            ' AND H.IDPESSOA = P.IDPESSOA '+
            ' AND PR.FLGDESCONTO IN (0, 1) '+
        ' AND NOT EXISTS (SELECT IDFAVORECIDO '+
        '                 FROM RUBRICAINDIV '+
        '                 WHERE IDFAVORECIDO = H.IDPESSOA '+
        '                 AND FLGTPRUBMANUT = ''1'' '+
        '                 AND H.IDRUBRICA = RUBRICAPROVENTOPA ) '+
            ' AND H.IDTITULAR = '+ floatToStr(fPessoaPen) +
            ' AND H.IDPESSOA <> H.IDTITULAR '+
            ' AND NVL(H.FLGESTORNO, 0) = 0 '  +
            ' AND FLGPENSAOALIM = 2 ' +
            ' AND SUBSTR(H.MES,6,2) <> ''13'' ' +
            ' AND PR.IDPROVENTO = H.IDRUBRICA '+
            ' AND H.IDLANCIRRF IS NOT NULL '+ //CPREV - Pend. 26816

            ' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'') ' +
        ' GROUP BY H.IDPESSOA, P.NUMDOCUMENTO, P.NOME';
      }//CPrev - 27342 - Fim Comentário

      // Edilaine - SOL 197664 / KTN 1894007
      _sSqlDados.Clear;
      //_sSqlDados.Add(' SELECT H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, ABS(SUM(DECODE(HRS.FLGDESCONTO, 0, -HRS.VALORPROVENTO, HRS.VALORPROVENTO))) AS VALOR, 0 AS VALOR13 ' + // SIG97084 - Tiago Von
      //_sSqlDados.Add(' SELECT H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, ABS(SUM(DECODE(H.FLGDESCONTO, 0, -H.VALORPROVENTO, H.VALORPROVENTO))) AS VALOR, 0 AS VALOR13 ' +         // SIG97084 - Tiago Von
      _sSqlDados.Add(' SELECT '+GetHint(intToStr(iAno))+' H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, ABS(SUM(DECODE(H.FLGDESCONTO, 0, -H.VALORPROVENTO, H.VALORPROVENTO))) AS VALOR, 0 AS VALOR13 ' +         // Marcos Lima SIG136995
        '   FROM HISTRUBSAL H, PESSOA P   ' +
        '  WHERE H.IDPESSJUR   IN (1, 91008) ');

      // Paulo Nobre SOL 268555 PPM 1262100
      //      SetIdPessoa(_ssqlDados, ' and H.IDPESSOA  ' + _SQL_IDPESSOA); //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
      //
      _sSqlDados.Add('AND H.IDPESSOA IN          ' +
        '    (SELECT IDPESSOA       ' +
        '       FROM PESSOA         ' +
        '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')');

      ////////////////////////

      _sSqlDados.Add('    AND H.MESCOBRANCA    BETWEEN ' + quotedStr(intToStr(iAno) + '/01') +
        '                             AND ' + quotedStr(intToStr(iAno) + '/12') +
        '    AND H.MES <> ' + Quotedstr(intToStr(iAno) + '/13') +

        '    AND H.IDHSTFOLHABENEF IN (SELECT IDHSTFOLHABENEF ' +
        '                                 FROM HSTFOLHABENEF   ' +
        '                                WHERE UPPER(HISTORICO) LIKE ''%FOLHA%' + intToStr(iAno) + '%'' ) '); //Marcio Sanches Spinosa SOL 236827 PPM 500319
        //Tiago Von - SIG 97084 - inicio
        {
        //TAES - SIG96227 - início
        if (pLayout2019) then
        begin
          _sSqlDados.Add('    AND H.CODIRRFDARF IN (''0561'', ''5565'', ''3223'', ''0588'', ''3540'', ''3556'', ''3579'') ');
        end
        else
          _sSqlDados.Add('    AND H.CODIRRFDARF IN (''0561'', ''5565'', ''3223'', ''0588'', ''3540'', ''3533'', ''3556'', ''3579'') '); //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
        //TAES - SIG96227 - fim
        } // Tiago Von SIG 97084 - FIM

        _sSqlDados.Add('    AND H.CODIRRFDARF IN (''0561'', ''5565'', ''3223'', ''0588'', ''3540'', ''3533'', ''3556'', ''3579'') ' + // Tiago Von SIG 97084
                       '    AND NVL(H.FLGPENSAOALIM,0) IN (0, 1) ' +          // Paulo Nobre - WO7147
                       '    AND H.IDMODULO = 18 ' +
                       '    AND NVL(H.FLGESTORNO, 0) = 0 ' +
                       '    AND H.FLGDESCONTO IN (0, 1) ' +
                       '    AND H.IDFAVORECIDO IS NOT NULL  ' +
                       '    AND H.IDFAVORECIDO = P.IDPESSOA ' +
                       '    AND H.IDPESSOA <> H.IDFAVORECIDO ' +         // Paulo Nobre - WO7147
                       // Paulo Nobre SOL 268555 PPM 1262100
                       //        '    AND H.IDLANCIRRF IS NOT NULL    ' +
                       '  GROUP BY H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');

      // Edilaine - SOL 197664 / KTN 1894007 - comentado
      //CPrev - 27342 - Início
      {_sSqlDados.Add(    // Edilaine - SOL 180189 / KTN 1761859
            ' SELECT '+
            '   HRS.IDFAVORECIDO, '+
            '   PES.NUMDOCUMENTO, '+
            '   PES.NOME, '+
            '   ABS(SUM(DECODE(HRS.FLGDESCONTO, 0, -HRS.VALORPROVENTO, HRS.VALORPROVENTO))) AS VALOR, '+
            '   0 AS VALOR13 '+

            ' FROM '+
            '   HISTRUBSAL HRS, '+
            '   PESSOA     PES  '+

            ' WHERE HRS.IDPESSOA              = '+ floatToStr(fPessoaPen) +

            '   AND HRS.IDFAVORECIDO is not null '+              // Edilaine - SOL 180189 / KTN 1761859

            '   AND HRS.DATAPAGAMENTO   BETWEEN TO_DATE('+ quotedStr('01/01/'+ intToStr(iAno)) +', ''DD/MM/YYYY'') '+
                                          ' AND TO_DATE('+ quotedStr('31/12/'+ intToStr(iAno)) +', ''DD/MM/YYYY'') '+
            '   AND HRS.IDLANCIRRF           IS NOT NULL '+
            '   AND NVL(HRS.FLGESTORNO, 0)    = 0 '+
            '   AND HRS.CODIRRFDARF          IN (''0561'',''5565'',''3223'',''0588'') '+
            '   AND SUBSTR(HRS.MES, 6, 2)    <> ''13'' '+
            '   AND HRS.FLGDESCONTO          IN (0, 1) '+
            '   AND HRS.FLGPENSAOALIM         = 1 '+

            '   AND HRS.IDFAVORECIDO          = PES.IDPESSOA '+  // Edilaine - SOL 180189 / KTN 1761859

            ' GROUP BY '+
            '   HRS.IDFAVORECIDO, '+
            '   PES.NUMDOCUMENTO, '+
            '   PES.NOME '
            );  // Edilaine - SOL 180189 / KTN 1761859
      //CPrev - 27342 - Fim
      }// Edilaine - SOL 197664 / KTN 1894007 - comentado
    End;

  _sSqlDados.SaveToFile('c:\planus\temp\BuscaCampo6sqlPensionistas.txt');
  //  cmDebugToFile('Sql Campo 6 Pensionistas','c:\planus\temp\DebugInforme.txt');
  result := getDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859

  FreeAndNil(Pessoas);
End;

Function TCtrlInformeRendimentos.BuscaCampo6sqlPensionistas13(
  fPessoaPen: Double;
  iano: integer;                                  
  sRubrica: String;
  iSistema: integer;
  pStrCPF: String): OleVariant;

Const
  _SQL_IDPESSOA = '***IDPESSOA***'; //Marcio Sanches Spinosa SOL 201709 Kintana 1954579

  //var sSql : string;   // Edilaine - SOL 180189 / KTN 1761859 - comentado
Var
  Pessoas: TPessoa_InformeRendimentos;

  //Inicio - Marcio Sanches Spinosa SOL 201709 Kintana 1954579

  Procedure SetIdPessoa(Var AStrList: TStringList; AStr: String);
  Var
    I: integer;
    StrIdPessoa: String;
  Begin
    If (Pessoas <> Nil) Then
      StrIdPessoa := Pessoas.GetSql
    Else
      StrIdPessoa := ' = ' + FloatToStr(fPessoaPen);

    AStr := StringReplace(Astr, _SQL_IDPESSOA, StrIdPessoa, []);
    AStrList.Add(AStr);
  End;
  //Fim - Marcio Sanches Spinosa SOL 201709 Kintana 1954579
Begin
  _sSqlDados.Clear; // Edilaine - SOL 180189 / KTN 1761859

  //Marcio Sanches Spinosa SOL 201709 Kintana 1954579 - Inicio
  If (pStrCPF <> EmptyStr) Then
    Begin
      Pessoas := TPessoa_InformeRendimentos.Create;
      BuscaPeloCpfAno(pStrCPF, IntToStr(iAno), False, Pessoas);
    End;
  //Marcio Sanches Spinosa SOL 201709 Kintana 1954579 - Fim

  If (iSistema = 0) Then //Folha de Empregados
    Begin
      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        'SELECT X.IDFAVORECIDO, X.NUMDOCUMENTO, X.NOME, SUM(X.VALOR) AS VALOR, SUM(X.VALOR13) AS VALOR13 ' +
        'FROM ' +
        '('); // Edilaine - SOL 180189 / KTN 1761859

       _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        //Darivaldo ALencar SOL.270094 PPM.1349684 -inicio
        //' SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME,  ' +
        ' SELECT H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME,  ' +
        //Darivaldo ALencar SOL.270094 PPM.1349684 -fim
        ' SUM(DECODE(PR.FLGDESCONTO,0,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR, ' +
        ' 0 AS VALOR13 ' +
        //Darivaldo ALencar SOL.270094 PPM.1349684 -inicio
        //'  FROM HISTRUBSAL H, PESSOA P, RUBRICAINDIV R, PROVDESC PR  ' +
        ' FROM HISTRUBSAL H, PESSOA P, PROVDESC PR '+
        //Darivaldo ALencar SOL.270094 PPM.1349684 -fim
        //' WHERE H.MES BETWEEN ' + quotedStr(intToStr(iAno) + '/01') + ' AND ' + quotedStr(intToStr(iAno) + '/12'));
        ' WHERE H.MESCOBRANCA BETWEEN ' + quotedStr(intToStr(iAno) + '/01') + ' AND ' + quotedStr(intToStr(iAno) + '/12'));
        //Darivaldo ALencar SOL.270094 PPM.1349684 -inicio
        //SetIdPessoa(_sSqlDados, '   AND R.IDPESSOA    ' + _SQL_IDPESSOA); //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
        SetIdPessoa(_sSqlDados, '   AND H.IDPESSOA    ' + _SQL_IDPESSOA);
        //_sSqlDados.Add('   AND H.IDRUBRICA = R.IDRUBRICA ' +
        //Darivaldo ALencar SOL.270094 PPM.1349684 -fim
         _sSqlDados.ADD(
        '   AND H.IDRUBRICA = PR.IDPROVENTO ' +
        '   AND PR.CODRUBCLT = ''50017''' +
        //Darivaldo ALencar SOL.270094 PPM.1349684 -inicio
        //'   AND R.IDFAVORECIDO = P.IDPESSOA ' +
        '   AND H.IDFAVORECIDO = P.IDPESSOA ' +
        //  Vinicius Maciel
        //'   AND H.MESCOBRANCA >= R.ANOMESINICIO ' + // Edilaine - SOL 200107 / KTN 1927826
        //  Vinicius Maciel
        //'   AND H.IDPESSOA = R.IDPESSOA ' +
        //Darivaldo ALencar SOL.270094 PPM.1349684 -fim
        '   AND NVL(H.FLGESTORNO, 0) = 0 ' +
        '   AND PR.DESCRICAO LIKE ''%13%''' +
        // Paulo Nobre SOL 268555 PPM 1262100
        // '   AND H.IDLANCIRRF IS NOT NULL ' + //CPREV - Pend. 26816
        ' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'', ''3540'', ''3533'', ''3556'', ''3579'')'+  //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
        //Darivaldo ALencar SOL.270094 PPM.1349684 -inicio
        //' AND R.FLGTPRUBMANUT = ''2'' ' +
        //Vinicius Maciel SOL XXXX
        //' and R.ANOMESREF >= ' + quotedStr(intToStr(iAno) + '/01') +
        //' and R.ANOMESREF <= ' + quotedStr(intToStr(iAno) + '/12') +

        //Vinicius Maciel SOL XXXX
        //' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME '
        ' GROUP BY H.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME '
        //Darivaldo ALencar SOL.270094 PPM.1349684 -fim
        ); // Edilaine - SOL 180189 / KTN 1761859

      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        ' ) X ' +
        ' GROUP BY ' +
        ' X.IDFAVORECIDO, X.NUMDOCUMENTO, X.NOME ' +
        ' ORDER BY X.NOME '); // Edilaine - SOL 180189 / KTN 1761859

    End;

  If (iSistema <> 0) Then //Folha de Benefícios
    Begin
      {CPrev - 27342 - Início Comentário
      sSql := sSql +
            ' SELECT  H.IDPESSOA AS IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, '+
            ' ABS(SUM(DECODE(PR.FLGDESCONTO,0,(H.VALORPROVENTO*-1),H.VALORPROVENTO))) AS VALOR, '+
            ' 0 AS VALOR13 '+
            ' FROM '+
            '  HISTRUBSAL H, '+
            '  PESSOA P, '+
            '  PROVDESC PR '+
        ' WHERE H.MES = '+Quotedstr(intToStr(iAno)+'/13')+
            '   AND H.IDPESSOA = P.IDPESSOA '+
            '   AND H.IDLANCIRRF IS NOT NULL '+ //CPREV - Pend. 26816
        ' AND EXISTS (SELECT IDFAVORECIDO '+
        '             FROM RUBRICAINDIV '+
        '             WHERE IDFAVORECIDO = H.IDPESSOA '+
        '             AND FLGTPRUBMANUT = ''1'' '+
        '             AND FLGPENSAOALIM = ''1'' '+
        '             AND H.IDRUBRICA <> RUBRICAPROVENTOPA ) '+
            '   AND H.IDTITULAR = '+ floatToStr(fPessoaPen)+
            '   AND NVL(H.FLGESTORNO, 0) = 0 '     +
            ' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'') ' +

            '   AND H.IDPESSOA <> H.IDTITULAR '+
            ' AND PR.FLGDESCONTO <> 2 ';

      sSql := sSql +
        ' AND PR.IDPROVENTO = H.IDRUBRICA '+
                           '   GROUP BY H.IDPESSOA, P.NUMDOCUMENTO, P.NOME '+
            ' UNION '+
            ' SELECT H.IDPESSOA AS IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, '+
            ' ABS(SUM(DECODE(PR.FLGDESCONTO,0,(H.VALORPROVENTO*-1),H.VALORPROVENTO))) AS VALOR, '+
            ' 0 AS VALOR13 '+
            ' FROM '+
            ' HISTRUBSAL H, '+
            ' PESSOA P, '+
            ' PROVDESC PR '+
            ' WHERE '+
            '     H.MES = '+Quotedstr(intToStr(iAno)+'/13')+
            ' AND H.IDPESSOA = P.IDPESSOA '+
        ' AND NOT EXISTS (SELECT IDFAVORECIDO '+
        '                 FROM RUBRICAINDIV '+
        '                 WHERE IDFAVORECIDO = H.IDPESSOA '+
        '                 AND FLGTPRUBMANUT = ''1'' '+
        '                 AND H.IDRUBRICA = RUBRICAPROVENTOPA ) '+
            ' AND H.IDTITULAR = '+ floatToStr(fPessoaPen) +
            ' AND NVL(H.FLGESTORNO, 0) = 0 '  +
            ' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'') ' +

            ' AND H.IDLANCIRRF IS NOT NULL '+ //CPREV - Pend. 26816
            ' AND H.IDPESSOA <> H.IDTITULAR '+
            ' AND FLGPENSAOALIM = 2 ';

            Ssql := Ssql +
            ' AND H.MES = '+Quotedstr(intToStr(iAno)+'/13')+
            ' AND PR.IDPROVENTO = H.IDRUBRICA '+
            ' AND PR.FLGDESCONTO <> 2 '+
        ' GROUP BY H.IDPESSOA, P.NUMDOCUMENTO, P.NOME ';
      }//CPrev - 27342 - Fim Comentário

      //CPrev - 27342 - Início
      //sSql := sSql +      // Edilaine - SOL 180189 / KTN 1761859 - comentado
      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        ' SELECT ' +
        '   HRS.IDFAVORECIDO, ' +
        '   PES.NUMDOCUMENTO, ' +
        '   PES.NOME, ' +
        '   ABS(SUM(DECODE(HRS.FLGDESCONTO, 0, -HRS.VALORPROVENTO, HRS.VALORPROVENTO))) AS VALOR, ' +
        '   0 AS VALOR13 ' +

        'FROM ' +
        // Edilaine - SOL 197664 / KTN 1894007
        '   (SELECT * ' +
        '      FROM HISTRUBSAL H ' +
        '     WHERE ');
      SetIdPessoa(_sSqlDados, '           H.IDPESSOA             ' + _SQL_IDPESSOA); //Marcio Sanches Spinosa SOL 201709 Kintana 1954579
      _sSqlDados.Add('       AND H.MES                   = ' + Quotedstr(intToStr(iAno) + '/13') +
        '       AND H.IDHSTFOLHABENEF IN (SELECT IDHSTFOLHABENEF FROM HSTFOLHABENEF WHERE UPPER(HISTORICO) LIKE ''%FOLHA%' + intToStr(iAno) + '%'')' + //Marcio Sanches Spinosa SOL 236827 PPM 500319
        '       AND H.DATAPAGAMENTO   BETWEEN TO_DATE(' + quotedStr('01/01/' + intToStr(iAno)) + ', ''DD/MM/YYYY'') ' +
        '                                 AND TO_DATE(' + quotedStr('31/12/' + intToStr(iAno)) + ', ''DD/MM/YYYY'') ' +
        '       AND H.FLGPENSAOALIM         = 1 ' +
        // Paulo Nobre SOL 268555 PPM 1262100
//        '       AND H.IDLANCIRRF IS NOT NULL ' +
        '       AND H.IDMODULO = 18 ' +
        '       AND NVL(H.FLGESTORNO, 0)    = 0 ' +
        '       AND H.IDPESSJUR IN (1, 91008) ' +
        '       AND H.IDFAVORECIDO is not null ');

        //Tiago Von SIG97084 - inicio
        //TAES - SIG96227 - início
        //if (pLayout2019) then
        //begin
        //  _sSqlDados.Add(' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'', ''3540'', ''3556'', ''3579'') ');
        //end
        //else
          _sSqlDados.Add(' AND H.CODIRRFDARF IN (''0561'',''5565'',''3223'',''0588'', ''3540'', ''3533'', ''3556'', ''3579'') '); //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
        //TAES - SIG96227 - fim
        //Tiago Von SIG97084 - fim
        
        _sSqlDados.Add('  AND H.FLGDESCONTO          IN (0, 1) ' +
                       '   ) HRS, ' +
        // Edilaine - SOL 197664 / KTN 1894007 - fim

        '   PESSOA     PES  ' +

        '   WHERE PES.IDPESSOA              = HRS.IDFAVORECIDO ' + // Edilaine - SOL 197664 / KTN 1894007

        ' GROUP BY ' +
        '   HRS.IDFAVORECIDO, ' +
        '   PES.NUMDOCUMENTO, ' +
        '   PES.NOME '

        // Edilaine - SOL 197664 / KTN 1894007
        {'   HISTRUBSAL HRS, '+
        '    PESSOA     PES '+

        'WHERE HRS.IDPESSOA              = '+ floatToStr(fPessoaPen) +

        '  AND HRS.IDFAVORECIDO is not null '+              // Edilaine - SOL 180189 / KTN 1761859

        '  AND HRS.IDLANCIRRF           IS NOT NULL '+
        '  AND NVL(HRS.FLGESTORNO, 0)    = 0 '+
        '  AND HRS.CODIRRFDARF          IN (''0561'',''5565'',''3223'',''0588'') '+
        '  AND HRS.MES                   = '+Quotedstr(intToStr(iAno)+'/13')+
        '  AND HRS.FLGDESCONTO          IN (0, 1) '+
        '  AND HRS.FLGPENSAOALIM         = 1 '+

        '  AND HRS.IDFAVORECIDO          = PES.IDPESSOA '+  // Edilaine - SOL 180189 / KTN 1761859

        'GROUP BY '+
        '  HRS.IDFAVORECIDO, '+
        '  PES.NUMDOCUMENTO, '+
        '  PES.NOME '
        }// Edilaine - SOL 197664 / KTN 1894007 - fim
        ); // Edilaine - SOL 180189 / KTN 1761859
      //CPrev - 27342 - Fim
    End;

  _sSqlDados.SaveToFile('c:\planus\temp\BuscaCampo6sqlPensionistas13.txt');
  //  CmDebugToFile('Sql Campo 6 Pensionistas 13o. Salario','c:\planus\temp\DebugInforme.txt');
  result := getDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859

  FreeAndNil(Pessoas);
End;

Function TCtrlInformeRendimentos.BuscaCampo6sqlRendJud(fPessoaPen: Double; iano, isistema: integer): OleVariant;
Var sSql, sDataIni, sDataFim: String;
  //cdsAux  : TcmClientDataSet;      // Edilaine - SOL 180189 / KTN 1761859
Begin
  //sSql := '';                        // Edilaine - SOL 180189 / KTN 1761859
  sDataIni := '';
  sDataFim := '';
  //cdsAux := TcmClientDataSet.Create(nil);   // Edilaine - SOL 180189 / KTN 1761859
  _cdsAux.data := getDataPacket(' SELECT	IDPROCJUD, DATAINICIO, ' + // Edilaine - SOL 180189 / KTN 1761859
    ' SUBSTR(TO_CHAR(DATAINICIO,''DD/MM/YYYY''),4,2) AS MES, ' +
    ' SUBSTR(TO_CHAR(DATAINICIO,''DD/MM/YYYY''),7,4) AS ANO ' +
    ' FROM	PROCJUD ' +
    ' WHERE IDPESSOA = ' + floatToStr(fPessoaPen) +

    ' AND ((DATAINICIO BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'')) OR ' +
    '      (DATAFINAL  BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'')) OR ' +
    '      (DATAFINAL  IS NULL))');

  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT  L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, ' + // Edilaine - SOL 180189 / KTN 1761859
    // Paulo Nobre SOL 269300 PPM 1293033
    ' P.CODVARA, P.NOMEVARA, SUM(TRUNC(LI.VLRLANC,2)) AS VALORTOT, ' +
    '        SUM(DECODE(LI.IDINFORME,34,TRUNC(LI.VLRLANC,2)*-1,TRUNC(LI.VLRLANC,2))) AS VALOR ,' +
    '        SUM(DECODE(LI.IDINFORME,34,0, TRUNC(LI.VLRLANC,2))) AS VALORREND, ' +
    ' 0 AS VALOR13 ' +
    ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' +
    ' WHERE L.IDBENEFIRRF = ' + floatToStr(fPessoaPen) +
    ' AND L.IDLANCIRRF = LI.IDLANCIRRF ' +
    ' AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') ' +
    ' AND LI.IDINFORME = I.IDINFORME ' +

    ' AND ((P.DATAINICIO BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'')) OR ' +
    '      (P.DATAFINAL  BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'')) OR ' +
    '      (P.DATAFINAL  IS NULL))' +

    '   AND ((I.CODDIRF = ''9'') OR (I.IDINFORME IN (34))) ' +
    ' AND L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'', ''3540'', ''3533'', ''3556'', ''3579'') ' + //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    ' AND L.IDBENEFIRRF = P.IDPESSOA(+) '); // Edilaine - SOL 180189 / KTN 1761859

  If isistema = 0 Then
    _sSqlDados.Add(' AND NVL(L.IDMODULORESPON,L.IDMODULO) = 21 '); // Edilaine - SOL 180189 / KTN 1761859
  If isistema = 1 Then
    _sSqlDados.Add(' AND NVL(L.IDMODULORESPON,L.IDMODULO) = 18 '); // Edilaine - SOL 180189 / KTN 1761859

  If (_cdsAux.fieldbyname('ANO').asstring = intToStr(iAno)) Then // Edilaine - SOL 180189 / KTN 1761859
    sDataIni := '01/' + _cdsAux.fieldbyname('MES').asstring + '/' + intToStr(iAno) // Edilaine - SOL 180189 / KTN 1761859
  Else
    sDataIni := '01/01/' + intToStr(iAno);

  sDataFim := '31/12/' + intToStr(iAno);

  _sSqlDados.Add(' AND L.DATAPAGAMENTO BETWEEN TO_DATE(' + quoTedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quoTedStr(sDataFim) + ',''DD/MM/YYYY'')' +
    ' GROUP BY L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA '); // Edilaine - SOL 180189 / KTN 1761859

  //  cmDebugToFile('Sql Campo 6 Pensionistas Rend. Judicial','c:\planus\temp\DebugInforme.txt');
  result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  //  cmDebugToFile('Sql Campo 6 Pensionistas Rend. Judicial','c:\planus\temp\DebugInforme.txt');
    //cdsAux.Free;   // Edilaine - SOL 180189 / KTN 1761859 - comentado
End;

Function TCtrlInformeRendimentos.BuscaJud(fPessoaPen: Double; iano: integer): OleVariant;
Var sSql, sDataIni, sDataFim: String;
  cdsAux: TcmClientDataSet;
Begin

  result := getDataPacket(' SELECT	IDPROCJUD, DATAINICIO, ' +
    ' SUBSTR(TO_CHAR(DATAINICIO,''DD/MM/YYYY''),4,2) AS MES, ' +
    ' SUBSTR(TO_CHAR(DATAINICIO,''DD/MM/YYYY''),7,4) AS ANO ' +
    ' FROM	PROCJUD ' +
    ' WHERE IDPESSOA = ' + floatToStr(fPessoaPen) +
    ' AND ((DATAINICIO BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'')) OR ' +
    '      (DATAFINAL  BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ', ''DD/MM/YYYY'')) OR ' +
    '      (DATAFINAL  IS NULL))');

End;

Function TCtrlInformeRendimentos.BuscaCampo6sqllJud(fPessoaPen: Double; iano: integer): OleVariant;
Var sSql, sDataIni, sDataFim: String;
  //cdsAux  : TcmClientDataSet;     // Edilaine - SOL 180189 / KTN 1761859 - comentado
Begin
  sDataIni := '';
  sDataFim := '';
  //sSql := '';         // Edilaine - SOL 180189 / KTN 1761859 - comentado

  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA, ABS(SUM(DECODE(I.FLGNATUREZA,''N'',TRUNC(LI.VLRLANC,2)*-1,TRUNC(LI.VLRLANC,2)))) AS VALOR, 0 AS VALOR13 ' + // Edilaine - SOL 180189 / KTN 1761859
    ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' +
    ' WHERE L.IDBENEFIRRF = ' + floatToStr(fPessoaPen) +
    ' AND L.IDLANCIRRF = LI.IDLANCIRRF ' +
    ' AND LI.IDINFORME = I.IDINFORME ' +
    ' AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') ' +
    ' AND (I.CODDIRF = ''14'') ' +
    ' AND L.IDBENEFIRRF = P.IDPESSOA(+) ' +
    ' AND L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'', ''3540'', ''3533'', ''3556'', ''3579'') ' + //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
    ' AND L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedstr('01/01/' + IntToStr(iAno)) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedstr('31/12/' + IntToStr(iAno)) + ',''DD/MM/YYYY'') ' +
    ' GROUP BY L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA '
    ); // Edilaine - SOL 180189 / KTN 1761859

  //  cmDebugToFile('Sql Campo 6 Pensionistas Rend. Judicial 13o. salario','c:\planus\temp\DebugInforme.txt');
  result := getDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  //  cmDebugToFile('Sql Campo 6 Pensionistas Rend. Judicial 13o. salario','c:\planus\temp\DebugInforme.txt');
  //  cdsAux.Free;    // Edilaine - SOL 180189 / KTN 1761859 - comentado
End;

Function TCtrlInformeRendimentos.BuscaCampo6sqllJud13(fPessoaPen: Double; iano: integer): OleVariant;
Var sSql, sDataIni, sDataFim: String;
Begin
  //sSql     := '';    // Edilaine - SOL 180189 / KTN 1761859- comentado
  sDataIni := '01/01/' + intToStr(iano);
  sDataFim := '31/12/' + intToStr(iano);

  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA, ABS(SUM(DECODE(I.FLGNATUREZA,''N'',TRUNC(LI.VLRLANC,2)*-1,TRUNC(LI.VLRLANC,2)))) AS VALOR ' + // Edilaine - SOL 180189 / KTN 1761859
    ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' +
    ' WHERE L.IDBENEFIRRF = ' + floatToStr(fPessoaPen) +
    '   AND L.IDLANCIRRF = LI.IDLANCIRRF ' +
    '   AND LI.IDINFORME = I.IDINFORME   ' +
    '   AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') ' +
    '   AND I.CODDIRF = ''17''           ' +
    '   AND L.IDBENEFIRRF = P.IDPESSOA(+) ' +
    '   AND L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(sDataFim) + ',''DD/MM/YYYY'') ' +
    '   AND L.CODNATUREZA IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'', ''3540'', ''3533'', ''3556'', ''3579'') ' + //Marcio Sanches Spinosa SOL 208778 Kintana 2023148/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    ' GROUP BY L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA '
    ); // Edilaine - SOL 180189 / KTN 1761859

  //  cmDebugToFile('Sql Campo 6 Pensionistas Rend. Judicial 13o. salario','c:\planus\temp\DebugInforme.txt');
  result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  //  cmDebugToFile('Sql Campo 6 Pensionistas Rend. Judicial 13o. salario','c:\planus\temp\DebugInforme.txt');
End;

Function TCtrlInformeRendimentos.BuscaCampo6sqllJudRend13(fPessoaPen: Double; iano: integer): OleVariant;
Var
  sSql, sDataIni, sDataFim: String;

  //CPrev - 28/01/2008 - Início
  iTipoCliente: integer;
  //cdsAux                 : TCMClientDataSet;     // Edilaine - SOL 180189 / KTN 1761859
  //CPrev - 28/01/2008 - Fim

Begin
  // Edilaine - SOL 180189 / KTN 1761859 - comentado
  //cdsAux := TCMClientDataSet.Create( nil ); //CPrev - 28/01/2008

  //sSql     := '';   // Edilaine - SOL 180189 / KTN 1761859 - comentado
  sDataIni := '01/01/' + intToStr(iano);
  sDataFim := '31/12/' + intToStr(iano);

  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA, SUM(TRUNC(LI.VLRLANC,2)) AS VALORTOT ,' + // Edilaine - SOL 180189 / KTN 1761859
    '        SUM(DECODE(LI.IDINFORME,14,TRUNC(LI.VLRLANC,2)*-1,37,TRUNC(LI.VLRLANC,2)*-1,TRUNC(LI.VLRLANC,2))) AS VALOR ,' +
    '        SUM(DECODE(LI.IDINFORME,14,0,37,0,TRUNC(LI.VLRLANC,2))) AS VALORREND13 ' +
    ' FROM PROCJUD P, LANCIRRF L, LANCXINFORME LI, INFORME I ' +
    ' WHERE L.IDBENEFIRRF = ' + floatToStr(fPessoaPen) +
    '   AND L.IDLANCIRRF  = LI.IDLANCIRRF ' +
    '   AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') ' +
    '   AND LI.IDINFORME  = I.IDINFORME   '); // Edilaine - SOL 180189 / KTN 1761859

  //CPrev - 22/01/2008 - Início
  _CdsAux.Data := GetDataPacket('SELECT TIPOCLIENTE FROM EMPRESAPROP '); // Edilaine - SOL 180189 / KTN 1761859
  iTipoCliente := _cdsAux.FieldByName('TIPOCLIENTE').AsInteger; // Edilaine - SOL 180189 / KTN 1761859

  If iTipoCliente = 20011 Then
    _sSqlDados.Add('   AND ((I.CODDIRF = ''11'') OR (I.IDINFORME IN (14, 37))) ') // Edilaine - SOL 180189 / KTN 1761859
  Else
    _sSqlDados.Add('   AND (I.CODDIRF = ''11'') '); // Edilaine - SOL 180189 / KTN 1761859

  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    //CPrev - 22/01/2008 - Fim

    '   AND L.IDBENEFIRRF = P.IDPESSOA(+) ' +
    '   AND L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(sDataFim) + ',''DD/MM/YYYY'') ' +
    ' GROUP BY L.IDBENEFIRRF, P.NUMEROPROCESSO, P.DATAINICIO, P.CODVARA, P.NOMEVARA '); // Edilaine - SOL 180189 / KTN 1761859

  //  cmDebugToFile('Sql Campo 6 Pensionistas Judicial Rend. 13o. salario','c:\planus\temp\DebugInforme.txt');
  result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  //  cmDebugToFile('Sql Campo 6 Pensionistas Judicial Rend. 13o. salario','c:\planus\temp\DebugInforme.txt');
    //cdsAux.Free;   //CPrev - 28/01/2008        // Edilaine - SOL 180189 / KTN 1761859 - comentado
End;

Function TCtrlInformeRendimentos.BuscaEndereco(fPessoaPen: Double): OleVariant;
Var
  sSql: String;

Begin
  //sSql   := '';     // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' + // Edilaine - SOL 180189 / KTN 1761859
    ' P.NUMDOCUMENTO AS CPF, ' +
    ' EN.LOGRADOURO AS ENDEREO, ' +
    ' EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' +
    ' ES.CODESTADO AS UF, C.NUMSEED, ' +
    ' (''-'') AS TELEFONE, (''C'') AS  TIPO ' +
    ' FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES ' +
    ' WHERE (P.IDPESSOA = ' + floatTostr(fPessoaPen) + ') AND ' +
    ' (P.IDPESSOA = EN.IDPESSOA) AND ' +
    ' (EN.IDCIDADES     = C.IDCIDADES(+)) AND ' +
    ' EN.IDENDERECO(+) = P.IDENDCORRESP AND ' +
    ' (ES.IDESTADO(+)    = C.IDESTADO)'); // Edilaine - SOL 180189 / KTN 1761859

  result := getDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
End;

Function TCtrlInformeRendimentos.BuscaInforme1: OleVariant;
Begin
  result := GetDataPacket(' SELECT DISTINCT CODINFORME FROM INFORME ' +
    ' WHERE (CODINFORME >= 301 AND CODINFORME <= 502) ' +
    ' ORDER BY CODINFORME ');

End;

Function TCtrlInformeRendimentos.BuscaMatLocFunc(fIdPessoa: double; pStrCPF: String): Olevariant;
Begin
  result := GetDataPacket(' SELECT F.IDPESSOA, F.CODCENTROCUSTO, C.NOME, F.MATRICULA ' +
    ' FROM FUNCIONARIO F, CENTCUST C ' +

    // Paulo Nobre SOL 268555 PPM 1262100
//    ' WHERE (F.IDPESSOA = ' + floatToStr(fIdPessoa) + ') ' +
      //
    '      WHERE F.IDPESSOA IN          ' +
    '    (SELECT IDPESSOA       ' +
    '       FROM PESSOA         ' +
    '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +

    ////////////////////////

    ' AND (F.IDEMPRESA = C.IDEMPRESA) ' +
    ' AND (F.CODCENTROCUSTO = C.CODCENTROCUSTO)');
End;

Function TCtrlInformeRendimentos.BuscaDadosTxt(fPessoaPen: Double; iano, isistema: integer; nomeResp: String;
  iIdPessoa: Integer; DataInf: String; pbPensao: Boolean;
  pIdListaUsuario: Integer = 0; bPensaoSeparada: Boolean = True): OleVariant;
Var
  sSqlDados, sDataIni, sDataFin, sAno,
    sNomeResp, sDataInf, sDadosComp, cLinha13,
    sRubrica, cLinhaContrib, cLinhaRend, sNomeEmprop,
    sSQL: String;
  iIdEmpresaPropLocal, iModeloFundacao, iCodInforme: Integer;
  CdsPessoa, CdsLocalEmpProp, CdsLocalInforme, cdsLocalCodInforme: TcmClientDataSet;
  lstsSQL: TStringList;

Begin
  sRubrica := '';
  lstsSQL := TStringList.Create;
  sSql := '';
  iIdEmpresaPropLocal := StrtoInt(FloatToStr(fPessoaPen));
  sDataIni := '';
  sDataFin := '';
  sSqlDados := '';
  sDadosComp := ' ';
  cLinha13 := '';
  cLinhaContrib := '';
  cLinhaRend := '';
  sNomeEmprop := '';
  CdsLocalEmpProp := TcmClientDataSet.Create(Nil);
  CdsLocalCodInforme := TcmClientDataSet.Create(Nil);
  CdsPessoa := TcmClientDataSet.Create(Nil);

  If iAno < 0 Then
    Begin
      sAno := FormatDateTime('yyyy', Now);
      sDataIni := '01/01/1900';
    End
  Else
    Begin
      sAno := IntToStr(iAno);
      sDataIni := trim('01/01/' + sAno);
    End;

  sDataFin := trim('31/12/' + sAno);
  sDadosComp := BuscaDadosCompl(iIdPessoa, StrToInt(sAno), isistema, sRubrica, pbPensao);

  Try
    iModeloFundacao := BuscaCodEmProp;
    CdsLocalEmpProp.Data := BuscaEmpresaProp(iIdEmpresaPropLocal);
    CdsLocalCodInforme.Data := BuscaCodInforme(sAno);
    snomeResp := nomeResp;
    sDataInf := DataInf;

    If trim(sNomeResp) = '' Then
      sNomeResp := ' ';

    If trim(sDataInf) = '' Then
      sDataInf := ' ';

    sSql := sSQL + ('SELECT  NOMERESP, DATAINF, ANO, DATA, ANOATUAL,  DADOSCOMP, IDPESSOA,  NOMEBENEF, ' +
      '        CPF, CGC, FONTE, TIPO, CODNATUREZA,  DESCRICAO, RAZAOSOCIAL,  ENDEREO,    ' +
      '        NUMERO,  COMPLEMENTO,  BAIRRO,  NOME,  CEP, UF, MATRICULA ');
    While Not CdsLocalCodInforme.Eof Do
      Begin
        sSql := sSQL + (', SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ')  ' +
          'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '');
        CdsLocalCodInforme.Next;
      End;
    sSql := sSQL + (' FROM ( ');

    sSql := sSQL + (
      ' SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + QuotedStr(IntToStr(iAno)) +
      ' AS ANO, TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' +
      '         TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' +
      '         NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' +
      '         P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' +
      '         NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, ' +
      '         EN.LOGRADOURO AS ENDEREO, ' +
      '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' +
      '         ES.CODESTADO AS UF, EL.MATRICULA, ');

    CdsLocalCodInforme.First;

    If iModeloFundacao <> 2 Then
      Begin
        cLinha13 := '501';
        cLinhaContrib := '303';
        cLinhaRend := '301';
      End
    Else
      Begin
        cLinha13 := '51';
        cLinhaContrib := '3';
        cLinhaRend := '1';
      End;

    iCodInforme := 0;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
          // trata 13º negativo
          sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
        Else
          If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
            sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
          Else
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + ' 2') Then
              sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')

            Else
              sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');

        CdsLocalCodInforme.Next;
        iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
      End;

    sSql := sSQL + (
      ' (''-'') AS TELEFONE, (''C'') AS  TIPOTEL  ' +
      ' FROM PESSOA P, PESSOA E, ENDPESS EN, ESTADO ES, ' +
      ' CIDADES C, NATURENDIMENTO NAT, ELEGPATRO EL, ' +
      ' (SELECT XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, ' +
      ' DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' +
      ' (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,SUM(DECODE(IE.FLGNATUREZA,''N'', ' +
      ' (TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' +
      ' SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' +
      ' SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO ' +
      ' FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI WHERE ');

    If pIdListaUsuario > 0 Then
      sSql := sSql + (' EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD ' + #13 +
        'WHERE XB.IDBENEFIRRF = LD.IDTITULAR ' + #13 +
        ' AND LD.IDLISTA     = ' + IntToStr(pIdListaUsuario) + ') AND ')
    Else
      If iIDPessoa <> -1999 Then
        //        sSql := sSQL + ( ' (XB.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ' );
               //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
        //        sSql := sSql + ( ' (XB.IDBENEFIRRF in (select idpessoa from pessoa where numdocumento in '+#13#10+
        //                         '                    (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ' );

        sSql := sSql + (' (XB.IDBENEFIRRF in (select idpessoa from pessoa where  idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + ')) AND ');

    //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM
 //TRATAMENTO PARA EXCLUIR PENSAO ALIMENTICIA DE ACORDO COM PARAMETRO PASSADO EM TELA CHKPENSAO
    If Not bPensaoSeparada Then
      Begin
        If pbPensao Then
          Begin
            sSql := sSQL +
              '(XB.IDBENEFIRRF IN (SELECT IDFAVORECIDO ' +
              'FROM RUBRICAINDIV ' +
              'WHERE IDFAVORECIDO = XB.IDBENEFIRRF ' +
              'AND RUBRICAPROVENTOPA IS NOT NULL ' +
              'AND FLGPENSAOALIM = 1 ' +
              'AND (DATAFINAL > TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) AND';
          End
        Else
          Begin
            sSql := sSQL +
              '(XB.IDBENEFIRRF NOT IN (SELECT IDFAVORECIDO ' +
              'FROM RUBRICAINDIV ' +
              'WHERE IDFAVORECIDO = XB.IDBENEFIRRF ' +
              'AND RUBRICAPROVENTOPA IS NOT NULL ' +
              'AND FLGPENSAOALIM = 1 ' +
              'AND (DATAFINAL > TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) AND';
          End
      End
    Else
      Begin
        If pbPensao Then
          Begin
            sSql := sSql + ' (XB.FLGPENSAOALIM = 2) AND ';
          End
        Else
          Begin
            sSql := sSql + ' ((XB.FLGPENSAOALIM = 0) OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60)) AND ';
          End;
      End;

    sSql := sSQL + (
      ' (LI.IDLANCIRRF = XB.IDLANCIRRF) AND ' +
      ' (LI.IDINFORME = IE.IDINFORME) AND ' +
      ' (NVL(LI.FLGTIPOREG,''N'') <> ''D'') AND ' +
      ' (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) + ',''DD/MM/YYYY'')) AND ' +
      ' (XB.CODNATUREZA NOT IN (''8888'', ''7893'')) ');

    If iSistema = 0 Then // Folha de Pagamentos
      sSql := sSQL + (' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 21) ');

    If iSistema = 1 Then // Folha de Beneficios
      Begin
        sSql := sSQL + (' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18)    ' +
          ' AND (XB.CODNATUREZA NOT IN (''3223'',''5565'',''7416'',''7431'', ''3556'', ''3579'')) '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
      End;

    If iSistema = 3 Then // Folha de Resgate de Reserva
      sSQL := sSQL + (' AND (XB.CODNATUREZA in (''3223'', ''3556'')) '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    If iSistema = 4 Then // Contas a Pagar - Autonomos
      sSql := sSQL + (' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 3) ');

    If iSistema = 5 Then //Tributação regressiva
      sSQL := sSQL + (' AND (XB.CODNATUREZA in (''5565'', ''3579'')) '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    sSql := sSQL + (
      ' GROUP BY XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME) RE ');

    sSql := sSQL + (' WHERE (P.TIPO = ''F'')' +
      ' AND (E.IDPESSOA = ' + IntToStr(iIdEmpresaPropLocal) + ') AND ');

    If pIdListaUsuario > 0 Then
      sSql := sSql + (' EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD ' + #13 +
        'WHERE P.IDPESSOA = LD.IDTITULAR ' + #13 +
        ' AND LD.IDLISTA     = ' + IntToStr(pIdListaUsuario) + ') AND ')
    Else
      If iIDPessoa <> -1999 Then
        //        sSql := sSQL + ( ' (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
        sSql := sSql + (' (P.IDPESSOA in (select idpessoa from pessoa where numdocumento in ' + #13#10 +
          '                (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ');

    sSql := sSQL + (
      '  (EN.IDENDERECO(+) = P.IDENDCORRESP) AND ' +
      '  (EN.IDPESSOA(+)   = P.IDPESSOA) AND ' +
      '  (EN.IDCIDADES     = C.IDCIDADES(+)) AND ' +
      '  (ES.IDESTADO(+)   = C.IDESTADO) AND ' +
      '  (NAT.CODNATUREZA  = RE.CODNATUREZA) AND ' +
      '  (RE.IDBENEFIRRF   = P.IDPESSOA) AND ' +
      '  (RE.IDBENEFIRRF   = EL.IDPESSOA(+)) ' +
      '  GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' +
      '  E.NUMDOCUMENTO,  E.RAZAOSOCIAL, NAT.CODNATUREZA,  NAT.DESCRICAO, ' +
      '  EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' +
      '  EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO , EL.MATRICULA');

    If (iSistema = 1) Or (iSistema = 2) Then // Folha de Resgate de Reserva
      Begin
        sSql := sSQL + (' UNION ' +
          ' SELECT ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + QuotedStr(IntToStr(iAno)) +
          ' AS ANO, TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' +
          '         TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' +
          '         NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' +
          '         P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ');

        If iSistema = 3 Then // Folha de Resgate de Reserva
          sSql := sSQL + (' NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ') //SOL 248939 PPM 997373
        Else
          sSql := sSQL + (' NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, '); //SOL 248939 PPM 997373

        sSql := sSQL + (' P.RAZAOSOCIAL, EN.LOGRADOURO AS ENDEREO, ' +
          '         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' +
          '         ES.CODESTADO AS UF, EL.MATRICULA,  ');

        CdsLocalCodInforme.First;
        iCodInforme := 0;
        While Not CdsLocalCodInforme.Eof Do
          Begin
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
              // trata 13º negativo
              sSql := sSQL + ('SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0)) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
            Else
              If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
                (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
                (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
                sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
              Else
                If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
                  sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                Else
                  sSql := sSQL + ('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');
            CdsLocalCodInforme.Next;
            iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
          End;

        // BUSCA IR e IR 13o DO DEPÓSITO JUDICIAL

        sSql := sSQL + (
          ' (''-'') AS TELEFONE, (''C'') AS  TIPOTEL  ' + #13 +
          ' FROM PESSOA P, PESSOA E, ENDPESS EN, ESTADO ES, ' + #13 +
          ' CIDADES C, NATURENDIMENTO NAT, ELEGPATRO EL,');
        //------------------------
        sSql := sSQL + (' (SELECT XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, ' +
          ' DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' +
          '  (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,' +
          'SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' +
          ' SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' +
          ' SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO ' +
          ' FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI WHERE ');

        If pIdListaUsuario > 0 Then
          sSql := sSql + (' EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD ' + #13 +
            'WHERE XB.IDBENEFIRRF = LD.IDTITULAR ' + #13 +
            ' AND LD.IDLISTA     = ' + IntToStr(pIdListaUsuario) + ') AND ')
        Else
          If iIdPessoa <> -1999 Then
            //          sSql := sSQL + (  ' (XB.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
                   //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
            //        sSql := sSql + ( ' (XB.IDBENEFIRRF in (select idpessoa from pessoa where numdocumento in '+#13#10+
            //                         '                    (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ' );

            sSql := sSql + (' (XB.IDBENEFIRRF in (select idpessoa from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + ')) AND ');

        //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM

        sSql := sSQL + (' (LI.IDLANCIRRF = XB.IDLANCIRRF) AND ' +
          ' (LI.IDINFORME = IE.IDINFORME) AND ' +
          ' (NVL(LI.FLGTIPOREG,''N'') <> ''D'') AND ' +
          ' (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) + ',''DD/MM/YYYY'')) AND ' +
          ' (XB.CODNATUREZA NOT IN (''8888'', ''7893'')) ' +
          ' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18)    ' +
          ' AND (XB.CODNATUREZA IN (''7416'',''7431'')) ');
        sSql := sSQL + (' GROUP BY XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME) DJ ');
        //------------------------

        sSql := sSQL + (' WHERE (P.TIPO = ''F'')' +
          ' AND (E.IDPESSOA = ' + IntToStr(iIdEmpresaPropLocal) + ') AND ');

        If pIdListaUsuario > 0 Then
          sSql := sSql + (' EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD ' + #13 +
            'WHERE P.IDPESSOA = LD.IDTITULAR ' + #13 +
            ' AND LD.IDLISTA     = ' + IntToStr(pIdListaUsuario) + ') AND ')
        Else
          If iIdPessoa <> -1999 Then
            //          sSql := sSQL + ( ' (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
            sSql := sSql + (' (P.IDPESSOA in (select idpessoa from pessoa where numdocumento in ' + #13#10 +
              '                (select numdocumento from pessoa where idpessoa =' + QuotedStr(FloatToStr(iIdPessoa)) + '))) AND ');

        sSql := sSQL + (
          '  (EN.IDENDERECO(+)  = P.IDENDCORRESP)  AND ' +
          '  (EN.IDPESSOA(+)    = P.IDPESSOA)  AND ' +
          '  (EN.IDCIDADES      = C.IDCIDADES(+))  AND ' +
          '  (ES.IDESTADO(+)    = C.IDESTADO)  AND ' +
          '  (NAT.CODNATUREZA   = DJ.CODNATUREZA)  AND ' +
          '  (DJ.IDBENEFIRRF(+) = P.IDPESSOA) AND ' +
          '  (DJ.IDBENEFIRRF    = EL.IDPESSOA(+)) ' +
          '  GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' +
          '  E.NUMDOCUMENTO,  E.RAZAOSOCIAL, NAT.CODNATUREZA,  NAT.DESCRICAO, ' +
          '  EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' +
          '  EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO, EL.MATRICULA ');
      End;

    sSql := sSQL + ('  ) GROUP BY NOMERESP, DATAINF, ANO, DATA, ANOATUAL, ' +
      '  DADOSCOMP, IDPESSOA,  NOMEBENEF, CPF, CGC, FONTE, TIPO, CODNATUREZA,  DESCRICAO,' +
      '  RAZAOSOCIAL, ENDEREO, NUMERO,  COMPLEMENTO,  BAIRRO,  NOME,  CEP, UF, MATRICULA');

    sSql := sSQL + ('  ORDER BY  CEP, IDPESSOA, RAZAOSOCIAL, CODNATUREZA ');

    lstsSQL.add(ssql);

    Result := GetDataPacket(sSQL);

  Finally
    lstsSQL.free;
    CdsLocalEmpProp.Free;
    CdsLocalCodInforme.Free;
  End;
End;

Function TCtrlInformeRendimentos.BuscaMatricula(fIdPessoa, fIdPessJur: double; pStrCPF: String): Olevariant;
Begin
  result := GetDataPacket(' SELECT MATRICULA FROM ELEGPATRO ' +
    // Paulo Nobre SOL 268555 PPM 1262100
//    ' WHERE IDPESSOA  = ' + floatToStr(fIdPessoa) +
      //
    '      WHERE IDPESSOA IN    ' +
    '    (SELECT IDPESSOA       ' +
    '       FROM PESSOA         ' +
    '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +
    ////////////////////////

    '   AND IDPESSJUR = ' + floatToStr(fIdPessJur));
End;

Function TCtrlInformeRendimentos.BuscaCodEmProp: integer;
Var
  snomeEmProp: String;
  cdsLocalEmpProp: TcmClientDataSet;

Begin
  result := 0;
  cdsLocalEmpProp := TcmClientDataSet.Create(Nil);
  cdsLocalEmpProp.data := GetDataPacket(' SELECT TIPOCLIENTE, NOMEEMPRESA FROM EMPRESAPROP ');
  {modelo = 0 = REFER; modelo = 1 = FUNCEF; modelo = 2 = CBS; modelo = 3 = FCRT/BRTPREV}
  snomeEmProp := UpperCase(cdsLocalEmpProp.fieldByName('NOMEEMPRESA').asString);

  Case cdsLocalEmpProp.FieldByName('TIPOCLIENTE').AsInteger Of
    19971: result := 0;
    19991: result := 1;
    19981: result := 2;
    20011: result := 3;
  End;

  cdsLocalEmpProp.Free;
End;

Function TCtrlInformeRendimentos.BuscaPorMatriculas(sMatricula: String): OleVariant;
Var
  ssql: String;

Begin
  ssql := ' SELECT F.IDPESSOA, P.NUMDOCUMENTO ' +
    ' FROM PESSOA P, FUNCIONARIO F ' +
    ' WHERE (F.MATRICULA IN (' + sMatricula + '))' +
    ' AND (F.IDPESSOA = P.IDPESSOA) ' +
    ' UNION SELECT E.IDPESSOA, P.NUMDOCUMENTO ' +
    ' FROM PESSOA P, ELEGPATRO E ' +
    ' WHERE (E.MATRICULA IN (' + sMatricula + '))' +
    ' AND (E.IDPESSOA = P.IDPESSOA) ' +
    ' UNION SELECT E.IDPESSOA, P.NUMDOCUMENTO ' +
    ' FROM PESSOA P, DEPENTIT E ' +
    ' WHERE (E.MATRICULA IN (' + sMatricula + '))' +
    ' AND (E.IDPESSOA = P.IDPESSOA) ';
  result := GetDataPacket(ssql);
End;

//Busca outras informações da linha 6

Function TCtrlInformeRendimentos.BuscaCampo6Outros(fPessoaPen: Double; iano: integer; pStrCPF: String): OleVariant;
Var
  sSql, sDataIni, sDataFim: String;

Begin
  //ESTA ROTINA SÓ É UTILIZADA PARA O TIPOCLIENTE = 20011

  sDataIni := '';
  sDataFim := '';
  sSql := '';
  sDataIni := '01/01/' + intToStr(iano);
  sDataFim := '31/12/' + intToStr(iano);

  //Coloquei a query atual como uma subquery, grupando na query principal o valor
  //pelo seqinf e coloquei o idinforme 35 para ser contemplado também
  sSql := ' SELECT sum(l.valor) as valor, l.SEQINF from ( ' +
    ' SELECT DECODE(LI.IDINFORME,9,1, 23, 2, 25, 3, 35, 2) AS SEQINF, ' +
    ' LI.IDINFORME, DECODE(SIGN(NVL(SUM(TRUNC(LI.VLRLANC,2)),0)),-1,0,NVL(SUM(TRUNC(LI.VLRLANC,2)),0)) AS VALOR ' +
    ' FROM LANCIRRF L, LANCXINFORME LI' +

  // Paulo Nobre SOL 268555 PPM 1262100
 //    ' WHERE L.IDBENEFIRRF = ' + floatToStr(fPessoaPen) +
       //
  '      WHERE L.IDBENEFIRRF IN          ' +
    '    (SELECT IDPESSOA       ' +
    '       FROM PESSOA         ' +
    '      WHERE NUMDOCUMENTO = ' + QuotedStr(pStrCPF) + ')' +

  ////////////////////////

  ' AND L.IDLANCIRRF = LI.IDLANCIRRF ' +
    ' AND LI.IDINFORME IN (9,23,25, 35) ' +
    ' AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') ' +
    ' AND L.DATAPAGAMENTO BETWEEN TO_DATE(' + quotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + quotedStr(sDataFim) + ',''DD/MM/YYYY'') ' +
    ' GROUP BY LI.IDINFORME ' +
    ' ORDER BY DECODE(LI.IDINFORME,9,1, 23, 2, 25, 3, 35, 2)) l ' +
    ' group by l.seqinf ';

  result := getDataPacket(sSql);
End;

Function TCtrlInformeRendimentos.BuscaDadosInformeMatriculas(sMatriculas: String; iIdEmpresaProp, iAno,
  isistema: integer; sRubrica, nomeResp, DataInf: String;
  bPensao: Boolean = False; pIdListaUsuario: Integer = 0;
  bPensaoSeparada: Boolean = True): Olevariant;
Var
  iIdPessoa: Int64;
  sSqlDados: TStringList;
  CdsPessoa, CdsLocalEmpProp, CdsLocalInforme, cdsLocalCodInforme: TcmClientDataSet;

  sDataIni, sDataFin, sAno, sNomeResp,
    sDataInf, sDadosComp, cLinha13, cLinhaContrib,
    cLinhaRend, sNomeEmprop, sListaPessoa: String;

  iIdEmpresaPropLocal, iModeloFundacao, iCodInforme, iContador,
    iTipoCliente: Integer;
Begin
  sSqlDados := TStringList.Create;
  iIdEmpresaPropLocal := iIdEmpresaProp;
  sDataIni := '';
  sDataFin := '';
  sDadosComp := ' ';
  cLinha13 := '';
  cLinhaContrib := '';
  sNomeEmprop := '';
  CdsLocalEmpProp := TcmClientDataSet.Create(Nil);
  CdsLocalCodInforme := TcmClientDataSet.Create(Nil);
  CdsPessoa := TcmClientDataSet.Create(Nil);

  CdsLocalEmpProp.Data := GetDataPacket('SELECT TIPOCLIENTE FROM EMPRESAPROP ');
  iTipoCliente := CdsLocalEmpProp.FieldByName('TIPOCLIENTE').AsInteger;

  If iAno < 0 Then
    Begin
      sAno := FormatDateTime('yyyy', Now);
      sDataIni := '01/01/1900';
    End
  Else
    Begin
      sAno := IntToStr(iAno);
      sDataIni := trim('01/01/' + sAno);
    End;
  sDataFin := trim('31/12/' + sAno);
  iIdPessoa := -1999;
  iModeloFundacao := BuscaCodEmProp;
  CdsLocalEmpProp.Data := BuscaEmpresaProp(iIdEmpresaPropLocal);
  CdsLocalCodInforme.Data := BuscaCodInforme(sAno);
  sListaPessoa := '';

  Try
    snomeResp := nomeResp;
    sDataInf := DataInf;

    If trim(sNomeResp) = '' Then
      sNomeResp := ' ';

    If trim(sDataInf) = '' Then
      sDataInf := ' ';

    sSqlDados.Add('SELECT  NOMERESP, DATAINF, ANO, DATA, ANOATUAL,  DADOSCOMP, IDPESSOA,  TIPO, NOMEBENEF, ' + #13 +
      ''' '' AS NOMEALIMENTANTE, ' + #13 +
      ''' '' AS CPFALIMENTANTE, ' + #13 +
      ''' '' AS TELALIMENTANTE, ' + #13 +
      ''' '' AS LOGRADOUROALIM, ' + #13 +
      ''' '' AS NUMEROALIM, ' + #13 +
      ''' '' AS COMPLEMENALIM, ' + #13 +
      ''' '' AS BAIRROALIM, ' + #13 +
      ''' '' AS CIDADEALIM, ' + #13 +
      ''' '' AS CEPALIM, ' + #13 +
      ''' '' AS ESTADOALIM, ' + #13 +
      '        CPF, CGC, FONTE, CODNATUREZA,  UPPER(DESCRICAO) AS DESCRICAO, RAZAOSOCIAL,  ENDEREO,    ' + #13 +
      '        NUMERO,  COMPLEMENTO,  BAIRRO,  NOME,  CEP, UF, NUMSEED ');

    sSqlDados.Add(', IDPESSJUR ');

    CdsLocalCodInforme.First;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        sSqlDados.Add('        , SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') ' +
          'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '');
        CdsLocalCodInforme.Next;
      End;

    If iTipoCliente = 19991 Then
      sSqlDados.Add('        ,(SUM(VLR3011) + SUM(VLR3012)) AS  tot301 ' +
        '        ,(SUM(VLR3021))                AS  tot302 ' +
        '        ,(SUM(VLR3031) + SUM(VLR3032)) AS  tot303 ' +
        '        ,(SUM(VLR3041) + SUM(VLR3042)) AS  tot304 ' +
        '        ,(SUM(VLR3051))                AS  tot305 ' +
        '        ,(SUM(VLR4011) + SUM(VLR4012)) AS  TOT401 ');

      // Andre Imakawa - SIG 122151 - Inicio
      //if pLayout2021 then                                                    //edilaine WO18939
      if (pLayout2021) or ((pLayout2019Pensao) and (iAno >= 2021)) then        //edilaine WO18939
            sSqlDados.Add(' ,SUM((VLR4013) + (VLR4014)) AS  TOT401_L2 ');
      // Andre Imakawa - SIG 122151 - Fim
            
       sSqlDados.Add(
        '        ,(SUM(VLR4021) + SUM(VLR4022)) AS  TOT402 ' +
        '        ,(SUM(VLR4031) + SUM(VLR4032)) AS  TOT403 ' +
        //                    '        ,(SUM(VLR4042))   AS  TOT404 '+
        '        ,(SUM(VLR4042))  + (SUM(VLR4041))  AS  TOT404 ' +
        '        ,(SUM(VLR4051))                AS  TOT405 ' +
        '        ,(SUM(VLR4061))                AS  TOT406 ' +
        '        ,(SUM(VLR4071) + SUM(VLR4072)) AS  TOT407 ' +
        '        ,(SUM(VLR5011) + SUM(VLR5012)) AS  TOT501 ' +
        '        ,(SUM(VLR6011))                AS  TOT601 ' +
        //                    '        ,(SUM(VLR6021))                AS  TOT602 '+
        '        ,(SUM(VLR7011))                AS  TOT701 ' +
        '        ,(SUM(VLR9011) + SUM(VLR9012)) AS  TOT901 ');

    sSqlDados.Add(', (SELECT DISTINCT ''TRUE'' FROM PROCJUD PJ WHERE PJ.IDPESSOA = IDPESSOA) AS PROCESSO ' +
      //Marcio Sanches Spinosa SOL 247267/16926 PPM 652768 - Inicio
      //                  ', (SELECT DISTINCT ''TRUE'' FROM RUBRICAINDIV RI WHERE RI.IDPESSOA = IDPESSOA) AS PENSIONISTA ');
      ', (''TRUE'' ) AS PENSIONISTA ');
    //Marcio Sanches Spinosa SOL 247267/16926 PPM 652768 - Fim

    sSqlDados.Add('FROM ( ');

    //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
    //    sSqlDados.Add(' SELECT /*+INDEX(XB) */ '+ QuotedStr(sNomeResp)+' AS NOMERESP, '+ QuotedStr(sDataInf)+' AS DATAINF, ' + QuotedStr( IntToStr( iAno ) ) + #13 +
    sSqlDados.Add(' SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + QuotedStr(IntToStr(iAno)) + #13 +
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 -fim
      '        AS ANO, TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' + #13 +
      '                TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' + #13 +
      '                PT.IDPESSOA AS IDPESSJUR, ' + #13 +
      '                NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' + #13 +
      '                P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13 +
      '                NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, ' + #13 +
      '                EN.LOGRADOURO AS ENDEREO, ' + #13 +
      '                EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' + #13 +
      '                ES.CODESTADO AS UF, C.NUMSEED, ' + #13);

    CdsLocalCodInforme.First;

    If iModeloFundacao <> 2 Then
      Begin
        cLinha13 := '501';
        cLinhaContrib := '303';
        cLinhaRend := '301';
      End
    Else
      Begin
        cLinha13 := '51';
        cLinhaContrib := '3';
        cLinhaRend := '1';
      End;

    iCodInforme := 0;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
          // trata 13º negativo
          sSqlDados.Add('         DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,' + #13)
        Else
          If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
            sSqlDados.Add('         DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,' + #13)
          Else
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
              sSqlDados.Add('         DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,' + #13)
            Else
              sSqlDados.Add('         DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ' + #13);

        CdsLocalCodInforme.Next;
        iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
      End;

    sSqlDados.Add('        (''-'') AS TELEFONE, (''C'') AS  TIPOTEL  ' + #13 +
      ' FROM PESSOA P, PESSOA E, ENDPESS EN, ESTADO ES, ' + #13 +

      '      CIDADES C, NATURENDIMENTO NAT, ' + #13 +
      '      PESSOA PT, ' + #13 +
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
      //                  '      (SELECT /*+INDEX(XB) */');
      '      (SELECT  ');
    //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim

    sSqlDados.Add('    XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, ' + #13 +
      '    DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1), ' + #13 +
      '      TRUNC(LI.VLRLANC,2))))*-1,SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' + #13 +
      '    SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' + #13 +
      '    SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO ' + #13 +
      '    , XB.IDPATRO ');

    If bPensao And (Not bPensaoSeparada) Then
      sSqlDados.Add('       FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI ')
    Else
      sSqlDados.Add('       FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI, LISTAFOLHABENEFDET LD ');

    sSqlDados.Add('       WHERE ' + #13);

    If Not bPensao Or ((bPensaoSeparada) And (bPensao)) Then
      sSqlDados.Add('         XB.IDBENEFIRRF = LD.IDPESSOA ' + #13 +
        '     AND LD.IDLISTA = ' + IntToStr(pIdListaUsuario) + ' AND ');

    If Not bPensaoSeparada Then
      Begin
        If bPensao Then
          Begin
            sSqlDados.Add('      XB.IDBENEFIRRF IN (SELECT R.IDFAVORECIDO FROM RUBRICAINDIV R, LISTAFOLHABENEFDET L ' +
              ' WHERE L.IDLISTA = ' + IntToStr(pIdListaUsuario) +

              ' AND R.IDPESSOA = L.IDPESSOA AND R.RUBRICAPROVENTOPA IS NOT NULL AND R.FLGPENSAOALIM = 1) AND');
          End
        Else
          Begin
            sSqlDados.Add('   XB.IDBENEFIRRF NOT IN (SELECT IDFAVORECIDO FROM RUBRICAINDIV WHERE IDFAVORECIDO = XB.IDBENEFIRRF AND RUBRICAPROVENTOPA IS NOT NULL AND FLGPENSAOALIM = 1) AND');
          End;
      End
    Else
      Begin
        If bPensao Then
          Begin
            sSqlDados.Add(' (XB.FLGPENSAOALIM = 2) AND ')
          End
        Else
          Begin
            sSqlDados.Add(' ((XB.FLGPENSAOALIM = 0) OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60)) AND ')
          End;
      End;

    sSqlDados.Add('         (LI.IDLANCIRRF = XB.IDLANCIRRF) AND ' + #13 +
      '         (NVL(LI.FLGTIPOREG,''N'') <> ''D'') AND ' + #13 +
      '         (LI.IDINFORME = IE.IDINFORME) AND ' + #13 +
      '         (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) + ',''DD/MM/YYYY'')) AND ' + #13 +
      '        (XB.CODNATUREZA NOT IN (''8888'', ''7893'')) ');

    If iSistema = 0 Then // Folha de Pagamentos
      sSqlDados.Add(' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 21) ' + #13);

    If iSistema = 1 Then // Folha de Beneficios
      Begin
        sSqlDados.Add(' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18) ' + #13 +
          ' AND (XB.CODNATUREZA NOT IN (''3223'',''5565'',''7416'',''7431'', ''3556'', ''3579'')) '); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

      End;

    If iSistema = 3 Then // Folha de Resgate de Reserva
      sSQLDados.Add(' AND (XB.CODNATUREZA in (''3223'', ''3556'')) ' + #13); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    If iSistema = 4 Then // Contas a Pagar - Autonomos
      sSqlDados.Add(' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 3) ' + #13);

    If iSistema = 5 Then //Tributação Regressiva
      sSQLDados.Add(' AND (XB.CODNATUREZA in (''5565'', ''3579'')) ' + #13); //Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

    sSqlDados.Add(' GROUP BY XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME,XB.IDPATRO) RE ' + #13);

    sSqlDados.Add(' WHERE (P.TIPO = ''F'')' + #13 +
      ' AND (E.IDPESSOA = ' + IntToStr(iIdEmpresaProp) + ') AND ' + #13 +
      ' (PT.IDPESSOA = RE.IDPATRO) AND ' + #13);

    sSqlDados.Add(' (EN.IDENDERECO(+)     = P.IDENDCORRESP) ' +
      '  AND (EN.IDPESSOA(+)    = P.IDPESSOA) ' + #13 +
      '  AND (EN.IDCIDADES      = C.IDCIDADES(+)) ' + #13 +
      '  AND (ES.IDESTADO(+)    = C.IDESTADO) ' + #13 +
      '  AND (NAT.CODNATUREZA    = RE.CODNATUREZA) ' + #13 +
      '  AND (RE.IDBENEFIRRF  = P.IDPESSOA) ' + #13 +

      '  GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' + #13 +
      '  E.NUMDOCUMENTO,  E.RAZAOSOCIAL, NAT.CODNATUREZA,  NAT.DESCRICAO, ' + #13 +
      '  EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' + #13 +
      '  EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO, C.NUMSEED ' + #13 +
      '  , PT.IDPESSOA ' + #13);

    sSqlDados.Add(' UNION ' + #13 +
      ' SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + QuotedStr(IntToStr(iAno)) + #13 +
      ' AS ANO, TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' + #13 +
      '         TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' + #13 +
      '         PT.IDPESSOA AS IDPESSJUR,                                                                                         ' + #13 +
      '         NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' + #13 +
      '         P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13);

    If iModeloFundacao = 1 Then
      Begin
        If iSistema = 3 Then // Folha de Resgate de Reserva
          ssqldados.Add('   NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ') //SOL 248939 PPM 997373
        Else
          //        ssqldados.Add('''0561''  CODNATUREZA, ''RENDIMENTO TRABALHO ASSALARIADO'' AS DESCRICAO, '  );//Marcio Sanches Spinosa SOL 247174 PPM 647931 //SOL 248939 PPM 997373
          ssqldados.Add('   NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, '); //Marcio Sanches Spinosa SOL 247174 PPM 647931 //SOL 248939 PPM 997373
      End
    Else
      Begin
        If iModeloFundacao = 2 Then
          ssqldados.Add('   NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ') //SOL 248939 PPM 997373
        Else
          ssqldados.Add('   NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, '); //SOL 248939 PPM 997373
      End;

    ssqlDados.Add(' P.RAZAOSOCIAL, EN.LOGRADOURO AS ENDEREO, ' +
      ' EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' +
      ' ES.CODESTADO AS UF, C.NUMSEED,');

    CdsLocalCodInforme.First;

    iCodInforme := 0;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
          // trata 13º negativo
          sSqlDados.Add('SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0)) AS VLR' +
            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,' + #13)
        Else
          If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
            (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
            sSqlDados.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
              CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,' + #13)
          Else
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
              sSqlDados.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,' + #13)
            Else
              sSqlDados.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ' + #13);

        CdsLocalCodInforme.Next;
        iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
      End;

    // BUSCA IR e IR 13o DO DEPÓSITO JUDICIAL

    ssqlDados.Add(' (''-'') AS TELEFONE, (''C'') AS  TIPOTEL  ' + #13 +
      ' FROM PESSOA P, PESSOA E, ENDPESS EN, ESTADO ES, ' + #13 +
      ' PESSOA PT, ' + #13 +
      ' CIDADES C, NATURENDIMENTO NAT, ');
    //------------------------

//Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
//    ssqlDados.Add(' (SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, '+
    ssqlDados.Add(' (SELECT  XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, ' +
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
      '         DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' +
      '         (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,' +
      '         SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' +
      '         SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' +
      '         SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO, ' +
      '         XB.IDPATRO ');

    If bPensao Then
      ssqlDados.Add(' FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI WHERE ')
    Else
      ssqlDados.Add(' FROM LANCIRRF XB, INFORME IE, LANCXINFORME LI, LISTAFOLHABENEFDET LD WHERE ');

    If Not bPensao Then
      sSqlDados.Add('    XB.IDBENEFIRRF = LD.IDPESSOA ' + #13 +
        'AND LD.IDLISTA = ' + IntToStr(pIdListaUsuario) + ' AND ');

    If Not bPensaoSeparada Then
      Begin
        If bPensao Then
          Begin
            sSqlDados.Add('   XB.IDBENEFIRRF IN (SELECT R.IDFAVORECIDO FROM RUBRICAINDIV R, LISTAFOLHABENEFDET L ' +
              ' WHERE L.IDLISTA = ' + IntToStr(pIdListaUsuario) +
              ' AND R.IDFAVORECIDO = L.IDPESSOA AND R.RUBRICAPROVENTOPA IS NOT NULL AND R.FLGPENSAOALIM = 1) AND');

          End
        Else
          Begin
            sSqlDados.Add('(XB.IDBENEFIRRF NOT IN (SELECT IDFAVORECIDO FROM RUBRICAINDIV WHERE IDFAVORECIDO = XB.IDBENEFIRRF AND RUBRICAPROVENTOPA IS NOT NULL AND FLGPENSAOALIM = 1)) AND');
          End
      End
    Else
      Begin
        If bPensao Then
          Begin
            sSqlDados.Add(' (XB.FLGPENSAOALIM = 2) AND ')
          End
        Else
          Begin
            sSqlDados.Add(' ((XB.FLGPENSAOALIM = 0)  OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60)) AND ')
          End;
      End;

    sSqlDados.Add(' (LI.IDLANCIRRF = XB.IDLANCIRRF) AND ' +
      ' (NVL(LI.FLGTIPOREG,''N'') <> ''D'') AND ' +
      ' (LI.IDINFORME = IE.IDINFORME) AND ' +
      ' (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sDataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(sDataFin) + ',''DD/MM/YYYY'')) AND ' +
      ' (XB.CODNATUREZA NOT IN (''8888'', ''7893'')) ' +
      ' AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18) ' +
      ' AND (XB.CODNATUREZA IN (''7416'',''7431'')) ');

    sSqlDados.Add(' GROUP BY XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, XB.IDPATRO) DJ ');
    //------------------------

    sSqlDados.Add(' WHERE (P.TIPO = ''F'')' + #13 +
      ' AND (E.IDPESSOA = ' + IntToStr(iIdEmpresaProp) + ') AND ' + #13);

    sSqlDados.Add(' (EN.IDENDERECO(+)     = P.IDENDCORRESP) ' +
      '  AND (EN.IDPESSOA(+)    = P.IDPESSOA) ' +
      '  AND (EN.IDCIDADES      = C.IDCIDADES(+)) ' +
      '  AND (ES.IDESTADO(+)    = C.IDESTADO) ' +
      '  AND (NAT.CODNATUREZA   = DJ.CODNATUREZA) ' +
      '  AND (DJ.IDBENEFIRRF    = P.IDPESSOA) ' +
      '  AND (PT.IDPESSOA       = DJ.IDPATRO) ' + #13 +
      '  GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' +
      '  E.NUMDOCUMENTO,  E.RAZAOSOCIAL, NAT.CODNATUREZA,  NAT.DESCRICAO, ' +
      '  EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' +
      '  EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO, C.NUMSEED ' +
      ', PT.IDPESSOA ');

    If sSqlDados.Count > 0 Then
      sSqlDados.Add('  ) GROUP BY NOMERESP, DATAINF, ANO, DATA, ANOATUAL, ' + #13 +
        '  DADOSCOMP, IDPESSOA,  NOMEBENEF, CPF, CGC, FONTE, TIPO, CODNATUREZA,  UPPER(DESCRICAO),' + #13 +
        '  RAZAOSOCIAL, ENDEREO, NUMERO,  COMPLEMENTO,  BAIRRO,  NOME,  CEP, UF, NUMSEED ' + #13 +
        ', IDPESSJUR ');

    If sSqlDados.Count > 0 Then
      sSqlDados.Add('  ORDER BY  CEP, RAZAOSOCIAL, CODNATUREZA ' + #13);

    If sSqlDados.Count = 0 Then
      Begin
        sSqlDados.Add('SELECT  '' '' AS NOMERESP, '' '' AS DATAINF, 0 AS ANO, ''99/99/9999'' AS DATA, 0 ASANOATUAL,  '' '' AS DADOSCOMP, 0 AS IDPESSOA,  ''F'' AS TIPO, '' '' AS NOMEBENEF, ' + #13 +
          '        '' '' AS CPF, '' '' AS CGC, '' '' AS FONTE, '' '' AS CODNATUREZA,  '' '' AS DESCRICAO, '' '' AS RAZAOSOCIAL,  '' '' AS ENDEREO,    ' + #13 +
          '        0 AS NUMERO,  '' '' AS COMPLEMENTO,  '' '' AS BAIRRO,  '' '' AS NOME,  0 AS CEP, '' '' AS UF, '' '' AS NUMSEED FROM DUAL WHERE 1 = 2');
      End;

    Result := GetDataPacket(sSqlDados.GetText);
  Finally
    CdsLocalEmpProp.Free;
    CdsLocalCodInforme.Free;
    CdsPessoa.Free;
    sSqlDados.Free;
  End;
End;

Function TCtrlInformeRendimentos.BuscaInformeGeral(Const pfIdPessoa: double;
  Const psAno: String;
  Const piSistema: Integer;
  Const piIdEmpresaProp: Integer;
  Const piIdListaUsuario: Integer;
  Const pbPensao: Boolean;
  Const pbPensaoSeparada: Boolean;
  Const psNomeResp: String;
  Const psDataInf: TDateTime;
  Const pbUsaLista: Boolean;
  Const piIndiceOrd: Integer;
  Const bAgrupaCPF: Boolean = False;
  Const sExcluiCPF: String = '';
  Const AIdPessoa: TPessoa_InformeRendimentos = Nil;
  Const piModelo: Integer = 0; //SOL 248939 PPM 997373
  Const pbEliminaZerados : boolean = false  // edilaine - SIG 19602
  ): OleVariant;

Const
  _SQL_IDPESSOA = '***IDPESSOA***'; //Vander - SOL: 190550 - Kintana: 1802481

Var
  sSqlDados: TStringList;
  cdsLocalCodInforme, CdsLocalEmpProp: TCMClientDataSet;
  iTipoCliente, iCodInforme, iModeloFundacao: Integer;

  sPeriodoInicio, sPeriodoFinal, cLinha13, cLinhaContrib,
    cLinhaRend, sDadosComp, sDataInf, sNomeResp: String;

  bJaIncluiuEndereco: Boolean;
  oSql,
    oSqlResult,
    oSqlEndereco: TCmClientDataSet;
  sAno: String; //Vinicius Maciel - SOL 168331 - KTN 1482898
  sAux: String; //Vinicius Maciel SOL 170987 KTN 152871

  //Inicio - Vander - SOL: 190550 - Kintana: 1802481

  Procedure SetIdPessoa(Var AStrList: TStringList; AStr: String);
  Var
    I: integer;
    StrIdPessoa: String;
  Begin
    If (AIdPessoa <> Nil) Then
      StrIdPessoa := AIdPessoa.GetSql
    Else
      StrIdPessoa := ' = ' + FloatToStr(pfIdPessoa);

    AStr := StringReplace(Astr, _SQL_IDPESSOA, StrIdPessoa, []);
    AStrList.Add(AStr);
  End;
  //Fim - Vander - SOL: 190550 - Kintana: 1802481

  //SIG85183.92415 -Inicio
  procedure sSqlDadosADD(sLinhaADD: string);
   begin
     sSqlDados.Add(sLinhaADD);
     ReemBolsoINSSPA13.Add(sLinhaADD);
   end;
  //SIG85183.92415 -Fim

Begin
  //Inicializa Variaveis e Objetos
  sSqlDados := TStringList.Create;

  ReemBolsoINSSPA13.Clear;//SIG85183.92415

  CdsLocalCodInforme := TCMClientDataSet.Create(Nil);
  CdsLocalEmpProp := TCMClientDataSet.Create(Nil);

  CdsLocalCodInforme.Data := BuscaCodInforme(psAno);
  CdsLocalEmpProp.Data := GetDataPacket(' SELECT TIPOCLIENTE FROM EMPRESAPROP ');

  iModeloFundacao := BuscaCodEmProp;

  sPeriodoInicio := '01/01/' + psAno;
  sPeriodoFinal := '31/12/' + psAno;

  sDadosComp := ' ';
  sDataInf := DateToStr(psDataInf);
  sNomeResp := psNomeResp;

  iTipoCliente := CdsLocalEmpProp.FieldByName('TIPOCLIENTE').AsInteger;

  //Bruno Bastos - SOL: 111231 Kintana: 513489 - Início
  If iModeloFundacao <> 2 Then
    Begin
      cLinha13 := '501';
      cLinhaContrib := '303';
      cLinhaRend := '301';
    End
  Else
    Begin
      cLinha13 := '51';
      cLinhaContrib := '3';
      cLinhaRend := '1';
    End;
  // Bruno Bastos - SOL: 111231 Kintana: 513489 - Fim

  // Começa gerar a Query
  Try
    bJaIncluiuEndereco := False;
    sSqlDados.Add('SELECT');
    //SOL 248939 PPM 997373
    If piModelo = 153 Then
      Begin
           sSqlDados.Add(' ENDERECO.CEP||X.CPF CEPINDEXADOR , '); // Andre Imakawa - SIG 29212
      End;
    //SOL 248939 PPM 997373
    If pbPensao Then
      Begin
        sSqlDados.Add('DISTINCT' + #13 +
          '        PES.NOME AS NOMEALIMENTANTE,' + #13 +
          '        PES.NUMDOCUMENTO AS CPFALIMENTANTE,' + #13 +
          '        '' '' AS TELALIMENTANTE,' + #13 +
          '        EN.LOGRADOURO AS LOGRADOUROALIM,' + #13 +
          '        EN.NUMERO AS NUMEROALIM,' + #13 +
          '        EN.COMPLEMENTO AS COMPLEMENALIM,' + #13 +
          '        EN.BAIRRO  AS BAIRROALIM,' + #13 +
          '        C.NOME  AS CIDADEALIM,' + #13 +
          '        EN.CEP  AS CEPALIM,' + #13 +
          '        ES.CODESTADO  AS ESTADOALIM,');
        bJaIncluiuEndereco := True;
      End
    Else
      Begin
        sSqlDados.Add('        '' '' AS NOMEALIMENTANTE,' + #13 +
          '        '' '' AS CPFALIMENTANTE,' + #13 +
          '        '' '' AS TELALIMENTANTE,' + #13 +
          '        '' '' AS LOGRADOUROALIM,' + #13 +
          '        '' '' AS NUMEROALIM,' + #13 +
          '        '' '' AS COMPLEMENALIM,' + #13 +
          '        '' '' AS BAIRROALIM,' + #13 +
          '        '' '' AS CIDADEALIM,' + #13 +
          '        '' '' AS CEPALIM,' + #13 +
          '        '' '' AS ESTADOALIM,');
        bJaIncluiuEndereco := True;
      End;

    // Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    If piSistema = 0 Then
      Begin
        sSqlDados.Add(' X.ENDERECO_FUND, ' + #13 +
          ' X.NUMERO_FUND, ' + #13 +
          ' X.COMPLEMENTO_FUND, ' + #13 +
          ' X.BAIRRO_FUND, ' + #13 +
          ' X.CIDADE_FUND, ' + #13 +
          ' X.CEP_FUND, ' + #13 +
          ' X.UF_FUND, ' + #13 +
          ' X.NUMSEED_FUND, ' + #13 +
          ' X.LOTACAO, ' + #13 +
          ' X.TELEFONE_FUND, ' + #13 +
          ' 0 AS PAGINA, ' + #13 +

          ' '' '' AS ENDERECO_FUND_2, ' + #13 +
          ' '' '' AS NUMERO_FUND_2, ' + #13 +
          ' '' '' AS COMPLEMENTO_FUND_2, ' + #13 +
          ' '' '' AS BAIRRO_FUND_2, ' + #13 +
          ' '' '' AS CIDADE_FUND_2, ' + #13 +
          ' '' '' AS CEP_FUND_2, ' + #13 +
          ' '' '' AS UF_FUND_2, ' + #13 +
          ' '' '' AS NUMSEED_FUND_2, ' + #13 +

          ' '' '' AS NOMEALIMENTANTE_2, ' + #13 +
          ' '' '' AS CPFALIMENTANTE_2, ' + #13 +
          ' '' '' AS TELALIMENTANTE_2, ' + #13 +
          ' '' '' AS LOGRADOUROALIM_2, ' + #13 +
          ' '' '' AS NUMEROALIM_2, ' + #13 +
          ' '' '' AS COMPLEMENALIM_2, ' + #13 +
          ' '' '' AS BAIRROALIM_2, ' + #13 +
          ' '' '' AS CIDADEALIM_2, ' + #13 +
          ' '' '' AS CEPALIM_2, ' + #13 +
          ' '' '' AS ESTADOALIM_2, ' + #13 +
          ' '' '' AS DATAINF_2, ' + #13 +
          ' '' '' AS ANO_2, ' + #13 +
          ' '' '' AS DATA_2, ' + #13 +
          ' '' '' AS ANOATUAL_2, ' + #13 +
          ' '' '' AS DADOSCOMP_2, ' + #13 +
          ' '' '' AS IDPESSOA_2, ' + #13 +
          ' '' '' AS TIPO_2, ' + #13 +
          ' '' '' AS NOMEBENEF_2, ' + #13 +
          ' '' '' AS MATRICULA_2, ' + #13 +
          ' '' '' AS CPF_2, ' + #13 +
          ' '' '' AS CGC_2, ' + #13 +
          ' '' '' AS FONTE_2, ' + #13 +
          ' '' '' AS CODNATUREZA_2, ' + #13 +
          ' '' '' AS IDENDERECO_2, ' + #13 +
          ' '' '' AS DESCRICAO_2, ' + #13 +
          ' '' '' AS RAZAOSOCIAL_2, ' + #13 +
          ' '' '' AS ENDEREO_2, ' + #13 +
          ' '' '' AS NUMERO_2, ' + #13 +
          ' '' '' AS COMPLEMENTO_2, ' + #13 +
          ' '' '' AS BAIRRO_2, ' + #13 +
          ' '' '' AS NOME_2, ' + #13 +
          ' '' '' AS CEP_2, ' + #13 +
          ' '' '' AS UF_2, ' + #13 +
          ' '' '' AS NUMSEED_2, ' + #13 +
          ' '' '' AS FLGPENSAOALIM_2, ' + #13 +
          ' 0 AS TOT301_2, ' + #13 +
          ' 0 AS TOT302_2, ' + #13 +
          ' 0 AS TOT303_2, ' + #13 +
          ' 0 AS TOT304_2, ' + #13 +
          ' 0 AS TOT305_2, ' + #13 +
          ' 0 AS TOT401_2, ' + #13 +
          ' 0 AS TOT402_2, ' + #13 +
          ' 0 AS TOT403_2, ' + #13 +
          ' 0 AS TOT404_2, ' + #13 +
          ' 0 AS TOT405_2, ' + #13 +
          ' 0 AS TOT406_2, ' + #13 +
          ' 0 AS TOT407_2, ' + #13 +
          ' 0 AS TOT408_2, ' + #13 +
          ' 0 AS TOT501_2, ' + #13 +
          ' 0 AS TOT601_2, ' + #13 +
          ' 0 AS TOT602_2, ' + #13 +
          ' 0 AS TOT701_2, ' + #13 +
          ' 0 AS TOT901_2, ' + #13 +

          // Felipe A. Santos - SOL 244545.16839 PPM 624515 - início
          ' 0 AS VLR5021,  ' + #13 +
          ' 0 AS VLR5022,  ' + #13 +
          ' 0 AS TOT502,   ' + #13 +
          // Felipe A. Santos - SOL 244545.16839 PPM 624515 - fim

          // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Inicio
          ' 0 AS VLR4081,  ' + #13 +
          ' 0 AS VLR5031,  ' + #13 +
          ' 0 AS TOT408,   ' + #13 +
          ' 0 AS TOT503,   ' + #13 +
          // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Fim

          ' '' '' AS PROCESSO_2, ' + #13 +
          ' '' '' AS PENSIONISTA_2, ');
      End;
    // Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim

    // CPrev - 27304 - Inicio
    // sSqlDados.Add('        X.NOMERESP, X.DATAINF, X.ANO, X.DATA, X.ANOATUAL, '                + #13 +
    //               '        X.DADOSCOMP, X.IDPESSOA,  X.TIPO, X.NOMEBENEF,  '                  + #13 +
    //               '        '' '' AS NOMEALIMENTANTE, '                                        + #13 +
    //               '        '' '' AS CPFALIMENTANTE, '                                         + #13 +
    //               '        '' '' AS TELALIMENTANTE, '                                         + #13 +
    //               '        '' '' AS LOGRADOUROALIM, '                                         + #13 +
    //               '        '' '' AS NUMEROALIM, '                                             + #13 +
    //               '        '' '' AS COMPLEMENALIM, '                                          + #13 +
    //               '        '' '' AS BAIRROALIM, '                                             + #13 +
    //               '        '' '' AS CIDADEALIM, '                                             + #13 +
    //               '        '' '' AS CEPALIM, '                                                + #13 +
    //               '        '' '' AS ESTADOALIM, '                                             + #13 +
    //               '        B.MATRICULA, '                                                     + #13 +
    //               '        X.CPF, X.CGC, X.FONTE, X.IDPESSJUR, X.CODNATUREZA, '               + #13 +
    //               '        UPPER(X.DESCRICAO) AS DESCRICAO,X.RAZAOSOCIAL, X.ENDEREO, '        + #13 +
    //               '        X.NUMERO, X.COMPLEMENTO, X.BAIRRO, X.NOME, X.CEP, X.UF, X.NUMSEED ');

    sSqlDados.Add('        X.NOMERESP, X.DATAINF, X.ANO_EXERCICIO, X.ANO, X.DATA, X.ANOATUAL, ' + #13 + // Andre Imakawa - SIG 122151
      '        X.DADOSCOMP, /* X.IDPESSOA,*/   X.TIPO, UPPER(TRIM(X.NOMEBENEF)) AS NOMEBENEF,  '); // Paulo Nobre SOL 269130 PPM 1284502
    If Not bJaIncluiuEndereco Then
      sSqlDados.Add('        '' '' AS NOMEALIMENTANTE, ' + #13 +
        '        '' '' AS CPFALIMENTANTE, ' + #13 +
        '        '' '' AS TELALIMENTANTE, ' + #13 +
        '        '' '' AS LOGRADOUROALIM, ' + #13 +
        '        '' '' AS NUMEROALIM, ' + #13 +
        '        '' '' AS COMPLEMENALIM, ' + #13 +
        '        '' '' AS BAIRROALIM, ' + #13 +
        '        '' '' AS CIDADEALIM, ' + #13 +
        '        '' '' AS CEPALIM, ' + #13 +
        '        '' '' AS ESTADOALIM, ');

    //SOL 248939 PPM 997373
    If piModelo = 153 Then
      Begin
        // Paulo Nobre SOL 268555 PPM 1262100
      //        sSqlDados.Add('        /*B.MATRICULA,*/ ' + #13 +

                //CPrev - 25/02/2008 - '        X.CPF, X.CGC, X.FONTE, X.CODNATUREZA, '                            + #13 +
                //CPrev - 25/02/2008 - Início
        sSqlDados.Add('        DECODE(LENGTH(RTRIM(LTRIM(X.CPF))), 11, RTRIM(LTRIM(X.CPF)), ''00000000000'') AS CPF, ' + #13 +
          '        X.CGC, X.FONTE,  ' + #13 +
          'DECODE(X.CODNATUREZA,' + #13 +
          '       ''7431'',' + #13 +
          '       ''0561'',' + #13 +
          '       ''1889'',' + #13 +
          '       ''0561'',' + #13 +
          '       ''3556'',' + #13 +
          '       ''0561'',' + #13 +
          '       ''3579'',' + #13 +
          '       ''0561'',' + #13 +
          '       ''3223'',' + #13 +
          '       ''0561'',' + #13 +
          '       ''5565'',' + #13 +
          '       ''0561'',' + #13 +
          '       X.CODNATUREZA) AS CODNATUREZA,' + #13 +
          //CPrev - 25/02/2008 - Fim

        // Paulo Nobre SOL 268555 PPM 1262100
        // ' X.IDENDERECO, ' + //CPrev - 22/01/2008
//          '(SELECT MAX(EP.IDENDERECO)                                ' + #13 + //Everson Cunha - SIG78304 - Tibero
          '(SELECT /*+ USE_HASH(PES EP) FULL(EP) */ MAX(EP.IDENDERECO) ' + #13 + //Everson Cunha - SIG78304 - Tibero
          '         FROM   ENDPESS EP, PESSOA PES                                  ' + #13 +
          '         WHERE  PES.IDPESSOA = EP.IDPESSOA                              ' + #13 +
          '         AND    PES.NUMDOCUMENTO = X.CPF) IDENDERECO,       ' + #13 +
          //
          'DECODE(X.CODNATUREZA,' + #13 +
          '       ''7431'',' + #13 +
          '       ''RENDIMENTO DO TRABALHO ASSALARIADO NO PAÍS'',' + #13 +
          '       ''1889'',' + #13 +
          '       ''RENDIMENTO DO TRABALHO ASSALARIADO NO PAÍS'',' + #13 +
          '       ''3556'',' + #13 +
          '       ''RENDIMENTO DO TRABALHO ASSALARIADO NO PAÍS'',' + #13 +
          '       ''3579'',' + #13 +
          '       ''RENDIMENTO DO TRABALHO ASSALARIADO NO PAÍS'',' + #13 +
          '       ''3223'',' + #13 +
          '       ''RENDIMENTO DO TRABALHO ASSALARIADO NO PAÍS'',' + #13 +
          '       ''5565'',' + #13 +
          '       ''RENDIMENTO DO TRABALHO ASSALARIADO NO PAÍS'',' + #13 +
          '       UPPER(X.DESCRICAO)) AS DESCRICAO,' + #13 +
          '        UPPER(TRIM(X.RAZAOSOCIAL)) AS RAZAOSOCIAL, ENDERECO.ENDEREO, ' + #13 + // Paulo Nobre SOL 269130 PPM 1284502  // Andre Imakawa - SIG 29212
          '        ENDERECO.ENDEREO, ENDERECO.NUMERO, ENDERECO.COMPLEMENTO, ENDERECO.BAIRRO, ENDERECO.NOME, ENDERECO.CEP, ENDERECO.UF, ENDERECO.NUMSEED ');   // Andre Imakawa - SIG 29212
      End
    Else
      Begin
        sSqlDados.Add('        /*B.MATRICULA,*/ ' + #13 +

          //CPrev - 25/02/2008 - '        X.CPF, X.CGC, X.FONTE, X.CODNATUREZA, '                            + #13 +
          //CPrev - 25/02/2008 - Início
          '        DECODE(LENGTH(RTRIM(LTRIM(X.CPF))), 11, RTRIM(LTRIM(X.CPF)), ''00000000000'') AS CPF, ' + #13 +
          '        X.CGC, X.FONTE, X.CODNATUREZA, ' + #13 +
          //CPrev - 25/02/2008 - Fim

          // Paulo Nobre SOL 268555 PPM 1262100
    //          ' X.IDENDERECO, ' + //CPrev - 22/01/2008
//          '(SELECT MAX(EP.IDENDERECO)                                            ' + #13 +  //Everson Cunha - SIG78304 - Tibero
          '(SELECT /*+ USE_HASH(PES EP) FULL(EP) */ MAX(EP.IDENDERECO)             ' + #13 +  //Everson Cunha - SIG78304 - Tibero
          '         FROM   ENDPESS EP, PESSOA PES                                  ' + #13 +

          '         WHERE  PES.IDPESSOA = EP.IDPESSOA                              ' + #13 +
          //'         AND    PES.NUMDOCUMENTO = X.CPF) IDENDERECO,       '  + #13 +;  //Darivaldo Alencar SIG66063
          '         AND    PES.NUMDOCUMENTO = X.CPF) IDENDERECO,       ');            //Darivaldo Alencar SIG66063

          //William Moreira da Silva - SIG 24855/26744
          //'        UPPER(X.DESCRICAO) AS DESCRICAO, UPPER(TRIM(X.RAZAOSOCIAL)) AS RAZAOSOCIAL, X.ENDEREO, ' + #13 + // Paulo Nobre SOL 269130 PPM 1284502
          //'        X.NUMERO, X.COMPLEMENTO, X.BAIRRO, X.NOME, X.CEP, X.UF, X.NUMSEED ');

          //Luiz Carlos - SIG64274 - Inicio
          sSqlDados.Add(' UPPER(X.DESCRICAO) AS DESCRICAO, UPPER(TRIM(X.RAZAOSOCIAL)) AS RAZAOSOCIAL ');
          //if pbEliminaZerados then                        //Darivaldo Alencar SIG66013
          if (pbEliminaZerados) or (piSistema <> 1)  then   //Darivaldo Alencar SIG66013 
          begin
              sSqlDados.Add(', UPPER(ENDERECO.ENDEREO) AS ENDEREO, ' + #13 +
                            ' ENDERECO.NUMERO, UPPER(ENDERECO.COMPLEMENTO) AS COMPLEMENTO, ENDERECO.BAIRRO, UPPER(ENDERECO.NOME) AS NOME, ENDERECO.CEP, UPPER(ENDERECO.UF) AS UF, ENDERECO.NUMSEED ');
          end;
          //Luiz Carlos - SIG64274 - Fim
          //William Moreira da Silva - SIG 24855/26744
      End;
    //SOL 248939 PPM 997373
    //CPrev - 27304 - Fim

    //CPrev - 29/01/2008 - Início
    If pbPensaoSeparada Then
      sSqlDados.Add(' ,X.FLGPENSAOALIM ');
    //CPrev - 29/01/2008 - Fim

    If iTipoCliente = 19991 Then
      //Vinicius Maciel SOL 170987 KTN 152871
      //Alteração dos campos abaixo para adicionar a debitação dos lançamentos de RRA
      //Marcio Sanches Spinosa SOL 207914 Kintana 2028712 - Inicio
     //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Inicio
      If (piSistema = 5) Then
        sSqlDados.Add('      ,CASE WHEN (X.CODNATUREZA in (''5565'', ''3579'')) THEN 0 else  (SUM(VLR3011) + SUM(VLR3012)) END AS  TOT301 ')
      Else
        sSqlDados.Add('      , (SUM(VLR3011) + SUM(VLR3012)) AS  TOT301 ' + #13);
    //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Fim
     //sSqlDados.Add('       , (SUM(VLR3011) + DECODE(SIGN(SUM(VLR3012) - (SUM(VLR6012) - SUM(VLR6052))),-1,0,(SUM(VLR3012) - (SUM(VLR6012) - SUM(VLR6052))))) AS  TOT301 ' + #13 +
     //Marcio Sanches Spinosa SOL 207914 Kintana 2028712 - Fim
    sSqlDados.Add('      , (SUM(VLR3021))                AS  TOT302 ' + #13 +
      '      , (SUM(VLR3031) + SUM(VLR3032)) AS  TOT303 ' + #13 +
      // '      , (SUM(VLR3041) + SUM(VLR3042)) AS  TOT304 ' + #13 +
      '       , (SUM(VLR3041) + DECODE(SIGN(SUM(VLR3042) /*- SUM(VLR6032)*/),-1,0,(SUM(VLR3042) /* - SUM(VLR6032)*/))) AS  TOT304 ' + #13 + //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
      '      , (SUM(VLR3051))                AS  TOT305 ' + #13 +
      '      , (SUM(VLR4011) + SUM(VLR4012)) AS  TOT401 ' + #13);

      // Andre Imakawa - SIG 122151 - Inicio
      //if pLayout2021 then                                              //edilaine WO18939
      if (pLayout2021) or ((pbPensao) and (psAno >= '2021')) then        //edilaine WO18939
            sSqlDados.Add(
            '      , (SUM(VLR4013) + SUM(VLR4014)) AS  TOT401_L2 ' + #13);
      // Andre Imakawa - SIG 122151 - Fim

      //'      , (SUM(VLR4021) + SUM(VLR4022)) AS  TOT402 ' + #13 +
      sSqlDados.Add(
      '       , (SUM(VLR4021) + DECODE(SIGN(SUM(VLR4022) /*- (SUM(VLR6042) - SUM(VLR6062))*/),-1,0,(SUM(VLR4022) /*- (SUM(VLR6042) - SUM(VLR6062))*/))) as TOT402 ' + #13 + //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
      '      , (SUM(VLR4031) + SUM(VLR4032)) AS  TOT403 ' + #13 +
      //                  '      , (SUM(VLR4042))   AS  TOT404 ' + #13 +
      '      , (SUM(VLR4042))  + (SUM(VLR4041)) AS  TOT404 ' + #13 +
      '      , (SUM(VLR4051))                AS  TOT405 ' + #13 +
      '      , (SUM(VLR4061))                AS  TOT406 ' + #13 +
      //'    , (SUM(VLR4071) + SUM(VLR4072)) AS  TOT407 ' + #13 +
      //Marcio Sanches Spinosa SOL 207914 Kintana 2028712 - Inicio
      '      , (SUM(VLR4071) + DECODE(SIGN(SUM(VLR4072) /*- SUM(VLR6062)*/),-1,0,(SUM(VLR4072) /*- SUM(VLR6062)*/))) AS  TOT407 ' + #13); // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799
    //'      , (SUM(VLR4071) + DECODE(SIGN(SUM(VLR4072) - SUM(VLR6062)),-1,0,(SUM(VLR4072) - SUM(VLR6062)))) AS  TOT407 ' + #13 );  // Edilaine - SOL 199978 / KTN 1925538
    //Marcio Sanches Spinosa SOL 207914 Kintana 2028712 - Fim
    //Bruno Bastos - SOL: 111231 - Kintana: 513489 - '      , (SUM(VLR5011) + SUM(VLR5012)) AS  TOT501 ' + #13 +
    //'      , DECODE(SIGN(SUM(VLR5011_SENEG) + SUM(VLR5012_SENEG)), -1, 0, SUM(VLR5011_SENEG) + SUM(VLR5012_SENEG)) AS  TOT501 ' + #13 + //Bruno Bastos - SOL: 111231 - Kintana: 513489

    // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
    If (piSistema = 1) and
       (StrToInt(psAno) >= 2015) and // Andre Imakawa - SIG 133477
       (not pLayoutResgate) Then   //edilaine SIG129805
      Begin
        sSqlDados.Add(' ,SUM(VLR4081) AS TOT408');
      End;

    // Andre Imakawa - SIG 122151 - Inicio
    If (piSistema = 1) Then
    Begin
      //if pLayout2021 then                                         //edilaine 18939
      if (pLayout2021) or ((pbPensao) and (psAno >= '2021')) then   //edilaine 18939
        sSqlDados.Add( ' ,SUM(VLR4101) AS TOT410 ' + #13);
    End;
    // Andre Imakawa - SIG 122151 - Fim

    // Felipe Santos SOL 199572  Kintana 1948484
    //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Inicio
    If (piSistema = 5) Then
      sSqlDados.Add('    ,CASE WHEN (X.CODNATUREZA in (''5565'', ''3579'')) THEN ' +
        ' (SUM(VLR3011) + SUM(VLR3012)) + DECODE(SIGN(SUM(VLR5012_SENEG)), -1, DECODE(SIGN(SUM( VLR5011_SENEG + VLR5012_SENEG)), -1, 0, SUM( VLR5011_SENEG)) , ' + #13 +
        //Marcio Sanches Spinosa SOL 247950 PPM 659247 - Inicio
  //                                  '     DECODE(SIGN(SUM( VLR5011_SENEG)),-1, 0, SUM( VLR5011_SENEG))) + DECODE(SIGN(DECODE(SIGN(SUM(VLR5011_SENEG)), -1, ' + #13 +
        '     DECODE(SIGN(SUM( VLR5011_SENEG)),-1, SUM( VLR5011_SENEG), SUM( VLR5011_SENEG))) + DECODE(SIGN(DECODE(SIGN(SUM(VLR5011_SENEG)), -1, ' + #13 +
        //Marcio Sanches Spinosa SOL 247950 PPM 659247 - Fim
        '     DECODE(SIGN(SUM(VLR5012_SENEG+VLR5011_SENEG)), -1, 0, SUM( VLR5012_SENEG+VLR5011_SENEG)), ' + #13 +
        '     DECODE(SIGN(SUM( VLR5012_SENEG)), -1, 0, SUM( VLR5012_SENEG))) /*- SUM(VLR6052)*/),-1,0, ' + #13 + //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
        '     (DECODE(SIGN(SUM(VLR5011_SENEG)), -1, ' + #13 +
        '     DECODE(SIGN(SUM(VLR5012_SENEG+VLR5011_SENEG)), -1, 0, SUM( VLR5012_SENEG+VLR5011_SENEG)), ' + #13 +
        '     DECODE(SIGN(SUM( VLR5012_SENEG)), -1, 0, SUM( VLR5012_SENEG))) /*- SUM(VLR6052)*/)) END AS  TOT501 ' + #13 //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
        )

    Else
      sSqlDados.Add('    , DECODE(SIGN(SUM(VLR5012_SENEG)), -1, DECODE(SIGN(SUM( VLR5011_SENEG + VLR5012_SENEG)), -1, 0, SUM( VLR5011_SENEG)) , ' + #13 +
        '     DECODE(SIGN(SUM( VLR5011_SENEG)),-1, 0, SUM( VLR5011_SENEG))) + DECODE(SIGN(DECODE(SIGN(SUM(VLR5011_SENEG)), -1, ' + #13 +
        '     DECODE(SIGN(SUM(VLR5012_SENEG+VLR5011_SENEG)), -1, 0, SUM( VLR5012_SENEG+VLR5011_SENEG)), ' + #13 +
        '     DECODE(SIGN(SUM( VLR5012_SENEG)), -1, 0, SUM( VLR5012_SENEG))) /*- SUM(VLR6052)*/),-1,0, ' + #13 + //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
        '     (DECODE(SIGN(SUM(VLR5011_SENEG)), -1, ' + #13 +
        '     DECODE(SIGN(SUM(VLR5012_SENEG+VLR5011_SENEG)), -1, 0, SUM( VLR5012_SENEG+VLR5011_SENEG)), ' + #13 +
        '     DECODE(SIGN(SUM( VLR5012_SENEG)), -1, 0, SUM( VLR5012_SENEG))) /*- SUM(VLR6052)*/)) AS  TOT501 ' + #13 //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
        );
    //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Fim

    {
      sSqlDados.Add('      , DECODE(SIGN(SUM(VLR5011_SENEG) + DECODE(SIGN(SUM(VLR5012_SENEG)- SUM(VLR6052)),-1,0,(SUM(VLR5012_SENEG)- SUM(VLR6052)))), -1, 0, ' );

    //Vander - SOL: 190550 - Kintana: 1802481
    if (AIdPessoa <> Nil) Then
       sSqlDados.Add(' SUM(VLR5011_SENEG) + DECODE(SIGN(SUM(VLR5012_SENEG)- SUM(VLR6052)),-1,0,(SUM(VLR5012_SENEG)- SUM(VLR6052))))  AS  TOT501 ' + #13 )
    Else
    //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
    IF NOT (bAgrupaCPF) then
      sSqlDados.Add(' SUM(VLR5011_SENEG) + DECODE(SIGN(SUM(VLR5012_SENEG)- SUM(VLR6052)),-1,0,(SUM(VLR5012_SENEG)- SUM(VLR6052))))  AS  TOT501 ' + #13 )
    else
      sSqlDados.Add(' SUM(VLR5011_SENEG) - SUM(VLR6011) + DECODE(SIGN(SUM(VLR5012_SENEG)- SUM(VLR6052)),-1,0,(SUM(VLR5012_SENEG)- SUM(VLR6052))))  AS  TOT501 ' + #13 );
    //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim

     }
    // Felipe Santos SOL 199572  Kintana 1948484 - FIM

    // Felipe A. Santos - SOL 244545.16839 PPM 624515 - início
    If (piSistema = 1) Then
      Begin
        sSqlDados.Add(', (SUM(VLR5021) + SUM(VLR5022)) AS TOT502');
        //sSqlDados.Add(', (SUM(VLR5031)) AS TOT503 '); // Paulo Nobre - SOL257831/18009 PPM 1207646 - início // Andre Imakawa - SIG 50147
        sSqlDados.Add(', DECODE(SIGN(SUM(VLR5031)), -1, 0, SUM(VLR5031)) AS TOT503 '); // Andre Imakawa - SIG 50147
        //sSqlDados.Add(', (SUM(VLR5031)+ SUM(VLR5032)) AS TOT503 ');  // SOL 268002 PPM 1245182
      End;
    // Felipe A. Santos - SOL 244545.16839 PPM 624515 - fim

    sSqlDados.Add('      , (SUM(VLR6011))                AS  TOT601 ' + #13 +
      //                  '      , (SUM(VLR6021))                AS  TOT602 ' + #13 +
      '      , (SUM(VLR7011))                AS  TOT701 ' + #13 +
      '      , (SUM(VLR9011) + SUM(VLR9012)) AS  TOT901 ');
    //Vinicius Maciel SOL 170987 KTN 152871 - FIM
    // Pegar os codigos do informe para incluir na query
    CdsLocalCodInforme.First;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        {//Bruno Bastos - SOL: 111231 Kintana: 513489
        sSqlDados.Add('        , SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') ' +
                      'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '' );
        }

        // Felipe A. Santos - SOL 268577 PPM 1263035 - início
        If (piSistema = 0) Then
          Begin
            If (CdsLocalCodInforme.FieldByName('CODINFORME').AsString = '501') Then
              Begin
                sSqlDados.Add(' ,SUM(VLR501_SENEG) AS VLR501');
                CdsLocalCodInforme.Next;
                Continue;
              End;
          End;
        // Felipe A. Santos - SOL 268577 PPM 1263035 fim

        //Bruno Bastos - SOL: 111231 Kintana: 513489 - Início
        If (cLinha13 + '1' = CdsLocalCodInforme.fieldByname('CODINFORME').AsString) And (piSistema = 1) Then
          Begin
            sSqlDados.Add('        , DECODE(SIGN(SUM(VLR5012_SENEG)), -1, DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG');

            //Vander - SOL: 190550 - Kintana: 1802481
            If (AIdPessoa <> Nil) Then
              sSqlDados.Add('+VLR5012_SENEG)), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG)), DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + ')), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + '))) ')
            Else
              //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Inicio
              If Not (bAgrupaCPF) Then
                sSqlDados.Add('+VLR5012_SENEG)), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG)), DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + ')), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + '))) ')
              Else
                sSqlDados.Add('+VLR5012_SENEG)), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG)), DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + ')), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + ') - SUM(VLR6011))) ');
            //Marcio Sanches Spinosa SOL: 188606 Kintana: 1777834 - Fim

            sSqlDados.Add('AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '');
          End
        Else
          If (cLinha13 + '2' = CdsLocalCodInforme.fieldByname('CODINFORME').AsString) And (piSistema = 1) Then
            //Vinicius Maciel SOL 170987 KTN 152871
              //sSqlDados.Add('        , DECODE(SIGN(SUM(VLR5011_SENEG)), -1, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString +
              //                       '+VLR5011_SENEG), SUM( VLR' +CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ')) '+
              //              'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '' )
            sSqlDados.Add('        , DECODE(SIGN(DECODE(SIGN(SUM(VLR5011_SENEG)), -1, DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' +
              '+VLR5011_SENEG)), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + '+VLR5011_SENEG)), DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + ')), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + '))) ' +
              '/*- SUM(VLR6052)*/),-1,0,(DECODE(SIGN(SUM(VLR5011_SENEG)), -1, DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
              '+VLR5011_SENEG)), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + '+VLR5011_SENEG)), DECODE(SIGN(SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + ')), -1, 0, SUM( VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' + '))) ' +
              '/*- SUM(VLR6052)*/) ) AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '') //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
          Else
            Begin
              If Not ((CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '3012') Or
                (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '3042') Or
                //(CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '5031') Or // Andre Imakawa - SIG 50147     // Andre Imakawa - SIG 50532
                (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '4022')) {or} // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799
              And Not ((CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '5031') And (piSistema = 1)) // Andre Imakawa - SIG 50532
              And Not ((CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '5011') And (piSistema = 5)) Then //Marcio Sanches Spinosa SOL 247950 PPM 659247
                //                         (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '4072')) then       // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799
                sSqlDados.Add('        , SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') ' +
                  'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '')
                  //Marcio Sanches Spinosa SOL 247950 PPM 659247 - Inicio
              Else If (piSistema = 5) And (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '5011') Then
                Begin
                  sSqlDados.Add('        , SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ')  + DECODE(SIGN(SUM(VLR5011_SENEG)),-1,SUM(VLR5011_SENEG),0) ' +
                    'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '')

                End
                  //Marcio Sanches Spinosa SOL 247950 PPM 659247 - Fim
              // Andre Imakawa - SIG 50147 - Inicio
              // Tratamento para não permitir valores negativos
              Else If (piSistema = 1) And (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '5031') Then
                Begin
                  sSqlDados.Add('        , DECODE(SIGN(SUM(VLR'+ CdsLocalCodInforme.fieldByname('CODINFORME').AsString +' )),-1,0,SUM(VLR'+ CdsLocalCodInforme.fieldByname('CODINFORME').AsString +')) ' +
                    'AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '')

                End
              // Andre Imakawa - SIG 50147 - Fim
              Else
                Begin
                  sAux := '        , DECODE(SIGN(SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') ';
                  If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '3012') Then
                    sAux := sAux + '/* - (SUM(VLR6012) - SUM(VLR6052))*/),-1,0,(SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') /*- (SUM(VLR6012) - SUM(VLR6052))*/)'; //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
                  If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '3042') Then
                    sAux := sAux + ' /* - SUM(VLR6032)*/),-1,0,(SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') /*- SUM(VLR6032)*/)'; //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
                  If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '4022') Then
                    sAux := sAux + '/* - (SUM(VLR6042) - SUM(VLR6062))*/),-1,0,(SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ') /* - (SUM(VLR6042) - SUM(VLR6062))*/)'; //Marcio Sanches Spinosa SOL 207914 Kintana 2028712
                  //                        if (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '4072') then              // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799
                  //                        sAux := sAux + '- SUM(VLR6062)),-1,0,(SUM(VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString+ ') - SUM(VLR6062))';    // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799
                  sAux := sAux + ') AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ';
                  sSqlDados.Add(sAux);
                End;
            End;
        //Vinicius Maciel SOL 170987 KTN 152871 - Fim
       //Bruno Bastos - SOL: 111231 Kintana: 513489 - Fim

       //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
        If piSistema = 0 Then
          Begin
            sSqlDados.Add(',0 AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_2');
          End;
        //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim

     // Felipe A. Santos SOL 245841 PPM 629389 - início
        If ((piSistema = 0) And (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '502')) Then
          Begin
            sSqlDados.Add('   ,SUM(VLR503) AS VLR503 ' + #13 +
              '   ,0 AS VLR503_2 ' + #13);
          End;
        // Felipe A. Santos SOL 245841  PPM 629389 - fim

        // Felipe A. Santos - SOL 244545.16839 PPM 624515 - início
        If ((CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '5012') And (piSistema = 1)) Then
          Begin
            sSqlDados.Add(', SUM(VLR5021) AS VLR5021 ' + #13 +
              ', SUM(VLR5022) AS VLR5022 ' + #13);
          End;
        // Felipe A. Santos - SOL 244545.16839 PPM 624515 - fim

        CdsLocalCodInforme.Next;
      End;

    // Verifica se tem Deposito Judicial
    sSqlDados.Add('        , NVL( (SELECT DISTINCT ''TRUE'' ' + #13 +
      '                FROM PROCJUD PJ ' + #13 +
      '                WHERE (PJ.IDPESSOA = IDPESSOA) ' + #13 +
      '                  AND (DATAINICIO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ', ''DD/MM/YYYY'')' + #13 +
      '                                      AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ', ''DD/MM/YYYY''))) , ''FALSE'') AS PROCESSO ');

    // Verifica se tem Pensionista
  //Marcio Sanches Spinosa SOL 247267/16926 PPM 652768 - Inicio
  //    sSqlDados.Add('        , NVL((SELECT DISTINCT ''TRUE'' FROM RUBRICAINDIV RI WHERE RI.IDPESSOA = IDPESSOA) , ''FALSE'') AS PENSIONISTA ');
    sSqlDados.Add('        , (''TRUE'') as  PENSIONISTA ');
    //Marcio Sanches Spinosa SOL 247267/16926 PPM 652768 - Fim
        //Vinicius Maciel SOL 170987 KTN 1528710
        //Verifica a quantidade de meses

         // Thiago Melo SOL 223141.15622 Kintana 2057248
         //sSqlDados.Add(' ,C.QTDMESES ');
    // Andre Imakawa - SIG 59560 - Inicio
    //sSqlDados.Add(' ,COALESCE(C.QTDMESES,0) AS QTDMESES ');

    If (piModelo = 155) Then
      sSqlDados.Add( ' ,CASE' + #13#10 +
                     '         WHEN (SUM(VLR6012) + SUM(VLR6022) + SUM(VLR6032) + SUM(VLR6042)) > 0 THEN' + #13#10 +
                     '          COALESCE(C.QTDMESES, 0)' + #13#10 +
                     '         ELSE' + #13#10 +
                     '          0' + #13#10 +
                     '       END QTDMESES')
    Else
      sSqlDados.Add(' ,COALESCE(C.QTDMESES,0) AS QTDMESES ');
    // Andre Imakawa - SIG 59560 - Fim
    // Thiago Melo SOL 223141.15622 Kintana 2057248

   //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
    sSqlDados.Add('FROM');

    If pbPensao Then
      Begin
        sSqlDados.Add('     PESSOA PES, ');
             if not (pLayout2019Pensao) then //Rafael SIG 96222
        sSqlDados.Add('     PESSOA ALI, ');

        // CPrev - 27302 - Inicio
        // sSqlDados.Add('     RUBRICAINDIV RUB, ');

        If pfIDPessoa <> -1999 Then
          Begin
            sSqlDados.Add('     (SELECT DISTINCT R.IDPESSOA, P.NUMDOCUMENTO ');
            sSqlDados.Add('      FROM RUBRICAINDIV R JOIN PESSOA P ON P.IDPESSOA = R.IDFAVORECIDO');
            //           sSqlDados.Add('      WHERE (P.NUMDOCUMENTO in (select numdocumento from pessoa where idpessoa ' + _SQL_IDPESSOA + '))');
            SetIdPessoa(sSqlDados, 'WHERE (P.NUMDOCUMENTO in (select numdocumento from pessoa where idpessoa ' + _SQL_IDPESSOA + '))');
            //sSqlDados.Add('                                from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + ')) ) RUB,' );

            //Vander - SOL: 190550 - Kintana: 1802481
    //        SetIdPessoa(sSqlDados, '                                from pessoa where idpessoa ' + _SQL_IDPESSOA + '))) RUB,');
            //Marcio Sanches Spinosa SOL 203200 Kintana 1963444                                                             SOL 204397 KTN 1980838 Otacilio
            SetIdPessoa(sSqlDados, '     AND (R.FLGDESATIVADO = 0 OR R.DATAFINAL IS NULL) ) RUB,');

          End
        Else
          Begin
            If ((pbUsaLista) And (piIdListaUsuario > 0)) Then
              Begin
                sSqlDados.Add('     (SELECT DISTINCT R.IDPESSOA, R.IDFAVORECIDO, P.NUMDOCUMENTO');
                sSqlDados.Add('      FROM RUBRICAINDIV R JOIN PESSOA P ON P.IDPESSOA = R.IDFAVORECIDO');
                sSqlDados.Add('      WHERE P.NUMDOCUMENTO IN (SELECT NUMDOCUMENTO FROM PESSOA');
                sSqlDados.Add('                               WHERE IDPESSOA IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD');
                sSqlDados.Add('                                                  WHERE LD.IDLISTA = ' + QuotedStr(IntToStr(piIdListaUsuario)) + '))) RUB,' + #13);
              End
            Else
              Begin
                sSqlDados.Add('     (SELECT DISTINCT R.IDPESSOA, R.IDFAVORECIDO, P.NUMDOCUMENTO ');
                //William Moreira da Silva - SIG 39491
                //sSqlDados.Add('      FROM RUBRICAINDIV R JOIN PESSOA P ON P.IDPESSOA = R.IDFAVORECIDO) RUB, ');
                sSqlDados.Add('      FROM RUBRICAINDIV R JOIN PESSOA P ON P.IDPESSOA = R.IDFAVORECIDO ');
                sSqlDados.Add('      WHERE (R.FLGDESATIVADO = 0 OR R.DATAFINAL IS NULL) ) RUB,  ');
                //William Moreira da Silva - SIG 39491
              End;
          End;

        sSqlDados.Add('     ENDPESS EN, ');
        sSqlDados.Add('     ESTADO ES, ');
        sSqlDados.Add('     CIDADES C, ');
      End;

    //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
    //    sSqlDados.Add('     ( SELECT /*+INDEX(XB) */ ' + QuotedStr( sNomeResp ) + ' AS NOMERESP, '            + #13 +
    sSqlDados.Add('     ( SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + #13 +
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
      '              ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + #13 +
      '              ' + QuotedStr(psAno) + ' AS ANO, ' + #13 +
      '              ' + QuotedStr(IntToStr(strtoint(psAno)+1)) + ' AS ANO_EXERCICIO, ' + #13 +    // Andre Imakawa - SIG 122151
      '              TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' + #13 +
      '              TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' + #13 +
      //'              PT.IDPESSOA AS IDPESSJUR, '                                              + #13 + // Edilaine - SOL 197664 / KTN 1894007
      '              RE.IDPATRO AS IDPESSJUR, ' + #13 + // Edilaine - SOL 197664 / KTN 1894007
      '              NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, ' + #13 +
      '              P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' + #13 +

      '              P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13 + //CPrev - Pend. 27379 - 25/02/2008
      //CPrev - Pend. 27379 - Início
      //CPrev - Pend. 27379 - 25/02/2008 - '              DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, RTRIM(LTRIM(P.NUMDOCUMENTO)), ''00000000000'') AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13 +
      //CPrev - Pend. 27379 - Fim

      //William Moreira da Silva - SIG 24855/26744
//      '              NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, ');                                                          //Everson Cunha - SIG81200
      '  decode(NAT.CODNATUREZA, ''0473'', ''0561'', ''9466'', ''0561'', NAT.CODNATUREZA) CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, ');   //Everson Cunha - SIG81200
      //'              NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, EN.IDENDERECO, ' + #13 +
      //'              EN.LOGRADOURO AS ENDEREO, ' + #13 +
      //'              EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' + #13 +
      //'              ES.CODESTADO AS UF, C.NUMSEED, ');

      //William Moreira da Silva - SIG 24855/26744


    // Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    If piSistema = 0 Then
      ssqlDados.Add(' EPF.LOGRADOURO  AS ENDERECO_FUND, ' +
        ' EPF.NUMERO      AS NUMERO_FUND, ' +
        ' EPF.COMPLEMENTO AS COMPLEMENTO_FUND, ' +
        ' EPF.BAIRRO      AS BAIRRO_FUND, ' +
        ' CDF.NOME        AS CIDADE_FUND, ' +
        ' EPF.CEP         AS CEP_FUND, ' +
        ' ESF.CODESTADO   AS UF_FUND, ' +
        ' CDF.NUMSEED     AS NUMSEED_FUND, ' +
        ' ''(''||TRIM(TEP.DDD)||'')''||SUBSTR(TRIM(TEP.NUMERO), 1, 4)||''-''||SUBSTR(TRIM(TEP.NUMERO), 5, 4) AS TELEFONE_FUND, ' +
        ' CCT.NOME        AS LOTACAO, ');
    // Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim

    {// Bruno Bastos - SOL: 111231 Kintana: 513489
    If iModeloFundacao <> 2  then
    Begin
      cLinha13      := '501';
      cLinhaContrib := '303';
      cLinhaRend    := '301';
    End
    Else
    Begin
      cLinha13      := '51';
      cLinhaContrib := '3';
      cLinhaRend    := '1';
    End;
    }

    iCodInforme := 0;
    CdsLocalCodInforme.First;
    While Not CdsLocalCodInforme.Eof Do
      Begin
        If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
          (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
          Begin
            //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Inicio
            If (piSistema = 5) Then
              Begin
                sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0,' +
                  '                           SUM(DECODE(RE.CODINFORME,3011, VLR, 0 ) + ' +
                  '                               DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0))) + ');
                sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');
              End
            Else
              Begin
                // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Inicio
                If cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '5011' Then
                  Begin
                    sSqlDados.Add(' CASE WHEN NOT RE.IDINFORME IN (140, 194, 195, 197) ');

                    //Cássio Rovaroto - SIG nº 73545 - Início
                    if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
//                      sSqlDados.Add('   THEN CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,5011, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,5011, VLR, 0 ))) END ')            //Everson Cunha - SIG81200
                      sSqlDados.Add('   THEN CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,5011, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,5011, VLR, 0 ))) END ') //Everson Cunha - SIG81200
                    else
                    //Cássio Rovaroto - SIG nº 73545 - Fim
                    sSqlDados.Add('   THEN DECODE(SIGN( SUM(DECODE(RE.CODINFORME,5011, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,5011, VLR, 0 ))) ');

                    sSqlDados.Add('   ELSE 0         ');
                    sSqlDados.Add(' END AS VLR5011 , ');
                  End
                    // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Fim
                Else
                  //Cássio Rovaroto - SIG n 73545 - Início
                  if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
                  begin
                    if (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '3021') or (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '3022') or
                       (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '5031') or (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '5032') or
                       (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '6011') then
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                    else
//                      sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +             //Everson Cunha - SIG81200
                      sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +  //Everson Cunha - SIG81200
                                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) END AS VLR' +
                                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                   end
                  else
                  //Cássio Rovaroto - SIG nº 73545 - Fim
                  sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');
              End;

            //Marcio Sanches Spinosa SOL 217765 KINTANA 2059157 - Fim
            // Bruno Bastos - SOL: 111231 - Kintana: 513489

                    // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Inicio
            If 'VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG' = 'VLR5011_SENEG' Then
              Begin
                sSqlDados.Add(' CASE WHEN NOT RE.IDINFORME IN (140, 194, 195, 197) ');
                //Cássio Rovaroto - SIG nº 73454 - Início
                if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG122151
//                  sSqlDados.Add(' THEN CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE SUM(DECODE(RE.CODINFORME,5011, VLRREAL, 0 )) END ')//Everson Cunha - SIG81200
                  sSqlDados.Add(' THEN CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE SUM(DECODE(RE.CODINFORME,5011, VLRREAL, 0 )) END ')//Everson Cunha - SIG81200
                else
                //Cássio Rovaroto - SIG nº 73454 - Fim
                sSqlDados.Add('   THEN SUM(DECODE(RE.CODINFORME,5011, VLRREAL, 0 )) ');

                sSqlDados.Add('   ELSE 0         ');
                sSqlDados.Add(' END AS VLR5011_SENEG , ');
              End
            Else
              //Cássio Rovaroto - SIG nº 73545 - Início
              if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
//                sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 )) END AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG ,')            //Everson Cunha - SIG81200
                sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 )) END AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG ,') //Everson Cunha - SIG81200
              else
              //Cássio Rovaroto - SIG nº 73545 - Fim
              sSqlDados.Add(' SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 )) AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG ,');
            // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Fim
          End
        Else
          Begin
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
              Begin
                //Cássio Rovaroto - SIG nº 73545 - Início
                if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
//                  sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +            //Everson Cunha - SIG81200
                  sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' + //Everson Cunha - SIG81200
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) END AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                else
                //Cássio Rovaroto - SIG nº 73545 - Fim
                sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
              End
            Else
              Begin
                If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
                  Begin
                    // Edilaine - SOL 202259 / KTN 2042903
                    If CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '3011' Then
                      //Wylliam Leite da Silva - Sol: 250062 PPM:733801 - Inicio
                      {sSqlDados.Add('              DECODE(SIGN( SUM(DECODE(RE.CODINFORME,'+CdsLocalCodInforme.fieldByname('CODINFORME').AsString+', VLRREAL, 0 ))),-1,0,'+
                                    '                           SUM(DECODE(RE.CODINFORME,'+CdsLocalCodInforme.fieldByname('CODINFORME').AsString+', VLR, 0 ) + '+
                                    '                               DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0))) AS VLR' +
                                    CdsLocalCodInforme.fieldByname('CODINFORME').AsString+' ,' )}
                      // Wylliam Leite da Silva - Sol: 250062 PPM:733801 - Fim

                      //Cássio Rovaroto - SIG nº 73545 - Início
                      if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
                      begin
//                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE ABS((DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))),-1,' +            //Everson Cunha - SIG81200
                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE ABS((DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))),-1,' + //Everson Cunha - SIG81200
                        '   ((SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))) + DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3011, VLR, 0 ) + DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0)))),' +
                        '   DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3011, VLR, 0 ) + DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0)))' +
                        ' )) ) END AS VLR3011,')
                      end
                      //Cássio Rovaroto - SIG nº 73545 - Fim
                      //SIG 85183.92415 - início
                      else if (pLayout2019Pensao) and (piSistema = 1) then
                        begin
                        sSqlDados.Add('ABS((DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))),-1,' +
                          ' ((SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))) + DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0, ' +
                          ' SUM(DECODE(RE.IDINFORME, 161, VLR, 0) + ' +
                          ' DECODE(RE.CODINFORME,3011, VLR, 0 ) + DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0)))),' +
                          ' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0, ' +
                          ' SUM(DECODE(RE.IDINFORME, 161, VLR, 0) + ' +
                          ' DECODE(RE.CODINFORME,3011, VLR, 0 ) + DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0)))' +
                          ' )) ) AS VLR3011,')
                        end
                      //SIG 85183.92415 - fim
                      else
                        begin
                          sSqlDados.Add('ABS((DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))),-1,' +
                          '   ((SUM(DECODE(RE.CODINFORME,3021, VLRPURO, 0 ))) + DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3011, VLR, 0 ) + DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0)))),' +
                          '   DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3011, VLRREAL, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3011, VLR, 0 ) + DECODE(SIGN(DECODE(RE.CODINFORME, 3021, VLRREAL, 0)), 1, VLRREAL, 0)))' +
                          ' )) ) AS VLR3011,')
                        end
                        //Wylliam Leite da Silva - Sol: 250062 PPM:733801 - Fim

                    Else // Edilaine - SOL 202259 / KTN 2042903 - fim
                      //Cássio Rovaroto - SIG nº 73545 - Início
                      if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
//                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE  DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,0,0,SUM(DECODE(RE.CODINFORME,' + // Edilaine Ferraresi / Marcio Sanches Spinosa SOL 216973 KINTANA 2046352             //Everson Cunha - SIG81200
//                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE  DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,0,0,SUM(DECODE(RE.CODINFORME,' + // Edilaine Ferraresi / Marcio Sanches Spinosa SOL 216973 KINTANA 2046352  //Everson Cunha - SIG81200
                        //edilaine SIG113334 : inicio
                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 '+
                         ' WHEN RE.IDINFORME = 45 THEN  SUM(DECODE(RE.CODINFORME,3012, VLRPURO, 0)) ' +
                         ' ELSE  DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,0,0,SUM(DECODE(RE.CODINFORME,' + // Edilaine Ferraresi / Marcio Sanches Spinosa SOL 216973 KINTANA 2046352  //Everson Cunha - SIG81200
                        //edilaine SIG113334 : fim
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) END AS VLR' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                      else
                      //Cássio Rovaroto - SIG nº 73545 - Fim
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,0,0,SUM(DECODE(RE.CODINFORME,' + // Edilaine Ferraresi / Marcio Sanches Spinosa SOL 216973 KINTANA 2046352
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');
                  End
                Else
                  Begin
                    If CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '4072' Then // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799 INICIO
                      //Cássio Rovaroto - SIG nº 73545 - Início
                      if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
	//                        sSqlDados.Add(' DECODE(RE.CODNATUREZA, ''9466'', 0, DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +            //Everson Cunha - SIG81200
	                        sSqlDados.Add(' DECODE(RE.CODNATUREZA, ''9466'', 0, ''0473'', 0, DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' + //Everson Cunha - SIG81200
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) /*- SUM(DECODE(RE.CODINFORME, ''6062'', VLR, 0))*/))  AS VLR' + // Edilaine - SOL 199978 / KTN 1925538
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')
                      else
                        sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) /*- SUM(DECODE(RE.CODINFORME, ''6062'', VLR, 0))*/)  AS VLR' + // Edilaine - SOL 199978 / KTN 1925538
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')
                     //Cássio Rovaroto - SIG nº 73545 - Fim
                    Else If CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '6012' Then
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) + SUM(DECODE(RE.CODINFORME, ''6052'', VLR, 0)))  AS VLR' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')
                    Else If CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '6042' Then
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) + SUM(DECODE(RE.CODINFORME, ''6062'', VLR, 0)))  AS VLR' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')

// Paulo Nobre - SOL 257831/18009 PPM 1207646 - Inicio
//
                    Else If cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '3041' Then
                      //Cássio Rovaroto - SIG nº 73545 - Início
                      if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
//                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3041, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3041, VLR, 0 ))) ' +            //Everson Cunha - SIG81200
                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3041, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3041, VLR, 0 ))) ' + //Everson Cunha - SIG81200
                        ' + DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 69, DECODE(RE.CODINFORME,3021, VLRPURO, 0),0))),-1,0,SUM(DECODE(RE.IDINFORME, 69, DECODE(RE.CODINFORME,3021, VLR, 0 ),0))) END AS VLR3041,')
                      else
                      //Cássio Rovaroto - SIG nº 73545 - Fim
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,3041, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,3041, VLR, 0 ))) ' +
                        ' + DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 69, DECODE(RE.CODINFORME,3021, VLRPURO, 0),0))),-1,0,SUM(DECODE(RE.IDINFORME, 69, DECODE(RE.CODINFORME,3021, VLR, 0 ),0))) AS VLR3041,')

                      // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Inicio

                    Else If cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '4011' Then
                      Begin
                        //Cássio Rovaroto - SIG nº 73545 - Início
                        if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
                        begin
                          sSqlDados.Add(' CASE WHEN RE.IDINFORME <> 139 '); // Diferente de Resgate contribuição Funcef s/ dedução de IRRF (4011)
//                          sSqlDados.Add('   THEN DECODE(RE.CODNATUREZA, ''9466'', 0, DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4011, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,4011, VLR, 0 )))) ');            //Everson Cunha - SIG81200
                          sSqlDados.Add('   THEN DECODE(RE.CODNATUREZA, ''9466'', 0, ''0473'', 0, DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4011, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,4011, VLR, 0 )))) '); //Everson Cunha - SIG81200
                          sSqlDados.Add('   ELSE 0         ');
                          sSqlDados.Add(' END AS VLR4011 , ');
                        end
                        //SIG 85183.92415 - início
                        else if (pLayout2019Pensao) and (piSistema = 1) then
                        begin
                          sSqlDados.Add(' CASE WHEN RE.IDINFORME <> 139 ');
                          sSqlDados.Add('   THEN DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4011, VLRPURO, 0 ) + DECODE(RE.IDINFORME, 162, VLR, 0))),-1,0,SUM(DECODE(RE.CODINFORME,4011, VLR, 0 ) + DECODE(RE.IDINFORME, 162, VLR, 0))) ');
                          sSqlDados.Add('   ELSE 0         ');
                          sSqlDados.Add(' END AS VLR4011 , ');
                        end
                        //SIG 85183.92415 - fim
                        else
                        //Cássio Rovaroto - SIG nº 73545 - Fim
                        begin
                          sSqlDados.Add(' CASE WHEN RE.IDINFORME <> 139 '); // Diferente de Resgate contribuição Funcef s/ dedução de IRRF (4011)
                          sSqlDados.Add('   THEN DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4011, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,4011, VLR, 0 ))) ');
                          sSqlDados.Add('   ELSE 0         ');
                          sSqlDados.Add(' END AS VLR4011 , ');
                        end;
                      End
                        // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Fim

                    Else If (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '4081')
                         and (StrToInt(psAno) >= 2015) Then // Andre Imakawa - SIG 133477
                      //Cássio Rovaroto - SIG nº 73545 - Início



                       if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) then // Andre Imakawa - SIG 122151
  //                        sSqlDados.Add(' DECODE(RE.CODNATUREZA, ''9466'', 0, DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4081, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,4081, VLR, 0 ))) ' +            //Everson Cunha - SIG81200
                          sSqlDados.Add(' DECODE(RE.CODNATUREZA, ''9466'', 0, ''0473'', 0, DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4081, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,4081, VLR, 0 ))) ' + //Everson Cunha - SIG81200
                            ' + DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 139, DECODE(RE.CODINFORME,4011, VLRPURO, 0 ), 0))),-1,0,SUM(DECODE(RE.IDINFORME, 139, DECODE(RE.CODINFORME,4011, VLR, 0 ), 0)))) AS VLR4081,')
                        else
                        //Cássio Rovaroto - SIG nº 73545 - Fim
                          sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,4081, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,4081, VLR, 0 ))) ' +
                          ' + DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 139, DECODE(RE.CODINFORME,4011, VLRPURO, 0 ), 0))),-1,0,SUM(DECODE(RE.IDINFORME, 139, DECODE(RE.CODINFORME,4011, VLR, 0 ), 0))) AS VLR4081,')


                    Else If cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '5031' Then
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,5031, VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,5031, VLR, 0 ))) ' +
                        ' + DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 197, DECODE(RE.CODINFORME,5011, VLRPURO, 0 ), 0))),-1,0,SUM(DECODE(RE.IDINFORME, 197, DECODE(RE.CODINFORME,5011, VLR, 0 ), 0)))  ' +
                        ' + DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 194, DECODE(RE.CODINFORME,5011, VLRPURO, 0 ), 0))),-1,0,SUM(DECODE(RE.IDINFORME, 194, DECODE(RE.CODINFORME,5011, VLR, 0 ), 0)))  ' +
                        ' - DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 140, DECODE(RE.CODINFORME,5011, VLRPURO, 0 ) ,0))),-1,0,SUM(DECODE(RE.IDINFORME, 140, DECODE(RE.CODINFORME,5011, VLR, 0 ), 0)))  ' +
                        ' - DECODE(SIGN( SUM(DECODE(RE.IDINFORME, 195, DECODE(RE.CODINFORME,5011, VLRPURO, 0 ) ,0))),-1,0,SUM(DECODE(RE.IDINFORME, 195, DECODE(RE.CODINFORME,5011, VLR, 0 ), 0))) AS VLR5031, ')

                      // Paulo Nobre - SOL 257831/18009 PPM 1207646 - Fim
                    Else
                      //Cássio Rovaroto - SIG nº 73545 - Início
                      if ((pLayout2018) or (pLayout2019) or (pLayout2021)) and (piSistema = 1) and (cdsLocalCodInforme.FieldByName('CODINFORME').AsString <> '3021') then // Andre Imakawa - SIG 122151
//                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +            //Everson Cunha - SIG81200
                        sSqlDados.Add(' CASE WHEN RE.CODNATUREZA IN (''9466'', ''0473'') THEN 0 ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' + //Everson Cunha - SIG81200
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) end AS VLR' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')
                      else
                      //Cássio Rovaroto - SIG nº 73545 - Fim
                      //Cássio Rovaroto - SIG nº 98173 - Início
                        if (piSistema = 0) and (cdsLocalCodInforme.FieldByName('CODINFORME').AsString = '302') then
                        begin
                          sSqlDados.Add('CASE WHEN RE.IDINFORME = 5 THEN SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR * -1, 0)) ' +
                                        'ELSE DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0, ' +
                                        ' SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0)))END AS VLR' +
                                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');

                        end
                        else
                      //Cássio Rovaroto - SIG nº 98173 - Fim
                      sSqlDados.Add(' DECODE(SIGN( SUM(DECODE(RE.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(RE.CODINFORME,' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                        CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');
                  End;
              End;
          End;
        CdsLocalCodInforme.Next;

        // Felipe A. Santos SOL 245841 PPM 629389 - início
        If ((iCodInforme = 502) And (piSistema = 0)) Then
          sSqlDados.Add(' ABS(SUM(DECODE(RE.CODINFORME, 503, RE.VLRREAL, 0))) AS VLR503, ');
        // Felipe A. Santos SOL 245841  PPM 629389 - fim

        // Felipe A. Santos - SOL 244545.16839 PPM 624515 - início
        If ((iCodInforme = 5012) And (piSistema = 1)) Then
          Begin
            sSqlDados.Add(' 0 AS VLR5021, ' + #13 +
              ' 0 AS VLR5022, ' + #13);
          End;
        // Felipe A. Santos - SOL 244545.16839 PPM 624515 - fim

        iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
      End;

    ssqlDados.Add('              (''-'') AS TELEFONE, (''C'') AS TIPOTEL, RE.IDINFORME  ');

    //CPrev - 29/01/2008 - Início
    If pbPensaoSeparada Then
      sSqlDados.Add(' ,RE.FLGPENSAOALIM ');

    ssqlDados.Add(
      //CPrev - 29/01/2008 - Fim

      '       FROM PESSOA P, ' + #13 +
      '            PESSOA E, ' + #13 +
      //William Moreira da Silva - SIG 24855/26744
      //'            ENDPESS EN, ' + #13 +
      //'            ESTADO ES, ' + #13 +
      //'            PESSOA PT, '                          + #13 +  // Edilaine - SOL 197664 / KTN 1894007
      //'            CIDADES C, ' + #13 +
      //William Moreira da Silva - SIG 24855/26744

      '            NATURENDIMENTO NAT, ');

    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    If piSistema = 0 Then
      ssqlDados.Add(' ENDPESS EPF, ESTADO  ESF, CIDADES CDF, FUNCIONARIO FUN, CENTCUST CCT, TELENDPESS TEP, ');
    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim

  //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
  //    ssqlDados.Add('            ( SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF, /*XB.CODNATUREZA,*/'                                                        + #13 + // Edilaine - SOL 196824 / KTN 1884092 - comentada codnatureza

    // Paulo Nobre - TAS000000006794 - Inicio

    ssqlDadosAdd('            ( SELECT  XB.IDBENEFIRRF, /*XB.CODNATUREZA,*/'); // Edilaine - SOL 196824 / KTN 1884092 - comentada codnatureza
      //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim

    ssqlDados.Add('CASE                                                ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3533'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3540'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3223'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3579'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''5565'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3556'' THEN ''0561''      ');
    ssqlDados.Add('  ELSE XB.CODNATUREZA                               ');
    ssqlDados.Add('END CODNATUREZA,                                    ');

  {    '                     DECODE(XB.CODNATUREZA, ''3533'', ''0561'', ' + #13 + // Edilaine - SOL 196824 / KTN 1884092
      '                                            ''3540'', ''0561'', ' + #13 +
      '                                            ''3223'', ''0561'', ' + #13 +
      '                                            ''3579'', ''0561'', ' + #13 +
      '                                            ''5565'', ''0561'', ' + #13 +
      //Cássio Rovaroto - SIG nº 73545 - Início
      //'                                            ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
      '                                            ''3556'', ''0561'', ' + #13 ); // Paulo Nobre - SOL 257831/18009 PPM 1207646

//      if not (pLayout2018) and not (piSistema = 1) then  //Everson Cunha - SIG81200
//      sSqlDados.Add(                                     //Everson Cunha - SIG81200
      //Darivaldo Alencar SIG61753 -inicio
//      '                                            ''9466'', ''0561'', ' + #13 +  //Everson Cunha - SIG81200
//      '                                            ''0473'', ''0561'', ' + #13 ); //Everson Cunha - SIG81200
     // else                                                                        //Everson Cunha - SIG81200
     //   sSqlDados.Add(                                                            //Everson Cunha - SIG81200
     // '                                            ''0473'', ''9466'', ' + #13 ); //Everson Cunha - SIG81200
      //Darivaldo Alencar SIG61753 -fim               }

      //Cássio Rovaroto - SIG nº 73545 - Fim
  //    '                                             XB.CODNATUREZA) CODNATUREZA, ' + #13 + // Edilaine - SOL 196824 / KTN 1884092

      ssqlDados.Add('                  IE.CODINFORME, ' + #13 +

      // Paulo Nobre - TAS000000006794 - Fim

      '                     DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' + #13 +
      '                            (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,SUM(DECODE(IE.FLGNATUREZA,''N'', ' + #13 +
      '                            (TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' + #13 +
      '                     SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' + #13 +
      '                     SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO,  ' + #13 +
      '                     IE.IDINFORME, ' + #13 + // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
      '                     XB.IDPATRO ');

    // CPrev - 29/01/2008 - Início
    If pbPensaoSeparada Then
    // Andre Imakawa - SIG 27224 - Inicio
    Begin
      If piSistema = 1 Then
         ssqlDadosAdd(' ,DECODE(IE.CODINFORME,4061,0, XB.FLGPENSAOALIM)FLGPENSAOALIM  ')
      else
         ssqlDadosAdd(' ,XB.FLGPENSAOALIM ');
    end;
    // Andre Imakawa - SIG 27224 - Fim


    sAno := FormatDateTime('yyyy', strToDate(sPeriodoInicio));
    ssqlDadosAdd(
      // CPrev - 29/01/2008 - Fim

      '              FROM LANCIRRF XB, ' + #13 +
      '                   INFORME IE, ' + #13 +
      //Vinicius Maciel - SOL 168331 - KTN 1482898
      '                   LANCXINFORME LI ' + #13 );
      //Vinicius Maciel - SOL 173637 - KINTANA 1567006
      //'                    ,(SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA, IDINFORME FROM INFORME WHERE ANOVIGENCIA <='+sAno+' GROUP BY IDINFORME ) QAN ');

      // Andre Imakawa - SIG 122151 - Inicio
      if pLayout2021 then
        ssqlDadosAdd(
        '                      ,(SELECT IDINFORME, ANOVIGENCIA FROM INFORME                                          ' + #13#10 +
        '                      WHERE (IDINFORME, ANOVIGENCIA) IN (SELECT IDINFORME, MAX(ANOVIGENCIA)                ' + #13#10 +
        '                      FROM INFORME WHERE  ANOVIGENCIA <= ' + psAno                                           + #13#10 +
        '                      GROUP BY IDINFORME )) AUX                                                            ' + #13#10 )
      Else
        ssqlDadosAdd('                    ,INFORMEAUX AUX ');
      // Andre Imakawa - SIG 122151 - Fim


    //Vinicius Maciel - SOL 173637 - KINTANA 1567006 - FIM
  //Vinicius Maciel - SOL 168331 - KTN 1482898 - FIM
  // Bruno Bastos - Kintana: 478069 SOL: 106641 - if (( pbUsaLista ) and ( piIdListaUsuario > 0 )) and ( pfIDPessoa = -1999 ) Then
  // Bruno Bastos - Kintana: 478069 SOL: 106641 -   ssqlDados.Add(', LISTAFOLHABENEFDET LD ');

    ssqlDadosAdd(' WHERE ');

    //bruno bastos - teste - 11/02/2011 - Início
    If (trim(sExcluiCPF) <> '') Then
      ssqlDadosAdd(' (XB.IDBENEFIRRF  not in (select idpessoa from pessoa where numdocumento in (' + sExcluiCPF + '))) AND ');
    //bruno bastos - teste - 11/02/2011 - Fim

    If pfIDPessoa <> -1999 Then
      Begin
        //      ssqlDados.Add('                    (XB.IDBENEFIRRF   = ' + QuotedStr(FloatToStr(pfIdPessoa)) + ') AND ' );
            //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
        //      ssqlDados.Add('                    (XB.IDBENEFIRRF   in (select idpessoa from pessoa where numdocumento in '+#13#10+
        //                    '                                         (select numdocumento from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + '))) AND ' );
              //Vander - SOL: 190550 - Kintana: 1802481
              //ssqlDados.Add('                    (XB.IDBENEFIRRF   in (select idpessoa from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + ')) AND ' );
        //        SetIdPessoa(ssqlDados, '                    (XB.IDBENEFIRRF   in (select idpessoa from pessoa where idpessoa ' + _SQL_IDPESSOA + ')) AND ');
        SetIdPessoa(ssqlDados, '                    (XB.IDBENEFIRRF ' + _SQL_IDPESSOA + ') AND ');
        SetIdPessoa(ReemBolsoINSSPA13, '  (XB.IDBENEFIRRF ' + _SQL_IDPESSOA + ') AND ');//SIG85183.92415

        //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM
      End
    Else
      Begin
        If ((pbUsaLista) And (piIdListaUsuario > 0)) Then
          Begin
            //Bruno Bastos - Kintana: 478069 SOL: 106641 - ssqlDados.Add( ' (XB.IDBENEFIRRF = LD.IDPESSOA) '+ #13 +
            //Bruno Bastos - Kintana: 478069 SOL: 106641 -                ' AND (LD.IDLISTA     = '+ IntToStr(piIdListaUsuario) +') AND ');

            //Bruno Bastos - Kintana: 478069 SOL: 106641 - Início
            //        sSqlDados.Add( ' (XB.IDBENEFIRRF IN ( SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO IN ');
            //        sSqlDados.Add( ' (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA IN ( SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = '+ QuotedStr(IntToStr(piIdListaUsuario)) +')))) AND'+ #13) ;Marcio Sanches Spinosa SOL 247267 PPM 647931

            sSqlDadosAdd('(XB.IDBENEFIRRF IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = ' + QuotedStr(IntToStr(piIdListaUsuario)) + ')) AND' + #13); //Marcio Sanches Spinosa SOL 247267 PPM 647931
            //Bruno Bastos - Kintana: 478069 SOL: 106641 - Fim

          End;
      End;

    {    if not pbPensaoSeparada then
        begin
          If pbPensao then
          Begin
            ssqlDados.Add('                    (XB.IDBENEFIRRF   IN (SELECT IDFAVORECIDO '                      + #13 +
                          '                                          FROM RUBRICAINDIV   '                      + #13 +
                          '                                          WHERE IDFAVORECIDO      = XB.IDBENEFIRRF ' + #13 +
                          '                                            AND RUBRICAPROVENTOPA IS NOT NULL '      + #13 +
                          '                                            AND FLGPENSAOALIM     = 1 '              + #13 +
                          '                                            AND (DATAFINAL        > TO_DATE('+ QuotedStr( sPeriodoInicio ) +',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) ');
          End
          Else
          Begin
            ssqlDados.Add('                    (XB.IDBENEFIRRF   NOT IN (SELECT IDFAVORECIDO '                      + #13 +
                          '                                              FROM RUBRICAINDIV '                        + #13 +
                          '                                              WHERE IDFAVORECIDO      = XB.IDBENEFIRRF ' + #13 +
                          '                                                AND RUBRICAPROVENTOPA IS NOT NULL '      + #13 +
                          '                                                AND FLGPENSAOALIM     = 1 '              + #13 +
                          '                                                AND (DATAFINAL        > TO_DATE('+ QuotedStr( sPeriodoInicio ) +',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) ');
          End;
        end
        else }
    Begin
      If pbPensao Then
        Begin
          sSqlDadosAdd(' (XB.FLGPENSAOALIM = 2) ')
        End
      Else
        Begin
          sSqlDadosAdd(' ((XB.FLGPENSAOALIM = 0)  OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60))')
        End;
    End;

    ssqlDadosAdd('                AND (LI.IDLANCIRRF    = XB.IDLANCIRRF)' + #13 +
      //'                AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') '                                               + #13 + // Edilaine - SOL 199978 / KTN 1925538
      ///Vinicius Maciel - SOL 173637 - KINTANA 1567006
      //'                AND (LI.IDINFORME     = IE.IDINFORME) '                                                   + #13 +
      '                AND (LI.IDINFORME       = AUX.IDINFORME)  ' + #13 +
      '                AND (AUX.IDINFORME      = IE.IDINFORME)   ' + #13 +
      '                AND (AUX.ANOVIGENCIA    = IE.ANOVIGENCIA) ' + #13 +
      //Vinicius Maciel - SOL 173637 - KINTANA 1567006 - FIM
      '                AND (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' + #13 +
      '                                          AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ');

    //William Moreira da Silva - Sol 223696 - Kintana 2057501
    // Thiago Melo SOL 223141.15622 Kintana 2057248
    //if piSistema <> 0 then
    If (piSistema = 1)
      And (StrToInt(psAno) >= 2010) Then //Marcio Sanches Spinosa SOL 225024 KINTANA 2059224
      // Thiago Melo SOL 223141.15622 Kintana 2057248
      Begin
        //Marcio Sanches Spinosa SOL 247267/16925 PPM 652769 - Inicio
        //William Moreira da Silva - Sol 223220 - Kintana 2057177
        //      ssqlDados.Add('                AND EXISTS (SELECT 1 FROM HISTRUBSAL H        '+
        //                    '             WHERE H.IDPESSOA = XB.IDBENEFIRRF '+
        //                    '             AND   H.MESCOBRANCA BETWEEN '+QuotedStr( psAno+'/01' )+' AND '+QuotedStr( psAno+'/12' )+
        //                    '             /*AND   H.CODIRRFDARF = XB.CODNATUREZA */'+
        //                    '             AND   (H.IDINFORME = 49 OR H.IDINFORME = 45 OR H.IDINFORME = 201 OR H.IDINFORME = 97 OR H.IDINFORME = 98)) '); //Xavier  ad idinforme 97 e 98
              //William Moreira da Silva - Sol 223220 - Kintana 2057177
        //Marcio Sanches Spinosa SOL 247267/16925 PPM 652769 - Fim
      End;
        //William Moreira da Silva - Sol 223696 - Kintana 2057501

    Case piSistema Of
        //Folha de Pagamento

      0: ssqlDadosAdd('                AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 21) ' +
          '                AND (XB.CODNATUREZA   NOT IN (''8888'', ''7893'')) ');
        //Folha de Benefícios
      1: ssqlDadosAdd('                AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18)    ' + #13 +
        //Vinicius Maciel - SOL 168331 - KTN 1482898
        //               '                AND (XB.CODNATUREZA NOT IN (''5565'',''3223'',''7416'',''7431'')) ');
        //Vinicius Maciel SOL 170987 KTN 1528710
        //'                AND (XB.CODNATUREZA NOT IN (''5565'',''3223'',''7416'',''7431'')) '+ #13 + //);
        //'                AND (XB.CODNATUREZA NOT IN (''5565'',''3223'',''7416'',''7431'',''1889'')) ');  // Edilaine - SOL 197664 / KTN 1894007
        //                         '                AND (XB.CODNATUREZA = ''0561'') ');                                               // Edilaine - SOL 197664 / KTN 1894007
        // Paulo Nobre - SOL257831/18009 PPM 1207646- comentado a linha abaixo
        //'                AND (XB.CODNATUREZA IN (''0561'',  ''3540'', ''3533'', ''3556'')) ' +  //Marcio Sanches Spinosa SOL 208778 Kintana 2023148                                              // Edilaine - SOL 197664 / KTN 1894007
        // Paulo Nobre - SOL257831/18009 PPM 1207646 - início

        //  '                AND (XB.CODNATUREZA IN (''0561'',  ''3540'', ''3533'', ''3556'', ''5565'', ''3579'', ''3223'')) ' + // Andre Imakawa - SIG 50532
        //Darivaldo Alencar SIG61753 -inicio
        //'                AND (XB.CODNATUREZA IN (''0561'',  ''3540'', ''3533'', ''3556'', ''5565'', ''3579'' '+ Iff((strtoint(psano) >= 2015), ','+ QuotedStr('3223'), EmptyStr) + ')) ' + // Andre Imakawa - SIG 50532
        '                AND (XB.CODNATUREZA IN (''0561'',  ''3540'', ''3533'', ''3556'', ''5565'', ''3579'' '+ Iff((strtoint(psano) >= 2015), ','+ QuotedStr('3223'), EmptyStr) +', ''0473'',''9466'' '+ ')) ' +
        //Darivaldo Alencar SIG61753 -fim

        // Paulo Nobre - SOL257831/18009 PPM 1207646 - fim

          Iff(pbPensao, ' AND LI.IDINFORME <> 60   ', EmptyStr)); //Marcio Sanches Spinosa SOL 247324 PPM 653497

        //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
        //Vinicius Maciel - SOL 173637 - KINTANA 1567006
        // '                AND (IE.IDINFORME = QAN.IDINFORME) '+ #13 +
        // '                AND (IE.ANOVIGENCIA = QAN.ANOVIGENCIA)  ');
        //Vinicius Maciel - SOL 173637 - KINTANA 1567006 - FIM
        //Vinicius Maciel - SOL 168331 - KTN 1482898 - FIM
        //Todas as origens
      2: ssqlDadosAdd('                AND (XB.CODNATUREZA   NOT IN (''8888'', ''7893'', ''7431'', ''7416'')) ');

      //Folha de Resgate
      3: sSQLDadosAdd('                AND (XB.CODNATUREZA in (''3223'', ''3556'')) '); // André Pontes - 08/10/2007 - pendência 26341 - retirada natureza 5565/ Marcio Sanches Spinosa SOL 223465 KINTANA 2058652

      //Contas a Pagar
      4: ssqlDadosAdd('                AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 3) ' +
          '                AND (XB.CODNATUREZA   NOT IN (''8888'', ''7893'', ''7431'', ''7416'')) ');

      //Tributação regressiva
      5: sSQLDadosAdd('                AND (XB.CODNATUREZA in (''5565'', ''3579'')) ');
    End;

   // Paulo Nobre - TAS000000006794 - Inicio

    sSqlDadosAdd('              GROUP BY XB.IDBENEFIRRF, ');

    ssqlDados.Add('CASE                                                ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3533'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3540'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3223'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3579'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''5565'' THEN ''0561''      ');
    ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3556'' THEN ''0561''      ');
    ssqlDados.Add('  ELSE XB.CODNATUREZA                               ');
    ssqlDados.Add('END ,                                               ');  

      //'                       XB.CODNATUREZA, '  + #13 +        // Edilaine - SOL 202259 / KTN 2042903 - comentado

  {   '                       DECODE(XB.CODNATUREZA, ''3533'', ''0561'', ' + #13 + // Edilaine - SOL 202259 / KTN 2042903
      '                                              ''3540'', ''0561'', ' + #13 +
      '                                              ''3223'', ''0561'', ' + #13 +
      '                                              ''3579'', ''0561'', ' + #13 +
      '                                              ''5565'', ''0561'', ' + #13 +
      //Cássio Rovaroto - SIG nº 73545 - Início
      //'                                            ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
      '                                            ''3556'', ''0561'' ' + #13 ); // Paulo Nobre - SOL 257831/18009 PPM 1207646
//      if not (pLayout2018) and not (piSistema = 1) then  //Everson Cunha - SIG81200
//      if (pLayout2018) and (piSistema = 1) then            //Everson Cunha - SIG81200
//      sSqlDados.Add(                                       //Everson Cunha - SIG81200
      //Darivaldo Alencar SIG61753 -inicio
//      '                                            ''9466'', ''0561'', ' + #13 + //Everson Cunha - SIG81200
//      '                                            ''0473'', ''0561'' ' + #13 ); //Everson Cunha - SIG81200
      //else                                                                       //Everson Cunha - SIG81200
      //sSqlDados.Add(                                                             //Everson Cunha - SIG81200
      //'                                            ''0473'', ''9466'' ' + #13 ); //Everson Cunha - SIG81200
            //Darivaldo Alencar SIG61753 -fim      }

      //Cássio Rovaroto - SIG nº 73545 - Fim
//      '                                              ,XB.CODNATUREZA), ' + #13 + // Edilaine - SOL 202259 / KTN 2042903
      sSqlDadosAdd('                   IE.CODINFORME, ' + #13 +

      // Paulo Nobre - TAS000000006794 - Fim

      '                       IE.IDINFORME, ' + #13 + // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
      '                       XB.IDPATRO '); 

    // Felipe A. Santos SOL 245841 PPM 629389 - início
    If (piSistema = 0) Then
      Begin
        If pbPensaoSeparada Then
          sSqlDadosAdd(' , XB.FLGPENSAOALIM ');
      End
    Else
      // Felipe A. Santos SOL 245841 PPM 629389 - fim
      Begin
        //CPrev - 29/01/2008 - Início
        If pbPensaoSeparada Then
          sSqlDadosAdd(' , XB.FLGPENSAOALIM ) RE')
        Else
          sSqlDadosAdd(' ) RE ');
        //CPrev - 29/01/2008 - Fim
      End;

        // Felipe A. Santos SOL 245841 PPM 629389 - início

        // RNG09 Quando o sistema é folha de pagamento, agora será impresso no informe de rendimentos o IR do 13º salário do funcionário
        //  linha 5 item 2 do informe
    If (piSistema = 0) Then
      Begin
        ssqlDados.Add('  UNION ' +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
          //                     '  SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF, /*XB.CODNATUREZA,*/'                                                        + #13 +

        // Paulo Nobre - TAS000000006794 - Inicio

        '  SELECT  XB.IDBENEFIRRF, /*XB.CODNATUREZA,*/');

        ssqlDados.Add('CASE                                              ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3533'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3540'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3579'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''5565'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3556'' THEN ''0561''    ');
        ssqlDados.Add('  ELSE XB.CODNATUREZA                             ');
        ssqlDados.Add('END CODNATUREZA,                                  ');

          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
{         '           DECODE(XB.CODNATUREZA, ''3533'', ''0561'', ' + #13 +
          '                                  ''3540'', ''0561'', ' + #13 +
          '                                  ''3579'', ''0561'', ' + #13 +
          '                                  ''5565'', ''0561'', ' + #13 +
           //Cássio Rovaroto - SIG nº 73545 - Fim
          //'                                  ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                                  ''3556'', ''0561'', ' + #13 ); // Paulo Nobre - SOL 257831/18009 PPM 1207646

//          if not (pLayout2018) and not (piSistema = 1) then   //Everson Cunha - SIG81200
//          if (pLayout2018) and (piSistema = 1) then           //Everson Cunha - SIG81200
//            sSqlDados.Add(                                    //Everson Cunha - SIG81200
            //Darivaldo Alencar SIG61753 -inicio
//          '                                            ''9466'', ''0561'', ' + #13 +   //Everson Cunha - SIG81200
//          '                                            ''0473'', ''0561'', ' + #13 );  //Everson Cunha - SIG81200
          //else                                                                         //Everson Cunha - SIG81200
          //  sSqlDados.Add(                                                             //Everson Cunha - SIG81200
          //'                                            ''0473'', ''9466'', ' + #13 );  //Everson Cunha - SIG81200
            //Darivaldo Alencar SIG61753 -fim                                            //Everson Cunha - SIG81200
          sSqlDados.Add(
          //Cássio Rovaroto - SIG nº 73545 - Fim
          '                        XB.CODNATUREZA) CODNATUREZA, ' + #13 +              }

          ssqlDados.Add('DECODE(IE.CODINFORME, 501, 503) AS CODINFORME, ' + #13 +

         // Paulo Nobre - TAS000000006794 - Fim      

          '           DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' + #13 +
          '                  (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,SUM(DECODE(IE.FLGNATUREZA,''N'', ' + #13 +
          '                  (TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' + #13 +
          '           SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' + #13 +
          '           SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO,  ' + #13 +
          '               IE.IDINFORME,  ' + #13 + // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
          '               XB.IDPATRO ');

        If pbPensaoSeparada Then
           ssqlDados.Add(' ,XB.FLGPENSAOALIM ');


        sAno := FormatDateTime('yyyy', strToDate(sPeriodoInicio));
        ssqlDados.Add('              FROM LANCIRRF XB, ' + #13 +
          '                   INFORME IE, ' + #13 +
          '                   LANCXINFORME LI ' + #13 +
          '                    ,INFORMEAUX AUX ');

        ssqlDados.Add(' WHERE ');
        If (trim(sExcluiCPF) <> '') Then
          ssqlDados.Add(' (XB.IDBENEFIRRF  not in (select idpessoa from pessoa where numdocumento in (' + sExcluiCPF + '))) AND ');

        If pfIDPessoa <> -1999 Then
          Begin
            //            SetIdPessoa(ssqlDados, '(XB.IDBENEFIRRF   in (select idpessoa from pessoa where idpessoa ' + _SQL_IDPESSOA + ')) AND ');
            SetIdPessoa(ssqlDados, '(XB.IDBENEFIRRF ' + _SQL_IDPESSOA + ') AND ');
          End
        Else
          Begin
            If ((pbUsaLista) And (piIdListaUsuario > 0)) Then
              Begin
                sSqlDados.Add(' (XB.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO IN');
                sSqlDados.Add(' (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = ' + QuotedStr(IntToStr(piIdListaUsuario)) + ')))) AND' + #13);
              End;
          End;

        Begin
          If pbPensao Then
            Begin
              sSqlDados.Add(' (XB.FLGPENSAOALIM = 2) ')
            End
          Else
            Begin
              sSqlDados.Add(' ((XB.FLGPENSAOALIM = 0)  OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60))')
            End;
        End;

        ssqlDados.Add('                AND (LI.IDLANCIRRF    = XB.IDLANCIRRF)' + #13 +
          '                AND (LI.IDINFORME       = AUX.IDINFORME)  ' + #13 +
          '                AND (AUX.IDINFORME      = IE.IDINFORME)   ' + #13 +
          '                AND (AUX.ANOVIGENCIA    = IE.ANOVIGENCIA) ' + #13 +
          '                AND (IE.CODINFORME = 501) ' + #13 +
          '                AND (IE.CODDIRF = 7) ' + #13 +
          '                AND (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' + #13 +
          '                                          AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' + #13 +
          '                AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 21) ' + #13 +
          '                AND (XB.CODNATUREZA   NOT IN (''8888'', ''7893'')) ' + #13 +

        // Paulo Nobre - TAS000000006794 - Inicio

          '              GROUP BY XB.IDBENEFIRRF, ');

        ssqlDados.Add('CASE                                              ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3533'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3540'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3579'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''5565'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3556'' THEN ''0561''    ');
        ssqlDados.Add('  ELSE XB.CODNATUREZA                             ');
        ssqlDados.Add('END,                                              ');

 {       ssqlDados.Add('                       DECODE(XB.CODNATUREZA, ''3533'', ''0561'', ' + #13 +  

          '                                              ''3540'', ''0561'', ' + #13 +
          '                                              ''3579'', ''0561'', ' + #13 +
          '                                              ''5565'', ''0561'', ' + #13 +
          '                                              ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
         //Cássio Rovaroto - SIG nº 73545 - Início
        //'                                               ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                                              ''3556'', ''0561'', ' + #13 ); // Paulo Nobre - SOL 257831/18009 PPM 1207646
//          if not (pLayout2018) and not (piSistema = 1) then  //Everson Cunha - SIG81200
//          if (pLayout2018) and (piSistema = 1) then    //Everson Cunha - SIG81200
//            sSqlDados.Add(
//            '                                            ''9466'', ''0561'', ' + #13 + // Andre Imakawa -SIG 63065    //Everson Cunha - SIG81200
//            '                                            ''0473'', ''0561'', ' + #13 ); // Andre Imakawa -SIG 63065   //Everson Cunha - SIG81200
          //else                                                                                                        //Everson Cunha - SIG81200
          //  sSqlDados.Add(                                                                                            //Everson Cunha - SIG81200
          //  '                                            ''0473'', ''9466'', ' + #13 ); // Andre Imakawa -SIG 63065   //Everson Cunha - SIG81200
         sSqlDados.Add(
          //Cássio Rovaroto - SIG nº 73545 - Fim
          '                                              XB.CODNATUREZA), ' + #13 +     }

        sSqlDados.Add('                      IE.CODINFORME, ' + #13 +

        // Paulo Nobre - TAS000000006794 - Fim

          '                       IE.IDINFORME,  ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                       XB.IDPATRO ');

        If pbPensaoSeparada Then
          sSqlDados.Add(' , XB.FLGPENSAOALIM ) RE')
        Else
          sSqlDados.Add(' ) RE ');
      End;
      // Felipe A. Santos SOL 245841 PPM 629389- fim

    sSqlDados.Add('       WHERE (P.TIPO = ''F'')' + #13 +
      '         AND (E.IDPESSOA = ' + IntToStr(piIdEmpresaProp) + ') ' //+ #13 +
      //'         AND (PT.IDPESSOA = RE.IDPATRO) '     // Edilaine - SOL 197664 / KTN 1894007
      );

    If pfIDPessoa <> -1999 Then
      //      sSqlDados.Add('         AND (P.IDPESSOA = ' + FloatToStr( pfIdPessoa ) + ') ');
      //Marcio Sanches Spinosa SOL 154037 KINTANA: 1705106 - INICIO
      //      sSqlDados.Add('         AND (P.IDPESSOA in (select idpessoa from pessoa where numdocumento in '+#13#10+
      //                    '                            (select numdocumento from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + ')))' );
      //Vander - SOL: 190550 - Kintana: 1802481
      //sSqlDados.Add('         AND (P.IDPESSOA in (select idpessoa from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + '))' );
      //      SetIdPessoa(sSqlDados, '         AND (P.IDPESSOA in (select idpessoa from pessoa where idpessoa ' + _SQL_IDPESSOA + '))');
      SetIdPessoa(sSqlDados, '         AND (P.IDPESSOA ' + _SQL_IDPESSOA + ')');

     //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM
     //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    If piSistema = 0 Then
      sSqlDados.Add(' AND (FUN.IDPESSOA       = P.IDPESSOA) ' +
        ' AND (CCT.CODCENTROCUSTO = FUN.CODCENTROCUSTO) ' +
        ' AND (E.IDENDCOMERCIAL   = TEP.IDENDERECO) ' +
        ' AND (TEP.TIPO           = ''C'') ' +
        ' AND (E.IDENDCOMERCIAL   = EPF.IDENDERECO(+)) ' +
        ' AND (E.IDPESSOA         = EPF.IDPESSOA(+)) ' +
        ' AND (EPF.IDCIDADES      = CDF.IDCIDADES(+)) ' +
        ' AND (CDF.IDESTADO       = ESF.IDESTADO(+)) ');
     //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim

     //William Moreira da Silva - SIG 24855/26744
      //sSqlDados.Add('         AND (EN.IDENDERECO(+) = P.IDENDCORRESP) ' + #13 +
      //'         AND (EN.IDPESSOA(+)   = P.IDPESSOA) ' + #13 +
      //'         AND (EN.IDCIDADES     = C.IDCIDADES(+)) ' + #13 +
      //'         AND (ES.IDESTADO(+)   = C.IDESTADO) ' + #13 +
//      sSqlDados.Add('         AND (NAT.CODNATUREZA  = RE.CODNATUREZA) ' + #13 + //Everson Cunha - SIG81200
      sSqlDados.Add('         AND (NAT.CODNATUREZA  = decode(RE.CODNATUREZA, ''0473'', ''0561'', ''9466'', ''0561'', RE.CODNATUREZA) ) ' + #13 +   //Everson Cunha - SIG81200
      //William Moreira da Silva - SIG 24855/26744
      
      '         AND (RE.IDBENEFIRRF   = P.IDPESSOA) ' + #13 +
      '         AND RTRIM(LTRIM(DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, P.NUMDOCUMENTO, ''00000000000''))) <> ''00000000000'' ' + #13 + //CPrev - 25/02/2008

      '       GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' + #13 + //CPrev - Pend. 27379 - 25/02/2008
      //CPrev - Pend. 27379 - Início
      //CPrev - Pend. 27379 - 25/02/2008 - '       GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL, DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, RTRIM(LTRIM(P.NUMDOCUMENTO)), ''00000000000''), ' + #13 +
      //CPrev - Pend. 27379 - Fim

      '             E.NUMDOCUMENTO, E.RAZAOSOCIAL, NAT.CODNATUREZA, NAT.DESCRICAO, ' + #13 +
      //William Moreira da Silva - SIG 24855/26744
      //'             EN.IDENDERECO, EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' + #13 +
      //'             EN.BAIRRO, C.NOME, EN.CEP, ES.CODESTADO, C.NUMSEED, ' + #13 +
      //William Moreira da Silva - SIG 24855/26744
      
      //'             PT.IDPESSOA ');   // Edilaine - SOL 197664 / KTN 1894007

      '             RE.IDPATRO, RE.IDINFORME '); // Edilaine - SOL 197664 / KTN 1894007
      //Cássio Rovaroto - SIG nº 73545 - Início
      if ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
      sSqlDados.Add(', RE.CODNATUREZA ');
      //Cássio Rovaroto - SIG nº 73545 - Fim


    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    If piSistema = 0 Then
      sSqlDados.Add(' ,EPF.LOGRADOURO, ' +
        ' EPF.NUMERO, ' +
        ' EPF.COMPLEMENTO, ' +
        ' EPF.BAIRRO, ' +
        ' CDF.NOME, ' +
        ' EPF.CEP, ' +
        ' ESF.CODESTADO, ' +
        ' ''(''||TRIM(TEP.DDD)||'')''||SUBSTR(TRIM(TEP.NUMERO), 1, 4)||''-''||SUBSTR(TRIM(TEP.NUMERO), 5, 4), ' +
        ' CDF.NUMSEED, ' +
        ' CCT.NOME ');
    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim
    //CPrev - 29/01/2008 - Início

    If pbPensaoSeparada Then
      ssqlDados.Add(' , RE.FLGPENSAOALIM');
    //CPrev - 29/01/2008 - Fim
    // Felipe A. Santos - SOL244545.16839 PPM 624515 - início
    // o union abaixo foi incluído, porque a FUNCEF necessita  que seja impresso no informe de rendimentos
    // no item 5 o desconto de IR do 13º salário do aposentado separadamente, pois na primeira informação do item 5,
    // apresenta o 13º salário já com o IR descontado.

    If (piSistema = 1) Then // bloco abaixo somente para folha de benefícios
      Begin
        sSqlDados.Add(' UNION ');
        //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
        //        sSqlDados.Add('      SELECT /*+INDEX(XB) */ ' + QuotedStr( sNomeResp ) + ' AS NOMERESP, '            + #13 +
        sSqlDados.Add('      SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + #13 +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
          '              ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + #13 +
          '              ' + QuotedStr(psAno) + ' AS ANO, ' + #13 +
          '              ' + QuotedStr(IntToStr(strtoint(psAno)+1)) + ' AS ANO_EXERCICIO, ' + #13 +       // Andre Imakawa - SIG 122151
          '              TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' + #13 +
          '              TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' + #13 +
          '              TB_IR13.IDPATRO AS IDPESSJUR, ' + #13 +
          '              NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, ' + #13 +
          '              P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' + #13 +
          '              P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
//          '              NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, ' + #13 +  //Everson Cunha - SIG81200
          //'   decode(NAT.CODNATUREZA, ''0473'', ''0561'', ''9466'', ''0561'', NAT.CODNATUREZA) CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL,  ' + #13 +    //Everson Cunha - SIG81200
          '   decode(TB_IR13.CODNATUREZA, ''0473'', ''0561'', ''9466'', ''0561'', TB_IR13.CODNATUREZA) CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL,  ' + #13 +    //Everson Cunha - SIG81200
          //'              NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, EN.IDENDERECO, ' + #13 +
          //'              EN.LOGRADOURO AS ENDEREO, ' + #13 +
          //'              EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' + #13 +
          //'              ES.CODESTADO AS UF, C.NUMSEED, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          '              0 AS VLR2, ' + #13 +
          '              0 AS VLR301, ' + #13 +
          '              0 AS VLR302, ' + #13 +
          '              0 AS VLR303, ' + #13 +
          '              0 AS VLR304, ' + #13 +
          '              0 AS VLR305, ' + #13 +
          '              0 AS VLR306, ' + #13 +
          '              0 AS VLR401, ' + #13 +
          '              0 AS VLR402, ' + #13 +
          '              0 AS VLR403, ' + #13 +
          '              0 AS VLR404, ' + #13 +
          '              0 AS VLR405, ' + #13 +
          '              0 AS VLR406, ' + #13 +
          '              0 AS VLR407, ' + #13 +
          '              0 AS VLR501, ' + #13 +
          '              0 AS VLR501_SENEG, ' + #13 +
          '              0 AS VLR502, ' + #13 +
          '              0 AS VLR601, ' + #13 +
          '              0 AS VLR602, ' + #13 +
          '              0 AS VLR603, ' + #13 +
          '              0 AS VLR604, ' + #13 +
          '              0 AS VLR605, ' + #13 +
          '              0 AS VLR606, ' + #13 +
          '              0 AS VLR607, ' + #13 +
          '              0 AS VLR608, ' + #13 +
          '              0 AS VLR3011, ' + #13 +
          '              0 AS VLR3012, ' + #13 +
          '              0 AS VLR3021, ' + #13 +
          '              0 AS VLR3031, ' + #13 +
          '              0 AS VLR3032, ' + #13 +
          '              0 AS VLR3041, ' + #13 +
          '              0 AS VLR3042, ' + #13 +
          '              0 AS VLR3051, ' + #13 +
          '              0 AS VLR4011, ' + #13 +
          '              0 AS VLR4012, ' + #13);

          // Andre Imakawa - SIG 122151 - Inicio
          //if (pLayout2021) or (pbPensao) then        //edilaine SIG122959
          if (pLayout2021) or ((pbPensao) and (psAno >= '2021')) then        //Ferrari SIG 130588 // Andre Imakawa - SIG 131510
            sSqlDados.Add(
            '              0 AS VLR4013, ' + #13 + // Andre Imakawa - SIG 122151
            '              0 AS VLR4014, ' + #13); // Andre Imakawa - SIG 122151
          // Andre Imakawa - SIG 122151 - Fim

          sSqlDados.Add(
          '              0 AS VLR4021, ' + #13 +
          '              0 AS VLR4022, ' + #13 +
          '              0 AS VLR4031, ' + #13 +
          '              0 AS VLR4032, ' + #13 +
          '              0 AS VLR4041, ' + #13 +
          '              0 AS VLR4042, ' + #13 +
          '              0 AS VLR4051, ' + #13 +
          '              0 AS VLR4061, ' + #13 +
          '              0 AS VLR4071, ' + #13 +
          '              0 AS VLR4072, ' + #13 );
          //'              0 AS VLR4081, ');      // Paulo Nobre - SOL257831/18009   //edilaine SIG129805

          //edilaine SIG129805 : inicio
          if (not pLayoutResgate) and (StrToInt(psAno) >= 2015) Then // Andre Imakawa - SIG 133477
            sSqlDados.Add(
            '              0 AS VLR4081, ' + #13);
          //edilaine SIG129805 : fim

          // Andre Imakawa - SIG 122151 - Inicio
          //if (pLayout2021) or (pbPensao) then      //edilaine SIG122959
          //if (pLayout2021) or ((pbPensao) and (psAno >= '2021')) then      //Ferrari SIG 130588 // Andre Imakawa - SIG 131510

          //If (piSistema = 1) and (pLayout2021) Then                   //edilaine 18939
          if (pLayout2021) or ((pbPensao) and (psAno >= '2021')) then   //edilaine 18939
            sSqlDados.Add(
            '              0 AS VLR4101, ' + #13); // Andre Imakawa - SIG 122151
          // Andre Imakawa - SIG 122151 - Fim


          sSqlDados.Add(
          '              0 AS VLR5011, ' + #13 +
          '              0 AS VLR5011_SENEG, ' + #13 +
          '              0 AS VLR5012, ' + #13 +
          //Cássio Rovaroto - SIG nº 73545 - Início
          //'              0 AS VLR5012_SENEG, ' + #13 +
          '              0 AS VLR5012_SENEG, ' + #13);
        if ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
        begin
          sSqlDados.Add(
          //'              CASE WHEN NAT.CODNATUREZA IN (''0473'', ''9466'') THEN 0 ELSE ABS(SUM(DECODE(TB_IR13.CODINFORME, 5021, VLRREAL2, 0))) END AS VLR5021, ' + #13 + // valor de IR do 13º Salário
          '              CASE WHEN TB_IR13.CODNATUREZA IN (''0473'', ''9466'') THEN 0 ELSE ABS(SUM(DECODE(TB_IR13.CODINFORME, 5021, VLRREAL2, 0))) END AS VLR5021, ' + #13 + // valor de IR do 13º Salário
          //'              CASE WHEN NAT.CODNATUREZA IN (''0473'', ''9466'') THEN 0 ELSE ABS(SUM(DECODE(TB_IR13.CODINFORME, 5022, VLRREAL2, 0))) END AS VLR5022, ' + #13)  // valor de IR do 13º Salário
          '              CASE WHEN TB_IR13.CODNATUREZA IN (''0473'', ''9466'') THEN 0 ELSE ABS(SUM(DECODE(TB_IR13.CODINFORME, 5022, VLRREAL2, 0))) END AS VLR5022, ' + #13)  // valor de IR do 13º Salário
        end
        else
          sSqlDados.Add(
          '              ABS(SUM(DECODE(TB_IR13.CODINFORME, 5021, VLRREAL2, 0))) AS VLR5021, ' + #13 + // valor de IR do 13º Salário
          '              ABS(SUM(DECODE(TB_IR13.CODINFORME, 5022, VLRREAL2, 0))) AS VLR5022, ' + #13); // valor de IR do 13º Salário
        sSqlDados.Add(
          //Cássio Rovaroto - SIG nº 73545 - Fim
          //'              0 AS VLR5021, ' + #13 +
          //'              0 AS VLR5022, ' + #13 +
          '              0 AS VLR5031, ' + #13 + // Paulo Nobre - SOL257831/18009 PPM 1207646 - início
          //'              0 AS VLR5032, ' + #13 + // SOL 268002 PPM 1245182
          '              0 AS VLR6011, ' + #13 +
          '              0 AS VLR6012, ' + #13 +
          '              0 AS VLR6021, ' + #13 +
          '              0 AS VLR6022, ' + #13 +
          '              0 AS VLR6032, ' + #13 +
          '              0 AS VLR6042, ' + #13 +
          '              0 AS VLR6052, ' + #13 +
          '              0 AS VLR6062, ' + #13 +
          '              0 AS VLR7011, ' + #13 +
          '              0 AS VLR9010, ' + #13 +
          '              0 AS VLR9011, ' + #13 +
          '              0 AS VLR9012, ' + #13 +
          '              0 AS VLR9021, ' + #13 +
          // leandro wo17932 - inicio
          //'              0 AS VLR9031, ' + #13 +
          '              0 AS VLR9031, ' + #13 );

        //edilaine WO18939 : inicio  
          //if (pLayout2021) or ((psAno >= '2024')) then //wo18410 leandro
          //if (pLayout2021) and ((psAno >= '2024')) then  //wo18410 leandro
          //    sSqlDados.Add('              0 AS VLR9999, ' + #13 );

        if (psAno >= '2024')  then
          sSqlDados.Add('              0 AS VLR9999, ' + #13 );
        //edilaine WO18939 : fim

          sSqlDados.Add('              (''-'') AS TELEFONE, (''C'') AS TIPOTEL, TB_IR13.IDINFORME  ');
          // leandro wo17932 - inicio

        If pbPensaoSeparada Then
          sSqlDados.Add(' , TB_IR13.FLGPENSAOALIM ');

        ssqlDados.Add('       FROM PESSOA P, ' + #13 +
          '            PESSOA E, ' + #13 +
          //William Moreira da Silva
          //'            ENDPESS EN, ' + #13 +
          //'            ESTADO ES, ' + #13 +
          //'            CIDADES C, ' + #13 +
          //William Moreira da Silva
          '            NATURENDIMENTO NAT, ' + #13 +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
          //                      '            ( SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF, /*XB.CODNATUREZA,*/'                                                        + #13 +

        // Paulo Nobre - TAS000000006794 - Inicio

          '            ( SELECT  XB.IDBENEFIRRF, /*XB.CODNATUREZA,*/');

        ssqlDados.Add('CASE                                              ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3533'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3540'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3579'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''5565'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3556'' THEN ''0561''    ');
        ssqlDados.Add('  ELSE XB.CODNATUREZA                             ');
        ssqlDados.Add('END CODNATUREZA,                                  ');

          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
 {         '                     DECODE(XB.CODNATUREZA, ''3533'', ''0561'', ' + #13 +
          '                                            ''3540'', ''0561'', ' + #13 +
          '                                            ''3579'', ''0561'', ' + #13 +
          '                                            ''5565'', ''0561'', ' + #13 +
          //Cássio Rovaroto - SIG nº 73545 - Início
          //'                                            ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                                            ''3556'', ''0561'', ' + #13 ); // Paulo Nobre - SOL 257831/18009 PPM 1207646
//          if not(pLayout2018) and not(piSistema = 1) then //Everson Cunha - SIG81200
//          if (pLayout2018) and (piSistema = 1) then       //Everson Cunha - SIG81200
//          sSqlDados.Add(                                  //Everson Cunha - SIG81200
          //Darivaldo Alencar SIG61753 -inicio
//          '                                            ''9466'', ''0561'', ' + #13 +  //Everson Cunha - SIG81200
//          '                                            ''0473'', ''0561'', ' + #13 ); //Everson Cunha - SIG81200
          //Darivaldo Alencar SIG61753 -fim
          //else                                                                        //Everson Cunha - SIG81200
          //sSqlDados.Add(                                                              //Everson Cunha - SIG81200
          //'                                            ''0473'', ''9466'', ' + #13);  //Everson Cunha - SIG81200
          sSqlDados.Add(
          //Cássio Rovaroto - SIG nº 73545
          '                                             XB.CODNATUREZA) CODNATUREZA, ' + #13 +    }

          ssqlDados.Add('              DECODE(IE.CODINFORME, ''5011'', ''5021'', ''5022'') CODINFORME, ' + #13 + // Transforma o CODINFORME 5011 e 5012 em 5021 e 5022

        // Paulo Nobre - TAS000000006794 - Fim

          '                     DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA, ''N'',(TRUNC(LI.VLRLANC,2) * -1),TRUNC(LI.VLRLANC,2)))), -1, ' + #13 +
          '                                (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2) * -1), TRUNC(LI.VLRLANC,2)))) * -1, ' + #13 +
          '                                 SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2) * -1),TRUNC(LI.VLRLANC,2)))) AS VLR2, ' + #13 +
          '                     SUM(DECODE(IE.FLGNATUREZA, ''N'', (TRUNC(LI.VLRLANC,2) * -1), TRUNC(LI.VLRLANC,2))) AS VLRREAL2, ' + #13 +
          '                     SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO2, ' + #13 +
          '                     IE.IDINFORME, ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                     XB.IDPATRO ');

        If pbPensaoSeparada Then
           // ssqlDados.Add(' ,XB.FLGPENSAOALIM ');  // Andre Imakawa - SIG 27224
           ssqlDados.Add(' ,DECODE(IE.CODINFORME,4061,0, XB.FLGPENSAOALIM)FLGPENSAOALIM  '); // Andre Imakawa - SIG 27224

        sAno := FormatDateTime('yyyy', strToDate(sPeriodoInicio));
        ssqlDados.Add('              FROM LANCIRRF XB, ' + #13 +
          '                   INFORME IE, ' + #13 +
          '                   LANCXINFORME LI, ');
        // Andre Imakawa - SIG 122151 - Inicio
        if pLayout2021 then
          ssqlDados.Add(
          '                      (SELECT IDINFORME, ANOVIGENCIA FROM INFORME                                          ' + #13#10 +
          '                      WHERE (IDINFORME, ANOVIGENCIA) IN (SELECT IDINFORME, MAX(ANOVIGENCIA)                ' + #13#10 +
          '                      FROM INFORME WHERE  ANOVIGENCIA <= ' + psAno                                           + #13#10 +
          '                      GROUP BY IDINFORME )) AUX                                                            ' + #13#10 )
        Else
          ssqlDados.Add('                    INFORMEAUX AUX ');
        // Andre Imakawa - SIG 122151 - Fim

        ssqlDados.Add('             WHERE ');

        If (trim(sExcluiCPF) <> '') Then
          ssqlDados.Add(' (XB.IDBENEFIRRF  not in (select idpessoa from pessoa where numdocumento in (' + sExcluiCPF + '))) AND ');

        If pfIDPessoa <> -1999 Then
          Begin
            //            SetIdPessoa(ssqlDados, '                    (XB.IDBENEFIRRF   in (select idpessoa from pessoa where idpessoa ' + _SQL_IDPESSOA + ')) AND ');
            SetIdPessoa(ssqlDados, '           (XB.IDBENEFIRRF ' + _SQL_IDPESSOA + ') AND ');
          End
        Else
          Begin
            If ((pbUsaLista) And (piIdListaUsuario > 0)) Then
              Begin
                //            sSqlDados.Add( ' (XB.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO IN');
                //            sSqlDados.Add( ' (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = '+ QuotedStr(IntToStr(piIdListaUsuario)) +')))) AND'+ #13) ;//Marcio Sanches Spinosa SOL 247267 PPM 647931
                sSqlDados.Add('(XB.IDBENEFIRRF IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = ' + QuotedStr(IntToStr(piIdListaUsuario)) + ')) AND' + #13); //Marcio Sanches Spinosa SOL 247267 PPM 647931
              End;
          End;

        Begin
          If pbPensao Then
            Begin
              sSqlDados.Add(' (XB.FLGPENSAOALIM = 2) ')
            End
          Else
            Begin
              sSqlDados.Add(' ((XB.FLGPENSAOALIM = 0)  OR (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60))')
            End;
        End;

        ssqlDados.Add('        AND (LI.IDLANCIRRF    = XB.IDLANCIRRF)' + #13 +
          '        AND (LI.IDINFORME       = AUX.IDINFORME)  ' + #13 +
          '        AND (AUX.IDINFORME      = IE.IDINFORME)   ' + #13 +
          '        AND (AUX.ANOVIGENCIA    = IE.ANOVIGENCIA) ' + #13 +
          '        AND (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' + #13 +
          '                                          AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ');

        If (piSistema = 1)
          And (StrToInt(psAno) >= 2010) Then
          Begin
            //Marcio Sanches Spinosa SOL 247267/16925 PPM 652769 - Inicio
            //          ssqlDados.Add('      AND EXISTS (SELECT 1 FROM HISTRUBSAL H        '+
            //                        '     WHERE H.IDPESSOA = XB.IDBENEFIRRF '+
            //                        '     AND   H.MESCOBRANCA BETWEEN '+QuotedStr( psAno+'/01' )+' AND '+QuotedStr( psAno+'/12' )+
            //                        '     /*AND   H.CODIRRFDARF = XB.CODNATUREZA */'+
            //                        '     AND   (H.IDINFORME = 49 OR H.IDINFORME = 45 OR H.IDINFORME = 201 OR H.IDINFORME = 97 OR H.IDINFORME = 98)) ');
            //Marcio Sanches Spinosa SOL 247267/16925 PPM 652769 - Fim
          End;

        ssqlDados.Add('       AND (NVL(XB.IDMODULORESPON,XB.IDMODULO) = 18)    ' + #13 +
          //Darivaldo Alencar SIG61753 -inicio
          //'        AND (XB.CODNATUREZA IN (''0561'',  ''3540'', ''3533'', ''3556'', ''3579'', ''5565'')) ' + #13 + // Paulo Nobre  SOL 257831/18009 PPM 1207646
          '        AND (XB.CODNATUREZA IN (''0561'',  ''3540'', ''3533'', ''3556'', ''3579'', ''5565'',''0473'',''9466'')) ' + #13 +
          //Darivaldo Alencar SIG61753 -fim
          '        AND IE.CODINFORME IN (''5011'', ''5012'') ' + #13 +
          '        AND LI.IDINFORME IN (74, 76, 196) ' + #13 + // Informes referentes ao IR do 13º Salário + IR do 13º Salário Regressivo (PRNS)

        // Paulo Nobre - TAS000000006794 - Inicio

          '      GROUP BY XB.IDBENEFIRRF, ');

        ssqlDados.Add('CASE                                              ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3533'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3540'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3579'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''5565'' THEN ''0561''    ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''3556'' THEN ''0561''    ');
        ssqlDados.Add('  ELSE XB.CODNATUREZA                             ');
        ssqlDados.Add('END,                                              ');

    {      '               DECODE(XB.CODNATUREZA, ''3533'', ''0561'', ' + #13 +
          '                                      ''3540'', ''0561'', ' + #13 +
          '                                      ''3579'', ''0561'', ' + #13 +
          '                                      ''5565'', ''0561'', ' + #13 +
          '                                      ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          //Cássio Rovaroto - SIG nº 73545 - Início
      //'                                            ''3556'', ''0561'', ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
      '                                            ''3556'', ''0561'', ' + #13 ); // Paulo Nobre - SOL 257831/18009 PPM 1207646
//      if not (pLayout2018) and not (piSistema = 1) then //Everson Cunha - SIG81200
//      if (pLayout2018) and (piSistema = 1) then         //Everson Cunha - SIG81200
//      sSqlDados.Add(                                    //Everson Cunha - SIG81200
      //Darivaldo Alencar SIG61753 -inicio
//      '                                            ''9466'', ''0561'', ' + #13 +   //Everson Cunha - SIG81200
//      '                                            ''0473'', ''0561'', ' + #13 );  //Everson Cunha - SIG81200
            //Darivaldo Alencar SIG61753 -fim
      //else                                                                         //Everson Cunha - SIG81200
      //  sSqlDados.Add(                                                             //Everson Cunha - SIG81200
      //'                                            ''0473'', ''9466'', ' + #13 );  //Everson Cunha - SIG81200
      sSqlDados.Add(
      //Cássio Rovaroto - SIG nº 73545 - Fim
          '                                      XB.CODNATUREZA), ' + #13 +      }

        ssqlDados.Add('               DECODE(IE.CODINFORME, ''5011'', ''5021'', ''5022''), ' + #13 +

        // Paulo Nobre - TAS000000006794 - Fim

          '               IE.IDINFORME, ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '               XB.IDPATRO ');

        If pbPensaoSeparada Then
          sSqlDados.Add(' , XB.FLGPENSAOALIM ) TB_IR13')
        Else
          sSqlDados.Add(' ) TB_IR13 ');

        sSqlDados.Add('       WHERE (P.TIPO = ''F'')' + #13 +
          '         AND (E.IDPESSOA = ' + IntToStr(piIdEmpresaProp) + ') ');

        If pfIDPessoa <> -1999 Then
          //SetIdPessoa(sSqlDados, '         AND (P.IDPESSOA in (select idpessoa from pessoa where idpessoa ' + _SQL_IDPESSOA + '))');
          SetIdPessoa(sSqlDados, '         AND (P.IDPESSOA ' + _SQL_IDPESSOA + ')');

          //William Moreira da Silva - SIG 24855/26744
        //sSqlDados.Add('         AND (EN.IDENDERECO(+) = P.IDENDCORRESP) ' + #13 +
        //  '         AND (EN.IDPESSOA(+)   = P.IDPESSOA) ' + #13 +
        //  '         AND (EN.IDCIDADES     = C.IDCIDADES(+)) ' + #13 +
        //  '         AND (ES.IDESTADO(+)   = C.IDESTADO) ' + #13 +
//          sSqlDados.Add('          AND (NAT.CODNATUREZA  = TB_IR13.CODNATUREZA) ' + #13 +  //Everson Cunha - SIG81200
          sSqlDados.Add('          AND (NAT.CODNATUREZA  = decode(TB_IR13.CODNATUREZA, ''0473'', ''0561'', ''9466'', ''0561'', TB_IR13.CODNATUREZA))  ' + #13 +    //Everson Cunha - SIG81200
        //William Moreira da Silva - SIG 24855/26744
          '         AND (TB_IR13.IDBENEFIRRF   = P.IDPESSOA) ' + #13 +
          '         AND RTRIM(LTRIM(DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, P.NUMDOCUMENTO, ''00000000000''))) <> ''00000000000'' ' + #13 + //CPrev - 25/02/2008
          '       GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' + #13 +
          //'             E.NUMDOCUMENTO, E.RAZAOSOCIAL, NAT.CODNATUREZA, NAT.DESCRICAO, ' + #13 +
          '             E.NUMDOCUMENTO, E.RAZAOSOCIAL, TB_IR13.CODNATUREZA, NAT.DESCRICAO, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          //'             EN.IDENDERECO, EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' + #13 +
          //'             EN.BAIRRO, C.NOME, EN.CEP, ES.CODESTADO, C.NUMSEED, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          '             TB_IR13.IDPATRO, TB_IR13.IDINFORME ');

        If pbPensaoSeparada Then
          ssqlDados.Add(' , TB_IR13.FLGPENSAOALIM ');
      End;
      // Felipe A. Santos - SOL244545.16839 PPM 624515 - fim

    If piSistema In [1, 2] Then //CPREV - Pend. 26341
      Begin
        sSqlDados.Add('       UNION ' + #13 +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
          //                    '       SELECT /*+INDEX(XB) */ ' + QuotedStr(sNomeResp)+' AS NOMERESP, '                + #13 +
          '       SELECT  ' + QuotedStr(sNomeResp) + ' AS NOMERESP, ' + #13 +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
          '              ' + QuotedStr(sDataInf) + ' AS DATAINF, ' + #13 +
          '              ' + QuotedStr(psAno) + ' AS ANO, ' + #13 +
          '              ' + QuotedStr(IntToStr(strtoint(psAno)+1)) + ' AS ANO_EXERCICIO, ' + #13 +   // Andre Imakawa - SIG 122151
          '              TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA, ' + #13 +
          '              TO_CHAR(SYSDATE, ''YYYY'') AS ANOATUAL, ' + #13 +
          //'              PT.IDPESSOA AS IDPESSJUR, '                                              + #13 +  // Edilaine - SOL 197664 / KTN 1894007
          '              DJ.IDPATRO AS IDPESSJUR, ' + #13 + // Edilaine - SOL 197664 / KTN 1894007
          '              NVL(' + QuotedStr(sDadosComp) + ', '' '' ) AS DADOSCOMP, ' + #13 +
          '              P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF, ' + #13 +

          '              P.NUMDOCUMENTO AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13); //CPrev - Pend. 27379 - 25/02/2008
        //CPrev - Pend. 27379 - Início
        //CPrev - Pend. 27379 - 25/02/2008 - '              DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, RTRIM(LTRIM(P.NUMDOCUMENTO)), ''00000000000'') AS CPF, E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ' + #13 );
        //CPrev - Pend. 27379 - Fim

        If iModeloFundacao = 1 Then
          Begin
            If piSistema = 3 Then // Folha de Resgate de Reserva
              ssqldados.Add('               NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ') //SOL 248939 PPM 997373
            Else
              //          ssqldados.Add('              ''0561''  CODNATUREZA, ''RENDIMENTO TRABALHO ASSALARIADO'' AS DESCRICAO, '  );//Marcio Sanches Spinosa SOL 247174 PPM 647931 //SOL 248939 PPM 997373
              ssqldados.Add('                NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, '); //Marcio Sanches Spinosa SOL 247174 PPM 647931 //SOL 248939 PPM 997373
          End
        Else
          Begin
            If iModeloFundacao = 2 Then
              ssqldados.Add('                NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, ') //SOL 248939 PPM 997373
            Else
              ssqldados.Add('                NAT.CODNATUREZA, NAT.DESCRICAO AS DESCRICAO, '); //SOL 248939 PPM 997373
          End;

        //William Moreira da Silva - SIG 24855/26744
        ssqlDados.Add('              P.RAZAOSOCIAL, ');
        //ssqlDados.Add('              P.RAZAOSOCIAL, EN.IDENDERECO, EN.LOGRADOURO AS ENDEREO, ' + #13 +
        //  '              EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ' + #13 +
        //  '              ES.CODESTADO AS UF, C.NUMSEED,');
        //William Moreira da Silva - SIG 24855/26744

        CdsLocalCodInforme.First;

        iCodInforme := 0;

        While Not CdsLocalCodInforme.Eof Do
          Begin
            If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13) Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '1') Or
              (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinha13 + '2') Then
              Begin
                //Bruno Bastos - SOL: 106642 - Kintana: 478070 - sSqlDados.Add('              SUM(DECODE(DJ.CODINFORME,'+CdsLocalCodInforme.fieldByname('CODINFORME').AsString+', VLRREAL, 0)) AS VLR' +
                //Bruno Bastos - SOL: 106642 - Kintana: 478070 -               CdsLocalCodInforme.fieldByname('CODINFORME').AsString+' ,')

                //Cássio Rovaroto - SIG nº 73454 - Início
                if ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
                begin
                  sSqlDados.Add('              CASE WHEN NAT.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) END AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');

                  sSqlDados.Add(' CASE WHEN NAT.CODNATUREZA IN (''0473'', ''9466'') THEN 0 ELSE SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 )) END AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG ,');
                end
                else
                begin
                //Bruno Bastos - SOL: 106642 - Kintana: 478070 - Início
                sSqlDados.Add('              DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                  CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');
                //Bruno Bastos - SOL: 106642 - Kintana: 478070 - Fim

                //Bruno Bastos - SOL: 111231 - Kintana: 513489
                sSqlDados.Add(' SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 )) AS VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '_SENEG ,');
                end;
                //Cássio Rovaroto - SIG nº 73454 - Fim
              End
            Else
              Begin
                If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib) Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '1') Or
                  (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaContrib + '2') Then
                  Begin
                    //Cássio Rovaroto - SIG nº 73545  Início
                    if ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
                      sSqlDados.Add('              CASE WHEN NAT.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                      CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )))END AS VLR' +
                      CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                    else
                    sSqlDados.Add('              DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                      CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                      CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');
                    //Cássio Rovaroto - SIG nº 73545  Fim
                  End
                Else
                  Begin
                    If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend) Or
                      (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '1') Or
                      (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = cLinhaRend + '2') Then
                      Begin
                        //Cássio Rovaroto - SIG nº 73545  Início
                        if ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
                          sSqlDados.Add('              CASE WHEN NAT.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) END AS VLR' +
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,')
                        else
                        sSqlDados.Add('              DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRREAL, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                          CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' ,');
                        //Cássio Rovaroto - SIG nº 73545 - Fim
                      End
                    Else
                      Begin
                        If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '4072') Then // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799 INICIO
                          sSqlDados.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) /*- SUM(DECODE(DJ.CODINFORME,''6062'', VLR, 0 ))*/) AS VLR' + // Edilaine - SOL 199978 / KTN 1925538
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')

                        Else If (CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '6012') Then
                          sSqlDados.Add('DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) + SUM(DECODE(DJ.CODINFORME,''6052'', VLR, 0 ))) AS VLR' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')

                        Else If CdsLocalCodInforme.fieldByname('CODINFORME').AsString = '6042' Then
                          sSqlDados.Add('              DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 )) + SUM(DECODE(DJ.CODINFORME, ''6062'', VLR, 0)))  AS VLR' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')
                        Else // RODRIGO DE BRITO FIGUEREDO SOL 199065 KINATAN 1915799 FIM
                          //Cássio Rovaroto - SIG nº 73545  Início
                          if ((pLayout2018) or (pLayout2019) or (pLayout2021)) then // Andre Imakawa - SIG 122151
                            sSqlDados.Add('              CASE WHEN NAT.CODNATUREZA = ''9466'' THEN 0 ELSE DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) END AS VLR' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ')
                          else
                          //Cássio Rovaroto - SIGº 73545 - Fim
                          sSqlDados.Add('              DECODE(SIGN( SUM(DECODE(DJ.CODINFORME,' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLRPURO, 0 ))),-1,0,SUM(DECODE(DJ.CODINFORME,' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ', VLR, 0 ))) AS VLR' +
                            CdsLocalCodInforme.fieldByname('CODINFORME').AsString + ' , ');

                      End;
                  End;
              End;

            CdsLocalCodInforme.Next;

            // Felipe A. Santos - SOL 244545.16839 PPM 624515 - início
            If ((iCodInforme = 5012) And (piSistema = 1)) Then
              Begin
                sSqlDados.Add('0 AS VLR5021, ' + #13 +
                  '0 AS VLR5022, ' + #13);
              End;
            // Felipe A. Santos - SOL 244545.16839 PPM 624515 - fim

            iCodInforme := CdsLocalCodInforme.fieldByname('CODINFORME').AsInteger;
          End;

        ssqlDados.Add('              (''-'') AS TELEFONE, (''C'') AS  TIPOTEL, DJ.IDINFORME  ' + #13);

        //CPrev - 29/01/2008 - Início
        If pbPensaoSeparada Then
          sSqlDados.Add(' , DJ.FLGPENSAOALIM ');
        ssqlDados.Add(
          //CPrev - 29/01/2008 - Fim

          '       FROM PESSOA P, ' + #13 +
          '            PESSOA E, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          //'            ENDPESS EN, ' + #13 +
          //'            ESTADO ES, ' + #13 +
          //'            PESSOA PT, '                           + #13 +  // Edilaine - SOL 197664 / KTN 1894007
          //'            CIDADES C,  ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          '            NATURENDIMENTO NAT, ');

        ssqlDados.Add('            ( ' + #13 +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Inicio
          //                    '             SELECT /*+INDEX(XB) */ XB.IDBENEFIRRF,XB.CODNATUREZA,IE.CODINFORME, '                 + #13 +

        // Paulo Nobre - TAS000000006794 - Inicio

          '             SELECT  XB.IDBENEFIRRF,    ');

          //          XB.CODNATUREZA,

          ssqlDados.Add('CASE');
          ssqlDados.Add('  WHEN XB.CODNATUREZA = ''7416'' THEN ''0561'' ');
          ssqlDados.Add('  WHEN XB.CODNATUREZA = ''7431'' THEN ''0561'' ');
          ssqlDados.Add('  WHEN XB.CODNATUREZA = ''1889'' THEN ''0561'' ');
          ssqlDados.Add('  ELSE XB.CODNATUREZA');
          ssqlDados.Add('END CODNATUREZA ,');

     {     '                     DECODE(XB.CODNATUREZA, ''7416'', ''0561'',               ' + #13 +
          '                                            ''7431'', ''0561'',      ' + #13 +
          '                                            ''1889'', ''0561'',     ' + #13 +
          '                                            XB.CODNATUREZA)  CODNATUREZA,  ' + #13 +         }

          // Paulo Nobre - TAS000000006794 - Fim     

          ssqlDados.Add('   IE.CODINFORME, ' + #13 +
          //Marcio Sanches Spinosa SOL 247267/16924 PPM 652717 - Fim
          '                    DECODE(SIGN(SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))),-1,' + #13 +
          '                           (SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))))*-1,' + #13 +
          '                           SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2)))) AS VLR ,' + #13 +
          '                    SUM(DECODE(IE.FLGNATUREZA,''N'',(TRUNC(LI.VLRLANC,2)*-1),TRUNC(LI.VLRLANC,2))) AS VLRREAL, ' + #13 +
          '                    SUM(TRUNC(LI.VLRLANC,2)) AS VLRPURO, ' + #13 +
          '                    IE.IDINFORME, ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                    XB.IDPATRO ' + #13);

        //CPrev - 29/01/2008 - Início
        If pbPensaoSeparada Then
        // Andre Imakawa - SIG 27224 - Inicio
        Begin
          If piSistema = 1 Then
             ssqlDados.Add(' ,DECODE(IE.CODINFORME,4061,0, XB.FLGPENSAOALIM) FLGPENSAOALIM  ')
          else
             sSqlDados.Add(' , XB.FLGPENSAOALIM ');
        end;
        // Andre Imakawa - SIG 27224 - Fim

        sAno := FormatDateTime('yyyy', strToDate(sPeriodoInicio));
        ssqlDados.Add(
        //CPrev - 29/01/2008 - Fim
          '             FROM LANCIRRF XB, ' + #13 +
          '                  INFORME IE, ' + #13 +
          '                  LANCXINFORME LI ');

        //Bruno Bastos - Kintana: 478069 SOL: 106641 - if (( pbUsaLista ) and ( piIdListaUsuario > 0 )) and ( pfIDPessoa = -1999 ) Then
        //Bruno Bastos - Kintana: 478069 SOL: 106641 -   ssqlDados.Add(', LISTAFOLHABENEFDET LD ');
        //Vinicius Maciel - SOL 173637 - KINTANA 1567006
        //ssqlDados.Add('  ,(SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA, IDINFORME FROM INFORME WHERE ANOVIGENCIA <='+sAno+' GROUP BY IDINFORME ) QAN ' );  //Vinicius Maciel - SOL 168331 - KTN 1482898
        // Andre Imakawa - SIG 122151 - Inicio
        if pLayout2021 then
          ssqlDados.Add(
          '                      ,(SELECT IDINFORME, ANOVIGENCIA FROM INFORME                                          ' + #13#10 +
          '                      WHERE (IDINFORME, ANOVIGENCIA) IN (SELECT IDINFORME, MAX(ANOVIGENCIA)                ' + #13#10 +
          '                      FROM INFORME WHERE  ANOVIGENCIA <= ' + psAno                                           + #13#10 +
          '                      GROUP BY IDINFORME )) AUX                                                            ' + #13#10 )
        Else
          ssqlDados.Add('                    ,INFORMEAUX AUX ');
        // Andre Imakawa - SIG 122151 - Fim


        //Vinicius Maciel - SOL 173637 - KINTANA 1567006 - FIM
        ssqlDados.Add(' WHERE ');

        //bruno bastos - teste - 11/02/2011 - Início
        If (trim(sExcluiCPF) <> '') Then
          ssqlDados.Add(' (XB.IDBENEFIRRF  not in (select idpessoa from pessoa where numdocumento in (' + sExcluiCPF + '))) AND ');
        //bruno bastos - teste - 11/02/2011 - Fim

        If pfIDPessoa <> -1999 Then
          Begin
          //        ssqlDados.Add('                    (XB.IDBENEFIRRF   = ' + QuotedStr(FloatToStr(pfIdPessoa)) + ') AND ' );
          //        Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
          //        sSqlDados.Add('                      (XB.IDBENEFIRRF in (select idpessoa from pessoa where numdocumento in '+#13#10+
          //                      '                                         (select numdocumento from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + '))) AND ' );
          //Vander - SOL: 190550 - Kintana: 1802481
          //sSqlDados.Add('                      (XB.IDBENEFIRRF in (select idpessoa from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + ')) AND ' );
          //            SetIdPessoa(sSqlDados, '                      (XB.IDBENEFIRRF in (select idpessoa from pessoa where idpessoa ' + _SQL_IDPESSOA + ')) AND ');

            SetIdPessoa(sSqlDados, '                      (XB.IDBENEFIRRF ' + _SQL_IDPESSOA + ') AND ');

          //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM
          End
        Else
          Begin
            If ((pbUsaLista) And (piIdListaUsuario > 0)) Then
              Begin
                //Bruno Bastos - Kintana: 478069 SOL: 106641 - ssqlDados.Add( ' (XB.IDBENEFIRRF = LD.IDPESSOA) '+ #13 +
                //Bruno Bastos - Kintana: 478069 SOL: 106641 -                ' AND (LD.IDLISTA     = '+ IntToStr(piIdListaUsuario) +') AND ');
                //Bruno Bastos - Kintana: 478069 SOL: 106641 - Início
                //        sSqlDados.Add( ' (XB.IDBENEFIRRF IN (  SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO IN ');
                //        sSqlDados.Add( '  (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA IN (  SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = '+ QuotedStr(IntToStr(piIdListaUsuario)) +')))) AND'+ #13) ;//Marcio Sanches Spinosa SOL  PPM 647931
                sSqlDados.Add(' (XB.IDBENEFIRRF IN (  SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = ' + QuotedStr(IntToStr(piIdListaUsuario)) + ')) AND' + #13); //Marcio Sanches Spinosa SOL 247267 PPM 647931

                //Bruno Bastos - Kintana: 478069 SOL: 106641 - Fim

              End;
          End;

        {      if not pbPensaoSeparada then
              begin
                If pbPensao then
                Begin
                  ssqlDados.Add('                    (XB.IDBENEFIRRF   IN (SELECT IDFAVORECIDO '                      + #13 +
                                '                                          FROM RUBRICAINDIV   '                      + #13 +
                                '                                          WHERE IDFAVORECIDO      = XB.IDBENEFIRRF ' + #13 +
                                '                                            AND RUBRICAPROVENTOPA IS NOT NULL '      + #13 +
                                '                                            AND FLGPENSAOALIM     = 1 '              + #13 +
                                '                                            AND (DATAFINAL        > TO_DATE('+ QuotedStr( sPeriodoInicio ) +',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) ');
                End
                Else
                Begin
                  ssqlDados.Add('                    (XB.IDBENEFIRRF   NOT IN (SELECT IDFAVORECIDO '                      + #13 +
                                '                                              FROM RUBRICAINDIV '                        + #13 +
                                '                                              WHERE IDFAVORECIDO      = XB.IDBENEFIRRF ' + #13 +
                                '                                                AND RUBRICAPROVENTOPA IS NOT NULL '      + #13 +
                                '                                                AND FLGPENSAOALIM     = 1 '              + #13 +
                                '                                                AND (DATAFINAL        > TO_DATE('+ QuotedStr( sPeriodoInicio ) +',''DD/MM/YYYY'') OR DATAFINAL IS NULL))) ');
                End;
              end
              else}
        Begin
          If pbPensao Then
            Begin
              sSqlDados.Add(' (XB.FLGPENSAOALIM = 2) ')
            End
          Else
            Begin
              sSqlDados.Add(' ((XB.FLGPENSAOALIM = 0) or (XB.FLGPENSAOALIM = 2 AND LI.IDINFORME = 60)) ')
            End;
        End;

        sSqlDados.Add('                AND (LI.IDLANCIRRF = XB.IDLANCIRRF) ' + #13 +
          //'                AND (NVL(LI.FLGTIPOREG,''N'') <> ''D'') '                                                + #13 +  // Edilaine - SOL 199978 / KTN 1925538
          //Vinicius Maciel - SOL 173637 - KINTANA 1567006
          //'                AND (LI.IDINFORME = IE.IDINFORME) '                                                        + #13 +

          ' AND (LI.IDINFORME       = AUX.IDINFORME) ' + #13 +
          ' AND (AUX.IDINFORME      = IE.IDINFORME)  ' + #13 +
          ' AND (AUX.ANOVIGENCIA    = IE.ANOVIGENCIA)' + #13 +

          //Vinicius Maciel - SOL 173637 - KINTANA 1567006 - FIM

          '                AND (XB.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' + #13 +
          '                                          AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' + #13 +

          //Vinicius Maciel - SOL 168331 - KTN 1482898
          //'                AND (XB.CODNATUREZA IN (''7416'',''7431'')) ');
          //Vinicius Maciel SOL 170987 KTN 1528710
          //'                AND (XB.CODNATUREZA IN (''7416'',''7431'')) ' + #13 +//);
          //'                AND (XB.CODNATUREZA IN (''7416'',''7431'',''1889'')) ' );
          '                AND (XB.CODNATUREZA IN (''7416'',''7431'',''1889'')) ');
          //William Moreira da Silva - Sol 223220 - Kintana 2057177
          //'                AND (XB.CODNATUREZA   NOT IN (''8888'', ''7893'')) '+   //);

          //William Moreira da Silva - Sol 223696 - Kintana 2057501
          // Thiago Melo SOL 223141.15622 Kintana 2057248
          //if piSistema <> 0 then
        If piSistema = 1 Then
          // Thiago Melo SOL 223141.15622 Kintana 2057248
          Begin
          //William Moreira da Silva - Sol 223220 - Kintana 2057177
          //Marcio Sanches Spinosa SOL 247267/16925 PPM 652769 - inicio
          //                        sSqlDados.Add('             AND EXISTS (SELECT 1 FROM HISTRUBSAL H        '+
          //                        '             WHERE H.IDPESSOA = XB.IDBENEFIRRF '+
          //                        '             AND   H.MESCOBRANCA BETWEEN ' + QuotedStr( psAno + '/01' ) + ' AND ' + QuotedStr( psAno + '/12' ) +
          //                        // Thiago Melo SOL 223141.15622 Kintana 2057248
          //                        //'             AND   H.CODIRRFDARF = XB.CODNATUREZA '+
          //                        // Thiago Melo SOL 223141.15622 Kintana 2057248
          //                        '             AND   (H.IDINFORME = 49 OR H.IDINFORME = 45 OR H.IDINFORME = 201 OR H.IDINFORME = 97 OR H.IDINFORME = 98)) ');   //Xavier  ad idinforme 97 e 98
          //William Moreira da Silva - Sol 223220 - Kintana 2057177
          //Marcio Sanches Spinosa SOL 247267/16925 PPM 652769 - Fim
          End;
          //William Moreira da Silva - Sol 223696 - Kintana 2057501

          //Vinicius Maciel SOL 170987 KTN 1528710 - FIM
          //Vinicius Maciel - SOL 173637 - KINTANA 1567006
          //'                AND (IE.IDINFORME = QAN.IDINFORME)'+ #13 +
          //'                AND (IE.ANOVIGENCIA = QAN.ANOVIGENCIA)');
          //Vinicius Maciel - SOL 173637 - KINTANA 1567006
          //Vinicius Maciel - SOL 168331 - KTN 1482898 - FIM

        // Paulo Nobre - TAS000000006794 - Inicio

        sSqlDados.Add('   GROUP BY XB.IDBENEFIRRF, ');
          //          '                      XB.CODNATUREZA, ' + #13 +

        ssqlDados.Add('CASE');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''7416'' THEN ''0561'' ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''7431'' THEN ''0561'' ');
        ssqlDados.Add('  WHEN XB.CODNATUREZA = ''1889'' THEN ''0561'' ');
        ssqlDados.Add('  ELSE XB.CODNATUREZA                          ');
        ssqlDados.Add('END,                                           ');

     {     '                        DECODE(XB.CODNATUREZA, ''7416'', ''0561'',      ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
          '                                            ''7431'', ''0561'',      ' + #13 +
          '                                            ''1889'', ''0561'',     ' + #13 +
          '                                            XB.CODNATUREZA),  ' + #13 +       }

        ssqlDados.Add('     IE.CODINFORME, ' + #13 +

        // Paulo Nobre - TAS000000006794 - Fim

        '                      IE.IDINFORME, ' + #13 + // Paulo Nobre - SOL 257831/18009 PPM 1207646
        '                      XB.IDPATRO ');

          //CPrev - 29/01/2008 - Início
        If pbPensaoSeparada Then
          sSqlDados.Add(' , XB.FLGPENSAOALIM) DJ ')
        Else
          sSqlDados.Add(' ) DJ ');
          //CPrev - 29/01/2008 - Fim

        sSqlDados.Add('       WHERE (P.TIPO           = ''F'')' + #13 +
          '         AND (E.IDPESSOA       = ' + IntToStr(piIdEmpresaProp) + ') ');
        //William Moreira da Silva - SIG 24855/26744

        //sSqlDados.Add('         AND (EN.IDENDERECO(+) = P.IDENDCORRESP) ' + #13 +
        //  '         AND (EN.IDPESSOA(+)   = P.IDPESSOA) ' + #13 +
        //  '         AND (EN.IDCIDADES     = C.IDCIDADES(+)) ' + #13 +
        //  '         AND (ES.IDESTADO(+)   = C.IDESTADO) ' + #13 +
          sSqlDados.Add('         AND (NAT.CODNATUREZA  = DJ.CODNATUREZA) ' + #13 +
       //William Moreira da Silva - SIG 24855/26744
          '         AND (DJ.IDBENEFIRRF   = P.IDPESSOA) ' + #13 +

          //'         AND (PT.IDPESSOA      = DJ.IDPATRO) '                                           + #13 +   // Edilaine - SOL 197664 / KTN 1894007

          '         AND RTRIM(LTRIM(DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, P.NUMDOCUMENTO, ''00000000000''))) <> ''00000000000'' ' + #13 + //CPrev - 25/02/2008
          '       GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ' + #13 + //CPrev - Pend. 27379 - 25/02/2008

          //CPrev - Pend. 27379 - Início
          //CPrev - Pend. 27379 - 25/02/2008 - '       GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL, DECODE(LENGTH(RTRIM(LTRIM(P.NUMDOCUMENTO))), 11, RTRIM(LTRIM(P.NUMDOCUMENTO)), ''00000000000''), ' + #13 +
          //CPrev - Pend. 27379 - Fim

          '                E.NUMDOCUMENTO,  E.RAZAOSOCIAL, NAT.CODNATUREZA,  NAT.DESCRICAO, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          //'                EN.IDENDERECO, EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, EN.NUMERO, ' + #13 +
          //'                EN.BAIRRO,  C.NOME,  EN.CEP, ES.CODESTADO, C.NUMSEED, ' + #13 +
          //William Moreira da Silva - SIG 24855/26744
          
          //' PT.IDPESSOA ') ; // Edilaine - SOL 197664 / KTN 1894007

          '                DJ.IDPATRO, DJ.IDINFORME '); // Edilaine - SOL 197664 / KTN 1894007
          //CPrev - 29/01/2008 - Início
        If pbPensaoSeparada Then
          sSqlDados.Add(' , DJ.FLGPENSAOALIM ');
          //CPrev - 29/01/2008 - Fim

      End;

    sSqlDados.Add(' ) X, '); //CPREV - Pend. 26341

   {// Paulo Nobre SOL 269300 PPM 1293033
    sSqlDados.Add('       ( ' + #13 +
      '       SELECT ' + #13 +
      '              E.MATRICULA, E.IDPESSOA, E.IDPESSJUR ' + #13 + //William Moreira da Silva - Sol 223696 - Kintana 2057501
      '       FROM ' + #13 +
      '            ELEGPATRO E, ' + #13 +
      '            PARTPREVPLAN P ' + #13 +
      '       WHERE ' + #13 +
      '             (E.IDPESSJUR     = P.IDPESSJUR) ' + #13 +
      '         AND (E.IDPESSOA      = P.IDPESSOA) ' + #13 +
      '         AND (P.FLGDESATIVADO = 0)) B '); //   + #13 +   }
    // 'WHERE '                                      + #13 +
    // '      (X.IDPESSOA       = B.IDPESSOA(+)) ' );
    //    sSqlDados.Add(' ,(select sum(l.qtdmeses) as qtdmeses,l.idbenefirrf from lancirrf l where ');
    //Vinicius Maciel SOL 170987 KTN 152871
    // Paulo Nobre SOL 269300 PPM 1293033
    //    sSqlDados.Add(' (select sum(l.qtdmeses) as qtdmeses,l.idbenefirrf from lancirrf l where ');
    sSqlDados.Add('(select p.numdocumento cpf, sum(l.qtdmeses) as qtdmeses  ');
    sSqlDados.Add(' from lancirrf l, pessoa p  ');
    sSqlDados.Add(' where p.idpessoa = l.idbenefirrf And        ');

    If pfIDPessoa <> -1999 Then
    //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
    //    sSqlDados.Add('l.idbenefirrf IN (select idpessoa from pessoa where numdocumento in (select numdocumento from pessoa where idpessoa =' + FloatToStr(pfIdPessoa) + ')) and ') //Vinicius Maciel - SOL 173817 - KINTANA 1568367
    //Vander - SOL: 190550 - Kintana: 1802481
    //sSqlDados.Add('l.idbenefirrf IN (select idpessoa from pessoa where  idpessoa =' + FloatToStr(pfIdPessoa) + ') and ') //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - INICIO
    //      SetIdPessoa(sSqlDados, 'l.idbenefirrf IN (select idpessoa from pessoa where  idpessoa ' + _SQL_IDPESSOA + ') and ')

      SetIdPessoa(sSqlDados, 'l.idbenefirrf ' + _SQL_IDPESSOA + ' and ')

    //Marcio Sanches Spinosa SOL 182769 KINTANA: 1705106 - FIM
    Else
      Begin
        If ((pbUsaLista) And (piIdListaUsuario > 0)) Then
          Begin
            //        sSqlDados.Add( ' (L.IDBENEFIRRF IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO IN');
            //        sSqlDados.Add( ' (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = '+ QuotedStr(IntToStr(piIdListaUsuario)) +'))))') ;//Marcio Sanches Spinosa SOL 247267 PPM 647931
            sSqlDados.Add(' (L.IDBENEFIRRF IN (SELECT LD.IDPESSOA FROM LISTAFOLHABENEFDET LD WHERE LD.IDLISTA = ' + QuotedStr(IntToStr(piIdListaUsuario)) + '))'); //Marcio Sanches Spinosa SOL 247267 PPM 647931

            sSqlDados.Add(' and '); //Vinicius Maciel - SOL 173817 - KINTANA 1568367
          End;
      End;
    sSqlDados.Add('l.datalancamento >= to_date(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') and l.datalancamento <= to_date(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'') ' + #13 +
      ' AND L.CODNATUREZA = ''1889'' ' + // Edilaine - SOL 197664 / KTN 1894007

        // Paulo Nobre SOL 269300 PPM 1293033
        //  ' group by l.idbenefirrf ) C ');

      ' group by p.numdocumento ) C ');
      //Luiz Carlos - SIG64274 - Inicio
      //if pbEliminaZerados then                      //Darivaldo Alencar SIG66013
      if (pbEliminaZerados) or (piSistema <> 1) or (piModelo = 153)  then   //Darivaldo Alencar SIG66013         //edilaine - SIG87715
      begin
        //William Moreira da Silva - SIG 24855/26744
        sSqlDados.Add(' ,   ( SELECT EN.LOGRADOURO AS ENDEREO, EN.NUMERO, EN.COMPLEMENTO,   '+
                      '       EN.BAIRRO, C.NOME, en.cep, Es.Codestado AS UF, C.Numseed, EN.IDENDERECO '+
                      '       FROM ENDPESS EN, ESTADO ES, CIDADES C  '+
                      '       WHERE (EN.IDCIDADES = C.IDCIDADES(+))  '+
                      '       AND (ES.IDESTADO(+)   = C.IDESTADO)) ENDERECO ');
        //William Moreira da Silva - SIG 24855/26744
      end;
      //Luiz Carlos - SIG64274 - Fim

    sSqlDados.Add('WHERE (X.CPF = C.CPF(+)) ');

    //Luiz Carlos - SIG64274 - Inicio
    //if pbEliminaZerados then                      //Darivaldo Alencar SIG66013
    if (pbEliminaZerados) or (piSistema <> 1) or (piModelo = 153) then   //Darivaldo Alencar SIG66013       //edilaine - SIG87715
    begin
      //Taffarel - SIG66333 - início
      //William Moreira da Silva - SIG 24855/26744
      //sSqlDados.Add(' AND ENDERECO.IDENDERECO = (SELECT MAX(IDENDERECO) '+
      //              '   FROM ENDPESS                                     '+
      //              '   WHERE IDPESSOA IN (SELECT IDPESSOA               '+
      //              '                  FROM PESSOA                       ');
      sSqlDados.Add(' AND ENDERECO.IDENDERECO = (SELECT MAX(NVL(IDENDCORRESP,IDENDCOBRANCA))  '+
                    ' FROM PESSOA ');
      //Taffarel - SIG66333 - fim
                    //'                  WHERE NUMDOCUMENTO = X.CPF))      ');    //Luiz Carlos - SIG42347
      //William Moreira da Silva - SIG 24855/26744

      //Taffarel - SIG66333 - início
      //Luiz Carlos - SIG42347 - inicio
      if pbEliminaZerados or not pbPensao then
         //sSqlDados.Add(' WHERE NUMDOCUMENTO = X.CPF)) ')
         sSqlDados.Add(' WHERE NUMDOCUMENTO = X.CPF) ')
      else
         //sSqlDados.Add(' WHERE NUMDOCUMENTO = PES.NUMDOCUMENTO)) ');
         sSqlDados.Add(' WHERE NUMDOCUMENTO = PES.NUMDOCUMENTO) ');
      //Luiz Carlos - SIG42347 - fim
      //Taffarel - SIG66333 - fim
    end;
    //Luiz Carlos - SIG64274 - Fim
    //    '      (X.IDPESSOA       = B.IDPESSOA(+))   ' +
    //    ' AND (X.IDPESSJUR      = B.IDPESSJUR(+)) '); //William Moreira da Silva - Sol 223696 - Kintana 2057501
    //    sSqlDados.Add('  AND (X.IDPESSOA       = C.IDBENEFIRRF(+)) '); // Edilaine - SOL 197664 / KTN 1894007
    //sSqlDados.Add('  (X.IDPESSOA       = C.IDBENEFIRRF(+)) '); // Edilaine - SOL 197664 / KTN 1894007
    //    sSqlDados.Add('  (X.CPF = C.CPF(+)) '); // Edilaine - SOL 197664 / KTN 1894007
    //    sSqlDados.Add(' AND (X.IDPESSOA = C.IDBENEFIRRF) '); //Vinicius Maciel SOL 170987 KTN 152871 -FIM

    If pbPensao Then
      Begin
        if not (pLayout2019Pensao) then   //Rafael SIG 96222
            sSqlDados.Add('  AND (ALI.NUMDOCUMENTO = X.CPF) ' + #13 +
          '  AND (ALI.IDPESSOA     = X.IDPESSOA) ' + #13 +
          //                    '  AND (RUB.IDFAVORECIDO = ALI.IDPESSOA) '   + #13 +
          '  AND (RUB.NUMDOCUMENTO = ALI.NUMDOCUMENTO) ' + #13 +
          '  AND (PES.IDPESSOA     = RUB.IDPESSOA) ' + #13 +
          '  AND (EN.IDENDERECO(+) = PES.IDENDCORRESP) ' + #13 +
          '  AND (EN.IDPESSOA(+)   = PES.IDPESSOA) ' + #13 +
          '  AND (EN.IDCIDADES     = C.IDCIDADES(+)) ' + #13 +
          '  AND (ES.IDESTADO(+)   = C.IDESTADO) ')
        else     //Rafael SIG 96222
                    sSqlDados.Add('  AND (RUB.NUMDOCUMENTO = X.CPF) ' + #13 +
          '  AND (PES.IDPESSOA     = RUB.IDPESSOA) ' + #13 +
          '  AND (EN.IDENDERECO(+) = PES.IDENDCORRESP) ' + #13 +
          '  AND (EN.IDPESSOA(+)   = PES.IDPESSOA) ' + #13 +
          '  AND (EN.IDCIDADES     = C.IDCIDADES(+)) ' + #13 +
          '  AND (ES.IDESTADO(+)   = C.IDESTADO) ');


        If iModeloFundacao = 1 Then
          Begin
            //CPrev - 25/02/2008 - sSqlDados.Add('AND X.CPF IS NOT NULL AND X.CPF <> ''00000000000''');
            sSqlDados.Add('AND X.CPF IS NOT NULL AND DECODE(LENGTH(RTRIM(LTRIM(X.CPF))), 11, X.CPF, ''00000000000'') <> ''00000000000'''); //CPrev - 25/02/2008
          End;
      End;

    //CPrev - 27302 - Inicio
    {if not pbPensaoSeparada then
    begin
      if pbPensao then
      Begin
         sSqlDados.Add('  AND (RUB.RUBRICAPROVENTOPA IS NOT NULL) ' +
                       '  AND (RUB.FLGPENSAOALIM = 1)'              +
                       '  AND (RUB.FLGDESATIVADO = 0)'              +
                       '  AND (DATAFINAL > TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' +
                       '   OR (DATAFINAL IS NULL))');
      End;
    end
    else
    begin
      if pbPensao then
      begin
        sSqlDados.Add('  AND (X.FLGPENSAOALIM = 2)')
      end
      Else
      begin
        sSqlDados.Add('  AND (X.FLGPENSAOALIM = 0)')
      end;
    end;        }
    //CPrev - 27302 - Fim

    If Not pbPensao Then
      Begin
        sSqlDados.Add('GROUP BY ');

        sSqlDados.Add('         X.NOMERESP, X.DATAINF, X.ANO_EXERCICIO, X.ANO, X.DATA, X.ANOATUAL,  X.DADOSCOMP, /* X.IDPESSOA,*/  UPPER(TRIM(X.NOMEBENEF)),' + #13 + // Andre Imakawa - SIG 122151
          '         X.CPF, X.CGC, X.FONTE, X.TIPO, X.CODNATUREZA,  UPPER(X.DESCRICAO), UPPER(TRIM(X.RAZAOSOCIAL)) ');

          // Paulo Nobre SOL 268555 PPM 1262100
          //          '         B.MATRICULA, ' + #13 +
          //          '         X.IDENDERECO,  ' + #13 +

          //William Moreira da Silva - SIG 24855/26744
          //Luiz Carlos - SIG64274 - Inicio
          //if pbEliminaZerados  then                     //Darivaldo Alencar SIG66013
          if (pbEliminaZerados) or (piSistema <> 1) or (piModelo = 153) then //Darivaldo Alencar SIG66013         //edilaine - SIG87715
          begin
            sSqlDados.Add(' ,ENDERECO.ENDEREO, '+
            ' ENDERECO.NUMERO, ENDERECO.COMPLEMENTO, ENDERECO.BAIRRO, '+
            ' ENDERECO.NOME, ENDERECO.CEP, ENDERECO.UF, ENDERECO.NUMSEED ');
          end;
          //'X.ENDEREO, X.NUMERO, X.COMPLEMENTO, X.BAIRRO, X.NOME,  X.CEP, X.UF, X.NUMSEED ');
          //William Moreira da Silva - SIG 24855/26744

          // sSqlDados.Add('       , X.IDPESSJUR '); //Cprev - 27304

        sSqlDados.Add(', C.QTDMESES   '); //Vinicius Maciel SOL 170987 KTN 152871
      End
    Else
      Begin
        //CPrev - 22/01/2008
        //If iTipoCliente = 19991 Then
        //Begin

        sSqlDados.Add('GROUP BY ' + #13 +
          '         PES.NOME, PES.NUMDOCUMENTO, EN.LOGRADOURO, EN.NUMERO, ' + #13 +
          '         EN.COMPLEMENTO, EN.BAIRRO, C.NOME, EN.CEP, ES.CODESTADO, ');
        sSqlDados.Add(' C.QTDMESES,   '); //Vinicius Maciel SOL 170987 KTN 152871
        sSqlDados.Add(' X.NOMERESP, X.DATAINF, X.ANO_EXERCICIO, X.ANO, X.DATA, X.ANOATUAL,  X.DADOSCOMP, /* X.IDPESSOA,*/  UPPER(TRIM(X.NOMEBENEF)),' + #13 + // Andre Imakawa - SIG 122151
          ' X.CPF, X.CGC, X.FONTE, X.IDPESSJUR, X.TIPO, X.CODNATUREZA,  UPPER(X.DESCRICAO), UPPER(TRIM(X.RAZAOSOCIAL)) '); //Luiz Carlos - SIG64995 - Inicio/Fim

          // Paulo Nobre SOL 268555 PPM 1262100
          //          '         B.MATRICULA, ' + #13 +
          //          '         X.IDENDERECO, ' + #13 +

          //William Moreira da Silva - SIG 24855/26744
          //Luiz Carlos - SIG64995 - Inicio
          if (pbEliminaZerados) or (piSistema <> 1) or (piModelo = 153) then     //edilaine - SIG87715
          begin
             sSqlDados.Add(' ,ENDERECO.ENDEREO, '+
             ' ENDERECO.NUMERO, ENDERECO.COMPLEMENTO, ENDERECO.BAIRRO, '+
             ' ENDERECO.NOME, ENDERECO.CEP, ENDERECO.UF, ENDERECO.NUMSEED ');
          end;
          //Luiz Carlos - SIG64995 - Fim

          //'X.ENDEREO, X.NUMERO, X.COMPLEMENTO, X.BAIRRO, X.NOME,  X.CEP, X.UF, X.NUMSEED ');
          //William Moreira da Silva - SIG 24855/26744

          //sSqlDados.Add('       , X.IDPESSJUR '); //CPrev - 27304

        CdsLocalCodInforme.First;
        if (piModelo <> 35) then //William Santana - SOL 269789 PPM 1312365
        While Not CdsLocalCodInforme.Eof Do
          Begin
            sSqlDados.Add('       , VLR' + CdsLocalCodInforme.fieldByname('CODINFORME').AsString + '');
            CdsLocalCodInforme.Next;
          End;
          //CPrev - 22/01/2008 - End;
      End;

    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início
    If piSistema = 0 Then
      sSqlDados.Add(' , X.ENDERECO_FUND, ' +
        'X.NUMERO_FUND, ' +
        'X.COMPLEMENTO_FUND,' +
        'X.BAIRRO_FUND,' +
        'X.CIDADE_FUND,' +
        'X.CEP_FUND,' +
        'X.TELEFONE_FUND, ' +
        'X.UF_FUND,' +
        'X.NUMSEED_FUND,' +
        'X.LOTACAO ');
    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início

    //CPrev - 29/01/2008 - Início
    If pbPensaoSeparada Then
      sSqlDados.Add(' ,X.FLGPENSAOALIM ');
    //CPrev - 29/01/2008 - Fim

    //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 16/01/2009 - Início
    //Fernando Xavier SOL 226163 Kintana 2059950 - Inicio
    If Not bAgrupaCPF Then
      Begin
        Case piIndiceOrd Of
          0: sSqlDados.Add('ORDER BY  RAZAOSOCIAL, X.CODNATUREZA ');
          1: sSqlDados.Add('ORDER BY  CPF, X.CODNATUREZA ');
          2: sSqlDados.Add('ORDER BY  /*B.MATRICULA,*/ X.CODNATUREZA ');
          //3: sSqlDados.Add('ORDER BY  X.CEP, X.CODNATUREZA '); //Bruno Bastos - Sol: 131338 - Kintana: 746878
          //William Moreira da Silva - SIG 24855/26744
          3: If piModelo = 153 Then sSqlDados.Add(' ORDER BY CEPINDEXADOR, X.CODNATUREZA ') Else sSqlDados.Add('ORDER BY  ENDERECO.CEP, X.CODNATUREZA ');
          //3: If piModelo = 153 Then sSqlDados.Add(' ORDER BY CEPINDEXADOR, X.CODNATUREZA ') Else sSqlDados.Add('ORDER BY  X.CEP, X.CODNATUREZA '); //Bruno Bastos - Sol: 131338 - Kintana: 746878 //SOL 248939 PPM 997373
          //William Moreira da Silva - SIG 24855/26744
        End;
      End
    Else
      Begin
        Case piIndiceOrd Of
          //-1: sSqlDados.Add('ORDER BY  X.CEP '); //Marcio Sanches Spinosa SOL 247324 PPM 653497
          -1:
             //Luiz Carlos - SIG64995 - Inicio
             begin
                If piModelo = 153 Then
                   sSqlDados.Add(' ORDER BY CEPINDEXADOR ')
                Else
                if pbEliminaZerados then
                   sSqlDados.Add('ORDER BY  ENDERECO.CEP'); //Bruno Bastos - Sol: 131338 - Kintana: 746878 //SOL 248939 PPM 997373 // Andre Imakawa - SIG 29212
             end;
             //Luiz Carlos - SIG64995 - Fim
          0: sSqlDados.Add('ORDER BY  RAZAOSOCIAL, X.CODNATUREZA ');
          1: sSqlDados.Add('ORDER BY  CPF, X.CODNATUREZA ');
          2: sSqlDados.Add('ORDER BY  /*B.MATRICULA,*/ X.CODNATUREZA ');
          //3: sSqlDados.Add('ORDER BY  X.CEP, X.CODNATUREZA '); //Bruno Bastos - Sol: 131338 - Kintana: 746878

          //William Moreira da Silva - SIG 24855/26744
          3: If piModelo = 153 Then sSqlDados.Add(' ORDER BY CEPINDEXADOR, X.CODNATUREZA ') Else sSqlDados.Add('ORDER BY  ENDERECO.CEP, X.CODNATUREZA ');
          //3: If piModelo = 153 Then sSqlDados.Add(' ORDER BY CEPINDEXADOR, X.CODNATUREZA ') Else sSqlDados.Add('ORDER BY  X.CEP, X.CODNATUREZA '); //Bruno Bastos - Sol: 131338 - Kintana: 746878 //SOL 248939 PPM 997373
          //William Moreira da Silva - SIG 24855/26744
        End;

      End;
        //      sSqlDados.Add('ORDER BY  CPF, X.CODNATUREZA');
        //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 16/01/2009 - sSqlDados.Add('ORDER BY  X.CEP, X.RAZAOSOCIAL, X.CODNATUREZA ');
        //Bruno Bastos - SOL: 103796 - Kintana: 463663 - 16/01/2009 - Fim


    // edilaine - SIG 19602 - INICIO
    // soma as linhas de totais para eliminar informes que estejam com valores zerados. Caso seja criado outro totalizador
    // (campo do tipo TOT) acrescentar na condição WHERE. O campo TOT901 não é necessário
    if pbEliminaZerados then
    begin
//      sSqlDados.text := 'SELECT INF.* FROM ( ' + sSqlDados.text +' ) INF '+   //Everson Cunha - SIG78304 - Tibero
      sSqlDados.text := 'SELECT /*+ USE_HASH(XB LI) */ INF.* FROM ( ' + sSqlDados.text +' ) INF '+  //Everson Cunha - SIG78304 - Tibero
                        ' WHERE (INF.TOT301+INF.TOT302+INF.TOT303+INF.TOT304+INF.TOT305+   '+
                        '        INF.TOT401+INF.TOT402+INF.TOT403+INF.TOT404+INF.TOT405+   '+
                        '        INF.TOT406+INF.TOT407+INF.TOT408+                         ';

      // Andre Imakawa - SIG 122151 - Inicio                        
      if pLayout2021 then
        sSqlDados.text := sSqlDados.text + ' INF.TOT401_L2+INF.TOT410+ ';
      sSqlDados.text := sSqlDados.text +
      // Andre Imakawa - SIG 122151 - Fim

                        '        INF.TOT501+INF.TOT502+INF.TOT503 + INF.TOT601 + INF.TOT701 + '+ // Andre Imakawa - SIG 40753
                        '        INF.VLR6012 + INF.VLR6022 + INF.VLR6032 + INF.VLR6042) > 0 '; // Andre Imakawa - SIG 40753
    end;
    // edilaine - SIG 19602 - FIM


        //sSqlDados.SaveToFile('c:\Teste.txt');
    sSqlDados.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\Teste_CPF.txt'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    // Alteração feita por Arnaldo V. Scarin em 21/09/2010
    // Esse método inclue um select para somar por cpf, para resolver o agrupamento necessário,
    // mas por conta disso, serão necessários fazer selects adicionais, para incluir as colunas que não puderam
    // participar do select original, devido à diferença de dados, para que a soma das colunas não

//    AlterSession('Y'); // SIG 85090 - Osni Cavalcante

    If Not bAgrupaCPF Then
      Begin
        Result := GetDataPacket(sSqlDados.GetText);
        //   Result := AcertaEnderecoFaltante(Result);
      End
    Else
      Begin
        oSql := TCmClientDataSet.Create(Nil);
        oSqlResult := TCmClientDataSet.Create(Nil);
        oSqlEndereco := TCmClientDataSet.Create(Nil);
        //      cmDebugToFile('Query Informe','c:\planus\temp\DebugInforme.txt');
        if (piModelo <> 35) then //William Santana - SOL 269789 PPM 1312365
        oSql.Data := GetDataPacket(sSqlDados.GetText);
        //      cmDebugToFile('Query Informe','c:\planus\temp\DebugInforme.txt');
        //      cmDebugToFile('Query Informe Vazia','c:\planus\temp\DebugInforme.txt');
        if (piModelo <> 35) then //William Santana - SOL 269789 PPM 1312365
        oSqlResult.Data := GetDataPacket(AcertaSql(sSqlDados.GetText));
        //      cmDebugToFile('Query Informe Vazia','c:\planus\temp\DebugInforme.txt');
        //      cmDebugToFile('Acerta Busca Por Cpf','c:\planus\temp\DebugInforme.txt');
        if (piModelo <> 35) then //William Santana - SOL 269789 PPM 1312365
        AcertaBuscaPorCPF(oSql, oSqlResult, oSqlEndereco, sPeriodoInicio, sPeriodoFinal, pbPensao);
        //      cmDebugToFile('Acerta Busca Por Cpf','c:\planus\temp\DebugInforme.txt');
        //      case piIndiceOrd of
        //        0: oSqlResult.IndexFieldNames := 'RAZAOSOCIAL, CODNATUREZA';
        //        1: oSqlResult.IndexFieldNames := 'CPF, CODNATUREZA';
        //        2: oSqlResult.IndexFieldNames := 'MATRICULA, CODNATUREZA';
        //        3: oSqlResult.IndexFieldNames := 'CEP, CODNATUREZA'; //Bruno Bastos - Sol: 131338 - Kintana: 746878
        //      end;
        //Fernando Xavier SOL 226163 Kintana 2059950 - fim
        if (piModelo = 35) then oSqlResult.Data := GetDataPacket(sSqlDados.GetText); //William Santana - SOL 269789 PPM 1312365


        Result := oSqlResult.Data;
        oSql.Close;
        oSqlResult.Close;
        oSqlEndereco.Close;
        FreeAndNil(oSql);
        FreeAndNil(oSqlResult);
        FreeAndNil(oSqlEndereco);
      End;

//      AlterSession('N'); // SIG 85090 - Osni Cavalcante

  Finally
    CdsLocalCodInforme.Close;

    FreeAndNil(CdsLocalCodInforme);
  End;
End;

Function TCtrlInformeRendimentos.AcertaEnderecoFaltante(Const oDadosSql: OleVariant): OleVariant;
Const aLocal: Array[1..9] Of String = ('IdEndereco', 'ENDEREO', 'NUMERO', 'COMPLEMENTO',
    'BAIRRO', 'nome', 'CEP', 'UF', 'NUMSEED');

Var oSql: TCmClientDataSet;
  oEndereco: TCmClientDataSet;

  Procedure AtualizaEndereco();
  Var nCount: Integer;
    sLocal: String;
  Begin
    For nCount := Low(aLocal) To High(aLocal) Do
      Begin
        sLocal := aLocal[nCount];
        If (oSql.FindField(sLocal) <> Nil) Then
          oSql.FieldByName(sLocal).Value := oEndereco.FieldByName(sLocal).Value;
      End;
  End;

Begin
  oSql := TCmClientDataSet.Create(Nil);
  oEndereco := TCmClientDataSet.Create(Nil);
  Try
    oSql.Data := oDadosSql;
    oSql.First;
    While Not oSql.Eof Do
      Begin
        If oSql.FieldByName('IDENDERECO').AsString = '' Then
          Begin
            oEndereco.data := GetDataPacket('select pe.numdocumento,' + #13#10 +
              '       ep.IdEndereco,' + #13#10 +
              '       EP.LOGRADOURO AS ENDEREO,' + #13#10 +
              '       EP.NUMERO,' + #13#10 +
              '       EP.COMPLEMENTO,' + #13#10 +
              '       EP.BAIRRO,' + #13#10 +
              '       EP.nome,' + #13#10 +
              '       EP.CEP,' + #13#10 +
              '       C.UF,' + #13#10 +
              '       c.NUMSEED' + #13#10 +
              'from endpess ep' + #13#10 +
              'join pessoa pe on pe.idpessoa = ep.idpessoa' + #13#10 +
              'LEFT OUTER join cidades c on EP.IDCIDADES = C.IDCIDADES' + #13#10 +
              'LEFT OUTER JOIN ESTADO ES ON C.IDCIDADES = ES.IDESTADO' + #13#10 +
              'where pe.numdocumento =' + QuotedStr(oSql.FieldByName('CPF').AsString));
            If Not oEndereco.IsEmpty Then
              Begin
                oSql.Edit;
                AtualizaEndereco;
                oSql.Post;
              End;
            oSql.Next;
          End;
      End;
    Result := oSql.Data;
  Finally
    FreeAndNil(oSql);
    FreeAndNil(oEndereco);
  End;
End;

Function TCtrlInformeRendimentos.AcertaSql(Const pTexto: String): String;
Begin
  Result := 'Select * from (' + pTexto + ') H Where 1=2';
End;

Procedure TCtrlInformeRendimentos.AcertaBuscaPorCPF(Const oSql, oResult, oEndereco: TCmClientDataSet;
  Const sDataPagtoIni, sDataPagtoFim: String;
  Const bPensao: Boolean);
Var sCPF, sCampo: String;
  // Thiago Melo SOL 223141.15622 Kintana 2057248
  //Const aTotais : Array[1..72] of String =
  //Const aTotais : Array[1..74] of String =   // FX-EF - SOL XXX / KTN XXX
Const aTotais: Array[1..87] Of String = // FX-EF - SOL XXX / KTN XXX
  {
    Obs.: Os campos que forem criados no decorrer do tempo, adicionar o campo no Array para que a soma possa ser realizada.
    Thiago Melo SOL 223141.15622 Kintana 2057248
  }

  ('TOT301', 'TOT302', 'TOT303', 'TOT304', 'TOT305', 'TOT401',
    'TOT401_L2','TOT410','VLR4013','VLR4014','VLR4101', // Andre Imakawa - SIG 122151
    'TOT402', 'TOT403', 'TOT404', 'TOT405', 'TOT406', 'TOT407',
    'TOT501', 'TOT502', // Felipe A. Santos - Incluído o TOT502 - SOL 244545.16839 PPM 624515
    'TOT408', 'TOT503', // Paulo Nobre - SOL 257831/18009 PPM 1207646
    'TOT601', 'TOT602', 'TOT701', 'TOT901', 'VLR2',
    'VLR301', 'VLR302', 'VLR303', 'VLR304', 'VLR305', 'VLR306',
    'VLR401', 'VLR402', 'VLR403', 'VLR404', 'VLR405', 'VLR406',
    'VLR407', 'VLR501', 'VLR502', 'VLR503', // Felipe A. Santos SOL 245841  - incluído o VLR503
    'VLR601', 'VLR602', 'VLR603',
    'VLR604', 'VLR605', 'VLR606', 'VLR607', 'VLR3011', 'VLR3012',
    'VLR3021', 'VLR3031', 'VLR3032', 'VLR3041', 'VLR3042', 'VLR3051',
    'VLR4011', 'VLR4012', 'VLR4021', 'VLR4022', 'VLR4031', 'VLR4032',
    'VLR4041', 'VLR4042', 'VLR4051', 'VLR4061', 'VLR4071', 'VLR4072',
    'VLR4081', // Paulo Nobre - SOL 257831/18009 PPM 1207646
    'VLR5011', 'VLR5012', 'VLR5021', 'VLR5022', // Felipe A. Santos - Incluído o VLR5021 e VLR5022  - SOL 244545.16839 PPM 624515,
    'VLR50311', // Paulo Nobre - SOL 257831/18009 PPM 1207646
    'VLR', 'VLR6011', 'VLR6012', 'VLR6021', 'VLR7011',
    'VLR8011', 'VLR9010', 'VLR9011', 'VLR9012', 'VLR9021','VLR9031',
    'VLR6042' {,'QTDMESES'}); // Thiago Melo SOL 223141.15622 Kintana 2057248   // FX-EF - SOL XXX / KTN XXX (comentado QTDMESES)
Const aLocal: Array[1..9] Of String = ('IdEndereco', 'ENDEREO', 'NUMERO', 'COMPLEMENTO',
    'BAIRRO', 'nome', 'CEP', 'UF', 'NUMSEED');

  Procedure InsereLinha;
  Var nCount: Integer;
  Begin
    oResult.Insert;
    For nCount := 0 To oResult.Fields.Count - 1 Do
      oResult.Fields[nCount].Value := oSql.Fields[nCount].Value;
    oResult.Post;
  End;

  Procedure AtualizaEndereco();
  Var nCount: Integer;
    sLocal: String;
  Begin
    For nCount := Low(aLocal) To High(aLocal) Do
      Begin
        sLocal := aLocal[nCount];
        If (oResult.FindField(sLocal) <> Nil) Then
          oResult.FieldByName(sLocal).Value := oSql.FieldByName(sLocal).Value;
      End;
  End;

  Procedure AjustaEndereco();
  Var iIdFolha: Integer;
  sDatapgto : string; //William Santana - SOL 269789 PPM 1312365
  Begin
    oEndereco.Data := GetDataPacket('select idbenefirrf,idhstfolhabenef,datapagamento' + #13#10 +
      'from lancirrf' + #13#10 +
     // Paulo Nobre SOL 269456 PPM 1301364
     //    'where idbenefirrf = ' + oSql.FieldByName('IdPessoa').asString + #13#10 +
      'where idbenefirrf in (select idpessoa from pessoa where numdocumento = ' + QuotedStr(oSql.FieldByName('CPF').asString) + ')' + #13#10 +
      '  and datapagamento >= to_date(' + QuotedStr(sDataPagtoIni) + ',''dd/mm/yyyy'')' + #13#10 +
      '  and datapagamento <= to_date(' + QuotedStr(sDataPagtoFim) + ',''dd/mm/yyyy'')' + #13#10 +
      '  and rownum = 1');
    iIdFolha := oEndereco.FieldByName('idHstFolhaBenef').asInteger;
    sDatapgto := oEndereco.FieldByName('datapagamento').asString; //William Santana -  SOL 269789 PPM 1312365
    If iIdFolha <> 0 Then
      Begin
          // Paulo Nobre SOL 269456 PPM 1301364

          //Rafael SIG 96222 - Inicio
          
          _sSqlDados.Clear;
          _sSqlDados.Add('select idpessoa,idtitular,idresponsavel');
          _sSqlDados.Add('from histrubsal h');
          if (pLayout2019Pensao) then
                _sSqlDados.Add('where h.idpessoa in (select idpessoa from pessoa where numdocumento ='+ QuotedStr(oSql.FieldByName('CPF').asString)+')')
          else
                _sSqlDados.Add('where h.idresponsavel in (select idpessoa from pessoa where numdocumento ='+ QuotedStr(oSql.FieldByName('CPF').asString)+')');
          _sSqlDados.Add('and h.idpessjur = 1');
          _sSqlDados.Add('  and h.datapagamento = to_date(' + QuotedStr(sDatapgto) + ',''dd/mm/yyyy'')');
          _sSqlDados.Add('  and h.idhstfolhabenef >= ' + IntToStr(iIdFolha));
          _sSqlDados.Add('group by idpessoa, idtitular, idresponsavel');

     {
        oEndereco.Data := GetDataPacket('select idpessoa,idtitular,idresponsavel' + #13#10 +
         -- 'from histrubsal h ' + #13#10 +
         //          'where h.idresponsavel = ' + oSql.FieldByName('IdPessoa').asString + #13#10 +

          if (pLayout2019Pensao) then //Rafael SIG 96222 
                'where h.idpessoa in (select idpessoa from pessoa where numdocumento = ' + QuotedStr(oSql.FieldByName('CPF').asString)
          else
                'where h.idresponsavel in (select idpessoa from pessoa where numdocumento = ' + QuotedStr(oSql.FieldByName('CPF').asString) + ')' + #13#10;

          '  and h.idpessjur = 1' + #13#10 +
          //Início - William Santana -  SOL 269789 PPM 1312365
          //'  and h.datapagamento >= to_date(' + QuotedStr(sDataPagtoIni) + ',''dd/mm/yyyy'')' + #13#10 +
          //'  and h.datapagamento <= to_date(' + QuotedStr(sDataPagtoFim) + ',''dd/mm/yyyy'')' + #13#10 +
          '  and h.datapagamento = to_date(' + QuotedStr(sDatapgto) + ',''dd/mm/yyyy'')' + #13#10 +
          //Término - William Santana -  SOL 269789 PPM 1312365
          '  and h.idhstfolhabenef >= ' + IntToStr(iIdFolha) + #13#10 +
          ' group by idpessoa, idtitular, idresponsavel ');


          
          // Paulo Nobre SOL 269456 PPM 1301364
          //        If (oResult.FieldByName('IdPessoa').asInteger = oEndereco.FieldByName('IdPessoa').asInteger) And
          //          (oResult.FieldByName('IdPessoa').asInteger = oEndereco.FieldByName('IdTitular').asInteger) Then
          // Manter o Endereço
          //         If (oResult.FieldByName('IdPessoa').asInteger = oEndereco.FieldByName('IdPessoa').asInteger) And
          //          (oSql.FieldByName('IdPessoa').asInteger = oEndereco.FieldByName('IdTitular').asInteger) Then
     }

          oEndereco.Data := GetDataPacket(_sSqlDados.GetText);
          //Rafael SIG 96222 - Fim

        AtualizaEndereco();
      End;
  End;

  Procedure AcertaEnderecos();
  Begin
    // Acerta os Endereços
    If (oResult.FieldByName('idEndereco').asInteger = 0) And
      (oSql.FieldByName('idEndereco').asInteger <> 0) Then
      AtualizaEndereco()
    Else If (oResult.FieldByName('idEndereco').asInteger <> 0) And
      (oSql.FieldByName('idEndereco').asInteger <> 0) Then
      AjustaEndereco();
  End;

  Procedure AjustaProcessoJudicial();
  Var iIdFolha: Integer;
  Begin
    oEndereco.Data := GetDataPacket('Select IdPessoa,IdProcJud' + #13#10 +
      'From ProcJud where IdPessoa = ' + oSql.FieldByName('IdPessoa').asString);
    If Not oEndereco.IsEmpty Then
      oResult.FieldByName('IdPessoa').Value := oSql.FieldByName('IdPessoa').Value;
  End;

  Procedure AcumulaDados(Const pCPF: String);

    Procedure SomaValores();
    Var nCount: Integer;
      cCampo: String;
      oCampo: TField;
    Begin
      // Soma os Valores
      For nCount := Low(aTotais) To High(aTotais) Do
        Begin
          cCampo := aTotais[nCount];
          oCampo := oResult.FindField(cCampo);
          If oCampo <> Nil Then
            oResult.FieldByName(cCampo).Value := oResult.FieldByName(cCampo).Value +
              oSql.FieldByName(cCampo).Value;
        End;
    End;

    Procedure AtualizaMatricula();
    Begin
      // Acerto Matricula
      If oResult.FieldByName('Matricula').asString = '' Then
        oResult.FieldByName('Matricula').asString := oSql.FieldByName('Matricula').asString;
    End;

  Begin
    If oResult.Locate(sCampo, pCPF, []) Then
      Begin
        oResult.Edit;
        SomaValores();
        AcertaEnderecos();
        // Paulo Nobre SOL 269456 PPM 1301364
        //    AtualizaMatricula();
        //     AjustaProcessoJudicial();
        oResult.Post;
      End;
  End;

Begin
  oSql.First;
  sCPF := '';
  If bPensao Then
    sCampo := 'CPFALIMENTANTE'
  Else
    sCampo := 'CPF';
  While Not oSql.Eof Do
    Begin

      If sCPF <> oSql.FieldByName(sCampo).asString Then
        InsereLinha()
      Else
        AcumulaDados(oSql.FieldByName(sCampo).asString);
      sCPF := oSql.FieldByName(sCampo).asString;
      oSql.Next;
    End;
End;

Function TCtrlInformeRendimentos.BuscaDepJudicial(pCPF: String; Const pidPessoa: Integer; Const piAno: Integer; Const pTipo: boolean = False): OleVariant;
Var
  //sSqlDados       : TStringList;     // Edilaine - SOL 180189 / KTN 1761859 - comentado
  sPeriodoInicio, sPeriodoFinal: String;

  //CPrev - Pend. 27492 - 27/02/2008 - Início
  iTipoCliente: integer;
  //cdsAux       : TCMClientDataSet;   // Edilaine - SOL 180189 / KTN 1761859 - comentado
  //CPrev - Pend. 27492 - 27/02/2008 - Fim

Begin
  //CPrev - Pend. 27492 - 27/02/2008 - Início
  //cdsAux       := TCMClientDataSet.Create( nil );    // Edilaine - SOL 180189 / KTN 1761859 - comentado
  _CdsAux.Data := GetDataPacket('SELECT TIPOCLIENTE FROM EMPRESAPROP '); // Edilaine - SOL 180189 / KTN 1761859
  iTipoCliente := _cdsAux.FieldByName('TIPOCLIENTE').AsInteger; // Edilaine - SOL 180189 / KTN 1761859
  //CPrev - Pend. 27492 - 27/02/2008 - Fim

  //Inicializa Variaveis e Objetos
  //sSqlDados               := TStringList.Create;   // Edilaine - SOL 180189 / KTN 1761859

  sPeriodoInicio := '01/01/' + IntToStr(piAno);
  sPeriodoFinal := '31/12/' + IntToStr(piAno);

  _sSqlDados.Clear; // Edilaine - SOL 180189 / KTN 1761859

  // Paulo Nobre - WO31759 - Inicio
  //
  // Informações que se apresentavam distorcidas no bloco 7.INFORMAÇÕES COMPLEMENTARES
  //
  // Nos valores da equalização do contecioso judicial, foi incluso uma lógica (SQL)
  // que tenta encontrar uma diferença para ajustar os valores de forma correta. Estes
  // foram lançamentos que não tem processo (idprocjud) e foram lançados pelo compensa.
  //
  _sSqlDados.Add(

  'SELECT IDBENEFIRRF,                                                              ' + #13 +
  '       NUMEROPROCESSO,                                                           ' + #13 +
  '       DATAINICIO,                                                               ' + #13 +
  '       CODVARA,                                                                  ' + #13 +
  '       NOMEVARA,                                                                 ' + #13 +
  '       VALORIRJUD,                                                               ' + #13 +
  '       VALORRENDJUD,                                                             ' + #13 +
  '       VALORIRJUD13,                                                             ' + #13 +
  '       VALORRENDJUD13,                                                           ' + #13 +
  '       (VALORJUDCONTEQ - (SELECT NVL(ABS(SUM(LX2.VLRLANC)), 0)                   ' + #13 +
  '                          FROM LANCIRRF LI2,                                     ' + #13 +
  '                               LANCXINFORME LX2,                                 ' + #13 +
  '                               INFORME IN2                                       ' + #13 +
  '                          WHERE (LI2.IDBENEFIRRF IN (SELECT IDPESSOA       ' + #13 +
  '                                                     FROM PESSOA           ' + #13 +
  '                                                     WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ') )' + #13 +
  '                                AND (LI2.IDLANCIRRF = LX2.IDLANCIRRF)              ' + #13 +
  '                                AND (LX2.IDINFORME = IN2.IDINFORME)                ' + #13 +
  '                                AND (LI2.IDPROCJUD IS NULL)                        ' + #13 +
  '                                AND (LI2.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' + #13 +
  '                                                           AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' + #13 +
  '                                AND (LX2.FLGTIPOREG = ''N'')                         ' + #13 +
  '                                AND (LI2.CODNATUREZA = 3540)                         ' + #13 +
  '                                AND (IN2.IDINFORME IN (''46''))                      ' + #13 +
  '                                AND (IN2.CODDIRF IN (''48'', ''21'')))) AS VALORJUDCONTEQ,  ' + #13);
  _sSqlDados.Add(

  '        (VALORJUDCONTEQ13 - (SELECT NVL(ABS(SUM(LX2.VLRLANC)), 0)                       ' + #13 +
  '                             FROM LANCIRRF LI2,                                         ' + #13 +
  '                                  LANCXINFORME LX2,                                     ' + #13 +
  '                                  INFORME IN2                                           ' + #13 +
  '                             WHERE (LI2.IDBENEFIRRF IN (SELECT IDPESSOA     ' + #13 +
  '                                                        FROM PESSOA         ' + #13 +
  '                                                        WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ') )' + #13 +
  '                                   AND (LI2.IDLANCIRRF = LX2.IDLANCIRRF)                ' + #13 +
  '                                   AND (LX2.IDINFORME = IN2.IDINFORME)                  ' + #13 +
  '                                   AND (LI2.IDPROCJUD IS NULL)                          ' + #13 +
  '                                   AND (LI2.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' + #13 +
  '                                                              AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' + #13 +
  '                                   AND (LX2.FLGTIPOREG = ''N'')                         ' + #13 +
  '                                   AND (LI2.CODNATUREZA = 3540)                         ' + #13 +
  '                                   AND (IN2.IDINFORME IN (''75''))                      ' + #13 +
  '                                   AND (IN2.CODDIRF IN (''50'', ''25'')))) AS VALORJUDCONTEQ13,  ' + #13 +
  '        VALORIRJUDEQ,                                                                        ' + #13 +
  '        VALORIRJUDCONTEQ13,                                                                  ' + #13 +
  '        TIPO                                                                                 ' + #13 +
  'FROM (                                                                                       ');

  // Paulo Nobre - WO31759 - Fim                              }

  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859

    // Edilaine - SOL 198119 / KTN 1906990
    ' SELECT ' + #13 +
    '   A.IDBENEFIRRF, ' + #13 +
    '   A.NUMEROPROCESSO, ' + #13 +
    '   A.DATAINICIO, ' + #13 +
    '   A.CODVARA, ' + #13 +
    '   A.NOMEVARA, ' + #13 +
    '   SUM(A.VALORIRJUD) VALORIRJUD, ' + #13 +
    '   SUM(A.VALORRENDJUD) VALORRENDJUD, ' + #13 +
    '   SUM(A.VALORIRJUD13) VALORIRJUD13, ' + #13 +
    //Cássio Rovaroto - SIG nº 74355 - Início
    //'   SUM(A.VALORRENDJUD13) VALORRENDJUD13, ' + #13 +
    '   SUM(A.VALORRENDJUD13) VALORRENDJUD13 ' + #13);
    if piAno >= 2018 then
    begin
      _sSqlDados.Add(' ,SUM(A.VALORJUDCONTEQ) VALORJUDCONTEQ,       ' +#13#10+
                     ' SUM(A.VALORJUDCONTEQ13) VALORJUDCONTEQ13,    ' +#13#10+
                     ' SUM(A.VALORIRJUDEQ) VALORIRJUDEQ,            ' +#13#10+
    //Cássio Rovaroto - SIG nº 81572 - Início
    //                 ' SUM(A.VALORIRJUDCONTEQ13) VALORIRJUDCONTEQ13 ');
                     ' SUM(A.VALORIRJUDCONTEQ13) VALORIRJUDCONTEQ13, ' +#13#10+
                     ' A.TIPO                                        ');
    //Cássio Rovaroto - SIG nº 81572 - Fim
    end;
    _sSqlDados.Add(
    //Cássio Rovaroto - SIG nº 74355 - Fim
    ' FROM ( ' + #13 +
    // Edilaine - SOL 198119 / KTN 1906990 - fim

    ' SELECT ' + #13 +
    '   LIR.IDBENEFIRRF, ' + #13 +
    '   PRJ.NUMEROPROCESSO, ' + #13 +
    '   PRJ.DATAINICIO, ' + #13 +
    '   PRJ.CODVARA, ' + #13 +
  //Cássio Rovaroto - SIG nº 74335 - Início
  //    '   PRJ.NOMEVARA, ' + #13 +
    '   PRJ.NOMEVARA, ' );

  //Cássio Rovaroto  - SIG nº 81572 - Início
  if piAno >= 2018 then
    _sSqlDados.Add('   NVL(PE.PROC_EQUA, 0) AS TIPO, ');
  //Cássio Rovaroto  - SIG nº 81572 - Fim

  if piAno >= 2018 then
  begin
    //Cássio Rovaroto - SIG nº 81993 - Início
    //_sSqlDados.Add('SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND INF.CODDIRF IN (''14'',''26'') THEN ' +#13+
    //               '    ABS(DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC)) ELSE 0 END) VALORIRJUD,');

    _sSqlDados.Add('ABS(SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND INF.CODDIRF IN (''14'',''26'') THEN ' +#13+
                   '    DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ELSE 0 END)) VALORIRJUD, ');
    //Cássio Rovaroto - SIG nº 81993 - Fim
  end
  else
    _sSqlDados.Add(
  //Cássio Rovaroto - SIG n 74355 - Fim
    //IRJUD
    '   ABS(SUM(CASE WHEN (INF.CODDIRF IN (''14'',''26'') )' + #13 +
    '           THEN DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
    '           ELSE 0 END)) AS VALORIRJUD, ' + #13);

  //Cássio Rovaroto - SIG nº 74355 - Início
  if piAno >= 2018 then
  begin
    //Cássio Rovaroto - SIG nº 81281 - Início
    //_sSqlDados.Add('SUM(CASE WHEN ((INF.CODDIRF = ''9'') OR (INF.IDINFORME IN (34))) THEN ' +#13+
    //               'DECODE(LXI.IDINFORME, 34, LXI.VLRLANC*-1, LXI.VLRLANC) ELSE 0 END) AS VALORRENDJUD,');
    _sSqlDados.Add('SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND ((INF.CODDIRF = ''9'') OR (INF.IDINFORME IN (34))) THEN ' +#13+
                   'DECODE(LXI.IDINFORME, 34, LXI.VLRLANC*-1, LXI.VLRLANC) ELSE 0 END) AS VALORRENDJUD,');
    //Cássio Rovaroto - SIG nº 81281 - Fim
  end
  else
  //Cássio Rovaroto - SIG nº 74355 - Fim
  // Edilaine - SOL 180189 / KTN 1761859
  If piAno < 2008 Then
    Begin
      //RENDJUD
      _sSqlDados.Add('   SUM(CASE WHEN ((INF.CODDIRF = ''9'') OR (INF.IDINFORME IN (34, 82))) ' + #13 +
        '       THEN DECODE(LXI.IDINFORME, 34, LXI.VLRLANC*-1,              ' + #13 +
        '                                  82, LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
        '       ELSE 0 END) AS VALORRENDJUD, ' + #13);
    End
  Else
    Begin
      //RENDJUD
      _sSqlDados.Add('   SUM(CASE WHEN ((INF.CODDIRF = ''9'') OR (INF.IDINFORME IN (34))) ' + #13 +
        '       THEN DECODE(LXI.IDINFORME, 34, LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
        '       ELSE 0 END) AS VALORRENDJUD, ' + #13);
    End;
  // Edilaine - SOL 180189 / KTN 1761859 - fim


  //Cássio Rovaroto - SIG nº 74355 - Início
  if piAno >= 2018 then
    //Cássio Rovaroto - SIG nº 81993 - Início
    //_sSqlDados.Add('SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND (INF.CODDIRF IN (''17'',''30'')) THEN ' +#13+
    //               '    ABS(DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC*-1, LXI.VLRLANC)) ELSE 0 END) AS VALORIRJUD13, ')
    //_sSqlDados.Add('ABS(SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND (INF.CODDIRF IN (''17'',''30'')) THEN ' +#13+            //edilaine - SIG94605
    _sSqlDados.Add('ABS(SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND (INF.CODDIRF IN (''17'',''30'', ''51'')) THEN ' +#13+      //edilaine - SIG94605
                   '    DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ELSE 0 END)) AS VALORIRJUD13, ')
    //Cássio Rovaroto - SIG nº 81993 - Fim
  else
  //Cássio Rovaroto - SIG nº 74355 - Fim
  //IRJUD13
  _sSqlDados.Add(
    '   ABS(SUM(CASE WHEN (INF.CODDIRF IN (''17'',''30'')) ' + #13 +
    '           THEN DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
    '           ELSE 0 END)) AS VALORIRJUD13, ' + #13);

  //RENDJUD13
  //CPrev - Pend. 27492 - 27/02/2008 - Início
  //Marcio Sanches Spinosa
  If iTipoCliente = 20011 Then
    _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
      '   SUM(CASE WHEN ((INF.CODDIRF = ''11'') OR (INF.IDINFORME IN (14, 37))) ' + #13 +
      '       THEN DECODE(LXI.IDINFORME, 14, LXI.VLRLANC*-1, 37, LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
      '       ELSE 0 END) AS VALORRENDJUD13 ' + #13)
  Else
    //Marcio Sanches Spinosa
    Begin
      //Cássio Rovaroto - SIG nº 74355 - Início
       if piAno >= 2018 then
        _sSqlDados.Add('CASE WHEN NVL(PE.PROC_EQUA, 0) = 0 AND (INF.CODDIRF = ''11'') THEN (SUM(LXI.VLRLANC) - ' +#13+
                       '                                                   (SELECT ABS(NVL(SUM(LX2.VLRLANC), 0)) AS VALOR ' +#13+
									     '                                                      FROM LANCIRRF     LI2,                      ' +#13+
									     '                                                           LANCXINFORME LX2,                      ' +#13+
									     '                                                           INFORME      IN2                       ' +#13+
								       '                                                     WHERE (LI2.IDBENEFIRRF   = LIR.IDBENEFIRRF)  ' +#13+
									     '                                                       AND (LI2.IDLANCIRRF    = LX2.IDLANCIRRF)   ' +#13+
								       '                                                       AND (LI2.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' +#13+
                       '                                                       AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' +#13+
								       '                                                       AND (LX2.IDINFORME     = IN2.IDINFORME)    ' +#13+
    	      					 '                                                       AND (IN2.CODDIRF IN (''17'', ''30'')) )) ELSE 0 END AS VALORRENDJUD13,')
       else
      //Cássio Rovaroto - SIG nº 74355 - Fim

      //if (pTipo) then    // Edilaine - SOL 196824 / KTN 1884092 - comentado
      //   _sSqlDados.Add(' SUM(CASE WHEN ((INF.CODDIRF = ''11'')) THEN LXI.VLRLANC ELSE 0 END) AS VALORRENDJUD13 '+ #13 )   // Edilaine - SOL 180189 / KTN 1761859
      //else // Edilaine - SOL 196824 / KTN 1884092 - fim comentario
      _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
        //'   SUM(CASE WHEN ((INF.CODDIRF = ''11'')) '                                                               + #13 + // Edilaine - SOL 198119 / KTN 1906990 - comentado
        '   CASE WHEN ((INF.CODDIRF = ''11'')) ' + #13 + // Edilaine - SOL 198119 / KTN 1906990
        //Bruno Bastos - SOL: 111063 - Kintana: 519084 - '       THEN LXI.VLRLANC '                                                                                     + #13 +
        //Bruno Bastos - SOL: 111063 - Kintana: 519084 - Inídio
        //'       THEN (LXI.VLRLANC - (SELECT '                                                                      + #13 + // Edilaine - SOL 198119 / KTN 1906990 - comentado
        '       THEN (SUM(LXI.VLRLANC) - (SELECT ' + #13 + // Edilaine - SOL 198119 / KTN 1906990 - comentado
        '                              ABS(NVL(SUM(LX2.VLRLANC), 0)) AS VALOR ' + #13 + //Bruno Bastos - SOL: 113554 - Kintana: 528458 - Coloquei o NVL
        '                            FROM ' + #13 +
        '                              LANCIRRF     LI2, ' + #13 +
        '                              LANCXINFORME LX2, ' + #13 +
        '                              INFORME      IN2  ' + #13 +
        '                            WHERE (LI2.IDBENEFIRRF   = LIR.IDBENEFIRRF) ' + #13 +
        '                              AND (LI2.IDLANCIRRF    = LX2.IDLANCIRRF) ' + #13 +
        '                              AND (LI2.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') AND ' + #13 +
        '                                                             TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' + #13 +
        '                              AND (LX2.IDINFORME     = IN2.IDINFORME) ' + #13 +
        '                              AND (IN2.CODDIRF IN (''17'', ''30'')) )) ' + #13 +
        //Bruno Bastos - SOL: 111063 - Kintana: 519084 - Fim

        //'     ELSE 0 END) AS VALORRENDJUD13 '                                                                    + #13 ); // Edilaine - SOL 198119 / KTN 1906990 - comentado
        '       ELSE 0 END AS VALORRENDJUD13 ' + #13); // Edilaine - SOL 198119 / KTN 1906990
    End;
  //Marcio Sanches Spinosa

  //Cássio Rovaroto - SIG nº 74355 - Início
  if piAno >= 2018 then
  begin
    _sSqlDados.Add(//Cássio Rovaroto - SIG nº 81993 - Início
                   //Cássio Rovaroto - SIG nº 81275 - Início
                   //' SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 AND INF.CODDIRF IN (''14'',''26'') THEN ' + #13+
                   ' ABS(SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 AND INF.CODDIRF IN (''14'',''26'') THEN ' + #13+

                   //Cássio Rovaroto - SIG nº 81275 - Fim
                   //'          ABS(DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC)) ELSE 0 END) VALORIRJUDEQ,  ' +#13+
                   '          DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ELSE 0 END)) VALORIRJUDEQ,  ' +#13+
                   //Cássio Rovaroto - SIG nº 81281 - Início
                   //' SUM(CASE WHEN (INF.CODDIRF = ''48'') THEN ABS(DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC)) ELSE 0 END) AS VALORJUDCONTEQ, ' +#13+
                   '  ABS(SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 THEN                                                                                 ' + #13+
                   ' 		       CASE WHEN (INF.CODDIRF = ''48'') OR (INF.CODDIRF = ''21'') THEN DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC)                     ' + #13+ // André Imakawa - SIG 134189
 		               '                ELSE 0                                                                                                            ' + #13+
                   '            END                                                                                                                   ' + #13+
                   '           ELSE 0                                                                                                                 ' + #13+
                   '       END)) AS VALORJUDCONTEQ,                                                                                                   ' + #13+
                   //Cássio Rovaroto - SIG nº 81281 - Fim
                   //' SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 AND (INF.CODDIRF IN (''17'',''30'')) THEN DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC) ELSE 0 END) AS VALORIRJUDCONTEQ13, ' +#13+
                   //Cássio Rovaroto - SIG nº 81275 - Início
                   //' SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 AND (INF.CODDIRF IN  (''17'', ''51'')) THEN ABS(DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC)) ELSE 0 END) AS VALORIRJUDCONTEQ13, ' +#13+
                   //' SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 AND (INF.CODDIRF IN  (''17'', ''51'', ''30'')) THEN ABS(DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC)) ELSE 0 END) AS VALORIRJUDCONTEQ13, ' +#13+
                   ' ABS(SUM(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 AND (INF.CODDIRF IN  (''17'', ''51'', ''30'')) THEN DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC) ELSE 0 END)) AS VALORIRJUDCONTEQ13, ' +#13+
                   //Cássio Rovaroto - SIG nº 81275 - Fim
                   //Cássio Rovaroto - SIG nº 81281 - Inicio
                   //' ABS(SUM(CASE WHEN( INF.CODDIRF = ''50'') THEN DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC) ELSE 0 END)) AS VALORJUDCONTEQ13');
                   //' CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 THEN                                                               ' +#13+
                   ' ABS(CASE WHEN NVL(PE.PROC_EQUA, 0) = 1 THEN                                                               ' +#13+
                   //'      CASE WHEN INF.CODDIRF = ''50'' THEN ABS(SUM(DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC))) ' +#13+
                   '      CASE WHEN (INF.CODDIRF = ''50'') OR (INF.CODDIRF = ''25'') THEN SUM(DECODE(INF.FLGNATUREZA, ''N'', LXI.VLRLANC *-1, LXI.VLRLANC)) ' +#13+ // André Imakawa - SIG 134189
                   //'           WHEN (INF.CODDIRF = ''11'') THEN ABS((SUM(LXI.VLRLANC) - ' +#13+
                   '           WHEN (INF.CODDIRF = ''11'') THEN (SUM(LXI.VLRLANC) - ' +#13+
                   //'                                            (SELECT ABS(NVL(SUM(LX2.VLRLANC), 0)) AS VALOR ' +#13+
                   '                                            (SELECT NVL(SUM(LX2.VLRLANC), 0) AS VALOR ' +#13+
									 '                                               FROM LANCIRRF     LI2,                      ' +#13+
									 '                                                    LANCXINFORME LX2,                      ' +#13+
									 '                                                    INFORME      IN2                       ' +#13+
								   '                                              WHERE (LI2.IDBENEFIRRF   = LIR.IDBENEFIRRF)  ' +#13+
									 '                                                AND (LI2.IDLANCIRRF    = LX2.IDLANCIRRF)   ' +#13+
								   '                                                AND (LI2.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') ' +#13+
                   '                                                AND TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'')) ' +#13+
								   '                                                AND (LX2.IDINFORME     = IN2.IDINFORME)    ' +#13+
    	      			 //'                                                AND (IN2.CODDIRF IN (''17'', ''30'')) )))   ' +#13+
                   '                                                AND (IN2.CODDIRF IN (''17'', ''30''))))    ' +#13+
                   '                   ELSE 0                                                                           ' +#13+
                   '               END                                                                             ' +#13+
                   '         ELSE 0                                                                                ' +#13+
                   //'          END) AS VALORJUDCONTEQ13');
                   '          END) AS VALORJUDCONTEQ13');                                                           
                   //Cássio Rovaroto - SIG nº 81281 - Fim
  end;             //Cássio Rovaroto - SIG nº 81993 - Fim
  //Cássio Rovaroto - SIG nº 74355 - Fim


  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    //CPrev - Pend. 27492 - 27/02/2008 - Fim

    // Paulo Nobre SOL 268775 PPM 1268748
    ' FROM LANCXINFORME LXI ' + #13 +
    '      JOIN LANCIRRF LIR ON LIR.IDLANCIRRF = LXI.IDLANCIRRF  ' + #13 +
    '      JOIN PROCJUD PRJ ON LIR.IDPROCJUD = PRJ.IDPROCJUD     ' + #13 +
    '      JOIN INFORME INF ON LXI.IDINFORME = INF.IDINFORME     ' + #13 +
    '      JOIN (SELECT MAX(I.ANOVIGENCIA) ANOVIGENCIA,          ' + #13 +
    '                   I.IDINFORME                              ' + #13 +
    '            FROM INFORME I                                ' + #13 +
    '            WHERE ANOVIGENCIA <=' + IntToStr(piAno) + #13 +
    //Cássio Rovaroto - SIG nº 74355 - Início
    //'            GROUP BY I.IDINFORME) DS1 ON INF.ANOVIGENCIA = DS1.ANOVIGENCIA AND INF.IDINFORME = DS1.IDINFORME ' + #13 +
    '            GROUP BY I.IDINFORME) DS1 ON INF.ANOVIGENCIA = DS1.ANOVIGENCIA AND INF.IDINFORME = DS1.IDINFORME ');

    //    '   ,(SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA, IDINFORME FROM INFORME WHERE ANOVIGENCIA <=' + IntToStr(piAno) + ' GROUP BY IDINFORME ) QAN ' + #13 + //Vinicius Maciel SOL 168331 - KTN 1482898
    // Paulo Nobre SOL 268555 PPM 1262100
    //    ' WHERE LIR.IDBENEFIRRF                       = ' + IntToStr(pidPessoa) + #13 +
    if piAno >= 2018 then
    _sSqlDados.Add(' LEFT JOIN (SELECT DET.IDPROCJUD,                                                                                  ' + #13 +
  	               '           				 CASE WHEN INSTR(REG.NOMEREGRA, ''EQUA'') <> 0 THEN 1  ELSE 0 END AS PROC_EQUA                   ' + #13 +
		               '       FROM DETPROCJUD DET                                                                                         ' + #13 +
                   '       JOIN REGRA REG ON REG.IDREGRA = DET.IDREGRA                                                                 ' + #13 +
                   '      GROUP BY DET.IDPROCJUD,                                                                                      ' + #13 +
  	               '           		CASE WHEN INSTR(REG.NOMEREGRA, ''EQUA'') <> 0 THEN 1  ELSE 0 END) PE ON PE.IDPROCJUD = PRJ.IDPROCJUD ');
    _sSqlDados.Add(
    //Cássio Rovaroto - SIG nº 74355 - Fim
    ' WHERE LIR.IDBENEFIRRF IN          ' + #13 +
    '      (SELECT IDPESSOA       ' + #13 +
    '       FROM PESSOA         ' + #13 +
    '      WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')' + #13 +

    ////////////////////////

    '   AND LIR.CODNATUREZA                      IN (''0561'',''5565'',''3223'',''0588'',''7416'',''7431'', ''3540'', ''3533'', ''3556'', ''3579'') ' + //Marcio Sanches Spinosa SOL 208778 Kintana 2023148 ) /Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
    '   AND LIR.DATAPAGAMENTO               BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') AND ' + #13 +
    '                                               TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'') ' + #13 +
    '   AND NVL(LIR.IDMODULORESPON, LIR.IDMODULO) = 18 ' + #13 +

    // Paulo Nobre SOL 268775 PPM 1268748
    // '   AND LIR.IDLANCIRRF                        = LXI.IDLANCIRRF ' + #13 +
    //'   AND LXI.IDINFORME                         = INF.IDINFORME ' + #13 +
    //'   AND LIR.IDPROCJUD                         = PRJ.IDPROCJUD ' + #13 + //Bruno Bastos - Sol: 129764 - Kintana: 715253
    //Vinicius Maciel  SOL 168331 - KTN 1482898
    //'   AND INF.ANOVIGENCIA = QAN.ANOVIGENCIA ' + #13 +
    //'   AND INF.IDINFORME = QAN.IDINFORME     ' + #13 +
    //Vinicius Maciel - SOL 168331 - KTN 1482898 - FIM
    //Bruno Bastos - Sol: 129764 - Kintana: 715253 -   '   AND ((LIR.IDPROCJUD                       = PRJ.IDPROCJUD) OR '                                            + #13 +
    //Bruno Bastos - Sol: 129764 - Kintana: 715253 -   '       ((LIR.IDBENEFIRRF = PRJ.IDPESSOA) AND (INF.CODDIRF IN (''9'', ''11'', ''14'', ''17'')))) '             + #13 +

    ' GROUP BY ' + #13 +
    '   LIR.IDBENEFIRRF, ' + #13 +
    '   PRJ.NUMEROPROCESSO, ' + #13 +
    '   PRJ.DATAINICIO, ' + #13 +
    '   PRJ.CODVARA, ' + #13 +
    '   PRJ.NOMEVARA, ' + #13 +

    //Cássio Rovaroto - SIG nº 74355 - Início
    // Edilaine - SOL 198119 / KTN 1906990
    //'   INF.CODDIRF ' + #13 +
    '   INF.CODDIRF ');
    if piAno >= 2018 then
      _sSqlDados.Add(', NVL(PE.PROC_EQUA, 0)');

    _sSqlDados.Add(

    ' ) A ' + #13 +
    // Andre Imakawa - SIG 40571 - Inicio
    //' WHERE  (A.VALORIRJUD > 0 OR A.VALORRENDJUD > 0 OR A.VALORIRJUD13 > 0 OR A.VALORRENDJUD13 > 0) ' + #13 +
    ' WHERE  NVL(A.VALORIRJUD,0) > 0 OR ' +#13 +
    '        NVL(A.VALORRENDJUD,0) > 0 OR ' +#13 +
    '        NVL(A.VALORIRJUD13, 0) > 0 OR ' +#13 +
    '        NVL(A.VALORRENDJUD13, 0) > 0 ');

    if piAno >= 2018 then
      _sSqlDados.Add('OR NVL(VALORJUDCONTEQ, 0) > 0 OR ' +#13+
                     ' NVL(VALORJUDCONTEQ13, 0) > 0 OR ' +#13+
                     ' NVL(VALORIRJUDEQ, 0) > 0 OR ' +#13+
                     ' NVL(VALORIRJUDCONTEQ13, 0) > 0');
    _sSqlDados.Add(
    //Cássio Rovaroto - SIG nº 74355 - Fim
    // Andre Imakawa - SIG 40571 - Fim
    ' GROUP BY ' + #13 +
    '   A.IDBENEFIRRF, ' + #13 +
    '   A.NUMEROPROCESSO, ' + #13 +
    '   A.DATAINICIO, ' + #13 +
    '   A.CODVARA, ' + #13 +
    '   A.NOMEVARA ');
    //Cássio Rovaroto - SIG nº 81572 - Início
    if piAno >= 2018 then
      _sSqlDados.Add('   , A.TIPO ');
    //Cássio Rovaroto - SIG nº 81572 - Fim
  // Edilaine - SOL 198119 / KTN 1906990 - fim

  _sSqlDados.Add('   ) ');    // Paulo Nobre - WO31759

  _sSqlDados.SaveToFile('c:\planus\temp\DadosAcaoJudicialIRInformativo.sql');
  Result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  //cdsAux.Free;   //CPrev - Pend. 27492 - 27/02/2008   // Edilaine - SOL 180189 / KTN 1761859 - comentado
End;

Function TCtrlInformeRendimentos.BuscaCompensaIR(Const pidPessoa: Integer; Const piAno: Integer; pCPF: String): OleVariant;
Var //sSqlDados       : TStringList;     // Edilaine - SOL 180189 / KTN 1761859 - comentado
  sPeriodoInicio,
    sPeriodoFinal: String;

Begin
  // Inicializa Variaveis e Objetos
  //sSqlDados               := TStringList.Create;   // Edilaine - SOL 180189 / KTN 1761859

  sPeriodoInicio := '01/01/' + IntToStr(piAno);
  sPeriodoFinal := '31/12/' + IntToStr(piAno);

  _sSqlDados.CLEAR; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' SELECT ' + #13 +
    '   LIR.IDBENEFIRRF, ' + #13 +
    '   CIR.NUMEROPROCESSO, ' + #13 +
    '   CIR.ANOMESINICIO, ' + #13 +
    '   CIR.CODVARA, ' + #13 +
    '   CIR.NOMEVARA, ' + #13 +

    //IR COMPENSADO
    '   ABS(SUM(CASE WHEN (INF.CODDIRF = ''8'') ' + #13 +
    '           THEN DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
    '           ELSE 0 END)) AS VALORIRJUD, ' + #13 +

    //REND IR COMPENSADO
    '   SUM(CASE WHEN (INF.CODDIRF = ''2'') ' + #13 +
    '       THEN DECODE(INF.FLGNATUREZA,''N'', LXI.VLRLANC*-1, LXI.VLRLANC) ' + #13 +
    '       ELSE 0 END) AS VALORRENDJUD ' + #13 +

    ' FROM ' + #13 +
    '   LANCXINFORME LXI, ' + #13 +
    '   LANCIRRF     LIR, ' + #13 +
    '   COMPENSAIRRF CIR, ' + #13 +
    '   INFORME      INF  ' + #13 +

    // Paulo Nobre SOL 268555 PPM 1262100
    //    ' WHERE LIR.IDBENEFIRRF                       = ' + IntToStr(pidPessoa) + #13 +
    //
    '    WHERE LIR.IDBENEFIRRF IN          ' +
    '    (SELECT IDPESSOA       ' +
    '       FROM PESSOA         ' +
    '      WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')' + #13 +
    ///////

    '   AND LIR.CODNATUREZA                      IN (''0561'',''5565'',''3223'',''0588'', ''7431'', ''7416'', ''3540'', ''3533'', ''3556'', ''3579'') ' + //Marcio Sanches Spinosa SOL 208778 Kintana 2023148)/Marcio Sanches Spinosa SOL 223465 KINTANA 2058652
    '   AND LIR.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr(sPeriodoInicio) + ',''DD/MM/YYYY'') AND ' + #13 +
    '                                               TO_DATE(' + QuotedStr(sPeriodoFinal) + ',''DD/MM/YYYY'') ' + #13 +
    '   AND NVL(LIR.IDMODULORESPON, LIR.IDMODULO) = 18 ' + #13 +
    '   AND (LXI.FLGTIPOREG <> ''D'') ' + #13 +
    '   AND LIR.IDLANCIRRF                        = LXI.IDLANCIRRF ' + #13 +
    '   AND LXI.IDINFORME                         = INF.IDINFORME ' + #13 +
    '   AND LIR.IDBENEFIRRF                       = CIR.IDPESSOA ' + #13 +

    {CPrev - Pend. 24752 - 11/02/2008 - Início Comentário
    '   AND (( CIR.ANOMESINICIO >= '+ QuotedStr(IntToStr(piAno) + '/01' ) +'   AND CIR.ANOMESINICIO <= '+ QuotedStr(IntToStr(piAno) + '/12' ) + ') ' + #13 +
    '     OR ( CIR.ANOMESFIM    >= '+ QuotedStr(IntToStr(piAno) + '/01' ) +'   AND CIR.ANOMESFIM    <= '+ QuotedStr(IntToStr(piAno) + '/12' ) + ') ' + #13 +
    '     OR ( CIR.ANOMESFIM    IS NULL )) '                                                                       + #13 +
    }//CPrev - Pend. 24752 - 11/02/2008 - Fim Comentário

    //CPrev - Pend. 24752 - 11/02/2008 - Início
    ' AND EXISTS (SELECT 1 ' +
    ' FROM HSTCOMPENSAIRRF HST ' +
    ' WHERE CIR.IDPESSOA = HST.IDPESSOA ' +
    ' AND HST.MESREF  >= ' + QuotedStr(IntToStr(piAno) + '/01') +
    ' AND HST.MESREF  <= ' + QuotedStr(IntToStr(piAno) + '/12') + ' ) ' +
    //CPrev - Pend. 24752 - 11/02/2008 - Fim

    '   AND INF.CODDIRF   IN (''8'', ''2'') ' + #13 +

    ' GROUP BY ' + #13 +
    '   LIR.IDBENEFIRRF, ' + #13 +
    '   CIR.NUMEROPROCESSO, ' + #13 +
    '   CIR.ANOMESINICIO, ' + #13 +
    '   CIR.CODVARA, ' + #13 +
    '   CIR.NOMEVARA ');

  Result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
End;

//CPrev - 27341 - Inicio

Function TCtrlInformeRendimentos.BuscaIDPessJur(Const piIDPessoa: Integer; pCPF: String): OleVariant;
//Var sSQL:String;    // Edilaine - SOL 180189 / KTN 1761859 - comentado
Begin
  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    'SELECT IDPESSJUR ' + #13 +
    'FROM PARTPREVPLAN ' + #13 +
    // Paulo Nobre SOL 268555 PPM 1262100
   //    'WHERE (IDPESSOA = ' + IntToStr(piIDPessoa) + ') ' + #13 +
       //
    '    WHERE IDPESSOA IN          ' +
    '    (SELECT IDPESSOA       ' +
    '       FROM PESSOA         ' +
    '      WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')' + #13 +
    ///////

    '  AND (FLGDESATIVADO = 0)'); // Edilaine - SOL 180189 / KTN 1761859

  Result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  //Result := GetDataPacket(sSQL);                 // Edilaine - SOL 180189 / KTN 1761859 - comentado
End;
//CPrev - 27341 - Fim

//Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Início

Function TCtrlInformeRendimentos.AbreCdsVirtual: OleVariant;
Var
  sSql: String;
Begin
  _sSqlDados.clear; // Edilaine - SOL 180189 / KTN 1761859
  _sSqlDados.Add(// Edilaine - SOL 180189 / KTN 1761859
    ' select ' + // Edilaine - SOL 180189 / KTN 1761859
    ' pes.nome as NOMEALIMENTANTE, ' +
    ' pes.nome as nomeresp, ' +
    ' pes.numdocumento AS CPFALIMENTANTE, ' +
    ' TEP.NUMERO AS TELALIMENTANTE, ' +
    ' ENP.LOGRADOURO AS LOGRADOUROALIM, ' +
    ' ENP.NUMERO AS NUMEROALIM, ' +
    ' enp.complemento AS COMPLEMENALIM, ' +
    ' enp.bairro AS BAIRROALIM, ' +
    ' cid.nome AS CIDADEALIM, ' +
    ' enp.cep AS CEPALIM, ' +
    ' est.CODESTADO AS ESTADOALIM, ' +
    ' ''01/01/1899'' AS DATAINF, ' +
    ' ''2008'' AS ANO, ' +
    ' ''2022'' AS ANO_EXERCICIO, ' +// Andre Imakawa - SIG 122151
    ' ''01/01/1899'' AS DATA, ' +
    ' ''2008'' AS ANOATUAL, ' +
    ' ''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' AS DADOSCOMP, ' +
    ' pes.idpessoa AS IDPESSOA, ' +
    '  '' '' AS TIPO, ' +
    ' pes.nome AS NOMEBENEF, ' +
    ' elg.matricula AS MATRICULA, ' +
    ' pes.numdocumento AS CPF, ' +
    ' pes.numdocumento AS CGC, ' +
    ' pes.nome AS FONTE, ' +
    ' nat.codnatureza AS CODNATUREZA, ' +
    ' enp.idendereco AS IDENDERECO, ' +
    ' nat.descricao AS DESCRICAO, ' +
    ' pes.razaosocial AS RAZAOSOCIAL, ' +
    ' enp.logradouro AS ENDEREO, ' +
    ' enp.numero AS NUMERO, ' +
    ' enp.complemento AS COMPLEMENTO, ' +
    ' enp.bairro AS BAIRRO, ' +
    ' cid.nome AS NOME, ' +
    ' enp.cep AS CEP, ' +
    ' est.codestado AS UF, ' +
    ' cid.numseed AS NUMSEED, ' +
    ' 0 AS FLGPENSAOALIM, ' +
    ' 0 AS VLR301, ' +
    ' 0 AS VLR302, ' +
    ' 0 AS VLR303, ' +
    ' 0 AS VLR304, ' +
    ' 0 AS VLR305, ' +
    ' 0 AS VLR401, ' +
    ' 0 AS VLR402, ' +
    ' 0 AS VLR403, ' +
    ' 0 AS VLR404, ' +
    ' 0 AS VLR405, ' +
    ' 0 AS VLR406, ' +
    ' 0 AS VLR407, ' +
    ' 0 AS VLR408, ' + // PRNS
    ' 0 AS VLR501, ' +
    ' 0 AS VLR502, ' +
    ' 0 AS VLR503, ' + // Felipe A. Santos SOL 245841 PPM 629389
    ' 0 AS VLR601, ' +
    ' 0 AS VLR602, ' +
    ' 0 AS VLR603, ' +
    ' 0 AS VLR604, ' +
    ' 0 AS VLR605, ' +
    ' 0 AS VLR606, ' +
    ' 0 AS VLR607, ' +
    ' 0 AS VLR608, ' + //Bruno Bastos - 18/02/2011
    ' ''FALSE'' AS PROCESSO, ' +
    ' ''FALSE'' AS PENSIONISTA, ' +
    ' enp.logradouro AS ENDERECO_FUND, ' +
    ' enp.numero AS NUMERO_FUND, ' +
    ' enp.complemento AS COMPLEMENTO_FUND, ' +
    ' enp.bairro AS BAIRRO_FUND, ' +
    ' cid.nome AS CIDADE_FUND, ' +
    ' enp.cep AS CEP_FUND, ' +
    ' est.codestado AS UF_FUND, ' +
    ' cid.numseed AS NUMSEED_FUND, ' +
    ' cct.nome AS LOTACAO, ' +
    ' tep.numero AS TELEFONE_FUND, ' +

    ' pes.nome as NOMEALIMENTANTE_2, ' +
    ' pes.numdocumento AS CPFALIMENTANTE_2, ' +
    ' TEP.NUMERO AS TELALIMENTANTE_2, ' +
    ' ENP.LOGRADOURO AS LOGRADOUROALIM_2, ' +
    ' ENP.NUMERO AS NUMEROALIM_2, ' +
    ' enp.complemento AS COMPLEMENALIM_2, ' +
    ' enp.bairro AS BAIRROALIM_2, ' +
    ' cid.nome AS CIDADEALIM_2, ' +
    ' enp.cep AS CEPALIM_2, ' +
    ' est.CODESTADO AS ESTADOALIM_2, ' +
    ' ''01/01/1899'' AS DATAINF_2, ' +
    ' ''2008'' AS ANO_2, ' +
    ' ''01/01/1899'' AS DATA_2, ' +
    ' ''2008'' AS ANOATUAL_2, ' +
    ' ''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
    ' xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' AS DADOSCOMP_2, ' +
    ' pes.idpessoa AS IDPESSOA_2, ' +
    ' '' '' AS TIPO_2, ' +
    ' pes.nome AS NOMEBENEF_2, ' +
    ' elg.matricula AS MATRICULA_2, ' +
    ' pes.numdocumento AS CPF_2, ' +
    ' pes.numdocumento AS CGC_2, ' +
    ' pes.nome AS FONTE_2, ' +
    ' nat.codnatureza AS CODNATUREZA_2, ' +
    ' enp.idendereco AS IDENDERECO_2, ' +
    ' nat.descricao AS DESCRICAO_2, ' +
    ' pes.razaosocial AS RAZAOSOCIAL_2, ' +
    ' enp.logradouro AS ENDEREO_2, ' +
    ' enp.numero AS NUMERO_2, ' +
    ' enp.complemento AS COMPLEMENTO_2, ' +
    ' enp.bairro AS BAIRRO_2, ' +
    ' cid.nome AS NOME_2, ' +
    ' enp.cep AS CEP_2, ' +
    ' est.codestado AS UF_2, ' +
    ' cid.numseed AS NUMSEED_2, ' +
    ' 0 AS FLGPENSAOALIM_2, ' +
    ' 0 AS VLR301_2, ' +
    ' 0 AS VLR302_2, ' +
    ' 0 AS VLR303_2, ' +
    ' 0 AS VLR304_2, ' +
    ' 0 AS VLR305_2, ' +
    ' 0 AS VLR401_2, ' +
    ' 0 AS VLR402_2, ' +
    ' 0 AS VLR403_2, ' +
    ' 0 AS VLR404_2, ' +
    ' 0 AS VLR405_2, ' +
    ' 0 AS VLR406_2, ' +
    ' 0 AS VLR407_2, ' +
    ' 0 AS VLR408_2, ' + // PRNS
    ' 0 AS VLR501_2, ' +
    ' 0 AS VLR502_2, ' +
    ' 0 AS VLR503_2, ' + // Felipe A. Santos SOL 245841 PPM 629389
    ' 0 AS VLR601_2, ' +
    ' 0 AS VLR602_2, ' +
    ' 0 AS VLR603_2, ' +
    ' 0 AS VLR604_2, ' +
    ' 0 AS VLR605_2, ' +
    ' 0 AS VLR606_2, ' +
    ' 0 AS VLR607_2, ' +
    ' 0 AS VLR608_2, ' + //Bruno Bastos - 18/02/2011
    ' ''FALSE'' AS PROCESSO_2, ' +
    ' ''FALSE'' AS PENSIONISTA_2, ' +
    ' enp.logradouro AS ENDERECO_FUND_2, ' +
    ' enp.numero AS NUMERO_FUND_2, ' +
    ' enp.complemento AS COMPLEMENTO_FUND_2, ' +
    ' enp.bairro AS BAIRRO_FUND_2, ' +
    ' cid.nome AS CIDADE_FUND_2, ' +
    ' enp.cep AS CEP_FUND_2, ' +
    ' est.codestado AS UF_FUND_2, ' +
    ' cid.numseed AS NUMSEED_FUND_2, ' +
    ' cct.nome AS LOTACAO_2, ' +
    ' tep.numero AS TELEFONE_FUND_2, ' +

    ' 0 AS PAGINA ' +

    ' FROM ' +
    ' PESSOA         PES, ' +
    ' ELEGPATRO      ELG, ' +
    ' ESTADO         EST, ' +
    ' CIDADES        CID, ' +
    ' ENDPESS        ENP, ' +
    ' TELENDPESS     TEP, ' +
    ' NATURENDIMENTO NAT, ' +
    ' CENTCUST       CCT ' +

    ' WHERE 1 = 2 '); // Edilaine - SOL 180189 / KTN 1761859

  result := GetDataPacket(_sSqlDados.GetText); // Edilaine - SOL 180189 / KTN 1761859
  result := GetDataPacket(sSql); // Edilaine - SOL 180189 / KTN 1761859 - comentado
End;
//Bruno Bastos - SOL: 103796 - Kintana: 463663 - 20/01/2009 - Fim

//Everson Cunha - SIG78304 - Tibero - Início
procedure TCtrlInformeRendimentos.AlterSession(pValue: String);
var
  qryAux : TwwQuery;
begin
  qryAux := TwwQuery.Create(nil);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text := 'alter session set _trans_unnest_subquery_in_select_list= ' + pValue;

  try
    qryAux.ExecSQL;
  finally
    qryAux.Free;
  end;

end;
//Everson Cunha - SIG78304 - Tibero - Fim


function TCtrlInformeRendimentos.BuscaLancResidExterior(pNumDocumento: string;
  pAno: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT A.IDPESSOA, NVL(B.CODNATUREZA, ''0473'') AS NATUREZA_0473, NVL(B.VALOR, 0) AS VLR_0473, ' +#13#10+
          '       NVL(C.CODNATUREZA, ''9466'') AS NATUREZA_9466, NVL(C.VALOR, 0) AS VLR_9466, A.VALOR AS VLRTOTAL ' +#13#10+
          '  FROM (SELECT IDPESSOA, ABS(SUM(VALOR)) AS VALOR, NULL AS CODNATUREZA ' +#13#10+
          '          FROM (SELECT D.IDPESSOA, ' +#13#10+
          '                       CASE WHEN SUBSTR(PR.CODPROVDESC,2,3) IN (''430'',''459'',''513'',''514'',''515'',''516'',''477'',''482'',''483'',''484'') THEN  NVL(UPPER(GR.DESCRICAO), ''OUTROS'') || '' - EQUAC'' ' +#13#10+
          '                            ELSE NVL(UPPER(GR.DESCRICAO), ''OUTROS'') END AS CODPROVDESC, ' +#13#10+
          '                       SUM(DECODE(H.VALORPROVENTO, 0, (DECODE(H.FLGTIPODESC, ''K'', ' +#13#10+
          '                           (DECODE(PR.FLGDESCONTO, 0, H.VALORINFO, -H.VALORINFO)), ' +#13#10+
          '                              (DECODE(PR.FLGDESCONTO, 0, H.VALORPROVENTO, -H.VALORPROVENTO)))), ' +#13#10+
          '                           (DECODE(PR.FLGDESCONTO, 0, H.VALORPROVENTO, -H.VALORPROVENTO)))) AS VALOR ' +#13#10+
          '                  FROM PROVDESC PR, ' +#13#10+
          '                       HISTRUBSAL H, ' +#13#10+
          '                       DEPENTIT D, ' +#13#10+
          '                       PESSOA P, ' +#13#10+
          '                       PESSOAFISICA PF, ' +#13#10+
          '                       GRUPORUBRICA GR ' +#13#10+
          '                 WHERE PR.FLGTPRUBRICA LIKE ''%B%'' ' +#13#10+
          '                   AND H.IDRUBRICA = PR.IDPROVENTO ' +#13#10+
          '                   AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + QuotedStr(IntToStr(pAno))  +#13#10+
          '                   AND (DECODE(H.IDTITULAR, H.IDPESSOA, H.IDPESSOA, H.IDRESPONSAVEL) = ' +#13#10+
          '                        D.IDPESSOA OR H.IDTITULAR = D.IDPESSOA) ' +#13#10+
          '                   AND H.IDTITULAR = D.IDTITULAR ' +#13#10+
          '                   AND D.IDPESSOA = P.IDPESSOA ' +#13#10+
          '                   AND H.IDRESPONSAVEL = P.IDPESSOA ' +#13#10+
          '                   AND P.NUMDOCUMENTO = ' + QuotedStr(pNumDocumento) +#13#10+
          '                   AND P.IDPESSOA = PF.IDPESSOA ' +#13#10+
          '                   AND DECODE(PR.IDPROVENTO, 36914, H.VALORINFO, 38389, H.VALORINFO, 36952, 999, 38390, H.VALORINFO, H.VALORPROVENTO) > 0 ' +#13#10+
          '                   AND NVL(H.FLGESTORNO, 0) = 0 ' +#13#10+
          '                   AND PR.IDGRUPORUBRICA = GR.IDGRUPORUBRICA(+) ' +#13#10+
          '                   AND H.IDMODULO = 18 ' +#13#10+
          '                   AND H.FLGPENSAOALIM <> 2 ' +#13#10+
          '                   AND H.CODIRRFDARF IN (''0473'', ''9466'') ' +#13#10+
          //'                   AND NVL(PR.IDINFORME, -1)  IN (50, 74, 51, 76) ' +#13#10+          // Andre Imakawa - SIG 132917
          '                   AND NVL(PR.IDINFORME, -1)  IN (50, 74, 51, 76, 195, 196) ' +#13#10+  // Andre Imakawa - SIG 132917
          '                 GROUP BY D.IDPESSOA, ' +#13#10+
          '                          H.CODIRRFDARF, ' +#13#10+
          '                          CASE WHEN SUBSTR(PR.CODPROVDESC,2,3) IN (''430'',''459'',''513'',''514'',''515'',''516'',''477'',''482'',''483'',''484'') THEN  NVL(UPPER(GR.DESCRICAO), ''OUTROS'') || '' - EQUAC'' ' +#13#10+
          '                               ELSE NVL(UPPER(GR.DESCRICAO), ''OUTROS'') END) ' +#13#10+
          '          WHERE VALOR < 0 ' +#13#10+
          '          GROUP BY IDPESSOA) A ' +#13#10+
          '  LEFT JOIN (SELECT IDPESSOA, SUM(VALOR) AS VALOR, CODIRRFDARF AS CODNATUREZA ' +#13#10+
          '               FROM (SELECT D.IDPESSOA, ' +#13#10+
          '                            CASE WHEN SUBSTR(PR.CODPROVDESC,2,3) IN (''430'',''459'',''513'',''514'',''515'',''516'',''477'',''482'',''483'',''484'') THEN  NVL(UPPER(GR.DESCRICAO), ''OUTROS'') || '' - EQUAC'' ' +#13#10+
          '                                 ELSE NVL(UPPER(GR.DESCRICAO), ''OUTROS'') END AS CODPROVDESC,' +#13#10+
          '                            SUM(DECODE(H.VALORPROVENTO, 0, (DECODE(H.FLGTIPODESC, ''K'', ' +#13#10+
          '                                (DECODE(PR.FLGDESCONTO, 0, H.VALORINFO, -H.VALORINFO)), ' +#13#10+
          '                                (DECODE(PR.FLGDESCONTO, 0, H.VALORPROVENTO, -H.VALORPROVENTO)))), ' +#13#10+
          '                                (DECODE(PR.FLGDESCONTO, 0, H.VALORPROVENTO, -H.VALORPROVENTO)))) AS VALOR, ' +#13#10+
          '                            H.CODIRRFDARF ' +#13#10+
          '                       FROM PROVDESC PR, ' +#13#10+
          '                            HISTRUBSAL H, ' +#13#10+
          '                            DEPENTIT D, ' +#13#10+
          '                            PESSOA P, ' +#13#10+
          '                            PESSOAFISICA PF, ' +#13#10+
          '                            GRUPORUBRICA GR ' +#13#10+
          '                      WHERE PR.FLGTPRUBRICA LIKE ''%B%'' ' +#13#10+
          '                        AND H.IDRUBRICA = PR.IDPROVENTO ' +#13#10+
          '                        AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + QuotedStr(IntToStr(pAno)) +#13#10+
          '                        AND (DECODE(H.IDTITULAR, H.IDPESSOA, H.IDPESSOA, H.IDRESPONSAVEL) = ' +#13#10+
          '                             D.IDPESSOA OR H.IDTITULAR = D.IDPESSOA) ' +#13#10+
          '                        AND H.IDTITULAR = D.IDTITULAR ' +#13#10+
          '                        AND D.IDPESSOA = P.IDPESSOA ' +#13#10+
          '                        AND H.IDRESPONSAVEL = P.IDPESSOA ' +#13#10+
          '                        AND P.NUMDOCUMENTO = ' + QuotedStr(pNumDocumento) +#13#10+
          '                        AND P.IDPESSOA = PF.IDPESSOA ' +#13#10+
          '                        AND DECODE(PR.IDPROVENTO, 36914, H.VALORINFO, 38389, H.VALORINFO, 36952, 999, 38390,H.VALORINFO, H.VALORPROVENTO) > 0 ' +#13#10+
          '                        AND NVL(H.FLGESTORNO, 0) = 0 ' +#13#10+
          '                        AND PR.IDGRUPORUBRICA = GR.IDGRUPORUBRICA(+) ' +#13#10+
          '                        AND H.IDMODULO = 18 ' +#13#10+
          '                        AND H.FLGPENSAOALIM <> 2 ' +#13#10+
          '                        AND H.CODIRRFDARF = ''0473'' ' +#13#10+
          '                      GROUP BY D.IDPESSOA, ' +#13#10+
          '                            H.CODIRRFDARF, ' +#13#10+
          '                            CASE WHEN SUBSTR(PR.CODPROVDESC,2,3) IN (''430'',''459'',''513'',''514'',''515'',''516'',''477'',''482'',''483'',''484'') THEN  NVL(UPPER(GR.DESCRICAO), ''OUTROS'') || '' - EQUAC''' +#13#10+
          '                                 ELSE NVL(UPPER(GR.DESCRICAO), ''OUTROS'') END) ' +#13#10+
          '                WHERE VALOR > 0 ' +#13#10+
          '               GROUP BY IDPESSOA, CODIRRFDARF) B ON B.IDPESSOA = A.IDPESSOA ' +#13#10+
          '  LEFT JOIN (SELECT IDPESSOA, SUM(VALOR) AS VALOR, CODIRRFDARF AS CODNATUREZA ' +#13#10+
          '               FROM (SELECT D.IDPESSOA, ' +#13#10+
          '                            CASE WHEN SUBSTR(PR.CODPROVDESC,2,3) IN (''430'',''459'',''513'',''514'',''515'',''516'',''477'',''482'',''483'',''484'') THEN  NVL(UPPER(GR.DESCRICAO), ''OUTROS'') || '' - EQUAC'' ' +#13#10+
          '                                 ELSE  NVL(UPPER(GR.DESCRICAO), ''OUTROS'') END AS CODPROVDESC, ' +#13#10+
          '                            SUM(DECODE(H.VALORPROVENTO, 0, (DECODE(H.FLGTIPODESC, ''K'', ' +#13#10+
          '                                (DECODE(PR.FLGDESCONTO, 0, H.VALORINFO, -H.VALORINFO)), ' +#13#10+
          '                                (DECODE(PR.FLGDESCONTO, 0, H.VALORPROVENTO, -H.VALORPROVENTO)))), ' +#13#10+
          '                                (DECODE(PR.FLGDESCONTO, 0, H.VALORPROVENTO, -H.VALORPROVENTO)))) AS VALOR, ' +#13#10+
          '                            H.CODIRRFDARF ' +#13#10+
          '                       FROM PROVDESC PR, ' +#13#10+
          '                            HISTRUBSAL H, ' +#13#10+
          '                            DEPENTIT D, ' +#13#10+
          '                            PESSOA P, ' +#13#10+
          '                            PESSOAFISICA PF, ' +#13#10+
          '                            GRUPORUBRICA GR ' +#13#10+
          '                      WHERE PR.FLGTPRUBRICA LIKE ''%B%'' ' +#13#10+
          '                        AND H.IDRUBRICA = PR.IDPROVENTO ' +#13#10+
          '                        AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + QuotedStr(IntToStr(pAno)) +#13#10+
          '                        AND (DECODE(H.IDTITULAR, H.IDPESSOA, H.IDPESSOA, H.IDRESPONSAVEL) = ' +#13#10+
          '                             D.IDPESSOA OR H.IDTITULAR = D.IDPESSOA) ' +#13#10+
          '                        AND H.IDTITULAR = D.IDTITULAR ' +#13#10+
          '                        AND D.IDPESSOA = P.IDPESSOA ' +#13#10+
          '                        AND H.IDRESPONSAVEL = P.IDPESSOA ' +#13#10+
          '                        AND P.NUMDOCUMENTO = ' + QuotedStr(pNumDocumento)  +#13#10+
          '                        AND P.IDPESSOA = PF.IDPESSOA ' +#13#10+
          '                        AND DECODE(PR.IDPROVENTO, 36914, H.VALORINFO, 38389, H.VALORINFO, 36952, 999, 38390, H.VALORINFO, H.VALORPROVENTO) > 0 ' +#13#10+
          '                        AND NVL(H.FLGESTORNO, 0) = 0 ' +#13#10+
          '                        AND PR.IDGRUPORUBRICA = GR.IDGRUPORUBRICA(+) ' +#13#10+
          '                        AND H.IDMODULO = 18 ' +#13#10+
          '                        AND H.FLGPENSAOALIM <> 2 ' +#13#10+
          '                        AND H.CODIRRFDARF = ''9466'' ' +#13#10+
          '                      GROUP BY D.IDPESSOA, ' +#13#10+
          '                            H.CODIRRFDARF, ' +#13#10+
          '                            CASE WHEN SUBSTR(PR.CODPROVDESC,2,3) IN (''430'',''459'',''513'',''514'',''515'',''516'',''477'',''482'',''483'',''484'') THEN NVL(UPPER(GR.DESCRICAO), ''OUTROS'') || '' - EQUAC'' ' +#13#10+
          '                                 ELSE NVL(UPPER(GR.DESCRICAO), ''OUTROS'') END) ' +#13#10+
           '              WHERE VALOR > 0 ' +#13#10+
          '              GROUP BY IDPESSOA, CODIRRFDARF) C ON C.IDPESSOA = A.IDPESSOA' ;

  Result := GetDataPacket(sSQL);
end;

//Everson Cunha - SIG81365 - Início
function TCtrlInformeRendimentos.BuscaCampo407Detalhado(pCPF, pAno: String): OleVariant;
begin
  //Marcos Lima SIG136995 - Inicio
  Result := GetDataPacket('SELECT '+GetHint(pAno)+' DESCRICAO, SUM(VALORPROVENTO) TOT FROM (             ' +#13#10+
                          'SELECT CASE WHEN p.IDPROVENTO IN (37052, 37853, 37854, 38338) THEN            ' +#13#10+
                          '              ''1/3 Abono Pecuniário                            ''            ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (38451) THEN                                 ' +#13#10+
                          '              ''Abono Eventual Acordo Coletivo                  ''            ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (11680, 240) THEN                            ' +#13#10+
                          '              ''Abono Pecuniário                                 ''           ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (40462, 40148) THEN                          ' +#13#10+
                          '              ''Auxílio Creche S/ Tributação                  ''              ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (162, 29529, 33471, 160) THEN                ' +#13#10+
                          '              ''Auxílio Doença - INSS                           ''            ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (170, 172, 34011) THEN                       ' +#13#10+
                          '              ''Compensação CPMF - INSS                         ''            ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (37732, 36291) THEN                          ' +#13#10+
                          '              ''Compensação CPMF - Suplementação 13º Sal. - INSS''            ' +#13#10+
                          '            WHEN p.IDPROVENTO IN (33711, 23160, 35916) THEN                   ' +#13#10+
                          '              ''Suplementação de 13º Sal. - INSS                ''            ' +#13#10+
                          '       ELSE                                                                   ' +#13#10+
                          '         p.DESCRICAO                                                          ' +#13#10+
                          '       END DESCRICAO, H.VALORPROVENTO                                         ' +#13#10+
                          '  FROM cm.HISTRUBSAL H                                                        ' +#13#10+
                          '  JOIN cm.PROVDESC p ON p.IDPROVENTO = H.IDRUBRICA                   ' +#13#10+
                          '  JOIN cm.RUBRICAXESOCIAL rxe ON rxe.IDRUBRICAXESOCIAL = p.IDRUBRICAXESOCIAL  ' +#13#10+
                          ' WHERE H.IDPESSOA IN (SELECT IDPESSOA                                ' +#13#10+
                          '                        FROM PESSOA                                           ' +#13#10+
                          '                       WHERE NUMDOCUMENTO = ' + QuotedStr(pCPF) + ')          ' +#13#10+
                          '   AND H.MESCOBRANCA BETWEEN ' + quotedStr(pAno + '/01') + ' AND ' + quotedStr(pAno + '/12') +#13#10+
                          '   AND H.IDINFORME IN (SELECT IDINFORME                              ' +#13#10+
                          '                         FROM cm.INFORME                                      ' +#13#10+
                          '                        WHERE CODinforme = 407))                              ' +#13#10+
                          ' GROUP BY DESCRICAO                                                           ' +#13#10+
                          ' ORDER BY DESCRICAO                                                           ' );
  //Marcos Lima SIG136995 - Fim                          
end;
//Everson Cunha - SIG81365 - Fim

//SIG85183.92415 - início
function TCtrlInformeRendimentos.BuscaTotalPA(pIdFavorecido, pAno,
  pRubrica: String): Double;
begin
  try
     _cdsAux.data := getDataPacket('SELECT SUM(LX.VLRLANC)  AS VLR FROM LANCIRRF L' +#13#10+
                                   ' JOIN LANCXINFORME LX ON L.IDLANCIRRF = LX.IDLANCIRRF ' +#13#10+
                                   ' WHERE L.IDBENEFIRRF = ' + pIdFavorecido + #13#10+
                                   ' AND L.DATAPAGAMENTO BETWEEN TO_DATE(' + QuotedStr('01/01/' + pAno) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr('31/12/' + pAno) + ',''DD/MM/YYYY'')' +#13#10+
                                   ' AND LX.IDINFORME IN (' + pRubrica + ')');
     result := _cdsAux.fieldbyname('VLR').AsFloat;
  except
    result:= 0;
  end;
end;

function TCtrlInformeRendimentos.VerificarBitributacao(pIdPessoa,
  pNumProcesso: String): Boolean;
begin
  try
     _cdsAux.data := getDataPacket('SELECT TIPOACAO FROM PROCJUD WHERE IDPESSOA = ' + QuotedStr(pIdPessoa) + ' AND NUMEROPROCESSO = ' + QuotedStr(pNumProcesso));
     result := _cdsAux.fieldbyname('TIPOACAO').AsInteger = 1;
  except
    result:= False;
  end;
end;
//SIG85183.92415 - fim

{ TPessoa_InformeRendimentos }

Procedure TPessoa_InformeRendimentos.Add(Value: integer);
Begin
  SetLength(FIdPessoa, Length(FIdPessoa) + 1);
  FIdPessoa[Length(FIdPessoa) - 1] := Value;
End;

Function TPessoa_InformeRendimentos.GetSql: String;
Var
  I: integer;
Begin
  Result := '';

  If Length(FIdPessoa) > 1 Then
    Begin
      Result := ' IN (';
      For I := 0 To Length(FIdPessoa) - 2 Do
        Result := Result + FloatToStr(FIdPessoa[I]) + ',';

      Result := Result + FloatToStr(FIdPessoa[Length(FIdPessoa) - 1]) + ')';
    End Else
    Result := ' = ' + FloatToStr(FIdPessoa[0]); //Apenas 1 item no vetor
End;

//SIG85183.92415 -Inicio
function TCtrlInformeRendimentos.BuscaReemBolsoINSSPA13: Double;
begin
  try
     _cdsAux.data := getDataPacket('SELECT VLR FROM '+  ReemBolsoINSSPA13.GetText + 'WHERE RE.IDINFORME  = 162');
     result       := _cdsAux.fieldbyname('VLR').AsFloat;
  except
    result:= 0;
  end;
end;
//SIG85183.92415 - Fim

//Marcos Lima SIG136995 - Inicio
function TCtrlInformeRendimentos.GetHint(pAno: String): String;
begin
  Result := EmptyStr;
  try
    if StrToInt(pAno) > 2022 then
      Result := '/*+ INDEX(H XIE13HISTRUBSAL) */';
  except
    Result := EmptyStr;
  end;
end;
//Marcos Lima SIG136995 - Fim

End.

