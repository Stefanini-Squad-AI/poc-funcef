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
    public partial class PopupInputRegra : PaginaSeguraComEstado
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                retornaRegra();
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
            //Regra 25206
            if (!string.IsNullOrEmpty(caixaNumericaValorDivida.Text))
                Session["ValorDivida"] = caixaNumericaValorDivida.Text;
            else
                Session["ValorDivida"] = 0;

            //Regra 24766
            if (!string.IsNullOrEmpty(caixaNumericaValorAmortizacao.Text))
                Session["ValorAmortizacao"] = caixaNumericaValorAmortizacao.Text;
            else
                Session["ValorAmortizacao"] = 0;

            //Regra 24768
            if (!string.IsNullOrEmpty(caixaNumericaValorQuitacao.Text))
                Session["ValorQuitacao"] = caixaNumericaValorQuitacao.Text;
            else
                Session["ValorQuitacao"] = 0;

            //William Santana - SOL 235732
            if ((divValorquitacao.Visible) && (Convert.ToDouble(Session["ValorQuitacao"]) == 0)) {
               divValorquitacao.Visible = false;
               divValorAmortizacao.Visible = true;               
            }
            else {
            //William Santana - SOL 235732
                FecharPopUp();
            }
        }

        private void FecharPopUp()
        {
            this.ClientScript.RegisterStartupScript(GetType(), "Fechar", "fechar();", true);
        }

        public void retornaRegra()
        {
            string queryString = Request.QueryString["listaRegras"];
            int regra = 0;

            //William Moreira da Silva - SOL 235732
            //divValorAmortizacao.Visible = false;
            //divValorDivida.Visible = false;
            //divValorquitacao.Visible = false;

            string[] lines = queryString.Split('|');

            foreach (string line in lines)
            {

                if (!string.IsNullOrEmpty(line.ToString()))
                {
                    regra = int.Parse(line.ToString());

                    if (regra == 25206)
                    {
                        divValorDivida.Visible = true;
                    }

                    if (regra == 24766)
                    {
                        divValorAmortizacao.Visible = true;
                    }

                    if (regra == 24768)
                    {
                        divValorquitacao.Visible = true;
                    }
                }
            }

        }


    }
}
