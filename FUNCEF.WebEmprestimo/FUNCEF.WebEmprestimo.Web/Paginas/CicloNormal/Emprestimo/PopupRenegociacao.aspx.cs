#region SIG 21529.52136
/// Autor:
/// Darivaldo Alencar
///
/// Descrição da Alteração:
/// Relatório renegociação
#endregion
#region SIG 21529
/// Autor:
/// Thayane Rabonato/Darivaldo Alencar
///
/// Descrição da Alteração:
/// Criação da popup de Renegociação
#endregion

using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.Componentes;
using System.Web.UI;
using System.Linq;
using System.Data;
using FUNCEF.Planus.WebEmprestimo.Web.Boleto;
using Microsoft.Reporting.WebForms;
using System.Reflection;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo
{
    public partial class PopupRenegociacao : PaginaSeguraComEstado
    {
        #region Propriedades              
        private List<ContratoRenegociacao> reneg
        {
            get
            {
                if (ViewState["reneg"] != null)
                    return (List<ContratoRenegociacao>)ViewState["reneg"];
                else
                    return null;

            }
            set
            {
                this.ViewState["reneg"] = value;
            }
        }

        private string indiceCorrecaoSaldoDevedor { get; set; }

        private IDictionary<int, bool> ParcSelecionada
        {
            get
            {
                return (IDictionary<int, bool>)this.ViewState["ParcSelecionada"];
            }
            set
            {
                this.ViewState["ParcSelecionada"] = value;
            }
        }

        private IDictionary<int, bool> ParcSelecionadaUsuario
        {
            get
            {
                return (IDictionary<int, bool>)this.ViewState["ParcSelecionadaUsuario"];
            }
            set
            {
                this.ViewState["ParcSelecionadaUsuario"] = value;
            }
        }

        private double? valorTotalParcQuitar
        {
            get
            {
                return (this.ViewState["valorTotalParcQuitar"] == null ? 0d : (double)this.ViewState["valorTotalParcQuitar"]);
            }
            set
            {
                this.ViewState["valorTotalParcQuitar"] = value;
            }
        }

        private double? UltimoValorAmortizar
        {
            get
            {
                return (this.ViewState["UltimoValorAmortizar"] == null ? 0d : (double)this.ViewState["UltimoValorAmortizar"]);
            }
            set
            {
                this.ViewState["UltimoValorAmortizar"] = value;
            }
        }

        private double? valorAmortizar
        {
            get
            {
                return (this.ViewState["valorAmortizar"] == null ? 0d : (double)this.ViewState["valorAmortizar"]);
            }
            set
            {
                this.ViewState["valorAmortizar"] = value;
            }
        }

        private string matricula
        {
            get
            {
                return string.IsNullOrEmpty(Request.QueryString["matricula"]) ? string.Empty : Request.QueryString["matricula"];
            }
        }

        private int tipoContrato
        {
            get
            {
                string queryString = Request.QueryString["tipoContrato"];
                int numero = 0;
                int.TryParse(queryString, out numero);
                return numero;
            }
        }

        private DateTime dataCredito
        {
            get
            {
                string queryString = Request.QueryString["dataCredito"];
                DateTime data;
                DateTime.TryParse(queryString, out data);
                return data;
            }
        }

        private DateTime dataPrimeiraParcela
        {
            get
            {
                string queryString = Request.QueryString["dataPrimeiraParcela"];
                DateTime data;
                DateTime.TryParse(queryString, out data);
                return data;
            }
        }

        private Double taxaJuros
        {
            get
            {
                string queryString = Request.QueryString["taxaJuros"];
                Double taxa = 0;
                Double.TryParse(queryString, out taxa);
                return taxa;
            }
        }

        private int quantidadeParcelas
        {
            get
            {
                string queryString = Request.QueryString["quantidadeParcelas"];
                int numero = 0;
                int.TryParse(queryString, out numero);
                return numero;
            }
        }

        private Double valorSaldoQuitar
        {
            get
            {
                if (this.ViewState["valorSaldoQuitar"] == null)
                {
                    string queryString = Request.QueryString["valorSaldoQuitar"];
                    Double valor = 0;
                    Double.TryParse(queryString, out valor);
                    this.ViewState["valorSaldoQuitar"] = valor;
                    return valor;
                }
                else
                {
                    return (Double)this.ViewState["valorSaldoQuitar"];
                }
            }
            set
            {
                this.ViewState["valorSaldoQuitar"] = value;
            }
        }

        private double? valorSolicitado
        {
            get
            {
                if (this.ViewState["valorSolicitado"] == null)
                {
                    string queryString = Request.QueryString["valorSolicitado"];
                    double valor = 0;
                    double.TryParse(queryString, out valor);
                    this.ViewState["valorSolicitado"] = valor;
                    return valor;
                }
                else
                {
                    return (double)this.ViewState["valorSolicitado"];
                }
            }
            set
            {
                this.ViewState["valorSolicitado"] = value;
            }
        }

        private Double valorMaximoPermitido
        {
            get
            {
                string queryString = Request.QueryString["valorMaximoPermitido"];
                Double valor = 0;
                Double.TryParse(queryString, out valor);
                return valor;
            }
        }

        private Double valorPrestacaoBase
        {
            get
            {
                string queryString = Request.QueryString["valorPrestacaoBase"];
                Double valor = 0;
                Double.TryParse(queryString, out valor);
                return valor;
            }
        }

        private Double valorMargem
        {
            get
            {
                string queryString = Request.QueryString["valorMargem"];
                Double valor = 0;
                Double.TryParse(queryString, out valor);
                return valor;
            }
        }

        private Double valorFGQC
        {
            get
            {
                string queryString = Request.QueryString["valorFGQC"];
                Double valor = 0;
                Double.TryParse(queryString, out valor);
                return valor;
            }
        }

        private String idContratosAnteriores
        {
            get
            {
                String queryString = Request.QueryString["idContratosAnteriores"];
                if (queryString != null)
                {
                    if (queryString.Substring(0, 1).Equals(","))
                    {
                        return queryString.Substring(1);
                    }

                    return queryString;
                }
                else
                    return String.Empty;

            }
        }

        private string guidItens
        {
            get
            {
                //string queryString = Request.QueryString["guidItens"];
                string queryString = Guid.NewGuid().ToString();

                return queryString;
            }
        }

        private double somaItensConcessao { get; set; }

        private Double ValorUltimaPrestacaoFGQC
        {
            get
            {
                string queryString = Request.QueryString["ValorUltimaPrestacaoFGQC"];
                Double valor = 0;
                Double.TryParse(queryString, out valor);
                return valor;
            }
        }

        private int idMutuario
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

        private Double salarioBase { get; set; }
        //{
        //    get
        //    {
        //        if (this.ViewState["salarioBase"] != null)
        //            return (Double)this.ViewState["salarioBase"];
        //        else
        //            return 0;
        //    }

        //    set
        //    {
        //        this.ViewState["salarioBase"] = value;
        //    }
        //}

        private bool excepcional
        {
            get
            {
                if (this.ViewState["excepcional"] == null)
                    this.ViewState["excepcional"] = Request.QueryString["excepcional"];
                bool retorno = false;

                bool.TryParse((string)this.ViewState["excepcional"], out retorno);

                return retorno;
            }
            set
            {
                this.ViewState["excepcional"] = value;
            }
        }
        private double valorParcela { get; set; }
        //{
        //    get
        //    {
        //        if (this.ViewState["vlrParcela"] != null)
        //            return (double)this.ViewState["vlrParcela"];
        //        else
        //            return 0d;
        //    }

        //    set
        //    {
        //        this.ViewState["vlrParcela"] = value;
        //    }
        //}
        //private string matricula { get; set; }
        //{
        //    get
        //    {
        //        if (this.ViewState["matricula"] != null)
        //            return (string)this.ViewState["matricula"];
        //        else
        //            return 0d;
        //    }

        //    set
        //    {
        //        this.ViewState["matricula"] = value;
        //    }
        //}
        #endregion

        #region Eventos        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarRenegociacao(IsPostBack);
                this.ParcSelecionada = GuardarParcelasMarcadas(IsPostBack);
                GuardarRetorno("não");
            }
        }

        protected void botaoAtualizarCalculo_Click(object sender, EventArgs e)
        {
            CarregarRenegociacao(true);

            GuardarRetorno("sim");

            DevolveMarcacaoParcelas();
        }

        protected void CheckBoxButton_CheckedChanged(object sender, EventArgs e)
        {
            string VlrScroll = hdfScroll.Value;
            string VlrScrollLeft = hdfScrollLeft.Value;
            double? totParcQuitarInicial = caixaNumericaValorTotalParcelasQuitar.valor;

            GuardarParcelasMarcadas(true);

            CalcularValorTotalParcelas();

            AtualizaValorSolicitado(totParcQuitarInicial);
            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "script", "SetarScrollAnterior(" + VlrScroll + "," + VlrScrollLeft + "); ", true);

        }

        protected void checkBoxSelecionarTodas_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                double? totParcQuitarInicial = caixaNumericaValorTotalParcelasQuitar.valor;

                if (checkBoxSelecionarTodas.Checked)
                {
                    SelecionarTodasParcelas(true);
                }
                else
                {
                    SelecionarTodasParcelas(false);
                }

                CalcularValorTotalParcelas();

                AtualizaValorSolicitado(totParcQuitarInicial);
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
            finally
            {
            }
        }

        protected void repeaterContratosRefinanciamento_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    GridView grd = (GridView)(e.Item.FindControl("gridParcelasRefinanciamento"));
                    grd.DataBind();
                    grd.Columns[4].Visible = false;
                }
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
            finally
            {
            }
        }

        protected void gridParcelasRefinanciamento_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox campo = (CheckBox)e.Row.FindControl("CheckBoxButton");
                    Parcela prestacao = (Parcela)e.Row.DataItem;
                    Boolean acao = Convert.ToBoolean(prestacao.IsMarcado);

                    campo.Enabled = !acao;
                    campo.Checked = acao;
                }
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
            finally
            {
            }
        }

        public void MontarColunasDT(ref DataTable dtRel)
        {
            dtRel.Columns.Add("nome_mutuario", typeof(string));
            dtRel.Columns.Add("cpf_mutuario", typeof(string));
            dtRel.Columns.Add("matricula_mutuario", typeof(string));
            dtRel.Columns.Add("patrocinadora_mutuario", typeof(string));
            dtRel.Columns.Add("plano_mutuario", typeof(string));
            dtRel.Columns.Add("situacao_mutuario", typeof(string));

            dtRel.Columns.Add("nr_contrato", typeof(string));
            dtRel.Columns.Add("modalidade_contrato", typeof(string));
            dtRel.Columns.Add("juros_contrato", typeof(string));
            dtRel.Columns.Add("icsd_contrato", typeof(string));
            dtRel.Columns.Add("prazo_contrato", typeof(string));
            dtRel.Columns.Add("dtcredito_contrato", typeof(string));

            dtRel.Columns.Add("mes_ano_ref_itens", typeof(string));
            dtRel.Columns.Add("item_itens", typeof(string));
            dtRel.Columns.Add("parcela_itens", typeof(string));
            dtRel.Columns.Add("dtvencimento_itens", typeof(string));
            dtRel.Columns.Add("vlrnominal_itens", typeof(double));
            dtRel.Columns.Add("vlrcorrecao_monetaria_itens", typeof(double));
            dtRel.Columns.Add("vlrmulta_itens", typeof(double));
            dtRel.Columns.Add("vlrjuros_mora_itens", typeof(double));
            dtRel.Columns.Add("vlrjuros_remun_itens", typeof(double));
            dtRel.Columns.Add("vlriof_compl_itens", typeof(double));
            dtRel.Columns.Add("vlrtot_encargos_itens", typeof(double));
            dtRel.Columns.Add("vlrtotal_itens", typeof(double));

            dtRel.Columns.Add("valorSaldoDevedorVencido", typeof(double));
            dtRel.Columns.Add("valorSaldoDevedoraVencer", typeof(double));
            dtRel.Columns.Add("valorSaldoDevedorTotal", typeof(double));
            dtRel.Columns.Add("dataProjecao", typeof(string));
            dtRel.Columns.Add("valorItensConcessao", typeof(double));            

        }

        public void ConvertToDataTable()
        {
            Mutuario mutuario = new Mutuario();
            DataTable dtRel = new DataTable();            
            MontarColunasDT(ref dtRel);

            double?[] vEncargos = null;            

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                foreach (ContratoRenegociacao contrato in this.reneg)
                {
                    bool gravaContrato = true;
                    this.indiceCorrecaoSaldoDevedor = cliente.contrato.DataCreditoPossuiINPC(this.dataCredito.ToString("dd/MM/yyyy")) ? "INPC": string.Empty;
                    Dictionary<string, object> infoContrato = cliente.contrato.buscaInfoContrato(Convert.ToInt64(contrato.numeroContrato));
                    int totalParcelasContrato = (int) infoContrato["NUMPARCELAS"];

                    //double saldoDevedoraVencer = cliente.contrato.obterSaldoDevedor(Convert.ToInt64(contrato.numeroContrato), this.dataCredito);

                    foreach (Parcela parcela in contrato.itens.Where(x=> x.IsMarcado == true))
                    {
                        //if (gravaContrato)
                        //{
                        //    gravaContrato = false;

                            ParametrosConsulta parametrosConsulta = new ParametrosConsulta();
                            double valorTotalItens = 0d;
                            List<ItemContrato> ParcelasAbertas = cliente.contrato.obterItensEmAberto(Convert.ToInt64(parcela.numeroContrato), parcela.NumeroParcela);                            

                            foreach (ItemContrato item in ParcelasAbertas)
                            {
                                #region encargos de parcelas                          

                                Dictionary<string, double> valorEncargos = cliente.contrato.EncargosDaParcela(item, Convert.ToInt64(parcela.numeroContrato), this.dataCredito, false);

                                //vEncargos = new double?[5];
                                //vEncargos[0] = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Correcao_Monetaria").Value;
                                //vEncargos[1] = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Multa").Value;
                                //vEncargos[2] = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Moratorios").Value;
                                //vEncargos[3] = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Remuneratorios").Value;
                                //vEncargos[4] = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "IOF_Complementar").Value;
                                ////vEncargos[5] = valorEncargos.Single(x => x.Key == "FGQC").Value;
                                //double? totaisEncargos = item.descricao == "FGQC" ? 0 : (vEncargos[0] + vEncargos[1] + vEncargos[2] + vEncargos[3] + vEncargos[4]);

                                double correcaoMonetaria = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Correcao_Monetaria").Value;
                                double multa = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Multa").Value;
                                double jurosMoratorios = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Moratorios").Value;
                                double jurosRemuneratorios = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "Juros_Remuneratorios").Value;
                                double iofComplementar = item.descricao == "FGQC" ? 0d : valorEncargos.Single(x => x.Key == "IOF_Complementar").Value;
                                
                                //Soma dos encargos
                                double? totaisEncargos = item.descricao == "FGQC" ? 0 : (correcaoMonetaria + multa + jurosMoratorios + jurosRemuneratorios + iofComplementar);

                                #endregion

                                if (!String.IsNullOrEmpty(this.matricula))
                                {
                                    using (Cliente<IServicoMutuario> gerenciador = new Cliente<IServicoMutuario>())
                                    {
                                        mutuario = gerenciador.contrato.obterDadosMutuario(matricula);

                                        double saldoDevedorVencido = (double) totaisEncargos + item.valor;
                                        //double saldoDevedorTotal = saldoDevedorVencido + saldoDevedoraVencer;
                                        DateTime dataProjecao = this.dataCredito;

                                        if ((item.descricao == "FGQC") || (item.descricao == "Prestação"))
                                        {
                                            dtRel.Rows.Add(mutuario.nome, 
                                                           mutuario.cpf, 
                                                           mutuario.matricula, 
                                                           mutuario.patrocinadora.nome, 
                                                           mutuario.plano.descricao, 
                                                           mutuario.situacao,
                                                           parcela.numeroContrato, 
                                                           parcela.Modalidade, 
                                                           string.Format("{0} % (ao ano)", item.taxaJuros), 
                                                           this.indiceCorrecaoSaldoDevedor,
                                                           totalParcelasContrato,
                                                           //this.quantidadeParcelas, 
                                                           this.dataCredito.ToString("dd/MM/yyyy"), 
                                                           item.dataPrevista.ToString("MM/yyyy"), 
                                                           item.descricao, 
                                                           string.Format("{0}/{1}", item.parcela, item.numeroParcelas),
                                                           //itensAbertos.Count), 
                                                           item.dataPrevista.ToString("dd/MM/yyyy"),
                                                           item.valor,
                                                           //vEncargos[0], 
                                                           //vEncargos[1], vEncargos[2], 
                                                           //vEncargos[3], vEncargos[4], 
                                                           correcaoMonetaria, 
                                                           multa, 
                                                           jurosMoratorios, 
                                                           jurosRemuneratorios,
                                                           iofComplementar,
                                                           totaisEncargos,
                                                           totaisEncargos + item.valor,
                                                           saldoDevedorVencido,                                                        
                                                           0,//saldoDevedoraVencer, 
                                                           0,//saldoDevedorTotal, 
                                                           dataProjecao,
                                                           (caixaNumericaFGQC.valor+caixaNumericTxAdm.valor+caixaNumericaIOF.valor)
                                                           );

                                        }
                                    }
                                }
                            }
                        //}
                    }
                }
            }        

            Session["RelReneg"] = dtRel;           
        }

        protected void btnOKModal_Click(object sender, EventArgs e)
        {            
            ConvertToDataTable();
            string pagina = string.Format("~/Relatorio/Renegociacao/RenegociacaoPDF.aspx?TipoArquivo={0}", "P");

            if (rdbExcel.Checked)
                pagina = string.Format("~/Relatorio/Renegociacao/RenegociacaoPDF.aspx?TipoArquivo={0}", "E");


            Server.Transfer(pagina, true);
        }

        protected void btnGeraBoleto_Click(object sender, EventArgs e)
        {
            //string pagina = string.Format("~/Boleto/Pdf.aspx");

            //Server.Transfer(pagina, true);

            PrepararBoleto();
        }
        #endregion

        #region Métodos        
        public void CarregarRenegociacao(bool EhPostBack)
        {
            caixaNumericaIOF.valor = 0;            
            caixaNumericTxAdm.valor = 0;
            caixaNumericaFGQC.valor = 0;
            try
            {
                this.reneg = new List<ContratoRenegociacao>();

                //Obtêm Mutuario
                Mutuario mutuario = new Mutuario();
                if (!String.IsNullOrEmpty(matricula))
                {
                    using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                    {
                        mutuario = cliente.contrato.obterDadosMutuario(matricula);
                    }
                }

                //Obtêm Id Calculo
                int? IdCalculo = 0;
                using (Cliente<IServicoContrato> Cliente = new Cliente<IServicoContrato>())
                {
                    IdCalculo = Cliente.contrato.consultarUltimoIdCalculo();
                }

                //Obtêm Usuário
                string usuario = Contexto.obterUsuario();

                //Define lista de parâmetros para realizar consulta na base de dados
                IDictionary<string, object> parametros = new Dictionary<String, object>(13);
                parametros.Add("pIdPessoa", mutuario.id);
                parametros.Add("pIdTitular", mutuario.idTitular);
                parametros.Add("pIDTipoContratoEmptmo", tipoContrato);
                parametros.Add("pIDContratoAntAQuitar", idContratosAnteriores);
                parametros.Add("pDtCredito", dataCredito);
                parametros.Add("pDtPrimeiraParcela", dataPrimeiraParcela);
                parametros.Add("pTXJuros", taxaJuros);
                parametros.Add("pNumParcela", quantidadeParcelas);
                parametros.Add("pValorSaldoQuitar", valorSaldoQuitar);
                if (EhPostBack)
                {
                    caixaNumericaValorSolicitadoRefinanciamento.valor = this.valorSolicitado += this.UltimoValorAmortizar;
                    if (!string.IsNullOrEmpty(caixaNumericaValorAmortizar.Text))
                    {
                        caixaNumericaValorSolicitadoRefinanciamento.valor = this.valorSolicitado -= caixaNumericaValorAmortizar.valor;
                    }
                    this.UltimoValorAmortizar = caixaNumericaValorAmortizar.valor;
                }
                parametros.Add("pValorSolicitado", valorSolicitado);
                parametros.Add("pValorMaxPermitido", valorMaximoPermitido);
                parametros.Add("pIdCalculo", IdCalculo);
                parametros.Add("pUsuario", usuario);

                //Consulta Parcelas para renegociação
                using (Cliente<IServicoContrato> Cliente = new Cliente<IServicoContrato>())
                {
                    reneg = Cliente.contrato.consultarParcelasRenegociacao(parametros);
                }

                //Carrega as parcelas para renegocição               
                repeaterContratosRefinanciamento.DataSource = reneg;
                repeaterContratosRefinanciamento.DataBind();

                //Preenche os campos
                //caixaNumericaValorPrestacaoBase.valor = this.valorPrestacaoBase;

                caixaNumericaValorSomaUltimasPrestacoes.valor = this.ValorUltimaPrestacaoFGQC;

                if (!EhPostBack)
                {
                    caixaNumericaValorSolicitadoRefinanciamento.valor = this.valorSolicitado;

                    CalcularValorTotalParcelas();

                    double? result = this.valorSaldoQuitar - this.valorSolicitado;
                    this.valorAmortizar = caixaNumericaValorAmortizar.valor = (caixaNumericaValorTotalParcelasQuitar.valor < result) ? (result - caixaNumericaValorTotalParcelasQuitar.valor) : 0;
                    this.UltimoValorAmortizar = 0d;

                    double vlrUltimaPrestacao = 0d;
                    string numContrato = string.Empty;
                    int Contrato13 = 0;

                    foreach (ContratoRenegociacao c in reneg)
                    {
                        if (c.itens.Count > 0)
                        {
                            if (numContrato != c.numeroContrato.ToString())
                            {
                                numContrato = c.numeroContrato.ToString();
                                using (Cliente<IServicoContrato> Cliente = new Cliente<IServicoContrato>())
                                {
                                    Contrato13 = Cliente.contrato.ContratoDecimoTerceito(numContrato);
                                }
                            }

                            if (Contrato13 == 0)
                            {
                                Parcela[] i = new Parcela[c.itens.Count];
                                i = c.itens.ToArray();
                                vlrUltimaPrestacao += i[i.Length - 1].ValorItemPrestacao;
                            }
                        }
                    }

                    //caixaNumericaValorSomaUltimasPrestacoes.valor = vlrUltimaPrestacao;

                    //Calculando os itens de concessão
                    //string UsuarioCalc = string.IsNullOrEmpty(Contexto.obterUsuario()) ? IdCalculo.ToString() : Contexto.obterUsuario();
                    //double? valorSolicitado = this.valorSolicitado - this.valorTotalParcQuitar - caixaNumericaValorAmortizar.valor;

                    //Dictionary<string, object> PagametrosRegras = new Dictionary<string, object>();
                    //PagametrosRegras["IDMUTUARIO_P"] = mutuario.id;
                    //PagametrosRegras["IDTITULAR_P"] = mutuario.idTitular;       
                    //PagametrosRegras["IDOPERACAO_P"] = 1;
                    //PagametrosRegras["IDCONTRATOAQUITAR_P"] = string.Empty;
                    //PagametrosRegras["IDTIPOCONTRATO_P"] = tipoContrato;
                    //PagametrosRegras["DATACREDITO_P"] = dataCredito;
                    //PagametrosRegras["DATAREFERENCIA_P"] = DateTime.Today;
                    //PagametrosRegras["VALORSOLICITADO_P"] = valorSolicitado;
                    //PagametrosRegras["IDCALCULO_P"] = IdCalculo;
                    //PagametrosRegras["USUARIO_P"] = UsuarioCalc;               
                    //PagametrosRegras["NUMPARCELAS_P"] = quantidadeParcelas;
                    //PagametrosRegras["TAXAJUROS_P"] = taxaJuros; 
                    //PagametrosRegras["DATAPRIMEIRAPARCELA_P"] = dataPrimeiraParcela;
                    //PagametrosRegras["DATAASSINATURA_P"] = DateTime.Today;
                    //PagametrosRegras["LIQUIDOZERO_P"] = 0;
                    //PagametrosRegras["EXCEPCIONALOUTROS_P"] = 0;

                    //CalculaItensConcessao(tipoContrato, PagametrosRegras);
                }

                //Calculando os itens de concessão
                string UsuarioCalc = string.IsNullOrEmpty(Contexto.obterUsuario()) ? IdCalculo.ToString() : Contexto.obterUsuario();

                foreach (var contrato in reneg)
                {
                    double ValorTotalParcelasInad = 0;
                    foreach (var item in contrato.itens)
                    {
                        ValorTotalParcelasInad += item.ValorItemPrestacao;
                    }                  
                    
                    Dictionary<string, object> PagametrosRegras = new Dictionary<string, object>();
                    PagametrosRegras["IDMUTUARIO_P"] = mutuario.id;
                    PagametrosRegras["IDTITULAR_P"] = mutuario.idTitular;
                    PagametrosRegras["IDOPERACAO_P"] = 1;
                    PagametrosRegras["IDCONTRATOAQUITAR_P"] = string.Empty;
                    PagametrosRegras["IDTIPOCONTRATO_P"] = tipoContrato;
                    PagametrosRegras["DATACREDITO_P"] = dataCredito;
                    PagametrosRegras["DATAREFERENCIA_P"] = DateTime.Today;
                    PagametrosRegras["VALORSOLICITADO_P"] = ValorTotalParcelasInad;
                    PagametrosRegras["IDCALCULO_P"] = IdCalculo;
                    PagametrosRegras["USUARIO_P"] = UsuarioCalc;
                    PagametrosRegras["NUMPARCELAS_P"] = quantidadeParcelas;
                    PagametrosRegras["TAXAJUROS_P"] = taxaJuros;
                    PagametrosRegras["DATAPRIMEIRAPARCELA_P"] = dataPrimeiraParcela;
                    PagametrosRegras["DATAASSINATURA_P"] = DateTime.Today;
                    PagametrosRegras["LIQUIDOZERO_P"] = 0;
                    PagametrosRegras["EXCEPCIONALOUTROS_P"] = 0;

                    CalculaItensConcessao(tipoContrato, PagametrosRegras);
                }
               
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
        }

        public void CalcularValorTotalParcelas()
        {
            double total = 0;
            try
            {
                for (int i = 0; i < repeaterContratosRefinanciamento.Items.Count; i++)
                {
                    GridView grid = (GridView)repeaterContratosRefinanciamento.Items[i].FindControl("gridParcelasRefinanciamento");
                    for (int j = 0; j < grid.Rows.Count; j++)
                    {
                        CheckBox campo = (CheckBox)grid.Rows[j].Cells[0].FindControl("CheckBoxButton");
                        if (campo.Checked)
                        {
                            total += Convert.ToDouble(grid.Rows[j].Cells[3].Text);
                        }
                    }
                }

                this.valorTotalParcQuitar = caixaNumericaValorTotalParcelasQuitar.valor = total;
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
        }

        public void SelecionarTodasParcelas(bool status)
        {
            for (int i = 0; i < repeaterContratosRefinanciamento.Items.Count; i++)
            {
                GridView grid = (GridView)repeaterContratosRefinanciamento.Items[i].FindControl("gridParcelasRefinanciamento");
                for (int j = 0; j < grid.Rows.Count; j++)
                {
                    CheckBox campo = (CheckBox)grid.Rows[j].Cells[0].FindControl("CheckBoxButton");
                    if (campo.Enabled)
                    {
                        campo.Checked = status;
                        this.ParcSelecionada[(i * 100) + j] = status;
                    }
                }
            }

            checkBoxSelecionarTodas.Text = status ? "Desmarcar Todas" : "Selecionar Todas";
        }

        protected void AtualizaValorSolicitado(double? totParcQuitarInicial)
        {
            totParcQuitarInicial -= (string.IsNullOrEmpty(caixaNumericaValorTotalParcelasQuitar.Text) ? 0 : caixaNumericaValorTotalParcelasQuitar.valor);
            this.valorSolicitado = caixaNumericaValorSolicitadoRefinanciamento.valor += totParcQuitarInicial + this.valorAmortizar;
        }

        public void GuardarRetorno(string AtualizouCalculo)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, typeof(Page), "script", "SetarValoresRetorno('" + AtualizouCalculo + "');", true);
        }

        public IDictionary<int, bool> GuardarParcelasMarcadas(bool EhPostback)
        {
            IDictionary<int, bool> Parcelas = new Dictionary<int, bool>();
            try
            {
                for (int i = 0; i < repeaterContratosRefinanciamento.Items.Count; i++)
                {
                    GridView grid = (GridView)repeaterContratosRefinanciamento.Items[i].FindControl("gridParcelasRefinanciamento");
                    for (int j = 0; j < grid.Rows.Count; j++)
                    {
                        CheckBox campo = (CheckBox)grid.Rows[j].Cells[0].FindControl("CheckBoxButton");
                        if (!EhPostback)
                            Parcelas.Add((i * 100) + j, campo.Checked);
                        else { 
                            this.ParcSelecionada[(i * 100) + j] = campo.Checked;
                            
                            //Marca as parcelas selecionadas pelo usuário na lista retornada da procedure
                            foreach (var item in this.reneg.Where(x=> x.numeroContrato == grid.Rows[j].Cells[4].Text))
                            {
                                if (campo.Checked)
                                {
                                    foreach (var item2 in item.itens.Where(x=> x.IsMarcado == false))
                                    {
                                        if (item2.MesReferencia == grid.Rows[j].Cells[1].Text && item2.ValorItemPrestacao == Convert.ToDouble(grid.Rows[j].Cells[3].Text))
                                        {
                                            item2.IsMarcado = true;
                                        }
                                    }
                                }    
                            }                            

                        }
                    }
                }
                return Parcelas;
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
        }

        public void DevolveMarcacaoParcelas()
        {
            try
            {
                for (int i = 0; i < repeaterContratosRefinanciamento.Items.Count; i++)
                {
                    GridView grid = (GridView)repeaterContratosRefinanciamento.Items[i].FindControl("gridParcelasRefinanciamento");
                    for (int j = 0; j < grid.Rows.Count; j++)
                    {
                        CheckBox campo = (CheckBox)grid.Rows[j].Cells[0].FindControl("CheckBoxButton");

                        if (campo.Enabled)
                        {
                            campo.Checked = (bool)this.ParcSelecionada[(i * 100) + j];
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                throw new ExcecaoPlanus(ex.Message);
            }
        }

        protected void TratarParcelasInadimplentes (Int64 NumeroContrato, int NumeroParcela, DateTime DataVencimento)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //foreach (int parcela in Parcelas)
                //{
                    bool sucessoTrataParcela = cliente.contrato.efetivarTratamentoParcelas(NumeroContrato, DataVencimento, NumeroParcela, string.Empty, 0);
                    if (!sucessoTrataParcela)
                    {
                        throw new Planus.Componentes.ExcecaoPlanus(String.Format("Erro ao realizar o tratamento da parcela: {0}", NumeroParcela));
                    }
                //}
            }
        }


        private void PrepararBoleto()
        {
            EmptmoDocFinanceiroDTO documento = null;
            DateTime DataVencimento = DateTime.Today;
            string referenciaParcelas = string.Empty;
            List<byte[]> sourceFiles = new List<byte[]>();
            Dictionary<string, object> parametrosItens = new Dictionary<string, object>();
            byte[] pdfResultado = null;

            foreach (var contrato in this.reneg)
            {

                //Tratar amortização
                //if (ValidarAmortizacao(Convert.ToInt64(contrato.numeroContrato)))
                //{
                //    ValidarDadosBoleto(Convert.ToInt64(contrato.numeroContrato), 0, DataVencimento);
                //}


                //trata as parcelas inadimplentes
                foreach (var item in contrato.itens.Where(x => x.IsMarcado == true))
                {
                    ValidarDadosBoleto(Convert.ToInt64(contrato.numeroContrato), item.NumeroParcela, DataVencimento);

                    TratarParcelasInadimplentes(Convert.ToInt64(contrato.numeroContrato), item.NumeroParcela, DataVencimento);
                    referenciaParcelas += item.MesReferencia + ", ";
                }
                //temporario-----------------------------------
                //if (contrato.numeroContrato == "300000752108")
                //    DataVencimento = new DateTime(2021, 09, 27);
                //else
                //    DataVencimento = new DateTime(2021, 09, 30);
                //temporario-----------------------------------

                if (contrato.itens.Where(x => x.IsMarcado == true).Count() > 0)
                {
                    //registra envio de boletos para as parcelas inadimplentes tratadas
                    documento = RegistrarBoletoBancario(Convert.ToInt64(contrato.numeroContrato), 0, DataVencimento);

                    var boleto = new BoletoEmprestimo(documento.numDocumento, documento.portadorForma, 1);

                    if (!string.IsNullOrEmpty(referenciaParcelas))
                        boleto.ObservacoesAdicionais = "Parcela(s) referente(s) ao(s) mês(es): " + referenciaParcelas.Substring(1, referenciaParcelas.Length - 3);

                    byte[] pdf = GerarBoletoPDF(boleto);
                    sourceFiles.Add(pdf);

                    pdfResultado = MergeFiles(sourceFiles);
                }

            }

            if (!string.IsNullOrEmpty(CaixaNumericaTotalAmortizar.valor.ToString())) { 
                double? TotalItensConcessao = caixaNumericaIOF.valor + caixaNumericTxAdm.valor + caixaNumericaFGQC.valor;
                double? TotalAmortizacao = TotalItensConcessao + caixaNumericaValorAmortizar.valor;
            }

            ExibirBoleto(pdfResultado, parametrosItens, 123456);

        }

        public byte[] GerarBoletoPDF(BoletoEmprestimo BoletoEmprestimo)
        {
            try
            {
                //C:\Git\SIG 21529-52136-W\ProjetosWeb\FUNCEF.WebEmprestimo\FUNCEF.WebEmprestimo.Web\Boleto\BoletoEmprestimo.rdlc
                var boletoDTO = BoletoEmprestimo.GetDTO();

                //From the assembly where this code lives!
                this.GetType().Assembly.GetManifestResourceNames();

                //or from the entry point to the application - there is a difference!
                Assembly.GetExecutingAssembly().GetManifestResourceNames();

                LocalReport report = new LocalReport();
                //Assembly dto = Assembly.GetAssembly(typeof(ContratoDTO));   
                //Stream reportStream = dto.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Boleto.BoletoEmprestimo.rdlc");
                Assembly _assembly = Assembly.GetExecutingAssembly();
                Stream reportStream = _assembly.GetManifestResourceStream("FUNCEF.Planus.WebEmprestimo.Web.Boleto.BoletoEmprestimo.rdlc");
                report.LoadReportDefinition(reportStream);
                report.DataSources.Add(new ReportDataSource("boleto", new List<FUNCEF.Planus.WebEmprestimo.Tipos.Boleto>() { boletoDTO }));
                byte[] bytes = report.Render("PDF");

                //using (FileStream fs = new FileStream("C:/temp/Boleto.pdf", FileMode.Create))
                //{
                //    fs.Write(bytes, 0, bytes.Length);
                //}

                //Response.Buffer = true;
                //Response.ClearHeaders();
                //Response.Clear();
                //Response.ContentType = "application/pdf";
                //Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "Boleto_" + boletoDTO.NumeroContrato, "pdf"));
                //Response.BinaryWrite(bytes);
                ////Response.Flush(); // Sends all currently buffered output to the client.
                ////Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                ////System.Web.HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
                ///
                return bytes;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally 
            {
                //Response.End();
                //////Sends the response buffer
                ////Response.Flush();
                ////// Prevents any other content from being sent to the browser
                ////Response.SuppressContent = true;
                //////Directs the thread to finish, bypassing additional processing
                ////System.Web.HttpContext.Current.ApplicationInstance.CompleteRequest();
                //////Suspends the current thread
                ////System.Threading.Thread.Sleep(1);
            }

        }

        public void ExibirBoleto(byte[] bytes, Dictionary<string, object> ParametrosItens, long NumeroContrato) 
        {
            //string guid = Guid.NewGuid().ToString();
            //this.proxyEstado.manterEstadoSincrono(guid, ParametrosItens);
            //Response.Redirect(String.Format("~/boleto/pdf.aspx?guidItens={0}", guid));

            Response.Buffer = true;
            Response.ClearHeaders();
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + string.Format("{0}.{1}", "Boleto_" + NumeroContrato, "pdf"));
            Response.BinaryWrite(bytes);
            //Response.Flush(); // Sends all currently buffered output to the client.
            //Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
            //System.Web.HttpContext.Current.ApplicationInstance.CompleteRequest(); // Causes ASP.NET to bypass all events and filtering in the HTTP pipeline chain of execution and directly execute the EndRequest event.
        }


        private void ValidarDadosBoleto(long NumeroContrato, int NumeroParcela, DateTime DataVencimento)
        {
            
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                //Verifica se data é válida
                var contentResult = cliente.contrato.ValidarData(DataVencimento);
                if (contentResult == false)
                    throw new Exception("A data não é válida para gerar boleto.");
               
                //Verifica se prestação pode ser tratada (parcela do mês atual só poderá ser tratada após dia 20)
                string mesParcela = cliente.contrato.VerificarMesRefParcela(NumeroContrato, NumeroParcela);
                if (mesParcela.Equals("Error") || mesParcela.Equals(DateTime.Now.ToString("yyyyMM")) && DateTime.Now.Day <= 20)
                    throw new Exception("Parcela só poderá ser tratada após o dia 20.");

                //Verifica o horário de geração do boleto (não se pode gerar entre às 14h e 16h) para as prestações atual e anterior
                if ((mesParcela.Equals(DateTime.Now.ToString("yyyyMM")) || mesParcela.Equals(DateTime.Now.AddMonths(-1).ToString("yyyyMM"))) && (DateTime.Now.Hour >= 14 && DateTime.Now.Hour <= 15))
                    throw new Exception("Não é possível gerar boleto entre às 14h e 16h. Tente novamente mais tarde.");                 
            }            
        }

        protected EmptmoDocFinanceiroDTO RegistrarBoletoBancario(Int64 NumeroContrato, int NumeroParcela, DateTime DataVencimento) 
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                EmptmoDocFinanceiroDTO docFinanceiro = new EmptmoDocFinanceiroDTO();
                 docFinanceiro = cliente.contrato.RetornarDocumentoEnviado(NumeroContrato, 1, 0, DataVencimento);
                 
                if (docFinanceiro.numDocumento == 0)
                     docFinanceiro =  cliente.contrato.EnviarBoletoBancario(NumeroContrato, NumeroParcela, DataVencimento, 1);

                if (!string.IsNullOrEmpty(docFinanceiro.msgErro))
                {
                    throw new Exception(docFinanceiro.msgErro);
                }

                return docFinanceiro;
            }
        }

        #endregion

        #region Métodos herdados de PaginaSeguraComEstado
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
        #endregion

        public void CalculaItensConcessao(int IdTipoContrato, Dictionary<string,object> PagametrosRegras)
        {
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                TipoContrato tipo = new TipoContrato() { id = IdTipoContrato };
                List<ItemContrato> listaItens = cliente.contrato.obterItens(tipo, TipoEvento.concessao).Where(x=> x.id == 9 || x.id == 60 || x.id==107).ToList();

                foreach (var item in listaItens)
                {                  
                    listaItens = cliente.contrato.calcularItens(listaItens, PagametrosRegras);
                }

                
                foreach (var item in listaItens)
                {
                    switch (item.id)
                    {
                        case 9: //IOF
                            caixaNumericaIOF.valor +=  item.valor;
                            break;
                        case 60: //Taxa administrativa
                            caixaNumericTxAdm.valor += item.valor;
                            break;
                        case 107: //FGQC concessão
                            caixaNumericaFGQC.valor += item.valor;
                            break;
                    }
                    somaItensConcessao += item.valor;                    
                }               

                CaixaNumericaTotalAmortizar.valor = caixaNumericaValorAmortizar.valor + this.valorTotalParcQuitar + somaItensConcessao;
            }
        }

        protected void caixaNumericaValorAmortizar_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(caixaNumericaValorAmortizar.valor.ToString()))
                caixaNumericaValorAmortizar.valor = 0;

            CaixaNumericaTotalAmortizar.valor = caixaNumericaValorAmortizar.valor + this.valorTotalParcQuitar + caixaNumericaFGQC.valor + caixaNumericaIOF.valor + caixaNumericTxAdm.valor;
        }

        public static byte[] MergeFiles(List<byte[]> sourceFiles)
            {
                Document document = new Document();
                using (MemoryStream ms = new MemoryStream())
                {
                    PdfCopy copy = new PdfCopy(document, ms);
                    document.Open();
                    int documentPageCounter = 0;

                    // Iterate through all pdf documents
                    for (int fileCounter = 0; fileCounter < sourceFiles.Count; fileCounter++)
                    {
                        // Create pdf reader
                        PdfReader reader = new PdfReader(sourceFiles[fileCounter]);
                        int numberOfPages = reader.NumberOfPages;

                        // Iterate through all pages
                        for (int currentPageIndex = 1; currentPageIndex <= numberOfPages; currentPageIndex++)
                        {
                            documentPageCounter++;
                            PdfImportedPage importedPage = copy.GetImportedPage(reader, currentPageIndex);
                            PdfCopy.PageStamp pageStamp = copy.CreatePageStamp(importedPage);

                            // Write header
                            ColumnText.ShowTextAligned(pageStamp.GetOverContent(), Element.ALIGN_CENTER,
                                new Phrase("FUNCEF - Empréstimo"), importedPage.Width / 2, importedPage.Height - 30,
                                importedPage.Width < importedPage.Height ? 0 : 1);

                            // Write footer
                            ColumnText.ShowTextAligned(pageStamp.GetOverContent(), Element.ALIGN_CENTER,
                                new Phrase(String.Format("Page {0}", documentPageCounter)), importedPage.Width / 2, 30,
                                importedPage.Width < importedPage.Height ? 0 : 1);

                            pageStamp.AlterContents();

                            copy.AddPage(importedPage);
                        }

                        copy.FreeReader(reader);
                        reader.Close();
                    }

                    document.Close();
                    return ms.GetBuffer();
                }
            }

        ///////////////////////////////////AMORTIZACAO ////////////////////////////////////////
        protected bool ValidarAmortizacao(long NumeroContrato)
        {
            DateTime? DataAmortizacao = null;
            DateTime? DataLimite = null;
            bool retorno = false;

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                DataAmortizacao = cliente.contrato.calcularDataLimiteDebito(DateTime.Now);
            }           
            
            ObjetoContrato contrato = new ObjetoContrato(NumeroContrato);
            Dictionary<string, object> Parametros = new Dictionary<string, object>();

            double TotalEncargos = Convert.ToDouble(caixaNumericaFGQC.valor + caixaNumericaIOF.valor + caixaNumericTxAdm.valor);
            double ValorAmortizacao = (Convert.ToDouble(caixaNumericaValorAmortizar.valor) + TotalEncargos) / this.reneg.Count;
            Parametros["ValorAmortizacao"] = ValorAmortizacao;

            if (contrato != null)
            {
                Parametros["NumeroContrato"] = contrato.numero.ToString();             
                Parametros["Matricula"] = contrato.mutuario.matricula;             
                Parametros["Patrocinadora"] = contrato.patrocinadora.nome;               
                Parametros["DataCredito"] = (contrato.dataCredito.HasValue) ? contrato.dataCredito.Value.ToString("dd/MM/yyyy") : string.Empty;
                if (contrato.dataCredito.HasValue)
                    Parametros["DataCredito"] = contrato.dataCredito.Value;

               
                Parametros["TaxaJuros"] = (contrato.taxaJuros.HasValue) ? contrato.taxaJuros.Value.ToString("N2") : string.Empty;              
                Parametros["Prazo"] = contrato.totalParcelas.ToString();
                Parametros["ValorParcela"] = (contrato.valorParcela.HasValue) ? contrato.valorParcela.Value.ToString("N2") : string.Empty;
                Parametros["TipoContrato"] = new TipoContrato(){id = contrato.tipo.id, descricao= contrato.tipo.descricao};              
                Parametros["IdMutuario"] = contrato.mutuario.id;
                if (contrato.salarioBase.HasValue)
                    Parametros["SalarioBase"] = (double)contrato.salarioBase;
                
            }

            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {
                try
                {
                    cliente.contrato.executarAtualizacaoDiaria(NumeroContrato);

                    if (cliente.contrato.validarAmortizacao(NumeroContrato, Convert.ToDateTime(DataAmortizacao), Convert.ToDateTime(Parametros["DataCredito"]), (DateTime)DataLimite, true))
                    {     
                        if (!this.verificaDataUtil(Convert.ToDateTime(DataAmortizacao)))
                        {
                            this.registrarAlerta("A data de amortização deve ser um dia útil .");
                            return retorno;
                        }                      
         
                        if(verificarValorAmortizacao(NumeroContrato, Convert.ToDateTime(DataAmortizacao)))
                        {
                            this.registrarAlerta("Não será possível processar a amortização.");
                            return retorno;
                        }                        

                        CarregarItensAmortizaca(Parametros);
                    }
                    
                }
                catch (FaultException<ContratoFaltaNegocio> erro)
                {
                    this.registrarAlerta(erro.Detail.mensagemErro);
                }
            }
            return true;
        }

        private bool verificarValorAmortizacao(long contrato, DateTime vencimento)
        {
            Cliente<IServicoContrato> clienteContrato = new Cliente<IServicoContrato>();
            return (clienteContrato.contrato.VerificarValorAmortizacao(contrato, vencimento));
        }

        private bool verificaDataUtil(DateTime dataAmortizacao)
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                bool diaUtil = cliente.contrato.verificaDataUtil(dataAmortizacao);

                if (!diaUtil)
                {
                    return false;
                }
            }
            return true;
        }

        protected void CarregarItensAmortizaca(Dictionary<string, object> Parametros)
        {
                List<ItemContrato> itens = null;
                try
                {

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        itens = cliente.contrato.calcularItensAmortizacao( (TipoContrato)Parametros["TipoContrato"], 
                                                                            Convert.ToInt64(Parametros["NumeroContrato"]), 
                                                                            Convert.ToDateTime(Parametros["DataAmortizacao"]), 
                                                                            Convert.ToInt32(Parametros["prazo"]), 
                                                                            Convert.ToDouble(Parametros["ValorAmortizacao"]), 
                                                                            Convert.ToDouble(Parametros["ValorMargem"])
                                                                          );
                        //gridItens.DataSource = itens.FindAll(i => i.tipoEvento.chave == TipoEvento.amortizacao.chave);
                        //gridItens.DataBind();

                        //labelValorParcela.Text = itens.Find(i => i.tipoEvento.chave == TipoEvento.prestacao.chave && i.centraliza == 1 && i.destacado == 0).valor.ToString("N2");

                        //William Moreira da Silva - SOL 216458 KTN
                        //if (itens.Find(i => i.tipoEvento.chave == 1 && i.destacado == 1) != null)
                        //{
                        //    labelValorFGQC.Text = itens.Find(i => i.tipoEvento.chave == 1 && i.destacado == 1).valor.ToString("N2"); 
                        //}
                        //else
                        //{
                        //    labelValorFGQC.Text = "0,00";
                        //}
                        //William Moreira da Silva - SOL 216458 KTN

                        //parametrosAmortizacao["itens"] = itens.Where(t1 => t1.tipoEvento == TipoEvento.amortizacao).ToList();

                    }
                }
                catch (FaultException<ContratoFaltaNegocio> ex)
                {
                    this.registrarAlerta(this.tratarMensagem(ex.Detail.mensagemErro));
                }

                //this.proxyEstado.manterEstadoSincrono(this.guidAmortizacao, parametrosAmortizacao);

                //List<DadosBancarios> dadosBancarios = null;

                //using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                //{
                //    //dadosBancarios = cliente.contrato.consultarContaBancaria(this.idMutuario, 0, this.numeroContrato);
                //    dadosBancarios = cliente.contrato.consultarContaBancaria(this.idMutuario, 0, 0);//William Moreira da Silva - SOL 216458 KTN
                //    gridDadosBancarios.DataSource = dadosBancarios;
                //    gridDadosBancarios.DataBind();

                //    List<ContaCaixa> contasCaixa = cliente.contrato.listarContaCaixa();
                //    UtilidadesPagina.preencherDropDown(comboFormaPagamento, contasCaixa.Where(t1 => t1.recPagamento.Equals("R")), EnumeradorItemPreenchimento.Nenhum, "descricao", "id");

                //    List<TipoRecurso> tiposRecurso = cliente.contrato.listarTipoRecurso();
                //    UtilidadesPagina.preencherDropDown(comboTipoRecurso, tiposRecurso, EnumeradorItemPreenchimento.Nenhum, "descricao", "id");
                //}

                //listaOpcoesFormaEnvio.Items[0].Selected = true;            

        }

        protected void LancarAmortizacao(Dictionary<string, object> Parametros, List<ItemContrato> ItensAmortizacao)
        {
            //if (gridItens.Rows.Count == 0)
            //{
            //    registrarAlerta("Amortização não pode ser concluída pois os itens não foram calculados.");
            //    return;
            //}

            //Willliam Moreira da Silva - SOL 239915
            //if (Session["amortizacao"] == "1")
            //{
            //    registrarAlerta("Essa amortização já foi realizada.");
            //    return;
            //}

            // Session["amortizacao"] = "1";  // Felipe A. Santos SOL 224034/17909 PPM 1165556 
            //Willliam Moreira da Silva - SOL 239915

            //William Moreira da Silva - SOL 216458 KTN
            //int idContaCorrente = verificaContaSelecionada();
            //if (idContaCorrente == 0)
            //{
            //    return;
            //}
            //verificar aqui o selecionamento da conta corrente.

            //if (!this.verificaContaCaixa(idContaCorrente))
            //{
            //    return;
            //}
            //William Moreira da Silva - SOL 216458 KTN

            //Dictionary<string, object> parametrosAmortizacao = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidAmortizacao);
            List<ItemContrato> itens = ItensAmortizacao;

            long itemCentralizador = 0;

            foreach (ItemContrato item in itens)
            {
                if (item.centraliza == 1)
                    itemCentralizador = item.id;
            }

            List<Historico> historico = new List<Historico>();
            using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
            {                
                ObjetoContrato contrato = new ObjetoContrato(Convert.ToInt64(Parametros["NumeroContrato"]));

                //William Moreira da Silva SOL 238689
                using (Cliente<IServicoMutuario> clienteMutuario = new Cliente<IServicoMutuario>())
                {
                    string usuario = Contexto.obterUsuario();
                    if (clienteMutuario.contrato.verificaMutuario(contrato.mutuario.id, usuario))
                    {
                        this.registrarAlerta(MensagensAplicacao.instancia.mensagem043);
                        return;
                    }
                }       

                foreach (ItemContrato item in itens)
                {
                    Historico itemHistorico = new Historico();
                    itemHistorico.numeroContrato = Convert.ToInt64(Parametros["NumeroContrato"]);
                    if (itemCentralizador > 0)
                        itemHistorico.itemCentraliza = new ItemContrato() { id = itemCentralizador };
                    itemHistorico.item = item;
                    itemHistorico.parcela = item.parcela;
                    itemHistorico.tipoMovimento = item.tipoEvento;
                    itemHistorico.origem = Origem.amortizacao;
                    itemHistorico.formaCobranca = "C";
                    itemHistorico.sequenciaCobranca = 1;
                    itemHistorico.prioridade = item.prioridade;
                    itemHistorico.centraliza = item.centraliza;
                    itemHistorico.destacado = item.destacado;
                    itemHistorico.data = DateTime.Today;
                    itemHistorico.dataPrevista = (DateTime)Parametros["DataAmortizacao"];
                    itemHistorico.dataEfetiva = null;
                    itemHistorico.dataAtualizacao = (DateTime)Parametros["DataAmortizacao"];
                    itemHistorico.anoCompetencia = Convert.ToDateTime(Parametros["DataAmortizacao"]).Year;
                    itemHistorico.mesCompetencia = Convert.ToDateTime(Parametros["DataAmortizacao"]).Month;
                    itemHistorico.anoCobranca = Convert.ToDateTime(Parametros["DataAmortizacao"]).Year;
                    itemHistorico.mesCobranca = Convert.ToDateTime(Parametros["DataAmortizacao"]).Month;
                    itemHistorico.valorPrevisto = item.valor;
                    itemHistorico.valorEfetivo = null;
                    itemHistorico.saldoDevedor = item.saldoDevedor.Value;
                    itemHistorico.taxaJuros = contrato.taxaJuros;
                    itemHistorico.baixado = 0;
                    itemHistorico.enviado = 0;
                    itemHistorico.rubrica = item.rubrica;
                    itemHistorico.pagarReceber = item.pagarReceber;
                    itemHistorico.numeroParcelas = Convert.ToInt32(Parametros["prazo"]);
                    itemHistorico.dataVencimento = Convert.ToDateTime(Parametros["DataAmortizacao"]);
                    itemHistorico.tipoDivergencia = 0;
                    itemHistorico.dataInclusao = DateTime.Now;
                    itemHistorico.usuarioInclusao = this.contextoSistema.loginUsuarioAtual;
                    itemHistorico.versao = String.Concat(Assembly.GetExecutingAssembly().GetName().Version.ToString(), "W");
                    itemHistorico.patrocinadora = contrato.patrocinadora;
                    //itemHistorico.tipoRecurso = new TipoRecurso() { id = Convert.ToInt32(comboTipoRecurso.SelectedValue) };
                    //itemHistorico.origemRecurso = null;
                    itemHistorico.parcelaAlternativa = 0;
                    //itemHistorico.dadosBancarios = new DadosBancarios { id = idContaCorrente };

                    historico.Add(itemHistorico);
                }

                historico = cliente.contrato.tratarHistoricoAmortizacao(historico);
                cliente.contrato.incluirHistorico(historico);

                cliente.contrato.executarAtualizacaoDiaria(Convert.ToInt64(Parametros["NumeroContrato"]));

                //Inserindo Log
                LogContrato logContrato = new LogContrato()
                {
                    descricao = string.Format(String.Concat(Origem.amortizacao.descricao, ":{0}"), Convert.ToDateTime(Parametros["DataAmortizacao"]).ToString("dd/MM/yyyy")),
                    numeroContrato = Convert.ToInt64(Parametros["NumeroContrato"]),
                    origem = Origem.quitacao,
                };

                cliente.contrato.incluirLog(logContrato);
            }

            //Session["amortizacao"] = "1";  // Felipe A. Santos SOL 224034/17909 PPM 1165556 

            //this.confirmarOperacao(MensagensAplicacao.instancia.mensagem031, "~/Paginas/Transacoes/Amortizacao/Listagem.aspx");
        }

    }
}