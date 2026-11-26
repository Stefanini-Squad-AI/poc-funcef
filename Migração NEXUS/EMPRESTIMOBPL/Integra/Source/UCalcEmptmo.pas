unit UCalcEmptmo;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA


// Alterações:
{------------------------------------------------------------------------------------------------------------
Atender           : WO9439
Data da Alteração : 01/04/2024
Responsável       : Luis Ferrari
Descrição         : Retirado status de Quitação do novo Contrato ao cancelar a Quitação do contrato antigo
------------------------------------------------------------------------------------------------------------
Nº WO             : 14072
Data da Alteração : 17/12/2024
Responsável       : Leandro Pocebon
Descrição         : CalculaItens (Novos campos para a regra 26925/27170) 
------------------------------------------------------------------------------------------------------------
Nº SIG            : 70512 e 70325
Data da Alteração : 06/06/2018
Responsável       : Darivaldo Alencar
Descrição         : Alteração na query dtmCalcEmptmo.qrySaldoAntAtuDia
------------------------------------------------------------------------------------------------------------
Nº SIG            : 64239/64610
Data da Alteração : 06/06/2018
Responsável       : Darivaldo Alencar/Marcelo Valério
Descrição         : Numéro de parcelas vindo 0 ao executar a regra 26925
------------------------------------------------------------------------------------------------------------
Nº SOL            : 260816
Nº PPM            : 1051407
Data da Alteração : 26/08/2015
Responsável       : William Moreira da Silva
Descrição         : Ajustes apos Reestruturação da HistMovEmptmo
------------------------------------------------------------------------------------------------------------
Nº SOL            : 261005
Nº PPM            : 1054900
Data da Alteração : 03/09/2015
Responsável       : William Moreira da Silva
Descrição         : Ao chamar a procedure de AcertaSituacaoContratual a transação continuava aberta
------------------------------------------------------------------------------------------------------------
Nº SOL            : 260658
Nº PPM            : 1039277
Data da Alteração : 24/08/2015
Responsável       : William Moreira da Silva
Descrição         : Reestruturação da HistMovEmptmo
------------------------------------------------------------------------------------------------------------
Nº SOL            : 253185
Nº PPM            : 2040335
Data da Alteração : 30/04/2015
Responsável       : Wylliam Leite da Silva
Descrição         : Reestruturação da HistMovEmptmo
------------------------------------------------------------------------------------------------------------
Nº SOL            : 218798.16629
Nº PPM            : 560594
Data da Alteração : 25/11/2014
Alteração Form    : Criar opção para geração por contratos
Responsável       : William Santana
Descrição         : Overload da função CalculaItensDiverg para exibir barra de progresso dupla
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
-------------------------------------------------------------------------------
Pendência   : SOL 201723 Kintana 1955492
Responsável : Marcio Sanches Spinosa SOL 201723 Kintana 1955492
Data        : 11/03/2013
Descrição   : Ajuste na validação de contratos encerrados para mudar o status
              caso não possua saldo devedor
-------------------------------------------------------------------------------
Pendência   : SOL 195657 Kintana 1911743
Responsável : Fernando Xavier
Data        : 18/01/2013
Descrição   : contrato está sendo quitado antes do recebimento automático da
              parcela (modalidade: CREDINÂMICO FUNCEF 13º NOVEMBRO)
-------------------------------------------------------------------------------
Pendência   : SOL 198995 Kintana 1914430
Responsável : Fernando Xavier
Data        : 17/01/2013
Descrição   : Inconsistência na concessão de empréstimo para a matrícula 1299372,
              está considerando as informações do plano 66 ao invés do plano 2
-------------------------------------------------------------------------------
Pendência   : SOL 198253 KINTANA 1908783
Responsável : BRUNO AZEVEDO
Data        : 10/01/2013
Descrição   : Ajuste na consulta da operação passada nas querys de entrada.
-------------------------------------------------------------------------------
Pendência   : SOL 194179 Kintana 1851337
Responsável : Fernando Xavier
Data        : 09/11/2012
Descrição   : No processamento da rotina de Recebimento automático, alguns
              contratos que foram encerrados na geração de parcelas voltam
              a ficar ativos
-------------------------------------------------------------------------------
Pendência   : SOL 189681 KINTANA 1794045
Responsável : Fernando Xavier
Data        : 10/09/2012
Descrição   : Voltar o SOL 189156
-------------------------------------------------------------------------------
Pendência   : SOL 189156 KINTANA  1785083
Responsável : Fernando Xavier
Data        : 31/08/2012
Descrição   : ajuste na regra 25782, devido ao erro apresentado na simulação
              de amortização
-------------------------------------------------------------------------------
Pendência   : SOL 184911 KINTANA 1738501
Responsável : BRUNO AZEVEDO
Data        : 19/07/2012
Descrição   : Ajuste na consulta de saldo devedor.
-------------------------------------------------------------------------------
Pendência   : SOL 184423 KINTANA 1724052
Responsável : Thiago Dantas Melo
Data        : 06/07/2012
Descrição   : na validação dos itens em aberto o sistema considere mês/ano de
              competência e não de cobrança.
-------------------------------------------------------------------------------
Pendência   : SOL 179805 KINTANA 1659409
Responsável : Thiago Dantas Melo
Data        : 19/06/2012
Descrição   : Na concessão a verificação de inadimplência deve ocorrer com base
              na data prevista
--------------------------------------------------------------------------------
Pendência   : SOL 182298 KINTANA 1696751
Data        : 13/06/2012
Autor       : Thiago Melo
Descrição   : Erro na simulações/concessões dos empréstimos.
--------------------------------------------------------------------------------
Pendência   : SOL 181899 KINTANA 1688596
Data        : 05/06/2012
Autor       : Otacilio Aquino
Descrição   : Alterado o valor de retorno da função ValidaMargemConsAtual e
              ValidaPrestacaoProjetada.
--------------------------------------------------------------------------------
Pendência   : SOL 156456 KINTANA 1234816
Data        : 26/04/2012
Autor       : Wylliam Leite da Silva >>> Monica Gonzaga
Descrição   : Foi alterada a query de entrada para receber como
              parametro iVLRLIQZERO
--------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Criado um novo campo "PNUMPROTOCOLO", para gravar o valor no NUP.
-------------------------------------------------------------------------------
Pendência   : SOL 179151 KINTANA 1647786
Responsável : BRUNO AZEVEDO
Data        : 26/04/2012
Descrição   : Ajuste na nomeclatura das consultas geradas no sol 144458.
-------------------------------------------------------------------------------
Pendência   : 175562 KINTANA 1637191
Responsável : BRUNO AZEVEDO
Data        : 18/04/2012
Descrição   : Ajuste ao encerrar o contrato.
-------------------------------------------------------------------------------
Pendência   : SOL 144458 KINTANA 1208325
Responsável : ERALDO SILVA
Data        : 14/03/2012
Descrição   : Criar campos "Prestação Atual", "Prestação Projetada" e "Margem"
-----------------------------------------------------
Pendência   : SOL 176404 Kintana 1609941
Responsável : Fanuel Marinho
Data        : 02/04/2012
Descrição   : Adicionar o campo VALORSOLIC, com o valor solicitado do contrato,
              à query de entrada dos encargos
-------------------------------------------------------------------------------
Pendência   : SOL176201 Kintana 1606793
Responsável : DOUGLAS DE SIQUEIRA
Data        : 21/03/2012
Descrição   : Criação de campo TXJUROSANT nas queries de entrada da regra de concessão
-------------------------------------------------------------------------------
Pendência   : SOL 176787 KINTANA 1615033
Responsável : BRUNO AZEVEDO
Data        : 21/03/2011
Descrição   : Ajuste na query de entrada da função CalculaItens.
-------------------------------------------------------------------------------
Pendência   : SOL 167580 Kintana 1494022
Responsável : Monica Gonzaga
Data        : 13/03/2012
Descrição   :Foi feito um acerto de quitação com valor igual a zero e a quitação dos
             contratos quitados a partir desse contrato deve ser desfeita.
--------------------------------------------------------------------------------
Pendência   : SOL 176079 KINTANA 1604454
Responsável : BRUNO AZEVEDO
Data        : 15/03/2011
Descrição   : Ajuste na query de entrada da função CalculaItens.
-------------------------------------------------------------------------------
Pendência   : SOL 176064 KINTANA 1604085
Responsável : BRUNO AZEVEDO E Wylliam Leite da Silva
Data        : 14/03/2012
Descrição   : Foi modificado a query de entrada substituindo os valores -1 pelo
              seus reais valores
-------------------------------------------------------------------------------
Pendência   : SOL174268/8141 Kintana 1573410
Responsável : Fanuel Junior
Data        : 15/02/2012
Descrição   : Adicionar o campo DATAFIMANT à query de entrada da regra de validação de suspensão
--------------------------------------------------------------------------------
Pendência     : SOL 163624   Kintana 1399837
Responsável   : Edilaine Ferraresi
Data          : 27/01/2012
Rotina        : CalculaItens
Descrição     : Modificação da query que busca valor máximo da prestação
-------------------------------------------------------------------------------
Pendência   : SOL 167273 KINTANA 1467390
Responsável : BRUNO AZEVEDO
Data        : 25/10/2011
Descrição   : Modificação na query que busca a margem.
-------------------------------------------------------------------------------
Pendência   : SOL 160718 Kintana 1351446
Responsável : Fanuel Junior
Data        : 05/07/2011
Descrição   : Correção do erro "Não há remuneração base"
-------------------------------------------------------------------------------
Pendência   : SOL 160419 Kintana 1346233
Responsável : Fanuel Junior
Data        : 28/06/2011
Descrição   : Erro na query de entrada do prazo máximo
-------------------------------------------------------------------------------
Pendência   : SOL 160129 Kintana 1333987 
Responsável : Fernando Xavier
Data        : 22/06/2011
Descrição   : Favor verificar a mensagem de erro - EDatabaseError - qryRegra: No SQL statement available
-------------------------------------------------------------------------------
Pendência   : SOL 159760 Kintana 1321872
Responsável : Fernando Xavier
Data        : 15/06/2011
Descrição   : Erro de regras na concessão de empréstimos para algumas matrículas.
              alteração na query de entrada da função BuscaPrazoContrato
-------------------------------------------------------------------------------
Pendência   : SOL 156238 Kintana 1225026
Responsável : Renan Cristiano
Data        : 08/04/2011
Descrição   : Alteração na condição da query de entrada da regra de Elegibilidade.
-------------------------------------------------------------------------------
Pendência   : SOL 155006 Kintana 1196054
Responsável : Fanuel Junior
Data        : 23/03/2011
Descrição   : Adicionado o campo de quantidade parcelas restantes na query de
              entrada de validação de suspensão
-------------------------------------------------------------------------------
Pendência   : SOL 154142 KINTANA 1171213
Responsável : BRUNO AZEVEDO
Data        : 10/03/2011
Descrição   : Adicionado "INSCRICAODATA ASC" no order da query de elegibilidade.
-------------------------------------------------------------------------------
Pendência   : SOL 154310 KINTANA 1178383
Responsável : Fernando Xavier
Data        : 10/03/2011
Descrição   : Após a seleção dos itens na funcionalidade Tratamento de divergência
   aparece o erro "field 'IDTMPDESC' not found", inviabilizando a execução do processo.
--------------------------------------------------------------------------------
Pendência   : SOL SOL153161 KINTANA 1149771
Responsável : Fanuel Junior
Data        : 25/02/2011
Descrição   : Inserção dos campos SITENVIO e OPERACAO nas queires de entrada de quitação
--------------------------------------------------------------------------------
Responsável : Fanuel Junior
Pendência   : SOL 153604 Kintana 1161039
Descrição   : Ordernar a query de entrada de elegibilidade pelo campo FLGINTERNO
-------------------------------------------------------------------------------

Responsável : Renato Visoni
Pendência   : SOL 144455 Kintana 1152675
Descrição   : Incluir campo de Saldo Devedor na data da prestação e taxa de juros
              na query de entrada de validação de suspensão.
-------------------------------------------------------------------------------
Pendência   : SOL 153259 KINTANA 1152177
Responsável : BRUNO AZEVEDO
Data        : 22/02/2011
Descrição   : Correção ao buscar o plano na query de salário base.
-------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 152867 Kintana 1145739
Descrição   : Alteração na SQL de entrada para a regra de elegibilidade.
-------------------------------------------------------------------------------
Pendência   : SOL 151331 KINTANA 1108957
Responsável : BRUNO AZEVEDO
Data        : 28/01/2011
Descrição   : Correção na inclusão dos itens de quitação.
-------------------------------------------------------------------------------
Pendência   : SOL 151973 KINTANA 1124751
Responsável : Fanuel Junior
Descrição   : Incluir campo com o valor do FGQC, conforme é feito com a prestação
--------------------------------------------------------------------------------
Pendência   : SOL 151964 KINTANA 1124438
Responsável : Fanuel Junior
Descrição   : Adicionado o campo IDTIPOCONTREMPTMO na query de entrada do valor
              de salário base.
--------------------------------------------------------------------------------
Pendência   : SOL 152094 KINTANA 1126686
Responsável : BRUNO AZEVEDO
Data        : 01/02/2011
Descrição   : Ajuste na query de entrada da regra de elegibilidade.
--------------------------------------------------------------------------------
Pendência   : SOL 150176 Kintana 1086197
Responsável : Renato Visoni
Descrição   : Alteração na consulta que busca o valor máximo de prestação.
--------------------------------------------------------------------------------
Pendência   : SOL 149621 KINTANA 1076936
Responsável : BRUNO AZEVEDO
Data        : 23/12/2010
Descrição   : Ajuste na query de entrada da função "Busca margem".
--------------------------------------------------------------------------------
Pendência   : SOL 149542 KINTANA 1074985
Responsável : BRUNO AZEVEDO
Data        : 21/12/2010
Descrição   : Correção ao limpar o componente "Regra" antes de cada execução.
--------------------------------------------------------------------------------
Pendência   : SOL 148748 Kintana 1050764
Responsável : Fanuel Junior
Data        : 08/12/2010
Descrição   : Adicionado o filtro bfc.idtppagtobenefic = 1 na query que monta
              a query de entrada
--------------------------------------------------------------------------------
Pendência   : SOL 147690 KINTANA 1031074
Responsável : Fernando Xavier
Data        : 23/11/2010
Descrição   : Na query de entrada de margem apesar de ser selecionado o plano 2, 
as informações de sitpart estão sendo buscadas do plano 74.
--------------------------------------------------------------------------------
Pendência   : SOL 147330 KINTANA 1017161 
Responsável : Fernando Santana
Data        : 19/10/2010
Descrição   : Ajuste na query 'Busca Margem'.
--------------------------------------------------------------------------------
Pendência   : SOL 145941 KINTANA 984808
Responsável : BRUNO AZEVEDO
Data        : 19/10/2010
Descrição   : Ajuste na query 'Busca Margem'.
--------------------------------------------------------------------------------
Pendência   : SOL 141615 KINTANA 987740
Responsável : BRUNO AZEVEDO
Data        : 19/10/2010
Descrição   : Ajuste na query de entrada da regra 'Prazo máximo para concessão'.
--------------------------------------------------------------------------------
Pendência   : SOL 142592 Kintana 912881
Responsável : Fernando Santana
ata         : 24/08/2010
Descrição   : Add o campo c.idbenef na sql da function ValidaMesesSuspensao
              Retira o comentário referente ao SOL 141670 Kintana 897588.
--------------------------------------------------------------------------------
Pendência   : SOL 137662 Kintana 836092
Responsável : Ádler Souza
Descrição   : Exibir mensagem que não é possível aproveitar suspensão quando a
              suspensão não for do tipo "Sunspensão na Concessão".
--------------------------------------------------------------------------------
Pendência   : SOL 141670 Kintana 897588
Responsável : Ádler Souza
Descrição   : Alterar a identificação dos campos IDPESSOA e IDBENEF na query de
              entrada.
--------------------------------------------------------------------------------
Pendência   : SOL 138561 KINTANA 859566
Responsável : BRUNO AZEVEDO
Data        : 19/07/2010
Descrição   : Somente permitir suspensão caso os cont. ant. já não tenham usado.
--------------------------------------------------------------------------------
Pendência   : SOL 134670 Kintana 796612
Responsável : Renato Visoni
Descrição   : Criação da tela 'Valor Maximo Prestação Participante'
--------------------------------------------------------------------------------
Pendência   : SOL 140487 KINTANA 879715
Responsável : Ádler Souza
Data        : 26/07/2010
Descrição   : Inserir aspas simples no campo DATANASC na query de entrada da
              Regra de BuscaVlrSolicMax.
--------------------------------------------------------------------------------
Pendência   : SOL 140430 KINTANA 878775
Responsável : Ádler Souza
Data        : 26/07/2010
Descrição   : Inserir o campo IDPESSJUR na query de entrada da Regra de
              BuscaMargem para o tipo 1.
--------------------------------------------------------------------------------
Pendência   : SOL 136877 KINTANA 858970
Responsável : Ádler Souza
Data        : 15/07/2010
Descrição   : Inserir o campo DATANASC na query de entrada da Regra de
              BuscaVlrSolicMax.
--------------------------------------------------------------------------------
Pendência   : SOL 134495 Kintana 855067
Responsável : Renato Visoni
Data        : 14/07/2010
Descrição   : Alguns contratos não foram gravados os items de quitação e alguns
              ficaram com a situação incorreta.
--------------------------------------------------------------------------------
Pendência   : SOL 136965 KINTANA 822333
Responsável : BRUNO AZEVEDO
Data        : 08/06/2010
Descrição   : Exibir as mensagens do regra na função UtilizaRegraData.
--------------------------------------------------------------------------------
Pendência   : SOL 136396 KINTANA 815982
Responsável : Ádler Souza
Data        : 25/05/2010
Descrição   : Inserir os campos SALMANTIDO, DATANASC e DEPENDIRRF na query de
              entrada de suspensão.
--------------------------------------------------------------------------------
Pendência   : SOL 136370 KINTANA 815304
Responsável : Ádler Souza
Data        : 21/05/2010
Descrição   : Adicionado o campo SALPARTICIPACAO da tabela PARTPREVPLAN na regra
              de validação de suspensão.
--------------------------------------------------------------------------------
Pendência   : SOL 136207 KINTANA 813120
Responsável : Ádler Souza
Data        : 21/05/2010
Descrição   : Ajustado a consulta de entrada para para filtrar somente um contrato
              para amortização.
--------------------------------------------------------------------------------
Pendência   : SOL 136206 KINTANA 813118
Responsável : Ádler Souza
Data        : 20/05/2010
Descrição   : Correção na query de entrada da validação de suspensão.
--------------------------------------------------------------------------------
Pendência   : SOL 135773 KINTANA 809154
Responsável : Ádler Souza
Data        : 19/05/2010
Descrição   : Correção na query que busca valores para Regra da Margem.(BuscaMargem)
--------------------------------------------------------------------------------
Data        : 13/03/2009
Autor       : Daniel Begnami
Pendencia   : SOL 109599
Descrição   : Implementado mais um parametro para a funcao AcertaSituacaoContratual para
              optar por nao gravar ou gravar o campo DATACANC da tabela CONTRATOEMPTMO.
--------------------------------------------------------------------------------
Pendência   : SOL 135615 KINTANA 807538
Responsável : Ádler Souza
Data        : 17/05/2010
Descrição   : Correção na query de entrada da validação de suspensão para retornar
a quantidade de prestações suspensas corretamente.
--------------------------------------------------------------------------------
Pendência   : SOL 135502 KINTANA 806023
Responsável : Ádler Souza
Data        : 12/05/2010
Descrição   : Inclusão de campos na query de entrada da regra ValidaSuspensao.
--------------------------------------------------------------------------------
Pendência   : SOL 135229 KINTANA 802629
Responsável : Ádler Souza
Data        : 07/05/2010
Descrição   : Inclusão de campos na query de entrada da regra ValidaSuspensao.
--------------------------------------------------------------------------------
Pendência   : SOL 134013 KINTANA 785440
Responsável : Ádler Souza
Data        : 14/04/2010
Descrição   : Correção na query no momento em que chama a regra de suspensão.
--------------------------------------------------------------------------------
Pendência   : SOL 133773 KINTANA 777881
Responsável : BRUNO AZEVEDO
Data        : 08/04/2010
Descrição   : Adicionado TO_DATE para ajustar a formatação da data.
--------------------------------------------------------------------------------
Pendência   : SOL 133044 KINTANA 771583
Responsável : BRUNO AZEVEDO
Data        : 29/03/2010
Descrição   : Adicionado o campo HMEORIGEM na union da query.
--------------------------------------------------------------------------------
Pendência   : SOL 132900 KINTANA 769848
Responsável : BRUNO AZEVEDO
Data        : 25/03/2010
Descrição   : Adicionado distinct na query dados para trazer o saldodev.
--------------------------------------------------------------------------------
Pendência   : SOL 132357 Kintana 761914
Responsável : Thiago Passos
Data        : 15/03/2010
Descrição   : Adicionado os campos ULTPARCCOBR, IDTIPOSUSPEMPTMO,FLGSUSPENSAO,PERCENTUAL
FORMACOBRANCA, DATACREDITO na segunda linha da sql de entrada da regra de Margem Consignavel
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 131409 KINTANA 747953
Responsável : Jessica Lana
Data        : 02/03/2010
Descrição   : Adicionado o campo ULTDATAQUIT na sql de entrada da regra de Quitação.
--------------------------------------------------------------------------------
Pendência   : SOL 131233 KINTANA 745205
Responsável : BRUNO AZEVEDO
Data        : 24/02/2010
Descrição   : Adicionado condição para incluir lanc. na rotina InsertMovEmptmo.
--------------------------------------------------------------------------------
Pendência   : SOL 131199 KINTANA 744424
Responsável : BRUNO AZEVEDO
Data        : 25/02/2010
Descrição   : Somente gravar o campo hmedataefetiva e hmedataatualiza se o valor > 0.
--------------------------------------------------------------------------------
//******************************************************************************
Pendência   : SOL 130911 Kintana 740684
Responsável : Jéssica Lana
Data        : 19/02/2010
Descrição   : Acerto na sqlAux com a inclusão de TO_DATE no campo datavencto
--------------------------------------------------------------------------------
Pendência   : SOL 124955 Kintana 640066
Responsável : Renato Visoni
Data        : 16/11/2009
Descrição   : Adicionamos à query de entrada da regra de margem a data da quitação
do último contrato quitado pela tela de quitação antecipada e o valor da última
prestação gerada para este contrato.
--------------------------------------------------------------------------------
//Rotina: BuscaMargem
//Nº SOL: 131189
//Nº KINTANA: 744558
//Data da Alteração: 19/02/2010
//Responsável: Ádler Souza
//Descrição: Criação de novo valor para o campo DATACREDITO da query de entrada
//           da regra de margem.
//******************************************************************************
Pendência   : SOL 129845 Kintana 716158
Responsável : Ádler Souza
Data        : 20/01/2010
Descrição   : Inclusão de campo com o valor da última prestação cobrada.
--------------------------------------------------------------------------------
Pendência   : SOL 129591 Kintana 712165
Responsável : Renato Visoni
Data        : 13/01/2010
Descrição   : Alterar a query de entrada da regra de margem para que valores nulo sejam passados como '-1'.
--------------------------------------------------------------------------------
Pendência   : SOL 129553 Kintana 711464
Responsável : Renato Visoni
Data        : 13/01/2010
Descrição   : Erro na conversão de datas em sistemas operacionais americanos.
--------------------------------------------------------------------------------
Pendência   : SOL 129465 Kintana 710165
Responsável : Renato Visoni
Data        : 11/01/2010
Descrição   : Inserir o campo Data de Credito na query de entrada da
              regra de margem.
--------------------------------------------------------------------------------
Pendência   : SOL 129432 Kintana 709925
Responsável : Renato Visoni
Data        : 11/01/2010
Descrição   : Inserir o campo com o destino de cobrança (hmeformacobranca)
da última prestação vencida (maior da de vencimento anterior a data de hoje)
na query de entrada da regra de margem.
--------------------------------------------------------------------------------
Pendência   : SOL 129375 Kintana 708500
Responsável : Renato Visoni
Data        : 11/01/2010
Descrição   : Incluir campos de FLGSUSPENSAO, PERCENTUAL SUSPENSO e
              TIPO SUSPENSAO na SQL de entrada da regra de Margem.
--------------------------------------------------------------------------------
Pendência   : SOL 129170 KINTANA 706353
Responsável : Ádler Souza
Data        : 05/01/2010
Descrição   : Alteração na função ExistemItensEmAberto, passando os parametros
PHMEMESCOBRANCA e PHMEANOCOBRANCA para String(aplicando uma máscara).
--------------------------------------------------------------------------------
Pendência   : SOL 128731 KINTANA 692039
Responsável : Thiago Passos
Data        : 18/12/2009
Descrição   : Inclusão do valor da Tx de Juros da Query de Entrada, ao invés de -1
--------------------------------------------------------------------------------
Pendência   : SOL 128694 KINTANA 691547
Responsável : Daniel Begnami
Data        : 17/12/2009
Descrição   : Foi identificado um erro no saldo devedor quando é feito atualização de saldo
              de contratos logo após terem sido processado o cálculo de "Tratamento de divergências".
              Por favor, corrigir este grave problema.
--------------------------------------------------------------------------------
Pendência   : SOL 127055 KINTANA 669953
Responsável : Jéssica Lana
Data        : 23/11/2009
Descrição   : Alteração na qry de entrada da regra que calcula os itens.
              Alteramos  a qry passando parametros para NUMPARCELAS, SALDODEVANT
              SALDOEPANT, DATACREDITO, DATACREDITOANT.
--------------------------------------------------------------------------------
Pendência   : SOL 124858 KINTANA 638072
Responsável : Renato Visoni
Data        : 27/10/2009
Descrição   : Alteração na qry de entrada da regra que calcula os itens.
              Adicionamos a data de credito e o valor do saldo devedor.
--------------------------------------------------------------------------------
Pendência   : SOL 122788  KINTANA 607006
Responsável : Ádler Souza
Data        : 06/10/2009
Descrição   : Aplicação de nova regra "ExisteQuitacaoAberto".
-------------------------------------------------------------------------------------------------
Pendência   : SOL 124189  KINTANA 628194
Responsável : Jéssica Lana
Data        : 14/09/2009
Descrição   : Na query de entrada da regra de elegibilidade a sql não estava identificando
              para procuração, tutela e curatela. Foi inserido :
              AND BFC.IDPESSOA = BTP.IDPESSOA E NA SUBQUERY AND BFC.IDTITULAR = SB1.IDTITULAR
-------------------------------------------------------------------------------------------------
Pendência   : SOL 122239  Kintana 599543
Responsável : Daniel Begnami
Data        : 24/07/2009
Descrição   : Alteração na Query de Entrada da Regra de Suspensão
--------------------------------------------------------------------------------------------------
Pendência   : SOL 122185 Kintana 596723
Responsável : Renato Visoni
Data        : 21/07/2009
Descrição   : Na query de entrada da regra de validação da suspensão estava considerando
os contratos de modalidades cuja quitação não é obrigatória, e estava passando o idcontratoemptmo
com um numero negativo para a qry de entrada da regra.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 121623  Kintana 588162
Responsável : Daniel Begnami
Data        : 06/07/2009
Descrição   : Alteração de parâmetro False par True
--------------------------------------------------------------------------------------------------
Pendência   : SOL 108324  Kintana 512291
Responsável : Renato Visoni
Data        : 20/03/2009
Descrição   : Criação da função "TemItensAbertoPorMatricula", que verifica se a matricula tem itens em aberto,
              em geral.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 119973 Kintana 573499
Responsável : Renato Visoni
Data        : 17/06/2009
Descrição   : Alteração na Qry de entrada da regra de elegibilidade.
-----------------------------------------------------------------------------------------------------
Pendência   : SOL 114575  KINTANA 535771
Responsável : Jéssica
Data        : 29/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-----------------------------------------------------------------------------------------------------
Rotina    : CalculaItensDiverg, InsertMovEmptmo, GravaMovEmptmo e SaldoDevAnt
Data      : 21/11/2008
Autor     : Daniel Begnami
Pendência : 92334_394810
Descrição : O Tratamento será feito com o uso de uma tabela auxiliar.
-----------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Pendência   : 108099 - Kintana: 487201
Responsável : Daniel Begnami
Data        : 13/04/2008
Descrição   : Criação de novas modalidades de emprestimo.
--------------------------------------------------------------------------------------------------
Data      : 01/12/2008
Autor     : Renato Visoni
Pendencia : SOL 102371/ Kintana 455819
Descrição : Ajuste nas funções (CalculaItensQuitacaoNOVA e CalculaItensQuitacao) pois o sistema estava
            fazendo o Cálculo do Saldo Devedor na Quitaão por falecimento de forma incorreta.
--------------------------------------------------------------------------------------------------
Data      : 20/11/2008
Autor     : Renato Visoni
Pendencia : SOL 100478,100476,100479
Descrição : Criação dos campos Tipo de Recurso e Origem do Recurso
--------------------------------------------------------------------------------------------------
Rotina    : AcertaSituacaoContratual
Data      : 03/11/2008
Autor     : Renato Visoni
Pendencia : SOL 100095 KINTANA 442582
Descrição : Sistema não estava desfazendo a geração de parcelas dos contratos das modalidades de 13º,
            Quando a Situação do contrato estava 'A' o sistema nao jogava nenhuma data no Campo DataCanc
            deixando salvar a data '00/00/0000'.
----------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 03/09/2008
Autor     : Daniel Begnami
Sol       : 94957
KT        : 409602
Descrição :  Implementado o campo VALORPARCANT da query de entrada da regra 25775.
             Passado o valor da prestação do mês anterior ao mês que está sendo gerada.
             Caso nao haja prestação anterior passar zero }
{--------------------------------------------------------------------------------------------------
Rotina    : BuscaReserva
Data      : 5/09/2007
Autor     : Marchetti
Pendência : 26403
Descrição : Criado o sql de entrada específico para a FUSESC, pois o participante no processo de
            implantação, não possuirá reserva cadastrada, sendo digitado o valor a partir da regra
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CancelaAlteracaoConcessao
Data      : 06/06/2007
Autor     : Marchetti
Pendência : 25523
Descrição : Colocada critica para validar as operações. Em caso de ocorrencia de algum erro, retorna
            sem continuar o processo, nao permitindo o cancelamento da alteração da concessão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CancelaAmortizacao
Data      : 06/06/2007
Autor     : Marchetti
Pendência : 25523
Descrição : Colocada critica para validar as operações. Em caso de ocorrencia de algum erro, retorna
            sem continuar o processo, nao permitindo o cancelamento da amortização
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CancelaQuitacao
Data      : 06/06/2007
Autor     : Marchetti
Pendência : 25523
Descrição : Colocada critica para validar as operações. Em caso de ocorrencia de algum erro, retorna
            sem continuar o processo, nao permitindo o cancelamento da quitação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaSuspensao
Data      : 02/05/2007
Autor     : Marchetti
Pendência : 25167
Descrição : passagem do Parametro do status da suspensao
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaConcessaoNaoEfetivada
Data      : 13/04/2007
Autor     : Marchetti
Pendência : 23407
Descrição : Faz verificacao conforme parametro passado.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacaoNOVA
Data      : 23/08/2006
Autor     : Marchetti
Pendência : 23090
Descrição : Inibidas as linhas que gravavam a string sSQLEXEC, pois ela estava estourando quando o sql
            de entrada da regra era muito extenso. Como a rotina de cálculo chama um processo passando
            uma query já montada para a regra, não é mais necessário passar o sql de entrada para as
            regras de quitação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : MarcaItensQuitados e DesmarcaItensQuitados
Data      : 26/06/2006
Autor     : Alberto Carvalho
Pendência : 22671
Descrição : Grava em HISTMOVEMPTMO.IDUSUARIOESTORNO o usuário que marcou o item quitado e
            limpa a mesma coluna caso o item quitado seja desmarcado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : GravaMovEmptmo e InsertMovEmptmo
Data      : 29/05/2006
Autor     : Marchetti
Pendencia : 20906
Descrição : Passagem do parametro IDCBANCARIA
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaPrazoConcessao e BuscaPrazoContrato
Data      : 24/04/2006
Autor     : André Pontes
Pendencia : 21945
Descrição : NVL(BEN.DATANASC, PFI.DATANASC) AS DATANASC
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelecionaItensCancelamento
Data      : 01/02/2006
Autor     : André Pontes
Pendencia : 21225
Descrição : Filtro por Data
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaIntensQuitacao
Data      : 26/01/2006
Autor     : André Pontes
Pendencia : 20599
Descrição : Passagem do saldo devedor à data da morte para REFER também
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CancelaAlteracaoConcessao
Data      : 05/01/2006
Autor     : André Pontes
Pendencia : 20567
Descrição : Nova funcionalidade
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensDiverg e CalculaItensQuitacao
Data      : 07/10/2005
Autor     : André Pontes
Pendencia : 20261
Descrição : Passagem dos itens abonados (regulada por parâmetro do sistema) nas queries de entrada
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : MarcaItensQuitados
Data      : 28/09/2005
Autor     : André Pontes
Pendencia : 20130
Descrição : Passagem do IDTipoSuspEmptmo no campo FlgSuspensao, para a regra de itens quitados, da
            mesma forma como é feito na quitação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaSalarioBase
Data      : 26/07/2005
Autor     : André Pontes
Pendencia : 19822
Descrição : Filtro por IDPESSOA (além do que já existia por IDTITULAR) na BenefBFCiario, porque
            estava somando o salário de todos os beneficiários de um mesmo titular
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaElegibilidade
Data      : 13/07/2005
Autor     : Marchetti
Pendência : 19182
Descrição : Colocado o campo IDSITDEPENDENTE (tabela DEPENDENTE) na query da regra
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaSalarioBase
Data      : 05/07/2005
Autor     : André Pontes
Pendencia : 19631
Descrição : Join ELP.IDPESSJUR = PPP.IDPESSJUR também para FCRT (a pedidos). REFER "ganhou" também.
            Segundo Marchetti, CBS não quer join
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaContrato
Data      : 04/07/2005
Autor     : André Pontes
Pendencia : 19617
Descrição : Correção da query de busca de nº máximo de contratos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 14/06/2005
Autor     : Marchetti
Pendencia : 19196
Descrição : Colocada a busca do campo DATANASC da tabela PESSOAFISICA e passada para o sql da regra
            através da variável sDataNasc
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelecionaItensCancelamento
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelecionaItensCancelamento
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '   AND H.HMESEQCOBRANCA         = 1 '
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaSituacaoContratual
Data      : 27/09/2004
Autor     : André Pontes
Pendência : -
Descrição : Correção da lógica, que estava verificando saldo devedor incorretamente

---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaReserva
Data      : 24/09/2004
Autor     : Marchetti
Pendência : 17507
Descrição : Colocado NVL para o campo NUMDEPIRRF
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaInscricao e ValidaContrato
Data      : 23/09/2004
Autor     : Marchetti
Pendência :
Descrição : Troca do sql nas rotinas para contemplar os parametros da TIPOCONTREMPTMO ao invés da
            TIPOEMPTMO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Verifica...
Data      : 14/09/2004
Autor     : André Pontes
Pendência : -
Descrição :
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaMargem
Data      : 06/08/2004
Autor     : André Pontes
Pendência : -
Descrição : Correção de um join na query principal, onde a não existência de registro na
            BenefBFCiario inviabilizava a busca da PessoaFisica, trazendo data de nascimento NULA
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 15/06/2004
Autor     : André Pontes
Pendência :
Descrição :
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 14/06/2004
Autor     : André Pontes
Pendencia : 16984
Descrição : Passagem da data de falecimento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 04/03/2004
Autor     : André Pontes
Pendência : -
Descrição : SQL de entrada da regra: order by ORDENACAO + ...
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaElegibilidade
Data      : 29/01/2003
Autor     : Marchetti
Pendência : 15979
Descrição : Incluido o join de IDPESSJUR entre ELEGPATRO E PARTPREVPLAN. Ja existia para a FUNCEF
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaContrato
Data      : 14/01/2004
Autor     : André Pontes
Pendência :
Descrição : Para FUNCEF, a contagem de contratos ativos passa a obedecer ao cadastro de tipos de
            contrato quitáveis por tipo de contrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaMargem
Data      : 11/01/2004
Autor     : André Pontes
Pendência :
Descrição : Contagem do nº de dependentes para IRRF (DepenTit, FlgImpostor) e passagem do resultado
            para as regras (DEPENDIRRF)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensAmortizacao
Data      : 09/01/2004
Autor     : André Pontes
Pendência :
Descrição : Passagem dos registros referentes aos itens de seguro complementar para a query de entrada
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensAmortizacao
Data      : 08/01/2004
Autor     : André Pontes
Pendência :
Descrição : Passagem do valor total dos itens de seguro e seguro complementar (fVlrSegAnt e
            fVlrSegComplAnt, respectivamente)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 07/01/2004
Autor     : André Pontes
Pendência :
Descrição : Passagem dos registros referentes aos itens de seguro complementar para a query de entrada
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 07/01/2004
Autor     : André Pontes
Pendência :
Descrição : Passagem do valor total dos itens de seguro e seguro complementar (fVlrSegAnt e
            fVlrSegComplAnt, respectivamente)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaMargem e BuscaSalarioBase
Data      : 06/01/2004
Autor     : André Pontes
Pendência :
Descrição : Passagem da data de inscrição para as regras de Margem Consignável e Salário-base
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaElegibilidade
Data      : 19/11/2003
Autor     : Marchetti
Pendencia :
Descrição : Incluido os campo IDSITFUNC
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaSalarioBase
Data      : 17/10/2003
Autor     : Marchetti
Pendencia :
Descrição : Incluido o campo SEQPROPOSTA na query da regra
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaMargem
Data      : 17/10/2003
Autor     : Marchetti
Pendencia :
Descrição : Incluido os campos IDSITFUNC e IDSITPART
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaPrazoConcessao, ValidaSuspensao, BuscaPrazoContrato
Data      : 17/10/2003
Autor     : Marchetti
Pendencia :
Descrição : Alterado o campo IDRESPONSAVEL para o campo IDRESPONNAOREC
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens e BuscaVlrSolicMax
Data      : 17/10/2003
Autor     : Marchetti
Pendencia :
Descrição : Incluido os campos FLGINTERNO e IDPESSOA na query da regra
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EstornaProvisao
Data      : 17/10/2003
Autor     : Marchetti
Pendencia :
Descrição : Verificação de integração contábil
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaDataCredito
Data      : 01/09/2003
Autor     : Marchetti
Pendencia : 14939
Descrição : Incluido o parametro que indica se a inscricao é pela internet ou nao
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InsertMovEmptmo
Data      : 28/08/2003
Autor     : Marchetti
Descrição : Não grava no histórico se estiver marcado no detalhe do item para não gravar itens
            com valor igual a zero
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EstornaProvisao
Data      : 17/07/2003
Autor     : Marchetti
Descrição : Criação da rotina que promove o estorno contabil e estorna os itens de provisao de um
            contrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 15/07/2003
Autor     : Marchetti
Descrição : Passados novos parâmetros para a query (data prevista da maior parcela atrasada e
            valor em aberto de parcelas)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 30/05/2003
Autor     : Marchetti
Descrição : Correção no teste de número mínimo de parcelas pagas para quitação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 29/05/2003
Autor     : Marchetti
Descrição : Mudança na metodologia da chamada da regra visando evitar estouro de memória
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaLimites
Data      : 23/04/2003
Autor     : André Pontes
Descrição : Passagem para o SQL da regra da última parcela gerada
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaElegibilidade e BuscaLimites
Data      : 16/01/2003
Autor     : Marchetti
Descrição : Passagem para o SQL das regras o IDPESSOA e o IDBENEF
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CancelaAmortizacao e CancelaQuitacao
Data      : 27/12/2002
Autor     : Marchetti
Descrição : Novas funções centralizadas para estorno de quitação e amortização
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 17/12/2002
Autor     : Marchetti
Descrição : É passado o saldo anterior para a query de entrada das regras
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaLimites
Data      : 13/12/2002
Autor     : André Pontes
Descrição : Filtro da query que traz contratos anteriores passa a ser:
            C.FLGSITUACAO NOT IN (''C'', ''Q''),
            para contemplar contratos encerrados mas com itens ainda em aberto
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaDataCredito
Data      : 11/12/2002
Autor     : Marchetti
Descrição : Acertado o SQL de entrada da regra
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 28/11/2002
Autor     : Marchetti
Descrição : São passados como parâmetro o prazo do contrato anterior e a ultima parcela gerada
            do contrato anterior
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado como parâmetro para a query de entrada da regra o record contendo os dados
            originais do contrato como Data de Crédito e Valor solicitado, pois na alteração dos
            valores da concessão para a FUNCEF, é necessário o recálculo de atualização diária
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InsertMovEmptmo
Data      : 13/11/2002
Autor     : André Pontes
Descrição : Permite gravar valor efetivo ZERO, mas APENAS se o valor previsto também for ZERO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaMargem / BuscaSalarioBase
Data      : 06/11/2002
Autor     : André Pontes
Descrição : Passagem do IDBENEF ao como IDPESSOA na query de entrada da regra
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaLimites
Data      : 29/10/2002
Autor     : Marchetti
Descrição : Acertado filtro da query para não levar em consideração itens estornados ou abonados e
            somente itens de hmetipomov = 1
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaLimites
Data      : 25/10/2002
Autor     : André Pontes
Descrição : Filtro por IDBENEF na busca de contratos para validação
            Filtro por FLGSITUAÇÃO NOT IN ('C', 'Q') ao invés de só 'A'
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ValidaContrato / VerificaConcessaoNaoEfetivada
Data      : 25/10/2002
Autor     : André Pontes
Descrição : Filtro do Contrato por IDBENEF também
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 16/10/2002
Autor     : Marchetti
Descrição : Em todos os retornos de valor das regras, está sendo testado o valor "NULO".
            Para as rotinas que não gravavam valor = ZERO, está sendo verificado o parametro
            FLGGRAVAZERO da tabela ITEMXTIPOCONTR
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaVlrSolicMax
Data      : 15/10/2002
Autor     : André Pontes
Descrição : Novo parâmetro da função: fVlrContratosAnt. Representa o valor de quitação de TODOS os
            contratos anteriores ativos. Servirá para abater do valor máximo o total dos empréstimos
            anteriores.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 03/10/2002
Autor     : André Pontes
Descrição : - dtmCalcEmptmo.qryItens passou a ter um parâmetro que indica qual evento exluir na busca
              de itens. O objetivo é não mostrar como "em aberto" um item de quitação, já que se está
              calculando exatamente uma quitação
            - o parâmetro é passado como "3"
---------------------------------------------------------------------------------------------------}

interface

uses
   Forms,            // Application
   Dialogs,          // TMsgDlgType
   SysUtils,         // IntToStr, QuotedStr
   Wwquery,          // TwwQuery
   db,               // TField
   stdctrls,         // TLabel
   comctrls,         // TProgressBar
   FProgresso,       // FrmProgresso
   dbTables,
   uTypesEmptmo,
   uFiario,
   Classes,
   Controls,
   Provider,
   uCMClientDataSet,
   FProgressoDuplo;

// -------------------------------------------------------------------------------------------------

//Darivaldo Alencar SIG70325 - Inicio
const
     cFiltroGeraParcela = 'DECODE(NVL(HME.HMENUMPARCELAS,0),0,'+
                                  '(SELECT DISTINCT HMEX.hmenumparcelas '+
                                    'FROM HISTMOVEMPTMO HMEX '+
                                    'WHERE HMEX.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '+
                                     'AND HMEX.HMEDATAPREVISTA = HME.HMEDATAPREVISTA '+
                                     'AND HMEX.HMETIPOMOV between 0 and 9 '+
                                     'AND HMEX.hmenumparcelas > 0 '+
                                     'AND NVL(HMEX.flgestornado, 0) = 0 '+
                                     'AND ROWNUM = 1),'+
                                   'HME.HMENUMPARCELAS) AS HMENUMPARCELAS,';
//Darivaldo Alencar SIG70325 - Fim
type
   TCalcEmptmo = Class(TObject)

   private  // private declarations

      function SelecionaItensCancelamento(const IDContratoEmptmo  : Extended;
                                          const iEvento           : Integer;
                                          const iOrigem           : Integer;
                                          const dData             : TDateTime
                                         ) : String;

      function TotalizaProvPerda(const IDContratoEmptmo: Extended): Currency;

   public   // Public declarations

      // função que grava as informações pertinentes a um contrato no histórico de movimento
      //   de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
      //   bem sucedida e False caso negativo
      function InsertMovEmptmo(const ItemContrato     : TItemRecDep;
                               const rContrato        : TDadosContrato;
                               const iIDCBancaria     : Integer = -1;
                               const bTrataDivergNOVO : Boolean = False // 92334 Daniel Begnami
                              ): Boolean;

//Pendência 20133 - 22/01/2007
      function ConverteVirgulaParaPonto( fNum : real ) : String;
      function StrSubst( Str, SubStrOld, SubStrNew : WideString ) : WideString;
//Fim Pendência 20133

      // função que busca o salário base do participante
      function BuscaSalarioBase(const IDRegra         : Int64;
                                const iPessoa         : Int64;
                                const iBenef          : Int64;
                                var   fSalParticipacao: Currency;
                                var   fSalMantido     : Currency;
                                var   fSalAuxDoenca   : Currency;
                                var   fSalBenef       : Currency;
                                const bMostraMsg      : Boolean;
                                const dDataSolic      : TDateTime;
                                const iIdTipoContremptmo : Int64;
                                const iLote           : Integer = 0
                                //Pendência 22836 - 03/10/2006 - Alberto
                               ;const bExcepcional    : Boolean = false
                                //Fim Pendência 22836
                               ;const idplanoprev     : Extended = 0 //BRUNO AZEVEDO SOL 153259 KINTANA 1152177
                               ): Currency;


      // função que busca o prazo máximo do tipo de contrato
      function BuscaPrazoContrato(const iIdTitular       :Int64;
                                  const iIdBeneficiario  : Int64;
                                  const iNumParcela      : Integer;
                                  const IDRegra          : Int64;
                                  const iTipoCOntrEmptmo : Int64;
                                  const dDataInsc        : TDateTime;
                                  const bMostraMsg       : Boolean
                                  //Pendência 22836 - 03/10/2006 - Alberto
                                 ;const bExcepcional     : Boolean = false
                                  //Fim Pendência 22836
                                 ;const iIdPlanoPrev     : Extended = 0 //BRUNO AZEVEDO
                                 ): Integer;

      // função que busca a Margem Consignável do participante
      function BuscaMargem(const IDTitular         : Int64;
                           const IDBeneficiario    : Int64;
                           const IDRegra           : Int64;
                           const fSalarioBase      : Currency;
                           const fParcelas         : Currency;
                           const fPendencias       : Currency;
                           var   fSalParticipacao  : Currency;
                           var   fSalMantido       : Currency;
                           var   fSalAuxDoenca     : Currency;
                           var   fSalBenef         : Currency;
                           const bMostraMsg        : Boolean;
                           const dDataSolic        : TDateTime;
                           const iPrazo            : Integer;
                           const aListaContrato    : array of Extended;
                           const bFinanciamento    : Boolean = False;
                           const iLote             : Integer = 0;
                           //Pendência 22836 - 03/10/2006 - Alberto
                           const bExcepcional      : Boolean = false;
                            //Fim Pendência 22836
                           dDataSolicitacao        : String = '';  // Renato Visoni - SOL 129432 Kintana 709925
                           const dDataCredito      : String = '';  // Ádler Souza - SOL 131189 Kintana 744558
                           const iOrigem           : Integer = 0;  // Ádler Souza - SOL 75516 Kintana 523281
                           const IDTipoContrEmptmo : Currency = -1; // Ádler Souza - SOL 136207 Kintana 813120
                           const idPlanoPrev       : Extended = 0 //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                          ): Currency;

      // função que verifica para um determinado tipo de empréstimo, se o participante
      //   excedeu o limite de inscrições.  Só serão levadas em consideração as inscrições
      //  'Ativa' com o FLGSITUACAO 'A'
      function ValidaInscricao(const iTitular      : Int64;
                               const iMutuario     : Int64;
                               const iTipoEmptmo   : Int64;
                               const iTipoContr    : Int64;
                               const iInscricao    : Extended;
                               const bMostraMsg    : Boolean
                              ): Boolean;

      // função que verifica para um determinado tipo de empréstimo, se o participante
      //   excedeu o limite de contratos.  Só serão levados em consideração os contratos
      //   'Ativos' com o FLGSITUACAO = 'A'
      function ValidaContrato(const IDTitular      : Int64;
                              const IDMutuario     : Int64;
                              const IDTipoEmptmo   : Int64;
                              const IDTipoContr    : Int64;
                              const iQuantQuitado  : Integer;
                              const bMostraMsg     : Boolean
                             ): Boolean;

      //Pendência 22910 - 28/07/2006 - Alberto
      // função que verifica para um determinado tipo de empréstimo, se o participante
      //   possui contrato em quitação (FLGSITUACAO = 'K')
      function ValidaContratoEmQuitacao(const IDTitular      : Int64;
                                        const IDMutuario     : Int64;
                                        const IDTipoEmptmo   : Int64;
                                        const IDTipoContr    : Int64;
                                        const iQuantQuitado  : Integer;
                                        const bMostraMsg     : Boolean
                                       ): Boolean;


      // Verifica contratos anteriores não efetivados
      function VerificaConcessaoNaoEfetivada(const IDTitular     : Int64;
                                             const IDMutuario    : Int64;
                                             const IDTipoContr   : Integer;
                                             const bMostraMsg    : Boolean;
                                             const iTipoVerifica : Integer
                                            ): Boolean;

      // Verifica contratos com mesma data de crédito
      function VerificaConcessaoIgualPosterior(const IDTitular      : Int64;
                                                     const IDMutuario     : Int64;
                                                     const dDataCredito   : TDateTime;
                                                     const bMostraMsg     : Boolean;
                                                     const bPosterior     : Boolean = False;
                                                     const aTipoContrato  : Integer = 0): Boolean;

      // Verifica contrato ativo (de um determinado tipo)
      function VerificaContratoAtivo(const IDTitular   : Int64;
                                     const IDMutuario  : Int64;
                                     const IDTipoContr : Integer;
                                     const bMostraMsg  : Boolean;
                                     const IDContrato  : Extended = -2
                                    ): Boolean;

      // função que verifica para uma determinada parcela, se a parcela pode ser concedida ou não
      function VerificaPrazoConcessao(iIdTitular, iIdBeneficiario, iNumParcela, iIdRegra: Int64
                                      //Pendência 22836 - 03/10/2006 - Alberto
                                     ;const bExcepcional : Boolean = false): Boolean;
                                      //Fim Pendência 22836

      // função que busca a Reserva de Poupança do participante
      function BuscaReserva(iIdBenef      : Int64;
                            iIdPessJur    : Int64;
                            iIdPlanoPrev  : Int64;
                            iIdRegra      : Int64;
                            dDataInsc     : TDateTime;
                            bMostraMsg    : Boolean;
                            const iLote   : Integer = 0
                            //Pendência 22836 - 03/10/2006 - Alberto
                           ;const bExcepcional : Boolean = false
                            //Fim Pendência 22836
                           ): Currency;

      // função que verifica se o participante atende a regra de Elegibilidade
      //Pendências 23311 e 23312 - 25/09/2006 - Alberto
      function VerificaElegibilidade(const iIdTitular, iIdBeneficiario,
                                           iIdRegra, iIdPlanoPrev      : Int64;
                                           iMesesRenovacao, iParcPagas           : Integer;
                                     var   dDataFinal                            : TDateTime;
                                     const bMostraMsg                            : Boolean
                                     //Pendência 22836 - 03/10/2006 - Alberto
                                    ;const bExcepcional : Boolean = false
                                     //Fim Pendência 22836
                                    ): Boolean;


      //Pendência 26775 - 26/12/2007
      function IdentificaPlanoCobranca(iIDPessoa,
                                       iIDPLanoPrev,
                                       iIdRegra : Int64;
                                       const bMostraMsg : Boolean) : Int64;
      //Fim Pendência 26775



      // Função que prepara e executa a regra de Taxa de Juros (antiga TaxaSWAP).
      //   Se Houver SWAP, a regra se encarrega de devolver a nova taxa
      function BuscaTxJuros(const rContrato     : TDadosContrato;
                            const iRegra        : Int64;
                            const iParcela      : Integer;
                            const dDataRef      : TDateTime;
                            const fTxJurosAnt   : Currency;
                            const fSldDevAnt    : Currency;
                            const bMostraMsg    : Boolean;
                            const iIndice       : Int64;
                            const iEvento       : Integer = 0;
                            const iOrigem       : Integer = 0;
                            const iLote         : Integer = 0
                            //Pendência 22836 - 03/10/2006 - Alberto
                           ;const bExcepcional  : Boolean = false
                            //Fim Pendência 22836
                           ): Currency;

      // função que verifica se o participante atende Limites de concessão
      //   e limites de Quantidade e Prazos do Contrato/Empréstimo
      function BuscaLimites(const rContrato                       : TDadosContrato;
                            const iOrigem                         : Integer;
                            const iIdSitPart, iIdRegra            : Int64;
                            const dDataFinalBeneficio             : TDateTime;
                            const fMargem, fReserva, fSaldoEPAnt  : Currency;
                            const fParcelas, fPendencias          : Currency;
                            const dDataSolic                      : TDateTime;
                            const fVlrLiquidoEP                   : Currency;
                            const bMostraMsg                      : Boolean;
                            const fVlrSalBase                     : Currency = 0
                            //Pendência 22836 - 03/10/2006 - Alberto
                           ;const bExcepcional                    : Boolean = false
                            //Fim Pendência 22836
                           ): Boolean;

// -------------------------------------------------------------------------------------------------

      // função que calcula (utilizando a Regra pertinente) e armazena num vetor
      //   de Registros informações como o Nome do item, seu valor e o RECPAG, isto
      //   é se o item é de Recebimento ou Pagamento - PARA PRESTAÇÕES
      function CalculaItens(const rContrato           : TDadosContrato;
                            const rConcessao          : TDadosConcessao;
                            const iEvento             : Integer;
                            const iOrigem             : Integer;
                            const iPais               : Integer;
                            const sEstado             : String;
                            const iCidade             : Integer;
                            const iParcela            : Integer;
                            const iIdSitPart          : Int64;
                            const sFormaCobranca      : String;
                            const fTxJuros, fSaldoDev, fVlrSolic, fSaldoEPAnt, fMargem,
                                  fReserva, fSalPart, fSalMantido, fSalAuxDoenca,
                                  fSalBenef, fSalarioBase, fVlrMaxPermit : Currency;
                            const iNumParcPagas       : Integer;
                            const iPrazoAnterior      : Integer;
                            const iUltParcelaGerada   : Integer;
                            const dDataRef            : TDateTime;
                            const dDataAtualiza       : TDateTime;
                            const sAnoMesCompetencia  : String;
                            const bInterrompe         : Boolean;
                            const bMostraMsg          : Boolean;
                            const bMostraProgresso    : Boolean;
                            var   vLista              : TListaItem;
                            const fVlrDevolSeguro     : Currency = 0;
                            const fVlrSegAnt          : Currency = 0;
                            const fVlrSegComplAnt     : Currency = 0;
                            const bAlteraSaldoDev     : Boolean = True;
                            const fVlrContratosAnt    : Currency = 0;
                            const fVlrDividas         : Currency = 0;
                            const iTipoContrQuitAnt   : Integer = -1;
                            const bCriaObjetoRegra    : Boolean = False;
                            const dDataAtraso         : TDateTime = 0;
                            const fValorEmAberto      : Currency = 0;
                            const dDataAtrasoAnt      : TDateTime = 0;
                            const fValorEmAbertoAnt   : Currency = 0;
                            const fValorProvisao      : Currency = 0;
                            const bGravaQueryRegra    : Boolean = True;
                            const iFinanciamento      : Integer = 0;
                            const bExcepcional        : Boolean = false;
                            // SOL:108099 Daniel Begnami
                            const pQtdeParcSusp       : integer = 0;
                            const pIDTipoSuspEmptmo     : integer = -1;
                            const QryDados            : TwwQuery = nil; //Renato Visoni SOL 124858 KINTANA 638072
                            const DataCredito         : TDateTime = 0;  //Renato Visoni SOL 124858 KINTANA 638072
                            const Parcelas            : String = '-1'  //Jéssica Lana  SOL 127055
                            ;const bVLRLIQZERO     : Boolean = false  // Monica Gonzaga SOL: 156456 Kintana: 1234816
                            // FIM
                            ;const iQtde_Parcelas_Geradas : integer = 0; //Leandro WO17072
                            const iCarencia           : integer = 0;     //Leandro WO17072
                            const fSaldoDevAtu        : Currency = 0;    //Leandro WO17072
                            const fVlrParcela         : Currency = 0     //Leandro WO17072
                           ): Boolean;


      function CalculaItensAmortizacao(const rContrato         : TDadosContrato;
                                       const iOrigem           : Integer;
                                       const iPais             : Integer;
                                       const sEstado           : String;
                                       const iCidade           : Integer;
                                       const sFormaCobranca    : String;
                                       const fVlrAmortizacao   : TDateTime;
                                       const dDataAmortizacao  : TDateTime;
                                       var   vLista            : TListaItem;
                                       const bMostraMsg        : Boolean;
                                       const bMostraProgresso  : Boolean;
                                       const fVlrSegAnt        : Currency = 0;
                                       const fVlrSegComplAnt   : Currency = 0;
                                       const bRepactuacao      : Boolean = False
                                       ): Boolean;


      function CalculaItensQuitacao(const rContrato         : TDadosContrato;
                                    const iOrigem           : Integer;
                                    const dDataQuit         : TDateTime;
                                    const dDataMorte        : TDateTime;   // André Pontes - 14/06/2004 - pendência 16984
                                    const dDataAssinatura   : TDateTime;
                                    var   vLista            : TListaItem;
                                    const bMostraMsg        : Boolean;
                                    const bMostraProgresso  : Boolean;
                                    const bFinanciamento    : Boolean = False;
                                    const sArquivoLog       : String = ''
                                    //Pendência 22836 - 03/10/2006 - Alberto
                                   ;const bExcepcional      : Boolean = false
                                    //Fim Pendência 22836
                                   ): Boolean;


      function CalculaItensQuitacaoNOVA(const rContrato         : TDadosContrato;
                                        const iOrigem           : Integer;
                                        const dDataQuit         : TDateTime;
                                        const dDataMorte        : TDateTime;   // André Pontes - 14/06/2004 - pendência 16984
                                        const dDataAssinatura   : TDateTime;
                                        var   vLista            : TListaItem;
                                        const bMostraMsg        : Boolean;
                                        const bMostraProgresso  : Boolean;
                                        const bFinanciamento    : Boolean = False;
                                        const sArquivoLog       : String = ''
                                        //Pendência 22836 - 03/10/2006 - Alberto
                                       ;const bExcepcional      : Boolean = false
                                        //Fim Pendência 22836
                                       ): Boolean;

      // -------------------------------------------------------------------------------------------

      function CalculaItensDiverg(const rContrato        : TDadosContrato;
                                  const iOrigem          : Integer;
                                  const iParcela         : Integer;
                                  const iParcelaAlt      : Integer;
                                  const iParcResta       : Integer;
                                  const iAnoCompetencia  : Integer;
                                  const iMesCompetencia  : Integer;
                                  const dDataDiverg      : TDateTime;
                                  const dDataVenc        : TDateTime;
                                  const dDataAtu         : TDateTime;
                                  const sFormaCobranca   : String;
                                  var   vLista           : TListaItem;
                                  const bMostraMsg       : Boolean;
                                  const bMostraProgresso : Boolean;
                                  const sArquivoLog      : String = '';
                                  const bTrataDivergNOVO : Boolean = False // 92334 Daniel Begnami
                                 ): Boolean; Overload;
   //Início -  William Santana - SOL 218798.16629 PPM 560594
   //overload na função para mostrar barra de progresso dupla e contar quantidade de regras
      function CalculaItensDiverg(const rContrato        : TDadosContrato;
                                  const iOrigem          : Integer;
                                  const iParcela         : Integer;
                                  const iParcelaAlt      : Integer;
                                  const iParcResta       : Integer;
                                  const iAnoCompetencia  : Integer;
                                  const iMesCompetencia  : Integer;
                                  const dDataDiverg      : TDateTime;
                                  const dDataVenc        : TDateTime;
                                  const dDataAtu         : TDateTime;
                                  const sFormaCobranca   : String;
                                  var   vLista           : TListaItem;
                                  const bMostraMsg       : Boolean;
                                  var   iContRegra       : integer;
                                  const iContContrato    : integer;
                                  const sArquivoLog      : String = '';
                                  const bTrataDivergNOVO : Boolean = False;
                                  const bMostraProgressoDuplo : Boolean = False
                                 ): Boolean; Overload;
      //Término -  William Santana - SOL 218798.16629 PPM 560594                                
      // -------------------------------------------------------------------------------------------

      function  MontaSQLRegraQuitacao: String;
      //Pendência 23436 - 29/09/2006 - Alberto
      procedure OrdenaQueryRegra(sDescRegra: String);
      //Fim Pendência 23436

      // -------------------------------------------------------------------------------------------

      // Função que utiliza a regra para buscar a data de crédito
      function BuscaDataCredito(const iIdRegra      : Int64;
                                const sTipoData     : String;
                                const sTipoCobranca : String;
                                const sFlgInterno   : String;
                                const iIdPatro      : Int64;
                                const iIdPlanoPrev  : Int64;
                                const iParcela      : Integer;
                                const dDataInscricao: TDateTime;
                                const bExcepcional  : Boolean;
                                const bMostraMSG    : Boolean;
                                const iFlgInternet  : Integer = 0) : TDateTime;


      // Função que utiliza a regra para buscar a taxa de administração
      function BuscaTxAdministracao(const iIdRegra : Int64;
                                    dDataInscricao, dDataAssinatura : TDateTime;
                                    iIdTipoEmptmo, iIdTipoContrEmptmo: Int64;
                                    bMostraMSG : Boolean
                                    //Pendência 22836 - 03/10/2006 - Alberto
                                   ;const bExcepcional      : Boolean = false
                                    //Fim Pendência 22836
                                   ) : Currency;

      // Função que utiliza a função CritDataEmptmo da unit UFuncoesEmptmo que busca
      //   a data em que o empréstimo será creditado em relação a data de solicitação.
      //   É levado em consideração a Patrocinadora e data de crédito
      function BuscaData(sTipoData, sTipoCobranca, sFlgInterno : String;
                         iIdPessjur, iIdPlanoPrev, iParcela    : Int64;
                         dData                                 : TDateTime
                        ): TDateTime;

      // função que grava as informações pertinentes a um contrato, tendo como saída True
      //   se a operação foi bem sucedida e False caso negativo
      function GravaContrato(var NovoContrato : TDadosContrato): boolean;

      // função que varre a lista de itens de um contrato e se for o caso,
      //   chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO.
      //   A saída será True se a operação foi bem sucedida e False caso negativo
      function GravaMovEmptmo(const rContrato               : TDadosContrato;
                              const vLista                  : TListaItem;
                              const iEvento                 : Integer;
                              const iParcela                : Integer;
                              const iAnoCompetencia         : Integer;
                              const iMesCompetencia         : Integer;
                              const iAnoCobranca            : Integer;
                              const iMesCobranca            : Integer;
                              const iParcelasRemanescentes  : Integer;
                              const dDataPrevista           : TDateTime;
                              const dDataUltAtualiza        : TDateTime;
                              const sFormaEnvio             : String;
                              const sTipoFolha              : String;
                              const bMostraProgresso        : Boolean;
                              const iIDCBancaria            : Integer = -1;
                              const bTrataDivergNOVO : Boolean = False // 92334 Daniel Begnami
                             ): Boolean;

      // função que Atualiza a Situação da Inscrição para
      //   'E' -> 'Contrato Associado' -> Já utilizada em contrato, tendo como saída
      //   True se a operação foi bem sucedida e False caso negativo
      function AtualizaFlgSituacao(const ID        : Extended;
                                   const sTabela   : String;
                                   const cSituacao : Char;
                                   var   sMsgErro  : String
                                   ): Boolean;



      // marca com flgQuitado = 1 os itens em aberto quitados
      function MarcaItensQuitados(const IDContratoEmptmo : Extended;
                                  const dDataQuit        : TDateTime;
                                  const iOrigem          : Integer
                                  //Pendência 22836 - 03/10/2006 - Alberto
                                 ;const bExcepcional     : Boolean = false
                                  //Fim Pendência 22836
                                 ): Integer;

      // retira o flgQuitado de itens de um Contrato que tenha tido a Quitação cancelada
      function DesmarcaItensQuitados(const IDContratoEmptmo : Extended;
                                     const dDataQuit        : TDateTime;
                                     const iOrigem          : Integer
                                    ): Integer;

      //BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO
      //Function RetornaSituacao(IDContratoEmptmo : String): String;
      //BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO

      // função que busca as datas dos eventos em relação às patrocinadoras
      function CritDataEmptmo(qry: TwwQuery; sIDPatro, sIDPlanoPrev, sSitFundacao, sTipoData,
                              sMesReferencia, sAnoReferencia, sFormaCobranca, sDataAssinatura: String;
                              iNumParc: Integer): String;

      function RetornaDataCobranca(iDia: Integer; sUtil, sAnterior, sMesCorrente, sMesReferencia,
                                   sAnoReferencia, sDiasAposProc, sDataAssinatura: String): String;


      // função que busca o Valor Máximo Possivel para o Empréstimo
      function BuscaVlrSolicMax(const rContrato          : TDadosContrato;
                                const iIdSitPart         : Int64;
                                const fTxJuros           : Currency;
                                const fMargem            : Currency;
                                const fReserva           : Currency;
                                const fSaldoEPAnt        : Currency;
                                const fVlrContratosAnt   : Currency;
                                const fSalParticipacao   : Currency;
                                const fSalMantido        : Currency;
                                const fSalAuxDoenca      : Currency;
                                const fSalBenef          : Currency;
                                const fSalarioBase       : Currency;
                                const bMostraMsg         : Boolean;
                                //Pendência 26951 - 03/12/2007
                                const aListaContrato     : array of Extended;
                                const iLote              : Integer = 0;
                                //Pendência 22836 - 03/10/2006 - Alberto
                                const bExcepcional       : Boolean = false;
                                //Fim Pendência 22836
                                const qryContrAnt        : TQuery = nil;
                                // SOL:108099 Daniel Begnami
                                const pQtdeParcSusp      : integer = 0;
                                const pIDTipoSuspEmptmo  : integer = -1
                                // FIM
                               ): Currency;

      function SaldoDevAnt(const IDContrato        : Extended;
                           const dData             : TDateTime;
                           const iAnoCompetencia   : Integer;
                           const iMesCompetencia   : Integer;
                           const bVerificaParcela  : Boolean = False;
                           const bTrataDivergNOVO  : Boolean = False;  // 92334 Daniel Begnami
                           const bGeraParcela      : Boolean = False   //Darivaldo
                          ): TSaldoDevAnt;

      function SaldoDevMesAnt(const IdContrato           : Extended;
                              const dDataCredito         : TDateTime;
                              const dDataProcessamento   : TDateTime;
                              const iAnoCompetencia      : Integer;
                              const iMesCompetencia      : Integer
                             ): TSaldoDevAnt;


      function BuscaSaldosAntPos(const IDContrato        : Extended;
                                 const dData             : TDateTime;
                                 const bVerificaParcela  : Boolean = False
                                ): TSaldosAntPos;


      // função que retorna o saldo disponivel para emprestimo e o ID da verba, alem de atualizar o novo saldo
      function AtualizarSaldo(const iIdPessoa, iIdEmpresaProp, iIdPatro, iIdTipEmptmo : Int64;
                              const fValor: Currency; const bAtualiza: Boolean;
                              var fSaldo: Currency): Int64;


      function CarregaDadosParticipante(const IDTitular        : Int64;
                                        var   fValorAtual      : Currency;
                                        var   fSalParticipacao : Currency;
                                        var   fSalMantido      : Currency;
                                        var   fSalAuxDoenca    : Currency;
                                        var   fSalBenef        : Currency;
                                        var   IDBeneficio      : Int64;
                                        var   IDSitBeneficio   : Int64;
                                        var   IDSitPart        : Int64;
                                        var   IDPessJur        : Int64;
                                        var   IDPessoa         : Int64;
                                        var   dDataNasc        : TDateTime;
                                        var   sSexo            : String
                                       ) : Boolean;

      function ValidaSuspensao(const iIdRegraValidSusp  : Int64;
                               const iIdContratoEmptmo  : Extended;
                               const iIdPessoa          : Int64;
                               const IDBenef            : Int64;
                               const iIdPatro           : Int64;
                               const sFlgInterno        : String;
                               const iIdTipoSuspEmptmo  : Int64;
                               const nTseMeses          : Integer;
                               const dTseInicioSusp     : TDateTime;
                               const dTseFinalSusp      : TDateTime;
                               const iFlgFerias         : Integer;
                               const iNumParcAberto     : Integer;
                               const iNumParcPagas      : Integer;
                               const dDataInicioAnt     : TDateTime;
                               const dDataFimAnt        : TDateTime;//Fanuel Junior SOL174268/8141 Kintana
                               const dDataAtualiza      : TDateTime;
                               const iIdSuspensaoAtual  : Int64;
                               const iExcepcional       : Integer = 0;
                               const IDPessjurCedido    : Integer = 0;
                               const iLote              : Integer = 0;
                               const sFlgStatus         : String = 'X'
                              ): TDateTime;

      // ELS SOL 144458 Kintana 1208325 Inicio
      function ValidaPrestacaoProjetada(const iIdRegraValidSusp  : Int64;
                                        const iIdContratoEmptmo  : Extended;
                                        const iIdPessoa          : Int64;
                                        const IDBenef            : Int64;
                                        const iIdPatro           : Int64;
                                        const sFlgInterno        : String;
                                        const iIdTipoSuspEmptmo  : Int64;
                                        const nTseMeses          : Integer;
                                        const dTseInicioSusp     : TDateTime;
                                        const dTseFinalSusp      : TDateTime;
                                        const iFlgFerias         : Integer;
                                        const iNumParcAberto     : Integer;
                                        const iNumParcPagas      : Integer;
                                        const dDataInicioAnt     : TDateTime;
                                        const dDataAtualiza      : TDateTime;
                                        const iIdSuspensaoAtual  : Int64;
                                        const iExcepcional       : Integer = 0;
                                        const IDPessjurCedido    : Integer = 0;
                                        const iLote              : Integer = 0;
                                        const sFlgStatus         : String = 'X'
                                        ): Double; // SOL 181899 KTN 1688596 Otacilio Aquino
      // ELS SOL 144458 Kintana 1208325 Fim

      // ELS SOL 144458 Kintana 1208325 Inicio
      function ValidaMargemConsAtual(const iIdRegraValidSusp  : Int64;
                                     const iIdContratoEmptmo  : Extended;
                                     const iIdPessoa          : Int64;
                                     const IDBenef            : Int64;
                                     const iIdPatro           : Int64;
                                     const sFlgInterno        : String;
                                     const iIdTipoSuspEmptmo  : Int64;
                                     const nTseMeses          : Integer;
                                     const dTseInicioSusp     : TDateTime;
                                     const dTseFinalSusp      : TDateTime;
                                     const iFlgFerias         : Integer;
                                     const iNumParcAberto     : Integer;
                                     const iNumParcPagas      : Integer;
                                     const dDataInicioAnt     : TDateTime;
                                     const dDataAtualiza      : TDateTime;
                                     const iIdSuspensaoAtual  : Int64;
                                     const iExcepcional       : Integer = 0;
                                     const IDPessjurCedido    : Integer = 0;
                                     const iLote              : Integer = 0;
                                     const sFlgStatus         : String = 'X'
                                     ): Double; // SOL 181899 KTN 1688596 Otacilio Aquino
      // ELS SOL 144458 Kintana 1208325 Fim


      // SOL:108099 Daniel Begnami
      function ValidaMesesSuspensao(const iIdRegraValidSusp  : Int64;
                                    const iIdPessoa          : Int64;
                                    const iIdBenef           : Int64;
                                    const dDataCredito       : TDate;
                                    const iIDTipoSusp        : Int64;
                                    const qryContratosANT    : TQuery;
                                    const iIDTipoContrEmptmo: Int64 = 0
                                  ): Integer;


      function ValidaEnvioSuspensao(const iIdRegra       : Int64;
                                    const sSQL           : String ) : Boolean;

      function CancelaAmortizacao(const IDContratoEmptmo : Extended;
                                  const dDataPrevista    : TDateTime;
                                  const dDataCanc        : TDateTime;
                                  const bDesfazEnvio     : Boolean = True
                                 ): Integer;

      function CancelaAlteracaoConcessao(const IDContratoEmptmo : Extended;
                                         const dDataPrevista    : TDateTime;
                                         const dDataCanc        : TDateTime;
                                         const bDesfazEnvio     : Boolean = True
                                        ): Integer;

      function CancelaQuitacao(const IDContratoEmptmo : Extended;
                               const dDataPrevista    : TDateTime;
                               const dDataCanc        : TDateTime;
                               const iOrigem          : Integer;
                               const bDesfazEnvio     : Boolean = True
                              ): Integer;

      // -------------------------------------------------------------------------------------------

      function ExistemItensEmAberto(const iContrato: Extended;
                                    const bData    : Boolean = False;
                                    const dData    : TDateTime = 0;
                                    const bMes     : Boolean = False;
                                    const iAno     : Integer = 0;
                                    const iMes     : Integer = 0;
                                    // Thiago Melo SOL 179805 KINTANA 1659409
                                    const FlModo   : SmallInt = 0
                                    // Thiago Melo SOL 179805 KINTANA 1659409

                                   //Pendência 27232 - 16/04/2008
                                   //): Boolean;
                                   ): Currency;

      //BRUNO AZEVEDO SOL KINTANA
      function MinDataVencto(const iContrato: Extended;
                             const bData    : Boolean = False;
                             const dData    : TDateTime = 0;
                             const bMes     : Boolean = False;
                             const iAno     : Integer = 0;
                             const iMes     : Integer = 0
                             ): TDateTime;

      function ExisteSaldoDevedor(const IDContrato: Extended): Boolean;
      function ExisteQuitacao(const IDContrato: Extended): Boolean;
      function ExisteQuitacaoAberto(const IDContrato: Extended): Boolean;
      function UltimaDataAtualizacao(const IDContrato: Extended): TDateTime;

      //Ádler Souza - SOL 137662 KINTANA 836092
      function VerificaSuspTemp(const aListaContrato : array of Extended;
                                const dDataCredito   : TDateTime): Boolean;
      //Fim - Ádler Souza - SOL 137662 KINTANA 836092

      function PossuiAtualizacaoDiaria(const IDContrato  : Extended;
                                       const dData       : TDateTime
                                      ):  Boolean;

      //Pendência 22798 - 15/09/2006
      function PossuiAtualizacaoDiariaExt(const IDContrato  : Extended;
                                          const dData       : TDateTime
                                         ):  Boolean;

      //Fim Pendência 22798
      // -------------------------------------------------------------------------------------------

      // André Pontes - 07/01/2004 - FUNCEF
      function PegaSeguroAnt(const IDContratoEmptmo: Extended): Currency;
      function PegaSeguroComplAnt(const IDContratoEmptmo: Extended): Currency;
      // FIM André Pontes - 07/01/2004 - FUNCEF

      // -------------------------------------------------------------------------------------------

      procedure AcertaSituacaoContratual(const IDContratoEmptmo: Extended;
                                         const iOrigem         : Integer = -1;
                                         const bGravaDataCanc  : boolean = false // SOL 109599
                                        );

      // -------------------------------------------------------------------------------------------

      function  ExisteParcelaAtrasadaEmAberto(const IDContrato : Extended;
                                              const dData      : TDateTime
                                             ): Boolean;

      // -------------------------------------------------------------------------------------------

      function  BuscaDataMorte(const IDBenef: Extended): TDateTime;

      // -------------------------------------------------------------------------------------------

      //Pendência 25624 - 15/06/2007 - Alberto
      function  ExisteHistMovXDocum(const CODDocumento : Extended;
                                    const IDHistMov    : Extended
                                    ): Boolean;
      //Fim Pendência 25624

      // -------------------------------------------------------------------------------------------
      
      Function TemItensAbertoPorMatricula(Matricula:String):Boolean; //Renato Visoni SOL 108324 Kintana 512291

  end;



var CalcEmptmo : TCalcEmptmo;

implementation

uses
   USistema,         // Sistema
   UDiasUteis,       // ExtraiAno, ExtraiMes
   UDataBase,        // LeUltRegistro
   UMensErro,        // MsgDlg
   UFuncoesEmptmo,   // LimpaParametros, CritDataEmptmo, ConverteVirg
   dEmptmo,
   dLookEmptmo,
   dBaseDados,
   uIntegraEmptmo,
   dCalcEmptmo,
   dAtualizacaoDiaria;



function TCalcEmptmo.VerificaConcessaoNaoEfetivada(const IDTitular   : Int64;
                                                   const IDMutuario  : Int64;
                                                   const IDTipoContr : Integer;
                                                   const bMostraMsg  : Boolean;
                                                   const iTipoVerifica : Integer
                                                  ): Boolean;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   // Marchetti - Pendencia 23407

   if iTipoVerifica = 0 then  // Não faz nenhum tipo de verificação
   begin
      Result := True;
      Exit;
   end;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335

   if iTipoVerifica = 1 then // Verifica somente do mesmo tipo de contrato
   begin
      sSQL :=  'SELECT '                                                         + #13 +
               '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
               'FROM CONTRATOEMPTMO CNT '                                        + #13 +
               'WHERE CNT.IDPESSOA = ' + IntToStr(IDTitular)                     + #13 +
               '      AND CNT.IDBENEF = ' + IntToStr(IDMutuario)                 + #13 +
               '      AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr)      + #13 +
               '      AND CNT.FLGSITUACAO IN (''A'', ''P'') '                    + #13 +
               '      AND EXISTS (select * '                                     + #13 +
               '                  from HMECONCESSAO HME '                        + #13 +
               '                  WHERE FLGESTORNADO = 0 '                       + #13 +
               '                        AND NATUREZAITEM = 2 '                   + #13 +
               '                        AND FLGBAIXADO = 0 '                      + #13 +
               '                        AND HME.IDCONTRATOEMPTMO = CNT.IDCONTRATOEMPTMO)';
   end;

   if iTipoVerifica = 2 then // Verifica todos os tipos de contrato
   begin
      sSQL :=  'SELECT '                                                         + #13 +
               '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
               'FROM CONTRATOEMPTMO CNT '                                        + #13 +
               'WHERE CNT.IDPESSOA = ' + IntToStr(IDTitular)                     + #13 +
               '      AND CNT.IDBENEF = ' + IntToStr(IDMutuario)  ;
      // ----------------------------------------------------------------------------------------------
      //Pendência 24861 - 28/03/2007 - Alberto - Inclusão dos códigos 19 e 20
      if (
         (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
         (IDTipoContr in [11, 12, 13, 14, 15, 16, 19, 20])
         ) then sSQL := sSQL +
      '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr)          + #13
      else sSQL := sSQL +
      '  AND CNT.IDTIPOCONTREMPTMO NOT IN (11, 12, 13, 14, 15, 16, 19, 20) ' + #13;
      //Fim Pendência 24861 - 28/03/2007
      // ----------------------------------------------------------------------------------------------

      sSQL := sSQL +
               '      AND CNT.FLGSITUACAO IN (''A'', ''P'') '                    + #13 +
               '      AND EXISTS (select * '                                     + #13 +
               '                  from HMECONCESSAO HME '                        + #13 +
               '                  WHERE FLGESTORNADO = 0 '                       + #13 +
               '                        AND NATUREZAITEM = 2 '                   + #13 +
               '                        AND FLGBAIXADO = 0 '                      + #13 +
               '                        AND HME.IDCONTRATOEMPTMO = CNT.IDCONTRATOEMPTMO)';

   end;


   {if iTipoVerifica = 1 then // Verifica somente do mesmo tipo de contrato
   begin
      sSQL :=
      'SELECT '                                                         + #13 +
      '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
      'FROM '                                                           + #13 +
      '  CONTRATOEMPTMO CNT, '                                          + #13 +
      '  HISTMOVEMPTMO  HME  '                                          + #13 +
      'WHERE '                                                          + #13 +
      '      CNT.IDPESSOA          = ' + IntToStr(IDTitular)            + #13 +
      '  AND CNT.IDBENEF           = ' + IntToStr(IDMutuario)           + #13 +
      '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr)          + #13 +
      '  AND NVL(FLGESTORNADO, 0)  = 0 '                                + #13 +
      '  AND CNT.FLGSITUACAO       IN (''A'', ''P'') '                  + #13 +
      '  AND HME.HMETIPOMOV        = 0 '                                + #13 +
      '  AND HME.HMECENTRALIZA     = 1 '                                + #13 +
      '  AND HME.FLGBAIXADO        = 0 '                                + #13 +
      '  AND CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO '             + #13;
   end;

   if iTipoVerifica = 2 then // Verifica todos os tipos de contrato
   begin
      sSQL :=
      'SELECT '                                                         + #13 +
      '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
      'FROM '                                                           + #13 +
      '  CONTRATOEMPTMO CNT, '                                          + #13 +
      '  HISTMOVEMPTMO  HME  '                                          + #13 +
      'WHERE '                                                          + #13 +
      '      CNT.IDPESSOA          = ' + IntToStr(IDTitular)            + #13 +
      '  AND CNT.IDBENEF           = ' + IntToStr(IDMutuario)           + #13;

      // ----------------------------------------------------------------------------------------------
      //Pendência 24861 - 28/03/2007 - Alberto - Inclusão dos códigos 19 e 20
      if (
         (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
         (IDTipoContr in [11, 12, 13, 14, 15, 16, 19, 20])
         ) then sSQL := sSQL +
      '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr)          + #13
      else sSQL := sSQL +
      '  AND CNT.IDTIPOCONTREMPTMO NOT IN (11, 12, 13, 14, 15, 16, 19, 20) ' + #13;
      //Fim Pendência 24861 - 28/03/2007
      // ----------------------------------------------------------------------------------------------

      sSQL := sSQL +
      '  AND NVL(FLGESTORNADO, 0)  = 0 '                                + #13 +
      '  AND CNT.FLGSITUACAO       IN (''A'', ''P'') '                  + #13 +
      '  AND HME.HMETIPOMOV        = 0 '                                + #13 +
      '  AND HME.HMECENTRALIZA     = 1 '                                + #13 +
      '  AND HME.FLGBAIXADO        = 0 '                                + #13 +
      '  AND CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO ';
   end;}
   // Wylliam Leite da Silva - SOL:253185 PPM: 2040335

   qryAux.SQL.Text := sSQL;

   try
      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar Contratos anteriores não efetivados.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;
         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Participante NÃO poderá solicitar Empréstimo pois possui outro anterior não efetivado.', 'Empréstimo', mtWarning, [mbOk], 0);
         end;
         Result := False;
         Exit;
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------

      Result := True;

   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.VerificaConcessaoIgualPosterior(const IDTitular      : Int64;
                                                     const IDMutuario     : Int64;
                                                     const dDataCredito   : TDateTime;
                                                     const bMostraMsg     : Boolean;
                                                     const bPosterior     : Boolean = False;
                                                     const aTipoContrato  : Integer = 0): Boolean;
var
   sSQL     : String;
   sData    : String;
   qryAux   : TwwQuery;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sData := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataCredito));

   sSQL :=
   'SELECT '                                                               + #13 +
   '  CNT.IDCONTRATOEMPTMO '                                               + #13 +
   'FROM '                                                                 + #13 +
   '  CONTRATOEMPTMO CNT, '                                                + #13 +
   '  HISTMOVEMPTMO  HME  '                                                + #13 +
   'WHERE '                                                                + #13 +
   '      CNT.IDPESSOA          = ' + IntToStr(IDTitular)                  + #13 +
   '  AND CNT.IDBENEF           = ' + IntToStr(IDMutuario)                 + #13;


   sSQL := sSQL +
   '  AND NVL(FLGESTORNADO, 0)  = 0 '                                      + #13 +
   '  AND CNT.FLGSITUACAO       NOT IN (''C'', ''Q'') '                    + #13 +
   '  AND HME.HMETIPOMOV        = 0 '                                      + #13 +
   '  AND HME.HMECENTRALIZA     = 1 '                                      + #13;

   if bPosterior then sSQL := sSQL +
   '  AND HME.HMEDATAPREVISTA   > TO_DATE( ' + sData + ',''DD/MM/YYYY'') ' + #13
   else sSQL := sSQL +
   '  AND HME.HMEDATAPREVISTA   = TO_DATE( ' + sData + ',''DD/MM/YYYY'') ' + #13;

   // Incicio Daniel 
   if aTipoContrato <> 0 then
     sSQL := sSQL + ' AND CNT.IDTIPOCONTREMPTMO = '+IntToStr(aTipoContrato)+ #13;
   // Fim

   sSQL := sSQL +
   '  AND CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO ';

   qryAux.SQL.Text := sSQL;

   try
      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar Contratos concedidos para a mesma data.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;
         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         Result := False;
         Exit;
      end;  // if not(qryAux.IsEmpty)

      // -------------------------------------------------------------------------------------------

      Result := True;

   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.VerificaContratoAtivo(const IDTitular   : Int64;
                                           const IDMutuario  : Int64;
                                           const IDTipoContr : Integer;
                                           const bMostraMsg  : Boolean;
                                           const IDContrato  : Extended = -2
                                          ): Boolean;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'SELECT '                                                         + #13 +
   '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
   'FROM '                                                           + #13 +
   '  CONTRATOEMPTMO CNT '                                           + #13 +
   'WHERE '                                                          + #13 +
   '      CNT.IDPESSOA          = ' + IntToStr(IDTitular)            + #13 +
   '  AND CNT.IDBENEF           = ' + IntToStr(IDMutuario)           + #13 +
   '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr)          + #13 +
   '  AND CNT.IDCONTRATOEMPTMO <> ' + FormatFloat('#0', IDContrato)  + #13 +

   // André Pontes - 03/01/2006
   '  AND CNT.FLGSITUACAO       NOT IN (''C'', ''E'', ''K'', ''Q'') ';
   // FIM André Pontes - 03/01/2006

   qryAux.SQL.Text := sSQL;

   try
      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar outros Contratos ativos.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;
         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         if bMostraMsg then
         begin
            MsgDlg('Participante NÃO poderá solicitar outro empréstimo pois possui outro do mesmo tipo já ativo.', 'Empréstimo', mtWarning, [mbOk], 0);
         end;
         Result := False;
         Exit;
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------

      Result := True;

   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.ValidaInscricao(const iTitular      : Int64;
                                     const iMutuario     : Int64;
                                     const iTipoEmptmo   : Int64;
                                     const iTipoContr    : Int64;
                                     const iInscricao    : Extended;
                                     const bMostraMsg    : Boolean
                                    ): Boolean;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   // função que verifica para um determinado tipo de empréstimo, se o participante
   //   excedeu o limite de inscrições.  Só serão levadas em consideração as inscrições
   //   'Ativa' com o FLGSITUACAO 'A'

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      // -------------------------------------------------------------------------------------------
      //    Tipo de Empréstimo
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT '                                                                     + #13 +
      '  TEP.TEPMAXINSCR, '                                                         + #13 +
      '  COUNT(INS.IDINSCRICAOEMPTMO) AS NUMINSC '                                  + #13 +
      'FROM '                                                                       + #13 +
      '  INSCRICAOEMPTMO INS, '                                                     + #13 +
      '  CONTRATOEMPTMO  CON, '                                                     + #13 +
      '  TIPOCONTREMPTMO TCE, '                                                     + #13 +
      '  TIPOEMPTMO      TEP  '                                                     + #13 +
      'WHERE '                                                                      + #13 +
      '      ( TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '      + #13 +
      '  AND ( INS.IDPESSOA          = ' + IntToStr(iTitular) + ' ) '               + #13 +
      '  AND ( INS.IDBENEF           = ' + IntToStr(iMutuario) + ' ) '              + #13 +
      '  AND ( INS.IDINSCRICAOEMPTMO <> ' + FormatFloat('#0', iInscricao) + ' ) '   + #13 +
      '  AND ( INS.FLGSITUACAO       <> ''C'' ) '                                   + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = ' + IntToStr(iTipoEmptmo) + ' ) '            + #13 +
      '  AND ( CON.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
      '  AND ( INS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO(+) ) '                 + #13 +
      '  AND ( TCE.IDTIPOCONTREMPTMO = INS.IDTIPOCONTREMPTMO ) '                    + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                         + #13 +
      'GROUP BY '                                                                   + #13 +
      '  TEP.TEPMAXINSCR ';

      qryAux.SQL.Text := sSQL;

      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar o número máximo e a quantidade de inscrições por participante.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;

         Result := False;
         Exit;

      end;  // try..except

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         // Verifica se o participante poderá realizar mais uma inscrição.
         if qryAux.FieldByName('NUMINSC').AsInteger >= qryAux.FieldByName('TEPMAXINSCR').AsInteger then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Participante excedeu o limite de inscrições para o Tipo de Empréstimo.',
                      'Empréstimo', mtError, [mbOk], 0);
            end;

            Result := False;
            Exit;
         end;
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------
      //    Tipo de Contrato
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT '                                                                     + #13 +
      '  TCE.TCEMAXINSCR, '                                                         + #13 +
      '  COUNT(INS.IDINSCRICAOEMPTMO) AS NUMINSC '                                  + #13 +
      'FROM '                                                                       + #13 +
      '  INSCRICAOEMPTMO INS, '                                                     + #13 +
      '  CONTRATOEMPTMO  CON, '                                                     + #13 +
      '  TIPOCONTREMPTMO TCE, '                                                     + #13 +
      '  TIPOEMPTMO      TEP  '                                                     + #13 +
      'WHERE '                                                                      + #13 +
      '      ( TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '      + #13 +
      '  AND ( INS.IDPESSOA          = ' + IntToStr(iTitular) + ' ) '               + #13 +
      '  AND ( INS.IDBENEF           = ' + IntToStr(iMutuario) + ' ) '              + #13 +
      '  AND ( INS.IDINSCRICAOEMPTMO <> ' + FormatFloat('#0', iInscricao) + ' ) '   + #13 +
      '  AND ( INS.FLGSITUACAO       <> ''C'' ) '                                   + #13 +
      '  AND ( TCE.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContr) + ' ) '             + #13 +
      '  AND ( CON.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
      '  AND ( INS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO(+) ) '                 + #13 +
      '  AND ( TCE.IDTIPOCONTREMPTMO = INS.IDTIPOCONTREMPTMO ) '                    + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                         + #13 +
      'GROUP BY '                                                                   + #13 +
      '  TCE.TCEMAXINSCR ';

      qryAux.SQL.Text := sSQL;

      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar o número máximo e a quantidade de inscrições por participante.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;

         Result := False;
         Exit;

      end;  // try..except

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         // Verifica se o participante poderá realizar mais uma inscrição.
         if qryAux.FieldByName('NUMINSC').AsInteger >= qryAux.FieldByName('TCEMAXINSCR').AsInteger then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Participante excedeu o limite de inscrições para o Tipo de Contrato.',
                      'Empréstimo', mtError, [mbOk], 0);
            end;

            Result := False;
            Exit;
         end;
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      Result := True;

   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.ValidaContrato(const IDTitular      : Int64;
                                    const IDMutuario     : Int64;
                                    const IDTipoEmptmo   : Int64;
                                    const IDTipoContr    : Int64;
                                    const iQuantQuitado  : Integer;
                                    const bMostraMsg     : Boolean
                                   ): Boolean;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   // função que verifica para um determinado tipo de empréstimo, se o participante
   //   excedeu o limite de contratos.  Só serão levados em consideração os contratos
   //   com o FLGSITUACAO = 'A', 'E', OU 'K')

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

      if Sistema.TipoCliente <> 19991 then
      begin
      // -------------------------------------------------------------------------------------------
      //    Tipo de Empréstimo
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT '                                                                  + #13 +
      '  TEP.TEPMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
      'FROM '                                                                    + #13 +
      '  CONTRATOEMPTMO  CON, '                                                  + #13 +
      '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
      '  TIPOEMPTMO      TEP  '                                                  + #13 +
      'WHERE '                                                                   + #13 +
      '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
      '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '   + #13 +
      '  AND ( CON.FLGSITUACAO       NOT IN (''C'',  ''Q'') ) '                  + #13 +
      '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
      '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
      '  AND ( TEP.IDTIPOEMPTMO      = ' + IntToStr(IDTipoEmptmo) + ' ) '        + #13;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
      '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
      '        ( '                                                               + #13 +
      '        SELECT '                                                          + #13 +
      '           IDTIPOCONTRQUIT '                                              + #13 +
      '        FROM '                                                            + #13 +
      '           TIPOCONTRXQUIT '                                               + #13 +
      '        WHERE '                                                           + #13 +
      '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
      '        ) '                                                               + #13 +
      '      ) '                                                                 + #13;

      sSQL := sSQL +
      'GROUP BY '                                                                + #13 +
      '  TEP.TEPMAXCONTRATO ';

      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;

      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar o número máximo e a quantidade de Contratos por participante.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;

         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         // Verifica se o participante poderá contratar o Empréstimo
         if (qryAux.FieldByName('NUMCONTRATO').AsInteger - iQuantQuitado) >= qryAux.FieldByName('TEPMAXCONTRATO').AsInteger then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Participante NÃO poderá contratar este tipo de empréstimo antes de ' +
                      'quitar o(s) contrato(s) anterior(es).', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Result := False;
            Exit;
         end;  // if (qryAux.FieldByName('NUMCONTRATO').AsInteger ...
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------
      //    Tipo de Contrato
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT '                                                                  + #13 +
      '  TCE.TCEMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
      'FROM '                                                                    + #13 +
      '  CONTRATOEMPTMO  CON, '                                                  + #13 +
      '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
      '  TIPOEMPTMO      TEP  '                                                  + #13 +
      'WHERE '                                                                   + #13 +
      '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
      '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '   + #13 +
      '  AND ( CON.FLGSITUACAO       NOT IN (''C'',  ''Q'') ) '                  + #13 +
      '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
      '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
      '  AND ( TCE.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr) + ' ) '         + #13;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
      '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
      '        ( '                                                               + #13 +
      '        SELECT '                                                          + #13 +
      '           IDTIPOCONTRQUIT '                                              + #13 +
      '        FROM '                                                            + #13 +
      '           TIPOCONTRXQUIT '                                               + #13 +
      '        WHERE '                                                           + #13 +
      '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
      '        ) '                                                               + #13 +
      '      ) '                                                                 + #13;

      sSQL := sSQL +
      'GROUP BY '                                                                + #13 +
      '  TCE.TCEMAXCONTRATO ';

      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;

      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar o número máximo e a quantidade de Contratos por participante.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;

         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         // Verifica se o participante poderá contratar o Empréstimo
         if (qryAux.FieldByName('NUMCONTRATO').AsInteger - iQuantQuitado) >= qryAux.FieldByName('TCEMAXCONTRATO').AsInteger then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Participante NÃO poderá contratar este tipo de empréstimo antes de ' +
                      'quitar o(s) contrato(s) anterior(es).', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Result := False;
            Exit;
         end;  // if (qryAux.FieldByName('NUMCONTRATO').AsInteger ...
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      end;
      Result := True;

   finally
      qryAux.Free;
   end;
end;

//Pendência 22910 - 28/07/2006 - Alberto
function TCalcEmptmo.ValidaContratoEmQuitacao(const IDTitular      : Int64;
                                    const IDMutuario     : Int64;
                                    const IDTipoEmptmo   : Int64;
                                    const IDTipoContr    : Int64;
                                    const iQuantQuitado  : Integer;
                                    const bMostraMsg     : Boolean
                                   ): Boolean;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   // função que verifica para um determinado tipo de empréstimo, se o participante
   //   possui contrato em quitação (FLGSITUACAO = 'K')

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      // -------------------------------------------------------------------------------------------
      //    Tipo de Empréstimo
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT '                                                                  + #13 +
      '  TEP.TEPMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
      'FROM '                                                                    + #13 +
      '  CONTRATOEMPTMO  CON, '                                                  + #13 +
      '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
      '  TIPOEMPTMO      TEP  '                                                  + #13 +
      'WHERE '                                                                   + #13 +
      '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
      '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '   + #13 +
      '  AND ( CON.FLGSITUACAO       = ''K'' ) '                                 + #13 +
      '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
      '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
      '  AND ( TEP.IDTIPOEMPTMO      = ' + IntToStr(IDTipoEmptmo) + ' ) '        + #13;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
      '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
      '        ( '                                                               + #13 +
      '        SELECT '                                                          + #13 +
      '           IDTIPOCONTRQUIT '                                              + #13 +
      '        FROM '                                                            + #13 +
      '           TIPOCONTRXQUIT '                                               + #13 +
      '        WHERE '                                                           + #13 +
      '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
      '        ) '                                                               + #13 +
      '      ) '                                                                 + #13;

      sSQL := sSQL +
      'GROUP BY '                                                                + #13 +
      '  TEP.TEPMAXCONTRATO ';

      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;

      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar quantidade de Contratos em Quitação por participante.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;

         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         // Verifica se o participante poderá contratar o Empréstimo
         if qryAux.FieldByName('NUMCONTRATO').AsInteger > 0 then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Participante NÃO poderá contratar empréstimo pois há  ' +
                      'contrato(s) anterior(es) em quitação.', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Result := False;
            Exit;
         end;  // if (qryAux.FieldByName('NUMCONTRATO').AsInteger ...
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------
      //    Tipo de Contrato
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT '                                                                  + #13 +
      '  TCE.TCEMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
      'FROM '                                                                    + #13 +
      '  CONTRATOEMPTMO  CON, '                                                  + #13 +
      '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
      '  TIPOEMPTMO      TEP  '                                                  + #13 +
      'WHERE '                                                                   + #13 +
      '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
      '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
      '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '   + #13 +
      '  AND ( CON.FLGSITUACAO       = ''K'' ) '                                 + #13 +
      '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
      '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
      '  AND ( TCE.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr) + ' ) '         + #13;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
      '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
      '        ( '                                                               + #13 +
      '        SELECT '                                                          + #13 +
      '           IDTIPOCONTRQUIT '                                              + #13 +
      '        FROM '                                                            + #13 +
      '           TIPOCONTRXQUIT '                                               + #13 +
      '        WHERE '                                                           + #13 +
      '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
      '        ) '                                                               + #13 +
      '      ) '                                                                 + #13;

      sSQL := sSQL +
      'GROUP BY '                                                                + #13 +
      '  TCE.TCEMAXCONTRATO ';

      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;

      // -------------------------------------------------------------------------------------------

      try
         qryAux.Open;
      except
         if bMostraMsg then
         begin
            MsgDlg('Erro ao tentar localizar quantidade de Contratos em Quitação por participante.',
                   'Empréstimo', mtError, [mbOk], 0);
         end;

         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if not(qryAux.IsEmpty) then
      begin
         // Verifica se o participante poderá contratar o Empréstimo
         if qryAux.FieldByName('NUMCONTRATO').AsInteger > 0 then
         begin
            if bMostraMsg then
            begin
               MsgDlg('Participante NÃO poderá contratar empréstimo pois há  ' +
                      'contrato(s) anterior(es) em quitação.', 'Empréstimo', mtWarning, [mbOk], 0);
            end;
            Result := False;
            Exit;
         end;  // if (qryAux.FieldByName('NUMCONTRATO').AsInteger ...
      end;  // if not qryAux.IsEmpty

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      Result := True;

   finally
      qryAux.Free;
   end;
end;
//Fim Pendência 22910



function TCalcEmptmo.BuscaSalarioBase(const IDRegra         : Int64;
                                      const iPessoa         : Int64;
                                      const iBenef          : Int64;
                                      var   fSalParticipacao: Currency;
                                      var   fSalMantido     : Currency;
                                      var   fSalAuxDoenca   : Currency;
                                      var   fSalBenef       : Currency;
                                      const bMostraMsg      : Boolean;
                                      const dDataSolic      : TDateTime;
                                      const iIdTipoContremptmo : Int64;
                                      const iLote           : Integer = 0
                                      //Pendência 22836 - 03/10/2006 - Alberto
                                     ;const bExcepcional    : Boolean = false
                                      //Fim Pendência 22836
                                     ;const idplanoprev     : Extended = 0 //BRUNO AZEVEDO SOL 153259 KINTANA 1152177
                                     ): Currency;
var
   sSQLRegra, sSalario : String;
   fValorAtual    : Currency;
   IDBeneficio    : Int64;
   IDSitBeneficio : Int64;
   IDSitPart      : Int64;
   IDPessJur      : Int64;
   IDPessoa       : Int64;
   dDataNasc      : TDateTime;
   sSexo          : String;
   sSQL           : String;
   qryAux         : TwwQuery;
   iSequencial    : Integer;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';

   sSQL :=
   'SELECT '                                                                              + #13 +
   '  NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO, '                                   + #13 +
   '  NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO, '                                             + #13 +
   '  NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA, '                                         + #13 +
   '  NVL(BEN.VALORATUAL, 0) AS VALORATUAL, '                                             + #13 +
   '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.DATAFINALPREVISTA, '        + #13 +
   '  ELP.IDPESSJUR, NVL(ELP.FLGDIRETOR, 0) AS FLGDIRETOR, ELP.IDSITFUNC, '               + #13 +
   '  PPP.IDPESSOA, PPP.IDSITPART, '                                                      + #13 +
   '  DECODE(BEN.IDPLANOPREV, NULL, PPP.IDPLANOPREV, BEN.IDPLANOPREV) AS IDPLANOPREV, '   + #13 +
   '  PFI.DATANASC, PFI.SEXO, '                                                           + #13 +
   '  SIT.FLGINTERNO '                                                                    + #13 +
   'FROM '                                                                                + #13 +
   '  PESSOAFISICA PFI, '                                                                 + #13 +
   '  PARTPREVPLAN PPP, '                                                                 + #13 +
   '  ELEGPATRO    ELP, '                                                                 + #13 +
   '  SITPART      SIT, '                                                                 + #13 +
   '  ( '                                                                                 + #13 +
   '  SELECT '                                                                            + #13 +
   '     BFC.IDPESSOA, BFC.IDTITULAR, '                                                   + #13 +
   '     BFC.VALORATUAL, BFC.IDPLANOPREV, '                                               + #13 +
   '     BFC.IDBENEFICIO, BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.DATAFINALPREVISTA '      + #13 +
   '  FROM '                                                                              + #13 +
   '     BENEFBFCIARIO BFC '                                                              + #13 +
   '  WHERE '                                                                             + #13 +
   '         ( BFC.IDTITULAR  = ' + IntToStr(iPessoa) + ' ) '                             + #13 +

   // André Pontes - 26/07/2005 - pendência 19822
   '     AND ( BFC.IDPESSOA   = ' + IntToStr(iBenef) + ' ) '                              + #13 +
   // FIM André Pontes - 26/07/2005 - pendência 19822

   '     AND bfc.fontepagadora = 1  '                                                     + #13 + // SOL160129

   '     AND ( (BFC.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate)) + ','  +
                                              QuotedStr('DD/MM/YYYY') + ')) '   +
               'OR (BFC.DATAFINAL IS NULL) )'                                             + #13 +
   '  ) BEN '                                                                             + #13 +
   'WHERE '                                                                               + #13 +
   '      ( PPP.IDPESSOA      = ' + IntToStr(iPessoa) + ' ) '                             + #13 +
   '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                      + #13 +
   '  AND ( PPP.IDSITPART     = SIT.IDSITPART ) '                                         + #13 +
   '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                                          + #13 +
   '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA(+) ) '                                       + #13 ;

   //BRUNO AZEVEDO SOL 153259 KINTANA 1152177
   //'  AND PPP.FLGDESATIVADO   = 0 '                                                       + #13;
   if (idplanoprev > 0) then begin
     sSQL := sSQL + '  AND NVL(BEN.IDPLANOPREV,PPP.IDPLANOPREV) = ' + FloatToStr(idplanoprev) + #13;
   end;
   //BRUNO AZEVEDO SOL 153259 KINTANA 1152177

   // SOL 198995 Kintana 1914430
   sSQL := sSQL + ' AND  (ppp.idplanoprev    = ben.idplanoprev    '                           + #13 +
                  '     OR                                         '                          + #13 +
                  '     NOT EXISTS (SELECT 1 FROM partprevplan ppp1   '                       + #13 +
                  '                 WHERE ppp1.idpessoa = ppp.idpessoa   '                    + #13 +
                  '                 AND   ppp1.idplanoprev = ben.idplanoprev))  '             + #13 ;

   // SOL 198995 Kintana 1914430

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 05/07/2005 - pendência 19631
   if Sistema.TipoCliente <> 19981 then sSQL := sSQL +
   '  AND ( ELP.IDPESSJUR      = PPP.IDPESSJUR ) '                                        + #13;
   // FIM André Pontes - 05/07/2005 - pendência 19631
   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL + ' ORDER BY  SIT.FLGINTERNO '; //Fanuel Junior SOL160718 Kintana1351446


   try
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      sSQLRegra   := '';
      iSequencial := 0;

      with qryAux do
      begin
         while not(EOF) do
         begin
            Inc(iSequencial);

            // prepara nova SQL, para a Regra
            sSQLRegra := sSQLRegra +
            'SELECT '                                                                                    + #13 +
            '  ' + IntToStr(iSequencial)                                      + ' AS SEQUENCIAL, '       + #13 +
            '  ' + NumeroIngles(FieldByName('SALPARTICIPACAO').AsCurrency)    + ' AS SALPARTICIPACAO, '  + #13 +
            '  ' + NumeroIngles(FieldByName('SALMANTIDO').AsCurrency)         + ' AS SALMANTIDO, '       + #13 +
            '  ' + NumeroIngles(FieldByName('SALAUXDOENCA').AsCurrency)       + ' AS SALAUXDOENCA, '     + #13 +

            '  ' + NumeroIngles(FieldByName('VALORATUAL').AsCurrency)         + ' AS VALORATUAL, '       + #13 +

            '  ' + IntToStr(FieldByName('IDBENEFICIO').AsInteger)             + ' AS IDBENEFICIO, '      + #13 +
            '  ' + IntToStr(FieldByName('IDSITBENEFICIO').AsInteger)          + ' AS IDSITBENEFICIO, '   + #13 +
            '  ' + IntToStr(FieldByName('IDSITPART').AsInteger)               + ' AS IDSITPART, '        + #13 +
            '  ' + IntToStr(FieldByName('IDPESSJUR').AsInteger)               + ' AS IDPESSJUR, '        + #13 +
            '  ' + IntToStr(iBenef)                                           + ' AS IDPESSOA, '         + #13 +
            '  ' + IntToStr(iPessoa)                                          + ' AS IDTITULAR, '        + #13 +
            '  ' + IntToStr(iIdTipoContremptmo)                               + ' AS IDTIPOCONTREMPTMO , ' + #13 +

            '  ' + IntToStr(FieldByName('IDPLANOPREV').AsInteger)             + ' AS IDPLANOPREV, '      + #13 +
            '  ' + IntToStr(FieldByName('IDSITFUNC').AsInteger)               + ' AS IDSITFUNC, '        + #13 +
            '  ' + IntToStr(FieldByName('FLGDIRETOR').AsInteger)              + ' AS FLGEXDIRETOR, '     + #13 +

            '  ' + QuotedStr(FieldByName('FLGINTERNO').AsString)              + ' AS FLGINTERNO, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSolic))        + ' AS DATASOLIC, '        + #13 +

            ' 0'  + IntToStr(iLote)                                           + ' AS FLGLOTE, '          + #13 +

            //Pendência 22836 - 03/10/2006 - Alberto
            ' 0'  + IntToStr(Ord(bExcepcional))                               + ' AS FLGEXCEPCIONAL, '   + #13 +
            //Fim Pendência 22836

            '  ' + QuotedStr(FieldByName('DATANASC').AsString)                + ' AS DATANASC, '         + #13 +
            ' 1'                                                              + ' AS SEQPROPOSTA, '      + #13 +
            '  ' + QuotedStr(FieldByName('SEXO').AsString)                    + ' AS SEXO '              + #13 +
            'FROM DUAL ';

            if dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then Break;  // BACA!!!

            Next;

            if not(EOF) then sSQLRegra := sSQLRegra + 'UNION ' + #13;
         end;
      end;

      if UtilizaRegraValor(IDRegra, sSQLRegra, 'e Calculo de Salario Base', sSalario, bMostraMsg) then
      begin
         if (sSalario <> '') and (sSalario <> 'NULO') then
         begin
            (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
            Result := StrToFloat(ConverteVirg(sSalario))
         end
         else
         begin
            Result := 0;
         end;
      end
      else
      begin
        Result := 0;
      end;
   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;

                                                                                       

function TCalcEmptmo.BuscaMargem(const IDTitular         : Int64;
                                 const IDBeneficiario    : Int64;
                                 const IDRegra           : Int64;
                                 const fSalarioBase      : Currency;
                                 const fParcelas         : Currency;
                                 const fPendencias       : Currency;
                                 var   fSalParticipacao  : Currency;
                                 var   fSalMantido       : Currency;
                                 var   fSalAuxDoenca     : Currency;
                                 var   fSalBenef         : Currency;
                                 const bMostraMsg        : Boolean;
                                 const dDataSolic        : TDateTime;
                                 const iPrazo            : Integer;
                                 const aListaContrato    : array of Extended;
                                 const bFinanciamento    : Boolean = False;
                                 const iLote             : Integer = 0;
                                 //Pendência 22836 - 03/10/2006 - Alberto
                                 const bExcepcional      : Boolean = false;
                                 //Fim Pendência 22836
                                 dDataSolicitacao        : String = '';  // Renato Visoni - SOL 129432 Kintana 709925
                                 const dDataCredito      : String = '';  // Ádler Souza - SOL 131189 Kintana 744558
                                 const iOrigem           : Integer = 0;  // Ádler Souza - SOL 75516 Kintana 523281
                                 const IDTipoContrEmptmo : Currency = -1; // Ádler Souza - SOL 136207 Kintana 813120
                                 const idPlanoPrev       : Extended = 0 //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                ): Currency;
var
  sSQL, sMargem  : String;
  fValorAtual    : Currency;
  IDBeneficio    : Int64;
  IDSitBeneficio : Int64;
  IDSitPart      : Int64;
  IDPessJur      : Int64;
  IDPessoa       : Int64;
  dDataNasc      : TDateTime;
  sSexo          : String;
  sSQLRegra      : String;
  qryAux         : TwwQuery;
  iSequencial    : Integer;
  iDependIRRF    : Integer;
  iQuita         : Integer;
  iContador      : Integer;
  sFlgInterno    : String; //Renato Visoni SOL 124955 Kintana 640066
  //Renato Visoni SOL 129591
  sIDTIPOSUSPEMPTMO : String;
  sFLGSUSPENSAO     : String;
  sPERCENTUAL       : String;
  sFORMACOBRANCA    : String;
  sDATACREDITO      : String;
  //Fim - Renato Visoni SOL 129591

begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';

   sFlgInterno :=''; //Renato Visoni SOL 124955 Kintana 640066
   IDPessJur := -1;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO, '                                      + #13 +
   '  NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO, '                                                + #13 +
   '  NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA, '                                            + #13 +
   '  NVL(BEN.VALORATUAL, 0) AS VALORATUAL, '                                                + #13 +
   '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.DATAFINALPREVISTA, '           + #13 +
   '  BEN.IDTPPAGTOBENEFIC, ELP.IDSITFUNC, '                                                 + #13 +
   '  DECODE(ELP.IDPESSJURCEDIDO, NULL, ELP.IDPESSJUR, ELP.IDPESSJURCEDIDO) AS IDPESSJUR, '  + #13 +
   '  PPP.IDPESSOA, PFI.DATANASC, PFI.SEXO, '                                                + #13 +
   '  PPP.IDSITPART, SIT.FLGINTERNO, '                                                       + #13 +
   '  DECODE(BEN.IDPLANOPREV, NULL, PPP.IDPLANOPREV, BEN.IDPLANOPREV) AS IDPLANOPREV, '      + #13 +
   '  PPP.IDSITPLANOPREV '                                                                   + #13 +
   'FROM '                                                                                   + #13 +
   '  PESSOAFISICA PFI, '                                                                    + #13 +
   '  PARTPREVPLAN PPP, '                                                                    + #13 +
   '  ELEGPATRO    ELP, '                                                                    + #13 +
   '  SITPART      SIT, '                                                                    + #13 +
   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     BFC.IDPESSOA, BFC.IDTITULAR, '                                                      + #13 +
   '     BFC.VALORATUAL, BFC.IDPLANOPREV, '                                                  + #13 +
   '     BFC.IDTPPAGTOBENEFIC, '                                                             + #13 +
   '     BFC.IDBENEFICIO, BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.DATAFINALPREVISTA '         + #13 +
   '  FROM '                                                                                 + #13 +
   '     BENEFBFCIARIO BFC '                                                                 + #13 +
   '  WHERE '                                                                                + #13 +
   '         ( BFC.IDTITULAR  = ' + IntToStr(IDTitular) + ' ) '                              + #13 +
   '     AND ( BFC.IDPESSOA   = ' + IntToStr(IDBeneficiario) + ' ) '                         + #13 +
   //BRUNO AZEVEDO SOL 149621 KINTANA 1076936
   '     AND BFC.FONTEPAGADORA = 1 '                                                         + #13 +
   //Fanuel Junior
   '     AND ( BFC.IDTPPAGTOBENEFIC = 1)     '                                               + #13 +
   '     AND ( (BFC.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate)) + ','  +
                                              QuotedStr('DD/MM/YYYY') + ')) '   +
               'OR (BFC.DATAFINAL IS NULL) )'                                                + #13 +
   '  ) BEN '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '      ( PPP.IDPESSOA      = ' + IntToStr(IDTitular) + ' ) '                              + #13 +
   '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                         + #13 +
   '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                                             + #13 +
   '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA(+) ) '                                          + #13 + // André Pontes - 06/08/2004
   '  AND ( PPP.IDSITPART     = SIT.IDSITPART ) '                                            + #13 +
   //BRUNO AZEVEDO SOL 145941 KINTANA 984808
   //'  AND PPP.FLGDESATIVADO   = 0 '                                                        + #13;
  // '  AND NVL(ben.idplanoprev,ppp.idplanoprev)  = ' + FloatToStr(IdPlanoPrev)                + #13 + // fernando santana SOL 147330 KINTANA 1017161 // SOL 189156 KINTANA  1785083  comentado a alteração do SOL 147330
   '  AND NVL(ben.idplanoprev,ppp.idplanoprev)  = ' + FloatToStr(IdPlanoPrev)                + #13 + //  SOL 189681 KINTANA 1794045
  // SOL 147690 KINTANA 1031074
   ' AND (ppp.idplanoprev = BEN.idplanoprev '+ #13 +
   ' OR '+ #13 +
   ' ben.idplanoprev is NULL '+ #13 +
   ' OR '+ #13 +
   ' (ben.idplanoprev <> ppp.idplanoprev AND ben.idpessoa <> ben.idtitular)) '+ #13 ;
  // SOL 147690 KINTANA 1031074
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL := sSQL +
      '  AND ( ELP.IDPESSJUR      = PPP.IDPESSJUR ) '                                        + #13;

      // André Pontes - 11/01/2004
      // Contagem do nº de dependentes para IRRF (DepenTit, FlgImpostor) e passagem do resultado
      // para as regras (DEPENDIRRF)
      with dtmCalcEmptmo.qryDependIRRF do
      begin
         LimpaParametros(dtmCalcEmptmo.qryDependIRRF);
         ParamByName('PIDTITULAR').AsFloat      := IDTitular;
         ParamByName('PFIMIMPOSTOR').AsDateTime := dDataSolic;
         Open;

         iDependIRRF := dtmCalcEmptmo.qryDependIRRFQUANT.AsInteger;

         Close;
      end;
      // FIM André Pontes - 11/01/2004
   end;

   try
      // abre a query, para depois montar para a Regra
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      sSQLRegra   := '';
      iSequencial := 0;

      with qryAux do
      begin
         while not(EOF) do
         begin
            Inc(iSequencial);
            IDPessJur := FieldByName('IDPESSJUR').AsInteger; //Ádler Souza SOL 140430 Kintana 878775

            sFlgInterno := QryAux.FieldByName('FLGINTERNO').AsString; //Renato Visoni SOL 124955 Kintana 640066

            // Prepara nova SQL, para a Regra
            sSQLRegra := sSQLRegra +
            'SELECT '                                                                                    + #13 +
            ' 0'                                                              + ' AS TIPO, '             + #13 +
            '  ' + IntToStr(iSequencial)                                      + ' AS SEQUENCIAL, '       + #13 +
            '  ' + NumeroIngles(FieldByName('SALPARTICIPACAO').AsCurrency)    + ' AS SALPARTICIPACAO, '  + #13 +
            '  ' + NumeroIngles(FieldByName('SALMANTIDO').AsCurrency)         + ' AS SALMANTIDO, '       + #13 +
            '  ' + NumeroIngles(FieldByName('SALAUXDOENCA').AsCurrency)       + ' AS SALAUXDOENCA, '     + #13;

            if bFinanciamento then sSQLRegra := sSQLRegra +
            '  1'                                                             + ' AS FLGFINANCIAMENTO, ' + #13
            else sSQLRegra := sSQLRegra +
            '  0'                                                             + ' AS FLGFINANCIAMENTO, ' + #13;

            sSQLRegra := sSQLRegra +
            '  0' + IntToStr(Ord(bExcepcional))                               + ' AS FLGEXCEPCIONAL, '   + #13 + //Pendência 22836 - 03/10/2006 - Alberto
            '  ' + NumeroIngles(fSalarioBase)                                 + ' AS SALARIOBASE,       '+ #13 +
            '  ' + NumeroIngles(fParcelas)                                    + ' AS TOT_PARCELAS,      '+ #13 +
            '  ' + NumeroIngles(fPendencias)                                  + ' AS PENDENCIAS,        '+ #13 +
            '  ' + IntToStr(iPrazo)                                           + ' AS NUMPARCELAS,       '+ #13 +
            '  ' + NumeroIngles(FieldByName('VALORATUAL').AsCurrency)         + ' AS VALORATUAL,        '+ #13 +
            '  0'                                                             + ' AS ULTPARCCOBR,       '+ #13 + //SOL 129845 - Ádler Souza
            '  ' + QuotedStr('-1')                                            + ' AS FGQCFORMACOBR,     '+ #13 +//
            '  0'                                                             + ' AS ULTFGQCCOBR,       '+ #13 +
            '  ' + IntToStr(FieldByName('IDBENEFICIO').AsInteger)             + ' AS IDBENEFICIO,       '+ #13 +
            '  ' + IntToStr(FieldByName('IDSITBENEFICIO').AsInteger)          + ' AS IDSITBENEFICIO,    '+ #13 +
            '  ' + IntToStr(FieldByName('IDSITPART').AsInteger)               + ' AS IDSITPART,         '+ #13 +
            '  ' + IntToStr(FieldByName('IDPESSJUR').AsInteger)               + ' AS IDPESSJUR,         '+ #13 +
            '  ' + IntToStr(FieldByName('IDPLANOPREV').AsInteger)             + ' AS IDPLANOPREV,       '+ #13 +
            '  ' + IntToStr(FieldByName('IDSITPART').AsInteger)               + ' AS IDSITPART,         '+ #13 +
            '  ' + IntToStr(FieldByName('IDSITFUNC').AsInteger)               + ' AS IDSITFUNC,         '+ #13 +
            '  ' + IntToStr(FieldByName('IDSITPLANOPREV').AsInteger)          + ' AS IDSITPLANOPREV,    '+ #13 +
            '  ' + IntToStr(IDTitular)                                        + ' AS IDTITULAR,         '+ #13 +
            '  ' + IntToStr(IDBeneficiario)                                   + ' AS IDPESSOA,          '+ #13 +
            '  ' + QuotedStr(FieldByName('FLGINTERNO').AsString)              + ' AS FLGINTERNO,        '+ #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSolic))        + ' AS DATASOLIC,         '+ #13 +
            ' 0'  + IntToStr(iLote)                                           + ' AS FLGLOTE,           '+ #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',FieldByName('DATANASC').AsDateTime)) + ' AS DATANASC, ' + #13 +
            ' 0' + IntToStr(iDependIRRF)                                      + ' AS DEPENDIRRF,        '+ #13 +
            '  ' + IntToStr(Sistema.IdModulo)                                 + ' AS IDMODULO,          '+ #13 + //Pendência 23423 - 23/02/2007 - Alberto - Padrão 15
            '  ' + QuotedStr(FieldByName('SEXO').AsString)                    + ' AS SEXO,              '+ #13 +
            ' 0'                                                              + ' AS IDCONTRATOEMPTMO,  '+ #13 +
            ' 0'                                                              + ' AS IDTIPOCONTREMPTMO, '+ #13 +
            //Renato Visoni SOL 129375 Kintana 708500
            QuotedStr('-1')                                                   + ' AS IDTIPOSUSPEMPTMO,  '+ #13 +
            QuotedStr('-1')                                                   + ' AS FLGSUSPENSAO,      '+ #13 +
            QuotedStr('-1')                                                   + ' AS PERCENTUAL,        '+ #13 +
            //Renato Visoni SOL 129375 Kintana 708500
            QuotedStr('-1')                                                   + ' AS FORMACOBRANCA,     '+ #13 + //Renato Visoni SOL 129432 Kintana 709925
//            QuotedStr('-1')                                                    + ' AS DATACREDITO,    '+ #13 + //Renato Visoni SOL 129465 Kintana 710165
            '  ' + QuotedStr(dDataCredito)                                    + ' AS DATACREDITO,       '+ #13 + // Ádler Souza - SOL 131189 Kintana 744558
            '  ' + IntToStr(iOrigem)                                          + ' AS HMEORIGEM,         '+ #13 + // Ádler Souza - SOL 75516 Kintana 523281
            ' 0'                                                              + ' AS FLGQUITA,          '+ #13 +
            '-1'                                                              + ' AS VLRULTPREST ,      '+ #13 + //Renato Visoni SOL 124955 Kintana 640066
            '-1'                                                              + ' AS TIPOCONTRQUITADO   '+ #13 + //Renato Visoni SOL 124955 Kintana 640066

            'FROM DUAL ';

            Next;

            if not(EOF) then sSQLRegra := sSQLRegra + 'UNION ' + #13;

         end;
      end;

 // Somente para a FUNCEF
      if Sistema.TipoCliente = 19991 then
      begin
           //William Moreira da Silva - SOL 260816 PPM 1051407 - Inicio
           sSQL :=  'SELECT CON.IDCONTRATOEMPTMO,' + #13#10 +
                    '       CON.IDTIPOCONTREMPTMO,' + #13#10 +
                    '       CM.PCK_EMPRESTIMO.FN_VALORULTIMAPRESTACAO(CON.IDCONTRATOEMPTMO) AS VLRULTPARCELA,' + #13#10 +
                    '       SCP.IDTIPOSUSPEMPTMO,' + #13#10 +
                    '       SCP.FLGSUSPENSAO,' + #13#10 +
                    '       SCP.PERCENTUAL,' + #13#10 +
                    '       SCP.FORMACOBRANCA,' + #13#10 +
                    '       SCP.hmevlrprevisto AS ULTPARCCOBR,' + #13#10 +
                    '       FGQC.FORMACOBRANCA AS FGQCFORMACOBR,' + #13#10 +
                    '       FGQC.hmevlrprevisto AS ULTFGQCCOBR,' + #13#10 +
                    '       (SELECT h2.dataprevista' + #13#10 +
                    '          FROM hmeconcessao h2' + #13#10 +
                    '         WHERE h2.idcontratoemptmo = CON.IDCONTRATOEMPTMO' + #13#10 +
                    '           AND h2.origem = 0' + #13#10 +
                    '           AND h2.naturezaitem = 2' + #13#10 +
                    '           AND h2.flgestornado = 0) AS DATACREDITO' + #13#10 +
                    '  FROM CONTRATOEMPTMO CON,' + #13#10 +
                    '       (SELECT H.IDCONTRATOEMPTMO,' + #13#10 +
                    '               H.IDTIPOSUSPEMPTMO,' + #13#10 +
                    '               NVL2(h.idtiposuspemptmo,1,0) AS FLGSUSPENSAO,' + #13#10 +
                    '               h.vlrprevisto AS HMEVLRPREVISTO,' + #13#10 +
                    '               (SELECT tp.percentual' + #13#10 +
                    '                  FROM tiposuspemptmo TP' + #13#10 +
                    '                 WHERE tp.idtiposuspemptmo = h.idtiposuspemptmo) AS PERCENTUAL,' + #13#10 +
                    '               h.formacobranca AS FORMACOBRANCA' + #13#10 +
                    '          FROM hmeprestacao H' + #13#10 +
                    '               JOIN CONTRATOEMPTMO C ON H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO' + #13#10 +
                    '         WHERE C.IDPESSOA = ' + IntToStr(IDTitular) + #13 +
                    '           AND C.IDBENEF =  ' + IntToStr(IDBeneficiario) + #13 +
                    '           AND H.Naturezaitem = 2' + #13#10 +
                    '           AND h.flgquitabonoestorno <> 3' + #13#10 +
                    '           AND h.origem = 1' + #13#10 +
                    '           AND h.iditememptmo = 13' + #13#10 +
                    '           AND H.PARCELA = (SELECT MAX(HME.PARCELA)' + #13#10 +
                    '                              FROM hmeprestacao HME' + #13#10 +
                    '                             WHERE hme.origem = 1' + #13#10 +
                    '                               AND HME.Flgquitabonoestorno <> 3' + #13#10 +
                    '                               AND HME.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ' + #13;

           if dDataSolicitacao ='' then
               sSQL := sSQL +  'AND hme.dataprevista <= TRUNC(sysdate) )) SCP,' + #13
           else
               sSQL := sSQL +  '            AND hme.dataprevista <= TO_DATE('+ QuotedStr(dDataSolicitacao)+',''DD/MM/YYYY''))) SCP, ' + #13;

           sSQL := sSQL +  '(SELECT H.IDCONTRATOEMPTMO,' + #13#10 +
                            '        H.IDTIPOSUSPEMPTMO,' + #13#10 +
                            '        NVL2(h.idtiposuspemptmo,1,0) AS FLGSUSPENSAO,' + #13#10 +
                            '        h.vlrprevisto AS HMEVLRPREVISTO,' + #13#10 +
                            '       NULL AS PERCENTUAL,' + #13#10 +
                            '      h.formacobranca AS FORMACOBRANCA,' + #13#10 +
                            '       h.parcela' + #13#10 +
                            '  FROM hmeprestacao  H' + #13#10 +
                            '       JOIN CONTRATOEMPTMO C ON H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO' + #13#10 +
                            ' WHERE C.IDPESSOA = ' + IntToStr(IDTitular) + #13 +
                            '   AND C.IDBENEF = ' + IntToStr(IDBeneficiario) + #13 +
                            '   AND H.Naturezaitem = 1' + #13#10 +
                            '   AND H.Flgquitabonoestorno <> 3' + #13#10 +
                            '   AND h.origem = 1' + #13#10 +
                            '   AND h.iditememptmo = 99' + #13#10 +
                            '   AND H.PARCELA = (SELECT MAX(HME.PARCELA)' + #13#10 +
                            '                      FROM hmeprestacao HME' + #13#10 +
                            '                     WHERE hme.origem = 1' + #13#10 +
                            '                       AND HME.Flgquitabonoestorno <> 3' + #13#10 +
                            '                       AND HME.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ' + #13;

           if dDataSolicitacao ='' then
               sSQL := sSQL +  '  AND hme.dataprevista <=  TRUNC(sysdate) )) FGQC           ' + #13
           else
               sSQL := sSQL +  '  AND hme.dataprevista <= TO_DATE('+ QuotedStr(dDataSolicitacao)+ ',''DD/MM/YYYY''))) FGQC ' + #13 ;

               sSQL := sSQL +  'WHERE  CON.IDPESSOA = ' + IntToStr(IDTitular) + #13 +
                               '      AND CON.IDBENEF = ' + IntToStr(IDBeneficiario) + #13 +
                                '   AND CON.FLGSITUACAO = ''A''' + #13#10 +
                                '   AND CON.IDCONTRATOEMPTMO = SCP.IDCONTRATOEMPTMO(+)' + #13#10 +
                                '   AND con.idcontratoemptmo = FGQC.IDCONTRATOEMPTMO(+)' + #13#10 ;


           if iOrigem = 2 then
                   sSQL := sSQL + '   AND CON.IDCONTRATOEMPTMO = ' + FloatToStr(IDTipoContrEmptmo); // Ádler Souza - SOL 136207 Kintana 813120

           sSQL := sSQL + 'ORDER BY CON.IDCONTRATOEMPTMO';
           //William Moreira da Silva - SOL 260816 PPM 1051407 - Fim

        qryAux.Close;
        qryAux.SQL.Text := sSQL;
        qryAux.Open;

        if not qryAux.IsEmpty then
        begin
           if sSQLRegra <> '' then sSQLRegra := sSQLRegra + 'UNION ' + #13;

           while not qryAux.eof do
           begin
              iQuita := 0;

              for iContador := 0 to Length(aListaContrato)-1 do
              begin
                 if aListaContrato[iContador] = qryAux.FieldByName('IDCONTRATOEMPTMO').AsFloat then
                    iQuita := 1;
              end;
             
              //Renato Visoni SOL 129591
              sIDTIPOSUSPEMPTMO :='-1';
              sFLGSUSPENSAO     :='-1';
              sPERCENTUAL       :='-1';
              sFORMACOBRANCA    :='-1';
              sDATACREDITO      :='-1';

              if qryAux.FieldByName('IDTIPOSUSPEMPTMO').AsString <> '' then sIDTIPOSUSPEMPTMO := qryAux.FieldByName('IDTIPOSUSPEMPTMO').AsString;
              if qryAux.FieldByName('FLGSUSPENSAO').AsString     <> '' then sFLGSUSPENSAO     := qryAux.FieldByName('FLGSUSPENSAO').AsString;
              if qryAux.FieldByName('PERCENTUAL').AsString       <> '' then sPERCENTUAL       := qryAux.FieldByName('PERCENTUAL').AsString;
              if qryAux.FieldByName('FORMACOBRANCA').AsString    <> '' then sFORMACOBRANCA    := qryAux.FieldByName('FORMACOBRANCA').AsString;
              if qryAux.FieldByName('DATACREDITO').AsString      <> '' then sDATACREDITO      := qryAux.FieldByName('DATACREDITO').AsString;
              //Renato Visoni SOL 129591



              Inc(iSequencial);

              // Prepara nova SQL, para a Regra
              sSQLRegra := sSQLRegra +
              'SELECT '                                                                                    + #13 +
              ' 1'                                                              + ' AS TIPO, '             + #13 +
              '  ' + IntToStr(iSequencial)                                      + ' AS SEQUENCIAL, '       + #13 +
              ' 0'                                                              + ' AS SALPARTICIPACAO, '  + #13 +
              ' 0'                                                              + ' AS SALMANTIDO, '       + #13 +
              ' 0'                                                              + ' AS SALAUXDOENCA, '     + #13 +
              ' 0'                                                              + ' AS FLGFINANCIAMENTO, ' + #13 +
              ' 0' + IntToStr(Ord(bExcepcional))                                + ' AS FLGEXCEPCIONAL, '   + #13 +

              ' 0'                                                              + ' AS SALARIOBASE, '      + #13 +
              ' 0' + NumeroIngles(qryAux.FieldByName('VLRULTPARCELA').AsFloat)  + ' AS TOT_PARCELAS, '     + #13 +
              ' 0'                                                              + ' AS PENDENCIAS, '       + #13 +

              '  ' + IntToStr(iPrazo)                                           + ' AS NUMPARCELAS, '      + #13 +

              ' 0'                                                              + ' AS VALORATUAL, '       + #13 +
              '  ' + NumeroIngles(qryAux.FieldByName('ULTPARCCOBR').AsFloat)    + ' AS ULTPARCCOBR, '      + #13 +//SOL 129845 - Ádler Souza
              '  '+ QuotedStr(qryAux.FieldByName('FGQCFORMACOBR').AsString)     + ' AS FGQCFORMACOBR, '    + #13 +
              '  '+ NumeroIngles(qryAux.FieldByName('ULTFGQCCOBR').AsFloat)     + ' AS ULTFGQCCOBR,   '    + #13 +




              '-1'                                                              + ' AS IDBENEFICIO, '      + #13 +
              '-1'                                                              + ' AS IDSITBENEFICIO, '   + #13 +
              '-1'                                                              + ' AS IDSITPART, '        + #13 +
              '  ' + IntToStr(IDPessJur)                                        + ' AS IDPESSJUR, '        + #13 +//Ádler Souza
              '-1'                                                              + ' AS IDPLANOPREV, '      + #13 +
              '-1'                                                              + ' AS IDSITPART, '        + #13 +
              '-1'                                                              + ' AS IDSITFUNC, '        + #13 +
              '-1'                                                              + ' AS IDSITPLANOPREV, '   + #13 +

              '  ' + IntToStr(IDTitular)                                        + ' AS IDTITULAR, '        + #13 +
              '  ' + IntToStr(IDBeneficiario)                                   + ' AS IDPESSOA, '         + #13 +

              ' ''X'''                                                          + ' AS FLGINTERNO, '       + #13 +

              '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSolic))        + ' AS DATASOLIC, '        + #13 +

              ' 0'                                                              + ' AS FLGLOTE, '          + #13 +

              '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',SysDate))            + ' AS DATANASC, ' + #13 +
              ' 0'                                                              + ' AS DEPENDIRRF, '       + #13 +
              '  ' + IntToStr(Sistema.IdModulo)                                 + ' AS IDMODULO, '         + #13 +
              ' ''X'''                                                          + ' AS SEXO, '             + #13 +

              ' 0' + qryAux.FieldByName('IDCONTRATOEMPTMO').AsString            + ' AS IDCONTRATOEMPTMO, '   + #13 +
              ' 0' + qryAux.FieldByName('IDTIPOCONTREMPTMO').AsString           + ' AS IDTIPOCONTREMPTMO, '  + #13 +

              // Renato Visoni SOL 129375 Kintana 708500
              QuotedStr(sIDTIPOSUSPEMPTMO)                                      + ' AS IDTIPOSUSPEMPTMO, '  + #13 +
              QuotedStr(sFLGSUSPENSAO)                                          + ' AS FLGSUSPENSAO, '      + #13 +
              QuotedStr(sPERCENTUAL)                                            + ' AS PERCENTUAL, '        + #13 +
              // Renato Visoni SOL 129375 Kintana 708500

              QuotedStr(sFORMACOBRANCA)                                         + ' AS FORMACOBRANCA, '     + #13 + //Renato Visoni SOL 129432 Kintana 709925
              QuotedStr(sDATACREDITO)                                           + ' AS DATACREDITO, '       + #13 + //Renato Visoni SOL 129465 Kintana 710165
              IntToStr(iOrigem)                                                 + ' AS HMEORIGEM, '         + #13 + //Ádler Souza - SOL 75516 Kintana 523281
              '  ' + IntToStr(iQuita)                                           + ' AS FLGQUITA, '           + #13 +

              '-1'                                                              + ' AS VLRULTPREST , '       + #13 + //Renato Visoni SOL 124955 Kintana 640066
              '-1'                                                              + ' AS TIPOCONTRQUITADO '    + #13 + //Renato Visoni SOL 124955 Kintana 640066


              'FROM DUAL ';

              qryAux.Next;

              if not(qryAux.EOF) then sSQLRegra := sSQLRegra + 'UNION ' + #13;
           end;
        end;

      end;
 
     //Renato Visoni SOL 124955 Kintana 640066
      qryAux.Close;
      qryAux.SQL.Clear;
                                                                      //Thiago Passos SOL 132357 Kintana 761914    //Thiago Passos SOL 132357 Kintana 761914 //Thiago Passos SOL 132357 Kintana 761914 //Thiago Passos SOL 132357 Kintana 761914
      qryAux.SQL.Add(' SELECT C.IDCONTRATOEMPTMO,C.IDTIPOCONTREMPTMO,nvl(H.hmevlrprevisto,0) AS ULTPARCCOBR,nvl(H.IDTIPOSUSPEMPTMO,-1)IDTIPOSUSPEMPTMO,nvl(H.FLGSUSPENSAO,-1)FLGSUSPENSAO,  h.hmeformacobranca AS FORMACOBRANCA ,h.hmedataprevista as datacredito');
                                    //Thiago Passos SOL 132357 Kintana 761914
      qryAux.SQL.Add('        ,nvl( (SELECT nvl(tp.percentual,-1) FROM tiposuspemptmo TP ');
      qryAux.SQL.Add('                    WHERE tp.idtiposuspemptmo = h.idtiposuspemptmo),-1) AS PERCENTUAL, ');

      qryAux.SQL.Add('      (SELECT SUM(HMEVLRPREVISTO) ');
      qryAux.SQL.Add('     FROM HISTMOVEMPTMO H                              ');
      qryAux.SQL.Add('    WHERE H.IDCONTRATOEMPTMO = c.idcontratoemptmo      ');
      qryAux.SQL.Add('      AND H.IDITEMEMPTMO IN (''13'',''99'')                ');
      qryAux.SQL.Add('      AND h.hmetipomov = 1                             ');
      qryAux.SQL.Add('      AND h.hmedataprevista = (SELECT MAX(hme.hmedataprevista) FROM histmovemptmo hme');
      qryAux.SQL.Add('                               WHERE hme.idcontratoemptmo = c.idcontratoemptmo');
      qryAux.SQL.Add('                               AND   hme.hmetipomov = 1');
      qryAux.SQL.Add('                               AND   nvl(h.flgestornado,0) = 0)');

      qryAux.SQL.Add('      ) AS VLRULTPREST ,');
      qryAux.SQL.Add('  C.IDTIPOCONTREMPTMO');
      qryAux.SQL.Add(' FROM HISTMOVEMPTMO H, CONTRATOEMPTMO C');
      qryAux.SQL.Add(' WHERE c.idpessoa = '+ IntToStr(idTitular));     ///*IDTITULAR*/
      qryAux.SQL.Add('  AND c.idbenef = '+ IntToStr(IDBeneficiario));  ///*IDPESSOA*/
      qryAux.SQL.Add('  AND H.HMETIPOMOV = 3');
      qryAux.SQL.Add('  AND H.HMEORIGEM = 3');
      qryAux.SQL.Add('  AND h.hmecentraliza = 1');
      qryAux.SQL.Add('  AND TO_CHAR(H.HMEDATAPREVISTA, ''MM/YYYY'') = TO_CHAR(SYSDATE, ''MM/YYYY'')');
      qryAux.SQL.Add('  AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO');
      qryAux.SQL.Add('  AND nvl(h.flgestornado,0) = 0');
      qryAux.SQL.Add('  AND h.hmevlrefetivo IS NOT NULL');
      qryAux.SQL.Add('  AND h.hmedataefetiva IS NOT NULL');

      qryAux.Open;

      qryAux.first;

      if qryAux.RecordCount > 0 then begin
        while not qryAux.eof do begin
          if qryAux.FieldByname('VLRULTPREST').asInteger <> 0 then begin
            sSQLRegra := sSQLRegra +
              'UNION SELECT '                                                                                    + #13 +
                ' -1'                                                              + ' AS TIPO, '             + #13 +
                '  ' + IntToStr(iSequencial)                                      + ' AS SEQUENCIAL, '       + #13 +
                ' 0'                                                              + ' AS SALPARTICIPACAO, '  + #13 +
                ' 0'                                                              + ' AS SALMANTIDO, '       + #13 +
                ' 0'                                                              + ' AS SALAUXDOENCA, '     + #13 +
                ' 0'                                                              + ' AS FLGFINANCIAMENTO, ' + #13 +
                ' 0' + IntToStr(Ord(bExcepcional))                                + ' AS FLGEXCEPCIONAL, '   + #13 +

                ' 0'                                                              + ' AS SALARIOBASE, '      + #13 +
                ' 0'                                                              + ' AS TOT_PARCELAS, '     + #13 +
                ' 0'                                                              + ' AS PENDENCIAS, '       + #13 +

                '  ' + IntToStr(iPrazo)                                           + ' AS NUMPARCELAS, '      + #13 +

                ' 0'                                                              + ' AS VALORATUAL, '       + #13 +
                '  ' + NumeroIngles(QryAux.FieldByName('ULTPARCCOBR').AsFloat)   + ' AS ULTPARCCOBR, '      + #13 +  //Thiago Passos SOL 132357 Kintana 761914
                '  ' + QuotedStr('-1')                                            + ' AS FGQCFORMACOBR,     '+ #13 +//
                ' 0'                                                              + ' AS ULTFGQCCOBR,       '+ #13 +

                '-1'                                                              + ' AS IDBENEFICIO, '      + #13 +
                '-1'                                                              + ' AS IDSITBENEFICIO, '   + #13 +
                '-1'                                                              + ' AS IDSITPART, '        + #13 +
                '-1'                                                              + ' AS IDPESSJUR, '        + #13 +
                '-1'                                                              + ' AS IDPLANOPREV, '      + #13 +
                '-1'                                                              + ' AS IDSITPART, '        + #13 +
                '-1'                                                              + ' AS IDSITFUNC, '        + #13 +
                '-1'                                                              + ' AS IDSITPLANOPREV, '   + #13 +

                '  ' + IntToStr(IDTitular)                                        + ' AS IDTITULAR, '        + #13 +
                '  ' + IntToStr(IDBeneficiario)                                   + ' AS IDPESSOA, '         + #13 +

                QuotedStr(sFlgInterno)                                            + ' AS FLGINTERNO, '       + #13 +

                '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSolic))        + ' AS DATASOLIC, '        + #13 +

                ' 0'                                                              + ' AS FLGLOTE, '          + #13 +

                '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',SysDate))            + ' AS DATANASC, ' + #13 +
                ' 0'                                                              + ' AS DEPENDIRRF, '       + #13 +
                '  ' + IntToStr(Sistema.IdModulo)                                 + ' AS IDMODULO, '         + #13 +
                ' ''X'''                                                          + ' AS SEXO, '             + #13 +

                ' 0' + qryAux.FieldByname('IDCONTRATOEMPTMO').asstring            + ' AS IDCONTRATOEMPTMO, '   + #13 +
                ' 0' + qryAux.FieldByname('IDTIPOCONTREMPTMO').asstring           + ' AS IDTIPOCONTREMPTMO, '  + #13 +
                        //Thiago Passos SOL 132357 Kintana 761914
                '  ' + QuotedStr(qryAux.FieldByname('IDTIPOSUSPEMPTMO').asstring)            + ' AS IDTIPOSUSPEMPTMO, '  + #13 +
                '  ' + QuotedStr(qryAux.FieldByname('FLGSUSPENSAO').asstring)                + ' AS FLGSUSPENSAO, '      + #13 +
                '  ' + QuotedStr(qryAux.FieldByname('PERCENTUAL').asstring)                  + ' AS PERCENTUAL, '        + #13 +
                '  ' + QuotedStr(qryAux.FieldByname('FORMACOBRANCA').asstring)               + ' AS FORMACOBRANCA, '     + #13 +
                '  ' + QuotedStr(qryAux.FieldByname('DATACREDITO').asstring)      + ' AS DATACREDITO, '       + #13 +
                        //Thiago Passos SOL 132357 Kintana 761914
                 //BRUNO AZEVEDO SOL 133044 KINTANA 771583
                '  ' + IntToStr(iOrigem)                                          + ' AS HMEORIGEM, '  + #13 +
                '  ' + IntToStr(iQuita)                                           + ' AS FLGQUITA, '            + #13 +

                '  ' + NumeroIngles(qryAux.FieldByname('VLRULTPREST').asFloat)      + ' AS VLRULTPREST , '         + #13 +
                '  ' + NumeroIngles(qryAux.FieldByname('IDTIPOCONTREMPTMO').asFloat) + ' AS TIPOCONTRQUITADO '         + #13 +

                'FROM DUAL ';
          end;
          QryAux.Next;
        end;
      end;

      //Renato Visoni SOL 124955 Kintana 640066

      if UtilizaRegraValor(IDRegra, sSQLRegra, 'e Margem Consignavel', sMargem, bMostraMsg) then
      begin
         if (sMargem <> '') and (sMargem <> 'NULO') then
         begin
            (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
            Result := StrToFloat(ConverteVirg(sMargem))
         end
         else
         begin
            Result := 0;
         end;
      end
      else
      begin
         Result := 0;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



function TCalcEmptmo.CarregaDadosParticipante(const IDTitular        : Int64;
                                              var   fValorAtual      : Currency;
                                              var   fSalParticipacao : Currency;
                                              var   fSalMantido      : Currency;
                                              var   fSalAuxDoenca    : Currency;
                                              var   fSalBenef        : Currency;
                                              var   IDBeneficio      : Int64;
                                              var   IDSitBeneficio   : Int64;
                                              var   IDSitPart        : Int64;
                                              var   IDPessJur        : Int64;
                                              var   IDPessoa         : Int64;
                                              var   dDataNasc        : TDateTime;
                                              var   sSexo            : String
                                              ) : Boolean;
var
   sSQL            : String;
   qryAux          : TwwQuery;
begin

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';

   Result := True;

   try
      sSQL :=
      'SELECT '                                                                           + #13 +
      '  NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO, '                                + #13 +
      '  NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO, '                                          + #13 +
      '  NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA, '                                      + #13 +
      '  NVL(BEN.VALORATUAL, 0) AS VALORATUAL, '                                          + #13 +
      '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.DATAFINALPREVISTA, '     + #13 +
      '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, PFI.DATANASC, PFI.SEXO '             + #13 +
      'FROM '                                                                             + #13 +
      '  PESSOAFISICA PFI, '                                                              + #13 +
      '  PARTPREVPLAN PPP, '                                                              + #13 +
      '  ( '                                                                              + #13 +
      '  SELECT '                                                                         + #13 +
      '     BF.IDPESSOA, BF.IDTITULAR, '                                                  + #13 +
      '     BF.VALORATUAL, '                                                              + #13 +
      '     BF.IDBENEFICIO, BF.IDSITBENEFICIO, BF.DATAFINAL, BF.DATAFINALPREVISTA '       + #13 +
      '  FROM '                                                                           + #13 +
      '     BENEFBFCIARIO BF '                                                            + #13 +
      '  WHERE '                                                                          + #13 +
      '         ( BF.IDTITULAR  = ' + IntToStr(IDTitular) + ' ) '                         + #13 +
      '     AND ( (BF.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate)) + ','  +
                                                 QuotedStr('DD/MM/YYYY') + ')) '   +
                  'OR (BF.DATAFINAL IS NULL) )'                                           + #13 +
      '  ) BEN '                                                                          + #13 +
      'WHERE '                                                                            + #13 +
      '      ( PPP.IDPESSOA      = ' + IntToStr(IDTitular) + ' ) '                        + #13 +
      '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                   + #13 +
      '  AND ( BEN.IDPESSOA      = PFI.IDPESSOA(+) ) '                                    + #13 +

      '  AND PPP.FLGDESATIVADO   = 0 '                                                    + #13;

      // abre a query, para depois montar para a Regra
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      // variáveis que retornam
      fSalParticipacao  := qryAux.FieldByName('SALPARTICIPACAO').AsFloat;
      fSalMantido       := qryAux.FieldByName('SALMANTIDO').AsFloat;
      fSalAuxDoenca     := qryAux.FieldByName('SALAUXDOENCA').AsFloat;
      fSalBenef         := qryAux.FieldByName('VALORATUAL').AsFloat;
      fValorAtual       := qryAux.FieldByName('VALORATUAL').AsFloat;
      IDBeneficio       := qryAux.FieldByName('IDBENEFICIO').AsInteger;
      IDSitBeneficio    := qryAux.FieldByName('IDSITBENEFICIO').AsInteger;
      IDSitPart         := qryAux.FieldByName('IDSITPART').AsInteger;
      IDPessJur         := qryAux.FieldByName('IDPESSJUR').AsInteger;
      IDPessoa          := qryAux.FieldByName('IDPESSOA').AsInteger;
      dDataNasc         := qryAux.FieldByName('DATANASC').AsDateTime;
      sSexo             := qryAux.FieldByName('SEXO').AsString;

      qryAux.Close;
   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.BuscaReserva(iIdBenef      : Int64;
                                  iIdPessJur    : Int64;
                                  iIdPlanoPrev  : Int64;
                                  iIdRegra      : Int64;
                                  dDataInsc     : TDateTime;
                                  bMostraMsg    : Boolean;
                                  const iLote   : Integer = 0
                                  //Pendência 22836 - 03/10/2006 - Alberto
                                 ;const bExcepcional : Boolean = false
                                  //Fim Pendência 22836
                                 ): Currency;
var
   sSQL, sReserva : String;
begin
   (* função que busca a Reserva de Poupança do participante ou do beneficiário, no caso
      do pensionista *)
   // Marchetti - Pendencia 26403
   if Sistema.TipoCliente <> 20071 then
   begin
      sSQL :=
      'SELECT '                                                                              + #13 +
      //Pendência 22810 - 17/01/2007 - Alberto - Padrão 14
      '  NVL( RSP.VALORRESERVA, 0) AS VALORRESERVA, '                                        + #13 +
      '  RSP.IDTIPORESERVA, RSP.IDPESSJUR, RSP.IDPLANOPREV, '                                + #13 +
      //Fim Pendência 22810
      '  RSP.IDPESSOA, '                                                                     + #13 +
      '  RSP.DATAREFERENCIASA, RSP.PERCENTUALSAQUE, '                                        + #13 +
      '  RXP.NOME, RXP.CODHIERARQUIA, RXP.INDICEREAJUSTE, RXP.IDBENEFICIO, '                 + #13 +
      '  MOE.MOESIGLA, '                                                                     + #13 +
      '  SIT.FLGINTERNO, '                                                                   + #13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREF, '            + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAINICIO, '         + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAINICIOPAGTO, '    + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREQUERIMENTO, '   + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREF, '            + #13 +

      //Pendência 22836 - 03/10/2006 - Alberto
      '  0' + IntToStr(Ord(bExcepcional))                       + ' AS FLGEXCEPCIONAL, '     + #13 +
      //Fim Pendência 22836

      '  1 AS SEQPROPOSTA, '                                                                 + #13 +
      '  1 AS CONTRESERVA, '                                                                 + #13 +
      '  1 AS ULTRESERVA, '                                                                  + #13 +
      '  0' + IntToStr(iLote)                                   + ' AS FLGLOTE, '            + #13 +

      '  PFI.DATANASC, NVL(PFI.NUMDEPIRRF,0) AS NUMDEPIRRF, '                                + #13 +
      '  PPP.INSCRICAODATA, PPP.IDSITPART, PPP.DATACANCELAMENTO, '                           + #13 +
      '  ELP.DATAADMISSAO, ELP.IDSITFUNC, ELP.SALTOTAL AS VALORPROVENTO, '                   + #13 +
      '  ELP.VALORBASE1, ELP.VALORBASE2, ELP.VALORBASE3 '                                    + #13 +

      'FROM '                                                                                + #13 +
      '  PESSOAFISICA  PFI, '                                                                + #13 +
      '  RESERVAXPLANO RXP, '                                                                + #13 +
      '  RESERVAPART   RSP, '                                                                + #13 +
      '  PARTPREVPLAN  PPP, '                                                                + #13 +
      '  ELEGPATRO     ELP, '                                                                + #13 +
      '  MOEDA         MOE, '                                                                + #13 +
      '  SITPART       SIT '                                                                 + #13 +

      'WHERE '                                                                               + #13 +
      '      ( RXP.ANALITICOSINTETI = ''A'' ) '                                              + #13 +
      '  AND ( RSP.IDPESSOA         = PFI.IDPESSOA ) '                                       + #13 +
      '  AND ( RXP.IDTIPORESERVA    = RSP.IDTIPORESERVA ) '                                  + #13 +

      //Pendência 22810 - 17/01/2007 - Alberto - Padrão 14
      '  AND ( RXP.IDPLANOPREV      = RSP.IDPLANOPREV ) '                                    + #13;
      if Sistema.TipoCliente <> 19981 then
        sSQL := sSQL +
        '  AND ( RSP.VALORRESERVA     <> 0 ) '                                               + #13;
      sSQL := sSQL +
      //Fim Pendência 22810

      '  AND ( RSP.IDPESSOA         = ' + IntToStr(iIdBenef) + ' ) '                         + #13 +
      '  AND ( RSP.IDPESSJUR        = ' + IntToStr(iIdPessJur) + ' ) '                       + #13 +
      '  AND ( RSP.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev) + ' ) '                     + #13 +
      '  AND ( ELP.IDPESSOA         = PPP.IDPESSOA ) '                                       + #13 +
      '  AND ( ELP.IDPESSJUR        = PPP.IDPESSJUR ) '                                      + #13 +
      '  AND ( RXP.INDICEREAJUSTE   = MOE.MOECODIGO(+) ) '                                   + #13 +
      '  AND ( PPP.IDSITPART        = SIT.IDSITPART ) '                                      + #13 +
      '  AND ( ELP.IDPESSOA         = RSP.IDPESSOA ) '                                       + #13 +
      '  AND ( ELP.IDPESSJUR        = RSP.IDPESSJUR ) '                                      + #13 +

      '  AND PPP.FLGDESATIVADO      = 0 '                                                    + #13;
   end
   else
   begin
      sSQL :=
      'SELECT'                                                                                  + #13 +
      '     NVL( RSP.VALORRESERVA, 0) AS VALORRESERVA,'                                         + #13 +
      '     RSP.IDTIPORESERVA, PPP.IDPESSJUR, PPP.IDPLANOPREV,'                                 + #13 +
      '     ELP.IDPESSOA,'                                                                      + #13 +
      '     RSP.DATAREFERENCIASA, RSP.PERCENTUALSAQUE,'                                         + #13 +
      '     RXP.NOME, RXP.CODHIERARQUIA, RXP.INDICEREAJUSTE, RXP.IDBENEFICIO,'                  + #13 +
      '     SIT.FLGINTERNO,'                                                                    + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREF, '               + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAINICIO, '            + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAINICIOPAGTO, '       + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREQUERIMENTO, '      + #13 +
      '  0' + IntToStr(Ord(bExcepcional))                       + ' AS FLGEXCEPCIONAL, '        + #13 +
      '  1 AS SEQPROPOSTA, '                                                                    + #13 +
      '  1 AS CONTRESERVA, '                                                                    + #13 +
      '  1 AS ULTRESERVA, '                                                                     + #13 +
      '  0' + IntToStr(iLote)                                   + ' AS FLGLOTE, '               + #13 +
      '    PFI.DATANASC, NVL(PFI.NUMDEPIRRF,0) AS NUMDEPIRRF,'                                  + #13 +
      '    PPP.INSCRICAODATA, PPP.IDSITPART, PPP.DATACANCELAMENTO,'                             + #13 +
      '    ELP.DATAADMISSAO, ELP.IDSITFUNC, ELP.SALTOTAL AS VALORPROVENTO,'                     + #13 +
      '    ELP.VALORBASE1, ELP.VALORBASE2, ELP.VALORBASE3'                                      + #13 +
      'FROM'                                                                                    + #13 +
      '    PESSOAFISICA PFI,'                                                                   + #13 +
      '    RESERVAXPLANO RXP,'                                                                  + #13 +
      '    RESERVAPART RSP,'                                                                    + #13 +
      '    PARTPREVPLAN PPP,'                                                                   + #13 +
      '    ELEGPATRO ELP,'                                                                      + #13 +
      '    SITPART SIT'                                                                         + #13 +
      'WHERE'                                                                                   + #13 +
      '    ( ELP.IDPESSOA       = PPP.IDPESSOA )'                                               + #13 +
      'AND ( ELP.IDPESSJUR      = PPP.IDPESSJUR )'                                              + #13 +
      'AND ( PPP.IDSITPART      = SIT.IDSITPART )'                                              + #13 +
      'AND ( PPP.FLGDESATIVADO  = 0 )'                                                          + #13 +
      'AND ( PPP.IDPLANOPREV    = ' + IntToStr(iIdPlanoPrev) + ' ) '                            + #13 +
      'AND ( PPP.IDPESSOA       = ' + IntToStr(iIdBenef) + ' ) '                                + #13 +
      'AND ( PPP.IDPESSJUR      =  ' + IntToStr(iIdPessJur) + ' ) '                             + #13 +
      'AND ( PFI.IDPESSOA       = PPP.IDPESSOA )'                                               + #13 +
      'AND ( RSP.IDPESSOA(+)    = PPP.IDPESSOA )'                                               + #13 +
      'AND ( RSP.IDPESSJUR(+)   = PPP.IDPESSJUR )'                                              + #13 +
      'AND ( RSP.IDPLANOPREV(+) = PPP.IDPLANOPREV )'                                            + #13 +
      'AND ( NVL(RSP.VALORRESERVA,0) = 0 OR NVL(RSP.VALORRESERVA,0) <> 0 )'                     + #13 +
      'AND ( RXP.IDTIPORESERVA(+) = RSP.IDTIPORESERVA )'                                        + #13 +
      'AND ( RXP.IDPLANOPREV(+)   = RSP.IDPLANOPREV )'                                          + #13 +
      'AND ( RXP.ANALITICOSINTETI IS NULL OR'                                                   + #13 +
      '      RXP.ANALITICOSINTETI = ''A'' )'                                                    + #13;
   end;
   // Fim Marchetti - Pendencia 26403

   if UtilizaRegraValor(iIdRegra, sSQL, 'e Reserva de Poupanca', sReserva, bMostraMsg) then
   begin
      if (sReserva <> '') and (sReserva <> 'NULO') then
      begin
         (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
         Result := StrToFloat(ConverteVirg(sReserva));
      end
      else
      begin
         Result := 0;
      end;
   end
   else
   begin
      Result := 0;
   end;
end;



(* Função que prepara e executa a regra de Taxa de Juros (antiga TaxaSWAP).
   Se Houver SWAP, a regra se encarrega de devolver a nova taxa *)
function TCalcEmptmo.BuscaTxJuros(const rContrato     : TDadosContrato;
                                  const iRegra        : Int64;
                                  const iParcela      : Integer;
                                  const dDataRef      : TDateTime;
                                  const fTxJurosAnt   : Currency;
                                  const fSldDevAnt    : Currency;
                                  const bMostraMsg    : Boolean;
                                  const iIndice       : Int64;
                                  const iEvento       : Integer = 0;
                                  const iOrigem       : Integer = 0;
                                  const iLote         : Integer = 0
                                  //Pendência 22836 - 03/10/2006 - Alberto
                                 ;const bExcepcional  : Boolean = false
                                  //Fim Pendência 22836
                                 ): Currency;
var
   sUF                        : String;
   iPais, iCidade, iEstado    : Int64;
   sSQLRegra, sResultadoRegra : String;
begin
   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
   iEstado  := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
   sUF      := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

   (* Prepara o SQL que vai ser passado para a Regra *)
   sSQLRegra :=
   'SELECT '                                                                                                + #13 +
   '  ' + NumeroIngles(fSldDevAnt)                                            + ' AS SALDODEVMESANT, '      + #13 +
   '  ' + NumeroIngles(fTxJurosAnt)                                           + ' AS TXJUROS, '             + #13 +
   ' 0' + IntToStr(rContrato.NumParcelas)                                     + ' AS NUMPARCELAS, '         + #13 +
   '  ' + IntToStr(iParcela)                                                  + ' AS PARCATUAL, '           + #13 +

   '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                               + ' AS IDTIPOCONTREMPTMO, '   + #13 +
   '  ' + QuotedStr(rContrato.SiglaIndexador)                                 + ' AS NOMEINDICE, '          + #13 +

   '  ' + IntToStr(iEvento)                                                   + ' AS HMETIPOMOV, '          + #13 +
   '  ' + IntToStr(iOrigem)                                                   + ' AS HMEORIGEM, '           + #13 +
   '  ' + IntToStr(iOrigem)                                                   + ' AS ORIGEM, '              + #13 +
   '  ' + IntToStr(iEvento)                                                   + ' AS EVENTO, '              + #13 +

   //Pendência 22836 - 03/10/2006 - Alberto
   '  0' + IntToStr(Ord(bExcepcional))                                        + ' AS FLGEXCEPCIONAL, '      + #13 +
   //Fim Pendência 22836

   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataRef))                   + ' AS DATAREF, '             + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))      + ' AS DATACREDITO, '         + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))   + ' AS DATAASSIN, '           + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))    + ' AS DATAINSC, '            + #13 +

   '  ' + IntToStr(iLote)                                                     + ' AS FLGLOTE, '             + #13 +

   '  ' + IntToStr(iPais)                                                     + ' AS IDPAIS, '              + #13 +
   '  ' + IntToStr(iCidade)                                                   + ' AS IDCIDADES, '           + #13 +
   '  ' + IntToStr(iEstado)                                                   + ' AS IDESTADO, '            + #13 +
   '  ' + QuotedStr(sUF)                                                      + ' AS CODESTADO '            + #13 +

   'FROM '                                                                                                  + #13 +
   '  DUAL';

   (* função que cria uma query e um objeto regra em tempo de execução,
      recebendo como parâmetro o SQL que será passado para a Regra, o número
      da regra, a mensagem de texto que será exibida caso haja erro e uma
      variável passada por referência que armazenará o Result da Regra.
      A função retornará se a Regra foi executada com êxito ou não. *)
   try
      if UtilizaRegraValor(iRegra, sSQLRegra, 'a Taxa de Juros', sResultadoRegra, bMostraMsg) then
      begin
         if (sResultadoRegra <> '') and (sResultadoRegra <> 'NULO') then
         begin
            (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
            Result := StrToFloat(ConverteVirg(sResultadoRegra))
         end
         else
         begin
            Result := 0;
         end;
      end
      else
      begin
         Result := 0;
      end;
   except
      Result := -1;
   end;
end;



// função que verifica para uma determinada parcela, se a parcela pode ser concedida ou não
function TCalcEmptmo.VerificaPrazoConcessao(iIdTitular, iIdBeneficiario, iNumParcela, iIdRegra: Int64
                                      //Pendência 22836 - 03/10/2006 - Alberto
                                     ;const bExcepcional : Boolean = false): Boolean;
                                      //Fim Pendência 22836
var
   sPrazoConc : String;
   sSQL       : String;
begin
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      sSQL :=
      'SELECT '                                                                           + #13 +
      '  ' + IntToStr(iIdBeneficiario)  + ' AS IDBENEF, '                                 + #13 +
      '  ' + IntToStr(iNumParcela)      + ' AS NUMPARCELAS, '                             + #13 +

      '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, '                                    + #13 +

      '  PPP.IDSITPLANOPREV, PPP.INSCRICAONUMERO, '                                       + #13 +
      '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, '                                          + #13 +
      '  PPP.SALPARTICIPACAO, PPP.SALMANTIDO, PPP.SALVINCULADO, '                         + #13 +
      '  PPP.FLGDEVEEMPRESTIMO, PPP.FLGDEVEASSISTENC, PPP.FLGDEVEPREVIDENC, '             + #13 +
      '  PPP.VALORINFINSS, PPP.DTINICIOINSC, PPP.SALPARTIC13, '                           + #13 +

      '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.IDDEPENDENCIA, '         + #13 +
      '  BEN.IDRESPONSAVEL, BEN.CODTIPORECEBEDOR, BEN.DATAFIMRECEB, '                     + #13 +

      // André Pontes - 24/04/2006 - pendência 21945: foi só o "NVL"
      '  NVL(BEN.DATANASC, PFI.DATANASC) AS DATANASC , '                                  + #13 +
      // FIM André Pontes - 24/04/2006 - pendência 21945

      '  BEN.NOMERESPONSAVEL, '                                                           + #13 +

      //Pendência 22836 - 03/10/2006 - Alberto
      '  0' + IntToStr(Ord(bExcepcional)) + ' AS FLGEXCEPCIONAL, '                          + #13 +
      //Fim Pendência 22836

      '  PFI.FLGBLOQUEIO, '                                                               + #13;

      if iIdTitular <> iIdBeneficiario then
      begin
         (* Beneficiário diferente do Titular *)
         sSQL := sSQL + QuotedStr('B') + ' AS FLGTIPOBEN '                                + #13;
      end
      else
      begin
         (* Beneficiário é o próprio Titular *)
         sSQL := sSQL + QuotedStr('T') + ' AS FLGTIPOBEN '                                + #13;
      end;

      sSQL := sSQL +
      'FROM '                                                                 + #13 +
      '  PESSOAFISICA PFI, '                                                  + #13 +
      '  PARTPREVPLAN PPP, '                                                  + #13 +
      '  ( '                                                                  + #13 +
      '  SELECT '                                                             + #13 +
      '     BFC.IDTITULAR, BFC.IDPESSOA, BFC.IDBENEFICIO, '                   + #13 +
      '     BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.IDDEPENDENCIA, '           + #13 +
      '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, BTP.CODTIPORECEBEDOR, '      + #13 +
      '     BTP.DATAFIMRECEB, PFI.DATANASC, '                                 + #13 +
      '     PES.NOME AS NOMERESPONSAVEL '                                     + #13 +
      '  FROM '                                                               + #13 +
      '     BENEFBFCIARIO   BFC, '                                            + #13 +
      '     BFCIARIOTITPLAN BTP, '                                            + #13 +
      '     PESSOAFISICA    PFI, '                                            + #13 +
      '     PESSOA          PES  '                                            + #13 +
      '  WHERE '                                                              + #13 +
      '         IDSITBENEFICIO     IN (1, 2, 7) '                             + #13 +
      '     AND BFC.IDTITULAR      = ' + IntToStr(iIdTitular)                 + #13 +
      '     AND BFC.IDPESSOA       = ' + IntToStr(iIdBeneficiario)            + #13 +
      '     AND BFC.IDTITULAR      = BTP.IDTITULAR '                          + #13 +
      '     AND BFC.IDBENEFICIO    = BTP.IDBENEFICIO '                        + #13 +
      '     AND BFC.IDPESSOA       = PFI.IDPESSOA '                           + #13 +
      '     AND BTP.IDRESPONNAOREC = PES.IDPESSOA(+)'                         + #13 +
      '     AND BFC.IDPLANOPREV    = BTP.IDPLANOPREV ';

      if iIdTitular <> iIdBeneficiario then
      begin
         (* Beneficiário diferente do Titular *)
         sSQL := sSQL +
         '  AND ( DATAFINAL IS NULL    OR  '+
         '        DATAFINAL > TO_DATE' +
         '        (' + QuotedStr(DateToStr(Sysdate)) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
         '      ) ';
      end;

      sSQL := sSQL +
      '  ) BEN '                                                                 + #13 +
      'WHERE '                                                                   + #13 +
      '      ( PPP.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '              + #13 +
      '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA ) '                              + #13 +
      '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                          + #13 +

      '  AND PPP.FLGDESATIVADO   = 0 '                                           + #13;

   end
   else
   begin
      sSQL := 'SELECT ' + IntToStr(iNumParcela) + ' AS PRAZO FROM DUAL';
   end;

   UtilizaRegraBool(iIdRegra, sSQL, 'e Prazo de Concessão', sPrazoConc, True);

   if UpperCase(sPrazoConc) = 'TRUE' then
   begin
      Result := True
   end
   else
   begin
      Result := False;
   end;
end;



// função que verifica se o participante atende a regra de Elegibilidade
//Pendências 23311 e 23312 - 25/09/2006 - Alberto
function TCalcEmptmo.VerificaElegibilidade(const iIdTitular, iIdBeneficiario,
                                                 iIdRegra, iIdPlanoPrev      : Int64;
                                                 iMesesRenovacao, iParcPagas           : Integer;
                                           var   dDataFinal                            : TDateTime;
                                           const bMostraMsg                            : Boolean
                                           //Pendência 22836 - 03/10/2006 - Alberto
                                          ;const bExcepcional : Boolean = false
                                           //Fim Pendência 22836
                                          ): Boolean;

var
   sSQL           : String;
   sElegibilidade : String;
   sParticipante  : String;
   qryAux         : TwwQuery;

   // Marchetti - Pendencia 19182
   sSitDependente : String;

   //David - 23/08/05
   iIdCBancaria : integer;

   //Pendência 23312 - 20/09/2006 - Alberto
   iIdPlanoPrevContab  : integer;
   //Fim Pendência 23312

   iTotContratosAtivos : Integer;   
begin
   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   iTotContratosAtivos  := 0;   

   try

      // Marchetti - Pendencia 27160
      if Sistema.TipoCliente = 20071 then
      begin
         sSQL :=
         'SELECT'                                                      + #13 +
         '    COUNT(CON.IDCONTRATOEMPTMO) AS TOTCONTRATIVOS'           + #13 +
         'FROM'                                                        + #13 +
         '    CONTRATOXAVALISTA CA,'                                   + #13 +
         '    CONTRATOEMPTMO CON,'                                     + #13 +
         '    INSCRICAOEMPTMO INS'                                     + #13 +
         'WHERE'                                                       + #13 +
         '    CA.IDAVALISTA         = ' + IntToStr(iIdBeneficiario)    + #13 +
         'AND CA.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO'           + #13 +
         'AND INS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO'           + #13 +
         'AND CON.FLGSITUACAO       NOT IN (''C'',''Q'')'              + #13;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         iTotContratosAtivos := qryAux.FieldByName('TOTCONTRATIVOS').AsInteger;
      end;
      // Fim Marchetti - Pendencia 27160

      // -------------------------------------------------------------------------------------------
      // Marchetti - Pendencia 19182
      sSQL :=
      'SELECT NVL(IDSITDEPENDENTE, ''0'') AS IDSITDEPENDENTE ' + #13 +
      'FROM   DEPENDENTE '                                     + #13 +
      'WHERE  IDPESSOA = ' + IntToStr(iIdBeneficiario)         + #13;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      sSitDependente := '0';
      if not(qryAux.IsEmpty) then
      begin
         sSitDependente := qryAux.FieldByName('IDSITDEPENDENTE').AsString;
      end;
      // Fim Marchetti - Pendencia 19182
      // -------------------------------------------------------------------------------------------



      // -------------------------------------------------------------------------------------------
      //David - 23/08/05
      //Recupera conta bancária (ordenada para pegar a preferencial ou qualquer outra, se não houver preferencial)
      sSQL :=
      'SELECT   IDCBANCARIA '                            + #13 +
      'FROM     CONTABANCARIA '                          + #13 +
      'WHERE    IDPESSOA = ' + IntToStr(iIdBeneficiario) + #13 +
      'ORDER BY NVL( FLGCONTAPREF, -1 ) DESC             ' ;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      iIdCBancaria := 0;
      if not(qryAux.IsEmpty) then
      begin
         iIdCBancaria := qryAux.FieldByName('IDCBANCARIA').AsInteger;
      end;
      // Fim - David - 23/08/05
      // -------------------------------------------------------------------------------------------

      //Pendência 23312 - 20/09/2006 - Alberto
      iIdPlanoPrevContab := IntegraEmptmo.AcertaPlanoOrigem(-1,
                                                            iIdBeneficiario,
                                                            iIdPlanoPrev,
                                                            False);

      if iIdPlanoPrevContab <= 0 then
        iIdPlanoPrevContab := iIdPlanoPrev;
      //Fim Pendência 23312

      sSQL :=
      'SELECT '                                                                     + #13 +
      '  ' + IntToStr(iIdBeneficiario)            + ' AS IDBENEF, '                 + #13 +
      '  ' + IntToStr(iIdTitular)                 + ' AS IDTITULAR, '               + #13 +
      '  ' + IntToStr(iIdBeneficiario)            + ' AS IDPESSOA, '                + #13 +
      '  ' + IntToStr(iMesesRenovacao)            + ' AS MESESRENOVACAO, '          + #13 +
      '  ' + IntToStr(iParcPagas)                 + ' AS PARCPAGAS, '               + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',SysDate)) + ' AS DATAREF, '                 + #13 + //Renato Visoni SOL152867 Kintana 1145739
      ' 0' + IntToStr(iTotContratosAtivos)        + ' AS TOTCONTRATIVOS, '          + #13 +

      // Marchetti - Pendencia 19182
      '  ' + sSitDependente                       + ' AS IDSITDEPENDENTE, '         + #13 +
      // Fim Marchetti - Pendencia 19182

      //David - 23/08/05
      '  ' + IntToStr(iIdCBancaria)               + ' AS IDCBANCARIA, '             + #13 +
      //Fim - David - 23/08/05

      //Pendência 23312 - 20/09/2006 - Alberto
      '  ' + IntToStr(iIdPlanoPrev)               + ' AS IDPLANOPREV, '             + #13 +
      '  ' + IntToStr(iIdPlanoPrevContab)         + ' AS IDPLANOPREVCONTAB, '       + #13 +
      //Fim Pendência 23312

      //Pendência 22836 - 03/10/2006 - Alberto
      '  0' + IntToStr(Ord(bExcepcional))         + ' AS FLGEXCEPCIONAL, '          + #13 +
      //Fim Pendência 22836

      '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, ELP.IDSITFUNC,'                + #13 +

      '  PPP.IDSITPLANOPREV, PPP.INSCRICAONUMERO, ELP.DATAADMISSAO, '               + #13 +
      '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, '                                    + #13 +
      '  PPP.SALPARTICIPACAO, PPP.SALMANTIDO, PPP.SALVINCULADO, '                   + #13 +
      '  PPP.FLGDEVEEMPRESTIMO, PPP.FLGDEVEASSISTENC, PPP.FLGDEVEPREVIDENC, '       + #13 +
      '  PPP.VALORINFINSS, PPP.DTINICIOINSC, PPP.SALPARTIC13, '                     + #13 +

      '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.IDDEPENDENCIA, '   + #13 +
      '  BEN.IDRESPONSAVEL, BEN.CODTIPORECEBEDOR, BEN.DATAFIMRECEB, '               + #13 +
      '  BEN.NOMERESPONSAVEL, '                                                     + #13 +
      '  SIT.FLGINTERNO, SIT.DESCRICAO, '                                           + #13 +
      '  PFI.FLGBLOQUEIO, '                                                         + #13 +      

      //David - 19/08/05
      '  ''0'' as FLGAUTOATEND, '                                                   + #13 ;

      if iIdTitular <> iIdBeneficiario then
      begin
         // Beneficiário diferente do Titular
         sParticipante := 'Beneficiário ';
         sSQL := sSQL + QuotedStr('B') + ' AS FLGTIPOBEN '                          + #13;
      end
      else
      begin
         // Beneficiário é o próprio Titular
         sParticipante := 'Participante ';
         sSQL := sSQL + QuotedStr('T') + ' AS FLGTIPOBEN '                          + #13;
      end;

      sSQL := sSQL +
      'FROM '                                                                       + #13 +
      '  PESSOAFISICA PFI, '                                                        + #13 +
      '  ELEGPATRO    ELP, '                                                        + #13 +
      '  SITPART      SIT, '                                                        + #13 +
      '  PARTPREVPLAN PPP, '                                                        + #13 +

      '  ( '                                                                        + #13 +
      '  SELECT '                                                                   + #13 +
      '     BFC.IDTITULAR, BFC.IDPESSOA, BFC.IDBENEFICIO, '                         + #13 +
      '     BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.IDDEPENDENCIA, '                 + #13 +
      '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, '                                  + #13 +
      '     BTP.CODTIPORECEBEDOR, BTP.DATAFIMRECEB, '                               + #13 +
      '     PES.NOME AS NOMERESPONSAVEL '                                           + #13 +
      '     ,BFC.IDPLANOPREV '                                                      + #13 +//Renato Visoni SOL152867 Kintana 1145739
      '  FROM '                                                                     + #13 +
      '     BENEFBFCIARIO   BFC, '                                                  + #13 +
      '     BFCIARIOTITPLAN BTP, '                                                  + #13 +
      '     PESSOA          PES  '                                                  + #13 +
      '  WHERE '                                                                    + #13 +
      //Renato Visoni SOL 119973 Kintana 573499
      //'   IDSITBENEFICIO     IN (1, 2, 7) '                                       + #13 +
      '     IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO)'                      + #13 +
      '   FROM '                                                                    + #13 +
      '     BENEFBFCIARIO SB1 WHERE BFC.IDPESSOA = SB1.IDPESSOA AND BFC.IDTITULAR = SB1.IDTITULAR AND SB1.IDSITBENEFICIO IN (1, 2, 7)) '+ #13 +  //Jéssica Lana 124189
      //Renato Visoni SOL 119973 Kintana 573499
      '     AND BFC.IDTITULAR      = ' + IntToStr(iIdTitular)                       + #13 +
      '     AND BFC.IDPESSOA       = ' + IntToStr(iIdBeneficiario)                  + #13 +
      '     AND BFC.FONTEPAGADORA  = 1 '                                            + #13 +  //Renato Visoni SOL152867 Kintana 1145739
      '     AND BFC.IDPESSOA       = BTP.IDPESSOA  '                                + #13 +  //Jéssica Lana 124189
      '     AND BFC.IDTITULAR      = BTP.IDTITULAR '                                + #13 +
      '     AND BFC.IDBENEFICIO    = BTP.IDBENEFICIO '                              + #13 +
      '     AND BTP.IDRESPONNAOREC = PES.IDPESSOA(+) '                              + #13 +
      '     AND BFC.IDPLANOPREV    = BTP.IDPLANOPREV ';

      if iIdTitular <> iIdBeneficiario then
      begin
         // Beneficiário diferente do Titular
         sSQL := sSQL +
         '  AND ( DATAFINAL IS NULL    OR  '+
         '        DATAFINAL > TO_DATE' +
         '        (' + QuotedStr(DateToStr(Sysdate)) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
         '      ) ';
      end;

      sSQL := sSQL +
      '  ) BEN '                                                                 + #13 +
      'WHERE '                                                                   + #13 +
      '      ( PPP.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '              + #13 +
      '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA ) '                              + #13 +
      '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                              + #13 +
      '  AND ( ELP.IDPESSJUR     = PPP.IDPESSJUR ) '                             + #13 +
      '  AND ( SIT.IDSITPART     = PPP.IDSITPART ) '                             + #13 +
      '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                          + #13 +

      //BRUNO AZEVEDO SOL 152094 KINTANA 1126686
      //'  AND PPP.IDPLANOPREV     = ' + IntToStr(iIdPlanoPrev)                    + #13 ;
//      '  AND NVL(BEN.IDPLANOPREV,PPP.IDPLANOPREV)  = ' + IntToStr(iIdPlanoPrev)    + #13 + //Renato Visoni SOL152867 Kintana 1145739
      //'  AND PPP.FLGDESATIVADO   = 0 '                                           + #13 ;
      //BRUNO AZEVEDO SOL 152094 KINTANA 1126686

        //Renan Cristiano SOL 156238 KINTANA 1225026 Inicio
        '  AND CASE '                                                               + #13 +
        '      WHEN BEN.IDPESSOA <> BEN.IDTITULAR THEN '                            + #13 +
        '         BEN.IDPLANOPREV '                                                 + #13 +
        '      ELSE '                                                               + #13 +
        '         DECODE(BEN.IDSITBENEFICIO, 1, BEN.IDPLANOPREV, PPP.IDPLANOPREV) ' + #13 +
        '  END = ' + IntToStr(iIdPlanoPrev)                                         + #13 +

        '  AND CASE '                                                               + #13 +
        '         WHEN BEN.IDPESSOA <> BEN.IDTITULAR THEN PPP.IDPLANOPREV '         + #13 +
        '         ELSE NVL(BEN.IDPLANOPREV,PPP.IDPLANOPREV) '                       + #13 +
        '      END = PPP.IDPLANOPREV '                                              + #13 +
        //Renan Cristiano SOL 156238 KINTANA 1225026 Fim

       ' ORDER BY FLGINTERNO ASC, INSCRICAODATA ASC '                             + #13 ; //Fanuel Junior SOL153604 Kintana 1161039
      //BRUNO AZEVEDO SOL 154142 KINTANA 1171213

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      if qryAux.IsEmpty then
      begin
         Result := False;
         if bMostraMsg then MsgDlg(sParticipante + 'NÃO atende a Regra de Elegibilidade.', 'Empréstimo', mtWarning, [mbOk], 0);
         qryAux.Close;
         Exit;
      end;

      // variável que é passada como referência que retornará Data Final do Benefício
      dDataFinal := qryAux.FieldByName('DATAFINAL').AsDateTime;

      if not(UtilizaRegraBool(iIdRegra, sSQL, 'e Elegibilidade', sElegibilidade, bMostraMsg)) then
      begin
         Result := False;
         if bMostraMsg then MsgDlg('ERRO na regra de Elegibilidade.', 'Empréstimo', mtError, [mbOk], 0);
         Exit;
      end;

      if UpperCase(sElegibilidade) = 'TRUE' then
      begin
         Result := True;
      end
      else
      begin
         Result := False;
         if bMostraMsg then MsgDlg(sParticipante + 'NÃO atende a Regra de Elegibilidade.', 'Empréstimo', mtWarning, [mbOk], 0);
      end;

   finally
      qryAux.Free;
   end;
end;


//Pendência 26775 - 26/12/2007
function TCalcEmptmo.IdentificaPlanoCobranca(iIDPessoa,
                                             iIDPLanoPrev,
                                             iIdRegra : Int64;
                                             const bMostraMsg : Boolean) : Int64;
var
   qryAux : TwwQuery;
   sSQL   : String;
   sValor : String;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSQL :=
      'select PPP.IDPESSOA, '       +
            ' PPP.IDPESSJUR, '      +
            ' PPP.IDPLANOPREV, '    +
            ' PPP.IDSITPART, '      +
            ' PPP.IDSITPLANOPREV, ' +
            ' STP.FLGINTERNO, '     +
            ' PPP.FLGDESATIVADO, '  +
            ' PPP.INSCRICAODATA '   +
       ' from PARTPREVPLAN PPP, '   +
            ' SITPART STP '         +
      ' where PPP.IDPESSOA = ' + IntToStr( iIDPessoa ) +
      ' and   STP.IDSITPART = PPP.IDSITPART '          +
      ' order by PPP.INSCRICAODATA ';

      if not UtilizaRegraValor(iIdRegra, sSQL, 'e Plano de Cobrança', sValor, bMostraMsg) then
      begin
         Result := -1;
         if bMostraMsg then MsgDlg('ERRO na regra de Plano de Cobrança.', 'Empréstimo', mtError, [mbOk], 0);
         Exit;
      end;

      if (sValor = 'NULO') then
         Result := -1
      else
         Result := StrToInt(sValor);

   finally
      qryAux.Free;
   end;

end;
//Fim Pendência 26775


function TCalcEmptmo.BuscaLimites(const rContrato                       : TDadosContrato;
                                  const iOrigem                         : Integer;
                                  const iIdSitPart, iIdRegra            : Int64;
                                  const dDataFinalBeneficio             : TDateTime;
                                  const fMargem, fReserva, fSaldoEPAnt  : Currency;
                                  const fParcelas, fPendencias          : Currency;
                                  const dDataSolic                      : TDateTime;
                                  const fVlrLiquidoEP                   : Currency;
                                  const bMostraMsg                      : Boolean;
                                  const fVlrSalBase                     : Currency = 0
                                  //Pendência 22836 - 03/10/2006 - Alberto
                                 ;const bExcepcional                    : Boolean = false
                                  //Fim Pendência 22836
                                 ): Boolean;
var
   qryAux         : TwwQuery;
   sSQL           : String;
   sLimite        : String;
   sDataCredito   : String;
   iNumParcelas   : Integer;
   iNumParcPagas  : Integer;
   iParcAtual     : Integer;
begin
   // função que verifica se o participante atende Limites de concessão
   //   e limites de Quantidade e Prazos do Contrato/Empréstimo

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'SELECT '                                                            + #13 +
   '  COUNT(*) AS TOTCONTRATIVOS '                                      + #13 +
   'FROM '                                                              + #13 +
   '  CONTRATOEMPTMO '                                                  + #13 +
   'WHERE '                                                             + #13 +
   '      ( FLGSITUACAO  NOT IN (''C'', ''Q'') ) '                      + #13 +
   '  AND ( IDPESSOA     = ' + IntToStr(rContrato.IDPessoa) + ' ) '     + #13 +
   '  AND ( IDBENEF      = ' + IntToStr(rContrato.IDBenef)  + ' ) ';

   qryAux.SQL.Text := sSQL;
   qryAux.open;

   try
      try
         // Verifico qual a quantidade total de contratos ATIVOS do participante
         //    caso ele não tenha nenhum, logo ele pode fazer a inscrição e
         //    não há necessidade de executar a regra
         if qryAux.FieldByName('TOTCONTRATIVOS').AsInteger <= 0 then
         begin
            Result := True;
            Exit;
         end;

         qryAux.Open;

         //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Início
         sSQL :=
                   'SELECT                                                                               ' + #13 +
                   '  CON.IDCONTRATOEMPTMO,                                                              ' + #13 +
                   '  CON.DATACREDITO,                                                                   ' + #13 +
                   '  CON.NUMPARCELAS,                                                                   ' + #13 +
                   '  PCK_EMPRESTIMO.FN_QUANTPARCELASPAGAS(CON.IDCONTRATOEMPTMO) NUMPARCPAGAS,           ' + #13 +
                   '  PCK_EMPRESTIMO.FN_ULTIMAPRESTACAO(CON.IDCONTRATOEMPTMO) HMEPARCELA                 ' + #13 +
                   'FROM CONTRATOEMPTMO CON                                                              ' + #13 +
                   'INNER JOIN TIPOCONTREMPTMO TIP ON CON.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO     ' + #13 +
                   'WHERE ( CON.IDPESSOA           = ' + IntToStr(rContrato.IDPessoa) + ')               ' + #13 +
                   '      AND ( CON.IDBENEF            = ' + IntToStr(rContrato.IDBenef) + ')            ' + #13 +
                   '      AND ( TIP.IDTIPOEMPTMO       = ' + IntToStr(rContrato.IDTipoEmptmo) + ')       ' + #13 +
                   '      AND ( CON.FLGSITUACAO        NOT IN (''C'',''Q'') )';
(*

         sSQL :=
         'SELECT '                                                                        + #13 +
         '  CNT.IDCONTRATOEMPTMO, '                                                       + #13 +
         '  CNT.DATACREDITO, '                                                            + #13 +
         '  CNT.NUMPARCELAS, '                                                            + #13 +
         '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS, '                                      + #13 +
         '  MAX.HMEPARCELA '                                                              + #13 +

         'FROM '                                                                          + #13 +
         '  CONTRATOEMPTMO  CNT, '                                                        + #13 +
         '  TIPOCONTREMPTMO TIP, '                                                        + #13 +

         '  ( '                                                                           + #13 +
         '  SELECT '                                                                      + #13 +
         '     H.IDCONTRATOEMPTMO, '                                                      + #13 +
         '     MAX(H.HMEPARCELA) AS HMEPARCELA '                                          + #13 +
         '  FROM '                                                                        + #13 +
         '     HISTMOVEMPTMO  H, '                                                        + #13 +
         '     CONTRATOEMPTMO C '                                                         + #13 +
         '  WHERE '                                                                       + #13 +
         '         ( C.IDPESSOA         = ' + IntToStr(rContrato.IDPessoa) + ' ) '        + #13 +
         '     AND ( C.IDBENEF          = ' + IntToStr(rContrato.IDBenef) + ' ) '         + #13 +
         '     AND ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 ) '                     + #13 +
         '     AND ( H.FLGESTORNADO IS NULL OR H.FLGESTORNADO = 0 ) '                     + #13 +
         '     AND ( H.FLGABONADO   IS NULL OR H.FLGABONADO   = 0 ) '                     + #13 +
         '     AND ( H.HMETIPOMOV = 1 )  '                                                + #13 +
         '     AND ( C.FLGSITUACAO      NOT IN (''C'',''Q'') ) '                          + #13 +
         '     AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) '                          + #13 +
         '  GROUP BY '                                                                    + #13 +
         '     H.IDCONTRATOEMPTMO '                                                       + #13 +
         '  ) MAX, '                                                                      + #13 +

         '  ( '                                                                           + #13 +
         '  SELECT '                                                                      + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA, '                                        + #13 +
         '     SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - '        +
              'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL '                          + #13 +
         '  FROM '                                                                        + #13 +
         '     HISTMOVEMPTMO H, '                                                         + #13 +
         '     CONTRATOEMPTMO C '                                                         + #13 +
         '  WHERE '                                                                       + #13 +
         '         ( C.IDPESSOA         = ' + IntToStr(rContrato.IDPessoa) + ' ) '        + #13 +
         '     AND ( C.IDBENEF          = ' + IntToStr(rContrato.IDBenef) + ' ) '         + #13 +
         '     AND ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 ) '                     + #13 +
         '     AND ( H.FLGESTORNADO IS NULL OR H.FLGESTORNADO = 0 ) '                     + #13 +
         '     AND ( H.FLGABONADO IS NULL OR H.FLGABONADO = 0 )  '                        + #13 +
         '     AND ( H.HMETIPOMOV = 1 )  '                                                + #13 +
         '     AND ( C.FLGSITUACAO      NOT IN (''C'',''Q'') ) '                          + #13 +
         '     AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) '                          + #13 +
         '  GROUP BY '                                                                    + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA '                                         + #13 +
         '  HAVING '                                                                      + #13 +
         '         ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - '    +
                    'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) = 0 ) '                       + #13 +
         '     AND ( H.HMEPARCELA <> 0 ) '                                                + #13 +
         '  ) PAG '                                                                       + #13 +

         'WHERE '                                                                         + #13 +
         '      ( CNT.IDPESSOA           = ' + IntToStr(rContrato.IDPessoa) + ' ) '       + #13 +
         '  AND ( CNT.IDBENEF            = ' + IntToStr(rContrato.IDBenef) + ' ) '        + #13 +
         '  AND ( TIP.IDTIPOEMPTMO       = ' + IntToStr(rContrato.IDTipoEmptmo) + ' ) '   + #13 +
         '  AND ( CNT.FLGSITUACAO        NOT IN (''C'',''Q'') ) '                         + #13 +
         '  AND ( CNT.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) ) '                    + #13 +
         '  AND ( CNT.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO(+) ) '                    + #13 +
         '  AND ( CNT.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                      + #13 +

         'GROUP BY '                                                                      + #13 +
         '  CNT.IDCONTRATOEMPTMO, CNT.DATACREDITO, CNT.NUMPARCELAS, MAX.HMEPARCELA ';
*)
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         // se a query estiver vazia, passa os valores zerados
         if qryAux.isEmpty then
         begin
            iNumParcPagas  := 0;
            iNumParcelas   := 0;
            sDataCredito   := 'NULL';
         end
         else
         begin
            if qryAux.FieldByName('NUMPARCPAGAS').IsNull then
            begin
               iNumParcPagas := 0;
            end
            else
            begin
               iNumParcPagas := qryAux.FieldByName('NUMPARCPAGAS').AsInteger;
            end;

            if qryAux.FieldByName('NUMPARCELAS').IsNull then
            begin
               iNumParcelas := 0;
            end
            else
            begin
               iNumParcelas := qryAux.FieldByName('NUMPARCELAS').AsInteger;
            end;

            if qryAux.FieldByName('DATACREDITO').IsNull then
            begin
               sDataCredito := 'NULL';
            end
            else
            begin
               sDataCredito := FormatDateTime('DD/MM/YYYY', qryAux.FieldByName('DATACREDITO').AsDateTime);
            end;

            if qryAux.FieldByName('HMEPARCELA').IsNull then
            begin
               iParcAtual  := 0;
            end
            else
            begin
               iParcAtual  := qryAux.FieldByName('HMEPARCELA').AsInteger;
            end;

         end;  // if qryAux.isEmpty

         sSQL :=
         'SELECT ' +
         ' ' + IntToStr(rContrato.IDPessoa)              + ' AS IDPESSOA, '         + #13 +
         ' ' + IntToStr(rContrato.IDBenef)               + ' AS IDBENEF, '          + #13 +
         ' ' + IntToStr(rContrato.IDTipoContrEmptmo)     + ' AS IDTIPOCONTREMPTMO,' + #13 +
         ' ' + IntToStr(rContrato.IDTipoEmptmo)          + ' AS IDTIPOEMPTMO,'      + #13 +
         ' ' + IntToStr(iOrigem)                         + ' AS HMEORIGEM,'         + #13 +
         ' ' + IntToStr(iIdSitPart)                      + ' AS IDSITPART,'         + #13 +
         ' ' + NumeroIngles(fMargem)                     + ' AS MARGEM,'            + #13 +
         ' ' + NumeroIngles(fReserva)                    + ' AS RESERVA,'           + #13 +
         ' ' + NumeroIngles(rContrato.VlrContrato)       + ' AS VALORSOLIC,'        + #13 +
         ' ' + NumeroIngles(rContrato.VlrParcela)        + ' AS VALPARCCALC,'       + #13 +
         ' ' + IntToStr(rContrato.NumParcelas)           + ' AS PRAZO,'             + #13 +
         ' ' + NumeroIngles(fSaldoEPAnt)                 + ' AS SALDOEPANT,'        + #13 +
         ' ' + NumeroIngles(fParcelas)                   + ' AS VLRPARCELAS, '      + #13 +
         ' ' + NumeroIngles(fPendencias)                 + ' AS VLRPENDENCIAS, '    + #13 +
         ' ' + IntToStr(iNumParcPagas)                   + ' AS NUMPARCPAGAS,'      + #13 +
         ' ' + IntToStr(iParcAtual)                      + ' AS PARCATUAL, '        + #13 +
         ' ' + IntToStr(iNumParcelas)                    + ' AS PRAZOANT, '         + #13 +
         ' ' + QuotedStr(DateToStr(dDataSolic))          + ' AS DATASOLIC, '        + #13 +
         ' ' + QuotedStr(DateToStr(dDataFinalBeneficio)) + ' AS DATAFINAL, '        + #13 +
         ' ' + NumeroIngles(fVlrLiquidoEP)               + ' AS VLRLIQUIDO, '       + #13 +
         ' ' + QuotedStr(sDataCredito)                   + ' AS DTCREDITOANT, '     + #13 +
         //Pendência 22836 - 03/10/2006 - Alberto
         ' 0' + IntToStr(Ord(bExcepcional))              + ' AS FLGEXCEPCIONAL, '   + #13 +
         //Fim Pendência 22836
         ' ' + NumeroIngles(fVlrSalBase)                 + ' AS SALARIOBASE '       + #13 +
         ' FROM DUAL';

         (* função que cria uma query e um objeto regra em tempo de execução,
            recebendo como parâmetro o SQL que será passado para a Regra, o número
            da regra, a mensagem de texto que será exibida caso haja erro e uma
            variável passada por referência que armazenará o Result da Regra.
            A função retornará se a Regra foi executada com êxito ou não. *)
         //Pendência 24595 - 05/03/2007 - Alberto
         UtilizaRegraBool(iIdRegra, sSQL, 'e Limites', sLimite, bMostraMsg);
         //Fim Pendência 24595

         Result := False;
         if UpperCase(sLimite) = 'TRUE' then Result := True;

      except
         if bMostraMsg then MsgDlg('Ocorreu um erro na Busca de Limites', 'Empréstimo', mtError, [mbOk], 0);
         Result := False;
      end;
   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.CalculaItens(const rContrato           : TDadosContrato;
                                  const rConcessao          : TDadosConcessao;
                                  const iEvento             : Integer;
                                  const iOrigem             : Integer;
                                  const iPais               : Integer;
                                  const sEstado             : String;
                                  const iCidade             : Integer;
                                  const iParcela            : Integer;
                                  const iIdSitPart          : Int64;
                                  const sFormaCobranca      : String;
                                  const fTxJuros, fSaldoDev, fVlrSolic, fSaldoEPAnt, fMargem,
                                        fReserva, fSalPart, fSalMantido, fSalAuxDoenca,
                                        fSalBenef, fSalarioBase, fVlrMaxPermit : Currency;
                                  const iNumParcPagas       : Integer;
                                  const iPrazoAnterior      : Integer;
                                  const iUltParcelaGerada   : Integer;
                                  const dDataRef            : TDateTime;
                                  const dDataAtualiza       : TDateTime;
                                  const sAnoMesCompetencia  : String;
                                  const bInterrompe         : Boolean;
                                  const bMostraMsg          : Boolean;
                                  const bMostraProgresso    : Boolean;
                                  var   vLista              : TListaItem;
                                  const fVlrDevolSeguro     : Currency = 0;
                                  const fVlrSegAnt          : Currency = 0;                              
                                  const fVlrSegComplAnt     : Currency = 0;
                                  const bAlteraSaldoDev     : Boolean = True;
                                  const fVlrContratosAnt    : Currency = 0;
                                  const fVlrDividas         : Currency = 0;
                                  const iTipoContrQuitAnt   : Integer = -1;
                                  const bCriaObjetoRegra    : Boolean = False;
                                  const dDataAtraso         : TDateTime = 0;
                                  const fValorEmAberto      : Currency = 0;
                                  const dDataAtrasoAnt      : TDateTime = 0;
                                  const fValorEmAbertoAnt   : Currency = 0;
                                  const fValorProvisao      : Currency = 0;
                                  const bGravaQueryRegra    : Boolean = True;
                                  const iFinanciamento      : Integer = 0;
                                  const bExcepcional        : Boolean = false;
                                  // SOL:108099 Daniel Begnami
                                  const pQtdeParcSusp       : integer = 0;
                                  const pIDTipoSuspEmptmo     : integer = -1;
                                  const QryDados            : TwwQuery = nil; //Renato Visoni SOL 124858 KINTANA 638072
                                  const DataCredito         : TDateTime = 0;  //Renato Visoni SOL 124858 KINTANA 638072
                                  const Parcelas            : String = '-1'  //Jéssica Lana  SOL 127055
                                  ;const bVLRLIQZERO     : Boolean = false  // Monica Gonzaga SOL: 156456 Kintana: 1234816
                                  // FIM
                                  ;const iQtde_Parcelas_Geradas : integer = 0; //Leandro WO17072
                                  const iCarencia           : integer = 0;     //Leandro WO17072
                                  const fSaldoDevAtu        : Currency = 0;    //Leandro WO17072
                                  const fVlrParcela         : Currency = 0     //Leandro WO17072

                                 ): Boolean;
var
   vSQL                    : array of String;
   i, j                    : Integer;
   sSQL, sSQLExec, sValor  : String;
   fNovoSaldoDev           : Currency;
   qryAux                  : TwwQuery;
   sFlgInterno             : String;

   rSaldoDevAtu            : TSaldoDevAnt;

   // Marchetti - Pendencia 19196
   sDataNasc               : String;
   // Fim Marchetti - Pendencia 19196

   //Renato Visoni SOL 124858 KINTANA 638072
   sSQLaux,sSQLaux1        : String;
   qrySaldoDev             : TwwQuery;
   qryLog                  : TwwQuery;
   iItem                   : Integer ;
   //Renato Visoni SOL 124858 KINTANA 638072

   //BRUNO AZEVEDO SOL 176064 KINTANA 1604085
   qryValorSolicAnt: TwwQuery;
   fValorSolicAnt: Extended;
   //BRUNO AZEVEDO SOL 176064 KINTANA 1604085   

   fValorMaxPrestacao : Currency;//Renato Visoni SOL 134670 Kintana 796612


   fValorParcAnt           : Currency;
   //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - 23/12/2013
   sPerdaEfetiva            : String;
   //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - 23/12/2013
begin
   // função que calcula (utilizando a Regra pertinente) e armazena num vetor
   //   de Registros informações como o Nome do item, seu valor e o RECPAG, isto
   //   é se o item é de Recebimento ou Pagamento - PARA PRESTAÇÕES

   Result := True;

   // variável que armazena o saldo devedor resultante do tratamento dos itens,
   //   isto é, depois do valor do item ser abatido ou incorporado 
   fNovoSaldoDev := fSaldoDev;

   ParametrosSistema;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   //Renato Visoni SOL 124858 KINTANA 638072
   qrySaldoDev               := TwwQuery.Create(Application);
   qrySaldoDev.DatabaseName  := 'BaseDados';

   QryLog               := TwwQuery.Create(Application);
   QryLog.DatabaseName  := 'BaseDados';
   //Renato Visoni SOL 124858 KINTANA 638072


   //Renato Visoni SOL 134670 Kintana 796612 e SOL 150176 Kintana 1086197
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT VALORMAX FROM VALORMAXPRESTEP');
   //qryAux.SQL.Add('WHERE IDPESSOA ='+IntToStr(rContrato.IDBenef));   // Edilaine - Sol 163624 / KTN 1399837 - comentei
   //qryAux.SQL.Add('AND IDTITULAR  ='+IntToStr(rContrato.IDPessoa));  // Edilaine - Sol 163624 / KTN 1399837 - comentei
   qryAux.SQL.Add('WHERE IDCONTRATOEMPTMO = '+FormatFloat('#0', rContrato.IDContratoEmptmo));  // Edilaine - Sol 163624 / KTN 1399837
   qryAux.SQL.Add('AND '+'ADD_MONTHS(TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))+',''DD/MM/YYYY''),1)');
   qryAux.SQL.Add('BETWEEN DATAINICIO AND NVL(DATAFIM, ADD_MONTHS(TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))+',''DD/MM/YYYY''),12))'); // Edilaine - Sol 163624 / KTN 1399837 - comentei

   qryAux.Open;

   fValorMaxPrestacao := 0;
   if not qryAux.isEmpty then begin
     fValorMaxPrestacao := QryAux.FieldByname('VALORMAX').asFloat;
   end;
   //Renato Visoni SOL 134670 Kintana 796612 e SOL 150176 Kintana 1086197


   try
      try

         // ----------------------------------------------------------------------------------------

         // Marchetti - Pendencia 19196
         // Recuperar o campo DATANASC da tabela PESSOAFISICA e passar para a regra
         sSQL :=
         'SELECT '                           + #13 +
         '  DATANASC '                       + #13 +
         'FROM '                             + #13 +
         '  PESSOAFISICA '                   + #13 +
         'WHERE '                            + #13 +
         '  IDPESSOA = '  + IntToStr(rContrato.IDBenef);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         sDataNasc := FormatDateTime('dd/mm/yyyy',qryAux.FieldByname('DATANASC').AsDateTime);
         // Fim Marchetti - Pendencia 19196

         // ----------------------------------------------------------------------------------------

         // André Pontes - 01/11/2005
         // FUNCEF pediu passagem do saldo devedor à data da prestação, para permitir cálculo da
         // última sem resíduo

         rSaldoDevAtu.fSaldoDevAnt := 0;

         if Sistema.TipoCliente = 19991 then
         begin
            rSaldoDevAtu := SaldoDevAnt(rContrato.IDContratoEmptmo, dDataRef, 0, 0, True);
         end;

         // FIM André Pontes - 01/11/2005

         // ----------------------------------------------------------------------------------------

         sSQL :=
         'SELECT '                           + #13 +
         '  FLGINTERNO '                     + #13 +
         'FROM '                             + #13 +
         '  SITPART '                        + #13 +
         'WHERE '                            + #13 +
         '  IDSITPART = '  + IntToStr(iIdSitPart);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         sFlgInterno := qryAux.FieldByName('FLGINTERNO').AsString;

         // ----------------------------------------------------------------------------------------

         with dtmCalcEmptmo.qryBuscaItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := rContrato.IDTipoContrEmptmo;
            ParamByName('PEVENTO').AsInteger             := iEvento;
            Open;

            First;
         end;

         sValor   := '0';
         sSQL     := '';
         i        := 0;

         if bMostraProgresso then frmProgresso.MostraFormProgresso('Calculando Itens...',
                                                                   True,
                                                                   True,
                                                                   True,
                                                                   0,
                                                                   dtmCalcEmptmo.qryBuscaItens.RecordCount
                                                                  );


         //Renato Visoni SOL 124858 KINTANA 638072
         sSQLAux  :='';
         sSQLAux1 :='';
         iItem    := -1;

         //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - 23/12/2013
         sPerdaEfetiva := '0';
         if QryDados <> nil then begin
           sPerdaEfetiva := QryDados.FieldByName('FLGPERDAEFETIVA').AsString;
         end else begin
           sPerdaEfetiva := IntToStr(rContrato.sFlagPerdaEfetiva);
         end;
         //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - 23/12/2013

         if QryDados <> nil then
            begin
            QryDados.First;
            While not QryDados.eof do begin
             if QryDados.FieldByname('FLGESCOLHA').AsInteger = 1 then begin
                sSQLAux := ' SELECT hst.idcontratoemptmo, hst.hmedataprevista AS DATACREDITO, '+
                  //BRUNO AZEVEDO SOL 132900 KINTANA 769848
                  '        (SELECT DISTINCT H.HMESALDODEV                                    '+
                  //BRUNO AZEVEDO SOL 132900 KINTANA 769848
                  '         FROM histmovemptmo h, contratoemptmo c1, itemxtipocontr itc '+
                  '         WHERE h.idcontratoemptmo = hst.idcontratoemptmo             '+
                  '         AND   h.idcontratoemptmo = c1.idcontratoemptmo              '+
                  '         AND   c1.idtipocontremptmo = itc.idtipocontremptmo          '+
                  '         AND   itc.iditememptmo = h.iditememptmo                     '+
                  '         AND   nvl(h.flgestornado,0) = 0                             '+
                  '         AND   h.hmedataprevista = to_date('+QuotedStr(FormatDateTime('DD/MM/YYYY', DataCredito))+',''DD/MM/YYYY'')'+
                  '         AND   itc.itcordemextrato = (SELECT MAX(i.itcordemextrato)  '+
                  '                                     FROM itemxtipocontr i           '+
                  '                                      WHERE i.idtipocontremptmo = itc.idtipocontremptmo'+
                  '                                      AND   i.iditememptmo IN (SELECT iditememptmo'+
                  '                                                               FROM histmovemptmo hme'+
                  '                                                               WHERE hme.idcontratoemptmo = hst.idcontratoemptmo'+
                  '                                                               AND   hme.hmedataprevista = to_date('+QuotedStr(FormatDateTime('DD/MM/YYYY', DataCredito))+',''DD/MM/YYYY'')'+
                  '                                                               AND   nvl(hme.flgestornado,0) = 0)'+  //BRUNO AZEVEDO SOL 132900 KINTANA 769848'+
                  '                                     )'+
                  '         ) AS SALDODEV'+
                  ' FROM histmovemptmo hst'+
                  ' WHERE hst.idcontratoemptmo = '+ FormatFloat('#0', QryDados.FieldByname('IDCONTRATOEMPTMO').AsFloat)+
                  ' AND   hst.hmetipomov = 0'+
                  ' AND   hst.hmeorigem = 0 '+
                  ' AND   hst.hmecentraliza = 1 '+
                  ' AND   nvl(hst.flgestornado,0) = 0';

                  qrySaldoDev.Close;
                  qrySaldoDev.SQL.Clear;
                  qrySaldoDev.SQL.Add(sSQLAux);
                  qrySaldoDev.Open;

                  //BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO
                  //fRetornaFlag  :=  RetornaSituacao(QryDados.FieldByname('IDCONTRATOEMPTMO').AsString);
                  //BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO

                  //Jéssica SOL127055

                   //BRUNO AZEVEDO SOL 176064 KINTANA 1604085
                   try
                     qryValorSolicAnt               := TwwQuery.Create(Application);
                     qryValorSolicAnt.DatabaseName  := 'BaseDados';

                     with qryValorSolicAnt do begin
                       close;
                       sql.clear();
                       sql.add('SELECT SUM(H.HMEVLRPREVISTO) AS VLRSOLICANT ');
                       sql.add('  FROM HISTMOVEMPTMO H ');
                       sql.add(' WHERE H.HMETIPOMOV = 0 ');
                       sql.add('   AND H.Iditememptmo = 22 ');
                       sql.add('   and h.idcontratoemptmo = ' + QryDados.FieldByname('IDCONTRATOEMPTMO').AsString);
                       sql.add('   and nvl(h.flgestornado,0) = 0 ');
                       Open;

                       fValorSolicAnt := qryValorSolicAnt.FieldByName('VLRSOLICANT').AsFloat;
                     end;
                   finally
                     FreeAndNil(qryValorSolicAnt);
                   end;
                   //BRUNO AZEVEDO SOL 176064 KINTANA 1604085


                  sSQLAux1 := sSQLAux1 +
                  'SELECT ' + #13 +

                  '  ' + IntToStr(-1)                                                   + ' AS HMETIPOMOV, '       + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS HMEORIGEM, '        + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS ORIGEM, '           + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS EVENTO, '           + #13 +

                  '  ' + IntToStr(-1)                                                   + ' AS IDPAIS, '           + #13 +
                  '  ' + QuotedStr('-1')                                                + ' AS CODESTADO, '        + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS IDCIDADES, '        + #13 +

                  '  ' + NumeroIngles(-1)                                               + ' AS SALPARTICIPACAO, '  + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS SALMANTIDO, '       + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS SALAUXDOENCA, '     + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS SALBENEF, '         + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS SALARIOBASE, '      + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VLRMAXPERMIT, '     + #13 +

                  '  ' + QuotedStr('-1')                                                + ' AS NOMEINDICE, '       + #13 +

                  '  -1'                                                                + ' AS IDCONTRATOEMPTMO, ' + #13 +
                  '  -1'                                                                + ' AS IDTIPOCONTREMPTMO, ' + #13 +
                  '  ' + Parcelas                                                       + ' AS NUMPARCELAS, '      + #13 +   //1.
                  '  ' + NumeroIngles(-1)                                               + ' AS VLRPRIMPARC, '      + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS PARCATUAL, '        + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS MARGEM, '           + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS RESERVA, '          + #13 +
                  '  ' + NumeroIngles(fTxJuros)                                         + ' AS TXJUROS, '          + #13 +  //Thiago Passos 128731
                  //BRUNO AZEVEDO SOL 176079 KINTANA 1604454
                  '  ' + NumeroIngles(fVlrSolic)                                        + ' AS VALORSOLIC, '       + #13 +

                  '  ' + NumeroIngles(-1)                                               + ' AS SALDODEV, '         + #13 +
                  '  ' + NumeroIngles(QrySaldoDev.fieldByname('SALDODEV').asFloat)      + ' AS SALDODEVANT, '      + #13 +   //2.
                  '  ' + NumeroIngles(QryDados.FieldByName('VLRATUAL').asFloat)         + ' AS SALDOEPANT, '       + #13 +   //3.
                  '  ' + NumeroIngles(-1)                                               + ' AS SALDODEVATU, '      + #13 +

                  '  ' + NumeroIngles(-1)                                               + ' AS VLRCONTRATOSANT, '  + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VLRDIVIDAS, '       + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS NUMPARCPAGAS, '     + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS PRAZOANTERIOR, '    + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS ULTPARCGERADA, '    + #13 +

                  '  ' + IntToStr(iItem)                                                   + ' AS IDITEMEMPTMO, '      + #13 +

                  '  -1'                                                                + ' AS VALRECCRED, '       + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS SEQCALCULO, '       + #13 +
                  '  ' + QuotedStr('-1')                                                + ' AS DATAREF, '          + #13 +
                  '  ' + QuotedStr('-1')                                                + ' AS COMPETENCIA, '      + #13 +

                  '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataCredito))           + ' AS DATACREDITO, '      + #13 +   //4.
                  '  ' + QuotedStr('-1')                                                + ' AS DATAASSIN, '        + #13 +
                  '  ' + QuotedStr('-1')                                                + ' AS DATAINSC, '         + #13 +
                  '  ' + QuotedStr('-1')                                                + ' AS DATAULTATUALIZA, '  + #13 +
                  //BRUNO AZEVEDO SOL 176787 KINTANA 1615033
                  '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))     + ' AS DATAPRIMPARC, '     + #13 +  //Wylliam Leite da Silva SOL 176064 KINTANA 1604085

                  '  ' + IntToStr(-1)                                                   + ' AS IDSITPART, '        + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS IDPESSJUR, '        + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS IDPLANOPREV, '      + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS IDPESSOA, '         + #13 +
                  '  ' + IntToStr(-1)                                                   + ' AS IDTITULAR, '        + #13 +
                  '  ' + FormatFloat('#0', QryDados.FieldByname('IDCONTRATOEMPTMO').AsFloat)            + ' AS IDCONTRATOANT, '    + #13 +
                  '  ' + NumeroIngles(QryDados.FieldByName('NUMPARCELAS').asFloat)      + ' AS PRAZOANT, '         + #13 +   //Wylliam Leite da Silva SOL 176064 KINTANA 1604085
                  '  ' + NumeroIngles(fValorSolicAnt)                                   + ' AS VALORSOLICANT, '    + #13 +   //Wylliam Leite da Silva SOL 176064 KINTANA 1604085
                  '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qrySaldoDev.fieldByname('DATACREDITO').asDateTime))+ ' AS DATACREDITOANT, ' + #13 +  //5.

                  '  ' + QuotedStr('-1')                                                + ' AS DATAATRASO, '       + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VALOREMABERTO, '    + #13 +

                  '  ' + QuotedStr('-1')                                                + ' AS DATAATRASOANT, '    + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VALORPROVISAO, '    + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VALOREMABERTOANT, ' + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS SALDOQUITACAO, '    + #13 +
                  ' -1'                                                                 + ' AS SEQPROPOSTA, '      + #13 +
                  '  ' + QuotedStr('-1')                                                + ' AS FLGINTERNO, '       + #13 +

                  '  ' + IntToStr(-1)                                                   + ' AS FLGFINANCIAMENTO, ' + #13 +

                  '  -1'                                                                + ' AS FLGEXCEPCIONAL, '   + #13 +

                  '  ' + NumeroIngles(QryDados.FieldByName('IDTIPOCONTREMPTMO').asFloat) + ' AS IDTIPOANT, '        + #13 +  //Wylliam Leite da Silva  SOL 176064 KINTANA 1604085
                  '  ' + NumeroIngles(-1)                                               + ' AS VLRDEVOLSEG, '      + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VLRSEGANT, '        + #13 +
                  '  ' + NumeroIngles(-1)                                               + ' AS VLRSEGCOMPLANT, '   + #13 +

                  '  ' + QuotedStr('-1')                                                + ' AS DATANASC, '         + #13 +

                  '  ' + NumeroIngles(-1)                                               + ' AS VALORPARCANT, '     + #13 +

                  ' -1'                                                                 + ' AS FLGUSAMARGEMALT, '   + #13 +

                  '  ' + IntToStr(-1)                                                   + ' AS TSEMESES, '           + #13 +
                  '  ' + NumeroIngles(QryDados.FieldByName('TXJUROS').asFloat)          + ' AS TXJUROSANT,      '   + #13 +   //Douglas.Siqueira SOL 176201 Kin 1606793.
                  '  ' + IntToStr(-1)                                                   + ' AS IDTIPOSUSPEMPTMO '   + #13 +


                  //Renato Visoni SOL 134670 Kintana 796612
                  ', ' + NumeroIngles(fValorMaxPrestacao)                                + ' AS VALORMAXPRESTACAO '     + #13 +
                  //Renato Visoni SOL 134670 Kintana 796612

                  //'  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qrySaldoDev.fieldByname('DATACREDITO').asDateTime))      + ' AS DATACREDITO, '      + #13 +
                  //'  ' + QuotedStr(qrySaldoDev.fieldByname('SALDODEV').asString)                   + ' AS SALDODEVEDORANT '   + #13 +

                  //Monica Gonzaga SOL:156456 Kintana: 1234816
                  ', 0'  + IntToStr(Ord(bVLRLIQZERO))                               + ' AS FLGVLRLIQZERO '   + #13 +
                  //Monica Gonzaga SOL:156456 Kintana: 1234816
                  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
                  //', 0'  + (fRetornaFlag)                                                   + ' AS FLGPERDAEFETIVA '   + #13 +
                  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 23/12/2013
                  ',' + QuotedStr(sPerdaEfetiva)    + ' AS FLGPERDAEFETIVA '   + #13 +
                  //Leandro WO14072 - inicio
                  ',' + IntToStr(iQtde_Parcelas_Geradas)     + ' AS QTDE_PARCELAS_GERADAS '   + #13 +
                  ',' + IntToStr(iCarencia)                  + ' AS CARENCIA              '   + #13 +
                  ',' + NumeroIngles(fSaldoDevAtu)           + ' AS SALDODEVATU           '   + #13 +
                  ',' + NumeroIngles(fVlrParcela)            + ' AS VLRPARCELA            '   + #13 +
                  //Leandro WO14072 - fim


                 '  FROM DUAL UNION ';


                 iItem := iItem -1;
               end;
             QryDados.Next;
           end;
         end;

         //Renato Visoni SOL 124858 KINTANA 638072

         // Laço que calcula todos os itens
         while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
         begin
            if bMostraProgresso then
            begin
               frmProgresso.AndaFormProgresso(i);
               if frmProgresso.Cancelou then Exit;
            end;

            SetLength(vSQL, i + 1); // array dinâmico

            // Marchetti - pendencia 26569
            fValorParcAnt := 0;
            // Daniel 03/08/2008 - SOl: 94957 KT: 409602
            //if (Sistema.TipoCliente = 20071) and (iEvento = 1) and (iParcela > 0) then
            if (iEvento = 1) and (iParcela > 0) then
            // Fim Daniel
            begin
               sSQL :=
               'SELECT '                                                                                  + #13 +
               '    HMEVLRPREVISTO '                                                                      + #13 +
               'FROM '                                                                                    + #13 +
               '    HISTMOVEMPTMO '                                                                       + #13 +
               'WHERE '                                                                                   + #13 +
               '    IDCONTRATOEMPTMO    = ' + FormatFloat('#0', rContrato.IDContratoEmptmo)               + #13 +
               'AND IDITEMEMPTMO        = ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger) + #13 +
               'AND HMEPARCELA          = ' + IntToStr(iParcela - 1)                                      + #13 +
               'AND NVL(FLGESTORNADO,0) = 0 '                                                             + #13;

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Text := sSQL;
               qryAux.Open;

               if not qryAux.IsEmpty then fValorParcAnt := qryAux.FieldByName('HMEVLRPREVISTO').AsCurrency;
            end;
            // Fim Marchetti - pendencia 26569
//            fRetornaFlag  :=    RetornaSituacao(QryDados.FieldByname('IDCONTRATOEMPTMO').AsString);
            sSQL :=
            'SELECT ' + #13 +

            '  ' + IntToStr(iEvento)                                                   + ' AS HMETIPOMOV, '       + #13 +
            '  ' + IntToStr(iOrigem)                                                   + ' AS HMEORIGEM, '        + #13 +
            '  ' + IntToStr(iOrigem)                                                   + ' AS ORIGEM, '           + #13 +
            '  ' + IntToStr(iEvento)                                                   + ' AS EVENTO, '           + #13 +

            '  ' + IntToStr(iPais)                                                     + ' AS IDPAIS, '           + #13 +
            '  ' + QuotedStr(sEstado)                                                  + ' AS CODESTADO, '        + #13 +
            '  ' + IntToStr(iCidade)                                                   + ' AS IDCIDADES, '        + #13 +

            '  ' + NumeroIngles(fSalPart)                                              + ' AS SALPARTICIPACAO, '  + #13 +
            '  ' + NumeroIngles(fSalMantido)                                           + ' AS SALMANTIDO, '       + #13 +
            '  ' + NumeroIngles(fSalAuxDoenca)                                         + ' AS SALAUXDOENCA, '     + #13 +
            '  ' + NumeroIngles(fSalBenef)                                             + ' AS SALBENEF, '         + #13 +
            '  ' + NumeroIngles(fSalarioBase)                                          + ' AS SALARIOBASE, '      + #13 +
            '  ' + NumeroIngles(fVlrMaxPermit)                                         + ' AS VLRMAXPERMIT, '     + #13 +

            '  ' + QuotedStr(rContrato.SiglaIndexador)                                 + ' AS NOMEINDICE, '       + #13 +

            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                       + ' AS IDCONTRATOEMPTMO, ' + #13 +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                               + ' AS IDTIPOCONTREMPTMO, ' + #13 +
            ' 0' + IntToStr(rContrato.NumParcelas)                                     + ' AS NUMPARCELAS, '      + #13 +
            '  ' + NumeroIngles(rContrato.VlrParcela)                                  + ' AS VLRPRIMPARC, '      + #13 +
            '  ' + IntToStr(iParcela)                                                  + ' AS PARCATUAL, '        + #13 +
            '  ' + NumeroIngles(fMargem)                                               + ' AS MARGEM, '           + #13 +
            '  ' + NumeroIngles(fReserva)                                              + ' AS RESERVA, '          + #13 +
            '  ' + NumeroIngles(fTxJuros)                                              + ' AS TXJUROS, '          + #13 +
            '  ' + NumeroIngles(fVlrSolic)                                             + ' AS VALORSOLIC, '       + #13 +

            '  ' + NumeroIngles(fNovoSaldoDev)                                         + ' AS SALDODEV, '         + #13 +
            '  ' + NumeroIngles(fSaldoDev)                                             + ' AS SALDODEVANT, '      + #13 +
            '  ' + NumeroIngles(fSaldoEPAnt)                                           + ' AS SALDOEPANT, '       + #13 +
            '  ' + NumeroIngles(rSaldoDevAtu.fSaldoDevAnt)                             + ' AS SALDODEVATU, '      + #13 +

            '  ' + NumeroIngles(fVlrContratosAnt)                                      + ' AS VLRCONTRATOSANT, '  + #13 +
            '  ' + NumeroIngles(fVlrDividas)                                           + ' AS VLRDIVIDAS, '       + #13 +
            '  ' + IntToStr(iNumParcPagas)                                             + ' AS NUMPARCPAGAS, '     + #13 +
            '  ' + IntToStr(iPrazoAnterior)                                            + ' AS PRAZOANTERIOR, '    + #13 +
            '  ' + IntToStr(iUltParcelaGerada)                                         + ' AS ULTPARCGERADA, '    + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)         + ' AS IDITEMEMPTMO, '     + #13 +

            '  0'                                                                      + ' AS VALRECCRED, '       + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)        + ' AS SEQCALCULO, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataRef))                   + ' AS DATAREF, '          + #13 +
            '  ' + QuotedStr(sAnoMesCompetencia)                                       + ' AS COMPETENCIA, '      + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))      + ' AS DATACREDITO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))   + ' AS DATAASSIN, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))    + ' AS DATAINSC, '         + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))              + ' AS DATAULTATUALIZA, '  + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))     + ' AS DATAPRIMPARC, '     + #13 +

            '  ' + IntToStr(iIdSitPart)                                                + ' AS IDSITPART, '        + #13 +
            '  ' + IntToStr(rContrato.IDPatro)                                         + ' AS IDPESSJUR, '        + #13 +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                     + ' AS IDPLANOPREV, '      + #13 +
            '  ' + IntToStr(rContrato.IDBenef)                                         + ' AS IDPESSOA, '         + #13 +
            '  ' + IntToStr(rContrato.IDPessoa)                                        + ' AS IDTITULAR, '        + #13 +
            '  ' + FormatFloat('#0', rConcessao.IDContratoEmptmo)                      + ' AS IDCONTRATOANT, '    + #13 +
            '  ' + IntToStr(rConcessao.Prazo)                                          + ' AS PRAZOANT, '         + #13 +
            '  ' + NumeroIngles(rConcessao.ValorSolic)                                 + ' AS VALORSOLICANT, '    + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rConcessao.DataCredito))     + ' AS DATACREDITOANT, '   + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataAtraso))                 + ' AS DATAATRASO, '       + #13 +
            '  ' + NumeroIngles(fValorEmAberto)                                        + ' AS VALOREMABERTO, '    + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataAtrasoAnt))              + ' AS DATAATRASOANT, '    + #13 +
            '  ' + NumeroIngles(fValorProvisao)                                        + ' AS VALORPROVISAO, '    + #13 +
            '  ' + NumeroIngles(fValorEmAbertoAnt)                                     + ' AS VALOREMABERTOANT, ' + #13 +
            '  ' + NumeroIngles(rConcessao.SaldoQuitacao)                              + ' AS SALDOQUITACAO, '    + #13 +
            ' 1' +                                                                       ' AS SEQPROPOSTA, '      + #13 +
            '  ' + QuotedStr(sFlgInterno)                                              + ' AS FLGINTERNO, '       + #13 +

            '  ' + IntToStr(iFinanciamento)                                            + ' AS FLGFINANCIAMENTO, ' + #13 +

            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                        + ' AS FLGEXCEPCIONAL, '   + #13 +
            //Fim Pendência 22836

            '  ' + IntToStr(iTipoContrQuitAnt)                                         + ' AS IDTIPOANT, '        + #13 +
            '  ' + NumeroIngles(fVlrDevolSeguro)                                       + ' AS VLRDEVOLSEG, '      + #13 +
            '  ' + NumeroIngles(fVlrSegAnt)                                            + ' AS VLRSEGANT, '        + #13 +
            '  ' + NumeroIngles(fVlrSegComplAnt)                                       + ' AS VLRSEGCOMPLANT, '   + #13 +

            // Marchetti - Pendencia 19196
            '  ' + QuotedStr(sDataNasc)                                                + ' AS DATANASC, '         + #13 +
            // Fim Marchetti - Pendencia 19196

            // Marchetti - pendencia 26569
            '  ' + NumeroIngles(fValorParcAnt)                                         + ' AS VALORPARCANT, '     + #13 +
            // Fim Marchetti - pendencia 26569

            // Marchetti - pendencia 27041
            ' 0' + IntToStr(rContrato.FlgUsaMargemAlt)                                 + ' AS FLGUSAMARGEMALT, '   + #13 +
            // Fim Marchetti - pendencia 27041


            // SOL:108099 Daniel Begnami
            '  ' + IntToStr(pQtdeParcSusp)                                             + ' AS TSEMESES, '           + #13 +
            '  ' + NumeroIngles(rConcessao.Taxa)                                       + ' AS TXJUROSANT, '         + #13 +   //Douglas.Siqueira SOL 176201 Kin 1606793.
            '  ' + IntToStr(pIDTipoSuspEmptmo)                                         + ' AS IDTIPOSUSPEMPTMO '    + #13 +
            // FIM

            //Renato Visoni SOL 134670 Kintana 796612
            ', ' + NumeroIngles(fValorMaxPrestacao)                                    + ' AS VALORMAXPRESTACAO '     + #13 +
            //Renato Visoni SOL 134670 Kintana 796612


            //'  ' + QuotedStr('-1')                                                     + ' AS DATACREDITO, '      + #13 + //Renato Visoni SOL 124858 KINTANA 638072
            //'  ' + QuotedStr('-1')                                                     + ' AS SALDODEVEDORANT '   + #13 + //Renato Visoni SOL 124858 KINTANA 638072


            //Monica Gonzaga SOL:156456 Kintana: 1234816
            ', 0'  + IntToStr(Ord(bVLRLIQZERO))                                       + ' AS FLGVLRLIQZERO '   + #13 +
            //Monica Gonzaga SOL:156456 Kintana: 1234816
            //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            //', 0'  + (fRetornaFlag)                                                   + ' AS FLGPERDAEFETIVA '   + #13 +
            //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 23/12/2013
            ',' + QuotedStr(sPerdaEfetiva)    + ' AS FLGPERDAEFETIVA '   + #13 +

            //Leandro WO14072 - inicio
            ',' + IntToStr(iQtde_Parcelas_Geradas)     + ' AS QTDE_PARCELAS_GERADAS '   + #13 +
            ',' + IntToStr(iCarencia)                  + ' AS CARENCIA              '   + #13 +
            ',' + NumeroIngles(fSaldoDevAtu)           + ' AS SALDODEVATU           '   + #13 +
            ',' + NumeroIngles(fVlrParcela)            + ' AS VLRPARCELA            '   + #13 +
            //Leandro WO14072 - fim

            'FROM '                                                                                   + #13 +
            '  DUAL '                                                                                 + #13 +
            'ORDER BY'                                                                                + #13 +
            '  HMETIPOMOV, SEQCALCULO';

            vSQL[i] := sSQL;

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then begin
                 if sSQLAux1 <> '' then begin //Renato Visoni SOL 124858 KINTANA 638072
                   sSQLExec := sSQLAux1 + vSQL[j]; //Renato Visoni SOL 124858 KINTANA 638072
                 end else begin
                   sSQLExec := vSQL[j];
                 end;
               end
               else
               begin
                  sSQLExec := Copy(sSQLExec, 0, Length(sSQLExec) - 33 ) + ' UNION ' + #13;
                  sSQLExec := sSQLExec + vSQL[j];
               end;
            end;

            if not(UtilizaRegraValor(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger,
                                     sSQLExec,
                                     'e ' + dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString,
                                     sValor,
                                     bMostraMsg,
                                     bCriaObjetoRegra,
                                     bGravaQueryRegra
                                    )) then
            begin
               Result := False;
               if bInterrompe then Exit;
            end;

            //Renato Visoni SOL 124858 KINTANA 638072
            QryLog.Close;
            QryLog.SQL.Clear;
            QryLog.SQL.Add(sSQLExec);
            QryLog.SQL.SaveToFile(ftempregra +'\'+ intTostr(i)+'LogRegra.txt' );
            //Renato Visoni SOL 124858 KINTANA 638072


            if (sValor = 'NULO') then
            begin
                dtmCalcEmptmo.qryBuscaItens.Next;

                (* incrementa a variável de índice do vetor do SQL *)
                inc(i);

                if bMostraProgresso then frmProgresso.AndaFormProgresso(i);
                Continue;
            end
            else
            begin
               SetLength(vLista, i + 1);

               vLista[i].CodigoItem       := dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger;
               vLista[i].Nome             := dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString;
               vLista[i].iEvento          := dtmCalcEmptmo.qryBuscaItensITCEVENTO.AsInteger;
               vLista[i].Origem           := iOrigem;

               vLista[i].SeqCalculo       := dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger;
               vLista[i].SeqCobranca      := 1;
               vLista[i].Prioridade       := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

               vLista[i].FlgCentraliza    := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
               vLista[i].FlgDestacado     := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
               vLista[i].IdItemCentraliza := dtmCalcEmptmo.qryBuscaItensIDITEMCENTRALIZA.AsInteger;

               vLista[i].RecPag           := dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString;

               vLista[i].Regra            := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;

               vLista[i].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

               if (sValor <> 'NULO') then
               begin
                  vLista[i].Valor    := StrToFloat(ConverteVirg(sValor))
               end
               else
               begin
                  vLista[i].Valor    := 0;
               end;
            end;

            // calcula o novo saldo devedor
            case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
               0: begin (* Não Tratar *) end;
               1: fNovoSaldoDev := fNovoSaldoDev - vLista[i].Valor; (* Abater *)
               2: fNovoSaldoDev := fNovoSaldoDev + vLista[i].Valor; (* Incorporar *)
            end;

            if bAlteraSaldoDev then
            begin
               vLista[i].SaldoDevedor     := fNovoSaldoDev;
            end
            else
            begin
               vLista[i].SaldoDevedor     := fSaldoDev;
            end;

            vLista[i].TxJuros          := fTxJuros;

            vLista[i].FormaCobranca    := sFormaCobranca;

            vLista[i].FlgEnvio         := 0;
            vLista[i].FlgBaixado       := 0;
            vLista[i].FlgDivergPend    := -1;

            (* Armazeno no Vetor que será o Result da função a PRIORIDADE do item *)

            (* Armazeno no Vetor que será o Result da função a RUBRICA do item *)
            if not dtmCalcEmptmo.qryBuscaItensIDPROVENTON.IsNull then
               vLista[i].Rubrica          := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger
            else
               vLista[i].Rubrica          := -1;

            (* Depois de executada a Regra a variável sValor já tem o VALOR do item
               calculado, logo é atualizado este valor na linha de SQL do vetor vSQL
               que acabou de ser executada pela regra.  Antes da execução o valor é
               passado como ZERO *)
//             fRetornaFlag  :=    RetornaSituacao(QryDados.FieldByname('IDCONTRATOEMPTMO').AsString);
            sSQL :=
            'SELECT '                                                                                 + #13 +

            '  ' + IntToStr(iEvento)                                                   + ' AS HMETIPOMOV, '       + #13 +
            '  ' + IntToStr(iOrigem)                                                   + ' AS HMEORIGEM, '        + #13 +
            '  ' + IntToStr(iOrigem)                                                   + ' AS ORIGEM, '           + #13 +
            '  ' + IntToStr(iEvento)                                                   + ' AS EVENTO, '           + #13 +

            '  ' + IntToStr(iPais)                                                     + ' AS IDPAIS, '           + #13 +
            '  ' + QuotedStr(sEstado)                                                  + ' AS CODESTADO, '        + #13 +
            '  ' + IntToStr(iCidade)                                                   + ' AS IDCIDADES, '        + #13 +

            '  ' + NumeroIngles(fSalPart)                                              + ' AS SALPARTICIPACAO, '  + #13 +
            '  ' + NumeroIngles(fSalMantido)                                           + ' AS SALMANTIDO, '       + #13 +
            '  ' + NumeroIngles(fSalAuxDoenca)                                         + ' AS SALAUXDOENCA, '     + #13 +
            '  ' + NumeroIngles(fSalBenef)                                             + ' AS SALBENEF, '         + #13 +
            '  ' + NumeroIngles(fSalarioBase)                                          + ' AS SALARIOBASE, '      + #13 +
            '  ' + NumeroIngles(fVlrMaxPermit)                                         + ' AS VLRMAXPERMIT, '     + #13 +

            '  ' + QuotedStr(rContrato.SiglaIndexador)                                 + ' AS NOMEINDICE, '       + #13 +

            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                       + ' AS IDCONTRATOEMPTMO, ' + #13 +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                               + ' AS IDTIPOCONTREMPTMO, ' + #13 +
            ' 0' + IntToStr(rContrato.NumParcelas)                                     + ' AS NUMPARCELAS, '      + #13 +
            '  ' + NumeroIngles(rContrato.VlrParcela)                                  + ' AS VLRPRIMPARC, '      + #13 +
            '  ' + IntToStr(iParcela)                                                  + ' AS PARCATUAL, '        + #13 +
            '  ' + NumeroIngles(fMargem)                                               + ' AS MARGEM, '           + #13 +
            '  ' + NumeroIngles(fReserva)                                              + ' AS RESERVA, '          + #13 +
            '  ' + NumeroIngles(fTxJuros)                                              + ' AS TXJUROS, '          + #13 +
            '  ' + NumeroIngles(fVlrSolic)                                             + ' AS VALORSOLIC, '       + #13 +

            '  ' + NumeroIngles(fNovoSaldoDev)                                         + ' AS SALDODEV, '         + #13 +
            '  ' + NumeroIngles(fSaldoDev)                                             + ' AS SALDODEVANT, '      + #13 +
            '  ' + NumeroIngles(fSaldoEPAnt)                                           + ' AS SALDOEPANT, '       + #13 +
            '  ' + NumeroIngles(rSaldoDevAtu.fSaldoDevAnt)                             + ' AS SALDODEVATU, '      + #13 +

            '  ' + NumeroIngles(fVlrContratosAnt)                                      + ' AS VLRCONTRATOSANT, '  + #13 +
            '  ' + NumeroIngles(fVlrDividas)                                           + ' AS VLRDIVIDAS, '       + #13 +
            '  ' + IntToStr(iPrazoAnterior)                                            + ' AS PRAZOANTERIOR, '    + #13 +
            '  ' + IntToStr(iUltParcelaGerada)                                         + ' AS ULTPARCGERADA, '    + #13 +
            '  ' + IntToStr(iNumParcPagas)                                             + ' AS NUMPARCPAGAS, '     + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)         + ' AS IDITEMEMPTMO, '     + #13 +

            // sValor é o valor retornado pela regra do item Anterior

            //  Thiago Melo SOL 182298 KINTANA 1696751
            '  ' + NumeroIngles(StrToFloat(sValor))                                    + ' AS VALRECCRED, '       + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)        + ' AS SEQCALCULO, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataRef))                   + ' AS DATAREF, '          + #13 +
            '  ' + QuotedStr(sAnoMesCompetencia)                                       + ' AS COMPETENCIA, '      + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))      + ' AS DATACREDITO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))   + ' AS DATAASSIN, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))    + ' AS DATAINSC, '         + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))              + ' AS DATAULTATUALIZA, '  + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))     + ' AS DATAPRIMPARC, '     + #13 +

            '  ' + IntToStr(iIdSitPart)                                                + ' AS IDSITPART, '        + #13 +
            '  ' + IntToStr(rContrato.IDPatro)                                         + ' AS IDPESSJUR, '        + #13 +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                     + ' AS IDPLANOPREV, '      + #13 +
            '  ' + IntToStr(rContrato.IDBenef)                                         + ' AS IDPESSOA, '         + #13 +
            '  ' + IntToStr(rContrato.IDPessoa)                                        + ' AS IDTITULAR, '        + #13 +
            '  ' + FormatFloat('#0', rConcessao.IDContratoEmptmo)                      + ' AS IDCONTRATOANT, '    + #13 +
            '  ' + IntToStr(rConcessao.Prazo)                                          + ' AS PRAZOANT, '         + #13 +
            '  ' + NumeroIngles(rConcessao.ValorSolic)                                 + ' AS VALORSOLICANT, '    + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rConcessao.DataCredito))     + ' AS DATACREDITOANT, '   + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataAtraso))                 + ' AS DATAATRASO, '       + #13 +
            '  ' + NumeroIngles(fValorEmAberto)                                        + ' AS VALOREMABERTO, '    + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataAtrasoAnt))              + ' AS DATAATRASOANT, '    + #13 +
            '  ' + NumeroIngles(fValorProvisao)                                        + ' AS VALORPROVISAO, '    + #13 +
            '  ' + NumeroIngles(fValorEmAbertoAnt)                                     + ' AS VALOREMABERTOANT , ' + #13 +
            '  ' + NumeroIngles(rConcessao.SaldoQuitacao)                              + ' AS SALDOQUITACAO, '    + #13 +
            ' 1' +                                                                       ' AS SEQPROPOSTA, '      + #13 +
            '  ' + QuotedStr(sFlgInterno)                                              + ' AS FLGINTERNO, '       + #13 +

            '  ' + IntToStr(iFinanciamento)                                            + ' AS FLGFINANCIAMENTO, ' + #13 +

            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                        + ' AS FLGEXCEPCIONAL, '   + #13 +
            //Fim Pendência 22836

            '  ' + IntToStr(iTipoContrQuitAnt)                                         + ' AS IDTIPOANT, '        + #13 +
            '  ' + NumeroIngles(fVlrDevolSeguro)                                       + ' AS VLRDEVOLSEG, '      + #13 +
            '  ' + NumeroIngles(fVlrSegAnt)                                            + ' AS VLRSEGANT, '        + #13 +
            '  ' + NumeroIngles(fVlrSegComplAnt)                                       + ' AS VLRSEGCOMPLANT, '   + #13 +

            // Marchetti - Pendencia 19196
            '  ' + QuotedStr(sDataNasc)                                                + ' AS DATANASC, '         + #13 +
            // Fim Marchetti - Pendencia 19196

            // Marchetti - pendencia 26569
            '  ' + NumeroIngles(fValorParcAnt)                                         + ' AS VALORPARCANT, '     + #13 +
            // Fim Marchetti - pendencia 26569

            // Marchetti - pendencia 27041
            ' 0' + IntToStr(rContrato.FlgUsaMargemAlt)                                 + ' AS FLGUSAMARGEMALT, '  + #13 +
            // Fim Marchetti - pendencia 27041

            // SOL:108099 Daniel Begnami
            '  ' + IntToStr(pQtdeParcSusp)                                             + ' AS TSEMESES, '          + #13 +
            '  ' + NumeroIngles(rConcessao.Taxa)                                       + ' AS TXJUROSANT, '        + #13 +   //Douglas.Siqueira SOL 176201 Kin 1606793.
            '  ' + IntToStr(pIDTipoSuspEmptmo)                                         + ' AS IDTIPOSUSPEMPTMO '   + #13 +
            // FIM

            //Renato Visoni SOL 134670 Kintana 796612
            ', ' + NumeroIngles(fValorMaxPrestacao)                                + ' AS VALORMAXPRESTACAO '     + #13 +
            //Renato Visoni SOL 134670 Kintana 796612

            //'  ' + QuotedStr('-1')                                                   + ' AS DATACREDITO, '      + #13 + //Renato Visoni SOL 124858 KINTANA 638072
            //'  ' + QuotedStr('-1')                                                   + ' AS SALDODEVEDORANT '   + #13 + //Renato Visoni SOL 124858 KINTANA 638072

            //Monica Gonzaga SOL:156456 Kintana: 1234816
            ', 0'  + IntToStr(Ord(bVLRLIQZERO))                                     + ' AS FLGVLRLIQZERO '   + #13 +
           //Monica Gonzaga SOL:156456 Kintana: 1234816
            //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            //', 0'  + (fRetornaFlag)                                                   + ' AS FLGPERDAEFETIVA '   + #13 +
            //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 23/12/2013
            ',' + QuotedStr(sPerdaEfetiva)    + ' AS FLGPERDAEFETIVA '   + #13 +

            //Leandro WO14072 - inicio
            ',' + IntToStr(iQtde_Parcelas_Geradas)     + ' AS QTDE_PARCELAS_GERADAS '   + #13 +
            ',' + IntToStr(iCarencia)                  + ' AS CARENCIA              '   + #13 +
            ',' + NumeroIngles(fSaldoDevAtu)           + ' AS SALDODEVATU           '   + #13 +
            ',' + NumeroIngles(fVlrParcela)            + ' AS VLRPARCELA            '   + #13 +
            //Leandro WO14072 - fim
            
            'FROM '                                                                                               + #13 +
            '  DUAL '                                                                                             + #13 +
            'ORDER BY'                                                                                            + #13 +
            '  HMETIPOMOV, SEQCALCULO';

            vSQL[i] := sSQL;

            (* incrementa a variável de índice do vetor *)
            inc(i);

            dtmCalcEmptmo.qryBuscaItens.Next;
         end; (* while *)

      except
         if bMostraMsg then
         begin
            Raise;
            MsgDlg('Ocorreu um erro na Busca de Valores de um Item', 'Empréstimo', mtError, [mbOk], 0);
         end;
         dtmCalcEmptmo.qryBuscaItens.Close;
         Result := False;
      end;
   finally
      dtmCalcEmptmo.qryBuscaItens.Close;
      qryAux.Free;
      if bMostraProgresso then frmProgresso.EscondeFormProgresso;
   end;
end;

//BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO
{Function TCalcEmptmo.RetornaSituacao(IDContratoEmptmo : String): String;
var
qryAux :  TwwQuery;
Begin

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' select FLGPERDAEFETIVA from CONTRATOEMPTMO ');
   qryAux.SQL.Add(' WHERE  IDCONTRATOEMPTMO = '+trim(IDContratoEmptmo)+'');
   qryAux.Open;
   Result:= qryAux.FieldByName('FLGPERDAEFETIVA').AsString;
end;}
//BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO


function TCalcEmptmo.CalculaItensAmortizacao(const rContrato         : TDadosContrato;
                                             const iOrigem           : Integer;
                                             const iPais             : Integer;
                                             const sEstado           : String;
                                             const iCidade           : Integer;
                                             const sFormaCobranca    : String;
                                             const fVlrAmortizacao   : TDateTime;
                                             const dDataAmortizacao  : TDateTime;
                                             var   vLista            : TListaItem;
                                             const bMostraMsg        : Boolean;
                                             const bMostraProgresso  : Boolean;
                                             const fVlrSegAnt        : Currency = 0;
                                             const fVlrSegComplAnt   : Currency = 0;
                                             const bRepactuacao      : Boolean = False
                                            ): Boolean;
const
   iEvento = 2;
var
   rSaldosAntPos        : TSaldosAntPos;
   vSQL                 : array of String;
   sSQL, sSQLExec       : String;
   sValor, sCabecalho   : String;
   i, j, k, iContador   : Integer;
   bCabecalho           : Boolean;
   fNovoSaldoDev        : Currency;
   iRepactuacao         : Integer;
begin
   // função que calcula (utilizando a Regra pertinente) e armazena num vetor
   //   de Registros informações como o Nome do item, seu valor e o RECPAG, isto
   //   é se o item é de Recebimento ou Pagamento - PARA PRESTAÇÕES

   iRepactuacao := 0;

   if bRepactuacao then iRepactuacao := 1;

   Result := True;
   ParametrosSistema;

   try
      try
         // abertura da query dos itens de Quitação
         with dtmCalcEmptmo.qryBuscaItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
            ParamByName('PEVENTO').AsInteger            := iEvento;
            Open;
            First;
         end;

         sValor    := '0';
         sSQL      := '';
         i         := 0;
         k         := 0;
         iContador := 0;

         // Configurando o Form com a Barra de Progresso
         if bMostraProgresso then frmProgresso.MostraFormProgresso('Calculando Itens de Amortização...',
                                                                   True,
                                                                   True,
                                                                   True,
                                                                   0,
                                                                   dtmCalcEmptmo.qryBuscaItens.RecordCount
                                                                  );

         // busca os saldos devedores (Anterior e "Posterior")
         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                       dDataAmortizacao,
                                                       True
                                                      );

         // Saldo Devedor
         fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;

         // ----------------------------------------------------------------------------------------
         //    Monta PRIMEIRA LINHA do SQL (linha do Saldo Devedor Anterior)
         // ----------------------------------------------------------------------------------------

         SetLength(vSQL, i + 1);

         sSQL := '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
         'SELECT '                                                                                                      + #13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   + #13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

         // André Pontes - 10/08/2004
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOANT, '          + #13 +
         // FIM André Pontes - 10/08/2004

         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       + #13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        + #13 +
         '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          + #13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          + #13 +
         '  ' + IntToStr(iRepactuacao)                                                    +  ' AS REPACTUACAO, '        + #13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         + #13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             + #13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       + #13 +

         '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             + #13 +
         '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          + #13 +
         '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          + #13 +

         '  -1'                                                                           +  ' AS IDITEMEMPTMO, '       + #13 +
         '  -1'                                                                           +  ' AS EVENTOITEM, '         + #13 +
         '  -1'                                                                           +  ' AS ORIGEMITEM, '         + #13 +
         '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             + #13 +
         '  ' + IntToStr(iOrigem)                                                         +  ' AS HMEORIGEM, '             + #13 +
         '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             + #13 +
         '  -1'                                                                           +  ' AS SEQCALCULO, '         + #13 +

         '  ' + NumeroIngles(fVlrAmortizacao)                                             +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

         '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                       +  ' AS PARCATUAL, '          + #13 +
         ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS NUMPARCELAS, '        + #13 +

         '  -1'                                                                           +  ' AS CENTRALIZA, '         + #13 +
         '  -1'                                                                           +  ' AS DESTACADO, '          + #13 +

         '  0'                                                                            +  ' AS FLGENVIO, '           + #13 +
         '  0'                                                                            +  ' AS FLGBAIXADO, '         + #13 +
         '  0'                                                                            +  ' AS FLGESTORNADO, '       + #13 +
         '  0'                                                                            +  ' AS FLGABONADO, '         + #13 +
         '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))                 +  ' AS DATAEVENTO, '         + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAPREVISTA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAEFETIVA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAATUALIZA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAVENCTO, '         + #13 +

         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt))            +  ' AS COMPETENCIA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt))            +  ' AS COBRANCA, '           + #13 +

         // André Pontes - 10/08/2004
         '  ' + NumeroIngles(rContrato.VlrContrato)                                       +  ' AS VALORSOLICANT, '      + #13 +
         '  0'                                                                            +  ' AS SALDOQUITACAO, '      + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITOANT, '     + #13 +
         ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS PRAZOANT, '           + #13 +
         // FIM André Pontes - 10/08/2004

         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VLRPREVISTO, '        + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VALRECCRED, '         + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VLREFETIVO, '         + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS SALDODEV, '           + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                   +  ' AS TXJUROS, '            + #13 +
         '  ' + IntToStr(rContrato.NumParcelas)                                           +  ' AS NOVOPRAZO, '          + #13 +
         '  ' + NumeroIngles(fVlrSegAnt)                                                  +  ' AS VLRSEGANT, '          + #13 +
         '  ' + NumeroIngles(fVlrSegComplAnt)                                             +  ' AS VLRSEGCOMPLANT '      + #13 +
         'FROM '                                                                                                        + #13 +
         '  DUAL ';

         // armazena SQL montado no vetor
         vSQL[i] := sSQL;

         // incrementa a variável de índice do vetor
         inc(i);


         // ----------------------------------------------------------------------------------------
         //    Monta a SEGUNDA linha do SQL (linha do Saldo Devedor "Posterior")
         // ----------------------------------------------------------------------------------------

         SetLength(vSQL, i + 1);

         sSQL := '/* -------------- Saldo Devedor "Posterior" -------------------------------------- */ ' + #13 +
         'SELECT '                                                                                                      + #13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   + #13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

         // André Pontes - 10/08/2004
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOANT, '          + #13 +
         // FIM André Pontes - 10/08/2004

         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       + #13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        + #13 +
         '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          + #13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          + #13 +
         '  ' + IntToStr(iRepactuacao)                                                    +  ' AS REPACTUACAO, '        + #13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         + #13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             + #13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       + #13 +

         '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             + #13 +
         '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          + #13 +
         '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          + #13 +

         '  -2'                                                                           +  ' AS IDITEMEMPTMO, '       + #13 +
         '  -2'                                                                           +  ' AS EVENTOITEM, '         + #13 +
         '  -2'                                                                           +  ' AS ORIGEMITEM, '         + #13 +
         '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             + #13 +
         '  ' + IntToStr(iOrigem)                                                         +  ' AS HMEORIGEM, '          + #13 +
         '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             + #13 +
         '  -2'                                                                           +  ' AS SEQCALCULO, '         + #13 +

         '  ' + NumeroIngles(fVlrAmortizacao)                                             +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

         '  ' + IntToStr(rSaldosAntPos.iParcelaPos)                                       +  ' AS PARCATUAL, '          + #13 +
         ' 0' + IntToStr(rSaldosAntPos.iParcRestaPos)                                     +  ' AS NUMPARCELAS, '        + #13 +

         '  -2'                                                                           +  ' AS CENTRALIZA, '         + #13 +
         '  -2'                                                                           +  ' AS DESTACADO, '          + #13 +

         '  0'                                                                            +  ' AS FLGENVIO, '           + #13 +
         '  0'                                                                            +  ' AS FLGBAIXADO, '         + #13 +
         '  0'                                                                            +  ' AS FLGESTORNADO, '       + #13 +
         '  0'                                                                            +  ' AS FLGABONADO, '         + #13 +
         '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        + #13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))                 +  ' AS DATAEVENTO, '         + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAPREVISTA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAEFETIVA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAATUALIZA, '       + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAVENCTO, '         + #13 +

         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos))            +  ' AS COMPETENCIA, '        + #13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos))            +  ' AS COBRANCA, '           + #13 +

         // André Pontes - 10/08/2004
         '  ' + NumeroIngles(rContrato.VlrContrato)                                       +  ' AS VALORSOLICANT, '      + #13 +
         '  0'                                                                            +  ' AS SALDOQUITACAO, '      + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITOANT, '     + #13 +
         ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS PRAZOANT, '           + #13 +
         // FIM André Pontes - 10/08/2004

         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS VLRPREVISTO, '        + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS VALRECCRED, '         + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS VLREFETIVO, '         + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS SALDODEV, '           + #13 +
         '  ' + NumeroIngles(rSaldosAntPos.fTxJurosPos)                                   +  ' AS TXJUROS, '            + #13 +
         '  ' + IntToStr(rContrato.NumParcelas)                                           +  ' AS NOVOPRAZO, '          + #13 +
         '  ' + NumeroIngles(fVlrSegAnt)                                                  +  ' AS VLRSEGANT, '          + #13 +
         '  ' + NumeroIngles(fVlrSegComplAnt)                                             +  ' AS VLRSEGCOMPLANT '      + #13 +
         'FROM '                                                                                                        + #13 +
         '  DUAL ';

         (* armazeno SQL montado no vetor *)
         vSQL[i] := sSQL;

         (* incrementa a variável de índice do vetor *)
         inc(i);


         (* ----------------------------------------------------------------------------------------- *)
         (*    Monta as linhas dos itens DE CONCESSÃO                                                 *)
         (* ----------------------------------------------------------------------------------------- *)

         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
            ParamByName('PHMETIPOMOV').AsInteger      := 0;
            Open;
            First;
            bCabecalho := True;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
            sCabecalho := '';
            if bCabecalho then
            begin
               sCabecalho := '/* -------------- Itens de Concessão --------------------------------------------- */ ' + #13;
               bCabecalho := False;
            end;

            (* array dinâmico *)
            SetLength(vSQL, i + 1);

            sSQL := sCabecalho +
            'SELECT '                                                                                                   + #13 +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + #13 +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

            // André Pontes - 10/08/2004
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOANT, '          + #13 +
            // FIM André Pontes - 10/08/2004

            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + #13 +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + #13 +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + #13 +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + #13 +
            '  ' + IntToStr(iRepactuacao)                                                 +  ' AS REPACTUACAO, '        + #13 +

            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + #13 +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + #13 +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + #13 +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + #13 +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + #13 +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger)                    +  ' AS ORIGEMITEM, '         + #13 +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS HMEORIGEM, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +
            '  0'                                                                         +  ' AS SEQCALCULO, '         + #13 +

            '  ' + NumeroIngles(fVlrAmortizacao)                                          +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          + #13 +
            ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         + #13 +
            '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))                                   +  ' AS DATAEVENTO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))   +  ' AS DATAPREVISTA, '    + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))    +  ' AS DATAEFETIVA, '     + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))   +  ' AS DATAATUALIZA, '    + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))     +  ' AS DATAVENCTO, '      + #13 +

            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)              +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                         +  ' AS COMPETENCIA, ' + #13 +
            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                 +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                            +  ' AS COBRANCA, '    + #13 +

            // André Pontes - 10/08/2004
            '  ' + NumeroIngles(rContrato.VlrContrato)                                    +  ' AS VALORSOLICANT, '      + #13 +
            '  0'                                                                         +  ' AS SALDOQUITACAO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITOANT, '     + #13 +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS PRAZOANT, '           + #13 +
            // FIM André Pontes - 10/08/2004

            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VLRPREVISTO, '        + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VALRECCRED, '         + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)              +  ' AS VLREFETIVO, '         + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                +  ' AS SALDODEV, '           + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                 +  ' AS TXJUROS, '            + #13 +
            '  ' + IntToStr(rContrato.NumParcelas)                                        +  ' AS NOVOPRAZO, '          + #13 +
            '  ' + NumeroIngles(fVlrSegAnt)                                               +  ' AS VLRSEGANT, '          + #13 +
            '  ' + NumeroIngles(fVlrSegComplAnt)                                          +  ' AS VLRSEGCOMPLANT '      + #13 +
            'FROM '                                                                                                     + #13 +
            '  DUAL ';

            // armazeno SQL montado no vetor
            vSQL[i] := sSQL;

            // Existe uma ordem de sequência de cálculo e para cada item o
            //   resultado do item anteriormente calculado tem que ser passado no SQL
            //   que será submetido para a Regra.  É usado este laço para juntar TODOS
            //   os SQLs, montando o SQL completo que será passado para Regra para
            //   cálculo do item

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then
               begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
               end;
            end;

            // incrementa a variável de índice do vetor
            inc(i);

            // incrementa o Contador
            inc(iContador);

            // Próximo item Aberto
            dtmCalcEmptmo.qryItens.Next;

         end;  // while

         // André Pontes - 09/01/2004
         //    Foi pedido pela FUNCEF que as regras de amortização recebam os itens de
         //    seguro complementar (refinanciamento) do contrato

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas do item de seguro complementar (amortização)
            // -------------------------------------------------------------------------------------
            with dtmCalcEmptmo.qryItens do
            begin
               LimpaParametros(dtmCalcEmptmo.qryItens);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
               ParamByName('PIDITEMEMPTMO').AsInteger    := dtmEmptmo.qryParamEmptmoIDITEMSEGCOMPL.AsInteger;
               Open;
               First;
               bCabecalho := True;
            end;

            while not(dtmCalcEmptmo.qryItens.EOF) do
            begin
               sCabecalho := '';
               if bCabecalho then
               begin
                  sCabecalho := '/* -------------- Itens de Amortização Anteriores ---------------------------------- */ ' + #13;
                  bCabecalho := False;
               end;

               (* array dinâmico *)
               SetLength(vSQL, i + 1);

               sSQL := sCabecalho +
               'SELECT '                                                                                                   + #13 +
               '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + #13 +
               '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

               // André Pontes - 10/08/2004
               '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOANT, '          + #13 +
               // FIM André Pontes - 10/08/2004

               '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + #13 +
               '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + #13 +
               '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + #13 +
               '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + #13 +
               '  ' + IntToStr(iRepactuacao)                                                 +  ' AS REPACTUACAO, '        + #13 +

               '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + #13 +

               '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + #13 +
               '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + #13 +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + #13 +

               '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + #13 +
               '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + #13 +
               '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger)                    +  ' AS ORIGEMITEM, '         + #13 +
               '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + #13 +
               '  ' + IntToStr(iOrigem)                                                      +  ' AS HMEORIGEM, '             + #13 +
               '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +
               '  0'                                                                         +  ' AS SEQCALCULO, '         + #13 +

               '  ' + NumeroIngles(fVlrAmortizacao)                                          +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          + #13 +
               ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         + #13 +
               '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        + #13 +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))                                   +  ' AS DATAEVENTO, '      + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))   +  ' AS DATAPREVISTA, '    + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))    +  ' AS DATAEFETIVA, '     + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))   +  ' AS DATAATUALIZA, '    + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))     +  ' AS DATAVENCTO, '      + #13 +

               '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)              +
                      FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                         +  ' AS COMPETENCIA, ' + #13 +
               '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                 +
                      FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                            +  ' AS COBRANCA, '    + #13 +

               // André Pontes - 10/08/2004
               '  ' + NumeroIngles(rContrato.VlrContrato)                                    +  ' AS VALORSOLICANT, '      + #13 +
               '  0'                                                                         +  ' AS SALDOQUITACAO, '      + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITOANT, '     + #13 +
               ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS PRAZOANT, '           + #13 +
               // FIM André Pontes - 10/08/2004

               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VLRPREVISTO, '        + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VALRECCRED, '         + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)              +  ' AS VLREFETIVO, '         + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                +  ' AS SALDODEV, '           + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                 +  ' AS TXJUROS, '            + #13 +
               '  ' + IntToStr(rContrato.NumParcelas)                                        +  ' AS NOVOPRAZO, '          + #13 +
               '  ' + NumeroIngles(fVlrSegAnt)                                               +  ' AS VLRSEGANT, '          + #13 +
               '  ' + NumeroIngles(fVlrSegComplAnt)                                          +  ' AS VLRSEGCOMPLANT '      + #13 +
               'FROM '                                                                                                     + #13 +
               '  DUAL ';

               // armazeno SQL montado no vetor
               vSQL[i] := sSQL;

               // Existe uma ordem de sequência de cálculo e para cada item o
               //   resultado do item anteriormente calculado tem que ser passado no SQL
               //   que será submetido para a Regra.  É usado este laço para juntar TODOS
               //   os SQLs, montando o SQL completo que será passado para Regra para
               //   cálculo do item

               for j := 0 to High(vSQL) do
               begin
                  if j <= 0 then
                  begin
                     sSQLExec := vSQL[j];
                  end
                  else
                  begin
                     sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
                  end;
               end;

               // incrementa a variável de índice do vetor
               inc(i);

               // incrementa o Contador
               inc(iContador);

               // Próximo item Aberto
               dtmCalcEmptmo.qryItens.Next;
               // -------------------------------------------------------------------------------------
            end;  // while not(dtmCalcEmptmo.qryItens.EOF)
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
         // FIM André Pontes - 07/01/2004

         // André Pontes - 09/09/2004
         //    Foi pedido pela FUNCEF que as regras de amortização recebam os itens de
         //    devolução de seguro na redução de prazo

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas do item de seguro complementar (amortização)
            // -------------------------------------------------------------------------------------
            with dtmCalcEmptmo.qryItens do
            begin
               LimpaParametros(dtmCalcEmptmo.qryItens);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
               ParamByName('PIDITEMEMPTMO').AsInteger    := 29; // Devolução de Seguro na Redução de Prazo
               Open;
               First;
               bCabecalho := True;
            end;

            while not(dtmCalcEmptmo.qryItens.EOF) do
            begin
               sCabecalho := '';
               if bCabecalho then
               begin
                  sCabecalho := '/* -------------- Itens de Amortização Anteriores ---------------------------------- */ ' + #13;
                  bCabecalho := False;
               end;

               (* array dinâmico *)
               SetLength(vSQL, i + 1);

               sSQL := sCabecalho +
               'SELECT '                                                                                                   + #13 +
               '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + #13 +
               '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

               // André Pontes - 10/08/2004
               '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOANT, '          + #13 +
               // FIM André Pontes - 10/08/2004

               '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + #13 +
               '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + #13 +
               '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + #13 +
               '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + #13 +
               '  ' + IntToStr(iRepactuacao)                                                 +  ' AS REPACTUACAO, '        + #13 +

               '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + #13 +

               '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + #13 +
               '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + #13 +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + #13 +

               '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + #13 +
               '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + #13 +
               '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger)                    +  ' AS ORIGEMITEM, '         + #13 +
               '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + #13 +
               '  ' + IntToStr(iOrigem)                                                      +  ' AS HMEORIGEM, '             + #13 +
               '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +
               '  0'                                                                         +  ' AS SEQCALCULO, '         + #13 +

               '  ' + NumeroIngles(fVlrAmortizacao)                                          +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          + #13 +
               ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          + #13 +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       + #13 +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         + #13 +
               '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        + #13 +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))                                   +  ' AS DATAEVENTO, '      + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))   +  ' AS DATAPREVISTA, '    + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))    +  ' AS DATAEFETIVA, '     + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))   +  ' AS DATAATUALIZA, '    + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))     +  ' AS DATAVENCTO, '      + #13 +

               '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)              +
                      FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                         +  ' AS COMPETENCIA, ' + #13 +
               '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                 +
                      FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                            +  ' AS COBRANCA, '    + #13 +

               // André Pontes - 10/08/2004
               '  ' + NumeroIngles(rContrato.VlrContrato)                                    +  ' AS VALORSOLICANT, '      + #13 +
               '  0'                                                                         +  ' AS SALDOQUITACAO, '      + #13 +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITOANT, '     + #13 +
               ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS PRAZOANT, '           + #13 +
               // FIM André Pontes - 10/08/2004

               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VLRPREVISTO, '        + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VALRECCRED, '         + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)              +  ' AS VLREFETIVO, '         + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                +  ' AS SALDODEV, '           + #13 +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                 +  ' AS TXJUROS, '            + #13 +
               '  ' + IntToStr(rContrato.NumParcelas)                                        +  ' AS NOVOPRAZO, '          + #13 +
               '  ' + NumeroIngles(fVlrSegAnt)                                               +  ' AS VLRSEGANT, '          + #13 +
               '  ' + NumeroIngles(fVlrSegComplAnt)                                          +  ' AS VLRSEGCOMPLANT '      + #13 +
               'FROM '                                                                                                     + #13 +
               '  DUAL ';

               // armazeno SQL montado no vetor
               vSQL[i] := sSQL;

               // Existe uma ordem de sequência de cálculo e para cada item o
               //   resultado do item anteriormente calculado tem que ser passado no SQL
               //   que será submetido para a Regra.  É usado este laço para juntar TODOS
               //   os SQLs, montando o SQL completo que será passado para Regra para
               //   cálculo do item

               for j := 0 to High(vSQL) do
               begin
                  if j <= 0 then
                  begin
                     sSQLExec := vSQL[j];
                  end
                  else
                  begin
                     sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
                  end;
               end;

               // incrementa a variável de índice do vetor
               inc(i);

               // incrementa o Contador
               inc(iContador);

               // Próximo item Aberto
               dtmCalcEmptmo.qryItens.Next;
               // -------------------------------------------------------------------------------------
            end;  // while not(dtmCalcEmptmo.qryItens.EOF)
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
         // FIM André Pontes - 09/09/2004

         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens de Amortização
         // ----------------------------------------------------------------------------------------

         dtmCalcEmptmo.qryBuscaItens.First;
         bCabecalho := True;
         while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
         begin
            SetLength(vSQL, i + 1); // array dinâmico

            sSQL :=
            'SELECT '                                                                                                   + #13 +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + #13 +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

            // André Pontes - 10/08/2004
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOANT, '          + #13 +
            // FIM André Pontes - 10/08/2004

            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + #13 +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + #13 +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + #13 +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + #13 +
            '  ' + IntToStr(iRepactuacao)                                                 +  ' AS REPACTUACAO, '        + #13 +

            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + #13 +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + #13 +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + #13 +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + #13 +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + #13 +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)            +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString + ' */' + #13 +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTOITEM, '         + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         + #13 +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS HMEORIGEM, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)           +  ' AS SEQCALCULO, '         + #13 +

            '  ' + NumeroIngles(fVlrAmortizacao)                                          +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

            '  ' + IntToStr(rSaldosAntPos.iParcelaPos)                                    +  ' AS PARCATUAL, '          + #13 +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaPos)                                  +  ' AS NUMPARCELAS, '        + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)           +  ' AS CENTRALIZA, '         + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)            +  ' AS DESTACADO, '          + #13 +

            '  0'                                                                         +  ' AS FLGENVIO, '           + #13 +
            '  0'                                                                         +  ' AS FLGBAIXADO, '         + #13 +
            '  0'                                                                         +  ' AS FLGESTORNADO, '       + #13 +
            '  0'                                                                         +  ' AS FLGABONADO, '         + #13 +
            '  ' + QuotedStr(rContrato.FlgFormaRec)                                       +  ' AS FLGFORMACOB, '        + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))              +  ' AS DATAEVENTO, '         + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))              +  ' AS DATAPREVISTA, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                             +  ' AS DATAEFETIVA, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))     +  ' AS DATAATUALIZA, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))              +  ' AS DATAVENCTO, '         + #13 +

            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataAmortizacao))                  +  ' AS COMPETENCIA, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataAmortizacao))                  +  ' AS COBRANCA, '           + #13 +

            // André Pontes - 10/08/2004
            '  ' + NumeroIngles(rContrato.VlrContrato)                                    +  ' AS VALORSOLICANT, '      + #13 +
            '  0'                                                                         +  ' AS SALDOQUITACAO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITOANT, '     + #13 +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS PRAZOANT, '           + #13 +
            // FIM André Pontes - 10/08/2004

            '  0'                                                                         +  ' AS VLRPREVISTO, '        + #13 +
            '  0'                                                                         +  ' AS VALRECCRED, '         + #13 +
            '  0'                                                                         +  ' AS VLREFETIVO, '         + #13 +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                               +  ' AS SALDODEV, '           + #13 +
            '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                +  ' AS TXJUROS, '            + #13 +
            '  ' + IntToStr(rContrato.NumParcelas)                                        +  ' AS NOVOPRAZO, '          + #13 +
            '  ' + NumeroIngles(fVlrSegAnt)                                               +  ' AS VLRSEGANT, '          + #13 +
            '  ' + NumeroIngles(fVlrSegComplAnt)                                          +  ' AS VLRSEGCOMPLANT '      + #13 +
            'FROM '                                                                                                     + #13 +
            '  DUAL ';

            vSQL[i] := sSQL;

            // Como no caso dos itens de concessão, existe uma ordem de sequência de
            //   cálculo e para cada item o resultado do item anteriormente calculado
            //   tem que ser passado no SQL que será submetido para a Regra.  É usado
            //   este laço para juntar TODOS os SQLs, montando o SQL completo que será
            //   passado para Regra para cálculo do item

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
               end;
            end;

            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               sSQLExec := sSQLExec + ' ORDER BY EVENTOITEM, SEQCALCULO, DATAPREVISTA ';
            end
            else
            begin
               sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO, DATAPREVISTA ';
            end;

            if not(UtilizaRegraValor(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger, sSQLExec,
                                     'e ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString,
                                     sValor,(* Resultado da Regra passado como Referência *)
                                     bMostraMsg)) then
            begin
               Result := False;  // Regra Executada com Erro
               Exit;
            end;

            // Tento Armazenar no Vetor que será o Result da função o VALOR do item.
            //   Caso não consiga, é porque a regra em vez de valor retornou FALSE
            try
               // Não gravar item com valor ZERO
               if (sValor = 'NULO') then
               begin

                  // Próximo item de Amortização
                  dtmCalcEmptmo.qryBuscaItens.Next;

                  // incrementa o Contador
                  inc(iContador);

                  // incrementa a variável de índice do vetor do SQL
                  inc(i);

                  if bMostraProgresso then frmProgresso.AndaFormProgresso(iContador);

                  Continue;
               end;

            except
               MsgDlg('Operação Cancelada!', 'Empréstimo', mtError, [mbOk], 0);
               Exit;
            end;

            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------
            //
            //     SUBSTITUIÇÃO no SQL do Itens que acabou de ser CALCULADO
            //
            //  Depois de executada a Regra a variável sValor já tem o VALOR do
            //  item calculado, logo é atualizado este valor na linha de SQL do
            //  vetor vSQL que acabou de ser executada pela regra.
            //
            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------

            sCabecalho := '';
            if bCabecalho then
            begin
               sCabecalho := '/* -------------- Itens de Amortização ------------------------------------------- */ ' + #13;
               bCabecalho := False;
            end;

            sSQL := sCabecalho +
            'SELECT '                                                                                                   + #13 +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + #13 +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + #13 +

            // André Pontes - 10/08/2004
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOANT, '          + #13 +
            // FIM André Pontes - 10/08/2004

            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + #13 +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + #13 +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + #13 +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + #13 +
            '  ' + IntToStr(iRepactuacao)                                                 +  ' AS REPACTUACAO, '        + #13 +

            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + #13 +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + #13 +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + #13 +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + #13 +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + #13 +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)            +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString + ' */' + #13 +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTOITEM, '         + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         + #13 +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS HMEORIGEM, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)           +  ' AS SEQCALCULO, '         + #13 +

            '  ' + NumeroIngles(fVlrAmortizacao)                                          +  ' AS VALORSOLIC, '         + '     /* Valor nominal da amortização */' + #13 +

            '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                    +  ' AS PARCATUAL, '          + #13 +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS NUMPARCELAS, '        + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)           +  ' AS CENTRALIZA, '         + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)            +  ' AS DESTACADO, '          + #13 +

            '  0'                                                                         +  ' AS FLGENVIO, '           + #13 +
            '  0'                                                                         +  ' AS FLGBAIXADO, '         + #13 +
            '  0'                                                                         +  ' AS FLGESTORNADO, '       + #13 +
            '  0'                                                                         +  ' AS FLGABONADO, '         + #13 +
            '  ' + QuotedStr(rContrato.FlgFormaRec)                                       +  ' AS FLGFORMACOB, '        + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))              +  ' AS DATAEVENTO, '         + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))              +  ' AS DATAPREVISTA, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                             +  ' AS DATAEFETIVA, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))     +  ' AS DATAATUALIZA, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAmortizacao))              +  ' AS DATAVENCTO, '         + #13 +

            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataAmortizacao))                  +  ' AS COMPETENCIA, '        + #13 +
            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataAmortizacao))                  +  ' AS COBRANCA, '           + #13 +

            // André Pontes - 10/08/2004
            '  ' + NumeroIngles(rContrato.VlrContrato)                                    +  ' AS VALORSOLICANT, '      + #13 +
            '  0'                                                                         +  ' AS SALDOQUITACAO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITOANT, '     + #13 +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS PRAZOANT, '           + #13 +
            // FIM André Pontes - 10/08/2004

            // aqui ocorre a substituição do valor pelo valor calculado

            //  Thiago Melo SOL 182298 KINTANA 1696751
            '  ' + NumeroIngles(StrToFloat(sValor))                                       +  ' AS VLRPREVISTO, '        + #13 +
            '  ' + NumeroIngles(StrToFloat(sValor))                                       +  ' AS VALRECCRED, '         + #13 +
            //  Thiago Melo SOL 182298 KINTANA 1696751 Fim
            '  0'                                                                         +  ' AS VLREFETIVO, '         + #13 +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                               +  ' AS SALDODEV, '           + #13 +
            '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                +  ' AS TXJUROS, '            + #13 +
            '  ' + IntToStr(rContrato.NumParcelas)                                        +  ' AS NOVOPRAZO, '          + #13 +
            '  ' + NumeroIngles(fVlrSegAnt)                                               +  ' AS VLRSEGANT, '          + #13 +
            '  ' + NumeroIngles(fVlrSegComplAnt)                                          +  ' AS VLRSEGCOMPLANT '      + #13 +
            'FROM '                                                                                                     + #13 +
            '  DUAL ';

            // armazeno SQL montado no vetor
            vSQL[i] := sSQL;


            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------
            //
            //    GRAVAÇÃO no Vetor que será o Result da função   
            //
            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------

            // Uso a procedure SetLength para criar mais um item dinâmicamente no array em memória.
            SetLength(vLista, k + 1);

            vLista[k].CodigoItem       := dtmCalcEmptmo.qryBuscaItensIDItemEmptmo.AsInteger;
            vLista[k].Nome             := dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString;
            vLista[k].iEvento          := iEvento;
            vLista[k].Origem           := iOrigem;

            vLista[k].SeqCalculo       := dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger;
            vLista[k].SeqCobranca      := 1;
            vLista[k].Prioridade       := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

            vLista[k].FlgCentraliza    := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
            vLista[k].FlgDestacado     := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
            vLista[k].IdItemCentraliza := dtmCalcEmptmo.qryBuscaItensIDITEMCENTRALIZA.AsInteger;

            vLista[k].AnoCompetencia   := DiasUteis.ExtraiAno(dDataAmortizacao);
            vLista[k].MesCompetencia   := DiasUteis.ExtraiMes(dDataAmortizacao);
            vLista[k].AnoCobranca      := DiasUteis.ExtraiAno(dDataAmortizacao);
            vLista[k].MesCobranca      := DiasUteis.ExtraiMes(dDataAmortizacao);

            vLista[k].DataPrevista     := dDataAmortizacao;

            vLista[k].Valor            := StrToFloat(ConverteVirg(sValor));

            vLista[k].Parcela          := rSaldosAntPos.iParcelaAnt;
            vLista[k].ParcelaAlt       := rSaldosAntPos.iParcelaAltAnt;
            vLista[k].ParcResta        := rSaldosAntPos.iParcRestaAnt;

            // calcula o novo saldo devedor
            case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
               0: begin (* Não Tratar *) end;
               1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor;  // Abater
               2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor;  // Incorporar
            end;

            vLista[k].SaldoDevedor     := fNovoSaldoDev;
            vLista[k].DataUltAtualiza  := rSaldosAntPos.dDataAtuPos;
            vLista[k].TxJuros          := rSaldosAntPos.fTxJurosAnt;

            vLista[k].FormaCobranca    := rContrato.FlgFormaRec;

            vLista[k].FlgEnvio         := 0;
            vLista[k].FlgBaixado       := 0;
            vLista[k].FlgDivergPend    := -1;

            vLista[k].RecPag           := 'R'; (* dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString *)

            vLista[k].Regra            := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;

            vLista[k].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

            // Armazeno no Vetor que será o Result da função a RUBRICA do item *)
            vLista[k].Rubrica          := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger;

            (* Armazeno no Vetor que será o Result da função o Débito da Inscricao/Contrato,
               isto é se a Cobrança será em Folha ou Contas a Receber *)
            vLista[k].FormaCobranca    := sFormaCobranca;

            dtmCalcEmptmo.qryBuscaItens.Next;
            inc(iContador);

            inc(i);  (* incrementa a variável de índice do vetor do SQL *)
            inc(k);  (* incrementa a variável de índice do vetor da Lista *)

         end;(* while qryBuscaItens *)

         Result := True;

      except
         Raise;
         if bMostraMsg then
         begin
            MsgDlg('Ocorreu um erro na Busca de Valores de um Item', 'Empréstimo', mtError, [mbOk], 0);
         end;
         Result := False;
      end;

   finally
      LimpaParametros(dtmCalcEmptmo.qryItens);
      LimpaParametros(dtmCalcEmptmo.qryBuscaItens);

      if bMostraProgresso then frmProgresso.EscondeFormProgresso;
   end;
end;



function TCalcEmptmo.CalculaItensQuitacao(const rContrato         : TDadosContrato;
                                          const iOrigem           : Integer;
                                          const dDataQuit         : TDateTime;
                                          const dDataMorte        : TDateTime;   // André Pontes - 14/06/2004 - pendência 16984
                                          const dDataAssinatura   : TDateTime;
                                          var   vLista            : TListaItem;
                                          const bMostraMsg        : Boolean;
                                          const bMostraProgresso  : Boolean;
                                          const bFinanciamento    : Boolean = False;
                                          const sArquivoLog       : String = ''
                                          //Pendência 22836 - 03/10/2006 - Alberto
                                         ;const bExcepcional        : Boolean = false
                                          //Fim Pendência 22836
                                         ): Boolean;
const
   iEvento = 3;
var
   rSaldosAntPos           : TSaldosAntPos;
   vSQL                    : array of String;
   sSQL, sSQLExec, sEstado : String;
   sValor, sCabecalho      : String;

   bTransacao              : Boolean;
   bCabecalho              : Boolean;
   i, j, k, iContador      : Integer;
   iPais, iCidade, iEstado : Int64;
   qryAux                  : TwwQuery;
   sNomeIndice             : String;

   fNovoSaldoDev           : Currency;
   fVlrProvPerda           : Currency;

   iQuantAberto            : Integer;
   iNumParcelas            : Integer;
   iNumParcPagas           : Integer;
   iNumParcRest            : Integer;
   sULTDATAQUIT            : String; //SOL131409
begin
   Result := False;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   //SOL131409

   sULTDATAQUIT         :='';

   qryAux.Close;
   qryAux.SQL.CLear;
   qryAux.SQL.Add(' SELECT MAX(h.hmedataprevista) AS ULTDATAQUIT ');
   qryAux.SQL.Add(' FROM histmovemptmo h ');
   qryAux.SQL.Add(' WHERE h.idcontratoemptmo = ' + FormatFloat('#0', rContrato.IDContratoEmptmo));
   qryAux.SQL.Add(' AND   h.hmetipomov = 3');
   qryAux.SQL.Add(' AND   h.hmecentraliza = 1');
   qryAux.SQL.Add(' AND   NVL(h.flgestornado,0) = 0');
   qryAux.Open;

   sULTDATAQUIT := qryAux.FieldByname('ULTDATAQUIT').asString;

   //SOL131409


   try
      try
         ParametrosSistema;
         iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
         iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
         iEstado     := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
         sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

         sValor      := '0';
         sSQL        := '';
         i           := 0;
         k           := 0;
         iContador   := 0;

         bTransacao  := False;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------


         sSQL :=
         'SELECT '                                                                              + #13 +
         '  CNT.NUMPARCELAS, '                                                                  + #13 +
         '  HME.HMENUMPARCELAS, '                                                               + #13 +
         '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS '                                             + #13 +
         'FROM '                                                                                + #13 +
         '  HISTMOVEMPTMO HME, '                                                                + #13 +
         '  CONTRATOEMPTMO CNT, '                                                               + #13 +
         '  TIPOCONTREMPTMO TIP, '                                                              + #13 +
         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA, '                                              + #13 +
         '     SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - '              +
              'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL '                                + #13 +
         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO H, '                                                               + #13 +
         '     CONTRATOEMPTMO C '                                                               + #13 +
         '  WHERE '                                                                             + #13 +
         '         ( C.IDPESSOA           = ' + IntToStr(rContrato.IDPessoa) + ' ) '            + #13 +
         '     AND ( C.IDBENEF            = ' + IntToStr(rContrato.IDBenef) + ' ) '             + #13 +
         '     AND ( H.HMECENTRALIZA      = 1 OR H.HMEDESTACADO = 1 ) '                         + #13 +
         '     AND ( C.FLGSITUACAO        NOT IN (''C'',''Q'') ) '                              + #13 +
         '     AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) '                              + #13 +
         '  GROUP BY '                                                                          + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA '                                               + #13 +
         '  HAVING '                                                                            + #13 +
         '         ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - '          +
                    'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) = 0 ) '                             + #13 +
         '     AND ( H.HMEPARCELA <> 0 ) '                                                      + #13 +
         '  ) PAG, '                                                                            + #13 +

         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                                        + #13 +
         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO '                                                                  + #13 +
         '  WHERE '                                                                             + #13 +
         '         ( IDCONTRATOEMPTMO     = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) '    + #13 +
         '     AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
         '     AND ( HMETIPOMOV           NOT IN (5, 8) '                                       + #13 +
         '  ) HST '                                                                             + #13 +

         'WHERE '                                                                               + #13 +
         '      ( CNT.IDPESSOA            = ' + IntToStr(rContrato.IDPessoa) + ' ) '            + #13 +
         '  AND ( CNT.IDBENEF             = ' + IntToStr(rContrato.IDBenef) + ' ) '             + #13 +
         '  AND ( CNT.IDTIPOCONTREMPTMO   = ' + IntToStr(rContrato.IDTipoContrEmptmo) + ' ) '   + #13 +
         '  AND ( CNT.FLGSITUACAO         NOT IN (''C'',''Q'') ) '                              + #13 +
         '  AND ( CNT.IDCONTRATOEMPTMO    = PAG.IDCONTRATOEMPTMO(+) ) '                         + #13 +
         '  AND ( CNT.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO ) '                           + #13 +
         '  AND ( HME.IDHISTMOVEMPTMO     = HST.IDHISTMOVEMPTMO ) '                             + #13 +
         'GROUP BY '                                                                            + #13 +
         '  CNT.NUMPARCELAS, HME.HMENUMPARCELAS ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         LogToFile('Após abrir query quantidade de parcelas em aberto', sArquivoLog);

         iNumParcPagas  := 0;
         iNumParcelas   := 0;
         iNumParcRest   := 0;

         // se a query estiver vazia, passa os valores zerados
         if not(qryAux.isEmpty) then
         begin
            if not(qryAux.FieldByName('NUMPARCPAGAS').IsNull) then   iNumParcPagas  := qryAux.FieldByName('NUMPARCPAGAS').AsInteger;
            if not(qryAux.FieldByName('NUMPARCELAS').IsNull) then    iNumParcelas   := qryAux.FieldByName('NUMPARCELAS').AsInteger;
            if not(qryAux.FieldByName('HMENUMPARCELAS').IsNull) then iNumParcRest   := qryAux.FieldByName('HMENUMPARCELAS').AsInteger;
         end;

         qryAux.Close;

         // ----------------------------------------------------------------------------------------

         sSQL :=
         'SELECT '                                                                           + #13 +
         '   COUNT(HME.IDITEMEMPTMO) AS QUANT '                                              + #13 +
         'FROM '                                                                             + #13 +
         '   HISTMOVEMPTMO HME '                                                             + #13 +
         'WHERE '                                                                            + #13 +
         '       HME.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', rContrato.IDContratoEmptmo)   + #13 +
         '   AND ( HME.HMECENTRALIZA   = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
         '   AND HME.HMETIPOMOV        NOT IN (0, 5, 8) '                                    + #13 +
         '   AND HME.FLGBAIXADO        = 0 ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         LogToFile('Após abrir query quantidade de itens em aberto', sArquivoLog);

         iQuantAberto := qryAux.FieldByName('QUANT').AsInteger;

         qryAux.Close;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
         dtmLookEmptmo.qryLookTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
         dtmLookEmptmo.qryLookTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
         dtmLookEmptmo.qryLookTipoContrato.Open;

         if (iOrigem = 3) and (iNumParcPagas < dtmLookEmptmo.qryLookTipoContratoTCEMINQUIT.AsInteger) then
         begin
            LogToFile('Parcelas pagas inferior ao permitido', sArquivoLog);

            MsgDlg('Número de Parcelas Pagas inferior ao permitido para quitação!', 'Empréstimo', mtError, [mbOk], 0);
            Result := False;
            dtmLookEmptmo.qryLookTipoContrato.Close;
            Exit;
         end;

         dtmLookEmptmo.qryLookTipoContrato.Close;

         qryAux.Close;

         LogToFile('Após teste de parcelas pagas', sArquivoLog);

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Busca total da provisão para perdas
         fVlrProvPerda := 0;
         if not(dtmEmptmo.qryParamEmptmoIDITEMPROVPERDA.IsNull) then
         begin
            fVlrProvPerda := TotalizaProvPerda(rContrato.IDContratoEmptmo);
            LogToFile('Total de prov perda: ' + FormatFloat('#,#0.00', fVlrProvPerda), sArquivoLog);
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // abertura da query dos itens de Quitação
         with dtmCalcEmptmo.qryBuscaItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
            ParamByName('PEVENTO').AsInteger            := 3;
            Open;
            First;
         end;

         // Configurando o Form com a Barra de Progresso
         if bMostraProgresso then frmProgresso.MostraFormProgresso('Calculando itens de Quitação...',
                                                                   True,
                                                                   False,
                                                                   True,
                                                                   0,
                                                                   dtmCalcEmptmo.qryBuscaItens.RecordCount
                                                                   );

         // ----------------------------------------------------------------------------------------

         // Passagem do saldo à data da morte apenas para FUNCEF
         // André Pontes - 28/07/2005 - pendência 19818
         // André Pontes - 26/01/2006 - pendência 20599 - REFER também
         if (iOrigem = 8) and ((Sistema.TipoCliente = 19971) or (Sistema.TipoCliente = 19991)) then
         begin
            // busca os saldos devedores (Anterior e "Posterior")
            rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                          dDataMorte,
                                                         );

            // Saldo Devedor
            fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;

            // ----------------------------------------------------------------------------------------
            //    Monta a linha do SQL que conterá o Saldo Devedor na Morte
            // ----------------------------------------------------------------------------------------
            SetLength(vSQL, i + 1);

            sSQL := // '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
            'SELECT '                                                                                                      +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                              +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                            + ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                            + ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                              +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836

            '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          +

            '  -3'                                                                           +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(rSaldosAntPos.dDataAtuPos))                               +  ' AS DATAORDENACAO, '      +

            '  -3'                                                                           +  ' AS IDITEMEMPTMO, '       +
            '  -3'                                                                           +  ' AS EVENTOITEM, '         +
            '  -3'                                                                           +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             +
            '  -3'                                                                           +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                       +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS NUMPARCELAS, '        +

            '  -3'                                                                           +  ' AS CENTRALIZA, '         +
            '  -3'                                                                           +  ' AS DESTACADO, '          +

            '  0'                                                                            +  ' AS FLGENVIO, '           +
            '  0'                                                                            +  ' AS FLGBAIXADO, '         +
            '  0'                                                                            +  ' AS FLGESTORNADO, '       +
            '  0'                                                                            +  ' AS FLGABONADO, '         +
            '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                        +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                       +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))                  +  ' AS DATASOLNOVO, '          +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAPREVISTA, '       +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAEFETIVA, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAATUALIZA, '       +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAVENCTO, '         +

            '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt))            +  ' AS COMPETENCIA, '        +
            '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt))            +  ' AS COBRANCA, '           +

            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VLRPREVISTO, '        +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                   +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                               +  ' AS VLRPROVPERDA, '       +

            '  ' + IntToStr(iQuantAberto)                                                    +  ' AS QUANTITEMABERTO, '    +
            '  ' + IntToStr(iNumParcPagas)                                                   +  ' AS NUMPARCPAGAS, '       +
            '  ' + IntToStr(iNumParcelas)                                                    +  ' AS PRAZOANT, '           +
            '  ' + IntToStr(iNumParcRest)                                                    +  ' AS PRAZOREST, '          +
            '  0'                                                                            +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409


            'FROM '                                                                                                        +
            '  DUAL ';

            vSQL[i] := sSQL;  // armazeno SQL montado no vetor
            inc(i);           // incrementa a variável de índice do vetor

            LogToFile('Após montar linha com saldo à data da morte', sArquivoLog);
         end;  // if iOrigem = 8

         // ----------------------------------------------------------------------------------------

         // busca os saldos devedores (Anterior e "Posterior")
         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                       dDataQuit,
                                                      );

         // Saldo Devedor
         fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;
         end;


         // ----------------------------------------------------------------------------------------
         //    Monta PRIMEIRA LINHA do SQL (linha do Saldo Devedor Anterior)
         // ----------------------------------------------------------------------------------------
         SetLength(vSQL, i + 1);

         sSQL := // '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
         'SELECT '                                                                                                      +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        +
         '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          +
         '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          +
         '  ' + IntToStr(rContrato.IdPessoa)                                              +  ' AS IDPESSOA,  ';

         if bFinanciamento then sSQL := sSQL +
         '  1'                                                                            + ' AS FLGFINANCIAMENTO, '
         else sSQL := sSQL +
         '  0'                                                                            + ' AS FLGFINANCIAMENTO, ';

         sSQL := sSQL +
         //Pendência 22836 - 03/10/2006 - Alberto
         '  0' + IntToStr(Ord(bExcepcional))                                              +  ' AS FLGEXCEPCIONAL, '     +
         //Fim Pendência 22836
         '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         +

         '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             +
         '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       +

         '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             +
         '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          +
         '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          +

         '  -2'                                                                           +  ' AS ORDENACAO, '          +
         '  0' + IntToStr(Trunc(rSaldosAntPos.dDataAtuPos))                               +  ' AS DATAORDENACAO, '      +

         '  -1'                                                                           +  ' AS IDITEMEMPTMO, '       +
         '  -1'                                                                           +  ' AS EVENTOITEM, '         +
         '  -1'                                                                           +  ' AS ORIGEMITEM, '         +
         '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             +
         '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             +
         '  -1'                                                                           +  ' AS SEQCALCULO, '         +

         '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                       +  ' AS PARCATUAL, '          +
         ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS NUMPARCELAS, '        +

         '  -1'                                                                           +  ' AS CENTRALIZA, '         +
         '  -1'                                                                           +  ' AS DESTACADO, '          +

         '  0'                                                                            +  ' AS FLGENVIO, '           +
         '  0'                                                                            +  ' AS FLGBAIXADO, '         +
         '  0'                                                                            +  ' AS FLGESTORNADO, '       +
         '  0'                                                                            +  ' AS FLGABONADO, '         +
         '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                        +  ' AS DATAEVENTO, '         +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                       +  ' AS DATAMORTE, '          +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))                  +  ' AS DATASOLNOVO, '          +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAPREVISTA, '       +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAEFETIVA, '        +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAATUALIZA, '       +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt))        +  ' AS DATAVENCTO, '         +

         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt))            +  ' AS COMPETENCIA, '        +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt))            +  ' AS COBRANCA, '           +

         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VLRPREVISTO, '        +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS VLREFETIVO, '         +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                                  +  ' AS SALDODEV, '           +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS SALDODEVPOS, '        +
         '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                   +  ' AS TXJUROS, '            +

         '  ' + NumeroIngles(fVlrProvPerda)                                               +  ' AS VLRPROVPERDA, '       +

         '  ' + IntToStr(iQuantAberto)                                                    +  ' AS QUANTITEMABERTO, '    +
         '  ' + IntToStr(iNumParcPagas)                                                   +  ' AS NUMPARCPAGAS, '       +
         '  ' + IntToStr(iNumParcelas)                                                    +  ' AS PRAZOANT, '           +
         '  ' + IntToStr(iNumParcRest)                                                    +  ' AS PRAZOREST, '          +
         '  0'                                                                            +  ' AS FLGSUSPENSAO '        +
         ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
         'FROM '                                                                                                        +
         '  DUAL ';

         vSQL[i] := sSQL;  // armazeno SQL montado no vetor
         inc(i);           // incrementa a variável de índice do vetor


         // ----------------------------------------------------------------------------------------
         //    Monta a SEGUNDA linha do SQL (linha do Saldo Devedor "Posterior")
         // ----------------------------------------------------------------------------------------
         SetLength(vSQL, i + 1);

         sSQL := // '/* -------------- Saldo Devedor "Posterior" -------------------------------------- */ ' + #13 +
         'SELECT '                                                                                                      +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        +
         '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          +
         '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          +
         '  ' + IntToStr(rContrato.IdPessoa)                                              +  ' AS IDPESSOA,  ';

         if bFinanciamento then sSQL := sSQL +
         '  1'                                                                            + ' AS FLGFINANCIAMENTO, '
         else sSQL := sSQL +
         '  0'                                                                            + ' AS FLGFINANCIAMENTO, ';

         sSQL := sSQL +
         //Pendência 22836 - 03/10/2006 - Alberto
         '  0' + IntToStr(Ord(bExcepcional))                                              +  ' AS FLGEXCEPCIONAL, '     +
         //Fim Pendência 22836
         '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         +

         '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             +
         '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       +

         '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             +
         '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          +
         '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          +

         '  -1'                                                                           +  ' AS ORDENACAO, '          +
         '  0' + IntToStr(Trunc(rSaldosAntPos.dDataAtuPos))                               +  ' AS DATAORDENACAO, '      +

         '  -2'                                                                           +  ' AS IDITEMEMPTMO, '       +
         '  -2'                                                                           +  ' AS EVENTOITEM, '         +
         '  -2'                                                                           +  ' AS ORIGEMITEM, '         +
         '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             +
         '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             +
         '  -2'                                                                           +  ' AS SEQCALCULO, '         +

         '  ' + IntToStr(rSaldosAntPos.iParcelaPos)                                       +  ' AS PARCATUAL, '          +
         ' 0' + IntToStr(rSaldosAntPos.iParcRestaPos)                                     +  ' AS NUMPARCELAS, '        +

         '  -2'                                                                           +  ' AS CENTRALIZA, '         +
         '  -2'                                                                           +  ' AS DESTACADO, '          +

         '  0'                                                                            +  ' AS FLGENVIO, '           +
         '  0'                                                                            +  ' AS FLGBAIXADO, '         +
         '  0'                                                                            +  ' AS FLGESTORNADO, '       +
         '  0'                                                                            +  ' AS FLGABONADO, '         +
         '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                        +  ' AS DATAEVENTO, '         +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                       +  ' AS DATAMORTE, '          +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))                  +  ' AS DATASOLNOVO, '          +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAPREVISTA, '       +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAEFETIVA, '        +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAATUALIZA, '       +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))        +  ' AS DATAVENCTO, '         +

         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos))            +  ' AS COMPETENCIA, '        +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos))            +  ' AS COBRANCA, '           +

         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS VLRPREVISTO, '        +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS VLREFETIVO, '         +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS SALDODEV, '           +
         '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                  +  ' AS SALDODEVPOS, '        +
         '  ' + NumeroIngles(rSaldosAntPos.fTxJurosPos)                                   +  ' AS TXJUROS, '            +

         '  ' + NumeroIngles(fVlrProvPerda)                                               +  ' AS VLRPROVPERDA, '       +

         '  ' + IntToStr(iQuantAberto)                                                    +  ' AS QUANTITEMABERTO, '    +
         '  ' + IntToStr(iNumParcPagas)                                                   +  ' AS NUMPARCPAGAS, '       +
         '  ' + IntToStr(iNumParcelas)                                                    +  ' AS PRAZOANT, '           +
         '  ' + IntToStr(iNumParcRest)                                                    +  ' AS PRAZOREST, '          +
         '  0'                                                                            +  ' AS FLGSUSPENSAO '        +
         ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
         'FROM '                                                                                                        +
         '  DUAL ';

         vSQL[i] := sSQL;  // armazeno SQL montado no vetor
         inc(i);           // incrementa a variável de índice do vetor

         LogToFile('Após montar linhas com saldo dev', sArquivoLog);

         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens DE CONCESSÃO
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
            ParamByName('PHMETIPOMOV').AsInteger      := 0;
            Open;
            First;
            bCabecalho := True;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
            sCabecalho := '';
            if bCabecalho then
            begin
               // sCabecalho := '/* -------------- Itens de Concessão --------------------------------------------- */ ' + #13;
               bCabecalho := False;
            end;

            SetLength(vSQL, i + 1); // array dinâmico

            sSQL := sCabecalho +
            'SELECT '                                                                                                   +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836
            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

            '  0'                                                                         +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))     +  ' AS DATAORDENACAO, '      +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
            '  0'                                                                         +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         +
            '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '     +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '      +

            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)               +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, ' +
            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                  +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '    +

            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)                 +  ' AS VLRPREVISTO, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)                  +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                    +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                   +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                     +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                                +  ' AS VLRPROVPERDA, '       +

            '  ' + IntToStr(iQuantAberto)                                                     +  ' AS QUANTITEMABERTO,'     +
            '  ' + IntToStr(iNumParcPagas)                                                    +  ' AS NUMPARCPAGAS,'        +
            '  ' + IntToStr(iNumParcelas)                                                     +  ' AS PRAZOANT,'            +
            '  ' + IntToStr(iNumParcRest)                                                     +  ' AS PRAZOREST, '          +
            ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                                +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
            'FROM '                                                                                                         +
            '  DUAL ';

            // -------------------------------------------------------------------------------------
            vSQL[i] := sSQL; // Armazena SQL montado no vetor

            // Existe uma ordem de sequência de cálculo e para cada item o
            //   resultado do item anteriormente calculado tem que ser passado no SQL
            //   que será submetido para a Regra.  É usado este laço para juntar TODOS
            //   os SQLs, montando o SQL completo que será passado para Regra para
            //   cálculo do item *)

               for j := 0 to High(vSQL) do
            begin
               if j <= 0 then
               begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec + ' UNION '  + vSQL[j];
               end;
            end;

            inc(i); // incrementa a variável de índice do vetor

            dtmCalcEmptmo.qryItens.Next; // Próximo item em aberto
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)
         LogToFile('Após montar linhas dos itens de concessão', sArquivoLog);

         // André Pontes - 07/01/2004
         //    Foi pedido pela FUNCEF que as regras de quitação recebam os itens de
         //    seguro complementar (refinanciamento) do contrato
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas do item de seguro complementar (amortização)
            // -------------------------------------------------------------------------------------
            with dtmCalcEmptmo.qryItens do
            begin
               LimpaParametros(dtmCalcEmptmo.qryItens);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
               ParamByName('PHMETIPOMOV').AsInteger      := 2;
               Open;
               First;
               bCabecalho := True;
            end;

            while not(dtmCalcEmptmo.qryItens.EOF) do
            begin
               sCabecalho := '';
               if bCabecalho then
               begin
                  // sCabecalho := '/* -------------- Itens de Amortização --------------------------------------------- */ ' + #13;
                  bCabecalho := False;
               end;

               SetLength(vSQL, i + 1); // array dinâmico

               sSQL := sCabecalho +
               'SELECT '                                                                                                   +
               '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
               '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
               '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
               '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
               '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
               '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
               '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

               if bFinanciamento then sSQL := sSQL +
               '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
               else sSQL := sSQL +
               '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

               sSQL := sSQL +
               //Pendência 22836 - 03/10/2006 - Alberto
               '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
               //Fim Pendência 22836
               '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

               '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
               '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

               '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
               '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
               '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensORDENACAO.AsInteger)                    +  ' AS ORDENACAO, '          +
               '  0' + IntToStr(Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))     +  ' AS DATAORDENACAO, '      +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         +
               '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
               '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
               '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
               '  0'                                                                         +  ' AS SEQCALCULO, '         +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          +
               ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          +

               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       +
               '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         +
               '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +

               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '    +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '     +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '    +
               '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '      +

               '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)               +
                      FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, ' +
               '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                  +
                      FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '    +

               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)                 +  ' AS VLRPREVISTO, '        +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)                  +  ' AS VLREFETIVO, '         +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                    +  ' AS SALDODEV, '           +
               '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                   +  ' AS SALDODEVPOS, '        +
               '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                     +  ' AS TXJUROS, '            +

               '  ' + NumeroIngles(fVlrProvPerda)                                                +  ' AS VLRPROVPERDA, '       +

               '  ' + IntToStr(iQuantAberto)                                                     +  ' AS QUANTITEMABERTO,'     +
               '  ' + IntToStr(iNumParcPagas)                                                    +  ' AS NUMPARCPAGAS,'        +
               '  ' + IntToStr(iNumParcelas)                                                     +  ' AS PRAZOANT,'            +
               '  ' + IntToStr(iNumParcRest)                                                     +  ' AS PRAZOREST, '          +
               ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                                +  ' AS FLGSUSPENSAO '        +
               ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409

               'FROM '                                                                                                         +
               '  DUAL ';

               // -------------------------------------------------------------------------------------
               vSQL[i] := sSQL; // Armazena SQL montado no vetor

               // Existe uma ordem de sequência de cálculo e para cada item o
               //   resultado do item anteriormente calculado tem que ser passado no SQL
               //   que será submetido para a Regra.  É usado este laço para juntar TODOS
               //   os SQLs, montando o SQL completo que será passado para Regra para
               //   cálculo do item *)

                  for j := 0 to High(vSQL) do
               begin
                  if j <= 0 then
                  begin
                     sSQLExec := vSQL[j];
                  end
                  else
                  begin
                     sSQLExec := sSQLExec + ' UNION '  + vSQL[j];
                  end;
               end;

               inc(i); // incrementa a variável de índice do vetor

               dtmCalcEmptmo.qryItens.Next; // Próximo item em aberto
               // -------------------------------------------------------------------------------------
            end;  // while not(dtmCalcEmptmo.qryItens.EOF)
            LogToFile('Após montar linhas dos itens de seguro complementar', sArquivoLog);
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
         // FIM André Pontes - 07/01/2004


         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens PENDENTES
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
            ParamByName('PFLGBAIXADO').AsInteger      := 0;
            ParamByName('PCENTRALIZA').AsInteger      := 1;

            // André Pontes - pendência 20261 - 07/10/2005
            if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
            begin
               ParamByName('PABONODIVERG').AsInteger := 1;
            end;

            Open;

            iQuantAberto := dtmCalcEmptmo.qryItens.RecordCount;

            First;

            bCabecalho := True;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
            sCabecalho := '';
            if bCabecalho then
            begin
               // sCabecalho := '/* -------------- Itens Pendentes ------------------------------------------------ */ ' + #13;
               bCabecalho := False;
            end;

            SetLength(vSQL, i + 1); // array dinâmico

            sSQL := sCabecalho +
            'SELECT '                                                                                                   +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836
            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensORDENACAO.AsInteger)                    +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))     +  ' AS DATAORDENACAO, '      +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger)                    +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
            '  0'                                                                         +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         +
            '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '     +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '      +

            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)               +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, ' +
            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                  +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '    +

            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)                 +  ' AS VLRPREVISTO, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)                  +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                    +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                   +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                     +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                                +  ' AS VLRPROVPERDA, '       +

            '  ' + IntToStr(iQuantAberto)                                                     +  ' AS QUANTITEMABERTO,'     +
            '  ' + IntToStr(iNumParcPagas)                                                    +  ' AS NUMPARCPAGAS,'        +
            '  ' + IntToStr(iNumParcelas)                                                     +  ' AS PRAZOANT,'            +
            '  ' + IntToStr(iNumParcRest)                                                     +  ' AS PRAZOREST, '          +
            ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                                +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
            'FROM '                                                                                                     +
            '  DUAL ';

            // -------------------------------------------------------------------------------------
            vSQL[i] := sSQL; // armazeno SQL montado no vetor

            // Existe uma ordem de sequência de cálculo e para cada item o
            //   resultado do item anteriormente calculado tem que ser passado no SQL
            //   que será submetido para a Regra.  É usado este laço para juntar TODOS
            //   os SQLs, montando o SQL completo que será passado para Regra para
            //   cálculo do item *)

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then
               begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec + ' UNION '  + vSQL[j];
               end;
            end;

            inc(i); // incrementa a variável de índice do vetor

            // Próximo item Aberto

            dtmCalcEmptmo.qryItens.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)
         LogToFile('Após montar linhas dos itens pendentes', sArquivoLog);

         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens FUTUROS PAGOS
         // ----------------------------------------------------------------------------------------

         with dtmCalcEmptmo.qryParcelasAVencer do
         begin
            LimpaParametros(dtmCalcEmptmo.qryParcelasAVencer);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAPREVISTA').AsDateTime := dDataQuit;
            Open;

            First;

            bCabecalho := True;
         end;

         while not(dtmCalcEmptmo.qryParcelasAVencer.EOF) do
         begin
            sCabecalho := '';
            if bCabecalho then
            begin
               // sCabecalho := '/* -------------- Itens Futuros ------------------------------------------------ */ ' + #13;
               bCabecalho := False;
            end;

            SetLength(vSQL, i + 1); // array dinâmico

            sSQL := sCabecalho +
            'SELECT '                                                                                                   +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836
            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerORDENACAO.AsInteger)          +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(dtmCalcEmptmo.qryParcelasAVencerHMEDATAPREVISTA.AsDateTime)) +  ' AS DATAORDENACAO, '+

            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerIDITEMEMPTMO.AsInteger)       +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' +
            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerHMETIPOMOV.AsInteger)         +  ' AS EVENTOITEM, '         +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
            '  0'                                                                         +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerHMEPARCELA.AsInteger)         +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerHMENUMPARCELAS.AsInteger)     +  ' AS NUMPARCELAS, '        +

            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerHMECENTRALIZA.AsInteger)      +  ' AS CENTRALIZA, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerHMEDESTACADO.AsInteger)       +  ' AS DESTACADO, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerFLGENVIO.AsInteger)           +  ' AS FLGENVIO, '           +
            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerFLGBAIXADO.AsInteger)         +  ' AS FLGBAIXADO, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerFLGESTORNADO.AsInteger)       +  ' AS FLGESTORNADO, '       +
            '  ' + IntToStr(dtmCalcEmptmo.qryParcelasAVencerFLGABONADO.AsInteger)         +  ' AS FLGABONADO, '         +
            '  ' + QuotedStr(dtmCalcEmptmo.qryParcelasAVencerHMEFORMACOBRANCA.AsString)   +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryParcelasAVencerHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryParcelasAVencerHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '     +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryParcelasAVencerHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryParcelasAVencerHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '      +

            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryParcelasAVencerHMEANOCOMPETENCIA.AsFloat)               +
                   FormatFloat('00', dtmCalcEmptmo.qryParcelasAVencerHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, ' +
            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryParcelasAVencerHMEANOCOBRANCA.AsFloat)                  +
                   FormatFloat('00', dtmCalcEmptmo.qryParcelasAVencerHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '    +

            '  ' + NumeroIngles(dtmCalcEmptmo.qryParcelasAVencerHMEVLRPREVISTO.AsFloat)                  +  ' AS VLRPREVISTO, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryParcelasAVencerHMEVLREFETIVO.AsFloat)                   +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryParcelasAVencerHMESALDODEV.AsFloat)                     +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                                              +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryParcelasAVencerHMETXJUROS.AsFloat)                      +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                                +  ' AS VLRPROVPERDA, '       +

            ' 0'                                                                              +  ' AS QUANTITEMABERTO,'     +
            ' 0'                                                                              +  ' AS NUMPARCPAGAS,'        +
            ' 0'                                                                              +  ' AS PRAZOANT,'            +
            ' 0'                                                                              +  ' AS PRAZOREST, '          +
            ' 0' + dtmCalcEmptmo.qryParcelasAVencerFLGSUSPENSAO.AsString                      +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
            'FROM '                                                                                                     +
            '  DUAL ';

            // -------------------------------------------------------------------------------------
            vSQL[i] := sSQL; // armazeno SQL montado no vetor

            // Existe uma ordem de sequência de cálculo e para cada item o
            //   resultado do item anteriormente calculado tem que ser passado no SQL
            //   que será submetido para a Regra.  É usado este laço para juntar TODOS
            //   os SQLs, montando o SQL completo que será passado para Regra para
            //   cálculo do item *)

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then
               begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec + ' UNION '  + vSQL[j];
               end;
            end;

            inc(i); // incrementa a variável de índice do vetor

            dtmCalcEmptmo.qryParcelasAVencer.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)
         LogToFile('Após montar linhas das parcelas a vencer', sArquivoLog);

         // ----------------------------------------------------------------------------------------
         //    Fim das linhas dos itens FUTUROS PAGOS
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens DO MÊS
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := rContrato.IDContratoEmptmo;
            ParamByName('PHMEANOCOMPETENCIA').AsInteger  := DiasUteis.ExtraiAno(dDataQuit);
            ParamByName('PHMEMESCOMPETENCIA').AsInteger  := DiasUteis.ExtraiMes(dDataQuit);
            ParamByName('PAGRUPADO').AsInteger           := 1;
            ParamByName('PEVENTOEXCLUSAO').AsInteger     := 3; // não leva em conta itens de quitação
            Open;
            First;
            bCabecalho := True;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
            sCabecalho := '';
            if bCabecalho then
            begin
               // sCabecalho := '/* -------------- Itens de mesma Competência ------------------------------------ */ ' + #13;
               bCabecalho := False;
            end;

            SetLength(vSQL, i + 1); // array dinâmico

            sSQL := sCabecalho +
            'SELECT '                                                                                                   +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836
            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensORDENACAO.AsInteger)                    +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))     +  ' AS DATAORDENACAO, '      +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
            '  0'                                                                         +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         +
            '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))   +  ' AS DATAPREVISTA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))    +  ' AS DATAEFETIVA, '     +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))   +  ' AS DATAATUALIZA, '    +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))     +  ' AS DATAVENCTO, '      +

            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)              +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                         +  ' AS COMPETENCIA, '     +
            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                 +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                            +  ' AS COBRANCA, '        +

            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VLRPREVISTO, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)              +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                               +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                 +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                               +  ' AS VLRPROVPERDA, '       +

            '  ' + IntToStr(iQuantAberto)                                                 +  ' AS QUANTITEMABERTO,'     +
            '  ' + IntToStr(iNumParcPagas)                                                +  ' AS NUMPARCPAGAS,'        +
            '  ' + IntToStr(iNumParcelas)                                                 +  ' AS PRAZOANT,'            +
            '  ' + IntToStr(iNumParcRest)                                                 +  ' AS PRAZOREST, '          +
            ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                            +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
            'FROM '                                                                                                     +
            '  DUAL ';

            // -------------------------------------------------------------------------------------
            vSQL[i] := sSQL; // armazeno SQL montado no vetor

            // Existe uma ordem de sequência de cálculo e para cada item o
            //   resultado do item anteriormente calculado tem que ser passado no SQL
            //   que será submetido para a Regra.  É usado este laço para juntar TODOS
            //   os SQLs, montando o SQL completo que será passado para Regra para
            //   cálculo do item

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then
               begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec +#13 + ' UNION '  + #13 + vSQL[j];
               end;
            end;

            inc(i); // incrementa a variável de índice do vetor

            // Próximo item Aberto
            dtmCalcEmptmo.qryItens.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)
         LogToFile('Após montar linhas dos itens do mês', sArquivoLog);


         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens de DE QUITAÇÃO
         // ----------------------------------------------------------------------------------------

         dtmCalcEmptmo.qryBuscaItens.First;
         bCabecalho := True;
         while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
         begin
             if bMostraProgresso then
             begin
                frmProgresso.AndaFormProgresso(iContador);
                if frmProgresso.Cancelou then Exit;
             end;

            SetLength(vSQL, i + 1); // array dinâmico

            sSQL :=
            'SELECT '                                                                                                   +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836
            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensORDENACAO.AsInteger)               +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(dDataQuit))                                            +  ' AS DATAORDENACAO, '      +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)            +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString + ' */' +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTOITEM, '         +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)           +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                    +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS NUMPARCELAS, '        +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)           +  ' AS CENTRALIZA, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)            +  ' AS DESTACADO, '          +

            '  0'                                                                         +  ' AS FLGENVIO, '           +
            '  0'                                                                         +  ' AS FLGBAIXADO, '         +
            '  0'                                                                         +  ' AS FLGESTORNADO, '       +
            '  0'                                                                         +  ' AS FLGABONADO, '         +
            '  ' + QuotedStr(rContrato.FlgFormaRec)                                       +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAPREVISTA, '       +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                             +  ' AS DATAEFETIVA, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))     +  ' AS DATAATUALIZA, '       +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAVENCTO, '         +

            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataQuit))                         +  ' AS COMPETENCIA, '        +
            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataQuit))                         +  ' AS COBRANCA, '           +

            '  0'                                                                         +  ' AS VLRPREVISTO, '        +
            '  0'                                                                         +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                               +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                               +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                            +  ' AS VLRPROVPERDA, '       +

            '  ' + IntToStr(iQuantAberto)                                                 +  ' AS QUANTITEMABERTO,'     +
            '  ' + IntToStr(iNumParcPagas)                                                +  ' AS NUMPARCPAGAS,'        +
            '  ' + IntToStr(iNumParcelas)                                                 +  ' AS PRAZOANT,'            +
            '  ' + IntToStr(iNumParcRest)                                                 +  ' AS PRAZOREST, '          +
            ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                            +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409

            'FROM '                                                                                                     +
            '  DUAL ';

            vSQL[i] := sSQL;


            // Como no caso dos itens de concessão, existe uma ordem de sequência de
            //   cálculo e para cada item o resultado do item anteriormente calculado
            //   tem que ser passado no SQL que será submetido para a Regra.  É usado
            //   este laço para juntar TODOS os SQLs, montando o SQL completo que será
            //   passado para Regra para cálculo do item *)

            for j := 0 to High(vSQL) do
            begin
               if j <= 0 then
               begin
                  sSQLExec := vSQL[j];
               end
               else
               begin
                  sSQLExec := sSQLExec + ' UNION '  + vSQL[j];
               end;
            end;

            // André Pontes - 04/03/2004
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               sSQLExec := sSQLExec + ' ORDER BY ORDENACAO, DATAORDENACAO, SEQCALCULO, DATAPREVISTA ';
            end
            else
            begin
               sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO, DATAPREVISTA ';
            end;
            // André Pontes - 04/03/2004

            // função que cria uma query e um objeto regra em tempo de execução,
            //   recebendo como parâmetro o SQL que será passado para a Regra, o número
            //   da regra, a mensagem de texto que será exibida caso haja erro e uma
            //   variável passada por referência que armazenará o Result da Regra.
            //   A função retornará se a Regra foi executada com êxito ou não *)

            LogToFile('Antes Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString, sArquivoLog);

            if not(UtilizaRegraValor(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger,
                                     sSQLExec,
                                     'e ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString,
                                     sValor, // Resultado da Regra passado como Referência
                                     bMostraMsg,
                                     (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1))) then
            begin
               // Regra Executada com Erro
               Result := False;
               Exit;
            end;
            LogToFile('Após Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString +
                      ': ' + sValor, sArquivoLog);

            // Tenta Armazenar no Vetor que será o Result da função o VALOR do item.
            //   Caso não consiga, é porque a regra em vez de valor retornou FALSE
            try
               // Não gravar item com valor ZERO
               if (sValor = 'NULO') then
               begin
                  // Próximo item de Quitação
                  dtmCalcEmptmo.qryBuscaItens.Next;

                  // incrementa o Contador
                  inc(iContador);

                  // incrementa a variável de índice do vetor do SQL
                  inc(i);

                  if bMostraProgresso then frmProgresso.AndaFormProgresso(iContador);

                  Continue;
               end;

            except
               LogToFile('Operação cancelada', sArquivoLog);

               MsgDlg('Operação Cancelada!', 'Empréstimo', mtError, [mbOk], 0);
               Exit;
            end;

            // -------------------------------------------------------------------------------------
            //     SUBSTITUIÇÃO no SQL do Itens que acabou de ser CALCULADO
            //
            //  Depois de executada a Regra a variável sValor já tem o VALOR do
            //  item calculado, logo é atualizado este valor na linha de SQL do
            //  vetor vSQL que acabou de ser executada pela regra.
            // -------------------------------------------------------------------------------------

            sCabecalho := '';
            if bCabecalho then
            begin
               sCabecalho := '/* -------------- Itens de Quitação ---------------------------------------------- */ ' + #13;
               bCabecalho := False;
            end;

            sSQL := sCabecalho +
            'SELECT '                                                                                                   +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
            '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
            '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
            '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
            '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
            '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
            '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  ';

            if bFinanciamento then sSQL := sSQL +
            '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
            else sSQL := sSQL +
            '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

            sSQL := sSQL +
            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     +
            //Fim Pendência 22836
            '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         +

            '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             +
            '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       +

            '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
            '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          +
            '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensORDENACAO.AsInteger)               +  ' AS ORDENACAO, '          +
            '  0' + IntToStr(Trunc(dDataQuit))                                            +  ' AS DATAORDENACAO, '      +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)            +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString + ' */' +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTOITEM, '         +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
            '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)           +  ' AS SEQCALCULO, '         +

            '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                    +  ' AS PARCATUAL, '          +
            ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS NUMPARCELAS, '        +

            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)           +  ' AS CENTRALIZA, '         +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)            +  ' AS DESTACADO, '          +

            '  0'                                                                         +  ' AS FLGENVIO, '           +
            '  0'                                                                         +  ' AS FLGBAIXADO, '         +
            '  0'                                                                         +  ' AS FLGESTORNADO, '       +
            '  0'                                                                         +  ' AS FLGABONADO, '         +
            '  ' + QuotedStr(rContrato.FlgFormaRec)                                       +  ' AS FLGFORMACOB, '        +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAEVENTO, '         +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataMorte))                    +  ' AS DATAMORTE, '          +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura))               +  ' AS DATASOLNOVO, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAPREVISTA, '       +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                             +  ' AS DATAEFETIVA, '        +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))     +  ' AS DATAATUALIZA, '       +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                     +  ' AS DATAVENCTO, '         +

            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataQuit))                         +  ' AS COMPETENCIA, '        +
            '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataQuit))                         +  ' AS COBRANCA, '           +

            // aqui ocorre a substituição do valor pelo valor calculado

            //  Thiago Melo SOL 182298 KINTANA 1696751
            '  ' + NumeroIngles(StrToFloat(sValor))                                       +  ' AS VLRPREVISTO, '        +

            '  0'                                                                         +  ' AS VLREFETIVO, '         +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevAnt)                               +  ' AS SALDODEV, '           +
            '  ' + NumeroIngles(rSaldosAntPos.fSaldoDevPos)                               +  ' AS SALDODEVPOS, '        +
            '  ' + NumeroIngles(rSaldosAntPos.fTxJurosAnt)                                +  ' AS TXJUROS, '            +

            '  ' + NumeroIngles(fVlrProvPerda)                                            +  ' AS VLRPROVPERDA, '       +

            '  ' + IntToStr(iQuantAberto)                                                 +  ' AS QUANTITEMABERTO,'     +
            '  ' + IntToStr(iNumParcPagas)                                                +  ' AS NUMPARCPAGAS,'        +
            '  ' + IntToStr(iNumParcelas)                                                 +  ' AS PRAZOANT,'            +
            '  ' + IntToStr(iNumParcRest)                                                 +  ' AS PRAZOREST, '          +
            ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                            +  ' AS FLGSUSPENSAO '        +
            ','+ QuotedStr(sULTDATAQUIT)                                                     +  ' AS ULTDATAQUIT '         + // SOL131409
            'FROM '                                                                                                     +
            '  DUAL ';

            // armazeno SQL montado no vetor
            vSQL[i] := sSQL;


            // -------------------------------------------------------------------------------------
            //    GRAVAÇÃO no Vetor que será o Result da função
            // -------------------------------------------------------------------------------------

            // Uso de SetLength para criar mais um item dinâmicamente no array em memória
            SetLength(vLista, k + 1);

            vLista[k].CodigoItem          := dtmCalcEmptmo.qryBuscaItensIDItemEmptmo.AsInteger;
            vLista[k].Nome                := dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString;
            vLista[k].iEvento             := iEvento;
            vLista[k].Origem              := iOrigem;

            vLista[k].SeqCalculo          := dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger;
            vLista[k].SeqCobranca         := 1;
            vLista[k].Prioridade          := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

            vLista[k].FlgCentraliza       := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
            vLista[k].FlgDestacado        := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
            vLista[k].IdItemCentraliza    := dtmCalcEmptmo.qryBuscaItensIDITEMCENTRALIZA.AsInteger;
            vLista[k].Rubrica             := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger;

            vLista[k].AnoCompetencia      := DiasUteis.ExtraiAno(dDataQuit);
            vLista[k].MesCompetencia      := DiasUteis.ExtraiMes(dDataQuit);
            vLista[k].AnoCobranca         := DiasUteis.ExtraiAno(dDataQuit);
            vLista[k].MesCobranca         := DiasUteis.ExtraiMes(dDataQuit);

            vLista[k].DataPrevista        := dDataQuit;

            vLista[k].Valor               := StrToFloat(ConverteVirg(sValor));

            vLista[k].Parcela             := rSaldosAntPos.iParcelaAnt;
            vLista[k].ParcelaAlt          := rSaldosAntPos.iParcelaAltAnt;
            vLista[k].ParcResta           := 0;

            // calcula o novo saldo devedor
            if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and (vLista[k].CodigoItem = 35 ) then
            begin
              if vLista[k].Valor <> 0 then begin //Renato Visoni 102371/ Kintana 455819
                fNovoSaldoDev := vLista[k].Valor;
              end;
            end;

            case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
               0: begin (* Não Tratar *) end;
               1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor; // Abater
               2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor; // Incorporar
            end;

            vLista[k].SaldoDevedor        := fNovoSaldoDev;

            // Data de Atualização do Saldo Devedor ------------------------------------------------
            // -------------------------------------------------------------------------------------
            vLista[k].DataUltAtualiza     := rSaldosAntPos.dDataAtuPos;

            vLista[k].TxJuros             := rSaldosAntPos.fTxJurosAnt;

            vLista[k].FormaCobranca       := rContrato.FlgFormaRec;

            vLista[k].FlgEnvio            := 0;
            vLista[k].FlgBaixado          := 0;
            vLista[k].FlgDivergPend       := -1;

            vLista[k].RecPag              := 'R'; // dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString;

            vLista[k].Regra               := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;

            vLista[k].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

            // -------------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------------

            LogToFile('Após preencher vLista', sArquivoLog);

            dtmCalcEmptmo.qryBuscaItens.Next;
            inc(iContador);

            inc(i);  // incrementa a variável de índice do vetor do SQL
            inc(k);  // incrementa a variável de índice do vetor da Lista

         end; // while not(dtmCalcEmptmo.qryBuscaItens.EOF)

         Result := True;

      except
         LogToFile('Erro (except)', sArquivoLog);
         Raise;
         if bMostraMsg then
         begin
            MsgDlg('Ocorreu um erro na Busca de Valores de um Item', 'Empréstimo', mtError, [mbOk], 0);
         end;
         Result := False;
      end;

   finally
      // se CalculaItens houver iniciado uma transacao, faz Rollback
      if bTransacao then
      begin
         RollBackTransacao;
         LogToFile('CalcEmptmo - Rollback Transaction', sArquivoLog);
      end
      else
      begin
         LogToFile('CalcEmptmo - NÃO Rollback Transaction', sArquivoLog);
      end;

      LimpaParametros(dtmCalcEmptmo.qryItens);
      LimpaParametros(dtmCalcEmptmo.qryBuscaItens);

      qryAux.Close;
      qryAux.Free;

      if bMostraProgresso then frmProgresso.EscondeFormProgresso;
   end;
end;



function TCalcEmptmo.CalculaItensQuitacaoNOVA(const rContrato         : TDadosContrato;
                                              const iOrigem           : Integer;
                                              const dDataQuit         : TDateTime;
                                              const dDataMorte        : TDateTime;   // André Pontes - 14/06/2004 - pendência 16984
                                              const dDataAssinatura   : TDateTime;
                                              var   vLista            : TListaItem;
                                              const bMostraMsg        : Boolean;
                                              const bMostraProgresso  : Boolean;
                                              const bFinanciamento    : Boolean = False;
                                              const sArquivoLog       : String = ''
                                              //Pendência 22836 - 03/10/2006 - Alberto
                                             ;const bExcepcional      : Boolean = false
                                              //Fim Pendência 22836
                                             ): Boolean;
const
   iEvento = 3;
var
   rSaldosAntPos           : TSaldosAntPos;
   sSQL,sSQLExec, sEstado  : String;
   sValor                  : String;

   bTransacao              : Boolean;
   i, j, k, iContador      : Integer;
   iPais, iCidade, iEstado : Int64;
   qryAux, qryAuxHist      : TwwQuery;
   sNomeIndice             : String;

   fNovoSaldoDev           : Currency;
   fVlrProvPerda           : Currency;
   fVlrResultRegra         : Currency;

   iCodDocumento           : Integer;//Fanuel Junior SOL153161
   iIdTmpDesc              : Integer;//Fanuel Junior SOL153161
   iOperacao               : Integer;//Fanuel Junior SOL153161
   iSitEnvio               : Integer;//Fanuel Junior SOL153161
   iIdHisMovEmtpmo         : Integer;//Fanuel Junior SOL153161
   
   iQuantAberto            : Integer;
   iNumParcelas            : Integer;
   iNumParcPagas           : Integer;
   iNumParcRest            : Integer;
   sULTDATAQUIT            : String; //SOL131409

   iFlgPerdaEfetiva        : Integer; //BRUNO AZEVEDO - VOTO DE EMPRESTIMO
begin

   Result               := False;
   sSQLExec             := '';
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   //SOL131409
   sULTDATAQUIT         :='';

   qryAux.Close;
   qryAux.SQL.CLear;
   qryAux.SQL.Add(' SELECT MAX(h.hmedataprevista) AS ULTDATAQUIT ');
   qryAux.SQL.Add(' FROM histmovemptmo h ');
   qryAux.SQL.Add(' WHERE h.idcontratoemptmo = ' + FormatFloat('#0', rContrato.IDContratoEmptmo));
   qryAux.SQL.Add(' AND   h.hmetipomov = 3');
   qryAux.SQL.Add(' AND   h.hmecentraliza = 1');
   qryAux.SQL.Add(' AND   NVL(h.flgestornado,0) = 0');
   qryAux.Open;

   sULTDATAQUIT := qryAux.FieldByname('ULTDATAQUIT').asString;
   //SOL131409

   iOperacao := -1;         //Fanuel Junior SOL153161
   iSitEnvio := -1;         //Fanuel Junior SOL153161
   iCodDocumento  := 0;  //Fanuel Junior SOL153161
   iIdTmpDesc   := 0;    //Fanuel Junior SOL153161
   iIdHisMovEmtpmo := 0; //Fanuel Junior SOL153161
   
   try
      try
         ParametrosSistema;
         iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
         iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
         iEstado     := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
         sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

         sValor      := '0';
         sSQL        := '';
         i           := 0;
         k           := 0;
         iContador   := 0;

         bTransacao  := False;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 16/12/2005

         //    Mudança de metodologia: a partir de agora, será aberta uma query (aberta agora) à qual
         //    serão adicionados os registros, em vez de se concatenar o SQL e passar para uma query
         //    que o Regra abriria na execução. O objetivo é contornar o estouro de memória que às
         //    vezes ocorre (talvez devido ao taamnho da string do SQL de entrada.

         dtmEmptmo.sqlRegra.SQL.Clear;
         dtmEmptmo.sqlRegra.SQL.Text := MontaSQLRegraQuitacao;
         dtmEmptmo.sqlRegra.Open;

         // FIM André Pontes - 16/12/2005
         // ----------------------------------------------------------------------------------------
         //Wylliam Leite da Silva - Sol: 253185 PPM: 2040335 - Fim

         sSQL :=
                  'SELECT                                                                         ' + #13 +
                  '  CNT.NUMPARCELAS,                                                             ' + #13 +
                  '  PCK_EMPRESTIMO.FN_ULTIMAPRESTACAO(CNT.IDCONTRATOEMPTMO) HMENUMPARCELAS,      ' + #13 +
                  '  PCK_EMPRESTIMO.FN_QUANTPARCELASPAGAS(CNT.IDCONTRATOEMPTMO) NUMPARCPAGAS      ' + #13 +
                  'FROM CONTRATOEMPTMO CNT                                                        ' + #13 +
                  'WHERE CNT.IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo)   + #13 +
                  '      AND CNT.FLGSITUACAO NOT IN (''C'',''Q'')';

(*
          sSQL :=
         'SELECT '                                                                              + #13 +
         '  CNT.NUMPARCELAS, '                                                                  + #13 +
         '  HME.HMENUMPARCELAS, '                                                               + #13 +
         '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS '                                             + #13 +
         'FROM '                                                                                + #13 +
         '  HISTMOVEMPTMO HME, '                                                                + #13 +
         '  CONTRATOEMPTMO CNT, '                                                               + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo
         //'  TIPOCONTREMPTMO TIP, '                                                              + #13 +
         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA, '                                              + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Inicio
         //'     SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - '              +
         //     'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL '                                + #13 +
         '     SUM(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0)) - '              +
              'SUM(NVL(H.HMEVLREFETIVO, 0)) AS TOTAL '                                + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Fim
         '  FROM '                                                                              + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Inicio
         '     HISTMOVEMPTMO H '                                                               + #13 +
         //'     CONTRATOEMPTMO C '                                                               + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Fim

         '  WHERE ' + #13 +
         
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Inicio                                                                           + #13 +
         //'         ( C.IDPESSOA           = ' + IntToStr(rContrato.IDPessoa) + ' ) '            + #13 +
         //'     AND ( C.IDBENEF            = ' + IntToStr(rContrato.IDBenef) + ' ) '             + #13 +
         //'     AND ( H.HMECENTRALIZA      = 1 OR H.HMEDESTACADO = 1 ) '                         + #13 +
         //Pendência 25772 - 25/04/2007 - Alberto
         //'     AND ( nvl(H.FLGABONADO,0) <> 1 ) '                                               + #13 +
         //'     AND ( nvl(H.FLGQUITADO, 0) <> 1 ) '                                              + #13 +
         //'     AND ( nvl(H.FLGESTORNADO,0) <> 1 ) '                                             + #13 +
         //Fim Pendência 25772
         //'     AND ( C.FLGSITUACAO        NOT IN (''C'',''Q'') ) '                              + #13 +
         //'     AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) '                              + #13 +

         '          H.HMECENTRALIZA + H.HMEDESTACADO = 1 '                                      + #13 +
         '     AND  H.HMETIPOMOV = 1 '                                                          + #13 +
         '     AND  nvl(H.FLGABONADO,0) = 0 '                                                   + #13 +
         '     AND  nvl(H.FLGQUITADO, 0) = 0 '                                                  + #13 +
         '     AND  nvl(H.FLGESTORNADO,0) = 0 '                                                 + #13 +
         '     AND  H.IDCONTRATOEMPTMO = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + #13 +

         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Fim

         '  GROUP BY '                                                                          + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA '                                               + #13 +
         '  HAVING '                                                                            + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Inicio
         //'         ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - '          +
         //           'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) <= 0 ) '                            + #13 +
         //'     AND ( H.HMEPARCELA <> 0 ) '                                                      + #13 +

         '         ( SUM(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0)) - '          +
                    'SUM(NVL(H.HMEVLREFETIVO, 0)) <= 0 ) '                            + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Fim
         '  ) PAG, '                                                                            + #13 +

         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                                        + #13 +
         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO '                                                                  + #13 +
         '  WHERE '                                                                             + #13 +

         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Inicio
         //'         ( IDCONTRATOEMPTMO     = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) '    + #13 +
         //'     AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
         //'     AND ( HMETIPOMOV          <> 5 ) '                                               + #13 +
         //Pendência 25772 - 25/04/2007 - Alberto
         //'     AND ( nvl(FLGABONADO,0) <> 1 ) '                                                 + #13 +
         //'     AND ( nvl(FLGQUITADO, 0) <> 1 ) '                                                + #13 +
         //Fim Pendência 25772
         //Pendência 25118 - 25/04/2007 - Alberto
         //'     AND ( nvl(FLGESTORNADO,0) <> 1 ) '                                               + #13 +
         //Fim Pendência 25118

         '           IDCONTRATOEMPTMO = '+ FormatFloat('#0', rContrato.IDContratoEmptmo)        + #13 +
         '       AND HMECENTRALIZA + HMEDESTACADO = 1 '                                         + #13 +
         '       AND HMETIPOMOV IN (0,1,2) '                                                    + #13 +
         '       AND nvl(FLGABONADO,0) = 0 '                                                    + #13 +
         '       AND nvl(FLGQUITADO, 0) = 0 '                                                   + #13 +
         '       AND nvl(FLGESTORNADO,0) = 0 '                                                  + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Fim

         '  ) HST '                                                                             + #13 +

         'WHERE '                                                                               + #13 +
         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Inicio
         //'      ( CNT.IDPESSOA            = ' + IntToStr(rContrato.IDPessoa) + ' ) '            + #13 +
         //'  AND ( CNT.IDBENEF             = ' + IntToStr(rContrato.IDBenef) + ' ) '             + #13 +
         //'  AND ( CNT.IDTIPOCONTREMPTMO   = ' + IntToStr(rContrato.IDTipoContrEmptmo) + ' ) '   + #13 +
         //'  AND ( CNT.FLGSITUACAO         NOT IN (''C'',''Q'') ) '                              + #13 +
         //'  AND ( CNT.IDCONTRATOEMPTMO    = PAG.IDCONTRATOEMPTMO(+) ) '                         + #13 +
         //'  AND ( CNT.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO ) '                           + #13 +
         //'  AND ( HME.IDHISTMOVEMPTMO     = HST.IDHISTMOVEMPTMO ) '                             + #13 +

         '        CNT.IDPESSOA            = '+ IntToStr(rContrato.IDPessoa)                     + #13 +
         '   AND CNT.IDBENEF             = '+ IntToStr(rContrato.IDBenef)                       + #13 +
         '   AND CNT.IDTIPOCONTREMPTMO   = '+IntToStr(rContrato.IDTipoContrEmptmo)              + #13 +
         '   AND CNT.FLGSITUACAO         NOT IN (''C'',''Q'') '                                 + #13 +
         '   AND CNT.IDCONTRATOEMPTMO    = PAG.IDCONTRATOEMPTMO(+) '                            + #13 +
         '   AND HME.IDHISTMOVEMPTMO     = HST.IDHISTMOVEMPTMO '                                + #13 +
         '   AND CNT.IDCONTRATOEMPTMO    = '+ IntToStr(rContrato.IDTipoContrEmptmo)             + #13 +

         //Wylliam Leite da Silva SOL: 253185 PPM: 771995 - Reestruturação da HistMovEmptmo - Fim
         'GROUP BY '                                                                            + #13 +
         '  CNT.NUMPARCELAS, HME.HMENUMPARCELAS ';
*)

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         LogToFile('Após abrir query quantidade de parcelas em aberto', sArquivoLog, True, True, True);

         iNumParcPagas  := 0;
         iNumParcelas   := 0;
         iNumParcRest   := 0;

         // se a query estiver vazia, passa os valores zerados
         if not(qryAux.isEmpty) then
         begin
            if not(qryAux.FieldByName('NUMPARCPAGAS').IsNull) then   iNumParcPagas  := qryAux.FieldByName('NUMPARCPAGAS').AsInteger;
            if not(qryAux.FieldByName('NUMPARCELAS').IsNull) then    iNumParcelas   := qryAux.FieldByName('NUMPARCELAS').AsInteger;
            if not(qryAux.FieldByName('HMENUMPARCELAS').IsNull) then iNumParcRest   := qryAux.FieldByName('HMENUMPARCELAS').AsInteger;
         end;

          qryAuxHist               := TwwQuery.Create(Application);
         qryAuxHist.DatabaseName  := 'BaseDados';
      {   //Inicio - Fanuel Junior SOL153161



         qryAuxHist.Close;
         qryAuxHist.SQL.Clear;
         qryAuxHist.SQL.Add(' SELECT MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO');
         qryAuxHist.SQL.Add(' FROM HISTMOVEMPTMO WHERE');
         qryAuxHist.SQL.Add(' ( IDCONTRATOEMPTMO  = '+FloatToStr(rContrato.IDContratoEmptmo)+')');
         qryAuxHist.SQL.Add(' AND ( HMECENTRALIZA  = 1 OR HMEDESTACADO = 1 )');
         qryAuxHist.SQL.Add(' AND ( HMETIPOMOV   <> 5 )');
         qryAuxHist.SQL.Add(' AND ( nvl(FLGABONADO,0) <> 1 )');
         qryAuxHist.SQL.Add(' AND ( nvl(FLGQUITADO, 0) <> 1 ) ');
         qryAuxHist.SQL.Add(' AND ( nvl(FLGESTORNADO,0) <> 1 )');
         qryAuxHist.Open;

         iIdHisMovEmtpmo := qryAuxHist.FieldByName('IDHISTMOVEMPTMO').AsInteger;

         qryAuxHist.Close;
         qryAuxHist.SQL.Clear;
         qryAuxHist.SQL.Add('SELECT CODDOCUMENTO, IDTMPDESC  FROM HISTMOVEMPTMO');
         qryAuxHist.SQL.Add('WHERE IDHISTMOVEMPTMO = '+IntToStr(iIdHisMovEmtpmo));
         qryAuxHist.Open;

         if not(qryAuxHist.isEmpty) then
         begin
            if not(qryAuxHist.FieldByName('CODDOCUMENTO').IsNull) then    iCodDocumento  := qryAuxHist.FieldByName('CODDOCUMENTO').AsInteger;
            if not(qryAuxHist.FieldByName('IDTMPDESC').IsNull)    then    iIdTmpDesc     := qryAuxHist.FieldByName('IDTMPDESC').AsInteger;
         end;

         qryAuxHist.Close;
         qryAuxHist.SQL.Clear;
         qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
         qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
         qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
         qryAuxHist.Open;


         if not(qryAuxHist.isEmpty) then
         begin
            if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
         end;

         qryAuxHist.Close;
         qryAuxHist.SQL.Clear;
         qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
         qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
         qryAuxHist.Open;

         if not(qryAuxHist.isEmpty) then
         begin
            if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
         end;
         //Fim - Fanuel Junior SOL153161   }
         // ----------------------------------------------------------------------------------------

         sSQL :=
         'SELECT '                                                                        + #13 +
         '   COUNT(HME.IDITEMEMPTMO) AS QUANT '                                           + #13 +
         'FROM '                                                                          + #13 +
         '   HISTMOVEMPTMO HME '                                                          + #13 +
         'WHERE '                                                                         + #13 +
         '       IDCONTRATOEMPTMO   = ' + FormatFloat('#0', rContrato.IDContratoEmptmo)   + #13 +
         '   AND ( HMECENTRALIZA    = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
         //Pendência 25772 - 25/04/2007 - Alberto
         '   AND ( nvl(FLGESTORNADO,0) = 0 ) '                                            + #13 +
         '   AND ( nvl(FLGABONADO,0) = 0 ) '                                              + #13 +
         '   AND ( nvl(FLGQUITADO, 0) = 0 ) '                                             + #13 +
         //Fim Pendência 25772
         '   AND HMETIPOMOV         NOT IN (0, 5, 8) '                                    + #13 +
         '   AND HME.FLGBAIXADO     = 0 ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         LogToFile('Após abrir query quantidade de itens em aberto', sArquivoLog);

         iQuantAberto := qryAux.FieldByName('QUANT').AsInteger;

         qryAux.Close;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
         dtmLookEmptmo.qryLookTipoContrato.ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
         dtmLookEmptmo.qryLookTipoContrato.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
         dtmLookEmptmo.qryLookTipoContrato.Open;

         if (iOrigem = 3) and (iNumParcPagas < dtmLookEmptmo.qryLookTipoContratoTCEMINQUIT.AsInteger) then
         begin
            LogToFile('Parcelas pagas inferior ao permitido', sArquivoLog, True, True, True);

            MsgDlg('Número de Parcelas Pagas inferior ao permitido para quitação!', 'Empréstimo', mtError, [mbOk], 0);
            Result := False;
            dtmLookEmptmo.qryLookTipoContrato.Close;
            Exit;
         end;

         dtmLookEmptmo.qryLookTipoContrato.Close;

         qryAux.Close;

         LogToFile('Após teste de parcelas pagas', sArquivoLog, True, True, True);

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Busca total da provisão para perdas
         fVlrProvPerda := 0;
         if not(dtmEmptmo.qryParamEmptmoIDITEMPROVPERDA.IsNull) then
         begin
            fVlrProvPerda := TotalizaProvPerda(rContrato.IDContratoEmptmo);
            LogToFile('Total de prov perda: ' + FormatFloat('#,#0.00', fVlrProvPerda), sArquivoLog, True, True, True);
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // abertura da query dos itens de Quitação
         with dtmCalcEmptmo.qryBuscaItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
            ParamByName('PEVENTO').AsInteger            := 3;
            Open;
            First;
         end;

         // Configurando o Form com a Barra de Progresso
         if bMostraProgresso then frmProgresso.MostraFormProgresso('Calculando itens de Quitação...',
                                                                   True,
                                                                   False,
                                                                   True,
                                                                   0,
                                                                   dtmCalcEmptmo.qryBuscaItens.RecordCount
                                                                   );

         // ----------------------------------------------------------------------------------------

         // Passagem do saldo à data da morte apenas para FUNCEF
         // André Pontes - 28/07/2005 - pendência 19818
         // Alberto - 15/05/2007 - Acerto combinado com a REFER via telafone (SOS 2239)
         if (iOrigem = 8) and
            ((dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) or
             (Sistema.TipoCliente = 19971)) then
         begin
            // busca os saldos devedores (Anterior e "Posterior")
            rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                          dDataMorte,
                                                         );

            // Saldo Devedor
            fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;

            // -------------------------------------------------------------------------------------
            // André Pontes - 16/12/2005
            //    Monta a linha do SQL que conterá o Saldo Devedor na Morte
            // -------------------------------------------------------------------------------------

            dtmEmptmo.cdsRegra.Append;

            dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
            dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

            if bFinanciamento then
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
            end
            else
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
            end;

            //Pendência 22836 - 03/10/2006 - Alberto
            dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
            //Fim Pendência 22836

            dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

            dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
            dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

            dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
            dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
            dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

            dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
            dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
            dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

            dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := (-3);
            dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(rSaldosAntPos.dDataAtuPos);

            dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := (-3);
            dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := (-3);
            dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := (-3);
            dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := (-3);

            dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := rSaldosAntPos.iParcelaAnt;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := rSaldosAntPos.iParcRestaAnt;

            dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := (-3);
            dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := (-3);

            dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := 0;
            dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := 0;
            dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := 0;
            dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := 0;

            dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := '0';

            dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
            dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
            dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;

            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
            if (rSaldosAntPos.dDataAtuAnt > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := rSaldosAntPos.dDataAtuAnt;
               dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := rSaldosAntPos.dDataAtuAnt;
               dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := rSaldosAntPos.dDataAtuAnt;
               dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := rSaldosAntPos.dDataAtuAnt;
               dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt);
               dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt);
            end;
            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := rSaldosAntPos.fSaldoDevAnt;
            dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := rSaldosAntPos.fSaldoDevAnt;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := rSaldosAntPos.fSaldoDevAnt;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
            dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := rSaldosAntPos.fTxJurosAnt;

            dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

            dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := 0;
            //Fim Pendência 22717
            dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := 0;

            dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
            dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger            := (-1);  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger            := (-1);  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            dtmEmptmo.cdsRegra.Post;

            // FIM André Pontes - 16/12/2005
            // -------------------------------------------------------------------------------------

            LogToFile('Após montar linha com saldo à data da morte', sArquivoLog, True, True, True);
         end;  // if iOrigem = 8

         // ----------------------------------------------------------------------------------------

         // busca os saldos devedores (Anterior e "Posterior")
         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                       dDataQuit,
                                                      );

         // Saldo Devedor
         fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;
         end;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 16/12/2005
         //    Monta PRIMEIRA LINHA do SQL (linha do Saldo Devedor Anterior)
         // ----------------------------------------------------------------------------------------

         dtmEmptmo.cdsRegra.Append;

         dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
         dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
         dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
         dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
         dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
         dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
         dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

         if bFinanciamento then
         begin
            dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
         end
         else
         begin
            dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
         end;

         //Pendência 22836 - 03/10/2006 - Alberto
         dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
         //Fim Pendência 22836

         dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

         dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
         dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

         dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
         dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
         dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
         dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

         dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
         dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
         dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

         dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := (-2);
         dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(rSaldosAntPos.dDataAtuPos);

         dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := (-1);
         dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := (-1);
         dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := (-1);
         dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
         dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
         dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := (-1);

         dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := rSaldosAntPos.iParcelaAnt;
         dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := rSaldosAntPos.iParcRestaAnt;

         dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := (-1);
         dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := (-1);

         dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := 0;
         dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := 0;
         dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := 0;
         dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := 0;

         dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := '0';

         dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
         dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
         dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;

         //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
         if (rSaldosAntPos.dDataAtuAnt > 0) then begin
           dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := rSaldosAntPos.dDataAtuAnt;
           dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := rSaldosAntPos.dDataAtuAnt;
           dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := rSaldosAntPos.dDataAtuAnt;
           dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := rSaldosAntPos.dDataAtuAnt;
           dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt);
           dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt);
         end;
         //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

         dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := rSaldosAntPos.fSaldoDevAnt;
         dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := rSaldosAntPos.fSaldoDevAnt;
         dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := rSaldosAntPos.fSaldoDevAnt;
         dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
         dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := rSaldosAntPos.fTxJurosAnt;

         dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

         dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
         dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
         dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
         dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
         //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
         dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := 0;
         //Fim Pendência 22717
         dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := 0;

         dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
         dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := (-1);  //Fanuel Junior SOL153161
         dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := (-1);  //Fanuel Junior SOL153161
         dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
         dtmEmptmo.cdsRegra.Post;

         // FIM André Pontes - 16/12/2005
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Monta a SEGUNDA linha do SQL (linha do Saldo Devedor "Posterior")
         // ----------------------------------------------------------------------------------------

         dtmEmptmo.cdsRegra.Append;

         dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
         dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
         dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
         dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
         dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
         dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
         dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

         if bFinanciamento then
         begin
            dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
         end
         else
         begin
            dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
         end;

         //Pendência 22836 - 03/10/2006 - Alberto
         dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
         //Fim Pendência 22836

         dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

         dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
         dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

         dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
         dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
         dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
         dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

         dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
         dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
         dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

         dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := (-1);
         dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(rSaldosAntPos.dDataAtuPos);

         dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := (-2);
         dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := (-2);
         dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := (-2);
         dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
         dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
         dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := (-2);

         dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := rSaldosAntPos.iParcelaPos;
         dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := rSaldosAntPos.iParcRestaPos;

         dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := (-2);
         dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := (-2);

         dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := 0;
         dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := 0;
         dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := 0;
         dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := 0;

         dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := '0';

         dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
         dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
         dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;

         //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
         if (rSaldosAntPos.dDataAtuPos > 0) then begin
           dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := rSaldosAntPos.dDataAtuPos;
           dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := rSaldosAntPos.dDataAtuPos;
           dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := rSaldosAntPos.dDataAtuPos;
           dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := rSaldosAntPos.dDataAtuPos;
           dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos);
           dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos);
         end;
         //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

         dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
         dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := rSaldosAntPos.fSaldoDevPos;
         dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := rSaldosAntPos.fSaldoDevPos;
         dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
         dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := rSaldosAntPos.fTxJurosPos;

         dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

         dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
         dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
         dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
         dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
         //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
         dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := 0;
         //Fim Pendência 22717
         dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := 0;

         dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
         dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := (-1);  //Fanuel Junior SOL153161
         dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := (-1);  //Fanuel Junior SOL153161
         dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
         dtmEmptmo.cdsRegra.Post;

         // FIM André Pontes - 16/12/2005
         // ----------------------------------------------------------------------------------------

         LogToFile('Após montar linhas com saldo dev', sArquivoLog, True, True, True);

         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens DE CONCESSÃO
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
            ParamByName('PHMETIPOMOV').AsInteger      := 0;
            Open;
            First;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin

            // -------------------------------------------------------------------------------------
            //    Monta as linhas dos itens DE CONCESSÃO
            // -------------------------------------------------------------------------------------

            //Fanuel Junior SOL153161
            iCodDocumento :=  dtmCalcEmptmo.qryItens.FieldByName('CODDOCUMENTO').AsInteger;

            qryAuxHist.Close;
            qryAuxHist.SQL.Clear;
            qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
            qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
            //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - INICIO
            //qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
            qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC, OPERACAO DESC) WHERE ROWNUM = 1');
            //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - FIM
            qryAuxHist.Open;

            iOperacao := -1;
            if not(qryAuxHist.isEmpty) then
            begin
               if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
            end;

            iIdTmpDesc :=  dtmCalcEmptmo.qryItens.FieldByName('IDTMPDESC').AsInteger;

            qryAuxHist.Close;
            qryAuxHist.SQL.Clear;
            qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
            qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
            qryAuxHist.Open;

            iSitEnvio := -1;
            if not(qryAuxHist.isEmpty) then
            begin
               if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
            end;
            //Fanuel Junior SOL153161

            dtmEmptmo.cdsRegra.Append;

            dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
            dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

            if bFinanciamento then
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
            end
            else
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
            end;

            //Pendência 22836 - 03/10/2006 - Alberto
            dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
            //Fim Pendência 22836

            dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

            dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
            dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

            dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
            dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
            dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

            dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
            dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
            dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

            dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := 0;
            dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime);

            dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := 0;

            dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := dtmCalcEmptmo.qryItensFLGENVIO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := dtmCalcEmptmo.qryItensFLGABONADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString;

            dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
            dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
            dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime;

            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
            if (dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime;
            end;

            if (dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime;
            end;
            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

            dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime;

            dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat) +
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat) +
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := dtmCalcEmptmo.qryItensHMESALDODEV.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
            dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := dtmCalcEmptmo.qryItensHMETXJUROS.AsCurrency;

            dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

            dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := dtmCalcEmptmo.qryItensFLGTIPODIVERG.AsInteger;
            //Fim Pendência 22717
            dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
            dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := iOperacao;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := iSitEnvio;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            dtmEmptmo.cdsRegra.Post;

            // FIM André Pontes - 16/12/2005
            // -------------------------------------------------------------------------------------

            dtmCalcEmptmo.qryItens.Next; // Próximo item em aberto
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)

         LogToFile('Após montar linhas dos itens de concessão', sArquivoLog, True, True, True);

         // André Pontes - 07/01/2004
         //    Foi pedido pela FUNCEF que as regras de quitação recebam os itens de
         //    seguro complementar (refinanciamento) do contrato
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas do item de seguro complementar (amortização)
            // -------------------------------------------------------------------------------------
            with dtmCalcEmptmo.qryItens do
            begin
               LimpaParametros(dtmCalcEmptmo.qryItens);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
               ParamByName('PHMETIPOMOV').AsInteger      := 2;
               Open;
               First;
            end;

            while not(dtmCalcEmptmo.qryItens.EOF) do
            begin

               // ----------------------------------------------------------------------------------
               //    Monta as linhas do item de seguro complementar (amortização)
               // ----------------------------------------------------------------------------------

               dtmEmptmo.cdsRegra.Append;

                 //Fanuel Junior SOL153161
               iCodDocumento :=  dtmCalcEmptmo.qryItens.FieldByName('CODDOCUMENTO').AsInteger;

               qryAuxHist.Close;
               qryAuxHist.SQL.Clear;
               qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
               qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
               //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - INICIO
               //qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
               qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC, OPERACAO DESC) WHERE ROWNUM = 1');
               //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - FIM
               qryAuxHist.Open;

              iOperacao := -1;
              if not(qryAuxHist.isEmpty) then
              begin
                if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
              end;
          
             iIdTmpDesc :=  dtmCalcEmptmo.qryItens.FieldByName('IDTMPDESC').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
             qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
             qryAuxHist.Open;

             iSitEnvio := -1;
             if not(qryAuxHist.isEmpty) then
             begin
                if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
             end;
             //Fanuel Junior SOL153161

               dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
               dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
               dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
               dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
               dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
               dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
               dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

               if bFinanciamento then
               begin
                  dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
               end
               else
               begin
                  dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
               end;

               //Pendência 22836 - 03/10/2006 - Alberto
               dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
               //Fim Pendência 22836

               dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

               dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
               dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

               dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
               dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
               dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
               dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

               dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
               dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
               dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

               dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := dtmCalcEmptmo.qryItensORDENACAO.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime);

               dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
               dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
               dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := 0;

               dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger;

               dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger;

               dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := dtmCalcEmptmo.qryItensFLGENVIO.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger;
               dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := dtmCalcEmptmo.qryItensFLGABONADO.AsInteger;

               dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString;

               dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
               dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
               dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;
               dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime;

               //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
               if (dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime > 0) then begin
                  dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime;
               end;

               if (dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime > 0) then begin
                  dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime;
               end;
               //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

               dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime;

               dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat) +
                                                                                    FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat);

               dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat) + 
                                                                                    FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat);

               dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsCurrency;
               dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsCurrency;
               dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := dtmCalcEmptmo.qryItensHMESALDODEV.AsCurrency;
               dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
               dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := dtmCalcEmptmo.qryItensHMETXJUROS.AsCurrency;

               dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

               dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
               dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
               dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
               dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
               //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
               dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := dtmCalcEmptmo.qryItensFLGTIPODIVERG.AsInteger;
               //Fim Pendência 22717
               dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsInteger;

               dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
               dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := iOperacao;  //Fanuel Junior SOL153161
               dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := iSitEnvio;  //Fanuel Junior SOL153161
               dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
               dtmEmptmo.cdsRegra.Post;

               // FIM André Pontes - 16/12/2005
               // -------------------------------------------------------------------------------------

               dtmCalcEmptmo.qryItens.Next; // Próximo item em aberto
               // -------------------------------------------------------------------------------------
            end;  // while not(dtmCalcEmptmo.qryItens.EOF)
            LogToFile('Após montar linhas dos itens de seguro complementar', sArquivoLog, True, True, True);
         end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
         // FIM André Pontes - 07/01/2004


         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens PENDENTES
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
            ParamByName('PFLGBAIXADO').AsInteger      := 0;
            ParamByName('PCENTRALIZA').AsInteger      := 1;

            // André Pontes - pendência 20261 - 07/10/2005
            if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
            begin
               ParamByName('PABONODIVERG').AsInteger := 1;
            end;

            Open;

            iQuantAberto := dtmCalcEmptmo.qryItens.RecordCount;

            First;

         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas dos itens PENDENTES
            // -------------------------------------------------------------------------------------

            dtmEmptmo.cdsRegra.Append;

            //Fanuel Junior SOL153161
             iCodDocumento :=  dtmCalcEmptmo.qryItens.FieldByName('CODDOCUMENTO').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
             qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - INICIO
             //qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
             qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC, OPERACAO DESC) WHERE ROWNUM = 1');
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - FIM
             qryAuxHist.Open;

             iOperacao := -1;
             if not(qryAuxHist.isEmpty) then
             begin
               if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
             end;


             iIdTmpDesc :=  dtmCalcEmptmo.qryItens.FieldByName('IDTMPDESC').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
             qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
             qryAuxHist.Open;

             iSitEnvio := -1;
             if not(qryAuxHist.isEmpty) then
             begin
                if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
             end;
             //Fanuel Junior SOL153161
             
            dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
            dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

            if bFinanciamento then
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
            end
            else
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
            end;

            //Pendência 22836 - 03/10/2006 - Alberto
            dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
            //Fim Pendência 22836

            dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

            dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
            dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

            dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
            dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
            dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

            dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
            dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
            dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

            dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := dtmCalcEmptmo.qryItensORDENACAO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime);

            dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := 0;

            dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := dtmCalcEmptmo.qryItensFLGENVIO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := dtmCalcEmptmo.qryItensFLGABONADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString;

            dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
            dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
            dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime;

            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
            if (dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime;
            end;

            if (dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime;
            end;
            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

            dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime;

            dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat) +
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat) +
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := dtmCalcEmptmo.qryItensHMESALDODEV.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
            dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := dtmCalcEmptmo.qryItensHMETXJUROS.AsCurrency;

            dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

            dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := dtmCalcEmptmo.qryItensFLGTIPODIVERG.AsInteger;
            //Fim Pendência 22717
            dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
            dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := iOperacao;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := iSitEnvio;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            dtmEmptmo.cdsRegra.Post;

            // FIM André Pontes - 16/12/2005
            // -------------------------------------------------------------------------------------

            // Próximo item Aberto
            dtmCalcEmptmo.qryItens.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)

         LogToFile('Após montar linhas dos itens pendentes', sArquivoLog, True, True, True);

         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens FUTUROS PAGOS
         // ----------------------------------------------------------------------------------------

         with dtmCalcEmptmo.qryParcelasAVencer do
         begin
            LimpaParametros(dtmCalcEmptmo.qryParcelasAVencer);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAPREVISTA').AsDateTime := dDataQuit;
            Open;

            First;

         end;

         while not(dtmCalcEmptmo.qryParcelasAVencer.EOF) do
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas dos itens FUTUROS PAGOS
            // -------------------------------------------------------------------------------------

            dtmEmptmo.cdsRegra.Append;

            //Fanuel Junior SOL153161
             iCodDocumento :=  dtmCalcEmptmo.qryParcelasAVencer.FieldByName('CODDOCUMENTO').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
             qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - INICIO
             //qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
             qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC, OPERACAO DESC) WHERE ROWNUM = 1');
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - FIM
             qryAuxHist.Open;

             iOperacao := -1;
             if not(qryAuxHist.isEmpty) then
             begin
               if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
             end;
             iIdTmpDesc :=  dtmCalcEmptmo.qryParcelasAVencer.FieldByName('IDTMPDESC').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
             qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
             qryAuxHist.Open;

             iSitEnvio := -1;
             if not(qryAuxHist.isEmpty) then
             begin
                if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
             end;
             //Fanuel Junior SOL153161

            dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
            dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

            if bFinanciamento then
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
            end
            else
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
            end;

            //Pendência 22836 - 03/10/2006 - Alberto
            dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
            //Fim Pendência 22836

            dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

            dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
            dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

            dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
            dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
            dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

            dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
            dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
            dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

            dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := dtmCalcEmptmo.qryParcelasAVencerORDENACAO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(dtmCalcEmptmo.qryParcelasAVencerHMEDATAPREVISTA.AsDateTime);

            dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmCalcEmptmo.qryParcelasAVencerIDITEMEMPTMO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := dtmCalcEmptmo.qryParcelasAVencerHMETIPOMOV.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := dtmCalcEmptmo.qryParcelasAVencerHMEORIGEM.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := 0;

            dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := dtmCalcEmptmo.qryParcelasAVencerHMEPARCELA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := dtmCalcEmptmo.qryParcelasAVencerHMENUMPARCELAS.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := dtmCalcEmptmo.qryParcelasAVencerHMECENTRALIZA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := dtmCalcEmptmo.qryParcelasAVencerHMEDESTACADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := dtmCalcEmptmo.qryParcelasAVencerFLGENVIO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := dtmCalcEmptmo.qryParcelasAVencerFLGBAIXADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := dtmCalcEmptmo.qryParcelasAVencerFLGESTORNADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := dtmCalcEmptmo.qryParcelasAVencerFLGABONADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := dtmCalcEmptmo.qryParcelasAVencerHMEFORMACOBRANCA.AsString;

            dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
            dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
            dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;

            dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := dtmCalcEmptmo.qryParcelasAVencerHMEDATAPREVISTA.AsDateTime;

            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
            if (dtmCalcEmptmo.qryParcelasAVencerHMEDATAEFETIVA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := dtmCalcEmptmo.qryParcelasAVencerHMEDATAEFETIVA.AsDateTime;
            end;

            if (dtmCalcEmptmo.qryParcelasAVencerHMEDATAATUALIZA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := dtmCalcEmptmo.qryParcelasAVencerHMEDATAATUALIZA.AsDateTime;
            end;
            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

            dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := dtmCalcEmptmo.qryParcelasAVencerHMEDATAVENCTO.AsDateTime;

            dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatFloat('0000', dtmCalcEmptmo.qryParcelasAVencerHMEANOCOMPETENCIA.AsFloat) +
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryParcelasAVencerHMEMESCOMPETENCIA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatFloat('0000', dtmCalcEmptmo.qryParcelasAVencerHMEANOCOBRANCA.AsFloat) + 
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryParcelasAVencerHMEMESCOBRANCA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := dtmCalcEmptmo.qryParcelasAVencerHMEVLRPREVISTO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := dtmCalcEmptmo.qryParcelasAVencerHMEVLREFETIVO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := dtmCalcEmptmo.qryParcelasAVencerHMESALDODEV.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
            dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := dtmCalcEmptmo.qryParcelasAVencerHMETXJUROS.AsCurrency;

            dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

            dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := 0;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := 0;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := 0;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := 0;
            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := dtmCalcEmptmo.qryParcelasAVencerFLGTIPODIVERG.AsInteger;
            //Fim Pendência 22717
            dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmCalcEmptmo.qryParcelasAVencerFLGSUSPENSAO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
            dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := iOperacao;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := iSitEnvio;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            dtmEmptmo.cdsRegra.Post;

            // FIM André Pontes - 16/12/2005
            // -------------------------------------------------------------------------------------

            dtmCalcEmptmo.qryParcelasAVencer.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)

         LogToFile('Após montar linhas das parcelas a vencer', sArquivoLog, True, True, True);

         // ----------------------------------------------------------------------------------------
         //    Fim das linhas dos itens FUTUROS PAGOS
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens DO MÊS
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := rContrato.IDContratoEmptmo;
            ParamByName('PHMEANOCOMPETENCIA').AsInteger  := DiasUteis.ExtraiAno(dDataQuit);
            ParamByName('PHMEMESCOMPETENCIA').AsInteger  := DiasUteis.ExtraiMes(dDataQuit);
            ParamByName('PAGRUPADO').AsInteger           := 1;
            ParamByName('PEVENTOEXCLUSAO').AsInteger     := 3; // não leva em conta itens de quitação
            Open;
            First;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
            // -------------------------------------------------------------------------------------
            //    Monta as linhas dos itens DO MÊS
            // -------------------------------------------------------------------------------------

            dtmEmptmo.cdsRegra.Append;

            //Fanuel Junior SOL153161
             iCodDocumento :=  dtmCalcEmptmo.qryItens.FieldByName('CODDOCUMENTO').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
             qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - INICIO
             //qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
             qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC, OPERACAO DESC) WHERE ROWNUM = 1');
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - FIM
             qryAuxHist.Open;

             iOperacao := -1;
             if not(qryAuxHist.isEmpty) then
             begin
               if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
             end;


             iIdTmpDesc :=  dtmCalcEmptmo.qryItens.FieldByName('IDTMPDESC').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
             qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
             qryAuxHist.Open;

             iSitEnvio := -1;
             if not(qryAuxHist.isEmpty) then
             begin
                if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
             end;
             //Fanuel Junior SOL153161

            dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
            dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

            if bFinanciamento then
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
            end
            else
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
            end;

            //Pendência 22836 - 03/10/2006 - Alberto
            dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
            //Fim Pendência 22836

            dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

            dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
            dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

            dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
            dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
            dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

            dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
            dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
            dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

            dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := dtmCalcEmptmo.qryItensORDENACAO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime);

            dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := dtmCalcEmptmo.qryItensHMEORIGEM.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := 0;

            dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := dtmCalcEmptmo.qryItensFLGENVIO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := dtmCalcEmptmo.qryItensFLGABONADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString;

            dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
            dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
            dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;

            dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime;

            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
            if (dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime          := dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime;
            end;

            if (dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime;
            end;
            //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

            dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime;

            dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat) +
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat) + 
                                                                                 FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat);

            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := dtmCalcEmptmo.qryItensHMESALDODEV.AsCurrency;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
            dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := dtmCalcEmptmo.qryItensHMETXJUROS.AsCurrency;

            dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

            dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := dtmCalcEmptmo.qryItensFLGTIPODIVERG.AsInteger;
            //Fim Pendência 22717
            dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
            dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := iOperacao;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := iSitEnvio;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            dtmEmptmo.cdsRegra.Post;

            // FIM André Pontes - 16/12/2005
            // -------------------------------------------------------------------------------------

            // Próximo item Aberto
            dtmCalcEmptmo.qryItens.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)
         LogToFile('Após montar linhas dos itens do mês', sArquivoLog, True, True, True);


         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens de DE QUITAÇÃO
         // ----------------------------------------------------------------------------------------

         dtmCalcEmptmo.qryBuscaItens.First;
         while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
         begin
             if bMostraProgresso then
             begin
                frmProgresso.AndaFormProgresso(iContador);
                if frmProgresso.Cancelou then Exit;
             end;

            // -------------------------------------------------------------------------------------
            //    Monta as linhas dos itens de DE QUITAÇÃO
            // -------------------------------------------------------------------------------------

            dtmEmptmo.cdsRegra.Append;

            dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := rContrato.IDContratoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := rContrato.IDTipoContrEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := rContrato.IDTipoEmptmo;
            dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger           := rContrato.IDPlanoPrev;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger             := rContrato.IDPatro;
            dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger             := rContrato.IDSitPart;
            dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger              := rContrato.IDPessoa;

            if bFinanciamento then
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 1;
            end
            else
            begin
               dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger   := 0;
            end;

            //Pendência 22836 - 03/10/2006 - Alberto
            dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := Ord(bExcepcional);
            //Fim Pendência 22836

            dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString             := rContrato.SiglaIndexador;

            dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency               := rContrato.fValMargem;
            dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency              := rContrato.fValReserva;

            dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime             := rContrato.DataInscricao;
            dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime          := rContrato.DataCredito;
            dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime            := rContrato.DataAssinatura;
            dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime         := rContrato.DataPrimParc;

            dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger                := iPais;
            dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString              := sEstado;
            dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger             := iCidade;

            dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger             := dtmCalcEmptmo.qryBuscaItensORDENACAO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime        := Trunc(dDataQuit);

            dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger            := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger            := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger                := iEvento;
            dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger                := iOrigem;
            dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger            := dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger             := rSaldosAntPos.iParcelaAnt;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger           := rSaldosAntPos.iParcRestaAnt;

            dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger            := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger             := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;

            dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger              := 0;
            dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger            := 0;
            dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger          := 0;
            dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger            := 0;

            dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString            := rContrato.FlgFormaRec;

            dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime           := dDataQuit;
            dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime            := dDataMorte;
            dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime          := dDataAssinatura;

            dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime         := dDataQuit;
            if (rSaldosAntPos.dDataAtuPos > 0) then begin
               dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime         := rSaldosAntPos.dDataAtuPos;
            end;
            dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime           := dDataQuit;

            dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString            := FormatDateTime('YYYYMM', dDataQuit);
            dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString               := FormatDateTime('YYYYMM', dDataQuit);

            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency          := 0;
            dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency           := 0;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency             := rSaldosAntPos.fSaldoDevAnt;
            dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency          := rSaldosAntPos.fSaldoDevPos;
            dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency              := rSaldosAntPos.fTxJurosAnt;

            dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency         := fVlrProvPerda;

            dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger       := iQuantAberto;
            dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger          := iNumParcPagas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger              := iNumParcelas;
            dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger             := iNumParcRest;
            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            dtmEmptmo.cdsRegra.FieldByName('FLGTIPODIVERG').AsInteger         := dtmCalcEmptmo.qryItensFLGTIPODIVERG.AsInteger;
            dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsInteger;
            //Fim Pendência 22717

            dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').asString            := sULTDATAQUIT;  //SOL131409
            dtmEmptmo.cdsRegra.FieldByName('OPERACAO').asInteger              := (-1);//iOperacao;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('SITENVIO').asInteger              := (-1);//iSitEnvio;  //Fanuel Junior SOL153161
            dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').asInteger     := rContrato.sFlagPerdaEfetiva;  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
            dtmEmptmo.cdsRegra.Post;

            // FIM André Pontes - 16/12/2005
            // -------------------------------------------------------------------------------------

            // função que cria uma query e um objeto regra em tempo de execução,
            //   recebendo como parâmetro o SQL que será passado para a Regra, o número
            //   da regra, a mensagem de texto que será exibida caso haja erro e uma
            //   variável passada por referência que armazenará o Result da Regra.
            //   A função retornará se a Regra foi executada com êxito ou não *)

            LogToFile('Antes Executar regra ' + dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsString + ' de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString, sArquivoLog, True, True, True);

            //Pendência 23436 - 29/09/2006 - Alberto
            OrdenaQueryRegra(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsString + ' - ' +
                             'de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString);

            if not(UtilizaRegraValorNOVA(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger,
                                         sSQLExec,
                                         'e ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString,
                                         sValor, // Resultado da Regra passado como Referência
                                         bMostraMsg,
                                         (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1),
                                         (trim(sSQLExec) <> '') )) then
            //Fim Pendência 23436
            begin
               // Regra Executada com Erro
               Result := False;
               Exit;
            end;

            LogToFile('Após Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString +
                      ': ' + sValor, sArquivoLog, True, True, True);

            // Tenta Armazenar no Vetor que será o Result da função o VALOR do item.
            //   Caso não consiga, é porque a regra em vez de valor retornou FALSE
            try
               // Não gravar item com valor ZERO
               if (sValor = 'NULO') then
               begin
                  // Próximo item de Quitação
                  dtmCalcEmptmo.qryBuscaItens.Next;

                  // incrementa o Contador
                  inc(iContador);

                  // incrementa a variável de índice do vetor do SQL
                  inc(i);

                  if bMostraProgresso then frmProgresso.AndaFormProgresso(iContador);

                  Continue;
               end;

            except
               LogToFile('Operação cancelada', sArquivoLog, True, True, True);

               MsgDlg('ERRO - Operação Cancelada!', 'Empréstimo', mtError, [mbOk], 0);
               Exit;
            end;

            fVlrResultRegra := 0;
            try
               fVlrResultRegra := StrToFloat(ConverteVirg(sValor));
            except
            end;

            dtmEmptmo.cdsRegra.Last;
            dtmEmptmo.cdsRegra.Edit;
            dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency := fVlrResultRegra;
            dtmEmptmo.cdsRegra.Post;

            // -------------------------------------------------------------------------------------
            //    GRAVAÇÃO no Vetor que será o Result da função
            // -------------------------------------------------------------------------------------

            // Uso de SetLength para criar mais um item dinâmicamente no array em memória
            SetLength(vLista, k + 1);

            vLista[k].CodigoItem          := dtmCalcEmptmo.qryBuscaItensIDItemEmptmo.AsInteger;
            vLista[k].Nome                := dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString;
            vLista[k].iEvento             := iEvento;
            vLista[k].Origem              := iOrigem;

            vLista[k].SeqCalculo          := dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger;
            vLista[k].SeqCobranca         := 1;
            vLista[k].Prioridade          := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

            vLista[k].FlgCentraliza       := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
            vLista[k].FlgDestacado        := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
            vLista[k].IdItemCentraliza    := dtmCalcEmptmo.qryBuscaItensIDITEMCENTRALIZA.AsInteger;
            vLista[k].Rubrica             := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger;

            vLista[k].AnoCompetencia      := DiasUteis.ExtraiAno(dDataQuit);
            vLista[k].MesCompetencia      := DiasUteis.ExtraiMes(dDataQuit);
            vLista[k].AnoCobranca         := DiasUteis.ExtraiAno(dDataQuit);
            vLista[k].MesCobranca         := DiasUteis.ExtraiMes(dDataQuit);

            vLista[k].DataPrevista        := dDataQuit;

            vLista[k].Valor               := StrToFloat(ConverteVirg(sValor));

            vLista[k].Parcela             := rSaldosAntPos.iParcelaAnt;
            vLista[k].ParcelaAlt          := rSaldosAntPos.iParcelaAltAnt;
            vLista[k].ParcResta           := 0;

            // calcula o novo saldo devedor
            if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and (vLista[k].CodigoItem = 35 ) then
            begin
              if vLista[k].Valor <> 0 then begin //Renato Visoni 102371/ Kintana 455819
                fNovoSaldoDev := vLista[k].Valor;
              end;
            end;

            case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
               0: begin (* Não Tratar *) end;
               1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor; // Abater
               2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor; // Incorporar
            end;

            vLista[k].SaldoDevedor        := fNovoSaldoDev;

            vLista[k].DataUltAtualiza     := rSaldosAntPos.dDataAtuPos;

            vLista[k].TxJuros             := rSaldosAntPos.fTxJurosAnt;

            vLista[k].FormaCobranca       := rContrato.FlgFormaRec;

            vLista[k].FlgEnvio            := 0;
            vLista[k].FlgBaixado          := 0;
            vLista[k].FlgDivergPend       := -1;

            vLista[k].RecPag              := 'R'; // dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString;

            vLista[k].Regra               := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;

            vLista[k].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

            // -------------------------------------------------------------------------------------

            LogToFile('Após preencher vLista', sArquivoLog, True, True, True);

            dtmCalcEmptmo.qryBuscaItens.Next;
            inc(iContador);

            inc(i);  // incrementa a variável de índice do vetor do SQL
            inc(k);  // incrementa a variável de índice do vetor da Lista

         end; // while not(dtmCalcEmptmo.qryBuscaItens.EOF)

         Result := True;

      except
         LogToFile('Erro (except)', sArquivoLog, True, True, True);
         Raise;
         if bMostraMsg then
         begin
            MsgDlg('Ocorreu um erro na Busca de Valores de um Item', 'Empréstimo', mtError, [mbOk], 0);
         end;
         Result := False;
      end;

   finally
      // se CalculaItens houver iniciado uma transacao, faz Rollback
      FreeAndNil(qryAuxHist);
      if bTransacao then
      begin
         RollBackTransacao;
         LogToFile('CalcEmptmo - Rollback Transaction', sArquivoLog, True, True, True);
      end
      else
      begin
         LogToFile('CalcEmptmo - NÃO Rollback Transaction', sArquivoLog, True, True, True);
      end;

      dtmCalcEmptmo.qryItens.Close;
      dtmCalcEmptmo.qryBuscaItens.Close;

      dtmEmptmo.cdsRegra.Close;

      qryAux.Close;
      qryAux.Free;

      if bMostraProgresso then frmProgresso.EscondeFormProgresso;
   end;
end;



function TCalcEmptmo.CalculaItensDiverg(const rContrato        : TDadosContrato;
                                        const iOrigem          : Integer;
                                        const iParcela         : Integer;
                                        const iParcelaAlt      : Integer;
                                        const iParcResta       : Integer;
                                        const iAnoCompetencia  : Integer;
                                        const iMesCompetencia  : Integer;
                                        const dDataDiverg      : TDateTime;
                                        const dDataVenc        : TDateTime;
                                        const dDataAtu         : TDateTime;
                                        const sFormaCobranca   : String;
                                        var   vLista           : TListaItem;
                                        const bMostraMsg       : Boolean;
                                        const bMostraProgresso : Boolean;
                                        const sArquivoLog      : String = '';
                                        const bTrataDivergNOVO : Boolean = False  // 92334 Daniel Begnami
                                       ): Boolean;
const
   iEvento = 4;
var
   bCabecalho              : Boolean;
   rSaldoDevAnt            : TSaldoDevAnt;
   fNovoSaldoDev           : Currency;
   sValor, sCabecalho      : String;
   sSQL, sSQLExec, sEstado : String;
   vSQL                    : array of String;
   i, j, k, iContador      : Integer;
   iPais, iCidade, iEstado : Int64;
   sSQLItens : string; // 92334 Daniel Begnami
   fValorSolic : Currency; //Fanuel Marinho SOl176404
   qryValorPrevisto : TwwQuery;
begin
  //Ao alterar essa função, favor replicar na outra função CalculaItensDiverg com Overload

   Result := False;

   try
      iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
      iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
      iEstado  := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
      sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

      sValor    := '0';
      sSQL      := '';
      i         := 0;
      k         := 0;
      iContador := 0;

      // abertura da query dos itens de Divergência 
      with dtmCalcEmptmo.qryBuscaItens do
      begin
         LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
         ParamByName('PEVENTO').AsInteger            := iEvento;
         Open;
      end;


      if bMostraProgresso then frmProgresso.MostraFormProgresso('Calculando Itens de Divergência...',
                                                                True,
                                                                True,
                                                                True,
                                                                0,
                                                                dtmCalcEmptmo.qryBuscaItens.RecordCount
                                                               );

      // -------------------------------------------------------------------------------------------

            //Fanuel Marinho SOL176404 Kintana1609941
       qryValorPrevisto := TwwQuery.Create(nil);
       qryValorPrevisto.DataBaseName := 'BASEDADOS';
       qryValorPrevisto.Close;
       qryValorPrevisto.SQL.Clear;
       qryValorPrevisto.SQL.Add(
              ' SELECT SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO '+
              ' FROM  HISTMOVEMPTMO                          '+
              ' WHERE  IDCONTRATOEMPTMO    = '+ FormatFloat('#0', rContrato.IDContratoEmptmo) +
              //' AND   HMECENTRALIZA       = 1                    '+
              ' AND HMETIPOMOV   = 0  '+
              ' AND IDITEMEMPTMO = 22 ' +
              //' AND   HMEORIGEM           IN (0,13)              '+
              ' AND NVL(FLGESTORNADO,0) = 0                    ' );
      qryValorPrevisto.Open;
      fValorSolic := qryValorPrevisto.FieldByName('HMEVLRPREVISTO').AsFloat;
      qryValorPrevisto.Close;
      FreeAndNil(qryValorPrevisto);
      //Fanuel Marinho SOL176404 Kintana1609941
      

      // André Pontes - 10/01/2006
      if Sistema.TipoCliente = 19991 then
      begin
         rSaldoDevAnt := SaldoDevAnt(rContrato.IDContratoEmptmo,
                                     dDataDiverg,
                                     -1,
                                     -1,
                                     False,
                                     bTrataDivergNOVO // 92334 Daniel Begnami
                                    );
      end
      else
      begin
         rSaldoDevAnt := SaldoDevAnt(rContrato.IDContratoEmptmo,
                                     dDataDiverg,
                                     iAnoCompetencia,
                                     iMesCompetencia,
                                     False,
                                     bTrataDivergNOVO // 92334 Daniel Begnami
                                    );
      end;
      // FIM André Pontes - 10/01/2006

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      //    Monta PRIMEIRA LINHA do SQL (linha do Saldo Devedor Anterior)
      // -------------------------------------------------------------------------------------------

      SetLength(vSQL, i + 1);

      sSQL := '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
      'SELECT '                                                                                                      + #13 +
      '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
      '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
      '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       + //#13 +
      '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        + //#13 +
      '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          + //#13 +
      '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          + //#13 +

      '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         + //#13 +

      '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             + //#13 +
      '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            + //#13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

      '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             + //#13 +
      '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          + //#13 +
      '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          + //#13 +

      '  -1'                                                                           +  ' AS IDITEMEMPTMO, '       + //#13 +
      '  -1'                                                                           +  ' AS EVENTOITEM, '         + //#13 +
      '  -1'                                                                           +  ' AS ORIGEMITEM, '         + //#13 +
      '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             + //#13 +
      '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             + //#13 +
      '  -1'                                                                           +  ' AS SEQCALCULO, '         + //#13 +

      '  ' + IntToStr(rSaldoDevAnt.iParcelaAnt)                                        +  ' AS PARCATUAL, '          + //#13 +
      ' 0' + IntToStr(rSaldoDevAnt.iParcRestaAnt)                                      +  ' AS NUMPARCELAS, '        + //#13 +

      '  -1'                                                                           +  ' AS CENTRALIZA, '         + //#13 +
      '  -1'                                                                           +  ' AS DESTACADO, '          + //#13 +

      '  0'                                                                            +  ' AS FLGENVIO, '           + //#13 +
      '  0'                                                                            +  ' AS FLGBAIXADO, '         + //#13 +
      '  0'                                                                            +  ' AS FLGESTORNADO, '       + //#13 +
      '  0'                                                                            +  ' AS FLGABONADO, '         + //#13 +
      '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        + //#13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                      +  ' AS DATAEVENTO, '         + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAPREVISTA, '       + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAEFETIVA, '        + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAATUALIZA, '       + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAVENCTO, '         + //#13 +

      '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldoDevAnt.dDataAtuAnt))             +  ' AS COMPETENCIA, '        + //#13 +
      '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldoDevAnt.dDataAtuAnt))             +  ' AS COBRANCA, '           + //#13 +

      '  0'                                                                            +  ' AS FLGSUSPENSAO, '       +

      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS VLRPREVISTO, '        + //#13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS VLREFETIVO, '         + //#13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS SALDODEV, '           + //#13 +
      //Fanuel Marinho SOL176404 Kintana1609941
      '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
      '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
      //Fanuel Marinho SOL176404 Kintana1609941
      'FROM '                                                                                                        + //#13 +
      '  DUAL ';

      // armazeno SQL montado no vetor
      vSQL[i] := sSQL;

      // incrementa a variável de índice do vetor
      inc(i);

      // -------------------------------------------------------------------------------------------
      //    Monta as linhas dos itens PENDENTES (de divergência)
      // -------------------------------------------------------------------------------------------

     // 92334 Daniel Begnami
      if bTrataDivergNOVO then
      begin
        with dtmCalcEmptmo.qryItens do
        begin
        
          close;
          SQL.Clear;

          sSQLItens := 'SELECT '+ #13 +
                       'HME.IDHISTMOVEMPTMO, '+ #13 +
                       'HME.IDITEMEMPTMO, '+ #13 +
                       'DECODE(HME.HMETIPOMOV, -2, -2, '+ #13 +
                       '                       -1, -1, '+ #13 +
                       '                        0,  0, '+ #13 +
                       '                        1,  2, '+ #13 +
                       '                        2,  6, '+ #13 +
                       '                        3,  9, '+ #13 +
                       '                        4,  7, '+ #13 +
                       '                        5,  1, '+ #13 +
                       '                        6,  3, '+ #13 +
                       '                        7,  4, '+ #13 +
                       '                        8,  5, '+ #13 +
                       '                            8 '+ #13 +
                       '      ) AS ORDENACAO, '+ #13 +
                       'HME.HMETIPOMOV, HME.HMEORIGEM,  HME.HMESEQCOBRANCA, HME.IDITEMCENTRALIZA, '+ #13 +
                       'HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS, '+ #13 +
                       'HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.HMEPRIORIDADE, HME.HMERECPAG, '+ #13 +
                       'HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, HME.HMEDATAATUALIZA, HME.HMEDATAVENCTO, '+ #13 +
                       'HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA, '+#13 +
                       'HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDREGRA, '+ #13 +
                       'HME.HMEFORMACOBRANCA, HME.IDRUBRICA, '+ #13 +
                       'NVL(HME.FLGENVIO, 1)       AS FLGENVIO, '+ #13 +
                       'NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO, '+ #13 +
                       'NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO, '+ #13 +
                       'NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO, '+ #13 +
                       'NVL(HME.FLGABONADO, 0)     AS FLGABONADO, '+ #13 +
                       'NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND, '+ #13 +
                       'NVL(HME.FLGTIPODIVERG, 0 ) AS FLGTIPODIVERG, '+ #13 +
                       'DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0, '+ #13 +
                       '                                    NVL(NVL(HME.IDTIPOSUSPEMPTMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0)) '+ #13 +
                       '      ) AS FLGSUSPENSAO, '+ #13 +
                       'ITE.ITEDESCRICAO, '+ #13 +
                       'HME.CODDOCUMENTO, '+ #13 +
                       'HME.PLNCODIGO, '+ #13 +
                       'HME.IDTMPDESC, '+ #13 +   //SOL 154310 KINTANA 1178383 incluido campo idtmpdesc					   
                       'HME.PLNCODIGOESTORNO '+ #13 +
                       'FROM '+ #13 +
                       '   PREPARAHISTMOVEMPTMO  HME, '+ #13 +
                       '   CONTRATOEMPTMO CON, '+ #13 +
                       '   ITEMEMPTMO     ITE '+ #13 +
                       'WHERE '+ #13 +
                       '     ( HME.IDCONTRATOEMPTMO   = '+ FloatToStr(rContrato.IDContratoEmptmo)+ ') '+ #13 +
                       '   AND (HME.HMEPARCELA             = '+ IntToStr(iParcela) + ') '+ #13 +
                       '   AND ( ITE.IDITEMEMPTMO       > 0 ) '+ #13 +
                       '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) ) '+ #13 +
                       '   AND NVL(HME.FLGESTORNADO, 0) = 0 '+ #13 +
                       '   AND NVL(HME.FLGQUITADO, 0)   = 0 ';

                       if iOrigem <> 7 then
                         sSQLItens := sSQLItens + '   AND (NVL(HME.FLGDIVERGPEND, 0)  =1) ';

                       if iOrigem = 7  then
                         sSQLItens := sSQLItens + ' AND (NVL(HME.FLGBAIXADO, 1)     =0) ';

                       if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
                         sSQLItens := sSQLItens + ' AND (NVL(HME.FLGABONADO, 0)    = 1) ';

                       sSQLItens := sSQLItens +
                       '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '+ #13 +
                       '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '+ #13 +
                       'ORDER BY '+ #13 +
                       '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ';

          SQL.ADD(sSQLItens);

          Open;
          First;
          bCabecalho := True;

        end;
      end
      else
      begin
      with dtmCalcEmptmo.qryItens do
      begin
         LimpaParametros(dtmCalcEmptmo.qryItens);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
         ParamByName('PHMEPARCELA').AsInteger      := iParcela;

         if iOrigem <> 7 then ParamByName('PFLGDIVERGPEND').AsInteger := 1;
         if iOrigem = 7  then ParamByName('PFLGBAIXADO').AsInteger    := 0;

         if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
         begin
            ParamByName('PABONODIVERG').AsInteger := 1;
         end;

         Open;
         First;
         bCabecalho := True;
        end;
      end;
     // Fim

      while not(dtmCalcEmptmo.qryItens.EOF) do
      begin
         sCabecalho := '';
         if bCabecalho then
         begin
            // sCabecalho := '/* -------------- Itens Pendentes ------------------------------------------------ */ ' + #13;
            bCabecalho := False;
         end;

         SetLength(vSQL, i + 1); // array dinâmico

         sSQL := sCabecalho +
         'SELECT '                                                                                                   + //#13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + //#13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + //#13 +
         '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + //#13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + //#13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + //#13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + //#13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

         '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + //#13 +
         '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + //#13 +
         '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         + //#13 +

         '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         + //#13 +
         '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + //#13 +
         '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + //#13 +
         '  0'                                                                         +  ' AS SEQCALCULO, '         + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          + //#13 +
         ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         + //#13 +
         '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                                         +  ' AS DATAEVENTO, '      + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '    + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '     + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '    + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '      + //#13 +

         '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)               +
                FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, ' + //#13 +
         '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                  +
                FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '    + //#13 +

         ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                                +  ' AS FLGSUSPENSAO, '       +

         '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)                 +  ' AS VLRPREVISTO, '        + //#13 +
         '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)                  +  ' AS VLREFETIVO, '         + //#13 +
         '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                    +  ' AS SALDODEV, '           + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
        '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
        '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         'FROM '                                                                                                         + //#13 +
         '  DUAL ';

         // armazeno SQL montado no vetor
         vSQL[i] := sSQL;


         // Existe uma ordem de sequência de cálculo e para cada item o resultado do item
         //   anteriormente calculado tem que ser passado no SQL que será submetido para a Regra.
         //   É usado este laço para juntar TODOS os SQLs, montando o SQL completo que será passado
         //   para Regra de cálculo do item

         for j := 0 to High(vSQL) do
         begin
            if j <= 0 then
            begin
               sSQLExec := vSQL[j];
            end
            else
            begin
               sSQLExec := sSQLExec + #13 +#13 + ' UNION '  + #13 + #13 + vSQL[j];
            end;
         end;

         // incrementa a variável de índice do vetor
         inc(i);

         // Próximo item Aberto
         dtmCalcEmptmo.qryItens.Next;

      end;  // while not(dtmCalcEmptmo.qryItens.EOF


      // -------------------------------------------------------------------------------------------
      //    Monta as linhas dos itens de DE DIVERGÊNCIA
      // -------------------------------------------------------------------------------------------

      dtmCalcEmptmo.qryBuscaItens.First;
      bCabecalho := True;
      while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
      begin
         if bMostraProgresso then
         begin
            frmProgresso.AndaFormProgresso(iContador);
            if frmProgresso.Cancelou then Exit;
         end;

         SetLength(vSQL, i + 1); // array dinâmico

         sSQL :=
         'SELECT '                                                                                                         + //#13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                                +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                        +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                             +  ' AS IDTIPOEMPTMO, '       + //#13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                              +  ' AS IDPLANOPREV, '        + //#13 +
         '  ' + IntToStr(rContrato.IDPatro)                                                  +  ' AS IDPESSJUR, '          + //#13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                                +  ' AS IDSITPART, '          + //#13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                          +  ' AS NOMEINDICE, '         + //#13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                           +  ' AS MARGEM, '             + //#13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                          +  ' AS RESERVA, '            + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))             +  ' AS DATAINSC, '           + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))               +  ' AS DATACREDITO, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))            +  ' AS DATAASSIN, '          + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))              +  ' AS DATAPRIMPARC, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

         '  ' + IntToStr(iPais)                                                              +  ' AS IDPAIS, '             + //#13 +
         '  ' + QuotedStr(sEstado)                                                           +  ' AS CODESTADO, '          + //#13 +
         '  ' + IntToStr(iCidade)                                                            +  ' AS IDCIDADES, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)                  +  ' AS IDITEMEMPTMO, '       + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTOITEM, '         + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEMITEM, '         + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTO, '             + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEM, '             + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)                 +  ' AS SEQCALCULO, '         + //#13 +

         '  ' + IntToStr(iParcela)                                                           +  ' AS PARCATUAL, '          + //#13 +
         ' 0' + IntToStr(iParcResta)                                                         +  ' AS NUMPARCELAS, '        + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)                 +  ' AS CENTRALIZA, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)                  +  ' AS DESTACADO, '          + //#13 +

         '  0'                                                                               +  ' AS FLGENVIO, '           + //#13 +
         '  0'                                                                               +  ' AS FLGBAIXADO, '         + //#13 +
         '  0'                                                                               +  ' AS FLGESTORNADO, '       + //#13 +
         '  0'                                                                               +  ' AS FLGABONADO, '         + //#13 +
         '  ' + QuotedStr(rContrato.FlgFormaRec)                                             +  ' AS FLGFORMACOB, '        + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                         +  ' AS DATAEVENTO, '         + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAPREVISTA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                                   +  ' AS DATAEFETIVA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtu))                            +  ' AS DATAATUALIZA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAVENCTO, '         + //#13 +

         '  ' + QuotedStr(FormatFloat('0000', iAnoCompetencia) + FormatFloat('00', iMesCompetencia)) +  ' AS COMPETENCIA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataVenc))                               +  ' AS COBRANCA, '           + //#13 +

         '  0'                                                                               +  ' AS FLGSUSPENSAO, '       +

         '  0'                                                                               +  ' AS VLRPREVISTO, '        + //#13 +
         '  0'                                                                               +  ' AS VLREFETIVO, '         + //#13 +
         '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                      +  ' AS SALDODEV, '           + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
         '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         'FROM '                                                                                                           + //#13 +
         '  DUAL ';

         vSQL[i] := sSQL;

         // Como no caso dos itens de concessão, existe uma ordem de sequência de
         //   cálculo e para cada item o resultado do item anteriormente calculado
         //   tem que ser passado no SQL que será submetido para a Regra.  É usado
         //   este laço para juntar TODOS os SQLs, montando o SQL completo que será
         //   passado para Regra para cálculo do item

         for j := 0 to High(vSQL) do
         begin
            if j <= 0 then begin
               sSQLExec := vSQL[j];
            end
            else
            begin
               sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
            end;
         end;

//         sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO ';             //Everson Cunha - SIG Tibero - 03/11/2018
         sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO, IDITEMEMPTMO '; //Everson Cunha - SIG Tibero - 03/11/2018

         // ----------------------------------------------------------------------------------------

         //Pendência 24502
         LogToFile('Antes Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString +
                   ': ' + sValor, sArquivoLog); //, True, True, True);

         if not(UtilizaRegraValor(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger, sSQLExec,
                                  'e ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString,
                                  sValor,(* Resultado da Regra passado como Referência *)
                                  bMostraMsg
                                 )) then
         begin
            (* Regra Executada com Erro *)
            Result := False;
            Exit;
         end;

         LogToFile('Após Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString +
                   ': ' + sValor, sArquivoLog, True, True, True);
         // ----------------------------------------------------------------------------------------

         try
            // Não gravar item com valor ZERO
            if (sValor = 'NULO') then
            begin
               // Próximo item de Quitação
               dtmCalcEmptmo.qryBuscaItens.Next;

               // incrementa o Contador
               inc(iContador);

               // incrementa a variável de índice do vetor do SQL
               inc(i);

               if bMostraProgresso then frmProgresso.AndaFormProgresso(iContador);

               Continue;
            end;

         except
            MsgDlg('Operação Cancelada!', 'Empréstimo', mtError, [mbOk], 0);
            Exit;
         end;

         // ----------------------------------------------------------------------------------------
         //
         //     SUBSTITUIÇÃO no SQL do Itens que acabou de ser CALCULADO      
         //
         //  Depois de executada a Regra a variável sValor já tem o VALOR do
         //  item calculado, logo é atualizado este valor na linha de SQL do
         //  vetor vSQL que acabou de ser executada pela regra.
         //
         // ----------------------------------------------------------------------------------------

         sCabecalho := '';
         if bCabecalho then
         begin
            sCabecalho := '/* -------------- Itens de Divergência ------------------------------------------- */ ' + #13;
            bCabecalho := False;
         end;

         sSQL := sCabecalho +
         'SELECT '                                                                                                         + //#13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                                +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                        +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                             +  ' AS IDTIPOEMPTMO, '       + //#13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                              +  ' AS IDPLANOPREV, '        + //#13 +
         '  ' + IntToStr(rContrato.IDPatro)                                                  +  ' AS IDPESSJUR, '          + //#13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                                +  ' AS IDSITPART, '          + //#13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                          +  ' AS NOMEINDICE, '         + //#13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                           +  ' AS MARGEM, '             + //#13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                          +  ' AS RESERVA, '            + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))             +  ' AS DATAINSC, '           + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))               +  ' AS DATACREDITO, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))            +  ' AS DATAASSIN, '          + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))              +  ' AS DATAPRIMPARC, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

         '  ' + IntToStr(iPais)                                                              +  ' AS IDPAIS, '             + //#13 +
         '  ' + QuotedStr(sEstado)                                                           +  ' AS CODESTADO, '          + //#13 +
         '  ' + IntToStr(iCidade)                                                            +  ' AS IDCIDADES, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)                  +  ' AS IDITEMEMPTMO, '       + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTOITEM, '         + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEMITEM, '         + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTO, '             + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEM, '             + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)                 +  ' AS SEQCALCULO, '         + //#13 +

         '  ' + IntToStr(iParcela)                                                           +  ' AS PARCATUAL, '          + //#13 +
         ' 0' + IntToStr(iParcResta)                                                         +  ' AS NUMPARCELAS, '        + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)                 +  ' AS CENTRALIZA, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)                  +  ' AS DESTACADO, '          + //#13 +

         '  0'                                                                               +  ' AS FLGENVIO, '           + //#13 +
         '  0'                                                                               +  ' AS FLGBAIXADO, '         + //#13 +
         '  0'                                                                               +  ' AS FLGESTORNADO, '       + //#13 +
         '  0'                                                                               +  ' AS FLGABONADO, '         + //#13 +
         '  ' + QuotedStr(rContrato.FlgFormaRec)                                             +  ' AS FLGFORMACOB, '        + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                         +  ' AS DATAEVENTO, '         + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAPREVISTA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                                   +  ' AS DATAEFETIVA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtu))                            +  ' AS DATAATUALIZA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAVENCTO, '         + //#13 +

         '  ' + QuotedStr(FormatFloat('0000', iAnoCompetencia) + FormatFloat('00', iMesCompetencia))    +  ' AS COMPETENCIA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataVenc))                               +  ' AS COBRANCA, '           + //#13 +

         '  0'                                                                               +  ' AS FLGSUSPENSAO, '       +

         // aqui ocorre a substituição do valor pelo valor calculado
         //  Thiago Melo SOL 182298 KINTANA 1696751
         '  ' + NumeroIngles(StrToFloat(sValor))                                             +  ' AS VLRPREVISTO, '        + //#13 +

         '  0'                                                                               +  ' AS VLREFETIVO, '         + //#13 +
         '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                      +  ' AS SALDODEV, '           + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
         '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         'FROM '                                                                                                           + //#13 +
         '  DUAL ';

         // armazeno SQL montado no vetor
         vSQL[i] := sSQL;


         // ----------------------------------------------------------------------------------------
         //    GRAVAÇÃO no Vetor que será o Result da função
         // ----------------------------------------------------------------------------------------

         SetLength(vLista, k + 1);

         vLista[k].CodigoItem       := dtmCalcEmptmo.qryBuscaItensIDItemEmptmo.AsInteger;
         vLista[k].Nome             := dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString;
         vLista[k].iEvento          := iEvento;
         vLista[k].Origem           := iOrigem;

         vLista[k].SeqCobranca      := 1;
         vLista[k].Prioridade       := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

         vLista[k].FlgCentraliza    := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
         vLista[k].FlgDestacado     := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
         vLista[k].IdItemCentraliza := dtmCalcEmptmo.qryBuscaItensIdItemCentraliza.AsInteger;

         vLista[k].AnoCompetencia   := iAnoCompetencia;
         vLista[k].MesCompetencia   := iMesCompetencia;
         vLista[k].DataPrevista     := dDataVenc;

         vLista[k].Valor            := StrToFloat(ConverteVirg(sValor));

         vLista[k].Parcela          := iParcela;
         vLista[k].ParcelaAlt       := iParcelaAlt;
         vLista[k].ParcResta        := iParcResta;

         // Saldo Devedor
         fNovoSaldoDev              := rSaldoDevAnt.fSaldoDevAnt;

         // calcula o novo saldo devedor
         case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
            0: begin (* Não Tratar *) end;
            1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor;  // Abater
            2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor;  // Incorporar
         end;

         vLista[k].SaldoDevedor     := fNovoSaldoDev;
         vLista[k].TxJuros          := rSaldoDevAnt.fTxJurosAnt;

         vLista[k].FormaCobranca    := sFormaCobranca;

         vLista[k].FlgBaixado       := 0;
         vLista[k].FlgDivergPend    := -1;

         vLista[k].RecPag           := dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString;

         vLista[k].Regra            := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;

         vLista[k].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

         vLista[k].Rubrica          := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger;


         dtmCalcEmptmo.qryBuscaItens.Next;
         inc(iContador);

         inc(i);  // incrementa a variável de índice do vetor do SQL
         inc(k);  // incrementa a variável de índice do vetor da Lista

      end;  // while qryBuscaItens

      Result := True;

   finally
      LimpaParametros(dtmCalcEmptmo.qryItens);
      LimpaParametros(dtmCalcEmptmo.qryBuscaItens);

      if bMostraProgresso then frmProgresso.EscondeFormProgresso;
   end;
end;



function TCalcEmptmo.BuscaDataCredito(const iIdRegra      : Int64;
                                      const sTipoData     : String;
                                      const sTipoCobranca : String;
                                      const sFlgInterno   : String;
                                      const iIdPatro      : Int64;
                                      const iIdPlanoPrev  : Int64;
                                      const iParcela      : Integer;
                                      const dDataInscricao: TDateTime;
                                      const bExcepcional  : Boolean;
                                      const bMostraMSG    : Boolean;
                                      const iFlgInternet  : Integer = 0) : TDateTime;

var
   sSQL, sSQLRegra, sResultadoRegra : String;
   qry            : TwwQuery;
   sMes, sAno     : String;
   sDiasCredito   : String;
   sHoraEncerra   : String;
   sHoraConcessao : String;
   sExcepcional   : String;
   sSitFundacao   : String;
   iPais, iCidade, iEstado    : Int64;
   sUF            : String;
begin
  // Marchetti - 01/09/2003 - Pendencia 14939 - Passando o FLGINTERNET para
  // regra de data de crédito

   ParametrosSistema;
   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
   iEstado  := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
   sUF      := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

   (* se cobrança em Folha *)

  (* Cria a Query Auxiliar *)
   qry               := TwwQuery.Create(Application);
   qry.DatabaseName  := 'BaseDados';

   try

      sSitFundacao := sFlgInterno;

      if sTipoCobranca = 'F' then
      begin
         sSQL :=
         'SELECT '                                             + #13 +
         '  DIASAPOSC '                                        + #13 +
         'FROM '                                               + #13 +
         '  DATASPATROEMPTMO '                                 + #13 +
         'WHERE '                                              + #13 +
         '      ( IDPESSJUR   = ' + IntToStr(iIDPatro) + ' ) ' + #13 +
         '  AND ( IDPLANOPREV = ' + IntToStr(iIDPlanoPrev) + ' ) '       + #13 +
         '  AND ( SITFUNDACAO = ''PT'' )';

         with qry do
         begin
             SQL.Clear;
             SQL.Text := sSQL;
             Open;
             if IsEmpty then
               begin
                Close;
                Exit;
             end;
         end;

         if sTipoData = 'C' then sDiasCredito := qry.FieldByName('DIASAPOSC').AsString;

       (* se FormaCobranca *)
      end
      else if sTipoCobranca = 'C' then
      begin
         if sSitFundacao = 'CA' then sSitFundacao := 'PT';

         // Filtra DATASPATROEMPTMO
         sSQL :=
         'SELECT '                                             + #13 +
         '  DIASAPOSC '                                        + #13 +
         'FROM '                                               + #13 +
         '  DATASPATROEMPTMO '                                 + #13 +
         'WHERE '                                              + #13 +
         '      ( IDPESSJUR   = ' + IntToStr(iIDPatro) + ' ) '           + #13 +
         '  AND ( IDPLANOPREV = ' + IntToStr(iIDPlanoPrev) + ' ) '       + #13 +
         '  AND ( SITFUNDACAO = ' + QuotedStr(sSitFundacao) + ' )';

         with qry do
         begin
            SQL.Clear;
            SQL.Text := sSQL;
            Open;
            if IsEmpty then
            begin
               Close;
               Exit;
            end;
         end;

         if sTipoData = 'C' then sDiasCredito := qry.FieldByName('DIASAPOSC').AsString;

      end; (* if FormaCobranca *)

       qry.Close;

       qry.SQL.Text := 'SELECT HORAENCERRA FROM PARAMEMPTMO';
       qry.Open;
       sHoraEncerra := StringReplace(qry.FieldByName('HORAENCERRA').AsString,':','',[rfReplaceAll]);
       qry.Close;

       sHoraConcessao := StringReplace(Copy(TimeToStr(Time),1,5),':','',[rfReplaceAll]);

       if bExcepcional then
          sExcepcional := '1'
       else
          sExcepcional := '0';

       if sHoraEncerra = '' then sHoraEncerra := '23:59';

       sSQLRegra :=
       'SELECT '                                                                                  + #13 +
       '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInscricao))  + ' AS DATAINSC, '         + #13 +
       '  ' + sDiasCredito                                             + ' AS NDIASCREDITO, '     + #13 +
       '  ' + sHoraEncerra                                             + ' AS HORAENCERRA, '      + #13 +
       '  ' + sHoraConcessao                                           + ' AS HORACONCESSAO, '    + #13 +
       '  ' + IntToStr(iPais)                                          + ' AS IDPAIS, '           + #13 +
       '  ' + IntToStr(iCidade)                                        + ' AS IDCIDADES, '        + #13 +
       '  ' + QuotedStr(sUF)                                           + ' AS CODESTADO, '        + #13 +
       '  ' + sExcepcional                                             + ' AS EXCEPCIONAL, '      + #13 +
       //Pendência 22836 - 03/10/2006 - Alberto
       '  0' + IntToStr(Ord(bExcepcional))                             + ' AS FLGEXCEPCIONAL, '   + #13 +
       //Fim Pendência 22836
       '  ' + IntToStr(iFlgInternet)                                   + ' AS FLGINTERNET '       + #13 +
       'FROM '                                                                                    + #13 +
       '  DUAL';

       UtilizaRegraData(iIdRegra, sSQLRegra, 'a Data de Crédito', sResultadoRegra, bMostraMsg);

      if (sResultadoRegra <> '') and (sResultadoRegra <> 'NULO') then
      begin
         (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
         Result := StrToDate(sResultadoRegra)
      end
      else
      begin
         Result := 0;
      end;

   finally
     qry.Free;
   end;
end;



function TCalcEmptmo.BuscaData(sTipoData, sTipoCobranca, sFlgInterno: String; iIdPessjur,
                               iIdPlanoPrev, iParcela: Int64; dData: TDateTime): TDateTime;
var
   qryAux      : TwwQuery;
   sMes, sAno  : String;
begin
   (* Função que utiliza a função CritDataEmptmo da unit UFuncoesEmptmo que busca
      a data em que o empréstimo será creditado em relação a data de solicitação.
      É levado em consideração a Patrocinadora e data de crédito *)

   sMes := FormatDateTime('MM', dData);
   sAno := FormatDateTime('YYYY', dData);

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

      try

         (* No caso da situação do participante ser CANCELADO, significa que o participante em
            questão é um(a) Beneficiário(a) e tem que ser tratado como ASSISTIDO *)
         if sFlgInterno = 'CA' then sFlgInterno := 'AS';

         Result := StrToDate(CritDataEmptmo(qryAux, IntToStr(iIdPessjur), IntToStr(iIdPlanoPrev),
                                            sFlgInterno, sTipoData, sMes, sAno, sTipoCobranca,
                                            FormatDateTime('DD/MM/YYYY', dData), iParcela) );

      except
         Result := 0;
      end;

   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.BuscaTxAdministracao(const iIdRegra : Int64;
                                          dDataInscricao, dDataAssinatura : TDateTime;
                                          iIdTipoEmptmo, iIdTipoContrEmptmo: Int64;
                                          bMostraMSG : Boolean
                                          //Pendência 22836 - 03/10/2006 - Alberto
                                         ;const bExcepcional      : Boolean = false
                                          //Fim Pendência 22836
                                         ) : Currency;
var
   sSQLRegra, sResultadoRegra : String;
begin
   sSQLRegra :=
   'SELECT '                                                                                  + #13 +
   //Pendência 22836 - 03/10/2006 - Alberto
   '  0' + IntToStr(Ord(bExcepcional))                             + ' AS FLGEXCEPCIONAL, '   + #13 +
   //Fim Pendência 22836
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAssinatura)) + ' AS DATAASSIN, '        + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInscricao))  + ' AS DATAINSC, '         + #13 +
   '  ' + IntToStr(iIdTipoEmptmo)                                  + ' AS IDTIPOEMPTMO, '     + #13 +
   '  ' + IntToStr(iIdTipoContrEmptmo)                             + ' AS IDTIPOCONTREMPTMO ' + #13 +
   'FROM '                                                                                    + #13 +
   '  DUAL';

   if UtilizaRegraValor(iIdRegra, sSQLRegra, 'a Taxa de Administração', sResultadoRegra, bMostraMsg) then
   begin
      if (trim(sResultadoRegra) <> EmptyStr) and (sResultadoRegra <> 'NULO') then
      begin
         (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
         Result := StrToFloat(ConverteVirg(sResultadoRegra))
      end
      else
      begin
         Result := 0;
      end;
   end
   else
   begin
      Result := 0;
   end;
end;

function TCalcEmptmo.GravaContrato(var NovoContrato : TDadosContrato): boolean;
begin
   with dtmEmptmo.qryInsertContrato do
   begin
      // Próximo número de contrato usando a Sequence
      dtmEmptmo.qrySeqContrato.Open;
      NovoContrato.IDContratoEmptmo  := dtmEmptmo.qrySeqContratoSEQCONTRATOEMPTMO.AsFloat;
      dtmEmptmo.qrySeqContrato.Close;

      LimpaParametros(dtmEmptmo.qryInsertContrato);
      if NovoContrato.IDContratoEmptmo  >  0 then
         ParamByName('PIDCONTRATOEMPTMO').AsFloat    := NovoContrato.IDContratoEmptmo;
      if NovoContrato.IDContrQuitacao   > -1 then
         ParamByName('PIDCONTRQUITACAO').AsFloat     := NovoContrato.IDContrQuitacao;
      if NovoContrato.IDPessoa          > -1 then
         ParamByName('PIDPESSOA').AsInteger          := NovoContrato.IDPessoa;
      if NovoContrato.IDResponsavel     > -1 then
         ParamByName('PIDRESPONSAVEL').AsInteger     := NovoContrato.IDResponsavel;
      if NovoContrato.IDTipoContrEmptmo > -1 then
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger := NovoContrato.IDTipoContrEmptmo;
      if NovoContrato.IDPlanoPrev       > -1 then
         ParamByName('PIDPLANOPREV').AsInteger       := NovoContrato.IDPlanoPrev;
      if NovoContrato.IDPlanoOrigem     > -1 then
         ParamByName('PIDPLANOORIGEM').AsInteger     := NovoContrato.IDPlanoOrigem;
      if NovoContrato.IDPatro           > -1 then
         ParamByName('PIDPATRO').AsInteger           := NovoContrato.IDPatro;
      if NovoContrato.IDInscricaoEmptmo > -1 then
         ParamByName('PIDINSCRICAOEMPTMO').AsFloat   := NovoContrato.IDInscricaoEmptmo;
      if NovoContrato.IDVerba           > -1 then
         ParamByName('PIDVERBA').AsInteger           := NovoContrato.IDVerba;
      if NovoContrato.IDBenef           > -1 then
         ParamByName('PIDBENEF').AsInteger           := NovoContrato.IDBenef;
      if NovoContrato.IDCBancaria       > -1 then
         ParamByName('PIDCBANCARIA').AsInteger       := NovoContrato.IDCBancaria;
      if NovoContrato.IDCBancariaDeb    > -1 then
         ParamByName('PIDCBANCARIADEB').AsInteger    := NovoContrato.IDCBancariaDeb;
      if NovoContrato.CodFormaPag       > -1 then
         ParamByName('PCODFORMAPAG').AsInteger       := NovoContrato.CodFormaPag;
      if NovoContrato.PortFormaPag      > -1 then
         ParamByName('PPORTFORMAPAG').AsInteger      := NovoContrato.PortFormaPag;
      if NovoContrato.PortFormaRec      > -1 then
         ParamByName('PPORTFORMAREC').AsInteger      := NovoContrato.PortFormaRec;
      if NovoContrato.NumParcelas       > -1 then
         ParamByName('PNUMPARCELAS').AsInteger       := NovoContrato.NumParcelas;
      if NovoContrato.DataCredito       >  0 then
         ParamByName('PDATACREDITO').AsDateTime      := NovoContrato.DataCredito;
      if NovoContrato.DataSituacao      >  0 then
         ParamByName('PDATASITUACAO').AsDate         := NovoContrato.DataSituacao;
      if NovoContrato.DataAssinatura    >  0 then
         ParamByName('PDATAASSINATURA').AsDate       := NovoContrato.DataAssinatura;
      if NovoContrato.DataPrimParc      >  0 then
         ParamByName('PDATAPRIMPARC').AsDate         := NovoContrato.DataPrimParc;
      if NovoContrato.DataCanc          >  0 then
         ParamByName('PDATACANC').AsDate             := NovoContrato.DataCanc;
      if NovoContrato.VlrContrato      <>  0 then
         ParamByName('PVLRCONTRATO').AsFloat         := NovoContrato.VlrContrato;
      if NovoContrato.VlrParcela       <>  0 then
         ParamByName('PVLRPARCELA').AsFloat          := NovoContrato.VlrParcela;
      if NovoContrato.Txjuros          <>  0 then
         ParamByName('PTXJUROS').AsFloat             := NovoContrato.Txjuros;
      if NovoContrato.FlgSituacao      <> '' then
         ParamByName('PFLGSITUACAO').AsString        := NovoContrato.FlgSituacao;
      if NovoContrato.flgFormaRec      <> '' then
         ParamByName('PFLGFORMAREC').AsString        := NovoContrato.flgFormaRec;
      if NovoContrato.FlgFormaPag      <> '' then
         ParamByName('PFLGFORMAPAG').AsString        := NovoContrato.FlgFormaPag;
      if NovoContrato.VlrSalBase       <>  0 then
         ParamByName('PVLRSALBASE').AsFloat          := NovoContrato.VlrSalBase;
      if NovoContrato.VlrMargem        <>  0 then
         ParamByName('PVLRMARGEM').AsFloat           := NovoContrato.VlrMargem;
      if NovoContrato.VlrMaxPermit     <>  0 then
         ParamByName('PVLRMAXPERMIT').AsFloat        := NovoContrato.VlrMaxPermit;
      if NovoContrato.Indexador        <>  0 then
         ParamByName('PMOECODIGO').AsInteger         := NovoContrato.Indexador;
      if NovoContrato.VlrParcelaMes    <>  0 then
         ParamByName('PVLRPARCELAMES').AsFloat       := NovoContrato.VlrParcelaMes;
      if NovoContrato.VlrParcelaAtraso <>  0 then
         ParamByName('PVLRPARCATRASO').AsFloat       := NovoContrato.VlrParcelaAtraso;
      if NovoContrato.VlrDebito        <>  0 then
         ParamByName('PVLRDEBITO').AsFloat           := NovoContrato.VlrDebito;
      if NovoContrato.VlrReserva       <>  0 then
         ParamByName('PVLRRESERVA').AsFloat          := NovoContrato.VlrReserva;
      if NovoContrato.VlrPendencia     <>  0 then
         ParamByName('PVLRPENDENCIA').AsFloat        := NovoContrato.VlrPendencia;
      if NovoContrato.DataSaldoDev      >  0 then
         ParamByName('PDATASALDODEV').AsDate         := NovoContrato.DataSaldoDev;
      if NovoContrato.DataPendencia     >  0 then
         ParamByName('PDATAPENDENCIA').AsDate        := NovoContrato.DataPendencia;

      if NovoContrato.IDTipoSuspEmptmo > -1  then
         ParamByName('PIDTIPOSUSPEMPTMO').AsInteger  := NovoContrato.IDTipoSuspEmptmo;
      if NovoContrato.DataInicioSusp   > 0   then
         ParamByName('PDATAINICIOSUSP').AsDateTime   := NovoContrato.DataInicioSusp;
      if NovoContrato.DataFimSusp      > 0   then
         ParamByName('PDATAFIMSUSP').AsDateTime      := NovoContrato.DataFimSusp;
      if NovoContrato.AnoSuspensao     > 0   then
         ParamByName('PANOSUSPENSAO').AsInteger      := NovoContrato.AnoSuspensao;
      if NovoContrato.MesSuspensao     > 0   then
         ParamByName('PMESSUSPENSAO').AsInteger      := NovoContrato.MesSuspensao;

      if NovoContrato.NumParcDesconto  > -1  then
         ParamByName('PNUMPARCDESCONTO').AsInteger   := NovoContrato.NumParcDesconto;

      if NovoContrato.FlgExcepcional   = 1   then
         ParamByName('PFLGEXCEPCIONAL').AsInteger    := 1;
      if NovoContrato.FlgFinanciamento = 1   then
         ParamByName('PFLGFINANCIAMENTO').AsInteger  := 1;

      // Marchetti - Pendencia 26806
      if NovoContrato.FlgUsaMargemAlt > -1   then
         ParamByName('PFLGUSAMARGEMALT').AsInteger   := NovoContrato.FlgUsaMargemAlt;

      //Pendência 26775 - 26/12/2007
      if NovoContrato.IDPLanoCob      > -1   then
         ParamByName('PIDPLANOCOB').AsInteger        := NovoContrato.IDPLanoCob;

      // SOL:108099 Daniel Begnami
      if ((NovoContrato.TSEMeses <> 0) and (NovoContrato.TSEMeses <> -1)) then
        ParamByName('PTSEMESES').AsInteger  := NovoContrato.TSEMeses
      else
        ParamByName('PTSEMESES').AsInteger  := 0;

       ParamByName('PNUMPROTOCOLO').AsString  := NovoContrato.sNumNup; //Monica - 172525

      //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - SEMPRE PASSAR "0" COMO DEFAULT NO INSERT
      ParamByName('PFLGPERDAEFETIVA').AsInteger  := 0;
      //BRUNO AZEVEDO - VOTO DE EMPRESTIMO -
      // FIM

      try
         ExecSQL;
         Result := True;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Result := False;
         end;
      end;

   end;  // with dtmEmptmo.qryInsertContrato
end;


(* função que varre a lista de itens de um contrato e se for o caso,
   chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO.
   A saída será True se a operação foi bem sucedida e False caso negativo *)
function TCalcEmptmo.GravaMovEmptmo(const rContrato               : TDadosContrato;
                                    const vLista                  : TListaItem;
                                    const iEvento                 : Integer;
                                    const iParcela                : Integer;
                                    const iAnoCompetencia         : Integer;
                                    const iMesCompetencia         : Integer;
                                    const iAnoCobranca            : Integer;
                                    const iMesCobranca            : Integer;
                                    const iParcelasRemanescentes  : Integer;
                                    const dDataPrevista           : TDateTime;
                                    const dDataUltAtualiza        : TDateTime;
                                    const sFormaEnvio             : String;
                                    const sTipoFolha              : String;
                                    const bMostraProgresso        : Boolean;
                                    const iIDCBancaria            : Integer = -1;
                                    const bTrataDivergNOVO : Boolean = False // 92334 Daniel Begnami
                                   ): Boolean;
var
   i        : Integer;
   sFiario  : String;
begin
   // Instancia o Fiário
   Fiario := TFiario.Create;

   Result := False;

   try
      if bMostraProgresso then frmProgresso.MostraFormProgresso('Gravando Itens...',
                                                                False,
                                                                False,
                                                                True,
                                                                0,
                                                                High(vLista)
                                                               );

      // -------------------------------------------------------------------------------------------

      for i := 0 to High(vLista) do
      begin
         if bMostraProgresso then
         begin
            frmProgresso.AndaFormProgresso(i + 1);    // Atualizando a Barra de Progresso
            if frmProgresso.Cancelou then Exit;       // Verifica se o usuário Cancelou a Operação
         end;

         // Verifica qual tipo de item para decidir se grava ou não
         if ( vLista[i].iEvento = iEvento ) then
         begin
            if iParcela > -1              then vLista[i].Parcela          := iParcela;
            if vLista[i].ParcelaAlt = -1  then vLista[i].ParcelaAlt       := vLista[i].Parcela;
            if iAnoCompetencia > -1       then vLista[i].AnoCompetencia   := iAnoCompetencia;
            if iMesCompetencia > -1       then vLista[i].MesCompetencia   := iMesCompetencia;

            vLista[i].AnoCobranca      := iAnoCobranca;
            vLista[i].MesCobranca      := iMesCobranca;
            vLista[i].DataPrevista     := dDataPrevista;
            vLista[i].DataUltAtualiza  := dDataUltAtualiza;

            vLista[i].FlgEnvio      := 0;

            // não se enviam itens de atualização diária do Saldo Devedor
            if (iEvento = 5) or (iEvento = 8) then vLista[i].FlgEnvio := -1;
//            if iEvento = 5 then vLista[i].FlgEnvio := -1;

            // -------------------------------------------------------------------------------------
            if sFormaEnvio <> '' then vLista[i].FormaCobranca := sFormaEnvio;

            if vLista[i].FormaCobranca = 'F' then
            begin
               if sTipoFolha <> '' then
               begin
                  vLista[i].TipoFolha     := sTipoFolha;
               end
               else
               begin
                  vLista[i].TipoFolha     := 'P';
               end;

               if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
                  if vLista[i].Origem <> 10 then
                     vLista[i].TipoFolha := '';
            end;
            // -------------------------------------------------------------------------------------

            if (iParcelasRemanescentes > -1) then
                vLista[i].ParcResta  := iParcelasRemanescentes;

            // função que grava as informações pertinentes a um contrato no histórico de movimento
            //   de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
            //   bem sucedida e False caso negativo

            // 92334 Daniel Begnami
            if bTrataDivergNOVO then
            begin
              if not(InsertMovEmptmo(vLista[i], rContrato, iIDCBancaria, True)) then
                Exit;
            end
            else
            begin
              if not(InsertMovEmptmo(vLista[i], rContrato, iIDCBancaria, False)) then
                Exit;
            end;
            // Fim

         end;  // if ( vLista[i].iEvento = iEvento )
      end;  // for

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // Fiário
      case iEvento of
         0: sFiario := 'Concessão de Empréstimo';
         2: sFiario := 'Amortização de Empréstimo';
         3: sFiario := 'Quitação de Empréstimo';
      end;

      // se for inserção, incluir o Fiário
      if (dtmEmptmo.qryParamEmptmoFLGUSAFIARIO.AsInteger = 1) and (iEvento in [0, 2, 3]) then
      begin
         Fiario.IDPessoa      := rContrato.IDBenef;
         Fiario.IDTitular     := rContrato.IDPessoa;
         Fiario.IDUsuario     := Sistema.IdUsuario;
         Fiario.IDModulo      := Sistema.IDModulo;
         Fiario.IDRubs        := 0;
         Fiario.IDGrupo       := 1;
         Fiario.DataInclusao  := SysDate;
         Fiario.Descricao     := sFiario;

        if Fiario.Inserir then
           Result := True;
        end
      else
      begin
         Result := True;
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

   finally
      Fiario.Free;
      if bMostraProgresso then
         frmProgresso.EscondeFormProgresso;
   end;
end;

//Pendência 20133 - 22/01/2007 - Alberto
function TCalcEmptmo.ConverteVirgulaParaPonto( fNum : real ) : String;
begin
  Result := OraNumero( FloatToStr( fNum ) );
end; {ConverteVirgulaParaPonto}



function TCalcEmptmo.StrSubst( Str, SubStrOld, SubStrNew : WideString ) : WideString;
var
  iPos : integer;
begin
  Result := Str;
  while True do
  begin
    iPos := Pos( SubStrOld, Result );

    if iPos <= 0 then break;

    Result := Copy( Result, 1, iPos - 1 ) + SubStrNew +
              Copy( Result, iPos + length( SubStrOld ),
              length(Result) - length( SubStrOld ) - iPos + 1 );
  end;
end; {StrSubst}
//Fim Pendência 20133

function TCalcEmptmo.InsertMovEmptmo(const ItemContrato     : TItemRecDep;
                                     const rContrato        : TDadosContrato;
                                     const iIDCBancaria     : Integer = -1;
                                     const bTrataDivergNOVO : Boolean = False // 92334 Daniel Begnami
                                    ): Boolean;
var
   sMsgErro    : String;
   //Pendência 20133 - 22/01/2007 - Alberto
   sCampos, sValores, sSQL : string;
   //Fim Pendência 20133

   //BRUNO AZEVEDO SOL 131233 KINTANA 745205
   xQryItens: TwwQuery;
   iItensAberto: Integer;
   sFlgSituacao: String;
   //BRUNO AZEVEDO SOL 131233 KINTANA 745205
   
   rSaldosAntPos        : TSaldosAntPos; //Renato Visoni SOL 134495 Kintana 855067

begin
   // ----------------------------------------------------------------------------------------------
   // função que grava as informações pertinentes a um contrato no histórico de movimento
   //   de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
   //   bem sucedida e False caso negativo
   // ----------------------------------------------------------------------------------------------

   // André Pontes - 19/12/2005
   if rContrato.IDContratoEmptmo <= 0 then
   begin
      Result := False;
      Exit;
   end;
   // FIM André Pontes - 19/12/2005

   // ----------------------------------------------------------------------------------------------

   if (ItemContrato.Valor = 0) and
      (ItemContrato.ValorEfetivo = 0) and
      not(ItemContrato.FlgGravaZERO) then
   begin
      Result := True;
      Exit;
   end;

   //BRUNO AZEVEDO SOL 131233 KINTANA 745205
   try
      xQryItens := TwwQuery.Create(Application);
      with xQryItens do begin
         DatabaseName  := 'BaseDados';
      
         Close;
         Sql.Clear;
         Sql.Add('SELECT');
         Sql.Add('   COUNT(1) AS ITENSABERTO');
         Sql.Add('FROM');
         Sql.Add('   HISTMOVEMPTMO  HME,');
         Sql.Add('   TIPOSUSPEMPTMO TSE,');
         Sql.Add('   ITEMEMPTMO     ITE');
         Sql.Add('WHERE');
         Sql.Add('       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )');
         Sql.Add('   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )');
         Sql.Add('   AND ( HME.HMETIPOMOV       IN (1, 2, 3, 4, 7) )');
         Sql.Add('   AND ( HME.FLGBAIXADO       = 0 )');
         Sql.Add('   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0) )');
         Sql.Add('   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO   = 0) )');
         Sql.Add('   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO   = 0) )');
         Sql.Add('   AND HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO');
         Sql.Add('   AND HME.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)');
         Sql.Add('   AND (');
         Sql.Add('       (:PINIBESUSP           IS NULL)');
         Sql.Add('       OR');
         Sql.Add('       (:PINIBESUSP           = 1 AND (');
         Sql.Add('                                      NVL(HME.FLGSUSPENSAO, 0)  = 0 OR');
         Sql.Add('                                      (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1)');
         Sql.Add('                                      )');
         Sql.Add('       )');
         Sql.Add('       )');
         ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then begin
            ParamByName('PINIBESUSP').AsString      := '1';
         end else begin
            ParamByName('PINIBESUSP').Clear;
         end;
         Open;
         iItensAberto := FieldByName('ItensAberto').AsInteger;

         Close;
         Sql.Clear;
         Sql.Add('SELECT FLGSITUACAO FROM CONTRATOEMPTMO');
         Sql.Add(' WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO');
         ParamByName('IDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
         Open;

         sFlgSituacao := FieldByName('FLGSITUACAO').AsString;
      end;
   finally
      xQryItens.Close;
      FreeAndNil(xQryItens);
   end;

   //Renato Visoni SOL 134495 Kintana 855067
   rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContrato.IDContratoEmptmo,
                                                 rContrato.DataCredito,
                                                 );
  //Renato Visoni SOL 134495 Kintana 855067


   if (ItemContrato.iEvento = 3) and
      (sFlgSituacao = 'E') and
      //(ItemContrato.SaldoDevedor = 0) and
      (rContrato.VlrSaldoDev = 0) and //BRUNO AZEVEDO SOL 151331 KINTANA 1108957
      //(rSaldosAntPos.fSaldoDevPos = 0) and //Renato Visoni SOL 134495 Kintana 855067
      (iItensAberto = 0) then begin
      Result := True;
      Exit;
   end; 
   //BRUNO AZEVEDO SOL 131233 KINTANA 745205

   // 92334 Daniel Begnami
   if bTrataDivergNOVO then
   begin
     sCampos := sCampos + 'IDHISTMOVEMPTMO, ';
     sValores := sValores + '12345, ';
   end
   else
   begin
   sCampos := sCampos + 'IDHISTMOVEMPTMO, ';
   sValores := sValores + 'SEQHISTMOVEMPTMO.NEXTVAL, ';
   end;
   // Fim

   //Pendência 20133 - 22/01/2007 - Alberto
   // -------------------------------------------------------------------------------------------
   if rContrato.IDContratoEmptmo > 0      then begin sCampos := sCampos + 'IDCONTRATOEMPTMO, '; sValores := sValores + ConverteVirgulaParaPonto( rContrato.IDContratoEmptmo ) + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.ParcelaAlt > -1        then begin sCampos := sCampos + 'HMEPARCELAALT, '; sValores := sValores + IntToStr( ItemContrato.ParcelaAlt ) + ', '; end;
   if ItemContrato.Parcela > -1           then begin sCampos := sCampos + 'HMEPARCELA, '; sValores := sValores + IntToStr( ItemContrato.Parcela ) + ', '; end;
   if ItemContrato.ParcResta > -1         then begin sCampos := sCampos + 'HMENUMPARCELAS, '; sValores := sValores + IntToStr( ItemContrato.ParcResta ) + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.iEvento > -1           then begin sCampos := sCampos + 'HMETIPOMOV, '; sValores := sValores + IntToStr( ItemContrato.iEvento ) + ', '; end;
   if ItemContrato.Origem > -1            then begin sCampos := sCampos + 'HMEORIGEM, '; sValores := sValores + IntToStr( ItemContrato.Origem ) + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.CodigoItem <> -1       then begin sCampos := sCampos + 'IDITEMEMPTMO, '; sValores := sValores + IntToStr( ItemContrato.CodigoItem ) + ', '; end;
   if ItemContrato.RecPag <> ''           then begin sCampos := sCampos + 'HMERECPAG, '; sValores := sValores + QuotedStr( trim( ItemContrato.RecPag ) ) + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.FormaCobranca <> ''    then begin sCampos := sCampos + 'HMEFORMACOBRANCA, '; sValores := sValores + QuotedStr( ItemContrato.FormaCobranca ) + ', '; end;
   // só grava HMETIPOFOLHA se a forma de cobrança for Folha
   if ItemContrato.FormaCobranca = 'F' then
      if ItemContrato.TipoFolha     <> '' then begin sCampos := sCampos + 'HMETIPOFOLHA, '; sValores := sValores + QuotedStr( ItemContrato.TipoFolha ) + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.FlgCentraliza > -1     then begin sCampos := sCampos + 'HMECENTRALIZA, '; sValores := sValores + IntToStr( ItemContrato.FlgCentraliza ) + ', '; end;
   if ItemContrato.FlgDestacado > -1      then begin sCampos := sCampos + 'HMEDESTACADO, '; sValores := sValores + IntToStr( ItemContrato.FlgDestacado ) + ', '; end;
   if ItemContrato.IdItemCentraliza > 0   then begin sCampos := sCampos + 'IDITEMCENTRALIZA, '; sValores := sValores + IntToStr( ItemContrato.IdItemCentraliza ) + ', '; end;
   // -------------------------------------------------------------------------------------------

   if ItemContrato.DataPrevista <> 0      then begin sCampos := sCampos + 'HMEDATAPREVISTA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataPrevista ) + ''', ''DD/MM/YYYY'')' + ', '; end;
   if ItemContrato.DataVencto    > 0      then begin sCampos := sCampos + 'HMEDATAVENCTO, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataVencto ) + ''', ''DD/MM/YYYY'')' + ', '; end
   else if ItemContrato.DataPrevista <> 0 then begin sCampos := sCampos + 'HMEDATAVENCTO, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataPrevista ) + ''', ''DD/MM/YYYY'')' + ', '; end;
   //Fim Pendência 24405

   if ItemContrato.DataEfetiva  > 0       then begin sCampos := sCampos + 'HMEDATAEFETIVA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataEfetiva ) + ''', ''DD/MM/YYYY'')' + ', '; end;
   if ItemContrato.DataReceb  > 0         then begin sCampos := sCampos + 'HMEDATARECEB, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataReceb ) + ''', ''DD/MM/YYYY'')' + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.DataUltAtualiza  > 0   then begin sCampos := sCampos + 'HMEDATAATUALIZA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataUltAtualiza ) + ''', ''DD/MM/YYYY'')' + ', '; end;
                                                     // HMEDATA -> Data do Processamento
                                                     sCampos := sCampos + 'HMEDATA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', trunc( Sysdate ) ) + ''', ''DD/MM/YYYY'')' + ', ';
   // -------------------------------------------------------------------------------------------
   if ItemContrato.AnoCompetencia > -1    then begin sCampos := sCampos + 'HMEANOCOMPETENCIA, '; sValores := sValores + IntToStr( ItemContrato.AnoCompetencia ) + ', '; end;
   if ItemContrato.MesCompetencia > -1    then begin sCampos := sCampos + 'HMEMESCOMPETENCIA, '; sValores := sValores + IntToStr( ItemContrato.MesCompetencia ) + ', '; end;
   if ItemContrato.AnoCobranca > -1       then begin sCampos := sCampos + 'HMEANOCOBRANCA, '; sValores := sValores + IntToStr( ItemContrato.AnoCobranca ) + ', '; end;
   if ItemContrato.MesCobranca > -1       then begin sCampos := sCampos + 'HMEMESCOBRANCA, '; sValores := sValores + IntToStr( ItemContrato.MesCobranca ) + ', '; end;
   // -------------------------------------------------------------------------------------------
                                                     sCampos := sCampos + 'HMESALDODEV, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.SaldoDevedor ) + ', ';
                                                     sCampos := sCampos + 'HMETXJUROS, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.TxJuros ) + ', ';
   // -------------------------------------------------------------------------------------------
                                                     sCampos := sCampos + 'HMEVLRPREVISTO, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.Valor ) + ', ';
   if ItemContrato.ValorEfetivo <> 0      then begin sCampos := sCampos + 'HMEVLREFETIVO, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.ValorEfetivo ) + ', '; end;

   // grava valor efetivo ZERO apenas se o valor previsto também for ZERO
   if (ItemContrato.ValorEfetivo = 0) and (ItemContrato.Valor = 0) then
   begin
                                                     sCampos := sCampos + 'HMEVLREFETIVO, '; sValores := sValores + '0' + ', ';
   end;

   if ItemContrato.ValorBase <> 0         then begin sCampos := sCampos + 'HMEVLRBASE, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.ValorBase ) + ', '; end;
   // -------------------------------------------------------------------------------------------
   if ItemContrato.Regra > 0              then begin sCampos := sCampos + 'IDREGRA, '; sValores := sValores + IntToStr( ItemContrato.Regra ) + ', '; end
   else                                        begin sCampos := sCampos + 'IDREGRA, '; sValores := svalores + 'null' + ', '; end;

   // IDRUBRICA -> Será o IDProvento NORMAL do Item a ser gravado
   if ItemContrato.Rubrica > 0            then begin sCampos := sCampos + 'IDRUBRICA, '; sValores := sValores + IntToStr( ItemContrato.Rubrica ) + ', '; end
   else                                        begin sCampos := sCampos + 'IDRUBRICA, '; sValores:= sValores + 'null' + ', '; end;

   if ItemContrato.SeqCobranca > -1       then begin sCampos := sCampos + 'HMESEQCOBRANCA, '; sValores := sValores + IntToStr( ItemContrato.SeqCobranca ) + ', '; end;

   if ItemContrato.FlgEnvio > -1          then begin sCampos := sCampos + 'FLGENVIO, '; sValores := sValores + IntToStr( ItemContrato.FlgEnvio ) + ', '; end;
   if ItemContrato.FlgBaixado > -1        then begin sCampos := sCampos + 'FLGBAIXADO, '; sValores := sValores + IntToStr( ItemContrato.FlgBaixado ) + ', '; end;
   if ItemContrato.FlgDivergPend > -1     then begin sCampos := sCampos + 'FLGDIVERGPEND, '; sValores := sValores + IntToStr( ItemContrato.FlgDivergPend ) + ', '; end;

   if ItemContrato.Prioridade > -1        then begin sCampos := sCampos + 'HMEPRIORIDADE, '; sValores := sValores + IntToStr( ItemContrato.Prioridade ) + ', '; end;

   if ItemContrato.FlgTipoDiverg > -1     then begin sCampos := sCampos + 'FLGTIPODIVERG, '; sValores := sValores + IntToStr( ItemContrato.FlgTipoDiverg ) + ', '; end;
   // -------------------------------------------------------------------------------------------
                                                     sCampos := sCampos + 'VERSAO, '; sValores := sValores + QuotedStr( copy(Sistema.Versao,1,10) ) + ', ';
   // -------------------------------------------------------------------------------------------
   if iIDCBancaria > 0                    then begin sCampos := sCampos + 'IDCBANCARIA, '; sValores := sValores + IntToStr( iIDCBancaria ) + ', '; end;
   //Pendência 24303 - 26/01/2007 - Alberto
   if rContrato.IDPatro > 0               then begin sCampos := sCampos + 'IDPATRO, '; sValores := sValores + IntToStr( rContrato.IDPatro ) + ', '; end;
   if rContrato.IDPlanoOrigem > 0         then begin sCampos := sCampos + 'IDPLANOPREVCONTAB, '; sValores := sValores + IntToStr( rContrato.IDPlanoOrigem ) + ', '; end;
   //Pendência 24303
   // -------------------------------------------------------------------------------------------
   // -------------------------------------------------------------------------------------------

   //Renato Visoni SOL 100478,100476,100479
   if Trim(rContrato.OrigemRecurso) <> ''  then begin
     sCampos  := sCampos + 'ORIGEMRECURSO, ';
     sValores := sValores + QuotedStr(rContrato.OrigemRecurso) + ', ' ;
   end;

   if Trim(rContrato.TipoRecurso)    <> ''  then begin
    sCampos  := sCampos + 'IDTIPORECURSO, ';
    sValores := sValores + QuotedStr(rContrato.TipoRecurso) + ', ' ;
   end;
   //Fim

   // Marchetti - Pendencia 23319
   if Trim(ItemContrato.Observacao) <> EmptyStr then
   begin
      sCampos  := sCampos   + 'HMEOBSERVACAO, ';
      sValores := sValores  + QuotedStr(Trim(ItemContrato.Observacao)) + ', ';
   end;
   // Fim Marchetti - Pendencia 23319

   // 92334 Daniel Begnami
   if bTrataDivergNOVO then
   begin
     sCampos := sCampos + 'FLGSITREG, FLGEFETIVADO, ';
     sValores := sValores + quotedstr('I') + ', '+ quotedstr('N') + ', ';
   end;
   // Fim

   sCampos  := Copy( sCampos,  1, length( sCampos  ) - 2 );
   sValores := Copy( sValores, 1, length( sValores ) - 2 );

   // 92334 Daniel Begnami
   if bTrataDivergNOVO then
     sSQL := ' INSERT INTO PREPARAHISTMOVEMPTMO ( ' + sCampos + ' ) VALUES ( ' + sValores + ' ) '
   else
     sSQL := ' INSERT INTO HISTMOVEMPTMO ( ' + sCampos + ' ) VALUES ( ' + sValores + ' ) ';
   // Fim

   //Fim Pendência 20133
   try
      try

         with dtmEmptmo.qryInsertHistMovEmptmo do
         begin
            //Pendência 20133 - 22/01/2007 - Alberto
            SQL.Text := sSQL;
            //Pendência 20133 - 22/01/2007 - Alberto

            ExecSQL;
            Result := True;
         end;  // with dtmEmptmo.qryInsertHistMovEmptmo

      except
         on E:Exception do
         begin
            Result   := False;
            sMsgErro := 'Ocorreu um erro na Gravação do Histórico: ' + E.Message;
            MsgDlg(sMsgErro, 'Empréstimo', mtError, [mbOk], 0);
         end;
      end;

   finally
   end;

end;




function TCalcEmptmo.BuscaVlrSolicMax(const rContrato          : TDadosContrato;
                                      const iIdSitPart         : Int64;
                                      const fTxJuros           : Currency;
                                      const fMargem            : Currency;
                                      const fReserva           : Currency;
                                      const fSaldoEPAnt        : Currency;
                                      const fVlrContratosAnt   : Currency;
                                      const fSalParticipacao   : Currency;
                                      const fSalMantido        : Currency;
                                      const fSalAuxDoenca      : Currency;
                                      const fSalBenef          : Currency;
                                      const fSalarioBase       : Currency;
                                      const bMostraMsg         : Boolean;
                                      //Pendência 26951 - 03/12/2007
                                      const aListaContrato     : array of Extended;
                                      const iLote              : Integer = 0;
                                      //Pendência 22836 - 03/10/2006 - Alberto
                                      const bExcepcional       : Boolean = false;
                                      const qryContrAnt        : TQuery = nil;
                                      // SOL:108099 Daniel Begnami
                                      const pQtdeParcSusp      : integer = 0;
                                      const pIDTipoSuspEmptmo  : integer = -1
                                      // FIM
                                     ): Currency;
var
   sSQL, sVlrSolicMax : String;
   qryAux             : TwwQuery;
   qryTodosContratos  : TwwQuery;
   sFlgInterno        : String;
   i, iQuita          : Integer;
   iContador          : Integer;
   iRegra             : Integer;
   dDataNasc          : TDateTime; //Ádler Souza - SOL 140487 KINTANA 858970
begin
   (* função que busca o Valor Máximo Possivel para o Empréstimo *)

   (* Cria e Abre a Query Auxiliar *)
   qryAux                          := TwwQuery.Create(Application);
   qryAux.DatabaseName             := 'BaseDados';

   qryTodosContratos               := TwwQuery.Create(Application);
   qryTodosContratos.DatabaseName  := 'BaseDados';

   try
      try
         sSQL :=
         'SELECT '                           + #13 +
         '  FLGINTERNO '                     + #13 +
         'FROM '                             + #13 +
         '  SITPART '                        + #13 +
         'WHERE '                            + #13 +
         '  ( IDSITPART = '                  + IntToStr(iIdSitPart) + ' ) ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         sFlgInterno := qryAux.FieldByName('FLGINTERNO').AsString;

         // seleciona a regra de Valor Máximo
         sSQL :=
         'SELECT '                           + #13 +
         '  IDREGRAVLRMAX AS IDREGRACALC '   + #13 +
         'FROM '                             + #13 +
         '  TIPOCONTREMPTMO '                + #13 +
         'WHERE '                            + #13 +
         '  ( IDTIPOCONTREMPTMO = '          + IntToStr(rContrato.IDTipoContrEmptmo) + ' ) ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         // se não houver sido associada uma regra ao Valor Máximo,
         // pega a regra de cálculo do item de menor sequência de cálculo
         if (qryAux.IsEmpty) or (qryAux.FieldByName('IDREGRACALC').AsInteger <= 0) then
         begin
            sSQL :=
            'SELECT '                                                                                    + #13 +
            '  IDREGRACALC '                                                                             + #13 +
            'FROM '                                                                                      + #13 +
            '  ITEMXTIPOCONTR '                                                                          + #13 +
            'WHERE '                                                                                     + #13 +
            '      ( IDTIPOCONTREMPTMO = ' + IntToStr(rContrato.IDTipoContrEmptmo) + ' ) '               + #13 +
            '  AND ( ITCEVENTO         = 0 ) '                                                           + #13 +
            '  AND ( ITCSEQCALCULO     = '                                                               + #13 +
            '        ( '                                                                                 + #13 +
            '        SELECT '                                                                            + #13 +
            '           MIN(SEQ.ITCSEQCALCULO) '                                                         + #13 +
            '        FROM '                                                                              + #13 +
            '           ITEMXTIPOCONTR SEQ '                                                             + #13 +
            '        WHERE '                                                                             + #13 +
            '               ( SEQ.ITCEVENTO         = 0 ) '                                              + #13 +
            '           AND ( SEQ.IDTIPOCONTREMPTMO = ' + IntToStr(rContrato.IDTipoContrEmptmo) + ' ) '  + #13 +
            '        ) '                                                                                 + #13 +
            '      ) ' ;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Text := sSQL;
            qryAux.Open;
         end;

         iRegra := qryAux.FieldByName('IDREGRACALC').AsInteger;


         //Ádler Souza - SOL 136877 KINTANA 858970
         //---------------------------------------------------------------------

         sSQL := 'SELECT DATANASC FROM PESSOAFISICA '   + #13 +
                 ' WHERE IDPESSOA = ' + IntToStr(rContrato.IDBENEF);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         dDataNasc := qryAux.FieldByName('DATANASC').AsDateTime;

         //---------------------------------------------------------------------



         //Alberto - Pendência 26951 - 03/12/2007
         sSQL := '';

         if Sistema.TipoCliente = 19991 then
         begin
            if (qryContrAnt <> nil) then
            begin
               // Ajuste Pendencia 26951 - Marchetti
               // Pendencia 27061 - Marchetti
               // Ajustada a rotina para poder mostrar todos os contratos ativos do mutuário
               // independente se o mesmo esteja ou não na lista de contratos quitáveis
               with qryTodosContratos do
               begin
                  // Carrega a query dos contratos anteriores.
                  // Não utiliza o parametro (PQUITAVEL) de somente os contratos quitáveis, logo,
                  // traz todos os contratos que não estejam cancelados ou quitados do mutuário.
                  // Após a abertura da query, filtra os registros para trabalhar somente com os
                  // contratos que ainda estão ATIVOS.
                  Sql.Text := qryContrAnt.Sql.Text;
                  Params   := qryContrAnt.Params;

                  LimpaParametros(qryTodosContratos);

                  if dtmEmptmo.qryParamEmptmoFLGPENDCONCESSAO.AsInteger = 0 then
                  begin
                     ParamByName('PHMEDATA').AsDate      := rContrato.DataCredito;
                  end
                  else
                  begin
                     ParamByName('PHMEDATA').AsDate      := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(rContrato.DataCredito),
                                                                                DiasUteis.ExtraiMes(rContrato.DataCredito));
                  end;

                  ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := rContrato.IdTipoContrEmptmo;
                  ParamByName('PHMEDATAATUALIZA').AsDate       := rContrato.DataCredito;

                  if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger <> 1 then
                  begin
                     ParamByName('PHMEDATAATUALIZA').AsDate := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(rContrato.DataCredito),
                                                                                   DiasUteis.ExtraiMes(rContrato.DataCredito));
                  end;
                  // FIM André Pontes - 01/07/2005
                  // -------------------------------------------------------------------------------------------

                  ParamByName('PIDPESSOA').AsInteger     := rContrato.IDPESSOA;
                  ParamByName('PIDBENEF').AsInteger      := rContrato.IDBENEF;
                  ParamByName('PIDTIPOEMPTMO').AsInteger := rContrato.IDTipoEmptmo;
                  Open;

                  Filter   := 'FLGSITUACAO = ''A''';
                  Filtered := True;
                  First;

               end;  // with qryTodosContratos

               if not qryTodosContratos.IsEmpty then
               begin

                  while not qryTodosContratos.eof do
                  begin
                     if sSQL <> '' then sSQL := sSQL + 'UNION ' + #13;
                     iQuita := 0;

                     for iContador := 0 to Length(aListaContrato)-1 do
                     begin
                        if aListaContrato[iContador] = qryTodosContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat then
                           iQuita := 1;
                     end;

                     sSQL := sSQL +
                     'SELECT '                                                                                       + #13 +
                     ' 1'                                                                + ' AS TIPO, '              + #13 +
                     '  ' + qryTodosContratos.FieldByName('IDPATRO').AsString            + ' AS IDPESSJUR, '         + #13 +
                     '  ' + qryTodosContratos.FieldByName('IDPLANOPREV').AsString        + ' AS IDPLANOPREV, '       + #13 +
                     '  ' + qryTodosContratos.FieldByName('IDBENEF').AsString            + ' AS IDPESSOA, '          + #13 +
                     '  ' + qryTodosContratos.FieldByName('IDTIPOCONTREMPTMO').AsString  + ' AS IDTIPOCONTREMPTMO, ' + #13 +
                     '  ' + qryTodosContratos.FieldByName('IDPESSOA').AsString           + ' AS IDTITULAR, '         + #13 +
                     ' 1'                                                                + ' AS SEQPROPOSTA, '       + #13 +
                     '  ' + IntToStr(iIdSitPart)                                         + ' AS IDSITPART, '         + #13 +
                     '  ' + QuotedStr(sFlgInterno)                                       + ' AS FLGINTERNO, '        + #13 +
                     ' 0' + qryTodosContratos.FieldByName('NUMPARCELAS').AsString        + ' AS NUMPARCELAS, '       + #13 +
                     ' 0'                                                                + ' AS MARGEM, '            + #13 +
                     ' 0'                                                                + ' AS RESERVA, '           + #13 +
                     ' 0'                                                                + ' AS TXJUROS, '           + #13 +
                     ' 0'                                                                + ' AS SALDOEPANT, '        + #13 +
                     '  ' + NumeroIngles(qryTodosContratos.FieldValues['HMESALDODEV'])   + ' AS SALDODEV, '          + #13 +
                     ' 0'                                                                + ' AS VLRCONTRATOSANT, '   + #13 +
                     ' 0'                                                                + ' AS SALPARTICIPACAO, '   + #13 +
                     ' 0'                                                                + ' AS SALMANTIDO, '        + #13 +
                     ' 0'                                                                + ' AS SALAUXDOENCA, '      + #13 +
                     ' 0'                                                                + ' AS SALBENEF, '          + #13 +
                     ' 0'                                                                + ' AS SALARIOBASE, '       + #13 +
                     ' 0' + IntToStr(Ord(bExcepcional))                                  + ' AS FLGEXCEPCIONAL, '    + #13 +
                     ' 0' + IntToStr(iLote)                                              + ' AS FLGLOTE, '           + #13 +
                     ' 0'                                                                + ' AS VLRMAXPERMIT, '      + #13 +
                     //Pendência 26950 - 30/11/2007
                     '  ' + NumeroIngles(qryTodosContratos.FieldValues['VLRCONTRATO'])   + ' AS VALORSOLIC, '        + #13 +
                     '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryTodosContratos.FieldValues['DATAASSINATURA'])) + ' AS DATAASSIN, '       + #13 +
                     '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryTodosContratos.FieldValues['DATACREDITO']))    + ' AS DATACREDITO, '     + #13 +
                     '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryTodosContratos.FieldValues['DATAPRIMPARC']))   + ' AS DATAPRIMPARC, '    + #13 +
                     '  ' + IntToStr(iQuita)                                                                         + ' AS FLGQUITA, '           + #13 +
                     //Fim Pendência 26950

                     //Ádler Souza - SOL 136877 KINTANA 858970
                     '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataNasc))                   + ' AS DATANASC, '           + #13 +

                     //FIM

                     // SOL:108099 Daniel Begnami
                     '  ' + IntToStr(pQtdeParcSusp)                                             + ' AS TSEMESES, '           + #13 +
                     '  ' + IntToStr(pIDTipoSuspEmptmo)                                         + ' AS IDTIPOSUSPEMPTMO '    + #13 +
                     // FIM

                     'FROM '                                                                                   + #13 +
                     '  DUAL '                                                                                 + #13;

                     qryTodosContratos.Next;

                  end;

               end;
               // Fim Ajuste Pendencia 26951 - Marchetti
               // Fim Pendencia 27061 - Marchetti
            end;

         end;
         if sSQL <> '' then sSQL := sSQL + 'UNION ' + #13;

         sSQL := sSQL +
         'SELECT '                                                                + #13 +
         ' 0'                                       + ' AS TIPO, '                + #13 +
         //Fim Pendência 26951
         '  ' + IntToStr(rContrato.IDPatro)         + ' AS IDPESSJUR, '       + #13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)     + ' AS IDPLANOPREV, '     + #13 +
         '  ' + IntToStr(rContrato.IDBenef)         + ' AS IDPESSOA, '        + #13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo) + ' AS IDTIPOCONTREMPTMO, ' + #13 +
         '  ' + IntToStr(rContrato.IDPessoa)        + ' AS IDTITULAR, '       + #13 +
         ' 1' +                                       ' AS SEQPROPOSTA, '     + #13 +
         '  ' + IntToStr(iIdSitPart)                + ' AS IDSITPART, '       + #13 +
         '  ' + QuotedStr(sFlgInterno)              + ' AS FLGINTERNO, '      + #13 +
         ' 0' + IntToStr(rContrato.NumParcelas)     + ' AS NUMPARCELAS, '     + #13 +
         '  ' + NumeroIngles(fMargem)               + ' AS MARGEM, '          + #13 +
         '  ' + NumeroIngles(fReserva)              + ' AS RESERVA, '         + #13 +
         '  ' + NumeroIngles(fTxJuros)              + ' AS TXJUROS, '         + #13 +
         '  ' + NumeroIngles(fSaldoEPAnt)           + ' AS SALDOEPANT, '      + #13 +
         '  ' + NumeroIngles(rContrato.VlrContrato) + ' AS SALDODEV, '        + #13 +
         '  ' + NumeroIngles(fVlrContratosAnt)      + ' AS VLRCONTRATOSANT, ' + #13 +
         '  ' + NumeroIngles(fSalParticipacao)      + ' AS SALPARTICIPACAO, ' + #13 +
         '  ' + NumeroIngles(fSalMantido)           + ' AS SALMANTIDO, '      + #13 +
         '  ' + NumeroIngles(fSalAuxDoenca)         + ' AS SALAUXDOENCA, '    + #13 +
         '  ' + NumeroIngles(fSalBenef)             + ' AS SALBENEF, '        + #13 +
         '  ' + NumeroIngles(fSalarioBase)          + ' AS SALARIOBASE, '     + #13 +
         //Pendência 22836 - 03/10/2006 - Alberto
         '  0' + IntToStr(Ord(bExcepcional))        + ' AS FLGEXCEPCIONAL, '  + #13 +
         //Fim Pendência 22836
         '  0' + IntToStr(iLote)                    + ' AS FLGLOTE, '         + #13 +
         '  0 AS VLRMAXPERMIT, '                                              + #13 +
         //Pendência 26950 - 30/11/2007
         '  0 AS VALORSOLIC, '                                                + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)) + ' AS DATAASSIN, '    + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))    + ' AS DATACREDITO, '  + #13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))   + ' AS DATAPRIMPARC, ' + #13 +
         '  0 AS FLGQUITA, '                                                                             + #13 +
         //Fim Pendência 26950

         //Ádler Souza - SOL 136877 KINTANA 858970
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataNasc))                   + ' AS DATANASC, '           + #13 +
         //FIM

         // SOL:108099 Daniel Begnami
         '  ' + IntToStr(pQtdeParcSusp)                                             + ' AS TSEMESES, '           + #13 +
         '  ' + IntToStr(pIDTipoSuspEmptmo)                                         + ' AS IDTIPOSUSPEMPTMO '    + #13 +
         // FIM

         'FROM '                                                              + #13 +
         '  DUAL'                                                             + #13;
         //Pendência 26951 - 04/11/2007
         sSQL := sSQL +
         'ORDER BY TIPO DESC';
         //Fim Pendência 26951


         if UtilizaRegraValor(iRegra,
                              sSQL,
                              'o Valor Maximo do Emprestimo',
                              sVlrSolicMax,
                              //Pendência 24595 - 05/03/2007 - Alberto
                              //True
                              bMostraMsg
                              //Pendência 24595 - 05/03/2007 - Alberto
                              ) then
         begin
            if (sVlrSolicMax <> '') and (sVlrSolicMax <> 'NULO') then
            begin
               (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
               Result := StrToFloat(ConverteVirg(sVlrSolicMax))
            end
            else
            begin
               Result := 0;
            end;
         end
         else
         begin
            Result := 0;
         end;

      except
         if bMostraMsg then MsgDlg('Ocorreu um erro na Busca do Valor Máximo do Empréstimos', 'Empréstimo', mtError, [mbOk], 0);
         Result := -1;
      end;

   finally
      qryAux.Free;
      qryTodosContratos.Free;      
   end;
end;




function TCalcEmptmo.AtualizaFlgSituacao(const ID        : Extended;
                                         const sTabela   : String;
                                         const cSituacao : Char;
                                         var   sMsgErro  : String
                                         ): Boolean;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   (* função que Atualiza a Situação (FLGSITUACAO):

    **********************************************************************
    *  da Tabela Inscrição para                                          *
    *                                                                    *
    *  'A' -> 'Ativa'                  -> Disponível                     *
    *  'C' -> 'Cancelada'              -> Cancelada pelo usuário         *
    *  'E' -> 'Contrato Associado'     -> Já utilizada em contrato       *
    *  'R' -> 'Rejeitada'              -> Rejeitada                      *
    *  'Q' -> 'Encerrada/Ctr. Quitado' -> Encerrada ou Contrato Quitado  *
    **********************************************************************
    *  da Tabela Contrato para                                           *
    *                                                                    *
    *  'A' -> 'Ativo'             -> Em curso normal                     *
    *  'C' -> 'Cancelado'         -> por opção do usuário                *
    *  'E' -> 'Encerrado'         -> por quitacao no prazo normal        *
    *  'R' -> 'Refinanciado'      -> Refinanciado                        *
    *  'Q' -> 'Quitado'           -> por quitacao solicitada             *
    *  'S' -> 'Suspenso'          -> Inadimplencia                       *
    *  'K' -> 'Pend. de Quitação' -> Envio p/ cobrança                   *
    **********************************************************************)

   (* Cria e Abre a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'UPDATE '                                    + #13 +
   '  ' + sTabela + ' '                         + #13 +
   'SET '                                       + #13 +
   '  FLGSITUACAO = ' + QuotedStr(cSituacao)    + #13 +
   'WHERE '                                     + #13 +
   '  ID' + sTabela + ' = ' + FormatFloat('#0', ID);

   qryAux.SQL.Text := sSQL;

   try

      try
         qryAux.ExecSQL;
         Result := True;
      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            Result := False;
         end;
      end;

   finally
      qryAux.Free;
   end;
end;



function TCalcEmptmo.MarcaItensQuitados(const IDContratoEmptmo : Extended;
                                        const dDataQuit        : TDateTime;
                                        const iOrigem          : Integer
                                        //Pendência 22836 - 03/10/2006 - Alberto
                                       ;const bExcepcional     : Boolean = false
                                        //Fim Pendência 22836
                                       ): Integer;
var
   rLogTotalPrev  : TLogTotalPrev;
   bRegra         : Boolean;
   sSQL           : String;
   sResultRegra   : String;
   qryAux         : TwwQuery;
   qryAuxHist     : TwwQuery;//Fanuel Junior SOL153161
   iRegra         : Integer;
   iNumParcPagas  : Integer;
   iNumParcelas   : Integer;
   iNumParcRest   : Integer;
   iQuantAberto   : Integer;
   
   iCodDocumento   : Integer;//Fanuel Junior SOL153161
   iIdTmpDesc      : Integer;//Fanuel Junior SOL153161
   iOperacao       : Integer;//Fanuel Junior SOL153161
   iSitEnvio       : Integer;//Fanuel Junior SOL153161
   iIdHisMovEmtpmo : Integer;//Fanuel Junior SOL153161
begin
   bRegra := False;

   iOperacao := -1;         //Fanuel Junior SOL153161
   iSitEnvio := -1;         //Fanuel Junior SOL153161
   iCodDocumento  := 0;  //Fanuel Junior SOL153161
   iIdTmpDesc   := 0;    //Fanuel Junior SOL153161
   iIdHisMovEmtpmo := 0; //Fanuel Junior SOL153161

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      try
         // pelo contrato, procura a regra que será usada para determinar
         // quais itens serão marcados como "quitados"
         sSQL :=
         'SELECT '                                                                  + #13 +
         '   TCE.IDREGRAQUITADO '                                                   + #13 +
         'FROM '                                                                    + #13 +
         '   CONTRATOEMPTMO  CON, '                                                 + #13 +
         '   TIPOCONTREMPTMO TCE '                                                  + #13 +
         'WHERE '                                                                   + #13 +
         '       IDCONTRATOEMPTMO      = ' + FormatFloat('#0', IDContratoEmptmo)    + #13 +
         '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO ';

         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         // verifica a regra que será usada para determinar quais itens serão marcados como "quitados"
         if not(qryAux.IsEmpty) and
            not(qryAux.FieldByName('IDREGRAQUITADO').isNULL) and
               (qryAux.FieldByName('IDREGRAQUITADO').AsInteger > 0) then
         begin
            bRegra := True;
         end;
      except
         // (bRegra := False)
      end;

      if not(bRegra) then
      begin
         ParametrosSistema;
         if not( (iOrigem = 8) and (dtmEmptmo.qryParamEmptmoFLGQUITAPARCMORTE.AsInteger = 1) ) then
         begin
            // se nâo houver regra definida para determinar quais itens devem ser marcados, marca todos
            with dtmEmptmo.qryMarcaItemQuitado do
            begin
               LimpaParametros(dtmEmptmo.qryMarcaItemQuitado);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
               ParamByName('PHMEDATAQUITABONO').AsDate   := dDataQuit;

               try
                  ExecSQL;
                  Result := RowsAffected;

                  // -------------------------------------------------------------------------------

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := IDContratoEmptmo;
                  rLogTotalPrev.IDHistMov  := -1;
                  rLogTotalPrev.Origem     := iOrigem;
                  rLogTotalPrev.Operacao   := 'Marca TODOS (' + IntToStr(Result)+ ') itens quitados';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // -------------------------------------------------------------------------------
               except
                  Result := -2;
               end;
            end;
         end;
      end
      else // if not(bRegra)
      begin
         // Verifica quais itens devem ser marcados como "quitados" de acordo com a Regra
         iRegra := qryAux.FieldByName('IDREGRAQUITADO').AsInteger;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Conta
         sSQL :=
         'SELECT '                                                                              + #13 +
         '  CON.NUMPARCELAS, '                                                                  + #13 +
         '  HME.HMENUMPARCELAS, '                                                               + #13 +
         '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS '                                             + #13 +
         'FROM '                                                                                + #13 +
         '  HISTMOVEMPTMO   HME, '                                                              + #13 +
         '  CONTRATOEMPTMO  CON, '                                                              + #13 +
         '  TIPOCONTREMPTMO TIP, '                                                              + #13 +
         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     HME.IDCONTRATOEMPTMO, HME.HMEPARCELA, '                                          + #13 +

         '     SUM(ROUND(DECODE(HME.HMESEQCOBRANCA, 1, HME.HMEVLRPREVISTO, 0), 2)) - '          +
              'SUM(ROUND(NVL(HME.HMEVLREFETIVO, 0), 2)) AS TOTAL '                              + #13 +

         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO  HME, '                                                            + #13 +
         '     CONTRATOEMPTMO CON '                                                             + #13 +
         '  WHERE '                                                                             + #13 +
         '         ( CON.IDCONTRATOEMPTMO = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '     + #13 +
         '     AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO = 1 ) '                     + #13 +
         '     AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                          + #13 +
         '  GROUP BY '                                                                          + #13 +
         '     HME.IDCONTRATOEMPTMO, HME.HMEPARCELA '                                           + #13 +

         '  HAVING '                                                                            + #13 +
         '         ( SUM(ROUND(DECODE(HME.HMESEQCOBRANCA, 1, HME.HMEVLRPREVISTO, 0), 2)) - '          +
                    'SUM(ROUND(NVL(HME.HMEVLREFETIVO, 0), 2)) = 0 ) '                           + #13 +
         '     AND ( HME.HMEPARCELA <> 0 ) '                                                    + #13 +
         '  ) PAG, '                                                                            + #13 +

         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                                        + #13 +
         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO '                                                                  + #13 +
         '  WHERE '                                                                             + #13 +
         '         ( IDCONTRATOEMPTMO     = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '     + #13 +
         '     AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
         '  ) HST '                                                                             + #13 +

         'WHERE '                                                                               + #13 +
         '      ( CON.IDCONTRATOEMPTMO = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '        + #13 +
         '  AND ( CON.IDCONTRATOEMPTMO    = PAG.IDCONTRATOEMPTMO(+) ) '                         + #13 +
         '  AND ( CON.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO ) '                           + #13 +
         '  AND ( HME.IDHISTMOVEMPTMO     = HST.IDHISTMOVEMPTMO ) '                             + #13 +

         'GROUP BY '                                                                            + #13 +
         '  CON.NUMPARCELAS, HME.HMENUMPARCELAS ';


         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         // se a query estiver vazia, passa os valores zerados
         iNumParcPagas  := 0;
         iNumParcelas   := 0;
         iNumParcRest   := 0;

         if not(qryAux.isEmpty) then
         begin
            if not(qryAux.FieldByName('NUMPARCPAGAS').IsNull) then   iNumParcPagas  := qryAux.FieldByName('NUMPARCPAGAS').AsInteger;
            if not(qryAux.FieldByName('NUMPARCELAS').IsNull) then    iNumParcelas   := qryAux.FieldByName('NUMPARCELAS').AsInteger;
            if not(qryAux.FieldByName('HMENUMPARCELAS').IsNull) then iNumParcRest   := qryAux.FieldByName('HMENUMPARCELAS').AsInteger;
         end;
         // ----------------------------------------------------------------------------------------

         qryAux.Close;

         // ----------------------------------------------------------------------------------------
         //    Monta as linhas dos itens PENDENTES
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qryItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryItens);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContratoEmptmo;
            ParamByName('PEVENTOEXCLUSAO').AsInteger     := 3;
            ParamByName('PFLGBAIXADO').AsInteger         := 0;
            ParamByName('PCENTRALIZA').AsInteger         := 1;
            Open;

            iQuantAberto := dtmCalcEmptmo.qryItens.RecordCount;

            First;
         end;

         while not(dtmCalcEmptmo.qryItens.EOF) do
         begin
              //Fanuel Junior SOL153161
             iCodDocumento :=  dtmCalcEmptmo.qryItens.FieldByName('CODDOCUMENTO').AsInteger;

             qryAuxHist               := TwwQuery.Create(Application);
             qryAuxHist.DatabaseName  := 'BaseDados';

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT OPERACAO FROM ( SELECT * FROM ');
             qryAuxHist.SQL.Add('LANCTODOCUM WHERE CODDOCUMENTO = '+IntToStr(iCodDocumento));
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - INICIO
             //qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC) WHERE ROWNUM = 1');
             qryAuxHist.SQL.Add('ORDER BY  DATALANCTO DESC, OPERACAO DESC) WHERE ROWNUM = 1');
             //BRUNO AZEVEDO SOL 198253 KINTANA 1908783 - FIM
             qryAuxHist.Open;

             iOperacao := -1;
             if not(qryAuxHist.isEmpty) then
             begin
               if not(qryAuxHist.FieldByName('OPERACAO').IsNull) then   iOperacao := qryAuxHist.FieldByName('OPERACAO').AsInteger;
             end;


             iIdTmpDesc :=  dtmCalcEmptmo.qryItens.FieldByName('IDTMPDESC').AsInteger;

             qryAuxHist.Close;
             qryAuxHist.SQL.Clear;
             qryAuxHist.SQL.Add('SELECT SITENVIO FROM TMPDESC ');
             qryAuxHist.SQL.Add('WHERE IDTMPDESC = '+IntToStr(iIdTmpDesc));
             qryAuxHist.Open;

             iSitEnvio := -1;
             if not(qryAuxHist.isEmpty) then
             begin
                if not(qryAuxHist.FieldByName('SITENVIO').IsNull) then   iSitEnvio := qryAuxHist.FieldByName('SITENVIO').AsInteger;
             end;
             //Fanuel Junior SOL153161
             FreeAndNil(qryAuxHist);
             
            sSQL :=
            'SELECT '                                                                                                   + #13 +
            '  ' + FormatFloat('#0', IDContratoEmptmo)                                    +  ' AS IDCONTRATOEMPTMO, '   + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + '     /* ' + dtmCalcEmptmo.qryItensITEDESCRICAO.AsString + ' */' + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         + #13 +
            '  ' + IntToStr(3)                                                            +  ' AS EVENTO, '             + #13 +
            '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          + #13 +
            ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        + #13 +

            '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           + #13 +
            '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                                           +  ' AS DATAEVENTO, '     + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '   + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '    + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '   + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '     + #13 +

            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)               +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, '    + #13 +
            '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                  +
                   FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '       + #13 +

            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)             +  ' AS VLRPREVISTO, '        + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)              +  ' AS VLREFETIVO, '         + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                +  ' AS SALDODEV, '           + #13 +
            '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMETXJUROS.AsFloat)                 +  ' AS TXJUROS, '            + #13 +

            '  ' + IntToStr(iQuantAberto)                                                 +  ' AS QUANTITEMABERTO,'     + #13 +
            '  ' + IntToStr(iNumParcPagas)                                                +  ' AS NUMPARCPAGAS,'        + #13 +
            '  ' + IntToStr(iNumParcelas)                                                 +  ' AS PRAZOANT,'            + #13 +
            '  ' + IntToStr(iNumParcRest)                                                 +  ' AS PRAZOREST, '          + #13 +

            //Pendência 22836 - 03/10/2006 - Alberto
            '  0' + IntToStr(Ord(bExcepcional))                                           +  ' AS FLGEXCEPCIONAL, '     + #13 +
            //Fim Pendência 22836

            //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
            ' 0' + dtmCalcEmptmo.qryItensFLGTIPODIVERG.AsString                           +  ' AS FLGTIPODIVERG, '      + #13 +
            //Fim Pendência 22717

            ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                            +  ' AS FLGSUSPENSAO, '        + #13 +  // André Pontes - pendência 20130 - 28/09/2005

            '  ' + IntToStr(iOperacao)                                                    +  ' AS OPERACAO, '        + #13 +  //Fanuel Junior SOL153161
            '  ' + IntToStr(iSitEnvio)                                                    +  ' AS SITENVIO  '        + #13 +  //Fanuel Junior SOL153161

            'FROM '                                                                       +
            '  DUAL ';


            sResultRegra := '';
            if not(UtilizaRegraBool(iRegra,
                                    sSQL,
                                    'e Marcar Quitado' + trim(dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString),
                                    sResultRegra,
                                    False)
                                    ) then
            begin
               // Regra Executada com ERRO
               Result := -2;
               Exit;
            end
            else
            begin
               if UpperCase(sResultRegra) = 'TRUE' then
               begin
                  try
                     with dtmEmptmo.qryMarcaItemQuitado do
                     begin
                        LimpaParametros(dtmEmptmo.qryMarcaItemQuitado);
                        ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
                        ParamByName('PIDHISTMOVEMPTMO').AsFloat   := dtmCalcEmptmo.qryItensIDHISTMOVEMPTMO.AsFloat;
                        ParamByName('PHMEDATAQUITABONO').AsDate   := dDataQuit;
                        //Pendência 22671 - 23/06/2006 - Alberto
                        ParamByName('PIDUSUARIOESTORNO').AsFloat  := Sistema.IdUsuario;
                        //Fim Pendência 22671
                        ExecSQL;
                     end;

                     // ----------------------------------------------------------------------------

                     LimpaRegistroLog(rLogTotalPrev);

                     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                     rLogTotalPrev.IDContrato := IDContratoEmptmo;
                     rLogTotalPrev.IDHistMov  := dtmCalcEmptmo.qryItensIDHISTMOVEMPTMO.AsFloat;
                     rLogTotalPrev.Origem     := iOrigem;
                     rLogTotalPrev.Operacao   := 'Marca item quitado';
                     rLogTotalPrev.Data       := SysDate;
                     rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
                     rLogTotalPrev.Versao     := Sistema.Versao;

                     GravaLogTotalPrev(rLogTotalPrev);

                     // ----------------------------------------------------------------------------
                  except
                     // ERRO ao marcar item
                     Result := -2;
                     Exit;
                  end;
               end;
            end;

            // Próximo item Aberto
            dtmCalcEmptmo.qryItens.Next;
            // -------------------------------------------------------------------------------------
         end; // while not(dtmCalcEmptmo.qryItens.EOF)

         Result := iQuantAberto;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
      end; // if not(bRegra)

   finally
      dtmCalcEmptmo.qryItens.Close;

      qryAux.Close;
      qryAux.Free;
   end;
end;



function TCalcEmptmo.DesmarcaItensQuitados(const IDContratoEmptmo : Extended;
                                           const dDataQuit        : TDateTime;
                                           const iOrigem          : Integer
                                          ): Integer;
var
   rLogTotalPrev  : TLogTotalPrev;
begin
   try
      with dtmEmptmo.qryDesMarcaTodosItensQuitados do
      begin
         LimpaParametros(dtmEmptmo.qryDesMarcaTodosItensQuitados);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;

         ExecSQL;
         Result := RowsAffected;

         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := IDContratoEmptmo;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := iOrigem;
         rLogTotalPrev.Operacao   := 'Desmarca TODOS (' + IntToStr(Result)+ ') itens quitados';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------
      end;
   except
      Result := -2;
   end;
end;



function TCalcEmptmo.SaldoDevMesAnt(const IDContrato           : Extended;
                                    const dDataCredito         : TDateTime;
                                    const dDataProcessamento   : TDateTime;
                                    const iAnoCompetencia      : Integer;
                                    const iMesCompetencia      : Integer
                                    ): TSaldoDevAnt;
var
   iMes : Integer;
   iAno : Integer;
begin
   Result.fTxJurosAnt   := 0;
   Result.fSaldoDevAnt  := 0;
   Result.iParcelaAnt   := 0;
   Result.iParcRestaAnt := 0;

   if ( DiasUteis.ExtraiAno(dDataCredito) = iAnoCompetencia ) and
      ( DiasUteis.ExtraiMes(dDataCredito) = iMesCompetencia ) then
   begin
      iMes := iMesCompetencia;
      iAno := iAnoCompetencia;
   end
   else
   begin
      iMes := DiasUteis.ExtraiMes(IncMonth(dDataProcessamento, -1));
      iAno := DiasUteis.ExtraiAno(IncMonth(dDataProcessamento, -1));
   end;

   try
      with dtmCalcEmptmo.qrySaldoMesAnt do
      begin
         LimpaParametros(dtmCalcEmptmo.qrySaldoMesAnt);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PANOCOMPETENCIA').AsInteger     := iAno;
         ParamByName('PMESCOMPETENCIA').AsInteger     := iMes;
         Open;

         if not(isEmpty) then
         begin
            Result.fSaldoDevAnt  := dtmCalcEmptmo.qrySaldoMesAntHMESALDODEV.AsCurrency;
            Result.fTxJurosAnt   := dtmCalcEmptmo.qrySaldoMesAntHMETXJUROS.AsCurrency;
            Result.dDataAtuAnt   := dtmCalcEmptmo.qrySaldoMesAntHMEDATAATUALIZA.AsDateTime;
            Result.iParcelaAnt   := dtmCalcEmptmo.qrySaldoMesAntHMEPARCELA.AsInteger;
            Result.iParcRestaAnt := dtmCalcEmptmo.qrySaldoMesAntHMENUMPARCELAS.AsInteger;
         end;
      end;

   finally
      LimpaParametros(dtmCalcEmptmo.qrySaldoMesAnt);
   end;
end;



function TCalcEmptmo.SaldoDevAnt(const IDContrato       : Extended;
                                 const dData            : TDateTime;
                                 const iAnoCompetencia  : Integer;
                                 const iMesCompetencia  : Integer;
                                 const bVerificaParcela : Boolean = False;
                                 const bTrataDivergNOVO : Boolean = False;  // 92334 Daniel Begnami
                                 const bGeraParcela     : Boolean = False    //Darivaldo
                                ): TSaldoDevAnt;
var
   sDiaSldDev     : String;
   dDataSaldoDev  : TDateTime;
begin
   Result.fTxJurosAnt   := 0;
   Result.fSaldoDevAnt  := 0;
   Result.iParcelaAnt   := 0;
   Result.iParcRestaAnt := 0;

   // ----------------------------------------------------------------------------------------------

   sDiaSldDev := 'C';
   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then
   begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         1: sDiaSldDev := 'A';
      end;
   end;

   dDataSaldoDev := dData;
   if sDiaSldDev = 'A' then dDataSaldoDev := (dData - 1);

   // ----------------------------------------------------------------------------------------------

   try

      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         if ( (iAnoCompetencia > 0) and (iMesCompetencia > 0) ) then
         begin
            dDataSaldoDev := EncodeDate(iAnoCompetencia, iMesCompetencia, 1) - 1;
         end
         else
         begin
            dDataSaldoDev := dData;
            if sDiaSldDev = 'A' then dDataSaldoDev := dData - 1;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Busca o saldo devedor em uma determinada data (exata)
         // ----------------------------------------------------------------------------------------

         // 92334 Daniel Begnami
         if bTrataDivergNOVO then
         begin
           with dtmCalcEmptmo do
           begin
             qrySaldoAntAtuDia.close;
             qrySaldoAntAtuDia.SQL.Clear;
             qrySaldoAntAtuDia.SQL.ADD(qrySaldoAntAtuDiaDivergNOVO.sql.text);
           end;
         end
         // Fim 92334
         // Inicio - SOL128694 - Daniel Begnami
         else
         begin
           with dtmCalcEmptmo do
           begin
             qrySaldoAntAtuDia.close;
             qrySaldoAntAtuDia.SQL.Clear;

             //Darivaldo Alencar SIG70325 -Inicio
             if (bGeraParcela) and (Trim(qrySaldoAntAtuDiaANTIGA.sql[15])= 'HME.HMENUMPARCELAS,') then
             //qrySaldoAntAtuDiaANTIGA.sql[34]:= ' AND ixt.itctratasaldodev <> 0 AND h.hmenumparcelas > 0) ';//Darivaldo Alencar SIG 64239/6461
                qrySaldoAntAtuDiaANTIGA.sql[15]:= cFiltroGeraParcela;
             //Darivaldo Alencar SIG70325 -Fim

             qrySaldoAntAtuDia.SQL.ADD(qrySaldoAntAtuDiaANTIGA.sql.text);
           end;
         end;
         // FIM SOL128694 - Daniel Begnami

         with dtmCalcEmptmo.qrySaldoAntAtuDia do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAntAtuDia);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
            Open;

            if not(isEmpty) then
            begin
               Result.fSaldoDevAnt        := dtmCalcEmptmo.qrySaldoAntAtuDiaHMESALDODEV.AsCurrency;
               Result.fTxJurosAnt         := dtmCalcEmptmo.qrySaldoAntAtuDiaHMETXJUROS.AsCurrency;
               Result.dDataAtuAnt         := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEDATAATUALIZA.AsDateTime;
               Result.iParcelaAnt         := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEPARCELA.AsInteger;
               Result.iParcelaAltAnt      := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEPARCELA.AsInteger;

               if not(dtmCalcEmptmo.qrySaldoAntAtuDiaHMEPARCELAALT.isNULL) then
               begin
                  Result.iParcelaAltAnt   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEPARCELAALT.AsInteger;
               end;

               Result.iParcRestaAnt       := dtmCalcEmptmo.qrySaldoAntAtuDiaHMENUMPARCELAS.AsInteger;
            end;
         end;
         // ----------------------------------------------------------------------------------------
         //
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Busca a parcela atual e as parcelas restantes
         //    (Pode ser necessário caso o registro do saldo devedor corresponder a uma atualização
         //     diária, que terá sempre parcela ZERO)
         // ----------------------------------------------------------------------------------------
         //William Moreira da Silva - SOL 260658 PPM 1039277
         if bVerificaParcela then
         begin

           // 92334 Daniel Begnami
           if bTrataDivergNOVO then
           begin
             with dtmCalcEmptmo do
             begin
               qrySaldoParcelaAnt.close;
               qrySaldoParcelaAnt.SQL.Clear;
               qrySaldoParcelaAnt.SQL.ADD(qrySaldoParcelaAntDivergNOVO.sql.text);
             end;
           end;
          // Fim

            with dtmCalcEmptmo.qrySaldoParcelaAnt do
            begin
               LimpaParametros(dtmCalcEmptmo.qrySaldoParcelaAnt);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
               ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
               ParamByName('PALTERAPARCELA').AsInteger    := -1;
               Open;

               if not(isEmpty) then
               begin
                  Result.iParcelaAnt         := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELA.AsInteger;
                  Result.iParcelaAltAnt      := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELA.AsInteger;
                  Result.fTxJurosAnt         := dtmCalcEmptmo.qrySaldoParcelaAntHMETXJUROS.AsCurrency;

                  if not(dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELAALT.isNULL) then
                  begin
                     Result.iParcelaAltAnt   := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELAALT.AsInteger;
                  end;

                  Result.iParcRestaAnt       := dtmCalcEmptmo.qrySaldoParcelaAntHMENUMPARCELAS.AsInteger;
               end;
            end;
         end;
         // ----------------------------------------------------------------------------------------
         //
         // ----------------------------------------------------------------------------------------
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
      begin
         // ----------------------------------------------------------------------------------------
         if ( (iAnoCompetencia > 0) and (iMesCompetencia > 0) ) then
         begin
            dDataSaldoDev := EncodeDate(iAnoCompetencia, iMesCompetencia, 1) - 1;
         end
         else
         begin
            dDataSaldoDev := dData;
            if sDiaSldDev = 'A' then dDataSaldoDev := dData - 1;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Busca o ÚLTIMO saldo devedor ANTES de uma determinada data
         // ----------------------------------------------------------------------------------------

         // 92334 Daniel Begnami
          if bTrataDivergNOVO then
          begin
            with dtmCalcEmptmo do
            begin
              qrySaldoAnt.close;
              qrySaldoAnt.SQL.Clear;
              qrySaldoAnt.SQL.ADD(qrySaldoAntDivergNOVO.sql.text);
            end;
          end;
          // Fim

         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
            Open;

            if not(isEmpty) then
            begin
               Result.fSaldoDevAnt     := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
               Result.fTxJurosAnt      := dtmCalcEmptmo.qrySaldoAntHMETXJUROS.AsCurrency;
               Result.dDataAtuAnt      := dtmCalcEmptmo.qrySaldoAntHMEDATAATUALIZA.AsDateTime;
               Result.iParcelaAnt      := dtmCalcEmptmo.qrySaldoAntHMEPARCELA.AsInteger;

               Result.iParcelaAltAnt   := dtmCalcEmptmo.qrySaldoAntHMEPARCELA.AsInteger;
               if not(dtmCalcEmptmo.qrySaldoAntHMEPARCELAALT.isNULL) then
               begin
                  Result.iParcelaAltAnt   := dtmCalcEmptmo.qrySaldoAntHMEPARCELAALT.AsInteger;
               end;

               Result.iParcRestaAnt    := dtmCalcEmptmo.qrySaldoAntHMENUMPARCELAS.AsInteger;
            end;
         end;
         // ----------------------------------------------------------------------------------------
         //
         // ----------------------------------------------------------------------------------------
      end;
      //William Moreira da Silva - SOL 260658 PPM 1039277

   finally
      dtmCalcEmptmo.qrySaldoAnt.Close;
   end;
end;



function TCalcEmptmo.BuscaSaldosAntPos(const IDContrato        : Extended;
                                       const dData             : TDateTime;
                                       const bVerificaParcela  : Boolean = False
                                      ): TSaldosAntPos;
var
   sDiaSldDev     : String;
   dDataSaldoDev  : TDateTime;
   dDataProcPos   : TDateTime;
begin
   Result.fSaldoDevAnt  := 0;
   Result.fTxJurosAnt   := 0;
   Result.iParcelaAnt   := 0;
   Result.iParcRestaAnt := 0;

   Result.fSaldoDevPos  := 0;
   Result.fTxJurosPos   := 0;
   Result.iParcelaPos   := 0;
   Result.iParcRestaPos := 0;

   // ----------------------------------------------------------------------------------------------

   sDiaSldDev := 'C';
   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then
   begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         1: sDiaSldDev := 'A';
      end;
   end;

   dDataSaldoDev := dData;
   if sDiaSldDev = 'A' then dDataSaldoDev := (dData - 1);

   // ----------------------------------------------------------------------------------------------

   try
      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         //    Busca o saldo devedor em uma determinada data (exata)
         // ----------------------------------------------------------------------------------------
         with dtmCalcEmptmo.qrySaldoAntAtuDia do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAntAtuDia);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
            Open;

            if not(isEmpty) then
            begin
               Result.fSaldoDevAnt  := dtmCalcEmptmo.qrySaldoAntAtuDiaHMESALDODEV.AsCurrency;
               Result.fTxJurosAnt   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMETXJUROS.AsCurrency;
               Result.dDataAtuAnt   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEDATAATUALIZA.AsDateTime;
               Result.iParcelaAnt   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEPARCELA.AsInteger;
               Result.iParcRestaAnt := dtmCalcEmptmo.qrySaldoAntAtuDiaHMENUMPARCELAS.AsInteger;

               Result.fSaldoDevPos  := dtmCalcEmptmo.qrySaldoAntAtuDiaHMESALDODEV.AsCurrency;
               Result.fTxJurosPos   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMETXJUROS.AsCurrency;
               Result.dDataAtuPos   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEDATAATUALIZA.AsDateTime;
               Result.iParcelaPos   := dtmCalcEmptmo.qrySaldoAntAtuDiaHMEPARCELA.AsInteger;
               Result.iParcRestaPos := dtmCalcEmptmo.qrySaldoAntAtuDiaHMENUMPARCELAS.AsInteger;
            end;
         end;
         // ----------------------------------------------------------------------------------------
         //
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Busca a parcela atual e as parcelas restantes
         //    (Pode ser necessário caso o registro do saldo devedor corresponder a uma atualização
         //     diária, que terá sempre parcela ZERO)
         // ----------------------------------------------------------------------------------------
         if bVerificaParcela then
         begin
            with dtmCalcEmptmo.qrySaldoParcelaAnt do
            begin
               LimpaParametros(dtmCalcEmptmo.qrySaldoParcelaAnt);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
               ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
               //Wylliam Leite da Silva Nº SOL: 253185 Nº PPM: 2040335
               //William Moreira da Silva - SOL 260816 PPM 1051407
               ParamByName('PALTERAPARCELA').AsInteger    := 1;
               Open;

               if not(isEmpty) then
               begin
                  Result.iParcelaAnt   := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELA.AsInteger;
                  Result.iParcRestaAnt := dtmCalcEmptmo.qrySaldoParcelaAntHMENUMPARCELAS.AsInteger;
               end
               else
               begin
                  with dtmCalcEmptmo.qrySaldoParcelaAnt do
                  begin
                     LimpaParametros(dtmCalcEmptmo.qrySaldoParcelaAnt);
                     ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
                     ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
                     Open;

                     if not(isEmpty) then
                     begin
                        Result.iParcelaAnt   := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELA.AsInteger;
                        Result.iParcRestaAnt := dtmCalcEmptmo.qrySaldoParcelaAntHMENUMPARCELAS.AsInteger;
                     end;
                  end;
               end;
            end;

            dDataProcPos := DiasUteis.SomaAnos(dData, 10);

            with dtmCalcEmptmo.qrySaldoParcelaAnt do
            begin
               LimpaParametros(dtmCalcEmptmo.qrySaldoParcelaAnt);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
               ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataProcPos;
               //Wylliam Leite da Silva Nº SOL: 253185 Nº PPM: 2040335
               //ParamByName('PALTERAPARCELA').AsInteger    := 1;
               Open;

               if not(isEmpty) then
               begin
                  Result.iParcelaPos   := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELA.AsInteger;
                  Result.iParcRestaPos := dtmCalcEmptmo.qrySaldoParcelaAntHMENUMPARCELAS.AsInteger;
               end
               else
               begin
                  with dtmCalcEmptmo.qrySaldoParcelaAnt do
                  begin
                     LimpaParametros(dtmCalcEmptmo.qrySaldoParcelaAnt);
                     ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
                     ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataProcPos;
                     Open;

                     if not(isEmpty) then
                     begin
                        Result.iParcelaPos   := dtmCalcEmptmo.qrySaldoParcelaAntHMEPARCELA.AsInteger;
                        Result.iParcRestaPos := dtmCalcEmptmo.qrySaldoParcelaAntHMENUMPARCELAS.AsInteger;
                     end;
                  end;
               end;
            end;
         end;
         // ----------------------------------------------------------------------------------------
         //
         // ----------------------------------------------------------------------------------------
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
      begin
         // Busca o Dados anteriores à data de processamento *)
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldoDev;
            Open;

            if not(isEmpty) then
            begin
               Result.fSaldoDevAnt  := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
               Result.fTxJurosAnt   := dtmCalcEmptmo.qrySaldoAntHMETXJUROS.AsCurrency;
               Result.iParcelaAnt   := dtmCalcEmptmo.qrySaldoAntHMEPARCELA.AsInteger;
               Result.iParcRestaAnt := dtmCalcEmptmo.qrySaldoAntHMENUMPARCELAS.AsInteger;
               Result.dDataAtuAnt   := dtmCalcEmptmo.qrySaldoAntHMEDATAATUALIZA.AsDateTime;
            end;
         end;

         dDataProcPos := DiasUteis.SomaAnos(dData, 10);

         (* Busca o Dados posteriores à data de processamento *)
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataProcPos;
            Open;

            if not(isEmpty) then
            begin
               Result.fSaldoDevPos  := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
               Result.fTxJurosPos   := dtmCalcEmptmo.qrySaldoAntHMETXJUROS.AsCurrency;
               Result.iParcelaPos   := dtmCalcEmptmo.qrySaldoAntHMEPARCELA.AsInteger;
               Result.iParcRestaPos := dtmCalcEmptmo.qrySaldoAntHMENUMPARCELAS.AsInteger;
               Result.dDataAtuPos   := dtmCalcEmptmo.qrySaldoAntHMEDATAATUALIZA.AsDateTime;
            end;
         end;

      end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

   finally
      LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
   end;
end;



function TCalcEmptmo.CritDataEmptmo(qry: TwwQuery; sIDPatro, sIDPlanoPrev, sSitFundacao,
                                    sTipoData, sMesReferencia, sAnoReferencia, sFormaCobranca,
                                    sDataAssinatura: String; iNumParc: Integer): String;
var
   sSQL, sData, sFlgMes : String;
   dData                : TDateTime;
   iDia, iMes, iAno     : Word;
begin
   Result := '';

   // Se a situação do participante na fundação for cancelado, considerar como ativo na Patrocinadora
   if sSitFundacao = 'CA' then sSitFundacao := 'PT';

// -------------------------------------------------------------------------------------------------


   (* se cobrança em Folha *)
   if sFormaCobranca = 'F' then
   begin
      sSQL :=
      'SELECT '                                             + #13 +
      '  DIACOBN, FLGUTILN, FLGDIAPOSANTN, FLGMESCOBN, '    + #13 +
      '  DIACOBA, FLGUTILA, FLGDIAPOSANTA, FLGMESCOBA, '    + #13 +
      '  DIACOBD, FLGUTILD, FLGDIAPOSANTD, FLGMESCOBD, '    + #13 +
      '  DIACOBC, FLGUTILC, FLGDIAPOSANTC, FLGMESCOBC, '    + #13 +
      '  DIASAPOSD, DIASAPOSC '                             + #13 +
      'FROM '                                               + #13 +
      '  DATASPATROEMPTMO '                                 + #13 +
      'WHERE '                                              + #13 +
      '      ( IDPESSJUR   = ' + sIDPatro + ' ) '           + #13 +
      '  AND ( IDPLANOPREV = ' + sIDPlanoPrev + ' ) '       + #13 +
      '  AND ( SITFUNDACAO = ''PT'' )';

      with qry do
      begin
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
         if IsEmpty then
         begin
            Close;
            Exit;
         end;
      end;


// -------------------------------------------------------------------------------------------------


      (* verifica a data de acordo com a Folha da Patrocinadora *)

      (* se NORMAL *)
      if sTipoData = 'N' then
      begin
         if iNumParc >= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBN').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         sData := RetornaDataCobranca(qry.FieldByName('DIACOBN').AsInteger,
                                      qry.FieldByName('FLGUTILN').AsString,
                                      qry.FieldByName('FLGDIAPOSANTN').AsString, sFlgMes,
                                      sMesReferencia,
                                      sAnoReferencia, '', sDataAssinatura );

      (* se ATRASO *)
      end
      else if sTipoData = 'A' then
      begin
         if iNumParc <= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBA').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         sData := RetornaDataCobranca(qry.FieldByName('DIACOBA').AsInteger,
                                      qry.FieldByName('FLGUTILA').AsString,
                                      qry.FieldByName('FLGDIAPOSANTA').AsString, sFlgMes,
                                      sMesReferencia, sAnoReferencia, '', sDataAssinatura);

      (* se DEVOLUÇÃO *)
      end
      else if sTipoData = 'D' then
      begin
         if iNumParc >= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBD').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         if length(trim(qry.FieldByName('DIASAPOSD').AsString)) <> 0 then
         begin
            dData := StrToDate(sDataAssinatura);
            DecodeDate(dData, iAno, iMes, iDia);

            sData := RetornaDataCobranca(Integer(iDia), qry.FieldByName('FLGUTILD').AsString,
                                         qry.FieldByName('FLGDIAPOSANTD').AsString, 'N',
                                         IntToStr(iMes), IntToStr(iAno),
                                         qry.FieldByName('DIASAPOSD').AsString, sDataAssinatura);

         end
         else
         begin
            sData := RetornaDataCobranca(qry.FieldByName('DIACOBD').AsInteger,
                                         qry.FieldByName('FLGUTILD').AsString,
                                         qry.FieldByName('FLGDIAPOSANTD').AsString, sFlgMes,
                                         sMesReferencia, sAnoReferencia,
                                         qry.FieldByName('DIASAPOSD').AsString, sDataAssinatura );
         end;

      (* se CRÉDITO *)
      end
      else
      begin
         if iNumParc <= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBC').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         if length(Trim(qry.FieldByName('DIASAPOSC').AsString)) <> 0 then
         begin
            dData := StrToDate(sDataAssinatura);
            DecodeDate(dData, iAno, iMes, iDia);
            sData := RetornaDataCobranca(Integer(iDia), qry.FieldByName('FLGUTILC').AsString,
                                         qry.FieldByName('FLGDIAPOSANTC').AsString, 'N',
                                         IntToStr(iMes), IntToStr(iAno),
                                         qry.FieldByName('DIASAPOSC').AsString, sDataAssinatura);
         end
         else
         begin
            sData := RetornaDataCobranca(qry.FieldByName('DIACOBC').AsInteger,
                                         qry.FieldByName('FLGUTILC').AsString,
                                         qry.FieldByName('FLGDIAPOSANTC').AsString,
                                         sFlgMes,
                                         sMesReferencia, sAnoReferencia,
                                         qry.FieldByName('DIASAPOSC').AsString, sDataAssinatura);
         end;

      end; (* se NOMAL *) (* se ATRASO *) (* se DEVOLUÇÃO *) (* CRÉDITO *)


// -------------------------------------------------------------------------------------------------


   (* se FormaCobranca *)
   end
   else if sFormaCobranca = 'C' then
   begin
      // Filtra DATASPATROEMPTMO
      sSQL :=
      'SELECT '                                             + #13 +
      '  DIACOBN, FLGUTILN, FLGDIAPOSANTN, FLGMESCOBN, '    + #13 +
      '  DIACOBA, FLGUTILA, FLGDIAPOSANTA, FLGMESCOBA, '    + #13 +
      '  DIACOBD, FLGUTILD, FLGDIAPOSANTD, FLGMESCOBD, '    + #13 +
      '  DIACOBC, FLGUTILC, FLGDIAPOSANTC, FLGMESCOBC, '    + #13 +
      '  DIASAPOSD, DIASAPOSC '                             + #13 +
      'FROM '                                               + #13 +
      '  DATASPATROEMPTMO '                                 + #13 +
      'WHERE '                                              + #13 +
      '      ( IDPESSJUR   = ' + sIDPatro + ' ) '           + #13 +
      '  AND ( IDPLANOPREV = ' + sIDPlanoPrev + ' ) '       + #13 +
      '  AND ( SITFUNDACAO = ' + QuotedStr(sSitFundacao) + ' )';

      with qry do
      begin
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
         if IsEmpty then
         begin
            Close;
            Exit;
         end;
      end;


// -------------------------------------------------------------------------------------------------


      (* verifica a data de acordo com a Folha da Patrocinadora *)

      (* se NORMAL *)
      if sTipoData = 'N' then
      begin
         if iNumParc >= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBN').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         sData := RetornaDataCobranca(qry.FieldByName('DIACOBN').AsInteger,
                                      qry.FieldByName('FLGUTILN').AsString,
                                      qry.FieldByName('FLGDIAPOSANTN').AsString,
                                      sFlgMes,
                                      sMesReferencia, sAnoReferencia, '', sDataAssinatura);

      (* se ATRASO *)
      end
      else if sTipoData = 'A' then
      begin
         if iNumParc <= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBA').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         sData := RetornaDataCobranca(qry.FieldByName('DIACOBA').AsInteger,
                                          qry.FieldByName('FLGUTILA').AsString,
                                          qry.FieldByName('FLGDIAPOSANTA').AsString,
                                          sFlgMes,
                                          sMesReferencia, sAnoReferencia, '', sDataAssinatura);

      (* se DEVOLUÇÃO *)
      end
      else if sTipoData = 'D' then
      begin
         if iNumParc >= 1 then
         begin
            sFlgMes := qry.FieldByName('FLGMESCOBD').AsString;
         end
         else
         begin
            sFlgMes := 'P';
         end;

         if length(trim(qry.FieldByName('DIASAPOSD').AsString)) <> 0 then
         begin
            dData := StrToDate(sDataAssinatura);
            DecodeDate(dData, iAno, iMes, iDia);
            sData := RetornaDataCobranca(Integer(iDia), qry.FieldByName('FLGUTILD').AsString,
                                         qry.FieldByName('FLGDIAPOSANTD').AsString, 'N',
                                         IntToStr(iMes), IntToStr(iAno),
                                         qry.FieldByName('DIASAPOSD').AsString, sDataAssinatura);
         end
         else
         begin
            sData := RetornaDataCobranca(qry.FieldByName('DIACOBD').AsInteger,
                                         qry.FieldByName('FLGUTILD').AsString,
                                         qry.FieldByName('FLGDIAPOSANTD').AsString,
                                         sFlgMes,
                                         sMesReferencia, sAnoReferencia,
                                         qry.FieldByName('DIASAPOSD').AsString, sDataAssinatura);
         end;

      (* se CRÉDITO *)
      end
      else
      begin

         sFlgMes := qry.FieldByName('FLGMESCOBC').AsString;

         if length(trim(qry.FieldByName('DIASAPOSC').AsString)) <> 0 then
         begin
            dData := StrToDate(sDataAssinatura);
            DecodeDate(dData, iAno, iMes, iDia);
            sData := RetornaDataCobranca(Integer(iDia), qry.FieldByName('FLGUTILC').AsString,
                                         qry.FieldByName('FLGDIAPOSANTC').AsString, 'N',
                                         IntToStr(iMes), IntToStr(iAno),
                                         qry.FieldByName('DIASAPOSC').AsString, sDataAssinatura);

         end
         else
         begin
            sData := RetornaDataCobranca(qry.FieldByName('DIACOBC').AsInteger,
                                         qry.FieldByName('FLGUTILC').AsString,
                                         qry.FieldByName('FLGDIAPOSANTC').AsString,
                                         sFlgMes, 
                                         sMesReferencia, sAnoReferencia,
                                         qry.FieldByName('DIASAPOSC').AsString, sDataAssinatura);
         end;

      end; (* se NOMAL *) (* se ATRASO *) (* se DEVOLUÇÃO *) (* CRÉDITO *)

   end; (* if FormaCobranca *)
   
   qry.Close;

   Result := sData;
end;



function TCalcEmptmo.RetornaDataCobranca(iDia: Integer; sUtil, sAnterior, sMesCorrente,
                                         sMesReferencia, sAnoReferencia, sDiasAposProc,
                                         sDataAssinatura: String): String;
var
   dData                            : TDateTime;
   sDia, sMesAno, sData, sDiaUtil   : String;
   iMes, iDiasAposProc, iCodeError  : Integer;
begin
   Result := '';

   (* formata o Mês de Referência p/ 2 dígitos *)
   if length(sMesReferencia) = 1 then sMesReferencia := '0' + sMesReferencia;

   (* formata o Dia p/ 2 dígitos *)
   sDia := IntToStr(iDia);
   if length(sDia) = 1 then sDia := '0' + sDia;

   if sMesCorrente = 'P'
   then sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
   else sMesAno := sMesReferencia + '/' + sAnoReferencia;

   // Verifica se é ano bissexto
   if (sDia >= '29') and (Copy(sMesAno, 0, 2) = '02') then
   begin
      if StrToInt(Copy(sMesAno, 4, 4)) mod 4 = 0 then
      begin
         sDia := '29'
      end
      else
      begin
         sDia := '28';
      end;
   end;

   (* Faço o acerto do último dia do mês para os meses que não terminam em 31.
      Fevereiro já foi tratado acima. *)
   if (sDia > '30') and  (Copy(sMesAno, 0, 2) <> '02') then
   begin
      iMes := StrToInt(Copy(sMesAno, 0, 2));
      case iMes of
         4, 6, 9, 11: sDia := '30';
      end;
   end;

   dData := StrToDate(sDia + '/' + sMesAno);

   if sDiasAposProc = '' then sDiasAposProc := '0';
   Val(sDiasAposProc, iDiasAposProc, iCodeError);
   if iCodeError = 0 then dData := dData + iDiasAposProc;


   if sUtil = 'N' then
   begin // Dia normal(fixo) - Ex: se dia = 5, pega dia 5 do mes
      if DayOfWeek(dData) = 1 then
      begin           // Se dia da semana for domingo
         if sAnterior = 'A'      then sData := DateToStr(dData - 2)  // Pegar dia anterior. 6a. feira
         else if sAnterior = 'P' then sData := DateToStr(dData + 1)  // Pegar dia posterior. 2a feira
         else if sAnterior = 'N' then sData := DateToStr(dData);     // Pegar o proprio dia calculado
      end
      else if DayOfWeek(dData) = 7 then
      begin  // Se dia da semana for sábado
         if sAnterior      = 'A' then sData := DateToStr(dData - 1)  // Pegar dia anterior. 6a. feira
         else if sAnterior = 'P' then sData := DateToStr(dData + 2)  // Pegar dia posterior 2a. feira
         else if sAnterior = 'N' then sData := DateToStr(dData);     // Pegar o proprio dia calculado
         end else sData := DateToStr(dData);                         // Dia da semana é dia útil
   end
   else  // Dia util Ex.: se dia = 5, pega 5° dia útil do mes
   begin
      sDiaUtil := DiaUtil(sDia, sMesAno); // Chama funcao que retorna o dia util

      if Length(sDiaUtil) = 1 then sDiaUtil := '0' + sDiaUtil;

      if sDiasAposProc = '0' then
      begin
         sData := sDiaUtil + '/' + sMesAno;
      end
      else
      begin
         sData := DateToStr(DiasUteis.SomaDiasUteis(strToDate(sDataAssinatura),
                                                    StrToInt(sDiasAposProc),
                                                    -1,
                                                    -1,
                                                    '',
                                                    True,
                                                    True,
                                                    False
                                                   ));
      end;
   end; //fim - Dia util

   Result := sData;
end;



function TCalcEmptmo.AtualizarSaldo(const iIdPessoa, iIdEmpresaProp, iIdPatro, iIdTipEmptmo : Int64;
                                    const fValor: Currency; const bAtualiza: Boolean;
                                    var fSaldo: Currency): Int64;
var
   sSQL           : String;
   fSaldoAnterior : Currency;
   iIdTpEmptmo    : Int64;
   iIdFilial      : Int64;
begin

   if ParametrosSistema then
   begin
      (* Se não huver restrição de verba, sai *)
      if dtmEmptmo.qryParamEmptmoFLGOBRIGAVERBA.AsInteger = 1 then
      begin
         Result := -2;
         Exit;
      end;

      if ( ( dtmEmptmo.qryParamEmptmoFLGVERBAUNICA.IsNull ) or
           ( dtmEmptmo.qryParamEmptmoFLGVERBAUNICA.AsInteger = 0) ) then
      begin
         with dtmEmptmo.qryAux do
         begin
            sSQL :=
            'SELECT '                     + #13 +
            '  V.IDVERBA, V.VLRSALDO '    + #13 +
            'FROM '                       + #13 +
            '  VERBAEMPTMO V '            + #13 +
            'WHERE '                      + #13 +
            '  V.IDEMPRESAPROP = ' + IntToStr(iIdEmpresaProp);

            SQL.Clear;
            SQL.Text := sSQL;
            Open;

            if not(IsEmpty) then
            begin
               fSaldo         := FieldByName('VLRSALDO').AsFloat;
               fSaldoAnterior := fSaldo;
               Result         := FieldByName('IDVERBA').AsInteger;

               if ( fSaldoAnterior - fValor ) <= 0 then
               begin
                  Result := -1;  (* Não possui saldo *)
               end
               else if bAtualiza then
               begin
                  Close;

                  sSQL :=
                  'UPDATE VERBAEMPTMO'                                   + #13 +
                  'SET    VLRSALDO = VLRSALDO - ' + NumeroIngles(fValor) + #13 +
                  'WHERE  IDEMPRESAPROP = ' + IntToStr(iIdEmpresaProp)   + #13;

                  SQL.Clear;
                  SQL.Text := sSQL;
                  try
                     ExecSQL;
                  except
                     Result := -1; (* Erro na atualização de saldo *)
                  end;
               end;

            end
            else
            begin
               fSaldo         := 0;
               fSaldoAnterior := 0;
               Result         := -1;  (* Não possui saldo *)
            end;
         end; (* with dtmEmptmo.qryAux *)
      end
      else
      begin
         with dtmEmptmo.qryAux do
         begin
            sSQL :=
            'SELECT V.IDVERBA, V.VLRSALDO, V.IDTIPOEMPTMO, V.IDFILIAL' + #13 +
            'FROM   VERBAEMPTMO V, ELEGEPATRO E'                       + #13 +
            'WHERE  V.IDEMPRESAPROP = ' + IntToStr(iIdEmpresaProp)     + #13 +
            'AND    V.IDTIPOEMPTMO  = ' + IntToStr(iIdTipEmptmo)       + #13 +
            'AND    E.IDPESSJUR     = ' + IntToStr(iIdPatro)           + #13 +
            'AND    E.IDPESSOA      = ' + IntToStr(iIdPessoa)          + #13 +
            'AND    V.IDFILIAL      = E.IDESTAB'                       + #13;

            SQL.Clear;
            SQL.Text := sSQL;
            Open;

            if not(IsEmpty) then
            begin
               fSaldo         := FieldByName('VLRSALDO').AsFloat;
               fSaldoAnterior := fSaldo;
               Result         := FieldByName('IDVERBA').AsInteger;
               iIdTpEmptmo    := FieldByName('IDTIPOEMPTMO').AsInteger;
               iIdFilial      := FieldByName('IDFILIAL').AsInteger;

               if ( fSaldoAnterior - fValor ) <= 0 then
               begin
                  Result := -1;  (* Não possui saldo *)
               end
               else if bAtualiza then
               begin
                  Close;

                  (* Atualiza o saldo da filial *)
                  sSQL :=
                  'UPDATE VERBAEMPTMO'                                        + #13 +
                  'SET    VLRSALDO      = VLRSALDO - ' + NumeroIngles(fValor) + #13 +
                  'WHERE  IDEMPRESAPROP = ' + IntToStr(iIdEmpresaProp)        + #13 +
                  'AND    IDFILIAL      = ' + IntToStr(iIdFilial)             + #13;

                  SQL.Clear;
                  SQL.Text := sSQL;
                  try
                     ExecSQL;
                  except
                     Result := -1; // Erro na atualização de saldo
                  end;

                  // Atualiza o saldo do tipo de empréstimo
                  if Result <> -1 then
                  begin
                     sSQL :=
                     'UPDATE VERBAEMPTMO'                                        + #13 +
                     'SET    VLRSALDO      = VLRSALDO - ' + NumeroIngles(fValor) + #13 +
                     'WHERE  IDEMPRESAPROP = ' + IntToStr(iIdEmpresaProp)        + #13 +
                     'AND    IDTIPOEMPTMO  = ' + IntToStr(iIdTpEmptmo)           + #13;

                     SQL.Clear;
                     SQL.Text := sSQL;
                     try
                        ExecSQL;
                     except
                        Result := -1; (* Erro na atualização de saldo *)
                     end;
                  end;

                  if Result <> - 1 then
                  begin
                     (* Atualiza o saldo da empresa *)
                     sSQL :=
                     'UPDATE VERBAEMPTMO'                                        + #13 +
                     'SET    VLRSALDO      = VLRSALDO - ' + NumeroIngles(fValor) + #13 +
                     'WHERE  IDEMPRESAPROP = ' + IntToStr(iIdEmpresaProp)        + #13;

                     SQL.Clear;
                     SQL.Text := sSQL;
                     try
                        ExecSQL;
                     except
                        Result := -1; (* Erro na atualização de saldo *)
                     end;
                  end;
               end;
            end
            else
            begin
               fSaldo         := 0;
               fSaldoAnterior := 0;
               Result         := -1;   // Não possui saldo
            end;  // if not(IsEmpty)

         end;  // with dtmEmptmo.qryAux
      end;  // if VerbaUnica
   end;  // if ParametrosSistema
end;



function TCalcEmptmo.ValidaSuspensao(const iIdRegraValidSusp  : Int64;
                                     const iIdContratoEmptmo  : Extended;
                                     const iIdPessoa          : Int64;
                                     const IDBenef            : Int64;
                                     const iIdPatro           : Int64;
                                     const sFlgInterno        : String;
                                     const iIdTipoSuspEmptmo  : Int64;
                                     const nTseMeses          : Integer;
                                     const dTseInicioSusp     : TDateTime;
                                     const dTseFinalSusp      : TDateTime;
                                     const iFlgFerias         : Integer;
                                     const iNumParcAberto     : Integer;
                                     const iNumParcPagas      : Integer;
                                     const dDataInicioAnt     : TDateTime;
                                     const dDataFimAnt        : TDateTime;//Fanuel Junior SOL174268/8141 Kintana
                                     const dDataAtualiza      : TDateTime;
                                     const iIdSuspensaoAtual  : Int64;
                                     const iExcepcional       : Integer = 0;
                                     const IDPessjurCedido    : Integer = 0;
                                     const iLote              : Integer = 0;
                                     const sFlgStatus         : String = 'X'
                                    ): TDateTime;
var
   sSQL              : String;
   sResultado        : String;
   qryAux            : TwwQuery;
   iIdResponsavel    : Int64;
   sCodTipoRecebedor : String;
   dDataFimReceb     : TDateTime;
   iFlgEnvio         : Integer;
   fVlrPrevisto      : double;
   fVlrEefetivo      : double;
   dDataVencto       : TDateTime;
   sFormaCobranca    : String;
   sTipoFolha        : String;
   dDataPrimParc     : TDateTime;
   iIdplanoPrev      : Integer;
   iIdTipoContrEmptmo: Integer;
   dDataPrevista     : TDateTime;
   fSalParticipacao  : double;
   fSalMantido       : double;
   dDataNasc         : TDateTime;
   iDependIRRF       : integer;
   //Renato Visoni SOL 144455 Kintana 1152675
   fTaxaJuros        : Double;
   fSaldoDevedor     : Double;
   //Renato Visoni SOL 144455 Kintana 1152675
   iNumParcelas      : Integer; // Fanuel Junior SOL155006 Kintana1196054
begin
   Result := -1;

   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

     sSQL :=
     '  SELECT '                                                                   + #13 +
     '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, '                                  + #13 +
     '     BTP.CODTIPORECEBEDOR, '                                                 + #13 +
     '     BTP.DATAFIMRECEB '                                                      + #13 +
     '  FROM '                                                                     + #13 +
     '     BENEFBFCIARIO   BFC, '                                                  + #13 +
     '     BFCIARIOTITPLAN BTP '                                                   + #13 +
     '  WHERE '                                                                    + #13 +
     '         IDSITBENEFICIO   IN (1,2,7) '                                       + #13 +
     '     AND BFC.IDPESSOA     = ' + floatToStr(iIdPessoa)                          + #13 +
     '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                  + #13 +
     '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                + #13 +
     '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ';

     sSQL := sSQL +
     '  AND ( DATAFINAL IS NULL    OR  '+
     '        DATAFINAL > TO_DATE' +
     '        (' + QuotedStr(DateToStr(dTseInicioSusp)) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
     '      ) ';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Text := sSQL;
     qryAux.Open;

     if not(qryAux.IsEmpty) then
     begin
       iIdResponsavel    := qryAux.FieldByName('IDRESPONSAVEL').AsInteger;
       sCodTipoRecebedor := qryAux.FieldByName('CODTIPORECEBEDOR').AsString;
       dDataFimReceb     := qryAux.FieldByName('DATAFIMRECEB').AsDateTime;
     end;
   finally
     qryAux.Close;
     qryAux.Free;
   end;

// Ádler Souza - SOL 135229 Kintana 802629
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

{      sSQL := 'SELECT HMEVLRPREVISTO, HMEVLREFETIVO, NVL(FLGENVIO,1) AS FLGENVIO, HMEDATAVENCTO ' + #13 +
              '  FROM HISTMOVEMPTMO H                                                           ' + #13 +
              ' WHERE HMEVLRPREVISTO > 0                                                        ' + #13 +
              '   AND HMETIPOMOV = 1                                                            ' + #13 +
              '   AND HMECENTRALIZA = 1                                                         ' + #13 +
              '   AND HMERECPAG = ''R''                                                         ' + #13 +
              '   AND HMEDATAPREVISTA = (SELECT MAX(hme.hmedataprevista) FROM histmovemptmo hme ' + #13 +
              '                           WHERE hme.idcontratoemptmo = H.Idcontratoemptmo       ' + #13 +
              '                             AND   hme.hmetipomov = 1                            ' + #13 +
              '                             AND   hme.hmevlrprevisto > 0                        ' + #13 +
              '                             AND   hme.hmerecpag = ''R''                         ' + #13 +
              '                             AND   hme.hmecentraliza = 1                         ' + #13 +
              '                             AND   hme.hmedataprevista < SYSDATE)                ' + #13 +
              '   AND IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo);}

      sSQL := 'SELECT H.HMEVLRPREVISTO,                                         ' + #13 +//fVlrPrevisto
              '       H.HMEVLREFETIVO,                                          ' + #13 +//fVlrEefetivo
              '       NVL(H.FLGENVIO, 1) AS FLGENVIO,                           ' + #13 +//iFlgEnvio
              '       H.HMEDATAVENCTO,                                          ' + #13 +//dDataVencto
              '       H.HMEFORMACOBRANCA,                                       ' + #13 +//sFormaCobranca
              '       H.HMETIPOFOLHA,                                           ' + #13 +//sTipoFolha
              '       C.DATAPRIMPARC,                                           ' + #13 +//dDataPrimParc
           //Ádler Souza - SOL 136206 Kintana 813118
              '       C.IDPLANOPREV,                                            ' + #13 +//iIdplanoPrev
              '       C.IDTIPOCONTREMPTMO,                                      ' + #13 +//iIdTipoContrEmptmo
              '       H.HMEDATAPREVISTA,                                        ' + #13 +//dDataPrevista
              '       H.HMENUMPARCELAS,                                         ' + #13 +//iNumParcelas Fanuel Junior SOL155006 Kintana 1196054
           //Fim - Ádler Souza - SOL 136206 Kintana 813118
              '       PPP.SALPARTICIPACAO,                                      ' + #13 +//fSalParticipacao
              '       PPP.SALMANTIDO,                                           ' + #13 +//fSalMantido
              '       P.DATANASC                                                ' + #13 +//dDataNasc
           //Ádler Souza - SOL 136370 Kintana 815304
              '  FROM PESSOAFISICA P, HISTMOVEMPTMO H, CONTRATOEMPTMO C             ' + #13 +
              '       LEFT OUTER JOIN PARTPREVPLAN PPP ON PPP.IDPESSOA = C.IDPESSOA ' + #13 +
              '                                        AND PPP.IDPESSOA = C.IDBENEF ' + #13 +
              '                                        AND PPP.FLGDESATIVADO = 0    ' + #13 +
           //Fim - Ádler Souza - SOL 136370 Kintana 815304

              ' WHERE H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO                   ' + #13 +
              '   AND P.IDPESSOA = C.IDBENEF                                    ' + #13 +
              '   AND HMEVLRPREVISTO > 0                                        ' + #13 +
              '   AND HMETIPOMOV = 1                                            ' + #13 +
              '   AND HMECENTRALIZA = 1                                         ' + #13 +
              '   AND HMERECPAG = ''R''                                         ' + #13 +
              '   AND HMEDATAPREVISTA =                                         ' + #13 +
              '       (SELECT MAX(HME.HMEDATAPREVISTA)                          ' + #13 +
              '          FROM HISTMOVEMPTMO HME                                 ' + #13 +
              '         WHERE HME.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO         ' + #13 +
              '           AND HME.HMETIPOMOV = 1                                ' + #13 +
              '           AND HME.HMEVLRPREVISTO > 0                            ' + #13 +
              '           AND HME.HMERECPAG = ''R''                             ' + #13 +
              '           AND HME.HMECENTRALIZA = 1                             ' + #13 +
              '           AND HME.HMEDATAPREVISTA < TRUNC(SYSDATE))             ' + #13 +
              '   AND H.IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo);

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      //Ádler Souza - SOL 136396 Kintana 815982
      //DEPENDIRRF
      with dtmCalcEmptmo.qryDependIRRF do
      begin
        LimpaParametros(dtmCalcEmptmo.qryDependIRRF);
        ParamByName('PIDTITULAR').AsFloat      := iIdPessoa;
        ParamByName('PFIMIMPOSTOR').AsDateTime := date;
        Open;

        iDependIRRF := dtmCalcEmptmo.qryDependIRRFQUANT.AsInteger; //DEPENDIRRF

        Close;
      end;
      //Fim - Ádler Souza - SOL 136396 Kintana 815982


      if not(qryAux.IsEmpty) then
      begin
        iNumParcelas   := qryAux.FieldByName('HMENUMPARCELAS').AsInteger;    //Fanuel Junior SOL155006 Kintana1196054
        fVlrPrevisto   := qryAux.FieldByName('HMEVLRPREVISTO').AsFloat;
        fVlrEefetivo   := qryAux.FieldByName('HMEVLREFETIVO').AsFloat;
        iFlgEnvio      := qryAux.FieldByName('FLGENVIO').AsInteger;
        dDataVencto    := qryAux.FieldByName('HMEDATAVENCTO').AsDateTime;
        sFormaCobranca := qryAux.FieldByName('HMEFORMACOBRANCA').AsString;//FORMACOBRANCA
        sTipoFolha     := qryAux.FieldByName('HMETIPOFOLHA').AsString;    //TIPOFOLHA
        dDataPrimParc  := qryAux.FieldByName('DATAPRIMPARC').AsDateTime;  //DATAPRIMPARC
//Fim - Ádler Souza - SOL 135229 Kintana 802629

//Ádler Souza - SOL 136206 Kintana 813118
        iIdplanoPrev       := qryAux.FieldByName('IDPLANOPREV').AsInteger;      //IDPLANOPREV
        iIdTipoContrEmptmo := qryAux.FieldByName('IDTIPOCONTREMPTMO').AsInteger;//IDTIPOCONTREMPTMO
        dDataPrevista      := qryAux.FieldByName('HMEDATAPREVISTA').AsDateTime; //DATAPREVISTA
//Fim - Ádler Souza - SOL 136206 Kintana 813118

//Ádler Souza - SOL 136370 Kintana 815304
        fSalParticipacao   := qryAux.FieldByName('SALPARTICIPACAO').AsFloat; //SALPARTICIPACAO
//Fim - Ádler Souza - SOL 136370 Kintana 815304

//Ádler Souza - SOL 136396 Kintana 815982
        fSalMantido        := qryAux.FieldByName('SALMANTIDO').AsFloat; //SALMANTIDO
        dDataNasc          := qryAux.FieldByName('DATANASC').AsDateTime; //DATANASC
//Fim - Ádler Souza - SOL 136396 Kintana 815982
      end;

   finally
     qryAux.Close;
     qryAux.Free;
   end;

   //Renato Visoni SOL 144455 Kintana 1152675
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   fTaxaJuros        :=0;
   fSaldoDevedor     :=0;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT NVL(TXJUROS,0) AS TXJUROS FROM CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO =' +FloatToStr(iIdContratoEmptmo));
   qryAux.Open;

   if not qryAux.isEmpty then begin
     fTaxaJuros := qryAux.FieldByname('TXJUROS').asfloat;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NVL(MAX(h.hmesaldodev),0) AS hmesaldodev  ');
   qryAux.SQL.Add(' FROM histmovemptmo h, contratoemptmo c1, itemxtipocontr itc ');
   qryAux.SQL.Add(' WHERE h.idcontratoemptmo = '+ FloatTostr(iIdContratoEmptmo));
   qryAux.SQL.Add(' AND   h.idcontratoemptmo = c1.idcontratoemptmo ');
   qryAux.SQL.Add(' AND   c1.idtipocontremptmo = itc.idtipocontremptmo ');
   qryAux.SQL.Add(' AND   itc.iditememptmo = h.iditememptmo ');
   qryAux.SQL.Add(' AND   nvl(h.flgestornado,0) = 0 ');
   qryAux.SQL.Add(' AND   h.hmedataprevista = to_date('+QuotedStr(DateTostr(dDataPrevista))+',''DD/MM/YYYY'') ');
   qryAux.SQL.Add(' AND   itc.itcordemextrato = (SELECT MAX(i.itcordemextrato) ');
   qryAux.SQL.Add('                             FROM itemxtipocontr i ');
   qryAux.SQL.Add('                             WHERE i.idtipocontremptmo = itc.idtipocontremptmo ');
   qryAux.SQL.Add('                             AND   i.iditememptmo IN (SELECT iditememptmo ');
   qryAux.SQL.Add('                                                     FROM histmovemptmo hme ');
   qryAux.SQL.Add('                                                      WHERE hme.idcontratoemptmo = h.idcontratoemptmo ');
   qryAux.SQL.Add('                                                      AND   hme.hmedataprevista = h.hmedataprevista ');
   qryAux.SQL.Add('                                                      AND   nvl(hme.flgestornado,0) = 0)) ');
   qryAux.Open;

   If not qryAux.isEmpty then begin
     fSaldoDevedor := qryAux.FieldByname('hmesaldodev').asfloat;
   end;
   qryAux.Free;
   //Renato Visoni SOL 144455 Kintana 1152675

   Result := 0;
   sSQL :=
   'SELECT                                                                                  ' + #13 +
   ' ' + FormatFloat('#0', iIdContratoEmptmo)                     + ' AS IDCONTRATOEMPTMO,  ' + #13 +
//   ' ' + IntToStr(iIdPessoa)                                      + ' AS IDPESSOA,          ' + #13 + //SOL 141670 - KTN 897588 - Ádler Souza
   ' ' + IntToStr(iIdPessoa)                                      + ' AS IDTITULAR,         ' + #13 +
//   ' ' + IntToStr(IDBenef)                                        + ' AS IDBENEF,           ' + #13 + //SOL 141670 - KTN 897588 - Ádler Souza
   ' ' + IntToStr(IDBenef)                                        + ' AS IDPESSOA,          ' + #13 +
   ' ' + IntToStr(iIDPatro)                                       + ' AS IDPESSJUR,         ' + #13 +
   ' ' + IntToStr(iIDPatro)                                       + ' AS IDPATRO,           ' + #13 +
   ' ' + QuotedStr(sFlgInterno)                                   + ' AS FLGINTERNO,        ' + #13 +
   ' ' + IntToStr(iIdTipoSuspEmptmo)                              + ' AS IDTIPOSUSPEMPTMO,  ' + #13 +
   ' ' + IntToStr(nTseMeses)                                      + ' AS TSEMESES,          ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseInicioSusp))  + ' AS TSEINICIOSUSP,     ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseFinalSusp))   + ' AS TSEFINALSUSP,      ' + #13 +
   ' ' + IntToStr(iFlgFerias)                                     + ' AS FLGFERIAS,         ' + #13 +
   ' ' + IntToStr(iNumParcAberto)                                 + ' AS NUMPARCABERTO,     ' + #13 +
   ' ' + IntToStr(iNumParcPagas)                                  + ' AS NUMPARCPAGAS,      ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInicioAnt))  + ' AS DATAINICIOANT,     ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataFimAnt))     + ' AS DATAFIMANT,        ' + #13 +//Fanuel Junior SOL174268/8141 Kintana
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))   + ' AS DATAATUALIZA,      ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataFimReceb))   + ' AS DATAFIMRECEB,      ' + #13 +
   ' ' + IntToStr(iIdResponsavel)                                 + ' AS IDRESPONSAVEL,     ' + #13 +
   ' ' + QuotedStr(sCodTipoRecebedor)                             + ' AS CODTIPORECEBEDOR,  ' + #13 +
   ' ' + IntToStr(iIdSuspensaoAtual)                              + ' AS IDTIPOSUSPATUAL,   ' + #13 +
   '0' + IntToStr(iExcepcional)                                   + ' AS FLGEXCEPCIONAL,    ' + #13 +
   '0' + IntToStr(IDPessjurCedido)                                + ' AS IDPESSJURCEDIDO,   ' + #13 +
   '0' + IntToStr(iLote)                                          + ' AS FLGLOTE,           ' + #13 +
// Ádler Souza - SOL 135229 Kintana 802629
   ' ' + IntToStr(iFlgEnvio)                                      + ' AS FLGENVIO,          ' + #13 +
   ' ' + NumeroIngles(fVlrPrevisto)                               + ' AS VLRPREVISTO,       ' + #13 +
   ' ' + NumeroIngles(fVlrEefetivo)                               + ' AS VLREFETIVO,        ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVencto))     + ' AS DATAVENCTO,        ' + #13 +
// Fim - Ádler Souza - SOL 135502 Kintana 806023

// Ádler Souza - SOL 135502 Kintana 806023
   ' ' + QuotedStr(sFormaCobranca)                                + ' AS FORMACOBRANCA,     ' + #13 +
   ' ' + QuotedStr(sTipoFolha)                                    + ' AS TIPOFOLHA,         ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPrimParc))   + ' AS DATAPRIMPARC,      ' + #13 +
// Fim - Ádler Souza - SOL 135229 Kintana 802629

   ' ' + QuotedStr(sFlgStatus)                                    + ' AS FLGSTATUS,         ' + #13 +
//Ádler Souza - SOL 136206 Kintana 813118
   ' ' + IntToStr(iIdplanoPrev)                                   + ' AS IDPLANOPREV,       ' + #13 +
   ' ' + IntToStr(iIdTipoContrEmptmo)                             + ' AS IDTIPOCONTREMPTMO, ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPrevista))   + ' AS DATAPREVISTA,      ' + #13 +
//Fim - Ádler Souza - SOL 136206 Kintana 813118

   ' ' + NumeroIngles(fSalParticipacao)                           + ' AS SALPARTICIPACAO,   ' + #13 +  //Ádler Souza - SOL 136370 Kintana 815304

   //Renato Visoni SOL 144455 Kintana 1152675
   ' ' + NumeroIngles(fSaldoDevedor)                           + ' AS SALDODEV,   ' + #13 +
   ' ' + NumeroIngles(fTaxaJuros)                              + ' AS TXJUROS,   ' + #13 +
   //Renato Visoni SOL 144455 Kintana 1152675

//Ádler Souza - SOL 136396 Kintana 815982
   ' ' + NumeroIngles(fSalMantido)                                + ' AS SALMANTIDO,        ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataNasc))       + ' AS DATANASC,          ' + #13 +
   ' ' + IntToStr(iDependIRRF)                                    + ' AS DEPENDIRRF,        ' + #13 +
   ' ' + IntToStr(iNumParcelas)                                   + ' AS NUMPARCELAS        ' + #13 + //Fanuel Junior SOL155006 Kintana 1196054
//Fim - Ádler Souza - SOL 136396 Kintana 815982
   'FROM                                                                                    ' + #13 +
   '  DUAL                                                                                  ' + #13;

   if UtilizaRegraData(iIdRegraValidSusp,
                       sSQL,
                       'e validação de suspensão de cobrança',
                       sResultado,
                       True //BRUNO AZEVEDO SOL 136965 KINTANA 822333
                      ) then
   begin
      if sResultado <> '' then
      begin
        Result := StrToDate(sResultado);
      end
      else
      begin
        Result := StrToDate('31/12/1899');
      end;
   end;
end;



function TCalcEmptmo.CancelaQuitacao(const IDContratoEmptmo : Extended;
                                     const dDataPrevista    : TDateTime;
                                     const dDataCanc        : TDateTime;
                                     const iOrigem          : Integer;
                                     const bDesfazEnvio     : Boolean = True
                                    ): Integer;
var
   iPlanilhaResult   : Integer;
   iPlanilha         : Int64;
   iDocumento        : Int64;
   IDTmpDesc         : Extended;
   sIdHistCont       : String;
   sResult, sErro    : TStringList;
   sMsg              : String;
   sHistoricoContab  : String;
   qryDesContabiliza : TwwQuery;
   iResult           : Integer;
   rLogTotalPrev     : TLogTotalPrev;
begin
   ParametrosSistema;

   qryDesContabiliza              := TwwQuery.Create(nil);
   qryDesContabiliza.DatabaseName := 'BaseDados';

   Result                         := 0;

   if IntegraEmptmo.EventoBaixado(IDContratoEmptmo, 3, dDataPrevista) then
   begin
      Result := -2;
      Exit;
   end;

   try
      dtmEmptmo.AbreHistMov(IDContratoEmptmo, 3, iOrigem, dDataPrevista);
      dtmEmptmo.qryHistoricoMov.First;

      while not(dtmEmptmo.qryHistoricoMov.EOF) do
      begin
         if (dtmEmptmo.qryHistoricoMovHMECENTRALIZA.AsInteger = 1) or
            (dtmEmptmo.qryHistoricoMovHMEDESTACADO.AsInteger = 1) then
         begin
            iDocumento  := 0;
            IDTmpDesc   := 0;

            if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull then
            begin
               // Verifica se o historico ja foi enviado contas (P/R) ou folha
               iDocumento  := dtmEmptmo.qryHistoricoMovCODDOCUMENTO.AsInteger;
               IDTmpDesc   := dtmEmptmo.qryHistoricoMovIDTMPDESC.AsFloat;

               // ----------------------------------------------------------------------------------
               if trim(dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString) <> '' then begin //BRUNO AZEVEDO SOL 167580
                 case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1] of

                    'C':
                    if bDesfazEnvio then if iDocumento > 0 then
                    begin
                       // Marchetti - pendencia 25523
                       // Anteriormente a rotina não testava o retorno da funcao
                       if IntegraEmptmo.ExcluiFinanceiro(iDocumento, sMsg) <> 0 then
                       begin
                          MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                          Result := -1;
                          Exit;
                       end;
                       // Fim Marchetti - pendencia 25523

                       // ----------------------------------------------------------------------
                       // André Pontes - 18/01/2006 - LogDocumento - OK

                       LimpaRegistroLog(rLogTotalPrev);

                       rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                       rLogTotalPrev.IDContrato := IDContratoEmptmo;
                       rLogTotalPrev.IDHistMov  := dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                       rLogTotalPrev.CodPlanDoc := iDocumento;
                       rLogTotalPrev.Origem     := 16;
                       rLogTotalPrev.Operacao   := 'CalcEmptmo - CancelaQuitacao - ExcluiFinanceiro';
                       rLogTotalPrev.Data       := SysDate;
                       rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                       rLogTotalPrev.Versao     := Sistema.Versao;

                       GravaLogTotalPrev(rLogTotalPrev);

                       // ----------------------------------------------------------------------
                    end;


                    'F': if bDesfazEnvio then if IDTmpDesc  > 0 then
                         begin
                            // Marchetti - pendencia 25523
                            // Anteriormente a rotina não testava o retorno da funcao
                            if IntegraEmptmo.ExcluiTMPDESCPorTmp(IDContratoEmptmo,
                                                              IDTmpDesc,
                                                              sMsg,
                                                              False
                                                              ) <> 0 then
                            begin
                               MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                               Result := -1;
                               Exit;
                            end;

                            // Anteriormente a rotina não gravava o log da operacao
                            LimpaRegistroLog(rLogTotalPrev);

                            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                            rLogTotalPrev.IDContrato := IDContratoEmptmo;
                            rLogTotalPrev.IDHistMov  := dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                            rLogTotalPrev.CodPlanDoc := iDocumento;
                            rLogTotalPrev.Origem     := 16;
                            rLogTotalPrev.Operacao   := 'CalcEmptmo - CancelaQuitacao - ExcluiTMPDESCPorTmp';
                            rLogTotalPrev.Data       := SysDate;
                            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                            rLogTotalPrev.Versao     := Sistema.Versao;

                            GravaLogTotalPrev(rLogTotalPrev);
                            // Fim Marchetti - pendencia 25523
                         end;
                 end;  // case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1]
                 // ----------------------------------------------------------------------------------
               end; //BRUNO AZEVEDO SOL 167580
            end;  // if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull
         end;  // if (dtmEmptmo.qryHistoricoMovHMECENTRALIZA.AsInteger = 1) or ...

         dtmEmptmo.qryHistoricoMov.Next;
      end;  // while not(dtmEmptmo.qryHistoricoMov.EOF)

      // -------------------------------------------------------------------------------------------

      // Desmarca os itens quitados

      // Marchetti - pendencia 25523
      // Anteriormente a rotna nao testava o retorno da funcao
      if CalcEmptmo.DesMarcaItensQuitados(IDContratoEmptmo, dDataPrevista, iOrigem) < 0 then
      begin
         MsgDlg('Erro ao desmarcar itens quitados', 'Empréstimo', mtError, [mbOK], 0);
         Result := -1;
         Exit;
      end;
      // Fim Marchetti - pendencia 25523

      // -------------------------------------------------------------------------------------------



      // -------------------------------------------------------------------------------------------
      // Contabilização
      // -------------------------------------------------------------------------------------------

      iResult := 0;

         try
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               iResult := 1;
            end
            else
            begin
               qryDesContabiliza.Close;
               qryDesContabiliza.SQL.Clear;
               qryDesContabiliza.SQL.Text := SelecionaItensCancelamento(IDContratoEmptmo, 3, iOrigem, dDataPrevista);
               qryDesContabiliza.Open;

               if qryDesContabiliza.IsEmpty then iResult := 1;
            end;

         except
            iResult := 2;
         end;

      case iResult of

         1:
         begin
            // André Pontes - 06/01/2005
            // A query dtmEmptmo.qryMarcaItensEstornados passa a verificar se o valor efetivo é
            // igual a zero, para permitir desfazer evento com valor previsto = 0
            LimpaParametros(dtmEmptmo.qryMarcaItensEstornados);
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMETIPOMOV').AsInteger        := 3;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PIDCONTRATOEMPTMO').AsFloat    := IDContratoEmptmo;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEDATAPREVISTA').AsDateTime  := dDataPrevista;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEDATAESTORNO').AsDateTime   := dDataCanc;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PIDUSUARIOESTORNO').AsInteger  := Sistema.IDUsuario;
            dtmEmptmo.qryMarcaItensEstornados.ExecSQL;
         end;

         2:
         begin
            MsgDlg('Erro na busca dos Itens a serem estornados na Contabilidade para este contrato.', 'Empréstimo', mtError, [mbOK], 0);
            Result := -1;
            Exit;
         end;

         else // case iResult = 0
         begin
            // Retornou 0 (Possui registros a serem estornados na contabilidade)
            // Verificar o parametro de sistema Contabiliza(Sim/Não)
            if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
            begin
               // Estornar a contabilidade
               sHistoricoContab := 'Emprestimo - Cancelamento de Quitacao - Contrato nº ' +
                                   FormatFloat('#0', IDContratoEmptmo);

               if IntegraEmptmo.ContabilizaItens('C',
                                                 'E',
                                                 qryDesContabiliza.SQL.Text,
                                                 sHistoricoContab,
                                                 dDataCanc,
                                                 sResult,
                                                 sErro,
                                                 iPlanilhaResult
                                                ) < 0 then
               begin
                  MsgDlg('Erro no estorno Contábil dos Itens deste Contrato.', 'Empréstimo', mtInformation, [mbOK], 0);
                  Result := -1;
                  Exit;
               end;
            end
            else
            begin
               sMsg  := 'Já houve contabilização da quitação do Contrato selecionado. ' + #13 +
                        'É necessário habilitar a integração contábil nos Parâmetros do ' +
                        'Sistema para permitir o estorno dos lançamentos anteriores .';

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOK], 0);
               Result := -1;
               Exit;
            end;
         end;
      end;  // case

      // -------------------------------------------------------------------------------------------
      // FIM Contabilização
      // -------------------------------------------------------------------------------------------

      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         dtmAtualizacaoDiaria.ExecutaAtuDia(IDContratoEmptmo,        // Contrato
                                            Sistema.IDModulo,
                                            -1,                      // Tipo Contr
                                            -1,                      // Tipo Emptmo
                                            -1,                      // Patro
                                            -1,                      // Plano
                                            1,                       // Estorno
                                            0,                       // Prov Perda
                                            1,                       // Atu Saldo
                                            -1,                      // In Arquivo
                                            -1,                      // Not In Arquivo
                                            dDataPrevista,           // Data Ini
                                            dDataPrevista + 10,      // Data Fim
                                            dDataPrevista - 1        // Data Considera
                                           );
      end;

      // -------------------------------------------------------------------------------------

      // Atualiza Contrato
      AcertaSituacaoContratual(IDContratoEmptmo, 53);

      // -------------------------------------------------------------------------------------

      // Limpa os valores de repasse calculados
      with dtmCalcEmptmo.qryLimpaRepasse do
      begin
         LimpaParametros(dtmCalcEmptmo.qryLimpaRepasse);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContratoEmptmo;
         ExecSQL;
      end;

      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Canc. Quit. Contrato ' +
                                       FormatFloat('#0', IDContratoEmptmo) +
                                       ' ref: ' + FormatDateTime('dd/mm/yyyy', Sysdate))) then
      begin
         Raise Exception.Create('Falha na gravação do Log da operação.');
         Result := -1;
      end;
      // -------------------------------------------------------------------------------------
   finally
      qryDesContabiliza.Free;
   end;
end;



function TCalcEmptmo.CancelaAmortizacao(const IDContratoEmptmo : Extended;
                                        const dDataPrevista    : TDateTime;
                                        const dDataCanc        : TDateTime;
                                        const bDesfazEnvio     : Boolean = True
                                       ): Integer;
var
   iResult           : Integer;
   sMsg              : String;
   iPlanilha         : Int64;
   iDocumento        : Int64;
   IDTmpDesc         : Extended;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
   qryDesContabiliza : TwwQuery;
   rLogTotalPrev     : TLogTotalPrev;
begin
   qryDesContabiliza              := TwwQuery.Create(nil);
   qryDesContabiliza.DatabaseName := 'BaseDados';
   Result                         := 0;

   iDocumento                     := 0;

   try
      dtmEmptmo.AbreHistMov(IDContratoEmptmo, 2, 2, dDataPrevista);

      // Rotina para verificar contabilidade , contas r/p* e Folha
      dtmEmptmo.qryHistoricoMov.First;

      while not(dtmEmptmo.qryHistoricoMov.EOF) do
      begin
         if (dtmEmptmo.qryHistoricoMovHMECENTRALIZA.AsInteger = 1) or
            (dtmEmptmo.qryHistoricoMovHMEDESTACADO.AsInteger = 1) then
         begin
            iDocumento  := 0;
            IDTmpDesc   := 0;

            if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull then
            begin
               // Verifica se o historico ja foi enviado contas (P/R) ou folha
               iDocumento  := dtmEmptmo.qryHistoricoMovCODDOCUMENTO.AsInteger;
               IDTmpDesc   := dtmEmptmo.qryHistoricoMovIDTMPDESC.AsFloat;

               // ----------------------------------------------------------------------------------
               case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1] of

                  'C':
                  if bDesfazEnvio then if iDocumento > 0 then
                  begin
                     // Marchetti - pendencia 25523
                     // Anteriormente a rotina nao testava o retorno da funcao
                     if IntegraEmptmo.ExcluiFinanceiro(iDocumento, sMsg) <> 0 then
                     begin
                        MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                        Result := -1;
                        Exit;
                     end;
                     // Fim Marchetti - pendencia 25523

                     // ----------------------------------------------------------------------------
                     // André Pontes - 18/01/2006 - LogDocumento - OK

                     LimpaRegistroLog(rLogTotalPrev);

                     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                     rLogTotalPrev.IDContrato := IDContratoEmptmo;
                     rLogTotalPrev.IDHistMov  := dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                     rLogTotalPrev.CodPlanDoc := iDocumento;
                     rLogTotalPrev.Origem     := 16;
                     rLogTotalPrev.Operacao   := 'CalcEmptmo - CancelaAmortizacao - ExcluiFinanceiro';
                     rLogTotalPrev.Data       := SysDate;
                     rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                     rLogTotalPrev.Versao     := Sistema.Versao;

                     GravaLogTotalPrev(rLogTotalPrev);

                     // ----------------------------------------------------------------------------
                  end;


                  'F': if bDesfazEnvio then if IDTmpDesc  > 0 then
                       begin
                          // Marchetti - pendencia 25523
                          // Anteriormente a rotina nao testava o retorno da funcao
                          if IntegraEmptmo.ExcluiTMPDESCPorTmp(IDContratoEmptmo,
                                                            IDTmpDesc,
                                                            sMsg,
                                                            False
                                                            ) <> 0 then
                          begin
                             MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                             Result := -1;
                             Exit;
                          end;

                          // Anteriormente a rotina nao gravava o log da operacao
                          LimpaRegistroLog(rLogTotalPrev);

                          rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                          rLogTotalPrev.IDContrato := IDContratoEmptmo;
                          rLogTotalPrev.IDHistMov  := dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                          rLogTotalPrev.CodPlanDoc := iDocumento;
                          rLogTotalPrev.Origem     := 16;
                          rLogTotalPrev.Operacao   := 'CalcEmptmo - CancelaAmortizacao - ExcluiTMPDESCPorTmp';
                          rLogTotalPrev.Data       := SysDate;
                          rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                          rLogTotalPrev.Versao     := Sistema.Versao;

                          GravaLogTotalPrev(rLogTotalPrev);
                          // Fim Marchetti - pendencia 25523
                       end;
               end;  // case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1]
               // ----------------------------------------------------------------------------------
            end;  // if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull
         end;  // if (dtmEmptmo.qryHistoricoMovHMECENTRALIZA.AsInteger = 1) or ...

         dtmEmptmo.qryHistoricoMov.Next;
      end;  // while not(dtmEmptmo.qryHistoricoMov.EOF)

      // -------------------------------------------------------------------------------------------
      // Contabilização
      // -------------------------------------------------------------------------------------------

      iResult := 0;

         try
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               iResult := 1;
            end
            else
            begin
               qryDesContabiliza.Close;
               qryDesContabiliza.SQL.Clear;
               qryDesContabiliza.SQL.Text := SelecionaItensCancelamento(IDContratoEmptmo, 2, -1, dDataPrevista);
               qryDesContabiliza.Open;

               if qryDesContabiliza.IsEmpty then iResult := 1;
            end;

         except
            iResult := 2;
         end;

      case iResult of

         1:
         begin
            // André Pontes - 06/01/2005
            // A query dtmEmptmo.qryMarcaItensEstornados passa a verificar se o valor efetivo é
            // igual a zero, para permitir desfazer evento com valor previsto = 0
            LimpaParametros(dtmEmptmo.qryMarcaItensEstornados);
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMETIPOMOV').AsInteger        := 2;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PIDCONTRATOEMPTMO').AsFloat    := IDContratoEmptmo;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEDATAPREVISTA').AsDateTime  := dDataPrevista;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEDATAESTORNO').AsDateTime   := dDataCanc;
            dtmEmptmo.qryMarcaItensEstornados.ParamByName('PIDUSUARIOESTORNO').AsInteger  := Sistema.IDUsuario;
            dtmEmptmo.qryMarcaItensEstornados.ExecSQL;
         end;

         2:
         begin
            MsgDlg('Erro na busca dos Itens a serem estornados na Contabilidade para este contrato.', 'Empréstimo', mtError, [mbOK], 0);
            Result := -1;
            Exit;
         end;

         else // case Result = 0
         begin
            ParametrosSistema;
            // Retornou 0 (Possui registros a serem estornados na contabilidade)
            // Verificar o parametro de sistema Contabiliza(Sim/Não)
            if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
            begin
               // Estornar a contabilidade
               sHistoricoContab := 'Emprestimo - Cancelamento de Amortizacao - Contrato nº ' +
                                   FormatFloat('#0', IDCONTRATOEMPTMO);

               if IntegraEmptmo.ContabilizaItens('C',
                                                 'E',
                                                 qryDesContabiliza.SQL.Text,
                                                 sHistoricoContab,
                                                 dDataCanc,
                                                 sResult,
                                                 sErro,
                                                 iPlanilhaResult
                                                ) < 0 then
               begin
                  MsgDlg('Erro no estorno Contábil dos Itens deste Contrato.', 'Empréstimo', mtInformation, [mbOK], 0);
                  Result := -1;
                  Exit;
               end;
            end
            else
            begin
               sMsg  := 'Já houve contabilização da amortização do Contrato selecionado. ' + #13 +
                        'É necessário habilitar a integração contábil nos Parâmetros do ' +
                        'Sistema para permitir o estorno dos lançamentos anteriores .';

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOK], 0);
               Result := -1;
               Exit;
            end;
         end;

      end;  // case

      // -------------------------------------------------------------------------------------------
      // FIM Contabilização
      // -------------------------------------------------------------------------------------------

      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         dtmAtualizacaoDiaria.ExecutaAtuDia(IDContratoEmptmo,        // Contrato
                                            Sistema.IDModulo,
                                            -1,                      // Tipo Contr
                                            -1,                      // Tipo Emptmo
                                            -1,                      // Patro
                                            -1,                      // Plano
                                            1,                       // Estorno
                                            0,                       // Prov Perda
                                            1,                       // Atu Saldo
                                            -1,                      // In Arquivo
                                            -1,                      // Not In Arquivo
                                            dDataPrevista,           // Data Ini
                                            dDataPrevista + 10,      // Data Fim
                                            dDataPrevista - 1        // Data Considera
                                           );
      end;

      // -------------------------------------------------------------------------------------

      // Atualiza Contrato
      AcertaSituacaoContratual(IDContratoEmptmo, 52);

      // -------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Canc. Amortiza Contrato ' +
                                       FormatFloat('#0', IDCONTRATOEMPTMO) +
                                       ' ref: ' + FormatDateTime('dd/mm/yyyy', Sysdate))) then
      begin
         Raise Exception.Create('Falha na gravação do Log da operação.');
         Result := -1;
         Exit;
      end;
      // -------------------------------------------------------------------------------------

   finally
      qryDesContabiliza.Free;
   end;
end;



function TCalcEmptmo.CancelaAlteracaoConcessao(const IDContratoEmptmo : Extended;
                                               const dDataPrevista    : TDateTime;
                                               const dDataCanc        : TDateTime;
                                               const bDesfazEnvio     : Boolean = True
                                              ): Integer;
var
   iResult           : Integer;
   sMsg              : String;
   iDocumento        : Int64;
   IDTmpDesc         : Extended;
   sResult, sErro    : TStringList;
   rLogTotalPrev     : TLogTotalPrev;
begin
   Result      := 0;
   iDocumento  := 0;

   try
      dtmEmptmo.AbreHistMov(IDContratoEmptmo, 0, 13, dDataPrevista);

      // Rotina para verificar contabilidade , contas r/p* e Folha
      dtmEmptmo.qryHistoricoMov.First;

      while not(dtmEmptmo.qryHistoricoMov.EOF) do
      begin
         if (dtmEmptmo.qryHistoricoMovHMECENTRALIZA.AsInteger = 1) or
            (dtmEmptmo.qryHistoricoMovHMEDESTACADO.AsInteger = 1) then
         begin
            iDocumento  := 0;
            IDTmpDesc   := 0;

            if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull then
            begin
               // Verifica se o historico ja foi enviado contas (P/R) ou folha
               iDocumento  := dtmEmptmo.qryHistoricoMovCODDOCUMENTO.AsInteger;
               IDTmpDesc   := dtmEmptmo.qryHistoricoMovIDTMPDESC.AsFloat;

               // ----------------------------------------------------------------------------------
               case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1] of

                  'C':
                  if bDesfazEnvio then if iDocumento > 0 then
                  begin

                     // Marchetti - pendencia 25523
                     // Anteriormente a rotina nao testava o retorno da funcao                     
                     if IntegraEmptmo.ExcluiFinanceiro(iDocumento, sMsg) <> 0 then
                     begin
                        MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                        Result := -1;
                        Exit;
                     end;
                     // Fim Marchetti - pendencia 25523

                     // ----------------------------------------------------------------------------
                     // André Pontes - 18/01/2006 - LogDocumento - OK

                     LimpaRegistroLog(rLogTotalPrev);

                     rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                     rLogTotalPrev.IDContrato := IDContratoEmptmo;
                     rLogTotalPrev.IDHistMov  := dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                     rLogTotalPrev.CodPlanDoc := iDocumento;
                     rLogTotalPrev.Origem     := 16;
                     rLogTotalPrev.Operacao   := 'CalcEmptmo - CancelaAlteracaoConcessao - ExcluiFinanceiro';
                     rLogTotalPrev.Data       := SysDate;
                     rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                     rLogTotalPrev.Versao     := Sistema.Versao;

                     GravaLogTotalPrev(rLogTotalPrev);

                     // ----------------------------------------------------------------------------
                  end;

                  'F':
                     if bDesfazEnvio then if IDTmpDesc  > 0 then
                     begin
                        // Marchetti - pendencia 25523
                        // Anteriormente a rotina nao testava o retorno da funcao
                        if IntegraEmptmo.ExcluiTMPDESCPorTmp(IDContratoEmptmo,
                                                          IDTmpDesc,
                                                          sMsg,
                                                          False
                                                          ) <> 0 then
                        begin
                           MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
                           Result := -1;
                           Exit;
                        end;

                        // Anteriormente a rotina nao gravava o log da operacao
                        LimpaRegistroLog(rLogTotalPrev);

                        rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                        rLogTotalPrev.IDContrato := IDContratoEmptmo;
                        rLogTotalPrev.IDHistMov  := dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsFloat;
                        rLogTotalPrev.CodPlanDoc := iDocumento;
                        rLogTotalPrev.Origem     := 16;
                        rLogTotalPrev.Operacao   := 'CalcEmptmo - CancelaAlteracaoConcessao - ExcluiTMPDESCPorTmp';
                        rLogTotalPrev.Data       := SysDate;
                        rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                        rLogTotalPrev.Versao     := Sistema.Versao;

                        GravaLogTotalPrev(rLogTotalPrev);
                        // Fim Marchetti - pendencia 25523
                     end;
               end;  // case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1]
               // ----------------------------------------------------------------------------------
            end;  // if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull
         end;  // if (dtmEmptmo.qryHistoricoMovHMECENTRALIZA.AsInteger = 1) or ...

         dtmEmptmo.qryHistoricoMov.Next;
      end;  // while not(dtmEmptmo.qryHistoricoMov.EOF)


      LimpaParametros(dtmEmptmo.qryMarcaItensEstornados);
      dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMETIPOMOV').AsInteger        := 0;
      dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEORIGEM').AsInteger         := 13;
      dtmEmptmo.qryMarcaItensEstornados.ParamByName('PIDCONTRATOEMPTMO').AsFloat    := IDContratoEmptmo;
      dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEDATAPREVISTA').AsDateTime  := dDataPrevista;
      dtmEmptmo.qryMarcaItensEstornados.ParamByName('PHMEDATAESTORNO').AsDateTime   := dDataCanc;
      dtmEmptmo.qryMarcaItensEstornados.ParamByName('PIDUSUARIOESTORNO').AsInteger  := Sistema.IDUsuario;
      dtmEmptmo.qryMarcaItensEstornados.ExecSQL;


      // -------------------------------------------------------------------------------------------
      // FIM Contabilização
      // -------------------------------------------------------------------------------------------

      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         dtmAtualizacaoDiaria.ExecutaAtuDia(IDContratoEmptmo,        // Contrato
                                            Sistema.IDModulo,
                                            -1,                      // Tipo Contr
                                            -1,                      // Tipo Emptmo
                                            -1,                      // Patro
                                            -1,                      // Plano
                                            1,                       // Estorno
                                            0,                       // Prov Perda
                                            1,                       // Atu Saldo
                                            -1,                      // In Arquivo
                                            -1,                      // Not In Arquivo
                                            dDataPrevista,           // Data Ini
                                            dDataPrevista + 10,      // Data Fim
                                            dDataPrevista - 1        // Data Considera
                                           );
      end;

      // -------------------------------------------------------------------------------------

      // Atualiza Contrato
      AcertaSituacaoContratual(IDContratoEmptmo, 52);

      // -------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Canc. Alteracao Concessao ' +
                                       FormatFloat('#0', IDCONTRATOEMPTMO) +
                                       ' ref: ' + FormatDateTime('dd/mm/yyyy', Sysdate))) then
      begin
         Raise Exception.Create('Falha na gravação do Log da operação.');
         Result := -1;
         Exit;
      end;
      // -------------------------------------------------------------------------------------

   finally
   end;
end;

                                                                      //ALEX123

function TCalcEmptmo.SelecionaItensCancelamento(const IDContratoEmptmo  : Extended;
                                                const iEvento           : Integer;
                                                const iOrigem           : Integer;
                                                const dData             : TDateTime
                                               ) : String;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  H.IDHISTMOVEMPTMO, '                                                                   + #13 +
   '  H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, ITE.ITEDESCRICAO, '                                + #13 +
   '  H.HMEVLRPREVISTO, H.HMEVLREFETIVO, H.HMEFORMACOBRANCA, '                               + #13 +
   //Pendência 23251 - 06/11/2006 - Alberto
   '  TC.IDTIPOCONTREMPTMO, MIG.IDPLANOCONTATU AS IDPLANOORIGEM, '                           + #13 +
   '  NVL(MIG.IDPLANOCONTATU, C.IDPLANOPREV) AS IDPLANOPREV, '                               + #13 +
   '  MIG.IDPATROATU AS IDPATRO, '                                                           + #13 +
   //Fim Pendência 23251
   '  ITC.TIPCODIGO '                                                                        + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   H,   '                                                                 + #13 +
   //Pendência 23251 - 06/11/2006 - Alberto
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +
   //Fim Pendência 23251
   '  CONTRATOEMPTMO  C,   '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TC,  '                                                                 + #13 +
   '  TIPOEMPTMO      TE   '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '      ( H.HMETIPOMOV            = ' + IntToStr(iEvento) + ' ) '                          + #13 +
   '  AND ( H.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '        + #13 +

   // André Pontes - 01/02/2006
   '  AND H.HMEDATAPREVISTA         = ' + OraData(dData)                                     + #13;

   if iOrigem = -1 then sSQL := sSQL +
   '  AND ( H.HMEORIGEM            <> 10 ) '                                                 + #13
   else sSQL := sSQL +
   '  AND ( H.HMEORIGEM             = ' + IntToStr(iOrigem) + '  ) '                         + #13;

   sSQL := sSQL +
   // André Pontes - 17/05/2005 - pendência 19249
   '   AND H.HMESEQCOBRANCA         = 1 '                                                    + #13 +
   '   AND H.HMEVLRPREVISTO        <> 0 '                                                    + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19249

   // André Pontes - 17/05/2005 - pendência 19264
   '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '                                                    + #13;
   // FIM André Pontes - 17/05/2005 - pendência 19264

   sSQL := sSQL +
	'  AND NVL(H.FLGQUITADO, 0)    = 0 '                                                      + #13 +
	'  AND NVL(H.FLGABONADO, 0)    = 0 '                                                      + #13 +
	'  AND NVL(H.FLGESTORNADO, 0)  = 0 '                                                      + #13 +

   //Pendência 23251 - 09/10/2006 - Alberto
   '  AND MIG.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '                                        + #13 +
   '  AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                    + #13 +
   '                              from   VWMIGRACONTRATOEP '                                 + #13 +
   '                              where  IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO '             + #13 +
   '                              and    DATAMIGRA <= H.HMEDATAPREVISTA) '                   + #13 +
   //Fim Pendência 23251

   '  AND ( H.PLNCODIGO IS NOT NULL ) '                                                      + #13 +
   '  AND ( (H.HMECENTRALIZA = 0) OR (H.HMECENTRALIZA IS NULL) ) '                           + #13 +

   '  AND ( TE.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +

   '  AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO ) '                                 + #13 +
   '  AND ( C.IDTIPOCONTREMPTMO     = TC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '  AND ( TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO ) '                                    + #13 +
   '  AND ( H.IDITEMEMPTMO          = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '  AND ( H.IDITEMEMPTMO          = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '  AND ( ITC.IDITEMEMPTMO        = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO   = TC.IDTIPOCONTREMPTMO ) '                               + #13;

   Result := sSQL;
end;




function TCalcEmptmo.ExistemItensEmAberto(const iContrato: Extended;
                                          const bData    : Boolean = False;
                                          const dData    : TDateTime = 0;
                                          const bMes     : Boolean = False;
                                          const iAno     : Integer = 0;
                                          const iMes     : Integer = 0;
                                          // Thiago Melo SOL 179805 KINTANA 1659409
                                          const FlModo   : SmallInt = 0
                                          // Thiago Melo SOL 179805 KINTANA 1659409

                                         //Pendência 27232 - 16/04/2008
                                         //): Boolean;
                                         ): Currency;
var
sMes, sAno : string;

begin
   //Pendência 27232 - 16/04/2008
   //Result := False;
   Result := 0;

   //SOL 129170 - Ádler Souza
   sAno := FormatFloat('0000',iAno);
   sMes := FormatFloat('00', iMes);
   //Fim - SOL 129170

   try
     // SOL 179805 Kintana 1659409 - Thiago Dantas Melo - Ini
     if FlModo = 1 then
     begin
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Close;
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Clear;
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('SELECT');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO,');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('FROM');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('  HISTMOVEMPTMO HME');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('WHERE');

       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   HME.IDCONTRATOEMPTMO         = ' + FloatToStr(iContrato));
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND HME.HMETIPOMOV           NOT IN (0, 5, 8)');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND HME.FLGBAIXADO           = 0');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND HME.HMEDATAEFETIVA       IS NULL');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND HME.HMEVLREFETIVO        IS NULL');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND HME.HMEVLRPREVISTO       <> 0');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND NVL(HME.FLGESTORNADO, 0) = 0');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND NVL(HME.FLGSUSPENSAO, 0) = 0');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND NVL(HME.FLGQUITADO, 0)   = 0');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND NVL(HME.FLGABONADO, 0)   = 0');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND ((hme.hmedataprevista + 7) < TO_DATE(' + QuotedStr(DateToStr(dData)) + ',''dd/mm/yyyy''))'); //    SOL 195657 Kintana 1911743 adicionado + 7 dias na data prevista 
       // Thiago Melo SOL 184423 KINTANA 1724052
//       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND (1             IS NULL OR (1  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,' + QuotedStr('0000') + ')) || TRIM(TO_CHAR(HME.HMEMESCOBRANCA,' + QuotedStr('00') + ' )) < ' + QuotedStr(sAno) + ' || ' + QuotedStr(sMes) + ')))');
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Sql.Add('   AND (1             IS NULL OR (1  IS NOT NULL AND (TRIM(TO_CHAR(HME.HMEANOCOMPETENCIA,' + QuotedStr('0000') + ')) || TRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,' + QuotedStr('00') + ' )) < ' + QuotedStr(sAno) + ' || ' + QuotedStr(sMes) + ')))');
       // Thiago Melo SOL 184423 KINTANA 1724052
       dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Open;

       if not dtmCalcEmptmo.qryItensEmAberto_Auxiliar.IsEmpty then
       begin                                                            
         while not(dtmCalcEmptmo.qryItensEmAberto_Auxiliar.EOF) do
         begin
           Result := Result + dtmCalcEmptmo.qryItensEmAberto_Auxiliar.FieldByName('HMEVLRPREVISTO').AsCurrency;
           dtmCalcEmptmo.qryItensEmAberto_Auxiliar.Next;
         end;
       end;
     end
     else begin

       with dtmCalcEmptmo.qryItensEmAberto do
       begin

         LimpaParametros(dtmCalcEmptmo.qryItensEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := iContrato;

         if bData then
         begin
           ParamByName('PFILTRODATA').AsInteger      := 1;
           ParamByName('PHMEDATAVENCTO').AsDateTime  := dData;
         end
  //     SOL 179805 Kintana 1659409 - Thiago Dantas Melo - ini
         else
         begin
           //BRUNO AZEVEDO SOL 184911 KINTANA 1738501
           //ParamByName('PFILTRODATA').AsInteger      := 0;
           //ParamByName('PHMEDATAVENCTO').AsDateTime  := 0;
           //BRUNO AZEVEDO SOL 184911 KINTANA 1738501
         end;
  //     SOL 179805 Kintana 1659409 - Thiago Dantas Melo - Fim

         if bMes then
         begin
           ParamByName('PFILTROMES').AsInteger       := 1;
//SOL 129170 - Ádler Souza
//            ParamByName('PHMEMESCOBRANCA').AsInteger  := iMes;
//            ParamByName('PHMEANOCOBRANCA').AsInteger  := iAno;
           ParamByName('PHMEMESCOBRANCA').AsString  := sMes;
           ParamByName('PHMEANOCOBRANCA').AsString  := sAno;
//Fim - SOL 129170
         end;

         Open;

         //Pendência 27232 - 16/04/2008
         //if not(dtmCalcEmptmo.qryItensEmAberto.IsEmpty) then Result := True;
         if not IsEmpty then
           while not(EOF) do
           begin
              Result := Result + FieldByName('HMEVLRPREVISTO').AsCurrency;
              Next;
           end;
       end;
     end;

   finally
      dtmCalcEmptmo.qryItensEmAberto.Close;
   end;

end;

//BRUNO AZEVEDO SOL 175562 KINTANA 1637191
function TCalcEmptmo.MinDataVencto(const iContrato: Extended;
                                   const bData    : Boolean = False;
                                   const dData    : TDateTime = 0;
                                   const bMes     : Boolean = False;
                                   const iAno     : Integer = 0;
                                   const iMes     : Integer = 0
                                   ): TDateTime;
var
sMes, sAno : string;
begin
   Result := 0;

   sAno := FormatFloat('0000',iAno);
   sMes := FormatFloat('00', iMes);

   try
      with dtmCalcEmptmo.qryMinDataVencto do
      begin

         LimpaParametros(dtmCalcEmptmo.qryMinDataVencto);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := iContrato;

         if bData then
         begin
            ParamByName('PFILTRODATA').AsInteger      := 1;
            ParamByName('PHMEDATAVENCTO').AsDateTime  := dData;
         end;

         if bMes then
         begin
            ParamByName('PFILTROMES').AsInteger       := 1;
            ParamByName('PHMEMESCOBRANCA').AsString  := sMes;
            ParamByName('PHMEANOCOBRANCA').AsString  := sAno;
         end;

         Open;

         if not IsEmpty then begin
            Result := Result + FieldByName('HMEDATAVENCTO').AsDateTime;
         end;
      end;
   finally
      dtmCalcEmptmo.qryMinDataVencto.Close;
   end;
end;
//BRUNO AZEVEDO SOL 175562 KINTANA 1637191

function TCalcEmptmo.ExisteSaldoDevedor(const IDContrato: Extended): Boolean;
var
   dDataSaldo : TDateTime;
begin
   Result := False;

   try
      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         dDataSaldo := UltimaDataAtualizacao(IDContrato);

         with dtmCalcEmptmo.qrySaldoAntAtuDia do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAntAtuDia);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataSaldo;
            Open;

            if not(dtmCalcEmptmo.qrySaldoAntAtuDia.IsEmpty) and
            // Marchetti - Pendencia 26497 - A pedido da FUNCEF, o saldo devedor deve ser diferente de ZERO
            // e não MAIOR que ZERO
               (dtmCalcEmptmo.qrySaldoAntAtuDiaHMESALDODEV.AsCurrency <> 0) then
            // Fim Marchetti - Pendencia 26497
            begin
               Result := True;
            end;
         end;
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
      begin
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
            ParamByName('PHMEDATAATUALIZA').AsDateTime   := DiasUteis.SomaAnos(sysdate, 10);
            Open;

            if not(dtmCalcEmptmo.qrySaldoAnt.IsEmpty) and
               (dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency > 0) then
            begin
               Result := True;
            end;
         end;
      end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

   finally
      dtmCalcEmptmo.qrySaldoAnt.Close;
   end
end;




function TCalcEmptmo.ExisteQuitacao(const IDContrato: Extended): Boolean;
begin
   Result := False;

   try
      with dtmCalcEmptmo.qryExisteQuitacao do
      begin
         LimpaParametros(dtmCalcEmptmo.qryExisteQuitacao);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContrato;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      dtmCalcEmptmo.qryExisteQuitacao.Close;
   end
end;

//SOL122788 - Ádler Souza
function TCalcEmptmo.ExisteQuitacaoAberto(const IDContrato: Extended): Boolean;
begin
   Result := False;
   try
      with dtmCalcEmptmo.qryExisteQuitacaoAberto do
      begin
         LimpaParametros(dtmCalcEmptmo.qryExisteQuitacao);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContrato;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      dtmCalcEmptmo.qryExisteQuitacaoAberto.Close;
   end
end;
//Fim - SOL122788 - Ádler Souza


function TCalcEmptmo.UltimaDataAtualizacao(const IDContrato: Extended): TDateTime;
begin
   try
      with dtmCalcEmptmo.qryUltDataAtualiza do
      begin
         LimpaParametros(dtmCalcEmptmo.qryUltDataAtualiza);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
         Open;

         Result := dtmCalcEmptmo.qryUltDataAtualizaHMEDATAATUALIZA.AsDateTime;
      end;
   finally
      dtmCalcEmptmo.qryUltDataAtualiza.Close;
   end;
end;



function TCalcEmptmo.PossuiAtualizacaoDiaria(const IDContrato  : Extended;
                                             const dData       : TDateTime
                                            ):  Boolean;
begin
   Result := False;

   try
      with dtmCalcEmptmo.qryPossuiAtualizacaoDiaria do
      begin
         LimpaParametros(dtmCalcEmptmo.qryPossuiAtualizacaoDiaria);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := dData;
         Open;
      end;

      if not(dtmCalcEmptmo.qryPossuiAtualizacaoDiaria.IsEmpty) then Result := True;

   finally
      dtmCalcEmptmo.qryPossuiAtualizacaoDiaria.Close;
   end;
end;


//Pendência 22798 - 15/09/2006      
function TCalcEmptmo.PossuiAtualizacaoDiariaExt(const IDContrato  : Extended;
                                                const dData       : TDateTime
                                               ):  Boolean;
begin
   Result := False;

   try
      with dtmCalcEmptmo.qryPossuiAtualizacaoDiariaExt do
      begin
         LimpaParametros(dtmCalcEmptmo.qryPossuiAtualizacaoDiariaExt);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := dData;
         Open;
      end;

      if not(dtmCalcEmptmo.qryPossuiAtualizacaoDiariaExt.IsEmpty) then Result := True;

   finally
      dtmCalcEmptmo.qryPossuiAtualizacaoDiariaExt.Close;
   end;
end;
//Fim Pendência 22798


// função que busca o prazo máximo do tipo de contrato
function TCalcEmptmo.BuscaPrazoContrato(const iIdTitular       :Int64;
                                        const iIdBeneficiario  : Int64;
                                        const iNumParcela      : Integer;
                                        const IDRegra          : Int64;
                                        const iTipoCOntrEmptmo : Int64;
                                        const dDataInsc        : TDateTime;
                                        const bMostraMsg      : Boolean
                                        //Pendência 22836 - 03/10/2006 - Alberto
                                       ;const bExcepcional     : Boolean = false
                                        //Fim Pendência 22836
                                       ;const iIdPlanoPrev     : Extended = 0 //BRUNO AZEVEDO
                                       ): Integer;

var
   sSQL       : String;
   sResultado : String;
begin
   sSQL :=
   'SELECT '                                                                           + #13 +
   '  ' + IntToStr(iIdBeneficiario)              + ' AS IDBENEF, '                     + #13 +
   '  ' + IntToStr(iNumParcela)                  + ' AS NUMPARCELAS, '                 + #13 +
   '  ' + IntToStr(iTipoContrEmptmo)             + ' AS IDTIPOCONTREMPTMO, '           + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataInsc)) + ' AS DATAINSC, '         + #13 +

   '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, '                                    + #13 +
   '  PPP.IDSITPLANOPREV, PPP.INSCRICAONUMERO, NVL(PPP.IDPLANOPREV,BEN.IDPLANOPREV) AS IDPLANOPREV, ' + #13 +
   '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, '                                          + #13 +
   '  PPP.SALPARTICIPACAO, PPP.SALMANTIDO, PPP.SALVINCULADO, '                         + #13 +
   '  PPP.FLGDEVEEMPRESTIMO, PPP.FLGDEVEASSISTENC, PPP.FLGDEVEPREVIDENC, '             + #13 +
   '  PPP.VALORINFINSS, PPP.DTINICIOINSC, PPP.SALPARTIC13, '                           + #13 +

   '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.IDDEPENDENCIA, '         + #13 +
   '  BEN.IDRESPONSAVEL, BEN.CODTIPORECEBEDOR, BEN.DATAFIMRECEB, '                     + #13 +

   // André Pontes - 24/04/2006 - pendência 21945: foi só o "NVL"
   '  NVL(BEN.DATANASC, PFI.DATANASC) AS DATANASC , '                                  + #13 +
   // FIM André Pontes - 24/04/2006 - pendência 21945

   '  BEN.NOMERESPONSAVEL, '                                                           + #13 +
   //BRUNO AZEVEDO SOL 141615 KINTANA 987740
   '  BEN.FONTEPAGADORA, '                                                             + #13 +
   '  PFI.FLGBLOQUEIO, '                                                               + #13 +

   //Pendência 22836 - 03/10/2006 - Alberto
   '  0' + IntToStr(Ord(bExcepcional)) + ' AS FLGEXCEPCIONAL, '                        + #13 +
   //Fim Pendência 22836

   //Pendência 22248 - 09/08/2006 - Alberto
   '  15 AS IDMODULO, '                                                                + #13;
   //Fim Pendência 22248

   if iIdTitular <> iIdBeneficiario then
   begin
      // Beneficiário diferente do Titular
      sSQL := sSQL + QuotedStr('B') + ' AS FLGTIPOBEN '                                + #13;
   end
   else
   begin
      // Beneficiário é o próprio Titular
      sSQL := sSQL + QuotedStr('T') + ' AS FLGTIPOBEN '                                + #13;
   end;

   sSQL := sSQL +
   'FROM '                                                                             + #13 +
   '  PESSOAFISICA PFI '                                                              + #13 +
//   '  PARTPREVPLAN PPP, '                                                              + #13 +
   '  LEFT JOIN( '                                                                     + #13 +
   '  SELECT '                                                                         + #13 +
   '     BFC.IDTITULAR, BFC.IDPESSOA, BFC.IDBENEFICIO, '                               + #13 +
   '     BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.IDDEPENDENCIA, '                       + #13 +
   '     BTP.IDRESPONNAOREC  AS IDRESPONSAVEL, BTP.CODTIPORECEBEDOR, '                 + #13 +
   '     BTP.DATAFIMRECEB, PFI.DATANASC, BFC.IDPLANOPREV, '                             + #13 +
   '     PES.NOME AS NOMERESPONSAVEL, BFC.FONTEPAGADORA '                              + #13 +  //BRUNO AZEVEDO SOL 141615 KINTANA 987740
   '  FROM '                                                                           + #13 +
   '     BENEFBFCIARIO BFC, BFCIARIOTITPLAN BTP, PESSOAFISICA PFI, PESSOA PES '        + #13 +
   '  WHERE '                                                                          + #13 +
   '         IDSITBENEFICIO   IN (1, 2, 7) '                                           + #13 +
   '     AND BFC.IDTITULAR    = ' + IntToStr(iIdTitular)                               + #13 +
   '     AND BFC.IDPESSOA     = ' + IntToStr(iIdBeneficiario)                        + #13 + //Fanuel Junior SOL 160419 Kintana 1346233  //SOL 159760 Kintana 1321872 comentado
   //'     AND BFC.IDPESSOA     = ' + IntToStr(iIdTitular)                               + #13 + // SOL 159760 Kintana 1321872 incluido
   '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                        + #13 +
   '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                      + #13 +
   '     AND BFC.IDPESSOA     = PFI.IDPESSOA '                                         + #13 +
   '     AND BTP.IDRESPONNAOREC = PES.IDPESSOA(+) '                                    + #13 +
   '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV '                                      + #13;

   //BRUNO AZEVEDO SOL 141615 KINTANA 987740
   //if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   //'     AND BFC.FONTEPAGADORA = 1 '                                                   + #13;

   // Beneficiário diferente do Titular
   if iIdTitular <> iIdBeneficiario then sSQL := sSQL +
   '     AND ( DATAFINAL IS NULL    OR  '+
   '           DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate)) + ',' + QuotedStr('DD/MM/YYYY') + ' )) ';


   sSQL := sSQL +
   '  ) BEN ON BEN.IDTITULAR = PFI.IDPESSOA        '                          + #13 +
   '        LEFT JOIN PARTPREVPLAN PPP ON  PPP.IDPESSOA = PFI.IDPESSOA '      + #13 +
   '                 AND ppp.idplanoprev = ' + FloatToStr(iIdPlanoPrev)       + #13 +
   ' WHERE '                                                                  + #13 +
   '      ( PFI.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '              + #13 +
   //'  AND ( PPP.IDPESSOA      = PFI.IDPESSOA ) '                             + #13 +
   //'  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                         + #13 +

   //BRUNO AZEVEDO SOL 141615 KINTANA 987740
   //'  AND PPP.FLGDESATIVADO   = 0 '                                          + #13;
   //' AND  ppp.idplanoprev = ' + FloatToStr(iIdPlanoPrev)                     + #13 +
   ' ORDER BY FONTEPAGADORA ' + #13;
   //BRUNO AZEVEDO SOL 141615 KINTANA 987740

   //BRUNO AZEVEDO SOL 149542 KINTANA 1074985
   if UtilizaRegraValor(IDRegra, sSQL, 'e Prazo Maximo do Tipo de Contrato', sResultado, bMostraMsg, False, True, True) then
   begin
      if (sResultado <> '') and (sResultado <> 'NULO') then
      begin
         (* função da unit UFuncoesEmptmo que troca ponto por vírgula *)
         Result := StrToInt(sResultado)
      end
      else
      begin
         Result := 0;
      end;
   end
   else
   begin
     Result := 0;
   end;
end;



function TCalcEmptmo.ValidaEnvioSuspensao(const iIdRegra       : Int64;
                                          const sSQL           : String ) : Boolean;
var
    sResultado : String;
begin
   UtilizaRegraBool(iIdRegra, sSQL, 'e Valida Envio de Suspensão', sResultado, False, True);

   if UpperCase(sResultado) = 'TRUE' then
   begin
      Result := True
   end
   else
   begin
      Result := False;
   end;
end;



function  TCalcEmptmo.PegaSeguroAnt(const IDContratoEmptmo: Extended): Currency;
var
   IDItemSeguro : Integer;
begin
   IDItemSeguro := dtmEmptmo.qryParamEmptmoIDITEMSEGCONC.AsInteger;

   with dtmCalcEmptmo.qrySeguroAnt do
   begin
      LimpaParametros(dtmCalcEmptmo.qrySeguroAnt);
      ParamByName('PIDITEMEMPTMO').AsInteger     := IDItemSeguro;
      ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContratoEmptmo;
      Open;

      Result := dtmCalcEmptmo.qrySeguroAntHMEVLRPREVISTO.AsCurrency;

      Close;
   end;
end;



function  TCalcEmptmo.PegaSeguroComplAnt(const IDContratoEmptmo: Extended): Currency;
var
   IDItemSeguro : Integer;
begin
   IDItemSeguro := dtmEmptmo.qryParamEmptmoIDITEMSEGCOMPL.AsInteger;

   with dtmCalcEmptmo.qrySeguroAnt do
   begin
      LimpaParametros(dtmCalcEmptmo.qrySeguroAnt);
      ParamByName('PIDITEMEMPTMO').AsInteger     := IDItemSeguro;
      ParamByName('PIDCONTRATOEMPTMO').AsFloat   := IDContratoEmptmo;
      Open;

      Result := dtmCalcEmptmo.qrySeguroAntHMEVLRPREVISTO.AsCurrency;

      Close;
   end;
end;



procedure TCalcEmptmo.AcertaSituacaoContratual(const IDContratoEmptmo: Extended;
                                               const iOrigem         : Integer = -1;
                                               const bGravaDataCanc  : boolean = false // SOL 109599
                                              );
var
   bExisteSaldo   : Boolean;
   bExisteAberto  : Boolean;
   bExisteQuitacao: Boolean;
   bExisteQuitacaoAberto: Boolean; //SOL122788 - Ádler Souza
   sSituacao      : String;
   sNovaSituacao  : String;
   dDataAcertoSit : TDateTime;
   rLogTotalPrev  : TLogTotalPrev;
   sSQL           : String;
   dDataMinVencto : TDateTime;
   var PR_ATUALIZA_SITUACAO: TStoredProc; //William Moreira da Silva - SOL 260658 PPM 1039277
begin
   // ----------------------------------------------------------------------------------------------
   //    Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------

   //William Moreira da Silva - SOL 260658 PPM 1039277
   // ----------------------------------------------------------------------------------------------
   //bExisteQuitacao   := CalcEmptmo.ExisteQuitacao(IDContratoEmptmo);
   //bExisteSaldo      := CalcEmptmo.ExisteSaldoDevedor(IDContratoEmptmo);
   //dDataAcertoSit    := CalcEmptmo.UltimaDataAtualizacao(IDContratoEmptmo);
   //Pendência 27232 - 16/04/2008
   //bExisteAberto     := CalcEmptmo.ExistemItensEmAberto(IDContratoEmptmo) <> 0;
   //BRUNO AZEVEDO SOL 175562 KINTANA 1637191
   //dDataMinVencto    := CalcEmptmo.MinDataVencto(IDContratoEmptmo);
   //bExisteQuitacaoAberto := ExisteQuitacaoAberto(IDContratoEmptmo); //SOL122788 - Ádler Souza
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   {if bExisteSaldo then
   begin
      if bExisteQuitacao then
      begin
         // se há saldo e existe registro de quitação,
         // o Contrato está em EM QUITAÇÃO (K)
         sNovaSituacao := 'K';
      end
      else  // if bExisteQuitacao
      begin
         // se há saldo e não existe registro de quitação,
         // o Contrato está (A)TIVO
         sNovaSituacao := 'A';
      end;
   end
   else  // if bExisteSaldo
   begin
      // -------------------------------------------------------------------------------------------
      if bExisteQuitacaoAberto then //SOL122788 - Ádler Souza
        sNovaSituacao := 'K'
      else //Fim - SOL122788 - Ádler Souza
      if not(bExisteAberto) then
      begin
         // se não há saldo e não há itens em aberto
         // o Contrato está (Q)UITADO, independente de haver registro de quitação
         sNovaSituacao := 'Q';
      //BRUNO AZEVEDO SOL 175562 KINTANA 1637191
      end else if (dDataMinVencto < Date()) then begin
        sNovaSituacao := 'E';
      end
      else
      begin
      if bExisteQuitacao then
      begin
         // se não há saldo, há itens em aberto e existe registro de quitação,
         // o Contrato está em EM QUITAÇÃO (K)
         sNovaSituacao := 'K';
      end
      else  // if bExisteQuitacao
      begin
            // se não há saldo, há itens em aberto e não existe registro de quitação,
            // o Contrato está em (E)NCERRADO
            sNovaSituacao := 'E';
         end;
      end;  // if bExisteQuitacao
      // -------------------------------------------------------------------------------------------
   end;  // if bExisteSaldo
   // ----------------------------------------------------------------------------------------------}

   //William Moreira da Silva - SOL 261005 PPM 1054900
   try
     begin
   PR_ATUALIZA_SITUACAO                := TStoredProc.Create(Application);
   PR_ATUALIZA_SITUACAO.DataBaseName   := 'BaseDados';
   PR_ATUALIZA_SITUACAO.StoredProcName := 'CM."PR_EMP_AJUSTA_SITUACAO_CONTR"';

   PR_ATUALIZA_SITUACAO.Params.CreateParam(ftFloat,   'pIdContratoEmptmo',  ptInput);
   PR_ATUALIZA_SITUACAO.Params.CreateParam(ftDate,   'pDataAtuDiaria', ptInput);
   PR_ATUALIZA_SITUACAO.Params.CreateParam(FtString,   'pNovaSit', ptOutput);
      
   PR_ATUALIZA_SITUACAO.ParamByName('pIdContratoEmptmo').AsFloat       := IDContratoEmptmo;
   PR_ATUALIZA_SITUACAO.ParamByName('pDataAtuDiaria').AsDateTime       := -1;

    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
         dtmBaseDados.dbBaseDados.StartTransaction;
    end;

        if not PR_ATUALIZA_SITUACAO.prepared then//William Moreira da Silva - SOL 261005 PPM 1054900
    PR_ATUALIZA_SITUACAO.Prepare;
               
    PR_ATUALIZA_SITUACAO.Close;

    PR_ATUALIZA_SITUACAO.ExecProc;

    sNovaSituacao :=  PR_ATUALIZA_SITUACAO.ParamByName('pNovaSit').AsString;

        PR_ATUALIZA_SITUACAO.close;
        dtmBaseDados.dbBaseDados.commit;//William Moreira da Silva - SOL 261005 PPM 1054900
       end;
   //William Moreira da Silva - SOL 261005 PPM 1054900
   finally
     freeandnil(PR_ATUALIZA_SITUACAO);
   end;
   //William Moreira da Silva - SOL 261005 PPM 1054900
   //William Moreira da Silva - SOL 260658 PPM 1039277

   // Xavier SOL 194179 Kintana 1851337
   If  ( iOrigem = 11 ) then
   begin
      dtmCalcEmptmo.qrySituacaoContrato.Close;
      dtmCalcEmptmo.qrySituacaoContrato.ParamByName('PIDCONTRATOEMPTMO').asstring := FloatToStr(IDContratoEmptmo);
      dtmCalcEmptmo.qrySituacaoContrato.Open;

      if (dtmCalcEmptmo.qrySituacaoContrato.FieldByName('FLGSITUACAO').asstring = 'E')
         and bExisteSaldo then //Marcio Sanches Spinosa SOL 201723 Kintana 1955492
         sNovaSituacao := '';
   end;
   // Xavier SOL 194179 Kintana 1851337

   if sNovaSituacao <> '' then
   begin
     {with dtmCalcEmptmo.qryUpdateSituacao do
      begin
         LimpaParametros(dtmCalcEmptmo.qryUpdateSituacao);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
         ParamByName('PFLGSITUACAO').AsString      := sNovaSituacao;
         ParamByName('PDATASITUACAO').AsDateTime   := SysDate;

         if sNovaSituacao[1] in ['C', 'E', 'K', 'Q'] then begin
           ParamByName('PDATACANC').AsDateTime := dDataAcertoSit;
         end else if sNovaSituacao[1] = 'A' then begin
           ParamByName('PDATACANC').AsDateTime :=0;  //Renato Visoni SOL 100095 KINTANA 442582
         end;
         ExecSQL;
      end;}
            // SOL 109599 Daniel Begnami
      dtmCalcEmptmo.qryUpdateSituacao.close;
      dtmCalcEmptmo.qryUpdateSituacao.sql.clear;

      if bGravaDataCanc then
      begin
        sSQL := ' UPDATE CONTRATOEMPTMO CON '+
                ' SET '+
                ' CON.FLGSITUACAO   ='+quotedstr(sNovaSituacao)+ ' , '+
                ' CON.DATASITUACAO  = SysDate '+
                ' WHERE CON.IDCONTRATOEMPTMO = '+FloatToStr(IDContratoEmptmo);
      end
      else
      begin
        sSQL := ' UPDATE CONTRATOEMPTMO CON '+
                ' SET '+
                ' CON.FLGSITUACAO   ='+quotedstr(sNovaSituacao)+ ' , '+
                ' CON.DATASITUACAO  = SysDate, ';

        if sNovaSituacao[1] in ['C', 'E', 'K', 'Q'] then
          sSQL := sSQL + ' CON.DATACANC      ='+quotedstr(DateTimeToStr(dDataAcertoSit))
        else if sNovaSituacao[1] = 'A' then
          begin
            sSQL := sSQL + ' CON.DATACANC      = null,'+
                           ' IDCONTRQUITACAO   = NULL ';      // WO9439 Ferrari
          end;

        sSQL := sSQL + ' WHERE CON.IDCONTRATOEMPTMO = '+FloatToStr(IDContratoEmptmo);
      end;

      dtmCalcEmptmo.qryUpdateSituacao.SQL.Add(sSQL);
      dtmCalcEmptmo.qryUpdateSituacao.ExecSQL;
      // FIM SOL 109599 Daniel Begnami


      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := IDContratoEmptmo;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := iOrigem;
      rLogTotalPrev.Operacao   := 'Acerto da Situação Contratual para: ' + sNovaSituacao;
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------
   end;
   // ----------------------------------------------------------------------------------------------
   //    FIM Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------
end;



function TCalcEmptmo.ExisteParcelaAtrasadaEmAberto(const IDContrato  : Extended;
                                                   const dData       : TDateTime
                                                  ): Boolean;
begin
   Result := False;

   try
      with dtmCalcEmptmo.qryParcelaAtrasadaEmAberto do
      begin
         LimpaParametros(dtmCalcEmptmo.qryParcelaAtrasadaEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := dData;

         // André Pontes - 18/08/2004
         ParamByName('PFLGEXCEPCIONAL').AsInteger     := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger;
         ParamByName('PHMEANOCOBRANCA').AsInteger     := DiasUteis.ExtraiAno(dData);
         ParamByName('PHMEMESCOBRANCA').AsInteger     := DiasUteis.ExtraiMes(dData);
         // FIM André Pontes - 18/08/2004

         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      dtmCalcEmptmo.qryParcelaAtrasadaEmAberto.Close;
   end
end;



function TCalcEmptmo.BuscaDataMorte(const IDBenef: Extended): TDateTime;
begin
   Result := -1;

   with dtmCalcEmptmo.qryDataMorte do
   begin
      LimpaParametros(dtmCalcEmptmo.qryDataMorte);
      ParamByName('PIDPESSOA').AsFloat := IDBenef;
      Open;

      if not(isEmpty) and not(dtmCalcEmptmo.qryDataMorteDATAMORTE.isNULL) then Result := dtmCalcEmptmo.qryDataMorteDATAMORTE.AsDateTime;

      dtmCalcEmptmo.qryDataMorte.Close;
   end;
end;



function TCalcEmptmo.TotalizaProvPerda(const IDContratoEmptmo: Extended): Currency;
begin
   with dtmCalcEmptmo.qryTotalPrevPerda do
   begin
      LimpaParametros(dtmCalcEmptmo.qryTotalPrevPerda);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
      ParamByName('PIDITEMEMPTMO').AsInteger    := dtmEmptmo.qryParamEmptmoIDITEMPROVPERDA.AsInteger;
      Open;

      Result := dtmCalcEmptmo.qryTotalPrevPerdaVLR_TOTAL.AsCurrency;

      Close;
   end;
end;



//Pendência 23436 - 29/09/2006 - Alberto
procedure TCalcEmptmo.OrdenaQueryRegra(sDescRegra: String);
//Fim Pendência 23436
begin
   try
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         dtmEmptmo.cdsRegra.IndexFieldNames := 'ORDENACAO;DATAORDENACAO;SEQCALCULO;DATAPREVISTA';
      end
      else
      begin
         dtmEmptmo.cdsRegra.IndexFieldNames := 'SEQCALCULO;DATAPREVISTA';
      end;

      dtmEmptmo.qryRegra.Close;
      dtmEmptmo.qryRegra.SQL.Clear;
      dtmEmptmo.qryRegra.SQL.Text := MontaSQLRegraQuitacao;
      dtmEmptmo.qryRegra.Open;

      dtmEmptmo.cdsRegra.First;
      //Pendência 23436 - 29/09/2006 - Alberto
      //SOL 114575 Jéssica
//    dtmEmptmo.cdsRegra.SaveToFile(Sistema.TempDir + 'Regra ' + sDescRegra + '.cds');
      dtmEmptmo.cdsRegra.SaveToFile(ftempregra + '\' + 'Regra ' + sDescRegra + '.cds');

      dtmEmptmo.cdsRegra.First;
      //Fim Pendência 23436

      while not(dtmEmptmo.cdsRegra.EOF) do
      begin
         dtmEmptmo.qryRegra.Append;

         dtmEmptmo.qryRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat        := dtmEmptmo.cdsRegra.FieldByName('IDCONTRATOEMPTMO').AsFloat;
         dtmEmptmo.qryRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger     := dtmEmptmo.cdsRegra.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('IDTIPOEMPTMO').AsInteger          := dtmEmptmo.cdsRegra.FieldByName('IDTIPOEMPTMO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('IDPLANOPREV').AsInteger           := dtmEmptmo.cdsRegra.FieldByName('IDPLANOPREV').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('IDPESSJUR').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('IDPESSJUR').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('IDSITPART').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('IDSITPART').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('IDPESSOA').AsInteger              := dtmEmptmo.cdsRegra.FieldByName('IDPESSOA').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('FLGFINANCIAMENTO').AsInteger      := dtmEmptmo.cdsRegra.FieldByName('FLGFINANCIAMENTO').AsInteger;

         //Pendência 22836 - 03/10/2006 - Alberto
         dtmEmptmo.qryRegra.FieldByName('FLGEXCEPCIONAL').AsInteger        := dtmEmptmo.cdsRegra.FieldByName('FLGEXCEPCIONAL').AsInteger;
         //Fim Pendência 22836

         dtmEmptmo.qryRegra.FieldByName('NOMEINDICE').AsString             := dtmEmptmo.cdsRegra.FieldByName('NOMEINDICE').AsString;

         dtmEmptmo.qryRegra.FieldByName('MARGEM').AsCurrency               := dtmEmptmo.cdsRegra.FieldByName('MARGEM').AsCurrency;
         dtmEmptmo.qryRegra.FieldByName('RESERVA').AsCurrency              := dtmEmptmo.cdsRegra.FieldByName('RESERVA').AsCurrency;

         dtmEmptmo.qryRegra.FieldByName('DATAINSC').AsDateTime             := dtmEmptmo.cdsRegra.FieldByName('DATAINSC').AsDateTime;
         dtmEmptmo.qryRegra.FieldByName('DATACREDITO').AsDateTime          := dtmEmptmo.cdsRegra.FieldByName('DATACREDITO').AsDateTime;
         dtmEmptmo.qryRegra.FieldByName('DATAASSIN').AsDateTime            := dtmEmptmo.cdsRegra.FieldByName('DATAASSIN').AsDateTime;
         dtmEmptmo.qryRegra.FieldByName('DATAPRIMPARC').AsDateTime         := dtmEmptmo.cdsRegra.FieldByName('DATAPRIMPARC').AsDateTime;

         dtmEmptmo.qryRegra.FieldByName('IDPAIS').AsInteger                := dtmEmptmo.cdsRegra.FieldByName('IDPAIS').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('CODESTADO').AsString              := dtmEmptmo.cdsRegra.FieldByName('CODESTADO').AsString;
         dtmEmptmo.qryRegra.FieldByName('IDCIDADES').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('IDCIDADES').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('ORDENACAO').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('ORDENACAO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('DATAORDENACAO').AsDateTime        := dtmEmptmo.cdsRegra.FieldByName('DATAORDENACAO').AsDateTime;

         dtmEmptmo.qryRegra.FieldByName('IDITEMEMPTMO').AsInteger          := dtmEmptmo.cdsRegra.FieldByName('IDITEMEMPTMO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('EVENTOITEM').AsInteger            := dtmEmptmo.cdsRegra.FieldByName('EVENTOITEM').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('ORIGEMITEM').AsInteger            := dtmEmptmo.cdsRegra.FieldByName('ORIGEMITEM').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('EVENTO').AsInteger                := dtmEmptmo.cdsRegra.FieldByName('EVENTO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('ORIGEM').AsInteger                := dtmEmptmo.cdsRegra.FieldByName('ORIGEM').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('SEQCALCULO').AsInteger            := dtmEmptmo.cdsRegra.FieldByName('SEQCALCULO').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('PARCATUAL').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('PARCATUAL').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('NUMPARCELAS').AsInteger           := dtmEmptmo.cdsRegra.FieldByName('NUMPARCELAS').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('CENTRALIZA').AsInteger            := dtmEmptmo.cdsRegra.FieldByName('CENTRALIZA').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('DESTACADO').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('DESTACADO').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('FLGENVIO').AsInteger              := dtmEmptmo.cdsRegra.FieldByName('FLGENVIO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('FLGBAIXADO').AsInteger            := dtmEmptmo.cdsRegra.FieldByName('FLGBAIXADO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('FLGESTORNADO').AsInteger          := dtmEmptmo.cdsRegra.FieldByName('FLGESTORNADO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('FLGABONADO').AsInteger            := dtmEmptmo.cdsRegra.FieldByName('FLGABONADO').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('FLGFORMACOB').AsString            := dtmEmptmo.cdsRegra.FieldByName('FLGFORMACOB').AsString;

         dtmEmptmo.qryRegra.FieldByName('DATAEVENTO').AsDateTime           := dtmEmptmo.cdsRegra.FieldByName('DATAEVENTO').AsDateTime;
         dtmEmptmo.qryRegra.FieldByName('DATAMORTE').AsDateTime            := dtmEmptmo.cdsRegra.FieldByName('DATAMORTE').AsDateTime;
         dtmEmptmo.qryRegra.FieldByName('DATASOLNOVO').AsDateTime          := dtmEmptmo.cdsRegra.FieldByName('DATASOLNOVO').AsDateTime;

         dtmEmptmo.qryRegra.FieldByName('DATAPREVISTA').AsDateTime         := dtmEmptmo.cdsRegra.FieldByName('DATAPREVISTA').AsDateTime;

         //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424
         if (dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime > 0) then begin
            dtmEmptmo.qryRegra.FieldByName('DATAEFETIVA').AsDateTime          := dtmEmptmo.cdsRegra.FieldByName('DATAEFETIVA').AsDateTime;
         end;

         if (dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime > 0) then begin
            dtmEmptmo.qryRegra.FieldByName('DATAATUALIZA').AsDateTime         := dtmEmptmo.cdsRegra.FieldByName('DATAATUALIZA').AsDateTime;
         end;
         //BRUNO AZEVEDO 25/02/2010 SOL 131199 KINTANA 744424

         dtmEmptmo.qryRegra.FieldByName('DATAVENCTO').AsDateTime           := dtmEmptmo.cdsRegra.FieldByName('DATAVENCTO').AsDateTime;

         dtmEmptmo.qryRegra.FieldByName('COMPETENCIA').AsString            := dtmEmptmo.cdsRegra.FieldByName('COMPETENCIA').AsString;
         dtmEmptmo.qryRegra.FieldByName('COBRANCA').AsString               := dtmEmptmo.cdsRegra.FieldByName('COBRANCA').AsString;

         dtmEmptmo.qryRegra.FieldByName('VLRPREVISTO').AsCurrency          := dtmEmptmo.cdsRegra.FieldByName('VLRPREVISTO').AsCurrency;
         dtmEmptmo.qryRegra.FieldByName('VLREFETIVO').AsCurrency           := dtmEmptmo.cdsRegra.FieldByName('VLREFETIVO').AsCurrency;
         dtmEmptmo.qryRegra.FieldByName('SALDODEV').AsCurrency             := dtmEmptmo.cdsRegra.FieldByName('SALDODEV').AsCurrency;
         dtmEmptmo.qryRegra.FieldByName('SALDODEVPOS').AsCurrency          := dtmEmptmo.cdsRegra.FieldByName('SALDODEVPOS').AsCurrency;
         dtmEmptmo.qryRegra.FieldByName('TXJUROS').AsCurrency              := dtmEmptmo.cdsRegra.FieldByName('TXJUROS').AsCurrency;

         dtmEmptmo.qryRegra.FieldByName('VLRPROVPERDA').AsCurrency         := dtmEmptmo.cdsRegra.FieldByName('VLRPROVPERDA').AsCurrency;

         dtmEmptmo.qryRegra.FieldByName('QUANTITEMABERTO').AsInteger       := dtmEmptmo.cdsRegra.FieldByName('QUANTITEMABERTO').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('NUMPARCPAGAS').AsInteger          := dtmEmptmo.cdsRegra.FieldByName('NUMPARCPAGAS').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('PRAZOANT').AsInteger              := dtmEmptmo.cdsRegra.FieldByName('PRAZOANT').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('PRAZOREST').AsInteger             := dtmEmptmo.cdsRegra.FieldByName('PRAZOREST').AsInteger;
         dtmEmptmo.qryRegra.FieldByName('FLGSUSPENSAO').AsInteger          := dtmEmptmo.cdsRegra.FieldByName('FLGSUSPENSAO').AsInteger;

         dtmEmptmo.qryRegra.FieldByName('ULTDATAQUIT').AsString          := dtmEmptmo.cdsRegra.FieldByName('ULTDATAQUIT').AsString;
         dtmEmptmo.qryRegra.FieldByName('OPERACAO').AsString             := dtmEmptmo.cdsRegra.FieldByName('OPERACAO').AsString;
         dtmEmptmo.qryRegra.FieldByName('SITENVIO').AsString             := dtmEmptmo.cdsRegra.FieldByName('SITENVIO').AsString;
         //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - INÍCIO AJUSTE 10/12/2013
         dtmEmptmo.qryRegra.FieldByName('FLGPERDAEFETIVA').AsString             := dtmEmptmo.cdsRegra.FieldByName('FLGPERDAEFETIVA').AsString;
         //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - FIM AJUSTE 10/12/2013
         dtmEmptmo.qryRegra.Post;

         dtmEmptmo.cdsRegra.Next;
      end;

   finally
      dtmEmptmo.cdsRegra.IndexFieldNames := '';
   end;
end;



function TCalcEmptmo.MontaSQLRegraQuitacao: String;
begin
   Result :=
   'SELECT '                                                         + #13 +
   '  30000000365214   AS IDCONTRATOEMPTMO, '                        + #13 +
   '  999999           AS IDTIPOCONTREMPTMO, '                       + #13 +
   '  999999           AS IDTIPOEMPTMO, '                            + #13 +
   '  999999           AS IDPLANOPREV, '                             + #13 +
   '  999999           AS IDPESSJUR, '                               + #13 +
   '  999999           AS IDSITPART, '                               + #13 +
   '  999999           AS IDPESSOA,  '                               + #13 +

   '  0                AS FLGFINANCIAMENTO, '                        + #13 +

   //Pendência 22836 - 03/10/2006 - Alberto
   '  0                AS FLGEXCEPCIONAL, '                          + #13 +
   //Fim Pendência 22836


   '  ''INPCIGPMIPCIPC''                        AS NOMEINDICE, '     + #13 +

   '  10000.10          AS MARGEM, '                                 + #13 +
   '  10000.10          AS RESERVA, '                                + #13 +

   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAINSC, '       + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATACREDITO, '    + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAASSIN, '      + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAPRIMPARC, '   + #13 +

   '  999999            AS IDPAIS, '                                 + #13 +
   '  ''RGS''           AS CODESTADO, '                              + #13 +
   '  999999            AS IDCIDADES, '                              + #13 +

   '  -3                AS ORDENACAO, '                              + #13 +

   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAORDENACAO, '  + #13 +

   '  -3                AS IDITEMEMPTMO, '                           + #13 +
   '  -3                AS EVENTOITEM, '                             + #13 +
   '  -3                AS ORIGEMITEM, '                             + #13 +
   '  999999            AS EVENTO, '                                 + #13 +
   '  999999            AS ORIGEM, '                                 + #13 +
   '  -3                AS SEQCALCULO, '                             + #13 +

   '  999               AS PARCATUAL, '                              + #13 +
   '  999               AS NUMPARCELAS, '                            + #13 +

   '  -3                AS CENTRALIZA, '                             + #13 +
   '  -3                AS DESTACADO, '                              + #13 +

   '  0                 AS FLGENVIO, '                               + #13 +
   '  0                 AS FLGBAIXADO, '                             + #13 +
   '  0                 AS FLGESTORNADO, '                           + #13 +
   '  0                 AS FLGABONADO, '                             + #13 +
   '  ''0''             AS FLGFORMACOB, '                            + #13 +

   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAEVENTO, '     + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAMORTE, '      + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATASOLNOVO, '    + #13 +

   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAPREVISTA, '   + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAEFETIVA, '    + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAATUALIZA, '   + #13 +
   '  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS DATAVENCTO, '     + #13 +

   '  ''200510''        AS COMPETENCIA, '                            + #13 +
   '  ''200510''        AS COBRANCA, '                               + #13 +

   '  10000.10          AS VLRPREVISTO, '                            + #13 +
   '  10000.10          AS VLREFETIVO, '                             + #13 +
   '  10000.10          AS SALDODEV, '                               + #13 +
   '  10000.10          AS SALDODEVPOS, '                            + #13 +
   '  10000.10          AS TXJUROS, '                                + #13 +

   '  10000.10          AS VLRPROVPERDA, '                           + #13 +

   '  999               AS QUANTITEMABERTO, '                        + #13 +
   '  999               AS NUMPARCPAGAS, '                           + #13 +
   '  999               AS PRAZOANT, '                               + #13 +
   '  999               AS PRAZOREST, '                              + #13 +
   //Pendência 22717 - 07/03/2007 - Alberto - Padrão 15
   '  0                 AS FLGTIPODIVERG, '                          + #13 +
   //Fim Pendência 22717
   '  0                 AS FLGSUSPENSAO '                            + #13 +

   ',  TO_DATE(''01/01/1980'', ''DD/MM/YYYY'')   AS ULTDATAQUIT, '  + #13 + //SOL 131409
   '  -1                 AS OPERACAO, '                               + #13 +   //Fanuel Junior SOL153161
   '  -1                 AS SITENVIO '                                + #13 +   //Fanuel Junior SOL153161
   '  ,0                  AS FLGPERDAEFETIVA '                         + #13 +   //BRUNO AZEVEDO - VOTO DE EMPRESTIMO


   'FROM '                                                           + #13 +
   '  DUAL '                                                         + #13 +

   'WHERE 1 = 2 ';
end;

//Pendência 25624 - 18/06/2007 - Alberto
function TCalcEmptmo.ExisteHistMovXDocum(const CODDocumento : Extended;
                                         const IDHistMov    : Extended
                                         ): Boolean;
begin
   try
      dtmCalcEmptmo.qryHistMovXDocum.Close;
      LimpaParametros(dtmCalcEmptmo.qryHistMovXDocum);
      dtmCalcEmptmo.qryHistMovXDocum.ParamByName('PHMDCODDOCUMENTO').AsFloat := CODDocumento;
      dtmCalcEmptmo.qryHistMovXDocum.ParamByName('PIDHISTMOVEMPTMO').AsFloat := IDHistMov;
      dtmCalcEmptmo.qryHistMovXDocum.Open;

      Result := dtmCalcEmptmo.qryHistMovXDocumQUANT.AsInteger > 0;

   finally
      dtmCalcEmptmo.qryHistMovXDocum.Close;
   end;
end;
//Fim Pendência 25624

// SOL:108099 Daniel Begnami
function TCalcEmptmo.ValidaMesesSuspensao(const iIdRegraValidSusp  : Int64;
                                          const iIdPessoa          : Int64;
                                          const iIdBenef           : Int64;
                                          const dDataCredito       : TDate;
                                          const iIDTipoSusp        : Int64;
                                          const qryContratosANT    : TQuery;
                                          const iIDTipoContrEmptmo: Int64 = 0
                                         ): Integer;
var
  sSQL, sSQLIN, sParcelaSusp : String;
  qryAux : TQuery;
  xQryAux2: TwwQuery;
  bOk :Boolean;
  fContratoAnt: Extended;

begin
  try


    sSQL    := '';
    sSQLIN  := '';

        //BRUNO AZEVEDO SOL 138561 KINTANA 859566
    bOk := True;
    if ( iIDTipoContrEmptmo > 0 ) then begin
      try
        xQryAux2 := TwwQuery.Create(Application);
        xQryAux2.DatabaseName := 'BaseDados';

        fContratoAnt := 0;
        qryContratosANT.First;
        while not qryContratosANT.eof do begin
          if (iIDTipoContrEmptmo = qryContratosANT.FieldByName('idtipocontremptmo').AsInteger) then begin
            fContratoAnt := qryContratosANT.FieldByName('idcontratoemptmo').AsFloat;
            Break;
          end else begin
            qryContratosANT.Next;
          end;
        end;

        if (qryContratosANT.FieldByName('idcontratoemptmo').AsFloat > 0) and (fContratoAnt > 0) then begin
          repeat
            xQryAux2.Close;
            xQryAux2.Sql.Clear;
            xQryAux2.Sql.Add('SELECT COUNT(1) AS QTD FROM HISTSUSPCOBEP');
            xQryAux2.Sql.Add(' WHERE IDCONTRATOEMPTMO = ' + FloatToStr(fContratoAnt));
            xQryAux2.Sql.Add('   AND FLGSTATUS <> ''C''');
            xQryAux2.Sql.Add('   AND IDTIPOSUSPEMPTMO = ' + IntToStr(iIDTipoSusp));
            xQryAux2.Open;

            if (xQryAux2.FieldByName('QTD').AsInteger > 0) then begin
              bOk := False;
              Break;
            end else begin
              xQryAux2.Close;
              xQryAux2.Sql.Clear;
              xQryAux2.Sql.Add('SELECT CONTRATOEMPTMO.IDCONTRATOEMPTMO FROM CONTRATOEMPTMO');
              xQryAux2.Sql.Add(' WHERE Idcontrquitacao = ' + FloatToStr(fContratoAnt));
              xQryAux2.Open;

              if (xQryAux2.FieldByName('IDCONTRATOEMPTMO').AsFloat > 0) then begin
                bOk := False;
                fContratoAnt := xQryAux2.FieldByName('IDCONTRATOEMPTMO').AsFloat;
              end else begin
                bOk := True;
                Break;
              end;
            end;
          until (bOk)
        end;
      finally
        FreeAndNil(xQryAux2);
      end;
    end;
    
    qryContratosANT.First;
    //BRUNO AZEVEDO SOL 138561 KINTANA 859566



    if (qryContratosANT.recordcount > 0)
    and (qryContratosANT.Locate('FlgEscolha','1',[])) then //Renato Visoni SOL 122185 Kintana 596723
    begin // Ádler Souza - SOL 135615 Kintana 807538
      sSQL := 'SELECT c.idpessoa,               '+
              '       ts.idtiposuspemptmo,      '+
              '       c.idcontratoemptmo,       '+
              '       c.flgsituacao,            '+
              '       hs.hsciniciosusp,         '+
              '       hs.hscfinalsusp,          '+
              '       ts.tsemeses,              '+
              '       c.idbenef,                '+   // SOL 142592 Kintana 912881
              '       count(h.idhistmovemptmo) parcelassuspensasgeradas, ';
              if (bOk) then begin
                sSQL := sSQL + '       ts.tsemeses as CONTSEMESES                   ';
              end else begin
                sSQL := sSQL + '       nvl(c.tsemeses,0) as CONTSEMESES                   ';
              end;
              sSQL := sSQL + 'FROM contratoemptmo c            '+
              '     JOIN tipocontrxsusp tcs ON c.idtipocontremptmo = tcs.idtipocontremptmo      '+
              '     JOIN tiposuspemptmo ts ON tcs.idtiposuspemptmo = ts.idtiposuspemptmo        '+
              '     LEFT JOIN histsuspcobep hs ON hs.idcontratoemptmo = c.idcontratoemptmo      '+
              '     LEFT JOIN histmovemptmo h ON c.idcontratoemptmo = h.idcontratoemptmo AND    '+
              '                                  h.hmetipomov = 1 AND                           '+
              '                                  h.idtiposuspemptmo = tcs.idtiposuspemptmo AND  '+
              '                                  h.hmecentraliza = 1 AND                        '+
              '                                  (h.flgenvio IS NULL OR h.hmedataprevista < to_date('+quotedstr(DateToStr(dDataCredito))+',''DD/MM/YYYY'')) AND '+
              '                                  h.flgsuspensao = 1 AND                         '+
              '                                  h.hmerecpag = ''R'' AND                        '+
              '                                  nvl(h.flgestornado,0) = 0                      '+

              'WHERE tcs.idtiposuspemptmo = '+IntToStr(iIDTipoSusp)+   // Tipo da Suspesão
              '  AND c.flgsituacao IN (''A'',''S'') '+
              '  AND c.idpessoa ='+IntToStr(iIdPessoa)+ // ID do Titular
              '  AND c.idbenef  ='+IntToStr(iIdBenef);  // ID da Pessoa
              //BRUNO AZEVEDO SOL 138561 KINTANA 859566
              if ( iIDTipoContrEmptmo > 0 ) then begin
                sSQL := sSQL + '  AND c.idtipocontrEmptmo  ='+IntToStr(iIDTipoContrEmptmo);  // ID Tipo Contrato
              end;
              //BRUNO AZEVEDO SOL 138561 KINTANA 859566
              sSQL := sSQL + '  AND c.idcontratoemptmo IN (';
              //Fim - Ádler Souza - SOL 135615 Kintana 807538
      with qryContratosANT do
      begin
        First;
        while not eof do
        begin
        {   if qryContratosAnt.FieldByName('FLGESCOLHA').asInteger = 1 then begin  //Renato Visoni SOL 122185 Kintana 596723
             sSQL := sSQL + FloatToStr(qryContratosAnt.FieldByName('IDCONTRATOEMPTMO').AsFloat);
           end;

           qryContratosANT.next;
           if ((not qryContratosAnt.eof) and (qryContratosAnt.FieldByName('FLGESCOLHA').asInteger = 1)) then
             sSQL := sSQL + ',';
        }
        // Ádler Souza SOL 134013 Kintana 785440
           if qryContratosAnt.FieldByName('FLGESCOLHA').asInteger = 1 then //Renato Visoni SOL 122185 Kintana 596723
           begin
             sSQL := sSQL + FloatToStr(qryContratosAnt.FieldByName('IDCONTRATOEMPTMO').AsFloat);

             qryContratosANT.next;
             if ((not qryContratosAnt.eof) and (qryContratosAnt.FieldByName('FLGESCOLHA').asInteger = 1)) then
               sSQL := sSQL + ',';
           end
           else
             qryContratosANT.next;
        // Ádler Souza SOL 134013 Kintana 785440 - Fim
        end;
        sSQL := sSQL + ') ';
      end;

      sSQL := sSQL + ' GROUP BY c.idpessoa, ts.idtiposuspemptmo, c.idcontratoemptmo, '+
                     '          c.flgsituacao, hs.flgstatus, hs.hsciniciosusp, hs.hscfinalsusp, ts.tsemeses, c.tsemeses,c.idbenef';

      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BaseDados';
      qryAux.SQL.Add(sSQL);
      qryAux.Open;
    end;

    // Monta Query de Entrada para Regra
    if ((sSQL <> '') and (qryAux.RecordCount > 0)) then
    begin
      with qryAux do
      begin
        First;
        while not eof do
        begin
           sSQLIN := sSQLIN +
             'SELECT '                                                                                                                        + #13 +
             ' ' + IntToStr(qryAux.FieldByName('IDBENEF').AsInteger)                                       + ' AS IDPESSOA,                 ' + #13 + // SOL 141670 - KTN 897588 - Ádler Souza
             ' ' + IntToStr(qryAux.FieldByName('IDPESSOA').AsInteger)                                      + ' AS IDTITULAR,                ' + #13 + // SOL 141670 - KTN 897588 - Ádler Souza

             ' ' + IntToStr(qryAux.FieldByName('IDTIPOSUSPEMPTMO').AsInteger)                              + ' AS IDTIPOSUSPEMPTMO,         ' + #13 ;
             //if (Not(bOk)) then begin
             //  sSQLIN := sSQLIN + ' 0 AS IDCONTRATOEMPTMO,         ' + #13 +
             //                     ' NULL AS FLGSITUACAO,           ' + #13 +
             //                     ' NULL AS HSCINICIOSUSP,         ' + #13 +
             //                     ' NULL AS HSCFINALSUSP,          ' + #13 ;
             //end else begin
               sSQLIN := sSQLIN + ' ' + FloatToStr(qryAux.FieldByName('IDCONTRATOEMPTMO').asFloat)                              + ' AS IDCONTRATOEMPTMO,         ' + #13 +  //Renato Visoni SOL 122185 Kintana 596723
                                  ' ' + quotedstr(qryAux.FieldByName('FLGSITUACAO').AsString)                                   + ' AS FLGSITUACAO,              ' + #13 +
                                  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryAux.FieldByName('HSCINICIOSUSP').AsDateTime)) + ' AS HSCINICIOSUSP,            ' + #13 +
                                  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryAux.FieldByName('HSCFINALSUSP').AsDateTime))  + ' AS HSCFINALSUSP,             ' + #13 ;
             //end;

             sSQLIN := sSQLIN + ' ' + IntToStr(qryAux.FieldByName('TSEMESES').AsInteger)                                      + ' AS TSEMESES,                 ' + #13 ;

             //if (Not(bOk)) then begin
             //  sSQLIN := sSQLIN + ' 0 AS PARCELASSUSPENSASGERADAS, ' + #13;
             //end else begin
               sSQLIN := sSQLIN + ' ' + IntToStr(qryAux.FieldByName('PARCELASSUSPENSASGERADAS').AsInteger)                      + ' AS PARCELASSUSPENSASGERADAS, ' + #13;
             //end;

             //if (Not(bOk)) then begin
             //  sSQLIN := sSQLIN + ' 0 AS CONTSEMESES ' + #13;
             //end else begin
               sSQLIN := sSQLIN + ' ' + IntToStr(qryAux.FieldByName('CONTSEMESES').AsInteger)             + ' AS CONTSEMESES               ' + #13;  //SOL:122239 - Daniel Begnami
             //end;
             sSQLIN := sSQLIN + 'FROM   ' + #13 +
                                '  DUAL ';

           qryAux.next;
           if not qryAux.eof then
             sSQLIN := sSQLIN + ' UNION ';
        end;
      end;
    end
    else
    begin
      sSQLIN :=
        'SELECT '                           + #13 +
        ' -1 AS IDTITULAR, '                + #13 +
        ' -1 AS IDPESSOA, '                 + #13 +
        ' -1 AS IDTIPOSUSPEMPTMO, '         + #13 +
        ' -1 AS IDCONTRATOEMPTMO, '         + #13 +
        ' 0 AS FLGSITUACAO, '               + #13 +
        ' 0 AS HSCINICIOSUSP, '             + #13 +
        ' 0 AS HSCFINALSUSP, '              + #13 +
        ' -1 AS TSEMESES, '                 + #13 +
        ' -1 AS PARCELASSUSPENSASGERADAS, ' + #13 +
        ' -1 AS CONTSEMESES '               + #13 + // SOL:122239 - Daniel Begnami
        'FROM '                             + #13 +
        '  DUAL ';
    end;
    //SOL121623 - KINTANA 588162 - Daniel Begnami   - Alterado FALSE para TRUE
    if UtilizaRegraValor(iIdRegraValidSusp, sSQLIN, 'Suspensão Novo Credinâmico', sParcelaSusp, True) then
    //FIM
    begin
       if (sParcelaSusp <> '') and (sParcelaSusp <> 'NULO') then
       begin
          Result := StrToInt(sParcelaSusp)
       end
       else
       begin
          Result := 0;
       end;
    end
    else
    begin
       Result := 0;
    end;

  finally
    FreeAndNil(qryAux);
  end;
end;
// FIM



function TCalcEmptmo.TemItensAbertoPorMatricula(
  Matricula: String): Boolean;
var qryAux : TwwQuery;
sSql,sAnoCobranca,sMesCobranca,sDataVencto : String;
 begin
  //Renato Visoni SOL 108324 Kintana 512291
  qryAux               := TwwQuery.Create(Application);
  qryAux.DatabaseName  := 'BaseDados';

  sSql :='';


  sDataVencto    := DateTostr(Now);
  sAnoCobranca   := Copy(dateTostr(Now),7,4);
  sMesCobranca   := Copy(dateTostr(Now),4,2);

  sSql :=' SELECT'                                                       + #13 +
  '  HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO,'                         + #13 +
  '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'                      + #13 +
  '  HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO'         + #13 +
  '  FROM'                                                               + #13 +
  '   HISTMOVEMPTMO HME'                                                 + #13 +
  '  WHERE'                                                              + #13 +
  '     HME.IDCONTRATOEMPTMO IN (SELECT C.IDCONTRATOEMPTMO'              + #13 +
  '                              FROM CONTRATOEMPTMO C, DEPENTIT D'      + #13 +
  '                              WHERE C.IDPESSOA = D.IDTITULAR AND'     + #13 +
  '                                    C.IDBENEF = D.IDPESSOA AND '      + #13 +
  '                                    D.MATRICULA = '''+Matricula +''')'    + #13 +

  ' AND HME.HMETIPOMOV           NOT IN (0, 5, 8)'                       + #13 +
  ' AND HME.FLGBAIXADO           = 0 '                                   + #13 +
  ' AND HME.HMEDATAEFETIVA       IS NULL'                                + #13 +
  ' AND HME.HMEVLREFETIVO        IS NULL'                                + #13 +
  ' AND HME.HMEVLRPREVISTO       <> 0'                                   + #13 +
  ' AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'           + #13 +
  ' AND NVL(HME.FLGESTORNADO, 0) = 0 '                                   + #13 +
  ' AND NVL(HME.FLGSUSPENSAO, 0) = 0 '                                   + #13 +
  ' AND NVL(HME.FLGQUITADO, 0)   = 0 '                                   + #13 +
  ' AND NVL(HME.FLGABONADO, 0)   = 0 '                                   + #13 +
  //' AND (1 IS NULL OR (1 IS NOT NULL AND HME.HMEDATAVENCTO < ''' +sDataVencto+ '''))' + #13 +
  ' AND (1 IS NULL OR (1 IS NOT NULL AND HME.HMEDATAVENCTO < TO_DATE('''+ sDataVencto + ''',''DD/MM/YYYY'')))' + #13 + //Jéssica Lana SOL 130911
  ' AND (1 IS NULL OR (1 IS NOT NULL AND (HME.HMEMESCOBRANCA <> '+ sMesCobranca+' OR HME.HMEANOCOBRANCA <>'+ sAnoCobranca +')))' + #13 ;

  qryAux.SQL.Text := sSql;
  qryAux.Open;

  Result := not(qryAux.IsEmpty);
  qryAux.Free;
  //Renato Visoni SOL 108324 Kintana 512291
end;

//Ádler Souza - SOL 137662 KINTANA 836092
function TCalcEmptmo.VerificaSuspTemp(const aListaContrato : array of Extended;
                          const dDataCredito   : TDateTime): Boolean;
var
  sContratosAnt : String;
  qryAux  : TwwQuery;
  sSql    : String;
  cont    : integer;
begin
  Result := False;

  try
    qryAux               := TwwQuery.Create(Application);
    qryAux.DatabaseName  := 'BaseDados';

    for cont := 0 to High(aListaContrato) do
    begin
      if sContratosAnt <> '' then
        sContratosAnt := sContratosAnt + ',' + FloatToStr(aListaContrato[cont])
      else
        sContratosAnt := FloatToStr(aListaContrato[cont]);
    end;

    if sContratosAnt <> '' then
    begin
      sSql := 'SELECT NVL(TS.FLGSUSAPENASCONC,0) AS FLGSUSAPENASCONC ' +
              '  FROM HISTSUSPCOBEP HS, TIPOSUSPEMPTMO TS ' +
              ' WHERE HS.IDTIPOSUSPEMPTMO =  TS.IDTIPOSUSPEMPTMO ' +
              '   AND HS.IDCONTRATOEMPTMO IN ('+sContratosAnt+') ' +
              '   AND HSCFINALSUSP >= TO_DATE(' + QuotedStr(datetostr(dDataCredito))+','+QuotedStr('DD/MM/YYYY')+')';

      qryAux.Sql.Text := sSql;
      qryAux.Open;

      while not qryAux.Eof do
      begin
        if qryAux.FieldByName('FLGSUSAPENASCONC').AsInteger = 0 then
          Result := True;
          qryAux.next;
      end;
    end;

  finally
    qryAux.Free;
  end;
end;
//Fim - Ádler Souza - SOL 137662 KINTANA 836092

//ELS SOL 144458 Kintana 1208325 Inicio
function TCalcEmptmo.ValidaPrestacaoProjetada(const iIdRegraValidSusp: Int64;
                                              const iIdContratoEmptmo: Extended;
                                              const iIdPessoa, IDBenef, iIdPatro: Int64;
                                              const sFlgInterno: String;
                                              const iIdTipoSuspEmptmo: Int64;
                                              const nTseMeses: Integer;
                                              const dTseInicioSusp, dTseFinalSusp: TDateTime;
                                              const iFlgFerias,iNumParcAberto, iNumParcPagas: Integer;
                                              const dDataInicioAnt,dDataAtualiza: TDateTime;
                                              const iIdSuspensaoAtual: Int64;
                                              const iExcepcional, IDPessjurCedido, iLote: Integer;
                                              const sFlgStatus: String
                                              ): Double; // SOL 181899 KTN 1688596 Otacilio Aquino
var
   sSQL              : String;
   sResultado        : String;
   qryAux            : TwwQuery;
   iIdResponsavel    : Int64;
   sCodTipoRecebedor : String;
   dDataFimReceb     : TDateTime;
   iFlgEnvio         : Integer;
   fVlrPrevisto      : double;
   fVlrEefetivo      : double;
   dDataVencto       : TDateTime;
   sFormaCobranca    : String;
   sTipoFolha        : String;
   dDataPrimParc     : TDateTime;
   iIdplanoPrev      : Integer;
   iIdTipoContrEmptmo: Integer;
   dDataPrevista     : TDateTime;
   fSalParticipacao  : double;
   fSalMantido       : double;
   dDataNasc         : TDateTime;
   iDependIRRF       : integer;
   fTaxaJuros        : Double;
   fSaldoDevedor     : Double;
   iNumParcelas      : Integer;
begin
   Result := -1;
   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';
   try
     sSQL :=
     '  SELECT '                                                                   + #13 +
     '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, '                                  + #13 +
     '     BTP.CODTIPORECEBEDOR, '                                                 + #13 +
     '     BTP.DATAFIMRECEB '                                                      + #13 +
     '  FROM '                                                                     + #13 +
     '     BENEFBFCIARIO   BFC, '                                                  + #13 +
     '     BFCIARIOTITPLAN BTP '                                                   + #13 +
     '  WHERE '                                                                    + #13 +
     '         IDSITBENEFICIO   IN (1,2,7) '                                       + #13 +
     '     AND BFC.IDPESSOA     = ' + floatToStr(iIdPessoa)                        + #13 +
     '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                  + #13 +
     '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                + #13 +
     '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ';

     sSQL := sSQL +
     '  AND ( DATAFINAL IS NULL    OR  '+
     '        DATAFINAL > TO_DATE' +
     '        (' + QuotedStr(DateToStr(dTseInicioSusp)) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
     '      ) ';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Text := sSQL;
     qryAux.Open;

     if not(qryAux.IsEmpty) then
     begin
       iIdResponsavel    := qryAux.FieldByName('IDRESPONSAVEL').AsInteger;
       sCodTipoRecebedor := qryAux.FieldByName('CODTIPORECEBEDOR').AsString;
       dDataFimReceb     := qryAux.FieldByName('DATAFIMRECEB').AsDateTime;
     end;
   finally
     qryAux.Close;
     qryAux.Free;
   end;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSQL := 'SELECT H.HMEVLRPREVISTO,                                         ' + #13 +//fVlrPrevisto
              '       H.HMEVLREFETIVO,                                          ' + #13 +//fVlrEefetivo
              '       NVL(H.FLGENVIO, 1) AS FLGENVIO,                           ' + #13 +//iFlgEnvio
              '       H.HMEDATAVENCTO,                                          ' + #13 +//dDataVencto
              '       H.HMEFORMACOBRANCA,                                       ' + #13 +//sFormaCobranca
              '       H.HMETIPOFOLHA,                                           ' + #13 +//sTipoFolha
              '       C.DATAPRIMPARC,                                           ' + #13 +//dDataPrimParc
              '       C.IDPLANOPREV,                                            ' + #13 +//iIdplanoPrev
              '       C.IDTIPOCONTREMPTMO,                                      ' + #13 +//iIdTipoContrEmptmo
              '       H.HMEDATAPREVISTA,                                        ' + #13 +//dDataPrevista
              '       H.HMENUMPARCELAS,                                         ' + #13 +//iNumParcelas
              '       PPP.SALPARTICIPACAO,                                      ' + #13 +//fSalParticipacao
              '       PPP.SALMANTIDO,                                           ' + #13 +//fSalMantido
              '       P.DATANASC                                                ' + #13 +//dDataNasc
              '  FROM PESSOAFISICA P, HISTMOVEMPTMO H, CONTRATOEMPTMO C             ' + #13 +
              '       LEFT OUTER JOIN PARTPREVPLAN PPP ON PPP.IDPESSOA = C.IDPESSOA ' + #13 +
              '                                        AND PPP.IDPESSOA = C.IDBENEF ' + #13 +
              '                                        AND PPP.FLGDESATIVADO = 0    ' + #13 +
              ' WHERE H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO                   ' + #13 +
              '   AND P.IDPESSOA = C.IDBENEF                                    ' + #13 +
              '   AND HMEVLRPREVISTO > 0                                        ' + #13 +
              '   AND HMETIPOMOV = 1                                            ' + #13 +
              '   AND HMECENTRALIZA = 1                                         ' + #13 +
              '   AND HMERECPAG = ''R''                                         ' + #13 +
              '   AND HMEDATAPREVISTA =                                         ' + #13 +
              '       (SELECT MAX(HME.HMEDATAPREVISTA)                          ' + #13 +
              '          FROM HISTMOVEMPTMO HME                                 ' + #13 +
              '         WHERE HME.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO         ' + #13 +
              '           AND HME.HMETIPOMOV = 1                                ' + #13 +
              '           AND HME.HMEVLRPREVISTO > 0                            ' + #13 +
              '           AND HME.HMERECPAG = ''R''                             ' + #13 +
              '           AND HME.HMECENTRALIZA = 1                             ' + #13 +
              '           AND HME.HMEDATAPREVISTA < TRUNC(SYSDATE))             ' + #13 +
              '   AND H.IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo);

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      //DEPENDIRRF
      with dtmCalcEmptmo.qryDependIRRF do
      begin
        LimpaParametros(dtmCalcEmptmo.qryDependIRRF);
        ParamByName('PIDTITULAR').AsFloat      := iIdPessoa;
        ParamByName('PFIMIMPOSTOR').AsDateTime := date;
        Open;

        iDependIRRF := dtmCalcEmptmo.qryDependIRRFQUANT.AsInteger; //DEPENDIRRF

        Close;
      end;

      if not(qryAux.IsEmpty) then
      begin
        iNumParcelas   := qryAux.FieldByName('HMENUMPARCELAS').AsInteger;
        fVlrPrevisto   := qryAux.FieldByName('HMEVLRPREVISTO').AsFloat;
        fVlrEefetivo   := qryAux.FieldByName('HMEVLREFETIVO').AsFloat;
        iFlgEnvio      := qryAux.FieldByName('FLGENVIO').AsInteger;
        dDataVencto    := qryAux.FieldByName('HMEDATAVENCTO').AsDateTime;
        sFormaCobranca := qryAux.FieldByName('HMEFORMACOBRANCA').AsString;//FORMACOBRANCA
        sTipoFolha     := qryAux.FieldByName('HMETIPOFOLHA').AsString;    //TIPOFOLHA
        dDataPrimParc  := qryAux.FieldByName('DATAPRIMPARC').AsDateTime;  //DATAPRIMPARC
        iIdplanoPrev       := qryAux.FieldByName('IDPLANOPREV').AsInteger;      //IDPLANOPREV
        iIdTipoContrEmptmo := qryAux.FieldByName('IDTIPOCONTREMPTMO').AsInteger;//IDTIPOCONTREMPTMO
        dDataPrevista      := qryAux.FieldByName('HMEDATAPREVISTA').AsDateTime; //DATAPREVISTA
        fSalParticipacao   := qryAux.FieldByName('SALPARTICIPACAO').AsFloat; //SALPARTICIPACAO
        fSalMantido        := qryAux.FieldByName('SALMANTIDO').AsFloat; //SALMANTIDO
        dDataNasc          := qryAux.FieldByName('DATANASC').AsDateTime; //DATANASC
      end;

   finally
     qryAux.Close;
     qryAux.Free;
   end;
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';
   fTaxaJuros        :=0;
   fSaldoDevedor     :=0;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT NVL(TXJUROS,0) AS TXJUROS FROM CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO =' +FloatToStr(iIdContratoEmptmo));
   qryAux.Open;

   if not qryAux.isEmpty then begin
     fTaxaJuros := qryAux.FieldByname('TXJUROS').asfloat;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NVL(MAX(h.hmesaldodev),0) AS hmesaldodev  ');
   qryAux.SQL.Add('FROM histmovemptmo h, contratoemptmo c1, itemxtipocontr itc ');
   qryAux.SQL.Add('WHERE h.idcontratoemptmo = '+ FloatTostr(iIdContratoEmptmo));
   qryAux.SQL.Add('AND   h.idcontratoemptmo = c1.idcontratoemptmo ');
   qryAux.SQL.Add('AND   c1.idtipocontremptmo = itc.idtipocontremptmo ');
   qryAux.SQL.Add('AND   itc.iditememptmo = h.iditememptmo ');
   qryAux.SQL.Add('AND   nvl(h.flgestornado,0) = 0 ');
   qryAux.SQL.Add('AND   h.hmedataprevista = to_date('+QuotedStr(DateTostr(dDataPrevista))+',''DD/MM/YYYY'') ');
   qryAux.SQL.Add('AND   itc.itcordemextrato = (SELECT MAX(i.itcordemextrato) ');
   qryAux.SQL.Add('                             FROM itemxtipocontr i ');
   qryAux.SQL.Add('                             WHERE i.idtipocontremptmo = itc.idtipocontremptmo ');
   qryAux.SQL.Add('                             AND   i.iditememptmo IN (SELECT iditememptmo ');
   qryAux.SQL.Add('                                                     FROM histmovemptmo hme ');
   qryAux.SQL.Add('                                                      WHERE hme.idcontratoemptmo = h.idcontratoemptmo ');
   qryAux.SQL.Add('                                                      AND   hme.hmedataprevista = h.hmedataprevista ');
   qryAux.SQL.Add('                                                      AND   nvl(hme.flgestornado,0) = 0)) ');
   qryAux.Open;

   If not qryAux.isEmpty then begin
     fSaldoDevedor := qryAux.FieldByname('hmesaldodev').asfloat;
   end;
   qryAux.Free;
   Result := 0;
   sSQL :=
   'SELECT                                                                                  ' + #13 +
   ' ' + FormatFloat('#0', iIdContratoEmptmo)                     + ' AS IDCONTRATOEMPTMO,  ' + #13 +
   ' ' + IntToStr(iIdPessoa)                                      + ' AS IDTITULAR,         ' + #13 +
   ' ' + IntToStr(IDBenef)                                        + ' AS IDPESSOA,          ' + #13 +
   ' ' + IntToStr(iIDPatro)                                       + ' AS IDPESSJUR,         ' + #13 +
   ' ' + IntToStr(iIDPatro)                                       + ' AS IDPATRO,           ' + #13 +
   ' ' + QuotedStr(sFlgInterno)                                   + ' AS FLGINTERNO,        ' + #13 +
   ' ' + IntToStr(iIdTipoSuspEmptmo)                              + ' AS IDTIPOSUSPEMPTMO,  ' + #13 +
   ' ' + IntToStr(nTseMeses)                                      + ' AS TSEMESES,          ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseInicioSusp))  + ' AS TSEINICIOSUSP,     ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseFinalSusp))   + ' AS TSEFINALSUSP,      ' + #13 +
   ' ' + IntToStr(iFlgFerias)                                     + ' AS FLGFERIAS,         ' + #13 +
   ' ' + IntToStr(iNumParcAberto)                                 + ' AS NUMPARCABERTO,     ' + #13 +
   ' ' + IntToStr(iNumParcPagas)                                  + ' AS NUMPARCPAGAS,      ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInicioAnt))  + ' AS DATAINICIOANT,     ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))   + ' AS DATAATUALIZA,      ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataFimReceb))   + ' AS DATAFIMRECEB,      ' + #13 +
   ' ' + IntToStr(iIdResponsavel)                                 + ' AS IDRESPONSAVEL,     ' + #13 +
   ' ' + QuotedStr(sCodTipoRecebedor)                             + ' AS CODTIPORECEBEDOR,  ' + #13 +
   ' ' + IntToStr(iIdSuspensaoAtual)                              + ' AS IDTIPOSUSPATUAL,   ' + #13 +
   '0' + IntToStr(iExcepcional)                                   + ' AS FLGEXCEPCIONAL,    ' + #13 +
   '0' + IntToStr(IDPessjurCedido)                                + ' AS IDPESSJURCEDIDO,   ' + #13 +
   '0' + IntToStr(iLote)                                          + ' AS FLGLOTE,           ' + #13 +
   ' ' + IntToStr(iFlgEnvio)                                      + ' AS FLGENVIO,          ' + #13 +
   ' ' + NumeroIngles(fVlrPrevisto)                               + ' AS VLRPREVISTO,       ' + #13 +
   ' ' + NumeroIngles(fVlrEefetivo)                               + ' AS VLREFETIVO,        ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVencto))     + ' AS DATAVENCTO,        ' + #13 +
   ' ' + QuotedStr(sFormaCobranca)                                + ' AS FORMACOBRANCA,     ' + #13 +
   ' ' + QuotedStr(sTipoFolha)                                    + ' AS TIPOFOLHA,         ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPrimParc))   + ' AS DATAPRIMPARC,      ' + #13 +
   ' ' + QuotedStr(sFlgStatus)                                    + ' AS FLGSTATUS,         ' + #13 +
   ' ' + IntToStr(iIdplanoPrev)                                   + ' AS IDPLANOPREV,       ' + #13 +
   ' ' + IntToStr(iIdTipoContrEmptmo)                             + ' AS IDTIPOCONTREMPTMO, ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPrevista))   + ' AS DATAPREVISTA,      ' + #13 +
   ' ' + NumeroIngles(fSalParticipacao)                           + ' AS SALPARTICIPACAO,   ' + #13 +
   ' ' + NumeroIngles(fSaldoDevedor)                           + ' AS SALDODEV,   ' + #13 +
   ' ' + NumeroIngles(fTaxaJuros)                              + ' AS TXJUROS,   ' + #13 +
   ' ' + NumeroIngles(fSalMantido)                                + ' AS SALMANTIDO,        ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataNasc))       + ' AS DATANASC,          ' + #13 +
   ' ' + IntToStr(iDependIRRF)                                    + ' AS DEPENDIRRF,        ' + #13 +
   ' ' + IntToStr(iNumParcelas)                                   + ' AS NUMPARCELAS        ' + #13 +
   'FROM                                                                                    ' + #13 +
   '  DUAL                                                                                  ' + #13;

   if UtilizaRegraValor(iIdRegraValidSusp,
                       sSQL,
                       'e Prestação Projetada',  //BRUNO AZEVEDO SOL 179151 KINTANA 1647786
                       sResultado,
                       True
                      ) then
   begin
      if sResultado <> '' then
      begin
        Result := StrToFloat(sResultado);
      end
      else
      begin
        Result := 0;
      end;
   end;
end;

function TCalcEmptmo.ValidaMargemConsAtual(const iIdRegraValidSusp: Int64;
                                           const iIdContratoEmptmo: Extended;
                                           const iIdPessoa, IDBenef,iIdPatro: Int64;
                                           const sFlgInterno: String;
                                           const iIdTipoSuspEmptmo: Int64;
                                           const nTseMeses: Integer;
                                           const dTseInicioSusp, dTseFinalSusp: TDateTime;
                                           const iFlgFerias, iNumParcAberto, iNumParcPagas: Integer;
                                           const dDataInicioAnt, dDataAtualiza: TDateTime;
                                           const iIdSuspensaoAtual: Int64;
                                           const iExcepcional, IDPessjurCedido, iLote: Integer;
                                           const sFlgStatus: String): Double;
var
   sSQL              : String;
   sResultado        : String;
   qryAux            : TwwQuery;
   iIdResponsavel    : Int64;
   sCodTipoRecebedor : String;
   dDataFimReceb     : TDateTime;
   iFlgEnvio         : Integer;
   fVlrPrevisto      : double;
   fVlrEefetivo      : double;
   dDataVencto       : TDateTime;
   sFormaCobranca    : String;
   sTipoFolha        : String;
   dDataPrimParc     : TDateTime;
   iIdplanoPrev      : Integer;
   iIdTipoContrEmptmo: Integer;
   dDataPrevista     : TDateTime;
   fSalParticipacao  : double;
   fSalMantido       : double;
   dDataNasc         : TDateTime;
   iDependIRRF       : integer;
   fTaxaJuros        : Double;
   fSaldoDevedor     : Double;
   iNumParcelas      : Integer;
begin
   Result := -1;
   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';
   try
     sSQL :=
     '  SELECT '                                                                   + #13 +
     '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, '                                  + #13 +
     '     BTP.CODTIPORECEBEDOR, '                                                 + #13 +
     '     BTP.DATAFIMRECEB '                                                      + #13 +
     '  FROM '                                                                     + #13 +
     '     BENEFBFCIARIO   BFC, '                                                  + #13 +
     '     BFCIARIOTITPLAN BTP '                                                   + #13 +
     '  WHERE '                                                                    + #13 +
     '         IDSITBENEFICIO   IN (1,2,7) '                                       + #13 +
     '     AND BFC.IDPESSOA     = ' + floatToStr(iIdPessoa)                        + #13 +
     '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                  + #13 +
     '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                + #13 +
     '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ';

     sSQL := sSQL +
     '  AND ( DATAFINAL IS NULL    OR  '+
     '        DATAFINAL > TO_DATE' +
     '        (' + QuotedStr(DateToStr(dTseInicioSusp)) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
     '      ) ';

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Text := sSQL;
     qryAux.Open;

     if not(qryAux.IsEmpty) then
     begin
       iIdResponsavel    := qryAux.FieldByName('IDRESPONSAVEL').AsInteger;
       sCodTipoRecebedor := qryAux.FieldByName('CODTIPORECEBEDOR').AsString;
       dDataFimReceb     := qryAux.FieldByName('DATAFIMRECEB').AsDateTime;
     end;
   finally
     qryAux.Close;
     qryAux.Free;
   end;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSQL := 'SELECT H.HMEVLRPREVISTO,                                         ' + #13 +//fVlrPrevisto
              '       H.HMEVLREFETIVO,                                          ' + #13 +//fVlrEefetivo
              '       NVL(H.FLGENVIO, 1) AS FLGENVIO,                           ' + #13 +//iFlgEnvio
              '       H.HMEDATAVENCTO,                                          ' + #13 +//dDataVencto
              '       H.HMEFORMACOBRANCA,                                       ' + #13 +//sFormaCobranca
              '       H.HMETIPOFOLHA,                                           ' + #13 +//sTipoFolha
              '       C.DATAPRIMPARC,                                           ' + #13 +//dDataPrimParc
              '       C.IDPLANOPREV,                                            ' + #13 +//iIdplanoPrev
              '       C.IDTIPOCONTREMPTMO,                                      ' + #13 +//iIdTipoContrEmptmo
              '       H.HMEDATAPREVISTA,                                        ' + #13 +//dDataPrevista
              '       H.HMENUMPARCELAS,                                         ' + #13 +//iNumParcelas
              '       PPP.SALPARTICIPACAO,                                      ' + #13 +//fSalParticipacao
              '       PPP.SALMANTIDO,                                           ' + #13 +//fSalMantido
              '       P.DATANASC                                                ' + #13 +//dDataNasc
              '  FROM PESSOAFISICA P, HISTMOVEMPTMO H, CONTRATOEMPTMO C             ' + #13 +
              '       LEFT OUTER JOIN PARTPREVPLAN PPP ON PPP.IDPESSOA = C.IDPESSOA ' + #13 +
              '                                        AND PPP.IDPESSOA = C.IDBENEF ' + #13 +
              '                                        AND PPP.FLGDESATIVADO = 0    ' + #13 +
              ' WHERE H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO                   ' + #13 +
              '   AND P.IDPESSOA = C.IDBENEF                                    ' + #13 +
              '   AND HMEVLRPREVISTO > 0                                        ' + #13 +
              '   AND HMETIPOMOV = 1                                            ' + #13 +
              '   AND HMECENTRALIZA = 1                                         ' + #13 +
              '   AND HMERECPAG = ''R''                                         ' + #13 +
              '   AND HMEDATAPREVISTA =                                         ' + #13 +
              '       (SELECT MAX(HME.HMEDATAPREVISTA)                          ' + #13 +
              '          FROM HISTMOVEMPTMO HME                                 ' + #13 +
              '         WHERE HME.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO         ' + #13 +
              '           AND HME.HMETIPOMOV = 1                                ' + #13 +
              '           AND HME.HMEVLRPREVISTO > 0                            ' + #13 +
              '           AND HME.HMERECPAG = ''R''                             ' + #13 +
              '           AND HME.HMECENTRALIZA = 1                             ' + #13 +
              '           AND HME.HMEDATAPREVISTA < TRUNC(SYSDATE))             ' + #13 +
              '   AND H.IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo);

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      //DEPENDIRRF
      with dtmCalcEmptmo.qryDependIRRF do
      begin
        LimpaParametros(dtmCalcEmptmo.qryDependIRRF);
        ParamByName('PIDTITULAR').AsFloat      := iIdPessoa;
        ParamByName('PFIMIMPOSTOR').AsDateTime := date;
        Open;

        iDependIRRF := dtmCalcEmptmo.qryDependIRRFQUANT.AsInteger; //DEPENDIRRF

        Close;
      end;

      if not(qryAux.IsEmpty) then
      begin
        iNumParcelas   := qryAux.FieldByName('HMENUMPARCELAS').AsInteger;
        fVlrPrevisto   := qryAux.FieldByName('HMEVLRPREVISTO').AsFloat;
        fVlrEefetivo   := qryAux.FieldByName('HMEVLREFETIVO').AsFloat;
        iFlgEnvio      := qryAux.FieldByName('FLGENVIO').AsInteger;
        dDataVencto    := qryAux.FieldByName('HMEDATAVENCTO').AsDateTime;
        sFormaCobranca := qryAux.FieldByName('HMEFORMACOBRANCA').AsString;//FORMACOBRANCA
        sTipoFolha     := qryAux.FieldByName('HMETIPOFOLHA').AsString;    //TIPOFOLHA
        dDataPrimParc  := qryAux.FieldByName('DATAPRIMPARC').AsDateTime;  //DATAPRIMPARC
        iIdplanoPrev       := qryAux.FieldByName('IDPLANOPREV').AsInteger;      //IDPLANOPREV
        iIdTipoContrEmptmo := qryAux.FieldByName('IDTIPOCONTREMPTMO').AsInteger;//IDTIPOCONTREMPTMO
        dDataPrevista      := qryAux.FieldByName('HMEDATAPREVISTA').AsDateTime; //DATAPREVISTA
        fSalParticipacao   := qryAux.FieldByName('SALPARTICIPACAO').AsFloat; //SALPARTICIPACAO
        fSalMantido        := qryAux.FieldByName('SALMANTIDO').AsFloat; //SALMANTIDO
        dDataNasc          := qryAux.FieldByName('DATANASC').AsDateTime; //DATANASC
      end;

   finally
     qryAux.Close;
     qryAux.Free;
   end;
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';
   fTaxaJuros        :=0;
   fSaldoDevedor     :=0;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT NVL(TXJUROS,0) AS TXJUROS FROM CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO =' +FloatToStr(iIdContratoEmptmo));
   qryAux.Open;

   if not qryAux.isEmpty then begin
     fTaxaJuros := qryAux.FieldByname('TXJUROS').asfloat;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NVL(MAX(h.hmesaldodev),0) AS hmesaldodev  ');
   qryAux.SQL.Add('FROM histmovemptmo h, contratoemptmo c1, itemxtipocontr itc ');
   qryAux.SQL.Add('WHERE h.idcontratoemptmo = '+ FloatTostr(iIdContratoEmptmo));
   qryAux.SQL.Add('AND   h.idcontratoemptmo = c1.idcontratoemptmo ');
   qryAux.SQL.Add('AND   c1.idtipocontremptmo = itc.idtipocontremptmo ');
   qryAux.SQL.Add('AND   itc.iditememptmo = h.iditememptmo ');
   qryAux.SQL.Add('AND   nvl(h.flgestornado,0) = 0 ');
   qryAux.SQL.Add('AND   h.hmedataprevista = to_date('+QuotedStr(DateTostr(dDataPrevista))+',''DD/MM/YYYY'') ');
   qryAux.SQL.Add('AND   itc.itcordemextrato = (SELECT MAX(i.itcordemextrato) ');
   qryAux.SQL.Add('                             FROM itemxtipocontr i ');
   qryAux.SQL.Add('                             WHERE i.idtipocontremptmo = itc.idtipocontremptmo ');
   qryAux.SQL.Add('                             AND   i.iditememptmo IN (SELECT iditememptmo ');
   qryAux.SQL.Add('                                                     FROM histmovemptmo hme ');
   qryAux.SQL.Add('                                                      WHERE hme.idcontratoemptmo = h.idcontratoemptmo ');
   qryAux.SQL.Add('                                                      AND   hme.hmedataprevista = h.hmedataprevista ');
   qryAux.SQL.Add('                                                      AND   nvl(hme.flgestornado,0) = 0)) ');
   qryAux.Open;

   If not qryAux.isEmpty then begin
     fSaldoDevedor := qryAux.FieldByname('hmesaldodev').asfloat;
   end;
   qryAux.Free;
   Result := 0;
   sSQL :=
   'SELECT                                                                                  ' + #13 +
   ' ' + FormatFloat('#0', iIdContratoEmptmo)                     + ' AS IDCONTRATOEMPTMO,  ' + #13 +
   ' ' + IntToStr(iIdPessoa)                                      + ' AS IDTITULAR,         ' + #13 +
   ' ' + IntToStr(IDBenef)                                        + ' AS IDPESSOA,          ' + #13 +
   ' ' + IntToStr(iIDPatro)                                       + ' AS IDPESSJUR,         ' + #13 +
   ' ' + IntToStr(iIDPatro)                                       + ' AS IDPATRO,           ' + #13 +
   ' ' + QuotedStr(sFlgInterno)                                   + ' AS FLGINTERNO,        ' + #13 +
   ' ' + IntToStr(iIdTipoSuspEmptmo)                              + ' AS IDTIPOSUSPEMPTMO,  ' + #13 +
   ' ' + IntToStr(nTseMeses)                                      + ' AS TSEMESES,          ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseInicioSusp))  + ' AS TSEINICIOSUSP,     ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseFinalSusp))   + ' AS TSEFINALSUSP,      ' + #13 +
   ' ' + IntToStr(iFlgFerias)                                     + ' AS FLGFERIAS,         ' + #13 +
   ' ' + IntToStr(iNumParcAberto)                                 + ' AS NUMPARCABERTO,     ' + #13 +
   ' ' + IntToStr(iNumParcPagas)                                  + ' AS NUMPARCPAGAS,      ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInicioAnt))  + ' AS DATAINICIOANT,     ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))   + ' AS DATAATUALIZA,      ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataFimReceb))   + ' AS DATAFIMRECEB,      ' + #13 +
   ' ' + IntToStr(iIdResponsavel)                                 + ' AS IDRESPONSAVEL,     ' + #13 +
   ' ' + QuotedStr(sCodTipoRecebedor)                             + ' AS CODTIPORECEBEDOR,  ' + #13 +
   ' ' + IntToStr(iIdSuspensaoAtual)                              + ' AS IDTIPOSUSPATUAL,   ' + #13 +
   '0' + IntToStr(iExcepcional)                                   + ' AS FLGEXCEPCIONAL,    ' + #13 +
   '0' + IntToStr(IDPessjurCedido)                                + ' AS IDPESSJURCEDIDO,   ' + #13 +
   '0' + IntToStr(iLote)                                          + ' AS FLGLOTE,           ' + #13 +
   ' ' + IntToStr(iFlgEnvio)                                      + ' AS FLGENVIO,          ' + #13 +
   ' ' + NumeroIngles(fVlrPrevisto)                               + ' AS VLRPREVISTO,       ' + #13 +
   ' ' + NumeroIngles(fVlrEefetivo)                               + ' AS VLREFETIVO,        ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVencto))     + ' AS DATAVENCTO,        ' + #13 +
   ' ' + QuotedStr(sFormaCobranca)                                + ' AS FORMACOBRANCA,     ' + #13 +
   ' ' + QuotedStr(sTipoFolha)                                    + ' AS TIPOFOLHA,         ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPrimParc))   + ' AS DATAPRIMPARC,      ' + #13 +
   ' ' + QuotedStr(sFlgStatus)                                    + ' AS FLGSTATUS,         ' + #13 +
   ' ' + IntToStr(iIdplanoPrev)                                   + ' AS IDPLANOPREV,       ' + #13 +
   ' ' + IntToStr(iIdTipoContrEmptmo)                             + ' AS IDTIPOCONTREMPTMO, ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPrevista))   + ' AS DATAPREVISTA,      ' + #13 +
   ' ' + NumeroIngles(fSalParticipacao)                           + ' AS SALPARTICIPACAO,   ' + #13 +
   ' ' + NumeroIngles(fSaldoDevedor)                           + ' AS SALDODEV,   ' + #13 +
   ' ' + NumeroIngles(fTaxaJuros)                              + ' AS TXJUROS,   ' + #13 +
   ' ' + NumeroIngles(fSalMantido)                                + ' AS SALMANTIDO,        ' + #13 +
   ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataNasc))       + ' AS DATANASC,          ' + #13 +
   ' ' + IntToStr(iDependIRRF)                                    + ' AS DEPENDIRRF,        ' + #13 +
   ' ' + IntToStr(iNumParcelas)                                   + ' AS NUMPARCELAS        ' + #13 +
   'FROM                                                                                    ' + #13 +
   '  DUAL                                                                                  ' + #13;

   if UtilizaRegraValor(iIdRegraValidSusp,
                       sSQL,
                       'e Margem Consignável Atual', //BRUNO AZEVEDO SOL 179151 KINTANA 1647786
                       sResultado,
                       True
                      ) then
   begin
      if sResultado <> '' then
      begin
        Result := StrToFloat(sResultado);
      end
      else
      begin
        Result := 0;
      end;
   end;
end;
//ELS SOL 144458 Kintana 1208325 Fim

//Início -  William Santana - SOL 218798.16629 PPM 560594

function TCalcEmptmo.CalculaItensDiverg(const rContrato        : TDadosContrato;
                                        const iOrigem          : Integer;
                                        const iParcela         : Integer;
                                        const iParcelaAlt      : Integer;
                                        const iParcResta       : Integer;
                                        const iAnoCompetencia  : Integer;
                                        const iMesCompetencia  : Integer;
                                        const dDataDiverg      : TDateTime;
                                        const dDataVenc        : TDateTime;
                                        const dDataAtu         : TDateTime;
                                        const sFormaCobranca   : String;
                                        var   vLista           : TListaItem;
                                        const bMostraMsg       : Boolean;
                                        var   iContRegra       : integer;
                                        const iContContrato    : integer;
                                        const sArquivoLog      : String = '';
                                        const bTrataDivergNOVO : Boolean = False;
                                        const bMostraProgressoDuplo : Boolean = False
                                       ): Boolean;
const
   iEvento = 4;
var
   bCabecalho              : Boolean;
   rSaldoDevAnt            : TSaldoDevAnt;
   fNovoSaldoDev           : Currency;
   sValor, sCabecalho      : String;
   sSQL, sSQLExec, sEstado : String;
   vSQL                    : array of String;
   i, j, k, iContador      : Integer;
   iPais, iCidade, iEstado : Int64;
   sSQLItens : string; // 92334 Daniel Begnami
   fValorSolic : Currency; //Fanuel Marinho SOl176404
   qryValorPrevisto : TwwQuery;   
begin
   //Ao alterar essa função, favor replicar na outra função CalculaItensDiverg com Overload
   Result := False;

   try
      iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
      iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
      iEstado  := dtmEmptmo.qryParamEmptmoIDESTADO.AsInteger;
      sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;

      sValor    := '0';
      sSQL      := '';
      i         := 0;
      k         := 0;
      iContador := 0;

      // abertura da query dos itens de Divergência 
      with dtmCalcEmptmo.qryBuscaItens do
      begin
         LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
         ParamByName('PEVENTO').AsInteger            := iEvento;
         Open;
      end;


      // -------------------------------------------------------------------------------------------

            //Fanuel Marinho SOL176404 Kintana1609941
       qryValorPrevisto := TwwQuery.Create(nil);
       qryValorPrevisto.DataBaseName := 'BASEDADOS';
       qryValorPrevisto.Close;
       qryValorPrevisto.SQL.Clear;
       qryValorPrevisto.SQL.Add(
              ' SELECT SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO '+
              ' FROM  HISTMOVEMPTMO                          '+
              ' WHERE  IDCONTRATOEMPTMO    = '+ FormatFloat('#0', rContrato.IDContratoEmptmo) +
              //' AND   HMECENTRALIZA       = 1                    '+
              ' AND HMETIPOMOV   = 0  '+
              ' AND IDITEMEMPTMO = 22 ' +
              //' AND   HMEORIGEM           IN (0,13)              '+
              ' AND NVL(FLGESTORNADO,0) = 0                    ' );
      qryValorPrevisto.Open;
      fValorSolic := qryValorPrevisto.FieldByName('HMEVLRPREVISTO').AsFloat;
      qryValorPrevisto.Close;
      FreeAndNil(qryValorPrevisto);
      //Fanuel Marinho SOL176404 Kintana1609941
      

      // André Pontes - 10/01/2006
      if Sistema.TipoCliente = 19991 then
      begin
         rSaldoDevAnt := SaldoDevAnt(rContrato.IDContratoEmptmo,
                                     dDataDiverg,
                                     -1,
                                     -1,
                                     False,
                                     bTrataDivergNOVO // 92334 Daniel Begnami
                                    );
      end
      else
      begin
         rSaldoDevAnt := SaldoDevAnt(rContrato.IDContratoEmptmo,
                                     dDataDiverg,
                                     iAnoCompetencia,
                                     iMesCompetencia,
                                     False,
                                     bTrataDivergNOVO // 92334 Daniel Begnami
                                    );
      end;
      // FIM André Pontes - 10/01/2006

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      //    Monta PRIMEIRA LINHA do SQL (linha do Saldo Devedor Anterior)
      // -------------------------------------------------------------------------------------------

      SetLength(vSQL, i + 1);

      sSQL := '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
      'SELECT '                                                                                                      + #13 +
      '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
      '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
      '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       + //#13 +
      '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        + //#13 +
      '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          + //#13 +
      '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          + //#13 +

      '  ' + QuotedStr(rContrato.SiglaIndexador)                                       +  ' AS NOMEINDICE, '         + //#13 +

      '  ' + NumeroIngles(rContrato.fValMargem)                                        +  ' AS MARGEM, '             + //#13 +
      '  ' + NumeroIngles(rContrato.fValReserva)                                       +  ' AS RESERVA, '            + //#13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))          +  ' AS DATAINSC, '           + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))            +  ' AS DATACREDITO, '        + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))         +  ' AS DATAASSIN, '          + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))           +  ' AS DATAPRIMPARC, '       + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

      '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             + //#13 +
      '  ' + QuotedStr(sEstado)                                                        +  ' AS CODESTADO, '          + //#13 +
      '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          + //#13 +

      '  -1'                                                                           +  ' AS IDITEMEMPTMO, '       + //#13 +
      '  -1'                                                                           +  ' AS EVENTOITEM, '         + //#13 +
      '  -1'                                                                           +  ' AS ORIGEMITEM, '         + //#13 +
      '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             + //#13 +
      '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             + //#13 +
      '  -1'                                                                           +  ' AS SEQCALCULO, '         + //#13 +

      '  ' + IntToStr(rSaldoDevAnt.iParcelaAnt)                                        +  ' AS PARCATUAL, '          + //#13 +
      ' 0' + IntToStr(rSaldoDevAnt.iParcRestaAnt)                                      +  ' AS NUMPARCELAS, '        + //#13 +

      '  -1'                                                                           +  ' AS CENTRALIZA, '         + //#13 +
      '  -1'                                                                           +  ' AS DESTACADO, '          + //#13 +

      '  0'                                                                            +  ' AS FLGENVIO, '           + //#13 +
      '  0'                                                                            +  ' AS FLGBAIXADO, '         + //#13 +
      '  0'                                                                            +  ' AS FLGESTORNADO, '       + //#13 +
      '  0'                                                                            +  ' AS FLGABONADO, '         + //#13 +
      '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        + //#13 +

      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                      +  ' AS DATAEVENTO, '         + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAPREVISTA, '       + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAEFETIVA, '        + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAATUALIZA, '       + //#13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rSaldoDevAnt.dDataAtuAnt))         +  ' AS DATAVENCTO, '         + //#13 +

      '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldoDevAnt.dDataAtuAnt))             +  ' AS COMPETENCIA, '        + //#13 +
      '  ' + QuotedStr(FormatDateTime('YYYYMM', rSaldoDevAnt.dDataAtuAnt))             +  ' AS COBRANCA, '           + //#13 +

      '  0'                                                                            +  ' AS FLGSUSPENSAO, '       +

      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS VLRPREVISTO, '        + //#13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS VLREFETIVO, '         + //#13 +
      '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                   +  ' AS SALDODEV, '           + //#13 +
      //Fanuel Marinho SOL176404 Kintana1609941
      '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
      '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
      //Fanuel Marinho SOL176404 Kintana1609941
      'FROM '                                                                                                        + //#13 +
      '  DUAL ';

      // armazeno SQL montado no vetor
      vSQL[i] := sSQL;

      // incrementa a variável de índice do vetor
      inc(i);

      // -------------------------------------------------------------------------------------------
      //    Monta as linhas dos itens PENDENTES (de divergência)
      // -------------------------------------------------------------------------------------------

     // 92334 Daniel Begnami
      if bTrataDivergNOVO then
      begin
        with dtmCalcEmptmo.qryItens do
        begin
        
          close;
          SQL.Clear;

          sSQLItens := 'SELECT '+ #13 +
                       'HME.IDHISTMOVEMPTMO, '+ #13 +
                       'HME.IDITEMEMPTMO, '+ #13 +
                       'DECODE(HME.HMETIPOMOV, -2, -2, '+ #13 +
                       '                       -1, -1, '+ #13 +
                       '                        0,  0, '+ #13 +
                       '                        1,  2, '+ #13 +
                       '                        2,  6, '+ #13 +
                       '                        3,  9, '+ #13 +
                       '                        4,  7, '+ #13 +
                       '                        5,  1, '+ #13 +
                       '                        6,  3, '+ #13 +
                       '                        7,  4, '+ #13 +
                       '                        8,  5, '+ #13 +
                       '                            8 '+ #13 +
                       '      ) AS ORDENACAO, '+ #13 +
                       'HME.HMETIPOMOV, HME.HMEORIGEM,  HME.HMESEQCOBRANCA, HME.IDITEMCENTRALIZA, '+ #13 +
                       'HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS, '+ #13 +
                       'HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.HMEPRIORIDADE, HME.HMERECPAG, '+ #13 +
                       'HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, HME.HMEDATAATUALIZA, HME.HMEDATAVENCTO, '+ #13 +
                       'HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA, '+#13 +
                       'HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.HMETXJUROS, HME.IDREGRA, '+ #13 +
                       'HME.HMEFORMACOBRANCA, HME.IDRUBRICA, '+ #13 +
                       'NVL(HME.FLGENVIO, 1)       AS FLGENVIO, '+ #13 +
                       'NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO, '+ #13 +
                       'NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO, '+ #13 +
                       'NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO, '+ #13 +
                       'NVL(HME.FLGABONADO, 0)     AS FLGABONADO, '+ #13 +
                       'NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND, '+ #13 +
                       'NVL(HME.FLGTIPODIVERG, 0 ) AS FLGTIPODIVERG, '+ #13 +
                       'DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0, '+ #13 +
                       '                                    NVL(NVL(HME.IDTIPOSUSPEMPTMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0)) '+ #13 +
                       '      ) AS FLGSUSPENSAO, '+ #13 +
                       'ITE.ITEDESCRICAO, '+ #13 +
                       'HME.CODDOCUMENTO, '+ #13 +
                       'HME.PLNCODIGO, '+ #13 +
                       'HME.IDTMPDESC, '+ #13 +   //SOL 154310 KINTANA 1178383 incluido campo idtmpdesc					   
                       'HME.PLNCODIGOESTORNO '+ #13 +
                       'FROM '+ #13 +
                       '   PREPARAHISTMOVEMPTMO  HME, '+ #13 +
                       '   CONTRATOEMPTMO CON, '+ #13 +
                       '   ITEMEMPTMO     ITE '+ #13 +
                       'WHERE '+ #13 +
                       '     ( HME.IDCONTRATOEMPTMO   = '+ FloatToStr(rContrato.IDContratoEmptmo)+ ') '+ #13 +
                       '   AND (HME.HMEPARCELA             = '+ IntToStr(iParcela) + ') '+ #13 +
                       '   AND ( ITE.IDITEMEMPTMO       > 0 ) '+ #13 +
                       '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) ) '+ #13 +
                       '   AND NVL(HME.FLGESTORNADO, 0) = 0 '+ #13 +
                       '   AND NVL(HME.FLGQUITADO, 0)   = 0 ';

                       if iOrigem <> 7 then
                         sSQLItens := sSQLItens + '   AND (NVL(HME.FLGDIVERGPEND, 0)  =1) ';

                       if iOrigem = 7  then
                         sSQLItens := sSQLItens + ' AND (NVL(HME.FLGBAIXADO, 1)     =0) ';

                       if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
                         sSQLItens := sSQLItens + ' AND (NVL(HME.FLGABONADO, 0)    = 1) ';

                       sSQLItens := sSQLItens +
                       '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '+ #13 +
                       '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '+ #13 +
                       'ORDER BY '+ #13 +
                       '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA ';

          SQL.ADD(sSQLItens);

          Open;
          First;
          bCabecalho := True;

        end;
      end
      else
      begin
      with dtmCalcEmptmo.qryItens do
      begin
         LimpaParametros(dtmCalcEmptmo.qryItens);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
         ParamByName('PHMEPARCELA').AsInteger      := iParcela;

         if iOrigem <> 7 then ParamByName('PFLGDIVERGPEND').AsInteger := 1;
         if iOrigem = 7  then ParamByName('PFLGBAIXADO').AsInteger    := 0;

         if dtmEmptmo.qryParamEmptmoFLGABONODIVERG.AsInteger = 1 then
         begin
            ParamByName('PABONODIVERG').AsInteger := 1;
         end;

         Open;
         First;
         bCabecalho := True;
        end;
      end;
     // Fim

      while not(dtmCalcEmptmo.qryItens.EOF) do
      begin
         sCabecalho := '';
         if bCabecalho then
         begin
            // sCabecalho := '/* -------------- Itens Pendentes ------------------------------------------------ */ ' + #13;
            bCabecalho := False;
         end;

         SetLength(vSQL, i + 1); // array dinâmico

         sSQL := sCabecalho +
         'SELECT '                                                                                                   + //#13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       + //#13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        + //#13 +
         '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          + //#13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          + //#13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                    +  ' AS NOMEINDICE, '         + //#13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                     +  ' AS MARGEM, '             + //#13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                    +  ' AS RESERVA, '            + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))       +  ' AS DATAINSC, '           + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))         +  ' AS DATACREDITO, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))      +  ' AS DATAASSIN, '          + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))        +  ' AS DATAPRIMPARC, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

         '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             + //#13 +
         '  ' + QuotedStr(sEstado)                                                     +  ' AS CODESTADO, '          + //#13 +
         '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensIDITEMEMPTMO.AsInteger)                 +  ' AS IDITEMEMPTMO, '       + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMETIPOMOV.AsInteger)                   +  ' AS EVENTOITEM, '         + //#13 +

         '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         + //#13 +
         '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             + //#13 +
         '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + //#13 +
         '  0'                                                                         +  ' AS SEQCALCULO, '         + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEPARCELA.AsInteger)                   +  ' AS PARCATUAL, '          + //#13 +
         ' 0' + IntToStr(dtmCalcEmptmo.qryItensHMENUMPARCELAS.AsInteger)               +  ' AS NUMPARCELAS, '        + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMECENTRALIZA.AsInteger)                +  ' AS CENTRALIZA, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensHMEDESTACADO.AsInteger)                 +  ' AS DESTACADO, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGENVIO.AsInteger)                     +  ' AS FLGENVIO, '           + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGBAIXADO.AsInteger)                   +  ' AS FLGBAIXADO, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGESTORNADO.AsInteger)                 +  ' AS FLGESTORNADO, '       + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryItensFLGABONADO.AsInteger)                   +  ' AS FLGABONADO, '         + //#13 +
         '  ' + QuotedStr(dtmCalcEmptmo.qryItensHMEFORMACOBRANCA.AsString)             +  ' AS FLGFORMACOB, '        + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                                         +  ' AS DATAEVENTO, '      + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAPREVISTA.AsDateTime))    +  ' AS DATAPREVISTA, '    + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAEFETIVA.AsDateTime))     +  ' AS DATAEFETIVA, '     + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAATUALIZA.AsDateTime))    +  ' AS DATAATUALIZA, '    + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dtmCalcEmptmo.qryItensHMEDATAVENCTO.AsDateTime))      +  ' AS DATAVENCTO, '      + //#13 +

         '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOMPETENCIA.AsFloat)               +
                FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOMPETENCIA.AsFloat))                          +  ' AS COMPETENCIA, ' + //#13 +
         '  ' + QuotedStr(FormatFloat('0000', dtmCalcEmptmo.qryItensHMEANOCOBRANCA.AsFloat)                  +
                FormatFloat('00', dtmCalcEmptmo.qryItensHMEMESCOBRANCA.AsFloat))                             +  ' AS COBRANCA, '    + //#13 +

         ' 0' + dtmCalcEmptmo.qryItensFLGSUSPENSAO.AsString                                +  ' AS FLGSUSPENSAO, '       +

         '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLRPREVISTO.AsFloat)                 +  ' AS VLRPREVISTO, '        + //#13 +
         '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMEVLREFETIVO.AsFloat)                  +  ' AS VLREFETIVO, '         + //#13 +
         '  ' + NumeroIngles(dtmCalcEmptmo.qryItensHMESALDODEV.AsFloat)                    +  ' AS SALDODEV, '           + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
        '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
        '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         'FROM '                                                                                                         + //#13 +
         '  DUAL ';

         // armazeno SQL montado no vetor
         vSQL[i] := sSQL;


         // Existe uma ordem de sequência de cálculo e para cada item o resultado do item
         //   anteriormente calculado tem que ser passado no SQL que será submetido para a Regra.
         //   É usado este laço para juntar TODOS os SQLs, montando o SQL completo que será passado
         //   para Regra de cálculo do item

         for j := 0 to High(vSQL) do
         begin
            if j <= 0 then
            begin
               sSQLExec := vSQL[j];
            end
            else
            begin
               sSQLExec := sSQLExec + #13 +#13 + ' UNION '  + #13 + #13 + vSQL[j];
            end;
         end;

         // incrementa a variável de índice do vetor
         inc(i);

         // Próximo item Aberto
         dtmCalcEmptmo.qryItens.Next;

      end;  // while not(dtmCalcEmptmo.qryItens.EOF


      // -------------------------------------------------------------------------------------------
      //    Monta as linhas dos itens de DE DIVERGÊNCIA
      // -------------------------------------------------------------------------------------------

      dtmCalcEmptmo.qryBuscaItens.First;
      bCabecalho := True;
      while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
      begin
        
         SetLength(vSQL, i + 1); // array dinâmico

         sSQL :=
         'SELECT '                                                                                                         + //#13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                                +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                        +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                             +  ' AS IDTIPOEMPTMO, '       + //#13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                              +  ' AS IDPLANOPREV, '        + //#13 +
         '  ' + IntToStr(rContrato.IDPatro)                                                  +  ' AS IDPESSJUR, '          + //#13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                                +  ' AS IDSITPART, '          + //#13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                          +  ' AS NOMEINDICE, '         + //#13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                           +  ' AS MARGEM, '             + //#13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                          +  ' AS RESERVA, '            + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))             +  ' AS DATAINSC, '           + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))               +  ' AS DATACREDITO, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))            +  ' AS DATAASSIN, '          + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))              +  ' AS DATAPRIMPARC, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

         '  ' + IntToStr(iPais)                                                              +  ' AS IDPAIS, '             + //#13 +
         '  ' + QuotedStr(sEstado)                                                           +  ' AS CODESTADO, '          + //#13 +
         '  ' + IntToStr(iCidade)                                                            +  ' AS IDCIDADES, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)                  +  ' AS IDITEMEMPTMO, '       + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTOITEM, '         + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEMITEM, '         + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTO, '             + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEM, '             + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)                 +  ' AS SEQCALCULO, '         + //#13 +

         '  ' + IntToStr(iParcela)                                                           +  ' AS PARCATUAL, '          + //#13 +
         ' 0' + IntToStr(iParcResta)                                                         +  ' AS NUMPARCELAS, '        + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)                 +  ' AS CENTRALIZA, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)                  +  ' AS DESTACADO, '          + //#13 +

         '  0'                                                                               +  ' AS FLGENVIO, '           + //#13 +
         '  0'                                                                               +  ' AS FLGBAIXADO, '         + //#13 +
         '  0'                                                                               +  ' AS FLGESTORNADO, '       + //#13 +
         '  0'                                                                               +  ' AS FLGABONADO, '         + //#13 +
         '  ' + QuotedStr(rContrato.FlgFormaRec)                                             +  ' AS FLGFORMACOB, '        + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                         +  ' AS DATAEVENTO, '         + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAPREVISTA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                                   +  ' AS DATAEFETIVA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtu))                            +  ' AS DATAATUALIZA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAVENCTO, '         + //#13 +

         '  ' + QuotedStr(FormatFloat('0000', iAnoCompetencia) + FormatFloat('00', iMesCompetencia)) +  ' AS COMPETENCIA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataVenc))                               +  ' AS COBRANCA, '           + //#13 +

         '  0'                                                                               +  ' AS FLGSUSPENSAO, '       +

         '  0'                                                                               +  ' AS VLRPREVISTO, '        + //#13 +
         '  0'                                                                               +  ' AS VLREFETIVO, '         + //#13 +
         '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                      +  ' AS SALDODEV, '           + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
         '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         'FROM '                                                                                                           + //#13 +
         '  DUAL ';

         vSQL[i] := sSQL;

         // Como no caso dos itens de concessão, existe uma ordem de sequência de
         //   cálculo e para cada item o resultado do item anteriormente calculado
         //   tem que ser passado no SQL que será submetido para a Regra.  É usado
         //   este laço para juntar TODOS os SQLs, montando o SQL completo que será
         //   passado para Regra para cálculo do item

         for j := 0 to High(vSQL) do
         begin
            if j <= 0 then begin
               sSQLExec := vSQL[j];
            end
            else
            begin
               sSQLExec := sSQLExec + ' UNION '  + #13 + vSQL[j];
            end;
         end;

//         sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO ';             //Everson Cunha - SIG Tibero - 03/11/2018
         sSQLExec := sSQLExec + ' ORDER BY SEQCALCULO, IDITEMEMPTMO '; //Everson Cunha - SIG Tibero - 03/11/2018

         // ----------------------------------------------------------------------------------------

         //Pendência 24502
         LogToFile('Antes Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString +
                   ': ' + sValor, sArquivoLog); //, True, True, True);

         if not(UtilizaRegraValor(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger, sSQLExec,
                                  'e ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString,
                                  sValor,(* Resultado da Regra passado como Referência *)
                                  bMostraMsg
                                 )) then
         begin
            (* Regra Executada com Erro *)
            Result := False;
            Exit;
         end;

         LogToFile('Após Executar regra de ' + dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString +
                   ': ' + sValor, sArquivoLog, True, True, True);
         // ----------------------------------------------------------------------------------------
         
         try
            // Não gravar item com valor ZERO
            if (sValor = 'NULO') then
            begin
               // Próximo item de Quitação
               dtmCalcEmptmo.qryBuscaItens.Next;

               // incrementa o Contador
               inc(iContador);

               // incrementa a variável de índice do vetor do SQL
               inc(i);
               if bMostraProgressoDuplo then
               begin
                 inc(iContRegra);
                 frmProgressoDuplo.AndaFormProgressoDuplo(iContContrato,iContRegra);
                 frmProgressoDuplo.Refresh;
               end;    
               Continue;
            end;

         except
            MsgDlg('Operação Cancelada!', 'Empréstimo', mtError, [mbOk], 0);
            Exit;
         end;

         if bMostraProgressoDuplo then
         begin
           inc(iContRegra);
           frmProgressoDuplo.AndaFormProgressoDuplo(iContContrato,iContRegra);
           frmProgressoDuplo.Refresh;
         end;

         // ----------------------------------------------------------------------------------------
         //
         //     SUBSTITUIÇÃO no SQL do Itens que acabou de ser CALCULADO      
         //
         //  Depois de executada a Regra a variável sValor já tem o VALOR do
         //  item calculado, logo é atualizado este valor na linha de SQL do
         //  vetor vSQL que acabou de ser executada pela regra.
         //
         // ----------------------------------------------------------------------------------------

         sCabecalho := '';
         if bCabecalho then
         begin
            sCabecalho := '/* -------------- Itens de Divergência ------------------------------------------- */ ' + #13;
            bCabecalho := False;
         end;

         sSQL := sCabecalho +
         'SELECT '                                                                                                         + //#13 +
         '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                                +  ' AS IDCONTRATOEMPTMO, '   + //#13 +
         '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                        +  ' AS IDTIPOCONTREMPTMO, '  + //#13 +
         '  ' + IntToStr(rContrato.IDTipoEmptmo)                                             +  ' AS IDTIPOEMPTMO, '       + //#13 +
         '  ' + IntToStr(rContrato.IDPlanoPrev)                                              +  ' AS IDPLANOPREV, '        + //#13 +
         '  ' + IntToStr(rContrato.IDPatro)                                                  +  ' AS IDPESSJUR, '          + //#13 +
         '  ' + IntToStr(rContrato.IDSitPart)                                                +  ' AS IDSITPART, '          + //#13 +

         '  ' + QuotedStr(rContrato.SiglaIndexador)                                          +  ' AS NOMEINDICE, '         + //#13 +

         '  ' + NumeroIngles(rContrato.fValMargem)                                           +  ' AS MARGEM, '             + //#13 +
         '  ' + NumeroIngles(rContrato.fValReserva)                                          +  ' AS RESERVA, '            + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))             +  ' AS DATAINSC, '           + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))               +  ' AS DATACREDITO, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))            +  ' AS DATAASSIN, '          + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc))              +  ' AS DATAPRIMPARC, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataFimSusp))            +  ' AS DATAFIMSUSP, '        + //#13 +

         '  ' + IntToStr(iPais)                                                              +  ' AS IDPAIS, '             + //#13 +
         '  ' + QuotedStr(sEstado)                                                           +  ' AS CODESTADO, '          + //#13 +
         '  ' + IntToStr(iCidade)                                                            +  ' AS IDCIDADES, '          + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)                  +  ' AS IDITEMEMPTMO, '       + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTOITEM, '         + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEMITEM, '         + //#13 +
         '  ' + IntToStr(iEvento)                                                            +  ' AS EVENTO, '             + //#13 +
         '  ' + IntToStr(iOrigem)                                                            +  ' AS ORIGEM, '             + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger)                 +  ' AS SEQCALCULO, '         + //#13 +

         '  ' + IntToStr(iParcela)                                                           +  ' AS PARCATUAL, '          + //#13 +
         ' 0' + IntToStr(iParcResta)                                                         +  ' AS NUMPARCELAS, '        + //#13 +

         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger)                 +  ' AS CENTRALIZA, '         + //#13 +
         '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger)                  +  ' AS DESTACADO, '          + //#13 +

         '  0'                                                                               +  ' AS FLGENVIO, '           + //#13 +
         '  0'                                                                               +  ' AS FLGBAIXADO, '         + //#13 +
         '  0'                                                                               +  ' AS FLGESTORNADO, '       + //#13 +
         '  0'                                                                               +  ' AS FLGABONADO, '         + //#13 +
         '  ' + QuotedStr(rContrato.FlgFormaRec)                                             +  ' AS FLGFORMACOB, '        + //#13 +

         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDiverg))                         +  ' AS DATAEVENTO, '         + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAPREVISTA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', 0))                                   +  ' AS DATAEFETIVA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtu))                            +  ' AS DATAATUALIZA, '       + //#13 +
         '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataVenc))                           +  ' AS DATAVENCTO, '         + //#13 +

         '  ' + QuotedStr(FormatFloat('0000', iAnoCompetencia) + FormatFloat('00', iMesCompetencia))    +  ' AS COMPETENCIA, '        + //#13 +
         '  ' + QuotedStr(FormatDateTime('YYYYMM', dDataVenc))                               +  ' AS COBRANCA, '           + //#13 +

         '  0'                                                                               +  ' AS FLGSUSPENSAO, '       +

         // aqui ocorre a substituição do valor pelo valor calculado
         //  Thiago Melo SOL 182298 KINTANA 1696751
         '  ' + NumeroIngles(StrToFloat(sValor))                                             +  ' AS VLRPREVISTO, '        + //#13 +

         '  0'                                                                               +  ' AS VLREFETIVO, '         + //#13 +
         '  ' + NumeroIngles(rSaldoDevAnt.fSaldoDevAnt)                                      +  ' AS SALDODEV, '           + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         '  ' + NumeroIngles(rSaldoDevAnt.fTxJurosAnt)                                    +  ' AS TXJUROS,   '            + //#13 +
         '  ' + NumeroIngles(fValorSolic)                                                 +  ' AS VALORSOLIC '            + //#13 +
         //Fanuel Marinho SOL176404 Kintana1609941
         'FROM '                                                                                                           + //#13 +
         '  DUAL ';

         // armazeno SQL montado no vetor
         vSQL[i] := sSQL;


         // ----------------------------------------------------------------------------------------
         //    GRAVAÇÃO no Vetor que será o Result da função
         // ----------------------------------------------------------------------------------------

         SetLength(vLista, k + 1);

         vLista[k].CodigoItem       := dtmCalcEmptmo.qryBuscaItensIDItemEmptmo.AsInteger;
         vLista[k].Nome             := dtmCalcEmptmo.qryBuscaItensIteDescricao.AsString;
         vLista[k].iEvento          := iEvento;
         vLista[k].Origem           := iOrigem;

         vLista[k].SeqCobranca      := 1;
         vLista[k].Prioridade       := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

         vLista[k].FlgCentraliza    := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
         vLista[k].FlgDestacado     := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
         vLista[k].IdItemCentraliza := dtmCalcEmptmo.qryBuscaItensIdItemCentraliza.AsInteger;

         vLista[k].AnoCompetencia   := iAnoCompetencia;
         vLista[k].MesCompetencia   := iMesCompetencia;
         vLista[k].DataPrevista     := dDataVenc;

         vLista[k].Valor            := StrToFloat(ConverteVirg(sValor));

         vLista[k].Parcela          := iParcela;
         vLista[k].ParcelaAlt       := iParcelaAlt;
         vLista[k].ParcResta        := iParcResta;

         // Saldo Devedor
         fNovoSaldoDev              := rSaldoDevAnt.fSaldoDevAnt;

         // calcula o novo saldo devedor
         case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
            0: begin (* Não Tratar *) end;
            1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor;  // Abater
            2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor;  // Incorporar
         end;

         vLista[k].SaldoDevedor     := fNovoSaldoDev;
         vLista[k].TxJuros          := rSaldoDevAnt.fTxJurosAnt;

         vLista[k].FormaCobranca    := sFormaCobranca;

         vLista[k].FlgBaixado       := 0;
         vLista[k].FlgDivergPend    := -1;

         vLista[k].RecPag           := dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString;

         vLista[k].Regra            := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;

         vLista[k].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

         vLista[k].Rubrica          := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger;


         dtmCalcEmptmo.qryBuscaItens.Next;
         inc(iContador);

         inc(i);  // incrementa a variável de índice do vetor do SQL
         inc(k);  // incrementa a variável de índice do vetor da Lista

      end;  // while qryBuscaItens

      Result := True;

   finally
      LimpaParametros(dtmCalcEmptmo.qryItens);
      LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
   end;
end;
//Término -  William Santana - SOL 218798.16629 PPM 560594


end.
