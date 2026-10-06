#region SIG 28915
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 12/12/2016 12:24:23
///
/// Descrição da Alteração:
/// Criação do arquivo
///
#endregion

using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace FUNCEF.Planus.WebEmprestimo.Web.Proxies
{
    public class ProxyAssinatura
    {
        private int totalRegistrosInterno = 0;

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<ContratoPadrao> consultarContratos()
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                return cliente.contrato.consultarContratos();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Assinatura> consultar(string matricula, string cpf, string ordenacao, int indiceLinha, int maximoLinhas, out string mensagemExcecao, out string queryString)
        {
            List<Assinatura> mutuarios = null;
            ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                string mensagemExcecaoRef = "";
                string infoMutuarioRef = "";

                if (!string.IsNullOrEmpty(cpf))
                {
                    cpf = System.Text.RegularExpressions.Regex.Replace(cpf, @"[^\d]", "");
                }

                mutuarios = cliente.contrato.consultarAssinaturas(new Mutuario()
                {
                    matricula = matricula,
                    cpf = cpf
                }, ref parametros, ref infoMutuarioRef, ref mensagemExcecaoRef);

                queryString = infoMutuarioRef;
                mensagemExcecao = mensagemExcecaoRef;
                totalRegistrosInterno = parametros.totalRegistros;

                /*
                if (!string.IsNullOrEmpty(mensagemExcecao))
                {
                    throw new Exception(mensagemExcecao);
                }
                */
            }

            return mutuarios;
        }

        public int total(string matricula, string cpf, out string mensagemExcecao, out string queryString)
        {
            mensagemExcecao = "";
            queryString = "";

            return totalRegistrosInterno;
        }
    }
}
