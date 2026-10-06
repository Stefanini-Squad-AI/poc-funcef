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

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    public partial class PopupChaveMestre : PaginaSeguraComEstado
    {
        #region Propriedades

        private long idHistorico
        {
            get
            {
                string queryString = Request.QueryString["idHistorico"];                
                long id = Convert.ToInt64(queryString);
                return id;
            }
        }

        private long numeroContrato
        {
            get
            {
                string queryString = Request.QueryString["nrContrato"];
                long numero = 0;

                long.TryParse(queryString, out numero);

                return numero;
            }
        }

        private string acao
        {
            get
            {                
                string queryString = Request.QueryString["acao"];

                return queryString;          
            }
        }

        private string idSituacao
        {
            get
            {
               string queryString = Session["idSituacao"].ToString();

               return queryString;          
            }
        
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //Popup Historico
            string script = String.Format("exibirDialogo('PopupEditHistorico.aspx?nrContrato={0}&idHistorico={1}&acao={2}', 900, 520); return false;", numeroContrato, idHistorico, acao);
            BotaoIncluir.OnClientClick = script;
            BotaoAlterarHistorico.OnClientClick = script;

            if (idHistorico == 0)
            {
                BotaoExcluir.Visible = false;
                BotaoAlterarHistorico.Visible = false;
                BotaoIncluir.Visible = true;
            }
            else
            {
                ListaDropDownSituacaoContrato.Visible = false;
                BotaoAlterarSituacao.Visible = false;

                BotaoExcluir.Visible = true;
                BotaoAlterarHistorico.Visible = true;
                BotaoIncluir.Visible = false;
            }


        }

        protected void BotaoAlterarSituacao_Click(object sender, EventArgs e)
        {
            //Update Situação.

            LogContrato log = new LogContrato();
            //log.idHistorico = this.idHistorico;
            log.descricao = "Campo: FLGSITUACAO alterado de: " + idSituacao + " para " + ListaDropDownSituacaoContrato.SelectedValue;
            log.origem = Origem.consultaContratos;
            log.numeroContrato = numeroContrato;

            alterarSituacao(numeroContrato, ListaDropDownSituacaoContrato.SelectedValue);

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.incluirLog(log);
            }

            this.registrarAlerta("Situação alterada com sucesso.");
        }

        protected void BotaoIncluir_Click(object sender, EventArgs e)
        {
            
        }
                
        protected void BotaoExcluir_Click(object sender, EventArgs e)
        {
            if (idHistorico > 0)
            {
                Excluir(idHistorico);
                this.registrarAlerta("Registro exxcluido com sucesso.");
                FecharPopUp();
            }
        }

        #region Métodos de Apoio

        private void FecharPopUp()
        {
            this.ClientScript.RegisterStartupScript(GetType(), "Fechar", "fechar();", true);
        }

        private void alterarSituacao(long numeroContrato, string situacao)
        {
            SituacaoContrato SituacaoContrato = new SituacaoContrato();
            SituacaoContrato.codigo = situacao;
            
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.alterarSituacaoContrato(numeroContrato, SituacaoContrato);               
            }        
        }

        private void Excluir(long idHistorico)
        {            
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.excluir(idHistorico);
            }
        }
        #endregion


        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.contrato;
            }
        }

        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }
    }
}
