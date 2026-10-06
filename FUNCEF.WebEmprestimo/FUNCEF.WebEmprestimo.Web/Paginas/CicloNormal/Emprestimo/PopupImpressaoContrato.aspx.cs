#region SOL 143476/16437 / PPM 491462
///
/// Autor:
/// Petri Nocentini
///
/// Data da Alteração:
/// 05/01/2015 17:06
///
/// Descrição da Alteração:
/// Impressão do contrato de empréstimo já preenchido
///
#endregion

using System;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.UI;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Microsoft.Reporting.WebForms;

using System.IO;
using Novacode;


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    /// <summary>
    /// Representa a página de listagem Novo avalista.
    /// </summary>
    /// public partial class PopupImpressaoContrato : PaginaSeguraComEstado
    public partial class PopupImpressaoContrato : PaginaSegura
    {

        #region Propriedades

        /// <summary>
        /// Mutário atual em uso na página
        /// </summary>
        private RelatorioContrato infosRelatorio
        {
            get
            {
                if (this.ViewState["infoRelat"] == null)
                    return new RelatorioContrato();
                else
                    return (RelatorioContrato)this.ViewState["infoRelat"];
            }

            set
            {
                this.ViewState["infoRelat"] = value;
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
        #endregion

        #region Eventos

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarComboUF();
                infosRelatorio = (RelatorioContrato)this.proxyEstado.obterEstado(this.guidImpressao);
                if (infosRelatorio != null)
                {
                    this.caixaIdentidade.Text = infosRelatorio.identidade;
                    this.CaixaLogradouro.Text = infosRelatorio.logradouro;
                    //William Moreire da Silva - SOL 257695 PPM 964306
                    //if (infosRelatorio.numero != 0)
                    //{
                        this.CaixaNumero.Text = infosRelatorio.numero.ToString();
                    //}
                    //William Moreire da Silva - SOL 257695 PPM 964306
                    this.CaixaComplemento.Text = infosRelatorio.complemento;
                    this.CaixaBairro.Text = infosRelatorio.bairro;
                    this.CaixaCidade.Text = infosRelatorio.cidade.nome;
                    //this.comboUF.SelectedValue = Convert.ToString(infosRelatorio.uf.idEstado);
                    this.comboUF.SelectedItem.Text = infosRelatorio.uf.nome;
                    this.CaixaCEP.Text = infosRelatorio.cep;
                    this.CaixaTelCel.Text = infosRelatorio.numeroCelular;
                    this.CaixaTelComercial.Text = infosRelatorio.numeroComercial;
                    this.CaixaTelResid.Text = infosRelatorio.numeroResidencial;
                    this.CaixaEmailPessoal.Text = infosRelatorio.emailPessoal;
                    this.CaixaEmailComercial.Text = infosRelatorio.emailComercial;

                    //William Moreira da Silva - SOL 257106 - PPM 956387
                    this.CaixaDataAssinatura.Text = DateTime.Today.ToShortDateString();
                    //William Moreira da Silva - SOL 257106 - PPM 956387

                    //verifica autopatrocinio
                    if (!infosRelatorio.mutuario.flginternoParticipante.ToUpper().Equals("MA"))
                    {
                        this.CaixaProfissao.Text = "(somente para autopatrocinados)";
                        this.CaixaProfissao.Enabled = false;
                    }
                }
            }
        }

        #endregion

        #region Contexto da Página / Permissões

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
                return PermissoesSistema.consultar.ToString();
            }
        }

        #endregion

        #region Métodos

        /// <summary>
        /// Carrega o Combo UF.
        /// </summary>
        private void carregarComboUF()
        {
            List<UF> listaUF = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaUF = cliente.contrato.consultarUF();
            }

            UtilidadesPagina.preencherDropDown(comboUF, listaUF, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "codEstado", "idEstado");
        }

        /// <summary>
        /// Chama rotina que exibira na tela contrato de emprestimo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void botaoImprimir_Click(object sender, EventArgs e)
        {
            //Campos obrigatórios
            if (caixaIdentidade.Text == "")
            {
                registrarAlerta("É obrigatório informar a Identidade");
                return;
            }
            if (CaixaLogradouro.Text == "")
            {
                registrarAlerta("É obrigatório informar o Logradouro");
                return;
            }
            if (CaixaNumero.Text == "")
            {
                registrarAlerta("É obrigatório informar o Número");
                return;
            }
            if (CaixaComplemento.Text == "")
            {
                registrarAlerta("É obrigatório informar o Complemento");
                return;
            }
            if (CaixaBairro.Text == "")
            {
                registrarAlerta("É obrigatório informar o Bairro");
                return;
            }
            if (CaixaCidade.Text == "")
            {
                registrarAlerta("É obrigatório informar a Cidade");
                return;
            }
            if (comboUF.SelectedValue == "")
            {
                registrarAlerta("É obrigatório informar o Estado");
                return;
            }
            if (CaixaCEP.Text == "")
            {
                registrarAlerta("É obrigatório informar o CEP");
                return;
            }

            //William Moreira da Silva - SOL 257106 - PPM 956387
            //if (CaixaTest1Nome.Text == "")
            //{
            //    registrarAlerta("É obrigatório informar o Nome da Testemunha");
            //    return;
            //}
            if (CaixaTest1CPF.Text == "" || CaixaTest1CPF.Text == ".   .   -")
            {
                //registrarAlerta("É obrigatório informar o CPF da Testemunha");
                //return;
                CaixaTest1CPF.Text = "";
            }
            //if (CaixaTest2Nome.Text == "")
            //{
            //    registrarAlerta("É obrigatório informar o Nome da Testemunha");
            //    return;
            //}
            if (CaixaTest2CPF.Text == "" || CaixaTest2CPF.Text == ".   .   -")
            {
                //registrarAlerta("É obrigatório informar o CPF da Testemunha");
                //return;
                CaixaTest2CPF.Text = "";
            }
            //William Moreira da Silva - SOL 257106 - PPM 956387

            if (CaixaProfissao.Enabled)
            {
                if (CaixaProfissao.Text == "")
                {
                    registrarAlerta("É obrigatório informar a Profissão");
                    return;
                }
            }

            //carregando parametro de impressão
            infosRelatorio.identidade = this.caixaIdentidade.Text;
            infosRelatorio.logradouro = this.CaixaLogradouro.Text;
            //William Moreire da Silva - SOL 257695 PPM 964306
            //infosRelatorio.numero = int.Parse(this.CaixaNumero.Text);
            infosRelatorio.numero = this.CaixaNumero.Text;
            //William Moreire da Silva - SOL 257695 PPM 964306
            infosRelatorio.complemento = this.CaixaComplemento.Text;
            infosRelatorio.bairro = this.CaixaBairro.Text;
            infosRelatorio.cidade.nome = this.CaixaCidade.Text;
            infosRelatorio.uf.nome = this.comboUF.SelectedItem.Text;
            infosRelatorio.cep = this.CaixaCEP.Text;
            infosRelatorio.numeroCelular = !this.CaixaTelCel.Text.Equals("(  )") ? this.CaixaTelCel.Text : "";
            infosRelatorio.numeroComercial = !this.CaixaTelComercial.Text.Equals("(  )") ? this.CaixaTelComercial.Text : "";
            infosRelatorio.numeroResidencial = !this.CaixaTelResid.Text.Equals("(  )") ? this.CaixaTelResid.Text : "";
            infosRelatorio.nomeTest1 = this.CaixaTest1Nome.Text;
            infosRelatorio.cpfTest1 = this.CaixaTest1CPF.Text;
            infosRelatorio.nomeTest2 = this.CaixaTest2Nome.Text;
            infosRelatorio.cpfTest2 = this.CaixaTest2CPF.Text;

            //verifica autopatrocinio
            if (infosRelatorio.mutuario.flginternoParticipante.ToUpper().Equals("MA"))
            {
                infosRelatorio.profissao = this.CaixaProfissao.Text;
            }
            infosRelatorio.emailComercial = this.CaixaEmailComercial.Text;
            infosRelatorio.emailPessoal = this.CaixaEmailPessoal.Text;

            this.proxyEstado.manterEstadoSincrono(guidImpressao, infosRelatorio);
            String strurl = String.Format("ImpressaoContrato.aspx?guidImpressao={0}", guidImpressao);

            //abrir a janela com a função exibirDialogo bem como showModalDialog não permite a impressao do contrato em pdf                   
            String strscript = "window.open('" + strurl + "', '_blank','toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,modal=no')";

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Contrato", strscript, true);

        }
        #endregion
    }
}
