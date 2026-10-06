#region SIG 50871
/// Autor:  
/// William Santana
///
/// Data da Atualização:
/// 03/08/2017
///
/// Criação de fucionalidade para importar modelos de contratos de empréstimo.
///
#endregion

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
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.Collections.Generic;
using System.Net;
using System.IO;
using System.Web.Services;
using System.Web.Script.Services;


namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ModeloContrato
{
    public partial class Alteracao : PaginaSegura
    {

        private string idTipoContr
        {
            get
            {
                string qs = Request.QueryString["IdTipoContr"];

                return qs;
            }
        }

        private string opAlteracao
        {
            get
            {
                return "Alteracao";
            }
        }

        private string opInclusao
        {
            get
            {
                return "Inclusao";
            }
        }

        [Serializable]
        private class Operacao
        {
            public bool Alteracao { get; set; }

            public bool Inclusao { get; set; }
        }

        //private  Operacao operacao        
        private string operacao
        {
            get
            {
                return Session["vOperacao"].ToString();
            }
            set
            {
                Session["vOperacao"] = value;
            }
        }

        private string DataInicioVigencia
        {
            get
            {
                string data = Request.QueryString["DataInicioVigencia"];

                return data;
            }
        }

        private string IdMinutaContrato
        {
            get
            {
                string IdMinutaContrato = Request.QueryString["IdMinutaContrato"];

                return IdMinutaContrato;
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
                return IdentificacaoContexto.modelocontrato;
            }
        }

        /// <summary>
        /// Representa as permissões necessárias para o acesso à esta página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.alterar.ToString();
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                carregarComboTipoContrato();

                if (!String.IsNullOrEmpty(idTipoContr))
                {
                    caixaSelecaoTipoContrato.SelectedValue = idTipoContr;
                    caixaSelecaoTipoContrato.Enabled = false;

                    if (string.IsNullOrEmpty(IdMinutaContrato) || IdMinutaContrato == "0")
                    {
                        preencheLink(idTipoContr, Convert.ToDateTime(DataInicioVigencia));
                    }
                    else 
                    {
                        preencheGrid(Convert.ToInt32(this.IdMinutaContrato));
                    }

                }
            }

            //botaoExcluir.Visible = operacao.Alteracao;
            botaoExcluir.Visible = (operacao == opAlteracao);

        }

        private void carregarComboTipoContrato()
        {
            List<TipoContrato> listaTipoContrato = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //listaTipoContrato = cliente.contrato.listarTipoContrato();
                listaTipoContrato = cliente.contrato.ListarTodas();
            }

            UtilidadesPagina.preencherDropDown(caixaSelecaoTipoContrato, listaTipoContrato, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "descricao", "id");
        }

        private void preencheLink(string idTipoContr, DateTime? DataInicioVigencia)
        {
            //usando list para reaproveitar uma função que já existe, porem sempre irá retornar um item por conta do id tipo de contrato
            List<ModeloContratoEmp> modeloContrato;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                ParametrosConsulta parametros = null;

                modeloContrato = cliente.contrato.consultarModelosContratos(idTipoContr, DataInicioVigencia, ref parametros);
            }

            if (modeloContrato.Count > 0)
            {
                //link.Text = modeloContrato.Select(a => a.link).First();
                operacao = opAlteracao;
                DataInicio.valorData = modeloContrato.Select(a => a.DataInicioVigencia).First();
                DataFinal.valorData = modeloContrato.Select(a => a.DataFimVigencia).First();
            }
            else
            {
                operacao = opInclusao;
            }
        }

        protected void botaoSalvar_Click(object sender, EventArgs e)
        {
            if (validaDados())
            {

                ModeloContratoEmp modContrato = new ModeloContratoEmp()
                {
                    idTipoContratoEmptmo = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue),
                    //link = link.Text.Trim(),
                    dataInclusao = DateTime.Now,
                    usuarioInclusao = contextoSistema.usuarioAtual.idPlanus.ToString(),
                    IdUsuario = (int)contextoSistema.usuarioAtual.idPlanus,
                    DataInicioVigencia = (DateTime) DataInicio.valorData,
                    DataFimVigencia = (DateTime) DataFinal.valorData  
                };

                LeioutContrato leiaute = new LeioutContrato();
                if (caminhoArquivo.HasFile)
                {
                    leiaute.leioutContrato = caminhoArquivo.FileBytes;
                }

                try
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        //if (operacao.Inclusao)
                        if (operacao == opInclusao)
                        {
                            cliente.contrato.InsAltDelModContratos(modContrato, leiaute, "I");

                            cliente.contrato.SalvarMinutasContratosAntigos(modContrato, leiaute, "I");

                            confirmarOperacao("Modelo de contrato de empréstimo inserido com sucesso.", "~/Paginas/Tratamentos/ModeloContrato/Listagem.aspx");
                        }

                        //if (operacao.Alteracao)
                        if (operacao == opAlteracao)
                        {
                            if (leiaute.leioutContrato == null)
                            {
                                registrarAlerta("Por favor, selecione a minuta de contrato!");
                                return;
                            }

                            cliente.contrato.InsAltDelModContratos(modContrato, leiaute, "A");

                            cliente.contrato.SalvarMinutasContratosAntigos(modContrato, leiaute, "A");

                            confirmarOperacao("Modelo de contrato de empréstimo alterado com sucesso.", "~/Paginas/Tratamentos/ModeloContrato/Listagem.aspx");

                            string DadosAlteracaoMinuta = string.Empty;
                            DadosAlteracaoMinuta = "Campo: Data início vigência alterado de: " + DataInicio.valorData.ToString() + " para " + modContrato.DataInicioVigencia.ToString();
                            DadosAlteracaoMinuta = DadosAlteracaoMinuta + " | Campo: Data final vigência alterado de: " + DataFinal.valorData.ToString() + " para " + modContrato.DataFimVigencia.ToString();

                            if (leiaute.leioutContrato != null)
                                DadosAlteracaoMinuta = DadosAlteracaoMinuta + " | Alterado binário da minuta.";

                            LogContrato log = new LogContrato();
                            log.idHistorico = modContrato.idTipoContratoEmptmo;
                            log.descricao = DadosAlteracaoMinuta;
                            log.origem = Origem.consultaContratos;
                            log.numeroContrato = modContrato.IdMinutaHistorico; 

                            cliente.contrato.incluirLog(log);        
                        }
                    }
                }
                catch (Exception)
                {
                    registrarAlerta("Erro ao salvar minuta de contrato!");
                }

            }

        }

        protected void botaoExcluir_Click(object sender, EventArgs e)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                ModeloContratoEmp modContrato = new ModeloContratoEmp()
                {
                    idTipoContratoEmptmo = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue.ToString())
                };

                try
                {
                    string retorno = cliente.contrato.InsAltDelModContratos(modContrato, null, "E");
                    if (retorno == string.Empty)
                    {
                        confirmarOperacao("Modelo de contrato de empréstimo excluído com sucesso.", "~/Paginas/Tratamentos/ModeloContrato/Listagem.aspx");
                    }
                    else
                    {
                        registrarAlerta("Erro ao excluir registro: " + retorno + "!");
                    }
                }
                catch (Exception ex)
                {
                    registrarAlerta("Erro ao excluir registro! ");
                }
            }
        }

        #region Validações
        private bool validaDados()
        {
            if (operacao == opInclusao)
            {
            }

            //SIG 129005 ---------------------------------------------------------------------------------
            if (DataInicio.valorData == null)// || DataFinal.valorData == null)
            {
                registrarAlerta("Por favor, informe a data inicial vigência.");
                return false;
            }

            if (DataInicio.valorData > DataFinal.valorData)
            {
                registrarAlerta("A data inicial de vigência não pode ser superior à data final.");
                return false;
            }

            if (DataInicio.valorData >= DateTime.Today)// || DataFinal.valorData >= DateTime.Today)
            {
                registrarAlerta("Data inválida, por favor, verifique.");
                return false;
            }
            //SIG 129005 ---------------------------------------------------------------------------------


            return true;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string StatusCadastro()
        {
            string operacao = HttpContext.Current.Session["vOperacao"].ToString();
            return operacao;
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool validaLink(string url)
        {                       
            if (!url.StartsWith("http", StringComparison.OrdinalIgnoreCase))
            {
                url = "https://" + url;
            }

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = WebRequestMethods.Http.Get;
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string IncluirHTTP(string url)
        {
            if (!url.StartsWith("http", StringComparison.OrdinalIgnoreCase))
            {
                url = "https://" + url;
            }
            return url;

        }
        #endregion

        private void preencheGrid(int IdMinutaContrato)
        {
            //usando list para reaproveitar uma função que já existe, porem sempre irá retornar um item por conta do id tipo de contrato
            List<ModeloContratoEmp> modeloContrato;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                ParametrosConsulta parametros = null;

                modeloContrato = cliente.contrato.ConsultarModelosContratosSemMinuta(IdMinutaContrato);
            }

            if (modeloContrato.Count > 0)
            {
                //link.Text = modeloContrato.Select(a => a.link).First();
                operacao = opAlteracao;
                DataInicio.valorData = modeloContrato.Select(a => a.DataInicioVigencia).First();
                DataFinal.valorData = modeloContrato.Select(a => a.DataFimVigencia).First();
            }
            else
            {
                operacao = opInclusao;
            }
        }

    }
}