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
#region SOL 258704/17636 / PPM 1008709
/// - SOL 258704/17636 / PPM 1008709
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 12/08/2015
///
/// Descrição da Alteração:
/// Criação do Método ObterContaBancaria no conectorWeb.
/// 
#endregion
#region SOL 238824 / PPM 508902
///
/// Autor:
/// Fernando Francisco Xavier
///
/// Data da Alteração:
/// 09/09/2014 15:39:10
///
/// Descrição da Alteração:
/// O Sistema não diferenciava conta de credito e debito
///
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using FUNCEF.Planus.WebEmprestimo.Tipos.Estado;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.AcessoDados.Estado;
using FUNCEF.Planus.WebEmprestimo.AcessoDados;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Negocio
{
    /// <summary>
    /// Classe que representa Mutuário
    /// </summary>
    public class GerenciadorMutuario : ObjetoNegocioSistema
    {
        #region Atributos

        private IAcessoMutuario acesso = FabricaObjetos.instancia.obterAcessoMutuario();

        #endregion

        #region Consultas

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Verifica se o mutuario tem um beneficio Ativo
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <param name="idTitular"></param>
        /// <returns>Verdadeiro se o mutuario possuir beneficio ativo</returns>
        public bool verificarBeneficioAtivo(int idPessoa, int idTitular)
        {
            return acesso.verificarBeneficioAtivo(idPessoa, idTitular);
        }

        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário</param>
        /// <param name="idDadosBancario">Identificação dos dados Bancários</param>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public List<DadosBancarios> consultarContaBancaria(int idMutuario, int idDadosBancario, long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<DadosBancarios> dadosBancarios = acesso.consultarContaBancaria(idMutuario, idDadosBancario, numeroContrato);

                //Completa a transação
                transacao.Complete();

                return dadosBancarios;
            }
        }


        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - início
        /// <summary>
        /// Consulta as contas bancárias do mutuário.
        /// </summary>
        /// <param name="matricula">Número da matrícula do mutuário</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public List<DadosBancarios> consultarContaBancaria(string matricula)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<DadosBancarios> dadosBancarios = acesso.consultarContaBancaria(matricula);

                //Completa a transação
                transacao.Complete();

                return dadosBancarios;
            }
        }

        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - fim

        // Thiago Melo SOL 209377 Kintana 2021339
        /// <summary>
        /// Consulta nome do responsavel.
        /// </summary>
        /// <param name="idPessoa">Identificação do titular</param>
        /// <param name="idBenef">Identificação do mutuário</param>  
        /// <returns></returns>
        public string retornaNomeResponsavel(int idPessoa, int idBenef)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                string nomeResponsavel = acesso.retornaNomeResponsavel(idPessoa, idBenef);

                //Completa a transação
                transacao.Complete();

                return nomeResponsavel;
            }
        }
        // Thiago Melo SOL 209377 Kintana 2021339

        //BRUNO AZEVEDO - SOL 164198
        /// <summary>
        /// Consulta se o mutuário está bloqueado por plano ou não.
        /// </summary>
        public bool consultarBloqueioPlanoPrevidenciario(int idplanoprev, string idplanocontabil)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool bBloqueadoPlanoPrev = acesso.consultarBloqueioPlanoPrevidenciario(idplanoprev, idplanocontabil);

                //Completa a transação
                transacao.Complete();

                return bBloqueadoPlanoPrev;
            }
        }
        //BRUNO AZEVEDO - SOL 164198

        //BRUNO AZEVEDO - SOL 167098
        /// <summary>
        /// Consulta o código do banco da conta bancária do mutuário.
        /// </summary>
        /// <param name="idContaBancaria">Código da conta bancária.</param>
        public int consultarCodigoBanco(int idContaBancaria)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                int iIdBanco = acesso.consultarCodigoBanco(idContaBancaria);

                //Completa a transação
                transacao.Complete();

                return iIdBanco;
            }
        }
        //BRUNO AZEVEDO - SOL 167098

        /// <summary>
        /// Pesquisa as Contas da Caixa no sistema.
        /// </summary>
        /// <returns>Uma lista de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ContaCaixa"/> com os dados encontrados.</returns>
        public List<ContaCaixa> listarContaCaixa()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<ContaCaixa> listaContaCaixa = acesso.listarContaCaixa();

                //Completa a transação
                transacao.Complete();

                return listaContaCaixa;
            }
        }

        //William Moreira da Silva SOL 238689
        /// <summary>
        /// Verifica se o usuario para o qual o processo esta sendo realizado é o mesmo que esta realizando o processo
        /// </summary>
        /// <param name="idPessoa">ID da pessoa para qual o processo esta sendo realizado</param>
        /// <returns>Verdadeiro se o Usuario é o mesmo e falso se for diferente.</returns>
        public bool verificaMutuario(int idPessoa, string usuario)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.verificaMutuario(idPessoa, usuario);
            }
        }

        /// <summary>
        /// Consulta Mutuários.
        /// </summary>
        /// <param name="contrato">Mutuário a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) mutuário(s) encontrado(s).</returns>
        public List<Mutuario> consultarMutuario(Mutuario mutuario, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Mutuario> listaMutuarios = acesso.consultarMutuario(mutuario, ref parametros);

                //Completa a transação
                transacao.Complete();

                return listaMutuarios;
            }
        }

        /// <summary>
        /// Consulta Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Avalistas> listaAvalista = acesso.consultarAvalista(avalista, ref parametros);

                //Completa a transação
                transacao.Complete();

                return listaAvalista;
            }
        }

        public void obterInfoAvalista(ref Avalistas avalista)
        {
            acesso.obterInfoAvalista(ref avalista);
        }

        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarGrupoAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Avalistas> listaAvalista = acesso.consultarGrupoAvalista(avalista, ref parametros);

                //Completa a transação
                transacao.Complete();

                return listaAvalista;
            }
        }

        /// <summary>
        /// Consulta Novo Avalista.
        /// </summary>
        /// <param name="contrato">Avalista a ser filtrado</param>
        /// <param name="parametros">Parâmetros referentes a paginação e ordenação da consulta.</param>
        /// <returns>List de <see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com o(s) avalista(s) encontrado(s).</returns>
        public List<Avalistas> consultarNovoAvalista(Avalistas avalista, ref ParametrosConsulta parametros)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Avalistas> listaAvalista = acesso.consultarNovoAvalista(avalista, ref parametros);

                //Completa a transação
                transacao.Complete();

                return listaAvalista;
            }
        }

        /// <summary>
        /// Obtem Documento da pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Documento> obterDocPessoa(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Documento> docPesssoa = acesso.obterDocPessoa(idPessoa);

                //Completa a transação
                transacao.Complete();

                return docPesssoa;
            }
        }

        /// <summary>
        /// Obtem Documento.
        /// </summary>
        /// <param name="tipoPessoa">Identificação do tipo da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Documento"/> com as informações do Mutuário pesquisado.</returns>
        public List<Documento> obterDocumentos(string tipoPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Documento> listaDocumento = acesso.obterDocumentos(tipoPessoa);

                //Completa a transação
                transacao.Complete();

                return listaDocumento;
            }
        }

        //William Moreira da Silva
        /// <summary>
        /// obtem lista de Cidade
        /// </summary>
        /// <param name="idCidade">Identificador do id da cidade para filtro.</param>       
        /// <returns>Informações de estado e pais de aconrdo com a cidade</returns>
        public Cidade obterInfosCidade(int idCidade)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Cidade cidade = acesso.obterInfosCidade(idCidade);

                transacao.Complete();

                return cidade;
            }
        }

        /// <summary>
        /// Obtem UF.
        /// </summary>
        /// <param name="tipoPessoa">Identificação do tipo da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Documento"/> com as informações do Mutuário pesquisado.</returns>
        public List<UF> obterUF()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<UF> listaUF = acesso.obterUF();

                //Completa a transação
                transacao.Complete();

                return listaUF;
            }
        }

        /// <summary>
        /// Obtem Cidades.
        /// </summary>
        /// <param name="tipoPessoa">Identificação do tipo da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Documento"/> com as informações do Mutuário pesquisado.</returns>
        public List<Cidade> obterCidades()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Cidade> listaCidades = acesso.obterCidades();

                //Completa a transação
                transacao.Complete();

                return listaCidades;
            }
        }

        /// <summary>
        /// Obtem Pais.
        /// </summary>
        /// <param name="tipoPessoa">Identificação do tipo da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Documento"/> com as informações do Mutuário pesquisado.</returns>
        public List<Pais> obterPais()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Pais> listaPais = acesso.obterPais();

                //Completa a transação
                transacao.Complete();

                return listaPais;
            }
        }

        /// <summary>
        /// Obtem enderecos da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Endereco> obterEndPessoa(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Endereco> endPesssoa = acesso.obterEndPessoa(idPessoa);

                //Completa a transação
                transacao.Complete();

                return endPesssoa;
            }
        }


        /// <summary>
        /// Obtem vinculos empregaticios da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public bool verificarVinculo(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                bool vinculoPesssoa = acesso.verificarVinculo(idPessoa);

                //Completa a transação
                transacao.Complete();

                return vinculoPesssoa;
            }
        }

        /// <summary>
        /// Obtem endereco Selecionado.
        /// </summary>
        /// <param name="idPessoa">Identificação do endereco que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Endereco> obterEndSelecionado(int idEndereco)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Endereco> endSelecionado = acesso.obterEndSelecionado(idEndereco);

                //Completa a transação
                transacao.Complete();

                return endSelecionado;
            }
        }

        /// <summary>
        /// Obtem telefone Selecionado.
        /// </summary>
        /// <param name="idTelefone">Identificação do endereco que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Telefone> obterTelSelecionado(int idTelefone)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Telefone> telSelecionado = acesso.obterTelSelecionado(idTelefone);

                //Completa a transação
                transacao.Complete();

                return telSelecionado;
            }
        }

        /// <summary>
        /// Obtem contatos da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Contato> obterContPessoa(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Contato> contPesssoa = acesso.obterContPessoa(idPessoa);

                //Completa a transação
                transacao.Complete();

                return contPesssoa;
            }
        }

        /// <summary>
        /// Obtem telefone da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public List<Telefone> obterTelPessoa(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Telefone> telPesssoa = acesso.obterTelPessoa(idPessoa);

                //Completa a transação
                transacao.Complete();

                return telPesssoa;
            }
        }

        /// <summary>
        /// Obtem avalista da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Avalistas obterAvalistaPessoa(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Avalistas avalistaPesssoa = acesso.obterAvalistaPessoa(idPessoa);

                //Completa a transação
                transacao.Complete();

                return avalistaPesssoa;
            }
        }

        /// <summary>
        /// Obtem enderecos da Pessoa.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Pessoa obterInfPessoa(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Pessoa infPesssoa = acesso.obterInfPessoa(idPessoa);

                //Completa a transação
                transacao.Complete();

                return infPesssoa;
            }
        }

        /// <summary>
        /// Consultar forma de pagamento.
        /// </summary>
        /// <param name="codigo">Código da forma de pagamento.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.FormaPagamento"/> com a(s) Forma(s) de Pagamento encontrada(s).</returns>
        public List<FormaPagamento> consultarFormaPagamento(string codigo)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                return acesso.consultarFormaPagamento(codigo);
            }
        }

        #endregion

        /// <summary>
        /// Consulta contratos em aberto do mutuário
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <returns>Retorna contratos em aberto</returns>
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito) // Thiago Melo SOL 206149
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Contrato> contratos = acesso.consultarContratosEmAberto(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, dataCredito);// Thiago Melo SOL 206149

                //Completa a transação
                transacao.Complete();

                return contratos;
            }

        }

        //William Moreira da Silva - SOL 206769/14424 KTN 1999211 - INICIO - Método Sobreposto
        /// <summary>
        /// Consulta contratos em aberto do mutuário e verifica condições de concessão
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <param name="excepcional">Flag para exceção na verificação</param>
        /// <param name="idTipoContratoConcessao">Tipo do contrato da concessão</param>
        /// <param name="idCalculo">id do calculo do processo</param>
        /// <returns>Retorna contratos em aberto</returns>
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito, DateTime dataSolicitacao, bool excepcional, out List<string> listaAvisos, List<long> contratosSelecionados, int? idCalculo)// Thiago Melo SOL 206149
        {
            listaAvisos = new List<string>();
            List<Contrato> contratos = this.consultarContratosEmAberto(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, dataCredito); // Thiago Melo SOL 206149

            if (contratos.Count == 0)
                return contratos;

            //Marca contratos que serão quitados
            for (int i = 0; i < contratosSelecionados.Count; i++)
            {
                for (int x = 0; x < contratos.Count; x++)
                {
                    if (contratos[x].numero == contratosSelecionados[i])
                        contratos[x].quitar = true;
                }
            }

            GerenciadorContrato dadosContrato = new GerenciadorContrato();
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            GerenciadorTipoContrato tipoContrato = new GerenciadorTipoContrato();

            //Busca tipo do contrato da concessão
            TipoContrato tipo = tipoContrato.consultar(idTipoContrato, false);//Xavier SOL 230843

            //Se não for exceção
            if (!excepcional)
            {
                //Verifica se existem contratos do mesmo tipo em aberto e que não execeda o número máximo
                if (contratos.FindAll(c => c.tipo.id == tipo.id).Count >= tipo.maximoContrato)
                {
                    //throw new ExcecaoPlanus("Tipo de contrato em aberto impede contratação.");
                    listaAvisos.Add("Tipo de contrato em aberto impede contratação.");
                }

                if (contratos.FindAll(c => c.dataVencimento < dataSolicitacao).Sum(c => c.valorEmAberto) > 0)
                {
                    //throw new ExcecaoPlanus("Mutuário possui débitos anteriores em aberto. Não será possível conceder empréstimo para o mesmo.");
                    listaAvisos.Add("Mutuário possui débitos anteriores em aberto. Não será possível conceder empréstimo para o mesmo.");
                }
            }

            //Verifica quitação obrigatória: -1-Não existe associação, 0-Não é obrigátorio, 1-É obrigatório 
            for (int i = 0; i < contratos.Count; i++)
            {
                contratos[i].quitacaoObrigatoria = tipoContrato.consultarTipoContratoQuitacao(idTipoContrato, contratos[i].tipo.id);

                //Se o contrato possuir valor em aberto, quitação passa a ser obrigatória
                if (contratos[i].valorEmAberto > 0 && contratos[i].quitacaoObrigatoria == 0)
                {
                    contratos[i].quitacaoObrigatoria = 1;
                }
            }

            //William Moreira da Silva - SOL 243972
            //Verifica contratos a quitar
            string aviso = string.Empty;
            //if (!gerenciadorConcessao.verificarQuitacoes(contratos.FindAll(c => c.quitar == true || c.quitacaoObrigatoria == 1), out aviso))
            if (!gerenciadorConcessao.verificarQuitacoes(contratos, out aviso))
            {
                throw new ExcecaoPlanus(aviso);
                //listaAvisos.Add(aviso);
            }
            //William Moreira da Silva - SOL 243972

            //Calcula itens de quitação
            for (int i = 0; i < contratos.Count; i++)
            {
                List<ItemContrato> itens = tipoContrato.calcularItensQuitacao(contratos[i].tipo, contratos[i].numero, dataCredito, TipoOperacao.concessao, idCalculo);

                //Adiciona itens de quitação calculados no contrato
                contratos[i].itens = itens;

                //Atribui o valor do item centralizador no valor a quitar do contrato    
                ItemContrato item = itens.Find(c => c.centraliza == 1);
                if (item != null)
                {
                    contratos[i].valorAQuitar = item.valor;
                }
            }

            return contratos.FindAll(c => c.quitacaoObrigatoria != -1);

        }

        //William Moreira da Silva BarraProgresso
        /// <summary>
        /// Consulta a quantidade de itens a ser processado pela barraProgresso
        /// </summary>
        /// <returns></returns>
        public List<Contrato> consultarContratosEmabertoItens(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato)
        {
            List<Contrato> contratos = this.consultarContratosEmAberto(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, DateTime.Today);
            GerenciadorTipoContrato gerenciadorTipoContrato = new GerenciadorTipoContrato();

            if (contratos.Count == 0)
                return contratos;

            //Calcula a quantidade de itens de quitação
            for (int i = 0; i < contratos.Count; i++)
            {
                List<ItemContrato> itensContrato = gerenciadorTipoContrato.obterItens(contratos[i].tipo, TipoEvento.quitacao);
                contratos[i].itens = itensContrato;
            }
            return contratos;
        }
        //William Moreira da Silva BarraProgresso

        //William Moreira da Silva - SOL 207977
        /// <summary>
        /// Retorna a matricula do mutuario pelo o seu idpessoa
        /// </summary>
        /// <param name="idPessoa"></param>
        /// <returns>Matricula do participante</returns>
        public string obterMatricula(int idPessoa)
        {
            return acesso.obterMatricula(idPessoa);
        }

        //Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - INICIO - Método Sobreposto
        /// <summary>
        /// Consulta contratos em aberto do mutuário e verifica condições de concessão
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário</param>
        /// <param name="idTipoemprestimo">Identificador do tipo do empréstimo</param>
        /// <param name="idTipoContrato">Identificador do tipo do contrato</param>
        /// <param name="dataCredito">Data de referência do crédito</param>
        /// <param name="excepcional">Flag para exceção na verificação</param>
        /// <param name="idTipoContratoConcessao">Tipo do contrato da concessão</param>
        /// <param name="idCalculo">id do calculo do processo</param>
        /// <param name="pIsConcessao">É chamado da tela de concessão</param>
        /// <returns>Retorna contratos em aberto</returns>
        //public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito, DateTime dataSolicitacao, bool excepcional, out List<string> listaAvisos, List<long> contratosSelecionados, int? idCalculo, bool pIsConcessao)
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito, DateTime dataSolicitacao, bool excepcional, out List<string> listaAvisos, List<long> contratosSelecionados, int? idCalculo, bool pIsConcessao, bool veioConector, int? idBarra, bool CampanhaInadimplencia)// SOL 230843 //William Moreira da Silva - SOL 247419
        {
            listaAvisos = new List<string>();
            List<Contrato> contratos = this.consultarContratosEmAberto(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, dataCredito);

            GerenciadorAmortizacao gerenciadorAmortizacao = new GerenciadorAmortizacao();
            //William Moreira da Silva - SOL 249745
            GerenciadorContrato dadosContrato = new GerenciadorContrato();
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            GerenciadorTipoContrato tipoContrato = new GerenciadorTipoContrato();
            //William Moreira da Silva - SOL 249745

            if (contratos.Count == 0)
                return contratos;

            //Marca contratos que serão quitados
            for (int i = 0; i < contratosSelecionados.Count; i++)
            {
                for (int x = 0; x < contratos.Count; x++)
                {
                    if (contratos[x].numero == contratosSelecionados[i])
                        contratos[x].quitar = true;
                }
            }

            //William Moreira da Silva - SOL 249745
            TipoContrato tipo = tipoContrato.consultar(idTipoContrato, false);

            //Verifica quitação obrigatória: -1-Não existe associação, 0-Não é obrigátorio, 1-É obrigatório 
            for (int i = 0; i < contratos.Count; i++)
            {
                //Se o contrato possuir valor em aberto, quitação passa a ser obrigatória
                if (contratos[i].valorEmAberto > 0)
                {
                    contratos[i].quitacaoObrigatoria = 1;
                    if (CampanhaInadimplencia)
                        contratos[i].FlgCampanhaDescontos = 1;
                }
                else
                {
                    contratos[i].quitacaoObrigatoria = tipoContrato.consultarTipoContratoQuitacao(idTipoContrato, contratos[i].tipo.id);
                }
            }

            foreach (var contrato in contratos)
            {
                int existeAmortizacao = -1;
                DateTime dataPrevista = DateTime.Today;
                if (contrato.quitar || contrato.quitacaoObrigatoria == 1)
                {
                    existeAmortizacao = gerenciadorAmortizacao.verificarAmortizacaoExistente(contrato.numero, out dataPrevista);
                }

                if (existeAmortizacao != -1)
                {
                    throw new ExcecaoPlanus(string.Format("Existe uma amortização não efetivada para o contrato {0} com data prevista para {1}. Não será possível realizar a concessão.", contrato.numero, dataPrevista.ToShortDateString()));
                }
            }
            //William Moreira da Silva - SOL 249745
            //William Moreira da Silva - SOL 249745
            //GerenciadorContrato dadosContrato = new GerenciadorContrato();
            //GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            //GerenciadorTipoContrato tipoContrato = new GerenciadorTipoContrato();
            //William Moreira da Silva - SOL 249745


            //Busca tipo do contrato da concessão
            //William Moreira da Silva - SOL 249745
            //TipoContrato tipo = tipoContrato.consultar(idTipoContrato, false); //Xavier SOL 230843

            //Se não for exceção @TODO: Corrigir a questão do EXCEPCIONAL (criar objeto com todos os tipos de excepcionalidade)
            if (!excepcional)
            {
                //Verifica se existem contratos do mesmo tipo em aberto e que não execeda o número máximo
                if (contratos.FindAll(c => c.tipo.id == tipo.id).Count >= tipo.maximoContrato)
                {
                    //throw new ExcecaoPlanus("Tipo de contrato em aberto impede contratação.");
                    listaAvisos.Add("Tipo de contrato em aberto impede contratação.");
                }

                if (contratos.FindAll(c => c.dataVencimento < dataSolicitacao).Sum(c => c.valorEmAberto) > 0)
                {
                    //throw new ExcecaoPlanus("Mutuário possui débitos anteriores em aberto. Não será possível conceder empréstimo para o mesmo.");
                    listaAvisos.Add("Mutuário possui débitos anteriores em aberto. Não será possível conceder empréstimo para o mesmo.");
                }
            }

            //William Moreira da Silva - SOL 249745
            ////Verifica quitação obrigatória: -1-Não existe associação, 0-Não é obrigátorio, 1-É obrigatório 
            //for (int i = 0; i < contratos.Count; i++)
            //{
            //    contratos[i].quitacaoObrigatoria = tipoContrato.consultarTipoContratoQuitacao(idTipoContrato, contratos[i].tipo.id);


            //    //Se o contrato possuir valor em aberto, quitação passa a ser obrigatória
            //    if (contratos[i].valorEmAberto > 0 && contratos[i].quitacaoObrigatoria == 0)
            //    {
            //        contratos[i].quitacaoObrigatoria = 1;
            //    }
            //}
            //William Moreira da Silva - SOL 249745

            //Verifica contratos a quitar
            string aviso = string.Empty;
            //William Moreira da Silva - SOL 243972
            //if (!gerenciadorConcessao.verificarQuitacoes(contratos.FindAll(c => c.quitar == true || c.quitacaoObrigatoria == 1), out aviso))
            if (!gerenciadorConcessao.verificarQuitacoes(contratos, out aviso))
            {
                throw new ExcecaoPlanus(aviso);
                //listaAvisos.Add(aviso);
            }
            //William Moreira da Silva - SOL 243972

            //Calcula itens de quitação
            for (int i = 0; i < contratos.Count; i++)
            {
                contratos[i].tipo.veioConector = veioConector;// SOL 230843
                //Campanha Desconto
                List<ItemContrato> itens = tipoContrato.calcularItensQuitacao(contratos[i].tipo, contratos[i].numero, dataCredito, TipoOperacao.concessao, idCalculo, pIsConcessao, idBarra, "rocha", CampanhaInadimplencia);//William Moreira da Silva - SOL 247419
                //Adiciona itens de quitação calculados no contrato
                contratos[i].itens = itens;

                //Atribui o valor do item centralizador no valor a quitar do contrato    
                ItemContrato item = itens.Find(c => c.centraliza == 1);
                if (item != null)
                {
                    contratos[i].valorAQuitar = item.valor;
                }

                //Soma os valores de desconto e atribui ao valor de desconto
                contratos[i].valorDesconto = itens.FindAll(x => x.flgCampanhaDesconto).Sum(y => y.valor);
            }

            return contratos.FindAll(c => c.quitacaoObrigatoria != -1);

        }
        ////Marcio Sanches Spinosa - SOL 209974 KTN 2024435 - FIM

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
        public List<Contrato> consultarContratosEmAberto(int idMutuario, int idTitular, int idTipoEmprestimo, int idTipoContrato, DateTime dataCredito, DateTime dataSolicitacao, bool excepcional, out List<string> listaAvisos, List<long> contratosSelecionados) // Thiago Melo SOL 206149
        {

            //using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            //{

            listaAvisos = new List<string>();
            List<Contrato> contratos = this.consultarContratosEmAberto(idMutuario, idTitular, idTipoEmprestimo, idTipoContrato, dataCredito);// Thiago Melo SOL 206149

            if (contratos.Count == 0)
                return contratos;

            //Marca contratos que serão quitados
            for (int i = 0; i < contratosSelecionados.Count; i++)
            {
                for (int x = 0; x < contratos.Count; x++)
                {
                    if (contratos[x].numero == contratosSelecionados[i])
                        contratos[x].quitar = true;
                }
            }

            GerenciadorContrato dadosContrato = new GerenciadorContrato();
            GerenciadorConcessao gerenciadorConcessao = new GerenciadorConcessao();
            GerenciadorTipoContrato tipoContrato = new GerenciadorTipoContrato();

            //Busca tipo do contrato da concessão
            TipoContrato tipo = tipoContrato.consultar(idTipoContrato, false); //Xavier SOL 230843

            //Se não for exceção
            if (!excepcional)
            {
                //Verifica se existem contratos do mesmo tipo em aberto e que não execeda o número máximo
                if (contratos.FindAll(c => c.tipo.id == tipo.id).Count >= tipo.maximoContrato)
                {
                    //throw new ExcecaoPlanus("Tipo de contrato em aberto impede contratação.");
                    listaAvisos.Add("Tipo de contrato em aberto impede contratação.");
                }

                if (contratos.FindAll(c => c.dataVencimento < dataSolicitacao).Sum(c => c.valorEmAberto) > 0)
                {
                    //throw new ExcecaoPlanus("Mutuário possui débitos anteriores em aberto. Não será possível conceder empréstimo para o mesmo.");
                    listaAvisos.Add("Mutuário possui débitos anteriores em aberto. Não será possível conceder empréstimo para o mesmo.");
                }
            }


            //Verifica quitação obrigatória: -1-Não existe associação, 0-Não é obrigátorio, 1-É obrigatório 
            for (int i = 0; i < contratos.Count; i++)
            {
                contratos[i].quitacaoObrigatoria = tipoContrato.consultarTipoContratoQuitacao(idTipoContrato, contratos[i].tipo.id);

                //Se o contrato possuir valor em aberto, quitação passa a ser obrigatória
                if (contratos[i].valorEmAberto > 0 && contratos[i].quitacaoObrigatoria == 0)
                {
                    contratos[i].quitacaoObrigatoria = 1;
                }
            }

            //William Moreira da Silva - SOL 243972
            //Verifica contratos a quitar
            string aviso = string.Empty;
            //if (!gerenciadorConcessao.verificarQuitacoes(contratos.FindAll(c => c.quitar == true || c.quitacaoObrigatoria == 1), out aviso))
            if (!gerenciadorConcessao.verificarQuitacoes(contratos, out aviso))
            {
                throw new ExcecaoPlanus(aviso);
                //listaAvisos.Add(aviso);
            }
            //William Moreira da Silva - SOL 243972

            //Calcula itens de quitação
            for (int i = 0; i < contratos.Count; i++)
            {                                                                                                                                               //SIG 67808 - Matias
                List<ItemContrato> itens = tipoContrato.calcularItensQuitacao(contratos[i].tipo, contratos[i].numero, dataCredito, TipoOperacao.concessao, false);

                //Adiciona itens de quitação calculados no contrato
                contratos[i].itens = itens;

                //Atribui o valor do item centralizador no valor a quitar do contrato    
                ItemContrato item = itens.Find(c => c.centraliza == 1);
                if (item != null)
                {
                    contratos[i].valorAQuitar = item.valor;
                }

            }

            //transacao.Complete();

            return contratos.FindAll(c => c.quitacaoObrigatoria != -1);
            //}

        }

        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancaria(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DadosBancarios dadosBancarios = acesso.consultarContaBancaria(numeroContrato);

                //Completa a transação
                transacao.Complete();

                return dadosBancarios;
            }
        }

        // Fernando Francisco Xavier - SOL 238824 PPM 508902
        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="numeroContrato">Número de contrato.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancariaDebito(long numeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DadosBancarios dadosBancarios = acesso.consultarContaBancariaDebito(numeroContrato);

                //Completa a transação
                transacao.Complete();

                return dadosBancarios;
            }
        }
        // Fernando Francisco Xavier - SOL 238824 PPM 508902

        /// <summary>
        /// Verificar a existência de beneficiários do seguro.
        /// 
        /// Parâmetros: 	idInscricaoEmptmo,
        /// 		idBenefSeguro
        /// 
        /// Executa consulta passando parâmetros:
        /// 
        /// SELECT		CBS.NOME,
        /// 	        	CBS.PERCINDENIZACAO,
        /// 		CBS.NUMBANCO,
        /// 		CBS.CODAGENCIA,
        /// 		CBS.CONTACORRENTE,
        /// 		CBS.OBS
        ///  FROM   	CONTRATOXBENEFSEG CBS
        ///  WHERE   	CBS.IDINSCRICAOEMPTMO = :<b>idInscricaoEmpto</b>
        ///  AND     		CBS.IDBENEFSEGURO = :<b>idBenefSeguro</b>
        /// 
        /// Retorna dados.
        /// </summary>
        /// <param name="idInscricaoEmptmo">Número da inscrição previdênciária do
        /// mutuário</param>
        /// <param name="idBenefSeguro">Beneficiário do Seguro</param>
        public List<Beneficiario> consultarBeneficiario(int idInscricaoEmptmo, int idBenefSeguro)
        {

            return null;
        }

        /// <summary>
        /// Executa consulta passando o parâmetro :codigo
        /// 
        /// SELECT PF.CODPORTFORMA,
        /// PF.DESCRICAO,
        /// PAR.PORTFORMAPAGTO
        /// FROM   PORTADORFORMA PF, PARAMEMPTMO PAR
        /// WHERE  PF.CODPORTFORMA = PAR.PORTFORMAPAGTO (+)
        /// AND    PF.IDPESSOA = 1
        /// AND    PF.RECPAG = :codigo
        /// AND    NVL(PF.FLGATIVO,'S') = 'S'
        /// AND    (NOT EXISTS( SELECT *
        ///                    FROM   PORTFORMAXMODULO PFM,
        ///                           PORTADORFORMA PFO
        ///                    WHERE  PFM.CODPORTFORMA = PFO.CODPORTFORMA
        ///                    AND    PFO.RECPAG = :codigo )
        ///        OR  EXISTS( SELECT *
        ///                    FROM   PORTFORMAXMODULO
        ///                    WHERE  CODPORTFORMA = PF.CODPORTFORMA ) )
        /// ORDER BY PF.DESCRICAO
        /// 
        /// Retorna dados.
        /// </summary>
        /// <param name="codigo">R - Recebimento
        /// P - Pagamento</param>
        public void consultarContaCaixa(string codigo)
        {

        }

        /// <summary>
        /// Lista tipo de recurso.
        /// </summary>
        public List<TipoRecurso> listarTipoRecurso()
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<TipoRecurso> tiposRecurso = acesso.listarTipoRecurso();

                //Completa a transação
                transacao.Complete();

                return tiposRecurso;
            }
        }

        /// <summary>
        /// Obtem dados do Mutuario.
        /// </summary>
        /// <param name="idPessoa">Identificação da pessoa que sera usada como filtro.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Mutuario"/> com as informações do Mutuário pesquisado.</returns>
        public Mutuario obterDadosMutuario(string matricula) // Thiago Melo SOL 206149
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Mutuario mutuario = acesso.obterDadosMutuario(matricula);// Thiago Melo SOL 206149

                //Completa a transação
                transacao.Complete();

                return mutuario;
            }
        }

        /// <summary>
        /// Verifica se o mutuário tem uma assinatura.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <param name="idTipoContrato">Identificador do tipo de contraro para filtro.</param>
        /// <returns>Validade da assinatura.</returns>

        public bool verificarAssinatura(int idTitular, int idMutuario, int idTipoContrato, int? flgtrataassinat, out List<string> listaAvisos)// Thiago Melo SOL 204452 KTN 1976411
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                listaAvisos = new List<string>();
                Assinatura dadosAssinatura = acesso.verificarAssinatura(idTitular, idMutuario, idTipoContrato);// Thiago Melo SOL 204452 KTN 1976411

                if (dadosAssinatura != null)
                {
                    // Thiago Melo SOL 204452 KTN 1976411
                    if (flgtrataassinat == 1 || flgtrataassinat == null)
                    {
                        if (!dadosAssinatura.flagBloqueio.Equals(0))                                         
                            throw new ExcecaoPlanus("'Mutuário(a) está com concessão BLOQUEADA!', 'Empréstimo");

                        //listaAvisos.Add("Mutuário está com a assinatura Bloqueada.");                       
                        //if (DateTime.Now.CompareTo(dadosAssinatura.dataInicio) < 0)
                        //    throw new ExcecaoPlanus("Mutuário está com a assinatura Bloqueada.");
                        ////listaAvisos.Add("Mutuário está com a assinatura Bloqueada.");                            
                    }
                    // Thiago Melo SOL 204452 KTN 1976411                  
                }
                else
                    throw new ExcecaoPlanus("Mutuário necessita de nova assinatura de contrato.");
                //listaAvisos.Add("Mutuário necessita de nova assinatura de contrato.");

                //Completa a transação
                transacao.Complete();

                return (listaAvisos.Count == 0);
            }
        }
        // Thiago Melo SOL 204452 KTN 1976411

        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        public bool consultarOutrasDividas(int idMutuario, out string aviso)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                aviso = String.Empty;
                List<OutrasDividas> listaOutrasDividas = acesso.consultarOutrasDividas(idMutuario);

                //if (listaOutrasDividas.Count == 0 || listaOutrasDividas.Sum(t1 => t1.valorCalculado) == 0)
                //{
                transacao.Complete();
                return false;
                //}
                //else
                //{
                //    string tipo = (from divida in listaOutrasDividas where divida.valorCalculado > 0 select divida).First().tipo;
                //    transacao.Complete();
                //    throw new ExcecaoPlanus("Mutuário possui dívidas de " + tipo + ". Não será possível conceder Empréstimo para o mesmo.");
                //aviso = "Mutuário possui dívidas de " + tipo + ". Não será possível conceder Empréstimo para o mesmo.";
                //}

            }
        }

        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        public List<OutrasDividas> obterOutrasDividas(int idMutuario)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<OutrasDividas> listaOutrasDividas = acesso.consultarOutrasDividas(idMutuario);

                transacao.Complete();
                return listaOutrasDividas;
            }
        }

        // SOL 199759
        /// <summary>
        /// Verifica se mutuário possui outras dividas.
        /// </summary>
        /// <param name="idMutuario">Identificador do mutuário para filtro.</param>
        /// <returns></returns>
        public List<Avalistas> obterAvalistas(long idInscricaoEmptmo)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<Avalistas> listaAvalistas = acesso.consultarAvalistas(idInscricaoEmptmo);

                transacao.Complete();
                return listaAvalistas;
            }
        }
        // SOL 199759

        /// <summary>
        /// Verifica a atualização diaria do mutuário.
        /// </summary>
        /// <param name="idMutuario">Identificação do mutuário.</param>
        /// <param name="dataCredito">Data de Crédito.</param>
        /// <returns>Caso existe atualização.</returns>
        public bool verificarAtualizacaoDiaria(int idMutuario, DateTime dataCredito, out string aviso)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                aviso = String.Empty;
                bool atualizacaoDiaria = acesso.verificarAtualizacaoDiaria(idMutuario, dataCredito);

                if (atualizacaoDiaria)
                    //throw new ExcecaoPlanus("Mutuário não possui atualização diária para o dia " + dataCredito.ToString("dd/MM/yyyy") + ".");
                    aviso = "Mutuário não possui atualização diária para o dia " + dataCredito.ToString("dd/MM/yyyy") + ".";

                transacao.Complete();

                return atualizacaoDiaria;
            }
        }

        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>;.
        /// <param name="idMutuario">Identificador do Mutuário</param>
        public List<ItemContrato> obterItensEmAberto(long idContratoEmptmo)//NILTON - SOL201249 KTN1945208 - 22/02/2013
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                List<ItemContrato> itens = acesso.obterItensEmAberto(idContratoEmptmo);

                //Completa a transação
                transacao.Complete();

                return itens;
            }
        }

        //Petri Nocentini SOL 143476/16437 PPM 491462
        /// <summary>
        /// Busca os dados do contrato a ser impresso.
        /// </summary>
        /// <param name="idPessoa">ID da Pessoa.</param>
        /// <returns>Dictionary com as informações do contrato a ser impresso.</returns>
        public RelatorioContrato buscaInfoImpressaoContrato(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                RelatorioContrato infoContrato = acesso.buscaInfoImpressaoContrato(idPessoa);

                //Completa a transação
                transacao.Complete();

                return infoContrato;
            }
        }

        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Inicio
        /// <summary>
        /// Consulta a conta bancária do mutuário.
        /// </summary>
        /// <param name="PIdCBancaria">Id Conta Bancária.</param>
        /// <returns><see cref="FUNCEF.Planus.WebEmprestimo.Tipos.DadosBancarios"/> com os dados encontrados.</returns>
        public DadosBancarios consultarContaBancariaOperacao(int PIdCBancaria)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                DadosBancarios dadosBancarios = acesso.consultarContaBancariaOperacao(PIdCBancaria);

                //Completa a transação
                transacao.Complete();

                return dadosBancarios;
            }
        }
        //Marcio Sanches Spinosa SOL 201765 Kintana 2006964 - Fim

        /// <summary>
        /// Busca informações de falecimento de um mutuário
        /// </summary>
        /// <param name="idPessoa">Identificador do mutuário</param>
        /// <returns>Retorna Dictionary com as informações de falecimento de um mutuário</returns>
        //Saulo / FUNCEF
        public Dictionary<string, object> buscaInfoFalecimento(int idPessoa)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Dictionary<string, object> infoFalecimento = acesso.buscaInfoFalecimento(idPessoa);

                //Completa a transação
                transacao.Complete();

                return infoFalecimento;
            }
        }

        /// <summary>
        /// Busca os dados do mutuário do contrato.
        /// </summary>
        /// <param name="numContrato">Identificador do contrato.</param>
        /// <returns>Dictionary com as informações do mutuário do contrato pesquisado.</returns>
        public Dictionary<string, object> buscaInfoMutuario(long numContrato)
        {
            using (TransactionScope transacao = new TransactionScope(TransactionScopeOption.Suppress))
            {
                Dictionary<string, object> infoMutuario = acesso.buscaInfoMutuario(numContrato);

                //Completa a transação
                transacao.Complete();

                return infoMutuario;
            }
        }

        //SIG 48294
        public Assinatura ObterAssinaturaContrato(int idTitular, int idMutuario, int idTipoContrato)
        {
            Assinatura assinatura = new Assinatura();

            if (assinatura != null)
            {
                assinatura = acesso.verificarAssinatura(idTitular, idMutuario, idTipoContrato);
            }

            return assinatura;
        }
    
        //William Santana - SIG 50871 - início
        /// <summary>
        /// Obtem items em aberto de contrato do mutuário.
        /// </summary>
        /// <param name="ptipoContrato">ID do tipo de contrato</param>
        /// <param name="dataRef">Data da assinatura</param>
        public RelatorioContrato buscaInfoTaxas(string ptipoContrato, DateTime dataRef)
        {            
            using (TransactionScope transacao = new TransactionScope())
            {
                RelatorioContrato infoContrato = acesso.buscaInfoTaxas(ptipoContrato, dataRef);
                
                //Completa a transação
                transacao.Complete();

                return infoContrato;
            }           
        }
        //William Santana - SIG 50871 - fim

        

        public RelatorioContrato buscaInfoImpressaoEmprestimoSemContrato(long NumeroContrato)
        {
            using (TransactionScope transacao = new TransactionScope())
            {
                RelatorioContrato infoContrato = acesso.buscaInfoImpressaoEmprestimoSemContrato(NumeroContrato);

                //Completa a transação
                transacao.Complete();

                return infoContrato;
            }
        }
    }
}