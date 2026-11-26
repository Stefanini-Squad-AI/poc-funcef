unit FCadElegivel;

//Alterações:
{-------------------------------------------------------------------------------
Nº SIG:.............: MIGRACAO-ORACLE
Data da Alteração...: 16/10/2025
Responsável.........: Edilaine
Descrição...........: Cast de campos para Varchar2
--------------------------------------------------------------------------------
Atender:............: WO22785
Data da Alteração...: 13/06/2025
Responsável.........: Leandro Pocebon
Descrição...........: Validação para não permitir incluir no historico de tributação ir periodo inferior ao vigente.
--------------------------------------------------------------------------------
Atender:............: WO8107 
Data da Alteração...: 20/02/2024
Responsável.........: Luis Ferrari
Descrição...........: Ajuste na validação de valores para gravar (bbtnOkDetClick) .
--------------------------------------------------------------------------------
Nº SIG:.............: 136187 
Data da Alteração...: 23/05/2023
Responsável.........: Cássio Florencio Rovaroto
Descrição...........: Readequação nas alterações do nome do endereço, pelo
                      Cadastro Previdenciário.
--------------------------------------------------------------------------------
Nº SIG:.............: 134293
Data da Alteração...: 16/05/2023       
Responsável.........: Cássio Florencio Rovaroto
Descrição...........: Adequação na permissão de alteração do nome do endereço, 
                      no módulo Cadastro Previdenciário.
--------------------------------------------------------------------------------
Rotina..............: qryReprLegalBeforePost e retirado qryReprLegalAfterDelete
Nº SIG:.............: 128969
Data da Alteração...: 15/09/2022
Responsável.........: Luis Ferrari
Descrição...........: Desfazer SIG126319 e apresentar Representante Legal na Consulta Geral
--------------------------------------------------------------------------------
Rotina..............: bbtnConfirmarClick
Nº SIG:.............: 127110
Data da Alteração...: 14/07/2022
Responsável.........: Luis Ferrari
Descrição...........: Ajustar gravar Email base FUNCEF na opção alterar e mudar de aba Outras informações
--------------------------------------------------------------------------------
Rotina..............: qryReprLegalBeforePost e Criado qryReprLegalAfterDelete
Nº SIG:.............: 126319
Data da Alteração...: 17/06/2022
Responsável.........: Luis Ferrari
Descrição...........: Alteração IdResponsavel na BFCIARIOTITPLAN e  criação do qryReprLegalAfterDelete
--------------------------------------------------------------------------------
Rotina..............: DataUltimaAlteracao
Nº SIG:.............: 119407
Data da Alteração...: 15/09/2021
Responsável.........: Edilaine
Descrição...........: Ajuste na verifiçao de alteração nas útimas 24h do cadastro
--------------------------------------------------------------------------------
Nº SIG:..........: 98903
Data da Alteração: 17/03/2020
Responsável......: Taffarel Sevaybriker
Descrição........: Retirada validação de permissão de tributação de IR, criada opção
                   para atribuir a permissão em direitos do usuário.
--------------------------------------------------------------------------------
Nº SIG:..........: 91757
Data da Alteração: 17/09/2019
Responsável......: Taffarel Sevaybriker
Descrição........: Removido item do Combo de IR
--------------------------------------------------------------------------------
Alteração........: dblkpcmbPlanoCloseUp
Nº SIG:..........: 87355
Data da Alteração: 16/09/2019
Responsável......: Taffarel Sevaybriker
Descrição........: Alterado para preencher o nr. Inscrição de acordo com a Matrícula
--------------------------------------------------------------------------------
Nº SIG:..........: SIG TIBERO
Data da Alteração: 30/10/2018
Responsável......: Andre Imakawa
Descrição........: Inclusão do order by na qryAgencia
--------------------------------------------------------------------------------
Nº SIG:........... 68507
Data da Alteração: 25/05/2018
Responsável......: Andre Imakawa
Descrição........: Alteração do layout na aba Dados Pessoais (.dfm)
--------------------------------------------------------------------------------
Autor(a)   : Edilaine Ferraresi
Data       : 23/07/2018
SIG        : 71995
Descricao  : Inconsistencia na finalização do cadastro de representante legal
--------------------------------------------------------------------------------
Nº SIG:........... 67197
Data da Alteração: 26/04/2018
Responsável......: Taffarel Sevaybriker
Descrição........: Alteração do texto da label dbchkSitPlano (.dfm)
------------------------------------------------------------------------------------------------------------------------------------
Alteração........: CmeCadastroFind
Nº SIG:..........: 67018
Data da Alteração: 19/04/2018
Responsável......: André Imakawa
Descrição........: Cadastro está alterando a Matricula na DEPENTIT com a Matricula incorreta da ELEGPATRO. Ocorre na primeira
                   alteração da funcionalidade.
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 63063
Data da Alteração: 03/04/2018
Responsável......: Taffarel Sevaybriker
Descrição........: Correção do histórico de moléstia grave
------------------------------------------------------------------------------------------------------------------------------------
Alteração (dfm)..: tbsPlanosPrev, tbsElegivel, tbsPessFis, updPlanosPrev, qryPlanosPrev, qryTelefone
                   updTelefone, qryRamal
Alteracao........: CarregaDadosPessoais, PreencheDataMolestiaGrave
Nº SIG:........... 33979
Data da Alteração: 07/11/2017
Responsável......: Edilaine
Descrição........: Reestruturação da tela do elegível
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 55755
Data da Alteração: 28/02/2016
Responsável......: William Santana
Descrição........: criação da aba Perfil de Investimento
----------------------------------------------------------------------------------------------------------------------
Form.............: posição do ImportPanel
Nº SIG:........... 57642
Data da Alteração: 01/11/2017
Responsável......: Andre Imakawa
Descrição........: Correção do painel importar arquivo.
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 57607
Data da Alteração: 27/10/2017
Responsável......: Andre Imakawa
Descrição........: Desfazer o SIG 57147.
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 57147
Data da Alteração: 23/10/2017
Responsável......: Andre Imakawa
Descrição........: Correção do painel importar arquivo.
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 47046
Data da Alteração: 28/02/2016
Responsável......: Andre Imakawa
Descrição........: Correção da aba Plano Previdenciario e do campo Molestia Grave na aba dados pessoais
------------------------------------------------------------------------------------------------------------------------------------
Nº SIG:........... 21866
Data da Alteração: 28/02/2016
Responsável......: Michelle Suellyn Mota | Corrigido por : William Santana  
Descrição........: 
------------------------------------------------------------------------------------------------------------------------------------
Pendência   : SIG 37689
Responsável : Darivalo Alencar
Data        : 05/05/2017
Descrição   : Inclusão de campos TEMPOSERVTOTAL,TEMPOSERVTOTDIA ,TEMPOSERVTOTMES
              em Dados Funcionais
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------
Nº SIG...........: 27871
Data da Alteração:  25/11/2016
Responsável......: Darivaldo Alencar
Descrição........: Buscando atender a legislação, Instrução PREVIC nº 18 de 24/12/2014,
                   favor criar os seguintes campos no cadastro dos participantes:
                   Nome do conjuge; Cargo, emprego ou função pública; Órgão;
                   Período (data início e data fim).
------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Darivaldo Alencar
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Alteração no modo de exibição e obrigatoriedade dos campos da aba Documentação.
--------------------------------------------------------------------------------------------------
Nº SIG:........... 29725
Data da Alteração: 22/09/2016
Responsável......: Andre Imakawa
Descrição........: Ao clicar no alterar mais de uma vez os menus estão sendo
                   habilitados. Criado tratamento para não permitir chamada da
                   rotina "VerificaPermissao".
------------------------------------------------------------------------------
Nº SIG:........... 21016
Data da Alteração: 18/05/2016
Responsável......: Darivaldo Alencar
Descrição........: Ao selecionar a cidade na combo cmbCidade, a mesma pegava
                   primeira cidade da lista sem levar em consideração o UF
                   quando existia duas cidades com o mesmo nome.
------------------------------------------------------------------------------
------------------------------------------------------------------------------
Nº SIG:........... 19040
Nº PPM...........:
Data da Alteração: 15/04/2016
Responsável......: William Santana
Descrição........: o desfazer da última implementação realizada no módulo CADASTROPREV,
                   pela entrega do SOL 268568,
------------------------------------------------------------------------------
Nº SOL:........... 268568
Nº PPM...........: 1284501
Data da Alteração: 25/02/2016
Responsável......: Peterson victor
Descrição........: Alteração da regra para atualização da tabela BFCIARIOTITPLAN
------------------------------------------------------------------------------
Pendência   : SOL 264969 - PPM 1166927
Responsável : MICHELLE SUELLYN MOTA
Data        : 25/11/2015
Descrição   : Ajuste no controle de histórico de moléstia grave e correção do
              botão cancelar (cancela realmente as alterações realizadas).
------------------------------------------------------------------------------
Pendência   : SOL 245743/17769 PPM 1072447
Responsável : BRUNO SILVA
Data        : 15/10/2015
Descrição   : ajuste na funcionalidade de forma a aumentar o tamanho lógico do campo 'complemento' para 200 caracteres. Mudança no DFM qryEndereco.
------------------------------------------------------------------------------
Autor(a)    : Higor Nayde Ferreira
Data        : 14/06/2015
Pendência   : SOL 213269/15632 PPM 2057665
Descricao   : Solicito implantação de regra no cadastro de dependentes, quanto a não marcação de dependente legal e designado. Segue anexo com demonstração.
------------------------------------------------------------------------------
Autor(a)    : Wylliam Leite da Silva
Data        : 09/06/2015
Pendência   : SOL 242767 PPM 671063
Descricao   : Alteração do MaxLenght dos campos DDD e DDI dessa tela
------------------------------------------------------------------------------
Autor(a)    : Higor Nayde Ferreira
Data        : 09/06/2014
Pendência   : SOL 201318 KINTANA 1958253
Descricao   : Validação para Bloqueio de campos do IR.
-------------------------------------------------------------------------------------------------
Pendência   : SOL 209384/15928 KIN 2062832
Responsável : William Santana
Data        : 23/09/2014
Descrição   : Padronização da nomenclatura quanto as opções de classificação de estado civíl
--------------------------------------------------------------------------------------------------
Pendência   : SOL 241920 KTN 567184
Responsável : Fernando Xavier
Data        : 05/11/2014
Descrição   : ao inserir um representante legal no CADASTRO de elegível a participante, a informação
              do recebedor está sendo preenchida com a informação do representante legal.
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
------------------------------------------------------------------------------
Autor(a)    : Sadi Freire
Data        : 29/08/2014
Pendência   : SOL 233665
Descricao   : historico de molestia grave
------------------------------------------------------------------------------
Autor(a)    : Sadi Freire
Data        : 18/06/2014
Pendência   : SOL 233665
Descricao   : Controle de visualização do botão sbtnExcluiDet
---------------------------------------------------------------------------------------------------
Pendência   : SOL 164168/11242 KINTANA 1793508
Responsável : TADEU PASSOS
Data        : 02/07/2013
Descrição   : No cadastro de endereço do elegível e participante deverá ter um atalho para que se
              possa buscar o endereço que esteja cadastrado na consulta geral de endereço.
------------------------------------------------------------------------------
Autor(a)    : Higor Nayde Ferreira
Data        : 09/10/2013
Pendência   : SOL 203267 KINTANA 1733497
Descricao   : Aumentar o tamanho do campo "número de telefone" para 9 digitos
------------------------------------------------------------------------------
Autor(a)    : Thiago Melo
Data        : 10/01/2014
Pendência   : SOL 223594 Kintana 2057258
Descricao   : Erro ao marcar o FLAG "Solicitar Conta Salãrio", pois só é validado
              se "Data Solicitação"
------------------------------------------------------------------------------
Autor(a)    : Thiago Melo
Data        : 07/01/2014
Pendência   : SOL 223532 Kintana 2057056
Descricao   : Ao alterar qualquer dado da tela elegivel o sistema apresenta erro
------------------------------------------------------------------------------
Autor(a)    : Fernando Xavier
Data        : 29/11/2013
Pendência   : SOL 219782 KINTANA 2054136
Descricao   : funcionalidade não grava dados de nacionalidade conforme caso de
              teste disponibilizado no portal e anexo.
------------------------------------------------------------------------------
Autor(a)    : Jonas Otavio
Data        : 04/07/2013
Pendência   : SOL 184811 KINTANA 1733497
Descricao   : Criação da Tela de importação de matriculas por lote(.txt).
---------------------------------------------------------------------------------------------------
Pendência   : SOL 200675 KINTANA 1938917
Responsável : BRUNO AZEVEDO
Data        : 15/02/2013
Descrição   : Retirado o SOL 198389 para correção ao salvar documentos do dependente.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 198389 KINTANA 1908659
Responsável : Fernando Xavier
Data        : 10/01/2013
Descrição   : Ao cadastrar um dependente no atalho da funcionalidade de Elegivel e participante o
              sistema apresenta uma mensagem de erro
--------------------------------------------------------------------------------------------------
Pendência   : SOL 193932 KINTANA  1848761
Responsável : Otacilio aquino
Data        : 06/11/2012
Descrição   : O campo "e-mail base FUNCEF" não está sendo alterado.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 192984 KINTANA  1839654
Responsável : Fernando Xavier
Data        : 26/10/2012
Descrição   : Solucionado no SOL193163
--------------------------------------------------------------------------------------------------
Pendência   : SOL 193163 KINTANA  1838939
Responsável : Monica Gonzaga
Data        : 26/10/2012
Descrição   : Aparece um tela de erro com a descrição "Uma transação de usuario já está em progresso" na aba Planos previdenciários. 
Resolvido o SOL192984  "Mensagem não traduzida - ORACLE ORA - 01722 - invalid number." para que o meu SOL pudesse dar certo.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 193044 KINTANA 1836694
Responsável : Fernando Xavier
Data        : 23/10/2012
Descrição   : Erro coforme observaçoes. Matriculas para teste 0000017 e 0115690
---------------------------------------------------------------------------------------------------
Pendência   : SOL 178016 KINTANA 1698357
Responsável : Jonas Otavio Henrique R. Oliveira
Descrição   : Inclusão do campo "Email base FUNCEF"
--------------------------------------------------------------------------------
Pendência   : SOL 191898 KINTANA 1819232
Responsável : Otacilio Aquino
Data        : 09/10/2012
Descrição   : Erro ao cadastrar dependente Cadastro elegível - Dados pessoais - Dependentes
--------------------------------------------------------------------------------
Pendência   : SOL 191050 KINTANA 1808397
Responsável : Fernando Xavier
Data        : 25/09/2012
Descrição   : Erro na funcionalidade Elegivel participante
--------------------------------------------------------------------------------
Pendência   : SOL 189470 KINTANA 1787378
Responsável : Fernando Xavier
Data        : 04/09/2012
Descrição   : ao alterar dados de pessoas elegíveis. "invalid number" quando executa via DML
--------------------------------------------------------------------------------------------------
Pendência   : SOL 165677 KINTANA 1568409
Responsável : William Moreira da Silva
Descrição   : Quando o usuário tentar uma alteração no cadastro de elegível e participante, o sistema deve
verificar se houve alteração nas útimas 24 horas para o participante pesquisado
---------------------------------------------------------------------------------------------------
Pendência   : SOL 187357 KINTANA 1767650
Responsável : BRUNO AZEVEDO
Data        : 14/08/2012
Descrição   : Ajuste ao carregar os valores de naturalidade. Mudança no DFM qryLocalNascimento.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 165801 KINTANA 1242255
Responsável : William Moreira da Silva
Descrição   : Travamento constante quando utilizado CadastroPrev ou ContribuicaoPrev
--------------------------------------------------------------------------------------------------
//Pendência   : SOL 170675 KINTANA 1631585
//Responsável : Monica Gonzaga
//Data        : 25/07/2012
//Descrição   : Incluir duas flags conta salario e conta salario processada.
--------------------------------------------------------------------------------------------------
//Pendência   : SOL 172485 KINTANA 1560737
//Responsável : Andre Oliveira
//Data        : 26/12/2012
//Alt. Form   : adicionado os campos edtCartaEnvio, edtNup, lblCartaEnvio, lblNup.
//Descrição   : Incluir dois campos na funcionalidade CADASTROPREV.
--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 130508 Kintana 733058
// Descricao   : Regra para validação do IR.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 160450 / 160450-9101 KINTANA 1351426 / 1633200
Responsável : Vinicius Ferreira
Descrição   : Ao informar não calcular contribuições retroativas, o calculo não era encerrado.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 163110 KINTANA 1390542
Responsável : Fanuel Junior
Descrição   : Inclusão no CADASTRO PREV-CADASTROS-ELEGIVEL PARTICIPANTE-PLANOS PREVIDENCIARIOS 
das seguintes situações: 1 - Habilitar os flags Salario de Participação e Atual. 
2 - Incluir o campo Salário de Manutenção e habilitar o Flag.
--------------------------------------------------------------------------------------------------
//Pendência   : SOL 163838 KINTANA 1408538
//Responsável : Fernando Xavier
//Data        : 31/08/2011
//Alt. Form   : Alteração da qryContaBancaria adicionado o campo Idtitular
//Descrição   : erro ao realizar qualquer alteração na conta bancária do elegivel e participante.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 160002 KINTANA 1336145
Responsável : Renato Visoni
Descrição   : Tirar o PARTPREVPLAN.FLGDESATIVADO IN (0,1)) do MontaSelect.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 158625 KINTANA1293015
Responsável : Fanuel Junior
Descrição   : Corrigido erro ao cancelar
--------------------------------------------------------------------------------------------------
Pendência   : SOL 152407 Kintana 1138129
Responsável : Fanuel Junior
Descrição   : Alterações no grid da funcionalidade de dependente/beneficiário -  elegivel/participante
--------------------------------------------------------------------------------------------------
Pendência   : SOL 148691 KINTANA 1050517
Responsável : Fernando Xavier
Descrição   : Promover alterações na funcionalidade de histórico de tributação IR
--------------------------------------------------------------------------------------------------
Pendência   : SOL 156081 KINTANA 1222429
Responsável : Fernando Xavier
Descrição   : habilitar o campo de data de falecimento na tela de "elegivel e participante"
              do cadastroprev para alteração
--------------------------------------------------------------------------------------------------
Pendência   : SOL 148773 KINTANA 1063150
Responsável : Fanuel Junior
Descrição   : Alterado a funcionalidade de Histórico de Moléstia Grave" para que seja possível
              alterar e/ou excluir registros indevidos
---------------------------------------------------------------------------------------------------
Pendência   : SOL 154387 KINTANA 1180946
Responsável : BRUNO AZEVEDO
Data        : 29/11/2010
Descrição   : Ajuste no controle da moléstia grave.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 153559 KINTANA 1159684
Responsável : Fanuel Junior
Descrição   : Corrigido erro que bloqueava a alteração das informações do telefone
--------------------------------------------------------------------------------------------------
Pendência   : SOL 140526 KINTANA 880316
Responsável : Fanuel Junior
Descrição   : Inclusão do formulario de manutenção de contatos na Aba de Telefones
--------------------------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 149421 Kintana 1079221
Descrição   : Adicionar o campo Nº Agencia na grid.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 151398 Kintana 1107593
Responsável : FERNANDO XAVIER
Data        : 20/01/2011
Descrição   : Inconsistência ao associar o plano do titular a um novo dependente.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 149953 KINTANA  1086198
Responsável : Fernando Santana
Descrição   : Correção no cadstro de moléstia grave
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 1059049
Nº KINTANA..: 149075
Data........: 14/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Na função PossuiVinculo, colocar o tipo de situação em 'A' ou 'F'
--------------------------------------------------------------------------------------------------
Pendência   : SOL 148692 KINTANA  1050513
Responsável : Fernando Santana
Descrição   : Correção no cadstro de moléstia grave
---------------------------------------------------------------------------------------------------
Pendência   : SOL 148331 KINTANA  1040733
Responsável : Fernando Santana
Descrição   : Correção no cadstro de moléstia grave
---------------------------------------------------------------------------------------------------
Pendência   : SOL 135094 Kintana 805800
Responsável : BRUNO AZEVEDO
Data        : 29/11/2010
Descrição   : Correção erro VCL50.bpl.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 128874 KINTANA 695343
Responsável : Fanuel Junior
Data        : 19/10/2010
Descrição   : Criação do formulario Historico de Molestia Grave
--------------------------------------------------------------------------------------------------
Nº SOL......: 24591
Nº KINTANA..: 524457
Data........: 28/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Desabilitando campos que só podem ser alterados no módulo Folha de Pagamento caso
              o funcionário possua vínculo empregatício com a Funcef.
--------------------------------------------------------------------------------------------------

Pendência   : SOL 147534 KINTANA 1022208
Responsável : Fernando Santana
Data        : 19/11/2010
Descrição   : Alteração para os campos e-mails ficarem padronizados em letras minisculas.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 135283 Kintana 803604
Responsável : Renato Visoni
Descrição   : Cadastro de Conta Resgate.
---------------------------------------------------------------------------------------------------
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
Pendência   : SOL 125579 Kintana 649413
Responsável : Renato Visoni
Data        : 29/04/2010
Descrição   : Criação do Historico de Opção de IR.
---------------------------------------------------------------------------------------------------
Pendencia   : Sol 127323 Kintana 674396
Responsável : Ádler Souza
Data        : 10/05/2010
Descrição   : Incluir os campos DATA DE NOMEAÇÃO e DATA DE EXONERAÇÃO.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 139421 KINTANA 845699
Responsável : Fernando Xavier
Descrição   : Alterado o tamanho do campo Numdocumento da qrydocumento
---------------------------------------------------------------------------------------------------
Pendência   : SOL 134219  Kintana 789335
Responsável : Ádler Souza
Data        : 18/06/2010
Descrição   : Alterada a pesquisa do Titular, não trazendo os beneficiários e dependentes, adicionar
              o plano do participante, situação na fundação.
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
Autor(a)  : Ádler Souza
Data      : 10/05/2010
Pendencia : Sol 134214 / Kintana 787470
Alteração : Acerto na rotina de CmeCadastroConfirma.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 132594 KINTANA 765573
Responsável : BRUNO AZEVEDO
Data        : 18/03/2010
Descrição   : Incluir o parâmetro dataadimissao na query de entrada da regra.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 131555 KINTANA 751980
Responsável : BRUNO AZEVEDO
Data        : 02/03/2010
Descrição   : Salvar o idPais na alteração cadastral.
---------------------------------------------------------------------------------------------------
Autor(a)  : Thiago Passos
Data      : 21/01/2010
Pendencia : Sol 127643 / Kintana 685903
Alteração : Não permitir numero de celular inválidos
---------------------------------------------------------------------------------------------------
Autor(a)  : Renato Visoni
Data      : 12/08/2009
Pendencia : Sol 112013 / Kintana 520381
Alteração : Não permitir que o participante tenha mais que 1 conta salario.
---------------------------------------------------------------------------------------------------
Autor(a)  : JÉSSICA LANA
Data      : 02/09/2009
Rotina    : Cadastro Elegível
Pendencia : Sol 123896 / Kintana 623739
Alteração : Alteração na qry de updtate updoutrasinforms
----------------------------------------------------------------------------------------------------
Autor(a)  : Daniel Begnami
Data      : 13/08/2009
Rotina    : Cadastro Elegível
Pendencia : Sol 121637 / Kintana 588174
Alteração : Novo campo na aba Dados Pessoais: CAMPO: Grual de Intrução. OBS: Nova query adicionada no
            FORM. Nome_da_Query: qryGrauInstrucao.
---------------------------------------------------------------------------------------------------
Autor(a)  : Ádler Teodoro de Souza
Data      : 11/08/2009
Rotina    : Cadastro Elegível
Pendencia : Sol 123051 / Kintana 610586
Alteração : Retiramos função PessoaChangePessoa do botão alterar.
---------------------------------------------------------------------------------------------------
Autor(a)  : Ádler Teodoro de Souza
Data      : 10/08/2009
Rotina    : Cadastro Elegível
Pendencia : Sol 122928 / Kintana 608801
Alteração : Alteração do SETFOCUS para não ocasionar o erro.
---------------------------------------------------------------------------------------------------
Autor(a)  : Daniel Begnami
Data      : 07/08/2009
Rotina    :
Pendencia : Sol 116855 / Kintana 549646
Alteração : ATENÇÃO: Não é possível selecionar o opção de tributação de IR Regressiva para planos saldados.
---------------------------------------------------------------------------------------------------
Autor(a)  : Ádler Teodoro de Souza
Data      : 05/08/2009
Rotina    : Cadastro Elegível
Pendencia : Sol 122621 / Kintana 604231
Alteração : Correção das alterações aleatórias ao clicar na lista e corrigindo
inconsistência nos dados dos campos CPF.
---------------------------------------------------------------------------------------------------
Autor(a)  : Ádler Teodoro de Souza
Data      : 07/07/2009
Rotina    : Cadastro Elegível
Pendencia : Sol 86810 / Kintana 523804
Alteração : Alterações para permitir somente a inserção de CPF válido.
---------------------------------------------------------------------------------------------------
Autor(a)  : Renato Visoni
Data      : 23/06/2009
Rotina    : Cadastro Elegível e Participante
Pendencia : Sol 116.634 - Kintana 549.962
Alteração : Alteração de propriedadades para edição dos campos Data de Demissão,
            Salário de Participação, Situação na Patrocinadora, Situação na Fundação, Situação do
            Titular do Plano na Patrocinadora.
---------------------------------------------------------------------------------------------------
Autor(a)  : Henrique Massão
Data      : 16/12/2008
Rotina    :
Pendencia : Sol 103476 / Kintana 462680
Alteração : Foi alterado a propriedade Options- dgediting das grids para false,
            impossibilitando a realização de alterações direto na grid.
---------------------------------------------------------------------------------------------------
Autor(a)  : Daniel Begnami
Data      : 05/09/2008
Rotina    : PessoaChangeSubtipo
Pendencia : SOL: 95029 KT: 410579
Alteração : Quando for a operação de INCLUSÃO não verificar o MontaSelect
----------------------------------------------------------------------------------------------------

Autor(a)  : Renato Visoni
Data      : 04/09/2008
Rotina    : SQL da qryElegPatro
Pendencia : Sol 94243 / Kintana 409689
Alteração : Foi Retirado a condição (AND   EV.IDFUNCAO(+)       = E.IDFUNCAOEXT) e acrescentado uma
            nova condição (AND   EV.Idcargoext(+)       = E.Idcargoext).
----------------------------------------------------------------------------------------------------

Autor(a)  : Claudio Faria
Data      : 11/06/2008
Rotina    : Variadas
Pendencia : 27955
Alteração : Incluir um montaselect na Aba "Dados Pessoais" para retornar a
            Naturalidade, Nacionalidade e Cidade do Elegível
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 11/06/2008
Rotina    : PessoaChangeSubtipo
Pendencia : 27604
Alteração : Correção na rotina que faz a atualização autmatica da ultima evolução funcional do elegível
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 16/05/2008
Rotina      : spbDependenteClick
Pendencia   : 27883
Alteração   : Permitir que possa ser alterado dados do dependente apartir da consulta de um participante
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 29/02/2008
Rotina      : UpdOutrasInform
Pendencia   : 24655
Alteração   : Ajuste no componente UpdOutrasInform para tratar nova chave primária
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudior Faria
Data        : 25/02/2008
Rotina      : bbtnConfirmarClick
Pendencia   : 27283
Alteração   : Criar critica para cadastro de participantes por evento que devem obrigatóriamente incluir um plano previdenciário
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudior Faria
Data        : 25/02/2008  
Rotina      : LerOpcoesContrib
Pendencia   : 27298
Alteração   : Mostrar apenas as opções de contribuições que foram parametrizadas
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 12/12/2007
Rotina    : dblkpcmbPlanoCloseUp(...)
Pendencia : 26878
Alteração : Implementação de sequence para o campo INSCRICAONUMERO, que, anteriormente, era buscado
            por um SELECT MAX(...) na PartPrevPlan, ocasionando nºs de inscrição repetidos quando
            de concorrência no banco
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 10/12/2007
Rotina    : bbtnConfirmarClick(...) + VerificaPreferencial (nova função)
Pendencia : 26946
Alteração : Melhorada verificação de duplicidade de conta preferencial, não mais verificando apenas
            contra o que já está gravado no banco
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 22/11/2007
Rotina    : GravaContribuicoesParticipante e GeraDotacaoInicial(...)
Pendencia : 26847
Alteração : Corrigida gravação do UltMesPreparo na ContribPrevPartP com '0000/00' no momento da inscrição
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 26/10/2007
Rotina    : várias
Pendencia : 26673
Alteração : troca da propriedade .enabled de vários controles para .visible, para não gerar
            conflito com os direitos do usuário (autorização / SAD)
----------------------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 02/10/2007
Rotina    : CmeDetalheConfirma
Pendencia : 26475
Alteração : Ajuste na passagem dos parametros
----------------------------------------------------------------------------------------------------
Autor(a)  : Bruno Bastos
Data      : 24/09/2007
Rotina    : CmeDetalheInsert
Pendencia : 26392
Alteração : Marquei como false todos os itens do componente chktipoendereco
--------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 18/09/2007
Rotina    : AtualizaConsultaCidade
Pendencia : 22333
Alteração : Filtrar cidades pelo estado selecionado
--------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 04/09/2007
Rotina    : Várias
Pendencia : 22119
Alteração : Confirmar que a FrmAguarde seja sempre fechada qdo terminar a uma operação
--------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 29/08/2007
Rotina    : dblkParamPessoaCloseUp
Pendencia : 24655
Alteração : Retirar barreira e permitir que se posa cadastrar o mesmo parametro para a pessoa
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 16/08/2007
Rotina    : Varias
Pendencia : 19962
Alteração : Troca do DateToStr para FormatDateTime.
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 26/07/2007
Rotina    : CmeDetalheConfirma(...)
Pendencia : 23141
Alteração : Se a data de readmissão estiver preenchida, inserir na HISTFUNCPREV no campo data inicial
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 26/06/2007
Rotina      : PreparaDependente
Pendencia   : 25528 (ReAbertura)
Alteração   : Acerto na rotina de inclusão de dependente.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 27/04/2007
Rotina      : lstDocumentosClick(...)
Pendencia   : 21134
Alteração   : Canfocus antes do SetFocus
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 04/01/2007
Rotina      : PreparaContribuicoesInscricao
Pendencia   : 23893
Alteração   : Correção para considerar o parâmetro FLGNGRAVACONTZERO.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 17/11/2006
Rotina      : edDocNumDocumentoExit
Pendencia   : 23749
Alteração   : Acerto na consulta para atualizar CPF em caso de mudança na aba Documentos.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 31/10/2006
Rotina      : bbtnOkDetClick()
Pendencia   : 22300
Alteração   : Não permitir que a data de opção de IR seja anterior à data de inscrição no plano
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 23/10/2006
Rotina      : GravaReservasParticipante
Pendencia   : 23563
Alteração   : Gravação do campo IDPARTICIPANTE no insert na ReservaPart
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 05/10/2006
Pendência   : 23397
Alteração   : Retirar atualização da BENEFPLANOPART
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 21/08/2006
Pendência   : 21141 (Reabertura)
Alteração   : Verificação se já foi cadastrado uma conta preferencial
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 19/07/2006
Pendência   : 21347
Alteração   : Incluir tipo de conta corrente "OP\Recibo"
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 18/07/2006
Pendência   : 21141
Alteração   : Verificação se já foi cadastrado uma conta preferencial
----------------------------------------------------------------------------------------------------
Autor       : André Pontes
Rotina      : bbtnOkDetClick()
Pendência   : 22300
Data        : 10/07/2006 a 11/07/2006
Descrição   : Se variável bVeioDoMenu = TRUE (que caracteriza evento de inscrição), não permite
              DataOpcaoIR < Data de Inscrição
----------------------------------------------------------------------------------------------------
Autor       : Bruno Bastos
Rotina      : PessoaChangeSubtipo
Pendência   : 22599
Data        : 20/06/2006
Descrição   : Alteração de query dentro do componente qryElegPatro para adi_
              cionar novo código de modofuncao e na rotina mencionada acima.
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : PreparaDependente
Pendência   : 22600
Data        : 20/06/2006
Descrição   : Acerto na rotina de inclusão de dependente.
----------------------------------------------------------------------------------------------------
Autor       : Paulo Ramos
Rotina      : PessoaChangeSubtipo
Pendência   : 21972
Data        : 03/04/2006
Descrição   : Coloquei nvl(percfuncao) na atualização da função na Elegpatro
              para não pegar os registros da evolfuncprev que sejam adicional
              compensatório sobre funções. Estes registros tem o campo idfuncao
              preenchido, mas tem o percfuncao nulo.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Rotina      : PessoaChangeSubtipo
Data        : 10/03/2006
Pendência   : 21500

Descrição   : Novo filtro no UPDATE da Evolução Funcional
Data        : 15/03/2006
Pendência   : 21768
Descrição   : Acerto no controle do IDPESSOA na elegpatro
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : PessoaChangeSubtipo
Data        : 19/01/2006
Pendência   : 21269
Descrição   : Acerto para buscar dados do participante.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : qryelegpatro
Data        : 28/11/2005
Pendência   : 20868
Descrição   : alteração da qryelegpatro acrescentando a cláusula AND  MODOFUNCAO = 'EF'
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : CmeCadastroBeforeConfirma
Data        : 16/11/2005
Pendência   : 20639
Descrição   : Acerto para gravar o CPF correto na PESSOA e na DOCPESSOA.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : FormClose
Data        : 10/11/2005
Pendência   : 20062
Descrição   : Correção na saida do sistema para destruir o componente CalculaDv.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : bbtnOkDetClick
Data        : 25/08/2005
Pendência   : 18436
Descrição   : Permitir a aceitação da primeira opção do campo TABELA DE TRIBUTAÇÃO DE IR
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : tela
Data        : 17/08/2005
Pendência   : 19999
Descrição   : mudança do cempo consultado/alterado em dblkpcmbNaturalidade, de CODESTADO para IDESTADO
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : PessoaChangeSubtipo
Data        : 16/08/2005
Pendência   : 19974
Descrição   : Correção na lógica de comparação.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : bbtnOkDetClick
Data        : 09/08/2005
Pendência   : 19935
Descrição   : Acerto para poder alterar o campo "TABELA" da Opção de Tributação IR.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : PessoaChangeSubtipo
Data        : 04/08/2005
Pendência   : 19626
Descrição   : Implementação para atualizar a tabela de Evolução Funcional no
              momento da selecão do elegível/participante.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : dbedDocumentoEnter e edDocNumDocumentoExit
Data        : 20/06/2005
Pendência   : 19653
Descrição   : Acerto para verificação de CPF não preenchido
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Rotina      : qryPlanosPrevBeforePost e BuscaDataInicioInsc
Data        : 28/06/2005
Pendência   : 19421
Descrição   : Buscar sempre a primeira data cadastrada no campo DTINICIOINSC
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      :
Data        : 31/05/2005
Pendência   : 18061
Descrição   : Criação do parâmetro para permitir que a fundação opte por permitir que o salário do
              participante fique zerado no momento da inscrição.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Rotina      : PreparaDependente
Data        : 31/03/2005
Pendência   : 18931
Descrição   : Alterando as refências de qry para qryElegPatro
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 08/03/2005
Pendência   : 18805
Descrição   : Incluir o campo Idmodulo e outros na sql da regra de alterador de contribuição.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 01/02/2005
Pendência   : 18436
Descrição   : Alterar o campo Opção de Tabela de IR da guia de Dados Pessoais para a guia de Planos
              Previdenciários
              Incluir o campo Data também na guia de Planos Previdenciários.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 13/01/2005
Pendência   : 18436
Descrição   : Incluir o campo Opção de Tabela de IR na guia de Dados Pessoais
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 12/01/2005
Pendência   : 17451
Descrição   : Não permitir duas incrições com mesma data
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 18/11/2004
Pendência   : 17657
Descrição   : Incluir Legenda para outras informações
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 03/11/2004
Pendência   : 17919
Rotinas     : dbedDocumentoExit e edDocNumDocumentoExit
Descrição   : Atualização automática de CPF, em caso de alteração, nas tabelas
              PESSOA e DOCPESSOA.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 26/10/2004
Rotinas     : qryelegpatro
Descrição   : acrescentei o DISTINCT
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 09/09/2004
Pendência   : 17512
Rotinas     : CmeDetalheInsert e lstDocumentosClick
Descrição   : Alterações realizadas conforme descritas a seguir
              1 - Aba DOCUMENTOS:
              Ao selecionar o documento o foco do cursor é direcionado para o nº deste.
              2 - Aba ENDEREÇO:
              Valor default para o campo LOCAL como "RESIDENCIAL".
              Todos os TIPOS de endereço ja vem marcado
              3 - Aba TELEFONE:
              O foco do cursor é direcionado para o campo "DDD"
              O campo "TIPO" comercial não vem mais marcado.
              4 - Aba DADOS PESSOAIS:
              Substituição do componente ComboBox por TwwComboBox do campo "ESTADO CIVIL"
              a fim de facilitar a visualização das opções pelo usuário.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 23/08/2004
Pendência   : 17430
Rotinas     : sbtnAltDetClick
Descrição   : Inibe a alteração de um plano já cadastrado no evento de inscrição.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 23/08/2004
Pendência   : 16935
Rotinas     : sbtnInsDetClick e sbtnAltDetClick
Descrição   : Inibe a visualização do botão Opções para todas as abas com
              excessão apenas para a aba "Dados Funcionais"
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 20/08/2004
Pendência   : 17414
Rotinas     : PreparaDependente
Descrição   : Caso o participante troque de matrícula na patro e se inscreva em um novo plano
              altera a sua matricula na depentit
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 13/08/2004
Pendência   : 17334
Rotinas     : dbedDocumentoExit
Descrição   : Ao retornar da rotina do padrão verifica se o estado da query é dsBrowse, caso seja
              sai da procedure.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 03.08.2004
Rotinas     : qryelegpatro
Descrição   : inclusão da cláusula  (AND PERCFUNCAO IS NOT NULL)  no subselect de função
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 11.06.2004
Pendência   : 16922
Rotinas     : PessoaSaveSubtipo
Descrição   : Colocar variavel bExibiuPerguntaInscricao como true para não exibir mensagem
              imediatamente apos a inscricao
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 13.05.2004
Pendência   : ----
Rotinas     : Diversas
Descrição   : Acrescimo do OraNumero nas montagens de query para regra nos campos temponaocreditado
              e saltotal
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 04/05/2004
Pendência   : 16421
Rotinas     : CmeCadastroConfirma
Descrição   : Quando se tratar de evento de inscrição verifica se o participante
              tem pelo menos um endereço cadastrado.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 04/05/2004
Pendência   : 16431
Rotinas     : bbtnConfirmarClick
Descrição   : Quando se tratar de evento de inscrição ao final da inscrição
              passa a mostrar a tela de contribuições.
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 19.04.2004
Pendência   : 16428
Rotinas     : CmeCadastroFind
Descrição   : Se pessoa já existe e foi cancelada, trazer data de demissao
              em branco
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 19.04.2004
Pendência   : 16423
Rotinas     : CmeCadastroFind
Descrição   : Se for evento de inscricao, verificar se existe outra pessoa
              com os mesmos dados do procurar (chamada do dbeddocumentoexit)
----------------------------------------------------------------------------------------------------
Autor(a)    : André Tavares
Data        : 15/04/2004
Pendência   : 16517
Rotinas     : CmeCadastroDelete, CmeCadastroFind, sbtnInserirClick, sbtnAlterarClick,
              sbtnCancelarClick
Descrição   : ** utilizar o novo form de cadastro de senhas do auto-atendimento
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 06.04.2004
Pendência   : --
Rotinas     : PreparaDependente
Descrição   : Gravar matricula do participante na depentit
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 06.04.2004
Pendência   : 16473, 16422, 16426
Rotinas     : Diversas
Descrição   : Erro no click do sair, não permitir digitar data de demissao
              e não preparar contribuicoes posteriores a hoje
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 29/03/2004
Pendência   : 16370
Rotinas     : - qryPlanosPrev -
Descrição   : Fechando a query pois estava aberta e causava um erro no cliente
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 22.03.2004
Pendência   : 16269
Rotinas     : Diversas
Descrição   : - Tratamento da Mensagem de participante já existe
              - Retirada do status do grid pois é um campo de controle
                interno
              - Acerto na atualização do FLGDESATIVADO
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 22.03.2004
Pendência   : 16269
Rotinas     : Diversas
Descrição   : Tratamento da Mensagem de participante já existe
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 02/02/2004
Pendência   : REFER
Rotinas     : qryPlanosPrev
Descrição   : Incluído o campo status do plano (FLGDESATIVADO).
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 02/02/2004
Pendência   : 15980
Rotinas     : GravaContribuicoesParticipante e LerOpcoesContrib
Descrição   : Forçando a chamada da função OraNumero a partir da UADMPREV.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 26/11/2003
Pendência   : 15652
Rotinas     : CmeDetalheConfirma
Descrição   : Grava o campo FLGCONTATS na HISTFUNCPREV de acordo com configuração -
              Parâmetro prmFlgContaTempInsc
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 15/11/2003
Descrição   : Inclusão do FLGSOMAIRSUPINSS
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 12/11/2003
Alteração : comentei a chamada da função AtualizaNumeroDependentes, que atualiza a marcação de
            dependente de IR e Sal. Família na depentit, somando para o titular.
            Esta cálculo só é usado na Funcef, só que a informação de ir e sal. família
            já vem no Interface Cadastral, e como  data de início para estes não vem
            informada, as marcações que estavam certas acabam sendo modificadas erradamente.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Tavares
Data        : 11/11/2003
Pendência   : 15548
Rotinas     : CmeCadastroDelete, CmeCadastroFind, sbtnInserirClick, sbtnAlterarClick,
              sbtnCancelarClick
Descrição   : ** Implementação do dialog para cadastrar Login e senha para o participante,
              acessível na tabsheet de dados pessoais. Este dialog encontra-se na BPL WEBCOMUM.BPL .
              ** Exclusão do registro na tabela webacesso caso se queira excluir o participante
----------------------------------------------------------------------------------------------------
Autor(a)    : Carlos Guedes
Data        : 27/10/2003
Pendência   : 15499
Rotina      : dblkpcmbPlanoCloseUp
Descrição   : Retirei da query um montaselect que estava sendo usando como filtro.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 10/10/2003
Descrição   : Acerto no controle das contas correntes CalculaDV.
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 03.10.2003
Pendencia   :
Rotina      : dblkpcmbPlanoCloseUp
Descrição   : Nao permitir inscrever duas vezes no mesmo plano
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 17.09.2002
Pendencia   : 14630
Rotina      : qryCidade
Descrição   : Colocar o codestado no combo de cidade
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 19/08/2003
Rotina      : várias
Descrição   : troca na ordem de apply que estavam dando erro
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 20/08/2003
Rotina      : IniciaEventoInscricao
Pendencia   : 14869
Descrição   : Desabilita o botão de dependente no evento de inscrição.
----------------------------------------------------------------------------------------------------
Autor(a)    : Carlos Guedes
Data        : 30/07/2003
Alteração   : qryElegpatro
Descrição   :  Não obrigando que houvesse DATAINICIO (EV.DATAINICIO IS NULL)
----------------------------------------------------------------------------------------------------
Autor(a)    : Carlos Guedes
Data        : 24/07/2003
Alteração   : AtualizaSitParticipante
Pendência   : 14619
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 25/06/2003
Alteração   : Validação da conta somente se FLGVALIDACC = 'S'
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 18.06.2003
Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotinas     : QRYELEGPATRO
Autor(a)    : Leo
Data        : 18.06.2003
Alteração   : Acrescentei a cláusula AND   C.IDPESSJUR(+) = E.IDPESSJUR
----------------------------------------------------------------------------------------------------
Rotinas     : QRYELEGPATRO
Autor(a)    : Leo
Data        : 11.06.2003
Alteração   : acrescentei a cláusula AND   F.IDPESSJUR(+) = E.IDPESSJUR
----------------------------------------------------------------------------------------------------
Rotinas     : Objeto Pessoa.SaveModuloRespon
Autor(a)    : Camille
Data        : 28.04.2003
Alteração   : Alterar parametro para ver o parametro bUsaModRespon
----------------------------------------------------------------------------------------------------
Rotinas     : GeraDotacaoInicial, PreparaContribuicoesInscricao
Autor(a)    : Gleyber
Data        : 19/02/2003
Alteração   : Preencher o campo FOLHAORIGEM na HSTCONTRIBPREV no momento da
              inscrição.
----------------------------------------------------------------------------------------------------
Rotinas     : CmeCadastro.OnFind,
Autor(a)    : Carlos Guedes
Data        : 17/03/2003
Alteração   : Implementando pendência 13027 - Tratamento do LEF
              - Licença Especial da FUNCEF.
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Camille
Data        : 05.01.2003
Alteração   : Preenchimento da funcao atual do participante
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Leo
Data        : 13/11/2002
Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Gleyber
Data        : 29/10/2002
Alteração   : Permitir digitação das opçoes na inclusao de elegível.
Pendência   : 9661
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Gleyber
Data        : 27/09/2002
Alteração   : Inclusão do campo DATAFIMMOLESTIA
Pendência   : 9548
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask, wwdbedit,  Wwdbspin,
  ExtDlgs, TB97Ctls, TB97Tlbr, TEdNum, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  TREdit {$IFNDEF VERSAO0505 }, UCMTypes, Wwdotdot, Wwdbcomb {$ENDIF}, fEscolhePessoa,
  DBGrids, fHistMolestiaGrave, DBClient, Wwdbdlg, uValidaDoc;


const
  //edilaine - SIG33979 - inicio
  MSG022 = 'O CPF informado não é válido. Favor corrigir.';
  MSG028 = 'O e-mail cadastrado não é válido. Favor verificar!';
  MSG029 = 'Este CPF possui mais de um cadastro.';
  MSG030 = 'A Data Término da Moléstia Grave tem que ser maior que a Data Início.';
  MSG031 = 'O período informado da Moléstia Grave está em desacordo com um período já cadastrado.';
  //edilaine - SIG33979 - fim


type
  TfrmCadElegivel = class(TfrmPessoa)
    tbsElegivel:  TTabSheet;
    pnlControlesElegivel: TPanel;
    qryElegPatro: TwwQuery;
    dsElegPatro: TwwDataSource;
    qryPatro: TwwQuery;
    qrySitFunc: TwwQuery;
    qryCargo: TwwQuery;
    dbgrdElegivel: TwwDBGrid;
    qryCCusto: TwwQuery;
    updElegPatro: TUpdateSQL;
    tbsPlanosPrev: TTabSheet;
    dbgrdPlanosPrev: TwwDBGrid;
    qryPlanosPrev: TwwQuery;
    dsPlanosPrev: TwwDataSource;
    updPlanosPrev: TUpdateSQL;
    pnlControlesPlanos: TPanel;
    grpInscricao: TGroupBox;
    dbrgrpTipoInsc: TDBRadioGroup;
    GroupBox1: TGroupBox;
    qryPlanPrev: TwwQuery;
    qrySitPart: TwwQuery;
    qryAux: TwwQuery;
    qryDepen: TwwQuery;
    updDepen: TUpdateSQL;
    qryDepenTit: TwwQuery;
    updDepentit: TUpdateSQL;
    Label21: TLabel;
    dbdtInscricao: TCMDateTimePicker;
    Label17: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    Label23: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryGrava: TwwQuery;
    qryAux2: TwwQuery;
    Label2: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qrySitPlanoPrev: TwwQuery;
    tbsPessFis: TTabSheet;
    dsNaturalidade: TwwDataSource;
    qryNaturalidade: TwwQuery;
    pnlPessFis: TPanel;
    dbrgrpSexo: TDBRadioGroup;
    grpFiliacao: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    grpNaturalidade: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    grpDataNasc: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    wwDBEdit4: TwwDBEdit;
    dbdtNasc: TCMDateTimePicker;
    grpDependentes: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    dbNDepIRRF: TwwDBSpinEdit;
    dbNDepSALFAM: TwwDBSpinEdit;
    dbNDepTOTAL: TwwDBSpinEdit;
    bbtnContribuicoes: TBitBtn;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    dbedInscNumero: TwwDBEdit;
    Label18: TLabel;
    dbdtRequerimento: TCMDateTimePicker;
    gpDataCancelamento: TGroupBox;
    Label35: TLabel;
    dbDataCancelamento: TCMDateTimePicker;
    gpDataManutencao: TGroupBox;
    Label34: TLabel;
    dbDataInicioManut: TCMDateTimePicker;
    GroupBox7: TGroupBox;
    Label36: TLabel;
    GroupBox8: TGroupBox;
    lblPatro: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    lblSitFunc: TLabel;
    dblkpcmbSitPatro: TwwDBLookupCombo;
    GroupBox9: TGroupBox;
    lblCargo: TLabel;
    dblkpcmbCargo: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    lblMatricula: TLabel;
    dbedMatricula: TDBEdit;
    Label13: TLabel;
    dbdtAdesao: TCMDateTimePicker;
    lblDataDemissao: TLabel;
    dbDataDemissao: TCMDateTimePicker;
    Label14: TLabel;
    dbedSalario: TDBEdit;
    tbsContaBancaria: TTabSheet;
    Panel3: TPanel;
    GroupBoxBanco: TGroupBox;
    Label38: TLabel;
    dblkpcmbAgencia: TwwDBLookupCombo;
    qryContaBancaria: TwwQuery;
    dsContaBancaria: TwwDataSource;
    updContaBancaria: TUpdateSQL;
    Label39: TLabel;
    dblkpcmbBanco: TwwDBLookupCombo;
    qryAgencia: TwwQuery;
    qryBanco: TwwQuery;
    Labelfilial: TLabel;
    cmbfilial: TwwDBLookupCombo;
    qryfilial: TwwQuery;
    dspatro: TwwDataSource;
    tbshtFundacao: TTabSheet;
    qryfundacao: TwwQuery;
    Panel4: TPanel;
    dblkpcmbFundacao: TwwDBLookupCombo;
    dbedinsc: TDBEdit;
    lblfund: TLabel;
    lblinsc: TLabel;
    dbgrdFundacoes: TwwDBGrid;
    dsfundacoes: TwwDataSource;
    qryfundacoes: TwwQuery;
    updfundacoes: TUpdateSQL;
    qryGrava2: TwwQuery;
    Label43: TLabel;
    dbedNivel: TwwDBEdit;
    Label44: TLabel;
    dbedSalPartInsc: TwwDBEdit;
    memAvisoContrib: TMemo;
    edSalarioPart: TEditNum;
    sbtnConsContrib: TSpeedButton;
    qryBenefPlanoPart: TwwQuery;
    updBenefPlanoPart: TUpdateSQL;
    qryEventosPrev: TwwQuery;
    updEventosPrev: TUpdateSQL;
    qryHstContEventosPR: TwwQuery;
    updHstContEventosPR: TUpdateSQL;
    qryContribPrevPartP: TwwQuery;
    updContribPrevPartP: TUpdateSQL;
    qryHstContribPrev: TwwQuery;
    updHstContribPrev: TUpdateSQL;
    qryHstAtrasoContrib: TwwQuery;
    updHstAtrasoContrib: TUpdateSQL;
    qryCtrlInterface: TwwQuery;
    updCtrlInterface: TUpdateSQL;
    qryHstRubSal: TwwQuery;
    updHstRubSal: TUpdateSQL;
    qryHstRubricaXPess: TwwQuery;
    updHstRubricaXPess: TUpdateSQL;
    dblkOrgPrev: TwwDBLookupCombo;
    qryOrgaoPrev: TwwQuery;
    qryElegPatroIDPESSJUR: TFloatField;
    qryElegPatroIDPESSOA: TFloatField;
    qryElegPatroIDSITFUNC: TFloatField;
    qryElegPatroCODCENTROCUSTO: TStringField;
    qryElegPatroIDCARGOEXT: TFloatField;
    qryElegPatroMATRICULA: TStringField;
    qryElegPatroDATAADMISSAO: TDateTimeField;
    qryElegPatroPARTICIPPREVID: TFloatField;
    qryElegPatroPARTICIPASSIST: TFloatField;
    qryElegPatroIDEMPRESAPROP: TFloatField;
    qryElegPatroNIVEL: TStringField;
    qryElegPatroDATAINICIOAFAST: TDateTimeField;
    qryElegPatroDATAFIMAFAST: TDateTimeField;
    qryElegPatroIDESTAB: TFloatField;
    qryElegPatroTEMPONAOCREDITADO: TFloatField;
    qryElegPatroTEMPOSERVANTERIOR: TFloatField;
    qryElegPatroTEMPOSERVANTREAL: TFloatField;
    qryElegPatroDATADEMISSAO: TDateTimeField;
    qryElegPatroTEMPOSITESPECIAL: TFloatField;
    qryElegPatroVALORBASE1: TFloatField;
    qryElegPatroVALORBASE2: TFloatField;
    qryElegPatroVALORBASE3: TFloatField;
    qryElegPatroIDPESSJURORGAO: TFloatField;
    qryElegPatroFLGDIRETOR: TFloatField;
    qryElegPatroPATROCINADORA: TStringField;
    qryElegPatroFILIAL: TStringField;
    Label3: TLabel;
    qryElegPatroSIGLA: TStringField;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    dbgrpContaConj: TDBRadioGroup;
    Label40: TLabel;
    dbedContaCorrente: TwwDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    qrySitFuncIDSITFUNC: TFloatField;
    qrySitFuncDESCRICAO: TStringField;
    qryElegPatroSITFUNC: TStringField;
    Label6: TLabel;
    dbdtMorte: TCMDateTimePicker;
    qryElegPatroSALTOTAL: TFloatField;
    Label7: TLabel;
    qryVinculaFunc: TwwQuery;
    Label8: TLabel;
    dblkpcmbVinculaFunc: TwwDBLookupCombo;
    dbrgrpSitEspecial: TDBRadioGroup;
    qryElegPatroCODVINCULAFUNC: TStringField;
    qryElegPatroDESCRICAO: TStringField;
    Label9: TLabel;
    edtCodCargo: TEdit;
    GroupBox3: TGroupBox;
    qryElegPatroDATAREADMISSAO: TDateTimeField;
    Label11: TLabel;
    Label12: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    CMDateTimePicker4: TCMDateTimePicker;
    Label10: TLabel;
    edtDataReadmissao: TCMDateTimePicker;
    qryEnderecoCODESTADO: TStringField;
    dbeCodEstado: TwwDBEdit;
    spbDependente: TSpeedButton;
    qryHistFuncPrev: TwwQuery;
    updHistFuncPrev: TUpdateSQL;
    Label16: TLabel;
    Label19: TLabel;
    grpDataManutencao: TGroupBox;
    dbDataInscricaoInss: TCMDateTimePicker;
    tbsOutrasInforms: TTabSheet;
    Panel5: TPanel;
    dbgrdOutrasInforms: TwwDBGrid;
    dsOutrasInforms: TwwDataSource;
    qryOutrasInforms: TwwQuery;
    updOutrasInforms: TUpdateSQL;
    dblkParamPessoa: TwwDBLookupCombo;
    dbedValor: TwwDBEdit;
    dtInicio: TCMDateTimePicker;
    qryParamPessoa: TwwQuery;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    DtFim: TCMDateTimePicker;
    Label50: TLabel;
    edValida: TEdit;
    Label51: TLabel;
    Label15: TLabel;
    dblkpcmbCCusto: TwwDBLookupCombo;
    Label41: TLabel;
    dbedTempoServAnterior: TwwDBEdit;
    Label42: TLabel;
    Label24: TLabel;
    dbedTempoNaoCreditado: TwwDBEdit;
    Label37: TLabel;
    GroupBox11: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    edCodFuncaoAtual: TEdit;
    edFuncaoAtual: TEdit;
    Label55: TLabel;
    edGrupoFuncaoAtual: TEdit;
    edModoFuncaoAtual: TEdit;
    qryElegPatroCODGRUPO: TStringField;
    qryElegPatroCODFUNCAO: TStringField;
    qryElegPatroFUNCAO: TStringField;
    qryElegPatroCODCARGO: TStringField;
    qryElegPatroCARGO: TStringField;
    qryElegPatroMODOFUNCAO: TStringField;
    qryCedidoPatro: TwwQuery;
    qryElegPatroIDPESSJURCEDIDO: TFloatField;
    cboxCedidoPatro: TwwDBLookupCombo;
    Label56: TLabel;
    dbrgrpDiretor: TDBRadioGroup;
    bbtnOpcoes: TBitBtn;
    Label57: TLabel;
    spBtnLogin: TSpeedButton;
    qryWebAcesso: TwwQuery;
    DbChbSomaIR: TDBCheckBox;
    Label58: TLabel;
    //cmbEstCiv: TwwDBComboBox;
    DBMemo2: TDBMemo;
    Label59: TLabel;
    dsParamPessoa: TwwDataSource;
    grpTipoOpIR: TGroupBox;
    cmbTipoOpIR: TwwDBComboBox;
    Label60: TLabel;
    Label61: TLabel;
    dbDataOpcaoIR: TCMDateTimePicker;
    MontaSelectEndereco: TMontaSelect;
    BitBtn1: TBitBtn;
    edtNacionalidade: TEdit;
    edtNaturalidade: TEdit;
    edtEstado: TEdit;
    qryLocalNascimento: TwwQuery;
    dblkGrauInstrucao: TwwDBLookupCombo;
    Label62: TLabel;
    qryPessoaFisicaDATAFIMMOLESTIA: TDateTimeField;
    qryGrauInstrucao: TwwQuery;
    dbgrdContaBancaria: TwwDBGrid;
    qryEnderecoIDPAIS: TFloatField;
    qryElegPatroDTNOMEACAO: TDateTimeField;
    qryElegPatroDTEXONERACAO: TDateTimeField;
    edtDataNomeacao: TCMDateTimePicker;
    lblDataNomeacao: TLabel;
    edtDataExoneracao: TCMDateTimePicker;
    lblDataExoneracao: TLabel;
    grpHistIr: TGroupBox;
    grdHistoricoTipoIr: TwwDBGrid;
    QryHistoricoTipoIr: TQuery;
    dsHistoricoTipoIr: TDataSource;
    qryMolestiaGrave: TwwQuery;
    dsMolestiaGrave: TwwDataSource;
    dbRdgContaResgate: TDBRadioGroup;
    QryContaResgate: TwwQuery;
    updContaResgate: TUpdateSQL;
    QryhstOpcaoIr: TwwQuery;
    UpdhstOpcaoIr: TUpdateSQL;
    spbtHistipoIrAlterar: TSpeedButton;
    spbtHistipoIrExcluir: TSpeedButton;
    QryHistoricoTipoIrNOME: TStringField;
    QryHistoricoTipoIrDTINICIO: TDateTimeField;
    QryHistoricoTipoIrDTFIM: TDateTimeField;
    QryHistoricoTipoIrIDHISTOPIR: TFloatField;
    CDShistIrLocal: TClientDataSet;
    CDShistIrLocalDTINICIO: TDateField;
    CDShistIrLocalDTFIM: TDateField;
    CDShistIrLocalIDHISTOPIR: TFloatField;
    CDShistIrLocalTIPOOPCAOIR: TFloatField;
    DataSource1: TDataSource;
    QryHistoricoTipoIrMENORDATA: TDateTimeField;
    Panel8: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    dbedEmailContato: TDBEdit;
    DBEdit8: TDBEdit;
    CMDateTimePicker5: TCMDateTimePicker;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBMemo3: TDBMemo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    ToolbarButtonInsereContato: TToolbarButton97;
    ToolbarButtonAlteraContato: TToolbarButton97;
    ToolbarButtonExcluiContato: TToolbarButton97;
    Edit1: TEdit;
    qryContatoTel: TwwQuery;
    dsContatoTel: TwwDataSource;
    GroupBox12: TGroupBox;
    dbedSalMantido: TwwDBEdit;
    edtCartaEnvio: TwwDBEdit; // SOL 172485 KINTANA 1560737
    edtNup: TwwDBEdit;  // SOL 172485 KINTANA 1560737
    lblCartaEnvio: TLabel; // SOL 172485 KINTANA 1560737
    lblNup: TLabel; // SOL 172485 KINTANA 1560737
    grpContaSalario: TGroupBox;
    dbchkcontasalario: TDBCheckBox;
    dbchksolicitacontasalario: TDBCheckBox;
    grpContaProcessada: TGroupBox;
    dbchk2: TDBCheckBox;
    dbchkSalarioProcessado: TDBCheckBox;
    dtsolicitacontasalario: TCMDateTimePicker;
    dtcontasalarioprocessada: TCMDateTimePicker;
    lblDtSolicitacao: TLabel;
    lbldtprocessada: TLabel;
    qryPessoaFisicaFLGSOLICITACONTASALARIO: TFloatField;
    qryPessoaFisicaFLGCONTASALARIOPROCESSADA: TFloatField;
    dtmfldPessoaFisicaDTSOLICITACONTASALARIO: TDateTimeField;
    dtmfldPessoaFisicaDTCONTASALARIOPROCESSADA: TDateTimeField;
    Label69: TLabel;
    EdtEmailParticular: TEdit;
    qryPessoaFisicaEMAILFUNCEF: TStringField;
    btnBuscarEndereco: TButton;
    OpenDialog1: TOpenDialog;
    qryPessoaFisicaTIPOISENCAOIRRF: TFloatField;
    dsReprLegal: TwwDataSource;
    updReprLegal: TUpdateSQL;
    dsLogReprLegal: TwwDataSource;
    qryLogReprLegal: TwwQuery;
    qryReprLegal: TwwQuery;
    MSResp: TMontaSelect;
    tbsReprLegal: TTabSheet;
    pnlReprLegal: TPanel;
    grpResponsavel: TGroupBox;
    sbtnSelResponsavel: TSpeedButton;
    sbtnCadResponsavel: TSpeedButton;
    Labellbl1: TLabel;
    Labellbl2: TLabel;
    LabelCPFRes: TLabel;
    dbeResponsavel: TDBEdit;
    lkpcmbTipoRecebedor: TCMDBLookupCombo;
    DBeCPFRes: TwwDBEdit;
    grp1: TGroupBox;
    Labellbl5: TLabel;
    Labellbl3: TLabel;
    tmpckrDATAINICIO: TCMDateTimePicker;
    rgSituacaoAtual: TRadioGroup;
    tmpckrDATAtermino: TCMDateTimePicker;
    grpObs: TGroupBox;
    dbmmoOBSERVACAO: TDBMemo;
    pnlGrdReprLegal: TPanel;
    dbgrdReprLegal: TwwDBGrid;
    dbgrdLogReprLegal: TwwDBGrid;
    qryTipoRecebedor: TQuery;
    qryLogReprLegalNUMDOCUMENTO: TStringField;
    qryLogReprLegalNOMERESPONSAVEL: TStringField;
    qryLogReprLegalNOMERECEBEDOR: TStringField;
    qryLogReprLegalTIPORESPONSAVEL: TStringField;
    qryLogReprLegalCODTIPORESPONSAVEL: TStringField;
    qryLogReprLegalSITUACAO: TStringField;
    qryLogReprLegalSITATUAL: TFloatField;
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
    qryLogReprLegalACAO: TStringField;
    qryLogReprLegalTRGDTINCLUSAO: TDateTimeField;
    qryLogReprLegalNOMEUSUARIO: TStringField;
    qryReprLegalNUMDOCUMENTO: TStringField;
    qryReprLegalNOMERESPONSAVEL: TStringField;
    qryReprLegalNOMERECEBEDOR: TStringField;
    qryReprLegalTIPORESPONSAVEL: TStringField;
    qryReprLegalCODTIPORESPONSAVEL: TStringField;
    qryReprLegalSITUACAO: TStringField;
    qryReprLegalSITATUAL: TFloatField;
    qryReprLegalIDPESSJUR: TFloatField;
    qryReprLegalIDTITULAR: TFloatField;
    qryReprLegalIDPLANOORIGEM: TFloatField;
    qryReprLegalIDPESSOA: TFloatField;
    qryReprLegalSEQPROPOSTA: TFloatField;
    qryReprLegalIDPLANOPREV: TFloatField;
    qryReprLegalIDRESPONSAVEL: TFloatField;
    qryReprLegalIDRECEBEDOR: TFloatField;
    qryReprLegalDATAINICIO: TDateTimeField;
    qryReprLegalDATATERMINO: TDateTimeField;
    qryReprLegalOBSERVACAO100: TStringField;
    qryReprLegalOBSERVACAO: TMemoField;
    qryReprLegalTRGDTINCLUSAO: TDateTimeField;
    qryReprLegalNOMEUSUARIO: TStringField;
    qryBenef: TwwQuery;
    qryBenefIDTITULAR: TFloatField;
    qryBenefIDPESSOA: TFloatField;
    qryBenefIDRESPONSAVEL: TFloatField;
    qryBenefIDRESPONNAOREC: TFloatField;
    qryBenefCODTIPORECEBEDOR: TStringField;
    qryBenefIDBENEFICIO: TFloatField;
    qryBenefDATAFIMRECEB: TDateTimeField;
    dsBenef: TwwDataSource;
    cmbEstCiv: TwwDBLookupCombo;
    qryEstCivil: TwwQuery;
    dsEstCivil: TwwDataSource;
	CMValidaCPF: TCMValidaDoc;
    dbedAnos: TwwDBEdit;
    dbedMeses: TwwDBEdit;
    dbedDias: TwwDBEdit;
    qryElegPatroTEMPOSERVTOTAL: TFloatField;
    qryElegPatroTEMPOSERVTOTMES: TFloatField;
    qryElegPatroTEMPOSERVTOTDIA: TFloatField;
    lblNmConjuge: TLabel;
    dbeNmConjuge: TwwDBEdit;
    qryPessoaFisicaTPISENCAOIRRF: TStringField;
    qryPessoaFisicaNOMECONJUGE: TStringField;
    gbxInforAdicionais: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    dbeOcupProfissional: TwwDBEdit;
    dbeEntidade: TwwDBEdit;
    dtpDataInicio: TCMDateTimePicker;
    dtpDataFim: TCMDateTimePicker;
    dbeRenda: TDBRealEdit;
    gbxBotoes: TGroupBox;
    tb97BotoesDetalhe2: TPanel;
    sbtnInsDet2: TToolbarButton97;
    sbtnAltDet2: TToolbarButton97;
    sbtnExcluiDet2: TToolbarButton97;
    edPaiDetalhe2: TEdit;
    pnlMemo: TPanel;
    lblInfoAdicionais: TLabel;
    dbMemInfoAdicionais: TDBMemo;
    dbgrInfoAdicionais: TwwDBGrid;
    qryPF2: TwwQuery;
    updPf2: TUpdateSQL;
    dsPF2: TwwDataSource;
    qryOcupacao: TwwQuery;
    dsOcupacao: TwwDataSource;
    updOcupacao: TUpdateSQL;
    ImportPanel: TPanel;
    LblImportarArquivo: TLabel;
    EdtImportarArquivo: TEdit;
    Buscar: TBitBtn;
    lblNomePai: TLabel;
    qryOcupacaoIDPESSOAPPE: TFloatField;
    qryOcupacaoCARGOEMPFUNC: TStringField;
    qryOcupacaoENTIDADE: TStringField;
    qryOcupacaoDTINICIO: TDateTimeField;
    qryOcupacaoDTFIM: TDateTimeField;
    qryOcupacaoIDPESSOA: TFloatField;
    qryOcupacaoRENDA: TFloatField;
    grbSitPlano: TGroupBox;
    Label75: TLabel;
    dbchkSitPlano: TDBCheckBox;
    chkAssociaEnd: TCheckBox;
    tbsPerfilInvest: TTabSheet;
    pnlPerfilInvest: TPanel;
    gpPerfilInvest: TGroupBox;
    lblPlanPrev: TLabel;
    lnlNomePerfil: TLabel;
    lblDtiniPI: TLabel;
    lbldtFimPI: TLabel;
    lblPlanoCont: TLabel;
    lckupNomePerfilPI: TwwDBLookupCombo;
    dtDtIniPI: TCMDateTimePicker;
    dtDtFimPI: TCMDateTimePicker;
    lckupPlanPrevPI: TwwDBLookupCombo;
    edtPlanoContPI: TEdit;
    dbgrdPerfilinvest: TwwDBGrid;
    qryNomePI: TwwQuery;
    dsPerfilInvest: TwwDataSource;
    qryPerfilInvest: TwwQuery;
    qryPlanPrevPI: TwwQuery;
    updPerfilInvest: TUpdateSQL;
    qryPerfilAux: TwwQuery;
    updPerfilAux: TUpdateSQL;
    pnlMolestiaIR: TPanel;
    dbrgrpIsentoIR: TDBRadioGroup;
    Panel9: TPanel;
    wwDBCBIsentoIrrf: TwwDBComboBox;
    Panel6: TPanel;
    BitBtnHistorico: TButton;
    Panel7: TPanel;
    dbrgrpMolestiaGrave: TGroupBox;
    Label22: TLabel;
    Label45: TLabel;
    dbdtMolestiaGrave: TCMDateTimePicker;
    dbdtFimMolestia: TCMDateTimePicker;
    procedure AtualizaGridContatos();
    procedure FormActivate(Sender: TObject);
    procedure qryElegPatroBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryElegPatroAfterScroll(DataSet: TDataSet);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbSitPartCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPlanosPrevBeforePost(DataSet: TDataSet);
    procedure qryPlanosPrevAfterPost(DataSet: TDataSet);
    procedure dblkpcmbSitPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPessoaFisicaAfterInsert(DataSet: TDataSet);
    procedure bbtnContribuicoesClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryPlanosPrevAfterInsert(DataSet: TDataSet);
    procedure qryPlanosPrevAfterScroll(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure qryContaBancariaBeforePost(DataSet: TDataSet);
    procedure dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure cmbfilialCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    Procedure InsereEndereco(Idpessoa : String);
    procedure dblkpcmbSitPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbFundacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryfundacoesAfterInsert(DataSet: TDataSet);
    procedure qryfundacaoBeforeOpen(DataSet: TDataSet);
    procedure dsfundacoesStateChange(Sender: TObject);
    procedure qryfundacoesBeforePost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure dsPlanosPrevStateChange(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbdtInscricaoExit(Sender: TObject);
    procedure dbdtNascExit(Sender: TObject);
    procedure dbdtNascEnter(Sender: TObject);
    procedure dbdtAdesaoEnter(Sender: TObject);
    procedure dbdtAdesaoExit(Sender: TObject);
    procedure dbdtInscricaoEnter(Sender: TObject);
    procedure dbrgrpSexoEnter(Sender: TObject);
    procedure dbrgrpSexoExit(Sender: TObject);
    procedure dbedTempoServAnteriorEnter(Sender: TObject);
    procedure dbedTempoServAnteriorExit(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure dbedSalPartInscExit(Sender: TObject);
    procedure sbtnConsContribClick(Sender: TObject);
    procedure qryPessoaFisicaBeforePost(DataSet: TDataSet);
    procedure dblkOrgPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbedDocumentoExit(Sender: TObject);
    procedure dbedNomeFantasiaExit(Sender: TObject);
    procedure dbedContaCorrenteExit(Sender: TObject);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure edDigBancoExit(Sender: TObject);
    procedure qryBancoAfterScroll(DataSet: TDataSet);
    procedure qryAgenciaAfterScroll(DataSet: TDataSet);
    procedure qryContaBancariaAfterEdit(DataSet: TDataSet);
    //procedure dbrgrpFlgMolestiaGraveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    Procedure PessoaChangeSubtipo(IdPessoa: Integer);
    Procedure PessoaSaveSubtipo(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dbedinscExit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure cmbCidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spbDependenteClick(Sender: TObject);
  //  procedure cmbEstCivChange(Sender: TObject);    //William Santana - 209384/15928 KIN 2062832
    procedure qryPessoaFisicaAfterScroll(DataSet: TDataSet);
    procedure qryOutrasInformsBeforePost(DataSet: TDataSet);
    procedure dblkParamPessoaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spBtnLoginClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure lstDocumentosClick(Sender: TObject);
    procedure edDocNumDocumentoExit(Sender: TObject);
    procedure dbedDocumentoEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edDocNumDocumentoEnter(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure DBEDDDDKeyPress(Sender: TObject; var Key: Char);
    procedure DBEDNUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure qryTelefoneAfterInsert(DataSet: TDataSet);
    procedure BitBtnHistoricoClick(Sender: TObject);
    procedure qryContaBancariaAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure PintarCampos(lEdit: array of TComponent;
  Color: TColor);
    //procedure spbtHistipoIrexcluirClick(Sender: TObject);
    procedure spbtHistipoIrAlterarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ToolbarButtonInsereContatoClick(Sender: TObject);
    procedure ToolbarButtonAlteraContatoClick(Sender: TObject);
    procedure ToolbarButtonExcluiContatoClick(Sender: TObject);
    procedure dbchksolicitacontasalarioClick(Sender: TObject);
    procedure dbchkSalarioProcessadoClick(Sender: TObject);
    procedure BuscarClick(Sender: TObject);  //SOL 184811
    procedure btnBuscarEnderecoClick(Sender: TObject);
    //procedure dbrgrpIsentoIRChange(Sender: TObject);
    procedure wwDBCBIsentoIrrfChange(Sender: TObject);
    procedure dbrgrpIsentoIRClick(Sender: TObject);


    //Início - William Santana - SOL 161550 KIN 1717512
    procedure sbtnSelResponsavelClick(Sender: TObject);
    procedure sbtnCadResponsavelClick(Sender: TObject);

    procedure timepickerDATAChange(Sender: TObject);
    procedure rgSituacaoAtualClick(Sender: TObject);
    procedure qryReprLegalAfterOpen(DataSet: TDataSet);
    procedure qryReprLegalAfterScroll(DataSet: TDataSet);
    procedure qryReprLegalBeforePost(DataSet: TDataSet);
    procedure SelReprLegal;
    function  VerificaReprLegal: Boolean ;
    //Término - William Santana - SOL 161550 KIN 1717512

    //BRUNO AZEVEDO SOL 244852 PPM 626115 - CASO NÃO TENHA ACESSO A ABA, DESABILITAR TAMBÉM OS BOTÕES
    procedure VerificaPermissao();
    procedure dbedAnosKeyPress(Sender: TObject; var Key: Char);
	procedure DBMemoKeyPress(Sender: TObject; var Key: Char);
    procedure dbedNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure wwDBCBIsentoIrrfCloseUp(Sender: TwwDBComboBox;
      Select: Boolean);
    procedure cmbTipoOpIRCloseUp(Sender: TwwDBComboBox; Select: Boolean);     // Andre Imakawa - SIG 47046
    procedure lckupPlanPrevPICloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lckupNomePerfilPICloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryPerfilInvestBeforePost(DataSet: TDataSet);
    procedure qryPerfilInvestAfterPost(DataSet: TDataSet);
    procedure sbtnExcluiDet2Click(Sender: TObject);
    procedure sbtnAltDet2Click(Sender: TObject);
    procedure sbtnInsDet2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure PessoaChangePessoa(IdPessoa: Integer);  override;
    procedure qryReprLegalAfterDelete(DataSet: TDataSet);      //edilaine - SIG33979

  private
    { Private declarations }
     bGridPadrao      : boolean;//Darivaldo Alencar SIG 27871
     iTipoOpcaoIRAnt,
     iTipoOpcaoIR     : Integer;

     bVeioDoMenu,
     bGravaDependente,
     bChamou            : boolean;
	 
     bAteraTipoIr, bExcluiTipoIr, bInsereOpcaoIr       : boolean;

     //edilaine - SIG33979 - inicio
     iMsIdPessJur : integer;
     iMsIdPessoa  : integer;
     //dtDatainicioMolestiaAlterar,
     //dtDataFimMolestiaAlterar  : TDateTime;
     sDatainicioMolestiaAlterar ,
     sDataFimMolestiaAlterar : string;
     //edilaine - SIG33979 - fim

     sdataIR, sOpcaoIR : string;

     sIdPlanoAnterior: string;

     aPlanoDatas : Array of String;

     rOpcao1, rOpcao2, rOpcao3, rOpcao4, rOpcao5, rOpcao6  : real;

     // Variaveis que guardam valores antes de alteracao para recalcular
     // opcoes
     sSexoAntes,
     sTempoServAntes,
     sDataAdmissaoAntes,
     sDataInscricaoAntes,
     sDataNascAntes,
     sNomeContribuicao  : string;

     bPerguntouRubrica : boolean;

     bRecalculaOpcoes : boolean;
     bExibiuPerguntaInscricao : boolean;

     sAcao     : string ; //William Santana Sol 161550 KIN 1717512
     bINSERTVigente, bVeiodoIndicaRec  : Boolean  ; //William Santana Sol 161550 KIN 1717512

     procedure GravaReservasParticipante;

     //edilaine - SIG33979 - inicio
     //function InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia: string ; iIdPessoa:integer) : boolean;  //Michelle Mota - SOL: 264969 - PPM: 1166927

     function VerificaCPF(sDocumento : string):boolean;        overload;
     function VerificaCPF : boolean;  {//Adler }               overload;
     //edilaine - SIG33979 - fim

     function VerificaDocExcecao(sDocumento : string):boolean; //Ádler Souza - SOL N°121503 KTN N°586687
     Function VerificaExistencia():Boolean;
     function  VerificaOpcaodeContrib(sIdPessJur, sIdPlanoPrev, sIdPessoa : string):boolean;

     procedure ExibeSalarioParticipacao;

     function  VerificaElegivel :boolean;
     function  VerificaParticipante: boolean;
     function  VerificaContaBancaria: boolean;
     function  PreparaDependente : boolean;

     function  ExisteContribuicao: boolean;
     function  RecalculaOpcoes : boolean;

	 function DataUltimaAlteracao(idPessoa : Integer) : boolean; // William Moreira da Silva SOL 165677
     // Rotinar para preparar contribuicoes
     procedure CalculaOpcoesContrib(pqryAux : TwwQuery;
                               var sValorBase1, sValorBase2, sValorBase3,
                                   sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                                   sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                                   sAssoc1Op3, sAssoc2Op3, sAssoc3Op3 : string);
     function LerOpcoesContrib(pqryAux : TwwQuery;
                               var sValorBase1, sValorBase2, sValorBase3  : string) : boolean;

     function  GravaContribuicoesParticipante : boolean;
     function  PreparaContribuicoesInscricao(pQryAux : TwwQuery;
                                       psDataInicio : string;
                                       var sMsgErro : string) : boolean;
     function  GravaAlteradorInscricao(sTipo,sMesReferencia,sMesCobranca : string;
                        piNumRecebimento,
                        piIdMotivo, pIdPlanoPrev, pIdContribuicao, pIdPessJur : integer;
                        sDataRef, sDataPrevisao,
                        sDataRecebido, sValor : string; var sMsgErro : string ) : boolean;
     function  GeraDotacaoInicial (qryAux : TwwQuery; var sMsgErro : string) : boolean;
     function  AtualizaHstRubricaxPess(qryAux : TwwQuery; var sMsgErro : string) : boolean;
     procedure MostraContribuicoesInscricao;
     Function AtualizaSitParticipante: Boolean;
     Function BuscaDataInicioInsc(sIdPessoa : String): String;
     Procedure GuardaDatasdeInscricao;
     //procedure OpcaoIR;//Higor Nayde 201318 //TAES - SIG98903
     procedure AtualizaConsultaCidade( piIdEstado : Integer );

     function  VerificaPreferencial: Boolean;
     procedure ValidaCampoNumerico(var Key: char);
     procedure ValidaCampoNumericoDDD(var Key: char);
     procedure HabilitarCampos;
     function TravaAlteracao(idPessoa: Integer):boolean;
     function PossuiVinculo(sIDPessoa: Integer): Boolean;
     procedure TmrSegurancaTimer(Sender: TObject);
     procedure AtvDesDatasContribuicao;//Darivaldo Alencar SIG37689
     function PessoaAposentada: Boolean; //Darivaldo Alencar SIG37689
     function VerificaPeriodoPerfilInvest: Boolean; //William Santana - SIG 55755
     //Darivaldo Alencar SIG 27871 -inicio
    procedure MostraEscondeGridOutrasInformacoes(MostraGrids: Boolean = false);
    procedure MostraGridInformacoesAdicionais(bMostrar: Boolean);
    procedure AlinhaComponente(tpAlinhamento: TAlign);
    procedure FormataEdit(sNmEdit: String);
    function GetSequence(sTabela: String): String;
    procedure AtivaGrid(nmDbGrid: twwdbgrid);
    procedure BuscaOBSR;
    //Darivaldo Alencar SIG 27871 -fim

    //edilaine - SIG33979 - inicio
    procedure PreencheDataMolestiaGrave;
    procedure CarregaDadosPessoais;
    //edilaine - SIG33979 - fim
    function HabilitaEndereco(pIdPessoa: Integer): Boolean;

    function ValidaGetDtIniHistTribIR(pIdPessoa: Integer): Boolean; //WO22785 Leandro

  public
     arq, //SOL 184811
     sidpessjurant,
     sidpessoaant,
     sEstCiv          : String;
     bCpf1, bCpf2: Boolean; //Sol 122621 / Kintana 604231 - Ádler Souza
     iTipo : Integer ; //Renato Visoni Sol 112013 / Kintana 520381
     berroConta : Boolean; //Renato Visoni Sol 112013 / Kintana 520381
     iIdContaBancariaGlobal : string; //Renato Visoni Sol 112013 / Kintana 520381
     bAcao :String;//Renato Visoni Sol 112013 / Kintana 520381
     stateelegpatro   : TDatasetState;
     bTtravarCadastro, bSair, bControleTransacao: Boolean;
     lBanco, lDadosFunc, sdataOpIr: String;
    { Public declarations }
    procedure HabilitaCamposEndereco(Estado : Boolean);

    procedure abreCadElegeivel_ReprLegal(idPessoaElegivel, idPessoaElegPatro, idPessJur: Integer);  //William Santana - SOL 161550 KIN 1717512
  end;

var
  frmCadElegivel: TfrmCadElegivel;
  bInsereParticipante: boolean;
  frmHistMolestiaGrave : TfrmHistMolestiaGrave;   //Fanuel Junior SOL 148773 KINTANA 1063150
  iIdPessoa : String;
  idEnd : Integer;
  bJaexiste, flgCBancariaPref : boolean;


  procedure IniciaEventoInscricao(qryAux:TwwQuery; sIdEvento, psTituloForm :string; pbVeioDoMenu : boolean);


implementation

uses UAutorizacao,  FTelaAut,   DBaseDados,        UMensErro,    UAdmPrev,
     UDataBase,     USistema,   UContribuicaoPrev, UEventos,     FCadOpcoesElegivel,
     UParticipante, FMostraAux, FAguarde,          DAPrev,
     FCadContribParticipante,   FLerOpcoesContribInscricao, FPedeInfAux, UCalcDV,
     fCadDepenBenef, UFuncoesUteis, FConsPessoaGeral, UDiasUteis,

     FcadWebAcesso,
     uConsPart, FParamPessoaLote, fConsEnderGeral, FConsEnderCadElegivel,
  FCadResponsa, FIndicadorRecebedor;


{$R *.DFM}

procedure TfrmCadElegivel.CmeCadastroFind(Sender: TObject);
begin

   bPerguntouRubrica := False;
   bExibiuPerguntaInscricao := False;
   // Desabilitar campos de Num. Dep se parametrizado para calcular automaticamente
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORPARAM FROM PARAMFOLHA '+
              ' WHERE NOMEPARAM = ''FLGNUMDEPIRNUMDEPSALFAM'' ');
      Open;
      if IsEmpty or (FieldbyName('VALORPARAM').AsString <> '1')
      then begin
         dbNDepIRRF.Enabled    := True;
         dbNDepSALFAM.Enabled  := True;
         dbNDepTOTAL.Enabled   := True;
         dbNDepIRRF.Color      := clWindow;
         dbNDepSALFAM.Color    := clWindow;
         dbNDepTOTAL.Color     := clWindow;
      end
      else begin

         dbNDepIRRF.Enabled    := False;
         dbNDepSALFAM.Enabled  := False;
         dbNDepTOTAL.Enabled   := False;
         dbNDepIRRF.Color      := clInactiveBorder;
         dbNDepSALFAM.Color    := clInactiveBorder;
         dbNDepTOTAL.Color     := clInactiveBorder;
      end;
   end;

   //Andre Imakawa - SIG 67018 - Inicio
   iMsIdPessoa  := StrToIntDef(MontaSelect.ValoresChave[0], -1);  //edilaine - SIG33979
   iMsIdPessJur := StrToIntDef(MontaSelect.ValoresChave[2], -1);  //edilaine - SIG33979
   //Andre Imakawa - SIG 67018 - Fim

   try
    inherited;
   except
   end;
   
   if not MontaSelect.RetornouValor then Exit; 

   if not bVeioDoMenu
   then begin
      dbedDocumento.Modified := True;
      dbedDocumentoExit(Sender);
   end;

//   If qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger = 0 Then
   if (wwDBCBIsentoIrrf.ItemIndex <> 2)then
   begin
     dbrgrpMolestiaGrave.Visible := False;
     //dbdtMolestiaGrave.Text      := '';         //edilaine - SIG33979
   end;

   //Andre Imakawa - SIG 67018 - Inicio
   // Removido desse trecho devido a utilização do campo iMsIdPessJur
   {
   iMsIdPessoa  := StrToIntDef(MontaSelect.ValoresChave[0], -1);  //edilaine - SIG33979
   iMsIdPessJur := StrToIntDef(MontaSelect.ValoresChave[2], -1);  //edilaine - SIG33979
   }
   //Andre Imakawa - SIG 67018 - Fim

   if not bVeioDoMenu then
   begin
      if not bExibiuPerguntaInscricao
      then begin
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT PL.NOME AS PLANO, SP.DESCRICAO AS SITUACAO, PP.INSCRICAONUMERO, PP.INSCRICAODATA '+
                    ' FROM   PLANPREV PL, PARTPREVPLAN PP, SITPART SP '+
                    ' WHERE  PP.IDPESSOA      = '+OraNumero(MontaSelect.ValoresChave[0])+
                    ' AND    PP.IDSITPART     = SP.IDSITPART '+
                    ' AND    PP.IDPLANOPREV   = PL.IDPLANOPREV '+
                    ' AND    PP.FLGDESATIVADO = 0 ');
            Open;
            if not IsEmpty
            then begin
               bExibiuPerguntaInscricao := True;
               if MsgDlg('O participante já está inscrito no plano '+FieldByName('Plano').AsString+' desde '+
                         FieldByName('InscricaoData').AsString+' com a inscrição nº '+FieldByName('InscricaoNumero').AsString+
                         ' e sua situação atual neste plano é '+FieldByName('Situacao').AsString+'. '+#13+
                         'Deseja incluir o participante em um novo plano previdenciário ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo
               then begin
                  MsgDlg('Para retornar o participante para o mesmo plano, utilize o evento Reinscrição do Participante.','Informação',mtInformation,[mbOk],0); 
                  sbtnProcurar.Click;
               end;
            end;
         end;
      end;
   end;

  
  // Abre qry que mostra as patros para qual o participante pode ser "Cedido". (Funcef)
  If MontaSelect.RetornouValor Then
  Begin
    qryCedidoPatro.Close;
    qryCedidoPatro.ParamByName('IDPATRO').AsString :=  MontaSelect.ValoresChave[2];
    qryCedidoPatro.Open;
  End;

  spBtnLogin.Enabled := (StrToIntDef(qry.fieldByName('IDPESSOA').asString, -1) <> -1);

  //edilaine - SIG33979 - inicio
  {codigo passado para função}
  CarregaDadosPessoais;
  //edilaine - SIG33979 - fim

  SelReprLegal;  //William Santana - SOL 161550 KIN 1717512
end;

procedure TfrmCadElegivel.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsContaBancaria
   then begin
      if not qryContaBancaria.IsEmpty
      then begin
         qryBanco.Locate('IDPESSOA',     qryContaBancaria.FieldByName('IDBANCO').AsInteger,[]);

         qryAgencia.Close;
         qryAgencia.ParamByName('pIdBanco').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
         qryAgencia.Open;

         qryAgencia.Locate('NUMAGENCIA', qryContaBancaria.FieldByName('NUMAGENCIA').AsString,[]);

         dblkpcmbBanco.Text   := qryBanco.FieldByName('BANCO').AsString;
         dblkpcmbAgencia.Text := qryAgencia.FieldByName('AGENCIA').AsString;
         edDigBanco.Text      := qryContaBancaria.FieldByName('NumBanco').AsString;
         edDigAgencia.Text    := qryContaBancaria.FieldByName('NumAgencia').AsString;

         //Brunno Mattos - SOL 153260 - KTN 1167636 Inicio
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' SELECT IDTITULAR FROM DEPENTIT ' +
                        ' WHERE  IDPESSOA = ' + qry.FieldByname('IDPESSOA').AsString);
         qryAux.Open;
         qryContaBancaria.FieldByname('IDTITULAR').Value := qryAux.FieldByName('IDTITULAR').AsInteger;
         //Brunno Mattos - SOL 153260 - KTN 1167636 Fim
      end;
   end
   else if pgctrlDetalhe.ActivePage = tbsOutrasInforms       
        then begin
           qryParamPessoa.Locate('IDPARAM', qryOutrasInforms.FieldByName('IDPARAM').AsInteger,[]);
           dblkParamPessoa.Text := qryOutrasInforms.FieldByName('DESCRICAO').AsString;
           edValida.Text        := qryOutrasInforms.FieldByName('VALIDACAO').AsString;
           dblkParamPessoa.Enabled := False;     // não permitir alteração de código
        end
   else if pgctrlDetalhe.ActivePage = tbshtFundacao
        then begin
           dblkpcmbFundacao.Text := qryFundacoes.FieldByname('NOME').AsString;
        end

  //Início - William Santana SOL 161550 KIN 1717512
  else if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
   qryReprLegal.Edit;
  end
  //Término - William Santana SOL 161550 KIN 1717512
  //Início - William Santana - SIG 55755
   else if pgctrlDetalhe.ActivePage = tbsPerfilInvest then
  begin   
    edtPlanoContPI.Text := qryNomePI.FieldByName('PlanContabil').AsString;    
    qryPerfilInvest.Edit;
  end;
  //Fim - William Santana - SIG 55755

end;

procedure IniciaEventoInscricao(qryAux : TwwQuery; sIdEvento, psTituloForm :string;
                                pbVeioDoMenu : boolean);
begin
  if sIdEvento = ''
  then begin
     sIdEvento := '-1';
     sIdEventoGerador := '-1';
     sFlgInterno := 'XX';
  end
  else begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                    ' WHERE  IDEVENTOGERADOR = ' + sIdEvento);
     qryAux.Open;

     

     sIdEventoGerador    := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
     sFlgInterno         := qryAux.FieldByName('FLGINTERNO').AsString;
  end;

  AbrirForm(frmCadElegivel, TfrmCadElegivel, False);
  frmCadElegivel.bVeioDoMenu := pbVeioDoMenu;
  frmCadElegivel.Caption     := psTituloForm;

  frmCadElegivel.spbDependente.Visible := pbVeioDoMenu;

  frmCadElegivel.bExibiuPerguntaInscricao := False;

  with frmCadElegivel do
  begin
     if pbVeioDoMenu
     then begin
        HelpContext := 160151; 
        qrySitFunc.Close;
        qrySitFunc.SQL.Clear;
        qrySitFunc.SQL.Add(' SELECT IDSITFUNC,DESCRICAO FROM SITFUNC ');

        if prmMostraSitGeral
        then qrySitFunc.SQL.Add(' WHERE FLGUSO IN (''P'', ''G'') ')
        else qrySitFunc.SQL.Add(' WHERE FLGUSO = ''P''           ');

        qrySitFunc.SQL.Add(' ORDER BY DESCRICAO ');
        qrySitFunc.Open;

        qrySitPart.Close;
        qrySitPart.SQL.Clear;
        qrySitPart.SQL.Add(' SELECT IDSITPART,DESCRICAO, FLGINTERNO '+
                           ' FROM SITPART '+
                           ' ORDER BY DESCRICAO ');
        qrySitPart.Open;

        qrySitPlanoPrev.Close;
        qrySitPlanoPrev.SQL.Clear;
        qrySitPlanoPrev.SQL.Add(' SELECT IDSITPLANOPREV, DESCRICAO '+
                                ' FROM SITPLANOPREV                '+
                                ' ORDER BY DESCRICAO ');
        qrySitPlanoPrev.Open;

         // SOL 116.634 / 549.962 - Renato Visoni
        //dblkpcmbSitPart.Enabled  := False;
        //dblkpcmbSitPlanoPrev.Enabled := False;
        bInsereParticipante := False;
     end
     else begin
        HelpContext := 160005; 
        qrySitFunc.Close;
        qrySitFunc.SQL.Clear;
        qrySitFunc.SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, SIT.TIPOSIT '+
                           ' FROM   SITFUNC SIT , EVENTOXSITFUNC E  '+
                           ' WHERE  SIT.IDSITFUNC  = E.IDSITFUNC    ');

        if prmMostraSitGeral
        then qrySitFunc.SQL.Add(' AND   SIT.FLGUSO IN (''P'', ''G'') ')
        else qrySitFunc.SQL.Add(' AND   SIT.FLGUSO = ''P''           ');

        qrySitFunc.SQL.Add(' AND    E.IDEVENTOGERADOR  = '+sIdEventoGerador+
                           ' ORDER BY SIT.DESCRICAO  ');
        qrySitFunc.Open;

        qrySitPart.Close;
        qrySitPart.SQL.Clear;
        qrySitPart.SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO '+
                           ' FROM   SITPART SIT , EVENTOXSITPART E  '+
                           ' WHERE  SIT.IDSITPART = E.IDSITPART  '+
                           ' AND    E.IDEVENTOGERADOR = '+sIdEventoGerador+
                           ' ORDER BY SIT.DESCRICAO ');
        qrySitPart.Open;

        qrySitPlanoPrev.Close;
        qrySitPlanoPrev.SQL.Clear;
        qrySitPlanoPrev.SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO '+
                                ' FROM   SITPLANOPREV SIT , EVENTOXSITPLAPREV E '+
                                ' WHERE  SIT.IDSITPLANOPREV = E.IDSITPLANOPREV '+
                                ' AND    E.IDEVENTOGERADOR = '+sIdEventoGerador+
                                ' ORDER BY SIT.DESCRICAO ');
        qrySitPlanoPrev.Open;

        dblkpcmbSitPatro.Enabled := True;
        dblkpcmbSitPart.Enabled  := True;
        dblkpcmbSitPlanoPrev.Enabled := True;
     end;
     qryVinculaFunc.Close;
     qryVinculaFunc.Open;
  end;
end;
procedure TfrmCadElegivel.CmeDetalheAtualizaBotoes(Sender: TObject);
//Darivaldo Alencar SIG 27871 -inicio
var  lTemReg : Boolean;
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

  AutorizarForm(afSoDesabilitar);
  //Darivaldo Alencar SIG 27871 -fim

   // Se veio do menu e está na pagina dos planos previdenciarios,
   // nao deixar nem apagar , nem inserir.
   if pgctrlDetalhe.ActivePage = tbsPlanosPrev then
   begin
     sbtnInsDet.Visible       := not(bVeioDoMenu);  // 26673
     sbtnExcluiDet.Visible    := not(bVeioDoMenu);  // 26673  //sol 233665
     sbtnConsContrib.Visible := True;
//   sbtnExcluiDet.Visible := false;
   end
   else
    sbtnConsContrib.Visible := False;

    //Sadi Freire   SOL 233665
    if  pgctrlDetalhe .ActivePage <> tbsPlanosPrev then
    begin
    sbtnExcluiDet.Visible := true;
    end
end; // CmeDetalhe.AtualizaBotoes(Self) override

procedure TfrmCadElegivel.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   if not PatroPermiteAlterarDados( qryElegPatro.FieldByName('IDPESSJUR').AsInteger,
                                   qryElegPatro.FieldByName('IDPESSOA').AsInteger
                                  ) then
   begin
      sbtnAlterar.Visible := False;
      sbtnApagar.Visible  := False;
   end
   else
   begin
      sbtnAlterar.Visible := True;
      sbtnApagar.Visible  := True;
   end;

   sbtnApagar.Visible     := (qryPlanosPrev.Active) and not(qryPlanosPrev.IsEmpty);
end; // AtualizaBotoes override



// provisorio
procedure TfrmCadElegivel.PessoaChangeSubtipo(IdPessoa: Integer);
begin
  //abrir outras querys
  if (qryElegPatro.Active)        And
     (qryElegPatro.CachedUpdates) Then
    qryElegPatro.CancelUpdates;

  qryElegPatro.ParamByName('IDPESSOA').Value  := IdPessoa;

  { Somente usar MontaSelect se tiver editando }
  If ( Not (CmeCadastro.Operacao in [opInserir, opVazio]) ) Then
    qryElegPatro.ParamByName('IDPESSJUR').Value := iMsIdPessJur {MontaSelect.ValoresChave[2]}  //edilaine - SIG33979
  Else
    qryElegPatro.ParamByName('IDPESSJUR').Value := -1;


  if bVeioDoMenu Then
    qryElegPatro.ParamByName('FLGVEIODOMENU').Value := 1
  else
    qryElegPatro.ParamByName('FLGVEIODOMENU').Value := 0;
  
  //CPrev - 27604 - Inicio

  // Daniel Begnami SOL: 95029 KT: 410579
  if (CmeCadastro.Operacao <> opInserir) then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT EV.IDCARGOEXT');
    qryAux.SQL.Add('FROM EVOLFUNCPREV EV');
    //edilaine - SIG33979 - inicio
    //qryAux.SQL.Add('WHERE (EV.IDPESSOA   = ' + MontaSelect.ValoresChave[1] + ')');
    //qryAux.SQL.Add('  AND (EV.IDPESSJUR  = ' + MontaSelect.ValoresChave[2] + ')');
    qryAux.SQL.Add('WHERE (EV.IDPESSOA   = ' + IntToStr(iMsIdPessoa) + ')');
    qryAux.SQL.Add('  AND (EV.IDPESSJUR  = ' + IntToStr(iMsIdPessJur) + ')');
    //edilaine - SIG33979 - fim
    qryAux.SQL.Add('  AND (EV.IDCARGOEXT IS NOT NULL)');
    qryAux.SQL.Add('  AND (EV.MODOFUNCAO = ''EF'')');
    qryAux.SQL.Add('  AND (EV.DATAINICIO = (SELECT MAX(EX.DATAINICIO)');
    qryAux.SQL.Add('                        FROM EVOLFUNCPREV EX');
    qryAux.SQL.Add('                        WHERE (EX.IDPESSOA   = EV.IDPESSOA)');
    qryAux.SQL.Add('                          AND (EX.IDPESSJUR  = EV.IDPESSJUR)');
    qryAux.SQL.Add('                          AND (EX.IDCARGOEXT IS NOT NULL)');
    qryAux.SQL.Add('                          AND (EX.MODOFUNCAO = ''EF'') ))');
    qryAux.Open;
  end;
  // FIM Daniel Begnami SOL: 95029 KT: 410579
  //CPrev - 27604 - Fim
  
  If (bVeioDoMenu)                       And
     (CmeCadastro.Operacao <> opInserir) and
     ((not qryAux.FieldByName('IDCARGOEXT').IsNull) OR
      (not qryAux.IsEmpty)) Then
  Begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT 1');
    qryAux.SQL.Add('FROM EVOLFUNCPREV');
    //edilaine - SIG33979 - inicio
    //qryAux.SQL.Add('WHERE IDPESSOA  = ' + MontaSelect.ValoresChave[1]);
    //qryAux.SQL.Add('  AND IDPESSJUR = ' + MontaSelect.ValoresChave[2]);
    qryAux.SQL.Add('WHERE IDPESSOA   = ' + IntToStr(iMsIdPessoa));
    qryAux.SQL.Add('  AND IDPESSJUR  = ' + IntToStr(iMsIdPessJur));
    //edilaine - SIG33979 - fim

    qryAux.Open;

    //William Moreira da Silva SOL 165677 alteração necessaria para termino do SOL 165677
     If Not(qryAux.IsEmpty) and (dtmBaseDados.dbBaseDados.InTransaction) Then
    Begin
      frmAguarde.Mostra('Atualizando Histórico Funcional...');

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE ELEGPATRO EL ');
      qryAux.SQL.Add('SET EL.IDCARGOEXT = (SELECT EV.IDCARGOEXT ');
      qryAux.SQL.Add('                     FROM EVOLFUNCPREV EV ');
      qryAux.SQL.Add('                     WHERE EV.IDPESSOA   = EL.IDPESSOA ');
      qryAux.SQL.Add('                       AND EV.IDPESSJUR  = EL.IDPESSJUR ');
      qryAux.SQL.Add('                       AND EV.IDCARGOEXT IS NOT NULL ');
      qryAux.SQL.Add('                       AND EV.MODOFUNCAO = ''EF'' ');
      qryAux.SQL.Add('                       AND EV.DATAINICIO = (SELECT MAX(EX.DATAINICIO) ');
      qryAux.SQL.Add('                                            FROM EVOLFUNCPREV EX ');
      qryAux.SQL.Add('                                            WHERE EX.IDPESSOA   = EV.IDPESSOA ');
      qryAux.SQL.Add('                                              AND EX.IDPESSJUR  = EV.IDPESSJUR ');
      qryAux.SQL.Add('                                              AND EX.IDCARGOEXT IS NOT NULL ');
      qryAux.SQL.Add('                                              AND EX.MODOFUNCAO = ''EF'' )) ');

      //edilaine - SIG33979 - fim
      //qryAux.SQL.Add('WHERE EL.IDPESSOA  = ' + MontaSelect.ValoresChave[1] );
      //qryAux.SQL.Add('  AND EL.IDPESSJUR = ' + MontaSelect.ValoresChave[2] );
      qryAux.SQL.Add('WHERE EL.IDPESSOA   = ' + IntToStr(iMsIdPessoa) );
      qryAux.SQL.Add('  AND EL.IDPESSJUR  = ' + IntToStr(iMsIdPessJur) );
      //edilaine - SIG33979 - fim

      qryAux.SQL.Add('  AND EXISTS (SELECT 1 ');
      qryAux.SQL.Add('              FROM EVOLFUNCPREV EV ');
      qryAux.SQL.Add('              WHERE EV.IDPESSOA   = EL.IDPESSOA ');
      qryAux.SQL.Add('                AND EV.IDPESSJUR  = EL.IDPESSJUR ');
      qryAux.SQL.Add('                AND EV.IDCARGOEXT IS NOT NULL ');
      qryAux.SQL.Add('                AND EV.IDCARGOEXT <> NVL(EL.IDCARGOEXT,0)) '); 

      Try
        qryAux.ExecSql;
      Except
        frmAguarde.Apaga; 
        MsgDlg('Erro ao atualizar histórico funcional [cargo].','Erro',mtError,[mbOk,mbHelp],0);
      End;

      //edilaine - SIG33979 - inicio
      {qryAux.Close;//SOL 165801 KINTANA 1242255 William Moreira da Silva
      qryAux.SQL.Clear;
      qryAux.SQL.Add('COMMIT');
      Try
        qryAux.ExecSql;
      Except
        frmAguarde.Apaga;
        MsgDlg('Erro ao atualizar histórico funcional [função].','Erro',mtError,[mbOk,mbHelp],0);
      End;//SOL 165801 KINTANA 1242255 William Moreira da Silva
      }//edilaine - SIG33979 - fim

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE ELEGPATRO EL');
      qryAux.SQL.Add('SET EL.IDFUNCAOEXT   = (SELECT EV.IDFUNCAO ');
      qryAux.SQL.Add('                        FROM EVOLFUNCPREV EV ');
      qryAux.SQL.Add('                        WHERE EV.IDPESSOA   = EL.IDPESSOA ');
      qryAux.SQL.Add('                          AND EV.IDPESSJUR  = EL.IDPESSJUR ');
      qryAux.SQL.Add('                          AND EV.IDFUNCAO   IS NOT NULL ');
      qryAux.SQL.Add('                          AND EV.DATAFINAL  IS NULL ');
      qryAux.SQL.Add('                          AND EV.MODOFUNCAO = ''EF'' ');
      qryAux.SQL.Add('                          AND NVL(EV.PERCFUNCAO,0) > 0 ');
      qryAux.SQL.Add('                          AND EV.DATAINICIO = (SELECT MAX(EX.DATAINICIO) ');
      qryAux.SQL.Add('                                               FROM EVOLFUNCPREV EX ');
      qryAux.SQL.Add('                                               WHERE EX.IDPESSOA   = EV.IDPESSOA ');
      qryAux.SQL.Add('                                                 AND EX.IDPESSJUR  = EV.IDPESSJUR ');
      qryAux.SQL.Add('                                                 AND EX.MODOFUNCAO = ''EF'' ');
      qryAux.SQL.Add('                                                 AND EX.DATAFINAL IS NULL ');
      qryAux.SQL.Add('                                                 AND NVL(EX.PERCFUNCAO,0) > 0 ');
      qryAux.SQL.Add('                                                 AND EX.IDFUNCAO IS NOT NULL)) ');
      //edilaine - SIG33979 - inicio
      //qryAux.SQL.Add('WHERE EL.IDPESSOA  = ' + MontaSelect.ValoresChave[1] );
      //qryAux.SQL.Add('  AND EL.IDPESSJUR = ' + MontaSelect.ValoresChave[2] );
      qryAux.SQL.Add('WHERE EL.IDPESSOA   = ' + IntToStr(iMsIdPessoa) );
      qryAux.SQL.Add('  AND EL.IDPESSJUR  = ' + IntToStr(iMsIdPessJur) );
      //edilaine - SIG33979 - fim

      qryAux.SQL.Add(' AND EXISTS (SELECT 1 ');
      qryAux.SQL.Add('             FROM EVOLFUNCPREV EV ');
      qryAux.SQL.Add('             WHERE EV.IDPESSOA = EL.IDPESSOA ');
      qryAux.SQL.Add('             AND EV.IDPESSJUR  = EL.IDPESSJUR ');
      qryAux.SQL.Add('             AND EV.IDFUNCAO   IS NOT NULL ');
      qryAux.SQL.Add('             AND EV.IDFUNCAO   <> NVL(EL.IDFUNCAOEXT,0)) '); 
      Try
        qryAux.ExecSql;
      Except
        frmAguarde.Apaga; 
        MsgDlg('Erro ao atualizar histórico funcional [função].','Erro',mtError,[mbOk,mbHelp],0);
      End;

      //edilaine - SIG33979 - inicio
      {qryAux.Close;//SOL 165801 KINTANA 1242255 William Moreira da Silva
      qryAux.SQL.Clear;
      qryAux.SQL.Add('COMMIT');
      Try
        qryAux.ExecSql;
      Except
        frmAguarde.Apaga;
        MsgDlg('Erro ao atualizar histórico funcional [função].','Erro',mtError,[mbOk,mbHelp],0);
      End;//SOL 165801 KINTANA 1242255 William Moreira da Silva
      }//edilaine - SIG33979 - fim

      frmAguarde.Apaga;
    End;
  End;

  qryElegPatro.Close;
  qryElegPatro.Open;
  qryElegPatro.CancelUpdates;

  if (qryPlanosPrev.Active)        And
     (qryPlanosPrev.CachedUpdates) Then
    qryPlanosPrev.CancelUpdates;

  qryPlanosPrev.ParamByName('IDPESSOA').Value := IdPessoa;
  qryPlanosPrev.Close;
  qryPlanosPrev.Open;
  qryPlanosPrev.CancelUpdates;

  if (qryContaBancaria.Active)        And
     (qryContaBancaria.CachedUpdates) Then
    qryContaBancaria.CancelUpdates;

  qryContaBancaria.ParamByName('IDPESSOA').Value := IdPessoa;
  qryContaBancaria.Close;
  qryContaBancaria.Open;
  qryContaBancaria.CancelUpdates;

  if qryOutrasInforms.Active        And
     qryOutrasInforms.CachedUpdates Then
    qryOutrasInforms.CancelUpdates;

  qryOutrasInforms.ParamByName('IDPESSOA').Value := IdPessoa;
  qryOutrasInforms.Close;
  qryOutrasInforms.Open;
  qryOutrasInforms.CancelUpdates;


  //Darivaldo Alencar SIG 27871 -inicio
   if qryOcupacao.Active        And
     qryOcupacao.CachedUpdates Then
    qryOcupacao.CancelUpdates;
    
   qryOcupacao.ParamByName('IDPESSOA').asInteger := IdPessoa;
   qryOcupacao.Close;
   qryOcupacao.Open;
   qryOcupacao.CancelUpdates;
   //Darivaldo Alencar SIG 27871 -fim

  if qryDepen.Active        And
     qryDepen.CachedUpdates Then
    qryDepen.CancelUpdates;

  qryDepen.ParamByName('IDPESSOA').Value := IdPessoa;
  qryDepen.Close;
  qryDepen.Open;
  qryDepen.CancelUpdates;

  if qryDepenTit.Active        And
     qryDepenTit.CachedUpdates Then
    qryDepenTit.CancelUpdates;

  qryDepenTit.ParamByName('IDPESSOA').Value := IdPessoa;
  qryDepenTit.Close;
  qryDepenTit.Open;
  qryDepenTit.CancelUpdates;

  if qryBenefPlanoPart.Active        And
     qryBenefPlanoPart.CachedUpdates Then
    qryBenefPlanoPart.CancelUpdates;

  qryBenefPlanoPart.ParamByName('IDPESSOA').Value := IdPessoa;
  qryBenefPlanoPart.Close;
  qryBenefPlanoPart.Open;
  qryBenefPlanoPart.CancelUpdates;

  if qryfundacoes.Active        And
     qryfundacoes.CachedUpdates Then
    qryfundacoes.CancelUpdates;

  qryfundacoes.ParamByName('IDPESSOA').Value := IdPessoa;
  qryfundacoes.Close;
  qryfundacoes.Open;
  qryfundacoes.CancelUpdates;

  // Abrir querys para preparo de contribuicoes
  // Estas tabelas tem que ser abertas em branco (por isto os parametros sao -1)
  // pois só serao usadas no caso de inclusao do participante no plano
  // e se o usuario inclui-lo e depois, na mesma transacao, exclui-lo
  // o sistema apagara estas tabelas. Logo, se elas possuirem dados
  // cadastrados em outra transacao, irá exclui-los também
  if qryEventosPrev.Active        And
     qryEventosPrev.CachedUpdates Then
    qryEventosPrev.CancelUpdates;

  qryEventosPrev.ParamByName('IDEVENTOSPREV').AsInteger := -1;
  qryEventosPrev.Close;
  qryEventosPrev.Open;

  qryHstContEventosPR.Close;
  qryHstContEventosPR.ParamByName('IdAssociacao').AsInteger := -1;
  qryHstContEventosPR.ParamByName('IdEventosPrev').AsInteger := -1;
  qryHstContEventosPR.Open;

  qryContribPrevPartP.Close;
  qryContribPrevPartP.ParamByName('IdPessoa').AsInteger    := -1;
  qryContribPrevPartP.ParamByName('IdPessJur').AsInteger   := -1;
  qryContribPrevPartP.ParamByName('IdPlanoPrev').AsInteger := -1;
  qryContribPrevPartP.ParamByName('SeqProposta').AsInteger := -1;
  qryContribPrevPartP.Open;

  qryHstRubricaxPess.Close;
  qryHstRubricaxPess.ParamByName('IdPessoa').AsInteger     := -1;
  qryHstRubricaxPess.ParamByName('IdPlanoPrev').AsInteger  := -1;
  qryHstRubricaxPess.ParamByName('MesReferencia').AsString := '0000/00';
  qryHstRubricaxPess.ParamByName('IdRubrica').AsInteger    := -1;
  qryHstRubricaxPess.Open;

  qryCtrlInterface.Close;
  qryCtrlInterface.ParamByName('IdLote').AsInteger         := -1;
  qryCtrlInterface.Open;

  qryHstContribPrev.Close;
  qryHstContribPrev.ParamByName('IdPessoa').AsInteger     := -1;
  qryHstContribPrev.ParamByName('IdPessJur').AsInteger    := -1;
  qryHstContribPrev.ParamByName('IdPlanoPrev').AsInteger  := -1;
  qryHstContribPrev.ParamByName('SeqProposta').AsInteger  := -1;

  qryHstContribPrev.ParamByName('MesReferencia').AsString := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                                                             Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);

  qryHstContribPrev.Open;


  qryHstRubSal.Close;
  qryHstRubSal.ParamByName('IdPessoa').AsInteger     := -1;
  qryHstRubSal.ParamByName('IdPessJur').AsInteger    := -1;
  qryHstRubSal.Open;

  qryHstAtrasoContrib.Close;
  qryHstAtrasoContrib.ParamByName('NumRecebimento').AsInteger     := -1;
  qryHstAtrasoContrib.Open;

  qryHistFuncPrev.Close;
  qryHistFuncPrev.ParamByName('IdPessoa').AsInteger     := -1;
  qryHistFuncPrev.ParamByName('IdPessJur').AsInteger    := -1;
  qryHistFuncPrev.Open;

  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('  SELECT EV.IDFUNCAO, F.CODIGO, F.TITULO,                             '+
            '        DECODE(EV.MODOFUNCAO, ''EF'', ''EFETIVA'',                   '+
            '                              ''AS'', ''ASSEGURADA''       ,         '+
            '                              ''ES'', ''EVENTUAL/SUBSTITUIÇÃO'' ,    '+
            '                              ''DP'', ''DESIGNAÇÃO POR PRAZO''  ,    '+
            '                              ''FA'', ''FACULTATIVA''          ,     '+
            '                              ''BF'', ''BOLSA DE FUNÇÃO''       ,    '+
            '                              ''NE'', ''NÃO EFETIVA'',               '+
            '                              ''ET'', ''ESTRATÉGICA'') AS MODO,      '+
            '        G.CODIGO AS CODGRUPO                                         '+
            ' FROM   ELEGPATRO EL, EVOLFUNCPREV EV, CARGOEXT F, GRUPOFUNC G       '+
            ' WHERE  EL.IDPESSOA = '+IntToStr(IdPessoa)                            +
            ' AND    EV.IDPESSOA = EL.IDPESSOA                                    '+
            ' AND    EV.IDPESSJUR = EL.IDPESSJUR                                  '+
            ' AND    EV.IDFUNCAO = EL.IDFUNCAOEXT                                 '+
            ' AND    F.IDCARGOEXT = EV.IDFUNCAO                                   '+
            ' AND    EV.DATAINICIO = ( SELECT MAX(DATAINICIO) FROM EVOLFUNCPREV   '+
            '                          WHERE IDPESSOA = '+IntToStr(IdPessoa)       +
            '                          AND   IDFUNCAO IS NOT NULL )               ');
    Open;

    If IsEmpty Then
    begin
      edFuncaoAtual.Text       := '';
      edCodFuncaoAtual.Text    := '';
      edGrupoFuncaoAtual.Text  := '';
      edModoFuncaoAtual.Text   := '';
    end
    else
    begin
      edFuncaoAtual.Text       := FieldByName('TITULO').AsString;
      edCodFuncaoAtual.Text    := FieldByName('CODIGO').AsString;
      edGrupoFuncaoAtual.Text  := FieldByName('CODGRUPO').AsString;
      edModoFuncaoAtual.Text   := FieldByName('MODO').AsString;
    end;
  end;


  // SOL 241920 PPM 567184
  qrybenef.close;
  qrybenef.paramByName('IdPessoa').asInteger :=  IdPessoa;
  qrybenef.paramByName('IdTitular').asInteger :=  IdPessoa;
  //edilaine - SIG33979 - inicio
  If ( Not (CmeCadastro.Operacao in [opInserir, opVazio]) ) Then
     qrybenef.paramByName('IDPESSJUR').asInteger := iMsIdPessJur  {strtoInt(MontaSelect.ValoresChave[2])}  
  else
     qrybenef.paramByName('IDPESSJUR').asInteger := -1;
  //edilaine - SIG33979 - fim
  qrybenef.open;
  // SOL 241920 PPM 567184

  //Início - William Santana SIG 55755
  qryPerfilInvest.Close;
  qryPerfilInvest.ParamByName('IDPESSOA').AsInteger := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
  qryPerfilInvest.ParamByName('IDPESSJUR').AsInteger := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
  qryPerfilInvest.Open;

  qryPerfilAux.Close;
  qryPerfilAux.ParamByName('IDPESSOA').AsInteger := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
  qryPerfilAux.ParamByName('IDPESSJUR').AsInteger := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
  qryPerfilAux.Open; 
  //Término - William Santana SIG 55755

end;

function TfrmCadElegivel.RecalculaOpcoes : boolean;
var
    rValorOpcao1, rValorOpcao2, rValorOpcao3 : double;
    sSQL, sMesRef,
    sIdRegraCalcOp1, sIdRegraCalcOp2, sIdRegraCalcOp3,
    sNomeOp1, sNomeOp2, sNomeOp3,
    sValorBase1, sValorBase2, sValorBase3,

    sUltMesPreparo,
    sPartReinscrito,sDtInicioInsc,  sPartResgPoupanca,
    sTempoServAnterior, sTempoNaoCreditado,
    sInscricaoDataFund, sValorProvento,
    sInscricaoData, sDataNasc, sIdPlanoPrev,
    sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
    sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
    sAssoc1Op3, sAssoc2Op3, sAssoc3Op3  : string;
    bPartResgPoupanca,
    bErro : boolean;
begin
  Result := False;
  frmMostraAux.memResult.Lines.Clear;

  // 1o. OPCOES DO ELEGIVEL - ELEGPATRO (VALORBASE1,VALORBASE2,VALORBASE3)
  if qryElegPatro.IsEmpty
  then begin
    Result := True;
    Exit;
  end;

  frmAguarde.Mostra('Recalculando opções do participante');

  if qryPlanosPrev.IsEmpty Then
  begin
     sInscricaoData    := FormatDateTime('dd/mm/yyyy', Date);
     sDtInicioInsc     := FormatDateTime('dd/mm/yyyy', Date);

     sIdPlanoPrev      := '0';
     sPartReinscrito   := '0';
     sPartResgPoupanca := '0';
     sValorProvento    := '0';
     sUltMesPreparo    := '';
  end
  else
  begin
    sInscricaoData := qryPlanosPrev.FieldByName('InscricaoData').AsString;
    sDtInicioInsc  := qryPlanosPrev.FieldByName('DtInicioInsc').AsString;
    sIdPlanoPrev   := qryPlanosPrev.FieldByName('IdPlanoPrev').AsString;

    if qryPlanosPrev.FieldByName('InscricaoData').AsString <> qryPlanosPrev.FieldByName('DtInicioInsc').AsString Then
      sPartReinscrito := '1'
    else
      sPartReinscrito := '0';

    If (Trim(qryPlanosPrev.FieldByName('SalParticipacao').AsString) <> '') And
       (qryPlanosPrev.FieldByName('SalParticipacao').AsFloat   > 0)        Then
      sValorProvento  := qryPlanosPrev.FieldByName('SalParticipacao').AsString
    Else
    Begin
      sMesRef         := Copy(sDtInicioInsc,7,4)+'/'+Copy(sDtInicioInsc,4,2);
      sValorProvento  := CalcSALPART(qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                                     qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
                                     sMesRef,qryAux2);

      if Trim(sValorProvento) = '' then
        sValorProvento := '0';
    end;

    bPartResgPoupanca := PartResgPoupanca(qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                                          qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,
                                          qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
                                          qryPlanosPrev.FieldByName('SeqProposta').AsInteger,
                                          qryAux);

    if bPartResgPoupanca Then
      sPartResgPoupanca := '1'
    else
      sPartResgPoupanca := '0';

    if sPartReinscrito = '1' Then
      sMesRef           := Copy(sInscricaoData,7,4)+'/'+Copy(sInscricaoData,4,2)
    else
      sMesRef           := Copy(sDtInicioInsc,7,4)+'/'+Copy(sDtInicioInsc,4,2);

    sUltMesPreparo      := CalcUltMesContribuicao(qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                                                  qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,
                                                  qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
                                                  qryPlanosPrev.FieldByName('SeqProposta').AsInteger, -1,
                                                  sMesRef,
                                                  qryAux);
  end;

  If (Trim(sValorProvento) = '')  Or
     (Trim(sValorProvento) = '0') Then
  begin
    frmAguarde.Apaga;

    if MsgDlg(' O Salário de Participação do Participante na data da inscrição não foi encontrado. '+
               ' Deseja informar um salário  ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrNo Then
    begin
      if MsgDlg(' Deseja continuar o recálculo ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrNo Then
        Exit;
    end
    else
    begin
      PedeInfAux('Informe o Salário do Participante no Mês da Inscrição '+sMesRef,
                 'Salário do Participante','', 1, sValorProvento);

      If Trim(sValorProvento) = '' Then
      begin
        MsgDlg('Salário não informado. ','Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
      End
      Else
      Begin
        try
          sValorProvento := ClienteNumero(sValorProvento);
          StrToFloat(sValorProvento);
          sValorProvento := OraNumero(sValorProvento);
        except
          MsgDlg('Salário Informado Inválido. ','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
        end;
      end;
    end;
  end;

  if Trim(dbdtNasc.Text) = '' Then
    sDataNasc := FormatDateTime('dd/mm/yyyy', Date)
  else
    sDataNasc := Trim(dbdtNasc.Text);

  sInscricaoDataFund := CalcDataInscFund(qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                                         qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,
                                         qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
                                         qryPlanosPrev.FieldByName('SeqProposta').AsInteger,
                                         qryAux);

  If Trim(sInscricaoDataFund) = '' then sInscricaoDataFund := FormatDateTime('dd/mm/yyyy', Date);

  if Trim(qryElegPatro.FieldByName('TempoServAnterior').AsString) = '' Then
    sTempoServAnterior := '0'
  else
    sTempoServAnterior := qryElegPatro.FieldByName('TempoServAnterior').AsString;

  if Trim(qryElegPatro.FieldByName('TempoNaoCreditado').AsString) = '' Then
    sTempoNaoCreditado := '0'
  else
    sTempoNaoCreditado := qryElegPatro.FieldByName('TempoNaoCreditado').AsString;

  frmMostraAux.memResult.Lines.Add('Opções do Elegível : ');
  frmMostraAux.memResult.Lines.Add('_____________________ ');

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT IDREGRACALCOP1,IDREGRACALCOP2,IDREGRACALCOP3,  '+
                 '        NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3 '+
                 ' FROM PATRO '+
                 ' WHERE IDPESSOA = ' +qryElegPatro.fieldbyname('idpessjur').AsString);
  qryAux.Open;

  if not qryAux.IsEmpty Then
  begin
    // Recalcular apenas as opcoes que possuem regra de calculo
    sIdRegraCalcOp1 := qryAux.FieldbyName('IdRegraCalcOp1').AsString;
    sIdRegraCalcOp2 := qryAux.FieldbyName('IdRegraCalcOp2').AsString;
    sIdRegraCalcOp3 := qryAux.FieldbyName('IdRegraCalcOp3').AsString;
    sNomeOp1        := qryAux.FieldbyName('NomeValorBase1').AsString;
    sNomeOp2        := qryAux.FieldbyName('NomeValorBase2').AsString;
    sNomeOp3        := qryAux.FieldbyName('NomeValorBase3').AsString;

    sSQL := ' SELECT '+qryElegPatro.FieldByName('IdPessoa').AsString + ' AS IDPESSOA, '+
                       qryElegPatro.FieldByName('IdPessJur').AsString+ ' AS IDPESSJUR, '+
                       sIdPlanoPrev   +'  AS IDPLANOPREV, '+
                       ''''+sInscricaoData +'''  AS INSCRICAODATA, '+
                       ''''+sDtInicioInsc  +'''  AS DTINICIOINSC, '+
                       ''''+sDataNasc      +'''  AS DATANASC, '+
                       OraNumero(sTempoServAnterior)  +' AS TEMPOSERVANTERIOR, '+
                       OraNumero(sTempoNaoCreditado)  +' AS TEMPONAOCREDITADO, '+
                       OraNumero(sPartReinscrito)     +' AS PARTREINSCRITO FROM DUAL ';

    if Trim(sIdRegraCalcOp1) <> '' Then
    begin
      // Executa Regra de Cálculo do Valor das Opções
      try
        sValorBase1 := RegraNumerica(sIdRegraCalcOp1,sSQL,bErro, iIdCalculoGeral);
      except
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
               ' retornou um valor inválido. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;

      if Trim(sValorBase1) = '' Then
      begin
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
               ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;

      try
        rValorOpcao1 := StrToFloat(ClienteNumero(sValorBase1));
      except
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
               ' retornou um valor em inválido = '+sValorBase1+'.','Erro',mtError
               ,[mbOk,mbHelp],0);
        Exit;
      End;
    End;

    if Trim(sIdRegraCalcOp2) <> '' Then
    begin
      // Executa Regra de Cálculo do Valor das Opções
      try
        sValorBase2 := RegraNumerica(sIdRegraCalcOp2,sSQL,bErro, iIdCalculoGeral);
      except
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
               ' retornou um valor inválido. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;

      if Trim(sValorBase2) = '' then
      begin
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
               ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;

      try
        rValorOpcao2 := StrToFloat(ClienteNumero(sValorBase2));
      except
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
               ' retornou um valor em inválido = '+sValorBase2+'.','Erro',mtError
               ,[mbOk,mbHelp],0);
        Exit;
      end;
    end;

    if Trim(sIdRegraCalcOp3) <> ''  then
    begin
      // Executa Regra de Cálculo do Valor das Opções
      try
        sValorBase3 := RegraNumerica(sIdRegraCalcOp3,sSQL,bErro, iIdCalculoGeral);
      except
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+' - nº '+sIdRegraCalcOp3+' - '+
               ' retornou um valor inválido. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;

      if Trim(sValorBase3) = '' then
      begin
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+' - nº '+sIdRegraCalcOp3+' - '+
               ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;

      try
        rValorOpcao3 := StrToFloat(ClienteNumero(sValorBase3));
      except
        frmAguarde.Apaga;
        MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+ ' - nº '+sIdRegraCalcOp3+' - '+
               ' retornou um valor em inválido = '+sValorBase3+'.','Erro',mtError
               ,[mbOk,mbHelp],0);
        Exit;
      end;
    end;

    // Se recalculou alguma opcao, regrava-la na query de elegivel
    if (Trim(sIdRegraCalcOp1) <> '') or (Trim(sIdRegraCalcOp2) <> '') or (Trim(sIdRegraCalcOp3) <> '')
    then begin
       qryElegPatro.Edit;
       if Trim(sIdRegraCalcOp1) <> ''
       then begin
          qryElegPatro.FieldByName('ValorBase1').AsFloat := rValorOpcao1;
          frmMostraAux.memResult.Lines.Add(sNomeOp1+' - valor recalculado = '+sValorBase1);
       end;
       if Trim(sIdRegraCalcOp2) <> ''
       then begin
          qryElegPatro.FieldByName('ValorBase2').AsFloat := rValorOpcao2;
          frmMostraAux.memResult.Lines.Add(sNomeOp2+' - valor recalculado = '+sValorBase2);
       end;
       if Trim(sIdRegraCalcOp3) <> ''
       then begin
          qryElegPatro.FieldByName('ValorBase3').AsFloat := rValorOpcao3;
          frmMostraAux.memResult.Lines.Add(sNomeOp3+' - valor recalculado = '+sValorBase3);
       end;
       qryElegPatro.Post;
    end
    else begin // nao recalculou nenhuma opcao do elegivel
       frmMostraAux.memResult.Lines.Add('Nenhuma das opções possui "Regra de Cálculo" associada.');
       frmMostraAux.memResult.Lines.Add('Verifique se não é necessário informar um novo valor. ');
    end;
  end; 

  // 2o. OPCOES DE CONTRIBUICOES - CONTRIBPREVP (VALORBASE1,VALORBASE2,VALORBASE3)
  if qryPlanosPrev.IsEmpty
  then begin
     frmAguarde.Apaga;
     Result := True;
     Exit;
  end;

  // Verifica opcoes do plano
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT CP.IDREGRACALCOP1,CP.IDREGRACALCOP2,CP.IDREGRACALCOP3,  '+
                 '        CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, '+
                 '        CPP.DATAINICIO, CPP.DATAFINAL, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
                 '        C.NOME, C.IDCONTRIBUICAO  '+
                 ' FROM  CONTPREV  CP, CONTRIBPREVPARTP CPP, CONTRIBUICAO C '+
                 ' WHERE (CPP.IDPLANOPREV = ' +qryPlanosPrev.Fieldbyname('IdPlanoPrev').AsString+')'+
                 ' AND   (CPP.IDPESSOA    = ' +qryPlanosPrev.Fieldbyname('IdPessoa').AsString+')'+
                 ' AND   (CPP.IDPESSJUR   = ' +qryPlanosPrev.Fieldbyname('IdPessJur').AsString+')'+
                 ' AND   (CP.IDPLANOPREV  = CPP.IDPLANOPREV )'+
                 ' AND   (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) '+
                 ' AND   (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)');
  qryAux.Open;

  while not qryAux.Eof
  do begin
    // Recalcular apenas as opcoes que possuem regra de calculo
    sIdRegraCalcOp1 := qryAux.FieldbyName('IdRegraCalcOp1').AsString;
    sIdRegraCalcOp2 := qryAux.FieldbyName('IdRegraCalcOp2').AsString;
    sIdRegraCalcOp3 := qryAux.FieldbyName('IdRegraCalcOp3').AsString;
    sNomeOp1        := qryAux.FieldbyName('NomeValorBase1').AsString;
    sNomeOp2        := qryAux.FieldbyName('NomeValorBase2').AsString;
    sNomeOp3        := qryAux.FieldbyName('NomeValorBase3').AsString;
    if Trim(qryAux.FieldbyName('ValorBase1').AsString) <> ''
    then sValorBase1 := qryAux.FieldbyName('ValorBase1').AsString
    else sValorBase1 := '0';

    if Trim(qryAux.FieldbyName('ValorBase2').AsString) <> ''
    then sValorBase2 := qryAux.FieldbyName('ValorBase2').AsString
    else sValorBase2 := '0';

    if Trim(qryAux.FieldbyName('ValorBase3').AsString) <> ''
    then sValorBase3 := qryAux.FieldbyName('ValorBase3').AsString
    else sValorBase3 := '0';

    PreencheContribAssociada( qryPlanosPrev.FieldbyName('IdPessJur').AsInteger,
                              qryPlanosPrev.FieldbyName('IdPlanoPrev').AsInteger,
                              qryPlanosPrev.FieldbyName('IdPessoa').AsInteger,
                              qryPlanosPrev.FieldbyName('SeqProposta').AsInteger,
                              qryAux.FieldByName('IdContribuicao').AsInteger,
                              sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                              sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                              sAssoc1Op3, sAssoc2Op3, sAssoc3Op3, qryAux2);

    sSQL := ' SELECT '+qryElegPatro.FieldByName('IdPessoa').AsString + ' AS IDPESSOA,  '+
                       qryElegPatro.FieldByName('IdPessJur').AsString+ ' AS IDPESSJUR, '+
                       sIdPlanoPrev   +'  AS IDPLANOPREV, '+
                       qryAux.FieldByName('IdContribuicao').AsString+ ' AS IDCONTRIBUICAO, '+
                       ''''+sInscricaoData +'''  AS INSCRICAODATA, '+
                       ''''+sDtInicioInsc  +'''  AS DTINICIOINSC, '+
                       ''''+sDataNasc      +'''  AS DATANASC, '+
                       OraNumero(sValorBase1)+' AS VALORBASE1, '+
                       OraNumero(sValorBase2)+' AS VALORBASE2, '+
                       OraNumero(sValorBase3)+' AS VALORBASE3, '+
                       OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+
                       OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+
                       OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+
                       OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+
                       OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+
                       OraNumero(sAssoc3Op2)+' AS ASSOC3OP3, '+
                       OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
                       OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
                       OraNumero(sAssoc3Op3)+' AS ASSOC3OP3, '+
                       OraNumero(sValorProvento)+ ' AS VALORPROVENTO, '+
                       ''''+sInscricaoDataFund+''' AS INSCRICAODATAFUND, '+
                       ''''+qryPessoaFisica.FieldByName('Sexo').AsString+''' AS SEXO, '+
                       OraNumero(sTempoServAnterior)  +' AS TEMPOSERVANTERIOR, '+
                       OraNumero(sTempoNaoCreditado)  +' AS TEMPONAOCREDITADO, '+
                       OraNumero(sPartReinscrito)     + ' AS PARTREINSC, '+
                       OraNumero(sPartResgPoupanca)   +  ' AS RESGPOUPANCA, '+
                       ''''+sUltMesPreparo+''' AS ULTMESPREPARO, '+
                       ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString+ ''' AS DATAADMISSAO, '+
                       ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString+ ''' AS DATADEMISSAO, '+
                       ''''+qryPlanosPrev.FieldByName('DATACANCELAMENTO').AsString+ ''' AS DATACANCELAMENTO, '+
                       ''''+qryAux.FieldByName('DataInicio').AsString+ ''' AS DATAINICIO, '+
                       ''''+PreparaStr(qryAux.FieldByName('DataFinal').AsString, 10)+ ''' AS DATAFINAL '+
            ' FROM   DUAL ';

    if Trim(sIdRegraCalcOp1) <> ''
    then begin
       // Executa Regra de Cálculo do Valor das Opções
       try
          sValorBase1 := RegraNumerica(sIdRegraCalcOp1,sSQL,bErro, iIdCalculoGeral);
       except
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
                 ' retornou um valor inválido = '+sValorBase1,'Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;

       if Trim(sValorBase1) = ''
       then begin
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
                 ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;

       try
          rValorOpcao1 := StrToFloat(ClienteNumero(sValorBase1));
       except
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
                 ' retornou um valor em inválido = '+sValorBase1+'.','Erro',mtError
                 ,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;
    end;

    if Trim(sIdRegraCalcOp2) <> ''
    then begin
       // Executa Regra de Cálculo do Valor das Opções
       try
          sValorBase2 := RegraNumerica(sIdRegraCalcOp2,sSQL,bErro, iIdCalculoGeral);
       except
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
                 ' retornou um valor inválido = '+sValorBase2,'Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
       end;

       if Trim(sValorBase2) = ''
       then begin
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
                 ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;

       try
          rValorOpcao2 := StrToFloat(ClienteNumero(sValorBase2));
       except
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
                 ' retornou um valor em inválido = '+sValorBase2+'.','Erro',mtError
                 ,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;
    end;

    if Trim(sIdRegraCalcOp3) <> ''
    then begin
       // Executa Regra de Cálculo do Valor das Opções
       try
          sValorBase3 := RegraNumerica(sIdRegraCalcOp3,sSQL,bErro, iIdCalculoGeral);
       except
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+' - nº '+sIdRegraCalcOp3+' - '+
                 ' retornou um valor inválido =,'+sValorBase3,'Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;

       if Trim(sValorBase3) = ''
       then begin
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+' - nº '+sIdRegraCalcOp3+' - '+
                 ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;

       try
          rValorOpcao3 := StrToFloat(ClienteNumero(sValorBase3));
       except
          frmAguarde.Apaga;
          MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+ ' - nº '+sIdRegraCalcOp3+' - '+
                 ' retornou um valor em inválido = '+sValorBase3+'.','Erro',mtError
                 ,[mbOk,mbHelp],0);
          TiraSQL(qryAux2);
          Exit;
       end;
    end;

    // Se recalculou alguma opcao, regrava-la na query de elegivel
    if (Trim(sIdRegraCalcOp1) <> '') or (Trim(sIdRegraCalcOp2) <> '') or (Trim(sIdRegraCalcOp3) <> '')
    then begin
       qryAux2.Close;
       qryAux2.SQL.Clear;
       qryAux2.SQL.Add(' UPDATE CONTRIBPREVPARTP '+
                       ' SET VALORBASE1 = '+OraNumero(sValorBase1)+','+
                       '     VALORBASE2 = '+OraNumero(sValorBase2)+','+
                       '     VALORBASE3 = '+OraNumero(sValorBase3)+
                       ' WHERE IDPESSOA = '   +qryPlanosPrev.FieldByName('IdPessoa').AsString+
                       ' AND   IDPESSJUR = '  +qryPlanosPrev.FieldByName('IdPessJur').AsString+
                       ' AND   IDPLANOPREV = '+qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+
                       ' AND   SEQPROPOSTA = '+qryPlanosPrev.FieldByName('SeqProposta').AsString+
                       ' AND   IDCONTRIBUICAO = '+qryAux.FieldByName('IdContribuicao').AsString);
       try
          qryAux2.ExecSQL;
          frmMostraAux.memResult.Lines.Add('               ');
          frmMostraAux.memResult.Lines.Add('* Opções da Contribuição : '+qryAux.FieldByName('Nome').AsString);
          frmMostraAux.memResult.Lines.Add('  _______________________    ');
          frmMostraAux.memResult.Lines.Add('1. '+sNomeOp1+' - valor recalculado = '+sValorBase1);
          frmMostraAux.memResult.Lines.Add('2. '+sNomeOp2+' - valor recalculado = '+sValorBase2);
          frmMostraAux.memResult.Lines.Add('3. '+sNomeOp3+' - valor recalculado = '+sValorBase3);
       except
          frmAguarde.Apaga;
          MsgDlg('Ocorreu um erro na gravação do valor recalculado das opções. ',
                 'Erro',mtError,[mbOk,mbHelp],0);
          Exit;
       end;
    end
    else begin
       frmMostraAux.memResult.Lines.Add('               ');
       frmMostraAux.memResult.Lines.Add('* Opções da Contribuição : '+qryAux.FieldByName('Nome').AsString);
       frmMostraAux.memResult.Lines.Add('  _______________________    ');
       frmMostraAux.memResult.Lines.Add('Nenhuma das opções possui "Regra de Cálculo" associada.');
       frmMostraAux.memResult.Lines.Add('Verifique se não é necessário informar um novo valor. ');
    end;
    qryAux.Next;
  end; // while not qryAux.Eof
  
  frmAguarde.Apaga;
  frmMostraAux.Caption := 'Recálculo de Parâmetros do Participante';
  frmMostraAux.ShowModal;
  qryAux.Close;
  Result := True;
end; // RecalculaOpcoes


procedure TfrmCadElegivel.FormCreate(Sender: TObject);
var
  i: Integer; // Michelle Mota - SIG21866
begin

  dbgTelefoneRamal.Visible := true;
  //GroupBox7.Height := 168;
  Panel4.Visible   := false;

  Pessoa.SQLFiltro.Clear;
  inherited;
  qryElegPatro.Prepare;
  qryPlanosPrev.Prepare;
  qryContaBancaria.Prepare;
  qryOutrasInforms.Prepare;
  qryOcupacao.Prepare;//Darivaldo Alencar SIG 27871
  qryPF2.prepare;     //Darivaldo Alencar SIG 27871
  qryDepen.Prepare;
  qryDepenTit.Prepare;
  qryBenefPlanoPart.Prepare;
  qryfundacoes.prepare;
  bVeioDoMenu := True;
  bChamou := False;
  bAteraTipoIr := false;
  bExcluiTipoIr := false;
  bInsereOpcaoIr  := True;

  {variaveis declaradas no FPessoa para tratar ações
   que devem acontecer apenas do CadElegivel}
  bObrigaVinculoTelxEnd := False;    //edilaine - SIG33979
  bControleTransFilho   := true;     //edilaine - SIG33979

  qryLocalNascimento.prepare; //CPrev - 27955
  bSair  := false;
  bControleTransacao := true;
  
  {Início - Michelle Mota - SIG21866}
  for i := 0 to Self.ComponentCount -1 do
    begin
      if (Self.Components[i] is TEdit) then
          TEdit(Self.Components[i]).CharCase := ecUpperCase;
      if (Self.Components[i] is TwwDBEdit) then
          TwwDBEdit(Self.Components[i]).CharCase := ecUpperCase;
    end;
  {Término - Michelle Mota - SIG21866}

  //Início - William Santana SOL 161550 KIN 1717512
  qryReprLegal.Prepare;
  qryLogReprLegal.Prepare;
  pnlReprLegal.visible := false ;
  pnlGrdReprLegal.visible := true;
  //Término - William Santana SOL 161550 KIN 1717512

  MostraEscondeGridOutrasInformacoes(True); //Darivaldo Alencar SIG27871
  //Darivaldo Alencar SIG37689 -início
  //Dados dos captions antes da alteração
  // Label41.caption:= 'Tempo de Serviço Anterior';
  //Label24.top:= 180; Label24.left:= 116; Label24.caption:= 'Tempo de Contribuição Não Creditado';
  //Label37.top:= 133; Label37.left:= 311; Label37.caption:= 'meses';
  //Label42.top:= 135; Label42.left:= 133; Label42.caption:= 'meses';

  dbedTempoServAnterior.left   := 8;
  dbedTempoNaoCreditado.left   := 180;
  dbedTempoServAnterior.Top    := 129;
  dbedTempoNaoCreditado.Top    := 129;
  dbedTempoServAnterior.visible:= false;
  dbedTempoNaoCreditado.visible:= false;
  //Darivaldo Alencar SIG37689 -fim

end;


//edilaine - SIG33979 - inicio
{Function TfrmCadElegivel.InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia: string ; iIdPessoa:integer): boolean; // Michelle Mota - SOL: 264969 - PPM: 1166927
var
  dtDataFimMolestia,
  dtDatainicioMolestia : TDateTime;
begin
  result := True; //Michelle Mota - SOL: 264969 - PPM: 1166927

  dtDataFimMolestia     :=  CMDateTimePicker6.Date;
  dtDatainicioMolestia  :=  dbdtMolestiaGrave.Date;

  qryMolestiaGrave.Close;
  qryMolestiaGrave.SQL.Clear;
  qryMolestiaGrave.SQL.Add('SELECT DTINICIO, DTFINAL FROM HSTMOLESTIAGRAVE');
  qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa));
  qryMolestiaGrave.Open;

  // Fernando Santana >> SOL 148331 KINTANA  1040733 -- coloquei o comando >> and (trim(dbdtMolestiaGrave.Text) <> '')
  //if (dbrgrpFlgMolestiaGrave.ItemIndex = 0) and ((trim(dbdtMolestiaGrave.Text) <> '') or (trim(CMDateTimePicker6.Text) <> '') )then
  if (wwDBCBIsentoIrrf.ItemIndex = 2)and ((trim(dbdtMolestiaGrave.Text) <> '') or (trim(CMDateTimePicker6.Text) <> '') )then
       begin

        if qryMolestiaGrave.isEmpty then
           begin
              qryMolestiaGrave.Close;
              qryMolestiaGrave.SQL.Clear;
                   // Início - Michelle Mota - SOL: 264969 - PPM: 1166927
                   //if sDataFimMolestia <> '30/12/1899' then
                   if sDataFimMolestiaAlterar <> '30/12/1899' then
                     begin
                       qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO,DTFINAL) VALUES ');
                     end
                   else
                     begin
                       qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO) VALUES ');
                     end;

                   qryMolestiaGrave.SQL.Add( '('+IntToStr(iIdPessoa) +',');

                 //if sDataFimMolestia <> '30/12/1899' then
                 //    begin
                 //       qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDatainicioMolestia +''' , ''DD/MM/YYYY''),');  //Marcio Sanches Spinosa SOL 238755 PPM 507686
                 //       qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDataFimMolestia    +''' , ''DD/MM/YYYY''))'); //Marcio Sanches Spinosa SOL 238755 PPM 507686
                 //    end
                 //
                 //else
                 //    begin
                 //       qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDatainicioMolestia +''' , ''DD/MM/YYYY''))');  //Marcio Sanches Spinosa SOL 238755 PPM 507686
                 //    end;

                 if sDataFimMolestiaAlterar <> '30/12/1899' then
                   begin
                      qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDatainicioMolestiaAlterar +''' , ''DD/MM/YYYY''),');
                      qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDataFimMolestiaAlterar    +''' , ''DD/MM/YYYY''))');
                   end
                 else
                   begin
                      qryMolestiaGrave.SQL.Add( 'TO_DATE(''' +sDatainicioMolestiaAlterar +''' , ''DD/MM/YYYY''))');
                   end;
                 // Término - Michelle Mota - SOL: 264969 - PPM: 1166927

              qryMolestiaGrave.execSQL;
           end
        else
           begin

              qryMolestiaGrave.Close;
              qryMolestiaGrave.SQL.Clear;
              qryMolestiaGrave.SQL.Add('SELECT DTINICIO, DTFINAL FROM HSTMOLESTIAGRAVE ');

              qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa)+    'AND');
              qryMolestiaGrave.SQL.Add('DTINICIO = TO_DATE('' '+ sDatainicioMolestiaAlterar +  ''',''DD/MM/YYYY'') AND');  //Marcio Sanches Spinosa SOL 238755 PPM 507686
              qryMolestiaGrave.SQL.Add('DTFINAL IS NULL');
              qryMolestiaGrave.Open;


                     if not(qryMolestiaGrave.IsEmpty) then
                        begin                                                                                              //     dtDataFimMolestia  ,  dtDatainicioMolestia , dtDatainicioMolestia, dtDatainicioMolestia
                           if(sDataFimMolestia <> '30/12/1899') and (sDatainicioMolestiaAlterar = sDatainicioMolestia) and (dtDataFimMolestia > dtDatainicioMolestia) then
                              begin
                                 qryMolestiaGrave.Close;
                                 qryMolestiaGrave.SQL.Clear;
                                 qryMolestiaGrave.SQL.Add('UPDATE HSTMOLESTIAGRAVE');
                                 qryMolestiaGrave.SQL.Add('SET DTFINAL = TO_DATE(''' + sDataFimMolestia +''',''DD/MM/YYYY'')'); //Marcio Sanches Spinosa SOL 238755 PPM 507686
                                 qryMolestiaGrave.SQL.Add('WHERE IDPESSOA = '+IntToStr(iIdPessoa));
                                 qryMolestiaGrave.execSQL;
                              end
                           else
                              begin
                                 if(dtDataFimMolestia < dtDatainicioMolestia) and (dtDataFimMolestia > 0 ) then
                                 begin
                                    ShowMessage('A data de fim deve ser superior a data de inicio da Molestia');
                                    dbdtMolestiaGrave.Date := StrToDate(sDatainicioMolestiaAlterar);
                                    result := false; //Michelle Mota - SOL: 264969 - PPM: 1166927
                                    //Abort;  //Michelle Mota - SOL: 264969 - PPM: 1166927
                                 end;
                              end;
                        end
                    else
                    if(dtDatainicioMolestia > dtDataFimMolestiaAlterar) and ((sDataFimMolestia = '30/12/1899') or (dtDataFimMolestia > dtDatainicioMolestia))  then
                    begin
                                    qryMolestiaGrave.Close;
                                    qryMolestiaGrave.SQL.Clear;
                                        // Início - Michelle Mota - SOL: 264969 - PPM: 1166927
                                        //if sDataFimMolestia <> '30/12/1899' then
                                        if sDatafimMolestiaAlterar <> '30/12/1899' then
                                            begin
                                                qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO,DTFINAL) VALUES ');
                                            end
                                        else
                                            begin
                                                qryMolestiaGrave.SQL.Add('INSERT INTO HSTMOLESTIAGRAVE (IDPESSOA,DTINICIO) VALUES ');
                                            end;

                                        qryMolestiaGrave.SQL.Add( '('+IntToStr(iIdPessoa) +',');


                                        //if sDataFimMolestia <> '30/12/1899' then
                                        //   begin
                                        //        qryMolestiaGrave.SQL.Add( '''' +sDatainicioMolestia +''',');
                                        //        qryMolestiaGrave.SQL.Add( '''' +sDataFimMolestia    +''')');
                                        //    end
                                        //else
                                        //    begin
                                        //        qryMolestiaGrave.SQL.Add( '''' +sDatainicioMolestia +''')');
                                        //end;

                                        if sDataFimMolestiaAlterar <> '30/12/1899' then
                                            begin
                                                qryMolestiaGrave.SQL.Add( '''' +sDatainicioMolestiaAlterar +''',');
                                                qryMolestiaGrave.SQL.Add( '''' +sDataFimMolestiaAlterar    +''')');
                                            end
                                        else
                                            begin
                                                qryMolestiaGrave.SQL.Add( '''' +sDatainicioMolestiaAlterar +''')');
                                        end;
                                        // Término - Michelle Mota - SOL: 264969 - PPM: 1166927
                               qryMolestiaGrave.execSQL;

                       end
                       else
                           begin
                              //BRUNO AZEVEDO SOL 154387 KINTANA 1180946
                              if (dtDataFimMolestiaAlterar <> dtDataFimMolestia) or (dtDatainicioMolestiaAlterar <> dtDatainicioMolestia) then begin
                                ShowMessage('O novo período de moléstia grave deve estar fora do período da moléstia anterior.');
                                //Abort; //Michelle Mota - SOL: 264969 - PPM: 1166927
                                result := false; //Michelle Mota - SOL: 264969 - PPM: 1166927

                              end;
                           end;


           end;

       end

end;
}//edilaine - SIG33979 - fim



procedure TfrmCadElegivel.CmeCadastroConfirma(Sender: TObject);
Var
 sNomeParticip,
 sNomePatro,
 sNomePlano,
 sDtInicio  : string;
 iIdPessoa,
 iIdPessJur,
 iIdPlanoPrev,
 iSeqProposta : integer;
 sDatainicioMolestia,
 sDataFimMolestia : string;
 iIdPessoaEleg : integer;
begin
  //WILLIAM MOREIRA DA SILVA SOL 165677 - Inicio
  if not DataUltimaAlteracao(qryElegPatro.FieldByName('IdPessoa').AsInteger) then
  begin
     exit;
  end;
  //WILLIAM MOREIRA DA SILVA SOL 165677 - Fim
   sNomeParticip := dbedNomeFantasia.Text;
   sNomePatro    := qryElegPatro.FieldByName('Patrocinadora').AsString;
   iIdPessoaEleg := qryElegPatro.FieldByName('IdPessoa').AsInteger;
   sNomePlano    := qryPlanosPrev.FieldByName('Plano').AsString;
   sDtInicio     := dbdtInscricao.Text;
   iIdPessoa     := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
   iIdPessjur    := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
   iIdPlanoPrev  := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
   iSeqProposta  := qryPlanosPrev.FieldByName('SEQPROPOSTA').AsInteger;
 
   //edilaine - SIG33979 - inicio
   {sDatainicioMolestia := FormatDateTime('dd/mm/yyyy',dbdtMolestiaGrave.Date );   //Data Inicial
   sDataFimMolestia    := FormatDateTime('dd/mm/yyyy',CMDateTimePicker6.Date );   //Data Final
   }//edilaine - SIG33979 - fim

   // Início - Michelle Mota - SOL: 264969 - PPM: 1166927
   {if (dbrgrpMolestiaGrave.visible) then //Marcio Sanches Spinosa SOL 238755 PPM 507686
   begin
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if not(InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia, iIdPessoa)) then
      begin
         qryPessoaFisica.Cancel;
         abort;
      end;
   end;}
   // Término - Michelle Mota - SOL: 264969 - PPM: 1166927

   // Testar se tem algum participante a inserir.
   // Se tiver e for o primeiro, inserí-lo como dependente dele
   bGravaDependente := PreparaDependente;

   // Se estiver inserindo um participante, inserí-lo na benefplanopart
   // para todos os beneficios do plano
   if bInsereParticipante
   then begin

      // Se estiver inserindo o participante (inscricao) e os dados do participante na fundacao
      // nao tiverem sido preenchidos, entao criar os dados na tabela PESSOAXFUND
      if qryFundacoes.IsEmpty
      then begin
         qryFundacoes.Insert;
         qryFundacoes.FieldByName('IDFUNDACAO').AsInteger := iIdFundacao;
         qryFundacoes.FieldByName('IDPESSOA').AsInteger   := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
         qryFundacoes.FieldByName('NUMINSC').AsString     := qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsString;
         qryFundacoes.Post;
      end;

   end;
   inherited;

  // Adicionando Log Padrao
  Try
    //BRUNO AZEVEDO SOL 137519 KINTANA 831220
    If Not Sistema.GravaLogOperacoes(self.Caption, True) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  If Not bVeioDoMenu
   Then Begin
     frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
     frmCadContribParticipante.AssociaContrib(sNomeParticip,
                                              sNomePatro,
                                              sNomePlano,
                                              sDtInicio,
                                              iIdPessoa,
                                              iIdPessjur,
                                              iIdPlanoPrev,
                                              iSeqProposta,
                                              False);
     frmCadContribParticipante.Free;
   End;

end; //CmeCadastro.Confirma(Self)

procedure TfrmCadElegivel.PessoaSaveSubtipo(Sender: TObject);
var bPreparouContrib,
    bOk : boolean;
begin
   inherited;
   try
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryElegPatro]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryPlanosPrev]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryContaBancaria]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryOutrasInforms]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryOcupacao]);
      if not (qryPF2.state = dsInactive)  then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryPF2]); //Darivaldo Alencar SIG 27871
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryfundacoes]);
      dtmBaseDados.dbBaseDados.ApplyUpdates([qryHistFuncPrev]);
      if (bInsereParticipante = True) and (not qryPlanosPrev.IsEmpty)
      then begin
          if qryBenefPlanoPart.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryBenefPlanoPart]);
          // Gravar querys do preparo de contribuicao
          if qryEventosPrev.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryEventosPrev]);
          if qryHstContEventosPR.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryHstContEventosPR]);
          if qryContribPrevPartP.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryContribPrevPartP]);

          if qryCtrlInterface.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryCtrlInterface]);

          if qryHstContribPrev.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryHstContribPrev]);
          if qryHstRubSal.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryHstRubSal]);
          if qryHstAtrasoContrib.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryHstAtrasoContrib]);
          if qryHstRubricaxPess.UpdatesPending then  dtmBaseDados.dbBaseDados.ApplyUpdates([qryHstRubricaxPess]);
          GravaReservasParticipante;
      end;
      if bGravaDependente
      then begin
         dtmBaseDados.dbBaseDados.ApplyUpdates([qryDepen]);
         dtmBaseDados.dbBaseDados.ApplyUpdates([qryDepenTit]);
      end;
   except
      Raise;
   end;

   if bInsereParticipante
   then begin
      MsgDlg('Participante Inscrito com Sucesso !','Informação',mtInformation,[mbOk,mbHelp],0);
      bbtnConfirmar.Enabled := False; 
      bbtnCancelar.Enabled := False;  
      bExibiuPerguntaInscricao := True; 
   end;

   bInsereParticipante := False;
end;

function TfrmCadElegivel.GravaContribuicoesParticipante : boolean;
var
  iIdEventoPrev,
  iIdAssociacao     : longint;

  sSQL,
  sMsgErro,
  sValorBase1, sValorBase2, sValorBase3,
  sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
  sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
  sAssoc1Op3, sAssoc2Op3, sAssoc3Op3,
  sDataInicio,
  sDataFinal,
  sContribAAssociar : string;
  bErro : boolean;
begin
  Result        := False;

  // *********************************************************************
  // ****** Verificar se a inscricao é retroativa
  // ****** Perguntar se o sistema deve cobrar as contribuicoes retroativas
  // ****** Caso sim, preparar as contribuicoes e seus alteradores
  // *********************************************************************

  if (Trim(qryPlanosPrev.FieldByName('INSCRICAODATA').AsString) <> '') and
     (StrToDate(qryPlanosPrev.FieldByName('INSCRICAODATA').AsString) < Date)
  then begin
     if MsgDlg('A inscrição deste participante é retroativa à '+qryPlanosPrev.FieldByName('InscricaoData').AsString+'. '+
               'Deseja cobrar contribuições retroativas a partir desta data ?',
               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrYes Then
       sDataInicio   := Trim(qryPlanosPrev.FieldByName('INSCRICAODATA').AsString)
     else begin
       sDataInicio   := '01/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,7);
        // Vinicius Ferreira SOL 160450 KINTANA 1351426
        // *********************************************************************
        // ******* Gravar Evento Inscricao do Participante na tabela EventosPrev
        // *********************************************************************

        frmAguarde.Mostra('Gravando evento ... ');

        iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

        qryEventosPrev.Insert;
        qryEventosPrev.FieldByName('IDEVENTOSPREV').AsInteger   := iIdEventoPrev;
        qryEventosPrev.FieldByName('DATAREGISTRO').AsDateTime   := Date;
        qryEventosPrev.FieldByName('DATAEVENTO').AsDateTime     := StrToDate(Trim(dbdtInscricao.Text));
        qryEventosPrev.FieldByName('IDPESSOA').AsInteger        := qryPlanosPrev.FieldByName('IDPESSOA').AsInteger;
        qryEventosPrev.FieldByName('IDPESSJUR').AsInteger       := qryPlanosPrev.FieldByName('IDPESSJUR').AsInteger;
        qryEventosPrev.FieldByName('IDPLANOPREV').AsInteger     := qryPlanosPrev.FieldByName('IDPLANOPREV').AsInteger;
        qryEventosPrev.FieldByName('SEQPROPOSTA').AsInteger     := qryPlanosPrev.FieldByName('SEQPROPOSTA').AsInteger;
        qryEventosPrev.FieldByName('IDSITFUNCATUAL').AsInteger  := qrySitFunc.FieldbyName('IDSITFUNC').AsInteger;
        qryEventosPrev.FieldByName('IDSITPARTATUAL').AsInteger  := qrySitPart.FieldbyName('IDSITPART').AsInteger;
        qryEventosPrev.FieldByName('IDSITPLANOATUAL').AsInteger := qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsInteger;
        qryEventosPrev.FieldByName('IDSITFUNCNOVO').AsInteger   := qrySitFunc.FieldbyName('IDSITFUNC').AsInteger;
        qryEventosPrev.FieldByName('IDSITPARTNOVO').AsInteger   := qrySitPart.FieldbyName('IDSITPART').AsInteger;
        qryEventosPrev.FieldByName('IDSITPLANONOVO').AsInteger  := qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsInteger;
        qryEventosPrev.FieldByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
        qryEventosPrev.FieldByName('FLGSITFUNCIMED').AsInteger  := 1;
        qryEventosPrev.FieldByName('FLGSITPARTIMED').AsInteger  := 1;
        qryEventosPrev.FieldByName('FLGSITPLANOIMED').AsInteger := 1;
        qryEventosPrev.FieldByName('DATAEFETIVADO').AsDateTime  := Date;
        qryEventosPrev.FieldByName('FLGEFETIVADO').AsInteger    := 1;
        qryEventosPrev.FieldByName('INSCRICAONUMERO').AsInteger := qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsInteger;
        qryEventosPrev.Post;


       Result := True;
       exit;
       // Vinicius Ferreira SOL 160450 KINTANA 1351426
     end;
  end;

  if sDataInicio = ''
  then sDataInicio := Trim(qryPlanosPrev.FieldByName('INSCRICAODATA').AsString);

  // *********************************************************************
  // ******* Gravar Evento Inscricao do Participante na tabela EventosPrev
  // *********************************************************************

  frmAguarde.Mostra('Gravando evento ... ');

  iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

  qryEventosPrev.Insert;
  qryEventosPrev.FieldByName('IDEVENTOSPREV').AsInteger   := iIdEventoPrev;
  qryEventosPrev.FieldByName('DATAREGISTRO').AsDateTime   := Date;
  qryEventosPrev.FieldByName('DATAEVENTO').AsDateTime     := StrToDate(Trim(dbdtInscricao.Text));
  qryEventosPrev.FieldByName('IDPESSOA').AsInteger        := qryPlanosPrev.FieldByName('IDPESSOA').AsInteger;
  qryEventosPrev.FieldByName('IDPESSJUR').AsInteger       := qryPlanosPrev.FieldByName('IDPESSJUR').AsInteger;
  qryEventosPrev.FieldByName('IDPLANOPREV').AsInteger     := qryPlanosPrev.FieldByName('IDPLANOPREV').AsInteger;
  qryEventosPrev.FieldByName('SEQPROPOSTA').AsInteger     := qryPlanosPrev.FieldByName('SEQPROPOSTA').AsInteger;
  qryEventosPrev.FieldByName('IDSITFUNCATUAL').AsInteger  := qrySitFunc.FieldbyName('IDSITFUNC').AsInteger;
  qryEventosPrev.FieldByName('IDSITPARTATUAL').AsInteger  := qrySitPart.FieldbyName('IDSITPART').AsInteger;
  qryEventosPrev.FieldByName('IDSITPLANOATUAL').AsInteger := qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsInteger;
  qryEventosPrev.FieldByName('IDSITFUNCNOVO').AsInteger   := qrySitFunc.FieldbyName('IDSITFUNC').AsInteger;
  qryEventosPrev.FieldByName('IDSITPARTNOVO').AsInteger   := qrySitPart.FieldbyName('IDSITPART').AsInteger;
  qryEventosPrev.FieldByName('IDSITPLANONOVO').AsInteger  := qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsInteger;
  qryEventosPrev.FieldByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
  qryEventosPrev.FieldByName('FLGSITFUNCIMED').AsInteger  := 1;
  qryEventosPrev.FieldByName('FLGSITPARTIMED').AsInteger  := 1;
  qryEventosPrev.FieldByName('FLGSITPLANOIMED').AsInteger := 1;
  qryEventosPrev.FieldByName('DATAEFETIVADO').AsDateTime  := Date;
  qryEventosPrev.FieldByName('FLGEFETIVADO').AsInteger    := 1;
  qryEventosPrev.FieldByName('INSCRICAONUMERO').AsInteger := qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsInteger;
  qryEventosPrev.Post;

  // *********************************************************************
  // ****** Verificar atraves das regras de associacao, que contribuicoes
  // ****** deverão ser associadas
  // *********************************************************************
  // Filtrar da tabela de associacao de contribuicao x evento(CONTPREVEVENTO)
  // todas as novas contribuições que deverão ser associadas
  frmAguarde.Mostra('Verificando contribuições a associar  ... ');

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CE.IDCONTRIBUICAO, CE.IDREGRAVALIDAASS '+
                 ' FROM   CONTPREVEVENTO CE ' +
                 ' WHERE  (CE.IDPLANOPREV     = ' + qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+')'+
                 ' AND    (CE.IDEVENTOGERADOR = ' +sIdEventoGerador+')');


   qryAux.Open;
   qryAux.First;
   sContribAAssociar := '';

   // Chama regra de Validação de Associação de Contrib, para verificar se a
   // contribuição deve ser associada ao Participante ou não
   while not qryAux.EOF do
   begin
      if qryAux.FieldByName('IDREGRAVALIDAASS').AsString = ''
      then begin
        sContribAAssociar := sContribAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', ';
        qryAux.Next;
        continue;
      end;
      sSQL := ' SELECT '+qryPlanosPrev.FieldByName('IDPESSOA').AsString+       ' AS IDPESSOA,'+
                         qryPlanosPrev.FieldByName('IDPESSJUR').AsString+      ' AS IDPESSJUR,'+
                         qryPlanosPrev.FieldByName('IDPLANOPREV').AsString+    ' AS IDPLANOPREV,'+
                         qryPlanosPrev.FieldByName('SEQPROPOSTA').AsString+    ' AS SEQPROPOSTA,'+
                         OraNumero(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString)+' AS SALPARTICIPACAO,'+
               OraNumero(qryPlanosPrev.FieldByName('SALINSCRICAO').AsString)+   ' AS SALINSCRICAO,'+
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString+'''  AS INSCRICAODATA, '+
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString +'''  AS DTINICIOINSC, '+
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString +'''  AS INSCRICAODATAFUND, '+
                    ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString+''' AS IDSITFUNC,'+
                    ''''+qryElegPatro.FieldByName('IDCARGOEXT').AsString+  ''' AS IDCARGOEXT,'+
                    ''''+qryElegPatro.FieldByName('NIVEL').AsString+    ''' AS NIVEL,'+
                    ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString+''' AS DATAADMISSAO,'+
                    ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString+''' AS DATADEMISSAO,'+
               OraNumero(qryElegPatro.FieldByName('SALTOTAL').AsString)+   '   AS SALTOTAL,'+           
                    ''''+OraNumero(qryElegPatro.FieldByName('TEMPONAOCREDITADO').AsString)+''' AS TEMPONAOCREDITADO,'+
                    ''''+OraNumero(qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString)+''' AS TEMPOSERVANTERIOR,'+
                    ''''+qryPessoaFisica.FieldByName('DATANASC').AsString+''' AS DATANASC,'+
                    ''''+qryPessoaFisica.FieldByName('DATAMORTE').AsString+''' AS DATAMORTE,'+
                    ''''+qryPessoaFisica.FieldByName('SEXO').AsString+''' AS SEXO,'+
                    ''''+qryPessoaFisica.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL,'+
                    ''''+sDataInicio+''' AS DATAINICIO, '+
                       ' 0 AS FLGFITESPECIAL , '+
                       ' 0 AS PARTREINSC, '+
                       ' 0 AS RESGPOUPANCA, '+
                       ' ''0000/00'' AS ULTMESPREPARO, '+
                       ''''+sDataInicio+''' AS DATAREF,           '+
                       ' 0  AS VALORASSOCIADO,    '+
                       ' 0  AS VALORASSOCIADO2,   '+
                       ' 0  AS VALORASSOCIADO3,   '+
                       ' 0  AS VALORPROVENTO,     '+
                       ' 0  AS ASSOC1OP1,         '+
                       ' 0  AS ASSOC1OP2,         '+
                       ' 0  AS ASSOC1OP3,         '+
                       ' 0  AS ASSOC2OP1,         '+
                       ' 0  AS ASSOC2OP2,         '+
                       ' 0  AS ASSOC2OP3,         '+
                       ' 0  AS ASSOC3OP1,         '+
                       ' 0  AS ASSOC3OP2,         '+
                       ' 0  AS ASSOC3OP3          '+

               ' FROM DUAL ';

      if RegraBooleana(qryAux.FieldByName('IDREGRAVALIDAASS').AsString, sSQL, bErro) then
        sContribAAssociar := sContribAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', '
      else
        if bErro then
        begin
          frmAguarde.Apaga; 
          MsgDlg('Erro na Execução da Regra de Associação de Contribuição.','Informação',mtInformation,[mbOk,mbHelp],0);
          Exit;
        End;

     qryAux.Next;
   end; // while not Eof - fim do loop para chamar regras de associacao

   // Tirar a ultima "," da string de contribuicoes a associar
   if Trim(sContribAAssociar) <> '' then
     sContribAAssociar := Copy(sContribAAssociar, 1, Length(sContribAAssociar) - 2)
   else
     sContribAAssociar := '0';

   // *********************************************************************
   // ****** Inserir as contribuicoes que deverão ser associadas
   // ****** no Historico de contribuicoes do evento - HstContEventosPR
   // ****** e na tabela de associacao de contribuicoes - ContribPrevPartP
   // *********************************************************************
   // Filtra somente as contribuiçoes que a regra validou
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT CE.IDCONTRIBUICAO,  CE.IDREGRAVALIDAASS, '+
                  '        CP.IDCONTRIBUICAO,  CP.IDCONTRIBPAI,     CP.IDCONTRIBPAI2,'+
                  '        CP.IDCONTRIBPAI3,   CP.IDREGRACALCOP1,   CP.IDREGRACALCOP2, '+
                  '        CP.IDREGRACALCOP3,  CP.NOMEVALORBASE1,   CP.NOMEVALORBASE2, '+
                  '        CP.NOMEVALORBASE3,  CP.IDREGRACALCULO,   CP.IDREGRAPRIMPAGTO,'+
                  '        CP.IDREGRAULTPAGTO, C.FLGOBRIGATORIA,    C.NOME, '+
                  '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, CP.IDREGRAVALIDAOP3, '+
                  '        C.QTDEPARCELAS,       C.IDTPPERIODICIDADE, TP.QTDEMESES, CP.FLGDESCFOLHA, '+
                  '        CP.IDPLANOPREV,       CP.IDCONTRIBUICAO, TP.NOME AS PERIODICIDADE, '+
                  '        CP.NUMOPCOES,         CP.IDREGRACALCULO13, CP.FLGCOBRA13DTFIM,  '+
                  '        CP.IDREGRAPRIMPGTO13, CP.IDREGRAULTPGTO13, CP.FLGPAGADOR '+
                  ' FROM CONTPREVEVENTO CE, CONTPREV CP, CONTRIBUICAO C, TPPERIODICIDADE TP ' +
                  ' WHERE  (CE.IDPLANOPREV     = ' +qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+')'+
                  ' AND    (CE.IDEVENTOGERADOR = ' +sIdEventoGerador+')'+
                  ' AND    (CE.IDCONTRIBUICAO IN (' + sContribAAssociar+') )'+
                  ' AND    (CE.IDPLANOPREV     = CP.IDPLANOPREV) '+
                  ' AND    (CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO) '+
                  ' AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO) '+
                  ' AND    (C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)) '+
                  ' ORDER BY CP.ORDEMCALCULO ');
   qryAux.Open;
   qryAux.First;
   iIdAssociacao := 0;

   frmAguarde.Mostra('Associando contribuições  ... ');
   // Grava todas as novas contribuiçoes que serão associadas
   while not qryAux.EOF do
   begin
     iIdAssociacao := iIdAssociacao + 1;

     with qryHstContEventosPR do
     begin
        Insert;
        FieldByName('IDEVENTOSPREV').AsInteger    := iIdEventoPrev;
        FieldByName('IDASSOCIACAO').AsInteger     := iIdAssociacao;
        FieldByName('IDEVENTOGERADORF').AsInteger := StrToInt(sIdEventoGerador);
        FieldByName('IDPLANOPREVF').AsInteger     := qryAux.FieldByName('IdPlanoPrev').AsInteger;
        FieldByName('IDCONTRIBUICAOF').AsInteger  := qryAux.FieldByName('IdContribuicao').AsInteger;
        FieldByName('TIPO').AsString              := 'F';
        FieldByName('FLGASSOCIADA').AsInteger     := 1;
        Post;
     end; //with

      // Calcular data final da contribuicao, caso haja
     sDataFinal := CalcDataFinal(StrToDate(qryPlanosPrev.FieldByName('INSCRICAODATA').AsString),
                                 qryAux.FieldByName('QTDEPARCELAS').AsString,
                                 qryAux.FieldByName('QTDEMESES').AsString);

     if Trim(sDataFinal) <> '' then
     begin
       try
         StrToDate(sDataFinal);
       except
         if MsgDlg('Erro no Cálculo da Data Final da contribuição. '+
                   'A Data será gravada em branco. Confirma ?','Informação', mtInformation, [mbNo, mbYes], 1) = mrYes then
           sDataFinal := ''
         else
         begin
           frmAguarde.Apaga;
           exit;      // Nao efetiva o evento.
         end;
       end
     end;    // if datafinal <> ''

     // Calcular o valor das opcoes da contribuicao, caso hajam
     frmAguarde.Mostra('Calculando opções ... ');
     CalculaOpcoesContrib(qryAux, sValorBase1, sValorBase2, sValorBase3,
                                  sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                                  sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                                  sAssoc1Op3, sAssoc2Op3, sAssoc3Op3);

     if (qryAux.FieldByName('NumOpcoes').AsString <> '') and
        (qryAux.FieldByName('NumOpcoes').AsInteger > 0)  and
        ( (qryAux.FieldByName('IdRegraCalcOp1').AsString = '') or
          (qryAux.FieldByName('IdRegraCalcOp2').AsString = '') or
          (qryAux.FieldByName('IdRegraCalcOp3').AsString = '')
        )  then
     begin
       if not LerOpcoesContrib(qryAux, sValorBase1, sValorBase2, sValorBase3) then
       begin
         frmAguarde.Apaga;
         MsgDlg('Problema na leitura das opções da contribuição. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
         Exit;
       end;
     end;

     // Associar a contribuicao ao participante, gravando na CONTRIBPREVPARTP
     with qryContribPrevPartP do
     begin
         Insert;
         FieldByName('IDPESSOA').AsInteger          := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
         FieldByName('IDPESSJUR').AsInteger         := qryPlanosPrev.FieldByName('IDPESSJUR').AsInteger;
         FieldByName('IDPLANOPREV').AsInteger       := qryPlanosPrev.FieldByName('IDPLANOPREV').AsInteger;
         FieldByName('SEQPROPOSTA').AsInteger       := qryPlanosPrev.FieldByName('SEQPROPOSTA').AsInteger;
         FieldByName('IDCONTRIBUICAO').AsInteger    := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;
         FieldByName('NOME').AsString               := qryAux.FieldByName('NOME').AsString;
         FieldByName('PERIODICIDADE').AsString      := qryAux.FieldByName('PERIODICIDADE').AsString;
         FieldByName('NUMOPCOES').AsInteger         := qryAux.FieldByName('NUMOPCOES').AsInteger;
         FieldByName('NOMEVALORBASE1').AsString     := qryAux.FieldByName('NOMEVALORBASE1').AsString;
         FieldByName('NOMEVALORBASE2').AsString     := qryAux.FieldByName('NOMEVALORBASE2').AsString;
         FieldByName('NOMEVALORBASE3').AsString     := qryAux.FieldByName('NOMEVALORBASE3').AsString;
         if Trim(qryAux.FieldByName('QTDEPARCELAS').AsString) <> ''
         then FieldByName('QTDEPARCELAS').AsInteger := qryAux.FieldByName('QTDEPARCELAS').AsInteger;
         if Trim(sDataFinal) <> ''
         then FieldByName('DATAFINAL').AsDateTime   := StrToDate(sDataFinal);

         // Se for pagamento único, colocar como data inicio a data de hoje
         if qryAux.FieldByName('QtdeMeses').AsInteger = 0
         then FieldByName('DATAINICIO').AsDateTime       := date
         else FieldByName('DATAINICIO').AsDateTime       := qryPlanosPrev.FieldByName('INSCRICAODATA').AsDateTime;

         FieldByName('FLGCOBRA').AsInteger          := 1;
         FieldByName('FLGDESCFOLHA').AsInteger      := 1;

         If qryAux.FieldByName('IDTPPERIODICIDADE').AsString <> '' then
           FieldByName('IDTPPERIODICIDADE').AsInteger := qryAux.FieldByName('IDTPPERIODICIDADE').AsInteger;

         // André Pontes - pendência 26847 - 22/11/2007
         //FieldByName('ULTMESPREPARO').AsString      := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
         FieldByName('ULTMESPREPARO').AsString      := '0000/00';
         // FIM André Pontes - pendência 26847 - 22/11/2007

         FieldByName('VALORBASE1').AsFloat          := StrToFloat(ClienteNumero(sValorBase1));
         FieldByName('VALORBASE2').AsFloat          := StrToFloat(ClienteNumero(sValorBase2));
         FieldByName('VALORBASE3').AsFloat          := StrToFloat(ClienteNumero(sValorBase3));
         FieldByName('ASSOC1OP1').AsFloat           := StrToFloat(ClienteNumero(sAssoc1Op1));
         FieldByName('ASSOC1OP2').AsFloat           := StrToFloat(ClienteNumero(sAssoc1Op2));
         FieldByName('ASSOC1OP3').AsFloat           := StrToFloat(ClienteNumero(sAssoc1Op3));
         FieldByName('ASSOC2OP1').AsFloat           := StrToFloat(ClienteNumero(sAssoc2Op1));
         FieldByName('ASSOC2OP2').AsFloat           := StrToFloat(ClienteNumero(sAssoc2Op2));
         FieldByName('ASSOC2OP3').AsFloat           := StrToFloat(ClienteNumero(sAssoc2Op3));
         FieldByName('ASSOC3OP1').AsFloat           := StrToFloat(ClienteNumero(sAssoc3Op1));
         FieldByName('ASSOC3OP2').AsFloat           := StrToFloat(ClienteNumero(sAssoc3Op2));
         FieldByName('ASSOC3OP3').AsFloat           := StrToFloat(ClienteNumero(sAssoc3Op3));
         FieldByName('DIAVENCIMENTO').AsInteger     := 0;
         FieldByName('ULTANO13').AsInteger          := 0;
         Post;
      end; //with
      qryAux.Next;
   end;

   // *********************************************************************
   // ****** Inserir dotacao inicial, caso haja, da tabela DOTACAOINICIAL
   // ****** para  o Historico de Contribuicao
   // *********************************************************************
   frmAguarde.Mostra('Verificando contribuições ... ');

   if not GeraDotacaoInicial (dtmAPrev.qryAux,sMsgErro)
   then begin
      frmAguarde.Apaga;
      MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;
   frmAguarde.Apaga;

   If (prmFLGINSCSALZERO = 0) And (Trim(dbedSalPartInsc.Text) <> '')
    Then Begin
      // *********************************************************************
      // ****** Preparar as contribuicoes do participante :
      // ****** Se a inscricao for retroativa, preparar desde o inicio
      // ****** Senao, preparar a do mes
      // *********************************************************************

      frmAguarde.Mostra('Calculando contribuições ... ');
      if not PreparaContribuicoesInscricao(qryAux,sDataInicio,sMsgErro)
      then begin
         frmAguarde.Apaga;
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         Exit;
      end;
      frmAguarde.Apaga;

      // *********************************************************************
      // ****** Atualizando salarios
      // *********************************************************************
      frmAguarde.Mostra('Atualizando salários  ... ');
      if not AtualizaHstRubricaxPess(qryAux, sMsgErro)
      then begin
         frmAguarde.Apaga;
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         Exit;
      end;
    End
    Else MsgDlg('ATENÇÃO!!'+#13+#13+
                'As Contribuições do participante não foram preparadas/enviadas'+#13+
                'por não ter sido informado o salário de participação!!.','Informação Importante',mtInformation,[mbOk],0);
   frmAguarde.Apaga;

   Result := True;
end;

function  TfrmCadElegivel.AtualizaHstRubricaxPess(qryAux : TwwQuery; var sMsgErro : string) : boolean;
var sMesReferencia,
    sSalario13  : string;
    bAlgumEnviaValor : boolean;
begin
   Result := False;

   // Se o envio para a patrocinadora for de percentual ou nao houver envio,
   // nao fazer nada.
   // Se o envio for de valor, acrescentar o salario do participante na tabela
   // de total de salarios
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT CP.FLGTPVLR, PT.IDRUBSALPARTICIP '+
              ' FROM   PLANPREVPATRO PL, PATRO PT, CONTPLANPATRO CP  '+
              ' WHERE  PL.IDPESSJUR    = '+qryPlanosPrev.FieldByName('IdPessJur').AsString+
              ' AND    PL.IDPLANOPREV  = '+qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+
              ' AND    CP.IDPESSJUR    = PL.IDPESSJUR '+
              ' AND    CP.IDPLANOPREV  = CP.IDPLANOPREV '+
              ' AND    PT.IDPESSOA     = PL.IDPESSJUR        ');

      Open;

      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;

      First;
      bAlgumEnviaValor := False;
      while not Eof do
      begin
         if FieldbyName('FLGTPVLR').AsString = 'V'
         then bAlgumEnviaValor := True;
         Next;
      end;

      if not bAlgumEnviaValor 
      then begin
         Result := True;
         Exit;
      end;
   end; // with

   sMesReferencia := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                     Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
   
   qryHstRubricaxPess.Close;
   qryHstRubricaxPess.ParamByName('IdPessoa').AsInteger     := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
   qryHstRubricaxPess.ParamByName('IdPlanoPrev').AsInteger  := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
   qryHstRubricaxPess.ParamByName('MesReferencia').AsString := sMesReferencia;
   qryHstRubricaxPess.ParamByName('IdRubrica').AsInteger    := qryAux.FieldByName('IDRUBSALPARTICIP').AsInteger;
   qryHstRubricaxPess.Open;

   if qryHstRubricaxPess.IsEmpty
   then begin // nao houve recebimento do mes ainda
      Result := True;
      Exit;
   end;

   try
      qryHstRubricaxPess.Edit;
      qryHstRubricaxPess.FieldByName('ValorAcumulado').AsFloat :=
                       (qryHstRubricaxPess.FieldByName('ValorAcumulado').AsFloat +
                        qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsFloat);

      qryHstRubricaxPess.Post;
   except
      sMsgErro := 'Erro ao atualizar salário total da patrocinadora.';
      Exit;
   end;

   // Verificar se o 13o. do ano já foi calculado
   // Se sim, acrescentar em seu valor o valor do salario de participacao
   sMesReferencia   := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/13';

   qryHstRubricaxPess.Close;
   qryHstRubricaxPess.ParamByName('IdPessoa').AsInteger     := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
   qryHstRubricaxPess.ParamByName('IdPlanoPrev').AsInteger  := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
   qryHstRubricaxPess.ParamByName('MesReferencia').AsString := sMesReferencia;
   qryHstRubricaxPess.Open;

   if qryHstRubricaxPess.IsEmpty
   then begin // nao houve recebimento do mes ainda
      Result := True;
      Exit;
   end;

   sSalario13 := '0';
   with frmPedeInfAux do
   begin
      lblTitulo1.Caption   := 'Informe o valor do 13º salário no ano ' + Copy(FormatDateTime('dd/mm/yyyy', Date),7,4);

      ShowModal;
      if ModalResult = mrCancel
      then Exit;
      sSalario13 := ClienteNumero(edInf1.Text);
   end;
   
   try
      qryHstRubricaxPess.Edit;
      qryHstRubricaxPess.FieldByName('ValorAcumulado').AsFloat :=
                       (qryHstRubricaxPess.FieldByName('ValorAcumulado').AsFloat +
                        StrToFloat(sSalario13));

      qryHstRubricaxPess.Post;
   except
      sMsgErro := 'Erro ao atualizar 13º salário total da patrocinadora.';
      Exit;
   end;

   Result := True;
end; // AtualizaHstRubricaxPess

function  TfrmCadElegivel.GeraDotacaoInicial (qryAux : TwwQuery; var sMsgErro : string) : boolean;
var  sDataInicio,
     sDataInicioAux,
     sDataFinal,
     sAnoMesInicio,
     sAnoMesFinal,
     sAnoMesAtual,
     sIdRegraCalculo,
     sIdTpPeriodicidade : string;

     iNumRecebimento   : longint;
     iQuantOcorrencia,
     i                 : word;
     bInclui13         : boolean;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT D.IDPESSJUR, D.IDPLANOPREV, D.IDCONTRIBUICAO, D.IDPESSOA, '+
              '        D.VALOR, '+
              '        CP.IDCONTRIBPAI3,   CP.IDREGRACALCOP1,   CP.IDREGRACALCOP2, '+
              '        CP.IDREGRACALCOP3,  CP.NOMEVALORBASE1,   CP.NOMEVALORBASE2, '+
              '        CP.NOMEVALORBASE3,  CP.IDREGRACALCULO,   CP.IDREGRAPRIMPAGTO,'+
              '        CP.IDREGRAULTPAGTO, C.FLGOBRIGATORIA,    C.NOME, '+
              '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, CP.IDREGRAVALIDAOP3, '+
              '        C.QTDEPARCELAS,       C.IDTPPERIODICIDADE, TP.QTDEMESES, CP.FLGDESCFOLHA, '+
              '        CP.IDPLANOPREV,       CP.IDCONTRIBUICAO, TP.NOME AS PERIODICIDADE, '+
              '        CP.NUMOPCOES,         CP.IDREGRACALCULO13, CP.FLGCOBRA13DTFIM,  '+
              '        CP.IDREGRAPRIMPGTO13, CP.IDREGRAULTPGTO13 '+
              ' FROM   DOTACAOINICIAL D, CONTRIBUICAO C, CONTPREV CP, TPPERIODICIDADE TP '+
              ' WHERE  D.IDPESSJUR         = '+qryPlanosPrev.FieldByName('IdPessJur').AsString+
              ' AND    D.IDPLANOPREV       = '+qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+
              ' AND    D.IDPESSOA          = '+qryPlanosPrev.FieldByName('IdPessoa').AsString+
              ' AND    D.IDPLANOPREV       = CP.IDPLANOPREV '+
              ' AND    D.IDCONTRIBUICAO    = CP.IDCONTRIBUICAO '+
              ' AND    CP.IDCONTRIBUICAO   = C.IDCONTRIBUICAO '+
              ' AND    C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) ');
      Open;
      if IsEmpty // participante nao tem dotacao
      then begin
         Result := True;
         Exit;
      end;
   end; // with

   // Ler parametros da dotacao
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DOT.DATAINICIO, DOT.QUANTOCORRENCIA, DOT.FLGINCLUI13, '+
              '        C.IDTPPERIODICIDADE, CP.IDREGRACALCULO               '+
              ' FROM   PARAMDOTACAO DOT, CONTPREV CP, CONTRIBUICAO C         '+
              ' WHERE  (DOT.IDPESSJUR      = '+qryPlanosPrev.FieldByName('IdPessJur').AsString+')'+
              ' AND    (DOT.IDPLANOPREV    = '+qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+')'+
              ' AND    (DOT.IDCONTRIBUICAO = '+qryAux.FieldByName('IdContribuicao').AsString+')'+
              ' AND    (DOT.IDPLANOPREV    = CP.IDPLANOPREV) '+
              ' AND    (DOT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
              ' AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO) ');
      Open;
      if IsEmpty then Exit;

      sDataInicioAux   := FormatDateTime('dd/mm/yyyy', FieldByName('DataInicio').AsDateTime);

      if FieldByName('DataInicio').AsDateTime > qryPlanosPrev.FieldByName('InscricaoData').AsDateTime Then
        sDataInicio := FormatDateTime('dd/mm/yyyy', FieldByName('DataInicio').AsDateTime)
      else
        sDataInicio := FormatDateTime('dd/mm/yyyy', qryPlanosPrev.FieldByName('InscricaoData').AsDateTime);
      
      iQuantOcorrencia   := FieldByName('QuantOcorrencia').AsInteger;

      sDataFinal   := FormatDateTime('dd/mm/yyyy', DiasUteis.SomaMeses(StrToDate(sDataInicioAux),iQuantOcorrencia));

      if FieldByName('IdTpPeriodicidade').AsInteger > 0 Then
        sIdTpPeriodicidade := FieldByName('IdTpPeriodicidade').AsString
      else
        sIdTpPeriodicidade := '';

      if FieldByName('IdRegraCalculo').AsInteger > 0 Then
        sIdRegraCalculo := FieldByName('IdRegraCalculo').AsString
      else
        sIdRegraCalculo := '';

      bInclui13               := (FieldByName('FlgInclui13').AsInteger = 1);
      Close;
   end;
   sAnoMesInicio    := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);
   sAnoMesAtual     := sAnoMesInicio;
   sAnoMesFinal     := Copy(sDataFinal,7,4)+'/'+Copy(sDataFinal,4,2);

   while not qryAux.Eof do
   begin
      // Associar a contribuicao de DOTACAO ao participante, gravando na CONTRIBPREVPARTP
      with qryContribPrevPartP do
      begin
         Insert;
         FieldByName('IDPESSOA').AsInteger          := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
         FieldByName('IDPESSJUR').AsInteger         := qryPlanosPrev.FieldByName('IDPESSJUR').AsInteger;
         FieldByName('IDPLANOPREV').AsInteger       := qryPlanosPrev.FieldByName('IDPLANOPREV').AsInteger;
         FieldByName('SEQPROPOSTA').AsInteger       := qryPlanosPrev.FieldByName('SEQPROPOSTA').AsInteger;
         FieldByName('IDCONTRIBUICAO').AsInteger    := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;
         FieldByName('NOME').AsString               := qryAux.FieldByName('NOME').AsString;
         FieldByName('PERIODICIDADE').AsString      := qryAux.FieldByName('PERIODICIDADE').AsString;
         FieldByName('NUMOPCOES').AsInteger         := qryAux.FieldByName('NUMOPCOES').AsInteger;
         FieldByName('NOMEVALORBASE1').AsString     := qryAux.FieldByName('NOMEVALORBASE1').AsString;
         FieldByName('NOMEVALORBASE2').AsString     := qryAux.FieldByName('NOMEVALORBASE2').AsString;
         FieldByName('NOMEVALORBASE3').AsString     := qryAux.FieldByName('NOMEVALORBASE3').AsString;
         if Trim(qryAux.FieldByName('QTDEPARCELAS').AsString) <> ''
         then FieldByName('QTDEPARCELAS').AsInteger := qryAux.FieldByName('QTDEPARCELAS').AsInteger;
         if Trim(sDataFinal) <> ''
         then FieldByName('DATAFINAL').AsDateTime   := StrToDate(sDataFinal);
         FieldByName('DATAINICIO').AsDateTime       := qryPlanosPrev.FieldByName('INSCRICAODATA').AsDateTime;
         FieldByName('FLGCOBRA').AsInteger          := 0;
         FieldByName('FLGDESCFOLHA').AsInteger      := 1;

         If qryAux.FieldByName('IDTPPERIODICIDADE').AsString <> '' Then
           FieldByName('IDTPPERIODICIDADE').AsInteger := qryAux.FieldByName('IDTPPERIODICIDADE').AsInteger;

         // André Pontes - pendência 26847 - 22/11/2007
         //FieldByName('ULTMESPREPARO').AsString      := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
         FieldByName('ULTMESPREPARO').AsString      := '0000/00';
         // FIM André Pontes - pendência 26847 - 22/11/2007

         FieldByName('VALORBASE1').AsFloat          := 0;
         FieldByName('VALORBASE2').AsFloat          := 0;
         FieldByName('VALORBASE3').AsFloat          := 0;
         FieldByName('ASSOC1OP1').AsFloat           := 0;
         FieldByName('ASSOC1OP2').AsFloat           := 0;
         FieldByName('ASSOC1OP3').AsFloat           := 0;
         FieldByName('ASSOC2OP1').AsFloat           := 0;
         FieldByName('ASSOC2OP2').AsFloat           := 0;
         FieldByName('ASSOC2OP3').AsFloat           := 0;
         FieldByName('ASSOC3OP1').AsFloat           := 0;
         FieldByName('ASSOC3OP2').AsFloat           := 0;
         FieldByName('ASSOC3OP3').AsFloat           := 0;
         FieldByName('DIAVENCIMENTO').AsInteger     := 0;
         Post;
      end; //with

      while sAnoMesAtual <= sAnoMesFinal do
      begin
        iNumRecebimento := LeUltRegistro(dtmAPrev.qry,'HSTCONTRIBPREV');

        // Inserir valor da dotacao na HSTCONTRIBPREV
        with qryHstContribPrev do
        begin
           Insert;
           FieldByName('MESREFERENCIA').AsString      := sAnoMesAtual;
           FieldByName('MESCOBRANCA').AsString        := sAnoMesAtual;
           FieldByName('NUMRECEBIMENTO').AsInteger    := iNumRecebimento;
           FieldByName('IDMOTIVO').AsInteger          := prmIdMotivoContrib;
           FieldByName('NOME').AsString               := qryAux.FieldByName('Nome').AsString;
           FieldByName('DATAPREVISAORECE').AsDateTime := StrToDate(sDataInicio);
           FieldByName('VALORESPERADO').AsFloat       := qryAux.FieldByName('Valor').AsFloat;
           FieldByName('VALORCALCULADO').AsFloat      := qryAux.FieldByName('Valor').AsFloat;
           FieldByName('VALORRECEBIDO').AsFloat       := qryAux.FieldByName('Valor').AsFloat;
           if Trim(sIdRegraCalculo) <> ''
           then FieldByName('IDREGRACALCULO').AsInteger    := StrToInt(sIdRegraCalculo);
           FieldByName('FLGDESCFOLHA').AsInteger      := 1;
           FieldByName('FOLHAORIGEM').AsString        := 'P';  
           FieldByName('IDPESSOA').AsInteger          := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
           FieldByName('SEQPROPOSTA').AsInteger       := qryPlanosPrev.FieldByName('SeqProposta').AsInteger;
           FieldByName('IDPESSJUR').AsInteger         := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
           FieldByName('IDPLANOPREV').AsInteger       := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
           FieldByName('IDCONTRIBUICAO').AsInteger    := qryAux.FieldByName('IdContribuicao').AsInteger;
           FieldByName('FLGCALCRESERVA').AsInteger    := 0;
           FieldByName('FLGEVENTO').AsInteger         := 1;
           FieldByName('DATAINICIO').AsDateTime       := StrToDate(sDataInicio);
           if Trim(sDataFinal) <> ''
           then FieldByName('DATAFINAL').AsDateTime   := StrToDate(sDataFinal);
           FieldByName('FLGSITFUNDACAO').AsString     := qrySitPart.FieldByName('FlgInterno').AsString;
           FieldByName('SITRECEBIMENTO').AsInteger    := 2;
           FieldByName('TIPO').AsString               := 'F';
           FieldByName('PARCELA').AsInteger           := 0;
           Post;
        end; //with

        // Incluir contribuicao sobre 13o.
        if (bInclui13)
        then begin
           iNumRecebimento := LeUltRegistro(dtmAPrev.qry,'HSTCONTRIBPREV');
           with qryHstContribPrev do
           begin
              Insert;
              FieldByName('MESREFERENCIA').AsString      := Copy(sAnoMesAtual,1,5)+'13';
              FieldByName('MESCOBRANCA').AsString        := sAnoMesAtual;
              FieldByName('NUMRECEBIMENTO').AsInteger    := iNumRecebimento;
              FieldByName('IDMOTIVO').AsInteger          := prmIdMotivoContrib;
              FieldByName('NOME').AsString               := qryAux.FieldByName('Nome').AsString;
              FieldByName('DATAPREVISAORECE').AsDateTime := StrToDate(sDataInicio);
              FieldByName('VALORESPERADO').AsFloat       := qryAux.FieldByName('Valor').AsFloat;
              FieldByName('VALORCALCULADO').AsFloat      := qryAux.FieldByName('Valor').AsFloat;
              FieldByName('VALORRECEBIDO').AsFloat       := qryAux.FieldByName('Valor').AsFloat;
              if Trim(sIdRegraCalculo) <> ''
              then FieldByName('IDREGRACALCULO').AsInteger    := StrToInt(sIdRegraCalculo);
              FieldByName('FLGDESCFOLHA').AsInteger      := 1;
              FieldByName('FOLHAORIGEM').AsString        := 'P';  
              FieldByName('IDPESSOA').AsInteger          := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
              FieldByName('SEQPROPOSTA').AsInteger       := qryPlanosPrev.FieldByName('SeqProposta').AsInteger;
              FieldByName('IDPESSJUR').AsInteger         := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
              FieldByName('IDPLANOPREV').AsInteger       := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
              FieldByName('IDCONTRIBUICAO').AsInteger    := qryAux.FieldByName('IdContribuicao').AsInteger;
              FieldByName('FLGCALCRESERVA').AsInteger    := 0;
              FieldByName('FLGEVENTO').AsInteger         := 1;
              FieldByName('DATAINICIO').AsDateTime       := StrToDate(sDataInicio);
              if Trim(sDataFinal) <> ''
              then FieldByName('DATAFINAL').AsDateTime        := StrToDate(sDataFinal);
              FieldByName('FLGSITFUNDACAO').AsString     := qrySitPart.FieldByName('FlgInterno').AsString;
              FieldByName('SITRECEBIMENTO').AsInteger    := 2;
              FieldByName('TIPO').AsString               := 'F';
              FieldByName('PARCELA').AsInteger           := 0;
              Post;
           end; //with
        end; // if

        sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
      end; // while 2
      qryAux.Next;
   end; // while 1

   Result := True;
end; // GeraDotacaoInicial

procedure TfrmCadElegivel.CalculaOpcoesContrib(pqryAux : TwwQuery;
                               var sValorBase1, sValorBase2, sValorBase3,
                                   sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                                   sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                                   sAssoc1Op3, sAssoc2Op3, sAssoc3Op3 : string);
var  sSQL  : string;
     bErro : boolean;
begin
   sValorBase1 := '0';
   sValorBase2 := '0';
   sValorBase3 := '0';

   sAssoc1Op1 := '0';
   sAssoc1Op2 := '0';
   sAssoc1Op3 := '0';

   sAssoc2Op1 := '0';
   sAssoc2Op2 := '0';
   sAssoc2Op3 := '0';

   sAssoc3Op1 := '0';
   sAssoc3Op2 := '0';
   sAssoc3Op3 := '0';

   if (pqryAux.FieldByName('IdRegraCalcOp1').AsString = '') and
      (pqryAux.FieldByName('IdRegraCalcOp2').AsString = '') and
      (pqryAux.FieldByName('IdRegraCalcOp3').AsString = '')
   then Exit;

   // *********************************************************************
   // ****** Buscar valores das contribuicoes asssociadas, caso hajam
   // *********************************************************************
   // Buscar valores da 1a. contribuicao associada
   if pqryAux.FieldByName('IdContribPai').AsString <> ''
   then begin
        with qryContribPrevPartP do
        begin
           if Locate('IdContribuicao',pqryAux.FieldByName('IdContribPai').AsInteger,[loCaseInsensitive])
           then begin
              sAssoc1Op1 := OraNumero(FieldByName('ValorBase1').AsString);
              sAssoc1Op2 := OraNumero(FieldByName('ValorBase2').AsString);
              sAssoc1Op3 := OraNumero(FieldByName('ValorBase3').AsString);
           end;
        end;
   end;

   // Buscar valores da 2a. contribuicao associada
   if pqryAux.FieldByName('IdContribPai2').AsString <> ''
   then begin
        with qryContribPrevPartP do
        begin
           if Locate('IdContribuicao',pqryAux.FieldByName('IdContribPai2').AsInteger,[loCaseInsensitive])
           then begin
              sAssoc2Op1 := OraNumero(FieldByName('ValorBase1').AsString);
              sAssoc2Op2 := OraNumero(FieldByName('ValorBase2').AsString);
              sAssoc2Op3 := OraNumero(FieldByName('ValorBase3').AsString);
           end;
        end;
   end;

   // Buscar valores da 3a. contribuicao associada
   if pqryAux.FieldByName('IdContribPai3').AsString <> ''
   then begin
        with qryContribPrevPartP do
        begin
           if Locate('IdContribuicao',pqryAux.FieldByName('IdContribPai3').AsInteger,[loCaseInsensitive])
           then begin
              sAssoc3Op1 := OraNumero(FieldByName('ValorBase1').AsString);
              sAssoc3Op2 := OraNumero(FieldByName('ValorBase2').AsString);
              sAssoc3Op3 := OraNumero(FieldByName('ValorBase3').AsString);
           end;
        end;
   end;

   //==========================
   //==== Verifica campos nulos  

   if (sAssoc1Op1 = '') then  sAssoc1Op1 := '0';
   if (sAssoc1Op2 = '') then  sAssoc1Op2 := '0';
   if (sAssoc1Op3 = '') then  sAssoc1Op3 := '0';

   if (sAssoc2Op1 = '') then  sAssoc2Op1 := '0';
   if (sAssoc2Op2 = '') then  sAssoc2Op2 := '0';
   if (sAssoc2Op3 = '') then  sAssoc2Op3 := '0';

   if (sAssoc3Op1 = '') then  sAssoc3Op1 := '0';
   if (sAssoc3Op2 = '') then  sAssoc3Op2 := '0';
   if (sAssoc3Op3 = '') then  sAssoc3Op3 := '0';
   
   // *********************************************************************
   // ****** Preencher SQL para rodar regras
   // *********************************************************************
   sSQL := ' SELECT '+qryPlanosPrev.FieldByName('IdPessoa').AsString+' AS IDPESSOA,  '+
                      qryPlanosPrev.FieldByName('IdPessJur').AsString+' AS IDPESSJUR, '+
                      qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                      pqryAux.FieldByName('IdContribuicao').AsString+ ' AS IDCONTRIBUICAO, '+
                  ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString +'''  AS INSCRICAODATA, '+
                  ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString  +'''  AS DTINICIOINSC, '+
                  ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString  +'''  AS INSCRICAODATAFUND, '+
                  OraNumero(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString)+ ' AS VALORPROVENTO, '+
                  ''''+qryPessoaFisica.FieldByName('DataNasc').AsString+'''  AS DATANASC, '+
                  ''''+qryPessoaFisica.FieldByName('Sexo').AsString+''' AS SEXO, '+
                  ''''+OraNumero(qryElegPatro.FieldByName('TempoServAnterior').AsString)+''' AS TEMPOSERVANTERIOR, '+
                  ''''+OraNumero(qryElegPatro.FieldByName('TEMPONAOCREDITADO').AsString)+''' AS TEMPONAOCREDITADO, '+
                  ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString+''' AS DATAADMISSAO, '+
                  ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString+''' AS DATADEMISSAO, '+
                  OraNumero(sValorBase1)+' AS VALORBASE1, '+
                  OraNumero(sValorBase2)+' AS VALORBASE2, '+
                  OraNumero(sValorBase3)+' AS VALORBASE3, '+
                  OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+
                  OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+
                  OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+
                  OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+
                  OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+
                  OraNumero(sAssoc3Op2)+' AS ASSOC3OP3, '+
                  OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
                  OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
                  OraNumero(sAssoc3Op3)+' AS ASSOC3OP3, '+
                  ' 0 AS PARTREINSC, '+
                  ' 0 AS RESGPOUPANCA, '+
                  ' ''0000/00'' AS ULTMESPREPARO '+
           ' FROM   DUAL ';

   // *********************************************************************
   // ****** Executar regras de calculo de opcao
   // *********************************************************************
   // Executar regra da 1a. opcao de contribuicao
   if Trim(pqryAux.FieldByName('IdRegraCalcOp1').AsString) <> ''
   then begin
      try
         sValorBase1 := RegraNumerica(pqryAux.FieldByName('IdRegraCalcOp1').AsString,sSQL,bErro, iIdCalculoGeral);
      except
         MsgDlg('A Regra de Cálculo da Opção '+pqryAux.FieldByName('NomeValorBase1').AsString+
                ' - nº '+pqryAux.FieldByName('IdRegraCalcOp1').AsString+' - '+
                ' retornou um valor inválido = '+sValorBase1,'Erro',mtError,[mbOk,mbHelp],0);
         TiraSQL(dtmaprev.qryAux);
         Exit;
      end;
      sValorBase1 := OraNumero(sValorBase1);
   end; // if idregracalcop1 <> ''

   // Executar regra da 2a. opcao de contribuicao
   if Trim(pqryAux.FieldByName('IdRegraCalcOp2').AsString) <> ''
   then begin
      try
         sValorBase2 := RegraNumerica(pqryAux.FieldByName('IdRegraCalcOp2').AsString,sSQL,bErro, iIdCalculoGeral);
      except
         MsgDlg('A Regra de Cálculo da Opção '+pqryAux.FieldByName('NomeValorBase2').AsString+
                ' - nº '+pqryAux.FieldByName('IdRegraCalcOp2').AsString+' - '+
                ' retornou um valor inválido = '+sValorBase2,'Erro',mtError,[mbOk,mbHelp],0);
         TiraSQL(dtmaprev.qryAux);
         Exit;
      end;
      sValorBase2 := OraNumero(sValorBase2);
   end; // if idregracalcop2 <> ''

   // Executar regra da 3a. opcao de contribuicao
   if Trim(pqryAux.FieldByName('IdRegraCalcOp3').AsString) <> ''
   then begin
      try
         sValorBase3 := RegraNumerica(pqryAux.FieldByName('IdRegraCalcOp3').AsString,sSQL,bErro, iIdCalculoGeral);
      except
         MsgDlg('A Regra de Cálculo da Opção '+pqryAux.FieldByName('NomeValorBase3').AsString+
                ' - nº '+pqryAux.FieldByName('IdRegraCalcOp3').AsString+' - '+
                ' retornou um valor inválido = '+sValorBase3,'Erro',mtError,[mbOk,mbHelp],0);
         TiraSQL(dtmaprev.qryAux);
         Exit;
      end;
      sValorBase3 := OraNumero(sValorBase3);
   end; // if idregracalcop3 <> ''
end; // CalculaOpcoesContrib

function TfrmCadElegivel.LerOpcoesContrib(pqryAux : TwwQuery;
                               var sValorBase1, sValorBase2, sValorBase3 : string) : boolean ;
var  sSQL  : string;
     bErro : boolean;
     mrResultado : TModalResult;
begin
   Result := True;
   // Verificar se existe alguma opcao para pedir
   if ( (pqryAux.FieldByName('NumOpcoes').AsInteger = 1)       and
        (pqryAux.FieldByName('IdRegraCalcOp1').AsString <> '')     ) or
      ( (pqryAux.FieldByName('NumOpcoes').AsInteger = 2)       and
        (pqryAux.FieldByName('IdRegraCalcOp1').AsString <> '') and
        (pqryAux.FieldByName('IdRegraCalcOp2').AsString <> '')     ) or
      ( (pqryAux.FieldByName('NumOpcoes').AsInteger = 3)       and
        (pqryAux.FieldByName('IdRegraCalcOp1').AsString <> '') and
        (pqryAux.FieldByName('IdRegraCalcOp3').AsString <> '') and
        (pqryAux.FieldByName('IdRegraCalcOp4').AsString <> '')     )
   then Exit;

   frmLerOpcoesContribInscricao := TfrmLerOpcoesContribInscricao.Create(Application);

   with frmLerOpcoesContribInscricao do
   begin
      bAlgumaOpcaoInvalida := False;
      // Preencher sSQL com dados do participante para a regra de validacao
      sSQLRegraValidaOpInsc := ' SELECT '+qryPlanosPrev.FieldByName('IDPESSOA').AsString+       ' AS IDPESSOA,'+
                         qryPlanosPrev.FieldByName('IDPESSJUR').AsString+      ' AS IDPESSJUR,'+
                         qryPlanosPrev.FieldByName('IDPLANOPREV').AsString+    ' AS IDPLANOPREV,'+
                         qryPlanosPrev.FieldByName('SEQPROPOSTA').AsString+    ' AS SEQPROPOSTA,'+
               OraNumero(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString)+' AS SALPARTICIPACAO,'+  
               OraNumero(qryPlanosPrev.FieldByName('SALINSCRICAO').AsString)+   ' AS SALINSCRICAO,'+     
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString+'''  AS INSCRICAODATA, '+
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString+'''  AS DATAREF, '+
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString +'''  AS DTINICIOINSC, '+
                    ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString +'''  AS INSCRICAODATAFUND, '+
                    ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString+''' AS IDSITFUNC,'+
                    ''''+qryElegPatro.FieldByName('IDCARGOEXT').AsString+  ''' AS IDCARGOEXT,'+
                    ''''+qryElegPatro.FieldByName('NIVEL').AsString+    ''' AS NIVEL,'+
                    ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString+''' AS DATAADMISSAO,'+
                    ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString+''' AS DATADEMISSAO,'+
               OraNumero(qryElegPatro.FieldByName('SALTOTAL').AsString)+   '   AS SALTOTAL,'+           
                    ''''+OraNumero(qryElegPatro.FieldByName('TEMPONAOCREDITADO').AsString)+''' AS TEMPONAOCREDITADO,'+
                    ''''+OraNumero(qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString)+''' AS TEMPOSERVANTERIOR,'+
                    ''''+qryPessoaFisica.FieldByName('DATANASC').AsString+''' AS DATANASC,'+
                    ''''+qryPessoaFisica.FieldByName('DATAMORTE').AsString+''' AS DATAMORTE,'+
                    ''''+qryPessoaFisica.FieldByName('SEXO').AsString+''' AS SEXO,'+
                    ''''+qryPessoaFisica.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL,'+
                       ' 0 AS FLGFITESPECIAL , '+
                       ' 0 AS PARTREINSC, '+
                       ' 0 AS RESGPOUPANCA ';


      // preencher labels
      sRegraValidOp1 := pqryAux.FieldByName('IDREGRAVALIDAOP1').AsString;
      sRegraValidOp2 := pqryAux.FieldByName('IDREGRAVALIDAOP2').AsString;
      sRegraValidOp3 := pqryAux.FieldByName('IDREGRAVALIDAOP3').AsString;

      lblNomeContrib.Caption := pqryAux.FieldByName('Nome').AsString;

      //CPrev - 27298 - Inicio
      lblOp1.Visible := True;
      edOp1.Visible  := True;

      lblOp2.Visible := True;
      edOp2.Visible  := True;

      lblOp3.Visible := True;
      edOp3.Visible  := True;

      lblOp1.Visible := (pQryAux.FieldByName('NomeValorBase1').AsString <> '') And
                        (pqryAux.FieldByName('IDREGRAVALIDAOP1').AsString <> '');
      edOp1.Visible  := lblOp1.Visible;

      lblOp2.Visible := (pQryAux.FieldByName('NomeValorBase2').AsString <> '') And
                        (pqryAux.FieldByName('IDREGRAVALIDAOP2').AsString <> '');
      edOp2.Visible  := lblOp2.Visible;

      lblOp3.Visible := (pQryAux.FieldByName('NomeValorBase3').AsString <> '') And
                        (pqryAux.FieldByName('IDREGRAVALIDAOP3').AsString <> '');
      edOp3.Visible  := lblOp3.Visible;
      //CPrev - 27298 - Fim

      if Trim(pQryAux.FieldByName('NomeValorBase1').AsString) <> ''
      then lblOp1.Caption := pQryAux.FieldByName('NomeValorBase1').AsString
      else lblOp1.Caption := 'Opção 1';

      if Trim(pQryAux.FieldByName('NomeValorBase2').AsString) <> ''
      then lblOp2.Caption := pQryAux.FieldByName('NomeValorBase2').AsString
      else lblOp2.Caption := 'Opção 2';

      if Trim(pQryAux.FieldByName('NomeValorBase3').AsString) <> ''
      then lblOp3.Caption := pQryAux.FieldByName('NomeValorBase3').AsString
      else lblOp3.Caption := 'Opção 3';

      // preencher edits
      if (Trim(sValorBase1) <> '') and (Trim(sValorBase1) <> '0') and
         (pqryAux.FieldByName('IdRegraCalcOp1').AsString <> '')
      then begin
         edOp1.Enabled := False;
         edOp1.Color   := clSilver;
         edOp1.Text    := OraNumero(sValorBase1);
      end
      else begin
         edOp1.Enabled := True;
         edOp1.Color   := clWindow;
         edOp1.Text    := '';
      end;

      if (Trim(sValorBase2) <> '') and (Trim(sValorBase2) <> '0') and
         (pqryAux.FieldByName('IdRegraCalcOp2').AsString <> '')
      then begin
         edOp2.Enabled := False;
         edOp2.Color   := clSilver;
         edOp2.Text    := OraNumero(sValorBase2);
      end
      else begin
         edOp2.Enabled := True;
         edOp2.Color   := clWindow;
         edOp2.Text    := '';
      end;

      if (Trim(sValorBase3) <> '') and (Trim(sValorBase3) <> '0') and
         (pqryAux.FieldByName('IdRegraCalcOp3').AsString <> '')
      then begin
         edOp3.Enabled := False;
         edOp3.Color   := clSilver;
         edOp3.Text    := OraNumero(sValorBase3);
      end
      else begin
         edOp3.Enabled := True;
         edOp3.Color   := clWindow;
         edOp3.Text    := '';
      end;

      // Exibir forms
      mrResultado := ShowModal;

      if mrResultado <> mrOK then Result := False;

      if bAlgumaOpcaoInvalida   then Result := False;

      // Ler valores
      if edOp1.Enabled then sValorBase1 := OraNumero(Trim(edOp1.Text));
      if edOp2.Enabled then sValorBase2 := OraNumero(Trim(edOp2.Text));
      if edOp3.Enabled then sValorBase3 := OraNumero(Trim(edOp3.Text));
   end; //with
   frmLerOpcoesContribInscricao.Free;
end; // LerOpcoesContrib

function TfrmCadElegivel.PreparaContribuicoesInscricao(pQryAux : TwwQuery;
                                       psDataInicio : string;
                                       var sMsgErro : string) : boolean;
var sMesHoje, sAnoHoje, sAnoMesHoje,
    sAnoMesInicio,   sAnoMesAtual,
    sAnoMesCobranca, sDataCobranca,
    sAnoMesFinal,
    sAnoMesCalc13Aux,
    sAno, sMes,
    sDataRef,
    sSitFundacao,
    sSalarioPart, sSalarioAux,
    sDataFinal,
    sDataDeveriaTerPago,
    sValorFinal,
    sValorAssociado,
    sValorAssociado2,
    sValorAssociado3,
    sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
    sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
    sAssoc1Op3, sAssoc2Op3, sAssoc3Op3,
    sValorRegra,
    sCodProvDesc,
    sIdRubrica,
    sFlgCompoeRemTotal,
    sFlgCompoeSalBenef,
    sFlgCompoeSalPart,
    sFlgIRRF,
    sIdRegraCalculo,
    sTpPagto,
    sMsgRegra,
    sIdRegra,
    sDataFinalRegra,
    sSQLRegraAux    : string;
    iSitRecebimento : integer;

    iNumReg,
    iIdLote,
    iParcela,
    iNumRecebimento,
    iIdContribuicao : longint;

    rTotalLote : double;
    bGravouSalario,
    bErro,
    bCalc13, bCalc13DtFim, bJaPerguntouContribZERO : boolean;
    varFields : variant;

    sRubricasGeradas,
    sNomeRubrica : string;
    iFlgSRB,
    iTipoRubrica : word;
begin
   Result  := False;
   bCalc13DtFim := False;  

   if qryContribPrevPartP.IsEmpty
   then begin
      Result := True;
      Exit;
   end;

   // *********************************************************************
   // ****** Preencher variaveis globais ao calculo
   // *********************************************************************
   if StrToDate(psDataInicio) <= date Then
   begin
      sAnoMesHoje := Copy(FormatDateTime('dd/mm/yyyy', Date), 7,4) + '/' +
                     Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);

      sMesHoje    := Copy(sAnoMesHoje,6,2);
      sAnoHoje    := Copy(sAnoMesHoje,1,4);
   end
   else
   begin
      sAnoMesHoje := Copy(psDataInicio, 7,4)+'/'+Copy(psDataInicio,4,2);
      sMesHoje    := Copy(sAnoMesHoje,6,2);
      sAnoHoje    := Copy(sAnoMesHoje,1,4);
   end;

   sAnoMesInicio   := Copy(psDataInicio, 7,4) + '/' + Copy(psDataInicio, 4,2);

   sSitFundacao    := qrySitPart.FieldByName('FlgInterno').AsString;
   sSalarioPart    := qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString;
   sSalarioAux     := sSalarioPart;
   sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             qryPlanosPrev.FieldByName('IDPESSJUR').AsString,
                                             qryPlanosPrev.FieldByName('IDPLANOPREV').AsString,
                                             sSitFundacao, 'N',
                                             sMesHoje, sAnoHoje);

   if Trim(sDataCobranca) = '' Then sDataCobranca := FormatDateTime('dd/mm/yyyy', Date);

   sAnoMesCobranca := sAnoMesHoje;

   sAnoMesAtual    := sAnoMesInicio;
   
   // *********************************************************************
   // ****** Gerar lote de contribuicao
   // *********************************************************************
   iIdLote := LeUltRegistro(dtmAPrev.qry,'CTRLINTERFACE');
   with qryCtrlInterface do
   begin
      Insert;
      FieldByName('IDLOTE').AsInteger           := iIdLote;
      FieldByName('IDPESSOA').AsInteger         := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
      FieldByName('DATAPREPARO').AsDateTime     := date;
      FieldByName('DESCRICAO').AsString         := 'Matrícula : '+qryElegPatro.FieldByName('Matricula').AsString+' - '+
                                                    'Contribuição de '+qrySitPart.FieldByName('Descricao').AsString;
      FieldByName('FLGATRASODEVOL').AsString    :=  'R';
      FieldByName('FLGIDAINTERFACE').AsInteger  := 0;
      FieldByName('FLGIDATMP').AsInteger        := 0;
      FieldByName('FLGPREPARADO').AsInteger     := 1;
      FieldByName('FLGVOLTAINTERFACE').AsInteger:= 0;
      FieldByName('FLGVOLTATMP').AsInteger      := 0;
      FieldByName('MESREFERENCIA').AsString     := sAnoMesHoje;
      FieldByName('NUMREG').AsInteger           := 0;
      FieldByName('TIPO').AsString              := 'P';
      FieldByName('VLRTOTAL').AsFloat           := 0;
      Post;
   end;

   // Abrir query de Rubricas Salariais, para verificar se ele já possuia rubricas
   // como elegivel, neste caso, atualizar o flgSRB, ou se nao possuia,
   // neste caso inserir
   qryHstRubSal.Close;
   qryHstRubSal.ParamByName('IdPessoa').AsInteger     := qryPlanosPrev.FieldByName('IdPessoa').AsInteger;
   qryHstRubSal.ParamByName('IdPessJur').AsInteger    := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
   qryHstRubSal.Open;


   // A qry está com as contribuicoes da CONTRIBPREVPARTP que devem
   // ser preparadas
   iNumReg  := 0;
   rTotalLote := 0;
   bGravouSalario := False;
   qryContribPrevPartP.First;
   while not qryContribPrevPartP.eof do
   begin
      if not pQryAux.Locate('IdContribuicao',qryContribPrevPartP.FieldByName('IdContribuicao').AsInteger,[loCaseInsensitive])
      then begin
         qryContribPrevPartP.Next;
         continue;
      end;

      // Se nao for contribuicao paga pelo participate, não preparar, pois ela
      // será preparada na volta (recebimento) do interface
      if pQryAux.FieldByName('FlgPagador').AsString <> 'C'
      then begin
         qryContribPrevPartP.Next;
         continue;
      end;

      // Se nao tiver data final -> gerar até hoje
      // Se tiver e for menor que hoje -> gerar até a data
      // Se tiver e for maior que hoje -> gerar até hoje
      // Se data hoje < data inicio -> gerar até inicio
      sDataFinal := qryContribPrevPartP.FieldByName('DataFinal').AsString;
      if sDataFinal    = ''
      then sAnoMesFinal  := sAnoMesHoje
      else if StrToDate(sDataFinal) < Date
           then sAnoMesFinal    := Copy(sDataFinal,7,4)+'/'+ Copy(sDataFinal,4,2)
           else sAnoMesFinal    := sAnoMesHoje;

      // Se o anomesfinal for menor que o anomes inicio, não é para preparar a contribuicao
      if sAnoMesFinal < sAnoMesInicio
      then begin
         qryContribPrevPartP.Next;
         continue;
      end;

      // Preencher variavel mes atual com o mes que esta sendo preparado no loop
      if ((pqryAux.FieldByName('QtdeParcelas').AsString <> '') and
          (pqryAux.FieldByName('QtdeParcelas').AsInteger <= 1) ) or
         (pqryAux.FieldByName('QtdeMeses').AsInteger <= 0)
      then sAnoMesAtual := sAnoMesFinal
      else sAnoMesAtual := sAnoMesInicio;

      bCalc13 := true;
      bJaPerguntouContribZERO := False;
      iParcela := 0;
      while (sAnoMesAtual <= sAnoMesFinal) do
      begin
         // Grava sitrecebimento=4, para contrib. atrasadas retroativas a insc.
         if sAnoMesAtual < sAnoMesFinal
         then iSitRecebimento := 4
         else iSitRecebimento := 0;

         iIdContribuicao := qryContribPrevPartP.fieldbyname('IdContribuicao').AsInteger;
         sSalarioPart    := sSalarioAux;

         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         if ((copy(sAnoMesAtual,6,2) = '12') or (bCalc13DtFim)) and ( not bCalc13 )
         then sAnoMesCalc13Aux := copy(sAnoMesAtual,1,5)+'13'
         else sAnoMesCalc13Aux := sAnoMesAtual;

         // Verificar se é o primeiro ou ultimo pagamento. Se for, e nao for pagamento unico,
         // e nao tiver regra de primeiro/ultimo pagamento, calcular
         // um pro-rata do salario para passar para a regra normal de calculo
         // da contribuicao
         if (sAnoMesAtual = sAnoMesInicio) and
            (pqryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString = '') and
            (Trim(sSalarioPart) <> '')
         then begin
             sSalarioPart := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioPart,psDataInicio)));
         end
         else begin
            if (sAnoMesAtual = sAnoMesFinal) and
               (sDataFinal <> '')         and
               (sAnoMesFinal <= sAnoMesHoje) and
               (pqryAux.FieldbyName('IDREGRAULTPAGTO').AsString <> '') and
               (Trim(sSalarioPart) <> '')
            then begin
               sSalarioPart := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,sDataFinal)));
            end;
         end;

         // Se  o mês for 13, calcular o salario de 13o.
         if (Copy(sAnoMesCalc13Aux,6,2) = '13')
         then begin
            // Calcular salario 13o.
            dtmAPrev.qry.Close;
            dtmAPrev.qry.SQL.Clear;
            dtmAPrev.qry.SQL.Add(' SELECT IDREGRA AS IDRGSALARIO13 FROM PARAMSAL13  '+
                                 ' WHERE  IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString+
                                 ' AND    EXERCICIO = '+Copy(sAnoMesCalc13Aux,1,4) );
            dtmAPrev.qry.Open;
            if dtmAPrev.qry.FieldByName('IDRGSALARIO13').AsInteger > 0
            then begin
               sDataRef := '30/12/'+Copy(sAnoMesCalc13Aux,1,4);

               sSQLRegraAux := ' SELECT '+OraNumero(sSalarioPart)                                  +'   AS VALORPROVENTO, '+
                                     ''''+qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString   +''' AS TEMPOSERVANTERIOR, '+
                                     ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString        +''' AS  DATAADMISSAO, '+
                                OraNumero(qryElegPatro.FieldByName('SALTOTAL').AsString)           +'   AS SALTOTAL, '+
                                OraNumero(qryElegPatro.FieldByName('TEMPONAOCREDITADO').AsString)  +'   AS TEMPONAOCREDITADO, '+
                                     ''''+qryPessoaFisica.FieldByName('DATANASC').AsString         +''' AS DATANASC, '+
                                     ''''+qryPessoaFisica.FieldByName('SEXO').AsString             +''' AS SEXO, '+
                                OraNumero(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString)   +'   AS SALPARTICIPACAO, '+
                                     ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString      +''' AS INSCRICAODATA, '+
                                     ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString      +''' AS DTINICIOINSC, '+
                                     ''''+qrySitPart.FieldByName('FLGINTERNO').AsString            +''' AS FLGINTERNO, '+
                                     ''''+qrySitPart.FieldByName('FLGINTERNO').AsString            +''' AS FLGSITPART, '+
                                     ''''+Copy(sDataRef,7,4)+'/'+Copy(sDataRef,4,2)                +''' AS MESREFERENCIA, '+
                                     ''''+sDataRef                                                 +''' AS DATAREF, '+
                                     // passar data de admissao como data de inicio pois o 13o. baseia-se nesta data
                                     ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString        +''' AS DATAINICIO, '+
                                     ''''+PreparaStr(sDataFinalRegra,10)                                      +''' AS DATAFINAL,  '+
                                     '''IP''                                                            AS FLGINTEVENTO, '+
                                     '0                                                                 AS PARTREINSC, '+
                                     qryPlanosPrev.FieldByName('IDPLANOPREV').AsString             +'   AS IDPLANOPREV,       '+
                                     
                                     inttostr(qryElegPatro.FieldByName('IDPESSJUR').asinteger)+' AS IDPESSJUR, '+
                                     inttostr(qryElegPatro.FieldByName('FLGDIRETOR').asinteger)+' AS FLGDIRETOR, '+
                                     
                                     qryPlanosPrev.FieldByName('IDPESSOA').AsString                +'   AS IDPESSOA,          '+
                                     qryPlanosPrev.FieldByName('SEQPROPOSTA').AsString             +'   AS SEQPROPOSTA,       '+
                                     qryContribPrevPartP.FieldByName('IDCONTRIBUICAO').AsString    +'   AS IDCONTRIBUICAO,    '+
                                ''''+qryContribPrevPartP.FieldByName('DIAVENCIMENTO').AsString     +''' AS DIAVENCIMENTO,     '+
                           OraNumero(qryContribPrevPartP.FieldByName('VALORBASE1').AsString)       +'   AS VALORBASE1,        '+
                           OraNumero(qryContribPrevPartP.FieldByName('VALORBASE2').AsString)       +'   AS VALORBASE2,        '+
                           OraNumero(qryContribPrevPartP.FieldByName('VALORBASE3').AsString)       +'   AS VALORBASE3,        '+
                                ''''+qryContribPrevPartP.FieldByName('QTDEPARCELAS').AsString      +''' AS QTDEPARCELAS,      '+
                                ''''+qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString        +''' AS TEMPOSERVANTERIOR, '+
                                ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString             +''' AS DATAADMISSAO,      '+
                                ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString             +''' AS DATADEMISSAO,      '+
                                ''''+sAnoMesCalc13Aux                                              +''' AS ANOMESREF,         '+
                           OraNumero(qryElegPatro.FieldByName('SALTOTAL').AsString)                +'   AS SALTOTAL,          '+
                           OraNumero(qryElegPatro.FieldByName('TEMPONAOCREDITADO').AsString)       +'   AS TEMPONAOCREDITADO, '+
                                ''''+qryPessoaFisica.FieldByName('DATANASC').AsString              +''' AS DATANASC,          '+
                                ''''+qryPessoaFisica.FieldByName('SEXO').AsString                  +''' AS SEXO,              '+
                           OraNumero(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString)        +'   AS SALPARTICIPACAO,   '+
                                ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString           +''' AS INSCRICAODATA,     '+
                                ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString           +''' AS DTINICIOINSC,      '+
                                ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNC,         '+
                                ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCATUAL,    '+
                                ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCNOVO,     '+
                                ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPART,         '+
                                ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTATUAL,    '+
                                ''''+qrySitPart.FieldByName('FLGINTERNO').AsString                 +''' AS FLGINTERNO,        '+
                                ''''+qrySitPart.FieldByName('FLGINTERNO').AsString                 +''' AS FLGSITPART,        '+
                                ''''+sDataRef                                                      +''' AS DATAREF,           '+
                                '0'                                                                +'   AS PARTREINSC,        '+
                                OraNumero(sValorAssociado)                                         +'   AS VALORASSOCIADO,    '+
                                OraNumero(sValorAssociado2)                                        +'   AS VALORASSOCIADO2,   '+
                                OraNumero(sValorAssociado3)                                        +'   AS VALORASSOCIADO3,   '+
                                OraNumero(sSalarioPart)                                            +'   AS VALORPROVENTO,     '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP1').AsString)   +'   AS ASSOC1OP1,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP2').AsString)   +'   AS ASSOC1OP2,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP3').AsString)   +'   AS ASSOC1OP3,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP1').AsString)   +'   AS ASSOC2OP1,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP2').AsString)   +'   AS ASSOC2OP2,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP3').AsString)   +'   AS ASSOC2OP3,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP1').AsString)   +'   AS ASSOC3OP1,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP2').AsString)   +'   AS ASSOC3OP2,         '+
                                OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP3').AsString)   +'   AS ASSOC3OP3          '+
                                     ' FROM DUAL ';
               sIdRegraCalculo := IntToStr(dtmAPrev.qry.FieldByName('IDRGSALARIO13').AsInteger);

               sValorRegra := RegraNumerica(sIdRegraCalculo, sSQLRegraAux, bErro, iIdCalculoGeral);

               if (not bErro) and (Trim(sValorRegra) <> '') and (StrToFloat(ClienteNumero(sValorRegra)) > 0 )
               then sSalarioPart := OraNumero(sValorRegra);
            end;
         end;

         // Montar SQL para regra de calculo
         if (StrToInt(copy(psDataInicio,1,2)) >= 29) and
            (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
         then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
         else sDataRef := copy(psDataInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

         // Preencher valores das contribuicoes associadas
         sValorAssociado  := '0';
         sValorAssociado2 := '0';
         sValorAssociado3 := '0';

         
         varFields := VarArrayCreate([0,1],varVariant);
         varFields[0] := pqryAux.FieldByName('IdContribPai').AsInteger;
         varFields[1] := sAnoMesAtual;
         if pqryAux.FieldByName('IdContribPai').AsString <> ''
         then begin
            if qryHstContribPrev.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
            then sValorAssociado := OraNumero(qryHstContribPrev.FieldByName('ValorEsperado').AsString);
         end;

         varFields[0] := pqryAux.FieldByName('IdContribPai2').AsInteger;
         varFields[1] := sAnoMesAtual;
         if pqryAux.FieldByName('IdContribPai2').AsString <> ''
         then begin
            if qryHstContribPrev.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
            then sValorAssociado2 := OraNumero(qryHstContribPrev.FieldByName('ValorEsperado').AsString);
         end;

         varFields[0] := pqryAux.FieldByName('IdContribPai3').AsInteger;
         varFields[1] := sAnoMesAtual;
         if pqryAux.FieldByName('IdContribPai3').AsString <> ''
         then begin
            if qryHstContribPrev.Locate('IdContribuicao',varFields,[loCaseInsensitive])
            then sValorAssociado3 := OraNumero(qryHstContribPrev.FieldByName('ValorEsperado').AsString);
         end;

         
         sSQLRegraAux := ' SELECT  '+qryPlanosPrev.FieldByName('IdPessJur').AsString            +'   AS IDPESSJUR,         '+
                         qryPlanosPrev.FieldByName('IDPLANOPREV').AsString                      +'   AS IDPLANOPREV,       '+
                         qryPlanosPrev.FieldByName('IDPESSOA').AsString                         +'   AS IDPESSOA,          '+
                         qryPlanosPrev.FieldByName('SEQPROPOSTA').AsString                      +'   AS SEQPROPOSTA,       '+
                    ''''+sAnoMesCalc13Aux                                                       +''' AS ANOMESREF,         '+
                    '''IP''                                                                          AS FLGINTEVENTO,      '+
                    '0                                                                               AS PARTREINSC,        '+
                         qryContribPrevPartP.FieldByName('IDCONTRIBUICAO').AsString             +'   AS IDCONTRIBUICAO,    '+
                    ''''+qryContribPrevPartP.FieldByName('DIAVENCIMENTO').AsString              +''' AS DIAVENCIMENTO,     '+
                        OraNumero(qryContribPrevPartP.FieldByName('VALORBASE1').AsString)       +'   AS VALORBASE1,        '+
                        OraNumero(qryContribPrevPartP.FieldByName('VALORBASE2').AsString)       +'   AS VALORBASE2,        '+
                        OraNumero(qryContribPrevPartP.FieldByName('VALORBASE3').AsString)       +'   AS VALORBASE3,        '+
                             ''''+qryContribPrevPartP.FieldByName('QTDEPARCELAS').AsString      +''' AS QTDEPARCELAS,      '+
                             ''''+qryContribPrevPartP.FieldByName('DATAINICIO').AsString        +''' AS DATAINICIO,        '+
                             ''''+PreparaStr(qryContribPrevPartP.FieldByName('DATAFINAL').AsString,10)         +''' AS DATAFINAL,         '+
                             ''''+qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString        +''' AS TEMPOSERVANTERIOR, '+
                            ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString              +''' AS DATAADMISSAO,      '+
                            ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString              +''' AS DATADEMISSAO,      '+
                        OraNumero(qryElegPatro.FieldByName('SALTOTAL').AsString)                +'   AS SALTOTAL,          '+
                        OraNumero(qryElegPatro.FieldByName('TEMPONAOCREDITADO').AsString)       +'   AS TEMPONAOCREDITADO, '+
                             ''''+qryPessoaFisica.FieldByName('DATANASC').AsString              +''' AS DATANASC,          '+
                             ''''+qryPessoaFisica.FieldByName('SEXO').AsString                  +''' AS SEXO,              '+
                        OraNumero(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString)        +'   AS SALPARTICIPACAO,   '+
                             ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString           +''' AS INSCRICAODATA,     '+
                             ''''+qryPlanosPrev.FieldByName('INSCRICAODATA').AsString           +''' AS DTINICIOINSC,      '+
                             ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNC,         '+
                             ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCATUAL,    '+
                             ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCNOVO,     '+
                             ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPART,         '+
                             ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                             ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTATUAL,    '+
                             ''''+qrySitPart.FieldByName('FLGINTERNO').AsString                 +''' AS FLGINTERNO,        '+
                             ''''+qrySitPart.FieldByName('FLGINTERNO').AsString                 +''' AS FLGSITPART,        '+
                             ''''+sDataRef                                                      +''' AS DATAREF,           '+
                             '0'                                                                +'   AS PARTREINSC,        '+
                             OraNumero(sValorAssociado)                                         +'   AS VALORASSOCIADO,    '+
                             OraNumero(sValorAssociado2)                                        +'   AS VALORASSOCIADO2,   '+
                             OraNumero(sValorAssociado3)                                        +'   AS VALORASSOCIADO3,   '+
                             OraNumero(sSalarioPart)                                            +'   AS VALORPROVENTO,     '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP1').AsString)   +'   AS ASSOC1OP1,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP2').AsString)   +'   AS ASSOC1OP2,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP3').AsString)   +'   AS ASSOC1OP3,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP1').AsString)   +'   AS ASSOC2OP1,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP2').AsString)   +'   AS ASSOC2OP2,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP3').AsString)   +'   AS ASSOC2OP3,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP1').AsString)   +'   AS ASSOC3OP1,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP2').AsString)   +'   AS ASSOC3OP2,         '+
                             OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP3').AsString)   +'   AS ASSOC3OP3          '+
                        ' FROM DUAL ';

         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         if (Copy(sAnoMesCalc13Aux,6,2) = '13') and (qryAux.FieldbyName('IdRegraCalculo13').AsString <> '')
         then sIdRegraCalculo := qryAux.FieldbyName('IdRegraCalculo13').AsString
         else sIdRegraCalculo := qryAux.FieldbyName('IdRegraCalculo').AsString;

         if sIdRegraCalculo = ''
         then begin
            if Copy(sAnoMesCalc13Aux,6,2) = '13'
            then sMsgErro := 'A regra de cálculo da contribuição não foi associada - '+#13
            else sMsgErro := 'A regra de cálculo da contribuição sobre 13º não foi associada - '+#13;

            sMsgErro := sMsgErro + qryAux.FieldbyName('Nome').AsString;
            bErro    := True;
            break;
         end;

         //==== Chamar regra
         sValorRegra := RegraNumerica(sIdRegraCalculo,
                                      sSQLRegraAux, bErro, iIdCalculoGeral);


         if bErro
         then begin
            sMsgErro := 'Erro na Execução da Regra de Cálculo de  '+
                         pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                         pqryAux.FieldbyName('IdRegraCalculo').AsString;
            bErro    := True;
            break;
         end
         else if sValorRegra = ''
              then begin
                 sMsgErro := 'A Regra de Cálculo de  '+
                             pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                             pqryAux.FieldbyName('IdRegraCalculo').AsString+' retornou um valor em branco.';
                 bErro    := True;
                 break;
              end
         else if ((sValorRegra = '0') or (sValorRegra = '0.00'))
                   And (qryPlanosPrev.FieldByName('FLGNGRAVACONTZERO').AsInteger = 0) 
              then begin
                 sMsgErro := 'A Regra de Cálculo de  '+
                             pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                             pqryAux.FieldbyName('IdRegraCalculo').AsString+ ' retornou Zero.';
                 bJaPerguntouContribZERO := True;  
                 if (pqryAux.FieldbyName('FLGOBRIGATORIA').AsString = 'O') and
                    (not bJaPerguntouContribZERO) and
                    (MsgDlg(sMsgErro+' Confirma que participante não pagará esta contribuição ? ',
                     'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo)
                 then begin
                    bErro    := True;
                    break;
                 end;
              end;

              
              If (qryPlanosPrev.FieldByName('FLGNGRAVACONTZERO').AsInteger = 0) And
                 ((sValorRegra = '0') or (sValorRegra = '0.00'))
              Then Begin
                If (((copy(sAnoMesAtual,6,2) = '12') and (bCalc13)) or (bCalc13DtFim)) and
                    ((qryContribPrevPartP.FieldByName('QtdeParcelas').AsString  = '') or
                     (qryContribPrevPartP.FieldByName('QtdeParcelas').AsInteger > 1 ) )
                Then bCalc13    := false
                Else Begin
                   sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                   bCalc13 := true;
                End;

                Continue;
              End;
              

         sValorFinal := OraNumero(sValorRegra);

         //=================================
         //=== Tratamento de décimo terceiro
         //=================================
         // Verificar se é o primeiro ou ultimo pagamento,
         // para as contribuições sobre 13 (décimo terceiro), se está no mesmo ano
         if Copy(sAnoMesCalc13Aux,6,2) = '13'
         then begin
            sTpPagto := '';
            if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesInicio,1,4)) and
               (pqryAux.FieldbyName('IDREGRAPRIMPGTO13').AsString <> '')
            then begin
               sTpPagto := 'P';
               sMsgRegra:= 'Primeiro';
               sIdRegra := 'IDREGRAPRIMPGTO13';

               if (StrToInt(copy(psDataInicio,1,2)) >= 29) and
                  (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
               then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
               else sDataRef := copy(psDataInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
            end;

            if (Copy(sAnoMesAtual,1,4) = Copy(sAnoMesFinal,1,4)) and
               (sDataFinal <> '')          and
               (sAnoMesFinal  <= sAnoMesHoje) and
               (pqryAux.FieldbyName('IDREGRAULTPGTO13').AsString <> '')
            then begin
               sTpPagto := 'U';
               sMsgRegra:= 'Último';
               sIdRegra := 'IDREGRAULTPGTO13';

               if (StrToInt(copy(sDataFinal,1,2)) >= 29) and
                  (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
               then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
               else sDataRef := copy(sDataFinal,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
            end;

            if sTpPagto <> ''
            then begin
                 sSQLRegraAux := ' SELECT '+sValorFinal+' AS VALORREFERENCIA, '+
                                        //BRUNO AZEVEDO SOL 132594 KINTANA 765573
                                        ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString             +''' AS DATAADMISSAO,      '+
                                        sValorFinal+' AS VALORPREV, '+
                                        ''''+sDataRef+''' AS DATAREF, '+
                                        ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString             +''' AS DATADEMISSAO,      '+
                                        ''''+sAnoMesCalc13Aux                                              +''' AS ANOMESREF,         '+
                                        ' 0 AS PARTREINSC, '+
                                        ''''+qryContribPrevPartP.FieldByName('DATAINICIO').AsString        +''' AS DATAINICIO,        '+
                                        ''''+PreparaStr(qryContribPrevPartP.FieldByName('DATAFINAL').AsString,10)         +''' AS DATAFINAL,         '+
                                        OraNumero(qryContribPrevPartP.FieldByName('VALORBASE1').AsString)+ ' AS VALORBASE1, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('VALORBASE2').AsString)+ ' AS VALORBASE2, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('VALORBASE3').AsString)+ ' AS VALORBASE3, '+
                                        qryPlanosPrev.FieldByName('IdPessJur').AsString+' AS IDPESSJUR, '+
                                        qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                                        qryPlanosPrev.FieldByName('IdPessoa').AsString+' AS IDPESSOA, '+
                                        qryPlanosPrev.FieldByName('SeqProposta').AsString+' AS SEQPROPOSTA, '+
                                        qryContribPrevPartP.FieldByName('IDCONTRIBUICAO').AsString+' AS IDCONTRIBUICAO, '+
                                        ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString+''' AS INSCRICAODATA, '+
                                        ''''+qryPessoaFisica.FieldByName('DataNasc').AsString+''' AS DATANASC, '+
                                        OraNumero(sSalarioPart)+' AS VALORPROVENTO, '+
                                        OraNumero(sValorAssociado)  +' AS VALORASSOCIADO, '+
                                        OraNumero(sValorAssociado2) +' AS VALORASSOCIADO2, '+
                                        OraNumero(sValorAssociado3) +' AS VALORASSOCIADO3, '+
                                        ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                        ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNC,         '+
                                        ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCATUAL,    '+
                                        ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCNOVO,     '+
                                        ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPART,         '+
                                        ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                        ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTATUAL,    '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP1').AsString)+' AS ASSOC1OP1, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP2').AsString)+' AS ASSOC1OP2, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP3').AsString)+' AS ASSOC1OP3, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP1').AsString)+' AS ASSOC2OP1, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP2').AsString)+' AS ASSOC2OP2, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP3').AsString)+' AS ASSOC2OP3, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP1').AsString)+' AS ASSOC3OP1, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP2').AsString)+' AS ASSOC3OP2, '+
                                        OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP3').AsString)+' AS ASSOC3OP3 '+
                                 ' FROM DUAL ';

                 sValorRegra := RegraNumerica(pqryAux.FieldbyName(sIdRegra).AsString ,
                                              sSQLRegraAux,bErro,iIdCalculoGeral);
                 if bErro
                 then begin
                    sMsgErro := 'Erro na Execução da Regra de Cálculo do '+sMsgRegra+' Pagamento sobre 13º'+
                                'de  '+pqryAux.FieldbyName('Nome').AsString+ ' Nº '+pqryAux.FieldbyName(sIdRegra).AsString;
                    bErro    := True;
                    break;
                 end
                 else
                 if sValorRegra = ''
                 then begin
                    sMsgErro := 'A Regra de Cálculo do '+sMsgRegra+' Pagamento sobre 13º '+
                                'de '+pqryAux.FieldbyName('Nome').AsString+ ' Nº '+pqryAux.FieldbyName(sIdRegra).AsString+
                                ' retornou um valor em branco';
                    bErro    := True;
                    break;
                 end;
                 if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                 then sValorFinal := sValorRegra;
            end;
         end;

         // Verificar se é o primeiro ou ultimo pagamento
         // para contribuições fora <> do mês 13 (décimo terceiro)
         if Copy(sAnoMesCalc13Aux,6,2) <> '13'
         then begin
             if (sAnoMesAtual = sAnoMesInicio) and
                (pqryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString <> '')
             then begin
                // Se a regra de primeiro pagamento estiver em branco, supor
                // que o valor do primeiro pagamento é igual ao valor total
                if (StrToInt(copy(psDataInicio,1,2)) >= 29) and
                   (StrToInt(copy(sAnoMesAtual,6,2)) = 2)
                then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                else sDataRef := copy(psDataInicio,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);
                sSQLRegraAux := ' SELECT '+sValorFinal+' AS VALORREFERENCIA, '+
                                    //BRUNO AZEVEDO SOL 132594 KINTANA 765573
                                    ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString             +''' AS DATAADMISSAO,      '+
                                    sValorFinal+' AS VALORPREV, '+
                                    ''''+sDataRef+''' AS DATAREF, '+
                                    ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString             +''' AS DATADEMISSAO,      '+
                                    ''''+sAnoMesCalc13Aux                                              +''' AS ANOMESREF,         '+
                                    ' 0 AS PARTREINSC, '+
                                    ''''+qryContribPrevPartP.FieldByName('DATAINICIO').AsString        +''' AS DATAINICIO,        '+
                                    ''''+PreparaStr(qryContribPrevPartP.FieldByName('DATAFINAL').AsString ,10)        +''' AS DATAFINAL,         '+
                                   OraNumero(qryContribPrevPartP.FieldByName('VALORBASE1').AsString)+ ' AS VALORBASE1, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('VALORBASE2').AsString)+ ' AS VALORBASE2, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('VALORBASE3').AsString)+ ' AS VALORBASE3, '+
                                    qryPlanosPrev.FieldByName('IdPessJur').AsString+' AS IDPESSJUR, '+
                                    qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                                    qryPlanosPrev.FieldByName('IdPessoa').AsString+' AS IDPESSOA, '+
                                    qryPlanosPrev.FieldByName('SeqProposta').AsString+' AS SEQPROPOSTA, '+
                                    qryContribPrevPartP.FieldByName('IDCONTRIBUICAO').AsString+' AS IDCONTRIBUICAO, '+
                                    ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString+''' AS INSCRICAODATA, '+
                                    ''''+qryPessoaFisica.FieldByName('DataNasc').AsString+''' AS DATANASC, '+
                                    ''''+qrySitPart.FieldByName('FlgInterno').AsString+''' AS FLGSITPART, '+
                                    ''''+qrySitPart.FieldByName('FlgInterno').AsString+''' AS FLGINTERNO, '+
                                    ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                     ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNC,         '+
                                     ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCATUAL,    '+
                                     ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCNOVO,     '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPART,         '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTATUAL,    '+
                                    OraNumero(sSalarioPart)+' AS VALORPROVENTO, '+
                                    OraNumero(sValorAssociado)  +' AS VALORASSOCIADO, '+
                                    OraNumero(sValorAssociado2) +' AS VALORASSOCIADO2, '+
                                    OraNumero(sValorAssociado3) +' AS VALORASSOCIADO3, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP1').AsString)+' AS ASSOC1OP1, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP2').AsString)+' AS ASSOC1OP2, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP3').AsString)+' AS ASSOC1OP3, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP1').AsString)+' AS ASSOC2OP1, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP2').AsString)+' AS ASSOC2OP2, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP3').AsString)+' AS ASSOC2OP3, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP1').AsString)+' AS ASSOC3OP1, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP2').AsString)+' AS ASSOC3OP2, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP3').AsString)+' AS ASSOC3OP3 '+
                             ' FROM DUAL ';

                sValorRegra := RegraNumerica(pqryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString,
                                             sSQLRegraAux,bErro,iIdCalculoGeral);

                if bErro
                then begin
                   sMsgErro := 'Erro na Execução da Regra de Cálculo do Primeiro Pagamento '+
                               'de  '+pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                               pqryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString;
                   bErro    := True;
                   break;
                end
                else
                if sValorRegra = ''
                then begin
                   sMsgErro := 'A Regra de Cálculo do Primeiro Pagamento '+
                               'de  '+pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                               pqryAux.FieldbyName('IDREGRAPRIMPAGTO').AsString+
                               ' retornou um valor em branco';
                   bErro    := True;
                   break;
                end;

                //  if StrToFloat(ClienteNumero(sValorRegra)) < 0 then
                if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                then sValorFinal := sValorRegra;
             end;  // if MesAtual = MesInicio
     //        else begin

             if (sAnoMesAtual = sAnoMesFinal) and
                (sDataFinal <> '')         and
                (sAnoMesFinal <= sAnoMesHoje) and
                (pqryAux.FieldbyName('IDREGRAULTPAGTO').AsString <> '')
             then begin
                   if (StrToInt(copy(sDataFinal,1,2)) >= 29) and
                      (StrToInt(copy(sAnoMesAtual,6,2))   = 2)
                   then sDataRef := '28/'+copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4)
                   else sDataRef := copy(sDataFinal,1,2)+ '/' + copy(sAnoMesAtual,6,2) + '/' + copy(sAnoMesAtual,1,4);

                   sSQLRegraAux := ' SELECT '+sValorFinal+' AS VALORREFERENCIA, '+
                                       //BRUNO AZEVEDO SOL 132594 KINTANA 765573
                                       ''''+qryElegPatro.FieldByName('DATAADMISSAO').AsString             +''' AS DATAADMISSAO,      '+
                                       sValorFinal+' AS VALORPREV, '+
                                       ''''+sDataRef+''' AS DATAREF, '+
                                       ''''+qryElegPatro.FieldByName('DATADEMISSAO').AsString             +''' AS DATADEMISSAO,      '+
                                        ''''+sAnoMesCalc13Aux                                              +''' AS ANOMESREF,         '+

                                       ' 0 AS PARTREINSC, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('VALORBASE1').AsString)+ ' AS VALORBASE1, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('VALORBASE2').AsString)+ ' AS VALORBASE2, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('VALORBASE3').AsString)+ ' AS VALORBASE3, '+
                                       qryPlanosPrev.FieldByName('IdPessJur').AsString+' AS IDPESSJUR, '+
                                       ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                       qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                                       qryPlanosPrev.FieldByName('IdPessoa').AsString+' AS IDPESSOA, '+
                                       qryPlanosPrev.FieldByName('SeqProposta').AsString+' AS SEQPROPOSTA, '+
                                       qryContribPrevPartP.FieldByName('IDCONTRIBUICAO').AsString+' AS IDCONTRIBUICAO, '+
                                       ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString+''' AS INSCRICAODATA, '+
                                       ''''+qryPessoaFisica.FieldByName('DataNasc').AsString+''' AS DATANASC, '+
                                    ''''+qryContribPrevPartP.FieldByName('DATAINICIO').AsString        +''' AS DATAINICIO,        '+
                                    ''''+PreparaStr(qryContribPrevPartP.FieldByName('DATAFINAL').AsString,10)         +''' AS DATAFINAL,         '+
                                   OraNumero(qryContribPrevPartP.FieldByName('VALORBASE1').AsString)+ ' AS VALORBASE1, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('VALORBASE2').AsString)+ ' AS VALORBASE2, '+
                                    OraNumero(qryContribPrevPartP.FieldByName('VALORBASE3').AsString)+ ' AS VALORBASE3, '+
                                    qryPlanosPrev.FieldByName('IdPessJur').AsString+' AS IDPESSJUR, '+
                                    qryPlanosPrev.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                                    qryPlanosPrev.FieldByName('IdPessoa').AsString+' AS IDPESSOA, '+
                                    qryPlanosPrev.FieldByName('SeqProposta').AsString+' AS SEQPROPOSTA, '+
                                    qryContribPrevPartP.FieldByName('IDCONTRIBUICAO').AsString+' AS IDCONTRIBUICAO, '+
                                    ''''+qryPlanosPrev.FieldByName('InscricaoData').AsString+''' AS INSCRICAODATA, '+
                                    ''''+qryPessoaFisica.FieldByName('DataNasc').AsString+''' AS DATANASC, '+
                                    ''''+qrySitPart.FieldByName('FlgInterno').AsString+''' AS FLGSITPART, '+
                                    ''''+qrySitPart.FieldByName('FlgInterno').AsString+''' AS FLGINTERNO, '+
                                    ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                     ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNC,         '+
                                     ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCATUAL,    '+
                                     ''''+qryElegPatro.FieldByName('IDSITFUNC').AsString                +''' AS IDSITFUNCNOVO,     '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPART,         '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTNOVO,     '+
                                     ''''+qrySitPart.FieldByName('IDSITPART').AsString                  +''' AS IDSITPARTATUAL,    '+
                                       OraNumero(sSalarioPart)+' AS VALORPROVENTO, '+
                                       OraNumero(sValorAssociado)  +' AS VALORASSOCIADO, '+
                                       OraNumero(sValorAssociado2) +' AS VALORASSOCIADO2, '+
                                       OraNumero(sValorAssociado3) +' AS VALORASSOCIADO3, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP1').AsString)+' AS ASSOC1OP1, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP2').AsString)+' AS ASSOC1OP2, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC1OP3').AsString)+' AS ASSOC1OP3, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP1').AsString)+' AS ASSOC2OP1, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP2').AsString)+' AS ASSOC2OP2, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC2OP3').AsString)+' AS ASSOC2OP3, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP1').AsString)+' AS ASSOC3OP1, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP2').AsString)+' AS ASSOC3OP2, '+
                                       OraNumero(qryContribPrevPartP.FieldByName('ASSOC3OP3').AsString)+' AS ASSOC3OP3 '+
                                ' FROM DUAL ';

                   sValorRegra := RegraNumerica(pqryAux.FieldbyName('IDREGRAULTPAGTO').AsString,
                                                sSQLRegraAux,bErro,iIdCalculoGeral);
                   if bErro
                   then begin
                      sMsgErro := 'Erro na Execução da Regra de Cálculo do Último Pagamento '+
                                  'de  '+pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                                  pqryAux.FieldbyName('IDREGRAULTPAGTO').AsString;
                      bErro    := True;
                      break;
                   end
                   else if sValorRegra = ''
                        then begin
                           sMsgErro := 'A Regra de Cálculo do Último Pagamento '+
                                       'de  '+pqryAux.FieldbyName('Nome').AsString+ ' Nº '+
                                       pqryAux.FieldbyName('IDREGRAULTPAGTO').AsString+
                                       ' retornou um valor em branco.';
                           bErro    := True;
                           break;
                        end;
                   if StrToFloat(ClienteNumero(sValorRegra)) >= 0
                   then sValorFinal := sValorRegra;
             end; // if MesAtual = MesInicio

            //=================================
            //=== Tratamento de décimo terceiro
            //=================================
            //== Verifica se é o último pagamento, independente de ter ou não
            //== regra de cálculo preenchida, e se deve calcular contrib. 13, no final da contribuição.

            if (sAnoMesAtual   = sAnoMesFinal) and
               (sDataFinal <> '')              and
               (sAnoMesFinal  <= sAnoMesHoje)  and
               (pqryAux.FieldbyName('FlgCobra13DtFim').AsInteger = 1)
            then bCalc13DtFim := True;

         end;  // fim mesreferencia <> 13

         // Gerar numero do recebimento
         iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

         // Calcular número da parcela
         inc(iParcela);
         inc(iNumReg);
         rTotalLote := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));

         // Inserir valor final na HSTCONTRIBPREV
         with qryHstContribPrev do
         begin
            Insert;
            FieldByName('MESREFERENCIA').AsString      := sAnoMesCalc13Aux;
            FieldByName('MESCOBRANCA').AsString        := sAnoMesCobranca;
            FieldByName('NUMRECEBIMENTO').AsInteger    := iNumRecebimento;
            FieldByName('IDMOTIVO').AsInteger          := prmIdMotivoContrib;
            if (Trim(qryContribPrevPartP.FieldByName('CodPortForma').AsString) <> '') and
               (qryContribPrevPartP.FieldByName('CodPortForma').AsInteger > 0)
            then FieldByName('CODPORTFORMA').AsInteger := qryContribPrevPartP.FieldByName('CodPortForma').AsInteger;
            FieldByName('NOME').AsString               := qryContribPrevPartP.FieldByName('Nome').AsString;
            FieldByName('DATAPREVISAORECE').AsDateTime := StrToDate(sDataCobranca);
            FieldByName('VALORESPERADO').AsFloat       := StrToFloat(ClienteNumero(sValorFinal));
            FieldByName('VALORCALCULADO').AsFloat      := StrToFloat(ClienteNumero(sValorFinal));
            FieldByName('IDREGRACALCULO').AsInteger    := pqryAux.FieldByName('IdRegraCalculo').AsInteger;
            FieldByName('FLGDESCFOLHA').AsInteger      := qryContribPrevPartP.FieldByName('FlgDescFolha').AsInteger;
            FieldByName('FOLHAORIGEM').AsString        := 'P';
            FieldByName('IDPESSOA').AsInteger          := qryContribPrevPartP.FieldByName('IdPessoa').AsInteger;
            FieldByName('SEQPROPOSTA').AsInteger       := qryContribPrevPartP.FieldByName('SeqProposta').AsInteger;
            FieldByName('IDPESSJUR').AsInteger         := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
            FieldByName('IDPLANOPREV').AsInteger       := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
            FieldByName('IDCONTRIBUICAO').AsInteger    := qryContribPrevPartP.FieldByName('IdContribuicao').AsInteger;
            FieldByName('FLGCALCRESERVA').AsInteger    := 0;
            FieldByName('FLGEVENTO').AsInteger         := 1; 

            if Trim(qryContribPrevPartP.FieldbyName('ValorBase1').AsString) <> ''
            then FieldByName('VALOROP1').AsFloat       := qryContribPrevPartP.FieldbyName('ValorBase1').AsFloat;
            if Trim(qryContribPrevPartP.FieldbyName('ValorBase2').AsString) <> ''
            then FieldByName('VALOROP2').AsFloat       := qryContribPrevPartP.FieldbyName('ValorBase2').AsFloat;
            if Trim(qryContribPrevPartP.FieldByName('ValorBase3').AsString) <> ''
            then FieldByName('VALOROP3').AsFloat       := qryContribPrevPartP.FieldbyName('ValorBase3').AsFloat;

            if Trim(qryContribPrevPartP.FieldbyName('DATAINICIO').AsString) <> ''
            then FieldByName('DATAINICIO').AsDateTime  := qryContribPrevPartP.FieldbyName('DATAINICIO').AsDateTime;
            if Trim(qryContribPrevPartP.FieldbyName('DATAFINAL').AsString) <> ''
            then FieldByName('DATAFINAL').AsDateTime  := qryContribPrevPartP.FieldbyName('DATAFINAL').AsDateTime;
            FieldByName('FLGSITFUNDACAO').AsString     := sSitFundacao;
            FieldByName('SITRECEBIMENTO').AsInteger    := iSitRecebimento;
            FieldByName('TIPO').AsString               := 'F';
            FieldByName('IDLOTE').AsInteger            := iIdLote;
            FieldByName('PARCELA').AsInteger           := iParcela;
            FieldByName('FlgIntEvento').AsString       := 'IP';
            Post;

            // Se a contribuicao que foi inserida foi sobre 13o., então atualizar
            // ultano13
            if Copy(sAnoMesCalc13Aux,6,2) = '13'
            then begin
               qryContribPrevPartP.Edit;
               qryContribPrevPartP.FieldByName('UltAno13').AsInteger := StrToInt(Copy(sAnoMesCalc13Aux,1,4));
               qryContribPrevPartP.Post;
            end;

         end; //with

         // Gravar salario correspondente à contribuicao
         if not bGravouSalario
         then begin
            sSalarioPart := sSalarioAux;
            if (sAnoMesAtual = sAnoMesInicio) and
               (Trim(sSalarioPart) <> '')
            then sSalarioPart := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioPart,psDataInicio)))
            else if (sAnoMesAtual = sAnoMesFinal) and
                    (sDataFinal <> '')            and
                    (sAnoMesFinal <= sAnoMesHoje) and
                    (Trim(sSalarioPart) <> '')
                 then sSalarioPart := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioPart,sDataFinal)));

            // FAZER UM LOOP DE 3 PASSOS PARA GERAR 3 TIPOS DE SALÁRIO :
            // 1 - SALARIO DE PARTICIPACAO ( OU MANUTENCAO)
            // 2 - REMUNERACAO TOTAL
            // 3 - SALAUXDOENCA
            sRubricasGeradas := '';
            for iTipoRubrica := 1 to 3
            do begin
               case iTipoRubrica of
                    1 : begin
                           sNomeRubrica := 'IDRUBSALPARTICIP';
                           iFlgSRB      := 1;
                        end;
                    2 : begin
                           sNomeRubrica := 'IDRUBREMTOTAL';
                           iFlgSRB      := 0;
                        end;
                    3 : begin
                           sNomeRubrica := 'IDRUBSALBENEFICIO';
                           iFlgSRB      := 0;
                        end;
               end;

               // Preencher dados da rubrica de salario de participacao
               with dtmAPrev.qry do
               begin
                  SQL.Clear;
                  SQL.Add(' SELECT PT.'+sNomeRubrica+' AS IDRUBRICA,   RP.CODPROVDESC,  '+
                          '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                          '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                          ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                          ' WHERE  PT.IDPESSOA  = '+qryPlanosPrev.FieldByName('IDPESSJUR').AsString+
                          ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                          ' AND    RP.IDRUBRICA = PT.'+sNomeRubrica+
                          ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
                  Open;
                  if not IsEmpty
                  then begin
                     sCodProvDesc       := FieldByName('CODPROVDESC').AsString;
                     sIdRubrica         := FieldByName('IDRUBRICA').AsString;
                     sFlgCompoeRemTotal := FieldByName('FLGCOMPOEREMTOTAL').AsString;
                     sFlgCompoeSalBenef := FieldByName('FLGCOMPOESALBENEF').AsString;
                     sFlgCompoeSalPart  := FieldByName('FLGCOMPOESALPART').AsString;
                     sFlgIRRF           := FieldByName('FLGIRRF').AsString;

                     if Trim(sFlgCompoeRemTotal) <> '1' then sFlgCompoeRemTotal := '0';
                     if Trim(sFlgCompoeSalBenef) <> '1' then sFlgCompoeSalBenef := '0';
                     if Trim(sFlgCompoeSalPart)  <> '1' then sFlgCompoeSalPart := '0';
                     if Trim(sFlgIRRF)           <> '1' then sFlgIRRF := '0';
                  end
                  else begin
                     if iTipoRubrica = 1
                     then begin
                        sMsgErro := ' A rubrica de Salário de Participação não está cadastrada corretamente. '+
                                    ' Verifique.';
                        Exit;
                     end
                     else break;
                  end;
                  Close;
               end; // with dtmaprev.qry

               if Pos(sIdRubrica,sRubricasGeradas) > 0
               then continue;

               sRubricasGeradas := sRubricasGeradas + sIdRubrica+' ,';

               with qryHstRubSal do
               begin
                  varFields[0] := sAnoMesCalc13Aux;
                  varFields[1] := StrToInt(sIdRubrica);
                  if (iTipoRubrica = 1) and
                     (Locate('Mes;IdRubrica',varFields,[loCaseInsensitive]))
                  then begin
                     Edit;
                     FieldByName('FLGSRB').AsInteger            := 1;
                     Post;
                  end
                  else begin
                     Insert;
                     FieldByName('CODPROVDESC').AsString        := sCodProvDesc;
                     FieldByName('FLGCOMPOEREMTOTAL').AsInteger := StrToInt(sFlgCompoeRemTotal);
                     FieldByName('FLGCOMPOESALBENEF').AsInteger := StrToInt(sFlgCompoeSalBenef);
                     FieldByName('FLGCOMPOESALPART').AsInteger  := StrToInt(sFlgCompoeSalPart);
                     FieldByName('FLGIRRF').AsInteger           := StrToInt(sFlgIRRF);
                     FieldByName('FLGPREVIA').AsInteger         := 0;
                     FieldByName('FLGSRB').AsInteger            := iFlgSRB;
                     FieldByName('IDMOTIVO').AsInteger          := prmIdMotivoContrib;
                     FieldByName('IDPATRO').AsInteger           := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
                     FieldByName('IDPESSJUR').AsInteger         := qryPlanosPrev.FieldByName('IdPessJur').AsInteger;
                     FieldByName('IDPESSOA').AsInteger          := qryContribPrevPartP.FieldByName('IdPessoa').AsInteger;
                     FieldByName('IDRUBRICA').AsInteger         := StrToInt(sIdRubrica);
                     FieldByName('MES').AsString                := sAnoMesCalc13Aux;
                     FieldByName('MESCOBRANCA').AsString        := sAnoMesCobranca;
                     FieldByName('REFERENCIA').AsString         := '***';
                     FieldByName('SEQRUBRICA').AsInteger        := 1;
                     FieldByName('VALORPROVENTO').AsFloat       := StrToFloat(ClienteNumero(sSalarioPart));
                     FieldByName('IDMODULO').AsFloat            := Sistema.IdModulo;
                     Post;
                  end;
               end;
            end; // for
         end; // if not bGravouSalario

         // Se a contribuicao for atrasada -> Gravar Alteradores
         if (sAnoMesAtual < sAnoMesHoje)
         then begin
            //== Grava no HistoricoDeAtraso e faz o Envio para TmpDesc
            //  A data de recebimento é a data calculada pelo Calendario no mes
            // atual (hoje)
            sAno := Copy(sAnoMesCalc13Aux,1,4);
            sMes := Copy(sAnoMesCalc13Aux,6,2);
            if Trim(sMes) = '13' then sMes := '12';
            sDataDeveriaTerPago := CriticaDataCobrancaSit(dtmAPrev.qry,qryPlanosPrev.FieldByName('IdPessJur').AsString,
                                             qryPlanosPrev.FieldByName('IdPlanoPrev').AsString,
                                             sSitFundacao, 'N',
                                             sMes, sAno);

            if not GravaAlteradorInscricao('A',sAnoMesCalc13Aux, 
                        sAnoMesCobranca,
                        iNumRecebimento,
                        prmIdMotivoContrib,
                        qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,
                        qryContribPrevPartP.FieldByName('IdContribuicao').AsInteger,
                        qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                        psDataInicio,
                        sDataDeveriaTerPago,  // DATAPREVISAORECEBIMENTO
                        sDataCobranca,        // DATAEFETIVARECEBIMENTO
                        sValorFinal, sMsgErro )
            then begin
               if Trim(sMsgErro) = ''
               then  sMsgErro := ' Erro na gravação dos alteradores da contribuição. ';
               bErro    := True;
               break;
            end;
         end; //if sAnoMesAtual < sAnoMesHoje

         //verifica se o mes atual é dezembro e se o 13 já
         //foi calculado, se não então não muda o mês e
         //faz com o mês 13

         // Se for pagamento único, nao cobrar nem sobre 13o.
         //=================================
         //=== Tratamento de décimo terceiro 
         //=================================
         if (((copy(sAnoMesAtual,6,2) = '12') and (bCalc13)) or (bCalc13DtFim)) and
             ((qryContribPrevPartP.FieldByName('QtdeParcelas').AsString  = '') or
              (qryContribPrevPartP.FieldByName('QtdeParcelas').AsInteger > 1 ) )
         then bCalc13    := false
         else begin
            sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            bCalc13 := true;
         end;
      end; // while mesatual < mesfinal

      if bErro then break;
      bGravouSalario := True; 
      qryContribPrevPartP.next;
   end;//while

   if (not bErro)
   then begin
      // Gravar total do lote
      with qryCtrlInterface do
      begin
         if Locate('IdLote',iIdLote,[loCaseInsensitive])
         then begin
            Edit;
            FieldByName('NumReg').AsInteger := iNumReg;
            FieldByName('VlrTotal').AsFloat := rTotalLote;
            Post;
         end;
      end;
   end;
//   qryContribPrevPartP.Close;
   Result := not bErro;
end; // PreparaContribuicoesInscricao

function TfrmCadElegivel.GravaAlteradorInscricao(sTipo,sMesReferencia,sMesCobranca : string;
                        piNumRecebimento,
                        piIdMotivo, pIdPlanoPrev, pIdContribuicao, pIdPessJur : integer;
                        sDataRef, sDataPrevisao,
                        sDataRecebido, sValor : string; var sMsgErro : string ) : boolean;
var sSQLRegra,
    sMesRef,
    sValorRegra : string;
    bErroRegra  : boolean;
    Dec,
    sFlgAtraso,
    sFlgDevol   : char;
    rValor      : double;
begin
   Result       := False;
   with dtmAPrev.qry do
   begin
     Close;
     Sql.Clear;
     Sql.Add(' SELECT PV.IDRUBRICA FROM CONTPREV CP, RUBRICAXPESS PV '+
             ' WHERE  (CP.IDCONTRIBUICAO = '+IntToStr(pIdContribuicao) + ' )'+
             ' AND    (CP.IDPLANOPREV    = '+IntToStr(pIdPlanoPrev)    + ' )'+
             ' AND    (CP.IDRUBRICA      = PV.IDRUBRICA   ) '+
             ' AND    (PV.IDPESSOA       = '+IntToStr(pIdPessJur) +' ) ');
     Open;
     if dtmAPrev.qry.IsEmpty
     then begin
        dtmAPrev.qry.Close;
        if not bPerguntouRubrica 
        then begin
           bPerguntouRubrica := True;
           if MsgDlg('As rubricas desta contribuição não estão associadas à Patrocinadora. '+
                     'Esta associação pode ser feita antes do Envio de Contribuições. '+
                     'Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo
           then begin
              Result := False;
              TiraSQL(dtmAPrev.qry);
              Exit;
           end;
        end;
     end;
   end;

   // sTipo - Parametro que especifica o tipo de alterador (A-traso, D-evolução)
   sFlgAtraso   := '0';
   sFlgDevol    := '0';

   if sTipo = 'A'
   then sFlgAtraso := '1'
   else sFlgDevol  := '1';

   if Trim(sValor) = '' then sValor := '0';
   try
      rValor := StrToFloat(ClienteNumero(sValor));
   except
   end;

   // == Procura pelos alteradores c/ flgcobra p/ a contribuição mencionadada e p/ Atraso ou Devolução
   dtmAPrev.qryAux2.Close;
   dtmAPrev.qryAux2.Sql.Clear;
   dtmAPrev.qryAux2.Sql.Add(' SELECT A.CODALTERADOR, A.IDREGRACALCULO, TP.DESCRICAO '+
                            ' FROM ALTERADORXCONTRIB  A, TIPOALTERADOR TP ' +
                            ' WHERE ( A.IDCONTRIBUICAO = '  + IntToStr(pIdContribuicao) + ' )'+
                            ' AND   ( A.IDPLANOPREV    = '  + IntToStr(pIdPlanoPrev)    + ' )'+
                            ' AND   ( A.FLGCOBRA       = 1                                  )'+
                            ' AND  (( A.FLGATRASO      = '  + sFlgAtraso +') OR '+
                            '       ( A.FLGDEVOL       = '  + sFlgDevol  +'))   '+
                            ' AND   ( A.CODALTERADOR   = TP.CODALTERADOR )'+
                            ' ORDER BY A.NUMORDEM ');

   dtmAPrev.qryAux2.Open;
   if dtmAPrev.qryAux2.IsEmpty
   then begin
      Result := True;
      Exit;
   end;

   while not dtmAPrev.qryAux2.EOF do
   begin
      if dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString = ''
      then begin
         dtmAPrev.qryAux2.Next;
         continue;
      end;
      sMesRef   := Copy(sDataRef,7,4)+Copy(sDataRef,3,3);
      sValor    := OraNumero(FloatToStr(rValor));
      sSQLRegra := ' SELECT '+OraNumero(sValor)+' AS VALORPREV, '+
                   ''''+sDataRef+''' AS DATAREF, '+
                   ''''+sMesRef +''' AS MESREFERENCIA, '+
                   inttostr(piIdMotivo)+' AS IDMOTIVO, '+
                   inttostr(piNumRecebimento)+' AS NUMRECEBIMENTO, '+
                   OraNumero(sValor)+' AS VALORESPERADO, '+
                   ''''+sMesRef +''' AS MESCOBRANCA, '+
                   IntToSTr(Sistema.Idmodulo)+' AS IDMODULO, '+
                   ''''+sDataPrevisao+''' AS DATAPREVISAORECE, '+
                   ''''+sDataRecebido+''' AS DATARECEBIMENTO '+
                   ' FROM DUAL  ';

      try
         sValorRegra := RegraNumerica(dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString, sSQLRegra, bErroRegra,iIdCalculoGeral);
      except
         sMsgErro := ' Erro na Regra de Cálculo de um dos alteradores - Regra Nº '+dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString;
         Exit;
      end;

      if sValorRegra = ''
      then begin
         dtmAPrev.qryAux2.Next;
         Continue;
      end;

      with qryHstAtrasoContrib do
      begin
         //== Grava alteradores no HistoricoAlteradores
         Insert;
         FieldByName('NUMRECEBIMENTO').AsInteger := piNumRecebimento;
         FieldByName('MESREFERENCIA').AsString   := sMesReferencia;
         FieldByName('MESCOBRANCA').AsString     := sMesCobranca;
         FieldByName('IDMOTIVO').AsInteger       := piIdMotivo;
         FieldByName('FLGTIPO').AsString         := sTipo;
         FieldByName('DESCRICAO').AsString       := dtmAPrev.qryAux2.FieldByName('DESCRICAO').AsString;
         FieldByName('VALOR').AsFloat            := StrToFloat(ClienteNumero(sValorRegra));
         FieldByName('CODALTERADOR').AsString    := dtmAPrev.qryAux2.FieldByName('CODALTERADOR').AsString;
         FieldByName('FLGEVENTO').AsInteger      := 1;    
         Post;
         try
            rValor := rValor + StrToFloat(ClienteNumero(sValorRegra));
         except
         end;
      end;//with
      dtmAPrev.qryAux2.Next;
   end; //while not qryAux2.Eof
   Result := True;
end;//GravaAlteradorInscricao

procedure TfrmCadElegivel.MostraContribuicoesInscricao;
var sNomeOp1, sNomeOp2, sNomeOp3, sMes : string;
    bPossuiOpcoes : boolean;
    iNumRecebimento,
    iIdContribuicao : longint;
begin
   frmMostraAux.Caption := 'Informações da Inscrição do Participante ... ';
   frmMostraAux.memResult.Lines.Clear;

   // Verificar se existem opcoes do elegivel na patrocinadora
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NUMOPCOES, NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3 '+
                  ' FROM PATRO '+
                  ' WHERE IDPESSOA = ' +qryPlanosPrev.FieldByName('IdPessJur').AsString);
   qryAux.Open;
   if (qryAux.IsEmpty) or
      (qryAux.FieldByName('NumOpcoes').AsString = '') or
      (qryAux.FieldByName('NumOpcoes').AsInteger <= 0)
   then begin
      bPossuiOpcoes := False;
      sNomeOp1      := '';
      sNomeOp2      := '';
      sNomeOp3      := '';
   end
   else begin
      bPossuiOpcoes := True;
      sNomeOp1      := qryAux.FieldByName('NomeValorBase1').AsString;
      sNomeOp2      := qryAux.FieldByName('NomeValorBase2').AsString;
      sNomeOp3      := qryAux.FieldByName('NomeValorBase3').AsString;
   end;
   qryAux.Close;

   frmMostraAux.memResult.Lines.Add(' PARTICIPANTE : '+Trim(qry.FieldByName('Nome').AsString));

   frmMostraAux.memResult.Lines.Add(' MATRÍCULA : '+Trim(qryElegPatro.FieldByName('MATRICULA').AsString)+
                                    '                       '+
                                    ' DATA DA CONSULTA  : ' + FormatDateTime('dd/mm/yyyy', Date) );

   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add(' Evento : Inscrição de Participante '+
                                    ' - Data : '+ qryPlanosPrev.FieldByName('InscricaoData').AsString);
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');

   frmMostraAux.memResult.Lines.Add(' PATROCINADORA : '+qryElegPatro.FieldByName('PATROCINADORA').AsString);
   frmMostraAux.memResult.Lines.Add(' PLANO PREVID. : '+qryPlanosPrev.FieldByName('PLANO').AsString);

   frmMostraAux.memResult.Lines.Add(' INSCRIÇÃO Nº : '+Trim(qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsString));
   frmMostraAux.memResult.Lines.Add(' NÍVEL : '+Trim(qryElegPatro.FieldByName('NIVEL').AsString)+
                                    '                       '+
                                    ' CARGO : '+Trim(qryElegPatro.FieldByName('IDCARGOEXT').AsString));
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add('  ');
   frmMostraAux.memResult.Lines.Add(' DADOS DO PARTICIPANTE ');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add(' Data Nasc : '    + qryPessoaFisica.FieldByName('DataNasc').AsString+
                                    ' - Sexo : '+qryPessoaFisica.FieldByName('Sexo').AsString);
   frmMostraAux.memResult.Lines.Add(' Admissão : '    + qryElegPatro.FieldByName('DataAdmissao').AsString+
                                    ' - Inscrição : ' + qryPlanosPrev.FieldByName('INSCRICAODATA').AsString);
   frmMostraAux.memResult.Lines.Add(' Tempo de Serv. Anterior : '   + qryElegPatro.FieldByName('TempoServAnterior').AsString+' meses ' );


   if Trim(qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString) <> ''
   then frmMostraAux.memResult.Lines.Add(' Salário : R$ '+ FormatFloat('#0.00', qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsFloat))
   else frmMostraAux.memResult.Lines.Add(' Salário : R$ 0.00');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');


   // Exibir opcoes do elegivel na patrocinadora
   if bPossuiOpcoes
   then begin
      frmMostraAux.memResult.Lines.Add(' OPÇÕES NA PATROCINADORA : ');
      frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
      if (Trim(sNomeOp1) <> '') and (Trim(qryElegPatro.FieldByName('ValorBase1').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+sNomeOp1+' : '+qryElegPatro.FieldByName('ValorBase1').AsString);
      if (Trim(sNomeOp2) <> '') and (Trim(qryElegPatro.FieldByName('ValorBase2').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+sNomeOp2+' : '+qryElegPatro.FieldByName('ValorBase2').AsString);
      if (Trim(sNomeOp3) <> '') and (Trim(qryElegPatro.FieldByName('ValorBase3').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+sNomeOp3+' : '+qryElegPatro.FieldByName('ValorBase3').AsString);
   end;

   // Exibir opcoes por contribuicao por plano
   frmMostraAux.memResult.Lines.Add('   ');
   frmMostraAux.memResult.Lines.Add(' OPÇÕES DAS CONTRIBUÇÕES NO PLANO : ');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   qryContribPrevPartP.First;
   while not qryContribPrevPartP.Eof do
   begin

      iIdContribuicao := qryContribPrevPartP.FieldbyName('IdContribuicao').AsInteger;

      frmMostraAux.memResult.Lines.Add('===> '+qryContribPrevPartP.FieldByName('Nome').AsString);

      if Trim(qryContribPrevPartP.FieldByName('Periodicidade').AsString) = ''
      then frmMostraAux.memResult.Lines.Add('          Tipo de Pagmto : Esporádico ')
      else frmMostraAux.memResult.Lines.Add('          Tipo de Pagmto : '+qryContribPrevPartP.FieldByName('Periodicidade').AsString);

      if Trim(qryContribPrevPartP.FieldByName('QtdeParcelas').AsString) <> ''
      then frmMostraAux.memResult.Lines.Add('          Nº de Parcelas : '+qryContribPrevPartP.FieldByName('QtdeParcelas').AsString )
      else frmMostraAux.memResult.Lines.Add('          Nº de Parcelas : 0 ');

      if (qryContribPrevPartP.FieldbyName('NumOpcoes').AsInteger < 1)
      then begin
         qryContribPrevPartP.Next;
         Continue;
      end;
      while (iIdContribuicao = qryContribPrevPartP.FieldbyName('IdContribuicao').AsInteger) and
            (not qryContribPrevPartP.Eof) do
      begin
         sNomeOp1        := qryContribPrevPartP.FieldbyName('NomeValorBase1').AsString;
         sNomeOp2        := qryContribPrevPartP.FieldbyName('NomeValorBase2').AsString;
         sNomeOp3        := qryContribPrevPartP.FieldbyName('NomeValorBase3').AsString;
         if (Trim(sNomeOp1) <> '') and (Trim(qryContribPrevPartP.FieldByName('ValorBase1').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add('          '+sNomeOp1+' : '+qryContribPrevPartP.FieldByName('ValorBase1').AsString);
         if (Trim(sNomeOp2) <> '') and (Trim(qryContribPrevPartP.FieldByName('ValorBase2').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add('          '+sNomeOp2+' : '+qryContribPrevPartP.FieldByName('ValorBase2').AsString);
         if (Trim(sNomeOp3) <> '') and (Trim(qryContribPrevPartP.FieldByName('ValorBase3').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add('          '+sNomeOp3+' : '+qryContribPrevPartP.FieldByName('ValorBase3').AsString);
         qryContribPrevPartP.Next;
      end;
   end;

   if not qryHstContribPrev.IsEmpty
   then begin
      frmMostraAux.memResult.Lines.Add('   ');
      frmMostraAux.memResult.Lines.Add(' CONTRIBUIÇÕES A COBRAR DO PARTICIPANTE : ');
      frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
      qryHstContribPrev.First;
      while not qryHstContribPrev.Eof do
      begin
         frmMostraAux.memResult.Lines.Add('   ');
         sMes := qryHstContribPrev.FieldByName('MesReferencia').AsString;
         frmMostraAux.memResult.Lines.Add(' => Referência em ' +qryHstContribPrev.FieldByName('MesReferencia').AsString);
         while (sMes = qryHstContribPrev.FieldByName('MesReferencia').AsString) and
               (not    qryHstContribPrev.Eof) do
         begin
            iIdContribuicao := qryHstContribPrev.FieldbyName('IdContribuicao').AsInteger;
            frmMostraAux.memResult.Lines.Add('       -> '+qryHstContribPrev.FieldByName('Nome').AsString+ ' : '+
                                             ' Valor = R$ '+FormatFloat('#0.00', qryHstContribPrev.FieldByName('ValorEsperado').AsFloat));
            if qryHstAtrasoContrib.Locate('NumRecebimento',
                                                  qryHstContribPrev.FieldbyName('NumRecebimento').AsInteger,[loCaseInsensitive])
            then begin
               iNumRecebimento := qryHstAtrasoContrib.FieldByName('NumRecebimento').AsInteger;

               while(iNumRecebimento = qryHstAtrasoContrib.FieldbyName('NumRecebimento').AsInteger) and
                    (not qryHstAtrasoContrib.Eof)  do
               begin
                   if (qryHstAtrasoContrib.FieldbyName('Descricao').AsString <> '') and
                      (qryHstAtrasoContrib.FieldbyName('MesReferencia').AsString = sMes) and
                      (qryHstAtrasoContrib.FieldByName('Valor').AsFloat > 0)
                   then frmMostraAux.memResult.Lines.Add('                                   + '+
                                                          qryHstAtrasoContrib.FieldByName('Descricao').AsString+ ' = R$ '+
                                                          FormatFloat('#0.00', qryHstAtrasoContrib.FieldByName('Valor').AsFloat));
                   qryHstAtrasoContrib.Next;
                end;
            end;
            qryHstContribPrev.Next;
          end;
      end;
   end;
//   qryAux.Close;
   frmMostraAux.ShowModal;
end; // MostraContribuicoesInscricao

procedure TfrmCadElegivel.GravaReservasParticipante;
begin
  qryPlanosPrev.First;
  while not qryPlanosPrev.EOF do
      begin
        {Filtra todas as Reservas do Plano do Participante}
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO ' +
                        ' WHERE  IDPLANOPREV = ' + qryPlanosPrev.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                        '        ANALITICOSINTETI = ' + '''A''' + ' AND ' +
                        '        FLGCOLETIVA = 0 ');
         qryAux.Open;
         qryAux.First;

         while not qryAux.EOF do
            begin
              {Verifica se as Reservas do Participante ainda não foram gravadas}
               qryAux2.Close;
               qryAux2.Sql.Clear;
               qryAux2.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAPART  ' +
                               ' WHERE  IDTIPORESERVA = ' + qryAux.FieldbyName('IDTIPORESERVA').AsString + ' AND ' +
                               '        IDPESSOA      = ' + qryPlanosPrev.FieldByName('IDPESSOA').AsString + ' AND ' +
                               '        IDPLANOPREV   = ' + qryPlanosPrev.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                               '        IDPESSJUR     = ' + qryPlanosPrev.FieldbyName('IDPESSJUR').AsString);
               qryAux2.Open;

               if qryAux2.IsEmpty then
                  begin
                      //Grava as Reservas do Participante
                      qryGrava.Close;
                      qryGrava.Sql.Clear;
                      qryGrava.Sql.Add(' INSERT INTO RESERVAPART (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, SEQPROPOSTA, ' +
                                       'IDPARTICIPANTE) ' + 
                                       ' VALUES( ' + qryAux.FieldbyName('IDTIPORESERVA').AsString      + ',' +
                                                     qryPlanosPrev.FieldbyName('IDPLANOPREV').AsString + ',' +
                                                     qryPlanosPrev.FieldbyName('IDPESSJUR').AsString   + ',' +
                                                     qryPlanosPrev.FieldbyName('IDPESSOA').AsString    + ',' +
                                                     ' 1, ' +
                                                     qryPlanosPrev.FieldbyName('IDPESSOA').AsString + ') '); 
                      try
                         qryGrava.ExecSQL;
                      except
                         on E:EDBEngineError do
                           begin
                                MostrarErro(E);
                                Exit;
                           end;
                      end;
                  end;
               qryAux.Next;
            end;
         qryPlanosPrev.Next;
      end;
end;

function TfrmCadElegivel.VerificaElegivel :boolean;
var sIdRegra,
    sSQL       : string;
    bErroRegra  : boolean;
begin
   Result := False;
   //  Verificar campos obrigatórios do elegivel
   if Trim(dblkpcmbSitPatro.Text) = ''
   then begin
      MsgDlg('A situação do empregado na patrocinadora deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbSitPatro.SetFocus;
      Exit;
   end;


   if Trim(dblkpcmbPatro.Text) = ''
   then begin
      MsgDlg('A Patrocinadora deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbPatro.SetFocus;
      Exit;
   end;

   if Trim(dbedMatricula.Text) = ''
   then begin
      MsgDlg('A Matrícula do Funcionário deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dbedMatricula.SetFocus;
      Exit;
   end;

   if Trim(dbdtAdesao.Text) = ''
   then begin
      MsgDlg('A Data de Admissão deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      dbdtAdesao.SetFocus;
      Exit;
   end;

   if (Trim(dbdtNasc.Text) <> '') and
      (StrToDate(dbdtAdesao.Text) <= StrToDate(dbdtNasc.Text))
   then begin
      MsgDlg('A Data de Admissão está inferior ou coincide com a Data de Nascimento. ','Erro',mtError,[mbOk,mbHelp],0);
      dbdtAdesao.SetFocus;
      Exit;
   end;

  // Testar regra de validacao de matricula
  if bTestaRegra
  then begin
     if qryPatro.FieldByName('IdRegraMatricula').AsString <> ''
     then begin
        sSQL := ' SELECT '''+Trim(dbedMatricula.Text)+''' AS MATRICULA FROM DUAL ';
        sIdRegra := qryPatro.FieldByName('IdRegraMatricula').AsString;
        try
           if not RegraBooleana(sIdRegra,sSQL,bErroRegra)
           then begin // Regra de Validacao de Matricula = False
              if bErroRegra
              then MsgDlg('Erro na execução da Regra de Validação de Matrícula. '+
                          'Regra Nº '+sIdRegra,'Erro',mtError,[mbOk,mbHelp],0)
              else MsgDlg('Regra de Validação de Matrícula não satisfeita.'+
                          'Regra Nº '+sIdRegra,'Informação',mtInformation,[mbOk,mbHelp],0);
              dbedMatricula.SetFocus;
              Exit;
           end;
        except
           MsgDlg('Erro na execução da Regra de Validação de Matrícula. '+
                  'Regra Nº '+sIdRegra,'Erro',mtError,[mbOk,mbHelp],0)
        end;
     end; // if IdRegra <> ''
  end; // if bTestaRegra

  if qryElegPatro.State = dsInsert
  then begin
     // Verificar duplicidade de matricula
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDPESSOA FROM ELEGPATRO '+
                ' WHERE  MATRICULA = '''+Trim(dbedMatricula.Text)+''''+
                ' AND    IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+
                ' AND    IDPESSOA  <> '+qry.FieldByName('IDPESSOA').AsString);

        Open;
        if not IsEmpty
        then begin
           MsgDlg('Matrícula duplicada !' ,'Erro',mtError,[mbOk,mbHelp],0);
           dbedMatricula.SetFocus;
           Exit;
        end;
     end;//with qryAux
  end;
  Result := True;
end; //VerificaElegivel

function  TfrmCadElegivel.VerificaParticipante : boolean;
var sIdRegra,
    sSQL,
    sIdPlanoPrev : string;
    bExiste, bErroRegra :boolean;
    iYear, iMonth, iDay, iYearHoje, iMonthHoje, iDayHoje : Word;
    I, iAnos, iRegAtual : Integer;
    bmPlace : TBookmark;
begin
  Result := False;
  { Verificar campos obrigatórios do participante}
  if Trim(dblkpcmbPlano.Text) = ''
  then begin
     MsgDlg('O Plano Previdenciário deve ser informado antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbPlano.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('A Situação do Participante na Fundação deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('A Situação do Participante no Plano deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;

  if Trim(dbdtRequerimento.Text) = ''
  then begin
     MsgDlg('A Data de Requerimento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtRequerimento.SetFocus;
     Exit;
  end;

  if Trim(dbdtInscricao.Text) = ''
  then begin
     MsgDlg('A Data de Evento(Inscrição) deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtInscricao.SetFocus;
     Exit;
  end;

  if StrToDate(dbdtRequerimento.Text) < qryElegPatro.FieldByName('DATAADMISSAO').Value
  then begin
     MsgDlg('A Data de Requerimento deve ser maior que a Data de Admissão.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtRequerimento.SetFocus;
     Exit;
  end;

  if StrToDate(dbdtInscricao.Text) < qryElegPatro.FieldByName('DATAADMISSAO').Value
  then begin
     MsgDlg('A Data de Evento(Inscrição) deve ser maior que a Data de Admissão.','Erro',mtError,[mbOk,mbHelp],0);
     dbdtInscricao.SetFocus;
     Exit;
  end;

  if dbdtNasc.Text = ''  
  then begin
     MsgDlg('Data de Nascimento do Participante não está Preenchida. Tela Dados Pessoais','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;
  
  if StrToDate(dbdtInscricao.Text) < StrToDate(dbdtRequerimento.Text)
  then begin
     if MsgDlg('A Data de Requerimento está posterior à Data de Evento(Inscrição). Confirma ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
     then begin
        dbdtInscricao.SetFocus;
        Exit;
     end;
  end;

  { Verifica se a pessoa possui outro evento com a mesma data }
  bExiste := False;
  For I := 0 To (Length(aPlanoDatas)-1) Do Begin
    If aPlanoDatas[I] = dbdtInscricao.Text Then bExiste := True;
  End;

  sSQL := 'SELECT INSCRICAODATA FROM PARTPREVPLAN WHERE IDPESSOA = '+
          QryElegPatro.FieldByName('IdPessoa').AsString+' AND '+
          'INSCRICAODATA = TO_DATE('+QuotedStr(dbdtInscricao.Text)+',''DD/MM/YYYY'')';

  If (bExiste = False) And (Not FazQuery(QryAux,sSQL)) Then Begin
    iRegAtual := (Length(aPlanoDatas));
    SetLength(aPlanoDatas, (iRegAtual+1));

    aPlanoDatas[(iRegAtual-1)] := dbdtInscricao.Text;
  End Else Begin
    MsgDlg('Já existe uma Inscrição com esta data',
           'Erro', mtError, [mbOk,mbHelp],0);
    Exit;
  End;
  

  DecodeDate(StrToDate(dbdtInscricao.Text), iYear, iMonth, iDay);
  DecodeDate(Date, iYearHoje, iMonthHoje, iDayHoje);
  iAnos := iYearHoje - iYear;

  if (iAnos >= 1) then
     if MsgDlg('Existe(m) '+IntToStr(iAnos)+' ano(s) de diferença entre a data de Evento(inscrição) e a data de hoje. '+#13+
               'Confirma esta data de Evento(inscrição) ?',
               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
     then begin
        dbdtInscricao.SetFocus;
        Exit;
     end;


   if (Trim(dbdtNasc.Text) <> '') and
      (StrToDate(dbdtInscricao.Text) <= StrToDate(dbdtNasc.Text))
   then begin
      MsgDlg('A Data de Evento(Inscrição) está inferior ou coincide com a Data de Nascimento. ','Erro',mtError,[mbOk,mbHelp],0);
      dbdtAdesao.SetFocus;
      Exit;
   end;

  // Testar regra de Admissao, somente na inclusao do participante
  if (bTestaRegra) and (qryPlanosPrev.State = dsInsert)
  then begin
     if qryPlanPrev.FieldByName('IdRegraAdmissao').AsString <> ''
     then begin
        sIdRegra := qryPlanPrev.FieldByName('IdRegraAdmissao').AsString;

        // Verifica se este particip. INCLUIDO já está inscrito em algum plano 8-03-99
        sIdPlanoPrev := sIdPlanoAnterior;
        if sIdPlanoPrev    = ''
        then sIdPlanoPrev := '0';

        sSQL := ' SELECT '+qryElegPatro.FieldByName('IdPessoa').AsString  +' AS IDPESSOA,    '+
                      ''''+sIdPlanoPrev+''''+' AS IDPLANOANTES, '+
                      ''''+Trim(dbdtInscricao.Text)+''' AS DTINICIOINSC, '+
                      ''''+Trim(dbdtInscricao.Text)+''' AS INSCRICAODATA, '+
                      ''''+Trim(dbdtInscricao.Text)+''' AS DATAREF, '+
                      ''''+Trim(dbdtRequerimento.Text)+''' AS REQUERIMENTODATA, '+
                           qryPlanPrev.FieldByName('IdPlanoPrev').AsString +' AS IDPLANOPREV, '+
                           qryElegPatro.FieldByName('IdPessJur').AsString +' AS IDPESSJUR    ';
        if qrySitPart.FieldByName('IDSITPART').AsString <> ''
        then sSQL := sSQL + ', '''+  qrySitPart.FieldByName('IDSITPART').AsString+''' AS IDSITPART ';
        if qrySitPart.FieldByName('IDSITPART').AsString <> ''
        then sSQL := sSQL + ', '''+  qrySitPart.FieldByName('IDSITPART').AsString+''' AS IDSITPARTATUAL ';
        if qrySitPart.FieldByName('IDSITPART').AsString <> ''
        then sSQL := sSQL + ', '''+  qrySitPart.FieldByName('IDSITPART').AsString+''' AS IDSITPARTNOVO ';
        if qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString <> ''
        then sSQL := sSQL + ', '''+  qrySitPLANOPREV.FieldByName('IDSITPLANOPREV').AsString+''' AS IDSITPLANOPREV ';
        if qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString <> ''
        then sSQL := sSQL + ', '''+  qrySitPLANOPREV.FieldByName('IDSITPLANOPREV').AsString+''' AS IDSITPLANOATUAL ';
        if qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString <> ''
        then sSQL := sSQL + ', '''+  qrySitPLANOPREV.FieldByName('IDSITPLANOPREV').AsString+''' AS IDSITPLANONOVO ';
        if qryElegPatro.FieldByName('IdSitFunc').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdSitFunc').AsString+' AS IDSITFUNC ';
        if qryElegPatro.FieldByName('IdSitFunc').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdSitFunc').AsString+' AS IDSITFUNCATUAL ';
        if qryElegPatro.FieldByName('IdSitFunc').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdSitFunc').AsString+' AS IDSITFUNCNOVO ';
        if qryElegPatro.FieldByName('CodCentroCusto').AsString <> ''
        then sSQL := sSQL+', '''+ qryElegPatro.FieldByName('CodCentroCusto').AsString+''' AS CODCENTROCUSTO ';
        if qryElegPatro.FieldByName('IdCargoExt').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdCargoExt').AsString+' AS IDCARGO ';
        if qryElegPatro.FieldByName('IdCargoExt').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('IdCargoExt').AsString+' AS IDCARGOEXT ';
        if qryElegPatro.FieldByName('Matricula').AsString <> ''
        then sSQL := ssQL + ', '''+qryElegPatro.FieldByName('Matricula').AsString+''' AS MATRICULA ';
        if qryElegPatro.FieldByName('DataAdmissao').AsString <> ''
        then sSQL := sSQL +', '''+ qryElegPatro.FieldByName('DataAdmissao').AsString+''' AS DATAADMISSAO ';
        if qryElegPatro.FieldByName('SalTotal').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('SalTotal').AsString+' AS SALTOTAL ';
        if qryElegPatro.FieldByName('PARTICIPPREVID').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('PARTICIPPREVID').AsString+' AS PARTICIPPREVID ';
        if qryElegPatro.FieldByName('PARTICIPASSIST').AsString <> ''
        then sSQL := sSQL + ', '+qryElegPatro.FieldByName('PARTICIPASSIST').AsString+' AS PARTICIPASSIST ';
        if qryElegPatro.FieldByName('NIVEL').AsString <> ''
        then sSQL := sSQL+', '''+qryElegPatro.FieldByName('NIVEL').AsString+''' AS NIVEL ';
        if qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString <> ''
        then sSQL := sSQL +', '+qryElegPatro.FieldByName('TEMPOSERVANTERIOR').AsString+' AS TEMPOSERVANTERIOR ';
        if qryPessoaFisica.FieldByName('DataNasc').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('DataNasc').AsString+''' AS DATANASC ';
        if qryPessoaFisica.FieldByName('Sexo').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('Sexo').AsString+''' AS SEXO ';
        if qry.FieldByName('NumDocumento').AsString <> ''
        then sSQL := sSQL + ', '''+  qry.FieldByName('NumDocumento').AsString+''' AS NUMDOCUMENTO ';
        if qryPessoaFisica.FieldByName('DataMORTE').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('DataMORTE').AsString+''' AS DATAMORTE ';
        if qryPessoaFisica.FieldByName('ESTCIVIL').AsString <> ''
        then sSQL := sSQL + ', '''+  qryPessoaFisica.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL ';
        sSQL := sSQL + ' FROM DUAL ';

        try
           if not RegraBooleana(sIdRegra,sSQL,bErroRegra)
           then begin // Regra de admissao = False
              if bErroRegra
              then MsgDlg('Erro na execução da Regra de Admissão no Plano Nº '+sIdRegra,'Erro',mtError,[mbOk,mbHelp],0)
              else MsgDlg('A Regra de Admissão no Plano Nº '+sIdRegra+ ' não foi satisfeita. '+
                          'O participante não poderá ser inscrito no plano. Para mantê-lo como '+
                          ' elegível no cadastro clique no botão "Ok" abaixo da tela. Para '+
                          ' não guardar suas informações clique no botão "Cancelar". ',
                          'Informação',mtInformation,[mbOk,mbHelp],0);
              Exit;
           end;
        except
           MsgDlg('Erro na execução da Regra de Admissão no Plano Nº '+sIdRegra,'Erro',mtError,[mbOk,mbHelp],0);
        end;
     end; // if IdRegra <> ''
  end; // if bTestaRegra
  Result := True;
end; //VerificaParticipante

function TfrmCadElegivel.VerificaContaBancaria:boolean;
Var qryPreferencial:TwwQuery;
begin
   Result := False;
   if Trim(dblkpcmbBanco.Text) = '' then
      begin
           MsgDlg('O Banco deve ser informado antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbBanco.SetFocus;
           Exit;
      end;

   if Trim(dblkpcmbAgencia.Text) = '' then
      begin
           MsgDlg('A Agência Bancária deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbAgencia.SetFocus;
           Exit;
      end;

   if dbgrpContaPref.ItemIndex = 1 then
      begin
         qryPreferencial := TwwQuery.Create(Nil);

         qryPreferencial.close;
         qryPreferencial.DatabaseName := 'BaseDados';
         qryPreferencial.sql.Clear;
         qryPreferencial.sql.Add(' SELECT COUNT(CONTABANCARIA.FLGCONTAPREF) FLGCONTAPREF  ');
         qryPreferencial.sql.Add(' FROM   CONTABANCARIA, PESSOA AGENCIA,PESSOA BANCO, AGENCIABANCARIA ,BANCO B  ');
         qryPreferencial.sql.Add(' WHERE  CONTABANCARIA.IDPESSOA     = ' + IntToStr(qry.FieldByName('IDPESSOA').AsInteger) );
         qryPreferencial.sql.Add(' AND    CONTABANCARIA.IDAGENCIA    = AGENCIA.IDPESSOA  ');
         qryPreferencial.sql.Add(' AND    CONTABANCARIA.IDAGENCIA    = AGENCIABANCARIA.IDPESSOA  ');
         qryPreferencial.sql.Add(' AND    AGENCIABANCARIA.IDBANCO    = BANCO.IDPESSOA  ');
         qryPreferencial.sql.Add(' AND    AGENCIABANCARIA.IDBANCO    = B.IDpessoa  ');
         qryPreferencial.sql.Add(' AND    CONTABANCARIA.FLGCONTAPREF = 1  ');
         qryPreferencial.open;

         if (Not flgCBancariaPref) And
            (qryPreferencial.FieldByName('FLGCONTAPREF').AsInteger > 0) then
            begin
                 MsgDlg('Conta preferencial já cadastrada.','Erro',mtError,[mbOk,mbHelp],0);
                 dbgrpContaPref.ItemIndex := 0;
                 dbgrpContaPref.SetFocus;
                 FreeAndNil(qryPreferencial);
                 Exit;
            end;
         FreeAndNil(qryPreferencial);
      end;
   flgCBancariaPref := False;   
   
   if rgrpTipoConta.ItemIndex < 3 then
      begin
         if Trim(dbedContaCorrente.Text) = '' then
            begin
               MsgDlg('A Conta Corrente deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
               dbedContaCorrente.SetFocus;
               Exit;
            end;
   end;


   //Renato Visoni SOL 135283 Kintana 803604
   if dbRdgContaResgate.ItemIndex = 1 then begin
     if QryContaResgate.RecordCount <> 0 then begin
       if trim(QryContaBancaria.fieldByname('ROWID').asString) <> '' then begin
         if not QryContaResgate.Locate('IDROWID',QryContaBancaria.fieldByname('ROWID').asString,[]) then begin
           MsgDlg('Conta resgate já cadastrada.','Erro',mtInformation,[mbOk],0);
           Result := False;
           Exit;
         end else begin
           QryContaResgate.Append;
           QryContaResgate.FieldByname('IDROWID').asString := QryContaBancaria.fieldByname('ROWID').asString;
           QryContaResgate.Post;
         end;
       end else begin
         MsgDlg('Conta resgate já cadastrada.','Erro',mtInformation,[mbOk],0);
         Result := False;
         Exit;
       end;
     end else begin
       QryContaResgate.Append;
       if trim(QryContaBancaria.fieldByname('ROWID').asString) = '' then begin
         QryContaResgate.FieldByname('IDROWID').asString := 'NOVO';
       end else begin
         QryContaResgate.FieldByname('IDROWID').asString := QryContaBancaria.fieldByname('ROWID').asString;
       end;
       QryContaResgate.Post;
     end;
   end else begin
     if QryContaResgate.FieldByname('IDROWID').asString = 'NOVO' Then begin
       QryContaResgate.Delete;
     end else begin
       if QryContaResgate.Locate('IDROWID',QryContaBancaria.fieldByname('ROWID').asString,[]) then begin
         QryContaResgate.Delete;
       end;
     end;
   end;
   //Renato Visoni SOL 135283 Kintana 803604

   Result := True;
end;


function  TfrmCadElegivel.PreparaDependente :boolean;
Begin
  Result := False;
  // Teste se o participante ainda nao foi incluido, como dependente
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('select idpessoa from dependente where idpessoa = '+qryElegPatro.FieldByname('IDPESSOA').AsString);
  qryAux.Open;
  If qryAux.IsEmpty Then
  Begin
    qryDepen.Insert;
    qryDepen.FieldByName('IdPessoa').Value := qryElegPatro.FieldByname('IDPESSOA').AsString;
    qrydepen.post; 
  end;

  // Preencher querys de dependencia para gravar participante como seu proprio dependente
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT 1 ');
  qryAux.Sql.Add(' FROM DEPENTIT ');
  qryAux.Sql.Add(' WHERE IDTITULAR = ' + qryElegPatro.FieldByname('IDPESSOA').AsString );
  qryAux.Sql.Add('   AND IDPESSOA  = ' + qryElegPatro.FieldByname('IDPESSOA').AsString );
  qryAux.Open;

  if qryAux.IsEmpty then
  begin
    qryDepenTit.Insert;
    qryDepenTit.FieldByName('IdPessoa').Value         := qryElegPatro.FieldByname('IDPESSOA').AsString;
    qryDepenTit.FieldByName('IdTitular').Value        := qryElegPatro.FieldByname('IDPESSOA').AsString;
    qryDepenTit.FieldByName('IdDependencia').Value    := 'PRP';
    qryDepenTit.FieldByName('NumSequencia').Value     := 0;
    qryDepenTit.FieldByName('FLGCONTAIMPOSTOR').Value := 0;
    qryDepenTit.FieldByName('FLGCONTASALARIOF').Value := 0;
    qryDepenTit.FieldByName('flgBeneficiario').Value  := 1;
    qryDepenTit.FieldByName('MATRICULA').Value        := qryElegPatro.FieldByName('MATRICULA').AsString; 
    qryDepenTit.Post;
  End
  Else   
  Begin
    // Caso já exista, verifica se a matrícula é a mesma cadastrada
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT 1' +
                   ' FROM DEPENTIT' +
                   ' WHERE IDTITULAR = ' + qryElegPatro.FieldByname('IDPESSOA').AsString +
                   '   AND IDPESSOA  = ' + qryElegPatro.FieldByname('IDPESSOA').AsString +
                   '   AND MATRICULA = ' + QuotedStr(qryElegPatro.FieldByName('MATRICULA').AsString) );
    qryAux.Open;

    If qryAux.IsEmpty Then
    Begin
      qryDepenTit.Edit;
      qryDepenTit.FieldByName('MATRICULA').Value := qryElegPatro.FieldByName('MATRICULA').AsString;
      qryDepenTit.Post;
     End;     
  End;
  
  Result := True;
End;

procedure TfrmCadElegivel.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;
  
  qryVinculaFunc.Close;
  qryVinculaFunc.Open;

  if bVeioDoMenu
  then begin
     qrySitFunc.Close;
     qrySitFunc.SQL.Clear;
     qrySitFunc.SQL.Add(' SELECT IDSITFUNC,DESCRICAO '+
                        ' FROM SITFUNC               ');

     if prmMostraSitGeral
     then qrySitFunc.SQL.Add(' WHERE FLGUSO IN (''P'', ''G'') ')
     else qrySitFunc.SQL.Add(' WHERE FLGUSO = ''P''           ');

     qrySitFunc.SQL.Add(' ORDER BY DESCRICAO ');
     qrySitFunc.Open;

     qrySitPart.Close;
     qrySitPart.SQL.Clear;
     qrySitPart.SQL.Add(' SELECT IDSITPART,DESCRICAO, FLGINTERNO '+
                        ' FROM   SITPART '+
                        ' ORDER BY DESCRICAO ');
     qrySitPart.Open;

     qrySitPlanoPrev.Close;
     qrySitPlanoPrev.SQL.Clear;
     qrySitPlanoPrev.SQL.Add(' SELECT IDSITPLANOPREV, DESCRICAO '+
                             ' FROM SITPLANOPREV                '+
                             ' ORDER BY DESCRICAO ');
     qrySitPlanoPrev.Open;
     // SOL 116.634 / 549.962 - Renato Visoni
     //dblkpcmbSitPart.Enabled  := False;
     //dblkpcmbSitPlanoPrev.Enabled := False;
  end
  else begin
     qrySitFunc.Close;
     qrySitFunc.SQL.Clear;
     qrySitFunc.SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, SIT.TIPOSIT '+
                        ' FROM   SITFUNC SIT , EVENTOXSITFUNC E  '+
                        ' WHERE  SIT.IDSITFUNC  = E.IDSITFUNC    ');

     if prmMostraSitGeral
     then qrySitFunc.SQL.Add(' AND SIT.FLGUSO IN (''P'', ''G'') ')
     else qrySitFunc.SQL.Add(' AND SIT.FLGUSO = ''P''           ');

     qrySitFunc.SQL.Add(' AND    E.IDEVENTOGERADOR  = '+sIdEventoGerador+
                        ' ORDER BY SIT.DESCRICAO  ');
     qrySitFunc.Open;

     qrySitPart.Close;
     qrySitPart.SQL.Clear;
     qrySitPart.SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO '+
                        ' FROM   SITPART SIT , EVENTOXSITPART E  '+
                        ' WHERE  SIT.IDSITPART = E.IDSITPART  '+
                        ' AND    E.IDEVENTOGERADOR = '+sIdEventoGerador+
                        ' ORDER BY SIT.DESCRICAO ');
     qrySitPart.Open;

     qrySitPlanoPrev.Close;
     qrySitPlanoPrev.SQL.Clear;
     qrySitPlanoPrev.SQL.Add(' SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO '+
                             ' FROM   SITPLANOPREV SIT , EVENTOXSITPLAPREV E '+
                             ' WHERE  SIT.IDSITPLANOPREV = E.IDSITPLANOPREV '+
                             ' AND    E.IDEVENTOGERADOR = '+sIdEventoGerador+
                             ' ORDER BY SIT.DESCRICAO ');
     qrySitPlanoPrev.Open;

     dblkpcmbSitPatro.Enabled := True;
     dblkpcmbSitPart.Enabled  := True;
     dblkpcmbSitPlanoPrev.Enabled := True;
  end;
  qryOrgaoPrev.Close;
  qryOrgaoPrev.Params[0].value := -1;
  qryOrgaoPrev.Open;

  qryCargo.Close;
  qryCargo.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryCargo.Open;

  // SOL:121637 - Daniel Begnami
  qryGrauInstrucao.Close;
  qryGrauInstrucao.Open;
  // FIM

  //Início - William Santana - 209384/15928 KIN 2062832
  qryEstCivil.close;
  qryEstCivil.open;
  //Término - William Santana - 209384/15928 KIN 2062832

  qryCCusto.Close;
  qryCCusto.ParamByName('IdEmpresa').AsInteger := Sistema.IdEmpresa;
  qryCCusto.Open;
  qryNaturalidade.Close;  qryNaturalidade.Open;
  qryAgencia.Close;       qryAgencia.Open;
  qryBanco.Close;         qryBanco.Open;
  qryParamPessoa.Close;   qryParamPessoa.Open;
  qryOutrasInforms.Close; qryOutrasInforms.Open;
  qryOcupacao.close;      qryOcupacao.open;//Darivaldo Alencar SIG 27871
  qryfundacao.close;      qryfundacao.open;

  if bUsaModRespon
  then Pessoa.SaveModuloRespon := True
  else Pessoa.SaveModuloRespon := False;

  WindowState := wsMaximized;
end;

procedure TfrmCadElegivel.qryElegPatroBeforePost(DataSet: TDataSet);
begin
  inherited;

  if qryPlanosPrev.IsEmpty
  then qryElegPatro.FieldbyName('ParticipPrevid').AsInteger := 0;

  if (qryElegPatro.State = dsInsert) and
     (qryElegPatro.FieldbyName('TempoServAnterior').AsString = '')
  then qryElegPatro.FieldbyName('TempoServAnterior').AsInteger := 0;

  if (qryElegPatro.State = dsInsert) and
     (qryElegPatro.FieldbyName('TEMPONAOCREDITADO').AsString = '')
  then qryElegPatro.FieldbyName('TEMPONAOCREDITADO').AsInteger := 0;

  if (qryElegPatro.State = dsInsert) and
     (qryElegPatro.FieldbyName('TEMPOSERVANTREAL').AsString = '')
  then qryElegPatro.FieldbyName('TEMPOSERVANTREAL').AsInteger := 0;

  if (qryElegPatro.State = dsInsert) and
     (qryElegPatro.FieldbyName('TEMPOSITESPECIAL').AsString = '')
  then qryElegPatro.FieldbyName('TEMPOSITESPECIAL').AsInteger := 0;

  qryElegPatro.FieldbyName('ParticipAssist').AsInteger := 0;
  qryElegPatro.FieldByName('IdEmpresaProp').AsInteger := qryCCusto.FieldByName('IdEmpresa').AsInteger;
  qryElegPatro.FieldByName('DESCRICAO').AsString := qryVinculaFunc.FieldByName('DESCRICAO').AsString;;
end;

procedure TfrmCadElegivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryElegPatro.Close;         qryElegPatro.Unprepare;
  qryPlanosPrev.Close;        qryPlanosPrev.Unprepare;
  qryContaBancaria.Close;     qryContaBancaria.Unprepare;
  qryOutrasInforms.Close;     qryOutrasInforms.Unprepare;
  qryOcupacao.close;          qryOcupacao.Unprepare;//Darivaldo Alencar SIG 27871
  qryPF2.close;               qryPF2.Unprepare;     //Darivaldo Alencar SIG 27871
  qryDepen.Close;             qryDepen.Unprepare;
  qryDepenTit.Close;          qryDepenTit.Unprepare;
  qryfundacoes.Close;         qryfundacoes.Unprepare;
  qryEventosPrev.Close;       qryEventosPrev.Unprepare;
  qryCtrlInterface.Close;     qryCtrlInterface.Unprepare; 
  qryHstContEventosPR.Close;  qryHstContEventosPR.Unprepare;
  qryContribPrevPartP.Close;  qryContribPrevPartP.Unprepare;
  qryHstContribPrev.Close;    qryHstContribPrev.Unprepare;
  qryHstRubSal.Close;         qryHstRubSal.Unprepare;
  qryHistFuncPrev.Close;      qryHistFuncPrev.Unprepare;
  qryHstAtrasoContrib.Close;  qryHstAtrasoContrib.Unprepare;
  qryHstRubricaXPess.Close;   qryHstRubricaxPess.Unprepare;
  qryOrgaoPrev.close;

  //Início - William Santana - Sol 161550 Kin 1717512
  qryReprLegal.close;
  qryLogReprLegal.close;
  QryTipoRecebedor.close;
  //Término - William Santana - Sol 161550 Kin 1717512

  //Início - William Santana - SIG 55755
  qryPerfilInvest.close;
  qryPerfilAux.Close;
  qryNomePI.close;
  qryPlanPrevPI.close;
  //Fim - William Santana - SIG 55755

  // Se Form de Consulta Geral de Pessoa estiver aberto então retorna a normal.
  
  WindowState:= wsNormal;
  //BRUNO AZEVEDO SOL 135094 KINTANA 805800
  //If frmConsPessoaGeral <> Nil
  // Then frmConsPessoaGeral.WindowState:= wsNormal;

  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
end;

procedure TfrmCadElegivel.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   try
      qryElegPatro.CancelUpdates;
      qryPlanosPrev.CancelUpdates;
      qryContaBancaria.CancelUpdates;
      qryOutrasInforms.CancelUpdates;
      qryOcupacao.CancelUpdates;//Darivaldo Alencar SIG 27871
      if not(qryPF2.state = dsInactive)then  qryPF2.CancelUpdates;//Darivaldo Alencar SIG 27871
      qryDepen.CancelUpdates;
      qryDepentit.CancelUpdates;
      qryfundacoes.CancelUpdates;
      qryHistFuncPrev.CancelUpdates;
      // Cancelar querys do preparo de contribuicao
      qryEventosPrev.CancelUpdates;
      qryHstContEventosPR.CancelUpdates;
      qryContribPrevPartP.CancelUpdates;
      qryHstContribPrev.CancelUpdates;
      qryHstRubSal.CancelUpdates;
      qryHstAtrasoContrib.CancelUpdates;
      qryCtrlInterface.CancelUpdates;
      qryHstRubricaxPess.CancelUpdates;
      qryLogReprLegal.CancelUpdates; // William Santana SOL 161550 KIN 1717512
      qryReprLegal.CancelUpdates;    // William Santana SOL 161550 KIN 1717512
      qryPerfilInvest.CancelUpdates;  //William Santana SIG 55755

      //edilaine - SIG33979 - inicio
      if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
         dtmBaseDados.dbBaseDados.RollBack;
      end;
      //edilaine - SIG33979 - fim

   except
      raise;
   end;
   SetLength(aPlanoDatas,1); aPlanoDatas[0] := '';
end;

procedure TfrmCadElegivel.CmeDetalheInsert(Sender: TObject);
begin
   CmeCadastro.Operacao := opInserir; // Michelle Mota - SIG 21866
   inherited;


   If pgCtrlDetalhe.ActivePage = tbsDet
   Then Begin // Endereço
     dbedNomeEndereco.Field.Value := 'RESIDENCIAL';

     chkTipoEndereco.Checked[0]   := False;
     chkTipoEndereco.Checked[1]   := False;
     chkTipoEndereco.Checked[2]   := False;
     chkTipoEndereco.Checked[3]   := False;
     chkTipoEndereco.Checked[4]   := False;
     //Cássio Rovaroto - SIG nº 134293 - Início
     if Sistema.IdModulo = 452 then
      dbedNomeEndereco.Enabled     := False;
     //Cássio Rovaroto - SIG nº 134293 - Fim
   End
   Else
   If pgCtrlDetalhe.ActivePage = tbsTelefone
   Then Begin // Telefone
     qryTelefoneIDPESSOA.AsInteger := qry.FieldByname('IDPESSOA').AsInteger;   //edilaine - SIG33979

     chkTipoTelefone.Checked[0]   := False;
     DBEDDDD.SetFocus;
   End
   Else
   if pgCtrlDetalhe.ActivePage = tbshtFundacao
   then begin //DadosFuncionais
      qryFundacoes.FieldByname('IDPESSOA').Value := qry.FieldByname('IDPESSOA').AsString;
      dblkpcmbFundacao.SetFocus ;
   end
   else if pgCtrlDetalhe.ActivePage = tbsElegivel
   then begin //DadosFuncionais
      qryElegPatro.FieldByname('IDPESSOA').Value   := qry.FieldByname('IDPESSOA').AsString;
      qryElegPatro.FieldByname('FLGDIRETOR').Value := 0;
      dbrgrpDiretor.ItemIndex                      := 0;
      dblkpcmbPatro.SetFocus ;
   end
   else if pgCtrlDetalhe.ActivePage = tbsPlanosPrev
        then begin // Planos Previdenciarios
           qryPlanosPrev.FieldByname('IDPESSOA').Value      := qry.FieldByname('IDPESSOA').AsString;
           qryPlanosPrev.FieldByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
           qryPlanosPrev.FieldByName('SalParticipacao').AsFloat := qryElegPatro.FieldByName('SalTotal').AsFloat;
           edSalarioPart.Text := qryPlanosPrev.FieldByName('SalParticipacao').AsString;
           dblkpcmbPlano.SetFocus ;
        end
   else if pgCtrlDetalhe.ActivePage = tbsOutrasInforms
        then begin // Outras Informações
            //    Darivaldo Alencar SIG 27871 -inicio
            //qryOutrasInforms.FieldByname('IDPESSOA').Value   := qry.FieldByname('IDPESSOA').AsString;
            //dblkParamPessoa.Enabled := True;
            //dblkParamPessoa.SetFocus ;
            if (qryAtual = qryOutrasInforms) then
                begin
                    qryOutrasInforms.FieldByname('IDPESSOA').Value   := qry.FieldByname('IDPESSOA').AsString;
                    dblkParamPessoa.Enabled := True;
                    dblkParamPessoa.SetFocus ;
                end
              else begin
                    qryOcupacao.FieldByname('IDPESSOA').AsString   := qry.FieldByname('IDPESSOA').AsString;
                    dbeOcupProfissional.SetFocus ;
                end
             //    Darivaldo Alencar SIG 27871 -fim
        end
   else if pgCtrlDetalhe.ActivePage = tbsContaBancaria
        then begin // Conta Bancaria
           qryContaBancaria.FieldByname('IDPESSOA').Value := qry.FieldByname('IDPESSOA').AsString;
           qryContaBancaria.FieldByname('TipoConta').Value := 1;
           //Brunno Mattos - SOL 153260 - KTN 1167636 Inicio
           qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.Add(' SELECT IDTITULAR FROM DEPENTIT ' +
                          ' WHERE  IDPESSOA = ' + qry.FieldByname('IDPESSOA').AsString);
           qryAux.Open;
           qryContaBancaria.FieldByname('IDTITULAR').Value := qryAux.FieldByName('IDTITULAR').AsInteger;
           //Brunno Mattos - SOL 153260 - KTN 1167636 Fim
           rgrpTipoConta.ItemIndex := 0;
           edDigBanco.Text         := '';
           edDigAgencia.Text       := '';
           edDigBanco.SetFocus ;
        end

   //Início - William Santana SOL - 161550 KIN 1717512
   else if pgctrlDetalhe.ActivePage = tbsReprLegal then
   begin
     qryReprLegal.Insert;
     tb97BotoesDetalhe.Visible     := False;
     sbtnExcluiDet.Visible         := False;
     rgSituacaoAtual.ItemIndex     := -1;
   end
   //Término - William Santana SOL - 161550 KIN 1717512G
   //Início - William Santana - SIG 55755
   else if pgctrlDetalhe.ActivePage = tbsPerfilInvest then
   begin
    qryPerfilInvest.Insert;
    edtPlanoContPI.text := '';
   end;
   //Fim - William Santana - SIG 55755

end;

procedure TfrmCadElegivel.CmeDetalheDelete(Sender: TObject);
begin
   if pgCtrlDetalhe.ActivePage = tbsPlanosPrev
   then begin // Planos Previdenciarios
      // Apagar tabelas inseridas pelo preparo de contribuicao
      if not qryEventosPrev.IsEmpty
      then begin
         qryEventosPrev.First;
         while not qryEventosPrev.Eof do qryEventosPrev.Delete;
      end;

      if not qryHstContEventosPR.IsEmpty
      then begin
         qryHstContEventosPR.First;
         while not qryHstContEventosPR.Eof do qryHstContEventosPR.Delete;
      end;

      if not qryContribPrevPartP.IsEmpty
      then begin
         qryContribPrevPartP.First;
         while not qryContribPrevPartP.Eof do qryContribPrevPartP.Delete;
      end;

      if not qryHstContribPrev.IsEmpty
      then begin
         qryHstContribPrev.First;
         while not qryHstContribPrev.Eof do qryHstContribPrev.Delete;
      end;

      if not qryHstRubSal.IsEmpty
      then begin
         qryHstRubSal.First;
         while not qryHstRubSal.Eof do
            if qryHstRubSal.FieldByName('FlgSrb').AsInteger = 1 then qryHstRubSal.Delete;
      end;

      if not qryHstAtrasoContrib.IsEmpty
      then begin
         qryHstAtrasoContrib.First;
         while not qryHstAtrasoContrib.Eof do qryHstAtrasoContrib.Delete;
      end;

      if not qryCtrlInterface.IsEmpty
      then begin
         qryCtrlInterface.First;
         while not qryCtrlInterface.Eof do qryCtrlInterface.Delete;
      end;
   end;

   if pgCtrlDetalhe.ActivePage = tbsElegivel
   then begin
     qryHistFuncPrev.First;
     while not qryHistFuncPrev.Eof do qryHistFuncPrev.Delete;
   end;

   inherited;
end;

procedure TfrmCadElegivel.bbtnOkDetClick(Sender: TObject);
var bMostraContribuicoes : boolean;
  iCount, iQtde : Integer;
  sDataInicio, sDataFim : string ;
  bEnderecoInvalido : boolean; // Felipe A. Santos SOL 208311 KTN 2020366


begin
  bbtnConfirmar.Enabled := False; // Felipe A. Santos SOL208311 KTN 2020366

  bMostraContribuicoes := False;
  iTipoOpcaoIR         := cmbTipoOpIR.ItemIndex+1; //TAES - SIG91757
  if (QryHistoricoTipoIr.State in [dsInsert,dsEdit]) then
     QryHistoricoTipoIr.post;
    //Renato Visoni Sol 112013 / Kintana 520381
  berroConta       := False;

  iIdContaBancariaGlobal := qryContaBancaria.FieldByname('IDCBANCARIA').asString;

 if (pgctrlDetalhe.ActivePage = tbsTelefone) then  //SOL 127643 Thiago Passos
     begin                                   
        if chkTipoTelefone.Checked[3] then
          if StrToInt(DBEDNUMERO.text[1]) < 6 then
           begin
            MessageDlg('Número de telefone celular inválido.', mtInformation, [mbOK], 0);
            exit;
           end;

       //Wylliam Leite da Silva - SOL 242767 PPM 671063
        {
        if Length(DBEDDDD.Text) <> 2 then
          begin
            MessageDlg('Número DDD inválido.', mtInformation, [mbOK], 0);
            exit;
           end;
         }
        if StrToInt(DBEDDDD.Text[1])=0 then
          begin
            MessageDlg('Número DDD inválido.', mtInformation, [mbOK], 0);
            exit;
           end;
     end;

  //edilaine - SIG33979 - inicio
  if (pgctrlDetalhe.ActivePage = tbsContato) then
    begin
      if not(ValidaEMail(dbedcontatoemail.Text))then
      begin
        MsgDlg(MSG028,'Atenção',mtInformation,[mbOK],0);
        dbedcontatoemail.setfocus;
        Exit;
      end;
    end;
  //edilaine - SIG33979 - fim


  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) then begin
    if rgrpTipoConta.Value = '2' then begin
      iCount           := 0;

      qryContaBancaria.First;
      while not qryContaBancaria.Eof do begin
        if qryContaBancaria.FieldByname('TIPOCONTA').asInteger = 2 then begin
          if (qryContaBancaria.FieldByname('IDCBANCARIA').asString <>iIdContaBancariaGlobal) then begin
            Inc(iCount);
          end;
        end;
        qryContaBancaria.Next;
      end;

      if iIdContaBancariaGlobal <> '' then begin
        qryContaBancaria.Locate('IDCBANCARIA',(iIdContaBancariaGlobal),[]);
      end;

      if iCount > 0 then begin
        MessageDlg('Já existe conta salário cadastrada para essa pessoa', mtInformation, [mbOK], 0);
        berroConta := true;
        Repaint;
        exit;
      end;
    end;
  end;

  if (pgctrlDetalhe.ActivePage = tbsElegivel) then
  begin
     if not VerificaElegivel then
     begin
        TiraSQL(qryAux);
        Exit;
     end;

  end //if activePage = tbsElegivel
  else if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
    if dsPlanosPrev.DataSet.State in dsEditModes then
    begin
      if not(qryPlanosPrev.FieldByName('DATAOPCAOIR').IsNULL) and
         (qryPlanosPrev.FieldByName('INSCRICAODATA').AsDateTime > qryPlanosPrev.FieldByName('DATAOPCAOIR').AsDateTime) then
      begin
         MsgDlg('A Data da Opção de Tributação não pode ser anterior à Data de Inscrição.', 'AdmPrev', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;
    end;

    if (Not bVeioDoMenu) And
       (not VerificaParticipante) then
    begin
      TiraSQL(qryAux);
      Exit;
    end;

    //Renato Visoni SOL 125579
    If (trim(cmbTipoOpIR.Text) = '') Then
    Begin
      MsgDlg('Escolha a Opção de Tabela de IR "Tabela Progressiva" ou "Tabela Regressiva" na Tela de Planos Previdenciários.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;

    If (dbDataOpcaoIR.Text = '') and (not dbDataOpcaoIR.Enabled) Then //Higor Nayde 201318
    Begin
      MsgDlg('Escolha a Data da Opção de Tributação de IR na Tela de Planos Previdenciários.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;
    //Renato Visoni SOL 125579

    //WO22785 Leandro inicio
    if (iTipoOpcaoIR > 0) and (dbDataOpcaoIR.Text <> '') and (bVeioDoMenu) and (not ValidaGetDtIniHistTribIR(qryPlanosPrev.FieldByName('IDPESSOA').VALUE)) then
    begin
       MsgDlg('A Data da Opção de Tributação de IR precisa ser posterior à Data já existente no historico', 'Informação', mtInformation, [mbOk], 0);
       Repaint;
       Exit;
    end;
    //WO22785 Leandro fim

    // Se estiver inserindo o participante, verificar se o salario está preenchido
    // e calcular contribuicoes
    if (dsPlanosPrev.DataSet.State = dsInsert) then
    begin
      If iTipoOpcaoIR = -1 Then
      Begin
        MsgDlg('Escolha a Opção de Tabela de IR "Tabela Progressiva" ou "Tabela Regressiva" na Tela de Planos Previdenciários.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      End;

      If ((dbDataOpcaoIR.Text = '') And (iTipoOpcaoIR > 0))and (not dbDataOpcaoIR.Enabled) Then //Higor Nayde 201318
      Begin
        MsgDlg('Escolha a Data da Opção de Tributação de IR na Tela de Planos Previdenciários.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      End;

      // SOL:116855  Daniel Begnami
      if ((qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsInteger in [25, 26, 27, 28, 29]) and (cmbTipoOpIR.itemindex = 1)) then //TAES - SIG91757
      Begin
        MsgDlg('ATENÇÃO: Não é possível selecionar o opção de tributação de IR Regressiva para planos saldados.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      End;
      // FIM


      if (iTipoOpcaoIR > 0) and (dbDataOpcaoIR.Text <> '') and (bVeioDoMenu) and (dbDataOpcaoIR.Date < dbdtInscricao.Date) then //Higor Nayde 201318
      begin
         MsgDlg('A Data da Opção de Tributação de IR precisa ser posterior à Data de Inscrição', 'Informação', mtInformation, [mbOk], 0);
         Repaint;
         Exit;
      end;



      if (dbedSalPartInsc.Text = '') And
         (prmFLGINSCSALZERO = 0) Then
      begin
        MsgDlg('Preencher salário de participação.','Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
      end;


      if not AtualizaSitParticipante
      then begin
        frmAguarde.Apaga;
        MsgDlg('Ocorreram problemas na atualização do status do participante. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
      end;

      if not GravaContribuicoesParticipante then
      begin
        frmAguarde.Apaga;
        MsgDlg('Ocorreram problemas no cálculo das contribuições do participante. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
      end
      else bMostraContribuicoes := True;
      frmAguarde.Apaga;
    end
    else
    begin

      If qryPlanosPrev.State = dsEdit Then
      Begin
        If (iTipoOpcaoIRAnt <> 0) And (iTipoOpcaoIR = 0) Then
        Begin
          MsgDlg('Escolha a Opção de Tabela de IR "Tabela Padrão" ou "Tabela Progressiva" na Tela de Planos Previdenciários.', 'Informação', mtInformation, [mbOk], 0);
          Exit;
        End;
      End;

      // SOL:116855  Daniel Begnami
      if ((qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsInteger in [25, 26, 27, 28, 29]) and (cmbTipoOpIR.itemindex = 1)) then //TAES - SIG91757
      Begin
        MsgDlg('ATENÇÃO: Não é possível selecionar o opção de tributação de IR Regressiva para planos saldados.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      End;
      // FIM

    End;

  end//if activePage = tbsPlanosPrev
  else if (pgctrlDetalhe.ActivePage = tbsContaBancaria) then
  begin
    if not VerificaContaBancaria then Exit;


  end;

  if (pgctrlDetalhe.ActivePage = tbsOutrasInforms) then
  begin
     if (qryAtual =  qryOutrasInforms) then begin //Darivaldo alencar SIG 27871
         if Trim(dbedValor.Text) = '' then // SOL 172485 KINTANA 1560737
         begin
            MsgDlg('Conteúdo não pode ser nulo.','Informação',mtInformation,[mbOk,mbHelp],0);
            dbedValor.SetFocus;
            Exit;
         end; // SOL 172485 KINTANA 1560737

         if Trim(dblkParamPessoa.Text) = '' then // SOL 172485 KINTANA 1560737
         begin
            MsgDlg('Parâmetro não pode ser nulo.','Informação',mtInformation,[mbOk,mbHelp],0);
            dblkParamPessoa.SetFocus;
            Exit;
         end; // SOL 172485 KINTANA 1560737
     
     if Trim(dbedValor.Text) = '' then // SOL 172485 KINTANA 1560737
     begin
        MsgDlg('Conteúdo não pode ser nulo.','Informação',mtInformation,[mbOk,mbHelp],0);
        dbedValor.SetFocus;
        Exit;
     end; // SOL 172485 KINTANA 1560737

         if Trim(dtInicio.Text) = '' then
         begin
            MsgDlg('Data não pode ser nula.','Informação',mtInformation,[mbOk,mbHelp],0);
            dtInicio.SetFocus;
            Exit;
         end;

         if Trim(DtFim.Text) <> '' then
            if DtFim.Date < DtInicio.Date Then
            begin
               MsgDlg('Data final não pode ser menor que a inicial.','Informação',mtInformation,[mbOk,mbHelp],0);
               dtFim.SetFocus;
               Exit;
            end;

         // executar rotina da validação

         if (qryParamPessoa.FieldByName('TIPO').AsString = 'F') or
            (qryParamPessoa.FieldByName('TIPO').AsString = 'V') Then
         Begin
            if qryParamPessoa.FieldByName('TIPO').AsString  = 'F' Then    // Validação para FLAG
            Begin
               if qryParamPessoa.FieldByName('VALIDACAO').AsString <> '' then   // // SOL 172485 KINTANA 1560737
               begin
                  qryAux.SQL.Text := 'SELECT 1 FROM DUAL WHERE ' + QuotedStr(Trim(dbedValor.Text)) +  ' IN '+
                                      qryParamPessoa.FieldByName('VALIDACAO').AsString ;
                  qryAux.Open;
                  if qryAux.EOF Then
                  Begin
                     MsgDlg('Valor não atende a Validação.','Informação',mtInformation,[mbOk,mbHelp],0);
                     dbedValor.SetFocus;
                     Exit;
                  end;
               end;  // SOL 172485 KINTANA 1560737
            end;
            if qryParamPessoa.FieldByName('TIPO').AsString  = 'V' Then     // Validação para Valores
            Begin
               if qryParamPessoa.FieldByName('VALIDACAO').AsString <> '' then  // SOL 172485 KINTANA 1560737
               begin
                  qryAux.SQL.Text := 'SELECT 1 FROM DUAL WHERE ' + Trim(dbedValor.Text) + // ' IN '+  WO8107 Ferrari
                                      qryParamPessoa.FieldByName('VALIDACAO').AsString ;

                  qryAux.Open;
                  if qryAux.EOF Then
                  Begin
                     MsgDlg('Valor não atende a Validação.','Informação',mtInformation,[mbOk,mbHelp],0);
                     dbedValor.SetFocus;
                     Exit;
                  end;
               End; // SOL 172485 KINTANA 1560737
            end;
         end;
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
               qryOcupacao.fieldbyname('IDPESSOAPPE').AsInteger := StrToInt(GetSequence('PESSOAPPE')) + (qryOcupacao.recordcount);
         end
     //Darivaldo alencar SIG 27871 - fim
     end;
  end; //if activePage = tbsOutrasInforms


  // Exibir as contribuicoes calculadas
  if bMostraContribuicoes then
  begin
     MostraContribuicoesInscricao;
     MsgDlg('Caso não concorde com os valores apresentados, '+
            'exclua a participante do plano e repita a operação. ','Informação',mtInformation,[mbOk,mbHelp],0);
  end;
  if bAteraTipoIr then
  begin

     bInsereOpcaoIr  := False;
     sDataFim := '';
     sDataInicio := '';

     if not(dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao)
     then dtmBasedados.dbBaseDados.StartTransaction;

     if QryHistoricoTipoIr.fieldByname('DTINICIO').AsDateTime > 0 then
        sDataInicio := QryHistoricoTipoIr.fieldByname('DTINICIO').AsString
     else
     begin
        MsgDlg('A data de opção do histórico de tributação de IR deve ser informada. ','Informação',mtInformation,[mbOk,mbHelp],0);
        exit;
     end;

     if QryHistoricoTipoIr.fieldByname('DTFIM').AsDateTime > 0 then
        sDataFim := QryHistoricoTipoIr.fieldByname('DTFIM').AsString;


     if (sDataFim <> '') and (sDataInicio <> '') then
     begin
        if strtodate(sDataFim) < strtodate(sDataInicio) then
        begin
           MsgDlg('A Data Final Deve ser Maior que a Data Inícial. ','Informação',mtInformation,[mbOk],0);
           exit;
        end;
        QryhstOpcaoIr.Close;
        QryhstOpcaoIr.SQL.Clear;
        QryhstOpcaoIr.SQL.Add('UPDATE HISTOPIR SET DTINICIO = TO_DATE('+QuotedStr(sDataInicio)+',''DD/MM/YYYY''), DTFIM = TO_DATE('+QuotedStr(sDataFim)+',''DD/MM/YYYY'')');
        QryhstOpcaoIr.SQL.Add(' WHERE IDHISTOPIR  = '+QryHistoricoTipoIr.fieldByname('IDHISTOPIR').AsString);
        QryhstOpcaoIr.ExecSQL;
     end
     else
     if (sDataFim = '') and (sDataInicio <> '') then
     begin
           QryHistoricoTipoIr.first;
           iQtde := 0;
           while not(QryHistoricoTipoIr.eof) do
           begin
              if QryHistoricoTipoIr.FieldByName('DTFIM').AsString = '' then
                 iQtde := iQtde + 1;
              QryHistoricoTipoIr.next;
           end;
           if  iQtde > 1 then
           begin
              MsgDlg('É Permitido apenas um histórico de tributação de IR em Aberto. ','Informação',mtInformation,[mbOk],0);
              exit;
           end
           else
           begin
              QryhstOpcaoIr.Close;
              QryhstOpcaoIr.SQL.Clear;
              QryhstOpcaoIr.SQL.Add('UPDATE HISTOPIR SET DTINICIO = TO_DATE('+QuotedStr(sDataInicio)+',''DD/MM/YYYY'')');
              QryhstOpcaoIr.SQL.Add(',DTFIM = null');
              QryhstOpcaoIr.SQL.Add(' WHERE IDHISTOPIR  = '+QryHistoricoTipoIr.fieldByname('IDHISTOPIR').AsString);
              QryhstOpcaoIr.ExecSQL;
           end;
     end;
  end
  else if bExcluiTipoIr then
     bInsereOpcaoIr  := false
  else
     bInsereOpcaoIr  := True;

  bAteraTipoIr  := false;
  bExcluiTipoIr := false;
  //bbtnVoltarDetClick(self);
  spbtHistipoIrAlterar.Down := false;
  spbtHistipoIrExcluir.Down := false;

  // Felipe A. Santos - SOL208311 KTN 2020366
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
      bEnderecoInvalido := (qryEnderecoIDCIDADES.IsNull) or (qryEnderecoNOME.AsString = '');
  end;
  // Felipe A. Santos - SOL208311 KTN 2020366  - fim

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin

    if dbeResponsavel.Text = '' then
    begin
     MsgDlg('A seleção do Responsável é obrigatória','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if lkpcmbTipoRecebedor.Text = '' then
    begin
     MsgDlg('A seleção do Tipo de Responsável é obrigatória','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if (tmpckrDATAINICIO.text = '') then
    begin
     MsgDlg('É necessário o preenchimento do período de Tutela/Curatela','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if (tmpckrDATATERMINO.text = '') and (qryReprLegal.FieldByName('CODTIPORESPONSAVEL').AsString <> '') then
    begin
      MsgDlg('É necessário o preenchimento do período de Tutela/Curatela','Erro',mtError ,[mbOk],0);
      abort;
    end;

    if (tmpckrDATAINICIO.Date > tmpckrDATATERMINO.Date) then
    begin
      MsgDlg('É necessário o preenchimento do período de Tutela/Curatela','Erro',mtError ,[mbOk],0);
      abort;
    end;

    if (tmpckrDATATERMINO.text <> '') and (qryReprLegal.FieldByName('CODTIPORESPONSAVEL').AsString <> '') then
    begin
      timepickerDATAChange(self);
      rgSituacaoAtualClick(self);
    end;

    if ( bVeiodoIndicaRec ) and (rgSituacaoAtual.itemIndex <> 0) then
    begin
      MsgDlg('É obrigatório o cadastro de documento vigente nos'
            +' casos em que o recebedor do benefício é o representante legal','Erro',mtError ,[mbOk],0);
      abort;
    end;

    try
    if qryReprLegal.State in [dsInsert,dsEdit] then
      qryReprLegal.Post;                              
    except
       raise;
    end;

    pnlReprLegal.visible       := False;
    pnlGrdReprLegal.visible    := True;
    tb97BotoesDetalhe.Visible  := True;
    sbtnExcluiDet.Visible      := True;
    pnlReprLegal.Repaint;
    pnlGrdReprLegal.Repaint;

    bbtnCancelarDetClick(sender); //essa chamada não cancela o cadastro, apenas volta para a tela de grid

  end;
  //Término - William Santana SOL 161550 KIN 1717512
  //Início - William Santana - SIG 55755
  if (pgctrlDetalhe.ActivePage = tbsPerfilInvest) then
  begin
    //validações
    if lckupPlanPrevPI.Text = EmptyStr then
    begin
     MsgDlg('É necessário informar o Plano Previdenciário do Perfil de Investimento!','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if lckupNomePerfilPI.Text = EmptyStr then
    begin
     MsgDlg('É necessário informar o Nome do Perfil de Investimento!','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if dtDtIniPI.Text = EmptyStr then
    begin
     MsgDlg('É necessário informar a Data Início do Perfil de Investimento','Erro',mtError ,[mbOk],0);
     abort;
    end;

    if qryNomePI.FieldByName('FLGATIVO').AsInteger = 0 then
    begin
     MsgDlg('Não é permitido associar um Perfil de Investimento inativo!','Erro',mtError ,[mbOk],0);
     abort;
    end;              

    if (dtDtFimPI.Text <> EmptyStr) and (dtDtIniPI.Date > dtDtFimPI.Date) then
    begin
      MsgDlg('Incompatibilidade entre datas. Verifique!','Erro',mtError ,[mbOk],0);
      abort;
    end;

    if (VerificaPeriodoPerfilInvest) then
    begin
      MsgDlg('Não é permitido associar mais de um Perfil de Investimento para o mesmo' +
             ' Participante e Plano Previdenciário no mesmo período!','Erro',mtError ,[mbOk],0);
      abort;
    end;

    try
     if qryPerfilInvest.State in [dsInsert,dsEdit] then
       qryPerfilInvest.Post;
    except
       raise;
    end;

    bbtnCancelarDetClick(sender); 
  end;
  //Fim - William Santana - SIG 55755

  try
     inherited;
  except
     Exit;
  end;
  //Darivaldo Alencar SIG27871  -inicio
  MostraEscondeGridOutrasInformacoes;
  if (qryOcupacao.state in [dsInsert]) then
       qryOcupacao.fieldbyname('DTINICIO').asString:= formatdatetime('dd/mm/yyyy', now);
  //Darivaldo Alencar SIG27871  -fim

  // Limpa os campos da Conta Bancária
  if qryContaBancaria.State in [dsInsert] then
  begin
     dblkpcmbBanco.Text := '';
  end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
    if Trim(sIdEventoGerador) = '' then
      sbtnInsDet.Visible := False // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
    else
      sbtnInsDet.Visible := True; // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.
  end
  else
    sbtnInsDet.Visible := True;

  // Felipe A. Santos - SOL208311 KTN 2020366 

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if bEnderecoInvalido then
       Exit;
  end;

  bbtnConfirmar.Enabled := True;

  // Felipe A. Santos - SOL208311 KTN 2020366  - fim

   FormataEdit(edPaiDetalhe2.name); //Darivaldo Alencar SIG 27871
end;



procedure TfrmCadElegivel.qryElegPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if not qryElegPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
  qryPlanPrev.Open;

  //Início - William Santana - SIG 55755
  qryPlanPrevPI.Close;
  qryPlanPrevPI.ParamByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
  qryPlanPrevPI.ParamByName('IDPESSOA').AsInteger  := qryElegPatro.FieldByName('IDPESSOA').AsInteger;   
  qryPlanPrevPI.Open;

  qryNomePI.Close;
  qryNomePI.ParamByName('IDPLANOPREV').AsInteger := qryPlanPrevPI.FieldByName('IDPLANOPREV').AsInteger;
  qryNomePI.Open;
  //Fim - William Santana - SIG 55755

  If qryElegpatro.FieldByName('IDCARGOEXT').IsNull Then
    edCodFuncaoAtual.Clear
  Else  dblkpcmbCargoCloseUp(self,nil,nil,false);

end;

procedure TfrmCadElegivel.tbcDetalheChange(Sender: TObject);
begin
  bbtnOpcoes.Visible := (pgctrlDetalhe.ActivePage = tbsElegivel);//Darivaldo Alencar SIG 27871
  if (pgctrlDetalhe.ActivePage = tbsElegivel) and
     (qryElegPatro.State in [dsInsert,dsEdit])
  then begin
     if not VerificaElegivel
     then begin
        pgctrlDetalhe.ActivePage := tbsElegivel;
        tbcDetalhe.TabIndex := 4;
        Abort;
     end;
  end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) and
     (qryPlanosPrev.State in [dsInsert,dsEdit])
  then begin
  
     if not VerificaParticipante
     then begin
        pgctrlDetalhe.ActivePage := tbsPlanosPrev;
        tbcDetalhe.TabIndex := 5;
        Abort;
     end;
  end;

  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) and
     (qryContaBancaria.State in [dsInsert,dsEdit])
  then begin
     if not VerificaContaBancaria
     then begin
        pgctrlDetalhe.ActivePage := tbsContaBancaria;
        tbcDetalhe.TabIndex := 7;
        Abort;
     end;
  end;

  { Limpar o datafield do edit para se mudar de dataset
    nao dar erro de campo inexistente }
  if dbedPaiDetalhe.DataField = 'PATROCINADORA'
  then dbedPaiDetalhe.DataField := '';

  inherited;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
      begin
           if Trim(sIdEventoGerador) = '' then
              sbtnInsDet.Visible := False // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
           else
              sbtnInsDet.Visible := True; // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.
      end
  else
      sbtnInsDet.Visible := True;

  if (pgctrlDetalhe.ActivePage = tbshtFundacao) then
  begin
       dbedPaiDetalhe.Visible := False;
       dbedPaiDetalhe.DataSource := nil;
       dbedPaiDetalhe.DataField := '';
       tb97TituloDetalhe.Visible := False;
       qryFundacao.Close;
       qryFundacao.ParamByName('IDPESSOA').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
       qryFundacao.Open;
  end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
       dbedPaiDetalhe.Visible        := True;
       dbedPaiDetalhe.DataSource     := dsElegPatro;
       dbedPaiDetalhe.DataField      := 'PATROCINADORA';
       qryPlanosPrev.Filter          := 'IDPESSJUR = '''+IntToStr(qryElegPatro.FieldByName('IDPESSJUR').AsInteger)+'''';
       tb97TituloDetalhe.Visible     := True;
       qryPlanPrev.Close;
       qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryElegPatro.FieldByName('IdPessJur').AsInteger;
       qryPlanPrev.Open;
  end;

  //Início - William Santana SOL 161550 KIN 1717512
  if (pgctrlDetalhe.ActivePage = tbsReprLegal) then
  begin
    tb97BotoesDetalhe.Visible     := True;
    sbtnExcluiDet.Visible         := True;

    if not(qryReprLegal.state in[dsInsert, dsEdit]) then
    begin
     pnlReprLegal.visible := false ;
     pnlGrdReprLegal.visible := True ;
    end;

    if not qryReprLegal.Prepared then qryReprLegal.prepare;
    qryReprLegal.ParamByName('IDPESSJUR').AsInteger  := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
    qryReprLegal.ParamByName('IDPESSOA').AsInteger   := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
    qryReprLegal.ParamByName('IDTITULAR').AsInteger  := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
    qryReprLegal.Open;

    if not qryLogReprLegal.Prepared then qryLogReprLegal.prepare;
    qryLogReprLegal.ParamByName('IDPESSJUR').AsInteger  := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
    qryLogReprLegal.ParamByName('IDPESSOA').AsInteger   := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
    qryLogReprLegal.ParamByName('IDTITULAR').AsInteger  := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
    qryLogReprLegal.Open;

    pnlReprLegal.Repaint;
    pnlGrdReprLegal.Repaint;
  end;
  //Término - William Santana SOL 161550 KIN 1717512

  //Início - William Santana SIG 55755
  if (pgctrlDetalhe.ActivePage = tbsPerfilInvest) then
  begin
    qryPerfilInvest.Close;
    qryPerfilInvest.ParamByName('IDPESSOA').AsInteger := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
    qryPerfilInvest.ParamByName('IDPESSJUR').AsInteger := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
    qryPerfilInvest.Open;
  end;
  //Fim - William Santana SIG 55755

  //BRUNO AZEVEDO SOL 244852 PPM 626115
  VerificaPermissao();
  BuscaOBSR;  //Darivaldo Alencar -SIG 27871
end;

procedure TfrmCadElegivel.dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
  bErro               : Boolean;
  sUltimoNumeroPlano  : string;
  sNomeSequence       : string;
  iProxIncricaoNumero : Integer;
begin

  if dblkpcmbPlano.Text = '' then Exit;
  
  // Tirei o montaselect e coloquei a qryElegpatro e qryPessoaFisica.
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PL.NOME AS PLANO, SP.DESCRICAO AS SITUACAO, PP.INSCRICAONUMERO, PP.INSCRICAODATA '+
             ' FROM   PLANPREV PL, PARTPREVPLAN PP, SITPART SP '+
             ' WHERE  PP.IDPESSJUR = ' + qryElegpatro.FieldByName('IDPESSJUR').AsString +
             ' AND    PP.IDPLANOPREV   = '+qryPlanPrev.FieldByName('IDPLANOPREV').AsString+
             ' AND    PP.IDPESSOA = ' + qryPessoaFisica.FieldByName('IDPESSOA').AsString +
             ' AND    PP.IDSITPART     = SP.IDSITPART '+
             ' AND    PP.IDPLANOPREV   = PL.IDPLANOPREV '+
             ' AND    PP.FLGDESATIVADO = 0 ');
     Open;
     if not IsEmpty
     then begin
        MsgDlg('O participante já está inscrito no plano '+qryPlanPrev.FieldByName('Nome').AsString+' desde '+
                  FieldByName('InscricaoData').AsString+' com a inscrição nº '+FieldByName('InscricaoNumero').AsString+
                  ' e sua situação atual neste plano é '+FieldByName('Situacao').AsString+'. '+#13+
                  'Esta inscrição não pode ser feita novamente. ','Informação', mtInformation,[mbYes,mbNo],0);
        dblkpcmbPlano.Text := '';
        dblkpcmbPlano.SetFocus;
        Abort;
     end;
  end;

  inherited;

  qryPlanosPrev.FieldbyName('Plano').AsString := qryPlanPrev.FieldByName('Nome').AsString;

  // -----------------------------------------------------------------------------------------------
  // André Pontes - pendência 26878 - 12/12/2007
  // A partir de agora, o nº de inscrição será um sequence por plano, para evitar que haja
  // duplicidade de números de inscrição devido a concorrência no banco
  // -----------------------------------------------------------------------------------------------

  if (qryPlanPrev.FieldByName('FLGAUTONUMINSC').AsInteger = 1) then
  begin
    dbedInscNumero.Enabled   := False;

    if (qryPlanosPrev.State = dsInsert) then
    begin
      dbedInscNumero.Enabled  := False;

      sNomeSequence           := 'PLANOPREV' + qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
      iProxIncricaoNumero     := LeUltRegistro(qryAux, sNomeSequence);

      qryPlanosPrev.FieldbyName('INSCRICAONUMERO').AsInteger  := iProxIncricaoNumero;

      sUltimoNumeroPlano      := qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsString;
      dbedInscNumero.Text     := sUltimoNumeroPlano;

      dsPlanosPrev.DataSet.FieldByName('INSCRICAONUMERO').AsString := dbedInscNumero.Text;
    end;
  end
  else
  begin
    dbedInscNumero.Enabled    := False;
    //dbedInscNumero.Color      := clWindow;

    dbedInscNumero.Text       := qryElegPatro.FieldByName('MATRICULA').AsString; //TAES - SIG87355
    dsPlanosPrev.DataSet.FieldByName('INSCRICAONUMERO').AsString := dbedInscNumero.Text; //TAES - SIG87355
  end;

  // Retirado o trecho abaixo para evitar duplicidade de nº de inscrição em caso de concorrência
  {
  // Gerar Numero de Inscricao Automaticamente, caso o parametro diga que é automatico
  if (qryPlanPrev.FieldByName('flgAutoNumInsc').AsInteger = 1)
  then begin
     dbedInscNumero.Enabled   := False;
     if (qryPlanosPrev.State   = dsInsert)
     then begin
        dbedInscNumero.Enabled  := False;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MAX(INSCRICAONUMERO) AS PROXINSC FROM PARTPREVPLAN '+
                       ' WHERE IDPLANOPREV = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString);
        qryAux.Open;
        if Trim(qryAux.FieldByName('proxInsc').AsString) = ''
        then qryPlanosPrev.FieldbyName('InscricaoNumero').AsFloat := qryPlanPrev.FieldByName('NumInscInicial').AsFloat
        else qryPlanosPrev.FieldbyName('InscricaoNumero').AsFloat := qryAux.FieldByName('proxInsc').AsFloat+1;
        qryAux.Close;

        sUltimoNumeroPlano := qryPlanosPrev.FieldByName('InscricaoNumero').AsString;
        dbedInscNumero.Text := sUltimoNumeroPlano;
        dsPlanosPrev.DataSet.FieldByName('INSCRICAONUMERO').AsString := dbedInscNumero.Text;
     end;
  end
  else begin
     dbedInscNumero.Enabled := True;
     dbedInscNumero.Color   := clWindow;
  end;
  }

  // -----------------------------------------------------------------------------------------------
  // FIM André Pontes - pendência 26878 - 12/12/2007
  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmCadElegivel.dblkpcmbSitPartCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanosPrev.FieldbyName('SITPART').AsString := qrySitPart.FieldByName('Descricao').AsString;
end;



procedure TfrmCadElegivel.dblkpcmbSitPlanoPrevCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanosPrev.FieldbyName('SITPLANO').AsString := qrySitPlanoPrev.FieldByName('Descricao').AsString;
end;



procedure TfrmCadElegivel.dblkpcmbSitPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryElegPatro.FieldbyName('SITFUNC').AsString := qrySitFunc.FieldByName('Descricao').AsString;
end;



procedure TfrmCadElegivel.qryPlanosPrevBeforePost(DataSet: TDataSet);
Var
  sDataInicioInsc : String;
begin
  inherited;
  if qryPlanosPrev.State = dsInsert
  then begin
     bInsereParticipante := True;
     qryPlanosPrev.FieldByName('SeqProposta').AsInteger := 1;

     { Buscar sempre a menor DATAINICIOINSC }
     sDataInicioInsc := BuscaDataInicioInsc(Qry.FieldByName('IDPESSOA').AsString);
     If Trim(sDataInicioInsc) <> '' Then
       qryPlanosPrev.FieldByName('DtInicioInsc').AsString := sDataInicioInsc
     Else
     qryPlanosPrev.FieldByName('DtInicioInsc').AsString := qryPlanosPrev.FieldByName('InscricaoData').AsString;
     qryPlanosPrev.FieldByName('SalInscricao').AsFloat  := qryPlanosPrev.FieldByName('SalParticipacao').AsFloat;
     qryPlanosPrev.FieldByName('TIPOOPCAOIR').AsInteger := iTipoOpcaoIR;
     qryPlanosPrev.FieldByName('TIPO').AsString         := cmbTipoOpIR.Text; 
  end;
end;

procedure TfrmCadElegivel.qryPlanosPrevAfterPost(DataSet: TDataSet);
begin
  inherited;
  if not (qryElegPatro.State in [dsEdit,dsInsert])
  then begin
     qryElegPatro.Edit;
     qryElegPatro.FieldByName('ParticipPrevid').AsInteger := 1;
     qryElegPatro.Post;
  end
  else qryElegPatro.FieldByName('ParticipPrevid').AsInteger := 1
end;

procedure TfrmCadElegivel.qryPessoaFisicaAfterInsert(DataSet: TDataSet);
begin
  inherited;

  //CPrev - 27955 - Inicio
  edtEstado.text        := '';
  edtNaturalidade.text  := '';
  edtNacionalidade.text := '';
  //dblkpcmbNaturalidade.Text := '';
  //dbedNacionalidade.Text    := '';
  qryPessoaFisica.FieldByName('flgIsentoIRRF').AsInteger := 0;
  //CPrev - 27955 - Fim
end;

//procedure TfrmCadElegivel.dblkpcmbNaturalidadeCloseUp(Sender: TObject;
//  LookupTable, FillTable: TDataSet; modified: Boolean);
//begin
//  inherited;
//
//  qryPessoaFisica.FieldbyName('IdPais').AsInteger := qryNaturalidade.FieldByName('IdPais').AsInteger;
//
//  AtualizaConsultaCidade( qryNaturalidade.FieldByName('IDESTADO').AsInteger );
//
//end;

procedure TfrmCadElegivel.bbtnContribuicoesClick(Sender: TObject);
begin
  inherited;
   {Mostrar tela de contribuicoes do participante}
  frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
  frmCadContribParticipante.AssociaContrib(dbedNomeFantasia.Text,qryElegPatro.FieldByName('Patrocinadora').AsString,
                                           qryPlanosPrev.FieldByName('Plano').AsString,
                                           dbdtInscricao.Text,
                                           qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
                                           qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                                           qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,1,False);
  frmCadContribParticipante.Free;
end;



procedure TfrmCadElegivel.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State = dsInsert
  then
    bbtnContribuicoes.Visible := False  // André Pontes - pendência 26673 - 26/10/2007
  else
    bbtnContribuicoes.Visible := True;  // André Pontes - pendência 26673 - 26/10/2007
end;



procedure TfrmCadElegivel.bbtnConfirmarClick(Sender: TObject);
var
  sMsg, sDatainicioMolestia, sDataFimMolestia : string;
begin
  if (qryOcupacao.state in[dsInsert]) then bbtnVoltarDet.click;//Darivaldo Alencar SIG 27871

  //edilaine - SIG33979 - inicio
  {// Início - Michelle Mota - SOL: 264969 - PPM: 1166927
  if (dbrgrpMolestiaGrave.visible) then //Marcio Sanches Spinosa SOL 238755 PPM 507686
   begin
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if not(InsereHstMolestia(sDatainicioMolestia, sDataFimMolestia, qryPlanosPrev.FieldByName('IdPessoa').AsInteger)) then
      begin
         qryPessoaFisica.Cancel;
         abort;
      end;
   end;
  // Término - Michelle Mota - SOL: 264969 - PPM: 1166927
  }//edilaine - SIG33979 - fim

  bControleTransacao := false;
  if (qryContato.State = dsInsert) then
    qryContato.Cancel;

  //Jonas - SOL 178016 KINTANA 1698357 - FIM
  //Renato Visoni SOL 125579 Kintana 649413
  {if dtmBaseDados.dbBaseDados.InTransaction then       //edilaine - SIG33979 - comentado
    dtmBasedados.dbBaseDados.Commit; }                  //edilaine - SIG33979 - comentado
  //Renato Visoni SOL 125579 Kintana 649413

  //Início - William Santana - 209384/15928 KIN 2062832
  if (cmbEstCiv.text = EmptyStr) then
  begin
    MsgDlg('O estado civil deve ser selecionado.', 'Erro', mtError, [mbOk,mbHelp], 0);
    Exit;
  end;
  //Término - William Santana - 209384/15928 KIN 2062832

  if (dbrgrpIsentoIR.ItemIndex = 0) and (wwDBCBIsentoIrrf.ItemIndex = -1 )then
   begin
        MsgDlg('Campo de Isento de IR deve ser preechido','Informação',mtInformation,[mbOk],0);
        Exit
   end;

  if wwDBCBIsentoIrrf.ItemIndex = 2 then
    begin
      if dbdtMolestiaGrave.Text = '' then
      begin
	  MsgDlg('Data Início de Moléstia Grave deve ser preenchida','Informação',mtInformation,[mbOk],0);
          Exit
      end;


      //Marcio Sanches Spinosa SOL 238755 PPM 507686 - Inicio
//      if CMDateTimePicker6.Text = '' then
//      begin
//	  MsgDlg('Data Término de Moléstia Grave deve ser preenchida','Informação',mtInformation,[mbOk],0);
//          Exit;
//      end;

//      if (dbdtMolestiaGrave.Date > CMDateTimePicker6.Date) then
//      begin
//	  MsgDlg('A data de início não pode ser superior que a data de término!','Informação',mtInformation,[mbOk],0);
//          Exit;
//      end;
        //Marcio Sanches Spinosa SOL 238755 PPM 507686 - Fim
    end;


  //edilaine - SIG33979 - inicio
  if not(ValidaEMail(dbedemail.Text))then
  begin
    MsgDlg(MSG028,'Atenção',mtInformation,[mbOK],0);
    dbedemail.setfocus;
    exit;
  end;

  if not(ValidaEMail(EdtEmailParticular.Text))then
  begin
    MsgDlg(MSG028,'Atenção',mtInformation,[mbOK],0);
    EdtEmailParticular.setfocus;
    exit;
  end;

  //edilaine - SIG33979 - comentado inicio
  {AplicaAlteracoes([qryPessoaFisica]); // SOL 193044 KINTANA 1836694
  dtmBaseDados.dbBaseDados.ApplyUpdates([qryReprLegal]); //William Santana - SOL 161550 KIN 1717512

  // SOL 193932 KTN 1848761 Otacilio
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBasedados.dbBaseDados.StartTransaction;  }
  //edilaine - SIG33979 - comentado fim


  // SOL 193932 KTN 1848761 Otacilio ** Inicio **
  //Jonas - SOL 178016 KINTANA 1698357 - INICIO
//  if CmeCadastro.Operacao = opAlterar then            // SIG 127110 Ferrari
  if (CmeCadastro.Operacao in [opInserir,opAlterar]) then // SIG 127110 Ferrari
  begin
    //edilaine - SIG33979 - comentado inicio
    qryPessoaFisica.FieldByName('EMAILFUNCEF').AsString := EdtEmailParticular.TEXT;
    {qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE CM.PESSOAFISICA SET EMAILFUNCEF = '+ QuotedStr(EdtEmailParticular.TEXT) );
    qryAux.Sql.Add(' WHERE IDPESSOA = '+OraNumero(MontaSelect.ValoresChave[0]));
    qryAux.EXECSQL;}
    //edilaine - SIG33979 - comentado fim
  end;
  //edilaine - SIG33979 - fim

  {if dtmBaseDados.dbBaseDados.InTransaction then       //edilaine - SIG33979 - comentado
    dtmBasedados.dbBaseDados.Commit;  }                 //edilaine - SIG33979 - comentado
  // SOL 193932 KTN 1848761 Otacilio ** Fim **


  { Thiago Melo SOL 223594 Kintana 2057258
  if (dtsolicitacontasalario.text = '') and (dbchksolicitacontasalario.Checked) then
  begin
      ShowMessage('É necessário informar a data de solicitação de conta salário.');
      DTSOLICITACONTASALARIO.SetFocus;
      Abort;
  end ;
  Thiago Melo SOL 223594 Kintana 2057258}

    if (dtcontasalarioprocessada.text = '') and (dbchkSalarioProcessado.Checked) then
  begin
      ShowMessage('É necessário informar a data de processamento da conta salário.');
      DTCONTASALARIOPROCESSADA.SetFocus;
      Abort;
  end    ;
    //monica gonzaga


   //Sol 122621 / Kintana 604231 - Ádler Souza
   try
     if (dbedDocumento.Text <> '') then begin

       if VerificaDocExcecao(dbedDocumento.Text) then
       begin
         //edilaine - SIG33979 - inicio
         //MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
         MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
         //edilaine - SIG33979 - fim
         dbedDocumento.SetFocus;
         exit;
       end;

       //if not VerificaCPF(dbedDocumento.Text) then Exit;   //edilaine - SIG33979
       if not VerificaCPF() then Exit;                       //edilaine - SIG33979

       if bCPF1 then begin
         if (QryDocumento.State in [dsInsert, dsEdit]) then begin
           QryDocumento.FieldByname('NUMDOCUMENTO').asstring:= dbedDocumento.Text;
         end;
       end;
     end;

     if edDocNumDocumento.Text <> '' then begin
       If (DBText1.Field.AsString = 'CPF') And (qry.State in [dsInsert, dsEdit]) then begin

         if VerificaDocExcecao(edDocNumDocumento.Text) then
         begin
           //edilaine - SIG33979 - inicio
           //MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
           MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
           //edilaine - SIG33979 - fim
           edDocNumDocumento.SetFocus;
           exit;
         end;

         if not Pessoa.DocumValido(edDocNumDocumento.text) then exit;
         if Not(VerificaExistencia) then exit;

         if bCPF2 then begin
           qry.FieldByname('NUMDOCUMENTO').asstring:= edDocNumDocumento.Text;
         end;
       end;
     end;
   except
   end;
   //Fim - Sol 122621 / Kintana 604231 - Ádler Souza

   if dbrgrpSexo.ItemIndex < 0
   then begin
      MsgDlg('Sexo do elegível/participante deve ser informado antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;
   if Trim(dbdtNasc.Text) = ''
   then begin
      MsgDlg('Data de Nascimento do elegível/participante deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if qryElegPatro.IsEmpty
   then begin
      MsgDlg('É Necessário preencher a Tela de Dados Funcionais !','Atenção',mtWarning,[mbOk,mbHelp],0);
      Exit;
   end;

   if qryElegPatro.State <> dsBrowse
   then begin
      MsgDlg('É Necessário Encerrar a Tela Dados Funcionais !','Atenção',mtWarning,[mbOk,mbHelp],0);
      TiraSQL(qryAux);
      Exit;
   end;

   if qryPlanosPrev.State <> dsBrowse
   then begin
      MsgDlg('É Necessário Encerrar a Tela Planos Previdenciários !','Atenção',mtWarning,[mbOk,mbHelp],0);
      TiraSQL(qryAux);
      Exit;
   end;

  // -----------------------------------------------------------------------------------------------
  // André Pontes - pendência 26946 - 10/12/2007

  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) and (qryContaBancaria.State in [dsInsert, dsEdit]) then
  begin
    if not(VerificaContaBancaria) then
    begin
      pgctrlDetalhe.ActivePage  := tbsContaBancaria;
      tbcDetalhe.TabIndex       := 7;
      Exit;
    end;
  end;


  if qryContaBancaria.State in [dsInsert, dsEdit] then
  begin
    sMsg := 'O cadastro da conta bancária corrente ainda não foi confirmado!' + #13 + #13 +
            'É necesário gravar/cancelar a conta antes de prosseguir.';

    MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
    Repaint;
    Exit;
  end;

  if not(VerificaPreferencial) then
  begin
    sMsg := 'Há mais de uma conta preferencial indicada!' + #13 + #13 +
            'Favor verificar o cadastro antes de prosseguir.';

    MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
    Repaint;

    pgctrlDetalhe.ActivePage  := tbsContaBancaria;
    tbcDetalhe.TabIndex       := 7;

    Exit;
  end;


  // FIM André Pontes - pendência 26496 - 10/12/2007
  // -----------------------------------------------------------------------------------------------

   If Not bVeioDoMenu
    Then
      If qryEndereco.IsEmpty
       Then Begin
          MsgDlg('Não é possível inscrever o participante sem endereço. ','Atenção',mtWarning ,[mbOK],0);
          pgctrlDetalhe.ActivePage := tbsDet;
          Exit;
       End;

   // Deixar o flag para recalcular opcoes com true apenas se nao for insercao
   if bRecalculaOpcoes and (qry.State = dsInsert)
   then bRecalculaOpcoes := False;

   // Verificar se alguma informacao foi alterada e as opcoes nao foram recalculadas
   if bRecalculaOpcoes
   then begin
      if MsgDlg('Algumas informações importantes foram alteradas. Caso os  '+
                'parâmetros(opções) do participante seja calculados pelo sistema '+
                'através de regras, este recálculo deverá ser feito agora. '+
                'Confirma o recálculo dos parâmetros(opções) do participante ? ',
                'Erro',mtConfirmation,[mbYes,mbNo],0) = mrYes
      then begin
         // Recalcular opcoes
         if not RecalculaOpcoes
         then begin
            if MsgDlg('Ocorreram erros no recálculo dos parâmetros(opções) do participante. '+
                   'Deseja confirmar operação ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
            then Abort;
         end;
      end;
   end;

   If Not bVeioDoMenu Then
   Begin
     //CPrev - 27283 - Inicio
     If Trim(qryPlanosPrev.FieldByName('IDPLANOPREV').AsString) = '' Then
     Begin
       MsgDlg('Não é possível inscrever o participante sem um planos previdenciários cadastrato. ','Atenção',mtWarning ,[mbOK],0);
       pgctrlDetalhe.ActivePage := tbsPlanosPrev;
       Exit;
     End;
     //CPrev - 27283 - Fim

     While (not VerificaOpcaodeContrib(qryElegPatro.FieldByName('IDPESSJUR').AsString,
                                     qryPlanosPrev.FieldByName('IDPLANOPREV').AsString,
                                       qry.FieldByName('IDPESSOA').AsString)) Do
     Begin
      bbtnContribuicoesClick(Self);
     End;
   End;


   //edilaine - SIG33979 - inicio
   AplicaUpdatesInTrans([qryPessoaFisica]);
   AplicaUpdatesInTrans([qryReprLegal]);
   AplicaUpdatesInTrans([qryPerfilInvest]); //William Santana - SIG 55755
   //edilaine - SIG33979 - fim


   inherited; // CHAMARA A ROTINA PessoaSave.Subtipo(Self)

   //SOL 122621 - Ádler Souza
   try
   if qry.Active then begin
     PessoaChangePessoa(qry.fieldByName('IDPESSOA').asInteger);
   end;
   except
   end;
   //Fim - SOL 122621 - Ádler Souza

  // SOL:121637 - Daniel Begnami
  dblkGrauInstrucao.enabled  := False;
  cmbEstCiv.enabled   := False;
  // FIM
  bControleTransacao := true;
  
  // Renato Visoni SOL 130508 Kintana 733058
  if not ProcAtualizaNumeroDependentes(qry.fieldByName('IDPESSOA').asInteger, 1) then begin
     MsgDlg('Erro na atualização de número de dependentes. ','Atenção',mtWarning ,[mbOK],0);
  end;
  // Renato Visoni SOL 130508 Kintana 733058

  //Início - William Santana Sol 161550 Kin 1717512
  SelReprLegal;

  pnlGrdReprLegal.visible := true ;
  pnlReprLegal.visible := false ;
  pnlReprLegal.Repaint;
  pnlGrdReprLegal.Repaint;

  if (bVeiodoIndicaRec) then
  begin
   frmIndicadorRecebedor.IntegraBenef_ReprLegal(2);
  end;
  //Término - William Santana Sol 161550 Kin 1717512

  bGridPadrao:= true; dbMemInfoAdicionais.readOnly:= not(sbtnAlterar.down) ;//Darivaldo Alencar SIG 27871

end;

//SOL N°86810 - Ádler Souza
function TfrmCadElegivel.VerificaDocExcecao(sDocumento : string) : boolean;
begin
  Result := False;

  if ((sDocumento = '11111111111') or (sDocumento = '22222222222') or (sDocumento = '33333333333') or
      (sDocumento = '44444444444') or (sDocumento = '55555555555') or (sDocumento = '66666666666') or
      (sDocumento = '77777777777') or (sDocumento = '88888888888') or (sDocumento = '99999999999') or
      (sDocumento = '00000000000'))
  then
    Result := True;
end;
//Fim - SOL N°86810 - Ádler Souza

function TfrmCadElegivel.VerificaOpcaodeContrib(sIdPessJur, sIdPlanoPrev, sIdPessoa : string) : boolean;
var sNomesContrib  : string;
    bAlgumaContrib : boolean;

begin
   Result := False;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT CP.VALORBASE1, CP.VALORBASE2, CP.VALORBASE3,  '+
                  '        C.NOME, CT.NUMOPCOES, CT.NOMEVALORBASE1, CT.NOMEVALORBASE2,  '+
                  '        CT.NOMEVALORBASE3 '+
                  ' FROM CONTRIBPREVPARTP CP , CONTPREV CT, CONTRIBUICAO C '+
                  ' WHERE  CP.IDPESSOA       = '+sIdPessoa   +' '+
                  ' AND    CP.IDPLANOPREV    = '+sIdPlanoprev+' '+
                  ' AND    CP.IDPESSJUR      = '+sIdPessJur  +' '+
                  ' AND    CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO  '+
                  ' AND    CP.IDPLANOPREV    = CT.IDPLANOPREV    ' +
                  ' AND    CP.IDCONTRIBUICAO = CT.IDCONTRIBUICAO '+
                  ' AND    CT.FLGACEITAOPCAO = 1 ');
   qryAux.Open;
   sNomesContrib := ' As opções a seguir não foram informadas :';
   bAlgumaContrib := False;
   sNomeContribuicao := qryAux.FieldByName('Nome').AsString;  
   while not qryAux.Eof do
   begin
       if (qryAux.FieldByName('NumOpcoes').AsInteger >= 1) and
          (qryAux.FieldByName('ValorBase1').AsString = '')
       then begin
          if qryAux.FieldByName('NomeValorBase1').AsString = ''
          then sNomesContrib := sNomesContrib + 'Opção 1 da '+qryAux.FieldByName('Nome').AsString+#13
          else sNomesContrib := sNomesContrib + qryAux.FieldbyName('NomeValorBase1').AsString+
                                                ' da '+qryAux.FieldByName('Nome').AsString+#13;
          bAlgumaContrib := True;
       end;

       if (qryAux.FieldByName('NumOpcoes').AsInteger >= 2) and
          (qryAux.FieldByName('ValorBase2').AsString = '')
       then begin
          if qryAux.FieldByName('NomeValorBase2').AsString = ''
          then sNomesContrib := sNomesContrib + 'Opção 2 da '+qryAux.FieldByName('Nome').AsString+#13
          else sNomesContrib := sNomesContrib + qryAux.FieldbyName('NomeValorBase2').AsString+
                                                ' da '+qryAux.FieldByName('Nome').AsString+#13;
          bAlgumaContrib := True;
       end;

       if (qryAux.FieldByName('NumOpcoes').AsInteger >= 3) and
          (qryAux.FieldByName('ValorBase3').AsString = '')
       then begin
          if qryAux.FieldByName('NomeValorBase3').AsString = ''
          then sNomesContrib := sNomesContrib + 'Opção 3 da '+qryAux.FieldByName('Nome').AsString+#13
          else sNomesContrib := sNomesContrib + qryAux.FieldbyName('NomeValorBase3').AsString+
                                                ' da '+qryAux.FieldByName('Nome').AsString+#13;
          bAlgumaContrib := True;
       end;
      qryAux.Next;
   end;

   if bAlgumaContrib
   then begin
      if MsgDlg(sNomesContrib+ ' Deseja confirmar a operação ? ','Atenção',mtWarning,[mbYes,mbNo],0) = mrYes
      then Result := True
      else Result := False;
      TiraSQL(qryAux);
      Exit;
   end
   else begin
      Result := True;
      qryAux.Close;
      Exit;
   end;
end;

//procedure que insere endereços comerciais dos elegíveis
Procedure TfrmCadElegivel.InsereEndereco(Idpessoa : string);
begin
   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' SELECT EL.IDPESSOA, EP.IDENDERECO, E.IDPAIS, E.CODESTADO, '+
                  ' EP.NUMERO, EP.COMPLEMENTO, '+
                  ' EP.BAIRRO, EP.CIDADE, EP.CEP, EP.TIPOENDERECO, EP.NOME '+
                  ' FROM ELEGPATRO EL, ENDPESS EP, ESTADO E, CIDADES C '+
                  ' WHERE EL.IDPESSOA  = '+IdPessoa+''+
                  ' AND EP.IDPESSOA    = EL.IDESTAB  '+
                  ' AND C.IDCIDADES(+) = EP.IDCIDADES '+
                  ' AND E.IDESTADO(+)  = C.IDESTADO ');
   qryaux.open;
   while not qryaux.eof do
   begin
      qryaux2.close;
      qryaux2.sql.clear;
      idEnd := LeUltRegistro(qryAux2,'ENDPESS');
      //
      qryaux2.close;
      qryaux2.sql.clear;
      qryaux2.SQL.add(' INSERT INTO ENDPESS(IDPESSOA,IDENDERECO,'+
                            ' IDPAIS,CODESTADO,NUMERO,COMPLEMENTO,BAIRRO,CIDADE,CEP,'+
                            ' TIPOENDERECO,NOME)'+
                            ' VALUES ('+idpessoa+','+inttostr(idend)+','+
                            ' '+qryaux.fieldbyname('IDPAIS').AsString+','+
                            ' '''+qryaux.fieldbyname('CODESTADO').AsString+''','+
                            ' '''+qryaux.fieldbyname('NUMERO').AsString+''','+
                            ' '''+qryaux.fieldbyname('COMPLEMENTO').AsString+''','+
                            ' '''+qryaux.fieldbyname('BAIRRO').AsString+''','+
                            ' '''+qryaux.fieldbyname('CIDADE').AsString+''','+
                            ' '''+qryaux.fieldbyname('CEP').AsString+''','+
                            ' ''C'','+
                            ' '''+qryaux.fieldbyname('NOME').AsString+''') ');
      try
         qryaux2.ExecSql;
      except end;                                                                                 
      //
      qryaux.next;
   end; //while
end;



procedure TfrmCadElegivel.dsPlanosPrevStateChange(Sender: TObject);
begin
  inherited;
 //dbedSalPartInsc.Enabled := (qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString = '');
  bbtnContribuicoes.Visible := (qryPlanosPrev.State <> dsInsert);
  memAvisoContrib.Visible   := (qryPlanosPrev.State = dsInsert);
  edSalarioPart.Enabled := False;
  dblkpcmbPlano.Enabled := (qryPlanosPrev.State = dsInsert);
end;



procedure TfrmCadElegivel.qryPlanosPrevAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Preencher valores default para datas e tipo de inscricao
  qryPlanosPrev.FieldByName('SeqProposta').AsInteger       := 1;
  qryPlanosPrev.FieldByName('RequerimentoData').AsDateTime := date;
  qryPlanosPrev.FieldByName('InscricaoData').AsDateTime    := qryElegPatro.FieldByName('DataAdmissao').AsDateTime;
  qryPlanosPrev.FieldbyName('InscricaoTipo').AsString      := 'O';
  qryPlanosPrev.FieldByName('FlgfitEspecial').AsInteger    := 0;

  dbedSalPartInsc.Enabled   := True;
end;



procedure TfrmCadElegivel.qryPlanosPrevAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryPlanosPrev.Active then Exit;

  cmbTipoOpIR.ItemIndex := qryPlanosPrev.FieldByName('TIPOOPCAOIR').AsInteger-1; //TAES - SIG91757
  iTipoOpcaoIRAnt       := cmbTipoOpIR.ItemIndex+1; //TAES - SIG91757

  //edilaine - SIG33979 - inicio
  {if qryPlanosPrev.FieldByName('DATACANCELAMENTO').AsString = '' then
  Begin
     gpDataCancelamento.Visible := False;
     grpTipoOpIR.Top            := 186;
  End
  else
     gpDataCancelamento.Visible := True;

  if qryPlanosPrev.FieldByName('DATAINICIOMANUT').AsString = '' then
     gpDataManutencao.Visible   := False
  else
     gpDataManutencao.Visible   := True;
  }//edilaine - SIG33979 - inicio


  //Renato Visoni SOL 125579
  QryHistoricoTipoIr.Close;
  QryHistoricoTipoIr.ParamByname('IDPESSOA').asString    := Qry.FieldByName('IDPESSOA').AsString;
  QryHistoricoTipoIr.ParamByname('IDPLANPREV').asString  := qryPlanosPrev.FieldByName('IDPLANOPREV').AsString;
  QryHistoricoTipoIr.Open;

  if sdataOpIr  = '' then
     sdataOpIr := QryHistoricoTipoIr.FieldByName('MenorData').AsString ;  //SOL 148691 KINTANA 1050517 
  
  
  grpHistIr.Visible := not(QryHistoricoTipoIr.isEmpty);
  //Renato Visoni SOL 125579

end;

procedure TfrmCadElegivel.qryContaBancariaBeforePost(DataSet: TDataSet);
var iIdContaBancaria : longint;
begin
  inherited;
  if qryContaBancaria.State in [dsinsert]
  then begin
     iIdContaBancaria := LeUltRegistro(qryAux,'CONTABANCARIA');
     qryContaBancaria.FieldByName('IDCBANCARIA').AsInteger := iIdContaBancaria;
     iIdContaBancariaGlobal := intTostr(iIdContaBancaria); //Renato Visoni Sol 112013 / Kintana 520381
  end;

  //Renato Visoni SOL 149421 Kintana 1079221
  if edDigAgencia.Text <> '' then begin
    if qryContaBancaria.State in [dsinsert,dsEdit] then begin
      qryContaBancaria.FieldByName('NUMAGENCIA').asString :=  edDigAgencia.Text;
    end;
  end;
  //Renato Visoni SOL 149421 Kintana 1079221
  
end;

procedure TfrmCadElegivel.dblkpcmbBancoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContaBancaria.FieldbyName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
  edDigAgencia.Text := '';
  dblkpcmbAgencia.Text := '';

  qryAgencia.Close;
  qryAgencia.ParamByName('pIdBanco').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
  qryAgencia.Open;

  edDigBanco.Text := IntToStr(qryBanco.FieldbyName('NUMBANCO').AsInteger);
end;

procedure TfrmCadElegivel.dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContaBancaria.FieldbyName('AGENCIA').AsString := qryAgencia.FieldByName('AGENCIA').AsString;
  edDigAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
end;

procedure TfrmCadElegivel.sbtnInsDetClick(Sender: TObject);
begin
  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
    if not(qryElegpatro.FieldByName('IDPESSOA').AsString = '') then
    begin
     //qryAux.close;
     //qryAux.SQL.clear;
     //qryAux.SQL.Add('SELECT * FROM HSTREPRLEGAL WHERE SITATUAL = 1 AND IDPESSOA = '+quotedstr(qryElegpatro.FieldByName('IDPESSOA').AsString) );
     //qryAux.open;

     if {not(qryAux.IsEmpty)} (VerificaReprLegal) or (bINSERTVigente) then
     begin
       MsgDlg('Já existe um Representante Legal em vigência','Erro',mtError,[mbOk],0);
       sbtnInsDet.Down := false;
       Abort;
     end;
     pnlGrdReprLegal.visible := false ;
     pnlReprLegal.visible := true ;
     sAcao := 'Inserção';
    end
    else begin sbtnInsDet.Down := false; Abort; end;
  end;
  //Término - William Santana SOL 161550 KIN 1717512  

  if bGridPadrao then AtivaGrid(dbgrdOutrasInforms); //Darivaldo Alencar - SIG27871

  inherited;

  MostraEscondeGridOutrasInformacoes; //Darivaldo Alencar SIG 27871

  iTipo :=0;
  bAcao := 'I';

  if pgCtrlDetalhe.ActivePage = tbsContaBancaria
  then begin
    dblkpcmbBanco.Text       := '';
  end;

  if (qry.State <> dsInsert) and (qry.State <> dsEdit)
  then
     sbtnAlterarClick(Self);

  stateelegpatro := dsbrowse;
  sidpessjurant  := '';
  sidpessoaant   := '';
  bbtnOpcoes.Visible := (pgctrlDetalhe.ActivePage = tbsElegivel);

  If (pgCtrlDetalhe.ActivePage = tbsTelefone) then
  begin
     ToolbarButtonAlteraContato.Enabled := false;
     ToolbarButtonInsereContato.Enabled := false;
     ToolbarButtonExcluiContato.Enabled := false;
     dbgTelefoneRamal.Visible := true;
     GroupBox5.Height := 168;
     Panel8.Visible           := false;
     qryContatoTel.Close();

     //edilaine - SIG33979 - inicio
     chkAssociaEnd.checked := not qryEndereco.isEmpty;
     chkAssociaEnd.enabled := not qryEndereco.isEmpty;
     //edilaine - SIG33979 - inicio
  end;

  if bTtravarCadastro then
  begin
    GroupBoxBanco.Enabled:= True;
    rgrpTipoConta.Enabled:= True;
    dbedMatricula.Enabled:= True;
    dbdtAdesao.Enabled:= True;
    dblkpcmbSitPatro.Enabled:= True;
    dbedSalario.Enabled:= True;
    dblkpcmbCargo.Enabled:= True;
    PintarCampos([GroupBoxBanco, rgrpTipoConta, dbedMatricula,
                  dbdtAdesao, dblkpcmbSitPatro, dbedSalario, dblkpcmbCargo], clWindow);
  end;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    HabilitaCamposEndereco(False);
  end;

  if (pgctrlDetalhe.ActivePage = tbsElegivel) then  AtvDesDatasContribuicao;// Darivaldo Alencar SIG37689

  bbtnConfirmar.Enabled := False; // Felipe A. Santos SOL 208311 KTN 2020366 
end;

procedure TfrmCadElegivel.sbtnAltDetClick(Sender: TObject);
begin
  spbtHistipoIrAlterar.Enabled := True;
  spbtHistipoIrExcluir.Enabled := True;
  bAcao := 'A';
  iTipo :=0;
  //Renato Visoni Sol 112013 / Kintana 520381
  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) then begin
    if qryContaBancaria.Active then iTipo := qryContaBancaria.FieldByname('TIPOCONTA').asInteger;
  end;

  If (pgctrlDetalhe.ActivePage = tbsPlanosPrev) And (Not bVeioDoMenu)
   Then Begin
     MsgDlg('Em evento de inscricao, o plano só pode ser inserido, nunca alterado.','Informação',mtInformation,[mbOk],0);
     sbtnAltDet.Down := False;
     Exit;
   End;
   
  //Início - William Santana - SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
   sAcao := 'Alteração';

   pnlGrdReprLegal.visible := false ;
   pnlReprLegal.visible := true ;

   if ((Length(tmpckrDATAtermino.Text) = 10 ) and (Length(tmpckrDATAinicio.Text) = 10)) then
   begin
    rgSituacaoAtual.OnClick := Nil;
    if ((StrToDate(tmpckrDATATERMINO.text) < StrToDate(tmpckrDATAINICIO.text)) or (StrToDate(tmpckrDATATERMINO.text) < Date())) and
       (rgSituacaoAtual.itemindex = 0) then
    begin
      rgSituacaoAtual.itemindex := 1;
      MsgDlg('A data limite da Tutela/Curatela está vencida e a situação atual será alterada para Vencida.','Alerta',mtWarning ,[mbOk],0);
    end;
    rgSituacaoAtual.OnClick := rgSituacaoAtualClick;
   end;
  end;
 //Término - William Santana - SOL 161550 KIN 1717512

  if bGridPadrao then  AtivaGrid(dbgrdOutrasInforms); //Darivaldo Alencar - SIG27871

  inherited;

  MostraEscondeGridOutrasInformacoes; //Darivaldo Alencar SIG 27871
  
  if pgCtrlDetalhe.ActivePage = tbsContaBancaria then
  Begin
     dblkpcmbBanco.Text := qryContaBancaria.FieldByName('BANCO').AsString;
     flgCBancariaPref   := (qryContaBancaria.FieldByName('FLGCONTAPREF').AsString = '1'); 
  End;

    If (pgctrlDetalhe.ActivePage = tbsPlanosPrev) Then Begin
       sdataIR  := qryPlanosPrev.FieldByName('DATAOPCAOIR').AsString;
       sOpcaoIR := qryPlanosPrev.FieldByName('TIPOOPCAOIR').AsString;
   End;



  if (pgctrlDetalhe.ActivePage = tbsTelefone) then
  begin
    qryContatoTel.Close;
    qryContatoTel.Prepare;
    qryContatoTel.ParamByName('IdTelefone').AsFloat  := qryTelefone.FieldByName('IdTelefone').AsFloat;
    qryContatoTel.ParamByName('IdPessoa').AsInteger  := qryElegPatro.FieldByName('IdPessoa').asInteger;
    qryContatoTel.Open;
    qryContatoTel.Last;
    qryContatoTel.First;

    if (qryContatoTel.recordcount > 0 ) then begin
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
    end;

    dbgTelefoneRamal.Visible := true;
    Panel8.Visible           := false;
    GroupBox5.Height := 168;

    //edilaine - SIG33979 - inicio
    chkAssociaEnd.checked := not qryEndereco.isEmpty;
    chkAssociaEnd.enabled := not qryEndereco.isEmpty;
    //edilaine - SIG33979 - inicio
  end;


  if (pgctrlDetalhe.ActivePage = tbsContato) then
    begin
       qryRamal.Close;
       qryRamal.ParamByName('IdPessoa').AsInteger  :=  qryElegPatro.FieldByName('IdPessoa').asInteger;
       qryRamal.ParamByName('IdContato').AsInteger := qryContato.FieldByName('IdContato').AsInteger;
       qryRamal.Open;
    end;

  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
      ExibeSalarioParticipacao;
  bbtnOpcoes.Visible := (pgctrlDetalhe.ActivePage = tbsElegivel); 

  if bTtravarCadastro then
  begin
    if pos(qryBanco.FieldByName('BANCO').Asstring, lbanco) > 0 then
    begin
      GroupBoxBanco.Enabled:= False;
      rgrpTipoConta.Enabled:= False;
      PintarCampos([GroupBoxBanco, rgrpTipoConta], clGray);
    end
    else
    begin
      GroupBoxBanco.Enabled:= True;
      rgrpTipoConta.Enabled:= True;
      PintarCampos([GroupBoxBanco, rgrpTipoConta], clWindow);
    end;

    if pos(qryElegPatro.FieldByName('MATRICULA').Asstring, lDadosFunc) > 0 then
    begin
      dbedMatricula.Enabled:= False;
      dbdtAdesao.Enabled:= False;
      dblkpcmbSitPatro.Enabled:= False;
      dbedSalario.Enabled:= False;
      dblkpcmbCargo.Enabled:= False;
      PintarCampos([dbedMatricula, dbdtAdesao, dblkpcmbSitPatro,
                    dbedSalario, dblkpcmbCargo], clGray);
    end
    else
    begin
      dbedMatricula.Enabled:= True;
      dbdtAdesao.Enabled:= True;
      dblkpcmbSitPatro.Enabled:= True;
      dbedSalario.Enabled:= True;
      dblkpcmbCargo.Enabled:= True;
      PintarCampos([dbedMatricula, dbdtAdesao, dblkpcmbSitPatro,
                    dbedSalario, dblkpcmbCargo], clWindow);
    end;
  end;
  //SOL 148691 KINTANA 1050517
  if (QryHistoricoTipoIr.Active) AND (CDShistIrLocal.ISEMPTY) then begin
     CDShistIrLocal.EmptyDataSet;
     QryHistoricoTipoIr.First;
     while not QryHistoricoTipoIr.eof do
     begin
        CDShistIrLocal.Append;
        IF QryHistoricoTipoIrNOME.Value = 'Sem Opção' THEN
           CDShistIrLocalTIPOOPCAOIR.Value   := 0
        ELSE IF QryHistoricoTipoIrNOME.Value  = 'Tabela Progressiva'  THEN
           CDShistIrLocalTIPOOPCAOIR.Value   := 1
        ELSE CDShistIrLocalTIPOOPCAOIR.Value := 2;

        CDShistIrLocalDTINICIO.Value    := QryHistoricoTipoIrDTINICIO.Value;

        IF QryHistoricoTipoIrDTFIM.Value > 0 THEN
           CDShistIrLocalDTFIM.Value       := QryHistoricoTipoIrDTFIM.Value;
        CDShistIrLocalIDHISTOPIR.Value  := QryHistoricoTipoIrIDHISTOPIR.Value;
        CDShistIrLocal.post;
        QryHistoricoTipoIr.next;
     end;
  end;
  //SOL 148691 KINTANA 1050517
  //OpcaoIR;//Higor Nayde 201318 //TAES - SIG98903
  // TADEU PASSOS SOL 164168/11242 KINTANA 1793508
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    begin
      HabilitaCamposEndereco(False);
    end;
  // TADEU PASSOS SOL 164168/11242 KINTANA 1793508


  if (pgctrlDetalhe.ActivePage = tbsElegivel) then  AtvDesDatasContribuicao;// Darivaldo Alencar SIG37689

  bbtnConfirmar.Enabled := False; // Felipe A. Santos SOL208311 KTN 2020366
end;

procedure TfrmCadElegivel.cmbfilialCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if qryelegpatro.State in [dsedit,dsinsert] then
  qryElegPatro.FieldbyName('Filial').AsString := qryFilial.FieldByName('Nome').AsString;
end;

procedure TfrmCadElegivel.dblkpcmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryElegPatro.FieldbyName('Patrocinadora').AsString :=  qryPatro.FieldByName('Nome').AsString;

  qryFilial.Close;
  qryFilial.ParamByName('idpessoa').AsInteger := qryPatro.FieldByName('idpessoa').AsInteger;
  qryFilial.Open;

  qryOrgaoPrev.close;
  qryOrgaoPrev.ParamByName('ELG_IDPESSJUR').Value := qryPatro.FieldByname('IDPESSOA').asinteger;
  qryOrgaoPrev.open;

  qryCargo.Close;
  qryCargo.ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
  qryCargo.Open;
end;

procedure TfrmCadElegivel.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryFilial.Close;
  qryFilial.ParamByName('idpessoa').AsInteger := qryPatro.FieldByName('idpessoa').AsInteger;
  qryFilial.Open;

  qryOrgaoPrev.close;
  qryOrgaoPrev.ParamByName('ELG_IDPESSJUR').Value := qryPatro.FieldByname('IDPESSOA').asinteger;
  qryOrgaoPrev.open;

  qryCargo.Close;
  qryCargo.ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
  qryCargo.Open;
   
end;

procedure TfrmCadElegivel.dblkpcmbFundacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   qryfundacoes.fieldbyname('NOME').AsString := qryfundacao.fieldbyname('NOME').AsString;
end;

procedure TfrmCadElegivel.qryfundacoesAfterInsert(DataSet: TDataSet);
begin
  inherited;
   qryfundacao.close;
   qryfundacao.open;
end;

procedure TfrmCadElegivel.qryfundacaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
   qryfundacao.parambyname('idpessoa').AsInteger := qry.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmCadElegivel.dsfundacoesStateChange(Sender: TObject);
begin
   inherited;
   if qryfundacoes.state = dsinsert then
   begin
      dblkpcmbFundacao.enabled := true;
      dbedinsc.enabled := true;
   end
   else
   begin
      dblkpcmbFundacao.enabled := False;
      dbedinsc.enabled := False;
   end;
end;

procedure TfrmCadElegivel.qryfundacoesBeforePost(DataSet: TDataSet);
var bEncontrou : boolean;
begin
  inherited;
  if Trim(dbedInsc.Text) = '' then Exit;

  bEncontrou := False;
  qryPlanosPrev.First;
  while not qryPlanosPrev.Eof do
  begin
     if qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsString = Trim(dbedInsc.Text)
     then bEncontrou := True;
     qryPlanosPrev.Next;
  end;

  if not bEncontrou
  then begin
     MsgDlg('O participante não tem este número de inscrição em nenhum dos planos que pertenceu. Verifique.','Erro',mtError, [ mbOK, mbHelp],0);
     Abort;
  end;

  qryfundacoes.fieldbyname('idpessoa').AsInteger   := qry.fieldbyname('idpessoa').AsInteger;
  qryfundacoes.fieldbyname('idfundacao').AsInteger := qryfundacao.fieldbyname('idpessoa').AsInteger;
end;

procedure TfrmCadElegivel.sbtnApagarClick(Sender: TObject);
begin
  //edilaine - SIG33979 - inicio
  {//Renato Visoni SOL 125579 Kintana 649413
  if not (dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao)
  then dtmBasedados.dbBaseDados.StartTransaction;
  //Renato Visoni SOL 125579 Kintana 649413
  }//edilaine - SIG33979 - fim

   if (not qryPlanosPrev.IsEmpty) then
   begin
      sbtnApagar.Down := False;
      MsgDlg('Não é permitido efetuar a exclusão pois este funcionário já se tornou participante.','Informação',mtInformation,[mbOk,mbHelp],0);
      Exit;
   end;
   inherited;
end;



procedure TfrmCadElegivel.bbtnCancelarDetClick(Sender: TObject);
var bMuda : Boolean;
begin
   bbtnVoltarDetClick(self);
   spbtHistipoIrAlterar.Down := false;
   spbtHistipoIrExcluir.Down := false;
   
   if (qryContato.State = dsInsert) then
      qryContato.Cancel;

   bMuda := False;
  //Renato Visoni Sol 112013 / Kintana 520381
  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) then begin
    if (berroConta) and (rgrpTipoConta.Value = '2') then begin
      bMuda := True;
    end;
  end;
  //Renato Visoni Sol 112013 / Kintana 520381

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
    rgSituacaoAtual.OnClick := nil;
  
    pnlReprLegal.Repaint;
    pnlGrdReprLegal.Repaint;

    pnlReprLegal.visible := false ;
    pnlGrdReprLegal.visible := True ;
    rgSituacaoAtual.OnClick := rgSituacaoAtualClick;
  end;
  //Término - William Santana SOL 161550 KIN 1717512

  inherited;

  //Renato Visoni Sol 112013 / Kintana 520381
  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) and (bMuda) then begin
    if (iTipo<>0) and ((qryContaBancaria.FieldByname('TIPOCONTA').asInteger =2) and (qryContaBancaria.FieldByname('TIPOCONTA').asinteger <> iTipo) ) then begin
      qryContaBancaria.Edit;
      qryContaBancaria.FieldByname('TIPOCONTA').asInteger := iTipo;
      qryContaBancaria.Post;
    end;

    if bAcao = 'I' then qryContaBancaria.Delete;
  end;
  //Renato Visoni Sol 112013 / Kintana 520381


  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
    if trim(sIdEventoGerador) = '' then
      sbtnInsDet.Visible := False // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
    else
      sbtnInsDet.Visible := True; // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.

    GuardaDatasdeInscricao;
  end
  else
    sbtnInsDet.Visible := True;
end;



procedure TfrmCadElegivel.bbtnVoltarDetClick(Sender: TObject);
var bMuda : Boolean;
begin
  bGridPadrao:= true; //Darivaldo Alencar SIG 27871
  spbtHistipoIrAlterar.Down := false;
  spbtHistipoIrExcluir.Down := false;
  
  if (qryContato.State = dsInsert) then
     qryContato.Cancel;


  bMuda := False;
  //Renato Visoni Sol 112013 / Kintana 520381
  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) then begin
    if (berroConta) and (rgrpTipoConta.Value = '2') then begin
      bMuda := True;
    end;
  end;
  //Renato Visoni Sol 112013 / Kintana 520381

  inherited;
  
  //Renato Visoni Sol 112013 / Kintana 520381
  if (pgctrlDetalhe.ActivePage = tbsContaBancaria) and (bMuda) then begin
    if (iTipo<>0) and ((qryContaBancaria.FieldByname('TIPOCONTA').asInteger =2) and (qryContaBancaria.FieldByname('TIPOCONTA').asinteger <> iTipo) ) then begin
      qryContaBancaria.Edit;
      qryContaBancaria.FieldByname('TIPOCONTA').asInteger := iTipo;
      qryContaBancaria.Post;
    end;

    if bAcao = 'I' then qryContaBancaria.Delete;

  end;
  //Renato Visoni Sol 112013 / Kintana 520381


  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
    if Trim(sIdEventoGerador) = '' then
      sbtnInsDet.Visible := False // Se chama o form do Menu Cadastro, não pode inserir participante, só elegivel.
    else
      sbtnInsDet.Visible := True; // Se chama o form do Menu Participantes\Eventos, pode inserir participante e elegivel.

    GuardaDatasdeInscricao;
  end
  else
    sbtnInsDet.Visible := True;

  bbtnConfirmar.Enabled := True; // Felipe A. Santos SOL 208311 KTN 2020366

  //Início - William Santana SOL 161550 KIN 1717512
  if pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
    rgSituacaoAtual.OnClick := nil;
    pnlGrdReprLegal.visible := true  ;
    pnlReprLegal.visible := false ;
    rgSituacaoAtual.OnClick := rgSituacaoAtualClick;
  end;
  //Término - William Santana SOL 161550 KIN 1717512
  //Darivaldo Alencar SIG 27871 -inicio
  MostraEscondeGridOutrasInformacoes;
  FormataEdit(dbedPaiDetalhe.Name);
  //Darivaldo Alencar SIG 27871 -fim
end;



procedure TfrmCadElegivel.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4, VALORBASE5, VALORBASE6 FROM ELEGPATRO ' +
                 ' WHERE IDPESSJUR   = ' +qryelegpatro.fieldbyname('idpessjur').AsString+ ' AND '+
                 ' IDPESSOA = '+qryelegpatro.fieldbyname('idpessoa').AsString+' ' );
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     rOpcao4 := 0;
     rOpcao5 := 0;
     rOpcao6 := 0;
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

     if qryAux.FieldByName('VALORBASE4').AsString <> ''
     then rOpcao4 := qryAux.FieldByName('VALORBASE4').AsFloat
     else rOpcao4 := 0;

     if qryAux.FieldByName('VALORBASE5').AsString <> ''
     then rOpcao5 := qryAux.FieldByName('VALORBASE5').AsFloat
     else rOpcao5 := 0;

     if qryAux.FieldByName('VALORBASE6').AsString <> ''
     then rOpcao6 := qryAux.FieldByName('VALORBASE6').AsFloat
     else rOpcao6 := 0;
  end;

  bPodeAlterarOpcoes := True;

  if not qryAux.IsEmpty
  then begin // Opcoes já cadastradas
     bOpcoesExistem := True;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(dbedNomeFantasia.text,  dblkpcmbPatro.text,
                                          qrypatro.FieldByName('NOMEVALORBASE1').AsString,
                                          qrypatro.FieldByName('NOMEVALORBASE2').AsString,
                                          qrypatro.FieldByName('NOMEVALORBASE3').AsString,
                                          qrypatro.FieldByName('NOMEVALORBASE4').AsString,
                                          qrypatro.FieldByName('NOMEVALORBASE5').AsString,
                                          qrypatro.FieldByName('NOMEVALORBASE6').AsString,
                                          qrypatro.FieldByName('NUMOPCOES').AsInteger,
                                          rOpcao1, rOpcao2, rOpcao3,
                                          rOpcao4, rOpcao5, rOpcao6,
                                          bPodeAlterarOpcoes,
                                          qrypatro.FieldByName('FLGEDITAOP1').AsInteger,
                                          qrypatro.FieldByName('FLGEDITAOP2').AsInteger,
                                          qrypatro.FieldByName('FLGEDITAOP3').AsInteger,
                                          qrypatro.FieldByName('FLGEDITAOP4').AsInteger,
                                          qrypatro.FieldByName('FLGEDITAOP5').AsInteger,
                                          qrypatro.FieldByName('FLGEDITAOP6').AsInteger,
                                          qryelegpatro.fieldbyname('IDPESSJUR').AsInteger,
                                          qryelegpatro.fieldbyname('IDPESSOA').AsInteger,
                                          '','');
     frmCadOpcoesElegivel.Free;
  end
  else begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(dbedNomeFantasia.text, dblkpcmbPatro.text,
                                    qrypatro.FieldByName('NOMEVALORBASE1').AsString,
                                    qrypatro.FieldByName('NOMEVALORBASE2').AsString,
                                    qrypatro.FieldByName('NOMEVALORBASE3').AsString,
                                    qrypatro.FieldByName('NOMEVALORBASE4').AsString,
                                    qrypatro.FieldByName('NOMEVALORBASE5').AsString,
                                    qrypatro.FieldByName('NOMEVALORBASE6').AsString,
                                    qrypatro.FieldByName('NUMOPCOES').AsInteger,
                                    rOpcao1, rOpcao2, rOpcao3,
                                    rOpcao4, rOpcao5, rOpcao6,
                                    bPodeAlterarOpcoes,
                                    1,  // Permitir que as opções
                                    1,  // sejam digitadas no
                                    1,  // momento da inserção
                                    1,1,1,
                                    qryelegpatro.fieldbyname('IDPESSJUR').AsInteger,
                                    qryelegpatro.fieldbyname('IDPESSOA').AsInteger,
                                    '', '');

     frmCadOpcoesElegivel.Free;
  end;

  stateelegpatro := qryelegpatro.state;
  sidpessjurant  := qryelegpatro.fieldbyname('idpessjur').AsString;
  sidpessoaant   := qryelegpatro.fieldbyname('idpessoa').AsString;

  if ((rOpcao1 >= 0) or (rOpcao2 >= 0) or  (rOpcao3 >= 0) or (rOpcao4 >= 0) or (rOpcao5 >= 0) or  (rOpcao6 >= 0) ) and
     (frmCadOpcoesElegivel.ModalResult = mrOK) and
     ( (qryElegPatro.State = dsEdit) or (qryElegPatro.State = dsInsert) )
  then begin
     qryElegPatro.FieldbyName('ValorBase1').AsFloat := rOpcao1;
     qryElegPatro.FieldbyName('ValorBase2').AsFloat := rOpcao2;
     qryElegPatro.FieldbyName('ValorBase3').AsFloat := rOpcao3;
     qryElegPatro.FieldbyName('ValorBase4').AsFloat := rOpcao4;
     qryElegPatro.FieldbyName('ValorBase5').AsFloat := rOpcao5;
     qryElegPatro.FieldbyName('ValorBase6').AsFloat := rOpcao6;
  end;

end;

procedure TfrmCadElegivel.sbtnExcluiDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsPlanosPrev)
  then begin
       if ExisteContribuicao
       then begin
          sbtnExcluiDet.Down := False;
          MsgDlg('Não é permitido efetuar a exclusão pois o participante já possui contribuições !','Informação',mtInformation,[mbOk,mbHelp],0);
          TiraSql(qryAux);
          Exit;
       end;
  end;

  if pgctrlDetalhe.ActivePage = tbsContaBancaria then
  begin
    if pos(qryBanco.FieldByName('BANCO').Asstring, lBanco) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsElegivel then
  begin
    if pos(qryElegPatro.FieldByName('MATRICULA').Asstring, lDadosFunc) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  AtivaGrid(dbgrdOutrasInforms); //Darivaldo Alencar - SIG27871
  {Início - Michelle Mota - SIG 21866}
   if (MsgDlg('Deseja confirmar a exclusão do registro?','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
   begin
     //edilaine - SIG33979 - inicio
     if pgctrlDetalhe.ActivePage = tbsDet then
     begin
       //desvincula endereço do telefone
       if qryTelefone.locate('IDENDERECO', qryEndereco.FieldByName('IDENDERECO').AsInteger, []) then
       begin
         qryTelefone.edit;
         qryTelefone.FieldByName('IDENDERECO').AsString := '';
         qryTelefone.post;
       end;

       //desvincula endereço do tipo de endereço
       if      (qryIdEndComercial.AsFloat = qryEnderecoIdEndereco.AsFloat) then
          qryIdEndComercial.AsString   := '';
       if (qryIdEndResidencial.AsFloat = qryEnderecoIdEndereco.AsFloat) then
          qryIdEndResidencial.AsString := '';
       if (qryIdEndEntrega.AsFloat = qryEnderecoIdEndereco.AsFloat) then
          qryIdEndEntrega.AsString     := '';
       if (qryIdEndCobranca.AsFloat = qryEnderecoIdEndereco.AsFloat) then
          qryIdEndCobranca.AsString    := '';
       if (qryIdEndCorresp.AsFloat = qryEnderecoIdEndereco.AsFloat) then
          qryIdEndCorresp.AsString     := '';
     end;
     //edilaine - SIG33979 - inicio

     inherited;
   end;
  {Término - Michelle Mota - SIG 21866}
  //Inicío - William Santana - SIG 19040
  // Peterson Victor SOL 268568 PPM 1284501 Inicio

//  if MontaSelect.RetornouValor then
//  begin
//    with qryAux do
//    begin
//       Close;
//       SQL.Clear;
//       SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
//       SQL.Add(' CODTIPORECEBEDOR = NULL ');
//       SQL.Add(', DATAFIMRECEB = NULL ');
//       SQL.Add(', IDRESPONSAVEL = NULL ');
//       SQL.Add(', IDRESPONNAOREC = NULL ');
//       SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( MontaSelect.ValoresChave[2]) );
//       SQL.Add(' AND IDPESSOA    = '+Quotedstr( MontaSelect.ValoresChave[0]) );
//       SQL.Add(' AND IDTITULAR   = '+Quotedstr( MontaSelect.ValoresChave[0]) );
//       ExecSQL;
//     end;
//  end;
  // Peterson Victor SOL 268568 PPM 1284501 Fim
    //Término - William Santana - SIG 19040

end;

function TfrmCadElegivel.ExisteContribuicao: boolean;
var sNomesContrib : string;
begin
   Result := False;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' select ULTMESPREPARO from CONTRIBPREVPARTP '+
              ' where  idpessoa    = '+qry.FieldByName('IDPESSOA').AsString +
              ' and    idplanoprev = '+qryPlanosPrev.FieldByName('IDPLANOPREV').AsString +
              ' and    idpessjur   = '+qryElegPatro.FieldByName('IDPESSJUR').AsString);
   qryAux.Open;
   sNomesContrib := 'A(s) contribuição(ões) ';

   if not qryAux.IsEmpty
   then begin
      while not qryAux.Eof
      do begin
         if (qryAux.FieldByName('ULTMESPREPARO').AsString <> '') and
            (qryAux.FieldByName('ULTMESPREPARO').AsString <> '0000/00')
         then begin
            Result        := True;
            sNomesContrib := sNomesContrib+ sNomeContribuicao ;
            qryAux.Next;
         end;
      end;
      if Result
      then begin
         sNomesContrib := sNomesContrib + ' já foi(foram) cobrada(s) do participante. ';
         MsgDlg(sNomesContrib+ ' Este participante não poderá ser excluído. ','Erro',
                mtError,[mbOk],1);
         TiraSQL(qryAux);
         Abort;
      end;
   end;
end;

procedure TfrmCadElegivel.ExibeSalarioParticipacao;
var iMes, iDia, iAno             : Word;
    sMesRef, sMes, sSalPartAntes : string[07];
begin
  DecodeDate(qryPlanosPrev.FieldByName('InscricaoData').AsDateTime, iAno, iMes, iDia);

  sMes    := IntToStr(iMes);
  if iMes <  10 then
     sMes := '0'+sMes;

  sMesRef       := IntToStr(iAno)+'/'+sMes;
  sSalPartAntes := qryPlanosPrev.FieldByName('SALPARTICIPACAO').AsString;

  edSalarioPart.Text := CalcSalPart(qryElegPatro.FieldByName('IdPessJur').AsInteger,
                                    qry.FieldByName('IdPessoa').AsInteger, sMesRef, qryAux);

  if (edSalarioPart.Text = '') or (edSalarioPart.Text = '0') then
      edSalarioPart.Text := sSalPartAntes;
end;


procedure TfrmCadElegivel.dbdtNascEnter(Sender: TObject);
begin
  inherited;
  sDataNascAntes := Trim(dbdtNasc.Text);

end;

procedure TfrmCadElegivel.dbdtNascExit(Sender: TObject);
begin
  inherited;
  // Se mudou a data de nascimento -> recalcular opcoes
  if  (sDataNascAntes <> '') and
      (Trim(dbdtNasc.Text) <> sDataNascAntes) and
      (qry.State <> dsInsert)
  then begin
     if MsgDlg('Esta alteração pode resultar em alterações nos parâmetros '+
               'do participante. Deseja recalcular estes parâmetros agora ? ',
               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
     then begin
       // deixar para recalcular opcoes depois (no OK)
       bRecalculaOpcoes := True;
       Exit;
     end;
     // Recalcular opcoes
     if not RecalculaOpcoes
     then MsgDlg('Ocorreram erros no recálculo dos parâmetros(opções) do participante. ',
                 'Erro',mtError,[mbOk,mbHelp],0)
     else bRecalculaOpcoes := False;
  end;
end;

procedure TfrmCadElegivel.dbdtAdesaoEnter(Sender: TObject);
begin
  inherited;
  sDataAdmissaoAntes := Trim(dbdtAdesao.Text);
end;

procedure TfrmCadElegivel.dbdtAdesaoExit(Sender: TObject);
begin
  inherited;
  // Se mudou a data de admissoa -> recalcular opcoes
  if  (sDataAdmissaoAntes <> '') and
      (Trim(dbdtAdesao.Text) <> sDataAdmissaoAntes) and
      (qryElegPatro.State <> dsInsert)
  then begin
     if MsgDlg('Esta alteração pode resultar em alterações nos parâmetros '+
               'do participante. Deseja recalcular estes parâmetros agora ? ',
               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
     then begin
       // deixar para recalcular opcoes depois (no OK)
       bRecalculaOpcoes := True;
       Exit;
     end;

     // Recalcular opcoes
     if not RecalculaOpcoes
     then MsgDlg('Ocorreram erros no recálculo dos parâmetros(opções) do participante. ',
                 'Erro',mtError,[mbOk,mbHelp],0)
     else bRecalculaOpcoes := False;
  end;
end;

procedure TfrmCadElegivel.dbdtInscricaoEnter(Sender: TObject);
begin
  inherited;
  sDataInscricaoAntes := Trim(dbdtInscricao.Text);
end;

procedure TfrmCadElegivel.dbdtInscricaoExit(Sender: TObject);
begin
  inherited;

  if StrTodate(dbdtInscricao.Text) < qryPlanPrev.FieldByName('DATAINSC').AsDateTime
  Then Begin
     MsgDlg('Data de inscrição não pode ser menor que a data de início do Plano. ',
                 'Erro',mtError,[mbOk,mbHelp],0);
     qryPlanosPrev.FieldByName('InscricaoData').Clear;     
     Exit;
  end;


  // Se mudou a data de admissao -> recalcular opcoes
  if  (sDataInscricaoAntes <> '') and
      (Trim(dbdtInscricao.Text) <> sDataInscricaoAntes) and
      (qryPlanosPrev.State <> dsInsert)
  then begin
     if MsgDlg('Esta alteração pode resultar em alterações nos parâmetros '+
               'do participante. Deseja recalcular estes parâmetros agora ? ',
               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
     then begin
       // deixar para recalcular opcoes depois (no OK)
       bRecalculaOpcoes := True;
       Exit;
     end;

     // Recalcular opcoes
     if not RecalculaOpcoes
     then MsgDlg('Ocorreram erros no recálculo dos parâmetros(opções) do participante. ',
                 'Erro',mtError,[mbOk,mbHelp],0)
     else bRecalculaOpcoes := False;
  end;
end;

procedure TfrmCadElegivel.dbrgrpSexoEnter(Sender: TObject);
begin
  inherited;
  if dbrgrpSexo.ItemIndex = 0
  then sSexoAntes := 'M'
  else sSexoAntes := 'F';
end;

procedure TfrmCadElegivel.dbrgrpSexoExit(Sender: TObject);
var sSexoDepois : string;
begin
  inherited;
  if dbrgrpSexo.ItemIndex = 0
  then sSexoDepois := 'M'
  else sSexoDepois := 'F';

  // Se mudou o sexo  -> recalcular opcoes
  if  (sSexoAntes  <> '') and
      (sSexoDepois <> sSexoAntes) and
      (qry.State <> dsInsert)
  then begin
     if MsgDlg('Esta alteração pode resultar em alterações nos parâmetros '+
               'do participante. Deseja recalcular estes parâmetros agora ? ',
               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
     then begin
       // deixar para recalcular opcoes depois (no OK)
       bRecalculaOpcoes := True;
       Exit;
     end;

     // Recalcular opcoes
     if not RecalculaOpcoes
     then MsgDlg('Ocorreram erros no recálculo dos parâmetros(opções) do participante. ',
                 'Erro',mtError,[mbOk,mbHelp],0)
     else bRecalculaOpcoes := False;
  end;
end;

procedure TfrmCadElegivel.dbedTempoServAnteriorEnter(Sender: TObject);
begin
  inherited;
  //sTempoServAntes    := Trim(dbedTempoServAnterior.Text); Darivaldo Alencar SIG37689
end;

procedure TfrmCadElegivel.dbedTempoServAnteriorExit(Sender: TObject);
begin
  inherited;
//Darivaldo Alencar SIG37689 -inicio
//  // Se mudou o tempo de servico anterior   -> recalcular opcoes
//  if  (sTempoServAntes  <> '') and
//      (Trim(dbedTempoServAnterior.Text) <> sTempoServAntes)  and
//      (qryElegPatro.State <> dsInsert)
//  then begin
//     if MsgDlg('Esta alteração pode resultar em alterações nos parâmetros '+
//               'do participante. Deseja recalcular estes parâmetros agora ? ',
//               'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
//     then begin
//       // deixar para recalcular opcoes depois (no OK)
//       bRecalculaOpcoes := True;
//       Exit;
//     end;
//     // Recalcular opcoes
//     if not RecalculaOpcoes
//     then MsgDlg('Ocorreram erros no recálculo dos parâmetros(opções) do participante. ',
//                 'Erro',mtError,[mbOk,mbHelp],0)
//     else bRecalculaOpcoes := False;
//  end;
//Darivaldo Alencar SIG37689 -fim
end;

procedure TfrmCadElegivel.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsInsert
  then qry.FieldByName('RazaoSocial').AsString := qry.FieldbyName('Nome').AsString;
end;

procedure TfrmCadElegivel.dbedSalPartInscExit(Sender: TObject);
begin
  inherited;

  if dbedSalPartInsc.Text = '' then Exit;
  dbedSalPartInsc.Text   := ClienteNumero(dbedSalPartInsc.Text);

  if qryPlanosPrev.State = dsInsert
  then edSalarioPart.Text := dbedSalPartInsc.Text;
end;

procedure TfrmCadElegivel.sbtnConsContribClick(Sender: TObject);
begin
  inherited;
  if (not (qryPlanosPrev.IsEmpty) ) and
     (qryPlanosPrev.FieldByname('IdPessoa').AsString <> '')
  then MostraDetalhesContribuicao( qryPlanosPrev.FieldByName('IdPessJur').AsInteger,
                              qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger,
                              qryPlanosPrev.FieldByName('IdPessoa').AsInteger,
                              qryPlanosPrev.FieldByName('SeqProposta').AsInteger,
                              'Consulta às contribuições do participante ...',
                              '', 'IP', '',
                              qryPlanosPrev.FieldByName('InscricaoData').AsString,'',
                              qryAux);
  sbtnConsContrib.Down := False;
end;

procedure TfrmCadElegivel.qryPessoaFisicaBeforePost(DataSet: TDataSet);
var iNumDepIRRF,
    iNumDepSalF,
    iNumDepIRRFCad,
    iNumDepSalFCad    : longint;
begin
  inherited;

 // qrypessoafisica.fieldbyname('ESTCIVIL').AsString     := sEstCiv; //William Santana - 209384/15928 KIN 2062832

  //CPrev - 27955 - Inicio

  // Thiago Melo SOL 223532 Kintana 2057056
  if edtNacionalidade.tag > 0 then begin
    qrypessoafisica.fieldbyname('IDPAIS').AsInteger       := edtNacionalidade.tag; // SOL 219782 KINTANA 2054136
  end else begin
    qrypessoafisica.fieldbyname('IDPAIS').IsNull;
  end;

  if edtEstado.tag > 0 then begin
    qrypessoafisica.fieldbyname('IDESTADO').AsInteger     := edtEstado.tag;      // SOL 219782 KINTANA 2054136
  end else begin
    qrypessoafisica.fieldbyname('IDESTADO').IsNull;
  end;

  if edtNaturalidade.tag > 0 then begin
    qrypessoafisica.fieldbyname('IDCIDADES').AsInteger    := edtNaturalidade.tag;
  end else begin
    qrypessoafisica.fieldbyname('IDCIDADES').IsNull;
  end;
  // Thiago Melo SOL 223532 Kintana 2057056
    
  //CPrev - 27955 - Fim

  // Verificar se o No. de Dependentes para IRRF e para Salario Familia coincidem
  // com o no. de dependentes cadastrados no sistemas que dizem que conta para IRRF
  // e para Salario Familia
  iNumDepIRRF := qryPessoaFisica.FieldByName('NUMDEPIRRF').AsInteger;
  iNumDepSalF := qryPessoaFisica.FieldByName('NUMDEPSALF').AsInteger;
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPIRRF FROM DEPENTIT '+
             ' WHERE IDTITULAR = '+qry.FieldbyName('IdPessoa').AsString+
             ' AND   IDPESSOA <> IDTITULAR '+
             ' AND   FLGCONTAIMPOSTOR = 1 ');
     Open;
     if IsEmpty
     then iNumDepIRRFCad := 0
     else iNumDepIRRFCad := FieldByName('NumDepIRRF').AsInteger;

     if (iNumDepIRRF <> iNumDepIRRFCad)
     then begin
        if MsgDlg(' Existem '+IntToStr(iNumDepIRRFCad)+ ' dependentes cadastrados '+
                  ' no sistema para IRRF. Porém nesta tela existem '+InttoStr(iNumDepIRRF)+
                  ' dependentes informados. Deseja substituir este número para '+InttoStr(iNumDepIRRFCad)+' ? ',
                  'Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
        then begin
           qryPessoaFisica.FieldByName('NumDepIRRF').AsInteger := iNumDepIRRFCad;
        end;
     end;
  end;//with qryAux

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPSALF FROM DEPENTIT '+
             ' WHERE IDTITULAR = '+qry.FieldbyName('IdPessoa').AsString+
             ' AND   IDPESSOA <> IDTITULAR '+
             ' AND   FLGCONTASALARIOF = 1 ');
     Open;
     if IsEmpty
     then iNumDepSalFCad := 0
     else iNumDepSalFCad := FieldByName('NumDepSALF').AsInteger;

     if (iNumDepSalF <> iNumDepSalFCad)
     then begin
        if MsgDlg(' Existem '+IntToStr(iNumDepSalFCad)+ ' dependentes cadastrados '+
                  ' no sistema para Salário Família. Porém nesta tela existem '+InttoStr(iNumDepSalF)+
                  ' dependentes informados. Deseja substituir este número para '+InttoStr(iNumDepSalFCad)+' ? ',
                  'Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
        then begin
           qryPessoaFisica.FieldByName('NumDepSALF').AsInteger := iNumDepSalFCad;
        end;
     end;
  end;//with qryAux
end;

procedure TfrmCadElegivel.dblkOrgPrevCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryElegPatro.fieldbyname('IDPESSJURORGAO').value := qryOrgaoprev.fieldbyname('IDPESSJUR').asinteger;
  qryElegPatro.fieldbyname('SIGLA').value          := qryOrgaoprev.fieldbyname('SIGLA').asstring;
end;

procedure TfrmCadElegivel.dblkpcmbCargoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (qryElegPatro.State = dsInsert) and  (Trim(dbedNivel.Text) = '') then
  begin
     // Trazer o nível atual, mas deixar alterar
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT N.CODIGO FROM NIVEL N, CARGOXNIVEL CN '+
                    ' WHERE  CN.IDCARGOEXT = '+qryCargo.FieldbyName('IdCargoExt').AsString+
                    ' AND    CN.IDNIVEL    = N.IDNIVEL '+
                    ' ORDER BY CN.DATAVIGENCIA DESC ');
     qryAux.Open;
     if not qryAux.IsEmpty then
     begin
        qryAux.First;
        qryElegPatro.FieldByName('Nivel').AsString := qryAux.FieldByName('CODIGO').AsString;
        dbedNivel.Text := qryAux.FieldByName('CODIGO').AsString;
     end;
  end;

  edtCodCargo.Text := qryCargo.fieldByName('CODIGO').AsString;
end;


procedure TfrmCadElegivel.dbedDocumentoExit(Sender: TObject);
begin
  //Sol 122621 - Ádler Souza
  bCpf1 := False;
  If (qry.State in [dsInsert, dsEdit]) And (Trim(dbedDocumento.Text) <> '') then begin
    //Sol 86810 - Ádler Souza
    {Início - Michelle Mota - SIG 21866}
   { if VerificaDocExcecao(dbedDocumento.Text) then
    begin
      MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
      //Sol 122928 - Ádler Souza
      if dbedDocumento.CanFocus then
        dbedDocumento.SetFocus;
      //Fim - Sol 122928 - Ádler Souza
      exit;
    end;     }
    //Fim - Sol 86810 - Ádler Souza
  end;

  //edilaine - SIG33979 - inicio
  if (not ValidarCpf(dbedDocumento.text)) then
  begin
    if bbtnCancelar.focused then
       dbedDocumento.text := ''
    else
    begin
      MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
      dbedDocumento.SetFocus;
      exit;
    end;
  end;
  //edilaine - SIG33979 - fim

  inherited;

  //If qry.State in [dsBrowse]
   //Then exit;

  //Fim - Sol 122621 - Ádler Souza

  if (not bVeioDoMenu) and (not bJaExiste) and (not bExibiuPerguntaInscricao)
  then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT PL.NOME AS PLANO, SP.DESCRICAO AS SITUACAO, PP.INSCRICAONUMERO, PP.INSCRICAODATA '+
                ' FROM   PLANPREV PL, PARTPREVPLAN PP, SITPART SP '+
                ' WHERE  PP.IDPESSOA      = '+qry.FieldbyName('IDPESSOA').AsString+
                ' AND    PP.IDSITPART     = SP.IDSITPART '+
                ' AND    PP.IDPLANOPREV   = PL.IDPLANOPREV '+
                ' AND    PP.FLGDESATIVADO = 0 ');
        Open;
        if not IsEmpty then
        begin
           bExibiuPerguntaInscricao := True; 
           if MsgDlg('O participante já está inscrito no plano '+FieldByName('Plano').AsString+' desde '+
                     FieldByName('InscricaoData').AsString+' com a inscrição nº '+FieldByName('InscricaoNumero').AsString+
                     ' e sua situação atual neste plano é '+FieldByName('Situacao').AsString+'. '+#13+
                     'Deseja incluir o participante em um novo plano previdenciário ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo then
           begin
              MsgDlg('Para retornar o participante para o mesmo plano, utilize o evento Reinscrição do Participante.','Informação',mtInformation,[mbOk],0); // CAMILLE - 22.03.2004 - Pende 16269
              bJaExiste := true;
              spbDependente.Visible := True;       
              bbtnCancelar.Click;
           end
        end;
     end;
  end;


  If (qry.State in [dsInsert, dsEdit]) And (Trim(dbedDocumento.Text) <> '')
   Then Begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT TD.IDDOCUMENTO, DP.NUMDOCUMENTO');
    qryAux.SQL.Add('FROM TIPODOCPESSOA TD, DOCPESSOA DP');
    qryAux.SQL.Add('WHERE (TD.NOMEDOCUMENTO = ''CPF'') ');
    qryAux.SQL.Add('  AND (TD.IDDOCUMENTO   = DP.IDDOCUMENTO(+))');
    qryAux.SQL.Add('  AND (DP.IDPESSOA(+)   = '+qry.FieldByName('IDPESSOA').AsString+')');

    qryAux.Open;

    If Trim(qryAux.FieldByName('NUMDOCUMENTO').AsString) = ''
     Then If qryDocumento.Locate('IDDOCUMENTO',qryAux.FieldByName('IDDOCUMENTO').AsString,[loCaseInsensitive])
           // Edita o registro existente
           Then If qryDocumento.State <> dsEdit
                 Then Begin
                   qryDocumento.Edit;
                   qryDocumento.FieldByName('NUMDOCUMENTO').AsString := dbedDocumento.Text;
                   qryDocumento.Post;
                 End
                 Else qryDocumento.FieldByName('NUMDOCUMENTO').AsString := dbedDocumento.Text
           // Insere um Novo registro
           Else Begin
             qryTipoDoc.Locate('IDDOCUMENTO',qryAux.FieldByName('IDDOCUMENTO').AsString,[loCaseInsensitive]);
             qryDocumento.Insert;
             qryDocumentoIDDOCUMENTO.AsFloat    := qryTipoDocIDDOCUMENTO.AsFloat;
             qryDocumentoNOMEDOCUMENTO.AsString := qryTipoDocNOMEDOCUMENTO.AsString;
             qryDocumentoMASCARA.AsString       := qryTipoDocMASCARA.AsString;
             qryDocumentoOBRIGAUF.AsString      := qryTipoDocOBRIGAUF.AsString;
             qryDocumentoOBRIGAORGAO.AsString   := qryTipoDocOBRIGAORGAO.AsString;
             qryDocumentoOBRIGAEMISSAO.AsString := qryTipoDocOBRIGAEMISSAO.AsString;
             qryDocumentoIDPESSOA.AsFloat       := qryIDPESSOA.AsFloat;
             qryDocumentoNUMDOCUMENTO.AsString  := dbedDocumento.Text;
             qryDocumentoFLGOBRIGAVALIDADE.AsString := qryTipoDocFLGOBRIGAVALIDADE.AsString;
             qryDocumento.Post;
           End;
   End;
  
end;

procedure TfrmCadElegivel.dbedNomeFantasiaExit(Sender: TObject);
begin

  inherited;

  if (not bVeioDoMenu) and (qry.State = dsInsert) and (not bJaExiste) and (not bExibiuPerguntaInscricao) 
  then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT PL.NOME AS PLANO, SP.DESCRICAO AS SITUACAO, PP.INSCRICAONUMERO, PP.INSCRICAODATA '+
                ' FROM   PLANPREV PL, PARTPREVPLAN PP, SITPART SP '+
                ' WHERE  PP.IDPESSOA      = '+qry.FieldbyName('IDPESSOA').AsString+
                ' AND    PP.IDSITPART     = SP.IDSITPART '+
                ' AND    PP.IDPLANOPREV   = PL.IDPLANOPREV '+
                ' AND    PP.FLGDESATIVADO = 0 ');
        Open;
        if not IsEmpty then
        begin
           bExibiuPerguntaInscricao := True; 
           if MsgDlg('O participante já está inscrito no plano '+FieldByName('Plano').AsString+' desde '+
                     FieldByName('InscricaoData').AsString+' com a inscrição nº '+FieldByName('InscricaoNumero').AsString+
                     ' e sua situação atual neste plano é '+FieldByName('Situacao').AsString+'. '+#13+
                     'Deseja incluir o participante em um novo plano previdenciário ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo then
           begin
              bJaExiste := true;
              bbtnCancelar.Click;
           end;
        end;
     end;
  end;
end;

procedure TfrmCadElegivel.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   bJaExiste := False;
   bExibiuPerguntaInscricao := False;
   SetLength(aPlanoDatas,1); aPlanoDatas[0] := '';

   //edilaine - SIG33979 - inicio
   if not(dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao) then
      dtmBasedados.dbBaseDados.StartTransaction;
   //edilaine - SIG33979 - fim
end;

procedure TfrmCadElegivel.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   //edilaine - SIG33979 - inicio
   if not(dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao) then
      dtmBasedados.dbBaseDados.StartTransaction;
   //edilaine - SIG33979 - fim

   bRecalculaOpcoes := False;
   SetLength(aPlanoDatas,1); aPlanoDatas[0] := '';

   bTtravarCadastro:= False;
   if TravaAlteracao(qry.FieldByName('IDPESSOA').AsInteger) then
   begin
     bTtravarCadastro:= True;
     grpFiliacao.Enabled:= False;
     dblkGrauInstrucao.Enabled:= False;
     cmbEstCiv.Enabled:= False;
     GroupBox3.Enabled:= False;
     grpDependentes.Enabled:= False;
     grpNaturalidade.Enabled:= False;
     grpDataNasc.Enabled:= False;
     dbrgrpSexo.Enabled:= False;
     dbrgrpIsentoIR.Enabled:= False;
     //dbrgrpFlgMolestiaGrave.Enabled:= False;
     spbDependente.Enabled:= False;
     DbChbSomaIR.Enabled:= False;
     BitBtn1.Enabled:= False;
     PintarCampos([grpFiliacao, dblkGrauInstrucao, cmbEstCiv,
                   GroupBox3, grpDependentes, grpNaturalidade, grpDataNasc,
                   dbrgrpSexo, dbrgrpIsentoIR, {dbrgrpFlgMolestiaGrave,}
                   spbDependente, DbChbSomaIR, BitBtn1], clGray);

     lBanco:= '';
     qryBanco.First;
     while not qryBanco.Eof do
     begin
       lBanco:= lBanco + ' ' + qryBanco.FieldByName('BANCO').AsString;
       qryBanco.Next;
     end;

     lDadosFunc:= '';
     qryElegPatro.First;
     while not qryElegPatro.Eof do
     begin
       lDadosFunc:= lDadosFunc + ' ' + qryElegPatro.FieldByName('MATRICULA').AsString;
       qryElegPatro.Next;
     end;

   end;
end;

procedure TfrmCadElegivel.dbedContaCorrenteExit(Sender: TObject);
begin
  inherited;

  If Trim(qryBanco.FieldByName('FLGVALIDACC').AsString) = 'S'
   Then try
         CalculaDV := TCalcDV.Create;  //Fernando Santana SOL 136478 \ Kintana 820017
         CalculaDV.TipoConta := rgrpTipoConta.ItemIndex + 1;
         
         CalculaDV.ValidaConta( qryBanco.FieldByName('NumBanco').AsString,
                                qryAgencia.FieldByName('Numagencia').AsString,
                                dbedContaCorrente.Text,
                                True)
         
        Finally
           Try
              CalculaDV.Free;//Fernando Santana SOL 136478 \ Kintana 820017
           Except
           End;
        end;
  
end;

procedure TfrmCadElegivel.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgencia.Locate('NumAgencia',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbAgencia.Text := qryAgencia.FieldByName('Agencia').AsString;
     dblkpcmbAgencia.PerformSearch;
     dblkpcmbAgencia.OnCloseUp(self,qryAgencia,nil,false);  
  end;
end;

procedure TfrmCadElegivel.edDigBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
     dblkpcmbBanco.Text := qryBanco.FieldByName('Banco').AsString;
     dblkpcmbBanco.PerformSearch;
     dblkpcmbBanco.OnCloseUp(self,qryBanco,nil,false);  
     edDigAgencia.Text := '';
     dblkpcmbAgencia.Text := '';
  end;
end;

procedure TfrmCadElegivel.qryBancoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryBanco.Active then Exit;
  if (Trim(dblkpcmbBanco.Text) = '') or (edDigBanco.Text <> '')  then Exit;
  edDigBanco.Text := qryBanco.FieldByName('NumBanco').AsString;

end;

procedure TfrmCadElegivel.qryAgenciaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryAgencia.Active then Exit;
  if (Trim(dblkpcmbAgencia.Text) = '') or (edDigAgencia.Text <> '') then Exit;

  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;
end;

procedure TfrmCadElegivel.qryContaBancariaAfterEdit(DataSet: TDataSet);
begin
  inherited;
  edDigBanco.Text   := qryBanco.FieldByName('NumBanco').AsString;
  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;
end;

{procedure TfrmCadElegivel.dbrgrpFlgMolestiaGraveClick(Sender: TObject);
begin
  // FlgMolestiaGrave . Caso Afirmativo, insere Data Moléstia Grave
  if  wwDBCBIsentoIrrf.ItemIndex = 2 Then
  Begin
    dbrgrpMolestiaGrave.Visible := True;
    qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 1;

  End
  else begin
     dbrgrpMolestiaGrave.Visible := False;
   //  dbdtMolestiaGrave.Text      := '';
   //  qryPessoaFisica.FieldByName('DATAMOLESTIAGRAVE').AsString := '';
     qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;

     If qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger = 1 Then
       if MsgDlg('Deseja DESMARCAR a opção Pessoa Isenta de IR?','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes Then
         qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 0;
  end;

  //inherited;
end;
 }
procedure TfrmCadElegivel.FormShow(Sender: TObject);
begin
  inherited;

  // SOL:121637 - Daniel Begnami
  dblkGrauInstrucao.enabled  := True;
  cmbEstCiv.enabled   := True;
  // FIM

  QryTipoRecebedor.Open; //William Santana - Sol 161550 Kin 1717512

  iTipoOpcaoIR := -1;
  qryPessoaFisica.Open;
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  bPerguntouRubrica := False;

  //Darivaldo Alencar SIG 27871 -inicio
  qryOcupacao.Close;
  qryOcupacao.ParamByName('IDPESSOA').asInteger := -1;
  qryOcupacao.Open;
  //Darivaldo Alencar SIG 27871 -fim

   //edilaine - SIG33979 - inicio
   iMsIdPessJur := -1;
   iMsIdPessoa  := -1;
   {variavel criada na herança para informar que deverá validar se existe transação aberta}
   bFlgValidaInTransaction := True;
   //edilaine - SIG33979 - fim

   dbDataOpcaoIR.Enabled := grpTipoOpIR.Enabled; //TAES - SIG98903
   cmbTipoOpIR.Enabled := grpTipoOpIR.Enabled;   //TAES - SIG98903

end;

procedure TfrmCadElegivel.dbedinscExit(Sender: TObject);
var bEncontrou : boolean;
begin
  inherited;
  if Trim(dbedInsc.Text) = '' then Exit;

  bEncontrou := False;
  qryPlanosPrev.First;
  while not qryPlanosPrev.Eof do
  begin
     if qryPlanosPrev.FieldByName('INSCRICAONUMERO').AsString = Trim(dbedInsc.Text)
     then bEncontrou := True;
     qryPlanosPrev.Next;
  end;
  if not bEncontrou
  then begin
     MsgDlg('O participante não tem este número de inscrição em nenhum dos planos que pertenceu. Verifique.','Erro',mtError, [ mbOK, mbHelp],0);
     dbedInsc.SetFocus;
     Exit;
  end;
end;

procedure TfrmCadElegivel.CmeDetalheConfirma(Sender: TObject);
Var
 iLixo : Integer;
 QryhstOpcaoIr : TwwQuery; //Renato Visoni SOL125579
 sIdEndTel : string;      //edilaine - SIG33979
begin
  if (pgctrlDetalhe.ActivePage = tbsElegivel)
  then begin
     frmAguarde.Mostra('Gravando Histórico Funcional...');

     if qryHistFuncPrev.Active and qryHistFuncPrev.UpdatesPending then qryHistFuncPrev.CancelUpdates;

     qryHistFuncPrev.Close;
     qryHistFuncPrev.ParamByName('IDPESSOA').AsInteger     := qryElegPatro.FieldByName('IDPESSOA').AsInteger;
     qryHistFuncPrev.ParamByName('IDPESSJUR').AsInteger    := qryElegPatro.FieldByName('IDPESSJUR').AsInteger;
     qryHistFuncPrev.Open;

     if qryHistFuncPrev.IsEmpty
     then begin
        qryHistFuncPrev.Insert;
        qryHistFuncPrev.FieldByName('IDPESSOA').AsInteger         := qryElegPatro.FieldByName('IDPESSOA').AsInteger;
        qryHistFuncPrev.FieldByName('IDPESSJUR').AsInteger        := qryElegPatro.FieldByName('IDPESSJUR').AsInteger;
        qryHistFuncPrev.FieldByName('SEQHISTFUNC').AsInteger      := LeUltRegistro(nil, 'HISTFUNCPREV');

        qryHistFuncPrev.FieldByName('DATAINICIO').AsDateTime      := qryElegPatro.FieldByName('DATAADMISSAO').AsDateTime;


        if not(qryElegPatro.FieldByName('DATAREADMISSAO').IsNull) then
          qryHistFuncPrev.FieldByName('DATAINICIO').AsDateTime    := qryElegPatro.FieldByName('DATAREADMISSAO').AsDateTime;



        If prmFlgContaTempInsc = 1
         Then qryHistFuncPrev.FieldByName('FLGCONTATS').AsInteger := 1
         Else qryHistFuncPrev.FieldByName('FLGCONTATS').AsInteger := 0;

        qryHistFuncPrev.FieldByName('FLGCONCOMITANTE').AsInteger  := 0;
        qryHistFuncPrev.FieldByName('DATAPROCESSO').AsDateTime    := date;
        qryHistFuncPrev.FieldByName('MATRICULA').AsString         := qryElegPatro.FieldByName('MATRICULA').AsString;
        qryHistFuncPrev.FieldByName('EMPRESA').AsString           := qryPatro.FieldByName('NOME').AsString;
        qryHistFuncPrev.Post;

        If prmFlgContaTempInsc = 1
         Then Begin
           iLixo := CalcTempoContrib(qryAux,
                                     qryElegPatro.FieldByName('IDPESSOA').AsInteger,
                                     qryHistFuncPrev.FieldByName('SEQHISTFUNC').AsInteger,
                                     1,
                                     1,
                                     DateTimeToStr(qryElegPatro.FieldByName('DATAADMISSAO').AsDateTime),
                                     '',

                                     FormatDateTime('dd/mm/yyyy', Date));
         End;


     end
     else begin
        qryHistFuncPrev.Edit;
        qryHistFuncPrev.FieldByName('DATAINICIO').AsDateTime      := qryElegPatro.FieldByName('DATAADMISSAO').AsDateTime;


        if not(qryElegPatro.FieldByName('DATAREADMISSAO').IsNull) then
          qryHistFuncPrev.FieldByName('DATAINICIO').AsDateTime    := qryElegPatro.FieldByName('DATAREADMISSAO').AsDateTime;


        qryHistFuncPrev.Post;
     end;
     frmAguarde.Apaga;
  end else if (pgctrlDetalhe.ActivePage = tbsPlanosPrev) then
  begin
    //Renato Visoni SOL 125579
    if ((qryPlanosPrev.State in [dsInsert,dsEdit]) or (iTipoOpcaoIRAnt <> iTipoOpcaoIR))and
       (cmbTipoOpIR.Value <> '-1') and (dbDataOpcaoIR.Text<>'') then
    begin
      if not(dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao)
      then dtmBasedados.dbBaseDados.StartTransaction;

      QryhstOpcaoIr := TwwQuery.Create(Self);
      QryhstOpcaoIr.DatabaseName :='BaseDados';

      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' SELECT * FROM HISTOPIR ');
      QryAux.SQL.Add(' WHERE IDPESSOA  = '+ Qry.FieldByName('IDPESSOA').AsString);
      QryAux.SQL.Add(' AND IDPLANPREV  = '+ qryPlanosPrev.FieldByName('IDPLANOPREV').AsString);
      QryAux.SQL.Add(' AND DTFIM IS NULL');

      QryAux.Open;

      if (bInsereOpcaoIr) then
      if (QryAux.IsEmpty)  then begin
        QryhstOpcaoIr.Close;
        QryhstOpcaoIr.SQL.Clear;
        QryhstOpcaoIr.SQL.Add('INSERT INTO HISTOPIR ');
        QryhstOpcaoIr.SQL.Add('(IDHISTOPIR,IDPESSOA, IDPLANPREV, TIPOOPCAOIR, DTINICIO, DTFIM)VALUES');
        QryhstOpcaoIr.SQL.Add('(SEQHISTOPIR.NEXTVAL,'+ Qry.FieldByName('IDPESSOA').AsString+','+qryPlanosPrev.FieldByName('IDPLANOPREV').AsString+',');
        QryhstOpcaoIr.SQL.Add(  inttostr(cmbTipoOpIR.itemindex+1) +','+ QuotedStr(dbDataOpcaoIR.Text) +','+ 'NULL)');  // Andre Imakawa - SIG 47046 //TAES - SIG91757
        QryhstOpcaoIr.ExecSQL;
      end else begin
        if (QryAux.FieldByname('DTINICIO').asDateTime <> dbDataOpcaoIR.Date) or (QryAux.FieldByname('TIPOOPCAOIR').asString <> inttostr(cmbTipoOpIR.itemindex+1))then begin     // Andre Imakawa - SIG 47046 //TAES - SIG91757
          if (QryAux.FieldByname('DTINICIO').asDateTime <> dbDataOpcaoIR.Date) and (QryAux.FieldByname('TIPOOPCAOIR').asString = inttostr(cmbTipoOpIR.itemindex+1))then begin   // Andre Imakawa - SIG 47046 //TAES - SIG91757
            //Atualiza só a Data atual.
            QryhstOpcaoIr.Close;
            QryhstOpcaoIr.SQL.Clear;
            QryhstOpcaoIr.SQL.Add('UPDATE HISTOPIR SET DTINICIO = TO_DATE('+QuotedStr(dbDataOpcaoIR.Text)+',''DD/MM/YYYY'')');
            QryhstOpcaoIr.SQL.Add(' WHERE IDPESSOA  = '+ Qry.FieldByName('IDPESSOA').AsString);
            QryhstOpcaoIr.SQL.Add(' AND IDPLANPREV  = '+ qryPlanosPrev.FieldByName('IDPLANOPREV').AsString);
            QryhstOpcaoIr.SQL.Add(' AND DTFIM IS NULL');
            QryhstOpcaoIr.ExecSQL;

          end else begin
            if (dbDataOpcaoIR.Date < QryAux.FieldByname('DTINICIO').asDateTime) then begin
              QryhstOpcaoIr.Close;
              QryhstOpcaoIr.SQL.Clear;
              QryhstOpcaoIr.SQL.Add(' DELETE  FROM HISTOPIR ' );
              QryhstOpcaoIr.SQL.Add(' WHERE IDPESSOA  =  '+ Qry.FieldByName('IDPESSOA').AsString);
              QryhstOpcaoIr.SQL.Add(' AND IDPLANPREV  =  '+ qryPlanosPrev.FieldByName('IDPLANOPREV').AsString);
              QryhstOpcaoIr.SQL.Add(' AND TO_DATE(TO_CHAR(DTINICIO,''DD/MM/YYYY''),''DD/MM/YYYY'') >= TO_DATE('+QuotedStr(dbDataOpcaoIR.Text)+',''DD/MM/YYYY'')');

              QryhstOpcaoIr.ExecSQL;
            end;

            QryhstOpcaoIr.Close;
            QryhstOpcaoIr.SQL.Clear;
            QryhstOpcaoIr.SQL.Add('UPDATE HISTOPIR SET DTFIM = TO_DATE('+QuotedStr(dbDataOpcaoIR.Text)+',''DD/MM/YYYY'')-1');
            QryhstOpcaoIr.SQL.Add(' WHERE IDPESSOA  = '+ Qry.FieldByName('IDPESSOA').AsString);
            QryhstOpcaoIr.SQL.Add(' AND IDPLANPREV  = '+ qryPlanosPrev.FieldByName('IDPLANOPREV').AsString);
            QryhstOpcaoIr.SQL.Add(' AND DTFIM IS NULL');
            QryhstOpcaoIr.ExecSQL;

            QryhstOpcaoIr.Close;
            QryhstOpcaoIr.SQL.Clear;
            QryhstOpcaoIr.SQL.Add('INSERT INTO HISTOPIR ');
            QryhstOpcaoIr.SQL.Add('(IDHISTOPIR,IDPESSOA, IDPLANPREV, TIPOOPCAOIR, DTINICIO, DTFIM)VALUES');
            QryhstOpcaoIr.SQL.Add('(SEQHISTOPIR.NEXTVAL,'+ Qry.FieldByName('IDPESSOA').AsString+','+qryPlanosPrev.FieldByName('IDPLANOPREV').AsString+',');
            QryhstOpcaoIr.SQL.Add(  inttostr(cmbTipoOpIR.itemindex+1) +','+ QuotedStr(dbDataOpcaoIR.Text) +','+ 'NULL)');  // Andre Imakawa - SIG 47046 //TAES - SIG91757
            QryhstOpcaoIr.ExecSQL;
          end;
        end;
      end;

      QryHistoricoTipoIr.Close;
      QryHistoricoTipoIr.ParamByname('IDPESSOA').asString    := Qry.FieldByName('IDPESSOA').AsString;
      QryHistoricoTipoIr.ParamByname('IDPLANPREV').asString := qryPlanosPrev.FieldByName('IDPLANOPREV').AsString;
      QryHistoricoTipoIr.Open;

      grpHistIr.Visible := True;

      FreeAndNil(QryhstOpcaoIr);
    end
    //Renato Visoni SOL 125579
  end
  else if (pgctrlDetalhe.ActivePage = tbsTelefone) then     //edilaine - SIG33979 - inicio
  begin
    if (qryTelefone.State in [dsInsert, dsEdit]) then
    begin
      if (chkAssociaEnd.Checked) then
      begin
        if chkTipoTelefone.Checked[0] then
           sIdEndTel := qryIDENDCOMERCIAL.AsString;

        if sIdEndTel = '' then
           sIdEndTel := qryIDENDRESIDENCIAL.AsString;
        if sIdEndTel = '' then
           sIdEndTel := qryIDENDENTREGA.AsString;
        if sIdEndTel = '' then
           sIdEndTel := qryIDENDCOBRANCA.AsString;
        if sIdEndTel = '' then
           sIdEndTel := qryIDENDCORRESP.AsString;
        if (sIdEndTel = '') and (not chkTipoTelefone.Checked[0]) then
           sIdEndTel := qryIDENDCOMERCIAL.AsString;

        if (sIdEndTel = '') and (not qryEndereco.isEmpty) then
           sIdEndTel := qryEndereco.FieldByName('IDENDERECO').AsString;
      end
      else
        sIdEndTel := '';
        
      qryTelefoneIDENDERECO.AsString := sIdEndTel;
    end;
  end;   //edilaine - SIG33979 - fim

  inherited;
end;

procedure TfrmCadElegivel.CmeCadastroDelete(Sender: TObject);
begin
  qryElegPatro.First;
  while not qryElegPatro.Eof do qryElegPatro.Delete;

  qryHistFuncPrev.First;
  while not qryHistFuncPrev.Eof do qryHistFuncPrev.Delete;

  try
     if CmeCadastro.Operacao  = opApagar
     then AplicaAlteracoesInTransacao([qryElegPatro, qryHistFuncPrev])    //edilaine - SIG33979
  except
     raise;
  end;

  inherited;
end;


procedure TfrmCadElegivel.spbDependenteClick(Sender: TObject);
var
  sEstado : string;
begin
  //edilaine - SIG33979 - inicio
  if qry.State in [dsInsert, dsEdit] then
  begin
    sEstado := iif(qry.State = dsEdit, 'alteração', 'inclusão');

    if MsgDlg('Você está tentando acessar outro cadastro sem confirmar a '+sEstado+' dos dados.'+#13+#10+
              'Confirma o cancelamento da '+sEstado+'?', iif(qry.State = dsEdit, 'Alteração', 'Inclusão')+' não confirmada', mtConfirmation, [mbYes, mbNo, mbCancel],0) = mrYes then
    begin
      bbtnCancelarClick(bbtnCancelar);
    end
    else
      Exit;
  end;
  //edilaine - SIG33979 - fim

  try
    AbrirForm(frmCadDepenBenef,TfrmCadDepenBenef,true);
  Except
    ShowMessage('exceção ao abrir depen.')
  End;

  if MontaSelect.RetornouValor then
  begin
     frmCadDepenBenef.SelecionaDependente(qryElegPatro.FieldByName('IDPESSOA').AsString,
                                          qryElegPatro.FieldByName('IDPESSJUR').AsString,
                                          qryPlanosPrev.FieldByName('IDPLANOPREV').AsString
                                          );



    //Ádler Souza - SOL 134214 / Kintana 787470
    frmCadDepenBenef.sIdPessoa := qryElegPatro.FieldByName('IDPESSOA').AsString;
    frmCadDepenBenef.sIdPessJur := qryElegPatro.FieldByName('IDPESSJUR').AsString;
    frmCadDepenBenef.sIdPlanoPrev := qryPlanosPrev.FieldByName('IDPLANOPREV').AsString;
    frmCadDepenBenef.sIdtitular   := qryElegPatro.FieldByName('IDPESSOA').AsString;   //SOL 151398 Kintana 1107593

    // SOL 191898 KTN 1819232 Otacilio ** Inicio **
    frmCadDepenBenef.qryEndereco.Close;
    frmCadDepenBenef.qryEndereco.Prepare;
    frmCadDepenBenef.qryEndereco.ParamByName('IdPessoa').asinteger := qryElegPatro.FieldByName('IDPESSOA').asinteger;
    frmCadDepenBenef.qryEndereco.Open;

    frmCadDepenBenef.qryTelefone.Close;
    frmCadDepenBenef.qryTelefone.Prepare;
    frmCadDepenBenef.qryTelefone.ParamByName('IdPessoa').asinteger := qryElegPatro.FieldByName('IDPESSOA').asinteger;
    frmCadDepenBenef.qryTelefone.Open;

    frmCadDepenBenef.qryContato.Close;
    frmCadDepenBenef.qryContato.Prepare;
    frmCadDepenBenef.qryContato.ParamByName('IdPessoa').asinteger  :=  qryElegPatro.FieldByName('IDPESSOA').asinteger;
    frmCadDepenBenef.qryContato.Open;
    // SOL 191898 KTN 1819232 Otacilio ** Fim **

    //Fim - Ádler Souza - SOL 134214 / Kintana 787470


    frmCadDepenBenef.CmeCadastroAtualizaBotoes(Nil); //CPrev - 27883

    frmCadDepenBenef.sbtnProcurar.Enabled := False; // André Pontes - pendência 26673 - 26/10/2007
    //BRUNO AZEVEDO SOL 200675 KINTANA 1938917
    //frmCadDepenBenef.Pessoa.ChangePessoa(qryElegPatro.FieldByName('IDPESSOA').asinteger); // SOL 198389 KTN 1908659
    bChamou := True
  end;
end;


//Incio - William Santana - 209384/15928 KIN 2062832
{
procedure TfrmCadElegivel.cmbEstCivChange(Sender: TObject);
begin
  inherited;

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
end;
}
//Término - William Santana - 209384/15928 KIN 2062832

procedure TfrmCadElegivel.qryPessoaFisicaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  { SOL 158955 - KINTANA 1613780 - JRM6}
  if qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsString = '1' then
  begin
    wwDBCBIsentoIrrf.Enabled := true;
  end
  else
  begin
    wwDBCBIsentoIrrf.Enabled := false;
  end;

  if qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsString = '2' Then
  begin
    BitBtnHistorico.Enabled     := True;
    dbrgrpMolestiaGrave.Visible := True;
    //dbrgrpMolestiaGrave.Enabled := True;    //edilaine - SIG33979
  end
  else
  begin
    BitBtnHistorico.Enabled     := False;//higor
    dbrgrpMolestiaGrave.Visible := False;
    dbrgrpMolestiaGrave.Enabled := False;
  { SOL 158955 - KINTANA 1613780 - JRM6}
  end;
  //Início - William Santana - 209384/15928 KIN 2062832
  {
  if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = '' then
  begin
     cmbEstCiv.itemindex := -1;
     cmbEstCiv.text := '';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'S' then
  begin
     cmbEstCiv.itemindex := 0;
     cmbEstCiv.text := 'Solteiro(a)';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'C' then
  begin
     cmbEstCiv.itemindex := 1;
     cmbEstCiv.text := 'Casado(a) ou Equiparado(a)';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'D' then
  begin
     cmbEstCiv.itemindex := 2;
     cmbEstCiv.text := 'Divorciado(a)';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'E' then
  begin
     cmbEstCiv.itemindex := 3;
     cmbEstCiv.text := 'Desquitado(a)';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'J' then
  begin
     cmbEstCiv.itemindex := 4;
     cmbEstCiv.text :=  'Separado(a) Judicial';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'V' then
  begin
     cmbEstCiv.itemindex := 5;
     cmbEstCiv.text :=  'Viúvo(a)';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'M' then
  begin
     cmbEstCiv.itemindex := 6;
     cmbEstCiv.text := 'Marital';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'P' then
  begin
     cmbEstCiv.itemindex := 7;
     cmbEstCiv.text := 'Separado(a)';
  end
  else if qrypessoafisica.fieldbyname('ESTCIVIL').AsString = 'O' then
  begin
     cmbEstCiv.itemindex := 8;
     cmbEstCiv.text := 'Outros';
  end;

  sEstCiv := qrypessoafisica.fieldbyname('ESTCIVIL').AsString;
   }

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO FROM ESTADOCIVIL WHERE ESTCIVIL = '+quotedStr(qryPessoaFisica.fieldbyname('ESTCIVIL').AsString) );
  qryAux.Open;
  cmbEstCiv.text := qryAux.fieldbyname('DESCRICAO').AsString;
  //Término - William Santana - 209384/15928 KIN 2062832

  //AtualizaConsultaCidade( qrypessoafisica.FieldByName('IDESTADO').AsInteger );
  AtualizaConsultaCidade( 0 );


end;

procedure TfrmCadElegivel.qryOutrasInformsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryOutrasInforms.State in [dsinsert]
  then begin
     qryOutrasInforms.FieldByName('IDPARAM').AsInteger := qryParamPessoa.FieldByname('IDPARAM').AsInteger;
  end;

end;

procedure TfrmCadElegivel.dblkParamPessoaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 

  qryOutrasInforms.FieldByName('DESCRICAO').AsString := qryParamPessoa.FieldByName('DESCRICAO').AsString;

  if (qryParamPessoa.FieldByName('TIPO').AsString = 'F') or
     (qryParamPessoa.FieldByName('TIPO').AsString = 'V') Then
    edValida.Text := qryParamPessoa.FieldByName('VALIDACAO').AsString
  else
    edValida.Text := 'Não existe validação';
end;

function TfrmCadElegivel.AtualizaSitParticipante: Boolean;
begin
   Result := False;
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' UPDATE PARTPREVPLAN SET FLGDESATIVADO = 1' +
                   ' WHERE  IDPESSOA    =  ' + qryPlanosPrev.FieldByName('IDPESSOA').AsString+
                   ' AND    IDPLANOPREV <> ' + qryPlanosPrev.FieldByName('IDPLANOPREV').AsString); 

   try
      qryAux2.ExecSql;
   except
      Exit;
   end;
   Result := True;

end;


procedure TfrmCadElegivel.spBtnLoginClick(Sender: TObject);
begin
  
  inherited;
  
  
  Try
    frmCadWebAcesso := TfrmCadWebAcesso.create(nil);
    //Para trazer um usuário selecionado, troque a linha acima pelas abaixo
    frmCadWebAcesso.FormStyle := fsNormal;
    frmCadWebAcesso.Visible := false;
    frmCadWebAcesso.IdPessoa := qry.fieldByName('IDPESSOA').asInteger;
    frmCadWebAcesso.UsuarioSelecionado := True;
    frmCadWebAcesso.SelecionaPessoa;
    frmCadWebAcesso.ShowModal;
  Finally
    frmCadWebAcesso.free;
  End;
  
end;


procedure TfrmCadElegivel.sbtnAlterarClick(Sender: TObject);
var bClicouAlterar: Boolean;
begin
  bClicouAlterar := False; // Andre Imakawa - SIG 29725
  //SOL 123051 - Ádler Souza
  if  sbtnAlterar.Down then
    inherited
  else// Andre Imakawa - SIG 29725 - Inicio
  begin
    bClicouAlterar := True;
    sbtnAlterar.Down := True;
    // Andre Imakawa - SIG 29725 - Fim
  end;
  //FIM - SOL 123051 - Ádler Souza

  {Início - Darivaldo Alencar - SIG 21866   MSG020 e 021}
  if not(qryReprLegal.isEmpty) then
    begin
      if (qryReprLegal.fieldbyname('DATATERMINO').asDateTime < now) then
          Msgdlg('Documento do Representante legal vencido. Favor verificar para alteração!','Informação',mtInformation,[mbOk],0)
      else if (qryReprLegal.fieldbyname('NOMERESPONSAVEL').asString <> EmptyStr) then
          Msgdlg('Assistido possui representante legal. Favor observar o responsável pela solicitação.','Informação',mtInformation,[mbOk],0);
    end;
  {Término - Darivaldo Alencar - SIG 21866}

     //if NOT(dtmBaseDados.dbBaseDados.InTransaction) THEN
     //dtmBaseDados.dbBaseDados.starttransaction;

  //edilaine - SIG33979 - inicio
  {dtDataFimMolestiaAlterar     :=  CMDateTimePicker6.Date;
  dtDatainicioMolestiaAlterar   :=  dbdtMolestiaGrave.Date;

  sDatainicioMolestiaAlterar  := FormatDateTime('dd/mm/yyyy',dbdtMolestiaGrave.Date );   //Data Inicial
  sDataFimMolestiaAlterar    := FormatDateTime('dd/mm/yyyy',CMDateTimePicker6.Date );   //Data Final
  }//edilaine - SIG33979 - fim

  // SOL:121637 - Daniel Begnami
  if not bTtravarCadastro then
  begin
    if pos(qryElegPatro.FieldByName('MATRICULA').Asstring, lDadosFunc) = 0 then
    begin
  dblkGrauInstrucao.enabled  := True;
  cmbEstCiv.enabled   := True;
    end;
  end;
  // FIM

  if (wwDBCBIsentoIrrf.ItemIndex = -1) or (wwDBCBIsentoIrrf.Text ='') then
  begin
    BitBtnHistorico.Enabled     := False;
    dbrgrpMolestiaGrave.Visible := False;
    dbrgrpMolestiaGrave.Enabled := False;
  end;

  spBtnLogin.Enabled  := false;

  //BRUNO AZEVEDO SOL 244852 PPM 626115
  if not(bClicouAlterar) then // Andre Imakawa - SIG 29725
  VerificaPermissao();

  dbMemInfoAdicionais.readOnly:= not(sbtnAlterar.down); //Darivaldo Alencar SIG 27871
end;

procedure TfrmCadElegivel.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   dbchkSalarioProcessado.Checked   := False;
   dbchksolicitacontasalario.Checked := False;
  // SOL:121637 - Daniel Begnami
  dblkGrauInstrucao.enabled  := True;
  cmbEstCiv.enabled   := True;
  // FIM

  spBtnLogin.Enabled := false;

 //CPrev - 27955 - Inicio
 edtEstado.Clear;
 edtNaturalidade.Clear;
 edtNacionalidade.Clear;
 EdtEmailParticular.Clear; // Jonas - SOL 178016 KINTANA 1698357

 edtEstado.TAG        := 0; // SOL 219782 KINTANA 2054136
 edtNaturalidade.TAG  := 0;
 edtNacionalidade.TAG := 0; // SOL 219782 KINTANA 2054136
 //CPrev - 27955 - Fim

 SelReprLegal;  //William Santana - SOL 161550 KIN 1717512

   //edilaine - SIG33979 - inicio
   dbedDocumento.enabled      := true;
   dbedNomeFantasia.enabled   := true;
   dbedemail.enabled          := true;
   EdtEmailParticular.enabled := true;
   DbeHomePage_Padrao.enabled := true;
   //edilaine - SIG33979 - fim

end;

procedure TfrmCadElegivel.bbtnCancelarClick(Sender: TObject);
begin
  //SOL 148691 KINTANA 1050517
  bbtnCancelarDet.click;//Darivaldo Alencar SIG 27871

  //edilaine - SIG33979 - inicio
  {if (QryHistoricoTipoIr.Active) and Not(bSair) then begin
     if (dtmBaseDados.dbBaseDados.InTransaction) then
        dtmBaseDados.dbBaseDados.RollBack; //Fanuel Junior SOL158625 KINTANA1293015
  end;
  }//edilaine - SIG33979 - fim
  //SOL 148691 KINTANA 1050517

  inherited;

  // SOL:121637 - Daniel Begnami
  dblkGrauInstrucao.enabled  := False;
  cmbEstCiv.enabled   := False;
  // FIM

  spBtnLogin.Enabled := (StrToIntDef(qry.fieldByName('IDPESSOA').asString, -1) <> -1);

  //edilaine - SIG33979 - inicio
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  //edilaine - SIG33979 - fim

  //SOL 122621 - Ádler Souza
  try
    if qry.Active then begin
      PessoaChangePessoa(qry.fieldByName('IDPESSOA').asInteger);
    end;
  except
  end;
  //Fim - SOL 122621 - Ádler Souza

  //Início - William Santana - SOL 161550 KIN 1717512
  SelReprLegal;
  pnlReprLegal.visible := false ;
  pnlGrdReprLegal.visible := True ;
  pnlReprLegal.Repaint;
  pnlGrdReprLegal.Repaint;
  //Término - William Santana - SOL 161550 KIN 1717512
  dbMemInfoAdicionais.readOnly:= not(sbtnAlterar.down);bGridPadrao:= true;  //Darivaldo Alencar SIG 27871
end;

procedure TfrmCadElegivel.lstDocumentosClick(Sender: TObject);
begin
  inherited;

  if edDocNumDocumento.CanFocus then edDocNumDocumento.SetFocus;

end;

procedure TfrmCadElegivel.edDocNumDocumentoExit(Sender: TObject);
begin
  If (DBText1.Field.AsString = 'CPF') And
     (qry.State in [dsInsert, dsEdit]) Then
  Begin
     bCpf2 := False; //Sol 122621 - Ádler Souza
     if Pessoa.DocumValido(edDocNumDocumento.Text) then
     begin

       //edilaine - SIG33979 - inicio
       {if (Trim(dbedDocumento.Text) <> '') then
       begin
         //Sol 86810 - Ádler Souza
         if VerificaDocExcecao(edDocNumDocumento.Text) then
         begin
           //edilaine - SIG33979 - inicio
           //MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
           MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
           //edilaine - SIG33979 - fim

           //Sol 122928 - Ádler Souza
           if edDocNumDocumento.CanFocus then
             edDocNumDocumento.SetFocus;
           //Fim - Sol 122928 - Ádler Souza
           exit;
         end;
         //Fim - Sol 86810 - Ádler Souza
       end;}

       if (not ValidarCpf(edDocNumDocumento.text)) then
       begin
         if bbtnCancelar.focused then
            edDocNumDocumento.text := ''
         else
         begin
           MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
           edDocNumDocumento.SetFocus;
           exit;
         end;
       end;

       if not bbtnCancelar.focused then
       begin
         if not VerificaCPF(edDocNumDocumento.Text) then
            Exit;
       end;
       //edilaine - SIG33979 - fim

       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT NUMDOCUMENTO ');
       qryAux.SQL.Add('FROM PESSOA');
       qryAux.SQL.Add('WHERE (IDPESSOA = '+qryDocumento.FieldByName('IDPESSOA').AsString+')');
       qryAux.SQL.Add('  AND (TRIM(NUMDOCUMENTO) <> '''' )');
       qryAux.Open;

     //      If (Not qryAux.IsEmpty) And
       if (qryAux.FieldByName('NUMDOCUMENTO').AsString <> edDocNumDocumento.Text) Then
       Begin
         dbedDocumento.Text := edDocNumDocumento.Text;
         qry.FieldByName('NUMDOCUMENTO').AsString := edDocNumDocumento.Text;
       End;
     end
     else if not bbtnCancelar.focused then      //edilaine - SIG33979
     begin
       //edilaine - SIG33979 - inicio
       //MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
       MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
       edDocNumDocumento.SetFocus;
       //edilaine - SIG33979 - fim
       exit;
     end;
  End;

  try
  inherited;
  except
  end;
end;

procedure TfrmCadElegivel.GuardaDatasdeInscricao;
Var
  iRegAtual : Integer;
begin
    QryPlanosPrev.First;
    SetLength(aPlanoDatas,1); aPlanoDatas[0] := '';

    While Not QryPlanosPrev.Eof Do Begin
      iRegAtual := (Length(aPlanoDatas)-1);
      aPlanoDatas[iRegAtual] := QryPlanosPrev.FieldByName('INSCRICAODATA').AsString;

      SetLength(aPlanoDatas, (Length(aPlanoDatas)+1));
      QryPlanosPrev.Next
    End;
    QryPlanosPrev.First;
end;

function TfrmCadElegivel.BuscaDataInicioInsc(sIdPessoa: String): String;
Var
  sSQL : String;
begin
  Result := '';
  sSQL := 'SELECT MIN(DTINICIOINSC) AS DTINICIOINSC FROM PARTPREVPLAN WHERE IDPESSOA = '+sIdPessoa;
  If FazQuery(QryAux, sSQL) Then
    Result := QryAux.FieldByName('DTINICIOINSC').AsString;
end;

procedure TfrmCadElegivel.dbedDocumentoEnter(Sender: TObject);
begin
  inherited;

  bCpf1 := True; //Sol 122621 / Kintana 604231 - Ádler Souza
  If (qry.State in [dsInsert, dsEdit]) And
     (Trim(dbedDocumento.Text) = '')
   Then Begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT DP.NUMDOCUMENTO');
    qryAux.SQL.Add('FROM TIPODOCPESSOA TD, DOCPESSOA DP');
    qryAux.SQL.Add('WHERE (TD.NOMEDOCUMENTO = ''CPF'') ');
    qryAux.SQL.Add('  AND (TD.IDDOCUMENTO   = DP.IDDOCUMENTO)');
    qryAux.SQL.Add('  AND (DP.IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString+')');

    qryAux.Open;

    If (Not qryAux.IsEmpty)
     Then qry.FieldByName('NUMDOCUMENTO').AsString := qryAux.FieldByName('NUMDOCUMENTO').AsString;
   End;
  
end;

//procedure TfrmCadElegivel.dblkpcmbNaturalidadeExit(Sender: TObject);
//Var
//  sEscolha : String;
//begin
//  inherited;
//
//  sEscolha := dblkpcmbNaturalidade.LookupValue;
//  If ( Trim( sEscolha ) = '' ) Then sEscolha := '0';
//
//  AtualizaConsultaCidade( StrToInt( sEscolha ) );
//
//end;

{ Filtrar cidades pelo estado selecionado, caso exista }
procedure TfrmCadElegivel.AtualizaConsultaCidade( piIdEstado : Integer );
begin

  qryCidade.Close();

  If ( piIdEstado > 0 )
  Then qryCidade.ParamByName('IDESTADO').AsInteger := piIdEstado
  Else qryCidade.ParamByName('IDESTADO').Clear;

  qryCidade.Open();
End;



function TfrmCadElegivel.VerificaPreferencial: Boolean;
var
  bAchou  : Boolean;
begin
  // André Pontes - pendência 26946 - 11/12/2007

  // Criada nova função para varrer contas bancárias e verificar se há mais de uma preferencial

  Result  := False;
  bAchou  := False;

  qryContaBancaria.Cancel;
  qryContaBancaria.First;
  while not(qryContaBancaria.EOF) do
  begin
    if qryContaBancaria.FieldByName('FLGCONTAPREF').AsInteger = 1 then
    begin
      if bAchou then
        Exit
      else
        bAchou := True;
    end;

    qryContaBancaria.Next;
  end;

  Result  := True;
end;

//CPrev - 27955 - Inicio
procedure TfrmCadElegivel.BitBtn1Click(Sender: TObject);
begin
  inherited;

  If Not (qryPessoaFisica.State in ([dsEdit, dsInsert])) Then Exit;

  MontaSelectEndereco.Executar;

  if not MontaSelectEndereco.RetornouValor then exit;

  edtEstado.text        := MontaSelectEndereco.ValoresChave[3];
  edtNaturalidade.text  := MontaSelectEndereco.ValoresChave[4];
  edtNacionalidade.text := MontaSelectEndereco.ValoresChave[5];

  edtEstado.Tag         := StrToInt(MontaSelectEndereco.ValoresChave[0]); // SOL 219782 KINTANA 2054136
  edtNaturalidade.Tag   := StrToInt(MontaSelectEndereco.ValoresChave[2]);
  edtNacionalidade.Tag  := StrToInt(MontaSelectEndereco.ValoresChave[1]); // SOL 219782 KINTANA 2054136

end;
//CPrev - 27955 - Fim

//Sol 122621 - Ádler Souza
function TfrmCadElegivel.VerificaCPF : boolean;     //edilaine - SIG33979

var tempItem : TListItem;
begin
 result := true;
 if (dbedDocumento.modified) and (dbedDocumento.text <> '') then
     begin
          if Pessoa.DocumValido(dbedDocumento.text) then
          begin
               if FazQuery( qryEscolhePessoa,
                          'SELECT PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL ,'+
                          'PESSOA.NUMDOCUMENTO FROM PESSOA WHERE (PESSOA.IDPESSOA <> '+qryIDPESSOA.AsString+
                          ') and (PESSOA.NUMDOCUMENTO = '''+dbedDocumento.text+''') ') then
               begin
                    Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

                    MsgDlg('Este '+lblDocumento.Caption+' já existe no cadastro', Caption, mtWarning , [mbOk], 0);
                    frmEscolhePessoa.sNomeCodigo := lblDocumento.Caption;
                    frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;
                    if frmEscolhePessoa.ShowModal = mrOK then
                    begin
                         bbtnCancelarClick(Self);
                         Pessoa.ChangePessoa( qryEscolhePessoaIDPESSOA.AsInteger);
                         sbtnAlterarClick(Self);
                    end
                    else
                    begin
                         if not(Sistema.DuplicaDocPessoa) then
                         begin
                           MsgDlg('Não é permitido a duplicidade de número de documento no cadastro de Pessoa.', Caption, mtWarning , [mbOk], 0);
                           Result := False;
                         end;
                    end;
               end;
               //Atualiza a tabela de Documentos
               if CmeCadastro.Operacao in [opInserir,opAlterar] then
               with qryDocumento do
               begin
                    tempItem := lstDocumentos.Selected;
                    lstDocumentos.Selected := lstDocumentos.FindData(0, TObject(Pessoa.IdDocChave), true,false);
                    Edit;
                    FieldByname('NUMDOCUMENTO').AsString := dbedDocumento.text;
                    edDocNumDocumentoExit(Self);
                    lstDocumentos.Selected := tempItem;
               end;
          end
          else
          begin
               if CmeCadastro.Operacao in [opInserir,opAlterar] then
               begin
                    //edilaine - SIG33979 - inicio
                    //MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
                    MsgDlg(MSG022, Caption, mtError , [mbOk,mbHelp], 0);
                    //edilaine - SIG33979 - fim
                    qryNUMDOCUMENTO.clear ;
                    if dbedDocumento.CanFocus then dbedDocumento.setfocus;
                    Result := false;
               end;
          end;
     end;
end;
//Fim - Sol 122621 - Ádler Souza

procedure TfrmCadElegivel.edDocNumDocumentoEnter(Sender: TObject);
begin
  inherited;
//Sol 122621 - Ádler Souza
  If (DBText1.Field.AsString = 'CPF') then begin
    bCpf2 := True;
  end;
//Fim - Sol 122621 - Ádler Souza
end;

//Sol 122621 - Ádler Souza
function TfrmCadElegivel.VerificaExistencia: Boolean;
begin
  Result := True;
  if FazQuery( qryEscolhePessoa,
            'SELECT PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL ,'+
            'PESSOA.NUMDOCUMENTO FROM PESSOA WHERE (PESSOA.IDPESSOA <> '+qryIDPESSOA.AsString+
            ') and (PESSOA.NUMDOCUMENTO = '''+edDocNumDocumento.text+''') ') then
  begin
      Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

      MsgDlg('Este '+lblDocumento.Caption+' já existe no cadastro', Caption, mtWarning , [mbOk], 0);
      frmEscolhePessoa.sNomeCodigo := lblDocumento.Caption;
      frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;
      if frmEscolhePessoa.ShowModal = mrOK then
      begin
           bbtnCancelarClick(Self);
           Pessoa.ChangePessoa( qryEscolhePessoaIDPESSOA.AsInteger);
           sbtnAlterarClick(Self);
      end
      else
      begin
           if not(Sistema.DuplicaDocPessoa) then
           begin
             MsgDlg('Não é permitido a duplicidade de número de documento no cadastro de Pessoa.', Caption, mtWarning , [mbOk], 0);
             Result := False;
           end;
      end;
  end;
end;
//Fim - Sol 122621 - Ádler Souza
procedure TfrmCadElegivel.sbtnProcurarClick(Sender: TObject);
begin
  // SOL:121637 - Daniel Begnami
  dblkGrauInstrucao.enabled  := False;
  cmbEstCiv.enabled   := False;
  // FIM
  inherited;
  //SOL 148691 KINTANA 1050517
  sdataOpIr := '';
  //SOL 148691 KINTANA 1050517

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

  // SOL 193932 KTN 1848761 Otacilio ** Inicio **
  //Jonas - SOL 178016 KINTANA 1698357 - INICIO
  if MontaSelect.RetornouValor then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' select EMAILFUNCEF from cm.PESSOAFISICA where IDPESSOA = '+OraNumero(MontaSelect.ValoresChave[0]) );
    qryAux.Open;
    EdtEmailParticular.TEXT := qryAux.FieldByName('EMAILFUNCEF').AsString;

   BuscaOBSR; //Darivaldo Alencar -SIG 27871
    //Jonas - SOL 178016 KINTANA 1698357  -FIM
  end;
  // SOL 193932 KTN 1848761 Otacilio ** Fim **
end;

procedure TfrmCadElegivel.bbtnSairClick(Sender: TObject);
begin
  try
    bSair := true;
    inherited;
  except
  end;
end;

procedure TfrmCadElegivel.ValidaCampoNumerico(var Key: char);
begin
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['0'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;

procedure TfrmCadElegivel.DBEDDDDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumericoDDD(key);
end;

procedure TfrmCadElegivel.DBEDNUMEROKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ValidaCampoNumerico(key);
end;


procedure TfrmCadElegivel.ValidaCampoNumericoDDD(var Key: char);
begin
  if key<>'' then
   begin
      if not (Key = #8 ) then
       begin
        If Not (Key In ['1'..'9'] )  Then
          KEY := #0;
       end;
   end;

end;

procedure TfrmCadElegivel.qryTelefoneAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if qryTelefoneDDI.Value = '' then
    qryTelefoneDDI.Value := '55';  //Ádler Souza - SOL 140690 KINTANA 883179

end;

procedure TfrmCadElegivel.qryContaBancariaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  //Renato Visoni SOL 135283 Kintana 803604
  QryContaResgate.Close;
  QryContaResgate.Open;

  qryContaBancaria.First;
  while not qryContaBancaria.eof do begin
    if qryContaBancaria.FieldByname('FLGCONTARESGATE').asInteger = 1 then begin
      QryContaResgate.Append;
      QryContaResgate.fieldByname('IDROWID').asString := qryContaBancaria.FieldByname('ROWID').asString;
      QryContaResgate.Post;
    end;
    qryContaBancaria.Next;
  end;

  QryContaResgate.First;
  while not QryContaResgate.eof do begin
    if trim(QryContaResgate.FieldByName('IDROWID').asString) = '' then begin
      QryContaResgate.Delete;
    end else begin
      QryContaResgate.Next;
    end;
  end;
  //Renato Visoni SOL 135283 Kintana 803604
  
end;

procedure TfrmCadElegivel.BitBtnHistoricoClick(Sender: TObject);
var
  idPessoaEleg : integer;
begin
  inherited;
  idPessoaEleg := qryElegPatro.FieldByName('IdPessoa').asInteger;
  //edilaine - SIG33979 - inicio
  {frmHistMolestiaGrave  := TfrmHistMolestiaGrave.Create(Self,idPessoaEleg,dbdtMolestiaGrave.Date,CMDateTimePicker6.Date); //Fanuel Junior SOL 148773 KINTANA 1063150
  try
    //Fanuel Junior SOL 148773 KINTANA 1063150
    frmHistMolestiaGrave.ShowModal;
    qryPessoaFisica.Close;
    qryPessoaFisica.ParamByName('IdPessoa').AsInteger := qryElegPatro.FieldByName('IdPessoa').asInteger;
    qryPessoaFisica.Open;
    qryPessoaFisica.Edit;

    //Fanuel Junior SOL 148773 KINTANA 1063150
  finally
    FreeAndNil(frmHistMolestiaGrave);
  end; }

  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.StartTransaction;

  frmHistMolestiaGrave := TfrmHistMolestiaGrave.Create(Self,idPessoaEleg,sbtnAlterar.Down); //Taffarel - SIG63063
  try
    frmHistMolestiaGrave.ShowModal;
    PreencheDataMolestiaGrave;
  finally
    FreeAndNil(frmHistMolestiaGrave);
  end;
  //edilaine - SIG33979 - fim

end;

procedure TfrmCadElegivel.HabilitarCampos;
begin
   grpFiliacao.Enabled:= True;
   dblkGrauInstrucao.Enabled:= True;
   cmbEstCiv.Enabled:= True;
   GroupBox3.Enabled:= True;
   grpDependentes.Enabled:= True;
   grpNaturalidade.Enabled:= True;
   grpDataNasc.Enabled:= True;
   dbrgrpSexo.Enabled:= True;
   dbrgrpIsentoIR.Enabled:= True;
   //dbrgrpFlgMolestiaGrave.Enabled:= True;
   spbDependente.Enabled:= True;
   DbChbSomaIR.Enabled:= True;
   dbedMatricula.Enabled:= True;
   dbdtAdesao.Enabled:= True;
   dblkpcmbSitPatro.Enabled:= True;
   dbedSalario.Enabled:= True;
   dblkpcmbCargo.Enabled:= True;
   BitBtn1.Enabled:= True;
   if bTtravarCadastro then
     PintarCampos([grpFiliacao, dblkGrauInstrucao, cmbEstCiv,
                   GroupBox3, grpDependentes, grpNaturalidade, grpDataNasc,
                   dbrgrpSexo, dbrgrpIsentoIR, {dbrgrpFlgMolestiaGrave,}
                   spbDependente, DbChbSomaIR, BitBtn1,
                   dbedMatricula, dbdtAdesao, dblkpcmbSitPatro,
                   dbedSalario, dblkpcmbCargo, GroupBoxBanco, rgrpTipoConta], clWindow);

   bTtravarCadastro:= False;
end;

procedure TfrmCadElegivel.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmCadElegivel.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

function TfrmCadElegivel.TravaAlteracao(idPessoa: Integer): boolean;
begin
  Result:= False;
  if Sistema.IdModulo <> 21 then
    if PossuiVinculo(idPessoa) then
      Result:= True;
end;

function TfrmCadElegivel.PossuiVinculo(sIDPessoa: Integer): Boolean;
begin
  result := false;
  qQueryAux.Close;
  qQueryAux.ParamByName('IDPESSOA').AsInteger:= sIDPessoa;
  qQueryAux.Open;

  if not qQueryAux.IsEmpty then
    result := true;
end;

procedure TfrmCadElegivel.PintarCampos(lEdit: array of TComponent;
  Color: TColor);
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

    if TObject(lEdit[x]).ClassType = TDBRealEdit then
      TDBRealEdit(lEdit[x]).Color:= Color;
  end;
end;

procedure TfrmCadElegivel.BitBtn2Click(Sender: TObject);
begin
  //edilaine - SIG33979 - inicio
  if not(ValidaEMail(dbedEmailContato.Text))then
  begin
    MsgDlg(MSG028,'Atenção',mtInformation,[mbOK],0);
    dbedEmailContato.setfocus;
    exit;
  end;
  //edilaine - SIG33979 - fim

  inherited;
     if qryContato.State in [dsInsert] then begin
      qryContato.FieldByName('IdContato').AsFloat  :=  LeUltRegistro(nil,'CONTATOPESS');
      qryContato.FieldByName('IdEndereco').AsFloat := qryEnderecoIDENDERECO.AsFloat;
      qryRamal.Insert;
      qryRamal.FieldByName('IdTelContato').AsInteger  := LeUltRegistro(nil, 'TELCONTATO');    //nao precisa setar
      qryRamal.FieldByName('IdTelefone').AsFloat      := qryTelefoneIDTELEFONE.AsFloat;       //nao precisa setar
      qryRamal.FieldByName('IdContato').AsInteger     := qryContato.FieldByName('IdContato').AsInteger;
      qryRamal.Post;
      qryContato.Post;
      qryContato.ApplyUpdates;
      qryRamal.ApplyUpdates;
      qryContato.Insert;
      AtualizaGridContatos();

   end else
   if qryContato.State in [dsEdit] then begin
      qryContato.Post;


      qryContato.ApplyUpdates;
      dbgTelefoneRamal.Visible := true;
      Panel8.Visible           := false;
      GroupBox5.Height := 168;
      ToolbarButtonAlteraContato.Down := false;
      ToolbarButtonInsereContato.Down := false;
      ToolbarButtonAlteraContato.Enabled := true;
      ToolbarButtonInsereContato.Enabled := true;
      ToolbarButtonExcluiContato.Enabled := true;
      AtualizaGridContatos();
  end;
end;





procedure TfrmCadElegivel.BitBtn3Click(Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := true;
  GroupBox5.Height := 168;
  Panel8.Visible           := false;
  ToolbarButtonAlteraContato.Down := false;
  ToolbarButtonInsereContato.Down := false;
  ToolbarButtonAlteraContato.Enabled := true;
  ToolbarButtonInsereContato.Enabled := true;
  ToolbarButtonExcluiContato.Enabled := true;
  qryContato.Cancel;
end;

procedure TfrmCadElegivel.BitBtn4Click(Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := true;
  Panel8.Visible           := false;
  GroupBox5.Height := 168;
  ToolbarButtonAlteraContato.Down := false;
  ToolbarButtonInsereContato.Down := false;
  ToolbarButtonAlteraContato.Enabled := true;
  ToolbarButtonInsereContato.Enabled := true;
  ToolbarButtonExcluiContato.Enabled := true;
  qryContato.Cancel;
end;

procedure TfrmCadElegivel.ToolbarButtonInsereContatoClick(Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := false;
  Panel8.Visible           := true;
  qryContato.Insert;
  ToolbarButtonAlteraContato.Enabled := false;
  ToolbarButtonInsereContato.Down   := true;
  ToolbarButtonExcluiContato.Enabled := false;
  GroupBox5.Height := 323;
end;

procedure TfrmCadElegivel.ToolbarButtonAlteraContatoClick(Sender: TObject);
begin
  inherited;
  dbgTelefoneRamal.Visible := false;
  GroupBox5.Height := 323;
  Panel8.Visible   := true;
  qryContato.Locate('IDCONTATO', qryContatoTel.FieldByName('IdContato').AsInteger,[]);
  qryContato.Edit;
  ToolbarButtonAlteraContato.Down := True;
  ToolbarButtonInsereContato.Enabled := false;
  ToolbarButtonExcluiContato.Enabled := false;
end;


procedure TfrmCadElegivel.AtualizaGridContatos();
begin
    qryContatoTel.Close;
    qryContatoTel.Prepare;
    qryContatoTel.ParamByName('IdTelefone').AsFloat  := qryTelefone.FieldByName('IdTelefone').AsFloat;
    qryContatoTel.ParamByName('IdPessoa').AsInteger  := qryElegPatro.FieldByName('IDPESSOA').AsInteger;
    qryContatoTel.Open;
    qryContatoTel.Last;
    qryContatoTel.First;

    if (qryContatoTel.recordcount > 0 ) and (not(qryContato.State = dsInsert))then begin
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

procedure TfrmCadElegivel.ToolbarButtonExcluiContatoClick(Sender: TObject);
begin
  qryRamal.Close;
  qryRamal.ParamByName('IdPessoa').AsInteger  := qryElegPatro.FieldByName('IDPESSOA').AsInteger;
  qryRamal.ParamByName('IdContato').AsInteger := qryContatoTel.FieldByName('IdContato').AsInteger;
  qryRamal.Open;
  qryRamal.Delete;
  qryContato.Locate('IDCONTATO',qryContatoTel.FieldByName('IdContato').AsInteger,[]);
  qryContato.Delete;
  qryRamal.ApplyUpdates;
  qryContato.ApplyUpdates;
  AtualizaGridContatos();
end;
procedure TfrmCadElegivel.spbtHistipoIrAlterarClick(Sender: TObject);
begin
  spbtHistipoIrExcluir.Enabled := false;
  //edilaine - SIG33979 - inicio
  {if not(dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao)
  then dtmBasedados.dbBaseDados.StartTransaction;
  }//edilaine - SIG33979 - fim
  bAteraTipoIr := true;
//  QryHistoricoTipoIr.fieldByname('DTINICIO').EditMask := '!99/99/0000;1;_';
//  QryHistoricoTipoIr.fieldByname('DTFIM').EditMask    := '!99/99/0000;1;_';
  QryHistoricoTipoIr.edit;
end;

procedure TfrmCadElegivel.SpeedButton3Click(Sender: TObject);
begin
  spbtHistipoIrAlterar.Enabled := false;
  bExcluiTipoIr  := true;

  if not(dtmBaseDados.dbBaseDados.InTransaction) and (bControleTransacao)
  then dtmBasedados.dbBaseDados.StartTransaction;

  if MessageDlg('Deseja excluir o registro selecionado', mtConfirmation, [mbYes,mbNo], 0) = mryes then
  begin
     QryhstOpcaoIr.Close;
     QryhstOpcaoIr.SQL.Clear;
     QryhstOpcaoIr.SQL.Add(' DELETE  FROM HISTOPIR ' );
     QryhstOpcaoIr.SQL.Add(' WHERE IDHISTOPIR  =  '+ QryHistoricoTipoIr.fieldByname('IDHISTOPIR').AsString);
     QryhstOpcaoIr.ExecSQL;

     QryHistoricoTipoIr.Close;
     QryHistoricoTipoIr.ParamByname('IDPESSOA').asString    := Qry.FieldByName('IDPESSOA').AsString;
     QryHistoricoTipoIr.ParamByname('IDPLANPREV').asString  := qryPlanosPrev.FieldByName('IDPLANOPREV').AsString;
     QryHistoricoTipoIr.Open;
  end;
end;

//WILLIAM MOREIRA DA SILVA SOL 165677
function TfrmCadElegivel.DataUltimaAlteracao(IdPessoa : Integer): boolean;
var Ssql : String;
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
                        ' AND ll.idpessoa = '+ IntToStr(IdPessoa) +' '+
                        //edilaine SIG119407 : inicio
                        ' and substr(to_char(ll.trguseralteracao),1,2) = ''CM'' )';
                        //' and substr(to_char(ll.trguseralteracao),1,3) <> ''DML'' '+
                        //' and substr(to_char(ll.trguseralteracao),1,3) <> ''ETL'' ) ' ;   // SOL 189470 KINTANA 1787378) ' ; // SOL 189470 KINTANA 1787378 // SOL 191050 KINTANA 1808397 //SOL 192984 KINTANA  1839654 Fernando Xavier
                        //edilaine SIG119407 : fim


     with qryAux do
     begin
          Close;
          SQL.Clear;
          SQL.add(Ssql);
          Open;
          if not isEmpty Then
          begin
               if MsgDlg('O técnico '+FieldByName('NomeUsuario').AsString+', realizou alterações no cadastro dessa pessoa nas últimas 24 horas, deseja continuar?','Confirmação',
               mtConfirmation,[mbYes,mbNo],0) = mrNo
               then begin
                    Result := False;
               End
               else begin
                    qryAux.Close;
                    qryAux.SQL.Clear;
                    qryAux.SQL.Add('UPDATE elegpatro');
                    qryAux.SQL.Add('SET idpessoa =' +IntToStr(IdPessoa));
                    qryAux.SQL.Add('WHERE idpessoa = ' +IntToStr(IdPessoa));
                 Try
                    qryAux.ExecSql;
                 Except
                    frmAguarde.Apaga;
                    MsgDlg('Erro ao tentar atualizar o cadastro de Elegível e Participanete.','Erro',mtError,[mbOk,mbHelp],0);
                 End;
             End;
          End
          else begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('UPDATE elegpatro');
               qryAux.SQL.Add('SET idpessoa =' +IntToStr(IdPessoa));
               qryAux.SQL.Add('WHERE idpessoa = ' +IntToStr(IdPessoa));
               Try
                  qryAux.ExecSql;
               Except
                     frmAguarde.Apaga;
                     MsgDlg('Erro ao tentar atualizar o cadastro de Elegível e Participanete.','Erro',mtError,[mbOk,mbHelp],0);
               End;
          End;
     End;
end;
//WILLIAM MOREIRA DA SILVA SOL 165677

//monica
procedure TfrmCadElegivel.dbchksolicitacontasalarioClick(Sender: TObject);
begin
  inherited;
  if  qryPessoaFisica.State in [dsedit, dsinsert] then
  begin
      if dbchksolicitacontasalario.Checked   then
      begin
         dtsolicitacontasalario.Enabled := true
      end
      else
      begin
         qryPessoaFisica.FieldByName('DTSOLICITACONTASALARIO').Value := null;
         dtsolicitacontasalario.Enabled := false;
      end;
  end;

end;

//Monica
procedure TfrmCadElegivel.dbchkSalarioProcessadoClick(Sender: TObject);
begin
  inherited;
  if  qryPessoaFisica.State in [dsedit, dsinsert] then
  begin
      if dbchkSalarioProcessado.Checked  then
      begin
         dtcontasalarioprocessada.Enabled := true;
      end
      else
      begin
         qryPessoaFisica.FieldByName('DTCONTASALARIOPROCESSADA').Value:= null;
         dtcontasalarioprocessada.Enabled := false;
      end;
  end;
end;
//---------SOL 184811---------- INICIO
procedure TfrmCadElegivel.BuscarClick(Sender: TObject);
begin
  inherited;

 // AbrirForm(frmImportMatriculaElegivel,TfrmImportMatriculaElegivel, True);
  AbrirForm(frmParamPessoaLote,TfrmParamPessoaLote,False);

  if OpenDialog1.Execute then
  begin
    arq := opendialog1.FileName;
    EdtImportarArquivo.Text := arq;
  end;
end;
//---------SOL 184811---------FIM

// TADEU PASSOS SOL 164168/11242 KINTANA 1793508
procedure TfrmCadElegivel.btnBuscarEnderecoClick(Sender: TObject);
begin
   inherited;
   try
      AbrirForm(frmConsEnderCadElegivel,TfrmConsEnderCadElegivel,False);
      frmConsEnderCadElegivel.SetCadDepenBenef(False);
      frmConsEnderCadElegivel.ShowModal;
   finally
   end;
end;
// TADEU PASSOS SOL 164168/11242 KINTANA 1793508

procedure TfrmCadElegivel.cmbCidadeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //qryCidade.Locate('NOMECIDADE',cmbCidade.Text,[loCaseInsensitive, loPartialKey]); SIG.21016 - Darivaldo Alencar
  dbedEstado.Field.AsString   := qryCidade.FieldByName('NOMEESTADO').AsString;

  qryEnderecoIDCIDADES.asinteger := qryCidade.FieldByName('IDCIDADES').asinteger; //William Santana SOL 164168/11242 KINTANA 1793508

  //BRUNO AZEVEDO SOL 131555 KINTANA 751980
  dbeCodEstado.Field.AsString := qryCidade.FieldByName('CODESTADO').AsString;
  if (qryCidade.FieldByName('IDPAIS').AsFloat > 0) then begin
     qryEnderecoIDPAIS.AsFloat   := qryCidade.FieldByName('IDPAIS').AsFloat;
  end;
  //BRUNO AZEVEDO SOL 131555 KINTANA 751980
end;


// TADEU PASSOS SOL 164168/11242 KINTANA 1793508
procedure TfrmCadElegivel.HabilitaCamposEndereco(Estado : Boolean);
begin
  dbedLogradouro.Enabled   := Estado;
  dbedBairro.Enabled       := Estado;
  dbedCEP.Enabled          := Estado;
  cmbCidade.Enabled        := Estado;
  dbedEstado.Enabled       := Estado;
  dbeCodEstado.Enabled     := Estado;
  dbedPais.Enabled         := Estado;



  DBNUMERO.Enabled        := Estado;
  //Cássio Rovaroto - SIG nº 134293 - Início
  //dbedNomeEndereco.Enabled := Estado;
  if Sistema.IdModulo = 452 then
  begin
    dbedNomeEndereco.Enabled := False;
    //Cássio Rovaroto - SIG nº 136187 - Início
    if bTtravarCadastro then
      btnBuscarEndereco.Enabled := False
    else
      btnBuscarEndereco.Enabled := True;
    //Cássio Rovaroto - SIG nº 136187 - Fim
  end
  else
  begin
    dbedNomeEndereco.Enabled := Estado;

  end;
  //Cássio Rovaroto - SIG nº 134293 - Fim

  dbedComplemento.Enabled   := Estado;
  GroupBox1.Enabled        := Estado;
  grpTipoEnd.Enabled        := Estado;
end;
// TADEU PASSOS SOL 164168/11242 KINTANA 1793508
{ SOL 158955 - KINTANA 1613780 - JRM6}
procedure TfrmCadElegivel.wwDBCBIsentoIrrfChange(Sender: TObject);
begin
  // Se não for selecionado nenhum tipo de isenção, desliga o flag de Isenção de IRRF.
  {
  if (dsPessoaFisica.state IN [dsEdit, dsInsert]) then
  begin
    if wwDBCBIsentoIrrf.ItemIndex = -1  then
    begin
      If qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
      begin
        dbrgrpIsentoIR.ItemIndex := 1;
        qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 0;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;//higor
        dbrgrpMolestiaGrave.Enabled := False;
      end;
    end
    else
    begin
      // Se for selecionado algum tipo de isenção, aciona o flag de Isenção de IRRF.
      if (wwDBCBIsentoIrrf.ItemIndex >= 0 ) and (wwDBCBIsentoIrrf.ItemIndex < 2) then
      begin
        dbrgrpIsentoIR.Value                                      := '1';
        //qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 1;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;  //higor
        dbrgrpMolestiaGrave.Enabled := False;
      end;
      // Testa se foi selecionado "molestia grave"
      if wwDBCBIsentoIrrf.ItemIndex = 2 then
      begin
        //qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 1;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 1;
        BitBtnHistorico.Enabled     := true;
        dbrgrpMolestiaGrave.Visible := true;
        dbrgrpMolestiaGrave.Enabled := true;
      end;
    end;
  end;
  }
end;

procedure TfrmCadElegivel.dbrgrpIsentoIRClick(Sender: TObject);
begin
  { SOL 158955 - KINTANA 1613780 - JRM6}
  if (dsPessoaFisica.state IN [dsEdit, dsInsert]) then
  begin
    if dbrgrpIsentoIR.ItemIndex = 0 then
    begin
      qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 1;
      wwDBCBIsentoIrrf.Enabled := true;
      wwDBCBIsentoIrrf.SetFocus;
      BitBtnHistorico.Enabled     := False;
      dbrgrpMolestiaGrave.Visible := False;
      dbrgrpMolestiaGrave.Enabled := False;
    end
    else
    begin
      wwDBCBIsentoIrrf.ItemIndex  := -1;
      wwDBCBIsentoIrrf.Enabled    := false;
      qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 0;
      qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger  := -1;
      qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
      //edilaine - SIG33979 - inicio
      BitBtnHistorico.Enabled     := False;
      dbrgrpMolestiaGrave.Visible := False;
      //edilaine - SIG33979 - fim
    end;
  end;
end;


//Início - William Santana - SOL 161550 KIN 1717512
procedure TfrmCadElegivel.sbtnSelResponsavelClick(Sender: TObject);
begin
 inherited;

  MSResp.Executar;
  if MSResp.RetornouValor then
  begin
    dbeResponsavel.Text                                := MSResp.ValoresChave[2];
    DBeCPFRes.Text                                     := MSResp.ValoresChave[3];
    qryReprLegal.FieldByName('IDRESPONSAVEL').AsString := MSResp.ValoresChave[0];
  end;
end;

procedure TfrmCadElegivel.sbtnCadResponsavelClick(Sender: TObject);
begin
  inherited;

  iIdResponsavelGeral := -1;

  //edilaine - SIG71995 - inicio
  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.StartTransaction;
  //edilaine - SIG71995 - fim   

  frmCadResponsa := TfrmCadResponsa.Create(Application);
  frmCadElegivel.WindowState := wsMaximized;
  frmCadElegivel.Caption := 'Elegível';

  try
     frmCadResponsa.bExecutaCommitDados := false;       //edilaine - SIG71995
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
        SQL.Add(' SELECT NOME, NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+IntToStr(iIdResponsavelGeral));
        Open;

        if not( IsEmpty) then
        begin
         qryReprLegal.FieldByname('IDRESPONSAVEL').AsInteger := iIdResponsavelGeral;
         dbeResponsavel.Text                              := FieldByName('Nome').AsString;
         DBeCPFRes.Text                                   := FieldByName('NUMDOCUMENTO').AsString;
        end;

        Close;
        iIdResponsavelGeral                              := -1;
     end;
  end;
end;

procedure TfrmCadElegivel.timepickerDATAChange(Sender: TObject);
begin
  inherited;

  if ((Length(tmpckrDATAtermino.Text) = 10 ) and (Length(tmpckrDATAinicio.Text) = 10)) then
  begin
   if not(rgSituacaoAtual.itemindex = 2) then
   begin
    if ((IncMonth(StrToDate(tmpckrDATAINICIO.text), 24)) <= StrToDate(tmpckrDATATERMINO.text)) and (rgSituacaoAtual.itemindex = 0) then
    begin
      MsgDlg('A data limite não pode exceder 2 anos da data de início.','Alerta',mtWarning ,[mbOk],0);
      abort;
    end;
    rgSituacaoAtual.OnClick := Nil;

    if (StrToDate(tmpckrDATAINICIO.text) > StrToDate(tmpckrDATATERMINO.text)) or (StrToDate(tmpckrDATATERMINO.text) < date()) then
      rgSituacaoAtual.itemindex := 1
    else
      rgSituacaoAtual.itemindex := 0;

    rgSituacaoAtual.OnClick := rgSituacaoAtualClick;
   end;
  end;
end;

procedure TfrmCadElegivel.TmrSegurancaTimer(Sender: TObject);
begin
  inherited;

end;

procedure TfrmCadElegivel.rgSituacaoAtualClick(Sender: TObject);
begin
  inherited;
  if (qryReprLegal.state = dsEdit) and (rgSituacaoAtual.itemindex = 0) then
  begin
    if VerificaReprLegal then
    begin
       MsgDlg('Já existe um Representante Legal em vigência','Erro',mtError,[mbOk],0);
       Abort;
    end;
  end;
  if ((Length(tmpckrDATAtermino.Text) = 10 ) and (Length(tmpckrDATAinicio.Text) = 10) and (pnlReprLegal.visible)) then
  begin
    rgSituacaoAtual.OnClick := Nil;
    if ((StrToDate(tmpckrDATATERMINO.text) < StrToDate(tmpckrDATAINICIO.text)) or (StrToDate(tmpckrDATATERMINO.text) < Date())) and
       (rgSituacaoAtual.itemindex = 0) then
    begin
      TRadioButton(rgSituacaoAtual.Controls[1]).SetFocus;
      rgSituacaoAtual.itemindex := 1;
      MsgDlg('Situação atual da Tutela/Curatela é Vencida, pois a data limite é inferior a atual.','Alerta',mtWarning,[mbOk],0);
    end;

    rgSituacaoAtual.OnClick := rgSituacaoAtualClick;
  end;

end;

procedure TfrmCadElegivel.qryReprLegalAfterOpen(DataSet: TDataSet);
begin
  inherited;
   lkpcmbTipoRecebedor.Selected.IndexOf(qryreprlegal.fieldByName('TIPORESPONSAVEL').AsString);
   dbeResponsavel.text          := qryReprlegal.FieldByName('NOMERESPONSAVEL').AsString;
   DBeCPFRes.text               := qryReprlegal.FieldByName('NUMDOCUMENTO').AsString;
   tmpckrDATAINICIO.text        := qryReprlegal.FieldByName('DATAINICIO').AsString;
   tmpckrDATAtermino.text       := qryReprlegal.FieldByName('DATATERMINO').AsString;
   rgSituacaoatual.itemindex    := qryReprlegal.FieldByName('SITATUAL').AsInteger - 1;
   dbmmoOBSERVACAO.text         := qryReprlegal.FieldByName('OBSERVACAO').AsString;

   bINSERTVigente := False;
end;

procedure TfrmCadElegivel.qryReprLegalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if  pgctrlDetalhe.ActivePage = tbsReprLegal then
  begin
   lkpcmbTipoRecebedor.Selected.IndexOf(qryreprlegal.fieldByName('TIPORESPONSAVEL').AsString);
   dbeResponsavel.text          := qryReprlegal.FieldByName('NOMERESPONSAVEL').AsString;
   DBeCPFRes.text               := qryReprlegal.FieldByName('NUMDOCUMENTO').AsString;
   tmpckrDATAINICIO.date        := qryReprlegal.FieldByName('DATAINICIO').AsDateTime;
   tmpckrDATAtermino.date       := qryReprlegal.FieldByName('DATATERMINO').AsDateTime;
   rgSituacaoatual.itemindex    := qryReprlegal.FieldByName('SITATUAL').AsInteger - 1;
   dbmmoOBSERVACAO.text         := qryReprlegal.FieldByName('OBSERVACAO').AsString;
  end;
end;

procedure TfrmCadElegivel.qryReprLegalBeforePost(DataSet: TDataSet);
var
 sIdPessoa,sIdPessJur, sIdPlanoPrev : String;
 bExisteVigente : Boolean;
begin
  inherited;

  qryReprLegal.FieldByName('SITATUAL').AsInteger  := rgSituacaoAtual.itemIndex + 1;
  bINSERTVigente := (rgSituacaoAtual.ItemIndex = 0);

  if MontaSelect.RetornouValor then begin
    qryReprLegal.FieldByName('IDTITULAR').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
    sIdPessoa :=    MontaSelect.ValoresChave[0];
    sIdPessJur :=   MontaSelect.ValoresChave[2];
  end;

  qryReprLegal.FieldByName('IDPESSOA').AsInteger      := QryElegPatro.FieldByName('IDPESSOA').AsInteger;

  qryReprLegal.FieldByName('IDPLANOPREV').AsInteger   := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryReprLegal.FieldByName('IDPLANOORIGEM').AsInteger := qryPlanosPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryReprLegal.FieldByName('IDPESSJUR').AsInteger     := StrToInt(sIdPessJur);

  if not(qryReprLegal.state in [dsEdit])then
  begin
    qryaux2.close;
    Qryaux2.sql.clear;
    Qryaux2.SQL.Add('SELECT (Max(SEQPROPOSTA) + 1) As SEQPROPOSTA FROM HSTREPRLEGAL WHERE IDPESSOA = '+QryElegPatro.FieldByName('IDPESSOA').AsString );
    Qryaux2.Open;

    qryReprLegal.FieldByName('SEQPROPOSTA').AsInteger   := Qryaux2.FieldByName('SEQPROPOSTA').AsInteger;
  end;

  qryReprLegal.FieldByName('SITUACAO').AsString           := rgSituacaoAtual.Items[rgSituacaoAtual.itemIndex];
  qryReprLegal.FieldByName('NOMERESPONSAVEL').AsString    := dberesponsavel.text;
  qryReprLegal.FieldByName('NUMDOCUMENTO').AsString       := DBeCPFRes.text;
  qryReprLegal.FieldByName('CODTIPORESPONSAVEL').AsString := lkpcmbTipoRecebedor.LookupValue;
  qryReprLegal.FieldByName('TIPORESPONSAVEL').AsString    := lkpcmbTipoRecebedor.text;
  qryReprLegal.FieldByName('OBSERVACAO').AsString         := dbmmoOBSERVACAO.text;
  qryReprLegal.FieldByName('OBSERVACAO100').AsString      := Copy(dbmmoOBSERVACAO.text,0,100);

  if Length(tmpckrDATAtermino.Text) = 10 then
   qryReprLegal.FieldByName('DATATERMINO').AsDateTime := StrToDate(tmpckrDATATERMINO.text);

  if Length(tmpckrDATAinicio.Text) = 10 then
   qryReprLegal.FieldByName('DATAINICIO').AsDateTime  := StrToDate(tmpckrDATAINICIO.text);

   qryReprLegal.FieldByName('NOMEUSUARIO').AsString      :=  sistema.nomeusuario;
   qryReprLegal.FieldByName('TRGDTINCLUSAO').AsDateTime  :=  now;

   //edilaine SIG126319 : inicio
   if qryReprLegal.State = dsInsert then
   begin
     if (qryBenef.FieldByname('IDRESPONSAVEL').AsString = QryElegPatro.FieldByName('IDPESSOA').AsString) then
      begin
       qryReprLegal.FieldByname('IDRECEBEDOR').AsInteger  := QryElegPatro.FieldByName('IDPESSOA').AsInteger;
       qryReprLegal.FieldByName('NOMERECEBEDOR').AsString := dbedNomeFantasia.text;
      end
     else  //Recebedor é o Responsável
      begin
       qryReprLegal.FieldByName('IDRECEBEDOR').AsInteger  := qryReprLegal.FieldByName('IDRESPONSAVEL').AsInteger;
       qryReprLegal.FieldByName('NOMERECEBEDOR').AsString := dberesponsavel.text;
      end;
   end;
   //edilaine SIG126319 : fim

    //Inicío - William Santana - SIG 19040
    // Peterson Victor SOL 268568 PPM 1284501 Inicio

    if bVeiodoIndicaRec then    //sig 126319 Ferrari     // SIG 128969 Voltar
    begin
      with qryAux do
       begin
         bExisteVigente:= True;
         if (qryReprLegal.state = dsEdit) and (rgSituacaoAtual.itemindex <> 0) then
         begin
           bExisteVigente :=  VerificaReprLegal;
         end;

         if bExisteVigente  then
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
            SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(lkpcmbTipoRecebedor.LookupValue));
            SQL.Add(', DATAFIMRECEB = '+Quotedstr(tmpckrDATATERMINO.text));
            //SQL.Add(', IDRESPONSAVEL = '+Quotedstr(qryReprLegal.FieldByName('IDRESPONSAVEL').AsString));   //edilaine SIG126319
            SQL.Add(', IDRESPONSAVEL = '+Quotedstr(qryReprLegal.FieldByName('IDRECEBEDOR').AsString));       //edilaine SIG126319
            SQL.Add(', IDRESPONNAOREC = '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
            SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( QryElegPatro.FieldByName('IDPESSJUR').AsString) );
            SQL.Add(' AND IDPESSOA    = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString) );
            SQL.Add(' AND IDTITULAR   = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString) );
            //sig 126319 Ferrari : inicio
            {SQL.Add(' AND not exists (SELECT 1 FROM BENEFBFCIARIO B ');
            SQL.Add('                  WHERE B.IDTITULAR = BFCIARIOTITPLAN.IDTITULAR ');
            SQL.Add('                    AND B.IDPESSOA  = BFCIARIOTITPLAN.IDPESSOA ' );
            SQL.Add('                    AND B.IDPESSJUR = BFCIARIOTITPLAN.IDPESSJUR ');
            SQL.Add('                    AND B.IDPLANOPREV = BFCIARIOTITPLAN.IDPLANOPREV ');
            SQL.Add('                    AND B.IDBENEFICIO = BFCIARIOTITPLAN.IDBENEFICIO ');
            SQL.Add('                    AND B.IDTITULAR = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString ) );
            SQL.Add('                    AND B.IDPESSOA  = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString ) );
            SQL.Add('                    AND B.IDSITBENEFICIO <> 1) ');
            }//sig 126319 Ferrari : fim
            ExecSQL;
         end;
       end; // with
    end;


//    with qryAux do
//    begin
//       Close;
//       SQL.Clear;
//       SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
//       SQL.Add(' CODTIPORECEBEDOR = '+Quotedstr(lkpcmbTipoRecebedor.LookupValue));
//       SQL.Add(', DATAFIMRECEB = '+Quotedstr(tmpckrDATATERMINO.text));
//       SQL.Add(', IDRESPONSAVEL = '+Quotedstr(qryReprLegal.FieldByName('IDRESPONSAVEL').AsString));
//       SQL.Add(', IDRESPONNAOREC = '+Quotedstr(qryReprLegal.FieldByname('IDRESPONSAVEL').AsString));
//       SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( QryElegPatro.FieldByName('IDPESSJUR').AsString) );
//       SQL.Add(' AND IDPESSOA    = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString) );
//       SQL.Add(' AND IDTITULAR   = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString) );
//       ExecSQL;
//    end;
    // Peterson Victor SOL 268568 PPM 1284501 Fim
    //Término - William Santana - SIG 19040 - comentado

end;

procedure TfrmCadElegivel.SelReprLegal;
begin
  qryReprLegal.close;
  qryReprLegal.ParamByName('IDPESSJUR').AsInteger  := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
  qryReprLegal.ParamByName('IDPESSOA').AsInteger   := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
  qryReprLegal.ParamByName('IDTITULAR').AsInteger  := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
  qryReprLegal.Open;

  qryLogReprLegal.close;
  qryLogReprLegal.ParamByName('IDPESSJUR').AsInteger  := qryElegpatro.FieldByName('IDPESSJUR').AsInteger;
  qryLogReprLegal.ParamByName('IDPESSOA').AsInteger   := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
  qryLogReprLegal.ParamByName('IDTITULAR').AsInteger  := qryElegpatro.FieldByName('IDPESSOA').AsInteger;
  qryLogReprLegal.Open;
end;

procedure TfrmCadElegivel.abreCadElegeivel_ReprLegal(idPessoaElegivel,
  idPessoaElegPatro, idPessJur: Integer);
begin
  //essa procedure é chamada pela funcionalidade Indica Recebedor
  sbtnProcurar.Click;
  if MontaSelect.RetornouValor then
  begin
   sbtnAlterar.Click;
   tbcDetalhe.TabIndex := 10;
   pgctrlDetalhe.ActivePage := tbsReprLegal;
   tbcDetalheChange(tbsReprLegal);
   sbtnInsDet.Click;
  end;
  bVeiodoIndicaRec := True;

end;

function TfrmCadElegivel.VerificaReprLegal: Boolean;
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
//Término - William Santana - SOL 161550 KIN 1717512

//TAES - SIG98903 - início
{procedure TfrmCadElegivel.OpcaoIR;//Higor Nayde 201318
var
sDataInicio, sDataFim : string ;
qryDataIR: TQuery;
sDaraIR: String;
begin
  qryDataIR := TQuery.Create(Application);
  qryDataIR.DataBaseName := 'Basedados';
  if (qryPlanPrev.FieldByName('IDPLANOPREV').AsInteger = 66) or (qryPlanPrev.FieldByName('IDPLANOPREV').AsInteger =74)then begin
    //if (sdataIR  <> qryPlanosPrev.FieldByName('DATAOPCAOIR').AsString) or (sOpcaoIR <> qryPlanosPrev.FieldByName('TIPOOPCAOIR').AsString)then begin
    qryDataIR.SQL.Text := ('SELECT Add_months(TO_DATE(:Datas,''DD/MM/YYYY''),2) DIAUTIL FROM DUAL');
    qryDataIR.ParamByName('DATAS').AsString := '01/'+ FormatDateTime('MM/YYYY', dbdtRequerimento.date);
    qryDataIR.Open;
    sDaraIR := qryDataIR.FieldByName('DIAUTIL').AsString;
    qryDataIR.sql.Clear;
    qryDataIR.Close;
    qryDataIR.SQL.Text := ('SELECT CM.CALCULA_DIA_UTIL('+ QuotedStr(sDaraIR) +',-1) DATAIR FROM DUAL');
    qryDataIR.Open;
    sDaraIR := qryDataIR.FieldByName('DATAIR').AsString;

    if (StrToDate(sDaraIR) > dbdtInscricao.Date ) then begin
        qryDataIR.sql.Clear;
        qryDataIR.Close;
        qryDataIR.SQL.Text := ('SELECT * FROM USUARIOSISTEMA U '+
                             ' WHERE U.IDUSUARIO = :IDPESSOA '+
                             ' AND   U.FLGBLOQUEIOALTIR = 0 ');
        qryDataIR.ParamByName('IDPESSOA').AsString := IntToStr(Sistema.IdUsuario);
        qryDataIR.Open;
        if(qryDataIR.IsEmpty)then begin
           grpTipoOpIR.enabled:=False;
           cmbTipoOpIR.enabled:=False;
           dbDataOpcaoIR.enabled:=False;
        end
        else
        begin
           grpTipoOpIR.enabled:=True;
           cmbTipoOpIR.enabled:=True;
           dbDataOpcaoIR.enabled:=True;
        end;
    end;
  end else begin
    grpTipoOpIR.enabled:=True;
    cmbTipoOpIR.enabled:=True;
    dbDataOpcaoIR.enabled:=True;
  end;
  qryDataIR.Destroy;
end;//Higor Nayde 201318}
//TAES - SIG98903 - fim

//BRUNO AZEVEDO SOL 244852 PPM 626115 - CASO NÃO TENHA ACESSO A ABA, DESABILITAR TAMBÉM OS BOTÕES
procedure TfrmCadElegivel.VerificaPermissao();
begin
  if (pgctrlDetalhe.ActivePage.Enabled = False) then begin
    tb97BotoesDetalhe.Enabled := False;
    if (not(pgctrlDetalhe.ActivePage = tbsDocumento) and not(pgctrlDetalhe.ActivePage = tbsPessFis)) then begin
      pgctrlDetalhe.ActivePage.Enabled := True;
    end;
  end else begin
    tb97BotoesDetalhe.Enabled := True;
    pgctrlDetalhe.ActivePage.Enabled := True;
  end;
end;

//Darivaldo Alencar SIG37689
procedure TfrmCadElegivel.dbedAnosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not ( Key in ['0'..'9', Chr(8)] ) then
       Key := #0
end;

procedure TfrmCadElegivel.AtvDesDatasContribuicao;
begin
   if (qryElegPatro.state in[dsEdit]) then
      begin
         dbedAnos.Enabled := not (PessoaAposentada);
         dbedMeses.Enabled:= dbedAnos.Enabled;
         dbedDias.Enabled := dbedAnos.Enabled;
      end
   else begin
         dbedAnos.Enabled := True;
         dbedMeses.Enabled:= True;
         dbedDias.Enabled := True;
   end;
end;

function TfrmCadElegivel.PessoaAposentada: Boolean;
var
  QryDatas: TwwQuery;
begin
  if not(qryElegPatro.isEmpty) then
    begin
      try
        QryDatas := TwwQuery.Create(nil);
        QryDatas.DatabaseName:= 'BaseDados';
        FazQuery(QryDatas,'SELECT IDTITULAR,IDPESSOA FROM BENEFBFCIARIO '+
                          'WHERE IDTITULAR = IDPESSOA  AND IDPESSOA =   '+
                           qryElegPatro.fieldbyname('IDPESSOA').asString );
        result := not(QryDatas.IsEmpty);
      finally
        FreeAndNil(QryDatas);
      end;
    end
  else  result:= false;
end;
//Darivaldo Alencar SIG37689

//Início - William Santana - SIG 21866
procedure TfrmCadElegivel.DBMemoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := AnsiUpperCase( Key )[1];  // Michelle Mota - SIG 21866
end;
//Término - William Santana - SIG 21866

//Inicio - Darivaldo Alencar - SIG 21866
procedure TfrmCadElegivel.dbedNomeFantasiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['A'..'Z', 'a'..'z',#32,#8]) then
     Key := #0;
end;
//Fim - Darivaldo Alencar - SIG 21866
    
// Andre Imakawa - SIG 47046 - Inicio
procedure TfrmCadElegivel.wwDBCBIsentoIrrfCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  if (dsPessoaFisica.state IN [dsEdit, dsInsert]) then
  begin
    if wwDBCBIsentoIrrf.ItemIndex = -1  then
    begin
      If qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger = 1 then
      begin
        dbrgrpIsentoIR.ItemIndex := 1;
        qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := -1;
        qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 0;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;//higor
        dbrgrpMolestiaGrave.Enabled := False;
      end;
    end
    else
    begin
      // Se for selecionado algum tipo de isenção, aciona o flag de Isenção de IRRF.
      if (wwDBCBIsentoIrrf.ItemIndex >= 0 ) and (wwDBCBIsentoIrrf.ItemIndex < 2) then
      begin
        if wwDBCBIsentoIrrf.ItemIndex = 0 then
          qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := 0
        else
          qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := 1;

        //dbrgrpIsentoIR.Value                                      := '1';
        //qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger    := 1;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 0;
        BitBtnHistorico.Enabled     := False;
        dbrgrpMolestiaGrave.Visible := False;  //higor
        dbrgrpMolestiaGrave.Enabled := False;
      end;
      // Testa se foi selecionado "molestia grave"
      if wwDBCBIsentoIrrf.ItemIndex = 2 then
      begin
        //qryPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger := 1;
        qryPessoaFisica.FieldByName('TIPOISENCAOIRRF').AsInteger := 2;
        qryPessoaFisica.FieldByName('FLGMOLESTIAGRAVE').AsInteger := 1;
        BitBtnHistorico.Enabled     := true;
        dbrgrpMolestiaGrave.Visible := true;
        //dbrgrpMolestiaGrave.Enabled := true;    //edilaine - SIG33979
      end;
    end;
  end;

end;
// Andre Imakawa - SIG 47046 - Fim

// Andre Imakawa - SIG 47046 - Inicio
// Alterado do evento onchange para oncloseup
procedure TfrmCadElegivel.cmbTipoOpIRCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  iTipoOpcaoIR := cmbTipoOpIR.ItemIndex+1; //TAES - SIG91757
  If (qryPlanosPrev.State in [dsInsert, dsEdit]) then                 // Andre Imakawa - SIG 47046
  qryPlanosPrev.FieldByName('TIPOOPCAOIR').AsInteger := iTipoOpcaoIR; // Andre Imakawa - SIG 47046
  
end;
// Andre Imakawa - SIG 47046 - Fim

//Darivaldo Alencar SIG 27871 - inicio
procedure TfrmCadElegivel.MostraEscondeGridOutrasInformacoes(MostraGrids: Boolean = false);
begin
  if (pgCtrlDetalhe.ActivePage = tbsOutrasInforms) then
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

procedure TfrmCadElegivel.MostraGridInformacoesAdicionais(bMostrar: Boolean);
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
  Label59.visible            := (not bMostrar);
  lblCartaEnvio.visible      := (not bMostrar);
  lblNup.visible             := (not bMostrar);
  dblkParamPessoa.visible    := (not bMostrar);
  dbedValor.visible          := (not bMostrar);
  dtInicio.visible           := (not bMostrar);
  DtFim.visible              := (not bMostrar);
  edValida.visible           := (not bMostrar);
  dbMemo2.visible            := (not bMostrar);
  edtCartaEnvio.visible      := (not bMostrar);
  edtNup.visible             := (not bMostrar);
end;

procedure TfrmCadElegivel.AlinhaComponente(tpAlinhamento: TAlign);
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

procedure TfrmCadElegivel.sbtnInsDet2Click(Sender: TObject);
begin
  inherited;
  sbtnInsDet2.down:= false;
  sbtnInsDet.down:= true;
  AlinhaComponente(AlNone);
  FormataEdit(edPaiDetalhe2.Name);
  AtivaGrid(dbgrInfoAdicionais);
  bGridPadrao:= false;
  sbtnInsDetClick(self);
  qryOcupacao.fieldbyname('DTINICIO').asString:= formatdatetime('dd/mm/yyyy', now);
end;

procedure TfrmCadElegivel.sbtnAltDet2Click(Sender: TObject);
var
  qryPar: TwwQuery;
begin
  inherited;
  sbtnAltDet2.down:= false;
  sbtnAltDet.down:= true;
  AlinhaComponente(AlNone);
  FormataEdit(edPaiDetalhe2.Name);
  AtivaGrid(dbgrInfoAdicionais);
  bGridPadrao:= false;
  sbtnAltDetClick(self);
end;

procedure TfrmCadElegivel.sbtnExcluiDet2Click(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Deseja excluir o registro selecionado? ','Confirmação',mtConfirmation,[mbyes,mbNo],0) = mrNo) then
       exit;
  AtivaGrid(dbgrInfoAdicionais);
  inherited sbtnExcluiDetClick(self);
end;

procedure TfrmCadElegivel.FormataEdit(sNmEdit: String);
begin
  if not(pgctrlDetalhe.ActivePage = tbsOutrasInforms) Then
    begin
        lblNomePai.visible := false;
        exit;
    end;

  if (sNmEdit = Trim('edPaiDetalhe2')) then
     begin
        lblNomePai.caption       := edPaiDetalhe2.text;
        lblNomePai.left          := tb97BotoesDetalhe.width + 2;
        lblNomePai.visible       := true;
     end
  else
      lblNomePai.visible := false;
end;

function TfrmCadElegivel.GetSequence(sTabela: String): String;
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

procedure TfrmCadElegivel.AtivaGrid(nmDbGrid: twwdbgrid);
begin
   if (pgctrlDetalhe.ActivePage = tbsOutrasInforms) then
      begin
          grdAtual := nmDbGrid;
          qryAtual := TwwQuery(grdAtual.DataSource.DataSet);
          if (grdAtual = dbgrdOutrasInforms) then
              MostraGridInformacoesAdicionais(False)
          else MostraGridInformacoesAdicionais(True);
      end;
end;

procedure TfrmCadElegivel.BuscaOBSR;
begin
if (pgctrlDetalhe.ActivePage = tbsOutrasInforms) then
       begin
          if (qry.FieldByname('IDPESSOA').AsString <> EmptyStr) then
             begin
               FazQuery(qryPF2,' SELECT PF.IDPESSOA,PF.INFOADICIONAIS FROM  CM.PESSOAFISICA PF WHERE PF.IDPESSOA = ' + qry.FieldByname('IDPESSOA').AsString);
               dbMemInfoAdicionais.readOnly:= not(sbtnAlterar.down) ;
             end
          else begin
               FazQuery(qryPF2,' SELECT PF.IDPESSOA,PF.INFOADICIONAIS FROM  CM.PESSOAFISICA PF WHERE 1 = 2');
               dbMemInfoAdicionais.readOnly:= True;
          end;
       end
    else formataEdit(dbedPaiDetalhe.name);
end;
//Darivaldo Alencar SIG 27871 - fim

procedure TfrmCadElegivel.FormResize(Sender: TObject);
begin
  inherited;
  // Andre Imakawa - SIG 57642 - Inicio
  if self.width > importpanel.width then
    importpanel.left := self.width - (importpanel.width + 5)
  else
    importpanel.left := 1;
  // Andre Imakawa - SIG 57642 - Fim
end;

//Início - William Santana - SIG 55755
procedure TfrmCadElegivel.lckupPlanPrevPICloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryNomePI.Close;
  qryNomePI.ParamByName('IDPLANOPREV').AsInteger := qryPlanPrevPI.FieldByName('IDPLANOPREV').AsInteger;
  qryNomePI.Open;

  edtPlanoContPI.Text := '';

end;

procedure TfrmCadElegivel.lckupNomePerfilPICloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  edtPlanoContPI.Text := qryNomePI.FieldByName('PlanContabil').AsString;         
end;

procedure TfrmCadElegivel.qryPerfilInvestBeforePost(DataSet: TDataSet);
var
  iIdPerfil : integer;
begin
  inherited;

  iIdPerfil := LeUltRegistro(qryAux,'PERFILINVXELEG');

  qryPerfilInvest.FieldByName('IDPERFILINVXELEG').AsInteger := iIdPerfil;
  qryPerfilInvest.FieldByName('IDPERFILINVEST').AsInteger := qryNomePI.FieldByName('IDPERFILINVEST').AsInteger;
  qryPerfilInvest.FieldByName('IDPLANOPREV').AsInteger := qryPlanPrevPI.FieldByName('IDPLANOPREV').AsInteger;
  qryPerfilInvest.FieldByName('IDPESSOA').AsInteger    := qryelegpatro.FieldByName('IDPESSOA').AsInteger;
  qryPerfilInvest.FieldByName('IDPESSJUR').AsInteger   := qryelegpatro.FieldByName('IDPESSJUR').AsInteger;
  qryPerfilInvest.FieldByName('SEQPROPOSTA').AsInteger := 1;
  qryPerfilInvest.FieldByName('NOMEPERFIL').AsString   := qryNomePI.FieldByName('NOMEPERFIL').AsString;
  qryPerfilInvest.FieldByName('PlanPrev').AsString     := qryNomePI.FieldByName('PlanPrev').AsString;
  qryPerfilInvest.FieldByName('PlanContabil').AsString := qryNomePI.FieldByName('PlanContabil').AsString;

  if (qryPerfilInvest.State = dsInsert) then
    qryPerfilAux.Insert
  else
  begin
     qryPerfilAux.locate('IDPERFILINVXELEG',qryPerfilInvest.FieldByName('IDPERFILINVXELEG').AsInteger,[]);
     qryPerfilAux.Edit;
  end;               

end;

procedure TfrmCadElegivel.qryPerfilInvestAfterPost(DataSet: TDataSet);
begin
  inherited;

  qryPerfilAux.FieldByName('IDPERFILINVXELEG').AsInteger := qryPerfilInvest.FieldByName('IDPERFILINVXELEG').AsInteger;
  qryPerfilAux.FieldByName('IDPERFILINVEST').AsInteger := qryPerfilInvest.FieldByName('IDPERFILINVEST').AsInteger;
  qryPerfilAux.FieldByName('IDPLANOPREV').AsInteger    := qryPlanPrevPI.FieldByName('IDPLANOPREV').AsInteger;
  qryPerfilAux.FieldByName('DTINICIO').AsDateTime      := qryPerfilInvest.FieldByName('DTINICIO').AsDateTime;
  qryPerfilAux.FieldByName('DTFIM').AsDateTime         := qryPerfilInvest.FieldByName('DTFIM').AsDateTime;
  qryPerfilAux.FieldByName('IDPESSOA').AsInteger       := qryelegpatro.FieldByName('IDPESSOA').AsInteger;
  qryPerfilAux.FieldByName('IDPESSJUR').AsInteger      := qryelegpatro.FieldByName('IDPESSJUR').AsInteger;
  qryPerfilAux.Post;
end;

function TfrmCadElegivel.VerificaPeriodoPerfilInvest:boolean;
var
  iIdPerfil: integer;

begin
  qryPerfilAux.first;

  iIdPerfil := -1;
  
  if qryPerfilInvest.State = dsEdit then
  iIdPerfil := qryPerfilInvest.FieldByName('IDPERFILINVXELEG').AsInteger;

  while not qryPerfilAux.eof do
  begin
   if (qryPlanPrevPI.FieldByName('IDPLANOPREV').AsInteger = qryPerfilAux.FieldByName('IDPLANOPREV').AsInteger) and
      (iIdPerfil <> qryPerfilAux.FieldByName('IDPERFILINVXELEG').AsInteger)
   then
   begin

     if ((dtDtIniPI.DateTime <= qryPerfilAux.FieldByName('DTFIM').AsDateTime) and
         (dtDtIniPI.DateTime >= qryPerfilAux.FieldByName('DTINICIO').AsDateTime))
        or
        ((dtDtFimPI.DateTime >= qryPerfilAux.FieldByName('DTINICIO').AsDateTime) and
         (dtDtFimPI.DateTime <= qryPerfilAux.FieldByName('DTFIM').AsDateTime))
     then
         result := true;
   end;
   qryPerfilAux.next;
  end;

end;
//Fim - William Santana - SIG 55755


//edilaine - SIG33979 - inicio
procedure TfrmCadElegivel.PreencheDataMolestiaGrave;
begin
  qryMolestiaGrave.Close;
  qryMolestiaGrave.ParamByName('IDPESSOA').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
  qryMolestiaGrave.Open;
  if not qryMolestiaGrave.eof then
  begin
    if qryPessoaFisica.State in [dsEdit] then
    begin
      qryPessoaFisica.FieldByName('DATAMOLESTIAGRAVE').AsString := qryMolestiaGrave.FieldByName('DTINICIO').AsString;
      qryPessoaFisica.FieldByName('DATAFIMMOLESTIA').AsString   := qryMolestiaGrave.FieldByName('DTFINAL').AsString;
    end;
  end
  else
  begin
    if qryPessoaFisica.State in [dsEdit] then
      begin
        qryPessoaFisica.FieldByName('DATAMOLESTIAGRAVE').AsString := '';
        qryPessoaFisica.FieldByName('DATAFIMMOLESTIA').AsString := '';
      end;
  end;
end;


procedure TfrmCadElegivel.CarregaDadosPessoais;
begin
  //CPrev - 27955 - Inicio
  with qryLocalNascimento do
  begin
    close;
    qryLocalNascimento.ParamByName('idpessoa').AsInteger := qryElegPatro.FieldByName('IDPESSOA').AsInteger;
    open;

    edtEstado.text        := FieldByName('NOMEESTADO').AsString;
    edtNaturalidade.text  := FieldByName('NOMECIDADE').AsString;
    edtNacionalidade.text := FieldByName('NOMENACIONALIDADE').AsString;

    edtEstado.tag        := FieldByName('IDESTADO').AsInteger; // SOL 219782 KINTANA 2054136
    edtNaturalidade.tag  := FieldByName('IDCIDADES').AsInteger;
    edtNacionalidade.tag := FieldByName('IDPAIS').AsInteger;   // SOL 219782 KINTANA 2054136
  end;
  //CPrev - 27955 -  Fim

  if qryElegPatro.FieldByName('FLGDIRETOR').AsInteger = 0 then  //Ádler Souza - Sol 127323  Kintana 674396
  begin
//  dbgrdElegivel.Columns[4].DisplayWidth :=0;
//  dbgrdElegivel.Columns[4].DisplayWidth :=0;
//   dbgrdElegivel.Columns.Items[4].Visible := false;
    lblDataNomeacao.Visible := false;
    edtDataNomeacao.visible := false;
    lblDataExoneracao.Visible := false;
    edtDataExoneracao.visible := false;
  end else begin
//  dbgrdElegivel.Columns[3].DisplayWidth :=18;
//  dbgrdElegivel.Columns[4].DisplayWidth :=18;
    lblDataNomeacao.Visible := true;
    edtDataNomeacao.visible := true;
    lblDataExoneracao.Visible := true;
    edtDataExoneracao.visible := true;
  end; //Ádler Souza - Sol 127323  Kintana 674396
end;

procedure TfrmCadElegivel.PessoaChangePessoa(IdPessoa: Integer);
begin
  inherited;
  CarregaDadosPessoais;
end;

function TfrmCadElegivel.VerificaCPF(sDocumento: string): boolean;
var
  tempItem : TListItem;
begin
 result := true;

  if FazQuery( qryEscolhePessoa,
             'SELECT PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL ,'+
             'PESSOA.NUMDOCUMENTO FROM PESSOA WHERE (PESSOA.IDPESSOA <> '+qryIDPESSOA.AsString+
             ') and (PESSOA.NUMDOCUMENTO = '''+sDocumento+''') ') then
  begin
     Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

     MsgDlg('Este '+lblDocumento.Caption+' já existe no cadastro', Caption, mtWarning , [mbOk], 0);
     frmEscolhePessoa.sNomeCodigo := lblDocumento.Caption;
     frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;
     if frmEscolhePessoa.ShowModal = mrOK then
     begin
          bbtnCancelarClick(Self);
          Pessoa.ChangePessoa( qryEscolhePessoaIDPESSOA.AsInteger);
          sbtnAlterarClick(Self);

          bbtnConfirmar.enabled := (sbtnAlterar.down);
          bbtnCancelar.enabled  := (sbtnAlterar.down);
     end
     else
     begin
          if not(Sistema.DuplicaDocPessoa) then
          begin
            MsgDlg('Não é permitido a duplicidade de número de documento no cadastro de Pessoa.', Caption, mtWarning , [mbOk], 0);
            Result := False;
          end;
     end;
  end;
end;
//edilaine - SIG33979 - fim


// Inicio SIG 126319 - ferrari
procedure TfrmCadElegivel.qryReprLegalAfterDelete(DataSet: TDataSet);
begin
  inherited;
// Inicio SIG 128969
{
  if qryReprLegal.isempty then
    begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN set ');
      qryAux.SQL.Add(' CODTIPORECEBEDOR = null ');
      qryAux.SQL.Add(', IDRESPONSAVEL  = '+Quotedstr(QryElegPatro.FieldByName('IDPESSOA').AsString));
      qryAux.SQL.Add(', IDRESPONNAOREC = null ');
      qryAux.SQL.Add(', DATAFIMRECEB = null   ');
      qryAux.SQL.Add(' WHERE IDPESSJUR = '+Quotedstr( QryElegPatro.FieldByName('IDPESSJUR').AsString) );
      qryAux.SQL.Add(' AND IDPESSOA    = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString) );
      qryAux.SQL.Add(' AND IDTITULAR   = '+Quotedstr( QryElegPatro.FieldByName('IDPESSOA').AsString) );
      qryAux.ExecSQL;
    end;
}
//FIM Sig 128969
end;
// Fim SIG 126319 - ferrari

function TfrmCadElegivel.HabilitaEndereco(pIdPessoa: Integer): Boolean;
var
  sSQL: string;
begin
  sSQL := 'SELECT 1 ' +#13#10+
          '  FROM CM.PARTPREVPLAN P ' +#13#10+
          ' WHERE P.IDPESSOA = ' + IntToStr(pIdPessoa) +#13#10+
          '   AND EXISTS (SELECT 1 FROM CM.PARTPREVPLAN P1 WHERE P1.IDPESSOA = P.IDPESSOA AND P1.IDPESSJUR = 1)';
  qryAux.Close;
  qryAux.SQL.Clear;
  if FazQuery(qryAux, sSQL) then
  begin
    Result := not qryAux.IsEmpty;
  end;
end;

//WO22785 Leandro inicio
function TfrmCadElegivel.ValidaGetDtIniHistTribIR(pIdPessoa: Integer): Boolean;
var
  sSQL: string;
begin
  sSQL := 'SELECT * ' +#13#10+
          '  FROM CM.HISTOPIR  ' +#13#10+
          ' WHERE IDPESSOA = ' + IntToStr(pIdPessoa) +#13#10+
          '   AND dtfim is null';
  qryAux.Close;
  qryAux.SQL.Clear;
  FazQuery(qryAux, sSQL);

  if qryAux.IsEmpty then
  begin
    Result := True;
  end
  else
    if  dbDataOpcaoIR.Date <= qryAux.fieldbyname('DTINICIO').asdatetime then
      Result := False
    else
      Result := True;
end;
//WO22785 Leandro fim

end.
