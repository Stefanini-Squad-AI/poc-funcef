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
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System;
using System.Collections.Generic;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Assinatura
{
    public partial class Edicao : PaginaSegura
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            UtilidadesPagina.tratarItemPreenchimento(campoContratoPadrao, EnumeradorItemPreenchimento.Selecione);

            bool isAlteracao = chaves != null && chaves.ContainsKey("matricula") && chaves.ContainsKey("idPessoa") && chaves.ContainsKey("idContratoPadrao") && chaves.ContainsKey("idBeneficiario") && chaves.ContainsKey("dataAssinatura");

            botaoExcluir.Visible = isAlteracao;
            botaoSalvar.permissoesExigidas = isAlteracao ? "alterar" : "incluir";
            hplVisualizarArquivo.Visible = !string.IsNullOrEmpty(somenteNumeros(campoNUP.Text));

            if (!IsPostBack)
            {
                try
                {
                    preencherInfoParticipante();
                    preencherInfoAssinatura();
                }
                catch (Exception ex)
                {
                    registrarAlerta(string.Concat("Erro ao consultar informações de Assinatura de Contrato: ", ex.Message));
                }
            }
        }

        protected void campoNUP_TextChanged(object sender, EventArgs e)
        {
            campoNUP.Text = System.Text.RegularExpressions.Regex.Replace(campoNUP.Text, "[^0-9./]", "");

            cvdNumeroProtocolo.Validate();
            cvdDocumentoNUP.Validate();
        }

        protected void cvdDocumentoNUP_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            hplVisualizarArquivo.NavigateUrl = string.Empty;
            hplVisualizarArquivo.Visible = false;

            if (!cvdNumeroProtocolo.IsValid)
            {
                args.IsValid = true;
                return;
            }

            bool encontrado = false;

            if (string.IsNullOrEmpty(campoNUP.Text))
            {
                args.IsValid = true;
                return;
            }

            try
            {
                string caminhoPdf = obterCaminhoPdf(campoNUP.Text, out encontrado);

                if (string.IsNullOrEmpty(caminhoPdf))
                {
                    args.IsValid = false;

                    if (encontrado)
                        cvdDocumentoNUP.ErrorMessage = "Não existe documento eletrônico vinculado ao NUP informado.";
                    else
                        cvdDocumentoNUP.ErrorMessage = "O NUP informado não foi localizado.";
                }
                else
                {
                    args.IsValid = true;

                    hplVisualizarArquivo.NavigateUrl = caminhoPdf;
                    hplVisualizarArquivo.Visible = true;
                }
            }
            catch
            {
                cvdDocumentoNUP.ErrorMessage = "Houve um erro ao tentar pesquisar o documento.";

                args.IsValid = false;
            }
        }

        protected void cvdNumeroProtocolo_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = string.IsNullOrEmpty(campoNUP.Text) || !NupVinculado(hdnIdPessoa.Value);
        }

        protected void botaoExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {                    
                    var model = cliente.contrato.obterAssinaturaContrato(chaves["idPessoa"], chaves["idContratoPadrao"], chaves["idBeneficiario"], chaves["dataAssinatura"]);

                    if (string.IsNullOrEmpty(model.numProtocolo))                    
                    {
                        cliente.contrato.excluirAssinaturaContratoPadrao(chaves["idPessoa"], chaves["idContratoPadrao"], chaves["idBeneficiario"], chaves["dataAssinatura"]);

                        confirmarOperacao("A assinatura de contrato padrão foi excluída com sucesso.", ResolveUrl("~/Paginas/Tratamentos/Assinatura/Listagem.aspx"));
                    }
                    else
                    {
                        confirmarOperacao("A assinatura de contrato padrão não pode ser excluída, pois está vinculada a um NUP.", ResolveUrl(string.Concat("~/Paginas/Tratamentos/Assinatura/Edicao.aspx?chave=", Request.QueryString["chave"])));
                    }
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                {
                    registrarAlerta(string.Concat("Erro ao tentar gravar registro: ", ex.InnerException.Message));
                }
                else
                {
                    registrarAlerta(string.Concat("Erro ao tentar gravar registro: ", ex.Message));
                }
            }
        }

        protected void botaoSalvar_Click(object sender, EventArgs e)
        {
            if (IsValid && chaves.Count > 0)
            {
                try
                {
                    var model = new Tipos.Assinatura();
                    
                    DateTime dtInicio;
                    if (DateTime.TryParse(hdnDtTrgInclusao.Value, out dtInicio))
                    {
                        model.dataInicio = dtInicio;
                    }

                    model.idContratoPadrao = Convert.ToInt32(campoContratoPadrao.SelectedValue);
                    model.dataAssinatura = campoDataAssinatura.valorData.GetValueOrDefault();
                    model.observacao = campoObservacao.Text;
                    model.numProtocolo = somenteNumeros(campoNUP.Text);
                    model.mutuario = new Tipos.Mutuario
                    {
                        id = Convert.ToInt32(chaves["idBeneficiario"]),
                        idTitular = Convert.ToInt32(chaves["idPessoa"])
                    };

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        cliente.contrato.salvarAssinaturaContrato(model);
                    }

                    if (!string.IsNullOrEmpty(hdnDtTrgInclusao.Value))
                    {
                        confirmarOperacao("Assinatura de Contrato Padrão alterada.", ResolveUrl("~/Paginas/Tratamentos/Assinatura/Listagem.aspx"));
                    }
                    else
                    {
                        confirmarOperacao("Assinatura de Contrato Padrão criada.", ResolveUrl("~/Paginas/Tratamentos/Assinatura/Listagem.aspx"));
                    }
                }
                catch (Exception ex)
                {
                    if (ex.InnerException != null)
                    {
                        registrarAlerta(string.Concat("Erro ao tentar gravar registro: ", ex.InnerException.Message));
                    }
                    else
                    {
                        registrarAlerta(string.Concat("Erro ao tentar gravar registro: ", ex.Message));
                    }
                }
            }
        }
        #endregion

        #region Métodos e Web Métodos
        private void preencherInfoAssinatura()
        {
            bool possuiInfoAssinatura = false;
            if (chaves.ContainsKey("matricula") && chaves.ContainsKey("idPessoa") && chaves.ContainsKey("idContratoPadrao") && chaves.ContainsKey("idBeneficiario") && chaves.ContainsKey("dataAssinatura"))
            {
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    var model = cliente.contrato.obterAssinaturaContrato(chaves["idPessoa"], chaves["idContratoPadrao"], chaves["idBeneficiario"], chaves["dataAssinatura"]);

                    possuiInfoAssinatura = true;

                    hdnIdPessoa.Value = Convert.ToString(model.mutuario.idTitular);
                    hdnIdBeneficiario.Value = Convert.ToString(model.mutuario.id);
                    hdnDtTrgInclusao.Value = Convert.ToString(model.dataInicio);
                    hdnMatricula.Value = chaves["matricula"];

                    if (model.idContratoPadrao > 0)
                        campoContratoPadrao.SelectedValue = model.idContratoPadrao.ToString();

                    campoObservacao.Text = model.observacao;
                    campoDataAssinatura.Text = model.dataAssinatura.ToString("dd/MM/yyyy");
                    campoNUP.Text = somenteNumeros(model.numProtocolo);
                    campoComprovante.Text = model.numeroComprovante;

                    hplVisualizarArquivo.NavigateUrl = string.Empty;
                    hplVisualizarArquivo.Visible = false;

                    if (!string.IsNullOrEmpty(model.numProtocolo))
                    {
                        bool encontrado = false;
                        string arquivoPdf = Edicao.obterCaminhoPdf(model.numProtocolo, out encontrado);

                        hplVisualizarArquivo.NavigateUrl = arquivoPdf;
                        hplVisualizarArquivo.Visible = true;
                    }
                }

                botaoExcluir.Visible = true;
            }
            else
            {
                botaoExcluir.Visible = false;
            }

            if (!possuiInfoAssinatura)
            {
                if (string.IsNullOrEmpty(hdnIdPessoa.Value) && chaves.ContainsKey("idTitular"))
                    hdnIdPessoa.Value = chaves["idTitular"];

                if (string.IsNullOrEmpty(hdnIdBeneficiario.Value) && chaves.ContainsKey("idPessoa"))
                    hdnIdBeneficiario.Value = chaves["idPessoa"];

                if (string.IsNullOrEmpty(hdnMatricula.Value) && chaves.ContainsKey("matricula"))
                    hdnMatricula.Value = chaves["matricula"];
            }
        }

        private void preencherInfoParticipante()
        {
            if (chaves.ContainsKey("matricula"))
            {
                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    var mutuario = cliente.contrato.obterDadosMutuario(chaves["matricula"]);

                    // Preenche a tela com as informações do mutuário.
                    labelMutuario.Text = mutuario.nome;
                    labelPatrocinadora.Text = mutuario.patrocinadora.nome;

                    if (mutuario.tipo == "Pensionista")
                        labelSituacaoParticipante.Text = mutuario.tipo;
                    else
                        labelSituacaoParticipante.Text = mutuario.situacao;

                    labelPlanoPrevidenciario.Text = mutuario.plano.descricao;
                }
            }
        }

        private bool NupVinculado(string idPessoa)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {                
                bool isValid = cliente.contrato.NupEstaVinculado(idPessoa, somenteNumeros(campoNUP.Text));
                return isValid;
            }                           
                 
        }

        public static string obterCaminhoPdf(string txt_numero, out bool docEncontrado)
        {
            string retorno = "";

            docEncontrado = false;

            if (string.IsNullOrEmpty(txt_numero))
            {
                return string.Empty;
            }

            #region Trecho Teste com Credencial fixa - Softtek
            string credencial_username = System.Configuration.ConfigurationManager.AppSettings["proton.usuario"];
            string credencial_password = System.Configuration.ConfigurationManager.AppSettings["proton.senha"];

            if (!string.IsNullOrEmpty(credencial_username) && !string.IsNullOrEmpty(credencial_password))
            {
                var credencial = new System.Net.NetworkCredential(credencial_username, credencial_password, "FUNCEF");

                try
                {
                    retorno = webServiceAssinatura(txt_numero, credencial, out docEncontrado);
                }
                catch { }
            }
            #endregion

            try
            {
                if (string.IsNullOrEmpty(retorno))
                {
                    var uri = new Uri("http://tempuri.org/");
                    var credentials = System.Net.CredentialCache.DefaultCredentials;
                    var credential = credentials.GetCredential(uri, "Basic");

                    retorno = webServiceAssinatura(txt_numero, credential, out docEncontrado);
                }
            }
            catch { }

            return retorno;
        }

        private static string webServiceAssinatura(string txt_numero, System.Net.NetworkCredential credencial, out bool docEncontrado)
        {
            docEncontrado = false;
            txt_numero = somenteNumeros(txt_numero);

            using (ServicoAssinaturaContrato.ProtonSoapClient cliente = new ServicoAssinaturaContrato.ProtonSoapClient())
            {
                cliente.ClientCredentials.Windows.AllowNtlm = true;
                cliente.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Impersonation;
                cliente.ClientCredentials.Windows.ClientCredential = credencial;

                var ds = cliente.RetornaCaminhoArquivoDigital(txt_numero, null, null, null, null);

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    docEncontrado = true;

                    string arquivo = Convert.ToString(ds.Tables[0].Rows[0]["txt_arquivo"]);

                    if (arquivo.IndexOf("http:", StringComparison.InvariantCultureIgnoreCase) > -1 && arquivo.IndexOf("http://", StringComparison.InvariantCultureIgnoreCase) == -1)
                    {
                        arquivo = arquivo.Replace("http:/", "http://");
                    }

                    if (arquivo.IndexOf("https:", StringComparison.InvariantCultureIgnoreCase) > -1 && arquivo.IndexOf("https://", StringComparison.InvariantCultureIgnoreCase) == -1)
                    {
                        arquivo = arquivo.Replace("https:/", "https://");
                    }

                    return arquivo;
                }

                return string.Empty;
            }
        }

        private static string somenteNumeros(string txt_numero)
        {
            if (!string.IsNullOrEmpty(txt_numero))
            {
                return System.Text.RegularExpressions.Regex.Replace(txt_numero, @"[^\d]", "");
            }

            return string.Empty;
        }
        #endregion

        #region Propriedades
        public Dictionary<string, string> chaves
        {
            get
            {
                Dictionary<string, string> dct = new Dictionary<string, string>();

                if (Request.QueryString["chave"] != null)
                {
                    var arr = CriptografiaHelper.Decrypt(Request.QueryString["chave"]).Split(';');

                    foreach (var item in arr)
                        dct.Add(item.Split('=')[0], item.Split('=')[1]);
                }

                return dct;
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
                return "COASP";
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