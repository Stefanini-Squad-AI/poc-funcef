using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.GlobalWeb.Web.IU.Utilidades;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Tipos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Consultas.Contratos
{
    public partial class PopupNovoAvalista : PaginaSeguraComEstado
    {
        #region Propriedades

        public Pessoa ListaPessoa
        {
            get
            {
                if (ViewState["vListaPessoa"] == null)
                    ViewState["vListaPessoa"] = new Pessoa();

                return (Pessoa)ViewState["vListaPessoa"];
            }
            set
            {
                ViewState["vListaPessoa"] = value;
            }
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

        private string cpfMutuario
        {
            get
            {
                return Request.QueryString["cpfMutuario"];
            }
        }

        protected bool fisicaJuridica = false;

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                carregarComboLocalEndereco();
                carregarComboCidade();
                carregarComboUF();
                carregarComboPais();
                CampoOcultoFisicaJuridica.Value = "0";
                recipienteAbaContratoSecundario.ActiveTabIndex = 0;//William Moreira da Silva
            }
            else
            {
                if (Session["idPessoa"] != null)
                {
                    int idPessoa = Convert.ToInt32(Session["idPessoa"].ToString());
                    CampoOcultoIdPessoa.Value = idPessoa.ToString();

                    if (idPessoa != 0)
                    {
                        Consultar(idPessoa);
                    }
                    Session["idPessoa"] = null;
                }
                else
                {
                    if (Session["nomeAvalista"] != null)
                    {
                        string[] sGrupo = Session["nomeAvalista"].ToString().Split('|');
                        CaixaTextoGrupo.Text = sGrupo[1].ToString();
                        CampoOcultoIdGrupo.Value = sGrupo[0].ToString();
                        Session["nomeAvalista"] = null;
                    }
                }
            }
            alteraTelaFisicaJuridica((CampoOcultoFisicaJuridica.Value == "1"));
        }

        /// <summary>
        /// Consultar Pessoa.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Consultar Pessoa</param>
        private void Consultar(Int32 idPessoa)
        {
            Pessoa pessoa = null;

            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                pessoa = cliente.contrato.consultarInfPessoa(idPessoa);

                pessoa.documentos = new List<Documento>();
                pessoa.documentos = cliente.contrato.consultarDocPessoa(idPessoa);
                UtilidadesPagina.preencherDropDown(caixaSelecaoTipoDocumento, pessoa.documentos, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idDocumento");

                bool bTemCPF = false;

                for (int i = 0; i < pessoa.documentos.Count; i++)
                {
                    if ((pessoa.documentos[i].nome.Equals("CPF")) || (pessoa.documentos[i].nome.Equals("CNPJ")))
                    {
                        CaixaTextoNumeroDocumento.Text = pessoa.documentos[i].numDocumento.ToString();
                        caixaSelecaoTipoDocumento.SelectedValue = pessoa.documentos[i].idDocumento.ToString();
                        bTemCPF = true;
                        break;
                    }
                }

                if (!bTemCPF)
                {
                    caixaSelecaoTipoDocumento.SelectedValue = pessoa.documentos[0].idDocumento.ToString();
                    CaixaTextoNumeroDocumento.Text = pessoa.documentos[0].numDocumento.ToString();
                }
                if (pessoa.tipo == "J")
                {
                    pessoa.idDocumento = 1;
                    CampoOcultoFisicaJuridica.Value = "1";
                }
                else
                {
                    pessoa.idDocumento = 2;
                    CampoOcultoFisicaJuridica.Value = "0";
                }

                AlterarCamposTela();

                pessoa.enderecos = new List<Endereco>();
                pessoa.enderecos = cliente.contrato.consultarEndPessoa(idPessoa);
                PreencherGridEndereco(pessoa.enderecos);

                pessoa.telefones = new List<Telefone>();
                pessoa.telefones = cliente.contrato.consultarTelPessoa(idPessoa);
                UtilidadesPagina.preencherDropDown(DropDownListTelefone, pessoa.telefones, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "numero", "idTelefone");
                PreencherGridTelefone(pessoa.telefones);

                pessoa.contatos = new List<Contato>();
                pessoa.contatos = cliente.contrato.consultarContPessoa(idPessoa);
                for (int i = 0; i < pessoa.contatos.Count; i++)
                {
                    for (int j = 0; j < pessoa.telefones.Count; j++)
                    {
                        if (pessoa.contatos[i].idTelefone == pessoa.telefones[j].idTelefone)
                        {
                            pessoa.contatos[i].telefone = pessoa.telefones[j].numero;
                        }
                    }
                }
                UtilidadesPagina.preencherDropDown(DropDownListContato, pessoa.contatos, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idContato");
                PreencherGridContato(pessoa.contatos);

                this.PreencherGridDocumento(pessoa.documentos);//William Moreira da Silva

                pessoa.avalista = new Avalistas();

                pessoa.avalista = cliente.contrato.consultarAvalistaPessoa(idPessoa);

                pessoa.possuiVinculo = cliente.contrato.consultarVinculo(idPessoa);

                PreencherTela(pessoa);
                ListaPessoa = pessoa;
            }

        }

        /// <summary>
        /// Obtém Endereco selecionado
        /// </summary>
        private Int32 obterEnderecoSelecionado()
        {
            Int32 enderecoSelecionados = 0;
            string mensagem = "";
            if (gridEndereco.chavesSelecionadas.Count > 0)
            {
                if (gridEndereco.chavesSelecionadas.Count > 1)
                {
                    mensagem = "Não é permitido escolher mais que um Endereço.";

                    this.registrarAlerta(mensagem);
                    enderecoSelecionados = 0;
                }
                else
                {
                    int registros = gridEndereco.chavesSelecionadas.Count;

                    for (int i = 0; i < registros; i++)
                    {
                        DataKey dataKey = gridEndereco.chavesSelecionadas[i];
                        enderecoSelecionados = ((Int32)dataKey.Values[0]);
                    }
                }
            }
            else
            {
                mensagem = "Por favor, selecione um registro para alteração.";
                this.registrarAlerta(mensagem);
                enderecoSelecionados = 0;
            }

            return enderecoSelecionados;
        }

        /// <summary>
        /// Excluir Endereco selecionado
        /// </summary>
        private void ExcluirEnderecoSelecionado()
        {
            Int32 enderecoSelecionados = 0;
            if (ListaPessoa.enderecos != null && ListaPessoa.enderecos.Count > 0)
            {
                int totLinhasGrid = gridEndereco.Rows.Count;

                if (gridEndereco.chavesSelecionadas.Count > 0)
                {
                    int registros = gridEndereco.chavesSelecionadas.Count;

                    for (int i = 0; i < registros; i++)
                    {
                        DataKey dataKey = gridEndereco.chavesSelecionadas[i];
                        enderecoSelecionados = ((Int32)dataKey.Values[0]);
                        // excluir endereços
                        using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                        {
                            var endereco = ListaPessoa.enderecos.Find(a => a.idEndereco == enderecoSelecionados);
                            if (endereco != null)
                            {
                                if (ListaPessoa.telefones != null)
                                {
                                    for (int j = 0; j < ListaPessoa.telefones.Count; j++)
                                    {
                                        if (ListaPessoa.telefones[j].idEndereco == enderecoSelecionados)
                                        {
                                            ListaPessoa.telefones.RemoveAt(j);
                                        }
                                    }
                                }
                                ListaPessoa.enderecos.Remove(endereco);
                            }
                            cliente.contrato.excluirTelefoneEndereco(enderecoSelecionados);
                            cliente.contrato.excluirEndereco(enderecoSelecionados);
                        }
                    }
                    PreencherGridEndereco(ListaPessoa.enderecos);
                    PreencherGridTelefone(ListaPessoa.telefones);
                }
                else
                {
                    registrarAlerta("Por favor, selecione um registro para exclusão");
                }
            }
        }

        /// <summary>
        /// Obtém Telefone selecionado
        /// </summary>
        //private Int32 obterTelefoneSelecionado()
        private DataKey obterTelefoneSelecionado()
        {
            string mensagem = string.Empty;

            if (gridTelefone.chavesSelecionadas.Count > 0)
            {
                if (gridTelefone.chavesSelecionadas.Count > 1)
                {
                    mensagem = "Não é permitido escolher mais que um Telefone.";

                    this.registrarAlerta(mensagem);
                    return null;
                }
                else
                {
                    return gridTelefone.chavesSelecionadas[0];
                }
            }
            else
            {
                mensagem = "Por favor, selecione um registro para alteração.";
                this.registrarAlerta(mensagem);
                return null;
            }
            return null;
        }

        /// <summary>
        /// exclui Telefone selecionado
        /// </summary>
        private void excluirTelefoneSelecionado()
        {
            int telefoneSelecionado = 0;

            if (ListaPessoa.telefones != null && ListaPessoa.telefones.Count > 0)
            {
                if (gridTelefone.chavesSelecionadas.Count > 0)
                {
                    int registros = gridTelefone.chavesSelecionadas.Count;

                    for (int i = 0; i < registros; i++)
                    {
                        DataKey dataKey = gridTelefone.chavesSelecionadas[i];
                        telefoneSelecionado = ((Int32)dataKey.Values[0]);

                        // excluir telefones
                        using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                        {
                            var telefone = ListaPessoa.telefones.Find(a => a.idTelefone == telefoneSelecionado && a.idTelContato == (Int32)dataKey.Values["idTelContato"]);
                            if (ListaPessoa.contatos.Find(t => t.idTelefone == telefoneSelecionado) != null)
                            {
                                ListaPessoa.contatos.Find(t => t.idTelefone == telefoneSelecionado && t.idTelContato == (Int32)dataKey.Values["idTelContato"]).telefone = "";
                                ListaPessoa.contatos.Find(t => t.idTelefone == telefoneSelecionado && t.idTelContato == (Int32)dataKey.Values["idTelContato"]).idTelefone = 0;
                            }

                            if (ListaPessoa.telefones.Where(a => a.idTelefone == telefoneSelecionado).Count() > 1)
                            {
                                cliente.contrato.excluirTelContato((Int32)dataKey.Values["idTelContato"]);
                            }
                            else
                            {
                                cliente.contrato.excluirTelefone(telefone);
                            }
                            if (telefone != null)
                            {
                                ListaPessoa.telefones.Remove(telefone);
                            }
                        }
                    }
                    PreencherGridTelefone(ListaPessoa.telefones);
                }
                else
                {
                    registrarAlerta("Por favor, selecione um registro para exclusão");
                }
            }
        }

        private void excluirPessoa()
        {
            using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
            {
                Pessoa pessoa = ListaPessoa;
                // excluir Avalista
                cliente.contrato.excluirNovoAvalista(pessoa.idPessoa);
                cliente.contrato.excluirTelefones(pessoa.telefones);
                cliente.contrato.excluirContatos(pessoa.contatos);

                // excluir Endereco
                for (int i = 0; i < pessoa.enderecos.Count; i++)
                {
                    cliente.contrato.excluirEndereco(pessoa.enderecos[i].idEndereco);
                }
            }
        }

        /// <summary>
        /// Obtém Contato selecionado
        /// </summary>
        //private Int32 obterContatoSelecionado()
        private DataKey obterContatoSelecionado()
        {
            string mensagem = string.Empty;

            if (gridContato.chavesSelecionadas.Count > 0)
            {
                if (gridContato.chavesSelecionadas.Count > 1)
                {
                    mensagem = "Não é permitido escolher mais que um Contato.";

                    this.registrarAlerta(mensagem);
                    return null;
                }
                else
                {
                    int registros = gridContato.chavesSelecionadas.Count;

                    for (int i = 0; i < registros; i++)
                    {
                        return gridContato.chavesSelecionadas[i];
                    }
                }
            }
            else
            {
                mensagem = "Por favor, selecione um registro para alteração.";
                this.registrarAlerta(mensagem);
                return null;
            }

            return null;
        }

        /// <summary>
        /// Obtém Contato selecionado
        /// </summary>
        private void excluirContatoSelecionado()
        {
            Int32 contatoSelecionados = 0;
            if (ListaPessoa.contatos != null && ListaPessoa.contatos.Count > 0)
            {
                if (gridContato.chavesSelecionadas.Count > 0)
                {
                    int registros = gridContato.chavesSelecionadas.Count;

                    for (int i = 0; i < registros; i++)
                    {
                        DataKey dataKey = gridContato.chavesSelecionadas[i];
                        contatoSelecionados = (Int32)dataKey.Values[0];

                        // excluir telefones
                        using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                        {
                            var contato = ListaPessoa.contatos.Find(a => a.idContato == contatoSelecionados && a.idTelContato == (Int32)dataKey.Values["idTelContato"]);
                            if (ListaPessoa.telefones.Find(t => t.idContato == contatoSelecionados) != null)
                            {
                                ListaPessoa.telefones.Find(t => t.idContato == contatoSelecionados && t.idTelContato == (Int32)dataKey.Values["idTelContato"]).idContato = 0;
                            }
                            if (ListaPessoa.contatos.Where(a => a.idContato == contatoSelecionados).Count() > 1)
                            {
                                cliente.contrato.excluirTelContato((Int32)dataKey.Values["idTelContato"]);
                            }
                            else
                            {
                                cliente.contrato.excluirContato(contato);
                            }
                            if (contato != null)
                            {
                                ListaPessoa.contatos.Remove(contato);
                            }
                        }
                    }
                    PreencherGridContato(ListaPessoa.contatos);
                }
                else
                {
                    registrarAlerta("Por favor, selecione um registro para exclusão");
                }
            }
        }

        /// <summary>
        /// Carrega o Combo de Local de endereço.
        /// </summary>
        private void carregarComboLocalEndereco()
        {
            CaixaTextoLocal.Items.Add(string.Empty);
            CaixaTextoLocal.Items.Add("Filial");
            CaixaTextoLocal.Items.Add("Filial - Cobrança");
            CaixaTextoLocal.Items.Add("Matriz");
            CaixaTextoLocal.Items.Add("Matriz - Cobrança");
        }

        /// <summary>
        /// Carrega o Combo de Tipo de Contrato.
        /// </summary>
        private void carregarComboTipoDocumento(string tipoPessoa)
        {
            List<Documento> listaTipoDocumento = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaTipoDocumento = cliente.contrato.consultarDocumentos(tipoPessoa);
            }

            UtilidadesPagina.preencherDropDown(caixaSelecaoTipoDocumento, listaTipoDocumento, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idDocumento");
        }

        /// <summary>
        /// Carrega o Combo UF.
        /// </summary>
        private void carregarComboUF()
        {
            List<UF> listaUF = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaUF = cliente.contrato.consultarUF();
            }

            UtilidadesPagina.preencherDropDown(DropDownListEstado, listaUF, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idEstado");
            UtilidadesPagina.preencherDropDown(DropDownListUnidadeFederacao, listaUF, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "codEstado", "idEstado");

        }

        /// <summary>
        /// Carrega o Combo Cidade.
        /// </summary>
        private void carregarComboCidade()
        {
            List<Cidade> listaCidades = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaCidades = cliente.contrato.consultarCidades();
            }

            UtilidadesPagina.preencherDropDown(DropDownListCidade, listaCidades, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idCidade");
        }

        /// <summary>
        /// Carrega o Combo Pais.
        /// </summary>
        private void carregarComboPais()
        {
            List<Pais> listaPais = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                listaPais = cliente.contrato.consultarPais();
            }

            UtilidadesPagina.preencherDropDown(DropDownListPais, listaPais, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idPais");
        }

        private void AlterarCamposTela()
        {
            if (caixaSelecaoTipoDocumento.SelectedItem.Text.Equals("Selecione") || caixaSelecaoTipoDocumento.SelectedItem.Text.Equals(string.Empty))
            {
                divDataEmissao.Visible = false;
                divDataValidade.Visible = false;
                divDocumento.Visible = false;
                divOrgaoEmissor.Visible = false;
                divUnidadeFederacao.Visible = false;
                return;
            }

            if (!CampoOcultoEvento.Value.Equals(string.Empty))
            {
                CaixaTextoNumeroDocumento.Text = string.Empty;
            }

            if (!String.IsNullOrEmpty(caixaSelecaoTipoDocumento.SelectedItem.Text))
            {
                LabelNomeDocumento.Text = caixaSelecaoTipoDocumento.SelectedItem.Text;

                divDataEmissao.Visible = false;
                divDataValidade.Visible = false;
                divDocumento.Visible = true;
                divOrgaoEmissor.Visible = false;
                divUnidadeFederacao.Visible = false;
            }

            //De acordo com o documento, aparecer os textBoxes especificos para cada um
            //Cart. Indentidade Profissional = 41
            //Carteira de Trabalho = 9
            if ((caixaSelecaoTipoDocumento.SelectedValue == "41") || (caixaSelecaoTipoDocumento.SelectedValue == "9"))
            {
                //Unidade da Federação
                //Data de Emissão
                divDataEmissao.Visible = true;
                divDataValidade.Visible = false;
                divOrgaoEmissor.Visible = false;
                divUnidadeFederacao.Visible = true;
            }

            //Carteira de Habilitação - CNH = 45
            if ((caixaSelecaoTipoDocumento.SelectedValue == "45"))
            {
                //Data de Validade
                //Data de Emissão
                divDataEmissao.Visible = true;
                divDataValidade.Visible = true;
                divOrgaoEmissor.Visible = false;
                divUnidadeFederacao.Visible = false;
            }

            //Carteira de Identidade = 11
            if ((caixaSelecaoTipoDocumento.SelectedValue == "11"))
            {
                //Orgão Emissor
                //Unidade da Federação
                //Data de Emissão

                divDataEmissao.Visible = true;
                divDataValidade.Visible = false;
                divOrgaoEmissor.Visible = true;
                divUnidadeFederacao.Visible = true;
            }

            //Certidão de Obito = 44
            //Inscrição Recebida = 43
            //NUMERO DO AVISO DE RECEBIMENTO = 38
            //PIS/PASEP = 6
            if ((caixaSelecaoTipoDocumento.SelectedValue == "44") || (caixaSelecaoTipoDocumento.SelectedValue == "43") || (caixaSelecaoTipoDocumento.SelectedValue == "38") || (caixaSelecaoTipoDocumento.SelectedValue == "6"))
            {
                //Data de Emissão

                divDataEmissao.Visible = true;
                divDataValidade.Visible = false;
                divOrgaoEmissor.Visible = false;
                divUnidadeFederacao.Visible = false;
            }

            //William Moreira da Silva
            List<Documento> docPessoaSelecionado = new List<Documento>();
            Int32 idPessoaAlterar = 0;
            if (!String.IsNullOrEmpty(CampoOcultoIdPessoa.Value))
            {
                idPessoaAlterar = Convert.ToInt32(CampoOcultoIdPessoa.Value);
            }
            //William Moreira da Silva

            if (CampoOcultoEvento.Value != "Incluir")
            {
                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    docPessoaSelecionado = cliente.contrato.consultarDocPessoa(idPessoaAlterar);
                }

                if (docPessoaSelecionado.Count > 0)
                {
                    if (docPessoaSelecionado.FindAll(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).Count > 0)
                    {
                        CaixaTextoNumeroDocumento.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().numDocumento.ToString();
                        CaixaDataDataValidade.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().dataValidade.ToString();
                        CaixaTextoDataEmissao.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().dataEmissao.ToString();
                        CaixaTextoOrgaoEmissor.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().orgao.ToString();
                        Int32 idEstado = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().uf.idEstado;
                        if (idEstado > 0)
                        {
                            DropDownListUnidadeFederacao.SelectedValue = idEstado.ToString(); ;
                        }

                        if ((caixaSelecaoTipoDocumento.SelectedValue == "1") || (caixaSelecaoTipoDocumento.SelectedValue == "2"))
                        {
                            if (CaixaTextoNumeroDocumento.Text.Equals(string.Empty))
                            {
                                CaixaTextoNumeroDocumento.Text = caixaTextoCPF.Text.Replace(".", "").Replace("-", "").Replace("/", "").ToString();
                            }
                        }
                    }
                    else
                    {
                        DropDownListUnidadeFederacao.SelectedIndex = 0;
                        CaixaTextoOrgaoEmissor.Text = string.Empty;
                        CaixaTextoDataEmissao.Text = string.Empty;
                        CaixaDataDataValidade.Text = string.Empty;
                    }
                }
            }
            else
            {
                DropDownListUnidadeFederacao.SelectedIndex = 0;
                CaixaTextoOrgaoEmissor.Text = string.Empty;
                CaixaTextoDataEmissao.Text = string.Empty;
                CaixaDataDataValidade.Text = string.Empty;

                using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
                {
                    docPessoaSelecionado = cliente.contrato.consultarDocPessoa(idPessoaAlterar);
                }

                if (docPessoaSelecionado.FindAll(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).Count > 0)
                {
                    CaixaTextoNumeroDocumento.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().numDocumento.ToString();
                    CaixaDataDataValidade.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().dataValidade.ToString();
                    CaixaTextoDataEmissao.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().dataEmissao.ToString();
                    CaixaTextoOrgaoEmissor.Text = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().orgao.ToString();
                    Int32 idEstado = docPessoaSelecionado.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().uf.idEstado;
                    if (idEstado > 0)
                    {
                        DropDownListUnidadeFederacao.SelectedValue = idEstado.ToString(); ;
                    }

                    if ((caixaSelecaoTipoDocumento.SelectedValue == "1") || (caixaSelecaoTipoDocumento.SelectedValue == "2"))
                    {
                        if (CaixaTextoNumeroDocumento.Text.Equals(string.Empty))
                        {
                            CaixaTextoNumeroDocumento.Text = caixaTextoCPF.Text.Replace(".", "").Replace("-", "").Replace("/", "").ToString();
                        }
                    }
                }
                else
                {
                    if (ListaPessoa.documentos != null)
                    {
                        if (ListaPessoa.documentos.FindAll(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).Count > 0)
                        {
                            CaixaTextoNumeroDocumento.Text = ListaPessoa.documentos.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().numDocumento.ToString();
                            CaixaDataDataValidade.Text = ListaPessoa.documentos.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().dataValidade.ToString();
                            CaixaTextoDataEmissao.Text = ListaPessoa.documentos.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().dataEmissao.ToString();
                            CaixaTextoOrgaoEmissor.Text = ListaPessoa.documentos.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().orgao.ToString();
                            Int32 idEstado = ListaPessoa.documentos.Where(t1 => t1.idDocumento == Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue)).First().uf.idEstado;
                            if (idEstado > 0)
                            {
                                DropDownListUnidadeFederacao.SelectedValue = idEstado.ToString(); ;
                            }

                            if ((caixaSelecaoTipoDocumento.SelectedValue == "1") || (caixaSelecaoTipoDocumento.SelectedValue == "2"))
                            {
                                if (CaixaTextoNumeroDocumento.Text.Equals(string.Empty))
                                {
                                    CaixaTextoNumeroDocumento.Text = caixaTextoCPF.Text.Replace(".", "").Replace("-", "").Replace("/", "").ToString();
                                }
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Efetua uma ação quando o valor da caixa de seleção de Tipo de documento é alterado.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void caixaSelecaoTipoDocumento_SelectedIndexChanged(object sender, EventArgs e)
        {
            recipienteAbaContratoSecundario.ActiveTabIndex = 0;
            AlterarCamposTela();
        }

        /// <summary>
        /// Evento para preencher dropdows Estado e Pais de acordo com a cidade selecionada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void preencheUFPais_onSelectedIndexChanged(object sender, EventArgs e)
        {
            int idCidade = Convert.ToInt32(DropDownListCidade.SelectedValue);
            Cidade cidade = null;
            using (Cliente<IServicoMutuario> cliente = new Cliente<IServicoMutuario>())
            {
                cidade = cliente.contrato.obterInfosCidade(idCidade);
            }
            DropDownListEstado.SelectedValue = cidade.estado.idEstado.ToString();
            DropDownListPais.SelectedValue = cidade.pais.idPais.ToString();
        }

        protected void BotaoAcaoIncluirDocumento_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }

            if (ListaPessoa.documentos == null)
            {
                preencherObjetoPessoa();
            }

            Pessoa pessoa = ListaPessoa;
            Documento item = new Documento();

            if (!String.IsNullOrEmpty(caixaSelecaoTipoDocumento.SelectedValue))
            {
                item.idDocumento = Convert.ToInt32(caixaSelecaoTipoDocumento.SelectedValue);

                if (ListaPessoa.documentos != null)
                {
                    for (int i = 0; i < ListaPessoa.documentos.Count; i++)
                    {
                        if (ListaPessoa.documentos[i].idDocumento == item.idDocumento)
                        {
                            ListaPessoa.documentos.Remove(ListaPessoa.documentos[i]);
                        }
                    }
                }
            }
            else
            {
                item.idDocumento = 0;
            }

            if (!String.IsNullOrEmpty(CaixaTextoNumeroDocumento.Text))
            {
                item.numDocumento = CaixaTextoNumeroDocumento.Text.Replace(".", "").Replace("-", "").Replace("/", "").ToString(); //William Moreira da Silva
                item.nome = LabelNomeDocumento.Text;//William Moreira da Silva
            }
            else
            {
                item.numDocumento = string.Empty;
            }

            item.uf = new UF();
            if (!String.IsNullOrEmpty(DropDownListUnidadeFederacao.SelectedValue))
            {
                item.uf.idEstado = Convert.ToInt32(DropDownListUnidadeFederacao.SelectedValue);
            }
            else
            {
                item.uf.idEstado = 0;
            }

            item.orgao = CaixaTextoOrgaoEmissor.Text;
            if (!string.IsNullOrEmpty(CaixaTextoDataEmissao.Text))
            {
                item.dataEmissao = Convert.ToDateTime(CaixaTextoDataEmissao.Text);
            }
            else
            {
                item.dataEmissao = DateTime.MinValue;
            }

            if (!string.IsNullOrEmpty(CaixaDataDataValidade.Text))
            {
                item.dataValidade = Convert.ToDateTime(CaixaDataDataValidade.Text);
            }
            else
            {
                item.dataValidade = DateTime.MinValue;
            }

            bool docNovo = false;
            if (CampoOcultoEvento.Value.Equals("Alterar"))
            {
                docNovo = true;
                for (int i = 0; i < ListaPessoa.documentos.Count; i++)
                {
                    if (ListaPessoa.documentos[i].idDocumento == item.idDocumento)
                    {
                        docNovo = false;
                        ListaPessoa.documentos[i] = item;
                        break;
                    }
                }
            }

            if ((docNovo) || CampoOcultoEvento.Value.Equals("Incluir"))
            {
                if (ListaPessoa.documentos == null)
                {
                    ListaPessoa.documentos = new List<Documento>();
                }
                ListaPessoa.documentos.Add(item);
            }

            PreencherGridDocumento(pessoa.documentos);//William Moreira da Silva
        }

        private void PreencherTela(Pessoa pessoa)
        {
            caixaTextoCPF.Text = pessoa.numDocumento;
            CaixaTextoEmail.Text = pessoa.email;
            CaixaTextoGrupo.Text = pessoa.nomeGrupo;
            CaixaTextoHomePage.Text = pessoa.homePage;
            CaixaTextoNomeFantasia.Text = pessoa.nome;
            CaixaTextoRazaoSocial.Text = pessoa.razaoSocial;
            CaixaTextoGrupo.Text = pessoa.nomeGrupo;
            CaixaTextoOrigemRendimento.Text = pessoa.avalista.origem;
            CaixaTextoRendaComprovada.Text = pessoa.avalista.renda.ToString();
            CaixaTextoMargemConsignavel.Text = pessoa.avalista.margem.ToString();
            CampoOcultoIdGrupo.Value = pessoa.idGrupo.ToString();
        }

        private void limparTela()
        {
            caixaTextoCPF.Text = string.Empty;
            CaixaTextoEmail.Text = string.Empty;
            CaixaTextoGrupo.Text = string.Empty;
            CaixaTextoHomePage.Text = string.Empty;
            CaixaTextoNomeFantasia.Text = string.Empty;
            CaixaTextoRazaoSocial.Text = string.Empty;
            CaixaTextoGrupo.Text = string.Empty;
            CaixaTextoNumeroDocumento.Text = string.Empty;
            // avalista
            CaixaTextoOrigemRendimento.Text = string.Empty;
            CaixaTextoRendaComprovada.Text = string.Empty;
            CaixaTextoMargemConsignavel.Text = string.Empty;
            CaixaTextoOrgaoEmissor.Text = string.Empty;
            CaixaDataDataValidade.Text = string.Empty;
            CaixaTextoDataEmissao.Text = string.Empty;
            DropDownListUnidadeFederacao.SelectedIndex = 0;

            limparTelefone();
            limparContato();
            limparEndereco();
            limparDocumento();//William Moreira da Silva

            ListaPessoa.email = string.Empty;
            ListaPessoa.homePage = string.Empty;
            ListaPessoa.idDocumento = 0;
            ListaPessoa.idEndCobranca = 0;
            ListaPessoa.idEndComercial = 0;
            ListaPessoa.idEndCorresp = 0;
            ListaPessoa.idEndEntrega = 0;
            ListaPessoa.idEndResidencial = 0;
            ListaPessoa.idGrupo = 0;
            ListaPessoa.idModuloRespon = int.MinValue;
            ListaPessoa.idPessoa = 0;
            ListaPessoa.nome = string.Empty;
            ListaPessoa.nomeGrupo = string.Empty;
            ListaPessoa.nomeModulo = string.Empty;
            ListaPessoa.numDocumento = string.Empty;
            ListaPessoa.possuiVinculo = false;
            ListaPessoa.razaoSocial = string.Empty;
            ListaPessoa.tipo = string.Empty;

            ListaPessoa.contatos = null;// new List<Contato>();
            ListaPessoa.enderecos = null;// new List<Endereco>();
            ListaPessoa.documentos = null;// new List<Documento>();
            ListaPessoa.avalista = null;// new Avalistas();
            ListaPessoa.telefones = null;// new List<Telefone>();
            ListaPessoa.telContato = null;

            PreencherGridEndereco(ListaPessoa.enderecos);
            PreencherGridTelefone(ListaPessoa.telefones);
            PreencherGridContato(ListaPessoa.contatos);

            CampoOcultoEvento.Value = string.Empty;
            CampoOcultoEventoTelefone.Value = string.Empty;
            CampoOcultoEventoContato.Value = string.Empty;
            CampoOcultoEventoEndereco.Value = string.Empty;

            //William Moreira da Silva
            alteraTelaFisicaJuridica(false);
            mudaLabelCPFCNPJ(false);
            CampoOcultoFisicaJuridica.Value = "0";
            //William Moreira da Silva

            caixaSelecaoTipoDocumento.SelectedIndex = -1;

            LabelNomeDocumento.Text = "Documento";
            CaixaTextoNumeroDocumento.Visible = true;

            caixaSelecaoTipoDocumento.Visible = true;

            LabelOrgaoEmissor.Visible = true;
            CaixaTextoOrgaoEmissor.Visible = true;

            LabelNomeUnidadeFederacao.Visible = true;
            DropDownListUnidadeFederacao.Visible = true;

            LabelDataEmissao.Visible = true;
            CaixaTextoDataEmissao.Visible = true;

            LabelDataValidade.Visible = true;
            CaixaDataDataValidade.Visible = true;

            recipienteAbaContratoSecundario.Enabled = false;
            CampoOcultoIdPessoa.Value = "";
            Session["idPessoa"] = null;
        }

        //William Moreira da Silva
        private void limparDocumento()
        {
            MultiViewGridEndereco.ActiveViewIndex = 0;
            CaixaTextoNumeroDocumento.Text = "";
            if (ListaPessoa.documentos != null)
            {
                ListaPessoa.documentos.Clear();
            }
            PreencherGridDocumento(ListaPessoa.documentos);
        }

        private void limparEndereco()
        {
            MultiViewGridEndereco.ActiveViewIndex = 0;
            CaixaTextoLocal.SelectedIndex = -1;
            CaixaTextoLogradouro.Text = string.Empty;
            CaixaTextoComplemento.Text = string.Empty;
            CaixaTextoBairro.Text = string.Empty;
            CaixaTextoCep.Text = string.Empty;
            CaixaTextoNumero.Text = string.Empty;
            DropDownListCidade.SelectedIndex = -1;
            DropDownListEstado.SelectedIndex = -1;
            DropDownListPais.SelectedIndex = -1;
            for (int i = 0; i < chkTiposEndereco.Items.Count; ++i)
            {
                chkTiposEndereco.Items[i].Selected = false;
            }
            if (gridEndereco.chavesSelecionadas.Count > 0)
            {
                gridEndereco.apagarSelecao();
            }
        }

        private void limparContato()
        {
            MultiViewContato.ActiveViewIndex = 0;
            CaixaTextoNomeContato.Text = string.Empty;
            CaixaTextoEmailContato.Text = string.Empty;
            CaixaTextoNascimento.Text = string.Empty;
            CaixaTextoCargo.Text = string.Empty;
            CaixaTextoSetor.Text = string.Empty;
            CaixaTextoObservacao.Text = string.Empty;
            DropDownListTelefone.SelectedIndex = -1;
            if (gridContato.chavesSelecionadas.Count > 0)
            {
                gridContato.apagarSelecao();
            }
        }

        private void limparTelefone()
        {
            MultiViewTelefone.ActiveViewIndex = 0;
            CaixaTextoDDI.Text = string.Empty;
            CaixaTextoDDD.Text = string.Empty;
            CaixaTextoNumeroFone.Text = string.Empty;
            DropDownListContato.SelectedIndex = -1;
            for (int i = 0; i < CheckBoxListTipoTelefone.Items.Count; ++i)
            {
                CheckBoxListTipoTelefone.Items[i].Selected = false;
            }
            if (gridTelefone.chavesSelecionadas.Count > 0)
            {
                gridTelefone.apagarSelecao();
            }
        }

        private void travaAlteracao(bool bTravaCampos)
        {
            CaixaTextoNumeroDocumento.Enabled = bTravaCampos;
            CaixaTextoNomeFantasia.Enabled = bTravaCampos;
            CaixaTextoEmail.Enabled = bTravaCampos;
            CaixaTextoHomePage.Enabled = bTravaCampos;
            caixaTextoCPF.Enabled = bTravaCampos;
            CaixaTextoOrgaoEmissor.Enabled = bTravaCampos;
            DropDownListUnidadeFederacao.Enabled = bTravaCampos;
            CaixaTextoDataEmissao.Enabled = bTravaCampos;
            CaixaDataDataValidade.Enabled = bTravaCampos;
        }

        protected void PreencherAbaEndereco(Endereco endSelecionado)
        {
            if (endSelecionado.local.Equals("Filial") || endSelecionado.local.Equals("Filial - Cobrança") || endSelecionado.local.Equals("Matriz") || endSelecionado.local.Equals("Matriz - Cobrança"))
            {
                CaixaTextoLocal.Text = endSelecionado.local;
            }

            CaixaTextoLogradouro.Text = endSelecionado.logradouro;
            CaixaTextoBairro.Text = endSelecionado.bairro;
            CaixaTextoNumero.Text = endSelecionado.numero;
            CaixaTextoComplemento.Text = endSelecionado.complemento;
            CaixaTextoCep.Text = endSelecionado.cep.Replace("-", "");
            CampoOcultoIdEndereco.Value = endSelecionado.idEndereco.ToString();

            if (endSelecionado.cidade.idCidade > 0)
                DropDownListCidade.SelectedValue = Convert.ToString(endSelecionado.cidade.idCidade);
            else
                DropDownListCidade.SelectedIndex = 0;

            if (endSelecionado.uf.idEstado > 0)
                DropDownListEstado.SelectedValue = Convert.ToString(endSelecionado.uf.idEstado);
            else
                DropDownListEstado.SelectedIndex = 0;

            if (endSelecionado.pais.idPais > 0)
                DropDownListPais.SelectedValue = Convert.ToString(endSelecionado.pais.idPais);
            else
                DropDownListPais.SelectedIndex = 0;

            for (int i = 0; i < chkTiposEndereco.Items.Count; ++i)
            {
                if (chkTiposEndereco.Items[i].Text == "Comercial")
                {
                    chkTiposEndereco.Items[i].Selected = endSelecionado.endComercial;
                }
                if (chkTiposEndereco.Items[i].Text == "Residencial")
                {
                    chkTiposEndereco.Items[i].Selected = endSelecionado.endResidencial;
                }
                if (chkTiposEndereco.Items[i].Text == "Entrega")
                {
                    chkTiposEndereco.Items[i].Selected = endSelecionado.endEntrega;
                }
                if (chkTiposEndereco.Items[i].Text == "Cobrança")
                {
                    chkTiposEndereco.Items[i].Selected = endSelecionado.endCobranca;
                }
                if (chkTiposEndereco.Items[i].Text == "Correspondência")
                {
                    chkTiposEndereco.Items[i].Selected = endSelecionado.endCorrespondencia;
                }
            }
        }

        protected void PreencherAbaTelefone(Telefone telSelecionado)
        {
            CampoOcultoIdTelefone.Value = telSelecionado.idTelefone.ToString();

            CaixaTextoDDD.Text = telSelecionado.ddd.ToString();
            CaixaTextoDDI.Text = telSelecionado.ddi.ToString();
            CaixaTextoNumeroFone.Text = telSelecionado.numero.ToString();

            for (int i = 0; i < CheckBoxListTipoTelefone.Items.Count; ++i)
            {
                if (CheckBoxListTipoTelefone.Items[i].Text == "Comercial")
                {
                    CheckBoxListTipoTelefone.Items[i].Selected = ((telSelecionado.tipo.IndexOf("C")) >= 0);
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Celular")
                {
                    CheckBoxListTipoTelefone.Items[i].Selected = ((telSelecionado.tipo.IndexOf("L")) >= 0);
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Fax")
                {
                    CheckBoxListTipoTelefone.Items[i].Selected = ((telSelecionado.tipo.IndexOf("F")) >= 0);
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Recado")
                {
                    CheckBoxListTipoTelefone.Items[i].Selected = ((telSelecionado.tipo.IndexOf("R")) >= 0);
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Particular")
                {
                    CheckBoxListTipoTelefone.Items[i].Selected = ((telSelecionado.tipo.IndexOf("P")) >= 0);
                }
            }

            for (int i = 0; i < ListaPessoa.telefones.Count; i++)
            {
                if (ListaPessoa.telefones[i].idTelefone == telSelecionado.idTelefone && ListaPessoa.telefones[i].idTelContato == telSelecionado.idTelContato)
                {
                    if (ListaPessoa.telefones[i].idContato == 0)
                    {
                        DropDownListContato.SelectedIndex = 0;
                    }
                    else
                    {
                        DropDownListContato.SelectedValue = ListaPessoa.telefones[i].idContato.ToString();
                    }
                }
            }
        }

        protected void PreencherAbaContato(Contato conSelecionado)
        {
            CampoOcultoIdContato.Value = conSelecionado.idContato.ToString();

            CaixaTextoNomeContato.Text = conSelecionado.nome;

            CaixaTextoEmailContato.Text = conSelecionado.email;
            CaixaTextoNascimento.Text = conSelecionado.nascimento.ToString();
            CaixaTextoCargo.Text = conSelecionado.cargo;
            CaixaTextoSetor.Text = conSelecionado.setor;
            CaixaTextoObservacao.Text = conSelecionado.obs;

            for (int i = 0; i < ListaPessoa.contatos.Count; i++)
            {
                if (ListaPessoa.contatos[i].idContato == conSelecionado.idContato && ListaPessoa.contatos[i].idTelContato == conSelecionado.idTelContato)
                {
                    if (ListaPessoa.contatos[i].idTelefone == 0)
                    {
                        DropDownListTelefone.SelectedIndex = 0;
                    }
                    else
                    {
                        DropDownListTelefone.SelectedValue = ListaPessoa.contatos[i].idTelefone.ToString();
                    }
                }
            }
        }


        protected void preencheTelefone_OnActiveViewChanged(object sender, EventArgs e)
        {
            //Preencher a lista de telefones, quando trocar o active view
            if (MultiViewContato.ActiveViewIndex == 1 && ListaPessoa.telefones != null)
            {
                UtilidadesPagina.preencherDropDown(DropDownListTelefone, ListaPessoa.telefones, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "numero", "idTelefone");
            }
            if (MultiViewContato.ActiveViewIndex == 0)
            {
                this.PreencherGridContato(ListaPessoa.contatos);
                this.limparContato();
            }
        }


        protected void preencheContato_OnActiveViewChanged(object sender, EventArgs e)
        {
            //Preencher a lista de telefones, quando trocar o active view
            if (MultiViewTelefone.ActiveViewIndex == 1 && ListaPessoa.contatos != null)
            {
                UtilidadesPagina.preencherDropDown(DropDownListContato, ListaPessoa.contatos, FUNCEF.Planus.GlobalWeb.Web.UI.Utilidades.EnumeradorItemPreenchimento.Selecione, "nome", "idContato");
            }
            if (MultiViewTelefone.ActiveViewIndex == 0)
            {
                this.PreencherGridTelefone(ListaPessoa.telefones);
                this.limparTelefone();
            }
        }

        public void preencherObjetoEndereco(Int32 idPessoa, Int32 idEndereco)
        {
            List<Endereco> listaEndereco = new List<Endereco>();

            Endereco item = new Endereco();

            if (CampoOcultoEventoEndereco.Value.Equals("Inserir"))
            {
                if (ListaPessoa.enderecos != null && ListaPessoa.enderecos.Count > 0)
                {
                    item.idEndereco = ListaPessoa.enderecos.Max(a => a.idEndereco) + 1;
                }
                else
                {
                    item.idEndereco = 1;
                }
            }
            else if (CampoOcultoEventoEndereco.Value.Equals("Alterar"))
            {
                item.idEndereco = Convert.ToInt32(CampoOcultoIdEndereco.Value);
                for (int i = 0; i < ListaPessoa.enderecos.Count; i++)
                {
                    if (ListaPessoa.enderecos[i].idEndereco == item.idEndereco)
                    {
                        item = ListaPessoa.enderecos[i];
                        break;
                    }
                }
            }

            item.idPessoa = idPessoa;
            item.local = CaixaTextoLocal.Text;
            item.bairro = CaixaTextoBairro.Text;
            item.logradouro = CaixaTextoLogradouro.Text;
            item.numero = CaixaTextoNumero.Text;
            item.cep = CaixaTextoCep.Text.Replace("-", "");
            item.complemento = CaixaTextoComplemento.Text;
            if (!String.IsNullOrEmpty(DropDownListCidade.SelectedValue))
            {
                item.cidade = new Cidade()
                {
                    idCidade = Convert.ToInt32(DropDownListCidade.SelectedValue)
                    ,
                    nome = DropDownListCidade.SelectedItem.Text.ToString()
                };
            }
            else
            {
                item.cidade = new Cidade()
                {
                    idCidade = int.MinValue
                };
            }
            if (!String.IsNullOrEmpty(DropDownListEstado.SelectedValue))
            {
                item.uf = new UF()
                {
                    idEstado = Convert.ToInt32(DropDownListEstado.SelectedValue)
                    ,
                    nome = DropDownListEstado.SelectedItem.Text.ToString()
                };
            }
            else
            {
                item.uf = new UF()
                {
                    idEstado = int.MinValue
                };
            }

            if (!String.IsNullOrEmpty(DropDownListPais.SelectedValue))
            {
                item.pais = new Pais()
                {
                    idPais = Convert.ToInt32(DropDownListPais.SelectedValue)
                    ,
                    nome = DropDownListPais.SelectedItem.Text.ToString()
                };
            }
            else
            {
                item.pais = new Pais()
                {
                    idPais = int.MinValue
                };
            }

            item.tipoEndereco = string.Empty;
            for (int i = 0; i < chkTiposEndereco.Items.Count; ++i)
            {
                if (chkTiposEndereco.Items[i].Text == "Comercial")
                {
                    if (chkTiposEndereco.Items[i].Selected)
                    {
                        item.tipoEndereco += "C";
                        item.endComercial = true;
                    }
                }
                if (chkTiposEndereco.Items[i].Text == "Residencial")
                {
                    if (chkTiposEndereco.Items[i].Selected)
                    {
                        item.tipoEndereco += "R";
                        item.endResidencial = true;
                    }
                }
                if (chkTiposEndereco.Items[i].Text == "Entrega")
                {
                    if (chkTiposEndereco.Items[i].Selected)
                    {
                        item.tipoEndereco += "E";
                        item.endEntrega = true;
                    }
                }
                if (chkTiposEndereco.Items[i].Text == "Cobrança")
                {
                    if (chkTiposEndereco.Items[i].Selected)
                    {
                        item.tipoEndereco += "B";
                        item.endCobranca = true;
                    }
                }
                if (chkTiposEndereco.Items[i].Text == "Correspondência")
                {
                    if (chkTiposEndereco.Items[i].Selected)
                    {
                        item.tipoEndereco += "A";
                        item.endCorrespondencia = true;
                    }
                }
            }

            if (CampoOcultoEventoEndereco.Value.Equals("Inserir"))
            {
                item.evento = "Inserir";
                listaEndereco.Add(item);
                if (ListaPessoa.enderecos == null)
                {
                    ListaPessoa.enderecos = new List<Endereco>();
                }

                ListaPessoa.enderecos.Add(item);
            }
            else
            {
                item.evento = "Alterar";
            }
        }

        public void preencherObjetoTelefone(Int32 idEndereco, Int32 idPessoa)
        {
            List<Telefone> listaTelefone = new List<Telefone>();
            Telefone item = new Telefone();

            item.idEndereco = idEndereco;
            item.idPessoa = idPessoa;

            if (CampoOcultoEventoTelefone.Value.Equals("Inserir"))
            {
                if (ListaPessoa.telefones != null && ListaPessoa.telefones.Count > 0)
                {
                    item.idTelefone = ListaPessoa.telefones.Max(a => a.idTelefone) + 1;
                }
                else
                {
                    item.idTelefone = 1;
                }

                if (DropDownListContato.SelectedIndex > 0)
                {
                    item.idContato = Int32.Parse(DropDownListContato.SelectedValue);
                }
                else
                {
                }
            }
            else if (CampoOcultoEventoTelefone.Value.Equals("Alterar"))
            {
                item.idTelefone = Convert.ToInt32(CampoOcultoIdTelefone.Value);
                for (int i = 0; i < ListaPessoa.telefones.Count; i++)
                {
                    if (ListaPessoa.telefones[i].idTelefone == item.idTelefone)
                    {
                        item = ListaPessoa.telefones[i];

                        if (DropDownListContato.SelectedIndex > 0)
                        {
                            if (DropDownListContato.SelectedValue == "")
                            {
                                item.idContato = 0;
                            }
                            else
                            {
                                item.idContato = Int32.Parse(DropDownListContato.SelectedValue);
                            }
                        }
                        break;
                    }
                }
            }

            if (!string.IsNullOrEmpty(CaixaTextoDDI.Text))
            {
                item.ddi = Int32.Parse(CaixaTextoDDI.Text);
            }

            if (!string.IsNullOrEmpty(CaixaTextoDDD.Text))
            {
                item.ddd = Int32.Parse(CaixaTextoDDD.Text);
            }

            if (!string.IsNullOrEmpty(CaixaTextoNumeroFone.Text))
            {
                item.numero = CaixaTextoNumeroFone.Text.ToString();
            }

            item.tipo = string.Empty;

            item.telCelular = item.telComercial = item.telParticular = item.telRecado = item.telFax = string.Empty;

            for (int i = 0; i < CheckBoxListTipoTelefone.Items.Count; ++i)
            {
                if (CheckBoxListTipoTelefone.Items[i].Text == "Comercial")
                {
                    if (CheckBoxListTipoTelefone.Items[i].Selected)
                    {
                        item.tipo += "C";
                        item.telComercial = "Sim";
                    }
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Celular")
                {
                    if (CheckBoxListTipoTelefone.Items[i].Selected)
                    {
                        item.tipo += "L";
                        item.telCelular = "Sim";
                    }
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Fax")
                {
                    if (CheckBoxListTipoTelefone.Items[i].Selected)
                    {
                        item.tipo += "F";
                        item.telFax = "Sim";
                    }
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Recado")
                {
                    if (CheckBoxListTipoTelefone.Items[i].Selected)
                    {
                        item.tipo += "R";
                        item.telRecado = "Sim";
                    }
                }
                if (CheckBoxListTipoTelefone.Items[i].Text == "Particular")
                {
                    if (CheckBoxListTipoTelefone.Items[i].Selected)
                    {
                        item.tipo += "P";
                        item.telParticular = "Sim";
                    }
                }
            }

            if (ListaPessoa.telContato != null && DropDownListContato.SelectedIndex > 0)
            {
                for (int i = 0; i < ListaPessoa.contatos.Count; i++)
                {
                    if (ListaPessoa.contatos[i].idContato == Int32.Parse(DropDownListContato.SelectedValue))
                    {
                        ListaPessoa.contatos[i].telefone = item.numero;
                    }
                }
            }

            if (CampoOcultoEventoTelefone.Value.Equals("Inserir"))
            {
                item.evento = "Inserir";
                listaTelefone.Add(item);
                if (ListaPessoa.telefones == null)
                {
                    ListaPessoa.telefones = new List<Telefone>();
                }
                ListaPessoa.telefones.Add(item);
            }
            else
            {
                item.evento = "Alterar";
            }
        }

        public void preencherObjetoContato(Int32 idEndereco, Int32 idPessoa)
        {
            List<Contato> listaContato = new List<Contato>();
            Contato item = new Contato();

            if (CampoOcultoEventoContato.Value.Equals("Inserir"))
            {
                if (ListaPessoa.contatos != null && ListaPessoa.contatos.Count > 0)
                {
                    item.idContato = ListaPessoa.contatos.Max(a => a.idContato) + 1;
                }
                else
                {
                    item.idContato = 1;
                }

                if (DropDownListTelefone.SelectedIndex > 0)
                {
                    item.idTelefone = Int32.Parse(DropDownListTelefone.SelectedValue);
                    item.telefone = DropDownListTelefone.SelectedItem.Text;
                }
                else
                {
                }
            }
            else if (CampoOcultoEventoContato.Value.Equals("Alterar"))
            {
                item.idContato = Convert.ToInt32(CampoOcultoIdContato.Value);
                for (int i = 0; i < ListaPessoa.contatos.Count; i++)
                {
                    if (ListaPessoa.contatos[i].idContato == item.idContato)
                    {
                        item = ListaPessoa.contatos[i];

                        if (DropDownListTelefone.SelectedIndex > 0)
                        {
                            item.telefone = DropDownListTelefone.SelectedItem.Text;
                            item.idTelefone = Int32.Parse(DropDownListTelefone.SelectedValue);
                        }
                        else
                        {
                            item.idTelefone = 0;
                            item.telefone = "";
                        }
                        break;
                    }
                }

                if (DropDownListTelefone.SelectedIndex > 0)
                {
                }
            }

            item.idEndereco = idEndereco;
            item.idPessoa = idPessoa;
            item.email = CaixaTextoEmailContato.Text;
            item.cargo = CaixaTextoCargo.Text;
            item.setor = CaixaTextoSetor.Text;
            item.obs = CaixaTextoObservacao.Text;
            item.nome = CaixaTextoNomeContato.Text;

            if (!string.IsNullOrEmpty(CaixaTextoNascimento.Text))
            {
                item.nascimento = DateTime.Parse(CaixaTextoNascimento.Text);
            }

            if (CampoOcultoEventoContato.Value.Equals("Inserir"))
            {
                item.evento = "Inserir";
                listaContato.Add(item);
                if (ListaPessoa.contatos == null)
                {
                    ListaPessoa.contatos = new List<Contato>();
                }
                ListaPessoa.contatos.Add(item);
            }
            else
            {
                item.evento = "Alterar";
            }
        }

        public List<Avalistas> preencherObjetoAvalista(Int32 idPessoa)
        {
            List<Avalistas> listaAvalista = new List<Avalistas>();
            Avalistas item = new Avalistas();

            item.id = idPessoa;
            if (!String.IsNullOrEmpty(CaixaTextoMargemConsignavel.Text))
            {
                item.margem = double.Parse(CaixaTextoMargemConsignavel.Text);
            }
            else
            {
                item.margem = 0d;
            };

            if (!String.IsNullOrEmpty(CaixaTextoRendaComprovada.Text))
            {
                item.renda = double.Parse(CaixaTextoRendaComprovada.Text);
            }
            else
            {
                item.renda = 0d;
            };

            item.nome = CaixaTextoOrigemRendimento.Text;

            listaAvalista.Add(item);

            return listaAvalista;
        }

        public List<Pessoa> preencherObjetoPessoa()
        {
            List<Pessoa> listaPessoa = new List<Pessoa>();

            if (CaixaTextoNumeroDocumento.Text.Equals(string.Empty))
            {
                registrarAlerta("Obrigatório informar o número do documento.");
                CaixaTextoNumeroDocumento.Focus();
            }
            else
            {

                if (CampoOcultoFisicaJuridica.Value == "1")
                {
                    ListaPessoa.tipo = "J";
                    ListaPessoa.idDocumento = 2;
                }
                else
                {
                    ListaPessoa.tipo = "F";
                    ListaPessoa.idDocumento = 1;
                }

                ListaPessoa.nome = CaixaTextoNomeFantasia.Text;
                ListaPessoa.razaoSocial = CaixaTextoRazaoSocial.Text;
                ListaPessoa.email = CaixaTextoEmail.Text;
                ListaPessoa.homePage = CaixaTextoHomePage.Text;

                ListaPessoa.numDocumento = caixaTextoCPF.Text.Replace(".", "").Replace("-", "").Replace("/", "").ToString();
                if (!CampoOcultoIdGrupo.Value.Equals(string.Empty))
                {
                    ListaPessoa.idGrupo = Convert.ToInt32(CampoOcultoIdGrupo.Value);
                    ListaPessoa.nomeGrupo = CaixaTextoGrupo.Text;
                }
            }
            return listaPessoa;
        }

        protected void alteraTelaFisicaJuridica(bool fisicaJuridica)
        {
            //Se for pessoa Jurídica
            CaixaTextoNumeroDocumento.Visible = true;

            if (fisicaJuridica)
            {
                LabelNomeFantasia.Text = "Nome Fantasia";
                CaixaTextoEmail.Visible = true;
                CaixaTextoHomePage.Visible = true;
                CaixaTextoGrupo.Visible = true;
                CaixaTextoRazaoSocial.Visible = true;
                LabelGrupo.Visible = true;
                LabelRazaoSocial.Visible = true;
                botaoGrupo.Visible = true;
            }
            else
            {
                LabelNomeFantasia.Text = "Nome";
                CaixaTextoEmail.Visible = true;
                CaixaTextoHomePage.Visible = true;
                CaixaTextoGrupo.Visible = false;
                CaixaTextoRazaoSocial.Visible = false;
                LabelGrupo.Visible = false;
                LabelRazaoSocial.Visible = false;
                botaoGrupo.Visible = false;
            }
        }

        private void PreencherGridEndereco(List<Endereco> endPessoa)
        {
            if (endPessoa != null && endPessoa.Count > 0)
            {
                gridEndereco.DataSource = endPessoa;
            }
            else
            {
                gridEndereco.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
            }

            gridEndereco.DataBind();
        }

        private void PreencherGridContato(List<Contato> contPessoa)
        {
            if (contPessoa != null && contPessoa.Count > 0)
            {
                gridContato.DataSource = contPessoa;
            }
            else
            {
                gridContato.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
            }

            gridContato.DataBind();
        }

        private void PreencherGridTelefone(List<Telefone> telPessoa)
        {
            if (telPessoa != null && telPessoa.Count > 0)
            {
                gridTelefone.DataSource = telPessoa;
            }
            else
            {
                gridTelefone.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
            }

            gridTelefone.DataBind();
        }

        //William Moreira da Silva
        private void PreencherGridDocumento(List<Documento> docPessoa)
        {
            gridDocumento.Visible = true;
            if (docPessoa != null && docPessoa.Count > 0)
            {
                gridDocumento.DataSource = docPessoa;
            }
            else
            {
                gridDocumento.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                gridDocumento.Visible = false;
            }
            gridDocumento.DataBind();
        }
        //William Moreira da Silva

        protected void botaoFisicaJurídica_Click(object sender, EventArgs e)
        {
            limparTela();
            fisicaJuridica = Convert.ToBoolean(Convert.ToInt32(CampoOcultoFisicaJuridica.Value));
            fisicaJuridica = (!fisicaJuridica);
            alteraTelaFisicaJuridica(fisicaJuridica);

            mudaLabelCPFCNPJ(fisicaJuridica);

            caixaSelecaoTipoDocumento.SelectedIndex = 0;
            AlterarCamposTela();
            CampoOcultoFisicaJuridica.Value = Convert.ToString(Convert.ToInt32(fisicaJuridica));
        }

        private void mudaLabelCPFCNPJ(bool fisicaJuridica)
        {
            if (fisicaJuridica)
            {
                carregarComboTipoDocumento("J");
                labelCPFCNPJ.Text = "CNPJ";
                caixaTextoCPF.MaxLength = 18;
            }
            else
            {
                carregarComboTipoDocumento("F");
                labelCPFCNPJ.Text = "CPF";
                caixaTextoCPF.MaxLength = 14;
            }

        }

        protected void botaoIncluirNovoAvalista_Click(object sender, EventArgs e)
        {
            CampoOcultoEvento.Value = "Incluir";
            recipienteAbaContratoSecundario.Enabled = true;
            fisicaJuridica = Convert.ToBoolean(Convert.ToInt32(CampoOcultoFisicaJuridica.Value));
            if (fisicaJuridica)
            {
                carregarComboTipoDocumento("J");
            }
            else
            {
                carregarComboTipoDocumento("F");
            }
            //William Oliveira - Defect Log 199759 - Inicio
            caixaSelecaoTipoDocumento.SelectedIndex = 0;
            AlterarCamposTela();
            //William Oliveira - Defect Log 199759 - Fim

            recipienteAbaContratoSecundario.ActiveTabIndex = 0;
        }

        protected void botaoAlterarNovoAvalista_Click(object sender, EventArgs e)
        {
            if (ListaPessoa.documentos == null || ListaPessoa.documentos.Count <= 0)
            {
                return;
            }

            CampoOcultoEvento.Value = "Alterar";
            recipienteAbaContratoSecundario.Enabled = true;//William Moreira da Silva
            string tipoPessoaAlterar = "";
            if (!string.IsNullOrEmpty(CampoOcultoFisicaJuridica.Value))
            {
                if (CampoOcultoFisicaJuridica.Value == "1")
                {
                    tipoPessoaAlterar = "J";
                }
                else
                {
                    tipoPessoaAlterar = "F";
                }

            }
            carregarComboTipoDocumento(tipoPessoaAlterar);
            alteraTelaFisicaJuridica(CampoOcultoFisicaJuridica.Value.Equals("1"));
            CaixaTextoNumeroDocumento.Text = string.Empty;
            LabelNomeDocumento.Text = "Documento";
            DropDownListUnidadeFederacao.SelectedIndex = 0;
            CaixaTextoOrgaoEmissor.Text = string.Empty;
            CaixaTextoDataEmissao.Text = string.Empty;
            CaixaDataDataValidade.Text = string.Empty;

            recipienteAbaContratoSecundario.ActiveTabIndex = 0;
        }

        protected void botaoExcluirNovoAvalista_Click(object sender, EventArgs e)
        {
            if (recipienteAbaContratoSecundario.Enabled && ListaPessoa != null && ListaPessoa.enderecos != null)
            {
                excluirPessoa();
                registrarAlerta("Registro excluido com sucesso.");
                limparTela();
            }
            else
            {
                registrarAlerta("Por favor, selecione um avalista para exclusão.");
            }
        }

        protected void botaoIncluirEndereco_Click(object sender, EventArgs e)
        {
            recipienteAbaContratoSecundario.Enabled = true;//William Moreira da Silva
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            MultiViewGridEndereco.ActiveViewIndex = 1;
            CampoOcultoEventoEndereco.Value = "Inserir";
            recipienteAbaContratoSecundario.ActiveTabIndex = 1;
        }

        protected void BtnCancelarEndereco_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            MultiViewGridEndereco.ActiveViewIndex = 0;
        }

        protected void botaoAlterarEndereco_Click(object sender, EventArgs e)
        {
            recipienteAbaContratoSecundario.ActiveTabIndex = 1;
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }

            Int32 idEndereco = obterEnderecoSelecionado();

            if (idEndereco > 0)
            {
                MultiViewGridEndereco.ActiveViewIndex = 1;
                CampoOcultoEventoEndereco.Value = "Alterar";

                Endereco endSelecionado = null;
                endSelecionado = ListaPessoa.enderecos.Where(t1 => t1.idEndereco == idEndereco).First();
                endSelecionado.idPessoa = ListaPessoa.idPessoa;
                endSelecionado.evento = "Alterar";
                PreencherAbaEndereco(endSelecionado);
            }
        }

        protected void botaoExcluirEndereco_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            MultiViewGridEndereco.ActiveViewIndex = 0;
            ExcluirEnderecoSelecionado();
            limparEndereco();
        }

        protected void botaoIncluirTelefone_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }

            if (ListaPessoa.enderecos == null || ListaPessoa.enderecos.Count == 0)
            {
                registrarAlerta("Cadastre pelo menos um endereço");
                return;
            }

            CampoOcultoEventoTelefone.Value = "Inserir";
            MultiViewTelefone.ActiveViewIndex = 1;
            recipienteAbaContratoSecundario.ActiveTabIndex = 2;
        }

        protected void BtnCancelarTelefone_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            MultiViewTelefone.ActiveViewIndex = 0;
        }

        protected void botaoAlterarTelefone_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            DataKey dataKey = obterTelefoneSelecionado();

            if (dataKey != null)
            {
                MultiViewTelefone.ActiveViewIndex = 1;
                CampoOcultoEventoTelefone.Value = "Alterar";

                Telefone telSelecionado = null;

                telSelecionado = ListaPessoa.telefones.Where(t1 => t1.idTelefone == (Int32)dataKey.Values["idTelefone"] && t1.idTelContato == (Int32)dataKey.Values["idTelContato"]).First();

                telSelecionado.idPessoa = ListaPessoa.idPessoa;
                telSelecionado.evento = "Alterar";
                PreencherAbaTelefone(telSelecionado);
                recipienteAbaContratoSecundario.ActiveTabIndex = 2;
            }
        }

        public void atualizaGridsTelContato()
        {
            this.PreencherGridContato(ListaPessoa.contatos);
            this.PreencherGridTelefone(ListaPessoa.telefones);
        }

        protected void botaoExcluirTelefone_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            CampoOcultoEventoTelefone.Value = "Alterar";
            MultiViewTelefone.ActiveViewIndex = 0;
            excluirTelefoneSelecionado();
            limparTelefone();
            this.atualizaGridsTelContato();
        }

        protected void botaoIncluirContato_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            if (ListaPessoa.enderecos == null || ListaPessoa.enderecos.Count == 0)
            {
                registrarAlerta("Cadastre pelo menos um endereço");
                return;
            }
            CampoOcultoEventoContato.Value = "Inserir";
            MultiViewContato.ActiveViewIndex = 1;

            recipienteAbaContratoSecundario.ActiveTabIndex = 3;
        }

        protected void BtnCancelarContato_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            MultiViewContato.ActiveViewIndex = 0;
        }

        protected void botaoAlterarContato_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            DataKey dataKey = obterContatoSelecionado();

            if (dataKey != null)
            {
                CampoOcultoEventoContato.Value = "Alterar";
                MultiViewContato.ActiveViewIndex = 1;

                Contato conSelecionado = null;

                conSelecionado = ListaPessoa.contatos.Where(t1 => t1.idContato == (Int32)dataKey.Values["idContato"] && t1.idTelContato == (Int32)dataKey.Values["idTelContato"]).First();
                conSelecionado.idPessoa = ListaPessoa.idPessoa;
                conSelecionado.evento = "Alterar";
                PreencherAbaContato(conSelecionado);

                recipienteAbaContratoSecundario.ActiveTabIndex = 3;
            }
        }

        protected void botaoExcluirContato_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            excluirContatoSelecionado();
            MultiViewContato.ActiveViewIndex = 0;
            limparContato();
            this.atualizaGridsTelContato();
        }

        protected void botaoCalcelar_OnClick(object sender, EventArgs e)
        {
            limparTela();
        }

        protected void BotaoAcaoOkEndereco_Click(object sender, EventArgs e)
        {
            bool bTipoEndereco = false;

            for (int i = 0; i < chkTiposEndereco.Items.Count; i++)
            {
                if (chkTiposEndereco.Items[i].Selected == true)
                {
                    bTipoEndereco = true;
                    break;
                }
            }

            if (CaixaTextoLocal.Text == string.Empty)
            {
                registrarAlerta("Selecione um local");
            }
            else if (!bTipoEndereco)
            {
                registrarAlerta("Selecione pelo menos um tipo de endereço");
            }
            else
            {
                Pessoa pessoa = ListaPessoa;
                List<Endereco> enderecoPessoa = ListaPessoa.enderecos;
                preencherObjetoEndereco(pessoa.idPessoa, 0);
                PreencherGridEndereco(ListaPessoa.enderecos);
                MultiViewGridEndereco.ActiveViewIndex = 0;
                limparEndereco();
            }
        }

        protected void BotaoAcaoOkContato_Click(object sender, EventArgs e)
        {
            Pessoa pessoa = ListaPessoa;
            List<Contato> contatoPessoa = ListaPessoa.contatos;
            preencherObjetoContato(pessoa.enderecos[0].idEndereco, pessoa.idPessoa);
            PreencherGridContato(ListaPessoa.contatos);
            MultiViewContato.ActiveViewIndex = 0;
            limparContato();
        }

        protected void BotaoAcaoOkTelefone_Click(object sender, EventArgs e)
        {
            bool bTipoTelefone = false;

            for (int i = 0; i < CheckBoxListTipoTelefone.Items.Count; ++i)
            {
                if (CheckBoxListTipoTelefone.Items[i].Selected == true)
                {
                    bTipoTelefone = true;
                    break;
                }
            }

            if (CaixaTextoNumeroFone.Text == string.Empty)
            {
                registrarAlerta("Favor inserir um número de telefone.");
            }
            else if (!bTipoTelefone)
            {
                registrarAlerta("Favor selecionar o tipo de telefone.");
            }
            else
            {
                Pessoa pessoa = ListaPessoa;
                List<Telefone> telefonePessoa = ListaPessoa.telefones;
                preencherObjetoTelefone(pessoa.enderecos[0].idEndereco, pessoa.idPessoa);
                PreencherGridTelefone(ListaPessoa.telefones);
                PreencherGridContato(ListaPessoa.contatos);
                MultiViewTelefone.ActiveViewIndex = 0;
                limparTelefone();
            }
        }

        protected void botaoOK_OnClick(object sender, EventArgs e)
        {
            bool rg = false;
            if (string.IsNullOrEmpty(CampoOcultoEvento.Value))
            {
                return;
            }
            MultiViewTelefone.ActiveViewIndex = 0;
            MultiViewContato.ActiveViewIndex = 0;
            MultiViewGridEndereco.ActiveViewIndex = 0;

            if (ListaPessoa.documentos == null || ListaPessoa.documentos.Count <= 0)
            {
                registrarAlerta("É obrigatório informar pelo menos um documento.");
                return;
            }

            for (int i = 0; i < ListaPessoa.documentos.Count; i++)
            {
                if (ListaPessoa.documentos[i].nome.Equals("Carteira de Identidade"))
                {
                    rg = true;
                    break;
                }
            }

            if (!rg)
            {
                registrarAlerta("O número do RG é obrigatório.");
                return;
            }

            if (String.IsNullOrEmpty(CaixaTextoNomeFantasia.Text))
            {
                registrarAlerta("O campo Nome é obrigatório.");
                return;
            }

            if (String.IsNullOrEmpty(CaixaTextoOrigemRendimento.Text))
            {
                registrarAlerta("O campo Origem de Rendimento é obrigatório.");
                return;
            }

            if (String.IsNullOrEmpty(CaixaTextoRendaComprovada.Text))
            {
                registrarAlerta("O campo Renda Comprovada é obrigatório.");
                return;
            }

            if (String.IsNullOrEmpty(CaixaTextoMargemConsignavel.Text))
            {
                registrarAlerta("O campo Margem Consignável é obrigatório.");
                return;
            }

            ListaPessoa.numDocumento = caixaTextoCPF.Text.Replace(".", "").Replace("-", "").Replace("/", "").ToString();
            ListaPessoa.nome = CaixaTextoNomeFantasia.Text;

            if (CampoOcultoEvento.Value == "Incluir")
            {
                if (ListaPessoa.enderecos == null || ListaPessoa.enderecos.Count == 0)
                {
                    registrarAlerta("Cadastre pelo menos um endereço.");
                    return;
                }

                // insert na pessoa
                Pessoa pessoa = ListaPessoa;
                List<Pessoa> listapessoa = new List<Pessoa>();
                listapessoa.Add(pessoa);
                Int32 idPessoaInserido = 0;
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    if (!CampoOcultoIdGrupo.Value.Equals(string.Empty))
                    {
                        listapessoa[0].idGrupo = Convert.ToInt32(CampoOcultoIdGrupo.Value);
                    }

                    idPessoaInserido = cliente.contrato.incluirPessoa(listapessoa);

                    cliente.contrato.alterarDocPessoa(ListaPessoa.documentos, idPessoaInserido);
                }

                // insert no endereco
                List<Endereco> enderecoPessoa = ListaPessoa.enderecos;
                Int32 idEnderecoInserido = 0;
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    for (int i = 0; i < ListaPessoa.enderecos.Count; i++)
                    {
                        Endereco endAux = new Endereco();
                        ListaPessoa.enderecos[i].idEndereco = 0;

                        string sTipoEndereco = ListaPessoa.enderecos[i].tipoEndereco.ToString();

                        ListaPessoa.enderecos[i].tipoEndereco = string.Empty;

                        ListaPessoa.enderecos[i].idPessoa = idPessoaInserido;
                        idEnderecoInserido = cliente.contrato.IncluirEndereco(ListaPessoa.enderecos[i]);

                        if (sTipoEndereco.IndexOf("C") >= 0)
                        {
                            listapessoa[0].idEndComercial = idEnderecoInserido;
                        }
                        if (sTipoEndereco.IndexOf("R") >= 0)
                        {
                            listapessoa[0].idEndResidencial = idEnderecoInserido;
                        }
                        if (sTipoEndereco.IndexOf("E") >= 0)
                        {
                            listapessoa[0].idEndEntrega = idEnderecoInserido;
                        }
                        if (sTipoEndereco.IndexOf("B") >= 0)
                        {
                            listapessoa[0].idEndCobranca = idEnderecoInserido;
                        }
                        if (sTipoEndereco.IndexOf("A") >= 0)
                        {
                            listapessoa[0].idEndCorresp = idEnderecoInserido;
                        }

                        listapessoa[0].idPessoa = idPessoaInserido;

                        cliente.contrato.alterarPessoa(listapessoa);
                    }
                }

                if ((ListaPessoa.contatos != null && ListaPessoa.contatos.Count > 0) || (ListaPessoa.telefones != null && ListaPessoa.telefones.Count > 0))
                {
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        cliente.contrato.incluirTelefoneContato(ListaPessoa.telefones, ListaPessoa.contatos, idEnderecoInserido);
                    }
                }

                // insert no avalista
                List<Avalistas> avalista = new List<Avalistas>();
                avalista = preencherObjetoAvalista(idPessoaInserido);
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    cliente.contrato.incluirNovoAvalista(avalista);
                }

                registrarAlerta("Registro incluido com sucesso");
                limparTela();
            }
            else if (CampoOcultoEvento.Value == "Alterar")
            {
                Int32 idPessoaAlterar = 0;
                if (!string.IsNullOrEmpty(CampoOcultoIdPessoa.Value))
                {
                    idPessoaAlterar = Convert.ToInt32(CampoOcultoIdPessoa.Value);
                }

                // alterar a pessoa
                List<Pessoa> pessoa = new List<Pessoa>();
                pessoa.Add(ListaPessoa);
                //---------------------------------

                if (CampoOcultoEventoEndereco.Value == "Inserir")
                {
                    // insert no endereco
                    List<Endereco> enderecoPessoa = ListaPessoa.enderecos.Where(t1 => t1.evento == "Inserir").ToList(); ;
                    Int32 idEnderecoInserido = 0;
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        for (int i = 0; i < enderecoPessoa.Count; i++)
                        {
                            enderecoPessoa[i].idEndereco = 0;

                            Endereco endAux = new Endereco();

                            string sTipoEndereco = enderecoPessoa[i].tipoEndereco.ToString();

                            enderecoPessoa[i].tipoEndereco = string.Empty;

                            idEnderecoInserido = cliente.contrato.IncluirEndereco(enderecoPessoa[i]);

                            if (sTipoEndereco.IndexOf("C") >= 0)
                            {
                                pessoa[0].idEndComercial = idEnderecoInserido;
                            }
                            if (sTipoEndereco.IndexOf("R") >= 0)
                            {
                                pessoa[0].idEndResidencial = idEnderecoInserido;
                            }
                            if (sTipoEndereco.IndexOf("E") >= 0)
                            {
                                pessoa[0].idEndEntrega = idEnderecoInserido;
                            }
                            if (sTipoEndereco.IndexOf("B") >= 0)
                            {
                                pessoa[0].idEndCobranca = idEnderecoInserido;
                            }
                            if (sTipoEndereco.IndexOf("A") >= 0)
                            {
                                pessoa[0].idEndCorresp = idEnderecoInserido;
                            }

                            pessoa[0].idPessoa = idPessoaAlterar;

                            cliente.contrato.alterarPessoa(pessoa);
                        }
                    }
                }
                else
                {
                    // update o endereco
                    List<Endereco> enderecoPessoa = ListaPessoa.enderecos.Where(t1 => t1.evento == "Alterar").ToList(); ;
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        for (int i = 0; i < enderecoPessoa.Count; i++)
                        {
                            Endereco endAux = new Endereco();

                            string sTipoEndereco = enderecoPessoa[i].tipoEndereco.ToString();

                            enderecoPessoa[i].tipoEndereco = string.Empty;

                            cliente.contrato.alterarEndereco(enderecoPessoa[i]);

                            //Removo todas as associações anteriores
                            pessoa[0].idEndComercial = int.MinValue;
                            pessoa[0].idEndResidencial = int.MinValue;
                            pessoa[0].idEndEntrega = int.MinValue;
                            pessoa[0].idEndCobranca = int.MinValue;
                            pessoa[0].idEndCorresp = int.MinValue;

                            cliente.contrato.alterarPessoa(pessoa);

                            //Refaço as associações


                            if (sTipoEndereco.IndexOf("C") >= 0)
                            {
                                pessoa[0].idEndComercial = enderecoPessoa[i].idEndereco;
                            }
                            if (sTipoEndereco.IndexOf("R") >= 0)
                            {
                                pessoa[0].idEndResidencial = enderecoPessoa[i].idEndereco;
                            }
                            if (sTipoEndereco.IndexOf("E") >= 0)
                            {
                                pessoa[0].idEndEntrega = enderecoPessoa[i].idEndereco;
                            }
                            if (sTipoEndereco.IndexOf("B") >= 0)
                            {
                                pessoa[0].idEndCobranca = enderecoPessoa[i].idEndereco;
                            }
                            if (sTipoEndereco.IndexOf("A") >= 0)
                            {
                                pessoa[0].idEndCorresp = enderecoPessoa[i].idEndereco;
                            }

                            pessoa[0].idPessoa = idPessoaAlterar;

                            cliente.contrato.alterarPessoa(pessoa);
                        }
                    }
                }

                bool jaInserido = false;
                if (CampoOcultoEventoTelefone.Value == "Inserir" && CampoOcultoEventoContato.Value == "Inserir")
                {
                    List<Telefone> telefonePessoa = ListaPessoa.telefones.Where(t1 => t1.evento == "Inserir").ToList();
                    List<Contato> contatoPessoa = ListaPessoa.contatos.Where(t1 => t1.evento == "Inserir").ToList();
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        cliente.contrato.incluirTelefoneContato(telefonePessoa, contatoPessoa, ListaPessoa.enderecos[0].idEndereco);

                    }
                    jaInserido = true;
                }

                if (CampoOcultoEventoTelefone.Value == "Inserir")
                {
                    if (!jaInserido)
                    {
                        using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                        {
                            List<Telefone> telefones = ListaPessoa.telefones.Where(t1 => t1.evento == "Inserir").ToList();
                            if (telefones != null && telefones.Count > 0)
                            {
                                cliente.contrato.incluirTelefoneContato(telefones, null, telefones[0].idEndereco);
                            }
                        }
                    }
                }
                else
                {
                    // update no telefone
                    List<Telefone> telefonePessoa = ListaPessoa.telefones.Where(t1 => t1.evento == "Alterar").ToList();
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        for (int i = 0; i < ListaPessoa.telefones.Count; i++)
                        {
                            cliente.contrato.alterarTelefone(ListaPessoa.telefones[i]);
                        }
                    }
                }

                if (CampoOcultoEventoContato.Value == "Inserir")
                {

                    if (!jaInserido)
                    {
                        using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                        {
                            List<Contato> contatos = ListaPessoa.contatos.Where(t1 => t1.evento == "Inserir").ToList();
                            if (contatos != null && contatos.Count > 0)
                            {
                                cliente.contrato.incluirTelefoneContato(null, contatos, contatos[0].idEndereco);
                            }
                        }
                    }
                }
                else
                {
                    // update no contatos
                    List<Contato> contatoPessoa = ListaPessoa.contatos.Where(t1 => t1.evento == "Alterar").ToList();
                    using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                    {
                        for (int i = 0; i < ListaPessoa.contatos.Count; i++)
                        {
                            cliente.contrato.alterarContato(ListaPessoa.contatos[i]);
                        }
                    }
                }

                // alterar o avalista
                List<Avalistas> avalista = new List<Avalistas>();
                avalista = preencherObjetoAvalista(idPessoaAlterar);
                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    cliente.contrato.alterarNovoAvalista(avalista);
                }

                using (Cliente<IServicoConcessao> cliente = new Cliente<IServicoConcessao>())
                {
                    if (!CampoOcultoIdGrupo.Value.Equals(string.Empty))
                    {
                        pessoa[0].idGrupo = Convert.ToInt32(CampoOcultoIdGrupo.Value);
                    }
                    cliente.contrato.alterarPessoa(pessoa);

                    for (int i = 0; i < ListaPessoa.documentos.Count; i++)
                    {
                        cliente.contrato.alterarDocPessoa(ListaPessoa.documentos, idPessoaAlterar);
                    }
                }

                registrarAlerta("Registro alterado com sucesso");
                limparTela();
            }
        }

        /// <summary>
        /// Metodo para preencher o objeto TelContato, o qual indica quais contatos fazem parte de quais telefones.
        /// </summary>
        /// <param name="operacao"></param>
        /// <param name="idTelefone"></param>
        /// <param name="idContato"></param>
        public void preencherObjetoTelContato(int operacao, int idTelefone, int idContato)
        {
            TelContato telcontato = new TelContato();
            if (operacao == 0) //Inserção
            {
                telcontato.idContato = idContato;
                telcontato.idTelefone = idTelefone;

                if (ListaPessoa.telContato == null)
                {
                    ListaPessoa.telContato = new List<TelContato>();
                }

                ListaPessoa.telContato.Add(telcontato);
            }
            if (operacao == 1)//Alteração
            {
                for (int i = 0; i < ListaPessoa.telContato.Count; i++)
                {
                    for (int j = 0; j < ListaPessoa.telContato.Count; j++)
                    {

                    }
                }
            }
        }

        #endregion

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
    }
}