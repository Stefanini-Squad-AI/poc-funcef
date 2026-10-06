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
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes.Utilidades;
using FUNCEF.Planus.WebEmprestimo.ObjetosNegocio;
using FUNCEF.Planus.Componentes.ServicoWeb.ContratosFalta;
using System.ServiceModel;
using FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades;
using FUNCEF.Planus.GlobalWeb.Cliente.Utilidades;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual
{
    public partial class Visualizacao : PaginaSegura
    {
        #region propriedades

        private Int32 checkBoxes
        {
            get
            {
                string queryString = Request.QueryString["checkBoxes"];

                Int32 checks = 0;
                Int32.TryParse(queryString, out checks);
                return checks;

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

        /*public Contrato contrato
        {
            get
            {
                if (ViewState["contrato"] == null)
                    ViewState["contrato"] = new Contrato();

                return (Contrato)ViewState["contrato"];
            }
            set
            {
                ViewState["contrato"] = value;
            }
        }*/

        //Campanha Desconto
        public Int32 IdMutuario
        {
            get
            {
                if (ViewState["IdMutuario"] != null)
                    return (int)this.ViewState["IdMutuario"];

                return 0;
            }
            set
            {
                ViewState["IdMutuario"] = value;
            }
        }

        #endregion

        protected void CheckBoxDesconto_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxDesconto.Checked)
            {
                itensBaixadosManualmente.Checked =
                apenasItensSuspensos.Checked =
                naoItensSuspensos.Checked = false;
                itensPrestacaoEncargos.Checked = true;

                itensBaixadosManualmente.Enabled =
                apenasItensSuspensos.Enabled =
                naoItensSuspensos.Enabled =
                itensPrestacaoEncargos.Enabled = false;
            }
            else
            {
                itensBaixadosManualmente.Checked =
                naoItensSuspensos.Checked =
                itensPrestacaoEncargos.Checked = true;
                apenasItensSuspensos.Checked = false;

                itensBaixadosManualmente.Enabled =
                apenasItensSuspensos.Enabled =
                naoItensSuspensos.Enabled =
                itensPrestacaoEncargos.Enabled = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.carregaTela();
            }
        }

        private void carregaTela()
        {
            ObjetoContrato contrato = new ObjetoContrato(numeroContrato);

            labelNumeroContrato.Text = contrato.numero.ToString();
            labelMutuario.Text = contrato.mutuario.nome.ToString();
            labelMatricula.Text = contrato.mutuario.matricula.ToString();
            labelCPF.Text = contrato.mutuario.cpf.ToString();
            labelSituacaoParticipante.Text = contrato.plano.situacao.ToString();
            labelPlanoPrev.Text = contrato.plano.descricao.ToString();
            labelPatrocinadora.Text = contrato.patrocinadora.nome.ToString();
            labelTipoEmprestimo.Text = contrato.tipoEmprestimo.descricao.ToString();
            labelTipoContrato.Text = contrato.tipo.descricao.ToString();
            labelIndexador.Text = contrato.indexador.sigla.ToString();
            dataAssinatura.valorData = contrato.dataAssinatura;
            dataCredito.valorData = contrato.dataCredito;
            dataPrimeiraParcelas.valorData = contrato.dataPrimeiraParcela;
            taxaJuros.Text = contrato.taxaJuros.ToString();
            valorSolicitado.Text = contrato.valorContrato.ToString();
            numParcelas.Text = contrato.totalParcelas.ToString();
            valorParcela.Text = contrato.valorParcela.ToString();

            //Informações do titular se forem iguais - retirar
            if (contrato.mutuario.id == contrato.mutuario.idTitular)
            {
                labelCPFTitular.Text = contrato.mutuario.cpf.ToString();
                labelMutuarioTitular.Text = contrato.mutuario.nome.ToString();
                labelMatriculaTitular.Text = contrato.mutuario.matricula.ToString();
                labelInscPrevidenciariaTitular.Text = contrato.mutuario.inscricaoPrevidenciaria.ToString();
                //Campanha Desconto
                IdMutuario = contrato.mutuario.idTitular;
            }
            else
            {
                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    string matricula = cliente.contrato.obterMatricula(contrato.mutuario.idTitular);
                    Mutuario mutuarioTitular = cliente.contrato.obterDadosMutuario(matricula);
                    labelCPFTitular.Text = mutuarioTitular.cpf.ToString();
                    labelMutuarioTitular.Text = mutuarioTitular.nome.ToString();
                    labelMatriculaTitular.Text = mutuarioTitular.matricula.ToString();
                    labelInscPrevidenciariaTitular.Text = mutuarioTitular.inscricaoPrevidenciaria.ToString();
                    //Campanha Desconto
                    IdMutuario = mutuarioTitular.idTitular;
                }
            }
            //Trata check boxes
            if (this.checkBoxes > 0)
            {
                itensBaixadosManualmente.Checked = (1 & this.checkBoxes) == 1;
                apenasItensSuspensos.Checked = (2 & this.checkBoxes) == 2;
                naoItensSuspensos.Checked = (4 & this.checkBoxes) == 4;
                itensPrestacaoEncargos.Checked = (8 & this.checkBoxes) == 8;
                CheckBoxDesconto.Checked = (16 & this.checkBoxes) == 16;

                if (CheckBoxDesconto.Checked)
                    CheckBoxDesconto_CheckedChanged(this, new EventArgs());
            }

            idTipoContrato = contrato.tipo.id;
        }

        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.tratamentoIndividualdeParcelas;
            }
        }

        public override string permissoesExigidas
        {
            get
            {
                return PermissoesSistema.consultar.ToString();
            }
        }

        protected void botaoContinuar_Click(object sender, EventArgs e)
        {
            //Dictionary<int, object> parametros = new Dictionary<int, object>();

            //Dictionary<string, object> parametrosItens = (Dictionary<string, object>)this.proxyEstado.obterEstado(this.guidItens);
            Dictionary<string, object> parametrosItens = new Dictionary<string, object>();

            int checks = itensBaixadosManualmente.Checked == true ? 1 : 0;
            checks += apenasItensSuspensos.Checked == true ? 2 : 0;
            checks += naoItensSuspensos.Checked == true ? 4 : 0;
            checks += itensPrestacaoEncargos.Checked == true ? 8 : 0;
            checks += CheckBoxDesconto.Checked ? 16 : 0;

            parametrosItens["numeroContrato"] = numeroContrato;
            parametrosItens["idTipoContrato"] = idTipoContrato;
            parametrosItens["checksBox"] = checks;
            //Campanha Desconto
            parametrosItens["IdMutuario"] = IdMutuario;

            //Context.Items.Add("contrato", contrato);//Passando as informações do contrato

            string guidItens = Guid.NewGuid().ToString();
            this.proxyEstado.manterEstadoSincrono(guidItens, parametrosItens);

            //Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Itens.aspx?contrato={0}&checksBox={1}", contrato, checks));
            //Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Itens.aspx?numeroContrato={0}&idTipoContrato={1}&checksBox={2}", numeroContrato, idTipoContrato, checks));
            Response.Redirect(String.Format("~/Paginas/Tratamentos/Individual/Itens.aspx?guidItens={0}", guidItens));
            //Server.Transfer(String.Format("~/Paginas/Tratamentos/Individual/Itens.aspx?numeroContrato={0}&idTipoContrato={1}&checksBox={2}", numeroContrato, idTipoContrato, checks));
        }
        //Campanha Desconto
        private RelatorioContrato ToContratoDTO(ObjetoContrato contrato)
        {
            RelatorioContrato contratoDTO = new RelatorioContrato();
            contratoDTO.numeroContrato = contrato.numero;
            contratoDTO.prazo = contrato.totalParcelas;
            contratoDTO.valorMaximo = contrato.valorMaximo;
            contratoDTO.valorSolicitado = (double)contrato.valorContrato;
            contratoDTO.DataCredito = contrato.dataCredito;
            contratoDTO.dataAssinatura = (DateTime)contrato.dataAssinatura;
            contratoDTO.Modalidade = contrato.tipo.descricao;
            contratoDTO.contratosQuitados = string.Empty;
            contratoDTO.descontoInadimplencia = new List<DescontoInadimplencia>();
            contratoDTO.fiadores = new Avalistas[0];
            contratoDTO.financiamento = false;
            contratoDTO.valorFinanciamento = 0;
            contratoDTO.PropostaCampanha = 2;
            contratoDTO.CampanhaDesconto = true;
            return contratoDTO;
        }
    }
}