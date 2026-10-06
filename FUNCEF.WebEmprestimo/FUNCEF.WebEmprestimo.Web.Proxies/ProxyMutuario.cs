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
using FUNCEF.Planus.GlobalWeb.Cliente;

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    /// <summary>
    /// Representa um proxy do serviço de Mutuario.
    /// </summary>
    public class ProxyMutuario : ProxyBase
    {
        private int totalRegistrosInterno = 0;
        
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Mutuario> consultarMutuario(string nomeMutuario, string matricula, string cpf, string instrucaoLike, string ordenacao, int indiceLinha, int maximoLinhas)
        {
            matricula = UtilidadeSistema.tratarConsultaLike(matricula, int.Parse(instrucaoLike));

            List<Mutuario> mutuarios = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

            Mutuario mutuario = new Mutuario()
            {
                nome = nomeMutuario,
                matricula = matricula,
                cpf = cpf
            };

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                mutuarios = cliente.contrato.consultarMutuario(mutuario,ref parametros);
                this.totalRegistrosInterno = parametros.totalRegistros;
                VerificarSeUsuarioLogadoMesmoContrato(ref mutuarios);
            }

            return mutuarios;
        }

        /// <summary>
        /// Obtém o total de registros encontrados na consulta de mutuarios.
        /// </summary>
        /// <param name="nomeMutuario">Nome do mutuario para filtro.</param>
        /// <param name="matricula">Numero de matricula do mutuario para filtro.</param>
        /// <param name="cpf">Numero de CPF do mutuario para filtro.</param>
        /// <returns>Total de registros encontrados.</returns>
        public int totalMutuarios(string nomeMutuario, string matricula, string cpf, string instrucaoLike)
        {
            return this.totalRegistrosInterno;
        }

        private List<Mutuario> VerificarSeUsuarioLogadoMesmoContrato(ref List<Mutuario> Mutuarios)
        {
            var contextoAtual = ContextoSistema.atual;
            Mutuario mutuario = new Mutuario();

            //WO14158 - Consultas aos próprios contratos de empréstimo, somente poderão ser realizadas no site ou aplicativo FUNCEF
            if (contextoAtual != null)
            {
                if (Mutuarios.Count >= 1)
                {
                    if (contextoAtual.usuarioAtual.idPlanus == Mutuarios[0].IdPessoa || contextoAtual.usuarioAtual.idPlanus == Mutuarios[0].idTitular)
                    {
                        this.totalRegistrosInterno = 1;
                        Mutuarios = new List<Mutuario>();
                        mutuario = new Mutuario() { nome = "Consultas aos próprios contratos de empréstimo, somente poderão ser realizadas no Autoatendimento ou aplicativo FUNCEF.", cpf = "0",situacao= "Consultas aos próprios contratos de empréstimo, somente poderão ser realizadas no Autoatendimento ou aplicativo FUNCEF." };
                        Mutuarios.Add(mutuario);
                    }
                }
            }
            return Mutuarios;
        }
    }
}
