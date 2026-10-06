#region SIG 97832
///
/// Autor:
/// Taffarel Sevaybriker
///
/// Data da Alteração:
/// 18/02/2020
///
/// Descrição da Alteração:
/// Erro ao carregar status da suspensão.
///
#endregion
#region SIG 90605
///
/// Autor:
/// Darivaldo Alencar
///
/// Data da Alteração:
/// 10/10/2019
///
/// Descrição da Alteração:
/// Busca de prestação com FGQC
///
#endregion
#region SOL 258352 / PPM 987653
///
/// Autor:
/// Wylliam Leite da Silva
/// 
/// Data da Alteração:
///  24/07/2015 13:27:40
///  
/// Descrição da Alteração:
/// Não permitir salvar o lançamento de histórico de suspensão caso seja feita uma critica
/// 
#endregion
#region SOL 244904 / PPM 609044
///
/// Autor:
/// William Moreira da Silva
///
/// Data da Alteração:
/// 15/12/2014 15:29:16
///
/// Descrição da Alteração:
/// Quando a parcela do mes já tinha sido gerado o sistema estava passando a data de inicio de suspensao como se essa parcela ainda não tivesse sido gerada
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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Collections.Generic;
using FUNCEF.Planus.Componentes.Utilidades;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.GlobalWeb.Cliente;
using System.ServiceModel;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Parcela
{
    public partial class FormularioParcelas : ControleFormularioBase
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

        private long idHistoricoSuspensao
        {
            get
            {
                return UtilidadesPagina.obterIdQueryString("Id", true);
            }
        }

        private TipoContrato tipoContrato
        {
            get
            {
                if (this.ViewState["tipoContrato"] != null)
                    return (TipoContrato)this.ViewState["tipoContrato"];
                else
                    return null;
            }
            set
            {
                this.ViewState["tipoContrato"] = value;
            }
        }

        private bool inclusao
        {
            get
            {
                if (this.ViewState["inclusao"] != null)
                    return (bool)this.ViewState["inclusao"];
                else
                    return true;
            }
            set
            {
                this.ViewState["inclusao"] = value;
            }
        }

        private int? meses
        {
            get
            {
                if (this.ViewState["meses"] != null)
                    return (int)this.ViewState["meses"];
                else
                    return null;
            }

            set
            {
                this.ViewState["meses"] = value;
            }
        }

        private DateTime? dataFinal
        {
            get
            {
                if (this.ViewState["dataFinal"] != null)
                    return (DateTime)this.ViewState["dataFinal"];
                else
                    return null;
            }

            set
            {
                this.ViewState["dataFinal"] = value;
            }
        }

        #endregion

        #region Eventos

        /// <summary>
        /// Efetua o carregamento do UserControl.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.inclusao)
            {
                validadorTipoSuspensao.ValidationGroup = this.grupoValidacao;
                validadorNumMeses.ValidationGroup = this.grupoValidacao;
                caixaDataInicio.grupoValidacao = this.grupoValidacao;
                caixaDataFinal.grupoValidacao = this.grupoValidacao;
                validadorMesCobranca.ValidationGroup = this.grupoValidacao;
                validadorAnoCobranca.ValidationGroup = this.grupoValidacao;                
            }
            else
            {
                caixaDataLiberacao.grupoValidacao = this.grupoValidacao;
                chkPrazoIndeterminado.Enabled = false;
            }

            if (!this.IsPostBack)
            {
                labelTipoSuspensao.Visible = !this.inclusao;
                labelNumMeses.Visible = !this.inclusao;
                labelDataInicio.Visible = !this.inclusao;
                labelDataFinal.Visible = !this.inclusao;

                //Saulo / FUNCEF
                // Contrato contrato = null;
                ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                List<TipoSuspensao> listaTipos = null;

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    //contrato = cliente.contrato.consultarContrato(this.numeroContrato); // Saulo / FUNCEF
                    listaTipos = cliente.contrato.consultarTipoSuspensao(contrato.tipo.id, null);
                    labelPrazo.Text = cliente.contrato.obterParcelasRestantes(this.numeroContrato, DateTime.Today).ToString();

                }

                if (contrato != null)
                {
                    labelNumContrato.Text = contrato.numero.ToString();
                    labelMutuario.Text = contrato.mutuario.nome;
                    labelMatricula.Text = contrato.mutuario.matricula;
                    this.tipoContrato = contrato.tipo;
                }

                labelDataAtendimento.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm");
                labelDataAtualizacao.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm");
                labelResponsavelAtendimento.Text = ContextoSistema.atual.loginUsuarioAtual;
                labelResponsavelAtualizacao.Text = ContextoSistema.atual.loginUsuarioAtual;

                comboMesCobranca.SelectedValue = DateTime.Now.Month.ToString();

                int anoAtual = DateTime.Now.Year;
                for (int x = anoAtual; x <= anoAtual + 5; x++)
                    comboAnoCobranca.Items.Add(x.ToString());

                UtilidadesPagina.preencherDropDown(comboTipoSuspensao, listaTipos, EnumeradorItemPreenchimento.Selecione, "descricao", "id");

                if (comboStatus.SelectedValue == "") //TAES - SIG97832
                {
                    comboStatus.Items.Add(new ListItem("Ativa", "A"));
                    comboStatus.Items.Add(new ListItem("Cancelada", "C"));
                    comboStatus.Items.Add(new ListItem("Encerrada", "E"));
                }
            }
            this.caixaSelecaoExcepcional.Visible = UtilidadesSeguranca.deveRenderizar(PermissoesSistema.excepcional.ToString());
        }

        //William Moreira SOL 142617
        protected void caixaDatas_textChanged(object sender, EventArgs e)
        {
            this.atualizaDatas();
            /*if (caixaDataFinal.Text != "" && caixaDataInicio.Text != "")
            {

                DateTime dataFinal, dataInicial;
                int anoFinal, mesFinal, anoInicial, mesInicial;
                int quantMeses;

                dataFinal = DateTime.Parse(caixaDataFinal.Text);
                dataInicial = DateTime.Parse(caixaDataInicio.Text);

                anoFinal = dataFinal.Year;
                mesFinal = dataFinal.Month;

                anoInicial = dataInicial.Year;
                mesInicial = dataInicial.Month;

                quantMeses = ((12 * (anoFinal - anoInicial)) + (mesFinal - mesInicial));
                caixaTextoNumMeses.Text = quantMeses.ToString();
            }*/

        }//William Moreira SOL 142617

        //William Moreira SOL 161455
        protected void caixaTextoNumMeses_textChanged(object sender, EventArgs e)
        {
            try
            {
                if (!String.IsNullOrEmpty(comboTipoSuspensao.SelectedValue))
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        TipoSuspensao tipoSuspensao = null;
                        List<TipoSuspensao> tipos = cliente.contrato.consultarTipoSuspensao(this.tipoContrato.id, Convert.ToInt32(comboTipoSuspensao.SelectedValue));

                        //Saulo / FUNCEF
                        //Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                        ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                        //Verifica se possui Itens em aberto
                        if (!this.verificarItensEmAberto(contrato, tipos[0]))
                        {
                            comboTipoSuspensao.SelectedIndex = 0;
                            return;
                        }

                        bool parcelaEmAberto = cliente.contrato.parcelaAtrasadaEmAberto(this.numeroContrato, DateTime.Today);

                        if (tipos != null && tipos.Count > 0)
                        {
                            //Parâmetros Regra
                            IDictionary<string, object> parametros = new Dictionary<string, object>();
                            parametros.Add("IDCONTRATO_P", this.numeroContrato);
                            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);
                            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
                            parametros.Add("IDPATRO_P", contrato.patrocinadora.id);
                            parametros.Add("IDOPERACAO_P", TipoOperacao.suspensaoParcelas.chave);
                            parametros.Add("IDTIPOSUSPENSAO_P", Convert.ToInt32(comboTipoSuspensao.SelectedValue));
                            parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(caixaDataInicio.Text));
                            parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(caixaSelecaoExcepcional.Checked));
                            parametros.Add("QTDMESES_P", Int32.Parse(caixaTextoNumMeses.Text));
                            parametros.Add("FLGINTERNO_P", contrato.mutuario.flginternoParticipante);
                            parametros.Add("IDCALCULO_P", cliente.contrato.consultarUltimoIdCalculo());

                            string mensagemRegra = string.Empty;

                            //William Moreira da Silva - SOL 211741
                            /*parametros.Add("MATRICULA_P", contrato.mutuario.matricula);
                            parametros.Add("IDCONTRATOANT_P", null);
                            parametros.Add("IDOPERACAO_P", TipoOperacao.suspensaoParcelas.chave);
                            parametros.Add("DATACREDITO_P", contrato.dataCredito);
                            parametros.Add("DATAINICIO_P", null);
                            parametros.Add("NUMPARCELASABERTO_P", Convert.ToInt32(parcelaEmAberto));
                            parametros.Add("NUMPARCELA_P", Convert.ToInt32(labelPrazo.Text));
                            parametros.Add("FLGQUITA_P", 0);*/

                            tipoSuspensao = tipos[0];
                            Regra regraPrestacaoProjetada = new Regra()
                            {
                                id = 26490
                            };

                            Regra regraMargemConsigAtual = new Regra()
                            {
                                id = 26491
                            };
                            object prestacaoProjetada = cliente.contrato.executarRegraRetorno(regraPrestacaoProjetada, parametros, ref mensagemRegra);
                            labelPrestacaoProjetada.Text = prestacaoProjetada.ToString();

                            object margemConsigAtual = cliente.contrato.executarRegraRetorno(regraMargemConsigAtual, parametros, ref mensagemRegra);
                            labelMargemConsigAtual.Text = String.Format("{0:n}", margemConsigAtual);// margemConsigAtual.ToString();
                            //Willamy Henrique de Oliveira Sol- 235170

                            //parametros.Add("DATAINICIOANT_P", caixaDataInicio.valorData);
                            //parametros.Add("QTDMESES_P", caixaTextoNumMeses.valorInteiro);
                            //William Moreira da Silva - SOL 211741

                            try
                            {
                                //string mensagemRegra = string.Empty;

                                object retornoRegra = cliente.contrato.executarRegraRetorno(tipoSuspensao.regraSuspensao, parametros, ref mensagemRegra);

                                //Verifica mensagem retornada da regra
                                if (!mensagemRegra.Equals("OK"))
                                {
                                    this.registrarAlerta(string.Format("Suspensão não permitida. {0}", this.tratarMensagem(mensagemRegra)));
                                }

                                if (caixaTextoNumMeses.valorInteiro == null)
                                {
                                    int mesesRegra;

                                    if (int.TryParse(retornoRegra.ToString(), out mesesRegra))
                                    {
                                        meses = mesesRegra;
                                    }
                                    else
                                    {
                                        dataFinal = Convert.ToDateTime(retornoRegra);
                                        caixaDataFinal.valorData = dataFinal;
                                    }
                                }

                                caixaDataFinal.valorData = DateTime.Now.AddMonths(int.Parse(caixaTextoNumMeses.Text.ToString())/*tipoSuspensao.numeroMeses*/);
                                this.atualizaDatas();//William Moreira da Silva SOL 211741
                            }
                            catch (FaultException<ContratoFaltaNegocio> erro)
                            {
                                this.registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
                                comboTipoSuspensao.SelectedIndex = 0;
                            }

                        }
                    }
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlertaAJAX(erro.Detail.mensagemErro.Replace("'", "").Replace("\"", "").Replace("\n", "\\n"));
            }

        }
        //William Moreira SOL 161455

        protected void comboTipoSuspensao_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (!String.IsNullOrEmpty(comboTipoSuspensao.SelectedValue))
                {
                    if (Convert.ToInt32(comboTipoSuspensao.SelectedValue) == 2 && chkPrazoIndeterminado.Checked == true )
                    {
                        this.registrarAlerta("Não é possível usar a marcação de Prazo Indeterminado para suspensão temporária. A marcação será removida.");
                        chkPrazoIndeterminado.Checked = false;
                    }

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        TipoSuspensao tipoSuspensao = null;
                        List<TipoSuspensao> tipos = cliente.contrato.consultarTipoSuspensao(this.tipoContrato.id, Convert.ToInt32(comboTipoSuspensao.SelectedValue));

                        // Saulo / FUNCEF
                        //Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                        ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                        //Verifica se possui Itens em aberto
                        if (!this.verificarItensEmAberto(contrato, tipos[0]))
                        {
                            comboTipoSuspensao.SelectedIndex = 0;
                            return;
                        }                       

                        //William Moreira da Silva SOL 244904 - PPM 609044
                        DateTime? parcelaGerada = cliente.contrato.verificaParcelaGerada(numeroContrato);
                        if (parcelaGerada != null)
                        {
                            if (Convert.ToInt32(comboTipoSuspensao.SelectedValue) != 9) { 
                                this.registrarAlerta($"Atenção! A prestação do mês já foi gerada (vencimento em {Convert.ToDateTime(parcelaGerada).ToString("dd/MM/yyyy")}).");                                
                            }
                            else{ 
                                this.registrarAlerta("Atenção! A suspensão será aplicada a todas as parcelas inadimplentes já geradas e às prestações futuras.");
                            }
                            //WO6477
                            //caixaDataInicio.Text = "21/" + DateTime.Today.Month.ToString() + "/" + DateTime.Today.Year.ToString();

                            //WO10127
                            //caixaDataInicio.Text = "21/" + DateTime.Today.AddMonths(1).Month.ToString() + "/" + DateTime.Today.Year.ToString();                                                                                                                                            
                            caixaDataInicio.Text = cliente.contrato.ObterProximoDiaUtil(Convert.ToDateTime(parcelaGerada).AddDays(1)).ToString();
                            
                        }
                        //William Moreira da Silva SOL 244904 - PPM 609044

                        //Nilton SOL 144458
                        if (tipos[0].id == 2)
                        {
                            string mensagemRegra = string.Empty;

                            //Parâmetros Regra 26490 e 26491.
                            IDictionary<string, object> parametros = new Dictionary<string, object>();
                            parametros.Add("IDCONTRATO_P", this.numeroContrato);
                            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);
                            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
                            parametros.Add("IDPATRO_P", contrato.patrocinadora.id);
                            parametros.Add("IDOPERACAO_P", TipoOperacao.suspensaoParcelas.chave);
                            parametros.Add("IDTIPOSUSPENSAO_P", Convert.ToInt32(comboTipoSuspensao.SelectedValue));

                            //William Moreira da Silva SOL 244904 - PPM 609044
                            if (string.IsNullOrEmpty(caixaDataFinal.Text))
                            {
                                if (string.IsNullOrEmpty(caixaDataInicio.Text))
                                    caixaDataInicio.Text = DateTime.Now.ToString();
                            }
                            //William Moreira da Silva SOL 244904 - PPM 609044

                            parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(caixaDataInicio.Text));
                            parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(caixaSelecaoExcepcional.Checked));
                            parametros.Add("QTDMESES_P", tipos[0].numeroMeses);
                            parametros.Add("FLGINTERNO_P", contrato.mutuario.flginternoParticipante);
                            parametros.Add("IDCALCULO_P", cliente.contrato.consultarUltimoIdCalculo());
                            parametros.Add("USUARIO_P", labelResponsavelAtualizacao.Text);

                            Regra regraPrestacaoProjetada = new Regra()
                            {
                                id = 26490
                            };

                            Regra regraMargemConsigAtual = new Regra()
                            {
                                id = 26491
                            };

                            object prestacaoProjetada = cliente.contrato.executarRegraRetorno(regraPrestacaoProjetada, parametros, ref mensagemRegra);
                            labelPrestacaoProjetada.Text = prestacaoProjetada.ToString();

                            object margemConsigAtual = cliente.contrato.executarRegraRetorno(regraMargemConsigAtual, parametros, ref mensagemRegra);
                            //labelMargemConsigAtual.Text = margemConsigAtual.ToString();
                            labelMargemConsigAtual.Text = String.Format("{0:n}", margemConsigAtual);
                            //Willamy Henrique de Oliveira Sol-235170

                            //labelPrestacaoAtual.Text = cliente.contrato.obterPrestacaoAtual(this.numeroContrato).ToString(); //SIG90605
                            labelPrestacaoAtual.Text = cliente.contrato.obterPrestacaoAtualComFGQC(this.numeroContrato).ToString();//SIG90605

                        }
                        //Nilton SOL 144458

                        bool parcelaEmAberto = cliente.contrato.parcelaAtrasadaEmAberto(this.numeroContrato, DateTime.Today);

                        if (tipos != null && tipos.Count > 0)
                        {
                            tipoSuspensao = tipos[0];

                            caixaSelecaoFerias.Checked = false;
                            caixaSelecaoFerias.Enabled = tipoSuspensao.ferias;
                            
                            //William Moreira da Silva - SOL 263968 - PPM 1134962
                            if (caixaTextoNumMeses.valorInteiro == null)
                            {
                                caixaTextoNumMeses.valorInteiro = tipoSuspensao.numeroMeses;
                            }
                            //William Moreira da Silva - SOL 263968 - PPM 1134962

                            //William Moreira da Silva SOL 244904 - PPM 609044
                            if (string.IsNullOrEmpty(caixaDataFinal.Text))
                            {
                                if (string.IsNullOrEmpty(caixaDataInicio.Text))
                                    caixaDataInicio.Text = DateTime.Now.ToString();
                            }
                            //William Moreira da Silva SOL 244904 - PPM 609044

                            //Parâmetros Regra 24823
                            IDictionary<string, object> parametros = new Dictionary<string, object>();
                            parametros.Add("IDCONTRATO_P", this.numeroContrato);
                            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);
                            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
                            parametros.Add("IDPATRO_P", contrato.patrocinadora.id);
                            parametros.Add("IDOPERACAO_P", TipoOperacao.suspensaoParcelas.chave);
                            parametros.Add("IDTIPOSUSPENSAO_P", Convert.ToInt32(comboTipoSuspensao.SelectedValue));

                            // Thiago Melo SOL 201262 Kintana 1945198 INI
                            parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(caixaDataInicio.Text));
                            //parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(contrato.suspensao.dataInicio)); 
                            // Thiago Melo SOL 201262 Kintana 1945198 FIM

                            parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(caixaSelecaoExcepcional.Checked));
                            parametros.Add("QTDMESES_P", caixaTextoNumMeses.valorInteiro);
                            parametros.Add("FLGINTERNO_P", contrato.mutuario.flginternoParticipante);
                            parametros.Add("IDCALCULO_P", cliente.contrato.consultarUltimoIdCalculo());
                            parametros.Add("USUARIO_P", labelResponsavelAtualizacao.Text);

                            try
                            {
                                string mensagemRegra = string.Empty;
                                object retornoRegra = cliente.contrato.executarRegraRetorno(tipoSuspensao.regraSuspensao, parametros, ref mensagemRegra);

                                //Verifica mensagem retornada da regra
                                if (!mensagemRegra.Equals("OK"))
                                {
                                    this.registrarAlerta(string.Format("Suspensão não permitida. {0}", this.tratarMensagem(mensagemRegra)));
                                    //WILLIAM MOREIRA DA SILVA SOL 14992
                                    //suspensao.Checked = true;
                                    bloqSuspensao.Value = string.Format("Suspensão não permitida. {0}", this.tratarMensagem(mensagemRegra));
                                    //WILLIAM MOREIRA DA SILVA SOL 14992
                                }

                                int mesesRegra;

                                if (int.TryParse(retornoRegra.ToString(), out mesesRegra))
                                {
                                    meses = mesesRegra;
                                }
                                else
                                {
                                    dataFinal = Convert.ToDateTime(retornoRegra);
                                    if (chkPrazoIndeterminado.Checked == false && dataFinal != new DateTime(1900,01,01))
                                        caixaDataFinal.valorData = dataFinal;
                                }

                                //WO10127 - Ajustada data final
                                if (chkPrazoIndeterminado.Checked == false)
                                    caixaDataFinal.valorData = Convert.ToDateTime(caixaDataInicio.valorData).AddMonths(tipoSuspensao.numeroMeses);
                                    //caixaDataFinal.valorData = DateTime.Now.AddMonths(tipoSuspensao.numeroMeses);                             

                            }
                            catch (FaultException<ContratoFaltaNegocio> erro)
                            {
                                this.registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
                                comboTipoSuspensao.SelectedIndex = 0;
                            }

                        }

                        //WO10127
                        ////William Moreira da Silva SOL 211704
                        ////William Moreira da Silva SOL 244904 - PPM 609044
                        ////bool parcelaGerada = cliente.contrato.verificaParcelaGerada(numeroContrato);
                        //if (parcelaGerada != null)
                        //{
                        //    //this.registrarAlerta("Atenção! A prestação do mês já foi gerada. A data de inicío deverá ser a partir do mês seguinte.");
                        //    //caixaDataInicio.Text = "21/"+DateTime.Today.Month.ToString()+"/"+DateTime.Today.Year.ToString();
                        //    this.atualizaDatas();
                        //}
                        ////William Moreira da Silva SOL 244904 - PPM 609044
                        ////William Moreira da Silva SOL 211704
                    }
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlertaAJAX(erro.Detail.mensagemErro.Replace("'", "").Replace("\"", "").Replace("\n", "\\n"));
            }
        }

        #endregion

        #region Métodos públicos

        //WILLIAM MOREIRA DA SILVA SOL 14992
        public string verificaSuspensao()
        {
            //return suspensao.Checked;
            return bloqSuspensao.Value;
        }
        //WILLIAM MOREIRA DA SILVA SOL 14992

        public bool verificarConsistencias()
        {
            bool consistente = true;


            if (this.inclusao)
            {
                if (chkPrazoIndeterminado.Checked == false && caixaDataFinal.Text == string.Empty)
                {
                    consistente = false;
                    this.registrarAlertaAJAX("A data Final de Suspensão é obrigatória.");
                    return consistente;
                }

                if (Convert.ToInt32(comboTipoSuspensao.SelectedValue) != 2 && chkPrazoIndeterminado.Checked == true)
                {
                    caixaDataFinal.Text = string.Empty;
                }

                if (caixaDataFinal.Text != string.Empty)
                {
                    if (caixaDataInicio.valorData.Value > caixaDataFinal.valorData.Value)
                    {
                        consistente = false;
                        this.registrarAlertaAJAX(MensagensAplicacao.instancia.mensagem039);
                    }

                    int dias = caixaDataFinal.valorData.Value.Subtract(caixaDataInicio.valorData.Value).Days / 30;
                    if (caixaTextoNumMeses.valorInteiro > dias)
                    {
                        consistente = false;
                        this.registrarAlertaAJAX(string.Format("A Data Final de Suspensão não pode   " +
                            "definir um período maior que {0}", caixaTextoNumMeses.valorInteiro));
                    }
                }

                if (caixaDataLiberacao.valorData.HasValue && caixaDataInicio.valorData.HasValue)
                {
                    if (caixaDataLiberacao.valorData.Value < caixaDataInicio.valorData.Value)
                    {
                        consistente = false;
                        this.registrarAlertaAJAX(MensagensAplicacao.instancia.mensagem036);
                    }
                }


                if (meses.HasValue)
                {
                    if (caixaTextoNumMeses.valorInteiro > meses)
                    {
                        consistente = false;
                        this.registrarAlertaAJAX(string.Format("Nº de meses não pode ser superior a {0}", meses));
                    }
                }

                if (caixaDataFinal.valorData.HasValue) { 
                    if (dataFinal.HasValue && (dataFinal.HasValue && dataFinal.Value.Year > 1900))
                    {
                        if (caixaDataFinal.valorData.Value > dataFinal)
                        {
                            consistente = false;
                            //William Moreira da Silva SOL 244904 - PPM 609044
                            //this.registrarAlertaAJAX(string.Format("Data Final não pode ser maior que {0}", caixaDataFinal.valorData.Value));
                            this.registrarAlertaAJAX(string.Format("Data Final não pode ser maior que {0}", dataFinal.ToString()));
                            //William Moreira da Silva SOL 244904 - PPM 609044
                        }
                    }
                }

            }


            if (caixaDataLiberacao.valorData.HasValue)
            {
                if (caixaDataLiberacao.valorData.Value < DateTime.Today)
                {
                    this.registrarAlertaAJAX("Data de Liberação não pode ser menor que hoje.");
                }

            }


            if (comboStatus.SelectedValue == "E" && caixaDataLiberacao.valorData.HasValue)
            {
                consistente = false;
                this.registrarAlertaAJAX(MensagensAplicacao.instancia.mensagem037);
            }

            if (caixaDataLiberacao.valorData.HasValue && comboStatus.SelectedValue != "C")
            {
                consistente = false;
                this.registrarAlertaAJAX(MensagensAplicacao.instancia.mensagem038);
            }

            //Wylliam Leite da Silva - SOL: 258352 PPM: 987653
            if (this.verificaRubicaMargem())
            {
                this.registrarAlerta("Não é permitida a suspensão");
               consistente = false;
            }


            return consistente;
        }

        /// <summary>
        /// Preenche a tela com os dados do grupo informado.
        /// </summary>
        /// <param name="grupo"><see cref="FUNCEF.GlobalWeb.Tipos.Seguranca.Grupo"/> a ser preenchido na tela.</param>
        public void carregarTela(HistoricoSuspensao historicoSuspensao)
        {
            this.inclusao = false;

            // Faz com que seja invisível alguns itens em caso de alteração.
            labelTipoSuspensao.Visible = true;
            comboTipoSuspensao.Visible = false;

            labelNumMeses.Visible = true;
            caixaTextoNumMeses.Visible = false;

            labelDataInicio.Visible = true;
            caixaDataInicio.Visible = false;

            labelDataFinal.Visible = true;
            caixaDataFinal.Visible = false;

            caixaTextoObservacao.Text = historicoSuspensao.observacao;//William Moreira da Silva SOL 149705  

            labelTipoSuspensao.Text = historicoSuspensao.tipoSuspensao.descricao;
            labelNumMeses.Text = historicoSuspensao.numeroMeses.ToString();
            labelDataInicio.Text = historicoSuspensao.dataInicio.ToString("dd/MM/yyyy");
            if (historicoSuspensao.dataFim.HasValue)
                labelDataFinal.Text = historicoSuspensao.dataFim.Value.ToString("dd/MM/yyyy");
            caixaSelecaoFerias.Checked = historicoSuspensao.ferias == 1;
            if (historicoSuspensao.dataLiberacao.HasValue)
                caixaDataLiberacao.valorData = historicoSuspensao.dataLiberacao.Value;
            if (historicoSuspensao.mesCobranca.HasValue)
                comboMesCobranca.SelectedValue = historicoSuspensao.mesCobranca.Value.ToString();
            if (historicoSuspensao.anoCobranca.HasValue)
                comboAnoCobranca.SelectedValue = historicoSuspensao.anoCobranca.Value.ToString();
            
            //TAES - SIG97832 - início
            comboStatus.Items.Add(new ListItem("Ativa", "A"));
            comboStatus.Items.Add(new ListItem("Cancelada", "C"));
            comboStatus.Items.Add(new ListItem("Encerrada", "E"));

            comboStatus.SelectedValue = historicoSuspensao.status.Substring(0,1);
            //TAES - SIG97832 - fim
            chkPrazoIndeterminado.Checked = historicoSuspensao.prazoIndeterminado == "S" ? true : false;
            hdIdTipoSuspensao.Value = historicoSuspensao.tipoSuspensao.id.ToString();
        }

        /// <summary>
        /// Obtém <see cref="FUNCEF.GlobalWeb.Tipos.Seguranca.Grupo"/> populado.
        /// </summary>
        /// <returns><see cref="FUNCEF.GlobalWeb.Tipos.Seguranca.Grupo"/> com as informações da tela.</returns>
        public HistoricoSuspensao obterHistoricoSuspensao()
        {
            if (!verificarConsistencias())
                return null;

            HistoricoSuspensao suspensao = null;

            if (this.Page.IsValid)
            {
                suspensao = new HistoricoSuspensao();

                if (this.inclusao)
                {
                    suspensao.tipoSuspensao = new TipoSuspensao();
                    suspensao.tipoSuspensao.id = Convert.ToInt32(comboTipoSuspensao.SelectedValue);
                    suspensao.status = "A";
                    suspensao.ferias = caixaSelecaoFerias.Checked ? 1 : 0;
                    suspensao.dataInicio = caixaDataInicio.valorData.Value;
                    suspensao.dataFim = chkPrazoIndeterminado.Checked ? null : (DateTime?)caixaDataFinal.valorData.Value;
                    suspensao.numeroMeses = caixaTextoNumMeses.valorInteiro.Value;
                    suspensao.responsavelAtendimento = ContextoSistema.atual.loginUsuarioAtual;
                    suspensao.prazoIndeterminado = chkPrazoIndeterminado.Checked ? "S" : "N";
                }
                else
                {
                    suspensao.tipoSuspensao = new TipoSuspensao() { id = Convert.ToInt32(hdIdTipoSuspensao.Value) };
                    suspensao.id = this.idHistoricoSuspensao;
                    suspensao.status = comboStatus.SelectedValue;
                    suspensao.dataLiberacao = caixaDataLiberacao.valorData;
                    suspensao.dataInicio = DateTime.Parse(labelDataInicio.Text);//William Moreira da Silva SOL161447

                    if (chkPrazoIndeterminado.Checked == false )
                        suspensao.dataFim = DateTime.Parse(labelDataFinal.Text); //William Moreira da Silva SOL161447   

                    suspensao.prazoIndeterminado = chkPrazoIndeterminado.Checked ? "S" : "N";
                }

                suspensao.observacao = caixaTextoObservacao.Text; //William Moreira da Silva SOL 149705
                suspensao.contrato = new Contrato();
                suspensao.contrato.numero = this.numeroContrato;
                suspensao.dataAtendimento = DateTime.Now;
                suspensao.dataAtualizacao = DateTime.Now;
                suspensao.responsavelAtualizacao = ContextoSistema.atual.loginUsuarioAtual;

                suspensao.mesCobranca = int.Parse(comboMesCobranca.SelectedValue); //NILTON 07/01/13
                suspensao.anoCobranca = int.Parse(comboAnoCobranca.SelectedValue); //NILTON 07/01/13
            }

            return suspensao;
        }

        #endregion

        #region Métodos privados

        private string tratarMensagem(string mensagem)
        {
            return mensagem.Replace("'", "").Replace("\"", "").Replace("\n", "\\n");
        }

        //William Moreira da Silva SOL 211704
        private void atualizaDatas()
        {
            if (caixaDataFinal.Text != "" && caixaDataInicio.Text != "")
            {
                DateTime dataFinal, dataInicial;
                int anoFinal, mesFinal, anoInicial, mesInicial;
                int quantMeses;

                dataFinal = DateTime.Parse(caixaDataFinal.Text);
                dataInicial = DateTime.Parse(caixaDataInicio.Text);

                anoFinal = dataFinal.Year;
                mesFinal = dataFinal.Month;

                anoInicial = dataInicial.Year;
                mesInicial = dataInicial.Month;

                if (dataFinal.Day.ToString() != dataInicial.Day.ToString())
                {
                    //caixaDataInicio.Text = "21/" + DateTime.Today.Month.ToString() + "/" + DateTime.Today.Year.ToString();
                    caixaDataFinal.Text = dataInicial.Day.ToString() + "/" + dataFinal.Month.ToString() + "/" + dataFinal.Year.ToString();//William Moreira da Silva SOL 211741
                }

                quantMeses = ((12 * (anoFinal - anoInicial)) + (mesFinal - mesInicial));
                caixaTextoNumMeses.Text = quantMeses.ToString();
            }
        }
        //William Moreira da Silva SOL 211704

        private bool verificarItensEmAberto(Contrato contrato, TipoSuspensao tipoSuspensao)
        {
            //Se não for cobrança judicial verifica se possui itens em aberto
            if (!tipoSuspensao.cobrancaJudicial)
            {
                // Thiago Melo SOL 208661 Kintana 2021125 INI

                // List<ItemContrato> itens = null; 
                bool possuiItens = false;

                //using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    //itens = cliente.contrato.obterItensEmAberto(contrato.numero); //NILTON - SOL201249 KTN1945208 - 22/02/2013

                    //William Moreira da Silva - SOL 260829 PPM 1045813
                    //possuiItens = cliente.contrato.temItensAbertoPorMatricula(contrato.mutuario.matricula);
                    possuiItens = cliente.contrato.verificaItensAberto(contrato.mutuario.id, contrato.mutuario.idTitular);
                    //William Moreira da Silva - SOL 260829 PPM 1045813
                }

                // if (itens != null && itens.Count > 0) 
                if (possuiItens) // Thiago Melo SOL 208661 Kintana 2021125 Fim
                {
                    this.registrarAlerta(MensagensAplicacao.instancia.mensagem035);
                    return false;
                }
            }

            return true;
        }

        //Wylliam Leite da Silva
        private bool verificaRubicaMargem()
        {
            try
            {
                if (!String.IsNullOrEmpty(comboTipoSuspensao.SelectedValue))
                {
                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                        TipoSuspensao tipoSuspensao = null;
                        List<TipoSuspensao> tipos = cliente.contrato.consultarTipoSuspensao(this.tipoContrato.id, Convert.ToInt32(comboTipoSuspensao.SelectedValue));

                        // Saulo / FUNCEF
                        //Contrato contrato = cliente.contrato.consultarContrato(this.numeroContrato);
                        ObjetoContrato contrato = new ObjetoContrato(this.numeroContrato);

                        //Verifica se possui Itens em aberto
                        if (!this.verificarItensEmAberto(contrato, tipos[0]))
                        {
                            comboTipoSuspensao.SelectedIndex = 0;
                            return false;
                        }

                        //William Moreira da Silva SOL 244904 - PPM 609044
                        DateTime? parcelaGerada = cliente.contrato.verificaParcelaGerada(numeroContrato);
                        if (parcelaGerada != null)
                        {
                            //WO10127 - Alteração da mensagem e da composição da data de início.
                            this.registrarAlerta("Atenção! A prestação do mês já foi gerada.");
                            //caixaDataInicio.Text = "21/" + DateTime.Today.AddMonths(1).Month.ToString() + "/" + DateTime.Today.Year.ToString();
                            ////this.atualizaDatas();
                            caixaDataInicio.Text = cliente.contrato.ObterProximoDiaUtil(Convert.ToDateTime(parcelaGerada).AddDays(1)).ToString();

                        }
                        //William Moreira da Silva SOL 244904 - PPM 609044

                        //Nilton SOL 144458
                        if (tipos[0].id == 2)
                        {
                            string mensagemRegra = string.Empty;

                            //Parâmetros Regra 26490 e 26491.
                            IDictionary<string, object> parametros = new Dictionary<string, object>();
                            parametros.Add("IDCONTRATO_P", this.numeroContrato);
                            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);
                            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
                            parametros.Add("IDPATRO_P", contrato.patrocinadora.id);
                            parametros.Add("IDOPERACAO_P", TipoOperacao.suspensaoParcelas.chave);
                            parametros.Add("IDTIPOSUSPENSAO_P", Convert.ToInt32(comboTipoSuspensao.SelectedValue));

                            //William Moreira da Silva SOL 244904 - PPM 609044
                            if (string.IsNullOrEmpty(caixaDataFinal.Text))
                            {
                                if (string.IsNullOrEmpty(caixaDataInicio.Text))
                                    caixaDataInicio.Text = DateTime.Now.ToString();
                            }
                            //William Moreira da Silva SOL 244904 - PPM 609044

                            parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(caixaDataInicio.Text));
                            parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(caixaSelecaoExcepcional.Checked));
                            parametros.Add("QTDMESES_P", tipos[0].numeroMeses);
                            parametros.Add("FLGINTERNO_P", contrato.mutuario.flginternoParticipante);
                            parametros.Add("IDCALCULO_P", cliente.contrato.consultarUltimoIdCalculo());
                            parametros.Add("USUARIO_P", labelResponsavelAtualizacao.Text);

                            Regra regraPrestacaoProjetada = new Regra()
                            {
                                id = 26490
                            };

                            Regra regraMargemConsigAtual = new Regra()
                            {
                                id = 26491
                            };

                            object prestacaoProjetada = cliente.contrato.executarRegraRetorno(regraPrestacaoProjetada, parametros, ref mensagemRegra);
                            labelPrestacaoProjetada.Text = prestacaoProjetada.ToString();

                            object margemConsigAtual = cliente.contrato.executarRegraRetorno(regraMargemConsigAtual, parametros, ref mensagemRegra);
                            //labelMargemConsigAtual.Text = margemConsigAtual.ToString();
                            labelMargemConsigAtual.Text = String.Format("{0:n}", margemConsigAtual);
                            //Willamy Henrique de Oliveira Sol-235170

                            //labelPrestacaoAtual.Text = cliente.contrato.obterPrestacaoAtual(this.numeroContrato).ToString();//SIG90605
                            labelPrestacaoAtual.Text = cliente.contrato.obterPrestacaoAtualComFGQC(this.numeroContrato).ToString();//SIG90605
                        }
                        //Nilton SOL 144458

                        bool parcelaEmAberto = cliente.contrato.parcelaAtrasadaEmAberto(this.numeroContrato, DateTime.Today);

                        if (tipos != null && tipos.Count > 0)
                        {
                            tipoSuspensao = tipos[0];

                            caixaSelecaoFerias.Checked = false;
                            caixaSelecaoFerias.Enabled = tipoSuspensao.ferias;

                            //William Moreira da Silva - SOL 263968 - PPM 1134962
                            if (caixaTextoNumMeses.valorInteiro == null)
                            {
                                caixaTextoNumMeses.valorInteiro = tipoSuspensao.numeroMeses;
                            }
                            //William Moreira da Silva - SOL 263968 - PPM 1134962

                            //William Moreira da Silva SOL 244904 - PPM 609044
                            if (string.IsNullOrEmpty(caixaDataFinal.Text))
                            {
                                if (string.IsNullOrEmpty(caixaDataInicio.Text))
                                    caixaDataInicio.Text = DateTime.Now.ToString();
                            }
                            //William Moreira da Silva SOL 244904 - PPM 609044

                            //Parâmetros Regra 24823
                            IDictionary<string, object> parametros = new Dictionary<string, object>();
                            parametros.Add("IDCONTRATO_P", this.numeroContrato);
                            parametros.Add("IDTIPOCONTRATO_P", contrato.tipo.id);
                            parametros.Add("IDMUTUARIO_P", contrato.mutuario.id);
                            parametros.Add("IDTITULAR_P", contrato.mutuario.idTitular);
                            parametros.Add("IDPATRO_P", contrato.patrocinadora.id);
                            parametros.Add("IDOPERACAO_P", TipoOperacao.suspensaoParcelas.chave);
                            parametros.Add("IDTIPOSUSPENSAO_P", Convert.ToInt32(comboTipoSuspensao.SelectedValue)); 

                            // Thiago Melo SOL 201262 Kintana 1945198 INI
                            parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(caixaDataInicio.Text));
                            //parametros.Add("DATAINICIOSUSP_P", DateTime.Parse(contrato.suspensao.dataInicio)); 
                            // Thiago Melo SOL 201262 Kintana 1945198 FIM

                            parametros.Add("EXCEPCIONAL_P", Convert.ToInt32(caixaSelecaoExcepcional.Checked));
                            parametros.Add("QTDMESES_P", caixaTextoNumMeses.valorInteiro);
                            parametros.Add("FLGINTERNO_P", contrato.mutuario.flginternoParticipante);
                            parametros.Add("IDCALCULO_P", cliente.contrato.consultarUltimoIdCalculo());
                            parametros.Add("USUARIO_P", labelResponsavelAtualizacao.Text);

                            try
                            {
                                string mensagemRegra = string.Empty;
                                object retornoRegra = cliente.contrato.executarRegraRetorno(tipoSuspensao.regraSuspensao, parametros, ref mensagemRegra);

                                //Verifica mensagem retornada da regra
                                if (!mensagemRegra.Equals("OK"))
                                {
                                    this.registrarAlerta(string.Format("Suspensão não permitida. {0}", this.tratarMensagem(mensagemRegra)));
                                    //WILLIAM MOREIRA DA SILVA SOL 14992
                                    //suspensao.Checked = true;
                                    bloqSuspensao.Value = string.Format("Suspensão não permitida. {0}", this.tratarMensagem(mensagemRegra));
                                    //WILLIAM MOREIRA DA SILVA SOL 14992
                                }

                                int mesesRegra;

                                if (int.TryParse(retornoRegra.ToString(), out mesesRegra))
                                {
                                    meses = mesesRegra;
                                }
                                else
                                {
                                    dataFinal = Convert.ToDateTime(retornoRegra);
                                    if (dataFinal != new DateTime(1900,01,01)) 
                                        caixaDataFinal.valorData = dataFinal;
                                }

                                //William Moreira da Silva - SOL 263968 - PPM 1134962
                                if (caixaTextoNumMeses.valorInteiro == null)
                                {
                                    int numeroMeses = (int)caixaTextoNumMeses.valorInteiro;

                                    caixaDataFinal.valorData = DateTime.Now.AddMonths(numeroMeses);
                                    //caixaDataFinal.valorData = DateTime.Now.AddMonths(tipoSuspensao.numeroMeses);
                                }
                                //William Moreira da Silva - SOL 263968 - PPM 1134962
                            }
                            catch (FaultException<ContratoFaltaNegocio> erro)
                            {
                                this.registrarAlerta(this.tratarMensagem(erro.Detail.mensagemErro));
                                comboTipoSuspensao.SelectedIndex = 0;
                            }
                        }

                        //William Moreira da Silva SOL 211704
                        //William Moreira da Silva SOL 244904 - PPM 609044
                        //bool parcelaGerada = cliente.contrato.verificaParcelaGerada(numeroContrato);
                        if (parcelaGerada != null)
                        {
                            //this.registrarAlerta("Atenção! A prestação do mês já foi gerada. A data de inicío deverá ser a partir do mês seguinte.");
                            //caixaDataInicio.Text = "21/"+DateTime.Today.Month.ToString()+"/"+DateTime.Today.Year.ToString();
                            this.atualizaDatas();
                        }
                        //William Moreira da Silva SOL 244904 - PPM 609044
                        //William Moreira da Silva SOL 211704
                    }
                }
            }
            catch (FaultException<ContratoFaltaNegocio> erro)
            {
                this.registrarAlertaAJAX(erro.Detail.mensagemErro.Replace("'", "").Replace("\"", "").Replace("\n", "\\n"));
                return true;
            }
            return false;
        }
        
        #endregion

    
    }
}
