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
#region SIG119231
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Atualização:
/// 15/09/2021
/// 
/// Descrição da Alteração:
/// Não vaidar margem para contratos do tipo 13 Novembro / 13 Fevereiro
#endregion
#region SIG117302
///
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Alteração:
/// 03/09/2021
///
/// Descrição da Alteração:
/// Apenas validar rubrica de margem se o flag 'política de renegociação' estiver desmarcado.
///
#endregion
#region SIG118806
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Atualização:
/// 01/09/2021
/// 
/// Descrição da Alteração:
/// Somente validar a margem se o flag de liquido zero estiver desmarcado
#endregion
#region SIG 84025
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Atualização:
/// 27/05/2019
/// 
/// Descrição da Alteração:
/// Comentado if que zera o valor solicitado.
#endregion
#region SIG 21529
///
/// Autor:
/// Thayane Rabonato/Darivaldo Alencar
///
/// Data da Alteração:
/// 12/09/2017
///
/// Descrição da Alteração:
/// Criação da opção de renegociação de dívidas de emprestimo
///
#endregion
#region SIG 74591
/// Autor:
/// Darivaldo Alencar
///
/// Data da Atualização:
/// 14/09/2018
/// 
/// Descrição da Alteração:
/// Campo tipo de contrato perdendo indice após selecionar excepcionalidade
#endregion
#region SIG 65101
/// Autor:
/// Darivaldo Alencar
///
/// Data da Atualização:
/// 13/09/2018
/// 
/// Descrição da Alteração:
/// Erro na prestação base ao clicar no botão atualizar
#endregion
#region SIG 57632
/// Autor:
/// Marcelo Valério Ferreira
///
/// Data da Alteração:
/// 09/01/2018 13:05:00
///
/// Descrição da Alteração:
/// Verificação de duplicidade de concessão de 13º salário para o participante.
#region SIG 57632
/// Autor:
/// Marcelo Valério Ferreira
///
/// Data da Atualização:
/// 10/01/2018
/// 
/// Descrição da Alteração:
/// Execução do recálculo após remoção da seleção do campo "Líquido Zero"
#endregion
#region SIG 53437
/// Autor:
/// William Santana
///
/// Data da Atualização:
/// 27/08/2017
/// 
/// Descrição da Alteração:
/// Limpar seleção de itens da gridDividasEmprestimo ao alterar o contrato
#endregion
#region SOL 224034/17909 PPM 1165556
/// Autor:
/// Felipe A. Santos
///
/// Data da Atualização:
/// 17/03/2016
/// 
/// Descrição da Alteração:
/// Criação da opção de Acordo Judicial
#endregion

/// Autor:
/// William Moreira da Silva
///
/// Descrição da Alteração:
/// Apresentar mensagem quando o usúario conceder um emprestimo
/// e o muturio tiver um emprestimo anterior com suspensão temporaria,
/// porém não travar o processo
///
#endregion
#region SOL 235314/18140
///
/// Autor:
/// Jessica Y. Oshiro
///
/// Descrição da Alteração:
/// Considerar apenas dias uteis na concessão, quitação e amortização.
///
#endregion
#region SIG 32574
///
/// Autor:
/// Eliamar Tani
///
/// Data da Alteração:
/// 01/11/2016 11:17:45
///
/// Descrição da Alteração:
/// A regra para tipo de contrato estava fixa e ocasionando insatisfação na impressão de contratos.
/// O trecho com a regra foi comentada para evitar problemas posteriores
///
#endregion
#region SIG 32345
/// Autor:  
/// Darivaldo Alencar
///
/// Alteração:
/// Campo pestação básica só estava sendo atualizado ao clicar no botão calcular
///
#endregion
#region SIG 27879
/// Autor:  
/// William Moreira
///
/// Alteração:
/// Implementação da regra para calculo da taxa de Correção Monetaria
///
#endregion
#region SOL 264992 PPM 1165447
/// Autor:  
/// William Santana
///
/// Alteração:
/// correção do erro intermintente referente ao bug no componente AjaxToolKit
///
///*Possui alteraçoes na ASPX
///
#endregion
#region SOL 208770 / Kintana 2016022
///
/// Autor:
/// Felipe Azevedo dos Santos
///
/// Data da Alteração:
/// 18/03/2015
///
/// Descrição da Alteração:
/// Alteração nas opções de excepcional
///
///*Possui alteraçoes na ASPX
///
#endregion
#region SOL 237425 / PPM 504553
///
/// Autor:
/// William Moreira da Silva
///
/// Data da Alteração:
/// 08/09/2014 16:39:57
///
/// Descrição da Alteração:
/// O sistema deveria apresentar critica de bloqueio
///
#endregion
#region SOL 225057/18141 / PPM 1315874
///
/// Autor:
/// Jessica Y. Oshiro
///
/// Data da Alteração:
/// 27/04/2016 09:21:53
///
/// Descrição da Alteração:
/// Adição da label de FGQC Base e atribuição de valor da regra
///
///*Possui alteraçoes na ASPX
///
#endregion

using FUNCEF.Planus.Componentes;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.ServiceModel;
using System.Text;
using System.Threading;//BarraProgresso
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    /// <summary>
    /// Representa a página de visualização de grupos de usuários da aplicação.
    /// </summary>
    public partial class Visualizacao : PaginaSegura
    {
        #region Enumerador

        private enum VerificarContratacao { concessaoExistente = 0, suspensaoAnterior = 1 };

        #endregion

        #region Propriedades

        //Darivaldo Alencar SIG65101 -Inicio  

        private static byte atualCalcLoop
        {
            get;
            set;
        }

        private static byte qtdeCalcLoop
        {
            get;
            set;
        }

        private static bool exeDuplo
        {
            get;
            set;
        }
        //Darivaldo Alencar SIG65101 -Fim        

        //William Moreira da Silva - SOL 247419
        public static int? idBarraProgresso
        {
            get;
            set;
        }
        //William Moreira da Silva - SOL 247419

        public static int nomeRegra
        {
            get;
            set;
        }

        private int idPessoa
        {
            get
            {
                string queryString = Request.QueryString["idPessoa"];
                int numero = 0;

                int.TryParse(queryString, out numero);

                return numero;
            }
        }

        // Thiago Melo - SOL 206149 KTN 1994973
        private string matricula
        {
            get
            {
                string queryString = Request.QueryString["matricula"];

                return queryString;
            }
        }
        // Thiago Melo - SOL 206149 KTN 1994973

        /// <summary>
        /// Propriedade que mantêm o valor máximo permitido
        /// </summary>
        private double valorMaximoPermitido
        {
            get
            {
                if (this.ViewState["valorMaximoPermitido"] != null)
                    return (double)this.ViewState["valorMaximoPermitido"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["valorMaximoPermitido"] = value;
            }
        }

        private string ultimoContratoSimulado
        {
            get
            {
                if (this.ViewState["ultimoContratoSimulado"] != null)
                    return (string)this.ViewState["ultimoContratoSimulado"];
                else
                    return "";
            }
            set
            {
                this.ViewState["ultimoContratoSimulado"] = value;
            }
        }

        //barraProgresso        
        public static int Porcentagem
        {
            get;
            set;
        }

        public static byte totalRegras
        {
            get;
            set;
        }

        public static byte regraAtual
        {
            get;
            set;
        }

        public static byte totalItens
        {
            get;
            set;
        }

        public static byte itemAtual
        {
            get;
            set;
        }

        public static string mensagem
        {
            get;
            set;
        }

        public Dictionary<long, double> saldoDevedor
        {
            get
            {
                if (this.ViewState["saldoDevedor"] != null)
                    return (Dictionary<long, double>)this.ViewState["saldoDevedor"];
                else
                    return null;
            }

            set
            {
                this.ViewState["saldoDevedor"] = value;
            }
        }
        //barraProgresso

        //Campanha de Desconto
        public List<ItemDescontoContrato> descontoQuitacao
        {
            get
            {
                if (this.ViewState["descontoQuitacao"] != null)
                    return (List<ItemDescontoContrato>)this.ViewState["descontoQuitacao"];
                else
                    return null;
            }

            set
            {
                this.ViewState["descontoQuitacao"] = value;
            }
        }
        //Campanha de Desconto

        /// <summary>
        /// Propriedade que contêm id da regra de tipo de contrato
        /// </summary>
        private int? idRegraTipoContrato
        {
            get
            {
                if (this.ViewState["idRegraTipoContrato"] != null)
                    return (int?)this.ViewState["idRegraTipoContrato"];
                else
                    return null;
            }

            set
            {
                this.ViewState["idRegraTipoContrato"] = value;
            }

        }
        // Thiago Melo SOL 204452 KTN 1976411 INI
        private int? flagTrataAssinat
        {
            get
            {
                if (this.ViewState["flagtrataassinat"] != null)
                    return (int)this.ViewState["flagtrataassinat"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["flagtrataassinat"] = value;
            }
        }
        // Thiago Melo SOL 204452 KTN 1976411

        /// <summary>
        /// Propriedade que retorna se o cálculo foi efetuado com sucesso
        /// </summary>
        private bool calculoEfetuado
        {
            get
            {
                if (this.ViewState["calculoEfetuado"] != null)
                    return (bool)this.ViewState["calculoEfetuado"];
                else
                    return false;
            }

            set
            {
                this.ViewState["calculoEfetuado"] = value;
                if (!value)
                {
                    botaoContratarEp.ToolTip = "Há pendências no cálculo ou nem todas as situações obrigatórias foram satisfeitas.";
                    botaoContratarEp.Enabled = false;
            }
                else
                {
                    botaoContratarEp.ToolTip = "Contratar empréstimo.";
                    botaoContratarEp.Enabled = true;
        }

            }
        }

        /// <summary>
        /// Propriedade que retorna se ignora ou não contratos selecionados no grid "Dívidas de Empréstimos"
        /// </summary>
        private bool ignorarContratosSelecionados
        {
            get
            {
                if (this.ViewState["ignorarContratorSelecionados"] != null)
                    return (bool)this.ViewState["ignorarContratorSelecionados"];
                else
                    return true;
            }

            set
            {
                this.ViewState["ignorarContratorSelecionados"] = value;
            }
        }

        private List<Contrato> listaContratosEmAbertos
        {
            get
            {
                //return (List<Contrato>)proxyEstado.obterEstado("listaContratosEmAbertos");
                if (this.ViewState["listaContratosEmAbertos"] != null)
                    return (List<Contrato>)this.ViewState["listaContratosEmAbertos"];
                else
                    return new List<Contrato>();
            }

            set
            {
                this.ViewState["listaContratosEmAbertos"] = value;
                //proxyEstado.manterEstadoSincrono("listaContratosEmAbertos", value);
            }
        }

        //William Moreira da Silva - SOL 143476/16437
        private RelatorioContrato relatorio
        {
            get
            {
                if (this.ViewState["RelatContrato"] != null)
                    return (RelatorioContrato)this.ViewState["RelatContrato"];
                else
                    return new RelatorioContrato();
            }

            set
            {
                this.ViewState["RelatContrato"] = value;
            }
        }
        //William Moreira da Silva - SOL 143476/16437

        //Nilton 25/04/2013
        private List<ItemContrato> listaItensConcessao
        {
            get
            {
                if (this.ViewState["listaItensConcessao"] != null)
                    return (List<ItemContrato>)this.ViewState["listaItensConcessao"];
                else
                    return new List<ItemContrato>();
            }

            set
            {
                this.ViewState["listaItensConcessao"] = value;
            }
        }

        //Nilton 25/04/2013
        private int idTitular
        {
            get
            {
                if (this.ViewState["idTitular"] != null)
                    return (int)this.ViewState["idTitular"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idTitular"] = value;
            }
        }

        //Nilton 25/04/2013
        private int idMutiario
        {
            get
            {
                if (this.ViewState["idMutuario"] != null)
                    return (int)this.ViewState["idMutuario"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idMutuario"] = value;
            }
        }

        //Nilton 25/04/2013
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

        /// <summary>
        /// Mutário atual em uso na página
        /// </summary>
        private Mutuario mutuarioAtual
        {
            get
            {
                if (this.ViewState["mutuarioAtual"] == null)
                    return new Mutuario();
                else
                    return (Mutuario)this.ViewState["mutuarioAtual"];
            }

            set
            {
                this.ViewState["mutuarioAtual"] = value;
            }

        }


        private VerificarContratacao statusContratacao
        {
            get
            {
                if (this.ViewState["statusContratacao"] == null)
                    return VerificarContratacao.concessaoExistente;
                else
                    return (VerificarContratacao)this.ViewState["statusContratacao"];
            }

            set
            {
                this.ViewState["statusContratacao"] = value;
            }

        }

        /// <summary>
        /// Propriedade que retorna se a suspensão foi reaproveitada
        /// </summary>
        private bool suspensaoReaproveitada
        {
            get
            {
                if (this.ViewState["suspensaoReaproveitada"] != null)
                    return (bool)this.ViewState["suspensaoReaproveitada"];
                else
                    return false;
            }
            set
            {
                this.ViewState["suspensaoReaproveitada"] = value;
            }
        }

        //Darivaldo Alencar SIG21529 -inicio        
        private bool checouliquidozero
        {
            get
            {
                if (this.ViewState["checouliquidozero"] != null)
                    return (bool)this.ViewState["checouliquidozero"];
                else
                    return false;
            }
            set
            {
                this.ViewState["checouliquidozero"] = value;
            }
        }

        private double SaldoQuitar
        {
            get
            {
                if (this.ViewState["SaldoQuitar"] != null)
                    return (double)this.ViewState["SaldoQuitar"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["SaldoQuitar"] = value;
            }
        }

        private double ValorSolicitado
        {
            get
            {
                if (this.ViewState["ValorSolicitado"] != null)
                    return (double)this.ViewState["ValorSolicitado"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["ValorSolicitado"] = value;
            }
        }

        private double OutrosDescontos
        {
            get
            {
                if (this.ViewState["OutrosDescontos"] != null)
                    return (double)this.ViewState["OutrosDescontos"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["OutrosDescontos"] = value;
            }
        }

        private double LiquidoGeral
        {
            get
            {
                if (this.ViewState["LiquidoGeral"] != null)
                    return (double)this.ViewState["LiquidoGeral"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["LiquidoGeral"] = value;
            }
        }
        //Darivaldo Alencar SIG21529 -fim

        private double ValorUltimaPrestacaoFGQC
        {
            get
            {
                if (this.ViewState["ValorUltimaPrestacaoFGQC"] != null)
                    return (double)this.ViewState["ValorUltimaPrestacaoFGQC"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["ValorUltimaPrestacaoFGQC"] = value;
            }
        }

        private double ValorPrestacaoBase
        {
            get
            {
                if (this.ViewState["ValorPrestacaoBase"] != null)
                    return (double)this.ViewState["ValorPrestacaoBase"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["ValorPrestacaoBase"] = value;
            }
        }

        //Campanha Desconto
        private int idCalculo
        {
            get
            {
                if (this.ViewState["idCalculo"] != null)
                    return (int)this.ViewState["idCalculo"];
                else
                    return 0;
            }
            set
            {
                this.ViewState["idCalculo"] = value;
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
            //William Moreira da Silva - SOL 247087
            botaoCalcular.Visible = true;

            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "Input", "mudaCursorpadrao();", true);
            Porcentagem = 0;
            //William Moreira da Silva - SOL 247087

            if (!this.IsPostBack)
            {
                botaoContratarEp.ToolTip = "Nenhum cálculo realizado.";
                botaoContratarEp.Enabled = false;

                //BuscaDadosApiContratos(300000864897, 1);
                Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;//William Moreira da Silva - SOL 206741
                Porcentagem = 33;
                this.carregarInformacoes();
                Porcentagem = 66;
                this.verificarPermissao();
                Porcentagem = 99;
                this.carregarGridAvalista();
                gridIncluirAvalista.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                UtilidadeSistema.preencherDropDown<InstrucaoLike>(comboLike, true, EnumeradorItemPreenchimento.Nenhum);
                Porcentagem = 100;
           
                //William Moreira da Silva - SOL 143476/16437
                //relatorio = new RelatorioContrato();
                //Session.Clear();
                //William Moreira da Silva - SOL 143476/16437

                //CarregarContratosRenegociacao();

                //BotaoAcaoAbrirRenegociacao.Visible = false; //William 
            }
            else
            {
                if (checkBoxFinanciamento.Checked)
                    divPainelFH.Style["display"] = "block";
                else
                    divPainelFH.Style["display"] = "none";


                if (Request["__EVENTTARGET"] == hdnRetorno.UniqueID)
                {
                    this.carregarGridAvalista();
                }
                else
                {
                    if (!string.IsNullOrEmpty(hdnRetorno.Value))
                    {
                        hdnRetorno.Value = string.Empty;
                        this.carregarGridAvalista();
                    }
                }
            }

            //William Moreira da Silva - SOL 143476/16437
            if (Session["imprimiu"] == null)
            {
                imprimiuRelatorio.Value = "0";
            }
            else
            {
                imprimiuRelatorio.Value = Session["imprimiu"].ToString();
            }
            relatorio = (RelatorioContrato)Session["relatorio"];
            //William Moreira da Silva - SOL 143476/16437

            //labelSaldoQuitar.Text = this.hdflabelSaldoQuitar.Value;//Darivaldo Alencar SIG21529
            //caixaNumericaValorSolicitado.Text = this.hdfCaixaNumericaValorSolicitado.Value;//Darivaldo Alencar SIG21529
        }


        /// <summary>
        /// Efetua uma ação quando o valor ca caixa de seleção de Tipo de contrato é alterado.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void caixaSelecaoTipoContrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (checkBoxDesconto.Checked)
            {
                if (!modalidadesPermitidasCampanhaDesconto())
                {
                    caixaSelecaoTipoContrato.SelectedValue = ultimoContratoSimulado;
                    Porcentagem = 100;//BarraProgresso
                    return;
                }
            }
            ultimoContratoSimulado = caixaSelecaoTipoContrato.SelectedValue;           

            //65025
            if (caixaSelecaoTipoContrato.SelectedValue == "94")
            {
                checkBoxLiquidoZero.Checked = true;
                checkBoxAcordoJudicial.Checked = true;
            }

            // Thiago Melo SOL 216474 Kintana 2045796
            try
            {

                gridDividasEmprestimo.apagarSelecao(); //William Santana - SIG 53437 

                Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;//William BarraProgresso
                //Nilton 25/04/2013
                if (caixaSelecaoTipoContrato.SelectedValue != "")
                {
                    if (gridAvalista.Rows.Count > 0)
                    {
                        this.botaoExcluirAvalista.Enabled = true;
                    }


                    if (this.idTipoContrato == 0)
                    {
                        this.idTipoContrato = int.Parse(caixaSelecaoTipoContrato.SelectedValue);
                    }
                    else
                    {
                        if (int.Parse(caixaSelecaoTipoContrato.SelectedValue) != this.idTipoContrato)
                        {
                            Session["ValorDivida"] = 0;
                            Session["ValorAmortizacao"] = 0;
                            Session["ValorQuitacao"] = 0;
                        }
                        this.idTipoContrato = int.Parse(caixaSelecaoTipoContrato.SelectedValue);
                    }
                }
                else
                {
                    this.botaoExcluirAvalista.Enabled = false;
                    Porcentagem = 100;//BarraProgresso
                    return;
                }

                if (!string.IsNullOrEmpty(caixaSelecaoTipoContrato.SelectedValue))
                {
                    int idTipoContrato = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue);

                    //Se o tipo do contrato for 21 - Integralização de Reserva exibe campo
                    lblDivida.Visible = (idTipoContrato == 21);
                    caixaNumericaDividaPrevi.Visible = (idTipoContrato == 21);

                    this.carregarComboTipoSuspensao(idTipoContrato);

                    this.ignorarContratosSelecionados = true;
                    this.LimparCamposCalculados();
                    this.desabilitarCamposSuspensao();

                    //SIG 65025
                    if (idTipoContrato == 94)
                    {
                        checkBoxAcordoJudicial.Checked = true;
                        checkBoxLiquidoZero.Checked = true;
                    }

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        TipoContrato tipoContrato = cliente.contrato.consultarTipoContrato(idTipoContrato,false);
                        labelSistemaAmortizacao.Text = tipoContrato.SistemaAmortizacao;
                    }                    

                    this.calcularConcessao(this.mutuarioAtual, idTipoContrato, null); //NILTON - SOL201223 KTN1944823 - 21/02/2013 
                    ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "Concessão", "ConcessaoAcordoJudicial();", true);
                }
                else
                {
                    this.calculoEfetuado = false;
                    registrarAlerta("Tipo do contrato obrigatório.");
                }
            }
            finally
            {
                if (caixaDataPrimeiraParcela.horarioVerao)
                {
                    atribuiDtHorarioVerao();
                }

                botaoCalcular.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "Input", "mudaCursorpadrao();", true);
            }		
        }

        //Nilton
        private bool ValidarSessionInputRegra()
        {
            if (Session["ValorDivida"] != null)
            {
                if (float.Parse(Session["ValorDivida"].ToString()) > 0)
                {
                    return true;
                }
            }
            //else //William Moreira da Silva - SOL 235732
            if (Session["ValorAmortizacao"] != null)
            {
                if (float.Parse(Session["ValorAmortizacao"].ToString()) > 0)
                {
                    return true;
                }
            }

            //else //William Moreira da Silva - SOL 235732
            if (Session["ValorQuitacao"] != null)
            {
                if (float.Parse(Session["ValorQuitacao"].ToString()) > 0)
                {
                    return true;
                }
            }

            return false;
        }

        //Nilton
        private List<int> VerificaRegrasInput(TipoContrato tipoContrato, List<int> listaRegrasInput)
        {
            List<int> listaRegras = new List<int>();

            for (int i = 0; i < listaRegrasInput.Count; i++)
            {
                if (tipoContrato.regraDataCredito.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraElegibilidade.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraJurosConcessao.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraLimites.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraMargem.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraPrazoMaximo.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraPrazosConcessao.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraPrimeiraParcela.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraQuitado.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraReservaPoupanca.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraSalarioBase.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

                if (tipoContrato.regraValor != null)
                {
                    if (tipoContrato.regraValor.id == listaRegrasInput[i])
                        listaRegras.Add(listaRegras[i]);
                }


                if (tipoContrato.regraValorMaximo.id == listaRegrasInput[i])
                    listaRegras.Add(listaRegras[i]);

            }

            listaRegras.Add(24768);//William Moreira da Silva - SOL 235732

            return listaRegras;
        }

        //Nilton
        private void AbrirPopupRegrasInput(List<int> listaRegra)
        {
            string listaregras = "";

            //William Moreira da Silva - SOL 235732
            //listaRegra.Add(1000);
            //listaRegra.Add(2000);
            //listaRegra.Add(3000);
            //listaRegra.Add(4000);
            //William Moreira da Silva - SOL 235732

            for (int i = 0; i < listaRegra.Count; i++)
            {
                listaregras = listaregras + "|" + listaRegra[i].ToString();
            }

            //William Moreira da Silva - SOL 235732
            //string script = String.Format("exibirDialogo('PopupInputRegra.aspx?listaregras={0}', 500, 200); return false;", listaregras);
            string script = String.Format("exibirDialogo('PopupInputRegra.aspx?listaregras={0}', 500, 200);", listaregras);
            //botaoOcultoPopupInputRegra.OnClientClick = script;

            //this.ClientScript.RegisterStartupScript(this.GetType(), "input", "<script>document.getElementById('" + botaoOcultoPopupInputRegra.ClientID + "').click();</script>");
            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "Input", script, true);

            //William Moreira da Silva - SOL 235732
        }


        // Xavier SOL 178579
        protected void caixaSelecaoGrupoExcepcional_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        // Xavier SOL 178579

        protected void ListaDropDownSuspensaoCobranca_SelectedIndexChanged(object sender, EventArgs e)
        {
            Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;//William Moreira da Silva

            //Verifica se foi Informada data de crédito
            if (!caixaDataCredito.valorData.HasValue)
            {
                this.desabilitarCamposSuspensao();
                registrarAlerta("Data de Crédito obrigatória.");
                return;
            }

            try
            {
                if (!String.IsNullOrEmpty(ListaDropDownSuspensaoCobranca.SelectedValue))
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        TipoSuspensao tipoSuspensao = null;
                        List<TipoSuspensao> tipos = cliente.contrato.consultarTipoSuspensao(Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue), Convert.ToInt32(ListaDropDownSuspensaoCobranca.SelectedValue));

                        if (tipos != null && tipos.Count > 0)
                        {
                            //Parâmetros Regra
                            IDictionary<string, object> parametros = new Dictionary<string, object>();
                            //parametros.Add("IDMUTUARIO_P", Convert.ToInt32(proxyEstado.obterEstado("idMutuario")));
                            parametros.Add("IDMUTUARIO_P", this.idMutiario);//Nilton 25/04/2013
                            parametros.Add("IDCONTRATO_P", null);
                            parametros.Add("IDCONTRATOAQUITAR_P", null);
                            parametros.Add("DATACREDITO_P", caixaDataCredito.valorData);
                            parametros.Add("IDTIPOCONTRATO_P", Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue));
                            parametros.Add("IDOPERACAO_P", TipoOperacao.concessao.chave);
                            parametros.Add("IDTIPOSUSPENSAO_P", Convert.ToInt32(ListaDropDownSuspensaoCobranca.SelectedValue));
                            parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(checkBoxExcepcional.Checked));
                            parametros.Add("NUMPARCELA_P", Convert.ToInt32(caixaNumericaPrazo.Text));
                            parametros.Add("DATAINICIOANT_P", null);
                            parametros.Add("QTDMESES_P", null);

                            if (this.suspensaoReaproveitada)
                                parametros.Add("FLGQUITA_P", 1);
                            else
                                parametros.Add("FLGQUITA_P", 0);

                            tipoSuspensao = tipos[0];

                            try
                            {
                                object retornoRegra = cliente.contrato.executarRegra(tipoSuspensao.regraSuspensao, parametros);

                                int mesesRegra;

                                if (int.TryParse(retornoRegra.ToString(), out mesesRegra))
                                {
                                    caixaNumericaSuspensao.Enabled = true;
                                    caixaNumericaSuspensao.valorMinimo = 1;
                                    caixaNumericaSuspensao.valorMaximo = mesesRegra;
                                    caixaNumericaSuspensao.Text = mesesRegra.ToString();

                                    //Zera valor solicitado
                                    caixaNumericaValorSolicitado.valor = null;

                                    //Mutuario mutuario = (Mutuario)this.proxyEstado.obterEstado("mutuario");
                                    this.calcularConcessao(this.mutuarioAtual, Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue), null); //NILTON - SOL201223 KTN1944823 - 21/02/2013
                                }
                                else
                                {
                                    this.desabilitarCamposSuspensao();
                                }
                            }
                            catch (FaultException<ContratoFaltaNegocio> erro)
                            {
                                string msg = this.tratarMensagem(erro.Detail.mensagemErro);
                                this.registrarAlerta(msg);
                                this.desabilitarCamposSuspensao();
                            }
                        }
                    }
                }
                else
                {
                    this.desabilitarCamposSuspensao();
                    //Mutuario mutuario = (Mutuario)this.proxyEstado.obterEstado("mutuario");
                    this.calcularConcessao(this.mutuarioAtual, Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue), null);//NILTON - SOL201223 KTN1944823 - 21/02/2013
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlerta(erro.Detail.mensagemErro);
            }
            Porcentagem = 100;
        }

        /// <summary>
        /// Executa quando o botão Contratar Ep é pressionado.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoContratarEp_Click(object sender, EventArgs e)
        {
            try
            {
                Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;//William Moreira da Silva - SOL 206741
                relatorio = (RelatorioContrato)Session["relatorio"];               

                if (chkImpressaoContrato.Checked == true) { 
                    //SIG 63057
                    if (Session["ContratoHTML"] == null)
                    {
                        this.registrarAlerta("Faz-se necessário gerar o contrato do empréstimo antes de efetivar a concessão.");
                        return;
                    }
                }

                //Nilton 25/04/2013
                int idTitular = this.idTitular;//(int)proxyEstado.obterEstado("idTitular"); //Nilton 12/03/2013 
                int idMutuario = this.idMutiario; //(int)proxyEstado.obterEstado("idMutuario");
                int idTipoContrato = this.idTipoContrato;//(int)proxyEstado.obterEstado("idTipoContrato");
                String aviso = string.Empty;//William Moreira da Silva - SIG 27369

                //SIG 67808 - Campanha Descontos- Matias
                //PrepararAmbienteCampanhaDescontos(idTipoContrato);

                //SIG 67808 - Campanha Descontos- Matias
                if (!CompararPrestAnteriorPrestBase(idTipoContrato) && !checkBoxOutros.Checked)
                {
                    return;
                }

                if (string.IsNullOrEmpty(caixaSelecaoTipoContrato.SelectedValue))
                {
                    this.registrarAlerta("Tipo do contrato obrigatório.");
                    return;
                }

                //William Moreira da Silva - SIG 27369 - Inicio
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    string contratosSelecionados = buscaContratosSelecionados();

                    TipoContrato tipoContrato = cliente.contrato.ConsultarTipoContrato(int.Parse(caixaSelecaoTipoContrato.SelectedValue));
                    cliente.contrato.consultarContratosAnteriores(idTitular, idMutuario, Convert.ToDateTime(caixaDataCredito.Text), tipoContrato.tipoEmprestimo.id, 1, idTipoContrato, checkBoxOutros.Checked, out aviso, contratosSelecionados);

                    if (!String.IsNullOrEmpty(aviso))
                    {
                        this.registrarAlerta(aviso);
                        return;
                    }
                }
                //William Moreira da Silva - SIG 27369 - Fim


                //William Moreira da Silva SOL 238689
                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    string usuario = Contexto.obterUsuario();

                    if (cliente.contrato.verificaMutuario(idMutuario, usuario))
                    {
                        this.registrarAlerta(MensagensAplicacao.instancia.mensagem043);
                        return;
                    }
                }
                //William Moreira da Silva SOL 238689

                Porcentagem = 5;//William Moreira da Silva - SOL 206741

                //SIG 130294 - Inclusão de 2 novas modalidades de credplan 13 fev/nov variável - retirada do bloco de verifiação de permissionamento
                // SOL 204001
                //bool bPermissao = false;
                //if (!String.IsNullOrEmpty(caixaSelecaoTipoContrato.SelectedValue))
                //    bPermissao = validarPermissaoTipoContrato(long.Parse(caixaSelecaoTipoContrato.SelectedValue));

                //if (!bPermissao)
                //{
                //    registrarAlerta("Não há permissão para contratação desta modalidade, entre em contato com o gestor do empréstimo");
                //    return;
                //}
                // SOL 204001

                //William Moreira da Silva SOL 205183 KTN 1984449
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    //String aviso = string.Empty;//William Moreira da Silva - SIG 27369

                    List<long> listaObterContratoEmptmo = new List<long>();
                    listaObterContratoEmptmo = cliente.contrato.obterContratoEmptmo(idTitular, idMutuario, Convert.ToDateTime(caixaDataCredito.Text));

                    foreach (var idContrato in listaObterContratoEmptmo)
                    {
                        long idContratoEmptmo = idContrato;

                        // Se não for excepcionalizar a inadimplência, então verifica se tem itens abertos
                        if (!checkBoxInadimplencia.Checked)  // Felipe A. Santos SOL 208770 Kintana 2016022
                        {
                            cliente.contrato.existemItensEmAberto(idContratoEmptmo, true, Convert.ToDateTime(caixaDataCredito.Text), true, Convert.ToDateTime(caixaDataCredito.Text).Year, Convert.ToDateTime(caixaDataCredito.Text).Month, out aviso);
                        }

                        if (!String.IsNullOrEmpty(aviso))
                        {
                            this.registrarAlerta(aviso);
                            return;
                        }
                    }



                }
                //William Moreira da Silva SOL 205183 KTN 1984449

                if (!caixaNumericaValorSolicitado.valor.HasValue || caixaNumericaValorSolicitado.valor <= 0d)
                {
                    this.registrarAlerta("Valor solicitado não foi informado.");
                    return;
                }

                if (!this.verificarValorSolicitado())
                    return;

                if (!this.validarValorMaximo())
                    return;

                //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
                if (!this.verificaDataUtil(Convert.ToDateTime(caixaDataCredito.Text)))
                { 
                    this.registrarAlerta("A data do crédito deve ser um dia útil.");
                    return;
                }
                //Jessica Y. Oshiro - SOL 235314-18140 - FIM

                // Valida se os campos foram alterados.
                //if (!this.validarCampos())
                //{
                //    this.registrarAlerta("Alguns campos foram alterados, por favor execute o cálculo novamente.");
                //    return;
                //}

                //William Moreira da Silva - SOL 143476/16437
                if (Session["imprimiu"] == "0" && relatorio.impresso == 1)
                {
                    this.registrarAlerta("Houve alteração nas condições contratuais. É necessário imprimir um novo contrato.");
                    return;
                }
                //William Moreira da Silva - SOL 143476/16437

                //William Moreira da Silva - SOL 259931 PPM 1023671
                if (!this.verificarAssinaturaEOutrasDividas(idTitular, idMutuario, idTipoContrato, this.flagTrataAssinat))
                {
                    //William Moreira da Silva - SOL 263521 PPM 1122871
                    return;
                    //this.verificarConcessaoExistente(idMutuario, Convert.ToDateTime(caixaDataCredito.Text), idTipoContrato);
                    //William Moreira da Silva - SOL 263521 PPM 1122871
                }
                //William Moreira da Silva - SOL 259931 PPM 1023671

                //Se o cálculo não foi concluído
                if (!calculoEfetuado)
                {
                    this.registrarAlerta("Cálculo não foi efetuado com sucesso.");
                    return;
                }

                // Felipe A. Santos SOL 219054 KTN 2058728  
                if (!caixaDataAssinatura.valorData.HasValue)
                {
                    this.registrarAlerta("O campo data de assinatura é de preenchimento obrigatório");
                    return;
                }

                if (caixaDataAssinatura.valorData.Value > DateTime.Today)
                {
                    this.registrarAlerta("A data de assinatura não pode ser maior que a data de hoje");
                    return;
                }
                // Felipe A. Santos SOL 219054 KTN 2058728   - fim

                //William Moreira da Silva - SOL 227455
                if (float.Parse(labelLiquidoGeral.Text) < 0 && !checkBoxExcepcional.Checked)
                {
                    this.registrarAlerta("O valor líquido de concessão não pode ser menor que ZERO!");
                    return;
                }
                //William Moreira da Silva - SOL 227455

                this.verificaParcelas();

                //int idMutuario = (int)proxyEstado.obterEstado("idMutuario");
                //int idTipoContrato = (int)proxyEstado.obterEstado("idTipoContrato");

                ////Verifica assinatura e outras dividas
                //if (this.verificarAssinaturaEOutrasDividas(idMutuario, idTipoContrato))
                //{
                    this.verificarConcessaoExistente(idMutuario, Convert.ToDateTime(caixaDataCredito.Text), idTipoContrato);
                //}

                Porcentagem = 20;//William Moreira da Silva - SOL 206741
                //Verifica assinatura e outras dividas
                // Thiago Melo SOL 204452 KTN 1976411 
                //William Moreira da Silva - SOL 259931 PPM 1023671
                //if (this.verificarAssinaturaEOutrasDividas(idTitular, idMutuario, idTipoContrato, this.flagTrataAssinat)) //Nilton 12/03/2013
                //{
                //    this.verificarConcessaoExistente(idMutuario, Convert.ToDateTime(caixaDataCredito.Text), idTipoContrato);
                //}
                //William Moreira da Silva - SOL 259931 PPM 1023671
                // Thiago Melo SOL 204452 KTN 1976411
            }
            finally
            {
                Porcentagem = 100;//William Moreira da Silva - SOL 206741

                // Thiago Melo SOL 216474 Kintana 2045796
                if (caixaDataPrimeiraParcela.horarioVerao)
                {
                    atribuiDtHorarioVerao();
                }
                // Thiago Melo SOL 216474 Kintana 2045796
            }
        }

        /// <summary>
        /// Executa quando o botão oculto continuar contratação de EP é pressionado.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoOcultoContinuarContratacaoEP_Click(object sender, EventArgs e)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                this.continuarContratacaoEp(cliente, true);
            }
        }

        /// <summary>
        /// Executa quando o botão oculto continuar contratação de EP é pressionado.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoOcultoContinuarContratacaoEP1_Click(object sender, EventArgs e)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                this.continuarContratacaoEp(cliente, false);
            }
        }

        //Darivaldo Alencar SIG 65101 -inicio
        protected void calcularConcess(string btnClicou)
        {
            for (byte i = 1; i <= qtdeCalcLoop; i++)
            {
                if (i == qtdeCalcLoop)
                    ignorarPorcentagemCalculoAnterior = false;
                else
                    ignorarPorcentagemCalculoAnterior = true;

                atualCalcLoop = i;

                this.calcularConcessao(this.mutuarioAtual, idTipoContrato, btnClicou);
            }
        }
        //Darivaldo Alencar SIG 65101 -fim


        /// <summary>
        /// Executa quando o botão oculto continuar contratação de EP é pressionado.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoCalcular_Click(object sender, EventArgs e)
        {
            //William Moreira da Silva - SOL 143476/16437
            Session["imprimiu"] = "0";
            //William Moreira da Silva - SOL 143476/16437

			//Jessica Y. Oshiro - SOL 235314-18140 -INICIO
			try
			{			
                if (!string.IsNullOrEmpty(caixaDataCredito.Text))
                {
				if (!this.verificaDataUtil(Convert.ToDateTime(caixaDataCredito.Text)))
				{
					this.registrarAlerta("A data do crédito deve ser um dia útil.");
					return;
				}	
			}
            }
			finally
			{
				Porcentagem = 100;
			}
			//Jessica Y. Oshiro - SOL 235314-18140 -INICIO

            Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;//William Moreira da Silva
            //INICIO - NILTON - SOL201705 KTN1950511 - 15/03/2013
            if (!string.IsNullOrEmpty(hdfPrazoDigitado.Value))
            {
                if (hdfPrazoDigitado.Value != caixaNumericaPrazo.Text)
                {
                    //caixaNumericaValorSolicitado.valor = 0d; //Taffarel - SIG84025
                }
            }
            //FINAL - NILTON - SOL201705 KTN1950511 - 15/03/2013
            //William Moreira da Silva - SOL 204313 KTN 1975025            
            // Thiago Melo SOL 204910 (a alteração do nilton (SOL201705) havia sido inibita, voltou a estar ativa)

            if (!string.IsNullOrEmpty(caixaSelecaoTipoContrato.SelectedValue))
            {
                int idTipoContrato = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue);
                //Mutuario mutuario = (Mutuario)this.proxyEstado.obterEstado("mutuario");

                //Campanha Desconto
                //Darivaldo Alencar SIG 65101 -inicio
                this.calcularConcessao(this.mutuarioAtual, idTipoContrato, "btnCalcular");//NILTON - SOL201223 KTN1944823 - 21/02/2013

                //qtdeCalcLoop = 3;
                //calcularConcess("btnCalcular");
                //Darivaldo Alencar SIG 65101 -fim
            }
            else
            {
                this.calculoEfetuado = false;
                registrarAlerta("Tipo do contrato obrigatório.");
                Porcentagem = 100;//William Moreira da Silva - SOL 247087
            }
        }

        //William Moreira da Silva - 143476/16437
        /// <summary>
        /// Abre o formulário para acrescentar informações a serem impressas
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void BotaoImprimir_Click(object sender, EventArgs e)
        {
            //Campanha Desconto
            List<DescontoInadimplencia> listaDescontos = new List<DescontoInadimplencia>();
            try
            {
                Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;

                //SIG 32574 - Regra não está claramente definida - Eliamar Tani - Início
                /*
                //Verifica o tipo de contrato
                switch (caixaSelecaoTipoContrato.SelectedValue)
                {
                    case "82":
                    case "83":
                    case "84":
                    case "85":
                        break;
                    default:
                        this.registrarAlerta("Tipo de contrato inválido ou não selecionado.");
                        return;
                }
                */
                if (string.IsNullOrEmpty(caixaSelecaoTipoContrato.SelectedValue))
                {
                    this.registrarAlerta("Tipo de contrato inválido ou não selecionado.");
                }
                //SIG 32574 - Eliamar Tani - Fim

                if (caixaNumericaValorSolicitado.valor != null)
                {
                    // Valida se os campos foram alterados.
                    if (!this.verificarValorSolicitado())
                        return;
                }
                else
                {
                    this.registrarAlerta("Alguns campos foram alterados, por favor execute o cálculo novamente.");
                    return;
                }

                if (!this.validarValorMaximo())
                    return;

                if (!this.validarCampos())
                {
                    this.registrarAlerta("Alguns campos foram alterados, por favor execute o cálculo novamente.");
                    return;
                }

                //Necessário exatamente uma conta bancária
                int idContaCorrente = 0;
                if (!this.verificaContaSelecionada(out idContaCorrente))
                    return;
                //Verifica se a conta é Caixa Economica Federal
                if (!this.verificaContaCaixa(idContaCorrente))
                    return;

                //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
                if (!this.verificaDataUtil(Convert.ToDateTime(caixaDataCredito.Text)))
                {
                    this.registrarAlerta("A data do crédito deve ser um dia útil.");
                    return;
                }
                
                if (!caixaDataAssinatura.valorData.HasValue)
                {
                    this.registrarAlerta("O campo data de assinatura é de preenchimento obrigatório");
                    return;
                }
                //Jessica Y. Oshiro - SOL 235314-18140 -FIM
                //Necessario exatamente dois fiadores avalistas para mutuario autopatrocinado
                if (this.mutuarioAtual.flginternoParticipante.ToUpper().Equals("MA") || this.mutuarioAtual.flginternoParticipante.ToUpper().Equals("CA") && this.mutuarioAtual.id == this.mutuarioAtual.idTitular)
                {
                    if (gridAvalista.Rows.Count > 2)
                    {
                        this.registrarAlerta("Selecione somente dois fiadores.");
                        return;
                    }
                    else if (gridAvalista.Rows.Count < 2)
                    {
                        this.registrarAlerta("É obrigatória a indicação de pelo menos dois fiadores.");
                        return;
                    }
                    }


                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    relatorio = cliente.contrato.buscaInfoImpressaoContrato(mutuarioAtual.id);
                    Porcentagem = 50;

                    //Campanha Desconto
                    using (Cliente<IServicoConcessao> client = new Cliente<IServicoConcessao>())
                    {
                        relatorio.tipoContrato = client.contrato.ConsultarTipoContrato(idTipoContrato);
                    }

                    relatorio.mutuario = mutuarioAtual;
                    relatorio.conta = new DadosBancarios() { id = idContaCorrente };
                    relatorio.valorMaximo = double.Parse(caixaNumericaValorMaximoPermitido.Text);
                    relatorio.prazo = int.Parse(caixaNumericaPrazo.Text);
                    relatorio.valorSolicitado = double.Parse(caixaNumericaValorSolicitado.Text);

                    //SIG 63057
                    relatorio.DataCredito = caixaDataCredito.valorData;
                    relatorio.dataAssinatura = (DateTime)caixaDataAssinatura.valorData;
                    if (idContaCorrente > 0)
                        relatorio.conta = cliente.contrato.consultarContaBancaria(0, relatorio.conta.id, 0)[0];
                    //---------

                    //William Santana - SIG 50871 
                    DateTime dataAssinatura = (caixaDataAssinatura.valorData == null ? DateTime.Now : caixaDataAssinatura.valorData.Value);

                    RelatorioContrato taxas = cliente.contrato.buscaInfoTaxas(caixaSelecaoTipoContrato.SelectedValue, dataAssinatura); 
                    
                    relatorio.txfgqc34 = taxas.txfgqc34;
                    relatorio.txfgqc35a49 = taxas.txfgqc35a49;
                    relatorio.txfgqc50a59 = taxas.txfgqc50a59;
                    relatorio.txfgqc60a74 = taxas.txfgqc60a74;
                    relatorio.txfgqc75a84 = taxas.txfgqc75a84;
                    relatorio.txfgqc85 = taxas.txfgqc85;
                    relatorio.txjuros24 = taxas.txjuros24;
                    relatorio.txjuros25a48 = taxas.txjuros25a48;
                    relatorio.txjuros49a72 = taxas.txjuros49a72;
                    relatorio.txjuros73a96 = taxas.txjuros73a96;
                    relatorio.txjuros97a120 = taxas.txjuros97a120;
                    relatorio.txjuros12 = taxas.txjuros12;
                    relatorio.txjuros13a24 = taxas.txjuros13a24;
                    relatorio.txjuros25a36 = taxas.txjuros25a36;
                    relatorio.txjuros37a48 = taxas.txjuros37a48;
                    relatorio.txjuros13sal = taxas.txjuros13sal;
                    relatorio.txadm = taxas.txadm;
                    relatorio.dtiniciovegencia = taxas.dtiniciovegencia;

                    //William Santana - SIG 50871 

                    if (checkBoxFinanciamento.Checked)
                    {
                        relatorio.financiamento = true;
                        //Saulo Cirineu
                        relatorio.valorFinanciamento = double.Parse(caixaNumericaFH.Text);
                        //if (Session["ValorQuitacao"] != null)
                        //{
                        //    relatorio.valorFinanciamento = double.Parse(Session["ValorQuitacao"].ToString());
                        //}
                        }

                    if (gridDividasEmprestimo.chavesSelecionadas.Count > 0)
                    {
                        int registros = gridDividasEmprestimo.chavesSelecionadas.Count;

                        for (int i = 0; i < registros; i++)
                        {
                            DataKey dataKey = gridDividasEmprestimo.chavesSelecionadas[i];
                            relatorio.contratosQuitados = relatorio.contratosQuitados + ", " + dataKey.Values[0].ToString();
                            long numeroContrato = (long)dataKey.Values[0];

                            //Campanha Desconto
                            //SIG 67808
                            if (checkBoxDesconto.Checked == true)
                            {
                                relatorio.PropostaCampanha = 3;
                                relatorio.conta = cliente.contrato.consultarContaBancaria(0, relatorio.conta.id, 0)[0];

                                descontoQuitacao = obterDesconto(numeroContrato);
                                double SaldoDevedor = (saldoDevedor.ContainsKey(numeroContrato) ? saldoDevedor[numeroContrato] : 0);

                                DescontoInadimplencia descontos = new DescontoInadimplencia();
                                using (Cliente<IServicoConcessao> Cliente = new Cliente<IServicoConcessao>())
                                {
                                    DateTime dataCredito = caixaDataCredito.valorData.Value;
                                    descontos = Cliente.contrato.BuscaInadimplenciaDesconto(numeroContrato, mutuarioAtual.id, dataCredito, 3, SaldoDevedor, descontoQuitacao, this.idCalculo);

                        }

                                using (Cliente<IServicoContrato> Cliente = new Cliente<IServicoContrato>())
                                {
                                    Contrato contrato = Cliente.contrato.consultarContrato((long)dataKey.Values[0]);
                                    descontos.dataCredito = (DateTime)contrato.dataCredito;
                                    descontos.modalidadeEmprestimo = contrato.tipo.descricao;
                                }
                                relatorio.descontoInadimplencia.Add(descontos);
                            }
                            //Fim - Campanha Desconto
                        }
                        relatorio.contratosQuitados = relatorio.contratosQuitados.Remove(0, 2);
                    }

                    relatorio.fiadores = new Avalistas[2];
                    if (gridAvalista.Rows.Count > 0)
                    {
                        int fiador1 = 0;
                        int fiador2 = 0;

                        DataKey k1 = gridAvalista.DataKeys[0];
                        fiador1 = (int)k1.Values[0];
                        relatorio.fiadores[0] = cliente.contrato.consultarAvalistaPessoa(fiador1);

                        if (gridAvalista.Rows.Count > 1)
                        {
                            DataKey k2 = gridAvalista.DataKeys[1];
                            fiador2 = (int)k2.Values[0];
                            relatorio.fiadores[1] = cliente.contrato.consultarAvalistaPessoa(fiador2);
                        }
                        else
                        {
                            relatorio.fiadores[1] = new Avalistas() { id = 0 };
                        }
                    }
                        else
                        {
                        relatorio.fiadores = new Avalistas[] { new Avalistas() { id = 0 }, new Avalistas() { id = 0 } };
                        }

                    //Campanha Desconto
                     relatorio.CampanhaDesconto = checkBoxDesconto.Checked;

                    string guid = Guid.NewGuid().ToString();
                    this.proxyEstado.manterEstadoSincrono(guid, relatorio);

                    //Abrir o form em um popup
                    String strurl = String.Format("PopupImpressaoContrato.aspx?guidImpressao={0}", guid);

                    //abrir a janela com a função exibirDialogo bem como showModalDialog não permite a impressao do contrato em pdf                   
                    String strscript = "window.open('" + strurl + "', 'name','height=680,width=920,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup para impressao de contrato", strscript, true);
                }
            }

            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
            finally
            {
                Porcentagem = 100;
            }
        }
        //William Moreira da Silva - 143476/16437

        // Xavier 199759
        /// <summary>
        /// Abre o Popup para selecionar o Avalista a ser incluido.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoIncluirAvalista_Click(object sender, EventArgs e)
        {
            this.carregarGridAvalista();
        }

        /// <summary>
        /// Exclui o avalista selecionado na grid.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoExcluirAvalista_Click(object sender, EventArgs e)
        {
            //William Moreira da Silva - SOL 199759
            if (gridAvalista.Rows.Count > 0)
            {
                for (int i = 0; i < gridAvalista.Rows.Count; i++)
                {
                    var chk = gridAvalista.Rows[i].FindControl("CheckBoxButton") as CheckBox;
                    if (chk != null && chk.Checked)
                    {
                        List<Avalistas> ListaAvalistas = new List<Avalistas>();
                        ListaAvalistas = (List<Avalistas>)Session["Avalista"];

                        DataKey datakey = gridAvalista.DataKeys[i];
                        ListaAvalistas.Remove(ListaAvalistas.Find(t1 => t1.id == Int32.Parse(datakey.Values["id"].ToString())));
                        ListaAvalistas.Remove(ListaAvalistas.Find(t1 => t1.idConjugue == Int32.Parse(datakey.Values["id"].ToString())));//William Moreira da Silva - SOL 143476/16437
                        Session["Avalista"] = ListaAvalistas;
                    }
                }
                this.carregarGridAvalista();
            }
            //William Moreira da Silva - SOL 199759
            Porcentagem = 100;
        }

        /// <summary>
        /// carrega o grid do Avalista.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoAtualizarAvalista_Click(object sender, EventArgs e)
        {
            this.carregarGridAvalista();
        }

        protected void gridOutrasDividas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gridOutrasDividas.PageIndex = e.NewPageIndex;
            this.carregarGridAvalista();
            gridOutrasDividas.DataBind();
        }

        // Xavier 199759

        protected void gridDividasEmprestimo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox campo = (CheckBox)e.Row.FindControl("CheckBoxButton");

                Contrato contrato = (Contrato)e.Row.DataItem;

                ButtonField btn = new ButtonField();

                Boolean acao = Convert.ToBoolean(contrato.quitacaoObrigatoria);

                campo.AutoPostBack = !acao;
                campo.Enabled = !acao;

                if (this.ignorarContratosSelecionados)
                {
                    campo.Checked = acao;
                }

            }
        }

        protected void campo_CheckedChanged(object sender, EventArgs e)
        {
            this.ignorarContratosSelecionados = false;

            //Calcula concessão
            //Mutuario mutuario = (Mutuario)this.proxyEstado.obterEstado("mutuario");
            this.calcularConcessao(this.mutuarioAtual, int.Parse(caixaSelecaoTipoContrato.SelectedValue), null); //NILTON - SOL201223 KTN1944823 - 21/02/2013

        }

        #endregion

        #region Métodos Privados

        #region Auxiliares

        /// <summary>
        /// Limpa campos calculados
        /// </summary>
        private void LimparCamposCalculados()
        {
            caixaDataCredito.valorData = null;
            caixaDataPrimeiraParcela.valorData = null;
            caixaNumericaSalarioBase.valor = null;
            caixaNumericaValorSolicitado.valor = null;
            caixaNumericaMargemConsignavel.valor = null;
            caixaNumericaPrazo.Text = "0";
            caixaNumericaPrazo.valorMaximo = 0;
            caixaNumericaPrazo.valorMinimo = 0;
        }

        /// <summary>
        /// Obtém contratos em abertos selecionados
        /// </summary>
        private List<long> obterContratosSelecionados()
        {
            int registros = 0;
            List<Contrato> NovaLista = new List<Contrato>();
            string numContrato = string.Empty;

            //if (this.ignorarContratosSelecionados)
            //{
            //    return new List<long>();
            //}

            List<long> contratosSelecionados = new List<long>();

            if (gridDividasEmprestimo.chavesSelecionadas.Count > 0)
            {
                registros = gridDividasEmprestimo.chavesSelecionadas.Count;

                for (int i = 0; i < registros; i++)
                {
                    DataKey dataKey = gridDividasEmprestimo.chavesSelecionadas[i];
                    contratosSelecionados.Add((long)dataKey.Values[0]);
                }
            }
            else
            {
                contratosSelecionados = new List<long>();
            }


            if (idTipoContrato == 95 || idTipoContrato == 96 || idTipoContrato == 97)
            {
                if (contratosSelecionados.Count > 0)
                {
                    //this.listaContratosEmAbertos.Single(x => x.numero.Equals((long)dataKey.Values[0])).quitar = true;

                    //Contrato  contrato = this.listaContratosEmAbertos.Single(x => x.numero.Equals((long)dataKey.Values[0]));
                    // if (contrato != null)
                    // {
                    //     contrato.quitar = true;
                    // }
                    // NovaLista.Add(contrato);

                    foreach (var contrato in this.listaContratosEmAbertos)
                    {
                        if (contratosSelecionados.Find(x => x.Equals(contrato.numero)) > 0)
                        {
                            this.listaContratosEmAbertos.Single(x => x.numero.Equals(contrato.numero)).quitar = true;
                        }
                        else
                        {
                            this.listaContratosEmAbertos.Single(x => x.numero.Equals(contrato.numero)).quitar = false;
                        }

                    }
                }
                else
                {
                    Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>();
                    List<Contrato> listaContratos = cliente.contrato.BuscarContratosAbertos(this.mutuarioAtual.id, this.mutuarioAtual.idTitular, 5, idTipoContrato, DateTime.Now.Date);

                    foreach (var item in listaContratos)
                    {
                        contratosSelecionados.Add((long)item.numero);
                        item.quitar = true;
                    }
                }
            }


            return contratosSelecionados;

        }

        // SOL 199759
        /// <summary>
        /// Obtém Avalistas selecionados
        /// </summary>
        private List<Int32> obterAvalistasSelecionados()
        {

            List<Int32> avalistasSelecionados = new List<Int32>();

            if (gridAvalista.chavesSelecionadas.Count > 0)
            {

                int registros = gridAvalista.chavesSelecionadas.Count;

                for (int i = 0; i < registros; i++)
                {
                    DataKey dataKey = gridAvalista.chavesSelecionadas[i];
                    avalistasSelecionados.Add((Int32)dataKey.Values[0]);
                }

            }
            else
            {
                avalistasSelecionados = new List<Int32>();
            }

            return avalistasSelecionados;

        }
        // SOL 199759

        /// <summary>
        /// Carrega os dados da tela.
        /// </summary>
        private void carregarInformacoes()
        {
            // Carrega o Combo tipo de contratos.
            this.carregarComboTipoContrato();

            // Carrega o combo indexador.
            this.carregarComboIndexador();

            // Carrega o Label hora de encerramento do sistema.
            this.carregarParametrosSistema();

            // Obtem os dados do mutuário.
            Mutuario mutuario = new Mutuario();
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                mutuario = cliente.contrato.obterDadosMutuario(this.matricula); // Thiago Melo SOL 206149
                //Session["inscricaoPrevidenciaria"] = mutuario.inscricaoPrevidenciaria; // SOL 199759
            }

            // Carrega os dados do mutuário.
            this.carregarDadosMutuario(mutuario);

            hdfIdPessoa.Value = this.idPessoa.ToString();

            //Data atual.
            //caixaDataAssinatura.valorData = DateTime.Today; // Felipe A. Santos SOL 219054 KTN 2058728  
            caixaDataSolicitacao.valorData = DateTime.Today;

            caixaNumericaValorSolicitado.valor = 0d;

            //this.proxyEstado.manterEstadoSincrono("mutuario", mutuario);
            this.mutuarioAtual = mutuario;

            this.caixaNumericaSuspensao.valorMinimo = 0;
            this.caixaNumericaSuspensao.valorMaximo = 0;
            this.caixaNumericaSuspensao.Enabled = false;

            // Xavier SOL 178579
            // Carrega o Combo Grupo Excepcional.
            this.carregarComboGrupoExcepcional();
            // Xavier SOL 178579

        }

        /// <summary>
        /// Carrega o Combo de Tipo de Contrato.
        /// </summary>
        private void carregarComboTipoContrato()
        {
            List<TipoContrato> listaTipoContrato = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listaTipoContrato = cliente.contrato.listarTipoContrato();
            }

            UtilidadesPagina.preencherDropDown(caixaSelecaoTipoContrato, listaTipoContrato, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "descricao", "id");
        }

        // xavier SOL 178579

        /// <summary>
        /// Carrega o Combo Grupo Excepcional.
        /// </summary>
        private void carregarComboGrupoExcepcional()
        {
            List<Grupoexcepcional> listaGrupoExcepcional = null;
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                listaGrupoExcepcional = cliente.contrato.listarGrupoExcepcional();
            }

            UtilidadesPagina.preencherDropDown(caixaSelecaoGrupoExcepcional, listaGrupoExcepcional, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "DESCRICAO", "IDGRUPOEXCEPCIONAL");
        }

        // xavier SOL 178579


        /// <summary>
        /// Carrega o Combo Indexador.
        /// </summary>
        private void carregarComboIndexador()
        {
            List<Moeda> listaMoeda = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listaMoeda = cliente.contrato.listarMoeda();
            }

            UtilidadesPagina.preencherDropDown(ListaDropDownIndexador, listaMoeda, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "sigla", "id");
        }

        // SOL 199759
        private void carregarGridAvalista()
        {
            List<Avalistas> ListaAvalistas = new List<Avalistas>();
            ListaAvalistas = (List<Avalistas>)Session["Avalista"];
            //string[] idAvalistas;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                //long inscricaoPrevidenciaria = long.Parse(Session["inscricaoPrevidenciaria"].ToString());
                //if (Session["idAvalista"] != null && Session["idAvalista"].ToString() != "")
                //{
                //    //int idAvalista = Int32.Parse(Session["idAvalista"].ToString());
                //    idAvalistas = Session["idAvalista"].ToString().Split(',');
                //    // SOL 199759
                //    // Carrega os grid da aba de Avalistas.
                //    //List<Avalistas> ListaAvalistas = cliente.contrato.obterAvalistas(inscricaoPrevidenciaria);
                //    for (int i = 0; i < idAvalistas.Length; i++)
                //    {
                //        int idAvalista = Int32.Parse(idAvalistas[i].Trim());
                //        Avalistas avalista = cliente.contrato.consultarAvalistaPessoa(idAvalista);
                //        ListaAvalistas.Add(avalista);
                //    }

                //William Moreira da Silva - SOL 199759
                if (ListaAvalistas == null || ListaAvalistas.Count <= 0)
                {
                    botaoExcluirAvalista.Enabled = false;
                    //Session["QTDEAVALISTAS"] = 0;
                    gridAvalista.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                }
                else
                {
                    botaoExcluirAvalista.Enabled = true;
                    //Session["QTDEAVALISTAS"] = ListaAvalistas.Count;
                    gridAvalista.DataSource = ListaAvalistas;
                }

                //}

                //else
                //{
                //    ListaAvalistas.Clear();
                //    Session["QTDEAVALISTAS"] = 0;
                //}
                //William Moreira da Silva - SOL 199759
                gridAvalista.DataBind();
                // SOL 199759
            }
        }
        // SOL 199759

        /// <summary>
        /// Carrega os Dados do mutuário.
        /// </summary>
        private void carregarDadosMutuario(Mutuario mutuario)
        {
            // Preenche a tela com as informações do mutuário.
            labelMutuario.Text = mutuario.nome;
            labelCPF.Text = UtilidadeSistema.formatarCPF(mutuario.cpf);
            labelPatrocinadora.Text = mutuario.patrocinadora.nome;
            cpfMutuario.Value = mutuario.cpf.Trim();

            if (mutuario.tipo == "Pensionista") //NILTON - CORRECAO - 07/02/13.
            {
                labelSituacaoParticipante.Text = mutuario.tipo;     //NILTON - CORRECAO - 31/01/13.
            }
            else
            {
                labelSituacaoParticipante.Text = mutuario.situacao; //NILTON - CORRECAO - 07/02/13.    
            }

            labelMatricula.Text = mutuario.matricula;
            hdfMatricula.Value = mutuario.matricula;
            labelPlanoPrevidenciario.Text = mutuario.plano.descricao;
            //labelNomeResponsavel.Text = mutuario      

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                // Thiago Melo SOL 209377 Kintana 2021339 
                labelNomeResponsavel.Text = cliente.contrato.retornaNomeResponsavel(mutuario.idTitular, mutuario.id);
                // Thiago Melo SOL 209377 Kintana 2021339   

                // Carrega os grid da aba de integração.
                List<DadosBancarios> listaDadosBancarios = cliente.contrato.consultarContaBancaria(mutuario.id, 0, 0);

                if (listaDadosBancarios.Count > 0)
                {
                    gridIntegracaoCredito.DataSource = listaDadosBancarios;
                }
                else
                {
                    gridIntegracaoCredito.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                }
                gridIntegracaoCredito.DataBind();


                // SOL 199759
                // Carrega os grid da aba de Outras Dividas.  
                int indiceLinha = 0;
                int maximoLinhas = 3;
                string ordenacao = "TIPO";

                ParametrosConsulta parametros = new ParametrosConsulta(indiceLinha, maximoLinhas, ordenacao);

                List<OutrasDividas> listaOutrasDividas = cliente.contrato.obterOutrasDividas(mutuario.id);

                if (listaOutrasDividas.Count > 0)
                {
                    gridOutrasDividas.DataSource = listaOutrasDividas;
                }
                else
                {
                    gridOutrasDividas.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                }
                gridOutrasDividas.DataBind();
                // SOL 199759

                this.carregarGridAvalista();
                // SOL 199759                

                // Preenche a Caixa de seleção de forma de pagamento.
                List<FormaPagamento> listaFormaPagamento = cliente.contrato.consultarFormaPagamento("P");
                UtilidadesPagina.preencherDropDown(caixaSelecaoFormaPagamento, listaFormaPagamento, EnumeradorItemPreenchimento.Nenhum, "descricao", "idForma");

                // Seleciona o item.
                caixaSelecaoFormaPagamento.ClearSelection();
                if (listaFormaPagamento.Count != 0 && caixaSelecaoFormaPagamento.Items.Count != 0)
                    caixaSelecaoFormaPagamento.Items.FindByValue(listaFormaPagamento.Where(t1 => t1.id == t1.idForma).First().id.ToString()).Selected = true;

                // Obetem os dados e preenche as caixas de Forma de pagamento/recebimento.
                List<ContaCaixa> listaContaCaixa = cliente.contrato.listarContaCaixa();

                UtilidadesPagina.preencherDropDown(caixaSelecaoContaCaixaFormaPagamento, listaContaCaixa.Where(t1 => t1.recPagamento == "P"), FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                caixaSelecaoContaCaixaFormaPagamento.ClearSelection();
                if (listaContaCaixa.Count != 0 && caixaSelecaoContaCaixaFormaPagamento.Items.Count != 0)
                {
                    if (listaContaCaixa.FindAll(t1 => t1.recPagamento == "P" && t1.id == t1.portFormaPagamento).Count > 0)
                        caixaSelecaoContaCaixaFormaPagamento.Items.FindByValue(listaContaCaixa.Where(t1 => t1.recPagamento == "P" && t1.id == t1.portFormaPagamento).First().id.ToString()).Selected = true;
                }

                UtilidadesPagina.preencherDropDown(caixaSelecaoContaCaixaFormaRecebimento, listaContaCaixa.Where(t1 => t1.recPagamento == "R"), FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                caixaSelecaoContaCaixaFormaRecebimento.ClearSelection();
                if (listaContaCaixa.Count != 0 && caixaSelecaoContaCaixaFormaRecebimento.Items.Count != 0)
                {
                    if (listaContaCaixa.FindAll(t1 => t1.recPagamento == "R" && t1.id == t1.portFormaPagamento).Count > 0)
                        caixaSelecaoContaCaixaFormaRecebimento.Items.FindByValue(listaContaCaixa.Where(t1 => t1.recPagamento == "R" && t1.id == t1.portFormaPagamento).First().id.ToString()).Selected = true;
                }

            }

        }

        /// <summary>
        /// Carrega a hora de encerramento.
        /// </summary>
        private void carregarParametrosSistema()
        {
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                ParametroSistema parametros = cliente.contrato.consultarParametroSistema();
                labelHoraEncerramento.Text = parametros.horaEncerramento;
                this.idRegraTipoContrato = parametros.idRegraTipoContrato;
                // Thiago Melo SOL 204452 KTN 1976411
                this.flagTrataAssinat = parametros.flgtrataassinat;
                // Thiago Melo SOL 204452 KTN 1976411
            }
        }

        // SOL 204001
        /// <summary>
        /// Validar permissão por Tipo de Contrato.
        /// </summary>
        private bool validarPermissaoTipoContrato(long idTipoContrato)
        {
            bool permissaotipocontrato = false;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                permissaotipocontrato = cliente.contrato.validarPermissaoTipoContrato(idTipoContrato);
            }

            return permissaotipocontrato;
        }
        // SOL 204001

        /// <summary>
        /// Calcula e preenche o tempo de carência.
        /// </summary>
        /// <param name="dataCredito">Data do crédito para calculo.</param>
        /// <param name="dataPrimeiraParcela">Data da primeira parcela para calculo.</param>
        private void calcularDiasCarencia(DateTime dataCredito, DateTime dataPrimeiraParcela)
        {
            labelCarencia.Text = dataPrimeiraParcela.Subtract(dataCredito).Days.ToString();
        }

        /// <summary>
        /// Carrega a caixa de seleção de Tipo de Suspenção de cobrança.
        /// </summary>
        private void carregarComboTipoSuspensao(int idTipoContrato)
        {
            List<TipoSuspensao> listaTipoSuspensao = new List<TipoSuspensao>();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                listaTipoSuspensao = cliente.contrato.consultarTipoSuspensao(idTipoContrato, null);
            }

            UtilidadesPagina.preencherDropDown(ListaDropDownSuspensaoCobranca, listaTipoSuspensao.FindAll(c => c.apenasConcessao == true), FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Nenhum, "descricao", "id");

            ListaDropDownSuspensaoCobranca.Items.Insert(0, new ListItem("Nenhum", ""));
        }

        /// <summary>
        ///  Verifica a permissão para a rederização de determinados componentes da tela.
        /// </summary>
        private void verificarPermissao()
        {
            checkBoxExcepcional.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.excepcional.ToString());
            checkBoxFinanciamento.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.financiamento.ToString());
            //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Inicio
            checkBoxLiquidoZero.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.liquidoZero.ToString());
            caixaNumericaSalarioBase.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.salarioBase.ToString());
            caixaNumericaMargemConsignavel.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.margemConsignavel.ToString());
            caixaDataSolicitacao.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.dataSolicitacao.ToString());
            caixaDataAssinatura.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.dataAssinatura.ToString());
            caixaDataCredito.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.dataCredito.ToString());
            caixaDataPrimeiraParcela.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.dataPrimeiraParcela.ToString());
            //ListaDropDownIndexador.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.indexador.ToString());
            //Marcio Sanches Spinosa KTN:1932637 SOL:187154/13964 - Fim

            //SIG 67808 - Campanha Descontos- Matias
            checkBoxDesconto.Enabled = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.liquidoZero.ToString());
        }

        /// <summary>
        /// Habilita ou desabilita a alteração das informações.
        /// </summary>
        /// <param name="deveHabitar"></param>
        private void habilitaAlteracao(bool deveHabitar)
        {
            // recipienteAbaInscricaoEmprestimo.Enabled = deveHabitar; // William Santana - SOL 264992 PPM 1165447
        }

        /// <summary>
        /// Adiciona os avisos para serem rederizados no final do post.
        /// </summary>
        /// <param name="listaAvisos">Lista de Avisos.</param>
        private void registrarAvisos(List<string> listaAvisos)
        {
            //William Moreira da Silva - SOL 237425 PPM 504553 
            StringBuilder sb = new StringBuilder();

            foreach (string aviso in listaAvisos)
                //this.registrarAlerta(aviso);
                sb.AppendFormat("alert('{0}');", aviso);

            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "Alertas14", sb.ToString(), true);
            //William Moreira da Silva - SOL 237425 PPM 504553 
        }

        /// <summary>
        /// Retorna dados do contrato com as informações da tela
        /// </summary>
        private Contrato obterContrato(Mutuario mutuario)
        {
            Contrato contrato = new Contrato()
            {
                tipo = new TipoContrato()
                {
                    id = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue)
                },
                indexador = new Moeda()
                {
                    id = Convert.ToInt32(ListaDropDownIndexador.SelectedValue)
                },
                mutuario = mutuario,
                patrocinadora = new Patrocinadora()
                {
                    id = mutuario.patrocinadora.id
                },
                plano = new PlanoPrevidenciario()
                {
                    id = mutuario.plano.id,
                    IdPlanoOrigem = mutuario.plano.IdPlanoOrigem//William Moreira da Silva - SOL 217507 KTN 2047224
                },
                beneficiario = new Beneficiario()
                {
                    id = mutuario.id
                },
                formaPagamento = caixaSelecaoFormaPagamento.SelectedValue,
                portadorCredito = caixaSelecaoContaCaixaFormaPagamento.SelectedValue,
                portadorDebito = caixaSelecaoContaCaixaFormaRecebimento.SelectedValue,
                valorContrato = caixaNumericaValorSolicitado.valor,
                totalParcelas = Convert.ToInt32(caixaNumericaPrazo.Text),
                salarioBase = caixaNumericaSalarioBase.valor,
                valorMargem = caixaNumericaMargemConsignavel.valor,
                valorMaximo = caixaNumericaValorMaximoPermitido.valor.HasValue ? caixaNumericaValorMaximoPermitido.valor.Value : 0.0,
                valorParcela = Convert.ToDouble(labelPrestacaoBasica.Text),
                dataCredito = caixaDataCredito.valorData,
                dataAssinatura = caixaDataAssinatura.valorData,
                dataPrimeiraParcela = caixaDataPrimeiraParcela.valorData,
                //William Moreira da Silva - SOL 205549 KTN 1988203                
                //taxaJuros = Convert.ToDouble(labelTaxaJuros.Text),
                taxaJuros = Convert.ToDouble(labelTaxaJurosConsiderar.Text),
                //William Moreira da Silva - SOL 205549 KTN 1988203
                situacao = new SituacaoContrato() { codigo = "A" },
                suspensao = new Suspensao() { tipo = new TipoSuspensao() { id = 0 } },
                dataInicioSuspensao = caixaDataTerminoSuspensao.valorData == null ? null : caixaDataPrimeiraParcela.valorData,
                dataFimSuspensao = caixaDataTerminoSuspensao.valorData,
                usuario = new Usuario() { login = this.contextoSistema.loginUsuarioAtual },
                //excepcional = checkBoxExcepcional.Checked, // Felipe A. Santos  SOL 208770 PPM 2016022 - comentado
                excepcional = (checkBoxElegibilidade.Checked || checkBoxMargem.Checked || checkBoxInadimplencia.Checked || checkBoxOutros.Checked), // Felipe A. Santos  SOL 208770 PPM 2016022
                versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W"),
                //William Moreira da Silva - SIG27879 - INICIO
                taxaCorrecao = Convert.ToDouble(labelTxCorrecao.Text),
                //William Moreira da Silva - SIG27879 - FIM
                FlagAcordoJudicial = checkBoxAcordoJudicial.Checked ? 1 : 0, // Felipe A. Santos SOL 224034/17909 PPM 1165556
                FlgCampanhaDescontos = checkBoxDesconto.Checked ? 1 : 0
            };

            return contrato;
        }

        /// <summary>
        /// Retorna itens de historico com as informações da tela
        /// </summary>
        private List<Historico> obterItensHistorico(Mutuario mutuario, List<ItemContrato> itensContrato)
        {
            List<Historico> listaItensHistorico = new List<Historico>();

            foreach (ItemContrato item in itensContrato)
            {
                Historico historico = new Historico()
                {
                    item = item,
                    parcela = 0,
                    tipoMovimento = item.tipoEvento,
                    origem = TipoEnumeradorBase<int>.obterItemPelaChave<Origem>(item.tipoEvento.chave),
                    formaCobranca = "C",
                    sequenciaCobranca = 1,
                    prioridade = item.prioridade,
                    centraliza = item.centraliza,
                    destacado = item.destacado,
                    data = DateTime.Now,
                    dataPrevista = caixaDataCredito.valorData.Value,
                    dataEfetiva = null,
                    dataAtualizacao = caixaDataCredito.valorData.Value,
                    anoCompetencia = caixaDataCredito.valorData.Value.Year,
                    mesCompetencia = caixaDataCredito.valorData.Value.Month,
                    mesCobranca = caixaDataCredito.valorData.Value.Month,
                    anoCobranca = caixaDataCredito.valorData.Value.Year,
                    valorPrevisto = item.valor,
                    valorEfetivo = null,
                    saldoDevedor = Convert.ToDouble(caixaNumericaValorSolicitado.Text),
                    //William Moreira da Silva - SOL 205549 KTN 1988203
                    //taxaJuros = Convert.ToDouble(labelTaxaJuros.Text),
                    taxaJuros = Convert.ToDouble(labelTaxaJurosConsiderar.Text),
                    //William Moreira da Silva - SOL 205549 KTN 1988203
                    baixado = 0,
                    enviado = 0,
                    rubrica = item.rubrica,
                    pagarReceber = item.pagarReceber,
                    numeroParcelas = Convert.ToInt32(caixaNumericaPrazo.Text),
                    dataVencimento = caixaDataCredito.valorData.Value,
                    tipoDivergencia = 0,
                    dataInclusao = DateTime.Now,
                    usuarioInclusao = this.contextoSistema.loginUsuarioAtual,
                    versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W"),
                    patrocinadora = new Patrocinadora()
                    {
                        id = mutuario.patrocinadora.id
                    },
                    parcelaAlternativa = 0
                };

                listaItensHistorico.Add(historico);
            }

            return listaItensHistorico;

        }

        #region Validação

        private void salvarValorCampos()
        {
            // Salva o valor atual dos campos.
            // INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013
            this.hdfCaixaNumericaPrazo.Value = caixaNumericaPrazo.Text;
            this.hdfCaixaNumericaSalarioBase.Value = caixaNumericaSalarioBase.Text;
            this.hdfCaixaNumericaMargemConsignavel.Value = caixaNumericaMargemConsignavel.Text;
            this.hdfCaixaDataSolicitacao.Value = caixaDataSolicitacao.valorData.ToString();
            this.hdfCaixaDataAssinatura.Value = caixaDataAssinatura.valorData.ToString();
            this.hdfCaixaDataCredito.Value = caixaDataCredito.valorData.ToString();
            this.hdfCaixaDataPrimeiraParcela.Value = caixaDataPrimeiraParcela.valorData.ToString();
            this.hdfCaixaNumericaValorSolicitado.Value = caixaNumericaValorSolicitado.Text;
            this.hdfCaixaDataTerminoSuspensao.Value = caixaDataTerminoSuspensao.valorData.ToString();
            this.hdfListaDropDownSuspensaoCobranca.Value = ListaDropDownSuspensaoCobranca.SelectedIndex.ToString();
            this.hdfCaixaNumericaSuspensao.Value = caixaNumericaSuspensao.Text;
            this.hdfChkbxDesconto.Value = checkBoxDesconto.Checked.ToString();
            this.hdflabelSaldoQuitar.Value = labelSaldoQuitar.Text;//Darivaldo Alencar SIG21529
            this.hdfValorUltimaPrestacaoFGQC.Value = this.ValorUltimaPrestacaoFGQC.ToString();

            if (caixaNumericaDividaPrevi.Visible)
            {
                this.hdfCaixaNumericaDividaPrevi.Value = caixaNumericaDividaPrevi.Text;
            }
            else
            {
                this.hdfCaixaNumericaDividaPrevi.Value = string.Empty;
            }
            // FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013
        }

        private bool validarCampos()
        {
            // Valida o valor atual dos campos com o valor salvo.
            // INICIO - NILTON - SOL205608 KTN198892 - 24/04/2013
            bool prazoIgual = this.hdfCaixaNumericaPrazo.Value == caixaNumericaPrazo.Text;
            bool salarioBaseIgual = this.hdfCaixaNumericaSalarioBase.Value == caixaNumericaSalarioBase.Text;
            bool margemConsignavelIgual = this.hdfCaixaNumericaMargemConsignavel.Value == caixaNumericaMargemConsignavel.Text;
            bool valorSolicitadoIgual = this.hdfCaixaNumericaValorSolicitado.Value == caixaNumericaValorSolicitado.Text;
            bool dataSolicitacaoIgual = this.hdfCaixaDataSolicitacao.Value == caixaDataSolicitacao.valorData.ToString();
            //bool dataAssinaturaIgual = this.hdfCaixaDataAssinatura.Value == caixaDataAssinatura.valorData.ToString();
            this.hdfValorUltimaPrestacaoFGQC.Value = this.ValorUltimaPrestacaoFGQC.ToString();

            // Felipe A. Santos SOL 219054 KTN 2058728
            bool dataCreditoIgual = this.hdfCaixaDataCredito.Value == caixaDataCredito.valorData.ToString();
            // Thiago Melo SOL 216474 Kintana 2045796            
            string dt1 = this.hdfCaixaDataPrimeiraParcela.Value.ToString().Substring(0, 10);
            string dt2 = caixaDataPrimeiraParcela.valorData.ToString().Substring(0, 10);

            bool dataPrimeiraParcelaIgual = dt1 == dt2;
            //bool dataPrimeiraParcelaIgual = (this.hdfCaixaDataPrimeiraParcela.Value.ToString().Substring(0, 9) == caixaDataPrimeiraParcela.valorData.ToString().Substring(0, 9));
            // Thiago Melo SOL 216474 Kintana 2045796
            bool dataTerminoSuspensaoIgual = this.hdfCaixaDataTerminoSuspensao.Value == caixaDataTerminoSuspensao.valorData.ToString();
            bool listaSuspensaoCobrancaIgual = this.hdfListaDropDownSuspensaoCobranca.Value == ListaDropDownSuspensaoCobranca.SelectedIndex.ToString();

            bool caixaNumericaDividaPreviIgual = true;
            if (caixaNumericaDividaPrevi.Visible)
            {
                caixaNumericaDividaPreviIgual = this.hdfCaixaNumericaDividaPrevi.Value == caixaNumericaDividaPrevi.Text;
            }

            //Se Existe uma suspensão selecionada
            if (ListaDropDownSuspensaoCobranca.SelectedIndex != 0)
            {
                bool parcelasSuspensaoIgual = this.hdfCaixaNumericaSuspensao.Value == caixaNumericaSuspensao.Text;
                //return (prazoIgual && salarioBaseIgual && margemConsignavelIgual && dataSolicitacaoIgual && dataAssinaturaIgual && dataCreditoIgual && dataPrimeiraParcelaIgual && valorSolicitadoIgual && dataTerminoSuspensaoIgual && listaSuspensaoCobrancaIgual && parcelasSuspensaoIgual && caixaNumericaDividaPreviIgual);
                return (prazoIgual && salarioBaseIgual && margemConsignavelIgual && dataSolicitacaoIgual && dataCreditoIgual && dataPrimeiraParcelaIgual && valorSolicitadoIgual && dataTerminoSuspensaoIgual && listaSuspensaoCobrancaIgual && parcelasSuspensaoIgual && caixaNumericaDividaPreviIgual);
                // Felipe A. Santos SOL 219054 KTN 2058728
            }
            else
            {
                //return (prazoIgual && salarioBaseIgual && margemConsignavelIgual && dataSolicitacaoIgual && dataAssinaturaIgual && dataCreditoIgual && dataPrimeiraParcelaIgual && valorSolicitadoIgual && dataTerminoSuspensaoIgual && listaSuspensaoCobrancaIgual && caixaNumericaDividaPreviIgual);
                return (prazoIgual && salarioBaseIgual && margemConsignavelIgual && dataSolicitacaoIgual && dataCreditoIgual && dataPrimeiraParcelaIgual && valorSolicitadoIgual && dataTerminoSuspensaoIgual && listaSuspensaoCobrancaIgual && caixaNumericaDividaPreviIgual);
                // Felipe A. Santos SOL 219054 KTN 2058728
            }
            // FINAL - NILTON - SOL205608 KTN198892 - 24/04/2013

        }

        private void desabilitarCamposSuspensao()
        {
            labelValorParcSuspensa.Text = string.Empty;
            caixaDataTerminoSuspensao.valorData = null;
            caixaNumericaSuspensao.Enabled = false;
            caixaNumericaSuspensao.valorMinimo = 0;
            caixaNumericaSuspensao.valorMaximo = 0;
            caixaNumericaSuspensao.Text = "0";
            ListaDropDownSuspensaoCobranca.SelectedIndex = 0;
        }

        //BRUNO AZEVEDO - SOL 167098
        private bool verificaContaCaixa(int idContaCorrente)
        {
            bool retorno = true;

            int iIdConta = 0;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                iIdConta = cliente.contrato.consultarCodigoBanco(idContaCorrente);
            }

            if (iIdConta != 91008)
            {
                this.registrarAlerta("A conta bancária selecionada para crédito do empréstimo deve ser obrigatoriamente da Caixa Econômica Federal.");
                retorno = false;
            }

            //  if (!retorno)                                       // William Santana - SOL 264992 PPM 1165447
            // recipienteAbaInscricaoEmprestimo.ActiveTabIndex = 2; // William Santana - SOL 264992 PPM 1165447

            return retorno;
        }
        //BRUNO AZEVEDO - SOL 167098

        private bool verificaContaSelecionada(out int idContaCorrente)
        {
            bool retorno = false;
            int idConta = 0;

            if (gridIntegracaoCredito.chavesSelecionadas.Count == 1)
            {

                if (gridIntegracaoCredito.chavesSelecionadas.Count > 0)
                {
                    DataKey dataKey = gridIntegracaoCredito.chavesSelecionadas[0];
                    idConta = (int)dataKey.Values[0];
                    retorno = true;
                }

            }
            else if (gridIntegracaoCredito.chavesSelecionadas.Count >= 2)
            {
                this.registrarAlerta("Selecione apenas uma conta corrente.");
                retorno = false;
            }
            else
            {
                this.registrarAlerta("Selecione ao menos uma conta corrente.");
                retorno = false;
            }

            // if (!retorno)                                        // William Santana - SOL 264992 PPM 1165447
            // recipienteAbaInscricaoEmprestimo.ActiveTabIndex = 2; // William Santana - SOL 264992 PPM 1165447

            idContaCorrente = idConta;

            return retorno;

        }

        #endregion

        #endregion

        #region Calcular Concessão

        /// <summary>
        /// Executa o calculo de Concessão.
        /// </summary>
        /// <param name="mutuario">Mutuario utilizado no calculo.</param>
        /// <param name="idTipoContrato">Identificação do tipo de contrato selecionado.</param>
        private void calcularConcessao(Mutuario mutuario, int idTipoContrato, string evento)
        {
            //Darivaldo Alencar SIG65101 -Inicio
            if (evento != "btnCalcular")
                exeDuplo = false;
            else
                exeDuplo = qtdeCalcLoop > 1;
            //Darivaldo Alencar SIG65101 -Fim

            Porcentagem = 5;
            Thread t = new Thread(incrementaBarra);
            try
            {
                t.Start();
                TipoContrato tipoContrato = new TipoContrato();
                List<Contrato> listaContratos = new List<Contrato>();
                List<ItemContrato> itensConcessao = new List<ItemContrato>();

                #region Dados para calcular concessão

                List<string> listaMensagensCalculo = new List<string>();

                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    idBarraProgresso = cliente.contrato.consultarUltimoIdTabela("TB_EMP_BARRAPROGRESSO");
                    //Prazo, quantidade de parcelas
                    int? parcelas;
                    if (string.IsNullOrEmpty(caixaNumericaPrazo.Text) || caixaNumericaPrazo.Text.Equals("0"))
                        parcelas = null;
                    else
                        parcelas = int.Parse(caixaNumericaPrazo.Text);

                    //Quantidade de meses suspensão
                    int? qtdeMeses;
                    if (ListaDropDownSuspensaoCobranca.SelectedIndex != 0)
                        qtdeMeses = int.Parse(caixaNumericaSuspensao.Text);
                    else
                        qtdeMeses = null;

                    double? valorDividaPrevi = 0;
                    if (caixaNumericaDividaPrevi.Visible)
                        valorDividaPrevi = caixaNumericaDividaPrevi.valor;

                    tipoContrato = cliente.contrato.ConsultarTipoContrato(int.Parse(caixaSelecaoTipoContrato.SelectedValue));

                    if (!checkBoxDesconto.Checked)
                    {
                        if (tipoContrato.flgObrigaLiquidoZero)
                        {
                            checkBoxLiquidoZero.Checked = true;
                            checkBoxLiquidoZero.Enabled = false;
                            ScriptManager.RegisterClientScriptBlock(this, typeof(string), "CheckLiqZero", "ObrigaLiquidoZero();", true);
                        }
                        else
                        {
                            if (!checkBoxLiquidoZero.Enabled)
                            {
                                checkBoxLiquidoZero.Checked = false;
                                checkBoxLiquidoZero.Enabled = true;
                                ScriptManager.RegisterClientScriptBlock(this, typeof(string), "CheckLiqZero", "LiberaLiquidoZero();", true);
                            }
                        }
                    }

                    // Xavier SOL 178579
                    int idgrupoexcepcional = 0;
                    if (!string.IsNullOrEmpty(caixaSelecaoGrupoExcepcional.SelectedValue))
                    {
                        idgrupoexcepcional = Convert.ToInt32(caixaSelecaoGrupoExcepcional.SelectedValue);
                    }
                    // Xavier SOL 178579


                    // Xavier SOL 172525
                    string numProtocolo = "";//William Moreira da Silva - SOL 213725 KINTANA 2040469
                    if (!string.IsNullOrEmpty(caixatextoNup.Text))
                    {
                        numProtocolo = caixatextoNup.Text.Replace(".", "").Replace("/", "");//William Moreira da Silva - SOL 213725 KINTANA 2040469
                    }
                    // Xavier SOL 172525

                    // Xavier parametros input regra

                    //William Moreira da Silva - SOL 235732
                    double ValorDivida = 0;
                    double ValorAmortizacao = 0;
                    double ValorQuitacao = 0;
                    if (checkBoxFinanciamento.Checked)
                    {
                    if (Session["ValorDivida"] != null)
                        ValorDivida = double.Parse(Session["ValorDivida"].ToString());
                        //Saulo Cirineu
                        if (rblTipoFH.SelectedIndex == 0)
                            ValorQuitacao = double.Parse(caixaNumericaFH.Text);
                        else
                            ValorAmortizacao = double.Parse(caixaNumericaFH.Text);

                        //if (Session["valorAmortizacao"] != null)
                        //    ValorAmortizacao = double.Parse(Session["valorAmortizacao"].ToString());

                        //if (Session["ValorQuitacao"] != null)
                        //    ValorQuitacao = double.Parse(Session["ValorQuitacao"].ToString());
                    }
                    //William Moreira da Silva - SOL 235732

                    // Xavier parametros input regra                   

                    Concessao dadosConcessao = new Concessao
                    {
                        //excepcional = checkBoxExcepcional.Checked, // Felipe A. Santos SOL 208770 PPM 201602
                        excepcional = checkBoxInadimplencia.Checked || checkBoxElegibilidade.Checked || checkBoxOutros.Checked || checkBoxMargem.Checked, // Felipe A. Santos SOL 208770 PPM 201602
                        financiamento = checkBoxFinanciamento.Checked,
                        liquidozero = checkBoxLiquidoZero.Checked,
                        dataAssinatura = null, //caixaDataAssinatura.valorData.Value, // Felipe A. Santos SOL 219054 KTN 2058728  
                        dataSolicitacao = caixaDataSolicitacao.valorData.Value,
                        dataReferencia = null, //caixaDataAssinatura.valorData.Value, // Felipe A. Santos SOL 219054 KTN 2058728
                        dataEvento = DateTime.Today,
                        dataAtualiza = DateTime.Today,
                        dataEfetiva = DateTime.Today,
                        dataPrevista = DateTime.Today,
                        valorAmortizacaoFH = null,
                        jurosFH = null,
                        numeroParcelas = parcelas,
                        dataCredito = caixaDataCredito.valorData,
                        valorMargem = caixaNumericaMargemConsignavel.valor,
                        dataPrimeiraParcela = caixaDataPrimeiraParcela.valorData,
                        salarioBase = caixaNumericaSalarioBase.valor,
                        valorMaximo = 0,
                        valorSolicitado = caixaNumericaValorSolicitado.valor,
                        mesesSuspensao = qtdeMeses,
                        valorDebito = valorDividaPrevi,
                        grupoExcepcional = idgrupoexcepcional, // Xavier SOL 178579 
                        numProtocolo = numProtocolo,
                        valordivida = ValorDivida, // Xavier Parametros inputregra
                        valoramortizacao = ValorAmortizacao, // Xavier Parametros inputregra
                        valorquitacao = ValorQuitacao, // Xavier Parametros inputregra
                        evento = evento, // Xavier
                        excepcionalMargem = checkBoxMargem.Checked ? 1 : 0, // Felipe A. Santos SOL 208770 Kintana 2016022 
                        excepcionalElegibilidade = checkBoxElegibilidade.Checked ? 1 : 0, // Felipe A. Santos SOL 208770 Kintana 2016022 
                        excepcionalInadimplencia = checkBoxInadimplencia.Checked ? 1 : 0, // Felipe A. Santos SOL 208770 Kintana 2016022 
                        excepcionalOutros = checkBoxOutros.Checked ? 1 : 0, // Felipe A. Santos SOL 208770 Kintana 2016022
                        //William Moreira da Silva - SIG27879 - INICIO
                        taxaCorrecao = 0,
                        //William Moreira da Silva - SIG27879 - FIM
                        CampanhaDescontos = checkBoxDesconto.Checked //SIG 67808 - Campanha Descontos- Saulo
                    };

                    //SIG 67808 - Campanha Descontos- Matias
                    bool CampanhaDescontos = checkBoxDesconto.Checked;

                    //William Moreira da Silva - SOL 143476/16437
                    imprimiuRelatorio.Value = "0";
                    relatorio = null;
                    //William Moreira da Silva - SOL 143476/16437

                    //BRUNO AZEVEDO - SOL213592_KTN2040335
                    //Calcula Concessão
                    if (this.listaContratosEmAbertos.Count == 0 || this.hdfCaixaDataCredito.Value != caixaDataCredito.valorData.ToString() || this.hdfChkbxDesconto.Value != checkBoxDesconto.Checked.ToString())
                    //(this.obterContratosSelecionados().Count > 0))
                    {
                        listaContratos = cliente.contrato.calcular(mutuario.id, idTipoContrato, this.matricula, ref dadosConcessao, ref itensConcessao, this.obterContratosSelecionados(), out listaMensagensCalculo, true, null, idBarraProgresso, CampanhaDescontos);
                        this.listaContratosEmAbertos = listaContratos;
                    }
                    else
                    {
                        listaContratos = cliente.contrato.calcular(mutuario.id, idTipoContrato, this.matricula, ref dadosConcessao, ref itensConcessao, this.obterContratosSelecionados(), out listaMensagensCalculo, false, this.listaContratosEmAbertos, idBarraProgresso, CampanhaDescontos);
                        listaContratos = this.listaContratosEmAbertos;
                    }

                    ValorUltimaPrestacaoFGQC = dadosConcessao.ValorUltimaPrestacaoFGQC == null ? 0 : (double)dadosConcessao.ValorUltimaPrestacaoFGQC;
                    ValorPrestacaoBase = (double)dadosConcessao.valorPrestacao + dadosConcessao.FGQCbase;

                    if (listaContratos != null && listaContratos.Count() > 0)
                    {
                        saldoDevedor = new Dictionary<long, double>();
                        foreach (var item in listaContratos)
                        {
                            saldoDevedor.Add(item.numero, item.saldoDevedor);
                        }
                    }
                    //SIG 130294 - novas modalidades 13 (SAC) - Incluído cases 98 e 99
                    if (idTipoContrato == 92 || idTipoContrato == 93 || idTipoContrato == 98 || idTipoContrato == 99)
                    {
                        // SIG 57675 - Marcelo Valério Ferreira - Início
                        if (cliente.contrato.verificarConcessao13(mutuario.id, mutuario.idTitular, dadosConcessao.dataPrimeiraParcela))
                        {
                            this.ignorarContratosSelecionados = true;
                            this.LimparCamposCalculados();
                            this.desabilitarCamposSuspensao();
                            botaoContratarEp.Enabled = false;
                            this.registrarAlerta("O participante já possui uma contratação para essa modalidade de 13º salário!");

                            caixaSelecaoTipoContrato.SelectedIndex = 0;
                            Porcentagem = 100;                            
                            return;
                        }
                        // SIG 57675 - Marcelo Valério Ferreira - Fim
                    }

                    //Prazo máximo
                    caixaNumericaPrazo.Enabled = true;
                    caixaNumericaPrazo.valorMinimo = 1;
                    caixaNumericaPrazo.Text = dadosConcessao.numeroParcelas.ToString();

                    Porcentagem = 92;
                    //INICIO - NILTON - SOL201705 KTN1950511 - 07/03/2013
                    caixaNumericaPrazo.valorMaximo = dadosConcessao.prazoMaximo;
                    hdfPrazo.Value = dadosConcessao.prazoMaximo.ToString();
                    //FINAL - NILTON - SOL201705 KTN1950511 - 07/03/2013

                    //Data Crédito
                    caixaDataCredito.valorData = dadosConcessao.dataCredito;

                    //Salario Base
                    caixaNumericaSalarioBase.valor = dadosConcessao.salarioBase;

                    //Valor Margem
                    caixaNumericaMargemConsignavel.valor = dadosConcessao.valorMargem;

                    //Taxa Juros
                    labelTaxaJuros.Text = dadosConcessao.taxaJurosExibir.ToString("N4");//NILTON - 17/12/12
                    labelTaxaJurosConsiderar.Text = dadosConcessao.taxaJurosConcessao.ToString("N4");//William Moreira da Silva - SOL 205549 KTN 1988203

                    //Reserva
                    labelResPoupanca.Text = dadosConcessao.valorReserva.ToString("N2");

                    //Data Primeira Parcela
                    caixaDataPrimeiraParcela.valorData = dadosConcessao.dataPrimeiraParcela;

                    //Saldo a Quitar
                    labelSaldoQuitar.Text = dadosConcessao.valorAQuitar.ToString("N2");

                    //Total de Saldo a Quitar
                    labelValorTotalQuitacaoContratoAnterior.Text = listaContratos.Sum(contrato => contrato.valorAQuitar).ToString("N2");

                    //Total de descontos
                    labelValorTotalDescontos.Text = listaContratos.Sum(contrato => contrato.valorDesconto).ToString("N2");

                    //Total de Parcelas
                    labelTotalParcelas.Text = dadosConcessao.valorTotalParcelas.ToString("N2");

                    //Pendencias
                    labelPendencias.Text = dadosConcessao.valorEmAberto.ToString("N2");

                    //Valor Solicitado
                    caixaNumericaValorSolicitado.valor = dadosConcessao.valorSolicitado;

                    //Valor máximo permitido
                    this.valorMaximoPermitido = (double)dadosConcessao.valorMaximo;
                    caixaNumericaValorMaximoPermitido.valor = dadosConcessao.valorMaximo;

                    // Jessica Y Oshiro - SOL 225057/18141 PPM 1315874 - início
                    
                    // FGQC base

                    labelFGQCBase.Text = dadosConcessao.FGQCbase.ToString("N2");

                    // Jessica Y Oshiro - SOL 225057/18141 PPM 1315874 - fim

                    //SIG 128871 - Aplicação de desconto sobre o FGQC - Inclusão da linha abaixo
                    labelDescFGQCBase.Text = dadosConcessao.DescFGQCbase.ToString("N2");

                    //William Moreira da Silva - SIG27879 - INICIO
                    labelTxCorrecao.Text = dadosConcessao.taxaCorrecao.ToString("N2");

                    //INICIO - NILTON - SOL201705 KTN1950511 - 15/03/2013
                    if (string.IsNullOrEmpty(hdfPrazoDigitado.Value) || hdfPrazoDigitado.Value != caixaNumericaPrazo.Text)
                    {
                        hdfPrazoDigitado.Value = caixaNumericaPrazo.Text;
                    }

                    //INICIO - NILTON - MELHORIA - 07/02/13
                    DateTime dataCredito = Convert.ToDateTime(caixaDataCredito.Text);
                    string aviso = String.Empty;

                    // Thiago Melo SOL 202311 KINTANA 1956671 INI                                       
                    aviso = String.Empty;
                    string contratosSelecionados = buscaContratosSelecionados();

                    cliente.contrato.consultarContratosAnteriores(mutuario.idTitular, mutuario.id, dataCredito, tipoContrato.tipoEmprestimo.id, 1, idTipoContrato, checkBoxOutros.Checked, out aviso, contratosSelecionados);
                    if (!String.IsNullOrEmpty(aviso))
                        this.registrarAlerta(aviso);

                    CompararPrestAnteriorPrestBase(idTipoContrato);

                    // Thiago Melo SOL 202311 KINTANA 1956671
                    List<long> listaobterContratoEmptmo = new List<long>();
                    //MARCIO SANCHES SPINOSA - SOL 204760
                    listaobterContratoEmptmo = cliente.contrato.obterContratoEmptmo(mutuario.idTitular, mutuario.id, dataCredito);


                    foreach (var idContrato in listaobterContratoEmptmo)
                    {
                        long idContratoEmptmo = idContrato;

                        // Se não for excepcionalizar a inadimplência, então verifica se tem itens abertos
                        if (!checkBoxInadimplencia.Checked) // Felipe A. Santos SOL 208770 Kintana 2016022
                        {
                            cliente.contrato.existemItensEmAberto(idContratoEmptmo, true, dataCredito, true, Convert.ToInt32(dataCredito.Year), Convert.ToInt32(dataCredito.Month), out aviso);
                        }

                        if (!String.IsNullOrEmpty(aviso))
                        {
                            //William Moreira da Silva - SOL 237425 PPM 504553  
                            //this.registrarAlerta(aviso);
                            listaMensagensCalculo.Remove(aviso);
                            listaMensagensCalculo.Add(aviso);
                        }
                        //Campanha Desconto
                        //William Moreira da Silva - SOL 237425 PPM 504553  
                        //MARCIO SANCHES SPINOSA - SOL 204760   
                        this.idCalculo = (int)dadosConcessao.idCalculo;
                    }

                    this.salvarValorCampos();
                }

                #endregion

                using (Cliente<IServicoContrato> clienteContrato = new Cliente<IServicoContrato>())
                {
                    // Atribui o valor do campo indexador de acordo com o tipo de contrato escolido.
                    tipoContrato = clienteContrato.contrato.consultarTipoContrato(idTipoContrato, false);
                    ListaDropDownIndexador.ClearSelection();
                    ListaDropDownIndexador.Items.FindByText(tipoContrato.moeda.sigla).Selected = true;

                    #region Regras

                    // Calula os dias de carencia.
                    this.calcularDiasCarencia(caixaDataCredito.valorData.Value, caixaDataPrimeiraParcela.valorData.Value);

                    //William Moreira da Silva - SOL 237425 PPM 504553  
                    //List<string> listaAvisos = new List<string>();


                    // Renderiza os avisos da consulta.
                    // registrarAvisos(listaAvisos); 
                    //William Moreira da Silva - SOL 237425 PPM 504553  

                    // Popula o Grid.
                    if (listaContratos.Count != 0)
                    {
                        gridDividasEmprestimo.DataSource = listaContratos;
                    }
                    else
                    {
                        gridDividasEmprestimo.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                    }

                    gridDividasEmprestimo.DataBind();                   

                    if (idTipoContrato == 95 || idTipoContrato == 96 || idTipoContrato == 97)
                    {
                        int i = 0;
                        if (listaContratos.Count > 0)
                        {
                            foreach (GridViewRow item in gridDividasEmprestimo.Rows)
                            {
                                if (gridDividasEmprestimo.chavesSelecionadas.Count > 0)
                                {
                                    DataKey dataKey = gridDividasEmprestimo.chavesSelecionadas[i];
                                    if (dataKey.Values[0].ToString() == item.Cells[1].Text.ToString())
                                    {
                                    }
                                }
                                else
                                {
                                    CheckBox chkBox = (CheckBox)item.FindControl("CheckBoxButton");
                                    chkBox.Checked = true;
                                }
                            }
                        }
                    }
                    #endregion

                    #region Verifica Atualização Diaria

                    /*
                    using (Cliente<IServicoMutuario> clienteMutuario = new Cliente<IServicoMutuario>())
                    {
                        string aviso = String.Empty;
                        // Verifica atualização diaria para mutuario.
                        clienteMutuario.contrato.verificarAtualizacaoDiaria(mutuario.id, caixaDataCredito.valorData.Value, out aviso);
                        if (!String.IsNullOrEmpty(aviso))
                            this.registrarAlerta(aviso);
                    }
                    */

                    #endregion

                    #region Beneficiarios

                    if (listaContratos.Count != 0)
                    {
                        // Pesquisa os dados dos beneficiarios e adiciona no grid.
                        List<Beneficiario> listaBeneficiarios = new List<Beneficiario>();

                        foreach (Contrato contrato in listaContratos)
                            listaBeneficiarios = listaBeneficiarios.Union(clienteContrato.contrato.consultarBeneficiarios(contrato.numero)).ToList<Beneficiario>();

                        if (listaBeneficiarios.Count != 0)
                            gridBeneficiariosSeguro.DataSource = listaBeneficiarios;
                        else
                            gridBeneficiariosSeguro.EmptyDataText = MensagensAplicacao.instancia.mensagem007;

                        gridBeneficiariosSeguro.DataBind();
                    }

                    #endregion
                }
                Porcentagem = 95;
                // Preenche as informações de itens de Contrato.
                this.preencherItensContrato(itensConcessao);

                // Valor da prestação
                labelPrestacaoBasica.Text = itensConcessao.Where(t1 => t1.centraliza == 1 && t1.tipoEvento.chave == TipoEvento.prestacao.chave).Sum(t1 => t1.valor).ToString("N2");

                //Calcula suspensão
                this.calcularSuspensao();

                //Se existir suspensão, reaproveita
                this.reaproveitarSuspensao();

                this.verificarValorSolicitado();

                // Valida o valor máximo 
                this.validarValorMaximo();

                Porcentagem = 97;

                //Nilton 25/04/2013 
                this.idMutiario = mutuario.id; //proxyEstado.manterEstadoSincrono("idMutuario", mutuario.id);
                this.idTipoContrato = idTipoContrato; //proxyEstado.manterEstadoSincrono("idTipoContrato", idTipoContrato);

                //William Moreira da Silva - SOL 201710
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    DateTime dataCredito = Convert.ToDateTime(caixaDataCredito.Text);
                    string aviso = String.Empty;

                    cliente.contrato.consultarSuspensao(mutuarioAtual.id, idTipoContrato, dataCredito, false, out aviso);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
                    //William Moreira da Silva - SOL 224562 KTN 2059616 - Inclusão do parametro veioConector, no caso false pois estamos no WebEmprestimo
                    if (!String.IsNullOrEmpty(aviso))
                    {
                        //William Moreira da Silva - SOL 237425 PPM 504553 
                        //this.registrarAlerta(aviso);
                        listaMensagensCalculo.Remove(aviso);
                        listaMensagensCalculo.Add(aviso);
                        //William Moreira da Silva - SOL 237425 PPM 504553 
                    }
                }
                //William Moreira da Silva - SOL 201710

                //SIG 130294 - novas modalidades 13 (SAC) - Incluído os tipos 98 e 99
                //TAES - SIG118806 / SIG119231
                if ((!checkBoxLiquidoZero.Checked) && (idTipoContrato != 92) && (idTipoContrato != 93) && (idTipoContrato != 98) && (idTipoContrato != 99))
                {
                    if (CompararPrestacaoBaseMaiorMargem())
                    {
                        listaMensagensCalculo.Add("O valor da margem consignável não pode ser inferior ao valor da parcela.");
                    }
                }
                
                //William Moreira da Silva - SOL 237425 PPM 504553 
                if (listaMensagensCalculo.Count > 0)
                {
                    //possui contrato de empréstimo com acordo judicial vigente
                    this.calculoEfetuado = false;
                    // Renderiza os avisos da consulta.
                    registrarAvisos(listaMensagensCalculo);
                }
                else
                {
                    this.calculoEfetuado = true;
                }
                //William Moreira da Silva - SOL 237425 PPM 504553 

                //Thayane Rabonato - SIG 21529 - inicio
                //BotaoAcaoAbrirRenegociacao.Visible = (gridDividasEmprestimo.Rows.Count > 0);// !(caixaNumericaMargemConsignavel.valor > 0);
                //Thayane Rabonato - SIG 21529 - fim

            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                string msg = this.tratarMensagem(erro.Detail.mensagemErro);
                this.registrarAlerta(msg);
                //caixaNumericaPrazo.valorMinimo = 0; //William Moreira da Silva - SOL 201710
                //caixaNumericaPrazo.Text = "0"; //William Moreira da Silva - SOL 201710
                caixaNumericaPrazo.Enabled = false;

                this.calculoEfetuado = false;
            }
            finally
            {
                t.Abort();

                //Darivaldo Alencar SIG 32345 -inicio
                /*
                Porcentagem = 100;
                */
                if (!ignorarPorcentagemCalculoAnterior)
                {
                Porcentagem = 100;
            }
                //Darivaldo Alencar SIG 32345 -fim
            }

            this.idTitular = mutuario.idTitular; //Nilton 25/04/2013
            //proxyEstado.manterEstadoSincrono("idTitular", mutuario.idTitular); //Nilton 25/04/2013

            //Verifica assinatura e outras dividas
            // Thiago Melo SOL 204452 KTN 1976411            
            this.verificarAssinaturaEOutrasDividas(mutuario.idTitular, mutuario.id, idTipoContrato, this.flagTrataAssinat); //Nilton 12/03/2013
            // Thiago Melo SOL 204452 KTN 1976411

            this.habilitaAlteracao(true);
            //SIG 67808 - Matias            
            if (idTipoContrato == 95 || idTipoContrato == 96 || idTipoContrato == 97)
            {
                if (ValorPrestacaoBase >= ValorUltimaPrestacaoFGQC)
                {
                    this.registrarAlerta("O Valor da prestação (R$ " + ValorPrestacaoBase + ") deve ser menor que a prestação/FGQC (" + ValorUltimaPrestacaoFGQC + ") do(s) contrato(s) anterior(res).");
                }
            }
        }

        private string buscaContratosSelecionados()
        {
            var chavesSelecionadas = gridDividasEmprestimo.chavesSelecionadas;
            string contratosSelecionados = "";
            for (var x = 0; x < chavesSelecionadas.Count; x++)
            {
                contratosSelecionados += (chavesSelecionadas.Count <= 1 ? (chavesSelecionadas[x].Value.ToString()) : (chavesSelecionadas.Count > (x + 1) ? chavesSelecionadas[x].Value.ToString() + ", " : chavesSelecionadas[x].Value.ToString()));
        }


            return contratosSelecionados;
        }

        /// <summary>
        /// Valida o valor máximo com o valor solicitado
        /// </summary>
        /// <param name="valorSolicitado"></param>
        /// <param name="valorMaximoPermitido"></param>
        private bool validarValorMaximo()
        {

            //Felipe A. Santos  SOL 208770 PPM 201602 - fim - comentário
            if (!checkBoxMargem.Checked) // Felipe A. Santos  SOL 208770 PPM 201602 
            {
                if (caixaNumericaValorSolicitado.valor.Value > caixaNumericaValorMaximoPermitido.valor.Value)
                {
                    if (!checkBoxLiquidoZero.Checked)//Marcio Sanches Spinosa SOL 209188 KTN 2019292
                        caixaNumericaValorSolicitado.valor = caixaNumericaValorMaximoPermitido.valor.Value; // NILTON - CORRECAO - 06/02/13 
                    this.registrarAlerta("O Valor Solicitado não pode ser maior que " + caixaNumericaValorMaximoPermitido.valor.Value.ToString("N2") + ".");
                    return false;
                }
            }
            // Xavier SOL 178579 
            return true;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tipoContrato"></param>
        private void preencherItensContrato(List<ItemContrato> itensConcessao)
        {
            //proxyEstado.manterEstadoSincrono("listaItensContrato", itensConcessao);
            this.listaItensConcessao = itensConcessao; //Nilton 25/04/2013
            labelLiquidoGeral.Text = itensConcessao.Where(t1 => t1.centraliza == 1 && t1.tipoEvento.chave == TipoEvento.concessao.chave).Sum(t1 => t1.valor).ToString("N2");

            if (itensConcessao.Count != 0)
            {
                gridItens.DataSource = itensConcessao.FindAll(t1 => t1.centraliza == 0 && t1.tipoEvento.chave == TipoEvento.concessao.chave);
            }
            else
            {
                gridItens.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
            }

            gridItens.DataBind();

            this.calculaValorDescontos(itensConcessao);

        }

        /// <summary>
        /// 
        /// </summary>
        private void calculaValorDescontos(List<ItemContrato> itensContrato)
        {
            //INICIO - CORRECAO - NILTON - 04/02/13.
            double totalItens = 0;

            for (int i = 0; i < itensContrato.Count; i++)
            {
                if (itensContrato[i].centraliza == 0 && itensContrato[i].id != 158)
                {
                    totalItens += double.Parse(itensContrato[i].valor.ToString("N2")) * (itensContrato[i].pagarReceber == "P" ? 1 : -1);
                }
            }

            totalItens = totalItens - Convert.ToDouble(labelSaldoQuitar.Text) - (double)caixaNumericaValorSolicitado.valor;
            labelOutrosDescontos.Text = String.Format("{0:N2}", Math.Round(totalItens, 2));
            //FIM - CORRECAO - NILTON - 04/02/13.
        }

        /// <summary>
        /// Verifica Valor Solicitado
        /// </summary>
        /// <param name="valorSolicitado"></param>
        /// <param name="saldoDevedor"></param>
        /// <param name="valorDividas"></param>
        private bool verificarValorSolicitado()
        {
            double saldoDevedor = 0;
            double valorDividas = 0;

            if (!string.IsNullOrEmpty(labelSaldoQuitar.Text))
                saldoDevedor = Convert.ToDouble(labelSaldoQuitar.Text);

            if (!string.IsNullOrEmpty(labelOutrosDescontos.Text))
                valorDividas = Convert.ToDouble(labelOutrosDescontos.Text);


            if (caixaNumericaValorSolicitado.valorPontoFlutuante.Value < Math.Round((saldoDevedor + valorDividas), 2))//William Moreira da Silva - SOL 260665 PPM 1039568
            {

                // Felipe A. Santos  SOL 208770 PPM 201602 - início
                if (caixaNumericaValorSolicitado.valor.Value > caixaNumericaValorMaximoPermitido.valor.Value)
                {
                    this.registrarAlerta("O Valor Solicitado não pode ser menor que o Saldo a Quitar!");
                    return false;
                }
                // Felipe A. Santos SOL 208770 PPM 201602 - fim
            }

            return true;
        }

        private void calcularSuspensao()
        {
            if (ListaDropDownSuspensaoCobranca.SelectedIndex != 0)
            {
                //Campanha Desconto
                if (string.IsNullOrEmpty(ListaDropDownSuspensaoCobranca.SelectedValue))
                    return;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    TipoSuspensao tipoSuspensao = null;
                    List<TipoSuspensao> tipos = cliente.contrato.consultarTipoSuspensao(Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue), Convert.ToInt32(ListaDropDownSuspensaoCobranca.SelectedValue));

                    if (tipos != null && tipos.Count > 0)
                    {
                        tipoSuspensao = tipos[0];

                        //Data do termino da suspensão
                        if (caixaDataPrimeiraParcela.valorData.HasValue)
                        {
                            int meses = Convert.ToInt32(caixaNumericaSuspensao.Text) - 1;
                            caixaDataTerminoSuspensao.valorData = caixaDataPrimeiraParcela.valorData.Value.AddMonths(meses);
                        }

                        //Calcula valor da parcela suspensa.
                        if (tipoSuspensao.percentual.HasValue)
                        {
                            labelValorParcSuspensa.Text = ((double)Convert.ToDouble(labelPrestacaoBasica.Text) * (double)tipoSuspensao.percentual / 100).ToString("N2");
                        }

                    }
                }

            }
        }

        private void reaproveitarSuspensao()
        {
            if (String.IsNullOrEmpty(ListaDropDownSuspensaoCobranca.SelectedValue))
            {
                //Pega da maior data de suspensão de um contratos que irão ser quitados
                DateTime? dataSuspensao = this.listaContratosEmAbertos.FindAll(c => c.dataFimSuspensao != null && c.suspensao.tipo.id == 3 && (c.quitar == true || c.quitacaoObrigatoria == 1)).Max(c => c.dataFimSuspensao);

                if (dataSuspensao.HasValue && (caixaDataCredito.valorData.HasValue && dataSuspensao >= caixaDataCredito.valorData.Value))
                {
                    caixaDataTerminoSuspensao.valorData = dataSuspensao;
                    this.suspensaoReaproveitada = true;
                    registrarAlerta("Esse contrato poderá ter aproveitamento de Suspensão.\\nSe desejar solicitá-la favor promover o cadastro pelo campo Suspensão de Cobrança.");
                }
                else
                {
                    this.suspensaoReaproveitada = false;
                }
            }

        }

        private bool verificarAssinaturaEOutrasDividas(int idTitular, int idMutuario, int idTipoContrato, int? flgtrataassinat)//Nilton 12/03/2013 // Thiago Melo SOL 204452 KTN 1976411 
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                try
                {
                    List<string> listaAvisos;
                    // Thiago Melo SOL 204452 KTN 1976411                       
                    cliente.contrato.verificarAssinatura(idTitular, idMutuario, idTipoContrato, flgtrataassinat, out listaAvisos);//Nilton 12/03/2013
                    // Thiago Melo SOL 204452 KTN 1976411              

                    if (!checkBoxFinanciamento.Checked && !checkBoxExcepcional.Checked)
                    {
                        string outrasDividasAviso = String.Empty;
                        cliente.contrato.consultarOutrasDividas(idMutuario, out outrasDividasAviso);
                    }

                    return true;
                }
                catch (FaultException<ContratoFaltaNegocio> erro)
                {
                    string msg = this.tratarMensagem(erro.Detail.mensagemErro);
                    this.registrarAlerta(msg);
                    this.calculoEfetuado = false;//William Moreira da Silva - SOL 143476/16437
                    return false;
                }

            }

        }

        #endregion

        #region Contratar EP

        private void verificaParcelas()
        {

            if (caixaNumericaSuspensao.Enabled && !string.IsNullOrEmpty(caixaNumericaSuspensao.Text) && !caixaNumericaSuspensao.Text.Equals("0"))
            {
                if (!string.IsNullOrEmpty(caixaNumericaSuspensao.Text))
                {
                    if (Convert.ToInt32(caixaNumericaPrazo.Text) < Convert.ToInt32(caixaNumericaSuspensao.Text))
                    {
                        this.registrarAlerta("O Número máximo para suspensão é de: " + (Convert.ToInt32(caixaNumericaPrazo.Text) - 1).ToString() + " parcela(s). Favor verificar.");
                    }
                }
            }
        }

        //Jessica Y. Oshiro - SOL 235314-18140 -INICIO
        /// <summary>
        /// Verifica se data credito é dia util.
        /// </summary>
        /// <param name="dataCredito">Data credito como parametro</param>
        /// <returns>Se data credito é dia util.</returns>
        private bool verificaDataUtil(DateTime dataUtil)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                bool diaUtil = cliente.contrato.verificaDataUtil(dataUtil);

                if(!diaUtil)
                {
                    return false;
                }
            }

            return true;

        }
        //Jessica Y. Oshiro - SOL 235314-18140 -FIM

        private void verificarConcessaoExistente(int idMutuario, DateTime dataReferencia, int idTipoContrato)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                string aviso = String.Empty;
                bool existeConcessao = cliente.contrato.verificarConcessaoExistente(idMutuario, dataReferencia, idTipoContrato, out aviso);

                if (!existeConcessao)
                {
                    //this.continuarContratacaoEp(cliente);
                    this.verificarSuspensaoAnterior(cliente);
                }
                else
                {
                    this.statusContratacao = VerificarContratacao.concessaoExistente;
                    //WILLIAM MOREIRA DA SILVA - SOL 214086 KTN 2043803
                    this.registrarScript("validacao", String.Format("confirmarVerificarConcessaoExistente();"));
                    //this.ClientScript.RegisterStartupScript(this.GetType(), "confirmarVerificarConcessaoExistente", "<script>document.getElementById('" + botaoOcultoContinuarContratacaoEP.ClientID + "').click();</script>");
                    //this.RegisterStartupScript("confirmaContinuacaoContracacaoEP", "<script>document.getElementById('" + botaoOcultoContinuarContratacaoEP.ClientID + "').click();</script>");
                    //WILLIAM MOREIRA DA SILVA - SOL 214086 KTN 2043803
                }
            }
        }

        private void verificarSuspensaoAnterior(Cliente<IServicoConcessao> clienteConcessao)
        {
            //Monta lista dos contratos em Aberto
            StringBuilder listaContratos = new StringBuilder();
            this.listaContratosEmAbertos.OrderByDescending(c => c.numero).ToList<Contrato>().ForEach(c => listaContratos.Append(c.numero).Append(", "));

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                if (listaContratos.Length > 0 && cliente.contrato.verificarSuspensaoAnteriores(caixaDataCredito.valorData.Value, listaContratos.ToString().TrimEnd(',', ' ')))
                {
                    this.statusContratacao = VerificarContratacao.suspensaoAnterior;

                    //William Moreira da Silva - SIG 36211
                    this.registrarScript("validacao", String.Format("confirmarVerificarSuspensaoAnterior();"));
                    // Felipe A. Santos  SOL 208770 PPM 2016022 - início
                    //this.ClientScript.RegisterStartupScript(this.GetType(), "confirmarVerificarSuspensaoAnterior", "<script>document.getElementById('" + botaoOcultoContinuarContratacaoEP1.ClientID + "').click();</script>");
                    //this.registrarAlerta("O Contrato anterior possui suspensão.");

                    //this.registrarScript("validacao", String.Format("confirmarVerificarConcessaoExistente();"));
                    // Felipe A. Santos  SOL 208770 PPM 2016022 - fim
                    //William Moreira da Silva - SIG 36211
                }
                else
                {
                    this.continuarContratacaoEp(clienteConcessao, false);
                }
            }

        }
        // Xavier SOL 178579
        private void verificarCheckBoxExcepcional(Cliente<IServicoConcessao> clienteConcessao)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {

                this.ClientScript.RegisterStartupScript(this.GetType(), "habilitagrupoexcepcional", "<script>document.getElementById('" + botaoOcultoContinuarContratacaoEP1.ClientID + "').click();</script>");

            }

        }
        // Xavier SOL 178579

        private void continuarContratacaoEp(Cliente<IServicoConcessao> cliente, bool verificaConcessao)
        {
            try
            {
                if (verificaConcessao && statusContratacao == VerificarContratacao.concessaoExistente)
                {
                    this.verificarSuspensaoAnterior(cliente);
                }

                //Verifica conta corrente selecionada
                int idContaCorrente;
                if (!this.verificaContaSelecionada(out idContaCorrente))
                    return;

                Porcentagem = 50;

                //BRUNO AZEVEDO - SOL 167098 KINTANA  
                if (!this.verificaContaCaixa(idContaCorrente))
                    return;
                //BRUNO AZEVEDO - SOL 167098 KINTANA 

                Mutuario mutuario = this.mutuarioAtual;//this.proxyEstado.obterEstado("mutuario") as Mutuario;

                //Seta id da conta corrente
                mutuario.dadosBancarios = new DadosBancarios { id = idContaCorrente };

                DateTime dataCredito = Convert.ToDateTime(caixaDataCredito.Text);
                string aviso = String.Empty;

                int idTipoContrato = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue);

                cliente.contrato.consultarSuspensao(mutuarioAtual.id, idTipoContrato, dataCredito, false, out aviso);//MARCIO SANCHES SPINOSA SOL: 204468 KINTANA: 1976567
                //William Moreira da Silva - SOL 224562 KTN 2059616 - Inclusão do parametro veioConector, no caso false pois estamos no webemprestimo
                //cliente.contrato.consultarSuspensao(mutuario.id, dataCredito, out aviso);
                if (!String.IsNullOrEmpty(aviso))
                    this.registrarAlerta(aviso);

                //Nilton 25/04/2013
                List<ItemContrato> itensContrato = listaItensConcessao; //(proxyEstado.obterEstado("listaItensContrato") as List<ItemContrato>);


                //Filtra somente itens de concessão
                itensContrato = itensContrato.FindAll(t1 => t1.tipoEvento.chave == TipoEvento.concessao.chave);

                //Obtem contrato e itens de histórico para gravação da concessão
                Contrato contrato = this.obterContrato(mutuario);
                List<Historico> itensHistorico = this.obterItensHistorico(mutuario, itensContrato);

                // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - início
                if (contrato.FlagAcordoJudicial == 1)
                {
                    if (cliente.contrato.obterEventoJudicial() == 0)
                    {
                        registrarAlerta("Não há evento de cobrança para novações por Acordo Judicial parametrizado. A concessão não poderá ocorrer.");
                        return;
                    }
                }
                // Felipe A. Santos - SOL 224034/17909 PPM 1165556 - fim

                // Xavier SOL 172525
                string numProtocolo = "";//William Moreira da Silva - SOL 213725 KINTANA 2040469
                if (!string.IsNullOrEmpty(caixatextoNup.Text))
                {
                    //numProtocolo = Int64.Parse(caixatextoNup.Text.Replace(".", "").Replace("/", ""));
                    numProtocolo = caixatextoNup.Text.Replace(".", "").Replace("/", "");//William Moreira da Silva - SOL 213725 KINTANA 2040469
                }
                // Xavier SOL 172525

                Porcentagem = 70;
                //William Moreira da Silva - SOL 205048 KTN 1983964 - Inicio
                using (Cliente<IServicoContrato> clienteTipo = new Cliente<IServicoContrato>())//William Moreira da Silva - SOL 213725 KINTANA 2040469
                {
                    TipoContrato tipoContrato = clienteTipo.contrato.consultarTipoContrato(idTipoContrato, false);
                    if (!String.IsNullOrEmpty(numProtocolo) || (!tipoContrato.flgNumeroProtocolo))
                    {
                        contrato.numProtocolo = numProtocolo;
                    }
                    else
                    {
                        this.registrarAlerta("Número Único de Protocolo Obrigatório.");
                        return;
                    }
                }
                //William Moreira da Silva - SOL 205048 KTN 1983964 - Fim

                //William Moreira da Silva - SOL 226122 KTN 2060154
                List<long> contSelecionado;
                contSelecionado = this.obterContratosSelecionados();
                for (int i = 0; i < contSelecionado.Count; i++)
                {
                    this.listaContratosEmAbertos
                        .FindAll(c => c.numero == contSelecionado[i] && (c.quitar == false && c.quitacaoObrigatoria == 0))
                        .ForEach(delegate(Contrato d)
                    {
                        d.quitar = true;
                    }
                    );
                }
                //William Moreira da Silva - SOL 226122 KTN 2060154


                //SIG 71775
                //SIG 130294 - novas modalidades 13 (SAC) - Incluído os tipos 98 e 99
                if (idTipoContrato == 92 || idTipoContrato == 93 || idTipoContrato == 98 || idTipoContrato == 99)
                {
                    if (!checkBoxLiquidoZero.Checked && contSelecionado.Count >1)
                    {
                        this.registrarAlerta("Novação com as modalidades Credplan 13º salário só é permitida com líquido zero.");
                        return;
                    }
                }

                Porcentagem = 90;

                //William Moreira da Silva - SOL 199759
                if (gridAvalista.Rows.Count > 0)
                {
                    List<int> ListaAvalistas = new List<int>();
                    for (int i = 0; i < gridAvalista.Rows.Count; i++)
                    {
                        var chk = gridAvalista.Rows[i].FindControl("CheckBoxButton") as CheckBox;
                        if (chk != null && chk.Checked)
                        {                  
                            ListaAvalistas.Add(Int32.Parse(gridAvalista.DataKeys[i].Values["id"].ToString()));
                        }
                    }
                    contrato.avalistas = ListaAvalistas;
                }
                //William Moreira da Silva - SOL 199759
                if (checkBoxLiquidoZero.Checked == true)
                {
                    contrato.LiquidoZero = checkBoxLiquidoZero.Checked;


                    foreach (var item in itensHistorico)
                    {
                        if (item.item.descricao == "Valor Líquido")
                        {
                            item.valorEfetivo = 0;
                            item.dataEfetiva = item.dataPrevista;
                            item.dataRecebimento = item.dataPrevista;
                            item.baixado = 1;
                            item.enviado = 1;

                        }
                    }                    
                }

                //SIG 63057
                string contratoHTML = string.Empty;
                if (Session["ContratoHTML"] != null)
                    contratoHTML = Session["ContratoHTML"].ToString();

                //William Moreira da Silva - SOL 143476/16437
                long numeroContrato = cliente.contrato.gravar(contrato, itensHistorico, itensContrato, this.listaContratosEmAbertos.FindAll(c => c.quitar == true || c.quitacaoObrigatoria == 1), relatorio, contratoHTML);
 
                if (checkBoxDesconto.Checked)
                {
                    using (Cliente<IServicoContrato> clienteContrato = new Cliente<IServicoContrato>())
                    {
                        foreach (var contratoEmAberto in this.listaContratosEmAbertos)
                        {
                            if (contratoEmAberto.FlgCampanhaDescontos == 1)
                            {
                                clienteContrato.contrato.calcularGravarDesconto(contratoEmAberto.numero, contratoEmAberto.tipo.id, dataCredito, contratoEmAberto.itens, 3, 3);

                                //WO13621
                                if (numeroContrato > 0)
                                {
                                    cliente.contrato.IncluirEventoDeCobranca((double)contratoEmAberto.numero, DateTime.Today.Date, 32, $"Evento automático por adesão à Política de Recuperação de Crédito (P3). Contrato concedido: {numeroContrato}");
                                }
                            }
                        }

                        //WO13621
                        if (numeroContrato > 0)
                        {
                            cliente.contrato.IncluirEventoDeCobranca((double)numeroContrato,
                                                                         DateTime.Today.Date,
                                                                         32,
                                                                         "Evento automático por adesão à Política de Recuperação de Crédito (P3).");

                            if (Convert.ToDouble(labelValorTotalDescontos.Text) > 300) { 
                                cliente.contrato.incluirContratoEmptmoSuspconcessao(numeroContrato,
                                                                                    this.idPessoa,
                                                                                    "Bloqueio automático por adesão à Política de Recuperação de Crédito (P3).",
                                                                                    21,
                                                                                    12,
                                                                                    "89, 90, 92, 93");
                            }


                        }
                    }
                }


                /* Felipe A. Santos  SOL 208770 PPM 2016022 - início - comentário
                // Xavier SOL 178579
                if (!string.IsNullOrEmpty(caixaSelecaoGrupoExcepcional.SelectedValue))
                {
                    int idGrupoExcepcional = Convert.ToInt32(caixaSelecaoGrupoExcepcional.SelectedValue);

                    cliente.contrato.incluirContratoEmptmoXExcepcional(numeroContrato, idGrupoExcepcional);

                }
                // Xavier SOL 178579
                Felipe A. Santos SOL 208770 PPM 2016022 - fim - comentário 
                 */

                // Felipe A. Santos  SOL 208770 PPM 2016022 - início

                if (checkBoxMargem.Checked)
                    cliente.contrato.incluirContratoEmptmoXExcepcional(numeroContrato, 1);

                if (checkBoxElegibilidade.Checked)
                    cliente.contrato.incluirContratoEmptmoXExcepcional(numeroContrato, 2);

                if (checkBoxInadimplencia.Checked)
                    cliente.contrato.incluirContratoEmptmoXExcepcional(numeroContrato, 3);

                if (checkBoxOutros.Checked)
                    cliente.contrato.incluirContratoEmptmoXExcepcional(numeroContrato, 4);

                // Felipe A. Santos SOL 208770 PPM 2016022 - fim

                Porcentagem = 100;

                string msg = string.Format("Contrato de Empréstimo {0} inserido.", numeroContrato.ToString());

                this.confirmarOperacao(msg, "~/Paginas/CicloNormal/Emprestimo/Listagem.aspx");

            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                Porcentagem = 100; // Felipe A. Santos  SOL 208770 PPM 2016022
                this.registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
            }
            // Thiago Melo SOL 216474 Kintana 2045796
            finally
            {
                if (caixaDataPrimeiraParcela.horarioVerao)
                {
                    atribuiDtHorarioVerao();
                }
            }
            // Thiago Melo SOL 216474 Kintana 2045796                 
        }

        #endregion

        #endregion

        #region Contexto da Página / Permissões

        /// <summary>
        /// Obtém a identificação do contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.emprestimo;
            }
        }

        /// <summary>
        /// Obtém as permissões necessárias para o acesso à página.
        /// </summary>
        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }

        #endregion

        protected void checkBoxExcepcional_CheckedChanged(object sender, EventArgs e)
        {
            //using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            //{
            //    this.verificarCheckBoxExcepcional(cliente);  // Xavier
            //}

            if (checkBoxExcepcional.Checked)
            {
                caixaSelecaoGrupoExcepcional.Enabled = true;
            }
            else
            {
                caixaSelecaoGrupoExcepcional.SelectedValue = "";
                caixaSelecaoGrupoExcepcional.Enabled = false;
            }

        }

        //barraProgresso
        static void incrementaBarra()
        {
            using (Cliente<IServicoConcessao> Cliente = new Cliente<IServicoConcessao>())
            {
                List<int> regraItens = new List<int>();
                int regrasOld = 1;
                //totalRegras = 15;
                while (Porcentagem < 90)
                {
                    Thread.Sleep(1000);
                    regraItens = Cliente.contrato.obterStatusBarraProgresso(idBarraProgresso);

                    totalRegras = byte.Parse(regraItens[0].ToString());
                    regraAtual = byte.Parse(regraItens[1].ToString());
                    totalItens = byte.Parse(regraItens[2].ToString());
                    itemAtual = byte.Parse(regraItens[3].ToString());

                    //Darivaldo Alencar SIG65101 -Inicio
                    if (exeDuplo)
                    {
                        byte totalBase = totalRegras;
                        byte atualTotal = (byte)(totalBase * atualCalcLoop);

                        if (atualCalcLoop > 1)
                        {
                            regraAtual += (byte)(totalBase * (atualCalcLoop - 1));
                        }

                        totalRegras *= qtdeCalcLoop;

                        if (regraAtual > atualTotal)
                        {
                            regraAtual = atualTotal;
                        }
                    }
                    //Darivaldo Alencar SIG65101 -Fim

                    //Porcentagem++;
                    if ((regrasOld != regraAtual) && (regraAtual != 0))
                    {
                        Porcentagem += int.Parse(((90 / totalRegras) * (regraAtual - regrasOld)).ToString());
                        regrasOld = regraAtual;
                    }
                }
            }
        }

        // Thiago Melo SOL 216474 Kintana 2045796  
        private void atribuiDtHorarioVerao()
        {
            if (caixaDataPrimeiraParcela.Text == "20/10/2013")
            {
                string dt = "20/10/2013";
                caixaDataPrimeiraParcela.valorData = Convert.ToDateTime(dt);
            }
        }
        // Thiago Melo SOL 216474 Kintana 2045796

        //William Moreira da Silva - SOL 235732
        [WebMethod]
        public void limpaSession()
        {
            Session["ValorDivida"] = null;
            Session["valorAmortizacao"] = null;
            Session["ValorQuitacao"] = null;
        }
        //William Moreira da Silva - SOL 235732

        // Felipe A. Santos SOL 208770 Kintana 2016022 - início
        protected void CheckBoxGrupoExcepcional_CheckedChanged(object sender, EventArgs e)
        { 
            this.calculoEfetuado = false;
        }
        // Felipe A. Santos SOL 208770 Kintana 2016022 - fim

        protected void CheckBoxDesconto_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxDesconto.Checked && modalidadesPermitidasCampanhaDesconto())
            {
                checkBoxLiquidoZero.Checked =
                checkBoxMargem.Checked =
                checkBoxInadimplencia.Checked = true;

                checkBoxFinanciamento.Checked = false;

                checkBoxLiquidoZero.Enabled =
                checkBoxFinanciamento.Enabled =
                checkBoxMargem.Enabled =
                //checkBoxElegibilidade.Enabled =
                checkBoxInadimplencia.Enabled = false;
                //checkBoxOutros.Enabled = false;
            }
            else
            {
                checkBoxDesconto.Checked =
                checkBoxLiquidoZero.Checked =
                checkBoxMargem.Checked =
                checkBoxInadimplencia.Checked = false;

                checkBoxLiquidoZero.Enabled =
                checkBoxFinanciamento.Enabled =
                checkBoxMargem.Enabled =
                //checkBoxElegibilidade.Enabled =
                checkBoxInadimplencia.Enabled = true;
                //checkBoxOutros.Enabled = true;
            }
            if (!string.IsNullOrEmpty(caixaSelecaoTipoContrato.SelectedValue) && modalidadesPermitidasCampanhaDesconto())
            {
                int idTipoContrato = Convert.ToInt32(caixaSelecaoTipoContrato.SelectedValue);
                this.LimparCamposCalculados();
                this.desabilitarCamposSuspensao();

                this.calcularConcessao(this.mutuarioAtual, idTipoContrato, null);
            }
        }

        private bool modalidadesPermitidasCampanhaDesconto()
        {
            if (caixaSelecaoTipoContrato.SelectedValue.Equals("89") || caixaSelecaoTipoContrato.SelectedValue.Equals("90") || caixaSelecaoTipoContrato.SelectedValue == "")
                return true;
            else
                return false;
        }

        //William Moreira da Silva - SOL 143476/16437
        protected void gridAvalista_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Avalistas avalista = (Avalistas)e.Row.DataItem;
                if (HttpUtility.HtmlDecode(e.Row.Cells[5].Text).Trim().Equals(""))
                {
                    e.Row.Cells[6].Controls[1].Visible = true;
                    e.Row.Cells[6].Controls[3].Visible = false;
                    e.Row.Cells[6].Attributes["onClick"] = string.Format("return verificarSelecao({0});", avalista.id);
                }
                else
                {
                    e.Row.Cells[6].Controls[1].Visible = false;
                    e.Row.Cells[6].Controls[3].Visible = true;
                    e.Row.Cells[6].Attributes["onClick"] = string.Format("deletarConjuge({0});", avalista.idConjugue);
                }

                if (avalista.eConjuge)
                {
                    e.Row.Cells[1].Controls[1].Visible = false;
                    e.Row.Cells[6].Controls[1].Visible = false;
                    e.Row.Cells[6].Controls[3].Visible = false;
                }
            }
        }

        protected void botaoIncluirConjuge_Click(object sender, EventArgs e)
        {
            this.carregarGridAvalista();
        }

        protected void botaoExcluirConjuge_Click(object sender, EventArgs e)
        {
            List<Avalistas> ListaAvalistas = new List<Avalistas>();
            ListaAvalistas = (List<Avalistas>)Session["Avalista"];

            string idPessoa = idDltConjuge.Value.Trim();

            Avalistas avalista = ListaAvalistas.Single(t1 => t1.idConjugue == int.Parse(idPessoa));

            ListaAvalistas.RemoveAll(t1 => t1.id == int.Parse(idPessoa));
            ListaAvalistas.RemoveAll(t1 => t1.idConjugue == int.Parse(idPessoa));

            avalista.idConjugue = 0;
            avalista.nomeConjugue = string.Empty;

            ListaAvalistas.Add(avalista);
            Session["Avalista"] = ListaAvalistas;

            this.carregarGridAvalista();
        }
        //William Moreira da Silva - SOL 143476/16437

        //Darivaldo Alencar SIG 32345 -inicio
        bool ignorarPorcentagemCalculoAnterior = false;

        protected void checkBoxLiquidoZero_CheckedChanged(object sender, EventArgs e)
        {
            ignorarPorcentagemCalculoAnterior = true;

            //Thayane Rabonato/Darivaldo Alencar - SIG 21529 - inicio           
            if (!checouliquidozero)
            {
                SaldoQuitar = Convert.ToDouble(labelSaldoQuitar.Text);
                ValorSolicitado = Convert.ToDouble(caixaNumericaValorSolicitado.Text);
                ValorPrestacaoBase = Convert.ToDouble(labelPrestacaoBasica.Text);
                OutrosDescontos = Convert.ToDouble(labelOutrosDescontos.Text);
                LiquidoGeral = Convert.ToDouble(labelLiquidoGeral.Text);
                checouliquidozero = true;
            }

            if (checkBoxLiquidoZero.Checked)
            {
                checkBoxMargem.Enabled = false;
                checkBoxMargem.Checked = true;
                checkBoxInadimplencia.Enabled = false;
                checkBoxInadimplencia.Checked = true;

                //atualiza valor solicitado                        
                ignorarPorcentagemCalculoAnterior = true;
                botaoCalcular_Click(sender, e);
                ignorarPorcentagemCalculoAnterior = false;
                botaoCalcular_Click(sender, e);
            }
            else
            {
                checkBoxMargem.Enabled = true;
                checkBoxMargem.Checked = false;
                checkBoxInadimplencia.Enabled = true;
                checkBoxInadimplencia.Checked = false;

                labelSaldoQuitar.Text = SaldoQuitar.ToString("N2");
                caixaNumericaValorSolicitado.valor = ValorSolicitado;
                labelPrestacaoBasica.Text = ValorPrestacaoBase.ToString("N2");
                labelOutrosDescontos.Text = OutrosDescontos.ToString("N2");
                labelLiquidoGeral.Text = LiquidoGeral.ToString("N2");

                SaldoQuitar = 0;
                ValorSolicitado = 0;
                ValorPrestacaoBase = 0;
                OutrosDescontos = 0;
                LiquidoGeral = 0;
                checouliquidozero = false;
            }

            //atualiza valor solicitado                        
            //botaoCalcular_Click(sender, e);           
            //ignorarPorcentagemCalculoAnterior = false;

            //Thayane Rabonato - SIG 21529 - fim                            
        }
        //Darivaldo Alencar SIG 32345 -fim        

        //SIG 67808 - Campanha Descontos- Matias
        private bool CompararPrestAnteriorPrestBase(int IdTipoContrato)
        {
            //SIG 82500 - Saulo Cirineu
            if (checkBoxLiquidoZero.Checked == true  && ValorPrestacaoBase > Convert.ToDouble(caixaNumericaMargemConsignavel.Text) && checkBoxDesconto.Checked == false) //TAES - SIG117302
            {
                //SIG 130294 - novas modalidades 13 (SAC) - Incluído dos tipos 98 e 99
                if (caixaSelecaoTipoContrato.SelectedValue == "92" || caixaSelecaoTipoContrato.SelectedValue == "93" || caixaSelecaoTipoContrato.SelectedValue == "98" || caixaSelecaoTipoContrato.SelectedValue == "99")
                {            
                    if (ValorPrestacaoBase < Convert.ToDouble(labelSaldoQuitar.Text))
                    {
                        this.registrarAlerta("O valor do saldo inadimplente é maior que a prestação base.");
                        return false;
                    }
                }
                else 
                { 
                    if (ValorPrestacaoBase >= ValorUltimaPrestacaoFGQC)
                    {
                        this.registrarAlerta("Para concessão de líquido zero acima da margem o valor da prestação base (R$ " + String.Format("{0:N2}", ValorPrestacaoBase) + ") deve ser menor que soma das prestações e FGQC (R$ " + String.Format("{0:N2}", ValorUltimaPrestacaoFGQC) + ") dos contratos anteriores.");
                        return false;
                    }
                }
            }
            return true;
        }

        //Campanha Desconto
        private void BuscaDadosApiContratos(long NumContrato, int IdCalculo, ContratoDTO contratoDTO = null, List<DescontoInadimplencia> listaDescontos = null)
        {
            try
            {
                string strContrato = contratoDTO == null ? "" : JsonConvert.SerializeObject(contratoDTO, Formatting.Indented);
                string strDescontos = listaDescontos == null ? "" : JsonConvert.SerializeObject(listaDescontos, Formatting.Indented);
                string UriApigeradoraContrato = ConfigurationSettings.AppSettings["UriApigeradoraContrato"];

                IDictionary<string, object> parametros = new Dictionary<string, object>();
                parametros.Add("contrato", NumContrato);
                parametros.Add("calculo", IdCalculo);
                parametros.Add("internet", "1");
                parametros.Add("objContrato", strContrato);
                parametros.Add("descontosCampanha", strDescontos);

                //IDictionary<string, IDictionary<string, object>> root = new Dictionary<string, IDictionary<string, object>>();
                //root.Add("sendParametros", parametros);

                string json = JsonConvert.SerializeObject(parametros, Formatting.Indented);

                HttpClient cliente = new HttpClient();
                cliente.BaseAddress = new Uri(UriApigeradoraContrato);

                using (StringContent content = new StringContent(json, Encoding.UTF8, "application/json"))
                {
                    var response = cliente.PostAsync(UriApigeradoraContrato, content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                        var strJson = response.Content.ReadAsStringAsync().Result;
                        JObject retornoJson = JsonConvert.DeserializeObject<JObject>(strJson);
                        //ContratoDTO Contrato = retornoJson.ToObject<ContratoDTO>();
                        ContratoDTO contrato = new ContratoDTO(retornoJson.ToString());

                        if (contrato == null || string.IsNullOrEmpty(contrato.ContratoHTML))
                        {
                            throw new Exception("Erro ao gerar documento de contrato.");
                        }

                        //var retornoContrato = retornoJson["sendResponse"];

                        Response.ContentType = "application/pdf";
                        //Response.AddHeader("content-Disposition", "inline;filename=contrato.pdf");
                        Response.AddHeader("content-length", contrato.ContratoImpressao.Length.ToString());
                        Response.BinaryWrite(contrato.ContratoImpressao);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //private ContratoDTO ToContratoDTO(RelatorioContrato relatorioContrato, List<DescontoInadimplencia> listaDescontos)
        //{
        //    ContratoDTO contrato = new ContratoDTO(string.Empty);

        //    contrato.NumeroContrato = relatorioContrato.numeroContrato;
        //    contrato.NumParcelas = relatorioContrato.prazo;
        //    contrato.Prazo = relatorioContrato.prazo;

        //    contrato.FlgPossuiCarimbo = 0;
        //    contrato.FlgEfetivado = 0;
        //    contrato.FlgLiquidoZero = 1;
        //    //model.TaxaJuros = relatorioContrato.per
        //    //model.PrestacaoBasica = PrestacaoBasica;
        //    //model.Fgqc = Fgqc;
        //    //model.FgqcBasico = FgqcBasico;
        //    //model.Iof = Iof;
        //    //model.Margem = Margem;
        //    //model.SalarioBase = SalarioBase;
        //    //model.ConcessaoTaxaAdministrativa = ConcessaoTaxaAdministrativa;
        //    //model.ConcessaoEmptmoAnterior = ConcessaoEmptmoAnterior;
        //    //model.SaldoDevedor = SaldoDevedor;
        //    //model.DescontoInad = DescontoInad;
        //    //model.ValorContrato = ValorContrato;
        //    contrato.ValorLiquido = 0;
        //    contrato.ValorMaximo = relatorioContrato.valorMaximo;
        //    contrato.ValorSolicitado = relatorioContrato.valorMaximo;
        //    //contrato.ValorParcela = relatorio.val
        //    //contrato.ValorQuitacao = ValorQuitacao;
        //    contrato.DataCredito = DateTime.Now.Date;
        //    //contrato.DataParcela = DataParcela;
        //    contrato.DataAssinatura = relatorioContrato.dataAssinatura;
        //    //contrato.DataSaldo = DataSaldo;
        //    contrato.Valido = true;
        //    contrato.MsgErro = string.Empty;
        //    contrato.DadosBancarios = string.Empty;
        //    contrato.Modalidade = relatorioContrato.tipoContrato.descricao;
        //    //contrato.ModalidadeResumida = ModalidadeResumida;
        //    contrato.ContrAntQuit = relatorioContrato.contratosQuitados;
        //    contrato.FlgObrigatorio = "1";
        //    contrato.SeloCarimboTempo = string.Empty;
        //    contrato.Ip = "0";

        //    contrato.Matricula = relatorioContrato.mutuario.matricula;
        //    contrato.Nome = relatorioContrato.mutuario.nome;
        //    contrato.Cpf = relatorioContrato.mutuario.cpf;
        //    contrato.Rg = relatorioContrato.identidade;

        //    contrato.Logradouro = relatorioContrato.logradouro;
        //    contrato.Bairro = relatorioContrato.bairro;
        //    contrato.Cidade = relatorioContrato.cidade.nome;
        //    contrato.Uf = relatorioContrato.uf.codEstado;
        //    contrato.Cep = relatorioContrato.cep;

        //    contrato.TelCelular = relatorioContrato.numeroCelular;
        //    contrato.TelComercial = relatorioContrato.numeroComercial;
        //    contrato.TelResidencial = relatorioContrato.numeroResidencial;


        //    relatorio.conta.agencia = relatorio.conta.agencia.ToString().Substring(0, 4);
        //    relatorio.conta.operacao = relatorio.conta.contaCorrente.Substring(0, 3);
        //    relatorio.conta.contaCorrente = relatorio.conta.contaCorrente.Substring(3);

        //    contrato.Agencia = relatorioContrato.conta.agencia.ToString().Substring(0, 4);
        //    contrato.Operacao = relatorio.conta.operacao.ToString();
        //    contrato.Conta = relatorio.conta.contaCorrente.ToString();

        //    contrato.Emails = relatorioContrato.emailComercial + " - " + relatorioContrato.emailPessoal;
        //    contrato.ValorMaxPermitido = (double)relatorioContrato.valorMaximo;
        //    contrato.Codigo_Hash = "5B9E020D3E31";
        //    contrato.HashAssinatura = "15BF532D22345576B4A51B96DA4754C039EF3458494066D76828E893D69EBD1E";
        //    contrato.DataHoraCarimboTempo = DateTime.Now.ToString();
        //    contrato.IdTipoContrato = relatorioContrato.tipoContrato.id;
        //    contrato.ContratoQuitaAnterior = relatorioContrato.contratosQuitados;
        //    contrato.IdPessoa = relatorioContrato.mutuario.id;
        //    contrato.IdTitular = relatorioContrato.mutuario.idTitular;
        //    contrato.ConcessaoInternet = 0;

        //    contrato.descontoInadimplencia = listaDescontos;

        //    //contrato.fiadores = relatorioContrato.fiadores;
        //    contrato.financiamento = relatorioContrato.financiamento;
        //    contrato.valorFinanciamento = relatorioContrato.valorFinanciamento;
        //    return contrato;
        //}

        protected void gridDividasEmprestimo_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            Porcentagem = itemAtual = totalItens = regraAtual = totalRegras = 0;

            if (checkBoxDesconto.Checked)
            {
                long numContrato = Convert.ToInt64(gridDividasEmprestimo.DataKeys[Convert.ToInt32(e.CommandArgument)].Value);
                Porcentagem = 5;
                descontoQuitacao = obterDesconto(numContrato);
                Porcentagem = 90;
                string guidDesconto = Guid.NewGuid().ToString();
                this.proxyEstado.manterEstadoSincrono(guidDesconto, descontoQuitacao);
                //Abrir o form em um popup
                String strurl = String.Format("PopupDesconto.aspx?guidDesconto={0}", guidDesconto);
                String strscript = "window.open('../../Popup/" + strurl + "', 'name','height=280,width=720,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup para exibição dos descontos", strscript, true);
            }
            else
            {
                this.registrarAlerta("Para ativar o desconto é necessário marcar a opção Campanha de Descontos.");
            }
            Porcentagem = 100;
        }

        private List<ItemDescontoContrato> obterDesconto(long numContrato)
        {

            DateTime dataQuitacao = (DateTime)caixaDataCredito.valorData;
            TipoContrato tipoContrato;
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                tipoContrato = cliente.contrato.ConsultarTipoContrato(int.Parse(caixaSelecaoTipoContrato.SelectedValue));
            }
            //List<ItemDescontoContrato> descontoQuitacao;
            descontoQuitacao = null;
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                var itens = cliente.contrato.calcularItensQuitacao(tipoContrato, numContrato, dataQuitacao, TipoOperacao.concessao, checkBoxDesconto.Checked);
                Porcentagem = 70;
                descontoQuitacao = cliente.contrato.obterDesconto(numContrato, tipoContrato.id, dataQuitacao, itens, 3, 3);
            }
            return descontoQuitacao;
        }

        private bool CompararPrestacaoBaseMaiorMargem()
        {
            if (Convert.ToDouble(caixaNumericaMargemConsignavel.Text) < Math.Round(ValorPrestacaoBase,2))
            {                
                return true;
            }
            return false;
        }

        #region Avalista
        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurarFiador_Click(object sender, EventArgs e)
        {
            gridIncluirAvalista.DataSourceID = dataSourceAvalista.ID;
            Porcentagem = 100;
            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "ExibirBuscaFiador", "ExibirIncluirFiador();", true);
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceAvalista_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //Verifica quais parametros usar.
            tratarFiltros(ref e);
        }

        protected void gridProcuraAvalista_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#93A3B0'; this.style.color='White'; this.style.cursor='pointer'");
                if (e.Row.RowState == DataControlRowState.Alternate)
                {
                    e.Row.Attributes.Add("onmouseout", String.Format("this.style.color='Black';this.style.backgroundColor='{0}';", gridIncluirAvalista.AlternatingRowStyle.BackColor.ToKnownColor()));
                }
                else
                {
                    e.Row.Attributes.Add("onmouseout", String.Format("this.style.color='Black';this.style.backgroundColor='{0}';", gridIncluirAvalista.RowStyle.BackColor.ToKnownColor()));
                }
                e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(gridIncluirAvalista, "Select$" + e.Row.RowIndex.ToString()));
            }
            /*
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink link = e.Row.Cells[0].Controls[0] as HyperLink;

                e.Row.Cells[4].Text = Request.QueryString["conjuge"];

                //William Moreira da Silva - SOL 143476/16437 
                if (e.Row.Cells[4].Text == "0")
                {
                    e.Row.Cells[0].Attributes["onClick"] = string.Format("exibirDialogo('PopupAvalista.aspx?id={0}&conjuge={1}', 1000, 500); fecharRetorno('Avalista incluido com sucesso.');", ((Avalistas)e.Row.DataItem).id, e.Row.Cells[4].Text);
                }
                else
                {
                    e.Row.Cells[0].Attributes["onClick"] = string.Format("exibirDialogo('PopupAvalista.aspx?id={0}&conjuge={1}', 1000, 500); fecharRetorno('Cônjuge incluido com sucesso.');", ((Avalistas)e.Row.DataItem).id, e.Row.Cells[4].Text);
                }
                //William Moreira da Silva - SOL 143476/16437 
            }*/
        }

        protected void gridProcuraAvalista_SelectedIndexChanged(object sender, EventArgs e)
        {
            GlobalWeb.Web.IU.Controles.Grid grid = (GlobalWeb.Web.IU.Controles.Grid)sender;
            adicionaAvalista(grid.SelectedValue.ToString());
        }

        private void adicionaAvalista(string CPF)
        {
            List<Avalistas> avalistas = (List<Avalistas>)Session["Avalista"];
            if (avalistas == null)
                avalistas = new List<Avalistas>();

            Porcentagem = 10;

            List<Avalistas> novosAvalistas = new List<Avalistas>();

            foreach (var avalista in avalistas)
            {
                if (!avalista.cpf.Equals(CPF))
                    novosAvalistas.Add(avalista);
            }

            Porcentagem = 20;

            Avalistas avalistaSelecionado = new Avalistas() { cpf = CPF };
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                cliente.contrato.obterInfoAvalista(ref avalistaSelecionado);
            }

            Porcentagem = 80;

            novosAvalistas.Add(avalistaSelecionado);

            Session["Avalista"] = novosAvalistas;

            gridAvalista.DataSource = novosAvalistas;
            gridAvalista.DataBind();

            Porcentagem = 100;
        }

        protected void botaoNovoAvalista_Click(object sender, EventArgs e)
        {
            Porcentagem = 100;
            String strurl = String.Format("PopupNovoAvalista.aspx");
            String strscript = "window.open('" + strurl + "', 'name','height=500,width=1180,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no')";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup para cadastro de avalista", strscript, true);
        }
        #endregion
    }
}