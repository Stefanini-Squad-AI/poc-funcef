unit FCadDepenBenef;

// Alterações :
{------------------------------------------------------------------------------
Nº SIG:.............: MIGRACAO-ORACLE
Data da Alteração...: 16/10/2025
Responsável.........: Edilaine
Descrição...........: Cast de campos para Varchar2
--------------------------------------------------------------------------------
Nº WO:..............: 20730
Data da Alteração...: 28/04/2025
Responsável.........: Leandro Pocebon
Descrição...........: Inclusão Tributação IR para o dependente
--------------------------------------------------------------------------------
Rotina..............: Alteração no componente -> updDepBen
Nº SIG:.............: 135429
Data da Alteração...: 12/05/2023
Responsável.........: Marcos Lima
Descrição...........: Erro na inclusão de CPF para o IR
--------------------------------------------------------------------------------
Nº WO:..............: 1156 
Data da Alteração...: 13/07/2023
Responsável.........: Andre Imakawa
Descrição...........: Ajuste dblkpcmbNaturalidade
--------------------------------------------------------------------------------
Nº SIG:.............: 136772 
Data da Alteração...: 19/06/2023
Responsável.........: Luis Ferrari
Descrição...........: Ajuste na alteração do campo Email Funcef que não atualizava.
--------------------------------------------------------------------------------
Nº SIG:.............: 136301 
Data da Alteração...: 26/05/2023
Responsável.........: Cássio Florencio Rovaroto
Descrição...........: Atribuição automática do nome do endereço.
--------------------------------------------------------------------------------
Rotina..............: (dfm)  udpDepBen, qryDet
Nº SIG:.............: 135385
Data da Alteração...: 05/05/2023 
Responsável.........: Edilaine
Descrição...........: Erro ao alterar Depend. de Beneficiario
--------------------------------------------------------------------------------
Rotina..............:
Nº SIG:.............: 128969
Data da Alteração...: 15/09/2022
Responsável.........: Luis Ferrari / Edilaine
Descrição...........: Desfazer SIG126319 e apresentar Representante Legal na Consulta Geral
--------------------------------------------------------------------------------
Rotina..............: qryReprLegalBeforePost e Criado qryReprLegalAfterDelete
Nº SIG:.............: 126319
Data da Alteração...: 17/06/2022
Responsável.........: Luis Ferrari
Descrição...........: Alteração IdResponsavel na BFCIARIOTITPLAN e  criação do qryReprLegalAfterDelete
--------------------------------------------------------------------------------
Rotina..............: DataUltimaAlteracao
Nº SIG:.............: 71037
Data da Alteração...: 28/04/2022
Responsável.........: Luis Ferrari
Descrição...........: Inclusão de 2 novos flag FLGPLANOSAUDE e inclusão de novo motivo
--------------------------------------------------------------------------------
Rotina..............: DataUltimaAlteracao
Nº SIG:.............: 120500
Data da Alteração...: 28/10/2021
Responsável.........: Edilaine
Descrição...........: Ajuste na verifiçao de alteração nas útimas 24h do cadastro
--------------------------------------------------------------------------------
Rotina..............: DataUltimaAlteracao
Nº SIG:.............: 119407
Data da Alteração...: 15/09/2021
Responsável.........: Edilaine
Descrição...........: Ajuste na verifiçao de alteração nas útimas 24h do cadastro
--------------------------------------------------------------------------------
Rotina..............: (dfm) qryPais, dblkpcmbNacionalidadeExit
Nº SIG:.............: 102548
Data da Alteração...: 29/09/2020
Responsável.........: Edilaine
Descrição...........: não permite selecionar cidades para nacionalidade Portuguesa
--------------------------------------------------------------------------------
Nº SIG:.............: 90282
Data da Alteração...: 15/08/2019
Responsável.........: Darivaldo Alencar
Descrição...........: Erro ao excluir todos os dependente
--------------------------------------------------------------------------------
Nº SIG:.............: 90164
Data da Alteração...: 13/08/2019
Responsável.........: Fabio Sampaio
Descrição...........: Correção na alteração do tipo de endereço para não perder
                      os outros tipos já registrados na tabela pessoa.
--------------------------------------------------------------------------------
Nº SIG:.............: 83035
Data da Alteração...: 08/02/2019
Responsável.........: Taffarel Sevaybriker
Descrição...........: Ajuste para salvar corretamente alteração de naturalidade.
--------------------------------------------------------------------------------
Nº SIG:.............: 79881
Data da Alteração...: 17/01/2019
Responsável.........: Darivaldo Alencar
Descrição...........: Verificar status do CDS antes de atualizar.
--------------------------------------------------------------------------------
Nº SIG:.............: 80745
Data da Alteração...: 18/01/2019
Responsável.........: Everson Cunha
Descrição...........: O sistema estava apresentando erro generico de SQL quando
                      o usuário inseria o primeiro dependente. Faltava trata_
                      mento para a query vazia.
--------------------------------------------------------------------------------
Nº SIG:.............: 80209
Data da Alteração...: 03/01/2019
Responsável.........: Fábio Sampaio
Descrição...........: Correção da rotina de ExcedeCemPorCento para evitar erro
                      quando o campo PERCENTUAL for nulo.
--------------------------------------------------------------------------------
Nº SIG:.............: 79893
Data da Alteração...: 21/12/2018
Responsável.........: Everson Cunha
Descrição...........: Habilitar a edição da aba Documentos, mesmo que o
                      dependente esteja cancelado.
--------------------------------------------------------------------------------
Nº SIG:.............: 76515
Data da Alteração...: 11/12/2018
Responsável.........: Everson Luiz Pereira da Cunha
Descrição...........: Habilitar os botões de Incluir e Excluir das
                      abas: Benefícios, Conta Bancária e Outras Informações,
                      mesmo que o dependente esteja cancelado.
--------------------------------------------------------------------------------
Nº SIG:.............: SIG78754
Data da Alteração...: 26/11/2018
Responsável.........: Everson Luiz Pereira da Cunha
Descrição...........: Ajuste na dblkpcmbNaturalidade (Combo Naturalidade)
                      Alterado o DataField, de CODESTADO para IDESTADO
                      Incluído o campo IDESTADO no updPF (Update e Insert)
--------------------------------------------------------------------------------
Nº SIG:.............: SIG TIBERO
Data da Alteração...: 30/10/2018
Responsável.........: Andre Imakawa
Descrição...........: Inclusão do order by na qryAgencia
--------------------------------------------------------------------------------
Nº SIG..............: 77525 - TIBERO
Data da Alteração...: 29/10/2018
Responsável.........: Andre Imakawa
Descrição...........: Correção Relatorio
------------------------------------------------------------------------------
Alteração...........: .dfm qryEndPess
Nº SIG..............: 77119 - TIBERO
Data da Alteração...: 17/08/2018
Responsável.........: Everson Luiz Pereira da Cunha
Descrição...........: Inclusão do campo EP.CODESTADO na qryEndPess 
------------------------------------------------------------------------------
Alteração...........: (dfm aba ContaBancaria, qryCBanco, updCBanco, qryContatoTel, qryDet)
Nº SIG..............: 25312
Data da Alteração...: 20/02/2017
Responsável.........: William Moreira da Silva | Darivaldo Alencar | Andre Imakawa |
                      Edilaine Ferraresi
Descrição...........: Reestruturação da tela de dependentes
		                  - Utilizar tabela Motivo e correção do e-mail.
------------------------------------------------------------------------------
Nº SIG...........: 73515
Data da Alteração: 16/08/2018
Responsável......: Taffarel Sevaybriker
Descrição........: Ajuste no posicionamento do painel de dependentes não cadastrados
                   que não estava sendo exibido corretamente (.dfm).
--------------------------------------------------------------------------------
Nº SIG...........: 68507/71228
Data da Alteração: 06/07/2018
Responsável......: Taffarel Sevaybriker
Descrição........: Ajuste no histórico de moléstia grave.
--------------------------------------------------------------------------------
Nº SIG...........: 70416
Data da Alteração: 19/06/2018
Responsável......: Luiz Carlos
Descrição........: Ajuste na gravação de endereço na endpess
--------------------------------------------------------------------------------
Nº SIG...........: 68507
Data da Alteração: 25/05/2018
Responsável......: Andre Imakawa
Descrição........: Alteração do layout na aba Dados Pessoais (.dfm)
--------------------------------------------------------------------------------
Nº SIG...........: SIG TIBERO
Data da Alteração: 27/02/2018
Responsável......: Everson Luiz Pereira da Cunha
Descrição........: Melhoria no Planus para adequação ao TIBERO.
                   Inclusão de alias nas tabelas e campos.
                   Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Alteração........: (dfm) cmbCidade
Nº SIG...........: 66999
Data da Alteração: 25/04/2018
Responsável......: Denis Horongoso
Descrição........: Apresentar o código da UF ao lado do nome da cidade.
------------------------------------------------------------------------------
Alteração........: (dfm) qryBeneficios
Nº SIG...........: 49076
Data da Alteração: 08/02/2018
Responsável......: Edilaine
Descrição........: não traz beneficios para associação quando plano está desativado
--------------------------------------------------------------------------------
Nº SIG...........: 50670
Data da Alteração: 17/07/2017
Responsável......: André Imakawa
Descrição........: Erro ao carregar estado da aba endereço.
------------------------------------------------------------------------------
Nº SIG...........: 42936
Data da Alteração: 31/03/2017
Responsável......: Marcelo Cardoso Santos Filho
Descrição........: Alterando o UF indevidamente
------------------------------------------------------------------------------
Nº SIG...........: 27871
Data da Alteração:  25/11/2016
Responsável......: Darivaldo Alencar
Descrição........: Buscando atender a legislação, Instrução PREVIC nº 18 de 24/12/2014,
                   favor criar os seguintes campos no cadastro dos participantes:
                   Nome do conjuge; Cargo, emprego ou função pública; Órgão;
                   Período (data início e data fim).
-----------------------------------------------------------------------------------------
Nº SIG...........: 33998
Data da Alteração: 23/11/2016
Responsável......: André Imakawa
Descrição........: Necessario incluir o campo NOMENACIONALIDADE no objeto qryPais.
                   Alteração no DFM.
------------------------------------------------------------------------------
Nº SIG...........: 33695
Data da Alteração:  17/11/2016
Responsável......: Darivaldo Alencar
Descrição........: habilitar e exibir documentos de acordo com permissões no globalcm
-----------------------------------------------------------------------------------------

Nº SIG:........... 25313
Data da Alteração: 30/08/2016
Responsável......: Edilaine
Descrição........: regra para que ao cadastrar um dependente com grau de parentesco
                   "Cônjuge/equip" e "Companheiro" a idade do dependente seja >= 16 anos
------------------------------------------------------------------------------
Nº SIG:..........: 30403
Data da Alteração: 06/10/2016
Responsável......: Peterson Victor
Descrição........: Alterando o estado indevidamente
***************************************************************************************
Nº SIG:........... 29884
Data da Alteração: 29/09/2016
Responsável......: Peterson Victor
Descrição........: Não estava mostrando o estado correto
***************************************************************************************
Nº SIG:........... 20771
Nº PPM...........:
Data da Alteração: 19/05/2016
Responsável......: Michelle Mota
Descrição........: Erro na constraint que consiste IDPAIS e CODESTADO (R_2035)
                   Inclusão de filtro nas querys de estado e cidade para CIDADE
                   e NATURALIDADE - Dados Pessoais - Dependentes - Participante.
------------------------------------------------------------------------------
Nº SIG:........... 19040
Nº PPM...........:
Data da Alteração: 15/04/2016
Responsável......: William Santana
Descrição........: o desfazer da última implementação realizada no módulo CADASTROPREV,
                   pela entrega do SOL 268568,
***************************************************************************************
Nº SOL:........... 270959
Nº PPM...........: 1342331
Data da Alteração: 22/3/2016
Responsável......: Wil0liam Moreira da Silva
Descrição........: Erro ao alterar nome do Dependente
***************************************************************************************
Nº SOL:........... 270369
Nº PPM...........: 1333987
Data da Alteração: 16/03/2016
Responsável......: William Moreira da Silva
Descrição........: Inconsistência Cadastro de Dependentes
***************************************************************************************
Nº SOL:........... 268568
Nº PPM...........: 1284501
Data da Alteração: 25/02/2016
Responsável......: Peterson victor
Descrição........: Alteração da regra para atualização da tabela BFCIARIOTITPLAN
***************************************************************************************
Nº SOL:........... 269417
Nº PPM...........: 1295377
Data da Alteração: 19/02/2016
Responsável......: William Moreira da Silva
Descrição........: Erro no Estado apresentado no cadastro de dependentes
***************************************************************************************
Nº SOL:........... 265910
Nº PPM...........: 1201672
Data da Alteração: 11/12/2015
Responsável......: William Santana
Descrição........: Ajuste na regra de elegibilidade do benefício de pecúlio.
***************************************************************************************
Nº SOL:........... 246131
Nº PPM...........: 636421
Data da Alteração: 10/11/2015
Responsável......: William Santana
Descrição........: Erro ao inserir um representante legal
***************************************************************************************
Pendência   : SOL 264722 PPM 1152948
Responsável : Felipe A. Santos
Data        : 06/11/2015
Descrição   : Erro ao alterar percentual de benefício
***************************************************************************************
Pendência   : SOL 245743/17769 PPM 1072447
Responsável : BRUNO SILVA
Data        : 15/10/2015
Descrição   : ajuste na funcionalidade de forma a aumentar o tamanho lógico do campo 'complemento' para 200 caracteres. Mudança no DFM qryEndereco.
***************************************************************************************
Nº SOL:........... 246736
Nº PPM...........: 1051823
Data da Alteração: 03/09/2015
Responsável......: William Moreira da Silva
Descrição........: Erro ao incluir representante legal para pensionista, e ao incluir beneficio
                   o flag 'é o proprio' não vinha flagado como padrão.
***************************************************************************************
Nº SOL......: 250389/17574
Nº KINTANA..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------------------------
Nº SOL:........... 260670
Nº PPM...........: 1040878
Data da Alteração: 27/08/2015
Alteração Form...: Correções de defeitos geradas após a implementação da 258918
Responsável......: William Santana
Descrição........: Correção do erro gerado após a demanda 258918
**************************************************************************************
--------------------------------------------------------------------------------------------------
Pendência   : SOL:258918 PPM:1007497
Responsável : Wylliam Leite da Silva
Data        : 05/08/2015
Descrição   : Correção da verificação do 100% total rateado entres os beneficios.
--------------------------------------------------------------------------------------------------
Pendência higor  : SOL 213269-15632 KTN 2056162
Responsável : Higor N.
Data        : 14/02/2014
Descrição   : Solicito implantação de regra no cadastro de dependentes,
              quanto a não marcação de dependente legal e designado. Segue anexo com demonstração.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 242767 PPM 371063
Responsável : Wylliam Leite da Silva
Data        : 09/06/2015
Descrição   : Alteração do maxlength dos campos DDD e DDI e da qryTelefones
-------------------------------------------------------------------------------------------------
Pendência   : SOL 250219 KIN 680472
Responsável : William Moreira da Silva
Data        : 11/03/2015
Descrição   : Correção de Elegibilidade
-------------------------------------------------------------------------------------------------
Pendência   : SOL 248947 KIN 680472
Responsável : Higor Nayde Ferreira
Data        : 23/02/2015
Descrição   : Ajuste nas regras de nomeclaturas de grau de parentesco
--------------------------------------------------------------------------------------------------
Pendência   : SOL 209767/16335 KIN 461636
Responsável : Higor Nayde Ferreira
Data        : 18/02/2015
Descrição   : Ajuste nas nomeclaturas de grau de parentesco
-------------------------------------------------------------------------------------------------
Pendência   : SOL 209384/15928 KIN 2062832
Responsável : William Santana
Data        : 23/09/2014
Descrição   : Padronização da nomenclatura quanto as opções de classificação de estado civíl
--------------------------------------------------------------------------------------------------
Autor(a)    : Marcio Sanches Spinosa SOL 243486 PPM 588132
Data        : 03/10/2014
Pendência   : SOL 243486 PPM 588132
Descricao   : Ajuste na query qryBenef para retornar os dados do responsavel pelo recebimento.
--------------------------------------------------------------------------------------------------
Autor(a)    : Fernando Xavier
Data        : 03/10/2014
Pendência   : SOL 242165 PPM 567539
Descricao   : O recebedor de benefícios deve vir default "próprio", erro ao inserir o segundo
              benefício, pois o recebedor está default como é o responsável.
--------------------------------------------------------------------------------------------------
Autor(a)    : William Moreira
Data        : 03/10/2014
Pendência   : SOL 241715 PPM 557422
Descricao   : Regra indevida na tela de Cadastro e Beneficiário
--------------------------------------------------------------------------------------------------
Autor(a)    : Thiago Melo
Data        : 03/10/2014
Pendência   : SOL 240767 PPM 544284
Descricao   : Erro na inclusão de benefício (Percentual máximo para este benefício)
--------------------------------------------------------------------------------------------------
Autor(a)    : Thiago Melo
Data        : 03/10/2014
Pendência   : SOL 240598 PPM 538132
Descricao   : erro na inclusão de benefício de pecúlio no cadastro
--------------------------------------------------------------------------------------------------
Pendência   : SOL 161550 KTN 1717512
Responsável : William Santana
Data        : 10/03/2014
Descrição   : Implantar flag para marcação da informação "Curatela Extinta".
              Essa opção deverá constar na tela de cadastro de data inicio e data fim de curatela.
--------------------------------------------------------------------------------------------------
Autor(a)    : Felipe A. Santos
Data        : 02/06/2014
Pendência   : SOL 208311 KTN 2020366
Descricao   : foi alterado a habilitação do botão Ok inferior.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 239266 PPM 515130
Responsável : Marcio Sanches Spinosa SOL 239266 PPM 515130
Data        : 12/09/2014
Descrição   : Tratamento da mensagem de IR.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 239264 PPM 515106
Responsável : Marcio Sanches Spinosa SOL 239264 PPM 515106
Data        : 12/09/2014
Descrição   : Tratamento da mensagem somente para quando o dependente possuir uma moléstia
--------------------------------------------------------------------------------------------------
Pendência   : SOL 239210 PPM 513833
Responsável : Marcio Sanches Spinosa SOL 239210 PPM 513833
Data        : 15/08/2014
Descrição   : Tratamento da mensagem somente para quando o dependente possuir uma moléstia
--------------------------------------------------------------------------------------------------
Pendência   : SOL 208475 KTN 2016859
Responsável : Felipe A. Santos
Data        : 15/08/2014
Descrição   : alteração das regras do tipo de dependencia PAI/MÃE.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 208475 KTN 2016859
Responsável : Flávio Souza
Data        : 11/10/2013
Descrição   : Criação de novas regras no Cadastro de Dependentes para buscar nomes de "PAI/MÃE"
              que já estejam no Cadastro do Titular.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 238755 PPM 507686
Responsável : Marcio Sanches Spinosa SOL 238755 PPM 507686
Data        : 09/09/2014
Descrição   : Ajuste na demanda 158955.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 158955 PPM 1613780
Responsável : Higor Nayde Ferreira
Data        : 29/08/2014
Descrição   : Historico de molestia grave.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 234561 PPM 438782
Responsável : William Moreira da Silva
Data        : 08/07/2014
Descrição   : Problemas com o botão para cadastrar mais de um dependente por vez.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 234563 PPM 437212
Responsável : Thiago Melo
Data        : 03/07/2014
Descrição   : Erro na regra de inclusão de não dependentes para o grau de parentes PAI/MAE.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 234741 PPM 436804
Responsável : William Moreira da Silva
Data        : 02/07/2014
Descrição   : Ao alterar o Percentual de Benefício INSS para um pensionista, apareciam alertas
              indevidos.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 234586 PPM 438161
Responsável : Sadi Freire
Data        : 07/07/2014
Descrição   : Corrigido o problema na inclusão de dependentes.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 222744 PPM 398216
Responsável : Felipe A. Santos
Data        : 03/06/2014
Descrição   : Corrigido o problema de não trazer os dependentes não cadastro quando o cadastro de
              dependentes e chamado pelo atalho do botão do Elegível.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 208093 KTN 2016011
Responsável : Felipe Azevedo dos Santos / William Santana
Data        : 17/09/2013
Descrição   : foi criado uma validação para não deixar atribuir um benefício a um dependente menor
              de idade.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 208116 KTN 2016014
Responsável : Felipe A. Santos
Data        : 17/09/2013
Descrição   : Mudado o grau de parentesco (base de dados), e o caption da flgdesignado.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 205798 KTN 2013525
Responsável : Felipe A. Santos
Data        : 17/09/2013
Descrição   : Alterado o caption da flg Dependente Legal para Dependente Funcef
--------------------------------------------------------------------------------------------------
Pendência   : SOL 202529 KTN 1963496
Responsável : Higor Nayde
Data        : 09/09/2013
Descrição   : Solicitamos que ao cadastrarmos um dependente para determinado participante seja
              validado se já existe algum dependente cadastrado para o referido participante que
              possua os mesmos nome, data de nascimento e grau de parentesco. Caso exista, não
              permitir a conclusão do cadastro emitindo uma tela de aviso.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 229238 KTN 2063206
Responsável : Fernando Xavier
Data        : 27/03/2014
Descrição   : alterar um benefício não ter nenhum tipo de restrição quanto ao plano
--------------------------------------------------------------------------------------------------
Pendência   : SOL 228437 KTN 2062198
Responsável : Fernando Xavier
Data        : 25/03/2014
Descrição   : Ao selecionar um Plano Previdenciario no Campo Busca relacionado a um Dependentes,
              ao cadastrar um benefício, aparece benefícios não relacionados
--------------------------------------------------------------------------------------------------
Pendência   : SOL 222833 KTN 2056162
Responsável : Felipe A. Santos
Data        : 17/01/2014
Descrição   : foi passado o plano previdênciario do titular para o IDPLANOORIGEM na hora de gravar
              os benefícios.
--------------------------------------------------------------------------------------------------
Pendência   : 224506 kintana 2058056
Responsável : Thiago Melo
Data        : 21/01/2014
Descrição   : Permitir gravar sem marcar a flag "solicita conta salario" sem o preenchimento da
              data de solicitação.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 220494 KTN 2053990
Responsável : William Moreira da Silva
Data        : 27/11/2013
Descrição   : O Sistema cadastrava dependente com a matricula do titula.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 200953 KTN 1952412
Responsável : Flávio Souza
Data        : 29/08/2013
Descrição   : Inclusão do botão "gerar matrícula" com base nas funcionalidades
              do botão de mesmo nome do módulo Benefícios Previdênciários porém
              sem as regras constantes no evento gerador do benefício.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 190718 KTN 1804738
Responsável : TADEU PASSOS
Data        : 07/08/2013
Descrição   : No cadastro de endereço do dependente deverá ter um atalho para que se possa buscar
              o endereço que esteja cadastrado na consulta geral de endereço.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 210338 KTN 2026994
Responsável : Bruno Azevedo
Data        : 28/06/2013
Descrição   : erro na vizualização e inclusão de dados nas abas endereço, telefone, contabancária,
              dependentes do beneficioario, beneficios, no menu cadastro de dependentes..
--------------------------------------------------------------------------------------------------
Pendência   : SOL 209360 KTN 2020368
Responsável : Marcio Sanches Spinosa SOL 209360 KTN 2020368
Data        : 13/06/2013
Descrição   : Retirada de mensagem incorreta.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 184394 KTN 1779892
Responsável : Higor Nayde Ferreira
Data        : 21/06/2013
Descrição   : Cadastro de não dependentes
--------------------------------------------------------------------------------------------------
Pendência   : SOL 203398 KTN 1967499
Responsável : Higor Nayde Ferreira
Data        : 21/06/2013
Descrição   : Solicitamos incluir na tela de busca do cadastro de dependente o filtro de nome do
dependente. CAMINHO PLANUS: Cadastros / Dependente e Beneficiário / Cadastro
--------------------------------------------------------------------------------------------------
Pendência   : SOL 208197 KTN 2015441
Responsável : William Moreira da Silva
Data        : 05/06/2013
Descrição   : Correção para permitir a exclusão de dependentes duplicados
--------------------------------------------------------------------------------------------------
Pendência   : SOL 206458 KTN 2000405
Responsável : Thiago Melo
Data        : 14/05/2013
Descrição   : Marcar o flgdepinvalido na tabela DEPENTIT dependendo do valor do campo sitdependente
---------------------------------------------------------------------------------------------------
Pendência   : SOL 205681 Kintana 1992276
Responsável : Marcio Sanches Spinosa SOL 205681 Kintana 1992276
Data        : 30/04/2013
Descrição   : Ajuste na verificação dos benefícios mesmo que o dependente esteja cancelado
--------------------------------------------------------------------------------------------------
Pendência   : SOL 175842 Kintana 1602998
Responsável : Fernando Xavier
Data        : 11/03/2013
Descrição   : Permitir alteração na aba de benefícios mesmo que o dependente esteja cancelado
---------------------------------------------------------------------------------------------------
Pendência   : SOL 201658 KINTANA 1949890
Responsável : BRUNO AZEVEDO
Data        : 28/02/2013
Descrição   : Correção ao cadastrar um dependente através do cadastro de elegivel e participante.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 194131 KINTANA 1851046
Responsável : BRUNO AZEVEDO
Data        : 07/11/2012
Descrição   : Correção na manutenção de benefícios.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 194883 KINTANA 1863270
Responsável : Higor Nayde Ferreira
Data        : 20/11/2012
Descrição   : Erro ao alterar um depente na qual foi cancelado e passou a pertencer a outro
dependente
--------------------------------------------------------------------------------------------------
Pendência   : SOL 194313 KINTANA 1858476
Responsável : William Moreira da Silva
Data        : 16/11/2012
Descrição   : O sistema não permite cadastrar dependente para fins de IR.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 193044 KINTANA 1836694
Responsável : Fernando Xavier
Data        : 23/10/2012
Descrição   : Erro coforme observaçoes. Matriculas para teste 0000017 e 0115690
---------------------------------------------------------------------------------------------------
Pendência   : SOL 165678 KINTANA 1470728
Responsável : André Oliveira
Descrição   : implementação de mensagem de crítica na inclusão de dependentes.
Caso o usuário esteja tentando incluir um conjuge e já tenha outro cadastrado.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 178016 KINTANA 1698357
Responsável : Jonas Otavio Henrique R. Oliveira
Descrição   : Inclusão do campo "Email base FUNCEF"
--------------------------------------------------------------------------------------------------
Pendência   : SOL 189470 KINTANA 1787378
Responsável : Fernando Xavier
Data        : 04/09/2012
Descrição   : ao alterar dados de pessoas elegíveis. "invalid number" quando executa via DML
--------------------------------------------------------------------------------------------------
Pendência   : SOL 172704 KINTANA 1567834
Responsável : RODRIGO DE BRITO FIGUEREDO
Data        : 03/09/2012
Descrição   : Criada a mensagem ao tentar alterar dependente de aposentado que possua NOVO PLANO
--------------------------------------------------------------------------------------------------
Pendência   : SOL 189183 KINTANA 1785576
Responsável : Fernando Xavier
Data        : 03/09/2012
Descrição   : Sistema não commita as informações inseridas.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 165677 KINTANA 1568409
Responsável : William Moreira da Silva
Descrição   : Quando o usuário tentar uma alteração no cadastro de elegível e participante, o sistema deve
verificar se houve alteração nas útimas 24 horas para o participante pesquisado
--------------------------------------------------------------------------------------------------
//Pendência   : SOL 170675 KINTANA 1631585
//Responsável : Monica Gonzaga
//Data        : 25/07/2012
//Descrição   : Incluir duas flags conta salario e conta salario processada.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 184793 KINTANA 1731321
Responsável : Jonas Otavio
Data        : 13/07/2012
Descrição   : Erro incluir dependente pela tela de Cadastro Elegivel
-------------------------------------------------------------------------------------------------
Pendência   : SOL 184462 KINTANA 1727012
Responsável : BRUNO AZEVEDO
Data        : 09/07/2012
Descrição   : Ajustes no cadastro de tutor.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 182784 KINTANA 1705269
Responsável : Fernando Xavier
Data        : 25/06/2012
Descrição   : Erro ao tentar excluir um registro de dependente duplicado.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 161469 KINTANA 1372818
Responsável : Vinicius Eduardo Nascimento Maciel
Data        : 10/10/2011
Descrição   : Foram alteradas as rotinas para quando pressionado o OK do detalhe
              da interface, as alterações sejam gravadas no banco como se fosse
              dado o OK da interface principal. Corrigi as rotinas das Abas de
              Contato e Conta Bancária.
alter. .dfm : Alterei o componente qryCBanco, mudei  o valor da propriedade SQL,
              adicionei: "SELECT D.IDTITULAR, CB.IDCBANCARIA,"
---------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Pendência   : SOL 130508/4762 kintana 1269185
Descricao   : Limpar o campo data fim ir quando alterar a Data de Nascimento, para o sistema calcular
novamente a data fim ir.
--------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Pendência   : SOL 130508 Kintana 733058
Descricao   : Regra para validação do IR.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 157908 Kintana 1267933
Responsável : Fanuel Junior
Data        : 31/01/2012
Descrição   : Solicito que seja omitida a informação de "Elegível a Benefício"
              disponível nas telas Consulta Geral de Pessoa e em
              Cadastros/Dependente e Beneficiário
-------------------------------------------------------------------------------------------------
Pendência   : SOL 162328 KINTANA 1389886
Responsável : BRUNO AZEVEDO
Data        : 16/02/2012
Descrição   : Desabilitar os flags no cadastro de dependente do beneficiário.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 162578 KINTANA 1389694
Responsável : Douglas.Siqueira
Data        : 10/02/2012
Descrição   : Verificar Data Fim IR se grau de instrução for SUPERIOR INCOMPLETO.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 174944 KINTANA 1585501
Responsável : Vinicius Ferreira
Data        : 08/02/2012
Descrição   : Retirar SOL 155779.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 162210 KINTANA 1393558
Responsável : Fernando Xavier
Data        : 08/02/2012
Descrição   : Alterado o DFM Desabilitado a opção OUTROS do campo grau de parentesco e estado civil
--------------------------------------------------------------------------------------------------
Pendência   : SOL 155774 KINTANA 1214023
Responsável : Eraldo Silva
Data        : 17/02/2012
Descrição   : Inserir trava e mensagem de crítica quando um dependente já estiver cancelado.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 155779 KINTANA 1220658
Responsável : Vinicius Ferreira
Data        : 17/02/2012
Descrição   : QUANDO OS DEPENDENTES FILHO, IRMÃO E ENTEADO, < DE 25, ESTIVER COM O IDGRINSTR = 8,
              OS FLEG'S FLGDEPLEGAL E FLGDESIGNADO ESTIVEREM DESMARCADOS E SITUAÇÃO NORMAL ,
              O SISTEMA DEVERÁ PERMITIR QUALQUER ALTERAÇÃO NO DEPENDENTE EM QUESTÃO
-------------------------------------------------------------------------------------------------
Pendência   : SOL 162981 Kintana 1390416
Responsável : Fanuel Junior
Data        : 04/10/2011
Descrição   : Quando for cadastrado um dependente de participante ASSISTIDO "IDSITFUNC IN (18,21,22,24,32,33,55)",
              e a situação do dependente for igual a "INVÁLIDO", o sistema não deve permitir que
              o cadastro seja finalizado sem o preenchimento da "DATA INÍCIO INVALIDEZ"
-------------------------------------------------------------------------------------------------

Pendência   : SOL 161016 KINTANA 1355687
Responsável : Fernando Xavier
Data        : 06/07/2011
Descrição   : Ao tentar cadastrar o dependente na tela de cadastros, o mesmo não está sendo
              atualizado. "porque não estava atualizando o plano"
--------------------------------------------------------------------------------------------------
Pendência   : SOL 157829 KINTANA 1271296
Responsável : Fanuel Junior
Data        : 06/07/2011
Descrição   : Ajuste no cadastro de endereços
-------------------------------------------------------------------------------------------------
Pendência   : SOL 159460 KINTANA 1314175
Responsável : BRUNO AZEVEDO
Data        : 09/06/2011
Descrição   : Ajuste nas regras do cadastro de dependente.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 157937 Kintana 1276480
Responsável : Renato Visoni
Descrição   : Colocar a opção de Matrícula do Dependente na consulta do participante.
              Alteração no MontaSelect
-------------------------------------------------------------------------------------------------
Pendência   : SOL 158710 KINTANA 1290599
Responsável : BRUNO AZEVEDO
Data        : 26/05/2011
Descrição   : Ajuste nas regras do cadastro de dependente.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 156422 Kintana 1234790
Responsável : Renato Visoni
Descrição   : SOLICITO DESCONSIDERAR O ITEM 2 DA RM ANEXA (DADOS EM VERMELHO) NAS REGRAS DA PROCEDURE.
"6.1. 2) Se dependente = (FILHO, IRMÃO ou ENTEADO) e idade < 24 anos e Situação=NORMAL , permitir
marcar os flags "Designado e Dependente Legal", senão , se idade > 24 anos desmarcar o flag
"Dependente legal" e não informar Data Cancelamento; "
-------------------------------------------------------------------------------------------------
Pendência   : SOL 158557 KINTANA 1287113
Responsável : Fernando Xavier
Data        : 24/05/2011
Descrição   : Retirar as informações duplicadas na grid de cadastro de dependentes e beneficiário
--------------------------------------------------------------------------------------------------
Pendência   : SOL 158362 KINTANA 1280405
Responsável : BRUNO AZEVEDO
Data        : 19/05/2011
Descrição   : Ajuste na query de seleção do combo "Benefícios".
--------------------------------------------------------------------------------------------------
Pendência   : SOL 155403 KINTANA 1209420
Responsável : Vinicius Ferreira
Data        : 23/05/2011
Descrição   : Marcar dependentes cancelados em vermelho dbgrdDet.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 158386 KINTANA 1280863
Responsável : BRUNO AZEVEDO
Data        : 20/05/2011
Descrição   : Ajuste nas regras do cadastro de dependente.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 152834 Kintana 1145687
Responsável : Fanuel Junior
Descrição   : Quando o campo IGNORA IMPOSTO DE RENDA for marcado, o campo data fim deverá ser
              preenchido com a data atual do sistema.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 152407 Kintana 1138129
Responsável : Fanuel Junior
Descrição   : Alterações no grid da funcionalidade de dependente/beneficiário -  elegivel/participante
--------------------------------------------------------------------------------------------------
Pendência   : SOL 157054 KINTANA 1247290
Responsável : BRUNO AZEVEDO
Data        : 04/05/2011
Descrição   : Ajuste nas regras do cadastro de dependente.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 130836 Kintana 807668
Responsável : BRUNO AZEVEDO
Data        : 12/01/2011
Descrição   : Ajuste na query de seleção do combo "Benefícios".
---------------------------------------------------------------------------------------------------
Pendência   : SOL 151399 Kintana 1107837
Responsável : Fanuel Junior
Descrição   : Ao cadastrar um novo dependente os planos do titular devem vir marcados,
              podendo ser alterado.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 143320 Kintana 928515
Responsável : Renato Visoni
Descrição   : Inconsistencia no cadastro de Dependente do Beneficiario.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 155915 Kintana 1218103
Responsável : Renato Visoni
Descrição   : Alterar forma de visualizar pessoa isenta de IRRF.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 154095 KINTANA 1169180
Responsável : BRUNO AZEVEDO
Data        : 14/03/2011
Descrição   : Obrigar o usuário a informar a data de nascimento.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 154946 Kintana 1192921
Responsável : Fanuel Junior
Descrição   : Corrigido o erro que bloqueava as informações do telefone
---------------------------------------------------------------------------------------------------
Pendência   : SOL 152884 Kintana 1147888
Responsável : Renato Visoni
Descrição   : Implementamos na rotina automatica de cancelamento alguma condições extras.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 140526 KINTANA 880316
Responsável : Fanuel Junior
Descrição   : Inclusão do formulario de manutenção de contatos na Aba de Telefones
--------------------------------------------------------------------------------------------------
Pendência   : SOL 152697  KINTANA 1143142
Responsável : Fanuel Junior
Descrição   : Permitir o cadastro de dependente quando a opção "Designado" for selecionada
---------------------------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 149421 Kintana 1079221
Descrição   : Adicionar o campo Nº Agencia na grid.
---------------------------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 126929 Kintana 668755
Descrição   : Apresentar Data Início IR, Data Fim IR, Data Inicio Sal.Familia, Data Fim Sal.Familia,
              Data inicio invalidez, data fim invalidez ,Início Moléstia e Fim Moléstia na Grid.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 143320/3803  KINTANA 1141113
Responsável : Fanuel Junior
Descrição   : Corrigido o erro gerado quando cadastrado um dependente para um beneficiário.
---------------------------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 152058 Kintana 1136987
Descrição   : O sistema não estava gravando registro na PLANODEPENDENTE.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 141428  KINTANA 893958
Responsável : Renato Visoni
Descrição   : Inserção de crítica e cancelamento quando do cadastro do beneficiário do tipo irmão
              e outros e que possua idade superior a 24 anos
--------------------------------------------------------------------------------------------------
Pendência   : SOL 151705 Kintana 1115935
Responsável : Renato Visoni
Descrição   : Demora ao tentar inserir ou alterar dependente.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 151398 Kintana 1107593
Responsável : FERNANDO XAVIER
Data        : 20/01/2011
Descrição   : Inconsistência ao associar o plano do titular a um novo dependente.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 135094 Kintana 805800
Responsável : BRUNO AZEVEDO
Data        : 29/11/2010
Descrição   : Correção erro VCL50.bpl.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 147534 KINTANA 1022208
Responsável : Fernando Santana
Data        : 19/11/2010
Descrição   : Alteração para os campos e-mails ficarem padronizados em letras minisculas.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 144030 KINTANA 945192
Responsável : Ádler Souza
Data        : 13/10/2010
Descrição   : Data Cadastro Default.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 140875/2902 KINTANA 1019775
Responsável : BRUNO AZEVEDO
Data        : 12/11/2010
Descrição   : Correção na inclusão de participantes com o mesmo nome.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 140875 Kintana 885806
Responsável : Renato Visoni
Descrição   : Incluir o CPF no combo quando já existir um participante com este mesmo Nome.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 145140 KINTANA 964283
Responsável : Fernando Santana
Data        : 04/10/2010
Descrição   : Erro ao excluir informações na aba outras informações.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 135535 KINTANA 810963
Responsável : Fernando Santana
Data        : 16/06/2010
Descrição   : Atualização do cpf
--------------------------------------------------------------------------------------------------
Pendência   : SOL 137519 KINTANA 831220
Responsável : BRUNO AZEVEDO
Data        : 16/06/2010
Descrição   : Ajuste no controle de transação ao fechar a tela.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 140690  Kintana 883179
Responsável : Ádler Souza
Data        : 02/08/2010
Descrição   : Alterado o tamanho do campo DDI aceite somente dois digitos.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 139421 KINTANA 845699
Responsável : Fernando Xavier
Descrição   : Alterado o tamanho do campo Numdocumento da qrydocumento
---------------------------------------------------------------------------------------------------
Pendência   : SOL 131670 Kintana 752091
Responsável : Renato Visoni
Descrição   : Incluir a Data Nascimento no combo quando já existir um participante com este mesmo CPF.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 138152  Kintana 838436
Responsável : Ádler Souza
Data        : 18/06/2010
Descrição   : Desfazer alteração solicitada no SOL137971.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 137971  Kintana 836908
Responsável : Ádler Souza
Data        : 17/06/2010
Descrição   : Corrigido para listar apenas as agencias que estão ativas.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 136478  Kintana 820017
Responsável : Fernando Santana
Data        : 01/06/2010
Descrição   : Corrigir erro no evento onexit do componete dbeContaCorrente,
              O erro ocorria quando chamava duas telas que utiliza a mesma class.
---------------------------------------------------------------------------------------------------
Autor(a)  : Adler Souza
Pendencia : SOL 134214 Kintana 787470
Alteração : Quando há dependente cadastrado, o sistema permite a gravação nula e retorna a mensagem
            List index out of bounds.
---------------------------------------------------------------------------------------------------
Autor(a)  : Thiago Passos
Data      : 21/01/2010
Pendencia : Sol 127643 / Kintana 685903
Alteração : Não permitir numero de celular inválidos
---------------------------------------------------------------------------------------------------
 Autor(a)    : Renato Visoni
Data        : 17/10/2008
Rotina      : CmeDetalheInsert
Pendencia   : SOL 97629 \ Kintana 431406
Alteração   : Acerto para NÃO incluir a matrícula do titular no dependente.
----------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 16/10/2008
Rotina      : VerificaContaPref
Pendencia   : SOL 97628 \ Kintana 431568
Alteração   : Criado o VerificaContaPref para não deixar o usuário incluir mais que 1 conta preferencial
              para o dependente.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : até 17/12/2007
Rotina      : MudaDocumento, edDocNumDocumentoExit(...), tbcDetalheChanging(...), edDocNumDocumentoEnter(...)
Pendencia   : 26492
Alteração   : Gravação bidirecional do CPF dos dependentes
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 21/11/2007
Rotina      : ExcedeCemPorCento
Pendencia   : 26865
Alteração   : Corrigido campo PERCENTUAL, de .AsInteger para .AsFlaot;
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 13/11/2007
Rotina      : CmeDetalheInsert(...)
Pendencia   : 22715 (reabertura)
Alteração   : Preenchimento (condicional) da matrícula do dependente com a do titular, por default
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 16/10/2007
Rotina      : bbtnOkDetClick
Pendencia   : 25402 (ReAbertura)
Alteração   : Incluir da opção "Ordem de Pagamento (OP/Recibo)" no cadastro de dependentes.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 04/10/2007
Rotina      : updBenef
Pendencia   : 26495
Alteração   : Retirar IDPLANOPREV dos campos atualizados no UPDATE
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 20/07/2007
Rotina      : Varias
Pendência   : 24224
Descricao   : Passar IDCALCULO para as funções de beneficio
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 04/07/2007
Rotina      : -
Pendência   : 25702 (ReAbertura)
Descrição   : Ajuste na gravação dos documentos dos dependentes.
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 02/07/2007
Rotina      : -
Pendência   : 25702
Descrição   : Ajuste na gravação dos documentos dos dependentes.
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 21/05/2007
Rotina      : bbtnOkDetClick
Pendência   : 25402
Descrição   : Incluir da opção "Ordem de Pagamento (OP/Recibo)" no cadastro de dependentes.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 10/05/2007
Rotina      : qryBenefBeforePost
Pendência   : 25314
Descrição   : 1) Agora o IDPLANOORIGEM será sempre o IDPLANOPREV do beneficio escolhido .
              2) Limpeza da rotina
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 10/04/2007
Rotina      : tbcDetalheChange
Pendência   : 22281
Descrição   : Tirado o setfocus dos edits referentes ao documento.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 06/03/2007
Rotina      : ExcedeCemPorCento
Pendência   : 24638
Descrição   : Adequação ao uso de mais de um plano ativo.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 26/02/2007
Rotina      : qryBenefBeforePost
Pendência   : 24579
Descrição   : Para adequação ao processo de saldamento o PLANOORIGEM volta a ser sempre o plano
              do titular selecionado pelo usuário.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 23/02/2007
Rotina      : tbcDetalheChange(...)
Pendência   : 24214
Descrição   : - Acerto na exibição dos planos possiveis de serem escolhidos
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 29/01/2007
Rotina      : tbcDetalheChange(...), qryDetAfterScroll(...), SelecionaDependente(...),
              qryBenefAfterScroll(...)
Pendência   : 24214
Descrição   : - Alteração da qryBeneficio para buscar os benefícios ligados a todos os planos do
              participante, não apenas o plano ativo
              - Exibição do plano na combo e na grid
              - Alteração na abertura da query, nas rotinas listadas acima
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 02/01/2007
Rotina      : qryPF
Pendência   : 21825
Descrição   : Permitir cadastrar o campo "Desconta IR sobre INSS e Suplementação juntos"
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 27/10/2006
Rotina      : qryPFBeforePost e qryDepBenPFBeforePost
Pendência   : 23616
Descrição   : Correção da gravação do FLGISENTOIR
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 25/08/2006
Rotina      : AtualizaDadosTitular
Pendência   : 23076
Descrição   : Acerto no atualização do total dependentes do IR somente se tiver cadastrado
              dependentes do beneficiário
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 16/08/2006
Rotina      : VerElegBen
Pendência   : 23079
Descrição   : Inibição da rotina para verificar data final.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 22/06/2006
Rotina      : VerElegBen
Pendência   : 22659
Descrição   : Correção na ativação da consulta à tabela BENEFBFCIARIO
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 20/06/2006
Rotina      : FormShow
Pendência   : 22616
Descrição   : Acerto no filtro do montaselect
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 07/06/2006
Rotina      : AtualizaDadosTitular
Pendência   : 22533
Descrição   : Atualizar número de dependentes de IR, SF e total para os dependentes que possuem
              dependentes.
----------------------------------------------------------------------------------------------------
Rotina      : CmeDetalheInsert, CmeDetalheEdit, qryDetBeforePost, FormShow,
              dbeCPFExit, btnOkJaExiste, btnCancelJaExisteClick e dbeNomeExit
Autor(a)    : Gleyber
Data        : 04/01/2006
Pendência   : 21177
Descrição   : Criação da rotina de busca de dependente já cadastrado.
----------------------------------------------------------------------------------------------------
Rotina      : bbtnOkDetClick
Autor(a)    : Gleyber
Data        : 08/08/2005
Pendência   : 19120
Descrição   : Criticar o preenchimento do campo Situação do Dependente.
----------------------------------------------------------------------------------------------------
Rotina      : dbeCPFExit e DBEdit2Exit
Autor(a)    : Gleyber
Data        : 14/07/2005
Pendência   : 18752
Descrição   : Criar validação de CPF
----------------------------------------------------------------------------------------------------
Rotina      : bbtnOkDetClick e RodaRegraDataFinal
Autor(a)    : Gleyber
Data        : 30/11/2004
Pendência   : 18154
Descrição   : Rodar a regra de data final na alteracao de qualquer campo do
              dependente, no click do OK, quando o dependente for um beneficiario.
----------------------------------------------------------------------------------------------------
Rotina      : bbtnSairClick
Autor(a)    : Gleyber
Data        : 10/11/2004
Pendência   : 17857 / 17322
Descrição   : Alteração para destruir o form frmCadOpcoesElegivel apenas se este existir.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 28/10/2004
Rotinas     : CmeDetalheInsert
Descrição   : NÃO incluir a matrícula do titular no dependente
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 09/09/2004
Pendência   : 17512
Rotinas     : Componentes de tela
Descrição   : Alterações realizadas conforme descritas a seguir:
              A fim de facilitar a visualização do usuário, os campos CIDADE,
              NATURALIDADE e NACIONALIDADE tiveram a propriedade AutoDropDown
              setada para que se vejam todas as opções disponíveis no momento
              da digitação. Também foi criado um novo campo chamado NOMECOMPLETO
              na qryCidade para que, em caso de nomes ambíguos, o nome da UF
              apareça também.
----------------------------------------------------------------------------------------------------
Rotina      : bbtnOkDetClick
Autor(a)    : Gleyber
Data        : 13/08/2004
Pendência   : 16518
Descrição   : Inclusão do IDPESSOA do dependente selecionado na qryParamPessoa
----------------------------------------------------------------------------------------------------
Rotina      : Diversas
Autor(a)    : Augusto
Data        : 04/08/2004
Descrição   : Acertos no acdastro das outras informacoes
----------------------------------------------------------------------------------------------------
Rotina      : Diversas
Autor(a)    : Camille
Data        : 15.07.2004
Pendência   : 17210
Descrição   : Acertos para inclusao de dependente -> estava incluindo 2 pessoas uma delas com o nome
              em branco
----------------------------------------------------------------------------------------------------
Rotina      : qryPessoaBeforePost
Autor(a)    : Gleyber
Data        : 24/06/2004
Pendência   : 17055
Descrição   : Retirado o comentário que inibia o sequence da tabela PESSOA.
----------------------------------------------------------------------------------------------------
Rotina      : CmeCadastroAtualizaBotoes
Autor(a)    : Gleyber
Data        : 17/06/2004
Pendência   : 17029
Descrição   : Habilita o botão de ALTERAR apenas se houver registro.
----------------------------------------------------------------------------------------------------
Rotina      : CmeCadastroAtualizaBotoes
Autor(a)    : Gleyber
Data        : 17/06/2004
Pendência   : 17029
Descrição   : Habilita o botão de ALTERAR apenas se houver registro.
----------------------------------------------------------------------------------------------------
Rotina      : updBenef
Autor(a)    : Gleyber
Data        : 16/04/2004
Pendência   : 16933
Descrição   : Inclusão do campo IDBENEFICIO na propriedade MODIFYSQL.
----------------------------------------------------------------------------------------------------
Rotina      : btnListaDocsTitularClick
Autor(a)    : Gleyber
Data        : 11/05/2004
Pendência   : 16420
Descrição   : Criação da rotina de visualização de documentos do titular.
----------------------------------------------------------------------------------------------------
Rotina      : tbsDet, CmeDetalheEdit, CmeDetalheInsert, qryPessoa e UpdPessoa
Autor(a)    : Gleyber
Data        : 11/05/2004
Pendência   : 16506
Descrição   : Refeito o detalhe do dependente subdividindo em duas abas;
              inclusão do campo e-mail do dependente.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 05/05/2004
Descrição   : Acertos para erro no cadastro de beneficiario migrado
----------------------------------------------------------------------------------------------------
Autor(a)    : Ricardo Vigorito
Data        : 01/04/2004
Pendencia   : 16412
Descrição   : Foi acertado a componete  DATA MOLÉSTIA  GRAVE FIM
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : CmeDetalheDelete
Data        : 14/01/2003
Pendencia   : 16290
Descrição   : Retirado o delete da tabela PESSOA, PESSOAFISICA
----------------------------------------------------------------------------------------------------
Rotina      : tbcDetalheChange / qryDetAfterScroll
Autor(a)    : Augusto
Data        : 12/02/2004
Descrição   : Acertos para viabilizar cadastro de beneficio para beneficiario migrado.
Data        : 11/03/2004
Descrição   : Acertos para viabilizar cadastro de beneficio para beneficiario migrado.
----------------------------------------------------------------------------------------------------
Rotina      : tbcDetalheChange
Autor(a)    : Gleyber
Data        : 12/02/2004
Pendência   : 16206, 16230
Descrição   : Acerto na passagem de valor para a variavel iIdPlanoPrevBenef
              para gravação na BFciarioTitPlan.
              Alterado o qryBenef para acertar IDPLANOPREV originando da
              BFCIARIOTITPLAN e não da BENEFBFCIARIO.
----------------------------------------------------------------------------------------------------
Rotina      : qryDetAfterScroll
Autor(a)    : LeoFuncef
Data        : 05/01/2004
Descrição   : Listar os benefícios do plano do beneficiário/participante
              nop combo de benefícicio, no tab de benefícios. Ele estava trazendo apenas
              os benef. do plano titular
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : Diversos
Data        : 14/01/2003
Pendencia   : 15927 (FUNCEF)
Descrição   : Inclusão da tab "OUTRAS INFORMAÇÕES"
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : Diversos
Data        : 14/01/2003
Pendencia   : 15927 (FUNCEF)
Descrição   : Inclusão da tab "OUTRAS INFORMAÇÕES"
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : CmeDetalheInsert
Data        : 14/01/2003
Pendencia   : 15929 (FUNCEF)
Descrição   : Comentado o preenchimento automático da matricula
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Rotina      : RodaRegraElegibilidade
Data        : 07/01/2004
Descrição   : Incluir campo DE.FLGCONTAIMPOSTOR,
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo (FUNCEF)
Rotina      : RodaRegraElegibilidade
Data        : 03/12/2003
Descrição   : Incluir campo PF.NUMDEPIRRF
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 03.02.2002
Pendencia   : 15477
Descrição   : Inclusão do campo DATACANCELA apenas para visualizacao
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 15/11/2003
Descrição   : Inclusão do FLGIGNORAVALIR e retirada do chk "Elegivel a Beneficio"
----------------------------------------------------------------------------------------------------
Rotina    : Geral
Autor(a)  : Leo
Data      : 12/11/2003
Alteração : comentei a chamada da função AtualizaNumeroDependentes, que atualiza a marcação de
            dependente de IR e Sal. Família na depentit, somando para o titular.
            Esta cálculo só é usado na Funcef, só que a informação de ir e sal. família
            já vem no Interface Cadastral, e como  data de início para estes não vem
            informada, as marcações que estavam certas acabam sendo modificadas erradamente.
----------------------------------------------------------------------------------------------------
Rotina    : FormClose
Autor(a)  : Augusto
Data      : 10/11/2003
Pendência : FormClose
Alteração : Fechar a QryGlobal
----------------------------------------------------------------------------------------------------
Rotina    : FormCreate
Autor(a)  : Gleyber
Data      : 29/10/2003
Pendência : 15520
Alteração : Abrir a qryGlobal para evitar erro no teste de elegibilidade.
----------------------------------------------------------------------------------------------------
Autor(a)  : Ricardo Vigorito
Data      : 13/10/2003
Alteração : Só permitir a inclusão de CPF do Dependente pela tela do
            cadastramento do mesmo
----------------------------------------------------------------------------------------------------
Rotina    : dbeContaCorrenteExit
Autor(a)  : Leo
Data      : 09/10/2003
Alteração : zerar o campo CONTACORRENTE, que estava ficando com lixo
----------------------------------------------------------------------------------------------------
Rotina    : dbeContaCorrenteExit
Autor(a)  : Leo
Data      : 09/10/2003
Alteração : try para o caso do CalculaDv.Free não se aplicar
----------------------------------------------------------------------------------------------------
Rotina    : dbeContaCorrenteExit
Autor(a)  : Leo
Data      : 09/10/2003
Alteração : retirei o setfocus no cálculo do DV da conta bancária
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 09/10/2003
Alteração : try que evita erro na ocorrência de activecontrol = nil
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 09/07/2003
Alteração : alteração em bbtnConfirmarClick, para o caso da tela ter sido cahamada pelo atalho
            do cadastro de elegível
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 09/07/2003
Alteração : alteração em VerElegBen, para o caso da tela ter sido cahamada pelo atalho
            do cadastro de elegível
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 25/06/2003
Alteração   : Validação da conta somente se FLGVALIDACC = 'S'
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 21.06.2003
Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 21/01/2003
Alteração : Busca o Plano Origem para cadastrar na BENEFBFCIARIO
----------------------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 15/01/2003
Alteração : Diversas
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Gleyber
Data      : 13/12/2002
Alteração : Inclusão do Campo Data de Cadastro
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Gleyber
Data      : 06/12/2002
Alteração : Inclusão do Campo Cidade de Nascimento.
----------------------------------------------------------------------------------------------------
Rotina    : qryEndPessBeforePost
Autor(a)  : Augusto
Data      : 06/12/2002
Alteração : Só grava IDENDERECO na ENDPESS se for inserção
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Gleyber
Data      : 28/10/2002
Alteração : Modificações:
              - Adição do campo DATAFIMMOLESTIA
              - Acerto nos campos datas InícioInvalide e FimInvalidez
----------------------------------------------------------------------------------------------------
Rotina    : HabilitaCheckDependente
Autor(a)  : Camille
Data      : 13.08.2002
Alteração : chamada da funcao no insert e no edit
----------------------------------------------------------------------------------------------------
Rotina    : CriaLogOcorrencia
Autor(a)  : Camille
Data      : 13.08.2002
Alteração : Gravação do Lote da Movimentacao de Beneficio
----------------------------------------------------------------------------------------------------
Rotina      : SelecionaDependente
Autor(a)    : Leo
Data        : 13/06/2002
Alteração   : teste do idpessoa antes de fazer o filter
----------------------------------------------------------------------------------------------------
Alterações :
  11/09/2000 - Alexandre Ramos
               Inclusão do Casdastro de Nucleos Familiares
  11/09/2000 - Alexandre Ramos
               Acerto no Controle de Participacao dos dependentes no Beneficio
  17/10/2000 - Alexandre Ramos
               Caso o Dependente seja designado não obrida Data de Nascimento
  18/10/2000 - Alexandre Ramos
               Diversas Pedidas pela Camille
  04/01/2001 - Marco Diniz
               Facilidades para alterações na Conta Bancária de Dependente
----------------------------------------------------------------------------------------------------
Autor      : Carlos Gleyber Macedo de Mesquita
Data       : 10.05.2002
Descrição  : Alteração no evento onclick do dbrgrpFlgMolestiaGrave para
             desabilitar dbchkIsentoIR caso seja desmarcado. Pendencia 6504.
----------------------------------------------------------------------------------------------------
Autor      : Carlos Gleyber Macedo de Mesquita
Data       : 20.05.2002
Descrição  : Inclusão novos campos na tela a saber:
             - Data Inicio IR
             - Data Fim IR
             - Data Inicio Sal.Familia
             - Data Fim Sal.Familia
             - Data Inicio Invalidez
             - Data Fim Invalidez                           Pendencia 6504

Descrição  : Retirada dos campos de opção para a tela FcadOpcoesElegivel
                                                            Pendencia 6790
----------------------------------------------------------------------------------------------------
Autor      : Carlos Gleyber Macedo de Mesquita
Data       : 02/09/2002
Descrição  : Alteração na função HabilitaCheckDependente
Pendência  : 8995
----------------------------------------------------------------------------------------------------
Autor      : Augusto
Data       : 18/09/2002
Descrição  : Acerto no sequencia de dependentes do dependente
             Acerto no cadastro de Telefones
Pendência  : 9276/9278
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, dbclient, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbedit,  Mask, checklst, wwdblook, CMDBLookupCombo,
  DBGrids, CMProcuraSubTipo, CMProcura, TEdNum, Wwdbspin, fHistMolestiaGrave,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, Pessoa,
  Wwdotdot, Wwdbcomb{$IFNDEF VERSAO0505 }, UCMTypes, DBCGrids, uValidaDoc,
  Wwkeycb, Menus, wwclient {$ENDIF},DBaseDados, TREdit,uAutorizacao,UFuncoesUteis;

Const
 //Darivaldo Alencar SIG 25312 -INICIO
 MSG006 = 'O CPF informado já foi cadastrado para outro assistido.'+#13#10+'Favor verificar.';
 MSG025 = 'O Estado Civil não foi preenchido. Verifique.';
 MSG027 = 'Confirma a exclusão?';
 MSG028 = 'O CPF informado não é válido. Favor corrigir.';
 MSG029 = 'Este Plano Previdenciário não poderá ser desmarcado,'+#13#10+'pois ele já foi cancelado.';
 MSG030 = 'O dependente alterado possui representante legal.'+#13#10+'Favor verificar.';
 MSG031 = 'O dependente alterado possui representante legal e o documento está vencido.'+#13#10+'Favor verificar.';
 MSG032 = 'Data de Nascimento não pode ser maior que a Data Atual!';
 MSG033 = 'Não é possível alterar o dependente selecionado,'+#13#10+'pois ele está cancelado e não atende às regras de dedução de IR.';
 MSG034 = 'Dependente Cancelado, as informações não podem ser alteradas.';
 MSG035 = 'Grau de Instrução informado é diferente de Superior Incompleto!';
 MSG036 = 'Dependente entre 22 e 25 anos, favor verificar Data Fim IR!';
 MSG037 = 'Participante cadastrado como inválido,'+#13#10+'verificar se possui laudo médico.';
 MSG038 = 'O e-mail cadastrado não é válido. Favor verificar!';
 MSG039 = 'O CPF não foi preenchido!';
 //Darivaldo Alencar SIG 25312 -FIM

type
  TTipoCtaBancaria = (tcbResgate, tcbPreferencial);    //edilaine - SIG25312

  TRetBen = Record
    IDPESSJUR         : Integer;
    IDPLANOPREV       : Integer;
    IDTITULAR         : Integer;
    SEQPROPOSTA       : Integer;
    IDPESSOA          : Integer;
    IDBENEFICIO       : Integer;
    NUMEROPROCESSO    : Integer;
    VALORATUAL        : Double;
    VALORCOTAS        : Double;
    VALORTOTAL        : Double;
    FLGDATAPREVISTA   : Integer;
    IDSITBENEFICIO    : Integer;
    DATAFINALPREVISTA : String[8];
    DATAFINAL         : String[8];
    DATAINICIO        : String[8];
  end;
//

  TfrmCadDepenBenef = class(TfrmCadMestreDetalheCS)
    lblParticipante: TLabel;
    lblMatricula: TLabel;
    lblPatro: TLabel;
    lblInscricao: TLabel;
    lblPlanoPrev: TLabel;
    dbTNome: TDBText;
    dbTPatro: TDBText;
    dbTPlano: TDBText;
    dbTMatricula: TDBText;
    dbTInscricao: TDBText;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsDepen: TwwDataSource;
    qryDepen: TwwQuery;
    updDepen: TUpdateSQL;
    tbsEndereco: TTabSheet;
    dsPF: TwwDataSource;
    qryPF: TwwQuery;
    updPF: TUpdateSQL;
    dsPessoa: TwwDataSource;
    qryPessoa: TwwQuery;
    updPessoa: TUpdateSQL;
    dsEndPess: TwwDataSource;
    qryEndPess: TwwQuery;
    updEndPess: TUpdateSQL;
    lblPdCEP: TLabel;
    dbgrdEndPess: TwwDBGrid;
    pnlControlesEndPess: TPanel;
    lblNumero: TLabel;
    dbeNumero: TDBEdit;
    lblCEP: TLabel;
    lblPais: TLabel;
    lblEstado: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    cmbCidade: TCMDBLookupCombo;
    lblComplemento: TLabel;
    lblLogradouro: TLabel;
    dbeLogradouro: TDBEdit;
    qryDependencia: TwwQuery;
    qrySeq: TwwQuery;
    edPaiDetalhe: TEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCEP: TDBEdit;
    qryCidade: TwwQuery;
    qryCidadeNOMECIDADE: TStringField;
    qryCidadeCODESTADO: TStringField;
    qryCidadeIDCIDADES: TFloatField;
    qryCidadeNOMEESTADO: TStringField;
    qryCidadeIDPAIS: TFloatField;
    qryCidadeNOMEPAIS: TStringField;
    GroupBox1: TGroupBox;
    dbeEstado: TDBEdit;
    dbePais: TDBEdit;
    dsCidade: TDataSource;
    tbsContaBanco: TTabSheet;
    dsCBanco: TwwDataSource;
    qryCBanco: TwwQuery;
    updCBanco: TUpdateSQL;
    dbgrdContaBanco: TwwDBGrid;
    tbsBeneficiario: TTabSheet;
    pnlBeneficiario: TPanel;
    dsBenef: TwwDataSource;
    grpbxBeneficio: TGroupBox;
    grpbxPrioridade: TGroupBox;
    dbePrioridade: TDBEdit;
    grpbxPercentual: TGroupBox;
    dbePercentual: TDBEdit;
    MSResp: TMontaSelect;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    chkbxComercial: TCheckBox;
    chkbxEntrega: TCheckBox;
    chkbxCobranca: TCheckBox;
    chkbxCorrespondencia: TCheckBox;
    chkbxResidencial: TCheckBox;
    qrySitDependente: TwwQuery;
    TbNucleoFamiliar: TTabSheet;
    PnlNucleoFamiliar: TPanel;
    DbGrdNucleoFamiliar: TwwDBGrid;
    DsNucleoFam: TwwDataSource;
    QryNucleoFam: TwwQuery;
    UpdNucleoFam: TUpdateSQL;
    DbLkcRespNucleo: TwwDBLookupCombo;
    Lable1: TLabel;
    QryResponsavel: TwwQuery;
    QryNucleoFamIDNUCLEOFAMILIAR: TFloatField;
    QryNucleoFamIDRESPNUCLEO: TFloatField;
    QryNucleoFamResponsavel: TStringField;
    GroupBox2: TGroupBox;
    DbLkcBuscaNucleo: TCMDBLookupCombo;
    QryBuscaNucleo: TwwQuery;
    QryNucleoFamIDTITULAR: TFloatField;
    QryAux: TwwQuery;
    pnlControlesContaBanco: TPanel;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    dbgrpContaConj: TDBRadioGroup;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeContaCorrente: TDBEdit;
    lkpcmbbxBanco: TwwDBLookupCombo;
    lkpcmbbxAgencia: TwwDBLookupCombo;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    qryInsResponsavel: TwwQuery;
    UpdInsResp: TUpdateSQL;
    updsubtipo: TUpdateSQL;
    qryAux2: TwwQuery;
    updplano: TUpdateSQL;
    UpdateSQL2: TUpdateSQL;
    wwQuery2: TwwQuery;
    dbedNomeEndereco: TDBEdit;
    lblPdLocal: TLabel;
    qryTipoRecebedor: TQuery;
    dsRecebedor: TwwDataSource;
    updRecebedor: TUpdateSQL;
    qryRecebedor: TwwQuery;
    MSPessoa: TMontaSelect;
    tbsDocumentos: TTabSheet;
    PnlDocumentos_Padrao: TPanel;
    pnlItemsDoc: TPanel;
    pnlNomeDoc: TPanel;
    DBText1: TDBText;
    pnlOrgao: TPanel;
    lblPdOrgao: TLabel;
    wwDBEdit1: TwwDBEdit;
    pnlEmissao: TPanel;
    lblPdEmiss: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    pnlUF: TPanel;
    lblPdUF: TLabel;
    dbcmbEstadoDoc: TCMDBLookupCombo;
    pnlNumDoc: TPanel;
    edDocNumDocumento: TwwDBEdit;
    PnlValidade: TPanel;
    LblDtValidade: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    pnlFoto: TPanel;
    Bevel1: TBevel;
    PnlAssociaFoto_Padrao: TPanel;
    btnAssociarimgPessoa: TButton;
    SbImagePessoa_Padrao: TScrollBox;
    lstDocumentos: TListView;
    qryDocumento: TwwQuery;
    qryDocumentoIDDOCUMENTO: TFloatField;
    qryDocumentoNOMEDOCUMENTO: TStringField;
    qryDocumentoMASCARA: TStringField;
    qryDocumentoOBRIGAUF: TStringField;
    qryDocumentoOBRIGAORGAO: TStringField;
    qryDocumentoOBRIGAEMISSAO: TStringField;
    qryDocumentoIDPESSOA: TFloatField;
    qryDocumentoIDIMAGEM: TFloatField;
    qryDocumentoIDPAIS: TFloatField;
    qryDocumentoNUMDOCUMENTO: TStringField;
    qryDocumentoORGAO: TStringField;
    qryDocumentoDATAEMISSAO: TDateTimeField;
    qryDocumentoIDESTADO: TFloatField;
    qryDocumentoFLGOBRIGAVALIDADE: TStringField;
    qryDocumentoDATAVALIDADE: TDateTimeField;
    dsDocumento: TwwDataSource;
    updDocumento: TUpdateSQL;
    qryRamal: TwwQuery;
    updRamal: TUpdateSQL;
    dsRamal: TwwDataSource;
    qryImagensDoc: TwwQuery;
    qryImagensDocIDIMAGEM: TFloatField;
    qryImagensDocIMAGEM: TBlobField;
    qryImagensDocDESCRIMAGEM: TStringField;
    updImagensDoc: TUpdateSQL;
    dsImagensDoc: TwwDataSource;
    Pessoa: TPessoa;
    qryTipoDoc: TwwQuery;
    qryTipoDocIDDOCUMENTO: TFloatField;
    qryTipoDocNOMEDOCUMENTO: TStringField;
    qryTipoDocIDREGRA: TFloatField;
    qryTipoDocFISICAJURIDICA: TStringField;
    qryTipoDocMASCARA: TStringField;
    qryTipoDocDOCCHAVE: TStringField;
    qryTipoDocOBRIGAUF: TStringField;
    qryTipoDocOBRIGAORGAO: TStringField;
    qryTipoDocOBRIGAEMISSAO: TStringField;
    qryTipoDocFLGOBRIGAVALIDADE: TStringField;
    qryNOME: TStringField;
    qryNUMDOCUMENTO: TStringField;
    qryNOMEPATRO: TStringField;
    qryNOMEPLANO: TStringField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPESSOA: TFloatField;
    qrySEQPROPOSTA: TFloatField;
    qryFLGINTERNO: TStringField;
    qryINSCRICAODATA: TDateTimeField;
    qryIDSITPART: TFloatField;
    qryDATANASC: TDateTimeField;
    qrySALARIO: TFloatField;
    qryTelefone: TwwQuery;
    qryTelefoneDDD: TStringField;
    qryTelefoneDDI: TStringField;
    qryTelefoneTComercial: TStringField;
    qryTelefoneTParticular: TStringField;
    qryTelefoneTFax: TStringField;
    qryTelefoneTCelular: TStringField;
    qryTelefoneTRecado: TStringField;
    qryTelefoneIDTELEFONE: TFloatField;
    qryTelefoneIDPESSOA: TFloatField;
    qryTelefoneIDENDERECO: TFloatField;
    qryTelefoneTIPO: TStringField;
    qryTelefoneNUMERO: TStringField;
    updTelefone: TUpdateSQL;
    dsTelefone: TwwDataSource;
    dsSubTipo: TwwDataSource;
    qrySubTipo: TwwQuery;
    dsEndereco: TwwDataSource;
    updEndereco: TUpdateSQL;
    qryEndereco: TwwQuery;
    qryEnderecoNOME: TStringField;
    qryEnderecoNUMERO: TStringField;
    qryEnderecoCOMPLEMENTO: TStringField;
    qryEnderecoBAIRRO: TStringField;
    qryEnderecoCEP: TStringField;
    qryEnderecoNOMECIDADE: TStringField;
    qryEnderecoNOMEESTADO: TStringField;
    qryEnderecoNOMEPAIS: TStringField;
    qryEnderecoCIDADE: TStringField;
    qryEnderecoIDPESSOA: TFloatField;
    qryEnderecoIDENDERECO: TFloatField;
    qryEnderecoIDCIDADES: TFloatField;
    qryEnderecoLOGRADOURO: TStringField;
    qryContato: TwwQuery;
    qryContatoIDCONTATO: TFloatField;
    qryContatoIDENDERECO: TFloatField;
    qryContatoEMAIL: TStringField;
    qryContatoCARGO: TStringField;
    qryContatoSETOR: TStringField;
    qryContatoTelefone: TStringField;
    qryContatoNASCIMENTO: TDateTimeField;
    qryContatoOBS: TMemoField;
    qryContatoNOME: TStringField;
    qryContatoIDPESSOA: TFloatField;
    dsContato: TwwDataSource;
    updContato: TUpdateSQL;
    qryImagem: TwwQuery;
    qryImagemIDIMAGEM: TFloatField;
    qryImagemIMAGEM: TBlobField;
    qryImagemDESCRIMAGEM: TStringField;
    dsImagem: TwwDataSource;
    updImagem: TUpdateSQL;
    qryTIPO: TStringField;
    qryEstado: TwwQuery;
    qryEstadoIDESTADO: TFloatField;
    qryEstadoCODESTADO: TStringField;
    qryEstadoNOMEESTADO: TStringField;
    qryEstadoIDPAIS: TFloatField;
    qryEstadoNOMEPAIS: TStringField;
    qryEstadoMASCARACPOSTAL: TStringField;
    qryIDIMAGEM: TFloatField;
    qryIDRGELEGBENEF: TFloatField;
    tbsDepBen: TTabSheet;
    Panel1: TPanel;
    dbgrdDepBen: TwwDBGrid;
    dbeNomeDepBen: TDBEdit;
    Label11: TLabel;
    dbeNumSeqDepBen: TDBEdit;
    Label12: TLabel;
    qryDepBen: TwwQuery;
    dsDepBen: TwwDataSource;
    updDepBen: TUpdateSQL;
    qryNOMEVALORBASE1: TStringField;
    qryNOMEVALORBASE2: TStringField;
    qryNOMEVALORBASE3: TStringField;
    qryVALORBASE1: TFloatField;
    qryVALORBASE2: TFloatField;
    qryVALORBASE3: TFloatField;
    tbsTelefone: TTabSheet;
    Panel2: TPanel;
    lblDDI: TLabel;
    lblDDD: TLabel;
    lblNumTelefone: TLabel;
    GroupBox7: TGroupBox;
    dbgTelefoneRamal: TwwDBGrid;
    dblcContato: TCMDBLookupCombo;
    DBEDDDI: TDBEdit;
    DBEDDDD: TDBEdit;
    DBEDNUMERO: TwwDBEdit;
    GroupBox8: TGroupBox;
    chkTipoTelefone: TCheckListBox;
    dbgTelefone: TwwDBGrid;
    updDepBenPessoa: TUpdateSQL;
    qryDepBenPessoa: TwwQuery;
    dsDepBenPessoa: TwwDataSource;
    updDepBenPF: TUpdateSQL;
    qryDepBenPF: TwwQuery;
    dsDepBenPF: TwwDataSource;
    GroupBox9: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dtpNascDepBen: TCMDateTimePicker;
    CMDateTimePicker6: TCMDateTimePicker;
    DBEdit1: TDBEdit;
    GroupBox10: TGroupBox;
    DBEdit2: TDBEdit;
    dbrgrpMolGraveDepen: TDBRadioGroup;
    dbcSexoDepBen: TDBRadioGroup;
    rgrpDtMolGraveDepen: TGroupBox;
    dtMolGraveDepen: TCMDateTimePicker;
    GroupBox13: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox15: TGroupBox;
    Label18: TLabel;
    dtInicioIRDepBen: TCMDateTimePicker;
    Label19: TLabel;
    dtFimIRDepBen: TCMDateTimePicker;
    updDepBenDepen: TUpdateSQL;
    qryDepBenDepen: TwwQuery;
    dsDepBenDepen: TwwDataSource;
    GroupBox16: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    dblcParentDepBen: TCMDBLookupCombo;
    GroupBox17: TGroupBox;
    dbchkDepBenDepLegal: TDBCheckBox;
    dbchkDepBenContaIR: TDBCheckBox;
    dbchkDepBenContaSalarioF: TDBCheckBox;
    dbchkDepBenIsentoIRRF: TDBCheckBox;
    dbchkDepBenDesignado: TDBCheckBox;
    qryDependencia2: TwwQuery;
    qryBciario: TwwQuery;
    qryBciarioIDPESSJUR: TFloatField;
    qryBciarioIDPLANOPREV: TFloatField;
    qryBciarioIDTITULAR: TFloatField;
    qryBciarioIDSITBENEFICIO: TFloatField;
    qryBciarioSEQPROPOSTA: TFloatField;
    qryBciarioIDPESSOA: TFloatField;
    qryBciarioIDBENEFICIO: TFloatField;
    qryBciarioNUMEROPROCESSO: TFloatField;
    qryBciarioIDREGRABENEFICIA: TFloatField;
    qryBciarioVALORBASE1: TFloatField;
    qryBciarioVALORBASE2: TFloatField;
    qryBciarioVALORBASE3: TFloatField;
    qryBciarioDATAINICIOFUND: TDateTimeField;
    qryBciarioDATAINICIO: TDateTimeField;
    qryBciarioDATAFINAL: TDateTimeField;
    qryBciarioDATAFINALPREVISTA: TDateTimeField;
    qryBciarioDATADEMISSAO: TDateTimeField;
    qryBciarioFLGTIPOINSS: TFloatField;
    qryBciarioVALORATUAL: TFloatField;
    qryBciarioVALORTOTAL: TFloatField;
    qryBciarioVALORCOTAS: TFloatField;
    qryBciarioFLGDATAPREVISTA: TFloatField;
    dsBciario: TDataSource;
    updBciario: TUpdateSQL;
    qryGrau: TwwQuery;
    qryTRegra: TwwQuery;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    spNumDepIRDepBen: TwwDBSpinEdit;
    wwDBSpinEdit2: TwwDBSpinEdit;
    wwDBSpinEdit3: TwwDBSpinEdit;
    Label30: TLabel;
    CMDBLookupCombo1: TCMDBLookupCombo;
    Label16: TLabel;
    //cmbEstCivDepBen: TComboBox;
    DBRadioGroup1: TDBRadioGroup;
    bbtnOpcoes: TBitBtn;
    qryPais: TwwQuery;
    Label40: TLabel;
    qrySITPARTDESCRICAO: TStringField;
    dbSitPart: TDBText;
    dbgrdBeneficiario: TwwDBGrid;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    EdDependenteDocumento: TEdit;
    qryGlobal: TQuery;
    qryGlobalDOCPFISICA: TFloatField;
    Updlerdocumento: TUpdateSQL;
    qrylerdocumento: TwwQuery;
    qrylerdocumentoIDDOCUMENTO: TFloatField;
    qrylerdocumentoIDPESSOA: TFloatField;
    qrylerdocumentoNUMDOCUMENTO: TStringField;
    qrylerdocumentoORGAO: TStringField;
    qrylerdocumentoIDIMAGEM: TFloatField;
    qrylerdocumentoIDPAIS: TFloatField;
    qrylerdocumentoUF: TStringField;
    qrylerdocumentoDATAEMISSAO: TDateTimeField;
    qrylerdocumentoIDESTADO: TFloatField;
    qrylerdocumentoTRGDTINCLUSAO: TDateTimeField;
    qrylerdocumentoTRGUSERINCLUSAO: TStringField;
    qrylerdocumentoDATAVALIDADE: TDateTimeField;
    qryinseredocumento: TwwQuery;
    tbsOutrasInformacoes: TTabSheet;
    dbgrdOutrasInforms: TwwDBGrid;
    Panel5: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    dblkParamPessoa: TwwDBLookupCombo;
    dbedValor: TwwDBEdit;
    dtInicio: TCMDateTimePicker;
    DtFim: TCMDateTimePicker;
    edValida: TEdit;
    qryParamPessoa: TwwQuery;
    dsOutrasInforms: TwwDataSource;
    qryOutrasInforms: TwwQuery;
    updOutrasInforms: TUpdateSQL;
    pgcDependente: TPageControl;
    tbsDet01: TTabSheet;
    tbsDet02: TTabSheet;
    dbeNome: TDBEdit;
    lblNome: TLabel;
    dbeMatricula: TDBEdit;
    Label1: TLabel;
    dbeCPF: TDBEdit;
    Label28: TLabel;
    dbeTipoSang: TDBEdit;
    lblTpSang: TLabel;
    dbeNumSequencia: TDBEdit;
    lblNumSequencia: TLabel;
    grpDataNasc: TGroupBox;
    lblDtNascimento: TLabel;
    lblDataMorte: TLabel;
    Label42: TLabel;
    dbdeDataNasc: TCMDateTimePicker;
    dbdeDataMorte: TCMDateTimePicker;
    dbdeDataCadastro: TCMDateTimePicker;
    grpFiliacao: TGroupBox;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    dbeNomePai: TDBEdit;
    dbeNomeMae: TDBEdit;
    dbrdgrpSituacao: TGroupBox;
    lblSitDependente: TLabel;
    lblTipoDepen: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label20: TLabel;
    dblkpcmbSitDependente: TwwDBLookupCombo;
    dblkpcmbTipoDependencia: TCMDBLookupCombo;
    dblkpcmbGrauInstr: TCMDBLookupCombo;
    //cmbEstCiv: TComboBox;
    dbrdgrpSexo: TDBRadioGroup;
    dbeEMail: TDBEdit;
    Label43: TLabel;
    btnListaDocsTitular: TBitBtn;
    qryCidadeNOMECOMPLETO: TStringField;
    CMValidaCPF: TCMValidaDoc;
    pnlDepenJaExiste: TPanel;
    btnCancelJaExiste: TBitBtn;
    btnOkJaExiste: TBitBtn;
    Label44: TLabel;
    dbcNomeDepen: TwwDBComboBox;
    dblkpcmbTipoDependencia2: TCMDBLookupCombo;
    Label45: TLabel;
    qryBeneficio: TwwQuery;
    lkpcmbBeneficio: TCMDBLookupCombo;
    QryCbancoPref: TwwQuery;
    Label52: TLabel;
    qryplano: TwwQuery;
    UpdateSQL1: TUpdateSQL;
    tbsContato: TTabSheet;
    dbgContato: TwwDBGrid;
    Panel3: TPanel;
    mnbm: TLabel;
    lblPdeMail: TLabel;
    lblPdNome: TLabel;
    lblPdSetor: TLabel;
    lblNasc: TLabel;
    lblObs: TLabel;
    dbedcontatoemail: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox6: TGroupBox;
    dbgContatoRamal: TwwDBGrid;
    dbngContatoxTel: TDBNavigator;
    dblcTelefone: TCMDBLookupCombo;
    DBMemo1: TDBMemo;
    dbedContatoNome: TDBEdit;
    DBDateEdit2: TCMDateTimePicker;
    Panel4: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    CMDateTimePicker3: TCMDateTimePicker;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBMemo2: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    ToolbarButtonInsereContato: TToolbarButton97;
    ToolbarButtonAlteraContato: TToolbarButton97;
    ToolbarButtonExcluiContato: TToolbarButton97;
    Edit1: TEdit;
    dsContatoTel: TwwDataSource;
    qryContatoTel: TwwQuery;
    qryIDSITFUNC: TFloatField;
	PopupMenu1: TPopupMenu;
    pnlDepenBenefJaExiste: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    btnCancelJaExisteDepBenef: TBitBtn;
    btnOkJaExisteDepBenef: TBitBtn;
    dblkpcmbTipoDependencia3: TCMDBLookupCombo;
    qrySelDepBenIncluido: TwwQuery;
    dsSelDepBenIncluido: TwwDataSource;
    dblcNomeDepenBenef: TwwDBLookupCombo;
    qryAuxInsert: TwwQuery;
    qryPFIDPESSOA: TFloatField;
    qryPFIDPAIS: TFloatField;
    qryPFNOMEPAI: TStringField;
    qryPFNOMEMAE: TStringField;
    qryPFDATAMORTE: TDateTimeField;
    qryPFDATANASC: TDateTimeField;
    qryPFSEXO: TStringField;
    qryPFTIPOSANG: TStringField;
    qryPFESTCIVIL: TStringField;
    qryPFNUMDEPIRRF: TFloatField;
    qryPFNUMDEPSALF: TFloatField;
    qryPFNUMDEPTOT: TFloatField;
    qryPFFLGISENTOIRRF: TFloatField;
    qryPFFLGMOLESTIAGRAVE: TFloatField;
    qryPFDATAMOLESTIAGRAVE: TDateTimeField;
    qryPFDATAFIMMOLESTIA: TDateTimeField;
    qryPFIDGRINSTR: TFloatField;
    qryPFINICIOINVALIDEZ: TDateTimeField;
    qryPFFIMINVALIDEZ: TDateTimeField;
    qryPFIDNATURALIDADE: TFloatField;
    qryPFIDCIDADES: TFloatField;
    qryPFIDNACIONALIDADE: TFloatField;
    qryPFFLGSOMAIRSUPINSS: TFloatField;
    qryPFFLGCONTASALARIOPROCESSADA: TFloatField;
    qryPFFLGSOLICITACONTASALARIO: TFloatField;
    qryPFDTCONTASALARIOPROCESSADA: TDateTimeField;
    qryPFDTSOLICITACONTASALARIO: TDateTimeField;
    dbeEmailParticular: TDBEdit;
    Label61: TLabel;
    qryPFEMAILFUNCEF: TStringField;
    imgPessoa: TDBImage;
    Panel6: TPanel;
    dbgrdDetnCadastrado: TwwDBGrid;
    dsDepeNaoCadastrado: TwwDataSource;
    qryDepeNaoCadastrado: TwwQuery;
    btnSelecionaTodos: TSpeedButton;
    btnSelecionaAlguns: TSpeedButton;
    qryPFTIPOISENCAOIRRF: TFloatField;
    //dbrgrpMolestiaGrave: TGroupBox;
    //Label61: TLabel;
    qryMolestiaGrave: TwwQuery;
    dsMolestiaGrave: TwwDataSource;
    //dbdtMolestiaGrave: TCMDateTimePicker;
    Label62: TLabel;
    upDepenNaoCadastrado: TUpdateSQL;
    btnBuscarEndereco: TButton;
    grpbxResp: TGroupBox;
    Label9: TLabel;
    dbeRecebedor: TDBEdit;
    rdbProprio: TRadioButton;
    rdbOutro: TRadioButton;
    BtnMatricula: TSpeedButton;
    tbsReprLegal: TTabSheet;
    qryLogReprLegal: TwwQuery;
    qryLogReprLegalNUMDOCUMENTO: TStringField;
    qryLogReprLegalNOMERESPONSAVEL: TStringField;
    qryLogReprLegalNOMERECEBEDOR: TStringField;
    qryLogReprLegalTIPORESPONSAVEL: TStringField;
    qryLogReprLegalCODTIPORESPONSAVEL: TStringField;
    qryLogReprLegalSITUACAO: TStringField;
    qryLogReprLegalSITATUAL: TFloatField;
    qryLogReprLegalACAO: TStringField;
    qryLogReprLegalIDPESSJUR: TFloatField;
    qryLogReprLegalIDTITULAR: TFloatField;
    qryLogReprLegalIDPLANOORIGEM: TFloatField;
    qryLogReprLegalIDPESSOA: TFloatField;
    qryLogReprLegalSEQPROPOSTA: TFloatField;
    qryLogReprLegalIDPLANOPREV: TFloatField;
    qryLogReprLegalIDRESPONSAVEL: TFloatField;
    qryLogReprLegalIDRECEBEDOR: TFloatField;
    qryLogReprLegalDATAINICIO: TDateTimeField;
    qryLogReprLegalDATATERMINO: TDateTimeField;
    qryLogReprLegalOBSERVACAO100: TStringField;
    qryLogReprLegalOBSERVACAO: TMemoField;
    qryLogReprLegalTRGDTINCLUSAO: TDateTimeField;
    qryLogReprLegalTRGUSERINCLUSAO: TStringField;
    qryLogReprLegalNOMEUSUARIO: TStringField;
    dsLogReprLegal: TwwDataSource;
    qryReprLegal: TwwQuery;
    qryReprLegalNUMDOCUMENTO: TStringField;
    qryReprLegalNOMERESPONSAVEL: TStringField;
    qryReprLegalTIPORESPONSAVEL: TStringField;
    qryReprLegalNOMERECEBEDOR: TStringField;
    qryReprLegalDATAINICIO: TDateTimeField;
    qryReprLegalDATATERMINO: TDateTimeField;
    qryReprLegalSITUACAO: TStringField;
    qryReprLegalOBSERVACAO100: TStringField;
    qryReprLegalTRGDTINCLUSAO: TDateTimeField;
    qryReprLegalNOMEUSUARIO: TStringField;
    qryReprLegalCODTIPORESPONSAVEL: TStringField;
    qryReprLegalSITATUAL: TFloatField;
    qryReprLegalIDPESSJUR: TFloatField;
    qryReprLegalIDTITULAR: TFloatField;
    qryReprLegalIDPLANOORIGEM: TFloatField;
    qryReprLegalIDPESSOA: TFloatField;
    qryReprLegalSEQPROPOSTA: TFloatField;
    qryReprLegalIDPLANOPREV: TFloatField;
    qryReprLegalIDRESPONSAVEL: TFloatField;
    qryReprLegalIDRECEBEDOR: TFloatField;
    qryReprLegalOBSERVACAO: TMemoField;
    qryReprLegalTRGUSERINCLUSAO: TStringField;
    updReprLegal: TUpdateSQL;
    dsReprLegal: TwwDataSource;
    pnlGrdReprLegal: TPanel;
    dbgrdLogReprLegal: TwwDBGrid;
    dbgrdReprLegal: TwwDBGrid;
    pnlReprLegal: TPanel;
    grpResponsavel: TGroupBox;
    sbtnSelResponsavel: TSpeedButton;
    sbtnCadResponsavel: TSpeedButton;
    Label32: TLabel;
    Label3: TLabel;
    dbeResponsavel: TDBEdit;
    lkpcmbTipoRecebedor: TCMDBLookupCombo;
    lblCPFRes: TLabel;
    DBeCPFRes: TwwDBEdit;
    grpInformacao: TGroupBox;
    lbl5: TLabel;
    lbl3: TLabel;
    tmpckrDATAINICIO: TCMDateTimePicker;
    rgSituacaoAtual: TRadioGroup;
    tmpckrDATAtermino: TCMDateTimePicker;
    grpObs: TGroupBox;
    dbmmoOBSERVACAO: TDBMemo;
    qryBenef: TwwQuery;
    qryBenefIDPESSJUR: TFloatField;
    qryBenefIDTITULAR: TFloatField;
    qryBenefIDPLANOPREV: TFloatField;
    qryBenefIDPESSOA: TFloatField;
    qryBenefIDBENEFICIO: TFloatField;
    qryBenefSEQPROPOSTA: TFloatField;
    qryBenefIDDEPENRESPON: TStringField;
    qryBenefIDRESPONSAVEL: TFloatField;
    qryBenefIDRESPONNAOREC: TFloatField;
    qryBenefIDNUCLEOFAMILIAR: TFloatField;
    qryBenefPRIORIDADE: TFloatField;
    qryBenefPERCENTUAL: TFloatField;
    qryBenefCODTIPORECEBEDOR: TStringField;
    qryBenefDATAFIMRECEB: TDateTimeField;
    qryBenefBENEFICIO: TStringField;
    qryBenefRECEBEDOR: TStringField;
    qryBenefRESPONSAVEL: TStringField;
    qryBenefTIPORECEBEDOR: TStringField;
    qryBenefIDREGRABENEFICIA: TFloatField;
    qryBenefIDPLANOORIGEM: TFloatField;
    qryBenefDATAINICIO: TDateTimeField;
    qryBenefVALORATUAL: TFloatField;
    qryBenefSITBENEFICIO: TStringField;
    qryBenefIDREGRAFIM: TFloatField;
    qryBenefPLANO: TStringField;
    qryBenefCPFRECEBEDOR: TStringField;
    qryBenefCPFRESPONSAVEL: TStringField;
    updBenef: TUpdateSQL;
    cmbEstCivDepBen: TwwDBLookupCombo;
    cmbEstCiv: TwwDBLookupCombo;
    dsEstCivil: TwwDataSource;
    qryEstCivil: TwwQuery;
qryDependenciaAux: TwwQuery;
    pnlDataHabilitacao: TPanel;
    Label10: TLabel;
    cbxDataHabilitacao: TCMDateTimePicker;
    pnlCategoria: TPanel;
    Label65: TLabel;
    edtCategoria: TwwDBEdit;
    qryDocumentoCATEGCNH: TStringField;
    qryDocumentoOBRIGAPRMHAB: TStringField;
    qryDocumentoOBRIGACATG: TStringField;
    qryTipoDocOBRIGAPRMHAB: TStringField;
    qryTipoDocOBRIGACATG: TStringField;
    qryDocumentoDTPRIMEIRACNH: TDateTimeField;
    qryBenefIDTPPAGTOBENEFIC: TFloatField;
    qryPFCODESTADO: TStringField;
    pnlTipoDocumento: TPanel;
    LbTpDocumento: TLabel;
    dbcmbTipoDocumento: TCMDBLookupCombo;
    qryTipoDocumento: TwwQuery;
    qryDocumentoEXIBEUF: TStringField;
    qryDocumentoEXIBEORGAO: TStringField;
    qryDocumentoEXIBEEMISSAO: TStringField;
    qryDocumentoEXIBEVALIDADE: TStringField;
    qryDocumentoEXIBEPRMHAB: TStringField;
    qryDocumentoEXIBECATG: TStringField;
    qryDocumentoEXIBEPAIS: TStringField;
    qryDocumentoOBRIGAPAIS: TStringField;
    qryDocumentoIDTIPODOCPESSOAXMASC: TFloatField;
    qryDocumentoFLGMULTIPLAMASCARA: TStringField;
    qryTipoDocEXIBEUF: TStringField;
    qryTipoDocEXIBEORGAO: TStringField;
    qryTipoDocEXIBEEMISSAO: TStringField;
    qryTipoDocEXIBEVALIDADE: TStringField;
    qryTipoDocEXIBEPRMHAB: TStringField;
    qryTipoDocEXIBECATG: TStringField;
    qryTipoDocEXIBEPAIS: TStringField;
    qryTipoDocOBRIGAPAIS: TStringField;
    qryTipoDocFLGMULTIPLAMASCARA: TStringField;
    pnlPais: TPanel;
    Label91: TLabel;
    dbcmdPais: TCMDBLookupCombo;
    qryPaisIDPAIS: TFloatField;
    qryPaisNOMEPAIS: TStringField;
    qryPaisCODINTERNACIONAL: TStringField;
    qryPaisNOMENACIONALIDADE: TStringField;
    grpTelDepen: TGroupBox;
    dbedtDDIDepen: TDBEdit;
    lblNmConjuge: TLabel;
    dbeNomeConjuge: TwwDBEdit;
    qryPFNOMECONJUGE: TStringField;
    pnlMemo: TPanel;
    lblInfoAdicionais: TLabel;
    dbgrInfoAdicionais: TwwDBGrid;
    Label66: TLabel;
    Label67: TLabel;
    dbedtDDDDepen: TDBEdit;
    Label68: TLabel;
    edtTelDepen: TwwDBEdit;
    grbTipoTelDepen: TGroupBox;
    wwDBTpDepen: TwwDBComboBox;
    chklstTipoTelDepen: TCheckListBox;
    strngfldBenefOBSERVACAO: TStringField;
    qryPFIDTELEFONE: TFloatField;
    qryPFDDI: TStringField;
    qryPFDDD: TStringField;
    qryPFNUMERO: TStringField;
    qryPFTIPO: TStringField;
    qryPFTComercial: TStringField;
    qryPFTParticular: TStringField;
    qryPFTFax: TStringField;
    qryPFTCelular: TStringField;
    qryPFTRecado: TStringField;
    grpBPlanPrev: TGroupBox;
    lblDataCancelamentoREG: TLabel;
    lblDataCancelamentoREB: TLabel;
    lblDataCancelamentoNvPlan: TLabel;
    DBCheckBox1: TDBCheckBox;
    Chkregreplan: TCheckBox;
    Chkreb: TCheckBox;
    Chknovoplano: TCheckBox;
    DtCancReb: TCMDateTimePicker;
    dtCancRegReplan: TCMDateTimePicker;
    dtCancNovoPlano: TCMDateTimePicker;
    grpObserv: TGroupBox;
    dbmmoOBS: TDBMemo;
    grpObsDepen: TGroupBox;
    memObsDepen: TDBMemo;
    qryBeneficio2: TwwQuery;
    qryOcupacao: TwwQuery;
    dsOcupacao: TwwDataSource;
    updOcupacao: TUpdateSQL;
    gbxBotoes: TGroupBox;
    tb97BotoesDetalhe2: TPanel;
    sbtnInsDet2: TToolbarButton97;
    sbtnAltDet2: TToolbarButton97;
    sbtnExcluiDet2: TToolbarButton97;
    edPaiDetalhe2: TEdit;
    qryPF2: TwwQuery;
    qryPFINFOADICIONAIS: TMemoField;
    updPf2: TUpdateSQL;
    dsPF2: TwwDataSource;
    dbMemInfoAdicionais: TDBMemo;
    lblPaiDetalhe: TLabel;
    qryOcupacaoIDPESSOAPPE: TFloatField;
    qryOcupacaoCARGOEMPFUNC: TStringField;
    qryOcupacaoENTIDADE: TStringField;
    qryOcupacaoRENDA: TFloatField;
    qryOcupacaoDTINICIO: TDateTimeField;
    qryOcupacaoDTFIM: TDateTimeField;
    qryOcupacaoIDPESSOA: TFloatField;
    dbgrpContaResg: TDBRadioGroup;
    updCBancoPref: TUpdateSQL;
    chkAssociaEnd: TCheckBox;
    qryRamalIDCONTATO: TFloatField;
    qryRamalIDTELCONTATO: TFloatField;
    qryRamalIDTELEFONE: TFloatField;
    qryRamalRAMAL: TStringField;
    qryRamalNUMERO: TStringField;
    qryRamalIDPESSOA: TFloatField;
    qryRamalNOME: TStringField;
    qryRamalEMAIL: TStringField;
    qryRamalCARGO: TStringField;
    qryRamalSETOR: TStringField;
    dbgContatoRamal1: TDBGrid;
    gbxInforAdicionais: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    dbeOcupProfissional: TwwDBEdit;
    dbeEntidade: TwwDBEdit;
    dtpDataInicio: TCMDateTimePicker;
    dtpDataFim: TCMDateTimePicker;
    dbeRenda: TDBRealEdit;
    pnlPessFis: TPanel;
    grpDependentes: TGroupBox;
    lblnDepIRRF: TLabel;
    lblNDepSalFam: TLabel;
    lblNTotalDep: TLabel;
    dbseNumDepIRRF: TwwDBSpinEdit;
    dbseNumDepSalF: TwwDBSpinEdit;
    dbseNumDepTot: TwwDBSpinEdit;
    grbNatural: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    dblkpcmbNaturalidade: TwwDBLookupCombo;
    dblkpcmbNacionalidade: TwwDBLookupCombo;
    dblkpcmbCidade: TwwDBLookupCombo;
    grpContaSalario: TGroupBox;
    lblDtSolicitacao: TLabel;
    dbchkcontasalario: TDBCheckBox;
    dbchksolicitacontasalario: TDBCheckBox;
    dtsolicitacontasalario: TCMDateTimePicker;
    grpContaProcessada: TGroupBox;
    lbldtprocessada: TLabel;
    dbchk2: TDBCheckBox;
    dbchkSalarioProcessado: TDBCheckBox;
    dtcontasalarioprocessada: TCMDateTimePicker;
    dbrdgrpFlags: TGroupBox;
    dbchkbxDesignado: TDBCheckBox;
    dbchkbxFlgDepLegal: TDBCheckBox;
    dbchkbxFlgContaImpostoR: TDBCheckBox;
    dbchkbxContaSalarioF: TDBCheckBox;
    dbchkIsentoIR: TDBCheckBox;
    DbCkElegivel: TDBCheckBox;
    DbChbIgnoraIR: TDBCheckBox;
    dbgrpDatas: TGroupBox;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    dbdtInicioIR: TCMDateTimePicker;
    dbdtFimIR: TCMDateTimePicker;
    dbdtInicioInvalidez: TCMDateTimePicker;
    dbdtFimInvalidez: TCMDateTimePicker;
    dbdtInicioSalFamilia: TCMDateTimePicker;
    dbdtFimSalFamilia: TCMDateTimePicker;
    DbChbSomaIR: TDBCheckBox;
    pnlMolestiaIR: TPanel;
    pnlOutrosItens: TPanel;
    wwDBCBIsentoIrrf: TwwDBComboBox;
    BitBtnHistorico: TButton;
    dbrgrpIsentoIR: TDBRadioGroup;
    dbrgrpMolestiaGrave: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    dbdtMolestiaGrave: TCMDateTimePicker;
    CMDateTimePicker5: TCMDateTimePicker;
    rbNaoDepen: TRadioButton;
    rbSimDepen: TRadioButton;
    qryPFIDESTADO: TFloatField;
    dbchkbxFlgPlanoSaude: TDBCheckBox;
    grpTipoOpIR: TGroupBox;
    Label75: TLabel;
    cmbTipoOpIR: TwwDBComboBox;
    qryBenefTIPOOPCAOIR: TFloatField;
(*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    procedure AtualizaGridContatos();
    procedure marcarFlagPlanoAtivo();
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure qryPessoaBeforePost(DataSet: TDataSet);
    procedure qryDepenBeforePost(DataSet: TDataSet);
    procedure qryPFBeforePost(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure qryEndPessBeforePost(DataSet: TDataSet);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dbeContaCorrenteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lkpcmbbxBancoChange(Sender: TObject);
    procedure qryBenefBeforePost(DataSet: TDataSet);
    procedure qryCBancoBeforePost(DataSet: TDataSet);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
(*====================================================================================================
  INÍCIO - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    procedure edDigBancoExit(Sender: TObject);
    procedure lkpcmbbxBancoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure lkpcmbbxAgenciaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure rdbProprioClick(Sender: TObject);
    procedure sbtnCadRecebedorClick(Sender: TObject);
(*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure qryCBancoAfterEdit(DataSet: TDataSet);
    procedure qryCBancoAfterScroll(DataSet: TDataSet);
    procedure dbrgrpFlgMolestiaGraveClick(Sender: TObject);
    procedure qryBenefAfterPost(DataSet: TDataSet);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lstDocumentosChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lstDocumentosDblClick(Sender: TObject);
    procedure edDocNumDocumentoExit(Sender: TObject);
    procedure dbcmbEstadoDocChange(Sender: TObject);
    procedure btnAssociarimgPessoaClick(Sender: TObject);
    procedure PessoaChangePessoa(IdPessoa: Integer);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dsImagemDataChange(Sender: TObject; Field: TField);
    procedure qryDepBenBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure cmbEstCivChange(Sender: TObject);
    procedure chkTipoTelefoneClick(Sender: TObject);
    procedure qryTelefoneCalcFields(DataSet: TDataSet);
    procedure dsTelefoneDataChange(Sender: TObject; Field: TField);
    procedure qryPFAfterScroll(DataSet: TDataSet);
  //  procedure cmbEstCivDepBenChange(Sender: TObject);  //William Santana - SOL 209384/15928 KIN 2062832
    procedure qryDepBenPFBeforePost(DataSet: TDataSet);
    procedure qryDepBenPFAfterScroll(DataSet: TDataSet);
    procedure qryDepBenDepenBeforePost(DataSet: TDataSet);
    procedure dbrgrpMolGraveDepenClick(Sender: TObject);
    procedure dbdeDataNascExit(Sender: TObject);
    procedure dblkpcmbGrauInstrExit(Sender: TObject);
    procedure sbtnSelResponsavelClick(Sender: TObject);
    procedure sbtnCadResponsavelClick(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure pgctrlDetalheEnter(Sender: TObject);
    procedure lstDocumentosExit(Sender: TObject);
    procedure qryOutrasInformsBeforePost(DataSet: TDataSet);
    procedure PessoaChangeSubtipo(IdPessoa: Integer);
    procedure btnListaDocsTitularClick(Sender: TObject);
    procedure dblkParamPessoaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbeCPFExit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure btnOkJaExisteClick(Sender: TObject);
    procedure btnCancelJaExisteClick(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edDocNumDocumentoEnter(Sender: TObject);
    procedure DBEDDDDKeyPress(Sender: TObject; var Key: Char);
    procedure DBEDNUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure qryTelefoneAfterInsert(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);

    procedure ChkregreplanClick(Sender: TObject);
    procedure ChkrebClick(Sender: TObject);
    procedure ChknovoplanoClick(Sender: TObject);
    procedure qryPessoaBeforeDelete(DataSet: TDataSet);
    procedure dbdeDataCadastroExit(Sender: TObject);
    procedure qryRamalAfterInsert(DataSet: TDataSet);
    procedure qryRamalUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure dblcTelefoneCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ToolbarButtonInsereContatoClick(Sender: TObject);
    procedure ToolbarButtonAlteraContatoClick(Sender: TObject);
    procedure ToolbarButtonExcluiContatoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dblkpcmbSitDependenteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbChbIgnoraIRClick(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbdtFimIRExit(Sender: TObject);
	procedure dbeNomeDepBenExit(Sender: TObject);
    procedure btnOkJaExisteDepBenefClick(Sender: TObject);
    procedure btnCancelJaExisteDepBenefClick(Sender: TObject);
    procedure dblkpcmbTipoDependencia3Change(Sender: TObject);
    procedure dblcNomeDepenBenefChange(Sender: TObject);
    procedure dbeNomeDepBenEnter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure qryDepBenPessoaUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qryDepBenPFUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qryDepBenDepenUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure dbchksolicitacontasalarioClick(Sender: TObject);
    procedure dbchkSalarioProcessadoClick(Sender: TObject);
	procedure wwDBCBIsentoIrrfChange(Sender: TObject);
    procedure BitBtnHistoricoClick(Sender: TObject);
    procedure dbrgrpIsentoIRClick(Sender: TObject);

    //procedure InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia: string ; iIdPessoa:integer); //Taffarel - SIG68507/71228
    procedure
    dbdtMolestiaGraveClick(Sender: TObject);
    procedure CMDateTimePicker5Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    //HIGOR 184394
    procedure btnSelecionaTodosClick(Sender: TObject);
    procedure btnSelecionaAlgunsClick(Sender: TObject);
    Procedure GravarDepenNaoCadastrado;
    procedure dbgrdDetnCadastradoDblClick(Sender: TObject);
    Procedure SelecionaDenpNCadastrado;
    Procedure CancelaCadastroDenpNCadastrado;
    procedure btnBuscarEnderecoClick(Sender: TObject);
    //HIGOR 184394

    // INICIO - Flávio Souza SOL: 200953 KINTANA: 1952412;

      procedure CmeDetalheCancel(Sender: TObject);
      procedure BtnMatriculaClick(Sender: TObject);

    // FIM - Flávio Souza SOL: 200953 KINTANA: 1952412;

    // Inicio - Flávio Souza SOL: 208475 KINTANA: 2016859;
    procedure dblkpcmbTipoDependenciaChange(Sender: TObject);
    procedure dbrdgrpSexoChange(Sender: TObject);
    // Fim - Flávio Souza SOL: 208475 KINTANA: 2016859;

    //Início - William Santana - SOL 161550 KIN 1717512
    procedure timepickerDATAChange(Sender: TObject);
    procedure rgSituacaoAtualClick(Sender: TObject);
    procedure qryReprLegalBeforePost;
    procedure lkpcmbTipoRecebedorChange(Sender: TObject);
    procedure dbgrdBeneficiarioColEnter(Sender: TObject);
    procedure qryBenefAfterScroll(DataSet: TDataSet);
    //Término - William Santana - SOL 161550 KIN 1717512

    //BRUNO AZEVEDO SOL 244852 PPM 626115
    procedure VerificaPermissao();
    procedure dblkpcmbNacionalidadeChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure chklstTipoTelDepenClick(Sender: TObject);
    procedure wwDBTpDepenChange(Sender: TObject);
    procedure qryPFCalcFields(DataSet: TDataSet);  //Michelle Mota - SIG: 20771
    procedure dbcmbTipoDocumentoChange(Sender: TObject);   // Darivaldo Alencar - SIG 33695
    procedure dbeNomeKeyPress(Sender: TObject; var Key: Char);
    procedure rbSimDepenClick(Sender: TObject);
    procedure rbNaoDepenClick(Sender: TObject);
    procedure ChkregreplanMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChkrebMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChknovoplanoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dtCancRegReplanExit(Sender: TObject);
    procedure dtCancREBExit(Sender: TObject);
    procedure dtCancNovoPlanoExit(Sender: TObject);
    procedure dbeEMailExit(Sender: TObject);
    procedure memObsDepenKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaEmailFuncef(sIdpessoa: String); //Andre Imakawa SIG25312
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnInsDet2Click(Sender: TObject);
    procedure sbtnAltDet2Click(Sender: TObject);
    procedure sbtnExcluiDet2Click(Sender: TObject);
    procedure dbngContatoxTelBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure dbgContatoRamal1CellClick(Column: TColumn);
    procedure qryRamalNUMEROValidate(Sender: TField);
    procedure cmbCidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbNacionalidadeExit(Sender: TObject);
    procedure dbchkbxFlgDepLegalClick(Sender: TObject);
    procedure dbchkbxFlgPlanoSaudeClick(Sender: TObject);
    procedure cmbTipoOpIRCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    //procedure qryReprLegalAfterDelete(DataSet: TDataSet);

  private { Private declarations }
    bGridPadrao         : boolean;//Darivaldo Alencar SIG 27871
    bTtravarCadastro: Boolean;//Darivaldo Alencar SIG 33695
    sDocumentoAnt       : string;
    iSeq, iSeqDepBen    : integer;
    OpDetalhe           : String;
    OpDependente        : String; //HIGOR 184394
    DataHoje            : TDateTime;
    sFiltroBenef        : string;
    IdPessoa            : integer;  //HIGOR 184394
    sIdPessoaDepen      : String;   //Darivaldo Alencar SIG 25312
    bAtualizaSitDepen   : boolean;  //edilaine - SIG25312
    bAtualizaGridDep    : boolean;  //edilaine - SIG25312
    EstadoAnt           : TDataSetState;
    bInseriuRecebProprio,
    bRodandoElegibilidade,
    bResponsaProprioNovo   : boolean;
    flgGravaDepent         : Boolean; // flg de verificação ao salvar dependente chamada de qual botão //HIGOR 184394
    bRecebProprioNovo   : boolean;
    idttitular : String;
//  Variavel para teste de retenção de benefício por mudança no estado civil.
    bReterBenEstCivil   : boolean;
//  Variavel para teste de retenção de benefício por completar maior idade.
    bReterBenMaiorIdade : boolean;
//  Variavel para teste de retenção de benefício por completar curso superior.
    bReterBenSuperior : boolean;
//  Variavel Array para guardar benefícios retidos
    aRegBen             : Array of TRetBen;
    iIdPlanoPrevBenef   : Integer;
    // Variável para indicar o reaproveitamento do IDPESSOA
    bJaExisteIdPessoa   : Boolean;
    // vinicius ferreira
    flgcpf, flgnome : Boolean;

    sDataAnt            : String; // Renato Visoni SOL 130508/4762 kintana 1269185

    sContaPref: String; //Renato Visoni SOL 97628 \ Kintana 431568
    dtDatainicioMolestiaAlterar,
    dtDataFimMolestiaAlterar  : TDateTime;

    sDatainicioMolestiaAlterar ,
    sDataFimMolestiaAlterar : string;

    //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
    // Variaveis criadas para comparar campos da tela CadastroPrev-Cadastros-Dependentes e Beneficiário-Cadastro
    sNome, sMatricula, sFatorRH, sCPF, sEmailDepen, sNomePai, sNomeMae,
    sDNasci , sDcadas, sDfaleci, sSitDepen, sGraParen, sGrauIns,
    sIRRF, sSalFam, sTotal, sNaturalidade, sNacionalidade, sCidade, sIniMolestia,
    sFimMolestia, sDatIniIR, sDatFimIR, sDatIniSalFam, sDatFimSalFam, sDatIniInvali,
    sDarFimInvali, sEstCivil, sDataSoli, sDataProcess :String;

    sDesignado, sSalarioFamilia, sImpostoRenda, sDepenLegal, sIsentoImpRenda,
    sIgnImpRenda,sRegPlan, sReb, sDescIRINSS, sNovoPlano, sSolContSal,
    sContSalProc, EmitiuMsgNovoPlano, FlgMsg, sFlgPlanoSaude: Boolean;

    sMolestiaGrave, sIsentoIR, sSexo : SmallInt;
   //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim

    MatriculaBenefInicial: String;  // Flávio Souza SOL: 200953 KINTANA: 1952412;
    bDependenteMaior : Boolean; // Felipe A. Santos SOL 208093 KTN 2016011
    bDepNaoCad : Boolean; // Felipe A. Santos SOL: 208475 KINTANA: 2016859;

    //Início - William Santana Sol 161550 KIN 1717512
    bVeiodoBenefProprio, bVeiodoBenefResp, bIns, bAlt : Boolean ;
    Linha: TBookmark;
    sBenef, sPrio, sPerc : String;
    iBenef : Integer;
    bMudaStatusPorData : boolean;
    bConfirmaPeloDetalhe : boolean;
    sGuardaEstAnt   : TDataSetState; // Wylliam Leite da Silva SOL 258918 PPM 1007497
    procedure PintarCampos(lEdit: array of TComponent;  Color: TColor);//Darivaldo Alencar SIG 33695
    function  VerificaReprLegal: Boolean;
    procedure IntegraBenef_ReprLegal(acao: integer);
    procedure PreencheCamposRepresentante;
    function  VerificaReprBeneficiosAtivos : boolean;
    procedure CarregaDadosRepresentanteLegal;
    //Término - William Santana Sol 161550 KIN 1717512

    function ValidaParticipanteInvalido: boolean; //Fanuel Junior SOL162981  Kintana1390416
    function  ExcedeCemPorCento: boolean;
    procedure RodaRegraElegibilidade;
    //           DADOS DOS DEPENDENTES.
    Procedure AtualizaDadosTitular;
    procedure ConfiguraTelaPorTipoDependente;

    function Grava(bApagaFilhos:Boolean):integer;
    function  VerifPlanoTitular(qryaux : TwwQuery; sidplanoprev, sidpessoa: string): Boolean;
    function  ExistePlanoPrev(qryaux : TwwQuery; sidplanoprev, sidpessoa, sidpessjur: string): Boolean;
    procedure AtuTipo;
    procedure MudaTipo;
    procedure AtuDocumentos;
    Procedure MudaDocumento;
    Procedure MostraDocumento;
    Procedure InsereDocumento;
    procedure AssociaImagem(ds : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
    procedure Ramal(Alteracao:integer);
    procedure LimpaArray;
    function VerElegBen(iCampo : Integer) : Boolean;
    function DataUltimaAlteracao(idPessoa : Integer) : boolean; // William Moreira da Silva SOL 165677
    Function TestaDepenIR() : Boolean;
    Function ValidaPlano(IDtitular : String) : Boolean;//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834
                                                      //Function que valida se o titular possui idplano 74 e idsitpart(11, 12, 4, 15)
    procedure AtualizaNumeroDependentes(iIdTitular, iIdDependente : Integer;
                                        sFlgInterno, sDtNasc, sDtIniIR, sDtFimIR,
                                        sDtIniSalFam, sDtFimSalFam,
                                        sEstCiv, sTipoDepen, sGrInstr : String;
                                        iSexo : Integer
                                       );

    Function HabilitaCheckDependente(IdEmpresa : Integer): Boolean;
    procedure RodaRegraDataFinal;
    procedure ValidaCampoNumericoDDD(var Key: char);
    procedure ValidaCampoNumerico(var Key: char);
    Procedure JaExisteDenBenCpfNome;
    function  VerificaTipoDenpedit(sFiltro, sIdTitular, sIDPessoa, sSexo :String) : Boolean;//André Oliveira SOL 165678 KINTANA 1470728

    //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
    procedure PreencheCompCamp;// procedure que compara os campos da tela:CadastroPrev->Cadastros->Dependentes e Beneficiário->Cadastro
    procedure ComparaCampos;// procedure que preenche variaveis criadaspara comparar os campos da tela CadastroPrev-Cadastros-Dependentes e Beneficiário-Cadastro
    //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim

    // Inicio - Flávio Souza SOL: 208475 KINTANA: 2016859;
    procedure AtribuiNome;
    function HabilitaCampoNome : Boolean;
    function  VerificaPaiMae : Boolean;
    procedure ControlaCampoNome;
    // Fim - Flávio Souza SOL: 208475 KINTANA: 2016859;

    function DependenteMaiorIdade : boolean; // Felipe A. Santos SOL 208093 KTN 2016011

    function DependenteMenor16Anos : boolean; // Edilaine - SIG 25313
    //Darivaldo Alencar SIG 27871 -inicio
    procedure MostraEscondeGridOutrasInformacoes(MostraGrids: Boolean = false);
    procedure MostraGridInformacoesAdicionais(bMostrar: Boolean);
    procedure AlinhaComponente(tpAlinhamento: TAlign);
    procedure FormataEdit(Edit: TEdit);
    function GetSequence(sTabela: String): String;
    procedure AtivaGrid(nmDbGrid: twwdbgrid);
    procedure ExcluiDependenteDuplicado;
    procedure BuscaOBSR;
    //Darivaldo Alencar SIG 27871 -fim

    function  verificaAlteracaoDepCancelado(iRegra: Integer):Boolean; //William Santana - SIG 25312
    procedure habilitaAlteracaoDepCancelado(b : Boolean; iTipo: Integer = 1); //William Santana - SIG 25312
    function  VerifCancPlanoTitular(QryAux : TwwQuery; iIdplanoprev, iIdpessoa: Integer ): TDateTime;//William Moreira - SIG 25312

    //Darivaldo Alencar SIG25312 -inicio
    function  PossuiRegistroAssociado(QryAux : TwwQuery; iIdplanoprev, iIdpessoa,iIdPessJur: Integer ): Boolean;
    function  ValidaEMail(const EMailIn : String) : Boolean;
    function  PlanoCancelado(iIdPlano: Integer): Boolean;
    Procedure DesmarcaPlano(iIdPlano: Integer);
    Procedure GravaDataCancelamento(sIdPlanoPrev: String);
    procedure AtlzSitDepen;
    function  ValidarCpf(num: string): boolean;
    //Darivaldo Alencar SIG25312 -fim

    //edilaine - SIG25312 - inicio
    procedure AjustaGridDependentes(sFiltro : string);
    function  VerificaTipoCtaBanco(TipoValida : TTipoCtaBancaria; iIdTitular, iIdPessoa : Integer) : Boolean;
    procedure SetupGridPickList(const FieldName : string);
    procedure HabilitaCRUDDetalhe;
    procedure MontaListaFiltraPlanos;
    function getNomePlano(sidplanoprev: String):String;
    //edilaine - SIG25312 - fim

  public  { Public declarations }

    iIdCalculo : Integer; // Flávio Souza SOL: 200953 KINTANA: 1952412;
    sIdPessoa , sIdPessJur, sIdPlanoPrev, sIdtitular: String; //Adler Souza SOL 134214 Kintana 787470
    sEstCiv, sEstCivDepBen : String;
    vNumdocInicial, vNomeInicial: String;
    pIdBenef  : integer; //Marcio Sanches Spinosa SOL 205681 Kintana 1992276
    Procedure SelecionaDependente(pIdPessoa, pIdPessJur,pIdPlanoPrev: String);
    function VerificaContaPref(pIdPessoa:String;pIdTitular:String):Boolean; //Renato Visoni SOL 97628 \ Kintana 431568

    procedure HabilitaCamposEndereco(Estado : Boolean); // TADEU PASSOS SOL 190718 KTN 1804738

    //Darivaldo Alencar SIG 33695 -inicio
      function ValidaEntrada: boolean;
      function SoNumero(fField : String): String;
      function SelMascara(sIdDocumento: String; sIdTipoDocPessoaxMasc: String): String;
      function CarregaTipoDocumento (sIdDocumento: String;sIdTipoDocPessoaxMasc: String): String;
      //Darivaldo Alencar SIG 33695 -fim
      procedure PreencheDataMolestiaGrave(dataini, datafim: string); //Taffarel - SIG68507/71228
  end;

var
  frmCadDepenBenef: TfrmCadDepenBenef;
  frmHistMolestiaGrave : TfrmHistMolestiaGrave;

implementation
{$R *.DFM}
uses
  UAdmPrev, UMensErro, UDataBase, UCalcDV, FTelaAut, FCadResponsa,
  UBeneficio, fAguarde, DAPrev, fEscolhePessoa, fImagemDoc, uSistema, FConsPessoaGeral,
  fCadOpcoesElegivel, FListaDocs, FConsEnderCadElegivel;



procedure TfrmCadDepenBenef.LimpaArray;
Var
 I : Integer;
begin
//    limpa o array record
      For I := Low(aRegBen) to High(aRegBen) do
       Begin
        aRegBen[I].IDPESSOA:=0;
        aRegBen[I].IDPESSJUR:=0;
        aRegBen[I].IDPLANOPREV:=0;
        aRegBen[I].IDTITULAR:=0;
        aRegBen[I].SEQPROPOSTA:=0;
        aRegBen[I].IDPESSOA:=0;
        aRegBen[I].IDBENEFICIO:=0;
        aRegBen[I].NUMEROPROCESSO:=0;
        aRegBen[I].VALORATUAL:=0;
        aRegBen[I].VALORCOTAS:=0;
        aRegBen[I].VALORTOTAL:=0;
        aRegBen[I].FLGDATAPREVISTA:=0;
        aRegBen[I].IDSITBENEFICIO:=0;
        aRegBen[I].DATAFINALPREVISTA:='';
        aRegBen[I].DATAFINAL:='';
        aRegBen[I].DATAINICIO:='';
       End;
end;

function TfrmCadDepenBenef.ExistePlanoPrev(qryaux : TwwQuery; sidplanoprev, sidpessoa, sidpessjur: string): Boolean;
Var Sql :string;
begin
   Sql := '';
   Sql := 'SELECT IDPLANOPREV '+
          'FROM   CM.PLANODEPENDENTE '+
          'WHERE  IDPESSJUR    = '''+ sidpessjur + ''''+
          'AND    IDPESSOA     = '''+ sidpessoa + ''''+
          'AND    IDPLANOPREV  = '''+ sidplanoprev + '''';
   qryaux.sql.clear;
   qryaux.sql.add(Sql);
   try
      qryaux.open;
   except

   end;
   if qryaux.isempty then
      result := false
   else
      result := true;
end;

function TfrmCadDepenBenef.VerifPlanoTitular(qryaux : TwwQuery; sidplanoprev, sidpessoa: string): Boolean;
Var Sql :string;
begin
   Sql := '';
   Sql := 'select idpessoa, idplanoprev '+
          'from cm.PARTPREVPLAN '+
          'where idpessoa = '+ Qry.FieldByname('IDPESSOA').asString + //Renato Visoni SOL 152058 Kintana 1136987
          'and idplanoprev    = '''+ sidplanoprev + '''';
   qryaux.sql.clear;
   qryaux.sql.add(Sql);
   try
      qryaux.open;
   except


   end;
   if qryaux.isempty then
      result := false
   else
      result := true;
end;

function TfrmCadDepenBenef.VerElegBen(iCampo: Integer): Boolean;
// Codificação do parâmetro iCampo:
// 1 - Nascimento
// 2 - Mudança de Estado Civil
// 3 - Grau de Instrução
Var
 bOk,
 bErro    : Boolean;
 sMsgErro : String;
 iPont    : Integer;
 qryPar   : TwwQuery;
begin
  Result := False;

//  Verifica se já foi feito teste e, se for o caso, sai da função
  If (bReterBenEstCivil) or (bReterBenMaiorIdade) or (bReterBenSuperior)
   Then Exit;

  if (Not qryBciario.Active) Or (qryBciario.isempty)
   then exit;

//  Verifica se há benefício ativo
  If qryBciario.RecordCount > 0
   Then
//   Caso seja Data de Nascimento então verifica atraves da regra
//   se completou maioridade
    If iCampo = 1 Then
     Begin
//   Cria query virtual para ler o parâmetro da regra de maioridade
      qryPar := TwwQuery.Create(Self);
      qryPar.DatabaseName := qry.DatabaseName;
//   Escreve a query e dá o open
      qryPar.SQL.Clear;
      qryPar.SQL.Add('SELECT IDREGRAMOTIVO FROM PARAMAPREV');
      qryPar.Open;
     End;
//  Se houver roda regra de elegiblidade
    With qryBciario do
     Begin
//    seta o tamanho do array (aRegBen) para a quantidade de benefícios existentes
//    e limpa o array
      SetLength(aRegBen, RecordCount);
      First;
      LimpaArray;

      iPont:=0;
      While not Eof do
       Begin
        bOk := ExecutaRegraElegibilidadeBfciario(qryTRegra,
                                                 FieldByName('IDREGRABENEFICIA').AsInteger,
                                                 FieldByName('IDPESSJUR').AsInteger,
                                                 FieldByName('IDPLANOPREV').AsInteger,
                                                 FieldByName('IDTITULAR').AsInteger,
                                                 FieldByName('IDPESSOA').AsInteger,
                                                 FieldByName('SEQPROPOSTA').AsInteger,
                                                 FieldByName('IDBENEFICIO').AsInteger,
                                                 FieldByName('VALORBASE1').AsFloat,
                                                 FieldByName('VALORBASE2').AsFloat,
                                                 FieldByName('VALORBASE3').AsFloat,
                                                 FieldByName('DATAINICIOFUND').AsString,
                                                 FieldByName('DATAINICIO').AsString,
                                                 FieldByName('DATADEMISSAO').AsString,
                                                 bErro,
                                                 sMsgErro,
                                                 FieldByName('FLGTIPOINSS').AsInteger);
//      Se não for elegível, guarda os dados do beneficio/beneficiario
//      para no momento do OK final reter o(s) benefício(s)
        If (Not bOk) Then
         Begin
          Case iCampo Of
           1 : Result := Not (RegraBooleana(qryPar.FieldByName('IDREGRAMOTIVO').AsString,'',bErro));
           2 : Result := True;
          End;
          aRegBen[iPont].IDPESSJUR         := FieldByName('IDPESSJUR').AsInteger;
          aRegBen[iPont].IDPLANOPREV       := FieldByName('IDPLANOPREV').AsInteger;
          aRegBen[iPont].IDTITULAR         := FieldByName('IDTITULAR').AsInteger;
          aRegBen[iPont].SEQPROPOSTA       := FieldByName('SEQPROPOSTA').AsInteger;
          aRegBen[iPont].IDPESSOA          := FieldByName('IDPESSOA').AsInteger;
          aRegBen[iPont].IDBENEFICIO       := FieldByName('IDBENEFICIO').AsInteger;
          aRegBen[iPont].IDSITBENEFICIO    := FieldByName('IDSITBENEFICIO').AsInteger;
          aRegBen[iPont].NUMEROPROCESSO    := FieldByName('NUMEROPROCESSO').AsInteger;
          aRegBen[iPont].VALORATUAL        := FieldByName('VALORATUAL').AsFloat;
          aRegBen[iPont].VALORTOTAL        := FieldByName('VALORTOTAL').AsFloat;
          aRegBen[iPont].VALORCOTAS        := FieldByName('VALORCOTAS').AsFloat;
          aRegBen[iPont].FLGDATAPREVISTA   := FieldByName('FLGDATAPREVISTA').AsInteger;
          aRegBen[iPont].DATAINICIO        := FieldByName('DATAINICIO').AsString;
          aRegBen[iPont].DATAFINALPREVISTA := FieldByName('DATAFINALPREVISTA').AsString;
          aRegBen[iPont].DATAFINAL         := FieldByName('DATAFINAL').AsString;
          Inc(iPont);

//        Suspende o benefício

          qryBciario.Edit;
          qryBciarioIDSITBENEFICIO.AsInteger := 2;
          qryBciarioDATAFINALPREVISTA.AsDateTime := Date;
          qryBciario.Post;
         End;
        Next;
       End;
     End;
end;

procedure TfrmCadDepenBenef.ConfiguraTelaPorTipoDependente;
begin
  with MontaSelect do
  begin
     CamposChave.Clear;
     CamposChave.AddStrings(MSPessoa.CamposChave);

     Colunas.Clear;
     Colunas.AddStrings(MSPessoa.Colunas);

     Descricao.Clear;
     Descricao.AddStrings(MSPessoa.Descricao);

     Filtro.Clear;
     Filtro.AddStrings(MSPessoa.Filtro);

     Larguras.Clear;
     Larguras.AddStrings(MSPessoa.Larguras);

     Mascaras.Clear;
     Mascaras.AddStrings(MSPessoa.Mascaras);

     SensivelACaixa.Clear;
     SensivelACaixa.AddStrings(MSPessoa.SensivelACaixa);

     Tabelas.Clear;
     Tabelas.AddStrings(MSPessoa.Tabelas);

     TipoDeDado.Clear;
     TipoDeDado.AddStrings(MSPessoa.TipoDeDado);
  end;

end;

procedure TfrmCadDepenBenef.RodaRegraElegibilidade;
var bElegivel, bErro : boolean;
    sSQL,
    sMsgErro : string;
begin
  // Rodar regra de elegibilidade de cada um dos dependentes
  bRodandoElegibilidade := True;

  frmAguarde.Mostra('Verificando Elegibilidade Benefício ...');

  Try
    qryDet.First;
    while not qryDet.Eof do
    begin


      if qrylerdocumento.Active then
          qrylerdocumento.Close;

      qrylerdocumento.ParamByName('idpessoa').AsFloat := qryDet.FieldByName('IDPESSOA').AsFloat;
      qrylerdocumento.ParamByName('iddocumento').AsFloat :=  qryGlobalDOCPFISICA.AsInteger;
      qrylerdocumento.Open;

      if (qrylerdocumento.Eof) and (qryDet.FieldByName('NUMDOCUMENTO').AsString <> '') then
      begin
        qryinsereDocumento.ParamByName ('idDocumento').AsFloat  := qryGlobalDOCPFISICA.AsInteger ;
        qryinseredocumento.ParamByName('idPessoa').AsFloat      := qryDet.FieldByName('IDPESSOA').AsFloat;
        qryinseredocumento.ParamByName('NumDocumento').AsString := qryDet.FieldByName('NUMDOCUMENTO').AsString;
        qryinseredocumento.ExecSQL;
      end;

      sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,   ' +
              '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,                 ' +
              '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,       ' +
              '         EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, EL.DATADEMISSAO,              ' +
              '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, DE.FLGCONTAIMPOSTOR,         ' +
              '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO,      ' +
              '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        ' +
              '         PP.IDPESSJUR,  PP.IDPLANOPREV, PP.INSCRICAODATA,SP.FLGINTERNO,       ' +
              '         D.FLGDESIGNADO, DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,   ' +
              '''' + FormatDateTime('dd/mm/yyyy', Date) + ''' AS DATAREF,                    ' +
              ' PF.NUMDEPIRRF '+
              ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF,                            ' +
              '       PARTPREVPLAN PP, SITPART SP, DEPENDENTE D                              ' +
              ' WHERE PP.IDPESSOA    = ' + qry.FieldByName('IDPESSOA').AsString + ' AND      ' +
              '       PP.SEQPROPOSTA = ' + qry.FieldByName('SEQPROPOSTA').AsString + ' AND   ' +
              '       PP.IDPLANOPREV = ' + qry.FieldByName('IDPLANOPREV').AsString + ' AND   ' +
              '       PP.IDPESSJUR   = ' + qry.FieldByName('IDPESSJUR').AsString + ' AND     ' +
              '       DE.IDPESSOA    = ' + qryDet.FieldByName('IDPESSOA').AsString + ' AND   ' +
              '       DE.IDPESSOA    = D.IDPESSOA AND                                        ' +
              '       EL.IDPESSOA    = PP.IDPESSOA  AND                                      ' +
              '       EL.IDPESSJUR   = PP.IDPESSJUR AND                                      ' +
              '       SP.IDSITPART   = PP.IDSITPART AND                                      ' +
              '       DE.IDTITULAR   = EL.IDPESSOA  AND                                      ' +
              '       DE.IDPESSOA    = PF.IDPESSOA(+)                                        ';

      bElegivel := RegraBooleana(qryIDRGELEGBENEF.AsString, sSQL , bErro);

      qryDet.Edit;

      if bElegivel then
        qryDet.FieldByName('FLGELEGIVEL').AsInteger := 1
      else
        qryDet.FieldByName('FLGELEGIVEL').AsInteger := 0;

      qryDet.Post;
      qryDet.Next;
    end;
  Finally
    frmAguarde.Apaga;
  End;

  bRodandoElegibilidade := False;
end;

procedure TfrmCadDepenBenef.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
     if dbeNome.CanFocus then dbeNome.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsEndereco then
     if dbeLogradouro.CanFocus then dbeLogradouro.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsContaBanco then
     if lkpcmbbxBanco.CanFocus then lkpcmbbxBanco.SetFocus
  //else if pgctrlDetalhe.ActivePage = tbsBeneficiario then                 //William Santana SOL 161550 KIN 1717512
  //   if lkpcmbTipoRecebedor.CanFocus then lkpcmbTipoRecebedor.SetFocus    //William Santana SOL 161550 KIN 1717512
  else if pgctrlDetalhe.ActivePage = tbsDepBen then
     if dbeNomeDepBen.CanFocus then dbeNomeDepBen.SetFocus
	//Início - William Santana SOL 161550 KIN 1717512
  else if pgctrlDetalhe.ActivePage = tbsReprLegal then
     if lkpcmbTipoRecebedor.CanFocus then lkpcmbTipoRecebedor.SetFocus;
   //Término - William Santana SOL 161550 KIN 1717512

  OpDetalhe := '';


  InsereDocumento;
  AtuDocumentos;
  qrySubTipo.Insert;
  qrySubTipo.FieldByName(Pessoa.NomeCampoId).AsFloat := qryIDPESSOA.AsFloat;

  //Everson Cunha - SIG79893 - Início
  //edilaine SIG25312 - inicio
  //If pgctrlDetalhe.ActivePage = tbsDocumentos Then
  //begin
  //  if CmeCadastro.Operacao in [opInserir,opAlterar] then
  //  begin
  //  if (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0) then
  //    begin
  //      MsgDlg(MSG034,'Atenção',mtInformation,[mbOk],0);
  //    end;
  //    PnlDocumentos_Padrao.enabled := not (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0);
  //  end;
  //end;
  //edilaine SIG25312 - fim
  //Everson Cunha - SIG79893 - Fim
end;

procedure TfrmCadDepenBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
    lblParticipante.Caption := 'Participante';

    frmCadOpcoesElegivel.edOpcao1.Text := '';
    frmCadOpcoesElegivel.edOpcao2.Text := '';
    frmCadOpcoesElegivel.edOpcao3.Text := '';


  If MontaSelect.RetornouValor
  Then begin
    SelecionaDependente(MontaSelect.ValoresChave[0],
                        MontaSelect.ValoresChave[1],
                        MontaSelect.ValoresChave[3]);

    qryBciario.Close;
    if not (qryBciario.Prepared) Then
      qryBciario.prepare;
    if (MontaSelect.ValoresChave[3]<>'') then Begin
      qryBciario.ParamByName('IDPESSJUR').Value   := StrToInt(MontaSelect.ValoresChave[1]);
      qryBciario.ParamByName('IDPLANOPREV').Value := StrToInt(MontaSelect.ValoresChave[3]);
      qryBciario.ParamByName('IDTITULAR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
      qryBciario.ParamByName('SEQPROPOSTA').Value := StrToInt(MontaSelect.ValoresChave[4]);
      qryBciario.Open;
    end
    else
      lblParticipante.Caption := 'Elegível';

    //Ádler Souza - SOL 134214 / Kintana 787470
    sIdPessoa    := MontaSelect.ValoresChave[0];
    sIdPessJur   := MontaSelect.ValoresChave[1];
    sIdPlanoPrev := MontaSelect.ValoresChave[3];
    //Fim - Ádler Souza - SOL 134214 / Kintana 787470

    PreencheCompCamp;
  end;

end;

procedure TfrmCadDepenBenef.CmeDetalheInsert(Sender: TObject);
var iIdPessoaInsert : longint;
begin
  inherited;

  if pgctrlDetalhe.ActivePage = tbsDet
  then begin
     qryPessoa.Insert;
     iIdPessoaInsert := LeUltRegistro(nil,'PESSOA');
     qryPessoa.FieldByName('IDPESSOA').AsInteger   := iIdPessoaInsert;

     qrySubTipo.Insert;
     qrySubTipo.FieldByName(Pessoa.NomeCampoId).AsFloat := qryIDPESSOA.AsFloat;

     InsereDocumento;

    bJaExisteIdPessoa := False;
  end;
  AtuDocumentos;

  edDigBanco.Text := '';
  edDigAgencia.Text := '';

  if pgCtrlDetalhe.ActivePage = tbsContato then
  begin //Contatos
             //Vinicius Maciel SOL 161469 KTN 1372818
             //qryContatoIDENDERECO.AsFloat := qryEndPess.FieldByName('IDENDEREOC').AsFloat;//Fanuel Junior SOL 157829 Kintana 1271296
             //qryContatoIDENDERECO.AsFloat := qryEndPess.FieldByName('IDENDERECO').AsFloat;  //edilaine - SIG25312
             //Vinicius Maciel SOL 161469 KTN 1372818 - FIM
             qryContatoIDCONTATO.AsFloat := LeUltRegistro(nil, 'CONTATOPESS');
             //edilaine - SIG25312 - inicio
             qryContatoIDPESSOA.AsFloat  := qryDet.FieldByName('IDPESSOA').AsFloat;
             qryRamal.Filter := '(IDPESSOA = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger)+') AND (IDCONTATO = '+IntToStr(qryContatoIDCONTATO.AsInteger)+')';
             //edilaine - SIG25312 - fim
             if dbedContatoNome.CanFocus then
                dbedContatoNome.SetFocus ;
  end;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     inc (iSeq);
     dbeNumSequencia.Text := IntToStr(iSeq);

     pgcDependente.ActivePage := tbsDet01;


     qryDepen.Insert;
     qryDepen.FieldByName('IDPESSOA').AsInteger   := iIdPessoaInsert;

     qryPF.Insert;
     qryPF.FieldByName('IDPESSOA').AsInteger      := iIdPessoaInsert;

     // Forçando barra para inserir qrydet. (Padrão não está mudando estado!)
     if qryDet.State <> dsInsert
     Then qryDet.Insert;
     qryDet.FieldByName('IDPESSOA').AsInteger      := iIdPessoaInsert;

     IdPessoa := iIdPessoaInsert; //HIGOR 184394
     pIdBenef := iIdPessoaInsert; //Marcio Sanches Spinosa SOL 205681 Kintana 1992276

     EstadoAnt := qryDet.State;

     qryPF.FieldByName('FLGISENTOIRRF').AsInteger     := 0;
     qryPF.FieldByName('SEXO').AsString               := '';
    // qryPF.FieldByName('ESTCIVIL').AsString           := 'S';  //William Santana - SOL 209384/15928 KIN 2062832
     qryPF.FieldByName('NUMDEPIRRF').AsInteger        := 0;
     qryPF.FieldByName('NUMDEPSALF').AsInteger        := 0;
     qryPF.FieldByName('NUMDEPTOT').AsInteger         := 0;
     qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger  := 0;
     qryDet.FieldByName('FLGDESIGNADO').AsInteger     := 0;
     qryDet.FieldByName('FLGDEPLEGAL').AsInteger      := 0;
     qryDet.FieldByName('FLGPLANOSAUDE').AsInteger    := 0;    // SIG 71037 Ferrari
     qryDet.FieldByName('FLGCONTAIMPOSTOR').AsInteger := 0;
     qryDet.FieldByName('FLGCONTASALARIOF').AsInteger := 0;
     qryDet.FieldByName('FLGBENEFICIARIO').AsInteger  := 1;
     qryDet.FieldByName('NUMSEQUENCIA').AsInteger     := iSeq;

     //Renato Visoni SOL 97629 \ Kintana 431406
     //qryDet.FieldByName('MATRICULA').AsString         := qry.FieldByName('MATRICULA').AsString;
     //Fim SOL 97629 \ Kintana 431406

     if qry.FieldByName('NOMEVALORBASE1').AsString <> ''
     then frmCadOpcoesElegivel.lblNomeValorBase1.Caption := qry.FieldByName('NOMEVALORBASE1').AsString
     else frmCadOpcoesElegivel.lblNomeValorBase1.Caption := 'Opção 1';

     if qry.FieldByName('NOMEVALORBASE2').AsString <> ''
     then frmCadOpcoesElegivel.lblNomeValorBase2.Caption := qry.FieldByName('NOMEVALORBASE2').AsString
     else frmCadOpcoesElegivel.lblNomeValorBase2.Caption := 'Opção 2';

     if qry.FieldByName('NOMEVALORBASE3').AsString <> ''
     then frmCadOpcoesElegivel.lblNomeValorBase3.Caption := qry.FieldByName('NOMEVALORBASE3').AsString
     else frmCadOpcoesElegivel.lblNomeValorBase3.Caption := 'Opção 3';

     if (qry.FieldByName('VALORBASE1').AsString <> '') and
        (qryDet.FieldByName('VALORBASE1').AsString = '')
     then begin
        qryDet.FieldByName('VALORBASE1').AsString := qry.FieldByName('VALORBASE1').AsString;
        frmCadOpcoesElegivel.edOpcao1.Text        := qry.FieldByName('VALORBASE1').AsString;
     end;

     if (qry.FieldByName('VALORBASE2').AsString <> '') and
        (qryDet.FieldByName('VALORBASE2').AsString = '')
     then begin
        qryDet.FieldByName('VALORBASE2').AsString := qry.FieldByName('VALORBASE2').AsString;
        frmCadOpcoesElegivel.edOpcao2.Text        := qry.FieldByName('VALORBASE2').AsString;
     end;

     if (qry.FieldByName('VALORBASE3').AsString <> '') and
        (qryDet.FieldByName('VALORBASE3').AsString = '')
     then begin
        qryDet.FieldByName('VALORBASE3').AsString := qry.FieldByName('VALORBASE3').AsString;
        frmCadOpcoesElegivel.edOpcao3.Text        := qry.FieldByName('VALORBASE3').AsString;
     end;

     // Setar defaults
//     dbrgrpFlgMolestiaGrave.ItemIndex := 1;
     dbrgrpMolestiaGrave.Visible      := False;
//     dbrgrpMolestiaGraveFim.Visible   := False;
     dbchkbxDesignado.Checked         := False;
     dbchkIsentoIR.Checked            := False;
     dbchkSalarioProcessado.Checked   := False;
     dbchksolicitacontasalario.Checked := False;
     dbchkbxFlgContaImpostoR.Enabled := HabilitaCheckDependente(Sistema.IdEmpresa);
     dbchkbxContaSalarioF.Enabled    := dbchkbxFlgContaImpostoR.Enabled;

     // Ádler Souza - SOL 144030 KTN 945192

//     if qrydet.FieldByname('DATACADASTRO').AsString = '' then
//       qrydet.FieldByname('DATACADASTRO').AsDateTime := date
//     else
//       if qrydet.FieldByname('DATACADASTRO').AsDateTime <> Date then
//         qrydet.FieldByname('DATACADASTRO').AsDateTime := dbdeDataCadastro.date;
//
//     // Fim - Ádler Souza - SOL 144030 KTN 945192

     qrydet.FieldByname('DATACADASTRO').AsString := dateToStr(Date);

     //dbeNome.SetFocus; Felipe A. Santos 208475 KINTANA: 2016859
  end;
  if pgCtrlDetalhe.ActivePage = tbsOutrasInformacoes then begin // Outras Informações

    //    Darivaldo Alencar SIG 27871 -inicio
    //    qryOutrasInforms.FieldByname('IDPESSOA').Value   := qryDet.FieldByname('IDPESSOA').AsString;
    //    dblkParamPessoa.Enabled := True;
    //    dblkParamPessoa.SetFocus ;
    if (qryAtual = qryOutrasInforms) then
      begin
          qryOutrasInforms.FieldByname('IDPESSOA').Value   := qryDet.FieldByname('IDPESSOA').AsString;
          dblkParamPessoa.Enabled := True;
          dblkParamPessoa.SetFocus ;
      end
    else begin
          qryOcupacao.FieldByname('IDPESSOA').AsString   := qryDet.FieldByname('IDPESSOA').AsString;
          dbeOcupProfissional.SetFocus ;
      end
    //    Darivaldo Alencar SIG 27871 -fim
  end;

  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
     if qryEndPess.State <> dsInsert then qryEndPess.Insert;
     chkbxComercial.State       := cbUnchecked;
     chkbxResidencial.State     := cbUnchecked;
     chkbxEntrega.State         := cbUnchecked;
     chkbxCobranca.State        := cbUnchecked;
     chkbxCorrespondencia.State := cbUnchecked;
     dbeLogradouro.SetFocus;

     //Cássio Rovaroto - SIG nº 136301 - Início
     if Sistema.IdModulo = 452 then
      dbedNomeEndereco.Enabled     := False;
     //Cássio Rovaroto - SIG nº 136301 - Fim
  end;

  if pgctrlDetalhe.ActivePage = tbsContaBanco then
  begin
    lkpcmbbxBanco.Text := '';

    qryCBanco.FieldByName('TIPOCONTA').AsInteger        := 1;
    qryCBanco.FieldByName('FLGCONTACONJUNTA').AsString  := 'N';
    qryCBanco.FieldByName('FLGCONTARESGATE').AsInteger  := 0;    //edilaine - SIG25312

    //Brunno Mattos - SOL 153260 - KTN 1167636 Inicio
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT IDTITULAR FROM DEPENTIT ' +
                   ' WHERE  IDPESSOA = ' + qryDet.FieldByname('IDPESSOA').AsString);
    qryAux.Open;
    qryCBanco.FieldByName('IDTITULAR').Value            := qryAux.FieldByName('IDTITULAR').AsInteger;
    //Brunno Mattos - SOL 153260 - KTN 1167636 Fim

    If qryCBanco.RecordCount >= 2 Then
      qryCBanco.FieldByName('FLGCONTAPREF').AsInteger     := 0
    Else qryCBanco.FieldByName('FLGCONTAPREF').AsInteger     := 1;

    lkpcmbbxBanco.SetFocus;
  end;

  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
    // SOL 229238 KTN 2063206
    qryBeneficio.close;
    qryBeneficio.Prepare;
    qryBeneficio.ParamByName('MATRICULA').AsString := qry.FieldByName('MATRICULA').AsString;
    qryBeneficio.ParamByName('IDPLANOPREV').AsString := qry.FieldByName('IDPLANOPREV').AsString; // SOL 228437 KTN 2062198
    qryBeneficio.Open;
    // SOL 229238 KTN 2063206

    qryBenef.FieldByName('PRIORIDADE').AsInteger := 0;
    qryBenef.FieldByName('PERCENTUAL').AsInteger := 100;

    QryBuscaNucleo.Close;
    QryBuscaNucleo.ParamByName('IDTITULAR').Value:=Qry.FieldByName('IDPESSOA').AsInteger;
    QryBuscaNucleo.Open;

    //Início - William Santana - SOL 161550 KIN 1717512
    //rdbProprio.Checked := True;
    //rdbProprioClick(rdbProprio);
    //qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
    //dbeRecebedor.Text                              := qryDet.FieldByName('NOME').AsString;

    qryReprLegal.Filter   := 'SITATUAL = 1' ;
    qryReprLegal.Filtered := True;
     if (qryReprLegal.isempty) or
        (qryBenef.isempty) or
        //(qryBenef.FieldByname('IDRESPONSAVEL').AsInteger = qryDet.fieldbyName('IDPESSOA').AsInteger) or // SOL 242165 PPM 567539
        (qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger = qryDet.fieldbyName('IDPESSOA').AsInteger) then // SOL 242165 PPM 567539
     begin
      //William Moreira da Silva - SOL 246736 PPM 1051823
      //rdbProprio.Checked := True;
      qryBenef.FieldByName('IDRESPONNAOREC').AsString := '';
      qryBenef.FieldByname('IDRESPONSAVEL').AsString  := qryDet.FieldByName('IDPESSOA').AsString;
      //dbeRecebedor.Text                               := qryDet.FieldByName('NOME').AsString;
      //rdbProprioClick(rdbProprio);
      //William Moreira da Silva - SOL 246736 PPM 1051823
     end
     else
     begin
      //William Moreira da Silva - SOL 246736 PPM 1051823
      //rdbOutro.checked := True;
      qryBenef.FieldByName('IDRESPONNAOREC').AsInteger := qryReprLegal.fieldbyName('IDRESPONSAVEL').AsInteger;
      qryBenef.FieldByname('IDRESPONSAVEL').AsInteger  := qryReprLegal.fieldbyName('IDRESPONSAVEL').AsInteger;
      //dbeRecebedor.Text                                := qryreprLegal.FieldByName('NOMERESPONSAVEL').AsString;
      //rdbProprioClick(rdbOutro);
      //William Moreira da Silva - SOL 246736 PPM 1051823
     end;
     qryReprLegal.Filtered := False;
     qryReprLegal.Filter   := '';

     //William Moreira da Silva - SOL 246736 PPM 1051823
     rdbProprio.Checked := True;
     dbeRecebedor.Text := qryDet.FieldByName('NOME').AsString;
     rdbProprioClick(rdbProprio);
     //William Moreira da Silva - SOL 246736 PPM 1051823
  //Término - William Santana - SOL 161550 KIN 1717512
  end;

  if pgctrlDetalhe.ActivePage = tbsDepBen then Begin
      EstadoAnt := qryDepBen.State;

      vNumdocInicial := '';
      vNomeInicial := '';

      qryDepBenPessoa.Insert;
      qryDepBenPessoa.FieldByName('IDPESSOA').AsInteger   := LeUltRegistro(nil,'PESSOA');
      qryDepBenPF.Insert;

      qryDepBenDepen.Insert;

      qrySeq.Close;
      if not qrySeq.Prepared then qrySeq.prepare;
      qrySeq.ParamByName('IDTITULAR').Value := qryDet.FieldByName('IDPESSOA').AsInteger;
      qrySeq.Open;
      if qrySeq.FieldByName('PROXNUMSEQ').AsInteger > iSeqDepBen then
      iSeqDepBen := qrySeq.FieldByName('PROXNUMSEQ').AsInteger; // vini
      qrySeq.Close;

      inc (iSeqDepBen);
      dbeNumSeqDepBen.Text := IntToStr(iSeqDepBen);
      qryDepBen.FieldByName('NUMSEQUENCIA').AsInteger := iSeqDepBen;
      dbeNomeDepBen.SetFocus;
      qryDepBen.FieldByName('FLGDESIGNADO').AsInteger        := 0;
      qryDepBen.FieldByName('FLGDEPLEGAL').AsInteger         := 0; //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
      qryDepBen.FieldByName('FLGCONTAIMPOSTOR').AsInteger    := 1; //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
      qryDepBen.FieldByName('FLGCONTASALARIOF').AsInteger    := 0; //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
      //qryDepBen.FieldByName('FLGPLANOSAUDE').AsInteger       := 0;    // SIG 71037 Ferrari       //Marcos SIG135429


      qryDepBenPF.FieldByName('IDPESSOA').AsInteger          := qryDepBenPessoa.FieldByName('IDPESSOA').AsInteger;
      qryDepBenPF.FieldByName('FLGISENTOIRRF').AsInteger     := 0;
      qryDepBenPF.FieldByName('SEXO').AsString               := 'M';
   //   qryDepBenPF.FieldByName('ESTCIVIL').AsString           := 'S';  //William Santana - SOL 209384/15928 KIN 2062832
      qryDepBenPF.FieldByName('NUMDEPIRRF').AsInteger        := 0;
      qryDepBenPF.FieldByName('NUMDEPSALF').AsInteger        := 0;
      qryDepBenPF.FieldByName('NUMDEPTOT').AsInteger         := 0;
      qryDepBenPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger  := 0;
      qryDepBenPF.FieldByName('FLGISENTOIRRF').AsInteger     := 0;

      qryDepBenDepen.FieldByName('IDPESSOA').AsInteger          := qryDepBenPessoa.FieldByName('IDPESSOA').AsInteger;

      dbchkDepBenDesignado.Checked     := False;
      dbchkDepBenDepLegal.Checked      := False; //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
      dbchkDepBenIsentoIRRF.Checked    := False;
      dbchkDepBenContaIR.Checked       := True;
      dbchkDepBenContaSalarioF.Checked := False; //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
      rgrpDtMolGraveDepen.Visible      := False;
  End;

  If pgCtrlDetalhe.ActivePage = tbsTelefone then
  begin //Telefones

    //qryTelefoneIDENDERECO.AsFloat := qryEndPess.FieldByName('IDENDERECO').AsFloat; //Fanuel Junior SOL 157829 Kintana 1271296  //Darivaldo Alencar SIG25312
    qryTelefoneIDTELEFONE.AsFloat := LeUltRegistro(nil, 'TELENDPESS');
    qryTelefone.fieldbyname('idPessoa').AsFloat := qryDet.FieldByName('idPessoa').AsFloat; //Darivaldo Alencar SIG25312

    //edilaine - SIG25312 - inicio
    //qryRamal.Filter := 'IDTELEFONE = '''+FloatToStr(qryTelefoneIDTELEFONE.AsFloat)+'''';
    qryRamal.Filter := '(IDPESSOA = '+IntToStr(qryDet.FieldByName('idPessoa').AsInteger)+') and (IDTELEFONE = '+IntToStr(qryTelefoneIDTELEFONE.AsInteger)+')';
    //edilaine - SIG25312 - fim

    chkTipoTelefone.State[0] := cbChecked;
    qryTelefoneTIPO.AsString := 'C';
    if dbedNumero.CanFocus then dbedNumero.SetFocus ;
  end
  //edilaine - SIG25312 - inicio
  else if pgCtrlDetalhe.ActivePage = tbsContato then
  begin
    qryRamal.Filter := '(IDPESSOA = '+IntToStr(qryDet.FieldByName('idPessoa').AsInteger)+') and (IDCONTATO = '+IntToStr(qryContatoIDCONTATO.AsInteger)+')';
  end;
  //edilaine - SIG25312 - fim

    //Início - William Santana SOL - 161550 KIN 1717512
   if pgctrlDetalhe.ActivePage = tbsReprLegal then
   begin
     rgSituacaoAtual.ItemIndex := -1;
     qryReprLegal.Insert;
   end;
   //Término - William Santana SOL - 161550 KIN 1717512
end;

procedure TfrmCadDepenBenef.CmeDetalheEdit(Sender: TObject);
begin
  inherited;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    pgcDependente.ActivePage := tbsDet01;

    qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryPessoa.Filtered := True;

    qryPF.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryPF.Filtered := True;

    qryDepen.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryDepen.Filtered := True;

    qryPessoa.Edit;
    qryPF.Edit;
    qryDepen.Edit;

    if qry.FieldByName('NOMEVALORBASE1').AsString <> ''
    then frmCadOpcoesElegivel.lblNomeValorBase1.Caption := qry.FieldByName('NOMEVALORBASE1').AsString
    else frmCadOpcoesElegivel.lblNomeValorBase1.Caption := 'Opção 1';

    if qry.FieldByName('NOMEVALORBASE2').AsString <> ''
    then frmCadOpcoesElegivel.lblNomeValorBase2.Caption := qry.FieldByName('NOMEVALORBASE2').AsString
    else frmCadOpcoesElegivel.lblNomeValorBase2.Caption := 'Opção 2';

    if qry.FieldByName('NOMEVALORBASE3').AsString <> ''
    then frmCadOpcoesElegivel.lblNomeValorBase3.Caption := qry.FieldByName('NOMEVALORBASE3').AsString
    else frmCadOpcoesElegivel.lblNomeValorBase3.Caption := 'Opção 3';


    dbchkbxFlgContaImpostoR.Enabled := HabilitaCheckDependente(Sistema.IdEmpresa);
    dbchkbxContaSalarioF.Enabled    := dbchkbxFlgContaImpostoR.Enabled;


    bJaExisteIdPessoa := False;
  end;

  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
    qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryEndPess.FieldByName('IDPESSOA').AsInteger);
    qrypessoa.Filtered := True ;

    if (qryEndPess.FieldByName('IdEndereco').IsNull) then
    begin
       chkbxComercial.Checked       := false;
       chkbxResidencial.Checked     := false;
       chkbxEntrega.Checked         := false;
       chkbxCobranca.Checked        := false;
       chkbxCorrespondencia.Checked := false;
    end
    else
    begin
       chkbxComercial.Checked       := (qryPessoa.FieldByName('IdEndComercial').Value   = qryEndPess.FieldByName('IdEndereco').Value);
       chkbxResidencial.Checked     := (qryPessoa.FieldByName('IdEndResidencial').Value = qryEndPess.FieldByName('IdEndereco').Value);
       chkbxEntrega.Checked         := (qryPessoa.FieldByName('IdEndEntrega').Value     = qryEndPess.FieldByName('IdEndereco').Value) ;
       chkbxCobranca.Checked        := (qryPessoa.FieldByName('IdEndCobranca').Value    = qryEndPess.FieldByName('IdEndereco').Value);
       chkbxCorrespondencia.Checked := (qryPessoa.FieldByName('IdEndCorresp').Value     = qryEndPess.FieldByName('IdEndereco').Value);
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsContaBanco
  then begin
     if not qryCBanco.IsEmpty
     then begin
         edDigBanco.Text      := qryCBanco.FieldByName('NumBanco').AsString;
         edDigAgencia.Text    := qryCBanco.FieldByName('NumAgencia').AsString;
         //Brunno Mattos - SOL 153260 - KTN 1167636 Inicio
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' SELECT IDTITULAR FROM DEPENTIT ' +
                        ' WHERE  IDPESSOA = ' + qryDet.FieldByname('IDPESSOA').AsString);
         qryAux.Open;
         qryCBanco.FieldByName('IDTITULAR').Value            := qryAux.FieldByName('IDTITULAR').AsInteger;
         //Brunno Mattos - SOL 153260 - KTN 1167636 Fim
      end;
  end;

  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
    // SOL 229238 KTN 2063206
    qryBeneficio.Close;
    qryBeneficio.Prepare;
    //BRUNO AZEVEDO SOL 130836 Kintana 807668
    qryBeneficio.ParamByName('MATRICULA').AsString := qry.FieldByName('MATRICULA').AsString;
    qryBeneficio.ParamByName('IDPLANOPREV').clear; // SOL 228437 KTN 2062198
    qryBeneficio.Open;
    // SOL 229238 KTN 2063206

    QryBuscaNucleo.Close;
    QryBuscaNucleo.ParamByName('IDTITULAR').Value:=Qry.FieldByName('IDPESSOA').AsInteger;
    QryBuscaNucleo.Open;

    if qryBenef.FieldByName('IDRESPONSAVEL').AsInteger = qryBenef.FieldByName('IDPESSOA').AsInteger
    then begin
      (* O Recebedor do Dependente É o próprio dependente *)
      rdbProprio.Checked        := True;
      rdbOutro.Checked          := False;
    end
    else begin
      (* O Recebedor é o Responsável *)
      rdbProprio.Checked        := False;
      rdbOutro.Checked          := True;
    end;
    dbeRecebedor.Text           := qryBenef.FieldbyName('RECEBEDOR').AsString;
  // Início - William Santana - SOL 161550 KIN 1717512
  // dbeResponsavel.Text         := qryBenef.FieldByname('RESPONSAVEL').AsString;
  // lkpcmbTipoRecebedor.Text    := qryBenef.FieldByName('TIPORECEBEDOR').AsString;
  // Término - William Santana - SOL 161550 KIN 1717512
  end;

  if pgctrlDetalhe.ActivePage = tbsDepBen
  then begin
    qryDepBenPessoa.Filter   := 'IDPESSOA = '+qryDepBen.FieldByName('IDPESSOA').AsString;
    qryDepBenPessoa.Filtered := True;

    qryDepBenPF.Filter       := 'IDPESSOA = '+qryDepBen.FieldByName('IDPESSOA').AsString;
    qryDepBenPF.Filtered     := True;

    qryDepBenDepen.Filter    := 'IDPESSOA = '+qryDepBen.FieldByName('IDPESSOA').AsString;
    qryDepBenDepen.Filtered  := True;

    qryDepBenPessoa.Edit;
    qryDepBenPF.Edit;

    qryDepBenDepen.Edit;

    vNumdocInicial := qryDepBenPessoa.FieldByName('NUMDOCUMENTO').AsString;
    vNomeInicial := qryDepBenPessoa.FieldByName('NOME').AsString;
  end;

  If pgctrlDetalhe.ActivePage = tbsOutrasInformacoes
   Then Begin
       if (qryAtual = qryOutrasInforms) then begin//Darivaldo Alencar SIG 27871.
            qryParamPessoa.Locate('IDPARAM', qryOutrasInforms.FieldByName('IDPARAM').AsInteger,[]);
            dblkParamPessoa.Text := qryOutrasInforms.FieldByName('DESCRICAO').AsString;
            edValida.Text        := qryOutrasInforms.FieldByName('VALIDACAO').AsString;
            dblkParamPessoa.Enabled := False;
         end;
   End;


  // Caso já possua registros no histórico não
// deixa alterar o Nucleo
// Busca as Contribuicoes do Nucleo Familiar
  If FazQuery(QryAux,'SELECT IDCONTRIBUICAO FROM CM.CONTRIBPREVNUCLEO '+
                     'WHERE IDNUCLEOFAMILIAR = '+
                     IntToStr(QryBenef.FieldByName('IDNUCLEOFAMILIAR').AsInteger) )
  Then Begin
    DbLkcBuscaNucleo.Enabled:=False;
  End Else Begin
    DbLkcBuscaNucleo.Enabled:=True;
  End;

  if pgCtrlDetalhe.ActivePage = tbsContato then
  begin
      //edilaine - SIG25312 - inicio
      //qryRamal.Filter := 'IDCONTATO = '''+FloatToStr(qryContatoIDCONTATO.AsFloat)+'''';
      qryRamal.Filter := '(IDPESSOA = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger)+') AND (IDCONTATO = '+IntToStr(qryContatoIDCONTATO.AsInteger)+')';
      //edilaine - SIG25312 - fim
      if dbedCOntatoNome.CanFocus then
         dbedCOntatoNome.SetFocus ;
  end;


  if pgCtrlDetalhe.ActivePage = tbsTelefone then
   begin
     //edilaine - SIG25312 - inicio
     //qryRamal.Filter := 'IDTELEFONE = '''+FloatToStr(qryTelefoneIDTELEFONE.AsFloat)+'''';
     qryRamal.Filter := '(IDPESSOA = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger)+') AND (IDTELEFONE = '+IntToStr(qryTelefoneIDTELEFONE.AsInteger)+')';
     //edilaine - SIG25312 - fim

     if dbedNumero.CanFocus then dbedNumero.SetFocus;
   end;
   BtnMatricula.Visible := True; // Flávio Souza SOL: 200953 KINTANA: 1952412;
end;

procedure TfrmCadDepenBenef.CmeDetalheDelete(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsDet  then
  begin
    qryBenef.Filtered := False;
    qryBenef.Filter := '';
    qryBenef.First;
    While Not qryBenef.Eof Do
          if qryBenef.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryBenef.Delete
          else
              qryBenef.Next;

    qryCBanco.Filtered := False;
    qryCBanco.Filter := '';
    qryCBanco.First;
    While Not qryCBanco.Eof Do
          if qryCBanco.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryCBanco.Delete
          else
              qryCBanco.Next;

    qryEndPess.Filtered := False;
    qryEndPess.Filter := '';
    qryEndPess.First;
    While Not qryEndPess.Eof Do
          if qryEndPess.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryEndPess.Delete
          else
              qryEndPess.Next;

    While Not qryDocumento.Eof Do
          if qryDocumento.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDocumento.Delete
          else
              qryDocumento.Next;

    While Not qryDepen.Eof Do
          if qryDepen.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepen.Delete
          else
              qryDepen.Next;

    qryDepBen.Filtered := False;
    qryDepBen.Filter := '';
    qryDepBen.First;
    While Not qryDepBen.Eof Do
          if qryDepBen.Fieldbyname('IDTITULAR').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepBen.Delete
          else
              qryDepBen.Next;

    qryDepBenPF.Filtered := False;
    qryDepBenPF.Filter := '';
    qryDepBenPF.First;
    While Not qryDepBenPF.Eof Do
          if qryDepBenPF.Fieldbyname('IDTITULAR').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepBenPF.Delete
          else
              qryDepBenPF.Next;

    qryDepBenPESSOA.Filtered := False;
    qryDepBenPESSOA.Filter := '';
    qryDepBenPESSOA.First;
    While Not qryDepBenPESSOA.Eof Do
          if qryDepBenPESSOA.Fieldbyname('IDTITULAR').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepBenPESSOA.Delete
          else
              qryDepBenPESSOA.Next;

    qryDepBenDEPEN.Filtered := False;
    qryDepBenDEPEN.Filter := '';
    qryDepBenDEPEN.First;
    While Not qryDepBenDEPEN.Eof Do
          if qryDepBenDEPEN.Fieldbyname('IDTITULAR').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepBenDEPEN.Delete
          else
              qryDepBenDEPEN.Next;


    pIdBenef := qryDet.FieldbyName('IDPESSOA').AsInteger; //Marcio Sanches Spinosa SOL 205681 Kintana 1992276
  end;

  //edilaine - SIG25312 - inicio
  if pgctrlDetalhe.ActivePage = tbsContaBanco  then
  begin
    QryCbancoPref.locate('IdCBANCARIA', qryCBanco.FieldByName('IdCBANCARIA').AsInteger, []);
    QryCbancoPref.delete;
  end;
  //edilaine - SIG25312 - fim

  inherited;
end;

procedure TfrmCadDepenBenef.CmeCadastroConfirma(Sender: TObject);
Var iQuantContaPrev: Integer;
sDatainicioMolestia,
 sDataFimMolestia : string;
  iIdPessoa,
 iIdPessJur,
 iIdPlanoPrev,
 iSeqProposta : integer;
begin
//WILLIAM MOREIRA DA SILVA SOL 165677 - Inicio
  if bbtnConfirmar.tag = 0 then
  begin
       if not DataUltimaAlteracao(strToInt(sidPessoa))then
       begin
            exit;
            bbtnCancelarClick(self);
       end;
  end;

//Taffarel - SIG68507/71228 início
//if (CMDateTimePicker5.text <> '') and (dbdtMolestiaGrave.text <> '' )then
//  begin
//  sDatainicioMolestia := FormatDateTime('dd/mm/yyyy',dbdtMolestiaGrave.Date );   //Data Inicial
//  sDataFimMolestia    := FormatDateTime('dd/mm/yyyy',CMDateTimePicker5.Date );   //Data Final
//
//  InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia, qryDet.FieldByName('IdPessoa').asInteger);
//  bbtnConfirmar.tag := 1;
//  end;
//Taffarel - SIG68507/71228

  //WILLIAM MOREIRA DA SILVA SOL 165677 - Fim
  try
     iQuantContaPrev := 0;
     qryCBanco.First;
     if qryCBanco.FieldByName('FLGCONTAPREF').AsInteger = 1 Then
       iQuantContaPrev := 1;
     qryCBanco.Next;
     While Not qryCBanco.Eof Do
     Begin
       if qryCBanco.FieldByName('FLGCONTAPREF').AsInteger = 1 Then
         Inc(iQuantContaPrev);
       qryCBanco.Next;
     End;

     if (iQuantContaPrev > 1) Then
     Begin
       MsgDlg('Só é permitido cadastrar uma conta preferencial.','Erro',mtError,[mbOk,mbHelp],0);
       Abort;
       Exit;
     End;

    // Replicar para as Qry's do dependente / menos a QryDet
    qryPessoa.Filtered := False;
    qryPessoa.Filter := '';

    qryPF.Filtered := False;
    qryPF.Filter := '';

    qryDepen.Filtered := False;
    qryDepen.Filter := '';

    qryEndPess.Filtered := False;
    qryEndPess.Filter := '';

    //edilaine - SIG5312 - inicio
    qryTelefone.Filtered := False;
    qryTelefone.Filter := '';

    qryContato.Filtered := False;
    qryContato.Filter := '';

    qryRamal.Filtered := False;
    qryRamal.Filter := '';
    //edilaine - SIG5312 - fim

    qryCBanco.Filtered := False;
    qryCBanco.Filter := '';

    qryBenef.Filtered := False;
    qryBenef.Filter := '';

    qryDepBen.Filtered := False;
    qryDepBen.Filter := '';

    qryDepBenPessoa.Filtered := False;
    qryDepBenPessoa.Filter := '';

    qryDepBenPF.Filtered := False;
    qryDepBenPF.Filter := '';

    qryDepBenDepen.Filtered := False;
    qryDepBenDepen.Filter := '';

// Inclusao do Nucleo Familair
    case Grava(False) of
      0 : Pessoa.SaveSubtipo(self);
      1 : MsgDlg('Não foi possivel atualizar os dados', Caption, mtError , [mbOk,mbHelp], 0);
    end;

    // Inclusão da qryOutrasInforms no AplicaAlteracoes
    //Vinicius Maciel SOL 161469 KTN 1372818 - Adicionei a qryContato nas quatro rotinas AplicaAlteracoes
    //BRUNO AZEVEDO - SOL 201658 KINTANA 1949890
    //William Santana - SOL 161550 KIN 1717512 - Adicionei a qryReprLegal e qryLogReprLegal nas quatro rotinas AplicaAlteracoes
    If qryBciario.Active
     //Darivaldo Alencar SIG 27871 -inicio
     //Then if OpDetalhe <> 'E'
     Then  begin if OpDetalhe <> 'E'

      //          then AplicaAlteracoes([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryBciario, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryRamal,qryCBanco,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,{qryImagem,}qryOutrasInforms, qryplano,qryReprLegal,qryLogReprLegal])
      //           else AplicaAlteracoes([qryContato,qryOutrasInforms,{qryImagem,}QryNucleoFam, qryBenef, qryRecebedor, qryCBanco,qryDocumento,qryRamal,qryTelefone,qryEndPess,qryDet, qryDepBen, qryDepBenDepen, qryDepBenPF, qryDepBenPessoa, qryBciario, qryDepen, qryPF, qryPessoa, qryplano,qryReprLegal,qryLogReprLegal])
                 then begin
                     if not (qryPF2.state in [dsInactive]) then
                          AplicaAlteracoesInTransacao([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryBciario, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryRamal,qryCBanco,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryOutrasInforms, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao,qryPF2]) //Taffarel - SIG68507/71228
                     else AplicaAlteracoesInTransacao([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryBciario, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryRamal,qryCBanco,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryOutrasInforms, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao]); //Taffarel - SIG68507/71228
                 end
                 else begin
                    if not (qryPF2.state in [dsInactive]) then
                         AplicaAlteracoesInTransacao([qryContato,qryOutrasInforms,QryNucleoFam, qryBenef, qryRecebedor, qryCBanco,qryDocumento,qryRamal,qryTelefone,qryEndPess,qryDet, qryDepBen, qryDepBenDepen, qryDepBenPF, qryDepBenPessoa, qryBciario, qryDepen, qryPF, qryPessoa, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao,qryPF2]) //Taffarel - SIG68507/71228
                    else AplicaAlteracoesInTransacao([qryContato,qryOutrasInforms,QryNucleoFam, qryBenef, qryRecebedor, qryCBanco,qryDocumento,qryRamal,qryTelefone,qryEndPess,qryDet, qryDepBen, qryDepBenDepen, qryDepBenPF, qryDepBenPessoa, qryBciario, qryDepen, qryPF, qryPessoa, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao]) //Taffarel - SIG68507/71228
                 end;
            end
     //Darivaldo Alencar SIG 27871 -fim
     Else if OpDetalhe <> 'E'
           then
           // SOL 189183 KINTANA 1785576 correção do erro causado no SOL 184793
           //Jonas: SOL - 184793  KTN 1731321 - Inicio
           //AplicaAlteracoes([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryRamal,qryCBanco,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryImagem,qryOutrasInforms, qryplano])
           // AplicaAlteracoes([{qryContato},qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess{,qryTelefone,qryCBanco,qryRamal,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryImagem,qryOutrasInforms, qryplano}]) // SOL 189183 KINTANA 1785576  comentado
           //AplicaAlteracoes([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryCBanco{,qryRamal,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryImagem,qryOutrasInforms, qryplano}])
           //BRUNO AZEVEDO SOL 194131 KINTANA 1851046 - NÃO PODE ESTAR COMENTADO, SE ESTÁ COM ERROS, DEVE SER TRATADO NA CAUSA RAIZ E NÃO COMENTANDO A INCLUSÃO
           //Darivaldo Alencar -SIG 27871 -inicio
           //AplicaAlteracoes([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryCBanco,qryRamal,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,{qryImagem,}qryOutrasInforms, qryplano,qryReprLegal,qryLogReprLegal])
           begin
               if not (qryPF2.state in [dsInactive]) then
                    AplicaAlteracoes([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryCBanco,qryRamal,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryOutrasInforms, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao,qryPF2])
               else AplicaAlteracoes([qryContato,qryPessoa,qryDocumento,qryPF,qryDepen,qryDepBenPessoa, qryDepBenPF, qryDepBenDepen, qryDepBen,qryDet,qryEndPess,qryTelefone,qryCBanco,qryRamal,qryRecebedor,qryBenef,QryNucleoFam,qryInsResponsavel,qryOutrasInforms, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao]);
           end
           //BRUNO AZEVEDO SOL 194131 KINTANA 1851046
           //Jonas: SOL - 184793  KTN 1731321 - Fim
           // SOL 189183 KINTANA 1785576 correção do erro causado no SOL 184793
           //else AplicaAlteracoes([qryContato,qryOutrasInforms,{qryImagem,}QryNucleoFam, qryBenef, qryRecebedor, qryCBanco,qryDocumento,qryRamal,qryTelefone,qryEndPess,qryDet, qryDepBen, qryDepBenDepen, qryDepBenPF, qryDepBenPessoa, qryDepen, qryPF, qryPessoa, qryplano,qryReprLegal,qryLogReprLegal])
           else begin
                if not (qryPF2.state in [dsInactive]) then
                     AplicaAlteracoes([qryContato,qryOutrasInforms,QryNucleoFam, qryBenef, qryRecebedor, qryCBanco,qryDocumento,qryRamal,qryTelefone,qryEndPess,qryDet, qryDepBen, qryDepBenDepen, qryDepBenPF, qryDepBenPessoa, qryDepen, qryPF, qryPessoa, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao,qryPF2])
                else AplicaAlteracoes([qryContato,qryOutrasInforms,QryNucleoFam, qryBenef, qryRecebedor, qryCBanco,qryDocumento,qryRamal,qryTelefone,qryEndPess,qryDet, qryDepBen, qryDepBenDepen, qryDepBenPF, qryDepBenPessoa, qryDepen, qryPF, qryPessoa, qryplano,qryReprLegal,qryLogReprLegal,qryOcupacao]);
           end;
           //Darivaldo Alencar -SIG 27871 -fim
    //Vinicius Maciel SOL 161469 KTN 1372818 - FIM
  except
    raise;
  end;
  OpDetalhe := '';

  qryEndPess.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryEndPess.Filtered := True ;

  //edilaine - SIG5312 - inicio
  qryTelefone.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryTelefone.Filtered := True ;

  qryContato.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryContato.Filtered := True ;

  qryRamal.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryRamal.Filtered := True ;
  //edilaine - SIG5312 - fim

  qryCBanco.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryCBanco.Filtered := True;

  sFiltroBenef := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);

  qryBenef.Filter   := sFiltroBenef;
  qryBenef.Filtered := True;

  qryDepBen.Filter         := 'IDTITULAR = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryDepBen.Filtered       := True;

  if (not qryDepBen.IsEmpty) and (qryDepBen.FieldByName('IDPESSOA').AsString <> '')
  then begin
     qryDepBenPessoa.Filter   := 'IDPESSOA = '+qryDepBen.FieldByName('IDPESSOA').AsString;
     qryDepBenPessoa.Filtered := True;

     qryDepBenPF.Filter       := 'IDPESSOA = '+qryDepBen.FieldByName('IDPESSOA').AsString;
     qryDepBenPF.Filtered     := True;

     qryDepBenDepen.Filter    := 'IDPESSOA = '+qryDepBen.FieldByName('IDPESSOA').AsString;
     qryDepBenDepen.Filtered  := True;
  end
  else begin
     qryDepBenPessoa.Filter   := 'IDPESSOA = -1 ';
     qryDepBenPessoa.Filtered := True;

     qryDepBenPF.Filter       := 'IDPESSOA = -1 ';
     qryDepBenPF.Filtered     := True;

     qryDepBenDepen.Filter    := 'IDPESSOA = -1 ';
     qryDepBenDepen.Filtered  := True;
  end;

  bRecebProprioNovo := False;
  bResponsaProprioNovo  := False;
  bInseriuRecebProprio := False;

  // ATUALIZAÇÃO DOS DADOS DO TITULAR EM RELAÇÃO AOS
  // DADOS DOS DEPENDENTES.
  AtualizaDadosTitular;

  //inherited;

  //Vinicius Maciel SOL 161469 KTN 1372818 - Inicio
  FazerVoltarDet;
  CmeDetalhe.Atualizabotoes(Self);
  //Vinicius Maciel SOL 161469 KTN 1372818 - Fim

  // BUSCA NOVAMENTE DADOS DE PESSOA FISICA ALTERADOS.
  try
    //Ádler Souza - SOL 134214 / Kintana 787470
    {SelecionaDependente(MontaSelect.ValoresChave[0],
                        MontaSelect.ValoresChave[1],
                        MontaSelect.ValoresChave[3]);}
    SelecionaDependente(sIdPessoa,
                        sIdPessJur,
                        sIdPlanoPrev);
    //Fim - Ádler Souza - SOL 134214 / Kintana 787470
  except
  end;


  // Adicionando Log Padrao
  Try
    //BRUNO AZEVEDO SOL 137519 KINTANA 831220
    If Not Sistema.GravaLogOperacoes(Self.Caption, True) Then
         raise exception.Create('Erro ao gravar Log.')
  Except
  End;
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadDepenBenef.CmeDetalheConfirma(Sender: TObject);
var
   sIdEndTel : string;      //edilaine - SIG25312
begin
  if pgctrlDetalhe.ActivePage = tbsContaBanco then
  begin
    //edilaine - SIG25312 - inicio
    //If (qryCBanco.State in [dsEdit, dsInsert]) And (dbgrpContaPref.ItemIndex = 1) And
    //  VerificaContaPref(qryDet.FieldByName('IDPESSOA').AsString,qryDet.FieldByName('IDTITULAR').AsString) Then  //Renato Visoni SOL 97628 \ Kintana 431568
    if (qryCBanco.State in [dsEdit, dsInsert]) And ((dbgrpContaPref.ItemIndex = 1)) and
       VerificaTipoCtaBanco(tcbPreferencial, qryDet.FieldByName('IDPESSOA').AsInteger, qryDet.FieldByName('IDTITULAR').AsInteger) Then
    begin
      MsgDlg('Conta preferencial já cadastrada.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    End
    else If (qryCBanco.State in [dsEdit, dsInsert]) And (dbgrpContaResg.ItemIndex = 1) And
            VerificaTipoCtaBanco(tcbResgate, qryDet.FieldByName('IDPESSOA').AsInteger, qryDet.FieldByName('IDTITULAR').AsInteger) Then
    Begin
      MsgDlg('Conta resgate já cadastrada.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end
    //edilaine - SIG25312 - fim
    else
    begin
      if qryCBanco.State in [dsEdit, dsInsert] then qryCBanco.Post; //Renato Visoni SOL 97628 \ Kintana 431568
    end;
  End
  else if pgctrlDetalhe.ActivePage = tbsDet then
  begin
  //Fanuel Junior SOL162981 Kintana1390416
      if not ValidaParticipanteInvalido() then
         Exit;
      if qryPessoa.State in [dsEdit, dsInsert] then qryPessoa.Post ;
      if qryPF.State     in [dsEdit, dsInsert] then qryPF.Post;
      if qryDepen.State  in [dsEdit, dsInsert] then qryDepen.Post;
  end
  else if pgctrlDetalhe.ActivePage = tbsDepBen then
  Begin
   //Guarda IDPESSOA

   if qryDepBenPessoa.State in [dsEdit, dsInsert] then qryDepBenPessoa.Post;
   if qryDepBenPF.State     in [dsEdit, dsInsert] then qryDepBenPF.Post;
   if qryDepBenDepen.State  in [dsEdit, dsInsert] then qryDepBenDepen.Post;
  End
  else if (pgctrlDetalhe.ActivePage = tbsTelefone) then     //edilaine - SIG25312 - inicio
  begin
    if (qryTelefone.State in [dsInsert, dsEdit]) then
    begin
      if (chkAssociaEnd.Checked) then
      begin
        qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryEndPess.FieldByName('IDPESSOA').AsInteger);
        qryPessoa.Filtered := True ;

        if chkTipoTelefone.Checked[0] then
           sIdEndTel := qryPessoa.FieldByName('IDENDCOMERCIAL').AsString;

        if sIdEndTel = '' then
           sIdEndTel := qryPessoa.FieldByName('IDENDRESIDENCIAL').AsString;
        if sIdEndTel = '' then
           sIdEndTel := qryPessoa.FieldByName('IDENDENTREGA').AsString;
        if sIdEndTel = '' then
           sIdEndTel := qryPessoa.FieldByName('IDENDCOBRANCA').AsString;
        if sIdEndTel = '' then
           sIdEndTel := qryPessoa.FieldByName('IDENDCORRESP').AsString;
        if (sIdEndTel = '') and (not chkTipoTelefone.Checked[0]) then
           sIdEndTel := qryPessoa.FieldByName('IDENDCOMERCIAL').AsString;

        if sIdEndTel = '' then
           sIdEndTel := qryEnderecoIDENDERECO.AsString;
      end
      else
        sIdEndTel := '';

      qryTelefoneIDENDERECO.AsString := sIdEndTel;
    end;
  end;   //edilaine - SIG25312 - fim


  //Vinicius Maciel SOL 161469 KTN 1372818
  //inherited;
    if (qryAtual <> nil ) and (qryAtual.State in [dsInsert, dsEdit]) then
  begin
      try
         qryAtual.Post;

         If qryAtual.IsEmpty Then
            CmeDetalhe.Operacao := opVazio
         Else
            CmeDetalhe.Operacao := opIdle;

         if ((CmeDetalhe.RepetirInsert) and (qryAtual.State = dsInsert)) and
         ((pgctrlDetalhe.ActivePage = tbsDet) or (pgctrlDetalhe.ActivePage = tbsDet01) or (pgctrlDetalhe.ActivePage = tbsDet02))then
            CmeDetalhe.Insert(Self)
         else
             FazerVoltarDet;
      except end;
      CmeDetalhe.Atualizabotoes(Self);
  end
  else   //edilaine - SIG25312 - inicio
  begin
    FazerVoltarDet;
    CmeDetalhe.Atualizabotoes(Self);
  end;   //edilaine - SIG25312 - fim

  bConfirmaPeloDetalhe := true;  //William Santana - SOL 161550 KIN 1717512

  //bbtnConfirmarClick(self);//Darivaldo Alencar SIG25312
  //sbtnAlterarClick(self);  //Darivaldo Alencar SIG25312

  //Vinicius Maciel SOL 161469 KTN 1372818 - FIM

  bConfirmaPeloDetalhe := false;  //William Santana - SOL 161550 KIN 1717512

end; // CmeDetalhe.Confirma(Self)

procedure TfrmCadDepenBenef.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;

  if bRodandoElegibilidade then Exit;

  if (bAtualizaSitDepen) or (bAtualizaGridDep) then Exit;   //edilaine - SIG25312

  if (pgctrlDetalhe.ActivePage = tbsDet) And (Not bJaExisteIdPessoa) then
  Begin
     if qryDet.State in [dsEdit, dsInsert] then
     begin
       // SE FOR INSERT O IDPESSOA JÁ ESTA PREENCHIDO E SE FOR UPDATE NÃO PRECISA ALTERAR
       // Posicionar todas as querys na mesma pessoa
       qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
       qryPessoa.Filtered := True;

       qryPF.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
       qryPF.Filtered := True;

       qryDepen.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
       qryDepen.Filtered := True;


       qryDet.FieldByName('IDTITULAR').AsInteger       := Qry.FieldByName('IDPESSOA').AsInteger;
       qryDet.FieldByName('NUMSEQUENCIA').AsInteger    := StrToInt(dbeNumSequencia.Text);
       qryDet.FieldByName('NOME').AsString             := dbeNome.Text;
       qryDet.FieldByName('TIPODEPENDENCIA').AsString  := dblkpcmbTipoDependencia.Text;
       qryDet.FieldByName('FLGBENEFICIARIO').AsInteger := 0;
       qryDet.FieldByName('DATANASC').AsString         := dbdeDataNasc.Text;
       qryDet.FieldByName('DATAMORTE').AsString        := dbdeDataMorte.Text;
       qryDet.FieldByName('EMAILFUNCEF').AsString          := dbeEmailParticular.Text;    //Jonas - SOL 178016 KINTANA 1698357
       qryDet.FieldByName('NOMEPAI').AsString          := dbeNomePai.Text;
       qryDet.FieldByName('NOMEMAE').AsString          := dbeNomeMae.Text;
       qryDet.FieldByName('NUMDOCUMENTO').AsString     := dbeCPF.Text;

       // Ádler Souza - SOL 144030 KTN 945192

       if qrydet.FieldByname('DATACADASTRO').AsString = '' then
         qrydet.FieldByname('DATACADASTRO').AsString := dateToStr(Date);
       // Fim - Ádler Souza - SOL 144030 KTN 945192

       qryDet.FieldByName('MATRICULA').AsString := dbeMatricula.Text;

       qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;

       if dbrdgrpSexo.ItemIndex = 0
       then qryDet.FieldByName('SEXO').AsString        := 'M'
       else qryDet.FieldByName('SEXO').AsString        := 'F';

            { SOL 158955 - KINTANA 1613780 - JRM6
      if dbrgrpFlgMolestiaGrave.ItemIndex = 0 then
        qryDet.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 1
      else
        qryDet.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
      qryDet.FieldByName('DATAMOLESTIAGRAVE').AsString := dbdtMolestiaGrave.Text;
      { SOL 158955 - KINTANA 1613780 - JRM6}

       //Renato Visoni SOL 126929 Kintana 668755
       qryDet.FieldByName('DATAFIMMOLESTIA').AsString := CMDateTimePicker5.Text;
       qryDet.FieldByName('INICIOSALARIOF').AsString  := dbdtInicioSalFamilia.Text;
       qryDet.FieldByName('FIMSALARIOF').AsString     := dbdtFimSalFamilia.Text;
       qryDet.FieldByName('INICIOINVALIDEZ').AsString := dbdtInicioInvalidez.Text;
       qryDet.FieldByName('FIMINVALIDEZ').AsString    := dbdtFimInvalidez.Text;
       //Renato Visoni SOL 126929 Kintana 668755

       qryDet.FieldByName('SITUACAODEPEN').AsString     := dblkpcmbSitDependente.Text;

       // Thiago Melo SOL 206458 KTN 2000405
       if qryDepen.FieldByName('idsitdependente').AsInteger = 120 then begin
         qryDet.FieldByName('FLGDEPINVALIDO').AsInteger     := 1;
        end else begin
          qryDet.FieldByName('FLGDEPINVALIDO').AsInteger    := 0;
        end;
       // Thiago Melo SOL 206458 KTN 2000405

        if dbchkIsentoIR.Checked  then
        begin
             if dbrgrpIsentoIR.ItemIndex = 0
             then qryDet.FieldByName('FLGISENTOIRRF').AsInteger := 1
             else qryDet.FieldByName('FLGISENTOIRRF').AsInteger := 0;
        end;

        // Inicio Luis Ferrari SIG 71037
        if dbchkbxFlgPlanoSaude.Checked   then
          begin
            qryDet.FieldByName('FLGPLANOSAUDE').AsInteger     := 1;
          end
        else
          qryDet.FieldByName('FLGPLANOSAUDE').AsInteger     := 0;

        // Fim

        //edilaine - SIG25312 - inicio
        if not (wwDBTpDepen.value <= '1') then
        begin
          if (qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, wwDBTpDepen.value, sIdPessJur]),  [])) then
          begin
            qryDet.FieldByName('PLANO').AsString        := qryPlano.FieldByName('PLANO').AsString;
            qryDet.FieldByName('DATACANCEL').AsString   := qryPlano.FieldByName('DATACANCEL').AsString;
            qryDet.FieldByName('MOTIVOCANCEL').AsString := qryPlano.FieldByName('MOTIVO').AsString;
          end;
        end;
        //edilaine - SIG25312 - fim

//       if qryDet.State = dsInsert
//       then qryDet.FieldbyName('FLGELEGIVEL').AsInteger     := 0;

     end;
  end;
end;

procedure TfrmCadDepenBenef.qryPessoaBeforePost(DataSet: TDataSet);
begin
  if qryPessoa.FieldByName('NOME').AsString = '' then Abort;

  inherited;

  qryPessoa.FieldByName('RAZAOSOCIAL').AsString  := dbeNome.Text;
//  qryPessoa.FieldByName('NUMDOCUMENTO').AsString := dbeCPF.Text;
  qryPessoa.FieldByName('TIPO').AsString         := 'F';


  // Fernando Santana SOL 135535 KINTANA 810963
  if pgctrlDetalhe.ActivePage = tbsDet then
     qryPessoa.FieldByName('NUMDOCUMENTO').AsString := dbeCPF.Text;

  if (OpDetalhe  =  'A') AND ((pgctrlDetalhe.ActivePage = tbsDet) or ((pgctrlDetalhe.ActivePage = tbsDocumentos) and ( qryDocumento.FieldByName('IDDOCUMENTO').AsInteger = qryGlobalDOCPFISICA.AsInteger)))then   // Fernando Santana SOL 135535 KINTANA 810963
  begin
       qryDocumento.Locate('IDDOCUMENTO', qryGlobalDOCPFISICA.AsInteger,[]);
       qryDocumento.Edit;
       qryDocumentoNUMDOCUMENTO.asString := dbeCPF.Text;
       qryDocumento.Post;
  end;

end;

procedure TfrmCadDepenBenef.qryDepenBeforePost(DataSet: TDataSet);
begin
  inherited;

  // SE FOR INSERT O IDPESSOA JÁ ESTA PREENCHIDO E SE FOR UPDATE NÃO PRECISA ALTERAR

  qryDepen.FieldByName('FLGDESIGNADO').AsInteger := qryDet.FieldByName('FLGDESIGNADO').AsInteger;
end;

procedure TfrmCadDepenBenef.qryPFBeforePost(DataSet: TDataSet);
begin
 // qryPF.fieldbyname('ESTCIVIL').AsString  := sEstCiv;  //William Santana - SOL 209384/15928 KIN 2062832

  if dbchkIsentoIR.Checked  then
    begin
         if dbrgrpIsentoIR.ItemIndex = 0
         then qryPF.FieldByName('FLGISENTOIRRF').AsInteger := 1
         else qryPF.FieldByName('FLGISENTOIRRF').AsInteger := 0;
    end;

  //William Moreira da Silva - SOL 270959 PPM 1342331
  //William Moreira da Silva - SOL 270369 PPM 1333987
  //qryPF.FieldByName('IDPAIS').AsFloat := qryPaisIDPAIS.AsFloat;
  //Taffarel - SIG83035 - início
  {if(dblkpcmbNaturalidade.Text <> '') then
  begin
     qryPF.FieldByName('CODESTADO').AsString := qryEstadoCODESTADO.AsString;
  end
  else
  begin
    qryPF.FieldByName('CODESTADO').AsString := '';
  end;}
  //Taffarel - SIG83035 - fim
  //William Moreira da Silva - SOL 270369 PPM 1333987
  //William Moreira da Silva - SOL 270959 PPM 1342331

  inherited;
end;

procedure TfrmCadDepenBenef.bbtnOkDetClick(Sender: TObject);
var
  i : integer;
  sDatainicioMolestia,
  sDataFimMolestia : string;
  bPermiteDepLegal : Boolean;
  qryAux : TwwQuery; //HIGOR 184394
  qryvalidabenf : TwwQuery; //Higor Nayde SOL 202529 KTN 1963496
  sFiltro, sNomeDependente : String;//André Oliveira SOL 165678 KINTANA 1470728
begin
  //HIGOR 184394
  qryAux := TwwQuery.create(nil);
  qryAux.DataBaseName := 'BaseDados';

//Início - Higor Nayde SOL 202529 KTN 1963496
  qryvalidabenf := TwwQuery.create(nil);
  qryvalidabenf.DataBaseName := 'BaseDados';
 //Fim - Higor Nayde SOL 202529 KTN 1963496
  //Higor N. SOLSOL213269-15632
  qryAux := TwwQuery.create(nil);
  qryAux.DataBaseName := 'BaseDados';

  qryAux.Sql.text := ' SELECT * FROM DEPENTIT WHERE IDPESSOA = ' + qryDet.FieldbyName('IDPESSOA').AsString+
            ' AND DATACADASTRO >= ''30/06/2014'' AND DATACANCELA IS NULL';
  qryAux.open;
  if not(qryAux.IsEmpty) or (qryDet.State = dsInsert)then begin

    if (not dbchkbxDesignado.Checked ) and (not dbchkbxFlgDepLegal.Checked) and (dbdtInicioIR.Text = '') then
    begin
         MsgDlg('Verifique a marcação de Dependente Legal/ Designado.','Atenção', mtInformation, [mbOk],0);
         pgcDependente.ActivePage :=  tbsDet02;
         dbchkbxDesignado.SetFocus;
         Exit;
    end;
  end;
  qryAux.close;
  qryAux.Sql.text := '';

  //Higor N. SOLSOL213269-15632

  if flgGravaDepent then begin
     if MsgDlg( 'Deseja incluir o(s) dependente(s) no cadastro de dependentes?','Atenção', mtWarning, [mbYes, mbNo],0) = mrNo then
        begin
           bbtnCancelarDetClick(sender);
           exit;
        end;
  end;
  //HIGOR 184394
  if (dbrgrpIsentoIR.ItemIndex = 0) and (wwDBCBIsentoIrrf.ItemIndex = -1 )then
    begin
        MsgDlg('Campo de Isento de IR deve ser preechido','Informação',mtInformation,[mbOk],0);
        Exit
    end;

    IF (dbrgrpMolestiaGrave.Visible)then//Marcio Sanches Spinosa SOL 238755 PPM 507686
    begin
      if wwDBCBIsentoIrrf.ItemIndex = 2 then
      begin
        if dbdtMolestiaGrave.Text = '' then
        begin
            MsgDlg('Data Início de Moléstia Grave deve ser preenchida','Informação',mtInformation,[mbOk],0);
            Exit
        end;
      //Marcio Sanches Spinosa SOL 239266 PPM 515130
      //        if CMDateTimePicker5.Text = '' then
      //        begin
      //            MsgDlg('Data Término de Moléstia Grave deve ser preenchida','Informação',mtInformation,[mbOk],0);
      //            Exit;
      //        end;

       //Marcio Sanches Spinosa SOL 239266 PPM 515130
      end;
      if (CMDateTimePicker5.text <> '') or (dbdtMolestiaGrave.text <> '' )then
      begin
      sDatainicioMolestia := FormatDateTime('dd/mm/yyyy',dbdtMolestiaGrave.Date );   //Data Inicial
      sDataFimMolestia    := FormatDateTime('dd/mm/yyyy',CMDateTimePicker5.Date );   //Data Final

      //InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia, qryDet.FieldByName('IdPessoa').asInteger); //Taffarel - SIG68507/71228
      end;
    end; //Marcio Sanches Spinosa SOL 238755 PPM 507686
    //Higor Nayde SOL 202529 KTN 1963496 Inicio

  if (qryDet.State in [DsInsert]) then begin
    qryvalidabenf.close;
    qryvalidabenf.SQL.Clear;
    qryvalidabenf.SQL.add('SELECT COUNT(NOME) AS DEPENT                                  '+
                         '  FROM (SELECT * FROM DEPENTIT WHERE IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString+') TIT, '+
                         '       PESSOA PE,                                              '+
                         '       PESSOAFISICA PF,                                        '+
                         '       DEPENTIT DET                                            '+
                         ' WHERE LOWER(PE.NOME) LIKE LOWER('''+qryPessoa.FieldByName('NOME').AsString+''')'+
                         '   AND PF.DATANASC = '''+ qryPF.FieldByName('DATANASC').AsString +''''+
                         '   AND DET.IDDEPENDENCIA = '''+ qryDet.FieldByName('IDDEPENDENCIA').AsString +''''+
                         '   AND DET.IDTITULAR = TIT.IDTITULAR                           '+
                         '   AND DET.IDPESSOA = TIT.IDPESSOA                             '+
                         '   AND PE.IDPESSOA = TIT.IDPESSOA                              '+
                         '   AND PF.IDPESSOA = TIT.IDPESSOA                              ');
    qryvalidabenf.open;

    if (qryvalidabenf.FieldByName('DEPENT').AsInteger > 0 ) then begin
       MessageDlg('Já existe dependente cadastrado com os mesmos dados de: '+#13+ 'Nome, Data de Nascimento e Grau de Parentesco. '+ #13+'Favor verificar.', mtInformation, [mbOK], 0);
       exit;
     end;
  end;
  qryvalidabenf.Destroy;

  //Higor Nayde SOL 202529 KTN 1963496 FIM

   // SOL 161016 KINTANA 1355687
 {if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    if (  (not(Chkregreplan.Checked)) and
          (not(Chkreb.Checked)) and
          (not(Chknovoplano.Checked)) ) then begin
     MessageDlg('Nao é permiter cadastrar um dependente sem plano',mtInformation, [mbOK], 0);
     exit;
     end;
  end;}
    // SOL 161016 KINTANA 1355687

//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Inicio
 if pgctrlDetalhe.ActivePage = tbsDet then
    begin
      //BRUNO AZEVEDO SOL 154095 KINTANA 1169180
      if dbdeDataNasc.Text = '' then
      begin
        MsgDlg('Data de Nascimento não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
        dbdeDataNasc.SetFocus;
        Abort;
      end;

      if dbdeDataNasc.Date > DataHoje then
      begin
        //Darivaldo Alencar SIG25312 - inicio
        //MsgDlg('Data de Nascimento maior que a data de hoje.','Erro',mtError,[mbOk,mbHelp],0);
        dbdeDataNasc.SetFocus;
        //Darivaldo Alencar SIG25312 - fim
        Abort;
      end;
      //BRUNO AZEVEDO SOL 154095 KINTANA 1169180


      //Darivaldo Alencar SIG25312 - inicio
      if (dblkpcmbSitDependente.Text = 'INVÁLIDO(A)') then
          MsgDlg(MSG037,'Atenção', mtInformation, [mbOK], 0);

      if (verificaAlteracaoDepCancelado(3)) then
      begin
        if (qryPessoa.fieldbyname('NUMDOCUMENTO').asString <> EmptyStr)then
          begin
             if not ValidarCpf(dbeCPF.Text) then
               begin
                 MsgDlg(MSG028,'Atenção',mtWarning,[mbOK],0);
                 if pgcDependente.ActivePage = tbsDet01 then
                    dbeCPF.setfocus;
                 abort;
               end;

            FazQuery(qryAux,'SELECT idpessoa FROM PESSOA P WHERE P.NUMDOCUMENTO = ' + QuotedStr(qryPessoa.fieldbyname('NUMDOCUMENTO').asString));
            if (qryPessoa.state in [dsInsert])then
              begin
                if(qryAux.recordcount > 0) then
                  begin
                     if (dbeCPF.text <> emptyStr)then
                     begin
                       MsgDlg(MSG006,'Atenção', mtInformation, [mbOk],0);
                     end;
                  end;
              end
            else if (qryPessoa.state in [dsEdit])then begin
                if ((qryAux.recordcount > 1) or
                    ((qryAux.fieldbyname('idpessoa').asString <> qryPessoa.fieldbyname('idpessoa').asString) and (qryAux.recordcount > 0))
                    )then
                begin
                  if (dbeCPF.text <> emptyStr)then
                  begin
                    MsgDlg(MSG006,'Atenção', mtInformation, [mbOk],0);
                  end;
                end;
            end;
          end
        else if (CalcIdade(dbdeDataNasc.date) >= 8) then
          begin
            MsgDlg(MSG039,'Atenção',mtInformation,[mbOk],0);
            if pgcDependente.ActivePage = tbsDet01 then
               dbeCPF.setfocus;
            abort;
          end;
      end;

      If (verificaAlteracaoDepCancelado(2)) then
          MsgDlg(MSG035,'Atenção',mtInformation,[mbOk],0);

      If (verificaAlteracaoDepCancelado(4)) then
          MsgDlg(MSG036,'Atenção',mtInformation,[mbOk],0);
    //Darivaldo Alencar - SIG 25312 -fim


     ComparaCampos;
     FlgMsg:=false;
    end;
//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim

  if (qryDet.State in [DsInsert, dsEdit]) then                                                        //Darivaldo Alencar - SIG 25312
      qrydet.fieldbyname('IDADE').asinteger :=  CalcIdade(dbdeDataNasc.date); //Darivaldo Alencar - SIG 25312
  //monica gonzaga
  {Thiago Melo SOL 224506 kintana 2058056
  if (dtsolicitacontasalario.text = '') and (dbchksolicitacontasalario.Checked) then
  begin
      ShowMessage('É necessário informar a data de solicitação de conta salário.');

      Abort;
  end;
  Thiago Melo SOL 224506 kintana 2058056}

    if (dtcontasalarioprocessada.text = '') and (dbchkSalarioProcessado.Checked) then
  begin
      ShowMessage('É necessário informar a data de processamento da conta salário.');
      Abort;
  end;
  //monica gonzaga

 if (pgctrlDetalhe.ActivePage = tbsTelefone) then  //SOL 127643 Thiago Passos
     begin
        if chkTipoTelefone.Checked[3] then
          if StrToInt(DBEDNUMERO.text[1]) < 6 then
           begin
            MessageDlg('Número de telefone celular inválido.', mtInformation, [mbOK], 0);
            exit;
           end;
         //Wylliam Leite da Silva - SOL 242767 PPM 371063 - Inicio
        {if Length(DBEDDDD.Text) <> 2 then
          begin
            MessageDlg('Número DDD inválido.', mtInformation, [mbOK], 0);
            exit;
           end;}
        //Wylliam Leite da Silva - SOL 242767 PPM 371063 - Fim

        if StrToInt(DBEDDDD.Text[1])=0 then
          begin
            MessageDlg('Número DDD inválido.', mtInformation, [mbOK], 0);
            exit;
           end;
     end;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if qrydet.FieldByName('IDDEPENDENCIA').IsNull Then
    Begin
      MsgDlg('Grau de Parentesco não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      if dblkpcmbTipoDependencia.CanFocus then //Darivaldo Alencar SIG25312
      dblkpcmbTipoDependencia.SetFocus;
      Abort;
    End;

    if dbeNome.Text = '' then
    begin
      MsgDlg('Nome não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      if dbeNome.CanFocus then dbeNome.SetFocus; // Felipe A. Santos SOL: 208475 KINTANA: 2016859
      Abort;
    end;

    if dbrdgrpSexo.ItemIndex = -1 then
    begin
      MsgDlg('Sexo não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dbrdgrpSexo.ItemIndex := 0;
      Abort;
    end;

    if dblkpcmbTipoDependencia.Text = '' then
    begin
      MsgDlg('Grau de Parentesco não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbTipoDependencia.SetFocus;
      Abort;
    end;

    If dblkpcmbSitDependente.Text = ''
     Then Begin
       MsgDlg('Situação do Dependente não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
       dblkpcmbSitDependente.SetFocus;
       Abort;
     End;

    //Início - William Santana - 209384/15928 KIN 2062832
    if (cmbEstCiv.text = EmptyStr) then
    begin
      //MsgDlg('O estado civil deve ser selecionado.','Erro',mtError,[mbOk,mbHelp],0); //Darivaldo Alencar SIG25312
      MsgDlg(MSG025,'Atenção', mtInformation, [mbOk],0);                               //Darivaldo Alencar SIG25312
      if cmbEstCiv.canFocus then cmbEstCiv.SetFocus; //Darivaldo Alencar SIG25312
      //Abort;                                       //Darivaldo Alencar SIG25312
    end;
    //Término - William Santana - 209384/15928 KIN 2062832

     //Renato Visoni SOL 141428  KINTANA 893958
     if (sIdPlanoPrev = '74') And (dblkpcmbSitDependente.Text = 'NORMAL') and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='FIL') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='ENT') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='IRM')) // HIGOR NAYDE SOL 248947 KIN 680472
     and FazQuery(QryAux,'SELECT * FROM DEPENDENTE WHERE IDPESSOA ='+sIdPessoa+' AND IDSITDEPENDENTE = 1')
     then begin
       FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(dbdeDataNasc.Text)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
       //if (QryAux.FieldByname('IDADE').asFloat >= 24.01) and (not(dbchkbxDesignado.checked)) then begin
       if (QryAux.FieldByname('IDADE').asFloat >= 25.00) and (not(dbchkbxDesignado.checked)) then begin
       //William Moreira da Silva SOL 194313 KINTANA 1858476
         MsgDlg('A pessoa informada não possui os requisitos previstos no plano para ser elegível a dependente!','Aviso',mtInformation,[mbOk],0);
         Abort;
       end;
     end;
     //Renato Visoni SOL 141428 KINTANA 893958

     //BRUNO AZEVEDO SOL 157054 KINTANA 1247290
     bPermiteDepLegal := True;
     if (qryDet.FieldByName('FLGDEPLEGAL').AsInteger = 1) then begin
       bPermiteDepLegal := False;
     end;
     //BRUNO AZEVEDO SOL 158710 KINTANA 1290599
     //if (sIdPlanoPrev = '74') And (qryDet.FieldByName('FLGDEPLEGAL').AsInteger = 1) then begin
       FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(dbdeDataNasc.Text)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
       if ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='ENT') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='FIL') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='IRM')) // HIGOR NAYDE SOL 248947 KIN 680472
          and ((QryAux.FieldByname('IDADE').asFloat <= 24.00) or (dblkpcmbSitDependente.Text = 'INVÁLIDO(A)') or (dblkpcmbSitDependente.Text = 'SENTENÇA JUDICIAL')) then begin  // edilaine - SIG 25313
              bPermiteDepLegal := True;
       end;                                                           //BRUNO AZEVEDO SOL 159460 KINTANA 1314175
       if ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='EXC') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='PAI') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM')) then begin // HIGOR NAYDE SOL 248947 KIN 680472
         bPermiteDepLegal := True;
       end;
       if not(bPermiteDepLegal) then begin
         MsgDlg('A pessoa informada não possui os requisitos previstos no plano para ser elegível a dependente!','Aviso',mtInformation,[mbOk],0);
         Abort;
       end;
     //end;
     //BRUNO AZEVEDO SOL 157054 KINTANA 1247290

     // SIG 71037 Ferrari
      if dbchkbxFlgPlanoSaude.Checked   then
        begin
          dbchkbxFlgDepLegal.Checked := False;
          qryDet.FieldByName('FLGPLANOSAUDE').AsInteger   := 1;
          qryDet.FieldByName('FLGDEPLEGAL').AsInteger     := 0;
        end
      else if dbchkbxFlgDepLegal.Checked then
        begin
          dbchkbxFlgPlanoSaude.Checked := False;
          qryDet.FieldByName('FLGPLANOSAUDE').AsInteger   := 0;
          qryDet.FieldByName('FLGDEPLEGAL').AsInteger     := 1;
        end;
     // SIG 71037 Ferrari


     //BRUNO AZEVEDO SOL 158386 KINTANA 1280863
     bPermiteDepLegal := True;
     if ((qryDet.FieldByName('FLGDEPLEGAL').AsInteger = 1) and (qryDet.FieldByName('FLGDESIGNADO').AsInteger = 1)) then begin
       bPermiteDepLegal := False;

       if (qryDet.FieldByName('IDDEPENDENCIA').AsString ='ENT') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='FIL') or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='IRM') // HIGOR NAYDE SOL 248947 KIN 680472
          and (QryAux.FieldByname('IDADE').asFloat <= 24.00) then begin
         bPermiteDepLegal := True;
       end;

       if not(bPermiteDepLegal) then begin
         MsgDlg('A pessoa informada não possui os requisitos previstos no plano para ser elegível a dependente!','Aviso',mtInformation,[mbOk],0);
         Abort;
       end;
     end;
     //BRUNO AZEVEDO SOL 158386 KINTANA 1280863

//Darivaldo Alencar SIG25312 -inicio
//     /////SOL 162578 KINTANA 1389694 Douglas.Siqueira
//     if (dblkpcmbGrauInstr.text='SUPERIOR INCOMPLETO') and (trim(dbdtFimIR.text)='') then
//         begin
//         MsgDlg('Para dependentes com o Grau de Instrução igual a: "Superior Incompleto", a Data Fim de IR deve ser preenchida '
//         ,'Erro',mtError,[mbOk,mbHelp],0);
//         pgcDependente.ActivePage := tbsDet02;
//         dbdtFimIR.SetFocus;
//         Abort;
//         end;
//     /////Douglas
//Darivaldo Alencar SIG25312 -fim

     /////SOL 162578 KINTANA 1389694 Douglas.Siqueira

     //edilaine - SIG25312 - inicio
     {if (dblkpcmbGrauInstr.text='SUPERIOR INCOMPLETO') and (trim(dbdtFimIR.text)='') then
         begin
         MsgDlg('Para dependentes com o Grau de Instrução igual a: "Superior Incompleto", a Data Fim de IR deve ser preenchida '
         ,'Erro',mtError,[mbOk,mbHelp],0);
         pgcDependente.ActivePage := tbsDet02;
         dbdtFimIR.SetFocus;
         Abort;
         end;
     }//edilaine - SIG25312 - fim

     /////Douglas
     //inicio André Oliveira SOL 165678 KINTANA 1470728
      sFiltro := 'AND D.IDDEPENDENCIA = '+QuotedStr('COM');
      if((VerificaTipoDenpedit(sFiltro, sIdPessoa, qryPessoa.FieldByName('IDPESSOA').AsString, '')) and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM')or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='COP')) and(qryDet.state in  [DsInsert,DsEdit]))then // HIGOR NAYDE SOL 248947 KIN 680472
      begin
           MsgDlg('Participante já possui um cônjuge cadastrado','Aviso',mtInformation,[mbOk],0);
           Abort;
      end;
      sFiltro := 'AND D.IDDEPENDENCIA = '+QuotedStr('COP');
      if((VerificaTipoDenpedit(sFiltro, sIdPessoa,qryPessoa.FieldByName('IDPESSOA').AsString,'')) and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM')or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='COP')) and(qryDet.state in  [DsInsert,DsEdit]))then // HIGOR NAYDE SOL 248947 KIN 680472
      begin
           MsgDlg('Participante já possui um companheiro cadastrado','Aviso',mtInformation,[mbOk],0);
           Abort;
      end;
      sFiltro := 'AND D.IDDEPENDENCIA = '+QuotedStr('PAI');
      if(VerificaTipoDenpedit(sFiltro, sIdPessoa, qryPessoa.FieldByName('IDPESSOA').AsString, qryPF.FieldByName('SEXO').AsString)) and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='PAI') and(qryDet.state in [DsInsert,DsEdit]))then // HIGOR NAYDE SOL 248947 KIN 680472
      begin
           MsgDlg('Participante já possui um Pai/Mãe cadastrado','Aviso',mtInformation,[mbOk],0);
           Abort;
      end;
    //fim André Oliveira SOL 165678 KINTANA 1470728

      // edilaine - SIG 25313 inicio
      if (qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM') and (DependenteMenor16Anos) then
      begin
        MsgDlg('O dependente/beneficiário possui idade menor ou igual a 16 anos.','Aviso',mtWarning,[mbOk,mbHelp],0);
      end;
      // edilaine - SIG 25313 fim
  end
  else if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
    qryEndPess.FieldByName('codestado').AsString := qryCidade.FieldByName('codestado').AsString   //Luiz Carlos - SIG70416
  end
  else if pgctrlDetalhe.ActivePage = tbsContaBanco then
  Begin
    if Trim(lkpcmbbxBanco.Text) = '' then
    begin
     MsgDlg('Banco da Conta Bancária não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     lkpcmbbxBanco.SetFocus;
     Abort;
    end;

    if Trim(lkpcmbbxAgencia.Text) = '' then
    begin
      MsgDlg('Agência da Conta Bancária não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      lkpcmbbxAgencia.SetFocus;
      Abort;
    end;

    If (Trim(dbeContaCorrente.Text) = '') And
       (rgrpTipoConta.ItemIndex <> 3)     Then
    begin
      MsgDlg('Conta Corrente não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
      dbeContaCorrente.SetFocus;
      Abort;
    end;

  end
  else if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
      //Início - William Santana - SOL 161550 KIN 1717512
    {bDependenteMaior := DependenteMaiorIdade;//William Moreira da Silva - SOL 234741 PPM 436804

    // Felipe A. Santos SOL 208093 KTN 2016011

    // se o dependente for menor de idade obriga a preecher um responsável
    //após homologação do SOL 161550 essa validação deverá ser movida para aba reprentante legal***
    if not(bDependenteMaior) then
    begin
       if Trim(dbeResponsavel.Text) = '' then
       begin
          MsgDlg('Nome do responsável não preenchido.','Erro', mtError, [mbOk], 0);
          Exit;
       end;

       if (lkpcmbTipoRecebedor.Text = '') then
       begin
          MsgDlg('Tipo de responsável não preenchido.','Erro', mtError, [mbOk], 0);
          Exit;
       end;

        if (dtLimiteRecebedor.Text = '') then
       begin
          MsgDlg('Data limite para o responsável não preenchida.','Erro', mtError, [mbOk], 0);
          Exit;
       end;

    end;
    // Felipe A. Santos SOL 208093 KTN 2016011 - fim
    } //Término - William Santana - SOl 161550 KIN 1717512

    if Trim(lkpcmbBeneficio.Text) = '' then
    begin
     MsgDlg('Benefício não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     lkpcmbBeneficio.SetFocus;
     Abort;
    end;

    if Trim(dbePrioridade.Text) = '' then
    begin
      MsgDlg('Prioridade não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
      dbePrioridade.SetFocus;
      Abort;
    end;

    if Trim(dbePercentual.Text) = '' then
    begin
      MsgDlg('Percentual não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      dbePercentual.SetFocus;
      Abort;
    end;

    if ExcedeCemPorCento
    then begin
       MsgDlg('Valor excede o percentual máximo para esse benefício', 'Erro',mtError,[mbOk],0);
		 //Wylliam Leite da Silva - SOL:258918 PPM:1007497 - Início
       //QryBenef.FieldByName('PERCENTUAL').AsFloat := QryBenef.FieldByName('PERCENTUAL').OldValue;
       //qryBenef.Post;
      // qryBenef.Delete; // William Santana - SOL 260670 - PPM 1040878

       if sGuardaEstAnt = dsEdit then
       begin
          qryBenef.Edit;
          QryBenef.FieldByName('PERCENTUAL').AsFloat := QryBenef.FieldByName('PERCENTUAL').OldValue;
          QryBenef.FieldByName('PRIORIDADE').AsFloat := QryBenef.FieldByName('PRIORIDADE').OldValue;
          //QryBenef.FieldByName('BENEFICIO').AsFloat := QryBenef.FieldByName('BENEFICIO').OldValue;
          qryBenef.Post;

          qryBenef.Edit; // William Santana - SOL 260670 - PPM 1040878
       end;
       //Wylliam Leite da Silva - SOL:258918 PPM:1007497 - Fim
       dbePercentual.SetFocus;
       Exit;
    end;

    // Se o recebedor for o proprio, entao guardar seus dados para inseri-lo na tabela RESPONSAVEL
    if rdbProprio.Checked
    then begin
       bInseriuRecebProprio := True;

       //Início - William Santana - SOL 161550 KIN 1717512
       if (not DependenteMaiorIdade) and (not VerificaReprLegal) then   //Verifica se o dependente é menor de idade sem Representante Legal
       begin
         MsgDlg('O dependente selecionado tem menos de 18 anos. Neste caso o cadastro do Representante Legal é obrigatório.','Informação', mtWarning, [mbOk], 0);
         if (not VerificaReprLegal) then
            IntegraBenef_ReprLegal(1)
         else
         begin
           rdbOutro.checked := true;
           Abort;
         end;
       end;
       //Término - William Santana - SOL 161550 KIN 1717512
    end;

    //WO20730 - Leandro - inicio
    If ((cmbTipoOpIR.ItemIndex = -1) and
       (qry.FieldByName('IDPLANOPREV').AsInteger <> 2)) then
    Begin
      MsgDlg('Escolha a Opção de Tabela de IR "Tabela Progressiva" ou "Tabela Regressiva" .', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;
    //WO20730 - Leandro - fim


  end

// Controle da pasta de Nucleo Familiar
  else if pgctrlDetalhe.ActivePage = TbNucleoFamiliar then begin
// Testa Campos
    If Trim(DbLkcRespNucleo.Text) = '' Then Begin
      MsgDlg('Responsável não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      DbLkcRespNucleo.SetFocus;
      Exit;
    End;
// Caso Incluindo Gera Sequencial e Guarda o Titular
    If QryNucleoFam.State in [DsInsert] Then Begin
      QryNucleoFam.FieldByName('IDNUCLEOFAMILIAR').AsInteger:= LeUltRegistro(Nil,'NUCLEOFAMILIAR');
      QryNucleoFam.FieldByName('IDTITULAR').AsInteger       := Qry.FieldByName('IDPESSOA').AsInteger;
    End;
  end

   else if pgctrlDetalhe.ActivePage = tbsDepBen then
   Begin
//
     if dbeNomeDepBen.Text = '' Then
      Begin
       MsgDlg('Nome não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
       dbeNomeDepBen.SetFocus;
       Abort;
      End;

     if dtpNascDepBen.Text = '' then
      Begin
        MsgDlg('Data de Nascimento não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
        dtpNascDepBen.SetFocus;
        Abort;
      end;

     if dtpNascDepBen.Date > DataHoje then
      Begin
        MsgDlg('Data de Nascimento maior que a data de hoje.','Erro',mtError,[mbOk,mbHelp],0);
        dtpNascDepBen.SetFocus;
        Abort;
      end;

     if dblcParentDepBen.Text = '' then
      Begin
        MsgDlg('Grau de Parentesco não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
        dblcParentDepBen.SetFocus;
        Abort;
      end;

     if dbcSexoDepBen.ItemIndex = -1 then
      Begin
        MsgDlg('Sexo não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
        dbcSexoDepBen.ItemIndex := 0;
        Abort;
      end;

     //Início - William Santana - 209384/15928 KIN 2062832
     {if (cmbEstCivDepBen.text = EmptyStr) then
     begin
      MsgDlg('O estado civil deve ser selecionado.','Erro',mtError,[mbOk,mbHelp],0);
      cmbEstCivDepBen.SetFocus;
      Abort;
     end;  } // Michelle Mota - SIG 25312
    //Término - William Santana - 209384/15928 KIN 2062832

     //Renato Visoni SOL 141428  KINTANA 893958
     if (sIdPlanoPrev = '74') And (wwDBLookupCombo1.Text = 'NORMAL') and ((Trim(dblcParentDepBen.Text) ='FILHO/EQUIPARAD') or (Trim(dblcParentDepBen.Text) ='ENTEADO(A)') or (Trim(dblcParentDepBen.Text) ='IRMÃO'))
     and FazQuery(QryAux,'SELECT * FROM DEPENDENTE WHERE IDPESSOA ='+sIdPessoa+' AND IDSITDEPENDENTE = 1')
     then begin
       FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(dtpNascDepBen.Text)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
       //if (QryAux.FieldByname('IDADE').asFloat >= 24.01) and (not(dbchkbxDesignado.checked)) then begin
       if (QryAux.FieldByname('IDADE').asFloat >= 25.00) and (not(dbchkbxDesignado.checked)) then begin
       //William Moreira da Silva SOL 194313 KINTANA 1858476
         MsgDlg('A pessoa informada não possui os requisitos previstos no plano para ser elegível a dependente!','Aviso',mtInformation,[mbOk],0);
         Abort;
       end;
     end;
     //Renato Visoni SOL 141428 KINTANA 893958

     //BRUNO AZEVEDO SOL 157054 KINTANA 1247290
     bPermiteDepLegal := True;
     //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
     if (qryDepBen.FieldByName('FLGDEPLEGAL').AsInteger = 1) then begin
       bPermiteDepLegal := False;
     end;
     //BRUNO AZEVEDO SOL 158710 KINTANA 1290599
     //if (sIdPlanoPrev = '74') And (qryDet.FieldByName('FLGDEPLEGAL').AsInteger = 1) then begin
       FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(dbdeDataNasc.Text)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
                                                                      //BRUNO AZEVEDO SOL 159460 KINTANA 1314175
       if ((Trim(dblkpcmbTipoDependencia.Text) ='COMPANHEIRO(A)') or (Trim(dblkpcmbTipoDependencia.Text) ='EX-CONJUGE') or (Trim(dblkpcmbTipoDependencia.Text) ='CONJUGE/EQUIP.') or (Trim(dblkpcmbTipoDependencia.Text) ='ENTEADO(A)') or (Trim(dblkpcmbTipoDependencia.Text) ='FILHO/EQUIPARAD') or (Trim(dblkpcmbTipoDependencia.Text) ='IRMÃO'))
          and ((QryAux.FieldByname('IDADE').asFloat <= 24.00) or (dblkpcmbSitDependente.Text = 'INVÁLIDO(A)') or (dblkpcmbSitDependente.Text = 'SENTENÇA JUDICIAL') ) then begin  // edilaine - SIG 25313
         bPermiteDepLegal := True;
       end;
       if (Trim(dblkpcmbTipoDependencia.Text) ='PAI/MÃE') then begin
         bPermiteDepLegal := True;
       end;
       if not(bPermiteDepLegal) then begin
         MsgDlg('A pessoa informada não possui os requisitos previstos no plano para ser elegível a dependente!','Aviso',mtInformation,[mbOk],0);
         Abort;
       end; // Descomentado Felipe A. Santos SOL 208311 KTN 2020366
     //BRUNO AZEVEDO SOL 157054 KINTANA 1247290

     //BRUNO AZEVEDO SOL 158386 KINTANA 1280863
     bPermiteDepLegal := True;
     //BRUNO AZEVEDO SOL 162328 KINTANA 1389886
     if ((qryDepBen.FieldByName('FLGDEPLEGAL').AsInteger = 1) and (qryDepBen.FieldByName('FLGDESIGNADO').AsInteger = 1)) then begin
       bPermiteDepLegal := False;

       if ((Trim(dblkpcmbTipoDependencia.Text) ='ENTEADO(A)') or (Trim(dblkpcmbTipoDependencia.Text) ='FILHO/EQUIPARAD') or (Trim(dblkpcmbTipoDependencia.Text) ='IRMÃO'))
          and (QryAux.FieldByname('IDADE').asFloat <= 24.00) then begin
         bPermiteDepLegal := True;
       end;

       if not(bPermiteDepLegal) then begin
         MsgDlg('A pessoa informada não possui os requisitos previstos no plano para ser elegível a dependente!','Aviso',mtInformation,[mbOk],0);
         Abort;
       end;
     end;

     //Vinicius ferreira
    {qryDepBenPF.Filtered := False;
    qryDepBenPF.Filter := '';
    qryDepBenPF.First;
    While Not qryDepBenPF.Eof Do
          if qryDepBenPF.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepBenPF.Delete
          else
              qryDepBenPF.Next;

    qryDepBenPESSOA.Filtered := False;
    qryDepBenPESSOA.Filter := '';
    qryDepBenPESSOA.First;
    While Not qryDepBenPESSOA.Eof Do
          if qryDepBenPESSOA.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepBenPESSOA.Delete
          else
              qryDepBenPESSOA.Next;}


     qryDepBen.Post;
     //Vinicius ferreira
  end
     //BRUNO AZEVEDO SOL 158386 KINTANA 1280863
  else If pgctrlDetalhe.ActivePage = tbsOutrasInformacoes Then
  begin
    if (qryAtual =  qryOutrasInforms) then begin //Darivaldo alencar SIG 27871
    // Felipe A. Santos SOL 208311 KTN 2020366 -  Início
    if Trim(dblkParamPessoa.Text) = '' then
    begin
      MsgDlg('Parâmetro não preenchido','Informação',mtInformation,[mbOk,mbHelp],0);
      dblkParamPessoa.SetFocus;
      Exit;
    end;

    if Trim(dbedValor.Text) = '' then
    begin
      MsgDlg('Conteúdo não preenchido','Informação',mtInformation,[mbOk,mbHelp],0);
      dbedValor.SetFocus;
      Exit;
    end;

    if Trim(dtInicio.Text) = '' then
    begin
      MsgDlg('Data Início não preenchido.','Informação',mtInformation,[mbOk,mbHelp],0);
      dtInicio.SetFocus;
      Exit;
    end;
	// Felipe A. Santos SOL 208311 KTN 2020366 - fim

    If qryParamPessoa.State in [dsInsert ]
    Then qryParamPessoa.FieldByName('IDPESSOA').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
    //Darivaldo alencar SIG 27871 -inicio
   end
   else begin
       if (dtpDataFim.date <> 0) and (dtpDataInicio.date <> 0) then
          begin
           if(dtpDataInicio.Date > dtpDataFim.Date) then
               begin
                   dtpDataInicio.SetFocus;
                   exit;
               end;
           end;

       if (qryOcupacao.state in [dsInsert]) then
         begin
           if (qryOcupacao.fieldbyname('IDPESSOA').asString <> EmptyStr) then
               qryOcupacao.fieldbyname('IDPESSOAPPE').asString:=  GetSequence('PESSOAPPE');
           qryOcupacao.post;
         end
   end;
    Panel5.SendToBack;
    AlinhaComponente(AlTop);
   //Darivaldo alencar SIG 27871 - fim
  end;

  //Vinicius Maciel SOL 161469 KTN 1372818
  If (pgctrlDetalhe.ActivePage = tbsTelefone) Then
  begin
      //if qryTelefone.State in [dsInsert ] then  //Darivaldo Alencar SIG25312  --voltar para grid
      //qryTelefone.post;                         //Darivaldo Alencar SIG25312
      //edilaine - SIG25312 - inicio
      if qryRamal.State in [dsInsert]then
         qryRamal.post;

      if qryContato.State in [dsInsert ] then
      begin
        qryContato.post;
        //qryContato.ApplyUpdates;
      end;
      //edilaine - SIG25312 - fim
  end;

  If (pgctrlDetalhe.ActivePage = tbsOutrasInformacoes) and (qryOutrasInforms.state = dsInsert) then
        qryOutrasInforms.post;

  if (pgctrlDetalhe.ActivePage = tbsDepBen) then
  begin
      if qryDepBen.State = dsInsert then
      qryDepBen.post;
      if qryDepBenPF.State = dsInsert then
      qryDepBenPF.post;
      if qryDepBenDepen.State = dsInsert then
      qryDepBenDepen.post;
      if qryDepBenPessoa.State = dsInsert then
      qryDepBenPessoa.post;
  end;

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
    if dbeResponsavel.Text = '' then
    begin
     MsgDlg('A seleção do  Representante Legal é obrigatória','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if lkpcmbTipoRecebedor.Text = '' then
    begin
     MsgDlg('A seleção do Tipo de Responsável é obrigatória','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if (tmpckrDATAINICIO.text = '') or (tmpckrDATATERMINO.text = '') or
       (tmpckrDATAINICIO.Date > tmpckrDATATERMINO.Date) then
    begin
     MsgDlg('É necessário o preenchimento do período de Tutela/Curatela','Erro',mtError ,[mbOk],0);
     abort;
    end;

    timepickerDATAChange(self);
    rgSituacaoAtualClick(self);

    if (( bVeiodoBenefResp ) or ( bVeiodoBenefProprio )) and (rgSituacaoAtual.itemIndex <> 0) then
    begin
      MsgDlg('É obrigatório o cadastro de documento vigente para os pensionistas menores de 18 anos e nos'
            +' casos em que o recebedor do benefício é o representante legal','Erro',mtError ,[mbOk],0);
      abort;
    end;

    try
    if qryReprLegal.State in [dsInsert,dsEdit] then
       qryReprLegalBeforePost;
       qryReprLegal.Post;
    except
       raise;
    end;

   dbgrdReprLegal.repaint;
   dbgrdLogReprLegal.repaint;
   pnlReprLegal.visible := false ;
   pnlGrdReprLegal.visible := True ;

   qryLogReprLegal.Filter   := '' ;
   qryLogReprLegal.Filtered := false;
   qryLogReprLegal.Close;
   qryLogReprLegal.ParamByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
   qryLogReprLegal.ParamByName('IDPESSOA').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
   qryLogReprLegal.ParamByName('IDTITULAR').AsInteger := qryDet.FieldByName('IDTITULAR').AsInteger;
   qryLogReprLegal.Open;

   bbtnCancelarDetClick(sender);

    if bVeioDoBenefResp then
     IntegraBenef_ReprLegal(3);

  end;
  //Término - William Santana SOL 161550 KIN 1717512


  //Vinicius Maciel SOL 161469 KTN 1372818 - FIM
  sNomeDependente :=  Trim(dbeNome.text);  //Sadi Freire SOL 234586 // Felipe A. Santos Adicionado o Trim SOL: 208475 KINTANA: 2016859
  //Higor Nayde 184394
  //bbtnConfirmar.enabled := true; // Felipe A. Santos SOL 208311 KTN 2020366

  inherited;
  MostraEscondeGridOutrasInformacoes; //Darivaldo Alencar SIG27871

  if flgGravaDepent then begin
     Try
//Darivaldo Alencar SIG25312 -inicio
//        if not dtmBaseDados.dbBaseDados.InTransaction then
//           dtmBaseDados.dbBaseDados.StartTransaction;
//Darivaldo Alencar SIG25312 -fim

        qryAux.close;
        qryAux.SQL.Clear;
        qryAux.SQL.add('UPDATE DEPENTITNCAD'+
                        ' SET FLGCADASTRO = 1, '+
                        ' IDPESSOA = '+intToStr(IdPessoa)+//+qrydet.fieldByNAme('IDPESSOA').AsString+
                        ' WHERE IDTITULAR ='+qryDepeNaoCadastrado.FieldByName('IDTITULAR').AsString+
                        ' AND TRIM(NODEP) = '+QuotedStr(sNomeDependente));   //Sadi Freire SOL 234586 // Felipe A. Santos Adicionado o TRIM - SOL: 208475 KINTANA: 2016859
        qryAux.ExecSQL;

        qryDepeNaoCadastrado.fieldByName('SELECIONADO').AsString := 'N';
//Darivaldo Alencar SIG25312 -inicio
//        if dtmBaseDados.dbBaseDados.InTransaction  then
//           dtmBaseDados.dbBaseDados.Commit;
////Darivaldo Alencar SIG25312 -fim
     Except
        On E:Exception Do
        Begin
//Darivaldo Alencar SIG25312 -inicio
//           if dtmBaseDados.dbBaseDados.InTransaction then
//              dtmBaseDados.dbBaseDados.Rollback;
//Darivaldo Alencar SIG25312 -fim
        End;
     End;
      qryAux.Destroy;

     if not(qryDepeNaoCadastrado.EOF) then begin
         qryDepeNaoCadastrado.next;
         //bbtnConfirmar.enabled := false; //Darivaldo Alencar SIG25312
         SelecionaDenpNCadastrado;
     end;
     if (qryDepeNaoCadastrado.EOF) then begin
         qryDepeNaoCadastrado.Close;
         if not qryDepeNaoCadastrado.Prepared then qryDepeNaoCadastrado.prepare;
         qryDepeNaoCadastrado.ParamByName('PIDTITULAR').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
         qryDepeNaoCadastrado.open;
         //bbtnConfirmar.enabled := true;  //Darivaldo Alencar SIG25312
         flgGravaDepent := false;
         if not qryDepeNaoCadastrado.IsEmpty then begin
            btnSelecionaAlguns.Enabled:= true;
            btnSelecionaTodos.Enabled:= true;
         end else begin
               btnSelecionaAlguns.Enabled:= false;
               btnSelecionaTodos.Enabled:= false;
         end;
     end;
  end;
  qryDependencia.Sql.text := qryDependenciaAux.Sql.text; // higor
  // SpeedButton2Click(sender);
  habilitaAlteracaoDepCancelado(false); //William Santana - SIG 325312
  bDepNaoCad := False; // Felipe A. Santos SOL: 208475 KINTANA: 2016859

  //Taffarel - SIG83035 - início
  if qryPF.State = dsBrowse then
     qryPF.Edit;

  if (qryPF.State in [DsInsert, dsEdit]) then
  if(dblkpcmbNaturalidade.Text <> '') then
    begin
         //qryPF.FieldByName('CODESTADO').AsString := qryEstadoCODESTADO.AsString;  // Andre Imakawa - WO1156
      qryPF.FieldByName('CODESTADO').AsString := dblkpcmbNaturalidade.Text;         // Andre Imakawa - WO1156
    end
  else
    begin
         qryPF.FieldByName('CODESTADO').AsString := '';
    end;
  //Taffarel - SIG83035 - fim

  FormataEdit(edPaiDetalhe);//Darivaldo Alencar SIG 27871

  //Darivaldo Alencar SIG25312 -inicio
    Chkregreplan.OnClick := nil;
    Chkreb.OnClick := nil;
    Chknovoplano.OnClick := nil;
    try
     Chkregreplan.Checked := false;
     Chkreb.Checked       := false;
     Chknovoplano.Checked := false;
    finally
     Chkregreplan.OnClick := ChkregreplanClick;
     Chkreb.OnClick := ChkrebClick;
     Chknovoplano.OnClick := ChknovoplanoClick;
    end;
 //Darivaldo Alencar SIG25312 -fim
end;

procedure TfrmCadDepenBenef.sbtnInsDetClick(Sender: TObject);
begin
  Panel6.Visible := false; //HIGOR 184394
  { Para se cadastrar um telefone é necessario cadastrar um endereço antes }
  //Fanuel Junior SOL 157829 Kintana 1271296
  //If (pgCtrlDetalhe.ActivePage = tbsTelefone) And ( qryEnderecoIDENDERECO.AsFloat = 0) Then Begin

  //Darivaldo Alencar SIG25312 -inicio
  //  If (pgCtrlDetalhe.ActivePage = tbsTelefone) And ( qryEndPess.FieldByName('IDENDERECO').AsFloat = 0) Then Begin
  //     MsgDlg('Para cadastrar um telefone é necessário antes cadastrar um endereço. ',
  //            'Erro',mtError,[mbOk,mbHelp],0);
  //     sbtnInsDet.Down := False;
  //     Exit;
  //  end;
  //Darivaldo Alencar SIG25312 -fim

  If (pgCtrlDetalhe.ActivePage = tbsTelefone) then begin
     ToolbarButtonAlteraContato.Enabled := false;
     ToolbarButtonInsereContato.Enabled := false;
     ToolbarButtonExcluiContato.Enabled := false;
     dbgTelefoneRamal.Visible := true;
     GroupBox7.Height := 168;
     Panel4.Visible           := false;
     //qryContatoTel.Close();           //edilaine - SIG25312

     //edilaine - SIG25312 - inicio
     chkAssociaEnd.checked := not qryEndPess.isEmpty;
     chkAssociaEnd.enabled := not qryEndPess.isEmpty;
     //edilaine - SIG25312 - fim
  end;

  // TADEU PASSOS SOL 190718 KTN 1804738
  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
   HabilitaCamposEndereco(True);
  end;
  // TADEU PASSOS SOL 190718 KTN 1804738

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin

     {qryAux.close;
     qryAux.SQL.clear;
     qryAux.SQL.Add('SELECT * FROM HSTREPRLEGAL WHERE SITATUAL = 1 AND IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString );
     qryAux.open;}

     if VerificaReprLegal { not(qryAux.IsEmpty)} then
     begin
       MsgDlg('Já existe um Representante Legal em vigência','Erro',mtError,[mbOk],0);
       sbtnInsDet.Down := false;
       Abort;
     end;

     pnlGrdReprLegal.visible := false ;
     pnlReprLegal.visible := true ;

  end;
  //Término - William Santana SOL 161550 KIN 1717512


  if bGridPadrao then AtivaGrid(dbgrdOutrasInforms); //Darivaldo Alencar - SIG27871

  inherited;

  MostraEscondeGridOutrasInformacoes; //Darivaldo Alencar SIG 27871

  //Vinicius Maciel SOL 161469 KTN 1372818
 { if OpDetalhe = 'E'
  then begin
     MsgDlg('As operações de exclusão devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
     Abort;
  end;
  OpDetalhe := 'I';  }
  //Vinicius Maciel SOL 161469 KTN 1372818 - FIM
  bInseriuRecebProprio := False;

  //Fanuel Junior SOL151399 Kintana1107837 - Inicio
  If (pgctrlDetalhe.ActivePage = tbsDet) then begin
        marcarFlagPlanoAtivo;
        // Rodrigo de Brito Figueredo SOL 172704 Kintana 1567834 - Inicio
        sNome:='-odnarez-var-EMON-abc159-';
        EmitiuMsgNovoPlano := True;
        // Rodrigo de Brito Figueredo SOL 172704 Kintana 1567834 - Fim
        dbedtDDIDepen.text := ''; // Michelle Mota - SIG25312
  end;
  //Fanuel Junior SOL151399 Kintana1107837 - Fim
  //bbtnConfirmar.enabled := false; //HIGOR 184394 //Darivaldo Alencar SIG25312

  // TADEU PASSOS SOL 190718 KTN 1804738
  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
    //Luiz Carlos - SIG70416 - Inicio
    qryCidade.Filter := '';
    qryCidade.Filtered := False;
    //Luiz Carlos - SIG70416 - Fim
   HabilitaCamposEndereco(False);
  end;
  // TADEU PASSOS SOL 190718 KTN 1804738

  //Felipe A. Santos SOL 208093 KTN 2016011 - Início
  //após homologação do SOL 161550 essa validação deverá ser movida para aba reprentante legal (botao OK geral) ***
  if (pgctrlDetalhe.ActivePage = tbsBeneficiario) then
  begin
    //wo20730 - Leandro - inicio
    if qry.FieldByName('IDPLANOPREV').AsInteger = 2 then
      grpTipoOpIR.enabled := false
    else
      grpTipoOpIR.enabled := true;

    //wo20730 - Leandro - fim


    //Início - William Santana - SOL 161550 KIN 1717512
    {
    bDependenteMaior := DependenteMaiorIdade;

    // não deixa incluir o benefício se o dependente não for maior de idade ou não for emancipado

    if not(bDependenteMaior) then
       MsgDlg('Beneficiário menor de idade indique um responsável!','Erro', mtError, [mbOk], 0);
    } //Término - William Santana - SOL 161550 KIN 1717512
  end;
  // Felipe A. Santos SOL 208093 KTN 2016011 - fim

  //bbtnConfirmar.enabled := false; //HIGOR 184394//Darivaldo Alencar SIG25312

  //dbeNome.Enabled := False; // Flávio Souza SOL: 208475 KINTANA: 2016859.//Darivaldo Alencar SIG25312

  //Marcio Sanches Spinosa SOL 239264 PPM 515106 - Inicio
  //Marcio Sanches Spinosa SOL 239210 PPM 513833 - Inicio
//  if not (pgctrlDetalhe.ActivePage = tbsDet01)
//  or not (pgctrlDetalhe.ActivePage = tbsDet02) then
  if not (pgctrlDetalhe.ActivePage = tbsDet) then
  //Marcio Sanches Spinosa SOL 239264 PPM 515106 - Fim
  begin
      if (qryDet.recordcount > 0)
      and (qryDet.FieldByName('IDPESSOA').AsInteger > 0) then
      begin
        if not (qryPF.isempty) then
        begin
          qryPF.Filtered := False;
          qryPF.Filter := 'IDPESSOA = ' + qryDet.FieldByName('IDPESSOA').asstring;
          qryPF.Filtered := True;
        end;
      end;
  end;
  //Marcio Sanches Spinosa SOL 239210 PPM 513833 - Fim

  //William Moreira da Silva - SOL 270369 PPM 1333987
  qryCidade.locate('IDCIDADES',IntToStr(qryEndPess.FieldByName('IDCIDADES').AsInteger),[]);
  dbeEstado.Text := '';
  dbePais.Text := '';
  //William Moreira da Silva - SOL 270369 PPM 1333987

  //William Moreira da Silva - SOL 246736 PPM 1051823
  if Pos('ORDER BY',qryDependencia.sql.gettext) = 0 then
  begin
       qryDependencia.sql.Add(' ORDER BY DESCRICAO ');//higor Nayde SOL209767
  end;
  //William Moreira da Silva - SOL 246736 PPM 1051823

  qryDependencia.open;//higor Nayde SOL209767
end;

//Fanuel Junior SOL151399 Kintana1107837
procedure TfrmCadDepenBenef.marcarFlagPlanoAtivo();
begin
//     Darivaldo Alencar SIG25312 -inicio
//     Chkregreplan.Checked := (VerifPlanoTitular(qryaux,'2', qryDet.fieldByname('IDPESSOA').asstring)) and (qryDet.fieldByname('IDPESSOA').asstring <> '');       //REG / REPLAN
//     Chkreb.Checked       := (VerifPlanoTitular(qryaux,'66', qryDet.fieldByname('IDPESSOA').asstring)) and (qryDet.fieldByname('IDPESSOA').asstring <> '') ;
//     Chknovoplano.Checked := (VerifPlanoTitular(qryaux,'74', qryDet.fieldByname('IDPESSOA').asstring)) and (qryDet.fieldByname('IDPESSOA').asstring <> '') ;
     try
       Chkregreplan.onclick:= nil;
       Chkreb.onclick      := nil;
       Chknovoplano.onclick:= nil;

       Chkregreplan.Checked := qryDet.fieldByname('DEP_PLANO2').AsInteger  = 1;
       Chkreb.Checked       := qryDet.fieldByname('DEP_PLANO66').AsInteger = 1;
       Chknovoplano.Checked := qryDet.fieldByname('DEP_PLANO74').AsInteger = 1;

     finally
        Chkregreplan.OnClick := ChkregreplanClick;
        Chkreb.OnClick       := ChkrebClick;
        Chknovoplano.OnClick := ChknovoplanoClick;
     end;

     //William Moreira da Silva - SIG 25312
     if (qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '2', sIdPessJur]),  [])) then
        dtCancRegReplan.text := qryPlano.FieldByName('DATACANCEL').AsString
     else
        dtCancRegReplan.text := '';

     if (qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '66', sIdPessJur]),  [])) then
        dtCancREB.Text       := qryPlano.FieldByName('DATACANCEL').AsString
     else
         dtCancREB.Text      := '';

     if (qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '74', sIdPessJur]),  [])) then
        dtCancNovoPlano.Text := qryPlano.FieldByName('DATACANCEL').AsString
     else
        dtCancNovoPlano.Text := '';

     Chkregreplan.Enabled    := (VerifPlanoTitular(qryaux,'2',  qryDet.fieldByname('IDPESSOA').asstring )) and (dtCancRegReplan.Date = 0);
     Chkreb.Enabled          := (VerifPlanoTitular(qryaux,'66', qryDet.fieldByname('IDPESSOA').asstring )) and (dtCancREB.Date = 0);
     Chknovoplano.Enabled    := (VerifPlanoTitular(qryaux,'74', qryDet.fieldByname('IDPESSOA').asstring )) and (dtCancNovoPlano.Date = 0);
     //William Moreira da Silva - SIG 25312

     //Darivaldo Alencar SIG25312 -fim
end;


procedure TfrmCadDepenBenef.sbtnAltDetClick(Sender: TObject);
  var
  qryPar: TwwQuery;
begin
   //Darivaldo Alencar SIG25312 -inicio
   if (pgctrlDetalhe.ActivePage <> tbsReprLegal) then
     begin
       CarregaDadosRepresentanteLegal;
       if not(qryReprLegal.IsEmpty)then
         begin
           if (rgSituacaoAtual.itemIndex = 0) then
              MsgDlg(MSG030,'Atenção',mtInformation,[mbOk],0);

           if (rgSituacaoAtual.ItemIndex = 1) then
              MsgDlg(MSG031,'Atenção',mtInformation,[mbOk],0);
         end;
     end;

   If (pgctrlDetalhe.ActivePage = tbsDet) then
       marcarFlagPlanoAtivo
   else
   if((pgctrlDetalhe.ActivePage = tbsEndereco)or
      (pgctrlDetalhe.ActivePage = tbsTelefone)or
      (pgctrlDetalhe.ActivePage = tbsContaBanco)or
      (pgctrlDetalhe.ActivePage = tbsDepBen)or
      (pgctrlDetalhe.ActivePage = tbsOutrasInformacoes)or
      (pgctrlDetalhe.ActivePage = tbsReprLegal))
   then begin
      if (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0) then
        begin
          MsgDlg(MSG034,'Atenção',mtInformation,[mbOk],0);
          exit;
        end;
   end;
   //Darivaldo Alencar SIG25312 -fim

   Panel6.Visible := false; //HIGOR 184394
   bbtnConfirmar.tag := 0; //William Moreira da Silva SOL 165677 KINTANA 1568409
  dtDataFimMolestiaAlterar     :=  CMDateTimePicker5.Date;
  dtDatainicioMolestiaAlterar   :=  dbdtMolestiaGrave.Date;
  sDatainicioMolestiaAlterar  := FormatDateTime('dd/mm/yyyy',dbdtMolestiaGrave.Date );   //Data Inicial
  sDataFimMolestiaAlterar    := FormatDateTime('dd/mm/yyyy',CMDateTimePicker5.Date );   //Data Final

  //ERALDO LUIS DA SILVA SOL 155774 KINTANA 1214023
  //   Cria query virtual para ler o parâmetro da regra travando alteracoes de beneficiarios cancelados
   pIdBenef := qryDet.FieldByName('IDPESSOA').asinteger;//Marcio Sanches Spinosa SOL 205681 Kintana 1992276
   qryPar := TwwQuery.Create(Self);
   try
      qryPar.DatabaseName := 'BASEDADOS';
  // Escreve a query e dá o open
      qryPar.SQL.Clear;
      qryPar.SQL.Add('select 1 from DEPENTIT');
      qryPar.SQL.Add('where IDPESSOA =' + Inttostr(pIdBenef));//Marcio Sanches Spinosa SOL 205681 Kintana 1992276  //qryDet.FieldByName('IDPESSOA').AsString));
	    qryPar.SQL.Add('and IDTITULAR ='+ qry.FieldByName('IDPESSOA').AsString); // Higor Nayde Ferreira  SOL 194883 KTN 1863270
      qryPar.SQL.Add('and DATACANCELA IS NOT NULL');
      qryPar.Open;

      if qryPar.RecordCount > 0 then
      begin
        //Darivaldo Alencar SIG 25312 -inicio
        qryPF.Filtered := False;
        qryPF.Filter := 'IDPESSOA = ' + qryDet.FieldByName('IDPESSOA').asstring;
        qryPF.Filtered := True;
        habilitaAlteracaoDepCancelado(True,2);
        //Darivaldo Alencar SIG25312 --fim
        if verificaAlteracaoDepCancelado(1) then //William Santana - SIG25312
        //Darivaldo Alencar SIG 25312 -inicio
            habilitaAlteracaoDepCancelado(True)
        else begin
          //MsgDlg('Dependente cancelado! Para alterar as informações é necessário desfazer o evento de cancelamento.','Mensagem do Sistema ',
          //           mtConfirmation,[mbOk],0);
          if not(pgctrlDetalhe.ActivePage = tbsBeneficiario)then
            begin
              if (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0)then
                begin
                  MsgDlg(MSG033,'Atenção',mtInformation,[mbOk],0);
                  //Darivaldo Alencar SIG 25312 -fim
                  bbtnCancelarDet.click;
                  Exit;
                end;
            end;
        end;
      end;
   finally
    FreeAndNil(  qryPar );
   end;
  //ERALDO LUIS DA SILVA SOL 155774 KINTANA 1214023

 Chkregreplan.OnClick := nil;
 Chkreb.OnClick       := nil;
 Chknovoplano.OnClick := nil;

 // Vinicius Ferreira SOL 174944 KINTANA 1585501 - Inicio
 {
 // Vinicius Ferreira SOL 155779 KINTANA 1220658 - Inicio
 if (qryDet.FieldByName('IDGRINSTR').AsInteger = 8) And (qryDet.FieldByName('FLGDEPLEGAL').AsInteger = 0) And (qryDet.FieldByName('FLGDESIGNADO').AsInteger = 0) And (qryDet.FieldByName('SITUACAODEPEN').AsString = 'NORMAL') and ((Trim(qryDet.FieldByName('TIPODEPENDENCIA').AsString) ='FILHO/EQUIPARAD') or (Trim(qryDet.FieldByName('TIPODEPENDENCIA').AsString) ='ENTEADO(A)') or (Trim(qryDet.FieldByName('TIPODEPENDENCIA').AsString) ='IRMÃO'))
 and FazQuery(QryAux,'SELECT * FROM DEPENDENTE WHERE IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString+' AND IDSITDEPENDENTE = 1')
 then begin
   FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(qryDet.FieldByName('DATANASC').AsString)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
   if (QryAux.FieldByname('IDADE').asFloat < 24.00) and (QryAux.FieldByname('IDADE').asFloat > 24.99) then begin
     MsgDlg('O dependente não pode ser alterado. Favor verificar as regras de alteração.','Aviso',mtInformation,[mbOk,mbHelp],0);
     Abort;
   end;
 end
 else begin
     MsgDlg('O dependente não pode ser alterado. Favor verificar as regras de alteração.','Aviso',mtInformation,[mbOk,mbHelp],0);
     Abort;
 end;
 // Vinicius Ferreira SOL 155779 KINTANA 1220658 - Fim
 }
 // Vinicius Ferreira SOL 174944 KINTANA 1585501 - Fim

 try
   //Darivaldo Alencar SIG25312 -inicio
   //qryplano.Close;
   //qryplano.ParamByName('IDPESSOA').AsString := qryDet.fieldByname('IDPESSOA').asstring;
   //qryplano.Open;

    //Chkregreplan.Checked := qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '2',  sIdPessJur]),  []);
    //Chkreb.Checked       := qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '66', sIdPessJur]),  []);
    //Chknovoplano.Checked := qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '74', sIdPessJur]),  []);
    //Darivaldo Alencar SIG25312 -fim
 finally
    Chkregreplan.OnClick := ChkregreplanClick;
    Chkreb.OnClick       := ChkrebClick;
    Chknovoplano.OnClick := ChknovoplanoClick;

  if (pgctrlDetalhe.ActivePage = tbsContato) then
    begin
       //edilaine - SIG25312 - inicio
       //qryRamal.Close;
       //qryRamal.ParamByName('IdPessoa').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
       //qryRamal.ParamByName('IdContato').AsInteger := qryContato.FieldByName('IdContato').AsInteger;
       //qryRamal.Open;
       //edilaine - SIG25312 - fim
    end;

  If qryCBanco.Active = True Then Begin
    qryAgencia.Close;
    qryAgencia.ParamByName('pIdBanco').AsString :=
      qryCBanco.FieldbyName('IDBANCO').AsString;
    qryAgencia.Open;
  End;

  //Início - William Santana - SOL 161557 KIN 171752
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
   PreencheCamposRepresentante();

   if (tmpckrDATAtermino.date > 0 ) and (tmpckrDATAinicio.date > 0) then
   begin
    if ((StrToDate(tmpckrDATATERMINO.text) < StrToDate(tmpckrDATAINICIO.text)) or (StrToDate(tmpckrDATATERMINO.text) < date())) and
       (rgSituacaoAtual.itemindex = 0) then
    begin
      MsgDlg('A data limite da Tutela/Curatela está vencida e a situação atual será alterada para Vencida.','Alerta',mtWarning ,[mbOk],0);
       rgSituacaoAtual.itemindex := 1;
    end;
   end;

    pnlGrdReprLegal.visible := false ;
    pnlReprLegal.visible := true ;
  end;
 //Término - William Santana - SOL 161557 KIN 171752

  //Marcio Sanches Spinosa SOL 239210 PPM 513833 - Inicio
  qryPF.Filtered := False;
  qryPF.Filter := 'IDPESSOA = ' + qryDet.FieldByName('IDPESSOA').asstring;
  qryPF.Filtered := True;
  //Marcio Sanches Spinosa SOL 239210 PPM 513833 - Fim
 If qryDepBenPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger  = 0 Then
    begin
      rgrpDtMolGraveDepen.Visible := False;
      dtMolGraveDepen.Text      := '';
    end
    else
      rgrpDtMolGraveDepen.Visible := True;
    //Vinicius Maciel SOL 161469 KTN 1372818
    { if OpDetalhe = 'E'
    then begin
       MsgDlg('As operações de exclusão devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
       Abort;
    end;  }
    //Vinicius Maciel SOL 161469 KTN 1372818 -FIM
    if wwDBCBIsentoIrrf.ItemIndex = 2 then
    begin
      //qryDepBenPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger
      //dbrgrpMolestiaGrave.Enabled := True; //Taffarel - SIG68507/71228
      //dbdtMolestiaGrave.Enabled := True; //Taffarel - SIG68507/71228
      //CMDateTimePicker5.Enabled := True; //Taffarel - SIG68507/71228
    end;

  if bGridPadrao then  AtivaGrid(dbgrdOutrasInforms); //Darivaldo Alencar - SIG27871

  inherited;

  MostraEscondeGridOutrasInformacoes; //Darivaldo Alencar SIG 27871

  If qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger  = 0 Then
   begin
     dbrgrpMolestiaGrave.Visible    := False;
     //dbrgrpMolestiaGraveFim.Visible := False;
     //dbdtMolestiaGrave.Text      := ''; //Taffarel - SIG68597/71228
   end
  else
   begin
     dbrgrpMolestiaGrave.Visible    := True;
     BitBtnHistorico.Enabled        := True;
     dbrgrpMolestiaGrave.Visible    := True;
     //dbrgrpMolestiaGraveFim.Visible := True;
   end;

   //William Moreira da Silva - SIG 25312 - Inicio
   if qryPF.FieldByName('POSSUIDEP').AsString  = 'S' then
      rbSimDepen.Checked := true
   else
      rbNaoDepen.Checked := true;
   //William Moreira da Silva - SIG 25312 - Fim

  If qryDepBenPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger  = 0 Then
   begin
     rgrpDtMolGraveDepen.Visible := False;
     dtMolGraveDepen.Text      := '';
   end
  else
     rgrpDtMolGraveDepen.Visible := True;
 //Vinicius Maciel SOL 161469 KTN 1372818
 { if OpDetalhe = 'E'
  then begin
     MsgDlg('As operações de exclusão devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
     Abort;
  end;  }
  //Vinicius Maciel SOL 161469 KTN 1372818 -FIM

  OpDetalhe := 'A';

  if (pgctrlDetalhe.ActivePage = tbsTelefone) then begin
    //edilaine - SIG25312 - inicio
    {qryContatoTel.Close;
    qryContatoTel.Prepare;
    qryContatoTel.ParamByName('IdTelefone').AsFloat  := qryTelefone.FieldByName('IdTelefone').AsFloat;
    qryContatoTel.ParamByName('IdPessoa').AsFloat    := qryDet.FieldByName('IDPESSOA').AsFloat;
    qryContatoTel.Open;
    qryContatoTel.Last;
    qryContatoTel.First;
    }//edilaine - SIG25312 - fim

    //edilaine - SIG25312 - inicio
    chkAssociaEnd.checked := (not qryEndPess.isEmpty) and (qryTelefone.FieldByName('IdEndereco').AsString <> '');
    chkAssociaEnd.enabled := not qryEndPess.isEmpty;
    //edilaine - SIG25312 - fim

    if (qryContato.recordcount > 0 ) then begin     //edilaine - SIG25312
       ToolbarButtonAlteraContato.Down := false;
       ToolbarButtonInsereContato.Down := false;
       ToolbarButtonAlteraContato.Enabled := true;
       ToolbarButtonInsereContato.Enabled := true;
       ToolbarButtonExcluiContato.Enabled := true;
    end
    else begin
       ToolbarButtonAlteraContato.Down := false;
       ToolbarButtonInsereContato.Down := false;
       ToolbarButtonAlteraContato.Enabled := false;
       ToolbarButtonInsereContato.Enabled := true;
       ToolbarButtonExcluiContato.Enabled := false;
       //qryTelefone.ApplyUpdates;                   //edilaine - SIG25312
       qryTelefone.Edit;  //Fanuel Junior SOL 154946 Kintana 1192921
    end;

 end;

 end;
 //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 Inicio
 if pgctrlDetalhe.ActivePage = tbsDet then
 begin
   PreencheCompCamp;
   EmitiuMsgNovoPlano := True;
 end;
 //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 Fim
 //bbtnConfirmar.enabled := false; //HIGOR 184394  //Darivaldo Alencar SIG25312

 // TADEU PASSOS SOL 190718 KTN 1804738
 if pgctrlDetalhe.ActivePage = tbsEndereco then
 begin
   HabilitaCamposEndereco(False);
 end;
 // TADEU PASSOS SOL 190718 KTN 1804738

  //Marcio Sanches Spinosa SOL 239266 PPM 515130 - Inicio
   //qryPF.Filtered := False;
   if (qryPF.State = dsBrowse) then
     qryPF.Edit;
  //Marcio Sanches Spinosa SOL 239266 PPM 515130 - Fim

  if Pos('ORDER BY',qryDependencia.sql.gettext) = 0 then
  begin
       qryDependencia.sql.Add(' OR (IDDEPENDENCIA ='+ QuotedStr(qryDet.FieldByName('IDDEPENDENCIA').AsString)+')');//higor Nayde SOL209767
       qryDependencia.sql.Add(' ORDER BY DESCRICAO ');//higor Nayde SOL209767
  end;
  // Andre Imakawa - SIG 50670 - Inicio
  // Removido desse ponto e inserido no final desta funcionalidade
  {
  //William Moreira da Silva - SOL 270369 PPM 1333987
  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
       qryCidade.locate('IDCIDADES',IntToStr(qryEndPess.FieldByName('IDCIDADES').AsInteger),[]);
  end;
  //William Moreira da Silva - SOL 270369 PPM 1333987
  }
  // Andre Imakawa - SIG 50670 - Fim

  //William Moreira da Silva - SOL 270959 PPM 1342331
  dblkpcmbNaturalidade.Text := qryPF.FieldByName('CODESTADO').AsString;
  qryEstado.locate('CODESTADO',qryPF.FieldByName('CODESTADO').AsString,[]);
  //William Moreira da Silva - SOL 270959 PPM 1342331

 qryDependencia.open;//higor Nayde SOL209767
 if pgctrlDetalhe.ActivePage = tbsDepBen then //Luiz Carlos - SIG70416
    dblkpcmbNacionalidadeChange(Sender); // Michelle Mota - SIG 20771

 // Andre Imakawa - SIG 50670 - Inicio
 //William Moreira da Silva - SOL 270369 PPM 1333987
  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
       qryCidade.locate('IDCIDADES',IntToStr(qryEndPess.FieldByName('IDCIDADES').AsInteger),[]);
  end;
  //William Moreira da Silva - SOL 270369 PPM 1333987
  // Andre Imakawa - SIG 50670 - Fim

  //wo20730 - Leandro - inicio
  if (pgctrlDetalhe.ActivePage = tbsBeneficiario) then
  begin
    if qry.FieldByName('IDPLANOPREV').AsInteger = 2 then
      grpTipoOpIR.enabled := false
    else
      grpTipoOpIR.enabled := true;
  END;
  //wo20730 - Leandro - fim


end;

procedure TfrmCadDepenBenef.sbtnExcluiDetClick(Sender: TObject);
Var
 SQLDel, idPessoaAux : String;
begin
  // Darivaldo Alencar - SIG 25312 -inicio
  if (pgctrlDetalhe.ActivePage <> tbsDocumentos)then
    begin
     if MsgDlg(MSG027,'Atenção', mtConfirmation, [mbYes, mbNo],0) = mrNo then
        Exit;
    end;
  //Darivaldo Alencar - SIG 25312 -fim

  OpDetalhe := 'E'; // SOL 182784 KINTANA 1705269

  {Início - Michelle Mota/William Santana - SIG25312}
  if (qryPF.FieldbyName('IDTELEFONE').AsString <> '') then
  begin
    if qryTelefone.Locate('IDPESSOA;IDTELEFONE', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, qryPF.FieldByName('IDTELEFONE').AsString]), []) then
    begin
      if qryRamal.Locate('IDPESSOA;IDTELEFONE', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, qryPF.FieldByName('IDTELEFONE').AsString]), []) then
      begin
        {desvincula contato x telefone}
        qryRamal.first;
        while not qryRamal.eof do
        begin
          if (qryRamal.fieldByname('IDPESSOA').asstring   = qryDet.fieldByname('IDPESSOA').AsString) and
             (qryRamal.fieldByname('IDTELEFONE').asstring = qryPF.FieldByName('IDTELEFONE').AsString) then
             qryRamal.delete
          else
             qryRamal.next;
        end;
      end;
      qryTelefone.delete
    end;
  end;
  {Término - Michelle Mota - SIG25312}


  //edilaine - SIG25312 - inicio
  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
    {desvincula endereço x telefone}
    qryTelefone.first;
    while not qryTelefone.eof do
    begin
      if (qryTelefone.fieldByname('IDPESSOA').asstring   = qryDet.fieldByname('IDPESSOA').asstring) and
         (qryTelefone.fieldByname('IDENDERECO').asstring = qryEndPess.FieldByName('IDENDERECO').AsString) then
      begin
        qryTelefone.edit;
        qryTelefone.FieldByName('IDENDERECO').AsString := '';
        qryTelefone.post;
      end;
      qryTelefone.next;
    end;

    {desvincula endereço x contato}
    qryContato.first;
    while not qryContato.eof do
    begin
      if (qryContato.fieldByname('IDPESSOA').asstring   = qryDet.fieldByname('IDPESSOA').asstring) and
         (qryContato.fieldByname('IDENDERECO').asstring = qryEndPess.FieldByName('IDENDERECO').AsString) then
      begin
        qryContato.edit;
        qryContato.FieldByName('IDENDERECO').AsString := '';
        qryContato.post;
      end;
      qryContato.next;
    end;

    //desvincula endereço do tipo de endereço
    qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryEndPess.FieldByName('IDPESSOA').AsInteger);
    qryPessoa.Filtered := True;
    qryPessoa.edit;

    if (qryPessoa.FieldByName('IDENDCOMERCIAL').AsFloat = qryEnderecoIdEndereco.AsFloat) then
       qryPessoa.FieldByName('IDENDCOMERCIAL').AsString   := '';
    if (qryPessoa.FieldByName('IDENDRESIDENCIAL').AsFloat = qryEnderecoIdEndereco.AsFloat) then
       qryPessoa.FieldByName('IDENDRESIDENCIAL').AsString := '';
    if (qryPessoa.FieldByName('IDENDENTREGA').AsFloat = qryEnderecoIdEndereco.AsFloat) then
       qryPessoa.FieldByName('IDENDENTREGA').AsString     := '';
    if (qryPessoa.FieldByName('IDENDCOBRANCA').AsFloat = qryEnderecoIdEndereco.AsFloat) then
       qryPessoa.FieldByName('IDENDCOBRANCA').AsString    := '';
    if (qryPessoa.FieldByName('IDENDCORRESP').AsFloat = qryEnderecoIdEndereco.AsFloat) then
       qryPessoa.FieldByName('IDENDCORRESP').AsString     := '';

  end
  else if pgctrlDetalhe.ActivePage = tbsContato then
  begin
    {verifica vinculo telefone x contato}
    qryRamal.first;
    if qryRamal.Locate('IDPESSOA;IDCONTATO', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring,qryContato.FieldByName('IDCONTATO').AsString]), []) then
    begin
      MsgDlg('Contato associado a um telefone. Verifique. ','Information', mtInformation,[mbOk],0);
      Abort;
    end;
  end
  else if pgctrlDetalhe.ActivePage = tbsTelefone then
  begin
    {desvincula contato x telefone}
    qryRamal.first;
    while not qryRamal.eof do
    begin
      if (qryRamal.fieldByname('IDPESSOA').asstring   = qryDet.fieldByname('IDPESSOA').asstring) and
         (qryRamal.fieldByname('IDTELEFONE').asstring = qryTelefone.FieldByName('IDTELEFONE').AsString) then
         qryRamal.delete
      else
         qryRamal.next;
    end;
  end;
  //edilaine - SIG25312 - fim


  //William Moreira da Silva - SOL 208197 KTN 2015441
  //Darivaldo Alencar SIG 27871 -inicio
  //     While Not qryDepen.Eof Do
  //          if qryDepen.Fieldbyname('IDPESSOA').AsString = qryDet.FieldbyName('IDPESSOA').AsString then
  //          begin
  //             idPessoaAux := qryDet.FieldbyName('IDPESSOA').AsString;
  //             SQLDel := ' ';
  //             SQLDel := 'DELETE FROM DEPENDENTE '+
  //                       ' WHERE IDPESSOA = ' + idPessoaAux;
  //             //MsgDlg('Teste','Informação',mtInformation,[mbOk,mbHelp],0);
  //             qryaux.sql.clear;
  //             qryaux.sql.add(SqlDel);
  //             try
  //                qryaux.open
  //             except
  //             end;
  //                qryDepen.Next;
  //          end
  //          else
  //          begin
  //            qryDepen.Next;
  //          end;
  ExcluiDependenteDuplicado; //Darivaldo Alencar SIG 27871 -fim
  //William Moreira da Silva - SOL 208197 KTN 2015441

  //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Inicio
  if pgctrlDetalhe.ActivePage = tbsDet then
     begin
       if ValidaPlano(sIDpessoa) then
          begin
            MsgDlg('Houve alteração nos dependentes. É necessário revisar o benefício do NOVO PLANO.','Informação',mtInformation,[mbOk,mbHelp],0);
            EmitiuMsgNovoPlano := False;
          end;
     end;
   //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim


   AtivaGrid(dbgrdOutrasInforms); //Darivaldo Alencar - SIG27871
   inherited;
  //Vinicius Maciel SOL 161469 KTN 1372818
  {if (OpDetalhe <> 'E') and (qryDet.State in [dsInsert, dsEdit])
  then begin
     MsgDlg('As operações de inclusão/alteração devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
     Abort;
  end;  }
  //Vinicius Maciel SOL 161469 KTN 1372818 - FIM
  //OpDetalhe := 'E'; SOL 182784 KINTANA 1705269 alterado o lacal para antes da herança.
end;

procedure TfrmCadDepenBenef.qryEndPessBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryEndPess.FieldByname('IDPAIS').AsInteger    := qryCidade.FieldByName('IDPAIS').AsInteger;
  qryEndPess.FieldByname('NOMECIDADE').AsString := cmbCidade.Text;


  if qryEndPess.State in [dsInsert,dsEdit] then
  begin
     if qryEndPess.State in [dsInsert]
       then qryEndPess.FieldByName('IdENDERECO').AsInteger := LeultRegistro(nil,'ENDPESS');

   qryEndPess.FieldByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;

    With qryPessoa do
    begin
     Filter := 'IDPESSOA = ' + IntToStr(qryEndPess.FieldByName('IDPESSOA').AsInteger);
     Filtered := True ;
     Edit;

     if chkbxComercial.Checked then
        FieldByName('IDENDCOMERCIAL').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger
     Else
        if FieldByName('IDENDCOMERCIAL').AsInteger = qryEndPess.FieldByName('IdENDERECO').AsInteger then // Alterado por FHBS - 13/08/2019 - SIG90164
        FieldByName('IDENDCOMERCIAL').Clear;

     if chkbxResidencial.Checked then
        FieldByName('IDENDRESIDENCIAL').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger
     else
     if FieldByName('IDENDRESIDENCIAL').AsInteger = qryEndPess.FieldByName('IdENDERECO').AsInteger then // Alterado por FHBS - 13/08/2019 - SIG90164
        FieldByName('IDENDRESIDENCIAL').Clear;

     if chkbxEntrega.Checked then
        FieldByName('IDENDENTREGA').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger
     else
     if FieldByName('IDENDENTREGA').AsInteger = qryEndPess.FieldByName('IdENDERECO').AsInteger then // Alterado por FHBS - 13/08/2019 - SIG90164
        FieldByName('IDENDENTREGA').Clear;

     if chkbxCobranca.Checked then
        FieldByName('IDENDCOBRANCA').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger
     else
     if FieldByName('IDENDCOBRANCA').AsInteger = qryEndPess.FieldByName('IdENDERECO').AsInteger then // Alterado por FHBS - 13/08/2019 - SIG90164
        FieldByName('IDENDCOBRANCA').Clear;

     if chkbxCorrespondencia.Checked then
        FieldByName('IDENDCORRESP').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger
     else
     if FieldByName('IDENDCORRESP').AsInteger = qryEndPess.FieldByName('IdENDERECO').AsInteger then // Alterado por FHBS - 13/08/2019 - SIG90164
        FieldByName('IDENDCORRESP').Clear;


     Post;
    end;
  end;

end;

procedure TfrmCadDepenBenef.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if not qryDet.Active then
     Exit;

  edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;

  //Filtra os endereços do dependente selecionado, a query de endereços traz todos os
  //dependentes.
  //Na hora de gravar tirar o filtro.
  //Fanuel Junior SOL 157829 Kintana 1271296
  //qryEndPess.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  //qryEndPess.Filtered := True ;

  qryCBanco.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryCBanco.Filtered := True;

  sFiltroBenef := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;

  //Início - William Santana SOL 161550 KIN 1717512
  qryReprLegal.Filter   := ' IDPESSOA = '+ IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger) +
                           ' AND IDTITULAR = '+ IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger) ;
  qryReprLegal.Filtered := True;

  qryLogReprLegal.Filter   := ' IDPESSOA = '+ IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger) +
                              ' AND IDTITULAR = '+ IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger) ;
  qryLogReprLegal.Filtered := True;
  //Término - William Santana SOL 161550 KIN 1717512

  qryDepBen.Filter         := 'IDTITULAR = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryDepBen.Filtered       := True;


// Abre Tabela de Nucleo Familiar, Buscando pelo Titular.
  QryNucleoFam.Close;
  if not QryNucleoFam.Prepared then QryNucleoFam.prepare;
  QryNucleoFam.ParamByName('IDTITULAR').AsInteger := Qry.FieldByName('IDPESSOA').AsInteger;
  QryNucleoFam.Open;

  If pgctrlDetalhe.ActivePage = tbsDocumentos Then
  begin
    If edDocNumDocumento.CanFocus Then edDocNumDocumento.SetFocus;
    EdDependenteDocumento.Text := qryDet.FieldByName('NOME').AsString;

    //Everson Cunha - SIG79893 - Início
    //edilaine SIG25312 - inicio
    //if CmeCadastro.Operacao in [opInserir,opAlterar] then
    //begin
    //  if (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0) then
    //  begin
    //    MsgDlg(MSG034,'Atenção',mtInformation,[mbOk],0);
    //  end;
    //  PnlDocumentos_Padrao.enabled := not (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0);
    //end;
    //edilaine SIG25312 - fim
    //Everson Cunha - SIG79893 - Fim
  end;

  If (pgctrlDetalhe.ActivePage = tbsTelefone) then
  begin
    //Fanuel Junior SOL 157829 Kintana 1271296
    edPaiDetalhe.Visible := true;
    //Darivaldo Alencar - SIG25312 -inicio
    //edPaiDetalhe.Text  := qryEndPess.FieldyName('NOME').AsString;
    edPaiDetalhe.Text  := qryDet.FieldByName('NOME').AsString;

    //qryTelefone.Close;
    //qryTelefone.ParamByName('IDPESSOA').AsFloat := qryDet.FieldByName('IDPESSOA').AsFloat;
    //qryTelefone.Open;
    //qryTelefone.Filter := 'IDENDERECO = '''+FloatToStr(qryEndPess.FieldByName('IDENDERECO').AsInteger)+'''';
    //qryRamal.Filter := 'IDTELEFONE = '''+FloatToStr(qryTelefoneIDTELEFONE.AsFloat)+'''';
    //Darivaldo Alencar - SIG25312 -fim


    //Vinicius Maciel SOL 161469 KTN 1372818
    if (not qryTelefone.isEmpty) and (sbtnAlterar.down = true) then
    Begin
       sbtnInsDet.Enabled := true;
       sbtnExcluiDet.Enabled := true;
       sbtnAltDet.Enabled := true;
    End;
   //Vinicius Maciel SOL 161469 KTN 1372818 - FIM
  end
  //edilaine - SIG25312 - inicio
  else if (pgctrlDetalhe.ActivePage = tbsContato) then
  begin
    SetupGridPickList('NUMERO');
  end;
  //edilaine - SIG25312 - fim

  //Darivaldo Alencar SIG27871 -inicio
  //bbtnOpcoes.Enabled:=(pgctrlDetalhe.ActivePage = tbsDet);
  bbtnOpcoes.visible:= (pgctrlDetalhe.ActivePage = tbsDet);
  //Darivaldo Alencar SIG27871 -fim


  If (Not QryBenef.IsEmpty)
    And ((Qry.Active = True) and(Not Qry.fieldbyname('IDPLANOPREV').IsNull)) Then
    iIdPlanoPrevBenef := qrybenef.fieldbyname('IDPLANOPREV').AsInteger
  Else
    iIdPlanoPrevBenef := qry.fieldbyname('IDPLANOPREV').AsInteger;


  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
    // SOL 229238 KTN 2063206
    qryBeneficio.Close;
    qryBeneficio.Prepare;
    //BRUNO AZEVEDO SOL 130836 Kintana 807668
    qryBeneficio.ParamByName('MATRICULA').AsString := qry.FieldByName('MATRICULA').AsString;
    qryBeneficio.ParamByName('IDPLANOPREV').AsString := qry.FieldByName('IDPLANOPREV').AsString; // SOL 228437 KTN 2062198
    qryBeneficio.Open;
    // SOL 229238 KTN 2063206

    bDependenteMaior := False; // Felipe A. Santos SOL 208093 KTN 2016011

    //edilaine - SIG25312 - inicio
    //Everson Cunha - SIG76515 - Início
    //rdbProprio.enabled       := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0);
    //rdbOutro.enabled         := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0);
    //lkpcmbBeneficio.enabled  := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0);
    //dbePrioridade.enabled    := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0);
    //DbLkcBuscaNucleo.enabled := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0);

    rdbProprio.enabled       := true;
    rdbOutro.enabled         := true;
    lkpcmbBeneficio.enabled  := true;
    dbePrioridade.enabled    := true;
    DbLkcBuscaNucleo.enabled := true;
    //Everson Cunha - SIG76515 - Fim

    if (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0) then
       dbePercentual.setfocus;
    //edilaine - SIG25312 - fim
  end;

  //Início - William Santana SOL 161550 KIN 1717512
  if  pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
      //BRUNO AZEVEDO SOL 244852 PPM 626115
      //tbsReprLegal.enabled := true;
      if not(qryReprLegal.state in[dsInsert, dsEdit]) then
      begin
       pnlReprLegal.visible := false ;
       pnlGrdReprLegal.visible := True ;
      end;

      CarregaDadosRepresentanteLegal();
  end;
  //Término - William Santana SOL 161550 KIN 1717512

  //BRUNO AZEVEDO SOL 244852 PPM 626115
  VerificaPermissao();

  HabilitaCRUDDetalhe();   //edilaine - SIG25312 - inicio

  BuscaOBSR;  //Darivaldo Alencar -SIG 27871
end;

procedure TfrmCadDepenBenef.dbeContaCorrenteExit(Sender: TObject);
begin
  inherited;
  If Trim(qryBanco.FieldByName('FLGVALIDACC').AsString) = 'S' Then
  begin
     try
        CalculaDV := TCalcDV.Create;   //Fernando Santana SOL 136478 \ Kintana 820017
        CalculaDV.TipoConta  := rgrpTipoConta.ItemIndex + 1;

        if not CalculaDV.ValidaConta( Trim(qryBanco.FieldByName('NumBanco').AsString),
                                        Trim(qryAgencia.FieldByName('Numagencia').AsString),
                                        Trim(dbeContaCorrente.Text),
                                        True)
        then begin
           dbeContaCorrente.Text := '';
           qryCBanco.fieldbyname('CONTACORRENTE').AsString := '';

        end;
     Finally
        Try
           CalculaDV.Free;  //Fernando Santana SOL 136478 \ Kintana 820017
        Except
        End;
     end;
  end;

end;

procedure TfrmCadDepenBenef.FormCreate(Sender: TObject);
var
  i: Integer; // Michelle Mota - SIG25312
begin
  inherited;
  Panel6.Align := alBottom;  //William Moreira da Silva - SIG 25312
  grpTelDepen.visible:= false;//Darivaldo Alencar SIG25312

  //Darivaldo Alencar SIG25312 -inicio
  if (GroupBox2.visible) then
     grpObserv.top := (GroupBox2.top + GroupBox2.height + 2)
  else grpObserv.top   := GroupBox2.top;
  //Darivaldo Alencar SIG25312 -fim

  DataHoje := Date;
  GroupBox7.Height := 168;

  Pessoa.IdEmpresaPropria := Sistema.IdEmpresa;

  dbgTelefoneRamal.Visible := true;
  GroupBox7.Height := 168;
  Panel4.Visible           := false;

  If qry.Active Then qry.Close;
  qry.Prepare;
  qryEndereco.Prepare;
  qryTelefone.Prepare;
  qryContato.Prepare;
  qrySubTipo.Prepare;
  qryImagem.Prepare;
  qryImagensDoc.Prepare;

  qryGlobal.Open;

  qryParamPessoa.Close; qryParamPessoa.Open;

  //Início - William Santana - 209384/15928 KIN 2062832
  qryEstCivil.close;
  qryEstCivil.open;
  //Término - William Santana - 209384/15928 KIN 2062832

  qryDocumento.Prepare;
  qryRamal.Prepare;
  qryEstado.Open;
  MudaTipo;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(tbcDetalhe);


  dbchkbxFlgContaImpostoR.Enabled := HabilitaCheckDependente(Sistema.IdEmpresa);
  dbchkbxContaSalarioF.Enabled    := dbchkbxFlgContaImpostoR.Enabled;


  qryPais.Open;

  qryOutrasInforms.Prepare;
  qryOcupacao.Prepare;//Darivaldo Alencar SIG 27871
  qryPF2.prepare;//Darivaldo Alencar SIG 27871

  //Início - William Santana SOL 161550 KIN 1717512
  qryReprLegal.Prepare;
  qryLogReprLegal.Prepare;
  pnlReprLegal.visible := false ;
  pnlGrdReprLegal.visible := true;
  bConfirmaPeloDetalhe := false;
  //Término - William Santana SOL 161550 KIN 1717512

  // cdsQualidade := TClientDataSet.Create(nil);
  qryDepeNaoCadastrado.ParamByName('PIDTITULAR').AsInteger := 0;//higor
  qryDepeNaoCadastrado.open;//higor
  //  qryDepeNaoCadastrado.edit;
  //qryDepeNaoCadastrado.first;

  pIdBenef := 0;

  MostraEscondeGridOutrasInformacoes(True); //Darivaldo Alencar SIG27871
end;

procedure TfrmCadDepenBenef.lkpcmbbxBancoChange(Sender: TObject);
begin
  inherited;
  qryAgencia.Close;
  if not qryAgencia.Prepared then qryAgencia.prepare;
  qryAgencia.ParamByName('pIDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.Open;
end;

procedure TfrmCadDepenBenef.qryBenefBeforePost(DataSet: TDataSet);
begin
  inherited;

  //BRUNO AZEVEDO SOL 184462 KINTANA 1727012
  if MontaSelect.RetornouValor then begin
    qryBenef.FieldByName('IDTITULAR').AsInteger     := StrToInt(MontaSelect.ValoresChave[0]);
  end else begin
    qryBenef.FieldByName('IDTITULAR').AsInteger     := StrToInt(sIdTitular);
  end;
  //BRUNO AZEVEDO SOL 184462 KINTANA 1727012

  qryBenef.FieldByName('IDPESSOA').AsInteger      := qryDet.FieldByName('IDPESSOA').AsInteger;

  qryBenef.FieldByName('IDPLANOPREV').AsInteger   := QryBeneficio.FieldByName('IDPLANOPREV').AsInteger;
  qryBenef.FieldByName('PLANO').AsString          := QryBeneficio.FieldByName('PLANO').AsString;

  // Felipe A. Santos SOL 222833 KTN 2056162
  //qryBenef.FieldByName('IDPLANOORIGEM').AsInteger := QryBeneficio.FieldByName('IDPLANOPREV').AsInteger;
  qryBenef.FieldByName('IDPLANOORIGEM').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
  // Felipe A. Santos SOL 222833 KTN 2056162 - fim

  qryBenef.FieldByName('IDPESSJUR').AsInteger     := qry.FieldByName('IDPESSJUR').AsInteger;
  qryBenef.FieldByName('SEQPROPOSTA').AsInteger   := 1;

  if (rdbProprio.Checked) and (DependenteMaiorIdade) then      // William Santana SOL 161550 KIN 1717512
     qryBenef.FieldByName('IDRESPONNAOREC').AsString := '';    // William Santana SOL 161550 KIN 1717512

  qryBenef.FieldByName('RECEBEDOR').AsString      := dbeRecebedor.Text;
  //qryBenef.FieldByName('RESPONSAVEL').AsString    := dbeResponsavel.Text;                           // William Santana SOL 161550 KIN 1717512
  qryBenef.FieldByName('BENEFICIO').AsString      := qryBeneficio.FieldByName('BENEFICIO').AsString;  // William Santana SOL 161550 KIN 1717512
  //qryBenef.FieldByName('TIPORECEBEDOR').AsString  := lkpcmbTipoRecebedor.Text;

  //Início - William Santana SOL 161550 KIN 1717512
   if (rdbOutro.Checked) and (not qryReprLegal.isempty ) then
   begin
     qryReprLegal.Filter   := 'SITATUAL = 1' ;
     qryReprLegal.Filtered :=  True;
     if not(qryReprLegal.isempty) then
     begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
      qryAux.SQL.Add(' IDRESPONSAVEL = '+Quotedstr(qryReprLegal.FieldByName('IDRESPONSAVEL').AsString));
      qryAux.SQL.Add(', IDRESPONNAOREC = '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
      qryAux.SQL.Add(', CODTIPORECEBEDOR = '+Quotedstr(qryReprLegal.FieldByName('CODTIPORESPONSAVEL').AsString));
      qryAux.SQL.Add(', DATAFIMRECEB = '+Quotedstr(qryReprLegal.FieldByName('DATATERMINO').AsString));
      qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr( qry.FieldByName('IDPESSJUR').AsString) );
      qryAux.SQL.Add(' AND IDPESSOA = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)   );
      qryAux.SQL.Add(' AND IDTITULAR = '+Quotedstr( qryBenef.FieldByName('IDTITULAR').AsString ));
      // Atualiza menos os que já foram encerrados
      qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
      qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
      qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
      qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
      qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
      qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
      qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr( qryBenef.FieldByName('IDTITULAR').AsString));
      qryAux.SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)  );
      qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');     //edilaine SIG126319    SIG128969
      //qryAux.SQL.Add('                    AND B.IDSITBENEFICIO = 3) ');    //edilaine SIG126319    SIG128969
      qryAux.ExecSQL;

      // atualizando o recebedor
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE HSTREPRLEGAL set ');
      qryAux.SQL.Add('        IDRECEBEDOR = '+Quotedstr(qryReprLegal.FieldByName('IDRESPONSAVEL').AsString));
      qryAux.SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( qry.FieldByName('IDPESSJUR').AsString)    );
      qryAux.SQL.Add('   AND IDPESSOA  = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)  );
      qryAux.SQL.Add('   AND IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
      qryAux.SQL.Add('   AND SITATUAL = 1');
      qryAux.ExecSQL;

     end;
    qryReprLegal.Filtered := False;
    qryReprLegal.Filter   := '';

   end
   else
   begin
     if (rdbProprio.Checked) then
     begin
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
       qryAux.SQL.Add(' IDRESPONSAVEL = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString));
       if DependenteMaiorIdade then
          qryAux.SQL.Add(', IDRESPONNAOREC = null')
       else
          qryAux.SQL.Add(', IDRESPONNAOREC = '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
       qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr( qry.FieldByName('IDPESSJUR').AsString) );
       qryAux.SQL.Add(' AND IDPESSOA = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)   );
       qryAux.SQL.Add(' AND IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );

       // Atualiza menos os que já foram encerrados
       qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
       qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
       qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
       qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
       qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
       qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
       qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
       qryAux.SQL.Add('                    AND B.IDPESSOA = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)   );
       qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');       //edilaine SIG126319    SIG128969
       //qryAux.SQL.Add('                    AND B.IDSITBENEFICIO = 3) ');      //edilaine SIG126319    SIG128969
       qryAux.ExecSQL;

       // atualizando o recebedor
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' UPDATE HSTREPRLEGAL set ');
       qryAux.SQL.Add('        IDRECEBEDOR = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString));
       qryAux.SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( qry.FieldByName('IDPESSJUR').AsString)    );
       qryAux.SQL.Add('   AND IDPESSOA  = '+Quotedstr( qryDet.FieldByName('IDPESSOA').AsString)  );
       qryAux.SQL.Add('   AND IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
       qryAux.SQL.Add('   AND SITATUAL = 1');
       qryAux.ExecSQL;

      end;
   end;
   //Término - William Santana SOL 161550 KIN 1717512
end;

procedure TfrmCadDepenBenef.qryCBancoBeforePost(DataSet: TDataSet);
begin
  inherited;

  if qryCBanco.State = dsInsert then
  begin
    qryCBanco.FieldByName('IdCBANCARIA').AsInteger := LeultRegistro(nil,'CONTABANCARIA');
  end;

  qryCBanco.FieldByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryCBanco.FieldByName('BANCO').AsString     := qryBanco.FieldByName('BANCO').AsString;
  qryCBanco.FieldByName('AGENCIA').AsString   := qryAgencia.FieldByName('AGENCIA').AsString;

  case qryCBanco.FieldByName('TIPOCONTA').AsInteger of
       1 :   qryCBanco.FieldByName('NOMETIPOCONTA').AsString := 'Conta Corrente';
       2 :   qryCBanco.FieldByName('NOMETIPOCONTA').AsString := 'Conta Salário';
       3 :   qryCBanco.FieldByName('NOMETIPOCONTA').AsString := 'Poupança';
       else  qryCBanco.FieldByName('NOMETIPOCONTA').AsString := 'Conta Corrente';
  end;

  // Renato Visoni SOL 149421 Kintana 1079221
  if edDigAgencia.text <> '' then begin
    qryCBanco.FieldByName('NUMAGENCIA').AsString   := edDigAgencia.text;
  end;
  // Renato Visoni SOL 149421 Kintana 1079221

  //edilaine - SIG25312 - inicio
  if qryCBanco.State = dsInsert then
     QryCbancoPref.Insert
  else
  begin
    QryCbancoPref.locate('IdCBANCARIA', qryCBanco.FieldByName('IdCBANCARIA').AsInteger, []);
    QryCbancoPref.edit;
  end;
  QryCbancoPref.FieldByName('IdCBANCARIA').AsInteger     := qryCBanco.FieldByName('IdCBANCARIA').AsInteger;
  QryCbancoPref.FieldByName('FLGCONTAPREF').AsInteger    := qryCBanco.FieldByName('FLGCONTAPREF').AsInteger;
  QryCbancoPref.FieldByName('FLGCONTARESGATE').AsInteger := qryCBanco.FieldByName('FLGCONTARESGATE').AsInteger;
  QryCbancoPref.Post;
  //edilaine - SIG25312 - fim

end;

procedure TfrmCadDepenBenef.qryDetAfterScroll(DataSet: TDataSet);
Var Sql :string;
begin
  inherited;
  if (not qryDet.Active) Or (qryDet.State = dsInsert) then Exit;

  edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;


{      qryPF.Close;
    if not qryPF.Prepared then qryPF.prepare;
    qryPF.ParamByName('IDPESSOA').Value := qryDet.FieldByName('IDPESSOA').AsInteger;
    qryPF.Open;
                       }
  if qryDet.FieldByName('TIPOISENCAOIRRF').AsString = '2' Then
  begin
    BitBtnHistorico.Enabled     := True;
    dbrgrpMolestiaGrave.Visible := true;
    //dbrgrpMolestiaGrave.Enabled := true; //Taffarel - SIG68507/71228
  end
  else
  begin
    BitBtnHistorico.Enabled     := False;//higor
    //dbdtMolestiaGrave.text := '';  //Taffarel - SIG68507/71228
    //CMDateTimePicker5.text := '';  //Taffarel - SIG68507/71228
    dbrgrpMolestiaGrave.Visible := False;
    //dbrgrpMolestiaGrave.Enabled := False; //Taffarel - SIG68507/71228
  { SOL 158955 - KINTANA 1613780 - JRM6}
  end;
  //Filtra os endereços do dependente selecionado, a query de endereços traz todos os
  //dependentes.
  //Na hora de gravar tirar o filtro.
  qryEndPess.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryEndPess.Filtered := True ;

  //edilaine - SIG5312 - inicio
  qryTelefone.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryTelefone.Filtered := True ;

  qryContato.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryContato.Filtered := True ;

  qryRamal.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryRamal.Filtered := True ;
  //edilaine - SIG5312 - fim


  //William Moreira da Silva - SOL 270369 PPM 1333987
  //if pgctrlDetalhe.ActivePage = tbsEndereco then
  //begin
  //William Moreira da Silva - SOL 269417 PPM 1295377
  //qryCidade.Filter := 'IDCIDADES ='+ IntToStr(qryEndPess.FieldByName('IDCIDADES').AsInteger);
  //qryCidade.Filtered := True ;
  //William Moreira da Silva - SOL 269417 PPM 1295377
  //end;
  //William Moreira da Silva - SOL 270369 PPM 1333987

  qryCBanco.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryCBanco.Filtered := True;

  sFiltroBenef := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;

  qryDepBen.Filter         := 'IDTITULAR = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryDepBen.Filtered       := True;

  //Início - William Santana SOL 161550 KIN 1717512
  qryReprLegal.Filter         := 'IDPESSOA = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger)
                                +' AND IDTITULAR = '+IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  qryReprLegal.Filtered       := True;

  qryLogReprLegal.Filter       := 'IDPESSOA = '+IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger)
                                +' AND IDTITULAR = '+IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  qryLogReprLegal.Filtered     := True;
  //Térimino - William Santana SOL 161550 KIN 1717512

  If Not qryDet.IsEmpty Then
    Pessoa.ChangePessoa(StrToIntDef(qryDet.FieldByName('IDPESSOA').AsString,0))
  else
    Pessoa.ChangePessoa(-1);

  { Busca proximo sequencial de dependente de um dependente a cadastrar }
  qrySeq.Close;
  if not qrySeq.Prepared then qrySeq.prepare;
  qrySeq.ParamByName('IDTITULAR').Value := qryDet.FieldByName('IDPESSOA').AsInteger;
  qrySeq.Open;
  iSeqDepBen := qrySeq.FieldByName('PROXNUMSEQ').AsInteger;
  qrySeq.Close;

  //edilaine - SIG25312 - inicio
  //Renato Visoni SOL 97628 \ Kintana 431568
  //VerificaContaPref(qryDet.FieldByName('IDPESSOA').AsString,qryDet.FieldByName('IDTITULAR').AsString);
  //Fim SOL 97628 \ Kintana 431568
  //edilaine - SIG25312 - fim

end;

procedure TfrmCadDepenBenef.bbtnCancelarDetClick(Sender: TObject);
begin
   bGridPadrao:= true; //Darivaldo Alencar SIG 27871
   Panel6.Visible := true; //HIGOR 184394
   EmitiuMsgNovoPlano := False;// Rodrigo de Brito Figueredo SOL 172704 Kintana 1567834
   if (qryContato.State = dsInsert) then
    qryContato.Cancel;

// Caso Inserindo e Tenha dado Erro Exclui Registro
  If (OpDetalhe = 'I') And (QryBenef.State in [DsEdit]) then begin
    QryBenef.Delete;
  End;

  //HIGOR 184394
  qryDepeNaoCadastrado.Close;
  if not qryDepeNaoCadastrado.Prepared then qryDepeNaoCadastrado.prepare;
  qryDepeNaoCadastrado.ParamByName('PIDTITULAR').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
  qryDepeNaoCadastrado.open;
  inherited;

  if pgctrlDetalhe.ActivePage = tbsDet
  then begin
    if EstadoAnt = dsInsert
    then begin
       dec(iseq);
       EstadoAnt := qryDet.State;
    end;
    qryPessoa.Cancel;
    qryPF.Cancel;
    qryDepen.Cancel;
  end;

  if pgctrlDetalhe.ActivePage = tbsDepBen
  then begin

    if EstadoAnt = dsInsert
    then begin
       dec(iseqDepBen);
       EstadoAnt := qryDepBen.State;
    end;

    qryDepBenPessoa.Cancel;
    qryDepBenPF.Cancel;
    qryDepBenDepen.Cancel;

    qryDepBenPessoa.Filtered := False;
    qryDepBenPessoa.Filter   := '';

    qryDepBenPF.Filtered := False;
    qryDepBenPF.Filter   := '';

    qryDepBenDepen.Filtered := False;
    qryDepBenDepen.Filter   := '';

    qryDepBen.Filtered := False;
    qryDepBen.Filter   := '';

    qryDepBen.Filter   := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryDepBen.Filtered := True;

  end;

  if pgctrlDetalhe.ActivePage = tbsContaBanco
  then begin
    qryCBanco.Filtered := False;
    qryCBanco.Filter   := '';

    qryCBanco.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryCBanco.Filtered := True;
  end;

  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
    qryBenef.Filtered := False;
    qryBenef.Filter := '';

    sFiltroBenef    := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
    sFiltroBenef    := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);

    qryBenef.Filter   := sFiltroBenef;
    qryBenef.Filtered := True;
  end;

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
   if bVeiodoBenefResp then
   begin
    qryBenef.Filtered := False;
    qryBenef.Filter   := '';
    sFiltroBenef      := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
    sFiltroBenef      := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryBenef.Filter   := sFiltroBenef;
    qryBenef.Filtered := True;
   end;
    qryReprLegal.Filtered := False;
    qryReprLegal.Filter   := ' IDPESSOA = '+ IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger) +
                             ' AND IDTITULAR = '+ IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger) ;
    qryReprLegal.Filtered := True;

     pnlReprLegal.visible := false ;
     pnlGrdReprLegal.visible := True ;
  end;
  //Término - William Santana SOL 161550 KIN 1717512

  //edilaine - SIG25312 - inicio
  if pgctrlDetalhe.ActivePage = tbsContato then
  begin
    qryRamal.cancel;
  end
  else if pgctrlDetalhe.ActivePage = tbsTelefone then
  begin
    qryRamal.cancel;
  end;
  //edilaine - SIG25312 - fim

  flgGravaDepent := false; //HIGOR 184394
  bDepNaoCad := False; // Felipe A. Santos SOL: 208475 KINTANA: 2016859
  qryDependencia.Sql.text := qryDependenciaAux.Sql.text; // higor

  habilitaAlteracaoDepCancelado(false); //William Santana - SIG 25312
//Darivaldo Alencar SIG 27871 -inicio
  MostraEscondeGridOutrasInformacoes;
  FormataEdit(edPaiDetalhe);
  //Darivaldo Alencar SIG 27871 -fim
end;

procedure TfrmCadDepenBenef.bbtnVoltarDetClick(Sender: TObject);
begin
   bGridPadrao:= true; //Darivaldo Alencar SIG 27871
   Panel6.Visible := true; //HIGOR 184394
   if (qryContato.State = dsInsert) then
    qryContato.Cancel;
  inherited;  bbtnCancelarDet.Click;
end;

//******************************************************************************
// Testa se Total de Participacao dos Dependentes no Beneficio passou de 100%
Function TfrmCadDepenBenef.ExcedeCemPorCento:boolean;
Var
  iIDTitular      : Integer;
  iIDBeneficiario : Integer;
  iIDPlanoPrev    : Integer;
  iIDBeneficio    : Integer;
  iBeneficio      : Integer;
  TotPercent      : Double;

  qryTmp          : twwQuery; // Thiago Melo SOL 240767 PPM 544284
begin
  Result          := False;
// Guarda Dados
  iIDTitular      := qryDet.FieldByName('IdTitular').AsInteger;
  iIDBeneficiario := qryDet.FieldByName('IdPessoa').AsInteger;
  iIDBeneficio    := qryBenef.FieldByName('IdBeneficio').AsInteger;
  iIDPlanoPrev    := qryBeneficio.FieldByName('IDPLANOPREV').AsInteger;
  iBeneficio      := qryBenef.FieldByName('IdBeneficio').AsInteger;
  TotPercent      := 0;

  //Wylliam Leite da Silva - SOL:258918 PPM:1007497 - Início
  sGuardaEstAnt := qryBenef.State;

  //Início - William Santana - SOL 260670 - PPM 1040878
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add(qryBenef.SQL.getText);
   qryAux2.ParamByName('IDTITULAR').AsString := qryDet.FieldByName('IdTitular').AsString;
   qryAux2.ParamByName('IDPLANOPREV').AsInteger := iIDPlanoPrev; // Felipe A. Santos SOL 264722 PPM 1152948
   qryAux2.Open;
   qryAux2.Filtered := false;
   qryAux2.Filter := ' IDPESSOA = ' + IntToStr(iIDBeneficiario) +
                ' AND IDPLANOPREV = ' + IntToStr(iIDPlanoPrev) +
                ' AND IDBENEFICIO = ' + IntToStr(iIDBeneficio);
   qryAux2.Filtered := true;

   // Alterado por FHBS - 03/01/2019 - SIG80209 (Alterado de .Value para as Float)
   if qryAux2.isEmpty then
     TotPercent := qryBenefPERCENTUAL.AsFloat
   else
     TotPercent := (qryBenefPERCENTUAL.AsFloat - qryAux2.FieldByName('PERCENTUAL').AsFloat)  ;
   // Fim - Alterado por FHBS - 03/01/2019 - SIG80209 (Alterado de .Value para as Float)

//
//  if qryBenef.State = dsedit then
//     TotPercent      := (qryBenefPERCENTUAL.Value - qryBenefPERCENTUAL.oldvalue)
//  else
//     TotPercent      := qryBenefPERCENTUAL.Value;
  //Wylliam Leite da Silva - SOL:258918 PPM:1007497 - Fim
   //Término -William Santana - SOL 260670 - PPM 1040878

// Cancela e Altera Filtro da Consulta
  qryBenef.Filtered := False;
  qryBenef.Filter   := '';

// Monta novo Filtro por Beneficio
  sFiltroBenef := ' IDTITULAR = ' + IntToStr(iIDTitular);
  sFiltroBenef := sFiltroBenef + ' AND IDPLANOPREV = ' + IntToStr(iIDPlanoPrev);
  sFiltroBenef := sFiltroBenef + ' AND IDBENEFICIO = ' + IntToStr(iIDBeneficio);

  qryBenef.Filter   := sFiltroBenef;
  qryBenef.Filtered := True;

  // Thiago Melo SOL 240767 PPM 544284
  qryTmp := twwQuery.Create(nil);
  try
    with qryTmp do begin
      DataBaseName := 'BaseDados';
      Close;
      Sql.Clear;
      Sql.add(StringReplace(qryBenef.Sql.GetText, ':IDTITULAR', qryDet.FieldByName('IdTitular').AsString, []));
      ParamByName('IDPLANOPREV').AsInteger := iIDPlanoPrev; // Felipe A. Santos SOL 264722 PPM 1152948
      Open;
      Filtered := False;
      Filter   := ' IDTITULAR = ' + IntToStr(iIDTitular) + ' AND IDPLANOPREV = ' + IntToStr(iIDPlanoPrev) + ' AND IDBENEFICIO = ' + IntToStr(iIDBeneficio);
      Filtered := True;

      //Início - William Santana - SOL 265910 - PPM 1201672
      // caso seja benefício único, adiciona a clausula D.IDPESSOA <> D.IDTITULAR
      // filter não funciona com comparação de diferente (<>)
      if (FieldByName('IDTPPAGTOBENEFIC').AsInteger = 2) then
      begin
        Close;
        Sql.Clear;
        Sql.add(StringReplace(qryBenef.Sql.GetText, ':IDTITULAR', qryDet.FieldByName('IdTitular').AsString, []));
        Sql.text := StringReplace(Sql.GetText, 'ORDER BY', 'AND D.IDPESSOA <> D.IDTITULAR  ORDER BY', []);
        ParamByName('IDPLANOPREV').AsInteger := iIDPlanoPrev;
        Open;
        Filtered := False;
        Filter   := ' IDTITULAR = ' + IntToStr(iIDTitular) + ' AND IDPLANOPREV = ' + IntToStr(iIDPlanoPrev) + ' AND IDBENEFICIO = ' + IntToStr(iIDBeneficio);
        Filtered := True;
      end;
      //Término - William Santana - SOL 265910 - PPM 1201672

    end;
    // Thiago Melo SOL 240767 PPM 544284
    qryTmp.First;

    //Wylliam Leite da Silva - SOL:258918 PPM:1007497 - Início
    if (qryTmp.RecordCount > 0) then
    begin
     While not qryTmp.EOF do begin
        if (qryTmp.FieldByName('IdBeneficio').AsInteger = iBeneficio) then begin
          // Soma Percentuais
          TotPercent := TotPercent + qryTmp.FieldByName('Percentual').AsFloat;
          // Caso Ultrapasse 100% sai Fora
          if TotPercent > 100 then begin
            Result := True;
            Break;
          end;
        end;
       // Proximo Registro
        qryTmp.Next;
      end;
    end
    else
    begin
      if (TotPercent > 100) then
         Result := True;
    end;
    //Wylliam Leite da Silva - SOL:258918 PPM:1007497 - Fim
    // Thiago Melo SOL 240767 PPM 544284


  finally
    FreeAndNil(qryTmp);
  end;
  // Thiago Melo SOL 240767 PPM 544284


// Cancela e Altera Filtro da Consulta
  qryBenef.Filtered := False;
  qryBenef.Filter   := '';

// Volta Filtro Antigo
  sFiltroBenef := 'IDTITULAR = ' + IntToStr(iIDTitular);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(iIDBeneficiario);

  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;

// Volta ao Registro Antigo
  qryBenef.Locate('IDPESSOA; IDBENEFICIO',
                  VarArrayOf([iIDBeneficiario, IBeneficio]),[]);
// Reedita a Consulta e Altera o Valor
//  qryBenef.Edit; //Wylliam Leite da Silva - SOL:258918 PPM:1007497
    qryBenef.Edit; //William Santana - SOL 260670 - PPM 1040878
end;

procedure TfrmCadDepenBenef.FormShow(Sender: TObject);
begin
  inherited;

  iIdCalculoGeral := -1;

  QryResponsavel.Open;
  QryTipoRecebedor.Open;
  qryDependencia.Open;
  qryDependencia2.Open;
  qryGrau.Open;

// EXISTE UM FUNÇÃO QUE CONTROLA ISSO. ESTA ATRIBUIÇÃO ESTÁ SOBREPONDO
// O RETORNO DA FUNÇÃO
//  sbtnAlterar.Enabled := False;
//  sbtnAlterar.Visible := True;

  // Limpa os campos da Conta Bancária
  if qryCBanco.State in [dsInsert]
  then begin
     edDigBanco.Text := '';
     edDigAgencia.Text := '';
  end;
//-*
  WindowState := wsMaximized;
  Self.Caption := 'Cadastro de Dependentes';
  frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);

  MontaSelect.Filtro.Add('EL.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

  qryOutrasInforms.Close;
  qryOutrasInforms.ParamByName('IDPESSOA').Value := -1;
  qryOutrasInforms.Open;

  //Darivaldo Alencar SIG 27871 -inicio
  qryOcupacao.Close;
  qryOcupacao.ParamByName('IDPESSOA').asInteger := -1;
  qryOcupacao.Open;
  //Darivaldo Alencar SIG 27871 -fim

  pnlDepenJaExiste.SendToBack;
  pnlDepenJaExiste.Visible := False;
end;

procedure TfrmCadDepenBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryNucleoFam.Close;
  QryResponsavel.Close;
  QryTipoRecebedor.Close;
  qryContato.Close;
  qryGlobal.Close;

  dbgrdBeneficiario.DataSource.DataSet.FreeBookMark(Linha);   //William Santana - SOL 161550 KIN 1717512

  // Se Form de Consulta Geral de Pessoa estiver aberto então retorna a normal.
  WindowState:= wsNormal;
  //BRUNO AZEVEDO SOL 135094 KINTANA 805800
  //if Assigned(frmConsPessoaGeral) then begin
  //  frmConsPessoaGeral.WindowState:= wsNormal;
  //end;
  //If frmConsPessoaGeral <> Nil
  // Then frmConsPessoaGeral.WindowState:= wsNormal;
  //BRUNO AZEVEDO SOL 135094 KINTANA 805800

  bReterBenEstCivil   := False;
  bReterBenMaiorIdade := False;
  bReterBenSuperior   := False;

  inherited;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
end;

procedure TfrmCadDepenBenef.bbtnConfirmarClick(Sender: TObject);
Var
 qryAtualiza : TwwQuery;
 sSql        : String;
 iPont       : Integer;
 sDataFinal  : String;
 sMotivo     : String;
 sFiltro     : String;   //André Oliveira SOL 165677 KINTANA 1568409
 qryPar: TwwQuery;
begin
  bGridPadrao:= true;//Darivaldo Alencar SIG 27871
  if not (ValidaEntrada) then Abort; // Darivaldo Alencar - SIG 33695
  Panel6.Visible := true;   //HIGOR 184393
  //Higor N. SOLSOL213269-15632
  qryAux := TwwQuery.create(nil);
  qryAux.DataBaseName := 'BaseDados';

   if (qryDet.recordcount > 0) then  //SIG90282
     begin
         qryAux.Sql.text := ' SELECT * FROM DEPENTIT WHERE IDPESSOA = ' + qryDet.FieldbyName('IDPESSOA').AsString+
                  ' AND DATACADASTRO >= ''30/06/2014'' AND DATACANCELA IS NULL';
        qryAux.open;
        if not(qryAux.IsEmpty) or (qryDet.State = dsInsert)then begin

          if (not dbchkbxDesignado.Checked ) and (not dbchkbxFlgDepLegal.Checked) and (dbdtInicioIR.Text = '') then
          begin
               MsgDlg('Verifique a marcação de Dependente Legal/ Designado.','Atenção', mtInformation, [mbOk],0);
               pgcDependente.ActivePage :=  tbsDet02;
               dbchkbxDesignado.SetFocus;
               Exit;
          end;
        end;
     end;
  qryAux.close;
  qryAux.Sql.text := '';
  //Higor N. SOLSOL213269-15632

  //ERALDO LUIS DA SILVA SOL 155774 KINTANA 1214023
  //   Cria query virtual para ler o parâmetro da regra travando alteracoes de beneficiarios cancelados
  // SOL 175842 Kintana 1602998

   //Darivaldo Alencar - SIG 25312 -inicio
  if (pgCtrlDetalhe.ActivePage = tbsDet) then
    begin
      //   If (pgCtrlDetalhe.ActivePage <> tbsBeneficiario) then begin
      //     qryPar := TwwQuery.Create(Self);
      //     try
      //        qryPar.DatabaseName := 'BASEDADOS';
      //     // Escreve a query e dá o open
      //        qryPar.SQL.Clear;
      //        qryPar.SQL.Add('select 1 from DEPENTIT');
      //        qryPar.SQL.Add('where IDPESSOA =' + inttostr(pIdBenef)) ;//Marcio Sanches Spinosa SOL 205681 Kintana 1992276    // qryDet.FieldByName('IDPESSOA').AsString);
      //            qryPar.SQL.Add('and IDTITULAR ='+ qry.FieldByName('IDPESSOA').AsString); // Higor Nayde Ferreira  SOL 194883 KTN 1863270
      //        qryPar.SQL.Add('and DATACANCELA IS NOT NULL');
      //        qryPar.Open;
      //
      //        if qryPar.RecordCount > 0 then
      //        begin
      //          MsgDlg('Dependente cancelado! Para alterar as informações é necessário desfazer o evento de cancelamento.','Mensagem do Sistema ',
      //                    mtConfirmation,[mbOk],0);
      //          Exit;
      //        end;
      //     finally
      //       FreeAndNil(  qryPar );
      //     end;
    end;
   //Darivaldo Alencar - SIG 25312 -fim

  // SOL 175842 Kintana 1602998
  //ERALDO LUIS DA SILVA SOL 155774 KINTANA 1214023
   // SOL 161016 KINTANA 1355687
   {if (pgctrlDetalhe.ActivePage = tbsDet) then
   begin
     if (  (not(Chkregreplan.Checked)) and
           (not(Chkreb.Checked)) and
           (not(Chknovoplano.Checked)) ) then begin
      MessageDlg('Nao é permitido cadastrar um dependente sem plano',mtInformation, [mbOK], 0);
      exit;
      end;
   end;   }
   // SOL 161016 KINTANA 1355687
   //higor
   if (qryPF.State = DsEdit) then //Marcio Sanches Spinosa SOL 239266 PPM 515130
   begin
      if (dbrgrpIsentoIR.ItemIndex = 0) and (wwDBCBIsentoIrrf.ItemIndex = -1 )then
      begin
          MsgDlg('Campo de Isento de IR deve ser preechido','Informação',mtInformation,[mbOk],0);
          Exit
      end;
   end;//Marcio Sanches Spinosa SOL 239266 PPM 515130
    IF (dbrgrpMolestiaGrave.Visible)then   //Marcio Sanches Spinosa SOL 238755 PPM 507686
    begin
      if wwDBCBIsentoIrrf.ItemIndex = 2 then
      begin
        if qryPF.FieldByName('DATAMOLESTIAGRAVE').AsString ='' then
        if dbdtMolestiaGrave.Text = '' then
        begin
            MsgDlg('Data Início de Moléstia Grave deve ser preenchida','Informação',mtInformation,[mbOk],0);
            Exit
        end;
        //Marcio Sanches Spinosa SOL 239266 PPM 515130 - Inicio
        //        if qryPF.FieldByName('DATAFIMMOLESTIA').AsString ='' then
        //        //if CMDateTimePicker5.Text = '' then
        //        begin
        //            MsgDlg('Data Término de Moléstia Grave deve ser preenchida','Informação',mtInformation,[mbOk],0);
        //            Exit;
        //        end;
        //Marcio Sanches Spinosa SOL 239266 PPM 515130 - Fim
      end;
    end;   //Marcio Sanches Spinosa SOL 238755 PPM 507686
   if (qryContato.State = dsInsert) then
    qryContato.Cancel;

  If QryBenef.State in [DsInsert, DsEdit] Then Begin
    MsgDlg('Detalhes não foram confirmados.','Mensagem do Sistema ',
            mtConfirmation,[mbOk],0);
    Exit;
  End;

  //monica gonzaga
  {Thiago Melo SOL 224506 kintana 2058056
  if (dtsolicitacontasalario.text = '') and (dbchksolicitacontasalario.Checked) then
  begin
      ShowMessage('É necessário informar a data de solicitação de conta salário.');

      Abort;
  end;
  Thiago Melo SOL 224506 kintana 2058056}

    if (dtcontasalarioprocessada.text = '') and (dbchkSalarioProcessado.Checked) then
  begin
      ShowMessage('É necessário informar a data de processamento da conta salário.');
      Abort;
  end;
    //monica gonzaga
  //inicio André Oliveira SOL 165678 KINTANA 1470728
      sFiltro := 'AND D.IDDEPENDENCIA = '+QuotedStr('COM');
      if((VerificaTipoDenpedit(sFiltro, sIdPessoa, qryPessoa.FieldByName('IDPESSOA').AsString, '')) and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM')or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='COP')) and(qryDet.state in  [DsInsert,DsEdit]))then
      begin
           MsgDlg('Participante já possui um cônjuge cadastrado','Aviso',mtInformation,[mbOk],0);
           Abort;
      end;
      sFiltro := 'AND D.IDDEPENDENCIA = '+QuotedStr('COP');
      if((VerificaTipoDenpedit(sFiltro, sIdPessoa,qryPessoa.FieldByName('IDPESSOA').AsString,'')) and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='COM')or (qryDet.FieldByName('IDDEPENDENCIA').AsString ='COP')) and(qryDet.state in  [DsInsert,DsEdit]))then
      begin
           MsgDlg('Participante já possui um companheiro cadastrado','Aviso',mtInformation,[mbOk],0);
           Abort;
      end;
      sFiltro := 'AND D.IDDEPENDENCIA = '+QuotedStr('PAI');
      if(VerificaTipoDenpedit(sFiltro, sIdPessoa, qryPessoa.FieldByName('IDPESSOA').AsString, qryPF.FieldByName('SEXO').AsString)) and ((qryDet.FieldByName('IDDEPENDENCIA').AsString ='PAI') and(qryDet.state in [DsInsert,DsEdit]))then
      begin
           MsgDlg('Participante já possui um Pai/Mãe cadastrado','Aviso',mtInformation,[mbOk],0);
           Abort;
      end;
    //fim André Oliveira SOL 165678 KINTANA 1470728


  //Início - William Santana - SOL 161550 KIN 1717512
  //if ((not bVeiodoBenefProprio) and (not bVeiodoBenefResp)) and {(pgctrlDetalhe.ActivePage = tbsReprLegal) and}
  //William Moreira da Silva - SOL 241715
  if (( bVeiodoBenefResp ) or ( bVeiodoBenefProprio )) and
     (not bConfirmaPeloDetalhe) then
  begin
    if ((not DependenteMaiorIdade) and (not VerificaReprLegal)) or
       ((DependenteMaiorIdade) and (VerificaReprBeneficiosAtivos) and (not VerificaReprLegal)) then
    begin
      MsgDlg('É obrigatório o cadastro de documento vigente para os pensionistas menores de 18 anos e nos'
            +' casos em que o recebedor do benefício é o representante legal','Erro',mtError ,[mbOk],0);
      pgctrlDetalhe.ActivePage := tbsReprLegal;
      exit;
    end;
  end;
  //Fim - William Santana - SOL 161550 KIN 1717512


  // Testa variavel de retenção. Caso seja TRUE avisa ao usuário e retem benefício.
  If  (bReterBenEstCivil)   // Retenção por mudança de estado civil
   Or (bReterBenMaiorIdade) // Retenção por completar maioridade
   Or (bReterBenSuperior)   // Retenção por completar curso superior
  Then
   Begin

    If bReterBenMaiorIdade
     Then sMotivo := '1';  // Motivo Retenção = 1 (Completou maioridade)
//
    If bReterBenMaiorIdade
     Then sMotivo := '3'; // Motivo Retenção = 3 (mudança de estado civil)
//
    If bReterBenSuperior
     Then sMotivo := '5'; // Motivo Retenção = 5 (conclusão de curso superior)
//
    MsgDlg('Beneficiário perdeu elegibilidade. Benefício(s) será(o) suspenso(s).',
           'Aviso ao Usuário ', mtConfirmation,[mbOk],0);
//
    iPont:=0;
    qryAtualiza := TwwQuery.Create(Self);
    qryAtualiza.DatabaseName:= qry.DatabaseName;

    Repeat

     If aRegBen[iPont].FLGDATAPREVISTA = 0
      Then sDataFinal := aRegBen[iPont].DATAFINAL
      Else sDataFinal := aRegBen[iPont].DATAFINALPREVISTA;

     CriaLogOcorrencia(IntToStr(aRegBen[iPont].IDPLANOPREV),
                       IntToStr(aRegBen[iPont].IDPESSJUR),
                       IntToStr(aRegBen[iPont].IDTITULAR),
                       IntToStr(aRegBen[iPont].IDBENEFICIO),
                       IntToStr(aRegBen[iPont].NUMEROPROCESSO),
                       IntToStr(aRegBen[iPont].IDPESSOA),
                       IntToStr(aRegBen[iPont].SEQPROPOSTA),
                       '3',
                       FormatDateTime('dd/mm/yyyy', Date),
                       FloatToStr(aRegBen[iPont].VALORATUAL),
                       FloatToStr(aRegBen[iPont].VALORTOTAL),
                       FloatToStr(aRegBen[iPont].VALORCOTAS),
                       aRegBen[iPont].DATAINICIO,
                       sDataFinal,
                       FloatToStr(aRegBen[iPont].VALORATUAL),
                       aRegBen[iPont].DATAINICIO,
                       sDataFinal,
                       IntToStr(aRegBen[iPont].IDSITBENEFICIO),
                       0,
                       qryAtualiza,
                       sMotivo,
                       -1,
                       iIdCalculoGeral
                       );

    Until aRegBen[iPont].IDPESSJUR <> 0;

   End;
  qryDependencia.Sql.text := qryDependenciaAux.Sql.text; // higor

  //Darivaldo Alencar SIG 27871 -inicio
   if (pgCtrlDetalhe.ActivePage = tbsOutrasInformacoes) then
      begin
         if ((qryAtual = qryOcupacao) and (qryOcupacao.state in[dsInsert])) then
            begin
               while not(qryOcupacao.Eof)do
                  begin
                      if (qryOcupacao.fieldByname('IDPESSOAPPE').asString = EmptyStr)  then
                          qryOcupacao.delete;
                      qryOcupacao.next;
                  end;
            end;

            if (qryPF2.state in [dsEdit]) then
                qryPF2.post;
      end;
  //Darivaldo Alencar SIG 27871 -fim
  inherited;

  if not(qryDet.isempty) then
  Begin
    //if not dtmBaseDados.dbBaseDados.InTransaction then
    //  dtmBaseDados.dbBaseDados.StartTransaction;

    //Andre Imakawa SIG25312 -inicio
    qryDet.First;
    while not qryDet.Eof do
    begin
      AtualizaEmailFuncef(qryDet.FieldbyName('IDPESSOA').AsString);
      qryDet.next;
    end;

    qryPf.ApplyUpdates;
    //if dtmBaseDados.dbBaseDados.InTransaction  then
    //  dtmBaseDados.dbBaseDados.Commit;
    try
    SelecionaDependente(sIdPessoa,
                        sIdPessJur,
                        sIdPlanoPrev);

    except
    end;
    //Andre Imakawa SIG25312 -final

  end;

  // Renato Visoni SOL 130508 Kintana 733058
  with qryAux do begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT IDTITULAR FROM DEPENTIT ');
    SQL.Add(' WHERE IDPESSOA = '+sIdPessoa);
    Open;
  end;

  if qryAux.fieldByName('IDTITULAR').asString <> '' then begin
    if not ProcAtualizaNumeroDependentes(qryAux.fieldByName('IDTITULAR').asInteger, 1) then begin
      MsgDlg('Erro na atualização de número de dependentes. ','Atenção',mtWarning ,[mbOK],0);
    end;
  end;

  qryDet.Close;
  if not qryDet.Prepared then qryDet.prepare;
  qryDet.ParamByName('IDTITULAR').Value := StrToInt(sIdPessoa);
  qryDet.Open;


  qryDepBenPF.Close;
  if not qryDepBenPF.Prepared then qryDepBenPF.prepare;
  qryDepBenPF.ParamByName('IDPESSOA').Value := StrToInt(sIdPessoa);
  qryDepBenPF.Open;

  // Renato Visoni SOL 130508 Kintana 733058

  try
  //if MontaSelect.ValoresChave[3]<>'' Then
  if sIdPlanoPrev <>'' Then     //Ádler Souza - SOL 134214 / Kintana 787470
    RodaRegraElegibilidade;
  except end;
  //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Inicio
  if pgctrlDetalhe.ActivePage = tbsDet then
   if FlgMsg then
     if EmitiuMsgNovoPlano then
       if(ValidaPlano(sIdPessoa))then
          ComparaCampos;
  if EmitiuMsgNovoPlano then
    EmitiuMsgNovoPlano := False;
  if not FlgMsg then
    FlgMsg := true;
  //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim

  //HIGOR 184393
  OpDependente := ' ';
  btnSelecionaAlguns.Enabled:= false;
  btnSelecionaTodos.Enabled:= false;
  //flgGravaDepent := false;

  pnlMestre.Enabled := True; //Darivaldo Alencar - SIG 25312
end;

procedure TfrmCadDepenBenef.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Visible := True;
  //If (MontaSelect.RetornouValor) And (MontaSelect.ValoresChave[3] <> '') Then
  If (MontaSelect.RetornouValor) And (sIdplanoPrev <> '') Then // Adler Souza SOL 134214 Kintana 787470
    RodaRegraElegibilidade;

  If (MontaSelect.RetornouValor) Then //SOL 151398 Kintana 1107593
  begin
  //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
    EmitiuMsgNovoPlano := False;
    FlgMsg := true;
  //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Fim
    sIdtitular := MontaSelect.ValoresChave[0];
    BuscaOBSR; //Darivaldo Alencar -SIG 27871
  end;

    //Monica
    if dbchksolicitacontasalario.Checked   then
    begin
           dtsolicitacontasalario.Enabled := true
      end
      else
      begin
           dtsolicitacontasalario.Enabled := false;
    end;


    if dbchkSalarioProcessado.Checked  then
    begin
         dtcontasalarioprocessada.Enabled := true
       end
      else
      begin
         dtcontasalarioprocessada.Enabled := false;
    end;
  //Monica

  //HIGOR 184394
  qryDepeNaoCadastrado.Close;
  if not qryDepeNaoCadastrado.Prepared then qryDepeNaoCadastrado.prepare;
  qryDepeNaoCadastrado.ParamByName('PIDTITULAR').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
  qryDepeNaoCadastrado.open;
//  cdsQualidade.data:=  qryDepeNaoCadastrado.open;

  pnlMestre.Enabled := True; //Michelle Mota - SIG 25312
   //MontaListaFiltraPlanos();   //edilaine - SIG25312    
  wwDBTpDepen.value := '0'; //William Moreira da Silva - SIG 25312
end;

procedure TfrmCadDepenBenef.edDigBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
     lkpcmbbxBanco.Text := qryBanco.FieldByName('Banco').AsString;
     lkpcmbbxBanco.PerformSearch;
     qryAgencia.Close;
     qryAgencia.ParamByName('pIDBANCO').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
     qryAgencia.Open;
  end;
end;

procedure TfrmCadDepenBenef.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgencia.Locate('NumAgencia',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey])
  then begin
     lkpcmbbxAgencia.Text := qryAgencia.FieldByName('Agencia').AsString;
     lkpcmbbxAgencia.PerformSearch;
     lkpcmbbxAgencia.OnCloseUp(self,qryAgencia,nil,false);
  end;
end;

procedure TfrmCadDepenBenef.lkpcmbbxAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  edDigAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
end;

procedure TfrmCadDepenBenef.lkpcmbbxBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin

  inherited;
  qryCBanco.FieldbyName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
  edDigAgencia.Text := '';
  lkpcmbbxAgencia.Text := '';

  qryAgencia.Close;
  qryAgencia.ParamByName('pIDBANCO').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
  qryAgencia.Open;

  edDigBanco.Text := IntToStr(qryBanco.FieldbyName('NUMBANCO').AsInteger);
end;

procedure TfrmCadDepenBenef.rdbProprioClick(Sender: TObject);
begin
  inherited;
  //Início - William Santana SOL 161550 KIN 1717512
//  if rdbProprio.Checked then begin
//    (* O Responsável do Dependente É o próprio dependente *)
//    rdbOutro.Checked                               := False;
//    qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
//    dbeRecebedor.Text                              := qryDet.FieldByName('NOME').AsString;
//  end
//  else begin
//     // o Recebedor é o Responsável
//     if Trim(dbeResponsavel.Text) = ''
//     then begin
//        MsgDlg('Indique um Responsável pelo Beneficiário.','Informação',mtInformation, [mbOk],0);
//        rdbOutro.Checked                               := False;
//        rdbProprio.Checked                             := True;
//        qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
//        dbeRecebedor.Text                              := qryDet.FieldByName('NOME').AsString;
//        Exit;
//     end;
//     qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryBenef.FieldByName('IDRESPONNAOREC').AsString;
//     dbeRecebedor.Text                              := dbeResponsavel.Text;
//  end;

  if rdbProprio.Checked then begin
    (* O Responsável do Dependente É o próprio dependente *)
    rdbOutro.Checked                               := False;
    qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
    dbeRecebedor.Text                              := qryDet.FieldByName('NOME').AsString;

  end
  else begin
     // o Recebedor é o Responsável
     if ( (not VerificaReprLegal) ) then
     begin
        MsgDlg('É necessário o cadastro do Representante Legal para o dependente selecionado.','Informação',mtWarning, [mbOk],0);

        sBenef := lkpcmbBeneficio.text;
        sPrio  := dbePrioridade.text;
        sPerc  := dbePercentual.text;
        iBenef := qrybenef.fieldByName('IDBENEFICIO').AsInteger;

        if (sbtnInsDet.down) then
          bIns := true
        else
        if (sbtnAltDet.down) then
         bAlt := True;

        bbtnVoltarDet.Click;

        IntegraBenef_ReprLegal(2);
     end;

   qryBenef.FieldByName('IDRESPONNAOREC').AsInteger := qryReprLegal.fieldbyName('IDRESPONSAVEL').AsInteger;
   qryBenef.FieldByname('IDRESPONSAVEL').AsInteger  := qryReprLegal.fieldbyName('IDRESPONSAVEL').AsInteger;
   dbeRecebedor.Text                                := qryreprLegal.FieldByName('NOMERESPONSAVEL').AsString;
  end;
  //Término - William Santana SOL 161550 KIN 1717512
end;

procedure TfrmCadDepenBenef.sbtnCadRecebedorClick(Sender: TObject);
begin
  inherited;

  iIdResponsavelGeral := -1;

  frmCadResponsa := TfrmCadResponsa.Create(Application);
  try
     frmCadResponsa.ShowModal;
  finally
     frmCadResponsa.Free;
  end;

  if iIdResponsavelGeral > 0
  then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iIdResponsavelGeral));
        Open;
        qryReprLegal.FieldByname('IDRESPONSAVEL').AsInteger := iIdResponsavelGeral;
        //qryBenef.FieldByname('IDRESPONSAVEL').AsInteger := iIdResponsavelGeral;           //William Santana SOL 161550 KIN 1717512
        //dbeRecebedor.Text                             := FieldByName('Nome').AsString;    //William Santana SOL 161550 KIN 1717512
        Close;
        iIdResponsavelGeral                             := -1;
     end;
  end;

end;

procedure TfrmCadDepenBenef.qryCBancoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  edDigBanco.Text   := qryBanco.FieldByName('NumBanco').AsString;
  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;
end;


procedure TfrmCadDepenBenef.qryCBancoAfterScroll(DataSet: TDataSet);
begin
   inherited;

  //Renato Visoni SOL 97628 \ Kintana 431568
  sContaPref  := QryCbanco.FieldByname('FlgContaPref').Asstring;
  //Renato Visoni SOL 97628 \ Kintana 431568

  if not qryAgencia.Active then Exit;
  if (Trim(lkpcmbbxAgencia.Text) = '') or (edDigAgencia.Text <> '') then Exit;

  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;
end;

procedure TfrmCadDepenBenef.dbrgrpFlgMolestiaGraveClick(Sender: TObject);
begin
//if  dbrgrpFlgMolestiaGrave.ItemIndex = 0 then
  if  wwDBCBIsentoIrrf.ItemIndex = 2 then
  begin
//    dbrgrpMolestiaGrave.Visible    := True;
//    dbrgrpMolestiaGraveFim.Visible := True;
    dbchkIsentoIR.Checked          := True;
    qryPF.FieldByName('FLGISENTOIRRF').AsInteger := 1;
  end
  else
  begin
//    dbrgrpMolestiaGrave.Visible    := False;
//    dbrgrpMolestiaGraveFim.Visible := False;
//    dbdtMolestiaGrave.Text         := '';
    qryPF.FieldByName('DATAMOLESTIAGRAVE').AsString := '';
    qryPF.FieldByName('DATAFIMMOLESTIA').AsString := '';
    dbchkIsentoIR.Checked          := False;
    qryPF.FieldByName('FLGISENTOIRRF').AsInteger := 0;
    qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
  end;

  // inherited;
end;

procedure TfrmCadDepenBenef.qryBenefAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Se inseriu recebedor como proprio, entao inseri-lo na tabela de responsavel
  if (bInseriuRecebProprio) and (qryBenef.FieldByName('IDRESPONSAVEL').AsString <> '')
  then begin
     with qryAux do
     begin
        // Verificar se pessoa já é responsavel
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDRESPONSAVEL FROM RESPONSAVEL '+
                ' WHERE  IDRESPONSAVEL = '+qryBenef.FieldByName('IDRESPONSAVEL').AsString);
        Open;

        if IsEmpty
        then begin
           if not qryRecebedor.IsEmpty
           then begin
              if not qryRecebedor.Locate('IDRESPONSAVEL', qryBenef.FieldByName('IDRESPONSAVEL').AsInteger, [])
              then begin
                 qryRecebedor.Insert;
                 qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger  := qryBenef.FieldByName('IDRESPONSAVEL').AsInteger;
                 qryRecebedor.FieldByName('FLGADMPREV').AsInteger     := 1;
                 qryRecebedor.FieldByName('FLGIMOBILIARIO').AsInteger := 0;
                 qryRecebedor.FieldByName('FLGATIVOFIXO').AsInteger   := 0;
                 qryRecebedor.Post;
                 bRecebProprioNovo := True;
              end;
           end
           else begin
              qryRecebedor.Insert;
              qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger  := qryBenef.FieldByName('IDRESPONSAVEL').AsInteger;
              qryRecebedor.FieldByName('FLGADMPREV').AsInteger     := 1;
              qryRecebedor.FieldByName('FLGIMOBILIARIO').AsInteger := 0;
              qryRecebedor.FieldByName('FLGATIVOFIXO').AsInteger   := 0;
              qryRecebedor.Post;
              bRecebProprioNovo := True;
           end;
        end; // with
     end;

     //Darivaldo Alencar SIG25312 -inicio
    if (qryBenef.fieldbyname('OBSERVACAO').asString <> emptyStr) then
      begin
        ExecutarQuery(qryBeneficio2,' UPDATE BENEFBFCIARIO SET OBSERVACAO = ' + QuotedStr(qryBenef.fieldbyname('OBSERVACAO').asString) +
                                    ' WHERE IDPESSOA   = '+  sIdPessoa +
                                    ' AND IDPLANOPREV  = '+ sIdPlanoPrev );
      end;
    //Darivaldo Alencar SIG25312 -fim
  end;

end;

procedure TfrmCadDepenBenef.AtualizaDadosTitular;
var
  sTot_IRRF,
  sTot_SalF,
  sTot_Dep  :Integer;
  lssql: string;
begin
  //
  With qryAux Do
  Begin
    Sql.Clear;
    Sql.Add(
    ' SELECT SUM(FLGCONTAIMPOSTOR) TOT_IRRF, '+
    '        SUM(FLGCONTASALARIOF) TOT_SALF, COUNT(*) TOT_DEP'+
    ' FROM   DEPENTIT '+
    ' WHERE IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString+
    ' AND 	IDDEPENDENCIA <> ''PRP'' ');
    Open;
    sTot_IRRF := FieldByName('TOT_IRRF').AsInteger;
    sTot_SalF := FieldByName('TOT_SALF').AsInteger;
    sTot_Dep  := FieldByName('TOT_DEP').AsInteger;

    Sql.Clear;
    Sql.Add(
    ' UPDATE PESSOAFISICA SET ' +
    '  NUMDEPIRRF = '+IntToStr(sTot_IRRF)+
    ' ,NUMDEPSALF = '+IntToStr(sTot_SalF)+
    ' ,NUMDEPTOT  = '+IntToStr(sTot_Dep)+
    ' WHERE IDPESSOA = '+qry.FieldByName('IDPESSOA').AsString);
    Try
      ExecSql
    Except
      raise;
    End;
  End;

  lssql:=
    'SELECT DT.IDPESSOA, '+#13#10+
    '       COUNT(DP.IDPESSOA)              IDDEPENDENTE, '+#13#10+
    '       NVL(SUM(DP.FLGCONTAIMPOSTOR),0) TOT_IRRF, '+#13#10+
    '       NVL(SUM(DP.FLGCONTASALARIOF),0) TOT_SALF, '+#13#10+
    '       COUNT(DP.IDPESSOA)              TOT_DEP '+#13#10+
    'FROM DEPENTIT DT, DEPENTIT DP '+#13#10+
    'WHERE DT.IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString+' '+#13#10+
    'AND DT.IDDEPENDENCIA <> ''PRP'' '+#13#10+
    'AND DP.IDTITULAR(+) = DT.IDPESSOA '+#13#10+
    'GROUP BY DT.IDPESSOA';

  qryaux.sql.clear;
  qryaux.sql.add(lssql);
  qryaux.open;

  If qryaux.fieldbyname('IDDEPENDENTE').AsInteger > 0
   Then
        while not qryaux.eof do
        begin
          sTot_IRRF:=qryaux.fieldbyname('TOT_IRRF').AsInteger;
          sTot_SalF:=qryaux.fieldbyname('TOT_SALF').AsInteger;
          sTot_Dep:=qryaux.fieldbyname('TOT_DEP').AsInteger;

          qryAux2.sql.clear;
          qryAux2.sql.add(
            'UPDATE PESSOAFISICA '+#13#10+
            'SET NUMDEPIRRF = '+IntToStr(sTot_IRRF)+','+#13#10+
            '    NUMDEPSALF = '+IntToStr(sTot_SalF)+','+#13#10+
            '    NUMDEPTOT  = '+IntToStr(sTot_Dep)+#13#10+
            'WHERE IDPESSOA = '+qryAux.FieldByName('IDPESSOA').asstring);
          try
            qryAux2.execsql;
          except
            raise;
          end;
          qryaux.next;
        end;

end;

procedure TfrmCadDepenBenef.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   if not PatroPermiteAlterarDados( qry.FieldByName('IDPESSJUR').AsInteger,
                                    qry.FieldByName('IDPESSOA').AsInteger)
   then begin
      sbtnAlterar.Enabled := False;
      sbtnApagar.Enabled  := False;
   end
   else begin
      sbtnAlterar.Enabled := (Not qry.IsEmpty);
      sbtnApagar.Enabled  := (Not qry.IsEmpty);
   end;
end;

procedure TfrmCadDepenBenef.SelecionaDependente(pIdPessoa, pIdPessJur, pIdPlanoPrev: String);
var pIdDepBen : string;
begin
  //
  edPaiDetalhe.Text := '';

  if pIdPessoa <> '' then
  begin
    qry.Close;
    if not qry.Prepared then qry.prepare;

    qry.ParamByName('IDPESSOA').Value    := StrToInt(pIdPessoa);
    qry.ParamByName('IDPESSJUR').Value   := StrToInt(pIdPessJur);
    If pIdPlanoPrev <> '' Then
      qry.ParamByName('IDPLANOPREV').Value := StrToInt(pIdPlanoPrev)
    Else qry.ParamByName('IDPLANOPREV').Clear;


    qry.Open;

    //Renato Visoni SOL 152058 Kintana 1136987
    qryplano.Close;
    qryplano.ParamByname('IDTITULAR').asInteger := strToint(pIdPessoa);        //edilaine - SIG25312
    qryplano.Open;
    //Renato Visoni SOL 152058 Kintana 1136987

    qryDet.Close;
    if not qryDet.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryDet.Open;

    qryPessoa.Close;
    if not qryPessoa.Prepared then qryPessoa.prepare;
    qryPessoa.ParamByName('IDPESSOA').Value := StrToInt(pIdPessoa);
    qryPessoa.Open;

    qryPF.Close;
    if not qryPF.Prepared then qryPF.prepare;
    qryPF.ParamByName('IDPESSOA').Value := StrToInt(pIdPessoa);
    qryPF.Open;

    qryDepen.Close;
    if not qryDepen.Prepared then qryDepen.prepare;
    qryDepen.ParamByName('IDPESSOA').Value := StrToInt(pIdPessoa);
    qryDepen.Open;



//  Filtra por Dependente
    If qryBciario.Active Then
     Begin
      qryBciario.Filtered := False;

      if trim(qryDet.FieldByName('IDPESSOA').AsString) <> '' then
         qryBciario.Filter   := 'IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString;
      qryBciario.Filtered := True;
     End;
//

    qryEndPess.Close;
    if not qryEndPess.Prepared then qryEndPess.prepare;
    qryEndPess.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryEndPess.Open;

    //edilaine - SIG5312 - inicio
    qryTelefone.Close;
    if not qryTelefone.Prepared then qryTelefone.prepare;
    qryTelefone.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryTelefone.Open;

    qryContato.Close;
    if not qryContato.Prepared then qryContato.prepare;
    qryContato.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryContato.Open;

    qryRamal.Close;
    if not qryRamal.Prepared then qryRamal.prepare;
    qryRamal.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryRamal.Open;

    QryCbancoPref.Close;
    if not QryCbancoPref.Prepared then QryCbancoPref.prepare;
    QryCbancoPref.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    QryCbancoPref.Open;

    qryPF2.close;
    if not qryPF2.Prepared then qryPF2.prepare;
    qryPF2.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryPF2.Open;
    //edilaine - SIG5312 - fim

    qryCBanco.Close;
    if not qryCBanco.Prepared then qryCBanco.prepare;
    qryCBanco.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryCBanco.Open;

    qryBenef.Close;
    if not qryBenef.Prepared then qryBenef.prepare;
    qryBenef.ParamByName('IDTITULAR').Value   := StrToInt(pIdPessoa);
    qryBenef.ParamByName('IDPLANOPREV').Value := StrToInt(pIdPlanoPrev); // Felipe A. Santos SOL 264722 PPM 1152948
    qryBenef.Open;

    qrySeq.Close;
    if not qrySeq.Prepared then qrySeq.prepare;
    qrySeq.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qrySeq.Open;
    iSeq := qrySeq.FieldByName('PROXNUMSEQ').AsInteger;
    qrySeq.Close;

// Abre Tabela de Nucleo Familiar, Buscando pelo Titular.
    QryNucleoFam.Close;
    if not QryNucleoFam.Prepared then QryNucleoFam.prepare;
    QryNucleoFam.ParamByName('IDTITULAR').AsInteger         := StrToInt(pIdPessoa);
    QryNucleoFam.Open;
//--*

// Abre Consulta de Imagen do documento
    QryImagensDoc.Close;
    QryImagensDoc.ParamByName('IDPESSOA').AsInteger := StrToInt(pIdPessoa);
    QryImagensDoc.Open;

    QrySubTipo.Close;
    QrySubTipo.ParamByName('IDPESSOA').AsInteger := StrToInt(pIdPessoa);
    QrySubTipo.Open;
//--*

    qryRecebedor.Close;
    qryRecebedor.ParamByName('IDRESPONSAVEL').AsInteger := -1;
    qryRecebedor.Open;

    qryDepBen.Close;
    if not qryDepBen.Prepared then qryDepBen.prepare;
    qryDepBen.ParamByName('IDTITULAR').Value := StrToInt(pIdPessoa);
    qryDepBen.Open;


    //Renato Visoni SOL 143320 Kintana 928515
    qryDepBenPessoa.Filtered := False;
    qryDepBenPessoa.Filter := '';
    //Renato Visoni SOL 143320 Kintana 928515

    qryDepBenPessoa.Close;
    if not qryDepBenPessoa.Prepared then qryDepBenPessoa.prepare;
    qryDepBenPessoa.ParamByName('IDPESSOA').Value := StrToInt(pIdPessoa);
    qryDepBenPessoa.Open;


    //Renato Visoni SOL 143320 Kintana 928515
    qryDepBenPF.Filtered := False;
    qryDepBenPF.Filter := '';
    //Renato Visoni SOL 143320 Kintana 928515

    qryDepBenPF.Close;
    if not qryDepBenPF.Prepared then qryDepBenPF.prepare;
    qryDepBenPF.ParamByName('IDPESSOA').Value := StrToInt(pIdPessoa);
    qryDepBenPF.Open;

    //Início - William Santana SOL 161550 KIN 1717512
    CarregaDadosRepresentanteLegal();

    //Renato Visoni SOL 143320 Kintana 928515
    qryDepBenDepen.Filtered := False;
    qryDepBenDepen.Filter := '';
    //Renato Visoni SOL 143320 Kintana 928515
    qryDepBenDepen.Close;
    if not qryDepBenDepen.Prepared then qryDepBenDepen.prepare;
    qryDepBenDepen.ParamByName('IDPESSOA').Value := StrToInt(pIdPessoa);
    qryDepBenDepen.Open;

    qrySeq.Close;
    if not qrySeq.Prepared then qrySeq.prepare;
    qrySeq.ParamByName('IDTITULAR').Value := qryDet.FieldByName('IDPESSOA').AsInteger;
    qrySeq.Open;
    iSeqDepBen := qrySeq.FieldByName('PROXNUMSEQ').AsInteger;
    qrySeq.Close;

    // Felipe A. Santos SOL 222744 PPM 398216 - inicio

    if qryDepeNaoCadastrado.isEmpty then//William Moreira da Silva - SOL 234561 PPM 438782
    begin
         qryDepeNaoCadastrado.Close;
         if not qryDepeNaoCadastrado.Prepared then qryDepeNaoCadastrado.prepare;
         qryDepeNaoCadastrado.ParamByName('PIDTITULAR').AsInteger := StrToInt(pIdPessoa);
         qryDepeNaoCadastrado.open;
    end;//William Moreira da Silva - SOL 234561 PPM 438782
    // Felipe A. Santos SOL 222744 PPM 398216 - fim

    bRecebProprioNovo := False;
    bResponsaProprioNovo  := False;
    bInseriuRecebProprio := False;

    edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;

    AjustaGridDependentes(wwDBTpDepen.value); //edilaine - SIG 25312
  End;
end;



procedure TfrmCadDepenBenef.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  WindowState := wsNormal;
end;



procedure TfrmCadDepenBenef.MudaDocumento;
var
  sMask : String;//Darivaldo Alencar SIG 33695
begin
  if edDocNumDocumento.Enabled = False then edDocNumDocumento.Enabled := true;

  //if (bbtnCancelar.Enabled = true) and (bbtnConfirmar.Enabled = False) then bbtnConfirmar.Enabled := true; //Darivaldo Alencar SIG25312

  with qryDocumento do
  begin
    if Active then
    begin
      Locate('IDDOCUMENTO', Integer(lstDocumentos.Selected.Data),[]);
      qryImagensDoc.Locate('IDIMAGEM', FieldByName('IDIMAGEM').AsFloat,[]);

      // André Pontes - pendência 26492 - 17/12/2007
      // Retirada a habilitação do campo do CPF e do botão confirmar

      FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
      //Darivaldo Alencar - SIG 33695 inicio
      //      pnlEmissao.Visible                   := (FieldByName('OBRIGAEMISSAO').AsString     = 'S') ;
      //      pnlUF.Visible                        := (FieldByName('OBRIGAUF').AsString          = 'S');
      //      pnlOrgao.Visible                     := (FieldByName('OBRIGAORGAO').AsString       = 'S');
      //      PnlValidade.Visible                  := (FieldByName('FLGOBRIGAVALIDADE').AsString = 'S');
      //      //Higor Nayde Nº SOL250389/17574 NºPPM992385
      //      pnlCategoria.Visible                 := (FieldByName('OBRIGACATG').AsString          = 'S');
      //      pnlDataHabilitacao.Visible           := (FieldByName('OBRIGAPRMHAB').AsString     = 'S');
      //      //Higor Nayde Nº SOL250389/17574 NºPPM992385
      pnlEmissao.Visible         := (FieldByName('EXIBEEMISSAO').AsString = 'S') ;
      pnlUF.Visible              := (FieldByName('EXIBEUF').AsString = 'S');
      pnlOrgao.Visible           := (FieldByName('EXIBEORGAO').AsString = 'S');
      PnlValidade.Visible        := (FieldByName('EXIBEVALIDADE').AsString = 'S');
      pnlCategoria.VIsible       := (FieldByName('EXIBECATG').AsString = 'S');
      pnlDataHabilitacao.VIsible := (FieldByName('EXIBEPRMHAB').AsString = 'S');
      pnlPais.VIsible            := (FieldByName('EXIBEPAIS').AsString = 'S');
      //Darivaldo Alencar - SIG 33695 fim


      pnlTipoDocumento.Visible := (FieldByName('FLGMULTIPLAMASCARA').AsString = 'S');
      if (FieldByName('FLGMULTIPLAMASCARA'). AsString = 'S') then
         begin
            if (FieldByName('IDTIPODOCPESSOAXMASC').asString <> EmptyStr) then
               begin
                   qryTipoDocumento.Locate('IDTIPODOCPESSOAXMASC',FieldByName('IDTIPODOCPESSOAXMASC').asString,[]);
                   dbcmbTipoDocumento.text := qryTipoDocumento.FieldByName('Nome').asString;
                   if ((FieldByName('IDTIPODOCPESSOAXMASC').asString) <> EmptyStr ) then
                      sMask := SelMascara(FieldByName('IDDOCUMENTO').asString,FieldByName('IDTIPODOCPESSOAXMASC').asString);
                   SelMascara(FieldByName('IDDOCUMENTO').AsString,EmptyStr);
               end
               else
               begin
                     dbcmbTipoDocumento.LookupValue := ' ';
                     dbcmbTipoDocumento.text := ' ';
               end;
         end;

         if bTtravarCadastro then
            begin
                 if  (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Identidade') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cart. Indentidade Profissional') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Trabalho') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cert Milit -Serie/CSM/RMDN/Cat') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cert Militar - Tipo/Numero') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'CPF') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'CRC') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Dt. Instr. Part. Contratual') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Matricula Caixa') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Matricula Funcef') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'MIBA') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'NUMERO DO AVISO DE RECEBIMENTO') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'PIS/PASEP') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Registro de Aposentadoria') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Titulo de Eleitor - Numero') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Titulo de Eleitor - Zona/Secao') then
                 begin
                   edDocNumDocumento.Enabled:= False;
                   PintarCampos([edDocNumDocumento], clGray);

                   if  qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Identidade' then
                   begin
                     wwDBEdit1.Enabled:= False;
                     dbcmbEstadoDoc.Enabled:= False;
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2], clGray);
                   end;

                   if  qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cart. Indentidade Profissional' then
                   begin
                     wwDBEdit1.Enabled:= False;
                     dbcmbEstadoDoc.Enabled:= False;
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2], clGray);
                   end;

                   if qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Trabalho' then
                   begin
                     dbcmbEstadoDoc.Enabled:= False;
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([dbcmbEstadoDoc, CMDateTimePicker2], clGray);
                   end;

                   if (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'NUMERO DO AVISO DE RECEBIMENTO') or
                      (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'PIS/PASEP') then
                   begin
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([CMDateTimePicker2], clGray);
                   end;
                 end
                 else
                 begin
                   edDocNumDocumento.Enabled:= true;
                   wwDBEdit1.Enabled:= True;
                   dbcmbEstadoDoc.Enabled:= True;
                   CMDateTimePicker2.Enabled:= True;
                   PintarCampos([edDocNumDocumento, wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2], clWindow);
                 end;
            end;



    end;
  end;
end;



procedure TfrmCadDepenBenef.MostraDocumento;
begin
  lstDocumentosChange(self, lstDocumentos.Selected, ctState);

  if CmeCadastro.Operacao in [opInserir,opAlterar] then qryDocumento.Edit;
  AssociaImagem(dsImagensDoc, TBlobField(qryImagensDocIMAGEM), TFloatField(qryDocumentoIDIMAGEM), lstDocumentos.Selected.Caption );
  if CmeCadastro.Operacao in [opInserir,opAlterar] then qryDocumento.Post;
  if qryDocumentoIDIMAGEM.IsNull then
  begin
    lstDocumentos.Selected.ImageIndex := 0;
    if (qryDocumentoNUMDOCUMENTO.AsString = 'Não informado') and
      (CmeCadastro.Operacao in [opInserir,opAlterar]) then
    begin
      qryDocumento.Edit;
      qryDocumentoNUMDOCUMENTO.Clear;
      qryDocumento.Post;
    end;
  end else
  begin
    lstDocumentos.Selected.ImageIndex := 1;
    if (TRIM(qryDocumentoNUMDOCUMENTO.AsString) = '') and
      (CmeCadastro.Operacao in [opInserir,opAlterar]) then
    begin
      qryDocumento.Edit;
      if TRIM(qryDocumentoMASCARA.AsString) = '' then
        qryDocumentoNUMDOCUMENTO.AsString := 'Não informado'
      else qryDocumentoNUMDOCUMENTO.AsString := '0';
      qryDocumento.Post;
    end;
  end;
  lstDocumentos.Selected.SubItems[0] := qryDocumentoNUMDOCUMENTO.AsString;
end;

procedure TfrmCadDepenBenef.InsereDocumento;
begin
  if (qry.State <> dsInactive) then
  begin
    qryTipoDoc.First;
    while not qryTipoDoc.eof do
    with qryDocumento do
    begin
      if not qryDocumento.Locate('IDDOCUMENTO',qryTipoDocIDDOCUMENTO.AsFloat,[]) then
      begin
        Insert;
        qryDocumentoIDDOCUMENTO.AsFloat    := qryTipoDocIDDOCUMENTO.AsFloat;
        qryDocumentoNOMEDOCUMENTO.AsString := qryTipoDocNOMEDOCUMENTO.AsString;
        qryDocumentoMASCARA.AsString       := qryTipoDocMASCARA.AsString;
        qryDocumentoOBRIGAUF.AsString      := qryTipoDocOBRIGAUF.AsString;
        qryDocumentoOBRIGAORGAO.AsString   := qryTipoDocOBRIGAORGAO.AsString;
        qryDocumentoOBRIGAEMISSAO.AsString := qryTipoDocOBRIGAEMISSAO.AsString;
        qryDocumentoOBRIGAPRMHAB.AsString := qryTipoDocOBRIGAPRMHAB.AsString;
        qryDocumentoOBRIGACATG.AsString := qryTipoDocOBRIGACATG.AsString;
        qryDocumentoIDPESSOA.AsFloat       := qryIDPESSOA.AsFloat;
        qryDocumentoFLGOBRIGAVALIDADE.AsString := qryTipoDocFLGOBRIGAVALIDADE.AsString;

        // Início - Darivaldo Alencar - SIG 33695
        qryDocumento.FieldByName('EXIBEUF').AsString           := qryTipoDoc.FieldByName('EXIBEUF').AsString;
        qryDocumento.FieldByName('EXIBEORGAO').AsString        := qryTipoDoc.FieldByName('EXIBEORGAO').AsString;
        qryDocumento.FieldByName('EXIBEEMISSAO').AsString      := qryTipoDoc.FieldByName('EXIBEEMISSAO').AsString;
        qryDocumento.FieldByName('EXIBEVALIDADE').AsString     := qryTipoDoc.FieldByName('EXIBEVALIDADE').AsString;
        qryDocumento.FieldByName('EXIBEPRMHAB').AsString       := qryTipoDoc.FieldByName('EXIBEPRMHAB').AsString;
        qryDocumento.FieldByName('EXIBECATG').AsString         := qryTipoDoc.FieldByName('EXIBECATG').AsString;
        qryDocumento.FieldByName('EXIBEPAIS').AsString         := qryTipoDoc.FieldByName('EXIBEPAIS').AsString;
        qryDocumento.FieldByName('OBRIGAPAIS').AsString        := qryTipoDoc.FieldByName('OBRIGAPAIS').AsString;
        qryDocumento.FieldByName('FLGMULTIPLAMASCARA').AsString:= qryTipoDoc.FieldByName('FLGMULTIPLAMASCARA').AsString;
        Post;
        // Término - Darivaldo Alencar - SIG 33695
      end;
    qryTipoDoc.next;
  end;
  end;
end;

procedure TfrmCadDepenBenef.AssociaImagem(ds: TwwDataSource;
  pImagem: TBlobField; Campo: TFloatField; Descricao: string);
var frmImgDoc : TfrmImagemDoc;
begin
  try
    Application.CreateForm(tfrmImagemDoc, frmImgDoc);
    with frmImgDoc do
    begin
      dsImagem := ds;
      Imagem   := pImagem;
      CampoPai := Campo;
      bbtnAssociar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
      bbtnLimpar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
      Caption := Descricao;
      ShowModal;
    end;
  finally
    frmImgDoc.free;
  end;
end;

procedure TfrmCadDepenBenef.Ramal(Alteracao: integer);
begin

end;

function TfrmCadDepenBenef.Grava(bApagaFilhos: Boolean): integer;
begin
  qryRamal.Filtered := false;
  //qryTelefone.Filtered := false; Darivaldo Alencar SIG25312
  try
    // Não grava documento em branco
    with qryDocumento do
    begin
      first;
      while not eof do
      begin
        if TRIM(FieldByName('NUMDOCUMENTO').AsString) = '' then
        begin
          if qryImagensDoc.Locate('IDIMAGEM',FieldByName('IDIMAGEM').AsFloat,[]) then
            qryImagensDoc.Delete;
          delete;
        end else
        begin
          Edit;
          if State in [dsEdit] then
          begin
            FieldByName('IDPESSOA').AsFloat := qryDet.FieldByName('IDPESSOA').AsFloat;
            Post;
          end;
          next;
        end;
      end;
      First;

      Result := 0;
    end;
  except on EDBEngineError do
    begin
      qry.Edit;
      qrySubTipo.Edit;
      raise;
    end;
  end;
  qryRamal.Filtered := true;
  //qryTelefone.Filtered := true; //Darivaldo Alencar SIG25312
end;

procedure TfrmCadDepenBenef.AtuDocumentos;
var li : TListItem;
begin
  with qryDocumento do
  begin
    lstDocumentos.Onchange := nil;
    lstDocumentos.Items.clear;
    First;
    while not eof do
    begin
      li := lstDocumentos.Items.Add;
      li.Caption := FieldByName('NOMEDOCUMENTO').AsString;
      li.Data := TObject(FieldByName('IDDOCUMENTO').AsInteger);
      if FieldByName('IDIMAGEM').IsNull then
      begin
        li.ImageIndex := 0;
      end else
      begin
        li.ImageIndex := 1;
      end;
      FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
      edDocNumDocumento.SelectAll;
      li.SubItems.Add(edDocNumDocumento.SelText);
      edDocNumDocumento.ClearSelection;
      next;
    end;
    if recordcount > 1 then
    begin
      lstDocumentos.OnChange := lstDocumentosChange;
      lstDocumentos.Items[0].Selected := true;
      lstDocumentos.Items[0].Focused := true;
    end;
  end;
end;

procedure TfrmCadDepenBenef.AtuTipo;
begin
  inherited;
  if not qry.IsEmpty then
    if qryTIPO.AsString = 'F' then
      Pessoa.EJuridica := false
    else Pessoa.EJuridica := true;
  MudaTipo;
  InsereDocumento;
  AtuDocumentos;
end;

procedure TfrmCadDepenBenef.MudaTipo;
begin
  If qryTipoDoc.Active Then qryTipoDoc.Close;
  qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString := 'F';
  qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'F';
  qryTipoDoc.Close;
  qryTipoDoc.Open;
  qryDocumento.Close;
  qryDocumento.Open;

end;


procedure TfrmCadDepenBenef.lstDocumentosChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  inherited;
  if Item.Selected then MudaDocumento;
end;



procedure TfrmCadDepenBenef.lstDocumentosDblClick(Sender: TObject);
begin
  inherited;
  MostraDocumento;
 edDocNumDocumento.Enabled := true
end;



procedure TfrmCadDepenBenef.edDocNumDocumentoExit(Sender: TObject);
var
  sMsg : string;
begin
  inherited;

// -----------------------------------------------------------------------------------------------
  // André Pontes - pendência 26492 - 17/12/2007
  if CmeCadastro.Operacao in [opInserir, opAlterar] then
  begin
    if qryDocumento.FieldByName('IDDOCUMENTO').AsInteger = qryGlobalDOCPFISICA.AsInteger then
    begin
      if (qryDocumento.state in[dsEdit,dsInsert])then begin //Darivaldo Alencar SIG25312
        sMsg := 'Confirma alteração do CPF do beneficiário?';

        if MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
          edDocNumDocumento.Text                            := sDocumentoAnt;
          qryDocumento.FieldByName('NUMDOCUMENTO').AsString := sDocumentoAnt;   // Fernando Santana SOL 135535 KINTANA 810963
        end
        else
        begin
          if trim(edDocNumDocumento.text) = '' then
             qryDocumento.FieldByName('NUMDOCUMENTO').AsString := '';

            // Fernando Santana SOL 135535 KINTANA 810963
          if qryPessoa.locate('idpessoa',qrydet.fieldbyname('idpessoa').value,[]) then;
          begin
            if not(qryPessoa.State in dsEditModes) then qryPessoa.Edit;
            qryPessoa.FieldByName('NUMDOCUMENTO').AsString    := qryDocumento.FieldByName('NUMDOCUMENTO').AsString;
            qryPessoa.Post;
          end;
        end;
      end;
    end;
  end;
  // FIM André Pontes - pendência 26492 - 17/12/2007
  // -----------------------------------------------------------------------------------------------


  if lstDocumentos.Selected <> nil then
  begin
    edDocNumDocumento.SelectAll;
    lstDocumentos.Selected.SubItems[0] := edDocNumDocumento.SelText;
    edDocNumDocumento.ClearSelection;
  end;

  if bbtnConfirmar.focused then
     bbtnConfirmar.Click;
end;



procedure TfrmCadDepenBenef.dbcmbEstadoDocChange(Sender: TObject);
begin
//Darivaldo Alencar SIG 33695 -inicio
//  inherited;
//  with qryDocumento do
//    if not (State in [dsInactive,dsBrowse]) then
//      FieldByname('IDPAIS').AsFloat := qryEstadoIDPAIS.AsFloat;
//Darivaldo Alencar SIG 33695 -fim
end;



procedure TfrmCadDepenBenef.btnAssociarimgPessoaClick(Sender: TObject);
begin
  inherited;
  AssociaImagem(dsImagem, TBlobField(qryImagemIMAGEM), TFloatField(qryIDIMAGEM), 'Foto');
end;



procedure TfrmCadDepenBenef.PessoaChangePessoa(IdPessoa: Integer);

  procedure MudaQry(pqry:TwwQuery);
  begin
    with pqry do
    begin
      if (pqry.Active) and (pqry.CachedUpdates) then CancelUpdates;
      ParamByName('IdPessoa').AsFloat := IdPessoa;
      Close;
      Open;
    end;
  end;

begin
  MudaQry(qrySubTipo);
  MudaQry(qryImagem);
  MudaQry(qryImagensDoc);
  MudaQry(qryDocumento);
  MudaQry(qryEndereco);
  //MudaQry(qryTelefone);    //edilaine - SIG25312
  //MudaQry(qryContato);     //edilaine - SIG25312
  //MudaQry(qryRamal);       //edilaine - SIG25312
  MudaQry(qryReprLegal);  //William Santana SOL 161550 KIN 1717512
  MudaQry(qryLogReprLegal); //William Santana SOL 161550 KIN 1717512
  Pessoa.ChangeSubtipo(IdPessoa);
  AtuTipo;
  tbcDetalheChange(tbcDetalhe);
end;



procedure TfrmCadDepenBenef.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  try
     if (not qrySubTipo.IsEmpty) then qrySubTipo.Delete;

     Grava(True);

     Pessoa.ChangePessoa(0);
  except
     Raise;
  end;

end;

procedure TfrmCadDepenBenef.dsImagemDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Pessoa.MostraFoto then
  Begin
     imgPessoa.Left := 0;
     imgPessoa.Top := 0;

     if (Field = nil) then
        if qryImagemIMAGEM.IsNull then
        Begin
           imgPessoa.Visible := false;
           imgPessoa.Width := 0;
           imgPessoa.Height := 0;
        End
        else
        Begin
           imgPessoa.Width := imgPessoa.Picture.Width + 2;
           imgPessoa.Height := imgPessoa.Picture.Height + 2;
           imgPessoa.Visible := true;
        End;
  End;

end;

procedure TfrmCadDepenBenef.cmbEstCivChange(Sender: TObject);
begin
  inherited;
  //Início - William Santana - SOL 209384/15928 KIN 2062832
  {
  if trim(cmbEstCiv.text) = '' then
     sEstCiv := ''
  else if trim(cmbEstCiv.text) = 'Solteiro(a)' then
     sEstCiv := 'S'
  else if trim(cmbEstCiv.text) = 'Casado(a) ou Equiparado(a)' then
     sEstCiv := 'C'
  else if trim(cmbEstCiv.text) = 'Divorciado(a)' then
     sEstCiv := 'D'
  else if trim(cmbEstCiv.text) = 'Desquitado(a)' then
     sEstCiv := 'E'
  else if trim(cmbEstCiv.text) = 'Separado(a) Judicial' then
     sEstCiv := 'J'
  else if trim(cmbEstCiv.text) = 'Viúvo(a)' then
     sEstCiv := 'V'
  else if trim(cmbEstCiv.text) = 'Marital' then
     sEstCiv := 'M'
  else if trim(cmbEstCiv.text) = 'Separado(a)' then
     sEstCiv := 'P'
  else if trim(cmbEstCiv.text) = 'Outros' then
     sEstCiv := 'O';
  }
  //Término - William Santana - SOL 209384/15928 KIN 2062832
  bReterBenEstCivil :=  VerElegBen(2);
end;

procedure TfrmCadDepenBenef.chkTipoTelefoneClick(Sender: TObject);
var
   sTipo : string;
begin
  inherited;
  if (qryTelefone.State in [dsInsert,dsEdit]) then
  begin
       sTipo := '';
       if chkTipoTelefone.Checked[0] then
          sTipo := sTipo + 'C';
       if chkTipoTelefone.Checked[1] then
          sTipo := sTipo + 'P';
       if chkTipoTelefone.Checked[2] then
          sTipo := sTipo + 'F';
       if chkTipoTelefone.Checked[3] then
          sTipo := sTipo + 'L';
       if chkTipoTelefone.Checked[4] then
          sTipo := sTipo + 'R';

       if sTipo = '' then
       begin
            chkTipoTelefone.State[0] := cbChecked;
            sTipo := 'C';
       end;
       qryTelefoneTIPO.AsString := sTipo;
  end;
end;

procedure TfrmCadDepenBenef.qryTelefoneCalcFields(DataSet: TDataSet);
begin
  inherited;

  with qryTelefone do
  begin
      if Pos('C', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TComercial').AsString := 'Sim'
      else
         FieldByName('TComercial').AsString := '';

      if Pos('P', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TParticular').AsString := 'Sim'
      else
         FieldByName('TParticular').AsString := '';

      if Pos('F', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TFax').AsString := 'Sim'
      else
         FieldByName('TFax').AsString := '';

      if Pos('L', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TCelular').AsString := 'Sim'
      else
         FieldByName('TCelular').AsString := '';

      if Pos('R', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TRecado').AsString := 'Sim'
      else
         FieldByName('TRecado').AsString := '';
  end;
end;

procedure TfrmCadDepenBenef.dsTelefoneDataChange(Sender: TObject;
  Field: TField);
var
   i : integer;
   sTipo : string;
begin
   inherited;

   if (Field = nil) or (Field = qryTelefoneTIPO) then
   begin
        // Atualiza os campos de tipo de telefone
        for i := 0 to chkTipoTelefone.Items.Count-1 do
            chkTipoTelefone.State[i] := cbUnChecked;

        sTipo := TRIM(qryTelefoneTIPO.AsString);
        for i := 1 to LENGTH(sTipo) do begin
            if 'C' = Copy(sTipo,i,1) then
               chkTipoTelefone.State[0] := cbChecked;
            if 'P' = Copy(sTipo,i,1) then
               chkTipoTelefone.State[1] := cbChecked;
            if 'F' = Copy(sTipo,i,1) then
               chkTipoTelefone.State[2] := cbChecked;
            if 'L' = Copy(sTipo,i,1) then
               chkTipoTelefone.State[3] := cbChecked;
            if 'R' = Copy(sTipo,i,1) then
               chkTipoTelefone.State[4] := cbChecked;
        end;
   end;
end;

procedure TfrmCadDepenBenef.qryPFAfterScroll(DataSet: TDataSet);
begin
  inherited;
 if qryPf.FieldByName('FLGISENTOIRRF').AsString = '1' then
  begin
    wwDBCBIsentoIrrf.Enabled := True;
  end
  else
  begin
    wwDBCBIsentoIrrf.Enabled := False;
  end;
  //Início - William Santana - 209384/15928 KIN 2062832
  {
  if qryPF.fieldbyname('ESTCIVIL').AsString = '' then
  begin
     cmbEstCiv.itemindex := -1;
     cmbEstCiv.text := '';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'S' then
  begin
     cmbEstCiv.itemindex := 0;
     cmbEstCiv.text := 'Solteiro(a)';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'C' then
  begin
     cmbEstCiv.itemindex := 1;
     cmbEstCiv.text := 'Casado(a) ou Equiparado(a)';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'D' then
  begin
     cmbEstCiv.itemindex := 2;
     cmbEstCiv.text := 'Divorciado(a)';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'E' then
  begin
     cmbEstCiv.itemindex := 3;
     cmbEstCiv.text := 'Desquitado(a)';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'J' then
  begin
     cmbEstCiv.itemindex := 4;
     cmbEstCiv.text :=  'Separado(a) Judicial';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'V' then
  begin
     cmbEstCiv.itemindex := 5;
     cmbEstCiv.text :=  'Viúvo(a)';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'M' then
  begin
     cmbEstCiv.itemindex := 6;
     cmbEstCiv.text := 'Marital';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'P' then
  begin
     cmbEstCiv.itemindex := 7;
     cmbEstCiv.text := 'Separado(a)';
  end
  else if qryPF.fieldbyname('ESTCIVIL').AsString = 'O' then
  begin
     cmbEstCiv.itemindex := 8;
     cmbEstCiv.text := 'Outros';
  end;
  }

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO FROM ESTADOCIVIL WHERE ESTCIVIL = '+quotedStr(qryPF.fieldbyname('ESTCIVIL').AsString) );
  qryAux.Open;
  cmbEstCiv.text := qryAux.fieldbyname('DESCRICAO').AsString;
  //Término - William Santana - 209384/15928 KIN 2062832

  if qrydet.FieldByName('TIPOISENCAOIRRF').AsString = '2' then
  begin
    BitBtnHistorico.Enabled := True;
    dbrgrpMolestiaGrave.Visible := true;
    //dbrgrpMolestiaGrave.Enabled := true; //Taffarel - SIG68507/71228
  end
  else
  begin
    BitBtnHistorico.Enabled := False;
    //dbdtMolestiaGrave.text := ''; //Taffarel - SIG68507/71228
    //CMDateTimePicker5.text := ''; //Taffarel - SIG68507/71228
    dbrgrpMolestiaGrave.Visible := False;
    dbrgrpMolestiaGrave.Enabled := False;
  end;
    {
  If qryPF.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
    begin
      dbrgrpIsentoIR.ItemIndex := 1;
      qryPF.FieldByName('FLGISENTOIRRF').AsInteger    := 0;
      qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
      BitBtnHistorico.Enabled     := False;
      dbrgrpMolestiaGrave.Visible := False;//higor
      dbrgrpMolestiaGrave.Enabled := False
    end;
   }
  sEstCiv := qryPF.fieldbyname('ESTCIVIL').AsString;
  SDataAnt :=  qryPF.fieldbyname('DATANASC').AsString; // Renato Visoni SOL 130508/4762 kintana 1269185
end;

//Início - William Santana - SOL 209384/15928 KIN 2062832
{
procedure TfrmCadDepenBenef.cmbEstCivDepBenChange(Sender: TObject);
begin
  inherited;
  if trim(cmbEstCivDepBen.text) = '' then
     sEstCivDepBen := ''
  else if trim(cmbEstCivDepBen.text) = 'Solteiro(a)' then
     sEstCivDepBen := 'S'
  else if trim(cmbEstCivDepBen.text) = 'Casado(a) ou Equiparado(a)' then
     sEstCivDepBen := 'C'
  else if trim(cmbEstCivDepBen.text) = 'Divorciado(a)' then
     sEstCivDepBen := 'D'
  else if trim(cmbEstCivDepBen.text) = 'Desquitado(a)' then
     sEstCivDepBen := 'E'
  else if trim(cmbEstCivDepBen.text) = 'Separado(a) Judicial' then
     sEstCivDepBen := 'J'
  else if trim(cmbEstCivDepBen.text) = 'Viúvo(a)' then
     sEstCivDepBen := 'V'
  else if trim(cmbEstCivDepBen.text) = 'Marital' then
     sEstCivDepBen := 'M'
  else if trim(cmbEstCivDepBen.text) = 'Separado(a)' then
     sEstCivDepBen := 'P'
  else if trim(cmbEstCivDepBen.text) = 'Outros' then
     sEstCivDepBen := 'O';


end;
}
//Término - William Santana - SOL 209384/15928 KIN 2062832

procedure TfrmCadDepenBenef.qryDepBenPFAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //Início - WIlliam Santana - SOL 209384/15928 KIN 2062832
  {
  if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = '' then
  begin
     cmbEstCivDepBen.itemindex := -1;
     cmbEstCivDepBen.text := '';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'S' then
  begin
     cmbEstCivDepBen.itemindex := 0;
     cmbEstCivDepBen.text := 'Solteiro(a)';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'C' then
  begin
     cmbEstCivDepBen.itemindex := 1;
     cmbEstCivDepBen.text := 'Casado(a) ou Equiparado(a)';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'D' then
  begin
     cmbEstCivDepBen.itemindex := 2;
     cmbEstCivDepBen.text := 'Divorciado(a)';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'E' then
  begin
     cmbEstCivDepBen.itemindex := 3;
     cmbEstCivDepBen.text := 'Desquitado(a)';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'J' then
  begin
     cmbEstCivDepBen.itemindex := 4;
     cmbEstCivDepBen.text :=  'Separado(a) Judicial';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'V' then
  begin
     cmbEstCivDepBen.itemindex := 5;
     cmbEstCivDepBen.text :=  'Viúvo(a)';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'M' then
  begin
     cmbEstCivDepBen.itemindex := 6;
     cmbEstCivDepBen.text := 'Marital';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'P' then
  begin
     cmbEstCivDepBen.itemindex := 7;
     cmbEstCivDepBen.text := 'Separado(a)';
  end
  else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'O' then
  begin
     cmbEstCivDepBen.itemindex := 8;
     cmbEstCivDepBen.text := 'Outros';
  end;

  sEstCivDepBen := qryDepBenPF.fieldbyname('ESTCIVIL').AsString;
  }
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO FROM ESTADOCIVIL WHERE ESTCIVIL = '+quotedStr(qryDepBenPF.fieldbyname('ESTCIVIL').AsString) );
  qryAux.Open;
  cmbEstCivDepBen.text := qryAux.fieldbyname('DESCRICAO').AsString;

  //Término - William Santana - SOL 209384/15928 KIN 2062832
end;

procedure TfrmCadDepenBenef.qryDepBenBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDepBen.FieldByName('IDTITULAR').AsInteger     := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryDepBen.FieldByName('IDPESSOA').AsInteger      := qryDepBenPessoa.FieldByName('IDPESSOA').AsInteger;

  qryDepBen.FieldByName('NOME').AsString           := dbeNomeDepBen.Text;
  qryDepBen.FieldByName('IDDEPENDENCIA').AsString  := qryDependencia2.FieldByName('IDDEPENDENCIA').AsString;
  qryDepBen.FieldByName('NUMSEQUENCIA').AsString   := dbeNumSeqDepBen.Text;
  qryDepBen.FieldByName('DATANASC').AsString       := dtpNascDepBen.Text;
  qryDepBen.FieldByName('PARENTESCO').AsString     := dblcParentDepBen.Text;
  qryDepBen.FieldByName('DESCESTCIVIL').AsString   := cmbEstCivDepBen.Text;
  qryDepBen.FieldByName('SEXO').AsString           := qryDepBenPF.FieldByName('SEXO').AsString;
  qryDepBen.FieldByName('NUMDEPIRRF').AsString     := spNumDepIRDepBen.Text;
  qryDepBen.FieldByName('INICIOIMPOSTOR').AsString := dtInicioIRDepBen.Text;
  qryDepBen.FieldByName('FIMIMPOSTOR').AsString    := dtFimIRDepBen.Text;
end;

procedure TfrmCadDepenBenef.qryDepBenPFBeforePost(DataSet: TDataSet);
begin
  inherited;

 // qryDepBenPF.fieldbyname('ESTCIVIL').AsString  := sEstCivDepBen; //William Santana - SOL 209384/15928 KIN 2062832

  if dbcSexoDepBen.ItemIndex = 0
  then qryDepBenPF.FieldByName('SEXO').AsString  := 'M'
  else qryDepBenPF.FieldByName('SEXO').AsString  := 'F';

 if dbchkIsentoIR.Checked  then
  begin
    if dbrgrpIsentoIR.ItemIndex = 0
    then qryDepBenPF.FieldByName('FLGISENTOIRRF').AsInteger := 1
    else qryDepBenPF.FieldByName('FLGISENTOIRRF').AsInteger := 0;
  end;
 { if dbchkIsentoIR.Checked
  then qryDepBenPF.FieldByName('FLGISENTOIRRF').AsInteger := 1
  else qryDepBenPF.FieldByName('FLGISENTOIRRF').AsInteger := 0;
  }
end;

procedure TfrmCadDepenBenef.qryDepBenDepenBeforePost(DataSet: TDataSet);
begin
  inherited;

  qryDepBenDepen.FieldByName('FLGDESIGNADO').AsInteger := qryDet.FieldByName('FLGDESIGNADO').AsInteger;
end;

procedure TfrmCadDepenBenef.dbrgrpMolGraveDepenClick(Sender: TObject);
begin
  inherited;

  if  dbrgrpMolGraveDepen.ItemIndex = 0
  then begin
     rgrpDtMolGraveDepen.Visible   := True;
     dbchkDepBenIsentoIRRF.Checked := True;
  end
  else begin
     rgrpDtMolGraveDepen.Visible   := False;
     dbchkDepBenIsentoIRRF.Checked := False;
     dtMolGraveDepen.Text        := '';
  end;

  // inherited;

end;

procedure TfrmCadDepenBenef.dbdeDataNascExit(Sender: TObject);
begin
  inherited;

    // Renato Visoni SOL 130508/4762 kintana 1269185
  if OpDetalhe = 'A' then begin
    if (sDataAnt <> dbdeDataNasc.Text) and (dbdtInicioIR.Text <> '') then begin
      QryDet.fieldbyname('FIMIMPOSTOR').asString := '';
    end;
  end;
  // Renato Visoni SOL 130508/4762 kintana 1269185

  bReterBenMaiorIdade :=  VerElegBen(1);


  //Renato Visoni SOL 156422 Kintana 1234790
  {
  //Renato Visoni SOL 152884 Kintana 1147888
  if dbdeDataNasc.Text <> '' then begin
    FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(dbdeDataNasc.Text)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
    if QryAux.FieldByname('IDADE').asFloat < 24 then begin
      dbchkbxDesignado.Checked   := (dblkpcmbSitDependente.Text = 'NORMAL');
      dbchkbxFlgDepLegal.Checked := (dblkpcmbSitDependente.Text = 'NORMAL');
    end else begin
      dbchkbxDesignado.Checked   := False;
      dbchkbxFlgDepLegal.Checked := False;
    end;
  end;
  //Renato Visoni SOL 152884 Kintana 1147888
  }
  //Renato Visoni SOL 156422 Kintana 1234790
end;

procedure TfrmCadDepenBenef.dblkpcmbGrauInstrExit(Sender: TObject);
begin
  inherited;
  bReterBenSuperior := VerElegBen(3);
end;

procedure TfrmCadDepenBenef.sbtnSelResponsavelClick(Sender: TObject);
begin
  inherited;
  if bResponsaProprioNovo
  then begin
     MsgDlg('Um novo responsável foi criado e ainda não confirmado. Confirme o cadastro até o momento para continuar a operação.','Erro',mtError,[mbOk],0);
     sbtnSelResponsavel.Down := False;
     Exit;
  end;

  //Início - William Santana SOL 161550 KIN 1717512
//  MSResp.Executar;
//  if MSResp.RetornouValor then
//  begin
//     qryBenef.FieldByname('IDRESPONNAOREC').AsString := MSResp.ValoresChave[0];
//     dbeResponsavel.Text                             := MSResp.ValoresChave[2];
//
//     if rdbOutro.Checked
//     then begin
//        qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryBenef.FieldByName('IDRESPONNAOREC').AsString;
//        dbeRecebedor.Text                              := dbeResponsavel.Text;
//     end;
//  end;

  MSResp.Executar;
  if MSResp.RetornouValor then
  begin
     qryReprLegal.FieldByName('IDRESPONSAVEL').AsString  := MSResp.ValoresChave[0];
     dbeResponsavel.Text                                 := MSResp.ValoresChave[2];
     DBeCPFRes.Text                                      := MSResp.ValoresChave[3];
  end;
  //Término - William Santana SOL 161550 KIN 1717512

end;

procedure TfrmCadDepenBenef.sbtnCadResponsavelClick(Sender: TObject);
begin
  inherited;

  iIdResponsavelGeral := -1;

  frmCadResponsa := TfrmCadResponsa.Create(Application);
  frmCadDepenBenef.WindowState := wsMaximized;
  frmCadDepenBenef.Caption := 'Cadastro de Dependentes';
  try
     frmCadResponsa.ShowModal;
  finally
     frmCadResponsa.Free;
  end;

  if iIdResponsavelGeral > 0
  then begin

     //Início - William Santana SOL 161550 KIN 1717512
//     with qryAux do
//     begin
//        Close;
//        SQL.Clear;
//        SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iIdResponsavelGeral));
//        Open;
//        qryBenef.FieldByname('IDRESPONNAOREC').AsInteger := iIdResponsavelGeral;
//        dbeResponsavel.Text                              := FieldByName('Nome').AsString;
//        Close;
//        iIdResponsavelGeral                              := -1;
//     end;
//     if rdbOutro.Checked
//     then begin
//        qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryBenef.FieldByName('IDRESPONNAOREC').AsString;
//        dbeRecebedor.Text                              := dbeResponsavel.Text;
//     end;

     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT NOME, NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+IntToStr(iIdResponsavelGeral));
        Open;

        if not(IsEmpty) then
        begin
         qryReprLegal.FieldByname('IDRESPONSAVEL').AsInteger := iIdResponsavelGeral;
         dbeResponsavel.Text                              := FieldByName('Nome').AsString;
         DBeCPFRes.Text                                   := FieldByName('NUMDOCUMENTO').AsString;
        end;

        if (qryBenef.FieldByname('IDRESPONSAVEL').AsString = qryDet.FieldByName('IDPESSOA').AsString) then
           qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger := iIdResponsavelGeral;

        Close;
        iIdResponsavelGeral                              := -1;
     end;
     //Término - William Santana SOL 161550 KIN 1717512
  end;

end;


procedure TfrmCadDepenBenef.bbtnOpcoesClick(Sender: TObject);
begin
  inherited;
  frmCadOpcoesElegivel.Caption           := 'Opções do Dependente/Beneficiário';
  frmCadOpcoesElegivel.Label1.Caption    := 'Cadastro de Opções';
  frmCadOpcoesElegivel.Label5.Caption    := 'Nome do Participante';
  frmCadOpcoesElegivel.edNomeTit.Text    := qryNOME.AsString;
  frmCadOpcoesElegivel.Label7.Caption    := 'Nome do Dependente/Beneficiário';
  frmCadOpcoesElegivel.edPatroTit.Text   := qryDet.FieldByName('NOME').AsString;
  FrmCadOpcoesElegivel.edOpcao1.BtnWidth := 0;
  FrmCadOpcoesElegivel.edOpcao2.BtnWidth := 0;
  FrmCadOpcoesElegivel.edOpcao3.BtnWidth := 0;
  FrmCadOpcoesElegivel.edOpcao4.BtnWidth := 0;
  FrmCadOpcoesElegivel.edOpcao5.BtnWidth := 0;
  FrmCadOpcoesElegivel.edOpcao6.BtnWidth := 0;

  FrmCadOpcoesElegivel.qryPatro.ParamByName('IDPESSOA').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
  FrmCadOpcoesElegivel.qryPatro.Open;

  frmCadOpcoesElegivel.ShowModal;
end;


procedure TfrmCadDepenBenef.bbtnSairClick(Sender: TObject);
begin
  //BRUNO AZEVEDO SOL 135094 KINTANA 805800
  if Assigned(frmCadOpcoesElegivel) then begin
    FreeAndNil(frmCadOpcoesElegivel);
  end;

  //If frmCadOpcoesElegivel <> Nil
  //  Then frmCadOpcoesElegivel.Free;
  inherited;
end;

function TfrmCadDepenBenef.TestaDepenIR: Boolean;
begin
end; { TestaDepenIR }

procedure TfrmCadDepenBenef.AtualizaNumeroDependentes(iIdTitular, iIdDependente : Integer;
                                                      sFlginterno, sDtNasc, sDtIniIR, sDtFimIR,
                                                      sDtIniSalFam, sDtFimSalFam,
                                                      sEstCiv, sTipoDepen, sGrInstr : String;
                                                      iSexo : Integer);
var
   sdataFolha, sMes                                  : String;
   bContaIR                                          : Boolean;
   bContaSF                                          : Boolean;
   sDependencia,sDataInicio,sDataFim                 : String;
   sDataInicioInvalidez,sDataFimInvalidez            : String;
   sDataNasc, sDataQuatorze, sDataVinteeUm           : String;
   sDataVinteeQuatro, sMatricula                     : String;
   sDataInicioSF,sDataFimSF                          : String;
   NumDias, NumAnos, NumDiasQuatorze,NumDiasVinteeUm : Extended;
   NumDiasVinteeQuatro                               : Extended;
   nTotalDepSF, nTotalDepIR, pIdTitular              : Integer;
   wDia, wMes, wAno                                  : Word;


   procedure VerificadependenteIR;
   begin
        bContaIR        := false;
        NumDiasVinteeUm := 0;
        sDataFim        := '';
        If sDataInicio <= sDataFolha then
        begin
             // IRMAO , NETO  OU BISNETO DE QUEM O CONTRIBUINTE DETENHA A GUARDA JUDICIAL
             If ((sDependencia = 'IRM') or (sDependencia = 'NET') or (sDependencia = 'BIS')) then
             begin
                  // DETEM A GUARDA JUDICIAL
                       // INCAPACITADO FISICA OU MENTALMENTE
                       If ((sdataInicioInvalidez <>  '') or  (sDataFimInvalidez <> '')) then
                       begin
                            If ((sdataInicioInvalidez < sDataFolha ) and ((sDataFimInvalidez > sdataFolha) or (sDataFimInvalidez = ''))) then
                               bcontaIR := true
                            else
                                bContaIR := false;
                       end else
                       begin
                            //  NORMAL ATE 21 ANOS
                            NumDiasVinteeUm := (21 * 365.25);
                            sDataVinteeUm   := formatdatetime('DD/MM/YYYY',(StrToDate(sDataNasc) + NumDiasVinteeUm));
                            sDataFim        := sDataVinteeUm;
                            NumDias         := (StrToDate(sDataFolha)-strToDate(sDataNasc));
                            NumAnos         := Trunc(Numdias/365.25);
                            If Numanos  <= 21  then
                               bContaIR := true
                            else
                                bContaIR := false;
                       end;
             end;
             // COMPANHEIRO ,CONJUGE , PAI e MAE
             If ((sDependencia = 'COP') or (sDependencia = 'COM') or (sDependencia = 'PAI')) then
             begin
                  If (sDataInicio <= sDataFolha) and ((sDataFim >= sDataFolha) or (sDataFim = '')) then
                     bContaIR := true
                  else
                      bContaIR := false;
             end;
             // FILHO OU ENTEADO
             If ((sDependencia = 'FIL') or (sDependencia = 'ENT')) then
             begin
                  // UNIVERSITARIO
                  If (prmIDGRINSTR = StrToInt(sGrInstr)) then
                  begin
                       NumDiasVinteeQuatro := (24 * 365.25);
                       sDataVinteeQuatro := formatdatetime('DD/MM/YYYY',(StrToDate(sDataNasc) + NumDiasVinteeQuatro));
                       sDataFim := sDataVinteeQuatro;
                       NumDias := (StrToDate(sDataFolha)-strToDate(sDataNasc));
                       NumAnos := Trunc(Numdias/365.25);
                       If Numanos  <= 24  then
                          bContaIR := true
                       else
                          bContaIR := false;
                  end else
                  begin
                       // INCAPACITADO FISICA OU MENTALMENTE
                       If ((sdataInicioInvalidez <>  '') or  (sDataFimInvalidez <> '')) then
                       begin
                            If ((sdataInicioInvalidez < sDataFolha ) and ((sDataFimInvalidez > sdataFolha) or (sDataFimInvalidez = ''))) then
                               bcontaIR := true
                            else
                                bContaIR := false;
                       end else
                       begin
                            //  NORMAL ATE 21 ANOS
                            NumDiasVinteeUm := (21 * 365.25);
                            sDataVinteeUm   := formatdatetime('DD/MM/YYYY',(StrToDate(sDataNasc) + NumDiasVinteeUm));
                            sDataFim        := sDataVinteeUm;
                            NumDias := (StrToDate(sDataFolha)-strToDate(sDataNasc));
                            NumAnos := Trunc(Numdias/365.25);
                            If Numanos  <= 21  then
                               bContaIR := true
                            else
                                bContaIR := false;
                       end;
                  end;
             end;
        end;
   end;

   procedure VerificadependenteSF;
   begin
        bContaSF        := false;
        NumDiasQuatorze := 0;
        sDataFimSF      := '';
        If sDataInicioSF <= sDataFolha then
        begin
             // FILHO OU ENTEADO
             If ((sDependencia = 'FIL') or (sDependencia = 'ENT')) then
             begin
                  // INCAPACITADO FISICA OU MENTALMENTE
                  If ((sdataInicioInvalidez <>  '') or  (sDataFimInvalidez <> '')) then
                  begin
                       If ((sdataInicioInvalidez < sDataFolha ) and ((sDataFimInvalidez > sdataFolha) or (sDataFimInvalidez = ''))) then
                           bcontaSF := true
                       else
                           bContaSF := false;
                  end else
                  begin
                       //  NORMAL ATE 14 ANOS
                       NumDiasQuatorze := (14 * 365.25);
                       sDataQuatorze   := formatdatetime('DD/MM/YYYY',(StrToDate(sDataNasc) + NumDiasQuatorze));
                       sDataFimSF      := sDataQuatorze;
                       NumDias := (StrToDate(sDataFolha)-strToDate(sDataNasc));
                       NumAnos := Trunc(Numdias/365.25);
                       If Numanos  <= 14  then
                          bContaSF := true
                       else
                          bContaSF := false;
                  end;
             end;
        end;
   end;

   procedure AtualizaDependente;
   begin
       If bcontaIR then
          nTotalDepIR := nTotalDepIR + 1
       else
          nTotalDepIR := nTotalDepIR - 1;

       If bcontaSF then
          nTotalDepSF := nTotalDepSF + 1
       else
          nTotalDepSF := nTotalDepSF - 1;



       dtmAPrev.qryAtualizadependente.Close;
       If bcontaIR then
          QryDet.fieldbyname('FLGCONTAIMPOSTOR').asInteger  := 1
       else
          QryDet.fieldbyname('FLGCONTAIMPOSTOR').asInteger  := 0;

       If bContaSF then
          QryDet.fieldbyname('FLGCONTASALARIOF').asInteger  := 0
       else
          QryDet.fieldbyname('FLGCONTASALARIOF').asInteger  := 0;

       If (sDataFim <> '') then
          QryDet.fieldbyname('FIMIMPOSTOR').asString := sDataFim
       else
          QryDet.fieldbyname('FIMIMPOSTOR').asString := '';

       If (sDataFimSF <> '') then
          QryDet.fieldbyname('FIMSALARIOF').asString := sDataFimSF
       else
          QryDet.fieldbyname('FIMSALARIOF').asString := '';
   end;

   procedure AtualizaTitular;
   begin
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       If nTotalDepIR < 0 then nTotalDepIR := 0;
       If nTotalDepSF < 0 then nTotalDepSF := 0;

       dtmAPrev.qryAtualizaTitular.Close;
       dtmAPrev.qryAtualizaTitular.parambyname('NDEPIR').asInteger  := nTotalDepIR;
       dtmAPrev.qryAtualizaTitular.parambyname('NDEPSF').asInteger  := nTotalDepSF;
       dtmAPrev.qryAtualizaTitular.parambyname('NDEPTT').asInteger  := (nTotalDepIR+nTotalDepSF);
       dtmAPrev.qryAtualizaTitular.parambyname('TITULAR').asInteger := pIdTitular;
       try
          dtmAPrev.qryAtualizaTitular.ExecSql;
       except
       end;
   end;

   function AtualizaDataFolha(pMesRef, pAnoRef : string) : string;
   begin
     if pMesRef = '13' then
       pMesRef:='12';
     with qryAux do
     begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT C.DATAPAGBENEF '+
               ' FROM CALENDDATAS C, FUNDACAO F '+
               ' WHERE (F.IDPESSOA = ' + IntToStr(iIdFundacao)+') '+
               ' AND (F.IDCALENDARIO = C.IDCALENDARIO) '+
               ' AND (C.ANOMESREF = '''+pAnoRef+'/'+pMesRef+''') '+
               ' AND (C.FLGINTERNO = ''AS'') ');
       Open;
       if not IsEmpty then
         Result:=FieldByName('DATAPAGBENEF').asstring
       else
         Result:='01/'+pMesRef+'/'+pAnoRef;
       Close;
     end;
   end; { AtualizaDataFolha }


begin
   { Testa estado da Query }
   If Not (QryDet.State in [dsInsert, dsEdit]) Then Exit;

   { Testa Sender }
   try
      if (ActiveControl.Name = 'bbtnSair') Or (ActiveControl.Name = 'bbtnCancelar') Or
         (ActiveControl.Name = 'bbtnCancelarDet') Or (ActiveControl.Name = 'bbtnVoltarDet')
      Then Begin
        Exit;
      End;
   except
   end;

   { Testa Dados Obrigatórios da Tela }
   If (iIdTitular   = 0)  Or (iIdDependente = 0)  Or
      (sDtNasc      = '') Or
      (sDtIniIR     = '') Or
      (sDtIniSalFam = '') Or
      (sEstCiv      = '') Or
      (sTipoDepen   = '') Or
      (iSexo        = -1)
   Then Begin
     Exit;
   End;
   If sGrInstr = '' Then sGrInstr := '0'; { Acerta }
   pIdTitular  := iIdTitular;
   DecodeDate(Date,wAno,wMes,wDia);
   If wMes < 10 Then sMes := '0'+IntToStr(wMes) Else sMes := IntToStr(wMes);
   sDataFolha  := AtualizaDataFolha(sMes,IntToStr(wAno));

   try
      nTotalDepSF := 0;
      nTotalDepIR := 0;

      sDependencia         := sTipoDepen;

      If Trim(sDtIniSalFam) = '' then
         sDataInicioSF := ''
      else
          sDataInicioSF := sDtIniSalFam;

      If  Trim(sDtFimSalFam) = '' then
         sDataFimSF := ''
      else
         sDataFimSF := sDtFimSalFam;

      If Trim(sDtIniIR) = '' then
         sDataInicio := ''
      else
          sDataInicio := sDtIniIR;

      If  Trim(sDtFimIR) = '' then
          sDataFim := ''
      else
          sDataFim := sDtFimIR;
      sDataNasc := sDtNasc;

      if not ((iidtitular = iIdDependente) and
         (sFlgInterno <> 'AT') and
         (sFlgInterno <> 'MA') and
         (sFlgInterno <> 'CA') and
         (sFlgInterno <> 'MP')) or (iidtitular <> iIdDependente) then
      begin
         if (qryDet.FieldByName('FLGCONTAIMPOSTOR').asinteger = 1) then
             nTotalDepIR:=nTotalDepIR+1;
         If (qryDet.FieldByName('FLGCONTASALARIOF').asinteger = 1) then
             nTotalDepSF:=nTotalDepSF+1;
      end
      else
      begin

         VerificaDependenteIR;
         VerificaDependenteSF;
         try
            AtualizaDependente;
         except
            Raise;
         end;
      end;

      AtualizaTitular;
   except
      Raise;
   end;

end;



function TfrmCadDepenBenef.HabilitaCheckDependente(
  IdEmpresa: Integer): Boolean;
begin
  Result := False;
  // Se  FLGNUMDEPIRNUMDEPSALFAM = 0
  // Entao Fundacao não utiliza calculo automatico -> Habilitar checkbox
  // Senao Fundação utiliza calculo automatico     -> Desabilitar checkbox
  If FazQuery(QryAux,'SELECT VALORPARAM '+
                     'FROM   PARAMFOLHA '+
                     'WHERE  IDFUNDACAO = '+IntToStr(IdEmpresa)+' AND '+
                     '       NOMEPARAM  = '+QuotedStr('FLGNUMDEPIRNUMDEPSALFAM'))
  Then Begin
    Result := (QryAux.FieldByName('VALORPARAM').AsInteger = 0);
  End;
end;

procedure TfrmCadDepenBenef.pgctrlDetalheEnter(Sender: TObject);
begin
  inherited;
      {if bbtnCancelar.Enabled = true  then
         bbtnConfirmar.Enabled := true;} // Felipe A. Santos Comentado - (SOL 208475 KINTANA: 2016859) e (SOL 208311 KTN 2020366);
end;

procedure TfrmCadDepenBenef.lstDocumentosExit(Sender: TObject);
begin
  inherited;
//  if bbtnCancelar.Enabled = true  then //Darivaldo Alencar SIG25312
//       bbtnConfirmar.Enabled := true;  //Darivaldo Alencar SIG25312
   edDocNumDocumento.Enabled := true;
end;

procedure TfrmCadDepenBenef.qryOutrasInformsBeforePost(DataSet: TDataSet);
begin
  inherited;
  If qryOutrasInforms.State in [dsinsert]
  Then Begin
     qryOutrasInforms.FieldByName('IDPARAM').AsInteger := qryParamPessoa.FieldByname('IDPARAM').AsInteger;
  End;
end;

procedure TfrmCadDepenBenef.PessoaChangeSubtipo(IdPessoa: Integer);
begin
  inherited;
   If (qryOutrasInforms.Active) And (qryOutrasInforms.CachedUpdates)
    Then qryOutrasInforms.CancelUpdates;
   qryOutrasInforms.Close;
   qryOutrasInforms.ParamByName('IDPESSOA').Value := IdPessoa;
   qryOutrasInforms.Open;
   qryOutrasInforms.CancelUpdates;

   //Darivaldo Alencar SIG 27871 -inicio
    If (qryOcupacao.Active) And (qryOcupacao.CachedUpdates)
    Then qryOcupacao.CancelUpdates;
   qryOcupacao.Close;
   qryOcupacao.ParamByName('IDPESSOA').asInteger := IdPessoa;
   qryOcupacao.Open;
   //Darivaldo Alencar SIG 27871 -fim
end;

procedure TfrmCadDepenBenef.btnListaDocsTitularClick(Sender: TObject);
begin
  inherited;
  Try
    Application.CreateForm(TFrmListaDocs, FrmListaDocs);
    FrmListaDocs.ListaDocumentos(qry.FieldByName('IDPESSOA').AsInteger,
                                 qry.FieldByName('NOME').AsString);
    FrmListaDocs.ShowModal;
  Finally
    FrmListaDocs.Free;
  End;
end;

procedure TfrmCadDepenBenef.dblkParamPessoaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  qryAux.SQL.Text := 'SELECT IDPESSOA, IDPARAM FROM PESSOAPARAM WHERE IDPESSOA = ' +
                     InttoStr(qryDet.FieldByName('IDPESSOA').AsInteger) + ' AND IDPARAM = ' +
                     InttoStr(qryParamPessoa.FieldByName('IDPARAM').AsInteger);
  qryAux.Open;
  if not qryAux.EOF Then
  Begin
     MsgDlg('Parâmetro já relacionado.','Erro',mtError, [ mbOK, mbHelp],0);
     dblkParamPessoa.SetFocus;
     Exit;
  end;
  qryOutrasInforms.FieldByName('DESCRICAO').AsString := qryParamPessoa.FieldByName('DESCRICAO').AsString;
  if (qryParamPessoa.FieldByName('TIPO').AsString = 'F') or
     (qryParamPessoa.FieldByName('TIPO').AsString = 'V') Then
    edValida.Text := qryParamPessoa.FieldByName('VALIDACAO').AsString
  else
    edValida.Text := 'Não existe validação';

end;


procedure TfrmCadDepenBenef.RodaRegraDataFinal;
Var
  sMsgErro,
  sDataFinal : String;
  bErro      : Boolean;
begin
  If Not qryBenef.FieldByName('IDREGRAFIM').IsNull
   Then Begin
      frmAguarde.Mostra('Regra de Data Final - Nº '+qryBenef.FieldByName('IDREGRAFIM').AsString);

      sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBenef.FieldByName('IDREGRAFIM').AsInteger,
                                                  qry.FieldByName('IDPESSJUR').AsInteger,
                                                  qry.FieldByName('IDPLANOPREV').AsInteger,
                                                  qry.FieldByName('IDPESSOA').AsInteger,
                                                  qry.FieldByName('SEQPROPOSTA').AsInteger,
                                                  qryDet.FieldByName('IDPESSOA').AsInteger,
                                                  qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                                  0,
                                                  0,
                                                  0,
                                                  '',
                                                  '',
                                                  '',
                                                  '',

                                                  FormatDateTime('dd/mm/yyyy', Date),
                                                  '',
                                                  '',
                                                  bErro,
                                                  sMsgErro);
      frmAguarde.Apaga;

      If bErro
       Then MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0)
   End;
end;


procedure TfrmCadDepenBenef.dbeCPFExit(Sender: TObject);
Var
 iIdPessoaInsert : Longint;
begin
  inherited;
  If Trim(dbeCPF.Text) <> ''
   Then Begin
     CMValidaCPF.NumDocumento := dbeCPF.Text;
     If Not CMValidaCPF.DocumentoValido
      Then Begin
        //Darivaldo Alencar SIG25312 -inicio
        //MsgDlg('CPF DIGITADO É INVÁLIDO!! VERIFIQUE!!','ATENÇÃO',mtWarning,[mbOK],0);
        MsgDlg(MSG028,'ATENÇÃO',mtWarning,[mbOK],0);
        dbeCPF.setfocus;
        exit;
        //dbeCPF.SetFocus;
        //Darivaldo Alencar SIG25312 -fim
      End;
     If (OpDetalhe = 'I')
      Then Begin
        // Verifica se existe participante com este mesmo CPF
        qryAux.Close;
        qryAux.SQL.Clear;

        // Renato Visoni SOL 131670 Kintana 752091
        //qryAux.SQL.Add('SELECT P.IDPESSOA, P.NOME, P.NUMDOCUMENTO');
        qryAux.SQL.Add('SELECT P.IDPESSOA, P.NOME ||'' ''||(SELECT TO_CHAR(DATANASC,''DD/MM/YYYY'') FROM PESSOAFISICA WHERE IDPESSOA = D.IDPESSOA ) AS NOME , P.NUMDOCUMENTO');
        // Renato Visoni SOL 131670 Kintana 752091

        qryAux.SQL.Add('FROM PESSOA P, DEPENTIT D');
        qryAux.SQL.Add('WHERE D.IDPESSOA     = P.IDPESSOA');
        qryAux.SQL.Add('  AND P.NUMDOCUMENTO = '+QuotedStr(Trim(dbeCPF.Text)));
        qryAux.Open;

        If (Not QryAux.IsEmpty) And
           (MsgDlg('Já existe dependente cadastrado com este CPF com o nome'+#13+
                   qryAux.FieldByName('NOME').AsString+#13+
                   dbeCPF.Text+#13+
                   'Deseja utilizar os dados já gravados ? ',
                   'Confirmação', mtConfirmation,  [mbYes, mbNo], 0) = mrYes)
         Then Begin

           dbcNomeDepen.Items.Clear;
           While Not QryAux.Eof Do
            Begin
             dbcNomeDepen.Items.Add(QryAux.FieldByName('NOME').AsString + #9 + QryAux.FieldByName('IDPESSOA').AsString);
             qryAux.Next
            End;
           dbcNomeDepen.ApplyList;
           pnlDepenJaExiste.Visible := True;
           pnlDepenJaExiste.Left    := 148;
           pnlDepenJaExiste.Top     := 183;
           pnlDepenJaExiste.BringToFront;
           dbcNomeDepen.SetFocus;
         End;
      End;

   End;

end;

procedure TfrmCadDepenBenef.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  If (Trim(DBEdit2.Text) <> '') AND (Trim(DBEdit2.Text) <> vNumdocInicial) Then
  Begin
   CMValidaCPF.NumDocumento := DBEdit2.Text;
   If Not CMValidaCPF.DocumentoValido Then
   Begin
    //MsgDlg('CPF DIGITADO É INVÁLIDO!! VERIFIQUE!!','ATENÇÃO',mtWarning,[mbO K],0); //Darivaldo Alencar SIG25312
    MsgDlg(MSG028,'ATENÇÃO',mtWarning,[mbOK],0); //Darivaldo Alencar SIG25312
    DBEdit2.SetFocus;
   End else begin
    flgcpf := True;
    flgnome := False;
    JaExisteDenBenCpfNome;
    //vNumdocInicial := qryDepBenPessoa.FieldByName('NUMDOCUMENTO').AsString;
   End;
  End;

end;


procedure TfrmCadDepenBenef.btnOkJaExisteClick(Sender: TObject);
var sDataAux : string;
  xQry: TwwQuery;
begin
  inherited;

  // Executar críticas necessárias
  If dbcNomeDepen.ItemIndex = -1 Then
  Begin
    MsgDlg('Confirme sua escolha selecionando o nome do dependente.','Erro',mtError,[mbOk,mbHelp],0);
    dbcNomeDepen.SetFocus;
    Exit;
  End;

  If Trim(dblkpcmbTipoDependencia2.Text) = '' Then
  Begin
    MsgDlg('É necessário escolher o grau de parantesco do dependente.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbTipoDependencia2.SetFocus;
    Exit;
  End;

  pnlDepenJaExiste.SendToBack;
  pnlDepenJaExiste.Visible := False;
  frmAguarde.Mostra('Aguarde um momento enquanto os dados são preparados...');

  // Grava os dados na Depentit pois é necessário!!
  sDataAux := '';
  sDataAux := dbdeDataCadastro.Text;
  qryDet.CancelUpdates;
  qryPessoa.CancelUpdates;
  qrySubTipo.CancelUpdates;
  qryDocumento.CancelUpdates;

  Try
    bJaExisteIdPessoa := True;

    //BRUNO AZEVEDO SOL 140875/2902 KINTANA 1019775
    try

      xQry := TwwQuery.Create(Nil);
      xQry.DataBaseName := 'BaseDados';
      xQry.Close;
      xQry.Sql.Clear;
      xQry.Sql.Add('SELECT * FROM DEPENDENTE');
      xQry.Sql.Add(' WHERE IDPESSOA = ' + dbcNomeDepen.GetComboValue(dbcNomeDepen.Text));
      xQry.Open;

      if (xQry.IsEmpty) then begin
        qryDepen.CancelUpdates;
        qryDepen.Insert;
        qryDepen.FieldByName('IDPESSOA').AsInteger        := StrToInt(dbcNomeDepen.GetComboValue(dbcNomeDepen.Text));
        qryDepen.FieldByName('idsitdependente').AsInteger := 1;
        qryDepen.Post;
        //qryDepen.ApplyUpdates;       //edilaine - SIG25312
      end;

      xQry.Close;
      xQry.Sql.Clear;
      xQry.Sql.Add('SELECT * FROM PESSOAFISICA');
      xQry.Sql.Add(' WHERE IDPESSOA = ' + dbcNomeDepen.GetComboValue(dbcNomeDepen.Text));
      xQry.Open;

      if (xQry.IsEmpty) then begin
        qryPF.CancelUpdates;
        qryPF.Insert;
        qryPF.FieldByName('IDPESSOA').AsInteger          := StrToInt(dbcNomeDepen.GetComboValue(dbcNomeDepen.Text));
        qryPF.FieldByName('FLGISENTOIRRF').AsInteger     := 0;
        qryPF.FieldByName('SEXO').AsString               := '';
        qryPF.FieldByName('ESTCIVIL').AsString           := 'S';
        qryPF.FieldByName('NUMDEPIRRF').AsInteger        := 0;
        qryPF.FieldByName('NUMDEPSALF').AsInteger        := 0;
        qryPF.FieldByName('NUMDEPTOT').AsInteger         := 0;
        qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger  := 0;
        qryPF.Post;
        //qryPF.ApplyUpdates;            //edilaine - SIG25312
      end;
    finally
      FreeAndNil(xQry);
    end;
    //BRUNO AZEVEDO SOL 140875/2902 KINTANA 1019775

    qryDet.Insert;
    qryDet.FieldByName('IDPESSOA').AsInteger      := StrToInt(dbcNomeDepen.GetComboValue(dbcNomeDepen.Text));
    qryDet.FieldByName('IDTITULAR').AsInteger     := qry.FieldByName('IDPESSOA').AsInteger;
    qryDet.FieldByName('IDDEPENDENCIA').AsString  := dblkpcmbTipoDependencia2.LookupValue;
    qryDet.FieldByName('NUMSEQUENCIA').AsInteger  := iSeq;
    if sDataAux <> '' then
       qryDet.FieldByName('DATACADASTRO').AsString  := sDataAux;
    qryDet.Post;
    //qryDet.ApplyUpdates;                      //edilaine - SIG25312

    // Retorna ao ponto inicial
    bbtnVoltarDetClick(Self);

    {SelecionaDependente(MontaSelect.ValoresChave[0],
                         MontaSelect.ValoresChave[1],
                         MontaSelect.ValoresChave[3]);}

    //edilaine - SIG25312 - inicio
    {SelecionaDependente(sIdPessoa,
                        sIdPessJur,
                        sIdPlanoPrev);     //Ádler Souza - SOL 134214 / Kintana 787470
    }//edilaine - SIG25312 - inicio

    qryDet.Locate('IDPESSOA', StrToInt(dbcNomeDepen.GetComboValue(dbcNomeDepen.Text)), [loCaseInsensitive]);

  Finally
    frmAguarde.Apaga;
    sbtnAltDet.Down := true;
    sbtnAltDetClick(Self);
  End;
end;
procedure TfrmCadDepenBenef.btnCancelJaExisteClick(Sender: TObject);
begin
  inherited;
  pnlDepenJaExiste.SendToBack;
  pnlDepenJaExiste.Visible := False;
  bJaExisteIdPessoa        := False;
end;

procedure TfrmCadDepenBenef.dbeNomeExit(Sender: TObject);
begin
  inherited;
  // Verifica se existe participante este mesmo nome
  if (OpDetalhe = 'I') then
  //REABERTURA POIS NA ALTERAÇÃO DO CADASTRO ESTAVA CHECANDO EXISTÊNCIA
  //DE PESSOA COM MESMO NOME. ISTO É PARA SER FEITO APENAS NO INSERIR
  begin
    if Trim(dbeNome.Text) <> '' then
    begin
      qryAux.Close;
      qryAux.SQL.Clear;

      // Renato Visoni SOL 131670 Kintana 752091
      //qryAux.SQL.Add('SELECT P.IDPESSOA, P.NOME, P.NUMDOCUMENTO');
      qryAux.SQL.Add('SELECT P.IDPESSOA, P.NOME ||'' ''||(SELECT TO_CHAR(DATANASC,''DD/MM/YYYY'') FROM PESSOAFISICA WHERE IDPESSOA(+) = D.IDPESSOA )||'' ''|| P.NUMDOCUMENTO AS NOME , P.NUMDOCUMENTO'); //Renato Visoni SOL 140875 Kintana 885806
      // Renato Visoni SOL 131670 Kintana 752091

      qryAux.SQL.Add('FROM PESSOA P, DEPENTIT D');
      qryAux.SQL.Add('WHERE D.IDPESSOA(+)     = P.IDPESSOA');
      qryAux.SQL.Add('  AND P.NOME = '+QuotedStr(Trim(dbeNome.Text)));
      qryAux.Open;

      if (Not QryAux.IsEmpty) And
         (MsgDlg('Já existe dependente cadastrado com este mesmo nome.'+#13+
                 'CPF informado: '+qryAux.FieldByName('NUMDOCUMENTO').AsString+#13+
                 'Deseja utilizar os dados já gravados ? ',
                 'Confirmação', mtConfirmation,  [mbYes, mbNo], 0) = mrYes) then
      begin
        dbcNomeDepen.Items.Clear;
        while not QryAux.Eof do
        begin
          dbcNomeDepen.Items.Add(QryAux.FieldByName('NOME').AsString + #9 + QryAux.FieldByName('IDPESSOA').AsString);
          qryAux.Next
        end;
        dbcNomeDepen.ApplyList;
        pnlDepenJaExiste.Visible := True;
        pnlDepenJaExiste.Left    := 148;
        pnlDepenJaExiste.Top     := 183;
        pnlDepenJaExiste.BringToFront;
        dbcNomeDepen.SetFocus;
      end;
    end;
  end;
end;


procedure TfrmCadDepenBenef.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  pnlItemsDoc.Enabled := (ds.State in ([dsInsert, dsEdit]));
end;



procedure TfrmCadDepenBenef.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
var
  sMsg : string;
begin
  // -------------------------------------------------------------------------------------------
  // André Pontes - pendência 26492 - 17/12/2007
  if (tbcDetalhe.TabIndex = 1) and (CmeCadastro.Operacao in [opInserir,opAlterar]) and
     (not (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0)) then       //edilaine - SIG25312
  begin
    sMsg := 'A mudança para outra aba implicará a não gravação das alterações nos documentos!' + #13 + #13 +
            'Deseja prosseguir e perder as alterações?';

    AllowChange := MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrYes;

    if not(AllowChange) then Exit;
  end;

  If pgctrlDetalhe.ActivePage = tbsTelefone Then
     begin
        dbgTelefoneRamal.Visible := true;
        GroupBox7.Height := 168;
        Panel4.Visible           := false;
        ToolbarButtonAlteraContato.Down := false;
        ToolbarButtonInsereContato.Down := false;
        ToolbarButtonAlteraContato.Enabled := true;
        ToolbarButtonInsereContato.Enabled := true;
        ToolbarButtonExcluiContato.Enabled := true;
        qryContato.Cancel;
     end;

  inherited;
  // FIM André Pontes - pendência 26492 - 17/12/2007
  // -------------------------------------------------------------------------------------------
end;



procedure TfrmCadDepenBenef.edDocNumDocumentoEnter(Sender: TObject);
begin
  inherited;
  // André Pontes - pendência 26492 - 17/12/2007
  sDocumentoAnt := edDocNumDocumento.Text;
end;



function TfrmCadDepenBenef.VerificaContaPref(pIdPessoa,
  pIdTitular: String): Boolean;
begin

  //Renato Visoni SOL 97628 \ Kintana 431568
  QryCbancoPref.Close;
  if not QryCbancoPref.Prepared then QryCbancoPref.prepare;
    QryCbancoPref.SQL.CLear;
    QryCbancoPref.SQL.ADD('SELECT CB.IDCBANCARIA,');
    QryCbancoPref.SQL.ADD('CB.CONTACORRENTE,');
    QryCbancoPref.SQL.ADD('CB.IDAGENCIA,');
    QryCbancoPref.SQL.ADD('CB.FLGCONTAPREF,');
    QryCbancoPref.SQL.ADD('CB.IDPESSOA,');
    QryCbancoPref.SQL.ADD('CB.TIPOCONTA,');
    QryCbancoPref.SQL.ADD('CB.FLGCONTACONJUNTA,');
    QryCbancoPref.SQL.ADD('PA.NOME AS AGENCIA,');
    QryCbancoPref.SQL.ADD('PB.NOME AS BANCO,');
    QryCbancoPref.SQL.ADD('AB.NUMAGENCIA,');
    QryCbancoPref.SQL.ADD('AB.IDBANCO,');
    QryCbancoPref.SQL.ADD('B.NUMBANCO');

    QryCbancoPref.SQL.ADD('FROM    CONTABANCARIA CB,');
    QryCbancoPref.SQL.ADD('PESSOA PA,');
    QryCbancoPref.SQL.ADD('PESSOA PB,');
    QryCbancoPref.SQL.ADD('AGENCIABANCARIA AB,');
    QryCbancoPref.SQL.ADD('BANCO B,');
    QryCbancoPref.SQL.ADD('DEPENTIT D');

    QryCbancoPref.SQL.ADD('WHERE D.IDTITULAR = :IDTITULAR');
    QryCbancoPref.SQL.ADD('AND D.IDPESSOA  =:IDPESSOA');
    QryCbancoPref.SQL.ADD('AND CB.FLGCONTAPREF = 1');
    QryCbancoPref.SQL.ADD('AND D.IDPESSOA  = CB.IDPESSOA');
    QryCbancoPref.SQL.ADD('AND AB.IDPESSOA = CB.IDAGENCIA');
    QryCbancoPref.SQL.ADD('AND AB.IDPESSOA = PA.IDPESSOA');
    QryCbancoPref.SQL.ADD('AND AB.IDBANCO  = PB.IDPESSOA');
    QryCbancoPref.SQL.ADD('AND AB.IDBANCO  = B.IDPESSOA');

   QryCbancoPref.ParamByName('IDTITULAR').Value := pIdTitular;
   QryCbancoPref.ParamByName('IDPESSOA').Value  := pIdPessoa;
   QryCbancoPref.Open;

   if (QryCbancoPref.RecordCount>=1) and (QryCBanco.State = dsEdit) and (sContaPref = '1') then begin
     Result := False;
   end else begin
     Result := (QryCbancoPref.RecordCount>=1)
   end;
   //Renato Visoni SOL 97628 \ Kintana 431568

end;


procedure TfrmCadDepenBenef.ValidaCampoNumerico(var Key: char);
begin              //SOL 127643 Thiago Passos
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['0'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;

procedure TfrmCadDepenBenef.ValidaCampoNumericoDDD(var Key: char);
begin        //SOL 127643 Thiago Passos
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['1'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;





procedure TfrmCadDepenBenef.DBEDDDDKeyPress(Sender: TObject;
  var Key: Char); //SOL 127643 Thiago Passos
begin
  inherited;
   ValidaCampoNumericoDDD(key);
end;

procedure TfrmCadDepenBenef.DBEDNUMEROKeyPress(Sender: TObject;
  var Key: Char);  //SOL 127643 Thiago Passos
begin
  inherited;
  ValidaCampoNumerico(key);
end;

procedure TfrmCadDepenBenef.qryTelefoneAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if qryTelefoneDDI.Value = '' then
    qryTelefoneDDI.Value := '55';  //Ádler Souza - SOL 140690 KINTANA 883179
end;

procedure TfrmCadDepenBenef.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //HIGOR 184394
  if (not qryDepeNaoCadastrado.IsEmpty) and (qryDepeNaoCadastrado.FieldByName('NODEP').AsString <> '') then begin
    btnSelecionaAlguns.Enabled:= true;
    btnSelecionaTodos.Enabled:= true;
  end else begin
    btnSelecionaAlguns.Enabled:= false;
    btnSelecionaTodos.Enabled:= false;
  end;
  qryDepeNaoCadastrado.edit;
  // Fernando Santana SOL 135535 KINTANA 810963
  OpDetalhe  :=  'A';
  OpDependente := 'A';
  //flgGravaDepent := false;

  //BRUNO AZEVEDO SOL 244852 PPM 626115
  VerificaPermissao();

  dbMemInfoAdicionais.readOnly:= not((sbtnAlterar.down)  and (qryDet.fieldbyname('DATACANCELA').asDateTime = 0)); //Darivaldo Alencar SIG 27871  //edilaine - SIG25312
end;

procedure TfrmCadDepenBenef.dbdeDataCadastroExit(Sender: TObject);
begin
  inherited;
  // Ádler Souza - SOL 144030 KTN 945192
  qrydet.FieldByname('DATACADASTRO').AsString := dbdeDataCadastro.Text;
  // Fim - Ádler Souza - SOL 144030 KTN 945192
end;

procedure TfrmCadDepenBenef.ChkregreplanClick(Sender: TObject);
begin
   inherited;
   // inicio SOL 109339  Kintana 513568
   if Chkregreplan.Checked   then
   begin
//Darivaldo Alencar SIG25312 -inicio
//      if not(VerifPlanoTitular(qryaux,'2',  // idplanoprev
//                               qryDet.fieldByname('IDPESSOA').asstring // idpessoa
//                              )) and (qryDet.fieldByname('IDPESSOA').asstring <> '') then
//      begin
//         MsgDlg('Só é permitido associar um Plano que pertença a um Titular.','Atenção', mtinformation,[mbOk,mbHelp],0);
//         Chkregreplan.Checked := false;
//         Abort;
//      end
//      else
//      if not(ExistePlanoPrev(qryaux,'2',  // idplanoprev
//                            qryDet.fieldByname('IDPESSOA').asstring,  // idpessoa
//                            sIdPessJur // idpessjur
//                           )) then
//Darivaldo Alencar SIG25312 -fim
    if not qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '2',  sIdPessJur]),  []) then
      begin
         qryplano.insert;
         qryplano.fieldByname('IDPESSOA').asstring    := qryDet.fieldByname('IDPESSOA').asstring;
         qryplano.fieldByname('IDPLANOPREV').asstring := '2';
         qryplano.fieldByname('IDPESSJUR').asstring   := sIdPessJur;
         qryplano.fieldByname('IDTITULAR').asstring   := qryDet.fieldByname('IDTITULAR').asstring; //Darivaldo Alencar SIG25312
         qryplano.fieldbyname('PLANO').asstring       := getNomePlano('2');                        //edilaine - SIG25312
         qryplano.post;
         //qryplano.ApplyUpdates;//Fanuel Junior SOL151399        //edilaine - SIG25312
         qryDet.FieldByname('DEP_PLANO2').AsInteger := 1;         //edilaine - SIG25312
      end;
   end
   else
   begin
//Darivaldo Alencar SIG25312 -inicio
//      if (ExistePlanoPrev(qryaux,'2',  // idplanoprev
//                            qryDet.fieldByname('IDPESSOA').asstring, // idpessoa
//                            sIdPessJur // idpessjur
//                           )) then
//      begin
//         qryplano.close;   //Fanuel Junior SOL151399
//         qryplano.ParamByName('IDPESSOA').AsInteger := qryDet.fieldByname('IDPESSOA').AsInteger;
//         qryplano.Open;
//Darivaldo Alencar SIG25312 -fim
         if qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').AsInteger, 2,  sIdPessJur]),  []) then
         begin
              qryplano.Delete;
              //qryplano.ApplyUpdates; //Fanuel Junior SOL151399    //edilaine - SIG25312
              qryDet.FieldByname('DEP_PLANO2').AsInteger := 0;      //edilaine - SIG25312
         end;
//      end;

   end;
   // final SOL 109339  Kintana 513568
end;

procedure TfrmCadDepenBenef.ChkrebClick(Sender: TObject);
begin
   inherited;
   // inicio SOL 109339  Kintana 513568
   if Chkreb.Checked then
   begin

//Darivaldo Alencar SIG25312 -inicio
//     if not(VerifPlanoTitular(qryaux,'66', // idplanoprev
//                               qryDet.fieldByname('IDPESSOA').asstring // idpessoa
//                              )) and (qryDet.fieldByname('IDPESSOA').asstring <> '')  then
//      begin
//         MsgDlg('Só é permitido associar um Plano que pertença a um Titular.','Atenção',mtinformation,[mbOk,mbHelp],0);
//         Chkreb.Checked := false;
//         Abort;
//      end
//      else
//      if not(ExistePlanoPrev(qryaux,'66',  // idplanoprev
//                            qryDet.fieldByname('IDPESSOA').asstring, // idpessoa
//                            sIdPessJur // idpessjur
//                           )) then
//      begin
       if not qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '66',  sIdPessJur]),  []) then
          begin
//Darivaldo Alencar SIG25312 -fim
         qryplano.insert;
         qryplano.fieldByname('IDPESSOA').asstring    := qryDet.fieldByname('IDPESSOA').asstring;
         qryplano.fieldByname('IDPLANOPREV').asstring := '66';
         qryplano.fieldByname('IDPESSJUR').asstring   := sIdPessJur;
         qryplano.fieldByname('IDTITULAR').asstring   := qryDet.fieldByname('IDTITULAR').asstring;  //Darivaldo Alencar SIG25312
         qryplano.fieldbyname('DATACANCEL').asstring  := '';                                        //edilaine - SIG25312
         qryplano.fieldbyname('PLANO').asstring       := getNomePlano('66');                        //edilaine - SIG25312
         qryplano.post;
         //qryplano.ApplyUpdates;//Fanuel Junior SOL151399     //edilaine - SIG25312
         qryDet.FieldByname('DEP_PLANO66').AsInteger := 1;    //edilaine - SIG25312
       end;
   end
   else
   begin
//Darivaldo Alencar SIG25312 -inicio
//      if (ExistePlanoPrev(qryaux,'66',  // idplanoprev
//                            qryDet.fieldByname('IDPESSOA').asstring, // idpessoa
//                            sIdPessJur // idpessjur
//                           )) then
//         qryplano.Close; //Fanuel Junior SOL151399
//         qryplano.ParamByName('IDPESSOA').AsInteger := qryDet.fieldByname('IDPESSOA').AsInteger;
//         qryplano.Open;
//Darivaldo Alencar SIG25312 -fim
         if qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').AsInteger, 66,  sIdPessJur]),  []) then
         begin
            qryplano.Delete;
            //qryplano.ApplyUpdates;//Fanuel Junior SOL151399    //edilaine - SIG25312
            qryDet.FieldByname('DEP_PLANO66').AsInteger := 0;    //edilaine - SIG25312
         end;
//       end;
   end;
   // final SOL 109339  Kintana 513568
end;

procedure TfrmCadDepenBenef.ChknovoplanoClick(Sender: TObject);
begin
   inherited;
   // inicio SOL 109339  Kintana 513568
   if Chknovoplano.Checked then
   begin
//Darivaldo Alencar SIG25312 -inicio
 //     if not(VerifPlanoTitular(qryaux,'74', // idplanoprev
//                               qryDet.fieldByname('IDPESSOA').asstring // idpessoa
//                              )) and (qryDet.fieldByname('IDPESSOA').asstring <> '') then
//      begin
//         MsgDlg('Só é permitido associar um Plano que pertença a um Titular.','Atenção',mtinformation,[mbOk,mbHelp],0);
//         Chknovoplano.Checked := false;
//         Abort;
//      end
//      else
//      if not(ExistePlanoPrev(qryaux,'74',  // idplanoprev
//                            qryDet.fieldByname('IDPESSOA').asstring, // idpessoa
//                            sIdPessJur // idpessjur
//                           )) then
   if not qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, '74',  sIdPessJur]),  []) then
//Darivaldo Alencar SIG25312 -fim
      begin
         qryplano.insert;
         qryplano.fieldByname('IDPESSOA').asstring    := qryDet.fieldByname('IDPESSOA').asstring;
         qryplano.fieldByname('IDPLANOPREV').asstring := '74';
         qryplano.fieldByname('IDPESSJUR').asstring   := sIdPessJur;
         qryplano.fieldByname('IDTITULAR').asstring   :=  qryDet.fieldByname('IDTITULAR').asstring; //Darivaldo Alencar SIG25312
         qryplano.fieldbyname('PLANO').asstring       := getNomePlano('74');                        //edilaine - SIG25312
         qryplano.post;
         //qryplano.ApplyUpdates;//Fanuel Junior SOL151399      //edilaine - SIG25312
         qryDet.FieldByname('DEP_PLANO74').AsInteger := 1;      //edilaine - SIG25312
      end;
   end
   else
   begin
//Darivaldo Alencar SIG25312 -inicio
//      if (ExistePlanoPrev(qryaux,'74',  // idplanoprev
//                            qryDet.fieldByname('IDPESSOA').asstring, // idpessoa
//                            sIdPessJur // idpessjur
//                           )) then
//      begin
//         qryplano.Close;  //Fanuel Junior SOL151399
//         qryplano.ParamByName('IDPESSOA').AsInteger := qryDet.fieldByname('IDPESSOA').AsInteger;
//         qryplano.Open;
//Darivaldo Alencar SIG25312 -fim
         if qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').AsInteger, 74,  sIdPessJur]),  []) then
         begin
            qryplano.Delete;
            //qryplano.ApplyUpdates;//Fanuel Junior SOL151399      //edilaine - SIG25312
            qryDet.FieldByname('DEP_PLANO74').AsInteger := 0;      //edilaine - SIG25312
         end;
//      end;
   end;
   // final SOL 109339  Kintana 513568
end;

procedure TfrmCadDepenBenef.qryPessoaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if qryplano.Locate('IDPESSOA;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').AsInteger, sIdPessJur]), [])  then
  begin
     qryplano.delete;
  end;
end;

procedure TfrmCadDepenBenef.ToolbarButtonInsereContatoClick(
  Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := false;
  Panel4.Visible           := true;
  qryContato.Insert;
  ToolbarButtonAlteraContato.Enabled := false;
  ToolbarButtonInsereContato.Down   := true;
  ToolbarButtonExcluiContato.Enabled := false;
  GroupBox7.Height := 328;
end;


procedure TfrmCadDepenBenef.ToolbarButtonAlteraContatoClick(
  Sender: TObject);
begin
  inherited;
  //edilaine - SIG25312 - inicio
  if qryContato.Locate('IDCONTATO', qryRamal.FieldByName('IdContato').AsInteger,[]) then
  begin
    dbgTelefoneRamal.Visible := false;
    GroupBox7.Height := 328;
    Panel4.Visible   := true;
    qryContato.Edit;
    ToolbarButtonAlteraContato.Down := True;
    ToolbarButtonInsereContato.Enabled := false;
    ToolbarButtonExcluiContato.Enabled := false;
  end;
 //edilaine - SIG25312 - fim
end;

procedure TfrmCadDepenBenef.ToolbarButtonExcluiContatoClick(
  Sender: TObject);
begin
  inherited;
  //edilaine - SIG25312 - inicio
   if qryContato.Locate('IDCONTATO', qryRamal.FieldByName('IdContato').AsInteger,[]) then
      qryContato.Delete;

   //qryRamal.Close;
   //qryRamal.ParamByName('IdPessoa').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
   //qryRamal.ParamByName('IdContato').AsInteger := qryContatoTel.FieldByName('IdContato').AsInteger;
   //qryRamal.Open;
   qryRamal.Delete;

   //qryRamal.ApplyUpdates;
   //qryContato.ApplyUpdates;
   //edilaine - SIG25312  - fim
   AtualizaGridContatos();
end;


procedure TfrmCadDepenBenef.BitBtn1Click(Sender: TObject);
begin
  inherited;

  //edilaine - SIG25312 - inicio
   if qryContato.State in [dsInsert] then begin
      qryContato.FieldByName('IdContato').AsFloat  :=  LeUltRegistro(nil,'CONTATOPESS');
      //Fanuel Junior SOL 157829 Kintana 1271296
      //qryContato.FieldByName('IdEndereco').AsFloat := qryEndPess.FieldByName('IdEndereco').AsFloat;//qryEnderecoIDENDERECO.AsFloat;
      qryContato.FieldByName('IDPESSOA').Asfloat   := qryDet.FieldByName('IDPESSOA').AsFloat;

      qryRamal.Insert;
      qryRamal.FieldByName('IdTelContato').AsInteger  := LeUltRegistro(nil, 'TELCONTATO');    //nao precisa setar
      qryRamal.FieldByName('IdTelefone').AsFloat      := qryTelefoneIDTELEFONE.AsFloat;       //nao precisa setar
      qryRamal.FieldByName('IdContato').AsInteger     := qryContato.FieldByName('IdContato').AsInteger;
      qryRamal.FieldByName('Nome').AsString           := qryContato.FieldByName('Nome').AsString;
      qryRamal.FieldByName('Email').AsString          := qryContato.FieldByName('Email').AsString;
      qryRamal.FieldByName('Cargo').AsString          := qryContato.FieldByName('Cargo').AsString;
      qryRamal.FieldByName('Setor').AsString          := qryContato.FieldByName('Setor').AsString;
      qryRamal.Post;
      qryContato.Post;
      //qryContato.ApplyUpdates;
      //qryRamal.ApplyUpdates;
      qryContato.Insert;
      AtualizaGridContatos();
   end else
   if qryContato.State in [dsEdit] then begin
   begin
      qryContato.Post;
      //qryContato.ApplyUpdates;
   end;
   //edilaine - SIG25312 - fim


      dbgTelefoneRamal.Visible := true;
      Panel4.Visible           := false;
      GroupBox7.Height := 168;
      ToolbarButtonAlteraContato.Down := false;
      ToolbarButtonInsereContato.Down := false;
      ToolbarButtonAlteraContato.Enabled := true;
      ToolbarButtonInsereContato.Enabled := true;
      ToolbarButtonExcluiContato.Enabled := true;
      AtualizaGridContatos();

end;
end;


procedure TfrmCadDepenBenef.BitBtn2Click(Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := true;
  GroupBox7.Height := 168;
  Panel4.Visible           := false;
  ToolbarButtonAlteraContato.Down := false;
  ToolbarButtonInsereContato.Down := false;
  ToolbarButtonAlteraContato.Enabled := true;
  ToolbarButtonInsereContato.Enabled := true;
  ToolbarButtonExcluiContato.Enabled := true;
  qryContato.Cancel;
  AtualizaGridContatos();
end;

procedure TfrmCadDepenBenef.BitBtn3Click(Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := true;
  Panel4.Visible           := false;
  GroupBox7.Height := 168;
  ToolbarButtonAlteraContato.Down := false;
  ToolbarButtonInsereContato.Down := false;
  ToolbarButtonAlteraContato.Enabled := true;
  ToolbarButtonInsereContato.Enabled := true;
  ToolbarButtonExcluiContato.Enabled := true;
  qryContato.Cancel;
  AtualizaGridContatos();
end;

procedure TfrmCadDepenBenef.AtualizaGridContatos();
begin
    //edilaine - SIG25312 - inicio
    {qryContatoTel.Close;
    qryContatoTel.Prepare;
    qryContatoTel.ParamByName('IdTelefone').AsFloat  := qryTelefone.FieldByName('IdTelefone').AsFloat;
    qryContatoTel.ParamByName('IdPessoa').AsFloat    := qryDet.FieldByName('IDPESSOA').AsFloat;
    qryContatoTel.Open;
    qryContatoTel.Last;
    qryContatoTel.First;
    qryContatoTel.Last;
    qryContatoTel.First;
    }//edilaine - SIG25312 - fim


    if (qryContato.recordcount > 0 ) and (not(qryContato.State = dsInsert))then begin
       ToolbarButtonAlteraContato.Down := false;
       //ToolbarButtonInsereContato.Down := false;
       ToolbarButtonAlteraContato.Enabled := true;
       ToolbarButtonInsereContato.Enabled := true;
       ToolbarButtonExcluiContato.Enabled := true;
    end
    else begin
       ToolbarButtonAlteraContato.Down := false;
       //ToolbarButtonInsereContato.Down := false;
       ToolbarButtonAlteraContato.Enabled := false;
       ToolbarButtonInsereContato.Enabled := true;
       ToolbarButtonExcluiContato.Enabled := false;
    end;

    if(qryContato.State = dsInsert) then
       ToolbarButtonInsereContato.Down := true
    else
       ToolbarButtonInsereContato.Down := false;

end;


procedure TfrmCadDepenBenef.qryRamalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if pgCtrlDetalhe.ActivePage = tbsContato then
     qryRamal.FieldByName('IDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat
  else
     qryRamal.FieldByName('IDTELEFONE').AsFloat := qryTelefoneIDTELEFONE.AsFloat;

  qryRamal.FieldByName('IDTELCONTATO').AsFloat := LeUltRegistro(nil,'TELCONTATO');
end;


procedure TfrmCadDepenBenef.qryRamalUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  inherited;
  if EDBEngineError(E).Errors[0].ErrorCode = 9732 then // Campo nulo
     UpdateAction := uaSkip;
end;


procedure TfrmCadDepenBenef.dblcTelefoneCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
       with FillTable do
       begin
            Edit;
             //edilaine - SIG25312 - inicio
            if qryRamal.FieldByName('IDTELCONTATO').AsFloat = 0 then
               qryRamal.FieldByName('IDTELCONTATO').AsFloat := LeUltRegistro(nil,'TELCONTATO');
             //edilaine - SIG25312 - fim

            FieldByName('IDTELEFONE').AsFloat := LookUpTable.FieldByName('IDTELEFONE').AsFloat;
            FieldByName('NUMERO').AsString    := LookUpTable.FieldByName('NUMERO').AsString;
            FieldByName('IDCONTATO').AsFloat  := qryContatoIDCONTATO.AsFloat;   //edilaine - SIG25312
            Post;
       end;
  end;
end;


procedure TfrmCadDepenBenef.dblkpcmbSitDependenteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  //Renato Visoni SOL 156422 Kintana 1234790
  {
  //Renato Visoni SOL 152884 Kintana 1147888
  if dbdeDataNasc.Text <> '' then begin
    FazQuery(QryAux,'SELECT TRUNC((TO_DATE(SYSDATE,''DD/MM/RRRR'')-TO_DATE('+QuotedStr(dbdeDataNasc.Text)+',''DD/MM/RRRR''))/365.25,2) AS IDADE FROM DUAL');
    if QryAux.FieldByname('IDADE').asFloat < 24 then begin
      dbchkbxDesignado.Checked   := (dblkpcmbSitDependente.Text = 'NORMAL');
      dbchkbxFlgDepLegal.Checked := (dblkpcmbSitDependente.Text = 'NORMAL');
    end else begin
      dbchkbxDesignado.Checked   := False;
      dbchkbxFlgDepLegal.Checked := False;
    end;
  end;
  //Renato Visoni SOL 152884 Kintana 1147888
  }
  //Renato Visoni SOL 156422 Kintana 1234790
  AtlzSitDepen; //Darivaldo Alencar SIG25312
end;

procedure TfrmCadDepenBenef.DbChbIgnoraIRClick(Sender: TObject);
begin
  inherited;
  //Fanuel Junior SOL152834 Kintana1145687
  if (DbChbIgnoraIR.Checked) and (qryDet.State in [dsEdit]) then
     qryDet.FieldByName('FIMIMPOSTOR').AsDateTime := Date();

end;

// Vinicius Ferreira SOL 155403 KINTANA 1209420
procedure TfrmCadDepenBenef.dbgrdDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
        // pintar texto da linha de vermelho -
       if ((qryDet.RecordCount <> 0) and (qryDet.FieldByName('DATACANCELA').AsString <> '') ) then
       begin
            AFont.Color := clRed
       end
       else
       begin
            AFont.Color := clWindowText;
       end;
end;

procedure TfrmCadDepenBenef.dbeNomeDepBenExit(Sender: TObject);
begin
inherited;
  if (dbeNomeDepBen.Text <> '') AND (dbeNomeDepBen.Text <> vNomeInicial) then
  begin
    flgcpf := False;
    flgnome := True;
    JaExisteDenBenCpfNome;
    //vNomeInicial := qryDepBenPessoa.FieldByName('NOME').AsString;
  end;
end;

procedure TfrmCadDepenBenef.btnOkJaExisteDepBenefClick(Sender: TObject);
var
  sDataAux : string;
  vIdpessoaTitularDepBen : Integer;
  xQry, xQryInsertDepBen : TwwQuery;
  xQryDepBenJaBenef : TwwQuery;
begin
  inherited;
  // Executar críticas necessárias
  If dblcNomeDepenBenef.text = '' Then
  Begin
    MsgDlg('Confirme sua escolha selecionando o nome do dependente do beneficiário.','Erro',mtError,[mbOk,mbHelp],0);
    dblcNomeDepenBenef.SetFocus;
    Exit;
  End;

  If Trim(dblkpcmbTipoDependencia3.Text) = '' Then
  Begin
    MsgDlg('É necessário escolher o grau de parantesco do dependente do beneficiário.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbTipoDependencia3.SetFocus;
    Exit;
  End;

  if (Not qrySelDepBenIncluido.IsEmpty) then
  try
      xQryDepBenJaBenef := TwwQuery.Create(Nil);
      xQryDepBenJaBenef.DataBaseName := 'BaseDados';
      xQryDepBenJaBenef.Close;
      xQryDepBenJaBenef.SQL.Clear;
      xQryDepBenJaBenef.SQL.Add(' SELECT                                             ');
      xQryDepBenJaBenef.SQL.Add(' PE.IDPESSOA,                                       ');
      xQryDepBenJaBenef.SQL.Add(' PE.NOME,                                           ');
      xQryDepBenJaBenef.SQL.Add(' PE.NUMDOCUMENTO,                                   ');
      xQryDepBenJaBenef.SQL.Add(' DT.IDTITULAR,                                      ');
      xQryDepBenJaBenef.SQL.Add(' DT.IDPESSOA,                                       ');
      xQryDepBenJaBenef.SQL.Add(' DT.IDDEPENDENCIA,                                  ');
      xQryDepBenJaBenef.SQL.Add(' DT.NUMSEQUENCIA,                                   ');
      xQryDepBenJaBenef.SQL.Add(' DT.FLGDESIGNADO,                                   ');
      xQryDepBenJaBenef.SQL.Add(' DT.FLGDEPLEGAL,                                    ');
      xQryDepBenJaBenef.SQL.Add(' DT.FLGCONTAIMPOSTOR,                               ');
      xQryDepBenJaBenef.SQL.Add(' DT.FLGCONTASALARIOF,                               ');
      xQryDepBenJaBenef.SQL.Add(' DT.DATACADASTRO,                                   ');
      xQryDepBenJaBenef.SQL.Add(' PF.DATANASC,                                       ');
      xQryDepBenJaBenef.SQL.Add(' DP.DESCRICAO AS PARENTESCO,                        ');
      xQryDepBenJaBenef.SQL.Add(' PF.ESTCIVIL as DESCESTCIVIL,                       ');
      xQryDepBenJaBenef.SQL.Add('  PF.SEXO,                                          ');
      xQryDepBenJaBenef.SQL.Add('  PF.NUMDEPIRRF,                                    ');
      xQryDepBenJaBenef.SQL.Add('  PF.DATANASC,                                      ');
      xQryDepBenJaBenef.SQL.Add('  PF.NOMEPAI, PF.NOMEMAE,                           ');
      xQryDepBenJaBenef.SQL.Add('  PF.EMAILFUNCEF,                                       ');   //Jonas - SOL 178016 KINTANA 1698357
      xQryDepBenJaBenef.SQL.Add('  PF.FLGMOLESTIAGRAVE,                              ');
      xQryDepBenJaBenef.SQL.Add('  PF.DATAMOLESTIAGRAVE ,                            ');
      xQryDepBenJaBenef.SQL.Add('  PF.IDGRINSTR,                                     ');
      xQryDepBenJaBenef.SQL.Add('  DT.INICIOIMPOSTOR,                                ');
      xQryDepBenJaBenef.SQL.Add('  DT.FIMIMPOSTOR,                                   ');
      xQryDepBenJaBenef.SQL.Add('  DE.IDSITDEPENDENTE                                ');
      xQryDepBenJaBenef.SQL.Add(' FROM                                               ');
      xQryDepBenJaBenef.SQL.Add('  PESSOA        PE,                                 ');
      xQryDepBenJaBenef.SQL.Add('  PESSOAFISICA  PF,                                 ');
      xQryDepBenJaBenef.SQL.Add('  DEPENDENTE    DE,                                 ');
      xQryDepBenJaBenef.SQL.Add('  DEPENTIT      DT,                                 ');
      xQryDepBenJaBenef.SQL.Add('  DEPENTIT      DT2,                                ');
      xQryDepBenJaBenef.SQL.Add('  DEPEN         DP                                  ');
      xQryDepBenJaBenef.SQL.Add(' WHERE                                              ');
      xQryDepBenJaBenef.SQL.Add('       (DT.IDTITULAR     = DT2.IDPESSOA      )      ');
      xQryDepBenJaBenef.SQL.Add(' AND   (DT.IDTITULAR     <> DT2.IDTITULAR    )      ');
      xQryDepBenJaBenef.SQL.Add(' AND   (PF.IDPESSOA      =   PE.IDPESSOA     )      ');
      xQryDepBenJaBenef.SQL.Add(' AND   (DE.IDPESSOA      =   PF.IDPESSOA     )      ');
      xQryDepBenJaBenef.SQL.Add(' AND   (DT.IDPESSOA      =   PE.IDPESSOA     )      ');
      xQryDepBenJaBenef.SQL.Add(' AND   (DT.IDDEPENDENCIA <> ''PRP''          )      ');
      xQryDepBenJaBenef.SQL.Add(' AND   (DT.IDDEPENDENCIA =   DP.IDDEPENDENCIA)      ');
      xQryDepBenJaBenef.SQL.Add(' AND (PE.IDPESSOA = '+ qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsString +') ');
      xQryDepBenJaBenef.Open;

      if (Not xQryDepBenJaBenef.IsEmpty) then
      begin

      //qryDepBenDepen.Cancel;

      qryDepBenPessoa.Fieldbyname('IDPESSOA').AsInteger := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;
      qryDepBenPessoa.Fieldbyname('FORCA_UPDATE').AsInteger := 1;
      qryDepBenPF.Fieldbyname('IDPESSOA').AsInteger := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;
      qryDepBenPF.Fieldbyname('FORCA_UPDATE').AsInteger := 1;
      qryDepBenDepen.Fieldbyname('IDPESSOA').AsInteger := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;
      qryDepBenDepen.Fieldbyname('FORCA_UPDATE').AsInteger := 1;

              pnlDepenBenefJaExiste.SendToBack;
              pnlDepenBenefJaExiste.Visible := False;

              frmAguarde.Mostra('Aguarde um momento enquanto os dados são preparados...');

              sDataAux := '';

              Try
                bJaExisteIdPessoa := True;

                vIdpessoaTitularDepBen := qryDet.FieldByName('IDPESSOA').AsInteger;

                if (OpDetalhe = 'I') and (qryDepBen.state <> dsinsert) then
                qryDepBen.insert;

                If (OpDetalhe = 'A') and (qryDepBen.state <> dsedit) then
                qryDepBen.edit;

                qryDepBenPessoa.fieldbyname('NOME').AsString := xQryDepBenJaBenef.fieldbyname('NOME').AsString;
                qryDepBenPessoa.fieldbyname('NUMDOCUMENTO').AsString := xQryDepBenJaBenef.fieldbyname('NUMDOCUMENTO').AsString;
                qryDepBen.FieldByName('IDDEPENDENCIA').AsString := dblkpcmbTipoDependencia3.LookupValue;
                qryDepBenPF.fieldbyname('EMAILFUNCEF').AsString := xQryDepBenJaBenef.fieldbyname('EMAILFUNCEF').AsString;   //Jonas - SOL 178016 KINTANA 1698357
                qryDepBenPF.fieldbyname('NOMEPAI').AsString := xQryDepBenJaBenef.fieldbyname('NOMEPAI').AsString;
                qryDepBenPF.fieldbyname('NOMEMAE').AsString := xQryDepBenJaBenef.fieldbyname('NOMEMAE').AsString;
                qryDepBenPF.fieldbyname('DATANASC').AsString := xQryDepBenJaBenef.fieldbyname('DATANASC').AsString;
                qryDepBenPF.fieldbyname('ESTCIVIL').AsString := xQryDepBenJaBenef.fieldbyname('DESCESTCIVIL').AsString;
                qryDepBenPF.fieldbyname('FLGMOLESTIAGRAVE').AsString := xQryDepBenJaBenef.fieldbyname('FLGMOLESTIAGRAVE').AsString;
                qryDepBenPF.fieldbyname('DATAMOLESTIAGRAVE').AsString := xQryDepBenJaBenef.fieldbyname('DATAMOLESTIAGRAVE').AsString;
                qryDepBenPF.fieldbyname('IDGRINSTR').AsString := xQryDepBenJaBenef.fieldbyname('IDGRINSTR').AsString;
                qryDepBenDepen.FieldByName('IDSITDEPENDENTE').AsString := xQryDepBenJaBenef.fieldbyname('IDSITDEPENDENTE').AsString;

                //Início - William Santana - SOL 209384/15928 KIN 2062832
                {
                    if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = '' then
                    begin
                       cmbEstCivDepBen.itemindex := -1;
                       cmbEstCivDepBen.text := '';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'S' then
                    begin
                       cmbEstCivDepBen.itemindex := 0;
                       cmbEstCivDepBen.text := 'Solteiro(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'C' then
                    begin
                       cmbEstCivDepBen.itemindex := 1;
                       cmbEstCivDepBen.text := 'Casado(a) ou Equiparado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'D' then
                    begin
                       cmbEstCivDepBen.itemindex := 2;
                       cmbEstCivDepBen.text := 'Divorciado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'E' then
                    begin
                       cmbEstCivDepBen.itemindex := 3;
                       cmbEstCivDepBen.text := 'Desquitado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'J' then
                    begin
                       cmbEstCivDepBen.itemindex := 4;
                       cmbEstCivDepBen.text :=  'Separado(a) Judicial';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'V' then
                    begin
                       cmbEstCivDepBen.itemindex := 5;
                       cmbEstCivDepBen.text :=  'Viúvo(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'M' then
                    begin
                       cmbEstCivDepBen.itemindex := 6;
                       cmbEstCivDepBen.text := 'Marital';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'P' then
                    begin
                       cmbEstCivDepBen.itemindex := 7;
                       cmbEstCivDepBen.text := 'Separado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'O' then
                    begin
                       cmbEstCivDepBen.itemindex := 8;
                       cmbEstCivDepBen.text := 'Outros';
                    end;
                    sEstCivDepBen := qryDepBenPF.fieldbyname('ESTCIVIL').AsString;
                  }
                    qryAux.Close;
                    qryAux.Sql.Clear;
                    qryAux.Sql.Add(' SELECT DESCRICAO FROM ESTADOCIVIL WHERE ESTCIVIL = '+quotedStr(qryDepBenPF.fieldbyname('ESTCIVIL').AsString) );
                    qryAux.Open;
                    cmbEstCivDepBen.text := qryAux.fieldbyname('DESCRICAO').AsString;
                  //Término - William Santana - SOL 209384/15928 KIN 2062832

                qryDepBenPF.FieldByName('SEXO').AsString := xQryDepBenJaBenef.fieldbyname('SEXO').AsString;
                qryDepBenPF.fieldbyname('NUMDEPIRRF').AsInteger := xQryDepBenJaBenef.fieldbyname('NUMDEPIRRF').AsInteger;
                qryDepBen.FieldByName('FLGDESIGNADO').AsInteger := xQryDepBenJaBenef.fieldbyname('FLGDESIGNADO').AsInteger;
                qryDepBen.FieldByName('FLGDEPLEGAL').AsInteger := xQryDepBenJaBenef.fieldbyname('FLGDEPLEGAL').AsInteger;
                qryDepBen.FieldByName('FLGCONTAIMPOSTOR').AsInteger :=  xQryDepBenJaBenef.fieldbyname('FLGCONTAIMPOSTOR').AsInteger;
                qryDepBen.FieldByName('FLGCONTASALARIOF').AsInteger :=  xQryDepBenJaBenef.fieldbyname('FLGCONTASALARIOF').AsInteger;
                qryDepBen.fieldbyname('INICIOIMPOSTOR').AsString := xQryDepBenJaBenef.fieldbyname('INICIOIMPOSTOR').AsString;
                qryDepBen.fieldbyname('FIMIMPOSTOR').AsString := xQryDepBenJaBenef.fieldbyname('FIMIMPOSTOR').AsString;

                //qryDepBen.Post;

              Finally
                frmAguarde.Apaga;
              End;
        end else
        begin

              pnlDepenBenefJaExiste.SendToBack;
              pnlDepenBenefJaExiste.Visible := False;

              frmAguarde.Mostra('Aguarde um momento enquanto os dados são preparados...');


      //qryDepBenDepen.FieldByName('IDPESSOA').AsInteger  := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;

      //qryDepBenDepen.cancel;

      qryDepBenPessoa.Fieldbyname('IDPESSOA').AsInteger  := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;
      qryDepBenPessoa.Fieldbyname('FORCA_UPDATE').AsInteger  := 1;
      qryDepBenPF.Fieldbyname('IDPESSOA').AsInteger  := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;
      qryDepBenPF.Fieldbyname('FORCA_UPDATE').AsInteger  := 1;
      qryDepBenDepen.Fieldbyname('IDPESSOA').AsInteger := qrySelDepBenIncluido.fieldbyname('IDPESSOA').AsInteger;
      qryDepBenDepen.Fieldbyname('FORCA_UPDATE').AsInteger := 1;

              Try
                bJaExisteIdPessoa := True;

                if (OpDetalhe = 'I') and (qryDepBen.state <> dsinsert) then
                qryDepBen.insert;

                If (OpDetalhe = 'A') and (qryDepBen.state <> dsedit) then
                qryDepBen.edit;

                qryDepBenPessoa.fieldbyname('NOME').AsString := qrySelDepBenIncluido.fieldbyname('NOME').AsString;
                qryDepBenPessoa.fieldbyname('NUMDOCUMENTO').AsString := qrySelDepBenIncluido.fieldbyname('NUMDOCUMENTO').AsString;
                qryDepBen.FieldByName('IDDEPENDENCIA').AsString := dblkpcmbTipoDependencia3.LookupValue;
                qryDepBenPF.fieldbyname('DATANASC').AsString := qrySelDepBenIncluido.fieldbyname('DATANASC').AsString;
                qryDepBenPF.fieldbyname('NOMEPAI').AsString := qrySelDepBenIncluido.fieldbyname('NOMEPAI').AsString;
                qryDepBenPF.fieldbyname('EMAILFUNCEF').AsString := qrySelDepBenIncluido.fieldbyname('EMAILFUNCEF').AsString; //Jonas - SOL 178016 KINTANA 1698357
                qryDepBenPF.fieldbyname('NOMEMAE').AsString := qrySelDepBenIncluido.fieldbyname('NOMEMAE').AsString;
                qryDepBenPF.fieldbyname('NUMDEPIRRF').AsInteger := qrySelDepBenIncluido.fieldbyname('NUMDEPIRRF').AsInteger;
                qryDepBenPF.fieldbyname('ESTCIVIL').AsString := qrySelDepBenIncluido.fieldbyname('ESTCIVIL').AsString;

                //Início - William Santana - SOL 209384/15928 KIN 2062832
                {
                    if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = '' then
                    begin
                       cmbEstCivDepBen.itemindex := -1;
                       cmbEstCivDepBen.text := '';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'S' then
                    begin
                       cmbEstCivDepBen.itemindex := 0;
                       cmbEstCivDepBen.text := 'Solteiro(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'C' then
                    begin
                       cmbEstCivDepBen.itemindex := 1;
                       cmbEstCivDepBen.text := 'Casado(a) ou Equiparado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'D' then
                    begin
                       cmbEstCivDepBen.itemindex := 2;
                       cmbEstCivDepBen.text := 'Divorciado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'E' then
                    begin
                       cmbEstCivDepBen.itemindex := 3;
                       cmbEstCivDepBen.text := 'Desquitado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'J' then
                    begin
                       cmbEstCivDepBen.itemindex := 4;
                       cmbEstCivDepBen.text :=  'Separado(a) Judicial';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'V' then
                    begin
                       cmbEstCivDepBen.itemindex := 5;
                       cmbEstCivDepBen.text :=  'Viúvo(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'M' then
                    begin
                       cmbEstCivDepBen.itemindex := 6;
                       cmbEstCivDepBen.text := 'Marital';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'P' then
                    begin
                       cmbEstCivDepBen.itemindex := 7;
                       cmbEstCivDepBen.text := 'Separado(a)';
                    end
                    else if qryDepBenPF.fieldbyname('ESTCIVIL').AsString = 'O' then
                    begin
                       cmbEstCivDepBen.itemindex := 8;
                       cmbEstCivDepBen.text := 'Outros';
                    end;
                    sEstCivDepBen := qryDepBenPF.fieldbyname('ESTCIVIL').AsString;
                    }
                    qryAux.Close;
                    qryAux.Sql.Clear;
                    qryAux.Sql.Add(' SELECT DESCRICAO FROM ESTADOCIVIL WHERE ESTCIVIL = '+quotedStr(qryDepBenPF.fieldbyname('ESTCIVIL').AsString) );
                    qryAux.Open;
                    cmbEstCivDepBen.text := qryAux.fieldbyname('DESCRICAO').AsString;
                  //Término - William Santana - SOL 209384/15928 KIN 2062832

                qryDepBenPF.FieldByName('SEXO').AsString := qrySelDepBenIncluido.fieldbyname('SEXO').AsString;

                //qryDepBen.Post;

              Finally
                frmAguarde.Apaga;
              End;
        end;
  finally
    xQryDepBenJaBenef.Close;
    FreeAndNil(xQryDepBenJaBenef);
  end;
end;

procedure TfrmCadDepenBenef.btnCancelJaExisteDepBenefClick(
  Sender: TObject);
begin
  inherited;
  pnlDepenBenefJaExiste.SendToBack;
  pnlDepenBenefJaExiste.Visible := False;
  bJaExisteIdPessoa        := False;
end;

// Vinicius Ferreira
procedure TfrmCadDepenBenef.JaExisteDenBenCpfNome;
begin

  // Verifica se existe participante o mesmo Nome
  if (OpDetalhe = 'I') or (OpDetalhe = 'A') then
  begin
    if (Trim(dbeNomeDepBen.Text) <> '') or (Trim(DBEdit2.Text) <> '')  then
    begin

      qrySelDepBenIncluido.Close;
      qrySelDepBenIncluido.SQL.Clear;
      qrySelDepBenIncluido.SQL.Add(' SELECT (PE.NOME ||'' - ''|| PF.DATANASC ||'' - ''|| PE.NUMDOCUMENTO) AS DESCRICAO ,PE.IDPESSOA, PE.NOME, PE.NUMDOCUMENTO, PF.DATANASC, PF.NOMEPAI, PF.NOMEMAE,PF.EMAILFUNCEF, PF.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF ');
      qrySelDepBenIncluido.SQL.Add(' FROM PESSOA PE, PESSOAFISICA PF ');
      qrySelDepBenIncluido.SQL.Add(' WHERE ');
      qrySelDepBenIncluido.SQL.Add(' PE.IDPESSOA = PF.IDPESSOA(+) ');
      //if (flgnome) and (flgcpf) then
      if (Trim(dbeNomeDepBen.Text) <> '') or (Trim(DBEdit2.Text) <> '') then
       qrySelDepBenIncluido.SQL.Add(' AND   ((PE.NOME like '+QuotedStr(UpperCase(dbeNomeDepBen.Text + '%'))+') or (PE.NUMDOCUMENTO = '+QuotedStr(Trim(DBEdit2.Text))+' ))  ');
      //if (flgcpf) then
      if (Trim(dbeNomeDepBen.Text) = '') or (Trim(DBEdit2.Text) <> '') then
       qrySelDepBenIncluido.SQL.Add(' AND PE.NUMDOCUMENTO = '+QuotedStr(Trim(DBEdit2.Text))+'');
      //if (flgnome) then
      if (Trim(dbeNomeDepBen.Text) <> '') and (Trim(DBEdit2.Text) = '') then
       qrySelDepBenIncluido.SQL.Add(' AND PE.NOME like '+QuotedStr(UpperCase(dbeNomeDepBen.Text + '%'))+'');
      qrySelDepBenIncluido.Open;

    end else begin
      exit;
    end;

      if (Not qrySelDepBenIncluido.IsEmpty) then
      begin

      if (MsgDlg('Já existe um dependente de beneficiário cadastrado com o mesmo Nome ou CPF,'+#13+
      'deseja continuar ? ','Confirmação', mtConfirmation,  [mbYes, mbNo], 0) = mrNo) then exit;

      {if (qryDepBenPessoa.state = dsinsert) then begin
        qryDepBenPessoa.Insert;
        qryDepBenPessoa.FieldByName('IDPESSOA').AsInteger   := LeUltRegistro(nil,'PESSOA');
        qryDepBenPF.Insert;
      end else if (qryDepBenPessoa.state = dsedit) then begin
        qryDepBenPessoa.edit;
        qryDepBenPF.edit;
      end;}

        dblkpcmbTipoDependencia3.Clear;
        pnlDepenBenefJaExiste.Visible := True;
        pnlDepenBenefJaExiste.Left    := 148;
        pnlDepenBenefJaExiste.Top     := 183;
        pnlDepenBenefJaExiste.BringToFront;
        btnOkJaExisteDepBenef.enabled := False;
        dblcNomeDepenBenef.SetFocus;
      end;
  end;
end;
// Vinicius Ferreira

procedure TfrmCadDepenBenef.dblkpcmbTipoDependencia3Change(
  Sender: TObject);
begin
  inherited;
  If (dblcNomeDepenBenef.text <> '') and (dblkpcmbTipoDependencia3.text <> '') then
    btnOkJaExisteDepBenef.enabled := True
  else
    btnOkJaExisteDepBenef.enabled := False;
end;

procedure TfrmCadDepenBenef.dblcNomeDepenBenefChange(Sender: TObject);
begin
  inherited;
  If (dblcNomeDepenBenef.text <> '') and (dblkpcmbTipoDependencia3.text <> '') then
    btnOkJaExisteDepBenef.enabled := true
  else
    btnOkJaExisteDepBenef.enabled := False;
end;

procedure TfrmCadDepenBenef.dbeNomeDepBenEnter(Sender: TObject);
begin
  inherited;
   vNomeInicial := dbeNomeDepBen.Text;
end;

procedure TfrmCadDepenBenef.DBEdit2Enter(Sender: TObject);
begin
  inherited;
  vNumdocInicial := Trim(DBEdit2.Text) ;
end;

procedure TfrmCadDepenBenef.qryDepBenPessoaUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var
  Contador: Integer;
begin
  inherited;
  if (UpdateKind = ukInsert) then
  begin
    if (DataSet.FieldByName('Forca_Update').Value = 1) then
    begin
      qryAuxInsert.SQL.Clear;
      qryAuxInsert.SQL.Text := StringReplace(TUpdateSQL(TwwQuery(DataSet).UpdateObject).ModifySQL.Text, ':OLD_IDPESSOA', ':IDPESSOA', []);
      qryAuxInsert.Prepare;

      for Contador := 0 to qryAuxInsert.Params.Count-1 do
      begin
        qryAuxInsert.Params[Contador].DataType := DataSet.FieldByName(qryAuxInsert.Params[Contador].Name).DataType;
        qryAuxInsert.Params[Contador].Value := DataSet.FieldByName(qryAuxInsert.Params[Contador].Name).Value;
      end;

      qryAuxInsert.ExecSQL;
      UpdateAction := uaApplied;
    end;
  end;
end;

procedure TfrmCadDepenBenef.qryDepBenPFUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var
  Contador: Integer;
begin
  inherited;
  if (UpdateKind = ukInsert) then
  begin
    if (DataSet.FieldByName('Forca_Update').Value = 1) then
    begin
      qryAuxInsert.SQL.Clear;
      qryAuxInsert.SQL.Text := StringReplace(TUpdateSQL(TwwQuery(DataSet).UpdateObject).ModifySQL.Text, ':OLD_IDPESSOA', ':IDPESSOA', []);
      qryAuxInsert.Prepare;

      for Contador := 0 to qryAuxInsert.Params.Count-1 do
      begin
        qryAuxInsert.Params[Contador].DataType := DataSet.FieldByName(qryAuxInsert.Params[Contador].Name).DataType;
        qryAuxInsert.Params[Contador].Value := DataSet.FieldByName(qryAuxInsert.Params[Contador].Name).Value;
      end;

      qryAuxInsert.ExecSQL;
      UpdateAction := uaApplied;
    end;
  end;
end;

procedure TfrmCadDepenBenef.qryDepBenDepenUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var
  Contador: Integer;
begin
  inherited;
  if (UpdateKind = ukInsert) then
  begin
    if (DataSet.FieldByName('Forca_Update').Value = 1) then
    begin
      qryAuxInsert.SQL.Clear;
      qryAuxInsert.SQL.Text := StringReplace(TUpdateSQL(TwwQuery(DataSet).UpdateObject).ModifySQL.Text, ':OLD_IDPESSOA', ':IDPESSOA', []);
      qryAuxInsert.Prepare;

      for Contador := 0 to qryAuxInsert.Params.Count-1 do
      begin
        qryAuxInsert.Params[Contador].DataType := DataSet.FieldByName(qryAuxInsert.Params[Contador].Name).DataType;
        qryAuxInsert.Params[Contador].Value := DataSet.FieldByName(qryAuxInsert.Params[Contador].Name).Value;
      end;

      qryAuxInsert.ExecSQL;
      UpdateAction := uaApplied;
    end;
  end;
end;

//Fanuel Junior SOL162981 Kintana1390416
function TfrmCadDepenBenef.ValidaParticipanteInvalido() : boolean;
var
bInvalido : boolean;
i : integer;
const
viIdSitFunc : array [1..7] of integer = (18,21,22,24,32,33,55);
begin
      bInvalido := false;
      result    := true;

      for i := 0 to Length(viIdSitFunc) - 1 do
      begin
         if (qry.FieldByName('IDSITFUNC').AsInteger = viIdSitFunc[i]) and (dblkpcmbSitDependente.Text = 'INVÁLIDO(A)')then
            bInvalido := true;
      end;

      if bInvalido then
      begin
         if  dbdtInicioInvalidez.Text = '' then
         begin
            MessageDlg(' Não é possível cadastrar um dependente '+
                       ' de participante assistido com situação inválida,'+ #13 +
                       ' sem o preenchimento da data de início da invalidez.', mtWarning, [mbOK,mbHelp], 0);
            result := false;
         end else
         if dbdtInicioInvalidez.Date < dbdeDataNasc.Date then
         begin
            MessageDlg(' A data de início da invalidez não pode '+#13+
                       ' ser menor que a data de nascimento do dependente', mtWarning, [mbOK,mbHelp], 0);
            result := false;
         end;

         {Início - Michelle Mota - SIG 25312}
         if (dbdtInicioIR.text <> '') and ((dbdtFimIR.text = '') or (dbdtFimIR.text > FormatDateTime('DD/MM/YYYY',NOW))) and (DbChbIgnoraIR.Checked) and (dblkpcmbSitDependente.Text = 'INVÁLIDO(A)') then
           begin
             MessageDlg('Participante cadastrado como inválido: Verificar se existe laudo médico!', mtWarning, [mbOK,mbHelp], 0);
           end;
         {Término - Michelle Mota - SIG 25312}
      end
      else
         begin
            if (dbdtInicioInvalidez.Date < dbdeDataNasc.Date) and  (dbdtInicioInvalidez.Text <> '' )then
            begin
               MessageDlg(' A data de início da invalidez não pode '+#13+
                          ' ser menor que a data de nascimento do dependente', mtWarning, [mbOK,mbHelp], 0);
               result := false;
            end;
       end;
end;
//Fanuel Junior SOL162981 Kintana1390416

procedure TfrmCadDepenBenef.dbdtFimIRExit(Sender: TObject);
begin
  inherited;
 /////SOL 162578 KINTANA 1389694 Douglas.Siqueira
    if (trim(dbdtFimIR.text)<>'') and (dbdtFimIR.Date < DataHoje) then
    begin
      MsgDlg('A Data Fim de IR não pode ser menor que a Data Atual.','Erro',mtError,[mbOk,mbHelp],0);
      dbdtFimIR.SetFocus;
      Abort;
    end;
  ////douglas
end;

procedure TfrmCadDepenBenef.dbchksolicitacontasalarioClick(
  Sender: TObject);
begin
  inherited;
 if  qryPF.State in [dsedit, dsinsert] then
  begin
      if dbchksolicitacontasalario.Checked   then
      begin
         dtsolicitacontasalario.Enabled := true
      end
      else
      begin
         qryPF.FieldByName('DTSOLICITACONTASALARIO').Value := null;
         dtsolicitacontasalario.Enabled := false;
      end;
  end;
end;

//WILLIAM MOREIRA DA SILVA SOL 165677
function TfrmCadDepenBenef.DataUltimaAlteracao(IdPessoa : Integer): boolean;
var Ssql : String;
    qryUltimaAlteracao : TwwQuery;
begin
     Result := True;

     Ssql := 'SELECT * FROM logaltelegpart l  , usuariosistema u'+
             ' where  u.idusuario =  substr(to_char(l.trguseralteracao),3,10)'+
             //edilaine SIG119407 : inicio
             ' and substr(to_char(l.trguseralteracao),1,2) = ''CM'' '+
      			 //' and substr(to_char(l.trguseralteracao),1,3) <> ''DML'' '+   // SOL 189470 KINTANA 1787378
			       //' and substr(to_char(l.trguseralteracao),1,3) <> ''ETL'' '+   // SOL 189470 KINTANA 1787378
             //edilaine SIG119407 : fim
             ' AND l.idpessoa = '+ IntToStr(IdPessoa) +
             ' AND l.trgdtinclusao > (sysdate) -1' +
             ' AND l.trgdtinclusao in (SELECT max(ll.trgdtinclusao) as trgdtinclusao '  +
                        ' FROM logaltelegpart ll , usuariosistema uu  ' +
                        ' where  uu.idusuario =  substr(to_char(ll.trguseralteracao),3,10) ' +
                        ' AND ll.idpessoa = '+ IntToStr(IdPessoa) +' ' +
                        //edilaine SIG119407 : inicio
                        ' and substr(to_char(ll.trguseralteracao),1,2) = ''CM'' )';    //edilaine SIG120500
                        //' and substr(to_char(ll.trguseralteracao),1,3) <> ''DML'' ' +
                        //' and substr(to_char(ll.trguseralteracao),1,3) <> ''ETL''  ) ' ; // SOL 189470 KINTANA 1787378
                        //edilaine SIG119407 : fim


//     with qryAux do
//     begin
          qryUltimaAlteracao := TwwQuery.Create(nil);
          qryUltimaAlteracao.DatabaseName := 'BaseDados';

          qryUltimaAlteracao.Close;
          qryUltimaAlteracao.SQL.Clear;
          qryUltimaAlteracao.SQL.add(Ssql);
          qryUltimaAlteracao.Open;
          if not qryUltimaAlteracao.isEmpty {and (qryTeste.RecordCount > 0)} Then
          begin
               if MsgDlg('O técnico '+qryUltimaAlteracao.FieldByName('NomeUsuario').AsString+', realizou alterações no cadastro dessa pessoa nas últimas 24 horas, deseja continuar?','Confirmação',
               mtConfirmation,[mbYes,mbNo],0) = mrNo
               then begin
                    Result := False;
               End

               else begin
                    qryUltimaAlteracao.Close;
                    qryUltimaAlteracao.SQL.Clear;
                    qryUltimaAlteracao.SQL.Add(' UPDATE elegpatro');
                    qryUltimaAlteracao.SQL.Add(' SET idpessoa =' +IntToStr(IdPessoa));
                    qryUltimaAlteracao.SQL.Add(' WHERE idpessoa = ' +IntToStr(IdPessoa));
                 Try
                    qryUltimaAlteracao.ExecSql;
                 Except
                    frmAguarde.Apaga;
                    MsgDlg('Erro ao tentar atualizar o cadastro de Elegível e Participanete.','Erro',mtError,[mbOk,mbHelp],0);
                 End;
             End;
          End
          else begin
               qryUltimaAlteracao.Close;
               qryUltimaAlteracao.SQL.Clear;
               qryUltimaAlteracao.SQL.Add('UPDATE elegpatro');
               qryUltimaAlteracao.SQL.Add('SET idpessoa =' +IntToStr(IdPessoa));
               qryUltimaAlteracao.SQL.Add('WHERE idpessoa = ' +IntToStr(IdPessoa));
               Try
                  qryUltimaAlteracao.ExecSql;
               Except
                     frmAguarde.Apaga;
                     MsgDlg('Erro ao tentar atualizar o cadastro de Elegível e Participanete.','Erro',mtError,[mbOk,mbHelp],0);
               End;
          End;
//     End;
       freeAndNil(qryUltimaAlteracao);
end;
//WILLIAM MOREIRA DA SILVA SOL 165677
procedure TfrmCadDepenBenef.dbchkSalarioProcessadoClick(Sender: TObject);
begin
  inherited;
  if  qryPF.State in [dsedit, dsinsert] then
  begin
      if dbchkSalarioProcessado.Checked  then
      begin
         dtcontasalarioprocessada.Enabled := true;
      end
      else
      begin
         qryPF.FieldByName('DTCONTASALARIOPROCESSADA').Value:= null;
         dtcontasalarioprocessada.Enabled := false;
      end;
  end;
end;

//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
// procedure que compara os campos da tela CadastroPrev-Cadastros-Dependentes e Beneficiário-Cadastro
procedure TfrmCadDepenBenef.ComparaCampos;
var
    sMsg : String;
 begin

   if not (ValidaPlano(SidPessoa))then
   begin
      Exit;
   end;

   sMsg :='Houve alteração nos dependentes. É necessário revisar o benefício do NOVO PLANO.';

   if  {(NOT EmitiuMsgNovoPlano)                             AND}
       ((sNome <> dbeNome.Text)                              OR
       (sMatricula <> dbeMatricula.Text)                    OR
       (sFatorRH <> dbeTipoSang.Text)                       OR
       (sCPF <> dbeCPF.Text)                                OR
       (sEmailDepen <> dbeEMail.Text)                       OR
       (sNomePai <> dbeNomePai.Text)                        OR
       (sNomeMae <> dbeNomeMae.Text)                        OR
       (sDNasci <> dbdeDataNasc.Text)                       OR
       (sDcadas <> dbdeDataCadastro.Text)                   OR
       (sDfaleci <> dbdeDataMorte.Text)                     OR
       (sSitDepen <> dblkpcmbSitDependente.Text)            OR
       ( sGraParen <> dblkpcmbTipoDependencia.Text)         OR
       ( sGrauIns <> dblkpcmbGrauInstr.Text)                OR
       ( sEstCivil <> cmbEstCiv.Text)                       OR
       ( sRegPlan <> Chkregreplan.Checked)                  OR
       ( sReb <> Chkreb.Checked)                            OR
       ( sNovoPlano <> Chknovoplano.Checked)                OR
       (sSexo <> dbrdgrpSexo.ItemIndex)                     OR
       (sIRRF <> dbseNumDepIRRF.Text)                       OR
       (sSalFam <> dbseNumDepSalF.Text)                     OR
       (sTotal <> dbseNumDepTot.Text)                       OR
       (sNaturalidade <> dblkpcmbNaturalidade.Text)         OR
       (sNacionalidade <> dblkpcmbNacionalidade.Text)       OR
       (sCidade <> dblkpcmbCidade.Text)                     OR
       (sMolestiaGrave <> wwDBCBIsentoIrrf.ItemIndex) OR
       (sIsentoIR <> dbrgrpIsentoIR.ItemIndex)              OR
       (sIniMolestia <> dbdtMolestiaGrave.Text)             OR
       (sFimMolestia <> CMDateTimePicker5.Text)          OR
       (sDesignado <> dbchkbxDesignado.Checked)             OR
       (sSalarioFamilia <> dbchkbxContaSalarioF.Checked)    OR
       (sImpostoRenda <> dbchkbxFlgContaImpostoR.Checked)   OR
       (sDepenLegal <> dbchkbxFlgDepLegal.Checked)          OR
       (sFlgPlanoSaude <> dbchkbxFlgPlanoSaude.Checked)     OR       // SIG 71037 Ferrari
       (sIgnImpRenda <> DbChbIgnoraIR.Checked)              OR
       (sIsentoImpRenda <> dbchkIsentoIR.Checked)           OR
       (sDatIniIR <> dbdtInicioIR.Text)                     OR
       (sDatFimIR <> dbdtFimIR.Text)                        OR
       (sDatIniSalFam <> dbdtInicioSalFamilia.Text)         OR
       (sDatFimSalFam <> dbdtFimSalFamilia.Text)            OR
       (sDatIniInvali <> dbdtInicioInvalidez.Text)          OR
       (sDarFimInvali <> dbdtFimInvalidez.Text)             OR
       (sDescIRINSS <> DbChbSomaIR.Checked)                 OR
       (sSolContSal <> dbchksolicitacontasalario.Checked)   OR
       (sContSalProc <> dbchkSalarioProcessado.Checked)     OR
       (sDataSoli <> dtsolicitacontasalario.Text)           OR
       (sDataProcess <> dtcontasalarioprocessada.Text))     Then
   begin
      MsgDlg(sMsg,'Informação',mtInformation,[mbOk,mbHelp],0);
   end;
end;
  //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim


 //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834 - Inicio
 // procedure que preenche variaveis criadaspara comparar os campos da tela CadastroPrev-Cadastros-Dependentes e Beneficiário-Cadastro
procedure TfrmCadDepenBenef.PreencheCompCamp;
begin
    sNome := dbeNome.Text;
    sMatricula := dbeMatricula.Text;
    sFatorRH  := dbeTipoSang.Text;
    sCPF := dbeCPF.Text;
    sEmailDepen := dbeEMail.Text;
    sNomePai := dbeNomePai.Text;
    sNomeMae := dbeNomeMae.Text;
    sDNasci := dbdeDataNasc.Text;
    sDcadas := dbdeDataCadastro.Text;
    sDfaleci := dbdeDataMorte.Text;
    sSitDepen := dblkpcmbSitDependente.Text;
    sGraParen := dblkpcmbTipoDependencia.Text;
    sGrauIns := dblkpcmbGrauInstr.Text;
    sEstCivil := cmbEstCiv.Text;
    sRegPlan := Chkregreplan.Checked;
    sReb := Chkreb.Checked;
    sNovoPlano := Chknovoplano.Checked;
    sSexo := dbrdgrpSexo.ItemIndex;
    sIRRF := dbseNumDepIRRF.Text;
    sSalFam := dbseNumDepSalF.Text;
    sTotal := dbseNumDepTot.Text;
    sNaturalidade := dblkpcmbNaturalidade.Text;
    sNacionalidade := dblkpcmbNacionalidade.Text;
    sCidade := dblkpcmbCidade.Text;
    sMolestiaGrave := wwDBCBIsentoIrrf.ItemIndex;
    sIsentoIR := dbrgrpIsentoIR.ItemIndex;
    sIniMolestia := dbdtMolestiaGrave.Text;
    sFimMolestia := CMDateTimePicker5.Text;
    sDesignado := dbchkbxDesignado.Checked;
    sSalarioFamilia := dbchkbxContaSalarioF.Checked;
    sImpostoRenda := dbchkbxFlgContaImpostoR.Checked;
    sDepenLegal := dbchkbxFlgDepLegal.Checked;
    sFlgPlanoSaude := dbchkbxFlgPlanoSaude.Checked;                            //SIG 71037 Ferrari
    sIgnImpRenda := DbChbIgnoraIR.Checked;
    sIsentoImpRenda := dbchkIsentoIR.Checked;
    sDatIniIR := dbdtInicioIR.Text;
    sDatFimIR := dbdtFimIR.Text;
    sDatIniSalFam := dbdtInicioSalFamilia.Text;
    sDatFimSalFam := dbdtFimSalFamilia.Text;
    sDatIniInvali := dbdtInicioInvalidez.Text;
    sDarFimInvali := dbdtFimInvalidez.Text;
    sDescIRINSS := DbChbSomaIR.Checked;
    sSolContSal := dbchksolicitacontasalario.Checked;
    sContSalProc := dbchkSalarioProcessado.Checked;
    sDataSoli := dtsolicitacontasalario.Text;
    sDataProcess :=  dtcontasalarioprocessada.Text;
end;
 //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim

 //Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Inicio
 //Function que valida se o titular possui um "NOVO PLANO"
 //IDPLANOPREV=74 IDSITPART IN (11,12,4,15)
function TfrmCadDepenBenef.ValidaPlano(IDtitular : String): Boolean;
var
   qryValida : TwwQuery;
begin
   Result:=false;
   try
   qryValida := TwwQuery.Create(Self);
   qryValida.DatabaseName:= qry.DatabaseName;

   with qryValida do
   begin
       SQL.Add('select * from partprevplan pl ');
       SQL.Add('  where pl.idpessoa = '+IDtitular);
       SQL.Add('  and pl.idsitpart in (11,12,4,15)');
       SQL.Add('  and pl.idplanoprev = 74');
       open;
       if not isEmpty then
       begin
          Result:=true;
       end;
   end;
   finally
         qryValida.free;
   end;
end;
//inicio André Oliveira SOL 165678 KINTANA 1470728
function TfrmCadDepenBenef.VerificaTipoDenpedit(sFiltro, sIdTitular, sIDPessoa, sSexo: String): Boolean;
var qryValida : TwwQuery;
begin
     try
         qryValida := TwwQuery.Create(nil);
         qryValida.DatabaseName := qryDepBenDepen.DatabaseName;
         Result :=  False;
         with qryValida do
         begin
              Close;
              SQL.Clear;
              SQL.ADD(' SELECT D.IDDEPENDENCIA, P.SEXO FROM DEPENTIT D, PESSOAFISICA P ');
              SQL.ADD(' WHERE D.IDTITULAR = '+ sIdTitular);
              SQL.ADD(' AND D.IDPESSOA <> '+sIDPessoa);
              SQL.ADD(' AND P.IDPESSOA =  D.IDPESSOA ');
              SQL.ADD(' AND D.Datacancela is null ');   // SOL 193044 KINTANA 1836694
              SQL.ADD(sFiltro);
//              SQL.ADD(' AND D.IDPESSOA <> IDTITULAR '); //Everson TIBERO
              SQL.ADD(' AND D.IDPESSOA <> D.IDTITULAR '); //Everson TIBERO
              Open;
              while not Eof do
              begin
                   if(sSexo = '')then
                      Result := True
                   else if(sSexo = FieldByName('SEXO').AsString) then
                      Result := True;
                   Next;
              end;
         end;
     finally
         FreeAndNil(qryValida);
     end;
end;
//fim André Oliveira SOL 165678 KINTANA 1470728
//Rodrigo de Brito Figueredo - SOL 172704  Kintana 1567834  - Fim

procedure TfrmCadDepenBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar SIG 27871 -inicio
  bGridPadrao:= true;
  bbtnCancelarDet.click;
  //Darivaldo Alencar SIG 27871 fim
  EmitiuMsgNovoPlano := False; // Rodrigo de Brito Figueredo SOL 172704 Kintana 1567834

  //HIGOR 184394
  Panel6.Visible := true;
  OpDependente := ' ';
  btnSelecionaAlguns.Enabled:= false;
  btnSelecionaTodos.Enabled:= false;
  flgGravaDepent := false;
  bDepNaoCad := False; // Felipe A. Santos SOL: 208475 KINTANA: 2016859
  qryDependencia.Sql.text := qryDependenciaAux.Sql.text; // higor
     qryDepeNaoCadastrado.Close;
   if not qryDepeNaoCadastrado.Prepared then qryDepeNaoCadastrado.prepare;
   qryDepeNaoCadastrado.ParamByName('PIDTITULAR').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
   qryDepeNaoCadastrado.open;

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
    pnlReprLegal.visible := false ;
     pnlGrdReprLegal.visible := True ;
  end;
  //Término - William Santana SOL 161550 KIN 1717512

end;

procedure TfrmCadDepenBenef.btnSelecionaTodosClick(Sender: TObject);
begin
    qryDepeNaoCadastrado.First;
    while not(qryDepeNaoCadastrado.Eof) do
    begin
       qryDepeNaoCadastrado.edit;
       qryDepeNaoCadastrado.FieldByName('SELECIONADO').AsString := 'S';
       qryDepeNaoCadastrado.post;
       qryDepeNaoCadastrado.Next;
       //bbtnConfirmar.enabled := false; //Darivaldo Alencar SIG25312
    end;
    qryDepeNaoCadastrado.First;
    SelecionaDenpNCadastrado;
    if not qryDepeNaoCadastrado.IsEmpty then begin
       flgGravaDepent := true;
        //bbtnConfirmar.enabled := false; //Darivaldo Alencar SIG25312
    end;
end;

procedure TfrmCadDepenBenef.btnSelecionaAlgunsClick(Sender: TObject);
begin
    qryDepeNaoCadastrado.First;
    SelecionaDenpNCadastrado;
    if not qryDepeNaoCadastrado.IsEmpty then   begin
       flgGravaDepent := true;
       //bbtnConfirmar.enabled := false; //Darivaldo Alencar SIG25312
    end;
end;

procedure TfrmCadDepenBenef.GravarDepenNaoCadastrado;
begin

  //dbeNome.text := qryDepeNaoCadastrado.FieldByName('NODEP').AsString; // Felipe A. Santos SOL: 208475 KINTANA: 2016859 - comentado
   qryPessoa.FieldByName('NOME').AsString := qryDepeNaoCadastrado.FieldByName('NODEP').AsString; // Felipe A. Santos SOL: 208475 KINTANA: 2016859

  //William Moreira da Silva - SOL 220494 KTN 2053990
  //qrydet.fieldByNAme('MATRICULA').AsString := qryDepeNaoCadastrado.FieldByName('NRMATREMP').AsString;
  //qrydet.fieldByNAme('MATRICULA').AsString := qryDepeNaoCadastrado.FieldByName('NRMATREMP').AsString;
  //William Moreira da Silva - SOL 220494 KTN 2053990
  qrydet.fieldByNAme('FLGCONTAIMPOSTOR').AsString := qryDepeNaoCadastrado.FieldByName('IDIR').AsString;
  qrydet.fieldByNAme('INICIOSALARIOF').AsString := qryDepeNaoCadastrado.FieldByName('IDIR').AsString;
  qrydet.fieldByNAme('IDDEPENDENCIA').AsString := qryDepeNaoCadastrado.FieldByName('CDRELDEPND').AsString;
  dblkpcmbTipoDependencia.LookupValue := qryDepeNaoCadastrado.FieldByName('CDRELDEPND').AsString;

  if  qryDepeNaoCadastrado.FieldByName('CDSEXO').AsString = 'M' then   begin
       dbrdgrpSexo.ItemIndex := 0;
       sSexo := 0;

       // Thiago Melo SOL 234563 PPM 437212
       if qryPF.State in [DsInsert, DsEdit] then begin
         qryPF.FieldByName('SEXO').AsString := qryDepeNaoCadastrado.FieldByName('CDSEXO').AsString;
       end;
       // Thiago Melo SOL 234563 PPM 437212
   end
  else if  qryDepeNaoCadastrado.FieldByName('CDSEXO').AsString = 'F' then begin
       dbrdgrpSexo.ItemIndex := 1;
       sSexo := 1;

       // Thiago Melo SOL 234563 PPM 437212
       if qryPF.State in [DsInsert, DsEdit] then begin
         qryPF.FieldByName('SEXO').AsString := qryDepeNaoCadastrado.FieldByName('CDSEXO').AsString;
       end;
       // Thiago Melo SOL 234563 PPM 437212
  end;

  //Inicio - William Santana - SOL 161550 KIN 1717512
  if qryPF.State in [DsInsert, DsEdit] then begin
    qryPF.FieldByName('DATANASC').AsDateTime := qryDepeNaoCadastrado.FieldByName('DTNASCDEP').AsDateTime;

  end;
  //Término - William Santana - SOL 161550 KIN 1717512

  sDNasci := qryDepeNaoCadastrado.FieldByName('DTNASCDEP').AsString;

  //Início - William Santana - 209384/15928 KIN 2062832
  {
  if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = '' then
  begin
     cmbEstCiv.itemindex := -1;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := '';
     sEstCiv := ' ';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'S' then
  begin
     cmbEstCiv.itemindex := 0;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Solteiro(a)';
     sEstCiv := 'S';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'C' then
  begin
     cmbEstCiv.itemindex := 1;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Casado(a) ou Equiparado(a)';
     sEstCiv := 'C';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'D' then
  begin
     cmbEstCiv.itemindex := 2;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Divorciado(a)';
     sEstCiv := 'D';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'E' then
  begin
     cmbEstCiv.itemindex := 3;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Desquitado(a)';
     sEstCiv := 'E';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'J' then
  begin
     cmbEstCiv.itemindex := 4;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text :=  'Separado(a) Judicial';
     sEstCiv := 'J';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'V' then
  begin
     cmbEstCiv.itemindex := 5;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text :=  'Viúvo(a)';
     sEstCiv := 'V';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'M' then
  begin
     cmbEstCiv.itemindex := 6;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Marital';
     sEstCiv := 'M';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'P' then
  begin
     cmbEstCiv.itemindex := 7;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Separado(a)';
     sEstCiv := 'P';
  end
  else if qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString = 'O' then
  begin
     cmbEstCiv.itemindex := 8;
     qryDet.FieldByName('DESCESTCIVIL').AsString := cmbEstCiv.text;
     cmbEstCiv.text := 'Outros';
     sEstCiv := 'O';
  end;
  }
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO FROM ESTADOCIVIL WHERE ESTCIVIL = '+quotedStr(qryDepeNaoCadastrado.fieldbyname('CDESTCIV').AsString) );
  qryAux.Open;
  qryDet.FieldByName('DESCESTCIVIL').AsString := qryAux.fieldbyname('DESCRICAO').AsString;
  cmbEstCivDepBen.text                        := qryAux.fieldbyname('DESCRICAO').AsString;
  //Término - William Santana - 209384/15928 KIN 2062832


  //bbtnConfirmar.enabled := false; //Darivaldo Alencar SIG25312
end;

procedure TfrmCadDepenBenef.dbgrdDetnCadastradoDblClick(Sender: TObject);
begin
    if (not (qryDepeNaoCadastrado.IsEmpty)) and (OpDependente = 'A') then begin
       qryDepeNaoCadastrado.edit;
    end;
end;

procedure TfrmCadDepenBenef.SelecionaDenpNCadastrado;
begin
    if not qryDepeNaoCadastrado.isempty then
    begin
      if qryDepeNaoCadastrado.FieldByName('selecionado').AsString = 'S' then
      begin
           bDepNaoCad := True; // Felipe A. Santos SOL: 208475 KINTANA: 2016859

           // Inicio - Flávio Souza SOL: 208475 KINTANA: 2016859;
           if (qryDepeNaoCadastrado.FieldByName('CDRELDEPND').AsString = 'PAI') then
           begin
                if (VerificaPaiMae) then
                begin
                  inherited;
                  sbtnInsDet.Down := true;
                  sbtnInsDetClick(self);
                  GravarDepenNaoCadastrado;
                end
                else
                begin
                  // Felipe A. Santos SOL: 208475 KINTANA: 2016859
                  qryDepeNaoCadastrado.Next;

                  if not qryDepeNaoCadastrado.Eof then
                     SelecionaDenpNCadastrado;

                  // Felipe A. Santos SOL: 208475 KINTANA: 2016859
                end;
           end
           else
           begin
             inherited;
             sbtnInsDet.Down := true;
             sbtnInsDetClick(self);
             GravarDepenNaoCadastrado;
           end;
           // Fim - Flávio Souza SOL: 208475 KINTANA: 2016859;

           if (qryDepeNaoCadastrado.Eof)then
           begin
               CancelaCadastroDenpNCadastrado;
               exit;
           end;

      end
      else
      begin
           if not (qryDepeNaoCadastrado.Eof)then
           begin
                 qryDepeNaoCadastrado.next;
                 //bbtnConfirmar.enabled := false; //Darivaldo Alencar SIG25312
                 SelecionaDenpNCadastrado;
           end
           else
           begin
                CancelaCadastroDenpNCadastrado;
                //bbtnConfirmar.enabled := true; //Darivaldo Alencar SIG25312
                exit;
           end;
      end;
    end;
end;

procedure TfrmCadDepenBenef.CancelaCadastroDenpNCadastrado;
begin
     Panel6.Visible := true;
   EmitiuMsgNovoPlano := False;// Rodrigo de Brito Figueredo SOL 172704 Kintana 1567834
   if (qryContato.State = dsInsert) then
    qryContato.Cancel;

// Caso Inserindo e Tenha dado Erro Exclui Registro
  If (OpDetalhe = 'I') And (QryBenef.State in [DsEdit]) then begin
    QryBenef.Delete;
  End;

  inherited;

  if pgctrlDetalhe.ActivePage = tbsDet
  then begin
    if EstadoAnt = dsInsert
    then begin
       dec(iseq);
       EstadoAnt := qryDet.State;
    end;
    qryPessoa.Cancel;
    qryPF.Cancel;
    qryDepen.Cancel;
  end;

  if pgctrlDetalhe.ActivePage = tbsDepBen
  then begin

    if EstadoAnt = dsInsert
    then begin
       dec(iseqDepBen);
       EstadoAnt := qryDepBen.State;
    end;

    qryDepBenPessoa.Cancel;
    qryDepBenPF.Cancel;
    qryDepBenDepen.Cancel;

    qryDepBenPessoa.Filtered := False;
    qryDepBenPessoa.Filter   := '';

    qryDepBenPF.Filtered := False;
    qryDepBenPF.Filter   := '';

    qryDepBenDepen.Filtered := False;
    qryDepBenDepen.Filter   := '';

    qryDepBen.Filtered := False;
    qryDepBen.Filter   := '';

    qryDepBen.Filter   := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryDepBen.Filtered := True;

  end;

  if pgctrlDetalhe.ActivePage = tbsContaBanco
  then begin
    qryCBanco.Filtered := False;
    qryCBanco.Filter   := '';

    qryCBanco.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryCBanco.Filtered := True;
  end;

  //if pgctrlDetalhe.ActivePage = tbsBeneficiario then  //William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then       //William Santana SOL 161550 KIN 1717512
  begin
    qryBenef.Filtered := False;
    qryBenef.Filter := '';

    sFiltroBenef    := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
    sFiltroBenef    := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);

    qryBenef.Filter   := sFiltroBenef;
    qryBenef.Filtered := True;
  end;

end;

// TADEU PASSOS SOL 190718 KTN 1804738
procedure TfrmCadDepenBenef.btnBuscarEnderecoClick(Sender: TObject);
begin
  inherited;
  try
    AbrirForm(frmConsEnderCadElegivel,TfrmConsEnderCadElegivel,False);
    frmConsEnderCadElegivel.SetCadDepenBenef(True);
    frmConsEnderCadElegivel.ShowModal;
  finally
  end;
end;
// TADEU PASSOS SOL 190718 KTN 1804738

// TADEU PASSOS SOL 190718 KTN 1804738
procedure TfrmCadDepenBenef.HabilitaCamposEndereco(Estado : Boolean);
begin
  dbeLogradouro.Enabled    := Estado;
  dbeBairro.Enabled        := Estado;
  dbeCEP.Enabled           := Estado;
  cmbCidade.Enabled        := Estado;
  dbeEstado.Enabled        := Estado;
  dbePais.Enabled          := Estado;

  dbeNumero.Enabled        := Estado;
  dbedNomeEndereco.Enabled := Estado;
  dbeComplemento.Enabled   := Estado;
  GroupBox1.Enabled        := Estado;

  //Cássio Rovaroto - SIG nº 136301 - Início
  //dbedNomeEndereco.Enabled := Estado;
  if Sistema.IdModulo = 452 then
  begin
    dbedNomeEndereco.Enabled := False;
    if bTtravarCadastro then
      btnBuscarEndereco.Enabled := False
    else
      btnBuscarEndereco.Enabled := True;
  end
  else
    dbedNomeEndereco.Enabled := Estado;
  //Cássio Rovaroto - SIG nº 136301 - Fim

end;
// TADEU PASSOS SOL 190718 KTN 1804738
// INICIO - Flávio Souza SOL: 200953 KINTANA: 1952412;

procedure TfrmCadDepenBenef.BtnMatriculaClick(Sender: TObject);
Var
  sProxMat : String;
begin
  inherited;

    if (Not qryDet.FieldByName('MATRICULA').IsNull) then
    begin
        if MsgDlg('Já existe uma matrícula para este beneficiário. Realmente deseja gerar uma nova?  ', 'Atenção',mtWarning,[mbyes,mbno],0) = mrYes then
        begin
           if (qryDet.State in [dsEdit]) and (Trim(prmMASCMATPENS) <> '') then
           begin
              //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
              If Trim(dbeMatricula.Text) <> '' Then
              begin
                 MatriculaBenefInicial := Trim(dbeMatricula.Text);
              end;
                sProxMat := GeraMatricula(QryAux, iIdCalculo);
                qryDet.Edit;
                qryDet.FieldByName('MATRICULA').AsString := sProxMat;
                MatriculaBenefInicial := sProxMat;
           end;
        end else
        Exit;
    end
    else
    begin
      if (qryDet.State in [dsEdit]) and (Trim(prmMASCMATPENS) <> '') then
        begin
           //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
           if Trim(dbeMatricula.Text) <> '' then
           begin
             MatriculaBenefInicial := Trim(dbeMatricula.Text);
           end;
            sProxMat := GeraMatricula(QryAux, iIdCalculo);
            qryDet.Edit;
            qryDet.FieldByName('MATRICULA').AsString := sProxMat;
            MatriculaBenefInicial := sProxMat;
        end;
    end;
end;

procedure TfrmCadDepenBenef.CmeDetalheCancel(Sender: TObject);
begin
  //Inicio - William Santana - SOL 161550 KIN 1717512
  if qryReprLegal.state in [dsEdit, dsInsert] then
     qryReprLegal.Cancel;
  //Termino - William Santana - SOL 161550 KIN 1717512

  inherited;
  BtnMatricula.Visible := False;
end;

// FIM - Flávio Souza SOL: 200953 KINTANA: 1952412;

 // Felipe A. Santos SOL 208093 KTN 2016011 - início
function TfrmCadDepenBenef.DependenteMaiorIdade: boolean;
var
   qryValida : TwwQuery;
   dDataNasc : TDateTime;
   iIdade : integer;

begin

   try
      qryValida := TwwQuery.Create(nil);
      qryValida.DatabaseName := 'BaseDados';

      dDataNasc := qryDet.FieldByName('DATANASC').AsDateTime;
      iIdade  := Trunc((Date - dDataNasc) / 365.25); // .25 por conta do ano bisexto

      if dDataNasc = 0 then
      begin
         Result := True;
         Exit;
      end;

      if iIdade < 18 then
      begin
        // verifica se está emancipado
        qryValida.SQL.Clear;
        qryValida.SQL.Add('SELECT * FROM PESSOAPARAM ' +
                          ' WHERE IDPARAM =  :IDPARAM  ' +
                          '   AND IDPESSOA = :IDPESSOA '
                          );
        qryValida.ParamByName('IDPARAM').AsInteger := 185; // parâmetro de emancipação
        qryValida.ParamByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
        qryValida.Open;

        Result := not(qryValida.IsEmpty);
      end
      else
        Result := True;
   finally
      FreeAndNil(qryValida);
   end;

end;
  // Felipe A. Santos SOL 208093 KTN 2016011 - fim


// edilaine - SIG 25313 - inicio
function TfrmCadDepenBenef.DependenteMenor16Anos : boolean;
var
   dDataNasc : TDateTime;
   iIdade : integer;
begin

  dDataNasc := dbdeDataNasc.date;  // qryDet.FieldByName('DATANASC').AsDateTime;    // dtpNascDepBen.Date

  if dDataNasc = 0 then
  begin
     Result := False;
     Exit;
  end;

  iIdade := Trunc((Date - dDataNasc) / 365.25); // .25 por conta do ano bisexto
  Result := iIdade <= 16;
end;
// edilaine - SIG 25313 - fim


procedure TfrmCadDepenBenef.wwDBCBIsentoIrrfChange(Sender: TObject);
Var
    ModoEd :  Boolean;
begin
  if (dsPF.state IN [dsEdit, dsInsert]) then
  begin

    // Se não for selecionado nenhum tipo de isenção, desliga o flag de Isenção de IRRF.
    if wwDBCBIsentoIrrf.ItemIndex = -1  then
    begin
      If qryPF.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
      begin
        qryPf.FieldByName('TIPOISENCAOIRRF').AsInteger  := -1;
        qryPf.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;

        dbrgrpIsentoIR.ItemIndex := 1;

      end;
      BitBtnHistorico.Enabled     := False;
      //dbdtMolestiaGrave.text := ''; //Taffarel - SIG68507/71228
      //CMDateTimePicker5.text := ''; //Taffarel - SIG68507/71228
      dbrgrpMolestiaGrave.Visible := False;//higor
      //dbrgrpMolestiaGrave.Enabled := False; //Taffarel - SIG68507/71228
    end
    Else
    Begin
      // Se for selecionado algum tipo de isenção, aciona o flag de Isenção de IRRF.
      if (wwDBCBIsentoIrrf.ItemIndex >= 0 ) and (wwDBCBIsentoIrrf.ItemIndex < 2) then
      begin
        dbrgrpIsentoIR.ItemIndex  := 0;
        //qryPF.FieldByName('FLGISENTOIRRF').AsInteger    := 1;
        qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;  //higor
        //dbrgrpMolestiaGrave.Enabled := False; //Taffarel - SIG68507/71228
      end;
      // Testa se foi selecionado "molestia grave"
      if wwDBCBIsentoIrrf.ItemIndex = 2 then
      begin
        dbrgrpIsentoIR.ItemIndex := 0;
        //qryPF.FieldByName('FLGISENTOIRRF').AsInteger := 1;
        qryPF.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 1;
        BitBtnHistorico.Enabled     := true;
        dbrgrpMolestiaGrave.Visible := true;
        //dbrgrpMolestiaGrave.Enabled := true; //Taffarel - SIG68507/71228
        //dbdtMolestiaGrave.Enabled := True; //Taffarel - SIG68507/71228
        //CMDateTimePicker5.Enabled := True; //Taffarel - SIG68507/71228
        //BitBtnHistorico.Click;
      end;
    end;
  end;
end;

procedure TfrmCadDepenBenef.BitBtnHistoricoClick(Sender: TObject);
var
  idPessoaEleg : integer;
  idPessoa :Integer;
begin
  inherited;
  idPessoaEleg := qryPF.FieldByName('IdPessoa').asInteger; //Taffarel - SIG68507/71228

  //Taffarel - SIG68507/71228 - início
  {frmHistMolestiaGrave  := TfrmHistMolestiaGrave.Create(Self,idPessoaEleg, dbdtMolestiaGrave.Date , CMDateTimePicker5.Date); //Fanuel Junior SOL 148773 KINTANA 1063150
  try
    frmHistMolestiaGrave.ShowModal;
    idPessoa := qryPF.ParamByName('IdPessoa').AsInteger;
    qryPF.Close;
    qryPF.ParamByName('IdPessoa').AsInteger := idPessoa;
    qryPF.Open;
    qryPF.Edit;
  finally
    FreeAndNil(frmHistMolestiaGrave);
  end;}

  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.StartTransaction;

  frmHistMolestiaGrave := TfrmHistMolestiaGrave.Create(Self,idPessoaEleg,sbtnAlterar.Down); //Taffarel - SIG63063
  try
    frmHistMolestiaGrave.ShowModal;
    if frmHistMolestiaGrave.modalresult = mrOK then
    begin
    PreencheDataMolestiaGrave(frmHistMolestiaGrave.qryHistMolestiaGrave.FieldByName('DTINICIO').AsString, frmHistMolestiaGrave.qryHistMolestiaGrave.FieldByName('DTFINAL').AsString);
    end
  finally
    FreeAndNil(frmHistMolestiaGrave);
  end;
  //Taffarel - SIG68507/71228 - fim

end;


procedure TfrmCadDepenBenef.dbrgrpIsentoIRClick(Sender: TObject);
begin
  { SOL 158955 - KINTANA 1613780 - JRM6}
  if (dsPF.state IN [dsEdit, dsInsert]) then
  begin

    if dbrgrpIsentoIR.ItemIndex = 0 then
    begin
      qryPf.FieldByName('FLGISENTOIRRF').AsInteger := 1;
      wwDBCBIsentoIrrf.Enabled := true;
      wwDBCBIsentoIrrf.SetFocus;
    end
    else
    begin
      //qryPF.FieldByName('DATAMOLESTIAGRAVE').AsString := ''; //Taffarel - SIG68507/71228
      //qryPF.FieldByName('DATAFIMMOLESTIA').AsString := ''; //Taffarel - SIG68507/71288

      qryPf.FieldByName('FLGISENTOIRRF').AsInteger    := 0;

      if qryPf.FieldByName('TIPOISENCAOIRRF').AsInteger <> -1 then
      begin
        wwDBCBIsentoIrrf.ItemIndex  := -1;
        wwDBCBIsentoIrrf.Enabled    := false;
        qryPf.FieldByName('TIPOISENCAOIRRF').AsInteger  := -1;
        qryPf.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
      end;
      wwDBCBIsentoIrrf.Enabled := false;

    end;
  end;
end;

//Taffarel - SIG68507/71228 - início
//procedure TfrmCadDepenBenef.InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia: string; iIdPessoa: integer);
//var
//  dtDataFimMolestia, dtDatainicioMolestia : TDateTime;
//begin
//  dtDataFimMolestia     :=  CMDateTimePicker5.Date;
//  dtDatainicioMolestia  :=  dbdtMolestiaGrave.Date;
//
//  qryMolestiaGrave.Close;
//  qryMolestiaGrave.SQL.Clear;
//  qryMolestiaGrave.SQL.Add('SELECT DTINICIO, DTFINAL FROM HSTMOLESTIAGRAVE');
//  qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa));
//  qryMolestiaGrave.Open;
//
//
//  // Fernando Santana >> SOL 148331 KINTANA  1040733 -- coloquei o comando >> and (trim(dbdtMolestiaGrave.Text) <> '')
//  // if //(dbrgrpFlgMolestiaGrave.ItemIndex = 0) and
//  if ((trim(dbdtMolestiaGrave.Text) <> '') or (trim(CMDateTimePicker5.Text) <> '') )then
//  begin
//    qryMolestiaGrave.Close;
//    qryMolestiaGrave.SQL.Clear;
//    qryMolestiaGrave.SQL.Add('SELECT DTINICIO, DTFINAL FROM HSTMOLESTIAGRAVE');
//    qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa));
//    qryMolestiaGrave.Open;
//
//    // Fernando Santana >> SOL 148331 KINTANA  1040733 -- coloquei o comando >> and (trim(dbdtMolestiaGrave.Text) <> '')
//    if (wwDBCBIsentoIrrf.ItemIndex = 2) and ((trim(dbdtMolestiaGrave.Text) <> '') or (trim(CMDateTimePicker5.Text) <> '') ) then
//    begin
//      if qryMolestiaGrave.isEmpty then
//      begin
//        qryMolestiaGrave.Close;
//        qryMolestiaGrave.SQL.Clear;
//
//        if sDataFimMolestia <> '30/12/1899' then
//        begin
//          qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO,DTFINAL) VALUES ');
//        end
//        else
//        begin
//          qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO) VALUES ');
//        end;
//
//        qryMolestiaGrave.SQL.Add( '('+IntToStr(iIdPessoa) +',');
//
//
//        if sDataFimMolestia <> '30/12/1899' then
//        begin
//          qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDatainicioMolestia +''', ''DD/MM/YYYY''),');//Marcio Sanches Spinosa SOL 238755 PPM 507686
//          qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDataFimMolestia    +''', ''DD/MM/YYYY''))');//Marcio Sanches Spinosa SOL 238755 PPM 507686
//        end
//        else
//        begin
//          qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDatainicioMolestia +''', ''DD/MM/YYYY''))');//Marcio Sanches Spinosa SOL 238755 PPM 507686
//        end;
//
//        qryMolestiaGrave.execSQL;
//
//      end
//      else
//      begin
//
//        qryMolestiaGrave.Close;
//        qryMolestiaGrave.SQL.Clear;
//        qryMolestiaGrave.SQL.Add('SELECT DTINICIO, DTFINAL FROM HSTMOLESTIAGRAVE ');
//        qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa)+    'AND');
//        qryMolestiaGrave.SQL.Add('DTINICIO = ''' + sDatainicioMolestiaAlterar +  ''' AND '); // Thiago Melo SOL 240598 PPM 538132
//        qryMolestiaGrave.SQL.Add('DTFINAL IS NULL');
//        qryMolestiaGrave.Open;
//
//
//        if not(qryMolestiaGrave.IsEmpty) then
//        begin                                                                                              //     dtDataFimMolestia  ,  dtDatainicioMolestia , dtDatainicioMolestia, dtDatainicioMolestia
//          if(sDataFimMolestia <> '30/12/1899') and (sDatainicioMolestiaAlterar = sDatainicioMolestia) and (dtDataFimMolestia > dtDatainicioMolestia) then
//          begin
//            qryMolestiaGrave.Close;
//            qryMolestiaGrave.SQL.Clear;
//            qryMolestiaGrave.SQL.Add('UPDATE HSTMOLESTIAGRAVE');
//            qryMolestiaGrave.SQL.Add('SET DTFINAL = ''' + sDataFimMolestia +'''');
//            qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa));
//            qryMolestiaGrave.execSQL;
//          end
//          else
//          begin
//            if(dtDataFimMolestia < dtDatainicioMolestia) and (dtDataFimMolestia > 0 ) then
//            begin
//              ShowMessage('A data de fim deve ser superior a data de inicio da Molestia');
//              dbdtMolestiaGrave.Date := StrToDate(sDatainicioMolestiaAlterar);
//              Abort;
//            end;
//          end;
//        end
//        else
//        if(dtDatainicioMolestia > dtDataFimMolestiaAlterar) and ((sDataFimMolestia = '30/12/1899') or (dtDataFimMolestia > dtDatainicioMolestia))  then
//        begin
//          qryMolestiaGrave.Close;
//          qryMolestiaGrave.SQL.Clear;
//          qryMolestiaGrave.SQL.Add('SELECT IDPESSOA,DTINICIO,DTFINAL FROM HSTMOLESTIAGRAVE ');
//          qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa) +' AND');
//          qryMolestiaGrave.SQL.Add('   DTINICIO = '''+sDatainicioMolestia +''' AND ');
//          qryMolestiaGrave.SQL.Add('   DTFINAL = '''+sDataFimMolestia+'''');
//          qryMolestiaGrave.Open;
//
//          if  qryMolestiaGrave.IsEmpty then
//          begin
//              qryMolestiaGrave.Close;
//              qryMolestiaGrave.SQL.Clear;
//
//              if sDataFimMolestia <> '30/12/1899' then
//              begin
//                qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO,DTFINAL) VALUES ');
//              end
//              else
//              begin
//                qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO) VALUES ');
//              end;
//
//              qryMolestiaGrave.SQL.Add( '('+IntToStr(iIdPessoa) +',');
//
//              if sDataFimMolestia <> '30/12/1899' then
//              begin
//                qryMolestiaGrave.SQL.Add( '''' +sDatainicioMolestia +''',');
//                qryMolestiaGrave.SQL.Add( '''' +sDataFimMolestia    +''')');
//              end
//              else
//              begin
//                qryMolestiaGrave.SQL.Add( '''' +sDatainicioMolestia +''')');
//              end;
//
//              qryMolestiaGrave.execSQL;
//          end;
//        end
//        else
//        begin
//          //BRUNO AZEVEDO SOL 154387 KINTANA 1180946
////          if (dtDataFimMolestiaAlterar <> dtDataFimMolestia) or (dtDatainicioMolestiaAlterar <> dtDatainicioMolestia) then begin
////            ShowMessage('O novo período de moléstia grave deve estar fora do período da moléstia anterior.');
////            Abort;
////          end;
//        end;
//      end;
//    end;
//  end;
//end;
//Taffarel - SIG68507/71228 - fim

procedure TfrmCadDepenBenef.dbdtMolestiaGraveClick(Sender: TObject);
begin
//  inherited;
  if (dsPF.state IN [dsEdit, dsInsert]) then
  begin
       if dbdtMolestiaGrave.text = '' then
       qryPF.FieldByName('DATAMOLESTIAGRAVE').AsString:= '';
  end;

end;

procedure TfrmCadDepenBenef.CMDateTimePicker5Click(Sender: TObject);
begin
  //inherited;
   if (dsPF.state IN [dsEdit, dsInsert]) then
  begin
       if CMDateTimePicker5.text = '' then
       qryPF.FieldByName('DATAFIMMOLESTIA').AsString:= '';
  end;
end;

// Inicio - Flávio Souza SOL: 208475 KINTANA: 2016859;

// Busca pelo nome do Pai e da Mãe do Dependente na tabela "PESSOAFISICA".
procedure TfrmCadDepenBenef.AtribuiNome;
var
   qryBuscaPaiMae : TwwQuery;
   lsSQL : string;
begin
   if (dblkpcmbTipoDependencia.Text = 'PAI/MÃE') and (dbrdgrpSexo.ItemIndex <> -1)  then
   begin
      try
        //dbeNome.Enabled := False; //Darivaldo Alencar SIG25312
        qryBuscaPaiMae := TwwQuery.Create(nil);
        qryBuscaPaiMae.DatabaseName := 'BaseDados';

        lsSQL := 'SELECT NOMEPAI, NOMEMAE FROM PESSOAFISICA WHERE IDPESSOA = :IDTITULAR';

        qryBuscaPaiMae.SQL.Clear;
        qryBuscaPaiMae.Close;
        qryBuscaPaiMae.SQL.Add(lsSQL);
        qryBuscaPaiMae.ParamByName('IDTITULAR').AsInteger := qry.ParamByName('IDPESSOA').AsInteger;
        qryBuscaPaiMae.Open;

        if ((Trim(qryBuscaPaiMae.FieldByName('NOMEMAE').AsString) = '') and (dbrdgrpSexo.ItemIndex  = 1))
        or ((Trim(qryBuscaPaiMae.FieldByName('NOMEPAI').AsString) = '') and (dbrdgrpSexo.ItemIndex  = 0)) then
        begin
           if bDepNaoCad then // Felipe A. Santos SOL: 208475 KINTANA: 2016859
           begin
              qryPessoa.FieldByName('NOME').AsString := qryDepeNaoCadastrado.FieldByName('NODEP').AsString; // Felipe A. Santos SOL: 208475 KINTANA: 2016859
           end
           else
           begin
             if MsgDlg('Pai/Mãe não registrado no cadastro do elegível/participante. Deseja prosseguir?','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo then
             begin
                 bbtnCancelarDetClick(Self);
                 Abort;
             end
             else
              dbeNome.Enabled := True;
           end;
        end
        else
        begin
		   if (qryPessoa.state in[dsEdit,dsInsert]) then //SIG79881
              begin
                 if dbrdgrpSexo.ItemIndex = 0 then // Masculino
                 begin
                   qryPessoa.FieldByName('NOME').AsString := qryBuscaPaiMae.FieldByName('NOMEPAI').AsString;
                   //dbeNome.Enabled := False; //Darivaldo Alencar SIG25312
                 end
                 else if dbrdgrpSexo.ItemIndex = 1 then // Feminino
                 begin
                   qryPessoa.FieldByName('NOME').AsString := qryBuscaPaiMae.FieldByName('NOMEMAE').AsString;
                   //dbeNome.Enabled    := False; //Darivaldo Alencar SIg25312
                 end;
			  end;
        end;

      finally
          qryBuscaPaiMae.Close;
          FreeAndNil(qryBuscaPaiMae);
      end;

   end;
end;

// Seleciona o Tipo de Dependente.
procedure TfrmCadDepenBenef.dblkpcmbTipoDependenciaChange(Sender: TObject);
begin
    ControlaCampoNome;
end;

// Seleciona o Sexo do Dependente.
procedure TfrmCadDepenBenef.dbrdgrpSexoChange(Sender: TObject);
begin
    ControlaCampoNome;
end;

// Habilita os campos após verificação do Sexo, do Tipo e do Grau de Parentesco do Dependente.
function TfrmCadDepenBenef.HabilitaCampoNome: Boolean;
begin
     Result := ((dbrdgrpSexo.ItemIndex <> -1) and (dblkpcmbTipoDependencia.Text <> '') and (dblkpcmbTipoDependencia.Text <> 'PAI/MÃE'));
end;

// Verifica e retorna o Grau de parentesco "PAI/MÃE" do dependente.
function TfrmCadDepenBenef.VerificaPaiMae : Boolean;
var
   sSQl, sPai, sMae : String;
   bResult : Boolean;
begin
  try
    sSQL := 'SELECT NOMEPAI, NOMEMAE FROM PESSOAFISICA WHERE IDPESSOA = :IDTITULAR';

    qryAux.SQL.Clear;
    qryAux.Close;
    qryAux.SQL.Add(sSQL);
    qryAux.ParamByName('IDTITULAR').AsInteger := qry.ParamByName('IDPESSOA').AsInteger;
    qryAux.Open;

    sPai := Trim(qryAux.FieldByName('NOMEPAI').AsString);
    sMae := Trim(qryAux.FieldByName('NOMEMAE').AsString);

  except
    on e : exception do
    begin
           MsgDlg(e.Message,  'Erro', mtError, [mbOk], 0);
           Result := False;
    end;
  end;


   if qryDepeNaoCadastrado.FieldByName('CDSEXO').AsString = 'M' then
      bResult := ((sPai = Trim(qryDepeNaoCadastrado.FieldByName('NODEP').AsString)) or (sPai = ''))
   else
      bResult := ((sMae = Trim(qryDepeNaoCadastrado.FieldByName('NODEP').AsString)) or (sMae = ''));

  if not bResult then
  begin
     MsgDlg('Pai/Mãe divergente do registrado no cadastro do elegível/participante. Não foi possível efetuar o cadastro. Favor verificar.','Erro',mtError,[mbOk],0);
  end;

  Result := bResult;

end;

procedure TfrmCadDepenBenef.ControlaCampoNome;
begin
  if qryDet.State in [dsInsert] then
  begin
   // dbeNome.Enabled := HabilitaCampoNome; // Verifica a habilitação do campo nome somente quando for "INSERT" //Darivaldo Alencar SIG25312

    AtribuiNome;                         // Se o tipo de Dependencia for "Pai/Mãe" atribui o valor do nome do Pai ou da Mãe para o campo nome
    if not dbeNome.Enabled then
           dbeNome.Color := clMenu
    else
           dbeNome.Color := clWindow;
  end;
end;

// Fim - Flávio Souza SOL: 208475 KINTANA: 2016859;


//Início - William Santana - SOL 161550 KIN 1717512
procedure TfrmCadDepenBenef.timepickerDATAChange(Sender: TObject);
begin
  if (tmpckrDATAtermino.date > 0 ) and (tmpckrDATAinicio.date > 0) then
  begin
    if not(rgSituacaoAtual.itemindex = 2 ) then
    begin
     if ((IncMonth(StrToDate(tmpckrDATAINICIO.text), 24)) <= StrToDate(tmpckrDATATERMINO.text))
     //William Moreira da Silva - SOL 246736 PPM 1051823
     //and (lkpcmbTipoRecebedor.LookupValue <> '0004') and (DependenteMaiorIdade) and (rgSituacaoAtual.itemindex = 0) then
     and (lkpcmbTipoRecebedor.LookupValue <> '0004') and (rgSituacaoAtual.itemindex = 0) then
     //William Moreira da Silva - SOL 246736 PPM 1051823
    begin
     MsgDlg('A data limite não pode exceder 2 anos da data de início.','Alerta',mtWarning ,[mbOk],0);
     abort;
    end;

     if (StrToDate(tmpckrDATATERMINO.text) < date()) then
     begin
       bMudaStatusPorData := true;
       rgSituacaoAtual.itemindex := 1;
     end
     else if (StrToDate(tmpckrDATATERMINO.text) >= date()) then
     begin
       rgSituacaoAtual.itemindex := 0;
     end;
    end;
  end;
end;

procedure TfrmCadDepenBenef.rgSituacaoAtualClick(Sender: TObject);
begin
  inherited;
  if (qryReprLegal.state = dsEdit) and (rgSituacaoAtual.itemindex = 0) then
  begin
   Qryaux.close;
   Qryaux.sql.clear;
   Qryaux.SQL.Add(' SELECT SITATUAL FROM HSTREPRLEGAL WHERE IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString );
   Qryaux.SQL.Add(' AND SEQPROPOSTA <> ' + qryReprLegal.FieldByName('SEQPROPOSTA').AsString );
   Qryaux.SQL.Add(' AND SITATUAL = 1 ');
   Qryaux.Open;

   if not(Qryaux.isEmpty) then
   begin
     MsgDlg('Já existe um Representante Legal em vigência','Erro',mtError,[mbOk],0);
     Abort;
   end;
  end;
  if (tmpckrDATAtermino.date > 0) and (tmpckrDATAinicio.date > 0) and (pnlReprLegal.visible)  then
  begin
    if not(rgSituacaoAtual.itemindex = 2) then
    begin
     if ((StrToDate(tmpckrDATATERMINO.text) < date())) and
        (rgSituacaoAtual.itemindex = 0) then
     begin
      if not bMudaStatusPorData then
         MsgDlg('Situação atual da Tutela/Curatela é Vencida, pois a data limite é inferior a atual.','Alerta',mtWarning,[mbOk],0);
      rgSituacaoAtual.itemindex := 1;

      bMudaStatusPorData := false;
      abort;
     end
     else if (StrToDate(tmpckrDATATERMINO.text) >= date()) and (rgSituacaoAtual.itemindex <> 0) then
     begin
       rgSituacaoAtual.itemindex := 0;
       abort;
     end;
    end;
  end;
end;

procedure TfrmCadDepenBenef.qryReprLegalBeforePost;
var
 bExisteVigente : Boolean;
begin
  qryReprLegal.FieldByName('SITATUAL').AsInteger  := rgSituacaoAtual.itemIndex + 1;

  if MontaSelect.RetornouValor then begin
    qryReprLegal.FieldByName('IDTITULAR').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
    sIdPessoa :=    MontaSelect.ValoresChave[0];
    sIdPessJur :=   MontaSelect.ValoresChave[1];
    sIdPlanoPrev := MontaSelect.ValoresChave[3];
  end else begin
    qryReprLegal.FieldByName('IDTITULAR').AsInteger   := StrToInt(sIdTitular);
  end;
  qryReprLegal.FieldByName('IDPESSOA').AsInteger      := QryDet.FieldByName('IDPESSOA').AsInteger;

  qryReprLegal.FieldByName('IDPLANOPREV').AsInteger   := StrToInt(sIdPlanoPrev);
  qryReprLegal.FieldByName('IDPLANOORIGEM').AsInteger := StrToInt(sIdPlanoPrev);
  qryReprLegal.FieldByName('IDPESSJUR').AsInteger     := StrToInt(sIdPessJur);

  //edilaine SIG126319 : inicio
  //if qryReprLegal.State = dsInsert then   //edilaine SIG128969
  begin
  //  Marcio Sanches Spinosa SOL 243486 PPM 588132 - Inicio
  //  Recebedor é o Dependente
    with TwwQuery.Create(Nil) do
    begin
      DatabaseName := 'BaseDados';
      Close;
      sql.Clear;
      sql.Add('select bf.idresponsavel, p.nome from BFCIARIOTITPLAN bF' +
              ' inner JOIN BENEFBFCIARIO B ' +
              ' ON B.IDPLANOPREV = BF.IDPLANOPREV '+
              ' AND B.IDBENEFICIO = BF.IDBENEFICIO '+
              ' AND B.IDPESSJUR = BF.IDPESSJUR '+
              ' AND B.IDPESSOA = BF.IDPESSOA '+
              ' AND B.SEQPROPOSTA = BF.SEQPROPOSTA ' +
              ' inner join pessoa p on p.idpessoa = bf.idresponsavel ' +
              ' where b.idsitbeneficio = 1 ' +
              //Início - William Santana - SOL 246131 - PPM 636421
              //' and bf.idpessoa = ' + qrybenef.fieldbyname('idpessoa').AsString +
  //            ' and bf.idtitular = '+ qrybenef.fieldbyname('idtitular' ).AsString +
  //            ' and bf.idpessjur = ' +qrybenef.fieldbyname('idpessjur').AsString);
              ' and bf.idpessoa = ' + Quotedstr(qryDet.fieldbyname('idpessoa').AsString) +
              ' and bf.idtitular = '+ Quotedstr(qryDet.fieldbyname('idtitular' ).AsString) +
              ' and bf.idpessjur = '+ Quotedstr(qry.fieldbyname('idpessjur').AsString) );
              //Término - William Santana - SOL 246131 - PPM 636421
      Open;
      qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger  := FieldByName('IDRESPONSAVEL').AsInteger;
      qryReprLegal.FieldByName('NOMERECEBEDOR').AsString := FieldByName('NOME').AsString;
    end;
  end;
  //edilaine SIG126319 : fim


//  if ((qryBenef.FieldByname('IDRESPONSAVEL').AsString = qryDet.FieldByName('IDPESSOA').AsString)) or
//     (bVeiodoBenefProprio) then
//   begin
////    qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
////    qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger  := qrybenef.FieldByName('IDRESPONSAVEL').AsInteger;
//    qryReprLegal.FieldByName('NOMERECEBEDOR').AsString := qryDet.FieldByName('NOME').AsString
//   end
//  else  //Recebedor é o Responsável
//   begin
////    qryReprLegal.FieldByName('IDRECEBEDOR').AsInteger  := qryReprLegal.FieldByName('IDRESPONSAVEL').AsInteger;
////    qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger  := qrybenef.FieldByName('IDRESPONSAVEL').AsInteger;
//    qryReprLegal.FieldByName('NOMERECEBEDOR').AsString := dberesponsavel.text;
//   end;
//       qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger  := qrybenef.FieldByName('IDRESPONSAVEL').AsInteger;
// Marcio Sanches Spinosa SOL 243486 PPM 588132 - Fim

  //William Moreira da Silva - SOL 246736 PPM 1051823
  //if not(qryReprLegal.state in [dsEdit])then
  //begin
  // qryaux2.close;
  // Qryaux2.sql.clear;
  // Qryaux2.SQL.Add('SELECT (Max(SEQPROPOSTA) + 1) As SEQPROPOSTA FROM HSTREPRLEGAL WHERE IDPESSOA = '+QryDet.FieldByName('IDPESSOA').AsString );
  // Qryaux2.Open;

  // qryReprLegal.FieldByName('SEQPROPOSTA').AsInteger   := Qryaux2.FieldByName('SEQPROPOSTA').AsInteger;
  //end;

  if not(qryReprLegal.state in [dsEdit])then
  begin

     with twwquery.create(self) do
     begin
        databasename := 'basedados';
        close;
        sql.clear;
        SQL.Add('SELECT (Max(SEQPROPOSTA) + 1) As SEQPROPOSTA FROM HSTREPRLEGAL WHERE IDPESSOA = '+QryDet.FieldByName('IDPESSOA').AsString );
        Open;
        qryReprLegal.FieldByName('SEQPROPOSTA').AsInteger   := FieldByName('SEQPROPOSTA').AsInteger;
        close;
     end;
  end;
  //William Moreira da Silva - SOL 246736 PPM 1051823

  qryReprLegal.FieldByName('SITUACAO').AsString           := rgSituacaoAtual.Items[rgSituacaoAtual.itemIndex];

  qryReprLegal.FieldByName('NOMERESPONSAVEL').AsString    := dberesponsavel.text;
  qryReprLegal.FieldByName('NUMDOCUMENTO').AsString       := DBeCPFRes.text;
  qryReprLegal.FieldByName('CODTIPORESPONSAVEL').AsString := lkpcmbTipoRecebedor.LookupValue;
  qryReprLegal.FieldByName('TIPORESPONSAVEL').AsString    := lkpcmbTipoRecebedor.text;
  qryReprLegal.FieldByName('OBSERVACAO').AsString         := dbmmoOBSERVACAO.text;
  qryReprLegal.FieldByName('OBSERVACAO100').AsString      := Copy(dbmmoOBSERVACAO.text,0,100);

  if tmpckrDATAtermino.date > 0 then
   qryReprLegal.FieldByName('DATATERMINO').AsDateTime := tmpckrDATATERMINO.date;

  if tmpckrDATAinicio.date > 0 then
   qryReprLegal.FieldByName('DATAINICIO').AsDateTime  := tmpckrDATAINICIO.date;

   qryReprLegal.FieldByName('NOMEUSUARIO').AsString      :=  sistema.nomeusuario;
   qryReprLegal.FieldByName('TRGUSERINCLUSAO').AsString  :=  'CM'+IntToStr(sistema.IdUsuario);
   qryReprLegal.FieldByName('TRGDTINCLUSAO').AsDateTime  :=  now;

   if not (( bVeiodoBenefResp ) or ( bVeiodoBenefProprio )) then
   begin
     //Inicío - William Santana - SIG 19040
      //Peterson Victor Nº SOL 268568 PPM 1284501 Inicio

     bExisteVigente := True;
     if (qryReprLegal.state = dsEdit) and (rgSituacaoAtual.itemindex <> 0) then
     begin
         Qryaux.close;
         Qryaux.sql.clear;
         Qryaux.SQL.Add(' SELECT SITATUAL FROM HSTREPRLEGAL WHERE IDPESSOA = '+qryDet.FieldByName('IDPESSOA').AsString );
         Qryaux.SQL.Add(' AND SEQPROPOSTA <> ' + qryReprLegal.FieldByName('SEQPROPOSTA').AsString );
         Qryaux.SQL.Add(' AND SITATUAL = 1 ');
         Qryaux.Open;

        bExisteVigente :=  not(Qryaux.isempty);
     end;
     if bExisteVigente  then
     begin
       // atualizando os Proprios menores
        if not DependenteMaiorIdade then
        begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
          qryAux.SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(lkpcmbTipoRecebedor.LookupValue));
          qryAux.SQL.Add(', IDRESPONNAOREC =  '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
          //qryAux.SQL.Add(', IDRESPONSAVEL =  '+Quotedstr(qryReprLegal.FieldByname('IDRECEBEDOR').AsString));   //sig 126319 Ferrari   SIG128969
          qryAux.SQL.Add(', DATAFIMRECEB =    '+Quotedstr(tmpckrDATATERMINO.text));
          qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr(qry.FieldByName('IDPESSJUR').AsString)    );
          qryAux.SQL.Add(' AND IDPESSOA =     '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
          qryAux.SQL.Add(' AND IDTITULAR =    '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );
          qryAux.SQL.Add(' AND IDPESSOA = IDRESPONSAVEL' );  // -- é o proprio

          // Atualiza menos os que já foram encerrados
          // RETIRADO SIG 126319  { voltou no SIG128969 }
          qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
          qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
          qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
          qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
          qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
          qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
          qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
          qryAux.SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
          qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');
          qryAux.ExecSQL;
        end
        else // atualizando outros
        begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
          qryAux.SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(lkpcmbTipoRecebedor.LookupValue));
          qryAux.SQL.Add(', IDRESPONSAVEL  = '+Quotedstr(qryReprLegal.FieldByName('IDRESPONSAVEL').AsString));     //sig 126319 Ferrari   SIG128969
          //qryAux.SQL.Add(', IDRESPONSAVEL =  '+Quotedstr(qryReprLegal.FieldByname('IDRECEBEDOR').AsString));     //sig 126319 Ferrari   SIG128969
          qryAux.SQL.Add(', IDRESPONNAOREC =  '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
          qryAux.SQL.Add(', DATAFIMRECEB =    '+Quotedstr(tmpckrDATATERMINO.text));
          qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr(qry.FieldByName('IDPESSJUR').AsString)    );
          qryAux.SQL.Add(' AND IDPESSOA =     '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
          qryAux.SQL.Add(' AND IDTITULAR =    '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );
          qryAux.SQL.Add(' AND IDPESSOA <> IDRESPONSAVEL' );  // -- so quem tem representante     sig 126319 Ferrari    SIG128969

          // Atualiza menos os que já foram encerrados
          //Retirar condição sig 126319   { voltou no SIG128969 }
          qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
          qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
          qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
          qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
          qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
          qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
          qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
          qryAux.SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
          qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');
          qryAux.ExecSQL;
        end;
     end;


      //qryAux.Close;
//      qryAux.SQL.Clear;
//      qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
//      qryAux.SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(lkpcmbTipoRecebedor.LookupValue));
//      qryAux.SQL.Add(', IDRESPONNAOREC =  '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
//      qryAux.SQL.Add(', DATAFIMRECEB =    '+Quotedstr(tmpckrDATATERMINO.text));
//      qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr(qry.FieldByName('IDPESSJUR').AsString)    );
//      qryAux.SQL.Add(' AND IDPESSOA =     '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
//      qryAux.SQL.Add(' AND IDTITULAR =    '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );
//      // Atualiza menos os que já foram encerrados
//      qryAux.SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
//      qryAux.SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
//      qryAux.SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
//      qryAux.SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
//      qryAux.SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
//      qryAux.SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
//      qryAux.SQL.Add('                    AND B.IDTITULAR = '+Quotedstr( qryDet.FieldByName('IDTITULAR').AsString) );
//      qryAux.SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
//      qryAux.SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');
//      qryAux.ExecSQL;

      //Peterson Victor Nº SOL 268568 PPM 1284501 Inicio
      //Termino - William Santana - SIG 19040
   end;
end;

procedure TfrmCadDepenBenef.lkpcmbTipoRecebedorChange(Sender: TObject);
begin
  inherited;

  //William Moreira da Silva - SOL 246736 PPM 1051823
  tmpckrDATAINICIO.Text  := '';
  tmpckrDATAtermino.Text := '';

  timepickerDATAChange(sender);
  //William Moreira da Silva - SOL 246736 PPM 1051823

   if (lkpcmbTipoRecebedor.LookupValue = '0004') and (qryReprLegal.state in [dsInsert,dsEdit]) and
      (not DependenteMaiorIdade) then
   begin
     qryReprLegal.FieldByName('DATAINICIO').AsDateTime  := qryDet.FieldByName('DATACADASTRO').AsDateTime;
     qryReprLegal.FieldByName('DATATERMINO').AsDatetime := (IncMonth(qryDet.FieldByName('DATANASC').AsDatetime , 216 ) -1 );
     timepickerDATAChange(sender);
   end;
end;

procedure TfrmCadDepenBenef.dbgrdBeneficiarioColEnter(Sender: TObject);
begin
  inherited;
  Linha := dbgrdBeneficiario.DataSource.DataSet.GetBookmark;   //William Santana SOl 161550 KIN 1717512
end;

procedure TfrmCadDepenBenef.qryBenefAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Linha := dbgrdBeneficiario.DataSource.DataSet.GetBookmark;   //William Santana SOl 161550 KIN 1717512
end;

function TfrmCadDepenBenef.VerificaReprLegal: Boolean;
begin
 if not(qryReprLegal.isempty) then
  begin
   qryReprLegal.Filter   := 'SITATUAL = 1' ;
   qryReprLegal.Filtered := True;

   if not qryReprLegal.isEmpty then
    result := true
   else
    result := False;
  end
 else
   result := False;

  qryReprLegal.Filtered := False;
  qryReprLegal.Filter   := '';
end;

procedure TfrmCadDepenBenef.IntegraBenef_ReprLegal(acao: integer);
begin
 // acao =
 // 1 - dependente selecionado é menor de idade, mudar para aba Representante Legal
 // 2 - cadastro de um representante legal, mudar para aba Representante Legal
 // 3 - voltar para aba Benefício

  if (acao <> 3) then
  begin
   tbcDetalhe.TabIndex := 9;
   pgctrlDetalhe.ActivePage := tbsReprLegal;
   sbtnInsDet.Click;
   qryReprLegal.Insert;

   if (acao = 1)  then
   begin
     //William Moreira da Silva - SOL 246736 PPM 1051823
     //qryReprLegal.FieldByName('CODTIPORESPONSAVEL').AsString := '0004';
     //lkpcmbTipoRecebedorChange(self);
     //William Moreira da Silva - SOL 246736 PPM 1051823
     timepickerDATAChange(self);
     bVeioDoBenefProprio := True;
     bVeioDoBenefResp    := False;
     abort;
   end;

   if (acao = 2) then
   begin
     bVeioDoBenefProprio := False;
     bVeioDoBenefResp    := True;
     abort;
   end;

  end
  else
  begin
   bbtnCancelarDet.Click;
   tbcDetalhe.TabIndex   := 6;
   pgctrlDetalhe.ActivePage := tbsBeneficiario;

   if (bIns) then
    begin
     sbtnInsDet.click;
     sBenef := lkpcmbBeneficio.text;

    end
   else
   if (bAlt) then
   begin
    dbgrdBeneficiario.DataSource.DataSet.gotoBookMark(linha);
    sbtnAltDet.click;
    CmeDetalheEdit(sbtnAltDet);
    if bVeioDoBenefResp then
       rdbOutro.checked := true;
    qrybenef.fieldByName('IDBENEFICIO').AsInteger := iBenef;
   end;

   dbePrioridade.text    := sPrio;
   dbePercentual.text    := sPerc;
   qryBenef.FieldByName('IDRESPONSAVEL').AsInteger   := qryReprLegal.FieldByname('IDRESPONSAVEL').AsInteger ;
   qryBenef.FieldByName('IDRESPONNAOREC').AsInteger  := qryReprLegal.FieldByname('IDRESPONSAVEL').AsInteger ;
   qryBenef.FieldByName('CODTIPORECEBEDOR').AsString := qryReprLegal.FieldByname('CODTIPORESPONSAVEL').AsString;
   qryBenef.FieldByName('DATAFIMRECEB').AsString     := qryReprLegal.FieldByname('DATATERMINO').AsString;

   rdbProprioclick(self);
   bIns := False;
   bAlt := False;

   bVeioDoBenefResp      := False;
   bVeioDoBenefProprio   := False;

   abort;
  end;
end;

procedure TfrmCadDepenBenef.PreencheCamposRepresentante;
begin
   lkpcmbTipoRecebedor.Selected.IndexOf(qryreprlegal.fieldByName('TIPORESPONSAVEL').AsString);
   dbeResponsavel.text          := qryReprlegal.FieldByName('NOMERESPONSAVEL').AsString;
   DBeCPFRes.text               := qryReprlegal.FieldByName('NUMDOCUMENTO').AsString;
   tmpckrDATAINICIO.date        := qryReprlegal.FieldByName('DATAINICIO').AsDateTime;
   tmpckrDATAtermino.date       := qryReprlegal.FieldByName('DATATERMINO').AsDateTime;
   rgSituacaoatual.itemindex    := qryReprlegal.FieldByName('SITATUAL').AsInteger - 1;
   dbmmoOBSERVACAO.text         := qryReprlegal.FieldByName('OBSERVACAO').AsString;
end;

function TfrmCadDepenBenef.VerificaReprBeneficiosAtivos: boolean;
var
  sFiltro : string;
begin
  sFiltro := qryBenef.Filter;
  qryBenef.Filter   := sFiltro + ' and ((SITBENEFICIO = ''NÃO REQUERIDO'') or (SITBENEFICIO = ''Normal'')) and (IDRESPONSAVEL <> '+qryDet.FieldByName('IDPESSOA').AsString+')';
  qryBenef.Filtered := true;

  result := not qryBenef.isEmpty;  // retorna falso se não encontrar algum Maior com Representante

  qryBenef.Filter   := sFiltro;
  qryBenef.Filtered := true;
end;

procedure TfrmCadDepenBenef.CarregaDadosRepresentanteLegal;
begin
  qryReprLegal.Filter   := '' ;
  qryReprLegal.Filtered := false;
  if not qryReprLegal.Prepared then qryReprLegal.prepare;
  qryReprLegal.ParamByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
  qryReprLegal.ParamByName('IDPESSOA').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryReprLegal.ParamByName('IDTITULAR').AsInteger := qryDet.FieldByName('IDTITULAR').AsInteger;
  qryReprLegal.Open;

  if not qryLogReprLegal.Prepared then qryLogReprLegal.prepare;
  qryLogReprLegal.ParamByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
  qryLogReprLegal.ParamByName('IDPESSOA').AsInteger  := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryLogReprLegal.ParamByName('IDTITULAR').AsInteger := qryDet.FieldByName('IDTITULAR').AsInteger;
  qryLogReprLegal.Open;
end;

//BRUNO AZEVEDO SOL 244852 PPM 626115 - CASO NÃO TENHA ACESSO A ABA, DESABILITAR TAMBÉM OS BOTÕES
procedure TfrmCadDepenBenef.VerificaPermissao();
begin
  if (pgctrlDetalhe.ActivePage.Enabled = False) then begin
    tb97BotoesDetalhe.Enabled := False;
    if not(pgctrlDetalhe.ActivePage = tbsDocumentos) then begin
      pgctrlDetalhe.ActivePage.Enabled := True;
    end;
  end else begin
    tb97BotoesDetalhe.Enabled := True;
    pgctrlDetalhe.ActivePage.Enabled := True;
  end;
end;

// Início - Michelle Mota - SIG: 20771
procedure TfrmCadDepenBenef.dblkpcmbNacionalidadeChange(Sender: TObject);
begin
  inherited;

  if (qryPF.State in [dsEdit, dsInsert]) then
    begin
      if (dblkpcmbNacionalidade.Text <> '') then
        begin
        //           qryCidade.locate('IDPAIS',qryPais.FieldByName('IDPAIS').AsString,[]);
        //
        //           qryEstado.locate('IDPAIS',qryPais.FieldByName('IDPAIS').AsString,[]);
        //
        //           SIG42936 - MARCELO CARDOSO - INICIO
        //           qryCidade.Filtered := False;
        //           qryCidade.Filter := ' IDPAIS = ' + qryPais.FieldByName('IDPAIS').AsString;
        //           qryCidade.Filtered := True;
        //
        //           qryEstado.Filtered := False;
        //           qryEstado.Filter := ' IDPAIS = ' + qryPais.FieldByName('IDPAIS').AsString;
        //           qryEstado.Filtered := False;
        //
        //           SIG42936 - MARCELO CARDOSO - FIM

        // Peterson Victor SIG29884
        //if pgctrlDetalhe.ActivePage = tbsEndereco then  SIG30403
        //begin
           qryEstado.locate('CODESTADO',qryPF.FieldByName('CODESTADO').AsString,[]);
           qryCidade.locate('IDPAIS',qryPais.FieldByName('IDPAIS').AsString,[]);
           //qryEstado.locate('IDPAIS',qryPais.FieldByName('IDPAIS').AsString,[]);
           qryCidade.locate('IDCIDADES',IntToStr(qryEndPess.FieldByName('IDCIDADES').AsInteger),[]);
        end;
       //           SIG42936 - MARCELO CARDOSO - INICIO
        if (dblkpcmbNaturalidade.text = EmptyStr) then
           begin
             qryCidade.Filtered := False;
             qryCidade.Filter := ' IDPAIS = ' + qryPais.FieldByName('IDPAIS').AsString;
             qryCidade.Filtered := True;

             qryEstado.Filtered := False;
             qryEstado.Filter := ' IDPAIS = ' + qryPais.FieldByName('IDPAIS').AsString;
             qryEstado.Filtered := True;
           end;
       //           SIG42936 - MARCELO CARDOSO - FIM
     end;

end;
// Término - Michelle Mota - SIG: 20771

procedure TfrmCadDepenBenef.sbtnApagarClick(Sender: TObject);
begin
  {Início - Michelle Mota - SIG25312}
  if MsgDlg(MSG027,'Atenção', mtWarning, [mbYes, mbNo],0) = mrYes then
    inherited;
  {Término - Michelle Mota - SIG25312}
end;

//Darivaldo Alencar SIG 33695 -inicio
function TfrmCadDepenBenef.ValidaEntrada: boolean;
var
  iIdDocumento: Integer;
begin
   result:= true;
   pnlItemsDoc.visible:= false;
   iIdDocumento:= qryDocumento.fieldbyname('IDDOCUMENTO').asInteger;
   qryDocumento.first;
   while not(qryDocumento.eof) do
   begin

    if (qryDocumento.fieldByname('NUMDOCUMENTO').asString = EmptyStr) then
     begin
        qryDocumento.next;
        continue;
     end;

   if (qryDocumento.FieldByName('OBRIGAEMISSAO').AsString = 'S') and (CMDateTimePicker2.Text = EmptyStr) and (CMDateTimePicker2.visible) then
     begin
       MsgDlg('Obrigatório preencher a Data da Emissão do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
       result:= false;
       break;
     end;
  if (qryDocumento.FieldByName('OBRIGAUF').AsString = 'S') and (dbcmbEstadoDoc.Text = EmptyStr) and (dbcmbEstadoDoc.visible )then
    begin
      MsgDlg('Obrigatório preencher a Unidade de Federação do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGAORGAO').AsString = 'S') and (wwDBEdit1.Text = EmptyStr)and (wwDBEdit1.visible) then
    begin
      MsgDlg('Obrigatório preencher o Órgão Emissor do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('FLGOBRIGAVALIDADE').AsString = 'S') and (CMDateTimePicker1.Text = EmptyStr) and (CMDateTimePicker1.visible)then
    begin
      MsgDlg('Obrigatório preencher a Data de Validade do documento ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGACATG').AsString = 'S') and (edtCategoria.Text = EmptyStr) and (edtCategoria.visible)then
    begin
      MsgDlg('Obrigatório preencher a Categoria do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGAPRMHAB').AsString = 'S') and (cbxDataHabilitacao.Text = EmptyStr) and (cbxDataHabilitacao.visible)then
    begin
      MsgDlg('Obrigatório preencher a Data da primeira habilitação do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGAPAIS').AsString = 'S') and (dbcmdPais.Text = EmptyStr) and (dbcmdPais.visible) then
    begin
      MsgDlg('Obrigatório preencher o País do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
    qryDocumento.Next;
  end;
  qryDocumento.locate('IDDOCUMENTO',iIdDocumento,[]);
  pnlItemsDoc.visible:= true;
end;

function TfrmCadDepenBenef.SoNumero(fField : String): String;
var
  I : Byte;
begin
  Result := EmptyStr;
  for I := 1 To Length(fField) do
     if ((fField [I] In ['0'..'9']) or (fField [I] = '#')) Then
      Result := Result + fField [I];
end;

function TfrmCadDepenBenef.SelMascara(sIdDocumento: String; sIdTipoDocPessoaxMasc: String): String;
var sSql : string;
begin
  sSqL :='SELECT TX.IDTIPODOCPESSOAXMASC, TX.IDDOCUMENTO, ' +
                         ' TX.NOME, TX.MASCARA ' +
                         ' FROM TIPODOCPESSOAXMASC TX ';
  if (sIdDocumento <> EmptyStr) then
  begin
    sSQL := sSQL + 'where TX.IDDOCUMENTO = ' + QuotedStr(sIdDocumento);
    if (sIdTipoDocPessoaxMasc <> EmptyStr) then
    sSQL := sSQL + 'and TX.IDTIPODOCPESSOAXMASC = ' + QuotedStr(sIdTipoDocPessoaxMasc);
  end;
  sSQL := sSQL + ' ORDER BY TX.IDTIPODOCPESSOAXMASC';

  qryTipoDocumento.close;
  qryTipoDocumento.sql.clear;
  qryTipoDocumento.sql.add(sSql);
  qryTipoDocumento.open;

  result:= Trim(qryTipoDocumento.fieldbyname('Mascara').asString);
end;

function  TfrmCadDepenBenef.CarregaTipoDocumento (sIdDocumento: String;sIdTipoDocPessoaxMasc: String): String;
begin
  SelMascara(sIdDocumento,sIdTipoDocPessoaxMasc);
end;

procedure TfrmCadDepenBenef.PintarCampos(lEdit: array of TComponent;  Color: TColor);
var x: integer;
begin
  for x:= 0 to High(lEdit) do
  begin
    if TObject(lEdit[x]).ClassType = TwwDBEdit then
      TwwDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBEdit then
      TDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TGroupBox then
      TGroupBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCheckListBox then
      TCheckListBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBGrid then
      TwwDBGrid(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBMemo then
      TDBMemo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBLookupCombo then
      TwwDBLookupCombo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TRadioGroup then
      TRadioGroup(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBCheckBox then
      TDBCheckBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCMDateTimePicker then
      TCMDateTimePicker(lEdit[x]).Color:= Color;
  end;
end;

procedure TfrmCadDepenBenef.dbcmbTipoDocumentoChange(Sender: TObject);
var
  sText, sNumDocumentoAntigo, sMask: String;
  iQtdMask: Integer;
begin
  inherited;
  dbcmbTipoDocumento.OnChange := Nil;
  sText := dbcmbTipoDocumento.Text;
  with qryDocumento do
      if not (State in [dsInactive,dsBrowse]) then
      begin
        FieldByname('NUMDOCUMENTO').EditMask := StringReplace(Pessoa.MaskField(SelMascara(FieldByname('IDDOCUMENTO').asString,qryTipoDocumento.FieldByName('IDTIPODOCPESSOAXMASC').asString)), '#', 'a', [rfReplaceAll]);
      end;

      if (sText <> EmptyStr) then
      begin
          if (qryDocumento.fieldbyname('idtipodocpessoaxmasc').asstring <> EmptyStr)
            and (qryDocumento.state <> dsBrowse)  then
          begin
              if (qryDocumento.FieldByName('idtipodocpessoaxmasc').asString <> qryDocumento.fieldbyname('idtipodocpessoaxmasc').asstring) then
              begin
                sNumDocumentoAntigo := qryDocumento.FieldByName('NUMDOCUMENTO').asString;
                qryDocumento.FieldByname('NUMDOCUMENTO').clear;
                sMask := qryDocumento.FieldByName('NUMDOCUMENTO').EditMask;
                iQtdMask := Length(SoNumero(sMask)) - 1;
                qryDocumento.FieldByName('NUMDOCUMENTO').asString := Copy(sNumDocumentoAntigo,1,iQtdMask);
                edDocNumDocumentoExit(self);
              end;
          qryDocumento.Edit;
          qryDocumento.FieldByName('idtipodocpessoaxmasc').asString := qryDocumento.fieldbyname('idtipodocpessoaxmasc').asstring;
          qryDocumento.Post;
          end;
      end;
  CarregaTipoDocumento(qryDocumento.FieldByName('IDDOCUMENTO').asString, EmptyStr);  //Carrega novamente os itens do Cds
  dbcmbTipoDocumento.Text := sText;
  dbcmbTipoDocumento.OnChange := dbcmbTipoDocumentoChange;
end;

// Darivaldo Alencar - SIG 33695 -fim


procedure TfrmCadDepenBenef.chklstTipoTelDepenClick(Sender: TObject);
var
  sTipo : string; //Michelle Mota - SIG 25312
begin
  inherited;
  {Início - Michelle Mota - SIG 25312}
  if (qryPF.State in [dsInsert,dsEdit]) then
  begin
       sTipo := '';
       if chklstTipoTelDepen.Checked[0] then
          sTipo := sTipo + 'C';
       if chklstTipoTelDepen.Checked[1] then
          sTipo := sTipo + 'P';
       if chklstTipoTelDepen.Checked[2] then
          sTipo := sTipo + 'F';
       if chklstTipoTelDepen.Checked[3] then
          sTipo := sTipo + 'L';
       if chklstTipoTelDepen.Checked[4] then
          sTipo := sTipo + 'R';

       if sTipo = '' then
       begin
            chklstTipoTelDepen.State[0] := cbChecked;
            sTipo := 'C';
       end;
       qryPF.FieldByName('TIPO').AsString := sTipo;
  end;
  {Término - Michelle Mota - SIG 25312}
end;

//William Moreira da Silva - SIG 25312 - Inicio  | William Santana  SIG 25312 - correções
procedure TfrmCadDepenBenef.wwDBTpDepenChange(Sender: TObject);
var filtro : string;
begin
  inherited;
  AtlzSitDepen; //Darivaldo Alencar SIG25312
  filtro := wwDBTpDepen.Value;

  if(filtro <> '0') then
  begin
    if(filtro = '1') then
    begin
        //qryDet.Filter   := 'FLGCONTAIMPOSTOR = '+ filtro;
        //Darivaldo Alencar SIG25312 -inicio
        qryDet.Filtered := false;
        qryDet.Filter   := 'FLGCONTAIMPOSTOR = '+ filtro +' AND INICIOIMPOSTOR <> NULL ' +
                           'AND ((FIMIMPOSTOR IS NULL) OR (FIMIMPOSTOR > '+ QuotedStr(FormatDatetime('DD/MM/YYYY',now))+')) '+
                           'AND IDSITDEPENDENTE = 1  ';
        //Darivaldo Alencar SIG25312 -fim
        qryDet.Filtered := True;
    end
    else
    begin
       if(filtro = '1') then
        begin
            qryDet.Filtered := false;
            qryDet.Filter   := 'FLGCONTAIMPOSTOR = '+ filtro;
            qryDet.Filtered := True;
        end
       else begin
           qryDet.Filtered := false;
           qryDet.Filter   := 'DEP_PLANO'+filtro +'= 1';
           qryDet.Filtered := True;
       end;
    end;
  end
  else
  begin
     qryDet.Filtered := false;
  end;

  AjustaGridDependentes(filtro);      //edilaine - SIG25312
end;

procedure TfrmCadDepenBenef.qryPFCalcFields(DataSet: TDataSet);
begin
  inherited;
  {Início - Michelle Mota - SIG 25312}
  with DataSet do
  begin
      if Pos('C', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TComercial').AsString := 'Sim'
      else
         FieldByName('TComercial').AsString := '';

      if Pos('P', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TParticular').AsString := 'Sim'
      else
         FieldByName('TParticular').AsString := '';

      if Pos('F', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TFax').AsString := 'Sim'
      else
         FieldByName('TFax').AsString := '';

      if Pos('L', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TCelular').AsString := 'Sim'
      else
         FieldByName('TCelular').AsString := '';

      if Pos('R', FieldByName('TIPO').AsString) > 0 then
         FieldByName('TRecado').AsString := 'Sim'
      else
         FieldByName('TRecado').AsString := '';
  end;
  {Término - Michelle Mota - SIG 25312}

end;

//Início - William Santana - SIG 25312
procedure TfrmCadDepenBenef.dbeNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not (Key in ['A'..'Z', 'a'..'z',#32,#8]) then
      Key := #0;
end;

function TfrmCadDepenBenef.verificaAlteracaoDepCancelado(iRegra: Integer):Boolean;
var
  iIdade: Integer;
begin
   result := False;
   iIdade:= CalcIdade(dbdeDataNasc.date);

   case iRegra of
     1: begin
           if(iIdade < 25) and
             (dblkpcmbGrauInstr.LookupValue = '8') and    //Superior Incompleto
             //(dblkpcmbSitDependente.text ='NORMAL')and
             (qryDet.fieldbyname('SITUACAODEPEN').asstring = 'NORMAL') and
             (qryDet.FieldByName('DATACANCELA').asDateTime <> 0) then
           result:= True;
        end;
     2: begin
           if(iIdade >= 22) and (iIdade <= 25) and
             (dblkpcmbSitDependente.text ='NORMAL')and
             not(DbChbIgnoraIR.Checked )and
             (dbdtInicioIR.text <> '' )and
             ((dbdtFimIR.text = '' )or(dbdtFimIR.text > FormatDateTime('DD/MM/YYYY',NOW))) and
             (dblkpcmbGrauInstr.LookupValue <> '8') then
           result:= True;
        end;
     3: begin
          if(iIdade >= 8) and
            (dblkpcmbSitDependente.text ='NORMAL')and
            (dbdtInicioIR.text <> '') and
            ((dbdtFimIR.text = '') or (dbdtFimIR.text > FormatDateTime('DD/MM/YYYY', Now))) and
            not(DbChbIgnoraIR.Checked)
            then
          result:= True;
        end;
     4: begin
           if(iIdade >= 22) and (iIdade <= 25) and
             (dblkpcmbSitDependente.text ='NORMAL')and
             not(DbChbIgnoraIR.Checked )and
             (dbdtInicioIR.text <> '' )and
             (dbdtFimIR.text = '') then
           result:= True;
        end;
   end;
end;

procedure TfrmCadDepenBenef.HabilitaAlteracaoDepCancelado(b: Boolean; iTipo: Integer = 1);
begin
    {aba Dados Pessoais}
    if (iTipo = 1) then
      begin
        dbdtInicioSalFamilia.ReadOnly    := b;
        dbdtFimSalFamilia.ReadOnly       := b;
        dbdtInicioInvalidez.ReadOnly     := b;
        dbdtFimInvalidez.ReadOnly        := b;
        DbChbSomaIR.ReadOnly             := b;
        dbchkbxDesignado.ReadOnly        := b;
        dbchkbxContaSalarioF.ReadOnly    := b;
        dbchkbxFlgContaImpostoR.ReadOnly := b;
        dbchkbxFlgDepLegal.ReadOnly      := b;
        grpDependentes.Enabled           :=  not(b);
        grbNatural.Enabled               :=  not(b);
        pnlOutrosItens.Enabled           :=  not(b);
        dbrgrpMolestiaGrave.Enabled      :=  not(b);
        grpContaSalario.Enabled          :=  not(b);
        grpContaProcessada.Enabled       :=  not(b);
        dbrgrpIsentoIR.Enabled           :=  not(b);

        {Aba Informações Principais}
        dbeNome.ReadOnly                 :=  b;
        dbeMatricula.ReadOnly            :=  b;
        dbeTipoSang.ReadOnly             :=  b;
        dbeCPF.ReadOnly                  :=  b;
        dbeEMail.ReadOnly                :=  b;
        dbeEmailParticular.ReadOnly      :=  b;
        grpDataNasc.Enabled              :=  not(b);
        grpFiliacao.Enabled              :=  not(b);
        dbrdgrpSexo.Enabled              :=  not(b);
        grpBPlanPrev.Enabled             :=  not(b);
        dblkpcmbTipoDependencia.Enabled  :=  not(b);
        cmbEstCiv.Enabled                :=  not(b);
        dbeNomeConjuge.Enabled           :=  not(b);
      end;

    {Aba Benefícios}
    grpbxResp.Enabled              :=  not(b);
    grpbxBeneficio.Enabled         :=  not(b);
    grpbxPrioridade.Enabled        :=  not(b);
    GroupBox2.Enabled              :=  not(b);
end;
//Término - William Santana - SIG 25312

//William Moreira da Silva - SIG 25312 - Inicio
procedure TfrmCadDepenBenef.rbSimDepenClick(Sender: TObject);
begin
  inherited;
  if(rbSimDepen.Checked) then
     qryPF.FieldbyName('POSSUIDEP').asString := 'S'
  else
     qryPF.FieldbyName('POSSUIDEP').asString := 'N' ;
end;

procedure TfrmCadDepenBenef.rbNaoDepenClick(Sender: TObject);
begin
  inherited;
  if(rbSimDepen.Checked) then
     qryPF.FieldbyName('POSSUIDEP').asString := 'S'
  else
     qryPF.FieldbyName('POSSUIDEP').asString := 'N' ;
end;
//William Moreira da Silva - SIG 25312 - Fim

//Darivaldo Alencar - SIG 25312 - Inicio
function TfrmCadDepenBenef.VerifCancPlanoTitular(QryAux : TwwQuery; iIdplanoprev, iIdpessoa: Integer): TDateTime;
Var sSql :string;
begin
   try
      sSql := ' SELECT DATACANCEL    '+
              ' FROM PLANODEPENDENTE '+
              ' WHERE IDPESSOA     = '+ IntToStr(iIdpessoa) +
              ' AND IDPLANOPREV    = '+ IntToStr(iIdplanoprev );
      FazQuery(QryAux,sSql);
      Result := QryAux.FieldByName('DATACANCEL').asDateTime;
   except on e: exception do
      Result:= 0;
   end;
end;

function TfrmCadDepenBenef.PossuiRegistroAssociado(QryAux: TwwQuery;
  iIdplanoprev, iIdpessoa,iIdPessJur: Integer): Boolean;
Var sSql :string;
begin
   try
      sSql := ' SELECT COUNT(1) AS QTDE FROM PLANODEPENDENTE '+
              ' WHERE IDPESSOA  = '+ IntToStr(iIdpessoa) +
              ' AND IDPESSJUR   = '+ IntToStr(iIdPessJur) +
              ' AND IDPLANOPREV = ' + IntToStr(iIdplanoprev );
      FazQuery(QryAux,sSql);
      Result := QryAux.FieldByName('QTDE').asInteger > 0;
   except on e: exception do
      Result:= False;
   end;
end;

procedure TfrmCadDepenBenef.ChkregreplanMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (PlanoCancelado(2)) then
   begin
     Chkregreplan.Checked := True;
     abort;
   end
  else DesmarcaPlano(2);
end;

procedure TfrmCadDepenBenef.ChkrebMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (PlanoCancelado(66)) then
   begin
     Chkreb.Checked := True;
     abort;
   end
  else DesmarcaPlano(66);
end;

procedure TfrmCadDepenBenef.ChknovoplanoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (PlanoCancelado(74)) then
   begin
     Chknovoplano.Checked := True;
     abort;
   end
  else DesmarcaPlano(74);
end;

procedure TfrmCadDepenBenef.GravaDataCancelamento(sIdPlanoPrev: String);
var
  bCommita: Boolean;
begin
     sIdPessoaDepen := qryDet.fieldByname('IDPESSOA').asstring;
    if not(qryplano.state in[dsEdit,dsInsert]) then
      begin
        qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([sIdPessoaDepen,sIdPlanoPrev ,  sIdPessJur]),  []);
        qryplano.Edit;
        bCommita:= True;
      end
    else bCommita:= False;

    if (qryplano.state in[dsEdit,dsInsert]) then
       begin
          case qryplano.fieldbyname('IDPLANOPREV').asInteger of
             2: qryplano.fieldbyname('DATACANCEL').asDateTime:= dtCancRegReplan.Date;
            66: qryplano.fieldbyname('DATACANCEL').asDateTime:= dtCancREB.Date;
            74: qryplano.fieldbyname('DATACANCEL').asDateTime:= dtCancNovoPlano.Date;
          end;
       end;
    if (bCommita) then
       begin
         if (qryplano.fieldbyname('IDPLANOPREV').asInteger in [2,66,74]) then
           qryplano.post
         else qryplano.cancel;
       end;
end;

procedure TfrmCadDepenBenef.dtCancRegReplanExit(Sender: TObject);
begin
  inherited;
  dbdeDataNascExit(self);
  GravaDataCancelamento('2');
end;

procedure TfrmCadDepenBenef.dtCancREBExit(Sender: TObject);
begin
  inherited;
  dbdeDataNascExit(self);
  GravaDataCancelamento('66');
end;

procedure TfrmCadDepenBenef.dtCancNovoPlanoExit(Sender: TObject);
begin
  inherited;
  dbdeDataNascExit(self);
  GravaDataCancelamento('74');
end;

function TfrmCadDepenBenef.PlanoCancelado(iIdPlano: Integer): Boolean;
var
  bMostraMsg  : Boolean;
  sDataCancel : string;
begin
  if qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, IntToStr(iIdPlano),  sIdPessJur]),  []) then
     sDataCancel := qryplano.fieldbyname('DATACANCEL').AsString
  else
     sDataCancel := '';

  case iIdPlano of
    2: bMostraMsg:= ((dtCancRegReplan.text <> EmptyStr) or (sDataCancel <> ''));
   66: bMostraMsg:= ((DtCancReb.text       <> EmptyStr) or (sDataCancel <> ''));
   74: bMostraMsg:= ((dtCancNovoPlano.text <> EmptyStr) or (sDataCancel <> ''));
  end;
  if (bMostraMsg) then
     MsgDlg(MSG029,'Atenção', mtinformation,[mbOk],0);

  result:= bMostraMsg;
end;

function TfrmCadDepenBenef.ValidaEMail(const EMailIn : String) : Boolean;
const
  CaraEsp: array[1..42] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°','é','ó');
var
  i,cont,t, posPonto   : integer;
  EMail                : ShortString;
begin
  EMail  := PChar(EMailIn);
  Result := True;
  cont   := 0;
  t      := Length(EMail);
  posPonto := 999;

  if (EMail <> EmptyStr) then
    begin
    //O texto digitado deve possuir, no mínimo, dois caracteres antes do final
    if Length(EMail) >= 1 then
        if (Email[t] = '.') or (Email[t-1] = '.') then
           begin
             Result := False;
             exit;
           end;

    // existe @ .
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else
        // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do
              // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                begin
                   Result := False;
                   exit;
                end;

            for i := 1 to length(EMail) do
            begin
              // se existe apenas 1 @
              if EMail[i] = '@' then
                  cont := cont + 1;

              // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                begin
                  Result := false;
                  exit;
                end;

              if EMail[i] = '.' then
                  posPonto := i;
            end;

            // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
             begin
                Result := false;
                exit;
             end;

            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              begin
                Result := False;
                exit;
              end;

            // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              begin
                Result := False;
                exit;
              end;

            // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              begin
                Result := False;
                exit;
              end;
          end;
    end
    else  Result:= False;

    //O ultimo ponto deve vir depois do arroba
    if (Pos('@', EMail) > posPonto) then
        Result := False;
    end;
end;

procedure TfrmCadDepenBenef.dbeEMailExit(Sender: TObject);
begin
  inherited;
  if not(ValidaEMail(TDBEdit(Sender).Text))then
    begin
      MsgDlg(MSG038,'Atenção',mtInformation,[mbOK],0);
      TDBEdit(Sender).setfocus;
    end;
end;

procedure TfrmCadDepenBenef.memObsDepenKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= Upcase(Key);
end;

procedure TfrmCadDepenBenef.AtlzSitDepen;
begin
  bAtualizaSitDepen := true;   //edilaine - SIG25312

   if (qryDepen.FieldByName('IDSITDEPENDENTE').asString = emptystr) then
      exit;
   if (qryDet.recordcount > 0) and (qryDepen.recordcount > 0) then  //Everson Cunha - SIG80745
     if (qryDet.state in [dsInsert, dsEdit]) then
        begin
           qryDet.FieldByName('IDSITDEPENDENTE').asString:= qryDepen.FieldByName('IDSITDEPENDENTE').asString;
        end
     else begin
         qryDet.edit;
         qryDet.FieldByName('IDSITDEPENDENTE').asString:= qryDepen.FieldByName('IDSITDEPENDENTE').asString;
         qryDet.post;
     end;

  bAtualizaSitDepen := false;   //edilaine - SIG25312
end;


function TfrmCadDepenBenef.ValidarCpf(num: string): boolean;
var 
  n:array [1..9] of integer;
  d:array [1..2] of integer;
  digitado, calculado: string;
  i: Integer;
begin
  num:= Trim(num);
  if ((num = '11111111111')or
      (num = '22222222222')or
      (num = '33333333333')or
      (num = '44444444444')or
      (num = '55555555555')or
      (num = '66666666666')or
      (num = '77777777777')or
      (num = '88888888888')or
      (num = '99999999999')or
      (num = '00000000000'))then
  begin
      result:= false;
      exit;
  end;

  if (length(num )<> 11) then
     begin
       result:= false;
       exit;
     end;

  for i:= 1 to 9 do
      n[i]:= StrToInt(num[i]);

  d[1]:= n[9]*2 + n[8]*3 + n[7]*4 + n[6]*5 + n[5]*6 + n[4]*7 + n[3]*8 +n[2]* 9+n[1]*10;
  d[1]:= 11-(d[1] mod 11);

  if (d[1]>=10) then
     d[1]:=0;

  d[2]:= d[1]*2+n[9]*3+n[8]*4+n[7]*5+n[6]*6+n[5]*7+n[4]*8+n[3]*9+n[2]*10+n[1]*11;
  d[2]:= 11-(d[2] mod 11);

  if d[2]>=10 then
     d[2]:=0;

  calculado:= inttostr(d[1])+inttostr(d[2]);
  digitado := num[10]+num[11];

  result := (calculado = digitado);
end;

function TfrmCadDepenBenef.getNomePlano(sidplanoprev: String): String;
VAR
  qAux: TwwQuery;
begin
  if (sidplanoprev <> emptystr)then
     begin
      try
       qAux:= TwwQuery.Create(nil);
       qAux.DatabaseName:='BaseDados';
       FazQuery(qAux,'SELECT NOME FROM PLANPREV WHERE IDPLANOPREV='+ sidplanoprev);
       result:= qAux.fieldbyname('NOME').asString;
      finally
        FreeAndNil(qAux);
      end;
     end
  else result:= emptystr;
end;

procedure TfrmCadDepenBenef.DesmarcaPlano(iIdPlano: Integer);
begin
    if not(qryDet.State in[dsInsert,dsEdit])then
      begin
       qryDet.edit;
       qrydet.fieldbyname('plano').asstring:= EmptyStr;
       qryDet.post;
      end
    else qrydet.fieldbyname('plano').asstring:= EmptyStr;
end;


//Andre Imakawa SIG25312 -inicio
procedure TfrmCadDepenBenef.AtualizaEmailFuncef(sIdpessoa: String);
var
  qAux, qryUpd: TwwQuery;
  lssql: string;
  sEmail: string;
begin
  inherited;
  qAux:= TwwQuery.Create(nil);
  qAux.DatabaseName:='BaseDados';
  qryUpd := TwwQuery.Create(nil);
  qryUpd.DatabaseName:='BaseDados';

  lssql :=  'SELECT EMAIL' + #13#10 +
            '  FROM CONTATOPESS C,' + #13#10 +
            '       (SELECT MAX(CONTATOPESS.TRGDTINCLUSAO),' + #13#10 +
            '               MAX(CONTATOPESS.IDCONTATO) AS IDCONTATO' + #13#10 +
            '          FROM CONTATOPESS ' + #13#10 +
            '         WHERE (CONTATOPESS.IDPESSOA = ' +  sIdpessoa +')) C1' + #13#10 +
            ' WHERE C.IDCONTATO = C1.IDCONTATO';

  qAux.sql.clear;
  qAux.sql.add(lssql);
  qAux.open;

  if not(qAux.isempty) then
  begin
    if qAux.fieldbyname('EMAIL').asString <> '' then
    Begin
//      sEmail:= qAux.fieldbyname('EMAIL').asString;    SIG 136772
      sEmail := qryDet.FieldByName('EMAILFUNCEF').AsString;          // SIG 136772
      if not(qryPF.isempty) then
      Begin
        if qryPF.Locate('IDPESSOA', STRTOINT(sIdpessoa),[]) then
        Begin
          if qryPF.state <> dsedit then
          begin
            qryPF.Edit;
            qryPFEMAILFUNCEF.AsString := sEmail;
            dbeEmailParticular.text := sEmail;
            qryPF.post;
          end
          Else
          Begin
            qryPFEMAILFUNCEF.AsString := sEmail;
            dbeEmailParticular.text := sEmail;
            qryPF.post;
          end;
        end;
      end;

      {
      lssql :=  'UPDATE PESSOAFISICA SET EMAILFUNCEF = ' + QuotedStr(sEmail) + ' WHERE IDPESSOA = ' + sIdpessoa;

      qryUpd.sql.clear;
      qryUpd.sql.add(lssql);
      qryUpd.ExecSQL;
      }
    end;
  end;
  FreeAndNil(qAux);
  FreeAndNil(qryUpd);
end;
//Andre Imakawa SIG25312 -final

//Darivaldo Alencar SIG 27871 - inicio
procedure TfrmCadDepenBenef.MostraEscondeGridOutrasInformacoes(MostraGrids: Boolean = false);
begin
  if (pgCtrlDetalhe.ActivePage = tbsOutrasInformacoes) then
     begin
        if (sbtnInsDet.Down) or (sbtnAltDet.Down) then
           begin
              AlinhaComponente(AlNone);
              Panel5.BringToFront;
           end
        else begin
              Panel5.SendToBack;
              AlinhaComponente(AlTop);
        end;
      end
  else if (MostraGrids) then
     begin
        Panel5.SendToBack;
        AlinhaComponente(AlTop);
        MostraGrids:= false;
     end
end;

procedure TfrmCadDepenBenef.CmeDetalheAtualizaBotoes(Sender: TObject);
 var
  lTemReg : Boolean;
begin
  inherited;
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) then
  begin
    if (qryOcupacao <> nil) and (not qryOcupacao.IsEmpty) then
       lTemReg := true
    else
       lTemReg := false;

    sbtnInsDet2.Enabled := (Not sbtnAltDet.Down);
    sbtnAltDet2.Enabled := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet2.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  begin
     sbtnInsDet2.Enabled := false;
     sbtnAltDet2.Enabled := false;
     sbtnExcluiDet2.Enabled := false;
  end;

  HabilitaCRUDDetalhe();   //edilaine - SIG25312 - inicio

  AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadDepenBenef.MostraGridInformacoesAdicionais(bMostrar: Boolean);
begin
  gbxInforAdicionais.left    := 10;
  gbxInforAdicionais.top     := 5;
  gbxInforAdicionais.visible := bMostrar;
  Label46.visible            := (not bMostrar);
  Label47.visible            := (not bMostrar);
  Label48.visible            := (not bMostrar);
  Label49.visible            := (not bMostrar);
  Label50.visible            := (not bMostrar);
  Label51.visible            := (not bMostrar);
  dblkParamPessoa.visible    := (not bMostrar);
  dbedValor.visible          := (not bMostrar);
  dtInicio.visible           := (not bMostrar);
  DtFim.visible              := (not bMostrar);
  edValida.visible           := (not bMostrar);
end;

procedure TfrmCadDepenBenef.AlinhaComponente(tpAlinhamento: TAlign);
begin
  dbgrdOutrasInforms.align := tpAlinhamento;
  gbxBotoes.align          := tpAlinhamento;

  if (tpAlinhamento = AlNone) then
    begin
       pnlMemo.align            := tpAlinhamento;
       dbgrInfoAdicionais.align := tpAlinhamento;
    end
  else begin
     pnlMemo.align            := AlBottom;
     dbgrInfoAdicionais.align := AlClient;
  end;

  dbgrdOutrasInforms.top := 0;
  gbxBotoes.top          := dbgrdOutrasInforms.height;
  dbgrInfoAdicionais.top := dbgrdOutrasInforms.height + gbxBotoes.height;
end;


procedure TfrmCadDepenBenef.sbtnInsDet2Click(Sender: TObject);
begin
  inherited;
  sbtnInsDet2.down:= false;
   if (qryDet.IsEmpty) then
       exit;
  sbtnInsDet.down:= true;
  AlinhaComponente(AlNone);
  FormataEdit(edPaiDetalhe2);
  AtivaGrid(dbgrInfoAdicionais);
  bGridPadrao:= false;
  sbtnInsDetClick(self);
  qryOcupacao.fieldbyname('DTINICIO').asString:= formatdatetime('dd/mm/yyyy', now);
end;

procedure TfrmCadDepenBenef.sbtnAltDet2Click(Sender: TObject);
 var
  qryPar: TwwQuery;
begin
  inherited;
  //edilaine SIG25312 - inico
  if (qryDet.fieldbyname('DATACANCELA').AsDateTime <> 0) then
    begin
      MsgDlg(MSG034,'Atenção',mtInformation,[mbOk],0);
      exit;
    end;
  //edilaine SIG25312 - fim

  sbtnAltDet2.down:= false;
  sbtnAltDet.down:= true;
  AlinhaComponente(AlNone);
  FormataEdit(edPaiDetalhe2);
  AtivaGrid(dbgrInfoAdicionais);
  bGridPadrao:= false;
  sbtnAltDetClick(self);
end;

procedure TfrmCadDepenBenef.sbtnExcluiDet2Click(Sender: TObject);
begin
   inherited;
   if (MsgDlg('Confirma a exclusão do registro?','Confirmação',mtConfirmation,[mbyes,mbNo],0) = mrNo) then
       exit;
       
   OpDetalhe := 'E';
   ExcluiDependenteDuplicado;
   AtivaGrid(dbgrInfoAdicionais);
   inherited sbtnExcluiDetClick(self);
end;

procedure TfrmCadDepenBenef.FormataEdit(Edit: TEdit);
begin
  If not(pgctrlDetalhe.ActivePage = tbsOutrasInformacoes) Then
        lblPaiDetalhe.visible:= false
  else begin
    if (Edit = edPaiDetalhe2) then
          lblPaiDetalhe.visible:= true
    else  lblPaiDetalhe.visible:= false;
  end;
  lblPaiDetalhe.caption := Edit.text;
  lblPaiDetalhe.left    := edPaiDetalhe.left;
  edPaiDetalhe.visible  := (not lblPaiDetalhe.visible);
end;

function TfrmCadDepenBenef.GetSequence(sTabela: String): String;
var
    QrySequence: TwwQuery;
begin
  try
    QrySequence:= TwwQuery.Create(nil);
    QrySequence.DatabaseName:= 'BaseDados';
    FazQuery(QrySequence,'SELECT NVL(MAX(IDPESSOAPPE)+1,1) AS SEQUENCIA FROM CM.PESSOAPPE');
    result:= QrySequence.fieldbyname('SEQUENCIA').asString;
  finally
     QrySequence.Destroy;
  end;
end;

procedure TfrmCadDepenBenef.AtivaGrid(nmDbGrid: twwdbgrid);
begin
   if (pgctrlDetalhe.ActivePage = tbsOutrasInformacoes) then
      begin
          grdAtual := nmDbGrid;
          qryAtual := TwwQuery(grdAtual.DataSource.DataSet);
          if (grdAtual = dbgrdOutrasInforms) then
              MostraGridInformacoesAdicionais(False)
          else MostraGridInformacoesAdicionais(True);
      end;
end;

procedure TfrmCadDepenBenef.ExcluiDependenteDuplicado;
begin
   While Not qryDepen.Eof Do
      if qryDepen.Fieldbyname('IDPESSOA').AsString = qryDet.FieldbyName('IDPESSOA').AsString then
        begin
           try
             //SIG90282 -inicio
             FazQuery(qryaux, 'SELECT COUNT(1) AS QTDE FROM DEPENTIT WHERE IDPESSOA = ' + qryDet.FieldbyName('IDPESSOA').AsString);
             if (qryaux.fieldbyname('QTDE').asInteger <= 0) then
               begin
             //SIG90282 -Fim
                 qryaux.sql.clear;
                 qryaux.sql.add('DELETE FROM DEPENDENTE WHERE IDPESSOA = ' + qryDet.FieldbyName('IDPESSOA').AsString);
                 qryaux.ExecSql;
               end;
           except
           end;
           qryDepen.Next;
        end
      else begin
          qryDepen.Next;
      end;
end;
procedure TfrmCadDepenBenef.BuscaOBSR;
begin
  if (pgctrlDetalhe.ActivePage = tbsOutrasInformacoes) then
     begin
        if (qryDet.FieldByname('IDPESSOA').AsString <> EmptyStr) then
           begin
               //edilaine - SIG25312 - inicio
               //FazQuery(qryPF2,' SELECT PF.IDPESSOA,PF.INFOADICIONAIS FROM  CM.PESSOAFISICA PF WHERE PF.IDPESSOA = ' + qryDet.FieldByname('IDPESSOA').AsString);
               qryPF2.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
               if (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0) then
                  dbMemInfoAdicionais.readOnly:= True
               else
                  dbMemInfoAdicionais.readOnly:= not(sbtnAlterar.down);
               //edilaine - SIG25312- fim
           end
        else begin
             //Quando não existe nenhum dependente cadastrado na ABA Dependentes
             //edilaine - SIG25312 - inicio
             //FazQuery(qryPF2,' SELECT PF.IDPESSOA,PF.INFOADICIONAIS FROM  CM.PESSOAFISICA PF WHERE 1 = 2');
             qryPF2.Filter := 'IDPESSOA = -1';
             dbMemInfoAdicionais.readOnly:= True;
             //edilaine - SIG25312 - fim
        end;
     end
  else formataEdit(edPaiDetalhe);
end;
//Darivaldo Alencar SIG 27871 - fim


//edilaine - SIG25312 - inicio
procedure TfrmCadDepenBenef.AjustaGridDependentes(sFiltro: string);
begin
  bAtualizaGridDep := True;

  dbgrdDet.Selected.Clear;

  if sFiltro <= '1' then
  begin
    dbgrdDet.Selected.Add('NUMSEQUENCIA'#9'4'#9'Seq.');
    dbgrdDet.Selected.Add('MATRICULA'#9'10'#9'Matrícula');
    dbgrdDet.Selected.Add('NOME'#9'40'#9'Nome');
    dbgrdDet.Selected.Add('TIPODEPENDENCIA'#9'12'#9'Grau de ~Parentesco');
    dbgrdDet.Selected.Add('FLGISENTOIRRF'#9'5'#9'Isento~ de IR');
    dbgrdDet.Selected.Add('TPISENCAOIRRF'#9'15'#9'Tipo de  Isenção~ de IRRF');
    dbgrdDet.Selected.Add('DATANASC'#9'11'#9'Data de ~Nascimento');
    dbgrdDet.Selected.Add('IDADE'#9'7'#9'Idade');
    dbgrdDet.Selected.Add('DATACADASTRO'#9'11'#9'Cadastrado ~Em');
    dbgrdDet.Selected.Add('DATACANCELA'#9'11'#9'Cancelado ~Em');
    dbgrdDet.Selected.Add('SEXO'#9'4'#9'Sexo');
//    dbgrdDet.Selected.Add('FLGELEGIVEL'#9'10'#9'Elegível a~Benefício');
//    dbgrdDet.Selected.Add('FLGBENEFICIARIO'#9'11'#9'Beneficiário');
    dbgrdDet.Selected.Add('FLGCONTAIMPOSTOR'#9'9'#9'Imposto ~de Renda');
    dbgrdDet.Selected.Add('INICIOIMPOSTOR'#9'10'#9'Data Início ~     IRRF');
    dbgrdDet.Selected.Add('FIMIMPOSTOR'#9'10'#9'Data Fim ~   IRRF');
    dbgrdDet.Selected.Add('FLGCONTASALARIOF'#9'10'#9'Salário ~Família');
    dbgrdDet.Selected.Add('INICIOSALARIOF'#9'10'#9'Data Início~Salário Família');
    dbgrdDet.Selected.Add('FIMSALARIOF'#9'10'#9'Data Fim~Salário Família');
    dbgrdDet.Selected.Add('FLGDESIGNADO'#9'10'#9'Designado ~Para Resgate');
    dbgrdDet.Selected.Add('FLGDEPLEGAL'#9'12'#9'Dependente ~Funcef');
    dbgrdDet.Selected.Add('FLGPLANOSAUDE'#9'15'#9'Plano de Saúde');     // SIG 71037 Ferrari
    dbgrdDet.Selected.Add('FLGMOLESTIAGRAVE'#9'15'#9'Possui Moléstia ~Grave');
    dbgrdDet.Selected.Add('DATAMOLESTIAGRAVE'#9'11'#9'Moléstia ~Grave desde');
    dbgrdDet.Selected.Add('DATAFIMMOLESTIA'#9'11'#9'Data Fim ~Moléstia Grave');
    dbgrdDet.Selected.Add('INICIOINVALIDEZ'#9'12'#9'Data Início~Invalidez');
    dbgrdDet.Selected.Add('FIMINVALIDEZ'#9'12'#9'Data Fim~Invalidez'#9'F');
    dbgrdDet.Selected.Add('NOMEMAE'#9'30'#9'Nome da Mãe');
    dbgrdDet.Selected.Add('NOMEPAI'#9'30'#9'Nome do Pai');
    dbgrdDet.Selected.Add('NUMDOCUMENTO'#9'11'#9'CPF');
    dbgrdDet.Selected.Add('SITUACAODEPEN'#9'15'#9'Situaçao ~Dependente');
    dbgrdDet.Selected.Add('DATAMORTE'#9'11'#9'Data do ~Falecimento');
    dbgrdDet.Selected.Add('DESCESTCIVIL'#9'20'#9'Estado ~Civil');
    dbgrdDet.Selected.Add('VALORBASE1'#9'10'#9'Opção 1');
    dbgrdDet.Selected.Add('VALORBASE2'#9'10'#9'Opção 2');
    dbgrdDet.Selected.Add('VALORBASE3'#9'10'#9'Opção 3');
    dbgrdDet.Selected.Add('NOMECONJUGE'#9'30'#9'Nome do Cônjuge');
  end
  else
  begin
    qryDet.DisableControls;
    qryDet.first;
    while not qryDet.eof do
    begin
      if qryDet.FieldByName('DEP_PLANO'+sFiltro).AsInteger = 1 then
      begin
        if qryplano.Locate('IDPESSOA;IDPLANOPREV;IDPESSJUR', VarArrayOf([qryDet.fieldByname('IDPESSOA').asstring, sFiltro,  sIdPessJur]),  []) then
         begin
          qryDet.Edit;
          qryDet.FieldByName('PLANO').AsString        := qryPlano.FieldByName('PLANO').AsString;
          qryDet.FieldByName('DATACANCEL').AsString   := qryPlano.FieldByName('DATACANCEL').AsString;
          qryDet.FieldByName('MOTIVOCANCEL').AsString := qryPlano.FieldByName('MOTIVO').AsString;
          qryDet.post;
         end;
      end;

      qryDet.next;
    end;
    qryDet.first;
    qryDet.EnableControls;

    dbgrdDet.Selected.Add('NUMSEQUENCIA'#9'4'#9'Seq.');
    dbgrdDet.Selected.Add('MATRICULA'#9'10'#9'Matrícula');
    dbgrdDet.Selected.Add('NOME'#9'40'#9'Nome');
    dbgrdDet.Selected.Add('TIPODEPENDENCIA'#9'12'#9'Grau de ~Parentesco');
    dbgrdDet.Selected.Add('FLGISENTOIRRF'#9'5'#9'Isento~ de IR');
    dbgrdDet.Selected.Add('TPISENCAOIRRF'#9'15'#9'Tipo de  Isenção~ de IRRF');
    dbgrdDet.Selected.Add('DATANASC'#9'11'#9'Data de ~Nascimento');
    dbgrdDet.Selected.Add('IDADE'#9'7'#9'Idade');
    dbgrdDet.Selected.Add('DATACADASTRO'#9'11'#9'Cadastrado ~Em');
    dbgrdDet.Selected.Add('DATACANCELA'#9'11'#9'Cancelado ~Em');
    dbgrdDet.Selected.Add('PLANO'#9'30'#9'Plano');
    dbgrdDet.Selected.Add('DATACANCEL'#9'11'#9'Cancelado ~no Plano');
    dbgrdDet.Selected.Add('MOTIVOCANCEL'#9'20'#9'Motivo do ~Cancelamento');
    dbgrdDet.Selected.Add('SEXO'#9'4'#9'Sexo');
//    dbgrdDet.Selected.Add('FLGELEGIVEL'#9'10'#9'Elegível a~Benefício');
//    dbgrdDet.Selected.Add('FLGBENEFICIARIO'#9'11'#9'Beneficiário');
    dbgrdDet.Selected.Add('FLGCONTAIMPOSTOR'#9'9'#9'Imposto ~de Renda');
    dbgrdDet.Selected.Add('INICIOIMPOSTOR'#9'10'#9'Data Início ~     IRRF');
    dbgrdDet.Selected.Add('FIMIMPOSTOR'#9'10'#9'Data Fim ~   IRRF');
    dbgrdDet.Selected.Add('FLGCONTASALARIOF'#9'10'#9'Salário ~Família');
    dbgrdDet.Selected.Add('INICIOSALARIOF'#9'10'#9'Data Início~Salário Família');
    dbgrdDet.Selected.Add('FIMSALARIOF'#9'10'#9'Data Fim~Salário Família');
    dbgrdDet.Selected.Add('FLGDESIGNADO'#9'10'#9'Designado ~Para Resgate');
    dbgrdDet.Selected.Add('FLGDEPLEGAL'#9'12'#9'Dependente ~Funcef');
    dbgrdDet.Selected.Add('FLGPLANOSAUDE'#9'15'#9'Plano de Saúde');     // SIG 71037 Ferrari
    dbgrdDet.Selected.Add('FLGMOLESTIAGRAVE'#9'15'#9'Possui Moléstia ~Grave');
    dbgrdDet.Selected.Add('DATAMOLESTIAGRAVE'#9'11'#9'Moléstia ~Grave desde');
    dbgrdDet.Selected.Add('DATAFIMMOLESTIA'#9'11'#9'Data Fim ~Moléstia Grave');
    dbgrdDet.Selected.Add('INICIOINVALIDEZ'#9'12'#9'Data Início~Invalidez');
    dbgrdDet.Selected.Add('FIMINVALIDEZ'#9'12'#9'Data Fim~Invalidez'#9'F');
    dbgrdDet.Selected.Add('NOMEMAE'#9'30'#9'Nome da Mãe');
    dbgrdDet.Selected.Add('NOMEPAI'#9'30'#9'Nome do Pai');
    dbgrdDet.Selected.Add('NUMDOCUMENTO'#9'11'#9'CPF');
    dbgrdDet.Selected.Add('SITUACAODEPEN'#9'15'#9'Situaçao ~Dependente');
    dbgrdDet.Selected.Add('DATAMORTE'#9'11'#9'Data do ~Falecimento');
    dbgrdDet.Selected.Add('DESCESTCIVIL'#9'20'#9'Estado ~Civil');
    dbgrdDet.Selected.Add('VALORBASE1'#9'10'#9'Opção 1');
    dbgrdDet.Selected.Add('VALORBASE2'#9'10'#9'Opção 2');
    dbgrdDet.Selected.Add('VALORBASE3'#9'10'#9'Opção 3');
    dbgrdDet.Selected.Add('NOMECONJUGE'#9'30'#9'Nome do Cônjuge');
  end;
  dbgrdDet.ApplySelected;

  dbgrdDet.refresh;
  
  bAtualizaGridDep := false;
end;


function TfrmCadDepenBenef.VerificaTipoCtaBanco(TipoValida : TTipoCtaBancaria; iIdTitular, iIdPessoa : Integer) : Boolean;
var
  iNumCta : byte;
begin
  Result := False;

  iNumCta := 0;

  QryCbancoPref.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  QryCbancoPref.Filtered := true;

  while not QryCbancoPref.eof do
  begin
    if ((TipoValida = tcbResgate) and (QryCbancoPref.FieldByName('FLGCONTARESGATE').AsInteger = 1)) or
       ((TipoValida = tcbPreferencial) and (QryCbancoPref.FieldByName('FLGCONTAPREF').AsInteger = 1)) then
    begin
      if (qryCBanco.State = dsInsert) or ((qryCBanco.State = dsEdit) and
         (QryCbancoPref.FieldByName('IDCBANCARIA').AsInteger <> qryCBanco.FieldByName('IDCBANCARIA').AsInteger)) then
         inc(iNumCta);
    end;
    QryCbancoPref.next;
  end;
  QryCbancoPref.Filtered := false;

  Result := not (iNumCta = 0);
end;


procedure TfrmCadDepenBenef.dbngContatoxTelBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbInsert : begin
                 qryRamal.insert;
                 qryRamal.FieldByName('IDTELCONTATO').AsFloat := LeUltRegistro(nil,'TELCONTATO');
                 Abort;
               end;
    nbDelete : begin
                 qryRamal.delete;
                 Abort;
               end;
    nbEdit  : begin
                 qryRamal.edit;
                 Abort;
              end;
  end;
end;


procedure TfrmCadDepenBenef.SetupGridPickList(const FieldName :  string);
var
  slPickList : TStringList;
  i : integer;
begin
  slPickList := TStringList.Create;
  try
    //Preencher o string list
    qryTelefone.first;
    while not qryTelefone.eof do
    begin
      slPickList.Add(qryTelefone.FieldByName(FieldName).AsString);
      qryTelefone.Next;
    end; //while
    qryTelefone.first;

    for i := 0 to dbgContatoRamal1.Columns.Count-1 do
      if dbgContatoRamal1.Columns[i].FieldName = FieldName then
      begin
        dbgContatoRamal1.Columns[i].PickList := slPickList;
        Break;
      end;

  finally
    slPickList.Free;
  end;
end;

procedure TfrmCadDepenBenef.dbgContatoRamal1CellClick(Column: TColumn);
begin
  //Fazer o drop-down pick list apareça masi rapidamente
  {if Column.PickList.Count > 0 then
  begin
    keybd_event(VK_F2,0,0,0);
    keybd_event(VK_F2,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,0,0);
    keybd_event(VK_DOWN,0,0,0);
    keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
    keybd_event(VK_MENU,0,KEYEVENTF_KEYUP,0);
  end; }
end;

procedure TfrmCadDepenBenef.qryRamalNUMEROValidate(Sender: TField);
begin
  if not (qryRamal.State in [dsInsert, dsEdit]) then Exit;

  if qryTelefone.locate('IDPESSOA;NUMERO', VarArrayOf([qryDet.FieldByName('IDPESSOA').AsString, sender.AsString]), []) then
  begin
    qryRamal.FieldByName('IDTELEFONE').AsFloat := qryTelefone.FieldByName('IDTELEFONE').AsFloat;
    qryRamal.FieldByName('IDCONTATO').AsFloat  := qryContatoIDCONTATO.AsFloat;
    qryRamal.post;
  end;
end;

procedure TfrmCadDepenBenef.HabilitaCRUDDetalhe;
begin
   if(//(pgctrlDetalhe.ActivePage = tbsDocumentos)or        //Everson Cunha - SIG79893
      (pgctrlDetalhe.ActivePage = tbsEndereco)or
      (pgctrlDetalhe.ActivePage = tbsTelefone)or
      //(pgctrlDetalhe.ActivePage = tbsContaBanco)or        //Everson Cunha - SIG76515
      (pgctrlDetalhe.ActivePage = tbsDepBen)or
      //(pgctrlDetalhe.ActivePage = tbsOutrasInformacoes)or //Everson Cunha - SIG76515
      (pgctrlDetalhe.ActivePage = tbsReprLegal) {or
      (pgctrlDetalhe.ActivePage = tbsBeneficiario)}         //Everson Cunha - SIG76515
      ) then
   begin
     sbtnInsDet.enabled     := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0) and (sbtnInsDet.enabled);
     sbtnExcluiDet.enabled  := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0) and (sbtnExcluiDet.enabled);
     sbtnInsDet2.enabled    := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0) and (sbtnInsDet2.enabled);
     sbtnExcluiDet2.enabled := not (qryDet.fieldbyname('DATACANCELA').asDateTime <> 0) and (sbtnExcluiDet2.enabled);
   end;
end;

procedure TfrmCadDepenBenef.MontaListaFiltraPlanos;
var
  sItem : string;
  i : Byte;
begin
  qryDet.DisableControls;
  wwDBTpDepen.Items.Clear;
  if not qryDet.IsEmpty then
  begin
    wwDBTpDepen.Sorted := True;
    while not qryDet.eof do
    begin
      for i := 1 to 3 do
      begin
        case i of
          1 : if qryDet.FieldByName('DEP_PLANO2').AsString = '1' then
                 sItem := 'REG/REPLAN'+ #9 + '2';
          2 : if qryDet.FieldByName('DEP_PLANO66').AsString = '1' then
                 sItem := 'REB'+ #9 + '66';
          3 : if qryDet.FieldByName('DEP_PLANO74').AsString = '1' then
                 sItem := 'NOVO PLANO'+ #9 + '74';
        end;

        if wwDBTpDepen.Items.IndexOf(sItem) = -1 then
           wwDBTpDepen.Items.Add(sItem);
      end;

      qryDet.next;
    end;
    wwDBTpDepen.Sorted := false;
    wwDBTpDepen.Items.Add('Imposto de Renda' + #9 + '1');
    wwDBTpDepen.Items.Add('Todos'            + #9 + '0');
  end;
  wwDBTpDepen.ApplyList;
  qryDet.EnableControls;
end;
//edilaine - SIG25312 - fim

//Luiz Carlos - SIG70416 - Inicio
procedure TfrmCadDepenBenef.cmbCidadeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  inherited;

  dbeEstado.Field.AsString := qryCidade.FieldByName('NOMEESTADO').AsString;
  dbePais.Field.AsString   := qryCidade.FieldByName('NOMEPAIS').AsString;

  qryEndPess.FieldByName('IDCIDADES').asinteger := qryCidade.FieldByName('IDCIDADES').asinteger;
end;
//Luiz Carlos - SIG70416 - Fim

//Taffarel - SIG68507/71228 - início
procedure TfrmCadDepenBenef.PreencheDataMolestiaGrave(dataini, datafim : string);
begin

  if qryPF.State in [dsEdit] then
    begin
      qryPF.FieldByName('DATAMOLESTIAGRAVE').AsString := dataini;
      qryPF.FieldByName('DATAFIMMOLESTIA').AsString   := datafim;
    end
end;
//Taffarel - SIG68507/71228 - fim

//edilaine - SIG102548 : inicio
procedure TfrmCadDepenBenef.dblkpcmbNacionalidadeExit(Sender: TObject);
begin
  inherited;
  dblkpcmbNacionalidadeChange(Sender);
end;
//edilaine - SIG102548 : fim


// Inicio Luis Ferrari SIG 71037
procedure TfrmCadDepenBenef.dbchkbxFlgDepLegalClick(Sender: TObject);
begin
  inherited;
  if dbchkbxFlgDepLegal.Checked   then
    begin
      dbchkbxFlgPlanoSaude.Checked := False;
    end

end;

procedure TfrmCadDepenBenef.dbchkbxFlgPlanoSaudeClick(Sender: TObject);
begin
  inherited;
  if dbchkbxFlgPlanoSaude.Checked   then
    begin
      dbchkbxFlgDepLegal.Checked := False;
    end

end;
// Fim


// Inicio SIG 126319   - SIG128969
{procedure TfrmCadDepenBenef.qryReprLegalAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if qryReprLegal.isempty then
    begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
      qryAux.SQL.Add(' CODTIPORECEBEDOR = null ');
      qryAux.SQL.Add(', IDRESPONSAVEL  = '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString));
      qryAux.SQL.Add(', IDRESPONNAOREC = null ');
      qryAux.SQL.Add(', DATAFIMRECEB = null   ');
      qryAux.SQL.Add(' WHERE  IDPESSJUR = '+Quotedstr(qry.FieldByName('IDPESSJUR').AsString)    );
      qryAux.SQL.Add(' AND IDPESSOA =     '+Quotedstr(qryDet.FieldByName('IDPESSOA').AsString)  );
      qryAux.SQL.Add(' AND IDTITULAR =    '+Quotedstr(qryDet.FieldByName('IDTITULAR').AsString) );
      qryAux.SQL.Add(' AND IDPLANOORIGEM =  '+Quotedstr(qry.FieldByName('IDPLANOPREV').AsString) );   
      qryAux.ExecSQL;
    end;

end;
}// Fim

procedure TfrmCadDepenBenef.cmbTipoOpIRCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  //WO20730 - Leandro - inicio
   If (qryBenef.State in [dsInsert, dsEdit]) then
     qryBenef.FieldByName('TIPOOPCAOIR').AsInteger := cmbTipoOpIR.ItemIndex+1;;
   //WO20730 - Leandro - fim
end;

end.
