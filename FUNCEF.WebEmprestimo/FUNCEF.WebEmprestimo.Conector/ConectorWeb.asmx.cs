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

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using FUNCEF.Planus.WebEmprestimo.Conector.ComponentesBase;

namespace FUNCEF.Planus.WebEmprestimo.Conector
{
    /// <summary>
    /// Summary description for ConectorWeb
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ConectorWeb : ServicoConectorBase
    {

        [WebMethod]
        public string obterConcessao(string matricula, string tipoContrato, string tipoSuspensao, string mesesSuspensao, string contratosAQuitar, string prazo, string chave)
        {
            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                matricula = matricula,
                idTipoContratoIN = tipoContrato,
                idTipoSuspensaoIN = tipoSuspensao,
                mesesSuspensaoIN = mesesSuspensao,
                prazoIN = prazo,
                contratosAQuitar = contratosAQuitar,
                chave = chave
            };

            return conector.obterXmlConcessao(parametros);
        }

        [WebMethod]
        public string obterSimulacao(string matricula, string tipoContrato, string tipoSuspensao, string mesesSuspensao, string contratosAQuitar, string prazo, string valorSolicitado, string chave)
        {
            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                matricula = matricula,
                idTipoContratoIN = tipoContrato,
                idTipoSuspensaoIN = tipoSuspensao,
                mesesSuspensaoIN = mesesSuspensao,
                prazoIN = prazo,
                valorSolicitadoIN = valorSolicitado,
                contratosAQuitar = contratosAQuitar,
                chave = chave
            };

            return conector.obterXmlSimulacao(parametros);
        }

        [WebMethod]
        //William Moreira da Silva - SOL 251082 - Incluido o valor numeroContrato para as concessões
        // Felipe A. Santos - SOL 258704/17636 PPM 1008709 - incluído o parametro contaBancaria
        public string incluirConcessao(string numeroContrato, string matricula, string tipoContrato, string tipoSuspensao, string mesesSuspensao, string contratosAQuitar, string prazo, string valorSolicitado, string codAutoEmprestimo, string contaBancaria, string chave)
        {
            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                numeroContrato = numeroContrato,//William Moreira da Silva - SOL 251082
                matricula = matricula,
                idTipoContratoIN = tipoContrato,
                idTipoSuspensaoIN = tipoSuspensao,
                mesesSuspensaoIN = mesesSuspensao,
                prazoIN = prazo,
                valorSolicitadoIN = valorSolicitado,
                contratosAQuitar = contratosAQuitar,
                codigoAutoEmprestimoIN = codAutoEmprestimo,
                IdcontaBancaria = contaBancaria, // Felipe A. Santos - SOL 258704/17636 PPM 1008709 
                chave = chave
            };

            return conector.obterXmlIncluirConcessao(parametros);
        }

        [WebMethod]
        public string validarConcessao(string codAutoEmprestimo, string chave)
        {
            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                codigoAutoEmprestimoIN = codAutoEmprestimo,
                chave = chave
            };

            return conector.obterXmlValidarConcessao(parametros);

        }

        [WebMethod]
        public string obterAssinatura(string matricula, string idContratoPadrao, string numeroContrato, string dataAssinatura, string chave)
        {

            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                matricula = matricula,
                idContratoPadraoIN = idContratoPadrao,
                numeroContrato = numeroContrato,
                dataAssinaturaIN = dataAssinatura,
                chave = chave
            };

            return conector.obterXmlAssinaturaPadrao(parametros);
        }

        //William Moreira da Silva - SOL 251082
        [WebMethod]
        public string obterNumContrato(string chave)
        {

            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                chave = chave
            };

            return conector.obterXmlobterNumContrato(parametros);
        }
        //William Moreira da Silva - SOL 251082

        // Felipe A. Santos SOL 258704/17636 / PPM 1008709 - início
        [WebMethod]
        public string obterContabancaria(string matricula, string chave)
        {
            GerenciadorConector conector = new GerenciadorConector();

            Parametros parametros = new Parametros()
            {
                matricula = matricula,
                chave = chave
            };

            return conector.obterXmlContabancaria(parametros);
        }
        // Felipe A. Santos SOL 258704/17636 / PPM 1008709 - fim
    }
}
