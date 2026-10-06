#region SOL 256915 / PPM 958771
///
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Alteração:
/// 18/05/2015 18:34:06
///
/// Descrição da Alteração:  sistema não está permitindo amortização com redução de prazo, mesmo 
///                          quando o mutuário possui margem consignável para efetivar a operação 
/// 
///
#endregion
#region SOL 251529 / PPM 763520
///
/// Autor:
/// Wylliam Leite da Silva
///
/// Data da Alteração:
/// 13/05/2015 11:00:00
///
/// Descrição da Alteração: O sistema não está permitindo diminuir a quantidade de parcelas
/// 
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
using System.Xml.Linq;
using FUNCEF.Planus.GlobalWeb.Web.IU;

using System.Collections.Generic;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;
using FUNCEF.Planus.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Transacoes.Amortizacao
{
    /// <summary>
    /// Representa a página de itens para cálculo de amortização.
    /// </summary>
    public partial class Itens : PaginaSegura
    {
        #region Propriedades

        private string guidAmortizacao
        {
            get
            {
                string queryString = Request.QueryString["guidAmortizacao"];

                return queryString;
            }
        }
        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - INICIO
        private string mensagem
        {
            get
            {
                string queryString = Request.QueryString["msg"];

                return queryString;
            }
        }
        //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - FIM

        private long numeroContrato
        {
            get
            {
                if (this.ViewState["numeroContrato"] != null)
                    return (long)this.ViewState["numeroContrato"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["numeroContrato"] = value;
            }
        }

        private DateTime dataAmortizacao
        {
            get
            {
                if (this.ViewState["dataAmortizacao"] != null)
                    return (DateTime)this.ViewState["dataAmortizacao"];
                else
                    return DateTime.MinValue;
            }
            set
            {
                this.ViewState["dataAmortizacao"] = value;
            }
        }

        private int idTipoContrato
        {
            get
            {
                if (this.ViewState["idTipoContrato"] != null)
                    return (int)this.ViewState["idTipoContrato"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idTipoContrato"] = value;
            }
        }

        private string matricula
        {
            get
            {
                if (this.ViewState["matricula"] != null)
                    return (string)this.ViewState["matricula"];
                else
                    return string.Empty;
            }
            set
            {
                this.ViewState["matricula"] = value;
            }
        }

        private bool excepcional
        {
            get
            {
                if (this.ViewState["excepcional"] == null)
                    this.ViewState["excepcional"] = Request.QueryString["excepcional"];
                bool resultado = false;

                bool.TryParse((string)this.ViewState["excepcional"], out resultado);

                return resultado;
            }
        }

        private double saldoDevedor
        {
            get
            {
                if (this.ViewState["saldoDevedor"] != null)
                    return (double)this.ViewState["saldoDevedor"];
                else
                    return 0d;
            }

            set
            {
                this.ViewState["saldoDevedor"] = value;
            }
        }

        private int prazoAnterior
        {
            get
            {
                if (this.ViewState["prazoAnterior"] != null)
                    return (int)this.ViewState["prazoAnterior"];
                else
                    return 0;
            }

            set
            {
                this.ViewState["prazoAnterior"] = value;
            }

        }

        //William Moreira da Silva SOL 211419
        private int? prazo
        {
            get
            {
                if (this.ViewState["prazo"] != null)
                    return (int?)this.ViewState["prazo"];
                else
                    return null;
            }
            set
            {
                this.ViewState["prazo"] = value;
            }
        }
        //William Moreira da Silva SOL 211419

        //Wylliam Leite da Silva SOL 251529 PPM 763520
        private double vlrParcela
        {
            get
            {
                if (this.ViewState["vlrParcela"] != null)
                    return (double)this.ViewState["vlrParcela"];
                else
                    return 0d;
            }

            set
            {
                this.ViewState["vlrParcela"] = value;
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
            if (!this.IsPostBack)
            {
                //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - INICIO
                if (bool.Parse(this.mensagem))
                    this.registrarAlerta(MensagensAplicacao.instancia.mensagem041);
                //MARCIO SANCHES SPINOSA SOL 209315 KINTANA 2022203 - FIM
                gridItens.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                Dictionary<string, object> parametrosAmortizacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidAmortizacao);
                this.numeroContrato = (long)parametrosAmortizacao["numeroContrato"];
                this.dataAmortizacao = (DateTime)parametrosAmortizacao["dataAmortizacao"];

                if (parametrosAmortizacao.Keys.Contains("idTipoContrato"))
                {
                    this.idTipoContrato = (int)parametrosAmortizacao["idTipoContrato"];
                }
                else
                {
                    this.idTipoContrato = ((TipoContrato)parametrosAmortizacao["tipoContrato"]).id;

                    if (parametrosAmortizacao["valor"] != null)
                        this.caixaTextoValor.valorPontoFlutuante = (double?)parametrosAmortizacao["valor"];
                }

                this.matricula = (string)parametrosAmortizacao["matricula"];

                List<ItemContrato> itensEmAberto = null;
                int parcelasRestantes = 0;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                    double valorTotalItens = 0;
                    itensEmAberto = cliente.contrato.obterItensContratoEmAberto(this.numeroContrato, ref parametrosConsulta, ref valorTotalItens);

                    //William Moreira da Silva - SOL 260753 PPM 1042676 - Inicio
                    //William Moreira da Silva - SOL 254823
                    //if (itensEmAberto.Count > 0)
                    //{
                    //Wylliam Leite da Silva SOL 251529 PPM 763520
                    //this.vlrParcela = (double)itensEmAberto[0].valor;
                    //}
                    //William Moreira da Silva - SOL 254823
                    this.vlrParcela = cliente.contrato.obterPrestacaoAtual(this.numeroContrato);
                    //William Moreira da Silva - SOL 260753 PPM 1042676 - Fim

                    parametrosConsulta.paginacao = new Paginacao { indiceLinha = 0, maximoLinhas = 20 };
                    gridItens.DataSourceID = dataSourceItens.ID;

                    // Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                    // Saulo / FUNCEF
                    ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                    // Xavier SOL 168644
                    int? IdCalculo = cliente.contrato.consultarUltimoIdCalculo(); ;

                    //double valorEmAberto = this.calcularValorEmAberto(itensEmAberto);
                    labelEmAberto.Text = valorTotalItens.ToString("N2");

                    parcelasRestantes = cliente.contrato.obterParcelasRestantes(this.numeroContrato, this.dataAmortizacao);

                    if (parcelasRestantes == 0)
                    {
                        parcelasRestantes = contrato.totalParcelas;
                    }

                    labelParcelasRestantes.Text = parcelasRestantes.ToString();

                    this.saldoDevedor = cliente.contrato.obterSaldoDevedor(this.numeroContrato, this.dataAmortizacao);
                    labelSaldo.Text = this.saldoDevedor.ToString("N2");

                    TipoContrato tipoContrato = cliente.contrato.consultarTipoContrato(this.idTipoContrato, false);
                    this.carregarNovoPrazo(tipoContrato, parcelasRestantes, contrato);

                    parametrosAmortizacao.Remove("idTipoContrato");
                    parametrosAmortizacao["tipoContrato"] = tipoContrato;
                    this.proxyEstado.manterEstadoSincrono(this.guidAmortizacao, parametrosAmortizacao);





                    //Executa regra margem
                    try
                    {
                        IDictionary<string, object> parametros = new Dictionary<string, object>();

                        parametros.Add("MATRICULA_P", this.matricula);
                        parametros.Add("IDMUTUARIO_P", contrato.mutuario.id); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("IDPLANO_P", contrato.plano.id); //NILTON - CORREÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("SITFUNDACAO_P", contrato.mutuario.flginternoParticipante); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("IDPESSJUR_P", contrato.patrocinadora.id); //NILTON - CORREÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("IDCONTRATOAQUITAR_P", this.numeroContrato); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("IDTIPOCONTRATO_P", this.idTipoContrato);
                        parametros.Add("DATASOLICITACAO_P", this.dataAmortizacao);
                        parametros.Add("IDOPERACAO_P", TipoOperacao.amortizacao.chave);
                        parametros.Add("SALARIOBASE_P", contrato.salarioBase); //MILTON LUIZ
                        parametros.Add("NUMPARCELAS_P", contrato.totalParcelas);
                        parametros.Add("EXCEPCIONALOUTROS_P", this.excepcional ? 1 : 0);
                        parametros.Add("IDCALCULO_P", IdCalculo); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL
                        parametros.Add("USUARIO_P", Contexto.obterUsuario()); //BRUNO AZEVEDO - ALTERAÇÃO NA ASSINATURA CONFORME E-MAIL

                        caixaTextoMargem.valor = (double)cliente.contrato.executarRegra(tipoContrato.regraMargem, parametros);
                    }
                    catch (FaultException<ContratoFaltaNegocio> erro)
                    {
                        registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
                        caixaTextoMargem.valor = 0;
                    }

                }
                this.prazo = int.Parse(comboPrazo.Text);//William Moreira da Silva SOL 211419
            }
        }

        private double calcularValorEmAberto(List<ItemContrato> itensEmAberto)
        {
            double valorEmAberto = 0;

            if (itensEmAberto != null)
            {
                foreach (ItemContrato item in itensEmAberto)
                    valorEmAberto += item.valor;
            }

            return valorEmAberto;
        }

        private void carregarNovoPrazo(TipoContrato tipo, int parcelas, ObjetoContrato contrato)
        {
            //Calcula prazo máximo do prazo
            int prazoMaximo = (tipo.maximoParcelas - contrato.totalParcelas) + parcelas;

            //Carrega combo de prazo de 1 a prazoMaximo
            for (int x = 1; x <= prazoMaximo; x++)
            {
                comboPrazo.Items.Add(new ListItem(x.ToString()));
            }

            //Verifica se parcelas é maior que prazo máximo
            int parcelaSelecionada = 0;
            if (parcelas > prazoMaximo)
                parcelaSelecionada = prazoMaximo;
            else
                parcelaSelecionada = parcelas;

            //Seleciona parcelas restantes.
            if (comboPrazo.Items.Count > 0)
            {
                comboPrazo.ClearSelection();
                comboPrazo.Items.FindByValue(parcelaSelecionada.ToString()).Selected = true;
            }

            //Guarda o prazo inicial que veio selecionado
            this.prazoAnterior = parcelaSelecionada;
        }

        protected void dataSourceItens_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

            if (e.InputParameters.Count == 0)
            {
                e.InputParameters.Add("numero", this.numeroContrato);
            }

        }

        /// <summary>
        /// Evento de clique do botão Volta.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("Visualizacao.aspx?Numero={0}&dataAmortizacao={1}&excepcional={2}", this.numeroContrato, this.dataAmortizacao, this.excepcional));
        }

        /// <summary>
        /// Evento de clique do botão Continuar.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            if (!this.validarValorAmortizacao())
                return;



            Dictionary<string, object> parametros = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidAmortizacao);
            TipoContrato tipoContrato = (TipoContrato)parametros["tipoContrato"];

            //Marcio Sanches Spinosa SOL 201768 Kintana 1950789 - Inicio
            if (!this.validarValorMargemConsignavel(tipoContrato))
                return;
            //Marcio Sanches Spinosa SOL 201768 Kintana 1950789 - Fim

            parametros["valor"] = this.caixaTextoValor.valorPontoFlutuante;
            parametros["margem"] = this.caixaTextoMargem.valorPontoFlutuante;
            parametros["prazo"] = this.comboPrazo.SelectedValue;
            parametros["prazoAnterior"] = this.prazoAnterior;

            // // Xavier SOL 177146 Inicio.
            bool existeValorAmortizacao = false;
            bool existeParcelaPosterior = false;//William Moreira da Silva SOL 211419
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                existeValorAmortizacao = cliente.contrato.VerificarValorAmortizacao(numeroContrato, dataAmortizacao);
                if (existeValorAmortizacao)
                {
                    registrarAlerta("Esta amortização será comandada após a geração da parcela. O valor da prestação será alterado somente no mês seguinte.");
                }
                existeParcelaPosterior = cliente.contrato.existeParcelaPosterior(numeroContrato, dataAmortizacao);//William Moreira da Silva SOL 211419
            }
            // Xavier SOL 177146 Final.

            this.proxyEstado.manterEstadoSincrono(this.guidAmortizacao, parametros);

            //William Moreira da Silva SOL 211419
            bool parcPosterior = false;
            if ((existeParcelaPosterior) && (this.prazo != int.Parse(comboPrazo.Text)))
            {
                parcPosterior = true;
            }
            //William Moreira da Silva SOL 211419

            if (!this.caixaTextoValor.valorPontoFlutuante.HasValue || this.caixaTextoValor.valorPontoFlutuante <= 0)
            {
                if (tipoContrato.naoRefinancia)
                    this.registrarAlerta(MensagensAplicacao.instancia.mensagem029);
                else
                    //this.redirecionarComConfirmacao(MensagensAplicacao.instancia.mensagem030, String.Format("~/Paginas/Transacoes/Amortizacao/Valores.aspx?guidAmortizacao={0}", this.guidAmortizacao));
                    this.redirecionarComConfirmacao(MensagensAplicacao.instancia.mensagem030, String.Format("~/Paginas/Transacoes/Amortizacao/Valores.aspx?guidAmortizacao={0}&parcPosterior={1}", this.guidAmortizacao, parcPosterior));//William Moreira da Silva SOL 211419
            }
            else
            {
                //Response.Redirect(String.Format("~/Paginas/Transacoes/Amortizacao/Valores.aspx?guidAmortizacao={0}", this.guidAmortizacao));
                Response.Redirect(String.Format("~/Paginas/Transacoes/Amortizacao/Valores.aspx?guidAmortizacao={0}&parcPosterior={1}", this.guidAmortizacao, parcPosterior));//William Moreira da Silva SOL 211419
            }
        }

        #endregion

        #region Métodos

        /// <summary>
        /// Valida se o valor informado do amortização é maior que saldo devedor
        /// </summary>
        private bool validarValorAmortizacao()
        {

            if (caixaTextoValor.valor.HasValue)
            {
                if (caixaTextoValor.valor >= this.saldoDevedor)
                {
                    this.registrarAlerta("O Valor informado para Amortização está maior ou igual ao saldo devedor.\\nSe desejar quitar o Empréstimo, favor proceder uma Quitação.");
                    return false;
                }
            }

            return true;
        }

        //Marcio Sanches Spinosa SOL 201768 Kintana 1950789 - Inicio
        /// <summary>
        /// Valida se o valor informado do amortização é maior que o valor da margem consignável 
        /// </summary>
        private bool validarValorMargemConsignavel(TipoContrato tipoContrato)
        {
            List<ItemContrato> itens = null;
            double parcela;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //William Moreira da Silva - SOL 208775 KINTANA 2017860
                try
                {
                    itens = cliente.contrato.calcularItensAmortizacao(tipoContrato, this.numeroContrato, this.dataAmortizacao, Convert.ToInt32(this.comboPrazo.SelectedValue), this.caixaTextoValor.valor, this.caixaTextoMargem.valor);
                    parcela = itens.Find(i => i.tipoEvento.chave == TipoEvento.prestacao.chave && i.centraliza == 1 && i.destacado == 0).valor;
                }
                catch (FaultException<ContratoFaltaNegocio> erro)
                {
                    string msg = this.tratarMensagem(erro.Detail.mensagemErro);
                    this.registrarAlerta(msg);
                    return false;
                }
                //William Moreira da Silva - SOL 208775 KINTANA 2017860

            }

            //William Moreira da Silva - SOL 216285 KTN 2046441
            //if (parcela > this.caixaTextoMargem.valor)
            //{
            //this.registrarAlerta("O valor resultante da prestação é maior que a margem consignável disponível. Não será permitida a operação.");
            //return false;//Verificar pois no PLANUS não esta sendo passado
            //}

            //Wylliam Leite da Silva SOL 251529 PPM 763520 - Inicio
            if (((Int32.Parse(comboPrazo.Text) >= Int32.Parse(labelParcelasRestantes.Text)) && (double.Parse(caixaTextoMargem.Text) > parcela)) || (parcela < this.vlrParcela))
            {
                return true;
            }
            else
            {
                //Wylliam Leite da Silva SOL 256915 PPM 958771 - Inicio
                if ((Int32.Parse(comboPrazo.Text) <= Int32.Parse(labelParcelasRestantes.Text)) && (double.Parse(caixaTextoMargem.Text) > parcela))
                {
                    return true;
                }
                else
                {
                    this.registrarAlerta("O valor resultante da prestação é maior que a margem consignável disponível. Não será permitida a operação.");
                    return false;
                }
                //Wylliam Leite da Silva SOL 256915 PPM 958771 - Fim
            }
            //Wylliam Leite da Silva SOL 251529 PPM 763520 - Fim

            //William Moreira da Silva - SOL 216285 KTN 2046441
        }
        //Marcio Sanches Spinosa SOL 201768 Kintana 1950789 - Fim

        /// <summary>
        /// O sistema deve exibir crítica quando o valor resultante da prestação for maior que a margem.
        /// O sistema não deve exibir a Critica quando a prestação resultante for menor que a prestação atual
        /// </summary>
        /// <returns></returns>
        private bool validarPrestacaoMargem()
        {
            if (caixaTextoMargem.Text != null)
            {

                if ((Int32.Parse(comboPrazo.Text) < Int32.Parse(labelParcelasRestantes.Text)) && (double.Parse(caixaTextoMargem.Text) < double.Parse(labelEmAberto.Text)))
                {
                    this.registrarAlerta("O valor resultante da prestação é maior que a margem consignável disponível. Não será permitida a operação.");
                    return false;
                }
            }

            return true;
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
                return IdentificacaoContexto.amortizacao;
            }
        }

        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.incluir.ToString();
            }
        }

        #endregion

    }
}
