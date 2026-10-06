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
#region SIG 21529
///
/// Autor:
/// Thayane Rabonato
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
#region SOL 255960 / PPM 843375
/// - SOL: 255960 PPM: 843375
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Atualização:
/// 23/06/2015
///
/// Descrição da Alteração:
/// Correção na rontina de verificação de atualização diária, quando o contrato estiver com situação de encerrado
/// o sistema não deve apresentar a mensagem de indicação de falta de atualização diária. A regra diz que os contratos
/// com situação "E" de encerrado não tem atualização diária.
/// 
#endregion
#region SOL 251684 / PPM 764007
///
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Alteração:
/// 30/05/2015 15:00:00
///
/// Descrição da Alteração:
/// Inconsistência quando da alteração da conta bancária, está alterando a forma de cobrança
///
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes;
using System.Net;


namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa Contrato
    /// </summary>
    public class GerenciadorContrato : ObjetoNegocioSistema
    {
        #region Atributos

        private IAcessoContrato acesso = FabricaObjetos.instancia.obterAcessoContrato();

        #endregion

        #region Consultas

        //William Moreira da Silva - SOL 246823 - Envio
        public List<PlanoPrevidenciario> obterPlanosPrevidenciarios()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.obterPlanosPrevidenciarios();
            }
        }
        public List<Patrocinadora> obterPatrocinadoras()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.obterPatrocinadoras();
            }
        }

        /// <summary>
        /// Obtem as informações do envio que esta pendente
        /// </summary>
        /// <returns>Informações do envio pendente</returns>
        public ObjetoEnvio obterInfosEnvioProcessando()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.obterInfosEnvioProcessando();
            }
        }

        public void incluirInformacoesEnvioETL(ObjetoEnvio envio)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirInformacoesEnvioETL(envio);

                transacao.Complete();
            }
        }
        //William Moreira da Silva - SOL 246823 - Envio

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> consultarAtivos(Contrato contrato, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (contrato == null)
                    throw new ArgumentNullException("contrato");

                List<Contrato> contratos = acesso.consultarAtivos(contrato, ref parametros);

                //Completa a transação
                transacao.Complete();

                return contratos;
            }
        }

        /// <summary>
        /// Consulta contratos Quitados
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> consultarContratosQuitados(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (numeroContrato == 0)
                    throw new ArgumentNullException("contrato");

                List<Contrato> contratos = acesso.consultarContratosQuitados(numeroContrato);

                //Completa a transação
                transacao.Complete();

                return contratos;
            }
        }



        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultar(long numero, bool veioConector)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                veioConector = false;
                Contrato contrato = acesso.consultar(numero, veioConector);

                //Completa a transação
                transacao.Complete();

                return contrato;
            }
        }

        //Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - Metodo Overload;
        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="pIsConcessao">Chamada da tela de concessão</param>/// 
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultar(long numero, bool veioConector ,bool pIsConcessao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Contrato contrato = acesso.consultar(numero, veioConector, pIsConcessao);

                //Completa a transação
                transacao.Complete();

                return contrato;
            }
        }
        //Marcio Sanches Spinosa - SOL 209974 KTN 2024435

        /// <summary>
        /// Consulta um contrato
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o contratos encontrado.</returns>
        public Contrato consultarContaCorrente(long numero)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Contrato contrato = acesso.consultarContaCorrente(numero);

                //Completa a transação
                transacao.Complete();

                return contrato;
            }
        }

        /// <summary>
        /// Pesquisa contratos
        /// </summary>
        /// <param name="contrato">Contrato a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        public List<Contrato> pesquisar(Contrato contrato, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (contrato == null)
                    throw new ArgumentNullException("contrato");

                List<Contrato> contratos = acesso.pesquisar(contrato, ref parametros);

                //Completa a transação
                transacao.Complete();

                return contratos;
            }
        }

        /// <summary>
        /// Altera forma de cobrança do contrato.
        /// </summary>
        /// <param name="formaCobranca">Nova forma de cobrança.</param>
        /// <param name="numeroContrato">Número do contrato.</param>
        public bool alterarFormaCobranca(string formaCobranca, long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarFormaCobranca(formaCobranca, numeroContrato);

                //Completa a transação
                transacao.Complete();

                return true;
            }
        }

        /// <summary>
        /// Obtém as possíveis situações de um contrato.
        /// </summary>
        /// <returns>As possíveis situações de um contrato.</returns>
        public List<ItemContrato> listarItens()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<ItemContrato> itens = acesso.listarItens();

                return itens;
            }
        }

        /// <summary>
        /// Consulta Log de um contrato.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLog(LogContrato logContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<LogContrato> logs = acesso.consultarLog(logContrato);

                //Completa a transação
                transacao.Complete();

                return logs;
            }
        }

        //William Moreira da Silva
        /// <summary>
        ///Consulta Log de um contrato pela origem.
        /// <param name=""></param>
        /// <param name=""></param>
        /// </summary>
        public List<LogContrato> consultarLogOrigem(LogContrato logContrato, int origem)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<LogContrato> logs = acesso.consultarLogOrigem(logContrato, origem);

                //Completa a transação
                transacao.Complete();

                return logs;
            }
        }
        //William Moreira da Silva

        public long? consultarAutoEmprestimo(long codigoAutoEmprestimo)
        {

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                long? numeroContrato = acesso.consultarAutoEmprestimo(codigoAutoEmprestimo);

                //Completa a transação
                transacao.Complete();

                return numeroContrato;
            }

        }

        /// <summary>
        /// Consulta logs de dados contratuais
        /// </summary>
        public List<Contrato> consultarLogDadosContratuais(long numero)
        {
            List<Contrato> logs = new List<Contrato>();

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                logs = acesso.consultarLogDadosContratuais(numero);

                //Completa a transação
                transacao.Complete();
            }

            return logs;

        }

        /// <summary>
        /// Verifica de existe suspensão de contratos anteriores em aberto
        /// </summary>
        /// <param name="dataCredito">Data crédito da concessão</param>
        /// <param name="listaContratos">Lista contratos (separados por ",")</param>
        public bool verificarSuspensaoAnteriores(DateTime dataCredito, string listaContratos)
        {
            List<HistoricoSuspensao> lista = new List<HistoricoSuspensao>();

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                lista = acesso.consultarSuspensaoAnteriores(dataCredito, listaContratos);

                //Completa a transação
                transacao.Complete();
            }

            if (lista.Count > 0)
                return lista.FindAll(c => c.tipoSuspensao.apenasConcessao == false).Count > 0;
            else
                return false;
        }

        #endregion

        #region Cálculo de Data Limite

        /// <summary>
        /// Calcula data limite considerando feriados
        /// </summary>
        /// <param name="dataCalculo">Data base para cálculo</param>
        public DateTime calcularDataLimite(DateTime dataCalculo)
        {

            DateTime dataCalculada = dataCalculo;
            if (dataCalculo.DayOfWeek == DayOfWeek.Monday || dataCalculo.DayOfWeek == DayOfWeek.Tuesday)
                dataCalculada = dataCalculada.AddDays(3);
            else if (dataCalculo.DayOfWeek == DayOfWeek.Saturday)
                dataCalculada = dataCalculada.AddDays(4);
            else if (dataCalculo.DayOfWeek == DayOfWeek.Sunday)
                dataCalculada = dataCalculada.AddDays(3);
            else
                dataCalculada = dataCalculada.AddDays(5);

            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            ParametroSistema parametros = gerenciadorRegra.consultarParametroSistema();

            int hora = int.Parse(parametros.horaEncerramento.Split(':')[0]);
            int minuto = int.Parse(parametros.horaEncerramento.Split(':')[1]);        

            if (DateTime.Now.Hour >= hora)
            {
                if (DateTime.Now.Hour > hora)
                    dataCalculada = dataCalculada.AddDays(1d);
                else if (DateTime.Now.Hour == hora && DateTime.Now.Minute > minuto)
                    dataCalculada = dataCalculada.AddDays(1d);
            }

            //Verifica se data calculada não é final de semana
            if (dataCalculada.DayOfWeek == DayOfWeek.Saturday)
                dataCalculada = dataCalculada.AddDays(2);
            else if (dataCalculo.DayOfWeek == DayOfWeek.Sunday)
                dataCalculada = dataCalculada.AddDays(1);

            return this.ajustarDataFeriado(dataCalculada, dataCalculo);
        }

        public DateTime calcularDataLimiteDebito(DateTime dataCalculo)
        {

            DateTime dataCalculada = dataCalculo;
            if (dataCalculo.DayOfWeek == DayOfWeek.Monday || dataCalculo.DayOfWeek == DayOfWeek.Tuesday)
                dataCalculada = dataCalculada.AddDays(3);
            else if (dataCalculo.DayOfWeek == DayOfWeek.Saturday)
                dataCalculada = dataCalculada.AddDays(4);
            else if (dataCalculo.DayOfWeek == DayOfWeek.Sunday)
                dataCalculada = dataCalculada.AddDays(3);
            else
                dataCalculada = dataCalculada.AddDays(5);

            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();
            ParametroSistema parametros = gerenciadorRegra.consultarParametroSistema();

            int hora = int.Parse(parametros.horaEncerramentoDebito.Split(':')[0]);
            int minuto = int.Parse(parametros.horaEncerramentoDebito.Split(':')[1]);

            if (DateTime.Now.Hour >= hora)
            {
                if (DateTime.Now.Hour > hora)
                    dataCalculada = dataCalculada.AddDays(1d);
                else if (DateTime.Now.Hour == hora && DateTime.Now.Minute > minuto)
                    dataCalculada = dataCalculada.AddDays(1d);
            }

            //Verifica se data calculada não é final de semana
            if (dataCalculada.DayOfWeek == DayOfWeek.Saturday)
                dataCalculada = dataCalculada.AddDays(2);
            else if (dataCalculo.DayOfWeek == DayOfWeek.Sunday)
                dataCalculada = dataCalculada.AddDays(1);

            return this.ajustarDataFeriado(dataCalculada, dataCalculo);
        }

        #endregion

        #region Ajuste de Feriado

        private DateTime ajustarDataFeriado(DateTime data, DateTime dataOrigem)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool feriado = false;
               //Marcio Sanches Spinosa - SOL 243166 PPM 603594

                //bool primeiraVerificacao = true;

                //while (feriado || primeiraVerificacao)
                //Marcio Sanches Spinosa - SOL 243166 PPM 603594

                while (dataOrigem <= data)
                {
                    //Marcio Sanches Spinosa - SOL 243166 PPM 603594

                    //if (primeiraVerificacao)
                    //{
                    //    if (acesso.verificarDataFeriado(data))
                    //    {
                    //        feriado = true;
                    //        data = data.AddDays(1);
                    //    }
                    //    primeiraVerificacao = false;
                    //}
                    //Marcio Sanches Spinosa - SOL 243166 PPM 603594

                    if (acesso.verificarDataFeriado(dataOrigem))
                    {
                        feriado = true;
                        data = data.AddDays(1);
                    }

                    if (feriado)
                    {
                        if (data.DayOfWeek == DayOfWeek.Saturday)
                            data = data.AddDays(2);
                        else if (data.DayOfWeek == DayOfWeek.Sunday)
                            data = data.AddDays(1);

                        feriado = acesso.verificarDataFeriado(data);
                    }
                    dataOrigem = dataOrigem.AddDays(1);
                }

                transacao.Complete();

                return data;
            }
        }

        #endregion

        #region Verificação de amortização

        /// <summary>
        /// Verifica se exite mais de uma atualização do Saldo devedor do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        /// <param name="tipoEvento">Tipo de Evento.</param>
        public bool verificarAtualizacaoSaldo(long numeroContrato, DateTime dataAmortizacao, TipoEvento tipoEvento)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.verificarAtualizacaoSaldo(numeroContrato, dataAmortizacao, tipoEvento);

                transacao.Complete();
                return retornoVerificacao;
            }
        }

        /// <summary>
        /// Verifica se existe atualização diária para uma data no histórico do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do cotrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool verificarAtualizacaoDiaria(long numeroContrato, DateTime dataReferencia)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.verificarAtualizacaoDiaria(numeroContrato, dataReferencia);

                transacao.Complete();
                return retornoVerificacao;
            }
        }

        // Xavier SOL 177146 inicio.
        /// <summary>
        /// Verificar se existe débito comandado anterior à alguma prestação
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataVencimento"></param>
        /// <returns></returns>
        public bool VerificarValorAmortizacao(long numeroContrato, DateTime dataVencimento)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoVerificacao = acesso.VerificarValorAmortizacao(numeroContrato, dataVencimento);

                transacao.Complete();
                return retornoVerificacao;
            }
        }
        // Xavier SOL 177146 Final.

        /// <summary>
        /// Verificar se existe parcela atrasada em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataReferencia">Data de referência.</param>
        public bool parcelaAtrasadaEmAberto(long numeroContrato, DateTime dataReferencia)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoParcela = acesso.parcelaAtrasadaEmAberto(numeroContrato, dataReferencia);

                transacao.Complete();
                return retornoParcela;
            }
        }


        // Thiago Melo SOL 208661 Kintana 2021125
        /// <summary>
        /// Verificar se existe itens em aberto por matricula.
        /// </summary>        
        /// <param name="matricula">matricula.</param>
        public bool temItensAbertoPorMatricula(String matricula)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retornoItens = acesso.temItensAbertoPorMatricula(matricula);

                transacao.Complete();
                return retornoItens;
            }
        }
        // Thiago Melo SOL 208661 Kintana 2021125


        #endregion

        #region Situação do Contrato

        /// <summary>
        /// Obtém as possíveis situações de um contrato.
        /// </summary>
        /// <returns>As possíveis situações de um contrato.</returns>
        public List<SituacaoContrato> listarSituacao()
        {
            List<SituacaoContrato> situacoes = new List<SituacaoContrato>();

            situacoes.Add(new SituacaoContrato("A", "ATIVO"));
            situacoes.Add(new SituacaoContrato("C", "CANCELADO"));
            situacoes.Add(new SituacaoContrato("J", "EM COBRANÇA JURÍDICA"));
            situacoes.Add(new SituacaoContrato("K", "EM QUITAÇÃO"));
            situacoes.Add(new SituacaoContrato("E", "ENCERRADO"));
            situacoes.Add(new SituacaoContrato("Q", "QUITADO"));
            situacoes.Add(new SituacaoContrato("R", "RENOVADO"));

            return situacoes;
        }

        #endregion

        #region Alterar Informações Contratuais

        /// <summary>
        /// Altera informações do contrato.
        /// </summary>
        /// <param name="contrato">Contrato com os dados para alteração.</param>
        //William Moreira da Silva SOL 209315/14752
        public bool alterarInformacoesContratuais(Contrato contrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (contrato == null)
                    throw new ArgumentNullException("contrato");

                acesso.alterarInformacoesContratuais(contrato);
                // Wylliam Leite da Silva - SOL 251684 PPM 764007
                //acesso.alterarFormaCobranca(contrato.formaRecebimento, contrato.numero);

                LogContrato log = new LogContrato()
                {
                    descricao = Origem.alteracaoContratual.descricao,
                    origem = Origem.alteracaoContratual,
                    numeroContrato = contrato.numero
                };

                acesso.incluirLog(log);

                //Completa a transação
                transacao.Complete();

                return true;
            }
        }

        #endregion

        #region Inclusão

        /// <summary>
        /// Inclui um contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna numero do contrato inserido</returns>
        public long incluir(Contrato contrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (contrato == null)
                    throw new ArgumentNullException("contrato");

                long idInscricao = acesso.incluir(contrato);

                //Completa a transação
                transacao.Complete();

                return idInscricao;
            }
        }

        /// <summary>
        /// Inclui inscricao de empréstimo do contrato
        /// </summary>
        /// <param name="contrato">Dados do contrato</param>
        /// <returns>Retorna id da inscricao inserido</returns>
        public long incluirInscricao(Contrato contrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (contrato == null)
                    throw new ArgumentNullException("contrato");

                long idInscricao = acesso.incluirInscricao(contrato);

                //Completa a transação
                transacao.Complete();

                return idInscricao;
            }
        }

        /// <summary>
        /// Inclui histórico da incrição de emprestimo do contrato
        /// </summary>
        /// <param name="idInscricao">ID da inscrição</param>
        /// <param name="item">Item do contrato</param>
        public void incluirInscricaoHistorico(long idInscricao, ItemContrato item)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirInscricaoHistorico(idInscricao, item);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Inclu o log de um contrato.
        /// </summary>
        /// <param name="logContrato">Log do contrato.</param>
        public void incluirLog(LogContrato logContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirLog(logContrato);

                //Completa a transação
                transacao.Complete();
            }
        }

        // SOL 199759
        /// <summary>
        /// Inclui idInscricaoEmptmo e idAvalista na estrutura CONTRATOXAVALISTA 
        /// </summary>
        /// <param name="idInscricaoEmptmo">Inscrição do emprestimo.</param>
        /// <param name="idAvalista">Avalista.</param>
        public void incluirAvalista(Int32 idAvalista, long idContratoEmptmo)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirAvalista(idAvalista, idContratoEmptmo);

                //Completa a transação
                transacao.Complete();
            }
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
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.excluirAvalista(idAvalista, inscricaoPrevidenviaria);

                //Completa a transação
                transacao.Complete();
            }
        }
        // SOL 199759

        /// <summary>
        /// Inclui log se a Conta Corrente for alterada
        /// </summary>
        public void incluirLogDadosContratuais(Int64 idContrato, int idContaBancaria, string usuario)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirLogDadosContratuais(idContrato, idContaBancaria, usuario);

                //Completa a transação
                transacao.Complete();
            }

        }

        #endregion

        //William Moreira da Silva - SOL 251082
        /// <summary>
        /// Obtem o novo numero de contrato
        /// </summary>
        /// <returns>Retorna o novo numero de contrato</returns>
        public long obterNumeroContrato()
        {
            return acesso.obterNumeroContrato();
        }

        //Bruno.silva PPM:984370 SOL:255322/17559 - Início
        /// <summary>
        /// Busca Tipo de Excepcional
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <returns></returns>
        public int[] buscaTiposExcepcional(long numeroContrato)
        {
            return acesso.buscaTiposExcepcional(numeroContrato);
        }

        /// <summary>
        /// Verifica se o numero de contrato já existe
        /// </summary>
        /// <param name="numeroContrato">Número do contrato que esta sendo contratado</param>
        /// <returns>Retorna verdadeiro se já existir </returns>
        public bool verificanumeroContrato(long numeroContrato)
        {
            return acesso.verificanumeroContrato(numeroContrato);
        }
        //William Moreira da Silva - SOL 251082

        /// <summary>
        /// Obtem itens em aberto do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public List<ItemContrato> obterItensEmAberto(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (!Validacao.inteiroLongoValido(numeroContrato, 1))
                    throw new ArgumentNullException("numeroContrato");

                List<ItemContrato> itens = acesso.obterItensEmAberto(numeroContrato, ref parametros);

                valorTotalItens = itens.Sum(i => i.valor);

                //Completa a transação
                transacao.Complete();

                if (itens.Count > 100)
                {
                    List<ItemContrato> itensRetorno = new List<ItemContrato>();
                    for (int i = 0; i < 100; i++)
                    {
                        itensRetorno.Add(itens[i]);
                    }

                    return itensRetorno;

                }
                else
                    return itens;
            }
        }

        /// <summary>
        /// Retorna parcela atual do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public int obterParcelaAtual(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                int parcelaAtual = acesso.obterParcelaAtual(numeroContrato);

                transacao.Complete();
                return parcelaAtual;
            }
        }

        //William Moreira da Silva SOL 211704
        /// <summary>
        /// Verifica se a parcela do mês já foi gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public DateTime? verificaParcelaGerada(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DateTime? parcela = acesso.verificaParcelaGerada(numeroContrato);

                transacao.Complete();
                return parcela;
            }
        }
        //William Moreira da Silva SOL 211704

        //William Moreira da Silva SOL 211418
        /// <summary>
        /// Retorna caso a parcela já tenha sido gerada
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="parcela">Parcela a ser consultada</param>
        public bool verificaEnvio(long numeroContrato, int parcela)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool envio = acesso.verificaEnvio(numeroContrato, parcela);

                transacao.Complete();
                return envio;
            }
        }
        //William Moreira da Silva SOL 211418

        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public double obterPrestacaoAtual(long numeroContrato)//William Moreira da Silva SOL 144458
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                double prestacaoAtual = acesso.obterPrestacaoAtual(numeroContrato);

                transacao.Complete();
                return prestacaoAtual;
            }
        }//William Moreira da Silva SOL 144458


        /// <summary>
        /// Obtem o valor da prestação atual
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public double obterPrestacaoAtualComFGQC(long numeroContrato)//William Moreira da Silva SOL 144458
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                double prestacaoAtualComFGQC = acesso.obterPrestacaoAtualComFGQC(numeroContrato);

                transacao.Complete();
                return prestacaoAtualComFGQC;
            }
        }//SIG90605


        /// <summary>
        /// Obtem parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        public int obterParcelasRestantes(long numeroContrato, DateTime dataReferencia)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                int parcelasRestantes = acesso.obterDadosAnteriorPosteriorContrato(numeroContrato, dataReferencia).parcelaRestanteAnterior;

                transacao.Complete();
                return parcelasRestantes;
            }
        }

        //William Moreira da Silva SOL 211419
        /// <summary>
        /// Retorna caso haja parcela posterior.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        public bool existeParcelaPosterior(long numeroContrato, DateTime dataReferencia)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool parcelaPosterior = acesso.existeParcelaPosterior(numeroContrato, dataReferencia);

                transacao.Complete();

                return parcelaPosterior;
            }
        }
        //William Moreira da Silva SOL 211419

        //William Moreira da Silva - SOL 241797
        /// <summary>
        /// Obtem saldo devedor do contrato através da ultima data de atualização.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public double obterUltSaldoDevedor(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                double saldoDevedor = acesso.obterUltSaldoDevedor(numeroContrato);

                transacao.Complete();
                return saldoDevedor;
            }
        }
        //William Moreira da Silva - SOL 241797

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public double obterSaldoDevedor(long numeroContrato, DateTime dataPrevista)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                double saldoDevedor = acesso.obterSaldoDevedor(numeroContrato, dataPrevista);

                transacao.Complete();
                return saldoDevedor;
            }
        }

        /// <summary>
        /// Obtem saldo devedor do contrato através de uma data prevista.
        /// </summary>
        /// <param name="numeroContrato">Núemro do contrato.</param>
        /// <param name="dataPrevista">Data prevista.</param>
        public DateTime obterDataAtualizacao(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DateTime dataAtualizacao = acesso.obterDataAtualizacao(numeroContrato);

                transacao.Complete();
                return dataAtualizacao;
            }
        }

        #region verifica se o mutuario tem itens em aberto
        /// <summary>
        /// 
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns></returns>
        //William Moreira da Silva - SOL 260829 PPM 1045813
        public bool verificaItensAberto(int idPessoa, int idTitular)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.verificaItensAberto(idPessoa, idTitular);
            }
        }
        //William Moreira da Silva - SOL 260829 PPM 1045813
        #endregion

        /// <summary>
        /// Função usada para chamar a regra que retorna a data de credito de acordo com os feriados
        /// e finais de semana. Regra usada 6170
        /// </summary>
        /// <param name="contrato">Contrato</param>
        /// <returns>Retorna a data com 3 dias uteis</returns>
        //William Moreira da Silva - SOL 207977 PPM
        public DateTime obterDataCredito(long numeroContrato, bool veioConector)
        {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();
            GerenciadorRegra gerenciadorRegra = new GerenciadorRegra();

            ObjetoContrato contrato = new ObjetoContrato(numeroContrato);
            TipoContrato tipoContrato = gerenciadorTipoContrato.consultar(contrato.tipo.id, veioConector);

            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);
            parametros.Add("IDPLANO_P", contrato.plano.id);
            parametros.Add("SITFUNDACAO_P", contrato.mutuario.flginternoParticipante);
            parametros.Add("IDPATRO_P", contrato.patrocinadora.id);
            parametros.Add("DATAASSINATURA_P", DateTime.Today);
            parametros.Add("EXCEPCIONAL_P", 0);
            parametros.Add("IDCALCULO_P", 0);
            parametros.Add("USUARIO_P", Contexto.obterUsuario());


            return Convert.ToDateTime(gerenciadorRegra.executar(tipoContrato.regraDataCredito, parametros));
        }

        ////William Moreira da Silva - SOL 207977
        //public void executarAtualizacaoDiaria(long numeroContrato, DateTime dataAtualiza)
        //{

        //    using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
        //    {
        //        DateTime ultAtualizacao = acesso.diaUltimaAtualizacao(numeroContrato);
        //        DateTime dataConsiderar = DateTime.Today;
        //        dataConsiderar = DateTime.Parse("20/" + dataConsiderar.Month.ToString() + "/" + dataConsiderar.Year.ToString());

        //        acesso.executarAtualizacaoDiaria(numeroContrato, ultAtualizacao, dataConsiderar);

        //        transacao.Complete();
        //    }
        //}

        public void executarAtualizacaoDiaria(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DateTime ultAtualizacao = acesso.diaUltimaAtualizacao(numeroContrato);
                DateTime dataConsiderar = DateTime.Today;
                dataConsiderar = DateTime.Parse("20/" + dataConsiderar.Month.ToString() + "/" + dataConsiderar.Year.ToString());

                acesso.executarAtualizacaoDiaria(numeroContrato, ultAtualizacao, dataConsiderar);

                transacao.Complete();
            }
        }

        public bool situacaoPatrocianadora(long numeroContrato)
        {
            return acesso.situacaoPatrocianadora(numeroContrato);
        }

        /// <summary>
        /// Verifica se o mutuario tem vinculo empregaticio
        /// </summary>
        /// <param name="numeroContrato">Numero do contraro</param>
        /// <returns>Verdadeiro se o mutuario do contrato tiver vinculo</returns>
        public bool verificaVinculoEmpregaticio(long numeroContrato)
        {
            return acesso.verificaVinculoEmpregaticio(numeroContrato);
        }
        //William Moreira da Silva - SOL 207977 

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        public void alterarSituacao(long numeroContrato, SituacaoContrato situacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarSituacao(numeroContrato, situacao);

                transacao.Complete();
            }
        }

        /// <summary>
        /// Altera a situação do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="situacao">Situação do contrato.</param>
        //Willliam Moreira da Silva - SOL 225203
        //public void alterarSituacao(long numeroContrato, SituacaoContrato situacao)
        public string alterarSituacao(long numeroContrato)
        {
            return acesso.alterarSituacao(numeroContrato);
        }
        //Willliam Moreira da Silva - SOL 225203

        /// <summary>
        /// Altera informações de suspensão do contrato.
        /// </summary>
        /// <param name="suspensao">Dados da suspensão.</param>
        public void alterarSuspensao(HistoricoSuspensao suspensao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                suspensao.usuarioLogado = Contexto.obterUsuario();
                acesso.alterarSuspensao(suspensao);

                transacao.Complete();
            }
        }

        /// <summary>
        /// Retira informações de suspensão do contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        public void retirarSuspensao(long numeroContrato, string UsuarioLogado)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.retirarSuspensao(numeroContrato, UsuarioLogado);

                transacao.Complete();
            }
        }

        /// <summary>
        /// Ajuste de Saldo devedor
        /// </summary>
        /// <param name="numeroContrato">Número do contrato</param>
        /// <param name="dataAtualiza">Data da atualiza</param>
        /// <param name="saldoDevedor">Saldo devedor</param>
        public void executarAjusteSaldo(long numeroContrato, DateTime dataAtualiza, double saldoDevedor)
        {
            GerenciadorRegra regra = new GerenciadorRegra();

            if (regra.verificarBloqueioContabil(dataAtualiza) && regra.verificarPeriodo(dataAtualiza))
            {
                LogContrato log = new LogContrato()
                {
                    numeroContrato = numeroContrato,
                    descricao = Origem.atualizacaoSaldo.descricao,
                    origem = Origem.atualizacaoSaldo
                };

                try
                {
                    //Executa procedure de ajuste de saldo
                    using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
                    {
                        acesso.executarAjusteSaldo(numeroContrato, dataAtualiza, saldoDevedor);
                        acesso.incluirLog(log);

                        transacao.Complete();
                    }
                }
                catch (Exception ex)
                {
                    throw new ExcecaoPlanus("Erro ao executar procedure de ajuste de saldo.", ex);
                }

            }
        }

        /// <summary>
        /// Verificar Bloqueio Contabil e periodo
        /// </summary>
        /// <param name="numeroContrato">Número do contrato</param>
        /// <param name="dataAtualiza">Data da atualiza</param>

        public bool verificarBloqueioContabilPeriodo(long numeroContrato, DateTime dataPrevista)
        {
            GerenciadorRegra regra = new GerenciadorRegra();

            if (regra.verificarBloqueioContabilChaveMestre(dataPrevista) && regra.verificarPeriodoChaveMestre(dataPrevista))
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        /// <summary>
        /// Ajusta a situação do contrato
        /// </summary>
        /// <param name="numeroContrato"></param>
        //Willliam Moreira da Silva - SOL 225203 - Método alterado para usar apenas a procedure para atualizar a situação do contrato
        public void ajustarSituacao(long numeroContrato, DateTime dataReferencia)
        {
            //SituacaoContrato situacao = new SituacaoContrato();

            //Contrato contrato = this.consultar(numeroContrato, false);
            ObjetoContrato contrato = new ObjetoContrato(numeroContrato, false); //Saulo - FUNCEF

            /*
            //Verifica se existe quitação
            GerenciadorQuitacao quitacao = new GerenciadorQuitacao();
            bool existeQuitacao = quitacao.existeQuitacao(numeroContrato);
            DateTime dataMinVencto = quitacao.dataMinVencto(numeroContrato);
            bool existeQuitacaoLancada = quitacao.verificarQuitacaoLancada(numeroContrato);

            //Verifica se existe itens em aberto
            ParametrosConsulta parametros = new ParametrosConsulta();
            double valorItens = 0;
            bool itensEmAberto = this.obterItensEmAberto(numeroContrato, ref parametros, ref valorItens).Count > 0 ? true : false;

            //Obtem saldo devedor
            double saldo = this.obterSaldoDevedor(numeroContrato, dataReferencia);

            // SOL 201048 inicio da reformulação de acordo com o PLanus
            //Se existir saldo devedor 
            if (saldo > 0)  // se há saldo              
            {
                situacao.codigo = existeQuitacao ? "K" : "A"; // existe registro de quitação, o Contrato está em EM QUITAÇÃO (K) se não o Contrato está (A)TIVO
            }
            else
            {
                if (existeQuitacaoLancada)
                {
                    situacao.codigo = "K"; //"EM QUITAÇÃO"
                }
                else
                {
                    if (!itensEmAberto) // se não há saldo e não há itens em aberto o Contrato está (Q)UITADO, independente de haver registro de quitação
                    {
                        situacao.codigo = "Q"; //"QUITADO"
                    }
                    else if (dataMinVencto < DateTime.Now)  // SOL 175562 KINTANA 1637191 implementado no Planus por Bruno Azevedo
                    {
                        situacao.codigo = "E"; //"ENCERRADO"
                    }
                    else if (itensEmAberto && existeQuitacao) // se não há saldo, há itens em aberto e existe registro de quitação, o Contrato está em EM QUITAÇÃO (K)
                    {
                        situacao.codigo = "K"; //"EM QUITAÇÃO"
                    }
                    else if (itensEmAberto && !existeQuitacao) // se não há saldo, há itens em aberto e não existe registro de quitação, o Contrato está em (E)NCERRADO
                    {
                        situacao.codigo = "E"; //"ENCERRADO"
                    }
                    else
                    {
                        return;
                    }
                }
            }*/
            // SOL 201048 final da reformulação de acordo com o PLanus

            LogContrato log = new LogContrato();
            SituacaoContrato sit = new SituacaoContrato();//Willliam Moreira da Silva - SOL 225203
            /*{
                numeroContrato = numeroContrato,
                descricao = "Ajuste de Situação de " + contrato.situacao + " para " + situacao,
                origem = Origem.consultaContratos
            };*/

            //log.numeroContrato = numeroContrato;
            //log.descricao = "Ajuste de Situação de " + contrato.situacao.codigo + " para " + situacao.codigo;
            //log.origem = Origem.consultaContratos;
            sit.descricao = this.alterarSituacao(numeroContrato);
            //Se a nova situação for diferente da situação do contrato, altera a situação do contrato
            //if (!contrato.situacao.codigo.Equals(situacao.codigo))
            if (!contrato.situacao.codigo.Equals(sit.descricao) && !string.IsNullOrEmpty(sit.descricao))
            {
                log.numeroContrato = numeroContrato;
                log.descricao = "Ajuste de Situação de " + contrato.situacao.codigo + " para " + sit.descricao;
                log.origem = Origem.consultaContratos;
                //this.alterarSituacao(numeroContrato, situacao);
                acesso.incluirLog(log);
            }
            //Willliam Moreira da Silva - SOL 225203

        }

        /// <summary>
        /// Consulta historico de suspensão de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        /// <param name="idHistoricoSuspensao">Identificador do histórico de suspensão.</param>
        public List<HistoricoSuspensao> consultarHistoricoSuspensao(long numeroContrato, long idHistoricoSuspensao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<HistoricoSuspensao> itens = acesso.consultarHistoricoSuspensao(numeroContrato, idHistoricoSuspensao);

                //Completa a transação
                transacao.Complete();

                return itens;
            }
        }

        /// <summary>
        /// Coloca o numero do contrato de Quitação no contrato quitado
        /// </summary>
        public void alterarContratoQuitacao(long contratoNovo, long contratoQuitado)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarContratoQuitacao(contratoNovo, contratoQuitado);

                //Completa a transação
                transacao.Complete();
            }
        }

        /// <summary>
        /// Coloca data de quitação no contrato
        /// </summary>
        /// <param name="numeroContrato"></param>
        /// <param name="dataQuitacao"></param>
        public void alterarDataQuitacao(long numeroContrato, DateTime dataQuitacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.alterarDataQuitacao(numeroContrato, dataQuitacao);

                //Completa a transação
                transacao.Complete();
            }

        }

        public bool validarContratoPadrao(int idContratoPadrao)
        {
            bool retorno = false;

            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                retorno = acesso.validarContratoPadrao(idContratoPadrao);
                transacao.Complete();
            }

            return retorno;
        }

        public void incluirAssinaturaPadrao(Assinatura assinaturaContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirAssinaturaPadrao(assinaturaContrato);

                transacao.Complete();
            }
        }

        //William Moreira da Silva - SOL 143476/16437
        public void incluirInformacoesDadosContratoEmptmo(RelatorioContrato relatorio)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.incluirInformacoesDadosContratoEmptmo(relatorio);

                transacao.Complete();
            }
        }
        //William Moreira da Silva - SOL 143476/16437

        //William Moreira da Silva - SOL 219785 KTN 2052123
        /// <summary>
        /// Método retorna o log do contrato em partes
        /// </summary>
        /// <param name="logContrato"></param>
        /// <param name="linhaInicial"></param>
        /// <returns>Retorna 3500 registros do log do contrato a partir da linha passada como parâmetro</returns>
        public List<LogContrato> consultarLogParticionado(LogContrato logContrato, int linhaInicial)
        {
            List<LogContrato> logs;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                logs = acesso.consultarLogParticionado(logContrato, linhaInicial);

                transacao.Complete();
            }
            return logs;
        }

        /// <summary>
        /// Retorna a quantidade de linhas que exitems de logs
        /// </summary>
        /// <param name="logContrato"></param>
        /// <returns>A quantidade de logs existenteas na tabelas</returns>
        public int consultarQuantLog(LogContrato logContrato)
        {
            int quantLogs;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                quantLogs = acesso.consultarQuantLog(logContrato);

                transacao.Complete();
            }
            return quantLogs;
        }
        //William Moreira da Silva - SOL 219785 KTN 2052123

        /// <summary>
        /// Busca informações básicas de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações básicas do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoContrato(long numContrato)
        {
            Dictionary<string, object> infoContrato;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                infoContrato = acesso.buscaInfoContrato(numContrato);

                transacao.Complete();
            }
            return infoContrato;
        }

        /// <summary>
        /// Busca informações financeiras de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações financeiras do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoFinanceiras(long numContrato)
        {
            Dictionary<string, object> infoFinanceiras;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                infoFinanceiras = acesso.buscaInfoFinanceiras(numContrato);

                transacao.Complete();
            }
            return infoFinanceiras;
        }

        /// <summary>
        /// Busca informações adicionais de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações adicionais do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoAdicionais(long numContrato)
        {
            Dictionary<string, object> infoAdicionais;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                infoAdicionais = acesso.buscaInfoAdicionais(numContrato);

                transacao.Complete();
            }
            return infoAdicionais;
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
            Dictionary<string, object> infoSuspensao;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                infoSuspensao = acesso.buscaInfoSuspensao(numContrato, idSuspensao, dataInicio);

                transacao.Complete();
            }
            return infoSuspensao;
        }

        /// <summary>
        /// Busca informações da patrocinadora de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações da patrocinadora do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoPatrocinadora(long numContrato)
        {
            Dictionary<string, object> infoPatrocinadora;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                infoPatrocinadora = acesso.buscaInfoPatrocinadora(numContrato);

                transacao.Complete();
            }
            return infoPatrocinadora;
        }

        /// <summary>
        /// Busca informações do plano de um contrato
        /// </summary>
        /// <param name="numContrato">Número do contrato</param>
        /// <returns>Retorna Dictionary com as informações do plano do contrato</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoPlano(long numContrato)
        {
            Dictionary<string, object> infoPlano;
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                infoPlano = acesso.buscaInfoPlano(numContrato);

                transacao.Complete();
            }
            return infoPlano;
        }

        /// <summary>
        /// Obtém quantidade de parcelas restantes de um contrato.
        /// </summary>
        /// <param name="numeroContrato">Número do contrato.</param>
        // Saulo / FUNCEF
        public int obterNumParcelasRestantes(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                int numParcelasRestantes = acesso.obterNumParcelasRestantes(numeroContrato);

                transacao.Complete();
                return numParcelasRestantes;
            }
        }

        public void inseriLeiout(LeioutContrato leiout)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.inseriLeiout(leiout);
                transacao.Complete();
            }
        }

        public LeioutContrato consultarleiout(int idTipoContratoEmptmo, DateTime? dataInicioVigencia)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                LeioutContrato leiout = acesso.consultarleiout(idTipoContratoEmptmo, dataInicioVigencia);

                transacao.Complete();
                return leiout;
            }
        }
		
		//Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Inicio
        /// <summary>
        /// Verifica a situação atual do contrato
        /// </summary>
        /// <param name="prNumeroContrato">Número do cotrato.</param>
        public string verificaSituacaoContrato(long prNumeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                string situacaoContrato = acesso.verificaSituacaoContrato(prNumeroContrato);

                transacao.Complete();
                return situacaoContrato;
            }
        }
        //Wylliam Leite da Silva - SOL: 255960 PPM: 843375 - Fim

        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - início
        public void EncerrarBloqueioConcessao(int IdPessoa, DateTime DataQuitacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.EncerrarBloqueioConcessao(IdPessoa, DataQuitacao);
                transacao.Complete();
            }
        }
        
        public bool isAcordoJudicial(long Numerocontrato, ref int IdPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool retorno = acesso.isAcordoJudicial(Numerocontrato, ref IdPessoa);
                
                transacao.Complete();

                return retorno;
            } 
        }

        // Felipe A. Santos SOL 224034/17909 PPM 1165556 - fim

        #region SIG 28915 - Eliamar Tani - Criação de método para listar assinaturas
        public List<Assinatura> consultarAssinaturas(Mutuario contrato, ref ParametrosConsulta parametros, ref string infoMutuario, ref string mensagemExcecao)
        {
            return acesso.consultarAssinaturas(contrato, ref parametros, ref infoMutuario, ref mensagemExcecao);
        }

        public List<ContratoPadrao> consultarContratos()
        {
            return acesso.consultarContratos();
        }

        public Assinatura obterAssinaturaContrato(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura)
        {
            return acesso.obterAssinaturaContrato(idPessoa, idContratoPadrao, idBenef, dataAssinatura);
        }

        public bool excluirAssinaturaContratoPadrao(string idPessoa, string idContratoPadrao, string idBenef, string dataAssinatura)
        {
            return acesso.excluirAssinaturaContratoPadrao(idPessoa, idContratoPadrao, idBenef, dataAssinatura);
        }

        public void salvarAssinaturaContrato(Assinatura item)
        {
            acesso.salvarAssinaturaContrato(item);
        }
        #endregion
               
        #region SIG 28915 - Darivaldo Alencar
        public bool NupEstaVinculado(string idPessoa, string protocolo)
        {
            return acesso.NupEstaVinculado(idPessoa, protocolo);
        }
        #endregion

        //Sig 21529-
        public List<ContratoRenegociacao> consultarParcelasRenegociacao(IDictionary<String, object> parametros)
        {
            return acesso.consultarParcelasRenegociacao(parametros);
        }

        public int ContratoDecimoTerceito(string pNumContrato)
        {
            return acesso.ContratoDecimoTerceito(pNumContrato);
        }

        public bool DataCreditoPossuiINPC(string pDataCredito)
        {
            return acesso.DataCreditoPossuiINPC(pDataCredito);
        }
        //Sig 21529

        //Campanha Desconto
        public List<ItemContrato> ObterItensEmAbertoAgrupados(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (!Validacao.inteiroLongoValido(numeroContrato, 1))
                    throw new ArgumentNullException("numeroContrato");

                List<ItemContrato> itens = acesso.ObterItensEmAbertoAgrupados(numeroContrato, ref parametros);

                valorTotalItens = itens.Sum(i => i.valor);

                //Completa a transação
                transacao.Complete();

                if (itens.Count > 100)
                {
                    List<ItemContrato> itensRetorno = new List<ItemContrato>();
                    for (int i = 0; i < 100; i++)
                    {
                        itensRetorno.Add(itens[i]);
                    }

                    return itensRetorno;

                }
                return itens;
            }
        }

        public LeioutContrato ConsultarLeioutCampanhaDesconto(int idTipoContratoEmptmo)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                LeioutContrato leiout = acesso.ConsultarLeioutCampanhaDesconto(idTipoContratoEmptmo);

                transacao.Complete();
                return leiout;
            }
        }

        public void IncluirDadosCampanhaDesconto(long numeroContrato, int idItemEmptmo, double percentualDesconto, double ValorNominal, int tipoProposta, int mesAtraso, DateTime dataOperacao, double valorDesconto)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.IncluirDadosCampanhaDesconto(numeroContrato, idItemEmptmo, percentualDesconto, ValorNominal, tipoProposta, mesAtraso, dataOperacao, valorDesconto);

                transacao.Complete();
            }
        }

        public ContratoDTO BuscarDadosContratoImpressao(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                ContratoDTO contrato = acesso.BuscarDadosContratoImpressao(numeroContrato);

                transacao.Complete();

                return contrato;
            }
        }

        //SIG 48294
        public List<Contrato> BuscarContratosParaCancelamento(Contrato contrato, ref ParametrosConsulta parametros)
        {
            if (contrato == null)
                throw new ArgumentNullException("contrato");

            List<Contrato> contratos = acesso.BuscarContratosParaCancelamento(contrato, ref parametros);
            return contratos;            
        }
        //SIG 48294
        public void CancelarInscricao(long IdInscricaoContrato)
        {
             acesso.CancelarInscricao(IdInscricaoContrato);
        }
        //SIG 48294
        public void CancelarContrato(long NumeroContrato, string protocoloCRM)
        {
            acesso.CancelarContrato(NumeroContrato, protocoloCRM);
        }
        //SIG 48294
        public void CancelarConcessao(long NumeroContrato, string UsuarioSistema)
        {
             acesso.CancelarConcessao(NumeroContrato, UsuarioSistema);
        }

        //SIG 48294
        public void EstornarAtualizacaoSaldo(long NumeroContrato, string UsuarioLogado)
        {
            acesso.EstornarAtualizacaoSaldo(NumeroContrato, UsuarioLogado);
        }

        //SIG 48294
        public void EstornarConcesssao(long NumeroContrato, string UsuarioLogado)
        {
            acesso.EstornarConcesssao(NumeroContrato, UsuarioLogado);
        }

        //SIG 48294
        public void EstornarQuitacaoContratos(long NumeroContrato, string UsuarioLogado)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.EstornarQuitacaoContratos(NumeroContrato, UsuarioLogado);
                transacao.Complete();             
            }
        }

        //SIG 48294
        public void DesfazerQuitacaoContrato(long NumeroContrato)
        {
            acesso.DesfazerQuitacaoContrato(NumeroContrato);
        }

        //SIG 48294
        public void ReativarContratosQuitados(long NumeroContrato)
        {
            acesso.ReativarContratosQuitados(NumeroContrato);
        }

        //SIG 48294
        public void IncluirLogOpcao(long NumeroContrato, string UsuarioLogado)
        {
            acesso.IncluirLogOpcao(NumeroContrato, UsuarioLogado);
        }

        //SIG 48294
        public bool VerificarDocumentoBaixado(long NumeroContrato)
        {
            return acesso.VerificarDocumentoBaixado(NumeroContrato); 
        }
        public bool VerificaExistenciaPrestacoes(long NumeroContrato)
        {
            return acesso.VerificaExistenciaPrestacoes(NumeroContrato);
        }
        
        //-------------------------------------------------------------------------------
        //SIG 63057
        public void GravarContrato(long NumeroContrato, string ContratoHTML)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.GravarContrato(NumeroContrato, ContratoHTML);

                transacao.Complete();
            }
        }

        public string ObterAmbienteBancoDados()
        {
           return acesso.ObterAmbienteBancoDados();
        }
        public void AlterarItensSuspensao(HistoricoSuspensao Suspensao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.AlterarItensSuspensao(Suspensao);

                transacao.Complete();
            }
        }       

        public DateTime diaUltimaAtualizacao(long numeroContrato)
        {
            return acesso.diaUltimaAtualizacao(numeroContrato);
        }


        //William Santana - SIG 50871 - começo
        public List<ModeloContratoEmp> consultarModelosContratos(string tipocontrato, DateTime? DataInicioVigencia, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope())
            {
                return acesso.consultarModelosContratos(tipocontrato, DataInicioVigencia, ref parametros);
                transacao.Complete();
            }
        }

        public string InsAltDelModContratos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao)
        {
            using (TransactionScope transacao = new TransactionScope())
            {
                string retorno = acesso.InsAltDelModContratos(modContrato, leiaute, operacao);
                transacao.Complete();
                return retorno;
            }
        }
        //William Santana - SIG 50871 - fim

        //SIG 21529/52136
        public List<ItemContrato> obterItensEmAbertoRenegociacao(long numeroContrato, ref ParametrosConsulta parametros, ref double valorTotalItens)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                if (!Validacao.inteiroLongoValido(numeroContrato, 1))
                    throw new ArgumentNullException("numeroContrato");

                List<ItemContrato> itens = acesso.obterItensEmAberto(numeroContrato, ref parametros);

                valorTotalItens = itens.Sum(i => i.valor);

                //Completa a transação
                transacao.Complete();         

                return itens;
            }
        }

        public List<ItemContrato> ObterItensEmAbertoAgrupadosComData(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {

                List<ItemContrato> itens = acesso.ObterItensEmAbertoAgrupadosComData(numeroContrato);   

                //Completa a transação
                transacao.Complete();

                return itens;
            }
        }

        public List<ItemContrato> obterItensEmAberto(long NumeroContrato, int NumeroParcela)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {

                List<ItemContrato> itens = acesso.obterItensEmAberto(NumeroContrato, NumeroParcela);

                //Completa a transação
                transacao.Complete();

                return itens;
            }
        }

        public EmptmoDocFinanceiroDTO EnviarBoletoBancario(long NumeroContrato, int NumeroParcela, DateTime DataVencimento, int TipoMovimento)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {

                EmptmoDocFinanceiroDTO boleto = acesso.EnviarBoletoBancario(NumeroContrato, NumeroParcela, DataVencimento, TipoMovimento);
        
                transacao.Complete();

                return boleto;
            }
        }

        public string VerificarMesRefParcela(long NumeroContrato, int NumeroParcela)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {

                string boleto = acesso.VerificarMesRefParcela(NumeroContrato, NumeroParcela);

                transacao.Complete();

                return boleto;
            }
        }

        public void SalvarMinutasContratosAntigos(ModeloContratoEmp modContrato, LeioutContrato leiaute, string operacao)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.SalvarMinutasContratosAntigos(modContrato, leiaute, operacao);

                transacao.Complete();               
            }
        }

        public RelatorioContrato BuscarDadosContratosAutoAtendimento(long NumeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.BuscarDadosContratosAutoAtendimento(NumeroContrato);

                transacao.Complete();
            }
        }

        
        public List<ModeloContratoEmp> ConsultarModelosContratosSemMinuta(int IdMinutaContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.ConsultarModelosContratosSemMinuta(IdMinutaContrato);

                transacao.Complete();
            }
        }

        //WO3200
        public void CancelarBloqueioConcessao(int IdPessoa, string UsuarioResponsavel, bool RenegociacaoInadimplencia = false)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.CancelarBloqueioConcessao(IdPessoa, UsuarioResponsavel, RenegociacaoInadimplencia);
                transacao.Complete();
            }
        }

        //WO3200
        public void ExcluirEventoCobranca(long NumeroContrato, int IdTipoEventoCobranca)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                acesso.ExcluirEventoCobranca(NumeroContrato, IdTipoEventoCobranca);
                transacao.Complete();
            }
        }

        //WO3200
        public bool VerificarRenegociacaoInadP3(long NumeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.VerificarRenegociacaoInadP3(NumeroContrato);               
            }
        }

    }
}