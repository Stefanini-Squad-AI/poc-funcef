using FUNCEF.Planus.Componentes.Web;
using FUNCEF.Planus.GlobalWeb.Web.IU;
using FUNCEF.Planus.WebEmprestimo.Servicos;
using FUNCEF.Planus.WebEmprestimo.Web.Componentes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Transactions;

namespace FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Serasa
{
    /// <summary>
    /// Representa a página de listagem mutuarios.
    /// </summary>
    public partial class Listagem : PaginaSeguraComEstado
    {
        /// <summary>
        /// Inicializa a página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Init(object sender, EventArgs e)
        {
            this.atualizarEstado += new EventHandler(botaoProcurar_Click);
        }

        /// <summary>
        /// Efetua o carregamento da página.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridContrato.EmptyDataText = MensagensAplicacao.instancia.mensagem007;
                try
                {
                    string usuarioLogado = this.contextoSistema.usuarioAtual.nomeCompleto.ToUpper();
                    txtNomeResposavel.Text = usuarioLogado;

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {
                       txtNumRemessa.Text = cliente.contrato.ObterNumeroRemessaArquivo().ToString();
                    }                   
                }
                catch
                {                   
                }
                if (txtNumRemessa.Text == "0")
                    txtNumRemessa.Enabled = true;
                
            }   
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoProcurar_Click(object sender, EventArgs e)
        {
            gridContrato.DataSourceID = dataSourceContrato.ID;
        }

        /// <summary>
        /// Evento de clique do botão.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos.</param>
        protected void botaoLimpar_Click(object sender, EventArgs e)
        {
            txtDataInicial.Text = String.Empty;
            //txtDataFinal.Text = String.Empty;

            txtNumRemessa.Text = String.Empty;
            txtNomeResposavel.Text = String.Empty;
            txtLogonSerasa.Text = String.Empty;
            txtNumTelefone.Text = String.Empty;
            txtNomeResposavel.Text = String.Empty;

            gridContrato.limpar();
        }

        /// <summary>
        /// Evento de pesquisa do DataSource.
        /// </summary>
        /// <param name="sender">Disparador da ação.</param>
        /// <param name="e">Argumentos da ação.</param>
        protected void dataSourceContrato_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //Verifica quais parametros usar.
            tratarFiltros(ref e);
        }

        #region Contexto da Página / Permissões

        /// <summary>
        /// Identifica o contexto desta página.
        /// </summary>
        public override string identificacaoContexto
        {
            get
            {
                return IdentificacaoContexto.contrato;
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


        public void GerarArquivoSerasa_Click(object sender, EventArgs e)
        {
            try
            {
                if (VerificarPreenchimentoCampos())
                {
                    FUNCEF.Planus.WebEmprestimo.Tipos.Serasa dados = new FUNCEF.Planus.WebEmprestimo.Tipos.Serasa();
                    dados.DataEventoCobranca = Convert.ToDateTime(txtDataInicial.Text);       
                    dados.NumRemessa = txtNumRemessa.Text;
                    dados.NomeResponsavel = txtNomeResposavel.Text;
                    dados.TelefoneResponsavel = txtNumTelefone.Text;
                    dados.LogonSerasa = txtLogonSerasa.Text;

                    using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                    {                        
                        GerarArquivoInclusaoSerasa(dados);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "YourUniqueScriptKey", "alert('" + ex.Message + "');", true);
            }
        }

        #region Metodo original
        //public void GerarArquivoInclusaoSerasa(Tipos.Serasa DadosEntrada)
        //    {
        //    //List<Tipos.Serasa> listaInadimplencia = new List<Tipos.Serasa>(); 
        //    string caminhoArquivo = string.Empty;
        //    int i = 1;

        //    try
        //    {
        //        caminhoArquivo = ConfigurationSettings.AppSettings["CaminhoArquivoInclusaoSerasa"];               
        //        string nomeArquivo = DateTime.Now.Date.ToString("yyyyMMdd") + "_" + DateTime.Now.ToString("hhmmss") + "-R" + DadosEntrada.NumRemessa.PadLeft(5, '0') + ".txt";
        //        StreamWriter writer;
        //        try
        //        {
        //            writer = new StreamWriter(caminhoArquivo + nomeArquivo, true, System.Text.Encoding.Default);
        //        }
        //        catch (Exception ex)
        //        {                    
        //            throw new Exception("Não foi possível criar o arquivo no caminho: " + caminhoArquivo + ". Descrição: " + ex.Message);
        //        }

        //        caminhoArquivo = caminhoArquivo + nomeArquivo;

        //        using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
        //        {
        //            List<Tipos.Serasa> lista = cliente.contrato.BuscarContratosInclusaoSerasa(Convert.ToInt32(DadosEntrada.NumRemessa), DadosEntrada.NomeResponsavel, DadosEntrada.DataEventoCobranca);
        //            if (lista.Count > 0)
        //            {
        //                //SIG 133533 - Comentado bloco abaixo
        //                //if (lista.Count > 1)
        //                //{
        //                //    Tipos.Serasa UltimoRegistroLista = lista.LastOrDefault();                     
        //                //    Tipos.Serasa PenultimoRegistroLista = lista[lista.Count-2];
        //                //    Tipos.Serasa AntePenultimoRegistroLista = lista[lista.Count - 3];
        //                //    Tipos.Serasa AnteAntePenultimoRegistroLista = lista[lista.Count - 4];

        //                //    //Deve-se garantir que os registros do mesmo mutuário mantenham-se no mesmo arquivo...
        //                //    if (AntePenultimoRegistroLista.NumCPF.Trim() == PenultimoRegistroLista.NumCPF.Trim())
        //                //    {
        //                //        if (UltimoRegistroLista.NumCPF.Trim() != PenultimoRegistroLista.NumCPF.Trim())
        //                //        {
        //                //            lista.Remove(UltimoRegistroLista);
        //                //        }         
        //                //    }
        //                //    else 
        //                //    {
        //                //        if (UltimoRegistroLista.NumCPF.Trim() != PenultimoRegistroLista.NumCPF.Trim())
        //                //        {
        //                //            lista.Remove(UltimoRegistroLista);
        //                //        }
        //                //        else //2 últimos resgistros para o mesmo CPF. Pode haver 3 registros para o cpf ficando o 3º registro no próximo arquivo.
        //                //        {
        //                //            lista.Remove(UltimoRegistroLista);
        //                //            lista.Remove(PenultimoRegistroLista);
        //                //        }
        //                //    }     
        //                //} 

        //                string NumeroCPFAnterior = string.Empty;
        //                var UltimoResgistro = lista.LastOrDefault();
        //                foreach (var item in lista)
        //                {
        //                    //WO23253 - Retirada condição que limitava o número de registros devido limitação do SERASA - lista.Count == 990
        //                    //SIG 133533 - Inclusão do bloco abaixo                            
        //                    //if (i >= (lista.Count - 6) && NumeroCPFAnterior != item.NumCPF.Trim() && !string.IsNullOrEmpty(NumeroCPFAnterior))                           
        //                    //{
        //                    //    break;
        //                    //}

        //                    if (i == 1)
        //                    {
        //                        //Adiciona header arquivo...
        //                        string linhaHeader = MontaHeaderArquivoSerasa(DadosEntrada);
        //                        //Escrevendo no arquivo...
        //                        writer.WriteLine(linhaHeader);
        //                    }

        //                    i++;
        //                    //escreve linha no body do txt...
        //                    string linhaBody = MontaLinhaBodyArquivoSerasa(item, i);
        //                    writer.WriteLine(linhaBody);

        //                    //Registra a data em que o contrato foi incluído no arquivo
        //                    cliente.contrato.GravarDataGeracaoArquivoSerasa(Convert.ToInt64(item.NumeroContrato), Convert.ToInt32(DadosEntrada.NumRemessa), item.IdEventoCobranca);
        //                    //SIG 133533 - inclusão da linha abaixo
        //                    NumeroCPFAnterior = item.NumCPF.Trim();
        //                }

        //                //escreve trailer no txt...
        //                writer.WriteLine(MontaTrailerArquivoSerasa(i + 1));
        //                writer.Close();

        //                confirmarOperacao("Arquivo gerado com sucesso. \r\n ( " + caminhoArquivo + " )", ResolveUrl("~/Paginas/Tratamentos/Serasa/Listagem.aspx"));
        //            }
        //            else
        //            {                       
        //                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "Alerta", "alert('Não foram localizados contratos inadimplentes para gerar o arquivo.');", true);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        //if (ex.Message != "O thread estava sendo anulado.")
        //        //{
        //        //    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Erro", "alert('" + ex.Message + "');", true);             
        //        //}
        //        throw ex;
        //    }

        //}
        #endregion
        public void GerarArquivoInclusaoSerasa_v1(Tipos.Serasa DadosEntrada)
        {
            //List<Tipos.Serasa> listaInadimplencia = new List<Tipos.Serasa>(); 
            string caminhoArquivo = string.Empty;
            string caminhoCompleto = string.Empty;
            int i = 1;

            try
            {
                caminhoArquivo = ConfigurationSettings.AppSettings["CaminhoArquivoInclusaoSerasa"];

                if (string.IsNullOrWhiteSpace(caminhoArquivo))
                    throw new Exception("Caminho do arquivo não configurado.");

                string nomeArquivo = DateTime.Now.Date.ToString("yyyyMMdd") + "_" + DateTime.Now.ToString("hhmmss") + "-R" + DadosEntrada.NumRemessa.PadLeft(5, '0') + ".txt";

                caminhoCompleto = Path.Combine(caminhoArquivo, nomeArquivo);

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    List<Tipos.Serasa> lista =
                        cliente.contrato.BuscarContratosInclusaoSerasa(Convert.ToInt32(DadosEntrada.NumRemessa),
                                                                       DadosEntrada.NomeResponsavel,
                                                                       DadosEntrada.DataEventoCobranca);

                    if (lista == null || lista.Count == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page,
                                                                this.Page.GetType(),
                                                                "Alerta",
                                                                "alert('Não foram localizados contratos inadimplentes para gerar o arquivo.');",
                                                                true);

                        return;
                    }

                    // 🔒 Abre writer com using (garante fechamento mesmo com erro)
                    using (StreamWriter writer = new StreamWriter(caminhoCompleto, false, Encoding.Default))
                    {
                        string NumeroCPFAnterior = string.Empty;
                        var UltimoResgistro = lista.LastOrDefault();

                        foreach (var item in lista)
                        {
                            if (i == 1)
                            {
                                //Adiciona header arquivo...
                                string linhaHeader = MontaHeaderArquivoSerasa(DadosEntrada);
                                writer.WriteLine(linhaHeader);
                            }

                            i++;

                            //escreve linha no body do txt...
                            string linhaBody = MontaLinhaBodyArquivoSerasa(item, i);
                            writer.WriteLine(linhaBody);

                            //Registra a data em que o contrato foi incluído no arquivo
                            cliente.contrato.GravarDataGeracaoArquivoSerasa(Convert.ToDecimal(item.NumeroContrato),
                                                                            Convert.ToInt32(DadosEntrada.NumRemessa),
                                                                            item.IdEventoCobranca);

                            NumeroCPFAnterior = item.NumCPF?.Trim();
                        }

                        //escreve trailer no txt...
                        writer.WriteLine(MontaTrailerArquivoSerasa(i + 1));
                    }

                    confirmarOperacao("Arquivo gerado com sucesso. \r\n ( " + caminhoCompleto + " )", ResolveUrl("~/Paginas/Tratamentos/Serasa/Listagem.aspx"));
                }
            }
            catch (Exception ex)
            {
                // remove arquivo parcialmente gerado
                if (!string.IsNullOrEmpty(caminhoCompleto) && File.Exists(caminhoCompleto))
                    File.Delete(caminhoCompleto);

                ScriptManager.RegisterClientScriptBlock(
                    this.Page,
                    this.Page.GetType(),
                    "Erro",
                    "alert('" + ex.Message.Replace("'", "") + "');",
                    true);

                throw; // mantém stack original
            }
        }

        public void GerarArquivoInclusaoSerasa(Tipos.Serasa DadosEntrada)
        {
            //List<Tipos.Serasa> listaInadimplencia = new List<Tipos.Serasa>(); 
            string caminhoArquivo = string.Empty;
            string caminhoCompleto = string.Empty;
            int i = 1;

            try
            {
                caminhoArquivo = ConfigurationSettings.AppSettings["CaminhoArquivoInclusaoSerasa"];

                if (string.IsNullOrWhiteSpace(caminhoArquivo))
                    throw new Exception("Caminho do arquivo não configurado.");

                string nomeArquivo = DateTime.Now.Date.ToString("yyyyMMdd") + "_" + DateTime.Now.ToString("hhmmss") + "-R" + DadosEntrada.NumRemessa.PadLeft(5, '0') + ".txt";

                caminhoCompleto = Path.Combine(caminhoArquivo, nomeArquivo);

                using (Cliente<IServicoContrato> cliente = new Cliente<IServicoContrato>())
                {
                    List<Tipos.Serasa> lista = cliente.contrato.BuscarContratosInclusaoSerasa(Convert.ToInt32(DadosEntrada.NumRemessa),
                                                                                              DadosEntrada.NomeResponsavel,
                                                                                              DadosEntrada.DataEventoCobranca);

                    if (lista == null || lista.Count == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page,
                                                                this.Page.GetType(),
                                                                "Alerta",
                                                                "alert('Não foram localizados contratos inadimplentes para gerar o arquivo.');",
                                                                true);

                        return;
                    }

                    // =========================
                    // 📄 GERA ARQUIVO APÓS COMMIT
                    // =========================
                    using (StreamWriter writer =  new StreamWriter(caminhoCompleto, false, Encoding.Default))
                    {
                        string NumeroCPFAnterior = string.Empty;
                        var UltimoResgistro = lista.LastOrDefault();

                        foreach (var item in lista)
                        {
                            if (i == 1)
                            {
                                //Adiciona header arquivo...
                                string linhaHeader = MontaHeaderArquivoSerasa(DadosEntrada);
                                writer.WriteLine(linhaHeader);
                            }

                            i++;

                            //escreve linha no body do txt...
                            string linhaBody = MontaLinhaBodyArquivoSerasa(item, i);
                            writer.WriteLine(linhaBody);

                            NumeroCPFAnterior = item.NumCPF?.Trim();
                        }

                        //escreve trailer no txt...
                        writer.WriteLine(MontaTrailerArquivoSerasa(i + 1));
                    }

                    //List<decimal> contratos = lista.Select(x => Convert.ToDecimal(x.NumeroContrato)).Distinct().ToList();
                    //cliente.contrato.AtualizarDataArquivoEmLote(contratos, Convert.ToInt32(DadosEntrada.NumRemessa));

                    var contratos = lista
                                        .Select(x => Convert.ToDecimal(x.NumeroContrato))
                                        .Distinct()
                                        .ToList();                   
                  
                     cliente.contrato.AtualizarDataArquivoEmLote(contratos, Convert.ToInt32(DadosEntrada.NumRemessa), DadosEntrada.DataEventoCobranca);
                   

                    // 🔒 TRANSAÇÃO NO BANCO
                    // =========================
                    //using (var scope = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions  {IsolationLevel = System.Transactions.IsolationLevel.ReadCommitted}))
                    //{
                    //    foreach (var item in lista)
                    //    {
                    //        //Registra a data em que o contrato foi incluído no arquivo
                    //        cliente.contrato.GravarDataGeracaoArquivoSerasa(Convert.ToInt64(item.NumeroContrato),
                    //                                                        Convert.ToInt32(DadosEntrada.NumRemessa),
                    //                                                        item.IdEventoCobranca);
                    //    }

                    //    // Se chegou aqui, nenhuma exceção ocorreu
                    //    scope.Complete();
                    //}

                    confirmarOperacao("Arquivo gerado com sucesso. \r\n ( " + caminhoCompleto + " )", ResolveUrl("~/Paginas/Tratamentos/Serasa/Listagem.aspx"));
                }
            }
            catch (Exception ex)
            {
                // remove arquivo parcialmente gerado (se existir)
                if (!string.IsNullOrEmpty(caminhoCompleto) && File.Exists(caminhoCompleto))
                    File.Delete(caminhoCompleto);

                ScriptManager.RegisterClientScriptBlock(
                    this.Page,
                    this.Page.GetType(),
                    "Erro",
                    "alert('" + ex.Message.Replace("'", "") + "');",
                    true);

                throw; // mantém stack original
            }
        }



        private string MontaHeaderArquivoSerasa(Tipos.Serasa DadosEntrada)
        {
            Tipos.Serasa header = new Tipos.Serasa();
            string campo1 = "0";
            string campo2 = "000436923";
            string dataGeracao = DateTime.Now.Date.ToString("yyyyMMdd");
            string dddResponsavel = "0061";
            string telefoneResponsavel = DadosEntrada.TelefoneResponsavel;
            string campo6 = "2072";
            string nomeResponsavel = DadosEntrada.NomeResponsavel.PadRight(70, ' ');
            string convenioSerasa = "SERASA-CONVEM04";
            string numRemessa = DadosEntrada.NumRemessa.PadLeft(6, '0');
            string campo10 = "E";
            string campo11 = string.Empty.PadRight(4, ' ');
            string campo12 = string.Empty.PadRight(3, ' ');
            string numLogon = DadosEntrada.LogonSerasa.ToString();
            string campo14 = string.Empty.PadRight(392, ' ');
            string campo15 = string.Empty.PadRight(60, ' ');
            string sequencial = "1".PadLeft(7, '0');

            string linhaHeader = campo1 + campo2 + dataGeracao + dddResponsavel + telefoneResponsavel +
                                 campo6 + nomeResponsavel + convenioSerasa + numRemessa + campo10 +
                                 campo11 + campo12 + numLogon + campo14 + campo15 +
                                 sequencial;
            return linhaHeader;
        }

        private string MontaLinhaBodyArquivoSerasa(Tipos.Serasa DadosInadimplencia, int Sequencial)
        {
            List<Tipos.Serasa> lista = new List<Tipos.Serasa>();
            string linhaBody = string.Empty;
            string dataNascParticipante = string.IsNullOrEmpty(DadosInadimplencia.DataNascimento) ? string.Empty : Convert.ToDateTime(DadosInadimplencia.DataNascimento).ToString("yyyyMMdd");
             
            string nomeParticipante = DadosInadimplencia.NomeParticipante.ToUpper().PadRight(70, ' ');
            string numCPF = DadosInadimplencia.NumCPF.TrimEnd().PadLeft(15, '0');
            string dataNascimento = DadosInadimplencia.DataNascimento;
            string nomePai = DadosInadimplencia.NomePai.ToUpper().PadRight(70, ' ');
            string nomeMae = DadosInadimplencia.NomeMae.ToUpper().PadRight(70, ' ');
            string numeroContrato = DadosInadimplencia.NumeroContrato;
            string numeroPrestacao = DadosInadimplencia.NumeroPrestacao.Trim();
            numeroContrato = (numeroContrato + "-" + numeroPrestacao).PadRight(16, ' ');
            string valorContratado = DadosInadimplencia.ValorContratado.ToString().PadLeft(15, '0');
            string dataCredito = DadosInadimplencia.DataCredito;
            string formaPagamento = DadosInadimplencia.FormaPagamento.PadRight(3, ' ');

            string endereco = DadosInadimplencia.Endereco.TrimEnd().PadRight(45, ' ').Substring(0, 45);
            string bairro = DadosInadimplencia.Bairro.PadRight(20, ' ');
            if (!string.IsNullOrEmpty(DadosInadimplencia.Bairro))
            {
                if (DadosInadimplencia.Bairro.Length > 20)
                    bairro = DadosInadimplencia.Bairro.Substring(0, 20);
            }
            string cidade = DadosInadimplencia.Cidade.PadRight(25, ' ');
            if (!string.IsNullOrEmpty(DadosInadimplencia.Cidade))
            {
                if (DadosInadimplencia.Cidade.Length > 25)
                    cidade = DadosInadimplencia.Cidade.Substring(0, 25);
            }

            string UF = DadosInadimplencia.UF.TrimEnd().PadRight(2, ' ');
            string CEP = DadosInadimplencia.CEP.PadRight(8, ' ');
            string DDD = DadosInadimplencia.DDD.Trim().PadRight(4, ' ');
            string telefone = DadosInadimplencia.Telefone;

            string dataPrestacaoVencida = String.Format("{0:yyyyMMdd}", DadosInadimplencia.DataInadimplencia);
            string saldoInadimplencia = (DadosInadimplencia.SaldoInadimplencia * 100).ToString().PadLeft(15, '0');
            string sequencial = Sequencial.ToString().PadLeft(7, '0');
            string motivoBaixa = ""; //preencher

            //Constantes
            string campo1 = "1";
            string campo2 = "I"; // incluir if para campo 2
            string campo3 = "000190";
            string campo7 = "BSB".PadRight(4, ' ');
            string campo8 = "F";
            string campo9 = "2";
            string campo12 = string.Empty.PadRight(1, ' ');
            string campo13 = string.Empty.PadRight(15, ' ');
            string campo14 = string.Empty.PadRight(2, ' ');
            string campo15 = string.Empty.PadRight(1, ' ');
            string campo16 = string.Empty.PadRight(1, ' ');
            string campo17 = string.Empty.PadRight(15, ' ');
            string campo18 = string.Empty.PadRight(2, ' ');
            string campo19 = string.Empty.PadRight(1, ' ');
            string campo20 = string.Empty.PadRight(15, ' ');
            string campo21 = string.Empty.PadRight(2, ' ');
            string campo33 = string.Empty.PadRight(9, ' ');
            string campo39 = string.Empty.PadRight(6, ' ');
            string campo40 = string.Empty.PadRight(1, ' ');
            string campo41 = string.Empty.PadRight(2, ' ');
            string campo42 = string.Empty.PadRight(60, ' ');
            string campo34 = "";

            if (campo2 == "E")
                motivoBaixa = "descobrir valor";
            else
                motivoBaixa = string.Empty.PadRight(2, ' ');
            //--------------------------------------------------------------
            if (!string.IsNullOrEmpty(dataNascimento))
            {
                TimeSpan diferencaDias = DateTime.Now.Date - Convert.ToDateTime(dataNascimento).Date;
                if ((diferencaDias.Days / 365.25) >= 18)
                    dataNascParticipante = Convert.ToDateTime(dataNascimento).Date.ToString("yyyyMMdd");
                else
                    dataNascParticipante = string.Empty.PadRight(8, '0');
            }
            else 
            {
                dataNascParticipante = string.Empty.PadRight(8, '0');
            }
            //--------------------------------------------------------------
            if (DadosInadimplencia.Endereco.TrimEnd().Length > 45)
                campo34 = DadosInadimplencia.Endereco.TrimEnd().Substring(0, 25);
            else
                campo34 = string.Empty.PadRight(25, ' ');
            if (!string.IsNullOrEmpty(DadosInadimplencia.Telefone))
            {
                if (DadosInadimplencia.Telefone.Substring(0, 1) == "0")
                {
                    telefone = DadosInadimplencia.Telefone.Substring(3, DadosInadimplencia.Telefone.Length - 3);
                }
                else if (DadosInadimplencia.Telefone.Length == 10)
                {
                    telefone = DadosInadimplencia.Telefone.Substring(2, DadosInadimplencia.Telefone.Length - 2);
                }
                else
                {
                    telefone = DadosInadimplencia.Telefone;
                }
            }
            telefone = telefone.PadRight(9, ' ');

            linhaBody = campo1 + campo2 + campo3 + dataPrestacaoVencida + dataPrestacaoVencida +
                            formaPagamento + campo7 + campo8 + campo9 + numCPF +
                            motivoBaixa + campo12 + campo13 + campo14 + campo15 +
                            campo16 + campo17 + campo18 + campo19 + campo20 +
                            campo21 + nomeParticipante + dataNascParticipante + nomePai + nomeMae +
                            endereco + bairro + cidade + UF + CEP +
                            saldoInadimplencia + numeroContrato + campo33 + campo34 + DDD +
                            telefone + dataCredito + valorContratado + campo39 + campo40 +
                            campo41 + campo42 + sequencial;

            return linhaBody;
        }

        private string MontaTrailerArquivoSerasa(int Sequencial)
        {
            Tipos.Serasa trailer = new Tipos.Serasa();

            string campo1 = "9";
            string campo2 = string.Empty.PadRight(592, ' ');
            string sequencial = Sequencial.ToString().PadLeft(7, '0');

            string linhaTrailer = campo1 + campo2 + sequencial;

            return linhaTrailer;
        }

        protected void gridContrato_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                if (string.IsNullOrEmpty(lblTotalRegistros.Text))
                    lblTotalRegistros.Text = "Total de registros: " + gridContrato.Rows.Count.ToString();

                //e.Row.Cells[8].Text = "Total de registros";
                //e.Row.Cells[9].Text = gridContrato.Rows.Count.ToString();
            }
        }

        private bool  VerificarPreenchimentoCampos()
        {
            if (string.IsNullOrEmpty(txtDataInicial.Text))            
                return false;            

            if (string.IsNullOrEmpty(txtNomeResposavel.Text))           
                return false;
            
            if (string.IsNullOrEmpty(txtLogonSerasa.Text))
                return false;
       
            if (string.IsNullOrEmpty(txtNumRemessa.Text))   
                return false;
   
            if (string.IsNullOrEmpty(txtNumTelefone.Text))   
                return false;     
            
            return true;
        }
    }
}
