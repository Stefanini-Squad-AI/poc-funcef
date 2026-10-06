using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Util = FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.ComponentModel;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.GlobalWeb.Cliente;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Security.Policy;

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    /// <summary>
    /// Representa um proxy do serviço de contratos.
    /// </summary>
    public class ProxyContrato : ProxyBase
    {
        private int totalRegistrosInterno = 0;

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="nome">Nome do mutuário do contrato</param>
        /// <param name="matricula"´>Matrícula do mutuário do contrato</param>
        /// <param name="cpf">CPF do mutuário do contrato</param>
        /// <param name="ordenacao">Critério de ordenação da consulta.</param>
        /// <param name="indiceLinha">O índice da linha inicial a ser retornada.</param>
        /// <param name="maximoLinhas">O máximo de linhas a serem retornadas.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Contrato> consultarContratosAtivos(long numero, string nome, string matricula, string cpf, string instrucaoLike, string ordenacao, int indiceLinha, int maximoLinhas, string DataLimite)
        {
            matricula = UtilidadeSistema.tratarConsultaLike(matricula, int.Parse(instrucaoLike));

            List<Contrato> contratos = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);
      

            Contrato contrato = new Contrato()
            {
                numero = numero,
                mutuario = new Mutuario()
                {
                    nome = nome,
                    matricula = matricula,
                    cpf = cpf
                }
            };

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                contratos = cliente.contrato.consultarAtivos(contrato, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
                VerificarSeUsuarioLogadoMesmoContrato(ref contratos);
            }

            foreach (var ContratoInadimplente in contratos)
            {
                ContratoInadimplente.MatriculaMutuario = ContratoInadimplente.mutuario.matricula;
                if (!string.IsNullOrEmpty(DataLimite))
                    ContratoInadimplente.DataLimite = string.Format("{0:dd/MM/yyyy}", DataLimite);
            }

            return contratos;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de grupos.
        /// </summary>
        /// <param name="nome">Nome do grupo para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalContratosAtivos(long numero, string nome, string matricula, string cpf, string instrucaoLike, string DataLimite)
        {
            return this.totalRegistrosInterno;
        }

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="nome">Nome do mutuário do contrato</param>
        /// <param name="matricula">Matrícula do mutuário do contrato</param>
        /// <param name="cpf">CPF do mutuário do contrato</param>
        /// <param name="tipoSuspensao">Tipo de suspensão do contrato.</param>
        /// <param name="ordenacao">Critério de ordenação da consulta.</param>
        /// <param name="indiceLinha">O índice da linha inicial a ser retornada.</param>
        /// <param name="maximoLinhas">O máximo de linhas a serem retornadas.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Contrato> consultarContratosSuspensao(long numero, string nome, string matricula, string instrucaoLike, string cpf, int tipoSuspensao, string ordenacao, int indiceLinha, int maximoLinhas)
        {
            matricula = UtilidadeSistema.tratarConsultaLike(matricula, int.Parse(instrucaoLike));

            List<Contrato> contratos = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);
            Contrato contrato = new Contrato()
            {
                numero = numero,
                mutuario = new Mutuario()
                {
                    nome = nome,
                    matricula = matricula,
                    cpf = cpf
                },
                suspensao = new Suspensao()
                {
                    tipo = new TipoSuspensao()
                    {
                        id = tipoSuspensao
                    }
                }//,//William Moreria da Silva - SOL 220594 KTN 2053379
                //idSituacao = "A"//William Moreria da Silva - SOL 220594 KTN 2053379
                
            };

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                contratos = cliente.contrato.pesquisarContratos(contrato, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
                VerificarSeUsuarioLogadoMesmoContrato(ref contratos);
            }

            return contratos;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de grupos.
        /// </summary>
        /// <param name="nome">Nome do grupo para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalContratosSuspensao(long numero, string nome, string matricula, string cpf, int tipoSuspensao, string instrucaoLike)
        {
            return this.totalRegistrosInterno;
        }

        /// <summary>
        /// Pesquisa contratos 
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <param name="nome">Nome do mutuário do contrato</param>
        /// <param name="matricula"´>Matrícula do mutuário do contrato</param>
        /// <param name="cpf">CPF do mutuário do contrato</param>
        /// <param name="idSituacao">Situação do contrato</param>
        /// <param name="ordenacao">Critério de ordenação da consulta.</param>
        /// <param name="indiceLinha">O índice da linha inicial a ser retornada.</param>
        /// <param name="maximoLinhas">O máximo de linhas a serem retornadas.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Contrato"/> com o(s) contratos(s) encontrado(s).</returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Contrato> pesquisar(long numeroContrato, string nomeMutuario, string matricula, string cpf, string idSituacao, string instrucaoLike, string ordenacao, int maximoLinhas, int indiceLinha)
        {
            matricula = UtilidadeSistema.tratarConsultaLike(matricula, int.Parse(instrucaoLike));

            List<Contrato> contratos = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);
            Contrato contrato = new Contrato()
            {
                numero = numeroContrato,
                idSituacao = idSituacao,
                mutuario = new Mutuario()
                {
                    nome = nomeMutuario,
                    matricula = matricula,
                    cpf = cpf
                }
            };

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                contratos = cliente.contrato.pesquisarContratos(contrato, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
                VerificarSeUsuarioLogadoMesmoContrato(ref contratos);   
            }

            return contratos;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de grupos.
        /// </summary>
        /// <param name="nome">Nome do grupo para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalContratos(long numeroContrato, string nomeMutuario, string matricula, string cpf, string idSituacao, string instrucaoLike)
        {
            return this.totalRegistrosInterno;
        }

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="numero">Número do contrato</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.ItemContrato"/> com o(s) item(ns) de contrato encontrado(s).</returns>
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ItemContrato> obterItensContratoEmAberto(long numero, int indiceLinha, int maximoLinhas, string ordenacao)
        {
            List<ItemContrato> itens = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);
            double valorTotalItens = 0;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                itens = cliente.contrato.obterItensContratoEmAberto(numero, ref parametros, ref valorTotalItens);
                this.totalRegistrosInterno = parametros.totalRegistros;
            }

            return itens;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ItemContrato> ObterItensContratoEmAbertoAgrupados(long numero, int indiceLinha, int maximoLinhas, string ordenacao)
        {
            List<ItemContrato> itens = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);
            double valorTotalItens = 0;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                itens = cliente.contrato.ObterItensContratoEmAbertoAgrupados(numero, ref parametros, ref valorTotalItens);
                this.totalRegistrosInterno = parametros.totalRegistros;
            }

            return itens;
        }

        /// <summary>
        /// Consulta contratos ativos
        /// </summary>
        /// <param name="historico">Historico</param>
        /// <param name="ordenacao">Critério de ordenação da consulta.</param>
        /// <param name="indiceLinha">O índice da linha inicial a ser retornada.</param>
        /// <param name="maximoLinhas">O máximo de linhas a serem retornadas.</param>
        /// <returns>List de <see cref="FUNCEF.Planus.WebEmprestimo.Tipos.Historico"/> com o(s) histórico(s) encontrado(s).</returns>   
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Historico> consultarHistorico(Historico historico, int indiceLinha, int maximoLinhas, string ordenacao)
        {
            List<Historico> historicos = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                historicos = cliente.contrato.consultarHistorico(historico, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
            }

            return historicos;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de históricos.
        /// </summary>
        /// <param name=""></param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalHistoricos(Historico historico)
        {
            return this.totalRegistrosInterno;
        }

        public int totalItensContratoEmAberto(long numero)
        {
            return this.totalRegistrosInterno;
        }

        public List<Contrato> BuscarContratosParaCancelamento(long numeroContrato, string nomeMutuario, string matricula, string cpf, string idSituacao, string instrucaoLike, string ordenacao, int maximoLinhas, int indiceLinha)
        {
            List<Contrato> contratos = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);
            var contextoAtual = ContextoSistema.atual;

            Contrato contrato = new Contrato()
            {
                numero = numeroContrato,
                idSituacao = idSituacao,
                mutuario = new Mutuario()
                {
                    nome = nomeMutuario,
                    matricula = matricula,
                    cpf = cpf
                }
            };

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                contratos = cliente.contrato.BuscarContratosParaCancelamento(contrato, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
                VerificarSeUsuarioLogadoMesmoContrato(ref contratos);
            }

            return contratos;
        }

        public List<Serasa> BuscarContratosInclusaoSerasa(string Usuario, DateTime DataEventoCobranca, string Ordenacao, int IndiceLinha, int MaximoLinhas, int NumeroRemessa = 0)
        {
            List<Serasa> listaContratos = null;
            ParametrosConsulta parametros = new ParametrosConsulta(0, 100);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listaContratos = cliente.contrato.BuscarContratosInclusaoSerasa(NumeroRemessa, Usuario, DataEventoCobranca);
                this.totalRegistrosInterno = listaContratos.Count; //parametros.totalRegistros;
                parametros.paginacao.maximoLinhas = listaContratos.Count;
                //parametros.paginacao.indiceLinha = listaContratos.Count;
            }

            return listaContratos;
        }

        public int TotalContratosInadimplentes(int NumeroRemessa, string Usuario, DateTime DataEventoCobranca)
        {
            return this.totalRegistrosInterno;
        }

        public List<ParametrosCampanha> BuscarParametrosCampanha(DateTime? DataInicio, DateTime? DataFim, string Ordenacao, int IndiceLinha, int MaximoLinhas)
        {
            List<ParametrosCampanha> listaParametros = null;
            ParametrosConsulta parametros = new ParametrosConsulta(0, 100);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listaParametros = cliente.contrato.ObterParametrosCampanha(DataInicio, DataFim);
                this.totalRegistrosInterno = listaParametros.Count;
                parametros.paginacao.maximoLinhas = listaParametros.Count;
            }

            return listaParametros;
        }

        public int TotalParametros(DateTime? DataInicio, DateTime? DataFim)
        {
            return this.totalRegistrosInterno;
        }

        private List<Contrato> VerificarSeUsuarioLogadoMesmoContrato( ref List<Contrato> Contratos )
        {
            var contextoAtual = ContextoSistema.atual;
            Contrato contrato = new Contrato();

            //WO14158 - Consultas aos próprios contratos de empréstimo, somente poderão ser realizadas no site ou aplicativo FUNCEF
            if (contextoAtual != null)
            {
                if (Contratos.Count >= 1)
                {
                    if (contextoAtual.usuarioAtual.idPlanus == Contratos[0].mutuario.IdPessoa || contextoAtual.usuarioAtual.idPlanus == Contratos[0].mutuario.idTitular)
                    {
                        this.totalRegistrosInterno = 1;
                        Contratos = new List<Contrato>();
                        contrato.mutuario = new Mutuario() { nome = "Consultas aos próprios contratos de empréstimo, somente poderão ser realizadas no Autoatendimento ou aplicativo FUNCEF.", cpf="0" };
                        contrato.numero = 0;
                        Contratos.Add(contrato);
                    }
                }
            }
            return Contratos;
        }
    }
}
