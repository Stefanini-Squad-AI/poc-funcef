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
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using System.Collections.Generic;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela
{
    public partial class Alteracao : PaginaSegura
    {
        #region Propriedades

        private long idHistoricoSuspensao
        {
            get
            {
                return UtilidadesPagina.obterIdQueryString("Id", true);
            }
        }

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

            if (!this.IsPostBack)
            {
                HistoricoSuspensao suspensao = null;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    List<HistoricoSuspensao> itens = cliente.contrato.consultarHistoricoSuspensao(this.numeroContrato, this.idHistoricoSuspensao);
                    if (itens != null && itens.Count > 0)
                        suspensao = itens[0];
                }

                //William Moreira da Silva SOL 235167
                if (!suspensao.status.Equals("Ativa"))
                {
                    botaoSalvar.Visible = false;
                }

                gridLogAlteracoes.EmptyDataText = "Não há alterações";

                List<LogContrato> logAlteracoes = null;
                LogContrato log = new LogContrato();

                log.numeroContrato = this.numeroContrato;
                log.idHistorico = this.idHistoricoSuspensao;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    logAlteracoes = cliente.contrato.consultarLogOrigem(log, Origem.consultaContratos.chave);
                }
                //William Moreira da Silva SOL 235167

                gridLogAlteracoes.DataSource = logAlteracoes;
                gridLogAlteracoes.DataBind();

                userControlFormularioParcelas.carregarTela(suspensao);
                Session["SUSPENSAOOLD"] = suspensao;

            }
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

        //William Moreira da Silva - SOL 155626
        private void GravarLogCamposAlterados(List<CamposAlterados> listaCamposAlterados, Cliente<IServicoContrato> cliente)
        {
            LogContrato log = new LogContrato();
            log.idHistorico = this.idHistoricoSuspensao;

            for (int i = 0; i < listaCamposAlterados.Count; i++)
            {
                log.descricao = "Campo: " + listaCamposAlterados[i].nome + " alterado de: " + listaCamposAlterados[i].informacaoAnterior +
                    " para: " + listaCamposAlterados[i].informacaoAtual;

                log.origem = Origem.consultaContratos;

                log.numeroContrato = this.numeroContrato;
                //log.numeroContrato = this.idHistoricoSuspensao;//William Moreira da Silva - SOL 235167 PPM 446221

                cliente.contrato.incluirLog(log);
            }
        }//William Moreira da Silva - SOL 155626

        //William Moreira da Silva - SOL 155626
        private List<CamposAlterados> VerificarCamposAlterados(HistoricoSuspensao suspensaoOld, HistoricoSuspensao suspensao)
        {
            CamposAlterados camposAlterados;
            List<CamposAlterados> listaCamposAlterados = new List<CamposAlterados>();

            if (suspensao.dataLiberacao != suspensaoOld.dataLiberacao)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "HSCDATALIBER";
                camposAlterados.informacaoAnterior = suspensaoOld.dataLiberacao.ToString();
                camposAlterados.informacaoAtual = suspensao.dataLiberacao.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            if (suspensao.ferias != suspensaoOld.ferias)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "FLGFERIAS";
                camposAlterados.informacaoAnterior = suspensaoOld.ferias.ToString();
                camposAlterados.informacaoAtual = suspensao.ferias.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            if (suspensao.mesCobranca != suspensaoOld.mesCobranca)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "HSCMESCOBRANCA";
                camposAlterados.informacaoAnterior = suspensaoOld.mesCobranca.ToString();
                camposAlterados.informacaoAtual = suspensao.mesCobranca.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            if (suspensao.anoCobranca != suspensaoOld.anoCobranca)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "HSCANOCOBRANCA";
                camposAlterados.informacaoAnterior = suspensaoOld.anoCobranca.ToString();
                camposAlterados.informacaoAtual = suspensao.anoCobranca.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            if (suspensao.observacao != suspensaoOld.observacao)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "OBSERVACAO";
                camposAlterados.informacaoAnterior = suspensaoOld.observacao.ToString();
                camposAlterados.informacaoAtual = suspensao.observacao.ToString();
                listaCamposAlterados.Add(camposAlterados);
            }

            string status = null;
            if (suspensaoOld.status == "Ativa")
            {
                status = "A";
            }
            if (suspensaoOld.status == "Encerrada")
            {
                status = "E";
            }
            if (suspensaoOld.status == "Cancelada")
            {
                status = "C";
            }

            if (suspensao.status != status)
            {
                camposAlterados = new CamposAlterados();
                camposAlterados.nome = "FLGSTATUS";
                camposAlterados.informacaoAnterior = status;
                camposAlterados.informacaoAtual = suspensao.status.ToString();
                listaCamposAlterados.Add(camposAlterados);

                //William Moreira da Silva SOL 235167
                if (suspensao.status == "E")
                {
                    camposAlterados = new CamposAlterados();
                    camposAlterados.nome = "HSCFINALSUSP";
                    camposAlterados.informacaoAnterior = suspensaoOld.dataFim.ToString().Substring(0, 10);
                    camposAlterados.informacaoAtual = DateTime.Now.ToShortDateString();
                    listaCamposAlterados.Add(camposAlterados);
                }
                //William Moreira da Silva SOL 235167

            }

            return listaCamposAlterados;
        }//William Moreira da Silva - SOL 155626

        /// <summary>
        /// Salva o registro em questão.
        /// </summary>
        private void salvar()
        {
            try
            {
                HistoricoSuspensao suspensao = userControlFormularioParcelas.obterHistoricoSuspensao();
                HistoricoSuspensao suspensaoOld = (HistoricoSuspensao)Session["SUSPENSAOOLD"];

                if (suspensao != null && userControlFormularioParcelas.verificarConsistencias())
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

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {//William Moreira da Silva SOL161447
                        if ((suspensao.status == "E") && cliente.contrato.verificaSuspensaoPeriodo(this.numeroContrato, suspensao.dataInicio, DateTime.Parse(suspensao.dataFim.ToString())))
                        {
                            this.registrarAlerta("Suspensão não utilizada. Para este caso deverá ser selecionado o status 'Cancelada'.");
                        }//William Moreira da Silva SOL161447
                        else
                        {
                            GravarLogCamposAlterados(VerificarCamposAlterados(suspensaoOld, suspensao), cliente);//William Moreira da Silva - SOL 155626
                            Session.Clear();

                            //William Moreira da Silva SOL161201
                            //if (suspensao.status != "Ativa" && suspensaoOld.status.ToString() == "Ativa" && cliente.contrato.verificaContratoAtivo(this.numeroContrato))                            
                            //WO4481 - Retirada validação da situação ativa do contrato
                            if (suspensao.status != "Ativa" && suspensaoOld.status.ToString() == "Ativa")                            
                            {
                               if (cliente.contrato.BuscarQtdParcelasSuspensas(this.numeroContrato) == 0)
                               { 
                                    cliente.contrato.alterarHistoricoSuspensao(suspensao);

                                    //5 =  Suspensão por Liminar - FGQC
                                    //8 =  Suspensão por Liminar com Parcelas
                                    //9 =  Suspensão por Cobrança Judicial
                                    //11=  Suspensão por Liminar - Prestação

                                    //WO4481 - Retirada validação da situação ativa do contrato. Incluído os tipo de suspensão.
                                    if (new string[] { "5", "8", "9", "11" }.Where(x => x.Contains(suspensao.tipoSuspensao.id.ToString())).FirstOrDefault() != null)
                                    {                     
                                        cliente.contrato.retirarSuspensaoParcelaContrato(this.numeroContrato, this.contextoSistema.loginUsuarioAtual);
                                    }
                               }
                            }
                            else//William Moreira da Silva SOL161201
                            {
                                cliente.contrato.alterarHistoricoSuspensao(suspensao);//William Moreira da Silva SOL161201
                                cliente.contrato.alterarSuspensaoParcelaContrato(suspensao);//William Moreira da Silva SOL161201   
                            }

                            this.confirmarOperacao(MensagensAplicacao.instancia.mensagem005, String.Format("~/Paginas/Tratamentos/Parcela/Visualizacao.aspx?Numero={0}", this.numeroContrato));
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
                return IdentificacaoContexto.lancamentoHistoricoSuspensaoContrato;
            }
        }

        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return ((Int64)PermissoesSistema.alterar).ToString();
            }
        }

        #endregion
    }
}
