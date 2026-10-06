using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Configuration;
using System.Diagnostics;
using System.ComponentModel;
using System.Collections.Generic;
using System.Threading;

using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.IU;

using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.ServicosWeb.ServicoETLEnvio;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

using FUNCEF.Planus.Componentes.Web;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Envio
{
    public partial class Visualizacao : PaginaSeguraComEstado
    {
        #region propriedades
        public string sessionID
        {
            get
            {
                if (ViewState["vsessionID"] == null)
                    ViewState["vsessionID"] = "";

                return ViewState["vsessionID"].ToString();
            }
            set
            {
                ViewState["vsessionID"] = value;
            }
        }

        private ServicosWeb.ServicoETLEnvio.DataIntegrationInterfaceClient service = new ServicosWeb.ServicoETLEnvio.DataIntegrationInterfaceClient();

        private const int disponivel = 1;
        private const int indisponivel = 2;
        private const int ocupado = 3;
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                caixaDataVencimento.Text = DateTime.Today.ToShortDateString();

                this.preencheCheckBoxLists();

                if (string.IsNullOrEmpty(sessionID))
                {
                    this.logarNoServicoETL();
                }
                this.verificaStatus();

                Session["NumeroContratoEnvio"] = string.Empty;
            }
            else
            {
                //if(!string.IsNullOrEmpty(Session["NumeroContratoEnvio"].ToString()));
                //    HFnumeroContrato.Value = Session["NumeroContratoEnvio"].ToString();

                if (!string.IsNullOrEmpty(HFnumeroContrato.Value.ToString()) && HFnumeroContrato.Value != "undefined" && HFnumeroContrato.Value.ToString() != "[object Window]" && HFnumeroContrato.Value != "false")
                {
                    //ObjetoContrato contrato = new ObjetoContrato(long.Parse(HFnumeroContrato.Value.ToString()));
                    txtContrato.Text = HFnumeroContrato.Value.ToString();

                    using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                    {
                        var mutuario = cliente.contrato.buscaInfoMutuario(long.Parse(HFnumeroContrato.Value.ToString()));

                        txtMatricula.Text = mutuario["MATRICULA"].ToString(); ;
                        txtMutuario.Text = mutuario["NOME"].ToString();
                    }

                    HFnumeroContrato.Value = "";
                }
            }
        }


        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtContrato.Text = "";
            txtMatricula.Text = "";
            txtMutuario.Text = "";
        }

        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            if (divIndisponivel.Visible)
            {
                this.registrarAlerta("O serviço do ETL não está disponível.");
                this.verificaStatus();
                return;
            }

            if (!chkFinancReceber.Checked && !chkFolhaBenef.Checked && !chkFolhaPatro.Checked)
            {
                this.registrarAlerta("Selecione pelo menos um destino de envio.");
                this.verificaStatus();
                return;
            }

            if (divOcupado.Visible)
            {
                this.registrarAlerta("O processo de envio já está em execução. Clique em \"Estado\" para maiores detalhes.");
                this.verificaStatus();
                return;
            }

            if (!verificaPatrocinadoraSelecionado())
            {
                this.registrarAlerta("É obrigatório informar pelo menos uma patrocinadora.");
                this.verificaStatus();
                return;
            }

            if (!verificaPlanoSelecionado())
            {
                this.registrarAlerta("É obrigatório informar pelo menos um plano previdenciário.");
                this.verificaStatus();
                return;
            }

            if (string.IsNullOrEmpty(caixaDataVencimento.Text))
            {
                this.registrarAlerta("É obrigatório informar uma data de vencimento.");
                this.verificaStatus();
                return;
            }

            ObjetoEnvio envio = new ObjetoEnvio();
            if (!string.IsNullOrEmpty(txtContrato.Text))
            {
                envio.idContratoEmptmo = long.Parse(txtContrato.Text);
            }
            envio.patrocinadoras = this.buscaPatrocinadorasSelecionadas();
            envio.planos = this.buscaPlanosSelecionados();
            envio.flgFolhaPatro = chkFolhaPatro.Checked ? 1 : 0;
            envio.flgFolhaBenef = chkFolhaBenef.Checked ? 1 : 0;
            envio.flgFinanRec = chkFinancReceber.Checked ? 1 : 0;
            envio.dataVencto = DateTime.Parse(caixaDataVencimento.Text);
            envio.usuario = contextoSistema.loginUsuarioAtual;
            envio.flgDesativaConc = chkDesativaConcessao.Checked ? 1 : 0;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                cliente.contrato.incluirInformacoesEnvioETL(envio);
            }

            this.iniciarWorkFlow();
            //this.limpaTela();
        }
        #endregion

        #region Contexto Pagina / Permissoes
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.envio;
            }
        }

        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }
        #endregion

        #region Metodos Auxiliares
        private void limpaTela()
        {
            txtContrato.Text = "";
            txtMatricula.Text = "";
            txtMutuario.Text = "";
            for (int i = 0; i < ChkPlanos.Items.Count; i++)
            {
                ChkPlanos.Items[i].Selected = true;
            }
            for (int i = 0; i < chkPatrocinadora.Items.Count; i++)
            {
                chkPatrocinadora.Items[i].Selected = true;
            }
            chkFolhaBenef.Checked = false;
            chkFolhaPatro.Checked = false;
            chkFinancReceber.Checked = false;
            chkDesativaConcessao.Checked = false;
        }
        private bool verificaPlanoSelecionado()
        {
            for (int i = 0; i < ChkPlanos.Items.Count; i++)
            {
                if (ChkPlanos.Items[i].Selected)
                {
                    return true;
                }
            }
            return false;
        }
        private bool verificaPatrocinadoraSelecionado()
        {
            for (int i = 0; i < chkPatrocinadora.Items.Count; i++)
            {
                if (chkPatrocinadora.Items[i].Selected)
                {
                    return true;
                }
            }
            return false;
        }

        private void atualizaEstadoServicoETL(int estado)
        {
            switch (estado)
            {
                case 1:
                    divDisponivel.Visible = true;
                    divIndisponivel.Visible = false;
                    divOcupado.Visible = false;
                    break;
                case 2:
                    divDisponivel.Visible = false;
                    divIndisponivel.Visible = true;
                    divOcupado.Visible = false;
                    break;
                case 3:
                    divDisponivel.Visible = false;
                    divIndisponivel.Visible = false;
                    divOcupado.Visible = true;
                    break;
            }
        }

        private void preencheCheckBoxLists()
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                List<PlanoPrevidenciario> planos = cliente.contrato.obterPlanosPrevidenciarios();
                List<Patrocinadora> patrocinadoras = cliente.contrato.obterPatrocinadoras();

                chkPatrocinadora.DataSource = patrocinadoras;
                chkPatrocinadora.DataBind();

                ChkPlanos.DataSource = planos;
                ChkPlanos.DataBind();
            }
            this.selecionaTodos();
        }

        private void selecionaTodos()
        {
            for (int i = 0; i < ChkPlanos.Items.Count; i++)
            {
                ChkPlanos.Items[i].Selected = true;
            }

            for (int i = 0; i < chkPatrocinadora.Items.Count; i++)
            {
                chkPatrocinadora.Items[i].Selected = true;
            }
        }

        private string buscaPlanosSelecionados()
        {
            string planos = "";
            for (int i = 0; i < ChkPlanos.Items.Count; i++)
            {
                if (ChkPlanos.Items[i].Selected)
                {
                    planos = planos + ChkPlanos.Items[i].Value + ',';
                }
            }
            if (!string.IsNullOrEmpty(planos))
            {
                planos = planos.Remove(planos.Length - 1);
            }
            return planos;
        }

        private string buscaPatrocinadorasSelecionadas()
        {
            string patrocinadoras = "";
            for (int i = 0; i < chkPatrocinadora.Items.Count; i++)
            {
                if (chkPatrocinadora.Items[i].Selected)
                {
                    patrocinadoras = patrocinadoras + chkPatrocinadora.Items[i].Value + ',';
                }
            }
            if (!string.IsNullOrEmpty(patrocinadoras))
            {
                patrocinadoras = patrocinadoras.Remove(patrocinadoras.Length - 1);
            }
            return patrocinadoras;
        }

        #region metodos ServicoETL
        public void verificaStatus()
        {
            try
            {
                //Busca o status do servico, para verificar se o mesmo esta disponivel
                ServicosWeb.ServicoETLEnvio.getWorkflowDetailsExRequest details = new ServicosWeb.ServicoETLEnvio.getWorkflowDetailsExRequest();

                details.Context = new ServicosWeb.ServicoETLEnvio.SessionHeader();
                details.Context.SessionId = sessionID;

                details.GetWorkflowDetailsEx = new ServicosWeb.ServicoETLEnvio.TypeGetWorkflowDetailsExRequest();
                details.GetWorkflowDetailsEx.FolderName = "EMPRESTIMO";
                details.GetWorkflowDetailsEx.WorkflowName = ConfigurationManager.AppSettings["WorkflowName"];
                details.GetWorkflowDetailsEx.DIServiceInfo = new ServicosWeb.ServicoETLEnvio.DIServiceInfo();
                //William Moreira da Silva - SOL 250533 PPM 713085
                //details.GetWorkflowDetailsEx.DIServiceInfo.DomainName = "D_FUNCEF_DEV";
                details.GetWorkflowDetailsEx.DIServiceInfo.DomainName = ConfigurationManager.AppSettings["RepositoryDomainName"];
                //William Moreira da Silva - SOL 250533 PPM 713085
                details.GetWorkflowDetailsEx.DIServiceInfo.ServiceName = ConfigurationManager.AppSettings["ServiceName"];

                ServicosWeb.ServicoETLEnvio.DIServerDetails returnDetails = service.getWorkflowDetailsEx(details.Context, details.GetWorkflowDetailsEx);

                ServicosWeb.ServicoETLEnvio.EWorkflowRunStatus? wfStatus = returnDetails.WorkflowDetails[0].WorkflowRunStatus;
                string status = wfStatus.ToString();

                if (status.Equals("RUNNING"))
                {
                    this.atualizaEstadoServicoETL(ocupado);
                } else {
                    this.atualizaEstadoServicoETL(disponivel);
                }
            }
            catch (Exception)
            {
                this.atualizaEstadoServicoETL(indisponivel);
                this.registrarAlerta("O serviço do ETL não está disponível.");
            }
        }

        public void iniciarWorkFlow()
        {
            try
            {
                ServicosWeb.ServicoETLEnvio.startWorkflowExRequest Startdetalhes = new ServicosWeb.ServicoETLEnvio.startWorkflowExRequest();

                Startdetalhes.Context = new ServicosWeb.ServicoETLEnvio.SessionHeader();
                Startdetalhes.Context.SessionId = this.sessionID;

                Startdetalhes.StartWorkflowEx = new ServicosWeb.ServicoETLEnvio.TypeStartWorkflowExRequest();
                Startdetalhes.StartWorkflowEx.FolderName = "EMPRESTIMO";
                Startdetalhes.StartWorkflowEx.WorkflowName = ConfigurationManager.AppSettings["WorkflowName"];
                Startdetalhes.StartWorkflowEx.RequestMode = ServicosWeb.ServicoETLEnvio.ETaskRunMode.NORMAL;

                Startdetalhes.StartWorkflowEx.DIServiceInfo = new ServicosWeb.ServicoETLEnvio.DIServiceInfo();
                //William Moreira da Silva - SOL 250533 PPM 713085
                //Startdetalhes.StartWorkflowEx.DIServiceInfo.DomainName = "D_FUNCEF_DEV";
                Startdetalhes.StartWorkflowEx.DIServiceInfo.DomainName = ConfigurationManager.AppSettings["RepositoryDomainName"];
                //William Moreira da Silva - SOL 250533 PPM 713085
                Startdetalhes.StartWorkflowEx.DIServiceInfo.ServiceName = ConfigurationManager.AppSettings["ServiceName"];

                ServicosWeb.ServicoETLEnvio.TypeStartWorkflowExResponse startDetails = service.startWorkflowEx(Startdetalhes.Context, Startdetalhes.StartWorkflowEx);

                this.verificaStatus();
            }
            catch (Exception)
            {
                this.atualizaEstadoServicoETL(indisponivel);
                this.registrarAlerta("Não foi possível iniciar o processo de envio.");
            }
        }

        public void logarNoServicoETL()
        {
            try
            {
                ServicosWeb.ServicoETLEnvio.LoginRequest request = new ServicosWeb.ServicoETLEnvio.LoginRequest();

                request.RepositoryDomainName = ConfigurationManager.AppSettings["RepositoryDomainName"];
                request.RepositoryName = ConfigurationManager.AppSettings["RepositoryName"];
                request.UserNameSpace = ConfigurationManager.AppSettings["UserNameSpace"];
                request.UserName = ConfigurationManager.AppSettings["UserName"];
                request.Password = ConfigurationManager.AppSettings["Password"];

                string id = "";

                service.login(request, out id);

                sessionID = id;
            }
            catch (Exception)
            {
                this.atualizaEstadoServicoETL(indisponivel);

                this.registrarAlerta("O serviço do ETL não está disponível.");
            }
        }
        #endregion

        protected void btnOcultorefresh_Click(object sender, EventArgs e)
        {
            this.verificaStatus();
        }
        #endregion
    }
}