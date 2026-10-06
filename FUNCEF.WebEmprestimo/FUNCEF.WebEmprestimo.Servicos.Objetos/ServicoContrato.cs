#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// Criação de fucionalidade para importar modelos de contratos de empréstimo.
///
#endregion
#region SIG 90605
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 10/10/2019
///
/// Descrição da Alteração:
/// Busca de prestação com FGQC
///
#endregion
#region SIG 21529.52136
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 16/12/2019
///
/// Descrição da Alteração:
/// Relatorio Renegociação
///
#endregion
#region SIG 21529
///
/// Autor:
/// Thayane Rabonato/Darivaldo Alencar
///
/// Data da Alteração:
/// 12/09/2017
///
/// Descrição da Alteração:
/// Criação da opção de renegociação de dívidas de emprestimo
///
#endregion
#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do método consultarAssinaturas e consultarContratos
///
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion
#region SOL 251082 / PPM 724410
/// Autor:
/// William Moreira da Silva
///
/// Data da Atualização:
/// 25/03/2015
///
/// Descrição da Alteração:
/// Alteração para o conector realizar concessões passando o numero do contrato
/// e um metodo para gerar o numero do contrato
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.ServiceModel;//William Moreira da Silva - SOL 207977
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.WCF;
using FUNCEF.Planus.Componentes.ServicoWeb;
using FUNCEF.Planus.WebEmprestimo.Negocio;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using System.Collections;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;

namespace FUNCEF.Planus.WebEmprestimo.Servicos.Objetos
{
    /// <summary>
    /// Serviço de manutenção de estado do sistema.
    /// </summary>
    [ExceptionShielding("Politica Sistema")]
    [ServiceBehavior(MaxItemsInObjectGraph = 2147483646)]//William Moreira da Silva - SOL 207977
    [InspecaoRequisicao()]
    public class ServicoContrato : ServicoBase, IServicoContrato
    {
        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - início
        public void EncerrarBloqueioConcessao(int IdPessoa, DateTime DataQuitacao)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.EncerrarBloqueioConcessao(IdPessoa, DataQuitacao);
        }
        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - fim

        //William Moreira da Silva - SOL 246823 - Envio
        public List<PlanoPrevidenciario> obterPlanosPrevidenciarios()
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.obterPlanosPrevidenciarios();
        }

        public List<Patrocinadora> obterPatrocinadoras()
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.obterPatrocinadoras();
        }

        /// <summary>
        /// Obtem as informações do envio que esta pendente
        /// </summary>
        /// <returns>Informações do envio pendente</returns>
        public ObjetoEnvio obterInfosEnvioProcessando()
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.obterInfosEnvioProcessando();
        }

        public void incluirInformacoesEnvioETL(ObjetoEnvio envio)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.incluirInformacoesEnvioETL(envio);
        }
        //William Moreira da Silva - SOL 246823 - Envio

        //William Moreira da Silva - SOL 251082
        /// <summary>
        /// Obtem o novo numero de contrato
        /// </summary>
        /// <returns>Retorna o novo numero de contrato</returns>
        public long obterNumeroContrato()
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.obterNumeroContrato();
        }

        /// <summary>
        /// Verifica se o numero de contrato já existe
        /// </summary>
        /// <param name="numeroContrato">Número do contrato que esta sendo contratado</param>
        /// <returns>Retorna verdadeiro se já existir </returns>
        public bool verificanumeroContrato(long numeroContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.verificanumeroContrato(numeroContrato);
        }
        //William Moreira da Silva - SOL 251082

        /// <summary>
        /// Consulta contratos ativos.
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> consultarAtivos(Contrato contrato, ref ParametrosConsulta parametros)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarAtivos(contrato, ref parametros);
        }

        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public double obterPrestacaoAtual(long numeroContrato)//William Moreira da Silva SOL 144458
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterPrestacaoAtual(numeroContrato);
        }//William Moreira da Silva SOL 144458
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public double obterPrestacaoAtualComFGQC(long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterPrestacaoAtualComFGQC(numeroContrato);
        }//SIG90605

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultarContrato(long numero)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultar(numero, false);
        }

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultarContaCorrente(long numero)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarContaCorrente(numero);
        }

        /// <summary>
        /// Calcula data limite considerando feriados.
        /// </summary>
        /// <param name="dataCalculo">Data base para cálculo</param>
        public DateTime calcularDataLimite(DateTime dataCalculo)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.calcularDataLimite(dataCalculo);
        }

        public DateTime calcularDataLimiteDebito(DateTime dataCalculo)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.calcularDataLimiteDebito(dataCalculo);
        }

        /// <summary>
        /// Consulta os beneficiários do contrato.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Beneficiario"/> com o(s) beneficiário(s) encontrado(s).</returns>
        public List<Beneficiario> consultarBeneficiarios(long numero)
        {
            GerenciadorBeneficiario gerenciadorBeneficiario = new GerenciadorBeneficiario();
            return gerenciadorBeneficiario.consultarBeneficiarios(numero);
        }


        /// <summary>
        /// Consulta os contrato quitados.
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) Contato(s) quitado(s) encontrado(s).</returns>
        public List<Contrato> consultarContratosQuitados(long numero)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarContratosQuitados(numero);

        }

        /// <summary>
        /// Consulta logs de dados contratuais
        /// </summary>
        public List<Contrato> consultarLogDadosContratuais(long numero)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarLogDadosContratuais(numero);
        }

        /// <summary>
        /// Verifica se teve suspensão no periodo cadastrado
        /// </summary>
        /// <param name="historico"></param>
        /// <returns></returns>
        public bool verificaSuspensaoPeriodo(long numeroContrato, DateTime dataIni, DateTime dataFim)//William Moreira da Silva SOL161447
        {
            GerenciadorHistoricoSuspensao gerenciadorHistoricoSuspensao = new GerenciadorHistoricoSuspensao();
            return gerenciadorHistoricoSuspensao.verificaSuspensaoPeriodo(numeroContrato, dataIni, dataFim);

        }//William Moreira da Silva SOL161447

        /// <summary>
        /// Valida a amortização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        /// <param name="dataCredito">Data de crédito do contrato.</param>
        /// <param name="dataLimite">Data limite para amortização.</param>
        /// <param name="excepcional">Indica se é uma amortização excepcional ou não.</param>
        /// <returns>Verdadeiro se a amortização é válida.</returns>
        public bool validarAmortizacao(long numeroContrato, DateTime dataAmortizacao, DateTime dataCredito, DateTime dataLimite, bool excepcional)
        {
            GerenciadorAmortizacao gerenciadorAmortizacao = new GerenciadorAmortizacao();
            return gerenciadorAmortizacao.validar(numeroContrato, dataAmortizacao, dataCredito, dataLimite, excepcional);
        }

        //Bruno.silva PPM:984370 SOL:255322/17559 - Início
        /// <summary>
        /// Busca Tipos de Excepcional
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public int [] buscaTiposExcepcional (long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaTiposExcepcional(numeroContrato);
        }
        //Bruno.silva PPM:984370 SOL:255322/17559 - FIM

        // SOL 204001
        /// <summary>
        /// Valida permissão Tipo de Contrato.
        /// </summary>
        /// <param name="idTipoContrato">Número do contrato.</param>        
        /// <returns>Verdadeiro se a permissão é válida.</returns>
        public bool validarPermissaoTipoContrato(long idTipoContrato)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.validarPermissao(idTipoContrato);
        }
        // SOL 204001

        /// <summary>
        /// Valida a quitação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        /// <param name="dataCredito">Data de crédito do contrato.</param>
        /// <param name="dataLimite">Data limite para quitação.</param>
        /// <param name="excepcional">Indica se é uma quitação excepcional ou não.</param>
        /// <returns>Verdadeiro se a quitação é válida.</returns>
        // SOL 204424 KTN 1976597 Otacilio
        // Verificar se a quitação é por falecimento acrescentado variavel bfalecimento
        public bool validarQuitacao(long numeroContrato, DateTime dataQuitacao, DateTime dataCredito, DateTime dataLimite, bool excepcional, bool bfalecimento)
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            return gerenciadorQuitacao.validar(numeroContrato, dataQuitacao, dataCredito, dataLimite, excepcional, bfalecimento);
        }

        /// <summary>
        /// Obtém as possíveis situações de um contrato.
        /// </summary>
        /// <returns>As possíveis situações de um contrato.</returns>
        public List<SituacaoContrato> listarSituacao()
        {
            return new GerenciadorContrato().listarSituacao();
        }

        /// <summary>
        /// Pesquisa contratos ativos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> pesquisarContratos(Contrato contrato, ref ParametrosConsulta parametros)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.pesquisar(contrato, ref parametros);
        }

        // Xavier SOL 177146 
        /// <summary>
        /// Verificar se existe débito comandado anterior à alguma prestação
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataVencimento"></param>
        /// <returns></returns>
        public bool VerificarValorAmortizacao(long numeroContrato, DateTime dataVencimento)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.VerificarValorAmortizacao(numeroContrato, dataVencimento);
        }
        // Xavier SOL 177146 

        /// <summary>
        /// Obtem parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        public int obterParcelasRestantes(long numeroContrato, DateTime dataReferencia)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterParcelasRestantes(numeroContrato, dataReferencia);
        }

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// Retorna caso haja parcela posterior.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        public bool existeParcelaPosterior(long numeroContrato, DateTime dataReferencia)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.existeParcelaPosterior(numeroContrato, dataReferencia);
        }
        //William Moreira da Silva SOL 211419

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public double obterSaldoDevedor(long numeroContrato, DateTime dataPrevista)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterSaldoDevedor(numeroContrato, dataPrevista);
        }

        /// <summary>
        /// Consulta um tipo de contrato
        /// </summary>
        /// <param name="id">Identificador do tipo de contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o tipo de contrato encontrado.</returns>
        public TipoContrato consultarTipoContrato(int id, bool veioConector)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.consultar(id, veioConector); //Xavier SOL 230843
        }

        /// <summary>
        /// Executa regra passando os parâmetros obtdos.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        /// <param name="parametros">Parâmetros da regra.</param>
        public object executarRegra(Regra regra, IDictionary<string, object> parametros)
        {
            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            return gerenciadorRegra.executar(regra, parametros);
        }

        /// <summary>
        /// Executa regra passando os parâmetros obtdos.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        /// <param name="parametros">Parâmetros da regra.</param>
        public object executarRegraRetorno(Regra regra, IDictionary<string, object> parametros, ref string mensagem)
        {
            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            return gerenciadorRegra.executarRetorno(regra, parametros, ref mensagem);
        }

        /// <summary>
        /// Obtém parâmetros da regra.
        /// </summary>
        /// <param name="id">Identificador da regra.</param>
        public IDictionary<string, object> obterParametrosRegra(Regra regra)
        {
            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            return gerenciadorRegra.obterParametros(regra);
        }

        /// <summary>
        /// Retorna itens calculados.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataAmortizacao">Data da amortização.</param>
        public List<ItemContrato> calcularItensAmortizacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataAmortizacao, int novoPrazo, double? valorAmortizacao, double? valorMargem)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.calcularItensAmortizacao(tipoContrato, numeroContrato, dataAmortizacao, novoPrazo, valorAmortizacao, valorMargem);
        }

        /// <summary>
        /// Retorna itens calculados.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public List<ItemContrato> calcularItensQuitacao(TipoContrato tipoContrato, long numeroContrato, DateTime dataQuitacao, TipoOperacao operacao, bool CampanhaInadimplencia)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.calcularItensQuitacao(tipoContrato, numeroContrato, dataQuitacao, operacao, CampanhaInadimplencia);
        }

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        public bool alterarInformacoesContratuais(Contrato contrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.alterarInformacoesContratuais(contrato);
        }

        /// <summary>
        /// Altera forma de cobrança do contrato.
        /// </summary>
        /// <param name="formaCobranca">Nova forma de cobrança.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool alterarFormaCobranca(string formaCobranca, long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.alterarFormaCobranca(formaCobranca, numeroContrato);
        }

        /// <summary>
        /// Aplica tratamento nas informações de histórico de amortização do contrato.
        /// </summary>
        /// <param name="historico"></param>
        public List<Historico> tratarHistoricoAmortizacao(List<Historico> historico)
        {
            GerenciadorAmortizacao gerenciadorAmortizacao = new GerenciadorAmortizacao();
            return gerenciadorAmortizacao.tratarHistorico(historico);
        }

        //William Moreira da Silva SOL 209315/14752
        /// <summary>
        /// Executa a atualização diária.
        /// </summary>
        public void executarAtualizacaoDiaria(long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.executarAtualizacaoDiaria(numeroContrato);
        }
        //William Moreira da Silva SOL 209315/14752

        /// <summary>
        /// Inclui histórico do contrato.
        /// </summary>
        /// <param name="historico"></param>
        public void incluirHistorico(List<Historico> historico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            gerenciadorHistorico.incluir(historico);
        }

        /// <summary>
        /// Atualiza itens do historico centralizados
        /// </summary>
        /// <param name="historico"></param>
        public void atualizarHistoricoSuspensaoItensCentralizados(Historico historico)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            gerenciador.atualizarHistoricoSuspensaoItensCentralizados(historico);
        }

        /// <summary>
        /// Inclui histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        public void incluirHistoricoNovo(List<Historico> historico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            gerenciadorHistorico.incluirNovo(historico);
        }

        /// <summary>
        /// Excluir histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        public void excluir(long idHistorico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            gerenciadorHistorico.excluir(idHistorico);
        }

        /// <summary>
        /// Atualizar histórico do contrato Chave Mestre.
        /// </summary>
        /// <param name="historico"></param>
        public void atualizarHistorico(Historico historico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            gerenciadorHistorico.atualizarHistorico(historico);

        }


        /// <summary>
        /// Lista os Tipos de Contrato do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoContrato"/> com o(s) tipo(s) de contratos(s) encontrado(s).</returns>
        public List<TipoContrato> listarTipoContrato()
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.listar();
        }

        public List<TipoProposta> listarTipoProposta()
        {
            GerenciadorDesconto gerenciadorTipoProposta = new GerenciadorDesconto();
            return gerenciadorTipoProposta.listarTipoProposta();
        }

        /// <summary>
        /// Lista as Moeda do sistema.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Moeda"/> com a(s) Moeda(s) encontrado(s).</returns>
        public List<Moeda> listarMoeda()
        {
            GerenciadorMoeda gerenciadorMoeda = new GerenciadorMoeda();
            return gerenciadorMoeda.listar();
        }

        /// <summary>
        /// Estorna Itens a Vencer Atualização diária.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public void estornarItensAtualizacao(long numeroContrato, DateTime dataQuitacao)
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            gerenciadorQuitacao.estornarItensAtualizacao(numeroContrato, dataQuitacao);
        }

        /// <summary>
        /// Estorna itens a vencer.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public void estornarItensAVencer(long numeroContrato, DateTime dataQuitacao)
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            gerenciadorQuitacao.estornarItensAVencer(numeroContrato, dataQuitacao);
        }

        /// <summary>
        /// Quitar itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataQuitacao">Data da quitação.</param>
        public void quitarItensEmAberto(long numeroContrato, DateTime dataQuitacao)
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            gerenciadorQuitacao.quitarItensEmAberto(numeroContrato, dataQuitacao);
        }

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        public void alterarSituacaoContrato(long numeroContrato, SituacaoContrato situacao)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.alterarSituacao(numeroContrato, situacao);
        }

        /// <summary>
        /// Altera informações de suspensão do contrato.
        /// </summary>
        /// <param name="suspensao">Dados da suspensão.</param>
        public void alterarSuspensaoParcelaContrato(HistoricoSuspensao suspensao)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.alterarSuspensao(suspensao);
        }

        /// <summary>
        /// Retira informações de suspensão do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void retirarSuspensaoParcelaContrato(long numeroContrato, string UsuarioLogado)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.retirarSuspensao(numeroContrato, UsuarioLogado);
        }

        /// <summary>
        /// Lista todos tipos de suspensão.
        /// </summary>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        public List<TipoSuspensao> listarTipoSuspensao()
        {
            GerenciadorTipoSuspensao gerenciadorTipoSuspensao = new GerenciadorTipoSuspensao();
            return gerenciadorTipoSuspensao.listar();
        }

        /// <summary>
        /// Consulta os tipos de suspensão.
        /// </summary>
        /// <param name="idTipoContrato">Identificação do contrato a ser filtrado.</param>
        /// <param name="idTipoSuspensao">Identificação do tipo de suspensão a ser filtrado.</param>
        /// <returns>Lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.TipoSuspensao"/> com o(s) tipo(s) de suspensão encontrada(s).</returns>
        public List<TipoSuspensao> consultarTipoSuspensao(int idTipoContrato, int? idTipoSuspensao)
        {
            GerenciadorTipoSuspensao gerenciadorTipoSuspensao = new GerenciadorTipoSuspensao();
            return gerenciadorTipoSuspensao.consultar(idTipoContrato, idTipoSuspensao);
        }

        /// <summary>
        /// Consulta contratos em aberto do mutuário e verifica condições de concessão
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <param name="excepcional">Flag para exceção na verificação</param>
        /// <param name="idTipoContratoConcessao">Tipo do contrato da concessão</param>
        /// <returns>Retorna contratos em aberto</returns>
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito, DateTime dataSolicitacao, bool excepcional, out List<string> listaAvisos, List<long> contratosSelecionados)// Thiago Melo SOL 206149
        {
            GerenciadorMutuario gerenciadorMutuario = new GerenciadorMutuario();
            return gerenciadorMutuario.consultarContratosEmAberto(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, dataCredito, dataSolicitacao, excepcional, out listaAvisos, contratosSelecionados);// Thiago Melo SOL 206149
        }

        /// <summary>
        /// Consulta históricos do contrato.
        /// </summary>
        /// <param name="historico">Tipo Histórico com os filtros</param>
        /// <returns>Retorna históricos do contrato</returns>
        public List<Historico> consultarHistorico(Historico historico, ref ParametrosConsulta parametros)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            return gerenciadorHistorico.consultar(historico, ref parametros);
            //return new List<Historico>();
        }

        /// <summary>
        /// Verifica se existe atualização diária para uma data no histórico do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool verificarAtualizacaoDiaria(long numeroContrato, DateTime dataReferencia)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.verificarAtualizacaoDiaria(numeroContrato, dataReferencia);
        }

        /// <summary>
        /// Retorna Itens de cálculo do tipo do contrato e tipo de evento.
        /// </summary>
        /// <param name="idTipoContrato">Identificador do tipo de contrato</param>
        /// <param name="idTipoEvento">Tipo de evento</param>
        public List<ItemContrato> obterItens(TipoContrato tipoContrato, TipoEvento tipoEvento)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.obterItens(tipoContrato, tipoEvento);
        }

        /// <summary>
        /// Executar regra para cada item da lista.
        /// </summary>
        /// <param name="itensContrato">Lista de itens de contrato.</param>
        public List<ItemContrato> calcularItens(List<ItemContrato> itensContrato, Dictionary<string, object> parametros)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();

            return gerenciadorTipoContrato.calcularItens(itensContrato, parametros, 0);//William Moreira da Silva - SOL 247419
        }

        /// <summary>
        /// Consulta historico de suspensão de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="idHistoricoSuspensao">Identificador do histórico de suspensão.</param>
        public List<HistoricoSuspensao> consultarHistoricoSuspensao(long numeroContrato, long idHistoricoSuspensao)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarHistoricoSuspensao(numeroContrato, idHistoricoSuspensao);
        }

        /// <summary>
        /// Consulta um histórico
        /// </summary>
        /// <param name="idHistorico">ID do Histórico</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o históricos encontrado.</returns>
        public Historico consultarDetalheContrato(long idHistorico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            return gerenciadorHistorico.consultarDetalheContrato(idHistorico);
        }

        /// <summary>
        /// Inclui um contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna numero do contrato inserido</returns>
        public long incluirContrato(Contrato contrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.incluir(contrato);
        }

        /// <summary>
        /// Inclui inscricao de empréstimo do contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna id da inscricao inserido</returns>
        public long incluirInscricao(Contrato contrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.incluirInscricao(contrato);
        }

        /// <summary>
        /// Inclui histórico da incrição de emprestimo do contrato
        /// </summary>
        /// <param name="idInscricao">ID da inscrição</param>
        /// <param name="item">Item do contrato</param>
        public void incluirInscricaoHistorico(long idInscricao, ItemContrato item)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.incluirInscricaoHistorico(idInscricao, item);
        }

        /// <summary>
        /// Executa o ajuste de Saldo.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataAtualiza">Data Atualiza.</param>
        /// <param name="saldoDevedor">Saldo Devedor.</param>
        public void executarAjusteSaldo(long numeroContrato, DateTime dataAtualiza, double saldoDevedor)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.executarAjusteSaldo(numeroContrato, dataAtualiza, saldoDevedor);
        }

        public bool verificarBloqueioContabilPeriodo(long numeroContrato, DateTime dataPrevista)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.verificarBloqueioContabilPeriodo(numeroContrato, dataPrevista);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o item foi enviado para a folha.
        /// </summary>
        /// <param name="idHistMovEmptmo"></param>
        /// <returns>0 para aguardando processamento e 2 para item recebido</returns>
        public void verificaSitEnvio(List<long> ids)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            gerenciador.verificaSitEnvio(ids);
        }

        /// <summary>
        /// Retorna parcela atual do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        // William Moreira da Silva 207977
        public int obterParcelaAtual(long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterParcelaAtual(numeroContrato);
        }

        /// <summary>
        /// Executa o ajuste da Situação.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void ajustarSituacao(long numeroContrato, DateTime dataReferencia)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.ajustarSituacao(numeroContrato, dataReferencia);
        }

        /// <summary>
        /// Verifica a existencia de uma suspensão ativa.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool verificarSuspensaoAtiva(long numeroContrato)
        {
            GerenciadorHistoricoSuspensao gerenciadorHistoricoSuspensao = new GerenciadorHistoricoSuspensao();
            return gerenciadorHistoricoSuspensao.verificarSuspensaoAtiva(numeroContrato);
        }

        /// <summary>
        /// Inclui historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        public void incluirHistoricoSuspensao(HistoricoSuspensao historico)
        {
            GerenciadorHistoricoSuspensao gerenciadorHistoricoSuspensao = new GerenciadorHistoricoSuspensao();
            gerenciadorHistoricoSuspensao.incluir(historico);
        }

        /// <summary>
        /// Altera historico de suspensão de um contrato.
        /// </summary>
        /// <param name="historioSuspensao">Dados da suspensão.</param>
        public void alterarHistoricoSuspensao(HistoricoSuspensao historico)
        {
            GerenciadorHistoricoSuspensao gerenciadorHistoricoSuspensao = new GerenciadorHistoricoSuspensao();
            gerenciadorHistoricoSuspensao.alterar(historico);
        }

        /// <summary>
        /// Verifica se algum tem contrato ativo
        /// </summary>
        /// <param name="historico"></param>
        /// <returns></returns>
        public bool verificaContratoAtivo(long numeroContrato)//William Moreira da Silva SOL161201 
        {
            GerenciadorHistoricoSuspensao gerenciadorHistoricoSuspensao = new GerenciadorHistoricoSuspensao();
            return gerenciadorHistoricoSuspensao.verificaContratoAtivo(numeroContrato);

        }//William Moreira da Silva SOL161201



        /// <summary>
        /// Altera a observação do histórico.
        /// </summary>
        /// <param name="idHistorico">ID do histórico.</param>
        /// <param name="observacao">Observação do Histórico.</param>
        public void alterarObservacaoHistorico(long idHistorico, string observacao)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            gerenciadorHistorico.alterarObservacao(idHistorico, observacao);
        }

        /// <summary>
        /// Consulta Itens de um contrato.
        /// </summary>
        public List<ItemContrato> listarItens()
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.listarItens();
        }

        /// <summary>
        /// Consulta Log de um contrato.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLog(LogContrato logContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarLog(logContrato);
        }

        //William Moreira da Silva - SOL 219785 KTN 2052123
        /// <summary>
        /// Método retorna o log do contrato em partes
        /// </summary>
        /// <param name="logContrato"></param>
        /// <param name="linhaInicial"></param>
        /// <returns>Retorna 3500 registros do log do contrato a partir da linha passada como parâmetro</returns>
        public List<LogContrato> consultarLogParticionado(LogContrato logContrato, int linhaInicial)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarLogParticionado(logContrato, linhaInicial);
        }

        /// <summary>
        /// Retorna a quantidade de linhas que exitems de logs
        /// </summary>
        /// <param name="logContrato"></param>
        /// <returns>A quantidade de logs existenteas na tabelas</returns>
        public int consultarQuantLog(LogContrato logContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarQuantLog(logContrato);
        }
        //William Moreira da Silva - SOL 219785 KTN 2052123

        //William Moreira da Silva
        /// <summary>
        ///Consulta Log de um contrato pela origem.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLogOrigem(LogContrato logContrato, int origem)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarLogOrigem(logContrato, origem);
        }
        //William Moreira da Silva

        /// <summary>
        /// Inclu o log de um contrato.
        /// </summary>
        /// <param name="logContrato">Log do contrato.</param>
        public void incluirLog(LogContrato logContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.incluirLog(logContrato);
        }

        // SOL 199759
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA 
        /// </summary>
        /// <param name="idInscricaoEmptmo">Inscrição do emprestimo.</param>
        /// <param name="idAvalista">Avalista.</param>
        public void incluirAvalista(Int32 idAvalista, long idContratoEmptmo)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.incluirAvalista(idAvalista, idContratoEmptmo);
        }
        // SOL 199759

        // SOL 199759
        /// <summary>
        /// Excluir idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA 
        /// </summary>
        /// <param name="idInscricaoEmptmo">Inscrição do emprestimo.</param>
        /// <param name="idAvalista">Avalista.</param>
        public void excluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.excluirAvalista(idAvalista, inscricaoPrevidenviaria);
        }
        // SOL 199759

        /// <summary>
        /// Inclui log se a Conta Corrente for alterada
        /// </summary>
        public void incluirLogDadosContratuais(Int64 idContrato, int idContaBancaria, string usuario)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            gerenciadorContrato.incluirLogDadosContratuais(idContrato, idContaBancaria, usuario);
        }

        public void gravarQuitacao(long numeroContrato, DateTime dataQuitacao, List<Historico> itensQuitacao)
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            gerenciadorQuitacao.gravar(numeroContrato, dataQuitacao, itensQuitacao, false);
        }

        public bool verificaCampanhaPendente(long numeroContrato, int tipoProposta)
        {
            GerenciadorDesconto gerenciadorDesconto = new GerenciadorDesconto();
            return gerenciadorDesconto.verificaCampanhaPendente(numeroContrato, tipoProposta);
        }

        public double calcularGravarDesconto(long numeroContrato, int tipoContrato, DateTime dataDesconto, List<ItemContrato> itensContrato, int origem, int tipoProposta)
        {
            GerenciadorDesconto gerenciadorDesconto = new GerenciadorDesconto();
            double ValorDesconto = gerenciadorDesconto.calcularManter(numeroContrato, tipoContrato, dataDesconto, itensContrato, origem, tipoProposta);
            gerenciadorDesconto.gravar();
            return ValorDesconto;
        }

        public bool efetivarTratamentoParcelas(long numeroContrato, DateTime dataCalculo, int numParcela, string origemRecurso, int tipoProposta)
        {
            GerenciadorInadimplencia gerenciadorInadimplencia = new GerenciadorInadimplencia();
            return gerenciadorInadimplencia.tratarParcelasEmAtraso(numeroContrato, dataCalculo, numParcela, origemRecurso, tipoProposta);
        }

        public List<ItemDescontoContrato> obterDesconto(long numeroContrato, int tipoContrato, DateTime dataDesconto, List<ItemContrato> itensContrato, int origem, int tipoProposta)
        {
            GerenciadorDesconto gerenciadorDesconto = new GerenciadorDesconto();
            gerenciadorDesconto.calcularManter(numeroContrato, tipoContrato, dataDesconto, itensContrato, origem, tipoProposta);
            return gerenciadorDesconto.itensDesconto;
        }

        public bool parcelaAtrasadaEmAberto(long numeroContrato, DateTime dataReferencia)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.parcelaAtrasadaEmAberto(numeroContrato, dataReferencia);
        }

        // Thiago Melo SOL 208661 Kintana 2021125
        public bool temItensAbertoPorMatricula(String matricula)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.temItensAbertoPorMatricula(matricula);
        }
        // Thiago Melo SOL 208661 Kintana 2021125

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns></returns>
        //William Moreira da Silva - SOL 260829 PPM 1045813
        public bool verificaItensAberto(int idPessoa, int idTitular)
        {
            GerenciadorContrato contrato = new GerenciadorContrato();
            return contrato.verificaItensAberto(idPessoa, idTitular);
        }
        //William Moreira da Silva - SOL 260829 PPM 1045813

        public long? consultarAutoEmprestimo(long codigoAutoEmprestimo)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.consultarAutoEmprestimo(codigoAutoEmprestimo);
        }
        // Xavier SOL 168644
        public int? consultarUltimoIdCalculo()
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            return gerenciadorQuitacao.consultarUltimoIdCalculo();
        }
        // Xavier SOL 168644
        public bool validarContratoPadrao(int idContratoPadrao)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();

            return gerenciadorContrato.validarContratoPadrao(idContratoPadrao);
        }

        public void incluirAssinaturaPadrao(Assinatura assinaturaContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();

            gerenciadorContrato.incluirAssinaturaPadrao(assinaturaContrato);
        }

        public List<Historico> consultarHistoricoEnvio(long idHistorico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();

            return gerenciadorHistorico.consultarHistoricoEnvio(idHistorico);
        }

        //William Moreira da Silva SOL 211704
        public DateTime? verificaParcelaGerada(long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.verificaParcelaGerada(numeroContrato);
        }
        //William Moreira da Silva SOL 211704

        public List<Historico> consultarEventoCobranca(long idContrato, long? idEvento)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();

            return gerenciadorHistorico.consultarEventoCobranca(idContrato, idEvento);

        }

        public List<Historico> consultarParcelaCobranca(long idContrato, int idTipoEvento, DateTime dataEvento)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();

            return gerenciadorHistorico.consultarParcelaCobranca(idContrato, idTipoEvento, dataEvento);
        }

        /// <summary>
        /// Verifica de existe suspensão de contratos anteriores em aberto
        /// </summary>
        /// <param name="dataCredito">Data crédito da concessão</param>
        /// <param name="listaContratos">Lista contratos (separados por ",")</param>
        public bool verificarSuspensaoAnteriores(DateTime dataCredito, string listaContratos)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.verificarSuspensaoAnteriores(dataCredito, listaContratos);
        }

        /// <summary>
        /// Método para o retorno dos itens em aberto da Fucionalidade de tratamento individual de Parcelas
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato a ser tratado</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato</param>
        /// <param name="itensBaixadosManualmente">bool para mostrar itens baixados manualmente</param>
        /// <param name="itensSuspensos">bool para mostrar apenas itens suspensos</param>
        /// <param name="itensPrestEncargos">bool para mostrar itens de pestações e encargos</param>
        /// <param name="itensSuspensos">bool para não mostrar itens suspensos</param>
        /// <returns>Lista dos itens em aberto</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public List<Historico> consultarItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.consultarItensAberto(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos);
        }

        /// <summary>
        /// Método para o retorno dos itens em aberto da Fucionalidade de tratamento individual de Parcelas
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato a ser tratado</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato</param>
        /// <param name="itensBaixadosManualmente">bool para mostrar itens baixados manualmente</param>
        /// <param name="itensSuspensos">bool para mostrar apenas itens suspensos</param>
        /// <param name="itensPrestEncargos">bool para mostrar itens de pestações e encargos</param>
        /// <param name="itensSuspensos">bool para não mostrar itens suspensos</param>
        /// <returns>Lista dos itens em aberto</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public List<Historico> consultarItensAbertoParticionado(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.consultarItensAbertoParticionado(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos, index);
        }

        //William Moreira da Silva - SOL 207977
        public int consultaQuantItensAberto(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.consultaQuantItensAberto(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos);
        }

        public Dictionary<int, string> obterItensDaCampanha(int tipoContrato)
        {
            GerenciadorDesconto gerenciadorDesconto = new GerenciadorDesconto();
            return gerenciadorDesconto.obterItensDaCampanha(tipoContrato); 
        }       

        public List<ParcelaDescontoCampanha> obterItensAbertoDesconto(long numeroContrato, int tipoContrato, DateTime dataLimite, int tipoProposta, bool IofCalculado)
        {
            GerenciadorInadimplencia gerenciadorInadimplencia = new GerenciadorInadimplencia();
            List<ItemContrato> parcelasEmAberto = gerenciadorInadimplencia.obterParcelasEmAberto(numeroContrato, dataLimite);
            List<ParcelaDescontoCampanha> listaParcelasDesconto = new List<ParcelaDescontoCampanha>();
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            string sistemaAmortizacao = gerenciadorTipoContrato.ObterTipoContrato(numeroContrato).SistemaAmortizacao;

            if (parcelasEmAberto != null && parcelasEmAberto.Count() > 0)
            {
                GerenciadorDesconto gerenciadorDesconto = new GerenciadorDesconto();
                Dictionary<int, double> percDescontoItem = gerenciadorDesconto.obterPercDescontoPorItem(numeroContrato, tipoContrato, dataLimite, tipoProposta);

                foreach (var parcela in parcelasEmAberto)
                {
                    Dictionary<string, double> valorEncargos = gerenciadorInadimplencia.calculaEncargosParcela(numeroContrato, parcela.parcela, parcela.numeroParcelas, parcela.dataPrevista, parcela.valor, dataLimite, sistemaAmortizacao, IofCalculado);

                    ParcelaDescontoCampanha parcelaDescontoCampanha = new ParcelaDescontoCampanha()
                    {
                        numParcela = parcela.parcela,
                        competencia = parcela.dataPrevista.ToString("yyyy/MM"),
                        valorParcela = parcela.valor,
                        percentualParcela = percDescontoItem.Single(x => x.Key == 13).Value,
                        percentualFGQC = percDescontoItem.SingleOrDefault(x => x.Key == 99).Value,
                        percentualCorrMonet = percDescontoItem.Single(x => x.Key == 42).Value,
                        percentualJurosRem = percDescontoItem.Single(x => x.Key == 43).Value,
                        percentualMulta = percDescontoItem.Single(x => x.Key == 44).Value,
                        percentualJurosMora = percDescontoItem.Single(x => x.Key == 46).Value,
                        percentualIOFComplementar = percDescontoItem.Single(x => x.Key == 121).Value,
                        valorFGQC = valorEncargos.SingleOrDefault(x => x.Key == "FGQC").Value,
                        valorCorrMonet = valorEncargos.Single(x => x.Key == "Correcao_Monetaria").Value,
                        valorJurosRem = valorEncargos.Single(x => x.Key == "Juros_Remuneratorios").Value,
                        valorMulta = valorEncargos.Single(x => x.Key == "Multa").Value,
                        valorJurosMora = valorEncargos.Single(x => x.Key == "Juros_Moratorios").Value,
                        valorIOFComplementar = valorEncargos.Single(x => x.Key == "IOF_Complementar").Value
                    };

                    parcelaDescontoCampanha.valorTotal = 
                        parcelaDescontoCampanha.valorParcela + 
                        parcelaDescontoCampanha.valorFGQC + 
                        parcelaDescontoCampanha.valorCorrMonet + 
                        parcelaDescontoCampanha.valorJurosRem + 
                        parcelaDescontoCampanha.valorJurosMora + 
                        parcelaDescontoCampanha.valorMulta + 
                        parcelaDescontoCampanha.valorIOFComplementar;

                    parcelaDescontoCampanha.valorTotalComDesconto =
                        parcelaDescontoCampanha.valorParcela * (1 - parcelaDescontoCampanha.percentualParcela) +
                        parcelaDescontoCampanha.valorFGQC * (1 - parcelaDescontoCampanha.percentualFGQC) +
                        parcelaDescontoCampanha.valorCorrMonet * (1 - parcelaDescontoCampanha.percentualCorrMonet) +
                        parcelaDescontoCampanha.valorJurosRem * (1 - parcelaDescontoCampanha.percentualJurosRem) +
                        parcelaDescontoCampanha.valorJurosMora * (1 - parcelaDescontoCampanha.percentualJurosMora) +
                        parcelaDescontoCampanha.valorMulta * (1 - parcelaDescontoCampanha.percentualMulta) +
                        parcelaDescontoCampanha.valorIOFComplementar;// * (1 - parcelaDescontoCampanha.valorIOFComplementar);

                    listaParcelasDesconto.Add(parcelaDescontoCampanha);
                }
            }

            return listaParcelasDesconto;
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se alguma da parcelas selecionadas já foi tratada anteriormente
        /// </summary>
        /// <param name="parcelas">Parcelas a serem verificadas</param>
        /// <param name="numeroContrato">Numero do Contrato</param>
        /// <param name="data">data em que a parcela foi tratada</param>
        /// <returns>Verdadeiro se a parcela já tiver sido tratada</returns>
        public bool verificaParcelaTratada(List<int> parcelas, long numeroContrato, ref DateTime data, ref DateTime dataVencimento)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.verificaParcelaTratada(parcelas, numeroContrato, ref data, ref dataVencimento);
        }

        /// <summary>
        /// Verifica se o tipo do contrato esta ativo
        /// </summary>
        /// <param name="idTipoContrato">id do contrato a ser validado</param>
        /// <returns>Retorna se o contato esta ativo ou não</returns>
        //William Moreira da Silva - SOL 214635 KTN 2044698
        public bool validaContratoAtivo(int idTipoContrato)
        {
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            return gerenciadorTipoContrato.validaContratoAtivo(idTipoContrato);
        }

        /// <summary>
        /// Busca informações básicas de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações básicas do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoContrato(long numContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaInfoContrato(numContrato);
        }

        /// <summary>
        /// Busca informações financeiras de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações financeiras do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoFinanceiras(long numContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaInfoFinanceiras(numContrato);
        }

        /// <summary>
        /// Busca informações adicionais de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações adicionais do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoAdicionais(long numContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaInfoAdicionais(numContrato);
        }

        /// <summary>
        /// Busca informações da suspensão de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <param name="idSuspensao">Identificador da suspensão do contrato</param>
        /// <param name="dataInicio">Data início da suspensão do contrato</param>
        /// <returns>Retorna Dictionary com as informações da suspensão do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoSuspensao(long numContrato, int idSuspensao, DateTime dataInicio)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaInfoSuspensao(numContrato, idSuspensao, dataInicio);
        }

        /// <summary>
        /// Busca informações da patrocinadora de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações da patrocinadora do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoPatrocinadora(long numContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaInfoPatrocinadora(numContrato);
        }

        /// <summary>
        /// Busca informações do plano de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações do plano do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoPlano(long numContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.buscaInfoPlano(numContrato);
        }

        /// <summary>
        /// Obtém quantidade de parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        // Saulo / FUNCEF
        public int obterNumParcelasRestantes(long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterNumParcelasRestantes(numeroContrato);
        }
        /// </summary>
        /// <param name="contrato">Contrato</param>
        /// <returns>Retorna a data com 3 dias uteis</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public DateTime obterDataCredito(long numeroContrato, bool veioConector)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.obterDataCredito(numeroContrato, veioConector);
        }

        /// <summary>
        /// Metodo para calcular os encargos dos itens, usado na tela de tratamento individual de parcelas
        /// </summary>
        /// <param name="itensContrato"></param>
        /// <returns>Lista com os itens tratados após passar pelas regras</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public List<ItemContrato> calcularEncargosVencimento(List<Historico> itensTratados, long numeroContrato, bool calcularEncargos, List<int> parcelas, DateTime dataVencimento, DateTime dataEvento, int tipoProposta)
        {
            GerenciadorTipoContrato gerenciador = new GerenciadorTipoContrato();
            return gerenciador.calcularEncargosVencimento(itensTratados, numeroContrato, calcularEncargos, parcelas, dataVencimento, dataEvento, tipoProposta);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verificar se existema itens não recebidos 
        /// </summary>
        /// <param name="idHistoricos"></param>
        /// <returns>retona true se existir algum item que tenha sido recebido</returns>
        public bool existeItensNaoRecebidos(List<long> idHistoricos)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.existeItensNaoRecebidos(idHistoricos);
        }

        /// <summary>
        /// Inseri os novos itens e altera o vencimento do que já existem
        /// </summary>
        /// <param name="itensaTratar">Itens que serão alterados</param>
        public void gravarAlteracoesHistorico(List<Historico> itensaTratar, int funcionalidade)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            gerenciador.gravarAlteracoesHistorico(itensaTratar, funcionalidade);
        }

        public bool situacaoPatrocianadora(long numeroContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.situacaoPatrocianadora(numeroContrato);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        public bool verificaItensRecebidoseBaixados(List<Historico> itensTratados)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.verificaItensRecebidoseBaixados(itensTratados);
        }

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se algum dos itens foi baixado e recebido
        /// </summary>
        /// <param name="itensTratados">itens a serem tratados</param>
        /// <returns>Verdadeiro se um dos itens fora baixado e recebido</returns>
        public bool verificaItemRecebidoseBaixados(Historico itemTratado)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.verificaItemRecebidoseBaixados(itemTratado);
        }

        /// <summary>
        /// Verifica se o mutuario tem vinculo empregaticio
        /// </summary>
        /// <param name="numeroContrato">Numero do contraro</param>
        /// <returns>Verdadeiro se o mutuario do contrato tiver vinculo</returns>
        public bool verificaVinculoEmpregaticio(long numeroContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.verificaVinculoEmpregaticio(numeroContrato);
        }
        //William Moreira da Silva - SOL 207977

        public void inseriLeiout(LeioutContrato leiout)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.inseriLeiout(leiout);
        }

        public LeioutContrato consultarleiout(int idTipoContratoEmptmo, DateTime? dataInicioVigencia)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.consultarleiout(idTipoContratoEmptmo, dataInicioVigencia);
        }

        /// <summary>
        /// Método para o retorno dos itens em aberto da Fucionalidade de tratamento individual de Parcelas
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato a ser tratado</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato</param>
        /// <param name="itensBaixadosManualmente">bool para mostrar itens baixados manualmente</param>
        /// <param name="itensSuspensos">bool para mostrar apenas itens suspensos</param>
        /// <param name="itensPrestEncargos">bool para mostrar itens de pestações e encargos</param>
        /// <param name="itensSuspensos">bool para não mostrar itens suspensos</param>
        /// <returns>Lista dos itens em aberto</returns>
        //SIG 67808 - Campanha Descontos - Matias
        public List<Historico> ConsultarItensAbertosParticionadoAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos, int index)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.ConsultarItensAbertosParticionadoAgrupados(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos, index);
        }

        /// <summary>
        /// Método para o retorno dos itens em aberto da Fucionalidade de tratamento individual de Parcelas
        /// </summary>
        /// <param name="numeroContrato">Numero do contrato a ser tratado</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato</param>
        /// <param name="itensBaixadosManualmente">bool para mostrar itens baixados manualmente</param>
        /// <param name="itensSuspensos">bool para mostrar apenas itens suspensos</param>
        /// <param name="itensPrestEncargos">bool para mostrar itens de pestações e encargos</param>
        /// <param name="itensSuspensos">bool para não mostrar itens suspensos</param>
        /// <returns>Lista dos itens em aberto</returns>
        //SIG 67808 - Campanha Descontos - Matias
        public List<Historico> ConsultarItensAbertosAgrupados(long numeroContrato, int idTipoContrato, int itensBaixadosManualmente, int itensApenasSuspensos, int itensPrestEncargos, int itensNaoSuspensos)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.ConsultarItensAbertosAgrupados(numeroContrato, idTipoContrato, itensBaixadosManualmente, itensApenasSuspensos, itensPrestEncargos, itensNaoSuspensos);
        }

        #region IServicoContrato Members


        public Historico consultarHistoricoChaveMestre(long idHistorico)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            return gerenciadorHistorico.consultarHistoricoChaveMestre(idHistorico);
        }


        #endregion

        #region IServicoContrato Members




        #endregion

        #region IServicoContrato Members



        #endregion

        #region IServicoContrato Members

        #endregion

        #region IServicoContrato Members



        #endregion

        #region IServicoContrato Members


        #endregion

        #region SIG 28915 - Eliamar Tani - Criação de método para listar assinaturas
        public List<Assinatura> consultarAssinaturas(Mutuario contrato, ref ParametrosConsulta parametros, ref string infoMutuario, ref string mensagemExcecao)
        {
            return new GerenciadorContrato().consultarAssinaturas(contrato, ref parametros, ref infoMutuario, ref mensagemExcecao);
    }

        public List<ContratoPadrao> consultarContratos()
        {
            return new GerenciadorContrato().consultarContratos();
        }

        public Assinatura obterAssinaturaContrato(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura)
        {
            return new GerenciadorContrato().obterAssinaturaContrato(idPessoa, idContratoPadrao, idBenef, dataAssinatura);
        }

        public bool excluirAssinaturaContratoPadrao(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura)
        {
            return new GerenciadorContrato().excluirAssinaturaContratoPadrao(idPessoa, idContratoPadrao, idBenef, dataAssinatura);
        }

        public void salvarAssinaturaContrato(Assinatura item)
        {
            new GerenciadorContrato().salvarAssinaturaContrato(item);
        }
        #endregion
        
        #region SIG 28915 - Darivaldo Alencar
        public bool NupEstaVinculado(string idPessoa, string protocolo)
        {
            return new GerenciadorContrato().NupEstaVinculado(idPessoa, protocolo);
        }
        #endregion

        //Sig 21529 -Inicio
        public List<ContratoRenegociacao> consultarParcelasRenegociacao(IDictionary<String, object> parametros)
        {
            return new GerenciadorContrato().consultarParcelasRenegociacao(parametros);
        }

        public int ContratoDecimoTerceito(string pNumContrato)
        {
            return new GerenciadorContrato().ContratoDecimoTerceito(pNumContrato);
        }
        //Sig 21529 - Fim

        //SIG21529.52136 -Inicio
        public Dictionary<string, double> EncargosDaParcela(ItemContrato parcela, Int64 numeroContrato, DateTime dataLimite, bool IofCalculado)
        {
            GerenciadorInadimplencia gerenciadorInadimplencia = new GerenciadorInadimplencia();
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            string sistemaAmortizacao = gerenciadorTipoContrato.ObterTipoContrato(numeroContrato).SistemaAmortizacao;

            return gerenciadorInadimplencia.calculaEncargosParcela(numeroContrato, parcela.parcela, parcela.numeroParcelas, parcela.dataPrevista, parcela.valor, dataLimite, sistemaAmortizacao, IofCalculado);
        }

        public bool DataCreditoPossuiINPC(string pDataCredito)
        {
            return new GerenciadorContrato().DataCreditoPossuiINPC(pDataCredito);
        }
        //SIG21529.52136 -Fim

        /// <summary>
        /// Obtem itens do contrato em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public List<ItemContrato> obterItensContratoEmAberto(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterItensEmAberto(numeroContrato, ref parametros, ref valorTotalItens);
        }

        //Campanha Desconto
        //public List<ItemContrato> ObterItensContratoEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        public List<ItemContrato> ObterItensContratoEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.ObterItensEmAbertoAgrupados(numeroContrato, ref parametros, ref valorTotalItens);
        }


        //public List<Historico> ObterItensContratoEmAbertoAgrupados(long numeroContrato, long idPessoa, DateTime dataCalculo, int tipoProposta, long idCalculo = 0)
        //{

        //William Santana - SIG 50871 - inicio
        public List<ModeloContratoEmp> consultarModelosContratos(string tipocontrato, DateTime? DataInicioVigencia, ref ParametrosConsulta parametros)
        {
            return new GerenciadorContrato().consultarModelosContratos(tipocontrato, DataInicioVigencia, ref parametros);
        }

        public string InsAltDelModContratos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao)
        {
            string retorno = new GerenciadorContrato().InsAltDelModContratos(modContrato, leiaute, operacao);
            return retorno;
        }
        //William Santana - SIG 50871 - fim     

        //    return null;
        //}

        public InformacoesQuitacao CalcularQuitacaoCampanhaDescontos(long numeroContrato, DateTime dataQuitacao, long idCalculo = 0, int tipoProposta = 0)
        {
            GerenciadorQuitacao gerenciadorQuitacao = new GerenciadorQuitacao();
            return gerenciadorQuitacao.CalcularQuitacaoCampanhaDescontos(numeroContrato, dataQuitacao, idCalculo, tipoProposta);

        }

        public LeioutContrato ConsultarLeioutCampanhaDesconto(int idTipoContratoEmptmo)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.ConsultarLeioutCampanhaDesconto(idTipoContratoEmptmo);
        }

        //SIG 67808 - Campanha Descontos - Matias
        public List<Historico> ConsultarItensAbertosAgrupadosDesc(long numeroContrato, long idPessoa, DateTime dataCalculo, int tipoProposta, long idCalculo = 0)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.ConsultarItensAbertosAgrupados(numeroContrato, idPessoa, dataCalculo, tipoProposta, idCalculo);
        }

        //SIG 67808 - Campanha Descontos - Saulo Cirineu
        public double buscaSaldoInadimplente(long numeroContrato, DateTime dataInadimplencia)
        {
            GerenciadorInadimplencia gerenciadorInadimplencia = new GerenciadorInadimplencia();
            return gerenciadorInadimplencia.buscaSaldoInadimplente(numeroContrato, dataInadimplencia);
        }

        //SIG 67808 - Campanha Descontos - Matias
        public EmptmoDocFinanceiroDTO AtualizarEnvioParcelasInadimplentes(long idContratoEmptmo, DateTime dataVencimento, string origemRecurso, int tipoProposta)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.AtualizarEnvioParcelasInadimplentes(idContratoEmptmo, dataVencimento, origemRecurso, tipoProposta);
        }

        //SIG 67808 - Campanha Descontos - Matias
        public bool ValidarData(DateTime dataOperacao)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.ValidarData(dataOperacao);
        }

        public string ObterNossoNumeroPorCodDocumento(double codDocumento)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.ObterNossoNumeroPorCodDocumento(codDocumento);
        }

        public bool VerificarDocumentoEmitido(double codDocumento)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.VerificarDocumentoEmitido(codDocumento);
        }

        public string ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(int codPortForma)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.ObterProximoNossoNumeroDoConvenioPorCodigoPortadorForma(codPortForma);
        }

        public void AtualizarNossoNumero(string nossoNumero, int codPortForma)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            gerenciador.AtualizarNossoNumero(nossoNumero, codPortForma);
        }

        public void AtualizarNossoNumeroCoddocumento(double codDocumento, string nossoNumero)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            gerenciador.AtualizarNossoNumero(codDocumento, nossoNumero);
        }

        public Boleto ObterBoletoPorCodDocumento(double codDocumento, int portForma, bool blDocumentoEmitido, int tipoMovimento)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.ObterBoletoPorCodDocumento(codDocumento, portForma, blDocumentoEmitido, tipoMovimento);
        }

        public void AtualizarCampoEmisBloqParaS(double codDocumento)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            gerenciador.AtualizarCampoEmisBloqParaS(codDocumento);
        }

        public EmptmoDocFinanceiroDTO RetornarDocumentoEnviado(double idContratoEmptmo, int tipoMovimento, int numParcela, DateTime dataVencimento)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.RetornarDocumentoEnviado(idContratoEmptmo, tipoMovimento, numParcela, dataVencimento);

        }

        public ContratoDTO BuscarDadosContratoImpressao(long NumeroContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.BuscarDadosContratoImpressao(NumeroContrato);
        }

        public DateTime ObterUltimoDiaUtilBoleto()
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.ObterUltimoDiaUtilBoleto();
        }

        public DateTime ObterProximoDiaUtil(DateTime data)
        {
            GerenciadorAmortizacao gerenciador = new GerenciadorAmortizacao();
            return gerenciador.ObterProximoDiaUtil(data);
        }

        public List<Historico> buscarHistoricoDePrestacoesEmAberto(long numeroContrato, List<int> prestacoes)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            return gerenciadorHistorico.buscarHistoricoDePrestacoesEmAberto(numeroContrato, prestacoes);
        }

        public bool liberarSuspensao(List<Historico> itens)
        {
            GerenciadorHistorico gerenciadorHistorico = new GerenciadorHistorico();
            return gerenciadorHistorico.liberarSuspensao(itens);
        }

        //SIG 48294
        public List<Contrato> BuscarContratosParaCancelamento(Contrato contrato, ref ParametrosConsulta parametros)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.BuscarContratosParaCancelamento(contrato, ref parametros);
        }

        //SIG 48294
        public bool VerificarDocumentoBaixado(long NumeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.VerificarDocumentoBaixado(NumeroContrato);
        }
        public bool VerificaExistenciaPrestacoes(long NumeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.VerificaExistenciaPrestacoes(NumeroContrato);
        }
        
        //SIG 63057
        public ContratoDTO ToContratoDTO(RelatorioContrato relatorioContrato)
        {
            ContratoDTO contrato = new ContratoDTO(string.Empty);

            contrato.NumeroContrato = relatorioContrato.numeroContrato;
            contrato.NumParcelas = relatorioContrato.prazo;

            contrato.FlgPossuiCarimbo = 0;
            contrato.FlgEfetivado = 0;
            contrato.FlgLiquidoZero = 1;
            contrato.ValorLiquido = 0;
            contrato.ValorMaximo = relatorioContrato.valorMaximo;
            contrato.ValorSolicitado = relatorioContrato.valorMaximo;
            contrato.DataCredito = DateTime.Now.Date;
            contrato.DataAssinatura = relatorioContrato.dataAssinatura;
            contrato.Valido = true;
            contrato.MsgErro = string.Empty;
            contrato.DadosBancarios = string.Empty;
            contrato.Modalidade = relatorioContrato.tipoContrato.descricao;
            contrato.Prazo = relatorioContrato.tipoContrato.maximoParcelas;

            contrato.ContrAntQuit = relatorioContrato.contratosQuitados;
            contrato.FlgObrigatorio = "1";
            contrato.SeloCarimboTempo = string.Empty;
            contrato.Ip = "0";

            contrato.Matricula = relatorioContrato.mutuario.matricula;
            contrato.Nome = relatorioContrato.mutuario.nome;
            contrato.Cpf = relatorioContrato.mutuario.cpf;
            contrato.Rg = relatorioContrato.identidade;

            contrato.Logradouro = relatorioContrato.logradouro;
            contrato.Bairro = relatorioContrato.bairro;
            contrato.Cidade = relatorioContrato.cidade.nome;
            contrato.Uf = relatorioContrato.uf.nome;
            contrato.Cep = relatorioContrato.cep;

            contrato.TelCelular = relatorioContrato.numeroCelular;
            contrato.TelComercial = relatorioContrato.numeroComercial;
            contrato.TelResidencial = relatorioContrato.numeroResidencial;

            contrato.Agencia = relatorioContrato.conta.agencia.ToString().Substring(0, 4);
            contrato.Operacao = relatorioContrato.conta.contaCorrente.Substring(0, 3);
            contrato.Conta = relatorioContrato.conta.contaCorrente.ToString();

            contrato.Emails = relatorioContrato.emailComercial + " " + relatorioContrato.emailPessoal;
            contrato.ValorMaxPermitido = (double)relatorioContrato.valorMaximo;
            contrato.Codigo_Hash = "";
            contrato.HashAssinatura = "";
            contrato.DataHoraCarimboTempo = DateTime.Now.ToString();
            contrato.IdTipoContrato = relatorioContrato.tipoContrato.id;
            contrato.ContratoQuitaAnterior = relatorioContrato.contratosQuitados;
            contrato.IdPessoa = relatorioContrato.mutuario.id;
            contrato.IdTitular = relatorioContrato.mutuario.idTitular;
            contrato.ConcessaoInternet = 0;

            contrato.descontoInadimplencia = relatorioContrato.descontoInadimplencia;

            //List<Pessoa> listaFiadores = new List<Pessoa>();
            //foreach (var item in relatorioContrato.fiadores)
            //{
            //    if (item.id > 0)
            //    {
            //        Pessoa pessoa = this.buscaInfosFiadores(item.id);
            //        pessoa.conjuge = "nao";
            //        listaFiadores.Add(pessoa);
            //    }
            //    else if (item.idConjugue > 0)
            //    {
            //        Pessoa conjuge = this.buscaInfosFiadores(item.idConjugue);
            //        conjuge.conjuge = "sim";
            //        listaFiadores.Add(conjuge);
            //    }
            //}

            //contrato.fiadores = listaFiadores.Count > 0 ? listaFiadores : new List<Pessoa>();
            contrato.financiamento = relatorioContrato.financiamento;
            contrato.valorFinanciamento = relatorioContrato.valorFinanciamento;
            contrato.PropostaCampanha = relatorioContrato.PropostaCampanha;
            contrato.SaldoDevedor = relatorioContrato.SaldoDevedor;
            contrato.SaldoInadimplente = relatorioContrato.SaldoInadimplente;
            contrato.profissao = relatorioContrato.profissao;
            contrato.tipoCobranca = relatorioContrato.tipoCobranca;
            contrato.NomeTestemunha1 = relatorioContrato.nomeTest1;
            contrato.CpfTestemunha1 = relatorioContrato.cpfTest1;
            contrato.NomeTestemunha2 = relatorioContrato.nomeTest2;
            contrato.CpfTestemunha2 = relatorioContrato.cpfTest2;
            return contrato;
        }

        public string ObterAmbienteBancoDados()
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.ObterAmbienteBancoDados();
        }

        //SIG 42330
        public List<Serasa> BuscarContratosInclusaoSerasa(int NumeroRemessa, string Usuario, DateTime DataEventoCobranca)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            return gerenciador.BuscarContratosInclusaoSerasa(NumeroRemessa, Usuario, DataEventoCobranca);
        }

        //SIG 42330
        public void GravarDataGeracaoArquivoSerasa(decimal NumeroContrato, int NumeroRemessa, int IdEventoCobranca)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            gerenciador.GravarDataGeracaoArquivoSerasa(NumeroContrato, NumeroRemessa, IdEventoCobranca);
        }

        //SIG 42330
        public int ObterNumeroRemessaArquivo()
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            return gerenciador.ObterNumeroRemessaArquivo();
        }

        public List<ParametrosCampanha> ObterParametrosCampanha(DateTime? DataInicio, DateTime? DataFim)
        {
            GerenciadorDesconto gerenciador = new GerenciadorDesconto();
            return gerenciador.ObterParametrosCampanha(DataInicio, DataFim);
        }

        public void incluirParametrosCampanha(ParametrosCampanha parametros)
        {
            GerenciadorDesconto gerenciador = new GerenciadorDesconto();
            gerenciador.IncluirParametrosCampanha(parametros);
        }

        public void atualizarParametrosCampanha(ParametrosCampanha parametros)
        {
            GerenciadorDesconto gerenciador = new GerenciadorDesconto();
            gerenciador.AtualizarParametrosCampanha(parametros);
        }

        public TipoContrato ObterTipoContrato(long NumeroContrato)
        {
            GerenciadorTipoContrato gerenciador = new GerenciadorTipoContrato();
            return gerenciador.ObterTipoContrato(NumeroContrato);
        }

        public List<long> BuscarContratosInadimplentes(int IdPessoa)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            return gerenciador.BuscarContratosInadimplentes(IdPessoa);
        }

        public itemPrestacaoDTO BuscarResumoInadimplencia(long NumeroContrato, DateTime DataPrevista)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            return gerenciador.BuscarResumoInadimplencia(NumeroContrato, DataPrevista);
        }

        public DateTime diaUltimaAtualizacao(long numeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.diaUltimaAtualizacao(numeroContrato);
        }
        
        public void AlterarItensSuspensao(HistoricoSuspensao Suspensao)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.AlterarItensSuspensao(Suspensao);
        }

        public void DesfazerRemessaSerasa(int NumeroRemessa, double IdUsuarioLogado)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            gerenciador.DesfazerRemessaSerasa(NumeroRemessa, IdUsuarioLogado);
        }  
    


        public List<ItemContrato> obterItensEmAbertoRenegociacao(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.obterItensEmAbertoRenegociacao(numeroContrato, ref parametros, ref valorTotalItens);
        }

        public List<ItemContrato> ObterItensEmAbertoAgrupadosComData(long numeroContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.ObterItensEmAbertoAgrupadosComData(numeroContrato);
        }

        public List<ItemContrato> obterItensEmAberto(long NumeroContrato, int NumeroParcela)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.obterItensEmAberto(NumeroContrato, NumeroParcela);
        }        

        public EmptmoDocFinanceiroDTO EnviarBoletoBancario(long NumeroContrato, int NumeroParcela, DateTime DataVencimento, int TipoMovimento)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.EnviarBoletoBancario(NumeroContrato, NumeroParcela, DataVencimento, TipoMovimento);
        }

        public string VerificarMesRefParcela(long NumeroContrato, int NumeroParcela)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.VerificarMesRefParcela(NumeroContrato, NumeroParcela);
        }

        public List<ItemContrato> ObterParcelasEmAberto(long NumeroContrato, DateTime DataLimite)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            return gerenciador.obterParcelasEmAberto(NumeroContrato, DataLimite);
        }

        public void ExecutarRelatorioInadimplencia(long NumeroContrato, DateTime DataLimite)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            gerenciador.ExecutarRelatorioInadimplencia(NumeroContrato, DataLimite);
        }

        public List<Historico> ConsultarItensAbertosAgrupadosPorParcela(long NumeroContrato, DateTime? DataLimite)
        {
            GerenciadorHistorico gerenciador = new GerenciadorHistorico();
            return gerenciador.ConsultarItensAbertosAgrupadosPorParcela(NumeroContrato, DataLimite);
        }
       
        public List<long> BuscarContratosAtivosEncerrados()
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            return gerenciador.BuscarContratosAtivosEncerrados();
        }

        public List<TipoContrato> ListarTodas()
        {
            GerenciadorTipoContrato gerenciador = new GerenciadorTipoContrato();
            return gerenciador.ListarTodas();
        }

        public void SalvarMinutasContratosAntigos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.SalvarMinutasContratosAntigos(modContrato, leiaute, operacao);
        }

        public RelatorioContrato BuscarDadosContratosAutoAtendimento(long NumeroContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.BuscarDadosContratosAutoAtendimento(NumeroContrato);               
        }

        public List<ModeloContratoEmp> ConsultarModelosContratosSemMinuta(int IdMinutaContrato)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            return gerenciador.ConsultarModelosContratosSemMinuta(IdMinutaContrato);             
            
        }

        //WO3200
        public void CancelarBloqueioConcessao(int IdPessoa, string UsuarioResponsavel, bool RenegociacaoInadimplencia = false)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.CancelarBloqueioConcessao(IdPessoa, UsuarioResponsavel, RenegociacaoInadimplencia);
        }

        //WO3200
        public void ExcluirEventoCobranca(long NumeroContrato, int IdTipoEventoCobranca)
        {
            GerenciadorContrato gerenciador = new GerenciadorContrato();
            gerenciador.ExcluirEventoCobranca(NumeroContrato, IdTipoEventoCobranca);
        }


        public bool VerificarRenegociacaoInadP3(long NumeroContrato)
        {
            GerenciadorContrato gerenciadorContrato = new GerenciadorContrato();
            return gerenciadorContrato.VerificarRenegociacaoInadP3(NumeroContrato);
        }

        public int BuscarQtdParcelasSuspensas(long NumeroContrato)
        {
            GerenciadorHistoricoSuspensao gerenciadorHistoricoSuspensao = new GerenciadorHistoricoSuspensao();
            return gerenciadorHistoricoSuspensao.BuscarQtdParcelasSuspensas(NumeroContrato);
        }

        public void AtualizarDataArquivoEmLote(List<decimal> contratos, int numeroRemessa, DateTime dataEvento)
        {
            GerenciadorInadimplencia gerenciador = new GerenciadorInadimplencia();
            gerenciador.AtualizarDataArquivoEmLote(contratos, numeroRemessa, dataEvento);
        }        
    }
}
