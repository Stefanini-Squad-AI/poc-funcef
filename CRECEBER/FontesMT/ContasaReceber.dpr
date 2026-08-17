{-----------------------------------------------------------------------------------------------------------------------------------
Data      : 13/02/2016
Autor     : Darivaldo Alencar
SIG       : 29271
Descrição : aidiconado fonte: fRegistroCarteiraBoletoMT
-----------------------------------------------------------------------------------------------------------------------------------}
program ContasaReceber;

uses
  Forms,
  uSistema,
  fCmEntrada,
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FPrincipal in 'FPrincipal.pas' {FrmPrincipal},
  FDocxCobrancaMT in 'FDocxCobrancaMT.pas' {FrmDocxCobrancaMT},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FCorrigeDocumentoMT in 'FCorrigeDocumentoMT.pas' {FrmCorrigeDocumentoMT},
  FReimprBloqMT in 'FReimprBloqMT.pas' {FrmReimprBloqMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FConfigBloqMT in 'FConfigBloqMT.pas' {FrmConfigBloqMT},
  FCadTipoxDesembMT in 'FCadTipoxDesembMT.pas' {FrmCadTipoxDesembMT},
  FAgrupaCnabMT in 'FAgrupaCnabMT.pas' {frmAgrupaCnabMT},
  uCtrlRptCAR in '..\Reports\Source\uCtrlRptCAR.pas',
  FCadMensCnabMT in 'FCadMensCnabMT.pas' {FrmCadMensCnabMT},
  FConfigRelatorioMT in '..\..\Cm\Forms\SourceMT\FConfigRelatorioMT.pas' {FrmConfigRelatorioMT},
  rAgingListCliente in '..\Reports\Source\rAgingListCliente.pas' {RptAgingListCliente},
  rPagCentRespon in '..\Reports\Source\rPagCentRespon.pas' {RptPagCentRespon},
  rPosSaldosAnalitico in '..\Reports\Source\rPosSaldosAnalitico.pas' {RptPosSaldosAnalitico},
  rTrialBalance in '..\Reports\Source\rTrialBalance.pas' {RptTrialBalance},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FConsRecLoteMT in 'FConsRecLoteMT.pas' {frmConsRecLoteMT},
  FCadJurosAtuarialMT in 'FCadJurosAtuarialMT.pas' {FrmCadJurosAtuarialMT},
  uCtrlCadJurosAtuaria in '..\CtrlObjects\uCtrlCadJurosAtuaria.pas',
  FParamBloqueteCobrancaMT in 'FParamBloqueteCobrancaMT.pas' {FrmParamBloqueteCobrancaMT},
  FAlteraDadosRemessaMT in 'FAlteraDadosRemessaMT.pas' {FrmAlteraDadosRemessaMT},
  uCtrlAlteraDadosRemessa in '..\CtrlObjects\uCtrlAlteraDadosRemessa.pas',
  FRelCartaCob in '..\Reports\Source\FRelCartaCob.pas' {FrmRelCartaCob},
  FExportaLancMT in 'FExportaLancMT.pas' {FrmExportaLancMT},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FProgressoDuplo in '..\..\Cm\Forms\Source\FProgressoDuplo.pas' {frmProgressoDuplo},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  uCtrlMsgBoleto in '..\CtrlObjects\uCtrlMsgBoleto.pas',
  uDbLinhaMsgBoleto in '..\CtrlObjects\uDbLinhaMsgBoleto.pas',
  FCadastroGridMTImob in 'FCadastroGridMTImob.pas' {frmCadastroGridMTImob},
  uDbMsgBoleto in '..\CtrlObjects\uDbMsgBoleto.pas',
  uCtrlParamBloqueteCobranca in '..\CtrlObjects\uCtrlParamBloqueteCobranca.pas',
  dRelatGerencial_AR in '..\..\CMCAPCARUTILOBJ50\Reports\Source\dRelatGerencial_AR.pas' {dtmRelatorioGerencial_AR},
  FCadModeloEmail in 'FCadModeloEmail.pas' {FrmCadModeloEmail},
  fRegistroCarteiraBoletoMT in 'fRegistroCarteiraBoletoMT.pas' {FrmRegistroCarteiraBoleto}; //Darivaldo Alencar SIG SIG.29271;

{$R *.RES}
{$R CONTASARECEBER_RES.RES}
begin
  frmCMEntrada           := TfrmCMEntrada.Create(Application);

  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Contas a Receber';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgressoDuplo, frmProgressoDuplo);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TdtmRelatorioGerencial_AR, dtmRelatorioGerencial_AR);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;

  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Contas a Receber
================================================================================
CM$VER      3.04.21b    10/06/2008
--------------------------------------------------------------------------------
Pendência: 28055
Tela: Baixa Automática (retorno)
Descrição: Prezados, favor verificar o processo de baixa automática dos arquivos de retorno, pois quando da importação de arquivos com muitos registros como os do dia 20, em um determinado momento apresenta um erro e a importação é cancelada. Somente parte do valor é lançado no finaceiro e alguns documentos simplesmente não são baixados.Isso atrasa a baixa desses débitos no módulo de empréstimo. 
Solução: Criação da tela Cobrança\Recebimento\Automático (retorno em grande volume) sem a exibição dos dados da baixa na tela e com otimizaçoes da rotina.
================================================================================
CM$VER      3.04.21a    31/03/2008
--------------------------------------------------------------------------------
Pendência : 18332 e 23815
Descrição : Foi retirada a chamada para o Relatório de Envio de Documentos para a Contabilidade.
================================================================================
CM$VER      3.04.21     16/01/2008
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.18
Pendência : 18332 e 23815
Descrição : Foram criadas as chamadas para o Relatório de Envio de Documentos para a Contabilidade.
Pendência: 26434
Tela: Lançamentos\Documentos\Registra
Descrição: Se o parâmetro "No Rateio do Documento, Obrigar o Mesmo Plano Previdenciário 
Somente para Desembolsos/Recebimentos Positivos" estiver ligado, pode-se lançar documentos 
rateados por planos diferentes desde que esses planos estejam contidos no relacionamento do 
portadorconta utilizado no lançamento.
Pendência: 26515
Tela: Lançamentos\Documentos\Registra
Descrição: Retirar a trava que o sistema esta fazendo para selecao do centro de custo. Ao selecionar o tipo de desembolso, somente estao vindo os centros de custo que tem algum relacionamento com o tipo de desembolso na parametrizacao contabil predominante. 
================================================================================
CM$VER      3.04.20     09/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
Implementação de registro de eventos de documentos no Contas a Receber.
================================================================================
CM$VER      3.04.19     21/06/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.16
Pendencia : 25458
Tela      : Cobrança \ Recebimento \ Manual
Descrição : O Sistema estava consultando as tabelas do CAP, foi corrigido para consultar as do CAR.  No procura cliente se passar um cliente inválido, retornará uma mensagem de Erro.
================================================================================
CM$VER      3.04.18e    15/06/2007
--------------------------------------------------------------------------------
Pendência: 25538  Cobrança/Recebimentos/Baixa automática
Descrição: Corrigido o erro em que ao gerar crítica de sistema, não estava
sendo exibida no arquivo de log.
================================================================================
CM$VER      3.04.18d    11/06/2007
--------------------------------------------------------------------------------
Pendência: 25405
Tela: COBRANÇA/ COBRANÇA BANCARIA / DOCUMENTOS X MENSAGEM
Descrição: Corrigido o erro gerado ao escolher a opção para digitar uma mensagem 
para documentos pendentes e selecionar qualquer tipo de cobrança.
================================================================================
CM$VER      3.04.18c    18/05/2007
--------------------------------------------------------------------------------
Pendência: 25329 Sistema\Utilitários\Importação de lançamentos\Padrão
Descrição: Corrigido o erro em que alguns lançamentos não estavam sendo contabilizados
================================================================================
CM$VER      3.04.18b    18/05/2007
--------------------------------------------------------------------------------
Pendência: 24143 Consultas/Relatórios/Gerenciais/Valores por Centro de Custo
Descrição: Implementado relatório em que exibe os documentos em aberto/baixados
por Centro de Custo.
================================================================================
CM$VER      3.04.18a    11/05/2007
--------------------------------------------------------------------------------
Pendência: 25329 Sistema\Utilitários\Importação de lançamentos\Padrão
Descrição: Corrigido o erro em que alguns lançamentos não estavam sendo contabilizados
================================================================================
CM$VER      3.04.18     03/04/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
Pendência: 24704
Tela     : Consultas/Documentos
Descrição: Unificação da tela de consulta documentos.
Pendência: 24450
Tela     : Lançamento \ Documentos \ Registra
Descrição: Trava o lançamento do CAP/CAR se o plano previdenciário selecionado no rateio do
documento não estiver na lista de planos previdenciários associados a contacorrente indicado pelo
portador-forma selecionado no documento.
================================================================================
CM$VER      3.04.17b    08/03/2007
--------------------------------------------------------------------------------
Pendência: 24678 - Sistema/Utilitários/Importação de lançamentos/Padrão
Descrição: Corrigido o erro em que mesmo com a parametrização contábil correta,
o sistema fazia a crítica de "conta contábil não cadastrada".
Pendência: 24478 - Sistema/Utilitários/Importação de lançamentos/Padrão
Descrição: Corrigido o erro em que não se estava gravando centro de custo para os
documento importados.
Pendência: 22654 (reabertura) - Cadastros/Impostos com Tabela de Retenção
Descrição: Corrigida habilitação da natureza da operacão e do Código da GPS, de acordo com o tipo de imposto;
================================================================================
CM$VER      3.04.17a    05/03/2007
--------------------------------------------------------------------------------
Pendência: 24574 Cobrança/Recebimento/Estorna-Exlui/Lote
Descrição: Corrigido o erro em que ao excluir a baixa, não estava desfazendo
a regularização do financeiro corretamente
================================================================================
CM$VER      3.04.17     15/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência: 24201
Tela     : Lançamento \ Documentos \ Registra
Descrição: Corrigido o erro de duplicação de rateio no momento de inserção de documento
           quando acionado o botão de OK de baixo, gerando uma crítica quando a
           regra de negocio seja violada.
Pendência: 24132
Tela     : Cobrança \ Recebimento \ Manual
Descrição: O label do fornecedor é modificado de acordo com o sistema, se for
           Contas a pagar, mostrará "Fornecedor" e se for Contas a receber,
           mostrará "Cliente".
Pendência 24064 - CAP e CFINAN
Descrição: Remodelar o processo de CPMF (lançamento do documento/contabilização) conforme especificação em anexo
================================================================================
CM$VER      3.04.16d    09/02/2007
--------------------------------------------------------------------------------
pendência 24462
AO EMITIR O BOLETO, O "NOSSO NUMERO" ESTÁ SENDO ZERADO, NÃO SEGUINDO O CRITERIO DE CONCATENAÇÃO DO NUMERO. 
================================================================================
CM$VER      3.04.16c    05/02/2007
--------------------------------------------------------------------------------
Pendência: 24396 Sistema/Utilitários/Importação de lançamentos/Padrão
Descrição: Corrigido o erro em que o campo PLACONTA não estava sendo gravado
na tabela DOCUMENTO, impossibilitando a baixa do documento.
================================================================================
CM$VER      3.04.16b    02/02/2007
--------------------------------------------------------------------------------
Pendência: 24373
Tela : Lançamentos\Dopcumentos\Registra
Descrição: Ao gerar um boleto, o sistema trava. O usuário identificou que, se houver outro usuário com a tela de geração de boleto aberta, nenhum outro consegue gerar o boleto, apresentando o travamento conforme a tela em anexo. Após o primeiro usuário imprimir o boleto, a tela é liberada para o segundo usuário, criando uma "fila".
================================================================================
CM$VER      3.04.16a    17/01/2007
--------------------------------------------------------------------------------
Pendência: 24201 - Lançamento \ Documentos \ Registra
Descrição: Corrigido o erro de duplicação de rateio no momento de inserção de documento
           quando acionado o botão de OK de baixo, gerando uma crítica quando a
           regra de negocio seja violada.
================================================================================
CM$VER      3.04.16     11/12/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.13
Pendência: 23710
Tela: Cobrança\Recebimento\Manual
Descrição: O filtro "Data Programada Inicial" e "Data Programada Final"
apresentado nesta tela não está funcionando, não mostrando os valores.
É apresentado erro no lançamento de documentos no Contas a Receber.
Pendência: 23621
Tela: Cobrança\Mensagens Para Boletos
Descrição: Criar um cadastro de mensagem padrão para ser selecionado no momento da impressão do boleto.
Pendência: 22486
Telas : Tesouraria\Pagamentos\Pagamentos X Recebimentos e todas as telas de Baixa de documentos do Cap e Car  
Descrição: Utilizar somente portadores-forma específicos para encontro de contas (flag PORTADORFORMA.FLGENCCONTAS = 'S') para 
fazer o encontro de contas. Nas Telas de Baixa, utilizar os demais portadores-forma.
================================================================================
CM$VER      3.04.15e    18/12/2006
--------------------------------------------------------------------------------
Pendência: 23195 (ajuste)
Tela: Recebimento automático (retorno)
Descrição do problema: Na baixa automatica, para os casos de liquidação em cheque, 
a rotina não está considerando o float do pagamento, conforme informado no campo 218 do arquivo.
================================================================================
CM$VER      3.04.15d    11/12/2006
--------------------------------------------------------------------------------
Pendência: 23195
Tela: Recebimento automático (retorno)
Descrição do problema: Na baixa automatica, para os casos de liquidação em cheque, 
a rotina não está considerando o float do pagamento, conforme informado no campo 218 do arquivo.
================================================================================
CM$VER      3.04.15c    29/11/2006
--------------------------------------------------------------------------------
Pendência: 23835 Cobrança/Recebimento/Manual
Descrição: Corrigido o erro em alguns parâmetros da tela nos quais não estavam sendo
sensibilizado
================================================================================
CM$VER      3.04.15b    27/11/2006
--------------------------------------------------------------------------------
Pendência: 23824  Cobrança/Recebimento/ Automático (retorno)
Descrição: Corrigido o erro em que a data da disponibilidade não estava sendo sensibilizada
Pendência: 23832 Sistema/Configuração/Parâmetros do sistema
Descrição: Corrigido o erro em que consistia permitir manipulação dos controles na
tela sem apertar o botão Alterar.
================================================================================
CM$VER      3.04.15a    14/11/2006
--------------------------------------------------------------------------------
pendência: 23740
Descrição: 
1) Pagamento Manual. Os documentos de CPMF passaram a aparecer para pagamento 
2) Criação do Lote. Os valores estão sem máscara 
3) Pagamento Manual. Ao se baixar um documento a grade para seleção está sendo fechada, necessitando nova consulta 
4) Criação do Lote. O sistema está obrigando o preenchimento do Favorecido
================================================================================
CM$VER      3.04.15     04/10/2006
--------------------------------------------------------------------------------
Liberação para o padão 5.10.12
Pendência: 23463    Cadastros / Tipo de Recebimento / Parametrização Contabil Predominante
descrição: Implementado o Filtro de patrocinadora no monta select.
Pendência : 22448
Tela: Cobrança\Emissão de Recibo\Configura
Processo: Implementação do recibo
Pendência : 22819
Tela: Cobrança\Cobrança Bancária\Boletos Pré Impresso
Processo: Implementação do filtro para o arquivo unibanco
Pendência : 23195
Tela: Cadastros\Códigos Bancário para Cobrança
Processo: Implementação do FLOAT na liquidação do cheque, na baixa automática
Pendência : 23167
Tela: Cadastros\Convênios Bancários
Processo: Implementação do bloqueio da alteração da tela quando o convênio já foi
          utlizado.
Pendência : 22278
tela :\sistema\Configuração\Parâmetros
processo: Lançamento de documentos.
Descrição : Não permitir lançamentos de documentos de contas a pagar para planos diferentes. Para se determinar o mesmo plano do documento:
            Subplanos do mesmo plano possuim o campo PLANPREVCONTABIL.IDPLANOPREVPREV igual, ou
            o campo PLANPREVCONTABIL.CODSPC igual. Caso esteja parametrizado.
================================================================================
CM$VER      3.04.14     19/07/2006
--------------------------------------------------------------------------------
Liberação para o padrão 5.10.11
Pendência : 22079, 22409, 22249
Descrição : 22079 implementação da impressão de ficha de compensação ao lançar um
documento com portador forma que tenha um modelo de ficha de compesação associado;
22409 desabilitar os controles da tela se não estiver em modo de inserção ou edição;
22249 não permitir a inserção manual na aba contas de baixa.
================================================================================
CM$VER      3.04.13     13/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.10
Pendência : 22474
Tela: Lançamento\Documento\Registra
Descrição : Verificação do Bloqueio da Disponibilidade Financeira no momento
            da baixa e da exclusão .
            
Pendência : 21698
Tela: Novos Atalhos
Descrição :  Adição de botão de atalho para a tela de lançamento de documento.
Pendência : 22434
Tela: Cadastros\ Contas Caixa x Tipo Cobrança
Descrição :  Este campo será utilizado na tela de lançamentos de documentos.
             Quando selecionado um tipo de documento listar apenas o portador/forma
             com o tipo de documento parametrizado.
             Caso esta consulta não retorne nenhuma linha, listar todos os registros
              de portador/forma.
Pendência : 22463
Tela: Cadastros\Tipo Desembolsos
Descrição : Este campo indica o número de dias úteis para vencimento do documento,
            caso não seja preenchido, vale o parâmetro do sistema.
Pendência : 19394
Tela: Cobrança\Cobrança Bancária\Emissão\Ficha de Compensação 
Descrição : Criar parâmetro que obrigue o preenchimento do campo "Usuário que lançou o Documento"
Pendência 21102
Tela: Recebimento Automático (retorno)
Descriçaõ: Customizar forma de baixa automática onde a forma de recebimento deverá ser lida pelo arquivo, e não informada manualmente como é feito hoje. Desta forma uma única baixa sensibilizará o financeiro com N baixa que serão agrupadas pela forma de recebimento informada no arquivo de retorno. Verificar a data Float do portador forma.
Pendência 19580
Tela: \Cobrança \Correção Automática de documentos
1) Quando a parametrização não está correta o sistema aparentemente está modificando o campo de DOCUMENTO.DATACORRECAO sem executar o processo (Verificar)
2) Utilizar a CMCapCarObj50.uCtrlJurosCorrecao ao invés de CMBack50.uJurosCorrecao
Pendência 22515
Tela: Sistema \Configuração \Parâmetros do Sistema
        Lançamento\Documentos\Registra
Descrição: 
 -Criado o conceito de Parametrização Contábil Predominante
 -Reestruturada a arvore de menu do cadastro 
 - Verificar documentação em anexo
================================================================================
CM$VER      3.04.12e    30/06/2006
--------------------------------------------------------------------------------
Pendencia 22455 (ajuste)
Tela: Emisao\Boletos pre impressoa e arquivos IntBanco
Descrição: O Filtro da tela nao funciona.
================================================================================
CM$VER      3.04.12c    27/06/2006
--------------------------------------------------------------------------------
Pendência : 22455  (ajuste: quando o cliente possui vários documentos grupados de tipos diferentes, os mesmos tem que gerar uma única linha no arquivo bancário)
Emissao do arquivo de cobrança
Descrição do problema: Ocorreu um erro na geração do arquivo intbanco, onde os valores do CodgrupoCnab 52053, não foram agrupados.
O valor total correto seria: R$ 4.331,22, sendo que o valor constante no arquivo era de apenas R$ 156,28, que pertencia a apenas um dos documentos.
================================================================================
CM$VER      3.04.12b    08/06/2006
--------------------------------------------------------------------------------
Pendência : 22455  
Emissao do arquivo de cobrança
Descrição do problema: Ocorreu um erro na geração do arquivo intbanco, onde os valores do CodgrupoCnab 52053, não foram agrupados. 
O valor total correto seria: R$ 4.331,22, sendo que o valor constante no arquivo era de apenas R$ 156,28, que pertencia a apenas um dos documentos.
================================================================================
CM$VER      3.04.12a    19/05/2006
--------------------------------------------------------------------------------
Pendência : 22358  Consultas/Relatórios/Gerencias/Valores recebidos
Descrição : Corrigido o erro em que o valor do alterador e valor bruto do
            documento estavam vindo zerados
================================================================================
CM$VER      3.04.12     20/04/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09
Histórico de alterações efetuadas no módulo Contas a Receber
================================================================================
CM$VER      3.04.11d    20/04/2006
--------------------------------------------------------------------------------
Pendência: 22019
Descrição do erro: Emissão de fichas de compensação com duplucidade do campo nosso número.
================================================================================
CM$VER      3.04.11c    12/04/2006
--------------------------------------------------------------------------------
pendência: 21669
Descrição: O sistema está permitindo alterações e exclusões de lançamentos quando a disponibilidade financeira está bloqueada. No padrão 7 o erro também ocorre.
Fazer também no CAR.
pendencia: 21647
Descrição: O sistema deve permitir o lançamento de alteradores mesmo após a baixa do documento.
pendencia: 21735
Descrição: Quando o imposto for pela  data de lançamento, não pode haver a mensagem " O documento não pode ser excluido/ estornado. Já foi gerado um DARF para pagamento."
================================================================================
CM$VER      3.04.11b    14/03/2006
--------------------------------------------------------------------------------
Pendência: 21669 (CAR)
Tela     : Lançamento\Documento\Registra
Descricao: Não permite incluir, alterar e excluir os documentos com disponilidade financeira                 bloqueada.
Pendência 21647 (CAR)
Tela Recebimento Automático
Descrição: Nao está Baixando os documentos agrupados cujo valor total contante no arquivo
de retorno estão divergentes dos valores da base.
================================================================================
CM$VER      3.04.11a    23/02/2006
--------------------------------------------------------------------------------
Pendência: 21632
Tela: Cobrança\Cobrança bancária\Emissão\Ficha de Compensação\Impressão
Descrição: resolução do problema da impressão do nosso número do documento na linha digitável do boleto.
================================================================================
CM$VER      3.04.11     23/01/2006
--------------------------------------------------------------------------------
pendência para o padrão 5.10.08
Pendência: 19305
Tela: Cobrança\Cobrança bancária\Agrupamento de boletos por clientes.
Descrição: Criar a possibilidade de selecionar todos os documentos em aberto de uma unica vez,
                 ao inves de ter que selecionar um a por um.
================================================================================
CM$VER      3.04.10d    06/01/2006
--------------------------------------------------------------------------------
pendência 21215
Tela: \cobrança\cobrança bancária\Emissão\Ficha de Compensação.
Descrição: O nosso número está gerando novo nosso número sempre, mesmo quando
se escolhe para não gerar novo nosso número.
================================================================================
CM$VER      3.04.10c    28/12/2005
--------------------------------------------------------------------------------
pendência 21153
Tela: \cobrança\cobrança bancária\Emissão\Ficha de Compensação.
Descrição: O sistema trava ao imprimir boleto do banespa quando o nosso número = 1000009
================================================================================
CM$VER      3.04.10b    26/11/2005
--------------------------------------------------------------------------------
pendência 21127
Tela: \cobrança\cobrança bancária\Emissão\Ficha de Compensação.
Descrição: Ao emitir mais de uma ficha o nosso numero está saindo repetido.
================================================================================
CM$VER      3.04.10a    24/11/2005
--------------------------------------------------------------------------------
pendencia 20812 -
Tela imprimir \ficha de compensação
descrição: Erro ao imprimir boleto do banespa
================================================================================
CM$VER      3.04.10     08/08/2005
--------------------------------------------------------------------------------
Liberação para o padrãp 5.10.07
Pendência 19543
Telas: Diversas
Descrição retirar alguns campos não mais utilizados.
================================================================================
CM$VER      3.04.09     16/06/2005
--------------------------------------------------------------------------------
Pendência : 19038 Cobrança\Recebimento\Manual
Descrição : Passar a gravar a data da disponibilidade na baixa de documentos, vindo de todos os módulos
Pendência: 19308
Erro de sql com a cláusula NOWAIT 
Pendência 19281
Tela: Lançãmentos\Documentos\Registra
Descrição do erro: ao selecionar um documento para alteração, a contabilização não está ficando completa.
Pendência 17317
Tela: Sistema\Configuração\Históricos Contábeis
Descrição: Gravar o histórico contábil configurável.
Pendência 18771
Tela: Lançamentos\Documentos\Agrupa Parcelas
Descrição: Fazer Agrupamentos/Parcelamentos de documentos com múltiplas contas de baixa.
Pendência : 19097
Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
Pendência 18693
Descrição: Ajuste do método AjustaDataFloat, o cálculo da data com float será igual em todos os sistemas.
Pendência : 18937
Tela: Operações\Lançamentos\Documentos
Descrição : Desabilitar os botoes de inserir excluir e alterar da aba de contabilização
e deletar a contabilizacao ao sair da aba.
Pendência: 19024 (CMintBancoMT50)
Layout: Recebimento do arquivo de retorno do Banco Real CNAB 240
Descrição do erro: Não está facendo o recebimento automático com este layout.
Pendência 19042
Layout: Bradesco Pagamento de Fornecedores CNAB 500 (CMintBancoMT50)
Descrição do erro: ocorre erro de cálculo do dígito verificador no recebimento pelo banco quando a forma de pagamento é uma ficha de compensação.
Pendência 18844
Telas: Emissão de Boletos pré impressos e Arquivos IntBanco, Impressão de fichas de compensação.
Descrição do erro: não permitir que usuários concorrentes que geram arquivos bancários com o mesmo nossoNumero para documentos distintos.
Pendência 18641 - Tesouraria \ Pagamento \ Pagamentos x Recebimentos
Liberada a regularização de lançamentos com data posterior a de hoje
Pendência  : 18368
Descrição  : Não permitir que seja possível alterar a DATAPROGRAMADA
             para um período bloqueado da Contabilidade
Histórico de alterações efetuadas no módulo Contas a Receber
================================================================================
CM$VER      3.04.08r    06/05/2005
--------------------------------------------------------------------------------
Pendência: 19024 (CMintBancoMT50) *** ajuste ***
Layout: Recebimento do arquivo de retorno do Banco Real CNAB 240
Descrição do erro: Não está facendo o recebimento automático com este layout.
================================================================================
CM$VER      3.04.08q    22/04/2005
--------------------------------------------------------------------------------
Pendência : 18937
Tela: Operações\Lançamentos\Documentos
Descrição : Desabilitar os botoes de inserir excluir e alterar da aba de contabilização
e deletar a contabilizacao ao sair da aba.
Pendência: 19024 (CMintBancoMT50)
Layout: Recebimento do arquivo de retorno do Banco Real CNAB 240
Descrição do erro: Não está facendo o recebimento automático com este layout.
Pendência 19042
Layout: Bradesco Pagamento de Fornecedores CNAB 500 (CMintBancoMT50)
Descrição do erro: ocorre erro de cálculo do dígito verificador no recebimento pelo banco quando a forma de pagamento é uma ficha de compensação.
================================================================================
CM$VER      3.04.08p    01/04/2005
--------------------------------------------------------------------------------
Pendência 18844
Telas: Emissão de Boletos pré impressos e Arquivos IntBanco, Impressão de fichas de compensação.
Descrição do erro: não permitir que usuários concorrentes que geram arquivos bancários com o mesmo nossoNumero para documentos distintos.
================================================================================
CM$VER      3.04.08o    06/04/2005
--------------------------------------------------------------------------------
Pendência 18641 - Tesouraria \ Pagamento \ Pagamentos x Recebimentos
Liberada a regularização de lançamentos com data posterior a de hoje
================================================================================
CM$VER      3.04.08n    24/02/2005
--------------------------------------------------------------------------------
Pendência 18508
Tela:Consultas\Relatórios\Emissões diversas\Recolhimento de Encargos (cap)
Descrição do erro: - Os impostos dos documentos estornados do módulo Contratos não estão vindo no relatório com os valores zerados.
                   - Implementação feita da pendência 18584
================================================================================
CM$VER      3.04.08m    21/02/2005
--------------------------------------------------------------------------------
Pendência : 18538
Descrição : Incluir o filtro para impressão por patrocinadora
Pendência : 18539
Descrição : Incluir o filtro para impressão por patrocinadora
Pendência : 18696
Descrição : Ao fazer o recebimento manual o sistema não estava considerando, o parametro
            considera FLOATS para fins de semana, qdo tem feriado subsequente ao fim de semana.
================================================================================
CM$VER      3.04.08l    15/02/2005
--------------------------------------------------------------------------------
Pendência : 17839
Descrição : Correção onde ao gerar o relatório contendo documentos que sejam
            "Lança e Baixa Automaticamente", ou seja baixa com OPERACAO 10,
            o campo valor Líquido estava vindo com valor negativo.
Pendência : 18584
Descrição : Corrigido o erro do campo DATABAIXA (RecbtoPagto).
            Estava gravando a data com o float (igual à do campo DATACFLOAT).
Pendência : 18603
Descrição : Correção de erro na baixa de documentos
================================================================================
CM$VER      3.04.08k    02/02/2005
--------------------------------------------------------------------------------
Pendência : 18605
Descrição : Corrigido o erro na tela (Consula\Documento) ao clicar no botão Sair
Pendência : 18595
Descrição : Corrigido o erro que após a importação de lançamentos no CAR não aparecia
            nos documentos lançados a informação de Contas/Caixas x Tipo Cobrança na
            guia Dados para o Lançamento e na guia Geral o campo Tipos de Cobrança.
================================================================================
CM$VER      3.04.08j    27/01/2005
--------------------------------------------------------------------------------
Pendência: 18546
Tela: Sistema\Utilitários\Imortação de Lançamentos
Descrição do ERRO: Não está funcionando a importação de lançamentos.
================================================================================
CM$VER      3.04.08i    27/01/2005
--------------------------------------------------------------------------------
Pendência 17666 - Gravação da Data de Disponibilidade na  tabela Documento 
quando da baixa dos documento vindo do sistema de Investimentos
================================================================================
CM$VER      3.04.08h    20/01/2005
--------------------------------------------------------------------------------
Pendência 18494
Layout: Todos que utilizam o número sequencial de emissão de arquivos bancários
Descrição: gerar a seqüência de emissão de arquivos bancários por convênio bancário.
================================================================================
CM$VER      3.04.08g    14/01/2005
--------------------------------------------------------------------------------
- Pendencia: 18324
           Não permitir que documentos importados pelo CAP/CAR
           sejam alterados.
================================================================================
CM$VER      3.04.08f    13/01/2005
--------------------------------------------------------------------------------
- Pendência 18323 - Transferência de Classificação
  Gerando apenas uma planilha de transferência
  Obrigando a transferência contábil
  Corrigindo a transferência quando for um documento com múltiplas contas de baixa
  Corrigindo o parâmetro sincroniza
  Criando o parâmetro "Tipo de Operação"
================================================================================
CM$VER      3.04.08e    11/01/200
--------------------------------------------------------------------------------
Pendência: 18316
  Descrição: Implementar um relatório para que saia valores separados por plano
================================================================================
CM$VER      3.04.08d    29/12/200
--------------------------------------------------------------------------------
* acerto na transferencia de classificação
Pendência: 17884
Layout: Todos.
Descrição: nas telas de emissão de arquivos intbando das Folhas de Benefício e de pagamento não exibir o arquivo gerado.
================================================================================
CM$VER      3.04.0c     21/12/2004
--------------------------------------------------------------------------------
Pendencia: 18245
Tela: Cobrança\Cobrança Bancária\Mensagens x Documentos
Descrição: Permite que sej gravado mensagem para um grupo de
documentos quando o documento selecionado está agrupado.
================================================================================
CM$VER      3.04.08b    20/12/2004
--------------------------------------------------------------------------------
Pendencia: 18246
Tela: Cobrança/Cobrança Bancária/Emissão/Ficha de Compensação/Impressão
Descrição: está imprimindo separadamente os documento com data de emissao
diferentes mesmo quando o documento está agrupado.
================================================================================
CM$VER      3.04.08a    17/12/2004
--------------------------------------------------------------------------------
- Ajuste no recebimento automático do layout cnab240 do banco do brasil.
Pendência: 18107 - Lançamento de Documentos (Segregação Virtual Ativa)
Implementada a crítica de Programa x Plano Previdenciário
================================================================================
CM$VER      3.04.08     14/12/2004
--------------------------------------------------------------------------------
Pendência: 17672 (CAR)
Tela: Cobrança\Cobrança Bancaria\Emissao\Boletos pré-impressos e arquivos intbanco
Descrição: Quando o portador-forma tem a opção de remessa e ficha de compensasão, não está emitindo e ainda apaga o nosso numero.
Pendência: 18013 (CAR) ajuste
Tela: Cobrança\Recebimento\Automático (retorno)
Descrição: Executar o commit da tranzação a cada documento baixado com sucesso, os documentos não baixados com sucesso serão listados no arquivo de log de erro
Correção de problema na aprovação de RAD por documentos.
Pendência: 17102  (CAP CAR)
Tela: Consultas\Relatórios\emissoes diversas\recolhimento de encargos
Descrição: Ao estornar um documento os alteradores estornados devem apracer com os valores zerados no relatório .
Pendência: 18178 (CAP CAR)
Tela: Lançamento\Documento\Registra
Descrição: não permitir que se altere ou exclua um documento se o mesmo contar num arquivo emitido ao banco ou se hover um boleto emitido para o mesmo.
Pendência: 18013 (CAR)
Tela: Cobrança\Recebimento\Automático (retorno)
Descrição: Executar o commit da tranzação a cada documento baixado com sucesso, os documentos não baixados com sucesso serão listados no arquivo de log de erro
Pendência: 17696 (CAP)
Tela: Consulta\Relatórios\Contábis\Cap x Contabilidade
Descrição: Disponibilizar para o relatório 2 colunas: uma com a diferença entre Créditos contábeis e Créditos Cap e outra
com a diferença entre os Débitos contábeis e e Débitos Cap.
Pendência: 15382
Tela: Cadastros\Alterador x Centro de Custo x Conta Contábil
Descrição: Exibir sempre o código externo do centro de custo e filtar pelo campo idplancentcust.
Pendência: 17587
Tela: Lançamento \Documentos \Registra
Elimiar Plano Previdenciários Contábeis inativos da visualiação.
Pendência: 17193 - Lançamento \Documentos \Registra
Ajustes no sistema para permitir Plano Administrativo
Pendência: 17193 - Segregação de lançamentos na origem
Preparando o sistema para segregação na origem e plano administrativo
================================================================================
CM$VER      3.04.07o    19/11/2004
--------------------------------------------------------------------------------
Pendência: 18122 (CAR)
Tela: Cobrança/ Emissão/ Ficha de Compensação/ Imprimir
Descrição: As mensagens dos boletos estão saindo desenquadradas.
================================================================================
CM$VER      3.04.07n    08/11/2004
--------------------------------------------------------------------------------
Pendência: 16929
Tela: Consulta\Relatórios\Emissões Diversas\Guia de Recebimento
Descrição: Foi colocado a opção para apresentar ou não Lançamentos de Provisionamento Contábil
================================================================================
CM$VER      3.04.07m    09/11/2004
--------------------------------------------------------------------------------
- Pendência 17465 - Gravar corretamente o histórico da conciliação da CPMF.
- Pendência 17669 - Alteração na geração de documento para não gravar mais o campo unidnegoc na tabela documento.
================================================================================
CM$VER      3.04.07l    18/10/2004
--------------------------------------------------------------------------------
Pendência: 16971
Tela: Sistema\configuração\Parâmetros do sistema
Descrição: Implementação do parâmetro do Cap e do Car para Integração com o orçamento,
para o cap e o car esse parâmetro agora será gravado na tabela ParamCap.
================================================================================
CM$VER      3.04.07k    29/09/2004
--------------------------------------------------------------------------------
Pendência: 17785
Tela: Consultas\Relatórios\Recolhimento de Encargos
Descrição: O relatório não estava trazendo os encargos de INSS de Autônomos.
================================================================================
CM$VER      3.04.07j    15/09/2004
--------------------------------------------------------------------------------
Pendência: 16954
Tela: Baixas dde documentos(car) 
Descrição: criação de ium parâmetro que possibilita fazer os floats do CAR considerarem somente dias úteis.
Pendência: 17687
Tela: Cosultas\relatórios\Contabeis\Cap x Contabilidade (cap)
Descrição: o usuário não consegue alterar os campos do relatório, pois os mesmos não aparecem na edição do mesmo.
Pendência: 17684
Tela: Lançamentos\Documentos\Registra
Descrição: Caso o usuário escreva como histórico do lançamento do CAP/CAR a palavar "estorno", o montaselect não traz o documento na consulta.
================================================================================
CM$VER      3.04.07i    13/09/2004
--------------------------------------------------------------------------------
Pendência: 17080 (CAP)
Tela: Consultas\Relatórios\Emissões diversas\Demonstrativo de Atos de gestão por AP
Descrição: criação do filtro que possibilita que o usuário escolha se exibe ou não os 
documentos com saldo zerado.
================================================================================
CM$VER      3.04.07h    30/08/2004
--------------------------------------------------------------------------------
Pendência : 17315  (CAP)
Tela: Consultas\Relatórios\Emissões Diversas\Requisição de Pagamentos.
Descrição :  criado o checkBox para filtrar os ususários desabilitados.
================================================================================
CM$VER      3.04.07g    30/08/2004
--------------------------------------------------------------------------------
Pendência : 17283
Tela: Cobrança\Cobrança Bancária\Libera Reimpressao de Bloquetos
Descrição : O sistema está gerando um nosso número diferente mesmo quando se escolhe para não gerar novo nosso número..
================================================================================
CM$VER      3.04.07f    27/08/2004
--------------------------------------------------------------------------------
Pendência : 17279
Tela: Lançamentos\Documentos\Registra
Descrição : trazer os campos preenchidos do na inserção rateio como default e
não permitir inserir registros repetidos de rateio.
================================================================================
CM$VER      3.04.07e    26/08/2004
--------------------------------------------------------------------------------
- Pendencia 17412 - Criação do campo "Data de Disponibilidade" na tela de recebimento automático
- Pendencia 14404 - Ajuste no processo de regularização de lançamentos não identificados no CFINAN quando baixar o documento
================================================================================
CM$VER      3.04.07d    17/08/2004
--------------------------------------------------------------------------------
Pendência: 17128
Tela: Consultas\Relatórios\Emissões Diversas\Ficha Financeira de Pagamento e Recebimento
Descrição: O Relatório não está exibindo o Plano Previdenciário correto da contabilização.
================================================================================
CM$VER      3.04.07c    12/08/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 17344
  Tela\Opçao No Sistema: Sistema | Utilitários | Importação de Lançamentos Padrão
  Alteração na consulta que verifica se já existe rateio identico ao fornecido acrescentando 
os campos IDPATRO, IDPLANOPREV  e  IDPROGRAMA à consulta.
  Alteração para que caso o documento (NODOCUMENTO) já exista na tabela Documento
para o mesmo fornecedor/cliente, gera uma mensagem de erro.
================================================================================
CM$VER      3.04.07b    05/08/2004
--------------------------------------------------------------------------------
Pendência: 17290
Tela: Lancamentos\documentos\Registra\contabilizacao
Descricao: Erro no combo de centro de custo ao clicar no botão de OK do detalhe.
Pendência: 17291
Tela: Consultas\Relatórios\Emissoes diversas\ Autorizacao de Pagamentos
================================================================================
CM$VER      3.04.07a    02/08/2004
--------------------------------------------------------------------------------
Pendência: 17102
Tela: Consultas\Relatórios\Emissões Diversas\Recolhimento de Encargos
Descrição: Os alteradores de um documento que foi estornado devem aparecer com o valor = 0, pois os mesmos foram estornados também.
================================================================================
CM$VER      3.04.07     19/07/2004
--------------------------------------------------------------------------------
Pendência 16555
Tela: Cobrança\cobranca bancaria\emissão\Ficha de compesnsação\Impressão
Descrição: Colocar o campo de mensagem do mesmo tamanho que pode ser impresso;  
                 Aumentar a quantidade de caracteres de cada mensagem para no máximo 63 caracteres.
Pendência: 16974
Tela: Cadastro\Tipo de Recebimento
Descrição Retirar o checkbox de obrigatoriedade de Compromisso orçamentário.
Pendência: 16975
Tela: Lançamentos\Documento\Registra 
Descrição: Retirar o campo de Compromisso Orçamentário da pasta rateio.
Pendência 17202
Tela: Tesouraria \ Baixa Manual
Descrição :
Correção da apresentação do Documento na tela de Lançamento de Alteradores
================================================================================
CM$VER      3.04.06q    08/07/2004
--------------------------------------------------------------------------------
Pendencia 16967 - Acerto no processo de Transferencia de Classificacao
================================================================================
CM$VER      3.04.06p    30/06/2004
--------------------------------------------------------------------------------
Pendência: 17115
Tela: Importação de lançamentos
Descrição: ao importar lançamentos, os documentos deverão ser contabilizado por plano e patro comforme o arquivo.
================================================================================
CM$VER      3.04.06o    29/06/2004
--------------------------------------------------------------------------------
Pendencia 16170 (ajuste)
Tela: Cobrança\Recebimento\Automático (retorno)
Descrição: Ajuste no recebimento automático.
================================================================================
CM$VER      3.04.06n    28/06/2004
--------------------------------------------------------------------------------
- Pendencia 16967 - Acerto na rotina de Transferencia de Classificação
================================================================================
CM$VER      3.04.06m    24/06/2004
--------------------------------------------------------------------------------
Pendência : 16855
Tela: Tesouraria\Pagamentos\Automático
Descrição : Verifica se o lote já foi baixado antes de processar a baixa.
Isso evita que usuários concorrentes que tenham selecionado o mesmo lote processem a mesma baixa.
================================================================================
CM$VER      3.04.06l    23/06/2004
--------------------------------------------------------------------------------
Pendência: 17041
Tela: cadastros\Contas Caixa X tipo de recebimento
Descrição: criado o check box 'Imprime mensagem no verso'
================================================================================
CM$VER      3.04.06k    18/06/2004
--------------------------------------------------------------------------------
Pendência: 16992
Tela: Lançamento\Documentos\Registra
Descrição: no lançamento de documentos com rateio pré-definido, não está lançando os
percentuais de crédito(passivo)  e também não esta gravando os campos CodCentrocusto 
e nome do centro de custo.
================================================================================
CM$VER      3.04.06j    16/06/2004
--------------------------------------------------------------------------------
Pendência: 16952
Tela: Recebimento automatico (retorno)
Descrição: Não está lançando devidamente alteradores na baixa de arquivos de retorno 
do banco do Brasil (cnab240).
Pendência: 16953
Tela: Recebimento automatico (retorno)
Descrição: Não está lançando devidamente alteradores na baixa de arquivos de retorno 
do banco do Brasil (código de barras).
================================================================================
CM$VER      3.04.06i    03/06/2004
--------------------------------------------------------------------------------
Pendência: 16798
Tela: Consulta Relatórios\Emissões Diversas\Autorização de Pagamento AP.
Descrição: Restauração do relatório original.
================================================================================
CM$VER      3.04.06h    03/06/2004
--------------------------------------------------------------------------------
pendência 16550 
Tela: Cadastro\Contas Caixa X Forma de Pagamento
Descrição: ajuste da pendência 16550
================================================================================
CM$VER      3.04.06g    19/05/2004
--------------------------------------------------------------------------------
Pendência: 16798
Tela: Consulta Relatórios\Emissões Diversas\Autorização de Pagamento AP.
Descrição: Corrigir o Relatório para que o mesmo repeite a estrutura de múltiplas contas de baixa.
================================================================================
CM$VER      3.04.06f    17/05/2004
--------------------------------------------------------------------------------
Pendência: 16708
Tela: Sistema\Utilitários\Importação de Lançamentos.
Descrição: O campo Histórico de lançamentos não está sendo importado corretamente.
================================================================================
CM$VER      3.04.06e    12/05/2004
--------------------------------------------------------------------------------
Pendência 16650
Tela: Cadastro\Contas Caixa X tipos de Cobrança
Descrição: o campo CONTROLEREMESSA a ser atualizado tem que ser o 
da tabela modeloscnab para que diferentes módulos não enviem arquivos de remessa 
com o mesmo número sequencial.
================================================================================
CM$VER      3.04.06d    04/05/2004
--------------------------------------------------------------------------------
Pendência 16170
Tela: Cobrança\Recebimento\Automático (retorno)
Descrição: querar o recebimento dos documentos quando estiverem agrupados com codgrupocnab.
================================================================================
CM$VER      3.04.06c    30/04/2004
--------------------------------------------------------------------------------
Pendência: 15886
Tela: Lancamento\Documento\Registra
Descrição: Inserir na orelha rateio (no Grid) o campo Comp. Orçamen para que seja 
possível visualizar o número do compromisso orçamento após a inserção do detalhe rateio.
================================================================================
CM$VER      3.04.06b    16/04/2004
--------------------------------------------------------------------------------
Pendência 16156 - Impressão de Guia de Recebimento
- Filtragem pelo valor do documento.
Reformulação do cadastro: Tipos de Recebimento x Impostos Agregados
================================================================================
CM$VER      3.04.06a    15/04/2004
--------------------------------------------------------------------------------
Pendência 16583
Tela: Lancamentos/ Documentos/ Registra
Descrião: Está habilitando os botões Alterar e Excluir, quando o documento é originário de outro módulo
Pendência 16371
Tela: Consultas\ Relatórios\ Operacionais\ Valores Recebidos
Descrião: Acrescentar na query deste relatório o campo de informação do nosso número baixado.
Pendência 14761
Tela: Todas
Descrição não mais utilizar a biblioteca CmintBanco50.bpl e utilizar somente a CmIntbancoMT50.bpl
Pendência 16136
LayOut: SicovCEF
Descrição: Implementação dos códigos de operação de cancelamento (CAR).
Pendência 16136
LayOut: Bradesco Cobrança
Descrição: Implementação dos códigos de operação de cancelamento (CAR).
================================================================================
CM$VER      3.04.06     07/04/2004
--------------------------------------------------------------------------------
Pendência 15681 - Relatório de Tipos de Desembolso
- Filtragem e visualização do campo ATIVO.
================================================================================
CM$VER      3.04.05     02/04/2004
--------------------------------------------------------------------------------
Pendencia 15734 : Validação de Plano / Patro no lançamento de documento conforme cadastro no Global
================================================================================
CM$VER      3.04.04     30/03/2004
--------------------------------------------------------------------------------
Pendência 16244
Tela : Cadastros\Contas Caixa X Forma de Pagamento
Descrição: Criação do checkBox "Utiliza Alteradores no envio" para indicar se o portadorfoma permite o lançamento de 
alteradores no momento do lancamento do documento e  possibilitando implementação da pendência 16244.
================================================================================
CM$VER      3.04.03     17/03/2004
--------------------------------------------------------------------------------
Pedência: 16170
Tela : Cobrança\Recebimento\Automático (retorno)
Descrição: 
- baixar todos os documentos que pertencem a um GRUPOCNAB 
se o valor total do grupo de documentos (no arquivo de retorno) 
for igual à soma dos valores dos documentos;
- gravar em um arquivo de log (texto) dados dos documentos que não 
foram baixados para que seja possível a identificação para  se fazer baixa manual.
================================================================================
CM$VER      3.04.02     16/03/2004
--------------------------------------------------------------------------------
Pendência 16135 - Estorno de Documento
- Permitir alteração de documentos estornados.
Pendência 16143 - Ficha Financeira
- Resolução de problema na impressão do cabeçalho de contabilizações cujo campo "PLNCODIGO" estava vazio
Pendência 16077 - Ficha Financeira
- Incluídos na query os campos PATROCINADORA e PLANO.
Pendência 16183 - Autorização de Pagamento - AP
- Alterada a condição da query para trazer documentos parcialmente pagos.
================================================================================
CM$VER      3.04.01     01/03/2004
--------------------------------------------------------------------------------
Pendência 15931 (Impressão de Boletos com Códigos de Barra)
- Solução do problema que ocorria quando se tentava imprimir a ficha filtrada pelo tipo de cliente.
================================================================================
CM$VER      3.04.00     20/02/2004
--------------------------------------------------------------------------------
Pendência: 5342 - Múltiplas Contas de Baixa. Modificações condicionadas a ativação do
   parâmetro global "Segregação Virtual"
Pendência: 14451 - Nova Segregação de Recursos
**Menu: \Lançamento \Documento
Adequação da tela a nova estrutura de Segregação de Recursos
Inserida a guia "Contas Baixa" para documentos com múltiplas contas de baixa.
Na guia "Alteradores": retirada a possibilidade da informação da Atividade/Projeto.
Se Lança e Baixa simultânea. Não é possivel lançar em um Plano de Benefícios 
<> "Comum" nem numa patrocinadora <> "Comum"
**Menu: \Lançamento \Adiantamentos
Adequação da tela a nova estrutura de Segregação de Recursos
Travando Múltiplos Rateios, quando a segregação estiver ligada.
**Menu: Cobrança \Recebimento
Modificada a contabilização pela baixa de documentos com Fluxo Primário, este tipo de 
lançamento passa a ser segregado na origem.
Registrando o lançamento contábil da baixa com o Critério para Segregação determinado
pela origem do lançamento.
Pendência : 15854 - Lançamento de documentos
Descrição : Correção de diferença de centavos no total dos rateios.
================================================================================
CM$VER      3.03.00m    04/02/2004
--------------------------------------------------------------------------------
Pendência 15847
Tela: Consultas\relatorios\emissões diversas\Ficha Financeira
Descrição: disponibilizar para o relatório os campos Plano e Patrocinadora para que o 
usuário possa colocá-lo no subrelatório de rateios. 
Pendência: 15474
Tela: Cobrança Bancária\Emissão\Ficha de Compensação\Impressão
Descrição: Mostrar uma mensagem de alerta e ao imprimir as fichas quando o campo Nosso Número
do cadastro de portador forma não estiver preenchido.
================================================================================
CM$VER      3.03.00l    02/02/2004
--------------------------------------------------------------------------------
Pendência 15996
Tela : Utilitários\Importação de Lançamentos
Descrição: Permitir a Leitura das colunas que contém informações de Plano, 
Patrocinadora e Programa para rateio do documento.
Pendência 16032
Tela : Utilitários\Importação de Lançamentos
Descrição: 
-Observar o parâmetro usaplanopatro que obrigra o preenchimento dos 
campos Plano e Patrocinadora e obrigar o preenchimento dos mesmos se o parâmetro obrigar.
-Criação da coluna idsegregacriter para que o sistema preencha este campo na insersão de um documento.
-Criação de um arquivo de exceções onde são listados os registros que o sistema não conseguiu importar.
================================================================================
CM$VER      3.03.00k    28/01/2004
--------------------------------------------------------------------------------
Pendência 15182
tela: sistema\utilitários\Alterar Dados Bancários
Descrição: critica se os dados bancários do documento podem ser alterados.
Pendência 14794
tela: Relatórios\Operacionais\Posição por Cliente
Descrição: Implementação do filtro por usário do sistema que lançou o documento e disponibilização dos campos
USUARIO (nome completo do usuário) e NOMEUSUARIO (login do usuário) para que seja possível inserí-los no relatório.
Pendência 15994
tela: Cadastros\Tipos de Alteradores
Descrição: Permite a limpeza e gravação do campo Conta Contábil vazio.
================================================================================
CM$VER      3.03.00j    22/01/2004
--------------------------------------------------------------------------------
Pendência 15965
Tela: Lançamento \ Documento
Descrição: Ajuste na contabilização do imposto com informação de Plano e Patro
*********************************************
- CForms\FBaixaManualMT - bbtnConfirmarClick :Corrigida passagem do Parâmetro da data 
  de Disponibilidade quando CAP
  if _CtrlFinanc.IntegraDispFinanc Then
      dDataDisp := CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime;
- ProcessaBaixaAutomatica
Descrição : Passagem do parametro de Data de Disponibilidade para a função BaixaDocumento da funcao
ProcessaBaixaAutomatica
================================================================================
CM$VER      3.03.00i    14/01/2004
--------------------------------------------------------------------------------
Pendência 15740 
Tela: \Cobrança \Recebimento \Exclui / Estorna \Lote
Mostrar as mensagens de erro pela não exclusão de uma baixa manual
================================================================================
CM$VER      3.03.00h    30/12/2003
--------------------------------------------------------------------------------
Pendência: 15792  - \Lançamento \Documentos \Alteradores
Retirar a possibilidade de se lançar uma Atividade/Projeto para o alterador. 
A mesma será rateada.
================================================================================
CM$VER      3.03.00g    18/12/2003
--------------------------------------------------------------------------------
Pendência: 15832  - \Lançamento \Documentos \Registra
Após buscar um documento para alterar, colocando como tela principal a guia rateio, 
ao clicar no Alterar principal e depois no alterar do rateio, dava erro de VCL50.
================================================================================
CM$VER      3.03.00f    18/12/2003
--------------------------------------------------------------------------------
Pendência: 15680
Tela: Cobrança\Recebimento\Manual
Após filtragem da cobrança necessária e seleção da mesma, 
ao tentar filtrar mais documentos e clicar no botão cancelar 
da tela do montaselect, o sistema apaga dos documentos que já 
foram selecionados para baixar.
================================================================================
CM$VER      3.03.00e    16/12/2003
--------------------------------------------------------------------------------
- Pendência 15788
Tela: Cobrança \ Cobrança bancária \ Emissão \ Arquivos IntBanco
  Na tela de geração do arquivo eletrônico, possibilidade de 
  geração de arquivo por datas (data programada do documento).
================================================================================
CM$VER      3.03.00c    10/12/2003
--------------------------------------------------------------------------------
- Pendência Nº 13159 - Lançamentos \Documentos \Registra
> imprimir na área de mensagem do boleto o campo histórico complementar que está localizado
na tela "lançamentos\Documentos\Registra" se no relacinamento de documentos x ContasCaixas x Tipo de cobrança
(tela : Cobrança\Documentos x Cobrança) estiver marcado a opção "Histórico" .
- Pendência 14818 - \Cobrança \Recebimento \Manual
  Corrigida a identificação de lançamentos não identificados pela baixa manual.
- Pendência Nº 3138 - \Cadastros \Tipo de Documento x Alterador x Módulo
  Nova Tela, para possibilitar o relacionamento os diversos tipos de alteradores utilizados
  na baixa de documentos por módulo. Desta maneira, na baixa de documentos o 
  sistema poderá utilizar o alterador apropriado segundo o módulo originário do documento.
  Ou, caso não parametrizado, utilizar os alteradores default parametrizados no sistema.
- Pendência Nº 14400 - \Lançamentos \Documentos \Registra
  Criar funcionalidade p/ que o usuário tenha acesso só a movimentações registradas 
  pelos integrantes do Centro de Responsabilidade ao qual ele faz parte. 
  Alterações no Banco:
  Criado o campo FlgRestrAcessLancDoc na tabela ParamCap.
- Pendência 14458
  Filtragem dos tipos de desembolso pelo campo ATIVO, no menus:
  \Lancamentos \Documentos \Registra
  \Cadastros \Cadastro de Impostos Agregados
  \Cadastros \Tipos de Clientes x Tipos de Recebimento
================================================================================
CM$VER      3.02.05     09/12/2003
--------------------------------------------------------------------------------
- Pendência 14837 - Consultas \ Movimento:
  Item de menu retirado;
- Pendência 14843 - Consulta \ Relatórios \ Lançamentos Contábeis:
  Onde havia "Unidade de Negócio" passou a haver "Atividade/Projeto".
- Pendência 15770 - Cobrança \ Cobrança bancária \ Emissão \ Arquivo IntBanco:
  Correção da filtragem para geração da cobrança de acordo com os parâmetros exibidos em tela (não estava filtrando por sistema de origem).
================================================================================
CM$VER      3.02.04b    25/11/2003
--------------------------------------------------------------------------------
Pendência 15678 - Cobrança \ Recebimento \ Manual
Corrigida a contabilização na baixa manual envolvendo mais de um documento, simultaneamente, quando o "Contas / Caixa x Tipo Cobrança" não possui integração com o financeiro.
================================================================================
CM$VER      3.02.04a    13/11/2003
--------------------------------------------------------------------------------
Correção na geração do documento no Controle Financeiro, quando o Contas a Receber
possuia mais de um rateio por plano x patrocinadora - pendência 15631
================================================================================
CM$VER      3.02.04     28/10/2003
--------------------------------------------------------------------------------
Acerto no float na geração do Controle Financeiro - pendência 15226
================================================================================
CM$VER      3.02.03j    27/10/2003
--------------------------------------------------------------------------------
>Resolução da pendência 15498 : Estava gravando errado o número do  coddocumento e nodocumento.
================================================================================
CM$VER      3.02.03h    27/10/2003
--------------------------------------------------------------------------------
> Resolução da pendência 15099 : erro no cadastro de portador forma.
================================================================================
CM$VER      3.02.03g    24/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15498
  > Tela\Opçao No Sistema: Impressão de Remessa
  Estava gravando errado o número do  coddocumento e nodocumento.
================================================================================
CM$VER      3.02.03f    30/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15099
  > Tela\Opçao No Sistema: Parametrização contas/caixa X tipos de cobrança / Parâmetros da Cobrança Bancária
  Após digitar todas as informações da tela, e salvar, o campo da mensagens continua em branco.
================================================================================
CM$VER      3.02.03e    19/09/2003
--------------------------------------------------------------------------------
> resolução da pendência 15058 - na gravação do portadorforma do banrisul está dando errpo de constraint.
- acerto na unit uIntBancoManager.
================================================================================
CM$VER      3.02.03d    15/09/2003
--------------------------------------------------------------------------------
> Reposição do itens de menu Utilitários\Transferência de Classificação Automática e Utilitários\Transferência de Classificação
>Resolução da pendência 15017 - Na tela de Cadastro do PortadorForma, a forma de pagamento alternativo, não está ficando vazia está sendo preenchida automaticamente.
================================================================================
CM$VER      3.02.03b    21/08/2003
--------------------------------------------------------------------------------
- Pendência 14889: correção do estorno do documento quando já há lançamentos estornados;
================================================================================
CM$VER      3.02.03a    28/07/2003
--------------------------------------------------------------------------------
Pendência 14663 - Corrigida data passada para Financeiro no momento da baixa (estava passando data do sistema);
================================================================================
CM$VER      3.02.03     22/07/2003
--------------------------------------------------------------------------------
Pendencia 14629 - Corrigido erro na emissão de boletos quando se indicava um tipo de cliente;
Pendencia 14322 - Exibição de label com a mensagem "não há lançamentos em aberto..." quando não houver documentos em aberto no período selecionado;
Pendência 14324 - Correção da mensagem quando não for indicada a Conta de Caixa x Forma de Cobrança;
Pendência 14176 - Correção da marcação dos documentos quando o sitema pergunta se a impressão foi correta;
Pendência 14179 - Alteração da mensagem quando não há documentos pendentes;
Pendência 14263 - Correção da alteração indevida do Nosso Número após liberação de Bloqueto;
Pendência 13471 - Correção da marcação de (não)conciliado quando há alteração nos lançamentos do documento;
================================================================================
CM$VER      3.02.02     03/07/2003
--------------------------------------------------------------------------------
- Libera reimpressão de boleto - Pendência 14263: correção da alteração ou não do NossoNumero;
- Baixa Manual - Pendência 14405: Na baixa manual, no momento de se conciliar um lançamento não identificado,
criação do novo lançamento no CFinan com o status de "Conciliado";
- Documento - Pendência 13471: atualização do campo FLGNAOCONCILIADO da tabela DOCUMENTO com o valor 1, toda vez que ocorrer alterações nos lançamentos do documento;
- Baixa Manual - Pendência 12295: regularização automática dos lançamentos não identificados.
================================================================================
CM$VER      3.02.00a    30/05/2003
--------------------------------------------------------------------------------
- Baixa de Recebimentos vs. Pagamentos: correção do erro de transação;
================================================================================
CM$VER      3.01.78     05/05/2003
--------------------------------------------------------------------------------
Acerto na baixa eletronica
Parametro na posicao do cliente
================================================================================
CM$VER      3.01.75     16/04/2003
--------------------------------------------------------------------------------
- Alterações na tela de lançamento do documento para contemplar a estrutura
  da disponibilidade
================================================================================
CM$VER      3.01.70     28/05/2003
--------------------------------------------------------------------------------
- Correção da chamada do cadastro de Tipos de Cliente;
================================================================================
CM$VER      3.01.68     24/03/2003
--------------------------------------------------------------------------------
Alteração nome do form para autorizacao do boton estornar na tela excluir pagamento lote 
Acerto da tela baixa automatica 
Acerto tela Exclui Baixa Documento 
Correções no Relatorio de posicao forn/cli
================================================================================
CM$VER      3.01.67     17/03/2003
--------------------------------------------------------------------------------
- Remessa Eletrônica de Arquivo Int Banco
  Correção na seleção dos dados bancários para montagem dos arquivos Int Banco
================================================================================
CM$VER      3.01.66     11/03/2003
--------------------------------------------------------------------------------
- Relatório Orden de Pago 
  Implementação do Relatório
- Parâmetro do Relatório de AP
  Erro na pesquisa de documento
- Relatório de Emissão de Cheque
  Erro na filtragem de relatório pelo tipo de departamento 
  pois estava usando o tipo inteiro e o mesmo era definido 
  como string
- Consulta de Lançamento 
  Conversão para 3 camadas
================================================================================
CM$VER      3.01.65     06/03/2003
--------------------------------------------------------------------------------
- Cadastro de Códigos Bancários Para Cobrança
  Inclusão de campo para indicação de "Baixa Por Alterador" para o tipo de documento 
  indicado.
- Baixa Eletrônica de Títulos
  Implementação da Baixa "Baixa Por Alterador"
- Cadastro de Impostos\Agregados
  Implementação de parâmetros para a contabilização de impostos do tipo somente calcula valor.
================================================================================
CM$VER      3.01.64     27/02/2003
--------------------------------------------------------------------------------
- Configuração de Boletos CM
  Correção na configuração do Boletos pois o evento que controlava a altura do
  código de barras no momento da impressão
================================================================================
CM$VER      3.01.63     25/02/2003
--------------------------------------------------------------------------------
- uImpostoRetido
  > Correção na verificação do lançamento do imposto associado a tipo de desembolso
    sem a indicação do centro de custo - P.6432  > 
- Lançamento de Alteradores
  > Implementação de parâmetro para permitir a contabilização dos alteradores na baixa do
    documento
  > Implementação de parâmetro para permitir a contabilização dos alteradores de acordo com
    centro de custo do rateio do documento
- Lançamento de Agrupa Parcela
  > Correção na alteração para permitir a exclusão de documentos englobados\parcelados
- Lançamento de Documentos
  > Correção na exclusão de documento lançados com compromisso orçamentário
  > Correção na alteração de impostos calculados no momento do lançamento do documento
================================================================================
CM$VER      3.01.62     11/02/2003
--------------------------------------------------------------------------------
- Lançamento de Alteradores
  Correção no erro de contabilização do alterador ao ratear por atividade projeto de
  acordo com lançamento de origem
- Alteração de Lançamento Englobado\Parcelado
  Correção na alteração de englobados quando um ou mais documentos de origem eram
  excluídos do procedimento.
  Alteração do valor da primeira parcela de acordo com a diferença entre o total dos
  documentos de origem e as parcelas já cadastradas na inclusão.
- Alteração e Exclusão de documentos
  Implementação da verficação da existência do documento a ser alterado\excluído
  num lote.
- Lançamento de Documentos
  Correção na contabilização de um adiantamento lançado com a opção de lança e baixa
  simultânea
- Configuração de Bloqueto
  Alteração na grade de configuração para inibir a inclusão e alteração de registros
- Correção automática de Documentos
  Correção na verificação da data da última correção. Estave retornando sempre uma
  data maior que a data informada para correção do documento, não efetuando desta
  forma a correção do mesmo.
- Estorno de Adiantamento
  Correção na contabilização pois esta lançando o estorno com duplicidade na contabilidade
- Cadastro de Impostos com Tabela de Retenção
  Alteração dos "labels" de Fornecedor e Tipo de Desenbolso de acordo com o sistema
  logado para CLiente e Tipo de Recebimento;
================================================================================
CM$VER      3.01.60     23/01/2003
--------------------------------------------------------------------------------
- Baixa Contas a Receber X Contas a Pagar
  Conversão da tela para o modelo 3 Camadas e Otimização no processamento
================================================================================
CM$VER      3.01.58     23/12/2002
--------------------------------------------------------------------------------
- Implementação da gravação do Log de Operações para as
  seguintes telas:
SISTEMA \  UTILITÁRIOS
  Altera Dados Bancários
  Importação de Lançamentos
LANÇAMENTO
  Adiantamentos
  Altera Vencimento
LANÇAMENTO \ DOCUMENTOS
  Registra
  Agrupa Parcela Criar
  Agrupa Parcela Alterar
  Alteradores
LANÇAMENTOS \ CONTRATOS \ PREVISÕES
  Registra
  Agrupa / Parcela Criar
  Agrupa / Parcela Alterar
TESOURARIA \ ADIANTAMENTOS
  Estorna \ Exclui
TESOURARIA \ EMISSÃO DE DOCUMENTOS
  Remessa Eletrônica
TESOURARIA \  PAGAMENTO
  Automático
  Manual
  Eletrônico
  Pagamentos x Recebimentos
  Exclui \ Estorna \ Lote
  Exclui \ Estorna \ Documentos
CADASTRO
  Banco
  Agência Bancária
  Contas Bancárias / Caixas
  Tipo de Recebimento
  Contas / Caixas x Tipo de Recebimento
  Tipos de Recebimento
  Tipos de Alteradores
  Tipos de Documentos
  Classificação Fiscal de Fornecedores
  Impostos com Tabela de Retenção
  Classificação Fiscal x Impostos Agregados
  Tipo de Recebimento x Impostos Agregados
  Tipo de Recebimento x Centro de Custo x Conta Contábil x Programa
  Alterador x Centro de Custo x Conta Contábil x Programa
  Tipos de Cliente
================================================================================
CM$VER      3.01.55     13/12/2002
--------------------------------------------------------------------------------
- Baixa Manual de Documentos
  Implementação da tela de alteração de retenção na baixa para o modelo 3 camadas
  Correção na gravação do histórico contábil na baixa de documentos
  
================================================================================
CM$VER      3.01.53     09/12/2002
--------------------------------------------------------------------------------
- Consulta de Lançamento 
  Conversão para 3 camadas
================================================================================
CM$VER      3.01.52     03/12/2002
--------------------------------------------------------------------------------
- Consulta de Documentos
  Implementação da Tela no modelo 3 Camadas
- Impressão do Espelho de Documento 
  Implementação da impressão do  relatorio AP modelo 3
- Relatório de AP Modelo 1
  Correção do erro "List index out of Bound[6]" 
  na tela de parametros do relatorio.
- Correção no Cálculo da verificação do dígito da 
  conta no bradesco para conta do tipo poupança
================================================================================
CM$VER      3.01.51     02/12/2002
--------------------------------------------------------------------------------
- Correção na contabilização da baixa do documento para gravação de plano e patrocinadora
================================================================================
CM$VER      3.01.50     28/11/2002
--------------------------------------------------------------------------------
- Liberação das Telas No Modelo 3 Camadas
  > Lançamento de Documentos
  > Lançamento de Adiantamentos
  > Lançamento de Contrato\Previsão
  > Lançamento de Alteradores
  > Lançamento, Alteração e Exclusão de Agrupa\Parcela Documentos
  > Regularização de Adiantamentos
  > Cancelamento da Regularização de Adiantamentos
  > Baixa Manual
  > Estorno de Documentos
  > Estorno de Adiantamentos
================================================================================
CM$VER      3.01.48     18/11/2002
--------------------------------------------------------------------------------
- Correção no cadastro e impressão Certificado de Retenção;
- Correção na tela Alteração de imposto baixa manual;
- Correção gravação valor liquido na tela lança documento;
- Correção exclusão de imposto na tela de cancelamento de baixas de lote.
================================================================================
CM$VER      3.01.47     08/11/2002
--------------------------------------------------------------------------------
 - Correção na inicialização dos parâtros do sistema.
================================================================================
CM$VER      3.01.46     06/11/2002
--------------------------------------------------------------------------------
 - Correção na Impressão da Carta de Cobrança. O relatório não exibia dado nenhum.
================================================================================
CM$VER      3.01.45     05/11/2002
--------------------------------------------------------------------------------
 - Correção na tela de Agrupa Bloquetos por Clientes.
 - Correções nos relatórios de 3 camadas.
================================================================================
CM$VER      3.01.44     31/10/2002
--------------------------------------------------------------------------------
 - Corrigido o erro na exclusão do modelo de Certificado de Retenção.
================================================================================
CM$VER      3.01.43     30/10/2002
--------------------------------------------------------------------------------
 - Conversão de telas para o modelo 3 camadas.
================================================================================
CM$VER      3.01.42     25/10/2002
--------------------------------------------------------------------------------
 - Correção na rotina de baixa de arquivo eletrônico para o Banco CEF - Cobrança
Eletrônica.
 - Correção do Erro "No lookup table specified!" na opção Tipo de Cliente para 
Adiantamento na tela de Parâmetro do Sistema.
 - Correção do Erro "Expressão Ausente" na tela de Altera Dados Bancários. 
================================================================================
CM$VER      3.01.41     23/10/2002
--------------------------------------------------------------------------------
- Liberação das telas alteradas para o modelo 3 camadas:
  > Lançamento de Documento
  > Agrupa\Parcela Documento
  > Lançamento de Alteradores
  > Lançamento de Contrato\Previsão
  > Agrupa\Parcela de Contrato\Previsão
  > Lançamento de Adiantamento
  > Regualrização de Adiantamento
  > Regualrização de Adiantamento\Contrato\Previsão
  > Estorno de Documentos
  > Estorno de Alteradores
  > Exclusão\Estorno de Regularização Adiantamento
  > Alteração de Saldo de Documentos
- Parâmetros do Sistema
  Implementação do parâmetro para autorizar a manutenção de alteradores para
  documento já baixados. O valor default é permitir a manutenção dos alteradores.
- Lançamento de Alteradores
  Verificação do parâmetro para autorizar a manutenção de alteradores para
  documento já baixados.
================================================================================
CM$VER      3.01.40     18/10/2002
--------------------------------------------------------------------------------
 - Conversão de telas para o modelo 3 camadas.
 - Implementação da rotina de impressão de Ficha de Compensação para o banco HSBC
para Cobrança Não Registrada.
================================================================================
CM$VER      3.01.39     11/10/2002
--------------------------------------------------------------------------------
 - Corrigida a rotina de Liberação de Bloqueto para Reimpressão. O sistema liberava 
para reimpressão todos os bloquetos exibidos no grid ignorando a seleção feita pelo
usuário.
================================================================================
CM$VER      3.01.38     07/10/2002
--------------------------------------------------------------------------------
- Implementação de uma opção para alteração do Banco, Agência e Conta na opção
de Altera Dados Bancários no menu Utilitários.
 - Compatibilização para o padrão 5.09.00.
================================================================================
CM$VER      3.01.37     02/10/2002
--------------------------------------------------------------------------------
- Customizações gerais de relatórios para o modelo 3 camadas
================================================================================
CM$VER      3.01.36     27/09/2002
--------------------------------------------------------------------------------
- Acertada a contabilização do adiantamento, quando se escolhia a opção de Lança/Baixa
  simultânea.
================================================================================
CM$VER      3.01.35     26/09/2002
--------------------------------------------------------------------------------
 - Correção na geração do arquivo de Cobrança Eletrônica do banco REAL para
o banco REAL - COBRANÇA REGISTRADA.
 - Implementação de filtro por usuário na tela de emissão de BLOQUETOS. Agora 
o sistema permite que o usuário imprima apenas os boletos dos documentos lançados por
ele.
================================================================================
CM$VER      3.01.34     10/09/2002
--------------------------------------------------------------------------------
- Pagamento Manual - Parcial valor absoluto;
================================================================================
CM$VER      3.01.33     05/09/2002
--------------------------------------------------------------------------------
- Acerto do Procura na tela Consulta Documentos;
- Acerto Na Emissão de Recebo Extenso Valor.
================================================================================
CM$VER      3.01.32     04/09/2002
--------------------------------------------------------------------------------
 - Atualização do modelo de arquivo eletrônico da Caixa Econômica - Cobrança 
Eletrônica 240 posições.
================================================================================
CM$VER      3.01.31     12/08/2002
--------------------------------------------------------------------------------
 - Conversão de telas para o modelo 3 camadas.
================================================================================
CM$VER      3.01.30     03/07/2002
--------------------------------------------------------------------------------
HELP AUTOMÁTICO
Implementação dos textos de help em telas e botões de ajuda.
AGRUPAR BLOQUETOS
Implementação da rotina de Agrupamento de Bloquetos. Esta opção serve para agrupar
vários documentos, lançados de módulos diferentes, para serem impressos juntos.
================================================================================
CM$VER      3.01.29     26/06/2002
--------------------------------------------------------------------------------
IMPOSTOS COM TABELA DE RETENÇÃO
- Correção. O sistema não estava buscando o plano de conta informado na contabilidade;
PARÂMETROS DO SISTEMA
- Implementação de campo para que o usuário informe a conta padrão para a emissão
de cheques. Na emissão do mesmo, o sistema já traz o número do próximo cheque 
automaticamente;
 - Implementação do número de Controle de Remessa na tela de 
Cadastros / Contas Bancárias x Caixas;
 - Correção do campo VALOR BRUTO do relatório de Valores Recebidos. 
Este campo aparecia zerado em algumas situações;
 - Implementação do Centro de Custo e seus respectivos valores no relatório de 
Aprovação de Documentos.
================================================================================
CM$VER      3.01.28     19/06/2002
--------------------------------------------------------------------------------
 - Otimização do relatório de Valores Pagos.
 - Correção no módulo de Transferência de Classificação. Não estava respeitando o 
parâmetro de integração com a Contabilidade.
================================================================================
CM$VER      3.01.27     17/06/2002
--------------------------------------------------------------------------------
 - Atualização do Layout de COBRANÇA ELETRÔNICA para o Banco Santander;
 - Correção de erro na leitura do arquivo eletrônico de retorno para a Cobrança 
Registrada do UNIBANCO.
================================================================================
CM$VER      3.01.25     28/05/2002
--------------------------------------------------------------------------------
 - Impressão de Relatórios de Conciciação de CPMF
  Correção na seleção do relatório "Analítico Por Data" para impressão.
 - Correção na impressão das mensagens de boletas bancárias.
 - Correção na impressão da representação numérica do código de barras na 
impressão da ficha de compensação para o banco real.
================================================================================
CM$VER      3.01.24     16/05/2002
--------------------------------------------------------------------------------
- Acertado o Relatorio Posição dos Saldos por Tipo de Cliente;
- Criada opção na liberação para Reimpressão de boleto de manter ou criar 
um novo nosso número.
================================================================================
CM$VER      3.01.23     13/05/2002
--------------------------------------------------------------------------------
 - Correção no relatório por Data Programada. Não estava listando os documentos
parcelados, quando se utilizava o filtro Tipo de Documento.
 - Correção na Baixa Eletrônica de arquivos. 
================================================================================
CM$VER      3.01.21     29/04/2002
--------------------------------------------------------------------------------
 - Implementação para a utilização do padrão 5.06.00 e posteriores;
 - Alteração, em todo o sistema, do número do Banco Real de 275 para 356;
 - Implementação do campo OBS no relatório de Documentos Lançados;
 - Alteração do posicionamento do campo CEP na impressão de etiquetas para
impressão matricial.
 - Correção do Erro: Cannot make a visible window modal - na tela de emissão de 
etiquetas.
================================================================================
CM$VER      3.01.20     16/04/2002
--------------------------------------------------------------------------------
CONSULTA DE DOCUMENTOS
- Implementação de opção de busca por SALDO de documento.
RELATÓRIO POR DATA PROGRAMADA
- Implementação de Filtro por Cliente.
================================================================================
CM$VER      3.01.19     10/04/2002
--------------------------------------------------------------------------------
- Incluída a possibilidade de autorização para geração do lote para quem possui o sistema
  RAD.
IMPRESSÃO DE RECIBOS
- Implementação dos campos TIPO DE RECEBIMENTO e VALOR do rateio do 
documento.
RECEBIMENTO AUTOMÁTICO
- Otimização da tela de recebimento automático de documentos.
================================================================================
CM$VER      3.01.18     01/03/2002
--------------------------------------------------------------------------------
 - Otimização do relatório de Valores Recebidos.
 - Correção no módulo de geração de remessa para alteração. Não estava passando o
valor do Tipo de Cobrança informado.
================================================================================
CM$VER      3.01.17     26/02/2002
--------------------------------------------------------------------------------
HSBC - COBRANÇA REGISTRADA
 - Correção do calculo do Nosso Número na geração do arquivo eletrônico.
FICHA DE COMPENSAÇÃO
 - Correção na impressão do Nosso Número na emissão da Ficha de Compensação para 
o HSBC.
================================================================================
CM$VER      3.01.16     25/02/2002
--------------------------------------------------------------------------------
BANCO DO BRASIL - CARTEIRA DE COBRANÇA
- Atualização do layout.
================================================================================
CM$VER      3.01.15     15/02/2002
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Crreção na reprogramação da CPMF para data de lançamento em feriados
- Correção do módulo de Impressão de Etiquetas.
================================================================================
CM$VER      3.01.14     24/01/2002
--------------------------------------------------------------------------------
- Baixa Automática de Arquivos IntBanco
  Implementação da visualização automática do tratamento do arquivo a ser baixado
  pelo sistema
================================================================================
CM$VER      3.01.13     09/01/2002
--------------------------------------------------------------------------------
- Acertada a exclusão do lote quando tinha uma regularização de adiantamento dentro
  deste lote que se desejava excluir. 
================================================================================
CM$VER      3.01.12     03/01/2002
--------------------------------------------------------------------------------
Implementação dos seguintes modelos de remessa eletrônica:
 - COBRANÇA ELETRÔNICA BANRISUL
 - COBRANÇA ELETRÔNICA BBV
 - UNIBANCO - COBRANÇA SEM REGISTRO
Atualização da descrição do modelo UNIBANCO para UNIBANCO - COBRANÇA REGISTRADA	
Atualização da descrição do modelo BANCO DO BRASIL ARQUVIVO LASER para BANCO DO BRASIL ARQUVIVO LASER (CBR454 250 POSIÇÕES)
MENSAGENS x DOCUMENTOS
Este módulo foi remodelado com o propósito de acrescentar a opção de 
TIPO DE MENSAGEM para que o usuário informe se aquela mensagem será
impressa na frente, atrás ou em ambas as posições no Boleto.
================================================================================
CM$VER      3.01.11     30/10/2001
--------------------------------------------------------------------------------
 - Implementação da rotina de baixa de documentos emitidos em uma única boleta.
 - Correção na alteração de lançamento de alteradores.
================================================================================
CM$VER      3.01.10     17/10/2001
--------------------------------------------------------------------------------
 - Implementação do modelo de Cobrança Registrada do Banco HSBC.
================================================================================
CM$VER      3.01.09     15/10/2001
--------------------------------------------------------------------------------
 - Otimização do Relatório Ficha Financeira.
================================================================================
CM$VER      3.01.08     02/10/2001
--------------------------------------------------------------------------------
- RECEBIMENTO MANUAL
  Este módulo não permitia que o usuário informa-se valores negativos para o 
  pagamento.
 - Implementação do Modelo de cobrança para o Banco Cidade.
================================================================================
CM$VER      3.01.07     28/09/2001
--------------------------------------------------------------------------------
 - Implementação do parâmetro "Considerar somente os alteradores do período"
 no Relatório de Documentos Lançados;
 - Correção na tela de lançamentos de alteradores. Este módulo estava aceitando que
a data de lançamento do alterador fosse anterior a data de lançamento do Documento;
 - Correção na exclusão no cadastro de Tipo de Recebimento.
================================================================================
CM$VER      3.01.06     06/09/2001
--------------------------------------------------------------------------------
 - Relatório de Ficha Financeira
   Correção na exibição dos dados de contabilização e 
optimização do mesmo
 - Parcelamento de Documentos
   Este módulo estava informando que o número de um determinado
documento já estava lançado, porém, o documento estava lançado
no CONTAS A PAGAR.
================================================================================
CM$VER      3.01.05     28/08/2001
--------------------------------------------------------------------------------
 
================================================================================
CM$VER      3.01.03     09/08/2001
--------------------------------------------------------------------------------
- Implementação de Plano e Patrocinadora na tela de RecebimentoXPagamento 
simultâneo.
================================================================================
CM$VER      3.01.01     10/07/2001
--------------------------------------------------------------------------------
- Demonstrativo Sintético de Gestão
  Alteração da coluna de valor para impressão do valor bruto.
- Lançamento de Documentos
  Correção no teste do Status do Cliente para a manutenção dos lançamentos
================================================================================
CM$VER      3.00.15     02/07/2001
--------------------------------------------------------------------------------
- Correção no Relatório de Posição de Saldo por Cliente.
================================================================================
CM$VER      3.00.14     26/06/2001
--------------------------------------------------------------------------------
- Customizações para compatibilização dos Sistemas para acesso ao DB2
================================================================================
CM$VER      3.00.13     25/06/2001
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção da verificação das autorizações de usuário por centro de custo para o lançamento 
  de rateio de documento
================================================================================
CM$VER      3.00.12     19/06/2001
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Alteração no nome de cadastro de "Tipos de Cobrança" para 
  "Cadastro de Tipos de Recebimentos" na guia baixas nos parâmetros
  do sistema. 
- Criação do módulo de "Ajuste de Saldo através de Lançamentos".
- Correção no relatório de Conta Corrente por Cliente/Fornecedor
================================================================================
CM$VER      3.00.10     17/05/2001
--------------------------------------------------------------------------------
- Alteração no form de código de barras.
- Alterações diversas.
================================================================================
CM$VER      3.00.09     16/05/2001
--------------------------------------------------------------------------------
- Baixa Automática de Arquivos
  Correção na seleção de arquivos para baixa: Inclusão do filtro por empresa;
- Emissão de Ficha de Compensação
  Implementação do "Fator Vencimento" na linha digitável e no código de barra dos boletos;
  Implementação do Cálculo do Nosso Número e da Montagem do Campo livre para fichas de compensação do BIC BANCO;
  Correção no tamanho do campo livre do código de barras;
================================================================================
CM$VER      3.00.08     10/05/2001
--------------------------------------------------------------------------------
- Configuração e Impressão da Ficha de Compensação
  Correção na montagem do código de barras com caracteres impares;
  Inclusão do fator vencimento na composição do código de barras e da linha digitável;
================================================================================
CM$VER      3.00.07     09/05/2001
--------------------------------------------------------------------------------
- Alteracoes na contabilização de operações de baixa para uma origem especifica.
- Alteração na data de vencimento da ficha pre-impressa (vencimento = programada).
- Correção de problemas diversos na alteração de parcelamento.
================================================================================
CM$VER      3.00.06     27/04/2001
--------------------------------------------------------------------------------
- Alteracoes no form de cadastro de alteradores.
- Alteracoes no tratamento do flag de agregacao de saldo.
================================================================================
CM$VER      3.00.05     20/04/2001
--------------------------------------------------------------------------------
- Correção no relatorio de documentos por data programada.
- Desbloqueio do lançamento/alteração/exclusão de alteradores para documentos
  com saldo zerado (baixados).
================================================================================
CM$VER      3.00.03     17/04/2001
--------------------------------------------------------------------------------
- Correção no relarório de Conta Corrente de Clientes. Lançamento correto da
  contrapartida do parcelamento no relatório.
================================================================================
CM$VER      3.00.02     11/04/2001
--------------------------------------------------------------------------------
- Correção do erro ('' is not a valid integer value) na emissão de boletos.
- Consistencia de titulo entre o item de menu e o form 
  Tipos de Recebimento X Impostos Agregados.
================================================================================
CM$VER      3.00.01     10/04/2001
--------------------------------------------------------------------------------
- Adição do campo FLGSTATUSFINANC.
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
- Versão Delphi 5.
================================================================================
CM$VER      2.33.02     13/03/2001
--------------------------------------------------------------------------------
- Alteração numa query do form de parametros do relatorio de adiantamentos (inclusão
  de VALALT e HISTORICOCOMPL no group by - compartilhado com o CAP).
================================================================================
CM$VER      2.33.01     08/03/2001
--------------------------------------------------------------------------------
- Correção do relatório de adiantamentos regularizados: Erro no somatório.
================================================================================
CM$VER      2.32.12     05/03/2001
--------------------------------------------------------------------------------
- Pendencias Diversas
================================================================================
CM$VER      2.32.11     19/02/2001
--------------------------------------------------------------------------------
- Inclusão do teste do campo chave para os arquivos de retorno no Banco do Brasil,
Banco Real e Caixa Econômica do tipo Débito Automático.
- Formatação do número do documento na tela de reimpressão do boleto.
================================================================================
CM$VER      2.32.08     12/02/2001
--------------------------------------------------------------------------------
- Alteração em form comum ao CAP.
================================================================================
CM$VER      2.32.07     12/02/2001
--------------------------------------------------------------------------------
- Corigido o relatório da posição dos saldos por cliente, para não apresentar 
  valores zerados.
================================================================================
CM$VER      2.32.05     07/02/2001
--------------------------------------------------------------------------------
- Corrigido o sinal do Valor Liquido segundo Débito/Crédito no relatório de lançamento 
  de documentos.
================================================================================
CM$VER      2.32.03     06/02/2001
--------------------------------------------------------------------------------
- Correção da gravação do número do lote de baixa para pagamento/recebimento manual.
================================================================================
CM$VER      2.32.02     06/02/2001
--------------------------------------------------------------------------------
- Adequação ao padrão de 05/02/2001.
================================================================================
CM$VER      2.32.01     02/02/2001
--------------------------------------------------------------------------------
- Adequacao ao padrao.
================================================================================
CM$VER      2.32.00     01/02/2001
--------------------------------------------------------------------------------
- Conta Auxiliar a Conta Contabil e a Conta no cadastro do tipo de Embolso/Desembolso.
================================================================================
CM$VER      2.31.02     17/01/2001
--------------------------------------------------------------------------------
- Relatório Demonstrativo de Atos de Gestão
  Alteração no Lay-Out do Relatório;
  Alteração da tela de filtro do relatório;
  Correção na seleção dos documentos referentes a documento englobados;
- Relatório Demonstrativo Sintético De Gestão
  Alteração da tela de filtro do relatório;
- Inclusão\Alteração de Engloba\Parcela
  Correção na gravação do Número da AP no documento de
  Origem para documentos Parcelados;
================================================================================
CM$VER      2.31.00     08/01/2001
--------------------------------------------------------------------------------
Usuarios somente podem lancar APs de seus respectivos centros de responsabilidade.
Referencias a PLANPREV substituidas por PLANPREVCONTABIL.
================================================================================
CM$VER      2.30.11     21/12/2000
--------------------------------------------------------------------------------
- Conciliação de CPMF
  Correção na conciliação de CPMF's lançadas irregularmente;
  Implementação da Auditoria de Rateios não Associados para lançamento de CPMF;
  Implementação de Relatório Analítico de documentos lançado por lote;
  Visualização de Lotes gerados sem lançamento algum de CPMF permitindo que a mesma
  seja recalculada;
- Arquivos IntBanco
  Correção nas telas de parâmetros permitindo o cancelamento da operação;
- Documentos X Cobranca
  Correcão da seleção de documentos a pendentes de impressão: Inclusão do filtro por
  operação do lançamento e otimização da consulta;
- Emissão\Impressão de Boletos
  Correcão da seleção de documentos a pendentes de impressão: Inclusão do filtro por
  operação do lançamento e otimização da consulta;
================================================================================
CM$VER      2.30.10     30/11/2000
--------------------------------------------------------------------------------
Acerto no Relatorio Posiçao por fornecedores
Acerto na Alteração de Centro de Responsabilidade
Acerto no Relatório Ordem de Pago
================================================================================
CM$VER      2.30.08     17/11/2000
--------------------------------------------------------------------------------
- Implementação de mensagem para geração da Guia de Recebimento.
- Implementação na tela de Lançamento para mostrar somente os centros
  de responsabilidades ativos na tela de lançamentos.
- Implementação para não permitir estornar um recbto de um lote que tenha um de seus recbtos estornados
================================================================================
CM$VER      2.30.07     08/11/2000
--------------------------------------------------------------------------------
Implementação da Consulta de Plano de Previdencia
Implementação do Relatório Plano de Previdencia
Acerto no Relatório Valores Recebidos x Centro de Responsabilidade.
================================================================================
CM$VER      2.30.06     01/11/2000
--------------------------------------------------------------------------------
- Acerto no calculo do nossonumero do itau
- Acerto na data de emissao na geracao de arquivo remessa.
- Alteracao na tela de lançamento para pesquisar doctos com valor com decimal.
-Acerto do relatório posiçao por Cliente .
-Otimização da tela de lançamento de documentos 
- Formatação do valor na tela de Regulariza Adiantamento
- Implementação do Arquivo de remessa real registrada
================================================================================
CM$VER      2.30.05     17/10/2000
--------------------------------------------------------------------------------
- Cadastro de Clientes
  Inclusão de Observação Do Crédito do Cliente e dos tipos de bloqueio: 
  'Bloqueado pelo Hotel' e 'Bloqueado pela Matriz';
- Pagamento Manual
  Correção na retenção de impostos do tipo 'Sempre Calcula' no momento da baixa manual;
- Otimização no relatório de previsao de pagamentos x centro responsabilidade
- Inclusao do sisatema e empresa no rel valores pagos e recebidos
================================================================================
CM$VER      2.30.04     13/10/2000
--------------------------------------------------------------------------------
- Otimização da tela de impressão de ficha de compensação
- Alteração na tela de exportação de lançamentos de AP para mostrar
   o valor liquido para doctos baixados
- Acerto no menu do contas a receber mudei de forma de recebimento X Centro de Custo X Conta Contábil para 
  Tipo de Recebimento X Centro de Custo X Conta Contábil.
- Lançamento de documento guando for parcela/engloba não deixa gerar ap
================================================================================
CM$VER      2.30.03     10/10/2000
--------------------------------------------------------------------------------
- Cadastro de Impostos\Agregados
  Correções na gravação do alterador associado ao imposto;
  Implementação do Flag "Sempre Calcula Valor" para impostos que não sigam a   parametrização de "Documento Fiscal" e "Tipo de Desembolso";
================================================================================
CM$VER      2.30.02     10/10/2000
--------------------------------------------------------------------------------
- Cadastro de Impostos\Agregados
  Correções na gravação do alterador associado ao imposto;
  Implementação do Flag "Sempre Calcula Valor" para impostos que não sigam a   parametrização de "Documento Fiscal" e "Tipo de Desembolso";
================================================================================
CM$VER      2.30.01     04/10/2000
--------------------------------------------------------------------------------
- Alteracao na tela de liberacao de bloquetos para liberar
   tambem as fichas de compensacao.
- Implementacao do numero da ap para documentos agrupados
================================================================================
CM$VER      2.30.00     21/09/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração/Estorno do compromisso orçamentário no momento da exclusão/estorno de
  documentos;
  Implementação da efetivação de compromisso para documentos regularizados com
  adiantamentos associados a compromissos orçamentários levando em conta o 
  valor do compromisso já ultilizado no adiantamento, ou seja: Caso o valor do adiantamento
  seja menor que o valor do documento e este for associado a uma reseva orçamentária,
  a efetivação do compromisso se dá pela diferença do valor ultilizado para o adiantamento e
  o valor do rateio do documento novo. Caso contrário, se o valor do adiantamento é maior
  que o valor do documento é efetivada uma devolução do valor ultilizado para a respectiva
  reserva.
- Acerto na conta bancaria do arquivo santander.
- Consulta de documentos acerto na pesquisa de valores.
================================================================================
CM$VER      2.29.07     19/09/2000
--------------------------------------------------------------------------------
- Ordenação por bordero na tela de estorna baixas
- Acerto no valor do imposto de renda no relatório demostrativo de  pagamento.
- Lançamento de Documentos
  Correção na exibição do plano\patrocinadora default no lançamento do rateio
  Correção na validação do registro repetido na linha do rateio do documento
================================================================================
CM$VER      2.29.06     15/09/2000
--------------------------------------------------------------------------------
- Acerto no relatório conta corrente
- Acerto na tela de pagamento x recebimentos
- Implementacao do histórico no relatório de adiantamentos regularizados
- Correção do erro ''X' is not a valid integer value ao imprimrir a ficha de compensação;
  
================================================================================
CM$VER      2.29.04     15/09/2000
--------------------------------------------------------------------------------
- Acerto no relatório conta corrente
- Coloquei na emissão de cheque e bordero para não emitir para lotes cancelados.
- Acerto na tela de pagamento x recebimentos
- Implementacao do histórico no relatório de adiantamentos regularizados
================================================================================
CM$VER      2.29.03     13/09/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção no lançamento de alteradores associados a impostos;
  Correção do erro "Field 'VALOROUTRAMOEDA' is not of expected type"
================================================================================
CM$VER      2.29.02     12/09/2000
--------------------------------------------------------------------------------
- Cadastro de Tipo de Desembolso X Centro de Custo X Programa X Conta
  Correçõa na replicação do cadastro: "Field is not of expected type"
- Lançamento de Documentos
  Correção na gravação do Plano e Patrocinadoras Default do Global
  Correção na seleção da conta a crédito qdo não existe o relacionamento na tabela aranha;
================================================================================
CM$VER      2.29.01     12/09/2000
--------------------------------------------------------------------------------
Inclusão do filtro tipo de Recebimento no relatório documentos por data programada.
================================================================================
CM$VER      2.29.00     06/09/2000
--------------------------------------------------------------------------------
- Cadastro de Alteradores
  Exclusão do teste da obrigatoriedade da indicação da subconta se a conta contábil
  do alterador obrigar a mesma.
  Caso obrigue e e subconta não estiver indicado no alterado é selecionada a 
  subconta grava no documento ( No caso a do favorecido ou a indicada na Pasta 'Geral'
  da tela de lançamento de documentos;
- Lançamento de Alteradores
  Inclusào da indicação da Atividade/Projeto no momento do lançamento do alterador.
  Caso esta seja indicada não é efeuado o rateio contábil do lançamento do alterador;
- Lançamento de Documentos
  * Pasta Alteradores:
     Otimização do Cadastro;
     Inclusào da indicação da Atividade/Projeto no momento do lançamento do alterador.
     Caso esta seja indicada não é efeuado o rateio contábil do lançamento do alterador;
  * Pasta Contabilização
     Correçao na seleção da conta a crédito caso não exista o relacionamento do rateio na
     tabela TIPORDXCCXCONTA
  * Pasta Rateio
     Correção da gravação do Plano/Patrocinadora Defaults no momento da inclusão do rateio
- Relatório de Alteradores Lançados
  Correção no filtro dos lançamento por empresa proprietária
================================================================================
CM$VER      2.28.04     04/09/2000
--------------------------------------------------------------------------------
  * Carta de Cobrança
    Correção do filtro de emissão de bloquetos: exclusão da cláusula emisbloq='N';
  * Emissão de Ficha de Compensação
    inclusão de mensagens na tela de impressao de cod barras.
  * Relatório de GR
    Inclusao da operacao 10 (Lança e baixa simultânea).
  * Relatório de Lançamento de Documentos
    Correção no cálculo do saldo do documento de acordo com a natureza do lançamento (D/C);
  * Relatório de Valores Pagos/Recebidos
    Otimização da Consulta
  * Consulta de Documentos
    Correção na seleção dos dados bancários referentes ao favorecido do documento:
    Passou a verificar a existência da conta bancária informado no lançamento do documento,
    caso não exista exibe a conta preferencial do favorecido;
    Alteração no layout da tela;
    Otimização das Consultas; 
    Correção na visualização das parcelas de origem dos documentos parcelados/englobados e
    visualizações dos documentos resultantes a partir de um original
  * Cadastro de Tipo de Recebimento/Desembolso X Centro de Custo X Conta X Programa
    Correção do "Invalid Handle Buffer" na replicação do relacionamento;
  * Parâmetros do Relatório Guia de Recebimento (GR)
    Correção na seleção dos dados bancários referentes ao favorecido do documento:
    Passou a verificar a existência da conta bancária informado no lançamento do documento,
    caso não exista exibe a conta preferencial do favorecido;
    Otimização das Consultas
    Correção na impressão das contas de acordo com o tipo de documento: Só imprime se o mesmo
    obrigar dados bancários;
  * Cadastro de Tipo de Recebimento/Desembolso X Impostos/Agregados
    Inclusão do PROGRAMA no relacionamento;
    Correção da seleção dos relacionamentos associados com Centro de Custo;
  
  * Lançamento de Documentos
    Implementação da seleção e gravação da Conta Bancária do fornecedor para o documento lançado;
    Inclusão da seleção do programa na Pasta Geral após a seleção do centro de custo;
    Implementação da Indicação do Programa associado ao Centro de Custo  nos itens do rateio;
    Inclusão do IDPROGRAMA na Qry de Centro de Custo Geral
    Inclusão do Distinct na consulta do Centro de Custo (Trazia vários centros de custo devido ao relacionamento
    com a tabela TIPORDXCCXCONTA;
    Inclusão dos Filtros por centros de custo inativos;
  * Agrupa/Parcela Inclui/Altera
    Implementação da seleção e gravação da Conta Bancária do fornecedor para o documento lançado;
  * Estonro de Lote
    Correção do Erro "IInvalid Value For Field Documento";
  * Estorno de Documento 
    Correção do erro "'S' is not a valid integer value";
  * Relatório de Lançamentos Contábeis 
    Erro na consulta ao passar os filtros por Data;
  * Cadastros de Códigos Bancários para cobrança 
    Correção na consulta dp Procura;  
  * Remessa para alteração
    Tela de confirmação de remessa - Incluir carteira 109;
    O Cancelar e Sair não funcionan;
    Inclusão de botão de Ok na seleção dos campos para alteração;
    Correção do erro " ''Is not a valid integer" value na seleção de alguns Códigos da operação;
    Não permitir incluir\deletar no grid de documentos lançados - E
    Não exibe barra de rolagem no grid superor - E
  * Arquivo de Remessa Itaú (Efetiva e ALteração) : 
    As definições do último arquivo gerado passaram a ficar
    gravadas no register do windows sendo recuperadas ao entrar na tela;
================================================================================
CM$VER      2.27.05     18/08/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 1975
  > Tela\Opçao No Sistema: REGISTRO
  Permitir registrar um documento associando a um compromisso pelo saldo do documento e não pelo valor bruto do documento
- Resolução da Pendência Nº 1995
  > Tela\Opçao No Sistema: LANCAMENTO / DOCUMENTO / REGISTRA
  Está dando o seguinte erro na associação do documento com o compromisso: "o valor é maior que o compromisso".
- Resolução da Pendência Nº 2520
  > Tela\Opçao No Sistema: 
  GERAL:  Possibilitar salvar relatórios em formato Texto
================================================================================
CM$VER      2.27.03     16/08/2000
--------------------------------------------------------------------------------
- Estorno de Documentos, Alteradores, Baixas
  Correção no estorno de lançamentos: Considerava os lançamentos 
  já estornados individualmente no momento de estornar o documento;
  Correção na exclusão de Impostos/Agregados com lançamentos de 
  alteradores para lançamentos já estornados
================================================================================
CM$VER      2.27.02     11/08/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na regularização de adiantamentos na tela de lançamento de documentos
- Relatório de Documentos Por Data Programada
  Correção na impressão do valor do saldo, valor do pagamento, do documento para adiantamentos e documentos
  lançados como 'Lança e Baixa';
  Inclusão da coluna para impressão do valor regularizado para o documento;
================================================================================
CM$VER      2.27.01     10/08/2000
--------------------------------------------------------------------------------
- Relatório de Posição por saldos
  Correção no cálculo dos saldos para relatórios com data diferente da data do dia;
- Emissão de Arquivos IntBanco
  Correção dos processos de transacação na gravação da emissão da remessa;
- Cadastro de Contas Caixas X Formas de Pagto
  Correção dos processos de transacação na gravação dos parâmetros de remessa;
================================================================================
CM$VER      2.27.00     07/08/2000
--------------------------------------------------------------------------------
- implementaçao da conta contabil automática na escolha
  do tipo de desembolso na tela de tranf contab.
- Implementacao da transferencia automatica de reclassificaçaõ contábil
- Implementação do histórico padrão no tipo de desembolso/recebimento.
- Implementaçao de verso de cheque.
- implementação do historico complementar do documento na importação de lançamentos
- Acerto no calculo da linha digitavel do bloqueto do banco real.
- 01/08 Otimização do relatório aprovacão de documentos
- 03/08 implementacao do arquivo de remessa/retorno santander
- Correção no agrupamento\parcelamento de documento no momento
  do lançamento de Impostos\agregados;
================================================================================
CM$VER      2.26.00     14/07/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Ao lançar um documento - Correção no teste da verifiação da conta contábil dos tipos de desembolso
  Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
  Gravação de Plano, Patrocinadora, Programa, NumImovel no Rateio do Documento;
  Correção na replicação dos dados do rateios: não efetuar a operação no momento
  da inserção de um novo documento;
  Inclusão da coluna Analítico/Sintético para o centro de custo do reteio;
  Ordenação das consultas de centro de custo pelo Código e Pelo Status (A/S);
  Implementação da restrição para lançamentos em centros de custo analíticos;
  Correção na validação do Registro do Rateio: Inclusão das colunas Programa,
  Plano, Patrocinadore e Número do Imóvel no teste.
  Alteração no tipo de dado da coluna Número do Imóvel no Rateio: Passou de
  Number para Varchar2(60);
  Gravação do histórico padrão indicado no tipo de recebimento/desembolso na contabilização do lançamento;
  Correção da Ordem de Tabulação dos controles do Rateio;
  Correção do bloqueio dos controles do rateio no momento da edição dos registros;
- Pagamentos X Recebimentos  
  Inclusão de documentos operação 1 não englobados/parcelado (status <> ´2´) na baixa manual
- Tipos de Desembolso X Centro de Custo X Conta Contábil X Programa
  Cancelamento da seleção dos registros marcados caso sejam sintéticos;
  Inclusão do Programa no relacionamento;
- Cadastros de Tipos de Desembolso
  Inclusão do "Código Correspondente" no cadastro de tipo de Desembolso/Recebimento
- Tipos de Desembolso X Centro de Custo X Conta Contábil X Programa
  Cancelamento da seleção dos registros marcados caso sejam sintéticos Inclusão do Programa no relacionamento
- Consulta a Clientes
  Alteração nos títulos das opçoes do graáfico: Mostrava 'Pagamentos' no contas a receber;
- Lançamento de Alteradores
  Alteração na seleção de documentos para lançamento de alteradores: inclusa a
  restrição para lançamento de alteradores para documentos englobados ou
  parcelas de documentos;
- Tipo de Desembolso X Centro de Custo X Conta Contábil X Programa
  Correção no filtro dos impostos associados ao tipo de desembolso com o centro de custo;
  Correção no filtro dos impostos associados ao tipo de desembolso sem o centro de custo;
  Montagem de consulta para gerar arquivo de exportação dos registros cadastrados.
  Inclusão e exportação da consulta no Gerador de Relatórios;
- Cadastro de Contas Caixas X Formas de Pagamento
  Inclusão de parâmetro para identificação da obrigatoriedade de indicação do favorecido de um lote ao criar o   
  mesmo para o Contas Caixas x Forma de Pagamento Selecionada
- Imposto Retido
  Alteração no lançamento de documento associado a imposto (CPMF) para marcar o
  documento como 'Autorizado para emissão': FLGCONFIRMARECPAG = 'S'
- Lançamento de Alteradores
  Correção da inclusão/alteração de alteradores laçados para documentos sem integração com a contabilidade.
- Tipos de Desembolso X Impostos Agregados
  Correção na seleção dos impostos não associados qdo se seleciona um  centro de custo
- Lançamento de Documento
  Gravação do histórico padrão indicado no tipo de recebimento/desembolso na contabilização do lançamento;
  Correção da Ordem de Tabulação dos controles do Rateio;
  Correção do bloqueio dos controles do rateio no momento da edição dos registros;
- Lançamento de Alteradores
  Inclusão do 'Título' das janelas de consulta para a seleção de documentos e consulta
  de alteradores;
  Inclusão da Restrição de lançamento para documentos Englobados\Parcelas de Documento;
- Relatório de Ficha Financeira
  Acerto na masc. do valor liq
- Transferência de Classificação
  Alteração do nome de vincula tipo de desembolso origem com contas contabeis para realiza transferencia
  contabil.
- Carta de Cobrança
  Acerteo do cálculo de juros da emissão de carta de cobrança 
================================================================================
CM$VER      2.24.07     26/06/2000
--------------------------------------------------------------------------------
- Inclusão de validação de tipos de recebimento na tela de lançamento para que só 
  aceite tipos de recebimento que apontem para a mesma conta contábil de baixa.
================================================================================
CM$VER      2.24.06     21/06/2000
--------------------------------------------------------------------------------
- Acerto no relatório Posição do Cliente para não mostrar documentos estornados.
- Acerto no relatório Posição do Cliente por Centro de Responsabilidade para não mostrar documentos estornados.
- Acerto Na Ficha Financeira Para Recebimento Mostrar Cliente em vez de Favorecido.
- Alteração na Tela de Relatório Ficha Financeira Para mostrar a data programada em vez da data de lancamento 
  no resultado da seleção.
- Implementação do CPF/CNPJ  No relatório de Ficha Financeira .
- Acerto no cadastro de Retenção de Impostos para limpar o campo alterador.   
- Inclusão do Nosso Número na Consulta de Documento.
- Acerto da Tela de Parâmetro do Sistema.
- Acerto no Relatório Recebimentos X Tipo de Recebimento.
================================================================================
CM$VER      2.24.05     16/06/2000
--------------------------------------------------------------------------------
- Relatório Pagamento por tipo de desembolso
  O campo total estava   truncado.
- Adiantamento/Previsão 
  Não mostrava as previsões do ramo do fornedor ou do tipo de Cliente .
- Parâmetro de Emissão de Etiquetas
  Permitir seleção pelo nº do lotes.
- Consulta de documentos 
  Correção no Status dos documentos parcelados e baixados.
  Identificação dos documentos previstos.
- Carta de Cobrança
  Inclusão do valor Principal na consulta
- Relatório de Borderô
  Inclusão do Campo CPF/CNPJ
- Certificado de Retenção
  Correção na impressão dos números das faturas envolvidas na retenção
- Resolução da Pendência Nº 2057
  > Tela\Opçao No Sistema: 
  Inclusão do campo CPF/CNPJ no Borderô para pagamento.
- Resolução da Pendência Nº 2058
  > Tela\Opçao No Sistema: 
  Na consulta de qualquer parcela já baixada de   
  um documento  parcelado, aparece no campo situação do documento "Em aberto". O sistema baixa corretamente o documento, porém na tela, apresenta "Em aberto".
================================================================================
CM$VER      2.24.04     15/06/2000
--------------------------------------------------------------------------------
- Certificados de Retenção
  Alterações no Layout
================================================================================
CM$VER      2.24.03     14/06/2000
--------------------------------------------------------------------------------
- Contas a Receber
  Implementação da tela recebimentos X Pagamentos
- Relatório Recebimentos em Aberto
  Inclusao do filtro tipo de documento no 
- Lançamento de Documentos
  Inclusao do usuário que inclui o documento
- Parâmetros do Relatório de Ordem de Pagamento
  Inclusão da indicação do alterador equivalente a retenção
- Resolução da Pendência Nº 1993
  > Tela\Opçao No Sistema: Nova tela de Baixa
  Fazer nova tela de baixa onde se pode baixar documentos do contas a receber junto com o contas a pagar e gerar somente um lançamento no financeiro e somente uma planilha na contabilidade.
================================================================================
CM$VER      2.24.02     09/06/2000
--------------------------------------------------------------------------------
- Recebimento Manual 
  Implementação no tratamento de erro ao Buscar Dados Para Contabilização da Baixa;
- Emissão de Ficha de Compensação
  Correção na seleção das mensagens associadas ao documento para impressão;
  Indicação do nº de registros a serem impressos;
  Implementação da Possibilidade de cancelamento da impressão;
  Otimização da consulta de seleção dos registros;
- Exclusão de Baixas (Documentos)
  Otimização na consulta de seleção de documentos baixados
- Exclusão de Baixas (Lote)
  Otimização na consulta de seleção de documentos baixados
- Cadastro de Clientes
  Inclusão das Colunas 'Status do Crédito' e 'Valor do Crédito' no cadastro de clientes;
- Impressão do Certificado de Retenção
  Correção na seleção de retenções para impressão geradas pela tela de pagamento manual
- Lançamento de Documentos
  Correção na Descrição do Status para documento Cancelado
- Consulta de Documento
  Correção na seleção dos documento: Documentos estornados apareciam Duplicados
- Configuração e emissão da Ficha de Compensação
  Correção na impressão do número da Agência\Código do Cedente
  Correção no cálculo do Dv e composição do Código de Barras e Linha Digitável para o banco Real
- Cadastro de Contas Bancárias
  Ordenação da consulta de Bancos e Agências
  Correção na validadação das contas bancárias.
================================================================================
CM$VER      2.24.01     05/06/2000
--------------------------------------------------------------------------------
- Certificado de Retenção
  Correção na impressão dos números das fatura envolvidas no lote
- Lançamento de Adiantamentos
  Implementação da opção de Lança e baixa simultânea
- Configuração e emissão de Fatura
  Indicar alterador para Imposto/Agregado e incluir no layout o VALORRATEIOIMP
- Lançamento de Documento  
  Erro na gravação da Atividade/Projeto no rateio do Documento;
- Pagamento Manual
  Cancelamento do cálculo da retenção ao ocorrer erro no momento da baixa do documento;
  Correção na posição da pasta de seleção no momento da abertura da tela;
- Relatório TRIAL BALANCE
  Correção do erro "Cannot modify a read-only dataset"
- Relatório DEMONSTRATIVO SINTETICO DE GESTAO
  Correção do erro "No SQL statment available"
- Relatório de SALDOS DOS CLIENTES POR TIPO
  Correção do erro "Divisor is equal to zero"
- Relatório de Carta de Cobrança
  Correção na Duplicidade dos lançamentos
- Parâmetros para emissão da carta de cobrança
  Correção na seleção de Layouts configurados - Passou a listar apenas Layout de Carta de Cobrança, antes listava layout de Recibos;
- Configuração de Carta de Cobrança
  Correção na seleção de Layouts para alteração - Passou a listar apenas Layout de Carta de Cobrança, antes listava layout de Recibos;   
  
  
================================================================================
CM$VER      2.23.05     02/06/2000
--------------------------------------------------------------------------------
- Alteração de Cobranças/Ficahs de Compensação Emitidas
  Correção na seleção dos arquivos de remessa gerados evitando duplicação de registros
- Libera Reimpressão de Bloquetos
  Otimização na seleção de bloquetos
  Alterações no Layout da Tela
- Configuração\Emissão de Fichas de Compensação
  Correção na seleção de documentos a serem impressos;
  Implementação do tratamento de erros de seleção de documentos e impressão;
  Correção na gravação da impressão dos documentos;
- Lançamentos de Adiantamentos
  Implementação da opção de Lança e Baixa Simultânea
================================================================================
CM$VER      2.23.04     01/06/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na gravação do centro de resposabilidade padrão para o rateio de documentos;
- Emissão do Certificado de Retenção
  Correção do cálculo dos valores do certificado para valores que não tiveran retenção e para vários documentos
  no mesmo lote;
================================================================================
CM$VER      2.23.03     30/05/2000
--------------------------------------------------------------------------------
- Alteração na Retenção de Impostos
  Gravação do Tipo de Documento e Do Numfatura para integração com livro fiscal;
- Importação de Lançamentos
  Correção da gravação da unidnegoc ao importar lançamentos;
================================================================================
CM$VER      2.23.02     30/05/2000
--------------------------------------------------------------------------------
*****************************
15/05/2000 - Alterações Funcef
*****************************
- Relatório de Autorização de Pagamentos
  Altreração na chamda da tela de parâmetros do relatório de "Autorização de Pagamentos - Modelos 2"
  para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Tela de Parâmetros do Relatório de Autorização de Pagamentos
  Altreração na passagem de parâmetros do relatório de "Autorização de Pagamentos - Modelos 2"
  para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Parâmetros do Sistema
  implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Tipo de Desembolso X Centro de Custo X Conta Contábil
  Inclusão da coluna de Analítico/Sintético na procura de Tipo de Desembolso/Recebimento e
  Centro de custo;
- Modulo
  Criação das propriedades...
  IdReports           :Integer
  OrigemCm            :Integer
  NomeReport          :String
  FormEventos         :String
  FormParam           :String
  PpReports           :String
  CodDocumento        :LongInt
  ...para contemplar a implementação do Parâmetro do Sistema "Relatório para Espelho de Documento";
- Exportação de Lançamentos
  ALteração na gravação do arquivo de saída: Exclusão de quebras de linha do campo observação;
- Lançamento de Documentos
  Implemetação da impressão do espelho do documento de acordo com o parâmetro configurado no
  sistema;
  Correção na seleção dos centros de custo de acordo com a conta contábil;
  Implementação da visualização do saldo do documento durante a inclusão do mesmo;
*****************************
16/05/2000 - Alterações Funcef
*****************************
- Relatório de Autorização de Pagamentos - Modelo 2
  Correção do erro "Field 'TRGDTINCLUSAO' not found" ao exibir relatório;
  Alterções no layout;
  Inclusão do Logo da empresa;
- Relatório de Lançamento de Documentos - Modelo 2 
  Implementação do Relatório;
- Lançamento de Documentos
  Implementação da restrição de impressão o "Espelho do Documento": Imprime somente para lançamentos efetivos;
  Correção da gravação do centro de custo indicado no rateio na contabilização do lançamento;
  Inclusão do Código do Centro de Custo na Pasta de contabilização;
- Agrupa Parcela
  Implemetação da impressão do espelho do documento de acordo com o parâmetro configurado no
  sistema;
- Altera Agrupa Parcela
  Implemetação da impressão do espelho do documento de acordo com o parâmetro configurado no
  sistema;
*****************************
17/05/2000 - Alterações Funcef
*****************************
- Lançamento de Documentos
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;
  Listagem de Todos os Centros de Custo no Rateio quando a opção de não integrar com a
  contabilidade estiver selecionado;
  Exibir o nome do centro de custo no Grid do Rateio do Documento;
- Contas Bancárias/Caixas x Formas de Pagamento
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;- Parâmetros do Relatório Posição por Cliente
- Cadastro de Alteradores
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;- Impostos com Tabela de Retenção
- Transferência de Classificação de Documentos em Atraso
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;- Relatório de Lançamentos Contábeis
- Tipo de Desembolso X Centro de Custo X Conta Contábil
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil;
- Parâmetros do Sistema
  Iclusão dos parâmetros associados ao cadastro do tipo de Desembolso\Cobrança
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
  > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
- Cadastro de Tipo de Desembolso\Cobrança
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
  > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
- Cadastro de Tipo de Desembolso\Cobrança X Centro de Custo X Conta Contábil
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta Contábil (FLGTRDXCCXCONTA)
- Cadastro de Tipo de Desembolso\Cobrança X Centro de Custo X Impostos Agregados
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Centro de Custo X Impostos Agregados (FLGTRDXIMPOSTOS)
- Cadastro de Tipo de Desembolso\Cobrança Ramo de Fornecedor
  Altereções para respeitar os novos parâmetros do sistema:
  > Vincula a Inclusão ao Relacionamento com Ramo de Fornecedor (FLGRAMOTIPOFORCLI)
- Relatórios de Lançamento de Documento Modelo 2
  Ordenação do Relatório por Data de Vencimento e Número da Ap
******************************
18/05/2000 - Alterações Funcef
******************************
- Implementação do Módulo o CMPerfil.
- Criação de Lote
  Inclusão da opção de filtro por documento marcado.
- Tipo de Desembolso X Centro de Custo X Conta Contábil
  Implementação da possibilidade de replicar o relacionamento para vário centros de custo;
- Lançamento de Documentos
  Correção do Erro 'Data Set Not In Edit Or Insert Mode' ao alterar documento
- Lançamento de Documentos Modelo 2
  Correção nos totalizadores do relatório;
- Relatório de Demonstrativo de Gestão de Pagamento:  
  Corrigir o relatório quando existe um rateio no documento.
  Colocar ordenação no relatório
  Colocar totalizador no relatório
  Colocar filtro de ordenar por número da A.P. ou Dt. Vencimento
  Colocar filtro por data de lançamento (Triger)
- Alterações Centrao de Atendimento ( Antídia )
******************************
19/05/2000 - Alterações Funcef
******************************
- Alterações Centrao de Atendimento ( Antídia )
- Arquivo de Exportação de Lançamentos
  Correção na formatação de Texto no arquivo de saída
- Relatório Demonstrativo Gestão de Pagamentos
  Correção no totalizador dos valores do relatório
  Alterações no Layout
- Cadastro de Tipos de Desembolso X Centro de Custo X Conta Contábil
  Correção na associação de vário centros de custo ao Tipo de Desembolso X Conta Contábil
******************************
Alterações Conceição
******************************
- Valor Pagos Por Centro de Responsabilidade e Previsão de Pagamentos Por Centro de Responsabilidade
  Correções na consulta da tela de parâmetros
- Consulta de Ordem de Pagamento
  Implementação da Consulta
- Criação de Lote
  Inclusão do filtro por sistema de origem
- Cancelamento de Lote
  Implementação do cancelamento do NumSlip ao cancelar o lote de um documento
- Emissão de Ordem de Pago
  Alterado a qryordempago no drelatoriscapcar2.pas e no dfm.
  Alterado alterei a QryContabLancLote ,QryContab3Lote, QryContabBaixaLote, QryContaFornCli e o RptContaFornCli no drelatoriscapcar2
- Relatório de AP/GR
  Alterado QrytotApGr do dtmrelatoriocapcar para nao inverter o valor se for lança baixa simultanea.
- Lançamento de Documentos
  Inclusão da Descrição da Conta-Contábil no momento do lançamento.
******************************
Alterações São Paulo
******************************
- Certificado de Retenção
  Implementação da emissão do certificado para várias fatura;
  Implementação da máscara para formatação do número do certificado;
  Correção na consulta de impressão do certificado;
- Emissão de Ordem de Pago
  Correção na Rotina de extenso do valor da OP;
- Resolução da Pendência Nº 1969
  > Tela\Opçao No Sistema: Emissão de Certificado de Retenção
  * Pode Conter Várias Faturas No Mesmo   Certificado > Ex. Toda a retenção do mesmo   tem que estar no certificado e o número das   respectivas faturas;
* Numeração automática dos certificados de     retenção
================================================================================
CM$VER      2.20.06     12/05/2000
--------------------------------------------------------------------------------
- Relatório de Bloquetos Emtidos
  Alteração na frase 'Bloquetos Emetidos'
- Relatório de Conta Corrente de Cliente
  Inclusão da coluna Tipo de Documento;
- Resolução da Pendência Nº 1215
  > Tela\Opçao No Sistema: Relatório de Documentos Lançados
  Ao lançar um doc, marcando p/ parcelar, quando consultamos o relat. de docs lançados o sistema mostra o doc e suas parcelas, totalizando errado.
- Resolução da Pendência Nº 1110
  > Tela\Opçao No Sistema: 
  NO RELATORIO DE DOCUMENTOS POR DATA DE PAGAMENTO, INCLUIR O CAMPO DE ALTERADORES,  E VALOR LIQUIDO DO DOCUMENTO.
OBS: COMO EXISTE NO DOCUMENTOS LANCADOS
================================================================================
CM$VER      2.20.05     10/05/2000
--------------------------------------------------------------------------------
- Relatório de Documentos em Aberto
  Implementação da tela de parâmetros com filtro por Data, PortadorForma;
- Estorno de Baixa
  Implementação da opção de marcar todos e inverter seleção para estorno;
- Lançamento de Documentos
  Alteração na seleção de centro de custo no rateio do documento de acordo com
  a associação de Tipo de Desembolso/Recebimento X Centro de Custo X Conta Contábil
  para Tipos de Desembols/Recebimento sem conta contábil;
  Repetição do centro de responsabilidade anterior na inclusão de novos registros de rateio
- Recebimento Manual
  Correção na visualização dos dados para baixa ao selecionar o(s) documento(s) para baixa;
- Relatório de Aprovação de Documentos\Guia de Recebimento
  Implementação do testa para Guia de Devolução quando o somatório dos saldo dos documentos listados
  no relatório for negativo
- Resolução da Pendência Nº 1971
  > Tela\Opçao No Sistema: Alteração da Retenção da Baixa
  * Solicitar o número do Certificado de retenção
 * Possibilitar o cancelamento da retenção
- Resolução da Pendência Nº 1977
  > Tela\Opçao No Sistema: Lançamento de Documentos
  Teste da Pendência 1952:
Ao indicar uma data de emissão repetir a mesma da data de lançamento e ao indicar a data de vencimento repetir a mesma na programada
- Resolução da Pendência Nº 1978
  > Tela\Opçao No Sistema: Lançamento de Documentos
  Teste da Pendência 1953:
Repetir a atividade projeto, centro de custo, tipo de desemboslo do rateio num próximo intem cadastrado
- Resolução da Pendência Nº 1979
  > Tela\Opçao No Sistema: Lançamento de Documentos
  Teste da Pendência 1954:
Verificar a situação de 'Parcelado/Englobado' ao alterar um documento
- Resolução da Pendência Nº 1981
  > Tela\Opçao No Sistema: Agrupa/Parcela
  Teste da Pendência 1956:
Em todas as rotinas que aparecem mensagens de parcelamento alterar para parcelamento/agrupamento
- Resolução da Pendência Nº 1996
  > Tela\Opçao No Sistema: LANCAMENTO / REGISTRA / DOCUMENTO
  Registro de prestação de contas com devolução de adiantamento (ou seja, documento fica com saldo), gerar lançamento no Contas a Receber para emissão de GR ou então criar relatório no contas a pagar tipo GR. 
================================================================================
CM$VER      2.20.04     09/05/2000
--------------------------------------------------------------------------------
- Relatório de Conta Corrente de Clientes
   Alterações para respeitar parâmetros de 'Agrega valor do alterador ao saldo do documento' e 'Agrega valor do alterador na baixa do documento' 
- Lançamento de Documentos\Adiantamento\Previsão
   Correção na seleção das opções de Agrupa Parcela, Contabiliza e Lança e Baixa: Não permitia a seleção das mesmas;
- Resolução da Pendência Nº 1901
  > Tela\Opçao No Sistema: Retenção de Impostos
  Inclusão do Teste do Centro de Custo Associado Ao Tipo de Desembolso no Momento da retenção dos impostos.
================================================================================
CM$VER      2.20.03     08/05/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Correção do erro 'Cannot focus a disble or invisible window';
- Emissão da cópia de cheque
  Correção do erro 'Acces Violation';
================================================================================
CM$VER      2.20.02     05/05/2000
--------------------------------------------------------------------------------
- Contas Caixas X Tipos de Cobrança
  Inclusão da associação do modelo da ficha de compensação (Código de barras)
  ao portador forma no contas a receber;
- Tipo de Desembolso
  Inclusão da coluna histórico para lançamento contábil;
- Cadastro de Alterador
  Agregar o valor do alterador no saldo para emissão de relatórios;
  Agregar o valor do alterador ao valor da baixa;
- Agrupamento\Parcelamento de Documento Inclusão\Alteração
  Implemetação da retenção de impostos para documento agregados\parcelados;
- Resolução da Pendência Nº 1811
  > Tela\Opçao No Sistema: Bloquete
  Imprimir bloquete de qualquer banco por dentro do sistema de contas a receber como no banco do brasil.
- Resolução da Pendência Nº 1903
  > Tela\Opçao No Sistema: Impressão de Bloquetos\Arquivo IntBanco
  Implementar 'RollBack' ao cancelar impressão de Bloquetos
- Resolução da Pendência Nº 1911
  > Tela\Opçao No Sistema: Principal
  Verificar Autorização
- Resolução da Pendência Nº 2000
  > Tela\Opçao No Sistema: 
  Fazer com que o sistema possa trazer o histórico padrão da contabilidade.
================================================================================
CM$VER      2.20.01     20/04/2000
--------------------------------------------------------------------------------
- Correções Gerais no Raltório de demostrativo de gestão analitico;
- Correções Gerais no Raltório de demostrativo de gestão sintético;
- Correções Gerais no Raltório de Autorização de Pagamentos Modelo II;
================================================================================
CM$VER      2.19.04     18/04/2000
--------------------------------------------------------------------------------
- Implementação do Relatório Demonstrativo Sintético de Gestão
- Tipo de Documento
  Inclusão da indicação 'Consiste em Documento Bancário' para o tipo de documento
- Cadastro de Fornecedor, Cliente, Banco, Agência
  Otimização nas consultar do procurar, banco e agência
- Implementação dos Relatórios
  Demonstrativo de Gestão
  Autorização de Pagamento modelo 2
- Correção na Consulta de Documento
- Contas Caixas x Tipos de Cobrança
  Correção na constraint com empresaforn ao confirmar a inclusão/alteração sem
  a indicação do Cliente/Fornecedor para lançamento de Documento associado a Imposto;
- Forma de Pagamento/Tipo de Recebimento
  Inclusão da indicação de associação do tipo/forma a Documentos Bancários
- uDocumento
  * Inclusão da propriedade na Classe TDocumento:
    Property NumApg            :LongInt         read fNumAp             Write fNumAp; 
  * Inclusão do Método ValidaNumApGr
- Exprotação de Lançamentos
  Implementação da Tela
- Agrupamento de Documentos
  Implementação da indicação do Número da AP\GR
- Altera Agrupamento\Parcelamento
  Implementação da indicação do Número da AP\GR
- Lançamento de Documentos
  Implementação da indicação do Número da AP\GR
================================================================================
CM$VER      2.19.03     13/04/2000
--------------------------------------------------------------------------------
- Configuração/Emissão de Certificados de retenção
  Correção no tamanho do campo 'DESCCUSTAGREG';
================================================================================
CM$VER      2.19.02     12/04/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Correção da mensagem 'Abstract error' ao selecionar documento para baixa;
================================================================================
CM$VER      2.19.01     11/04/2000
--------------------------------------------------------------------------------
- Estorno de Baixas
  Correção do estorno do financeiro: Correção na gravação da Entrada/Saída de
  acordo com o D/C do documento e o 'sinal' do valor baixado
- Pagamento Manual
  Correção no lançamento de baixa no financeiro: Estava gravando entrada como saída
  e vice versa
- Alteração de Centro de Respomsabilidade
  Correção na rotina de Alteração de Centro de Responsabilidade para os documentos
  baixados num lote.
================================================================================
CM$VER      2.19.00     07/04/2000
--------------------------------------------------------------------------------
- Cadastro de Impostos\Agregados
  Otimizada a abertura do Combo de Tipo de Desembolso;
  Correção do Teste de Analítico\Sintético para o centro de responsabilidade;
  Correção do Teste de obrigatoriedade de preenchimento para o centro de responsabilidade;
  Correção do Teste de obrigatoriedade de preenchimento para o centro de custo;
  Correção da exibição da pasta dos detalhes ao alterar\confirmar registros;
- Lançamento de Documento
  Inclusão das colunas Referência e Observação na pasta Geral dos lançamentos;
- Agrupa\Parcela Documentos
  Inclusão das colunas Referência e Observação na pasta Geral dos lançamentos;
- Alteração Agrupa\Parcela Documentos
  Inclusão das colunas Referência e Observação na pasta Geral dos lançamentos;
  
  
================================================================================
CM$VER      2.18.06     06/04/2000
--------------------------------------------------------------------------------
- Lançamento de Documento
  Inclusão dos Campos Observação e Referência na pasta Geral;
-Relatório de Posição por Cliente e Saldos dos Clientes por Tipo
 Correção de Divisão por Zeros
- Altera Operação de Parcela\Engloba 
  Correção na atualização da operação
- Lançamentos de Documentos
  implementação para repetir a Atividade de projeto ,Centro de Custo ,
  Tipo de desembolso do Rateio.
  Correção da situação 'Parcelado/Englobado' ao Alterar um Documento.
- Consulta de Fornacedores
  Correção estava duplicando documentos.
- Agrupa/Parcela
  Implementação do Agrupamento nas mensagens
================================================================================
CM$VER      2.18.05     05/04/2000
--------------------------------------------------------------------------------
- Pagamento Manual
  Acerto do erro para aceita o preenchimento do Grupo Cnab
-Relatório de Posiçao de Saldos e Trial Balance
 Correção de Divisão por Zeros
- Altera Operação de Parcela\Engloba 
  Implementei mensagem para confirmação da operação.
- Criação de Lote 
  Implementei filtro por forma de pagamento.
- Lançamentos de Documentos
  Na inclusão esta repetindo a data de emissão para a data de lançamento
  Na inclusão esta repetindo a data de vencimento para a data programada
  
================================================================================
CM$VER      2.18.03     29/03/2000
--------------------------------------------------------------------------------
- Consulta Documentos
  Correção da seleção de documentos para filtrar por empresa proprietária;
- Cadastro de Impostos\Agregados
  Correção no erro de constraint ao Inserir Imposto Sem Indicar o Fornecedor/Cliente;
  Correção na consulta da contabilização após inserir um Imposto/Agregado;
  Correção no tamanho da tela;
  Correção na montagem da consulta do Centro De Custo e Habilitação do Combo para a
  indicação do mesmo de acordo com a Conta Contábil Escolhida;
  Correção na montagem da consulta do Tipo de Desembolso e Habilitação do Combo para a
  indicação do mesmo de acordo com a indicação do fornecedor ou não;
  Filtrar Atividade/Projeto, Centro de Custo e Centro de Responsabilidade Por Empresa Proprietária;
- Inclusão das Telas de Integração com o VHL no Contas a Receber Menu Sistema\Ultilitários;
================================================================================
CM$VER      2.18.02     27/03/2000
--------------------------------------------------------------------------------
- Regularização de Adiantamento - Estorna/Exclui;
  Implementação da tela para Estorno\Exclusão da regularização de adiantamento;
- Lançamento de Alteradores
  Correção do Estorno de Alteradores;  
================================================================================
CM$VER      2.18.01     24/03/2000
--------------------------------------------------------------------------------
- Emissão de Bloquetos
  Correção do erro 'Field CODTIPDOC' not exixts';
- Cadastro de Tipo de Recebimento/Desembolso X  Centro de Custo X Conta Contábil  
  Implementação do Cadastro
- Lancamento de Documentos
   Implementação do teste do relacionamento de Tipo de Recebimento/Desembolso X
   Centro de Custo X Conta Contábil no momento da contabilização de acordo com
   o rateio
================================================================================
CM$VER      2.18.00     23/03/2000
--------------------------------------------------------------------------------
 Alteração na Estrutura de Impostos
  * Inclusão do Tratamento Fiscal 'Lança Imposto Como Novo Documento' ;
  * Inclusão do Parâmentro 'Altera Inposto Na Baixa' na tela de lançamento de
     Impostos;
  * Implementação da Retenção somente para Documentos Fiscais ( Ver Cadastro  
    de tipo de documento );
  * Inclusão dos Dados Para Lançamento de Documento na tela de Lançamento de
    Impostos;
  * Alteração na estrutura de impostos para respeitar o relacionamento de:
    > Impostos X Clientes;
    > Impostos X Classificação Fiscal X Tipo Recebimento
    > Impostos X Tipo de Recebimento
  * Correção no cáculo do imposto na baixa e implementação
     da verificação da 'alteração da retenção no momento da baixa' ( Vide Cadastro de Impostos Agregados );
- Implementação da tela de Alteração de dados Bancários do Documentos
   Altera a Forma de Pagamento/Recebimento
   Altera Dados da Ficha de Compensação 
   Altera Contas/Caixas x Tipos de Desembolso
  - Reimpressão de Bloqueto
       Erro para Liberar a Reimpresão
       Filtro por Tipo de Cliente , Sistema de Origem
- Impressão de Bloqueto
  Filtro por Sistema de Origem
================================================================================
CM$VER      2.17.17     15/03/2000
--------------------------------------------------------------------------------
- Implementação do Relatório 'Tryal Balance' contendo os valores a vencer
e em aberto de acordo com os parâmetros configurados no sistema agrupados por
tipo de cliente e listando analiticamente os documentos.
================================================================================
CM$VER      2.17.16     14/03/2000
--------------------------------------------------------------------------------
- Contas Caixas x Tipo de Cobrança
   Correção da mensagem 'Data Set is not in Edit ou Insert Mode' ao excluir documentos;
================================================================================
CM$VER      2.17.15     13/03/2000
--------------------------------------------------------------------------------
- Correção no cáuculo do Float na Baixa de Documentos;
- Correção na seleção de documentos com o nosso número para a baixa de arquivos Intbanco;
- Implementação do Relatório de lançamentos contábeis;
================================================================================
CM$VER      2.17.14     10/03/2000
--------------------------------------------------------------------------------
- Baixa Manual
  Correção na seleção de Documento - Erro 'List Index Out Of Bound'
================================================================================
CM$VER      2.17.13     09/03/2000
--------------------------------------------------------------------------------
- Emissão de Faturas e Notas de Débito
  Correção da Mensagem Invalid Field Name 'IDFORCLI' ao Imprimir Faturas;
================================================================================
CM$VER      2.17.12     03/03/2000
--------------------------------------------------------------------------------
- Correção dos Relatórios:
  Autorização de Pagamento - A AP era criada mas não era impressa;
 Borderô - Problema na Reimpressão;
 Valores Pagos - Correções gerais na consulta
 Posição dos Saldos Por Tipo de Cliente - Estava somando os Estornos;
  
================================================================================
CM$VER      2.17.11     03/03/2000
--------------------------------------------------------------------------------
- Tipo de Recebimento x Impostos Agregados
  Implementação da tela
- Classificação Fiscal X Imposto / Agregado
  Implementação da tela
- Emissão de Bloquetos
  Correção na consulta para seleção de bloquetos: Não somava o valor do juros
  trazendo bloquetos não agrupados
- Importação de lançamentos
  Correção na gravação do número de lançamento de origem na inclusão do Imposto
================================================================================
CM$VER      2.17.10     02/03/2000
--------------------------------------------------------------------------------
- Correção dos Relatórios:
  Guia de Recebimento - A GR era criada mas não era impressa;
  Valores Recebidos - Correções gerais na consulta
  Posição dos Saldos Por Tipo de Cliente - Estava somando os Estornos;
================================================================================
CM$VER      2.17.09     01/03/2000
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na alteração do rateio: Não exibia o centro de custo associado;
- Importação de Lançamentos
  Correção na função ValidaNumDoc (i): Erro 'Field ''CODDOCUMENTO'' not found';
================================================================================
CM$VER      2.17.08     29/02/2000
--------------------------------------------------------------------------------
- Integração com Orçamento
  Correção na comparação com o valor do compromisso: Acerto nas casas decimais;
- Integração com Sistema Financeiro
  Correção no dia do lançamento caso caia em Final de Semana. Para o Contas a Receber
  Lança na 'Segunda', no Contas a Pagar lança na 'Sexta'; 
- Lançamento de Documentos
  Correção na função de verificação dos lançamentos efetuados para o documento 
- Alteração da Operação de Englobado\Parcelado
  Implementação do formulário
- Relatório de Bloquetos Emitidos
  Implementação do Relatório
================================================================================
CM$VER      2.17.07     24/02/2000
--------------------------------------------------------------------------------
- Relatório de Retenção de Impostos
  Correção na consulta;
- Relatório Ficha Financeira Para Recebimento
  Correção na consulta de contabilização da baixa;
- Pagamento Manual
  Correção na retenção de impostos agregados no momento da baixa possibilitando o cancelamento de uma retenção
- Lançamento de Documento
  Correção da atribuição do número do documento para lançamentos com tipo de documento marcado para gerar a numeração indicada;
================================================================================
CM$VER      2.17.06     15/02/2000
--------------------------------------------------------------------------------
- Cadastro da Classificação Fiscal
  Implementação do Teste do preenchimento do código reduzido da classificação fiscal;
- Impressão do Certificado de Retenção
  Implementação do teste da exiostência do nº do certificado de retenção no
  momento da reimpressão não permitindo a alteração do mesmo;
- Lançamento de Documentos
  Implementação do teste da associação da classificação fiscal ao fornecedor
  qdo o sistema obriga a associação da classificação fiscal ao complemento do
  documento;
  Implementação da autorização do Lança e baixa Simultânea e Do Não Contabilizar;
- Emissão de Bloquetos
  Correção na seleção da data de emissão dos Bloquetos  
- Transferência de Classificação
  Correção da consutla de transferência contábil   
- Ficha Financeira Para Pagamento/Recebimento
  Inclusão da seleção por lote e possibilidade de imprimir a Ficha Para todos
  os documento do lote selecionado;
  Gravação de um número sequencial para as fichas geradas;
  Inclusão de texto para autenticação do formulário. Impresso por default no
  rodapé do relatório;
- Libera Reimpressão de Bloquetos
  Implementação da Tela para liberar a reimpressão de bloquetos
================================================================================
CM$VER      2.17.05     14/02/2000
--------------------------------------------------------------------------------
- Estorno de Baixas
  Correção do estorno do financeiro;
- Trabsferência de Classificação
  Otimização do Formulário
  Correção na transferência contábil
================================================================================
CM$VER      2.17.04     10/02/2000
--------------------------------------------------------------------------------
- Alteração/Exclusão de Pagamentos
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
- Estorno de Baixas
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
- Parâmetro do Relatóro de Recolhimento de Encargos
  Inclusão dos Agregados e dos Impostos do Tipo Somente Calcula valor no relatório
- Baixa Manual
  Implementação da retenção dos impostos/agregados na baixa do documento
- Retenção de Impostos/Agregados
  Implementação do cálculo da retenção de impostos/agregados de acordo com o 
  parâmetro de baixa do documento
================================================================================
CM$VER      2.17.03     07/02/2000
--------------------------------------------------------------------------------
- Relatorio Valores Pagos/Recebidos
  Otimização da consulta do relatório
- Extenso
  Correção do extenso em Espanhol
- Emissão e Configuração do Certificado de Retenção
  Alteração da Coluna Logradouro da tabela de endereço para o novo padrão
  
================================================================================
CM$VER      2.17.02     04/02/2000
--------------------------------------------------------------------------------
- Emissão de Bloquetos
  Correção do campo Logradouro do endereço para 60 posições
  Correção da seleção de documentos para emissão qdo os mesmo
  constituirem um grupo
  Alteração no layout da Cobrança Com Código de Barras do Banco do
  Brasil: Aumento da fonte da mensagem.
================================================================================
CM$VER      2.17.01     02/02/2000
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Correção da confirmação de alteração no cadastro
================================================================================
CM$VER      2.17.00     31/01/2000
--------------------------------------------------------------------------------
- Geral
  Atualização de todas as consultas que acessam os dados do Endereço e Telefone;
================================================================================
CM$VER      2.16.05     28/01/2000
--------------------------------------------------------------------------------
- Relatório de aprovação de documentos
  Implementação da tradução do extenso de acordo com o idioma do sistema
- Configuração e Impressão de Recibo
  Implementação da tradução do
================================================================================
CM$VER      2.16.04     25/01/2000
--------------------------------------------------------------------------------
- Cadastro de Alteradores
  Inclusão do teste da associação do alterador a um imposto. Em caso de já
  estar associado a um imposto não pode ser efetuado o calculo de imposto
  sobre o lançamento para tal alterador 
- Cadastro de Impostos e Agregados
  Inclusão da Indicação de cálculo pelo valor bruto ou líquido do lançamento.
  Ultilizado para retenções de impostos no almoxarifado.
- Importação de Documentos
  Alteração no lançamento de impostos com tabela de retenção. Correção do erro
  de constraint com a tabela lanctodocum
- Lançamento de Documentos
  * Alteração na retenção de impostos através da Indicação de Débito/Crédito 
    para acerto no cáculo de devolução de imposto;
  * Implementação da Geração Automática do Número do Documento de acordo com o
    indicado no Tipo de Documento Associado
  * Alteração no lançamento de impostos com tabela de retenção:
    Passou a ser informado se o lançamento é de acréscimo ou de decrescimo para
    possível devolução de uma retenção.
    Passou a ser verificado se para cada tipo de recebimento/desembolso é obrigatório
    o cáculo e lançamento de Imposto fazendo com que somente seja calculado o
    imposto para os valores lançados para os tipos de recebimento/desembolso
    associados;  
- Lançamento de Alteradores
  Alteração na retenção de impostos através da Indicação de Débito/Crédito 
  para acerto no cáculo de devolução de imposto
================================================================================
CM$VER      2.16.03     24/01/2000
--------------------------------------------------------------------------------
- Cadastro de Cliente
  Ordenação do Grid de Impostos e Agregados;
- Lançamento de Documento
  Inclusão do saldo do documento juntamente com a indicação do status
- Relatórios
  * Alteração no relatório de AP e GR na listagem de documentos como lança e baixa.
    Coorreção na impressão do histório de baixas;
  * Relatório de Documentos Lançados
    Correção na impressão da Razão Social com Número do cumento e valor com o histórico
================================================================================
CM$VER      2.16.02     19/01/2000
--------------------------------------------------------------------------------
 - Configuração de Recibo 
 Implementação da Configuração e Impressão de recibo
 - Relatorio de Fichas Financeiras
 Gravação da emissão das Fichas Financeiras possibilitando a seleção das fichas pendentes de impressão
 - Altera Exclui Pagamento
 Alteração na exclusão da baixa: a exclusão da baixa cancelava o lote sem
 excluir do financeiro.
 - Cadastro de Impostos Retidos
 Correção no cálculo do impostos qdo setado para acumula valor e o valor retido era menor que zero,
 nesta situação não acumulava valor;
 - Cadastro de Clientes
 Correção na Pasta de Impostos Agregados pois para sistema sem a solução Total Prev, aparecia como
 tipos de cliente
 - Exclusão de Agrupa/Parcelas 
 Não Excluía os lançamentos referents ao documento parcelado/englobado (Operação 3 ou 13) 
================================================================================
CM$VER      2.16.00     12/01/2000
--------------------------------------------------------------------------------
- Implementação da estrutura de Impostos e agregados no Contas a Receber
- Relatório de Posição dos Saldos 
   Correção na consulta no tratamento dos estornos
- Relatório de Posição Por Forncedores/Clientes
   Correção na consulta no tratamento dos estornos
- Lançamento de Alterador
   Alteração na retenção de impostos para verificar se são calculado os impostos
   sobte o lançamento do alterador
- Alteração de Saldos
   Alteração na retenção de impostos para verificar se são calculado os impostos
   sobte o lançamento do alterador
- Cadastro de Alterador
   Inclusão da indicação da retenção de impostos agregados ao fornecedor no 
   momento do lançamento do mesmo
================================================================================
CM$VER      2.15.01     12/01/2000
--------------------------------------------------------------------------------
- Certificados de Retenção
   Implementação do cadastro.
   Configuração e impressão dos Certificados de Retenção de imposto
- Relatório 'Borderô Tipo Ordem de Pagamento'
  Alteração no Número da agência
  de Débito etava sendo exibido no lugar do nome da agência
- Exclusão\Estoro de lote
  Verificação da existência de uma regularização para o documento a ser excluído
  ou se o documento equivale a um adiantamento já regularizado, não permitindo
  assim a exclusão/estorno do mesmo
- Estorno de Documentos
  Verificação da existência de uma regularização para o documento a ser excluído
  ou se o documento equivale a um adiantamento já regularizado, não permitindo
  assim a exclusão/estorno do mesmo
- Pagamento Eletrônico IntBanco
  Implementação do processo do RAD de controle de pagamentos
- Pagamento Manual
  Inclusão da coluna código do documento na opção de procura documento/complemento
- uModulo (i)
   Implementação do método ExisteRegularizacao onde é verificado se ocorreu a
   regularização de um adiandamento ou se um documento possui regularização
   através do parâmetro código do documento;
- Relatório de Documentos Por Data Programada
  Inclusão do filtro por tipo de documento;
  Otimização da Query do relatório (i)
================================================================================
CM$VER      2.15.00b    03/01/200
--------------------------------------------------------------------------------
- Correção nas telas de Cadastro de Tipo de Documentos e fornecedor
================================================================================
CM$VER      2.15.00a    03/01/2000
--------------------------------------------------------------------------------
- Correção nas telas de Cadastro de Tipo de Fatura e Parâmetros do Sistema 
  Compatibilizando o tipo dos campos no 'Fields Editor' com os da base
================================================================================
CM$VER      2.15.00     30/12/1999
--------------------------------------------------------------------------------
- Cadastro de Tipos de Documentos
  Inclusão da classifiacação do documento como documento fiscal;
  Indicação do tipo do documento com relação ao engloba/parcela: O Tipo do
  Documento pode caracaterizar sempre um engloba/parcela, pode não caracterizar
  um engloba/parcela ou pode ser definido pelo usuário no momento do lançamento
  do mesmo;
- Impressão de Bloqueto
  Inclusão da opção de ultilização de fonte condensada na impressão do bloqueto;
- Parâmetros do CapCar
  Inclusão do Parâmetro para indicação da máscara do numero do documento e da
  associação do código reduzido da fatura ao complemento do documento;
- Lançamento de Documentos
  Implementação da máscara do documento e associação do código reduzido do tipo
  de fatura ao complemento do documento de acordo com os parâmetro do sistema;
  Gravação do Tipo de Documento, Código Formatado do documento e tipo de fatura no
  lançamento do documento;
  Verificação do tipo do documento com relação a agrupa/parcela;
- Agrupamento de Documentos Inclusão/Alteração
  Implementação da máscara do documento e associação do código reduzido do tipo
  de fatura ao complemento do documento de acordo com os parâmetro do sistema;
  Gravação do Tipo de Documento, Código Formatado do documento e tipo de fatura no
  lançamento do documento;
  Verificação do tipo do documento com relação a agrupa/parcela;
- Tipos de Fatura
  Implementação do cadastro;
  Cadastro de Tipos e layout de faturas a associar a classifiação fiscal do
  cliente/fornecedor;
- Classificação Fiscal do Cliente/Fornecedor
  Implementação do cadastro;
  Cadastro da classifiação fiscal do cliente/fornecedor a associação dos
  Tipos faturas e layouts a serem impressoras para os documentos associados ;
- Cadastro de Cliente
  Implementação da associação da Classifiação fiscal ao cliente
 
================================================================================
CM$VER      2.14.17     23/12/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
   Correção da alteração de documentos lançados como lança e baixa no tocante a
   exclusão do lançamento no financeiro;
- Relatórios
  Alteração na contabilização dos Adiantamentos no relatório Ficha Financeira Para
  Pagamento, Aprovação de Documentos e Guia de Recebimentos
- Módulo (i)
  Inclusao da propriedade IdTipoProcRad que indentifica a existencia de um
  processo de controle de pagamentos
================================================================================
CM$VER      2.14.16     20/12/1999
--------------------------------------------------------------------------------
- Alterada a impressao do GR para aparecer os documentos de adiantamento.
- Acertado no procurar do Contas/Caixa x Tipo de Cobrança
================================================================================
CM$VER      2.14.15     10/12/1999
--------------------------------------------------------------------------------
Lançamento de Documentos
  - Inclusão do teste da data de quebra do contrato/previsão em ralação a data do
    documento lançado
Relatórios
  - Alteração no título do relatório qdo impressa uma GR
    Implementação da impressão de GR ou AP contendo apenas documentos cancelados
    Inclusão da indicação do estorno no relatório de valores pagos/recebidos
    Inclusão de grupo e totalização por número do cheque\borderô na Ap\Gr e
    totalização no final da ap
  - Valores Pagos e Recebidos
    Inclusão da descrição de documentos cancelados\estornados e não considerar o
    valor nos paramentos do dia
  - Autorização de Pagamentos\Recebimentos
    Alteração no título do relatório qdo impressa uma GR
    Implementação da impressão de GR ou AP contendo apenas documentos cancelados
  - Relatório de Controle de Valores Pagos em cima de um valor mínimo para pessoas
    físicas e pessoas jurídicas em um determinado período
Consulta de Documentos
  - Correção na descrição da situação de documentos cancelados\estornados     
================================================================================
CM$VER      2.14.14     06/12/1999
--------------------------------------------------------------------------------
- Relatório Guia de Recebimentos
  Inclusão dos documentos Inclusos como lança e baixa simultânea;
- Parcelamento de Documentos
  Correção na gravação do DebCre na tabela lanctodocum no lançamento de
  um parcelamento e na alteração do mesmo
================================================================================
CM$VER      2.14.12     12/11/1999
--------------------------------------------------------------------------------
- Lançamento de documentos
  Correção na exclusão do lançamento contábil para documentos lançados como
  integrados com a contabilidade e alterados para não integrados;
- Lançamento de Alteradores
  Correção na alteração do lançamento contabil no momento da alteração dos
  alteradores
================================================================================
CM$VER      2.14.11     05/11/1999
--------------------------------------------------------------------------------
- Baixa Automática
  Implementação da busca do número do lote de origem do envio e do portador
  forma origem do envio para a baixa 
- Gera Lote
   Correção na indicação do favorecido ao gerar o lote: O processo continua após
   a indicação do mesmo
- Pagamento Manual
  Inclusão da coluna nossonúmero no grid de baixa do contas a receber
  Inclusão do filtro por Forma de Pagamento/Tipo de Recebimento e Sistema de
  Origem do lançamento
- Ficha Financeira Para Pagamento/Recebimento
  Implementaçã do agrupamento dos items do rateio com o somatório do valor na
  consulta do rateio do paracelado;
  Inclusão do filtro por sistema de origem do lançamento;
- Estorno de Baixas
  Implementação do teste da indicação de documentos para estorno
================================================================================
CM$VER      2.14.09     29/10/1999
--------------------------------------------------------------------------------
- Ficha Financeira para recebimento
    Alterações no layout do relatório: Inclusão do código do documento como
    identificador da ficha, conta contábil de baixa, acerto do histórioco
    qdo o valor é zerado, acerto na função de cálculo do saldo do documento.
- Arquivo para esportação de baixas
    Inclusão das seguintes colunas no layout do arquivo
       CODDOCUMENTO                                   - N(10)
       NOSSONUMERO                                    - A(15)
- Lançamento de documentos 
    Correção da exclusão da planilha no momento da alteração do documento
- Baixa Manual
  Inclusão da subconta do lançamento não identificado a ser ultuilizada no momento
  da baixa qdo for regularizado um não identificado no financeiro
================================================================================
CM$VER      2.14.08     28/10/1999
--------------------------------------------------------------------------------
> Correção na contabilização do parcelado no relatório Aprovação de documentos
   Borderô para débito em conta;
> Inclusão do parâmeto para indicação da exclusão da planilha contábil no momento
   da alteração do documento 
================================================================================
CM$VER      2.14.07     26/10/1999
--------------------------------------------------------------------------------
- Importação de lançamentos
  Inclusão da coluna para indicação do centro de custo para lançamento da baixa
  Posição de 173 a 182, numérico alinhado a direita. Esta coluna é opcional
  Correção do rateio e da verificação do total do rateio na impotação
- Carta de Cobrança
   Correção no retorno da procura do documento para disponibilizar a alteração e
   exclusão
================================================================================
CM$VER      2.14.06     25/10/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Gravação do tipo de operação na contabilização do lançamento importado
- Lançamento de documento
  Correção do teste da exclusão da contabilização no momento da alteração do
  documento
================================================================================
CM$VER      2.14.05     21/10/1999
--------------------------------------------------------------------------------
-  Gera Arquivo de Transferência de baixas
     Gera arquivo contendo as baixas dos documentos de acordordo com os
     parâmetros passados: Tipo de Documento ou data da baixa.
     O arquivo mostra o rateio da baixa em função do rateio do lançamento do
     documento e possui o seguinte layout:
       IDFORCLI (Identificador do cliente/fornecedor) - N(8)
       NUMERO DO DOCUMENTO                            - N(15)
       COMPLEMENTO DO DOCUMENTO                       - A(3)
       TIPO DE DESEMBOLSO/RECEBIMENTO                 - N(15)
       ATIVIDADE/PROJETO                              - N(15)
       VALOR DO RATEIO                                - N(12,2)
       DATA DE EMISSÃO                                - N(8)
       DATA DE PAGAMENTO                              - N(8)
       DATA DE LANCAMENTO                             - N(8)
       HISTORICO DA BAIXA                             - A(60)
     Os campos numéricos são alinhados a direita com zeros a esquerda, os campos
     caracter são alinhados a direita e os campos data possum o formato DDMMYYYY
- Acertado a importacao do arquivo texto que nao estava dando erro no primeiro
  e no ultimo registro
================================================================================
CM$VER      2.14.04     19/10/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  > Pasta Alteradores
     Inclusão da opção de contabilizar ou não o lançamento do alterador independente
     da contabilização do documento;
     Ordernação do combo box do tipo do alterador
- Transferência de Classificação
  Implementação do sincronismo entre tipo de desembolso e contacontábil no momento
  da transferência, ou seja: transfere lançamentos contábeis com a conta do tipo de desembolso;
- Relatório de Ficha Financeira
  Alteração na consulta do rateio dos documentos parcelados/englobados
  Alteração na consulta da contabilização dos documentos origem de parcelas
- Alteração de Mensagens de Bloquetos
  Inclusão do filtro para tipo de documento
================================================================================
CM$VER      2.14.03     15/10/1999
--------------------------------------------------------------------------------
- Transferência de Classificação
  Inclusão da indicação da data a ser ultilizada para a seleção dos lançamentos: Data de
  vencimento ou data programada;
================================================================================
CM$VER      2.14.02     15/10/1999
--------------------------------------------------------------------------------
- Emissão de Bloquetos
  Alteração na ordenação da emissão dos bloquetos pelo número dos documentos
================================================================================
CM$VER      2.14.01     14/10/1999
--------------------------------------------------------------------------------
- Relatório Ficha Financeira Para Pagamento\Recebimento
  Correção da simulação da contabilização dos documentos agrupados/parcelados;
  Correção no rateio dos lançamentos parcelados/englobados;
- Altera Agrupa\Parcela Documento 
  Correção do erro "" is not a valid integer value no momento da alteração
  das parcelas
- Altera\Exclui Pagamento
  Implementação da não efetivação do lançamento não identificado no financeiro
  efetivado no momento da baixa no Contas a Receber
- Consulta de Fornecedores
  Alteração do texto do botão seleciona documentos 
- Consulta Documentos
  Correção da simulação da contabilização dos documentos agrupados/parcelados ;
  Inclusão de Previsões nas consultas.
- Lançamento de Alteradores
  Correção dos valores passados para a alteração do lançamento de alterador. 
- Estorno de Pagamento de um lote
  Implementação da não efetivação do lançamento não identificado no financeiro
  efetivado no momento da baixa no Contas a Receber;
- Consulta cliente\fornecedore
  Alteração do texto do botão seleciona documentos ;
- Relatório de valores pagos\recebidos
  Correção do erro 'Comando SQL não finalizado corretamente' na confirmação dos
  parâmetros;
================================================================================
CM$VER      2.14.00     14/10/1999
--------------------------------------------------------------------------------
- Pagamento Manual
  Implementação da regularização de lançamentos não identificados no financeiro
  no momento da baixa do documento no contas a receber;
  - Regulariza Lancamento no financeiro
    Implementação da tela para regularização de lançamentos não identificados no
    financeiro no momento da baixa manual de documentos no contas a receber;
- Modulo
  Impementação da propriedade ContaNaoIdentificado que inicializada pelo método
  BuscaParamCap com a conta contábil dos lançamentos não identificados definida
  no ParamFinanc;
================================================================================
CM$VER      2.13.13     08/10/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Inclusão da verificação do valor do rateio e da duplicidade do documento no
  mesmo arquivo de importação;
================================================================================
CM$VER      2.13.12     05/10/1999
--------------------------------------------------------------------------------
- Relatório de Valores Recebidos
  Inclusão da opção de exibir os valores pagos no relatório (recebimentos negativos)
- Parâmetros do Sistema
  Alteração do layout da tela;
  Inclusão do parâmetro para o controle de talão de cheques e numeração automática
  de cheques;
  Considera o FLOAT para lançamento de baixas na contabilidade: Soma a data de
  laçamento o FLOAT indicado no portadorforma;
- Documentos x Cobrança
  Inclusão do filtro por tipo de documento
- Agrupamentos\Parcelamento de documentos
  Exclusão da obrigatoriedade da indicação do portador forma;
  Gravação da forma de pagamento;
- Altera Agrupamentos\Parcelamento de documentos
  Exclusão da obrigatoriedade da indicação do portador forma;
  Gravação da forma de pagamento;
- Parâmetros deo Relatório Ficha Financeira
  Inclusão do filtro por data programada;
  Filtro por data de lançamento passou a ser opcional;
- Emissão de Bloquetos
  Inclusão do filtro por tipo de documento
- Pagamento Manual
  Inclusão da opção de considerar o float para a data do lançamento contábil de
  acordo com o parâmetro do sistema para a contabilização da baixa
- Lançamento de Documentos
  Inclusão do teste para documentos lançados com o valor '0' (zero), pedindo a
  confirmação para o lançamento do documento;
- Relatório Ficha Financeira Para Recebimento
  Alteração no desenho do relatório
- Cadastro de Cliente
  Exclusão de obrigatoriedade do tipo de cliente para empresa de previdência
- Importação de documento
  formatação do número do documento nos históricos e lançamentos da importação
================================================================================
CM$VER      2.13.11     30/09/1999
--------------------------------------------------------------------------------
- Ficha Financeira para Recebimento
  Alteração na ordenação da consulta pois gerava os rateios do mesmo documento
  em fichas diferentes
- Documentos x Cobrança
  Acerto nas mensagens gravadas referentes ao rateio do documento e alteradores
- Importação de Documentos
  Correção do Acces Violation na importação de documentos
================================================================================
CM$VER      2.13.10     24/09/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração no teste de previsões/adiantamento para regularização pois algumas
  previsões não eram exibidas;
- Pagamento automático de Documentos
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
- Baixa Eletrônica de Documentos ( Arquivo IntBanco )
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
- Pagamento Manual
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
- Documentos x Cobrança e Emissão de Boleto Bancário
  Alteração na seleção de documentos por tipo de cliente pois não considerava
  os tipos de cliente relacionados ao cliente;
================================================================================
CM$VER      2.13.09     21/09/1999
--------------------------------------------------------------------------------
- Arquivo IntBanco Real
  Formatação dos valores do rateio e alteradores na mensagem do boleto;
- Ficha Financeira Para Recebimento
  Diferenciar tipos de lançamentos: Efetivo, Previsão e Adiantamento;
  Lançamentos com status null não estavam sendo listados no relatório;
  Acerto na consulta do rateio do documento;
- Lançamento de Documentos
  Correção do Erro DataSet is Not in edit or insert mode na alteração do dodumento;
  Exclusão da subconta na alteração da contabilidade;
================================================================================
CM$VER      2.13.08     15/09/1999
--------------------------------------------------------------------------------
- Relatório de Documentos em Aberto
  Inclusão da coluna Forma de Pagamento / Tipo de cobrança 
- Documentos Lançados
  Correção na listagem de documentos parcelados, pois apereciam os documentos de
  origem;
  Correção na listagem dos documentos estornados, pois estavam somando ao valor
  lançado;
- Posição dos Saldos
  Correção do relatório pois não respeitava o filtro por cliente\fornecedor com
  relação aos saldos anteriores;
================================================================================
CM$VER      2.13.07     15/09/1999
--------------------------------------------------------------------------------
- Relatório de Documentos em aberto
  Alteração na consulta;  
- Transferência de Classificação
  Inclusão da Razão social no histórico contábil
- Ficha Financeira para para recebimento
  Alteração no modo de exibição do Banco - Agência - Conta;
  Inclusão de várias linhas para o histórico do lançamento;
  Alteração da data de emissão;
- Parâmetro do Relatório ficha financeira para recebimento
   Inclusão do filtro pela data de inclusão do documento
- Correção Automática de documentos
   correção do erro 'missing right cote' ao corrigir os documentos
================================================================================
CM$VER      2.13.06     14/09/1999
--------------------------------------------------------------------------------
- Transferência de classificação
   Alterações na largura dos combos de Tipos de Recebimento\Desembolso e Contas
   Contábeis;
- Relatório Ficha financeira para Recebimentos
  Alterações Gerais
     Listagem dos rateios, algumas vezes não eram impressos;
     Inclusão de filtro pelo usuário que preparou o documento;
     Alteração na largura de alguns campos;
     Ajustes finais na estética do documento;
================================================================================
CM$VER      2.13.05     09/09/1999
--------------------------------------------------------------------------------
- Importação de lançamentos
  Alteração do lançamento automático de impostos na importação
- Correção de Documentos
  Implementação da correção automática de documentos
================================================================================
CM$VER      2.13.04     08/09/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na seleção do centro de custo para o rateio;
- Transferência de Contas
   Indicação automática da conta a crédito associada ao tipo  de desembolso
- Estorno de Documento
   Permitir indicar o valor a ser estornado
- Taxas para correção
  Implementação da tela para indicação de percentuais de correção automática para documentos
  em atraso
- Parâmetros do Sistema
  Implementação dos parâmetros para indicação de auteradores
  para correção automática para documentos em atraso
================================================================================
CM$VER      2.13.03     03/09/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção do Access Violation ao Abrir a Tela
- Lançamento de Documentos
  Alteração da ordem de indicação do centro de custo para o rateio e seleção dos
  Centros de Custo associados a conta contábil indicada no tipo de recebimento escolhido;
- Lançamento de Juros Atuariais
  Implementação da tela de lançamento de taxa de juros para correção automática de documentos
================================================================================
CM$VER      2.13.02     01/09/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Inclusão do centro de custo na tela do rateio;
  Correção do teste de não obrigar a Atividade Projeto e Centro de Responsabilidade;
  Otimização da Alteração de Documentos;
- Relatório de Ficha Financeira para RECEBIMENTO
  Inclusão do extenso do saldo;
  Inclusão do número da ficha de compensação\conta bancária;
- Estorno de Recebimento de um Documentos
  Alteração nos histíoricos contábeis e financeiro;
- Consulta Documentos
  Inclusão do PLNPLANIL na grade de contabiliazações;
- Cadastro de Alteradores
  Correção no Teste da Obrigatoriedade do centro de Custo;
- Alteração nas consultas que envolvem endereço para compatibilização com a nova
  estrutura. As telas envolvidas foram:
   - Carta de Cobrança
   - Cadastro de Carta de Cobrança
   - Emissão de etiquetas
   - Altera dados remessa
   - Remessa eletrônica
================================================================================
CM$VER      2.13.01     31/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos, Previsão, Adiantamentos
  Correção do erro 'nome de coluna inválido' após a seleção de um fornecedor;
- Lançamento de Alteradores
  Alteração na funcionalidade do cadastro, não exibe a nova seleção de documento
  após a inclusão
- Relatório de Posição de Clientes
  Inclusão da Listagem do saldo anterior e e saldo atual com totalização dos mesmo;
  Inclusão da listagem dos Clientes que não tiveram movimento no período mas que possuem saldo;
================================================================================
CM$VER      2.13.00     27/08/1999
--------------------------------------------------------------------------------
- Cadastro de Alteradores
  Inclusão da indicação da subconta para os alteradores
- Parâmetros do Sistema
  Criação de parâmetro para indicar da obrigatoriedade da 
  Tipos de Cobrança no momento do lançamento do mesmo.
- Contas Caixas X Tipo de Cobrança
  Inclusão da indicação da subconta, atividade e projeto
- Contas Bancárias x Caixas
  Inclusão da indicação da subconta, atividade e projeto
- Alteração de Vencimento
  Alteração na mensagem de confirmação da operação
- Documentos x Cobrança
  Inclusão da opção de gravação automática de mensagens para arquivos intbanco e
  boletos bancários pré impressos baseados no rateio do documento (tipo de desembolso)
  e nos alteradores lançados para o mesmo.
  Disponibilizado na orelha de consultas a visualização da mensagem associada ao
  documento
  Otimizacao do combo box de contas caixas x tipos de desembolso  
- Importação de Lançamentos
  Alteração no sistema de origem dos lançamentos importados
- Lançamento de Documento
  Verificação da origatoriedade do cálculo do imposto para o tipo de desembolso
  associado no rateio
  Verificação da obrigatoriedade da indicação da forma de pagamento ou do
  Tipos de Cobrança de acordo com parâmetro setado na tela do sistema
- Ficha Financeira Para Recebimento
  Implementação do relatório no contas a receber
- Cadastro de Impostos Com Tabela de Retenção
  Inclusão dos campos: Percentual da Base na tabela de retenção e momento de lançamento
  do imposto;
  Inclusão dos campos valor a abater por dependente
  Alteração do default do campo Percentual da Base para 100%
- Relatório de Maiores Clientes
  Só listava o ralátório no contas a receber se o fornecedor fosse também um
  cliente
- Pagamento Manual
  Alteração na mensagem de alerta para a indicação de forma do
  contas caixas x formas de pagamento ou
  cotas caixas x tipo de cobrança
================================================================================
CM$VER      2.12.05     17/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
   Correcão Na alteração de um documento para englobado/parcelado na gravação da
   OPERACAO;
- Regularização de Adiantamentos\Previsão
   Correção do valor da PREVISÃO na tela de regularização pois estava aparecendo
   com sinal ao contrário;
- Alteração de Agrupa\Parcela
  Correção Na gravação da operação para parcela de PREVISÃO
  Correção na gravação da data de vencimento, data programada e de lançamento;
- Lançamento de Agrupa\Parcela
  Correção Na gravação da operação para parcela de PREVISÃO
  Correção na gravação da data de vencimento, data programada e de lançamento;
================================================================================
CM$VER      2.12.04     11/08/1999
--------------------------------------------------------------------------------
- Relatório de Documentos Por Data Programamada (i)
  Alteração na consulta pois exibia documentos com saldo zero;
- Lançamento de documentos (i)
  Exclusão do rateio administrativo;
- Consulta de Documentos
  Inclusão do Nº da Planilha na Grade de Contabilizações;
  Alteração na consulta de contabilizações pois não exibia a contabilização dos
  Documentos a parcelar;
  Alteração no seleciona documentos pois trazia documentos duplicados;
- Lançamentos de Alteradores
  Correção na exclusão de alteradores lançados com opção de não contabilizar;
================================================================================
CM$VER      2.12.03     10/08/1999
--------------------------------------------------------------------------------
- Parâmetros da emissão da Carta de Cobrança
  Inclusão da seleção por Modelo da Carta de Cobrança para documentos não emitidos
- Alterações na função de contabilização (i)
================================================================================
CM$VER      2.12.02     06/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na gravação dos dados contábeis para a baixa de documentos qdo os mesmo
  for alterado
-  Implementação da pesquisa do documento a ser baixado, possibilitando a seleção
    por Nosso Número, Número do Documento, Complemento, Data Programada, Datavencimento, Valor e Razao Social
================================================================================
CM$VER      2.12.01     05/08/1999
--------------------------------------------------------------------------------
- Regularização de Adiantamento \ Previsão
  Alteração no cálculo do saldo do documento para previsões e adiantamentos;
- Consulta Documento
  > Não exibir previsões para consulta;
  > Alteração na descrição da Situação dos Documentos Consultados
- Consulta Cliente
  Alteração na descrição da Situação dos Documentos Consultados
- Lançamento de Adiantamentos 
  Não calcular impostos retidos para adiantamentos
================================================================================
CM$VER      2.12.00     04/08/1999
--------------------------------------------------------------------------------
- Tipo de Cliente x Tipo de Recebimento
  Inclusão do cadastro de relacionamento entre Tipo de Cliente x Tipo de Recebimento
- Lançamento de Documentos
  Alterações para seleção dos tipos de recebimentos associados ao tipo de cliente feita no cadastro
  de Tipo de Cliente x Tipo de Recebimento;
- Contas Caixas x Formas de Pagamento
  Inclusão de campo para indicação da descrição do lançamento no financeiro;
================================================================================
CM$VER      2.11.04     04/08/1999
--------------------------------------------------------------------------------
- Contas Caixas x Tipo de Desembolso
  Inclusão de campo para indicação da descrição do lançamento no financeiro;
- Consulta de Documentos
  Alteração na seleção de documentos separando documentos a pagar a a receber;
  Alteração na contabilização da baixa e dos documentos parcelados;
- Lançamento de Alteradores
  Correção na Exclusão de alterador lançados junto com documentos com a opção de
  não integrar com a contabilidade
- Lançamento de Documentos
  Inclusão da data do vencimento no histórico do lançamento contábil;
  Teste do relacionamento do Centro de Custo com a Conta Contábil para os lançamentos
  contábeis;
- Emissão de Cobrança
  Inclusão de seleção por tipo de cliente;
  Correção na reeimpressão\reemissão de Cobrança.   
================================================================================
CM$VER      2.11.03     02/08/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Correção na contabilização do débito pois sempre pegava a conta do cliente caso
  a conta contábil do tipo de recebimento estivesse vazia;
================================================================================
CM$VER      2.11.02     02/08/1999
--------------------------------------------------------------------------------
- Lançamento de Alteradores
  Alteração na alteração e exclusão de alteradores para efetuar alteração e exclusão
  nos impostos retidos
- Lançamento de Documentos
  * Alteração na inclusão, alteração e exclusão de documentos para efetuar inclusão,
     alteração e exclusão de impostos retidos associados ao fornecedor\cliente
  * Controle da opção de estorno somente qdo há documentos selecionados
  * Alteração no conferência do Dv da linha digitável do nº da ficha de compensação
  * Repetição da data programada na data do vencimento qdo a anterior for alterada
- Pagamento Manual
  Alteração na ordenação do combo tipos de desembolso
================================================================================
CM$VER      2.11.01     27/07/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção na seleção da conta contábil para a baixa do documento pois
  sempre buscava a conta do fornecedor/cliente, qdo deveria dar prioridade
  a conta do Tipo de Desembolso/recebimento
================================================================================
CM$VER      2.11.00     22/07/1999
--------------------------------------------------------------------------------
- Guia de Recebimentos
  Implementação do estorno de documentos para listagem dos doc's cancelados
  em uma ap emitida.
  A opção de estorno foi liberado no lançamento de documentos e na Exclusão da Baixa
================================================================================
CM$VER      2.10.16     21/07/1999
--------------------------------------------------------------------------------
- Emissão - Remessa Eletrônica
  Correção e Otimização no envio de documentos lançados como 
  Agrupados para Remessa;
================================================================================
CM$VER      2.10.15     20/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração no teste de Obrigatoriedade da Subconta pois exibia mesnagem mesmo
  se a conta não obrigrasse.
================================================================================
CM$VER      2.10.14     16/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Indicação da subconta na orelha 'Geral' em Subconta do Fornecedor caso o Fornecedor
  tenha subconta cadastrada;
- Seleciona Retorno - Baixa Eletrônica
  Correção do 'Acces Violation' ao selecionar arquivo de retorno;
  Coorreção no cálculo das despesas bancárias para baixa do documento;
 
================================================================================
CM$VER      2.10.13     14/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos\Alteradores
  A contabilização dos lançamentos da alteração de documentos\alteradores 
  passaram a constar na  mesma planilha gerada na inclusão dos documentos\alteradores
- Parâmetros do Sistema
  Alteração na visualização do modelo de impressora selecionada: Passou a exibir o
  Nome da Impressora + O Nº de colunas;
- Lançamento de documentos
  > Bloqueio do lançamento em Atividade\Projeto e Centro de Responsabilidade Sintéticos;
  > Teste de indicação na orelha 'Geral' da subconta para para o lançamento caso a conta do
     Fornecedor obrigue a mesma;
- Lançamento de Alteradores
  > Bloqueio do lançamento em Atividade\Projeto e Centro de Responsabilidade Sintéticos;
  > Teste de indicação na orelha 'Geral' da subconta para para o lançamento caso a conta do
     Fornecedor obrigue a mesma;
================================================================================
CM$VER      2.10.11     13/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração no arredondamento do cálculo do rateio administrativo
================================================================================
CM$VER      2.10.10     13/07/1999
--------------------------------------------------------------------------------
- Contabilização de Baixas
  Correção na montagem do histórico da Baixa pois não estava montando o número
  do lote de recebimento no lançamento contábil;
================================================================================
CM$VER      2.10.09     12/07/1999
--------------------------------------------------------------------------------
- Importação de lançamentos
  Alteração no histórico do lançamento contábil que passou a incluir, além do nº do
  documento e do nome do fornecedore o histórico complementar;
================================================================================
CM$VER      2.10.08     09/07/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  > Implementação de Rateio Automático por atividade\projeto.
     Este rateio é cadastrado na contabilidade e para ser ultilizado deve estar amarrado
     a uma conta contábil.
  > Proibido o lançamento em atividade\projeto e centro de responsabilidade sintético. 
================================================================================
CM$VER      2.10.07     08/07/1999
--------------------------------------------------------------------------------
- Carta de Cobrança: Configuração e Impressão
   Alterada a opção de cadastro de cartas de cobrança, passando a ser 'desenhada'como no gerador de relatórios. 
- Etiquetas: Configuração e Impressão
   Implementação da opção Relatórios\Etiquetas\Configuração e  Relatórios\Etiquetas\Impressão onde é
   possível configurar qualquer modelo de etiqueta tanto para impressão matricial qdo para impressão
   com Jato de Tinta e Lazer, além de possibilitar a impressão de etiquetas para qualquer tipo de Pessoa.
================================================================================
CM$VER      2.10.06     05/07/1999
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção no Rateio Contábil do Débito no lançamento dos documentos da importação;
  Criação de campo para definição de histórico para o lançamento contábil.
================================================================================
CM$VER      2.10.05     05/07/1999
--------------------------------------------------------------------------------
- Implementação da importação de lançamentos no contas a receber.
================================================================================
CM$VER      2.10.04     02/07/1999
--------------------------------------------------------------------------------
- Configuração da Carta de Cobrança
  Alterações Gerais na configuração da carta de cobrança;
- Alteração na exclusão dos recebimentos pois não desvinculava o documento da Guia de Recebimento;
================================================================================
CM$VER      2.10.03     01/07/1999
--------------------------------------------------------------------------------
- Relatório Guia de Recebimentos
  Correção na impressão da contabilização do baixa dos documentos  
  Correção na impressão da contabilização do lançamento dos documentos impressos
  pois só imprimia a contabilizaçào do lançamento de documentos parcelados;
- Cadastro de Clientes
  Implementação da integração com o Front-Office via cadastro de clientes, passando
  a inserir, alterar e excluir automaticamente clientes no front-office.
================================================================================
CM$VER      2.10.02     01/07/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema de Contas a  Receber
  Inclusão de Parâmetro para indicação da Marca e do Modelo da Impressora
  ultilizada para Bloquetos;
- Lançamento de Documentos
  Alteração na Largura do Combo Box Contas Caixas X Formas de Pagamento;
- Correção na paginação e configuração da Impressão de Bloquetos
================================================================================
CM$VER      2.10.01     25/06/1999
--------------------------------------------------------------------------------
- Pendência #1364
  Permitir no parcelamento de documentos a alteração manual das datas e só recalcular quando solicitado;
- Pendência #1365
   Informar a data da baixa do documento na consulta de documentos;
- Pendência #1367
  Correção dos relatórios que exibem valores recebidos, pois uma lançamento de documento com a 
  Opção lança e baixa não era exibido corretamente;
- Parâmetros do Sistema
   Inclusão de Parâmetro para indicação do Número de Dias Para Vencimento de Documento, 
  usado para autorizar a data de Vencimento dos documentos lançados;
- Lançamento de Documento
  > Correção da alteração do rateio pois indicava um valor que não correspondia ao valor
     exibo na Grade qdo solicitado para alteração.
  > Alterações na validação da Dotação Orçamentária associada ao rateio do documento;
  > Posicionamento do Cursor no Campo para indicação do fornecedore no momento da Inserção.
  > Ordenação do combo box PORTADORFORMA;
  > Não permitir inclusão de documentos com número 0;
  > Correção da inclusão de registro em branco na Grade do Rateio.
- Relatórios
  > Conta Corrente de ClienteFornecedor: Não exibia corretamente os valores de Débito e Crédito referentes
   a um lançamento do tipo 'lança e Baixa simultânea'
- Agrupamento de Documetos
  Caso seja alterada a data de vencimento, a data programada passa a receber o mesmo valor;
- Relatórios de Autorização de Recebimento
  Inclusão do campo "Data para Recebimento" 
================================================================================
CM$VER      2.10.00     21/06/1999
--------------------------------------------------------------------------------
- Regularição de Adiantamentos
  Permitir Regularizar Valores Maiores que o saldo do documento, caracterizando uma Devolução
- Baixa Manual
  Implementação da Sugestão automática do nº do cheque bordero/Loterecebimento
- Relatório de Aprovação de Documentos
  Alteração na tela de parâmetros, implemtando reimpressão das Gr's Já emitidas podendo
  ser procuradas por Data de Recebimento, Nº da Gr, Nº do Lote de Recebimento, Nº do Documento 
  Contido na Gr.
================================================================================
CM$VER      2.09.04     16/06/1999
--------------------------------------------------------------------------------
- Lançamento de Documentos
  Alteração na Contabilização de Alteradores Para Documentos Lançados com  a opção de não contabilizar;
================================================================================
CM$VER      2.09.03     15/06/1999
--------------------------------------------------------------------------------
- Correção no Alterar do Lançamento de Documentos Pois não Habilitava o Combo Box de
  Tipo de Desembolso\Recebimento
- Alteração na Gravação das Assinaturas dos Relatórios na Tela de Parâmetros do Sistema.
================================================================================
CM$VER      2.09.02     15/06/1999
--------------------------------------------------------------------------------
- Alterações Diversas na Rotina de Importação de Lançamentos
================================================================================
CM$VER      2.09.01     14/06/1999
--------------------------------------------------------------------------------
- Pendência 1338 - Alterações no Relatório Guia de Recebimento:
  Correção na Contabilização do Parcelado
================================================================================
CM$VER      2.09.00     10/06/1999
--------------------------------------------------------------------------------
- Alteração na Tela de Parâmetros Do Contas a Pagar e Receber 
- Implementação da Configuração de Assinaturas e Vistos de Relatórios no Contas a Pagar e Receber;
- Implementação de Assinaturas\Vistos Para os Seguintes Relatórios 
  > Guia de Recebimento
- Correção do Parcelamento De Documentos após o lançamento do Mesmo, 
  pois não achava o Fornecedor Indicado no Documento
- Pendência 1338 - Alterações no Relatório Guia de Recebimento:
  Inclusão da Agência Bancária e Nº da Conta Corrente de Crédito;
  Lista Apenas Documentos Baixados;
  Personalização de Assinaturas;
================================================================================
CM$VER      2.08.16     10/06/1999
--------------------------------------------------------------------------------
- Correção do erro 'Invalid Field Name' no Lançamento de Documentos
================================================================================
CM$VER      2.08.15     09/06/1999
--------------------------------------------------------------------------------
- Pendência Nº 1348
  Criado opção na Altorização para impedir o lançamento de documentos com a data de
  lançamento igual a data progranada;
- Pendência Nº 1350
  Inclusão da Consulta  de Clientes, permitindo visualizar
      * Documentos Recebidos No Período;
      * Documentos em Atraso;
      * Documentos a Vencer;
      * Volume de Negócios;
- Pendência Nº 146
   Permitir filtar carta de cobrança por número de parcelar em atraso: 
   Esta opção já estava disponível, só que no formato de dias de atraso;
================================================================================
CM$VER      2.08.14     08/06/1999
--------------------------------------------------------------------------------
- Correção do 'Acces Violation' ao entrar pela segunda vez no Lançamento de Documentos;
- Correção do Posicionamento do Cursor ao entrar pela segunda vez na Inclusão do Lançamento de Documentos;
- Correção do erro de 'Constraint' ao Confirmar a Inclusão do Cliente;
================================================================================
CM$VER      2.08.12     04/06/1999
--------------------------------------------------------------------------------
- Implementação da Impressão de Cheque usando máquina de cheque Chronos ACC 300 e ACC 100
- Lançamento de Documentos Alteração no Sistema de Origem pois não limpava o último exibido
- Cadastro de Fornecedores Na Caixa de Edição do Nome do Banco pois não limpava o último exibido
- Alterção nos Indicadores das contas do cadastro de tipo de desembolso
================================================================================
CM$VER      2.08.11     02/06/1999
--------------------------------------------------------------------------------
* Cadastro de Contas Caixas X Tipos de Desembolso\Recebimento
  Correção da mensagems '' Is Not a valid Integer Value;
*  Criação de coluna no Layout do Arquivo de Importação de Lançamentos na posição 164 
    onde é indicado a será  feito ou não o lançamento na contabilidade.
* Otimização das Telas com a alteração na Procura de Cliente\Fornecedor
   Agrupa Documento;
   Altera Agrupa Documento;
   Parâmetros do Relatório Posição Por Fornecedores/Clientes;
   Parâmetros do Relatório Valores Pagos/Recebidos;
   Parâmetros do Relatório Alteradores Lançados;
   Parâmetros do Relatório Lançamento de Documentos;
   Parâmetros do Relatório Carta de Cobrança;
   Parâmetros do Relatório Emissão de Etiquetas;
   Parâmetros do Relatório Conta Corrente de Fornecedore/Cliente;
   Parâmetros do Relatório Lançamento de Adiantamentos;
   Recebimento Manual;
   Consulta de Fornecedores;
   Documentos X Cobrança;
   Lançamento de Documentos;
================================================================================
CM$VER      2.08.10     01/06/1999
--------------------------------------------------------------------------------
* Lançamento de Documentos\Registra
  > Correção do erro de constraint ao lançar o documento como agrupa parcela;
  > Correção da alteração de documento pois não permitia realizar a operação qdo o documento possuía outros lançamentos;
* Cadastro de Contas Caixas X Tipos de Desembolso\Recebimento
  > Não atualizava os indicadores de Analítico\Sintético ao movimentar pela árvore do cadastro.
================================================================================
CM$VER      2.08.08     28/05/1999
--------------------------------------------------------------------------------
* Correção na exclusão dos Documentos \ Alteradores pois não excluía corretamente da
   contabilidade, só estornava
* Verificação da existencia de lançamentos para validar e alteração ou exclusão
================================================================================
CM$VER      2.08.07     28/05/1999
--------------------------------------------------------------------------------
* Alteração do Comprimento da Descrição no cadastro de contas caixas x tipos de desembolso\recebimento
* Correção da Alteração de Saldo Na Baixa Manual;
* Correção do Lançamento de Alteradores pois não cancelava a transação aberta;
* Correção do Relatório Posição Por Fornecedores pois duplicava o último registro na última folha;
* Correção do Valor Da Orelha da Contabilização no lançamento de Documentos Pois trazia o valor do lançamento anterior;
* Correção na Comparação do Saldo Do Documento Com o valor da regularização do Adiantamento\Previsão
================================================================================
CM$VER      2.08.06     25/05/1999
--------------------------------------------------------------------------------
* Cadastro de Agência
   > Correção do Procurar, mensagem: 'Nome de Colunaz Inválido';
   > Correção da Mensagem Cannot Focus a Disable or Invisible Window ao confirmar a operação.
* Cadastro de Contas
   >Implementação da Validação do Número da Conta Corrente para os bancos
    Real;
    Brasil;
    Banespa;
    Bradesco;
    Meridional;
    Caixa Econômica;
    Itaú;
    Bamerindus;
    Unibanco;
* Cadastro de Cliente
  >Estava obrigando o cadastro das contas contábeis de adiantamento e Débito; 
* Correção do Erro Ao Excluir Tipo de Desembolso\Recebimento:  'Can not perform this operation on a closed dataset';
* Lançamento de Documentos: Correção da Contabilização Do Lança e Baixa
================================================================================
CM$VER      2.08.05     19/05/1999
--------------------------------------------------------------------------------
* Cadastro de Tipo de Desembolso\Recebimento
   Alteração dos Captions e Mensagens das Contas Contábeis.
* Portador Forma
   Estava testando indevidamento o número da empresa no banco para o contas a pagar 
* Cadastro de Cliente\Fornecedor
  A Orelha Geral Não estava sendo habilitada para inclusões contínuas;
  O Tipo de Cliente estava exibindo o nome;
* Cadastro de Contas
  Correção do falta expressão no retorno da consulta
* Relatório Posição Por Clientes\Fornecedore
  Não estavam sendo impressos o Número/Complemento do Documento no relatório
* Carta de Cobrança
  Acerto da Duplicidade dos registros da carta de cobrança para os Clientes que
  possuem mais de um endereço
* Ãcerto Na Alteração do Lançamento quando trocava de parcelado para não parcelado e
  vice-versa
* Acerto da Contabilização da Baixa;
================================================================================
CM$VER      2.08.04     17/05/1999
--------------------------------------------------------------------------------
* Pendência 1123
   Foi alterada a contabilização dos lançamentos e baixas no contas a pagar, passando a ser
   efetuado o rateio contábil pela unidade de custeio, ou seja, em função do rateio do documento.
   Foram alteradas as seguintes telas:
   > Recebimento Manual;
   > Lançamento de Documento;
   > Baixa Eletrônica;
   > Altera Saldo em Baixa Manual;
   > Lançamento de Alteradores;
   > Agrupa Documento;
   > Agrupa Parcela Documento;
* Foram Otimizadas todas as Telas que usam o plano de contas. A arvore com o plano de contas
   foi substituída por um controle que possibilita pesquisa por diversos campos das contas contábeis
   além de digitação direta da conta.
   Foram Alteradas as Seguintes telas:
   > Cadastro de Contas;
   > Cadastro de Alteradores;
   > Cadastro de Tipo de Desembolso;
   > Cadastro de Contas Caixas X Formas de Pagamento;
   > Cadastro de Clientes;
   > Lançamento de Documentos;
* Pendência 890 
  Documentos X Mensagens para remessa eletronica - Erros de Português
* Pendência 870
  Incluir no combo do tipo de desembolso/recebimento a descrição do tipo sintético também. Sugestão 43 da marquise. 
* Pendência 1131
  Fazer com que nos combos referentes a atividade/projeto, centro de responsabilidade, tipo de desembolso e tipo de recebimento apareçam as descrições em ordem alfabéticas, porém, mostrando após as analíticas, todas as sintéticas correspondentes.
* Pendência 1215
   Ao lançar um doc, marcando p/ parcelar, quando consultamos o relat. de docs lançados o sistema mostra o doc e suas parcelas, totalizando errado.
* Cadastro Conta Bancária / Caixa, ao Procurar, mensagem: "Falta Expressão".
* Dentro de Utilitários, as opções: Simulação de cálculos, Cálculo de variação monetária e Exclusão de Movimentos não funcionam... Favor desabilitá-las.
* Alterações Gerais no Cadastro de Carta de Cobrança
================================================================================
CM$VER      2.08.03     07/05/1999
--------------------------------------------------------------------------------
* Alterações Gerais na Telas de Regularização de Adiantamento para copatibilizar com o DB2;
* Alterações Gerais na Tela de Documentos X Cobrança para copatibilizar com o DB2;
* Disponibilização de Consulta a Documentos Associados e não Emitidos na Tela de Documentos X Cobrança;
================================================================================
CM$VER      2.08.02     05/05/1999
--------------------------------------------------------------------------------
* Implementação da Impressão para teste da Configuração do Bloquete
* Alterações Gerais em todas as Telas do Menu Cadastro e Lançamentos para copatibilizar com o DB2.
================================================================================
CM$VER      2.08.01     03/05/1999
--------------------------------------------------------------------------------
* Otimização da Tela Contas Caixas X Tipos de Desembolso
* Alteração da Tela de Configuração de Bloqueto
* Correção no Procurar e Otimização da Tela de Cadastro de Contas Caixas
================================================================================
CM$VER      2.08.00     30/04/1999
--------------------------------------------------------------------------------
* Alterações no Banco de Dados nas tabelas de controle dos Arquivos de Integração Bancária
* Correção do 'Can not focus a disable or invisible window' no Cadstro de Clientes;
* Preenchimento das Tabelas com Modelos de Arquivos Int. Banco Disponíveis Para o Sistema e
   Dos Códigos de Retorno dos Respectivos Modelos.
* Correção de Campos para Integração Com a Contabilidade
* Alteração na tela de Pagamento manual pois não permitia colocar o número do cheque\borderô
* Correção na alteração do Documento em Lançamento de Documento\Alteradores\Previsões pois mudava
  a operação do lançamemto do documento
================================================================================
CM$VER      2.07.04     29/04/1999
--------------------------------------------------------------------------------
* Lançamento de Documentos, Previsão e Adiantamentos;
   - Alterção na Seleção de Centro de Custro, passando exibir somente os centros de custo da empresa logada.
   - Correção do 'Acces Violation' na Alteração do Lançamento
* Cadastro de Mensagens Para Remessa Eletrônica
   - Alteração no Layout da Tela separando qdo a mensagem é Inclusa/Alterada para um Grupo de envio ou
     para um documento específico.
   - Alteração na procura pois exibia registros duplicados.
================================================================================
CM$VER      2.07.03     22/04/1999
--------------------------------------------------------------------------------
Exclui Pagamentos \ Recebimentos
Alteração na seleção dos documentos pagos para filtrar pela data do
pagamento/recebimento, antes filtrava pela data do lancamento do documento.
Tela de Documentos X Cobrança
Trazer as datas de emissão e data programada em branco ultilizadas no filtro em Branco;
Lançamento de Documentos
Alteração no procurar  pois se um documento era estornado ele exibia dois registros  iguais: um do lançamento e outro do estorno.
Reltório de Posição Por Clientes
Permitir a ordenação do relatório por
       RAZÃO SOCIAL + DATAPROGRAMADA' ou
       RAZÃO SOCIAL + NÚMERO DO DOCUMENTO + COMPLEMENTO;
Emissão de Bloquetos - Não estava exibindo os arquivos enviados para possibilitar a 
nova remessa.
================================================================================
CM$VER      2.07.02     12/04/1999
--------------------------------------------------------------------------------
Exclusão de Pagamentos
 Alteração na seleção dos documentos pagos para filtrar pela data do pagamento/recebimento,
 antes filtrava pela data do lancamento do documento.
Lançamento de Documentos
   Alteração no procurar  pois se um documento era estornado ele exibia dois registros
   iguais: um do lançamento e outro do estorno.
Baixa Automática de Títulos
 Correção na no lançamento do Financeiro na Baixa dos Título para lançar sempre
 como entrada no contas a receber e saída no contas a pagar;
Lançamento de Alteradores, Correção de Saldo
  Verificação automática e baixa caso o documento tenha o saldo zerado com o lançamento de um alterador.
 Remessa CNAB Bradesco
 Inclusão do campo código da empresa no banco para remssa de cnab.
 Corresponde ao código fornecido pelo banco para identificar a empresa.
Regulariza Adiantamentos
  Não estava permitindo Alterar o Valor a regularizar, não podendo fazer a regularização para mais de uma nota.
================================================================================
CM$VER      2.07.01     06/04/1999
--------------------------------------------------------------------------------
Agrupa Parcela e Altera Agrupa Parcela:
           As parcelas estavão sendo lançadas com a contabilização errada, contabilizando o
           debito/credito na conta de Despesa/Receita, passando a contabilizar na conta do Fornecedor/Cliente
Lançamento de Documentos:
           Alteração na comparação das datas de vencimento,emissão,Programada e Lançamento pois comparava Data/Hora,
           e as vezes a comparação era falsa
Relatório de Documentos por data programada:
          Inclusão dos adiantamentos no relatório.
          Alteração no nome do fornecedor - Passou a exibir a razão social.
Relatório de Lançamento de documentos:
          Correção na coluna de alteradores com relação ao cálculo do valor do alterador
          verificando se é um acréscimo ou decréscimo no valor do documento.
Relatório de Valores Pagos\Recebidos:
          Inclusão dos adiantamentos no relatório.
Regularização de Adiantamentos
          Implementação de Tela para Regularização de Adiantamentos fora do lançamento do 
          Documento. Ultilizada principalmente para regularizar adiantamentos vindo de outros 
          sistermas. Opção Cobrança\Regularização de Adiantamentos
================================================================================
CM$VER      2.07.00     30/03/1999
--------------------------------------------------------------------------------
LANCAMENTO DE DOCUMENTO\ ADIANTAMENTO\ PREVISÃO
  Otimização das consultas do Lançamento de Documento
LANCAMENTO DE ADIANTAMENTO
  Possibilitar lança e baixa simultânea para adianamentos
REGULARIZAÇÃO DE ADIANTAMENTO PREVISAO
  Reagularização de adiantamentos/previsão formatar a apresentação do valor,
  impedir inclusão no grid e possibilitar a marcação do documento com duplo click;
CADASTRO DE CLIENTE\FORNECEDOR
    Verificação da obrigatoriedade e inclusão da SubConta para a conta contábil
    do Cliente\Fornecedor
LANÇAMENTO DE DOCUMENTOS
    Gravação da Subconta, caso exista para a conta contábil do cliente,
    no Lançamento\Alteração do Documento
================================================================================
CM$VER      2.06.02     23/03/1999
--------------------------------------------------------------------------------
BAIXA AUTOMÁTICA DE TITULOS VIA CNAB - COBRANÇA ELETRÔNICA
   Alterações Diversas: Seleção dos Títulos, Lançamento do Alterador,
    ontabilização, mudança no layout do arquivo de log mostrando a descrição da
    ocorrência e separando os documentos, etc...
CADASTRO DE CÓDIGOS BANCÁRIOS PARA COBRANÇA
   Correção do ERRO NA ATUALIZAÇÃO DE DADOS para a alteração e exclusão;
   Alteração dos nomes das colunas na Tabela da Tela;
CONSULTA FORNECEDORES
   Implementação da Tela de Consulta a Fornecedores listando:
   Documentos em atraso, Documentos a Vencer, Gráfico de Lançamentos X
   Pagamentos, Lançamentos ou Pagamentos nos últimos 12 meses, Total de
   Lançamentos e Pagamentos no período.
================================================================================
CM$VER      2.06.01     23/03/1999
--------------------------------------------------------------------------------
RELATÓRIOS
    Implementação dos relatórios Aprovação de Documentos, Guia de Recebimentos;
LANÇAMENTO DE DOCUMENTOS
    Desabilitar e limpar o Nº do Cheque Borderô ao desmarcar a opção de Lança e
    Baixa simultânea;
    Possibilidade de parcelar o documento após a inclusão do mesmo;
================================================================================
CM$VER      2.06.00     18/03/1999
--------------------------------------------------------------------------------
ALTERAÇÃO DE REMESSA CONTAS A RECEBER
 Implementação de Alteração para todos os códigos de ocorrência da Cobrança Itau
PAGAMENTO MANUAL
 Alteração do arredondamento do total dos documentos pagos;
 Limpar o total dos documentos pagos ao fim da operação;
================================================================================
CM$VER      2.05.10     16/03/1999
--------------------------------------------------------------------------------
RELATÓRIO MAIORES FORNECEDORES\CLIENTES
 Implementação da Tela permitindo filtrar por data de lançamento do documento e
 qtde de fornecedores para análise
RELATÓRIO POSIÇÃO POR TIPO DE CLIENTE
 Não estava limpando o tipo de cliente após a impressão de um relatório filtrado
 pelo mesmo.
================================================================================
CM$VER      2.05.09     15/03/1999
--------------------------------------------------------------------------------
CRIA AGRUPA\PARCELA
 Alteração da Consulta dos Números dos Documentos Pois Duplicava os Documentos
 Parcelados e não realizava as alterações nos dados dos documentos, só das
 parcelas, pasando a Gravar Automaticamente os dados pendentes antes de
 recalcular;
 Melhoria da performance da tela;
ALTERA AGRUPA\PARCELA
  Alteração da Consulta dos Números dos Documentos Pois Duplicava os Documentos
  Parcelados e não realizava as alterações nos dados dos documentos, só das
  parcelas,pasando a Gravar Automaticamente os dados pendentes antes de
  recalcular;
  Melhoria da performance da tela;
  Caso o parcela venha de um Contrato/Previsão não estava disponibilizando para
  alteração, foi alterada a operação do documento de origem;
ALTERA VENCIMENTO
 Limpar a tela após a confirmação da operação e Mostrar mensgens de erro e
 finalização.
LANÇAMENTO DE ALTERADORES
 Esta lançando os Alteradores de acordo com o tipo do primeiro alterador
 selecionado:
 Se era a Débito Lançava todos a débito, se era a crédito, lançava todos a
 crédito;
 Estabelecimento da ordem de tabulação dos campos na tela;
 Exclusão de Documentos já parcelados/englobados da inclusão de alteradores;
LANÇAMENTO DE DOCUMENTO
   Correção do Layout da 'Orelha' alteradores;
   Gravação da alteração do engloba parcela e não permitir alteração caso o
   mesmo já tendo sido parcelado;
================================================================================
CM$VER      2.05.08     12/03/1999
--------------------------------------------------------------------------------
Relatórios Posição Por ClienteS
      Criação de Coluna para exibir valor de Juros;
Altera Dados Remessa
      Implementação da tela
Cadastro de Mensagens Cnab
      Possibilitar Cadastrar Mensagens para todos os Documentos a serem enviados
      associado a uma forma de cobrança;
Documentos X Cobrança
      Inclusão do Filtro pela Empresa Própria Na consulta do Documento
      ( Pendente e Selecionado )
Lanc Alteradores
         Não permitir Lançar alterdores para documentos já pagos.
Exclusão de Pagamentos
         Exibir Razão Social ao Invés de Fornecedor/Cliente no título da coluna
         na tabela
Param CapCar
         Exibir o Histórico padrão para o lançamento no financeiro mesmo no
         contas a receber;
Portador Forma
         Exibir na Tabela o Modelo de Cheque/Bloqueto ou o Modelo de Remessa
         eletrônica do registro.
================================================================================
CM$ALT}
























































































































































































































































































































































































































