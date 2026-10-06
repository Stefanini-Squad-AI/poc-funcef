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
//using FUNCEF.GlobalWeb.Tipos;

using System.ComponentModel;
//using FUNCEF.GlobalWeb.Tipos.Seguranca;
//using FUNCEF.Planus.GlobalWeb.Web.Componentes;
using FUNCEF.Planus.Componentes.Web;
//using FUNCEF.GlobalWeb.Servicos;
using System.Collections.Generic;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    public partial class PopUpImpressaoContratos : PaginaSegura
    {
        private long NumeroContrato
        {
            get
            {
                if (Request.QueryString["NumeroContrato"] != null)
                    return long.Parse(Request.QueryString["NumeroContrato"]);
                else
                    return 0L;
            }
        }

        private string guidImpressao
        {
            get
            {
                string queryString = Request.QueryString["guidImpressao"];

                return queryString;
            }
        }

        private RelatorioContrato relatorio
        {
            get
            {
                if (this.ViewState["relatorio"] != null)
                    return (RelatorioContrato)this.ViewState["relatorio"];
                else
                    return new RelatorioContrato();
            }

            set
            {
                this.ViewState["relatorio"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                relatorio = (RelatorioContrato)this.proxyEstado.obterEstado(this.guidImpressao);
            }
        }

        protected void BotaoImprimir_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(DataInicial.Text))
            {
                relatorio.DataInicioVigencia = DataInicial.valorData;


                string guid = Guid.NewGuid().ToString();
                this.proxyEstado.manterEstadoSincrono(guid, relatorio);

                //Abrir o form em um popup
                String strurl = String.Format("../../CicloNormal/Emprestimo/PopupImpressaoContrato.aspx?guidImpressao={0}", guid);

                //abrir a janela com a função exibirDialogo bem como showModalDialog não permite a impressao do contrato em pdf                   
                string strscript = "window.open('" + strurl + "', 'name','height=680,width=920,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "popup para impressao de contrato", strscript, true);

                //Session["DataInicioVigencia"] = DataInicial.Text;
                FecharPopUp();
            }
        }

        protected void botaoVoltar_Click(object sender, EventArgs e)
        {
            //Session["DataInicioVigencia"] = "";
            FecharPopUp();
        }

        private void FecharPopUp()
        {
            this.ClientScript.RegisterStartupScript(GetType(), "Fechar", "fechar();", true);
        }

        protected void ImprimirContratoAntigo()
        {
            try
            {
                int Porcentagem = 0;
                int itemAtual = 0;
                int totalItens = 0;
                int regraAtual = 0;
                int totalRegras = 0;

                ObjetoContrato Contrato = new ObjetoContrato(this.NumeroContrato);

                if (!Contrato.internet)
                {
                    this.registrarAlerta("O contrato não poderá ser gerado, pois não foi concedido por meio do sistema Auto Atendimento.");
                    return;
                }

                DadosBancarios dadosBancarios = null;

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    dadosBancarios = cliente.contrato.consultarContaBancaria(this.NumeroContrato);
                }

                if (dadosBancarios != null)
                {
                    //labelBancoCredito.Text = dadosBancarios.nomeBanco;
                    //labelAgenciaCredito.Text = dadosBancarios.agencia;
                    //labelContaCorrenteCredito.Text = dadosBancarios.contaCorrente;                    
                }

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    relatorio = cliente.contrato.buscaInfoImpressaoContrato(Contrato.mutuario.id);
                    Porcentagem = 50;

                    //Campanha Desconto
                    using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
                    {
                        relatorio.tipoContrato = client.contrato.ConsultarTipoContrato(Contrato.idTipoContratoEmpto);
                    }

                    relatorio.mutuario = Contrato.mutuario;
                    relatorio.conta = new DadosBancarios() { id = dadosBancarios.id };
                    relatorio.valorMaximo = Contrato.valorMaximo;
                    relatorio.prazo = Contrato.totalParcelas;
                    relatorio.valorSolicitado = (double)Contrato.valorContrato;
                    relatorio.DataCredito = (DateTime)Contrato.dataCredito;
                    relatorio.dataAssinatura = (DateTime)Contrato.dataAssinatura;
                    relatorio.conta = cliente.contrato.consultarContaBancaria(0, relatorio.conta.id, 0)[0];
                    relatorio.fiadores = new Avalistas[] { new Avalistas() { id = 0 }, new Avalistas() { id = 0 } };

                    if (string.IsNullOrEmpty(Session["DataInicioVigencia"].ToString()))
                        return;

                    relatorio.DataInicioVigencia = Convert.ToDateTime(Session["DataInicioVigencia"]);

                    relatorio.ContratoAntigoSemMinuta = true; // SIG 129005 - Identifica na impressão que a chamada da impressão parte daqui e não há minuta gravada na base
                    string guid = Guid.NewGuid().ToString();
                    this.proxyEstado.manterEstadoSincrono(guid, relatorio);

                    //Abrir o form em um popup
                    String strurl = String.Format("../../CicloNormal/Emprestimo/PopupImpressaoContrato.aspx?guidImpressao={0}", guid);


                    //abrir a janela com a função exibirDialogo bem como showModalDialog não permite a impressao do contrato em pdf                   
                    string strscript = "window.open('" + strurl + "', 'name','height=680,width=920,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "popup para impressao de contrato", strscript, true);
                }
            }
            catch (Exception ex)
            {
                throw new Planus.Componentes.ExcecaoPlanus(ex.Message);
            }
            finally
            {
                //Porcentagem = 100;
            }
        }

        #region Contexto da Página / Permissões

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.contrato;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }


        #endregion
    }
}
