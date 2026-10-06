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

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    /// <summary>
    /// Representa um proxy do serviço de Avalista.
    /// </summary>
    public class ProxyAvalista : ProxyBase
    {
        private int totalRegistrosInterno = 0;
        
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Avalistas> consultarAvalista(string nomeAvalista, string razaoSocial, String cpf, string instrucaoLike, string ordenacao, int indiceLinha, int maximoLinhas)
        {
            razaoSocial = UtilidadeSistema.tratarConsultaLike(razaoSocial, int.Parse(instrucaoLike));

            List<Avalistas> avalistas = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

            Avalistas avalista = new Avalistas()
            {                
                nome = nomeAvalista,
                razaoSocial = razaoSocial,
                cpf    = cpf,
                
            };

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                avalistas = cliente.contrato.consultarAvalista(avalista,ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
            }

            return avalistas;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de mutuarios.
        /// </summary>
        /// <param name="nomeMutuario">Nome do mutuario para filtro.</param>
        /// <param name="matricula">Numero de matricula do mutuario para filtro.</param>
        /// <param name="cpf">Numero de CPF do mutuario para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalAvalista(string nomeAvalista, string razaoSocial, Int64 cpf, string instrucaoLike)
        {
            return this.totalRegistrosInterno;
        }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Avalistas> consultarGrupoAvalista(string nomeAvalista, string razaoSocial, String cpf, string instrucaoLike, string ordenacao, int indiceLinha, int maximoLinhas)
        {
            razaoSocial = UtilidadeSistema.tratarConsultaLike(razaoSocial, int.Parse(instrucaoLike));

            List<Avalistas> novoAvalistas = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

            Avalistas avalista = new Avalistas()
            {
                nome = nomeAvalista,
                razaoSocial = razaoSocial,
                cpf = cpf,

            };

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                novoAvalistas = cliente.contrato.consultarGrupoAvalista(avalista, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
            }

            return novoAvalistas;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de mutuarios.
        /// </summary>
        /// <param name="nomeMutuario">Nome do mutuario para filtro.</param>
        /// <param name="matricula">Numero de matricula do mutuario para filtro.</param>
        /// <param name="cpf">Numero de CPF do mutuario para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalGrupoAvalista(string nomeAvalista, string razaoSocial, Int64 cpf, string instrucaoLike)
        {
            return this.totalRegistrosInterno;
        }



        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Avalistas> consultarNovoAvalista(string nomeAvalista, string razaoSocial, string cpf, string instrucaoLike, string ordenacao, int indiceLinha, int maximoLinhas)
        {
            razaoSocial = UtilidadeSistema.tratarConsultaLike(razaoSocial, int.Parse(instrucaoLike));

            List<Avalistas> novoAvalistas = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

            Avalistas avalista = new Avalistas()
            {
                nome = nomeAvalista,
                razaoSocial = razaoSocial,
                cpf = cpf,

            };

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                novoAvalistas = cliente.contrato.consultarNovoAvalista(avalista, ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
            }

            return novoAvalistas;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de mutuarios.
        /// </summary>
        /// <param name="nomeMutuario">Nome do mutuario para filtro.</param>
        /// <param name="matricula">Numero de matricula do mutuario para filtro.</param>
        /// <param name="cpf">Numero de CPF do mutuario para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalNovoAvalista(string nomeAvalista, string razaoSocial, Int64 cpf, string instrucaoLike)
        {
            return this.totalRegistrosInterno;
        }


    }
}
