using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using FUNCEF.Planus.GlobalWeb.Web.IU;

using System.ComponentModel;
using FUNCEF.Planus.Componentes.Web;
using System.Collections.Generic;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;

using System.Text.RegularExpressions;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    public partial class PopupAvalista : PaginaSeguraComEstado
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Int32 idAvalissta = this.idPessoa;
                double margem = this.margem;
                string mensagem = "";
                string script = "";

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    Avalistas avalista = cliente.contrato.consultarAvalistaPessoa(this.idPessoa);
                    Avalistas avalistaConjuge = null;
                    if (idConjuge != 0)
                    {
                        avalista.eConjuge = true;
                        avalistaConjuge = cliente.contrato.consultarAvalistaPessoa(this.idConjuge);

                        avalista.nomeConjugue = avalistaConjuge.nome;
                    }
                    List<Avalistas> avalistas = new List<Avalistas>();
                    if (Session["Avalista"] != null)
                    {
                        avalistas = (List<Avalistas>)Session["Avalista"];
                        //William Moreira da Silva - SOL 143476/16437
                        if (avalistaConjuge != null)
                        {
                            avalistaConjuge.nomeConjugue = avalista.nome;
                         
                            avalista.idConjugue = avalistaConjuge.id;
                            avalistaConjuge.idConjugue = avalista.id;

                            avalistas.RemoveAll(t1 => t1.id == avalistaConjuge.id);
                            
                            avalistas.Add(avalistaConjuge);
                            avalistas.Add(avalista);
                        }
                        //William Moreira da Silva - SOL 143476/16437
                        else
                        {
                            avalistas.Add(avalista);
                        }
                        Session["Avalista"] = avalistas;
                    }
                    else
                    {
                        avalistas.Add(avalista);
                        Session["Avalista"] = avalistas;
                    }
                }

                mensagem = "Avalista incluido com sucesso.";

                script = string.Format("fecharRetorno('{0}');", mensagem);

                this.registrarScript("retornoMensagem", script);
            }
        }

        private Int32 idPessoa
        {
            get
            {
                string queryString = Request.QueryString["id"];
                Int32 numero = 0;

                Int32.TryParse(queryString, out numero);

                return numero;
            }
        }

        //William Moreira da Silva - SOL 143476/16437
        private Int32 idConjuge
        {
            get
            {
                string queryString = Request.QueryString["conjuge"];
                int numero = 0;

                int.TryParse(queryString, out numero);

                return numero;
            }
        }
        //William Moreira da Silva - SOL 143476/16437

        private double margem
        {
            get
            {
                string queryString = Request.QueryString["margem"];
                double numero = 0;

                double.TryParse(queryString, out numero);

                return numero;
            }
        }

        private void incluirAvalista(Int32 idAvalista, long inscricaoPrevidenviaria)
        {
            //Xavier            
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.incluirAvalista(idAvalista, inscricaoPrevidenviaria);
            }
        }

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.emprestimo;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                //return PermissoesSistema.incluir.ToString();
                return PermissoesSistema.consultar.ToString();//William Moreira da Silva - SOL 205807 KTN 1989865
            }
        }

        protected void botaoOk_Click(object sender, EventArgs e)
        {

            FecharPopUp();
        }

        private void FecharPopUp()
        {
            this.ClientScript.RegisterStartupScript(GetType(), "Fechar", "fechar();", true);
        }
    }
}
