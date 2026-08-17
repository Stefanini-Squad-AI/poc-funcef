{-----------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------------------------------

--------------------------------------------------------------------------------
Pendência   : SOL 253185 Kintana 771995
Responsável : Wylliam Leite da Silva
Data        : 27/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : SOL 196724 Kintana 1899039
Responsável : William Gonçalves de Santana
Data        : 20/01/2014
Descrição   : Inserir verificação e crítica para casos de renovação com amortização pendente
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 207748 Kintana 2006973
Responsável : William Moreira da Silva
Data        : 20/05/2013
Descrição   : Bloqueio para muturios inadimplentes, quando trocar a data de crédito
--------------------------------------------------------------------------------
Pendência   : SOL 206168 Kintana 1995405
Responsável : William Moreira da Silva
Data        : 08/05/2013
Descrição   : Bloqueio para muturios inadimplentes, quando trocar a data de crédito
--------------------------------------------------------------------------------
Pendência   : SOL 205793 Kintana 1993062
Responsável : Marcio Sanches Spinosa SOL 205793 Kintana 1993062
Data        : 06/05/2013
Descrição   : Ajuste para quando for efetuar uma quitação de emprestimo,
              validar somente o contrato selecionado.
--------------------------------------------------------------------------------
Pendência   : SOL 198995 Kintana 1914430
Responsável : Fernando Xavier
Data        : 17/01/2013
Descrição   : Inconsistência na concessão de empréstimo para a matrícula 1299372,
              está considerando as informações do plano 66 ao invés do plano 2
-------------------------------------------------------------------------------
Pendência   : SOL 179958 KINTANA 1660970
Responsável : Mosé Pietro
Data        : 04/10/2012
Descrição   : Inclusão do botão Cancelar na tela de NUP
-------------------------------------------------------------------------------
Pendência   : SOL 189794 KTN 1816770
Data        : 24/07/2012
Autor       : Fernando Xavier
Descrição   : Para os casos em que a concessão do empréstimo considera o plano
              contábil como REG/REPLAN SALDADO e o plano previdenciário como
              NOVO PLANO, solicito que o plano previdenciário considerado na
              concessão seja o REG/REPLAN.
--------------------------------------------------------------------------------
Pendência   : SOL 185618 KTN 1741527
Data        : 24/07/2012
Autor       : Mosé Pietro
Descrição   : O sistema fará a verificação para ver se o valor solicitado é maior
              que o valor permitido
--------------------------------------------------------------------------------
Pendência   : SOL 167098 KINTANA 1464093
Data        : 19/06/2012
Autor       : Jonas Otavio Henrique Rodrigues de Oliveira
Descrição   : O sistema apresentará mensagem critica quando a conta bancaria
            for diferente de caixa, reduzindo inconsistencias de crédito referente aos
            empréstimos FUNCEF.
-----------------------------------------------------------------------------
Pendência   : SOL 183326 Kintana 1712188
Responsável : Thiago Dantas Melo
Data        : 28/06/2012
Descrição   : Quando o valor máximo e zero os itens para Líquido Zero não são
              calculados 
-------------------------------------------------------------------------------

Pendência   : SOL 179805 KINTANA 1659409
Responsável : Thiago Dantas Melo
Data        : 19/05/2012
Descrição   : Na concessão a verificação de inadimplência deve ocorrer com base
              na data prevista
-------------------------------------------------------------------------------
Pendência   : SOL 156456 KINTANA 1234816
Data        : 30/02/2012
Autor       : Wylliam Leite da Silva
Descrição   : Foi criado um Checkbox chkLiquidoZero para se estiver marcado
              a query de entrada na UCalcEmptmo receba 1 e se não estiver
              marcada receber 0.
-------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Chamada do FNup no batao contratar EP.
-------------------------------------------------------------------------------
Pendência   : SOL176201 Kintana 1606793
Responsável : DOUGLAS DE SIQUEIRA
Data        : 21/03/2012
Descrição   : Criação de campo TXJUROSANT nas queries de entrada da regra de concessão
--------------------------------------------------------------------------------
Pendência   : SOL 164198 KINTANA 1409417
Data        : 07/02/2012
Autor       : Vinicius Ferreira
Descrição   : Criação de Funcionalidade para bloqueio de concessões por plano previdenciário.
-------------------------------------------------------------------------------
Pendência   : SOL174268/8141 Kintana 1573410
Responsável : Fanuel Junior
Data        : 15/02/2012
Descrição   : Adicionar o campo DATAFIMANT à query de entrada da regra de validação de suspensão
--------------------------------------------------------------------------------
Pendência   : SOL 171546 KINTANA 1538728
Data        : 10/01/2012
Autor       : Wylliam Leite da Silva
Descrição   : Quando o usuario tiver 1 ou mais bloqueios de concessão o sistema
              o sistema não permitirá que o usuario consiga efetuar a concessão.
--------------------------------------------------------------------------------
Pendência   : SOL 158320 KINTANA 1279843
Responsável : BRUNO AZEVEDO
Data        : 23/05/2011
Descrição   : Quando incluir ou excluir contratos calcular novamente a margem.
-------------------------------------------------------------------------------
Pendência   : SOL 148026 KINTANA 1031173
Responsável : Vinicius Ferreira
Data        : 24/03/2011
Descrição   : Ajustes na função PossuiSuspensaoConcessao para
bloqueio de modalidades.
--------------------------------------------------------------------------------
Pendência   : SOL 153259 KINTANA 1152177
Responsável : BRUNO AZEVEDO
Data        : 22/02/2011
Descrição   : Correção ao buscar o plano na query de salário base.
-------------------------------------------------------------------------------
Pendência   : SOL 151331 KINTANA 1108957
Responsável : BRUNO AZEVEDO
Data        : 28/01/2011
Descrição   : Correção na inclusão dos itens de quitação.
--------------------------------------------------------------------------------
Pendência   : SOL 151964 KINTANA 1124438
Responsável : Fanuel Junior
Data        : 03/02/2011
Descrição   : Adicionado o campo IDTIPOCONTREMPTMO na query de entrada do valor
de salário base.
--------------------------------------------------------------------------------
Pendência   : SOL 139631 Kintana 860008
Responsável : Fanuel Junior
Data        : 25/01/2011
Descrição   : Exibir o label 'PRAZO INDETERMINADO' na tela suspensão de concessão
quando o campo FLGPRAZOINDETERMINADO for igual a 'S'
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Pendência   : SOL 148514 KINTANA 1047194
Responsável : BRUNO AZEVEDO
Data        : 07/12/2010
Descrição   : Correção ao carregar o plano previdênciário.
--------------------------------------------------------------------------------
Pendência   : SOL 145988 Kintana 987019
Responsável : Ádler Souza
Data        : 21/10/2010
Descrição   : Ajuste na função VerificaObrigatoriedadeAvalista.
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
------------------------------------------------------------------------------
Pendência   : SOL 145348 Kintana 973013
Responsável : Ádler Souza
Data        : 07/10/2010
Descrição   : Ajuste na query a fim de buscar o plano correto.
--------------------------------------------------------------------------------
Pendência   : SOL 144704 KTN 968693
Responsável : Ádler Souza
Data        : 25/08/2010
Descrição   : Não considerar o valor "-1" como erro no processamento da margem.
--------------------------------------------------------------------------------
Pendência   : SOL 142594 KTN 912858
Responsável : Ádler Souza
Data        : 25/08/2010
Descrição   : Não exibir suspensão que não seja apenas de concessão na tela de
              Inscrição / Concessão / Renovação
--------------------------------------------------------------------------------
Pendência   : SOL 137662 Kintana 836092
Responsável : Ádler Souza
Data        : 24/08/2010
Descrição   : Exibir mensagem que não é possível aproveitar suspensão quando a
              suspensão não for do tipo "Sunspensão na Concessão".
--------------------------------------------------------------------------------
Pendência   : SOL 138561 KINTANA 859566
Responsável : BRUNO AZEVEDO
Data        : 19/07/2010
Descrição   : Somente permitir suspensão caso os cont. ant. já não tenham usado.
--------------------------------------------------------------------------------
Pendência   : SOL 132000 KINTANA 758243
Responsável : Fernando Santana
Data        : 07/07/2010
Descrição   : Quando Contratar um empréstimo alterar a situação das suspesões para Encerrada,
             cuja suspensões que possuem data téminio menor que a data
--------------------------------------------------------------------------------
Pendência   : SOL 132424 KINTANA 762897
Responsável : Ádler Souza
Data        : 30/03/2010
Descrição   : Ajuste no aviso de informação de bloqueio/suspensão.
------------------------------------------------------------------------------
Pendência   : SOL 133962 KINTANA 784481
Responsável : BRUNO AZEVEDO
Data        : 13/04/2010
Descrição   : Não zerar a variável dDataFimSusp.
------------------------------------------------------------------------------
Pendência   : SOL 133146 KINTANA 773758
Responsável : BRUNO AZEVEDO
Data        : 30/03/2010
Descrição   : Inicializar a variável bExisteSuspensao como False.
------------------------------------------------------------------------------
Pendência   : SOL 122186 Kintana 596406
Responsável : Thiago Passos
Data        : 05/02/2010
Descrição   : Não permitir a suspensão automaticamente
//******************************************************************************
//Rotina: BuscaMargem
//Nº SOL: 75516
//Nº KINTANA: 523281
//Data da Alteração: 15/03/2010
//Responsável: Ádler Souza
//Descrição: Ajustado a consulta de entrada para passar o novo parâmetro com o
//           nome HMEORIGEM.
//******************************************************************************
//Rotina: Suspensão de Concessão
//Nº SOL: 129966
//Nº KINTANA: 718118
//Data da Alteração: 08/03/2010
//Responsável: Ádler Teodoro de Souza
//Descrição: Alteração/Implementação de funcionalidades na tela.
//******************************************************************************
//Rotina: BuscaMargem
//Nº SOL: 131189
//Nº KINTANA: 744558
//Data da Alteração: 19/02/2010
//Responsável: Ádler Souza
//Descrição: Criação de novo valor para o campo DATACREDITO da query de entrada
//           da regra de margem.
//******************************************************************************
Pendência   : SOL 129432 Kintana 709925
Responsável : Renato Visoni
Data        : 11/01/2010
Descrição   : Inserir o campo com o destino de cobrança (hmeformacobranca)
da última prestação vencida (maior da de vencimento anterior a data de hoje)
na query de entrada da regra de margem.
--------------------------------------------------------------------------------
Pendência   : SOL 127055 KINTANA 669953
Responsável : Jéssica Lana
Data        : 23/11/2009
Descrição   : Alteração na qry de entrada da regra que calcula os itens.
              Alteramos  a qry passando parametros para NUMPARCELAS, SALDODEVANT
              SALDOEPANT, DATACREDITO, DATACREDITOANT.
--------------------------------------------------------------------------------
Pendência   : SOL 128127 KINTANA 683853
Responsável : Daniel Begnami
Data        : 03/12/2009
Descrição   : Erro nos itens retornados da qryContratosAnteriores, corração na mesma!
------------------------------------------------------------------------------
Pendência   : SOL 127320 KINTANA 673518
Responsável : Ádler Souza
Data        : 20/11/2009
Descrição   : Ao cancelar o cadastro ou Contratar EP, limpar as variaveis do Regra.
--------------------------------------------------------------------------------
Pendência   : SOL 124858 KINTANA 638072
Responsável : Renato Visoni
Data        : 27/10/2009
Descrição   : Alteração na qry de entrada da regra que calcula os itens.
              Adicionamos a data de credito e o valor do saldo devedor.
--------------------------------------------------------------------------------
Pendência   : SOL 125808  KINTANA 652978
Responsável : Ádler Souza
Data        : 21/10/2009
Descrição   : Alteração do Filtro das Queries "qryItensEmAberto" e "qryContratosAnteriores".
Alterado tambem o evento edtDataCreditoExit para considerar FLGOBRIGATORIO para
contratos em aberto.
--------------------------------------------------------------------------------
Pendência   : SOL 125649 Kintana 650409
Responsável : Ádler Souza
Data        : 19/10/2009
Descrição   : Acerto no Array dinamico "vDividasAnteriores" para receber o número
total de contratos.
--------------------------------------------------------------------------------
Pendência   : SOL 123381 Kintana 616354
Responsável : Daniel Begnami
Data        : 25/08/2009
Descrição   : No momento da concessão de um novo contrato de empréstimo o sistema não está criticando
              quando o contrato a quitar não possui atualização diária para a data de concessão caso este
              contrato não esteja marcado como contrato obrigatório a quitar.
--------------------------------------------------------------------------------
Pendência   : SOL 122185 Kintana 596723
Responsável : Renato Visoni
Data        : 21/07/2009
Descrição   : Na query de entrada da regra de validação da suspensão estava considerando
os contratos de modalidades cuja quitação não é obrigatória, e estava passando o idcontratoemptmo
com um numero negativo para a qry de entrada da regra.
--------------------------------------------------------------------------------
Pendência   : SOL 121819  KINTANA 590453
Responsável : Renato Visoni
Data        : 10/07/2009
Descrição   : Ao selecionar um tipo de contrato, o sistema não estava gravando na
mémoria de calculo (DETCALCULO) os itens das regras. Na execução da regra o
Insert into detcalculo, estava passando nulo para o IDPESSOA.
--------------------------------------------------------------------------------
Pendência   : SOL 121740  KINTANA 589485
Responsável : Renato Visoni
Data        : 09/07/2009
Descrição   : O combo Suspensao de cobranças estava desabilitado.
--------------------------------------------------------------------------------
Pendência   : SOL 74994 KINTANA 523270
Responsável : Jésica Lana
Data        : 04/06/2009
Descrição   : O Campo Valor Máximo não estava atualizando na tela de acerto de
              Concessão.
--------------------------------------------------------------------------------
Pendência   : SOL 115812 Kintana 543737
Responsável : Renato Visoni
Data        : 05/05/2009
Descrição   : Ao marcar o campo excepcional o sistema não está verificando
a Obrigatoriedade de quitação de contratos opcionais com itens em atraso e não
estava calculando a data de credito corretamente apos as 17:00 hrs.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jésica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.

--------------------------------------------------------------------------------
Pendência   : SOL 116121 Kintana 544992
Responsável : Renato Visoni
Data        : 06/05/2008
Descrição   : A regra para calcular a data de término de suspensão mudou,
              O correto agora é gravar a data fim a partir da soma da data da
              primeira parcela com o número de meses suspensos menos um mês.
--------------------------------------------------------------------------------
Pendência   : 115111 - Kintana: 539979
Responsável : Daniel Begnami
Data        : 27/04/2008
Descrição   : Executar a Regra de Valor Máximo ao alterar a Data de Credito.
--------------------------------------------------------------------------------
Pendência   : 108099 - Kintana: 487201
Responsável : Daniel Begnami
Data        : 19/04/2008
Descrição   : Criação de novas modalidades de emprestimo.
------------------------GUS-------------------------------------------------------}

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA
//    20071    FUSESC

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina..........: BuscaValorLiquidoEP
N. Sol..........: 91847
N. Kintana......: 390163
Data............: 30/07/2008
Responsável.....: Denise Arruda
Descrição.......: Incorreto aproveitamento de suspensão no ato da contratação para contratos (Credinâmico - Fixo)
                  que não possuem parametrização para de suspensão na tela de Tipo de Suspensão por Tipo de Contrato.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
N. Sol..........: 91500
N. Kintana......: 386979
Data............: 22/07/2008
Responsável.....: Renato Visoni
Descrição.......: Acerto na verificação das parcelas em aberto
--------------------------------------------------------------------------------
Rotina    : SelecionaMutuarioParaInscricao
Data      : 05/05/2008
Autor     : Marchetti
Pendência : 27849
Descrição : Quando a tela for chamada pela CentralAP, deixa os botões invisíveis
            para não permitir que seja trocado o participante que está tendo o seu
            atendimento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryTipoContrato
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27749
Descrição : Inclusão da coluna FLGNAOVERIFICAMRGPCL e seu respectivo TFloatField
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryTipoContrato
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27232
Descrição : Inclusão das colunas FLGVERIFICAITEMABERTO e seu respectivo TFloatField
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TipoContratoPermitidoParaConcessao
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27232
Descrição : Função não mais utilizada
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExistemItensEmAberto
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27232
Descrição : Passa a utilizar a função de mesmo nome da uCalcEmptmo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryTipoContrato
Data      : 18/12/2007
Autor     : Alberto
Pendência : 26776
Descrição : Incluido filtro para não mostrar tipos de contrato inibidos para o módulo de empréstimo.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Varias
Data      : 07/11/2007
Autor     : Marchetti
Pendência : 26806
Descrição : Passa a gravar a utilização de margem alternativa. Passa essa informação para a regra
            de data da primeira parcela.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Varias
Data      : 16/10 a 24/10/2007
Autor     : Marchetti
Pendência : 26614
Descrição : Ajuste no processo de cálculo de margem para a FUNCEF
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBcboTipoContratoCloseUp
Data      : 08/10/2007
Autor     : Marchetti
Pendência : 26286
Descrição : Quando os campos FLGFORMAPAG e FLGFORMAREC estiver nulo, pega os valores padrão nos parâmetros
            do sistema
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Varias
Data      : 25/09/2007
Autor     : Marchetti
Pendência : 26402
Descrição : Trata o processo de margem consignavel alternativa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Varias
Data      : 19/09/2007
Autor     : Marchetti
Pendência : 26318
Descrição : Quando EXCEPCIONAL permite concessão de contrato mesmo estando na lista de impedimentos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TipoContratoPermitidoParaConcessao
Data      : 27/07/2007
Autor     : Marchetti
Pendência : 26318
Descrição : Unificação de vários IFs que determinam se mutuário pode ou não pegar Emprestimo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Simulacao
Data      : 27/07/2007
Autor     : Alberto
Pendência : 25971
Descrição : Ajuste na query qryTipoContrato para considerar tipos de contrato de
            empréstimo não vinculados ao plano do mutuario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Simulacao
Data      : 14/04/2007
Autor     : Alberto
Pendência : 24901
Descrição : Calcula a margem consignável conforme o prazo para cliente 19981
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaConcessaoNaoEfetivada
Data      : 13/04/2007
Autor     : Marchetti
Pendência : 23407
Descrição : Passa o tipo de verificacao de concessão não efetivada conforme parametrizado no tipo de
            contrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBcboTipoContratoCloseUp
Data      : 27/02/2007
Autor     : Marchetti
Pendência : 23066
Descrição : Pega os destinos padrão de envio informados no Tipo de Contrato.
            Caso não exista essa parametrização por Tipo de Contrato, pega os valores padrão dos
            Parametros do Sistema
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 01/02/2007
Autor     : Marchetti
Pendência : 24376
Descrição : Desabilitada a chamada da rotina AtualizaPaineisCredito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 06/11/2006
Autor     : Marchetti
Pendência : 23647
Descrição : Criação de rotina para verificar o numero de parcelas pagas conforme o contrato que estiver
            relacionado nos contratos quitáveis.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryTipoContrato
Data      : 28/09/2006
Autor     : Alberto Carvalho
Pendência : 23429
Descrição : Criada coluna qryTipoContratoTCEMAXCONTRATO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SetNumParcelas
Data      : 27/09/2006
Autor     : Marchetti
Pendência : 23376
Descrição : Correção no processo de atualização do prazo do contrato quando seleciona outro tipo de contrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 23/06/2006
Autor     : Alberto Carvalho
Pendência : 23060
Descrição : Alteração da qryTipoContrato para reconhecer o flag de tipo de contrato permitido
            na Central = módulo 19
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 23/06/2006
Autor     : Alberto Carvalho
Pendência : 22645
Descrição : Para CBS recalcula itens de concessão independente de alteração de valores ou prazos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBspeParcelasExit
Data      : 17/05/2006
Autor     : André Pontes
Pendência :
Descrição : Disparo do calculo de margem na mudança de prazo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 26/01/2006
Autor     : André Pontes
Pendência : 21379
Descrição : Na tentativa de resolver a questão do disparo do recálculo (reportada por CBS e FUNCEF),
            a ordem dos campos foi alterada para:
            VALOR SOLICITADO --> TAXA DE JUROS --> PRAZO
            Foram ainda inseridos uns "Application.ProcessMessages" e foi inserido o código
            "fParcelaAnt := DBspeParcelas.Value" no _onExit do campo Valor Solicitado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBcboTipoContratoCloseUp
Data      : 06/01/2005
Autor     : André Pontes
Pendência :
Descrição : VerificaConcessaoNaoEfetivada antes de mais nada
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaQuitacao
Data      : 12/12/2005
Autor     : André Pontes
Pendência : 20511
Descrição : Se FLGEXCEPCIONAL = 1, não considerar quitações com valor negativo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : PreencheDadosContrato
Data      : 12/12/2005
Autor     : André Pontes
Pendência : 20912 (ou 20848)
Descrição : Chamada da AcertaPlanoOrigem na após gravação da concessão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnContratoClick
Data      : 12/09/2005
Autor     : Marchetti
Pendência : 20007
Descrição : Colocado processo de gravação da inscrição e a ativação do contrato dentro da mesma
            transação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AtivaContrato
Data      : 11/07/2005
Autor     : André Pontes
Pendência : 19658
Descrição : Correção da gravação do valor efetivo de quitação.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreQueriesDividas
Data      : 01/07/2005
Autor     : André Pontes
Pendência : -
Descrição : Correção da passagem do parâmetro HMEDATAATUALIZA, que permitia a concessão de 2
            contratos novos no mesmo mês
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias (bbtnContratoClick e declarações em outros lugares)
Data      : 13/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de concessão de acordo com parâmetro contábil por módulo, além do TestaPeríodo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaContrato
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaContrato
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '   AND HME.HMESEQCOBRANCA         = 1 '
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaContratoCAPCAR
Data      : 03/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem do campo "MATRICULA"
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 14/06/2004 a
Autor     : André Pontes
Pendencia : 16984
Descrição : Passagem da data de falecimento (nesse caso, -1)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaValorLiquidoEP e sbtnImprimirClick
Data      : 29/03/2004
Autor     : Marchetti
Pendência : 16327 e 16335
Descrição : Criação de rotina para impressao de itens em ordem determinada na tela de itens
            por tipo de contrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick (if fRendaComp < qryVLRSALBASE.AsCurrency)
Data      : 25/03/2004
Autor     : André Pontes
Pendência :
Descrição : Comparação da renda dos avalistas com o salário-base do mutuário, ao invés do valor
            solicitado.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryContratosAnteriores
Data      : 19/03/2004
Autor     : André Pontes
Pendência :
Descrição : Pré-seleção, na query, dos contratos que podem ser quitados pelo tipo de contrato sendo
            concedido
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 11/03/2004
Autor     : André Pontes
Pendência :
Descrição : Gravação do valor-base do IOF
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 04/03/2004
Autor     : André Pontes
Pendência :
Descrição : Aproveitamento de suspensão do contrato anterior renovado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 14/01/2003
Autor     : André Pontes
Pendência :
Descrição : Passados para as regras de concessão apenas dos dados dos contratos efetivamente
            marcados para quitação

            iTotParcPagas  := -1;
            iNumParcPagas  := 0;
            iPrazoAnterior := 0;
            iUltParcGerada := 0;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 07/01/2003
Autor     : André Pontes
Pendência :
Descrição : Passagem do valor total dos itens de seguro e seguro complementar (fVlrSeguroAnt e
            fVlrSeguroComplAnt, respectivamente)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelecionaMutuarioParaInscricao
Data      : 06/01/2004
Autor     : André Pontes
Pendência :
Descrição : Uso da data da máquina ao invés da data do servidor, para efeito de paralelo (FUNCEF)
            A pedido de Ricardo Bobrov (regras de margem e salário-base)

            *************************************
            * Retirar ao fim do paralelo, assim *
            * como a permissão de haver data    *
            * de crédito anterior a hoje        *
            *************************************

---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaMargem e BuscaSalarioBase
Data      : 06/01/2004
Autor     : André Pontes
Pendência :
Descrição : Passagem da data de inscrição para as regras de Margem Consignável e Salário-base
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - qryItensEmAberto
Data      : 28/11/2003
Autor     : André Pontes
Pendência :
Descrição : Na concatenação de Ano e Mês de cobrança foi incluído o TO_CHAR:
            RTRIM(LTRIM(TO_CHAR(HMEANOCOBRANCA,'0000'))) || RTRIM(LTRIM(TO_CHAR(HMEMESCOBRANCA,'00')))
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroAtualizaBotoes
Data      : 17/11/2003
Autor     : André Tavares
Pendência : pendencia 15639
Descrição : Verifica a habilitação dos componetes para o usuário - pendência 15639
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBcboTipoContratoCloseUp
Data      : 15/11/2003
Autor     : Marchetti
Pendência : 15628
Descrição : Busca a regra da data de crédito ao escolher o tipo de contrato
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 15/11/2003
Autor     : Marchetti
Pendência : 15641
Descrição : Retirada a obrigatoriedade de conta corrente no processo de inscrição, ficando somente a
            critica no momento da contratação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 04/11/2003
Autor     : Marchetti
Pendência :
Descrição : Colocada a rotina de gravação dos itens calculados na tabela HISTMOVINSCRICAO conforme
            solicitação do DAVID
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : PreencheDadosContrato
Data      : 09/09/2003
Autor     : Marchetti
Pendência : 14912
Descrição : Colocando o FLGSITUACAO do contrato como 'P' caso exija o recebimento do contrato assinado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaDatas
Data      : 01/09/2003
Autor     : Marchetti
Pendência : 14939
Descrição : Passando o FLGINTERNET para a regra de data de crédito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBrdgCreditoExit
Data      : 01/09/2003
Autor     : André Pontes
Pendência : 14944
Descrição : Evento não estava atribuído na interface. 
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreParametrosSistema
Data      : 01/08/2003
Autor     : André Pontes
Pendência : 14654
Descrição : Preenchimento do PortadorForma de Pagamento conforme BancoXPortForma
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnContratoClick
Data      : 11/07/2003
Autor     : André Pontes
Pendência : 14484
Descrição : Sistema estava travando concessão em função do número de parcelas pagas do contrato anterior
            ser menor que o necessário (parâmetro do tipo de contrato), mesmo não sendo renovação.
            Inserida verificação "if ( not(qryContratosAnteriores.IsEmpty) )..."
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AtivaContrato
Data      : 11/07/2003
Autor     : André Pontes
Pendência : 14501
Descrição : Se o sistema estiver parametrizado para fazer envio em lote,
            NÃO fazer envio para CaP no momento da concessão :
            "dtmEmptmo.qryParamEmptmoFLGINTEGRACONC.AsInteger <> 1"
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 05/06/2003
Autor     : Marchetti
Descrição : Criada a página com outras dívidas (Previdenciaria, Assistencial, etc.)
            Reorganização das páginas de avalistas e beneficiários de seguro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : sbtnImprimirClick
Data      : 02/06/2003
Autor     : Marchetti
Descrição : Caso a fundação controle o recebimento de inscrição, manda mensagem confirmando impressão
            de segunda via e grava a data de emissão da mesma.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 02/06/2003
Autor     : Marchetti
Descrição : Colocada a crítica para verificação se inscriçào já foi recebida, caso a fundaçào controle
            o recebimento de inscrição
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaDataCredito
Data      : 11/12/2002
Autor     : Marchetti
Descrição : Acertado a chamada da rotina
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 11/12/2002
Autor     : Marchetti
Descrição : Quando concessão excepcional, pode-se alterar a data de crédito tanto para maior quanto
            para menor
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBcboTipoContratoCloseUp
Data      : 05/12/2002
Autor     : Marchetti
Descrição : Verifica se o número de parcelas pagas do contrato anterior é inferior ao permitido no
            tipo de contrato para a renovação, levando-se em conta se a fundação trabalha com
            atualização diária (FUNCEF)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 28/11/2002
Autor     : Marchetti
Descrição : São passados como parâmetro o prazo do contrato anterior e a ultima parcela gerada
            do contrato anterior
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaValorLiquidoEP
Data      : 28/11/2002
Autor     : Marchetti
Descrição : Devido ao fato da parcela abater o saldo devedor, o valor da parcela deve
            ser incorporada ao saldo novamente, pois a mesma é deduzida na procedure
            CalculaItens. Isso somente irá acontecer para a fundação que trabalhar com
            atualização diária de saldo devedor, no caso, atualmente só a FUNCEF.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaEPAnterior
Data      : 27/11/2002
Autor     : Marchetti
Descrição : É somado ao saldo a quitar o valor das pendências. Isso somente irá acontecer para a fundação que trabalhar com
            atualização diária de saldo devedor, no caso, atualmente só a FUNCEF.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados seguem sem valor, pois
            os mesmos somente serão utilizados na alteração de valores da concessão.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : FormCreate
Data      : 20/11/2002
Autor     : André Pontes
Descrição : Não é mais criado nesse momento o dtmRelInscricao: passa para o CreateFormReports da
            aplicação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnContratoClick
Data      : 19/11/2002
Autor     : Marchetti
Descrição : Faz as críticas quanto a sua excepcionalidade
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBrdgCreditoChange e DBrdgDebitoChange
Data      : 19/11/2002
Autor     : Marchetti
Descrição : Busca os beneficiários do seguro de uma inscrição anterior
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 19/11/2002
Autor     : Marchetti
Descrição : Acerto no processo quando saldo a quitar for maior que o valor maximo permitido,
            não interrompendo os processos de cálculo e colocando o liquido geral sendo o
            valor máximo permitido menos o saldo a quitar
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : sbtnImprimirClick
Data      : 19/11/2002
Autor     : André Pontes
Descrição : Alterada a metodologia de montagem do relatório, para permitir uso genérico.
            *** Os itens de concessão PRECISAM ficar na região de detalhe do relatório ***
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AtivaContrato
Data      : 13/11/2002
Autor     : André Pontes
Descrição : chamada função ** MarcaItensQuitados ** para cada contrato anterior a quitar
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryContratosAnteriores
Data      : 01/11/2002
Autor     : André Pontes
Descrição : Filtro da sub-query VAL: data prevista < data do crédito
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryContratosAnteriores
Data      : 29/10/2002
Autor     : Marchetti
Descrição : Acertado filtro da query para não levar em consideração itens estornados ou abonados e
            somente itens de hmetipomov = 1
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreParametrosSistema
Data      : 24/10/2002
Autor     : Marchetti
Descrição : Se participante Falcultativo (FLGINTERNO = 'MA') coloca o débito como Financeiro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreQueriesDividas
Data      : 16/10/2002
Autor     : André Pontes
Descrição : ParamByName('PHMEDATA').AsDate passa a receber o último dia do mês da concessão.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DBcboTipoContratoCloseUp
Data      : 09/10/2002
Autor     : Marchetti
Descrição : Retirado o aviso de existência de suspensão de cobrança para o tipo de
            contrato selecionado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AtivaContrato
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Baixa automática da RENOVAÇÃO de valor líquido ZERO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : sbtnImprimirClick
Data      : 08/10/2002
Autor     : Marchetti
Descrição : Alterada a query para ilustrar itens em colunas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : sbtnImprimirClick
Data      : 03/10/2002
Autor     : Marchetti
Descrição : Colocado endereço na query para impressão da inscrição
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocada a excepcionalização na critica de valor da margem em relacao ao valor da
            prestacao básica e se o valor solicitado ultrapassa o limite permitido
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Trocado o titulo na grid de contratos a quitar de "Vlr. Quitação" para "Vlr a Quitar"
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaEPAnterior
Data      : 27/09/2002
Autor     : André Pontes
Descrição : Alteração do ponto onde era chamada o procedimento CalculaEPAnterior para depois de
            SetTxJuros. Isso foi feito dentro de 2 procedimentos: CmeCadastroFind e
            DBcboTipoContratoCloseUp.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 27/09/2002
Autor     : André Pontes
Descrição : Exibição do nº do contrato na mensagem de "Contrato gravado com sucesso."
---------------------------------------------------------------------------------------------------}

unit FCadInscricao;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, Wwtable, cmseldlg, wwidlg, Wwdatsrc, DBCtrls,
   MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, ExtCtrls,
   Wwquery, Mask, wwdblook, wwdbedit, DBCtrls2, FTelaAut, UDataBase,
   Wwdbdlg, TREdit, Wwdbspin, TB97, Menus, MontaSelect,
   TB97Ctls, TB97Tlbr, wwrcdvw, IvDictio, IvMulti,
   IvEMulti, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
   wwDialog, ImgList, fcButton, fcImgBtn, fcShapeBtn, Grids, DBGrids,
   FCadastroCSImob, Wwdbigrd, Wwdbgrid,
// André Tavares - Incluí a unit UAutorizacao
   uTypesEmptmo, uFiario, UAutorizacao,
   uCtrlContab, uCtrlPadroes, uResource, ufuncoesemptmo;

type
  // SOL:108099 Daniel Begnami
  TParcelasSuspensao = class
  private
    Parcela : String;
  end;
  // FIM

   TfrmCadInscricao = class(TFrmCadastroCSImob)

      sbtnCancelar: TToolbarButton97;
      Label23: TLabel;
      Label26: TLabel;
      bbtnContrato: TBitBtn;
      bbtnSimula: TBitBtn;
      sbtnImprimir: TToolbarButton97;
      pnlDetalhe: TPanel;
      pgcValores: TPageControl;
      tbsGeral: TTabSheet;
      Label40: TLabel;
      Label2: TLabel;
      Label9: TLabel;
      lblMargemConsignavel: TLabel;
      Label6: TLabel;
      Label8: TLabel;
      Label14: TLabel;
      Label13: TLabel;
      Label19: TLabel;
      Label12: TLabel;
      DBspeParcelas: TwwDBSpinEdit;
      tbsDivida: TTabSheet;
      DBgrdDivEmp: TwwDBGrid;
      pnlLiquidoFundo: TPanel;
      pnlLiquidoTop: TPanel;
      pnlLiquido: TPanel;
      lblLimiteDisp: TLabel;
      Label28: TLabel;
      edtLiquidoGeral: TRealEdit;
      DBedtDataInsc: TCMDateTimePicker;
      edtDataCredito: TCMDateTimePicker;
      edtDataAssinatura: TCMDateTimePicker;
      edtDataPrimParcela: TCMDateTimePicker;
      edtCarencia: TEdit;
      edtPercentJuros: TRealEdit;
      edtValMargem: TRealEdit;
      edtValReserva: TRealEdit;
      edtValorParcela: TRealEdit;
      DBedtValorSolic: TDBEdit;
      Label20: TLabel;
      tbsIntegracao: TTabSheet;
      pnlDados: TPanel;
      Label1: TLabel;
      Label3: TLabel;
      Label17: TLabel;
      Label22: TLabel;
      Label10: TLabel;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      DBcboTipoContrato: TwwDBLookupCombo;
      pnlCAP: TPanel;
      DBgBanco: TDBGrid;
      DBrdgCredito: TDBRadioGroup;
      pnlCAR: TPanel;
      Label30: TLabel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
      DBrdgDebito: TDBRadioGroup;
      pnlRecebimento: TPanel;
      Label15: TLabel;
      DBedtDtRecebimento: TCMDateTimePicker;
      Label29: TLabel;
      edtSaldoAQuitar: TRealEdit;
      dsBanco: TDataSource;
      qryDESCSITINSCRICAO: TStringField;
      qryINSCRICAONUMERO: TFloatField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANO: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryIDPESSOA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryFLGFORMAPAG: TStringField;
      qryPORTFORMAPAG: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryFLGFORMAREC: TStringField;
      qryPORTFORMAREC: TFloatField;
      qryFLGPENDENTE: TStringField;
      qryFLGSITUACAO: TStringField;
      qryVLRSOLIC: TFloatField;
      qryDATAINSC: TDateTimeField;
      qryDATACANCINSC: TDateTimeField;
      qryTCEDESCRICAO: TStringField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryContratosAnteriores: TwwQuery;
      qryContratosAnterioresVLRCONTRATO: TFloatField;
      qryContratosAnterioresDATACREDITO: TDateTimeField;
      qryContratosAnterioresNUMPARCPAGAS: TFloatField;
      qryContratosAnterioresVLRATUAL: TFloatField;
      qryContratosAnterioresIDCONTRATOEMPTMO: TFloatField;
      qryContratosAnterioresHMESALDODEV: TFloatField;
      dtsContratoAnteriores: TDataSource;
      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoIDREGRAJURCONC: TFloatField;
      qryTipoContratoIDREGRAELEG: TFloatField;
      qryTipoContratoIDREGRALIMITES: TFloatField;
      qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContratoIDREGRAMARGEM: TFloatField;
      qryTipoContratoIDREGRARESERVA: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryContratosAnterioresFLGFORMAREC: TStringField;
      updContratosAnteriores: TUpdateSQL;
      qryContratosAnterioresIDINSCRICAOEMPTMO: TFloatField;
      qryContratosAnterioresNUMPARCELAS: TFloatField;
      pnlDividaTop: TPanel;
      btnIncluirQuitar: TSpeedButton;
      btnRetirarQuitar: TSpeedButton;
      qryTipoContratoTEPMAXCONTRATO: TFloatField;
      tbsItens: TTabSheet;
      Label24: TLabel;
      dtsItensConcessao: TDataSource;
      qryItensConcessao: TwwQuery;
      qryItensConcessaoITEM: TStringField;
      qryItensConcessaoVALOR: TFloatField;
      DBgrdItensConcessao: TwwDBGrid;
      qryCPF: TStringField;
      edtSalParticipacao: TRealEdit;
      Label27: TLabel;
      Label32: TLabel;
      edtSalAuxDoenca: TRealEdit;
      edtSalMantido: TRealEdit;
      Label34: TLabel;
      Label33: TLabel;
      edtSalBenef: TRealEdit;
      MainMenu1: TMainMenu;
      updAvalista: TUpdateSQL;
      qryAvalista: TwwQuery;
      dsAvalista: TDataSource;
      qryAvalistaIDINSCRICAOEMPTMO: TFloatField;
      qryAvalistaIDAVALISTA: TFloatField;
      qryAvalistaNOME: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryAvalistaRENDACOMP: TFloatField;
      qryAvalistaMARGEMCONSIG: TFloatField;
      qryBenefSeguro: TwwQuery;
      dsBenefSeguro: TDataSource;
      chkTRAVARDATAS: TCheckBox;
      DBcboSuspensaoCobranca: TDBCheckBox;
      qryFLGSUSPENSAOAUTO: TFloatField;
      qryContratoQuitacao: TwwQuery;
      qryTipoContratoFLGOBRIGBENEF: TFloatField;
      qryItensEmAberto: TwwQuery;
      qryTipoContratoIDREGRASALBAS: TFloatField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      Label37: TLabel;
      RealEdit1: TRealEdit;
      btnAlteraSalarioBase: TBitBtn;
      btnAlteraMargem: TBitBtn;
      DBEdtVlrMaxPermit: TDBEdit;
      Label38: TLabel;
      DBEdtMargem: TDBEdit;
      DBEdtSalarioBase: TDBEdit;
      qryMOECODIGO: TFloatField;
      dbcboMoeda: TwwDBLookupCombo;
      Label39: TLabel;
      qryTipoContratoMOECODIGO: TFloatField;
      qryTipoContratoFLGCONCESSAOZERO: TFloatField;
      qryTipoContratoTCEMINRENOVA: TFloatField;
      qryTipoContratoIDREGRADATACRED: TFloatField;
      btnAlteraVlrMax: TBitBtn;
      lbFormPag: TLabel;
      DBcboFormaPagamento: TwwDBLookupCombo;
      Label31: TLabel;
      DBcboCCaixaxFPagto: TwwDBLookupCombo;
      qryContratosAnterioresMOECODIGO: TFloatField;
      qryContratosAnterioresMOESIGLA: TStringField;
      qryContratosAnterioresTCEDESCRICAO: TStringField;
      qryContratosAnterioresIDTIPOCONTREMPTMO: TFloatField;
      qryContratosAnterioresFLGESCOLHA: TFloatField;
      qryContratosAnterioresVLRPARCELA: TFloatField;
      qryItensEmAbertoIDHISTMOVEMPTMO: TFloatField;
      qryItensEmAbertoHMEVLRPREVISTO: TFloatField;
      qryContratosAnterioresVLREMABERTO: TFloatField;
      Label44: TLabel;
      edtQuitacao: TRealEdit;
      qryVLRPARCELAMES: TFloatField;
      qryVLRPARCATRASO: TFloatField;
      edtTotalParcelas: TRealEdit;
      edtTotalPendencias: TRealEdit;
      Label42: TLabel;
      Label43: TLabel;
      qryFLGALTSALARIO: TFloatField;
      qryFLGALTMARGEM: TFloatField;
      qryFLGALTVALMAX: TFloatField;
      qryItensConcessaoIDITEMEMPTMO: TFloatField;
      qryContratosAnterioresIDPATRO: TFloatField;
      qryContratosAnterioresIDPESSOA: TFloatField;
      qryContratosAnterioresIDPLANOPREV: TFloatField;
      qryUpdateContratoAnt: TwwQuery;
      grpTitular: TGroupBox;
      Label21: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      Label4: TLabel;
      DBEdit2: TDBEdit;
      Label7: TLabel;
      qryMATRICULA_TIT: TStringField;
      qryINSCRICAO_TIT: TFloatField;
      qryCPF_TIT: TStringField;
      DBcboSuspensao: TwwDBLookupCombo;
      Label41: TLabel;
      qryContratosAnterioresIDTIPOSUSPEMPTMO: TFloatField;
      qryContratosAnterioresDATAINICIOSUSP: TDateTimeField;
      qryContratosAnterioresDATAFIMSUSP: TDateTimeField;
      qryContratosAnterioresFLGSUSPENSAOAUTO: TFloatField;
      qryContratosAnterioresDATALIBSUSP: TDateTimeField;
      qryContratosAnterioresULT_PARC: TFloatField;
      qryContratosAnterioresIDBENEF: TFloatField;
      qryContratosAnterioresDATAASSINATURA: TDateTimeField;
      qryContratosAnterioresDATAPRIMPARC: TDateTimeField;
      qryContratosAnterioresIDTIPOEMPTMO: TFloatField;
      chkExcepcional: TCheckBox;
      pnlIntegracao: TPanel;
      lblHoraEncerra: TLabel;
      edtHoraEncerra: TCMDateTimePicker;
      qryDATACREDITO: TDateTimeField;
      lblDescontos: TLabel;
      edtOutrosDescontos: TRealEdit;
      edtLimiteDisp: TRealEdit;
      DBgrdResponsavel: TDBGrid;
      DBGrid2: TDBGrid;
      Bevel1: TBevel;
      qryTipoContratoIDREGRAPRAZOMAX: TFloatField;
      qryIDRESPONSAVEL: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryResponsavel: TwwQuery;
      dsResponsavel: TDataSource;
      qryResponsavelIDRESPONSAVEL: TFloatField;
      qryResponsavelNOMERESPONSAVEL: TStringField;
      dsBancoDeb: TDataSource;
      qryEndereco: TwwQuery;
      qryEnderecoCODESTADO: TStringField;
      qryEnderecoIDPAIS: TFloatField;
      qryTipoContratoNUMPARCDESCONTO: TFloatField;
      qryUpdateInsc: TwwQuery;
      qryDATAENVIO: TDateTimeField;
      qryDATARECEB: TDateTimeField;
      TabSheet2: TTabSheet;
      Panel1: TPanel;
      btnIncluirQuitarDividas: TSpeedButton;
      btnRetirarQuitarDividas: TSpeedButton;
      wwDBGrid1: TwwDBGrid;
      wwIButton1: TwwIButton;
      Label11: TLabel;
      edtQuitacaoDividas: TRealEdit;
      updOutrasDividas: TUpdateSQL;
      dsOutrasDividas: TDataSource;
      qryOutrasDividas: TwwQuery;
      qryOutrasDividasTIPO: TStringField;
      qryOutrasDividasMESREFERENCIA: TStringField;
      qryOutrasDividasDATAPREVISAORECE: TDateTimeField;
      qryOutrasDividasVALORCALCULADO: TFloatField;
      qryOutrasDividasMESCOBRANCA: TStringField;
      qryOutrasDividasFLGESCOLHA: TFloatField;
      TabSheet3: TTabSheet;
      pgcOutrasInfo: TPageControl;
      tbsAvalistas: TTabSheet;
      TabSheet5: TTabSheet;
      Dock975: TDock97;
      Toolbar973: TToolbar97;
      sbtnInsAval: TToolbarButton97;
      ToolbarButton972: TToolbarButton97;
      sbtnExcluiAval: TToolbarButton97;
      sbtnNovoAval: TToolbarButton97;
      dbgrdDet: TwwDBGrid;
      Label25: TLabel;
      Label45: TLabel;
      dbEdtNomeBenef: TDBEdit;
      dbEdtPercIndeniz: TDBEdit;
      Dock974: TDock97;
      Toolbar972: TToolbar97;
      sbtnInsereBenef: TToolbarButton97;
      sbtnAlteraBenef: TToolbarButton97;
      sbtnExcluiBenef: TToolbarButton97;
      sbtnNovoBenef: TToolbarButton97;
      bbtnOkDetBenef: TBitBtn;
      bbtnCancelarDetBenef: TBitBtn;
      DBGrdBenefSeg: TwwDBGrid;
      qryOutrasDividasCODTIPO: TFloatField;
      qryOutrasDividasORDEM: TStringField;
      qryFLGINTERNET: TFloatField;
      qryInsertHistMovInsc: TwwQuery;
      qryItensConcessaoSEQCALCULO: TFloatField;
      qryItensConcessaoIDREGRA: TFloatField;
      qryItensConcessaoFLGCENTRALIZA: TFloatField;
      qryItensConcessaoFLGDESTACADO: TFloatField;
      qrySaldoQuitacao: TwwQuery;
      qryContratosAnterioresVLRDEVSEG: TFloatField;
      qryTipoContrXQuit: TwwQuery;
      qryTipoContrXQuitQUANTIDADE: TFloatField;
      qrySaldoQuitacaoBAK: TwwQuery;
      qrySaldoQuitacaoHMEVLRPREVISTO: TFloatField;
      qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField;
      qryBenefSeguroIDBENEFSEGURO: TFloatField;
      qryBenefSeguroPERCINDENIZACAO: TFloatField;
      qryBenefSeguroTRGDTINCLUSAO: TDateTimeField;
      qryBenefSeguroTRGUSERINCLUSAO: TStringField;
      qryBenefSeguroVLRSALDOREC: TFloatField;
      qryBenefSeguroVLRREPASSE: TFloatField;
      qryBenefSeguroDATAREPASSE: TDateTimeField;
      qryBenefSeguroNUMBANCO: TFloatField;
      qryBenefSeguroCODAGENCIA: TStringField;
      qryBenefSeguroCONTACORRENTE: TStringField;
      qryBenefSeguroNOME: TStringField;
      qryBenefSeguroOBS: TStringField;
      qrySuspAnterior: TwwQuery;
      qrySuspAnteriorIDHISTSUSPCOBEP: TFloatField;
      qrySuspAnteriorIDTIPOSUSPEMPTMO: TFloatField;
      qrySuspAnteriorIDCONTRATOEMPTMO: TFloatField;
      qrySuspAnteriorFLGSTATUS: TStringField;
      qrySuspAnteriorFLGFERIAS: TFloatField;
      qrySuspAnteriorHSCINICIOSUSP: TDateTimeField;
      qrySuspAnteriorHSCFINALSUSP: TDateTimeField;
      qrySuspAnteriorHSCMESES: TFloatField;
      qrySuspAnteriorHSCUSUATEND: TStringField;
      qrySuspAnteriorHSCDATAATEND: TDateTimeField;
      qrySuspAnteriorHSCDATALIBER: TDateTimeField;
      qrySuspAnteriorHSCUSULIBER: TStringField;
      qrySuspAnteriorHSCDATAATU: TDateTimeField;
      qrySuspAnteriorHSCANOCOBRANCA: TFloatField;
      qrySuspAnteriorHSCMESCOBRANCA: TFloatField;
      updBenefSeguro: TUpdateSQL;
      qryBuscaItens: TwwQuery;
      qryBuscaItensITCORDEMIMP: TFloatField;
      qryBuscaItensITCITEMIMPRESSO: TFloatField;
      qryItensImpressao: TwwQuery;
      qryItensImpressaoIDITEMEMPTMO: TFloatField;
      qryItensImpressaoITEM: TStringField;
      qryItensImpressaoVALOR: TFloatField;
      qryItensImpressaoSEQIMPRESSAO: TFloatField;
      qryItensImpressaoIDREGRA: TFloatField;
      qryItensImpressaoFLGCENTRALIZA: TFloatField;
      qryItensImpressaoFLGDESTACADO: TFloatField;
      edtDataFinalSuspensao: TCMDateTimePicker;
      Label35: TLabel;
      qryInsertHistSuspensao: TwwQuery;
      qryContratosAnterioresTCEMINRENOVA: TFloatField;
      qryOutrasDividasNUMPARCELA: TFloatField;
      qryTipoContratoIDREGRAPRIMPARC: TFloatField;
      chkFinanciamento: TCheckBox;
      qryContratosAnteriores2: TwwQuery;
      qryContratosAnteriores2IDCONTRATOEMPTMO: TFloatField;
      qryTipoContratoIDREGRAJUREXIBE: TFloatField;
      qryTipoContratoTCELEGENDACALC: TStringField;
      qryTipoContratoTCELEGENDAEXIBE: TStringField;
      dtsTipoContrato: TwwDataSource;
      edtTxJurosExibe: TRealEdit;
      DBText1: TDBText;
      qryContratosAnteriores2IDTIPOCONTREMPTMO: TFloatField;
      qryContratosAnteriores_ANTIGA: TwwQuery;
      qrySuspContratoAnt: TwwQuery;
      qrySuspContratoAntIDTIPOSUSPEMPTMO: TFloatField;
      qrySuspContratoAntDATAINICIOSUSP: TDateTimeField;
      qrySuspContratoAntDATAFIMSUSP: TDateTimeField;
      qryEncerraSuspensao: TwwQuery;
      qryTipoContratoFLGOBRIGACONCZERO: TFloatField;
      qryTipoContratoTCEMAXCONTRATO: TFloatField;
      qryContratosAnterioresIDPLANOORIGEM: TFloatField;
      qryTipoContratoFLGVERPRAZOTIPOQUIT: TFloatField;
      qryVerificaCarencia: TwwQuery;
      qryVerificaCarenciaTCEMINRENOVA: TFloatField;
      qryVerificaCarenciaIDTIPOCONTREMPTMO: TFloatField;
      qryVerificaCarenciaTCEDESCRICAO: TStringField;
      qryTipoContratoFLGFORMAPAG: TStringField;
      qryTipoContratoFLGFORMAREC: TStringField;
      qryTipoContratoFLGVERIFICACONTRATO: TFloatField;
      rdgMargemConsignavel: TRadioButton;
      rdgMargemAlt: TRadioButton;
      dbEdtMargemAlt: TDBEdit;
      qryTipoContratoIDREGRAMARGEMALT: TFloatField;
      qryTipoContratoIDREGRAMARGEMAVAL: TFloatField;
      qryTipoContratoIDREGRAELEGAVAL: TFloatField;
      qryVLRMARGEMALT: TFloatField;
      edtValMargemAlt: TRealEdit;
      qryInsereAvalista: TwwQuery;
      qryInsereAvalistaIDAVALISTA: TFloatField;
      qryInsereAvalistaNOME: TStringField;
      qryInsereAvalistaORIGEMREND: TStringField;
      qryInsereAvalistaRENDACOMP: TFloatField;
      qryInsereAvalistaMARGEMCONSIG: TFloatField;
      qryInsereAvalistaCPF: TStringField;
      qryInsereAvalistaTRGDTINCLUSAO: TDateTimeField;
      qryInsereAvalistaTRGUSERINCLUSAO: TStringField;
      updInsereAvalista: TUpdateSQL;
      qryBuscaPlanoContabil: TwwQuery;
      qryBuscaPlanoContabilIDPLANOPREV: TFloatField;
      qryBuscaPlanoContabilIDPLANPREVC: TFloatField;
      qryBuscaPlanoContabilPLANO_PREV: TStringField;
      qryBuscaPlanoContabilENTIDADE_CONTABIL: TStringField;
      qryContratosAnterioresVLRULTPARCELA: TFloatField;
      qryContratoQuitavel: TwwQuery;
      qryContratoQuitavelFLOBRIGATORIO: TFloatField;
      qryContratosAnterioresFLGOBRIGATORIO: TFloatField;
      qryContratosAnterioresFLGSITUACAO: TStringField;
      qryTipoContratoFLGNAOVERIFICAMRGPCL: TFloatField;
      qryTipoContratoFLGVERIFICAITEMABERTO: TFloatField;
      qryContratosAnteriores2VLREMABERTO: TFloatField;
      qryContratosAnteriores2BKP: TwwQuery;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      Label5: TLabel;
      btMudaPrazoSuspensao: TBitBtn;
      pnSuspParc: TPanel;
      rgSuspParc: TRadioGroup;
      edtValorParcSusp: TRealEdit;
      Label36: TLabel;
      edtPrazoSuspensao: TEdit;
      btnLimpaSuspensao: TBitBtn;
      qryAux: TwwQuery;
      chkLiquidoZero: TCheckBox;
      qryContratosAnterioresTXJUROS: TFloatField;
      qryContratosAnterioresFLGPERDAEFETIVA: TFloatField;
      QryBuscaContrato: TwwQuery;
      QryBuscaContratoFLGPERDAEFETIVA: TFloatField;
      QryBuscaContratoIDPESSOA: TFloatField;

      qryVerificaAmortizacao: TwwQuery;
      qryVerificaAmortizacaoIDCONTRATOEMPTMO: TFloatField;
      qryVerificaAmortizacaoFLGENVIO: TFloatField;
      qryVerificaAmortizacaoHMEDATAPREVISTA: TDateTimeField;
      procedure CmeCadastroFind(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure sbtnCancelarClick(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBedtValorSolicExit(Sender: TObject);
      procedure bbtnSimulaClick(Sender: TObject);
      procedure bbtnContratoClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure DBspeParcelasExit(Sender: TObject);
      procedure DBedtDataInscExit(Sender: TObject);
      procedure edtDataAssinaturaExit(Sender: TObject);
      procedure edtDataCreditoExit(Sender: TObject);
      procedure DBedtDataInscEnter(Sender: TObject);
      procedure edtDataAssinaturaEnter(Sender: TObject);
      procedure sbtnImprimirClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBrdgCreditoChange(Sender: TObject);
      procedure DBrdgDebitoChange(Sender: TObject);
      procedure DBspeParcelasEnter(Sender: TObject);
      procedure DBgrdDivEmpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdDivEmpTopRowChanged(Sender: TObject);
      procedure btnIncluirQuitarClick(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdItensConcessaoTopRowChanged(Sender: TObject);
      procedure DBedtValorSolicEnter(Sender: TObject);
      procedure DBrdgCreditoExit(Sender: TObject);
      procedure DBrdgDebitoExit(Sender: TObject);
      procedure sbtnExcluiAvalClick(Sender: TObject);
      procedure sbtnInsAvalClick(Sender: TObject);
      procedure sbtnNovoAvalClick(Sender: TObject);
      procedure qryAfterOpen(DataSet: TDataSet);
      procedure qryAvalistaBeforeClose(DataSet: TDataSet);
      procedure sbtnNovoBenefClick(Sender: TObject);
      procedure sbtnExcluiBenefClick(Sender: TObject);
      procedure qryBenefSeguroBeforeClose(DataSet: TDataSet);
      procedure sbtnInsereBenefClick(Sender: TObject);
      procedure bbtnOkDetBenefClick(Sender: TObject);
      procedure bbtnCancelarDetBenefClick(Sender: TObject);
      procedure sbtnAlteraBenefClick(Sender: TObject);
      procedure dsBenefSeguroStateChange(Sender: TObject);
      procedure dsStateChange(Sender: TObject);
      procedure btnAlteraSalarioBaseClick(Sender: TObject);
      procedure DBEdtSalarioBaseExit(Sender: TObject);
      procedure btnAlteraMargemClick(Sender: TObject);
      procedure DBEdtMargemExit(Sender: TObject);
      procedure btnAlteraVlrMaxClick(Sender: TObject);
      procedure DBEdtVlrMaxPermitExit(Sender: TObject);
      procedure DBEdtSalarioBaseEnter(Sender: TObject);
      procedure DBEdtMargemEnter(Sender: TObject);
      procedure edtDataCreditoCloseUp(Sender: TObject);
      procedure edtDataCreditoKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure DBrdgCreditoEnter(Sender: TObject);
      procedure chkExcepcionalClick(Sender: TObject);
      procedure DBcboSuspensaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure bbtnSairClick(Sender: TObject);
      procedure DBspeParcelasAfterDownClick(Sender: TObject);
      procedure rdgMargemConsignavelClick(Sender: TObject);
      procedure dbEdtMargemAltExit(Sender: TObject);
      procedure qryContratosAnterioresAfterScroll(DataSet: TDataSet);
      procedure btMudaPrazoSuspensaoClick(Sender: TObject);
      procedure rgSuspParcClick(Sender: TObject);
      procedure rgSuspParcExit(Sender: TObject);
      procedure edtValorParcelaChange(Sender: TObject);
      procedure btnLimpaSuspensaoClick(Sender: TObject);
      procedure chkLiquidoZeroClick(Sender: TObject);
      procedure edtDataCreditoChange(Sender: TObject); // Monica Gonzaga - SOL156456


   private  // Private declarations

      sArq                 : String;

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      Fiario               : TFiario;

      iQtdEPQuitado        : Integer;

      FNumParcelas         : Int64;
      FVlrSolic            : Currency;

      bLimites             : Boolean;
      bContratoValido      : Boolean;
      bCancelaInscricao    : Boolean;
      bObrigaBeneficiario  : Boolean;

      bNumParcPaga         : Boolean;

      bDesabilitouContrato : Boolean;

      dDataCredito         : TDateTime;
      dDataInscricao       : TDateTime;
      dDataAssinatura      : TDateTime;
      dDataUltAtualiza     : TDateTime;
      dDataFinalBeneficio  : TDateTime;

      fParcelaAnt          : Double;
      rNovoContrato        : TDadosContrato;
      rContratoAnterior    : TDadosContrato;
      rConcessao           : TDadosConcessao;


      vListaContratoXBenefSeg : TListaContratoXBenefSeg;

      vLista               : TListaItem;
      vListaQuitacao       : TListaItem;

      vDividasAnteriores   : array of Extended;

      fSalParticipacao     : Currency;
      fSalMantido          : Currency;
      fSalAuxDoenca        : Currency;
      fSalBenef            : Currency;

      fVlrDevSeg           : Currency;
      fVlrSeguroAnt        : Currency;
      fVlrSeguroComplAnt   : Currency;

      iNumParcPagas        : Integer;
      iPrazoAnterior       : Integer;
      iUltParcGerada       : Integer;
      iTipoContrAnt        : Integer;

      iTipoSuspAnterior    : Integer;


      iTotSiafi            : Integer;

      iIDAvalista          : Int64;

      fVlrSalarioAnt       : Currency;
      fVlrMargemAnt        : Currency;

      fVlrSalBase          : Currency;
      fVlrMargem           : Currency;
      fVlrMaxPermit        : Currency;

      fSalario             : Currency;
      fMargem              : Currency;
      fValMax              : Currency;

      sFormaCredAnt        : String;

      bTrocouSalario       : Boolean;
      bTrocouMargem        : Boolean;
      bTrocouValMax        : Boolean;
      bTrocouDataCred      : Boolean;
      bDigitouDataCred     : Boolean;

      fVlrEmAberto         : Currency;
      fVlrTotalAberto      : Currency;

      fVlrAnterior         : Currency;
      bRegraErro           : Boolean;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;

      iPrograma            : Integer;
      iMoedaCorrente       : Integer;
      sCCusto              : String;

      aListaContratos      : Array of String;

      bTransacaoAnterior   : Boolean;

      fVlrTotalDividas     : Currency;

      iIDBenefSeguro       : Int64;
      sNomeBenefSeguro     : String;

      dDataFinalSuspensao  : TDateTime;
      dDataSuspAnterior    : TDateTime;

      iIDTipoSuspEmptmo    : Integer;    // SOL:108099 Daniel Begnami
      b_btnIncluirQuitarClick : Boolean; // SOL 123381 - Daniel Begnami - Verifica se foi clicado pelo usuário
      sPerdaEfetiva : Integer;

      

      procedure AbreQueries;
      procedure AbreQueriesCredito;
      procedure AbreQueriesDebito;
      procedure AbreQueriesBanco;
      procedure AbreQueriesTipoContrato;
      procedure AbreParametrosSistema;
      procedure AcertaEdits(bNoInsert: Boolean = True);

      procedure FechaCancelamento;
      procedure Sel(i: Extended);
      procedure SetNumParcelas;
      procedure SetTxJuros;
      procedure SetParcelas(Num: Int64);
      function  Simulacao: Boolean;
      // Thiago Melo SOL 183326 Kintana 1712188
      procedure CalculaParcela (flModo : SmallInt);
      //
      procedure AcertaDatas;
      procedure BuscaValorLiquidoEP;
      procedure PreencheDadosContrato(iNumParcela : Integer);

      procedure AtivaContrato;

      procedure AcertaDataPrimParcela;
      procedure AtualizaPaineisCredito;
      procedure SetValorSolic(const Valor: Currency);
      //Pendência 24901 - 14/04/2007 - Alberto - Padrão 16
      procedure SetValorMargem(const Valor: Currency);
      procedure SetValorMaxPermit(const Valor: Currency);
      //Fim Pendência 24901
      procedure AbreQueriesDividas;
      procedure VerificaQuitacao(Sender: TSpeedButton);
      procedure CalculaEPAnterior;

      function ContabilizaContrato(const iContrato        : Extended;
                                         sMensagem        : String;
                                         sTipoMov         : String;
                                   var   iPlanilhaResult  : Integer;
                                   var   sResult          : TStringList;
                                   var   sErro            : TStringList
                                  ): Integer;

      function EnviaContratoCAPCAR(var   iPlanilha    : Integer;
                                   const sNomePatro   : String;
                                   var   sResult      : TStringList;
                                   var   sErro        : TStringList
                                  ): Integer;

      procedure Imprime;
      procedure VerificaImpressaoContrato;
      procedure VerificaImpressaoInscricao;

      function  AtualizaSaldoVerba(bAtualiza: Boolean): Boolean;
      //Pendência 27232 - 16/04/2008
      //function  ExistemItensEmAberto(var fVlrEmAberto: Currency): Boolean;

      function  EhUltimoDiaUtilMes(dDataVerificacao: TDateTime): Boolean;

      function  PossuiAssinatura(const IDPessoa          : Extended;
                                 const IDBenef           : Extended;
                                 const IDTipoContrEmptmo : Int64
                                ): Boolean;

      function  VerificaBeneficiario: Integer;
      function  VerificaObrigatoriedadeAvalista: Boolean;
      function  CriticaPercentuaisBeneficiarios: Boolean;

      // André Pontes - 22/12/2003 - FUNCEF
      function  PermiteQuitacao(const IDTipoContr : Integer;
                                const IDTipoQuit  : Integer
                               ): boolean;
      // FIM André Pontes - 22/12/2003 - FUNCEF

      // -------------------------------------------------------------------------------------------
      function  VerificaSuspensao(IDTipoContrEmptmo: Int64;var bExisteSusp:Boolean): Boolean;

      function  PossuiSuspensaoConcessao(iIDPessoa: Int64): Boolean;

      //BRUNO AZEVEDO - VOTO DE EMPRESTIMO
      //function RetornaFlagPerdaEfetiva(sIDMatricula: Int64): Integer;
      //BRUNO AZEVEDO - VOTO DE EMPRESTIMO
      
      function  DataFinalSuspensao: TDateTime;

      function  TestaSuspensao: Boolean;
      procedure CalculaQuitacaoContratoAnterior;

      function PrimeiraRenovacao2006: Boolean;

      // -------------------------------------------------------------------------------------------

      // Marchetti - Pendencia 23647
      function VerificaCarenciaPorContratosQuitaveis : Boolean;
      // Fim Marchetti - Pendencia 23647


      //Pendência 23733 - 19/12/2006 - Alberto
      function ValidaTipoContratoEmprestimo(qryContratosAnteriores: TQuery;
                                            iIDPESSOA,
                                            iIDBENEF,
                                            iIDTIPOCONTRATOEMPTMO,
                                            iIDREGRATIPOCONTR    : Integer
                                           ) : Boolean;
      //Fim Pendência 23733


      // Marchetti - Pendencia 26318
      //Pendência 27232 - 16/04/2008
      //function TipoContratoPermitidoParaConcessao : Boolean;
      // Fim Marchetti - Pendencia 26318

      // Marchetti - Pendencia 26614
      function CalculaValoresAposMarcarParaQuitacao : Boolean;
      // Fim Marchetti - Pendencia 26614


      // SOL:108099 Daniel Begnami
      procedure CriaPanelSuspParc(pNumParcela : Integer);
      function  CalculaDTSuspParc(pQtdeMesesSusp : Integer ; pDataPrimParcela : TDate) : TDate;
      function  CalculaVLSuspParc(pPrestacaoBasica : Currency) : Currency;
      // FIM


   public   // Public declarations

      vPrazo : array of Integer;
      bTemAmortizacaoNaoEnviada : boolean; // Wiliam Santana SOL 196724 Kintana 1899039

      property  IDAvalista      : Int64      read iIDAvalista        write iIDAvalista;
      property  NumParcelas     : Int64      read FNumParcelas       write SetParcelas;
      property  VlrSolic        : Currency   read FVlrSolic          write SetValorSolic;
      property  IDBenefSeguro   : Int64      read iIDBenefSeguro     write iIDBenefSeguro;
      property  NomeBenefSeguro : String     read sNomeBenefSeguro   write sNomeBenefSeguro;

      //Pendência 24901 - 14/04/2007 - Alberto - Padrão 16
      property  VlrMargem       : Currency   read fVlrMargem         write SetValorMargem;
      property  VlrMaxPermit    : Currency   read fVlrMaxPermit      write SetValorMaxPermit;
      //Fim Pendência 24901

      procedure SelecionaMutuarioParaInscricao(const iMutuario        : Int64;
                                               const iTitular         : Int64;
                                               const iInscricaoPrev   : Int64;
                                               const iPatro           : Int64;
                                               const iPlanoPrev       : Int64;
                                               const iSitPart         : Int64;
                                               const sNomeMutuario    : String;
                                               const sPlanoPrev       : String;
                                               const sPatro           : String;
                                               const sMatricula       : String;
                                               const sSituacao        : String;
                                               const sFlgInterno      : String;
                                               const sCPF             : String;
                                               const sCPFTitular      : String;
                                               const sNomeTitular     : String;
                                               const sMatriculaTitular: String;
                                               const iOrigem          : Integer
                                              );

      function VerificaExPlaContabil(StrExPlaContabilBloq : string; StrExPlaContabilPessoa : string): Boolean;

      function VerificaAmortizacao : Boolean; // TADEU PASSOS SOL 196724 Kintana 1899039



   end;



var
   frmCadInscricao: TfrmCadInscricao;



implementation
{$R *.DFM}
uses
   DLookEmptmo, dAtualizacaoDiaria, UMensErro, URegra, USistema, dEmptmo, ppTypes,
   uDiasUteis, FProgresso, uVerificaPreenchimento, UIntegraEmptmo, RSimula, dRelatoriosUsu,
   UCalcEmptmo, DBaseDados, FPessoaFiador, dMS, dRelInscricao, fImpressaoContrato,
   FMostraSuspensaoConcessao, FExecBuscaSolicitante, uObjetoVerba, fImpressaoInscricao,
   fPrazoSimula, DDividaEP, FCadBenefSeguro, uLancContab, uIntegraModulo,
   FNup;




procedure TfrmCadInscricao.SelecionaMutuarioParaInscricao(const iMutuario        : Int64;
                                                          const iTitular         : Int64;
                                                          const iInscricaoPrev   : Int64;
                                                          const iPatro           : Int64;
                                                          const iPlanoPrev       : Int64;
                                                          const iSitPart         : Int64;
                                                          const sNomeMutuario    : String;
                                                          const sPlanoPrev       : String;
                                                          const sPatro           : String;
                                                          const sMatricula       : String;
                                                          const sSituacao        : String;
                                                          const sFlgInterno      : String;
                                                          const sCPF             : String;
                                                          const sCPFTitular      : String;
                                                          const sNomeTitular     : String;
                                                          const sMatriculaTitular: String;
                                                          const iOrigem          : Integer
                                                          );
begin
   if iOrigem = 2 then
   begin
      if not(CmeCadastro.Operacao in [opIdle, opVazio]) then CmeCadastro.Cancel(self);

      sbtnInserir.Down           := True;

      CmeCadastro.Operacao       := opInserir;
      CmeCadastro.RepetirInsert  := True;

      CmeCadastro.AtualizaBotoes(Self);

      // Marchetti - Pendencia 27849
      Toolbar971.Visible := False;
      // Fim Marchetti - Pendencia 27849

   end;

   // abre a query principal contendo zero registros
   Sel(-1);

   qry.Insert;

   AbreQueries;

   LimpaParametros(qryResponsavel);
      qryResponsavel.ParamByName('iIDPessoa').AsInteger := iTitular;
      qryResponsavel.ParamByName('iIDBenef').AsInteger  := iMutuario;
      qryResponsavel.Open;

   qryIDINSCRICAOEMPTMO.AsFloat                    := LeUltRegistro(nil, 'INSCRICAOEMPTMO');
   qryDESCSITINSCRICAO.AsString                    := 'Ativa';
   qryBENEFICIARIO.AsString                        := sNomeMutuario;
   qryINSCRICAONUMERO.AsInteger                    := iInscricaoPrev;
   qrySITUACAO.AsString                            := sSituacao;
   qryPLANO.AsString                               := sPlanoPrev;

   if iPlanoPrev > 0 then qryIDPLANOPREV.AsInteger := iPlanoPrev;
   qryPATRO.AsString                               := sPatro;
   if iPatro > 0     then qryIDPATRO.AsInteger     := iPatro;
   qryMATRICULA.AsString                           := sMatricula;
   qryTITULAR.AsString                             := sNomeTitular;
   qryIDPESSOA.AsInteger                           := iTitular;
   qryIDBENEF.AsInteger                            := iMutuario;
   if iSitPart > 0   then qryIDSITPART.AsInteger   := iSitPart;
   qryFLGINTERNO.AsString                          := sFlgInterno;

   qryIDResponsavel.Clear;
   if not(qryResponsavel.IsEmpty) and
      not(qryResponsavelIDRESPONSAVEL.IsNull) and
      (qryResponsavelIDRESPONSAVEL.AsInteger <> iMutuario) and
      (qryResponsavelIDRESPONSAVEL.AsInteger <> iTitular) then
   begin
      qryIDResponsavel.AsInteger                   := qryResponsavelIDRESPONSAVEL.AsInteger;
   end;

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
      (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger)        and
      (qryFLGINTERNO.AsString = 'CA')                        then
   begin
      qrySITUACAO.AsString := 'Pensionista';
   end;

   qryCPF.AsString            := sCPF;
   qryCPF_TIT.AsString        := sCPFTitular;
   qryMATRICULA_TIT .AsString := sMatriculaTitular;

   qryFLGSUSPENSAOAUTO.AsInteger    := 0;

   // Procedimento que usa a Função ParametrosSistema e torna visíveis os painéis de Crédito e Débito
   AbreParametrosSistema;

   // Verifica se o Participante é Cancelado, isto é se o Beneficiário será um pensionista para obrigar o seu Preenchimento
   if qryFLGINTERNO.AsString = 'CA' then
   begin
      bObrigaBeneficiario     := True;
   end
   else
   begin
      bObrigaBeneficiario     := False;
   end;

   // Situação da Inscrição = 'A' -> 'Ativa'
   qryFLGSITUACAO.AsString    := 'A';
   qryFLGPENDENTE.AsString    := 'N';

   // Datas de Inscrição e Assinatura NÃO PODEM ser futuras
   DBedtDataInsc.MaxDate      := Trunc(SysDate);
   edtDataAssinatura.MaxDate  := Trunc(SysDate);
   qryDATAINSC.AsDateTime     := Trunc(SysDate);
   edtDataAssinatura.Date     := Trunc(SysDate);


   // Acerta as datas de Crédito e Primeira Parcela, usando BuscaDatas,
   // trazendo as datas parametrizadas no Sistema
   AcertaDatas;

   AbreQueriesTipoContrato;

   qryMOECODIGO.AsInteger    := qryTipoContratoMOECODIGO.AsInteger;

   AbreQueriesBanco;    // dados bancarios
   AbreQueriesCredito;  // parâmetros para integração (a pagar)
   AbreQueriesDebito;   // parâmetros para integração (a receber)

   if iOrigem = 2 then CmeCadastro.AtualizaBotoes(Self);
end;



procedure TfrmCadInscricao.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404

   ParametrosSistema;

   // Marchetti - Pendencia 26402
   // O label original de margem consgnável está por baixo do radiobutton de margem consignável
   lblMargemConsignavel.Visible := dtmEmptmo.qryParamEmptmoFLGUSAMARGEMALT.AsInteger = 0;
   rdgMargemConsignavel.Visible := dtmEmptmo.qryParamEmptmoFLGUSAMARGEMALT.AsInteger = 1;
   rdgMargemAlt.Visible         := dtmEmptmo.qryParamEmptmoFLGUSAMARGEMALT.AsInteger = 1;
   dbEdtMargemAlt.Visible       := dtmEmptmo.qryParamEmptmoFLGUSAMARGEMALT.AsInteger = 1;
   // Fim Marchetti - Pendencia 26402


   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      chkExcepcional.Checked     := False;
      chkExcepcional.Visible     := True;

      chkFinanciamento.Checked   := False;
      chkFinanciamento.Visible   := True;

      // André Pontes - 17/01/2005 - A pedido de Luciana
      if (Sistema.IDModulo <> 15) then
      begin
         chkExcepcional.Enabled     := False;
         chkFinanciamento.Enabled   := False;
         DBedtDataInsc.Enabled      := False;
         edtDataAssinatura.Enabled  := False;
         edtDataCredito.Enabled     := False;
         bbtnConfirmar.Visible      := False;
      end;
      // FIM André Pontes - 17/01/2005 - A pedido de Luciana

      lblDescontos.Visible       := True;
      edtOutrosDescontos.Visible := True;

      lblLimiteDisp.Visible      := False;   // "sumido" a pedido de Luciana e Ricardo Bobrov
      edtLimiteDisp.Visible      := False;   // "sumido" a pedido de Luciana e Ricardo Bobrov
   end
   else
   begin
      chkExcepcional.Checked     := False;
      chkExcepcional.Enabled     := False;
      chkExcepcional.Visible     := False;

      chkFinanciamento.Checked   := False;
      chkFinanciamento.Enabled   := False;
      chkFinanciamento.Visible   := False;

      lblDescontos.Visible       := False;
      edtOutrosDescontos.Visible := False;

      lblLimiteDisp.Visible      := False;
      edtLimiteDisp.Visible      := False;
   end;

   pnlRecebimento.Visible  := (dtmEmptmo.qryParamEmptmoFLGCONTROLAINSC.AsInteger = 1);

   Fiario                  := TFiario.Create;
   pgcValores.ActivePage   := tbsGeral;

   DBspeParcelas.Clear;

   bCancelaInscricao       := False;

   // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
   //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
   //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox

   AtualizaConjunto(True, pnlRecebimento);
   AtualizaConjunto(False, pnlCAP);
   AtualizaConjunto(False, pnlCAR);
end;



procedure TfrmCadInscricao.FormActivate(Sender: TObject);
begin
   inherited;

   DBedtDataInsc.ButtonWidth         := 21;
   edtDataCredito.ButtonWidth        := 21;
   edtDataAssinatura.ButtonWidth     := 21;
   edtDataPrimParcela.ButtonWidth    := 21;
   DBedtDtrecebimento.ButtonWidth    := 21;

   WindowState := wsMaximized;
end;



procedure TfrmCadInscricao.AbreQueries;
begin
   dtmLookEmptmo.qryLookMoeda.Open;
end;



procedure TfrmCadInscricao.AbreQueriesTipoContrato;
begin
   // Procedure que abre a query para a escolha do Tipo de Contrato/Empréstimo
   with qryTipoContrato do
   begin
     LimpaParametros(qryTipoContrato);
     ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;

     //Pendência 23060 - 11/08/2006 - Alberto
     ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
     //Fim Pendência 23060

     //Pendência 25971 - 27/07/2007 - Alberto
        ParamByName('PIDPLANOPREV').AsInteger := qryIDPLANOPREV.AsInteger;
     //Fim Pendência 25971

     Open;
   end;  // with qry

   // Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados
   AcertaEdits;
end;



procedure TfrmCadInscricao.AbreQueriesBanco;
begin
   dtmLookEmptmo.qryLookDadosBancarios.Close;
   LimpaParametros(dtmLookEmptmo.qryLookDadosBancarios);
   dtmLookEmptmo.qryLookDadosBancarios.ParamByName('PIDPESSOA').AsInteger := qryIDBENEF.AsInteger;
   dtmLookEmptmo.qryLookDadosBancarios.Open;
end;


// Procedure que abre as queries utilizadas quando o Crédito do Empréstimo será pelo CAP
procedure TfrmCadInscricao.AbreQueriesCredito;
begin
   with dtmLookEmptmo do
   begin
      with qryLookPortadorFormaP do
      begin
         LimpaParametros(qryLookPortadorFormaP);
         ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
         Open;
      end;  // with qryLookPortadorFormaP

      with qryLookFormaRecPag do
      begin
         LimpaParametros(qryLookFormaRecPag);
         ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
         ParamByName('PRECPAG').AsString    := 'P';
         Open;
      end;  // with qryLookFormaRecPag
   end;  // with dtmLookEmptmo
end;



// Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR 
procedure TfrmCadInscricao.AbreQueriesDebito;
begin
   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TfrmCadInscricao.AbreQueriesDividas;
var
   i : Integer;
begin
   // Procedure que abre a query que busca os Contratos Ativos do Participante
   with qryOutrasDividas do
   begin
      LimpaParametros(qryOutrasDividas);
      ParamByName('PIDPESSOA').AsInteger      := qryIDBENEF.AsInteger;
      ParamByName('PDATAPREVISAORECE').AsDate := edtDataCredito.Date;
      Open;

   end;

   // ----------------------------------------------------------------------------------------------

   qryContratosAnteriores2.Close;
   if (dtmEmptmo.qryParamemptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin

      //Pendência 27232 - 16/04/2008
      //if StrToInt(DBcboTipoContrato.LookupValue) in [11, 12, 13, 14, 15, 16, 19, 20] then
      //Fim Pendência 27232

      // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
      //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) then
      //begin
      // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979

         with qryContratosAnteriores2 do
         begin
            LimpaParametros(qryContratosAnteriores2);

            ParamByName('PIDPESSOA').AsInteger     := qryIDPESSOA.AsInteger;
            ParamByName('PIDBENEF').AsInteger      := qryIDBENEF.AsInteger;

            if dtmEmptmo.qryParamEmptmoFLGPENDCONCESSAO.AsInteger = 0 then
            begin
               ParamByName('PHMEDATA').AsDate      := edtDataCredito.Date;
            end
            else
            begin
               ParamByName('PHMEDATA').AsDate      := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(edtDataCredito.Date), DiasUteis.ExtraiMes(edtDataCredito.Date));
            end;

            Open;
         end;
      //end;
   end;

   // ----------------------------------------------------------------------------------------------
   qryContratosAnteriores.open;
   with qryContratosAnteriores do
   begin
      LimpaParametros(qryContratosAnteriores);

      if (dtmEmptmo.qryParamEmptmoFLGPENDCONCESSAO.AsInteger = 0) then
      begin
         ParamByName('PHMEDATA').AsDate      := edtDataCredito.Date;
      end
      else
      begin
         ParamByName('PHMEDATA').AsDate      := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(edtDataCredito.Date), DiasUteis.ExtraiMes(edtDataCredito.Date));
      end;

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger = 1) then
      begin

         // Indica que só
         ParamByName('PQUITAVEL').AsInteger           := 1;
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);
      end;

      ParamByName('PHMEDATAATUALIZA').AsDate := edtDataCredito.Date;

      // -------------------------------------------------------------------------------------------
      // André Pontes - 01/07/2005
      // ATENÇÃO !!!
      // A data de
      // atualização deve ser a última do mês para TODAS as fundações que não trabalhem
      // com atualização diária do saldo devedor. Não fazer isso pode "esconder" um contrato ativo
      // concedido para o mesmo mês (que só terá saldo no último dia do mês - parâmetro), resultando
      // em mais de um contrato ativo

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.asInteger <> 1 then
      begin
         ParamByName('PHMEDATAATUALIZA').AsDate := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(edtDataCredito.Date),
                                                                       DiasUteis.ExtraiMes(edtDataCredito.Date));
      end;
      // FIM André Pontes - 01/07/2005
      // -------------------------------------------------------------------------------------------

      ParamByName('PIDPESSOA').AsInteger     := qryIDPESSOA.AsInteger;
      ParamByName('PIDBENEF').AsInteger      := qryIDBENEF.AsInteger;
      ParamByName('PIDTIPOEMPTMO').AsInteger := qryTipoContratoIDTIPOEMPTMO.AsInteger;
      Open;

      if IsEmpty then
      begin
         btnIncluirQuitar.Enabled := False;
      end
      else
      begin
         btnIncluirQuitar.Enabled := True;

         // André Pontes - 13/01/2004
         // Passados para as regras de concessão apenas dos dados dos contratos efetivamente
         // marcados para quitação
         iNumParcPagas  := 0;
         iPrazoAnterior := 0;
         iUltParcGerada := 0;
         iTipoContrAnt  := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;

         First;
         while not(EOF) do
         begin
            //Pendência 26916 - 22/12/2007
            if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) {or
               //Pendência 23429 - 28/09/2006 - Alberto
               (qryContratosAnteriores.RecordCount = qryTipoContratoTCEMAXCONTRATO.AsInteger)} then
               //Fim Pendência 23429

            begin
               iNumParcPagas  := qryContratosAnterioresNUMPARCPAGAS.AsInteger;
               iPrazoAnterior := qryContratosAnterioresNUMPARCELAS.AsInteger;
               iUltParcGerada := qryContratosAnterioresULT_PARC.AsInteger;
               iTipoContrAnt  := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;

            end;


            Next;
         end;
         // FIM André Pontes - 13/01/2004
      end;

   end;  // with qryContratosAnteriores

   // Como o vetor ainda está vazia, não há o que retirar do vetor
   btnRetirarQuitar.Enabled := False;

   // Limpando o vetor que armazenará o ID do Contrato que será quitado
   vDividasAnteriores := nil;

   // Dimensionando o Array Dinâmico com o número máximo de Contratos
   //Pendência 23429 - 28/09/2006 - Alberto

 //SOL125649 - Ádler Souza
   //SetLength(vDividasAnteriores, qryTipoContratoTCEMAXCONTRATO.AsInteger);

   if (qryTipoContratoTCEMAXCONTRATO.AsInteger < qryContratosAnteriores.RecordCount) then
     SetLength(vDividasAnteriores, qryContratosAnteriores.RecordCount)
   else
     SetLength(vDividasAnteriores, qryTipoContratoTCEMAXCONTRATO.AsInteger);
 //Fim - SOL125649 - Ádler Souza

   //Fim Pendência 23429

   // atribuindo o valor zero para todos os elementos do vetor
   for i := 0 to High(vDividasAnteriores) do vDividasAnteriores[i] := 0;

   // Zero a variável que armazenará quantos EP anteriores estão sendo quitados
   iQtdEPQuitado := 0;
end;



procedure TfrmCadInscricao.AcertaEdits(bNoInsert: Boolean = True);
begin
   // Procedure que acerta os Edits das Datas que não são data-aware

   edtValMargem.Value       := 0;
   edtValReserva.Value      := 0;
   edtPercentJuros.Value    := 0;
   edtValorParcela.Value    := 0;
   edtSaldoaQuitar.Value    := 0;
   edtLimiteDisp.Value      := 0;
   edtOutrosDescontos.Value := 0;
   edtLiquidoGeral.Value    := 0;
   edtTotalParcelas.Value   := 0;
   edtTotalPendencias.Value := 0;
   edtQuitacao.Value        := 0;
   edtQuitacaoDividas.Value := 0;

   iNumParcPagas            := 0;
   iPrazoAnterior           := 0;
   iUltParcGerada           := 0;

   fVlrSalBase              := 0;
   fVlrMargem               := 0;
   fVlrMaxPermit            := 0;
   fVlrTotalDividas         := 0;
   fVlrTotalAberto          := 0;

   vListaQuitacao           := nil;
   vLista                   := nil;
   vListaContratoXBenefSeg  := nil;

   if bNoInsert then chkExcepcional.Checked   := False;
   if bNoInsert then chkFinanciamento.Checked := False;

   edtDataFinalSuspensao.Clear;

   if TRIM(qryDATAINSC.AsString) <> EmptyStr then
   begin
      // Procedimento que acerta as Datas de Crédito, Data da Primeira Parcela e
      //   Calcula a Carência utilizando a função BuscaData da unit UCalcEmptmo
      AcertaDatas;
   end
   else
   begin
      edtCarencia.Clear;
      edtDataCredito.Clear;
      edtDataAssinatura.Clear;
      edtDataPrimParcela.Clear;
   end;

   qryContratosAnteriores.Close;
   qryItensConcessao.Close;

   if bNoInsert then dtmLookEmptmo.qryLookTipoSusp.Close;
   if bNoInsert then dtmLookEmptmo.qryLookDadosBancarios.Close;
   qryOutrasDividas.Close;

   edtDataFinalSuspensao.Clear;

   DBcboSuspensao.LookupValue := '';
   DBcboSuspensao.Clear;

   // SOL:108099 Daniel Begnami
   edtPrazoSuspensao.text := IntToStr(0);
   iIDTipoSuspEmptmo := -1;
   edtValorParcSusp.Value := 0;
   edtPrazoSuspensao.text := IntToStr(0);
   edtDataFinalSuspensao.clear;
   rgSuspParc.Items.Clear;
   // FIM

end;



procedure TfrmCadInscricao.Sel(i: Extended);
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDINSCRICAOEMPTMO').AsFloat    := i;
      ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TfrmCadInscricao.AbreParametrosSistema;
begin
   // Procedimento que usa a Função ParametrosSistema e torna visíveis os painéis de Crédito e Débito

   // Chama a função ParametrosSistema da unit UFuncoesEmptmo que abre a tabela
   //   PARAMEMPTMO. Esta função retorna False se a tabela estiver vazia
   if ParametrosSistema then
   begin
      // Serão utilizados os Parâmetros definidos no Sistema

      if qry.State = dsInsert then
      begin
         // Na inserção usaremos os parâmetro defaults

         qryCODFORMAPAG.AsInteger  := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
         qryPORTFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger;

         // ----------------------------------------------------------------------------------------
         // Pendência 14654
         // Preenchimento do PortadorForma de Pagamento conforme BancoXPortForma

         with dtmEmptmo.qryBancoPortForma do
         begin
            LimpaParametros(dtmEmptmo.qryBancoPortForma);

            // Pendência 24376 - 22/02/2007 - Alberto
            AbreQueriesBanco;
            // Fim Pendência 24376

            ParamByName('PIDBANCO').AsInteger := dtmLookEmptmo.qryLookDadosBancariosIDBANCO.AsInteger;
            Open;

            if not(IsEmpty) then qryPORTFORMAPAG.AsInteger := dtmEmptmo.qryBancoPortFormaCODPORTFORMA.AsInteger;

            Close;
         end;

         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------


      end;  // if insert

   end
   else
   begin
      // A tabela Parâmetros do Sistema está vazia

      MsgDlg('Favor preencher os Parâmetros do Sistema.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;

      if qry.State = dsInsert then
      begin
         // Na inserção usaremos os parâmetros default
         qryFLGFORMAPAG.AsString := 'C';
         qryFLGFORMAREC.AsString := 'C';
      end;

   end; // if ParametrosSistema

   if qry.State in dsEditModes then
   begin
      qryPORTFORMAREC.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsInteger;
   end;

   if qryFLGFORMAREC.AsString = 'C' then
   begin
      // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox
      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin
      AtualizaConjunto(False, pnlCAR, False);
   end;

   // Verifico se pode imprimir a Inscrição
   if dtmEmptmo.qryParamEmptmoFLGIMPRIMEINSC.AsInteger = 0 then
   begin
      // NÃO pode imprimir a Inscrição, só o contrato
      sbtnImprimir.Enabled := False;
   end
   else
   begin
      // PODE imprimir a Inscrição
      sbtnImprimir.Enabled := True;
   end;
end;



procedure TfrmCadInscricao.AtualizaPaineisCredito;
begin
   // Verifico se a Forma do Crédito do Empréstimo é Contas a Pagar.  Caso positivo
   // verifico se foi indicado o PortadorForma ou a Forma de Pagamento para fazer
   // visível o painel respectivo. Se a Forma do Credito é Folha desabilita todos
   // os painéis

   if qryFLGFORMAPAG.AsString = 'C' then
   begin
      // É Contas a Pagar
      if (qryPORTFORMAPAG.AsString  <> '') or (qryCODFORMAPAG.AsString <> '') then
      begin
         if qry.State in dsEditModes then
         begin
            qryPORTFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger;
         end;

         if qry.State in dsEditModes then
         begin
            qryCODFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
         end;

      end;  // if qryPORTFORMAPAG or ...

   end;  // if FLGFORMAPAG = 'P'
end;



procedure TfrmCadInscricao.CmeCadastroFind(Sender: TObject);
var
   iIdBenef   : integer;
   sDtCredito : String;
begin
   inherited;

   // redesenha o form na volta do MontaSelect
   Repaint;
   DBcboSuspensao.Enabled := True; //Renato Visoni SOL 121740  KINTANA 589485

   // se houve busca, abre a query principal com apenas o registro buscado
   if MontaSelect.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;
      iIdBenef := StrToInt(MontaSelect.ValoresChave[2]);
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

      try
         MostraEspera('Buscando dados da Inscrição...');

         // abre a query principal com o participante escolhido
         Sel(StrToFloat(MontaSelect.ValoresChave[0]));

         if (qryIDBENEF.AsInteger <> qryIDPESSOA.AsInteger) then
         begin
            LimpaParametros(qryResponsavel);
            qryResponsavel.ParamByName('iIDPessoa').AsInteger := qryIDPESSOA.AsInteger;
            qryResponsavel.ParamByName('iIDBenef').AsInteger  := qryIDBENEF.AsInteger;
            qryResponsavel.Open;
            if not(qryResponsavel.IsEmpty) then
               qryResponsavel.Locate('IDRESPONSAVEL', qryIDRESPONSAVEL.AsInteger,[]);
         end;

         // ----------------------------------------------------------------------------------------
         // Impedindo que o usuário altere a Data de inscrição para data posterior
         // Datas de Inscrição e Assinatura NÃO PODEM ser futuras
         DBedtDataInsc.MaxDate      := Trunc(SysDate);

         // Data de inscrição como data do Sistema e impedindo que o usuário
         //   altere para data posterior
         edtDataAssinatura.Date     := Trunc(SysDate);
         edtDataAssinatura.MaxDate  := Trunc(SysDate);

         // ----------------------------------------------------------------------------------------

         // Procedimento que usa a Função ParametrosSistema e torna visíveis os painéis de Crédito e Débito
         AbreParametrosSistema;

         // Procedimento que abre as queries de lookup
         AbreQueries;

         // Procedure que abre a query para a escolha do Tipo de Contrato/Empréstimo
         AbreQueriesTipoContrato;

         dbcboMoeda.LookupValue := qryTipoContratoMOECODIGO.AsString;

         // Procedure que abre as queries utilizadas para buscar a Conta Bancária
         AbreQueriesBanco;

         // Procedure que abre as queries utilizadas quando o Crédito do Empréstimo será pelo CAP
         AbreQueriesCredito;

         // Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR
         AbreQueriesDebito;

         // As inscrições já realizadas já passaram pela regra de Limites
         bLimites := True;

         // variável a ser passada por referência para a função SaldoDevEmp
         sDtCredito    := edtDataCredito.Text;

         // Procedure que abre a query que busca os Contratos Ativos do Participante
         AbreQueriesDividas;

         // Procedimento que armazena os dados da Inscrição num registro
         PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

         // Procedure que Calcula o Valor da Quitação para Empréstimos Anteriores
         CalculaEPAnterior;

         if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
         begin
            LimpaParametros(qryBenefSeguro);
            qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
            qryBenefSeguro.Open;
         end;

         SetNumParcelas;

         // inicializa as variáveis 
         fSalParticipacao  := 0;
         fSalMantido       := 0;
         fSalAuxDoenca     := 0;
         fSalBenef         := 0;
         fVlrSalBase       := 0;
         fVlrMargem        := 0;
         fVlrMaxPermit     := 0;

         if not(qryVLRMARGEM.IsNull) then    fVlrMargem     := qryVLRMARGEM.AsCurrency;
         if not(qryVLRMAXPERMIT.IsNull) then fVlrMaxPermit  := qryVLRMAXPERMIT.AsCurrency;

         // só calcula o salário-base se não houver salário-base já preenchido -
         //   para o caso de se ter alterado "na mão" o salário-base na inscrição
         if qryVLRSALBASE.IsNull then
         begin
            // Busca Salário Base do Participante
            if not(qryTipoContratoIDREGRASALBAS.IsNull) then
            begin
               fVlrSalBase := CalcEmptmo.BuscaSalarioBase(qryTipoContratoIDREGRASALBAS.AsInteger,
                                                          qryIDPESSOA.AsInteger,
                                                          qryIDBENEF.AsInteger,
                                                          fSalParticipacao,
                                                          fSalMantido,
                                                          fSalAuxDoenca,
                                                          fSalBenef,
                                                          True,
                                                          qryDATAINSC.AsDateTime
                                                          //Fanuel Junior SOL151964 Kintana1124438
                                                         ,qryIDTIPOCONTREMPTMO.AsInteger
                                                         //Pendência 22836 - 03/10/2006 - Alberto
                                                         ,0
                                                         ,chkExcepcional.Checked
                                                          //Fim Pendência 22836
                                                          ,qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 153259 KINTANA 1152177
                                                          );
               if fVlrSalBase = -1 then
               begin
                  Screen.Cursor := crDefault;
                  EscondeEspera;
                  MsgDlg('Não foi possível recuperar o salário base.', 'Empréstimo', mtError, [mbOk], 0);
                  Repaint;
                  bbtnCancelarClick(bbtnCancelar);
                  Exit;
               end;
            end;
         end
         else
         begin
            fVlrSalBase := qryVLRSALBASE.AsCurrency;
         end;

         // função da unit UCalcEmptmo que busca a Margem Consignável do participante
         edtValMargem.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                      qryIDBENEF.AsInteger,
                                                      qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                      fVlrSalBase,
                                                      edtTotalParcelas.Value,
                                                      edtTotalPendencias.Value,
                                                      fSalParticipacao,
                                                      fSalMantido,
                                                      fSalAuxDoenca,
                                                      fSalBenef,
                                                      True,
                                                      qryDATAINSC.AsDateTime,
                                                      qryNUMPARCELAS.AsInteger,

                                                      vDividasAnteriores,

                                                      chkFinanciamento.Checked,
                                                      //Pendência 22836 - 03/10/2006 - Alberto
                                                      0,
                                                      chkExcepcional.Checked,
                                                      //Fim Pendência 22836
                                                      DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                      edtDataCredito.Text, // Ádler Souza - SOL 131189 Kintana 744558
                                                      0, // Ádler Souza - SOL 75516 Kintana 523281
                                                      -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                      qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                     );

         fVlrMargem := edtValMargem.Value;

         // Ádler Souza  - SOL 144704 - KTN 968693
         {if fVlrMargem = -1 then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Não foi possível recuperar a margem consignável.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            bbtnCancelarClick(bbtnCancelar);
           Exit;
         end;}
         // Fim - Ádler Souza  - SOL 144704 - KTN 968693

         // Marchetti - Pendencia 26402
         if (rdgMargemAlt.Visible) and (not qryTipoContratoIDREGRAMARGEMALT.IsNull) then
         begin
            edtValMargemAlt.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                            qryIDBENEF.AsInteger,
                                                            qryTipoContratoIDREGRAMARGEMALT.AsInteger,
                                                            fVlrSalBase,
                                                            edtTotalParcelas.Value,
                                                            edtTotalPendencias.Value,
                                                            fSalParticipacao,
                                                            fSalMantido,
                                                            fSalAuxDoenca,
                                                            fSalBenef,
                                                            True,
                                                            qryDATAINSC.AsDateTime,
                                                            qryNUMPARCELAS.AsInteger,

                                                            vDividasAnteriores,
                                                            
                                                            chkFinanciamento.Checked,
                                                            //Pendência 22836 - 03/10/2006 - Alberto
                                                            0,
                                                            chkExcepcional.Checked,
                                                            //Fim Pendência 22836
                                                            DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                            edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                            0,  // Ádler Souza - SOL 75516 Kintana 523281
                                                            -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                            qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                           );
            if qry.State in dsEditModes then
               qryVLRMARGEMALT.AsCurrency := edtValMargemAlt.Value;
         end;
         // Fim Marchetti - Pendencia 26402

         edtSalParticipacao.Value   := fSalParticipacao;
         edtSalMantido.Value        := fSalMantido;
         edtSalAuxDoenca.Value      := fSalAuxDoenca;
         edtSalBenef.Value          := fSalBenef;

         // função da unit UCalcEmptmo que busca a Reserva de Poupança do participante
         //    ou do beneficiário, no caso do pensionista
         edtValReserva.Value := CalcEmptmo.BuscaReserva(qryIDBENEF.AsInteger, qryIDPATRO.AsInteger,
                                                        qryIDPLANOPREV.AsInteger,
                                                        qryTipoContratoIDREGRARESERVA.AsInteger,
                                                        qryDATAINSC.AsDateTime,
                                                        True
                                                        //Pendência 22836 - 03/10/2006 - Alberto
                                                       ,0
                                                       ,chkExcepcional.Checked
                                                        //Fim Pendência 22836
                                                       );


         if edtValReserva.Value = -1 then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Não foi possível recuperar a reserva de poupança.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            bbtnCancelarClick(bbtnCancelar);
            Exit;
         end;

         // Procedure que decide qual a Taxa de Juros que vai ser utilizada, busca o
         //   Valor Máximo Possivel para o Empréstimo e Calcula Parcela
         //   Pré-requisitos:  Reserva de Poupança igual a Zero ou Maior

         SetTxJuros;

         if qry.State in dsEditModes then
         begin
            qryVLRSALBASE.AsCurrency   := fVlrSalBase;
            qryVLRMARGEM.AsCurrency    := fVlrMargem;
            // Marchetti - Pendencia 26402
            qryVLRMARGEMALT.AsCurrency := edtValMargemAlt.Value; 
            // Fim Marchetti - Pendencia 26402
            qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
            edtLimiteDisp.Value        := qryVLRMAXPERMIT.AsCurrency - edtSaldoAQuitar.Value - fVlrTotalDividas;
         end;


         // Procedure que Calcula o Valor da parcela, verificando também se é atendida
         // a Regra de Limites e calculando o valor Líquido do Empréstimo

         // Thiago Melo SOL 183326 Kintana 1712188
         CalculaParcela(0);
         //

         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            // -------------------------------------------------------------------------------------
            if (iTotSiafi > 0) and
               not(chkExcepcional.Checked) and
               not(chkFinanciamento.Checked) then
            begin
               Screen.Cursor := crDefault;
               EscondeEspera;
               MsgDlg('Mutuário possui dívidas de Financiamento Habitacional. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            // -------------------------------------------------------------------------------------
            // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
            //Pendência 27232 - 16/04/2008
            //if (qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) and (qryContratosAnteriores2.Active) then
            //Fim Pendência 27232

            // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
            //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) and
               //(qryContratosAnteriores2.Active) then
            //begin
            // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979

            //Pendência 27232 - 16/04/2008
            if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
            begin

                  if (not chkExcepcional.Checked) and
                     (not ValidaTipoContratoEmprestimo(qryContratosAnteriores2,
                                                       qryIDPESSOA.AsInteger,
                                                       qryIDBENEF.AsInteger,
                                                       StrToInt(DBcboTipoContrato.LookupValue),
                                                       dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                                      )) then
            begin
                     //LogToFile('Contrato anterior do mesmo tipo', sArq);
                     //MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     LogToFile('Tipo de contrato em aberto impede contratação', sArq);
                     MsgDlg('Tipo de contrato em aberto impede contratação!', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;

               end;
               //Fim Pendência 23733

               qryContratosAnteriores2.First;
               while not(qryContratosAnteriores2.EOF) do
               begin

                  if not(chkExcepcional.Checked) then
                  begin
                     if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                                        True,
                                                        edtDataCredito.Date,
                                                        True,
                                                        StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                                        StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                                        // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                                        0
                                                       //Pendência 27232 - 16/04/2008
                                                       //) then
                                                       ) <> 0 then
                     begin
                        MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                        Repaint;
                        Exit;
                     end;
                  end;

                  //Pendência 27232 - 16/04/2008
                  {
                  // Marchetti - Pendencia 26318
                  if not(chkExcepcional.Checked) then
                  begin
                     if not TipoContratoPermitidoParaConcessao then
                     begin
                        MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                        Repaint;
                        Exit;
                     end;
                  end;
                  // Fim - Marchetti - Pendencia 26318
                  }

                  qryContratosAnteriores2.Next;
               end;
            //end;
            // -------------------------------------------------------------------------------------
         end;
         // ----------------------------------------------------------------------------------------

         qryAfterOpen(qry);   // Rotina Chamada para pegar os avalistas / beneficiários do seguro

      finally
         Screen.Cursor := crDefault;
         EscondeEspera;

         // habilita o PageControl Principal
         pgcValores.Enabled := ( DBcboTipoContrato.LookupValue <> '' );

         Repaint;
      end;  // try..finally

   end;  // if MontaSelect.RetornouValor
end;



procedure TfrmCadInscricao.CmeCadastroInsert(Sender: TObject);
var
   sPatro            : String;
   sPlanoPrev        : String;
   sSituacao         : String;
   iPatro            : Int64;
   iPlanoPrev        : Int64;
   iSitPart          : Int64;
   iIDBenef          : Int64;
   iIDPessoa         : Int64;
   iIDInscricaoPrev  : Int64;
   sNomeMutuario     : String;
   sMatricula        : String;
   sFlgInterno       : String;
   sCPF              : String;
   sCPFTitular       : String;
   sNomeTitular      : String;
   sMatriculaTitular : String;
begin
   fVlrDevSeg           := 0;
   fVlrSeguroAnt        := 0;
   fVlrSeguroComplAnt   := 0;

   edtDataFinalSuspensao.Clear;

   DBcboSuspensao.LookupValue := '';
   DBcboSuspensao.Clear;
   DBcboSuspensao.Enabled := True; //Renato Visoni SOL 121740  KINTANA 589485
   
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaSolicitante, frmExecBuscaSolicitante);
      frmExecBuscaSolicitante.ShowModal;

      Repaint;

      if (frmExecBuscaSolicitante.RetornouValor) and
         (frmExecBuscaSolicitante.ValoresChave[0] <> '') then
      begin
         Screen.Cursor := crHourGlass;

         sSituacao   := 'Não Participante';
         if frmExecBuscaSolicitante.ValoresChave[13] <> '' then sSituacao  := frmExecBuscaSolicitante.ValoresChave[13];

         sPlanoPrev  := 'Sem Plano';
         if frmExecBuscaSolicitante.ValoresChave[10] <> '' then sPlanoPrev := frmExecBuscaSolicitante.ValoresChave[10];

         iPlanoPrev  := -1;
         if frmExecBuscaSolicitante.ValoresChave[12] <> '' then iPlanoPrev := StrToInt(frmExecBuscaSolicitante.ValoresChave[12]);

         sPatro      := 'Sem Patrocinadora';
         if frmExecBuscaSolicitante.ValoresChave[9] <> ''  then sPatro     := frmExecBuscaSolicitante.ValoresChave[9];

         iPatro      := -1;
         if frmExecBuscaSolicitante.ValoresChave[11] <> '' then iPatro     := StrToInt(frmExecBuscaSolicitante.ValoresChave[11]);

         iSitPart    := -1;
         if frmExecBuscaSolicitante.ValoresChave[14] <> '' then iSitPart   := StrToInt(frmExecBuscaSolicitante.ValoresChave[14]);

         iIDBenef          := StrToInt(frmExecBuscaSolicitante.ValoresChave[0]);
         iIDPessoa         := StrToInt(frmExecBuscaSolicitante.ValoresChave[1]);
         iIDInscricaoPrev  := StrToint(frmExecBuscaSolicitante.ValoresChave[8]);
         sNomeMutuario     := frmExecBuscaSolicitante.ValoresChave[2];
         sMatricula        := frmExecBuscaSolicitante.ValoresChave[4];
         sFlgInterno       := frmExecBuscaSolicitante.ValoresChave[16];
         sCPF              := frmExecBuscaSolicitante.ValoresChave[3];
         sCPFTitular       := frmExecBuscaSolicitante.ValoresChave[6];
         sNomeTitular      := frmExecBuscaSolicitante.ValoresChave[5];
         sMatriculaTitular := frmExecBuscaSolicitante.ValoresChave[7];
         UFuncoesEmptmo.buscaUsuarioMutuario(iIDBenef);
         frmExecBuscaSolicitante.Free;
      end
      else
      begin
         // Evento de Herança do Botão Cancelar e na sequência o evento de Herança do CmeCadastroCancel que:
         // - acerta os Edits que não são ligados a Banco de Dados,
         // - coloca o painel de cancelamento invisível
         // - verifica a forma de Crédito e Débitos para colocar os Paineis respectivos visíveis ou não
         // - Busca a Data de crédito *)
         bbtnCancelarClick(bbtnCancelar);

         Screen.Cursor := crDefault;
         Exit;
      end;  // if RetornouValor
   end
   else
   begin
      dtmMS.MS_Solicitante.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      if dtmMS.MS_Solicitante.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         sSituacao   := 'Não Participante';
         if dtmMS.MS_Solicitante.ValoresChave[13] <> '' then sSituacao  := dtmMS.MS_Solicitante.ValoresChave[13];

         sPlanoPrev  := 'Sem Plano';
         if dtmMS.MS_Solicitante.ValoresChave[10] <> '' then sPlanoPrev := dtmMS.MS_Solicitante.ValoresChave[10];

         iPlanoPrev  := -1;
         if dtmMS.MS_Solicitante.ValoresChave[12] <> '' then iPlanoPrev := StrToInt(dtmMS.MS_Solicitante.ValoresChave[12]);

         sPatro      := 'Sem Patrocinadora';
         if dtmMS.MS_Solicitante.ValoresChave[9] <> ''  then sPatro     := dtmMS.MS_Solicitante.ValoresChave[9];

         iPatro      := -1;
         if dtmMS.MS_Solicitante.ValoresChave[11] <> '' then iPatro     := StrToInt(dtmMS.MS_Solicitante.ValoresChave[11]);

         iSitPart    := -1;
         if dtmMS.MS_Solicitante.ValoresChave[14] <> '' then iSitPart   := StrToInt(dtmMS.MS_Solicitante.ValoresChave[14]);

         iIDBenef          := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
         iIDPessoa         := StrToInt(dtmMS.MS_Solicitante.ValoresChave[1]);
         iIDInscricaoPrev  := StrToint(dtmMS.MS_Solicitante.ValoresChave[8]);
         sNomeMutuario     := dtmMS.MS_Solicitante.ValoresChave[2];
         sMatricula        := dtmMS.MS_Solicitante.ValoresChave[4];
         sFlgInterno       := dtmMS.MS_Solicitante.ValoresChave[16];
         sCPF              := dtmMS.MS_Solicitante.ValoresChave[3];
         sCPFTitular       := dtmMS.MS_Solicitante.ValoresChave[6];
         sNomeTitular      := dtmMS.MS_Solicitante.ValoresChave[5];
         sMatriculaTitular := dtmMS.MS_Solicitante.ValoresChave[7];
      end
      else
      begin
         // Evento de Herança do Botão Cancelar e na sequência o evento de Herança do CmeCadastroCancel que:
         // - acerta os Edits que não são ligados a Banco de Dados,
         // - coloca o painel de cancelamento invisível
         // - verifica a forma de Crédito e Débitos para colocar os Paineis respectivos visíveis ou não
         // - Busca a Data de crédito
         bbtnCancelarClick(bbtnCancelar);
         Screen.Cursor := crDefault;
         Exit;
      end;  // if RetornouValor
   end;

   SelecionaMutuarioParaInscricao(iIDBenef,
                                  iIDPessoa,
                                  iIDInscricaoPrev,
                                  iPatro,
                                  iPlanoPrev,
                                  iSitPart,
                                  sNomeMutuario,
                                  sPlanoPrev,
                                  sPatro,
                                  sMatricula,
                                  sSituacao,
                                  sFlgInterno,
                                  sCPF,
                                  sCPFTitular,
                                  sNomeTitular,
                                  sMatriculaTitular,
                                  1 // (origem = Empréstimo)
                                 );

   Screen.Cursor := crDefault;
end;



procedure TfrmCadInscricao.DBrdgCreditoChange(Sender: TObject);
begin
   // Verifica a Forma de Crédito do Empréstimo:
   //    Contas a Pagar ou Folha de Pagamento, colocando o painel pnlCAP visível ou não
   inherited;

   if DBrdgCredito.ItemIndex = 0 then
   begin
      // O item escolhido é Contas a Pagar

      // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      //    Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      //    e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox

      // Marchetti - Pendencia 26614
      if qry.State in dsEditModes then
      begin
         qryCODFORMAPAG.AsInteger  := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
         qryPORTFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger;
      end;
      // Fim Marchetti - Pendencia 26614

      AtualizaConjunto(True, pnlCAP);
   end
   else
   begin
      // O item escolhido é Folha de Pagamento

      // forçando a atualização do Field antes de Sair do evento OnChange
      if qry.State in dsEditModes then
      begin
      end;

      AtualizaConjunto(False, pnlCAP);
   end;

   if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
   begin
      LimpaParametros(qryBenefSeguro);
      qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
      qryBenefSeguro.Open;
   end;

   // Verifica se a Forma do Crédito do Empréstimo é Contas a Pagar.  Caso positivo
   //   verifica se foi indicado o PortadorForma ou a Forma de Pagamento para fazer
   //   visível o painel respectivo. Se a Forma do Credito é Folha desabilita todos
   //   os painéis

end;



procedure TfrmCadInscricao.DBrdgDebitoChange(Sender: TObject);
begin
   // Verifica a Forma de Débito do Empréstimo:
   //    Contas a Receber ou Folha de Pagamento colocando o painel pnlCAR visível ou não
   inherited;

   if DBrdgDebito.ItemIndex = 0 then
   begin
      // O item escolhido é Contas a Receber
      if qry.State in dsEditModes then
      begin
         // forçando a atualização do Field antes de Sair do evento OnChange

         qryPORTFORMAREC.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsInteger;

      end;

      // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin
      // O item escolhido é Folha de Pagamento

      // forçando a atualização do Field antes de Sair do evento OnChange
      if qry.State in dsEditModes then
      begin
      end;

      AtualizaConjunto(False, pnlCAR, False);
   end;

   if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
   begin
      LimpaParametros(qryBenefSeguro);
      qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
      qryBenefSeguro.Open;
   end;
end;



procedure TfrmCadInscricao.sbtnCancelarClick(Sender: TObject);
begin
   // Procedure de Cancelamento de uma Inscrição.  Tem o mesmo efeito da procedure
   //   da Alteração da inscrição com a finalidade do usuário entrar com a data de
   //   Cancelamento e Motivo
   inherited;

   bCancelaInscricao := True;
   sbtnAlterarClick(Sender);

   // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
   //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
   //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox 
   AtualizaConjunto(True, pnlRecebimento);
end;



procedure TfrmCadInscricao.CmeCadastroConfirma(Sender: TObject);
begin
   try
      if qry.State in dsEditModes then
      begin
         // É cancelamento de inscrição
         if qryDATACANCINSC.AsString <> '' then qryFLGSITUACAO.AsString := 'C';

         qryDATACREDITO.AsDateTime   := edtDataCredito.Date;
      end;

      // se for inserção, incluir o Fiário
      if qry.State = dsInsert then
      begin
         if dtmEmptmo.qryParamEmptmoFLGUSAFIARIO.AsInteger = 1 then
         begin
            Fiario.IDPessoa      := qryIDBENEF.AsInteger;
            Fiario.IDTitular     := qryIDPESSOA.AsInteger;
            Fiario.IDModulo      := Sistema.IDModulo;
            Fiario.IDUsuario     := Sistema.IDUsuario;
            Fiario.IDRubs        := 0;
            Fiario.IDGrupo       := 1;

            if bCancelaInscricao then
            begin
               Fiario.Descricao  := 'Cancelamento de Inscrição em Empréstimo';
            end
            else
            begin
               Fiario.Descricao  := 'Inscrição em Empréstimo';
            end;

            Fiario.DataInclusao  := SysDate;
            if not(Fiario.Inserir) then
            begin
               if MsgDlg('Erro ao inserir Protocolo.' + #13 + #13 + 'Deseja gravar o Contrato?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrYes then
               begin
                  Repaint;
                  // Fazer Confirma
                  inherited;
               end
               else // if MsgDlg
               begin
                  Repaint;
                  // Houve erro - Desfaz a transação
                  if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
                  Exit;
               end;
            end;
         end
         else // if dtmEmptmo.qryParamEmptmoFLGUSAFIARIO.AsInteger = 1
         begin
            // Fazer Confirma
            inherited;
         end;
      end
      else // if qry.State = dsInsert
      begin
         // Fazer Confirma
         inherited;
      end; // if qry.State = dsInsert

   except
      //
   end;

   if bCancelaInscricao then FechaCancelamento;
end;



procedure TfrmCadInscricao.FechaCancelamento;
begin
   // Procedure que fecha as queries principal de motivo do cancelamento e coloca
   //   o painel de Cancelamento invisível
   bCancelaInscricao  := False;

   // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
   //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
   //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox
   AtualizaConjunto(False, pnlRecebimento);

   // abre a query principal contendo zero registros
   Sel(-1);

   // Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados
   AcertaEdits;
end;



procedure TfrmCadInscricao.DBcboTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   dData                : TDateTime;
   rSaldo               : TSaldoDevAnt;

   iIDPessoa, iIDBenef  : Int64;
   iTotParcPagas        : Integer;
   bContratosMarcados   : Boolean;

   sSQL,
   sResultado           : String;
   iContador            : Integer;
   bExistSusp           : Boolean;
   nRecno               : TBookMark;
   qryFlgPrazoIndeterminado : TwwQuery;

begin
   inherited;

   if trim(DBcboTipoContrato.LookupValue) = EmptyStr then
      Exit;

   DBcboSuspensao.Enabled := True; //Renato Visoni SOL 121740  KINTANA 589485
   // ----------------------------------------------------------------------------------------------

   // André Pontes - 09/01/2006
   if ( (Sistema.TipoCliente <> 20011) and
        not(CalcEmptmo.VerificaConcessaoNaoEfetivada(qryIDPESSOA.AsInteger,
                                                     qryIDBENEF.AsInteger,
                                                     StrToInt(DBcboTipoContrato.LookupValue),
                                                     True,
                                                     // Marchetti - Pendencia 23407
                                                     qryTipoContratoFLGVERIFICACONTRATO.AsInteger
                                                     // Fim Marchetti - Pendencia 23407
                                                    ))
      ) then
   begin
      // Mostra Msg de "Erro"
      PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
      Repaint;

      bbtnCancelarClick(bbtnCancelar);
      Exit;
   end;
   // FIM André Pontes - 09/01/2006

   // ----------------------------------------------------------------------------------------------

   // Marchetti - Pendencia 23066
   qryFLGFORMAPAG.Clear;
   qryFLGFORMAREC.Clear;

   qryFLGFORMAPAG.AsString   := trim(qryTipoContratoFLGFORMAPAG.AsString);
   qryFLGFORMAREC.AsString   := trim(qryTipoContratoFLGFORMAREC.AsString);

   // Marchetti - 26286
   // Colocado o teste de NULO no campo para buscar os parâmetros do Sistema
   if (trim(qryFLGFORMAPAG.AsString) = EmptyStr) or (qryFLGFORMAPAG.IsNull) then
      qryFLGFORMAPAG.AsString := trim(dtmEmptmo.qryParamEmptmoFLGFORMAPAG.AsString);

   if (trim(qryFLGFORMAREC.AsString) = EmptyStr) or (qryFLGFORMAREC.IsNull) then
      qryFLGFORMAREC.AsString := trim(dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString);
   // Fim Marchetti - 26286

   // se for mantido, já passa para Contas a Receber
   dtmEmptmo.qryAux.Close;
   dtmEmptmo.qryAux.SQL.Clear;
   dtmEmptmo.qryAux.SQL.Text := 'SELECT FLGDESCFOLHA FROM CONTRIBPREVPARTP WHERE IDPESSOA = ' + trim(qryIDBENEF.AsString) + ' ORDER BY ULTMESPREPARO DESC';
   dtmEmptmo.qryAux.Open;

   if (trim(qryFLGINTERNO.AsString) = 'MA') and
      (dtmEmptmo.qryAux.FieldByName('FLGDESCFOLHA').AsInteger = 0) then
      qryFLGFORMAREC.AsString := 'C';

   dtmEmptmo.qryAux.Close;

   if trim(qryFLGFORMAREC.AsString) = 'C' then
   begin
      // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox
      AtualizaConjunto(True, pnlCAR);
   end
   else
   begin
      AtualizaConjunto(False, pnlCAR, False);
   end;
   // Fim Marchetti - Pendencia 23066

   bDesabilitouContrato := False;

   sArq := 'InscricaoConcessao' + '-' +
           FormatDateTime('yyyymmdd-hhnnss', Now) + '-' +
           'matr' + qryMatricula.AsString +
           '.log';

   Repaint;

   // André Pontes - 22/06/2005
   // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
   dtmEmptmo.Regra.IDCalculo  := 0;
   // FIM André Pontes - 22/06/2005

   qryVLRMAXPERMIT.AsCurrency := 0;

   // Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados
   AcertaEdits(False);

   Repaint;

   // -----------------------------------------------------------------------------------------------------------------------------------
   if trim(DBcboTipoContrato.LookupValue) <> EmptyStr then
   begin
      dDataFinalSuspensao  := -1;
      dDataSuspAnterior    := -1;

      iTipoSuspAnterior    := 0;

      // inicializa as variáveis de estado, que permitem recálculo dos valores
      bTrocouSalario       := False;
      bTrocouMargem        := False;
      bTrocouValMax        := False;
      fVlrMaxPermit        := 0;
      bTrocouDataCred      := False;

      dDataAssinatura      := edtDataAssinatura.Date;

      AcertaDatas;

      // habilita o PageControl Principal
      pgcValores.Enabled := trim(DBcboTipoContrato.LookupValue) <> '';

      qryVLRSOLIC.AsFloat := 0;

      // Verifica se o usuário escolheu o Tipo de Contrato, caso negativo
      //   o procedimento será abortado
      if trim(qryIDTipoContrEmptmo.AsString) = EmptyStr then
         Exit;

      qryMOECODIGO.AsInteger      := qryTipoContratoMOECODIGO.AsInteger;
      qryDESCTIPOEMPTMO.AsString  := trim(qryTipoContratoDESCTIPOEMPTMO.AsString);

      // função da unit UCalcEmptmo que verifica se o PARTICIPANTE atende
      //   a regra de Elegibilidade, (participante e Beneficiário são iguais)
      //   caso negativo o procedimento será abortado
      iIDPessoa := qryIDPESSOA.AsInteger;
      if qryIDBENEF.IsNull then
      begin
         iIDBenef := iIDPessoa;
      end
      else
      begin
         iIDBenef := qryIDBENEF.AsInteger;
      end;

      // Procedure que abre a query que busca os Contratos Ativos do Participante
      AbreQueriesDividas;

      iTotParcPagas  := -1;
      iPrazoAnterior := 0;
      iUltParcGerada := 0;
      iTipoContrAnt  := -1;

      // -------------------------------------------------------------------------------------------
      bNumParcPaga   := True;
      if qryContratosAnteriores.IsEmpty then
      begin
         //
      end
      else
      begin

         //Pendência 23733 - 19/12/2006 - Alberto
         if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
         begin

            if not ValidaTipoContratoEmprestimo(qryContratosAnteriores,
                                                qryIDPESSOA.AsInteger,
                                                qryIDBENEF.AsInteger,
                                                StrToInt(DBcboTipoContrato.LookupValue),
                                                dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                               ) then
            begin
               MsgDlg('Tipo de contrato de empréstimo não pode ser contratado!', 'Empréstimo', mtWarning, [mbOk], 0);
               PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
               Repaint;
               qryIDTIPOCONTREMPTMO.AsString := '';
               Exit;
            end;

         end;
         //Fim Pendência 23733

         // André Pontes - 13/01/2004
         // Passados para as regras de concessão apenas dos dados dos contratos efetivamente
         // marcados para quitação
         iNumParcPagas  := 0;
         iPrazoAnterior := 0;
         iTipoContrAnt  := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;

         bContratosMarcados := False;

         qryContratosAnteriores.DisableControls;
         qryContratosAnteriores.First;
         while not(qryContratosAnteriores.EOF) do
         begin
            //Pendência 26916 - 22/12/2007
            if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) {or
               //Pendência 23429 - 28/09/2006 - Alberto
               //(qryContratosAnteriores.RecordCount = qryTipoContratoTEPMAXCONTRATO.AsInteger) then
               (qryContratosAnteriores.RecordCount = qryTipoContratoTCEMAXCONTRATO.AsInteger)} then
               //Fim Pendência 23429
            begin
               bContratosMarcados   := True;

               iTotParcPagas  := qryContratosAnterioresNUMPARCPAGAS.AsInteger;
               iNumParcPagas  := iTotParcPagas;
               iPrazoAnterior := qryContratosAnterioresNUMPARCELAS.AsInteger;
               iUltParcGerada := qryContratosAnterioresULT_PARC.AsInteger;
               iTipoContrAnt  := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
            end;

            qryContratosAnteriores.Next;
         end;
         qryContratosAnteriores.EnableControls;
         // FIM André Pontes - 13/01/2004

         // Marchetti - Pendencia 23647
         if (qryTipoContratoFLGVERPRAZOTIPOQUIT.AsInteger = 0) then
         begin
            // André Pontes - 26/12/2003
            if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) then
            begin
               if (iNumParcPagas < qryTipoContratoTCEMINRENOVA.AsInteger) then
               begin
                  LogToFile('Crítica de carência', sArq);

                  MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                  Repaint;
               end;
            end
            else
            begin
               if (qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger = qryTipoContratoIDTIPOCONTREMPTMO.AsInteger) and
                  (iNumParcPagas < qryTipoContratoTCEMINRENOVA.AsInteger) then
               begin
                  bNumParcPaga := False;

                  if bContratosMarcados then
                  begin
                     if PrimeiraRenovacao2006 then // André Pontes - Pendência 21272 / SOL 39805 - 19/01/2006
                     begin
                        LogToFile('PrimeiraRenovacao2006', sArq);
                     end
                     else
                     begin
                        LogToFile('Crítica de carência', sArq);

                        MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                        Repaint;
                     end;
                  end;
               end;
            end;
            // FIM André Pontes - 26/12/2003
         end
         else
         begin
            if not VerificaCarenciaPorContratosQuitaveis then
            begin
               LogToFile('Crítica de carência', sArq);

               MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
            end;
         end;
         // Fim Marchetti - Pendencia 23647
      end;
      // -------------------------------------------------------------------------------------------

      // Procedimento que armazena os dados da Inscrição num registro
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

      rNovoContrato.IDTipoContrEmptmo := qryTipoContratoIDTIPOCONTREMPTMO.AsInteger;

      if not(CalcEmptmo.VerificaElegibilidade(iIDPessoa, // Titular
                                              iIDBenef,  // Mutuário
                                              qryTipoContratoIDREGRAELEG.AsInteger,
                                              //Pendências 23311 e 23312 - 25/09/2006 - Alberto
                                              qryIDPLANOPREV.AsInteger,
                                              //Fim Pendências 23311 e 23312
                                              qryTipoContratoTCEMINRENOVA.AsInteger,
                                              iTotParcPagas,
                                              dDataFinalBeneficio,
                                              True       // Mostra mensagem de erro
                                              //Pendência 22836 - 03/10/2006 - Alberto
                                             ,chkExcepcional.Checked
                                              //Fim Pendência 22836
                                             )) then
      begin
         PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;

      // verifica se é necessário que o participante tenha preenchido o Beneficiário
      if bObrigaBeneficiario then
      begin
         // Beneficiário é OBRIGATÓRIO

         // Verifica se o Beneficiário foi preenchido
         if trim(DBedtBeneficiario.Text) = EmptyStr then
         begin
            // Beneficiário não foi preenchido

            MsgDlg('É necessário indicar o Beneficiário!', 'Empréstimo', mtWarning, [mbOk], 0);
            PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
            Repaint;

            qryIDTIPOCONTREMPTMO.AsString := '';
            Exit;
         end
         else
         begin
            // Beneficiário foi preenchido

            // função da unit UCalcEmptmo que verifica se o BENEFICIÁRIO atende
            //   a regra de Elegibilidade
            if not(CalcEmptmo.VerificaElegibilidade(qryIDPESSOA.AsInteger,
                                                    qryIDBENEF.AsInteger,
                                                    qryTipoContratoIDREGRAELEG.AsInteger,
                                                    //Pendências 23311 e 23312 - 25/09/2006 - Alberto
                                                    qryIDPLANOPREV.AsInteger,
                                                    //Fim Pendências 23311 e 23312
                                                    qryTipoContratoTCEMINRENOVA.AsInteger,
                                                    iTotParcPagas,
                                                    dDataFinalBeneficio,
                                                    True    // Mostra
                                                    //Pendência 22836 - 03/10/2006 - Alberto
                                                   ,chkExcepcional.Checked
                                                    //Fim Pendência 22836
                                                    )) then
            begin
               // Beneficiário NÃO atende a regra de Elegibilidade
               PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
               bbtnCancelarClick(bbtnCancelar);
               Exit;
            end;  // if VerificaElegibilidade
         end;  // if DBedtBeneficiario.Text
      end;  // if bObrigaBeneficiario

      // Verifica se o participante pode fazer a inscrição usando a ValidaInscrição
      //   que é uma função da unit UCalcEmptmo
      if not(CalcEmptmo.ValidaInscricao(qryIDPESSOA.AsInteger,
                                        qryIDBENEF.AsInteger,
                                        qryTipoContratoIDTIPOEMPTMO.AsInteger,
                                        StrToInt(DBcboTipoContrato.LookupValue),
                                        qryIDINSCRICAOEMPTMO.AsFloat,
                                        True // Mostra
                                        )) then
      begin
         // Participante excedeu o número máximo de inscrição, logo o Procedimento será abortado
         // Evento de Herança do Botão Cancelar e na sequência o evento de Herança
         // do CmeCadastroCancel que:
         // - acerta os Edits que não são ligados a Banco de Dados,
         // - coloca o painel de cancelamento invisível
         // - verifica a forma de Crédito e Débitos para colocar os Paineis respectivos visíveis ou não
         //  - Busca a Data de crédito *)
         PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;

      //Pendência 22910 - 28/07/2006 - Alberto
      if ( (Sistema.TipoCliente <> 20011) and
           not(CalcEmptmo.ValidaContratoEmQuitacao(qryIDPESSOA.AsInteger,
                                                   qryIDBENEF.AsInteger,
                                                   qryTipoContratoIDTIPOEMPTMO.AsInteger,
                                                   StrToInt(DBcboTipoContrato.LookupValue),
                                                   iQtdEPQuitado,
                                                   True // Mostra mensagem de erro
                                                  ))
         ) then
      begin
         // Mostra Msg de "Erro"
         PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
         Repaint;

         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;
      //Fim Pendência 22910

      // Verifica se o participante pode fazer contratar o Empréstimo usando a ValidaContrato
      //    que é uma função da unit UCalcEmptmo. Caso negativo, isto é o Participante excedeu o
      //    número máximo de contrato, logo ele será alertado que  enquanto não Quitar os
      //    contratos anteriores, NÃO poderá contratar este empréstimo *)

      bContratoValido := CalcEmptmo.ValidaContrato(qryIDPESSOA.AsInteger,
                                                   qryIDBENEF.AsInteger,
                                                   qryTipoContratoIDTIPOEMPTMO.AsInteger,
                                                   StrToInt(DBcboTipoContrato.LookupValue),
                                                   iQtdEPQuitado,
                                                   True // Mostra mensagem de erro
                                                  );

      // -------------------------------------------------------------------------------------------

      if ( (Sistema.TipoCliente <> 20011) and // André Pontes - 28/07/2005 - pendência 19839
           (bContratoValido) and
           not(CalcEmptmo.VerificaConcessaoNaoEfetivada(qryIDPESSOA.AsInteger,
                                                        qryIDBENEF.AsInteger,
                                                        qryIDTIPOCONTREMPTMO.AsInteger,
                                                        True,
                                                        // Marchetti - Pendencia 23407
                                                        qryTipoContratoFLGVERIFICACONTRATO.AsInteger
                                                        // Fim Marchetti - Pendencia 23407
                                                       ))
         ) then
      begin
         // Mostra Msg de "Erro"
         PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
         Repaint;

         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      // Procedimento que armazena os dados da Inscrição num registro
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

      if ((qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending)) then
      begin
         LimpaParametros(qryBenefSeguro);
         qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
         qryBenefSeguro.Open;
      end;

      // Procedure que atualiza no SpinEdit do Número de Parcelas o Mínimo e Máximo
      //   de parcelas permitidas levando em consideração o Tipo de Contrato/Empréstimo
      SetNumParcelas;

      // inicializa as variáveis
      fSalParticipacao  := 0;
      fSalMantido       := 0;
      fSalAuxDoenca     := 0;
      fSalBenef         := 0;
      fVlrSalBase       := 0;
      fVlrMargem        := 0;
      fVlrMaxPermit     := 0;

      if not(qryVLRMARGEM.IsNull) then
         fVlrMargem     := qryVLRMARGEM.AsCurrency;
      if not(qryVLRMAXPERMIT.IsNull) then
         fVlrMaxPermit  := qryVLRMAXPERMIT.AsCurrency;

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         // Procedimento que armazena os dados da Inscrição num registro
         PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

         edtPercentJuros.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                          qryTipoContratoIDREGRAJURCONC.AsInteger,
                                                          0,                          // É parcela 0 na Concessão
                                                          rNovoContrato.DataCredito,
                                                          0,                          // Taxa de Juros Anterior é 0 na concessão
                                                          rNovoContrato.VlrContrato,  // SaldoDev Anterior = Vlr Solic na concessão
                                                          False,                      // Mostra
                                                          rNovoContrato.Indexador
                                                          //Pendência 22836 - 03/10/2006 - Alberto
                                                         ,0, 0, 0
                                                         ,chkExcepcional.Checked
                                                          //Fim Pendência 22836
                                                         );

         edtTxJurosExibe.Value := 0;
         if not(qryTipoContratoIDREGRAJUREXIBE.isNULL) then
         begin
            edtTxJurosExibe.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                             qryTipoContratoIDREGRAJUREXIBE.AsInteger,
                                                             0,                          // É parcela 0 na Concessão
                                                             rNovoContrato.DataCredito,
                                                             0,                          // Taxa de Juros Anterior é 0 na concessão
                                                             rNovoContrato.VlrContrato,  // SaldoDev Anterior = Vlr Solic na concessão
                                                             False,                      // Mostra
                                                             rNovoContrato.Indexador
                                                             //Pendência 22836 - 03/10/2006 - Alberto
                                                            ,0, 0, 0
                                                            ,chkExcepcional.Checked
                                                             //Fim Pendência 22836
                                                            );
         end;
         edtTxJurosExibe.Visible := (edtTxJurosExibe.Value > 0);
      end;

      // Procedure que Calcula o Valor da Quitação para Empréstimos Anteriores
      CalculaEPAnterior;


      qryContratosAnteriores.First;
      while not qryContratosAnteriores.eof do
      begin
         LimpaParametros(qryContratoQuitavel);
         qryContratoQuitavel.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
         qryContratoQuitavel.ParamByName('PIDTIPOCONTRQUIT').AsInteger   := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
         qryContratoQuitavel.Open;

         nRecno := qryContratosAnteriores.GetBookMark;
         if ( (qryContratoQuitavelFLOBRIGATORIO.AsInteger = 1) or
              (qryContratosAnterioresVLREMABERTO.AsCurrency > 0))   // SOL:108099 Daniel Begnami - Calcula Itens em Aberto
          then
         begin
            qryContratosAnteriores. Edit;
            qryContratosAnterioresFLGOBRIGATORIO.AsInteger := 1;
            qryContratosAnteriores.Post;
            b_btnIncluirQuitarClick := False;    // SOL 123381 - Daniel Begnami
            btnIncluirQuitarClick(btnIncluirQuitar);
            b_btnIncluirQuitarClick := True;     // SOL 123381 - Daniel Begnami
         end;
         qryContratoQuitavel.Close;
         qryContratosAnteriores.GotoBookMark(nRecno);
         qryContratosAnteriores.FreeBookMark(nRecno);
         qryContratosAnteriores.Next;
      end;
      qryContratosAnteriores.First;

      // Busca Salário Base do Participante
      if not(qryTipoContratoIDREGRASALBAS.IsNull) then
      begin
         fVlrSalBase := CalcEmptmo.BuscaSalarioBase(qryTipoContratoIDREGRASALBAS.AsInteger,
                                                    qryIDPESSOA.AsInteger,
                                                    qryIDBENEF.AsInteger,
                                                    fSalParticipacao,
                                                    fSalMantido,
                                                    fSalAuxDoenca,
                                                    fSalBenef,
                                                    True,
                                                    qryDATAINSC.AsDateTime
                                                    //Fanuel Junior SOL151964 Kintana1124438
                                                   ,qryIDTIPOCONTREMPTMO.AsInteger
                                                    //Pendência 22836 - 03/10/2006 - Alberto
                                                   ,0
                                                   ,chkExcepcional.Checked
                                                    //Fim Pendência 22836
                                                    ,qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 153259 KINTANA 1152177
                                                    );
         if (fVlrSalBase = -1) then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Não foi possível recuperar o salário base.', 'Empréstimo', mtError, [mbOk], 0);
            PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
            Repaint;
            bbtnCancelarClick(bbtnCancelar);
            Exit;
         end;
      end;


      // função da unit UCalcEmptmo que busca a Margem Consignável do participante
      edtValMargem.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                   qryIDBENEF.AsInteger,
                                                   qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                   fVlrSalBase,
                                                   edtTotalParcelas.Value,
                                                   edtTotalPendencias.Value,
                                                   fSalParticipacao,
                                                   fSalMantido,
                                                   fSalAuxDoenca,
                                                   fSalBenef,
                                                   True,
                                                   qryDATAINSC.AsDateTime,
                                                   qryNUMPARCELAS.AsInteger

                                                   vDividasAnteriores,

                                                   //Pendência 22836 - 03/10/2006 - Alberto
                                                   false,
                                                   0,
                                                   chkExcepcional.Checked,
                                                   //Fim Pendência 22836
                                                   DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                   edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                   0, // Ádler Souza - SOL 75516 Kintana 523281
                                                   -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                   qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                  );
// Marchetti - Pendencia 26614
      fVlrMargem := edtValMargem.Value;
// Fim Marchetti - Pendencia 26614

      // Ádler Souza  - SOL 144704 - KTN 968693
      {if fVlrMargem = -1 then
      begin
         Screen.Cursor := crDefault;
         EscondeEspera;
         MsgDlg('Não foi possível recuperar a margem consignável.', 'Empréstimo', mtError, [mbOk], 0);
         PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
         Repaint;
         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;}
      // Fim - Ádler Souza  - SOL 144704 - KTN 968693


      // Marchetti - Pendencia 26402
      if (rdgMargemAlt.Visible) and (not qryTipoContratoIDREGRAMARGEMALT.IsNull) then
      begin
         edtValMargemAlt.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                         qryIDBENEF.AsInteger,
                                                         qryTipoContratoIDREGRAMARGEMALT.AsInteger,
                                                         fVlrSalBase,
                                                         edtTotalParcelas.Value,
                                                         edtTotalPendencias.Value,
                                                         fSalParticipacao,
                                                         fSalMantido,
                                                         fSalAuxDoenca,
                                                         fSalBenef,
                                                         True,
                                                         qryDATAINSC.AsDateTime,
                                                         qryNUMPARCELAS.AsInteger,

                                                         vDividasAnteriores,

                                                         chkFinanciamento.Checked,
                                                         //Pendência 22836 - 03/10/2006 - Alberto
                                                         0,
                                                         chkExcepcional.Checked,
                                                         //Fim Pendência 22836
                                                         DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                         edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                         0, // Ádler Souza - SOL 75516 Kintana 523281
                                                         -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                         qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                        );
         qryVLRMARGEMALT.AsCurrency := edtValMargemAlt.Value;

      end;
      // Fim Marchetti - Pendencia 26402


      // função da unit UCalcEmptmo que busca a Reserva de Poupança do participante ou
      //   do beneficiário, no caso do pensionista
      edtValReserva.Value := CalcEmptmo.BuscaReserva(qryIDBENEF.AsInteger,
                                                     qryIDPATRO.AsInteger,
                                                     qryIDPLANOPREV.AsInteger,
                                                     qryTipoContratoIDREGRARESERVA.AsInteger,
                                                     qryDATAINSC.AsDateTime,
                                                     True
                                                     //Pendência 22836 - 03/10/2006 - Alberto
                                                    ,0
                                                    ,chkExcepcional.Checked
                                                     //Fim Pendência 22836
                                                    );

      if (edtValReserva.Value = -1) then
      begin
         Screen.Cursor := crDefault;
         EscondeEspera;

         MsgDlg('Não foi possível recuperar a reserva de poupança.', 'Empréstimo', mtError, [mbOk], 0);
         PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
         Repaint;

         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;

      edtSalParticipacao.Value   := fSalParticipacao;
      edtSalMantido.Value        := fSalMantido;
      edtSalAuxDoenca.Value      := fSalAuxDoenca;
      edtSalBenef.Value          := fSalBenef;

      // Procedure que decide qual a Taxa de Juros que vai ser utilizada, busca o
      //     Possivel para o Empréstimo e Calcula Parcela
      //   Pré-requisitos: Reserva de Poupança igual a Zero ou Maior
      SetTxJuros;

      if qry.State in dsEditModes then
      begin
         qryVLRSALBASE.AsCurrency   := fVlrSalBase;
         qryVLRMARGEM.AsCurrency    := fVlrMargem;
         qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
         edtLimiteDisp.Value        := qryVLRMAXPERMIT.AsCurrency - edtSaldoAQuitar.Value - fVlrTotalDividas;;
      end;

      edtDataAssinatura.Modified    := False;

      // Verifica se existe algum tipo de suspensão para o tipo de contrato
      qryFLGSUSPENSAOAUTO.AsInteger := 0;
      if VerificaSuspensao(StrToInt(DBcboTipoContrato.LookupValue),bExistSusp) then
      begin
         qryFLGSUSPENSAOAUTO.AsInteger := 1;
      end;


      // André Pontes - 18/08/2004
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
      begin
         // ----------------------------------------------------------------------------------------
         if (iTotSiafi > 0) and
            not(chkExcepcional.Checked) and
            not(chkFinanciamento.Checked) then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;

            LogToFile('Crítica de dívidas de Financiamento Habitacional', sArq);
            MsgDlg('Mutuário possui dívidas de Financiamento Habitacional. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
            PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
            Repaint;
            Exit;
         end;
         // ----------------------------------------------------------------------------------------
         // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
         //Pendência 27232 - 16/04/2008
         //if (qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) and (qryContratosAnteriores2.Active) then
         //Fim Pendência 27232

         // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
         //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) and
            //(qryContratosAnteriores2.Active) then
         //begin
         // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
            //Pendência 27232 - 16/04/2008
            if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
            begin

               if (not chkExcepcional.Checked) and
                  (not ValidaTipoContratoEmprestimo(qryContratosAnteriores2,
                                                    qryIDPESSOA.AsInteger,
                                                    qryIDBENEF.AsInteger,
                                                    StrToInt(DBcboTipoContrato.LookupValue),
                                                    dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                                   )) then
         begin
                  //LogToFile('Contrato anterior do mesmo tipo', sArq);
                  //MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                  LogToFile('Tipo de contrato em aberto impede contratação', sArq);
                  MsgDlg('Tipo de contrato em aberto impede contratação!', 'Empréstimo', mtWarning, [mbOk], 0);
                  PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
                  Repaint;
                  Exit;
               end;

            end;
            //Fim Pendência 23733

            qryContratosAnteriores2.First;
            while not(qryContratosAnteriores2.EOF) do
            begin

               if not(chkExcepcional.Checked) then
               begin
                  if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                                     True,
                                                     edtDataCredito.Date,
                                                     True,
                                                     StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                                     StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                                     // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                                     1
                                                    //Pendência 27232 - 16/04/2008
                                                    //) then
                                                    ) <> 0 then
                  begin
                     LogToFile('Crítica de Itens em aberto para concessão', sArq);
                     MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
                     Repaint;
                     Exit;
                  end;
               end;

               //Pendência 27232 - 16/04/2008
               {
               // Marchetti - Pendencia 26318
               if not(chkExcepcional.Checked) then
               begin
                  if not TipoContratoPermitidoParaConcessao then
                  begin
                     LogToFile('Contrato anterior do mesmo tipo', sArq);
                     MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;
               end;
               // Fim Marchetti - Pendencia 26318
               }

               qryContratosAnteriores2.Next;
            end;
         //end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Marchetti - Pendencia 23647
         if (qryTipoContratoFLGVERPRAZOTIPOQUIT.AsInteger = 0) then
         begin
            qryContratosAnteriores.DisableControls;
            qryContratosAnteriores.First;
            while not(qryContratosAnteriores.EOF) do
            begin
             if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
             begin
                  // ----------------------------------------------------------------------------------
                  if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
                  begin
                     if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryContratosAnterioresIDContratoEmptmo.AsFloat, edtDataCredito.Date)) then
                     begin

                        dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratosAnterioresIDContratoEmptmo.AsFloat);
                        rSaldo := CalcEmptmo.SaldoDevAnt(qryContratosAnterioresIDContratoEmptmo.AsFloat, dData, -1, -1, False);

                        if (rSaldo.fSaldoDevAnt <> 0) then
                        begin
                           LogToFile('Crítica de atualização diária', sArq);
                           MsgDlg('Contrato anterior não possui atualização diária para a Data do Crédito!', 'Empréstimo', mtWarning, [mbOk], 0);
                           PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
                           Repaint;

                           bbtnCancelarClick(bbtnCancelar);
                           Exit;
                        end;  // if rSaldo.fSaldoDevAnt > 0
                     end;  // if not(CalcEmptmo.PossuiAtualizacaoDiaria(...
                  end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
                  // ----------------------------------------------------------------------------------


                  // André Pontes - 20/08/2004 - alterado a pedido de Luciana
                  if (qryContratosAnterioresNUMPARCPAGAS.AsInteger < qryContratosAnterioresTCEMINRENOVA.AsInteger) and
                     not(chkExcepcional.Checked) then
                  // FIM André Pontes - 20/08/2004 - alterado a pedido de Luciana
                  begin
                     if PrimeiraRenovacao2006 then // André Pontes - Pendência 21272 / SOL 39805 - 19/01/2006
                     begin
                        LogToFile('PrimeiraRenovacao2006', sArq);
                     end
                     else
                     begin
                        LogToFile('Crítica de carência', sArq);

                        MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                        Repaint;
                     end;
                  end;
               end;
               qryContratosAnteriores.Next;
            end;
            qryContratosAnteriores.EnableControls;
         end
         else
         begin
            qryContratosAnteriores.DisableControls;
            qryContratosAnteriores.First;
            while not(qryContratosAnteriores.EOF) do
            begin
               if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
               begin
                  // ----------------------------------------------------------------------------------
                  if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
                  begin
                     if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryContratosAnterioresIDContratoEmptmo.AsFloat, edtDataCredito.Date)) then
                     begin

                        dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratosAnterioresIDContratoEmptmo.AsFloat);
                        rSaldo := CalcEmptmo.SaldoDevAnt(qryContratosAnterioresIDContratoEmptmo.AsFloat, dData, -1, -1, False);

                        if rSaldo.fSaldoDevAnt <> 0 then
                        begin
                           LogToFile('Crítica de atualização diária', sArq);
                           MsgDlg('Contrato anterior não possui atualização diária para a Data do Crédito!', 'Empréstimo', mtWarning, [mbOk], 0);
                           PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
                           Repaint;

                           bbtnCancelarClick(bbtnCancelar);
                           Exit;
                        end;  // if rSaldo.fSaldoDevAnt > 0
                     end;  // if not(CalcEmptmo.PossuiAtualizacaoDiaria(...
                  end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
                  // ----------------------------------------------------------------------------------
               end;
               qryContratosAnteriores.Next;
            end;
            qryContratosAnteriores.EnableControls;

            if not VerificaCarenciaPorContratosQuitaveis then
            begin
               LogToFile('Crítica de carência', sArq);

               MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
            end;
         end;
         // Fim Marchetti - Pendencia 23647

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
      end;
      // FIM André Pontes - 18/08/2004
   end;  // if DBcboTipoContrato.LookupValue <> ''


   // ----------------------------------------------------------------------------------------------

   // Tratamento de Assinatura / Contrato Padrão
   if (dtmEmptmo.qryParamEmptmoFLGTRATAASSINAT.AsInteger = 1) then
   begin
      if not(PossuiAssinatura(qryIDPESSOA.AsFloat,
                              qryIDBENEF.AsFloat,
                              StrToInt(DBcboTipoContrato.LookupValue)
                             )) then
      begin
         Repaint;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   //Pendência 27232 - 16/04/2008
   fVlrEmAberto := CalcEmptmo.ExistemItensEmAberto(
                   rContratoAnterior.IDContratoEmptmo,
                   False,
                   0,
                   True,
                   StrToInt(FormatDateTime('yyyy', rNovoContrato.DataInscricao)),
                   StrToInt(FormatDateTime('mm'  , rNovoContrato.DataInscricao)),
                   // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                   0);

   if ( (edtSaldoaQuitar.Value > 0) and
        (dtmEmptmo.qryParamEmptmoFLGRENPRESTAB.AsInteger = 1) and
        (fVlrEmAberto <> 0) and
        //(ExistemItensEmAberto(fVlrEmAberto)) and
        //Fim Pendência 27232
        not(chkExcepcional.Checked)
      ) then
   begin
      LogToFile('Crítica de Itens em aberto na Renovação', sArq);

      MsgDlg('Existem itens anteriores em aberto! ' + #13 + 'Não será permitida a Renovação.', 'Empréstimo', mtWarning, [mbOk], 0);
      PossuiSuspensaoConcessao(qryIDBENEF.AsInteger); //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
      Repaint;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------
      if (qryTipoContratoTCEMAXCONTRATO.AsInteger = 1) and
      //Fim Pendência 23429
         (qryContratosAnteriores.Active) and
         (qryContratosAnteriores.RecordCount > 1) then
      begin
         LogToFile('Crítica de mais de um Contrato anterior em andamento', sArq);

         MsgDlg('ATENÇÃO!' + #13 + #13 +
                'Há mais de um Contrato anterior em andamento!' + #13 +
                'Todos serão quitados.',
                'Empréstimo', mtWarning, [mbOk], 0
               );
         Repaint;
      end;  // (qryTipoContratoTEPMAXCONTRATO.AsInteger = 1)...

   // ----------------------------------------------------------------------------------------------

   //Ádler Souza - SOL 137662 KINTANA 836092
   if CalcEmptmo.verificaSuspTemp(vDividasAnteriores, edtDataCredito.date) then
     MsgDlg('ATENÇÃO!' + #13 +
            'O contrato anterior possui suspensão temporária. ' + #13 +
            'Não será permitido o reaproveitamento.',
            'Empréstimo', mtWarning, [mbOk], 0);
   //Fim - Ádler Souza - SOL 137662 KINTANA 836092

   //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
   if PossuiSuspensaoConcessao(qryIDBENEF.AsInteger) then
   begin
     LogToFile('Crítica PossuiSuspensaoConcessao', sArq);
   end;
   //Fim - Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
end;



procedure TfrmCadInscricao.SetTxJuros;
begin
   // Procedure que decide qual a Taxa de Juros que vai ser utilizada, busca o
   //   Valor Máximo Possivel para o Empréstimo e Calcula Parcela
   //   Pré-requisitos: Reserva de Poupança igual a Zero ou Maior

   if edtValReserva.Value < 0 then
   begin
      MsgDlg('Reserva de Poupança Negativa. Verifique...', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   // Procedimento que armazena os dados da Inscrição num registro
   PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

   // função da unit UCalcEmptmo que busca a Taxa de Juros. Será utilizada
   //   a regra cadastrada na tabela TIPOCONTREMPTMO para buscar a Taxa de Juros

   edtPercentJuros.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                    qryTipoContratoIDREGRAJURCONC.AsInteger,
                                                    0,                           // É parcela 0 na Concessão *)
                                                    rNovoContrato.DataCredito,
                                                    0,                           // Taxa de Juros Anterior é 0 na concessão *)
                                                    rNovoContrato.VlrContrato,   // SaldoDev Anterior = Vlr Solic na concessão*)
                                                    False,                       // Mostra
                                                    rNovoContrato.Indexador
                                                    //Pendência 22836 - 03/10/2006 - Alberto
                                                   ,0, 0, 0
                                                   ,chkExcepcional.Checked
                                                    //Fim Pendência 22836
                                                   );

   edtTxJurosExibe.Value := 0;
   if not(qryTipoContratoIDREGRAJUREXIBE.isNULL) then
   begin
      edtTxJurosExibe.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                       qryTipoContratoIDREGRAJUREXIBE.AsInteger,
                                                       0,                          // É parcela 0 na Concessão
                                                       rNovoContrato.DataCredito,
                                                       0,                          // Taxa de Juros Anterior é 0 na concessão
                                                       rNovoContrato.VlrContrato,  // SaldoDev Anterior = Vlr Solic na concessão
                                                       False,                      // Mostra
                                                       rNovoContrato.Indexador
                                                       //Pendência 22836 - 03/10/2006 - Alberto
                                                      ,0, 0, 0
                                                      ,chkExcepcional.Checked
                                                       //Fim Pendência 22836
                                                      );
   end;

   edtTxJurosExibe.Visible := (edtTxJurosExibe.Value > 0);

   if edtPercentJuros.Value = -1 then
   begin
      Screen.Cursor := crDefault;
      EscondeEspera;
      MsgDlg('Não foi possível recuperar a taxa de juros.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      bbtnCancelarClick(bbtnCancelar);
      Exit;
   end;

   // função da unit UCalcEmptmo que busca o Valor Máximo Possivel para o Empréstimo
   //   o valor é armazenado no atributo interno FVlrSolic
   if not(bTrocouValMax) then
   begin
      //Pendência 26951 - Passar query qryContratosAnteriores

      FVlrSolic := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                               qryIDSITPART.AsInteger,
                                               edtPercentJuros.Value,
                                               edtValMargem.Value,
                                               edtValReserva.Value,
                                               edtSaldoAQuitar.Value + fVlrTotalDividas,
                                               edtQuitacao.Value + edtQuitacaoDividas.Value,
                                               edtSalParticipacao.Value,
                                               edtSalMantido.Value,
                                               edtSalAuxDoenca.Value,
                                               edtSalBenef.Value,
                                               fVlrSalBase,
                                               True,   // Mostra
                                               //Pendência 26951 - 03/12/2007
                                               vDividasAnteriores,
                                               //Pendência 22836 - 03/10/2006 - Alberto
                                               0,
                                               chkExcepcional.Checked,
                                               //Fim Pendência 22836
                                               qryContratosAnteriores,
                                               //Fim Pendência 26951
                                               // SOL:108099 Daniel Begnami
                                               StrToInt(edtPrazoSuspensao.text),
                                               iIDTipoSuspEmptmo
                                               // FIM
                                              );

      fVlrMaxPermit := FVlrSolic;

      // Marchetti - Pendencia 27061
      SetValorMaxPermit(fVlrMaxPermit);
      // Fim Marchetti - Pendencia 27061

      if fVlrMaxPermit = -1 then
      begin
         Screen.Cursor := crDefault;
         EscondeEspera;
         MsgDlg('Não foi possível recuperar o valor máximo possível para o empréstimo.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;

      // no momento da escrita (write) da property VlrSolic acontece o evento SetValorSolic
      //   atribui para o valor do campo Valor solicitado o valor máximo e calcula Parcela
      VlrSolic := FVlrSolic;
   end;
end;

procedure TfrmCadInscricao.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   case CmeCadastro.Operacao of

      opInserir, opAlterar:
      begin
         sbtnCancelar.Enabled  := False;
         if not(bDesabilitouContrato) then bbtnContrato.Enabled  := True;
         if not(bDesabilitouContrato) then bbtnSimula.Enabled    := True;
         tbsGeral.Enabled      := True;
         tbsDivida.Enabled     := True;
         tbsIntegracao.Enabled := True;
         pnlDados.Enabled      := True;
      end;

      opVazio:
      begin
         sbtnCancelar.Enabled  := False;
         bbtnContrato.Enabled  := False;
         sbtnImprimir.Enabled  := False;
         bbtnSimula.Enabled    := False;
         tbsGeral.Enabled      := False;
         tbsDivida.Enabled     := False;
         tbsIntegracao.Enabled := False;
         pnlDados.Enabled      := False;

         edtCarencia.Clear;
         edtDataCredito.Clear;
         edtDataAssinatura.Clear;
         edtDataPrimParcela.Clear;

         LimpaParametros(qryContratosAnteriores);
         LimpaParametros(dtmLookEmptmo.qryLookDadosBancarios);
      end;

      else
      begin
         sbtnCancelar.Enabled  := True;
         bbtnContrato.Enabled  := False;
         sbtnImprimir.Enabled  := True;
         bbtnSimula.Enabled    := False;
         tbsGeral.Enabled      := False;
         tbsDivida.Enabled     := False;
         pnlDados.Enabled      := False;
         tbsIntegracao.Enabled := False;
      end;

   end;  // case

   // Inicio - André Tavares - Verifica a habilitação dos componetes para o usuário - pendência 15639
   Autorizacao.AutorizarForm(self, afNormal);
   // fim - André Tavares

   if bDesabilitouContrato then
   begin
      bbtnContrato.Enabled  := False;
      bbtnSimula.Enabled    := False;
   end;
end;

procedure TfrmCadInscricao.bbtnCancelarClick(Sender: TObject);
begin

   Application.ProcessMessages;

   edtDataAssinatura.Date := SysDate;

   DBcboSuspensao.Enabled := True; //Renato Visoni SOL 121740  KINTANA 589485

   // André Pontes - 22/06/2005
   // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
   dtmEmptmo.Regra.IDCalculo  := 0;
   // FIM André Pontes - 22/06/2005

   // SOL 127320 - Ádler Souza
   // Limpar variaveis da regra
   dtmEmptmo.Regra.LimpaVariaveis;
   //Fim - SOL 127320 - Ádler Souza

   // na herança - CmeCadastroCancel
   if ((qryAvalista.Active) and (qryAvalista.UpdatesPending))        then qryAvalista.CancelUpdates;
   if ((qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending))  then qryBenefSeguro.CancelUpdates;
   qryResponsavel.Close;

   inherited;
   // Sol Nº 92179 - Jose Nilton (Atualização gyde fontes)
   sbtnProcurar.Enabled:= False;


   iIDTipoSuspEmptmo := -1;

   // SOL 123381 - Daniel Begnami
   b_btnIncluirQuitarClick := True;
   pgcValores.ActivePage   := tbsGeral;
   frmCadInscricao.Refresh;
   // FIM

end;

procedure TfrmCadInscricao.CmeCadastroCancel(Sender: TObject);
begin
   // Procedure que:
   //   - acerta os Edits que não são ligados a Banco de Dados,
   //   - coloca o painel de cancelamento invisível
   //   - verifica a forma de Crédito e Débitos para colocar os Paineis respectivos visíveis ou não
   //   - Busca a Data de crédito *)

   // Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
   //   Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
   //   e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox

   // Verifica a Forma de Crédito do Empréstimo: Contas a Pagar ou Folha de Pagamento
   //   colocando o painel pnlCAP visível ou não
   DBrdgCreditoChange(DBrdgCredito);

   // Verifica a Forma de Débito do Empréstimo: Contas a Receber ou Folha de Pagamento
   //   colocando o painel pnlCAR visível ou não
   DBrdgDebitoChange(DBrdgDebito);

   // Cancel na query
   inherited;

   // Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados
   AcertaEdits;
end;



procedure TfrmCadInscricao.bbtnConfirmarClick(Sender: TObject);
var
   fRendaComp : Currency;
   dsEstado   : TDataSetState;
   //Pendência 22260 - 05/01/2006 - Alberto
   iMenorSeq, i: Integer;
   //Fim Pendência 22260

begin
   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   Application.ProcessMessages;

   if trim(DBcboTipoContrato.LookupValue) = EmptyStr then
      Exit;

   LogToFile(' ', sArq, True, False);
   LogBPL(sArq);
   LogToFile(' ', sArq, True, False);
   LogToFile('Botao de Inscricao pressionado', sArq);
   begin
      try
         ParametrosSistema;

         // Marchetti - Pendencia 26402
         if (rdgMargemAlt.Visible) and
            (rdgMargemAlt.Checked) and
            (dtmEmptmo.qryParamEmptmoFLGOBRIGAAVALALT.AsInteger = 1) then
         begin
            if (qryAvalista.RecordCount = 0)  then
            begin
               pgcValores.ActivePageIndex    := 5;
               pgcOutrasInfo.ActivePageIndex := 1;
               raise EValidacao.CreateVal('É necessário indicar o Avalista!', dbgrdDet);
            end;
         end;

         if (rdgMargemAlt.Visible) and
            (rdgMargemAlt.Checked) and
            (dtmEmptmo.qryParamEmptmoFLGOBRIGAAVALALT.AsInteger = 1) then
         begin
            if (qryAvalistaMARGEMCONSIG.AsCurrency < qryVLRMARGEMALT.AsCurrency) then
            begin
               MsgDlg('Margem do Avalista é inferior a margem consignável alternativa!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;

               LogToFile('Crítica de margem consignável do avalista', sArq);

               if bDesabilitouContrato then
               begin
                  bbtnContrato.Enabled := True;
                  bbtnSimula.Enabled   := True;
               end;

               Exit;
            end;
         end;

         if (trim(qryFLGINTERNO.AsString) = 'MA') and
            (dtmEmptmo.qryParamEmptmoFLGOBRIGAAVALISTA.AsInteger = 1) and
            (VerificaObrigatoriedadeAvalista) then
         begin

            if (qryAvalista.RecordCount = 0)  then
            begin
               pgcValores.ActivePageIndex := 4;
               raise EValidacao.CreateVal('É necessário indicar o(s) Avalista(s)!', dbgrdDet);
            end;

            if (qryAvalista.RecordCount > 2) then
            begin
               pgcValores.ActivePageIndex := 4;
               raise EValidacao.CreateVal('Indicar no máximo 2 (dois) Avalistas!', dbgrdDet);
            end;

            fRendaComp := 0;
            qryAvalista.First;

            while not(qryAvalista.EOF) do
            begin
               fRendaComp := (fRendaComp + qryAvalistaRENDACOMP.AsCurrency);
               qryAvalista.Next;
            end;

            if (fRendaComp < qryVLRSALBASE.AsCurrency) then
            begin
               pgcValores.ActivePageIndex := 4;
               // André Pontes - 25/03/2004
               raise EValidacao.CreateVal('A renda do(s) Avalista(s) deve ser igual ou superior ao salário base do Mutuário!', dbgrdDet);
            end;
         end;

         if qryIDTipoContrEmptmo.IsNull then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

         if qryDATAINSC.IsNull then
            raise EValidacao.CreateVal('É necessário indicar a data da Solicitação!', DBedtDataInsc);

         if chkTRAVARDATAS.Checked then
            if (edtDataCredito.Date < Sysdate) then
               raise EValidacao.CreateVal('A Data de Crédito não pode ser anterior a hoje!', edtDataCredito);

         if qryVLRSOLIC.IsNull then
            raise EValidacao.CreateVal('É necessário indicar o Valor Solicitado!', DBedtValorSolic);

         if qryNUMPARCELAS.IsNull then
            raise EValidacao.CreateVal('É necessário indicar o Número de Parcelas!', DBspeParcelas);

         if (dbcboMoeda.LookupValue) = EmptyStr then
            raise EValidacao.CreateVal('É necessário indicar o indexador!', dbcboMoeda);

         // ----------------------------------------------------------------------------------------

         // grava a conta bancária independentemente da forma de pagamento
         if not(dsBanco.DataSet.IsEmpty) then
            qryIDCBANCARIA.AsInteger := dsBanco.DataSet.FieldByName('IDCBANCARIA').AsInteger;

         // grava a conta bancária independentemente da forma de pagamento
         if not(dsBancoDeb.DataSet.IsEmpty) then
            qryIDCBANCARIADEB.AsInteger := dsBancoDeb.DataSet.FieldByName('IDCBANCARIA').AsInteger;

         if not(dsResponsavel.DataSet.IsEmpty) then
            qryIDRESPONSAVEL.AsInteger := dsResponsavel.DataSet.FieldByName('IDRESPONSAVEL').AsInteger;

         // ----------------------------------------------------------------------------------------

         // O item escolhido é Contas a Pagar
         if (DBrdgCredito.ItemIndex = 0) and (Sender = bbtnContrato)  then
         begin
            if qryCODFORMAPAG.IsNull then
               raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaPagamento);

            if qryPORTFORMAPAG.IsNull then
               raise EValidacao.CreateVal('É necessário indicar a Conta-Caixa x Forma Pagto!', DBcboCCaixaxFPagto);

            if dsBanco.DataSet.IsEmpty then
               raise EValidacao.CreateVal('É necessário que o Participante possua uma Conta Corrente cadastrada no Sistema!', DBgBanco);
         end;

         // O item escolhido é Contas a Receber *)
         if (DBrdgDebito.ItemIndex = 0) then
            if qryPORTFORMAREC.IsNull then
               raise EValidacao.CreateVal('É necessário indicar a Forma de Recebimento!', DBcboFormaRecebimento);

         // Verifico o atributo FLimites(PRIVATE) que armazena o resultado da Regra de
         //   Limites, caso negativo o participante não satisfez a regra de Limites e
         //   consequentemente não pode fazer a inscrição, logo o procedimento será abortado
         if (not(bLimites) and not(chkExcepcional.Checked) and not(chkFinanciamento.Checked) ) then
         begin
            MsgDlg('Empréstimo não passou na Regra de Limites.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            Exit;
         end;  // if (not(bLimites) and not(chkExcepcional.Checked))

         if bRegraErro then
         begin
            MsgDlg('Ocorreu um erro na Busca de Valores de um Item', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;

            bbtnCancelarClick(bbtnCancelar);
            Exit;
         end;

         //Pendência 22260 - 05/01/2006 - Alberto

         iMenorSeq := 1000;
         // determina o SEQCOBRANÇA + baixo da lista --> é o valor solicitado
         for i := 0 to High(vLista) do
         begin
            if (vLista[i].SeqCalculo < iMenorSeq) then
                iMenorSeq := vLista[i].SeqCalculo;
         end;

         for i := 0 to High(vLista) do
         begin
            // valor solicitado
            if ( (vLista[i].iEvento = 0) and
                 (vLista[i].FlgCentraliza = 0) and
                 (vLista[i].SeqCalculo = iMenorSeq)
               ) then
            begin
               if (chkExcepcional.Checked) then begin

                  if (qry.State in dsEditModes) and (qryVLRSOLIC.AsCurrency <> vLista[i].Valor) then
                  begin
                    raise EValidacao.CreateVal('Valor solicitado difere do item calculado. Verifique a regra de cálculo!', DBedtValorSolic);
                  end;
               end;
            end;
         end;
         //Fim Pendência 22260

         if (qryTipoContratoFLGCONCESSAOZERO.Value = 1) and
            (edtSaldoAQuitar.Value = 0) and
            (edtLiquidoGeral.Value = 0) and
            not(chkFinanciamento.Checked) then
         begin
            MsgDlg('O valor líquido de concessão deve ser maior que ZERO!', 'Empréstimo', mtWarning, [mbOk], 0);
            pgcValores.ActivePageIndex := 0;
            Repaint;

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            Exit;
         end;

         //Pendência 23049 - 11/08/2006 - Alberto
         if (qryTipoContratoFLGOBRIGACONCZERO.Value = 1) and
            (edtLiquidoGeral.Value <> 0) then
         begin
            MsgDlg('O valor líquido de concessão deve ser igual a ZERO!', 'Empréstimo', mtWarning, [mbOk], 0);
            pgcValores.ActivePageIndex := 0;
            Repaint;

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            Exit;
         end;
         //Fim Pendência 23049

         if (edtLiquidoGeral.Value < 0) then
         begin
            MsgDlg('O valor líquido de concessão não pode ser menor que ZERO!', 'Empréstimo', mtWarning, [mbOk], 0);
            pgcValores.ActivePageIndex := 0;
            Repaint;

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            Exit;
         end;
         // Verifica a obrigatoriedade de informaçào de beneficiários de seguro
         if (qryTipoContratoFLGOBRIGBENEF.AsInteger = 1) and (qryBenefSeguro.RecordCount = 0) then
         begin
            MsgDlg('É obrigatória a informação de Beneficiário(s) do Seguro.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            Exit;
         end;

         // Verifica os percentuais de indenização
         if not(CriticaPercentuaisBeneficiarios) then
            Exit;

         if dtmEmptmo.qryParamEmptmoFLGOBRIGAVERBA.AsInteger = 1 then
         begin
            // Chama a função de Atualização de Saldo para ver se possui saldo disponivel para o empréstimo
            if not(AtualizaSaldoVerba(False)) then
               Exit;
         end;

         CmeCadastro.RepetirInsert := False;

         // Grava Flags de Alteracao de Salário, Margem e Valor Máximo
         if bTrocouSalario then
            qryFLGALTSALARIO.AsInteger := 1;
         if bTrocouMargem  then
            qryFLGALTMARGEM.AsInteger  := 1;
         if bTrocouValMax  then
            qryFLGALTVALMAX.AsInteger  := 1;

         dsEstado := qry.State;
         inherited;

         // ----------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Inscrição nº ' + FormatFloat('#0', qryIDINSCRICAOEMPTMO.AsFloat))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
            Repaint;
         end;
         // ----------------------------------------------------------------------------------------

         if qry.State in [dsInsert, dsEdit] then
         begin
            qry.Post;
            qry.ApplyUpdates;
         end;

         // Marchetti - Pendencia 26402
         if ( (qryInsereAvalista.Active) and (qryInsereAvalista.UpdatesPending) ) then
         begin
            try
               qryInsereAvalista.ApplyUpdates;
               qryInsereAvalista.CommitUpdates;
            except
               qryInsereAvalista.CancelUpdates;
            end;
         end;
         // Fim Marchetti - Pendencia 26402

         if ((qryAvalista.Active) and (qryAvalista.UpdatesPending)) then
         begin
            try
               qryAvalista.ApplyUpdates;
               qryAvalista.CommitUpdates;
            except
               qryAvalista.CancelUpdates;
            end;
         end;

         if ( (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) ) then
         begin
            try
               qryBenefSeguro.ApplyUpdates;
               qryBenefSeguro.CommitUpdates;
            except
               qryBenefSeguro.CancelUpdates;
            end;
         end;

         qryResponsavel.Close;

         if dsEstado = dsInsert then
         begin
            with qryItensConcessao do
            begin
               First;
               while not(EOF) do
               begin
                  with qryInsertHistMovInsc do
                  begin
                     LimpaParametros(qryInsertHistMovInsc);
                     ParamByName('PIDREGRA').AsInteger         := qryItensConcessao.FieldByName('IDREGRA').AsInteger;
                     ParamByName('PIDINSCRICAOEMPTMO').AsFloat := qryIDINSCRICAOEMPTMO.AsFloat;
                     ParamByName('PIDITEMEMPTMO').AsInteger    := qryItensConcessao.FieldByName('IDITEMEMPTMO').AsInteger;
                     ParamByName('PHMICENTRALIZA').AsInteger   := qryItensConcessao.FieldByName('FLGCENTRALIZA').AsInteger;
                     ParamByName('PHMIDESTACADO').AsInteger    := qryItensConcessao.FieldByName('FLGDESTACADO').AsInteger;
                     ParamByName('PHMIVLRPREVISTO').AsCurrency := qryItensConcessao.FieldByName('VALOR').AsCurrency;
                     ExecSQL;
                  end;

                  Next;
               end;
            end;
         end;

         VerificaImpressaoInscricao;   // Impressão da Inscricao

      except

         on ev : EValidacao do
         begin
            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            LogToFile('EValidacao', sArq);

            if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;

            if ev.Control.Parent is TTabSheet then
            begin
               ((ev.Control.Parent as TTabSheet).Parent as TPageControl).ActivePage := (ev.Control.Parent as TTabSheet);
            end;

            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;  // try..except
   end;  // if qry.State in [dsInsert, dsEdit]
end;



procedure TfrmCadInscricao.SetParcelas(Num: Int64);
begin
   // Procedure que ocorre no momento da escrita (WRITE) da propriedade pública
   //   NumParcelas que faz interface com o frmSimulacao retornando a quantidade
   //   de parcelas que o participante escolheu 
   if (trim(DBcboTipoContrato.LookupValue) = EmptyStr) or (qryTipoContratoIDREGRAPRAZOMAX.IsNull) then
   begin
      qryNUMPARCELAS.AsInteger := Num;
   end
   else
   begin
      qryNUMPARCELAS.AsInteger := CalcEmptmo.BuscaPrazoContrato(qryIDPESSOA.AsInteger,
                                                                qryIDBENEF.AsInteger,
                                                                qryNUMPARCELAS.AsInteger,
                                                                qryTipoContratoIDREGRAPRAZOMAX.AsInteger,
                                                                qryIDTipoContrEmptmo.AsInteger,
                                                                qryDATAINSC.AsDateTime,
                                                                False
                                                                //Pendência 22836 - 03/10/2006 - Alberto
                                                               ,chkExcepcional.Checked
                                                                //Fim Pendência 22836
                                                               ,qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 141615 KINTANA 987740
                                                               );
   end;
end;



procedure TfrmCadInscricao.SetNumParcelas;
var
   sSQL     : String;
   qryAux   : TwwQuery;
begin
   // Procedure que atualiza no SpinEdit do Número de Parcelas o Mínimo e Máximo
   //   de parcelas permitidas levando em consideração o Tipo de Contrato/Empréstimo

   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSQL :=
      'SELECT '                                                         + #13 +
      '  TCEMINPARC, TCEMAXPARC '                                       + #13 +
      'FROM '                                                           + #13 +
      '  TIPOCONTREMPTMO '                                              + #13 +
      'WHERE'                                                           + #13 +
      '  IDTIPOCONTREMPTMO = ' + qryIDTipoContrEmptmo.AsString          + #13 +
      '  AND IDTIPOEMPTMO  = ' + qryTipoContratoIDTIPOEMPTMO.AsString;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      qryAux.Open;

      if not(qryAux.IsEmpty) then
      begin
         DBspeParcelas.MinValue := qryAux.FieldByName('TCEMINPARC').AsInteger;
         DBspeParcelas.MaxValue := qryAux.FieldByName('TCEMAXPARC').AsInteger;

         if (DBcboTipoContrato.LookupValue = '') or (qryTipoContratoIDREGRAPRAZOMAX.IsNull) then
           begin
           // Marchetti - Pendencia 23376
              if qry.State in dsEditModes then qryNUMPARCELAS.AsFloat := DBspeParcelas.MaxValue;
              // Procedimento que armazena os dados da Inscrição num registro
              PreencheDadosContrato(qryNUMPARCELAS.AsInteger);
           // Fim Marchetti - Pendencia 23376
         end
         else
         begin
            if qry.State in dsEditModes then
            begin
               qryNUMPARCELAS.AsInteger := CalcEmptmo.BuscaPrazoContrato(qryIDPESSOA.AsInteger,
                                                                         qryIDBENEF.AsInteger,
                                                                         // Pendência 24186 - 16/01/2007 - Alberto
                                                                         //Trunc(DBspeParcelas.Value),
                                                                         Trunc(DBspeParcelas.MaxValue),
                                                                         // Fim Pendência 24186
                                                                         qryTipoContratoIDREGRAPRAZOMAX.AsInteger,
                                                                         qryIDTipoContrEmptmo.AsInteger,
                                                                         qryDATAINSC.AsDateTime,
                                                                         False
                                                                         //Pendência 22836 - 03/10/2006 - Alberto
                                                                        ,chkExcepcional.Checked
                                                                         //Fim Pendência 22836
                                                                        ,qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 141615 KINTANA 987740
                                                                        );
            end;
            DBspeParcelas.MaxValue := qryNUMPARCELAS.AsInteger;
         end;

         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            if not(CalcEmptmo.VerificaPrazoConcessao(qryIDPESSOA.AsInteger,
                                                     qryIDBENEF.AsInteger,
                                                     trunc(DBspeParcelas.Value),                   // nº da Parcela
                                                     qryTipoContratoIDREGRAPRAZOSCONC.AsInteger
                                                     //Pendência 22836 - 03/10/2006 - Alberto
                                                    ,chkExcepcional.Checked)) then
                                                     //Fim Pendência 22836
            begin
               MsgDlg('Este Prazo não é permitido!', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               DBspeParcelas.Modified := False;
            end;
         end;
         // ----------------------------------------------------------------------------------------

      end
      else
      begin
         DBspeParcelas.MinValue := 1;
         DBspeParcelas.MaxValue := 999;
      end;

   finally
     qryAux.Free;
   end;
end;



procedure TfrmCadInscricao.CalculaParcela (flModo : SmallInt);
begin


   blimites := True;

   // Procedure que Calcula o Valor da parcela, verificando também se é atendida
   //   a Regra de Limites e calculando o valor Líquido do Empréstimo

   // Se o usuário ainda não preencheu o Valor solicitado, o procedimento é abortado

   // Thiago Melo SOL 183326 Kintana 1712188
   if (flModo = 0) then
      begin
   //
     if ( (DBedtValorSolic.Text = '' )    or
          (DBedtValorSolic.Text = '0')    or
          (DBedtValorSolic.Text = '0,00') or
          (DBedtValorSolic.Text = '0.00') or
          (qryVLRSOLIC.IsNull)            or
          (qryVLRSOLIC.Value    = 0)
        ) then
     begin
        Exit;
     end;
   // Thiago Melo SOL 183326 Kintana 1712188
   end;
   //


   // função da unit UCalcEmptmo que verifica se o participante atende Limites
   //   de concessão e limites de Quantidade e Prazos do Contrato/Empréstimo.
   //   O Atributo Flimites(PRIVATE) armazena o resultado da Regra de Limites
   if ( not(chkExcepcional.Checked) and not(chkFinanciamento.Checked) ) then
   begin
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

      bLimites := CalcEmptmo.BuscaLimites(rNovoContrato,
                                          0,    // origem = Concessão
                                          qryIDSITPART.AsInteger,
                                          qryTipoContratoIDREGRALIMITES.AsInteger,
                                          dDataFinalBeneficio,
                                          edtValMargem.Value,
                                          edtValReserva.Value,
                                          edtSaldoaQuitar.Value + fVlrTotalDividas,
                                          edtTotalParcelas.Value,
                                          edtTotalPendencias.Value,
                                          qryDATAINSC.AsDateTime,
                                          edtLiquidoGeral.Value,
                                          True, // mostra
                                          qryVLRSALBASE.AsCurrency
                                          //Pendência 22836 - 03/10/2006 - Alberto
                                         ,chkExcepcional.Checked
                                          //Fim Pendência 22836
                                         );
   end
   else
   begin
      bLimites := True;
   end;

   // Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
   //   acrescentando ao valor solicitado os valores dos itens de concessão
   BuscaValorLiquidoEP;
end;



// Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
// acrescentando ao valor solicitado os valores dos itens de concessão
procedure TfrmCadInscricao.BuscaValorLiquidoEP;
var
   i, iMenorSeq   : Integer;
   sSQLItens      : String;
   sSQLImpressao  : String;
   sAnoMesCompet  : String;
   fSaldoDev      : Currency;
   iOrdemImp      : Integer;
   iImprimeInsc   : Integer;
begin
   qryItensConcessao.Close;
   qryItensImpressao.Close;

   bRegraErro     := False;
   // Procedimento que armazena os dados da Inscrição num registro
   PreencheDadosContrato(Trunc(DBspeParcelas.Value));
   edtOutrosDescontos.Value := 0;
   edtLiquidoGeral.Value    := 0;

   sAnoMesCompet  := FormatDateTime('YYYYMM', rNovoContrato.DataAssinatura);

   // Utiliza a função CalculaItens da unit UCalcEmptmo para pegar a parcela e
   // os itens de concessão com seus respectivos valores, em relação ao número de
   // parcelas escolhida pelo participante

   if not(qryContratosAnteriores.IsEmpty) then
   begin
      rConcessao.IDContratoEmptmo := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
      rConcessao.ValorSolic       := qryContratosAnterioresVLRCONTRATO.AsCurrency;
      rConcessao.DataCredito      := qryContratosAnterioresDATACREDITO.AsDateTime;
      rConcessao.Prazo            := qryContratosAnterioresNUMPARCELAS.AsInteger;
      rConcessao.Taxa             := qryContratosAnterioresTXJUROS.AsCurrency;

      // FUSESC - Marchetti - 03/01/2008
      if (Sistema.TipoCliente = 20071) then
      begin
         iNumParcPagas  := qryContratosAnterioresNUMPARCPAGAS.AsInteger;
         iPrazoAnterior := qryContratosAnterioresNUMPARCELAS.AsInteger;
         iUltParcGerada := qryContratosAnterioresULT_PARC.AsInteger;
         iTipoContrAnt  := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
      end;
      // Fim Marchetti - 03/01/2008

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
      begin
         // ----------------------------------------------------------------------------------------

         LimpaParametros(qrySaldoQuitacao);

         // Andre Pontes - 22/12/2003 - FUNCEF
         // A query foi alterada para trazer o valor do item informativo, considerado pelo Bobrov
         // como mais confiável
         qrySaldoQuitacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rConcessao.IDContratoEmptmo;
         qrySaldoQuitacao.ParamByName('PIDITEMEMPTMO').AsInteger     := 18;
         qrySaldoQuitacao.Open;

         // FIM Andre Pontes - 22/12/2003 - FUNCEF

         if not(qrySaldoQuitacao.IsEmpty) then
            rConcessao.SaldoQuitacao := qrySaldoQuitacaoHMEVLRPREVISTO.AsCurrency;

         // ----------------------------------------------------------------------------------------

         // Andre Pontes - 09/08/2004 - FUNCEF
         // Somar ao saldo de quitação do contrato o valor do seguro devolvido, para cálculo do IOF
         // na renovação

         LimpaParametros(qrySaldoQuitacao);

         qrySaldoQuitacao.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rConcessao.IDContratoEmptmo;
         qrySaldoQuitacao.ParamByName('PIDITEMEMPTMO').AsInteger     := 45;
         qrySaldoQuitacao.Open;

         if not(qrySaldoQuitacao.IsEmpty) then
            rConcessao.SaldoQuitacao := (rConcessao.SaldoQuitacao + qrySaldoQuitacaoHMEVLRPREVISTO.AsCurrency);

         // FIM Andre Pontes - 09/08/2004 - FUNCEF

         // ----------------------------------------------------------------------------------------

         // André Pontes - 21/12/2003 - FUNCEF
         // Acumula o valor apurado de devolução do valor do seguro,
         // para passar para as regras de cálculo dos itens de concessão
         fVlrDevSeg           := 0;
         fVlrSeguroAnt        := 0;
         fVlrSeguroComplAnt   := 0;

         qryContratosAnteriores.First;
         while not(qryContratosAnteriores.EOF) do
         begin
            if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
            begin
               rConcessao.IDContratoEmptmo := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
               rConcessao.ValorSolic       := qryContratosAnterioresVLRCONTRATO.AsCurrency;
               rConcessao.DataCredito      := qryContratosAnterioresDATACREDITO.AsDateTime;
               rConcessao.Prazo            := qryContratosAnterioresNUMPARCELAS.AsInteger;
               rConcessao.Taxa             := qryContratosAnterioresTXJUROS.AsCurrency;               

               fVlrDevSeg           := (fVlrDevSeg + qryContratosAnterioresVLRDEVSEG.AsCurrency);

               // André Pontes - 07/01/2004
               //    Foi pedido pelo Bobrov que as regras de concessão recebam os valores totais de
               //    seguro (concessão) e seguro complementar (refinanciamento)
               //    do(s) contrato(s) anterior(es)

               fVlrSeguroAnt        := (fVlrSeguroAnt        + CalcEmptmo.PegaSeguroAnt(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat));
               fVlrSeguroComplAnt   := (fVlrSeguroComplAnt   + CalcEmptmo.PegaSeguroComplAnt(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat));

               // FIM André Pontes - 07/01/2004

               // André Pontes - 04/03/2004 - aproveitamento de suspensão
               with qrySuspAnterior do
               begin
                  LimpaParametros(qrySuspAnterior);
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
                  ParamByName('PHSCFINALSUSP').AsDate      := edtDataCredito.Date;
                  // Denise Arruda 30/07/2008 N. Sol 91847, N. Kintana 390163
                  ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
                  // Fim // Denise Arruda 30/07/2008 N. Sol 91847, N. Kintana 390163
                  Open;

                  if not(isEmpty) then
                  begin
                     First;
                     iTipoSuspAnterior := qrySuspAnteriorIDTIPOSUSPEMPTMO.AsInteger;
                     dDataSuspAnterior := qrySuspAnteriorHSCFINALSUSP.AsDateTime;
                  end
                  else
                  begin
                     iTipoSuspAnterior := -1;
                     dDataSuspAnterior := StrToDate('31/12/1899');

                     // Marchetti - Pendencia 19398
                     LimpaParametros(qrySuspContratoAnt);
                     qrySuspContratoAnt.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
                     qrySuspContratoAnt.ParamByName('PDATA').AsDate              := edtDataCredito.Date;
                     // Denise Arruda 30/07/2008 N. Sol 91847, N. Kintana 390163
                     qrySuspContratoAnt.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
                     // Fim // Denise Arruda 30/07/2008 N. Sol 91847, N. Kintana 390163
                     qrySuspContratoAnt.Open;

                     if not qrySuspContratoAnt.IsEmpty then
                     begin
                        iTipoSuspAnterior := qrySuspContratoAntIDTIPOSUSPEMPTMO.AsInteger;
                        dDataSuspAnterior := qrySuspContratoAntDATAFIMSUSP.AsDateTime;
                     end;
                     // Fim Marchetti - Pendencia 19398

                     qrySuspContratoAnt.Close;
                  end;

                  Close;
               end;
               // FIM André Pontes - 04/03/2004 - aproveitamento de suspensão
            end;

            qryContratosAnteriores.Next;
         end;
         // FIM André Pontes - 21/12/2003 - FUNCEF
      end;
   end;

   try

      // André Pontes - 22/08/2005
      // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
      dtmEmptmo.Regra.IDCalculo  := 0;
      // FIM André Pontes - 22/08/2005
                                           //ALEX
      CalcEmptmo.CalculaItens(rNovoContrato,
                              rConcessao,
                              0,                         // Tipo do item - É parcela 0 na Concessão
                              0,                         // Origem - 0 na Inscrição
                              iPais, sEstado, iCidade,
                              0,                         // Parcela ZERO = Concesão *)
                              qryIDSITPART.AsInteger,
                              rNovoContrato.FlgFormaPag, // Débito - Folha ou Contas a Receber
                              rNovoContrato.Txjuros,
                              0,                         // Na concessão o Saldo Devedor inicia com Zero e depois de
                                                         //   calculado será o Valor Solicitado
                              qryVLRSOLIC.AsCurrency,    // Valor Solicitado
                              edtSaldoaQuitar.Value,     // Saldo de Empréstimo Anteriores
                              edtValMargem.Value,
                              edtValReserva.Value,
                              fSalParticipacao, fSalMantido,
                              fSalAuxDoenca, fSalBenef, fVlrSalBase,
                              qryVLRMAXPERMIT.AsCurrency,
                              iNumParcPagas,
                              iPrazoAnterior,
                              iUltParcGerada,
                              rNovoContrato.DataAssinatura,
                              rNovoContrato.DataAssinatura,
                              sAnoMesCompet,
                              False,                     // bInterrompe
                              True,                      // bMsg
                              True,                      // Progresso
                              vLista,
                              fVlrDevSeg,
                              fVlrSeguroAnt,
                              fVlrSeguroComplAnt,
                              True,
                              edtQuitacao.Value,
                              fVlrTotalDividas,
                              iTipoContrAnt,
                              False,                           // bCriaObjetoRegra    : Boolean = False;
                              0,                               // dDataAtraso         : TDateTime = 0;
                              0,                               // fValorEmAberto      : Currency = 0;
                              0,                               // dDataAtrasoAnt      : TDateTime = 0;
                              0,                               // fValorEmAbertoAnt   : Currency = 0;
                              0,                               // fValorProvisao      : Currency = 0;
                              True,                            // bGravaQueryRegra    : Boolean = True;
                              ord(chkFinanciamento.Checked)    // iFinanciamento      : Integer = 0
                              //Pendência 22836 - 03/10/2006 - Alberto
                             ,chkExcepcional.Checked,
                              //Fim Pendência 22836
                             // SOL:108099 Daniel Begnami
                             StrToInt(edtPrazoSuspensao.text),
                             iIDTipoSuspEmptmo,
                             qryContratosAnteriores, //Renato Visoni SOL 124858 KINTANA 638072
                             edtDataCredito.Date,     //Renato Visoni SOL 124858 KINTANA 638072
                             DBspeParcelas.Text,      //Jéssica Lana  SOL 127055
                             chkliquidozero.Checked // Wylliam Leite da Silva SOL: 156456 Kintana: 1234816
                             // FIM
                             );

   except
      bRegraErro     := True;
      Exit;
   end;

   sSQLItens      := '';
   sSQLImpressao  := '';


   iMenorSeq := 1000;
   // determina o SEQCOBRANÇA + baixo da lista --> é o valor solicitado
   for i := 0 to High(vLista) do
   begin
      if (vLista[i].SeqCalculo < iMenorSeq) then
         iMenorSeq := vLista[i].SeqCalculo;
   end;


   // Laço verificando se o item é parcela ou se é o Líquido concedido
   for i := 0 to High(vLista) do
   begin
      LimpaParametros(qryBuscaItens);
      qryBuscaItens.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
      qryBuscaItens.ParamByName('PIDITEMEMPTMO').AsInteger      := vLista[i].CodigoItem;
      qryBuscaItens.Open;

      iOrdemImp      := qryBuscaItensITCORDEMIMP.AsInteger;
      iImprimeInsc   := qryBuscaItensITCITEMIMPRESSO.AsInteger;

      // valor solicitado
      if ( not(chkExcepcional.Checked) and
           (vLista[i].iEvento = 0) and
           (vLista[i].FlgCentraliza = 0) and
           (vLista[i].SeqCalculo = iMenorSeq)
         ) then
      begin
         if (vLista[i].Valor > 0) then
         begin
            if qry.State in dsEditModes then qryVLRSOLIC.AsCurrency  := vLista[i].Valor;
         end
         else
         begin
            if qry.State in dsEditModes then qryVLRSOLIC.AsCurrency  := 0;
         end;
      end;

      //   Devido ao fato da parcela abater o saldo devedor, o valor da parcela deve
      //   ser incorporada ao saldo novamente, pois a mesma é deduzida na procedure
      //   CalculaItens. Isso somente irá acontecer para a fundação que trabalhar com
      //   atualização diária de saldo devedor, no caso, atualmente só a FUNCEF.   ALEX123


      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
      begin
         fSaldoDev := qryVLRSOLIC.AsCurrency;
         vLista[i].SaldoDevedor := fSaldoDev;
      end;

      // Parcela -----------------------------------------------------------------------------------
      if ( (vLista[i].iEvento = 1) and (vLista[i].FlgCentraliza = 1) ) then
      begin
         if (vLista[i].Valor > 0) then
         begin
            edtValorParcela.Value := vLista[i].Valor;
         end
         else
         begin
            edtValorParcela.Value := 0;
         end;

         if (iImprimeInsc = 1) then
         begin
            if (length(sSQLImpressao) > 0) then
               sSQLImpressao := sSQLImpressao + 'UNION ' + #13;

            sSQLImpressao := sSQLImpressao +
            'SELECT '                                                           + #13 +
            '  ' + IntToStr(vLista[i].CodigoItem) + ' AS IDITEMEMPTMO, '        + #13 +
            '  ' + QuotedStr(vLista[i].Nome) + ' AS ITEM, '                     + #13 +
            '  ' + OraNumero(FloatToStr(vLista[i].Valor)) + ' AS VALOR, '       + #13 +
            '  ' + IntToStr(iOrdemImp)            + ' AS SEQIMPRESSAO, '        + #13 +
            '  ' + IntToStr(vLista[i].FlgCentraliza) + ' AS FLGCENTRALIZA, '    + #13 +
            '  ' + IntToStr(vLista[i].FlgDestacado)  + ' AS FLGDESTACADO, '     + #13 +
            '  ' + IntToStr(vLista[i].Regra)         + ' AS IDREGRA '           + #13 +
            'FROM DUAL '                                                        + #13;
         end;  // if iImprimeInsc = 1

      end;  // if ( (vLista[i].iEvento = 1) and (vLista[i].FlgCentraliza = 1) )
      // -------------------------------------------------------------------------------------------

      // Valor Líquido -----------------------------------------------------------------------------
      if ( (vLista[i].iEvento = 0) and (vLista[i].FlgCentraliza = 1) ) then
      begin
         edtLiquidoGeral.Value := vLista[i].Valor;
         if (iImprimeInsc = 1) then
         begin
            if (length(sSQLImpressao) > 0) then
               sSQLImpressao := sSQLImpressao + 'UNION ' + #13;

            sSQLImpressao := sSQLImpressao +
            'SELECT '                                                        + #13 +
            '  ' + IntToStr(vLista[i].CodigoItem) + ' AS IDITEMEMPTMO, '     + #13 +
            '  ' + QuotedStr(vLista[i].Nome) + ' AS ITEM, '                  + #13 +
            '  ' + OraNumero(FloatToStr(vLista[i].Valor)) + ' AS VALOR, '    + #13 +
            '  ' + IntToStr(iOrdemImp)            + ' AS SEQIMPRESSAO, '     + #13 +
            '  ' + IntToStr(vLista[i].FlgCentraliza) + ' AS FLGCENTRALIZA, ' + #13 +
            '  ' + IntToStr(vLista[i].FlgDestacado)  + ' AS FLGDESTACADO, '  + #13 +
            '  ' + IntToStr(vLista[i].Regra)         + ' AS IDREGRA '        + #13 +
            'FROM DUAL '                                                     + #13;
         end;
         edtOutrosDescontos.Value := qryVLRSOLIC.AsCurrency - vLista[i].Valor - edtSaldoAQuitar.Value + fVlrTotalDividas;
      end;

      // -------------------------------------------------------------------------------------------

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
          begin
          end;

      // -------------------------------------------------------------------------------------------

      // gravação do Valor Base (IOF)
      if ((vLista[i].iEvento = 0) and
           (vLista[i].CodigoItem = dtmEmptmo.qryParamEmptmoIDITEMIOF.AsInteger) ) then
      begin
         vLista[i].ValorBase := qryVLRSOLIC.AsCurrency;
      end;

      // -------------------------------------------------------------------------------------------

      // gravação do Valor Base (IOF Complementar)
      if ( (vLista[i].iEvento = 0) and
           (vLista[i].CodigoItem = dtmEmptmo.qryParamEmptmoIDITEMIOFCOMPLCON.AsInteger) ) then
      begin
           vLista[i].ValorBase := qryVLRSOLIC.AsCurrency - edtSaldoAQuitar.Value;
      end;

      // -------------------------------------------------------------------------------------------

      // é um item de concessão, mas não o líquido -------------------------------------------------
      if ( (vLista[i].iEvento = 0) and (vLista[i].FlgCentraliza = 0) ) then
      begin
         if (length(sSQLItens) > 0) then
             sSQLItens := sSQLItens + 'UNION ' + #13;

         sSQLItens := sSQLItens +
         'SELECT '                                                        + #13 +
         '  ' + IntToStr(vLista[i].CodigoItem) + ' AS IDITEMEMPTMO, '     + #13 +
         '  ' + QuotedStr(vLista[i].Nome) + ' AS ITEM, '                  + #13 +
         '  ' + OraNumero(FloatToStr(vLista[i].Valor)) + ' AS VALOR, '    + #13 +
         '  ' + IntToStr(vLista[i].SeqCalculo) + ' AS SEQCALCULO, '       + #13 +
         '  ' + IntToStr(vLista[i].FlgCentraliza) + ' AS FLGCENTRALIZA, ' + #13 +
         '  ' + IntToStr(vLista[i].FlgDestacado)  + ' AS FLGDESTACADO, '  + #13 +
         '  ' + IntToStr(vLista[i].Regra)         + ' AS IDREGRA '        + #13 +
         'FROM DUAL '                                                     + #13;

         if (iImprimeInsc = 1) then
         begin
            if length(sSQLImpressao) > 0 then
            sSQLImpressao := sSQLImpressao + 'UNION ' + #13;

            sSQLImpressao := sSQLImpressao +
            'SELECT '                                                        + #13 +
            '  ' + IntToStr(vLista[i].CodigoItem) + ' AS IDITEMEMPTMO, '     + #13 +
            '  ' + QuotedStr(vLista[i].Nome) + ' AS ITEM, '                  + #13 +
            '  ' + OraNumero(FloatToStr(vLista[i].Valor)) + ' AS VALOR, '    + #13 +
            '  ' + IntToStr(iOrdemImp)            + ' AS SEQIMPRESSAO, '     + #13 +
            '  ' + IntToStr(vLista[i].FlgCentraliza) + ' AS FLGCENTRALIZA, ' + #13 +
            '  ' + IntToStr(vLista[i].FlgDestacado)  + ' AS FLGDESTACADO, '  + #13 +
            '  ' + IntToStr(vLista[i].Regra)         + ' AS IDREGRA '        + #13 +
            'FROM DUAL '                                                     + #13;
         end;
      end;
      // -------------------------------------------------------------------------------------------

   end;  // for i := 0 to High(vLista)

   if (length(sSQLItens) > 0) then
       sSQLItens := sSQLItens + 'ORDER BY SEQCALCULO ' + #13;
   if (length(sSQLImpressao) > 0) then
       sSQLImpressao := sSQLImpressao + 'ORDER BY SEQIMPRESSAO ' + #13;

   // abre - ou não - a query de itens
   try
      qryItensConcessao.SQL.Text := sSQLItens;
      qryItensConcessao.Open;
   except
      // nada aqui, no caso de o sSQLItens ser Invalido
      Raise;
      qryItensConcessao.Close;
   end;

   // abre - ou não - a query de itens
   if (length(sSQLImpressao) > 0) then
   begin
      try
         qryItensImpressao.SQL.Text := sSQLImpressao;
         qryItensImpressao.Open;
      except
         // nada aqui, no caso de o sSQLItens ser Invalido
         Raise;
         qryItensImpressao.Close;
      end;
   end;
end;

function TfrmCadInscricao.Simulacao : Boolean;
var
   sAnoMesCompet        : String;
   sSQL, sSQLExec       : String;
   vSQL                 : array of String;
   i, j, iPMin, iPMax   : Integer;
   vListaSimulacao      : TListaItem;
   iTamanhoVetor        : Integer;
   //Pendência 24901 - 31/03/2007 - Alberto - Padrão 16
   nValMargem           ,
   nValSolic            : Currency;
   //Fim Pendência 24901
begin
   Result := True;

   // Número mínimo de Parcelas em relação ao tipo de contrato escolhido pelo participante
   iPMin := trunc(DBspeParcelas.MinValue);

   // Número máximo de Parcelas em relação ao tipo de contrato escolhido pelo participante
   iPMax := trunc(DBspeParcelas.MaxValue);

   sSQL  := '';

   // Vetor que armazenará uma linha de SQL para cada parcela a ser mostrada no Grid
   vSQL           := nil;
   iTamanhoVetor  := 0;

   // Vetor que armazenará uma linha de itens de concessão e seus respectivos valores
   //   para cada item levando em consideração o Número de Parcelas 
   vListaSimulacao := nil;

   // Configurando o Form com a Barra de Progresso
   frmProgresso.MostraFormProgresso('Simulando Empréstimo...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    iPMax
                                   );

   try
      for i := 1 to iPMax do
      begin
         // Atualizando a Barra de Progresso
         frmProgresso.AndaFormProgresso(i);

         // Verifica se o usuário Cancelou a Operação
         if frmProgresso.Cancelou then
         begin
            Result := False;
            Exit;
         end;

         if qryTipoContratoIDREGRAPRAZOSCONC.AsString <> '' then
         begin
            // Verifica se a Parcela pode ser concedida ou não usando a
            //   VerificaPrazoConcessao que é uma função da unit UCalcEmptmo,
            //   caso negativo interrompe o procedimento indo para o próximo item
            //   do laço(for) 
            if not(CalcEmptmo.VerificaPrazoConcessao(qryIDPESSOA.AsInteger,
                                                     qryIDBENEF.AsInteger,
                                                     i,  // Nº Parcela
                                                     qryTipoContratoIDREGRAPRAZOSCONC.AsInteger
                                                     //Pendência 22836 - 03/10/2006 - Alberto
                                                    ,chkExcepcional.Checked)) or
                                                     //Fim Pendência 22836
               ( (i < iPMin) or (i > iPMax) ) or
               ( vPrazo[i] = 0 ) then
            begin
               Continue;
            end;
         end
         else  // if qryTipoContratoIDREGRAPRAZOSCONC.AsString <> ''
         begin
            if ( (i < iPMin) or (i > iPMax) ) or ( vPrazo[i] = 0 ) then Continue;
         end;  // if qryTipoContratoIDREGRAPRAZOSCONC.AsString <> ''

         inc(iTamanhoVetor);

         // Montagem de uma linha do SQL referente a uma parcela que será passado
         //   para a query do frmSimulacao 
         sSQL := 'SELECT ' + ' ' + IntToStr(i) + ' as "Prazo", ';

         // Procedimento que armazena os dados da Inscrição num registro 
         PreencheDadosContrato(i);

         sAnoMesCompet  := FormatDateTime('YYYYMM', rNovoContrato.DataAssinatura);

         // Utiliza a função CalculaItens da unit UCalcEmptmo para pegar a parcela e
         //   os itens de concessão com seus respectivos valores, em relação ao número de
         //   parcelas escolhida pelo participante 

         if not(qryContratosAnteriores.IsEmpty) then
         begin
            rConcessao.IDContratoEmptmo := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
            rConcessao.ValorSolic       := qryContratosAnterioresVLRCONTRATO.AsCurrency;
            rConcessao.DataCredito      := qryContratosAnterioresDATACREDITO.AsDateTime;
            rConcessao.Prazo            := qryContratosAnterioresNUMPARCELAS.AsInteger;
            rConcessao.Taxa             := qryContratosAnterioresTXJUROS.AsCurrency;

            // André Pontes - 21/12/2003 - FUNCEF
            // Acumula o valor apurado de devolução do valor do seguro,
            // para passar para as regras de cálculo dos itens de concessão
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               fVlrDevSeg           := 0;
               fVlrSeguroAnt        := 0;
               fVlrSeguroComplAnt   := 0;

               qryContratosAnteriores.First;
               while not(qryContratosAnteriores.EOF) do
               begin
                  if qryContratosAnterioresFLGESCOLHA.AsInteger = 1 then
                  begin
                     fVlrDevSeg := fVlrDevSeg + qryContratosAnterioresVLRDEVSEG.AsCurrency;

                     // André Pontes - 07/01/2004
                     //    Foi pedido pelo Bobrov que as regras de concessão recebam os valores totais de
                     //    seguro (concessão) e seguro complementar (refinanciamento)
                     //    do(s) contrato(s) anterior(es)

                     fVlrSeguroAnt        := (fVlrSeguroAnt        + CalcEmptmo.PegaSeguroAnt(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat));
                     fVlrSeguroComplAnt   := (fVlrSeguroComplAnt   + CalcEmptmo.PegaSeguroComplAnt(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat));

                     // FIM André Pontes - 07/01/2004
                  end;

                  qryContratosAnteriores.Next;
               end;
            end;
            // FIM André Pontes - 21/12/2003 - FUNCEF

         end;

         // André Pontes - 22/08/2005
         // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
         dtmEmptmo.Regra.IDCalculo  := 0;
         // FIM André Pontes - 22/08/2005

         //Pendência 24901 - 31/03/2007 - Alberto - Padrão 16
         if (Sistema.TipoCliente = 19981) then
         begin

            nValMargem := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                 qryIDBENEF.AsInteger,
                                                 qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                 fVlrSalBase,
                                                 edtTotalParcelas.Value,
                                                 edtTotalPendencias.Value,
                                                 fSalParticipacao,
                                                 fSalMantido,
                                                 fSalAuxDoenca,
                                                 fSalBenef,
                                                 True,
                                                 qryDATAINSC.AsDateTime,
                                                 i,   // Quant.Parcelas da Simulação

                                                 vDividasAnteriores,
                                                 
                                                 false,
                                                 0,
                                                 chkExcepcional.Checked,
                                                 DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                 edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                 0, // Ádler Souza - SOL 75516 Kintana 523281
                                                 -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                 qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                );

            nValSolic := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                                     qryIDSITPART.AsInteger,
                                                     edtPercentJuros.Value,
                                                     nValMargem,
                                                     edtValReserva.Value,
                                                     edtSaldoAQuitar.Value + fVlrTotalDividas,
                                                     edtQuitacao.Value + edtQuitacaoDividas.Value,
                                                     edtSalParticipacao.Value,
                                                     edtSalMantido.Value,
                                                     edtSalAuxDoenca.Value,
                                                     edtSalBenef.Value,
                                                     fVlrSalBase,
                                                     True,
                                                     //Pendência 26951 - 03/12/2007
                                                     vDividasAnteriores,
                                                     0,
                                                     chkExcepcional.Checked,
                                                     qryContratosAnteriores,
                                                     //Fim Pendência 26951
                                                     // SOL:108099 Daniel Begnami
                                                     StrToInt(edtPrazoSuspensao.text),
                                                     iIDTipoSuspEmptmo
                                                     // FIM
                                                   );
         end
         else
         begin
            nValSolic  := qryVLRSOLIC.AsCurrency;
            nValMargem := edtValMargem.Value;
         end;
         //Fim Pendência 24901


         CalcEmptmo.CalculaItens(rNovoContrato,
                                 rConcessao,
                                 0,                         // Tipo do item - É parcela 0 na Concessão
                                 0,                         // Origem - 0 na Inscrição
                                 iPais, sEstado, iCidade,
                                 0,                         // concessão
                                 qryIDSITPART.AsInteger,    // Débito - Folha ou Contas a Receber
                                 rNovoContrato.FlgFormaPag,
                                 rNovoContrato.Txjuros,
                                 0,                         // Na concessão o Saldo Devedor inicia com Zero e depois de calculado será o Valor Solicitado
                                 //Pendência 24901 - 31/03/2007 - Alberto - Padrão 16
                                 //qryVLRSOLIC.AsCurrency,    // Valor Solicitado
                                 nValSolic,
                                 edtSaldoaQuitar.Value,     // Saldo de Empréstimo Anteriores
                                 //edtValMargem.Value,
                                 nValMargem,
                                 //Fim Pendência 24901
                                 edtValReserva.Value,
                                 fSalParticipacao, fSalMantido, fSalAuxDoenca, fSalBenef,
                                 qryVLRSALBASE.ASCurrency,
                                 qryVLRMAXPERMIT.AsCurrency,
                                 iNumParcPagas,
                                 iPrazoAnterior,
                                 iUltParcGerada,
                                 rNovoContrato.DataAssinatura,
                                 rNovoContrato.DataAssinatura,
                                 sAnoMesCompet,
                                 False,                     // bInterrompe
                                 True,                      // bMsg
                                 True,                      // Progresso
                                 vListaSimulacao,
                                 fVlrDevSeg,
                                 fVlrSeguroAnt,
                                 fVlrSeguroComplAnt,
                                 True,
                                 edtQuitacao.Value,
                                 fVlrTotalDividas,
                                 iTipoContrAnt,
                                 False,                           // bCriaObjetoRegra    : Boolean = False;
                                 0,                               // dDataAtraso         : TDateTime = 0;
                                 0,                               // fValorEmAberto      : Currency = 0;
                                 0,                               // dDataAtrasoAnt      : TDateTime = 0;
                                 0,                               // fValorEmAbertoAnt   : Currency = 0;
                                 0,                               // fValorProvisao      : Currency = 0;
                                 True,                            // bGravaQueryRegra    : Boolean = True;
                                 ord(chkFinanciamento.Checked)    // iFinanciamento      : Integer = 0
                                 //Pendência 22836 - 03/10/2006 - Alberto
                                 ,chkExcepcional.Checked,
                                  //Fim Pendência 22836
                                 // SOL:108099 Daniel Begnami
                                 StrToInt(edtPrazoSuspensao.text),
                                 iIDTipoSuspEmptmo,
                                 // FIM
                                 qryContratosAnteriores, //Renato Visoni SOL 124858 KINTANA 638072
                                 edtDataCredito.Date,    //Renato Visoni SOL 124858 KINTANA 638072
                                 DBspeParcelas.Text,     //Jéssica Lana  SOL 127055
                                 chkliquidozero.Checked // Wylliam Leite da Silva SOL: 156456 Kintana: 1234816
                                );

         // A declaração do array não aloca memoria.
         //   Uso a procedure SetLength para criar o array em memória, determinando
         //   ou alterando seu tamanho dinâmicamente conforme necessário
         SetLength(vSQL, iTamanhoVetor);

         // Laço que varre o vetor Lista adicionando ao SQL TODOS os itens de
         //   concessão e o valor da parcela referente a aquela parcela
         for j := 0 to High(vListaSimulacao) do
         begin
            //Pendência 24901 - 14/04/2007 - Alberto - Padrão 16
            if (Sistema.TipoCliente = 19981) and (J = 2) then
               sSQL := sSQL + ' ' + OraNumero(FloatToStr(nValMargem))
                            + ' as "Margem Consig.",';
            //Fim Pendência 24901
            // passagem para o SQL do valor do item de PARCELA/CONCESSÃO e seu respectivo nome
            sSQL := sSQL + ' ' + OraNumero(FloatToStr(vListaSimulacao[j].Valor))
                         + ' as "'+  vListaSimulacao[j].Nome + '",';

         end;  // for j := 0 to High(vListaSimulacao)

         // Armazena no Vetor a Linha de SQL montada para uma determinada parcela
         vSQL[iTamanhoVetor-1] := Copy(sSQL, 0, Length(sSQL) - 1) + ' FROM DUAL';

      end;  // for i := 1 to iPMax

      // Laço que varre o vetor vSQL buscando TODAS as linha do SQL referente a
      //    TODAS as parcela e montando o SQL completo que será passado para a query
      //    do frmSimulacao que mostrará TODAS as parcelas e seus respectivos valores
      for j := 0 to High(vSQL) do
      begin
         if j <= 0 then
         begin
            sSQLExec := vSQL[j];
         end
         else
         begin
            // Verifica se o SQL da Parcela está vazio caso positivo não adiciona
            //    o UNION e o SQL vazio ao SQL completo
            if vSQL[j] <> '' then sSQLExec := sSQLExec + ' UNION ' + vSQL[j];
         end;  // if j <= 1
      end;  // for j

      // Atualizando a Barra de Progresso
      frmProgresso.AndaFormProgresso(iPMax);

      // Atribuição do SQL completo para a propridade SQL do frmSimulacao que tem
      //   como objetivo receber o SQL que será usado na Query do Grid
      FrmRelSimula.SQL := sSQLExec;

   finally
      EscondeFormProgresso;
      Repaint;
   end;
end;



procedure TfrmCadInscricao.DBedtValorSolicExit(Sender: TObject);
begin
   inherited;

   Application.ProcessMessages;

   if (ActiveControl = bbtnCancelar) then Exit;

   fParcelaAnt := DBspeParcelas.Value; // André Pontes - 26/01/2006

   //Pendência 22645 - 23/06/2006 - Alberto
   
   if (qryVLRSOLIC.AsCurrency <> fVlrAnterior) or (Sistema.TipoCliente = 19981) then
   //Fim Pendência 22645
   begin
      if ( not(chkExcepcional.Checked) and not(chkFinanciamento.Checked) and
           (qryVLRSOLIC.AsCurrency > qryVLRMAXPERMIT.AsCurrency)
         ) then
      begin
         MsgDlg('O Valor Solicitado não pode ser maior que ' + FormatFloat('#,##0.00', qryVLRMAXPERMIT.AsCurrency) +
                ' (valor máximo permitido)', 'Empréstimo', mtWarning, [mbOk], 0); //ERALDO SILVA SOL 163088 KINTANA 1389583
         Repaint;
         
         // if DBedtValorSolic.CanFocus then DBedtValorSolic.SetFocus
         qryVLRSOLIC.AsCurrency     := fVlrAnterior;
         DBedtValorSolic.Modified   := False;

         Exit;
      end;

      // verifica se o valor digitado é maior que o maior valor possível, já definido
      if (qryVLRSOLIC.AsCurrency < (edtSaldoaQuitar.Value +  fVlrTotalDividas)) then
      begin
         MsgDlg('O Valor Solicitado não pode ser menor que o Saldo a Quitar!', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         // if DBedtValorSolic.CanFocus then DBedtValorSolic.SetFocus
         qryVLRSOLIC.AsCurrency     := edtSaldoaQuitar.Value + fVlrTotalDividas;
         DBedtValorSolic.Modified   := True;
      end;

      // se o valor digitado for ZERO, joga de volta para o máximo permitido
      if qryVLRSOLIC.AsCurrency = 0 then
      begin
         // função da unit UCalcEmptmo que busca o Valor Máximo Possivel para o Empréstimo
         //   o valor é armazenado no atributo interno FVlrSolic
         FVlrSolic := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                                  qryIDSITPART.AsInteger,
                                                  edtPercentJuros.Value,
                                                  edtValMargem.Value,
                                                  edtValReserva.Value,
                                                  edtSaldoaQuitar.Value + fVlrTotalDividas,
                                                  edtQuitacao.Value + edtQuitacaoDividas.Value,
                                                  edtSalParticipacao.Value,
                                                  edtSalAuxDoenca.Value,
                                                  edtSalMantido.Value,
                                                  edtSalBenef.Value,
                                                  qryVLRSALBASE.AsCurrency,
                                                  True,   // Mostra
                                                  //Pendência 26951 - 03/12/2007
                                                  vDividasAnteriores,
                                                  //Pendência 22836 - 03/10/2006 - Alberto
                                                  0,
                                                  chkExcepcional.Checked,
                                                  //Fim Pendência 22836
                                                  qryContratosAnteriores,
                                                  //Fim Pendência 26951
                                                  // SOL:108099 Daniel Begnami
                                                  StrToInt(edtPrazoSuspensao.text),
                                                  iIDTipoSuspEmptmo
                                                  // FIM
                                                 );

         fVlrMaxPermit := FVlrSolic;

         // Marchetti - Pendencia 27061
         SetValorMaxPermit(fVlrMaxPermit);
         // Fim Marchetti - Pendencia 27061


         if fVlrMaxPermit = -1 then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Não foi possível recuperar o valor máximo possível para o empréstimo.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            bbtnCancelarClick(bbtnCancelar);
            Exit;
         end;

         // no momento da escrita (write) da property VlrSolic acontece o evento SetValorSolic
         //   atribui para o valor do campo Valor solicitado o valor máximo e calcula Parcela
         VlrSolic := FVlrSolic;
      end;

      // Verifico se houve alguma mudança no Valor Solicitado. Caso positivo,
      //   a propriedade Modified do DBedtValorSolic é True
      if DBedtValorSolic.Modified then
      begin
         // Procedure que Calcula o Valor da parcela, verificando também se é atendida
         //   a Regra de Limites e calculando o valor Líquido do Empréstimo

         // Thiago Melo SOL 183326 Kintana 1712188
         CalculaParcela(0);
         //

         //Pendência 22645 - 23/06/2006 - Alberto
         ActiveControl.SetFocus;
         //Fim Pendência 22645
      end;

   end;  // qryVLRSOLIC.AsCurrency <> fVlrAnterior
end;



procedure TfrmCadInscricao.DBspeParcelasExit(Sender: TObject);
var
   fValorSolic : Double;
begin
   inherited;

   Application.ProcessMessages;

   // Verifica se houve alguma mudança no número de parcelas. Caso positivo,
   //   a propriedade Modified do DBSinpEdit é True
   //Pendência 22645 - 23/06/2006 - Alberto

   if (DBspeParcelas.Value <> fParcelaAnt) or (Sistema.TipoCliente = 19981) then
   //Fim Pendência 22645
   begin


      // SOL:108099 Daniel Begnami
      // -------------------------------------------------------------------------------------------
      // André Pontes - 17/05/2006
{
      if Sistema.TipoCliente = 19981 then
      begin
         edtValMargem.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                      qryIDBENEF.AsInteger,
                                                      qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                      fVlrSalBase,
                                                      edtTotalParcelas.Value,
                                                      edtTotalPendencias.Value,
                                                      fSalParticipacao,
                                                      fSalMantido,
                                                      fSalAuxDoenca,
                                                      fSalBenef,
                                                      True,
                                                      qryDATAINSC.AsDateTime,
         //Pendência 22248 - 03/08/2006 - Alberto
                                                      //qryNUMPARCELAS.AsInteger,
                                                      trunc(DBspeParcelas.Value),

                                                      vDividasAnteriores,

                                                      chkFinanciamento.Checked
                                                      //Pendência 22836 - 03/10/2006 - Alberto
                                                     ,0
                                                     ,chkExcepcional.Checked
                                                      //Fim Pendência 22836
                                                     );
         fVlrMaxPermit              := 0;
         SetTxJuros;
         qryVLRMARGEM .AsCurrency   := edtValMargem.Value;
         qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
         edtLimiteDisp.Value        := qryVLRMAXPERMIT.AsCurrency - edtSaldoAQuitar.Value - fVlrTotalDividas;
         //Fim Pendência 22284
      end;
      // FIM André Pontes - 17/05/2006
}
      // FIM SOL:108099 Daniel Begnami
      // -------------------------------------------------------------------------------------------

      // Verifica se a Parcela pode ser concedida ou não usando a
      //   VerificaPrazoConcessao que é uma função da unit UCalcEmptmo
      if not(CalcEmptmo.VerificaPrazoConcessao(qryIDPESSOA.AsInteger,
                                               qryIDBENEF.AsInteger,
                                               trunc(DBspeParcelas.Value),                   // nº da Parcela
                                               qryTipoContratoIDREGRAPRAZOSCONC.AsInteger
                                               //Pendência 22836 - 03/10/2006 - Alberto
                                              ,chkExcepcional.Checked)) then
                                               //Fim Pendência 22836
      begin
         MsgDlg('Este Prazo não é permitido!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;

         qryNUMPARCELAS.AsFloat := fParcelaAnt;
         DBspeParcelas.Modified := False;
      end
      else
      begin
         // Procedure que Calcula o Valor da parcela, verificando também se é atendida
         //   a Regra de Limites e calculando o valor Líquido do Empréstimo
         //Pendência 22645 - 30/06/2006 - Alberto
         fValorSolic := qryVLRSOLIC.AsCurrency;


         Self.SetTxJuros;  // SOL:108099 Daniel Begnami

         // Thiago Melo SOL 183326 Kintana 1712188
         CalculaParcela(0);
         //

         if fValorSolic <> qryVLRSOLIC.AsCurrency then
            BuscaValorLiquidoEP;
         ActiveControl.SetFocus;
         //Fim Pendência 22645
      end;  // not(VerificaPrazoConcessao)
   end;  // DBspeParcelas.Value <> fParcelaAnt
end;



procedure TfrmCadInscricao.bbtnSimulaClick(Sender: TObject);
begin
   inherited;

    // SOL 167098 KINTANA 1464093 Jonas Otavio - Inicio
    // qryAux               := TwwQuery.Create(Application);
    //qryAux.DatabaseName  := 'BaseDados';
    //DataBaseName := 'BaseDados';
    with qryAux do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT CONTABANCARIA.IDAGENCIA, ');
    Sql.Add('AGENCIABANCARIA.IDBANCO,  ');
    Sql.Add(' BANCO.NUMBANCO,        ');
    Sql.Add('CONTABANCARIA.IDCBANCARIA   ');
    Sql.Add('  FROM BANCO, AGENCIABANCARIA, CONTABANCARIA  ');
    Sql.Add('  WHERE BANCO.NUMBANCO = 104  ');
    Sql.Add('  AND CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA   ');
    Sql.Add('  AND AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA    ');
    Sql.Add('  AND CONTABANCARIA.IDCBANCARIA = ' + dtmLookEmptmo.qryLookDadosBancarios.FieldByName('IDCBANCARIA').asstring ) ;

    Open;
    end;

    if Qryaux.isEmpty then
    begin
         MsgDlg('A conta bancária selecionada para crédito do empréstimo deve ser obrigatóriamente da Caixa Econômica Federal', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
         pgcValores.activePage := tbsIntegracao;
         exit;
     end;
     // SOL 167098 KINTANA 1464093 Jonas Otavio - FIM
    

   if trim(DBcboTipoContrato.LookupValue) = EmptyStr then
      Exit;

   try
      if qryIDTipoContrEmptmo.IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato!', DBcboTipoContrato);

      if qryDATAINSC.IsNull then
         raise EValidacao.CreateVal('É necessário indicar a data da Solicitação!', DBedtDataInsc);


      if qryNUMPARCELAS.IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Número de Parcelas!', DBspeParcelas);

      // -------------------------------------------------------------------------------------------

      SetLength(vPrazo, 0);

      Application.CreateForm(TfrmPrazoSimula, frmPrazoSimula);
      frmPrazoSimula.iTipoContrato := StrToInt(DBcboTipoContrato.LookupValue);
      frmPrazoSimula.ShowModal;

      if frmPrazoSimula.ModalResult <> mrOk then
         raise EValidacao.CreateVal('Simulação interrompida.', bbtnSimula);

      // -------------------------------------------------------------------------------------------

      Application.CreateForm(TfrmRelSimula, frmRelSimula);

      if Simulacao then
      begin
         frmRelSimula.ShowModal;
         frmRelSimula.Release;
      end
      else
      begin
         frmRelSimula.Free;
      end;

      // -------------------------------------------------------------------------------------------

      //Ádler Souza - SOL Nº 132424 KINTANA Nº 762897
      if PossuiSuspensaoConcessao(qryIDBENEF.AsInteger) then
      begin
        LogToFile('Crítica PossuiSuspensaoConcessao', sArq);
        Exit;
      end;
      //Fim - Ádler Souza - SOL Nº 132424 KINTANA Nº 762897

      // -------------------------------------------------------------------------------------------
   except
      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;

         if ev.Control.Parent is TTabSheet then
         begin
            ((ev.Control.Parent as TTabSheet).Parent as TPageControl).ActivePage := (ev.Control.Parent as TTabSheet);
         end;
         if ev.Control.CanFocus then ev.Control.SetFocus;

         Exit;
      end;
   end;
end;

procedure TfrmCadInscricao.bbtnContratoClick(Sender: TObject);
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
   //Pendência 26916 - 21/12/2007

   bExisteSusp : Boolean;
   iQtdIDTIPOEMPTMO,   iQtdIDTIPOCONTREMPTMO : Integer;
   //Fim Pendência 26916

   // SOL 164198 KINTANA 1409417 Vinicius Ferreira
   xQrySuspPlanPrevDtf, xQrySuspPlanPrevPind, xQryPlanContabil : TwwQuery;
   sIdPlaContabil, sDias : String;
   i, i2 : Integer;
   sQtdDiasBloq : Extended;

// SOL 164198 KINTANA 1409417 Vinicius Ferreira
begin

   //Inicio TADEU PASSOS SOL 196724 Kintana 1899039
   if edtDataCredito.Text <> '' then
     if not VerificaAmortizacao then
     begin
      qryContratosAnteriores.Filtered := False;
      Exit;
     end;
    qryContratosAnteriores.Filtered := False;
   //Fim TADEU PASSOS SOL 196724 Kintana 1899039

   //Mosé Pietro SOL 185618 KTN 1741527 - inicio

   if (qryVLRSOLIC.AsCurrency <> fVlrAnterior) or (Sistema.TipoCliente = 19981) then
   begin
      if ( not(chkExcepcional.Checked) and not(chkFinanciamento.Checked) and
           (qryVLRSOLIC.AsCurrency > qryVLRMAXPERMIT.AsCurrency)) Then
      begin
         MsgDlg('O Valor Solicitado não pode ser maior que ' + FormatFloat('#,##0.00', qryVLRMAXPERMIT.AsCurrency) +
                ' (valor máximo permitido)', 'Empréstimo', mtWarning, [mbOk], 0);
          Exit;
      end;
   end;
   //Mosé Pietro SOL 185618 KTN 1741527  - Fim

   // SOL 164198 KINTANA 1409417 Vinicius Ferreira - Início

   // SOL 167098 KINTANA 1464093 Jonas Otavio - Inicio
    with qryAux do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT CONTABANCARIA.IDAGENCIA, ');
    Sql.Add('AGENCIABANCARIA.IDBANCO,  ');
    Sql.Add(' BANCO.NUMBANCO,        ');
    Sql.Add('CONTABANCARIA.IDCBANCARIA   ');
    Sql.Add('  FROM BANCO, AGENCIABANCARIA, CONTABANCARIA  ');
    Sql.Add('  WHERE BANCO.NUMBANCO = 104  ');
    Sql.Add('  AND CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA   ');
    Sql.Add('  AND AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA    ');
    Sql.Add('  AND CONTABANCARIA.IDCBANCARIA = ' + trim(dtmLookEmptmo.qryLookDadosBancarios.FieldByName('IDCBANCARIA').asstring)) ;
    Open;
    end;

    if Qryaux.isEmpty then
    begin
         MsgDlg('A conta bancária selecionada para crédito do empréstimo deve ser obrigatóriamente da Caixa Econômica Federal', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
         pgcValores.activePage := tbsIntegracao;
         exit;
     end;

     // SOL 167098 KINTANA 1464093 Jonas Otavio - FIM

     inherited;

  //William Moreira da Silva - SOL 207748 Kintana 2006973 - INICIO
  //AbreQueriesDividas;  //William Moreira da Silva - SOL 207748 Kintana 2006973
  qryContratosAnteriores2.First;
  while not(qryContratosAnteriores2.EOF) do
  begin
  if not(chkExcepcional.Checked) then
     begin
     if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                        True,
                                         edtDataCredito.Date,
                                         True,
                                         StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                         StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                         // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                         1
                                        //Pendência 27232 - 16/04/2008
                                        //) then
                                        ) <> 0 then
        begin
           MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
           Repaint;
           Exit;
        end;
     end;
     qryContratosAnteriores2.Next;
  end;
  //William Moreira da Silva - SOL 206168 Kintana 1995405 - FIM

  //MONICA - SOL 172525 - Inicio
  try
    Application.createform(TfrmNup, frmNup);
    frmNup.sMatricula  := trim(qry.FieldByName('IDTIPOCONTREMPTMO').AsString);
    frmNup.formstyle   := fsnormal;
    frmnup.visible     := False;
    frmNup.showmodal;
    rNovoContrato.sNumNup :=trim(frmNup.edtNumNup.text);

   //Mosé Pietro SOL 179958 KINTANA 1660970 - INICIO
    if ( frmNup.cancelar = '1')then
        begin
        frmNup.cancelar:='0';
        abort;
       end;
    //Mosé Pietro SOL 179958 KINTANA 1660970 - FIM
  finally
    frmNup.release;
  end;
   //MONICA - SOL 172525 - FIM

   If not (chkExcepcional.Checked) then
     begin
     xQrySuspPlanPrevDtf := TwwQuery.Create(nil);
     with xQrySuspPlanPrevDtf do
      begin
      DataBaseName := 'BaseDados';
      Close;
      Sql.Clear;
      Sql.Add(' Select Count(1) Over() AS Qtde, ');
      Sql.Add('  IDSUSPXPLANOPREVEMPTMO,        ');
      Sql.Add('  IDPLANOPREV,                   ');
      Sql.Add('  IDPLANOPREVCONTABIL,           ');
      Sql.Add('  DTINICIO,                      ');
      Sql.Add('  DTFIM,                         ');
      Sql.Add('  FLGPRAZOINDETERMINADO,         ');
      Sql.Add('  TRGDTINCLUSAO,                 ');
      Sql.Add('  TRGUSERINCLUSAO                ');
      Sql.Add(' From suspxplanoprevemptmo       ');
      Sql.Add(' Where                           ');
      Sql.Add('  (TO_DATE(dtinicio, ''DD/MM/YYYY'') <=                ');
      Sql.Add('   TO_DATE(sysdate, ''DD/MM/YYYY'') and                ');
      Sql.Add('  (TO_DATE(dtfim, ''DD/MM/YYYY'') >=                   ');
      Sql.Add('   TO_DATE(sysdate, ''DD/MM/YYYY'') or dtfim is null)) ');
      Sql.Add(' and flgprazoindeterminado = 0   ');
      Sql.Add(' and idplanoprev = '+trim(qryIDPLANOPREV.AsString));
      Open;
     end;
     xQrySuspPlanPrevPind := TwwQuery.Create(nil);
     with xQrySuspPlanPrevPind do begin
      DataBaseName := 'BaseDados';
      Close;
      Sql.Clear;
      Sql.Add(' Select Count(1) Over() AS Qtde, ');
      Sql.Add('  IDSUSPXPLANOPREVEMPTMO,        ');
      Sql.Add('  IDPLANOPREV,                   ');
      Sql.Add('  IDPLANOPREVCONTABIL,           ');
      Sql.Add('  DTINICIO,                      ');
      Sql.Add('  DTFIM,                         ');
      Sql.Add('  FLGPRAZOINDETERMINADO,         ');
      Sql.Add('  TRGDTINCLUSAO,                 ');
      Sql.Add('  TRGUSERINCLUSAO                ');
      Sql.Add(' From suspxplanoprevemptmo       ');
      Sql.Add(' Where                           ');
      Sql.Add('  (TO_DATE(dtinicio, ''DD/MM/YYYY'') <= TO_DATE(sysdate, ''DD/MM/YYYY'')) ');
      Sql.Add('  and flgprazoindeterminado = 1  ');
      Sql.Add('  and idplanoprev = '+trim(qryIDPLANOPREV.AsString));
      Open;
     end;

     xQryPlanContabil := TwwQuery.Create(nil);
     with xQryPlanContabil do begin
      DataBaseName := 'BaseDados';
      Close;
      Sql.Clear;
      Sql.Add(' Select ppc.idplanoprev, ppc.nome, pp.nome as nomeprev       ');
      Sql.Add(' from planprevcontabil ppc,planprev pp                       ');
      Sql.Add(' Where ppc.flgexclusivocontab = ''N'' and ppc.ativo = ''S''  ');
      Sql.Add(' and ppc.idplanoprevprev = pp.idplanoprev                    ');
      Sql.Add(' and ppc.idplanoprevprev = '+trim(qryIDPLANOPREV.AsString));
      Open;
     end;

     if (xQryPlanContabil.RecordCount > 0) then
         begin
        sIdPlaContabil := '';
        i := 0;
        xQryPlanContabil.First;
        for i := 0 to (xQryPlanContabil.RecordCount - 1) do
          begin
          if i = 0 then
             sIdPlaContabil := (sIdPlaContabil + trim(xQryPlanContabil.fieldbyname('idplanoprev').AsString))
          else
             sIdPlaContabil := (sIdPlaContabil + ',' + trim(xQryPlanContabil.fieldbyname('idplanoprev').AsString));
         xQryPlanContabil.Next;
       end;
     End;

     if (xQrySuspPlanPrevPind.FieldByName('Qtde').asInteger > 0) then
     Begin
       If not (xQryPlanContabil.IsEmpty) then
          begin
          If not (VerificaExPlaContabil(sIdPlaContabil,trim(xQrySuspPlanPrevPind.FieldByName('IDPLANOPREVCONTABIL').AsString))) then
             Begin
             MsgDlg('A concessão de empréstimos para participantes e assistidos do '+xQryPlanContabil.FieldByName('nomeprev').AsString+' está suspensa por tempo indeterminado.', 'Empréstimo', mtWarning, [mbOk], 0);
             Exit;
             End;
       End;
     End;

     if (xQrySuspPlanPrevDtf.FieldByName('Qtde').asInteger > 0) then
     Begin
       If not (xQryPlanContabil.IsEmpty) then begin
         If not (VerificaExPlaContabil(sIdPlaContabil,xQrySuspPlanPrevDtf.FieldByName('IDPLANOPREVCONTABIL').AsString)) then
         Begin
          sQtdDiasBloq := ((xQrySuspPlanPrevDtf.FieldByName('DTFIM').asDateTime) - (xQrySuspPlanPrevDtf.FieldByName('DTINICIO').asDateTime)) +1;
          if (sQtdDiasBloq = 1) then
              sDias := 'dia'
          else
              sDias := 'dias';
          MsgDlg('A concessão de empréstimos para participantes e assistidos do '+xQryPlanContabil.FieldByName('nomeprev').AsString+' está suspensa por '+floattostr(sQtdDiasBloq)+' '+sDias+', a partir de '+xQrySuspPlanPrevDtf.FieldByName('DTINICIO').asString+'.', 'Empréstimo', mtWarning, [mbOk], 0);
          Exit;
          End;
       End;
     End;

   end;
   // SOL 164198 KINTANA 1409417 Vinicius Ferreira - Fim

    if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   Application.ProcessMessages;

   if trim(DBcboTipoContrato.LookupValue) = EmptyStr then
      Exit;

   // SOL:108099 Daniel Begnami
   if ((DBspeParcelas.value - 1) < StrToInt(edtPrazoSuspensao.text)) then
   begin
     ShowMessage('ATENÇÃO: O Número máximo para suspensão é de: ' + IntToStr(StrToInt(edtPrazoSuspensao.text)-1) + ' ' + 'parcela(s). Favor verificar.');
     exit;
   end;
   // FIM

   // ----------------------------------------------------------------------------------------------

      bbtnContrato.Enabled := False;
      bbtnSimula.Enabled   := False;
      bDesabilitouContrato := True;
     if (PossuiSuspensaoConcessao(qryIDBENEF.AsInteger)=true) and (trim(DBcboSuspensao.Text) = EmptyStr) then
      begin
        if MsgDlg('Tem certeza que deseja conceder este contrato sem suspensão?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
           exit;
      end;

   Application.ProcessMessages;

   // ----------------------------------------------------------------------------------------------

   LogToFile(' ', sArq, True, False);
   LogBPL(sArq);
   LogToFile(' ', sArq, True, False);
   LogToFile('Botao de Contrato pressionado', sArq);
   LogToFile('Tipo de Contrato: ' + FormatFloat('#0', rNovoContrato.IDTipoContrEmptmo) , sArq);

   ParametrosSistema;

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 13/06/2005 - pendência 19404
   // ----------------------------------------------------------------------------------------------
   try
      // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
      // estorno na data de cancelamento indicada
      sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataCredito.Date);
      iEmpresa    := Sistema.idEmpresa;
      sMsgContab  := '';

      if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
        raise EValidacao.CreateVal('Não é possível conceder para a Data de Crédito indicada:' + #13 + '"' + sMsgContab + '"', edtDataCredito);

      // André Pontes - 03/06/2005 - pendência 19404
      if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      begin
         sMsgContab := Contab.MessageInfo;
         raise EValidacao.CreateVal('Não é possível conceder para a Data de Crédito indicada:' + #13 + '"' + sMsgContab + '"', edtDataCredito);
      end;

   except
      on ev : EValidacao do
      begin
         LogToFile('Crítica de bloqueio contábil', sArq);

         if bDesabilitouContrato then
         begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
            bDesabilitouContrato := False;
         end;

         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
      end;
   end;
   // ----------------------------------------------------------------------------------------------
   // FIM André Pontes - 13/06/2005 - pendência 19404
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 01/02/2006
   try
      // Verifica se existe concessão de outro contrato para o mesmo dia ou posterior
      if not(CalcEmptmo.VerificaConcessaoIgualPosterior(qryIDPESSOA.AsInteger,
                                                        qryIDBENEF.AsInteger,
                                                        edtDataCredito.Date,
                                                        True,
                                                        True, StrToInt(DBcboTipoContrato.LookupValue)) ) then
      begin
         raise EValidacao.CreateVal('Já existe outro Contrato concedido para data posterior!', edtDataCredito);
      end;

   except
      on ev : EValidacao do
      begin
         LogToFile('Crítica de concessão posterior', sArq);

         if bDesabilitouContrato then
            begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
            bDesabilitouContrato := False;
            end;

         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   // FIM André Pontes - 01/02/2006
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
//                                      DUVIDA SE ELE REALMENTE VAI CONTRATAR EMPRÉSTIMO
   if MsgDlg('Deseja realmente CONTRATAR o Empréstimo?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;
      //Pendência 26916 - 21/12/2007
      // Verifica se o participante excedeu o número máximo de contrato,
      // logo ele será alertado que enquanto não Quitar quantidade
      // suficiente de contratos anteriores, NÃO poderá contratar este empréstimo
      if not(chkExcepcional.Checked) then
      begin

         iQtdIDTIPOEMPTMO      := 0;
         iQtdIDTIPOCONTREMPTMO := 0;

         qryContratosAnteriores.First;

         while not qryContratosAnteriores.EOF do
         begin

         if (qryContratosAnterioresFLGESCOLHA.AsInteger <> 1) then
             begin

               //BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO
               //IF qryContratosAnterioresFLGPERDAEFETIVA.AsInteger = 1 Then
               //   MsgDlg('PEDA EFETIVA', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
               //BRUNO AZEVEDO FIM - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO

               if ( qryContratosAnterioresIDTIPOEMPTMO.AsInteger = qryTipoContratoIDTIPOEMPTMO.AsInteger ) then
                  iQtdIDTIPOEMPTMO := (iQtdIDTIPOEMPTMO + 1);

               if ( qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger = qryTipoContratoIDTIPOCONTREMPTMO.AsInteger ) then
                  iQtdIDTIPOCONTREMPTMO := (iQtdIDTIPOCONTREMPTMO + 1);
            end;
            qryContratosAnteriores.Next;
         end;
         if ( qryTipoContratoTCEMAXCONTRATO.AsInteger <= iQtdIDTIPOCONTREMPTMO ) or
            ( qryTipoContratoTEPMAXCONTRATO.AsInteger <= iQtdIDTIPOEMPTMO ) then
         begin

            MsgDlg('Participante NÃO poderá contratar este tipo de empréstimo antes de ' +
                   'quitar o(s) contrato(s) anterior(es).', 'Empréstimo', mtWarning, [mbOk], 0);

            LogToFile('Crítica de limite de contratos ativos', sArq);

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;
           Exit;
         end;
         end;
      //Fim Pendência 26916
      // -------------------------------------------------------------------------------------------

      if PossuiSuspensaoConcessao(qryIDBENEF.AsInteger) then
         begin
         LogToFile('Crítica PossuiSuspensaoConcessao', sArq);

         if bDesabilitouContrato then
            begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
            end;
         Exit;
      end;
      // -------------------------------------------------------------------------------------------

      // Tratamento de Assinatura / Contrato Padrão
      if (dtmEmptmo.qryParamEmptmoFLGTRATAASSINAT.AsInteger = 1) then
      begin
         if not(PossuiAssinatura(qryIDPESSOA.AsFloat,
                                 qryIDBENEF.AsFloat,
                                 StrToInt(DBcboTipoContrato.LookupValue)
                                )) then
         begin
            LogToFile('Não possui assinatura', sArq);

            if bDesabilitouContrato then
               begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
               end;
            Repaint;
            Exit;
         end;
      end;

      // -------------------------------------------------------------------------------------------

      // Verifica se existe atualização diária para
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
         begin
         if not(dtmEmptmo.ExisteAtualizacaoDiariaMutuario(qryIDPESSOA.AsFloat,
                                                          qryIDBENEF.AsFloat,
                                                          edtDataCredito.Date
                                                         )) then
         begin
            MsgDlg('Mutuário não possui atualização diária para o dia ' + trim(edtDataCredito.Text) + '!', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;

            LogToFile('Não possui atualização diária para o dia', sArq);

            if bDesabilitouContrato then
               begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
               end;
            Exit;
         end;
      end;

      // -------------------------------------------------------------------------------------------
      // Marchetti - Pendencia 23647
      if (qryTipoContratoFLGVERPRAZOTIPOQUIT.AsInteger = 0) then
          begin
          if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) then
            begin
            // Andre Pontes - Pendência 14484 - 11/07/2003
            if not(qryContratosAnteriores.IsEmpty)
            // FIM Andre Pontes - Pendência 14484 - Andre Pontes - 11/07/2003
               and (iNumParcPagas < qryContratosAnterioresTCEMINRENOVA.AsInteger) then
            begin
               if PrimeiraRenovacao2006 then // André Pontes - Pendência 21272 / SOL 39805 - 19/01/2006
               begin
                  LogToFile('PrimeiraRenovacao2006', sArq);
               end
               else
               begin
                  MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                  Repaint;
                  LogToFile('Crítica de carência', sArq);
                  if bDesabilitouContrato then
                  begin
                     bbtnContrato.Enabled := True;
                     bbtnSimula.Enabled   := True;
                  end;
                  Exit;
               end;
            end;
         end
         else
         begin
            // ----------------------------------------------------------------------------------------
            if (iTotSiafi > 0) and
               not(chkExcepcional.Checked) and
               not(chkFinanciamento.Checked) then
            begin
               Screen.Cursor := crDefault;
               EscondeEspera;

               MsgDlg('Mutuário possui dívidas de Financiamento Habitacional. NÃO será possível contratar Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;

               LogToFile('Crítica de Financiamento Habitacional', sArq);

               if bDesabilitouContrato then
               begin
                  bbtnContrato.Enabled := True;
                  bbtnSimula.Enabled   := True;
               end;

               Exit;
            end;
            // ----------------------------------------------------------------------------------------
            // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
            //Pendência 27232 - 16/04/2008
            //if (qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) and (qryContratosAnteriores2.Active) then
            //Fim Pendência 27232

            // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
            //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) and
               //(qryContratosAnteriores2.Active) then
            //begin
            // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979

               //Pendência 27232 - 16/04/2008
               if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
                  begin
                  if (not chkExcepcional.Checked) and
                     (not ValidaTipoContratoEmprestimo(qryContratosAnteriores2,
                                                       qryIDPESSOA.AsInteger,
                                                       qryIDBENEF.AsInteger,
                                                       StrToInt(DBcboTipoContrato.LookupValue),
                                                       dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                                      )) then
                      begin
                     //LogToFile('Contrato anterior do mesmo tipo', sArq);
                     //MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     LogToFile('Tipo de contrato em aberto impede contratação', sArq);
                     MsgDlg('Tipo de contrato em aberto impede contratação!', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;

               end;
               //Fim Pendência 23733

               qryContratosAnteriores2.First;
               while not(qryContratosAnteriores2.EOF) do
               begin
                  if not(chkExcepcional.Checked) then
                     begin
                     if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                                        True,
                                                        edtDataCredito.Date,
                                                        True,
                                                        StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                                        StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                                        // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                                        0
                                                       //Pendência 27232 - 16/04/2008
                                                       //) then
                                                       ) <> 0 then
                     begin
                        MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                        Repaint;

                        LogToFile('Crítica de débitos anteriores em aberto', sArq);

                        if bDesabilitouContrato then
                        begin
                           bbtnContrato.Enabled := True;
                           bbtnSimula.Enabled   := True;
                        end;

                        Exit;
                     end;
                  end;

                  //Pendência 27232 - 18/04/2008
                  {
                  // Marchetti - Pendencia 26318
                  if not(chkExcepcional.Checked) then
                  begin
                     if not TipoContratoPermitidoParaConcessao then
                     begin
                        MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                        Repaint;

                        LogToFile('Mutuário possui contrato anterior do mesmo tipo', sArq);

                        if bDesabilitouContrato then
                        begin
                           bbtnContrato.Enabled := True;
                           bbtnSimula.Enabled   := True;
                        end;

                        Exit;
                     end;
                  end;
                  // Fim Marchetti - Pendencia 26318
                  }

                  qryContratosAnteriores2.Next;
               end;
            //end;
            // ----------------------------------------------------------------------------------------

            // André Pontes - 10/08/2004
            qryContratosAnteriores.DisableControls;
            qryContratosAnteriores.First;
            while not(qryContratosAnteriores.EOF) do
            begin
               if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
               begin
                  // André Pontes - 20/08/2004 - alterado a pedido de Luciana
                  if (qryContratosAnterioresNUMPARCPAGAS.AsInteger < qryContratosAnterioresTCEMINRENOVA.AsInteger) and
                     not(chkExcepcional.Checked) then
                  // FIM André Pontes - 20/08/2004 - alterado a pedido de Luciana
                  begin
                     if PrimeiraRenovacao2006 then // André Pontes - Pendência 21272 / SOL 39805 - 19/01/2006
                     begin
                        LogToFile('PrimeiraRenovacao2006', sArq);
                     end
                     else
                     begin
                        MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                        Repaint;

                        LogToFile('Crítica de carência', sArq);

                        if bDesabilitouContrato then
                           begin
                           bbtnContrato.Enabled := True;
                           bbtnSimula.Enabled   := True;
                           end;
                        Exit;
                     end;
                  end;
               end;
               qryContratosAnteriores.Next;
            end;
            qryContratosAnteriores.EnableControls;
            // FIM André Pontes - 10/08/2004
         end;
      end
      else
      begin
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
         begin
            // ----------------------------------------------------------------------------------------
            if (iTotSiafi > 0) and
               not(chkExcepcional.Checked) and
               not(chkFinanciamento.Checked) then
            begin
               Screen.Cursor := crDefault;
               EscondeEspera;

               MsgDlg('Mutuário possui dívidas de Financiamento Habitacional. NÃO será possível contratar Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;

               LogToFile('Crítica de Financiamento Habitacional', sArq);

               if bDesabilitouContrato then
               begin
                  bbtnContrato.Enabled := True;
                  bbtnSimula.Enabled   := True;
               end;

               Exit;
            end;
            // ----------------------------------------------------------------------------------------
            // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
            //Pendência 27232 - 16/04/2008
            //if (qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) and (qryContratosAnteriores2.Active) then
            //Fim Pendência 27232

            // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
            //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) and
               //(qryContratosAnteriores2.Active) then
            //begin
            // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979

               //Pendência 27232 - 16/04/2008
               if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
                  begin

                  if (not chkExcepcional.Checked) and
                     (not ValidaTipoContratoEmprestimo(qryContratosAnteriores2,
                                                       qryIDPESSOA.AsInteger,
                                                       qryIDBENEF.AsInteger,
                                                       StrToInt(DBcboTipoContrato.LookupValue),
                                                       dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                                      )) then
                       begin
                     //LogToFile('Contrato anterior do mesmo tipo', sArq);
                     //MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     LogToFile('Tipo de contrato em aberto impede contratação', sArq);
                     MsgDlg('Tipo de contrato em aberto impede contratação!', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;

               end;
               //Fim Pendência 23733

               qryContratosAnteriores2.First;
               while not(qryContratosAnteriores2.EOF) do
               begin
                  if not(chkExcepcional.Checked) then
                  begin
                     if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                                        True,
                                                        edtDataCredito.Date,
                                                        True,
                                                        StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                                        StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                                        // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                                        0
                                                       //Pendência 27232 - 16/04/2008
                                                       //) then
                                                       ) <> 0 then
                     begin
                        MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                        Repaint;

                        LogToFile('Crítica de débitos anteriores em aberto', sArq);

                        if bDesabilitouContrato then
                        begin
                           bbtnContrato.Enabled := True;
                           bbtnSimula.Enabled   := True;
                        end;

                        Exit;
                     end;
                  end;

                  //Pendência 27232 - 18/04/2008
                  {
                  // Marchetti - Pendencia 26318
                  if not(chkExcepcional.Checked) then
                  begin
                     if not TipoContratoPermitidoParaConcessao then
                     begin
                        MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                        Repaint;

                        LogToFile('Mutuário possui contrato anterior do mesmo tipo', sArq);

                        if bDesabilitouContrato then
                        begin
                           bbtnContrato.Enabled := True;
                           bbtnSimula.Enabled   := True;
                        end;

                        Exit;
                     end;
                  end;
                  // Fim Marchetti - Pendencia 26318
                  }

                  qryContratosAnteriores2.Next;
               end;
            //end;
         end;
            // ----------------------------------------------------------------------------------------
         //Pendência 24554 - 22/02/2007 - Alberto
         //if not VerificaCarenciaPorContratosQuitaveis then
         if (not VerificaCarenciaPorContratosQuitaveis) and
            (not chkExcepcional.Checked) then
         begin
            LogToFile('Crítica de carência', sArq);

            MsgDlg('Número de parcelas pagas do contrato anterior é inferior ao permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;
         //Fim Pendência 24554

            Exit;
         end;
      end;
      // Fim Marchetti - Pendencia 23647


      // Verifica se permite concessão no ultimo dia util do mes
      if ( dtmEmptmo.qryParamEmptmoFLGCONCULTDIAMES.AsInteger = 1) and
         ( EhUltimoDiaUtilMes(qryDATAINSC.AsDateTime)) then
      begin
         MsgDlg('NÃO é permitida concessão no último dia útil do mês.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         LogToFile('NÃO é permitida concessão no último dia útil do mês', sArq);

         if bDesabilitouContrato then
         begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
         end;
         Exit;
      end;

      //Pendência 27232 - 16/04/2008
      fVlrEmAberto := CalcEmptmo.ExistemItensEmAberto(
                      rContratoAnterior.IDContratoEmptmo,
                      False,
                      0,
                      True,
                      StrToInt(FormatDateTime('yyyy', rNovoContrato.DataInscricao)),
                      StrToInt(FormatDateTime('mm'  , rNovoContrato.DataInscricao)),
                      // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                      0);

      if ( (edtSaldoaQuitar.Value > 0) and
           (dtmEmptmo.qryParamEmptmoFLGRENPRESTAB.AsInteger = 1) and
           (fVlrEmAberto <> 0) and
           //(ExistemItensEmAberto(fVlrEmAberto)) and
           //Fim Pendência 27232
           not(chkExcepcional.Checked)
         ) then
      begin
         MsgDlg('Existem itens anteriores em aberto! ' + #13 + 'Não será permitida a Renovação.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         LogToFile('Existem itens anteriores em aberto', sArq);

         if bDesabilitouContrato then
            begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
            end;
         Exit;
      end;

      // Verifica a obrigatoriedade de informaçào de beneficiários de seguro
      if ( (qryTipoContratoFLGOBRIGBENEF.AsInteger = 1) and (qryBenefSeguro.RecordCount = 0) ) then
      begin
         MsgDlg('É obrigatória a informação de Beneficiário(s) do Seguro.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         LogToFile('Crítica de Beneficiário do Seguro', sArq);

         if bDesabilitouContrato then
         begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
         end;

         Exit;
      end;

      // Verifica os percentuais de indenização
      if not(CriticaPercentuaisBeneficiarios) then
      begin
         LogToFile('Crítica de percentuais dos beneficiarios', sArq);

         if bDesabilitouContrato then
         begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
         end;

         Exit;
      end;

      if ( not(bLimites) and not(chkExcepcional.Checked) and not(chkFinanciamento.Checked) ) then
      begin
         MsgDlg('Empréstimo não passou na Regra de Limites.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;  // if not(bLimites)


      // -------------------------------------------------------------------------------------------
      // André Pontes - 14/09/2004
      // Verifica se existe existe concessão de outro contrato para o mesmo dia
      if not(CalcEmptmo.VerificaConcessaoIgualPosterior(qryIDPESSOA.AsInteger,
                                                        qryIDBENEF.AsInteger,
                                                        edtDataCredito.Date,
                                                        True
                                                       )) then
      begin
          if MsgDlg('Já existe outro contrato com a mesma data de crédito. ' + #13 + #13 +
                   'Deseja conceder assim mesmo?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         begin
            LogToFile('Crítica de outro contrato com a mesma data de crédito', sArq);

            if bDesabilitouContrato then
            begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
            end;

            Repaint;
            Exit;
         end;
         Repaint;
      end;
      // FIM André Pontes - 14/09/2004
      // -------------------------------------------------------------------------------------------

      //Pendência 27749 - 16/04/2008
      {
      // -------------------------------------------------------------------------------------------
      // André Pontes - 01/09/2004
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         if not(qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 17, 19, 20, 21]) then
         begin
            // ----------------------------------------------------------------------------------
            if ( (Arredonda(edtValorParcela.Value, 2) > Arredonda(qryVLRMARGEM.AsCurrency, 2)) and
                 not(chkExcepcional.Checked)
               ) then
            begin
               MsgDlg('Valor da prestação não pode ser superior a margem consignável!', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;

               LogToFile('Crítica de margem consignável', sArq);

               if bDesabilitouContrato then
               begin
                  bbtnContrato.Enabled := True;
                  bbtnSimula.Enabled   := True;
               end;

               Exit;
            end;
            // ----------------------------------------------------------------------------------
         end
         else
         begin
            // ----------------------------------------------------------------------------------
            if not(CalcEmptmo.VerificaContratoAtivo(qryIDPESSOA.AsInteger,
                                                    qryIDBENEF.AsInteger,
                                                    qryIDTIPOCONTREMPTMO.AsInteger,
                                                    True)) then
            begin
               Repaint;

               bbtnCancelarClick(bbtnCancelar);
               Exit;
            end;
           // ----------------------------------------------------------------------------------
         end;
      end                       
      else
      begin
      }
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1) or
         (qryTipoContratoFLGNAOVERIFICAMRGPCL.AsInteger = 0) then
      begin
      //Fim Pendência 27749
         if ((Arredonda(edtValorParcela.Value, 2) > Arredonda(edtValMargem.Value, 2)) and not(chkExcepcional.Checked)) then
              begin
              MsgDlg('Valor da prestação não pode ser superior a margem consignável!', 'Empréstimo', mtWarning, [mbOk], 0);
              Repaint;
              LogToFile('Crítica de margem consignável', sArq);
            if bDesabilitouContrato then
               begin
               bbtnContrato.Enabled := True;
               bbtnSimula.Enabled   := True;
               end;
            Exit;
           end;
      end;
      // FIM André Pontes - 01/09/2004
      // -------------------------------------------------------------------------------------------

      // O item escolhido é Contas a Pagar
      if ( DBrdgCredito.ItemIndex = 0)     and
         ( dsBanco.DataSet.IsEmpty )       and
         ( Sistema.NomeEmpresa = 'REFER')  then
      begin
         MsgDlg('É necessário que o Participante possua uma Conta Corrente cadastrada no Sistema!!', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         LogToFile('Crítica de conta corrente', sArq);

         if bDesabilitouContrato then
         begin
            bbtnContrato.Enabled := True;
            bbtnSimula.Enabled   := True;
         end;

         Exit;
      end;

      // Grava a margem selecionada
      if (rdgMargemAlt.Visible) and (rdgMargemAlt.Checked) then
      begin
         qryVLRMARGEM.AsCurrency := qryVLRMARGEMALT.AsCurrency;
      end;
      // Fim Marchetti - Pendencia 26402

      // Marchetti - Pendencia 20007
      try
         // Inicia uma transação - só se não ouver transação iniciada
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
         begin
            StartTransacao;     //É AQUI QUE ELE FAZ O EMPRESTIMO
            bTransacaoAnterior := False;

            LogToFile('Start Transaction', sArq);
         end
         else
         begin
            LogToFile('Transacao anterior', sArq);
         end;

         LogToFile('IDPessoa: ' + FormatFloat('#0', qryIDPESSOA.AsInteger) + ' - ' +
                   'IDBenef: '  + FormatFloat('#0', qryIDBENEF.AsInteger),sArq);

         // Verifico se o usuário está inserindo ou alterando uma inscrição
         if qry.State in dsEditModes then
         begin
            // Post
            LogToFile('Confirmar Inscricao', sArq);
            bbtnConfirmarClick(Sender);

            // Verifico se conseguiu dar o Post ou se ainda está inserindo ou alterando
            if qry.State in dsEditModes then
            begin
               if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then
                 RollBackTransacao;

               LogToFile('Erro apos confirmar inscricao - concessao abortada', sArq);

               if bDesabilitouContrato then
               begin
                  bbtnContrato.Enabled := True;
                  bbtnSimula.Enabled   := True;
               end;

               Exit;
            end;

         end;  // if qry.State

         // Procedimento que armazena os dados da Inscrição num registro que é
         //   passado como parâmetro para a função GravaContrato da unit UCalcEmptmo
         //   que insere os dados na tabela Contrato e se obtiver sucesso Contabiliza
         //   o Contrato  GravaContrato

         LogToFile('AtivaContrato', sArq);

         AtivaContrato;

         AcertaEdits;

         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then
              CommitTransacao;
      except
         Repaint;

         if ((dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior)) then
              RollBackTransacao;
      end;
      // Fim Marchetti - Pendencia 20007
   end
   else  // if MsgDlg('Deseja realmente CONTRATAR
   begin
      if bDesabilitouContrato then
      begin
         bbtnContrato.Enabled := True;
         bbtnSimula.Enabled   := True;
         bDesabilitouContrato := False;
      end;
   end;  // if MsgDlg('Deseja realmente CONTRATAR

   // SOL 127320 - Ádler Souza
   // Limpar variaveis da regra
   dtmEmptmo.Regra.LimpaVariaveis;
   //Fim - SOL 127320 - Ádler Souza
end;



procedure TfrmCadInscricao.PreencheDadosContrato(iNumParcela : Integer);
var
   qryAux      : TwwQuery;
   sSQL        : String;
   iContador   : Integer;
   iPlanoAjuste: Integer;
begin
   // Procedimento que armazena os dados da Inscrição num registro

   LimpaRegistroContrato(rNovoContrato);
   LimpaRegistroConcessao(rConcessao);

   // É nulo na Concessão
          rNovoContrato.IDContrQuitacao    := -1;

   // Número da Inscrição
   rNovoContrato.IDInscricaoEmptmo  := qryIDInscricaoEmptmo.AsFloat;

   rNovoContrato.IDPessoa           := qryIDPESSOA.AsInteger;
   // Beneficiário do Contrato
   //   IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
   //   e do Beneficiário no caso de Pensionista
   rNovoContrato.IDBenef            := qryIDBENEF.AsInteger;

   rNovoContrato.IDTipoContrEmptmo  := qryIDTIPOCONTREMPTMO.AsInteger;
   rNovoContrato.IDTipoEmptmo       := qryTipoContratoIDTIPOEMPTMO.AsInteger;
   rNovoContrato.IDPlanoPrev        := qryIDPLANOPREV.AsInteger;

   // Marchetti - Pendencia 26402
   if Sistema.TipoCliente = 20071 then
   begin
      LimpaParametros(qryBuscaPlanoContabil);
      qryBuscaPlanoContabil.ParamByName('PIDPLANOPREV').AsInteger := qryIDPLANOPREV.AsInteger;
      qryBuscaPlanoContabil.Open;
      if not qryBuscaPlanoContabil.IsEmpty then
         rNovoContrato.IDPlanoOrigem      := qryBuscaPlanoContabilIDPLANPREVC.AsInteger
      else
         rNovoContrato.IDPlanoOrigem      := qryIDPLANOPREV.AsInteger;
   end
   else
   begin
      rNovoContrato.IDPlanoOrigem      := qryIDPLANOPREV.AsInteger;
   end;
   // Marchetti - Pendencia 26402

   LogToFile('PlanoOrigem = PlanoPrev: ' + IntToStr(rNovoContrato.IDPlanoOrigem), sArq);

   // ----------------------------------------------------------------------------------------------
   // André Pontes - 12/12/2005 - pendência 20912 (ou 20848)

   //Pendência 26741 - 29/10/2007 - Alberto
   if ( Sistema.TipoCliente = 19981 ) or ( Sistema.TipoCliente = 19991 ) then // CBS, FUNCEF
   //Fim Pendência 26741
   begin
      iPlanoAjuste                  := IntegraEmptmo.AcertaPlanoOrigem(-1,
                                                                       rNovoContrato.IDBenef,
                                                                       rNovoContrato.IDPlanoPrev,
                                                                       False
                                                                      );

      if (iPlanoAjuste > 0) then
      begin
         rNovoContrato.IDPlanoOrigem   := iPlanoAjuste;
         LogToFile('PlanoOrigem: ' + IntToStr(rNovoContrato.IDPlanoOrigem), sArq);
      end
      else
      begin
         LogToFile('PlanoOrigem: ' + IntToStr(rNovoContrato.IDPlanoOrigem), sArq);
      end;
   end;
   // FIM André Pontes - 12/12/2005 - pendência 20912 (ou 20848)
   // ----------------------------------------------------------------------------------------------


   // Xavier SOL 189794 inicio - Para os casos em que a concessão do empréstimo considera o plano contábil como REG/REPLAN SALDADO
   // e o plano previdenciário como NOVO PLANO, solicito que o plano previdenciário considerado na concessão seja o REG/REPLAN.
   if (rNovoContrato.IDPlanoPrev = 74) and (rNovoContrato.IDPlanoOrigem = 28 ) then
       rNovoContrato.IDPlanoPrev := 2;
   // Xavier SOL 189794 Final

   rNovoContrato.IDPatro            := qryIDPATRO.AsInteger;
   rNovoContrato.Indexador          := qryMOECODIGO.AsInteger;
   rNovoContrato.IDSitPart          := qryIDSITPART.ASInteger;
   rNovoContrato.NumParcDesconto    := qryTipoContratoNUMPARCDESCONTO.AsInteger;

   if not(qryIDRESPONSAVEL.IsNull) then
      rNovoContrato.IDResponsavel  := qryIDRESPONSAVEL.AsInteger;

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BASEDADOS';

      sSQL := 'SELECT MOESIGLA FROM MOEDA WHERE MOECODIGO = ' + IntToStr(rNovoContrato.Indexador);

      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      rNovoContrato.SiglaIndexador  := trim(qryAux.FieldByName('MOESIGLA').AsString);
   finally
      qryAux.Close;
      qryAux.Free;
   end;

   // É nulo
   rNovoContrato.IDVerba            := -1;
   rNovoContrato.FlgSuspensaoAuto   := qryFLGSUSPENSAOAUTO.AsInteger;

   // ----------------------------------------------------------------------------------------------

   if not(qryIDCBANCARIA.IsNull) then
   begin
      rNovoContrato.IDCBancaria     := dsBanco.DataSet.FieldByName('IDCBANCARIA').AsInteger;

      if not(qryIDCBANCARIADEB.IsNull) then
         rNovoContrato.IDCBancariaDeb := qryIDCBANCARIADEB.AsInteger
      else
         rNovoContrato.IDCBancariaDeb := qryIDCBANCARIA.AsInteger;
   end
   else
   begin
      // É nulo
      rNovoContrato.IDCBancaria     := -1;
      rNovoContrato.IDCBancariaDeb  := -1;
   end;

   // ----------------------------------------------------------------------------------------------

   // É nulo
   if trim(qryCODFORMAPAG.AsString) <> EmptyStr then
   begin
      rNovoContrato.CodFormaPag     := qryCODFORMAPAG.AsInteger;
   end
   else
   begin
      rNovoContrato.CodFormaPag     := -1;
   end;

   if trim(qryPORTFORMAPAG.AsString) <> EmptyStr then
   begin
      rNovoContrato.PortFormaPag    := qryPORTFORMAPAG.AsInteger;
   end
   else
   begin
      rNovoContrato.PortFormaPag    := -1;
   end;

   if trim(qryPORTFORMAREC.AsString) <> EmptyStr then
   begin
      rNovoContrato.PortFormaRec    := qryPORTFORMAREC.AsInteger;
   end
   else
   begin
      rNovoContrato.PortFormaRec    := -1;
   end;

   rNovoContrato.VlrReserva         := edtValReserva.Value;
   rNovoContrato.VlrDebito          := (edtQuitacao.Value + edtQuitacaoDividas.Value);

   rNovoContrato.NumParcelas        := iNumParcela;               // Número de Parcelas
   rNovoContrato.DataCredito        := edtDataCredito.Date;       // Data em que o empréstimo será creditado
   rNovoContrato.DataSituacao       := trunc(SysDate);            // Data da Situação do Contrato como data do Sistema
   rNovoContrato.DataAssinatura     := edtDataAssinatura.Date;    // Data de Assinatura do Contrato como data do Sistema
   rNovoContrato.DataPrimParc       := edtDataPrimParcela.Date;   // Data do pagamento da Primeira Parcela do Contrato
   rNovoContrato.DataInscricao      := DBedtDataInsc.Date;        // Data da Solicitação - Inscrição
   rNovoContrato.DataCanc           := -1;                        // Data nula
   rNovoContrato.VlrContrato        := qryVLRSOLIC.AsFloat;       // Valor do Contrato
   rNovoContrato.VlrParcela         := edtValorParcela.Value;     // Valor da Parcela
   rNovoContrato.Txjuros            := edtPercentJuros.Value;     // Taxa de Juros do Contrato

   rNovoContrato.VlrSalBase         := qryVLRSALBASE.AsCurrency;
   rNovoContrato.VlrMargem          := qryVLRMARGEM.AsCurrency;
   rNovoContrato.VlrMaxPermit       := qryVLRMAXPERMIT.AsCurrency;

   rNovoContrato.VlrParcelaMes      := edtTotalParcelas.Value;
   rNovoContrato.VlrParcelaAtraso   := edtTotalPendencias.Value;


   (****************************************************************************
    * FLGSITUACAO = 'A' -> 'Ativo'             -> Em curso normal              *
    *               'C' -> 'Cancelado'         -> por opção do usuário         *
    *               'E' -> 'Encerrado'         -> por quitacao no prazo normal *
    *               'K' -> 'Pend. de Quitação' -> Envio p/ cobrança            *
    *               'Q' -> 'Quitado'           -> por quitacao solicitada      *
    *               'S' -> 'Suspenso'          -> Inadimplencia                *
    *               'P' -> 'Pendente'          -> Falta recebimento do contrato*
    ****************************************************************************)
   rNovoContrato.FlgSituacao        := 'A';

   // Marchetti - Pendencia 14912
   if dtmEmptmo.qryparamEmptmoFLGCONTROLAINSC.AsInteger = 1 then
      rNovoContrato.FlgSituacao     := 'P';

   // FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
   //               F -> indicando que o Débito é pela Folha
   rNovoContrato.flgFormaRec        := qryFLGFORMAREC.AsString;


   // FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
   //               F -> indicando que o Crédito é pela Folha
   rNovoContrato.flgFormaPag        := qryFLGFORMAPAG.AsString;

   // Marchetti - Pendencia 26806
   rNovoContrato.FlgUsaMargemAlt    := Ord(rdgMargemAlt.Checked);

   // Guarda os beneficiários do seguro
   qryBenefSeguro.First;
   iContador                        := 0;

   rNovoContrato.TSEMeses := 0;


   SetLength(vListaContratoXBenefSeg, qryBenefSeguro.RecordCount);
   while not(qryBenefSeguro.EOF) do
   begin
      vListaContratoXBenefSeg[iContador].IDBenefSeguro     := qryBenefSeguroIDBENEFSEGURO.AsInteger;
      vListaContratoXBenefSeg[iContador].IDInscricaoEmptmo := qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat;
      vListaContratoXBenefSeg[iContador].PercIndenizacao   := qryBenefSeguroPERCINDENIZACAO.AsFloat;

      inc(iContador);

      qryBenefSeguro.Next;
   end;

   qryBenefSeguro.First;
end;

//BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO
{function TfrmCadInscricao.RetornaFlagPerdaEfetiva(sIDMatricula: Int64): Integer;
begin
   QryBuscaContrato.Close;
   QryBuscaContrato.SQL.Clear;
   QryBuscaContrato.SQL.Add(' select FLGPERDAEFETIVA, idpessoa from contratoemptmo  ');
   QryBuscaContrato.SQL.Add(' where  FLGPERDAEFETIVA = 1    ');
   QryBuscaContrato.SQL.Add(' and idpessoa = '+ IntToStr(sIDMatricula));
   QryBuscaContrato.Open;
   if not QryBuscaContrato.Eof then
      Result:= 1;
end;}
//BRUNO AZEVEDO - RETIRAR DO ALEX - VOTO DO EMPRÉSTIMO

procedure TfrmCadInscricao.AtivaContrato;
var
   sSQL              : String;
   qryAux            : TwwQuery;

   bErro             : Boolean;
   sMensErro         : String;


   iResult           : Integer;
   iPlanilhaResult   : Integer;
   iContador         : Integer;
   i                 : Integer;
   iPlanoOrigem      : Integer;

   dDataInicioSusp   : TDateTime;
   dDataFimSusp      : TDateTime;
   dData             : TDateTime;

   sResult, sErro    : TStringList;

   rSaldosAntPos     : TSaldosAntPos;
   rSaldo            : TSaldoDevAnt;
   rLogTotalPrev     : TLogTotalPrev;

   //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - INÍCIO
   qryInsertPerdaEfetiva: TwwQuery;
   sContratoPerdaEfetiva: String;
   //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - FIM
begin
   // Usa a função GravaContrato da unit UCalcEmptmo que insere os dados na tabela Contrato
   // Se obtiver sucesso Contabiliza o Contrato

   bErro       := False;
   sMensErro   := '';
   sResult     := TStringList.Create;
   sErro       := TStringList.Create;

   // planilha nova a cada Contrato
   iPlanilhaResult := 0;
   //BRUNO AZEVEDO - VOTO DE EMPRESTIMO - SEMPRE SERÁ "0" NO INSERT
   //rNovoContrato.sFlagPerdaEfetiva := RetornaFlagPerdaEfetiva(rNovoContrato.IDPessoa);
   //BRUNO AZEVEDO - VOTO DE EMPRESTIMO
   case dtmEmptmo.qryParamEmptmoFLGDATAATUSLD.AsInteger of
     0: dDataUltAtualiza := edtDataCredito.Date;
     1: dDataUltAtualiza := edtDataPrimParcela.Date;
     2: dDataUltAtualiza := DiasUteis.SomaMeses(rNovoContrato.DataPrimParc, - 1);
   end;

   // Procedimento que armazena os dados da Inscrição num registro
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

   // Preenche o registro com os dados da suspensão
   if trim(dbcboSuspensao.LookupValue) <> EmptyStr then
   begin

      // SOL:108099 Daniel Begnami
      //      rNovoContrato.IDTipoSuspEmptmo := dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger;
      rNovoContrato.IDTipoSuspEmptmo := iIDTipoSuspEmptmo;
      // FIM

      rNovoContrato.TSEMeses := StrToInt(trim(edtPrazoSuspensao.text));  // SOL:108099 Daniel Begnami

      dDataInicioSusp := rNovoContrato.DataCredito;

      dDataFimSusp    := dDataFinalSuspensao;


      //COMENTADO POR BRUNO AZEVEDO SOL 133962 KINTANA 784481
      {
      if (qryFLGSUSPENSAOAUTO.AsInteger = 1) or
         ((dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.IsNull) and (dDataFinalSuspensao <= 0)) then
      begin
         dDataFimSusp := 0;
      end;}

      rNovoContrato.DataInicioSusp    := dDataInicioSusp;
      rNovoContrato.DataFimSusp       := dDataFimSusp;
      


      if (dDataFimSusp > 0) then
      begin
         rNovoContrato.AnoSuspensao     := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(dDataFimSusp,1));
         rNovoContrato.MesSuspensao     := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(dDataFimSusp,1));
      end;

   end;

//    rNovoContrato.sFlagPerdaEfetiva:= Round(rNovoContrato.IDContratoEmptmo);
        //ALEX


   // Preenche o registro com os dados da suspensão
   if (qryFLGSUSPENSAOAUTO.AsInteger = 0) then
   begin
      // Se possui algum tipo de suspensão e ainda não foi liberada a suspensão
      //Pendência 24779 - 29/05/2007 - Alberto
      if (iTipoSuspAnterior > 0) then
      begin
         rNovoContrato.DataInicioSusp   := 0;
         rNovoContrato.DataFimSusp      := 0;
         rNovoContrato.IDTipoSuspEmptmo := -1;
         rNovoContrato.TSEMeses         := 0;     // SOL:108099 Daniel Begnami
         if (dDataSuspAnterior > edtDataCredito.Date) then
        //Fim Pendência 24779
         begin
            if MsgDlg('Existe suspensão de cobrança no contrato anterior. Deseja aproveitar o prazo restante?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Repaint;
               rNovoContrato.DataInicioSusp   := rNovoContrato.DataCredito;
               //Pendência 24779 - 29/05/2007 - Alberto
               rNovoContrato.IDTipoSuspEmptmo := iTipoSuspAnterior;
               rNovoContrato.DataFimSusp      := dDataSuspAnterior;
               //Fim Pendência 24779
            end;
         end
         else
         begin
            DBcboSuspensao.LookupValue := '';
            DBcboSuspensao.Clear;
         end;
         Repaint;
      end;
   end; // if qryFLGSUSPENSAOAUTO.AsInteger = 0

   //Pendência 26775 - 26/12/2007
   if not dtmEmptmo.qryParamEmptmoIDREGRAPLANOCOB.IsNull then
      rNovoContrato.IDPlanoCob := CalcEmptmo.IdentificaPlanoCobranca(rNovoContrato.IDPessoa,
                                                                     rNovoContrato.IDPlanoPrev,
                                                                     dtmEmptmo.qryParamEmptmoIDREGRAPLANOCOB.AsInteger,
                                                                     true)
   else
      rNovoContrato.IDPlanoCob := -1;
   //Fim Pendência 26775

   // Inicia uma transação - só se não ouver transação iniciada
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      StartTransacao;
      bTransacaoAnterior := False;

      LogToFile('AtivaContrato - Start Transaction', sArq);
   end
   else
   begin
      LogToFile('AtivaContrato - Transacao anterior', sArq);
   end;

   try
      try
         // ----------------------------------------------------------------------------------------

         if chkFinanciamento.Checked   then
            rNovoContrato.FlgFinanciamento := 1;
         if chkExcepcional.Checked     then
            rNovoContrato.FlgExcepcional   := 1;

         LogToFile('Antes GravaContrato', sArq);
         LogToFile('ContaBancariaCredito: ' + FormatFloat('#0', rNovoContrato.IDCBancaria), sArq);
         LogToFile('ContaBancariaDebito: ' + FormatFloat('#0', rNovoContrato.IDCBancaria), sArq);

         if not(CalcEmptmo.GravaContrato(rNovoContrato)) then
         begin
            LogToFile('Erro GravaContrato ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo), sArq);

            // Gravação do Contrato com Erro
            bErro       := True;
            sMensErro   := '';
            Exit;
         end;  // if GravaContrato

         LogToFile('GravaContrato ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo) + ' com sucesso', sArq);

         // ----------------------------------------------------------------------------------------

         // gravação do histórico de suspensão
         if trim(DBcboSuspensao.LookupValue) <> EmptyStr then
         begin
            try
               with qryInsertHistSuspensao do
               begin
                  LimpaParametros(qryInsertHistSuspensao);

                  ParamByName('PIDTIPOSUSPEMPTMO').AsInteger   := rNovoContrato.IDTipoSuspEmptmo;
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat     := rNovoContrato.IDContratoEmptmo;
                  ParamByName('PFLGSTATUS').AsString           := 'A';
                  ParamByName('PFLGFERIAS').AsInteger          := dtmLookEmptmo.qryLookTipoSuspFLGFERIAS.AsInteger;
                  ParamByName('PHSCINICIOSUSP').AsDate         := rNovoContrato.DataInicioSusp;
                  ParamByName('PHSCFINALSUSP').AsDate          := rNovoContrato.DataFimSusp;

                  // SOL:108099 Daniel Begnami
                  if (dtmLookEmptmo.qryLookTipoSuspFLGSUSAPENASCONC.AsInteger = 1) then
                    ParamByName('PHSCMESES').AsInteger           := rNovoContrato.TSEMeses
                  else
                    ParamByName('PHSCMESES').AsInteger           := DiasUteis.IntervaloMeses(rNovoContrato.DataInicioSusp, rNovoContrato.DataFimSusp);
                  // FIM                    


                  ParamByName('PHSCUSUATEND').AsString         := Sistema.NomeUsuario;
                  ParamByName('PHSCDATAATEND').AsDateTime      := Sysdate;

                  ExecSQL;
               end;

               LimpaParametros(qryEncerraSuspensao);
               qryEncerraSuspensao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
               qryEncerraSuspensao.ExecSql;
               
               LogToFile('Aproveitamento de Suspensao', sArq);
            except
               LogToFile('Erro Aproveitamento de Suspensao', sArq);
            end;
         end
         else
         begin
            LogToFile('Sem suspensão', sArq);
         end;

         // ----------------------------------------------------------------------------------------

         // Chama a função de Atualização de Saldo para ver se possui saldo disponivel para o empréstimo
         if (dtmEmptmo.qryParamEmptmoFLGOBRIGAVERBA.AsInteger = 1) then
         begin
            // Chama a função de Atualização de Saldo para ver se possui saldo disponivel para o empréstimo
            if not(AtualizaSaldoVerba(True)) then
               Exit;
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    Quitação do(s) Contrato(s) anteriore(s)
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - INÍCIO
         sContratoPerdaEfetiva := '';
         //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - FIM

         qryContratosAnteriores.First;
         while not(qryContratosAnteriores.EOF) do
         begin
            LogToFile('Contrato Anterior', sArq);

            if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
            begin
               if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
               begin
                  if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryContratosAnterioresIDContratoEmptmo.AsFloat, edtDataCredito.Date)) then
                  begin

                     dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratosAnterioresIDContratoEmptmo.AsFloat);
                     rSaldo := CalcEmptmo.SaldoDevAnt(qryContratosAnterioresIDContratoEmptmo.AsFloat, dData, -1, -1, False);

                     if rSaldo.fSaldoDevAnt <> 0 then
                     begin
                        bErro       := True;
                        sMensErro   := 'Contrato anterior não possui atualização diária para a Data do Crédito.';
                        Exit;
                     end;  // if rSaldo.fSaldoDevAnt > 0
                  end;  // if not(CalcEmptmo.PossuiAtualizacaoDiaria(...
               end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
            end;

            // Grava informações no contrato anterior
            // (basicamente, para o relatório de impressão de contrato da FCRT)
            with qryUpdateContratoAnt do
            begin
               LimpaParametros(qryUpdateContratoAnt);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat     := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
               ParamByName('PVLRSALDODEV').AsCurrency       := qryContratosAnterioresHMESALDODEV.AsCurrency;
               ParamByName('PVLRPENDENCIA').AsCurrency      := qryContratosAnterioresVLREMABERTO.AsCurrency;
               ParamByName('PDATA').AsDateTime              := edtDataCredito.Date;
            end;
            qryUpdateContratoAnt.ExecSQL;

            // Verificar se existe EP anterior.
            // Caso positivo quitar EP Anterior
            if (edtSaldoAQuitar.Value > 0) then
            begin
               if (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
               begin
                  // -------------------------------------------------------------------------------
                  // HISTÓRICO  DO  EMPRÉSTIMO  ANTERIOR
                  // -------------------------------------------------------------------------------

                  LimpaRegistroContrato(rContratoAnterior);

                  rContratoAnterior.IDContratoEmptmo  := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
                  rContratoAnterior.IDInscricaoEmptmo := qryContratosAnterioresIDINSCRICAOEMPTMO.AsFloat;

                  rContratoAnterior.IDTipoContrEmptmo := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
                  rContratoAnterior.FlgFormaRec       := qryContratosAnterioresFLGFORMAREC.AsString;
                  rContratoAnterior.Indexador         := qryContratosAnterioresMOECODIGO.AsInteger;
                  rContratoAnterior.SiglaIndexador    := qryContratosAnterioresMOESIGLA.AsString;
                  rContratoAnterior.IDPessoa          := qryContratosAnterioresIDPESSOA.AsInteger;
                  rContratoAnterior.IDPlanoPrev       := qryContratosAnterioresIDPLANOPREV.AsInteger;
                  rContratoAnterior.IDPatro           := qryContratosAnterioresIDPATRO.AsInteger;

                  rContratoAnterior.IDSitPart         := qryIDSITPART.AsInteger;

                  rContratoAnterior.IDBenef           := qryContratosAnterioresIDBENEF.AsInteger;
                  rContratoAnterior.DataCredito       := qryContratosAnterioresDATACREDITO.AsDateTime;
                  rContratoAnterior.DataAssinatura    := qryContratosAnterioresDATAASSINATURA.AsDateTime;
                  rContratoAnterior.DataPrimParc      := qryContratosAnterioresDATAPRIMPARC.AsDateTime;
                  rContratoAnterior.IDTipoEmptmo      := qryContratosAnterioresIDTIPOEMPTMO.AsInteger;
                  rContratoAnterior.IDPlanoOrigem     := qryContratosAnterioresIDPLANOORIGEM.AsInteger;

                  //BRUNO AZEVEDO SOL 151331 KINTANA 1108957
                  rContratoAnterior.VlrSaldoDev       := qryContratosAnterioresVLRATUAL.AsCurrency;


                  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 18/12/2013 - INÍCIO
                  rContratoAnterior.sFlagPerdaEfetiva := qryContratosAnteriores.FieldByName('FLGPERDAEFETIVA').AsInteger;
                  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 18/12/2013 - FIM                  // -------------------------------------------------------------------------------
                  // -------------------------------------------------------------------------------
                  // Procura a última data de atualização após a data de quitação do contrato
                  // anterior (data do crédito), para ser passada como data de atualização dos
                  // registros de quitação do contrato anterior
                  rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(rContratoAnterior.IDContratoEmptmo,
                                                                edtDataCredito.Date
                                                               );
                  // -------------------------------------------------------------------------------
                  // -------------------------------------------------------------------------------

                  // André Pontes - 22/08/2005
                  // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
                  dtmEmptmo.Regra.IDCalculo  := 0;
                  // FIM André Pontes - 22/08/2005

                  LogToFile('Calculo quitacao ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);

                  if not(CalcEmptmo.CalculaItensQuitacaoNOVA(rContratoAnterior,
                                                             0,                      // Origem
                                                             edtDataCredito.Date,
                                                             -1,                     // André Pontes - 14/06/2004 - pendência 16984
                                                             edtDataAssinatura.Date,
                                                             vListaQuitacao,
                                                             False,
                                                             False,
                                                             False,
                                                             sArq
                                                             //Pendência 22836 - 03/10/2006 - Alberto
                                                            ,chkExcepcional.Checked
                                                             //Fim Pendência 22836
                                                            )) then
                  begin
                     LogToFile('Erro calculo quitacao ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);

                     // Gravação do Histórido dos Itens de EP Anterior com Erro
                     bErro       := True;
                     sMensErro   := '[ Cálculo de quitação de contratos anteriores ]';
                     Exit;
                  end;

                  // marca como baixados os itens quitados pela renovação
                  for i := 0 to High(vListaQuitacao) do
                  begin
                     if (vListaQuitacao[i].FlgCentraliza = 1) then
                     begin

                        // André Pontes - 19658 - 11/07/2005
                        // o valor efetivo NUNCA poderia ser o total a quitar

                           vListaQuitacao[i].ValorEfetivo   := vListaQuitacao[i].Valor;
                        // FIM André Pontes - 19658 - 11/07/2005

                        vListaQuitacao[i].DataEfetiva       := rNovoContrato.DataCredito;
                        vListaQuitacao[i].FlgBaixado        := -1;
                        vListaQuitacao[i].FlgEnvio          := -1;
                        vListaQuitacao[i].FormaCobranca     := '';
                     end;
                  end;


                  LogToFile('Grava quitacao ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);

                  // Gravação do Histórido dos Itens de Quitação do EP Anterior
                  if not(CalcEmptmo.GravaMovEmptmo(rContratoAnterior,
                                                   vListaQuitacao,
                                                   3,                            // Evento 3 - Quitação
                                                   qryContratosAnterioresULT_PARC.AsInteger,       // Última parcela do ContratoAnterior
                                                   DiasUteis.ExtraiAno(rNovoContrato.DataCredito), // Ano Competência - Ano da Data de Crédito do Novo Contrato
                                                   DiasUteis.ExtraiMes(rNovoContrato.DataCredito), // Mês Competência - Mês da Data de Crédito do Novo Contrato
                                                   DiasUteis.ExtraiAno(rNovoContrato.DataCredito), // Ano Cobrança - Ano da Data de Crédito do Novo Contrato
                                                   DiasUteis.ExtraiMes(rNovoContrato.DataCredito), // Mês Cobranca - Mês da Data de Crédito do Novo Contrato
                                                   0,
                                                   rNovoContrato.DataCredito,    // DataPrevista -> Data de de Crédito do Novo Contrato
                                                   rSaldosAntPos.dDataAtuPos,    // dDataUltAtualiza do Contrato anterior -> ver obs acima
                                                   '',                           // forma de envio: já está sendo definida pelo contrato
                                                   '',
                                                   True
                                                  )) then
                  begin
                     LogToFile('Erro Grava quitacao ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);

                     bErro       := True;
                     sMensErro   := '[ Gravação do Histórido dos Itens do EP Anterior ]';
                     Exit;
                  end; // if not(CalcEmptmo.GravaMovEmptmo(EP Anterior)


                 // --------------------------------------------------------------------------------
                 // Estorna os itens posteriores à data da quitação
                 // --------------------------------------------------------------------------------
                 if (dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1) then
                 begin
                    with dtmEmptmo.qryUpdateFlgEstorno do
                    begin
                       //LimpaParametros(dtmEmptmo.qryUpdateFlgEstorno);   //ALEX

                       ParamByName('PHMEDATAESTORNO').AsDateTime       := rNovoContrato.DataCredito;
                       ParamByName('PIDUSUARIOESTORNO').AsInteger      := Sistema.IDUsuario;
                       ParamByName('PHMEOBSERVACAO').AsString          := 'Estorno de item posterior a quitacao';
                       ParamByName('PIDCONTRATOEMPTMO').AsFloat        := rContratoAnterior.IDContratoEmptmo;
                       ParamByName('PHMETIPOMOV').AsInteger            := 1;
                       ParamByName('PNAOENVIADO').AsInteger            := 1;
                       ParamByName('PFILTROPORDATAPREVISTA').AsInteger := 1;
                       ParamByName('PHMEDATAPREVISTAINI').AsDateTime   := rNovoContrato.DataCredito + 1;
                       ParamByName('PHMEDATAPREVISTAFIM').AsDateTime   := DiasUteis.SomaAnos(rNovoContrato.DataCredito, 10);

                       ExecSQL;

                       LogToFile('Estorno de itens pos quitacao ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);

                    end;  // with dtmEmptmo.qryUpdateFlgEstorno
                 end;  // if dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1
                 // --------------------------------------------------------------------------------

                  // marca os itens em aberto dos contratos anteriores como "quitados"
                  if CalcEmptmo.MarcaItensQuitados(rContratoAnterior.IDContratoEmptmo,
                                                   rNovoContrato.DataCredito,
                                                   0 // origem
                                                   //Pendência 22836 - 03/10/2006 - Alberto
                                                  ,chkExcepcional.Checked
                                                   //Fim Pendência 22836
                                                  ) < 0 then
                  begin
                     bErro := True;
                     sMensErro := '[ ERRO marcar itens quitados do Contrato anterior ]';

                     LogToFile('Erro marca itens quitados ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);
                  end
                  else
                  begin
                     LogToFile('Marca itens quitados ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);
                  end;

                  // -------------------------------------------------------------------------------

                  if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
                  begin
                     if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
                     begin
                        with dtmAtualizacaoDiaria.spUpdateEstornado do
                        begin
                           ParamByName('IIDCONTRATOEMPTMO').AsFloat  := rContratoAnterior.IDContratoEmptmo;
                           ParamByName('DDATAINI').AsDateTime        := rNovoContrato.DataCredito + 1;
                           ParamByName('DDATAFIM').AsDateTime        := rNovoContrato.DataCredito + 180;
                           ParamByName('IHMETIPOMOV').AsFloat        := 5;
                           if not(Prepared) then Prepare;
                           ExecProc;
                        end;
                     end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

                     dtmAtualizacaoDiaria.ExecutaAjusteSaldo(rContratoAnterior.IDContratoEmptmo,
                                                             rNovoContrato.DataCredito - 1,
                                                             -1 // O saldo deve ser buscado
                                                            );

                     LogToFile('Executa ajuste saldo ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);
                  end;

                  // -------------------------------------------------------------------------------

                  CalcEmptmo.AcertaSituacaoContratual(rContratoAnterior.IDContratoEmptmo);

                  LogToFile('Acerta situacao contratual ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);
                  // -------------------------------------------------------------------------------


                  // -------------------------------------------------------------------------------
                  //    Contabilização Empréstimo Anterior
                  // -------------------------------------------------------------------------------
                  if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
                     (dtmEmptmo.qryParamEmptmoFLGCONTABCONC.AsInteger = 0) then
                  begin
                     iResult := ContabilizaContrato(rContratoAnterior.IDContratoEmptmo,
                                                    'EMPRÉSTIMOS DE PARTICIPANTES - Quitação do Empréstimo Anterior',
                                                    '3',
                                                    iPlanilhaResult,
                                                    sResult,
                                                    sErro
                                                   );

                     if (iResult <> 0)  then
                     begin
                        // Contabilização do Contrato Anterior com Erro
                        bErro := True;

                        // Códigos de retorno (controle de erro):
                        //     0 : Lançamento(s) realizados com sucesso
                        //    -1 : ERRO ao tentar selecionar os itens a contabilizar
                        //    -2 : Query não retornou itens a contabilizar
                        //    -3 : ERRO ao tentar criar tabela para agrupamento
                        //    -4 : Processo interrompido pelo usuário sem contabilização
                        //    -5 : ERRO ao fazer o Lançamento Contábil
                        //    -6 : ERRO no Período Contábil
                        //    -7 : Processo interrompido pelo usuário sem contabilização
                        case iResult of
                           -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a contabilizar do EP Anterior ]';
                           -2 : sMensErro := '[ Query não retornou itens a contabilizar do EP Anterior ]';
                           -3 : sMensErro := '[ ERRO ao tentar criar tabela para agrupamento do EP Anterior ]';
                           -4 : sMensErro := '[ ERRO ao buscar Parâmetros de Integração do EP Anterior ]';
                           -5 : sMensErro := '[ ERRO ao fazer o Lançamento Contábil do EP Anterior ]';
                           -6 : sMensErro := '[ ERRO no Período Contábil do EP Anterior ]';
                           -7 : sMensErro := '[ Processo interrompido pelo usuário sem contabilização do EP Anterior ]';
                        end;  // case iResult of

                        if (sErro.Count > 0) then
                        begin
                           sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count -1];
                        end;

                        Exit;
                     end;  // if
                  end; // if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 *)

                  // -------------------------------------------------------------------------------
                  //    FIM Contabilização Empréstimo Anterior
                  // -------------------------------------------------------------------------------


                  // -------------------------------------------------------------------------------
                  // Atualiza a Situação do EP Anterior: FLGSITUACAO = 'Q' ou 'K'
                  CalcEmptmo.AcertaSituacaoContratual(rContratoAnterior.IDContratoEmptmo);

                  LogToFile('Acerta situacao contratual ' + FormatFloat('#0', rContratoAnterior.IDContratoEmptmo), sArq);
                  // -------------------------------------------------------------------------------

                  // -------------------------------------------------------------------------------
                  try
                     // Grava o Contrato responsável pela Quitação
                     with qryContratoQuitacao do
                     begin
                        LimpaParametros(qryContratoQuitacao);
                        ParamByName('PIDCONTRQUITACAO').AsFloat  := rNovoContrato.IDContratoEmptmo;
                        ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContratoAnterior.IDContratoEmptmo;
                        ExecSQL;
                     end;

                     LogToFile('Grava ID contrato quitacao ' +
                               FormatFloat('#0', rContratoAnterior.IDContratoEmptmo) + ' ' +
                               FormatFloat('#0', rNovoContrato.IDContratoEmptmo),
                               sArq
                              );
                  except
                     LogToFile('Erro ao gravar ID contrato quitacao ' +
                               FormatFloat('#0', rContratoAnterior.IDContratoEmptmo) + ' ' +
                               FormatFloat('#0', rNovoContrato.IDContratoEmptmo),
                               sArq
                              );
                  end;
                  // -------------------------------------------------------------------------------

                  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - INÍCIO
                  if (qryContratosAnteriores.FieldByName('FLGPERDAEFETIVA').AsString = '1') then begin
                    sContratoPerdaEfetiva := qryContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsString;
                  end;
                  //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - FIM

               end; // if qryContratosAnterioresFLGESCOLHA.AsInteger = 1
            end; // if edtSaldoAQuitar.Value > 0

            qryContratosAnteriores.Next;

         end; // while not(qryContratosAnteriores.EOF)

         //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - INÍCIO
         if (Trim(sContratoPerdaEfetiva) <> '') then begin
           try
             qryInsertPerdaEfetiva := TwwQuery.Create(Application);
             with qryInsertPerdaEfetiva do begin
               DatabaseName  := 'BaseDados';

               Close;
               Sql.Clear();
               Sql.Add('INSERT INTO suspconcessao VALUES (:PIDPESSOA,');
               Sql.Add('                                  TRUNC(SYSDATE),');
               Sql.Add('                                  add_months(TRUNC(SYSDATE),6),');
               Sql.Add('                                  ''Bloqueio automático por renegociação de contrato baixado contabilmente devido a perda efetiva.'',');
               Sql.Add('                                  SYSDATE,');
               Sql.Add('                                  USER,');
               Sql.Add('                                  ''A'',');
               Sql.Add('                                  NULL,');
               Sql.Add('                                  NULL,');
               Sql.Add('                                  ''N'',');
               Sql.Add('                                  seqsuspconcessao.nextval,');
               Sql.Add('                                  NULL,');
               Sql.Add('                                  21,');
               Sql.Add('                                  :PIDCONTRATOEMPTMO)');
               ParamByName('PIDPESSOA').AsString := qryContratosAnteriores.FieldByName('IDPESSOA').AsString;
               ParamByName('PIDCONTRATOEMPTMO').AsString := sContratoPerdaEfetiva;
               ExecSql;
             end;
           finally
             FreeAndNil(qryInsertPerdaEfetiva);
           end;
         end;
        //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - FIM

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    FIM Quitação do(s) Contrato(s) anteriore(s)
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    Gravação do Contrato
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Grava os beneficiarios em caso de renovação
         LimpaParametros(qryBenefSeguro);
         qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := rNovoContrato.IDInscricaoEmptmo;
         qryBenefSeguro.Open;

         for iContador := 0 to High(vListaContratoXBenefSeg) do
         begin
             if (rNovoContrato.IDInscricaoEmptmo <> vListaContratoXBenefSeg[iContador].IDInscricaoEmptmo) and
                (vListaContratoXBenefSeg[iContador].IDInscricaoEmptmo <> -1) then
             begin
                try
                   qryBenefSeguro.Insert;
                   qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := rNovoContrato.IDInscricaoEmptmo;
                   qryBenefSeguroIDBENEFSEGURO.AsInteger     := vListaContratoXBenefSeg[iContador].IDBenefSeguro;
                   qryBenefSeguroPERCINDENIZACAO.AsFloat     := vListaContratoXBenefSeg[iContador].PercIndenizacao;
                   qryBenefSeguro.Post;
                except
                   qryBenefSeguro.Cancel;
                end;
             end;
         end;

         // ----------------------------------------------------------------------------------------
         // Se for uma renovação com valor líquido de concessão ZERO,
         // baixa automaticamente o valor concedido
         if (edtLiquidoGeral.Value = 0) then
         begin
            for iContador := 0 to High(vLista) do
            begin
               if (vLista[iContador].FlgCentraliza = 1) then
               begin
                  vLista[iContador].ValorEfetivo  := 0;
                  vLista[iContador].DataEfetiva   := rNovoContrato.DataCredito;
                  vLista[iContador].FlgBaixado    := -1;
                  vLista[iContador].FormaCobranca := '';
               end;
            end;
         end;
         // ----------------------------------------------------------------------------------------

         LogToFile('Antes GravaMovEmptmo', sArq);

         // Gravação do Histórico dos Itens do Contrato
         if not(CalcEmptmo.GravaMovEmptmo(rNovoContrato,
                                          vLista,
                                          0,                            // Evento 0 - Concessão *)
                                          0,                            // Será Parcela de número 0 - Zero *)
                                          DiasUteis.ExtraiAno(rNovoContrato.DataCredito),    // Ano Competência - Ano da Data de Crédito do Novo Contrato
                                          DiasUteis.ExtraiMes(rNovoContrato.DataCredito),    // Mês Competência - Mês da Data de Crédito do Novo Contrato
                                          DiasUteis.ExtraiAno(rNovoContrato.DataCredito),    // Ano Cobrança - Ano da Data de Crédito do Novo Contrato
                                          DiasUteis.ExtraiMes(rNovoContrato.DataCredito),    // Mês Cobranca - Mês da Data de Crédito do Novo Contrato
                                          rNovoContrato.NumParcelas,    // Parcelas Remanescentes
                                          rNovoContrato.DataCredito,    // DataPrevista -> Data do Crédito
                                          dDataUltAtualiza,
                                          '',
                                          '',
                                          True
                                         )) then
         begin
            Repaint;

            LogToFile('Erro gravacao do historico ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo), sArq);

            bErro       := True;
            sMensErro   := '[ Gravação do Histórico dos Itens de Contrato ]';
            Exit;
         end;  // if GravaMovEmptmo

         LogToFile('Gravacao do historico ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo), sArq);

         Repaint;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    FIM Gravação do Contrato
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    Contabilização do Empréstimo Atual
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
            (dtmEmptmo.qryParamEmptmoFLGCONTABCONC.AsInteger = 0) then
         begin
            iResult := ContabilizaContrato(rNovoContrato.IDContratoEmptmo,
                                           'EMPRÉSTIMOS DE PARTICIPANTES - Concessão de Empréstimo',
                                           '0',
                                           iPlanilhaResult,
                                           sResult,
                                           sErro
                                          );

            if (iResult <> 0) then
            begin
               // ERRO na Contabilização com Erro
               bErro := True;

               case iResult of
                  -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a contabilizar ]';
                  -2 : sMensErro := '[ Query não retornou itens a contabilizar ]';
                  -3 : sMensErro := '[ ERRO ao tentar criar tabela para agrupamento ]';
                  -4 : sMensErro := '[ ERRO ao buscar Parâmetros de Integração ]';
                  -5 : sMensErro := '[ ERRO ao fazer o Lançamento Contábil ]';
                  -6 : sMensErro := '[ ERRO no Período Contábil ]';
                  -7 : sMensErro := '[ Processo interrompido pelo usuário sem contabilização ]';
               end;

               if (sErro.Count > 0) then
                  sMensErro := sMensErro + #13 + sErro.Strings[(sErro.Count - 1)];

               Exit;
            end; // if iResult <> 0

         end; // if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    FIM Contabilização do Empréstimo Atual
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    Quitação da Divida de Financiamento Habitacional
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
         begin
            qryOutrasDividas.First;

            while not(qryOutrasDividas.EOF) do
            begin
               if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger  = 1) and
                  (qryOutrasDividasCODTIPO.AsInteger = 3) and
                  (qryOutrasDividasFLGESCOLHA.AsInteger = 1) then
               begin
                  if not(dtmDividaEP.QuitaDividaSIAFI(rNovoContrato.IDBenef,
                                                      iPlanilhaResult,
                                                      Sistema.IDModulo,
                                                      rNovoContrato.DataCredito,
                                                      FormatFloat('#0', rNovoContrato.IDContratoEmptmo),
                                                      qryOutrasDividas.FieldByName('ORDEM').AsString)) then
                  begin
                     LogToFile('Erro quitacao SIAFI ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo), sArq);

                     bErro := True;
                     sMensErro := '[ ERRO ao Quitar Dividas SIAFI ]';
                     Exit;
                  end;
               end;
               qryOutrasDividas.Next;
            end;
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    Fim da Quitação da Divida de Financiamento Habitacional
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    Envio
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Só envia se o pagamento for por Contas a Pagar E
         // o valor líquido for maior que ZERO E
         // o sistema não estiver parametrizado para fazer envio de concessão em lote

         // Andre Pontes - Pendência 14501 - 11/07/2003
         // eMarchetti - 03/10/2007 - Ajust para obedecer parametrização
         if ( dtmEmptmo.qryParamEmptmoFLGINTEGRACAPCAR.AsInteger = 1 ) and
            ( dtmEmptmo.qryParamEmptmoFLGINTEGRACONC.AsInteger <> 1 ) and
            ( dtmEmptmo.qryParamEmptmoFLGCONTROLAINSC.AsInteger <> 1 )
         // FIM Andre Pontes - Pendência 14501 - Andre Pontes - 11/07/2003
            and ( edtLiquidoGeral.Value > 0 )
            and ( rNovoContrato.flgFormaPag = 'C' ) then
         begin
            // FLGFORMAPAG = 'C' -> indicando que o Crédito é pelo Contas a Pagar
            iResult := EnviaContratoCAPCAR(iPlanilhaResult, '', sResult, sErro);

            if (iResult <> 0) then
            begin
               // Envio CAP com Erro
               bErro := True;

               case iResult of
                  -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a enviar ao CAP/CAR ]';
                  -2 : sMensErro := '[ Query não retornou itens a Enviar ao CAP/CAR ]';
                  -3 : sMensErro := '[ ERRO ao inserir Documento no CAP/CAR ]';
                  -4 : sMensErro := '[ ERRO no Rateio do Documento no CAP/CAR ]';
                  -5 : sMensErro := '[ ERRO ao Lançar Documento no CAP/CAR ]';
                  -6 : sMensErro := '[ ERRO ao inserir Mensagens no Documento ]';
                  -7 : sMensErro := '[ ERRO ao Atualizar Histórico com o Documento no CAP/CAR ]';
                  -8 : sMensErro := '[ Processo interrompido pelo usuário sem envio ao CAP/CAR ]';
               end;

               if (sErro.Count > 0) then
                   sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count -1];

               Exit;
            end;  // if Result CAP

            // se FLGFORMAPAG = 'F' -> indicando que o Crédito é pela Folha
            //   NADA é feito na Concessão.  O Contrato será enviado para TMPDESC
            //   pela rotina do ENVIO

         end;  // if (rNovoContrato.flgFormaPag = 'C') and (edtLiquidoGeral.Value > 0)

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //
         //    FIM Envio
         //
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Atualização da Situação da Inscrição
         //    FLGSITUACAO = 'E' -> 'Contrato Associado' -> Já utilizada em contrato
         // ----------------------------------------------------------------------------------------
         if not(CalcEmptmo.AtualizaFlgSituacao(rNovoContrato.IDInscricaoEmptmo, 'INSCRICAOEMPTMO', 'E', sMensErro)) then
         begin
            LogToFile('Erro na atualizacao da situacao da inscricao ' + FormatFloat('#0', rNovoContrato.IDInscricaoEmptmo), sArq);

            // Atualização da Situação da Inscrição com Erro
            bErro     := True;
            sMensErro := '[ Atualização da Situação da Inscrição ]' + #13 + sMensErro;
            Exit;
         end; (* if Atualiza Flag Situação da Inscrição *)

         LogToFile('Atualizacao da situacao da inscricao ' + FormatFloat('#0', rNovoContrato.IDInscricaoEmptmo), sArq);

         // ----------------------------------------------------------------------------------------
         // Log de operações
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
      except
         // Houve erro - Desfaz a transação
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then
             RollBackTransacao;

         Raise;
         Repaint;

         LogToFile('ERRO ao final - btnCancelarClick ', sArq);

         bbtnCancelarClick(self);
      end;

      // -------------------------------------------------------------------------------------------

      // Cria a Query Auxiliar
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BaseDados';

      // Verifica as Contas Bancarias

//      if not(bErro) then
      if not(bErro) and (DBrdgCredito.ItemIndex = 0) then
      begin
         LogToFile('Teste Conta Bancária de crédito', sArq);

         sSQL := 'SELECT IDPESSOA FROM CONTABANCARIA WHERE IDCBANCARIA = ' + FormatFloat('#0', rNovoContrato.IDCBancaria);

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         if (qryAux.FieldByName('IDPESSOA').AsFloat <> rNovoContrato.IDBenef) then
         begin
            bErro := True;

            LogToFile('Conta bancária de crédito não confere com Mutuário!', sArq);

            MsgDlg('Conta bancária de crédito não confere com Mutuário!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
         end;

         qryAux.Close;
      end;

      if not(bErro) and (DBrdgDebito.ItemIndex = 0) then
      begin
         LogToFile('Teste Conta Bancária de débito', sArq);

         sSQL := 'SELECT IDPESSOA FROM CONTABANCARIA WHERE IDCBANCARIA = ' + FormatFloat('#0', rNovoContrato.IDCBancariaDeb);

         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         if qryAux.FieldByName('IDPESSOA').AsFloat <> rNovoContrato.IDBenef then
         begin
            bErro := True;

            LogToFile('Conta bancária de débito não confere com Mutuário!', sArq);

            MsgDlg('Conta bancária de débito não confere com Mutuário!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
         end;

         qryAux.Close;
      end;

      // -------------------------------------------------------------------------------------------

      if not(bErro) then
      begin
         //Pendência 23429 - 28/09/2006 - Alberto
         if (qryTipoContratoTCEMAXCONTRATO.AsInteger = 1) then
         //Fim Pendência 23429
         begin
            LogToFile('Teste de contrato ativo anterior', sArq);

            if not(CalcEmptmo.VerificaContratoAtivo(rNovoContrato.IDPessoa,
                                                    rNovoContrato.IDBenef,
                                                    rNovoContrato.IDTipoContrEmptmo,
                                                    True,
                                                    rNovoContrato.IDContratoEmptmo
                                                   )) then
            begin
               bErro := True;

               LogToFile('Crítica de contrato ativo anterior - concessão cancelada', sArq);

               Repaint;
            end;
         end;
      end;
   finally

      if bErro then
      begin
         // Houve erro - Desfaz a transação (só se não houver transacao anterior)
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then RollBackTransacao;

         LogToFile('Gravação do Contrato não efetuada:' + sMensErro, sArq);

         MsgDlg('Gravação do Contrato não efetuada:' + #13 + sMensErro, 'Empréstimo', mtError, [mbOk], 0);
         Repaint;

         bbtnCancelarClick(self);
      end
      else  // if bErro
      begin
         if ( (qryAvalista.Active) and (qryAvalista.UpdatesPending) ) then
         begin
            try
               qryAvalista.ApplyUpdates;
               qryAvalista.CommitUpdates;

               LogToFile('Gravacao dos avalistas ', sArq);
            except
               LogToFile('Erro na gravacao dos avalistas ', sArq);
               qryAvalista.CancelUpdates;
            end;
         end;

         if ( (qryBenefSeguro.Active) and (qryBenefSeguro.UpdatesPending) ) then
         begin
            try
               qryBenefSeguro.ApplyUpdates;
               qryBenefSeguro.CommitUpdates;

               LogToFile('Gravacao dos beneficiarios ', sArq);
            except
               LogToFile('Erro na gravacao dos beneficiarios ', sArq);
               qryBenefSeguro.CancelUpdates;
            end;
         end;

         // Só "commita" se não houver transacao anterior
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then
         begin
            LogToFile('Commit Transaction', sArq);
            CommitTransacao;
         end;

         LogToFile('Habilitacao dos botoes', sArq);

         bbtnContrato.Enabled := False;
         bbtnSimula.Enabled   := False;
         sbtnApagar.Enabled   := False;
         sbtnImprimir.Enabled := True;


         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // André Pontes - 30/09/2005
         // Verificação da correta gravação do contrato e histórico

         try
            // 1) Verifica se o contrato EXISTE na tabela ContratoEmptmo

            sSQL := 'SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO = ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo);

            qryAux.SQL.Clear;
            qryAux.SQL.Text := sSQL;
            qryAux.Open;

            if qryAux.IsEmpty then
            begin
               bErro := True;

               LogToFile('O Contrato NÃO FOI GRAVADO! ', sArq);

               MsgDlg('O Contrato NÃO FOI GRAVADO!', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
            end;

            qryAux.Close;

            // ----------------------------------------------------------------------------------------

            // 2) Verifica a HistMovEmptmo

            if not(bErro) then
            begin
               sSQL := 'SELECT COUNT(IDCONTRATOEMPTMO) AS QUANT FROM HISTMOVEMPTMO WHERE IDCONTRATOEMPTMO = ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo);

               qryAux.SQL.Clear;
               qryAux.SQL.Text := sSQL;
               qryAux.Open;

               if qryAux.FieldByName('QUANT').AsInteger <= 0 then
               begin
                  bErro := True;

                  LogToFile('Os ITENS do Contrato NÃO FORAM GRAVADOS! ', sArq);

                  MsgDlg('Os ITENS do Contrato NÃO FORAM GRAVADOS!', 'Empréstimo', mtError, [mbOk], 0);
                  Repaint;
               end
               else
               begin
                  if qryAux.FieldByName('QUANT').AsInteger < 2 then
                  begin
                     bErro := True;

                     LogToFile('Pode ter havido erro na gravação dos ITENS do Contrato! ', sArq);

                     MsgDlg('Pode ter havido erro na gravação dos ITENS do Contrato!' + #13 +
                            'Favor verificar.', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;
                  end;
               end;

               qryAux.Close;
            end;

            // -------------------------------------------------------------------------------------
            // André Pontes - 02/12/2005

            // Aqui conta a quantidade de itens
            if not(bErro) then
            begin
               sSQL :=
               'SELECT COUNT(HME.IDITEMEMPTMO) AS QUANT '                                             + #13 +
               'FROM   HISTMOVEMPTMO HME '                                                            + #13 +
               'WHERE '                                                                               + #13 +
               '       HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo)   + #13 +
               '   AND HME.IDITEMEMPTMO     = ( '                                                     + #13 +
               '                              SELECT IDITEMEMPTMO '                                   + #13 +
               '                              FROM   ITEMXTIPOCONTR '                                 + #13 +
               '                              WHERE '                                                 + #13 +
               '                                     IDTIPOCONTREMPTMO     = ' + FormatFloat('#0', rNovoContrato.IDTipoContrEmptmo)  + #13 +
               '                                 AND ITCEVENTO             = 0 '                      + #13 +
               '                                 AND NVL(FLGCENTRALIZA, 0) = 1 '                      + #13 +
               '                              ) ';

               qryAux.SQL.Clear;
               qryAux.SQL.Text := sSQL;
               qryAux.Open;

               if (qryAux.FieldByName('QUANT').AsInteger <= 0) then
               begin
                  bErro := True;

                  LogToFile('O item CENTRALIZADOR do Contrato NÃO FOI GRAVADO! ', sArq);

                  MsgDlg('O item CENTRALIZADOR do Contrato NÃO FOI GRAVADO!', 'Empréstimo', mtError, [mbOk], 0);
                  Repaint;
               end
               else
               begin
                  if (qryAux.FieldByName('QUANT').AsInteger > 1) then
                  begin
                     bErro := True;

                     LogToFile('O item CENTRALIZADOR foi gravado em DUPLICIDADE! ', sArq);

                     MsgDlg('O item CENTRALIZADOR foi gravado em DUPLICIDADE!', 'Empréstimo', mtWarning, [mbOk], 0);
                     Repaint;
                  end;
               end;
            end;

            // FIM André Pontes - 02/12/2005
            // ----------------------------------------------------------------------------------------

            //Inicio - William Santana - SOL 196724 KIN 1899039
            if bTemAmortizacaoNaoEnviada then
            begin
             qryContratosAnteriores.First;
             qryContratosAnteriores.Filtered := False;
             qryContratosAnteriores.Filter   := 'FLGESCOLHA = 1';
             qryContratosAnteriores.Filtered := True;

             while not qryContratosAnteriores.eof do
             begin 
              qryVerificaAmortizacao.Close;
              qryVerificaAmortizacao.Params[0].AsString  := floattostr(qryContratosAnterioresIDContratoEmptmo.AsFloat);
              qryVerificaAmortizacao.Params[1].AsString  := edtDataCredito.text;
              qryVerificaAmortizacao.Open;

              qryVerificaAmortizacao.Filtered := False;
              qryVerificaAmortizacao.Filter   := 'FLGENVIO = 0';
              qryVerificaAmortizacao.Filtered := True;
              
               while not qryVerificaAmortizacao.Eof do
               begin
                if CalcEmptmo.CancelaAmortizacao(qryVerificaAmortizacaoIDCONTRATOEMPTMO.AsFloat,
                                                 qryVerificaAmortizacaoHMEDATAPREVISTA.asDateTime,
                                                Date,
                                                True
                                                ) = -1 then
                begin
                    bErro := True;   //falha no cancelamento da amortização
                end;
                qryVerificaAmortizacao.next;
               end;
              qryContratosAnteriores.next;
             end
            end;
            qryContratosAnteriores.Filtered := False;
            qryVerificaAmortizacao.Filtered := False;
            //Término - William Santana - SOL 196724 KIN 1899039

            // 4) Se não houve problema, mostra a mensagem

            if not(bErro) then
            begin
               MsgDlg('Contrato ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo) + ' gravado com Sucesso.',
                      'Empréstimo', mtInformation, [mbOk], 0);

               // Marchetti - Pendencia 22042
               IntegraModulo.iEvento         := 0;
               IntegraModulo.iContratoEmptmo := rNovoContrato.IDContratoEmptmo;
               IntegraModulo.fValorSolic     := rNovoContrato.VlrContrato;
               IntegraModulo.iNumParcelas    := rNovoContrato.NumParcelas;
               // Fim Marchetti - Pendencia 22042

               Repaint;
            end;

         finally
            qryAux.Close;
            qryAux.Free;
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------


         try
            // Impressão do Contrato
            VerificaImpressaoContrato;

            // Marchetti - Pendencia 22042
            if (Sistema.IdModulo = 19) then
               bbtnSairClick(Self);
            // Fim Marchetti - Pendencia 22042

         except
            Raise;
            Repaint;
            bbtnCancelarClick(Self);
            qry.Close;
         end;

         qryItensConcessao.Close;
         qryAvalista.Close;
         qryBenefSeguro.Close;
         qryContratosAnteriores.Close;
         qry.Close;

      end;  // if bErro

      if bDesabilitouContrato then bDesabilitouContrato := False;

      sResult.Free;
      sErro.Free;

   end;  // try..finally
end;

function TfrmCadInscricao.ContabilizaContrato(const iContrato        : Extended;
                                                    sMensagem        : String;
                                                    sTipoMov         : String;
                                              var   iPlanilhaResult  : Integer;
                                              var   sResult          : TStringList;
                                              var   sErro            : TStringList
                                             ): Integer;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, '      + #13 +
   '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMEFORMACOBRANCA, '                        + #13 +
   '   CNT.IDTIPOCONTREMPTMO, '                                                              + #13 +
   '   CNT.IDPLANOORIGEM, '                                                                  + #13 +
   '   DECODE(CNT.IDPLANOORIGEM, NULL, CNT.IDPLANOPREV, CNT.IDPLANOORIGEM) AS IDPLANOPREV, ' + #13 +
   '   CNT.IDPATRO, ITC.TIPCODIGO '                                                          + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '      ( HME.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', iContrato) + ' ) '                 + #13 +
   // eMarchetti - 03/10/2007 - Ajust para obedecer parametrização
   '  AND ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)  + ' ) '                 + #13 +

   // André Pontes - 17/05/2005 - pendência 19249
   '   AND HME.HMESEQCOBRANCA         = 1 '                                                  + #13 +
   '   AND HME.HMEVLRPREVISTO        <> 0 '                                                  + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19249

   // André Pontes - 17/05/2005 - pendência 19264
   '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0 '                                                    + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19264

   '  AND ( (HME.HMECENTRALIZA    = 0) OR (HME.HMECENTRALIZA IS NULL) )'                     + #13 +
   '  AND ( HME.HMETIPOMOV        = ' + sTipoMov + ' ) '                                     + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = ITE.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO )'                                 + #13;

   sMensagem := sMensagem + ' - ' + 'Contrato nº ' + FormatFloat('#0', iContrato);

      Result := IntegraEmptmo.ContabilizaItens('C',
                                               'N',
                                               sSQL,
                                               sMensagem,
                                               rNovoContrato.DataCredito,
                                               sResult,
                                               sErro,
                                               iPlanilhaResult
                                              );
end;




function TfrmCadInscricao.EnviaContratoCAPCAR(var   iPlanilha    : Integer;
                                              const sNomePatro   : String;
                                              var   sResult      : TStringList;
                                              var   sErro        : TStringList
                                             ): Integer;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +
   '  DECODE(CON.IDPLANOORIGEM, NULL, CON.IDPLANOPREV, CON.IDPLANOORIGEM) AS IDPLANOPREV, '  + #13 +
   '  CON.IDPLANOORIGEM, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, CON.MATRICULA, '            + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '                + #13 +
   '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '         + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                  + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +

   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS            AS PRAZO, '                                              + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +

   '     TEP.IDEMPRESAPROP,         CON.IDPATRO,                  CON.IDPLANOPREV, '         + #13 +
   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO,             CON.IDPLANOORIGEM, '       + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO,             CON.IDCBANCARIADEB, '                                    + #13 +

   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

   '     ELP.MATRICULA, ELP.MATRICULA AS MATRICULA_TIT, '                                    + #13 +

   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +

   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +

   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +
   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                                 + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     PLANPREV        PLP, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP '                                                               + #13 +
   '  WHERE '                                                                                + #13 +
   '         TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                         + #13 +
   '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo)   + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
   //'     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +
   '     AND PPP.IDPLANOPREV       = ' + qryIDPLANOPREV.AsString                             + #13 +// Ádler Souza - SOL 145988 Kintana 987019
   '  ) CON, '                                                                               + #13 +

   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC  '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA  = ''C'' ) '                                               + #13 +
   '   AND ( HME.HMERECPAG         = ''P'' ) '                                               + #13 +
   '   AND HME.IDCONTRATOEMPTMO    = ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo)   + #13 +

   '   AND ( HME.HMETIPOMOV        = 0 ) '                                                   + #13 +
   '   AND ( HME.HMEPARCELA        = 0 ) '                                                   + #13 +

   '   AND ( HME.FLGENVIO          = 0 ) '                                                   + #13 +
   '   AND ( HME.FLGBAIXADO        = 0 ) '                                                   + #13 +
   '   AND ( HME.HMEVLREFETIVO     IS NULL ) '                                               + #13 +
   '   AND ( HME.HMEDATAEFETIVA    IS NULL ) '                                               + #13 +
   '   AND ( HME.CODDOCUMENTO      IS NULL ) '                                               + #13 +

   '   AND ( HME.HMECENTRALIZA     = 1 OR HME.HMEDESTACADO       = 1 ) '                     + #13 +
   '   AND ( HME.FLGESTORNADO      IS NULL OR HME.FLGESTORNADO   = 0 ) '                     + #13 +
   '   AND ( HME.FLGABONADO        IS NULL OR HME.FLGABONADO     = 0 ) '                     + #13 +
   '   AND ( HME.FLGQUITADO        IS NULL OR HME.FLGQUITADO     = 0 ) '                     + #13 +
   '   AND ( HME.FLGSUSPENSAO      IS NULL OR HME.FLGSUSPENSAO   = 0 ) '                     + #13 +

   '   AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  ) '                               + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                    + #13 +
   '   AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                    + #13;

   // ----------------------------------------------------------------------------------------------

   Result := IntegraEmptmo.EnviaCAPCAR(sSQL,
                                       'Concessao de Emprestimo - ', // IntToStr(rNovoContrato.IDContratoEmptmo),
                                       Sysdate, // rNovoContrato.DataCredito,
                                       -1,
                                       iMoedaCorrente,
                                       sCCusto,
                                       iPrograma,
                                       iPlanilha,
                                       sResult,
                                       sErro
                                      );

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmCadInscricao.DBedtDataInscEnter(Sender: TObject);
begin
   // atributo interno (PRIVATE) que guarda a última Data de inscrição válida
   dDataInscricao := DBedtDataInsc.Date;
end;



procedure TfrmCadInscricao.DBedtDataInscExit(Sender: TObject);
begin
   inherited;

   if (ActiveControl = bbtnCancelar) then Exit;

   // Verifico se houve mudanças no Data de Solicitação. Caso positivo,
   //   a propriedade Modified do CMDateTimePicker é True
   if DBedtDataInsc.Modified then
   begin
      // Data de Assinatura Modificada

      // Forçando o preenchimento do Campo DATAINSC antes do fechamento do DateTimePicker
      qryDATAINSC.AsDateTime := DBedtDataInsc.Date;

      // Validação das Datas de Assinatura e Inscrição
      if qryDATAINSC.AsDateTime > edtDataAssinatura.Date then
      begin
         MsgDlg('A Data da Solicitação NÃO pode ser posterior a Data da Assinatura.  Favor verificar.',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         (* Retorna a última Data de Inscrição válida *)
         DBedtDataInsc.Date      := dDataInscricao;
         DBedtDataInsc.Modified  := False;

         pgcValores.ActivePage   := tbsGeral;

         if DBedtDataInsc.CanFocus then DBedtDataInsc.SetFocus;

         Exit;

      end;(* if DataInsc > DataAssinatura *)

   end
   else
   begin
      // Data de Assinatura NÃO Modificada

      if DBedtDataInsc.Modified then
      begin
         DBedtDataInsc.Modified := False;

         // Forçando o preenchimento do Campo DATAINSC antes do fechamento do DateTimePicker
         qryDATAINSC.AsDateTime := DBedtDataInsc.Date;

         // função da unit UCalcEmptmo que busca a Reserva de Poupança do participante
         //   ou do beneficiário, no caso do pensionista *)
         edtValReserva.Value := CalcEmptmo.BuscaReserva(qryIDBENEF.AsInteger, qryIDPATRO.AsInteger,
                                                        qryIDPLANOPREV.AsInteger,
                                                        qryTipoContratoIDREGRARESERVA.AsInteger,
                                                        qryDATAINSC.AsDateTime, True
                                                        //Pendência 22836 - 03/10/2006 - Alberto
                                                       ,0
                                                       ,chkExcepcional.Checked
                                                        );
                                                        //Fim Pendência 22836

         if (edtValReserva.Value = -1) then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Não foi possível recuperar o valor da reserva de poupança.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            bbtnCancelarClick(bbtnCancelar);
            Exit;
         end;

      end; (* if DataInsc Modified *)

   end; (* if Modified *)
end;



procedure TfrmCadInscricao.edtDataAssinaturaEnter(Sender: TObject);
begin
   (* atributo interno (PRIVATE) que guarda a última Data de Assinatura válida *)
   dDataAssinatura := edtDataAssinatura.Date;
end;



procedure TfrmCadInscricao.edtDataAssinaturaExit(Sender: TObject);
begin
   if (ActiveControl = bbtnCancelar) then Exit;

   // Verifico se houve mudanças no Data de Assinatura. Caso positivo,
   //   a propriedade Modified do CMDateTimePicker é True
   //Pendência 22645 - 23/06/2006 - Alberto
   if (edtDataAssinatura.Modified) or (Sistema.TipoCliente = 19981) then
   //Fim Pendência 22645
   begin
      // Validação das Datas de Assinatura e Inscrição
      if ( (chkTRAVARDATAS.Checked) and (edtDataAssinatura.Date < DBedtDataInsc.Date) ) then
      begin
         MsgDlg('A Data da Assinatura NÃO pode ser anterior a Data da Solicitação.  Favor verificar...',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         (* Retorna a última Data de Assinatura válida *)
         edtDataAssinatura.Date     := dDataAssinatura;

         pgcValores.ActivePage      := tbsGeral;

         if edtDataAssinatura.CanFocus then edtDataAssinatura.SetFocus;

         Exit;
      end; (* if DataInsc > DataAssinatura *)

      (* só altera a data de crédito se esta não houver sido escolhida manualmente anteriormente *)
      if not(bTrocouDataCred) then
      begin
         (* Procedimento que acerta as Datas de Crédito, Data da Primeira Parcela e
            Calcula a Carência utilizando a função BuscaData da unit UCalcEmptmo *)
         AcertaDatas;

         (* Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
            acrescentando ao valor solicitado os valores dos itens de concessão *)
         BuscaValorLiquidoEP;

         edtDataCredito.Modified := False;
         //Pendência 22645 - 23/06/2006 - Alberto
         ActiveControl.SetFocus;
         //Fim Pendência 22645
      end;

   end;  // if Modified

   edtDataAssinatura.Modified := False;
end;



procedure TfrmCadInscricao.edtDataCreditoExit(Sender: TObject);
var
   nRecno: TBookMark; // Pendência 27264 - 22/01/2008
begin
   if (ActiveControl = bbtnCancelar) then Exit;

   // Verifico se houve mudanças no Data de Crédito. Caso positivo,
   //   a propriedade Modified do CMDateTimePicker é True
   //Pendência 22645 - 23/06/2006 - Alberto
   //if edtDataCredito.Modified then
   if (edtDataCredito.Modified) or (Sistema.TipoCliente = 19981) then
   //Fim Pendência 22645
   begin
      // Validação das Datas de Crédito e o atributo interno (PRIVATE) que guarda
      //   a Data de Crédito parametrizada pelo Sistema
      if ( (Sistema.TipoCliente = 19971) and (edtDataCredito.Date < SysDate) ) then
      begin
         MsgDlg('A Data do Crédito NÃO pode ser anterior a Data de Hoje.  Favor verificar...',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         // Retorna a Data parametrizada pelo Sistema
         edtDataCredito.Date     := dDataCredito;
         pgcValores.ActivePage   := tbsGeral;

         if edtDataCredito.CanFocus then edtDataCredito.SetFocus;

         Exit;
      end
      else
      if ( (chkTRAVARDATAS.Checked) and
           (edtDataCredito.Date < dDataCredito) and
           not(chkExcepcional.Checked)
         ) then
      begin
         MsgDlg('A Data do Crédito NÃO pode ser anterior a Data parametrizada pelo Sistema.  Favor verificar...',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         // Retorna a Data parametrizada pelo Sistema
         edtDataCredito.Date     := dDataCredito;
         pgcValores.ActivePage   := tbsGeral;

         if edtDataCredito.CanFocus then edtDataCredito.SetFocus;

         Exit;
      end; // if chkTravarDatas...

      if bDigitouDataCred then bTrocouDataCred := True;

      // Procedimento que acerta a Data da Primeira Parcela e Calcula a Carência
      //    utilizando a função BuscaData da unit UCalcEmptmo
      AcertaDataPrimParcela;

      // Procedimento que armazena os dados da Inscrição num registro
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

      AbreQueriesDividas;
      CalculaEPAnterior;

      // Pendência 27264 - 22/01/2008
      qryContratosAnteriores.First;
      while not qryContratosAnteriores.eof do
      begin
         LimpaParametros(qryContratoQuitavel);
         qryContratoQuitavel.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
         qryContratoQuitavel.ParamByName('PIDTIPOCONTRQUIT').AsInteger   := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
         qryContratoQuitavel.Open;

         nRecno := qryContratosAnteriores.GetBookMark;
         if ((qryContratoQuitavelFLOBRIGATORIO.AsInteger = 1) or
         (qryContratosAnterioresVLREMABERTO.AsCurrency > 0)) then //SOL125808 - Ádler Souza
         begin
            qryContratosAnteriores.Edit;
            qryContratosAnterioresFLGOBRIGATORIO.AsInteger := 1;
            qryContratosAnteriores.Post;
            b_btnIncluirQuitarClick := False;    // SOL 123381 - Daniel Begnami
            btnIncluirQuitarClick(btnIncluirQuitar);
            b_btnIncluirQuitarClick := True;     // SOL 123381 - Daniel Begnami            
         end;
         qryContratoQuitavel.Close;
         qryContratosAnteriores.GotoBookMark(nRecno);
         qryContratosAnteriores.FreeBookMark(nRecno);
         qryContratosAnteriores.Next;
      end;
      qryContratosAnteriores.First;
      // Fim Pendência 27264

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         if (iTotSiafi > 0) and
            not(chkExcepcional.Checked) and
            not(chkFinanciamento.Checked) then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Mutuário possui dívidas de Financiamento Habitacional. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;
         // ----------------------------------------------------------------------------------------
         // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
         //Pendência 27232 - 16/04/2008
         //if (qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) and
         //Fim Pendência 27232

         // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
         //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) and
            //(qryContratosAnteriores2.Active) then
         //begin
         // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
            //Pendência 27232 - 16/04/2008
            if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
            begin

               if (not chkExcepcional.Checked) and
                  (not ValidaTipoContratoEmprestimo(qryContratosAnteriores2,
                                                    qryIDPESSOA.AsInteger,
                                                    qryIDBENEF.AsInteger,
                                                    StrToInt(DBcboTipoContrato.LookupValue),
                                                    dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                                   )) then
         begin
                  //LogToFile('Contrato anterior do mesmo tipo', sArq);
                  //MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                  LogToFile('Tipo de contrato em aberto impede contratação', sArq);
                  MsgDlg('Tipo de contrato em aberto impede contratação!', 'Empréstimo', mtWarning, [mbOk], 0);
                  Repaint;
                  Exit;
               end;

            end;
            //Fim Pendência 23733

            qryContratosAnteriores2.First;
            while not(qryContratosAnteriores2.EOF) do
            begin
               if not(chkExcepcional.Checked) then
               begin
                  if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                                     True,
                                                     edtDataCredito.Date,
                                                     True,
                                                     StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                                     StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                                     // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                                     0
                                                    //Pendência 27232 - 16/04/2008
                                                    //) then
                                                    ) <> 0 then
                  begin
                     MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;
               end;

               //Pendência 27232 - 18/04/2008
               {
               // Marchetti - Pendencia 26318
               if not(chkExcepcional.Checked) then
               begin
                  if not TipoContratoPermitidoParaConcessao then
                  begin
                     MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;
               end;
               // Fim Marchetti - Pendencia 26318
               }

               qryContratosAnteriores2.Next;
            end;
         //end;
         // ----------------------------------------------------------------------------------------
      end;

      if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
      begin
         LimpaParametros(qryBenefSeguro);
         qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
         qryBenefSeguro.Open;
      end;

      // Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
      //   acrescentando ao valor solicitado os valores dos itens de concessão


      SetTxJuros; //SOL:115111 Daniel Begnami

      BuscaValorLiquidoEP;

   end;  // if Modified

   bDigitouDataCred        := False;
   edtDataCredito.Modified := False;
   //Pendência 22645 - 23/06/2006 - Alberto
   ActiveControl.SetFocus;
   //Fim Pendência 22645
end;



procedure TfrmCadInscricao.AcertaDatas;
begin
   // Procedimento que acerta as Datas de Crédito, Data da Primeira Parcela e
   //   Calcula a Carência utilizando a função BuscaData da unit UCalcEmptmo

   // Verifico se a query está em navegação (Browse), edição ou inserção,
   //   caso negativo o procedimento será abortado
   if trim(qryDATAINSC.AsString) = EmptyStr then
      Exit;

   if qry.State = dsInsert then
   begin
      try
         edtDataCredito.ReadOnly := False;

         if (DBcboTipoContrato.LookupValue <> EmptyStr) and not(qryTipoContratoIDREGRADATACRED.IsNull) then
         begin
            // função da unit UCalcEmptmo que utiliza a regra para data de crédito

            // Marchetti - 01/09/2003 - Pendencia 14939 - Passando o FLGINTERNET para
            // regra de data de crédito
            edtDataCredito.Date := CalcEmptmo.BuscaDataCredito(qryTipoContratoIDREGRADATACRED.AsInteger,
                                                               'C',
                                                               qryFLGFORMAPAG.AsString,
                                                               qryFLGINTERNO.AsString,
                                                               qryIDPATRO.AsInteger,
                                                               qryIDPLANOPREV.AsInteger,
                                                               0,
                                                               DBedtDataInsc.Date,
                                                               False,//chkExcepcional.Checked, //Renato Visoni SOL 115812 Kintana 543737
                                                               False,
                                                               qryFLGINTERNET.AsInteger);
            qryDATACREDITO.AsDateTime := edtDataCredito.Date;
         end
         else
         begin
            // função da unit UCalcEmptmo que utiliza a função CritDataEmptmo da unit
            //   UFuncoesEmptmo que busca a data em que o empréstimo será creditado em
            //   relação a data de solicitação.   É levado em consideração a
            //   Patrocinadora e data de crédito *)
            edtDataCredito.Date := CalcEmptmo.BuscaData('C',                        // Crédito
                                                        qryFLGFORMAPAG.AsString,
                                                        qryFLGINTERNO.AsString,
                                                        qryIDPATRO.AsInteger,
                                                        qryIDPLANOPREV.AsInteger,
                                                        0,                          // Parcela
                                                        edtDataAssinatura.Date);

            qryDATACREDITO.AsDateTime := edtDataCredito.Date;
         end;

         // atributo interno (PRIVATE) que guarda a Data de Crédito Parametrizada pelo Sistema
         dDataCredito := edtDataCredito.Date;

      except  // a exceção ocorre quando se tenta alterar a data do crédito para menos que a propriedade MinDate do edtDataCredito
         MsgDlg('A Data do Crédito NÃO pode ser anterior a hoje. Favor verificar...', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         edtDataAssinatura.Date := dDataAssinatura;
         Exit;
      end;  // try..except
   end
   else
   begin
      edtDataCredito.Date  := qryDATACREDITO.AsDateTime;
      dDataCredito         := edtDataCredito.Date;
   end;

   // Procedimento que acerta a Data da Primeira Parcela e Calcula a Carência
   //   utilizando a função BuscaData da unit UCalcEmptmo
   AcertaDataPrimParcela;
end;



procedure TfrmCadInscricao.AcertaDataPrimParcela;
var
   sSQLRegra : String;
   sData     : String;
   bCalculou : Boolean;
begin
   bCalculou := False;

   // Procedimento que acerta a Data da Primeira Parcela e Calcula a Carência
   //   utilizando a função BuscaData da unit UCalcEmptmo

   // ----------------------------------------------------------------------------------------------

   if (trim(DBcboTipoContrato.LookupValue) <> EmptyStr) and
      (qryTipoContratoIDREGRAPRIMPARC.AsInteger <> 0) then
   begin
      sData := FormatDateTime('dd/mm/yyyy', edtDataCredito.Date);

      sSQLRegra :=
      'SELECT '                                                                        + #13 +
      '  0' + trim(qryTipoContratoIDTIPOCONTREMPTMO.AsString)                      + ' AS IDTIPOCONTREMPTMO, '   + #13 +
      //Pendência 22836 - 03/10/2006 - Alberto
      '0'   + IntToStr(Ord(chkExcepcional.Checked))                          + ' AS FLGEXCEPCIONAL, '      + #13 +
      //Fim Pendência 22836
      '   ' + QuotedStr(sData)                                               + ' AS DATACREDITO, '         + #13 +

      // Marchetti - Pendencia 26443
      '   ' + QuotedStr(sEstado)                                             + ' AS CODESTADO, '           + #13 +
      '   ' + IntToStr(iPais)                                                + ' AS IDPAIS, '              + #13 +
      '   ' + IntToStr(iCidade)                                              + ' AS IDCIDADES, '           + #13 +
      '  0' + DBspeParcelas.Text                                             + ' AS NUMPARCELAS, '         + #13 +
      '   ' + qryIDSITPART.AsString                                          + ' AS IDSITPART, '           + #13 +
      '   ' + qryIDPLANOPREV.AsString                                        + ' AS IDPLANOPREV, '         + #13 +
      '   ' + qryIDBENEF.AsString                                            + ' AS IDPESSOA, '            + #13 +
      '   ' + qryIDPATRO.AsString                                            + ' AS IDPESSJUR, '           + #13 +
      '   ' + qryIDPESSOA.AsString                                           + ' AS IDTITULAR, '           + #13 +
      '   ' + QuotedStr(qryFLGINTERNO.AsString)                              + ' AS FLGINTERNO, '          + #13 +
      '  1'                                                                  + ' AS SEQPROPOSTA, '         + #13 +
      '   ' + QuotedStr(FormatDateTime('dd/mm/yyyy',qryDATAINSC.AsDateTime)) + ' AS DATAINSC, '            + #13 +
      '   ' + QuotedStr(FormatDateTime('dd/mm/yyyy',edtDataAssinatura.Date)) + ' AS DATAASSIN, '           + #13 +
      // Marchetti - Pendencia 26806
      '   ' + IntToStr(Ord(rdgMargemAlt.Checked))                            + ' AS FLGUSAMARGEMALT, '     + #13 +
      '   ' + QuotedStr(sData)                                               + ' AS DATAREF '              + #13 +

      'FROM '                                                                          + #13 +
      '  DUAL ';

      // -------------------------------------------------------------------------------------------
      if UtilizaRegraData(qryTipoContratoIDREGRAPRIMPARC.AsInteger,
                          sSQLRegra,
                          'e Data da Primeira Parcela',
                          sData,
                          False  // bMostraMsg
                         ) then
      begin
         if (sData <> '') and (sData <> 'NULO') then
         begin
            bCalculou := True;
            edtDataPrimParcela.Date := StrToDate(sData);
         end;
      end;
      // -------------------------------------------------------------------------------------------
   end;

   // ----------------------------------------------------------------------------------------------

   if not(bCalculou) then
   begin
      // -------------------------------------------------------------------------------------------
      edtDataPrimParcela.Date := CalcEmptmo.BuscaData('N',  // Normal
                                                      qryFLGFORMAREC.AsString,
                                                      qryFLGINTERNO.AsString,
                                                      qryIDPATRO.AsInteger,
                                                      qryIDPLANOPREV.AsInteger,
                                                      0,    // parcela 0 = concessão
                                                      edtDataCredito.Date
                                                     );
      // -------------------------------------------------------------------------------------------
   end;  // if qryTipoContratoIDREGRAPRIMPARC.AsInteger = 0

   // Calcula a Carência, isto é, quantos dias vão faltar para o dia do pagamento
   //   da Primeira Parcela do Empréstimo
   edtCarencia.Text := IntToStr(Trunc(edtDataPrimParcela.Date - edtDataCredito.Date));
end;



procedure TfrmCadInscricao.VerificaImpressaoContrato;
begin
   // Verifica se é oferecida a opção de Impressão do Contrato
   if dtmEmptmo.qryParamEmptmoFLGIMPRIMEINSC.AsInteger = 1 then
   begin
      if MsgDlg('Deseja imprimir o Contrato?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         Imprime;
      end;  // if MsgDlg
   end;  // if Parâmetros
end;



procedure TfrmCadInscricao.VerificaImpressaoInscricao;
begin

   // Verifica se é oferecida a opção de Impressão da Inscrição
   if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGIMPRINSCRICAO.AsInteger = 1) ) then
   begin
      if MsgDlg('Deseja imprimir a Inscrição?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         sbtnImprimirClick(Self);
      end; // if MsgDlg 
   end;

end;



procedure TfrmCadInscricao.Imprime;
var
   sSQL, sSQLdoUsuario, sArquivoTemp, sSQLTemp : String;
   qryAux : TwwQuery;
begin
   sSQL :=
   'SELECT'                                                                   + #13 +
   '  TIP.IDREPORTS, TIP.ORIGEMCM '                                           + #13 +
   'FROM '                                                                    + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                  + #13 +
   '  TIPOEMPTMO      TEM '                                                   + #13 +
   'WHERE '                                                                   + #13 +
   '      ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                      + #13 +
   '  AND ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.idEmpresa) + ' ) '   + #13 +
   '  AND ( TIP.IDTIPOCONTREMPTMO = ' + qryIDTIPOCONTREMPTMO.AsString + ' )';

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';
   qryAux.SQL.Text      := sSQL;

   try
      MostraEspera('Preparando impressão da Inscrição/Contrato...');

      (* Verifica se existe algum relatório parametrizável para o Tipo de Contrato *)
      try
         qryAux.Open;
      except
         MsgDlg('Não há Contrato a imprimir definido para esse Tipo de Contrato.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;


      (* Vai usar o relatório parametrizado pelo usuário *)
      if not(qryAux.IsEmpty) then
      begin
         sSQL :=
         'SELECT '                                                                        + #13 +
         '  DAT.TEMPLATE, REP.IDREPORTS, REP.ORIGEMCM '                                   + #13 +
         'FROM '                                                                          + #13 +
         '  REPORTS REP, '                                                                + #13 +
         '  DATAVIEW DAT '                                                                + #13 +
         'WHERE '                                                                         + #13 +
         '      ( REP.IDREPORTS  = ' + qryAux.FieldByName('IDREPORTS').AsString  + ' ) '  + #13 +
         '  AND ( DAT.IDDATAVIEW = REP.IDDATAVIEW ) '                                     + #13 +
         '  AND ( DAT.ORIGEMCMDV = REP.ORIGEMCMDV ) ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;

         try
            qryAux.Open;
            sSQLdoUsuario := qryAux.FieldByName('TEMPLATE').AsString;
         except
            MsgDlg('Erro ao tentar localizar relatórios parametrizado do usuário', 'Empréstimo',
                   mtError, [mbOk], 0);
            Repaint;
            Exit;
         end; (* try..except *)

         (* Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
            que estar no FieldsEditor e a query tem que ser RequestLive *)
         dtmRelatoriosUsu.qryDoUsuario.Close;
         dtmRelatoriosUsu.qryDoUsuario.ParamByName('IDREPORTS').AsInteger := qryAux.FieldByName('IDREPORTS').AsInteger;
         dtmRelatoriosUsu.qryDoUsuario.ParamByName('ORIGEMCM').AsInteger  := qryAux.FieldByName('ORIGEMCM').AsInteger;

         try
            dtmRelatoriosUsu.qryDoUsuario.Open;
         except
            MsgDlg('Erro ao abrir o layout do Tipo de Contrato.',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;


         if dtmRelatoriosUsu.qryDoUsuario.IsEmpty then
         begin
            MsgDlg('Não foi encontrado layout para o Tipo de Contrato. Favor verificar.',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;(* if IsEmpty *)


         with dtmRelatoriosUsu do
         begin
            sArquivoTemp := Sistema.TempDir + 'APrevRelContrato.tmp';
            sSQLTemp     := Sistema.TempDir + 'APrevSQLRelContrato.SQL';

            qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

            qryRelatParametrizavel.Close;
            qryRelatParametrizavel.SQL.Clear;
            qryRelatParametrizavel.SQL.Text := sSQLdoUsuario;

            qryRelatParametrizavel.SQL.Add(' AND CONTRATOEMPTMO.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo) );

            qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
            qryRelatParametrizavel.Open;

            dsRelatParametrizavel.DataSet                := qryRelatParametrizavel;
            pplRelatParametrizavel.DataSource            := dsRelatParametrizavel;
            rpRelatParametrizavel.Template.SaveTo        := stFile;
            rpRelatParametrizavel.Template.Format        := ftBinary;
            rpRelatParametrizavel.Template.FileName      := sArquivoTemp;
            rpRelatParametrizavel.Template.LoadFromFile;
            rpRelatParametrizavel.DataPipeline           := pplRelatParametrizavel;

            EscondeEspera;
            Repaint;

            try
               // Visualização do Contrato
               frmImpressaoContrato  := TfrmImpressaoContrato.Create(Application);

               frmImpressaoContrato.QryDados       := qryRelatParametrizavel;
               frmImpressaoContrato.idReports      := qryAux.FieldByName('IDREPORTS').AsInteger;
               frmImpressaoContrato.idOrigem       := qryAux.FieldByName('ORIGEMCM').AsInteger;
               frmImpressaoContrato.sNomeRelat     := 'Contrato - ' + FormatFloat('#0', rNovoContrato.IDContratoEmptmo);

               frmImpressaoContrato.bbtnConfirmarClick(Self);

               DeleteFile(sArquivoTemp);
               DeleteFile(sSQLTemp);
            finally
               frmImpressaoContrato.Free;
            end;
         end;  // with

      end
      else
      begin
         (* Vai usar o relatório padrão *)
         MsgDlg('É necessário implementar o modelo do Contrato através do módulo Gerador de Relatórios.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

      end;  // if not(qryAux.IsEmpty)

   finally
      EscondeEspera;
      qryAux.Free;
   end;
end;



(* A impressão foi transformada em um procedimento à parte, para ser chamada
   a partir da efetivação da Inscrição ou do Contrato *)
procedure TfrmCadInscricao.sbtnImprimirClick(Sender: TObject);
var
   sSQL           : String;
   sNomeItem      : String;
   sArquivoTemp   : String;
begin
   LimpaParametros(dtmLookEmptmo.qryLookEndereco);
   dtmLookEmptmo.qryLookEndereco.ParamByName('PIDPESSOA').AsInteger := qryIDBENEF.AsInteger;
   dtmLookEmptmo.qryLookEndereco.Open;

   // Verifica se inscrição já foi impressa
   if dtmEmptmo.qryParamEmptmoFLGCONTROLAINSC.AsInteger = 1 then
   begin
      if not(qryDATAENVIO.IsNull) then
      begin
         if MsgDlg('Inscrição já foi impressa. Confirma emissão de segunda via?!', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrNo then Exit;
         Repaint;
      end;
   end;

   sSQL :=
   'SELECT '                                                                                             + #13 +
   '   ''                                                            '''   + ' AS DEVEDOR, '             + #13 +
   '   ''                                                            '''   + ' AS PATRO, '               + #13 +
   '   ''             '''                                                  + ' AS MATRICULA, '           + #13 +
   '   1 '                                                                 + ' AS INSCRICAONUMERO, '     + #13 +
   '   TO_DATE(''01/01/2000'', ''DD/MM/YYYY'') '                           + ' AS DATASOLIC, '           + #13 +
   '   TO_DATE(''01/01/2000'', ''DD/MM/YYYY'') '                           + ' AS DATACREDITO, '         + #13 +
   '   0.01 '                                                              + ' AS TAXAJUROS, '           + #13 +
   '   0.01 '                                                              + ' AS VALORSOLIC, '          + #13 +
   '   0.01 '                                                              + ' AS SALDOEPANTERIOR, '     + #13 +
   '   0.01 '                                                              + ' AS VALORLIQUIDO, '        + #13 +
   '   1 '                                                                 + ' AS NUMPARCELAS, '         + #13 +
   '   0.01 '                                                              + ' AS VALORPARCELA, '        + #13 +
   '   1 '                                                                 + ' AS IDINSCRICAOEMPTMO, '   + #13 +

   '   ''                                                                                        '''     + ' AS ENDERECO, '      + #13 +
   '   ''                    '''                                           + ' AS BAIRRO, '              + #13 +
   '   ''                                        '''                       + ' AS CIDADE, '              + #13 +
   '   ''   '''                                                            + ' AS ESTADO, '              + #13 +
   '   ''         '''                                                      + ' AS CEP, '                 + #13 +

   '   ''              '''                                                 + ' AS CPF, '                 + #13 +
   '   ''                                                  '''             + ' AS SIT_PART, '            + #13 +

   '   ''                                                            '''   + ' AS BANCO, '               + #13 +
   '   ''               '''                                                + ' AS NUMAGENCIA, '          + #13 +
   '   ''               '''                                                + ' AS CONTA, '               + #13 +
   '   '' '''                                                              + ' AS TIPOCONTA, '           + #13 +

   '   TO_DATE(''01/01/2000'', ''DD/MM/YYYY'') '                           + ' AS DATAPRIMPARC, '        + #13 +

   '   ''                                        '''                       + ' AS ITEM, '                + #13 +
   '   0.01 '                                                              + ' AS VLR_ITEM '             + #13 +

   'FROM '                                                                                               + #13 +
   '   DUAL '                                                                                            + #13 +
   'WHERE 1 = 2';


   with dtmRelInscricao do
   begin
      qryInscricao.Close;
      qryInscricao.SQL.Clear;
      qryInscricao.SQL.Text := sSQL;
      qryInscricao.Open;

      qryItensImpressao.First;
      while not(qryItensImpressao.EOF) do
      begin
         if Arredonda(qryItensImpressaoVALOR.AsCurrency, 2) > 0 then
         begin
            dtmRelInscricao.qryInscricao.Insert;

            dtmRelInscricao.qryInscricaoIDINSCRICAOEMPTMO.AsFloat    := qryIDINSCRICAOEMPTMO.AsFloat;

            dtmRelInscricao.qryInscricaoDEVEDOR.AsString             := CompletaFim(qryBENEFICIARIO.AsString, ' ', 60);
            dtmRelInscricao.qryInscricaoPATRO.AsString               := CompletaFim(qryPATRO.AsString, ' ', 60);
            dtmRelInscricao.qryInscricaoMATRICULA.AsString           := CompletaFim(qryMATRICULA.AsString, ' ', 13);
            dtmRelInscricao.qryInscricaoINSCRICAONUMERO.AsInteger    := qryINSCRICAONUMERO.AsInteger;
            dtmRelInscricao.qryInscricaoDATASOLIC.AsDateTime         := qryDATAINSC.AsDateTime;
            dtmRelInscricao.qryInscricaoDATACREDITO.AsDateTime       := edtDataCredito.Date;
            dtmRelInscricao.qryInscricaoTAXAJUROS.AsCurrency         := edtPercentJuros.Value;
            dtmRelInscricao.qryInscricaoVALORSOLIC.AsCurrency        := qryVLRSOLIC.AsCurrency;
            dtmRelInscricao.qryInscricaoSALDOEPANTERIOR.AsCurrency   := edtSaldoAQuitar.Value;
            dtmRelInscricao.qryInscricaoVALORLIQUIDO.AsCurrency      := edtLiquidoGeral.Value;
            dtmRelInscricao.qryInscricaoNUMPARCELAS.AsInteger        := qryNUMPARCELAS.AsInteger;
            dtmRelInscricao.qryInscricaoVALORPARCELA.AsCurrency      := edtValorParcela.Value;

            dtmRelInscricao.qryInscricaoENDERECO.AsString            := CompletaFim(dtmLookEmptmo.qryLookEnderecoENDERECO.AsString, ' ', 88);
            dtmRelInscricao.qryInscricaoBAIRRO.AsString              := CompletaFim(dtmLookEmptmo.qryLookEnderecoBAIRRO.AsString, ' ', 30);
            dtmRelInscricao.qryInscricaoCIDADE.AsString              := CompletaFim(dtmLookEmptmo.qryLookEnderecoNOME_CIDADE.AsString, ' ', 30);
            dtmRelInscricao.qryInscricaoESTADO.AsString              := CompletaFim(dtmLookEmptmo.qryLookEnderecoCODESTADO.AsString, ' ', 3);
            dtmRelInscricao.qryInscricaoCEP.AsString                 := CompletaFim(dtmLookEmptmo.qryLookEnderecoCEP.AsString, ' ', 9);

            dtmRelInscricao.qryInscricaoCPF.AsString                 := CompletaFim(qryCPF.AsString, ' ', 14);
            dtmRelInscricao.qryInscricaoSIT_PART.AsString            := CompletaFim(qrySITUACAO.AsString, ' ', 60);

            dtmRelInscricao.qryInscricaoBANCO.AsString               := CompletaFim(dtmLookEmptmo.qryLookDadosBancariosBANCO.AsString, ' ', 60);
            dtmRelInscricao.qryInscricaoNUMAGENCIA.AsString          := CompletaFim(dtmLookEmptmo.qryLookDadosBancariosNUMAGENCIA.AsString, ' ', 15);
            dtmRelInscricao.qryInscricaoCONTA.AsString               := CompletaFim(dtmLookEmptmo.qryLookDadosBancariosCONTACORRENTE.AsString, ' ', 15);
            dtmRelInscricao.qryInscricaoTIPOCONTA.AsString           := dtmLookEmptmo.qryLookDadosBancariosTIPOCONTA.AsString;

            dtmRelInscricao.qryInscricaoDATAPRIMPARC.AsDateTime      := edtDataPrimParcela.Date;

            dtmRelInscricao.qryInscricaoITEM.AsString                := qryItensImpressaoITEM.AsString;
            dtmRelInscricao.qryInscricaoVLR_ITEM.AsCurrency          := qryItensImpressaoVALOR.AsCurrency;

            dtmRelInscricao.qryInscricao.Post;
         end;  // if Arredonda(qryItensConcessaoVALOR.AsCurrency, 2) > 0

         qryItensImpressao.Next;
      end;

      with dtmRelInscricao do
      begin
//SOL 114575
//       sArquivoTemp := Sistema.TempDir + 'APrevRelInscricao.tmp';
         sArquivoTemp := ftempregra + '\' + 'APrevRelInscricao.tmp';
//FIM
         rptInscricao.Template.SaveTo   := stFile;
         rptInscricao.Template.Format   := ftASCII;
         rptInscricao.Template.FileName := sArquivoTemp;
         rptInscricao.Template.SaveToFile;

         Repaint;

         frmImpressaoInscricao                := TfrmImpressaoInscricao.Create(Application);
         frmImpressaoInscricao.QryDados       := dtmRelInscricao.qryInscricao;
         frmImpressaoInscricao.sNomeRelat     := 'Inscricao';

         frmImpressaoInscricao.bbtnConfirmarClick(Self);
         frmImpressaoInscricao.bbtnSairClick(Self);

         DeleteFile(sArquivoTemp);
      end;  // with

      // Grava a data da impressão da inscrição

      if dtmEmptmo.qryParamEmptmoFLGCONTROLAINSC.AsInteger = 1 then begin
         LimpaParametros(qryUpdateInsc);
         qryUpdateInsc.ParamByName('PDATAENVIO').AsDateTime      := SysDate;
         qryUpdateInsc.ParamByName('PIDINSCRICAOEMPTMO').AsFloat := qryIDINSCRICAOEMPTMO.AsFloat;
         qryUpdateInsc.ExecSQL;
      end;

   end;
end;

procedure TfrmCadInscricao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
      UFuncoesEmptmo.bBuscaMutuario := false;
      // André Pontes - 22/06/2005
      // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
      dtmEmptmo.Regra.IDCalculo  := 0;
      // FIM André Pontes - 22/06/2005

      qryTipoContrato.Close;
      qryContratosAnteriores.Close;

      with dtmLookEmptmo do
      begin
         LimpaParametros(qryLookFormaRecPag);
         LimpaParametros(qryLookDadosBancarios);
         LimpaParametros(qryLookPortadorFormaP);
         LimpaParametros(qryLookPortadorFormaR);
      end;

      Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
      Fiario.Free;

   except

   end;

   inherited;
end;



//Pendência 24901 - 14/04/2007 - Alberto - Padrão 16
procedure TfrmCadInscricao.SetValorMargem(const Valor: Currency);
begin
   if qry.State in dsEditModes then
   begin
      qryVLRMARGEM.AsFloat := Valor;
      edtValMargem.Value   := Valor;
      //CalculaParcela;
   end;
end;



procedure TfrmCadInscricao.SetValorMaxPermit(const Valor: Currency);
begin
   if qry.State in dsEditModes then
   begin
      qryVLRMAXPERMIT.AsFloat := Valor;
   end;
end;
//Fim Pendência 24901



procedure TfrmCadInscricao.SetValorSolic(const Valor: Currency);
begin
   if qry.State in dsEditModes then
   begin
      qryVLRSOLIC.AsFloat := Valor;

      (* Procedure que Calcula o Valor da parcela, verificando também se é atendida
         a Regra de Limites e calculando o valor Líquido do Empréstimo *)

      // Thiago Melo SOL 183326 Kintana 1712188
      CalculaParcela(0);
      //
   end;
end;



procedure TfrmCadInscricao.DBspeParcelasEnter(Sender: TObject);
begin
   inherited;

           fParcelaAnt := DBspeParcelas.Value;

   Application.ProcessMessages;
end;



procedure TfrmCadInscricao.DBgrdDivEmpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadInscricao.DBgrdDivEmpTopRowChanged(Sender: TObject);
begin
   inherited;

   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadInscricao.btnIncluirQuitarClick(Sender: TObject);
var
   fSaldoQuitIni, fSaldoQuitFim : Currency;
   nRecno : TBookMark;
   dData                : TDateTime;
   rSaldo               : TSaldoDevAnt;
begin
   nRecno := qryContratosAnteriores.GetBookMark;
   if chkExcepcional.Checked then
   CalculaQuitacaoContratoAnterior;

   // André Pontes - 22/12/2003 - FUNCEF - verificando a TipoContr x TipoContr
   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and not(chkExcepcional.Checked) then
   begin
      if not(PermiteQuitacao(qryIDTIPOCONTREMPTMO.AsInteger,
                             qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger
                            )) then
      begin
         Exit;   
      end;
      // Marchetti - Pendencia 26614
      if TSpeedButton(Sender).Name = 'btnIncluirQuitar' then
         edtTotalParcelas.Value     := (edtTotalParcelas.Value  + qryContratosAnterioresVLRULTPARCELA.AsCurrency)
      else
         edtTotalParcelas.Value     := (edtTotalParcelas.Value  - qryContratosAnterioresVLRULTPARCELA.AsCurrency);
      // Fim Marchetti - Pendencia 26614
   end;


   // FIM André Pontes - 22/12/2003 - FUNCEF - verificando a TipoContr x TipoContr

   fSaldoQuitIni := edtSaldoaQuitar.Value;
   qryContratosAnteriores.GotoBookMark(nRecno);
   if (Sender is TSpeedButton) then
   begin
      // Procedimento que adiciona ou retira do Saldo a Quitar, o Valor do Saldo Atualizado (Vlr Quitação)
      VerificaQuitacao(Sender as TSpeedButton);
   end;

   // Marchetti - Pendencia 26614
   //BRUNO AZEVEDO SOL 158320 KINTANA 1279843
   //if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and not(chkExcepcional.Checked) then
   //begin
      if not CalculaValoresAposMarcarParaQuitacao then
      begin
         MsgDlg('Não foi possível atualizar os cálculos!', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
         Exit;
      end;
   //end;
   // Fim Marchetti - Pendencia 26614

   fSaldoQuitFim := edtSaldoaQuitar.Value;

   // se o saldo a quitar muda, recalcular tudo
   // NÃO VERIFICAR se (SaldoIni > 0) !!!

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      if (fSaldoQuitIni > 0) and (fSaldoQuitIni <> fSaldoQuitFim) then
      begin
         edtPercentJuros.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                          qryTipoContratoIDREGRAJURCONC.AsInteger,
                                                          0,                          (* É parcela 0 na Concessão *)
                                                          rNovoContrato.DataCredito,
                                                          0,                          (* Taxa de Juros Anterior é 0 na concessão *)
                                                          rNovoContrato.VlrContrato,  (* SaldoDev Anterior = Vlr Solic na concessão*)
                                                          False (* Mostra *),
                                                          rNovoContrato.Indexador
                                                          //Pendência 22836 - 03/10/2006 - Alberto
                                                         ,0, 0, 0
                                                         ,chkExcepcional.Checked
                                                          //Fim Pendência 22836
                                                         );

      edtTxJurosExibe.Value := 0;
      if not(qryTipoContratoIDREGRAJUREXIBE.isNULL) then
      begin
         edtTxJurosExibe.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                          qryTipoContratoIDREGRAJUREXIBE.AsInteger,
                                                          0,                          // É parcela 0 na Concessão
                                                          rNovoContrato.DataCredito,
                                                          0,                          // Taxa de Juros Anterior é 0 na concessão
                                                          rNovoContrato.VlrContrato,  // SaldoDev Anterior = Vlr Solic na concessão
                                                          False,                      // Mostra
                                                          rNovoContrato.Indexador
                                                          //Pendência 22836 - 03/10/2006 - Alberto
                                                         ,0, 0, 0
                                                         ,chkExcepcional.Checked
                                                          //Fim Pendência 22836
                                                         );
         end;
         edtTxJurosExibe.Visible := (edtTxJurosExibe.Value > 0);
      end;
   end;

   if (fSaldoQuitIni <> fSaldoQuitFim) then
   begin
      // Thiago Melo SOL 183326 Kintana 1712188
      CalculaParcela(0);
      //
   end;


   // SOL 123381 - Daniel Begnami
   if ( (TSpeedButton(Sender).Name = 'btnIncluirQuitar') and (b_btnIncluirQuitarClick)) then
   begin
     if (dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1) then
     begin
       //Marcio Sanches Spinosa SOL 205793 Kintana 1993062 - Inicio
        qryContratosAnteriores.Filtered := False;
        qryContratosAnteriores.Filter := 'FLGESCOLHA = 1';
        qryContratosAnteriores.Filtered := True;
        //Marcio Sanches Spinosa SOL 205793 Kintana 1993062 - Fim
        
        if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat, edtDataCredito.Date)) then
        begin

          if (qryContratosAnterioresFLGESCOLHA.asstring = '1') then
          begin
             dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat);
             rSaldo := CalcEmptmo.SaldoDevAnt(qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat, dData, -1, -1, False);
             if rSaldo.fSaldoDevAnt <> 0 then
             begin
                LogToFile('Crítica de atualização diária', sArq);
                MsgDlg('Contrato anterior não possui atualização diária para a Data do Crédito!', 'Empréstimo', mtWarning, [mbOk], 0);
                Repaint;
                bbtnCancelarClick(bbtnCancelar);
                Exit;
             end;
          end;


        end;
        qryContratosAnteriores.Filtered := False; //Marcio Sanches Spinosa SOL 205793 Kintana 1993062

     end;
   end;
   // FIM

   qryContratosAnteriores.FreeBookMark(nRecno);
   Self.SetTxJuros; // Jéssica Lana SOL 74994 KTN 523270
end;

// Procedimento que adiciona ou retira do Saldo a Quitar, o Valor do Saldo Atualizado (Vlr Quitação)
procedure TfrmCadInscricao.VerificaQuitacao(Sender: TSpeedButton);
var
   i,j, indice, iTotalNotNull, iTotalContratos : Integer;
   iRecno : TBookMark;
   bPertenceVetor, bPosicao : Boolean;
begin
   indice         := 0;
   bPosicao       := False;
   bPertenceVetor := False;

   if (Sender.Name = 'btnIncluirQuitar') or (Sender.Name = 'btnRetirarQuitar') then
   begin
      // Só faz se houver Contratos anteriores NÃO Quitados
      if not(qryContratosAnteriores.IsEmpty) then
      begin
         // Laço que varre o vetor que armazena o ID do Contrato que será quitado
         for i := 0 to High(vDividasAnteriores) do
         begin
            // Verifica se existe ID armazenado no elemento i do Vetor e se
            //   já foi encontrado a Posição vazia onde será armazenado o ID
            if ( (vDividasAnteriores[i] <= 0) and not(bPosicao) ) then
            begin
               // variável que quarda o índice do Vetor que será usado para armazenar o ID *)
               indice := i;

               // variável que armazena se foi encontrada ou não uma Posição vazia no Vetor *)
               bPosicao := True;
            end;

            // Verifica se o elemento i tem armazenado o ID do contrato selecionado
            //   pelo usuário no Grid de Dívidas Anteriores
            if vDividasAnteriores[i] = qryContratosAnterioresIDContratoEmptmo.AsFloat then
            begin
               // o ID do Contrato selecionado já pertence ao Vetor
               bPertenceVetor := True;

               // guarda a posição do vetor onde ele está armazenado
               indice := i;

               // Encontrado o elemento no vetor, deve sair do Laço(For)
               Break;
            end
            else
            begin
               // o ID do Contrato selecionado Não está armazenado no elemento
               //   i do Vetor
               bPertenceVetor := False;
            end;  // if vDividasAnteriores[i] = iIDContrato
         end;  // for i


         if ( (Sender.Name = 'btnIncluirQuitar') and not(qryContratosAnterioresFLGESCOLHA.AsInteger = 1) ) then
         begin
            (* usuário clicou no botão Incluir e o ID do contrato selecionado ainda Não pertence ao vetor *)
            if ( edtSaldoaQuitar.Value + qryContratosAnterioresVLRATUAL.AsFloat ) <= qryVLRMAXPERMIT.AsCurrency then
            begin
               // Armazena o ID na primeira posição vazia do vetor
               vDividasAnteriores[indice] := qryContratosAnterioresIDContratoEmptmo.AsFloat;
               qryContratosAnteriores.Edit;
               qryContratosAnterioresFLGESCOLHA.AsInteger := 1;
               qryContratosAnteriores.Post;

               // ----------------------------------------------------------------------------------
               // André Pontes - 12/12/2005 - pendência 20511
               if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
               begin
                  if qryContratosAnterioresVLRATUAL.AsFloat > 0 then
                  begin
                     edtSaldoAQuitar.Value  := edtSaldoaQuitar.Value + qryContratosAnterioresVLRATUAL.AsFloat;
                  end;
               end
               else
               begin
                  // Atualiza o Saldo a Quitar adicionando o Valor atualizado do Saldo Devedor do Contrato Selecionado
                  edtSaldoAQuitar.Value  := (edtSaldoaQuitar.Value + qryContratosAnterioresVLRATUAL.AsFloat);
               end;
               // FIM André Pontes - 12/12/2005 - pendência 20511
               // ----------------------------------------------------------------------------------

               // Incremento a variável Totalizadora de Contratos Quitados

               inc(iQtdEPQuitado);
            end
            else
            begin
               if qryVLRMAXPERMIT.AsCurrency <> 0 then
               begin
                  MsgDlg('O Saldo a Quitar não pode ultrapassar o Valor Máximo Permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                  Repaint;
               end;

               vDividasAnteriores[indice] := qryContratosAnterioresIDContratoEmptmo.AsFloat;

               qryContratosAnteriores.Edit;
               qryContratosAnterioresFLGESCOLHA.AsInteger := 1;
               qryContratosAnteriores.Post;

               // ----------------------------------------------------------------------------------
               // André Pontes - 12/12/2005 - pendência 20511
               if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
               begin
                  if (qryContratosAnterioresVLRATUAL.AsFloat > 0) then
                  begin
                     edtSaldoAQuitar.Value  := (edtSaldoaQuitar.Value + qryContratosAnterioresVLRATUAL.AsFloat);
                  end;
               end
               else
               begin
                  // Atualiza o Saldo a Quitar adicionando o Valor atualizado do Saldo Devedor do Contrato Selecionado
                  edtSaldoAQuitar.Value  := (edtSaldoaQuitar.Value + qryContratosAnterioresVLRATUAL.AsFloat);
               end;
               // FIM André Pontes - 12/12/2005 - pendência 20511
               // ----------------------------------------------------------------------------------

               // Incremento a variável Totalizadora de Contratos Quitados

               inc(iQtdEPQuitado);

               if qry.State in dsEditModes then qryVLRSOLIC.AsCurrency := edtSaldoAQuitar.Value;
            end;
         end;

         if ( (Sender.Name = 'btnRetirarQuitar') and (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) ) then
         begin
            // usuário clicou no botão Retirar e o ID do contrato selecionado PERTENCE ao vetor

            // Retira o ID, limpando a posição do vetor
            vDividasAnteriores[indice] := 0;
            qryContratosAnteriores.Edit;
            qryContratosAnterioresFLGESCOLHA.AsInteger := 0;
            qryContratosAnteriores.Post;

            // ----------------------------------------------------------------------------------
            // André Pontes - 12/12/2005 - pendência 20511
            if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
            begin
               if (qryContratosAnterioresVLRATUAL.AsFloat > 0) then
               begin
                  // Atualiza o Saldo a Quitar retirando o Valor atualizado do Saldo Devedor
                  //   do Contrato Selecionado
                  edtSaldoaQuitar.Value  := (edtSaldoaQuitar.Value - qryContratosAnterioresVLRATUAL.AsFloat);
               end;
            end
            else
            begin
               // Atualiza o Saldo a Quitar retirando o Valor atualizado do Saldo Devedor
               //   do Contrato Selecionado
               edtSaldoaQuitar.Value  := (edtSaldoaQuitar.Value - qryContratosAnterioresVLRATUAL.AsFloat);
            end;
            // FIM André Pontes - 12/12/2005 - pendência 20511
            // ----------------------------------------------------------------------------------


            // Decremento a variável Totalizadora de Contratos Quitados
            dec(iQtdEPQuitado);
         end;

         // armazena na variável a quantidade de contratos que não serão quitados, ou
         //   a quantidade de contratos anteriores que restarão para o participante
         iTotalContratos := (qryContratosAnteriores.RecordCount - iQtdEPQuitado);

         // adiciona 1(o contrato atual que está sendo realizado) a variável, resultando
         //   no total de contratos que o participante terá ao final desta operação
         iTotalContratos := iTotalContratos + 1;

         // verifica se o total de contratos que o participante terá ao final da operação
         //   não excede o total Máximo permitido por Tipo de Contrato.  Caso positivo
         //   validar o Contrato para gravação *)
         //Pendência 23429 - 28/09/2006 - Alberto
         if (iTotalContratos <= qryTipoContratoTCEMAXCONTRATO.AsInteger) then
         //Fim Pendência 23429
         begin
            bContratoValido := True;
         end
         else
         begin
            bContratoValido := False;
         end;  // if ( iTotalContratos <= qryTipoContratoTEPMAXCONTRATO.AsInteger )

         iTotalNotNull := 0;

         // Laço que varre o vetor e verifica quantos elementos NÃO são nulos *)
         for j := 0 to High(vDividasAnteriores) do
         begin
            if vDividasAnteriores[j] <> 0 then inc(iTotalNotNull);
         end;

         // -------------------------------------------------------------------------------------------
         // Habilitação dos botões "+" e "-"
         // -------------------------------------------------------------------------------------------

         // Todos os Contratos anteriores quitados
         if iTotalNotNull = qryContratosAnteriores.RecordCount then
         begin
            btnIncluirQuitar.Enabled := False;
            btnRetirarQuitar.Enabled := True;
         end;

         // Ainda há Contratos que podem ser quitados
         if (iTotalNotNull < qryContratosAnteriores.RecordCount) then
         begin
            btnIncluirQuitar.Enabled := True;
            btnRetirarQuitar.Enabled := True;
         end;

         // Nenhum Contrato anterior quitado
         if iTotalNotNull = 0 then
         begin
            btnIncluirQuitar.Enabled := True;
            btnRetirarQuitar.Enabled := False;
         end;
         // -------------------------------------------------------------------------------------------

      end;  // if not(qryContratosAnteriores.IsEmpty)
   end // End (Sender.Name = 'btnIncluirQuitar')
   else
   begin
      // Só faz se houver Contratos anteriores NÃO Quitados
      if not(qryOutrasDividas.IsEmpty) then
      begin
         if ( (Sender.Name = 'btnIncluirQuitarDividas') and not(qryOutrasDividasFLGESCOLHA.AsInteger = 1) ) then
         begin
            (* usuário clicou no botão Incluir e o ID do contrato selecionado ainda Não pertence ao vetor *)
            if ( edtSaldoaQuitar.Value + qryOutrasDividasVALORCALCULADO.AsFloat ) <= qryVLRMAXPERMIT.AsCurrency then
            begin
               // Armazena o ID na primeira posição vazia do vetor
               qryOutrasDividas.Edit;
               qryOutrasDividasFLGESCOLHA.AsInteger := 1;
               qryOutrasDividas.Post;

            end
            else
            begin
               if qryVLRMAXPERMIT.AsCurrency <> 0 then
               begin
                  MsgDlg('O Saldo a Quitar não pode ultrapassar o Valor Máximo Permitido!', 'Empréstimo', mtWarning, [mbOk], 0);
                  Repaint;
               end;

               qryOutrasDividas.Edit;
               qryOutrasDividasFLGESCOLHA.AsInteger := 1;
               qryOutrasDividas.Post;

            end;
         end;

         if ( (Sender.Name = 'btnRetirarQuitarDividas') and (qryOutrasDividasFLGESCOLHA.AsInteger = 1) ) then
         begin
            // usuário clicou no botão Retirar e o ID do contrato selecionado PERTENCE ao vetor

            // Retira o ID, limpando a posição do vetor

            qryOutrasDividas.Edit;
            qryOutrasDividasFLGESCOLHA.AsInteger := 0;
            qryOutrasDividas.Post;

         end;

         // -------------------------------------------------------------------------------------------
         // Habilitação dos botões "+" e "-"
         // -------------------------------------------------------------------------------------------

         iTotalNotNull := 0;

         fVlrTotalDividas := 0;

         qryOutrasDividas.DisableControls;

         iRecno := qryOutrasDividas.GetBookMark;

         qryOutrasDividas.First;
         while not(qryOutrasDividas.EOF) do
         begin
            if qryOutrasDividasFLGESCOLHA.AsInteger = 1 then
            begin
               inc(iTotalNotNull);
               fVlrTotalDividas := fVlrTotalDividas + qryOutrasDividasVALORCALCULADO.AsCurrency;
            end;
            qryOutrasDividas.Next;
         end;

         qryOutrasDividas.GotoBookMark(iRecno);
         qryOutrasDividas.FreeBookMark(iRecno);

         qryOutrasDividas.EnableControls;

         BuscaValorLiquidoEP;

         // -------------------------------------------------------------------------------------------
      end;
   end;
end;


procedure TfrmCadInscricao.CalculaEPAnterior;
var
   i         : Integer;
   SavePlace : TBookmark;
   iContador : Integer;
   //Pendência 26916 - 21/12/2007
   iQtdIDTIPOEMPTMO,
   iQtdIDTIPOCONTREMPTMO : Integer;
   //Fim Pendência 26916
begin
   // Procedure que Calcula o Valor da Quitação para Empréstimos Anteriores
   inherited;

   //Pendência 26916 - 21/12/2007
   //Pendência 23429 - 28/09/2006 - Alberto
   //btnIncluirQuitar.Visible   := qryTipoContratoTCEMAXCONTRATO.AsInteger > 1;
   //btnRetirarQuitar.Visible   := qryTipoContratoTCEMAXCONTRATO.AsInteger > 1;
   //Fim Pendência 23429
   //Fim Pendência 26916

   fVlrTotalAberto            := 0;
   edtSaldoaQuitar.Value      := 0;
   edtTotalParcelas.Value     := 0;
   edtTotalPendencias.Value   := 0;
   edtQuitacao.Value          := 0;
   edtQuitacaoDividas.Value   := 0;

   qryContratosAnteriores.First;

   // Guarda os beneficiários do seguro ------------------------------------------------------------
   if ( qryTipoContratoFLGOBRIGBENEF.AsInteger = 1 ) then
   begin
      if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
      begin
         LimpaParametros(qryBenefSeguro);
         qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryContratosAnterioresIDINSCRICAOEMPTMO.AsFloat;
         qryBenefSeguro.Open;
      end;

      iContador := 0;

      vListaContratoXBenefSeg  := nil;

      SetLength(vListaContratoXBenefSeg, qryBenefSeguro.RecordCount);
      qryBenefSeguro.First;
      while not(qryBenefSeguro.EOF) do
      begin
         vListaContratoXBenefSeg[iContador].IDBenefSeguro     := qryBenefSeguroIDBENEFSEGURO.AsInteger;
         vListaContratoXBenefSeg[iContador].IDInscricaoEmptmo := qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat;
         vListaContratoXBenefSeg[iContador].PercIndenizacao   := qryBenefSeguroPERCINDENIZACAO.AsFloat;

         inc(iContador);

         qryBenefSeguro.Next;
      end;

      qryBenefSeguro.First;
   end;
   // fim Guarda os beneficiários do seguro --------------------------------------------------------

   // Cálculo do valor atualizado dos contratos anteriores -----------------------------------------
   //Pendência 26916 - 21/12/2007
   // Calcula quantidade de contratos anteriores pelo tipo de empréstimo e
   // tipo de contrato de empréstimo selecionados e marca os obrigatoriamente
   // quitáveis
   iQtdIDTIPOEMPTMO      := 0;
   iQtdIDTIPOCONTREMPTMO := 0;

   qryContratosAnteriores.First;

   while not qryContratosAnteriores.EOF do
   begin

      SavePlace := qryContratosAnteriores.GetBookmark;

      CalculaQuitacaoContratoAnterior;

      if qryContratosAnterioresIDTIPOEMPTMO.AsInteger = qryTipoContratoIDTIPOEMPTMO.AsInteger then
         iQtdIDTIPOEMPTMO := iQtdIDTIPOEMPTMO + 1;

      if qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger = qryTipoContratoIDTIPOCONTREMPTMO.AsInteger then
         iQtdIDTIPOCONTREMPTMO := iQtdIDTIPOCONTREMPTMO + 1;

      if qryContratosAnterioresFLGOBRIGATORIO.AsInteger = 1 then
         qryContratosAnterioresFLGESCOLHA.AsInteger := 1;

      qryContratosAnteriores.GotoBookmark(SavePlace);

      if Sistema.TipoCliente <> 19991 then
      edtTotalParcelas.Value     := edtTotalParcelas.Value     + qryContratosAnterioresVLRPARCELA.AsCurrency;

      edtTotalPendencias.Value   := edtTotalPendencias.Value   + qryContratosAnterioresVLREMABERTO.AsCurrency;
      edtQuitacao.Value          := edtQuitacao.Value          + qryContratosAnterioresVLRATUAL.AsCurrency;

      qryContratosAnteriores.Next;

   end;

   qryContratosAnteriores.First;

   // Verifica se o contrato atual não ultrapassa o limite de contratos
   // permitidos para o tipo de contrato selecionado
   while not(qryContratosAnteriores.EOF) do
   begin

      SavePlace := qryContratosAnteriores.GetBookmark;

      //Pendência 26916 - 21/12/2007
      if ( qryTipoContratoTCEMAXCONTRATO.AsInteger <= iQtdIDTIPOCONTREMPTMO ) and
         ( qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger = qryTipoContratoIDTIPOCONTREMPTMO.AsInteger ) and
         ( qryContratosAnterioresFLGESCOLHA.AsInteger <> 1 ) then
      begin
         b_btnIncluirQuitarClick := False;    // SOL 123381 - Daniel Begnami
         btnIncluirQuitarClick(btnIncluirQuitar);
         b_btnIncluirQuitarClick := True;     // SOL 123381 - Daniel Begnami
         iQtdIDTIPOCONTREMPTMO := iQtdIDTIPOCONTREMPTMO - 1;
         iQtdIDTIPOEMPTMO      := iQtdIDTIPOEMPTMO - 1;
      end;

      qryContratosAnteriores.GotoBookmark(SavePlace);
      qryContratosAnteriores.Next;

   end;

   // Verifica se o contrato atual não ultrapassa o limite de contratos
   // permitidos para o tipo de empréstimo selecionado
   if ( qryTipoContratoTEPMAXCONTRATO.AsInteger <= iQtdIDTIPOEMPTMO ) then
   begin

      qryContratosAnteriores.First;

      while not(qryContratosAnteriores.EOF) do
      begin

         SavePlace := qryContratosAnteriores.GetBookmark;

         if ( qryTipoContratoTEPMAXCONTRATO.AsInteger <= iQtdIDTIPOEMPTMO ) and
            ( qryContratosAnterioresIDTIPOEMPTMO.AsInteger = qryTipoContratoIDTIPOEMPTMO.AsInteger ) and
            ( qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger <> qryTipoContratoIDTIPOCONTREMPTMO.AsInteger ) and
            ( qryContratosAnterioresFLGESCOLHA.AsInteger <> 1 ) then
         begin
            b_btnIncluirQuitarClick := False;    // SOL 123381 - Daniel Begnami
            btnIncluirQuitarClick(btnIncluirQuitar);
            b_btnIncluirQuitarClick := True;     // SOL 123381 - Daniel Begnami            
            iQtdIDTIPOEMPTMO := iQtdIDTIPOEMPTMO - 1;
         end;

         qryContratosAnteriores.GotoBookmark(SavePlace);

         qryContratosAnteriores.Next;

      end;

   end;
   //Fim Pendência 26916

   qryOutrasDividas.First;

   iTotSiafi := 0;

   while not(qryOutrasDividas.EOF) do
   begin
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger  = 1) and
         (qryOutrasDividasCODTIPO.AsInteger = 3) and
         (qryOutrasDividasNUMPARCELA.AsInteger > 0)  then
      begin
          Inc(iTotSiafi);
      end;
      qryOutrasDividas.Next;
   end;
end;



procedure TfrmCadInscricao.CalculaQuitacaoContratoAnterior;
var
   i           : Integer;
   SavePlace   : TBookmark;
begin
   LimpaRegistroContrato(rContratoAnterior);

   rContratoAnterior.IDContratoEmptmo  := qryContratosAnterioresIDCONTRATOEMPTMO.AsFloat;
   rContratoAnterior.IDInscricaoEmptmo := qryContratosAnterioresIDINSCRICAOEMPTMO.AsFloat;

   rContratoAnterior.NumParcelas       := qryContratosAnterioresNUMPARCELAS.AsInteger;

   rContratoAnterior.IDTipoContrEmptmo := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
   rContratoAnterior.FlgFormaRec       := qryContratosAnterioresFLGFORMAREC.AsString;
   rContratoAnterior.Indexador         := qryContratosAnterioresMOECODIGO.AsInteger;
   rContratoAnterior.SiglaIndexador    := qryContratosAnterioresMOESIGLA.AsString;
   rContratoAnterior.IDPessoa          := qryContratosAnterioresIDPESSOA.AsInteger;
   rContratoAnterior.IDBenef           := qryContratosAnterioresIDBENEF.AsInteger;
   rContratoAnterior.IDPlanoPrev       := qryContratosAnterioresIDPLANOPREV.AsInteger;
   rContratoAnterior.IDPatro           := qryContratosAnterioresIDPATRO.AsInteger;

   rContratoAnterior.IDSitPart         := qryIDSITPART.AsInteger;

   rContratoAnterior.DataCredito       := qryContratosAnterioresDATACREDITO.AsDateTime;
   rContratoAnterior.DataAssinatura    := qryContratosAnterioresDATAASSINATURA.AsDateTime;
   rContratoAnterior.DataPrimParc      := qryContratosAnterioresDATAPRIMPARC.AsDateTime;
   rContratoAnterior.IDTipoEmptmo      := qryContratosAnterioresIDTIPOEMPTMO.AsInteger;

   
     //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 18/12/2013 - INÍCIO
     rContratoAnterior.sFlagPerdaEfetiva := qryContratosAnteriores.FieldByName('FLGPERDAEFETIVA').AsInteger;
     //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - 18/12/2013 - FIM
   //Pendência 27232 - 16/04/2008
   //ExistemItensEmAberto(fVlrEmAberto);
   fVlrEmAberto := CalcEmptmo.ExistemItensEmAberto(
                   rContratoAnterior.IDContratoEmptmo,
                   False,
                   0,
                   True,
                   StrToInt(FormatDateTime('yyyy', rNovoContrato.DataInscricao)),
                   StrToInt(FormatDateTime('mm'  , rNovoContrato.DataInscricao)),
                   // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                   0);

   fVlrTotalAberto := (fVlrTotalAberto + fVlrEmAberto);
   // André Pontes - 22/08/2005
   // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
   dtmEmptmo.Regra.IDCalculo  := 0;
   // FIM André Pontes - 22/08/2005

   if CalcEmptmo.CalculaItensQuitacaoNOVA(rContratoAnterior,
                                          0,                       // Origem
                                          edtDataCredito.Date,
                                          -1,                      // André Pontes - 14/06/2004 - pendência 16984
                                          edtDataAssinatura.Date,
                                          vListaQuitacao,
                                          True,
                                          True,
                                          False,
                                          sArq
                                          //Pendência 22836 - 03/10/2006 - Alberto
                                         ,chkExcepcional.Checked
                                          //Fim Pendência 22836
                                         ) then
   begin
  // qryContratosAnteriores.Open;
      for i := 0 to High(vListaQuitacao) do
      begin
         if vListaQuitacao[i].FlgCentraliza = 1 then
         begin
            SavePlace := qryContratosAnteriores.GetBookmark;

            qryContratosAnteriores.Edit;
            qryContratosAnterioresVLRATUAL.AsCurrency    := vListaQuitacao[i].Valor;
            qryContratosAnteriores.Post;
            qryContratosAnteriores.GotoBookmark(SavePlace);
         end;
         if vListaQuitacao[i].CodigoItem = dtmEmptmo.qryParamEmptmoIDITEMDEVSEGQUIT.AsInteger then
         begin
            SavePlace := qryContratosAnteriores.GetBookmark;

            qryContratosAnteriores.Edit;
            qryContratosAnterioresVLRDEVSEG.AsCurrency    := vListaQuitacao[i].Valor;
            qryContratosAnteriores.Post;
            qryContratosAnteriores.GotoBookmark(SavePlace);
         end;

      end;  // for

   end;  // if CalculaItensQuitacao
end;


procedure TfrmCadInscricao.CmeCadastroDelete(Sender: TObject);
begin
   try
      try
         // ----------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Exclusão da Inscrição nº ' + FormatFloat('#0', qryIDINSCRICAOEMPTMO.AsFloat))) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // ----------------------------------------------------------------------------------------

         // Delete na query
         inherited;

      except
         Raise;
         Repaint;
      end;

   finally
      (* Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados *)
      AcertaEdits;
   end;
end;



procedure TfrmCadInscricao.DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadInscricao.DBgrdItensConcessaoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadInscricao.DBedtValorSolicEnter(Sender: TObject);
begin
   inherited;

   fVlrAnterior := qryVLRSOLIC.AsCurrency;

   Application.ProcessMessages;
end;



procedure TfrmCadInscricao.DBrdgCreditoExit(Sender: TObject);
begin
   inherited;

   if qryFLGFORMAPAG.AsString <> sFormaCredAnt then
   begin
      AcertaDatas;

      // dispara o recálculo
      edtDataCredito.Modified := True;
      edtDataCreditoExit(self);

      if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
      begin
         LimpaParametros(qryBenefSeguro);
         if not(dtsContratoAnteriores.DataSet.IsEmpty) then
         begin
            qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryContratosAnterioresIDINSCRICAOEMPTMO.AsFloat;
         end
         else
         begin
            qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
         end;
         qryBenefSeguro.Open;
      end;  // if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) )


      MsgDlg('Favor verificar a Data de Crédito.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmCadInscricao.DBrdgDebitoExit(Sender: TObject);
begin
   inherited;

   AcertaDataPrimParcela;

   if ( (qryBenefSeguro.Active) and not(qryBenefSeguro.UpdatesPending) ) then
   begin
      LimpaParametros(qryBenefSeguro);
      if not(dtsContratoAnteriores.DataSet.IsEmpty) then
      begin
         qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryContratosAnterioresIDINSCRICAOEMPTMO.AsFloat;
      end
      else
      begin
         qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDInscricaoEmptmo.AsFloat;
      end;
      qryBenefSeguro.Open;
   end;
end;



function TfrmCadInscricao.AtualizaSaldoVerba(bAtualiza : Boolean) : Boolean;
var
   iVerba      : Int64;
   fSaldo      : Currency;
   ObjetoVerba : TObjetoVerba;
begin
   Result := True;

   fSaldo := 0;

   if dtmEmptmo.qryParamEmptmoFLGVERBAUNICA.AsInteger = 1 then
   begin
      iVerba := CalcEmptmo.AtualizarSaldo(qryIDPESSOA.AsInteger, Sistema.IDEmpresa, qryIDPATRO.AsInteger,
                                          qryIDTIPOEMPTMO.AsInteger, qryVLRSOLIC.AsFloat,
                                          bAtualiza (* Atualiza o Saldo *), fSaldo);
      case iVerba of
          -2: (* não usa verba *)
         begin end;
          -1:  (* verba não cadastrada *)
         begin
            Result := False;
            MsgDlg('Não foi localizado saldo disponível para o valor solicitado.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
         end;
          else
         begin
            (* verificação do Saldo entra aqui *)
            if fSaldo < qryVLRSOLIC.AsCurrency then
            begin
               Result := False;
               MsgDlg('Não existe saldo disponível para o valor solicitado.', 'Empréstimo', mtWarning, [mbOk], 0);
               Repaint;
            end;
          end;
       end;
   end
   else
   begin
       LimpaParametros(qryEndereco);
       qryEndereco.ParamByName('PIDPESSOA').AsInteger := qryIDBENEF.AsInteger;
       qryEndereco.Open;

       if not(qryEndereco.IsEmpty) then
      begin
          fSaldo := ObjetoVerba.RetornaValorDisponivel(qryIDPLANOPREV.AsInteger,
                                                       qryIDTIPOCONTREMPTMO.AsInteger,
                                                       qryEnderecoCODESTADO.AsString);

          if fSaldo < qryVLRSOLIC.AsCurrency then
         begin
             Result := False;
             MsgDlg('Não existe saldo disponível para o valor solicitado.', 'Empréstimo', mtWarning, [mbOk], 0);
             Repaint;
             Exit;
          end;

          if bAtualiza then
         begin
             ObjetoVerba.UtilizaValorUnidade(qryIDPLANOPREV.AsInteger,
                                             qryIDTIPOCONTREMPTMO.AsInteger,
                                             ObjetoVerba.RetornaUnidadeParticipante(qryEnderecoCODESTADO.AsString),
                                             qryVLRSOLIC.AsCurrency);
          end;

       end
      else
      begin
          Result := False;
          MsgDlg('O endereço do participante está incompleto. Não foi possível buscar a verba disponível!.', 'Empréstimo', mtWarning, [mbOk], 0);
          Repaint;
       end;

       qryEndereco.Close;
   end;
end;



procedure TfrmCadInscricao.qryAfterOpen(DataSet: TDataSet);
begin
   inherited;

   LimpaParametros(qryAvalista);
   qryAvalista.ParamByName('IDINSCRICAOEMPTMO').AsFloat    := qryIDINSCRICAOEMPTMO.AsFloat;
   qryAvalista.Open;

   LimpaParametros(qryBenefSeguro);
   qryBenefSeguro.ParamByName('IDINSCRICAOEMPTMO').AsFloat := qryIDINSCRICAOEMPTMO.AsFloat;
   qryBenefSeguro.Open;
end;



procedure TfrmCadInscricao.dsStateChange(Sender: TObject);
begin
   inherited;

   sbtnNovoAval.Enabled    := ds.State in [dsEdit, dsInsert];
   sbtnInsAval.Enabled     := ds.State in [dsEdit, dsInsert];
   sbtnExcluiAval.Enabled  := ds.State in [dsEdit, dsInsert];
   sbtnNovoBenef.Enabled   := ds.State in [dsEdit, dsInsert];
   sbtnInsereBenef.Enabled := ds.State in [dsEdit, dsInsert];
   sbtnAlteraBenef.Enabled := ds.State in [dsEdit, dsInsert];
   sbtnExcluiBenef.Enabled := ds.State in [dsEdit, dsInsert];

   if qry.State in dsEditModes then
   begin
      qryVLRSALBASE.AsCurrency   := fVlrSalBase;
      qryVLRMARGEM.AsCurrency    := fVlrMargem;
      qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
      edtLimiteDisp.Value        := qryVLRMAXPERMIT.AsCurrency - edtSaldoAQuitar.Value - fVlrTotalDividas;
   end;
end;



(* Avalistas *)

procedure TfrmCadInscricao.sbtnExcluiAvalClick(Sender: TObject);
begin
  inherited;
   if MsgDlg('Confirma a exclusão deste avalista?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      qryAvalista.Delete;
   sbtnExcluiAval.Down := False;
end;



procedure TfrmCadInscricao.sbtnInsAvalClick(Sender: TObject);
var
   fMargemAvalista : Currency;
   fSalPart        : Currency;
   fSalMant        : Currency;
   fSalAuxilio     : Currency;
   fSalBeneficio   : Currency;

   fSalarioAvalista : Currency;

begin
   inherited;
   // Marchetti - Pendencia 26402
   if Sistema.TipoCliente <> 20071 then
   begin
      if qryAvalista.RecordCount = 2 then
      begin
         sbtnInsAval.Down := False;
         MsgDlg('Número máximo de Avalistas já atingido.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

      dtmMS.MS_Fiador.Executar;
      if dtmMS.MS_Fiador.RetornouValor then
      begin
         Repaint;

         if qryAvalista.Locate('IDAVALISTA',StrToInt(dtmMS.MS_Fiador.ValoresChave[0]),[loCaseInsensitive]) then
         begin
            sbtnInsAval.Down := False;
            MsgDlg('Avalista já cadastrado.', 'Empréstimo', mtWarning, [mbOk], 0);
            Exit;
         end;

         if dtmMS.MS_Fiador.ValoresChave[4] = '' then
         begin
            sbtnInsAval.Down := False;
            MsgDlg('Avalista sem Renda Comprovada cadastrada.', 'Empréstimo', mtWarning, [mbOk], 0);
            Exit;
         end;

         qryAvalista.Insert;
         qryAvalistaIDINSCRICAOEMPTMO.AsFloat   := qryIDInscricaoEmptmo.AsFloat;
         qryAvalistaIDAVALISTA.AsInteger        := StrToInt(dtmMS.MS_Fiador.ValoresChave[0]);
         qryAvalistaNOME.AsString               := dtmMS.MS_Fiador.ValoresChave[1];
         qryAvalistaRENDACOMP.AsString          := dtmMS.MS_Fiador.ValoresChave[4];
         qryAvalistaMARGEMCONSIG.AsString       := dtmMS.MS_Fiador.ValoresChave[5];
         qryAvalista.Post;
      end;
   end
   else
   begin

      if qryAvalista.RecordCount = 1 then
      begin
         sbtnInsAval.Down := False;
         MsgDlg('Número máximo de Avalistas já atingido.', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

      dtmMS.MS_Solicitante.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      if dtmMS.MS_Solicitante.RetornouValor then
      begin
         Repaint;

         if StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]) = qryIDBENEF.AsInteger then
         begin
            sbtnInsAval.Down := False;
            MsgDlg('Avalista não pode ser o mutuário solicitante do Empréstimo.', 'Empréstimo', mtWarning, [mbOk], 0);
            Exit;
         end;

         if qryAvalista.Locate('IDAVALISTA',StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]),[loCaseInsensitive]) then
         begin
            sbtnInsAval.Down := False;
            MsgDlg('Avalista já cadastrado.', 'Empréstimo', mtWarning, [mbOk], 0);
            Exit;
         end;

         if not(qryTipoContratoIDREGRASALBAS.IsNull) then
         begin
            fSalarioAvalista := CalcEmptmo.BuscaSalarioBase(qryTipoContratoIDREGRASALBAS.AsInteger,
                                                            StrToInt(dtmMS.MS_Solicitante.ValoresChave[1]),
                                                            StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]),
                                                            fSalParticipacao,
                                                            fSalMantido,
                                                            fSalAuxDoenca,
                                                            fSalBenef,
                                                            True,
                                                            qryDATAINSC.AsDateTime,
                                                            //Fanuel Junior SOL151964 Kintana1124438
                                                            qryIDTIPOCONTREMPTMO.AsInteger
                                                            //Pendência 22836 - 03/10/2006 - Alberto
                                                           ,0
                                                           ,chkExcepcional.Checked
                                                            //Fim Pendência 22836
                                                           ,qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 153259 KINTANA 1152177
                                                           );
            if fSalarioAvalista = -1 then
            begin
               sbtnInsAval.Down := False;
               MsgDlg('Não foi possível recuperar o salário do Avalista.', 'Empréstimo', mtWarning, [mbOk], 0);
               Exit;
            end;
         end;

         fMargemAvalista := 0;
         if not qryTipoContratoIDREGRAMARGEMAVAL.IsNull then
         begin
            fMargemAvalista := CalcEmptmo.BuscaMargem(StrToInt(dtmMS.MS_Solicitante.ValoresChave[1]),
                                                      StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]),
                                                      qryTipoContratoIDREGRAMARGEMAVAL.AsInteger,
                                                      fSalarioAvalista,
                                                      edtTotalParcelas.Value,
                                                      edtTotalPendencias.Value,
                                                      fSalPart,
                                                      fSalMant,
                                                      fSalAuxilio,
                                                      fSalBeneficio,
                                                      True,
                                                      qryDATAINSC.AsDateTime,
                                                      qryNUMPARCELAS.AsInteger,

                                                      vDividasAnteriores,
                                                      
                                                      chkFinanciamento.Checked,
                                                      0,
                                                      chkExcepcional.Checked,
                                                      DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                      edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                      0, // Ádler Souza - SOL 75516 Kintana 523281
                                                      -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                      qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                     );
         end;

         if fMargemAvalista = 0 then
         begin
            sbtnInsAval.Down := False;
            MsgDlg('Avalista sem margem consignável.', 'Empréstimo', mtWarning, [mbOk], 0);
            Exit;
         end;

         if not qryTipoContratoIDREGRAELEGAVAL.IsNull then
         begin
            if not(CalcEmptmo.VerificaElegibilidade(StrToInt(dtmMS.MS_Solicitante.ValoresChave[1]), // Titular
                                                    StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]),  // Mutuário
                                                    qryTipoContratoIDREGRAELEGAVAL.AsInteger,
                                                    StrToInt(dtmMS.MS_Solicitante.ValoresChave[12]),
                                                    qryTipoContratoTCEMINRENOVA.AsInteger,
                                                    0,
                                                    dDataFinalBeneficio,
                                                    True,
                                                    chkExcepcional.Checked
                                                   )) then
            begin
               sbtnInsAval.Down := False;
               MsgDlg('Avalista não é elegível.', 'Empréstimo', mtWarning, [mbOk], 0);
               Exit;
            end;
         end;

         LimpaParametros(qryInsereAvalista);
         qryInsereAvalista.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
         qryInsereAvalista.Open;

         if qryInsereAvalista.IsEmpty then
         begin
            qryInsereAvalista.Insert;
            qryInsereAvalistaIDAVALISTA.AsInteger    := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
            qryInsereAvalistaNOME.AsString           := dtmMS.MS_Solicitante.ValoresChave[2];
            qryInsereAvalistaRENDACOMP.AsCurrency    := fSalarioAvalista;
            qryInsereAvalistaMARGEMCONSIG.AsCurrency := fMargemAvalista;
            qryInsereAvalista.Post;
         end;

         qryAvalista.Insert;
         qryAvalistaIDINSCRICAOEMPTMO.AsFloat   := qryIDInscricaoEmptmo.AsFloat;
         qryAvalistaIDAVALISTA.AsInteger        := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
         qryAvalistaNOME.AsString               := dtmMS.MS_Solicitante.ValoresChave[2];
         qryAvalistaRENDACOMP.AsString          := FloatToStr(fSalarioAvalista);
         qryAvalistaMARGEMCONSIG.AsString       := FloatToStr(fMargemAvalista);
         qryAvalista.Post;
      end;
   end;
   // Fim Marchetti - Pendencia 26402

   sbtnInsAval.Down := False;
end;



procedure TfrmCadInscricao.sbtnNovoAvalClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmPessoaFiador, TfrmPessoaFiador, False);
   sbtnNovoAval.Down := False;
end;



procedure TfrmCadInscricao.qryAvalistaBeforeClose(DataSet: TDataSet);
begin
  inherited;
  if qryAvalista.UpdatesPending then
  begin
     qryAvalista.ApplyUpdates;
     qryAvalista.CommitUpdates;
  end;
end;



(* Beneficiários *)
procedure TfrmCadInscricao.sbtnNovoBenefClick(Sender: TObject);
var
   iTotal : Real;
begin
   inherited;

   sbtnNovoBenef.Down := False;

   iTotal := 0;

   Application.CreateForm(TfrmCadBenefSeguro, frmCadBenefSeguro);

   frmCadBenefSeguro.TipoOperacao      := toInclui;
   frmCadBenefSeguro.IDTitular         := qryIDPESSOA.AsInteger;
   frmCadBenefSeguro.IDMutuario        := qryIDBENEF.AsInteger;
   frmCadBenefSeguro.NomeMutuario      := DBedtBeneficiario.Text;
   frmCadBenefSeguro.IDInscricaoEmptmo := qryIDINSCRICAOEMPTMO.AsFloat;
   frmCadBenefSeguro.ShowModal;

   qryBenefSeguro.First;
   while not(qryBenefSeguro.EOF) do
   begin
      iTotal := iTotal + qryBenefSeguroPERCINDENIZACAO.AsFloat;

      if qryBenefSeguroNOME.AsString = frmCadBenefSeguro.NomeBeneficiario then
      begin
         MsgDlg('Beneficiário já cadastrado para essa inscrição', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

      if (iTotal + frmCadBenefSeguro.Percentual) > 100 then
      begin
         MsgDlg('Total de Percentual ultrapassa os 100%', 'Empréstimo', mtWarning, [mbOk], 0);
         Exit;
      end;

      qryBenefSeguro.Next;
   end;


   qryBenefSeguro.Insert;
   qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := qryIDInscricaoEmptmo.AsFloat;
   qryBenefSeguroIDBENEFSEGURO.AsInteger     := frmCadBenefSeguro.IDBenefSeguro;
   qryBenefSeguroNOME.AsString               := frmCadBenefSeguro.NomeBeneficiario;
   qryBenefSeguroPERCINDENIZACAO.AsFloat     := frmCadBenefSeguro.Percentual;
   qryBenefSeguroNUMBANCO.AsFloat            := frmCadBenefSeguro.CodBanco;
   qryBenefSeguroCODAGENCIA.AsString         := frmCadBenefSeguro.Agencia;
   qryBenefSeguroCONTACORRENTE.ASString      := frmCadBenefSeguro.ContaCorrente;
   qryBenefSeguroOBS.AsString                := frmCadBenefSeguro.Observacao;
   qryBenefSeguro.Post;

   frmCadInscricao.WindowState := wsMaximized;
   Repaint;
   Application.ProcessMessages;

end;



procedure TfrmCadInscricao.sbtnExcluiBenefClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('Confirma a exclusão deste Beneficiário?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
   begin
      qryBenefSeguro.Delete;
      qryBenefSeguro.ApplyUpdates;
      qryBenefSeguro.CommitUpdates;
   end;

   sbtnExcluiBenef.Down := False;
end;



procedure TfrmCadInscricao.qryBenefSeguroBeforeClose(DataSet: TDataSet);
begin
   inherited;
   if qryBenefSeguro.UpdatesPending then
   begin
      qryBenefSeguro.ApplyUpdates;
      qryBenefSeguro.CommitUpdates;
   end;
end;



procedure TfrmCadInscricao.sbtnInsereBenefClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Beneficiario.Executar;

   if dtmMS.MS_Beneficiario.RetornouValor then
   begin
      Repaint;

      qryBenefSeguro.Insert;
      qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := qryIDInscricaoEmptmo.AsFloat;
      qryBenefSeguroIDBENEFSEGURO.AsInteger     := StrToInt(dtmMS.MS_Beneficiario.ValoresChave[0]);
      qryBenefSeguroNOME.AsString               := dtmMS.MS_Beneficiario.ValoresChave[1];
      qryBenefSeguroPERCINDENIZACAO.AsFloat     := 0;

      dbEdtPercIndeniz.SetFocus;
   end;
end;



procedure TfrmCadInscricao.bbtnOkDetBenefClick(Sender: TObject);
var
    Recno : TBookMark;
    fPerc : Real;
    dsEstado   : TDataSetState;
    iInscricao : Extended;
    iBenef     : LongInt;
    sNome      : string;
begin
   inherited;

   dsEstado   := qryBenefSeguro.State;
   iBenef     := qryBenefSeguroIDBENEFSEGURO.AsInteger;
   iInscricao := qryIDINSCRICAOEMPTMO.AsFloat;
   fPerc      := qryBenefSeguroPERCINDENIZACAO.AsFloat;
   sNome      := qryBenefSeguroNOME.AsString;

   if dsEstado = dsInsert then
   begin
      qryBenefSeguro.Cancel;
      if (qryBenefSeguro.Locate('IDBENEFSEGURO',iBenef,[loCaseInsensitive])) then
      begin
         MsgDlg('Beneficiário Já cadastrado.', 'Empréstimo', mtError, [mbOk], 0);
         qryBenefSeguro.RevertRecord;
         bbtnCancelarDetBenefClick(Self);
         Exit;
      end;
   end;

   if dsEstado = dsInsert then
   begin
      qryBenefSeguro.Insert;
      qryBenefSeguroIDBENEFSEGURO.AsInteger     := iBenef;
      qryBenefSeguroIDINSCRICAOEMPTMO.AsFloat   := iInscricao;
      qryBenefSeguroPERCINDENIZACAO.AsFloat     := fPerc;
      qryBenefSeguroNOME.AsString               := sNome;
   end;

   qryBenefSeguro.Post;

   if qryBenefSeguroIDBENEFSEGURO.AsInteger = qryIDPESSOA.AsInteger then
   begin
      MsgDlg('Beneficiário do seguro não pode ser o solicitante do Empréstimo.', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   if qryBenefSeguroPERCINDENIZACAO.AsFloat = 0 then
   begin
      MsgDlg('Percentual de Indenização não pode ser igual a 0 (zero).', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;

   if qryBenefSeguroPERCINDENIZACAO.AsFloat < 0 then
   begin
      MsgDlg('Percentual de Indenização não pode ser negativo.', 'Empréstimo', mtError, [mbOk], 0);
      qryBenefSeguro.RevertRecord;
      sbtnAlteraBenefClick(Self);
      Exit;
   end;
   Recno := qryBenefSeguro.GetBookmark;
   qryBenefSeguro.DisableControls;
   qryBenefSeguro.First;

   fPerc := 0;

   while not(qryBenefSeguro.EOF) do
   begin
      fPerc := fPerc + qryBenefSeguroPERCINDENIZACAO.AsFloat;
      qryBenefSeguro.Next;
   end;

   qryBenefSeguro.GotoBookmark(Recno);
   qryBenefSeguro.FreeBookmark(Recno);

   qryBenefSeguro.EnableControls;

   if ( fPerc < 100 ) then
   begin
      MsgDlg('ATENÇÃO: Somatório de Percentuais de Indenização ainda não atingiu 100%', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
   end;

   if ( fPerc > 100 ) then
   begin
      MsgDlg('Somatório de Percentuais de Indenização ultrapassa a 100%', 'Empréstimo', mtError, [mbOk], 0);
      sbtnAlteraBenefClick(Self);
   end;
end;



procedure TfrmCadInscricao.bbtnCancelarDetBenefClick(Sender: TObject);
begin
   inherited;
   qryBenefSeguro.Cancel;
end;



procedure TfrmCadInscricao.sbtnAlteraBenefClick(Sender: TObject);
var
   iTotal : Real;
begin
   inherited;

   Application.CreateForm(TfrmCadBenefSeguro, frmCadBenefSeguro);

   frmCadBenefSeguro.TipoOperacao      := toAltera;
   frmCadBenefSeguro.IDMutuario        := qryIDBENEF.AsInteger;
   frmCadBenefSeguro.NomeMutuario      := DBedtBeneficiario.Text;
   frmCadBenefSeguro.IDInscricaoEmptmo := qryIDINSCRICAOEMPTMO.AsFloat;
   frmCadBenefSeguro.IDBenefSeguro     := qryBenefSeguroIDBENEFSEGURO.AsInteger;
   frmCadBenefSeguro.NomeBeneficiario  := qryBenefSeguroNOME.AsString;
   frmCadBenefSeguro.CodBanco          := qryBenefSeguroNUMBANCO.AsInteger;
   frmCadBenefSeguro.Agencia           := qryBenefSeguroCODAGENCIA.AsString;
   frmCadBenefSeguro.ContaCorrente     := qryBenefSeguroCONTACORRENTE.AsString;
   frmCadBenefSeguro.Observacao        := qryBenefSeguroOBS.AsString;
   frmCadBenefSeguro.Percentual        := qryBenefSeguroPERCINDENIZACAO.ASFloat;

   frmCadBenefSeguro.ShowModal;

   qryBenefSeguro.First;
   iTotal := 0;

   while not(qryBenefSeguro.EOF) do
   begin
      if qryBenefSeguroNOME.AsString <> frmCadBenefSeguro.NomeBeneficiario then
         iTotal := iTotal + qryBenefSeguroPERCINDENIZACAO.AsFloat;

      if (iTotal + frmCadBenefSeguro.Percentual) > 100 then
      begin
         MsgDlg('Total de Percentual ultrapassa os 100%', 'Empréstimo', mtError, [mbOk], 0);
         Exit;
      end;

      qryBenefSeguro.Next;
   end;

   qryBenefSeguro.Edit;
   qryBenefSeguroNOME.AsString               := frmCadBenefSeguro.NomeBeneficiario;
   qryBenefSeguroPERCINDENIZACAO.AsFloat     := frmCadBenefSeguro.Percentual;
   qryBenefSeguroNUMBANCO.AsFloat            := frmCadBenefSeguro.CodBanco;
   qryBenefSeguroCODAGENCIA.AsString         := frmCadBenefSeguro.Agencia;
   qryBenefSeguroCONTACORRENTE.ASString      := frmCadBenefSeguro.ContaCorrente;
   qryBenefSeguroOBS.AsString                := frmCadBenefSeguro.Observacao;
   qryBenefSeguro.Post;

   frmCadInscricao.WindowState := wsMaximized;
   Repaint;
   Application.ProcessMessages;

end;



procedure TfrmCadInscricao.dsBenefSeguroStateChange(Sender: TObject);
begin
   inherited;
   bbtnOkDetBenef.Enabled       := dsBenefSeguro.State in [dsEdit, dsInsert];
   bbtnCancelarDetBenef.Enabled := dsBenefSeguro.State in [dsEdit, dsInsert];
   sbtnInsereBenef.Down         := dsBenefSeguro.State = dsInsert;
   sbtnAlteraBenef.Down         := dsBenefSeguro.State = dsEdit;
end;


//Pendência 27232 - 16/04/2008
//Função desabilitada - Passa a utilizar a de mesmo nome na unit uCalcEmptmo
{function  TfrmCadInscricao.ExistemItensEmAberto(var fVlrEmAberto: Currency) : Boolean;
var
   sAno, sMes        : String;
   iAno, iMes, iDia  : Word;
begin
   Result := False;

   DecodeDate(rNovoContrato.DataInscricao, iAno, iMes, iDia);

   sAno := FormatFloat('0000',iAno);
   sMes := FormatFloat('00', iMes);

   fVlrEmAberto := 0;

   try
      with qryItensEmAberto do
      begin
         LimpaParametros(qryItensEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat  := rContratoAnterior.IDContratoEmptmo;
         ParamByName('PANOMESCOBRANCA').AsString   := sAno + sMes;
         Open;

         if not(IsEmpty) then
         begin
            Result := True;
            while not(EOF) do
            begin
               fVlrEmAberto := fVlrEmAberto + FieldByName('HMEVLRPREVISTO').AsCurrency;
               Next;
            end;
         end;
      end;

   finally
      qryItensEmAberto.Close;
   end
end;}



procedure TfrmCadInscricao.btnAlteraSalarioBaseClick(Sender: TObject);
begin
   inherited;

   DBEdtSalarioBase.Enabled   := True;
   DBEdtSalarioBase.ReadOnly  := False;
   DBEdtSalarioBase.Color     := clWindow;
   fSalario                   := qryVLRSALBASE.AsCurrency;

   DBEdtSalarioBase.SetFocus;
end;



procedure TfrmCadInscricao.DBEdtSalarioBaseExit(Sender: TObject);
begin
   inherited;

   DBedtSalarioBase.ReadOnly  := True;
   DBedtSalarioBase.Color     := clBtnFace;

   if (ActiveControl = bbtnCancelar) then Exit;

   if fVlrSalarioAnt <> qryVLRSALBASE.AsCurrency then
   begin
      fVlrSalBase    := qryVLRSALBASE.AsCurrency;
      bTrocouSalario := (fSalario <> qryVLRSALBASE.AsCurrency);

      if not(bTrocouMargem) then
      begin
         edtValMargem.Value   := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                        qryIDBENEF.AsInteger,
                                                        qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                        fVlrSalBase,
                                                        edtTotalParcelas.Value,
                                                        edtTotalPendencias.Value,
                                                        fSalParticipacao,
                                                        fSalMantido,
                                                        fSalAuxDoenca,
                                                        fSalBenef,
                                                        True,
                                                        qryDATAINSC.AsDateTime,
                                                        //Pendência 22248 - 03/08/2006 - Alberto
                                                        //qryNUMPARCELAS.AsInteger
                                                        trunc(DBspeParcelas.Value),

                                                        vDividasAnteriores,
                                                        
                                                        chkFinanciamento.Checked
                                                        //Fim Pendência 22248
                                                        //Pendência 22836 - 03/10/2006 - Alberto
                                                       ,0
                                                       ,chkExcepcional.Checked,
                                                        //Fim Pendência 22836
                                                       DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                       edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                       0, // Ádler Souza - SOL 75516 Kintana 523281
                                                       -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                       qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                       );

         // Marchetti - Pendencia 26402
         if (rdgMargemAlt.Visible) and (not qryTipoContratoIDREGRAMARGEMALT.IsNull) then
         begin
            edtValMargemAlt.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                            qryIDBENEF.AsInteger,
                                                            qryTipoContratoIDREGRAMARGEMALT.AsInteger,
                                                            fVlrSalBase,
                                                            edtTotalParcelas.Value,
                                                            edtTotalPendencias.Value,
                                                            fSalParticipacao,
                                                            fSalMantido,
                                                            fSalAuxDoenca,
                                                            fSalBenef,
                                                            True,
                                                            qryDATAINSC.AsDateTime,
                                                            qryNUMPARCELAS.AsInteger,

                                                            vDividasAnteriores,
                                                            
                                                            chkFinanciamento.Checked,
                                                            //Pendência 22836 - 03/10/2006 - Alberto
                                                            0,
                                                            chkExcepcional.Checked,
                                                            //Fim Pendência 22836
                                                            DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                            edtDataCredito.Text, //Ádler Souza - SOL 131189 Kintana 744558
                                                            0, // Ádler Souza - SOL 75516 Kintana 523281
                                                            -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                            qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                           );
         end;
         // Fim Marchetti - Pendencia 26402

      end;  // if not(bTrocouMargem)

// Marchetti - Pendencia 26614
      fVlrMargem := edtValMargem.Value;
// Fim Marchetti - Pendencia 26614

      // Ádler Souza  - SOL 144704 - KTN 968693
      {if fVlrMargem = -1 then
      begin
         Screen.Cursor := crDefault;
         EscondeEspera;
         MsgDlg('Não foi possível recuperar o valor da margem consignável.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         bbtnCancelarClick(bbtnCancelar);
         Exit;
      end;}
      // Fim - Ádler Souza  - SOL 144704 - KTN 968693

      edtSalParticipacao.Value   := fSalParticipacao;
      edtSalMantido.Value        := fSalMantido;
      edtSalAuxDoenca.Value      := fSalAuxDoenca;
      edtSalBenef.Value          := fSalBenef;

      fVlrMaxPermit              := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                                                qryIDSITPART.AsInteger,
                                                                edtPercentJuros.Value,
                                                                edtValMargem.Value,
                                                                edtValReserva.Value,
                                                                edtSaldoAQuitar.Value + fVlrTotalDividas,
                                                                edtQuitacao.Value,
                                                                edtSalParticipacao.Value,
                                                                edtSalMantido.Value,
                                                                edtSalAuxDoenca.Value,
                                                                edtSalBenef.Value,
                                                                fVlrSalBase,
                                                                True, // Mostra
                                                                //Pendência 26951 - 03/12/2007
                                                                vDividasAnteriores,
                                                                //Pendência 22836 - 03/10/2006 - Alberto
                                                                0,
                                                                chkExcepcional.Checked,
                                                                //Fim Pendência 22836
                                                                qryContratosAnteriores,
                                                                //Fim Pendência 26951
                                                                // SOL:108099 Daniel Begnami
                                                                StrToInt(edtPrazoSuspensao.text),
                                                                iIDTipoSuspEmptmo
                                                                // FIM
                                                               );

      if qry.State in dsEditModes then
      begin
         qryVLRSALBASE.AsCurrency   := fVlrSalBase;
         qryVLRMARGEM.AsCurrency    := fVlrMargem;
         qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
      end;

      (* dispara recálculo se valor solicitado estiver zerado ou
                           se valor solicitado > máximo permitido *)
      if ( ( (qryVLRMAXPERMIT.AsCurrency > 0) and (qryVLRSOLIC.AsCurrency = 0) ) or
           ( qryVLRMAXPERMIT.AsCurrency < qryVLRSOLIC.AsCurrency ) ) then
      begin
         SetTxJuros;
      end;
   end;  // if fVlrSalarioAnt <> qryVLRSALBASE.AsCurrency 

   DBEdtSalarioBase.Enabled   := False;
end;



procedure TfrmCadInscricao.btnAlteraMargemClick(Sender: TObject);
begin
   inherited;

   DBEdtMargem.Enabled  := True;
   DBEdtMargem.ReadOnly := False;
   DBEdtMargem.Color    := clWindow;
   fMargem              := qryVLRMARGEM.AsCurrency;

   DBEdtMargem.SetFocus;
end;



procedure TfrmCadInscricao.DBEdtMargemExit(Sender: TObject);
begin
   inherited;

   DBEdtMargem.ReadOnly := True;
   DBEdtMargem.Color    := clBtnFace;

   if (ActiveControl = bbtnCancelar) or (ActiveControl = bbtnSair) then Exit;

   //Pendência 22645 - 23/06/2006 - Alberto
   if (fVlrMargemAnt <> qryVLRMARGEM.AsCurrency) or (Sistema.TipoCliente = 19981) then
   //Fim Pendência 22645
   begin
      fVlrSalBase          := qryVLRSALBASE.AsCurrency;
      edtValMargem.Value   := qryVLRMARGEM.AsCurrency;

      if fMargem <> qryVLRMARGEM.AsCurrency then bTrocouMargem := True;

      fVlrMaxPermit        := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                                          qryIDSITPART.AsInteger,
                                                          edtPercentJuros.Value,
                                                          edtValMargem.Value,
                                                          edtValReserva.Value,
                                                          edtSaldoAQuitar.Value + fVlrTotalDividas,
                                                          edtQuitacao.Value,
                                                          edtSalParticipacao.Value,
                                                          edtSalMantido.Value,
                                                          edtSalAuxDoenca.Value,
                                                          edtSalBenef.Value,
                                                          fVlrSalBase,
                                                          True, (* Mostra *)
                                                          //Pendência 26951 - 03/12/2007
                                                          vDividasAnteriores,
                                                          //Pendência 22836 - 03/10/2006 - Alberto
                                                          0,
                                                          chkExcepcional.Checked,
                                                          //Fim Pendência 22836
                                                          qryContratosAnteriores,
                                                          //Fim Pendência 26951
                                                          // SOL:108099 Daniel Begnami
                                                          StrToInt(edtPrazoSuspensao.text),
                                                          iIDTipoSuspEmptmo
                                                          // FIM
                                                         );

      if qry.State in dsEditModes then
      begin
         qryVLRSALBASE.AsCurrency   := fVlrSalBase;
         qryVLRMARGEM.AsCurrency    := edtValMargem.Value;
         qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
         edtLimiteDisp.Value        := qryVLRMAXPERMIT.AsCurrency - edtSaldoAQuitar.Value - fVlrTotalDividas;
      end;

      (* dispara recálculo se valor solicitado estiver zerado ou
                           se valor solicitado > máximo permitido *)
      if ( ( (qryVLRMAXPERMIT.AsCurrency > 0) and (qryVLRSOLIC.AsCurrency = 0) ) or
           ( ((qryVLRMAXPERMIT.AsCurrency < qryVLRSOLIC.AsCurrency) and
              not(chkExcepcional.Checked)) ) ) then
      begin
         SetTxJuros;
         //Pendência 22645 - 23/06/2006 - Alberto
         ActiveControl.SetFocus;
         //Fim Pendência 22645
      end;

   end;

   DBEdtMargem.Enabled  := False;
end;



function TfrmCadInscricao.EhUltimoDiaUtilMes(dDataVerificacao : TDateTime) : Boolean;
var
   iAno, iMes, iDia : word;
begin
   Result := False;

   DecodeDate(dDataVerificacao, iAno, iMes, iDia);

   Result := ( dDataVerificacao = DiasUteis.UltDiaUtilMes(iAno,
                                                          iMes,
                                                          iCidade,
                                                          iPais,
                                                          sEstado,
                                                          False,   // bConsideraBancario
                                                          False,   // bConsideraExtraordinario
                                                          False    // bSabadoUtil
                                                          ) );
end;



procedure TfrmCadInscricao.btnAlteraVlrMaxClick(Sender: TObject);
begin
   inherited;

   DBEdtVlrMaxPermit.Enabled  := True;
   DBEdtVlrMaxPermit.ReadOnly := False;
   DBEdtVlrMaxPermit.Color    := clWindow;
   fValMax                    := qryVLRMAXPERMIT.AsCurrency;

   DBEdtVlrMaxPermit.SetFocus;
end;



procedure TfrmCadInscricao.DBEdtVlrMaxPermitExit(Sender: TObject);
begin
   inherited;

   DBEdtVlrMaxPermit.ReadOnly := True;
   DBEdtVlrMaxPermit.Color    := clBtnFace;

   if (ActiveControl = bbtnCancelar) or (ActiveControl = bbtnSair) then Exit;

   fVlrSalBase    := qryVLRSALBASE.AsCurrency;
   bTrocouValMax  := (fValMax <> qryVLRMAXPERMIT.AsCurrency);
   fVlrMargem     := edtValMargem.Value;

   edtSalParticipacao.Value   := fSalParticipacao;
   edtSalMantido.Value        := fSalMantido;
   edtSalAuxDoenca.Value      := fSalAuxDoenca;
   edtSalBenef.Value          := fSalBenef;

   fVlrMaxPermit              := qryVLRMAXPERMIT.AsCurrency;

   DBEdtVlrMaxPermit.Enabled  := False;

   (* dispara recálculo se valor solicitado estiver zerado ou
                        se valor solicitado > máximo permitido *)
   if ( ( (qryVLRMAXPERMIT.AsCurrency > 0) and (qryVLRSOLIC.AsCurrency = 0) ) or
        ( qryVLRMAXPERMIT.AsCurrency < qryVLRSOLIC.AsCurrency ) ) then
   begin
      qryVLRSOLIC.AsCurrency := qryVLRMAXPERMIT.AsCurrency;

      // Thiago Melo SOL 183326 Kintana 1712188
      CalculaParcela(0);
      //

      //Pendência 22645 - 23/06/2006 - Alberto
      ActiveControl.SetFocus;
      //Fim Pendência 22645
   end;
end;



procedure TfrmCadInscricao.DBEdtSalarioBaseEnter(Sender: TObject);
begin
   inherited;
   fVlrSalarioAnt := qryVLRSALBASE.AsCurrency;
end;



procedure TfrmCadInscricao.DBEdtMargemEnter(Sender: TObject);
begin
   inherited;
   fVlrMargemAnt := qryVLRMARGEM.AsCurrency;
end;



procedure TfrmCadInscricao.edtDataCreditoCloseUp(Sender: TObject);
var
   nRecno: TBookMark; // Pendência 27264 - 22/01/2008
begin
   inherited;
   (* Verifico se houve mudanças no Data de Crédito. Caso positivo,
      a propriedade Modified do CMDateTimePicker é True *)
   if edtDataCredito.Modified then
   begin
      bTrocouDataCred := True;

      (* Validação das Datas de Crédito e o atributo interno (PRIVATE) que guarda
      a Data de Crédito parametrizada pelo Sistema *)
      if ( (chkTRAVARDATAS.Checked) and
           (edtDataCredito.Date < dDataCredito) and
           not(chkExcepcional.Checked) ) then 
      begin

         MsgDlg('A Data do Crédito NÃO pode ser anterior a Data parametrizada pelo Sistema.  Favor verificar...',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         (* Retorna a Data parametrizada pelo Sistema *)
         edtDataCredito.Date     := dDataCredito;
         pgcValores.ActivePage   := tbsGeral;

         if edtDataCredito.CanFocus then edtDataCredito.SetFocus;

         Exit;

      end; (* if chkTravarDatas... *)

      (* Procedimento que acerta a Data da Primeira Parcela e Calcula a Carência
         utilizando a função BuscaData da unit UCalcEmptmo *)
      AcertaDataPrimParcela;

      // Procedimento que armazena os dados da Inscrição num registro
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

      AbreQueriesDividas;
      CalculaEPAnterior;

      // Pendência 27264 - 22/01/2008
      qryContratosAnteriores.First;
      while not qryContratosAnteriores.eof do
      begin
         LimpaParametros(qryContratoQuitavel);
         qryContratoQuitavel.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(DBcboTipoContrato.LookupValue);
         qryContratoQuitavel.ParamByName('PIDTIPOCONTRQUIT').AsInteger   := qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger;
         qryContratoQuitavel.Open;

         nRecno := qryContratosAnteriores.GetBookMark;
         if ((qryContratoQuitavelFLOBRIGATORIO.AsInteger = 1)  or
         (qryContratosAnterioresVLREMABERTO.AsCurrency > 0)) then //SOL125808 - Ádler Souza
         begin
            qryContratosAnteriores.Edit;
            qryContratosAnterioresFLGOBRIGATORIO.AsInteger := 1;
            qryContratosAnteriores.Post;
            b_btnIncluirQuitarClick := False;     // SOL 123381 - Daniel Begnami
            btnIncluirQuitarClick(btnIncluirQuitar);
            b_btnIncluirQuitarClick := True;      // SOL 123381 - Daniel Begnami            
         end;
         qryContratoQuitavel.Close;
         qryContratosAnteriores.GotoBookMark(nRecno);
         qryContratosAnteriores.FreeBookMark(nRecno);
         qryContratosAnteriores.Next;
      end;
      qryContratosAnteriores.First;
      // Fim Pendência 27264

      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         if (iTotSiafi > 0) and
            not(chkExcepcional.Checked) and
            not(chkFinanciamento.Checked) then
         begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            MsgDlg('Mutuário possui dívidas de Financiamento Habitacional. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;
         // ----------------------------------------------------------------------------------------
         // Verifica se há itens em aberto de qq contrato (para adiantamento de 13º)
         //Pendência 27232 - 16/04/2008
         //if (qryIDTIPOCONTREMPTMO.AsInteger in [11, 12, 13, 14, 15, 16, 19, 20]) and
         //Fim Pendência 27232

         // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979
         //if (qryTipoContratoFLGVERIFICAITEMABERTO.AsInteger <> 0) and
            //(qryContratosAnteriores2.Active) then
         //begin
         // Fim // Renato Visoni 22/07/2008 N. Sol 91500, N. Kintana 386979


            //Pendência 27232 - 16/04/2008
            if not(dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.IsNull) then
         begin

               if (not chkExcepcional.Checked) and
                  (not ValidaTipoContratoEmprestimo(qryContratosAnteriores2,
                                                    qryIDPESSOA.AsInteger,
                                                    qryIDBENEF.AsInteger,
                                                    StrToInt(DBcboTipoContrato.LookupValue),
                                                    dtmEmptmo.qryParamEmptmoIDREGRATIPOCONTR.AsInteger
                                                   )) then
         begin
                  //LogToFile('Contrato anterior do mesmo tipo', sArq);
                  //MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                  LogToFile('Tipo de contrato em aberto impede contratação', sArq);
                  MsgDlg('Tipo de contrato em aberto impede contratação!', 'Empréstimo', mtWarning, [mbOk], 0);
                  Repaint;
                  Exit;
               end;

            end;
            //Fim Pendência 23733

            qryContratosAnteriores2.First;
            while not(qryContratosAnteriores2.EOF) do
            begin
               if not(chkExcepcional.Checked) then
               begin
                  if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                                     True,
                                                     edtDataCredito.Date,
                                                     True,
                                                     StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                                     StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                                     // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                                     0                                                     
                                                    //Pendência 27232 - 16/04/2008
                                                    //) then
                                                    ) <> 0 then
                  begin
                     MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;
               end;

               //Pendência 27232 - 18/04/2008
               {
               // Marchetti - Pendencia 26318
               if not(chkExcepcional.Checked) then
               begin
                  if not TipoContratoPermitidoParaConcessao then
                  begin
                     MsgDlg('Mutuário possui contrato anterior do mesmo tipo. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
                     Repaint;
                     Exit;
                  end;
               end;
               // Fim Marchetti - Pendencia 26318
               }

               qryContratosAnteriores2.Next;
            end;
         //end;
         // ----------------------------------------------------------------------------------------
      end;

      // Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
      //   acrescentando ao valor solicitado os valores dos itens de concessão


      SetTxJuros; //SOL:115111 Daniel Begnami

      BuscaValorLiquidoEP;

   end;  // if Modified

   edtDataCredito.Modified := False;
end;



procedure TfrmCadInscricao.edtDataCreditoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   bDigitouDataCred := True;
end;



function TfrmCadInscricao.VerificaSuspensao(IDTipoContrEmptmo : Int64;var bExisteSusp:Boolean) : Boolean; //Thiago Passos SOL 122186
var
   bSuspendeAuto     : Boolean;
   bExisteSuspensao  : Boolean;
begin
   bSuspendeAuto := False;

   //BRUNO AZEVEDO SOL 133146 KINTANA 773758
   bExisteSuspensao := False;

   with dtmLookEmptmo.qryLookTipoSusp do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger := IDTipoContrEmptmo;
      ParamByName('PCONC').AsInteger := 1; // Ádler Souza - SOL 142594 KTN 912858
      Open;

      if not(IsEmpty) then
      begin
         while not(EOF) do
         begin
            if FieldByName('FLGSUSPCONCESSAO').AsInteger = 1 then
            begin
               bSuspendeAuto := True;
               Break;
            end;

            // aproveitamento de suspensao
            if (FieldByName('IDTIPOSUSPEMPTMO').AsInteger = iTipoSuspAnterior) and (iTipoSuspAnterior > 0) then
            begin
               bExisteSuspensao := True;
               Break;
            end;

            Next;
         end;  // while not(EOF)

         if bSuspendeAuto then
         begin
            MsgDlg('Esse contrato terá sua cobrança SUSPENSA Automaticamente.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            //DBcboSuspensao.LookupValue := FieldByName('IDTIPOSUSPEMPTMO').AsString;  //Thiago Passos SOL 122186
         end;

         if bExisteSuspensao then
         begin             //Thiago Passos SOL 122186
            MsgDlg('Esse contrato poderá ter aproveitamento de Suspensão.' + chr(13) + 'Se desejar solicitá-la favor promover o cadastro pelo campo Suspensão de Cobrança', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;

           // DBcboSuspensao.LookupValue := FieldByName('IDTIPOSUSPEMPTMO').AsString;  //Thiago Passos SOL 122186
            //Pendência 19398 - 03/07/2006 - Alberto
            edtDataFinalSuspensao.Date := dDataSuspAnterior;
            //DBcboSuspensao.Enabled := FALSE;

             //SOL 122186 ktn 596406 Thiago Passos
            DBcboSuspensao.Enabled := TRUE;
            //Fim Pendência 19398
         end;

      end;  // if not(isEmpty)
   end;  // with qryLookTipoSusp

end;



procedure TfrmCadInscricao.DBcboSuspensaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   dDataAnt : TDateTime;
   iQtdeMesSusp : Integer;
begin
   inherited;

   iIDTipoSuspEmptmo := dtmLookEmptmo.qryLookTipoSuspIDTIPOSUSPEMPTMO.AsInteger;

   if DBcboSuspensao.LookupValue <> '' then
   begin

      edtValorParcSusp.Value := 0;
      edtPrazoSuspensao.text := IntToStr(0);
      btnLimpaSuspensao.Enabled := True;

      if (rgSuspParc.Items.Count > 0) then
        rgSuspParc.Items.Clear;

      // SOL:108099 Daniel Begnami
      if (dtmLookEmptmo.qryLookTipoSuspFLGSUSAPENASCONC.AsInteger = 1) then
      begin

         edtDataFinalSuspensao.clear;

         iQtdeMesSusp := CalcEmptmo.ValidaMesesSuspensao(dtmLookEmptmo.qryLookTipoSuspIDREGRAVALIDSUSP.AsInteger,
                                                         qryIDPESSOA.AsInteger,
                                                         qryIDBENEF.AsInteger,
                                                         dDataCredito,
                                                         iIDTipoSuspEmptmo,
                                                         qryContratosAnteriores,
                                                         qryIDTipoContrEmptmo.AsInteger);
         if iQtdeMesSusp <= 0  then
          begin
             btnLimpaSuspensao.OnClick(Sender);
             iQtdeMesSusp :=0;
             //SOL 122186 ktn 596406 Thiago Passos
             DBcboSuspensao.LookupValue :='';
             showmessage('Suspensão não permitida');

             abort;

          end;

         Self.CriaPanelSuspParc(iQtdeMesSusp);

      end
      else
      begin
        dDataAnt := dDataSuspAnterior;
        dDataSuspAnterior := 0;
        if not(TestaSuspensao) then
        begin
          edtDataFinalSuspensao.Clear;
          DBcboSuspensao.LookupValue := '';
          DBcboSuspensao.Clear;
        end;
        dDataSuspAnterior := dDataAnt;
      end;
      // FIM
   end;
end;



function TfrmCadInscricao.DataFinalSuspensao: TDateTime;
var
   dData : TDateTime;
begin

   dData := StrToDate('31/12/1899');

   dData := CalcEmptmo.ValidaSuspensao(dtmLookEmptmo.qryLookTipoSuspIDREGRAVALIDSUSP.AsInteger,
                                       -1,
                                       qryIDPESSOA.AsInteger,
                                       qryIDBENEF.AsInteger,
                                       qryIDPATRO.AsInteger,
                                       qryFLGINTERNO.AsString,
                                       iIDTipoSuspEmptmo, // // SOL:108099 Daniel Begnami
                                       dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger,
                                       qryDATACREDITO.AsDateTime,
                                       dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.AsDateTime,
                                       dtmLookEmptmo.qryLookTipoSuspFLGFERIAS.AsInteger,
                                       0,
                                       0,
                                       -1,
                                       -1,//Fanuel Junior SOL174268/8141 Kintana
                                       -1,
                                       0
                                       //Pendência 22836 - 03/10/2006 - Alberto
                                      ,Ord(chkExcepcional.Checked)
                                       //Fim Pendência 22836
                                      );

   if dData > dDataSuspAnterior then dData := dDataSuspAnterior;

   Result := dData;
end;



function TfrmCadInscricao.TestaSuspensao: Boolean;
begin
   dDataFinalSuspensao := DataFinalSuspensao;

   if dDataFinalSuspensao < edtDataCredito.Date then
   begin
      Result := False;

      MsgDlg('Não é permitida a suspensão', 'Empréstimo', mtWarning, [mbOK], 0);
      Repaint;
   end
   else
   begin
      Result := True;

      edtDataFinalSuspensao.Date := dDataFinalSuspensao;
   end;
end;



procedure TfrmCadInscricao.FormShow(Sender: TObject);
begin
   inherited;

   b_btnIncluirQuitarClick := True;    // SOL 123381 - Daniel Begnami

   ParametrosSistema;

   // A princípio, supõe-se que já existe transacao - anterior - em progresso
   bTransacaoAnterior := True;

   grpTitular.Visible      := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
   chkTRAVARDATAS.Checked  := (dtmEmptmo.qryParamEmptmoFLGTRAVARDATA.AsInteger <> 1);
   sbtnImprimir.Visible    := (dtmEmptmo.qryParamEmptmoFLGIMPRINSCRICAO.AsInteger = 1);

   iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
   iPrograma   := dtmEmptmo.qryParamEmptmoIDPROGRAMA.AsInteger;
   sCCusto     := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;

   with dtmEmptmo.qryParamGlobal do
   begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
   end;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      lblHoraEncerra.Visible  := True;
      edtHoraEncerra.Visible  := True;
      edtHoraEncerra.Time     := StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString);

      // André Pontes - 18/08/2005 - pendência 20007
      bbtnConfirmar.Visible   := False;
   end;

   fVlrDevSeg           := 0;
   fVlrSeguroAnt        := 0;
   fVlrSeguroComplAnt   := 0;


   iIDTipoSuspEmptmo := -1;

   edtPrazoSuspensao.text := IntToStr(0); // SOL:108099 Daniel Begnami

   bDesabilitouContrato := False;
end;


//Vinicius Ferreira SOL 148026 KINTANA 1031173
function TfrmCadInscricao.PossuiSuspensaoConcessao(iIDPessoa : Int64) : boolean;
var qryupdt   : twwquery;
    qryselectmod   : twwquery;
    qryidselect    : twwquery;
    qryselectbloqgeral : twwquery;
    qryFlgPrazoIndeterminado   : twwquery;
    sSQL_updt : string;
  i,i2,i3,i4: integer;
  sTemp: String;
  sChar: String;
  Branco: Boolean;
  sExpressao: String;
  ModEmpb: Integer;
  strMod: String;
  Lista: TStringList;
  DatainiModEmpb: TDateTime;
  pDataBloq: String;
begin
   Result := False;

      //Inicio Vinicius Ferreira SOL 148026 KINTANA 1031173
      try

              qryselectmod := TwwQuery.Create(Nil);
              qryselectmod.DatabaseName := 'BaseDados';
              qryselectmod.Close;
              qryselectmod.SQL.Clear;
              qryselectmod.SQL.Add(' SELECT DESCMODEMP,SUCDATAINICIO FROM SUSPCONCESSAO');
              qryselectmod.SQL.Add(' WHERE IDPESSOA = '+ IntToStr(iIDPessoa));
              qryselectmod.SQL.Add(' ORDER BY SUCDATAINICIO');
              qryselectmod.Open;

              qryidselect := TwwQuery.Create(Nil);
              qryidselect.DatabaseName := 'BaseDados';
              qryidselect.Close;
              qryidselect.SQL.Clear;
              qryidselect.SQL.Add(' SELECT IDTIPOCONTREMPTMO FROM TIPOCONTREMPTMO');
              qryidselect.SQL.Add(' WHERE IDTIPOCONTREMPTMO = '+ QUOTEDSTR(DBcboTipoContrato.LookupValue));
              qryidselect.SQL.Add(' AND FLGSITUACAO = ''A''');
              qryidselect.Open;


           for i4:= 0 to qryselectmod.recordcount - 1 Do
           begin

             strMod := qryselectmod.FieldByName('DESCMODEMP').asString;

            Branco:= False;
            schar := ',';
            sExpressao := strMod;
            sExpressao := Trim(sExpressao) + sChar;

            Lista := TStringlist.Create;
            sTemp := '';

            i := 1;
            while i <= Length(sExpressao) do
            begin
              if (Copy(sExpressao, i, Length(sChar)) = sChar) then
              begin
                Inc(i,Length(sChar)-1);
                if ((sTemp = '') and (Branco)) or (sTemp <> '') then
                begin
                  Lista.Add(sTemp);
                end;
                sTemp := '';
              end
              else
              begin
                sTemp := sTemp + Copy(sExpressao, i, 1);
              end;
              Inc(i);
            end;
                i2:=0;
                
                i2 := qryidselect.FieldByName('IDTIPOCONTREMPTMO').asInteger;

                if i2 <> -1 then
                begin
                  i3 := 0;
                  for i3:= 0 to Lista.Count - 1 Do
                  begin
                    if i2 = strtoint(Lista[i3]) then
                    begin
                       ModEmpb := i2;
                       DatainiModEmpb := qryselectmod.FieldByName('SUCDATAINICIO').AsDateTime;
                    end;
                  end;
                end;

               qryselectmod.next;
            end;

              pDataBloq  := edtDataCredito.Text;

               qryselectbloqgeral := TwwQuery.Create(Nil);
              qryselectbloqgeral.DatabaseName := 'BaseDados';
              qryselectbloqgeral.Close;
              qryselectbloqgeral.SQL.Clear;

              //Wylliam Leite da Silva SOL 171546 KINTANA 1538728 - Inicio

              qryselectbloqgeral.SQL.Add(' select tmp.IDPESSOA, ');
              qryselectbloqgeral.SQL.Add(' tmp.NOME, ');
              qryselectbloqgeral.SQL.Add(' tmp.SUCDATAINICIO, ');
              qryselectbloqgeral.SQL.Add(' tmp.SUCDATAFINAL, ');
              qryselectbloqgeral.SQL.Add(' tmp.SUCMOTIVOSUSP, ');
              qryselectbloqgeral.SQL.Add(' tmp.FLGSTATUS ');
              qryselectbloqgeral.SQL.Add(' from (  ');
              qryselectbloqgeral.SQL.Add(' SELECT  SUC.IDPESSOA,');
              qryselectbloqgeral.SQL.Add(' min(SUC.SUCDATAINICIO) over() MENORDATA, ');
              qryselectbloqgeral.SQL.Add(' PES.NOME,');
              qryselectbloqgeral.SQL.Add(' SUC.SUCDATAINICIO,');
              qryselectbloqgeral.SQL.Add(' SUC.SUCDATAFINAL,');
              qryselectbloqgeral.SQL.Add(' SUC.SUCMOTIVOSUSP,');
              qryselectbloqgeral.SQL.Add(' SUC.FLGSTATUS');
              qryselectbloqgeral.SQL.Add(' FROM PESSOA PES, SUSPCONCESSAO SUC ');
              qryselectbloqgeral.SQL.Add(' WHERE SUC.IDPESSOA  = '+ IntToStr(iIDPessoa));
              qryselectbloqgeral.SQL.Add(' AND SUC.FLGSTATUS = ''A''');
              qryselectbloqgeral.SQL.Add(' AND ((TO_DATE(' + QUOTEDSTR(pDataBloq) + ',''DD/MM/YYYY'') BETWEEN SUC.SUCDATAINICIO AND SUC.SUCDATAFINAL)');
              qryselectbloqgeral.SQL.Add(' or  (SUC.SUCDATAINICIO < TO_DATE(' + QUOTEDSTR(pDataBloq) + ',''DD/MM/YYYY'') and nvl(SUC.FLGPRAZOINDETERMINADO,''N'') = ''S''))');
              qryselectbloqgeral.SQL.Add(' AND PES.IDPESSOA = SUC.IDPESSOA');
              qryselectbloqgeral.SQL.Add(' AND (SUC.DESCMODEMP is null or SUC.DESCMODEMP = '''')');
              qryselectbloqgeral.SQL.Add(' ORDER BY SUC.IDPESSOA, SUC.SUCDATAINICIO ) tmp ');
              qryselectbloqgeral.SQL.Add(' where tmp.SUCDATAINICIO = tmp.MENORDATA ');
              qryselectbloqgeral.Open;

              //Wylliam Leite da Silva SOL 171546 KINTANA 1538728 - Fim

              if qryselectbloqgeral.recordcount = 1 then
              begin
               DatainiModEmpb := qryselectbloqgeral.FieldByName('SUCDATAINICIO').AsDateTime;
              end;

             //Fernando Santana  SOL 132000 KINTANA 758243
             // Cria a Query Auxiliar
             qryupdt               := Twwquery.Create(Application);
             qryupdt.DatabaseName  := 'BaseDados';
             sSQL_updt :=
              'update SUSPCONCESSAO'                                     +#13+
              'set   SUSPCONCESSAO.FLGSTATUS = ''E'''                    +#13+
              'where trunc(SUSPCONCESSAO.SUCDATAFINAL) < trunc(to_date('+chr(39)+edtDataCredito.text+chr(39)+','+'''dd/mm/rrrr''))'+#13+
              'and SUSPCONCESSAO.SUCDATAFINAL is not null'               +#13+
              'and SUSPCONCESSAO.FLGSTATUS = ''A'''                      +#13+
              'and SUSPCONCESSAO.SUCDATAINICIO  = '+ QUOTEDSTR(DateToStr(DatainiModEmpb))  +#13+
              'and SUSPCONCESSAO.IDPESSOA  = to_number('+inttostr(iIDPessoa)+')';
             qryupdt.SQL.Clear;
             qryupdt.SQL.Add(sSQL_updt);
             qryupdt.ExecSQL;
             //  Fim Fernando Santana  SOL 132000 KINTANA 758243

           if (ModEmpb = i2) or (qryselectbloqgeral.recordcount = 1) then
           begin
                         
             with dtmLookEmptmo.qryLookSuspConc do
             begin
                LimpaParametros(dtmLookEmptmo.qryLookSuspConc);
                ParamByName('PIDPESSOA').AsInteger := iIDPessoa;
                ParamByName('PDATA').asString      := edtDataCredito.Text;  //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
                ParamByName('PDATAINI').AsString   := DateToStr(DatainiModEmpb);    //Vinicius Ferreira SOL 148026 KINTANA 1031173
                Open;
             end;

             if not (dtmLookEmptmo.qryLookSuspConc.IsEmpty)   then
             begin
                Result := True;

                Application.CreateForm(TfrmMostraSuspensaoConcessao, frmMostraSuspensaoConcessao);
                //Fanuel Junior SOL139631 Kintana860008 - Inicio

                qryFlgPrazoIndeterminado := TwwQuery.Create(Nil);
                qryFlgPrazoIndeterminado.DatabaseName := 'BaseDados';
                qryFlgPrazoIndeterminado.Close;
                qryFlgPrazoIndeterminado.SQL.Clear;
                qryFlgPrazoIndeterminado.SQL.Add(' SELECT FLGPRAZOINDETERMINADO FROM ');
                qryFlgPrazoIndeterminado.SQL.Add(' SUSPCONCESSAO WHERE IDPESSOA = '+ IntToStr(iIDPessoa));
                qryFlgPrazoIndeterminado.SQL.Add(' and SUCDATAINICIO = '+ QUOTEDSTR(qryselectmod.FieldByName('SUCDATAINICIO').AsString));
                qryFlgPrazoIndeterminado.Open;

                If qryFlgPrazoIndeterminado.FieldByName('FLGPRAZOINDETERMINADO').AsString = 'S' then
                   frmMostraSuspensaoConcessao.lblPrazoIndeterminado.Visible := true
                else
                   frmMostraSuspensaoConcessao.lblPrazoIndeterminado.Visible := false;
                //Fanuel Junior SOL139631 Kintana860008 - Fim

                frmMostraSuspensaoConcessao.ShowModal;
             end;

           end;
      finally
       FreeAndNil(qryselectmod);
       FreeAndNil(qryidselect);
      end;
   Repaint;
end;



function TfrmCadInscricao.PossuiAssinatura(const IDPessoa          : Extended;
                                           const IDBenef           : Extended;
                                           const IDTipoContrEmptmo : Int64
                                          ): Boolean;
var
   iIDContratoPadraoObrig  : Int64;
   iIDContratoPadraoAtivo  : Int64;
   iIDPlanoPrev            : Int64;
   iTipoAlt                : Int64;
begin
   Result := True;

   LimpaParametros(dtmLookEmptmo.qryLookAssinatura);
   dtmLookEmptmo.qryLookAssinatura.ParamByName('PIDPESSOA').AsFloat  := IDPessoa;
   dtmLookEmptmo.qryLookAssinatura.ParamByName('PIDBENEF').AsFloat   := IDBenef;
   dtmLookEmptmo.qryLookAssinatura.Open;

   if dtmLookEmptmo.qryLookAssinatura.IsEmpty then
   begin
      MsgDlg('Mutuário não possui nenhuma assinatura de contrato!', 'Empréstimo', mtError, [mbOk], 0);
      Result := False;
      Exit;

   end;

   LimpaParametros(dtmLookEmptmo.qryLookAssinatura);
   dtmLookEmptmo.qryLookAssinatura.ParamByName('PIDPESSOA').AsFloat              := IDPessoa;
   dtmLookEmptmo.qryLookAssinatura.ParamByName('PIDBENEF').AsFloat               := IDBenef;
   dtmLookEmptmo.qryLookAssinatura.ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := IDTipoContrEmptmo;
   dtmLookEmptmo.qryLookAssinatura.Open;

   // ----------------------------------------------------------------------------------------------

   if not(dtmLookEmptmo.qryLookAssinatura.IsEmpty) then
   begin
      if dtmLookEmptmo.qryLookAssinaturaFLGBLOQUEIO.AsInteger <> 0 then
      begin
         MsgDlg('Mutuário(a) está com concessão BLOQUEADA!', 'Empréstimo', mtError, [mbOk], 0);
         Result := False;
         Exit;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   if dtmLookEmptmo.qryLookAssinatura.IsEmpty then
   begin
      MsgDlg('Mutuário não possui assinatura para esse tipo de contrato!', 'Empréstimo', mtError, [mbOk], 0);
      Result := False;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   // Verifica a existencia de contrato obrigatório a ser assinado no periodo
   iIDContratoPadraoObrig := -1;

   LimpaParametros(dtmLookEmptmo.qryLookMaxContratoPadraoObrig);
   dtmLookEmptmo.qryLookMaxContratoPadraoObrig.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := IDTipoContrEmptmo;
   dtmLookEmptmo.qryLookMaxContratoPadraoObrig.Open;

   if not(dtmLookEmptmo.qryLookMaxContratoPadraoObrig.IsEmpty) then
      iIDContratoPadraoObrig := dtmLookEmptmo.qryLookMaxContratoPadraoObrigIDCONTRATOPADRAO.AsInteger;

   // Pesquisa o ultimo contrato ativo
   LimpaParametros(dtmLookEmptmo.qryContratoPadraoAtivo);
   dtmLookEmptmo.qryContratoPadraoAtivo.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := IDTipoContrEmptmo;
   dtmLookEmptmo.qryContratoPadraoAtivo.Open;

   iIDContratoPadraoAtivo := dtmLookEmptmo.qryContratoPadraoAtivoIDCONTRATOPADRAO.AsInteger;

   // Verifica se mutuário possui assinatura do contrato obrigatório
   LimpaParametros(dtmLookEmptmo.qryLookPossuiAssinatura);
   dtmLookEmptmo.qryLookPossuiAssinatura.ParamByName('PIDPESSOA').AsFloat           := IDPessoa;
   dtmLookEmptmo.qryLookPossuiAssinatura.ParamByName('PIDBENEF').AsFloat            := IDBenef;
   dtmLookEmptmo.qryLookPossuiAssinatura.ParamByName('PIDCONTRATOPADRAO').AsInteger := iIDContratoPadraoObrig;
   dtmLookEmptmo.qryLookPossuiAssinatura.Open;

   if dtmLookEmptmo.qryLookPossuiAssinatura.IsEmpty then
   begin
      // Verifica se mutuário possui assinatura do contrato ativo
      LimpaParametros(dtmLookEmptmo.qryLookPossuiAssinatura);
      dtmLookEmptmo.qryLookPossuiAssinatura.ParamByName('PIDPESSOA').AsFloat           := IDPessoa;
      dtmLookEmptmo.qryLookPossuiAssinatura.ParamByName('PIDBENEF').AsFloat            := IDBenef;
      dtmLookEmptmo.qryLookPossuiAssinatura.ParamByName('PIDCONTRATOPADRAO').AsInteger := iIDContratoPadraoAtivo;
      dtmLookEmptmo.qryLookPossuiAssinatura.Open;

      if dtmLookEmptmo.qryLookPossuiAssinatura.IsEmpty then
      begin
         dtmLookEmptmo.qryLookAssinatura.Last;

         // Verifica se a ultima assinatura do mutuário é inferior ao obrigatorio
         if dtmLookEmptmo.qryLookAssinaturaCTPDATAINICIO.AsDateTime < dtmLookEmptmo.qryLookMaxContratoPadraoObrigCTPDATAINICIO.AsDateTime then
         begin
            MsgDlg('Mutuário necessita de nova assinatura de contrato!', 'Empréstimo', mtError, [mbOk], 0);
            Result := False;
         end;
      end;
   end;
end;



function TfrmCadInscricao.CriticaPercentuaisBeneficiarios : boolean;
begin
   Result := True;
   if ( qryTipoContratoFLGOBRIGBENEF.AsInteger = 1 ) then
   begin

      case VerificaBeneficiario of
         -1:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser maior que ZERO.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;

         -2:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser igual a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;

         -3:
         begin
            Result := False;
            MsgDlg('Somatório do Percentual de indenização deve ser igual a 100%.', 'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;
      end;
   end;
end;



function TfrmCadInscricao.VerificaBeneficiario : Integer;
var
   iRecno : TBookMark;
   fPerc  : Real;
begin
   Result := 0;
   iRecno := qryBenefSeguro.GetBookmark;
   with qryBenefSeguro do
   begin
      First;
      fPerc := 0;

      while not(EOF) do
      begin
         fPerc := fPerc + FieldByName('PERCINDENIZACAO').AsFloat;
         Next;
      end;

   end;

   qryBenefSeguro.GotoBookmark(iRecno);
   qryBenefSeguro.FreeBookmark(iRecno);

   if      fPerc = 0   then Result := -1
   else if fPerc < 100 then Result := -2
   else if fPerc > 100 then Result := -3;

end;


//Pendência 23733 - 19/12/2006 - Alberto
function TfrmCadInscricao.ValidaTipoContratoEmprestimo(qryContratosAnteriores: TQuery;
                                                       iIDPESSOA,
                                                       iIDBENEF,
                                                       iIDTIPOCONTRATOEMPTMO,
                                                       iIDREGRATIPOCONTR    : Integer
                                                      ) : Boolean;
var
   iContador  : Integer;
   sResultado : String;
   sSQL       : String;
begin

   with qryContratosAnteriores do
   begin
      iContador            := 0;

      sSQL :=
      'SELECT '                                                      + #13 +
      IntToStr(iContador)                 + ' AS TIPO, '             + #13 +
      '-1'                                + ' AS IDCONTRATOEMPTMO,'  + #13 +
      IntToStr(iIDPESSOA)                 + ' AS IDTITULAR, '        + #13 +
      IntToStr(iIDPESSOA)                 + ' AS IDPESSOA, '         + #13 + // RENATO VISONI SOL 121819  KINTANA 590453
      IntToStr(iIDBENEF)                  + ' AS IDBENEF, '          + #13 +
      IntToStr(iIDTIPOCONTRATOEMPTMO)                                + ' AS IDTIPOCONTREMPTMO, ' + #13 +
      // Marchetti - Pendencia 26364
      ' 0'                                                           + ' AS VLREMABERTO '        + #13 +
      // Fim Marchetti - Pendencia 26364
      'FROM DUAL '                                                   + #13;

      DisableControls;
      First;

      while not EOF do
      begin
         inc(iContador);

         sSQL := sSQL + 'UNION ' + #13 +
         'SELECT '                                                                         + #13 +
         IntToStr(iContador)                       + ' AS TIPO, '             + #13 +
         FieldByName('IDCONTRATOEMPTMO').AsString  + ' AS IDCONTRATOEMPTMO,'  + #13 +
         IntToStr(iIDPESSOA)                       + ' AS IDTITULAR, '        + #13 +
         IntToStr(iIDPESSOA)                       + ' AS IDPESSOA, '         + #13 + //RENATO VISONI SOL 121819  KINTANA 5904535
         IntToStr(iIDBENEF)                        + ' AS IDBENEF, '          + #13 +
         FieldByName('IDTIPOCONTREMPTMO').AsString                      + ' AS IDTIPOCONTREMPTMO, ' + #13 +
         // Marchetti - Pendencia 26364
         '  ' + NumeroIngles(FieldByName('VLREMABERTO').AsCurrency)     + ' AS VLREMABERTO '        + #13 +
         // Fim Marchetti - Pendencia 26364
         'FROM DUAL '                                                                      + #13;

         Next;
      end;
      EnableControls;

   end;

   UtilizaRegraBool(iIDREGRATIPOCONTR, sSQL, 'e Tipos de Empréstimos Concedidos', sResultado, True);

   Result := ( UpperCase(sResultado) = 'TRUE' );

end;
//Fim Pendência 23733


function TfrmCadInscricao.VerificaObrigatoriedadeAvalista : Boolean;
var
   sResultado : String;
   sSQL       : String;
   iSequencial: Integer; //Pendência 25953 - 31/07/2007 - Alberto
begin
   Result := True;
   //Pendência 25953 - 31/07/2007 - Alberto
   sSQL   :=
   'SELECT '                                                                           + #13 +
   '  PPP.IDPESSOA,  '                                                                 + #13 +
   '  SIT.FLGINTERNO, '                                                                + #13 +
   '  ELP.IDSITFUNC, '                                                                 + #13 +
   '  NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO, '                                + #13 +
   '  NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO, '                                          + #13 +
   '  NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA, '                                      + #13 +
   '  NVL(BEN.VALORATUAL, 0) AS VALORATUAL, '                                          + #13 +
   // Marchetti - Pendencia 26215
   // Colocado NVL para não passar campo em branco para a query de entrada
   '  NVL(BEN.IDBENEFICIO,0) AS IDBENEFICIO, '                                         + #13 +
   '  NVL(BEN.IDSITBENEFICIO,0) AS IDSITBENEFICIO, '                                   + #13 +
   // Fim Marchetti - Pendencia 26215
   '  PPP.IDSITPART, '                                                                 + #13 +
   '  ELP.IDPESSJUR, '                                                                 + #13 +
   '  NVL(BEN.IDPLANOPREV, PPP.IDPLANOPREV) AS IDPLANOPREV, '                          + #13 +
   '  NVL(ELP.FLGDIRETOR, 0) AS FLGDIRETOR, '                                          + #13 +
   '  PFI.DATANASC, '                                                                  + #13 +
   '  PFI.SEXO '                                                                       + #13 +
   'FROM '                                                                             + #13 +
   '  PESSOAFISICA PFI, '                                                              + #13 +
   '  PARTPREVPLAN PPP, '                                                              + #13 +
   '  ELEGPATRO    ELP, '                                                              + #13 +
   '  SITPART      SIT, '                                                              + #13 +
   '  ( '                                                                              + #13 +
   '  SELECT '                                                                         + #13 +
   '     BF.IDPESSOA, BF.IDTITULAR, '                                                  + #13 +
   '     BF.VALORATUAL, BF.IDPLANOPREV, '                                              + #13 +
   '     BF.IDBENEFICIO, BF.IDSITBENEFICIO, BF.DATAFINAL, BF.DATAFINALPREVISTA '       + #13 +
   '  FROM '                                                                           + #13 +
   '     BENEFBFCIARIO BF '                                                            + #13 +
   '  WHERE '                                                                          + #13 +
   '         ( BF.IDTITULAR  = ' + qryIDBENEF.AsString + ' ) '                         + #13 +
   '     AND ( BF.IDPESSOA   = ' + qryIDPESSOA.AsString + ' ) '                        + #13 +
   '     AND ( (BF.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate)) + ','  +
                                              QuotedStr('DD/MM/YYYY') + ')) '   +
               'OR (BF.DATAFINAL IS NULL) )'                                           + #13 +
   '  ) BEN '                                                                          + #13 +
   'WHERE '                                                                            + #13 +
   '      ( PPP.IDPESSOA      = ' + qryIDBENEF.AsString + ' ) '                        + #13 +
   '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                   + #13 +
   '  AND ( PPP.IDSITPART     = SIT.IDSITPART ) '                                      + #13 +
   '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                                       + #13 +
   '  AND ( ELP.IDPESSJUR     = PPP.IDPESSJUR ) '                                       + #13 +
   '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA(+) ) '                                    + #13 +
//   '  AND PPP.FLGDESATIVADO   = 0 '                                                    + #13;
   '  AND PPP.IDPLANOPREV   = ' + qryIDPLANOPREV.AsString                              + #13 + // Ádler Souza - SOL 145988 Kintana 987019

   // SOL 198995 Kintana 1914430
   ' AND  (ppp.idplanoprev    = ben.idplanoprev    '                                   + #13 +
   '     OR                                        '                                   + #13 +
   '     NOT EXISTS (SELECT 1 FROM partprevplan ppp1  '                                + #13 +
   '                 WHERE ppp1.idpessoa = ppp.idpessoa  '                             + #13 +
   '                 AND   ppp1.idplanoprev = ben.idplanoprev))  '                     + #13 ;

   // SOL 198995 Kintana 1914430
   //Fim Pendência 25953

   with dtmEmptmo.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      Open;

      iSequencial := 0;

      while not(EOF) do
      begin
         Inc(iSequencial);

         //Pendência 25953 - 31/07/2007 - Alberto
         sSQL :=
            'SELECT '                                                    + #13 +
            ' ' + FieldByName('IDPESSOA').AsString   + ' AS IDPESSOA,  ' + #13 +
            ' ' + FieldByname('IDSITFUNC').AsString  + ' AS IDSITFUNC, ' + #13 +
            '0' + IntToStr(Ord(chkExcepcional.Checked)) + ' AS FLGEXCEPCIONAL, ' + #13 +
            ' '  + QuotedStr(FieldByName('FLGINTERNO').AsString)               + ' AS FLGINTERNO, '      + #13 +
            '  ' + IntToStr(iSequencial)                                       + ' AS SEQUENCIAL, '      + #13 +
            '  ' + NumeroIngles(FieldByName('SALPARTICIPACAO').AsCurrency)     + ' AS SALPARTICIPACAO, ' + #13 +
            '  ' + NumeroIngles(FieldByName('SALMANTIDO').AsCurrency)          + ' AS SALMANTIDO, '      + #13 +
            '  ' + NumeroIngles(FieldByName('SALAUXDOENCA').AsCurrency)        + ' AS SALAUXDOENCA, '    + #13 +
            '  ' + NumeroIngles(FieldByName('VALORATUAL').AsCurrency)          + ' AS VALORATUAL, '      + #13 +
            '  ' + FieldByName('IDBENEFICIO').AsString                         + ' AS IDBENEFICIO, '     + #13 +
            '  ' + FieldByName('IDSITBENEFICIO').AsString                      + ' AS IDSITBENEFICIO, '  + #13 +
            '  ' + FieldByName('IDSITPART').AsString                           + ' AS IDSITPART, '       + #13 +
            '  ' + FieldByName('IDPESSJUR').AsString                           + ' AS IDPESSJUR, '       + #13 +
            '  ' + qryIDBENEF.AsString                                         + ' AS IDTITULAR, '       + #13 +
            '  ' + FieldByName('IDPLANOPREV').AsString                         + ' AS IDPLANOPREV, '     + #13 +
            '  ' + FieldByName('FLGDIRETOR').AsString                          + ' AS FLGEXDIRETOR, '    + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', DBedtDataInsc.Date)) + ' AS DATASOLIC, '       + #13 +
            ' 00 '                                                             + ' AS FLGLOTE, '         + #13 +
            '  ' + QuotedStr(FieldByName('DATANASC').AsString)                 + ' AS DATANASC, '        + #13 +
            ' 1'                                                               + ' AS SEQPROPOSTA, '     + #13 +
            '  ' + QuotedStr(FieldByName('SEXO').AsString)                     + ' AS SEXO '             + #13 +
            'FROM DUAL '                                                 + #13;
            //Fim Pendência 25953

         Next;
         if not(EOF) then sSQL := sSQL + 'UNION ' + #13;
      end;

      Close;

      if not(dtmEmptmo.qryParamEmptmoIDREGRAAVAL.IsNull) then
      begin
         UtilizaRegraBool(dtmEmptmo.qryParamEmptmoIDREGRAAVAL.AsInteger, sSQL, 'e Obriga Avalista', sResultado, True);

         if UpperCase(sResultado) = 'TRUE' then
         begin
            Result := True
         end
         else
         begin
            Result := False;
         end;
      end;

   end;
end;



procedure TfrmCadInscricao.DBrdgCreditoEnter(Sender: TObject);
begin
   inherited;
   sFormaCredAnt := qryFLGFORMAPAG.AsString;
end;



procedure TfrmCadInscricao.chkExcepcionalClick(Sender: TObject);
begin
   inherited;

   // André Pontes - 22/12/2003 - FUNCEF
   if chkExcepcional.Checked then
   begin
      btnIncluirQuitar.Visible := True;
      btnRetirarQuitar.Visible := True;
   end
   else
   begin
      //Pendência 23429 - 28/09/2006 - Alberto
      btnIncluirQuitar.Visible := qryTipoContratoTCEMAXCONTRATO.AsInteger > 1;
      btnRetirarQuitar.Visible := qryTipoContratoTCEMAXCONTRATO.AsInteger > 1;
      //Fim Pendência 23429
   end;
   // FIM André Pontes - 22/12/2003 - FUNCEF
end;



function TfrmCadInscricao.PermiteQuitacao(const IDTipoContr : Integer;
                                          const IDTipoQuit  : Integer
                                         ): boolean;
begin
   LimpaParametros(qryTipoContrXQuit);
   qryTipoContrXQuit.ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := IDTipoContr;
   qryTipoContrXQuit.ParamByName('PIDTIPOCONTRQUIT').AsInteger    := IDTipoQuit;
   qryTipoContrXQuit.Open;

   Result := qryTipoContrXQuitQUANTIDADE.AsInteger > 0;

   LimpaParametros(qryTipoContrXQuit);
end;



function TfrmCadInscricao.PrimeiraRenovacao2006: Boolean;
var
   sSQL           : String;
   qryRenovacao   : TwwQuery;
begin
   Result := False;

   qryRenovacao               := TwwQuery.Create(Application);
   qryRenovacao.DatabaseName  := 'BaseDados';

   try
      sSQL :=
      'SELECT '                                                                                       + #13 +
      '   COUNT(IDCONTRATOEMPTMO) AS QUANT '                                                          + #13 +
      'FROM '                                                                                         + #13 +
      '   CONTRATOEMPTMO CON '                                                                        + #13 +
      'WHERE '                                                                                        + #13 +
      '       CON.FLGSITUACAO      <> (''C'') '                                                       + #13 +
      '   AND CON.DATACREDITO       > TO_DATE(''03/01/2006'', ''DD/MM/YYYY'') '                       + #13 +
      '   AND CON.IDPESSOA          = ' + FormatFloat('#0', qryIDPESSOA.AsFloat)                      + #13 +
      '   AND CON.IDBENEF           = ' + FormatFloat('#0', qryIDBENEF.AsFloat)                       + #13 +
      '   AND CON.IDTIPOCONTREMPTMO = ' + FormatFloat('#0', qryTipoContratoIDTIPOCONTREMPTMO.AsFloat);

      qryRenovacao.SQL.Text := sSQL;
      qryRenovacao.Open;

      Result := qryRenovacao.FieldByName('QUANT').AsInteger = 0;

   finally
      qryRenovacao.Close;
      qryRenovacao.Free;
   end;
end;



procedure TfrmCadInscricao.bbtnSairClick(Sender: TObject);
begin
   Application.ProcessMessages;

   inherited;
end;



procedure TfrmCadInscricao.DBspeParcelasAfterDownClick(Sender: TObject);
begin
  inherited;
  DBspeParcelas.SetFocus;
end;



function TfrmCadInscricao.VerificaCarenciaPorContratosQuitaveis: Boolean;
begin
   Result := True;
   qryContratosAnteriores.DisableControls;
   qryContratosAnteriores.First;

   LimpaParametros(qryVerificaCarencia);
   qryVerificaCarencia.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
   qryVerificaCarencia.Open;

   while not qryContratosAnteriores.Eof do
   begin
      // Marchetti - Pendencia 26614
      // Somente verifica carencia se o contrato estiver marcado para ser quitado
      if qryContratosAnterioresFLGESCOLHA.AsInteger = 1 then
      begin
         qryVerificaCarencia.First;
         if qryVerificaCarencia.Locate('IDTIPOCONTREMPTMO',qryContratosAnterioresIDTIPOCONTREMPTMO.AsInteger,[]) then
         begin
            if (qryVerificaCarencia.FieldByName('TCEMINRENOVA').AsInteger > 0) and
               (qryContratosAnterioresNUMPARCPAGAS.AsInteger < qryVerificaCarencia.FieldByName('TCEMINRENOVA').AsInteger) then
            begin
               Result := False;
               Break;
            end;
         end;
      end;
      // Fim Marchetti - Pendencia 26614
      qryContratosAnteriores.Next;
   end;

   qryVerificaCarencia.Close;
   qryContratosAnteriores.First;
   qryContratosAnteriores.EnableControls;
end;

//Pendência 27232 - 18/04/2008
{
function TfrmCadInscricao.TipoContratoPermitidoParaConcessao: Boolean;
begin
   Result := True;
   if ((qryIDTIPOCONTREMPTMO.AsInteger = 11) and (qryContratosAnteriores2IDTIPOCONTREMPTMO.AsInteger in [11, 12, 13])) or
      ((qryIDTIPOCONTREMPTMO.AsInteger = 12) and (qryContratosAnteriores2IDTIPOCONTREMPTMO.AsInteger in [11, 12, 13])) or
      ((qryIDTIPOCONTREMPTMO.AsInteger = 13) and (qryContratosAnteriores2IDTIPOCONTREMPTMO.AsInteger in [11, 12, 13])) or
      ((qryIDTIPOCONTREMPTMO.AsInteger = 14) and (qryContratosAnteriores2IDTIPOCONTREMPTMO.AsInteger in [14, 15, 16])) or
      ((qryIDTIPOCONTREMPTMO.AsInteger = 15) and (qryContratosAnteriores2IDTIPOCONTREMPTMO.AsInteger in [14, 15, 16])) or
      ((qryIDTIPOCONTREMPTMO.AsInteger = 16) and (qryContratosAnteriores2IDTIPOCONTREMPTMO.AsInteger in [14, 15, 16])) then
      Result := False;
end;
}


procedure TfrmCadInscricao.rdgMargemConsignavelClick(Sender: TObject);
begin
   inherited;

   rdgMargemConsignavel.Checked := not rdgMargemAlt.Checked;
   rdgMargemAlt.Checked         := not rdgMargemConsignavel.Checked;

   if   rdgMargemConsignavel.Checked then
   begin
      edtValMargem.Value := qryVLRMARGEM.AsCurrency;
      fVlrMargem := edtValMargem.Value;
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);
      rNovoContrato.FlgUsaMargemAlt   := 0;
      DBEdtMargemExit(Self);
      // Thiago Melo SOL 183326 Kintana 1712188
      CalculaParcela(0);
      //
   end
   else
   begin
      edtValMargem.Value := edtValMargemAlt.Value;
      fVlrMargem := edtValMargemAlt.Value;
      PreencheDadosContrato(qryNUMPARCELAS.AsInteger);
      rNovoContrato.FlgUsaMargemAlt   := 1;
      dbEdtMargemAltExit(Self);
      // Thiago Melo SOL 183326 Kintana 1712188
      CalculaParcela(0);
      //
   end;

   // Marchetti - Pendencia 26806
   AcertaDataPrimParcela;
end;



procedure TfrmCadInscricao.dbEdtMargemAltExit(Sender: TObject);
begin
   inherited;

   if (ActiveControl = bbtnCancelar) or (ActiveControl = bbtnSair) then Exit;

   if (qryVLRMARGEM.AsCurrency <> qryVLRMARGEMALT.AsCurrency) or (Sistema.TipoCliente = 20071) then
   begin
      fVlrSalBase           := qryVLRSALBASE.AsCurrency;
      edtValMargemAlt.Value := qryVLRMARGEMALT.AsCurrency;

      fVlrMaxPermit         := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                                           qryIDSITPART.AsInteger,
                                                           edtPercentJuros.Value,
                                                           edtValMargemAlt.Value,
                                                           edtValReserva.Value,
                                                           edtSaldoAQuitar.Value + fVlrTotalDividas,
                                                           edtQuitacao.Value,
                                                           edtSalParticipacao.Value,
                                                           edtSalMantido.Value,
                                                           edtSalAuxDoenca.Value,
                                                           edtSalBenef.Value,
                                                           fVlrSalBase,
                                                           True, (* Mostra *)
                                                           //Pendência 26951 - 03/12/2007
                                                           vDividasAnteriores,
                                                           //Pendência 22836 - 03/10/2006 - Alberto
                                                           0,
                                                           chkExcepcional.Checked,
                                                           //Fim Pendência 22836
                                                           qryContratosAnteriores,
                                                           //Fim Pendência 26951
                                                           // SOL:108099 Daniel Begnami
                                                           StrToInt(edtPrazoSuspensao.text),
                                                           iIDTipoSuspEmptmo
                                                           // FIM
                                                          );

      if qry.State in dsEditModes then
      begin
         qryVLRSALBASE.AsCurrency   := fVlrSalBase;
         qryVLRMARGEMALT.AsCurrency := edtValMargemAlt.Value;
         qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
         edtLimiteDisp.Value        := qryVLRMAXPERMIT.AsCurrency - edtSaldoAQuitar.Value - fVlrTotalDividas;
      end;

      (* dispara recálculo se valor solicitado estiver zerado ou
                           se valor solicitado > máximo permitido *)
      if ( ( (qryVLRMAXPERMIT.AsCurrency > 0) and (qryVLRSOLIC.AsCurrency = 0) ) or
           ( ((qryVLRMAXPERMIT.AsCurrency < qryVLRSOLIC.AsCurrency) and
              not(chkExcepcional.Checked)) ) ) then
      begin
         SetTxJuros;
         //Pendência 22645 - 23/06/2006 - Alberto
         ActiveControl.SetFocus;
         //Fim Pendência 22645
      end;

   end;
end;


function TfrmCadInscricao.CalculaValoresAposMarcarParaQuitacao: Boolean;
begin

   Result := True;
   
   // função da unit UCalcEmptmo que busca a Margem Consignável do participante
   edtValMargem.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger,
                                                qryIDBENEF.AsInteger,
                                                qryTipoContratoIDREGRAMARGEM.AsInteger,
                                                fVlrSalBase,
                                                edtTotalParcelas.Value,
                                                edtTotalPendencias.Value,
                                                fSalParticipacao,
                                                fSalMantido,
                                                fSalAuxDoenca,
                                                fSalBenef,
                                                True,
                                                qryDATAINSC.AsDateTime,
                                                qryNUMPARCELAS.AsInteger,

                                                vDividasAnteriores,

                                                chkFinanciamento.Checked,
                                                //Pendência 22836 - 03/10/2006 - Alberto
                                                0,
                                                chkExcepcional.Checked,
                                                //Fim Pendência 22836
                                                DBedtDataInsc.Text, // Renato Visoni SOL 129432 Kintana 709925
                                                edtDataCredito.Text, // Ádler Souza - SOL 131189 Kintana 744558
                                                0, // Ádler Souza - SOL 75516 Kintana 523281
                                                -1, //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                                qryIDPLANOPREV.AsFloat //BRUNO AZEVEDO SOL 145941 KINTANA 984808
                                               );

   fVlrMargem := edtValMargem.Value;

   if qry.State in dsEditModes then
   begin
      qryVLRMARGEM.AsCurrency    := fVlrMargem;
   end;
   // Ádler Souza  - SOL 144704 - KTN 968693
   {if fVlrMargem = -1 then
   begin
      Result := False;
      Exit;
   end;}
   //Fim - Ádler Souza  - SOL 144704 - KTN 968693

   fVlrMaxPermit := CalcEmptmo.BuscaVlrSolicMax(rNovoContrato,
                                            qryIDSITPART.AsInteger,
                                            edtPercentJuros.Value,
                                            edtValMargem.Value,
                                            edtValReserva.Value,
                                            edtSaldoAQuitar.Value + fVlrTotalDividas,
                                            edtQuitacao.Value + edtQuitacaoDividas.Value,
                                            edtSalParticipacao.Value,
                                            edtSalMantido.Value,
                                            edtSalAuxDoenca.Value,
                                            edtSalBenef.Value,
                                            fVlrSalBase,
                                            True,   // Mostra
                                            //Pendência 26951 - 03/12/2007
                                            vDividasAnteriores,
                                            //Pendência 22836 - 03/10/2006 - Alberto
                                            0,
                                            chkExcepcional.Checked,
                                            //Fim Pendência 22836
                                            qryContratosAnteriores,
                                            //Fim Pendência 26951
                                            // SOL:108099 Daniel Begnami
                                            StrToInt(edtPrazoSuspensao.text),
                                            iIDTipoSuspEmptmo
                                            // FIM
                                           );

   if qry.State in dsEditModes then
   begin
      qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
   end;

   if fVlrMaxPermit = -1 then
   begin
      Result := False;
      Exit;
   end;

   // Thiago Melo SOL 183326 Kintana 1712188
   CalculaParcela(0);
   //
end;

procedure TfrmCadInscricao.qryContratosAnterioresAfterScroll(DataSet: TDataSet);
begin
   inherited;
   btnRetirarQuitar.Enabled := True;
   btnIncluirQuitar.Enabled := True;
   if (qryContratosAnterioresFLGOBRIGATORIO.AsInteger = 1) and (qryContratosAnterioresFLGESCOLHA.AsInteger = 1) then
   begin
      btnIncluirQuitar.Enabled := False;
      btnRetirarQuitar.Enabled := False;
   end;
end;

// SOL:108099 Daniel Begnami
procedure TfrmCadInscricao.CriaPanelSuspParc(pNumParcela: Integer);
var
  i : integer;
  ParcelasSuspensao : TParcelasSuspensao;
begin
  try

    pnSuspParc.height := 127;
    pnSuspParc.Width  := 196;
    pnSuspParc.Top    := 167;
    pnSuspParc.Left   := 422;

    ParcelasSuspensao := TParcelasSuspensao.Create;
    rgSuspParc.Items.Clear;

    for i := 0 to pNumParcela-1 do
    begin
      ParcelasSuspensao.Parcela := IntToStr(i+1);
      rgSuspParc.Items.AddObject(ParcelasSuspensao.Parcela, ParcelasSuspensao);
    end;

    if (rgSuspParc.Items.Count > 0) then
    begin
      btMudaPrazoSuspensao.Enabled := True;
      btnLimpaSuspensao.Enabled    := True;
      pnSuspParc.Visible := True;
      rgSuspParc.setfocus;
    end
    else
    begin
      edtPrazoSuspensao.text := IntToStr(0);
      btMudaPrazoSuspensao.Enabled := False;
      pnSuspParc.Visible := False;
    end;

  finally
    if assigned(ParcelasSuspensao) then
      FreeAndNil(ParcelasSuspensao);
  end;
end;
// FIM

// SOL:108099 Daniel Begnami
procedure TfrmCadInscricao.btMudaPrazoSuspensaoClick(Sender: TObject);
begin
  inherited;
  if (rgSuspParc.ItemIndex = -1) then
  begin
    ShowMessage('ATENÇÃO: Selecione o número de parcelas desejado!');
    rgSuspParc.SetFocus;
  end
  else
    if (rgSuspParc.Items.Count > 0) then
      pnSuspParc.visible := not pnSuspParc.visible;
end;
// FIM

// SOL:108099 Daniel Begnami
procedure TfrmCadInscricao.rgSuspParcClick(Sender: TObject);
begin
  inherited;
  if (rgSuspParc.ItemIndex <> -1) then
  begin
    edtPrazoSuspensao.text := rgSuspParc.Items.Strings[rgSuspParc.ItemIndex];
    pnSuspParc.Visible := False;

    if (StrToInt(edtPrazoSuspensao.text) > 0) then
    begin
      edtDataFinalSuspensao.date := Self.CalculaDTSuspParc(StrToInt(edtPrazoSuspensao.text), edtDataPrimParcela.date);

      dDataFinalSuspensao        := edtDataFinalSuspensao.date;

      Self.SetTxJuros;

      edtValorParcSusp.value     := Self.CalculaVLSuspParc(edtValorParcela.value);
    end;

  end;
  pnSuspParc.Visible := False;
end;
// FIM

// SOL:108099 Daniel Begnami
procedure TfrmCadInscricao.rgSuspParcExit(Sender: TObject);
begin
  inherited;
  if (rgSuspParc.ItemIndex = -1) then
  begin
    ShowMessage('ATENÇÃO: Selecione o número de parcelas desejado!');
    if pnSuspParc.visible then
      rgSuspParc.SetFocus;
  end
end;
// FIM

// SOL:108099 Daniel Begnami
function TfrmCadInscricao.CalculaDTSuspParc(
  pQtdeMesesSusp: Integer ; pDataPrimParcela : TDate): TDate;
begin

  //Result := IncMonth(pDataPrimParcela, pQtdeMesesSusp);
  Result := IncMonth(pDataPrimParcela, (pQtdeMesesSusp-1)); //Renato Visoni SOL 116121 Kintana 544992
  
end;
// FIM

// SOL:108099 Daniel Begnami
function TfrmCadInscricao.CalculaVLSuspParc(pPrestacaoBasica: Currency): Currency;
begin
  Result := ((pPrestacaoBasica * dtmLookEmptmo.qryLookTipoSuspPERCENTUAL.AsCurrency) / 100);
end;
// FIM

// SOL:108099 Daniel Begnami
procedure TfrmCadInscricao.edtValorParcelaChange(Sender: TObject);
begin
  inherited;
  if ((trim(DBcboSuspensao.LookupValue) <> EmptyStr) and (dtmLookEmptmo.qryLookTipoSuspPERCENTUAL.AsCurrency <> -1) and (edtValorParcela.value <> 0)) then
    edtValorParcSusp.value := Self.CalculaVLSuspParc(edtValorParcela.value);
end;
// FIM

// SOL:108099 Daniel Begnami
procedure TfrmCadInscricao.btnLimpaSuspensaoClick(Sender: TObject);
begin
  inherited;
  DBcboSuspensao.LookupValue := '';
  iIDTipoSuspEmptmo := -1;
  rNovoContrato.IDTipoSuspEmptmo := -1;
  edtDataFinalSuspensao.date := 0;
  edtPrazoSuspensao.text := IntToStr(0);
  edtValorParcSusp.value := 0;
  DBcboSuspensao.text := '';
  btMudaPrazoSuspensao.Enabled := False;
  btnLimpaSuspensao.Enabled    := False;

  pnSuspParc.visible := False;

  Self.SetTxJuros;
end;
// FIM

// Vini - Início
function TfrmCadInscricao.VerificaExPlaContabil(StrExPlaContabilBloq : string; StrExPlaContabilPessoa : string): Boolean;
var
  Lista, Lista2 :TStringList;
  i,i2 :Integer;
  Branco :Boolean;
  sTemp, sTemp2, sChar, sExpressao, sExpressao2 :String;
begin
   inherited;
      Result := False;

      Branco:= False;
      schar := ',';

      sExpressao := StrExPlaContabilBloq;
      sExpressao := Trim(sExpressao) + sChar;
      Lista := TStringlist.Create;
      sTemp := '';

      sExpressao2 := StrExPlaContabilPessoa;
      sExpressao2 := Trim(sExpressao2) + sChar;
      Lista2 := TStringlist.Create;
      sTemp2 := '';

      i := 1;

      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);
          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;
        Inc(i);
      end;

      i := 1;

      while i <= Length(sExpressao2) do begin
        if (Copy(sExpressao2, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);
          if ((sTemp2 = '') and (Branco)) or (sTemp2 <> '') then begin
            Lista2.Add(sTemp2);
          end;
          sTemp2 := '';
        end else begin
          sTemp2 := sTemp2 + Copy(sExpressao2, i, 1);
        end;
        Inc(i);
      end;

      for i:= 0 to Lista.Count - 1 Do
      Begin
        For i2:= 0 to Lista2.Count - 1 Do
        begin
          if Lista[i] = Lista2[i2] then
            Result := True;
        End;
      End;
end;
// Vini - Fim

//Monica Gonzaga - SOL156456 inicio
procedure TfrmCadInscricao.chkLiquidoZeroClick(Sender: TObject);
begin
  inherited;

  // Thiago Melo SOL 183326 Kintana 1712188
  CalculaParcela(1);
  //

end;
//Monica Gonzaga - SOL156456 FIM

//William Moreira da Silva - SOL 206168 Kintana 1995405 - INICIO
procedure TfrmCadInscricao.edtDataCreditoChange(Sender: TObject);
begin
  inherited;


  if trim(edtDataCredito.Text) <> EmptyStr then
  begin
  AbreQueriesDividas;
  qryContratosAnteriores2.First;
  while not(qryContratosAnteriores2.EOF) do
  begin

     if not(chkExcepcional.Checked) then
     begin
        if CalcEmptmo.ExistemItensEmAberto(qryContratosAnteriores2IDCONTRATOEMPTMO.AsFloat,
                                           True,
                                           edtDataCredito.Date,
                                           True,
                                           StrToInt(FormatDateTime('yyyy', edtDataCredito.Date)),
                                           StrToInt(FormatDateTime('mm', edtDataCredito.Date)),
                                           // SOL 179805 Kintana 1659409 - Thiago Dantas Melo
                                           1
                                          //Pendência 27232 - 16/04/2008
                                          //) then
                                          ) <> 0 then
        begin
           MsgDlg('Mutuário possui débitos anteriores em aberto. NÃO será possível conceder Empréstimo para o mesmo.', 'Empréstimo', mtError, [mbOk], 0);
           Repaint;
           Exit;
        end;
     end;
     qryContratosAnteriores2.Next;
  end;
  end;
     //William Moreira da Silva - SOL 206168 Kintana 1995405 - FIM 
end;

//Inicio TADEU PASSOS SOL 196724 Kintana 1899039
//Inicio William Santana SOL 196724 KIN 1899039
function TfrmCadInscricao.VerificaAmortizacao : Boolean;
begin

  bTemAmortizacaoNaoEnviada   := false;
  Result := True;

   // Verifica se o Mutuário possui contrato com solicitação de amortização
   // Com data Amortização menor que data de quitação
   qryContratosAnteriores.first;
   qryContratosAnteriores.Filtered := False;
   qryContratosAnteriores.Filter   := 'FLGESCOLHA = 1';
   qryContratosAnteriores.Filtered := True;

   while not qryContratosAnteriores.eof do
   begin
    qryVerificaAmortizacao.Close;
    qryVerificaAmortizacao.Params[0].AsString  := floattostr(qryContratosAnterioresIDContratoEmptmo.AsFloat);
    qryVerificaAmortizacao.Params[1].AsString  := edtDataCredito.text;
    qryVerificaAmortizacao.Open;

      //verificação se há amontizações enviadas  
      qryVerificaAmortizacao.Filtered := False;
      qryVerificaAmortizacao.Filter   := 'FLGENVIO <> 0';
      qryVerificaAmortizacao.Filtered := True;

      while not qryVerificaAmortizacao.Eof do
      begin
          if qryVerificaAmortizacaoFLGENVIO.AsInteger <> 0 then // Enviado
          begin
            MsgDlg('Existe uma amortização enviada para ' + qryVerificaAmortizacaoHMEDATAPREVISTA.AsString + ', mas ainda não recebida. ' +
                   'A concessão só poderá ser efetuada após a confirmação do débito.', 'Empréstimo', mtInformation, [mbOk] , 0);
            Result := False;
            Exit;
          end;
         qryVerificaAmortizacao.Next;
      end;

    qryContratosAnteriores.next;
   end;

    qryContratosAnteriores.first;
    while not qryContratosAnteriores.eof do
    begin    //verificação se há amontizações não enviadas

      qryVerificaAmortizacao.Close;
      qryVerificaAmortizacao.Params[0].AsString  := floattostr(qryContratosAnterioresIDContratoEmptmo.AsFloat);
      qryVerificaAmortizacao.Params[1].AsString  := edtDataCredito.text;
      qryVerificaAmortizacao.Open;

      qryVerificaAmortizacao.Filtered := False;
      qryVerificaAmortizacao.Filter   := 'FLGENVIO = 0';
      qryVerificaAmortizacao.Filtered := True;

      while not qryVerificaAmortizacao.Eof do
      begin
          // Não Enviado
            if not(bTemAmortizacaoNaoEnviada) then
            begin
              if MsgDlg('Existe amortização lançada no contrato anterior para o dia ' + qryVerificaAmortizacaoHMEDATAPREVISTA.AsString +
                        '. Deseja cancelar a amortização e efetivar a concessão?', 'Empréstimo',
                        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
              begin
                Result := False; // aborta processo
                Exit;
              end;
            end;
            bTemAmortizacaoNaoEnviada := true;

        qryVerificaAmortizacao.Next;
      end;

     qryContratosAnteriores.next;
    end;

   qryVerificaAmortizacao.Filtered := False;
end;
//Fim William Santana SOL 196724 Kintana 1899039
//Fim TADEU PASSOS SOL 196724 Kintana 1899039

end.
