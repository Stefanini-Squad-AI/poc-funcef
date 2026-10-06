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

using FUNCEF.Planus.Componentes.Web;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela
{
    public partial class Inclusao : PaginaSegura
    {
        #region Propriedades

        private long numeroContrato
        {
            get
            {
                string queryString = Request.QueryString["Numero"];
                long numero = 0;

                long.TryParse(queryString, out numero);

                return numero;
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
            botaoCancelar.urlVoltar = String.Format("Visualizacao.aspx?Numero={0}", this.numeroContrato);
        }

        /// <summary>
        /// Evento de clique do botão Salvar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void botaoSalvar_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                try
                {
                    this.salvar();
                }
                catch (FaultException<ContratoFaltaNegocio> ex)
                {
                    this.registrarAlerta(ex.Detail.mensagemErro);
                }
            }
        }

        #endregion

        #region Métodos privados

        /// <summary>
        /// Salva o registro em questão.
        /// </summary>
        private void salvar()
        {
            try
            {
                HistoricoSuspensao suspensao = userControlFormularioParcelas.obterHistoricoSuspensao();

                //WILLIAM MOREIRA DA SILVA SOL 14992
                if (!string.IsNullOrEmpty(userControlFormularioParcelas.verificaSuspensao()))
                {
                    //this.registrarAlerta("Suspensão não permitida!");
                    this.registrarAlerta(userControlFormularioParcelas.verificaSuspensao());
                    return;
                }
                //WILLIAM MOREIRA DA SILVA SOL 14992

                if (suspensao != null)
                {
                    if (suspensao.tipoSuspensao.id == 2 && suspensao.prazoIndeterminado == "S")//Suspensão Temporária
                    {                         
                        this.registrarAlerta("Não é possível usar a marcação de Prazo Indeterminado para suspensão temporária. A marcação será removida."); 
                        suspensao.prazoIndeterminado = "N";
                    }

                    if (suspensao.prazoIndeterminado == "N" && suspensao.dataFim == null)
                    {
                        this.registrarAlerta("A data Final de Suspensão é obrigatória.");
                    }
                    else
                    {

                        //    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                        //    {

                        //        if ((suspensao.tipoSuspensao.id == 9 || suspensao.tipoSuspensao.id == 7 || suspensao.tipoSuspensao.id == 8) && string.IsNullOrEmpty(suspensao.observacao))//William Moreira da Silva SOL 149705
                        //        {
                        //            this.registrarAlerta("Preencher o campo observação.");
                        //        }
                        //        else
                        //        {
                        //            cliente.contrato.incluirHistoricoSuspensao(suspensao);
                        //            cliente.contrato.alterarSuspensaoParcelaContrato(suspensao);
                                                                                                                                                                                                                                                                                                                                                                                                          
                        //            this.confirmarOperacao(MensagensAplicacao.instancia.mensagem004, String.Format("~/Paginas/Tratamentos/Parcela/Visualizacao.aspx?Numero={0}", this.numeroContrato));
                        //        }
                        //    }
                        //}
                //    }
                //}
                        using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                        {
       
                            if ((suspensao.tipoSuspensao.id == 9 || suspensao.tipoSuspensao.id == 7 || suspensao.tipoSuspensao.id == 8) && string.IsNullOrEmpty(suspensao.observacao))//William Moreira da Silva SOL 149705
                            {
                                this.registrarAlerta("Preencher o campo observação.");
                            }
                            else
                            {
                                cliente.contrato.incluirHistoricoSuspensao(suspensao);
                                cliente.contrato.alterarSuspensaoParcelaContrato(suspensao);
                            
                                if (suspensao.tipoSuspensao.id == 9) //Suspensão por Cobrança Judicial
                                    cliente.contrato.AlterarItensSuspensao(suspensao);

                                this.confirmarOperacao(MensagensAplicacao.instancia.mensagem004, String.Format("~/Paginas/Tratamentos/Parcela/Visualizacao.aspx?Numero={0}", this.numeroContrato));
                            }
                        }
                    }
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }
        }

        #endregion

        #region Contexto da Página / Permissões

        /// <summary>
        /// Obtém a identificação do contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.lancamentoHistoricoSuspensaoContrato; ;
            }
        }


        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return ((Int64)PermissoesSistema.incluir).ToString();
            }
        }

        #endregion
    }
}
