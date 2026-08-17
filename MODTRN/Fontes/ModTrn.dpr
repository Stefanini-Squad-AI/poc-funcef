program ModTrn;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  UModulo in 'UModulo.pas',
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fAgendaTrein in '..\..\Shared\ModComp\FontesMT\fAgendaTrein.pas' {frmAgendaTrein},
  fParamTabCursos in '..\Reports\Source\fParamTabCursos.pas' {frmParamTabCursos},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadGrpTr in '..\FontesMT\fCadGrpTr.pas' {frmCadGrpTr},
  fCadPacote in '..\FontesMT\fCadPacote.pas' {frmCadPacote},
  fCadTipCurso in '..\FontesMT\fCadTipCurso.pas' {frmCadTipCurso},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadEntid in '..\..\Shared\ModComp\FontesMT\fCadEntid.pas' {frmCadEntid},
  fCadOrcamTrein in '..\FontesMT\fCadOrcamTrein.pas' {frmCadOrcamTrein},
  fCadRequer in '..\FontesMT\fCadRequer.pas' {frmCadRequer},
  fCadFator in '..\FontesMT\fCadFator.pas' {frmCadFator},
  fCadCargo in '..\..\Shared\ModComp\FontesMT\fCadCargo.pas' {frmCadCargo},
  fHstTrein in '..\FontesMT\fHstTrein.pas' {frmHstTrein},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fParamNecesCurso in '..\Reports\Source\fParamNecesCurso.pas' {frmParamNecesCurso},
  fParamNecesPess in '..\Reports\Source\fParamNecesPess.pas' {frmParamNecesPess},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RNecesCurso in '..\Reports\Source\RNecesCurso.pas' {RptNecesCurso},
  RNecesPess in '..\Reports\Source\RNecesPess.pas' {RptNecesPess},
  uCmCtrlRptModTrn in '..\CtrlObjetos\uCmCtrlRptModTrn.pas',
  fParamAtivTrein in '..\Reports\Source\fParamAtivTrein.pas' {frmParamAtivTrein},
  RAtivPess in '..\Reports\Source\RAtivPess.pas' {RptAtivPess},
  RAtivCurso in '..\Reports\Source\RAtivCurso.pas' {RptAtivCurso},
  RAtivEntid in '..\Reports\Source\RAtivEntid.pas' {RptAtivEntid},
  fParamMapaTrein in '..\Reports\Source\fParamMapaTrein.pas' {frmParamMapaTrein},
  RMapaTrein in '..\Reports\Source\RMapaTrein.pas' {RptMapaTrein},
  RListaPresenca in '..\Reports\Source\RListaPresenca.pas' {RptListaPresenca},
  fParamListaEntid in '..\Reports\Source\fParamListaEntid.pas' {frmParamListaEntid},
  RListaEntid in '..\Reports\Source\RListaEntid.pas' {RptListaEntid},
  RCartaConvoc in '..\..\Shared\ModComp\Reports\Source\RCartaConvoc.pas' {RptCartaConvoc},
  RTabCursos in '..\Reports\Source\RTabCursos.pas' {RptTabCursos},
  fCadInstrutorInterno in '..\FontesMT\fCadInstrutorInterno.pas' {frmCadInstrutorInterno},
  fParamEstAvalTrein in '..\FontesMT\fParamEstAvalTrein.pas' {frmParamEstAvalTrein},
  fSelEstTrein in '..\FontesMT\fSelEstTrein.pas' {frmSelEstTrein},
  fRegPresenca in '..\FontesMT\fRegPresenca.pas' {frmRegPresenca},
  fRegAvalAlunos in '..\FontesMT\fRegAvalAlunos.pas' {frmRegAvalAlunos},
  RAvalCurso in '..\..\Shared\ModComp\Reports\Source\RAvalCurso.pas' {RptAvalCurso},
  fSelTreinColetivo in '..\..\Shared\ModComp\FontesMT\fSelTreinColetivo.pas' {frmSelTreinColetivo},
  fListaPessoas in '..\..\Shared\ModComp\FontesMT\fListaPessoas.pas' {frmListaPessoas},
  fCadLocalizacao in '..\..\Shared\ModComp\FontesMT\fCadLocalizacao.pas' {frmCadLocalizacao},
  fParamListaPresenca in '..\Reports\Source\fParamListaPresenca.pas' {frmParamListaPresenca},
  RListaPresenca2 in '..\Reports\Source\RListaPresenca2.pas' {RptListaPresenca2},
  RListaAval in '..\Reports\Source\RListaAval.pas' {RptListaAval},
  RRelEvento in '..\..\Shared\ModComp\Reports\Source\RRelEvento.pas' {RptRelEvento},
  RMapaResumoTrein in '..\Reports\Source\RMapaResumoTrein.pas' {RptMapaResumoTrein},
  fParamMapaResumoTrein in '..\Reports\Source\fParamMapaResumoTrein.pas' {frmParamMapaResumoTrein},
  RHistPess in '..\Reports\Source\RHistPess.pas' {RptHistPess},
  fParamHistPess in '..\Reports\Source\fParamHistPess.pas' {frmParamHistPess},
  fParamMapaResumoTrein2 in '..\Reports\Source\fParamMapaResumoTrein2.pas' {frmParamMapaResumoTrein2},
  RMapaResumoTrein2 in '..\Reports\Source\RMapaResumoTrein2.pas' {RptMapaResumoTrein2},
  fCadFatorDesemp in '..\FontesMT\fCadFatorDesemp.pas' {frmCadFatorDesemp},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  fCadEscala in '..\FontesMT\fCadEscala.pas' {frmCadEscala},
  RListaAval2 in '..\Reports\Source\RListaAval2.pas' {RptListaAval2},
  fPrincipal in 'FPrincipal.pas',
  FCadSiglas in 'FCadSiglas.pas' {FrmCadSiglas},
  FSelAssinatura in '..\..\SHARED\ModComp\FontesMT\FSelAssinatura.pas' {frmSelecaoAssinatura},
  uCtrlAssinatura in '..\CtrlObjetos\uCtrlAssinatura.pas',
  uDbAssinatura in '..\DBobjects\uDbAssinatura.pas',
  RCertificado in '..\..\SHARED\ModComp\Reports\Source\RCertificado.pas' {RptCertificado},
  fAssinatura in '..\FontesMT\fAssinatura.pas' {frmAssinatura},
  fRegTreinMetaAtuarial in '..\..\SHARED\ModComp\FontesMT\fRegTreinMetaAtuarial.pas' {frmRegTreinMetaAtuarial},
  fCadRegTreinColetivo in '..\..\SHARED\ModComp\FontesMT\fCadRegTreinColetivo.pas' {FrmCadRegTreinColetivo},
  RListaInscritosTurma in '..\..\SHARED\ModComp\Reports\Source\RListaInscritosTurma.pas' {RptListaInscritos},
  fCadRegIncentivo in '..\..\SHARED\ModComp\FontesMT\fCadRegIncentivo.pas' {frmCadRegIncentivo},
  fCadCursoMT in '..\FontesMT\fCadCursoMT.pas' {frmCadCursoMT},
  fCadCertificadoMT in '..\FontesMT\fCadCertificadoMT.pas' {FrmCadCertificado},
  fRegCertificadoMT in '..\FontesMT\fRegCertificadoMT.pas' {FrmRegCertificado};

{$R *.RES}
{$R MODTRN_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Treinamento';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Treinamento
================================================================================
CM$VER      
--------------------------------------------------------------------------------
Pendência : 177768
Descrição : Reformulação da rotina de treinamentos
================================================================================
CM$VER      3.08.09     26/06/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.08.08     05/03/2008
--------------------------------------------------------------------------------
Pendência: 27522
Tela: Cadastros/Cargos
Descrição: Retirada do campo 'CBO 1994' que encontra-se em desuso desde março de 2003.
================================================================================
CM$VER      3.08.07     12/02/2008
--------------------------------------------------------------------------------
Recompilando Fontes
================================================================================
CM$VER      3.08.06     18/12/2007
--------------------------------------------------------------------------------
(Pendência 25534)
- Consultas / Relatórios / Operacionais / Atividades de Treinamento por Curso, Entidade e Treinando:
  * Foram acrescentados, nas consultas desses relatórios, os seguintes campos:
       VALOR (valor da inscrição no curso)
       DESP_VIAG (despesas de viagem)
       DESP_ESTAD (despesas de hospedagem)
       DESP_OUTR (outras despesas)
   ... permitindo assim que o usuário possa incluí-los nesses relatórios, onde melhor lhe aprouver.
 
================================================================================
CM$VER      3.08.05     20/04/2007
--------------------------------------------------------------------------------
(Pendência 25117)
- Transações / Registro Individual de Treinamento:
  * Foi introduzida uma verificação para que o usuário evite de inserir um
    registro sem ter informado o curso a que se refere.
================================================================================
CM$VER      3.08.04     18/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.08
- Transações / Registro Coletivo de Treinamento:
  * Foi incluída a opção para imprimir o Certificado de Conclusão do curso.
     OBSERVAÇÃO: ele possui uma figura fixa, que está com o logotipo da CM 
    Soluções.  Você deve alterar o relatório para colocar o logo ou qualquer outra 
    imagem desejada.
================================================================================
CM$VER      3.08.03     15/06/2004
--------------------------------------------------------------------------------
- Relatórios Evento do Treinamento, Listas de Presença e Avaliações dos Alunos:
  * Todos foram alterados de forma a separar corretamente os eventos segundo o
    local, calendário e instrutores.
================================================================================
CM$VER      3.08.02     14/04/2004
--------------------------------------------------------------------------------
- Transações / Registro Coletivo de Treinamento:
  * Foi incluída a opção de ratear entre os participantes os valores lançados para cada
    despesa. Esta opção só fica habilitada quando já foram feitas as inscrições,
    marcando-se a caixa "Ratear" e utilizando-se o botão "Atualizar Inscrições".
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
================================================================================
CM$VER      3.08.01     16/02/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / ... / Resumo por Grupo (Horizontal)
  * Foi incluída a opção para informar em qual Grupo de Treinamento (por Cargo)
     devem ser classificados os cursos dados a Candidatos.
================================================================================
CM$VER      3.08.00     15/01/2004
--------------------------------------------------------------------------------
- Lista de Presença: implementação da opção de informar data "Sem Aula", com 
  implicação nas seguintes funções:
  * Transações / Lista de Presença / Registro:
    foi acrescentada uma caixa, ao lado da Data de Realização, que deve ser
    marcada quando se deseja registrar que, nessa data, não haverá aula
    (neste caso, o sistema assume essa condição para todos os inscritos,
    não havendo a necessidade de marcar as pessoas).
    Após este registro, o sistema exibe o nome dos inscritos em vermelho,
    nas datas em que não há aula.
  * Transações / Lista de Presença / Relatórios da Lista de Presença:
    passaram a reconhecer o dia "Sem Aula".
  * Consultas / Histórico de Treinamento / Imprimir Histórico:
    o relatório considera os dias "sem aula" para calcular corretamente a 
    quantidade de Faltas de um aluno, quando esta opção é solicitada.
================================================================================
CM$VER      3.07.03     05/01/2004
--------------------------------------------------------------------------------
- Transações / Registro Coletivo de Treinamento / Lista de Presença / Registro das Aval..
  * Redimensionamento e reposicionamento das caixas referentes a Cursos e Entidades,
     para permitir melhor visualização das respectivas listas.
- Consultas / Histórico de Treinamento / Imprimir Histórico:
  * Possibilidade de imprimir o histórico de candidatos.
================================================================================
CM$VER      3.07.02     09/10/2003
--------------------------------------------------------------------------------
- Lista de Presença:
  * Correção na impressão da lista.
================================================================================
CM$VER      3.07.01     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.07.00     03/09/2003
--------------------------------------------------------------------------------
- Implementação da tela Sistema / Configuração / Parâmetros do Sistema, onde foram
  inseridos os parâmetros para definir:
  a) se os fatores de avaliação serão também aplicáveis às avaliações dos alunos
     (e, neste caso, para cada fator será indicado se ele se aplica a avaliação do curso
     ou do aluno);
  b) qual o valor máximo das avaliações escalonadas;
  c) se os fatores serão diferentes para cada curso (optando pelo seu uso, a tela do
     Cadastro de Cursos terá uma nova divisória onde será feita esta vinculação).
- Implementação da tela Cadastros / Escalas de Conceitos:
  * Nela serão cadastradas as escalas a serem utilizadas pelos Fatores de Avaliação, quando
    estes forem definidos como Conceituais.
- Cadastros / Fatores de Avaliação dos Cursos:
  * Inclusão dos campos "Aplicabilidade deste Fator" e "Escala de Conceitos", conforme 
    opções acima indicadas.
- Várias telas de transação e relatórios:
  * Passam a comportar-se de acordo com os parâmetros e cadastros acima referidos.
- Consultas / Relatórios / RH... / Operacionais / Atividades de Treinamento:
  * Por Curso / Por Empresa / Por Treinando:
     Agora é possível selecionar cursos dados a candidatos (aba "Por Dados Funcionais
     Básicos"). Restrição conhecida: deve-se evitar uma seleção que retorne mais de
     1000 (mil) pessoas, pois o sistema dará uma mensagem de erro. Esta restrição
     está em estudo, para ser eliminada.
================================================================================
CM$VER      3.06.00     21/08/2003
--------------------------------------------------------------------------------
- Cadastros / Pacotes de Cursos:
  * Foi acrescentado o campo Tipo de Pacote, com o objetivo de
    indicar se os cursos que o compõem são
    Complementares (formam uma sequência, onde todos são necessários) ou
    Mutuamente Exclusivos (basta um deles, pois são alternativos).
    Esta informação terá reflexo nas Necessidades de Treinamento
    (ver abaixo).
- Consultas / Relatórios / RH... / Operacionais /
  Necessidades de Treinamento / Por Curso e Por Pessoa:
  * Quando o usuário optar por Necessidades Baseadas em Cursos
    Requeridos por Cargo, o sistema irá considerar como requeridos
    os cursos nas seguintes situações:
    1) os cursos requeridos que não pertencem a nenhum pacote;
    2) todos os cursos pertencentes a um pacote do primeiro tipo
       acima, desde que um deles tenha sido classificado como
       requerido (isto é, considera necessário que a pessoa faça
       todos os cursos do pacote que ainda não fez);
    3) qualquer dos cursos pertencentes a um pacote do segundo
       tipo acima, desde que um deles tenha sido classificado
       como requerido (isto é, será suficiente que a pessoa
       tenha feito qualquer curso do pacote).
================================================================================
CM$VER      3.05.03     20/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Operacionais / Atividades de Treinamento:
  * Por Curso / Por Empresa / Por Treinando:
     O formato foi alterado de Retrato para Paisagem, para melhor visualização.
  * Por Curso:
     Inclusão da opção para relatório Analítico (lista os participantes) ou Sintético 
     (lista os eventos).
================================================================================
CM$VER      3.05.02     14/08/2003
--------------------------------------------------------------------------------
- Consultas / Histórico de Treinamento / Imprimir Histórico:
  * Acrescentada a opção para calcular e exibir os Dias de Falta, com a ressalva de
     que nem sempre esta informação é precisa, pois o sistema não dispõe dos dados
     necessários a uma apuração correta. Como não existe o dado sobre os dias em que
     efetivamente houve aula, o cálculo é feito da seguinte forma:
     (Data Final - Data Inicial + 1 - Dias de Presença)
================================================================================
CM$VER      3.05.01     12/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Operacionais / Mapa de Treinamento:
  * Correção para a situação em que se solicita apenas os Cursos não realizados.
================================================================================
CM$VER      3.05.00     11/08/2003
--------------------------------------------------------------------------------
- Cadastros / Tipos de Curso
  * Inclusão do botão "Cursos", que permite visualizar os cursos associados a um
     Tipo de Treinamento.
- Introdução do conceito de "Competências Trabalhadas (ou Otimizadas)":
  * Conceituação
    As competências são os Fatores de Avaliação de Desempenho, definidos no módulo
    RH - Administração de desempenho. Para um determinado curso, pode-se especificar que
    ele visa "trabalhar", isto é, otimizar, melhorar o desempenho das pessoas em uma ou 
    mais dessas competências. A partir desta versão, o usuário pode alimentar os dados 
    relativos a este conceito, e dele obter resultados conforme abaixo listado;
  * Cadastros / Cursos
    A tela foi reformulada e teve as informações redistribuídas, possuindo agora três guias,
    além de dados básicos sempre presentes no alto da tela. Uma dessas guias é a destinada
    ao cadastramento das "Competências Trabalhadas";
  * Transações / Registro Coletivo de Treinamento / Relatório Completo do Evento
    Inclusão das informações sobre as "Competências Trabalhadas";
  * Consultas / Relatórios / RH... / Operacionais / Necessidades de Treinamento (ambas)
    Inclusão da opção "Necessidades Baseadas em Cursos Requeridos por Cargo ou Avaliação
    de Desempenho".
  * Consultas / Fatores de Avaliação de Desempenho (Competências e Cursos que as Otimizam)
    Inclusão desta tela que permite, por Fator (Competência) consultar quais os cursos que
    foram cadastrados como sendo seus "otimizadores".
================================================================================
CM$VER      3.04.05     05/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Operacionais / Mapa de Treinamento:
  * Correção da ordem de impressão (estava de trás para diante);
  * Acerto nos procedimentos de retorno à tela após mensagem de aviso do sistema.
================================================================================
CM$VER      3.04.04     31/07/2003
--------------------------------------------------------------------------------
- Cadastros / Grupos de Treinamento:
  * Inclusão do botão "Cursos", que permite visualizar os cursos associados a um 
     Grupo de Treinamento.
- Consultas / Relatórios / RH... / Operacionais:
  * Inclusão do relatório "Resumo das Atividades de Treinamento por Grupo (Horizontal)".
================================================================================
CM$VER      3.04.03     29/07/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Operacionais / Atividades de Treinamento:
  * Por Curso / Por Empresa / Por Treinando:
     inclusão da coluna Status (Realizado, Iniciado, Programado, A Programar).
  * Por Curso:
     inclusão da opção para exibir o Local do Curso e o Conteúdo Programático.
================================================================================
CM$VER      3.04.02     22/07/2003
--------------------------------------------------------------------------------
- Transações / Registro de Treinamento (Individual e Coletivo) / Dados Complementares
  * Ao acionar o botão que alimenta o campo de datas e horários, o sistema agora
     pergunta se haverá aula nos dias que caem em final de semana.
================================================================================
CM$VER      3.04.01     04/07/2003
--------------------------------------------------------------------------------
- Lista de Presença
  * Inclusão das informações: Outros Instrutores e Horário.
- Relatório Completo do Evento
  * Inclusão das informações: Outros Instrutores e Horário.
================================================================================
CM$VER      3.04.00     30/06/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH - ... / Operacionais
  * Nos três Relatórios de Atividades (por Curso, Entidade e Treinando), foi acrescentada
    a opção para escolher o módulo do RH de onde se originou o registro do treinamento.
    Embora o mais comum seja o próprio Módulo de Treinamento, também existe a 
    possibilidade desse registro ter se originado no Módulo de Administração de
    Desempenho (na tela do Registro da Avaliação de Desempenho, como ação
    recomendada), ou ainda no Módulo de Recrutamento e Seleção (na tela de Registro 
    de Cursos de Candidatos, ou na tela de Cadastro de Candidatos)
Obs.: Como um campo foi criado para suportar essa funcionalidade, sugere-se que o 
         usuário solicite ao Suporte do Banco de Dados para executar o comando:
UPDATE HSTTRN SET IDMODULO = 72 WHERE IDMODULO IS NULL
(isto fará com que todo o histórico anterior fique como tendo se originado do Módulo
de Treinamento)
- Transações / Registro Coletivo de Treinamento
  * Correção na emissão da Carta de Convocação, que, em certas circunstâncias, 
    repetia informações relativas aos horários e instrutores.
================================================================================
CM$VER      3.03.14     20/06/2003
--------------------------------------------------------------------------------
- Relatório Resumo das Atividades de Treinamento por Grupo
  * Inclusão da informação Tipo de Curso, inclusive como item de
    quebra e totalização. Com isto, o relatório agora totaliza por
    Empresa, Tipo de Curso, Curso, Mês e Grupo.
================================================================================
CM$VER      3.03.13     13/06/2003
--------------------------------------------------------------------------------
- Cadastro de Cursos:
 * O campo de Observações foi subdividido em dois:
  Conteúdo Programático e Observações.
- Registro Coletivo de Treinamento:
 * Foram criados campos para informar horários do curso a cada
  dia e instrutores adicionais.
  Com isto, a tela foi dividida em duas abas:
  Dados Básicos e Dados Complementares.
 * Emissão da Carta de Convocação: 
  1) foi criada a  opção para emitir para todos os inscritos
     ou apenas para os selecionados.
  2) Foram acrescentados os campos acima.
- Registro Individual de Treinamento:
 * Foram criados campos para informar horários do curso a cada
  dia e instrutores adicionais.
  Com isto, a tela detalhe foi dividida em duas abas:
  Dados Básicos e Dados Complementares.
================================================================================
CM$VER      3.03.12     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Histórico de Treinamento;
  * Registro Individual de Treinamento.
- Impressão da Lista de Presença:
  * Foi adicionada a opção para a emissão por período;
  * Mudança no Layout do mesmo.
- Registro Coletivo de Treinamento:
  * Possibilidade de selecionar os inscritos coletivamente.
- Histórico de Treinamento:
  * Inclusão do botão para imprimir o Histórico de Treinamento do empregado.
================================================================================
CM$VER      3.03.11     02/06/2003
--------------------------------------------------------------------------------
- Resumo das Atividades de Treimaneto por Grupo:
  * Inclusão do relatório no menu Consultas / Relatórios / ... / Operacionais.
================================================================================
CM$VER      3.03.10     23/05/2003
--------------------------------------------------------------------------------
- Relatórios de Atividade por Curso/Entidade/Treinando:
  * Acrescentada uma coluna contendo o número de presenças da pessoa no curso.
- Registro Coletivo de Treinamento:
  * Inclusão de um botão que imprime o novo relatório chamado Relatório Completo do
  Evento de Treinamento;
  * Redesenho da Carta de Convocação incluindo novas informações.
- Registro das Avaliações dos Participantes:
  * Inclusão de um botão que imprime o novo relatório chamado Planilha para
  Preenchimento pelo Intrutor.
================================================================================
CM$VER      3.03.09     14/05/2003
--------------------------------------------------------------------------------
- Inclusão do cadastro de Locais.
- Registro Individual e Coletivo de Treinamento:
  * Possibilidade de busca do local no cadastro.
================================================================================
CM$VER      3.03.08     17/04/2003
--------------------------------------------------------------------------------
- Cadastro de Cargos:
  * Agora é permitida a seleção dos CBOs (1994 e 2002) a partir de uma tela de
  seleção Padrão.
================================================================================
CM$VER      3.03.07     10/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
- Registro da Lista de Presença em Treinamento:
  * Correção dos Hints dos botões que adicionam e removem pessoas da lista de presença.
================================================================================
CM$VER      3.03.06     21/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.16i
================================================================================
CM$VER      3.03.05     16/01/2003
--------------------------------------------------------------------------------
- Registro Individual de Treinamento:
  * Correção na gravação das Avaliações dos cursos.
================================================================================
CM$VER      3.03.04     08/01/2003
--------------------------------------------------------------------------------
* Registro de Treinamento Individual, Registro de Treinamento Coletivo,
   Lista de Presença e Registro das Avaliações dos Participantes:
   -  Foram feitas algumas mudanças no Layout das Telas.
================================================================================
CM$VER      3.03.03     14/11/2002
--------------------------------------------------------------------------------
- Relatórios de Atividades de Treinamento
  * Foi acrescentada uma opção para consolidar (somando) os registros do mesmo curso,
     para a mesma pessoa, em uma só linha.
- Relatórios de Necessidades de Treinamento
  * Foi acrescentada uma opção para incluir apenas os cursos considerados como 
     Imprescindíveis, apenas os Não Imprescindíveis, ou ambos.
================================================================================
CM$VER      3.03.02     07/11/2002
--------------------------------------------------------------------------------
- Cadastro de Cursos, Registro Individual de Treinamento e Registro Coletivo:
  * A quantidade de horas pode ser fracionária.
- Registro Individual de Treinamento e Registro Coletivo:
  * O Sistema avisa (não impede) quando a pessoa já tem o Registro do Curso.
- Avaliações dos Cursos:
  * Podem ser classificadas em Escalonada e Conceitual.
- Inclusão do Cadastro de Instrutor Interno e Estatística de Avaliação dos Cursos.
================================================================================
CM$VER      3.03.00     28/10/2002
--------------------------------------------------------------------------------
- Registro Coletivo de Treinamento:
  * Foi implementada a Carta de Convocação.
- Implementação do Registro das Avaliações dos Participantes no menu Transações.
- Implementação da Listagem das Entidades de Treinamento em Consultas / Relatórios /
  RH - Treinamento / Cadastrais.
================================================================================
CM$VER      3.02.10     16/10/2002
--------------------------------------------------------------------------------
- Implementação da Lista de Presença no menu Transações.
================================================================================
CM$VER      3.02.09     11/10/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.02.08     04/10/2002
--------------------------------------------------------------------------------
- Transações / Registro Coletivo de Treinamento
  * Para inscrever pessoas em um curso, além da forma já disponível de marcar os nomes
     individualmente, foi introduzido um botão que permite selecionar um grupo de pessoas
     usando a tela seletiva padrão dos sistemas de RH.
================================================================================
CM$VER      3.02.07     03/10/2002
--------------------------------------------------------------------------------
- Relatório Atividade de Treinamento:
  * Na nova versão, no menu Consultas / Relatórios / RH - Treinamento / Operacionais;
    foi acrescentado o Resumo de Treinamento.
  * A versão anterior deste relatório foi excluída do sistema.
================================================================================
CM$VER      3.02.06     17/09/2002
--------------------------------------------------------------------------------
- Relatórios Necessidade de Treinamento e Mapa de Treinamento:
  * Foram transferidos para o menu Consultas / Relatórios / RH - Treinamento / Operacionais.
- Relatório Atividade de Treinamento:
  * Foi acrescentado no menu Consultas / Relatórios / RH - Treinamento / Operacionais;
  devendo ser utilizado quando não há a necessidade do Resumo de Treinamento.
================================================================================
CM$VER      3.02.05     13/09/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.02.04     30/08/2002
--------------------------------------------------------------------------------
- Registro Individual de Treinamento (relativo a Avaliações de Cursos)
  * Alteração no layout do relatório da Avaliação do Curso, evitando truncar o nome do 
     curso e/ou da empresa/entidade.
  * Opção para alterar a Avaliação Global do curso com a média aritmética das avaliações
    individuais dos fatores
================================================================================
CM$VER      3.02.03     19/07/2002
--------------------------------------------------------------------------------
- Registro Coletivo de Treinamento
  * Correção de erro no Banco de Dados ao inserir registros.
================================================================================
CM$VER      3.02.02     15/07/2002
--------------------------------------------------------------------------------
- Registro Individual de Treinamento
  * Ao criar um registro, o sistema assume, como padrão, que o curso é
    por conta da empresa para empregados, e não o é para candidatos;
  * Os botões para Configurar e Restaurar a impressão das Avaliações de
    Cursos só ficam visíveis para Usuários RH.
- Agenda de Treinamento (no Login)
  * Foi acresentada a Data de Término do evento.
================================================================================
CM$VER      3.02.01     14/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.02.00     04/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.01.00     02/05/2002
--------------------------------------------------------------------------------
- Fatores de Avaliação de Cursos
  * Foi implementada esta funcionalidade.
  * Os fatores serão inseridos em Cadastros / Fatores de Avaliação de Cursos.
  * No Registro Individual de Treinamento, pode-se fazer o registro dessas avaliações, 
    para os cursos já concluídos e para os quais haja a indicação de que haverá uma 
    avaliação pelo aluno. Pode-se, também, imprimir a avaliação
================================================================================
CM$VER      3.00.09     25/04/2002
--------------------------------------------------------------------------------
- Registro Individual de Treinamento
  * Alterada a forma de busca do curso, de modo a permitir a opção 
    "possui o texto".
  * A opção para avaliação do curso assumirá "Sim" se for por conta da 
    empresa.
- Relatórios de Atividades
  * Incluída opção para que constem os cursos que não são por conta da 
    empresa.
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de Usuários,
    o que até então não era permitido.
================================================================================
CM$VER      3.00.08     01/04/2002
--------------------------------------------------------------------------------
- Registro Individual de Treinamento
  * Foi corrigido o "travamento" da tela, quando era feita a confirmação final.
================================================================================
CM$VER      3.00.07     25/03/2002
--------------------------------------------------------------------------------
- Alteração da Integração com o processo RAD, de forma a passar o Centro de Custo.
================================================================================
CM$VER      3.00.06     28/01/2002
--------------------------------------------------------------------------------
- Implementação da Integração com o processo RAD;
================================================================================
CM$VER      3.00.05     26/12/2001
--------------------------------------------------------------------------------
- Correção no Relatório de Necessidades por Treinando.
================================================================================
CM$VER      3.00.04     03/12/2001
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas;
- Relatórios de Atividade e Necessidade, por Treinando:
  * Acrescentado o nome do Centro de Custo.
================================================================================
CM$VER      3.00.03     27/09/2001
--------------------------------------------------------------------------------
- Tela Transações / Registro Coletivo de Treinamento: agora permite também a alteração, de forma coletiva e uniforme,  das informações sobre as pessoas inscritas no curso.
================================================================================
CM$VER      3.00.02     06/08/2001
--------------------------------------------------------------------------------
- Mudanças no Layout do Cadastro de Ocorrências;
- Alteração no tamanho dos campos de Custo e Orçamento do Relatório Resumo de Treinamento.
================================================================================
CM$VER      3.00.01     18/06/2001
--------------------------------------------------------------------------------
- O Relatório Tabela de Cursos foi retirado do menu Relatórios e Gráficos Fixos e incluídos no menu Consultas / Relatórios / Cadastro / Tabela de Cursos.
================================================================================
CM$VER      3.00.00     24/05/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5.
================================================================================
CM$VER      2.02.06     08/02/2001
--------------------------------------------------------------------------------
- No Relatório Resumo da Atividade de Treinamento, existem agora 4 opções de
  totalização:
  1 -> Por tipo de curso (a única que havia até então)
  2 -> Por centro de custo
  3 -> Por tipo de curso e centro de custo
  4 -> Por centro de custo e tipo de curso
================================================================================
CM$VER      2.02.05     29/01/2001
--------------------------------------------------------------------------------
- Implementação do Relatório (Fixo):  Mapa de Treinamento.
================================================================================
CM$VER      2.02.04     11/01/2001
--------------------------------------------------------------------------------
- Transações / Registro Coletivo de Treinamento: foi criada uma funcionalidade que
  permite ordenar a lista de empregados não inscritos por Nome ou por Tipo de Contrato /
  Nome.
================================================================================
CM$VER      2.02.03     04/01/2001
--------------------------------------------------------------------------------
- Transações / Registro Coletivo de Treinamento:  correção de algumas funcionalidades.
================================================================================
CM$VER      2.02.02     01/12/2000
--------------------------------------------------------------------------------
- Implementação de função para fazer o Registro Coletivo de Treinamento
  (disponível no menu Transações).
================================================================================
CM$VER      2.02.01     05/09/2000
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.02.00     01/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor).
================================================================================
CM$VER      2.01.08     19/07/2000
--------------------------------------------------------------------------------
- Correção na seleção de pessoas por faixa etária.
================================================================================
CM$VER      2.01.07     31/05/2000
--------------------------------------------------------------------------------
- Opção de cargo alternativo (se existir) na Necessidade de Treinamento;
- Alteração de lay-out no Relatório de Atividades por Treinando.
================================================================================
CM$VER      2.01.06     10/04/2000
--------------------------------------------------------------------------------
- Alterações de lay-out nos Relatórios de Atividades e de Necessidades para 
evitar alguns truncamentos.
================================================================================
CM$VER      2.01.05     23/03/2000
--------------------------------------------------------------------------------
- Nova Atualização com o Padrão CM.
================================================================================
CM$VER      2.01.04     01/03/2000
--------------------------------------------------------------------------------
- Novas opções de seleção de demitidos (por data e por motivo) nas consultas e 
relatórios do módulo, onde isto se aplica.
================================================================================
CM$VER      2.01.02     24/12/1999
--------------------------------------------------------------------------------
- Alteração na forma de reportar dados de orçamento dos cursos no relatório
Resumo de Treinamento.
================================================================================
CM$VER      2.01.01     16/11/1999
--------------------------------------------------------------------------------
- Ampliação das opções de sequência na seleção de pessoas;
- Informações de acompanhamento do Orçamento de Cursos no relatório
  Resumo do Treinamento.
================================================================================
CM$VER      2.01.00     13/10/1999
--------------------------------------------------------------------------------
- Compatibilização com o Padrão Pós 4.25.
================================================================================
CM$VER      2.00.06     14/09/1999
--------------------------------------------------------------------------------
- Implementação do Cadastro de Orçamento de Cursos;
- Correção na seleção de empregados por Centro de Custo.
================================================================================
CM$VER      2.00.05     17/08/1999
--------------------------------------------------------------------------------
- Melhoria no desempenho de algumas telas de consulta e relatórios.
================================================================================
CM$VER      2.00.04     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.00.03     08/04/1999
--------------------------------------------------------------------------------
- Alterações do Relatórios, foi renomeado o Label.
================================================================================
CM$VER      2.00.02     31/03/1999
--------------------------------------------------------------------------------
- Alterações feitas pelo Sr. Eugênio.
================================================================================
CM$VER      2.00.01     25/03/1999
--------------------------------------------------------------------------------
- Foi retirado do projeto o FCMSobre e o FSobre, e todas as suas referências.
================================================================================
CM$ALT}








































































































































































































































