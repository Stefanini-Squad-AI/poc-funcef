using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.ServiceModel;
using System.Threading;
using System.Security.Principal;
using System.Collections.Generic;

using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.Componentes.ServicoWeb;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;

using FUNCEF.Planus.GlobalWeb.Web.IU;

namespace FUNCEF.Planus.WebEmprestimo.Web
{
    public partial class _Default : PaginaBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Thread.CurrentPrincipal = new GenericPrincipal(new GenericIdentity("leandro.rsouza"), new string[0] { });

            //Trace.Write("Iniciando a chamada ao cliente: " + DateTime.Now.ToString("hh:mm:ss.fff"));
            //using (Cliente<IServicoTeste> cliente = new Cliente<IServicoTeste>())
            //{
            //    int contador = 0;
            //    string forOut = null;
            //    Tipos.TipoTeste voTeste = null;

            //    List<Tipos.TipoTeste> lista = null, lista2 = null;

            //    Trace.Write("Iniciando a chamada à operação processar: " + DateTime.Now.ToString("hh:mm:ss.fff"));
            //    lista = cliente.contrato.processar();
            //    lista2 = cliente.contrato.processar(true);

            //    Trace.Write("Iniciando a chamada à operação obterValoresEmString: " + DateTime.Now.ToString("hh:mm:ss.fff"));
            //    string retorno = cliente.contrato.obterValoresEmString(ref contador);

            //    Trace.Write("Iniciando a chamada à operação obterTipoTeste: " + DateTime.Now.ToString("hh:mm:ss.fff"));
            //    //voTeste = cliente.contrato.obterTipoTeste();

            //    Trace.Write("Iniciando a chamada à operação eValido: " + DateTime.Now.ToString("hh:mm:ss.fff"));
            //    bool valido = false;
                
            //    try
            //    {
            //        valido = cliente.contrato.eValido("Leandro", out forOut);
            //    }
            //    catch (FaultException)
            //    {
            //    }

            //    Trace.Write("Iniciando a chamada à operação processarLongo: " + DateTime.Now.ToString("hh:mm:ss.fff"));
            //    //cliente.contrato.processarLongo();

            //    try
            //    {
            //        //voTeste = cliente.contrato.obterTipoTeste();
            //    }
            //    catch (FaultException<ContratoFaltaNegocio> ex2)
            //    {
                    
            //    }

            //    //Aninhad
            //    using (Cliente<IServicoTeste> cliente2 = new Cliente<IServicoTeste>())
            //    {
            //        //cliente2.contrato.processarLongo();
            //        //cliente2.contrato.processarLongo();
            //        //cliente2.contrato.processarLongo();
            //        //cliente2.contrato.processarLongo();
            //        //cliente2.contrato.processarLongo();
            //        //cliente2.contrato.processarLongo();
            //        //cliente.contrato.obterTipoTeste();
            //        cliente.contrato.obterValoresEmString(ref contador);
            //    }

            //    Trace.Write("Iniciando a chamada à operação cliente aninhado: " + DateTime.Now.ToLongTimeString());
            //}
        }
    }
}
